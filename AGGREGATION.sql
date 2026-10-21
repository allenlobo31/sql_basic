CREATE TABLE allen(
    id INT NOT NULL UNIQUE,
    sub_1 INT NOT NULL,
    sub_2 INT NOT NULL,
    sub_3 INT NOT NULL,
    sub_1_sem INT NOT NULL,
    sub_2_sem INT NOT NULL,
    sub_3_sem INT NOT NULL
);

INSERT INTO allen(id, sub_1, sub_2, sub_3, sub_1_sem, sub_2_sem, sub_3_sem) VALUES (002, 100, 100, 100, 1, 1, 1), (003, 90, 80, 70, 1, 1, 1), (004, 85, 75, 65, 1, 1, 1);

SELECT * FROM allen;

SELECT id, (sub_1 + sub_2 + sub_3) AS total_marks, ((sub_1 + sub_2 + sub_3)/3) AS average_marks
FROM allen;

SELECT COUNT(*) From allen;
