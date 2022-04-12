-- 1. Crear base de datos llamada blog.
CREATE DATABASE blog_db;

-- 2. Crear las tablas indicadas de acuerdo al modelo de datos.
CREATE TABLE usuarios (id INT PRIMARY KEY, email VARCHAR(50));
CREATE TABLE post (id INT PRIMARY KEY, usuarios_id_fk INT NOT NULL, titulo VARCHAR(100), fecha DATE, FOREIGN KEY (usuarios_id_fk) REFERENCES usuarios(id));
CREATE TABLE comentarios (id INT PRIMARY KEY, post_id_fk INT NOT NULL, usuarios_id_fk INT NOT NULL, texto VARCHAR(250), fecha DATE,
FOREIGN KEY (post_id_fk) REFERENCES post(id), FOREIGN KEY (usuarios_id_fk) REFERENCES usuarios(id));

-- 3. Vincular las tablas a sus respectivos csv
\COPY usuarios FROM 'C:\Users\CARLOS\Desktop\KATHY\JAVASCRIPT\M5\desafio mi blog\usuarios.csv' csv header;
\COPY post FROM 'C:\Users\CARLOS\Desktop\KATHY\JAVASCRIPT\M5\desafio mi blog\post.csv' csv header;
\COPY comentarios FROM 'C:\Users\CARLOS\Desktop\KATHY\JAVASCRIPT\M5\desafio mi blog\comentarios.csv' csv header;

-- 4. Seleccionar el correo, id y título de todos los post publicados por el usuario 5.
SELECT y.email AS email_usuario, x.id AS id_post, x.titulo AS titulo_post FROM 
( SELECT id, usuarios_id_fk, titulo FROM post WHERE usuarios_id_fk = 5) AS x 
--se selecciona el fk porque sino no identifica que existe en "WHERE"
INNER JOIN usuarios AS y ON x.usuarios_id_fk = y.id; 

-- 5. Listar el correo, id y el detalle de todos los comentarios que no hayan sido realizados
-- por el usuario con email usuario06@hotmail.com.
SELECT usuario.email AS email_usuario, comentario.id AS comentario_id, comentario.texto FROM (SELECT id, usuarios_id_fk, texto FROM comentarios WHERE usuarios_id_fk <> 6) AS comentario
INNER JOIN usuarios AS usuario ON comentario.usuarios_id_fk = usuario.id WHERE usuario.id <> 6; -- <> = != = "no es igual"

-- 6. Listar los usuarios que no han publicado ningún post.
SELECT usuarios.id, usuarios.email FROM usuarios FULL OUTER JOIN post ON usuarios.id = post.usuarios_id_fk WHERE post.usuarios_id_fk is null;

-- 7. Listar todos los post con sus comentarios (incluyendo aquellos que no poseen
-- comentarios).
SELECT * FROM post LEFT JOIN comentarios on post.id = comentarios.post_id_fk;

-- 8. Listar todos los usuarios que hayan publicado un post en Junio
SELECT u.id AS usuario_id, u.email AS usuario_email, p.titulo AS titulo_post, p.fecha AS fecha_post 
FROM (SELECT * FROM post WHERE fecha BETWEEN '2020/06/01' and '2020/06/30') AS p INNER JOIN usuarios AS u ON u.id = p.usuarios_id_fk;
