-- CREATE FACT TABLE FOR NOBLE PRIZES
CREATE TABLE NOBEL_PRIZES 
(
	NOBEL_PRIZE_ID number(38) GENERATED AS IDENTITY, 
	LAUREATE_ID number(38) NOT NULL, 
	CATHEGORY_ID number(38) NOT NULL, 
	LAUREATE_TYPE_ID number(38) NOT NULL, 
	YEAR number(38), 
	PRIZE_TYPE_ID number(38) NOT NULL, 
	MOTIVATION varchar2(255), 
	PRIZE_SHARE number(38, 12), 
	PRIMARY KEY (NOBEL_PRIZE_ID)
);

-- CREATE DIMENSION TABLE FOR NOBLE LAUREATE PERSONS
CREATE TABLE LAUREATE_PERSONS 
(
	LAUREATE_ID number(38) GENERATED AS IDENTITY, 
	FULL_NAME varchar2(255) NOT NULL, 
	GENDER_ID number(38) NOT NULL, 
	BIRTH_DATE date, 
	BIRTH_CITY_ID number(38) NOT NULL, 
	DEATH_DATE date, 
	DEATH_CITY_ID number(38) NOT NULL, 
	PRIMARY KEY (LAUREATE_ID)
);

-- CREATE DIMENSION TABLE FOR ORGANIZATIONS
CREATE TABLE ORGANIZATIONS 
(
	ORGANIZATION_ID number(38) GENERATED AS IDENTITY, 
	ORGANIZATION_NAME varchar2(255) NOT NULL, 
	ORGANIZATION_SITY_ID number(38) NOT NULL, 
	PRIMARY KEY (ORGANIZATION_ID)
);

-- CRETE DIMENSION TABLE FOR RELATIONSHIP BETWEEN LAUREATE PERSONS AND ORGANIZATION
CREATE TABLE PERSONS_ORGANIZATIONS 
(
	PER_ORG_ID number(38) GENERATED AS IDENTITY, 
	LAUREATE_ID number(38) NOT NULL, 
	ORGANIZATION_ID number(38) NOT NULL, 
	PRIMARY KEY (PER_ORG_ID)
);

-- CRETE DIMENSION TABLE FOR SOCIETIES: OTHER TYPE OF HAVING NOBLE PRIZES
CREATE TABLE SOCIETIES 
(
	LAUREATE_ID number(38) GENERATED AS IDENTITY, 
	SOCIETY_NAME_ORIG varchar2(255) NOT NULL, 
	SOCIETY_NAME_ENG varchar2(255), 
	PRIMARY KEY (LAUREATE_ID)
);

-- CRETE DIMENSION TABLE FOR CATHEGORIES OF NOBLE PROZES
CREATE TABLE CATHEGORIES 
(
	CATHEGORY_ID number(38) GENERATED AS IDENTITY, 
	CATHEGORY varchar2(30) NOT NULL, 
	PRIMARY KEY (CATHEGORY_ID)
);

-- CRETE DIMENSION TABLE FOR TYPES OF NOBLE LAUREATES
CREATE TABLE LAUREATE_TYPES 
(
	LAUREATE_TYPE_ID number(38) GENERATED AS IDENTITY, 
	LAYREATE_TYPE varchar2(20) NOT NULL, 
	PRIMARY KEY (LAUREATE_TYPE_ID)
);

-- CRETE DIMENSION TABLE FOR TYPES OF NOBLE PRIZES
CREATE TABLE PRIZE_TYPES 
(
	PRIZE_TYPE_ID number(38) GENERATED AS IDENTITY, 
	PRIZE_TYPE varchar2(255) NOT NULL, 
	PRIMARY KEY (PRIZE_TYPE_ID)
);

-- CRETE DIMENSION TABLE FOR TYPES OF GENDERS
CREATE TABLE GENDERS 
(
	GENDER_ID number(38) GENERATED AS IDENTITY, 
	GENDER varchar2(30) NOT NULL, 
	PRIMARY KEY (GENDER_ID)
);

-- CRETE DIMENSION TABLE FOR SITIES
CREATE TABLE SITIES 
(
	SITY_ID number(38) GENERATED AS IDENTITY, 
	SITY_NAME varchar2(50) NOT NULL, 
	COUNTRY_ID number(38) NOT NULL, 
	SITY_REGION varchar2(10), 
	POPULATION number(38), 
	LATITUDE varchar2(100), 
	LONGITUDE varchar2(100), 
	PRIMARY KEY (SITY_ID)
);

-- CRETE DIMENSION TABLE FOR COUNTRIES
CREATE TABLE COUNTRIES 
(
	COUNTRY_ID number(38) GENERATED AS IDENTITY, 
	REGION_ID number(38) NOT NULL, 
	CONTINENT_ID number(38) NOT NULL, 
	CURRENCY_ID number(38) NOT NULL, 
	COUNTRY_NAME varchar2(50) NOT NULL, 
	COUNTRY_CODE varchar2(5) NOT NULL, 
	COUNTRY_ISO3 varchar2(5), 
	PHONE_CODE varchar2(10), 
	POPULATION number(38), 
	AREA_SQ_MILES number(38), 
	POP_DENCITY_PER_SQ_MILE number(38, 12), 
	COASTLINE number(38, 12), 
	NET_MIGRATION number(38, 12), 
	INFANT_MORTALITY_PER_1000 number(38, 12), 
	GDB_DOLLAR_PER_CAPITA number(38), 
	PERCENT_LITERACY number(38, 12), 
	PHONES_PER_1000 number(38, 12), 
	PERCENT_ARABLE number(38, 12), 
	PERCENT_CROPS number(38, 12), 
	PERCENT_OTHER number(38, 12), 
	CLIMATE number(38, 12), 
	BIRTHRATE number(38, 12), 
	DEATHRATE number(38, 12), 
	AGRICULTURE number(38, 12), 
	INDUSTRY number(38, 12), 
	SERVICE number(38, 12), 
	PRIMARY KEY (COUNTRY_ID)
);

-- CRETE DIMENSION TABLE FOR REGIONS
CREATE TABLE REGIONS 
(
	REGION_ID number(38) GENERATED AS IDENTITY, 
	REGION_NAME varchar2(50) NOT NULL, 
	PRIMARY KEY (REGION_ID));

-- CRETE DIMENSION TABLE FOR CONTINENTS
CREATE TABLE CONTINENTS 
(
	CONTINENT_ID number(38) GENERATED AS IDENTITY, 
	CONTINENT_NAME varchar2(50) NOT NULL, 
	CONTINENT_CODE varchar2(5) NOT NULL, 
	PRIMARY KEY (CONTINENT_ID)
);

-- CRETE DIMENSION TABLE FOR CURRENCIES
CREATE TABLE CURRENCIES 
(
	CURRENCY_ID number(38) GENERATED AS IDENTITY, 
	CURRENCY varchar2(50) NOT NULL, 
	CURRENCY_CODE varchar2(5) NOT NULL, 
	PRIMARY KEY (CURRENCY_ID)
);

-- ADD FOREIGN KEYS TO DB TABLES
ALTER TABLE NOBEL_PRIZES ADD CONSTRAINT FKNOBEL_PRIZ378469 FOREIGN KEY (LAUREATE_ID) REFERENCES SOCIETIES (LAUREATE_ID);
ALTER TABLE NOBEL_PRIZES ADD CONSTRAINT FKNOBEL_PRIZ504992 FOREIGN KEY (LAUREATE_TYPE_ID) REFERENCES LAUREATE_TYPES (LAUREATE_TYPE_ID);
ALTER TABLE NOBEL_PRIZES ADD CONSTRAINT FKNOBEL_PRIZ9224 FOREIGN KEY (CATHEGORY_ID) REFERENCES CATHEGORIES (CATHEGORY_ID);
ALTER TABLE NOBEL_PRIZES ADD CONSTRAINT FKNOBEL_PRIZ244115 FOREIGN KEY (PRIZE_TYPE_ID) REFERENCES PRIZE_TYPES (PRIZE_TYPE_ID);
ALTER TABLE LAUREATE_PERSONS ADD CONSTRAINT FKLAUREATE_P903693 FOREIGN KEY (GENDER_ID) REFERENCES GENDERS (GENDER_ID);
ALTER TABLE LAUREATE_PERSONS ADD CONSTRAINT FKLAUREATE_P770247 FOREIGN KEY (BIRTH_CITY_ID) REFERENCES SITIES (SITY_ID);
ALTER TABLE LAUREATE_PERSONS ADD CONSTRAINT FKLAUREATE_P965230 FOREIGN KEY (DEATH_CITY_ID) REFERENCES SITIES (SITY_ID);
ALTER TABLE PERSONS_ORGANIZATIONS ADD CONSTRAINT FKPERSONS_OR691725 FOREIGN KEY (ORGANIZATION_ID) REFERENCES ORGANIZATIONS (ORGANIZATION_ID);
ALTER TABLE PERSONS_ORGANIZATIONS ADD CONSTRAINT FKPERSONS_OR504321 FOREIGN KEY (LAUREATE_ID) REFERENCES LAUREATE_PERSONS (LAUREATE_ID);
ALTER TABLE ORGANIZATIONS ADD CONSTRAINT FKORGANIZATI17103 FOREIGN KEY (ORGANIZATION_SITY_ID) REFERENCES SITIES (SITY_ID);
ALTER TABLE SITIES ADD CONSTRAINT FKSITIES819550 FOREIGN KEY (COUNTRY_ID) REFERENCES COUNTRIES (COUNTRY_ID);
ALTER TABLE COUNTRIES ADD CONSTRAINT FKCOUNTRIES631556 FOREIGN KEY (REGION_ID) REFERENCES REGIONS (REGION_ID);
ALTER TABLE COUNTRIES ADD CONSTRAINT FKCOUNTRIES264430 FOREIGN KEY (CONTINENT_ID) REFERENCES CONTINENTS (CONTINENT_ID);
ALTER TABLE COUNTRIES ADD CONSTRAINT FKCOUNTRIES159421 FOREIGN KEY (CURRENCY_ID) REFERENCES CURRENCIES (CURRENCY_ID);
