Algoritmo Proyecto1_MC_Sistema_de_Costos

	
	// Definir arreglo con los productos
    Dimension modelosZapatillas[10]
    Dimension preciosZapatillas[10]
	
    // Completar el arreglo con los atributos de los productos
    modelosZapatillas[1] <- "ADIDAS SAMBA"
    modelosZapatillas[2] <- "NEW BALANCE 550"
    modelosZapatillas[3] <- "NIKE AIR MAX PLUS"
    modelosZapatillas[4] <- "NIKE AIR JORDAN 1"
    modelosZapatillas[5] <- "ASIC GEL 1090"
	modelosZapatillas[6] <- "NEW BALANCE 990V5"
    modelosZapatillas[7] <- "VEJA NOVA HT"
    modelosZapatillas[8] <- "SALOMON XT-6"
	modelosZapatillas[9] <- "NIKE AIR FORCE 1"
    modelosZapatillas[10] <- "ADIDAS FORUM LOW"

	
    preciosZapatillas[1] <- 100
    preciosZapatillas[2] <- 90
    preciosZapatillas[3] <- 130
    preciosZapatillas[4] <- 135
    preciosZapatillas[5] <- 85
	preciosZapatillas[6] <- 80
    preciosZapatillas[7] <- 120
    preciosZapatillas[8] <- 90
    preciosZapatillas[9] <- 140
    preciosZapatillas[10] <- 95
	
	// Definir arreglo con las opciones de destino
	Dimension destinosEnvios[3]
	Dimension costoEnviosFijo[3]
	
	// Completar el arreglo con los atributos de los envios
    destinosEnvios[1] <- "Local - Dentro del gran Santiago"
    destinosEnvios[2] <- "Nacional"
    destinosEnvios[3] <- "Internacional"
	
	
    costoEnviosFijo[1] <- 5
    costoEnviosFijo[2] <- 10
    costoEnviosFijo[3] <- 20
	
	// Definir los datos constantes
	PorcentajeIVA <- 0.19
	PorcentajeDescuentoCantidad <- 0.05
	costoEnviosVar <- 2
	
	// Inicializar Variables
	numeroZapatillaComoValido <- Falso
	destinoEnvioComoValido <- Falso
	
    // Mostrar catálogo de zapatillas
	Escribir "-----------------------------------"
    Escribir "Catálogo de Zapatillas:"
	Escribir "-----------------------------------"
		Para zapatilla <- 1 Hasta 10 Hacer
			Escribir zapatilla, ". ", modelosZapatillas[zapatilla], " - USD $", preciosZapatillas[zapatilla]
		FinPara
	Escribir "-----------------------------------"
	
	// Leer el número de la zapatilla seleccionada
	Mientras No numeroZapatillaComoValido Hacer
		Escribir "Ingrese el número de la zapatilla que desea comprar:"
		Leer numeroZapatilla
			
		// Validar número de zapatilla
		Si numeroZapatilla >= 1 y numeroZapatilla <= 10 Entonces
			// Obtener el precio de la zapatilla seleccionada
			precioZapatillaSeleccionada <- preciosZapatillas[numeroZapatilla]
			modeloZapatillaSeleccionada <- modelosZapatillas[numeroZapatilla]
			numeroZapatillaComoValido <- Verdadero
		SiNo
			Escribir "Número de zapatilla no válido. Intente nuevamente."
		FinSi
	FinMientras
		
	// Mostrar el precio de la zapatilla seleccionada
	    Escribir "-----------------------------------------------------"
		Escribir "Modelo de la Zapatilla seleccionada: ", modeloZapatillaSeleccionada
        Escribir "Precio de la Zapatilla seleccionada: USD $", precioZapatillaSeleccionada
		Escribir "-----------------------------------------------------"
		
	// Aplicar descuento si es aplicable
	Escribir "¿Tiene un cupón de descuento? (S/N):"
		Leer respuestaCupon
			Si Minusculas(respuestaCupon) = "s" Entonces
				Escribir "Ingrese el porcentaje de descuento del cupón: (%)"
				Leer porcentajeDescuento
				descuentoCupon <- precioZapatillaSeleccionada * (porcentajeDescuento / 100)
			Sino
				descuentoCupon <- 0
			FinSi
		precioConDctoCupon <- precioZapatillaSeleccionada - descuentoCupon
		
	// Aplicar impuestos
	impuestoIVA <- PorcentajeIVA * precioConDctoCupon
	precioConIVA <- precioConDctoCupon + impuestoIVA
		
	// Aplicar descuento por cantidad si el cliente compra más de un par de zapatillas
	Escribir "¿Cuántos pares de zapatillas va a comprar? Válido solo para el mismo modelo de zapatillas."
		Leer cantidadProductos
			Si cantidadProductos > 1 Entonces
				descuentoCantidad <- PorcentajeDescuentoCantidad * precioConIVA 
			Sino
				descuentoCantidad <- 0
			FinSi
		precioConDctoEnvio <- precioConIVA - descuentoCantidad				
		
		// Mostrar catálogo de envios
	    Escribir "-----------------------------------------------------------------------------------------------"
		Escribir "Opciones de Envío:"
	    Escribir "-----------------------------------------------------------------------------------------------"
		Para envio <- 1 Hasta 3 Hacer
			Escribir envio, ". ", destinosEnvios[envio], " - USD $", costoEnviosFijo[envio]," Cobro fijo + USD $", costoEnviosVar," por Kg de peso del paquete."
		FinPara	
	    Escribir "-----------------------------------------------------------------------------------------------"
		
	//Validar destino de envío
	Mientras No destinoEnvioComoValido Hacer 	
		Escribir "Ingrese el número del destino de envío:"
		Leer destinoEnvio
	
		Segun destinoEnvio Hacer
			Caso 1, 2, 3:
				destinoEnvioComoValido <-Verdadero
			OtroCaso:
				Escribir "Destino de envío no válido. Intente nuevamente."
		FinSegun
	FinMientras
	
	//Calcular el costo de envío
		Escribir "Ingrese el peso del paquete en kilogramos:"
		Leer pesoPaquete
		
		Segun destinoEnvio Hacer
			Caso 1:
				costoEnvio <- costoEnviosFijo[1] + (costoEnviosVar* pesoPaquete) 
			Caso 2:
				costoEnvio <- costoEnviosFijo[2] + (costoEnviosVar* pesoPaquete) 
			Caso 3:
				costoEnvio <- costoEnviosFijo[3] + (costoEnviosVar* pesoPaquete) 
			OtroCaso:
				costoEnvio <- 0
		FinSegun
	// Calcular el costo final del producto
		costoFinal <- (precioConDctoEnvio*cantidadProductos) + costoEnvio
		
	// Mostrar el resultado
		Escribir "-------------------------------------------"
		Escribir "Detalle de la Compra"
		Escribir "-------------------------------------------"
		Escribir "Modelo Zapatilla: ", modeloZapatillaSeleccionada
		Escribir "Precio Original: USD $", precioZapatillaSeleccionada
		Escribir "Descuento por Cupón: USD $", descuentoCupon
		Escribir "Impuestos (IVA 19%): USD $", impuestoIVA
		Escribir "Descuento por Cantidad (5%): USD $", descuentoCantidad
		Escribir "-------------------------------------------"
		Escribir "Subtotal: USD $", precioConDctoEnvio
		Escribir "Costo de Envío: USD $", costoEnvio
		Escribir "-------------------------------------------"
		Escribir "Total: USD $", costoFinal
		Escribir "-------------------------------------------"
		
FinAlgoritmo
