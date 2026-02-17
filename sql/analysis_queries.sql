-- Total appointments
SELECT COUNT(*) AS total_appointments
FROM appointments;

-- No-show count
SELECT COUNT(*) AS no_show_count
FROM appointments
WHERE No_show = 'Yes';

-- No-show rate
SELECT 
    ROUND(
        SUM(CASE WHEN No_show = 'Yes' THEN 1 ELSE 0 END) * 100.0 
        / COUNT(*), 2
    ) AS no_show_rate_percent
FROM appointments;

-- No-show by gender
SELECT 
    Gender,
    COUNT(*) AS total_appointments,
    SUM(CASE WHEN No_show = 'Yes' THEN 1 ELSE 0 END) AS no_show_count
FROM appointments
GROUP BY Gender;

-- No-show by SMS received
SELECT 
    SMS_received,
    COUNT(*) AS total,
    SUM(CASE WHEN No_show = 'Yes' THEN 1 ELSE 0 END) AS no_show_count
FROM appointments
GROUP BY SMS_received;

-- No-show by age group
SELECT 
    CASE
        WHEN Age < 18 THEN 'Child'
        WHEN Age BETWEEN 18 AND 35 THEN 'Young Adult'
        WHEN Age BETWEEN 36 AND 60 THEN 'Adult'
        ELSE 'Senior'
    END AS age_group,
    COUNT(*) AS total,
    SUM(CASE WHEN No_show = 'Yes' THEN 1 ELSE 0 END) AS no_show_count
FROM appointments
GROUP BY age_group;