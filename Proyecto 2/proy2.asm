.MODEL small
.RADIX 16
.STACK
.DATA
x_jugador dw 0138
y_jugador dw 00C0
sprite_jugador db 00, 00, 00, 05, 05, 00, 00, 00 
               db 00, 00, 00, 05, 05, 00, 00, 05 
               db 00, 05, 05, 05, 05, 05, 05, 00 
               db 05, 00, 00, 05, 05, 00, 00, 00 
               db 00, 00, 00, 05, 05, 00, 00, 00 
               db 00, 00, 05, 05, 05, 05, 00, 00 
               db 00, 00, 05, 00, 00, 05, 00, 00 
               db 00, 05, 05, 00, 00, 05, 05, 00 
.CODE
.STARTUP
		;; ingreso al modo de video 13h
		mov AL, 13
		mov AH, 00
		int 10
		;; ...
		mov SI, 0000
		mov DI, 0000
		mov AL,05
		mov CX,0008
		mov DX, offset sprite_jugador
		mov SI, [x_jugador]
		mov DI, [y_jugador]
		mov BX, offset sprite_jugador
		call pintar_sprite
		;;mov AX, 


        


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

;; SI -> sprite
;; DX - x
;; DI - y

;;pintar_sprite:
		mov CL,08
		mov CH, 08
;;ciclo_filas_sprite:
;;		dec CL
;;		je final_pintarSprite 
;;ciclo_columnas_sprite:

		
		
;;		ret

;; SI - x
;; DI - y
;; BX - sprite		
pintar_sprite:
		;;mov SI, [x_jugador]
		;;mov DI, [y_jugador]
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
		mov SI, [x_jugador]
		xchg BP, CX
		loop ciclo_filas
		ret



fin:
.EXIT
END
