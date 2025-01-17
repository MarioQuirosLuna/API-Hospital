--CREACI�N DE LA BASE DE DATOS
CREATE DATABASE CLINICA_SALUD
GO

USE CLINICA_SALUD;

--CONSULTORIO
CREATE TABLE CONSULTORIO
(
	ID_CONSULTORIO INT PRIMARY KEY IDENTITY(1,1),
	NUM_PISO INT NOT NULL
)

--PERSONA
CREATE TABLE PERSONA
(
	CEDULA INT PRIMARY KEY NOT NULL,
	NOMBRE VARCHAR(20) NOT NULL
)

--MEDICO
CREATE TABLE MEDICO
(
	ID_MEDICO INT PRIMARY KEY IDENTITY(1,1),
	FK_CEDULA INT NOT NULL,
	FK_ID_CONSULTORIO INT NOT NULL,
	CONSTRAINT FK_CEDULA FOREIGN KEY (FK_CEDULA) REFERENCES PERSONA (CEDULA),
	CONSTRAINT FK_ID_CONSULTORIO FOREIGN KEY (FK_ID_CONSULTORIO) REFERENCES CONSULTORIO (ID_CONSULTORIO)
)

--PACIENTE
CREATE TABLE PACIENTE
(
	ID_PACIENTE INT PRIMARY KEY IDENTITY(1,1),
	FK_CEDULA_PACIENTE INT NOT NULL,
	CONSTRAINT FK_CEDULA_PACIENTE FOREIGN KEY (FK_CEDULA_PACIENTE) REFERENCES PERSONA (CEDULA)
)

--ENFERMEDAD
CREATE TABLE ENFERMEDAD
(
	ID_ENFERMEDAD INT PRIMARY KEY IDENTITY(1,1),
	NOMBRE VARCHAR(30) NOT NULL
)

--ESPECIALIDAD
CREATE TABLE ESPECIALIDAD
(
	ID_ESPECIALIDAD INT PRIMARY KEY IDENTITY(1,1),
	NOMBRE VARCHAR(30) NOT NULL
)

--CONSULTORIO_PACIENTE
CREATE TABLE CONSULTORIO_PACIENTE
(
	ID_CONSULTORIO_PACIENTE INT PRIMARY KEY IDENTITY(1,1),
	FK_CONSULTORIO INT NOT NULL,
	FK_PACIENTE INT NOT NULL,
	CONSTRAINT FK_CONSULTORIO FOREIGN KEY (FK_CONSULTORIO) REFERENCES CONSULTORIO (ID_CONSULTORIO),
	CONSTRAINT FK_PACIENTE FOREIGN KEY (FK_PACIENTE) REFERENCES PACIENTE (ID_PACIENTE)
)

--PACIENTE_ENFERMEDAD
CREATE TABLE PACIENTE_ENFERMEDAD
(
	ID_PACIENTE_ENFERMEDAD INT PRIMARY KEY IDENTITY(1,1),
	FK_ID_PACIENTE INT NOT NULL,
	FK_ID_ENFERMEDAD INT NOT NULL,
	CONSTRAINT FK_ID_PACIENTE FOREIGN KEY (FK_ID_PACIENTE) REFERENCES PACIENTE (ID_PACIENTE),
	CONSTRAINT FK_ID_ENFERMEDAD FOREIGN KEY (FK_ID_ENFERMEDAD) REFERENCES ENFERMEDAD (ID_ENFERMEDAD)
)

--MEDICO_ESPECIALIDAD
CREATE TABLE MEDICO_ESPECIALIDAD
(
	ID_MEDICO_ESPECIALIDAD INT PRIMARY KEY IDENTITY(1,1),
	FK_MEDICO INT NOT NULL,
	FK_ESPECIALIDAD INT NOT NULL,
	CONSTRAINT FK_MEDICO FOREIGN KEY (FK_MEDICO) REFERENCES MEDICO (ID_MEDICO),
	CONSTRAINT FK_ESPECIALIDAD FOREIGN KEY (FK_ESPECIALIDAD) REFERENCES ESPECIALIDAD (ID_ESPECIALIDAD)
)
