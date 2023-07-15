create table province_available(
    id_province int primary key,
    province_name varchar(100),
    code_province int
);

create table hotel(
    id_hotel int primary key,
    hotel_name varchar(200),
    address varchar(200),
    id_province int REFERENCES province_available(id_province)
);

create table receptionist(
    id_employee int primary key,
    first_name varchar(200),
    last_name varchar(200),
    password varchar(50),
    email varchar(100),
    work_contact int,
    id_hotel int REFERENCES hotel(id_hotel)
);

create table client(
    id_client int primary key,
    name varchar(200),
    last_name varchar(200),
    principal_contact varchar(50),
    address varchar(200),
    emergency_number varchar(50),
    gender char(1),
    CIN int,
    email varchar(100),
    password varchar(50),
    id_employee int REFERENCES receptionist(id_employee)
);

create table service(
    id_service int primary key,
    service_name varchar(200),
    description varchar(200),
    price float,
    reduction float
);


create table buy(
    id_buy serial primary key,
    id_client int REFERENCES client(id_client),
    id_service int REFERENCES service(id_service)
);

create table feedback(
    id_feedback serial primary key,
    comment text,
    rating int,
    id_client int REFERENCES client(id_client)
);

create table status_client(
    id_status_client int primary key,
    status_arrived int,
    status_missing int,
    in_fidelity boolean,
    in_blacklist boolean,
    id_client int REFERENCES client(id_client)
);

create table reservation(
    id_reservation int primary key,
    date_arrived date,
    leaving_date date,
    number_of_person int,
    is_canceled boolean,
    id_client int REFERENCES client(id_client)
);

create table payment(
    id_payment serial primary key,
    payment_date date,
    amount_paid float,
    number_night int,
    room_occupied int,
    deadline_payment varchar(200),
    lending_status boolean,
    total_amount_status boolean,
    id_client int REFERENCES client(id_client),
    id_employee int REFERENCES receptionist(id_employee)
);

create table payment_method(
    id_payment_method serial primary key,
    mobile_money boolean,
    credit_card boolean,
    cash boolean
);

create table choose(
    id_choose serial primary key,
    id_payment int REFERENCES payment(id_payment),
    id_payment_method int REFERENCES payment_method(id_payment_method)
);

create table room_features(
    id_features int primary key,
    sea_view boolean,
    vip_category boolean,
    hot_water boolean,
    wifi_available boolean,
    room_service boolean,
    mini_bar boolean,
    flat_screen boolean
);

create table room (
    id_room serial primary key,
    number varchar(100),
    room_type varchar(200),
    capacity_room int,
    id_reservation int REFERENCES reservation(id_reservation),
    id_hotel int REFERENCES hotel(id_hotel),
    id_features int REFERENCES room_features(id_features)
);

create table promotion(
    id_promotion serial primary key,
    name varchar(100),
    "begin" date,
    "end" date,
    percent int
);

create table have(
    id_have serial primary key,
    id_room int REFERENCES room(id_room),
    id_promotion int REFERENCES promotion(id_promotion)
);

create table season(
    id_season int primary key,
    times varchar(50),
    start_date date,
    end_date date
);

create table price(
    id_price_by_season serial primary key,
    cost_per_night float(50),
    id_room int REFERENCES room(id_room),
    id_season int REFERENCES season(id_season)
);