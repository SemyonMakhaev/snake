	model 	tiny
	.code
	.386
	org 	100h
	locals
start:
	jmp 	S

barrier 		equ 68
food_color 		equ 50
speed_apple_color	equ 2
first_snake_color 	equ 3
first_snake_head_color 	equ 11
second_snake_color 	equ 5
second_snake_head_color	equ 13
timer_velocity 		equ 3
game_over 	db 26 dup(0)
		db 2 dup(0), 4 dup(12), 2 dup(0), 2 dup(12), 2 dup(0), 12, 4 dup(0), 12, 0, 5 dup(12), 2 dup(0)
		db 2 dup(0), 12, 4 dup(0), 12, 2 dup(0), 12, 0, 2 dup(12), 2 dup(0), 2 dup(12), 0, 12, 6 dup(0)
		db 2 dup(0), 12, 0, 2 dup(12), 0, 4 dup(12), 0, 12, 0, 2 dup(12), 0, 12, 0, 4 dup(12), 3 dup(0)
		db 2 dup(0), 12, 2 dup(0), 12, 0, 12, 2 dup(0), 12, 0, 12, 4 dup(0), 12, 0, 12, 6 dup(0)
		db 2 dup(0), 4 dup(12), 0, 12, 2 dup(0), 12, 0, 12, 4 dup(0), 12, 0, 5 dup(12), 2 dup(0)
		db 26 dup(0)
		db 2 dup(0), 4 dup(12), 0, 12, 3 dup(0), 12, 0, 5 dup(12), 0, 5 dup(12), 2 dup(0)
		db 2 dup(0), 12, 2 dup(0), 12, 0, 12, 3 dup(0), 12, 0, 12, 5 dup(0), 12, 3 dup(0), 12, 2 dup(0)
		db 2 dup(0), 12, 2 dup(0), 12, 0, 12, 3 dup(0), 12, 0, 4 dup(12), 2 dup(0), 5 dup(12), 2 dup(0)
		db 2 dup(0), 12, 2 dup(0), 12, 2 dup(0), 12, 0, 12, 2 dup(0), 12, 5 dup(0), 12, 0, 2 dup(12), 3 dup(0)
		db 2 dup(0), 4 dup(12), 3 dup(0), 12, 3 dup(0), 5 dup(12), 0, 12, 2 dup(0), 2 dup(12), 2 dup(0)
		db 26 dup(0)
bye		db 26 dup(food_color)
		db food_color, 24 dup(0), food_color
		db food_color, 24 dup(0), food_color
		db food_color, 24 dup(0), food_color
		db food_color, 4 dup(0), 5 dup(food_color), 0, food_color, 3 dup(0), food_color, 0, 4 dup(food_color), 4 dup(0), food_color
		db food_color, 4 dup(0), food_color, 3 dup(0), food_color, 0, food_color, 3 dup(0), food_color, 0, food_color, 7 dup(0), food_color
		db food_color, 4 dup(0), 4 dup(food_color), 3 dup(0), 3 dup(food_color), 2 dup(0), 3 dup(food_color), 5 dup(0), food_color
		db food_color, 4 dup(0), food_color, 3 dup(0), food_color, 3 dup(0), food_color, 3 dup(0), food_color, 7 dup(0), food_color
		db food_color, 4 dup(0), 5 dup(food_color), 3 dup(0), food_color, 3 dup(0), 4 dup(food_color), 4 dup(0), food_color
		db food_color, 24 dup(0), food_color
		db food_color, 24 dup(0), food_color
		db food_color, 24 dup(0), food_color
		db 26 dup(food_color)
map 	db 64 dup(0)
		db 64 dup(0)
		db 64 dup(0)
		db 64 dup(0)
		db 64 dup(0)
		db 64 dup(0)
		db 11 dup(0), 15 dup(barrier), 12 dup(0), 15 dup(barrier), 11 dup(0)
		db 11 dup(0), 15 dup(barrier), 12 dup(0), 15 dup(barrier), 11 dup(0)
		db 11 dup(0), 15 dup(barrier), 12 dup(0), 15 dup(barrier), 11 dup(0)
		db 11 dup(0), 5 dup(barrier), 32 dup(0), 5 dup(barrier), 11 dup(0)
		db 11 dup(0), 5 dup(barrier), 32 dup(0), 5 dup(barrier), 11 dup(0)
		db 11 dup(0), 5 dup(barrier), 32 dup(0), 5 dup(barrier), 11 dup(0)
		db 64 dup(0)
		db 64 dup(0)
		db 64 dup(0)
		db 64 dup(0)
		db 64 dup(0)
		db 64 dup(0)
		db 64 dup(0)
		db 64 dup(0)
		db 64 dup(0)
		db 64 dup(0)
		db 64 dup(0)
		db 64 dup(0)
		db 64 dup(0)
		db 64 dup(0)
		db 64 dup(0)
		db 64 dup(0)
		db 11 dup(0), 5 dup(barrier), 32 dup(0), 5 dup(barrier), 11 dup(0)
		db 11 dup(0), 5 dup(barrier), 32 dup(0), 5 dup(barrier), 11 dup(0)
		db 11 dup(0), 5 dup(barrier), 32 dup(0), 5 dup(barrier), 11 dup(0)
		db 11 dup(0), 15 dup(barrier), 12 dup(0), 15 dup(barrier), 11 dup(0)
		db 11 dup(0), 15 dup(barrier), 12 dup(0), 15 dup(barrier), 11 dup(0)
		db 11 dup(0), 15 dup(barrier), 12 dup(0), 15 dup(barrier), 11 dup(0)
		db 64 dup(0)
		db 64 dup(0)
		db 64 dup(0)
		db 64 dup(0)
		db 64 dup(0)
		db 64 dup(0)
vectors 	dw 48h, next_dir1, -100h
		dw 4bh, next_dir1, -1h
		dw 50h, next_dir1, 100h
		dw 4dh, next_dir1, 1h
		dw 11h, next_dir2, -100h
		dw 1eh, next_dir2, -1h
		dw 1fh, next_dir2, 100h
		dw 20h, next_dir2, 1h
prev_mode 	db ?
mess 		db 'Type snakes count (1 or 2)', 24h
snakes_count 	db ?
old_9vect_seg 	dw ?
old_9vect_off 	dw ?
old_1c_vect_seg	dw ?
old_1c_vect_off	dw ?
next_dir1 	dw 1
next_dir2 	dw -1
direction1 	dw 1
direction2 	dw -1
exit_flag 	dw 0
buffer 		dw 20 dup (0)
head 		dw offset buffer
tail 		dw offset buffer
snake1 		dw 0201h, 0202h, 0203h, 147 dup(0)
shead1 		dw offset snake1 + 4
stail1 		dw offset snake1
snake2 		dw 253eh, 253dh, 253ch, 147 dup(0)
shead2 		dw offset snake2 + 4
stail2 		dw offset snake2
curr_proc 	db 1
grow_snake 	db 0
tics 		db timer_velocity
prev_pos 	dw ?
play_sound 	db 0
accelerate_first	db 0
accelerate_second	db 0
last_eaten	db food_color

handler_1c proc
	cli
	sub 	[tics], 1
	sti
	iret
handler_1c endp

handler_9 proc
	cli
	push 	ax
	push 	si
	push 	di
	in 	al, 60h
	push 	ax
	in 	al, 61h
	or 	al, 80h
	out 	61h, al
	and 	al, 7fh
	out 	61h, al
	pop 	ax
	test 	al, 80h
	jnz 	end_handler_9
	cmp 	al, 1
	je 	ex_flag
	mov 	cx, 8
	mov 	ah, 0
	mov 	di, offset vectors
@@1:
	scasw
	je 	@@2
	add 	di, 4
	loop 	@@1
	jmp 	end_handler_9
@@2:
	mov 	si, di
	lodsw
	mov 	bx, ax
	lodsw
	mov 	[bx], ax
	jmp 	end_handler_9
ex_flag:
	mov 	[exit_flag], 1
end_handler_9:
	mov 	al, 20h
	out 	20h, al
	pop 	di
	pop 	si
	pop 	ax
	sti
	iret
handler_9 endp

first_snake_step proc
	mov 	[curr_proc], 1
	mov 	bx, [shead1]
	mov 	dx, [bx]
	mov 	[prev_pos], dx
	mov 	al, first_snake_color
	call 	write_in_map
	add 	[shead1], 2
	cmp 	[shead1], offset shead1
	jne 	@@1
	mov 	[shead1], offset snake1
@@1:
	mov 	bx, [next_dir1]
	add 	bx, [direction1]
	cmp 	bx, 0
	je 	@@2
	mov 	bx, [next_dir1]
	mov 	[direction1], bx
@@2:
	add 	dx, [direction1]
	call 	get_new_snake_position
	mov 	bx, [shead1]
	mov 	[bx], dx
	mov 	al, first_snake_head_color
	call 	write_in_map
	cmp 	[grow_snake], 1
	je 	@@3
	mov 	bx, [stail1]
	mov 	dx, [bx]
	mov 	al, 0
	call 	write_in_map
	add 	[stail1], 2
	cmp 	[stail1], offset shead1
	jne 	@@3
	mov 	[stail1], offset snake1
@@3:
	mov 	[grow_snake], 0
	ret
first_snake_step endp

second_snake_step proc
	mov 	[curr_proc], 2
	mov 	bx, [shead2]
	mov 	dx, [bx]
	mov 	[prev_pos], dx
	mov 	al, second_snake_color
	call 	write_in_map
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
	call 	get_new_snake_position
	mov 	bx, [shead2]
	mov 	[bx], dx
	mov 	al, second_snake_head_color
	call 	write_in_map

	cmp 	[grow_snake], 1
	je 		@@3
	mov 	bx, [stail2]
	mov 	dx, [bx]
	mov 	al, 0
	call 	write_in_map
	add 	[stail2], 2
	cmp 	[stail2], offset shead2
	jne 	@@3
	mov 	[stail2], offset snake2
@@3:
	mov 	[grow_snake], 0
	ret
second_snake_step endp

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
	call 	get_map_cell
	cmp 	al, 0
	jne 	@@1
	mov 	al, last_eaten
	call 	write_in_map
	pop 	dx
	pop 	ax
	ret
set_food endp

get_new_snake_position proc
	push 	ax
	cmp 	dl, -1
	je 	@@3
	cmp 	dl, 64
	je 	@@4
	cmp 	dh, -1
	je 	@@1
	cmp 	dh, 40
	je 	@@2
	jmp 	resolve_cell
@@5:
	scasw
	je 	@@6
	add 	di, 2
	loop 	@@5
@@6:
	mov 	si, di
	lodsw
	mov 	dx, ax
	jmp 	resolve_cell
@@4:
	mov 	dl, 0
	jmp 	resolve_cell
@@3:
	mov 	dl, 63
	add 	dh, 1
	jmp 	resolve_cell
@@2:
	mov 	dh, 0
	jmp 	resolve_cell
@@1:
 	mov 	dh, 39
 	jmp 	resolve_cell
resolve_cell:
	call 	get_map_cell
	cmp 	al, food_color
	je 	set_grow_snake_food
	cmp	al, speed_apple_color
	je	accelerate
	cmp 	al, barrier
	je 	exit_case
	cmp 	al, first_snake_color
	je 	exit_case
	cmp 	al, second_snake_color
	je 	exit_case
	cmp 	al, first_snake_head_color
	je 	resolve_case
	cmp 	al, second_snake_head_color
	je 	resolve_case
	pop 	ax
	ret
accelerate:
	mov	last_eaten, speed_apple_color
	cmp	[curr_proc], 1
	je	accelerate_first_snake
	mov	[accelerate_second], 20
	jmp	set_grow_snake
accelerate_first_snake:
	mov	[accelerate_first], 20
	jmp	set_grow_snake
set_grow_snake_food:
	mov	last_eaten, food_color
	cmp	[curr_proc], 1
	je	slow_first_snake
	mov	[accelerate_second], 0
	jmp	set_grow_snake
slow_first_snake:
	mov	[accelerate_first], 0
set_grow_snake:
	call 	set_food
	mov 	[play_sound], 1
	mov 	[grow_snake], 1
	pop 	ax
 	ret
exit_case:
	mov 	[exit_flag], 2
	pop 	ax
	ret
resolve_case:
	mov 	[exit_flag], 1
	pop 	ax
	ret
get_new_snake_position endp

get_map_cell proc
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
	add 	bx, offset map
	mov 	al, [bx]
	pop 	bx
	pop 	dx
	ret
get_map_cell endp

write_in_map proc
	xor 	bx, bx
	mov 	bl, dh
	shl 	bx, 6
	push 	dx
	mov 	dh, 0
	add 	bx, dx
	mov 	di, offset map
	add 	di, bx
	stosb
	pop 	dx
	call 	draw_cell
	ret
write_in_map endp

draw_cell proc
	push 	es
	push 	dx
	push 	ax
	mov 	ax, 0A000h
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
draw_cell endp

S:
	mov 	ah, 0fh
	int 	10h
	mov  	[prev_mode], al
	mov 	ah, 09h
	mov 	dx, offset mess
	int 	21h
type_count:
	xor 	ax, ax
	int 	16h
	cmp 	al, 31h
	je 		count_set
	cmp 	al, 32h
	je 		count_set
	jmp 	type_count
count_set:
	sub 	al, 30h
	mov 	[snakes_count], al
	mov 	ax, 3509h
	int 	21h
	mov 	[old_9vect_seg], es
	mov 	[old_9vect_off], bx
	mov 	dx, offset handler_9
	mov 	ax, 2509h
	int 	21h
	mov 	ax, 351ch
	int 	21h
	mov 	[old_1c_vect_seg], es
	mov 	[old_1c_vect_off], bx
	mov 	ax, 251ch
	mov 	dx, offset handler_1c
	int 	21h
	push 	cs
	pop 	es
	mov 	ax, 13h
	int 	10h
	xor 	dx, dx
map_height:
	mov 	dl, 0
map_width:
	call 	get_map_cell
	call 	draw_cell
	add 	dl, 1
	cmp 	dl, 64
	jne 	map_width
	add 	dh, 1
	cmp 	dh, 40
	jne 	map_height
	mov 	dx, 0201h
	mov 	al, first_snake_color
	call	write_in_map
	inc 	dx
	call 	write_in_map
	inc 	dx
	mov 	al, first_snake_head_color
	call 	write_in_map
	cmp 	[snakes_count], 2
	jne 	continue_init
	mov 	dx, 253eh
	mov 	al, second_snake_color
	call	write_in_map
	dec 	dx
	call 	write_in_map
	dec 	dx
	mov 	al, second_snake_head_color
	call 	write_in_map
continue_init:
	mov	last_eaten, speed_apple_color
	call 	set_food
	mov	last_eaten, food_color
	call	set_food
mainloop:
	call 	first_snake_step
	cmp	[accelerate_first], 0
	je	no_accelerate
	sub	[accelerate_first], 1
	call	first_snake_step
no_accelerate:
	cmp 	[snakes_count], 2
	jne 	delay
	call 	second_snake_step
	cmp	[accelerate_second], 0
	je	delay
	sub	[accelerate_second], 1
	call	second_snake_step
delay:
	cmp 	[play_sound], 1
	jne 	no_sound
	mov 	al, 0b6h
	out 	43h, al
	mov 	ax, 1500
	out 	42h, al
	mov 	al, ah
	out 	42h, al
	in 		al, 61h
	or 		al, 3
	out 	61h, al
no_sound:
	cmp 	[tics], 0
	jg 		no_sound
	mov 	[play_sound], 0
	in 		al, 61h
	and 	al, 0fdh
	out 	61h, al
	mov 	[tics], timer_velocity
	cmp 	[exit_flag], 0
	jne 	exit_prog
	jmp 	mainloop
exit_prog:
	mov 	dx, [old_9vect_off]
	mov 	ds, [old_9vect_seg]
	mov 	ax, 2509h
	int 	21h
	push 	cs
	pop 	ds
	mov 	dx, [old_1c_vect_off]
	mov 	ds, [old_1c_vect_seg]
	mov 	ax, 251ch
	int 	21h
	push 	cs
	pop 	ds
	cmp 	[exit_flag], 1
	je 		draw_bye
	cmp 	[exit_flag], 2
	je 		draw_game_over
	jmp 	draw_bye
draw_game_over:
	mov 	si, offset game_over
	mov 	dx, 0d13h
	mov 	ch, 0
game_over_height:
	mov 	cl, 0
game_over_width:
	lodsb
	push 	dx
	push 	cx
	add 	dx, cx
	call 	write_in_map
	pop 	cx
	pop 	dx
	add 	cl, 1
	cmp 	cl, 26
	jne 	game_over_width
	add 	ch, 1
	cmp 	ch, 13
	jne 	game_over_height
	xor 	ax, ax
	int 	16h
draw_bye:
	mov 	si, offset bye
	mov 	dx, 0d13h
	mov 	ch, 0
draw_bye_height:
	mov 	cl, 0
draw_bye_width:
	lodsb
	push 	dx
	push 	cx
	add 	dx, cx
	call 	write_in_map
	pop 	cx
	pop 	dx
	add 	cl, 1
	cmp 	cl, 26
	jne 	draw_bye_width
	add 	ch, 1
	cmp 	ch, 13
	jne 	draw_bye_height
	xor 	ax, ax
	int 	16h
	xor 	ax, ax
	mov 	al, [prev_mode]
	int 	10h
	ret
end start
