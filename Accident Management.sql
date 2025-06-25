CREATE TABLE accident (
    incident_id   VARCHAR(30) NOT NULL PRIMARY KEY,  
    crach_date    DATE        NOT NULL,  
	crach_time    TIME        NOT NULL, 
    bird_species  VARCHAR(15) NOT NULL,              
    airport_code  VARCHAR(10) NOT NULL               
);
CREATE TABLE crash_location (
    crach_id            VARCHAR(10) NOT NULL PRIMARY KEY,         
    departure_location  VARCHAR(20),                     
    arrival_location    VARCHAR(20),                     
    stop_point          VARCHAR(20),                              
    crach_location      VARCHAR(20)                          
);

CREATE TABLE recode(
	incident_id varchar(20) PRIMARY KEY, 
    crach_id VARCHAR(10) NOT NULL,
    
    FOREIGN KEY (incident_id)   REFERENCES accident(incident_id),
    FOREIGN KEY (crach_id) REFERENCES crash_location(crach_id)
);

CREATE TABLE distinguish (
    incident_id VARCHAR(10) NOT NULL,
    iata        CHAR(3)     NOT NULL,
    PRIMARY KEY (incident_id),
    FOREIGN KEY (incident_id) REFERENCES accident(incident_id),
    FOREIGN KEY (iata) REFERENCES airport(iata)
);

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