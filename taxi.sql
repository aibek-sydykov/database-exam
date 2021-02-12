psql postgres
CREATE DATABASE kurut_taxi;
\q
psql kurut_taxi

CREATE TABLE automobile (
    id bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY, 
    brand varchar(255) NOT NULL, 
    model varchar(255) NOT NULL, 
    fuel varchar(255) NOT NULL, 
    engine_volume float, 
    transmission varchar(255) NOT NULL, 
    year integer, 
    colour varchar(255) NOT NULL
);

INSERT INTO automobile (brand, model, fuel, engine_volume, transmission, year, colour) VALUES ('BMW', 'X5', 'diesel', 4.5, 'automatic', 2019, 'black');
INSERT INTO automobile (brand, model, fuel, engine_volume, transmission, year, colour) VALUES ('BMW', 'X5', 'benzin', 5.0, 'automatic', 2015, 'grey');
INSERT INTO automobile (brand, model, fuel, engine_volume, transmission, year, colour) VALUES ('BMW', 'X5', 'electro', 550.0, 'mechanic', 2020, 'white');
INSERT INTO automobile (brand, model, fuel, engine_volume, transmission, year, colour) VALUES ('Mercedes', 's350', 'benzin', 4.5, 'automatic', 2016, 'grey');
INSERT INTO automobile (brand, model, fuel, engine_volume, transmission, year, colour) VALUES ('Mercedes', 's350', 'diesel', 5.5, 'mechanic', 2012, 'black');
INSERT INTO automobile (brand, model, fuel, engine_volume, transmission, year, colour) VALUES ('Mercedes', 's350', 'electro', 500.0, 'automatic', 2021, 'white');
INSERT INTO automobile (brand, model, fuel, engine_volume, transmission, year, colour) VALUES ('Toyota', 'Camry', 'benzin', 3.5, 'automatic', 2015, 'black');
INSERT INTO automobile (brand, model, fuel, engine_volume, transmission, year, colour) VALUES ('Toyota', 'Camry', 'electro', 300.0, 'mechanic', 2021, 'white');
INSERT INTO automobile (brand, model, fuel, engine_volume, transmission, year, colour) VALUES ('Toyota', 'Camry', 'diesel', 4.0, 'automatic', 2016, 'grey');
INSERT INTO automobile (brand, model, fuel, engine_volume, transmission, year, colour) VALUES ('Mercedes', 's350', 'benzin', 5.0, 'mechanic', 2014, 'grey');
INSERT INTO automobile (brand, model, fuel, engine_volume, transmission, year, colour) VALUES ('Toyota', 'Camry', 'benzin', 3.0, 'automatic', 2013, 'black');


CREATE TABLE drivers (
    id bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY, 
    name varchar(255) NOT NULL, 
    surname varchar(255) NOT NULL, 
    birthday DATE, 
    experience integer, 
    gender varchar(255) NOT NULL, 
    auto_id bigint REFERENCES automobile (id)
);

INSERT INTO drivers (name, surname, birthday, experience, gender, auto_id) VALUES ('Калыбек', 'Максатов', '1975-09-10', 4, 'male', 1);
INSERT INTO drivers (name, surname, birthday, experience, gender, auto_id) VALUES ('Алмаз', 'Базарбаев', '1980-03-01', 5, 'male', 2);
INSERT INTO drivers (name, surname, birthday, experience, gender, auto_id) VALUES ('Кимчирик', 'Депутатов', '2000-04-06', 1, 'male', 3);
INSERT INTO drivers (name, surname, birthday, experience, gender, auto_id) VALUES ('Аселя', 'Инстаграммовна', '1978-08-03', 2, 'female', 4);
INSERT INTO drivers (name, surname, birthday, experience, gender, auto_id) VALUES ('Турдакун', 'Ашотов', '1974-01-12', 7, 'male', 5);
INSERT INTO drivers (name, surname, birthday, experience, gender, auto_id) VALUES ('Абдула', 'Керимкулов', '1990-11-22', 0, 'male', 6);
INSERT INTO drivers (name, surname, birthday, experience, gender, auto_id) VALUES ('Азамат', 'Шаршенов', '1974-05-12', 9, 'male', 7);
INSERT INTO drivers (name, surname, birthday, experience, gender, auto_id) VALUES ('Оксана', 'Крутяковна', '1960-03-01', 12, 'female', 8);
INSERT INTO drivers (name, surname, birthday, experience, gender, auto_id) VALUES ('Четкий', 'Мужиков', '1945-10-10', 20, 'male', 9);
INSERT INTO drivers (name, surname, birthday, experience, gender, auto_id) VALUES ('Алексей', 'Смирнов', '1955-02-19', 16, 'male', 10);
INSERT INTO drivers (name, surname, birthday, experience, gender, auto_id) VALUES ('Кудайберген', 'Сансанов', '1977-10-04', 9, 'male', 11);

CREATE TABLE operators (
    id bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY, 
    name varchar(255) NOT NULL, 
    surname varchar(255) NOT NULL, 
    birthday DATE, 
    gender varchar(255) NOT NULL
);

INSERT INTO operators (name, surname, birthday, gender) VALUES ('Светлана', 'Сансановна', '1977-10-04', 'female');
INSERT INTO operators (name, surname, birthday, gender) VALUES ('Оксана', 'Светлановна', '1978-11-05', 'female');
INSERT INTO operators (name, surname, birthday, gender) VALUES ('Александра', 'Оксановна', '1979-12-06', 'female');
INSERT INTO operators (name, surname, birthday, gender) VALUES ('Рустам', 'Кылычев', '1980-01-07', 'male');
INSERT INTO operators (name, surname, birthday, gender) VALUES ('Жамиля', 'Шикова', '1981-02-08', 'female');
INSERT INTO operators (name, surname, birthday, gender) VALUES ('Айзада', 'Айтемирова', '1982-03-09', 'female');
INSERT INTO operators (name, surname, birthday, gender) VALUES ('Вероника', 'Кан', '1983-04-10', 'female');
INSERT INTO operators (name, surname, birthday, gender) VALUES ('Айдар', 'Офигеваев', '1984-05-11', 'male');
INSERT INTO operators (name, surname, birthday, gender) VALUES ('Анастасия', 'Юрова', '1985-06-12', 'female');
INSERT INTO operators (name, surname, birthday, gender) VALUES ('Алмагул', 'Кулова', '1986-07-13', 'female');
INSERT INTO operators (name, surname, birthday, gender) VALUES ('Ширин', 'Асанова', '1987-08-14', 'female');

SELECT * from automobile WHERE brand = 'Toyota' AND model = 'Camry' ORDER BY year DESC;

SELECT DISTINCT name FROM operators ORDER BY NAME DESC LIMIT 10;

UPDATE automobile SET brand = 'Mersus' WHERE brand = 'Mercedes';

DELETE from drivers WHERE name = 'Азамат' AND surname = 'Азаматов';

SELECT COUNT(*) AS amount_drivers FROM drivers WHERE gender = 'female' AND experience > 10 GROUP BY experience;

SELECT AVG(experience) FROM drivers WHERE birthday > '1975-10-10';

SELECT name, surname, brand, model FROM drivers INNER JOIN automobile ON automobile.id = drivers.auto_id;

SELECT brand, COUNT(*) AS amount_cars FROM automobile GROUP BY brand ORDER BY amount_cars DESC;

SELECT name, surname, COUNT(*) AS driven_cars FROM drivers GROUP BY name, surname, auto_id ORDER BY driven_cars DESC;

