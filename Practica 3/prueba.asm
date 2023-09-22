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
        je PvP
        cmp AL,'2'
        je PvC
        cmp AL,'3'
        je cargar_partida
        cmp AL,'4'
        je ayuda
        cmp AL,'5'
        je final
        jmp menu
PvP:
        mov DX, offset mensaje_pvp
        mov AH,09
        int 21
        jmp menu
PvC:
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




final:
        mov DX, offset mensaje_salir
        mov AH,09
        int 21
        
.EXIT 
END 
