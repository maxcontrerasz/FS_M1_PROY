

# PROYECTO 1: Algoritmo de Sistema de Costos


### 1. Introducción
Este proyecto consiste en un sistema de costos para la compra de zapatillas. Permite a los usuarios seleccionar entre diferentes modelos de zapatillas, aplicar descuentos, impuestos y calcular el costo final basado en el destino de envío y el peso del paquete.

### 2. Planteamiento
Construir un algoritmo en pseudocódigo que simule un sistema para calcular el costo de un producto con base en su precio original y el porcentaje de descuento aplicado. El algoritmo debe cumplir con los siguientes requisitos:

### 3. Requerimientos
- Leer el precio original del producto.
- Aplicar un descuento al producto si es aplicable (por ejemplo, si el cliente tiene un cupón de descuento).
- Aplicar impuestos al producto (por ejemplo, el IVA u otros impuestos).
- Si el cliente compra más de un artículo, aplicar un descuento por cantidad.
- Calcular el costo de envío basado en el destino y el peso del paquete.
- Calcular el costo final del producto sumando el precio con descuento, impuestos, descuento por cantidad y costo de envío.
- Mostrar el costo final del producto, desglosando los diferentes componentes (descuentos, impuestos, descuento por cantidad y costo de envío).
- Contenido del Proyecto

### 4. Contenido del Repositorio
- Proyecto1_MC_Sistema_de_Costos.pseudo: Archivo principal que contiene el código del sistema de costos.
- README.md: Este archivo, que proporciona información sobre el proyecto y su estructura.

### 5. Solución
#### 5.1. Definición de Arreglos y Constantes
Se definen los arreglos con los productos y con las opciones de destino. También las constantes que se usarán más adelante.
```
/ Definir arreglo con los productos
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
```

#### 5.2. Catálogo de Zapatillas
Se presenta un catálogo de 10 modelos de zapatillas con sus respectivos precios. El usuario puede seleccionar una zapatilla ingresando el número correspondiente.
```
    // Mostrar catálogo de zapatillas
	Escribir "-----------------------------------"
    Escribir "Catálogo de Zapatillas:"
	Escribir "-----------------------------------"
		Para zapatilla <- 1 Hasta 10 Hacer
			Escribir zapatilla, ". ", modelosZapatillas[zapatilla], " - USD $", preciosZapatillas[zapatilla]
		FinPara
	Escribir "-----------------------------------"
```
#### 5.3. Selección de Zapatilla
Se solicita al usuario que ingrese el número de la zapatilla que desea comprar. Se valida la entrada para garantizar un número válido.
```
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
		
```
#### 5.4. Aplicación de Descuento por Cupón
Si el usuario tiene un cupón de descuento, puede ingresarlo y se aplica el descuento correspondiente al precio de la zapatilla.
```
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
```
#### 5.5. Aplicación de Impuestos
Se aplica un impuesto del 19% al precio de la zapatilla después de aplicar el descuento por cupón.
```
	// Aplicar impuestos
	impuestoIVA <- PorcentajeIVA * precioConDctoCupon
	precioConIVA <- precioConDctoCupon + impuestoIVA
```
#### 5.6. Descuento por Cantidad
Se ofrece un descuento adicional del 5% si el usuario decide comprar más de un par de zapatillas del mismo modelo.
```
// Aplicar descuento por cantidad si el cliente compra más de un par de zapatillas
	Escribir "¿Cuántos pares de zapatillas va a comprar? Válido solo para el mismo modelo de zapatillas."
		Leer cantidadProductos
			Si cantidadProductos > 1 Entonces
				descuentoCantidad <- PorcentajeDescuentoCantidad * precioConIVA 
			Sino
				descuentoCantidad <- 0
			FinSi
		precioConDctoEnvio <- precioConIVA - descuentoCantidad				
		
```
#### 5.7. Opciones de Envío
Se presentan tres opciones de envío con costos fijos y un costo adicional por kilogramo de peso del paquete.
```
// Mostrar catálogo de envios
	    Escribir "-----------------------------------------------------------------------------------------------"
		Escribir "Opciones de Envío:"
	    Escribir "-----------------------------------------------------------------------------------------------"
		Para envio <- 1 Hasta 3 Hacer
			Escribir envio, ". ", destinosEnvios[envio], " - USD $", costoEnviosFijo[envio]," Cobro fijo + USD $", costoEnviosVar," por Kg de peso del paquete."
		FinPara	
	    Escribir "-----------------------------------------------------------------------------------------------"
		
```
#### 5.8. Validación del Destino de Envío
El usuario debe seleccionar el número correspondiente al destino de envío. Se valida la entrada para garantizar un número válido.
```
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
```
#### 5.9. Cálculo del Costo de Envío
Se solicita al usuario ingresar el peso del paquete, y se calcula el costo de envío según la opción seleccionada.
```
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
```
#### 5.10. Resumen de la Compra
Se muestra un resumen detallado de la compra, incluyendo el modelo de zapatilla, precio original, descuentos, impuestos, subtotal, costo de envío y el costo final.
```
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
```
### 6. Instrucciones de Uso
- Ejecute el programa PseInt.
- Ejecuta el archivo Proyecto1_MC_Sistema_de_Costos.psc
- Sigue las instrucciones presentadas en consola para realizar una simulación de compra.
- Observe el resumen detallado de la compra.

### 7. Conclusión
Este sistema proporciona una manera fácil y transparente para que los usuarios calculen el costo total de su compra de zapatillas, considerando descuentos y opciones de envío.


