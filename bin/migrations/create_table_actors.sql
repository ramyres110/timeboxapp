create table if not exists actors(
    id integer primary key autoincrement,
    name varchar(255) not null,
    timebox time not null default '00:00:00',
    createdAt timestamp default current_timestamp,
    updatedAt timestamp default current_timestamp
);