--Prueba Stored Procedure
--INSERTAR NUEVO CLIENTE
SELECT insertarnuevocliente('Mike','Hillyer','Antonio','Rodríguez','email.com','Colombia','Buenaventura','Zarcero','Zarcero','Tapezco','123','12345678')
--firstnamestaff ,lastnamestaff ,firstname ,lastname ,email ,country ,pcity ,paddress ,paddress2 ,pdistrict ,ppostalcode , pphone ,

--REGISTRAR UN ALQUILER.
SELECT registraralquiler('Antonio','Rodríguez','Mike','Hillyer','2021-05-21 20:00:00','Academy Dinosaur','English',99.9)
--firstname ,lastname ,firstnamesatff ,lastnamestaff ,fechadevolucion ,nombrepelicula ,idiomapelicula ,pago 

--REGISTRAR UNA DEVOLUCIÓN
SELECT registrardevolucion('Antonio','Rodríguez','Mike','Hillyer','Academy Dinosaur','English')
--firstname character varying,lastname ,firstnamesatff ,lastnamestaff ,nombrepelicula ,idiomapelicula

--BUSCAR PELÏCULA
SELECT buscarpelicula('Academy Dinosaur','English')
--ptitle ,plenguaje 


--INSERTAR PELÍCULA
SELECT insertarpelicula('Mike','Hillyer','PRUEBA','DESCRIPCIÓN',2021,'English',55,5,50,5.6, 'full text','Action',3)
--firstnamesatff ,lastnamestaff ,ptitle ,pdescripcion ,prelease_year ,plenguage ,prental_duration ,prental_rate,plength ,preplacement_cost ,fulltext ,pcategoria ,pcopias 

