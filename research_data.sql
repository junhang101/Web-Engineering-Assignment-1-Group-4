-- ============================================
-- 1. Insert default research statuses
-- ============================================

INSERT INTO research_status (status_name)
VALUES
    ('In Progress'),
    ('Completed - KPI Achieved'),
    ('Completed - KPI Not Achieved');

INSERT INTO grant_type (grant_type_name)
VALUES
    ('Fakulti'),
    ('Universiti <= RM 10,000'),
    ('Universiti > RM 10,000'),
    ('INTENSIFICATION OF RESEARCH IN PRIORITY AREAS'),
    ('AGENSI LUAR (DALAM NEGARA) SWASTA');

INSERT INTO department (department_name)
VALUES
    ('Computer Science'),
    ('Information Technology'),
    ('Software Engineering'),
    ('Information Systems'),
    ('Artificial Intelligence');

INSERT INTO research_area (area_name)
VALUES
    ('Artificial Intelligence'),
    ('Mobile Application Development'),
    ('Cybersecurity'),
    ('Internet of Things'),
    ('Blockchain Technology'),
    ('User Experience'),
    ('Natural Language Processing'),
    ('Cloud Computing'),
    ('Financial Management Systems'),
    ('Software Testing');

INSERT INTO staff (
    staff_no,
    staff_name,
    staff_email,
    department_id,
    position
)
VALUES
    (3011, 'DR. AHMAD HAKIM BIN ISMAIL',
     'ahmad.hakim@example.com', 1, 'Lecturer'),

    (3012, 'DR. NURUL AIN BINTI HASSAN',
     'nurul.ain@example.com', 2, 'Lecturer'),

    (3013, 'PROF. MADYA DR. FARID BIN OTHMAN',
     'farid.othman@example.com', 3, 'Associate Professor'),

    (3014, 'DR. SITI AMINAH BINTI RAHMAN',
     'siti.aminah@example.com', 4, 'Lecturer'),

    (3015, 'DR. MOHD HAFIZ BIN ZAKARIA',
     'mohd.hafiz@example.com', 5, 'Lecturer'),

    (3016, 'DR. NORAZLINA BINTI YUSOF',
     'norazlina@example.com', 2, 'Lecturer'),

    (3017, 'DR. AZMAN BIN IBRAHIM',
     'azman.ibrahim@example.com', 1, 'Lecturer'),

    (3018, 'PROF. MADYA DR. KAMAL BIN ABDULLAH',
     'kamal.abdullah@example.com', 3, 'Associate Professor'),

    (3019, 'DR. FARAH NADIA BINTI OMAR',
     'farah.nadia@example.com', 4, 'Lecturer'),

    (3020, 'DR. MUHAMMAD FIRDAUS BIN SALLEH',
     'muhammad.firdaus@example.com', 5, 'Lecturer');



INSERT INTO research_project (
    so_code,
    grant_type_id,
    staff_no,
    research_area_id,
    status_id,
    research_title,
    start_date,
    expected_date,
    end_date,
    created_at,
    updated_at,
    detail,
    project_priority
)
VALUES
    (
        14501,
        (SELECT grant_type_id FROM grant_type WHERE grant_type_name = 'Fakulti'),
        3011,
        (SELECT research_area_id FROM research_area WHERE area_name = 'Artificial Intelligence'),
        (SELECT status_id FROM research_status WHERE status_name = 'In Progress'),
        'ARTIFICIAL INTELLIGENCE-BASED STUDENT PERFORMANCE PREDICTION SYSTEM',
        '2022-01-01',
        '2022-12-31',
        '2022-12-15',
        '2022-01-05 09:00:00',
        '2022-12-20 10:00:00',
        'Develop an AI-based system to predict student academic performance.',
        'High'
    ),
    (
        14502,
        (SELECT grant_type_id FROM grant_type WHERE grant_type_name = 'Universiti <= RM 10,000'),
        3012,
        (SELECT research_area_id FROM research_area WHERE area_name = 'Mobile Application Development'),
        (SELECT status_id FROM research_status WHERE status_name = 'In Progress'),
        'DEVELOPMENT OF MOBILE APPLICATION FOR UNIVERSITY STUDENT ATTENDANCE MANAGEMENT',
        '2022-03-01',
        '2023-02-28',
        '2023-02-20',
        '2022-03-05 10:00:00',
        '2023-02-25 14:00:00',
        'Develop a mobile application for managing university student attendance.',
        'Medium'
    ),
    (
        14503,
        (SELECT grant_type_id FROM grant_type WHERE grant_type_name = 'Universiti > RM 10,000'),
        3013,
        (SELECT research_area_id FROM research_area WHERE area_name = 'Cybersecurity'),
        (SELECT status_id FROM research_status WHERE status_name = 'In Progress'),
        'MACHINE LEARNING APPROACH FOR EARLY DETECTION OF CYBERSECURITY THREATS',
        '2022-06-01',
        '2024-05-31',
        '2024-05-15',
        '2022-06-10 09:30:00',
        '2024-05-20 11:00:00',
        'Investigate machine learning techniques for early cybersecurity threat detection.',
        'High'
    ),
    (
        14504,
        (SELECT grant_type_id FROM grant_type WHERE grant_type_name = 'INTENSIFICATION OF RESEARCH IN PRIORITY AREAS'),
        3014,
        (SELECT research_area_id FROM research_area WHERE area_name = 'Internet of Things'),
        (SELECT status_id FROM research_status WHERE status_name = 'In Progress'),
        'SMART AGRICULTURE MONITORING SYSTEM USING INTERNET OF THINGS TECHNOLOGY',
        '2023-01-01',
        '2024-12-31',
        '2024-11-30',
        '2023-01-10 08:30:00',
        '2024-12-05 16:00:00',
        'Develop an IoT-based monitoring system for smart agriculture.',
        'High'
    ),
    (
        14505,
        (SELECT grant_type_id FROM grant_type WHERE grant_type_name = 'AGENSI LUAR (DALAM NEGARA) SWASTA'),
        3015,
        (SELECT research_area_id FROM research_area WHERE area_name = 'Blockchain Technology'),
        (SELECT status_id FROM research_status WHERE status_name = 'In Progress'),
        'BLOCKCHAIN-BASED DIGITAL CERTIFICATE VERIFICATION SYSTEM FOR HIGHER EDUCATION',
        '2023-04-01',
        '2024-03-31',
        '2024-03-20',
        '2023-04-05 09:00:00',
        '2024-03-25 15:00:00',
        'Develop a blockchain-based system to verify digital academic certificates.',
        'Medium'
    ),
    (
        14506,
        (SELECT grant_type_id FROM grant_type WHERE grant_type_name = 'Fakulti'),
        3016,
        (SELECT research_area_id FROM research_area WHERE area_name = 'User Experience'),
        (SELECT status_id FROM research_status WHERE status_name = 'In Progress'),
        'USER EXPERIENCE EVALUATION OF ONLINE LEARNING PLATFORMS AMONG UNIVERSITY STUDENTS',
        '2023-07-01',
        '2024-06-30',
        '2024-06-15',
        '2023-07-05 10:00:00',
        '2024-06-20 14:30:00',
        'Evaluate the usability and user experience of online learning platforms.',
        'Low'
    ),
    (
        14507,
        (SELECT grant_type_id FROM grant_type WHERE grant_type_name = 'Universiti <= RM 10,000'),
        3017,
        (SELECT research_area_id FROM research_area WHERE area_name = 'Natural Language Processing'),
        (SELECT status_id FROM research_status WHERE status_name = 'In Progress'),
        'SENTIMENT ANALYSIS OF SOCIAL MEDIA CONTENT USING NATURAL LANGUAGE PROCESSING',
        '2024-01-01',
        '2024-12-31',
        '2024-12-20',
        '2024-01-08 09:00:00',
        '2024-12-23 10:00:00',
        'Apply NLP techniques to analyse sentiment in social media content.',
        'Medium'
    ),
    (
        14508,
        (SELECT grant_type_id FROM grant_type WHERE grant_type_name = 'Universiti > RM 10,000'),
        3018,
        (SELECT research_area_id FROM research_area WHERE area_name = 'Cloud Computing'),
        (SELECT status_id FROM research_status WHERE status_name = 'In Progress'),
        'CLOUD-BASED MICROSERVICES ARCHITECTURE FOR UNIVERSITY INFORMATION SYSTEMS',
        '2024-03-01',
        '2026-02-28',
        NULL,
        '2024-03-05 09:00:00',
        '2026-03-15 10:00:00',
        'Design a cloud-based microservices architecture for university information systems.',
        'High'
    ),
    (
        14509,
        (SELECT grant_type_id FROM grant_type WHERE grant_type_name = 'AGENSI LUAR (DALAM NEGARA) SWASTA'),
        3019,
        (SELECT research_area_id FROM research_area WHERE area_name = 'Financial Management Systems'),
        (SELECT status_id FROM research_status WHERE status_name = 'In Progress'),
        'DEVELOPMENT OF AN INTELLIGENT FINANCIAL MANAGEMENT SYSTEM FOR SMALL ENTERPRISES',
        '2025-06-01',
        '2027-05-31',
        NULL,
        '2025-06-10 10:00:00',
        '2026-08-01 11:00:00',
        'Develop an intelligent financial management system for small enterprises.',
        'Medium'
    ),
    (
        14510,
        (SELECT grant_type_id FROM grant_type WHERE grant_type_name = 'INTENSIFICATION OF RESEARCH IN PRIORITY AREAS'),
        3020,
        (SELECT research_area_id FROM research_area WHERE area_name = 'Software Testing'),
        (SELECT status_id FROM research_status WHERE status_name = 'In Progress'),
        'GENERATIVE ARTIFICIAL INTELLIGENCE FOR AUTOMATED SOFTWARE TESTING AND QUALITY ASSURANCE',
        '2026-01-01',
        '2027-12-31',
        NULL,
        '2026-01-05 09:00:00',
        '2026-09-15 14:00:00',
        'Investigate generative AI techniques for automated software testing and quality assurance.',
        'High'
    );

-- example to update end date
UPDATE research_project
SET end_date = '2026-08-01'
WHERE so_code = 14509;

-- insert a new data with all new information
INSERT INTO grant_type (grant_type_name)
VALUES ('Industry Collaboration Grant');

INSERT INTO department (department_name)
VALUES ('Data Science');

INSERT INTO staff (
    staff_no,
    staff_name,
    staff_email,
    department_id,
    position
)
VALUES (
           3021,
           'DR. TAN WEI MING',
           'tanweiming@example.com',
           (SELECT department_id
            FROM department
            WHERE department_name = 'Data Science'),
           'Senior Lecturer'
       );

INSERT INTO research_area (area_name)
VALUES ('Data Science')
ON CONFLICT (area_name) DO NOTHING;

INSERT INTO research_project (
    so_code,
    grant_type_id,
    staff_no,
    research_area_id,
    status_id,
    research_title,
    start_date,
    expected_date,
    end_date,
    detail,
    project_priority
)
VALUES (
           14511,
           (SELECT grant_type_id
            FROM grant_type
            WHERE grant_type_name = 'Industry Collaboration Grant'),
           3021,
           (SELECT research_area_id
            FROM research_area
            WHERE area_name = 'Data Science'),
           (SELECT status_id
            FROM research_status
            WHERE status_name = 'In Progress'),
           'DATA SCIENCE APPROACH FOR UNIVERSITY STUDENT PERFORMANCE ANALYSIS',
           '2026-10-01',
           '2028-09-30',
           NULL,
           'Analyse university student performance using data science techniques.',
           'High'
       );