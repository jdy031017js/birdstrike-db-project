/* 공항 */
CREATE TABLE airport (
    iata CHAR(3) NOT NULL PRIMARY KEY,
    airport_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    airport_type VARCHAR(10) NOT NULL,
    airport_address VARCHAR(100) NOT NULL,

    CONSTRAINT uq_iata UNIQUE (iata),
    CONSTRAINT chk_airport_type CHECK (airport_type IN ('국제', '국내')),
    CONSTRAINT chk_city_not_blank CHECK (TRIM(city) <> ''),
    CONSTRAINT chk_airport_address_length CHECK (CHAR_LENGTH(airport_address) <= 100)
);

/* 사고 */
CREATE TABLE accident (
    incident_id   VARCHAR(50) NOT NULL PRIMARY KEY,
    crach_date    DATE        NOT NULL,
    crach_time    TIME        NOT NULL,
    bird_species  VARCHAR(15) NOT NULL,
    airport_code  VARCHAR(10) NOT NULL
);

/* 충돌장소 */
CREATE TABLE crash_location (
    crach_id            VARCHAR(10) NOT NULL PRIMARY KEY,
    departure_location  VARCHAR(50),
    arrival_location    VARCHAR(50),
    stop_point          VARCHAR(50),
    crach_location      VARCHAR(20)
);

/* 기록하다 */
CREATE TABLE recode (
    incident_id VARCHAR(20) PRIMARY KEY,
    crach_id VARCHAR(10) NOT NULL,

    FOREIGN KEY (incident_id) REFERENCES accident(incident_id),
    FOREIGN KEY (crach_id) REFERENCES crash_location(crach_id)
);

/* 구분하다 */
CREATE TABLE distinguish (
    incident_id VARCHAR(10) NOT NULL,
    iata        CHAR(3)     NOT NULL,
    PRIMARY KEY (incident_id),
    FOREIGN KEY (incident_id) REFERENCES accident(incident_id),
    FOREIGN KEY (iata) REFERENCES airport(iata)
);

/* 조류이동정보 */
CREATE TABLE bird_of_passage (
    magration_id  VARCHAR(20) NOT NULL UNIQUE PRIMARY KEY,
    arrival_date    DATE NOT NULL,
    departure_date  DATE NOT NULL,
    departure_place VARCHAR(50) NOT NULL,
    arrival_place   VARCHAR(50) NOT NULL
);

/* 국내장소 */
CREATE TABLE domestic_place (
    location_id   VARCHAR(20) NOT NULL UNIQUE PRIMARY KEY,
    location_name VARCHAR(20) NOT NULL
);

/* 조류 종류 */
CREATE TABLE bird_species (
    speciesl_id   VARCHAR(20) NOT NULL UNIQUE PRIMARY KEY,
    speciesl_name VARCHAR(30) NOT NULL,
    is_migratory  BOOLEAN NOT NULL
);

/* 조류 개체 정보 */
CREATE TABLE bird_population_information (
    individual_id    VARCHAR(20) NOT NULL UNIQUE PRIMARY KEY,
    identifier_number INT NOT NULL
);

/* 태깅된다 */
CREATE TABLE is_tagged (
    individual_id VARCHAR(20) NOT NULL UNIQUE PRIMARY KEY,
    speciesl_id   VARCHAR(20) NOT NULL UNIQUE,

    FOREIGN KEY (individual_id) REFERENCES bird_population_information(individual_id),
    FOREIGN KEY (speciesl_id) REFERENCES bird_species(speciesl_id)
);

/* 포함된다 */
CREATE TABLE included (
    location_id VARCHAR(20) NOT NULL UNIQUE PRIMARY KEY,
    iata        VARCHAR(3) NOT NULL UNIQUE,

    FOREIGN KEY (location_id) REFERENCES domestic_place(location_id),
    FOREIGN KEY (iata) REFERENCES airport(iata)
);

/* 발견된다 */
CREATE TABLE is_discovered (
    location_id   VARCHAR(20) NOT NULL UNIQUE PRIMARY KEY,
    magration_id  VARCHAR(20) NOT NULL UNIQUE,

    FOREIGN KEY (location_id) REFERENCES domestic_place(location_id),
    FOREIGN KEY (magration_id) REFERENCES bird_of_passage(magration_id)
);

/* 이동한다 */
CREATE TABLE move (
    speciesl_id  VARCHAR(20) NOT NULL UNIQUE PRIMARY KEY,
    magration_id VARCHAR(20) NOT NULL UNIQUE,
   
    FOREIGN KEY (speciesl_id) REFERENCES bird_species(speciesl_id),
    FOREIGN KEY (magration_id) REFERENCES bird_of_passage(magration_id)
);

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

INSERT INTO bird_species (speciesl_id, speciesl_name, is_migratory) VALUES
('SP001', '오리류', TRUE),
('SP002', '고니류', TRUE),
('SP003', '맹금류', TRUE),
('SP004', '뻐꾸기류', TRUE),
('SP005', '갈매기류', TRUE),
('SP006', '가마우지', TRUE),
('SP007', '두루미', TRUE);

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

/*사고데이터 입력*/
INSERT INTO accident VALUES 
('A320-232 HL7737', '2012-03-13', '07:05:00', '큰 기러기 떼', 'KE'),
('A330-323 HL7792', '2011-12-25', '16:06:00', '쇠기러기', 'OZ'),
('B737-800 HL7796', '2011-12-04', '07:03:00', '청둥오리', '7C'),
('AW139 HL9487', '2010-10-05', '16:30:00', '까마귀 떼', 'LJ'),
('B777-200 HL7700', '2013-05-22', '12:40:00', '참새', 'KE'),
('A321-231 HL8256', '2014-09-18', '09:20:00', '멧비둘기', 'BX'),
('B737-900 HL8245', '2015-06-14', '08:55:00', '황조롱이', '7C'),
('A321-200 HL8072', '2016-03-29', '15:12:00', '큰기러기', 'LJ'),
('B737-800 HL8236', '2017-11-02', '06:48:00', '쇠백로', 'TW'),
('B737-800 HL8208', '2018-04-21', '17:30:00', '까치', 'RS'),
('A320-200 HL7732', '2019-08-11', '10:15:00', '비둘기', 'KE'),
('B737-800 HL8291', '2020-10-03', '13:40:00', '황새', 'RF'),
('ERJ-145 HL8210', '2021-03-15', '11:05:00', '까마귀', '4V'),
('A350-900 HL8340', '2021-09-19', '14:22:00', '큰기러기', 'KE'),
('B737-900 HL8260', '2022-05-21', '18:10:00', '쇠기러기', 'OZ'),
('A321-200 HL8055', '2022-11-08', '07:50:00', '청둥오리', '7C'),
('B737-800 HL8241', '2023-02-17', '16:05:00', '참새', '4H'),
('B787-9 HL8081', '2023-06-28', '19:30:00', '황조롱이', 'YP'),
('A320-200 HL7729', '2024-01-12', '08:25:00', '까치', 'BX'),
('B737-800 HL8237', '2024-05-04', '17:45:00', '비둘기', 'KE');

/*충돌장소 데이터 입력*/
INSERT INTO crash_location VALUES 
('CM770487', 'Jeju International Airport', 'Gimpo Airport', 'A320-232', 'runway 14L'),
('CM216739', 'Gimpo International Airport', 'Haneda Airport', 'Gimpo Airport', '32R'),
('CM126225', 'Gimpo International Airport', 'Jeju International Airport', 'Gimpo Airport', '32R'),
('CM877572', 'Jamsil Help Captain', 'Gimpo International Airport', 'Siheung-si, Gyeonggi-do', NULL),
('CM388389', 'Incheon International Airport', 'San Francisco', 'Incheon Airport', 'Lunar Road 33L'),
('CM269927', 'Incheon International Airport', 'Busan Gimhae Airport', 'Incheon Airport', 'Runnail 16R'),
('CM772228', 'Gimhae International Airport', 'Jeju International Airport', 'Gimhae Airport', 'Lunar Road 18L'),
('CM251921', 'Jeju International Airport', 'Gimpo International Airport', 'Jeju Airport', 'Runnail 25'),
('CM364745', 'Jeju International Airport', 'Incheon International Airport', 'Jeju Airport', 'Lunar Road 07'),
('CM219218', 'Daegu International Airport', 'Gimpo International Airport', 'Daegu Airport', 'runway 13R'),
('CM986259', 'Gwangju Airport', 'Jeju International Airport', 'Gwangju Airport', 'Lunar Road 04'),
('CM139765', 'Cheongju International Airport', 'Jeju International Airport', 'Cheongju Airport', 'Lunar Road 22'),
('CM148446', 'Ulsan Airport', 'Gimpo International Airport', 'Ulsan Airport', 'Lunar Road 20'),
('CM634142', 'Incheon International Airport', 'London Hydro', 'Incheon Airport', 'runway 34R'),
('CM364009', 'Gimpo International Airport', 'Jeju International Airport', 'Gimpo Airport', '32L'),
('CM776800', 'Jeju International Airport', 'Gimpo International Airport', 'Jeju Airport', 'Lunar Road 13'),
('CM602018', 'Gimhae International Airport', 'Incheon International Airport', 'Gimhae Airport', '36R'),
('CM493388', 'Incheon International Airport', 'Frankfurt', 'Incheon Airport', 'Lunch 15L'),
('CM194315', 'Daegu International Airport', 'Jeju International Airport', 'Daegu Airport', '31L'),
('CM520921', 'Gimpo International Airport', 'Busan Gimhae Airport', 'Gimpo Airport', 'runway 14R');

/* 공항 데이터 입력*/
INSERT INTO airport (iata, airport_name, city, airport_address, airport_type) VALUES
('ICN', 'Incheon Intl Airport', '인천', '인천광역시 중구 공항로 272', '국제'),
('GMP', 'Gimpo Intl Airport', '서울', '서울특별시 강서구 하늘길 77', '국제'),
('PUS', 'Gimhae Intl Airport', '부산', '부산광역시 강서구 공항진입로 108', '국제'),
('CJU', 'Jeju Intl Airport', '제주', '제주특별자치도 제주시 공항로 2', '국제'),
('CJJ', 'Cheongju Intl Airport', '청주', '충청북도 청주시 청원구 내수읍 오창대로 980', '국제'),
('TAE', 'Daegu Intl Airport', '대구', '대구광역시 동구 공항로 221', '국제'),
('KWJ', 'Gwangju Airport', '광주', '광주광역시 광산구 상무대로 420-25', '국내'),
('USN', 'Ulsan Airport', '울산', '울산광역시 북구 산업로 1103', '국내'),
('RSU', 'Yeosu Airport', '여수', '전라남도 여수시 율촌면 여순로 386', '국내'),
('MWX', 'Muan Intl Airport', '무안', '전라남도 무안군 망운면 공항로 970-260', '국제'),
('KUV', 'Gunsan Airport', '군산', '전북특별자치도 군산시 옥서면 산동길 2', '국내'),
('KPO', 'Pohang Airport', '포항', '경상북도 포항시 남구 동해면 일월로 18', '국내'),
('WJU', 'Wonju Airport', '원주', '강원도 원주시 지정면 공항로 100', '국내'),
('YNY', 'Yangyang International Airport', '양양', '강원도 양양군 손양면 공항로 201', '국내'),
('HIN', 'Sacheon Airport', '사천', '경상남도 사천시 사천읍 사천공항길 111', '국내');
