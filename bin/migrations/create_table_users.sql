create table if not exists users(
    id integer primary key autoincrement,
    username varchar(255) not null,
    password varchar(255) not null,
    createdAt timestamp default current_timestamp,
    updatedAt timestamp default current_timestamp
);