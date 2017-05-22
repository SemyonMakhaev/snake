	model 	tiny
	.code
	.386
	org 	100h
	locals
start:
	jmp 	M

wall 		equ 28
port1 		equ 1
port2 		equ 0eh
cfood 		equ 52
cboost 		equ 34
csnake1 	equ 2
chsnake1 	equ 10
csnake2 	equ 4
chsnake2 	equ 12
ttime 		equ	4
green_lose 	db 	26 dup(0)
			db 	0, 4 dup(csnake2), 0, 4 dup(csnake2), 0, 4 dup(csnake2), 0, 4 dup(csnake2), 0, csnake2, 2 dup(0), csnake2, 0
			db 	0, csnake2, 4 dup(0), csnake2, 2 dup(0), csnake2, 0, csnake2, 4 dup(0), csnake2, 4 dup(0), 2 dup(csnake2), 0, csnake2, 0
			db 	0, csnake2, 0, 2 dup(csnake2), 0, 4 dup(csnake2), 0, 4 dup(csnake2), 0, 4 dup(csnake2), 0, 4 dup(csnake2), 0
			db 	0, csnake2, 2 dup(0), csnake2, 0, 2 dup(csnake2), 3 dup(0), csnake2, 4 dup(0), csnake2, 4 dup(0), csnake2, 0, 2 dup(csnake2), 0
			db 	0, 4 dup(csnake2), 0, csnake2, 0, 2 dup(csnake2), 0, 4 dup(csnake2), 0, 4 dup(csnake2), 0, csnake2, 2 dup(0), csnake2, 0
			db 	26 dup(0)
			db 	4 dup(0), csnake2, 4 dup(0), 4 dup(csnake2), 0, 4 dup(csnake2), 0, 4 dup(csnake2), 3 dup(0)
			db 	4 dup(0), csnake2, 4 dup(0), csnake2, 2 dup(0), csnake2, 0, csnake2, 4 dup(0), csnake2, 6 dup(0)
			db 	4 dup(0), csnake2, 4 dup(0), csnake2, 2 dup(0), csnake2, 0, 4 dup(csnake2), 0, 4 dup(csnake2), 3 dup(0)
			db 	4 dup(0), csnake2, 4 dup(0), csnake2, 2 dup(0), csnake2, 4 dup(0), csnake2, 0, csnake2, 6 dup(0)
			db 	4 dup(0), 4 dup(csnake2), 0, 4 dup(csnake2), 0, 4 dup(csnake2), 0, 4 dup(csnake2), 3 dup(0)
			db 	26 dup(0)
			
red_lose 	db 	26 dup(0)
			db 	6 dup(0), 4 dup(csnake1), 0, 4 dup(csnake1), 0, 2 dup(csnake1), 8 dup(0)
			db 	6 dup(0), csnake1, 2 dup(0), csnake1, 0, csnake1, 4 dup(0), csnake1, 0, csnake1, 7 dup(0)
			db 	6 dup(0), 4 dup(csnake1), 0, 4 dup(csnake1), 0, csnake1, 2 dup(0), csnake1, 6 dup(0)
			db 	6 dup(0), 2 dup(csnake1), 3 dup(0), csnake1, 4 dup(0), csnake1, 2 dup(0), csnake1, 6 dup(0)
			db 	6 dup(0), csnake1, 0, 2 dup(csnake1), 0, 4 dup(csnake1), 0, 3 dup(csnake1), 7 dup(0)
			db 	26 dup(0)
			db 	4 dup(0), csnake1, 4 dup(0), 4 dup(csnake1), 0, 4 dup(csnake1), 0, 4 dup(csnake1), 3 dup(0)
			db 	4 dup(0), csnake1, 4 dup(0), csnake1, 2 dup(0), csnake1, 0, csnake1, 4 dup(0), csnake1, 6 dup(0)
			db 	4 dup(0), csnake1, 4 dup(0), csnake1, 2 dup(0), csnake1, 0, 4 dup(csnake1), 0, 4 dup(csnake1), 3 dup(0)
			db 	4 dup(0), csnake1, 4 dup(0), csnake1, 2 dup(0), csnake1, 4 dup(0), csnake1, 0, csnake1, 6 dup(0)
			db  4 dup(0), 4 dup(csnake1), 0, 4 dup(csnake1), 0, 4 dup(csnake1), 0, 4 dup(csnake1), 3 dup(0)
			db 	26 dup(0)
standoff 	db 	26 dup(0)
			db 	0, 4 dup(cfood), 0, 4 dup(cfood), 2 dup(0), 2 dup(cfood), 2 dup(0), cfood, 2 dup(0), cfood, 0, 2 dup(cfood), 3 dup(0)
			db 	0, cfood, 5 dup(0), 2 dup(cfood), 2 dup(0), cfood, 2 dup(0), cfood, 0, 2 dup(cfood), 0, cfood, 0, cfood, 0, cfood, 2 dup(0)
			db 	0, 4 dup(cfood), 2 dup(0), 2 dup(cfood), 2 dup(0), 4 dup(cfood), 0, 4 dup(cfood), 0, cfood, 2 dup(0), cfood, 0
			db 	4 dup(0), cfood, 2 dup(0), 2 dup(cfood), 2 dup(0), cfood, 2 dup(0), cfood, 0, cfood, 0, 2 dup(cfood), 0, cfood, 2 dup(0), cfood, 0
			db 	0, 4 dup(cfood), 2 dup(0), 2 dup(cfood), 2 dup(0), cfood, 2 dup(0), cfood, 0, cfood, 2 dup(0), cfood, 0, 3 dup(cfood), 2 dup(0)
			db 	26 dup(0)
			db 	6 dup(0), 4 dup(cfood), 0, 4 dup(cfood), 0, 4 dup(cfood), 6 dup(0)
			db 	6 dup(0), cfood, 2 dup(0), cfood, 0, cfood, 4 dup(0), cfood, 9 dup(0)
			db 	6 dup(0), cfood, 2 dup(0), cfood, 0, 4 dup(cfood), 0, 4 dup(cfood), 6 dup(0)
			db 	6 dup(0), cfood, 2 dup(0), cfood, 0, cfood, 4 dup(0), cfood, 9 dup(0)
			db 	6 dup(0), 4 dup(cfood), 0, cfood, 4 dup(0), cfood, 9 dup(0)
			db 	26 dup(0)


field 		db 	64 dup (0)
			db 	64 dup (0)
			db 	64 dup (0)
			db 	0, 0, 0, port1, 56 dup (0), port2, 0, 0, 0
			db 	64 dup (0)
			db 	64 dup (0)
			db 	64 dup (0)
			db 	9 dup (0), 4 dup (wall), 11 dup (0), 16 dup (wall), 11 dup (0), 4 dup (wall), 9 dup (0)
			db 	9 dup (0), 4 dup (wall), 11 dup (0), 16 dup (wall), 11 dup (0), 4 dup (wall), 9 dup (0)
			db 	9 dup (0), 2 dup (wall), 13 dup (0), 16 dup (wall), 13 dup (0), 2 dup (wall), 9 dup (0)
			db 	9 dup (0), 2 dup (wall), 42 dup (0), 2 dup (wall), 9 dup (0)
			db 	64 dup (0)
			db 	64 dup (0)
			db 	64 dup (0)
			db 	64 dup (0)
			db 	64 dup (0)
			db 	64 dup (0)
			db 	64 dup (0)
			db 	64 dup (0)
			db 	64 dup (0)
			db 	64 dup (0)
			db 	64 dup (0)
			db 	64 dup (0)
			db 	64 dup (0)
			db 	64 dup (0)
			db 	64 dup (0)
			db 	64 dup (0)
			db 	64 dup (0)
			db 	64 dup (0)
			db 	9 dup (0), 2 dup (wall), 42 dup (0), 2 dup (wall), 9 dup (0)
			db 	9 dup (0), 2 dup (wall), 13 dup (0), 16 dup (wall), 13 dup (0), 2 dup (wall), 9 dup (0)
			db 	9 dup (0), 4 dup (wall), 11 dup (0), 16 dup (wall), 11 dup (0), 4 dup (wall), 9 dup (0)
			db 	9 dup (0), 4 dup (wall), 11 dup (0), 16 dup (wall), 11 dup (0), 4 dup (wall), 9 dup (0)
			db 	64 dup (0)
			db 	64 dup (0)
			db 	64 dup (0)
			db 	0, 0, 0, port2, 56 dup (0), port1, 0, 0, 0
			db 	64 dup (0)
			db 	64 dup (0)
			db 	64 dup (0)
dir_vars 	dw 	11h, next_dir1, -100h
			dw 	1eh, next_dir1, -1h
			dw 	1fh, next_dir1, 100h
			dw 	20h, next_dir1, 1h
			dw 	48h, next_dir2, -100h
			dw 	4bh, next_dir2, -1h
			dw 	50h, next_dir2, 100h
			dw 	4dh, next_dir2, 1h
old_mode 	db 	?
msg 		db 	'Type snakes count (1 or 2)', 24h
players 	db 	?
old_seg9 	dw 	?
old_off9 	dw 	?
old_seg1c 	dw 	?
old_off1c 	dw 	?
next_dir1 	dw 	1
next_dir2 	dw 	-1
direction1 	dw 	1
direction2 	dw 	-1
exit_flag 	dw 	0
buffer 		dw 	20 dup (0)
head 		dw 	offset buffer
tail 		dw 	offset buffer
snake1 		dw 	1301h, 1302h, 1303h, 147 dup (0)
shead1 		dw 	offset snake1 + 4
stail1 		dw 	offset snake1
snake2 		dw 	143eh, 143dh, 143ch, 147 dup (0)
shead2 		dw	offset snake2 + 4
stail2 		dw 	offset snake2
curr_proc 	db 	1
need_tail 	db 	0
tics 		db 	ttime
ports_dir 	dw 	203h, 253ch, 302h, 243dh, 403h, 233ch, 304h, 243bh
 			dw 	233ch, 403h, 243bh, 304h, 253ch, 203h, 243dh, 302h
 			dw 	23ch, 2503h, 33bh, 2404h, 43ch, 2303h, 33dh, 2402h
 			dw 	2303h, 43ch, 2402h, 33dh, 2503h, 23ch, 2404h, 33bh
prev_pos 	dw 	?
need_play 	db 	0
boost1 		db 	0
boost2 		db 	0

M:
	mov 	ah, 0fh
	int 	10h
	mov  	[old_mode], al
	mov 	ah, 09h
	mov 	dx, offset msg
	int 	21h
option:
	xor 	ax, ax
	int 	16h
	cmp 	al, 31h
	je 		readed
	cmp 	al, 32h
	je 		readed
	jmp 	option
readed:
	sub 	al, 30h
	mov 	[players], al
	mov 	ax, 3509h
	int 	21h
	mov 	[old_seg9], es
	mov 	[old_off9], bx
	mov 	dx, offset int9handler
	mov 	ax, 2509h
	int 	21h
	mov 	ax, 351ch
	int 	21h
	mov 	[old_seg1c], es
	mov 	[old_off1c], bx
	mov 	ax, 251ch
	mov 	dx, offset int1chandler
	int 	21h

	push 	cs
	pop 	es

	mov 	ax, 13h
	int 	10h

	xor 	dx, dx
h:
	mov 	dl, 0
	w:
		call 	get_value
		call 	write_cell
		add 	dl, 1
		cmp 	dl, 64
		jne 	w
	add 	dh, 1
	cmp 	dh, 40
	jne 	h

	mov 	dx, 1301h
	mov 	al, csnake1
	call	set_num
	inc 	dx
	call 	set_num
	inc 	dx
	mov 	al, chsnake1
	call 	set_num

	cmp 	[players], 2
	jne 	no_second
	mov 	dx, 143eh
	mov 	al, csnake2
	call	set_num
	dec 	dx
	call 	set_num
	dec 	dx
	mov 	al, chsnake2
	call 	set_num
no_second:
	call 	set_food
main_loop:
	call 	move_snake1
	cmp 	[boost1], 0
	je 		no_bst1
	sub 	[boost1], 1
	call 	move_snake1
no_bst1:
	cmp 	[players], 2
	jne 	ssleep
	call 	move_snake2
	cmp 	[boost2], 0
	je 		ssleep
	sub 	[boost2], 1
	call 	move_snake2
ssleep:
	cmp 	[need_play], 1
	jne 	neednt_play
	mov 	al, 0b6h
	out 	43h, al
	mov 	ax, 8609
	out 	42h, al
	mov 	al, ah
	out 	42h, al
	in 		al, 61h
	or 		al, 3
	out 	61h, al
neednt_play:
	cmp 	[tics], 0
	jg 		neednt_play
	mov 	[need_play], 0
	in 		al, 61h
	and 	al, 0fdh
	out 	61h, al
	mov 	[tics], ttime
	cmp 	[exit_flag], 0
	jne 	exit_program
	jmp 	main_loop

exit_program:
	mov 	dx, [old_off9]
	mov 	ds, [old_seg9]
	mov 	ax, 2509h
	int 	21h
	push 	cs
	pop 	ds
	mov 	dx, [old_off1c]
	mov 	ds, [old_seg1c]
	mov 	ax, 251ch
	int 	21h
	push 	cs
	pop 	ds
	cmp 	[exit_flag], 3
	je 		exitexit
	cmp 	[exit_flag], 1
	je 		looooose1
	cmp 	[exit_flag], 2
	je 		looooose2
	cmp 	[exit_flag], 4
	je 		tie
	jmp 	exitexit
tie:
	mov 	si, offset standoff
	mov 	dx, 0d13h
	mov 	ch, 0
llloop3:
	mov 	cl, 0
	lloop3:
		lodsb
		push 	dx
		push 	cx
		add 	dx, cx
		call 	set_num
		pop 	cx
		pop 	dx
		add 	cl, 1
		cmp 	cl, 26
		jne 	lloop3
	add 	ch, 1
	cmp 	ch, 13
	jne 	llloop3
	jmp 	exitexit
looooose2:
	mov 	si, offset red_lose
	mov 	dx, 0d13h
	mov 	ch, 0
llloop2:
	mov 	cl, 0
	lloop2:
		lodsb
		push 	dx
		push 	cx
		add 	dx, cx
		call 	set_num
		pop 	cx
		pop 	dx
		add 	cl, 1
		cmp 	cl, 26
		jne 	lloop2
	add 	ch, 1
	cmp 	ch, 13
	jne 	llloop2
	jmp 	exitexit
looooose1:
	mov 	si, offset green_lose
	mov 	dx, 0d13h
	mov 	ch, 0
llloop1:
	mov 	cl, 0
	lloop1:
		lodsb
		push 	dx
		push 	cx
		add 	dx, cx
		call 	set_num
		pop 	cx
		pop 	dx
		add 	cl, 1
		cmp 	cl, 26
		jne 	lloop1
	add 	ch, 1
	cmp 	ch, 13
	jne 	llloop1
exitexit:
	xor 	ax, ax
	int 	16h
	xor 	ax, ax
	mov 	al, [old_mode]
	int 	10h
	ret

move_snake1 proc
	mov 	[curr_proc], 1
	mov 	bx, [shead1]
	mov 	dx, [bx]
	mov 	[prev_pos], dx
	mov 	al, csnake1
	call 	set_num
	add 	[shead1], 2
	cmp 	[shead1], offset shead1
	jne 	@@1
	mov 	[shead1], offset snake1
@@1:
	mov 	bx, [next_dir1]
	add 	bx, [direction1]
	cmp 	bx, 0
	je 		@@2
	mov 	bx, [next_dir1]
	mov 	[direction1], bx
@@2:
	add 	dx, [direction1]
	call 	get_new_dx
	mov 	bx, [shead1]
	mov 	[bx], dx
	mov 	al, chsnake1
	call 	set_num

	cmp 	[need_tail], 1
	je 		@@3
	mov 	bx, [stail1]
	mov 	dx, [bx]
	mov 	al, 0
	call 	set_num
	add 	[stail1], 2
	cmp 	[stail1], offset shead1
	jne 	@@3
	mov 	[stail1], offset snake1
@@3:
	mov 	[need_tail], 0
	ret
move_snake1 endp

move_snake2 proc
	mov 	[curr_proc], 2
	mov 	bx, [shead2]
	mov 	dx, [bx]
	mov 	[prev_pos], dx
	mov 	al, csnake2
	call 	set_num
	add 	[shead2], 2
	cmp 	[shead2], offset shead2
	jne 	@@1
	mov 	[shead2], offset snake2
@@1:
	mov 	bx, [next_dir2]
	add 	bx, [direction2]
	cmp 	bx, 0
	je 		@@2
	mov 	bx, [next_dir2]
	mov 	[direction2], bx
@@2:
	add 	dx, [direction2]
	call 	get_new_dx
	mov 	bx, [shead2]
	mov 	[bx], dx
	mov 	al, chsnake2
	call 	set_num

	cmp 	[need_tail], 1
	je 		@@3
	mov 	bx, [stail2]
	mov 	dx, [bx]
	mov 	al, 0
	call 	set_num
	add 	[stail2], 2
	cmp 	[stail2], offset shead2
	jne 	@@3
	mov 	[stail2], offset snake2
@@3:
	mov 	[need_tail], 0
	ret
move_snake2 endp

set_food proc
	push 	ax
	push  	dx
@@1:
	mov 	ah, 2ch
	int 	21h
	mov 	ax, dx
	and 	ax, 0ffh
	push 	ax
	mov 	dl, 40
	div 	dl
	mov 	dh, ah
	pop 	ax
	mov 	dl, 64
	div 	dl
	mov 	dl, ah
	call 	get_value
	cmp 	al, 0
	jne 	@@1
	
	cmp 	[counter], 4
	jne 	no_boost
	mov 	[counter], 0
	mov 	al, cboost
	call 	set_num
	pop 	dx
	pop 	ax
	ret

no_boost:
	add 	[counter], 1
	mov 	al, cfood
	call 	set_num
	pop 	dx
	pop 	ax
	ret
	counter 	db 	0
set_food endp

get_new_dx proc
	push 	ax
	cmp 	dl, -1
	je 		@@3
	cmp 	dl, 64
	je 		@@4
	cmp 	dh, -1
	je 		@@1
	cmp 	dh, 40
	je 		@@2
	cmp 	dx, 303h
	je 		in_port
	cmp 	dx, 33ch
	je 		in_port
	cmp 	dx, 2403h
	je 		in_port
	cmp 	dx, 243ch
	je 		in_port
	jmp 	check_cell
in_port:
	mov 	di, offset ports_dir
	mov 	cx, 16
	mov 	ax, [prev_pos]
@@5:
	scasw
	je 		@@6
	add 	di, 2
	loop 	@@5
@@6:
	mov 	si, di
	lodsw
	mov 	dx, ax
	jmp 	check_cell
@@4:
	mov 	dl, 0
	jmp 	check_cell
@@3:
	mov 	dl, 63
	add 	dh, 1
	jmp 	check_cell
@@2:
	mov 	dh, 0
	jmp 	check_cell
@@1:
 	mov 	dh, 39
 	jmp 	check_cell
check_cell:
	call 	get_value
	cmp 	al, cfood
	je 		set_need_tail
	cmp 	al, cboost
	je 		need_boost
	cmp 	al, wall
	je 		lose
	cmp 	al, csnake1
	je 		lose
	cmp 	al, csnake2
	je 		lose
	cmp 	al, chsnake1
	je 		no_lose
	cmp 	al, chsnake2
	je 		no_lose
	pop 	ax
	ret
need_boost:
	cmp 	[curr_proc], 1
	je 		bst1
	mov 	[boost2], 20
	jmp 	set_need_tail
bst1:
	mov 	[boost1], 20
set_need_tail:
	call 	set_food
	mov 	[need_play], 1
	mov 	[need_tail], 1
	pop 	ax
 	ret
lose:
	cmp 	[curr_proc], 1
	je 		lose1
	mov 	[exit_flag], 2
	pop 	ax
	ret
	lose1:
	mov 	[exit_flag], 1
	pop 	ax
	ret
no_lose:
	mov 	[exit_flag], 4
	pop 	ax
	ret
get_new_dx endp

get_value proc
	push 	dx
	push 	bx
	xor 	ax, ax
	mov 	al, dh
	shl 	ax, 6
	push 	dx
	mov 	dh, 0
	add 	ax, dx
	pop 	dx
	mov 	bx, ax
	add 	bx, offset field
	mov 	al, [bx]
	pop 	bx
	pop 	dx
	ret
get_value endp

set_num proc
	xor 	bx, bx
	mov 	bl, dh
	shl 	bx, 6
	push 	dx
	mov 	dh, 0
	add 	bx, dx
	mov 	di, offset field
	add 	di, bx
	stosb
	pop 	dx
	call 	write_cell
	ret
set_num endp

write_cell proc
	push 	es
	push 	dx
	push 	ax
	mov 	ax, 0a000h
	mov 	es, ax
	xor 	ax, ax
	mov 	al, dh
	mov 	dh, 25
	mul 	dh
	shl 	ax, 6
	mov 	di, ax
	mov 	dh, 0
	mov 	ax, dx
	mov 	dh, 5
	mul 	dh
	add 	di, ax
	pop 	ax
	mov 	dx, 5
@@1:
	mov 	cx, 5
	rep 	stosb
	add 	di, 315
	dec 	dx
	jnz 	@@1
	pop 	dx
	pop 	es
	ret
write_cell endp

int1chandler proc
	cli
	sub 	[tics], 1
	sti
	iret
int1chandler endp

int9handler proc
	cli
	push 	ax
	push 	si
	push 	di
	in 		al, 60h
	push 	ax
	in 		al, 61h
	or 		al, 80h
	out 	61h, al
	and 	al, 7fh
	out 	61h, al
	pop 	ax
	test 	al, 80h
	jnz 	end_handler9
	cmp 	al, 1
	je 		set_exit_flag
	mov 	cx, 8
	mov 	ah, 0
	mov 	di, offset dir_vars
@@1:
	scasw
	je 		@@2
	add 	di, 4
	loop 	@@1
	jmp 	end_handler9
@@2:
	mov 	si, di
	lodsw
	mov 	bx, ax
	lodsw
	mov 	[bx], ax
	jmp 	end_handler9
set_exit_flag:
	mov 	[exit_flag], 3
end_handler9:
	mov 	al, 20h
	out 	20h, al
	pop 	di
	pop 	si
	pop 	ax
	sti
	iret
int9handler endp
end 	start