JUGADOR		   equ 01
ACERA          equ 02
CARRIL         equ 03
CARRO          equ 04
CAMION         equ 05

.MODEL small
.RADIX 16
.STACK
.DATA
x_jugador dw 0014
y_jugador dw 0017

x_temp dw 0000
y_temp dw 0000

usac     db "Universidad de San Carlos de Guatemala",0a,"$"
facultad db "Facultad de Ingenieria",0a,"$"
curso    db "Arquitectura de Computadoras y Ensambladores 1",0a,"$"
seccion db "Seccion A",0a,"$"
semestre db "Segundo Semestre 2023",0a,"$"
nombre db "Nombre: Ramiro Agustin Telles Carcuz",0a,"$"
carnet db "Carnet: 202010044",0a,0a,"$"

usuarioAdmin_original db "rcarcuz$"
contraAdmin_original db "202010044a$"

intentoContra db 00

buff_leer db 1a,00
			db 1a dup (00)


;;estructura usuario 31h bytes
user_temp db 15 dup (00)
con_temp db 1a dup (00)
userRol_temp db 00
userBan_temp db 00

menu0_m1 db "F1 iniciar Sesion",0a,"$"
menu0_m2 db "F2 registrar Usuario",0a,"$"
menu0_m3 db "F3 Salir",0a,"$"

menu1_m1 db "F1 Nueva Partida",0a,"$"
menu1_m2 db "F2 Ultimas Partidas",0a,"$"
menu1_m3 db "F3 Estadisticas Usuarios",0a,"$"
menu1_m4 db "F4 ordenamientos",0a,"$"
menu1_m5 db "F5 Promover",0a,"$"
menu1_m6 db "F6 Cerrar Sesion",0a,"$"

m_ultimasPartidas db "ultimas partidas",0a,"$"
m_estUsers db "estadisticas Usuarios",0a,"$"
m_ord db "ordenamiento",0a,"$"
m_cerrarSesion db "Cerrando Sesion",0a,"$"
m_promover db "Promover",0a,"$"



m_login db "login",0a,"$"

m_ingresarUser db "ingrese el usuario: ",0a,"$"
m_ingresarContra db "ingrese la contra: ",0a,"$"

m_malContra db "Clave erronea",0a,"$"
m_3intentos1 db "Ha fallado mas de 3 intentos",0a,"$"
m_3intentos2 db "Sistema bloqueado por 10 segundos",0a,"$"

m_userNotFound db "Usuario no encontrado",0a,"$"

m_registrar db "reg",0a,"$"
m_salir db "Saliendo del Programa",0a,"$"

mensaje_nose db "nose :/$"

puntaje_temp db "0$"

puntaje_tempD dw 0000

vidasD db 03

vidas db "3 vidas$"

usuario_juego db "Rami:D 123456789$"

fechaHora db "xx/xx/xxxx xx:xx:xx$"

m_limpiar db "                                        $"




sprite_jugador db 00, 00, 00, 05, 05, 00, 00, 00 
               db 00, 00, 00, 05, 05, 00, 00, 05 
               db 00, 05, 05, 05, 05, 05, 05, 00 
               db 05, 00, 00, 05, 05, 00, 00, 00 
               db 00, 00, 00, 05, 05, 00, 00, 00 
               db 00, 00, 05, 05, 05, 05, 00, 00 
               db 00, 00, 05, 00, 00, 05, 00, 00 
               db 00, 05, 05, 00, 00, 05, 05, 00
sprite_carril  db 13, 13, 13, 13, 13, 13, 13, 13 
               db 13, 13, 13, 13, 13, 13, 13, 13 
               db 13, 13, 13, 13, 13, 13, 13, 13 
               db 13, 13, 13, 13, 13, 13, 13, 13 
               db 13, 13, 13, 13, 13, 13, 13, 13 
               db 13, 13, 13, 13, 13, 13, 13, 13 
               db 13, 13, 13, 13, 13, 13, 13, 13 
               db 1f, 1f, 13, 13, 1f, 1f, 13, 13 
sprite_acera db 17, 17, 17, 17, 17, 17, 17, 17 
                db 17, 17, 17, 1a, 17, 17, 17, 17 
                db 17, 17, 17, 1a, 17, 17, 17, 17 
                db 17, 17, 17, 1a, 17, 17, 17, 17 
                db 17, 17, 17, 1a, 17, 17, 17, 17 
                db 17, 17, 17, 1a, 17, 17, 17, 17 
                db 17, 17, 17, 1a, 17, 17, 17, 17 
                db 17, 17, 17, 17, 17, 17, 17, 17 

mapaJuego 	db 3e8 dup (00)

;;mapaJuego db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
;;			db 02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02
;;			db 02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02
;;			db 02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02
;;			db 02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02
;;			db 02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02
;;			db 02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02
;;			db 02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02
;;			db 02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02
;;			db 02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02
;;			db 02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02
;;			db 02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02
;;			db 02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02
;;			db 02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02
;;			db 02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02
;;			db 02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02
;;			db 02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02
;;			db 02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02
;;			db 02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02
;;			db 02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02
;;			db 02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02
;;			db 02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02
;;			db 02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02,02
;;			db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
			

.CODE
.STARTUP
		;; ingreso al modo de video 13h
		mov AL, 13
		mov AH, 00
		int 10
		;; ...
		;;jmp iniciar_juego
		mov DH,00
		mov DL,00
		mov BH,00
		mov AH,02
		int 10
		mov DX, offset usac
		mov AH,09
		int 21

		mov DH,01
		mov DL,00
		mov BH,00
		mov AH,02
		int 10
		mov DX, offset facultad
		mov AH,09
		int 21

		mov DH,02
		mov DL,00
		mov BH,00
		mov AH,02
		int 10
		mov DX, offset curso
		mov AH,09
		int 21

		mov DH,03
		mov DL,00
		mov BH,00
		mov AH,02
		int 10
		mov DX, offset seccion
		mov AH,09
		int 21

		mov DH,04
		mov DL,00
		mov BH,00
		mov AH,02
		int 10
		mov DX, offset seccion
		mov AH,09
		int 21

		mov DH,05
		mov DL,00
		mov BH,00
		mov AH,02
		int 10
		mov DX, offset semestre
		mov AH,09
		int 21

		mov DH,06
		mov DL,00
		mov BH,00
		mov AH,02
		int 10
		mov DX, offset nombre
		mov AH,09
		int 21

		mov DH,07
		mov DL,00
		mov BH,00
		mov AH,02
		int 10
		mov DX, offset carnet
		mov AH,09
		int 21

		mov SI, 10df
		call sub_ret

		jmp menu0

	

		jmp fin


		;; ...
		;;

menu0:
		call limpiar_pantalla
		mov DH,00
		mov DL,00
		mov BH,00
		mov AH,02
		int 10
		mov DX, offset menu0_m1
		mov AH,09
		int 21
		mov DX, offset menu0_m2
		mov AH,09
		int 21
		mov DX, offset menu0_m3
		mov AH,09
		int 21

		mov AH,00
		int 16

		cmp AH,3b
		je login 
		cmp AH,3c 
		je registar_user 
		cmp AH,3d 
		je fin_mensaje


		jmp menu0		

login:
		call limpiar_login
		call limpiar_pantalla
		mov DH,00
		mov DL,00
		mov BH,00
		mov AH,02
		int 10
		
		mov DX, offset m_ingresarUser
		mov AH,09
		int 21

		mov DX, offset buff_leer
		mov AH,0a
		int 21

		mov SI, offset buff_leer
		mov DI, offset user_temp
		call copiar_cadena

		mov SI, offset usuarioAdmin_original
		mov DI, offset user_temp
		call comparar_cadenas
		shr AL,1
		jc login_adminOriginal 
		int 03
		mov DX,offset m_userNotFound
		mov AH,09
		int 21

		mov SI, 05a0
		call sub_ret

		
		jmp menu0

login_adminOriginal:
		mov SI, offset intentoContra
		mov AL,00
		mov [SI],AL
login_adminOriginal2:
		call limpiar_pantalla
		call limpiar_buff
		
		mov DH,00
		mov DL,00
		mov BH,00
		mov AH,02
		int 10

		mov DX, offset m_ingresarContra
		mov AH,09
		int 21

		mov DX, offset buff_leer
		mov AH,0a
		int 21

		mov SI, offset buff_leer
		mov DI, offset con_temp
		call copiar_cadena

		mov SI, offset contraAdmin_original
		mov DI, offset con_temp
		call comparar_cadenas
		shr AL,1
		jc menuAdmin_original
		mov DX, offset m_malContra
		mov AH,09
		int 21

		mov SI,05a0 
		call sub_ret

		mov SI,offset intentoContra
		mov AL,[SI]
		inc AL
		mov [SI],AL
		cmp AL,03
		jne login_adminOriginal2

		mov DX, offset m_3intentos1
		mov AH,09
		int 21
		
		mov DX, offset m_3intentos2
		mov AH,09
		int 21

		mov SI,383b 
		call sub_ret


		jmp menu0


menuAdmin_original:
		call limpiar_pantalla
		mov DH,00
		mov DL,00
		mov BH,00
		mov AH,02
		int 10

		mov DX, offset menu1_m1
		mov AH,09
		int 21

		mov DX, offset menu1_m2
		mov AH,09
		int 21

		mov DX, offset menu1_m3
		mov AH,09
		int 21

		mov DX, offset menu1_m4
		mov AH,09
		int 21

		mov DX, offset menu1_m5
		mov AH,09
		int 21

		mov DX, offset menu1_m6
		mov AH,09
		int 21

		mov AH,00
		int 16

		cmp AH,3b
		je iniciar_juego
		cmp AH,3c 
		je ultimasPartidas
		cmp AH,3d 
		je estadisticasUsuarios
		cmp AH,3e 
		je ordenamiento
		cmp AH,3f 
		je promoverUsuarios
		cmp AH,40 
		je cerrar_sesion


		jmp menuAdmin_original

ultimasPartidas:
		call limpiar_pantalla

		mov DH,00
		mov DL,00
		mov BH,00
		mov AH,02
		int 10

		mov DX, offset m_ultimasPartidas
		mov AH,09
		int 21

		mov SI, 05a0
		call sub_ret
		jmp menuAdmin_original

estadisticasUsuarios:
		call limpiar_pantalla

		mov DH,00
		mov DL,00
		mov BH,00
		mov AH,02
		int 10

		mov DX, offset m_estUsers
		mov AH,09
		int 21

		mov SI, 05a0
		call sub_ret
		jmp menuAdmin_original

ordenamiento:
		call limpiar_pantalla

		mov DH,00
		mov DL,00
		mov BH,00
		mov AH,02
		int 10

		mov DX, offset m_ord
		mov AH,09
		int 21

		mov SI, 05a0
		call sub_ret
		jmp menuAdmin_original

promoverUsuarios:
		call limpiar_pantalla

		mov DH,00
		mov DL,00
		mov BH,00
		mov AH,02
		int 10

		mov DX, offset m_promover
		mov AH,09
		int 21

		mov SI, 05a0
		call sub_ret
		jmp menuAdmin_original



cerrar_sesion:
		call limpiar_pantalla

		mov DH,00
		mov DL,00
		mov BH,00
		mov AH,02
		int 10

		mov DX, offset m_cerrarSesion
		mov AH,09
		int 21

		mov SI, 05a0
		call sub_ret
		jmp menu0
			


		





registar_user:
		call limpiar_pantalla
		mov DH,00
		mov DL,00
		mov BH,00
		mov AH,02
		int 10
		mov DX, offset m_registrar
		mov AH,09
		int 21
		mov SI, 05a0 

		call sub_ret
		jmp menu0

















infinito:
		call imprimir_mapa
		jmp infinito
		jmp fin

iniciar_juego:
		call limpiar_pantalla
		call reiniciar_mapa

		mov DH,00
		mov DL,00
		mov BH,00
		mov AH,02
		int 10
		mov DX, offset puntaje_temp
		mov AH,09
		int 21

		mov DH,00
		mov DL,10
		mov BH,00
		mov AH,02
		int 10
		mov DX, offset vidas
		mov AH,09
		int 21

		mov DH,18
		mov DL,00
		mov BH,00
		mov AH,02
		int 10
		mov DX, offset user_temp
		mov AH,09
		int 21

		mov DH,18
		mov DL,14
		mov BH,00
		mov AH,02
		int 10
		mov DX, offset fechaHora
		mov AH,09
		int 21


		jmp infinito
		







;; - SI - x SI
;; - DI - y
;; - AL - color

pintar_pixel:
		push AX
		mov BX, 0000
		add BX,SI
		mov AX,0140
		mul DI
		add BX,AX
		pop AX

		push DS

		mov DX, 0a000
		mov DS,DX
		mov [BX],AL
		pop DS
		ret




;; BX - sprite		
pintar_sprite:
		mov SI, [x_temp]
		mov DI, [y_temp]
		;;mov BX, offset sprite_jugador
		xchg BP, CX
		mov CX, 0000
		mov CL, 08    ;; altura del jugador, 8 en este caso
ciclo_filas:
		xchg BP, CX
		mov CX, 0000
		mov CL, 08    ;; anchura del jugador, 8 en este caso
ciclo_columnas:
		push BX
		push CX
		mov AL, [BX]
		call pintar_pixel
		pop CX
		pop BX
		inc SI
		inc BX
		loop ciclo_columnas
		;; terminó una fila
		;;; incremento y
		inc DI
		;;; reinicio x
		mov SI, [x_temp]
		xchg BP, CX
		loop ciclo_filas
		ret

;; SI - x
;; DI - y
;;CL - tipo

colocar_mapa:
		mov BX,0000
		mov BX,DI
		mov AX, 0028
		mul BX
		add AX,SI
		push DI
		mov DI, offset mapaJuego
		add DI,AX
		mov [DI],CL
		pop DI
		ret

;; SI - x
;; DI - Y
;;salida: CL - tipo

obtener_mapa:
		mov BX,0000
		mov BX,DI
		mov AX, 0028
		mul BX
		add AX,SI
		push DI
		mov DI, offset mapaJuego
		add DI,AX
		mov CL,[DI]
		pop DI
		ret

reiniciar_mapa:
		
		mov SI,0000
		mov DI, 0001
		call colocar_filaAcera
		
reiniciar_mapa2:
		inc DI
		mov SI,0000
		call colocar_filaCarril
		cmp DI,0016
		jne reiniciar_mapa2
		inc DI
		mov SI,0000
		call colocar_filaAcera
		mov SI,0014
		mov DI,0017
		mov CL,01
		call colocar_mapa
		
		ret




colocar_filaAcera:
		mov CX,0028	
colocar_filaAcera2:
		push CX
		mov CL,02
		call colocar_mapa
		pop CX
		inc SI
		loop colocar_filaAcera2
		ret

colocar_filaCarril:
		mov CX,0028	
colocar_filaCarril2:
		push CX
		mov CL,03
		call colocar_mapa
		pop CX
		inc SI
		loop colocar_filaCarril2
		ret

imprimir_mapa:
		mov SI,0000
		mov DI,0001
		mov CX,0017
imprimir_mapa2:
		xchg BP,CX
		mov CX,0028
imprimir_mapa3:
		push CX
		call obtener_mapa
		push SI
		mov BX, SI
		mov AX, 0008
		mul BX
		mov SI, offset x_temp
		mov [SI],AX
		push DI
		mov BX,DI
		mov AX,0008
		mul BX
		mov DI, offset y_temp
		mov [DI],AX
		cmp CL,JUGADOR
		je pintar_jugador
		cmp CL,ACERA
		je pintar_acera
		cmp CL, CARRIL
		je pintar_carril
imprimir_mapa4:
		pop DI
		pop SI
		pop CX
		inc SI
		loop imprimir_mapa3
		mov SI,0000
		inc DI
		xchg BP,CX
		loop imprimir_mapa2
		ret


		
pintar_jugador:
		mov BX, offset sprite_jugador
		push BP
		call pintar_sprite
		pop BP
		jmp imprimir_mapa4

pintar_acera:
		mov BX, offset sprite_acera
		push BP
		call pintar_sprite
		pop BP
		jmp imprimir_mapa4

pintar_carril:
		mov BX, offset sprite_carril
		push BP
		call pintar_sprite
		pop BP
		jmp imprimir_mapa4

;;SI- nn
;;salida: si -? di- ?
sub_ret:
		dec SI
		jz sub_ret3
		mov DI,03e8
sub_ret2:
		dec DI
		jnz sub_ret2
		jmp sub_ret
sub_ret3:
		ret
		

limpiar_pantalla:
		mov CX,0019
		mov DH,00
		mov DL,00
		mov BH,00
		mov AH,02
		int 10
limpiar_pantalla2:

		
		mov DX, offset m_limpiar
		mov AH,09
		int 21
		
		loop limpiar_pantalla2
		ret

;;SI - cadena 1
;;DI - cadena 2
;;salida- AL=>01 si iguales
;; AL =>00 si no iguales
comparar_cadenas:
                mov AL,[SI]
                mov AH,[DI]
                cmp AL,"$"
                je comparar_cadenas2
                inc SI
                inc DI
                cmp AL,AH
                je comparar_cadenas
cadena_noIgual:
                mov AL,00
                ret
comparar_cadenas2:
                cmp AH,"$"
                je cadena_igual
                jmp cadena_noIgual
cadena_igual:
                mov AL,01
                ret


;;SI-buffer
;;DI- destino

copiar_cadena:
                inc SI
                mov CX,0000
                mov CL,[SI]
				
                inc SI
copiar_cadena2:
                mov AL,[SI]
                mov [DI],AL
                inc SI
                inc DI
                loop copiar_cadena2
                
                mov AL,"$"
                mov [DI],AL
                ret

limpiar_login:
		mov SI, offset buff_leer
		mov CX,0000
		mov CL,[SI]
		mov AL,00
		inc SI
limpiar_login2:
		mov [SI],AL
		inc SI
		loop limpiar_login2
		mov SI, offset user_temp
		mov CX,0015
limpiar_login3:
		mov [SI],AL
		inc SI
		loop limpiar_login3
		mov SI, offset con_temp
		mov CX, 001a 
limpiar_login4:
		mov [SI],AL
		inc SI
		loop limpiar_login4
		mov SI, offset userRol_temp
		mov [SI],AL
		mov SI, offset userBan_temp
		mov [SI],AL
		ret

limpiar_buff:
		mov SI, offset buff_leer
		mov CX,0000
		mov CL,[SI]
		mov AL,00
		inc SI
limpiar_buff2:
		mov [SI],AL
		inc SI
		loop limpiar_buff2
		ret
		



fin_mensaje:
		call limpiar_pantalla
		mov CX,0019
		mov DH,00
		mov DL,00
		mov BH,00
		mov AH,02
		int 10
		mov DX, offset m_salir
		mov AH,09
		int 21
fin:

.EXIT
END
