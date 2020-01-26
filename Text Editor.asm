model tiny
.386
.data
	file_name	db 8 dup(?)			;name of file to open
	index		dw 0
	buffer_in	db 255				;file data buffer
	buffer_out	db 2000 dup(' ')	;out buffer data
	empty_line	db 2000 dup(' ')
	error_msg	db 'Cannot open the file.$'
	size_msg	db 'File is too big.$'
	read_msg	db 'Cannot read the file.$'
	write_msg	db 'Cannot write the file.$'
	close_msg	db 'Cannot close  the file.$'
.code
org 100h
;==================================== MAIN PROCESS
start:
	call CONSOLE		; read psp
	call FILE_OPEN
	jc   EXIT     		; jump if error
	call FILE_READ
	jc   EXIT     		; jump if error
	call FILE_WRITE
	jc   EXIT     		; jump if error
	call FILE_CLOSE
EXIT:  .EXIT
;DOS exit
	; mov     ah,4Ch
	; int     21h
;====================================== READ FILENAME
CONSOLE PROC NEAR
	mov		bx, offset 082h			; get the text from psp
	mov		si, offset file_name		; index for file name
	mov		dl, [bx]		; inputs the next character
	cmp		dl, 0 			; check if user did not type anything
	je		proceed
read_psp:
	mov		byte ptr[si], dl		; store from psp
	inc		bx
	inc		si
	mov		dl, [bx]		; inputs the next character
	cmp		dl, 0Dh 		; check for CR
	je		proceed			; jumps to end of file
	jmp		read_psp
proceed:
	ret
CONSOLE	ENDP

;======================================= OPEN FILE
FILE_OPEN PROC NEAR
	mov 	ax, 3D02h		;open file with index function
	mov		dx, offset file_name		;set up pointer to ASCIIZ string
	int		21h				;DOS call
	jc		file_error		;jump if error
	mov		index, ax		;save_file file index
	mov		si, 1			;for checking file line size
	mov		di, 0			;for index of new_file buffer_in
	;set video mode and clear screen
	mov     ah,0    		;set mode function
	mov     al,3       		;80x25 color text
	int     10h        		;set mode
	ret	
file_error:
	lea		dx, error_msg	;set up pointer to error message
	mov  	ah, 9			;display string function
	int		21h				;DOS call
	stc						;set error flag
	ret
FILE_OPEN ENDP

;============================================ READ FILE
FILE_READ PROC NEAR
read:
	mov		ah, 3Fh   		;read from file function
	mov		bx, index		;load file index
	lea		dx, buffer_in	;set up pointer to data buffer_in
	mov		cx, 1     		;read one byte
	int		21h      		;DOS call
	jc 		reading_error 	;jump if error
	cmp		ax, 0     		;were 0 bytes read?
	jz 		eof     		;yes, end of file found
	mov		dl, buffer_in	;no, load file character
	cmp		dl, 1ah   		;is it Control-Z <EOF>?
	jz 		eof     		;jump if yes
	mov		ah, 2     		;display character function
	int		21h      		;DOS call
	cmp		buffer_in, 10	;see if it is the end of line
	je		end_line		;jump if it was end of line
	mov		buffer_out[di], dl	;save_file character in buffer
	mov		empty_line[di], ' '	;save_file for an empty_line file
	inc		di				;next_char buffer_in index
	jmp		FILE_READ 		;and repeat
end_line:					;this is if there was a new_file line
	mov		cx,	si			;get value of si
	imul	cx, 80			;move to end of line
	sub		cx, 1			;index format
	mov		di, cx
	mov		buffer_out[di], 10	;add new_file line in buffer
	mov		empty_line[di], 10	;add new_file line for empty_line
	inc		di				;next line in buffer
	inc		si				;add line count
	cmp		si, 26 			;line limit
	je		size_error		;jump if it is less than or equal to 25
	jmp		FILE_READ 		;and repeat
reading_error:
	;set video mode and clear screen
	mov     ah, 0			;set mode function
	mov     al, 3			;80x25 color text
	int     10h            	;set mode
	lea		dx, read_msg	;set up pointer to error message
	mov		ah, 9    		;display string function
	int		21h     		;DOS call
	stc		        		;set error flag
	ret
size_error:
	;set video mode and clear screen
	mov     ah,0            ;set mode function
	mov     al,3            ;80x25 color text
	int     10h             ;set mode
	lea		dx, size_msg	;set up pointer to error message
	mov  	ah, 9			;display string function
	int		21h				;DOS call
	stc						;set error flag
	ret
eof:						;now we want to print_fill the rest with end_lines
	mov		cx,	si			;get value of si
	imul	cx, 80			;move to end of line
	sub		cx, 1			;index format
	mov		di, cx
print_fill:
	mov		buffer_out[di], 10	;add line
	mov		empty_line[di], 10	;add line to empty_line
	add		di, 80			;now we just keep jumping by 80
	inc		si				;add line count
	cmp		si, 24			;line limit until line 25
	jle		print_fill
	ret
FILE_READ ENDP
;============================================== WRITE FILE
FILE_WRITE PROC NEAR
	mov		di, 0			;counter for buffer_in
;move cursor to upper left corner
	mov     ah,2           	;move cursor function
	xor     dx,dx          	;position (0,0)
	mov     bh,0           	;page 0
	int     10h            	;move cursor
;get keystroke
	mov     ah,0           	;keyboard input function
	int     16h            	;ah=scan code, al = ascii code
input_keypress:
;ctrl keys
	cmp		al, 5
	je		encrypt_file
	cmp		al, 17
	je		quit_file
	cmp		al, 19
	je		save_file
	cmp     al, 0          	;al = 0?
	jne     else_          	;no, character key
;then
	call    GOTO_CURSOR    	;move_cursor function
	jmp     input_key		;get next keystroke
else_:
	jmp		input_key
;============================================ CHECK NEXT LINE / END OF FILE
	;locate cursor
	mov     ah,3            ;get cursor location
	mov     bh,0            ;on page 0
	int     10h             ;dh = row, dl = col
	;check end of line writing
	cmp		dl, 79			;compare to a end of line
	jl		input_key		;if not, jump
	cmp		dh, 24
	jl		linemod
	dec		di				;make sure buffer index doesn't move
	mov		dl, 78			;make sure cursor doesn't move
	mov     ah,2            ;cursor move function
	int     10h             ;move cursor
	jmp		input_key
linemod:					;check onew_liney for new_file line
	inc		di				;else skip the new_fileline character
	;move cursor
	xor		dl, dl			;col = 0
	inc		dh				;row ++
	mov     ah,2            ;cursor move function
	int     10h             ;move cursor
input_key:
	mov     ah,0            ;get keystroke function
	int     16h             ;ah=scan code,al=ASCII code
	jmp     input_keypress
;============================================== ENCRYPT FILE
encrypt_file:
	mov 	di, 0			;used for counter
	;move cursor
	xor		dx, dx			;start cursor at 0, 0
	mov     ah,2            ;cursor move function
	int     10h             ;move cursor
shift_char:
	xor		ah, ah
	mov		al, buffer_out[di]	;get the character from buffer
	cmp		al, ' '			;don't encrypt_file empty_line lines
	je		skip
	cmp		al, 10			;don't encrypt_file new_file lines
	je		new_line
	add		ax, 47			;shift
	cmp		ax, 127			;is it greater than available chars?
	jl		print			;if not jump
	sub		ax, 94			;else subtract (33 based system)
print:
	;display character
	mov     ah, 2           ;display character func
	mov     dl, al          ;GET CHARACTER
	int     21h             ;display character
	mov		buffer_out[di], al	;save_file to buffer
	mov     ah,3            ;get cursor location
	mov     bh,0            ;on page 0
	int     10h             ;dh = row, dl = col
	jmp		next_char
new_line:
	;move cursor
	inc		dh				;next line
	xor		dl, dl			;col = 0
	mov     ah, 2           ;cursor move function
	int     10h             ;move cursor
	jmp 	next_char
skip:
	;move cursor
	inc		dl				;next_char
	mov     ah,2            ;cursor move function
	int     10h             ;move cursor
next_char:
	inc 	di
	cmp		di, 1999		;is it the last character?
	jne		shift_char		;if not, loop
	mov		di, 0			;reset location of buffer index
	;move cursor
	xor		dx, dx			;start cursor at 0, 0
	mov     ah,2            ;cursor move function
	int     10h             ;move cursor
	jmp		input_key
;=================================================== QUIT FILE
quit_file:
	ret
;=================================================== SAVE FILE
save_file:
	; set position in file to top left corner
	mov		ax, 4200h 		;set cursor to the beginning of file
	mov		bx, index
	xor		cx, cx
	xor		dx, dx
	int		21h
	;write in file
    mov		ah, 40h
	mov		bx, index
	mov		cx, 1999		;do not include last line
    mov		dx, offset buffer_out
    int		21h
	jc 		write_error   	;jump if error
	ret
write_error:
	;set video mode and clear screen
	mov     ah, 0           ;set mode function
	mov     al, 3           ;80x25 color text
	int     10h             ;set mode
	lea		dx, write_msg	;set up pointer to error message
	mov		ah, 9			;display string function
	int		21h 			;DOS call
	stc						;set error flag
	ret
FILE_WRITE ENDP

;=================================================== CLOSE FILE
FILE_CLOSE PROC NEAR
	mov     ah, 0           ;set mode function
	mov     al, 3           ;80x25 color text
	int     10h             ;set mode
	mov		ah, 3Eh			;close file with index function
	mov		bx, index		;load file index
	int		21h		  		;DOS call
	jc 		close_error   	;jump if error
	ret
close_error:
	;set video mode and clear screen
	mov     ah, 0           ;set mode function
	mov     al, 3           ;80x25 color text
	int     10h             ;set mode
	lea		dx, close_msg	;set up pointer to error message
	mov		ah, 9			;display string function
	int		21h 			;DOS call
	stc						;set error flag
	ret
FILE_CLOSE ENDP

;==================================================== MOVE CURSOR
GOTO_CURSOR:
; operates the arrow keys
; input: ah scan code
; output: none 
	push    bx
	push    cx
	push    dx
	push    ax              ;save_file scan code
;locate cursor
	mov     ah,3            ;get cursor location
	mov     bh,0            ;on page 0
	int     10h             ;dh = row, dl = col
	pop     ax              ;retrieve scan code
;case scan code of
	cmp     ah,72           ;up arrow?
	je      up_cursor		;yes, move_cursor
	cmp     ah,75           ;left arrow?
	je      left_cursor		;yes, move_cursor
	cmp     ah,77  			;right arrow?
	je      right_cursor	;yes, move_cursor
	cmp     ah,80  			;down arrow?
	je      down_cursor		;yes, move_cursor
	jmp     more_input      ;other function key
up_cursor:
	cmp     dh,0            ;row 0?
	je		move_cursor
	dec     dh              ;no, row = row - 1
	sub		di, 80
	jmp     move_cursor     ;go to move_cursor
down_cursor:
	cmp     dh,24           ;last row?
	je      move_cursor     ;yes, just move_cursor
	inc     dh              ;no, row = row + 1
	add		di, 80
	jmp     move_cursor     ;go to move_cursor
left_cursor:
	cmp     dl,0     		;column 0?
	jne     move_left    	;no, move to left
	cmp     dh,0     		;row 0?
	je      move_cursor  	;yes, just move_cursor
	dec     dh              ;row = row - 1
	sub		di, 80
	mov     dl, 78          ;last column 
	jmp     move_cursor     ;go to move_cursor
right_cursor:
	cmp     dl, 78          ;last column?
	jne     move_right      ;no, move to right
	cmp     dh,24           ;last row?
	je      move_cursor     ;yes, just move_cursor
	inc     dh              ;row = row + 1
	add		di, 80			;go 1 line down
	mov     dl,0            ;col = 0
	jmp     move_cursor     ;go to move_cursor
move_left:
	dec     dl              ;col = col - 1
	dec		di				;1 line left
	jmp     move_cursor     ;go to move_cursor
move_right:
	inc     dl              ;col = col + 1
	inc		di				;1 line right
	jmp     move_cursor     ;go to move_cursor
move_cursor:
	mov     ah,2            ;cursor move function
	int     10h             ;move cursor
more_input:
	pop     dx
	pop     cx
	pop     bx
	ret	
	
end start
