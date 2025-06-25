/* 공항 */
CREATE TABLE airport (
    iata CHAR(3) NOT NULL PRIMARY KEY,      -- 고유코드
    airport_name VARCHAR(100) NOT NULL,     -- 공항명
    city VARCHAR(50) NOT NULL,              -- 도시
    airport_type VARCHAR(10) NOT NULL,      -- 공항유형
    airport_address VARCHAR(100) NOT NULL,  -- 주소
    
    CONSTRAINT uq_iata UNIQUE (iata),
    CONSTRAINT chk_airport_type CHECK (airport_type IN ('국제', '국내')),
    CONSTRAINT chk_city_not_blank CHECK (TRIM(city) <> ''),
    CONSTRAINT chk_airport_address_length CHECK (CHAR_LENGTH(airport_address) <= 100)
);

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
