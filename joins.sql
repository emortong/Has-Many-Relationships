
SELECT * FROM users;

SELECT * FROM posts WHERE users_id = 100;

SELECT first_name, last_name, posts.*
  FROM users
    INNER JOIN posts ON posts.users_id = users.id
      WHERE users.id = 200;

SELECT username, posts.*
  FROM users
    INNER JOIN posts ON posts.users_id = users.id
      WHERE users.first_name = 'Norene' AND users.last_name = 'Schmitt';

SELECT username
  FROM users
    INNER JOIN posts ON posts.users_id = users.id
      WHERE posts.created_at >= '2015-01-01';

SELECT users.username, title, content
  FROM posts
    INNER JOIN users ON posts.users_id = users.id
      WHERE users.created_at < '2015-01-01';

SELECT comments.*, posts.title AS post_title
  FROM posts
  INNER JOIN comments ON comments.posts_id = posts.id;

SELECT comments.*, comments.body AS comment_body,  title AS post_title, url AS post_url
  FROM posts
    INNER JOIN comments ON comments.posts_id = posts.id
      WHERE posts.created_at < '2015-01-01';

SELECT comments.*, comments.body AS comment_body,  title AS post_title, url AS post_url
  FROM posts
    INNER JOIN comments ON comments.posts_id = posts.id
      WHERE posts.created_at > '2015-01-01';

SELECT comments.*, comments.body AS comment_body,  title AS post_title, url AS post_url
  FROM posts
    INNER JOIN comments ON comments.posts_id = posts.id
      WHERE comments.body LIKE '%USB%';

SELECT first_name, last_name, posts.title AS post_title, comments.body
  FROM users
    INNER JOIN posts ON posts.users_id = users.id
    INNER JOIN comments ON comments.posts_id = posts.id
      WHERE comments.body LIKE '%matrix%';

SELECT first_name, last_name, comments.body AS comment_body
  FROM users
    INNER JOIN posts ON posts.users_id = users.id
    INNER JOIN comments ON comments.posts_id = posts.id
      WHERE comments.body LIKE '%SSL%' AND posts.content LIKE '%dolorum%';

SELECT first_name AS post_author_first_name, last_name AS post_author_last_name, posts.title AS post_title,
username AS comment_author_username, comments.body AS comment_body
  FROM users
    INNER JOIN posts ON posts.users_id = users.id
    INNER JOIN comments ON comments.posts_id = posts.id
      WHERE (comments.body LIKE '%SSL%' OR comments.body LIKE '%firewall%') AND posts.content LIKE '%nemo%';



