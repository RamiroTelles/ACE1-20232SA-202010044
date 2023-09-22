.RADIX 16
.MODEL small
.STACK 1024
.DATA 
usac     db "Universidad de San Carlos de Guatemala",0a,"$"
facultad db "Facultad de Ingenieria",0a,"$"
curso    db "Arquitectura de Computadoras y Ensambladores 1",0a,"$"
seccion db "Seccion A",0a,"$"
nombre db "Nombre: Ramiro Agustin Telles Carcuz",0a,"$"
carnet db "Carnet: 202010044",0a,"$"
mensaje_enter db "Presione \'enter\' para continuar...",0a,"$"
mensaje_enter2 db "Se debe de presionar enter para continuar",0a,"$"
saltoLinea db 0a,"$"


menu0    db "Elija una opcion:",0a, " 1. Jugar PvP",0a, " 2. Jugar PvC",0a, " 3.Cargar Partida",0a," 4.Ayuda",0a," 5.Salir",0a,"$"
mensaje_menu0 db "elija una opcion valida:",0a,"$"

mensaje_pvp db "PvP",0a,"$"
mensaje_pvC db "PvC",0a,"$"
mensaje_cargar db "Cargar Partida",0a,"$"
mensaje_ayuda db "Ayuda",0a,"$"
mensaje_salir db "Saliendo",0a,"$"

mensaje_nombre_1 db "Escriba el nombre del jugador 1: $"
mensaje_nombre_2 db "Escriba el nombre del jugador 2: $"



nombre1         db 00
                db 20 dup (00)
nombre2         db 00
                db 20 dup (00)
buffer_nombre   db 20,00
                db 20 dup (00)


.CODE 
.STARTUP 
inicio:
        mov DX, offset usac
	    mov AH, 09
	    int 21
	    mov DX, offset facultad
	    mov AH, 09
	    int 21
	    mov DX, offset curso
	    mov AH, 09
	    int 21
	    mov DX, offset seccion
		mov AH, 09
		int 21
		;;
		mov DX, offset saltoLinea
		mov AH,09
		int 21
		mov DX, offset nombre
		mov AH, 09
		int 21
		mov DX, offset carnet
		mov AH,09 
		int 21


	
        
        mov DX, offset mensaje_enter
		mov AH, 09
		int 21
        mov AH, 08
        int 21
        ;;
        cmp AL,0dh
        je menu
        jmp presionar_enter
presionar_enter:
        mov DX, offset mensaje_enter2
        mov AH,09
        int 21
        mov AH,08
        int 21
        ;;
        cmp AL,0a 
        je menu
        jmp presionar_enter
menu: 
        mov DX, offset menu0
        mov AH,09
        int 21
        mov DX, offset mensaje_menu0
        mov AH,09
        int 21
        ;;
        mov AH,08
        int 21
        ;;
        cmp AL,'1'
        je ingresar_2nombres
        cmp AL,'2'
        je ingresar_1nombre
        cmp AL,'3'
        je cargar_partida
        cmp AL,'4'
        je ayuda
        cmp AL,'5'
        je final
        jmp menu
ingresar_2nombres:
        mov DX, offset mensaje_nombre_1
	mov AH, 09
	int 21
        mov DX, offset buffer_nombre
	mov AH, 0a
	int 21
        ;;
        mov DI, offset nombre1
        call copiar_cadena
        ;;
        mov DX, offset saltoLinea
        mov AH,09
        int 21
        ;;
        mov DX, offset mensaje_nombre_2
	mov AH, 09
	int 21
        mov DX, offset buffer_nombre
	mov AH, 0a
	int 21
        ;;
        mov DI, offset nombre2
        call copiar_cadena
        jmp PvP
ingresar_1nombre:
        mov DX, offset mensaje_nombre_1
	mov AH, 09
	int 21
        ;;
        mov DX, offset buffer_nombre
	mov AH, 0a
	int 21
        ;;
        mov DI, offset nombre1
        call copiar_cadena
        ;;
        mov DI, offset nombre2
        mov AL, 03
        mov [DI],AL
        inc DI
        mov AL,'C'
        mov [DI],AL
        inc DI
        mov AL, 'P'
        mov [DI],AL
        inc DI
        mov AL, 'U'
        mov [DI],AL
        jmp PvC
PvP:
        call imprimir_jugadores
        mov DX, offset mensaje_pvp
        mov AH,09
        int 21
        jmp menu
PvC:
        call imprimir_jugadores
        mov DX, offset mensaje_pvC
        mov AH,09
        int 21
        jmp menu
cargar_partida:
        mov DX, offset mensaje_cargar
        mov AH,09
        int 21
        jmp menu

ayuda:
        mov DX, offset mensaje_ayuda
        mov AH,09
        int 21
        jmp menu
copiar_cadena:
        mov SI, offset buffer_nombre
        inc SI
        mov AL, [SI]
        mov [DI],AL
        inc SI
        inc DI

        mov CX,0000
        mov CL,AL
ciclo_copiarCadena:
        mov AL,[SI]
        mov [DI],AL
        inc SI
        inc DI
        loop ciclo_copiarCadena
        ret
imprimir_jugadores:
        ;;; imprimir el primer nombre
	;
	;
        mov DX, offset saltoLinea
	mov AH, 09
	int 21
        ;
	mov BX, 0001
	mov CX, 0000
	mov CL, [nombre1]
        mov DI, offset nombre1
	inc DI
	mov DX, DI
	mov AH, 40
	int 21
        ;
	mov DX, offset saltoLinea
	mov AH, 09
	int 21
	;;; imprimir el segundo nombre
	mov BX, 0001
	mov CX, 0000
	mov CL, [nombre2]
	mov DI, offset nombre2
	inc DI
	mov DX, DI
	mov AH, 40
	int 21
	mov DX, offset saltoLinea
	mov AH, 09
	int 21
        ;
        ret


final:
        mov DX, offset mensaje_salir
        mov AH,09
        int 21
        
.EXIT 
END 
