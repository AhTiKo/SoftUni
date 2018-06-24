CREATE DATEBASE car_rental;
USE car_rental;
create table categories
(
    id INT(11) AUTO_INCREMENT primary key,
    category varchar(50) not null,
    daily_rate int(3),
    weekly_rate int(3),
    monthly_rate int(3),
    weekend_rate int(3)
);
create table cars
(
    id INT AUTO_INCREMENT primary key,
    plate_number varchar(50) not null,
    make varchar(50),
        model varchar(50),
    car_year int(4),
    category_id INT(11),
    doors INT(2),
    picture blob,
    car_condition varchar(50),
    available bool
);
create table employees
(
    id INT AUTO_INCREMENT primary key,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    title varchar(50),
    notes text
);
create table customers
(
    id INT AUTO_INCREMENT primary key,
    driver_licence_number int(11) not null,
    full_name varchar(50),
    address varchar(50),
    city varchar(50),
    zip_code int(5),
    notes text
);
 
create table rental_orders
(
    id INT AUTO_INCREMENT primary key,
    employee_id int(11) not null,
    customer_id int(11),
    car_id int(11) not null,
    car_condition varchar(50),
    tank_level INT(11),
    kilometrage_start int(11),
    kilometrage_end int(11),
    total_kilometrage int(11),
    start_date date,
    end_date date,
    total_days INT(11),
    rate_applied INT(3),
    tax_rate INT(11),
    order_status varchar(50),
    notes text
);
insert into cars(plate_number)
values ('123'),('1234'),('12345');
insert into categories(category)
values ('Classic'),('Limuzine'),('Sport');
insert into customers(driver_licence_number)
values ('2232'),('232323'),('111');
insert into employees(first_name,last_name)
values ('Ivan', 'Ivanov'),('Ivan1', 'Ivanov1'), ('Ivan2', 'Ivanov2');
insert into rental_orders(employee_id,car_id)
values (1, 1),(1, 2), (2, 3);