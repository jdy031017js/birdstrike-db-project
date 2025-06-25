
INSERT INTO bird_of_passage (magration_id, arrival_date, departure_date, arrival_place, departure_place) VALUES
('M001', '2020-11-03', '2020-04-10', '1024, 1020', '1024, 1020'),
('M002', '2020-11-03', '2020-04-10', '1024, 1020', '1008, 1004'),
('M003', '2020-12-15', '2020-04-28', '1023, 1022, 1020', '1023, 1022, 1020'),
('M004', '2019-11-18', '2020-02-19', '1012, 1010, 1001', '1012, 1010, 1001'),
('M005', '2020-10-30', '2020-03-20', '1018', '1018'),
('M006', '2020-10-12', '2020-03-27', '1014, 1015', '1018'),
('M007', '2019-12-05', '2020-05-13', '1009, 1011', '1009, 1011'),
('M008', '2020-10-31', '2020-03-26', '1007, 1002, 1006, 1005', '1007, 1002, 1006, 1005'),
('M009', '2020-04-30', '2020-09-04', '1003, 1027', '1003, 1027'),
('M010', '2020-04-30', '2020-07-01', '1013', '1013'),
('M011', '2020-11-10', '2020-06-03', '1002', '1002'),
('M012', '2020-10-31', '2020-04-30', '1026, 1029, 1025, 1007', '1026, 1029, 1025, 1007');


INSERT INTO domestic_place (location_id, location_name) VALUES ('1001', '영월');
INSERT INTO domestic_place (location_id, location_name) VALUES ('1002', '철원');
INSERT INTO domestic_place (location_id, location_name) VALUES ('1003', '가평');
INSERT INTO domestic_place (location_id, location_name) VALUES ('1004', '안산');
INSERT INTO domestic_place (location_id, location_name) VALUES ('1005', '연천');
INSERT INTO domestic_place (location_id, location_name) VALUES ('1006', '파주');
INSERT INTO domestic_place (location_id, location_name) VALUES ('1007', '평택');
INSERT INTO domestic_place (location_id, location_name) VALUES ('1008', '화성');
INSERT INTO domestic_place (location_id, location_name) VALUES ('1009', '고성');
INSERT INTO domestic_place (location_id, location_name) VALUES ('1010', '창녕');
INSERT INTO domestic_place (location_id, location_name) VALUES ('1011', '통영');
INSERT INTO domestic_place (location_id, location_name) VALUES ('1012', '구미');
INSERT INTO domestic_place (location_id, location_name) VALUES ('1013', '인천');
INSERT INTO domestic_place (location_id, location_name) VALUES ('1014', '고흥');
INSERT INTO domestic_place (location_id, location_name) VALUES ('1015', '보성');
INSERT INTO domestic_place (location_id, location_name) VALUES ('1016', '순천');
INSERT INTO domestic_place (location_id, location_name) VALUES ('1017', '여수');
INSERT INTO domestic_place (location_id, location_name) VALUES ('1018', '해남');
INSERT INTO domestic_place (location_id, location_name) VALUES ('1019', '군산');
INSERT INTO domestic_place (location_id, location_name) VALUES ('1020', '김제');
INSERT INTO domestic_place (location_id, location_name) VALUES ('1021', '부안');
INSERT INTO domestic_place (location_id, location_name) VALUES ('1022', '완주');
INSERT INTO domestic_place (location_id, location_name) VALUES ('1023', '익산');
INSERT INTO domestic_place (location_id, location_name) VALUES ('1024', '정읍');
INSERT INTO domestic_place (location_id, location_name) VALUES ('1025', '부여');
INSERT INTO domestic_place (location_id, location_name) VALUES ('1026', '아산');
INSERT INTO domestic_place (location_id, location_name) VALUES ('1027', '천안');
INSERT INTO domestic_place (location_id, location_name) VALUES ('1028', '괴산');
INSERT INTO domestic_place (location_id, location_name) VALUES ('1029', '안산');


INSERT INTO bird_species (speciesl_id, speciesl_name, is_migratory) VALUES
('SP001', '오리류', TRUE),
('SP002', '고니류', TRUE),
('SP003', '맹금류', TRUE),
('SP004', '뻐꾸기류', TRUE),
('SP005', '갈매기류', TRUE),
('SP006', '가마우지', TRUE),
('SP007', '두루미', TRUE);

INSERT INTO migration_info (speciesl_id, magration_id) VALUES
('SP001', 'M001'),
('SP001', 'M002'),
('SP001', 'M003'),
('SP002', 'M004'),
('SP003', 'M005'),
('SP003', 'M006'),
('SP003', 'M007'),
('SP003', 'M008'),
('SP004', 'M009'),
('SP005', 'M010'),
('SP007', 'M011');


/*조류 개체 정보*/
CREATE TABLE bird_population_information (
    individual_id   VARCHAR(20) NOT NULL UNIQUE PRIMARY KEY,  -- 개체id
    identifier_number    INT        NOT NULL    			  -- 식별번호
);
INSERT INTO bird_population_information (individual_id, identifier_number) VALUES
('DC001', 1),
('DC002', 2),
('DC101', 3),
('DC201', 4),
('DC301', 5),
('SW001', 6),
('SW101', 7),
('BP001', 8),
('BP101', 9),
('BP201', 10),
('BP301', 11),
('BP401', 12),
('CK001', 13),
('CK101', 14),
('SG001', 15),
('SG101', 16),
('CM001', 17),
('CR001', 18);
