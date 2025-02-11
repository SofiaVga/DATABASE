CREATE DATABASE libreria;
USE libreria;

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL,
    rol ENUM('admin', 'empleado') NOT NULL
);

CREATE TABLE categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE libros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    isbn VARCHAR(13) NOT NULL,
    titulo VARCHAR(255) NOT NULL,
    autor VARCHAR(255) NOT NULL,
    editorial VARCHAR(255),
    precio DECIMAL(10, 2) NOT NULL,
    cantidad_stock INT NOT NULL,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id)
);

INSERT INTO categorias (nombre) VALUES ('Novela'), ('Ciencia'), ('Historia');

zINSERT INTO libros (isbn, titulo, autor, editorial, precio, cantidad_stock, id_categoria)
VALUES
('1234567890123', 'Libro 1', 'Autor A', 'Editorial X', 150.00, 10, 1),
('9876543210123', 'Libro 2', 'Autor B', 'Editorial Y', 200.00, 5, 2),
('5678901234567', 'Libro 3', 'Autor C', 'Editorial Z', 120.00, 15, 3);
