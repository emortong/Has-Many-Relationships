DROP USER IF EXISTS has_many_user;

CREATE USER has_many_user;

DROP DATABASE IF EXISTS has_many_blogs;

CREATE DATABASE has_many_blogs WITH OWNER has_many_user;

\c has_many_blogs has_many_user;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id serial primary key,
  username character varying(90),
  first_name character varying(90),
  last_name character varying(90),
  created_at timestamp with time zone DEFAULT now(),
  updated_at timestamp with time zone DEFAULT now()
);

CREATE TABLE posts (
  id serial primary key,
  title character varying(180),
  url character varying(510),
  content text,
  created_at timestamp with time zone DEFAULT now(),
  updated_at timestamp with time zone DEFAULT now(),
  users_id integer references users(id)
);

CREATE TABLE comments (
  id serial primary key,
  body character varying(510),
  created_at timestamp with time zone DEFAULT now(),
  updated_at timestamp with time zone DEFAULT now(),
  users_id integer references users(id),
  posts_id integer references posts(id)
);

\i scripts/blog_data.sql;

