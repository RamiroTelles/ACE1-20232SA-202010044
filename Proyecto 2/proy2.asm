JUGADOR		   equ 01
ACERA          equ 02
CARRIL         equ 03
CARRO          equ 04
CAMION         equ 05

.MODEL small
.RADIX 16
.STACK
.DATA
x_jugador dw 0008
y_jugador dw 0008

x_temp dw 0000
y_temp dw 0000

mensaje_nose db "nose :/$"

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
		call reiniciar_mapa
		
		call imprimir_mapa
		


		;; ...
		;;
infinito:
		
		jmp infinito
		jmp fin

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




fin:
.EXIT
END
