-- 1. Create GRANT_TYPE table
CREATE TABLE grant_type (
                            grant_type_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                            grant_type_name VARCHAR(100) NOT NULL UNIQUE
);

-- 2. Create DEPARTMENT table
CREATE TABLE department (
                            department_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                            department_name VARCHAR(150) NOT NULL UNIQUE
);

-- 3. Create STAFF table
CREATE TABLE staff (
                       staff_no INTEGER PRIMARY KEY,
                       staff_name VARCHAR(150) NOT NULL,
                       staff_email VARCHAR(150) UNIQUE,
                       department_id INTEGER,
                       position VARCHAR(100),

                       CONSTRAINT fk_staff_department
                           FOREIGN KEY (department_id)
                               REFERENCES department(department_id)
);

-- 4. Create RESEARCH_AREA table
CREATE TABLE research_area (
                               research_area_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                               area_name VARCHAR(150) NOT NULL UNIQUE
);

-- 5. Create RESEARCH_STATUS table
CREATE TABLE research_status (
                                 status_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                                 status_name VARCHAR(100) NOT NULL UNIQUE
);

-- 6. Create RESEARCH_PROJECT table
CREATE TABLE research_project (
                                  so_code INTEGER PRIMARY KEY,

                                  grant_type_id INTEGER NOT NULL,
                                  staff_no INTEGER NOT NULL,
                                  research_area_id INTEGER NOT NULL,
                                  status_id INTEGER NOT NULL,

                                  research_title VARCHAR(255) NOT NULL,

                                  start_date DATE NOT NULL,
                                  expected_date DATE NOT NULL,
                                  end_date DATE,

                                  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                  updated_at TIMESTAMP NOT NULL,

                                  detail TEXT,

                                  project_priority VARCHAR(20)
                                      CHECK (project_priority IN ('High', 'Medium', 'Low')),

                                  CONSTRAINT fk_project_grant_type
                                      FOREIGN KEY (grant_type_id)
                                          REFERENCES grant_type(grant_type_id),

                                  CONSTRAINT fk_project_staff
                                      FOREIGN KEY (staff_no)
                                          REFERENCES staff(staff_no),

                                  CONSTRAINT fk_project_research_area
                                      FOREIGN KEY (research_area_id)
                                          REFERENCES research_area(research_area_id),

                                  CONSTRAINT fk_project_status
                                      FOREIGN KEY (status_id)
                                          REFERENCES research_status(status_id),

                                  CONSTRAINT chk_project_dates
                                      CHECK (expected_date >= start_date),

                                  CONSTRAINT chk_project_end_date
                                      CHECK (end_date IS NULL OR end_date >= start_date)
);

-- ============================================
-- 7. Function: Automatically determine project status
-- ============================================
-- This function focuses on when the user does not enter an end date, the project status will automatically be set to In Progress.
-- If the user enters an end data that is between the start date and expected data, the status will set to KPI Achieved.
-- If the user enters an end data that after the expected data, the status will set to KPI Not Achieved.
CREATE OR REPLACE FUNCTION update_research_status()
    RETURNS TRIGGER AS $$
BEGIN
    IF NEW.end_date IS NULL THEN

        SELECT status_id
        INTO NEW.status_id
        FROM research_status
        WHERE status_name = 'In Progress';

    ELSIF NEW.end_date <= NEW.expected_date THEN

        SELECT status_id
        INTO NEW.status_id
        FROM research_status
        WHERE status_name = 'Completed - KPI Achieved';

    ELSE

        SELECT status_id
        INTO NEW.status_id
        FROM research_status
        WHERE status_name = 'Completed - KPI Not Achieved';

    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- 8. Trigger: Update status on insert or date changes
-- this trigger is to make sure that when user insert a new research project
-- or update either start date, end date or expected data,
-- the research status will be recalculated based on the project's end date and expected date..
CREATE TRIGGER research_status_trigger
    BEFORE INSERT OR UPDATE OF start_date, expected_date, end_date
    ON research_project
    FOR EACH ROW
EXECUTE FUNCTION update_research_status();

-- ============================================
-- 9. Function: Manage created_at and updated_at
-- ============================================
-- This function is to manage the time when the user insert the research.
-- When a new project is inserted, created_at uses the current timestamp if no value is provided,
-- and updated_at is set to the same value as created_at.
-- When an existing project is updated, created_at remains unchanged,
-- while updated_at records the latest modification time.

CREATE OR REPLACE FUNCTION manage_research_timestamps()
    RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        NEW.created_at := COALESCE(
                NEW.created_at,
                CURRENT_TIMESTAMP
                          );

        NEW.updated_at := COALESCE(
                NEW.updated_at,
                NEW.created_at
                          );

    ELSIF TG_OP = 'UPDATE' THEN
        NEW.created_at := OLD.created_at;
        NEW.updated_at := CURRENT_TIMESTAMP;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- ============================================
-- 10. Trigger: Automatically Manage Timestamps
-- ============================================
-- This trigger executes before a new research project is inserted or an existing project is updated.
-- When a new project is inserted, updated_at is set to the same value as created_at.
-- When an existing project is updated, updated_at is refreshed while created_at remains unchanged.
CREATE TRIGGER research_project_timestamps
    BEFORE INSERT OR UPDATE
    ON research_project
    FOR EACH ROW
EXECUTE FUNCTION manage_research_timestamps();