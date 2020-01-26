;Game of 19 - By Krushang Shah

.model tiny

cseg segment
    assume cs:cseg, ds:cseg
    org 100h
start:
    jmp realstart

;---------------- CLEAR SCREEN VARIABLES

    WORLDC db 007h          ;World background,foreground color
    WORLDT db 020h          ;World type
    SCREEN dw 80*25 dup(?)  ;array for pre-game screen saving

;---------------- BOARD VARIABLES

    ;COLOR
    TILEC db 074h           ;Tile background,foreground color
    BOARDC db 002h          ;GameBoard background,foreground color

    ;BOX
    POS dw 00657            ;Gameboard top left position
    WIDE dw 00010           ;Gameboard Box Width
    HEIGHT dw 00002         ;Gameboard Box Height

    ;BOARD DIMENSIONS
    POS_OFF dw 0            ;Position with byte offset 
    WIDE_OFF dw 0           ;Box Width with byte offset 
    BOARD_WIDE dw 0         ;Total Board Width (4*Wide+5)
    BOARD_WIDE_OFF dw 0     ;Board Width with byte offset 
    BOARD_HIGH dw 0         ;Board Height with byte offset (4*HEIGHT+5)

    NEWL dw 00072           ;New Line, includes offset.
                            ;NOTE: For each point reduced/increased in WIDE, 
                            ;increase/decrease NEWL respectively by 2

;-----------------------GAME VARIABLES

    ;----------------NUMBERS
	
    NUMS db 'D97A14GB2H86ECF3IJ5'
	ORIG db '123456789ABCDEFGHIJ'
	
	;----------------TITLE AND INSTRUCTIONS
	
	title_s db 'Game of 19 - By Krushang Shah', 13, 10, '$'
	instructions1 db '   * Arrange the numbers in increasing order.',13,10, '$'
	instructions2 db '   * Use the arrow keys to move the white tile to swap the number. ',13,10, '$'
	instructions3 db '   * Press ESC key to exit the game.',13,10, '$'
	
	ZERO db ' '
    Z_INDX dw 19                    ;index location of ' ' in array
	winMsg db "WINNER!!!$"
	
    ;---------------NUMBER POSITIONS
    NUMS_POS_OFF dw ?               ;Starting position offset
    NEWL_NUMS dw ?                  ;offset between num lines
    NEWL_NUMS_HIGH dw ?             ;offset between num lines height
    

    ;---------------BLANK TILE INFO
    EMP_UD dw ?                    ;y (up/down) offset for empty tile
    EMPTY dw 3462                   ;initially loaded with staring  position 
                                    ;of the zero tile, updated throughout the game

;------------------- MESSAGE BOXES INSTRUCTION AND QUIT

    ;----------- MESSAGE BOX DIMENSIONS
    MSGBOXL dw 00013            ;Message Box Lenth (+2 for corners)
    MSGBOXC db 017h             ;Message Box Color

    ;----------- POSITIONS
    MSG_BOX_0FF dw 01664        ;Starting location for mesage box 
    TEXT_OFF dw 01826           ;starting location for text in message box
    NEWL_MBOX dw 00132          ;New line, includes offset for Message box

    ;----------- TEXT
    QUIT_M1 db 'ARE YOU SURE?'  ;quit message preface
    QUIT_M2 db ' QUIT? (y/n) '  ;quit message
    WIN_MSG db '  YOU WON!!  '  ;win message
    NEW_M1 db '  NEW GAME?  '
    NEW_M2 db '    (y/n)    '
    MSG_LEN dw 00013            ;win message length
    IN_MSG db '    INSTRUCTIONS     use arrows to move   press esc to quit     press any key...  '
    IN_LEN dw 20                ;Instruction Message Length
    IN_OFF dw 1496              ;Instruction Message Offset (28,7) = 2*x+160*y
    IN_NEWL dw 118              ;Instruction Message Offset for new Line
                                ;160-(IN_LEN*2)-2

;-------------------- TITLE AND INSTRUCTION PRINT
	
	TITLES:	
		mov     ah, 2       ;move cursor function
		mov		dl, 25		;update cursor
		mov		dh, 1
		mov     bh, 0		;page 0
		int     10h			;move cursor
		mov		dx, offset title_s
		mov		ah, 9
		int		21h
	RET
	
	INSTRUCTIONS:
	
		mov     ah, 2       ;move cursor function
		mov		dl, 0		;update cursor
		mov		dh, 3
		mov     bh, 0		;page 0
		int     10h			;move cursor
		mov		dx, offset instructions1
		mov		ah, 9
		int		21h
	
		mov     ah, 2       ;move cursor function
		mov		dl, 0		;update cursor
		mov		dh, 4
		mov     bh, 0		;page 0
		int     10h			;move cursor
		mov		dx, offset instructions2
		mov		ah, 9
		int		21h
	
		mov     ah, 2       ;move cursor function
		mov		dl, 0		;update cursor
		mov		dh, 5
		mov     bh, 0		;page 0
		int     10h			;move cursor
		mov		dx, offset instructions3
		mov		ah, 9
		int		21h
	
	RET

;----------------------- SET THE VARIABLES

	SET_VARS:
      sub ax,ax
      sub bx,bx
          ;POS_OFF (generate reflect byte offset (2*x))
            mov ax,POS
            shl ax,1                    ;mul by 2
            mov POS_OFF,ax
          ;WIDE_OFF (Generate to reflect byte offset (2*x))
            mov ax,WIDE
            shl ax,1                    ;mul by 2
            mov WIDE_OFF,ax
          ;BOARD_WIDE: (full board width W/O offset)
            mov ax,WIDE
            shl ax,2                    ;mul by 4
            add ax,5
            mov BOARD_WIDE,ax
          ;BOARD_WIDE_OFF: (full board width W/ offset)
            mov ax,BOARD_WIDE
            shl ax,1                    ;mul by 2
            mov BOARD_WIDE,ax
          ;BOARD_HIGH: (full board height)
            mov ax,HEIGHT
            shl ax,2                    ;mul by 4
            add ax,5
            mov BOARD_HIGH,ax ;NUMS_POS_OFF
            mov bx,POS_OFF
            mov ax,160
            mov cx,HEIGHT
            shr cx,1                    ;mul by 2
            inc cx
            mul cx                      ; = (HEIGHT/2+1)*160
            add bx,ax
            add bx,WIDE
            mov NUMS_POS_OFF,bx
          ;NEWL_NUMS
            mov bx,160
            mov ax,WIDE_OFF
            add ax,2
            shl ax,2                    ; div by 4
            sub bx,ax                   ; = 160-(WIDE_OFF+2)*4
            mov NEWL_NUMS,bx
          ;NEWL_NUMS_HIGH
            mov ax,160
            mov cx,HEIGHT
            mul cx
            mov NEWL_NUMS_HIGH,ax       ; = 160*HEIGHT
          ;EMPTY_Y
            mov ax,HEIGHT
            inc ax
            mov cx,160
            mul cx                      ; = (Height+1)*160
            mov EMP_UD,ax
    RET                     ;RET SET_VARS

;-------------------------- SAVE AND RESTORE SCREEN

    SAVE_SCREEN:            ;save L->R,B->T
        mov si,offset SCREEN
        sub bx,bx
        mov cx,25*80
        SV_SCRN:
            mov ax,es:[bx]
            mov [si],ax
            add si,2
            add bx,2
        LOOP SV_SCRN
    RET                     ;RET SAVE_SCREEN

    RESTORE_SCREEN:
        mov si,offset SCREEN
        sub bx,bx
        mov cx,25*80
        RST_SCRN:
            mov ax,[si]
            mov es:[bx],ax
            add si,2
            add bx,2
        LOOP RST_SCRN
    RET                     ;RET SAVE_SCREEN

;----------------------------- CLEAR SCREEN
    CLRSCRN:
        push ax
        sub bx,bx
        mov ah,WORLDC
        mov al,WORLDT
        mov cx,25*80
        CLEAR:
            mov es:[bx],ax
            add bx,2
        LOOP CLEAR
        mov ax,00100h       ;set text-mode cursor shape
        mov cx,2607h        ;hide cursor
        INT 10h             ;text-mode int
        pop ax
    RET                     ;CLRSCRN
   
;--------------------- PRINTING THE BOARD

DRAW_BOARD:
        push ax
        mov bx,POS_OFF              ;Sets intial position for board (TL Corner)
        mov ah,BOARDC               ;sets board color
        mov al,0C9h                 ;Top Left Corner Piece
        mov es:[bx],ax
        call DRAW_HRZ_LN            ;Build Top Border Box 1
        mov cx,3                    ;Build Top Border Box 2-4
        BUILD_TOPBOX_234:                       
            add bx,2
            mov al,0CBh             ; T piece
            mov es:[bx],ax
            call DRAW_HRZ_LN
        LOOP BUILD_TOPBOX_234
        add bx,2
        mov al,0BBh                 ;Top Right Corner Piece
        mov es:[bx],ax
        add bx,NEWL                 ;Move to next line
        mov cx,HEIGHT
        BUILD_ROW1_WALLS:           ;Build Row 1 Walls
            call DRAW_VRT_LN
            add bx,NEWL
        LOOP BUILD_ROW1_WALLS
        mov cx,4
        BUILD_ROW234:               ;Build Walls & Ceilings, Rows 2,3,4
            call DRAW_LVL           ;Ceils call
            add bx,NEWL
            push cx
            mov cx,HEIGHT
            BUILD_WALL234:          ;Walls Call
                call DRAW_VRT_LN
                add bx,NEWL
            LOOP BUILD_WALL234
            pop cx
        LOOP BUILD_ROW234
        mov al,0C8h                 ;Bottom Left Corner Piece
        mov es:[bx],ax
        call DRAW_HRZ_LN            ;Build Floor column 1
        add bx,2
        mov cx,3
        BUILD_BTMBOX_234:           ;Builds Board floor for colums 2,3,4
            mov al,0CAh             ;upside down T piece
            mov es:[bx],ax
            call DRAW_HRZ_LN
            add bx,2
        LOOP BUILD_BTMBOX_234
        mov al,0BCh
        mov es:[bx],ax
        pop ax
    RET                             ;RET DRAW_BOARD

    DRAW_HRZ_LN:
        push cx
        mov cx,WIDE
        mov al,0CDh                 ;double horiz. line piece
        DHL:
            add bx,2                ;loop adds 2*WIDE to bx (def =20)
            mov es:[bx],ax
        LOOP DHL
        pop cx
    RET                             ;RET DRAW_HRZ_LN

    DRAW_VRT_LN:
        push cx
        mov cx,4                    ;4 COlumns...
        mov al,0BAh                 ;double horiz. line piece
        DVL:
            mov es:[bx],ax
            add bx,WIDE_OFF
            add bx,2                
        LOOP DVL
        mov es:[bx],ax              
        pop cx
    RET                             ;RET DRAW_VRT_LN

    DRAW_LVL:
        push cx
        mov al,0CCh
        mov es:[bx],ax
        call DRAW_HRZ_LN
        mov cx,3
        COLUMNS:
            add bx,2
            mov al,0CEh
            mov es:[bx],ax
            call DRAW_HRZ_LN
        LOOP COLUMNS
        add bx,2
        mov al,0B9h
        mov es:[bx],ax
        pop cx
    RET                             ;RET DRAW_LVL
    
;------------------------ TILES OR BOXES

    BUILD_TILES:                    ;Builds the Game Tiles
        mov bx,POS_OFF
        mov cx,5
        BUILD_COLUMN:
            push cx
            mov cx,HEIGHT
            add bx,160              ;Offset to place tile in board boxes
            ROW:                    ;Builds ea. Row's tiles
                push cx
                mov cx,4            ;4 Rows
                SUB_ROW:
                    call SET_TILE
                    add bx,2
                LOOP SUB_ROW
                add bx,NEWL
                pop cx
            LOOP ROW
            pop cx
       LOOP BUILD_COLUMN
    RET                             ;RET BUILD_TILES

    SET_TILE:
        push cx
        mov cx,wide
        dec cx
        mov ah,TILEC
        mov al,0FFh
        TILE:
            add bx,2
            mov es:[bx],ax
        LOOP Tile
        mov ax,030DEh
        add bx,2
        mov es:[bx],ax
        mov ah,TILEC
        pop cx
    RET                             ;RET SET_TILE

    EMPTY_TILE:
        push WIDE
        sub ah,ah
        mov al,030h
        mov bx,EMPTY
        mov cx,HEIGHT
        EMPTY_Y:                    
            push cx
            mov cx,WIDE
            EMPTY_X:
                mov es:[bx],ax
                add bx,2
            LOOP EMPTY_X
            add bx,160
            sub bx,WIDE_OFF
            pop cx
        LOOP EMPTY_Y
        pop WIDE
    RET                             ;RET EMPTY_TILE

    SET_NUMS:
        mov di,NUMS_POS_OFF
        mov si,offset NUMS
        mov ah,TILEC
        mov cx,5
        NUM_Y:
            push cx
            mov cx,4
            NUM_X:
                mov al,[si]
                    cmp al,039h
                        JNG ASCII_NUMS  ;for values 1-9 
                    sub di,2            ;offset for '1'
                    mov bh,TILEC
                    mov bl,31h          ;'1'
                    mov es:[di],bx
                    add di,2
                    sub al,11h          ;subtract 10 from N={A-F} -> N*={0-5}
                ASCII_NUMS:
                    mov es:[di],ax
                    inc si
                    add di,WIDE_OFF
                    add di,2
            LOOP NUM_X
            add di,NEWL_NUMS
            add di,NEWL_NUMS_HIGH
            pop cx
        LOOP NUM_Y
    RET                             ;RET SET_NUMS
    
;-------------------EXECUTION INPUT AND OUTPUT

    REDRAW:
        call DRAW_BOARD
        call BUILD_TILES
        call SET_NUMS
        call EMPTY_TILE 
    RET                             ;RET REDRAW
    
    FIRST_KEY:
        push ax
        push bx
        sub ax,ax                   ; set to zero
            mov ah,10h                  ;read Keypress Code for INT 16h
            INT 16h                     ;Interrupt call for input
    RET                             ;FIRST KEY
	
    INPUT:
        push ax
        push bx
        sub ax,ax                   ; set to zero
        CHECK_AGAIN:
            mov ah,0                  ;read Keypress Code for INT 16h
            INT 16h                     ;Interrupt call for input
            cmp ah,72                 ;'w' == up
                JZ w
            cmp ah,75                 ;'a' == left
                JZ a
            cmp ah,80                 ;'s' == down
                JZ s
            cmp ah,77                 ;'d' == right
                JZ d
            cmp al,01Bh                 ;'q' == quit
                JZ q
            cmp al,051h
                jz SHFT_Q
        jmp CHECK_AGAIN
        w:
            call UP
            jmp check_again
        a:
            call LEFT
            jmp check_again
        s:
            call DOWN
            jmp check_again
        d:
            call RIGHT
            jmp check_again
        q:
            call QUIT
        SHFT_Q:  jmp REAL_QUIT
    RET                             ;RET INPUT

    RIGHT:
        cmp Z_INDX,0               ;checks if in right col (illegal)
            JE END_RIGHT
        cmp Z_INDX,4               ;checks if in right col (illegal)
            JE END_RIGHT
        cmp Z_INDX,8               ;checks if in right col (illegal)
            JE END_RIGHT
        cmp Z_INDX,12              ;checks if in right col (illegal)
            JE END_RIGHT
		cmp Z_INDX,16              ;checks if in right col (illegal)
            JE END_RIGHT
        mov bx,Z_INDX        
        mov ah,NUMS[bx]     
        mov al,NUMS[bx-1]  
        mov NUMS[bx],al
        mov NUMS[bx-1],ah           
        sub bx,1                   
        mov Z_INDX,bx             
        mov bx,EMPTY
        sub bx,WIDE_OFF
        sub bx,2
        mov EMPTY,bx
        call BUILD_TILES
        call SET_NUMS               
        call EMPTY_TILE
        END_RIGHT:
    RET                             ;RET RIGHT

    LEFT:
        cmp Z_INDX,3                ;checks if in left col (illegal)
            JE END_LEFT
        cmp Z_INDX,7                ;checks if in left col (illegal)
            JE END_LEFT
        cmp Z_INDX,11               ;checks if in left col (illegal)
            JE END_LEFT
        cmp Z_INDX,15               ;checks if in left col (illegal)
            JE END_LEFT
		cmp Z_INDX,19               ;checks if in left col (illegal)
            JE END_LEFT
        mov bx,Z_INDX               ;sets index for empty value
        mov ah,NUMS[bx]             ;grab empty tile
        mov al,NUMS[bx+1]           ;grab shifted tile
        mov NUMS[bx],al             ;shift empty tile
        mov NUMS[bx+1],ah           ;shift desired tile
        add bx,1                    ;re-index
        mov Z_INDX,bx               ;save re-index
        mov bx,EMPTY
        add bx,WIDE_OFF
        add bx,2
        mov EMPTY,bx
        call BUILD_TILES
        call SET_NUMS               
        call EMPTY_TILE
        END_LEFT:
    RET                             ;RET LEFT

    UP:
        cmp Z_INDX,15               ;checks if in top row (illegal)
            JG END_UP
        mov bx,Z_INDX            
        mov ah,NUMS[bx]         
        mov al,NUMS[bx+4]      
        mov NUMS[bx],al       
        mov NUMS[bx+4],ah    
        add bx,4            
        mov Z_INDX,bx      
        mov bx,EMPTY
        add bx,EMP_UD;EMPTY_Y
        mov EMPTY,bx
        call BUILD_TILES
        call SET_NUMS               
        call EMPTY_TILE
        END_UP:
    RET                             ;RET UP

    DOWN:                           
        cmp Z_INDX,4                ;checks if in bottom row (illegal)
            JL END_DOWN
        mov bx,Z_INDX     
        mov ah,NUMS[bx]    
        mov al,NUMS[bx-4]          
        mov NUMS[bx],al           
        mov NUMS[bx-4],ah        
        sub bx,4                
        mov Z_INDX,bx          
        mov bx,EMPTY
        sub bx,EMP_UD
        mov EMPTY,bx
        call BUILD_TILES
        call SET_NUMS               
        call EMPTY_TILE
        END_DOWN:
    RET                             ;RET DOWN

    QUIT:
        call MSGBOX
        call PRINT_QUIT
        sub ax,ax
        mov ah,10h                  ;Read keypress code for INT 16h
        INT 16h
        cmp al,079h                 ;'y'
            jz TERM_JMP
        call REDRAW
        jmp CHECK_AGAIN
        TERM_JMP:
            jmp REAL_QUIT
    RET                             ;RET QUIT
	
;------------------------ MESSAGE BOXES EXECUTION
    MSGBOX:                          
        push WIDE               ;store "wide" to be modified for DRAW_HRZ_LN
        mov bx,MSG_BOX_0FF      ;Starting location (32,10)
        mov ah,MSGBOXC
        mov al,0C9h             ;Top Left Corner
        mov es:[bx],ax
        mov cx,MSGBOXL
        mov WIDE,cx
        call DRAW_HRZ_LN
        add bx,2
        mov al,0BBh             ;Top Right Corner
        mov es:[bx],ax
        mov cx,2
        MSG_BODY:               ;Creates 2 line high message space
            push cx
            add bx,NEWL_MBOX    ;next line offset
            mov al,0BAh         ;Left Border
            mov es:[bx],ax
            mov al,020h         ;Space
            mov cx,MSGBOXL
            MSG_SPACE:          ;Creates Message 'space'
                add bx,2
                mov es:[bx],ax
            LOOP MSG_SPACE
            add bx,2
            mov al,0BAh         ;Right Border
            mov es:[bx],ax
            pop cx
        LOOP MSG_BODY
        add bx,NEWL_MBOX        ;Next Line offset
        mov al,0C8h             ;Bottom Left Corner
        mov es:[bx],ax
        call DRAW_HRZ_LN
        add bx,2
        mov al,0BCh             ;Bottom Right Corner 
        mov es:[bx],ax
        sub ax,ax
        pop ax                  ;Restore 'WIDE'
        mov WIDE,ax
        sub ax,ax
    RET                             ;RET QUITBOX

    PRINT_QUIT:
        mov di,TEXT_OFF
        mov si,offset QUIT_M1
        mov ah,MSGBOXc
        mov cx,MSG_LEN
        Q1:
            mov al,[SI]
            mov es:[di],ax
            inc si
            add di,2
        LOOP Q1
        mov di,TEXT_OFF
        add di,160
        mov si,offset QUIT_M2
        mov cx,MSG_LEN
        Q2:
            mov al,[SI]
            mov es:[di],ax
            inc si;QUIT_M2
            add di,2
        LOOP Q2
    RET                             ;RET PRINT_MSG

;------------------------CODE WITH ONLY CALLS TO THE ABOVE BLOCKS

REALSTART:
    push ax
    mov cx,0b800h       ;Begin display mode...
    mov es,cx
    call SET_VARS
    call SAVE_SCREEN
	call CLRSCRN
    call DRAW_BOARD
    call BUILD_TILES
    call SET_NUMS
    call EMPTY_TILE
	call TITLES
	call INSTRUCTIONS
	call INPUT
	
	
REAL_QUIT:
    call RESTORE_SCREEN
    mov ax,00100h       ;set text-mode cursor shape
    mov cx,060Eh        ;restore cursor
    INT 10h             ;text-mode int
    pop ax
    int 20h
	
cseg ENDS
    END start
