/* Types of columns:

1. main columns - main properties of Nobel Prizes: laureate name, gender, year of prize, type - individual or organization, cathegory of Prize, etc.

2. birth date, city and country description columns - detailed information about city and country of birth of laureate to explore conditions of birth. Contain economic and geographic characteristics of places.

3. death date, city and country description columns - detailed information about city and country of death of laureate. Do not contain economic and geographic characteristics of places, just conditions for man: GDP, sity/country population, coastline, etc.

4. organization name, city and country description columns - detailed information about city and country of laureate's organizations. Contain main characteristics only: city and country names, regions, continents, city/country population, GDP.
Note: a laureate can receive a Nobel Prize as a part of organization. Data analysis showed that maximum count of organizations for one laureate is 3. For this reason 3 set of organization columns were added for 1 laureate: this gives the uniqueness of the fields set LAUREATE_ID + YEAR + CATHEGORY.

*/

CREATE TABLE LAUREATES
(
	-- main columns
	LAUREATE_ID number(38) GENERATED AS IDENTITY, -- PK
	FULL_NAME varchar2(255), -- name of laureate (person or society), for reports
	YEAR number(38), -- for analyisis by years of prizes and groupings of co-authors
	CATHEGORY varchar2(30), -- cathegory of prize: Medicine, Physics, Chemistry, etc, for analysis by prize cathegirues and groupings of co-authors
	PRIZE varchar2(255), -- for analysis by prize types
	MOTIVATION varchar2(255), -- for analysis of text and themes
	PRIZE_SHARE number(38, 12), -- shows if the prize was shared, for analysis of collectivity
	LAYREATE_TYPE varchar2(20) -- type of laureate: individual or organization, for analysis by types
	GENDER varchar2(30), -- male/female, for analysis by gender
	
	-- birth date, city and country description columns
	BIRTH_DATE date, -- for analysis by age
	BIRTH_SITY_ID number(38), -- for grouping and sorting
	BIRTH_SITY_NAME varchar2(50), -- for analysis by place of birth
	BIRTH_SITY_NAME_OLD varchar2(50), -- old name of a sity if a name was changed later, for analysis by history
	BIRTH_SITY_REGION varchar2(10), -- region of sity in the country, for analysis by place of birth
	BIRTH_SITY_POPULATION number(38), -- for analysis according to the conditions of the birth of the laureate
	BIRTH_SITY_LATITUDE varchar2(100), -- for analysis according to the conditions of the birth of the laureate
	BIRTH_SITY_LONGITUDE varchar2(100), -- for analysis according to the conditions of the birth of the laureate
	BIRTH_COUNTRY_ID number(38), -- for grouping and sorting
	BIRTH_COUNTRY_NAME varchar2(50), -- for analysis by place of birth
	BIRTH_COUNTRY_NAME_OLD varchar2(50), -- old name of a country if a name was changed later, for analysis by history
	BIRTH_REGION_NAME varchar2(50), -- for analysis by place of birth
	BIRTH_CONTINENT_NAME varchar2(50), -- for analysis by place of birth
	BIRTH_COUNTRY_POPULATION number(38), -- for analysis according to the conditions of the birth of the laureate
	BIRTH_COUNTRY_AREA_SQ_MILES number(38), -- for analysis according to the conditions of the birth of the laureate
	BIRTH_COUNTRY_POP_DENCITY_PER_SQ_MILE number(38, 12), -- for analysis according to the conditions of the birth of the laureate
	BIRTH_COUNTRY_COASTLINE number(38, 12), -- for analysis according to the conditions of the birth of the laureate
	BIRTH_COUNTRY_NET_MIGRATION number(38, 12), -- for analysis according to the conditions of the birth of the laureate
	BIRTH_COUNTRY_INFANT_MORTALITY_PER_1000 number(38, 12), -- for analysis according to the conditions of the birth of the laureate
	BIRTH_COUNTRY_GDB number(38, 12), -- for analysis according to the conditions of the birth of the laureate
	BIRTH_COUNTRY_PERCENT_LITERACY number(38, 12), -- for analysis according to the conditions of the birth of the laureate
	BIRTH_COUNTRY_PHONES_PER_1000 number(38, 12), -- for analysis according to the conditions of the birth of the laureate
	BIRTH_COUNTRY_PERCENT_ARABLE number(38, 12), -- for analysis according to the conditions of the birth of the laureate
	BIRTH_COUNTRY_PERCENT_CROPS number(38, 12), -- for analysis according to the conditions of the birth of the laureate
	BIRTH_COUNTRY_PERCENT_OTHER number(38, 12), -- for analysis according to the conditions of the birth of the laureate
	BIRTH_COUNTRY_CLIMATE number(38, 12), -- for analysis according to the conditions of the birth of the laureate
	BIRTH_COUNTRY_BIRTHRATE number(38, 12), -- for analysis according to the conditions of the birth of the laureate
	BIRTH_COUNTRY_DEATHRATE number(38, 12), -- for analysis according to the conditions of the birth of the laureate
	BIRTH_COUNTRY_AGRICULTURE number(38, 12), -- for analysis according to the conditions of the birth of the laureate
	BIRTH_COUNTRY_INDUSTRY number(38, 12), -- for analysis according to the conditions of the birth of the laureate
	BIRTH_COUNTRY_SERVICE number(38, 12), -- for analysis according to the conditions of the birth of the laureate
	
	-- death date, city and country description columns
	DEATH_DATE date, -- for analysis by life expectancy
	DEATH_SITY_ID number(38), -- for grouping and sorting
	DEATH_SITY_NAME varchar2(50), -- for analysis by place of end of life
	DEATH_SITY_NAME_OLD varchar2(50), -- old name of a sity if a name was changed later, for analysis by history
	DEATH_SITY_REGION varchar2(10), -- region of sity in the country, for analysis by place of end of life
	DEATH_SITY_POPULATION number(38), -- for analysis according to the conditions of the end of life of the laureate
	DEATH_SITY_LATITUDE varchar2(100), -- for analysis according to the conditions of the end of life of the laureate
	DEATH_SITY_LONGITUDE varchar2(100), -- for analysis according to the conditions of the end of life of the laureate
	DEATH_COUNTRY_ID number(38), -- for grouping and sorting
	DEATH_COUNTRY_NAME varchar2(50), -- for analysis by place of end of life
	DEATH_COUNTRY_NAME_OLD varchar2(50), -- old name of a country if a name was changed later, for analysis by history
	DEATH_REGION_NAME varchar2(50), -- for analysis by place of end of life
	DEATH_CONTINENT_NAME varchar2(50), -- for analysis by place of end of life
	DEATH_COUNTRY_POPULATION number(38), -- for analysis according to the conditions of the end of life of the laureate
	DEATH_COUNTRY_GDB number(38, 12), -- for analysis according to the conditions of the end of life of the laureate
	DEATH_COUNTRY_COASTLINE number(38, 12), -- for analysis according to the conditions of the end of life of the laureate
	DEATH_COUNTRY_CLIMATE number(38, 12), -- for analysis according to the conditions of the end of life of the laureate
	
	-- organization name, city and country description columns
	-- organization 1
	ORGANIZATION1_NAME varchar2(255), -- for analysis by place of work
	ORGANIZATION1_NAME_OLD varchar2(255), -- old name of an organization if a name was changed later, for analysis by history
	ORGANIZATION1_SITY_ID number(38), -- for grouping and sorting
	ORGANIZATION1_SITY_NAME varchar2(50), -- for analysis by place of work
	ORGANIZATION1_SITY_NAME_OLD varchar2(50), -- old name of a sity if a name was changed later, for analysis by history
	ORGANIZATION1_SITY_REGION varchar2(10), -- region of sity in the country, for analysis by place of work
	ORGANIZATION1_SITY_POPULATION number(38), -- for analysis according to the conditions of the work of the laureate
	ORGANIZATION1_SITY_LATITUDE varchar2(100), -- for analysis according to the conditions of the work of the laureate
	ORGANIZATION1_SITY_LONGITUDE varchar2(100), -- for analysis according to the conditions of the work of the laureate
	ORGANIZATION1_COUNTRY_ID number(38), -- for grouping and sorting
	ORGANIZATION1_COUNTRY_NAME varchar2(50), -- for analysis by place of work
	ORGANIZATION1_COUNTRY_NAME_OLD varchar2(50), -- old name of a country if a name was changed later, for analysis by history
	ORGANIZATION1_REGION_NAME varchar2(50), -- for analysis by place of work
	ORGANIZATION1_CONTINENT_NAME varchar2(50), -- for analysis by place of work
	ORGANIZATION1_COUNTRY_POPULATION number(38), -- for analysis according to the conditions of the work of the laureate
	ORGANIZATION1_COUNTRY_GDB number(38, 12), -- for analysis according to the conditions of the work of the laureate
	-- organization 2
	ORGANIZATION2_NAME varchar2(255), -- for analysis by place of work
	ORGANIZATION2_NAME_OLD varchar2(255), -- old name of an organization if a name was changed later, for analysis by history
	ORGANIZATION2_SITY_ID number(38), -- for grouping and sorting
	ORGANIZATION2_SITY_NAME varchar2(50), -- for analysis by place of work
	ORGANIZATION2_SITY_NAME_OLD varchar2(50), -- old name of a sity if a name was changed later, for analysis by history
	ORGANIZATION2_SITY_REGION varchar2(10), -- region of sity in the country, for analysis by place of work
	ORGANIZATION2_SITY_POPULATION number(38), -- for analysis according to the conditions of the work of the laureate
	ORGANIZATION2_SITY_LATITUDE varchar2(100), -- for analysis according to the conditions of the work of the laureate
	ORGANIZATION2_SITY_LONGITUDE varchar2(100), -- for analysis according to the conditions of the work of the laureate
	ORGANIZATION2_COUNTRY_ID number(38), -- for grouping and sorting
	ORGANIZATION2_COUNTRY_NAME varchar2(50), -- for analysis by place of work
	ORGANIZATION2_COUNTRY_NAME_OLD varchar2(50), -- old name of a country if a name was changed later, for analysis by history
	ORGANIZATION2_REGION_NAME varchar2(50), -- for analysis by place of work
	ORGANIZATION2_CONTINENT_NAME varchar2(50), -- for analysis by place of work
	ORGANIZATION2_COUNTRY_POPULATION number(38), -- for analysis according to the conditions of the work of the laureate
	ORGANIZATION2_COUNTRY_GDB number(38, 12), -- for analysis according to the conditions of the work of the laureate
	-- organization 3
	ORGANIZATION3_NAME varchar2(255), -- for analysis by place of work
	ORGANIZATION3_NAME_OLD varchar2(255), -- old name of an organization if a name was changed later, for analysis by history
	ORGANIZATION3_SITY_ID number(38), -- for grouping and sorting
	ORGANIZATION3_SITY_NAME varchar2(50), -- for analysis by place of work
	ORGANIZATION3_SITY_NAME_OLD varchar2(50), -- old name of a sity if a name was changed later, for analysis by history
	ORGANIZATION3_SITY_REGION varchar2(10), -- region of sity in the country, for analysis by place of work
	ORGANIZATION3_SITY_POPULATION number(38), -- for analysis according to the conditions of the work of the laureate
	ORGANIZATION3_SITY_LATITUDE varchar2(100), -- for analysis according to the conditions of the work of the laureate
	ORGANIZATION3_SITY_LONGITUDE varchar2(100), -- for analysis according to the conditions of the work of the laureate
	ORGANIZATION3_COUNTRY_ID number(38), -- for grouping and sorting
	ORGANIZATION3_COUNTRY_NAME varchar2(50), -- for analysis by place of work
	ORGANIZATION3_COUNTRY_NAME_OLD varchar2(50), -- old name of a country if a name was changed later, for analysis by history
	ORGANIZATION3_REGION_NAME varchar2(50), -- for analysis by place of work
	ORGANIZATION3_CONTINENT_NAME varchar2(50), -- for analysis by place of work
	ORGANIZATION3_COUNTRY_POPULATION number(38), -- for analysis according to the conditions of the work of the laureate
	ORGANIZATION3_COUNTRY_GDB number(38, 12), -- for analysis according to the conditions of the work of the laureate
);