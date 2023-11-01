JUGADOR		   equ 01
ACERA          equ 02
CARRIL         equ 03
;CARRO          equ 04
;CAMION         equ 05
CARRO1         equ 06
CARRO2         equ 07
CARRO3         equ 08
CARRO1I         equ 09
CARRO2I         equ 10
CARRO3I         equ 11

.MODEL small
.RADIX 16
.STACK
.DATA
x_jugador dw 0014
y_jugador dw 0017

x_temp dw 0000
y_temp dw 0000

x_temp2	dw 0000
y_temp2 dw 0000

usac     db "Universidad de San Carlos de Guatemala",0a,"$"
facultad db "Facultad de Ingenieria",0a,"$"
curso    db "Arquitectura de Computadoras y Ensambladores 1",0a,"$"
seccion db "Seccion A",0a,"$"
semestre db "Segundo Semestre 2023",0a,"$"
nombre db "Nombre: Ramiro Agustin Telles Carcuz",0a,"$"
carnet db "Carnet: 202010044",0a,0a,"$"

usuarioAdmin_original db "rcarcuz$"
contraAdmin_original db "202010044A*$"

file_users db "USRS.ACE",00

handler dw 0000


m_error0 db "No se pudo abrir el archivo",0a,"$"
m_error1 db "Error al Crear el archivo, :(",0a,"$"
m_error2 db "Error con el puntero del archivo",0a,"$"
m_error3 db "Error al escribir en el archivo",0a,"$"
m_error4 db "Error al cerrar el archivo",0a,"$"
m_error5 db "No se pudo leer el archivo",0a,"$"
m_esc_true db "Se logro registrar al nuevo usuario",0a,"$"

mensajeE_div db "No se pueden mostrar numeros mas grandes que 2550",0a,"$"


intentoContra db 00

buff_leer db 1a,00
			db 1a dup (00)

;;buff_archivoLeerCant db 00
buff_archivoLeer db 31 dup (00)

buff_write1 db 00

iterador2 dw 0000

id_userTemp dw 0000
user_temp2 db 15 dup(00)

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
menu1_m7 db "F7 Desbloquear Usuarios",0a,"$"
menu1_m8 db "F8 Resumir Partida",0a,"$"


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
m_userBlock1 db "Usuario Bloqueado",0a,"$"
m_userUnBlock1 db "Usuario Desbloqueado",0a,"$"

m_userInvalid db "Nombre Usuario invalido",0a,"$"
m_conInvalid db "Clave invalida",0a,"$"

m_pausa1 db "F1 Resumir Partida",0a,"$"
m_pausa2 db "F2 Volver a Menu Usuario",0a,"$"

m_gameOver1 db "Game Over",0a,"$"
m_gameOver2 db "Puntaje: ",0a,"$"

m_registrar db "reg",0a,"$"
m_salir db "Saliendo del Programa",0a,"$"

mensaje_nose db "nose :/$"

puntaje_temp db "0$",00,00,00,00,00

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

sprite_carro1  db 13, 13, 13, 13, 13, 13, 13, 13 
               db 13, 13, 13, 13, 13, 13, 13, 13 
               db 02, 02, 02, 02, 02, 02, 02, 13 
               db 02, 03, 02, 02, 02, 03, 02, 13 
               db 02, 03, 02, 02, 02, 03, 02, 13 
               db 02, 03, 02, 02, 02, 03, 02, 13 
               db 02, 02, 02, 02, 02, 02, 02, 13 
               db 1f, 1f, 13, 13, 1f, 1f, 13, 13

sprite_carro2  db 13, 13, 13, 13, 13, 13, 13, 13 
               db 13, 13, 13, 13, 13, 13, 13, 13 
               db 06, 06, 06, 06, 06, 06, 06, 13 
               db 06, 03, 06, 06, 06, 03, 06, 13 
               db 06, 03, 06, 06, 06, 03, 06, 13 
               db 06, 03, 06, 06, 06, 03, 06, 13 
               db 06, 06, 06, 06, 06, 06, 06, 13 
               db 1f, 1f, 13, 13, 1f, 1f, 13, 13

sprite_carro3  db 13, 13, 13, 13, 13, 13, 13, 13 
               db 13, 13, 13, 13, 13, 13, 13, 13 
               db 04, 04, 04, 04, 04, 04, 04, 13 
               db 04, 03, 04, 04, 04, 03, 04, 13 
               db 04, 03, 04, 04, 04, 03, 04, 13 
               db 04, 03, 04, 04, 04, 03, 04, 13 
               db 04, 04, 04, 04, 04, 04, 04, 13 
               db 1f, 1f, 13, 13, 1f, 1f, 13, 13


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

		mov SI, offset buff_leer
		mov DI, offset user_temp2
		call copiar_cadena

		mov SI, offset usuarioAdmin_original
		mov DI, offset user_temp
		call comparar_cadenas
		shr AL,1
		jc login_adminOriginal 
		
		call encontrar_User
		shr AL,1
		jc login2

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
		jc menuAdmin_original0
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

login2:
		mov SI, offset buff_archivoLeer
		mov AX, 0030
		add SI,AX
		mov AL, [SI]
		cmp AL,01
		je usuario_bloqueado1

		mov BX,iterador2
		mov id_userTemp,BX

		mov SI, offset intentoContra
		mov AL,00
		mov [SI],AL
login3:
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

		mov SI, offset buff_archivoLeer
		mov AX,0015
		add SI,AX
		mov DI, offset con_temp
		call comparar_cadenas
		shr AL,1
		jc comprobar_rol
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
		jne login3

		mov DX, offset m_3intentos1
		mov AH,09
		int 21
		
		mov DX, offset m_3intentos2
		mov AH,09
		int 21
		 
		mov SI, iterador2
		call bloquear_usuario
		mov SI,383b 
		call sub_ret


		jmp menu0

usuario_bloqueado1:
		call limpiar_pantalla

		mov DH,00
		mov DL,00
		mov BH,00
		mov AH,02
		int 10

		mov DX, offset m_userBlock1
		mov AH,09
		int 21

		mov SI,05a0

		call sub_ret
		jmp menu0




comprobar_rol:
		mov SI, offset userRol_temp
		mov BL,[SI]
		cmp BL,03
		je menuAdmin_original
		mov SI, offset buff_archivoLeer
		mov AX,002f 
		add SI,AX
		mov BL,[SI]
		cmp BL,01
		je menuAdminNormal 
		jmp menuUser 

menuUser:
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

		mov DX, offset menu1_m6
		mov AH,09
		int 21

		mov AH,00
		int 16

		cmp AH,3b
		je iniciar_juego
		cmp AH,3c 
		je ultimasPartidas
		cmp AH,40 
		je cerrar_sesion


		jmp menuUser

menuAdminNormal:
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

		
		mov DX, offset menu1_m6
		mov AH,09
		int 21

		mov DX, offset menu1_m7
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
	
		cmp AH,40 
		je cerrar_sesion

		cmp AH,41
		je desbloquear_usuarios

		jmp menuAdminNormal


menuAdmin_original0:	
		
		mov AL,03
		mov SI, offset userRol_temp
		mov [SI],AL

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

		mov DX, offset menu1_m7
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
		cmp AH,41
		je desbloquear_usuarios


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
		jmp comprobar_rol

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
		jmp comprobar_rol

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
		jmp comprobar_rol

promoverUsuarios:
		call limpiar_pantalla
		call limpiar_buff
		mov DH,00
		mov DL,00
		mov BH,00
		mov AH,02
		int 10

		mov DX, offset m_ingresarUser
		mov AH,09
		int 21

		mov DX,offset buff_leer
		mov AH,0a 
		int 21

		mov SI, offset buff_leer
		mov DI, offset user_temp
		call copiar_cadena

		call encontrar_User
		shr AL,1
		jnc promoverUsuarios3
promoverUsuarios2:
		mov SI,iterador2
		call promover_usuario

		call limpiar_pantalla

		mov DH,00
		mov DL,00
		mov BH,00
		mov AH,02
		int 10

		mov DX, offset m_userUnBlock1
		mov AH,09
		int 21

		mov SI, 05a0
		 
		call sub_ret
		jmp comprobar_rol

promoverUsuarios3:
		call limpiar_pantalla

		mov DH,00
		mov DL,00
		mov BH,00
		mov AH,02
		int 10

		mov DX, offset m_userNotFound
		mov AH,09
		int 21

		mov SI, 05a0
		
		call sub_ret

		jmp comprobar_rol


desbloquear_usuarios:
		call limpiar_pantalla
		call limpiar_buff
		mov DH,00
		mov DL,00
		mov BH,00
		mov AH,02
		int 10

		mov DX, offset m_ingresarUser
		mov AH,09
		int 21

		mov DX,offset buff_leer
		mov AH,0a 
		int 21

		mov SI, offset buff_leer
		mov DI, offset user_temp
		call copiar_cadena

		call encontrar_User
		shr AL,1
		jnc desbloquear_usuarios3
desbloquear_usuarios2:
		mov SI,iterador2
		call desbloquear_usuario

		call limpiar_pantalla

		mov DH,00
		mov DL,00
		mov BH,00
		mov AH,02
		int 10

		mov DX, offset m_userUnBlock1
		mov AH,09
		int 21

		mov SI, 05a0
		 
		call sub_ret
		jmp comprobar_rol

desbloquear_usuarios3:
		call limpiar_pantalla

		mov DH,00
		mov DL,00
		mov BH,00
		mov AH,02
		int 10

		mov DX, offset m_userNotFound
		mov AH,09
		int 21

		mov SI, 05a0
		
		call sub_ret

		jmp comprobar_rol

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

		mov AL,00
		mov SI, offset userRol_temp
		mov [SI],AL


		mov SI, 05a0
		call sub_ret
		jmp menu0
			


		





registar_user:
		call limpiar_login
		;;call limpiar_buff
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
		call comprobar_usuario
		shr AL,1
		jc registar_user2

		mov DX, offset m_userInvalid
		mov AH,09
		int 21

		mov SI,05a4 
		call sub_ret

		
		
		
		jmp menu0


registar_user2:
		mov SI, offset buff_leer
		mov DI, offset user_temp
		call copiar_cadena

		call limpiar_buff

		mov DX, offset m_ingresarContra
		mov AH,09
		int 21

		mov DX, offset buff_leer
		mov AH,0a 
		int 21

		mov SI, offset buff_leer
		call comprobar_contra

		shr AL,1
		jc registar_user3

		mov DX, offset m_conInvalid
		mov AH,09
		int 21

		mov SI,35a0
		call sub_ret



		jmp menu0


registar_user3:
		mov SI, offset buff_leer
		mov DI, offset con_temp
		call copiar_cadena
		
		mov SI, offset userBan_temp
		mov AL,00
		mov [SI],AL
		mov SI, offset userRol_temp
		mov [SI],AL

		call escribir_usuario
		mov SI,35a0
		call sub_ret


		jmp menu0



escribir_usuario:
		mov AL,02
		mov DX,offset file_users
		mov AH,3d 
		int 21
		jc crear_archivo
		mov handler,AX
		jmp escribir_usuario2
crear_archivo:
		mov CX,0000
		mov DX, offset file_users
		mov AH,3c 
		int 21
		jc error1
		mov handler,AX
		jmp escribir_usuario2
escribir_usuario2:
		mov AL,02
		mov BX,handler
		mov CX,0000
		mov DX,0000
		mov AH,42
		int 21
		jc error2

		mov BX,handler 
		mov CX,0031
		mov DX, offset user_temp
		mov AH,40
		int 21

		jc error3
escribir_usuario3:
		mov BX,handler
		mov AH,3e
		int 21 
		jc error4
		call limpiar_pantalla

		
		mov DH,00
		mov DL,00
		mov BH,00
		mov AH,02
		int 10

		mov DX,offset m_esc_true
		mov AH,09
		int 21

		

		ret


error1:
		mov DX,offset m_error1
		mov AH,09
		int 21
		jmp fin

error2:
		mov DX,offset m_error2
		mov AH,09
		int 21
		jmp fin

error3:
		mov DX,offset m_error3
		mov AH,09
		int 21
		jmp fin

error4:
		mov DX,offset m_error4
		mov AH,09
		int 21
		jmp fin





infinito:


		

		mov AH,01
		int 16
		jz infinito_ret
		mov AH,00
		int 16
		cmp AH,01
		je menu_pausa_juego
		cmp AH,47
		je mover_jugador_arriba
		cmp AH,4f
		je mover_jugador_abajo
		cmp AH,53
		je mover_jugador_izquierda
		cmp AH,51
		je mover_jugador_derecha
		jmp infinito_ret
mover_jugador_arriba:
		mov SI,[x_jugador]
		mov DI,[y_jugador]
		dec DI
		;cmp DI,0000
		;jg mover_jugador_arriba2
		;mov DI,0001
mover_jugador_arriba2:
		call mover_jugador
		jmp infinito_ret
mover_jugador_abajo:
		mov SI,[x_jugador]
		mov DI,[y_jugador]
		inc DI
		cmp DI,0018
		jb mover_jugador_abajo2
		mov DI,0017
mover_jugador_abajo2:
		call mover_jugador
		jmp infinito_ret
mover_jugador_izquierda:
		mov SI,[x_jugador]
		mov DI,[y_jugador]
		dec SI
		cmp SI,0000
		jge mover_jugador_izquierda2
		mov SI,0000
mover_jugador_izquierda2:
		call mover_jugador
		jmp infinito_ret
mover_jugador_derecha:
		mov SI,[x_jugador]
		mov DI,[y_jugador]
		inc SI
		cmp SI,0027
		jle mover_jugador_derecha2
		mov SI,0027
mover_jugador_derecha2:
		call mover_jugador
		jmp infinito_ret






infinito_ret:
verificar_posJugador:
		mov BX,[y_jugador]
		cmp BX,0001
		jne verificar_posJugador2
		mov DI, [y_jugador]
		mov SI,[x_jugador]
		mov DI, 0017
		mov SI, 0014
		call mover_jugador ;;muevo jugador al inicio

		mov DI, offset puntaje_tempD ;;calculo puntaje
		mov SI, offset vidasD
		mov CL,[SI]
		cmp CL,03
		jnz aumentar_puntos2
		mov BX,0064
		mov AX, [DI]
		add AX,BX
		mov [DI],AX
		jmp aumentar_puntos3
aumentar_puntos2:
		mov AX,0019
		mov SI,offset vidasD
		mov CL,[SI]
		mov CH,00
		mul CX
		mov BX,[DI]
		add BX,AX
		mov [DI],BX


aumentar_puntos3:
		mov DI, offset puntaje_tempD
		mov SI, offset puntaje_temp
		call num_toAscii
		mov DH,00
		mov DL,00
		mov BH,00
		mov AH,02
		int 10

		mov DX,offset puntaje_temp
		mov AH,09
		int 21

		mov DI, offset vidasD
		mov BL,[DI]
		add BL,"0"
		mov SI, offset vidas
		mov [SI],BL
		mov DH,00
		mov DL,10
		mov BH,00
		mov AH,02
		int 10
		mov DX, offset vidas
		mov AH,09
		int 21



verificar_posJugador2:
		call mover_carros3_1I
		call mover_carros3_1D
		call mover_carros2_1D
		call mover_carros2_1I
		call mover_carros1_1I
		call mover_carros1_1D   
		call imprimir_mapa
		;mov SI,0018
		;call sub_ret

infinito_final:
		jmp infinito
		jmp fin

iniciar_juego:
		call limpiar_pantalla
		call reiniciar_mapa

		mov SI, offset vidasD
		mov AL,03
		mov [SI],AL

		mov SI, offset vidas
		add AL,"0"
		mov [SI],AL
		

		mov SI, offset puntaje_tempD
		mov AX,0000
		mov [SI],AX

		mov SI, offset puntaje_temp
		mov AL,"0"
		mov [SI],AL
		inc SI
		mov AL,"$"
		mov [SI],AL

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
		mov DX, offset user_temp2
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
		

menu_pausa_juego:
		call limpiar_pantalla
		mov DH,00
		mov DL,00
		mov BH,00
		mov AH,02
		int 10

		mov DX, offset m_pausa1
		mov AH,09
		int 21

		mov DX, offset m_pausa2
		mov AH,09
		int 21

		mov AH,00
		int 16

		cmp AH,3b
		je resumir_juego
		cmp AH,3c 
		je menu_resumenJuego 

		jmp menu_resumenJuego


menu_resumenJuego:
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

		mov DX, offset menu1_m7
		mov AH,09
		int 21

		mov DX, offset menu1_m8
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
		cmp AH,41
		je desbloquear_usuarios
		cmp AH,42
		je resumir_juego


		jmp menuAdmin_original

resumir_juego:
		call limpiar_pantalla
		;;call reiniciar_mapa

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
		mov DX, offset user_temp2
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


		jmp infinito_ret



;; SI -x
;; DI - y

mover_jugador:
		push SI
		push DI
		mov CL, CARRIL
		mov SI, [x_jugador]
		mov DI, [y_jugador]
		call colocar_mapa
		pop DI
		pop SI
		mov CL,JUGADOR
		call colocar_mapa

		mov [x_jugador],SI
		mov [y_jugador],DI
		ret


detectar_colision:
		call obtener_mapa
		cmp CL,JUGADOR
		jne detectar_colision_fin 
		push SI
		mov SI, offset vidasD
		mov BL, [SI]
		dec BL
		mov [SI],BL
		cmp BL,00
		je mostrar_gameOver
		push DI
		mov DI, 0017
		mov SI, 0014
		call mover_jugador

		mov DI, offset vidasD
		mov BL,[DI]
		add BL,"0"
		mov SI, offset vidas
		mov [SI],BL
		mov DH,00
		mov DL,10
		mov BH,00
		mov AH,02
		int 10
		mov DX, offset vidas
		mov AH,09
		int 21
		pop DI
		pop SI
detectar_colision_fin:
		ret


mostrar_gameOver:
		call limpiar_pantalla
		mov DH,00
		mov DL,00
		mov BH,00
		mov AH,02
		int 10

		mov DX, offset m_gameOver1
		mov AH,09
		int 21

		mov DX, offset m_gameOver2
		mov AH,09
		int 21

		mov DX, offset puntaje_temp
		mov AH,09
		int 21

		mov SI,1c1d 
		call sub_ret
		jmp comprobar_rol




mover_carros1_1D:
		mov SI,0000
		mov DI,0002
		mov CX,0016
mover_carros1_2D:
		xchg BP,CX
		mov CX,0028
mover_carros1_3D:
		push CX
		call obtener_mapa
		cmp CL,CARRO1
		jne mover_carros1_4D
		;;mover el carro
		mov CL,CARRIL
		call colocar_mapa
		
		inc SI
		call detectar_colision
		cmp SI,0028
		jl mover_carros1_5D
		mov SI,0000
mover_carros1_5D:
		mov CL,CARRO1
		call colocar_mapa
		
mover_carros1_4D:
		pop CX
		inc SI
		loop mover_carros1_3D
		mov SI,0000
		inc DI
		xchg BP,CX
		loop mover_carros1_2D
		ret



mover_carros1_1I:
		mov SI,0027
		mov DI,0002
		mov CX,0016
mover_carros1_2I:
		xchg BP,CX
		mov CX,0028
mover_carros1_3I:
		push CX
		call obtener_mapa
		cmp CL,CARRO1I
		jne mover_carros1_4I
		;;mover el carro
		mov CL,CARRIL
		call colocar_mapa
		
		dec SI
		call detectar_colision
		cmp SI,0000
		jge mover_carros1_5I
		mov SI,0027
mover_carros1_5I:
		mov CL,CARRO1I
		call colocar_mapa
		
mover_carros1_4I:
		pop CX
		dec SI
		loop mover_carros1_3I
		mov SI,0027
		inc DI
		xchg BP,CX
		loop mover_carros1_2I
		ret	






mover_carros2_1D:
		mov SI,0000
		mov DI,0002
		mov CX,0016
mover_carros2_2D:
		xchg BP,CX
		mov CX,0028
mover_carros2_3D:
		push CX
		call obtener_mapa
		cmp CL,CARRO2
		jne mover_carros2_4D
		;;mover el carro
		mov CL,CARRIL
		call colocar_mapa
		
		inc SI
		call detectar_colision
		cmp SI,0028
		jl mover_carros2_5D
		mov SI,0000
mover_carros2_5D:
		mov CL,CARRO2
		call colocar_mapa
		
mover_carros2_4D:
		pop CX
		inc SI
		loop mover_carros2_3D
		mov SI,0000
		inc DI
		xchg BP,CX
		loop mover_carros2_2D
		ret



mover_carros2_1I:
		mov SI,0027
		mov DI,0002
		mov CX,0016
mover_carros2_2I:
		xchg BP,CX
		mov CX,0028
mover_carros2_3I:
		push CX
		call obtener_mapa
		cmp CL,CARRO2I
		jne mover_carros2_4I
		;;mover el carro
		mov CL,CARRIL
		call colocar_mapa
		
		dec SI
		call detectar_colision
		cmp SI,0000
		jge mover_carros2_5I
		mov SI,0027
mover_carros2_5I:
		mov CL,CARRO2I
		call colocar_mapa
		
mover_carros2_4I:
		pop CX
		dec SI
		loop mover_carros2_3I
		mov SI,0027
		inc DI
		xchg BP,CX
		loop mover_carros2_2I
		ret	


mover_carros3_1D:
		mov SI,0000
		mov DI,0002
		mov CX,0016
mover_carros3_2D:
		xchg BP,CX
		mov CX,0028
mover_carros3_3D:
		push CX
		call obtener_mapa
		cmp CL,CARRO3
		jne mover_carros3_4D
		;;mover el carro
		mov CL,CARRIL
		call colocar_mapa
		
		inc SI
		call detectar_colision
		cmp SI,0028
		jl mover_carros3_5D
		mov SI,0000
mover_carros3_5D:
		mov CL,CARRO3
		call colocar_mapa
		
mover_carros3_4D:
		pop CX
		inc SI
		loop mover_carros3_3D
		mov SI,0000
		inc DI
		xchg BP,CX
		loop mover_carros3_2D
		ret



mover_carros3_1I:
		mov SI,0027
		mov DI,0002
		mov CX,0016
mover_carros3_2I:
		xchg BP,CX
		mov CX,0028
mover_carros3_3I:
		push CX
		call obtener_mapa
		cmp CL,CARRO3I
		jne mover_carros3_4I
		;;mover el carro
		mov CL,CARRIL
		call colocar_mapa
		
		dec SI
		call detectar_colision
		cmp SI,0000
		jge mover_carros3_5I
		mov SI,0027
mover_carros3_5I:
		mov CL,CARRO3I
		call colocar_mapa
		
mover_carros3_4I:
		pop CX
		dec SI
		loop mover_carros3_3I
		mov SI,0027
		inc DI
		xchg BP,CX
		loop mover_carros3_2I
		ret	








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


		;;colocando carros
		mov SI,0000
		mov DI,0002
		mov CL,CARRO3I
		call colocar_mapa

		mov SI,0000
		mov DI,0003
		mov CL,CARRO2I
		call colocar_mapa

		mov SI,0000
		mov DI,0004
		mov CL,CARRO1
		call colocar_mapa

		mov SI,0000
		mov DI,0005
		mov CL,CARRO2I
		call colocar_mapa

		mov SI,0000
		mov DI,0006
		mov CL,CARRO3
		call colocar_mapa

		mov SI,0000
		mov DI,0007
		mov CL,CARRO1
		call colocar_mapa

		mov SI,0000
		mov DI,0008
		mov CL,CARRO1
		call colocar_mapa

		mov SI,0000
		mov DI,0009
		mov CL,CARRO2I
		call colocar_mapa

		mov SI,0000
		mov DI,000a
		mov CL,CARRO3I
		call colocar_mapa

		mov SI,0000
		mov DI,000b
		mov CL,CARRO2
		call colocar_mapa

		mov SI,0000
		mov DI,000c 
		mov CL,CARRO3
		call colocar_mapa

		mov SI,0000
		mov DI,000d
		mov CL,CARRO1I
		call colocar_mapa

		mov SI,0000
		mov DI,000e 
		mov CL,CARRO1I
		call colocar_mapa

		mov SI,0000
		mov DI,000f 
		mov CL,CARRO2I
		call colocar_mapa

		mov SI,0000
		inc DI
		mov CL,CARRO2I
		call colocar_mapa

		mov SI,0000
		mov DI,0010
		mov CL,CARRO3
		call colocar_mapa

		mov SI,0000
		mov DI,0011
		mov CL,CARRO3
		call colocar_mapa

		mov SI,0000
		mov DI,0012
		mov CL,CARRO2I
		call colocar_mapa

		mov SI,0000
		mov DI,0013
		mov CL,CARRO1I
		call colocar_mapa

		mov SI,0000
		mov DI,0014
		mov CL,CARRO2
		call colocar_mapa

		mov SI,0000
		mov DI,0015
		mov CL,CARRO3
		call colocar_mapa

		mov SI,0000
		mov DI,0016
		mov CL,CARRO3I
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
		cmp CL,CARRO1
		je pintar_carro1
		cmp CL,CARRO2
		je pintar_carro2
		cmp CL,CARRO3
		je pintar_carro3
		cmp CL,CARRO1I
		je pintar_carro1
		cmp CL,CARRO2I
		je pintar_carro2
		cmp CL,CARRO3I
		je pintar_carro3
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

pintar_carro1:
		mov BX, offset sprite_carro1
		push BP
		call pintar_sprite
		pop BP
		jmp imprimir_mapa4

pintar_carro2:
		mov BX, offset sprite_carro2
		push BP
		call pintar_sprite
		pop BP
		jmp imprimir_mapa4
	
pintar_carro3:
		mov BX, offset sprite_carro3
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
		mov SI, offset userRol_temp
		mov CL,00
		mov [SI],CL

		mov BX,0000
		mov id_userTemp,BX

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
		
;; SI- buffer
;; salida AL-01 si es válido
;; AL-00 si no
comprobar_contra:
                mov BX,0000
                mov DX,0000
                inc SI
                mov AL,[SI]
                cmp AL, 0f
                jb comprobar_contra_falso
                cmp AL, 19
                ja comprobar_contra_falso
                mov CX,0000
                mov CL,AL
                inc CL
comprobar_contra2:
                dec CL
                jz comprobar_contra_true
                inc SI
                mov AL,[SI]
                cmp AL,"*"
                jz comprobar_contra_Contar_esp
                cmp AL,"_"
                jz comprobar_contra_Contar_esp
                cmp AL, "."
                jz comprobar_contra_Contar_esp
                cmp AL, "-"
                jz comprobar_contra_Contar_esp
                cmp AL, "+"
                jz comprobar_contra_Contar_esp
                cmp AL, "a"
                jae comprobar_contra_min
                cmp AL,"?"
                jae comprobar_contra_may
                jmp comprobar_contra_falso


comprobar_contra_min:
                cmp AL,"z"
                jbe comprobar_contra_Contar_min
                jmp comprobar_contra_falso

comprobar_contra_may:
                cmp AL,"Z"
                jbe comprobar_contra_Contar_may
                jmp comprobar_contra_falso       

comprobar_contra_Contar_esp:
                inc BL
                jmp comprobar_contra2

comprobar_contra_Contar_min:
                inc BH
                jmp comprobar_contra2

comprobar_contra_Contar_may:
                inc DL
                jmp comprobar_contra2



comprobar_contra_true:
                cmp BL,01
                jb comprobar_contra_falso
                cmp BH,04
                jb comprobar_contra_falso
                cmp DL,03
                jb comprobar_contra_falso
                mov AL,01
                ret

comprobar_contra_falso:
                mov AL,00
                ret


;;SI - buffer
;;salida AL-01 si es válido
;; AL-00 si no
comprobar_usuario:
                inc SI
                mov AL,[SI]
                cmp AL,08
                jb comprobar_usuario_falso
                cmp AL,14
                ja comprobar_usuario_falso
                mov CX,0000
                mov CL,AL
                inc SI

                mov AL,[SI]
                cmp AL,61
                jb comprobar_usuario_falso
                cmp AL,7a 
                ja comprobar_usuario_falso
                
comprobar_usuario2:
                dec CL
                jz comprobar_usuario_true
                inc SI
                mov AL,[SI]
                cmp AL,"."
                je comprobar_usuario2
                cmp AL,"-" 
                je comprobar_usuario2
                cmp AL,"_" 
                je comprobar_usuario2
                cmp AL,"a"
                jae comprobar_usuario_letras
comprobar_usuario3:
                cmp AL,"0"
                jae comprobar_usuario_num
                jmp comprobar_usuario_falso


comprobar_usuario_letras:
                cmp AL,"z" 
                jbe comprobar_usuario2
                jmp comprobar_usuario3

comprobar_usuario_num:
                cmp AL,"9" 
                jbe comprobar_usuario2
                jmp comprobar_usuario_falso


comprobar_usuario_true:
                mov Al,01
                ret


comprobar_usuario_falso:
                mov AL,00
                ret



;;SI - Index        
        
buscarUsuario_usuario:
	mov AL,02
	mov DX,offset file_users
	mov AH,3d 
	int 21
	jc error0
        mov handler,AX
	jmp buscarUsuario_usuario2
buscarUsuario_usuario2:
        mov CX,0000
        mov AX,0031
        mul SI
        mov DX,AX
        mov AX,0000
        mov AH,42
        mov BX, handler
        int 21
        jc error2
        
        mov BX, handler
        mov CX, 0031
        mov DX,offset buff_archivoLeer
        mov AH,3f 
        int 21
        jc error5
        
        ;mov DX, offset buff_archivoLeer
        ;mov AH,09
        ;int 21
        
        ;mov BX,0015 
        ;add DX,BX

        
        ;mov AH,09
        ;int 21
        ret


        








error0:
        mov DX,offset m_error0
        mov AH,09
        int 21
        jmp fin



error5:
        mov DX,offset m_error5
        mov AH,09
        int 21
        jmp fin


;;poner la cadena del usuario a buscar en user_temp
;; salida iterador2-> id User
;; AL->01 si si lo encontró
;;AL -> 00 si no

encontrar_User:
        mov BX,0000
        mov iterador2,BX
encontrar_User2:
        call limpiar_buff_archivoLeer
        mov SI, iterador2
        call buscarUsuario_usuario
        
        mov DI, offset buff_archivoLeer
        mov AL,[DI]
        cmp AL,00
        je encontrar_User_false 

        mov SI, offset user_temp
        mov DI, offset buff_archivoLeer
        call comparar_cadenas
        shr AL,1
        jc encontrar_User_true
        mov BX,iterador2
        inc BX
        mov iterador2,BX
        jmp encontrar_User2


encontrar_User_true:
        mov AL,01
        ret

encontrar_User_false:
        mov Al,00
        ret



;; SI-index

bloquear_usuario:
        mov AL,02
	mov DX,offset file_users
	mov AH,3d 
	int 21
	jc error0
        mov handler,AX
	jmp bloquear_usuario2
bloquear_usuario2:
        mov CX,0000
        mov AX,0031
        mul SI
        mov DX,AX
        mov AX,0030
        add DX,AX
        mov AX,0000
        mov AH,42
        mov BX, handler
        int 21
        

        mov DI, offset buff_write1
        mov AL,01
        mov [DI],Al
        mov DX, offset buff_write1
        mov CX,0001
        mov BX,handler
        mov AH,40
        int 21
        jc error3

		mov BX,handler
		mov AH,3e
		int 21 
		jc error4

        ret

;; SI-index

desbloquear_usuario:
        mov AL,02
	mov DX,offset file_users
	mov AH,3d 
	int 21
	jc error0
        mov handler,AX
	jmp desbloquear_usuario2
desbloquear_usuario2:
        mov CX,0000
        mov AX,0031
        mul SI
        mov DX,AX
        mov AX,0030
        add DX,AX
        mov AX,0000
        mov AH,42
        mov BX, handler
        int 21
        

        mov DI, offset buff_write1
        mov AL,00
        mov [DI],Al
        mov DX, offset buff_write1
        mov CX,0001
        mov BX,handler
        mov AH,40
        int 21
        jc error3

		mov BX,handler
		mov AH,3e
		int 21 
		jc error4

        ret

;; SI-index

promover_usuario:
        mov AL,02
	mov DX,offset file_users
	mov AH,3d 
	int 21
	jc error0
        mov handler,AX
	jmp promover_usuario2
promover_usuario2:
        mov CX,0000
        mov AX,0031
        mul SI
        mov DX,AX
        mov AX,002f
        add DX,AX
        mov AX,0000
        mov AH,42
        mov BX, handler
        int 21
        

        mov DI, offset buff_write1
        mov AL,01
        mov [DI],Al
        mov DX, offset buff_write1
        mov CX,0001
        mov BX,handler
        mov AH,40
        int 21
        jc error3

		mov BX,handler
		mov AH,3e
		int 21 
		jc error4

        ret

;; SI-index

despromover_usuario:
        mov AL,02
	mov DX,offset file_users
	mov AH,3d 
	int 21
	jc error0
        mov handler,AX
	jmp despromover_usuario2
despromover_usuario2:
        mov CX,0000
        mov AX,0031
        mul SI
        mov DX,AX
        mov AX,002f
        add DX,AX
        mov AX,0000
        mov AH,42
        mov BX, handler
        int 21
        

        mov DI, offset buff_write1
        mov AL,00
        mov [DI],Al
        mov DX, offset buff_write1
        mov CX,0001
        mov BX,handler
        mov AH,40
        int 21
        jc error3

		mov BX,handler
		mov AH,3e
		int 21 
		jc error4

        ret


limpiar_buff_archivoLeer:
        mov SI, offset buff_archivoLeer
        mov AL,00
limpiar_buff_archivoLeer2:
        mov AH,[SI]
        cmp AH,00
        je limpiar_buff_archivoLeer3
        mov [SI],AL
        inc SI
        jmp limpiar_buff_archivoLeer2
limpiar_buff_archivoLeer3:
        ret


;;DI donde tengo el numero a convertir
;;SI donde guardar el resultado

num_toAscii:
        mov AX,[DI]
        mov CX,0000
        cmp AX,09F6
        ja error_division
        cmp AX,000a
        jae ciclo_num_toAscii
        add AL,"0"
        mov [SI],AL
        inc SI
        mov AL,"$"
        mov [SI],AL
        ret

ciclo_num_toAscii:
        mov BL,0a
        div BL
        mov DX,0000
        add AH,"0"
        mov DL,AH
        push DX
        inc CL
        mov AH,00
        cmp AL,0a 
        jae ciclo_num_toAscii
        add AL,"0"
        mov DX,0000
        mov DL,AL
        push DX
        inc CL
        ;;guardar el numero en SI
ciclo_guardarAscii:
        mov AX,0000
        pop AX
        mov [SI],AL
        inc SI
        loop ciclo_guardarAscii
        mov AL,"$"
        mov [SI],AL
        ret

        
error_division:
        ;mov dx, offset mensajeE_div
        ;mov AH,09
        ;int 21
		int 03
        mov AL,"$"
        mov [SI],AL
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
