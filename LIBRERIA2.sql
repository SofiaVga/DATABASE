CREATE DATABASE IF NOT EXISTS libreria;
USE libreria;

-- Tabla de usuarios con manejo de roles
CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL,
    rol ENUM('admin', 'empleado') NOT NULL,
    UNIQUE (nombre) -- Evitar usuarios duplicados
);

-- Tabla de categorías para clasificar libros
CREATE TABLE IF NOT EXISTS categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    UNIQUE (nombre) -- Evitar categorías duplicadas
);

-- Tabla de libros con manejo de stock
CREATE TABLE IF NOT EXISTS libros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    isbn VARCHAR(13) NOT NULL UNIQUE,
    titulo VARCHAR(255) NOT NULL,
    autor VARCHAR(255) NOT NULL,
    editorial VARCHAR(255),
    precio DECIMAL(10, 2) NOT NULL CHECK (precio > 0), -- Validación de precios positivos
    cantidad_stock INT NOT NULL CHECK (cantidad_stock >= 0), -- Stock no negativo
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id) ON DELETE SET NULL
);

-- Datos iniciales para categorías
INSERT IGNORE INTO categorias (nombre) VALUES 
('Novela'), 
('Ciencia'), 
('Historia');

-- Datos iniciales para libros
INSERT IGNORE INTO libros (isbn, titulo, autor, editorial, precio, cantidad_stock, id_categoria)
VALUES
('1234567890123', 'Libro 1', 'Autor A', 'Editorial X', 150.00, 10, 1),
('9876543210123', 'Libro 2', 'Autor B', 'Editorial Y', 200.00, 5, 2),
('5678901234567', 'Libro 3', 'Autor C', 'Editorial Z', 120.00, 15, 3),
('3210987654321', 'Libro 4', 'Autor D', 'Editorial X', 180.00, 8, 1),
('8765432109876', 'Libro 5', 'Autor E', 'Editorial W', 90.00, 2, 2);

-- Datos iniciales para usuarios
INSERT IGNORE INTO usuarios (nombre, password, rol) 
VALUES 
('admin', 'adminpassword', 'admin'),
('empleado1', 'empleadopassword', 'empleado');