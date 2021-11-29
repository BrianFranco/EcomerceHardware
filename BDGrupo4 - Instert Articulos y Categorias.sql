USE [BDGrupo4]
GO


INSERT [dbo].[Categorias] (
[NombreCat]
) 
VALUES (
N'Procesador AMD'
)

INSERT [dbo].[Categorias] (
[NombreCat]
) 
VALUES (
N'Procesador Intel'
)

INSERT [dbo].[Categorias] (
[NombreCat]
) 
VALUES (
N'Placa Madre'
)

INSERT [dbo].[Categorias] (
[NombreCat]
) 
VALUES (
N'Cooler - Ventilador'
)

INSERT [dbo].[Categorias] (
[NombreCat]
) 
VALUES (
N'Cooler - Refrigeracion Liquida'
)

INSERT [dbo].[Categorias] (
[NombreCat]
) 
VALUES (
N'Placa de Video Nvidia'
)

INSERT [dbo].[Categorias] (
[NombreCat]
) 
VALUES (
N'Placa de Video AMD'
)

INSERT [dbo].[Categorias] (
[NombreCat]
) 
VALUES (
N'Fuente de alimentacion Thermaltake'
)

INSERT [dbo].[Categorias] (
[NombreCat]
) 
VALUES (
N'Fuente de alimentacion Corsair'
)

INSERT [dbo].[Categorias] (
[NombreCat]
) 
VALUES (
N'Memoria HDD'
)

INSERT [dbo].[Categorias] (
[NombreCat]
) 
VALUES (
N'Mouse'
)

INSERT [dbo].[Categorias] (
[NombreCat]
) 
VALUES (
N'Teclado'
)

INSERT [dbo].[Categorias] (
[NombreCat]
) 
VALUES (
N'Monitor'
)

INSERT [dbo].[Categorias] (
[NombreCat]
) 
VALUES (
N'Auriculares'
)

INSERT [dbo].[Categorias] (
[NombreCat]
) 
VALUES (
N'Memoria Ram'
)

GO

INSERT [dbo].[Articulos] (
[Nombre_A],[Descripcion_A],[Cat_A],[PU_A],[Stock_A]
) 
VALUES (
N'AMD Ryzen Threadripper PRO 3000WX',N'Nucleos:64 Threads:128 clock:2.7GHz a 4.2GHz',1,556.5,10
)


INSERT [dbo].[Articulos] (
[Nombre_A],[Descripcion_A],[Cat_A],[PU_A],[Stock_A]
) 
VALUES (
N'Intel Core i9-11900KB Processor',N'Nucleos:8 Cache:24MB clock Turbo 4.9GHz',2,56.5,13
)

INSERT [dbo].[Articulos] (
[Nombre_A],[Descripcion_A],[Cat_A],[PU_A],[Stock_A]
) 
VALUES (
N'Placa Madre Asus Prime A320M-K',N'AMD Chipset AMD A320 Socket AM4 Ram ddr4',3,6.900,25
)

INSERT [dbo].[Articulos] (
[Nombre_A],[Descripcion_A],[Cat_A],[PU_A],[Stock_A]
) 
VALUES (
N'Cooler Brainstorm AR-10 ',N'120mm Led 3 pin o molex 2,9W 1200RPM max',4,1000,36
)

INSERT [dbo].[Articulos] (
[Nombre_A],[Descripcion_A],[Cat_A],[PU_A],[Stock_A]
) 
VALUES (
N'Cooler Liquido Id-cooling Frostflow X',N'AMD TR4 a AM2, Intel LGA 2066 a 1156, TDP 250 W',5,11281,7
)

INSERT [dbo].[Articulos] (
[Nombre_A],[Descripcion_A],[Cat_A],[PU_A],[Stock_A]
) 
VALUES (
N'MSI GeForce 200 N210',N'mem grafica 1Gb ddr3, 589Mhz',6,6649,17
)

INSERT [dbo].[Articulos] (
[Nombre_A],[Descripcion_A],[Cat_A],[PU_A],[Stock_A]
) 
VALUES (
N'Radeon Rx 5700 XT',N'mem grafica 8Gb ddr6',7,343849,4
)

INSERT [dbo].[Articulos] (
[Nombre_A],[Descripcion_A],[Cat_A],[PU_A],[Stock_A]
) 
VALUES (
N'Thermaltake Smart 600w 80',N'Modelo de la fuente	TM-350-PMSR, 350W salida',8,6800,24
)

INSERT [dbo].[Articulos] (
[Nombre_A],[Descripcion_A],[Cat_A],[PU_A],[Stock_A]
) 
VALUES (
N'Corsair CV Series CV650 650W',N'Voltaje 100V/240V, 6 SATA 2 PCI-E',9,7500,18
)

INSERT [dbo].[Articulos] (
[Nombre_A],[Descripcion_A],[Cat_A],[PU_A],[Stock_A]
) 
VALUES (
N'Western Digital WD20EZAZ 2TB',N'SATA III, 5400 rpm, HDD 3,5"',10,6000,14
)

INSERT [dbo].[Articulos] (
[Nombre_A],[Descripcion_A],[Cat_A],[PU_A],[Stock_A]
) 
VALUES (
N'Razer DeathAdder V2 negro',N'Resolución de 20000dpi, 8 botones ',11,5244,25
)

INSERT [dbo].[Articulos] (
[Nombre_A],[Descripcion_A],[Cat_A],[PU_A],[Stock_A]
) 
VALUES (
N'Razer Huntsman Mini QWERTY',N'Inalambrico, opto-mecanico, cable removible',12,13490,25
)

INSERT [dbo].[Articulos] (
[Nombre_A],[Descripcion_A],[Cat_A],[PU_A],[Stock_A]
) 
VALUES (
N'Dell E E2420H led 24"',N'negro, 100V/240V, 250cd/m2, pantalla antireflejo',13,22000,20
)

INSERT [dbo].[Articulos] (
[Nombre_A],[Descripcion_A],[Cat_A],[PU_A],[Stock_A]
) 
VALUES (
N'Auricular Luz Led Ear Cat',N'32OHM, bateria de 7hs, tiempo de carga 2.5hs',14,2300,666
)

INSERT [dbo].[Articulos] (
[Nombre_A],[Descripcion_A],[Cat_A],[PU_A],[Stock_A]
) 
VALUES (
N'RAM 8GB Crucial CT8G4DFS8266',N'DDR4, 2666MHz, tasa de transferencia de 21300 MBs',15,500,22

)

GO

INSERT [dbo].[Usuarios] (
[Dni_U],[Nombre_U],[Apellido_U],[Direccion_U],[Ciudad_U],[Provincia_U],[Email_U],[Contraseña_U],[Administrador_U]
)
VALUES (
'12345678','Claudio','Fernandez','No ingresada','No ingresada','No Ingresada','No Ingresado','12345678',1
)

GO

