drop table if exists action;
drop table if exists comment;
drop table if exists user_match;
drop table if exists `match`;
drop table if exists user;

create table user
(
    id               int primary key auto_increment,
    user_match_id    int,
    user_gropu_id    int,
    username         varchar(50) unique         not null,
    password         varchar(255)               not null,
    name             varchar(50)                not null,
    email            varchar(50) unique         not null,
    random_name      varchar(50) default null,
    role             varchar(50) default 'none' not null,
    aware_role       boolean     default false  not null,
    prev_contributor boolean     default false  not null,
    prev_receiver    boolean     default false  not null,
    is_admin         boolean     default false  not null
);
create table `match`
(
    id            int primary key auto_increment,
    user_match_id int,
    title         varchar(255)           not null,
    match_ymd     datetime default now() not null,
    round         int                    not null,
    `status`      varchar(50)            not null,
    result        boolean  default null
);


create table `group`
(
    id            int primary key auto_increment,
    user_gropu_id int,
    name          varchar(50)            not null,
    created_at    datetime default now() not null,
    code          varchar(255)
);

create table user_match
(
    id             int primary key auto_increment,
    user_id        int                   not null,
    match_id       int                   not null,
    is_contributor boolean default false not null,
    is_receiver    boolean default false not null,
    constraint foreign key (user_id) references user (id) on delete set null,
    constraint foreign key (match_id) references `match` (id) on delete set null
);

create table user_group
(
    id       int primary key auto_increment,
    user_id  int                not null,
    group_id int                not null,
    join_ymd date default now() not null,
    constraint foreign key (user_id) references user (id) on delete set null,
    constraint foreign key (group_id) references `match` (id) on delete set null
);

alter table user
    add constraint foreign key (user_match_id) references user_match (id);
alter table user
    add constraint foreign key (user_gropu_id) references user_group (id);
alter table `match`
    add constraint foreign key (user_match_id) references user_match (id);
alter table `group`
    add constraint foreign key (user_gropu_id) references user_group (id);

create table action
(
    id             int primary key auto_increment,
    type           varchar(50)   not null,
    match_id       int,
    task           text          not null,
    recommendation int default 0 not null,
    constraint foreign key (match_id) references `match` (id)
);

create table comment
(
    id        int primary key auto_increment,
    parent_id int      default null,
    user_id   int                    not null,
    match_id  int                    not null,
    writer    varchar(50)            not null,
    content   text                   not null,
    write_at  datetime default now() not null,
    edited    boolean  default false not null,
    constraint foreign key (user_id) references user (id),
    constraint foreign key (match_id) references `match` (id)
);

show tables;


