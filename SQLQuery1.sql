-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2018-07-24 14:38:52.431

-- tables
-- Table: Asistente
CREATE TABLE Asistente (
    IdAsistente int identity(1,1) ,
    NombreAsistente varchar(100)  ,
    ApellidoAsistente varchar(100)  ,
    CelularAsistente char(10)  ,
    CONSTRAINT Asistente_pk PRIMARY KEY  (IdAsistente)
);

-- Table: Boleto
CREATE TABLE Boleto (
    IdBoleto int identity(1,1) ,
    OrigenBoleto varchar(50)  ,
    DestinoBoleto varchar(50)  ,
    FechaViajeBoleto char(10)  ,
    CostoBoleto char(10)  ,
    HoraPartida char(10)  ,
    Pasajero_IdPasajero int  ,
    Usuario_IdUsuario int  ,
    Bus_IdBus int  ,
    CONSTRAINT Boleto_pk PRIMARY KEY  (IdBoleto)
);

-- Table: Bus
CREATE TABLE Bus (
    IdBus int identity(1,1) ,
    PlacaBus char(10)  ,
    NombreChoferBus varchar(100)  ,
    TelefonoBus char(7)  ,
    ApellidoChoferBus varchar(100)  ,
    Asistente_IdAsistente int  ,
    CONSTRAINT Bus_pk PRIMARY KEY  (IdBus)
);

-- Table: Pasajero
CREATE TABLE Pasajero (
    IdPasajero int identity(1,1) ,
    NombrePasajero varchar(100)  ,
    ApellidoPasajero varchar(100)  ,
    DniPasajero char(8)  ,
    CONSTRAINT Pasajero_pk PRIMARY KEY  (IdPasajero)
);

-- Table: Usuario
CREATE TABLE Usuario (
    IdUsuario int identity(1,1) ,
    NombreUsuario varchar(100)  ,
    ApellidoUsuario varchar(100)  ,
    CelularUsuario char(9)  ,
    CONSTRAINT Usuario_pk PRIMARY KEY  (IdUsuario)
);

-- foreign keys
-- Reference: Boleto_Bus (table: Boleto)
ALTER TABLE Boleto ADD CONSTRAINT Boleto_Bus
    FOREIGN KEY (Bus_IdBus)
    REFERENCES Bus (IdBus);

-- Reference: Boleto_Pasajero (table: Boleto)
ALTER TABLE Boleto ADD CONSTRAINT Boleto_Pasajero
    FOREIGN KEY (Pasajero_IdPasajero)
    REFERENCES Pasajero (IdPasajero);

-- Reference: Boleto_Usuario (table: Boleto)
ALTER TABLE Boleto ADD CONSTRAINT Boleto_Usuario
    FOREIGN KEY (Usuario_IdUsuario)
    REFERENCES Usuario (IdUsuario);

-- Reference: Bus_Asistente (table: Bus)
ALTER TABLE Bus ADD CONSTRAINT Bus_Asistente
    FOREIGN KEY (Asistente_IdAsistente)
    REFERENCES Asistente (IdAsistente);

-- End of file.

select * from Usuario

select * from Bus;

CREATE VIEW VW_BUS
AS
SELECT PlacaBus,UPPER(NombreChoferBus) AS 'Nombre Chofer',UPPER(ApellidoChoferBus) AS 'Apellido Chofer',TelefonoBus,
UPPER(CONCAT(Asistente.NombreAsistente,',',Asistente.ApellidoAsistente)) AS 'Asistente',
Asistente.CelularAsistente
FROM Bus
INNER JOIN Asistente ON Bus.Asistente_IdAsistente = Asistente.IdAsistente