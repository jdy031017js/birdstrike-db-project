/*조류이동정보*/
CREATE TABLE bird_of_passage (
    magration_id  VARCHAR(20) NOT NULL UNIQUE PRIMARY KEY,  -- 이동id
    arrival_date    DATE NOT NULL,  						-- 도래일자
	departure_date   DATE NOT NULL, 						-- 북상일자
    departure_place  VARCHAR(20) NOT NULL,     				-- 북상장소         
    arrival_place  VARCHAR(20) NOT NULL   					-- 도래장소            
);
/*국내 장소*/
CREATE TABLE domestic_place (
    location_id   VARCHAR(20) NOT NULL UNIQUE PRIMARY KEY,  -- 국내장소id
    location_name VARCHAR(20) NOT NULL               		-- 국내 장소명
);
/*조류 종류*/
CREATE TABLE bird_species (
    speciesl_id   VARCHAR(20) NOT NULL UNIQUE PRIMARY KEY,  -- 조류 종 식별번호
    speciesl_name    DATE        NOT NULL,  		 		-- 조류 종류 명
	is_migratory    BOOLEAN       NOT NULL          		-- 철새 여부
);
/*조류 개체 정보*/
CREATE TABLE bird_population_information (
    individual_id   VARCHAR(20) NOT NULL UNIQUE PRIMARY KEY,  -- 개체id
    identifier_number    INT        NOT NULL    			  -- 식별번호
);
/*태깅된다*/
CREATE TABLE is_tagged(
	individual_id varchar(20) NOT NULL UNIQUE PRIMARY KEY, 	-- 개체id
	speciesl_id   VARCHAR(20) NOT NULL UNIQUE, 				-- 조류 종 식별번호
    
    FOREIGN KEY (individual_id)   REFERENCES bird_population_information(individual_id),
    FOREIGN KEY (speciesl_id) REFERENCES bird_species(speciesl_id)
);

/*포함된다*/
CREATE TABLE included(
	location_id varchar(20) NOT NULL UNIQUE PRIMARY KEY, 	-- 국내장소id
	iata   VARCHAR(3) NOT NULL UNIQUE, 						-- 공항 고유코드
    
    FOREIGN KEY (location_id)   REFERENCES domestic_place(location_id),
	FOREIGN KEY (iata) REFERENCES airport(iata)
);
/*발견된다*/
CREATE TABLE is_discovered(
	location_id varchar(20) NOT NULL UNIQUE PRIMARY KEY, 	-- 국내장소id
    magration_id  VARCHAR(20) NOT NULL UNIQUE, 				-- 이동id
    
    FOREIGN KEY (location_id)   REFERENCES domestic_place(location_id),
	FOREIGN KEY (magration_id) REFERENCES bird_of_passage(magration_id)
);

/*이동한다*/
CREATE TABLE move(
	speciesl_id   VARCHAR(20) NOT NULL UNIQUE PRIMARY KEY, 	-- 조류 종 식별번호
    magration_id  VARCHAR(20) NOT NULL UNIQUE, 				-- 이동id
    location_id   VARCHAR(20) NOT NULL, 				    -- 국내장소id
    FOREIGN KEY (speciesl_id) REFERENCES bird_species(speciesl_id),
    FOREIGN KEY (location_id)   REFERENCES domestic_place(location_id)
);