;Krushang Shah
;Game of 19
.model tiny
.code
org 100h
.386

START:   
BOARD:   

   mov ax, 0600h
   mov bh, 01eh
   mov cx, 0000h
   mov dx, 184fh
   int 10h
   

   ;Draw Bound
   mov al, 00
   mov bh, 00
   mov bl, 066h
   mov cx, 46
   mov dl, 6
   mov dh, 5
   lea bp, box1
   mov ah, 13h
   int 10h

   mov al, 00
   mov bh, 00
   mov bl, 066h
   mov cx, 46
   mov dl, 6
   mov dh, 6
   lea bp, box1
   mov ah, 13h
   int 10h

   ;mov ah, 13h
   mov al, 00
   mov bh, 00
   mov bl, 066h
   lea bp, box1
   mov cx, 46
   mov dl, 6
   mov dh, 7
   int 10h

   mov al, 00
   mov bh, 00
   mov bl, 066h
   lea bp, box1
   mov cx, 46
   mov dl, 6
   mov dh, 8
   mov ah, 13h
   int 10h

   mov al, 00
   mov bh, 00
   mov bl, 066h
   mov cx, 46
   mov dl, 6
   mov dh, 9
   lea bp, box1
   mov ah, 13h
   int 10h

   mov al, 00
   mov bh, 00
   mov bl, 066h
   mov cx, 46
   mov dl, 6
   mov dh, 10
   lea bp, box1
   mov ah, 13h
   int 10h

   mov al, 00
   mov bh, 00
   mov bl, 066h
   mov cx, 46
   mov dl, 6
   mov dh, 11
   lea bp, box1
   mov ah, 13h
   int 10h

   mov al, 00
   mov bh, 00
   mov bl, 066h
   mov cx, 46
   mov dl, 6
   mov dh, 12
   lea bp, box1
   mov ah, 13h
   int 10h

   mov al, 00
   mov bh, 00
   mov bl, 066h
   mov cx, 46
   mov dl, 6
   mov dh, 13
   lea bp, box1
   mov ah, 13h
   int 10h

   mov al, 00
   mov bh, 00
   mov bl, 066h
   mov cx, 46
   mov dl, 6
   mov dh, 14
   lea bp, box1
   mov ah, 13h
   int 10h

   mov al, 00
   mov bh, 00
   mov bl, 066h
   mov cx, 46
   mov dl, 6
   mov dh, 15
   lea bp, box1
   mov ah, 13h
   int 10h

   mov al, 00
   mov bh, 00
   mov bl, 066h
   mov cx, 46
   mov dl, 6
   mov dh, 16
   lea bp, box1
   mov ah, 13h
   int 10h
   
   mov al, 00
   mov bh, 00
   mov bl, 066h
   mov cx, 46
   mov dl, 6
   mov dh, 17
   lea bp, box1
   mov ah, 13h
   int 10h
   
   mov al, 00
   mov bh, 00
   mov bl, 066h
   mov cx, 46
   mov dl, 6
   mov dh, 18
   lea bp, box1
   mov ah, 13h
   int 10h
   
   mov al, 00
   mov bh, 00
   mov bl, 066h
   mov cx, 46
   mov dl, 6
   mov dh, 19
   lea bp, box1
   mov ah, 13h
   int 10h
   
   mov al, 00
   mov bh, 00
   mov bl, 066h
   mov cx, 46
   mov dl, 6
   mov dh, 20
   lea bp, box1
   mov ah, 13h
   int 10h
   
   mov al, 00
   mov bh, 00
   mov bl, 066h
   mov cx, 46
   mov dl, 6
   mov dh, 21
   lea bp, box1
   mov ah, 13h
   int 10h
   
   ;make it pretty...
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 8
   mov dh, 6
   lea bp, boxes
   mov ah, 13h
   int 10h
   
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 17
   mov dh, 6
   lea bp, boxes
   mov ah, 13h
   int 10h
   
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 26
   mov dh, 6
   lea bp, boxes
   mov ah, 13h
   int 10h
   
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 35
   mov dh, 6
   lea bp, boxes
   mov ah, 13h
   int 10h
   
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 44
   mov dh, 6
   lea bp, boxes
   mov ah, 13h
   int 10h
   
   ;first copy and paste
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 8
   mov dh, 7
   lea bp, boxes
   mov ah, 13h
   int 10h
   
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 17
   mov dh, 7
   lea bp, boxes
   mov ah, 13h
   int 10h
   
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 26
   mov dh, 7
   lea bp, boxes
   mov ah, 13h
   int 10h
   
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 35
   mov dh, 7
   lea bp, boxes
   mov ah, 13h
   int 10h
   
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 44
   mov dh, 7
   lea bp, boxes
   mov ah, 13h
   int 10h
   
   ;second
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 8
   mov dh, 8
   lea bp, boxes
   mov ah, 13h
   int 10h
   
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 17
   mov dh, 8
   lea bp, boxes
   mov ah, 13h
   int 10h
   
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 26
   mov dh, 8
   lea bp, boxes
   mov ah, 13h
   int 10h
   
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 35
   mov dh, 8
   lea bp, boxes
   mov ah, 13h
   int 10h
   
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 44
   mov dh, 8
   lea bp, boxes
   mov ah, 13h
   int 10h
   
   ;thrid
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 8
   mov dh, 10
   lea bp, boxes
   mov ah, 13h
   int 10h
   
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 17
   mov dh, 10
   lea bp, boxes
   mov ah, 13h
   int 10h
   
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 26
   mov dh, 10
   lea bp, boxes
   mov ah, 13h
   int 10h
   
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 35
   mov dh, 10
   lea bp, boxes
   mov ah, 13h
   int 10h
   
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 44
   mov dh, 10
   lea bp, boxes
   mov ah, 13h
   int 10h
   
   ;four
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 8
   mov dh, 11
   lea bp, boxes
   mov ah, 13h
   int 10h
   
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 17
   mov dh, 11
   lea bp, boxes
   mov ah, 13h
   int 10h
   
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 26
   mov dh, 11
   lea bp, boxes
   mov ah, 13h
   int 10h
   
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 35
   mov dh, 11
   lea bp, boxes
   mov ah, 13h
   int 10h
   
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 44
   mov dh, 11
   lea bp, boxes
   mov ah, 13h
   int 10h
   
   ;five
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 8
   mov dh, 12
   lea bp, boxes
   mov ah, 13h
   int 10h
   
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 17
   mov dh, 12
   lea bp, boxes
   mov ah, 13h
   int 10h
   
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 26
   mov dh, 12
   lea bp, boxes
   mov ah, 13h
   int 10h
   
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 35
   mov dh, 12
   lea bp, boxes
   mov ah, 13h
   int 10h
   
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 44
   mov dh, 12
   lea bp, boxes
   mov ah, 13h
   int 10h
   
   ;six
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 8
   mov dh, 14
   lea bp, boxes
   mov ah, 13h
   int 10h
   
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 17
   mov dh, 14
   lea bp, boxes
   mov ah, 13h
   int 10h
   
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 26
   mov dh, 14
   lea bp, boxes
   mov ah, 13h
   int 10h
   
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 35
   mov dh, 14
   lea bp, boxes
   mov ah, 13h
   int 10h
   
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 44
   mov dh, 14
   lea bp, boxes
   mov ah, 13h
   int 10h
   ;7
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 8
   mov dh, 15
   lea bp, boxes
   mov ah, 13h
   int 10h
   
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 17
   mov dh, 15
   lea bp, boxes
   mov ah, 13h
   int 10h
   
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 26
   mov dh, 15
   lea bp, boxes
   mov ah, 13h
   int 10h
   
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 35
   mov dh, 15
   lea bp, boxes
   mov ah, 13h
   int 10h
   
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 44
   mov dh, 15
   lea bp, boxes
   mov ah, 13h
   int 10h
   
   ;8
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 8
   mov dh, 16
   lea bp, boxes
   mov ah, 13h
   int 10h
   
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 17
   mov dh, 16
   lea bp, boxes
   mov ah, 13h
   int 10h
   
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 26
   mov dh, 16
   lea bp, boxes
   mov ah, 13h
   int 10h
   
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 35
   mov dh, 16
   lea bp, boxes
   mov ah, 13h
   int 10h
   
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 44
   mov dh, 16
   lea bp, boxes
   mov ah, 13h
   int 10h
   
   ;9
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 8
   mov dh, 18
   lea bp, boxes
   mov ah, 13h
   int 10h
   
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 17
   mov dh, 18
   lea bp, boxes
   mov ah, 13h
   int 10h
   
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 26
   mov dh, 18
   lea bp, boxes
   mov ah, 13h
   int 10h
   
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 35
   mov dh, 18
   lea bp, boxes
   mov ah, 13h
   int 10h
   
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 44
   mov dh, 18
   lea bp, boxes
   mov ah, 13h
   int 10h
   
   ;10
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 8
   mov dh, 19
   lea bp, boxes
   mov ah, 13h
   int 10h
   
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 17
   mov dh, 19
   lea bp, boxes
   mov ah, 13h
   int 10h
   
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 26
   mov dh, 19
   lea bp, boxes
   mov ah, 13h
   int 10h
   
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 35
   mov dh, 19
   lea bp, boxes
   mov ah, 13h
   int 10h
   
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 44
   mov dh, 19
   lea bp, boxes
   mov ah, 13h
   int 10h
   
   ;11
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 8
   mov dh, 20
   lea bp, boxes
   mov ah, 13h
   int 10h
   
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 17
   mov dh, 20
   lea bp, boxes
   mov ah, 13h
   int 10h
   
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 26
   mov dh, 20
   lea bp, boxes
   mov ah, 13h
   int 10h
   
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 35
   mov dh, 20
   lea bp, boxes
   mov ah, 13h
   int 10h
   
   mov al, 00
   mov bh, 00
   mov bl, 0F1h
   mov cx, 6
   mov dl, 44
   mov dh, 20
   lea bp, boxes
   mov ah, 13h
   int 10h
   
   ;title and how to	
   mov al, 1
   mov bh, 0
   mov bl, 06Fh
   mov cx, 80
   mov dl, 0
   mov dh, 2
   lea bp, title_s
   mov ah, 13h
   int 10h
   
   mov al, 1
   mov bh, 0
   mov bl, 2eh
   mov cx, 22
   mov dl, 55
   mov dh, 5
   lea bp, note
   mov ah, 13h
   int 10h
   
   mov al, 1
   mov bh, 0
   mov bl, 2eh
   mov cx, 22
   mov dl, 55
   mov dh, 6
   lea bp, note
   mov ah, 13h
   int 10h
   
   mov al, 1
   mov bh, 0
   mov bl, 2eh
   mov cx, 22
   mov dl, 55
   mov dh, 7
   lea bp, note0
   mov ah, 13h
   int 10h
   
   mov al, 1
   mov bh, 0
   mov bl, 2eh
   mov cx, 22
   mov dl, 55
   mov dh, 8
   lea bp, note
   mov ah, 13h
   int 10h

   mov al, 1
   mov bh, 0
   mov bl, 2eh
   mov cx, 22
   mov dl, 55
   mov dh, 9
   lea bp, note1
   mov ah, 13h
   int 10h
   
   mov al, 1
   mov bh, 0
   mov bl, 2eh
   mov cx, 22
   mov dl, 55
   mov dh, 10
   lea bp, note2
   mov ah, 13h
   int 10h
   
   mov al, 1
   mov bh, 0
   mov bl, 2eh
   mov cx, 22
   mov dl, 55
   mov dh, 11
   lea bp, note3
   mov ah, 13h
   int 10h
   
   mov al, 1
   mov bh, 0
   mov bl, 2eh
   mov cx, 22
   mov dl, 55
   mov dh, 12
   lea bp, note4
   mov ah, 13h
   int 10h
   
   mov al, 1
   mov bh, 0
   mov bl, 2eh
   mov cx, 22
   mov dl, 55
   mov dh, 13
   lea bp, note5
   mov ah, 13h
   int 10h
   
   mov al, 1
   mov bh, 0
   mov bl, 2eh
   mov cx, 22
   mov dl, 55
   mov dh, 14
   lea bp, note6
   mov ah, 13h
   int 10h
   
   mov al, 1
   mov bh, 0
   mov bl, 2eh
   mov cx, 22
   mov dl, 55
   mov dh, 15
   lea bp, note
   mov ah, 13h
   int 10h
   
   mov al, 1
   mov bh, 0
   mov bl, 2eh
   mov cx, 22
   mov dl, 55
   mov dh, 16
   lea bp, inst
   mov ah, 13h
   int 10h
   
   mov al, 1
   mov bh, 0
   mov bl, 2eh
   mov cx, 22
   mov dl, 55
   mov dh, 17
   lea bp, note
   mov ah, 13h
   int 10h
   
   mov al, 1
   mov bh, 0
   mov bl, 2eh
   mov cx, 22
   mov dl, 55
   mov dh, 18
   lea bp, note7
   mov ah, 13h
   int 10h
   
   mov al, 1
   mov bh, 0
   mov bl, 2eh
   mov cx, 22
   mov dl, 55
   mov dh, 19
   lea bp, note8
   mov ah, 13h
   int 10h
   
   mov al, 1
   mov bh, 0
   mov bl, 2eh
   mov cx, 21
   mov dl, 55
   mov dh, 20
   lea bp, note9
   mov ah, 13h
   int 10h
   
   mov al, 1
   mov bh, 0
   mov bl, 2fh
   mov cx, 21
   mov dl, 55
   mov dh, 21
   lea bp, note
   mov ah, 13h
   int 10h

   ;Numbers
   mov al,1
   mov bh, 0
   mov bl, 70h
   mov cx, 2
   mov dl, 10
   mov dh, 7
   lea bp, num1
   mov ah, 13h
   int 10h
   
   mov al, 1
   mov bh, 0
   mov bl, 70h
   mov cx, 2
   mov dl, 19
   mov dh,7
   lea bp, num2 
   mov ah, 13h
   int 10h
   
   mov al,1
   mov bh, 0
   mov bl, 70h
   mov cx, 2
   mov dl, 28
   mov dh, 7
   lea bp, num3
   mov ah, 13h
   int 10h
   
   mov al,1
   mov bh, 0
   mov bl, 70h
   mov cx, 2
   mov dl, 37
   mov dh, 7
   lea bp, num4
   mov ah, 13h
   int 10h
  
   mov al,1
   mov bh, 0
   mov bl, 70h
   mov cx, 2
   mov dl, 46
   mov dh, 7
   lea bp, num5
   mov ah, 13h
   int 10h
  
   mov al, 1
   mov bh, 0
   mov bl, 70h
   mov cx, 2
   mov dl, 10
   mov dh, 11
   lea bp, num6
   mov ah, 13h
   int 10h
   
   mov al, 1
   mov bh, 0
   mov bl, 70h
   mov cx, 2
   mov dl, 19
   mov dh, 11
   lea bp, num7
   mov ah, 13h
   int 10h
   
   mov al, 1
   mov bh, 0
   mov bl, 70h
   mov cx, 2
   mov dl, 28
   mov dh, 11
   lea bp, num8
   mov ah, 13h
   int 10h

   mov al, 1
   mov bh, 0
   mov bl, 70h
   mov cx, 2
   mov dl, 37
   mov dh, 11
   lea bp, num9
   mov ah, 13h
   int 10h
   
   mov al,1
   mov bh, 0
   mov bl, 70h
   mov cx, 2
   mov dl, 46
   mov dh, 11
   lea bp, num10
   mov ah, 13h
   int 10h
   
   mov al, 1
   mov bh, 0
   mov bl, 70h
   mov cx, 2
   mov dl, 10
   mov dh, 15
   lea bp, num11
   mov ah, 13h
   int 10h
   
   mov al,1
   mov bh, 0
   mov bl, 70h
   mov cx, 2
   mov dl, 19
   mov dh, 15
   lea bp, num12
   mov ah, 13h
   int 10h

   mov al,1
   mov bh, 0
   mov bl, 70h
   mov cx, 2
   mov dl, 28
   mov dh, 15
   lea bp, num13
   mov ah, 13h
   int 10h

   mov al,1
   mov bh, 0
   mov bl, 70h
   mov cx, 2
   mov dl, 37
   mov dh, 15
   lea bp, num14
   mov ah, 13h
   int 10h
   
   mov al,1
   mov bh, 0
   mov bl, 70h
   mov cx, 2
   mov dl, 46
   mov dh, 15
   lea bp, num15
   mov ah, 13h
   int 10h

   mov al,1
   mov bh, 0
   mov bl, 70h
   mov cx, 2
   mov dl, 10
   mov dh, 19
   lea bp, num16
   mov ah, 13h
   int 10h
   
   mov al,1
   mov bh, 0
   mov bl, 70h
   mov cx, 2
   mov dl, 19
   mov dh, 19
   lea bp, num17
   mov ah, 13h
   int 10h
  
   mov al,1
   mov bh, 0
   mov bl, 70h
   mov cx, 2
   mov dl, 28
   mov dh, 19
   lea bp, num18
   mov ah, 13h
   int 10h
   
   mov al,1
   mov bh, 0
   mov bl, 70h
   mov cx, 2
   mov dl, 37
   mov dh, 19
   lea bp, num19
   mov ah, 13h
   int 10h
   
   mov al, 1
   mov bh, 0
   mov bl, 0f1h
   mov cx, 2
   mov dl, 37
   mov dh, 19
   lea bp, curs
   mov ah, 13h
   int 10h
   
   ;Put cursor in empty box
   mov ah,2
   mov dh,19
   mov dl,46
   mov bh,00h
   int 10h

Control:
   mov ah, 08h 
   int 21h 
   cmp al, 'w' ;basic set up for control wasd
   je UP
   cmp al, 'a'
   je LEFT
   cmp al, 's'
   je DOWN
   cmp al,'d'
   je RIGHT
   cmp al, 'r'
   je BOARD
   cmp al, 'q'
   je Exit   
   jmp Control

UP:  
	;UpperBound cursor 
   cmp dh,7
   je Control
	;Get cursor position and size info
   mov ah,3
   mov bh,00
   int 10h     
   ;space between number
   add dh,-4  
   ;relocate cursor according to current position
   mov ah,2
   mov dl,dl
   mov dh,dh
   mov bh,00
   int 10h  
  
   mov ah,08h
   mov bh,00
   int 10h
   mov bl, ah   
   
   add dh, 4   
   ;sets cursor
   mov ah, 2
   mov dh,dh
   mov dl,dl
   mov bh,0
   int 10h
   ;replace upper
   mov ah,09h
   mov al,al
   mov bl,bl
   mov cx,01h
   int 10h   
   
   add dh, -4  
   ;Moves cursor back up   
   mov ah,2
   mov dh,dh
   mov dl,dl
   mov bh,0
   int 10h
   ;Outputs blank space
   mov ah, 09h
   mov al, 00h
   mov bh, 0
   mov cx,1
   mov bl,bl
   int 10h
   ;Get cursor position and size info
   mov ah,3
   mov bh,00
   int 10h   
   
   add dl, 1
   
   mov ah,2
   mov dh,dh
   mov dl,dl
   mov bh,00
   mov dl,dl
   int 10h
   ;read and store num info
   mov ah,08h
   mov bh,00
   int 10h

   mov bl,ah   
  
   add dh, 4   
   
   mov ah,2
   mov dh,dh
   mov dl,dl
   mov bh,0
   int 10h
 
   mov ah,09h
   mov al,al
   mov bl,bl
   mov cx,01h
   int 10h  
  
   mov ah,3
   mov bh,00
   int 10h

   add dh,-4   
   
   mov ah,2
   mov dh,dh
   mov dl,dl
   mov bh,0
   int 10h

   mov ah,09h
   mov al,00h
   mov bl,79h
   mov cx,01h
   int 10h  

   ;Get cursor position and size info
   mov ah,3
   mov bh,00
   int 10h

   add dl, -1
   ;sets cursor to current blank space
   mov ah,2
   mov dh,dh
   mov dl,dl
   mov bh,0
   int 10h
   
   jmp Control
DOWN:

   ;Get cursor position and size info
   mov ah,3
   mov bh,00
   int 10h
   
   ;lowerbound
   cmp dh,19
   je Control   
   ;change this when space bewteen number change
   add dh,4  
   ;moves cursor up
   mov ah,2
   mov dh,dh
   mov dl,dl
   mov bh,00
   mov dl,dl
   int 10h
   
   ;read above number and store
   mov ah,08h
   mov bh,00
   int 10h

   mov bl, ah
   add dh,-4  
   ;cursor back to blank spot again
   mov ah,2
   mov dh,dh
   mov dl,dl
   mov bh,0
   int 10h
   ;upper number into blank spot
   mov ah,09h
   mov al,al
   mov bl,bl
   mov cx,01h
   int 10h     
   
   add dh,4  
   ;cursor goes back up   
   mov ah,2
   mov dh,dh
   mov dl,dl
   mov bh,0
   int 10h

   ;Outputs blank space
   mov ah, 09h
   mov al, 00h
   mov bh, 0
   mov cx,1
   mov bl,bl
   int 10h

   ;2Get cursor position and size info
   mov ah,3
   mov bh,00
   int 10h
   
   add dl, 1
   
   mov ah,2
   mov dh,dh
   mov dl,dl
   mov bh,00
   int 10h
   ;read character above and store
   mov ah,08h
   mov bh,00
   int 10h
   
   mov bl,ah  
   ;change this also when dh space change
   add dh, -4
   ;cursor back to original blank spot
   mov ah,2
   mov dh,dh
   mov dl,dl
   mov bh,0
   int 10h

   ;swap the top with blank
   mov ah,09h
   mov al,al
   mov bl,bl
   mov cx,01h
   int 10h  

   ;Get cursor position and size info
   mov ah,3
   mov bh,00
   int 10h

   add dh,4
         
   ;sets cursor
   mov ah,2
   mov dh,dh
   mov dl,dl
   mov bh,0
   int 10h

   mov ah,09h
   mov al,00h
   mov bl,79h
   mov cx,01h
   int 10h  

   ;Get cursor position and size info
   mov ah,3
   mov bh,00
   int 10h

   add dl, -1
   ;sets cursor to blank space
   mov ah,2
   mov dh,dh
   mov dl,dl
   mov bh,0
   int 10h

   jmp Control

LEFT: 

   ;Get cursor position and size info
   mov ah,3
   mov bh,00
   int 10h
   
   ;left wall
   cmp dl,10
   je Control
   add dl,-9   
   ;moves cursor to position above
   mov ah,2
   mov dh,dh
   mov dl,dl
   mov bh,00
   int 10h
   
   ;read amd store operation...
   mov ah,08h
   mov bh,00
   int 10h

   mov bl, ah  
   
   add dl,9 
   ;cursor to blank
   mov ah,2
   mov dh,dh
   mov dl,dl
   mov bh,0
   int 10h

   ;swap
   mov ah,09h
   mov al,al
   mov bl,bl
   mov cx,01h
   int 10h     
   
   add dl,-9
   ;cursor into new blank  
   mov ah,2
   mov dh,dh
   mov dl,dl
   mov bh,0
   int 10h

   mov ah, 09h
   mov al, 00h
   mov bh, 0
   mov cx,1
   mov bl,bl
   int 10h

   ;Get cursor position and size info
   mov ah,3
   mov bh,00
   int 10h
  
   add dl, 1
   mov ah,2
   mov dh,dh
   mov dl,dl
   mov bh,00
   mov dl,dl
   int 10h

   mov ah,08h
   mov bh,00
   int 10h

   mov bl,ah   
   add dl, 9   
   mov ah,2
   mov dh,dh
   mov dl,dl
   mov bh,0
   int 10h
  
   ;swap right to right blank
   mov ah,09h
   mov al,al
   mov bl,bl
   mov cx,01h
   int 10h  

   ;Get cursor position and size info
   mov ah,3
   mov bh,00
   int 10h

   add dl,-9         
   mov ah,2
   mov dh,dh
   mov dl,dl
   mov bh,0
   int 10h

   ;new blanket space ...
   mov ah,09h
   mov al,00h
   mov bl,79h
   mov cx,01h
   int 10h  

   ;Get cursor position and size info
   mov ah,3
   mov bh,00
   int 10h

   add dl, -1
   ;cursor to blank
   mov ah,2
   mov dh,dh
   mov dl,dl
   mov bh,0
   int 10h

   jmp Control

RIGHT:
   ;Get cursor position and size info
   mov bh,00
   int 10h
   
   ;right wall
   cmp dl,46
   je Control
   add dl,9  
   mov ah,2
   mov dh,dh
   mov dl,dl
   mov bh,00
   mov dl,dl
   int 10h
   
   mov ah,08h
   mov bh,00
   int 10h

   mov bl, ah   
   add dl,-9   
   mov ah,2
   mov dh,dh
   mov dl,dl
   mov bh,0
   int 10h

   ;swap 
   mov ah,09h
   mov al,al
   mov bl,bl
   mov cx,01h
   int 10h     
   
   add dl,9   
   mov ah,2
   mov dh,dh
   mov dl,dl
   mov bh,0
   int 10h

   ;Outputs blank space
   mov ah, 09h
   mov al, 00h
   mov bh, 0
   mov cx,1
   mov bl,bl
   int 10h

   ;Get cursor position and size info 2nd number ex:17 = 1 and 7 
   mov ah,3
   mov bh,00
   int 10h
   
   ;dealing with 7
   add dl, 1
   mov ah,2
   mov dh,dh
   mov dl,dl
   mov bh,00
   int 10h

   mov ah,08h
   mov bh,00
   int 10h

   mov bl,ah   
   add dl, -9
   mov ah,2
   mov dh,dh
   mov dl,dl
   mov bh,0
   int 10h
  
   ;swap 7
   mov ah,09h
   mov al,al
   mov bl,bl
   mov cx,01h
   int 10h  

   ;cursor info for next operation
   mov ah,3
   mov bh,00
   int 10h

   add dl,9    
   mov ah,2
   mov dh,dh
   mov dl,dl
   mov bh,0
   int 10h

   mov ah,09h
   mov al,00h
   mov bl,79h
   mov cx,01h
   int 10h  

   mov ah,3
   mov bh,00
   int 10h

   add dl, -1
   ;cursor to blank space for next operation
   mov ah,2
   mov dh,dh
   mov dl,dl
   mov bh,0
   int 10h

   jmp Control
  
Exit: 
; CLEAR SCREEN 
   mov ax, 0600h 
   mov bh, 07h 
   mov cx, 0000h
   mov dx, 184fh 
   int 10h 

; end program function 
   mov ah, 4ch 
   int 21h 

ret 
box1 db '                                                   ' , 13, 10, '$'
boxes db '      ' , 13, 10, '$'
title_s db '                         Game of 19 - By Krushang Shah                          ', 13, 10, '$'
inst db  ' -: Instructions:-  ',13, 10, '$'
note db  '                    ',13, 10, '$'
note0 db '   -: Controls :-   ',13, 10, '$'
note1 db '      UP :- W       ',13, 10, '$'
note2 db '    LEFT :- A       ',13, 10, '$'
note3 db '    DOWN :- S       ',13, 10, '$'
note4 db '   RIGHT :- D       ',13, 10, '$'
note5 db '   RESET :- R       ',13, 10, '$'
note6 db '    QUIT :- Q       ',13, 10, '$'
note7 db '   Put the number   ',13, 10, '$'
note8 db '    inorder from    ',13, 10, '$'
note9 db '      1 to 19       ',13, 10, '$'
num1 db '19',13,10,'$'
num2 db '14',13,10,'$'
num3 db ' 8',13,10,'$'
num4 db '17',13,10,'$'
num5 db ' 1',13,10,'$'
num6 db ' 6',13,10,'$'
num7 db ' 5',13,10,'$'
num8 db '16',13,10,'$'
num9 db ' 9',13,10,'$'
num10 db ' 4',13,10,'$'
num11 db '10',13,10,'$'
num12 db ' 7',13,10,'$'
num13 db ' 3',13,10,'$'
num14 db '18',13,10,'$'
num15 db '13',13,10,'$'
num16 db '12',13,10,'$'
num17 db '15',13,10,'$'
num18 db '11',13,10,'$'
num19 db ' 2',13,10,'$'
curs db 00h,13,10,'$'
END START
