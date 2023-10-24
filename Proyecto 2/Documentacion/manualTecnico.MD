# Manual De Usuario
# Proyecto 2 Arquitectura de Computadores y Ensambladores 1

## **Objetivos e Información del Sistema**

Este programa hecho en assembler se trata de un CRUD de usuarios, en el que se pueden ingresar usuarios y guardarlos en disco duro. Este también tiene un juego el cuál se trata de crusar la calle con un personaje mientras se esquivan los automóviles.


## Requisitos del sistema

------------
*  DOSBox
* MASM611

## Lenguaje de Programación y detalles del programa

Se decidió utilizar el lenguaje de programación assembler para la realización de la práctica. También se utilizó el modelo de memoria small y un stack de 1024 Bytes.

Y cuenta con un buffer para leer las entradas del teclado llamado buffer_nombre.

### Subrutinas

#### Comprobar_Usuario

Comprueba las reglas que el nombre de usuario debe seguir, recibe un buffer en SI y da como salida 01 en Al si cumple y 00 si no.

#### Comprobar_Contra

Comprueba las reglas que la contraseña debe seguir, recibe un buffer en SI y da como salida 01 en Al si cumple y 00 si no.

#### Copiar_cadena

Mueve cadenas de una parte de la memoria a otra, recibe en Si el buffer, y en di en donde se quiere guardar lo capturado por el buffer.

#### comparar_cadenas

Recibe 2 cadenas, una en SI, y otra en DI; y compara si son iguales.

#### limpiar_pantalla

Limpia los pixeles de la pantalla.

#### sub_ret

Recibe un numero de 4 bytes en SI, y esta rutina crea un retardo que depende del numero en si.

#### imprimir_mapa

Imprime el mapa del juego en pantalla, se guía de la variable mapaJuego.

#### reiniciar_mapa

Reinicia todos los elementos que necesita el mapa del juego para comenzar una nueva partida.

#### obtener_mapa

Obtiene el objeto que contiene cada celda del mapa.Recibe coordenadas con SI siendo x, y DI siendo Y.

#### colocar_mapa

Coloca el objeto que se tiene en Al a la celda indicada con coordenadas recibidas con Si siendo x, y Di siendo Y.

#### iniciar_juego

Prepara todas las cosas necesarias para iniciar el juego.

#### escribir_usuario

Se encarga de escribir el usuario que se registró en el menú.

