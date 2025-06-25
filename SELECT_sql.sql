/*사고 테이블의 데이터 찾기*/
SELECT * FROM accident; 

/*충돌 장소 테이블의 데이터 찾기*/
SELECT * FROM crash_location; 

 /*포함된다(국내장소+공항) 데이터 찾기*/
SELECT * FROM included;

/*공항에서 airport_type이 '국제'인 경우의 데이터 찾기*/
SELECT * 
FROM airport
WHERE airport_type = '국제';

/*조류 이동 정보에서 월을 검색했을 때 해당하는 정보가 검색*/
SELECT (arrival_place, departure_place)
FROM bird_of_passage
WHERE MONTH(departure_date) = 04;

/*조류 종류에서 철새에 해당하는 조류만 내림차순으로 검색 */
SELECT *
FROM bird_species
WHERE is_migratory = TRUE
ORDER BY speciesl_id, speciesl_name DESC;

/*이동하다에서 이동id와 조류 종 식별번호 각각의 원래 테이블로 조인시킨다*/
select *
from bird_species as bs
join move as m
    on bs.speciesl_id = m.speciesl_id
join bird_of_passage as bop
    on  m.magration_id = bop.magration_id;
    
/*조류 개체별 태깅정보를 알려주는 코드*/
SELECT 
	bpi.individual_id AS 개체ID,
    bpi.identifier_number AS 식별번호,
    bs.speciesl_name AS 조류종,
    bs.is_migratory AS 철새여부
FROM 
    bird_population_information AS bpi
JOIN 
    is_tagged AS t ON bpi.individual_id = t.individual_id
JOIN 
    bird_species AS bs ON t.speciesl_id = bs.speciesl_id; 