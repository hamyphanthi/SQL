SELECT TOP 10 *
FROM diem_thi_thpt_2024




------ subjects
SELECT 
    'math' AS subject, 
    AVG(toan) AS average_point, 
    COUNT(CASE WHEN toan = 10 THEN 1 END) AS count_10,
    COUNT(CASE WHEN toan = 0 THEN 1 END) AS count_0,
    COUNT(CASE WHEN toan <= 1 THEN 1 END) AS diem_liet,
    COUNT(CASE WHEN toan < 5 THEN 1 END) AS count_below_5
FROM diem_thi_thpt_2024
UNION ALL
SELECT 
    'literature', 
    AVG(ngu_van) AS average_point, 
    COUNT(CASE WHEN ngu_van = 10 THEN 1 END),
    COUNT(CASE WHEN ngu_van = 0 THEN 1 END),
    COUNT(CASE WHEN ngu_van <= 1 THEN 1 END) AS diem_liet,
    COUNT(CASE WHEN ngu_van < 5 THEN 1 END) AS count_below_5
FROM diem_thi_thpt_2024
UNION ALL
SELECT 
    'language', 
    AVG(ngoai_ngu) AS average_point,
    COUNT(CASE WHEN ngoai_ngu = 10 THEN 1 END),
    COUNT(CASE WHEN ngoai_ngu = 0 THEN 1 END),
    COUNT(CASE WHEN ngoai_ngu <= 1 THEN 1 END) AS diem_liet,
    COUNT(CASE WHEN ngoai_ngu < 5 THEN 1 END) AS count_below_5
FROM diem_thi_thpt_2024
UNION ALL
SELECT 
    'physics', 
    AVG(vat_li) AS average_point,
    COUNT(CASE WHEN vat_li = 10 THEN 1 END),
    COUNT(CASE WHEN vat_li = 0 THEN 1 END),
    COUNT(CASE WHEN vat_li <= 1 THEN 1 END) AS diem_liet,
    COUNT(CASE WHEN vat_li < 5 THEN 1 END) AS count_below_5
FROM diem_thi_thpt_2024
UNION ALL
SELECT 
    'chemistry', 
    AVG(hoa_hoc) AS average_point,
    COUNT(CASE WHEN hoa_hoc = 10 THEN 1 END),
    COUNT(CASE WHEN hoa_hoc = 0 THEN 1 END),
    COUNT(CASE WHEN hoa_hoc <= 1 THEN 1 END) AS diem_liet,
    COUNT(CASE WHEN hoa_hoc < 5 THEN 1 END) AS count_below_5
FROM diem_thi_thpt_2024
UNION ALL
SELECT 
    'biology', 
    AVG(sinh_hoc) AS average_point,
    COUNT(CASE WHEN sinh_hoc = 10 THEN 1 END),
    COUNT(CASE WHEN sinh_hoc = 0 THEN 1 END),
    COUNT(CASE WHEN sinh_hoc <= 1 THEN 1 END) AS diem_liet,
    COUNT(CASE WHEN sinh_hoc < 5 THEN 1 END) AS count_below_5
FROM diem_thi_thpt_2024
UNION ALL
SELECT 
    'history', 
    AVG(lich_su) AS average_point,
    COUNT(CASE WHEN lich_su = 10 THEN 1 END),
    COUNT(CASE WHEN lich_su = 0 THEN 1 END),
    COUNT(CASE WHEN lich_su <= 1 THEN 1 END) AS diem_liet,
    COUNT(CASE WHEN lich_su < 5 THEN 1 END) AS count_below_5
FROM diem_thi_thpt_2024
UNION ALL
SELECT 
    'geography', 
    AVG(dia_li) AS average_point,
    COUNT(CASE WHEN dia_li = 10 THEN 1 END),
    COUNT(CASE WHEN dia_li = 0 THEN 1 END),
    COUNT(CASE WHEN dia_li <= 1 THEN 1 END) AS diem_liet,
    COUNT(CASE WHEN dia_li < 5 THEN 1 END) AS count_below_5
FROM diem_thi_thpt_2024
UNION ALL
SELECT 
    'GDCD', 
    AVG(gdcd) AS average_point,
    COUNT(CASE WHEN gdcd = 10 THEN 1 END),
    COUNT(CASE WHEN gdcd = 0 THEN 1 END),
    COUNT(CASE WHEN gdcd <= 1 THEN 1 END) AS diem_liet,
    COUNT(CASE WHEN gdcd < 5 THEN 1 END) AS count_below_5
FROM diem_thi_thpt_2024;



-----


----- the point that most students get at each subject
WITH total_students AS (
    SELECT COUNT(*) AS total
    FROM diem_thi_thpt_2024
),
highest_scores AS (
    SELECT 'math' AS subject, toan AS score, COUNT(*) AS count_students
    FROM diem_thi_thpt_2024
    WHERE toan IS NOT NULL
    GROUP BY toan
    HAVING COUNT(*) = (
        SELECT MAX(count_students)
        FROM (
            SELECT COUNT(*) AS count_students
            FROM diem_thi_thpt_2024
            WHERE toan IS NOT NULL
            GROUP BY toan
        ) AS subquery
    )
    UNION ALL
    SELECT 'literature' AS subject, ngu_van AS score, COUNT(*) AS count_students
    FROM diem_thi_thpt_2024
    WHERE ngu_van IS NOT NULL
    GROUP BY ngu_van
    HAVING COUNT(*) = (
        SELECT MAX(count_students)
        FROM (
            SELECT COUNT(*) AS count_students
            FROM diem_thi_thpt_2024
            WHERE ngu_van IS NOT NULL
            GROUP BY ngu_van
        ) AS subquery
    )
    UNION ALL
    SELECT 'language' AS subject, ngoai_ngu AS score, COUNT(*) AS count_students
    FROM diem_thi_thpt_2024
    WHERE ngoai_ngu IS NOT NULL
    GROUP BY ngoai_ngu
    HAVING COUNT(*) = (
        SELECT MAX(count_students)
        FROM (
            SELECT COUNT(*) AS count_students
            FROM diem_thi_thpt_2024
            WHERE ngoai_ngu IS NOT NULL
            GROUP BY ngoai_ngu
        ) AS subquery
    )
    UNION ALL
    SELECT 'physics' AS subject, vat_li AS score, COUNT(*) AS count_students
    FROM diem_thi_thpt_2024
    WHERE vat_li IS NOT NULL
    GROUP BY vat_li
    HAVING COUNT(*) = (
        SELECT MAX(count_students)
        FROM (
            SELECT COUNT(*) AS count_students
            FROM diem_thi_thpt_2024
            WHERE vat_li IS NOT NULL
            GROUP BY vat_li
        ) AS subquery
    )
    UNION ALL
    SELECT 'chemistry' AS subject, hoa_hoc AS score, COUNT(*) AS count_students
    FROM diem_thi_thpt_2024
    WHERE hoa_hoc IS NOT NULL
    GROUP BY hoa_hoc
    HAVING COUNT(*) = (
        SELECT MAX(count_students)
        FROM (
            SELECT COUNT(*) AS count_students
            FROM diem_thi_thpt_2024
            WHERE hoa_hoc IS NOT NULL
            GROUP BY hoa_hoc
        ) AS subquery
    )
    UNION ALL
    SELECT 'biology' AS subject, sinh_hoc AS score, COUNT(*) AS count_students
    FROM diem_thi_thpt_2024
    WHERE sinh_hoc IS NOT NULL
    GROUP BY sinh_hoc
    HAVING COUNT(*) = (
        SELECT MAX(count_students)
        FROM (
            SELECT COUNT(*) AS count_students
            FROM diem_thi_thpt_2024
            WHERE sinh_hoc IS NOT NULL
            GROUP BY sinh_hoc
        ) AS subquery
    )
    UNION ALL
    SELECT 'history' AS subject, lich_su AS score, COUNT(*) AS count_students
    FROM diem_thi_thpt_2024
    WHERE lich_su IS NOT NULL
    GROUP BY lich_su
    HAVING COUNT(*) = (
        SELECT MAX(count_students)
        FROM (
            SELECT COUNT(*) AS count_students
            FROM diem_thi_thpt_2024
            WHERE lich_su IS NOT NULL
            GROUP BY lich_su
        ) AS subquery
    )
    UNION ALL
    SELECT 'geography' AS subject, dia_li AS score, COUNT(*) AS count_students
    FROM diem_thi_thpt_2024
    WHERE dia_li IS NOT NULL
    GROUP BY dia_li
    HAVING COUNT(*) = (
        SELECT MAX(count_students)
        FROM (
            SELECT COUNT(*) AS count_students
            FROM diem_thi_thpt_2024
            WHERE dia_li IS NOT NULL
            GROUP BY dia_li
        ) AS subquery
    )
    UNION ALL
    SELECT 'GDCD' AS subject, gdcd AS score, COUNT(*) AS count_students
    FROM diem_thi_thpt_2024
    WHERE gdcd IS NOT NULL
    GROUP BY gdcd
    HAVING COUNT(*) = (
        SELECT MAX(count_students)
        FROM (
            SELECT COUNT(*) AS count_students
            FROM diem_thi_thpt_2024
            WHERE gdcd IS NOT NULL
            GROUP BY gdcd
        ) AS subquery
    )
)

SELECT 
    hs.subject, 
    hs.score, 
    hs.count_students,
    (hs.count_students * 100.0 / ts.total) AS pct_students
FROM highest_scores hs, total_students ts;








------------điểm trung bình từng khối
WITH classified_scores AS (
    SELECT *,
        CASE 
            WHEN toan IS NOT NULL AND (vat_li IS NOT NULL OR hoa_hoc IS NOT NULL) THEN 'A'
            WHEN toan IS NOT NULL AND sinh_hoc IS NOT NULL THEN 'B'
            WHEN ngu_van IS NOT NULL AND (lich_su IS NOT NULL OR dia_li IS NOT NULL) THEN 'C'
            WHEN ngu_van IS NOT NULL AND (ngoai_ngu IS NOT NULL OR (vat_li IS NOT NULL AND hoa_hoc IS NOT NULL)) THEN 'D'
            ELSE 'Others'
        END AS khoi
    FROM diem_thi_thpt_2024
) 
SELECT 
    khoi,
    AVG(ISNULL(toan, 0)) AS avg_math,
    AVG(ISNULL(vat_li, 0)) AS avg_physics,
    AVG(ISNULL(hoa_hoc, 0)) AS avg_chemistry,
    AVG(ISNULL(sinh_hoc, 0)) AS avg_biology,
    AVG(ISNULL(lich_su, 0)) AS avg_history,
    AVG(ISNULL(dia_li, 0)) AS avg_geography,
    AVG(ISNULL(ngu_van, 0)) AS avg_literature,
    AVG(ISNULL(ngoai_ngu, 0)) AS avg_language,
    COUNT(*) AS total_students,
    AVG(ISNULL(toan, 0) + ISNULL(vat_li, 0) + ISNULL(hoa_hoc, 0) + 
        ISNULL(sinh_hoc, 0) + ISNULL(lich_su, 0) + ISNULL(dia_li, 0) + 
        ISNULL(ngu_van, 0) + ISNULL(ngoai_ngu, 0)) AS avg_total_score
FROM classified_scores
GROUP BY khoi;

-------------tổng điểm cao nhất và thấp nhất với từng khối
WITH classified_scores AS (
    SELECT *,
        CASE 
            WHEN toan IS NOT NULL AND (vat_li IS NOT NULL OR hoa_hoc IS NOT NULL) THEN 'A'
            WHEN toan IS NOT NULL AND sinh_hoc IS NOT NULL THEN 'B'
            WHEN ngu_van IS NOT NULL AND (lich_su IS NOT NULL OR dia_li IS NOT NULL) THEN 'C'
            WHEN ngu_van IS NOT NULL AND (ngoai_ngu IS NOT NULL OR (vat_li IS NOT NULL AND hoa_hoc IS NOT NULL)) THEN 'D'
            ELSE 'Others'
        END AS khoi
    FROM diem_thi_thpt_2024
)
SELECT 
    khoi,
    MAX(ISNULL(toan, 0)) AS max_math,
    MIN(ISNULL(toan, 0)) AS min_math,
    MAX(ISNULL(vat_li, 0)) AS max_physics,
    MIN(ISNULL(vat_li, 0)) AS min_physics,
    MAX(ISNULL(hoa_hoc, 0)) AS max_chemistry,
    MIN(ISNULL(hoa_hoc, 0)) AS min_chemistry,
    MAX(ISNULL(sinh_hoc, 0)) AS max_biology,
    MIN(ISNULL(sinh_hoc, 0)) AS min_biology,
    MAX(ISNULL(lich_su, 0)) AS max_history,
    MIN(ISNULL(lich_su, 0)) AS min_history,
    MAX(ISNULL(dia_li, 0)) AS max_geography,
    MIN(ISNULL(dia_li, 0)) AS min_geography,
    MAX(ISNULL(ngu_van, 0)) AS max_literature,
    MIN(ISNULL(ngu_van, 0)) AS min_literature,
    MAX(ISNULL(ngoai_ngu, 0)) AS max_language,
    MIN(ISNULL(ngoai_ngu, 0)) AS min_language,
    MAX(ISNULL(toan, 0) + ISNULL(vat_li, 0) + ISNULL(hoa_hoc, 0) + 
        ISNULL(sinh_hoc, 0) + ISNULL(lich_su, 0) + ISNULL(dia_li, 0) + 
        ISNULL(ngu_van, 0) + ISNULL(ngoai_ngu, 0)) AS max_total_score,
    MIN(ISNULL(toan, 0) + ISNULL(vat_li, 0) + ISNULL(hoa_hoc, 0) + 
        ISNULL(sinh_hoc, 0) + ISNULL(lich_su, 0) + ISNULL(dia_li, 0) + 
        ISNULL(ngu_van, 0) + ISNULL(ngoai_ngu, 0)) AS min_total_score
FROM classified_scores
GROUP BY khoi;



------ khối nào có điểm trung bình cao nhất/thấp nhất ở từng môn

WITH classified_scores AS (
    SELECT *,
        CASE 
            WHEN toan IS NOT NULL AND (vat_li IS NOT NULL OR hoa_hoc IS NOT NULL) THEN 'A'
            WHEN toan IS NOT NULL AND sinh_hoc IS NOT NULL THEN 'B'
            WHEN ngu_van IS NOT NULL AND (lich_su IS NOT NULL OR dia_li IS NOT NULL) THEN 'C'
            WHEN ngu_van IS NOT NULL AND (ngoai_ngu IS NOT NULL OR (vat_li IS NOT NULL AND hoa_hoc IS NOT NULL)) THEN 'D'
            ELSE 'Others'
        END AS khoi
    FROM diem_thi_thpt_2024
), avg_scores AS (
    SELECT 
        khoi,
        AVG(ISNULL(toan, 0)) AS avg_math,
        AVG(ISNULL(vat_li, 0)) AS avg_physics,
        AVG(ISNULL(hoa_hoc, 0)) AS avg_chemistry,
        AVG(ISNULL(sinh_hoc, 0)) AS avg_biology,
        AVG(ISNULL(lich_su, 0)) AS avg_history,
        AVG(ISNULL(dia_li, 0)) AS avg_geography,
        AVG(ISNULL(ngu_van, 0)) AS avg_literature,
        AVG(ISNULL(ngoai_ngu, 0)) AS avg_language
    FROM classified_scores
    GROUP BY khoi
)
SELECT 
    'Math' AS subject, khoi, avg_math FROM avg_scores WHERE avg_math = (SELECT MAX(avg_math) FROM avg_scores)
UNION ALL
SELECT 
    'Math' AS subject, khoi, avg_math FROM avg_scores WHERE avg_math = (SELECT MIN(avg_math) FROM avg_scores)
UNION ALL
SELECT 
    'Physics' AS subject, khoi, avg_physics FROM avg_scores WHERE avg_physics = (SELECT MAX(avg_physics) FROM avg_scores)
UNION ALL
SELECT 
    'Physics' AS subject, khoi, avg_physics FROM avg_scores WHERE avg_physics = (SELECT MIN(avg_physics) FROM avg_scores)
UNION ALL
SELECT 
    'Chemistry' AS subject, khoi, avg_chemistry FROM avg_scores WHERE avg_chemistry = (SELECT MAX(avg_chemistry) FROM avg_scores)
UNION ALL
SELECT 
    'Chemistry' AS subject, khoi, avg_chemistry FROM avg_scores WHERE avg_chemistry = (SELECT MIN(avg_chemistry) FROM avg_scores)
UNION ALL
SELECT 
    'Biology' AS subject, khoi, avg_biology FROM avg_scores WHERE avg_biology = (SELECT MAX(avg_biology) FROM avg_scores)
UNION ALL
SELECT 
    'Biology' AS subject, khoi, avg_biology FROM avg_scores WHERE avg_biology = (SELECT MIN(avg_biology) FROM avg_scores)
UNION ALL
SELECT 
    'History' AS subject, khoi, avg_history FROM avg_scores WHERE avg_history = (SELECT MAX(avg_history) FROM avg_scores)
UNION ALL
SELECT 
    'History' AS subject, khoi, avg_history FROM avg_scores WHERE avg_history = (SELECT MIN(avg_history) FROM avg_scores)
UNION ALL
SELECT 
    'Geography' AS subject, khoi, avg_geography FROM avg_scores WHERE avg_geography = (SELECT MAX(avg_geography) FROM avg_scores)
UNION ALL
SELECT 
    'Geography' AS subject, khoi, avg_geography FROM avg_scores WHERE avg_geography = (SELECT MIN(avg_geography) FROM avg_scores)
UNION ALL
SELECT 
    'Literature' AS subject, khoi, avg_literature FROM avg_scores WHERE avg_literature = (SELECT MAX(avg_literature) FROM avg_scores)
UNION ALL
SELECT 
    'Literature' AS subject, khoi, avg_literature FROM avg_scores WHERE avg_literature = (SELECT MIN(avg_literature) FROM avg_scores)
UNION ALL
SELECT 
    'Language' AS subject, khoi, avg_language FROM avg_scores WHERE avg_language = (SELECT MAX(avg_language) FROM avg_scores)
UNION ALL
SELECT 
    'Language' AS subject, khoi, avg_language FROM avg_scores WHERE avg_language = (SELECT MIN(avg_language) FROM avg_scores);



------ Độ khó của các môn thi giữa các khối
WITH classified_scores AS (
    SELECT *,
        CASE 
            WHEN toan IS NOT NULL AND (vat_li IS NOT NULL OR hoa_hoc IS NOT NULL) THEN 'A'
            WHEN toan IS NOT NULL AND sinh_hoc IS NOT NULL THEN 'B'
            WHEN ngu_van IS NOT NULL AND (lich_su IS NOT NULL OR dia_li IS NOT NULL) THEN 'C'
            WHEN ngu_van IS NOT NULL AND (ngoai_ngu IS NOT NULL OR (vat_li IS NOT NULL AND hoa_hoc IS NOT NULL)) THEN 'D'
            ELSE 'Others'
        END AS khoi
    FROM diem_thi_thpt_2024
)
SELECT 
    khoi,
    SQRT(VAR(ISNULL(toan, 0))) AS stdev_math,
    SQRT(VAR(ISNULL(vat_li, 0))) AS stdev_physics,
    SQRT(VAR(ISNULL(hoa_hoc, 0))) AS stdev_chemistry,
    SQRT(VAR(ISNULL(sinh_hoc, 0))) AS stdev_biology,
    SQRT(VAR(ISNULL(lich_su, 0))) AS stdev_history,
    SQRT(VAR(ISNULL(dia_li, 0))) AS stdev_geography,
    SQRT(VAR(ISNULL(ngu_van, 0))) AS stdev_literature,
    SQRT(VAR(ISNULL(ngoai_ngu, 0))) AS stdev_language
FROM classified_scores
GROUP BY khoi;



------ Tỷ lệ thí sinh đạt điểm giỏi, khá, trung bình, yếu của từng khối
WITH classified_scores AS (
    SELECT *,
        CASE 
            WHEN toan IS NOT NULL AND (vat_li IS NOT NULL OR hoa_hoc IS NOT NULL) THEN 'A'
            WHEN toan IS NOT NULL AND sinh_hoc IS NOT NULL THEN 'B'
            WHEN ngu_van IS NOT NULL AND (lich_su IS NOT NULL OR dia_li IS NOT NULL) THEN 'C'
            WHEN ngu_van IS NOT NULL AND (ngoai_ngu IS NOT NULL OR (vat_li IS NOT NULL AND hoa_hoc IS NOT NULL)) THEN 'D'
            ELSE 'Others'
        END AS khoi
    FROM diem_thi_thpt_2024
)
, score_categories AS (
    SELECT 
        khoi,
        CASE 
            WHEN ISNULL(toan, 0) >= 8 THEN 'Giỏi'
            WHEN ISNULL(toan, 0) >= 6.5 THEN 'Khá'
            WHEN ISNULL(toan, 0) >= 5 THEN 'Trung bình'
            ELSE 'Yếu'
        END AS math_category,
        CASE 
            WHEN ISNULL(vat_li, 0) >= 8 THEN 'Giỏi'
            WHEN ISNULL(vat_li, 0) >= 6.5 THEN 'Khá'
            WHEN ISNULL(vat_li, 0) >= 5 THEN 'Trung bình'
            ELSE 'Yếu'
        END AS physics_category,
        CASE 
            WHEN ISNULL(hoa_hoc, 0) >= 8 THEN 'Giỏi'
            WHEN ISNULL(hoa_hoc, 0) >= 6.5 THEN 'Khá'
            WHEN ISNULL(hoa_hoc, 0) >= 5 THEN 'Trung bình'
            ELSE 'Yếu'
        END AS chemistry_category,
        CASE 
            WHEN ISNULL(sinh_hoc, 0) >= 8 THEN 'Giỏi'
            WHEN ISNULL(sinh_hoc, 0) >= 6.5 THEN 'Khá'
            WHEN ISNULL(sinh_hoc, 0) >= 5 THEN 'Trung bình'
            ELSE 'Yếu'
        END AS biology_category,
        CASE 
            WHEN ISNULL(lich_su, 0) >= 8 THEN 'Giỏi'
            WHEN ISNULL(lich_su, 0) >= 6.5 THEN 'Khá'
            WHEN ISNULL(lich_su, 0) >= 5 THEN 'Trung bình'
            ELSE 'Yếu'
        END AS history_category,
        CASE 
            WHEN ISNULL(dia_li, 0) >= 8 THEN 'Giỏi'
            WHEN ISNULL(dia_li, 0) >= 6.5 THEN 'Khá'
            WHEN ISNULL(dia_li, 0) >= 5 THEN 'Trung bình'
            ELSE 'Yếu'
        END AS geography_category,
        CASE 
            WHEN ISNULL(ngu_van, 0) >= 8 THEN 'Giỏi'
            WHEN ISNULL(ngu_van, 0) >= 6.5 THEN 'Khá'
            WHEN ISNULL(ngu_van, 0) >= 5 THEN 'Trung bình'
            ELSE 'Yếu'
        END AS literature_category,
        CASE 
            WHEN ISNULL(ngoai_ngu, 0) >= 8 THEN 'Giỏi'
            WHEN ISNULL(ngoai_ngu, 0) >= 6.5 THEN 'Khá'
            WHEN ISNULL(ngoai_ngu, 0) >= 5 THEN 'Trung bình'
            ELSE 'Yếu'
        END AS language_category
    FROM classified_scores
)
SELECT 
    khoi,
    math_category,
    COUNT(*) AS count_math,
    physics_category,
    COUNT(*) AS count_physics,
    chemistry_category,
    COUNT(*) AS count_chemistry,
    biology_category,
    COUNT(*) AS count_biology,
    history_category,
    COUNT(*) AS count_history,
    geography_category,
    COUNT(*) AS count_geography,
    literature_category,
    COUNT(*) AS count_literature,
    language_category,
    COUNT(*) AS count_language
FROM score_categories
GROUP BY 
    khoi,
    math_category,
    physics_category,
    chemistry_category,
    biology_category,
    history_category,
    geography_category,
    literature_category,
    language_category;

