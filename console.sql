
SELECT
    rp.so_code,
    gt.grant_type_name,
    rp.research_title,
    rp.start_date,
    rp.expected_date,
    rp.end_date,
    rs.status_name AS research_status,
    rp.detail,
    s.staff_no,
    s.staff_name,
    ra.area_name AS research_area,
    rp.project_priority,
    rp.created_at,
    rp.updated_at
FROM research_project rp
         JOIN grant_type gt
              ON rp.grant_type_id = gt.grant_type_id
         JOIN staff s
              ON rp.staff_no = s.staff_no
         JOIN research_area ra
              ON rp.research_area_id = ra.research_area_id
         JOIN research_status rs
              ON rp.status_id = rs.status_id
ORDER BY rp.so_code;
