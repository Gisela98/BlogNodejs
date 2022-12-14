CREATE TABLE "users" (
  "id_user" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "password" varchar NOT NULL,
  "age" int NOT NULL
);

CREATE TABLE "categories" (
  "id_category" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "posts" (
  "id_post" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "title" varchar NOT NULL,
  "description" varchar(250),
  "content" varchar NOT NULL,
  "id_author" int,
  "id_category" int
);

CREATE TABLE "authors" (
  "id_author" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar NOT NULL,
  "age" int NOT NULL,
  "email" varchar NOT NULL,
  "password" varchar NOT NULL
);

CREATE TABLE "comments" (
  "id_comment" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "content" varchar NOT NULL,
  "id_post" int,
  "id_user" int
);

CREATE TABLE "posts_categories" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "id_post" int,
  "id_category" int
);

ALTER TABLE "comments" ADD FOREIGN KEY ("id_post") REFERENCES "posts" ("id_post");

ALTER TABLE "posts_categories" ADD FOREIGN KEY ("id_category") REFERENCES "categories" ("id_category");

ALTER TABLE "posts_categories" ADD FOREIGN KEY ("id_post") REFERENCES "posts" ("id_post");

ALTER TABLE "comments" ADD FOREIGN KEY ("id_user") REFERENCES "users" ("id_user");

ALTER TABLE "posts" ADD FOREIGN KEY ("id_author") REFERENCES "authors" ("id_author");



insert into "users" ("name", "age", "email", "password") values ('Gisella', 24 , 'ga@gmail.com', 'hello'), ('santiago', 28, 'srmarin@gmail.com', 'srm');

insert into "categories" ("name") values ('car'), ('van'), ('convertible'), ('buggy');

insert into "authors" ("name", "age", "email", "password") values 
('Gisel', 24, 'gis@gmail.com', 'ggggg'),
('santi', 28, 'sn@gmail.com', 'sssss');

insert into "posts" ("title", "description", "content", "id_author", "id_category") values 
('There are different types of vehicles in Colombia', 'Its a pretty broad topic and understanding it can be a little tricky', 'Therefore we decided to help you with this issue'
, 2 , 2 ),
('There are different types of vehicles in colombia', 'Its a pretty broad topic and understanding it can be a little tricky', 'Therefore we decided to help you with this issue'
, 1 , 3 );

insert into "comments" ("content", "id_post", "id_user") values ('I like the car for its comfort', 1 , 2),('like a van', 2, 1);

insert into "posts_categories" ("id_post", "id_category") values (1, 2), (2, 3);