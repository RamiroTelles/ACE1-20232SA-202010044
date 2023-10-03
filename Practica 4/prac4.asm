.RADIX 16
.MODEL small
.STACK 1024
.DATA 
usac     db "Universidad de San Carlos de Guatemala",0a,"$"
facultad db "Facultad de Ingenieria",0a,"$"
curso    db "Arquitectura de Computadoras y Ensambladores 1",0a,"$"
seccion db "Seccion A",0a,"$"
semestre db "Segundo Semestre 2023",0a,"$"
nombre db "Nombre: Ramiro Agustin Telles Carcuz",0a,"$"
carnet db "Carnet: 202010044",0a,0a,"$"


saltoLinea db 0a,"$"


menu0    db "Elija una opcion:",0a, " 1. Cargar Archivo",0a, " 2. Modo Calculadora",0a, " 3.Factorial",0a," 4.Crear Reporte",0a," 5.Salir",0a,"$"
mensaje_menu0 db "elija una opcion valida:",0a,"$"

mensaje_cargar db "Cargar Archivo",0a,"$"
mensaje_calcu db "Modo Calculadora",0a,"$"
mensaje_facto db "Factorial",0a,"$"
mensaje_crearR db "Crear Reporte",0a,"$"
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
        mov DX, offset semestre
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
        je cargar_archivo
        cmp AL,'2'
        je modo_calcu
        cmp AL,'3'
        je factorial
        cmp AL,'4'
        je crear_reporte
        cmp AL,'5'
        je final
        jmp menu

cargar_archivo:
        
        mov DX, offset mensaje_cargar
        mov AH,09
        int 21
        jmp menu
modo_calcu:
       
        mov DX, offset mensaje_calcu
        mov AH,09
        int 21
        jmp menu
factorial:
        mov DX, offset mensaje_facto
        mov AH,09
        int 21
        jmp menu

crear_reporte:
        mov DX, offset mensaje_crearR
        mov AH,09
        int 21
        jmp menu




final:
        mov DX, offset mensaje_salir
        mov AH,09
        int 21
        
.EXIT 
END 
