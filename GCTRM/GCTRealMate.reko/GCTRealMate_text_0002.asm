;;; Segment .text (00401000)

l00421044:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-14h],esp
	push	6h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432978h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],13h
	mov	ecx,esp
	push	dword ptr [edi]
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	4210D6h

l0042108E:
	mov	esi,[edi]
	lea	eax,[esi+48h]
	push	eax
	call	41C910h
	push	eax
	lea	eax,[esi+30h]
	push	eax
	call	41C910h
	push	eax
	lea	eax,[esi+18h]
	push	eax
	call	41C910h
	push	eax
	call	41C680h
	mov	edx,1Ah
	mov	esi,eax
	call	427210h
	mulsd	xmm0,double ptr [432EE0h]
	call	42D911h
	add	eax,52Ch
	jmp	4215F1h

l004210D6:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-14h],esp
	push	3h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432980h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],14h
	mov	ecx,esp
	push	dword ptr [edi]
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	421137h

l00421120:
	mov	edx,1Ah
	call	427210h
	mulsd	xmm0,double ptr [432EF8h]
	jmp	420DE7h

l00421137:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-14h],esp
	push	3h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432984h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],15h
	mov	ecx,esp
	push	dword ptr [edi]
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	421198h

l00421181:
	mov	edx,1Ah
	call	427210h
	mulsd	xmm0,double ptr [432F08h]
	jmp	420DE7h

l00421198:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-14h],esp
	push	3h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432988h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],16h
	mov	ecx,esp
	push	dword ptr [edi]
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	4211F9h

l004211E2:
	mov	edx,1Ah
	call	427210h
	mulsd	xmm0,double ptr [432EE8h]
	jmp	420DE7h

l004211F9:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-14h],esp
	push	4h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	43298Ch
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],17h
	mov	ecx,esp
	push	dword ptr [edi]
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	42125Ah

l00421243:
	mov	edx,1Ah
	call	427210h
	mulsd	xmm0,double ptr [432F20h]
	jmp	420DE7h

l0042125A:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-14h],esp
	push	4h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432994h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],18h
	mov	ecx,esp
	push	dword ptr [edi]
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	4212BBh

l004212A4:
	mov	edx,1Ah
	call	427210h
	mulsd	xmm0,double ptr [432F30h]
	jmp	420DE7h

l004212BB:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-14h],esp
	push	3h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	43299Ch
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],19h
	mov	ecx,esp
	push	dword ptr [edi]
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	421396h

l00421309:
	mov	edx,1Ah
	call	427210h
	mulsd	xmm0,double ptr [432F50h]
	call	42D911h
	mov	esi,[edi]
	mov	[ebp-18h],eax
	lea	eax,[esi+48h]
	mov	[ebp-20h],eax
	call	dword ptr [43129Ch]
	add	esi,30h
	mov	[ebp-1Ch],eax
	cmp	dword ptr [esi+14h],10h
	jc	42133Fh

l0042133D:
	mov	esi,[esi]

l0042133F:
	mov	dword ptr [eax],0h
	lea	eax,[ebp-14h]
	push	0h
	push	eax
	push	esi
	call	dword ptr [431200h]
	add	esp,0Ch
	mov	[ebp-24h],eax
	cmp	esi,[ebp-14h]
	jz	420D4Fh

l00421361:
	mov	eax,[ebp-1Ch]
	cmp	dword ptr [eax],22h
	jz	420CA2h

l0042136D:
	mov	esi,[edi]
	push	dword ptr [ebp-20h]
	add	esi,18h
	call	41C910h
	push	eax
	mov	eax,[ebp-24h]
	shl	eax,2h
	push	eax
	push	esi
	call	41C910h
	push	eax
	call	41C740h
	add	eax,[ebp-18h]
	jmp	4215F3h

l00421396:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-14h],esp
	push	4h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	4329A0h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],1Ah
	mov	ecx,esp
	push	dword ptr [edi]
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	421440h

l004213E0:
	mov	edx,1Ah
	call	427210h
	mulsd	xmm0,double ptr [432F18h]
	call	42D911h
	mov	esi,[edi]
	mov	[ebp-18h],eax
	lea	eax,[esi+48h]
	mov	[ebp-20h],eax
	call	dword ptr [43129Ch]
	add	esi,30h
	mov	[ebp-14h],eax
	cmp	dword ptr [esi+14h],10h
	jc	421416h

l00421414:
	mov	esi,[esi]

l00421416:
	mov	dword ptr [eax],0h
	lea	eax,[ebp-1Ch]
	push	0h
	push	eax
	push	esi
	call	dword ptr [431200h]
	add	esp,0Ch
	mov	[ebp-24h],eax
	cmp	esi,[ebp-1Ch]
	jz	420D4Fh

l00421438:
	mov	eax,[ebp-14h]
	jmp	420D5Dh

l00421440:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-14h],esp
	push	5h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	4329A8h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],1Bh
	mov	ecx,esp
	push	dword ptr [edi]
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	4214D2h

l0042148A:
	mov	esi,[edi]
	lea	eax,[esi+48h]
	push	eax
	call	41C910h
	push	eax
	lea	eax,[esi+30h]
	push	eax
	call	41C910h
	push	eax
	lea	eax,[esi+18h]
	push	eax
	call	41C910h
	push	eax
	call	41C680h
	mov	edx,1Ah
	mov	esi,eax
	call	427210h
	mulsd	xmm0,double ptr [432EE0h]
	call	42D911h
	add	eax,5AAh
	jmp	4215F1h

l004214D2:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-14h],esp
	push	5h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	4329B0h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],1Ch
	mov	ecx,esp
	push	dword ptr [edi]
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	421564h

l0042151C:
	mov	esi,[edi]
	lea	eax,[esi+48h]
	push	eax
	call	41C910h
	push	eax
	lea	eax,[esi+30h]
	push	eax
	call	41C910h
	push	eax
	lea	eax,[esi+18h]
	push	eax
	call	41C910h
	push	eax
	call	41C680h
	mov	edx,1Ah
	mov	esi,eax
	call	427210h
	mulsd	xmm0,double ptr [432EE0h]
	call	42D911h
	add	eax,52Ah
	jmp	4215F1h

l00421564:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-14h],esp
	push	6h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	4329B8h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],1Dh
	mov	ecx,esp
	push	dword ptr [edi]
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	4215F6h

l004215AE:
	mov	esi,[edi]
	lea	eax,[esi+48h]
	push	eax
	call	41C910h
	push	eax
	lea	eax,[esi+30h]
	push	eax
	call	41C910h
	push	eax
	lea	eax,[esi+18h]
	push	eax
	call	41C910h
	push	eax
	call	41C680h
	mov	edx,1Ah
	mov	esi,eax
	call	427210h
	mulsd	xmm0,double ptr [432EE0h]
	call	42D911h
	add	eax,7AEh

l004215F1:
	add	eax,esi

l004215F3:
	mov	[ebx+60h],eax

l004215F6:
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	ecx,[ebp-10h]
	xor	ecx,ebp
	call	427500h
	mov	esp,ebp
	pop	ebp
	ret	4h
00421614             CC CC CC CC CC CC CC CC CC CC CC CC     ............

;; fn00421620: 00421620
;;   Called from:
;;     0041C0A7 (in fn0041AEF0)
fn00421620 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42FC70h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,30h
	push	ebx
	push	esi
	push	edi
	mov	eax,[43A008h]
	xor	eax,ebp
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	ebx,ecx
	mov	[ebp-14h],ebx
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-18h],esp
	push	4329C0h
	call	402890h
	mov	dword ptr [ebp-4h],0h
	lea	eax,[ebp-0Dh]
	mov	edi,[ebp+8h]
	sub	esp,18h
	mov	esi,esp
	mov	ecx,esi
	mov	edi,[edi]
	push	eax
	mov	[ebp-1Ch],esi
	push	dword ptr [ebp+8h]
	call	403B80h
	push	edi
	mov	ecx,esi
	mov	byte ptr [ebp-4h],1h
	call	402BB0h
	mov	byte ptr [ebp-4h],0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	421705h

l004216A3:
	mov	edx,1Ah
	lea	ecx,[edx-18h]
	call	427210h
	mulsd	xmm0,double ptr [432EA8h]

l004216B8:
	call	42D911h
	mov	ecx,[ebp-14h]
	mov	[ebp-18h],eax
	mov	eax,[ebp+8h]
	mov	edx,[eax]
	lea	esi,[edx+30h]
	push	esi
	lea	edi,[edx+48h]
	lea	ebx,[edx+18h]
	call	41C910h
	push	eax
	push	0h
	xor	edx,edx
	mov	ecx,edi
	call	403C30h
	add	esp,4h

l004216E6:
	push	eax
	push	ebx
	mov	ebx,[ebp-14h]
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C740h
	add	eax,[ebp-18h]
	mov	edi,[ebp+8h]
	jmp	42364Bh

l00421705:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-1Ch],esp
	push	4329C8h
	call	402890h
	mov	dword ptr [ebp-4h],2h
	sub	esp,18h
	mov	eax,[ebp+8h]
	mov	esi,esp
	mov	ecx,esi
	mov	edi,[eax]
	lea	eax,[ebp-0Dh]
	push	eax
	mov	[ebp-18h],esi
	push	dword ptr [ebp+8h]
	call	403B80h
	push	edi
	mov	ecx,esi
	mov	byte ptr [ebp-4h],3h
	call	402BB0h
	mov	byte ptr [ebp-4h],2h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	4217C2h

l0042175B:
	mov	edx,1Ah
	lea	ecx,[edx-18h]
	call	427210h
	mulsd	xmm0,double ptr [432EA8h]
	call	42D911h
	mov	ecx,[ebp-14h]
	mov	[ebp-18h],eax
	mov	eax,[ebp+8h]
	mov	edx,[eax]
	lea	esi,[edx+30h]
	push	esi
	lea	edi,[edx+48h]
	lea	ebx,[edx+18h]
	call	41C910h
	push	eax
	push	0h
	xor	edx,edx
	mov	ecx,edi
	call	403C30h
	add	esp,4h
	neg	eax
	movzx	eax,ax
	push	eax
	push	ebx
	mov	ebx,[ebp-14h]
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C740h
	add	eax,[ebp-18h]
	mov	edi,[ebp+8h]
	jmp	42364Bh

l004217C2:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-1Ch],esp
	push	4329D0h
	call	402890h
	mov	dword ptr [ebp-4h],4h
	sub	esp,18h
	mov	eax,[ebp+8h]
	mov	esi,esp
	mov	ecx,esi
	mov	edi,[eax]
	lea	eax,[ebp-0Dh]
	push	eax
	mov	[ebp-18h],esi
	push	dword ptr [ebp+8h]
	call	403B80h
	push	edi
	mov	ecx,esi
	mov	byte ptr [ebp-4h],5h
	call	402BB0h
	mov	byte ptr [ebp-4h],4h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	421868h

l00421818:
	mov	edx,1Ah
	lea	ecx,[edx-18h]
	call	427210h
	mulsd	xmm0,double ptr [432EA8h]
	call	42D911h
	mov	edi,eax
	mov	eax,[ebp+8h]
	push	0h
	push	0h
	mov	edx,[eax]
	lea	ecx,[edx+30h]
	lea	esi,[edx+18h]
	xor	edx,edx
	call	403C30h
	add	esp,4h
	mov	ecx,ebx
	push	eax
	push	esi
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C740h
	add	eax,edi
	mov	edi,[ebp+8h]
	jmp	42364Bh

l00421868:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-1Ch],esp
	push	4329D4h
	call	402890h
	mov	dword ptr [ebp-4h],6h
	sub	esp,18h
	mov	eax,[ebp+8h]
	mov	esi,esp
	mov	ecx,esi
	mov	edi,[eax]
	lea	eax,[ebp-0Dh]
	push	eax
	mov	[ebp-18h],esi
	push	dword ptr [ebp+8h]
	call	403B80h
	push	edi
	mov	ecx,esi
	mov	byte ptr [ebp-4h],7h
	call	402BB0h
	mov	byte ptr [ebp-4h],6h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	4218D8h

l004218BE:
	mov	edx,1Ah
	lea	ecx,[edx-18h]
	call	427210h
	mulsd	xmm0,double ptr [432EA0h]
	jmp	4216B8h

l004218D8:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-1Ch],esp
	push	4329DCh
	call	402890h
	mov	dword ptr [ebp-4h],8h
	sub	esp,18h
	mov	eax,[ebp+8h]
	mov	esi,esp
	mov	ecx,esi
	mov	edi,[eax]
	lea	eax,[ebp-0Dh]
	push	eax
	mov	[ebp-18h],esi
	push	dword ptr [ebp+8h]
	call	403B80h
	push	edi
	mov	ecx,esi
	mov	byte ptr [ebp-4h],9h
	call	402BB0h
	mov	byte ptr [ebp-4h],8h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	42197Bh

l0042192E:
	mov	edx,1Ah
	lea	ecx,[edx-18h]
	call	427210h
	mulsd	xmm0,double ptr [432EA0h]

l00421943:
	call	42D911h
	mov	ecx,[ebp-14h]
	mov	[ebp-18h],eax
	mov	eax,[ebp+8h]
	mov	edx,[eax]
	lea	esi,[edx+30h]
	push	esi
	lea	edi,[edx+48h]
	lea	ebx,[edx+18h]
	call	41C910h
	push	eax
	push	0h
	xor	edx,edx
	mov	ecx,edi
	call	403C30h
	add	esp,4h
	neg	eax
	movzx	eax,ax
	jmp	4216E6h

l0042197B:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-1Ch],esp
	push	4329E4h
	call	402890h
	mov	dword ptr [ebp-4h],0Ah
	sub	esp,18h
	mov	eax,[ebp+8h]
	mov	esi,esp
	mov	ecx,esi
	mov	edi,[eax]
	lea	eax,[ebp-0Dh]
	push	eax
	mov	[ebp-18h],esi
	push	dword ptr [ebp+8h]
	call	403B80h
	push	edi
	mov	ecx,esi
	mov	byte ptr [ebp-4h],0Bh
	call	402BB0h
	mov	byte ptr [ebp-4h],0Ah
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	4219EBh

l004219D1:
	mov	edx,1Ah
	lea	ecx,[edx-18h]
	call	427210h
	mulsd	xmm0,double ptr [432E98h]
	jmp	4216B8h

l004219EB:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-1Ch],esp
	push	4329ECh
	call	402890h
	mov	dword ptr [ebp-4h],0Ch
	sub	esp,18h
	mov	eax,[ebp+8h]
	mov	esi,esp
	mov	ecx,esi
	mov	edi,[eax]
	lea	eax,[ebp-0Dh]
	push	eax
	mov	[ebp-18h],esi
	push	dword ptr [ebp+8h]
	call	403B80h
	push	edi
	mov	ecx,esi
	mov	byte ptr [ebp-4h],0Dh
	call	402BB0h
	mov	byte ptr [ebp-4h],0Ch
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	421A5Bh

l00421A41:
	mov	edx,1Ah
	lea	ecx,[edx-18h]
	call	427210h
	mulsd	xmm0,double ptr [432E98h]
	jmp	421943h

l00421A5B:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-1Ch],esp
	push	4329F4h
	call	402890h
	mov	dword ptr [ebp-4h],0Eh
	sub	esp,18h
	mov	eax,[ebp+8h]
	mov	esi,esp
	mov	ecx,esi
	mov	edi,[eax]
	lea	eax,[ebp-0Dh]
	push	eax
	mov	[ebp-18h],esi
	push	dword ptr [ebp+8h]
	call	403B80h
	push	edi
	mov	ecx,esi
	mov	byte ptr [ebp-4h],0Fh
	call	402BB0h
	mov	byte ptr [ebp-4h],0Eh
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	421ACBh

l00421AB1:
	mov	edx,1Ah
	lea	ecx,[edx-18h]
	call	427210h
	mulsd	xmm0,double ptr [432E80h]
	jmp	4216B8h

l00421ACB:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-1Ch],esp
	push	4329FCh
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],10h
	mov	edi,[ebp+8h]
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	421B2Ah

l00421B0F:
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	0h
	push	3h
	jmp	421BE2h

l00421B2A:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432A04h
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],11h
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	421B9Bh

l00421B6B:
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	0h
	push	3h
	mov	ecx,edi
	call	40F760h
	xor	edx,edx
	mov	ecx,eax
	call	403C30h
	add	esp,4h
	neg	eax
	movzx	eax,ax
	jmp	421BF5h

l00421B9B:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	4326DCh
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],12h
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	421C24h

l00421BDC:
	push	0h
	push	0h
	push	2h

l00421BE2:
	mov	ecx,edi
	call	40F760h
	xor	edx,edx
	mov	ecx,eax
	call	403C30h
	add	esp,4h

l00421BF5:
	push	eax
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C740h
	push	0Eh
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	esi,eax
	mov	[ebx+60h],esi
	jmp	42364Eh

l00421C24:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432A0Ch
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],13h
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	421CB5h

l00421C65:
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	push	1Fh
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	eax,14h
	jmp	423649h

l00421CB5:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432A14h
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],14h
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	421D46h

l00421CF6:
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	push	1Fh
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	eax,10h
	jmp	423649h

l00421D46:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432A1Ch
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],15h
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	421DD7h

l00421D87:
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	push	1Fh
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	eax,10h
	jmp	423649h

l00421DD7:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432A24h
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],16h
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	421E6Ah

l00421E18:
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	push	1Fh
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	eax,114h
	jmp	423649h

l00421E6A:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432A2Ch
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],17h
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	421EFDh

l00421EAB:
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	push	1Fh
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	eax,110h
	jmp	423649h

l00421EFD:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432A34h
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],18h
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	421F90h

l00421F3E:
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	push	1Fh
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	eax,110h
	jmp	423649h

l00421F90:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432A3Ch
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],19h
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	422013h

l00421FD1:
	push	0h
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	push	1Fh
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	eax,1D4h
	jmp	423649h

l00422013:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432A44h
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],1Ah
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	422096h

l00422054:
	push	0h
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	push	1Fh
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	eax,1D0h
	jmp	423649h

l00422096:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432A4Ch
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],1Bh
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	422119h

l004220D7:
	push	0h
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	push	1Fh
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	eax,194h
	jmp	423649h

l00422119:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432A54h
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],1Ch
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	42219Ch

l0042215A:
	push	0h
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	push	1Fh
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	eax,190h
	jmp	423649h

l0042219C:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432A5Ch
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],1Dh
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	42221Fh

l004221DD:
	push	0h
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	push	1Fh
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	eax,0D0h
	jmp	423649h

l0042221F:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432A60h
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],1Eh
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	4222B2h

l00422260:
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	push	1Fh
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	eax,214h
	jmp	423649h

l004222B2:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432A64h
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],1Fh
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	422343h

l004222F3:
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	push	1Fh
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	eax,50h
	jmp	423649h

l00422343:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	4326F0h
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],20h
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	4223D4h

l00422384:
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	push	1Fh
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	eax,50h
	jmp	423649h

l004223D4:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432A6Ch
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],21h
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	42246Dh

l00422415:
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	0h
	push	3h
	mov	ecx,edi
	call	40F760h
	xor	edx,edx
	mov	ecx,eax
	call	403C30h
	add	esp,4h
	mov	ecx,edi
	push	eax
	push	1h
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C740h
	push	7h
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	esi,eax
	mov	[ebx+60h],esi
	jmp	42364Eh

l0042246D:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432A74h
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],22h
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	422500h

l004224AE:
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	push	1Fh
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	eax,1D2h
	jmp	423649h

l00422500:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432A7Ch
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],23h
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	422593h

l00422541:
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	push	1Fh
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	eax,1D6h
	jmp	423649h

l00422593:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432A84h
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],24h
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	422624h

l004225D4:
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	push	1Fh
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	eax,12h
	jmp	423649h

l00422624:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432A8Ch
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],25h
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	4226B5h

l00422665:
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	push	1Fh
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	eax,16h
	jmp	423649h

l004226B5:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432A94h
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],26h
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	422748h

l004226F6:
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	push	1Fh
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	eax,92h
	jmp	423649h

l00422748:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432A9Ch
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],27h
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	4227DBh

l00422789:
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	push	1Fh
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	eax,96h
	jmp	423649h

l004227DB:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432AA4h
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],28h
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	42286Eh

l0042281C:
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	push	1Fh
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	eax,392h
	jmp	423649h

l0042286E:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432AACh
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],29h
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	422901h

l004228AF:
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	push	1Fh
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	eax,396h
	jmp	423649h

l00422901:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432AB4h
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],2Ah
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	422994h

l00422942:
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	push	1Fh
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	eax,3D2h
	jmp	423649h

l00422994:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432ABCh
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],2Bh
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	422A27h

l004229D5:
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	push	1Fh
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	eax,3D6h
	jmp	423649h

l00422A27:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432AC4h
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],2Ch
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	422AC0h

l00422A68:
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	0h
	push	3h
	mov	ecx,edi
	call	40F760h
	xor	edx,edx
	mov	ecx,eax
	call	403C30h
	add	esp,4h
	mov	ecx,edi
	push	eax
	push	2h
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C740h
	push	1Dh
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	esi,eax
	mov	[ebx+60h],esi
	jmp	42364Eh

l00422AC0:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432ACCh
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],2Dh
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	422B59h

l00422B01:
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	0h
	push	3h
	mov	ecx,edi
	call	40F760h
	xor	edx,edx
	mov	ecx,eax
	call	403C30h
	add	esp,4h
	mov	ecx,edi
	push	eax
	push	2h
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C740h
	push	1Ch
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	esi,eax
	mov	[ebx+60h],esi
	jmp	42364Eh

l00422B59:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432AD4h
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],2Eh
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	422BF2h

l00422B9A:
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	0h
	push	3h
	mov	ecx,edi
	call	40F760h
	xor	edx,edx
	mov	ecx,eax
	call	403C30h
	add	esp,4h
	mov	ecx,edi
	push	eax
	push	2h
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C740h
	push	1Bh
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	esi,eax
	mov	[ebx+60h],esi
	jmp	42364Eh

l00422BF2:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432ADCh
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],2Fh
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	422C8Bh

l00422C33:
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	0h
	push	3h
	mov	ecx,edi
	call	40F760h
	xor	edx,edx
	mov	ecx,eax
	call	403C30h
	add	esp,4h
	mov	ecx,edi
	push	eax
	push	2h
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C740h
	push	1Ah
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	esi,eax
	mov	[ebx+60h],esi
	jmp	42364Eh

l00422C8B:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432AE4h
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],30h
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	422D24h

l00422CCC:
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	0h
	push	3h
	mov	ecx,edi
	call	40F760h
	xor	edx,edx
	mov	ecx,eax
	call	403C30h
	add	esp,4h
	mov	ecx,edi
	push	eax
	push	2h
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C740h
	push	19h
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	esi,eax
	mov	[ebx+60h],esi
	jmp	42364Eh

l00422D24:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432AECh
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],31h
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	422DBDh

l00422D65:
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	0h
	push	3h
	mov	ecx,edi
	call	40F760h
	xor	edx,edx
	mov	ecx,eax
	call	403C30h
	add	esp,4h
	mov	ecx,edi
	push	eax
	push	2h
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C740h
	push	18h
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	esi,eax
	mov	[ebx+60h],esi
	jmp	42364Eh

l00422DBD:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432AF0h
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],32h
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	422E0Ch

l00422DFE:
	push	18h
	mov	ecx,ebx
	call	41C5C0h
	jmp	42364Bh

l00422E0C:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432AF4h
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],33h
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	422E9Dh

l00422E4D:
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	push	1Fh
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	eax,78h
	jmp	423649h

l00422E9D:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432AFCh
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],34h
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	422F2Eh

l00422EDE:
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	push	1Fh
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	eax,38h
	jmp	423649h

l00422F2E:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432B00h
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],35h
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	422FC1h

l00422F6F:
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	push	1Fh
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	eax,3B8h
	jmp	423649h

l00422FC1:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432B08h
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],36h
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	423054h

l00423002:
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	push	1Fh
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	eax,278h
	jmp	423649h

l00423054:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432B0Ch
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],37h
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	4230E7h

l00423095:
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	push	1Fh
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	eax,338h
	jmp	423649h

l004230E7:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432B10h
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],38h
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	42317Ah

l00423128:
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	push	1Fh
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	eax,378h
	jmp	423649h

l0042317A:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	4326E8h
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],39h
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	42320Dh

l004231BB:
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	push	1Fh
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	eax,378h
	jmp	423649h

l0042320D:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432B14h
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],3Ah
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	4232A0h

l0042324E:
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	push	1Fh
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	eax,0F8h
	jmp	423649h

l004232A0:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432B18h
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],3Bh
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	423333h

l004232E1:
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	push	1Fh
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	eax,0F8h
	jmp	423649h

l00423333:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432B1Ch
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],3Ch
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	4233C6h

l00423374:
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	push	1Fh
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	eax,0F8h
	jmp	423649h

l004233C6:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432B20h
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],3Dh
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	423449h

l00423407:
	push	0h
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	push	1Fh
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	eax,774h
	jmp	423649h

l00423449:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432B28h
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],3Eh
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	4234CCh

l0042348A:
	push	0h
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	push	1Fh
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	eax,734h
	jmp	423649h

l004234CC:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432B30h
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],3Fh
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	42354Fh

l0042350D:
	push	0h
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	push	1Fh
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	eax,7B4h
	jmp	423649h

l0042354F:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432B38h
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],40h
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	4235CDh

l00423590:
	push	0h
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	push	1Fh
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	eax,74h
	jmp	423649h

l004235CD:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432B40h
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],41h
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	42364Eh

l0042360E:
	push	0h
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	push	1Fh
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	eax,34h

l00423649:
	add	eax,esi

l0042364B:
	mov	[ebx+60h],eax

l0042364E:
	mov	ecx,ebx
	call	41C5B0h
	cmp	eax,1Fh
	jnz	423781h

l0042365E:
	lea	ecx,[ebp-24h]
	call	401420h
	mov	esi,eax
	push	2h
	push	0h
	mov	ecx,edi
	mov	dword ptr [ebp-4h],42h
	call	40F760h
	mov	ecx,eax
	call	402A60h
	sub	eax,2h
	mov	ecx,edi
	push	eax
	lea	eax,[ebp-3Ch]
	push	eax
	push	0h
	call	40F760h
	mov	ecx,eax
	call	40F7F0h
	push	esi
	mov	edx,432B48h
	mov	byte ptr [ebp-4h],43h
	mov	ecx,eax
	call	411F00h
	add	esp,4h
	lea	ecx,[ebp-3Ch]
	mov	bl,al
	call	402800h
	lea	ecx,[ebp-24h]
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	401470h
	test	bl,bl
	jz	4236E8h

l004236CA:
	mov	eax,[ebp-14h]
	add	dword ptr [eax+60h],191h
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	4h

l004236E8:
	push	0h
	mov	ecx,edi
	call	40F760h
	mov	ecx,eax
	call	402A60h
	dec	eax
	mov	ecx,edi
	push	eax
	push	0h
	call	40F760h
	mov	ecx,eax
	call	40F870h
	cmp	byte ptr [eax],6Fh
	jz	423777h

l0042370F:
	push	0h
	mov	ecx,edi
	call	40F760h
	mov	ecx,eax
	call	402A60h
	dec	eax
	mov	ecx,edi
	push	eax
	push	0h
	call	40F760h
	mov	ecx,eax
	call	40F870h
	cmp	byte ptr [eax],4Fh
	jz	423777h

l00423736:
	push	0h
	mov	ecx,edi
	call	40F760h
	mov	ecx,eax
	call	402A60h
	dec	eax
	mov	ecx,edi
	push	eax
	push	0h
	call	40F760h
	mov	ecx,eax
	call	40F870h
	cmp	byte ptr [eax],2Eh
	jnz	423781h

l0042375D:
	mov	eax,[ebp-14h]
	inc	dword ptr [eax+60h]
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	4h

l00423777:
	mov	eax,[ebp-14h]
	add	dword ptr [eax+60h],190h

l00423781:
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	4h
00423795                CC CC CC CC CC CC CC CC CC CC CC      ...........

;; fn004237A0: 004237A0
;;   Called from:
;;     0041BAE9 (in fn0041AEF0)
fn004237A0 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42FD9Fh
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,18h
	push	ebx
	push	esi
	push	edi
	mov	eax,[43A008h]
	xor	eax,ebp
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	edi,ecx
	mov	edx,1Ah
	mov	dword ptr [ebp-10h],0h
	call	427210h
	movsd	double ptr [ebp-1Ch],xmm0
	mulsd	xmm0,double ptr [432EE0h]
	call	42D911h
	sub	esp,18h
	mov	[edi+60h],eax
	mov	ecx,esp
	mov	[ebp-10h],esp
	push	5h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432B4Ch
	mov	byte ptr [ecx],0h
	call	402A70h
	mov	dword ptr [ebp-4h],0h
	sub	esp,18h
	mov	ebx,[ebp+8h]
	mov	ecx,esp
	push	dword ptr [ebx]
	call	4028D0h
	mov	ecx,edi
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	423A20h

l00423841:
	add	dword ptr [edi+60h],3A6h
	push	1h
	mov	dword ptr [ebp-4h],1h
	call	dword ptr [4311A8h]
	mov	esi,eax
	mov	[ebp-18h],esi
	mov	dword ptr [ebp-4h],2h
	lea	eax,[ebp-1Ch]
	mov	ecx,[ebx]
	mov	edx,4326F8h
	add	ecx,30h
	mov	dword ptr [ebp-10h],1h
	push	eax
	call	411F00h
	add	esp,8h
	test	al,al
	jnz	423898h

l00423884:
	mov	eax,[ebx]
	add	eax,30h
	push	eax
	call	41C910h
	mov	byte ptr [ebp+0Bh],0h
	cmp	eax,8h
	jnz	42389Ch

l00423898:
	mov	byte ptr [ebp+0Bh],1h

l0042389C:
	mov	dword ptr [ebp-4h],3h
	test	esi,esi
	jz	4238BAh

l004238A7:
	mov	eax,[esi]
	mov	ecx,esi
	call	dword ptr [eax+8h]
	test	eax,eax
	jz	4238BAh

l004238B2:
	mov	edx,[eax]
	mov	ecx,eax
	push	1h
	call	dword ptr [edx]

l004238BA:
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	cmp	byte ptr [ebp+0Bh],0h
	jz	4238E4h

l004238C7:
	mov	eax,[ebx]
	push	0h
	add	eax,18h
	push	8h
	push	eax
	call	41C910h
	push	eax
	call	41C680h
	add	[edi+60h],eax
	jmp	4240E4h

l004238E4:
	push	1h
	mov	dword ptr [ebp-4h],4h
	call	dword ptr [4311A8h]
	mov	esi,eax
	mov	[ebp-18h],esi
	mov	dword ptr [ebp-4h],5h
	lea	eax,[ebp-1Ch]
	mov	ecx,[ebx]
	mov	edx,4326FCh
	add	ecx,30h
	mov	dword ptr [ebp-10h],2h
	push	eax
	call	411F00h
	add	esp,8h
	test	al,al
	jnz	423934h

l00423920:
	mov	eax,[ebx]
	add	eax,30h
	push	eax
	call	41C910h
	mov	byte ptr [ebp+0Bh],0h
	cmp	eax,9h
	jnz	423938h

l00423934:
	mov	byte ptr [ebp+0Bh],1h

l00423938:
	mov	dword ptr [ebp-4h],6h
	test	esi,esi
	jz	423956h

l00423943:
	mov	eax,[esi]
	mov	ecx,esi
	call	dword ptr [eax+8h]
	test	eax,eax
	jz	423956h

l0042394E:
	mov	edx,[eax]
	mov	ecx,eax
	push	1h
	call	dword ptr [edx]

l00423956:
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	cmp	byte ptr [ebp+0Bh],0h
	jz	423980h

l00423963:
	push	0h
	push	9h

l00423967:
	mov	eax,[ebx]
	add	eax,18h
	push	eax
	call	41C910h
	push	eax
	call	41C680h
	add	[edi+60h],eax
	jmp	4240E4h

l00423980:
	push	1h
	mov	dword ptr [ebp-4h],7h
	call	dword ptr [4311A8h]
	mov	esi,eax
	mov	[ebp-18h],esi
	mov	dword ptr [ebp-4h],8h
	lea	eax,[ebp-1Ch]
	mov	ecx,[ebx]
	mov	edx,432B54h
	add	ecx,30h
	mov	dword ptr [ebp-10h],4h
	push	eax
	call	411F00h
	add	esp,8h
	test	al,al
	jnz	4239D0h

l004239BC:
	mov	eax,[ebx]
	add	eax,30h
	push	eax
	call	41C910h
	mov	byte ptr [ebp+0Bh],0h
	cmp	eax,1h
	jnz	4239D4h

l004239D0:
	mov	byte ptr [ebp+0Bh],1h

l004239D4:
	mov	dword ptr [ebp-4h],9h
	test	esi,esi
	jz	4239F2h

l004239DF:
	mov	eax,[esi]
	mov	ecx,esi
	call	dword ptr [eax+8h]
	test	eax,eax
	jz	4239F2h

l004239EA:
	mov	edx,[eax]
	mov	ecx,eax
	push	1h
	call	dword ptr [edx]

l004239F2:
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	cmp	byte ptr [ebp+0Bh],0h
	jz	4240E4h

l00423A03:
	mov	eax,[ebx]
	push	0h
	add	eax,18h
	push	1h
	push	eax
	call	41C910h
	push	eax
	call	41C680h
	add	[edi+60h],eax
	jmp	4240E4h

l00423A20:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	4h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432B58h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],0Ah
	mov	ecx,esp
	push	dword ptr [ebx]
	call	4028D0h
	mov	ecx,edi
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	423A8Ch

l00423A6A:
	mov	eax,[ebx]
	push	0h
	add	eax,18h
	push	8h
	push	eax
	call	41C910h
	push	eax
	call	41C680h
	add	eax,3A6h
	add	[edi+60h],eax
	jmp	4240E4h

l00423A8C:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	5h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432B60h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],0Bh
	mov	ecx,esp
	push	dword ptr [ebx]
	call	4028D0h
	mov	ecx,edi
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	423AF8h

l00423AD6:
	mov	eax,[ebx]
	push	0h
	add	eax,18h
	push	9h
	push	eax
	call	41C910h
	push	eax
	call	41C680h
	add	eax,3A6h
	add	[edi+60h],eax
	jmp	4240E4h

l00423AF8:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	5h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432B68h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],0Ch
	mov	ecx,esp
	push	dword ptr [ebx]
	call	4028D0h
	mov	ecx,edi
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	423B64h

l00423B42:
	mov	eax,[ebx]
	push	0h
	add	eax,18h
	push	1h
	push	eax
	call	41C910h
	push	eax
	call	41C680h
	add	eax,3A6h
	add	[edi+60h],eax
	jmp	4240E4h

l00423B64:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	5h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432B70h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],0Dh
	mov	ecx,esp
	push	dword ptr [ebx]
	call	4028D0h
	mov	ecx,edi
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	423D16h

l00423BB2:
	add	dword ptr [edi+60h],2A6h
	mov	dword ptr [ebp-4h],0Eh
	mov	esi,[4311A8h]
	push	1h
	call	esi
	mov	[ebp-18h],eax
	mov	dword ptr [ebp-4h],0Fh
	lea	eax,[ebp-1Ch]
	mov	ecx,[ebx]
	mov	edx,4326F8h
	add	ecx,30h
	mov	dword ptr [ebp-10h],8h
	push	eax
	call	411F00h
	add	esp,8h
	test	al,al
	jnz	423C09h

l00423BF5:
	mov	eax,[ebx]
	add	eax,30h
	push	eax
	call	41C910h
	mov	byte ptr [ebp+0Bh],0h
	cmp	eax,8h
	jnz	423C0Dh

l00423C09:
	mov	byte ptr [ebp+0Bh],1h

l00423C0D:
	lea	ecx,[ebp-1Ch]
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	401470h
	cmp	byte ptr [ebp+0Bh],0h
	jz	423C2Bh

l00423C22:
	push	0h
	push	8h
	jmp	423967h

l00423C2B:
	push	1h
	mov	dword ptr [ebp-4h],10h
	call	esi
	mov	[ebp-18h],eax
	mov	dword ptr [ebp-4h],11h
	lea	eax,[ebp-1Ch]
	mov	ecx,[ebx]
	mov	edx,4326FCh
	add	ecx,30h
	mov	dword ptr [ebp-10h],10h
	push	eax
	call	411F00h
	add	esp,8h
	test	al,al
	jnz	423C75h

l00423C61:
	mov	eax,[ebx]
	add	eax,30h
	push	eax
	call	41C910h
	mov	byte ptr [ebp+0Bh],0h
	cmp	eax,9h
	jnz	423C79h

l00423C75:
	mov	byte ptr [ebp+0Bh],1h

l00423C79:
	lea	ecx,[ebp-1Ch]
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	401470h
	cmp	byte ptr [ebp+0Bh],0h
	jnz	423963h

l00423C92:
	push	1h
	mov	dword ptr [ebp-4h],12h
	call	esi
	mov	[ebp-18h],eax
	mov	dword ptr [ebp-4h],13h
	lea	eax,[ebp-1Ch]
	mov	ecx,[ebx]
	mov	edx,432B54h
	add	ecx,30h
	mov	dword ptr [ebp-10h],20h
	push	eax
	call	411F00h
	add	esp,8h
	test	al,al
	jnz	423CDCh

l00423CC8:
	mov	eax,[ebx]
	add	eax,30h
	push	eax
	call	41C910h
	mov	byte ptr [ebp+0Bh],0h
	cmp	eax,1h
	jnz	423CE0h

l00423CDC:
	mov	byte ptr [ebp+0Bh],1h

l00423CE0:
	lea	ecx,[ebp-1Ch]
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	401470h
	cmp	byte ptr [ebp+0Bh],0h
	jz	4240E4h

l00423CF9:
	mov	eax,[ebx]
	push	0h
	add	eax,18h
	push	1h
	push	eax
	call	41C910h
	push	eax
	call	41C680h
	add	[edi+60h],eax
	jmp	4240E4h

l00423D16:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	4h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432B78h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],14h
	mov	ecx,esp
	push	dword ptr [ebx]
	call	4028D0h
	mov	ecx,edi
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	423D82h

l00423D60:
	mov	eax,[ebx]
	push	0h
	add	eax,18h
	push	8h
	push	eax
	call	41C910h
	push	eax
	call	41C680h
	add	eax,2A6h
	add	[edi+60h],eax
	jmp	4240E4h

l00423D82:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	5h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432B80h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],15h
	mov	ecx,esp
	push	dword ptr [ebx]
	call	4028D0h
	mov	ecx,edi
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	423DEEh

l00423DCC:
	mov	eax,[ebx]
	push	0h
	add	eax,18h
	push	9h
	push	eax
	call	41C910h
	push	eax
	call	41C680h
	add	eax,2A6h
	add	[edi+60h],eax
	jmp	4240E4h

l00423DEE:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	5h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432B88h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],16h
	mov	ecx,esp
	push	dword ptr [ebx]
	call	4028D0h
	mov	ecx,edi
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	423E5Ah

l00423E38:
	mov	eax,[ebx]
	push	0h
	add	eax,18h
	push	1h
	push	eax
	call	41C910h
	push	eax
	call	41C680h
	add	eax,2A6h
	add	[edi+60h],eax
	jmp	4240E4h

l00423E5A:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	4h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432B90h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],17h
	mov	ecx,esp
	push	dword ptr [ebx]
	call	4028D0h
	mov	ecx,edi
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	423EC4h

l00423EA4:
	mov	eax,[ebx]
	push	0h
	add	eax,18h
	push	0h
	push	eax
	call	41C910h
	push	eax
	call	41C680h
	add	eax,26h
	add	[edi+60h],eax
	jmp	4240E4h

l00423EC4:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	4h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432B98h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],18h
	mov	ecx,esp
	push	dword ptr [ebx]
	call	4028D0h
	mov	ecx,edi
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	423F43h

l00423F0E:
	movsd	xmm0,double ptr [ebp-1Ch]
	mulsd	xmm0,double ptr [432F58h]
	call	42D911h
	mov	ecx,[ebx]
	mov	esi,eax
	push	0h
	add	ecx,18h
	push	0h
	push	ecx
	call	41C910h
	push	eax
	call	41C680h
	add	eax,48Eh
	add	eax,esi
	jmp	4240E1h

l00423F43:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	5h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432BA0h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],19h
	mov	ecx,esp
	push	dword ptr [ebx]
	call	4028D0h
	mov	ecx,edi
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	424014h

l00423F91:
	mov	eax,[ebx]
	lea	ecx,[eax+18h]
	push	ecx
	lea	esi,[eax+30h]
	call	41C910h
	mov	edx,0Ch
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	addsd	xmm0,double ptr [432F80h+eax*8]
	movsd	double ptr [ebp-14h],xmm0
	call	427210h
	movsd	xmm1,double ptr [ebp-14h]
	mulsd	xmm1,xmm0
	push	esi
	addsd	xmm1,double ptr [432F68h]
	movsd	double ptr [ebp-14h],xmm1
	call	41C910h
	mov	edx,15h
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	addsd	xmm0,double ptr [432F80h+eax*8]
	movsd	double ptr [ebp-1Ch],xmm0
	call	427210h
	movsd	xmm1,double ptr [ebp-1Ch]
	mulsd	xmm1,xmm0
	addsd	xmm1,double ptr [ebp-14h]
	jmp	4240C1h

l00424014:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	4h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432BA8h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],1Ah
	mov	ecx,esp
	push	dword ptr [ebx]
	call	4028D0h
	mov	ecx,edi
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	4240E4h

l00424062:
	mov	eax,[ebx]
	add	eax,18h
	push	eax
	call	41C910h
	mov	edx,15h
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	addsd	xmm0,double ptr [432F80h+eax*8]
	movsd	double ptr [ebp-14h],xmm0
	call	427210h
	movsd	xmm1,double ptr [ebp-14h]
	mov	edx,0Ch
	mulsd	xmm1,xmm0
	movsd	double ptr [ebp-14h],xmm1
	call	427210h
	mulsd	xmm0,double ptr [432F60h]
	movsd	xmm1,double ptr [ebp-14h]
	addsd	xmm0,double ptr [432F68h]
	addsd	xmm1,xmm0

l004240C1:
	mov	eax,[edi+60h]
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	addsd	xmm0,double ptr [432F80h+eax*8]
	addsd	xmm0,xmm1
	call	42D911h

l004240E1:
	mov	[edi+60h],eax

l004240E4:
	push	1h
	mov	dword ptr [ebp-4h],1Bh
	call	dword ptr [4311A8h]
	mov	esi,eax
	add	esp,4h
	mov	[ebp-18h],esi
	lea	eax,[ebp-1Ch]
	mov	dword ptr [ebp-4h],1Ch
	mov	edx,[ebx]
	push	eax
	push	ecx
	lea	ecx,[ebp-24h]
	mov	dword ptr [ebp-10h],40h
	call	427230h
	add	esp,8h
	mov	ecx,[eax]
	cmp	ecx,[eax+4h]
	jz	424135h

l00424122:
	mov	eax,[edi+60h]
	and	eax,0FC000000h
	cmp	eax,0FC000000h
	jnz	424135h

l00424131:
	mov	bl,1h
	jmp	424137h

l00424135:
	xor	bl,bl

l00424137:
	mov	dword ptr [ebp-4h],1Dh
	test	esi,esi
	jz	424155h

l00424142:
	mov	eax,[esi]
	mov	ecx,esi
	call	dword ptr [eax+8h]
	test	eax,eax
	jz	424155h

l0042414D:
	mov	edx,[eax]
	mov	ecx,eax
	push	1h
	call	dword ptr [edx]

l00424155:
	test	bl,bl
	jz	42415Ch

l00424159:
	inc	dword ptr [edi+60h]

l0042415C:
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	4h

;; fn00424170: 00424170
;;   Called from:
;;     0041BAF9 (in fn0041AEF0)
fn00424170 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42FF10h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,1Ch
	push	ebx
	push	esi
	push	edi
	mov	eax,[43A008h]
	xor	eax,ebp
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	ebx,ecx
	mov	edx,1Ah
	lea	ecx,[edx-18h]
	call	427210h
	mulsd	xmm0,double ptr [432E70h]
	call	42D911h
	sub	esp,18h
	mov	[ebx+60h],eax
	mov	ecx,esp
	mov	[ebp-14h],esp
	push	432BB4h
	call	402890h
	mov	dword ptr [ebp-4h],0h
	lea	eax,[ebp-0Dh]
	mov	edi,[ebp+8h]
	sub	esp,18h
	mov	esi,esp
	mov	ecx,esi
	mov	edi,[edi]
	push	eax
	mov	[ebp-1Ch],esi
	push	dword ptr [ebp+8h]
	call	403B80h
	push	edi
	mov	ecx,esi
	mov	byte ptr [ebp-4h],1h
	call	402BB0h
	mov	byte ptr [ebp-4h],0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	424263h

l0042420D:
	mov	eax,[ebp+8h]
	mov	ecx,ebx
	mov	esi,[eax]
	lea	eax,[esi+48h]
	push	eax
	call	41C910h
	push	6h

l0042421F:
	lea	eax,[esi+60h]
	mov	ecx,ebx
	push	eax
	call	41C910h
	xor	edx,edx
	mov	ecx,7h
	div	ecx
	add	edx,edx

l00424235:
	push	edx
	lea	eax,[esi+30h]
	mov	ecx,ebx
	push	eax
	call	41C910h
	push	eax
	lea	eax,[esi+18h]
	mov	ecx,ebx
	push	eax
	call	41C910h
	push	eax
	push	esi
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C7E0h
	jmp	4259FCh

l00424263:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-1Ch],esp
	push	432BBCh
	call	402890h
	mov	dword ptr [ebp-4h],2h
	sub	esp,18h
	mov	eax,[ebp+8h]
	mov	esi,esp
	mov	ecx,esi
	mov	edi,[eax]
	lea	eax,[ebp-0Dh]
	push	eax
	mov	[ebp-14h],esi
	push	dword ptr [ebp+8h]
	call	403B80h
	push	edi
	mov	ecx,esi
	mov	byte ptr [ebp-4h],3h
	call	402BB0h
	mov	byte ptr [ebp-4h],2h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	4242EBh

l004242B9:
	mov	eax,[ebp+8h]
	mov	ecx,ebx
	mov	esi,[eax]
	lea	eax,[esi+48h]
	push	eax
	call	41C910h
	push	6h
	lea	eax,[esi+60h]
	mov	ecx,ebx
	push	eax
	call	41C910h
	xor	edx,edx
	mov	ecx,7h
	div	ecx
	lea	edx,[0001h+edx*2]
	jmp	424235h

l004242EB:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-1Ch],esp
	push	432BC4h
	call	402890h
	mov	dword ptr [ebp-4h],4h
	sub	esp,18h
	mov	eax,[ebp+8h]
	mov	esi,esp
	mov	ecx,esi
	mov	edi,[eax]
	lea	eax,[ebp-0Dh]
	push	eax
	mov	[ebp-14h],esi
	push	dword ptr [ebp+8h]
	call	403B80h
	push	edi
	mov	ecx,esi
	mov	byte ptr [ebp-4h],5h
	call	402BB0h
	mov	byte ptr [ebp-4h],4h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	424358h

l00424341:
	mov	eax,[ebp+8h]
	mov	ecx,ebx
	mov	esi,[eax]
	lea	eax,[esi+48h]
	push	eax
	call	41C910h
	push	7h
	jmp	42421Fh

l00424358:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-1Ch],esp
	push	432BD0h
	call	402890h
	mov	dword ptr [ebp-4h],6h
	sub	esp,18h
	mov	eax,[ebp+8h]
	mov	esi,esp
	mov	ecx,esi
	mov	edi,[eax]
	lea	eax,[ebp-0Dh]
	push	eax
	mov	[ebp-14h],esi
	push	dword ptr [ebp+8h]
	call	403B80h
	push	edi
	mov	ecx,esi
	mov	byte ptr [ebp-4h],7h
	call	402BB0h
	mov	byte ptr [ebp-4h],6h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	4243E0h

l004243AE:
	mov	eax,[ebp+8h]
	mov	ecx,ebx
	mov	esi,[eax]
	lea	eax,[esi+48h]
	push	eax
	call	41C910h
	push	7h
	lea	eax,[esi+60h]
	mov	ecx,ebx
	push	eax
	call	41C910h
	xor	edx,edx
	mov	ecx,7h
	div	ecx
	lea	edx,[0001h+edx*2]
	jmp	424235h

l004243E0:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-1Ch],esp
	push	432BD8h
	call	402890h
	mov	dword ptr [ebp-4h],8h
	sub	esp,18h
	mov	eax,[ebp+8h]
	mov	esi,esp
	mov	ecx,esi
	mov	edi,[eax]
	lea	eax,[ebp-0Eh]
	push	eax
	mov	[ebp-14h],esi
	push	dword ptr [ebp+8h]
	call	403B80h
	push	edi
	mov	ecx,esi
	mov	byte ptr [ebp-4h],9h
	call	402BB0h
	mov	byte ptr [ebp-4h],8h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	4245A3h

l0042443A:
	mov	edx,1Ah
	lea	ecx,[edx-18h]
	call	427210h
	mulsd	xmm0,double ptr [432F40h]
	call	42D911h
	mov	esi,eax
	mov	eax,[ebp+8h]
	mov	edi,[eax]
	lea	ecx,[edi+60h]
	push	ecx
	mov	ecx,ebx
	call	41C910h
	mov	ecx,[ebp+8h]
	push	5h
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	xor	edx,edx
	mov	ecx,7h
	div	ecx
	movd	xmm0,edx
	cvtdq2pd	xmm0,xmm0
	shr	edx,1Fh
	addsd	xmm0,double ptr [432F80h+edx*8]
	lea	edx,[ecx+5h]
	lea	ecx,[edx-0Ah]
	movsd	double ptr [ebp-20h],xmm0
	call	427210h
	mulsd	xmm0,double ptr [ebp-20h]
	lea	eax,[edi+18h]
	push	eax
	mov	ecx,ebx
	movsd	double ptr [ebp-28h],xmm0
	call	41C910h
	mov	edx,15h
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	lea	ecx,[edx-13h]
	addsd	xmm0,double ptr [432F80h+eax*8]
	movsd	double ptr [ebp-20h],xmm0
	call	427210h
	mulsd	xmm0,double ptr [ebp-20h]
	lea	eax,[edi+48h]
	mov	ecx,ebx
	movd	xmm1,esi
	cvtdq2pd	xmm1,xmm1
	shr	esi,1Fh
	push	eax
	addsd	xmm1,double ptr [432F80h+esi*8]
	addsd	xmm0,xmm1
	movsd	double ptr [ebp-18h],xmm0
	call	41C910h
	mov	edx,10h
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	lea	ecx,[edx-0Eh]
	addsd	xmm0,double ptr [432F80h+eax*8]
	movsd	double ptr [ebp-20h],xmm0
	call	427210h
	mulsd	xmm0,double ptr [ebp-20h]
	mov	ecx,[ebp+8h]
	push	0h
	push	2h
	addsd	xmm0,double ptr [ebp-18h]
	addsd	xmm0,double ptr [ebp-28h]
	movsd	double ptr [ebp-28h],xmm0
	call	40F760h
	xor	edx,edx
	mov	ecx,eax
	call	403C30h
	add	esp,4h
	cdq
	push	0FFFFh
	push	0FFh
	push	edx
	push	eax
	call	42D670h
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	addsd	xmm0,double ptr [432F80h+eax*8]
	addsd	xmm0,double ptr [ebp-28h]
	call	42D911h
	mov	[ebx+60h],eax
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	4h

l004245A3:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-1Ch],esp
	push	432BE0h
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],0Ah
	mov	edi,[ebp+8h]
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	424752h

l004245EB:
	push	4h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	mov	edx,15h
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	lea	ecx,[edx-13h]
	addsd	xmm0,double ptr [432F80h+eax*8]
	movsd	double ptr [ebp-28h],xmm0
	call	427210h
	mulsd	xmm0,double ptr [ebp-28h]
	mov	ecx,ebx
	push	38h
	movsd	double ptr [ebp-28h],xmm0
	call	41C5C0h
	push	3h
	mov	ecx,edi
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	addsd	xmm0,double ptr [432F80h+eax*8]
	addsd	xmm0,double ptr [ebp-28h]
	movsd	double ptr [ebp-20h],xmm0
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	mov	edx,10h
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	lea	ecx,[edx-0Eh]
	addsd	xmm0,double ptr [432F80h+eax*8]
	movsd	double ptr [ebp-28h],xmm0
	call	427210h
	mulsd	xmm0,double ptr [ebp-28h]
	mov	ecx,edi
	push	5h
	addsd	xmm0,double ptr [ebp-20h]
	movsd	double ptr [ebp-20h],xmm0
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	xor	edx,edx
	mov	ecx,7h
	div	ecx
	movd	xmm0,edx
	cvtdq2pd	xmm0,xmm0
	shr	edx,1Fh
	addsd	xmm0,double ptr [432F80h+edx*8]
	lea	edx,[ecx+5h]
	lea	ecx,[edx-0Ah]
	movsd	double ptr [ebp-28h],xmm0
	call	427210h
	mulsd	xmm0,double ptr [ebp-28h]
	mov	ecx,edi
	push	0h
	push	2h
	addsd	xmm0,double ptr [ebp-20h]
	movsd	double ptr [ebp-28h],xmm0
	call	40F760h
	xor	edx,edx
	mov	ecx,eax
	call	403C30h
	add	esp,4h
	cdq
	push	0FFFFh
	push	0FFh
	push	edx
	push	eax
	call	42D670h
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	addsd	xmm0,double ptr [432F80h+eax*8]
	addsd	xmm0,double ptr [ebp-28h]
	call	42D911h
	mov	[ebx+60h],eax
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	4h

l00424752:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432BE8h
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],0Bh
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	4248FEh

l00424797:
	push	4h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	mov	edx,15h
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	lea	ecx,[edx-13h]
	addsd	xmm0,double ptr [432F80h+eax*8]
	movsd	double ptr [ebp-28h],xmm0
	call	427210h
	mulsd	xmm0,double ptr [ebp-28h]
	mov	ecx,ebx
	push	3Dh
	movsd	double ptr [ebp-28h],xmm0
	call	41C5C0h
	push	3h
	mov	ecx,edi
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	addsd	xmm0,double ptr [432F80h+eax*8]
	addsd	xmm0,double ptr [ebp-28h]
	movsd	double ptr [ebp-20h],xmm0
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	mov	edx,10h
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	lea	ecx,[edx-0Eh]
	addsd	xmm0,double ptr [432F80h+eax*8]
	movsd	double ptr [ebp-28h],xmm0
	call	427210h
	mulsd	xmm0,double ptr [ebp-28h]
	mov	ecx,edi
	push	5h
	addsd	xmm0,double ptr [ebp-20h]
	movsd	double ptr [ebp-20h],xmm0
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	xor	edx,edx
	mov	ecx,7h
	div	ecx
	movd	xmm0,edx
	cvtdq2pd	xmm0,xmm0
	shr	edx,1Fh
	addsd	xmm0,double ptr [432F80h+edx*8]
	lea	edx,[ecx+5h]
	lea	ecx,[edx-0Ah]
	movsd	double ptr [ebp-28h],xmm0
	call	427210h
	mulsd	xmm0,double ptr [ebp-28h]
	mov	ecx,edi
	push	0h
	push	2h
	addsd	xmm0,double ptr [ebp-20h]
	movsd	double ptr [ebp-28h],xmm0
	call	40F760h
	xor	edx,edx
	mov	ecx,eax
	call	403C30h
	add	esp,4h
	cdq
	push	0FFFFh
	push	0FFh
	push	edx
	push	eax
	call	42D670h
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	addsd	xmm0,double ptr [432F80h+eax*8]
	addsd	xmm0,double ptr [ebp-28h]
	call	42D911h
	mov	[ebx+60h],eax
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	4h

l004248FE:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432BF0h
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],0Ch
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	424AAAh

l00424943:
	push	4h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	mov	edx,15h
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	lea	ecx,[edx-13h]
	addsd	xmm0,double ptr [432F80h+eax*8]
	movsd	double ptr [ebp-28h],xmm0
	call	427210h
	mulsd	xmm0,double ptr [ebp-28h]
	mov	ecx,ebx
	push	3Ch
	movsd	double ptr [ebp-28h],xmm0
	call	41C5C0h
	push	3h
	mov	ecx,edi
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	addsd	xmm0,double ptr [432F80h+eax*8]
	addsd	xmm0,double ptr [ebp-28h]
	movsd	double ptr [ebp-20h],xmm0
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	mov	edx,10h
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	lea	ecx,[edx-0Eh]
	addsd	xmm0,double ptr [432F80h+eax*8]
	movsd	double ptr [ebp-28h],xmm0
	call	427210h
	mulsd	xmm0,double ptr [ebp-28h]
	mov	ecx,edi
	push	5h
	addsd	xmm0,double ptr [ebp-20h]
	movsd	double ptr [ebp-20h],xmm0
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	xor	edx,edx
	mov	ecx,7h
	div	ecx
	movd	xmm0,edx
	cvtdq2pd	xmm0,xmm0
	shr	edx,1Fh
	addsd	xmm0,double ptr [432F80h+edx*8]
	lea	edx,[ecx+5h]
	lea	ecx,[edx-0Ah]
	movsd	double ptr [ebp-28h],xmm0
	call	427210h
	mulsd	xmm0,double ptr [ebp-28h]
	mov	ecx,edi
	push	0h
	push	2h
	addsd	xmm0,double ptr [ebp-20h]
	movsd	double ptr [ebp-28h],xmm0
	call	40F760h
	xor	edx,edx
	mov	ecx,eax
	call	403C30h
	add	esp,4h
	cdq
	push	0FFFFh
	push	0FFh
	push	edx
	push	eax
	call	42D670h
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	addsd	xmm0,double ptr [432F80h+eax*8]
	addsd	xmm0,double ptr [ebp-28h]
	call	42D911h
	mov	[ebx+60h],eax
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	4h

l00424AAA:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432BF8h
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],0Dh
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	424B22h

l00424AEB:
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	0h
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	add	eax,210h
	jmp	4259FCh

l00424B22:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432C00h
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],0Eh
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	424B9Ah

l00424B63:
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	0h
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	add	eax,110h
	jmp	4259FCh

l00424B9A:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432C08h
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],0Fh
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	424C12h

l00424BDB:
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	0h
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	add	eax,90h
	jmp	4259FCh

l00424C12:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432C10h
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],10h
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	424C88h

l00424C53:
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	0h
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	add	eax,50h
	jmp	4259FCh

l00424C88:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432C18h
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],11h
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	424CFEh

l00424CC9:
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	0h
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	add	eax,30h
	jmp	4259FCh

l00424CFE:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432C20h
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],12h
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	424D74h

l00424D3F:
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	0h
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	add	eax,34h
	jmp	4259FCh

l00424D74:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432C2Ch
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],13h
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	424DFAh

l00424DB5:
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	add	eax,2Ah
	jmp	4259FCh

l00424DFA:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432C34h
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],14h
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	424E80h

l00424E3B:
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	add	eax,28h
	jmp	4259FCh

l00424E80:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432C3Ch
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],15h
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	424F0Eh

l00424EC1:
	push	0h
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	push	3h
	mov	ecx,edi
	mov	esi,eax
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	shl	eax,6h
	add	eax,18h
	add	eax,esi
	jmp	4259FCh

l00424F0E:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432C48h
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],16h
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	424F9Ch

l00424F4F:
	push	0h
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	push	3h
	mov	ecx,edi
	mov	esi,eax
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	shl	eax,6h
	add	eax,1Ah
	add	eax,esi
	jmp	4259FCh

l00424F9C:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432C54h
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],17h
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	42502Ah

l00424FDD:
	push	0h
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	push	3h
	mov	ecx,edi
	mov	esi,eax
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	shl	eax,6h
	add	eax,32h
	add	eax,esi
	jmp	4259FCh

l0042502A:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432C5Ch
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],18h
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	4250C1h

l0042506B:
	push	0Eh
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	4h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C7E0h
	jmp	4259FCh

l004250C1:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432C68h
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],19h
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	425158h

l00425102:
	push	0Fh
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	4h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C7E0h
	jmp	4259FCh

l00425158:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432C74h
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],1Ah
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	4251EFh

l00425199:
	push	1Dh
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	4h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C7E0h
	jmp	4259FCh

l004251EF:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432C7Ch
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],1Bh
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	425277h

l00425230:
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	add	eax,420h
	jmp	4259FCh

l00425277:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432C88h
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],1Ch
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	4252FFh

l004252B8:
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	add	eax,460h
	jmp	4259FCh

l004252FF:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432C94h
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],1Dh
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	425387h

l00425340:
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	add	eax,4A0h
	jmp	4259FCh

l00425387:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432CA0h
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],1Eh
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	42540Fh

l004253C8:
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	add	eax,4E0h
	jmp	4259FCh

l0042540F:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432CACh
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],1Fh
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	4254A6h

l00425450:
	push	1Fh
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	4h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C7E0h
	jmp	4259FCh

l004254A6:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432CB8h
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],20h
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	42553Dh

l004254E7:
	push	1Eh
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	4h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C7E0h
	jmp	4259FCh

l0042553D:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432C74h
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],21h
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jnz	425199h

l00425582:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432CC4h
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],22h
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	425619h

l004255C3:
	push	1Ch
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	4h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C7E0h
	jmp	4259FCh

l00425619:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432CCCh
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],23h
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	4256B0h

l0042565A:
	push	0Ah
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	4h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C7E0h
	jmp	4259FCh

l004256B0:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432CD4h
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],24h
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	425747h

l004256F1:
	push	0Bh
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	4h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C7E0h
	jmp	4259FCh

l00425747:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432CDCh
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],25h
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	4257DEh

l00425788:
	push	17h
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	4h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C7E0h
	jmp	4259FCh

l004257DE:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432CE4h
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],26h
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	425867h

l0042581F:
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	shl	eax,2h
	mov	ecx,ebx
	push	eax
	call	41C680h
	add	eax,40h
	jmp	4259FCh

l00425867:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432CF0h
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],27h
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	4258F2h

l004258A8:
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	shl	eax,2h
	mov	ecx,ebx
	push	eax
	call	41C680h
	add	eax,0C0h
	jmp	4259FCh

l004258F2:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432CFCh
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],28h
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	425978h

l00425933:
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	shl	eax,2h
	mov	ecx,ebx
	push	eax
	call	41C680h
	jmp	4259FCh

l00425978:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432D08h
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],29h
	mov	esi,esp
	mov	ecx,edi
	push	0h
	call	40F760h
	push	eax
	mov	ecx,esi
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	4259FFh

l004259B9:
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	2h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	1h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	shl	eax,2h
	mov	ecx,ebx
	push	eax
	call	41C680h
	sub	eax,80h

l004259FC:
	add	[ebx+60h],eax

l004259FF:
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	4h
00425A13          CC CC CC CC CC CC CC CC CC CC CC CC CC    .............

;; fn00425A20: 00425A20
;;   Called from:
;;     0041BE8D (in fn0041AEF0)
fn00425A20 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42FFA0h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,18h
	push	ebx
	push	esi
	push	edi
	mov	eax,[43A008h]
	xor	eax,ebp
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	ebx,ecx
	mov	[ebp-10h],ebx
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-18h],esp
	push	6h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432D14h
	mov	byte ptr [ecx],0h
	call	402A70h
	mov	esi,[ebp+8h]
	sub	esp,18h
	mov	dword ptr [ebp-4h],0h
	mov	ecx,esp
	push	dword ptr [esi]
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	425AFAh

l00425A9A:
	mov	edx,1Ah
	call	427210h
	mulsd	xmm0,double ptr [432ED0h]
	call	42D911h
	mov	ecx,[esi]
	mov	[ebp-18h],eax
	lea	edx,[ecx+78h]
	lea	eax,[ecx+18h]
	push	edx
	lea	esi,[ecx+60h]
	mov	[ebp-14h],eax
	lea	edi,[ecx+48h]
	lea	ebx,[ecx+30h]
	call	41C910h
	push	eax
	push	esi
	call	41C910h
	push	eax
	push	edi
	call	41C910h
	push	eax
	push	ebx
	call	41C910h
	push	eax
	push	dword ptr [ebp-14h]
	call	41C910h
	push	eax
	call	41C7E0h
	add	eax,[ebp-18h]
	jmp	42621Ch

l00425AFA:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-18h],esp
	push	4h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432D1Ch
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],1h
	mov	ecx,esp
	push	dword ptr [esi]
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	425B9Bh

l00425B44:
	mov	edx,1Ah
	call	427210h
	mulsd	xmm0,double ptr [432ED0h]
	call	42D911h
	mov	ecx,[esi]
	mov	[ebp-18h],eax
	lea	esi,[ecx+48h]
	push	esi
	lea	edi,[ecx+30h]
	lea	ebx,[ecx+18h]
	call	41C910h
	mov	ecx,1Fh
	sub	ecx,eax
	push	ecx
	push	0h
	push	esi
	call	41C910h
	push	eax
	push	edi
	call	41C910h
	push	eax
	push	ebx
	call	41C910h
	push	eax
	call	41C7E0h
	add	eax,[ebp-18h]
	jmp	42621Ch

l00425B9B:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-18h],esp
	push	4h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432D24h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],2h
	mov	ecx,esp
	push	dword ptr [esi]
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	425C3Ch

l00425BE5:
	mov	edx,1Ah
	call	427210h
	mulsd	xmm0,double ptr [432ED0h]
	call	42D911h
	mov	ecx,[esi]
	push	1Fh
	mov	[ebp-18h],eax
	lea	esi,[ecx+48h]
	push	esi
	lea	edi,[ecx+30h]
	lea	ebx,[ecx+18h]
	call	41C910h
	push	eax
	push	esi
	call	41C910h
	mov	ecx,20h
	sub	ecx,eax
	push	ecx
	push	edi
	call	41C910h
	push	eax
	push	ebx
	call	41C910h
	push	eax
	call	41C7E0h
	add	eax,[ebp-18h]
	jmp	42621Ch

l00425C3C:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-18h],esp
	push	5h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432D2Ch
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],3h
	mov	ecx,esp
	push	dword ptr [esi]
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	425CE6h

l00425C86:
	mov	edx,1Ah
	call	427210h
	mulsd	xmm0,double ptr [432ED8h]
	call	42D911h
	mov	ecx,[esi]
	mov	[ebp-14h],eax
	lea	edx,[ecx+78h]
	lea	eax,[ecx+18h]
	push	edx
	lea	esi,[ecx+60h]
	mov	[ebp-18h],eax
	lea	edi,[ecx+48h]
	lea	ebx,[ecx+30h]
	call	41C910h
	push	eax
	push	esi
	call	41C910h
	push	eax
	push	edi
	call	41C910h
	push	eax
	push	ebx
	call	41C910h
	push	eax
	push	dword ptr [ebp-18h]
	call	41C910h
	push	eax
	call	41C7E0h
	add	eax,[ebp-14h]
	jmp	42621Ch

l00425CE6:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-18h],esp
	push	5h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432D34h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],4h
	mov	ecx,esp
	push	dword ptr [esi]
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	425D76h

l00425D30:
	mov	edx,1Ah
	call	427210h
	mulsd	xmm0,double ptr [432ED8h]
	call	42D911h
	mov	ecx,[esi]
	mov	ebx,eax
	lea	edx,[ecx+48h]
	push	edx
	lea	esi,[ecx+18h]
	lea	edi,[ecx+30h]
	call	41C910h
	push	eax
	push	esi
	call	41C910h
	push	eax
	push	edi
	call	41C910h
	push	eax
	call	41C680h
	add	ebx,3Eh
	jmp	42621Ah

l00425D76:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-18h],esp
	push	6h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432D3Ch
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],5h
	mov	ecx,esp
	push	dword ptr [esi]
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	425E20h

l00425DC0:
	mov	edx,1Ah
	call	427210h
	mulsd	xmm0,double ptr [432EC8h]
	call	42D911h
	mov	ecx,[esi]
	mov	[ebp-14h],eax
	lea	edx,[ecx+78h]
	lea	eax,[ecx+18h]
	push	edx
	lea	esi,[ecx+60h]
	mov	[ebp-18h],eax
	lea	edi,[ecx+48h]
	lea	ebx,[ecx+30h]
	call	41C910h
	push	eax
	push	esi
	call	41C910h
	push	eax
	push	edi
	call	41C910h
	push	eax
	push	ebx
	call	41C910h
	push	eax
	push	dword ptr [ebp-18h]
	call	41C910h
	push	eax
	call	41C7E0h
	add	eax,[ebp-14h]
	jmp	42621Ch

l00425E20:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-18h],esp
	push	3h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432D44h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],6h
	mov	ecx,esp
	push	dword ptr [esi]
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	425EB0h

l00425E6A:
	mov	edx,1Ah
	call	427210h
	mulsd	xmm0,double ptr [432EE0h]
	call	42D911h
	mov	ecx,[esi]
	mov	ebx,eax
	lea	edx,[ecx+48h]
	push	edx
	lea	esi,[ecx+18h]
	lea	edi,[ecx+30h]
	call	41C910h
	push	eax
	push	esi
	call	41C910h
	push	eax
	push	edi
	call	41C910h
	push	eax
	call	41C680h
	add	ebx,36h
	jmp	42621Ah

l00425EB0:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-18h],esp
	push	3h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432D48h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],7h
	mov	ecx,esp
	push	dword ptr [esi]
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	425F40h

l00425EFA:
	mov	edx,1Ah
	call	427210h
	mulsd	xmm0,double ptr [432EE0h]
	call	42D911h
	mov	ecx,[esi]
	mov	ebx,eax
	lea	edx,[ecx+48h]
	push	edx
	lea	esi,[ecx+18h]
	lea	edi,[ecx+30h]
	call	41C910h
	push	eax
	push	esi
	call	41C910h
	push	eax
	push	edi
	call	41C910h
	push	eax
	call	41C680h
	add	ebx,30h
	jmp	42621Ah

l00425F40:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-18h],esp
	push	3h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432D4Ch
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],8h
	mov	ecx,esp
	push	dword ptr [esi]
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	425FD3h

l00425F8A:
	mov	edx,1Ah
	call	427210h
	mulsd	xmm0,double ptr [432EE0h]
	call	42D911h
	mov	ecx,[esi]
	mov	ebx,eax
	lea	edx,[ecx+48h]
	push	edx
	lea	esi,[ecx+18h]
	lea	edi,[ecx+30h]
	call	41C910h
	push	eax
	push	esi
	call	41C910h
	push	eax
	push	edi
	call	41C910h
	push	eax
	call	41C680h
	add	ebx,436h
	jmp	42621Ah

l00425FD3:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-18h],esp
	push	3h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432D50h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],9h
	mov	ecx,esp
	push	dword ptr [esi]
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	426066h

l0042601D:
	mov	edx,1Ah
	call	427210h
	mulsd	xmm0,double ptr [432EE0h]
	call	42D911h
	mov	ecx,[esi]
	mov	ebx,eax
	lea	edx,[ecx+48h]
	push	edx
	lea	esi,[ecx+18h]
	lea	edi,[ecx+30h]
	call	41C910h
	push	eax
	push	esi
	call	41C910h
	push	eax
	push	edi
	call	41C910h
	push	eax
	call	41C680h
	add	ebx,430h
	jmp	42621Ah

l00426066:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-18h],esp
	push	5h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432D54h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],0Ah
	mov	ecx,esp
	push	dword ptr [esi]
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	4260F9h

l004260B0:
	mov	edx,1Ah
	call	427210h
	mulsd	xmm0,double ptr [432EE0h]
	call	42D911h
	mov	ecx,[esi]
	mov	ebx,eax
	lea	edx,[ecx+48h]
	push	edx
	lea	esi,[ecx+18h]
	lea	edi,[ecx+30h]
	call	41C910h
	push	eax
	push	esi
	call	41C910h
	push	eax
	push	edi
	call	41C910h
	push	eax
	call	41C680h
	add	ebx,670h
	jmp	42621Ah

l004260F9:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-18h],esp
	push	4h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432D5Ch
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],0Bh
	mov	ecx,esp
	push	dword ptr [esi]
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	42618Ch

l00426143:
	mov	edx,1Ah
	call	427210h
	mulsd	xmm0,double ptr [432EE0h]
	call	42D911h
	mov	ecx,[esi]
	mov	ebx,eax
	lea	edx,[ecx+48h]
	push	edx
	lea	esi,[ecx+18h]
	lea	edi,[ecx+30h]
	call	41C910h
	push	eax
	push	esi
	call	41C910h
	push	eax
	push	edi
	call	41C910h
	push	eax
	call	41C680h
	add	ebx,634h
	jmp	42621Ah

l0042618C:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-18h],esp
	push	4h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432D64h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],0Ch
	mov	ecx,esp
	push	dword ptr [esi]
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	426225h

l004261D6:
	mov	edx,1Ah
	call	427210h
	mulsd	xmm0,double ptr [432EE0h]
	call	42D911h
	mov	ecx,[esi]
	mov	ebx,eax
	lea	edx,[ecx+48h]
	push	edx
	lea	esi,[ecx+18h]
	lea	edi,[ecx+30h]
	call	41C910h
	push	eax
	push	esi
	call	41C910h
	push	eax
	push	edi
	call	41C910h
	push	eax
	call	41C680h
	add	ebx,630h

l0042621A:
	add	eax,ebx

l0042621C:
	mov	ebx,[ebp-10h]
	mov	esi,[ebp+8h]
	mov	[ebx+60h],eax

l00426225:
	push	1h
	mov	dword ptr [ebp-4h],0Dh
	call	dword ptr [4311A8h]
	mov	edi,eax
	add	esp,4h
	mov	[ebp-18h],edi
	lea	eax,[ebp-1Ch]
	mov	dword ptr [ebp-4h],0Eh
	mov	edx,[esi]
	push	eax
	push	ecx
	lea	ecx,[ebp-24h]
	call	427230h
	add	esp,8h
	mov	esi,[eax]
	mov	eax,[eax+4h]
	mov	[ebp+8h],eax
	mov	dword ptr [ebp-4h],0Fh
	test	edi,edi
	jz	42627Eh

l00426268:
	mov	eax,[edi]
	mov	ecx,edi
	call	dword ptr [eax+8h]
	test	eax,eax
	jz	42627Bh

l00426273:
	mov	edx,[eax]
	mov	ecx,eax
	push	1h
	call	dword ptr [edx]

l0042627B:
	mov	eax,[ebp+8h]

l0042627E:
	cmp	esi,eax
	jz	426285h

l00426282:
	inc	dword ptr [ebx+60h]

l00426285:
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	4h
00426299                            CC CC CC CC CC CC CC          .......

;; fn004262A0: 004262A0
;;   Called from:
;;     0041B1E3 (in fn0041AEF0)
fn004262A0 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	430088h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,1Ch
	push	ebx
	push	esi
	push	edi
	mov	eax,[43A008h]
	xor	eax,ebp
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	ebx,ecx
	mov	[ebp-10h],ebx
	mov	edx,1Ah
	call	427210h
	movsd	double ptr [ebp-20h],xmm0
	mulsd	xmm0,double ptr [432F58h]
	call	42D911h
	sub	esp,18h
	mov	[ebx+60h],eax
	mov	ecx,esp
	mov	[ebp-14h],esp
	push	3h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432D6Ch
	mov	byte ptr [ecx],0h
	call	402A70h
	mov	edi,[ebp+8h]
	sub	esp,18h
	mov	dword ptr [ebp-4h],0h
	mov	ecx,esp
	push	dword ptr [edi]
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	426360h

l00426339:
	mov	eax,[edi]
	lea	ecx,[eax+30h]
	push	ecx
	lea	esi,[eax+18h]
	call	41C910h
	push	eax
	push	0h
	push	esi
	call	41C910h
	push	eax
	call	41C680h
	add	eax,90h
	jmp	426DD7h

l00426360:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-18h],esp
	push	4h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432D70h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],1h
	mov	ecx,esp
	push	dword ptr [edi]
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	4263CFh

l004263AA:
	mov	eax,[edi]
	lea	ecx,[eax+30h]
	push	ecx
	lea	esi,[eax+18h]
	call	41C910h
	push	eax
	push	0h
	push	esi
	call	41C910h
	push	eax
	call	41C680h
	add	eax,50h
	jmp	426DD7h

l004263CF:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-18h],esp
	push	4h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432D78h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],2h
	mov	ecx,esp
	push	dword ptr [edi]
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	426440h

l00426419:
	mov	eax,[edi]
	lea	ecx,[eax+30h]
	push	ecx
	lea	esi,[eax+18h]
	call	41C910h
	push	eax
	push	0h
	push	esi
	call	41C910h
	push	eax
	call	41C680h
	add	eax,210h
	jmp	426DD7h

l00426440:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-18h],esp
	push	5h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432D80h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],3h
	mov	ecx,esp
	push	dword ptr [edi]
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	4264B1h

l0042648A:
	mov	eax,[edi]
	lea	ecx,[eax+30h]
	push	ecx
	lea	esi,[eax+18h]
	call	41C910h
	push	eax
	push	0h
	push	esi
	call	41C910h
	push	eax
	call	41C680h
	add	eax,110h
	jmp	426DD7h

l004264B1:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-18h],esp
	push	4h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432D88h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],4h
	mov	ecx,esp
	push	dword ptr [edi]
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	426520h

l004264FB:
	mov	eax,[edi]
	lea	ecx,[eax+30h]
	push	ecx
	lea	esi,[eax+18h]
	call	41C910h
	push	eax
	push	0h
	push	esi
	call	41C910h
	push	eax
	call	41C680h
	add	eax,18h
	jmp	426DD7h

l00426520:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-18h],esp
	push	6h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432D90h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],5h
	mov	ecx,esp
	push	dword ptr [edi]
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	426591h

l0042656A:
	mov	eax,[edi]
	lea	ecx,[eax+30h]
	push	ecx
	lea	esi,[eax+18h]
	call	41C910h
	push	eax
	push	0h
	push	esi
	call	41C910h
	push	eax
	call	41C680h
	add	eax,65Eh
	jmp	426DD7h

l00426591:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-18h],esp
	push	5h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432D98h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],6h
	mov	ecx,esp
	push	dword ptr [edi]
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	426602h

l004265DB:
	mov	eax,[edi]
	lea	ecx,[eax+30h]
	push	ecx
	lea	esi,[eax+18h]
	call	41C910h
	push	eax
	push	0h
	push	esi
	call	41C910h
	push	eax
	call	41C680h
	add	eax,65Ch
	jmp	426DD7h

l00426602:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-18h],esp
	push	5h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432DA0h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],7h
	mov	ecx,esp
	push	dword ptr [edi]
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	426673h

l0042664C:
	mov	eax,[edi]
	lea	ecx,[eax+30h]
	push	ecx
	lea	esi,[eax+18h]
	call	41C910h
	push	eax
	push	0h
	push	esi
	call	41C910h
	push	eax
	call	41C680h
	add	eax,69Ch
	jmp	426DD7h

l00426673:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-18h],esp
	push	6h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432DA8h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],8h
	mov	ecx,esp
	push	dword ptr [edi]
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	4266E2h

l004266BD:
	mov	eax,[edi]
	lea	ecx,[eax+30h]
	push	ecx
	lea	esi,[eax+18h]
	call	41C910h
	push	eax
	push	0h
	push	esi
	call	41C910h
	push	eax
	call	41C680h
	add	eax,1Eh
	jmp	426DD7h

l004266E2:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-18h],esp
	push	5h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432DB0h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],9h
	mov	ecx,esp
	push	dword ptr [edi]
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	426751h

l0042672C:
	mov	eax,[edi]
	lea	ecx,[eax+30h]
	push	ecx
	lea	esi,[eax+18h]
	call	41C910h
	push	eax
	push	0h
	push	esi
	call	41C910h
	push	eax
	call	41C680h
	add	eax,1Ch
	jmp	426DD7h

l00426751:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-18h],esp
	push	5h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432DB8h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],0Ah
	mov	ecx,esp
	push	dword ptr [edi]
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	4267CBh

l0042679B:
	mov	eax,[edi]
	lea	ecx,[eax+48h]
	push	ecx
	lea	esi,[eax+30h]
	lea	edi,[eax+18h]
	call	41C910h
	push	eax
	push	esi
	call	41C910h
	push	eax
	push	edi
	call	41C910h
	shl	eax,2h
	push	eax
	call	41C680h
	add	eax,40h
	jmp	426DD4h

l004267CB:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-18h],esp
	push	5h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432DC0h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],0Bh
	mov	ecx,esp
	push	dword ptr [edi]
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	mov	eax,[edi]
	jz	426842h

l00426817:
	lea	ecx,[eax+48h]
	push	ecx
	lea	esi,[eax+30h]
	lea	edi,[eax+18h]
	call	41C910h
	push	eax
	push	esi
	call	41C910h
	push	eax
	push	edi
	call	41C910h
	shl	eax,2h
	push	eax
	call	41C680h
	jmp	426DD4h

l00426842:
	mov	ecx,[eax+10h]
	lea	edx,[ecx-2h]
	cmp	ecx,edx
	jbe	426E4Eh

l00426850:
	mov	esi,[eax+14h]
	mov	[ebp-14h],eax
	cmp	esi,10h
	jc	426863h

l0042685B:
	mov	ebx,[eax]
	mov	[ebp-14h],ebx
	mov	ebx,[ebp-10h]

l00426863:
	mov	edi,[ebp-14h]
	cmp	byte ptr [edi+edx],73h
	mov	edi,[ebp+8h]
	jz	4268CFh

l0042686F:
	cmp	ecx,edx
	jbe	426E53h

l00426877:
	mov	[ebp-14h],eax
	cmp	esi,10h
	jc	426887h

l0042687F:
	mov	edi,[eax]
	mov	[ebp-14h],edi
	mov	edi,[ebp+8h]

l00426887:
	mov	ebx,[ebp-14h]
	cmp	byte ptr [ebx+edx],53h
	mov	ebx,[ebp-10h]
	jz	4268CFh

l00426893:
	lea	edx,[ecx-1h]
	cmp	ecx,edx
	jbe	426E58h

l0042689E:
	mov	[ebp-14h],eax
	cmp	esi,10h
	jc	4268AEh

l004268A6:
	mov	edi,[eax]
	mov	[ebp-14h],edi
	mov	edi,[ebp+8h]

l004268AE:
	mov	ecx,[ebp-14h]
	cmp	byte ptr [ecx+edx],73h
	mov	ecx,[eax+10h]
	jz	4268CFh

l004268BA:
	cmp	ecx,edx
	jbe	426E5Dh

l004268C2:
	cmp	esi,10h
	jc	4268C9h

l004268C7:
	mov	eax,[eax]

l004268C9:
	cmp	byte ptr [eax+edx],53h
	jnz	4268E4h

l004268CF:
	movsd	xmm0,double ptr [ebp-20h]
	mulsd	xmm0,double ptr [432F48h]
	call	42D911h
	mov	[ebx+60h],eax

l004268E4:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-18h],esp
	push	4h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432DC8h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],0Ch
	mov	ecx,esp
	push	dword ptr [edi]
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	42695Bh

l0042692E:
	mov	eax,[edi]
	lea	ecx,[eax+48h]
	push	ecx
	lea	esi,[eax+30h]
	lea	edi,[eax+18h]
	call	41C910h
	push	eax
	push	esi
	call	41C910h
	push	eax
	push	edi
	call	41C910h
	push	eax
	call	41C680h
	add	eax,2Ah
	jmp	426DD4h

l0042695B:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-18h],esp
	push	4h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432DD0h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],0Dh
	mov	ecx,esp
	push	dword ptr [edi]
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	4269D2h

l004269A5:
	mov	eax,[edi]
	lea	ecx,[eax+48h]
	push	ecx
	lea	esi,[eax+30h]
	lea	edi,[eax+18h]
	call	41C910h
	push	eax
	push	esi
	call	41C910h
	push	eax
	push	edi
	call	41C910h
	push	eax
	call	41C680h
	add	eax,28h
	jmp	426DD4h

l004269D2:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-18h],esp
	push	4h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432DD8h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],0Eh
	mov	ecx,esp
	push	dword ptr [edi]
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	426A51h

l00426A1C:
	mov	eax,[edi]
	push	0h
	lea	ecx,[eax+30h]
	push	ecx
	lea	esi,[eax+18h]
	lea	edi,[eax+48h]
	call	41C910h
	push	eax
	push	esi
	call	41C910h
	push	eax
	call	41C680h
	push	edi
	mov	esi,eax
	call	41C910h
	shl	eax,6h
	add	eax,32h
	add	eax,esi
	jmp	426DD4h

l00426A51:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-18h],esp
	push	4h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432DE0h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],0Fh
	mov	ecx,esp
	push	dword ptr [edi]
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	426AC8h

l00426A9B:
	mov	eax,[edi]
	lea	ecx,[eax+48h]
	push	ecx
	lea	esi,[eax+30h]
	lea	edi,[eax+18h]
	call	41C910h
	push	eax
	push	esi
	call	41C910h
	push	eax
	push	edi
	call	41C910h
	push	eax
	call	41C680h
	add	eax,24h
	jmp	426DD4h

l00426AC8:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-18h],esp
	push	5h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432DE8h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],10h
	mov	ecx,esp
	push	dword ptr [edi]
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	426B37h

l00426B12:
	mov	eax,[edi]
	lea	ecx,[eax+30h]
	push	ecx
	lea	esi,[eax+18h]
	call	41C910h
	push	eax
	push	0h
	push	esi
	call	41C910h
	push	eax
	call	41C680h
	add	eax,2Ch
	jmp	426DD7h

l00426B37:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-18h],esp
	push	4h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432DF0h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],11h
	mov	ecx,esp
	push	dword ptr [edi]
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	426BA6h

l00426B81:
	mov	eax,[edi]
	lea	ecx,[eax+30h]
	push	ecx
	lea	esi,[eax+18h]
	call	41C910h
	push	eax
	push	0h
	push	esi
	call	41C910h
	push	eax
	call	41C680h
	add	eax,30h
	jmp	426DD7h

l00426BA6:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-18h],esp
	push	7h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432DF8h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],12h
	mov	ecx,esp
	push	dword ptr [edi]
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	426C15h

l00426BF0:
	mov	eax,[edi]
	lea	ecx,[eax+30h]
	push	ecx
	lea	esi,[eax+18h]
	call	41C910h
	push	eax
	push	0h
	push	esi
	call	41C910h
	push	eax
	call	41C680h
	add	eax,34h
	jmp	426DD7h

l00426C15:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-18h],esp
	push	4h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432E00h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],13h
	mov	ecx,esp
	push	dword ptr [edi]
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	426C66h

l00426C5F:
	push	17h
	jmp	426DA2h

l00426C66:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-18h],esp
	push	5h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432E08h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],14h
	mov	ecx,esp
	push	dword ptr [edi]
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	426CB7h

l00426CB0:
	push	1Dh
	jmp	426DA2h

l00426CB7:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-18h],esp
	push	5h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432E10h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],15h
	mov	ecx,esp
	push	dword ptr [edi]
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	426D08h

l00426D01:
	push	1Ch
	jmp	426DA2h

l00426D08:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-18h],esp
	push	6h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432E18h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],16h
	mov	ecx,esp
	push	dword ptr [edi]
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	426D56h

l00426D52:
	push	1Fh
	jmp	426DA2h

l00426D56:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-18h],esp
	push	6h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432E20h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],17h
	mov	ecx,esp
	push	dword ptr [edi]
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	426DDAh

l00426DA0:
	push	1Eh

l00426DA2:
	mov	eax,[edi]
	lea	ecx,[eax+48h]
	push	ecx
	lea	esi,[eax+60h]
	lea	edi,[eax+18h]
	lea	ebx,[eax+30h]
	call	41C910h
	push	eax
	push	esi
	call	41C910h
	push	eax
	push	edi
	call	41C910h
	push	eax
	push	ebx
	call	41C910h
	push	eax
	call	41C7E0h
	mov	ebx,[ebp-10h]

l00426DD4:
	mov	edi,[ebp+8h]

l00426DD7:
	add	[ebx+60h],eax

l00426DDA:
	push	1h
	mov	dword ptr [ebp-4h],18h
	call	dword ptr [4311A8h]
	mov	esi,eax
	add	esp,4h
	mov	[ebp-1Ch],esi
	lea	eax,[ebp-20h]
	mov	dword ptr [ebp-4h],19h
	mov	edx,[edi]
	push	eax
	push	ecx
	lea	ecx,[ebp-28h]
	call	427230h
	add	esp,8h
	mov	edi,[eax]
	mov	eax,[eax+4h]
	mov	[ebp+8h],eax
	mov	dword ptr [ebp-4h],1Ah
	test	esi,esi
	jz	426E33h

l00426E1D:
	mov	eax,[esi]
	mov	ecx,esi
	call	dword ptr [eax+8h]
	test	eax,eax
	jz	426E30h

l00426E28:
	mov	edx,[eax]
	mov	ecx,eax
	push	1h
	call	dword ptr [edx]

l00426E30:
	mov	eax,[ebp+8h]

l00426E33:
	cmp	edi,eax
	jz	426E3Ah

l00426E37:
	inc	dword ptr [ebx+60h]

l00426E3A:
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	4h

l00426E4E:
	call	4113B0h

l00426E53:
	call	4113B0h

l00426E58:
	call	4113B0h

l00426E5D:
	call	4113B0h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h

;; fn00426E70: 00426E70
;;   Called from:
;;     0041C08D (in fn0041AEF0)
;;     00426E6F (in fn004262A0)
fn00426E70 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	4300D0h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,18h
	mov	eax,[43A008h]
	xor	eax,ebp
	mov	[ebp-10h],eax
	push	ebx
	push	esi
	push	edi
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	ebx,ecx
	mov	edi,[ebp+8h]
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-20h],esp
	push	3h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432E28h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],0h
	mov	ecx,esp
	push	dword ptr [edi]
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	426F81h

l00426EEE:
	mov	edx,1Ah
	call	427210h
	addsd	xmm0,xmm0
	call	42D911h
	mov	esi,[edi]
	mov	[ebp-18h],eax
	lea	eax,[esi+30h]
	mov	[ebp-1Ch],eax
	call	dword ptr [43129Ch]
	add	esi,48h
	mov	[ebp-24h],eax
	cmp	dword ptr [esi+14h],10h
	jc	426F20h

l00426F1E:
	mov	esi,[esi]

l00426F20:
	mov	dword ptr [eax],0h
	lea	eax,[ebp-14h]
	push	0h
	push	eax
	push	esi
	call	dword ptr [431200h]
	add	esp,0Ch
	mov	[ebp-20h],eax
	cmp	esi,[ebp-14h]
	jnz	426F49h

l00426F3E:
	push	431878h
	call	dword ptr [431134h]

l00426F49:
	mov	eax,[ebp-24h]
	cmp	dword ptr [eax],22h
	jz	426F76h

l00426F51:
	mov	esi,[edi]
	push	dword ptr [ebp-1Ch]
	add	esi,18h
	call	41C910h
	push	eax
	push	dword ptr [ebp-20h]
	push	esi
	call	41C910h
	push	eax
	call	41C740h
	add	eax,[ebp-18h]
	jmp	42717Eh

l00426F76:
	push	431890h
	call	dword ptr [43119Ch]

l00426F81:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-20h],esp
	push	3h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432E2Ch
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],1h
	mov	ecx,esp
	push	dword ptr [edi]
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	42705Fh

l00426FCF:
	mov	edx,1Ah
	call	427210h
	mulsd	xmm0,double ptr [432E68h]
	call	42D911h
	mov	esi,[edi]
	mov	[ebp-14h],eax
	lea	eax,[esi+30h]
	mov	[ebp-1Ch],eax
	call	dword ptr [43129Ch]
	add	esi,48h
	mov	[ebp-20h],eax
	cmp	dword ptr [esi+14h],10h
	jc	427005h

l00427003:
	mov	esi,[esi]

l00427005:
	mov	dword ptr [eax],0h
	lea	eax,[ebp-18h]
	push	0h
	push	eax
	push	esi
	call	dword ptr [431200h]
	add	esp,0Ch
	mov	[ebp-24h],eax
	cmp	esi,[ebp-18h]
	jnz	42702Eh

l00427023:
	push	431878h
	call	dword ptr [431134h]

l0042702E:
	mov	eax,[ebp-20h]
	cmp	dword ptr [eax],22h
	jz	426F76h

l0042703A:
	mov	esi,[edi]
	push	dword ptr [ebp-1Ch]
	add	esi,18h
	call	41C910h
	push	eax
	push	dword ptr [ebp-24h]
	push	esi
	call	41C910h
	push	eax
	call	41C740h
	add	eax,[ebp-14h]
	jmp	42717Eh

l0042705F:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-20h],esp
	push	2h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432E30h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],2h
	mov	ecx,esp
	push	dword ptr [edi]
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	4270F1h

l004270A9:
	mov	esi,[edi]
	lea	eax,[esi+48h]
	push	eax
	call	41C910h
	push	eax
	lea	eax,[esi+30h]
	push	eax
	call	41C910h
	push	eax
	lea	eax,[esi+18h]
	push	eax
	call	41C910h
	push	eax
	call	41C680h
	mov	edx,1Ah
	mov	esi,eax
	call	427210h
	mulsd	xmm0,double ptr [432EE0h]
	call	42D911h
	add	eax,88h
	jmp	42717Ch

l004270F1:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-20h],esp
	push	2h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432E34h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],3h
	mov	ecx,esp
	push	dword ptr [edi]
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	427181h

l0042713B:
	mov	esi,[edi]
	lea	eax,[esi+48h]
	push	eax
	call	41C910h
	push	eax
	lea	eax,[esi+30h]
	push	eax
	call	41C910h
	push	eax
	lea	eax,[esi+18h]
	push	eax
	call	41C910h
	push	eax
	call	41C680h
	mov	edx,1Ah
	mov	esi,eax
	call	427210h
	mulsd	xmm0,double ptr [432EE0h]
	call	42D911h
	add	eax,8h

l0042717C:
	add	eax,esi

l0042717E:
	mov	[ebx+60h],eax

l00427181:
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	ecx,[ebp-10h]
	xor	ecx,ebp
	call	427500h
	mov	esp,ebp
	pop	ebp
	ret	4h
0042719F                                              CC                .

l004271A0:
	push	ebp
	mov	ebp,esp
	push	ebx
	push	esi
	push	edi
	mov	edi,ecx
	mov	eax,[edi-60h]
	lea	ebx,[edi-60h]
	lea	ecx,[edi-50h]
	mov	eax,[eax+4h]
	mov	dword ptr [eax+edi-60h],432E44h
	mov	eax,[ebx]
	mov	edx,[eax+4h]
	lea	eax,[edx-60h]
	mov	[edx+edi-64h],eax
	mov	dword ptr [edi-50h],432440h
	call	4110B0h
	lea	ecx,[edi-50h]
	call	dword ptr [4310ACh]
	lea	ecx,[edi-48h]
	call	dword ptr [4310D4h]
	mov	ecx,edi
	call	dword ptr [4310A8h]
	test	byte ptr [ebp+8h],1h
	jz	427202h

l004271F4:
	push	0A8h
	push	ebx
	call	42763Fh
	add	esp,8h

l00427202:
	pop	edi
	pop	esi
	mov	eax,ebx
	pop	ebx
	pop	ebp
	ret	4h
0042720B                                  CC CC CC CC CC            .....

;; fn00427210: 00427210
;;   Called from:
;;     0041AECC (in fn0041AE90)
;;     0041C5C8 (in fn0041C5C0)
;;     0041CB70 (in fn0041CB12)
;;     0041CC1F (in fn0041CB12)
;;     0041CC9C (in fn0041CC60)
;;     0041D4B9 (in fn0041CC60)
;;     0041D56D (in fn0041CC60)
;;     0041D56D (in fn0041D540)
;;     0041DB86 (in fn0041DAF0)
;;     0041DC0B (in fn0041DAF0)
;;     0041DC5B (in fn0041DAF0)
;;     0041DCE6 (in fn0041DAF0)
;;     0041DD4A (in fn0041DAF0)
;;     0041DD66 (in fn0041DAF0)
;;     0041DDFC (in fn0041DAF0)
;;     0041DE35 (in fn0041DAF0)
;;     0041DE7F (in fn0041DAF0)
;;     0041DEFC (in fn0041DAF0)
;;     0041DF85 (in fn0041DAF0)
;;     0041DFBE (in fn0041DAF0)
;;     0041E04D (in fn0041DAF0)
;;     0041E0B1 (in fn0041DAF0)
;;     0041E133 (in fn0041DAF0)
;;     0041E1BC (in fn0041DAF0)
;;     0041E201 (in fn0041DAF0)
;;     0041E290 (in fn0041DAF0)
;;     0041E2F4 (in fn0041DAF0)
;;     0041E310 (in fn0041DAF0)
;;     0041E3A6 (in fn0041DAF0)
;;     0041E3DF (in fn0041DAF0)
;;     0041E429 (in fn0041DAF0)
;;     0041E4A6 (in fn0041DAF0)
;;     0041E52F (in fn0041DAF0)
;;     0041E568 (in fn0041DAF0)
;;     0041E5F7 (in fn0041DAF0)
;;     0041E65B (in fn0041DAF0)
;;     0041E6FF (in fn0041DAF0)
;;     0041E717 (in fn0041DAF0)
;;     0041E775 (in fn0041DAF0)
;;     0041E7B0 (in fn0041DAF0)
;;     0041E7C8 (in fn0041DAF0)
;;     0041E826 (in fn0041DAF0)
;;     0041E865 (in fn0041DAF0)
;;     0041E8F0 (in fn0041DAF0)
;;     0041E908 (in fn0041DAF0)
;;     0041E966 (in fn0041DAF0)
;;     0041E9A5 (in fn0041DAF0)
;;     0041EA41 (in fn0041DAF0)
;;     0041EA59 (in fn0041DAF0)
;;     0041EAB4 (in fn0041DAF0)
;;     0041EAEF (in fn0041DAF0)
;;     0041EB07 (in fn0041DAF0)
;;     0041EB62 (in fn0041DAF0)
;;     0041EBA1 (in fn0041DAF0)
;;     0041EC2C (in fn0041DAF0)
;;     0041EC44 (in fn0041DAF0)
;;     0041EC9F (in fn0041DAF0)
;;     0041ECDE (in fn0041DAF0)
;;     0041EDB8 (in fn0041ED20)
;;     0041EE22 (in fn0041ED20)
;;     0041EED8 (in fn0041EE50)
;;     0041EF86 (in fn0041EE50)
;;     0041F034 (in fn0041EE50)
;;     0041F0E2 (in fn0041EE50)
;;     0041F18E (in fn0041EE50)
;;     0041F23C (in fn0041EE50)
;;     0041F2EA (in fn0041EE50)
;;     00420566 (in fn004204C0)
;;     004205F8 (in fn004204C0)
;;     0042068A (in fn004204C0)
;;     0042071C (in fn004204C0)
;;     004207AE (in fn004204C0)
;;     00420840 (in fn004204C0)
;;     004208D2 (in fn004204C0)
;;     00420964 (in fn004204C0)
;;     004209F6 (in fn004204C0)
;;     00420A88 (in fn004204C0)
;;     00420B1A (in fn004204C0)
;;     00420BAC (in fn004204C0)
;;     00420C1B (in fn004204C0)
;;     00420D00 (in fn004204C0)
;;     00420DDA (in fn004204C0)
;;     00420E61 (in fn004204C0)
;;     00420EC2 (in fn004204C0)
;;     00420F27 (in fn004204C0)
;;     00421028 (in fn004204C0)
;;     004210BA (in fn004204C0)
;;     00421125 (in fn004204C0)
;;     00421186 (in fn004204C0)
;;     004211E7 (in fn004204C0)
;;     00421248 (in fn004204C0)
;;     004212A9 (in fn004204C0)
;;     0042130E (in fn004204C0)
;;     004213E5 (in fn004204C0)
;;     004214B6 (in fn004204C0)
;;     00421548 (in fn004204C0)
;;     004215DA (in fn004204C0)
;;     004216AB (in fn00421620)
;;     00421763 (in fn00421620)
;;     00421820 (in fn00421620)
;;     004218C6 (in fn00421620)
;;     00421936 (in fn00421620)
;;     004219D9 (in fn00421620)
;;     00421A49 (in fn00421620)
;;     00421AB9 (in fn00421620)
;;     004237D6 (in fn004237A0)
;;     00423FBD (in fn004237A0)
;;     00423FFC (in fn004237A0)
;;     0042408B (in fn004237A0)
;;     004240A3 (in fn004237A0)
;;     004241A2 (in fn00424170)
;;     00424442 (in fn00424170)
;;     004244A0 (in fn00424170)
;;     004244DB (in fn00424170)
;;     0042452E (in fn00424170)
;;     0042462E (in fn00424170)
;;     00424696 (in fn00424170)
;;     004246E3 (in fn00424170)
;;     004247DA (in fn00424170)
;;     00424842 (in fn00424170)
;;     0042488F (in fn00424170)
;;     00424986 (in fn00424170)
;;     004249EE (in fn00424170)
;;     00424A3B (in fn00424170)
;;     00425A9F (in fn00425A20)
;;     00425B49 (in fn00425A20)
;;     00425BEA (in fn00425A20)
;;     00425C8B (in fn00425A20)
;;     00425D35 (in fn00425A20)
;;     00425DC5 (in fn00425A20)
;;     00425E6F (in fn00425A20)
;;     00425EFF (in fn00425A20)
;;     00425F8F (in fn00425A20)
;;     00426022 (in fn00425A20)
;;     004260B5 (in fn00425A20)
;;     00426148 (in fn00425A20)
;;     004261DB (in fn00425A20)
;;     004262D2 (in fn004262A0)
;;     00426EF3 (in fn00426E70)
;;     00426FD4 (in fn00426E70)
;;     004270D5 (in fn00426E70)
;;     00427167 (in fn00426E70)
fn00427210 proc
	push	ebp
	mov	ebp,esp
	and	esp,0F8h
	movsd	xmm0,double ptr [432E60h]
	movd	xmm1,edx
	cvtdq2pd	xmm1,xmm1
	call	42DAADh
	mov	esp,ebp
	pop	ebp
	ret
0042722F                                              CC                .

;; fn00427230: 00427230
;;   Called from:
;;     00424113 (in fn004237A0)
;;     0042624D (in fn00425A20)
;;     00426E02 (in fn004262A0)
fn00427230 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	430108h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,24h
	push	ebx
	push	esi
	push	edi
	mov	eax,[43A008h]
	xor	eax,ebp
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	[ebp-14h],edx
	mov	ebx,ecx
	mov	[ebp-18h],ebx
	mov	eax,[ebp+0Ch]
	mov	dword ptr [ebp-4h],0h
	mov	esi,[eax+4h]
	mov	ecx,esi
	mov	eax,[esi]
	call	dword ptr [eax+4h]
	mov	dword ptr [ebp-4h],1h
	mov	ecx,esi
	mov	eax,[esi]
	call	dword ptr [eax+4h]
	mov	dword ptr [ebp-28h],432BB0h
	mov	dword ptr [ebp-24h],432BB1h
	mov	dword ptr [ebp-4h],2h
	mov	ecx,esi
	mov	[ebp-1Ch],esi
	mov	eax,[esi]
	call	dword ptr [eax+4h]
	mov	dword ptr [ebp-4h],3h
	mov	ecx,esi
	mov	eax,[esi]
	call	dword ptr [eax+8h]
	mov	ecx,eax
	test	ecx,ecx
	jz	4272BBh

l004272B5:
	mov	eax,[ecx]
	push	1h
	call	dword ptr [eax]

l004272BB:
	mov	dword ptr [ebp-4h],4h
	test	esi,esi
	jz	4272D9h

l004272C6:
	mov	eax,[esi]
	mov	ecx,esi
	call	dword ptr [eax+8h]
	mov	ecx,eax
	test	ecx,ecx
	jz	4272D9h

l004272D3:
	mov	eax,[ecx]
	push	1h
	call	dword ptr [eax]

l004272D9:
	mov	dword ptr [ebp-4h],5h
	mov	eax,[ebp-14h]
	mov	edx,eax
	mov	esi,[eax+14h]
	cmp	esi,10h
	jc	4272EFh

l004272ED:
	mov	edx,[eax]

l004272EF:
	mov	edi,[eax+10h]
	add	edi,edx
	cmp	esi,10h
	jc	4272FEh

l004272F9:
	mov	eax,[eax]
	mov	[ebp-14h],eax

l004272FE:
	cmp	eax,edi
	jz	427377h

l00427302:
	mov	ecx,[ebp-24h]
	mov	edx,[ebp-28h]

l00427308:
	cmp	edx,ecx
	jz	427374h

l0042730C:
	mov	esi,eax
	mov	ebx,edx
	cmp	eax,edi
	jz	427368h

l00427314:
	cmp	ebx,ecx
	jz	4273AFh

l0042731C:
	mov	al,[esi]
	lea	ecx,[ebp-20h]
	mov	[ebp-2Ch],al
	push	dword ptr [ebp-2Ch]
	call	402DD0h
	mov	ecx,eax
	call	dword ptr [431140h]
	mov	[ebp-0Dh],al
	lea	ecx,[ebp-20h]
	mov	al,[ebx]
	mov	[ebp-30h],al
	push	dword ptr [ebp-30h]
	call	402DD0h
	mov	ecx,eax
	call	dword ptr [431140h]
	cmp	[ebp-0Dh],al
	jnz	42735Fh

l00427354:
	inc	esi
	inc	ebx
	cmp	esi,edi
	jz	42735Fh

l0042735A:
	mov	ecx,[ebp-24h]
	jmp	427314h

l0042735F:
	mov	ecx,[ebp-24h]
	mov	edx,[ebp-28h]
	mov	eax,[ebp-14h]

l00427368:
	cmp	ebx,ecx
	jz	4273B2h

l0042736C:
	inc	eax
	mov	[ebp-14h],eax
	cmp	eax,edi
	jnz	427308h

l00427374:
	mov	ebx,[ebp-18h]

l00427377:
	mov	[ebx+4h],edi
	mov	[ebx],edi

l0042737C:
	mov	dword ptr [ebp-4h],6h
	mov	ecx,[ebp-1Ch]
	test	ecx,ecx
	jz	42739Bh

l0042738A:
	mov	eax,[ecx]
	call	dword ptr [eax+8h]
	test	eax,eax
	jz	42739Bh

l00427393:
	mov	edx,[eax]
	mov	ecx,eax
	push	1h
	call	dword ptr [edx]

l0042739B:
	mov	eax,ebx
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret

l004273AF:
	mov	eax,[ebp-14h]

l004273B2:
	mov	ebx,[ebp-18h]
	mov	[ebx],eax
	mov	[ebx+4h],esi
	jmp	42737Ch
004273BC                                     CC CC CC CC             ....
004273C0 55 8B EC 6A FF 68 C0 DC 42 00 64 A1 00 00 00 00 U..j.h..B.d.....
004273D0 50 A1 08 A0 43 00 33 C5 50 8D 45 F4 64 A3 00 00 P...C.3.P.E.d...
004273E0 00 00 C7 45 FC 00 00 00 00 8B 49 0C 85 C9 74 11 ...E......I...t.
004273F0 8B 01 FF 50 08 85 C0 74 08 8B 10 8B C8 6A 01 FF ...P...t.....j..
00427400 12 8B 4D F4 64 89 0D 00 00 00 00 59 8B E5 5D C3 ..M.d......Y..].

;; fn00427410: 00427410
fn00427410 proc
	sub	ecx,[ecx-4h]
	jmp	4271A0h
00427418                         55 8B EC 6A FF 68 70 DD         U..j.hp.
00427420 42 00 64 A1 00 00 00 00 50 56 57 A1 08 A0 43 00 B.d.....PVW...C.
00427430 33 C5 50 8D 45 F4 64 A3 00 00 00 00 8B 79 04 8B 3.P.E.d......y..
00427440 07 8B 70 08 8B CE FF 15 E0 12 43 00 8B CF FF D6 ..p.......C.....
00427450 8B F8 85 FF 74 12 8B 0F 6A 01 8B 31 8B CE FF 15 ....t...j..1....
00427460 E0 12 43 00 8B CF FF D6 8B 4D F4 64 89 0D 00 00 ..C......M.d....
00427470 00 00 59 5F 5E C9 C3 56 EB 18 8B 06 8B CE A3 14 ..Y_^..V........
00427480 AD 43 00 E8 90 FF FF FF 6A 08 56 E8 AF 01 00 00 .C......j.V.....
00427490 59 59 8B 35 14 AD 43 00 85 F6 75 DE 5E C3       YY.5..C...u.^.  

;; fn0042749E: 0042749E
;;   Called from:
;;     00402E7B (in fn00402DD0)
;;     00412F7B (in fn00412ED0)
;;     0042B0F5 (in fn0042B030)
fn0042749E proc
	push	ebp
	mov	ebp,esp
	push	ecx
	push	8h
	call	427511h
	mov	[ebp-4h],eax
	pop	ecx
	test	eax,eax
	jz	4274C1h

l004274B1:
	mov	ecx,[43AD14h]
	mov	[eax],ecx
	mov	ecx,[ebp+8h]
	mov	[eax+4h],ecx
	jmp	4274C3h

l004274C1:
	xor	eax,eax

l004274C3:
	mov	[43AD14h],eax
	leave
	ret
004274CA                               FF 25 B0 10 43 00           .%..C.
004274D0 FF 25 B4 10 43 00                               .%..C.          
004274D6                   FF 25 B8 10 43 00                   .%..C.    
004274DC                                     FF 25 BC 10             .%..
004274E0 43 00                                           C.              
004274E2       FF 25 C0 10 43 00                           .%..C.        
004274E8                         FF 25 C4 10 43 00               .%..C.  
004274EE                                           FF 25               .%
004274F0 C8 10 43 00                                     ..C.            
004274F4             FF 25 CC 10 43 00                       .%..C.      
004274FA                               FF 25 D0 10 43 00           .%..C.

;; fn00427500: 00427500
;;   Called from:
;;     00402EB1 (in fn00402DD0)
;;     00403C92 (in fn00403C30)
;;     00403D02 (in fn00403CA0)
;;     00403E1F (in fn00403D50)
;;     00404C55 (in fn00404080)
;;     00405D31 (in fn00404FB0)
;;     004084B5 (in fn00407D10)
;;     00408D15 (in fn00408570)
;;     004099F1 (in fn00408FF1)
;;     00409E23 (in fn00409BCD)
;;     0040A827 (in fn00409E70)
;;     0040AE2F (in fn0040AA30)
;;     0040DD0E (in fn0040BE00)
;;     0040E970 (in fn0040E440)
;;     0040E984 (in fn0040E440)
;;     0040ED7A (in fn0040EB40)
;;     0040FCFF (in fn0040FC30)
;;     0040FD13 (in fn0040FC30)
;;     0040FDF5 (in fn0040FD20)
;;     0040FF12 (in fn0040FE00)
;;     00410355 (in fn00410120)
;;     00410475 (in fn00410450)
;;     004104A5 (in fn00410450)
;;     0041053B (in fn00410450)
;;     0041057A (in fn00410450)
;;     00410590 (in fn00410450)
;;     00410E91 (in fn00410E30)
;;     00410ECA (in fn00410E30)
;;     00410EDC (in fn00410E30)
;;     00411096 (in fn00410F60)
;;     00412215 (in fn00412170)
;;     00412DAA (in fn00412B52)
;;     00412EBA (in fn00412E08)
;;     00412FB1 (in fn00412ED0)
;;     00413A27 (in fn00413980)
;;     0041408D (in fn00413B30)
;;     004143B3 (in fn00414126)
;;     004150EB (in fn0041503B)
;;     004150EB (in fn00414FE0)
;;     004155E2 (in fn004154B0)
;;     00416B89 (in fn004169B0)
;;     004170AC (in fn00416DA0)
;;     004173DC (in fn004170C0)
;;     00417E40 (in fn00417731)
;;     00417EC3 (in fn00417E50)
;;     00417EF0 (in fn00417E50)
;;     00417F39 (in fn00417E50)
;;     0041808C (in fn00417F50)
;;     004188B3 (in fn00418780)
;;     0041960F (in fn00419550)
;;     00419625 (in fn00419550)
;;     00419CC1 (in fn00419910)
;;     0041A336 (in fn0041A150)
;;     0041A6D3 (in fn0041A350)
;;     0041AE45 (in fn0041A760)
;;     0041C172 (in fn0041AEF0)
;;     0041C59D (in fn0041C3F6)
;;     0041CA68 (in fn0041C910)
;;     0041D520 (in fn0041CC60)
;;     0041ED08 (in fn0041DAF0)
;;     00421609 (in fn004204C0)
;;     00427194 (in fn00426E70)
;;     00428CD3 (in fn00428BE0)
;;     00428E72 (in fn00428DE0)
;;     00428F30 (in fn00428DE0)
;;     0042A442 (in fn0042A390)
;;     0042A4F9 (in fn0042A450)
;;     0042A6F9 (in fn0042A600)
;;     0042A81E (in fn0042A710)
;;     0042AD0F (in fn0042AB60)
;;     0042B30F (in fn0042B210)
;;     0042B818 (in fn0042B630)
;;     0042B9DE (in fn0042B830)
;;     0042C1FF (in fn0042C020)
;;     0042CF49 (in fn0042CD80)
fn00427500 proc
	cmp	ecx,[43A008h]
	repne jnz	42750Bh

l00427509:
	repne ret

l0042750B:
	repne jmp	427BE0h

;; fn00427511: 00427511
;;   Called from:
;;     00401F1B (in fn00401AC0)
;;     00401F1B (in fn00401EC0)
;;     00402010 (in fn00401AC0)
;;     00402010 (in fn00401EC0)
;;     0040293F (in fn004028D0)
;;     00402961 (in fn004028D0)
;;     00402B14 (in fn00402A70)
;;     00402B32 (in fn00402A70)
;;     00402C0E (in fn00402BC7)
;;     00402C30 (in fn00402BC7)
;;     00402D45 (in fn00402D40)
;;     00402D75 (in fn00402D70)
;;     00402DA5 (in fn00402DA0)
;;     0040338D (in fn004032C0)
;;     004033AF (in fn004032C0)
;;     004051A5 (in fn00404FB0)
;;     00405AF6 (in fn00404FB0)
;;     00407A47 (in fn004079F0)
;;     00407AB4 (in fn00407A70)
;;     00407B25 (in fn00407AE0)
;;     00407BC1 (in fn00407B80)
;;     00407C25 (in fn00407BE0)
;;     0040A601 (in fn00409E70)
;;     0040AF33 (in fn0040AA30)
;;     0040AFAE (in fn0040AA30)
;;     0040B68D (in fn0040AA30)
;;     0040B71D (in fn0040AA30)
;;     0040B8B5 (in fn0040AA30)
;;     0040B936 (in fn0040AA30)
;;     0040B9B2 (in fn0040AA30)
;;     0040BA2A (in fn0040AA30)
;;     0040BB91 (in fn0040AA30)
;;     0040BC09 (in fn0040AA30)
;;     0040BDA4 (in fn0040AA30)
;;     0040BE8D (in fn0040BE00)
;;     0040C065 (in fn0040BE00)
;;     0040C1B5 (in fn0040BE00)
;;     0040C3BB (in fn0040BE00)
;;     0040C439 (in fn0040BE00)
;;     0040C4B7 (in fn0040BE00)
;;     0040C52C (in fn0040BE00)
;;     0040C90E (in fn0040BE00)
;;     0040D07E (in fn0040BE00)
;;     0040D113 (in fn0040BE00)
;;     0040D29A (in fn0040BE00)
;;     0040D318 (in fn0040BE00)
;;     0040D391 (in fn0040BE00)
;;     0040D406 (in fn0040BE00)
;;     0040D4D3 (in fn0040BE00)
;;     0040D547 (in fn0040BE00)
;;     0040D676 (in fn0040BE00)
;;     0040D6EB (in fn0040BE00)
;;     0040D7B8 (in fn0040BE00)
;;     0040D82A (in fn0040BE00)
;;     0040D8A7 (in fn0040BE00)
;;     0040D91B (in fn0040BE00)
;;     0040D98D (in fn0040BE00)
;;     0040DB0F (in fn0040BE00)
;;     0040DE5F (in fn0040DD30)
;;     0040DF7D (in fn0040DD30)
;;     0040EEC0 (in fn0040EE50)
;;     0040EEE0 (in fn0040EE50)
;;     0040F269 (in fn0040F23B)
;;     0040F2F9 (in fn0040F2A0)
;;     0040F3EE (in fn0040F380)
;;     0040F40E (in fn0040F380)
;;     0040F565 (in fn0040F520)
;;     0040F62E (in fn0040F5C0)
;;     0040F64E (in fn0040F5C0)
;;     00410975 (in fn00410900)
;;     0041099C (in fn00410900)
;;     004109CC (in fn00410900)
;;     00411271 (in fn00411200)
;;     00411291 (in fn00411200)
;;     004113A2 (in fn00411200)
;;     004113A2 (in fn004113A0)
;;     00411445 (in fn00411418)
;;     00411463 (in fn00411418)
;;     00411BD2 (in fn00411B30)
;;     00411BEE (in fn00411B30)
;;     004123C5 (in fn00412310)
;;     004123E5 (in fn00412310)
;;     00412595 (in fn0041253A)
;;     004125B7 (in fn0041253A)
;;     004126BE (in fn0041266B)
;;     004126DE (in fn0041266B)
;;     00412845 (in fn004127EA)
;;     00412867 (in fn004127EA)
;;     004129BB (in fn0041295D)
;;     004129DB (in fn0041295D)
;;     00412BBE (in fn00412B52)
;;     00412BE0 (in fn00412B52)
;;     00413051 (in fn00413003)
;;     00413074 (in fn00413003)
;;     00413198 (in fn00413145)
;;     004131BB (in fn00413145)
;;     004132FE (in fn004132AB)
;;     00413321 (in fn004132AB)
;;     004147DE (in fn00414760)
;;     004147FE (in fn00414760)
;;     00414ED8 (in fn00414E40)
;;     00414EFB (in fn00414E40)
;;     00416240 (in fn00416170)
;;     00416262 (in fn00416170)
;;     00416654 (in fn00416530)
;;     00416678 (in fn00416530)
;;     00416E20 (in fn00416DA0)
;;     00417146 (in fn004170C0)
;;     0041746E (in fn004173F0)
;;     00417491 (in fn004173F0)
;;     00418663 (in fn004198FB)
;;     00418663 (in fn004198D3)
;;     0041880B (in fn00418780)
;;     0041882F (in fn00418780)
;;     0041951D (in fn004194C0)
;;     0041966C (in fn00419630)
;;     004199E3 (in fn00419910)
;;     004274A4 (in fn0042749E)
;;     00428A60 (in fn00428A4B)
;;     00428A81 (in fn00428A4B)
;;     00428ACF (in fn00428AAB)
;;     00428AF0 (in fn00428AAB)
;;     004297FC (in fn004297C0)
;;     00429A8F (in fn00429A30)
;;     00429B8F (in fn00429B30)
;;     0042B3EC (in fn0042B3A0)
;;     0042D28D (in fn0042D289)
fn00427511 proc
	push	ebp
	mov	ebp,esp
	jmp	427523h

l00427516:
	push	dword ptr [ebp+8h]
	call	42D1D5h
	pop	ecx
	test	eax,eax
	jz	427532h

l00427523:
	push	dword ptr [ebp+8h]
	call	42D1DBh
	pop	ecx
	test	eax,eax
	jz	427516h

l00427530:
	pop	ebp
	ret

l00427532:
	cmp	dword ptr [ebp+8h],0FFh
	jz	427D9Ah

l0042753C:
	jmp	427D7Dh

;; fn00427541: 00427541
;;   Called from:
;;     0040368A (in fn00403610)
fn00427541 proc
	push	0Ch
	push	436F90h
	call	427DC0h
	mov	byte ptr [ebp-19h],0h
	mov	ebx,[ebp+0Ch]
	mov	eax,ebx
	mov	edi,[ebp+10h]
	imul	eax,edi
	mov	esi,[ebp+8h]
	add	esi,eax
	mov	[ebp+8h],esi
	and	dword ptr [ebp-4h],0h

l00427568:
	mov	eax,edi
	dec	edi
	mov	[ebp+10h],edi
	test	eax,eax
	jz	427587h

l00427572:
	sub	esi,ebx
	mov	[ebp+8h],esi
	mov	ecx,[ebp+14h]
	call	dword ptr [4312E0h]
	mov	ecx,esi
	call	dword ptr [ebp+14h]
	jmp	427568h

l00427587:
	mov	al,1h
	mov	[ebp-19h],al
	mov	dword ptr [ebp-4h],0FFFFFFFEh
	call	4275B6h
	mov	ecx,[ebp-10h]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	10h
004275AA                               8B 7D 10 8B 5D 0C           .}..].
004275B0 8B 75 08 8A 45 E7                               .u..E.          

;; fn004275B6: 004275B6
;;   Called from:
;;     00427593 (in fn00427541)
fn004275B6 proc
	test	al,al
	jnz	4275C5h

l004275BA:
	push	dword ptr [ebp+14h]
	push	edi
	push	ebx
	push	esi
	call	4275C6h

l004275C5:
	ret

;; fn004275C6: 004275C6
;;   Called from:
;;     004275C0 (in fn004275B6)
;;     004276E4 (in fn004276D6)
fn004275C6 proc
	push	18h
	push	436FB0h
	call	427DC0h
	xor	esi,esi
	mov	[ebp-4h],esi
	mov	edi,[ebp+8h]

l004275DA:
	mov	[ebp-1Ch],esi
	cmp	esi,[ebp+10h]
	jz	427620h

l004275E2:
	sub	edi,[ebp+0Ch]
	mov	[ebp+8h],edi
	mov	ecx,[ebp+14h]
	call	dword ptr [4312E0h]
	mov	ecx,edi
	call	dword ptr [ebp+14h]
	inc	esi
	jmp	4275DAh
004275F9                            8B 45 EC 89 45 E0 8B          .E..E..
00427600 45 E0 8B 00 89 45 DC 8B 45 DC 81 38 63 73 6D E0 E....E..E..8csm.
00427610 74 27 C7 45 D8 00 00 00 00 8B 45 D8 C3 8B 65 E8 t'.E......E...e.

l00427620:
	mov	dword ptr [ebp-4h],0FFFFFFFEh
	mov	ecx,[ebp-10h]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	10h
00427639                            E8 A3 5B 00 00 CC             ..[... 

;; fn0042763F: 0042763F
;;   Called from:
;;     004013C2 (in fn004013A0)
;;     00401504 (in fn004014C0)
;;     0040156D (in fn004014C0)
;;     004015B2 (in fn004014C0)
;;     00401674 (in fn00401613)
;;     004016DD (in fn00401613)
;;     004017D9 (in fn00401767)
;;     00401C09 (in fn00401AC0)
;;     00401D76 (in fn00401AC0)
;;     00402077 (in fn00402049)
;;     004021F4 (in fn004021A0)
;;     0040222A (in fn004021A0)
;;     00402244 (in fn004021A0)
;;     004022F0 (in fn00402260)
;;     004023E3 (in fn00402260)
;;     0040241C (in fn00402260)
;;     00402437 (in fn00402260)
;;     00402453 (in fn00402260)
;;     00402487 (in fn00402260)
;;     004024AE (in fn00402260)
;;     0040250E (in fn00402260)
;;     00402551 (in fn00402260)
;;     00402587 (in fn00402260)
;;     004025A1 (in fn00402260)
;;     0040260A (in fn004025C0)
;;     00402627 (in fn004025C0)
;;     0040264C (in fn004025C0)
;;     004026AA (in fn00402660)
;;     004026C7 (in fn00402660)
;;     004026EC (in fn00402660)
;;     004027A0 (in fn00402750)
;;     0040282A (in fn00402800)
;;     00402B84 (in fn00402A70)
;;     00403499 (in fn00403460)
;;     004034DA (in fn00403460)
;;     00403547 (in fn0040351D)
;;     00403660 (in fn00403610)
;;     00403793 (in fn0040374C)
;;     00403D35 (in fn00403D20)
;;     00403E55 (in fn00403E40)
;;     00403F10 (in fn00403EE0)
;;     00403FE2 (in fn00403FC0)
;;     0040417B (in fn00404080)
;;     004041FE (in fn00404080)
;;     00404269 (in fn00404080)
;;     004042DC (in fn00404080)
;;     00404347 (in fn00404080)
;;     00404623 (in fn00404080)
;;     00404640 (in fn00404080)
;;     00404831 (in fn00404080)
;;     00404AF8 (in fn00404080)
;;     00404C3B (in fn00404080)
;;     00404CED (in fn00404C60)
;;     00404D36 (in fn00404C60)
;;     00404DAE (in fn00404C60)
;;     00407C9E (in fn00407C60)
;;     00407CD4 (in fn00407C60)
;;     00407CEE (in fn00407C60)
;;     00409577 (in fn00408FF1)
;;     004095B7 (in fn00408FF1)
;;     0040998C (in fn00408FF1)
;;     004099D7 (in fn00408FF1)
;;     00409E08 (in fn00409BCD)
;;     0040A137 (in fn00409E70)
;;     0040A1A7 (in fn00409E70)
;;     0040A6E6 (in fn00409E70)
;;     0040A72E (in fn00409E70)
;;     0040A79C (in fn00409E70)
;;     0040A80D (in fn00409E70)
;;     0040AA0A (in fn0040A880)
;;     0040B629 (in fn0040AA30)
;;     0040B82A (in fn0040AA30)
;;     0040BB0B (in fn0040AA30)
;;     0040BD1C (in fn0040AA30)
;;     0040C329 (in fn0040BE00)
;;     0040DA84 (in fn0040BE00)
;;     0040E0D7 (in fn0040DFF0)
;;     0040E20B (in fn0040E130)
;;     0040E27F (in fn0040E130)
;;     0040E372 (in fn0040E30B)
;;     0040E3DA (in fn0040E30B)
;;     0040EB2D (in fn0040EA60)
;;     0040ED52 (in fn0040EB40)
;;     0040ED5E (in fn0040EB40)
;;     0040EDBD (in fn0040EB40)
;;     0040EFC3 (in fn0040EE50)
;;     0040F051 (in fn0040EE50)
;;     0040F0CE (in fn0040F08F)
;;     0040F15F (in fn0040F13F)
;;     0040F1E8 (in fn0040F199)
;;     0040F4F5 (in fn0040F380)
;;     0040F735 (in fn0040F5C0)
;;     0040F8F5 (in fn0040F8C0)
;;     00410338 (in fn00410120)
;;     00410A70 (in fn00410900)
;;     00410AC4 (in fn00410AB0)
;;     00410AFA (in fn004198C3)
;;     00410B2A (in fn004198AB)
;;     00410BB5 (in fn00410B40)
;;     00410C3A (in fn00419888)
;;     00410C72 (in fn00410C50)
;;     004110F8 (in fn004110B0)
;;     004111E0 (in fn004111B0)
;;     00411374 (in fn00411200)
;;     00411C3B (in fn00411B30)
;;     00411E0E (in fn00411D30)
;;     004124A4 (in fn00412310)
;;     0041276A (in fn0041266B)
;;     00412A9D (in fn0041295D)
;;     00412D6A (in fn00412B52)
;;     004130D3 (in fn00413003)
;;     00413231 (in fn00413145)
;;     00413390 (in fn004132AB)
;;     00413417 (in fn004133ED)
;;     004137DE (in fn00413770)
;;     00414865 (in fn00414760)
;;     00414926 (in fn004148B0)
;;     00414968 (in fn004148B0)
;;     00414C14 (in fn00414C00)
;;     00414F4F (in fn00414E40)
;;     00414FBB (in fn00414E40)
;;     00416426 (in fn00416170)
;;     00416608 (in fn00416530)
;;     0041703C (in fn00416DA0)
;;     00417077 (in fn00416DA0)
;;     00417092 (in fn00416DA0)
;;     0041736C (in fn004170C0)
;;     004173A7 (in fn004170C0)
;;     004173C2 (in fn004170C0)
;;     0041751C (in fn004173F0)
;;     00418071 (in fn00417F50)
;;     004184E4 (in fn004184D0)
;;     0041895E (in fn0041894D)
;;     00419785 (in fn00419770)
;;     00419DB4 (in fn00419D40)
;;     00419DF4 (in fn00419D40)
;;     00419E18 (in fn00419D40)
;;     00419E67 (in fn00419D40)
;;     00419EB8 (in fn00419D40)
;;     0041A2E3 (in fn0041A150)
;;     0041A319 (in fn0041A150)
;;     0041A625 (in fn0041A350)
;;     0041A6B8 (in fn0041A350)
;;     0041A8A5 (in fn0041A760)
;;     0041A90E (in fn0041A760)
;;     0041A955 (in fn0041A760)
;;     0041AD4D (in fn0041A760)
;;     0041AD93 (in fn0041A760)
;;     0041AE2B (in fn0041A760)
;;     0041B047 (in fn0041AEF0)
;;     0041B0FE (in fn0041AEF0)
;;     0041B199 (in fn0041AEF0)
;;     0041B260 (in fn0041AEF0)
;;     0041B2FB (in fn0041AEF0)
;;     0041B3EB (in fn0041AEF0)
;;     0041B4E0 (in fn0041AEF0)
;;     0041B5EB (in fn0041AEF0)
;;     0041B686 (in fn0041AEF0)
;;     0041B721 (in fn0041AEF0)
;;     0041B816 (in fn0041AEF0)
;;     0041B90B (in fn0041AEF0)
;;     0041BA1A (in fn0041AEF0)
;;     0041BAB5 (in fn0041AEF0)
;;     0041BB76 (in fn0041AEF0)
;;     0041BC11 (in fn0041AEF0)
;;     0041BD06 (in fn0041AEF0)
;;     0041BDFB (in fn0041AEF0)
;;     0041BF0A (in fn0041AEF0)
;;     0041BFA5 (in fn0041AEF0)
;;     0041C04C (in fn0041AEF0)
;;     0041C10C (in fn0041AEF0)
;;     0041C157 (in fn0041AEF0)
;;     0041C2C7 (in fn0041C25C)
;;     0041C339 (in fn0041C25C)
;;     0041C381 (in fn0041C25C)
;;     0041CA4B (in fn0041C910)
;;     0041D395 (in fn0041CC60)
;;     0041D40F (in fn0041CC60)
;;     004271FA (in fn00427410)
;;     00427662 (in fn0042764D)
;;     00427D6F (in fn00427D50)
;;     004286E1 (in fn004286A0)
;;     00429FD3 (in fn00429FC0)
;;     0042A242 (in fn0042A230)
;;     0042C2F3 (in fn0042C2E0)
fn0042763F proc
	push	ebp
	mov	ebp,esp
	push	dword ptr [ebp+8h]
	call	427E3Eh
	pop	ecx
	pop	ebp
	ret

;; fn0042764D: 0042764D
fn0042764D proc
	push	ebp
	mov	ebp,esp
	test	byte ptr [ebp+8h],1h
	push	esi
	mov	esi,ecx
	mov	dword ptr [esi],431374h
	jz	427669h

l0042765F:
	push	0Ch
	push	esi
	call	42763Fh
	pop	ecx
	pop	ecx

l00427669:
	mov	eax,esi
	pop	esi
	pop	ebp
	ret	4h

;; fn00427670: 00427670
;;   Called from:
;;     0040DE85 (in fn0040DD30)
;;     0040DFAA (in fn0040DD30)
;;     0040F58C (in fn0040F520)
fn00427670 proc
	push	10h
	push	436FD0h
	call	427DC0h
	xor	ebx,ebx
	mov	[ebp-20h],ebx
	mov	[ebp-19h],bl
	mov	[ebp-4h],ebx

l00427687:
	cmp	ebx,[ebp+14h]
	jz	4276ADh

l0042768C:
	push	dword ptr [ebp+0Ch]
	mov	ecx,[ebp+18h]
	call	dword ptr [4312E0h]
	mov	ecx,[ebp+8h]
	call	dword ptr [ebp+18h]
	mov	eax,[ebp+10h]
	add	[ebp+8h],eax
	add	[ebp+0Ch],eax
	inc	ebx
	mov	[ebp-20h],ebx
	jmp	427687h

l004276AD:
	mov	al,1h
	mov	[ebp-19h],al
	mov	dword ptr [ebp-4h],0FFFFFFFEh
	call	4276D6h
	mov	ecx,[ebp-10h]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	18h
004276D0 8B 5D E0 8A 45 E7                               .]..E.          

;; fn004276D6: 004276D6
;;   Called from:
;;     004276B9 (in fn00427670)
fn004276D6 proc
	test	al,al
	jnz	4276E9h

l004276DA:
	push	dword ptr [ebp+1Ch]
	push	ebx
	push	dword ptr [ebp+10h]
	push	dword ptr [ebp+8h]
	call	4275C6h

l004276E9:
	ret

;; fn004276EA: 004276EA
;;   Called from:
;;     00427887 (in fn0042783E)
fn004276EA proc
	push	ebp
	mov	ebp,esp
	mov	eax,[ebp+8h]
	push	esi
	mov	ecx,[eax+3Ch]
	add	ecx,eax
	movzx	eax,word ptr [ecx+14h]
	lea	edx,[ecx+18h]
	add	edx,eax
	movzx	eax,word ptr [ecx+6h]
	imul	esi,eax,28h
	add	esi,edx
	cmp	edx,esi
	jz	427725h

l0042770C:
	mov	ecx,[ebp+0Ch]

l0042770F:
	cmp	ecx,[edx+0Ch]
	jc	42771Eh

l00427714:
	mov	eax,[edx+8h]
	add	eax,[edx+0Ch]
	cmp	ecx,eax
	jc	42772Ah

l0042771E:
	add	edx,28h
	cmp	edx,esi
	jnz	42770Fh

l00427725:
	xor	eax,eax

l00427727:
	pop	esi
	pop	ebp
	ret

l0042772A:
	mov	eax,edx
	jmp	427727h

;; fn0042772E: 0042772E
;;   Called from:
;;     00427A51 (in Win32CrtStartup)
fn0042772E proc
	push	esi
	call	427FDEh
	test	eax,eax
	jz	427758h

l00427738:
	mov	eax,fs:[0018h]
	mov	esi,43AD1Ch
	mov	edx,[eax+4h]
	jmp	42774Ch

l00427748:
	cmp	edx,eax
	jz	42775Ch

l0042774C:
	xor	eax,eax
	mov	ecx,edx
	lock
	cmpxchg	[esi],ecx
	test	eax,eax
	jnz	427748h

l00427758:
	xor	al,al
	pop	esi
	ret

l0042775C:
	mov	al,1h
	pop	esi
	ret

;; fn00427760: 00427760
;;   Called from:
;;     00427A3A (in Win32CrtStartup)
fn00427760 proc
	push	ebp
	mov	ebp,esp
	cmp	dword ptr [ebp+8h],0h
	jnz	427770h

l00427769:
	mov	byte ptr [43AD20h],1h

l00427770:
	call	427E43h
	call	428255h
	test	al,al
	jnz	427782h

l0042777E:
	xor	al,al
	pop	ebp
	ret

l00427782:
	call	428255h
	test	al,al
	jnz	427795h

l0042778B:
	push	0h
	call	428255h
	pop	ecx
	jmp	42777Eh

l00427795:
	mov	al,1h
	pop	ebp
	ret
00427799                            55 8B EC 83 EC 0C 80          U......
004277A0 3D 21 AD 43 00 00 74 04 B0 01 C9 C3 56 8B 75 08 =!.C..t.....V.u.
004277B0 85 F6 74 05 83 FE 01 75 7D E8 20 08 00 00 85 C0 ..t....u}. .....
004277C0 74 26 85 F6 75 22 68 24 AD 43 00 E8 23 5A 00 00 t&..u"h$.C..#Z..
004277D0 59 85 C0 75 0F 68 30 AD 43 00 E8 14 5A 00 00 59 Y..u.h0.C...Z..Y
004277E0 85 C0 74 46 32 C0 EB 4B A1 08 A0 43 00 8D 75 F4 ..tF2..K...C..u.
004277F0 57 83 E0 1F BF 24 AD 43 00 6A 20 59 2B C8 83 C8 W....$.C.j Y+...
00427800 FF D3 C8 33 05 08 A0 43 00 89 45 F4 89 45 F8 89 ...3...C..E..E..
00427810 45 FC A5 A5 A5 BF 30 AD 43 00 89 45 F4 89 45 F8 E.....0.C..E..E.
00427820 8D 75 F4 89 45 FC A5 A5 A5 5F C6 05 21 AD 43 00 .u..E...._..!.C.
00427830 01 B0 01 5E C9 C3 6A 05 E8 AD 07 00 00 CC       ...^..j.......  

;; fn0042783E: 0042783E
;;   Called from:
;;     00427AD2 (in Win32CrtStartup)
;;     00427AF8 (in Win32CrtStartup)
fn0042783E proc
	push	8h
	push	436FF0h
	call	427DC0h
	and	dword ptr [ebp-4h],0h
	mov	eax,5A4Dh
	cmp	[400000h],ax
	jnz	4278B9h

l0042785C:
	mov	eax,[40003Ch]
	cmp	dword ptr [eax+400000h],4550h
	jnz	4278B9h

l0042786D:
	mov	ecx,10Bh
	cmp	[eax+400018h],cx
	jnz	4278B9h

l0042787B:
	mov	eax,[ebp+8h]
	mov	ecx,400000h
	sub	eax,ecx
	push	eax
	push	ecx
	call	4276EAh
	pop	ecx
	pop	ecx
	test	eax,eax
	jz	4278B9h

l00427892:
	cmp	dword ptr [eax+24h],0h
	jl	4278B9h

l00427898:
	mov	dword ptr [ebp-4h],0FFFFFFFEh
	mov	al,1h
	jmp	4278C2h
004278A3          8B 45 EC 8B 00 33 C9 81 38 05 00 00 C0    .E...3..8....
004278B0 0F 94 C1 8B C1 C3 8B 65 E8                      .......e.       

l004278B9:
	mov	dword ptr [ebp-4h],0FFFFFFFEh
	xor	al,al

l004278C2:
	mov	ecx,[ebp-10h]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret

;; fn004278D2: 004278D2
;;   Called from:
;;     00427ABE (in Win32CrtStartup)
fn004278D2 proc
	push	ebp
	mov	ebp,esp
	call	427FDEh
	test	eax,eax
	jz	4278EDh

l004278DE:
	cmp	byte ptr [ebp+8h],0h
	jnz	4278EDh

l004278E4:
	xor	eax,eax
	mov	ecx,43AD1Ch
	xchg	[ecx],eax

l004278ED:
	pop	ebp
	ret

;; fn004278EF: 004278EF
;;   Called from:
;;     00427B41 (in Win32CrtStartup)
fn004278EF proc
	push	ebp
	mov	ebp,esp
	cmp	byte ptr [43AD20h],0h
	jz	427901h

l004278FB:
	cmp	byte ptr [ebp+0Ch],0h
	jnz	427913h

l00427901:
	push	dword ptr [ebp+8h]
	call	428255h
	push	dword ptr [ebp+8h]
	call	428255h
	pop	ecx
	pop	ecx

l00427913:
	mov	al,1h
	pop	ebp
	ret

;; fn00427917: 00427917
;;   Called from:
;;     00427958 (in fn00427952)
fn00427917 proc
	push	ebp
	mov	ebp,esp
	mov	eax,[43A008h]
	mov	ecx,eax
	xor	eax,[43AD24h]
	and	ecx,1Fh
	push	dword ptr [ebp+8h]
	ror	eax,cl
	cmp	eax,0FFh
	jnz	42793Bh

l00427934:
	call	42D1FFh
	jmp	427946h

l0042793B:
	push	43AD24h
	call	42D1F9h
	pop	ecx

l00427946:
	neg	eax
	pop	ecx
	sbb	eax,eax
	not	eax
	and	eax,[ebp+8h]
	pop	ebp
	ret

;; fn00427952: 00427952
;;   Called from:
;;     0042B531 (in fn0042B4C0)
;;     0042B5D1 (in fn0042B560)
;;     0042C27A (in fn0042C210)
;;     0042C370 (in fn0042C310)
;;     0042CE07 (in fn0042CD80)
;;     0042D179 (in fn0042D120)
fn00427952 proc
	push	ebp
	mov	ebp,esp
	push	dword ptr [ebp+8h]
	call	427917h
	neg	eax
	pop	ecx
	sbb	eax,eax
	neg	eax
	dec	eax
	pop	ebp
	ret
00427967                      56 6A 01 E8 A2 58 00 00 E8        Vj...X...
00427970 CF 08 00 00 50 E8 C1 58 00 00 E8 E6 58 00 00 8B ....P..X....X...
00427980 F0 E8 8A 07 00 00 6A 01 89 06 E8 0A FE FF FF 83 ......j.........
00427990 C4 0C 5E 84 C0 74 73 DB E2 E8 1C 09 00 00 68 E6 ..^..ts.......h.
004279A0 82 42 00 E8 AA FF FF FF E8 2D 06 00 00 50 E8 34 .B.......-...P.4
004279B0 58 00 00 59 59 85 C0 75 51 E8 8B 08 00 00 E8 DF X..YY..uQ.......
004279C0 08 00 00 85 C0 74 0B 68 10 81 42 00 E8 46 58 00 .....t.h..B..FX.
004279D0 00 59 E8 C9 AF FD FF E8 C4 AF FD FF E8 77 08 00 .Y...........w..
004279E0 00 E8 2A 07 00 00 50 E8 6D 58 00 00 59 E8 63 08 ..*...P.mX..Y.c.
004279F0 00 00 84 C0 74 05 E8 F2 57 00 00 E8 10 07 00 00 ....t...W.......
00427A00 E8 FF 06 00 00 85 C0 75 01 C3 6A 07 E8 D9 05 00 .......u..j.....
00427A10 00 CC E8 6E 08 00 00 33 C0 C3 E8 37 07 00 00 E8 ...n...3...7....
00427A20 EC 06 00 00 50 E8 35 58 00 00 59 C3             ....P.5X..Y.    

l00427A2C:
	push	14h
	push	437010h
	call	427DC0h
	push	1h
	call	427760h
	pop	ecx
	test	al,al
	jz	427B98h

l00427A48:
	xor	bl,bl
	mov	[ebp-19h],bl
	and	dword ptr [ebp-4h],0h
	call	42772Eh
	mov	[ebp-24h],al
	mov	eax,[43AD18h]
	xor	ecx,ecx
	inc	ecx
	cmp	eax,ecx
	jz	427B98h

l00427A69:
	test	eax,eax
	jnz	427AB6h

l00427A6D:
	mov	[43AD18h],ecx
	push	431350h
	push	431340h
	call	42D229h
	pop	ecx
	pop	ecx
	test	eax,eax
	jz	427A99h

l00427A88:
	mov	dword ptr [ebp-4h],0FFFFFFFEh
	mov	eax,0FFh
	jmp	427B88h

l00427A99:
	push	43133Ch
	push	4312E4h
	call	42D223h
	pop	ecx
	pop	ecx
	mov	dword ptr [43AD18h],2h
	jmp	427ABBh

l00427AB6:
	mov	bl,cl
	mov	[ebp-19h],bl

l00427ABB:
	push	dword ptr [ebp-24h]
	call	4278D2h
	pop	ecx
	call	4282AEh
	mov	esi,eax
	xor	edi,edi
	cmp	[esi],edi
	jz	427AECh

l00427AD1:
	push	esi
	call	42783Eh
	pop	ecx
	test	al,al
	jz	427AECh

l00427ADC:
	mov	esi,[esi]
	push	edi
	push	2h
	push	edi
	mov	ecx,esi
	call	dword ptr [4312E0h]
	call	esi

l00427AEC:
	call	4282B4h
	mov	esi,eax
	cmp	[esi],edi
	jz	427B0Ah

l00427AF7:
	push	esi
	call	42783Eh
	pop	ecx
	test	al,al
	jz	427B0Ah

l00427B02:
	push	dword ptr [esi]
	call	42D253h
	pop	ecx

l00427B0A:
	call	42D247h
	mov	edi,[eax]
	call	42D241h
	mov	esi,eax
	call	42D21Dh
	push	eax
	push	edi
	push	dword ptr [esi]
	call	419910h
	add	esp,0Ch
	mov	esi,eax
	call	428113h
	test	al,al
	jz	427B9Fh

l00427B34:
	test	bl,bl
	jnz	427B3Dh

l00427B38:
	call	42D205h

l00427B3D:
	push	0h
	push	1h
	call	4278EFh
	pop	ecx
	pop	ecx
	mov	dword ptr [ebp-4h],0FFFFFFFEh
	mov	eax,esi
	jmp	427B88h
00427B53          8B 4D EC 8B 01 8B 00 89 45 E0 51 50 E8    .M......E.QP.
00427B60 A7 56 00 00 59 59 C3 8B 65 E8 E8 A4 05 00 00 84 .V..YY..e.......
00427B70 C0 74 32 80 7D E7 00 75 05 E8 CF 56 00 00 C7 45 .t2.}..u...V...E
00427B80 FC FE FF FF FF 8B 45 E0                         ......E.        

l00427B88:
	mov	ecx,[ebp-10h]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret

l00427B98:
	push	7h
	call	427FEAh

l00427B9F:
	push	esi
	call	42D22Fh
00427BA5                FF 75 E0 E8 88 56 00 00 CC            .u...V...  

;; Win32CrtStartup: 00427BAE
Win32CrtStartup proc
	call	4281F8h
	jmp	427A2Ch

;; fn00427BB8: 00427BB8
;;   Called from:
;;     00427CD2 (in fn00427500)
fn00427BB8 proc
	push	ebp
	mov	ebp,esp
	push	0h
	call	dword ptr [431068h]
	push	dword ptr [ebp+8h]
	call	dword ptr [431064h]
	push	0C0000409h
	call	dword ptr [43106Ch]
	push	eax
	call	dword ptr [431070h]
	pop	ebp
	ret

l00427BE0:
	push	ebp
	mov	ebp,esp
	sub	esp,324h
	push	17h
	call	42D277h
	test	eax,eax
	jz	427BF9h

l00427BF4:
	push	2h
	pop	ecx
	int	29h

l00427BF9:
	mov	[43AE40h],eax
	mov	[43AE3Ch],ecx
	mov	[43AE38h],edx
	mov	[43AE34h],ebx
	mov	[43AE30h],esi
	mov	[43AE2Ch],edi
	mov	[43AE58h],ss
	mov	[43AE4Ch],cs
	mov	[43AE28h],ds
	mov	[43AE24h],es
	mov	[43AE20h],fs
	mov	[43AE1Ch],gs
	pushf
	pop	dword ptr [43AE50h]
	mov	eax,[ebp+0h]
	mov	[43AE44h],eax
	mov	eax,[ebp+4h]
	mov	[43AE48h],eax
	lea	eax,[ebp+8h]
	mov	[43AE54h],eax
	mov	eax,[ebp-324h]
	mov	dword ptr [43AD90h],10001h
	mov	eax,[43AE48h]
	mov	[43AD4Ch],eax
	mov	dword ptr [43AD40h],0C0000409h
	mov	dword ptr [43AD44h],1h
	mov	dword ptr [43AD50h],1h
	push	4h
	pop	eax
	imul	eax,eax,0h
	mov	dword ptr [eax+43AD54h],2h
	push	4h
	pop	eax
	imul	eax,eax,0h
	mov	ecx,[43A008h]
	mov	[ebp+eax-8h],ecx
	push	4h
	pop	eax
	shl	eax,0h
	mov	ecx,[43A004h]
	mov	[ebp+eax-8h],ecx
	push	431378h
	call	427BB8h
	leave
	ret
00427CD9                            55 8B EC 56 FF 75 08          U..V.u.
00427CE0 8B F1 E8 79 96 FD FF C7 06 90 13 43 00 8B C6 5E ...y.......C...^
00427CF0 5D C2 04 00                                     ]...            

;; fn00427CF4: 00427CF4
;;   Called from:
;;     00427D86 (in fn00427511)
fn00427CF4 proc
	and	dword ptr [ecx+4h],0h
	mov	eax,ecx
	and	dword ptr [ecx+8h],0h
	mov	dword ptr [ecx+4h],431398h
	mov	dword ptr [ecx],431390h
	ret
00427D0C                                     55 8B EC 56             U..V
00427D10 FF 75 08 8B F1 E8 46 96 FD FF C7 06 AC 13 43 00 .u....F.......C.
00427D20 8B C6 5E 5D C2 04 00                            ..^]...         

;; fn00427D27: 00427D27
;;   Called from:
;;     00427DA3 (in fn00427511)
fn00427D27 proc
	and	dword ptr [ecx+4h],0h
	mov	eax,ecx
	and	dword ptr [ecx+8h],0h
	mov	dword ptr [ecx+4h],4313B4h
	mov	dword ptr [ecx],4313ACh
	ret
00427D3F                                              8D                .
00427D40 41 04 C7 01 84 13 43 00 50 E8 57 54 00 00 59 C3 A.....C.P.WT..Y.

;; fn00427D50: 00427D50
fn00427D50 proc
	push	ebp
	mov	ebp,esp
	push	esi
	mov	esi,ecx
	lea	eax,[esi+4h]
	mov	dword ptr [esi],431384h
	push	eax
	call	42D1A5h
	test	byte ptr [ebp+8h],1h
	pop	ecx
	jz	427D76h

l00427D6C:
	push	0Ch
	push	esi
	call	42763Fh
	pop	ecx
	pop	ecx

l00427D76:
	mov	eax,esi
	pop	esi
	pop	ebp
	ret	4h

l00427D7D:
	push	ebp
	mov	ebp,esp
	sub	esp,0Ch
	lea	ecx,[ebp-0Ch]
	call	427CF4h
	push	43702Ch
	lea	eax,[ebp-0Ch]
	push	eax
	call	42D1B7h
	int	3h

l00427D9A:
	push	ebp
	mov	ebp,esp
	sub	esp,0Ch
	lea	ecx,[ebp-0Ch]
	call	427D27h
	push	437064h
	lea	eax,[ebp-0Ch]
	push	eax
	call	42D1B7h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h

;; fn00427DC0: 00427DC0
;;   Called from:
;;     00427548 (in fn00427541)
;;     004275CD (in fn004275C6)
;;     00427677 (in fn00427670)
;;     00427845 (in fn0042783E)
;;     00427A33 (in Win32CrtStartup)
;;     00427DBF (in fn00427511)
fn00427DC0 proc
	push	427E1Bh
	push	dword ptr fs:[0000h]
	mov	eax,[esp+10h]
	mov	[esp+10h],ebp
	lea	ebp,[esp+10h]
	sub	esp,eax
	push	ebx
	push	esi
	push	edi
	mov	eax,[43A008h]
	xor	[ebp-4h],eax
	xor	eax,ebp
	push	eax
	mov	[ebp-18h],esp
	push	dword ptr [ebp-8h]
	mov	eax,[ebp-4h]
	mov	dword ptr [ebp-4h],0FFFFFFFEh
	mov	[ebp-8h],eax
	lea	eax,[ebp-10h]
	mov	fs:[0000h],eax
	repne ret
00427E06                   8B 4D F0 64 89 0D 00 00 00 00       .M.d......
00427E10 59 5F 5F 5E 5B 8B E5 5D 51 F2 C3 55 8B EC FF 75 Y__^[..]Q..U...u
00427E20 14 FF 75 10 FF 75 0C FF 75 08 68 00 75 42 00 68 ..u..u..u.h.uB.h
00427E30 08 A0 43 00 E8 84 53 00 00 83 C4 18 5D C3       ..C...S.....].  

;; fn00427E3E: 00427E3E
;;   Called from:
;;     00427645 (in fn0042763F)
;;     00428A0C (in fn004289B0)
;;     0042BED6 (in fn0042BD90)
;;     0042BF37 (in fn0042BD90)
;;     0042BF98 (in fn0042BD90)
;;     0042BFFC (in fn0042BD90)
;;     0042D292 (in fn0042D292)
fn00427E3E proc
	jmp	42D26Bh

;; fn00427E43: 00427E43
;;   Called from:
;;     00427770 (in fn00427760)
fn00427E43 proc
	push	ebp
	mov	ebp,esp
	and	dword ptr [43B05Ch],0h
	sub	esp,24h
	push	ebx
	xor	ebx,ebx
	inc	ebx
	or	[43A010h],ebx
	push	0Ah
	call	42D277h
	test	eax,eax
	jz	427FD5h

l00427E69:
	and	dword ptr [ebp-10h],0h
	xor	eax,eax
	or	dword ptr [43A010h],2h
	xor	ecx,ecx
	push	esi
	push	edi
	mov	[43B05Ch],ebx
	lea	edi,[ebp-24h]
	push	ebx
	cpuid
	mov	esi,ebx
	pop	ebx
	mov	[edi],eax
	mov	[edi+4h],esi
	mov	[edi+8h],ecx
	xor	ecx,ecx
	mov	[edi+0Ch],edx
	mov	eax,[ebp-24h]
	mov	edi,[ebp-20h]
	mov	[ebp-0Ch],eax
	xor	edi,756E6547h
	mov	eax,[ebp-18h]
	xor	eax,49656E69h
	mov	[ebp-8h],eax
	mov	eax,[ebp-1Ch]
	xor	eax,6C65746Eh
	mov	[ebp-4h],eax
	xor	eax,eax
	inc	eax
	push	ebx
	cpuid
	mov	esi,ebx
	pop	ebx
	lea	ebx,[ebp-24h]
	mov	[ebx],eax
	mov	eax,[ebp-4h]
	or	eax,[ebp-8h]
	or	eax,edi
	mov	[ebx+4h],esi
	mov	[ebx+8h],ecx
	mov	[ebx+0Ch],edx
	jnz	427F1Fh

l00427EDC:
	mov	eax,[ebp-24h]
	and	eax,0FFF3FF0h
	cmp	eax,106C0h
	jz	427F0Eh

l00427EEB:
	cmp	eax,20660h
	jz	427F0Eh

l00427EF2:
	cmp	eax,20670h
	jz	427F0Eh

l00427EF9:
	cmp	eax,30650h
	jz	427F0Eh

l00427F00:
	cmp	eax,30660h
	jz	427F0Eh

l00427F07:
	cmp	eax,30670h
	jnz	427F1Fh

l00427F0E:
	mov	edi,[43B060h]
	or	edi,1h
	mov	[43B060h],edi
	jmp	427F25h

l00427F1F:
	mov	edi,[43B060h]

l00427F25:
	cmp	dword ptr [ebp-0Ch],7h
	mov	eax,[ebp-1Ch]
	mov	[ebp-4h],eax
	jl	427F63h

l00427F31:
	push	7h
	pop	eax
	xor	ecx,ecx
	push	ebx
	cpuid
	mov	esi,ebx
	pop	ebx
	lea	ebx,[ebp-24h]
	mov	[ebx],eax
	mov	eax,[ebp-4h]
	mov	[ebx+4h],esi
	mov	[ebx+8h],ecx
	mov	[ebx+0Ch],edx
	mov	ebx,[ebp-20h]
	test	ebx,200h
	jz	427F66h

l00427F58:
	or	edi,2h
	mov	[43B060h],edi
	jmp	427F66h

l00427F63:
	mov	ebx,[ebp-10h]

l00427F66:
	pop	edi
	pop	esi
	test	eax,100000h
	jz	427FD5h

l00427F6F:
	or	dword ptr [43A010h],4h
	mov	dword ptr [43B05Ch],2h
	test	eax,8000000h
	jz	427FD5h

l00427F87:
	test	eax,10000000h
	jz	427FD5h

l00427F8E:
	xor	ecx,ecx
	xgetbv
	mov	[ebp-14h],eax
	mov	[ebp-10h],edx
	mov	eax,[ebp-14h]
	mov	ecx,[ebp-10h]
	and	eax,6h
	cmp	eax,6h
	jnz	427FD5h

l00427FA7:
	mov	eax,[43A010h]
	or	eax,8h
	mov	dword ptr [43B05Ch],3h
	mov	[43A010h],eax
	test	bl,20h
	jz	427FD5h

l00427FC3:
	or	eax,20h
	mov	dword ptr [43B05Ch],5h
	mov	[43A010h],eax

l00427FD5:
	xor	eax,eax
	pop	ebx
	leave
	ret
00427FDA                               33 C0 40 C3                 3.@.  

;; fn00427FDE: 00427FDE
;;   Called from:
;;     0042772F (in fn0042772E)
;;     004278D5 (in fn004278D2)
fn00427FDE proc
	xor	eax,eax
	cmp	[43A080h],eax
	setnz	al
	ret

;; fn00427FEA: 00427FEA
;;   Called from:
;;     00427B9A (in Win32CrtStartup)
fn00427FEA proc
	push	ebp
	mov	ebp,esp
	sub	esp,324h
	push	ebx
	push	17h
	call	42D277h
	test	eax,eax
	jz	428004h

l00427FFF:
	mov	ecx,[ebp+8h]
	int	29h

l00428004:
	push	3h
	call	4281A3h
	mov	dword ptr [esp],2CCh
	lea	eax,[ebp-324h]
	push	0h
	push	eax
	call	42D1C3h
	add	esp,0Ch
	mov	[ebp-274h],eax
	mov	[ebp-278h],ecx
	mov	[ebp-27Ch],edx
	mov	[ebp-280h],ebx
	mov	[ebp-284h],esi
	mov	[ebp-288h],edi
	mov	[ebp-25Ch],ss
	mov	[ebp-268h],cs
	mov	[ebp-28Ch],ds
	mov	[ebp-290h],es
	mov	[ebp-294h],fs
	mov	[ebp-298h],gs
	pushf
	pop	dword ptr [ebp-264h]
	mov	eax,[ebp+4h]
	mov	[ebp-26Ch],eax
	lea	eax,[ebp+4h]
	mov	[ebp-260h],eax
	mov	dword ptr [ebp-324h],10001h
	mov	eax,[eax-4h]
	push	50h
	mov	[ebp-270h],eax
	lea	eax,[ebp-58h]
	push	0h
	push	eax
	call	42D1C3h
	mov	eax,[ebp+4h]
	add	esp,0Ch
	mov	dword ptr [ebp-58h],40000015h
	mov	dword ptr [ebp-54h],1h
	mov	[ebp-4Ch],eax
	call	dword ptr [431078h]
	push	0h
	lea	ebx,[eax-1h]
	neg	ebx
	lea	eax,[ebp-58h]
	mov	[ebp-8h],eax
	lea	eax,[ebp-324h]
	sbb	bl,bl
	mov	[ebp-4h],eax
	inc	bl
	call	dword ptr [431068h]
	lea	eax,[ebp-8h]
	push	eax
	call	dword ptr [431064h]
	test	eax,eax
	jnz	428101h

l004280F5:
	test	bl,bl
	jnz	428101h

l004280F9:
	push	3h
	call	4281A3h
	pop	ecx

l00428101:
	pop	ebx
	leave
	ret
00428104             E9 07 00 00 00 CC CC CC CC CC CC CC     ............

;; fn00428110: 00428110
fn00428110 proc
	xor	eax,eax
	ret

;; fn00428113: 00428113
;;   Called from:
;;     00427B2B (in Win32CrtStartup)
fn00428113 proc
	push	0h
	call	dword ptr [43107Ch]
	test	eax,eax
	jz	428153h

l0042811F:
	mov	ecx,5A4Dh
	cmp	[eax],cx
	jnz	428153h

l00428129:
	mov	ecx,[eax+3Ch]
	add	ecx,eax
	cmp	dword ptr [ecx],4550h
	jnz	428153h

l00428136:
	mov	eax,10Bh
	cmp	[ecx+18h],ax
	jnz	428153h

l00428141:
	cmp	dword ptr [ecx+74h],0Eh
	jbe	428153h

l00428147:
	cmp	dword ptr [ecx+0E8h],0h
	jz	428153h

l00428150:
	mov	al,1h
	ret

l00428153:
	xor	al,al
	ret
00428156                   68 62 81 42 00 FF 15 68 10 43       hb.B...h.C
00428160 00 C3 55 8B EC 8B 45 08 8B 00 81 38 63 73 6D E0 ..U...E....8csm.
00428170 75 25 83 78 10 03 75 1F 8B 40 14 3D 20 05 93 19 u%.x..u..@.= ...
00428180 74 1B 3D 21 05 93 19 74 14 3D 22 05 93 19 74 0D t.=!...t.="...t.
00428190 3D 00 40 99 01 74 06 33 C0 5D C2 04 00 E8 3F 50 =.@..t.3.]....?P
004281A0 00 00 CC                                        ...             

;; fn004281A3: 004281A3
;;   Called from:
;;     00428006 (in fn00427FEA)
;;     004280FB (in fn00427FEA)
fn004281A3 proc
	and	dword ptr [43B064h],0h
	ret

;; fn004281AB: 004281AB
;;   Called from:
;;     00428212 (in fn004281F8)
fn004281AB proc
	push	ebp
	mov	ebp,esp
	sub	esp,14h
	and	dword ptr [ebp-0Ch],0h
	lea	eax,[ebp-0Ch]
	and	dword ptr [ebp-8h],0h
	push	eax
	call	dword ptr [431000h]
	mov	eax,[ebp-8h]
	xor	eax,[ebp-0Ch]
	mov	[ebp-4h],eax
	call	dword ptr [431088h]
	xor	[ebp-4h],eax
	call	dword ptr [431084h]
	xor	[ebp-4h],eax
	lea	eax,[ebp-14h]
	push	eax
	call	dword ptr [431080h]
	mov	eax,[ebp-10h]
	lea	ecx,[ebp-4h]
	xor	eax,[ebp-14h]
	xor	eax,[ebp-4h]
	xor	eax,ecx
	leave
	ret

;; fn004281F8: 004281F8
;;   Called from:
;;     00427BAE (in Win32CrtStartup)
fn004281F8 proc
	mov	ecx,[43A008h]
	push	esi
	push	edi
	mov	edi,0BB40E64Eh
	mov	esi,0FFFF0000h
	cmp	ecx,edi
	jz	428212h

l0042820E:
	test	esi,ecx
	jnz	428238h

l00428212:
	call	4281ABh
	mov	ecx,eax
	cmp	ecx,edi
	jnz	428224h

l0042821D:
	mov	ecx,0BB40E64Fh
	jmp	428232h

l00428224:
	test	esi,ecx
	jnz	428232h

l00428228:
	or	eax,4711h
	shl	eax,10h
	or	ecx,eax

l00428232:
	mov	[43A008h],ecx

l00428238:
	not	ecx
	pop	edi
	mov	[43A004h],ecx
	pop	esi
	ret
00428243          B8 00 40 00 00 C3 68 68 B0 43 00 FF 15    ..@...hh.C...
00428250 60 10 43 00 C3                                  `.C..           

;; fn00428255: 00428255
;;   Called from:
;;     00427775 (in fn00427760)
;;     00427782 (in fn00427760)
;;     0042778D (in fn00427760)
;;     00427904 (in fn004278EF)
;;     0042790C (in fn004278EF)
fn00428255 proc
	mov	al,1h
	ret
00428258                         68 00 00 03 00 68 00 00         h....h..
00428260 01 00 6A 00 E8 08 50 00 00 83 C4 0C 85 C0 75 01 ..j...P.......u.
00428270 C3 6A 07 E8 72 FD FF FF CC B8 70 B0 43 00 C3 B8 .j..r.....p.C...
00428280 78 B0 43 00 C3 E8 EF FF FF FF 8B 48 04 83 08 04 x.C........H....
00428290 89 48 04 E8 E7 FF FF FF 8B 48 04 83 08 02 89 48 .H.......H.....H
004282A0 04 C3 33 C0 39 05 14 A0 43 00 0F 94 C0 C3       ..3.9...C.....  

;; fn004282AE: 004282AE
;;   Called from:
;;     00427AC4 (in Win32CrtStartup)
fn004282AE proc
	mov	eax,43B2ACh
	ret

;; fn004282B4: 004282B4
;;   Called from:
;;     00427AEC (in Win32CrtStartup)
fn004282B4 proc
	mov	eax,43B2A8h
	ret
004282BA                               53 56 BE 5C 48 43           SV.\HC
004282C0 00 BB 5C 48 43 00 3B F3 73 19 57 8B 3E 85 FF 74 ..\HC.;.s.W.>..t
004282D0 0A 8B CF FF 15 E0 12 43 00 FF D7 83 C6 04 3B F3 .......C......;.
004282E0 72 E9 5F 5E 5B C3 53 56 BE 64 48 43 00 BB 64 48 r._^[.SV.dHC..dH
004282F0 43 00 3B F3 73 19 57 8B 3E 85 FF 74 0A 8B CF FF C.;.s.W.>..t....
00428300 15 E0 12 43 00 FF D7 83 C6 04 3B F3 72 E9 5F 5E ...C......;.r._^
00428310 5B C3 CC CC CC CC CC CC CC CC CC CC CC CC CC CC [...............

;; fn00428320: 00428320
;;   Called from:
;;     00428F21 (in fn00428DE0)
fn00428320 proc
	mov	eax,[esp+4h]
	push	esi
	push	edi
	mov	edi,[esp+14h]
	mov	esi,ecx
	mov	ecx,[esp+18h]
	cmp	edi,ecx
	jnz	428368h

l00428334:
	mov	ecx,[esp+10h]
	sub	ecx,eax
	cmp	dword ptr [esi+14h],10h
	jc	428354h

l00428340:
	mov	edx,[esi]
	sub	eax,edx
	push	ecx
	push	eax
	mov	ecx,esi
	call	410CF0h
	pop	edi
	mov	eax,esi
	pop	esi
	ret	14h

l00428354:
	mov	edx,esi
	push	ecx
	sub	eax,edx
	mov	ecx,esi
	push	eax
	call	410CF0h
	pop	edi
	mov	eax,esi
	pop	esi
	ret	14h

l00428368:
	mov	edx,[esp+10h]
	sub	edx,eax
	cmp	dword ptr [esi+14h],10h
	push	ebx
	jc	428379h

l00428375:
	mov	ebx,[esi]
	jmp	42837Bh

l00428379:
	mov	ebx,esi

l0042837B:
	sub	ecx,edi
	sub	eax,ebx
	push	ecx
	push	edi
	push	edx
	push	eax
	mov	ecx,esi
	call	4167E0h
	pop	ebx
	pop	edi
	mov	eax,esi
	pop	esi
	ret	14h
00428392       CC CC CC CC CC CC CC CC CC CC CC CC CC CC   ..............

;; fn004283A0: 004283A0
;;   Called from:
;;     00428E63 (in fn00428DE0)
fn004283A0 proc
	mov	eax,[esp+4h]
	mov	edx,[esp+10h]
	push	esi
	mov	esi,ecx
	mov	ecx,[esp+0Ch]
	sub	ecx,eax
	push	edi
	mov	edi,[esp+14h]
	sar	ecx,1h
	cmp	edi,edx
	jnz	4283EEh

l004283BC:
	cmp	dword ptr [esi+14h],8h
	jc	4283D8h

l004283C2:
	mov	edx,[esi]
	sub	eax,edx
	push	ecx
	sar	eax,1h
	mov	ecx,esi
	push	eax
	call	428F60h
	pop	edi
	mov	eax,esi
	pop	esi
	ret	14h

l004283D8:
	mov	edx,esi
	sub	eax,edx
	push	ecx
	sar	eax,1h
	mov	ecx,esi
	push	eax
	call	428F60h
	pop	edi
	mov	eax,esi
	pop	esi
	ret	14h

l004283EE:
	cmp	dword ptr [esi+14h],8h
	push	ebx
	jc	4283F9h

l004283F5:
	mov	ebx,[esi]
	jmp	4283FBh

l004283F9:
	mov	ebx,esi

l004283FB:
	sub	edx,edi
	sub	eax,ebx
	sar	edx,1h
	push	edx
	push	edi
	push	ecx
	sar	eax,1h
	mov	ecx,esi
	push	eax
	call	4294A0h
	pop	ebx
	pop	edi
	mov	eax,esi
	pop	esi
	ret	14h
00428416                   CC CC CC CC CC CC CC CC CC CC       ..........
00428420 C2 04 00 CC CC CC CC CC CC CC CC CC CC CC CC CC ................

;; fn00428430: 00428430
;;   Called from:
;;     0042A3F8 (in fn0042A390)
;;     0042A4B2 (in fn0042A450)
;;     0042A7C6 (in fn0042A710)
fn00428430 proc
	mov	eax,[esp+4h]
	mov	[ecx],eax
	mov	eax,[esp+8h]
	mov	[ecx+4h],eax
	mov	eax,ecx
	ret	8h
00428442       CC CC CC CC CC CC CC CC CC CC CC CC CC CC   ..............
00428450 55 8B EC 6A FF 68 C0 DA 42 00 64 A1 00 00 00 00 U..j.h..B.d.....
00428460 50 56 A1 08 A0 43 00 33 C5 50 8D 45 F4 64 A3 00 PV...C.3.P.E.d..
00428470 00 00 00 8B F1 8D 46 04 C7 06 84 13 43 00 0F 57 ......F.....C..W
00428480 C0 50 66 0F D6 00 8B 45 08 83 C0 04 50 FF 15 D0 .Pf....E....P...
00428490 11 43 00 83 C4 08 C7 06 E4 13 43 00 8B C6 8B 4D .C........C....M
004284A0 F4 64 89 0D 00 00 00 00 59 5E 8B E5 5D C2 04 00 .d......Y^..]...
004284B0 55 8B EC 6A FF 68 38 01 43 00 64 A1 00 00 00 00 U..j.h8.C.d.....
004284C0 50 51 56 57 A1 08 A0 43 00 33 C5 50 8D 45 F4 64 PQVW...C.3.P.E.d
004284D0 A3 00 00 00 00 8B F9 89 7D F0 8B 75 08 8D 47 04 ........}..u..G.
004284E0 0F 57 C0 C7 07 84 13 43 00 50 66 0F D6 00 8D 46 .W.....C.Pf....F
004284F0 04 50 FF 15 D0 11 43 00 83 C4 08 C7 07 F4 13 43 .P....C........C
00428500 00 8D 4F 14 8B 46 0C 89 47 0C 8B 46 10 89 47 10 ..O..F..G..F..G.
00428510 8D 46 14 6A FF 6A 00 C7 41 10 00 00 00 00 C7 41 .F.j.j..A......A
00428520 14 0F 00 00 00 50 C7 45 FC 00 00 00 00 C6 01 00 .....P.E........
00428530 E8 8B 8E FE FF 8B C7 8B 4D F4 64 89 0D 00 00 00 ........M.d.....
00428540 00 59 5F 5E 8B E5 5D C2 04 00 CC CC CC CC CC CC .Y_^..].........

;; fn00428550: 00428550
;;   Called from:
;;     00428E8B (in fn00428DE0)
;;     00428F49 (in fn00428DE0)
fn00428550 proc
	sub	esp,8h
	mov	eax,[esp+14h]
	xorps	xmm0,xmm0
	push	esi
	mov	esi,ecx
	mov	[esp+4h],esi
	lea	edx,[esi+4h]
	mov	[esp+4h],eax
	lea	eax,[esp+4h]
	push	edx
	mov	dword ptr [esi],431384h
	push	eax
	movq	qword ptr [edx],xmm0
	mov	byte ptr [esp+10h],1h
	call	dword ptr [4311D0h]
	mov	eax,[esp+18h]
	add	esp,8h
	mov	dword ptr [esi],4313F4h
	mov	[esi+0Ch],eax
	mov	eax,[esp+14h]
	mov	[esi+10h],eax
	mov	eax,esi
	mov	dword ptr [esi+24h],0h
	mov	dword ptr [esi+28h],0Fh
	mov	byte ptr [esi+14h],0h
	pop	esi
	add	esp,8h
	ret	0Ch
004285B5                CC CC CC CC CC CC CC CC CC CC CC      ...........
004285C0 FF 31 E8 CB 4C 00 00 59 C3 CC CC CC CC CC CC CC .1..L..Y........
004285D0 55 8B EC 6A FF 68 E0 DA 42 00 64 A1 00 00 00 00 U..j.h..B.d.....
004285E0 50 A1 08 A0 43 00 33 C5 50 8D 45 F4 64 A3 00 00 P...C.3.P.E.d...
004285F0 00 00 8D 41 04 C7 01 84 13 43 00 50 FF 15 C8 11 ...A.....C.P....
00428600 43 00 83 C4 04 8B 4D F4 64 89 0D 00 00 00 00 59 C.....M.d......Y
00428610 8B E5 5D C3 CC CC CC CC CC CC CC CC CC CC CC CC ..].............
00428620 55 8B EC 6A FF 68 60 01 43 00 64 A1 00 00 00 00 U..j.h`.C.d.....
00428630 50 56 A1 08 A0 43 00 33 C5 50 8D 45 F4 64 A3 00 PV...C.3.P.E.d..
00428640 00 00 00 8B F1 C7 06 F4 13 43 00 8B 46 28 C7 45 .........C..F(.E
00428650 FC 00 00 00 00 83 F8 10 72 0F 40 6A 01 50 FF 76 ........r.@j.P.v
00428660 14 E8 4A 03 00 00 83 C4 0C 8D 46 04 C7 45 FC FF ..J.......F..E..
00428670 FF FF FF 50 C7 06 84 13 43 00 FF 15 C8 11 43 00 ...P....C.....C.
00428680 83 C4 04 8B 4D F4 64 89 0D 00 00 00 00 59 5E 8B ....M.d......Y^.
00428690 E5 5D C3 CC CC CC CC CC CC CC CC CC CC CC CC CC .]..............

;; fn004286A0: 004286A0
fn004286A0 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42DAC0h
	mov	eax,fs:[0000h]
	push	eax
	push	esi
	mov	eax,[43A008h]
	xor	eax,ebp
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	esi,ecx
	lea	eax,[esi+4h]
	mov	dword ptr [esi],431384h
	push	eax
	call	dword ptr [4311C8h]
	add	esp,4h
	test	byte ptr [ebp+8h],1h
	jz	4286E9h

l004286DE:
	push	0Ch
	push	esi
	call	42763Fh
	add	esp,8h

l004286E9:
	mov	eax,esi
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	esi
	mov	esp,ebp
	pop	ebp
	ret	4h
004286FD                                        CC CC CC              ...
00428700 55 8B EC 6A FF 68 60 01 43 00 64 A1 00 00 00 00 U..j.h`.C.d.....
00428710 50 56 A1 08 A0 43 00 33 C5 50 8D 45 F4 64 A3 00 PV...C.3.P.E.d..
00428720 00 00 00 8B F1 C7 06 F4 13 43 00 8B 46 28 C7 45 .........C..F(.E
00428730 FC 00 00 00 00 83 F8 10 72 0F 40 6A 01 50 FF 76 ........r.@j.P.v
00428740 14 E8 6A 02 00 00 83 C4 0C 8D 46 04 C7 45 FC FF ..j.......F..E..
00428750 FF FF FF 50 C7 06 84 13 43 00 FF 15 C8 11 43 00 ...P....C.....C.
00428760 83 C4 04 F6 45 08 01 74 0B 6A 2C 56 E8 CE EE FF ....E..t.j,V....
00428770 FF 83 C4 08 8B C6 8B 4D F4 64 89 0D 00 00 00 00 .......M.d......
00428780 59 5E 8B E5 5D C2 04 00 CC CC CC CC CC CC CC CC Y^..]...........

;; fn00428790: 00428790
;;   Called from:
;;     00428B79 (in fn00428AAB)
fn00428790 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	430180h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,10h
	push	ebx
	push	esi
	push	edi
	mov	eax,[43A008h]
	xor	eax,ebp
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	[ebp-10h],esp
	mov	esi,ecx
	mov	[ebp-18h],esi
	mov	eax,[ebp+8h]
	cmp	eax,0FEh
	jbe	4287CDh

l004287C8:
	call	403860h

l004287CD:
	mov	ebx,[esi+14h]
	mov	edi,eax
	or	edi,0Fh
	mov	[ebp-1Ch],ebx
	cmp	edi,0FEh
	jbe	4287E1h

l004287DD:
	mov	edi,eax
	jmp	428805h

l004287E1:
	mov	eax,0AAAAAAABh
	mov	ecx,ebx
	mul	edi
	shr	ecx,1h
	shr	edx,1h
	cmp	ecx,edx
	jbe	428805h

l004287F2:
	mov	eax,0FFFFFFFEh
	lea	edi,[ecx+ebx]
	sub	eax,ecx
	cmp	ebx,eax
	jbe	428805h

l00428800:
	mov	edi,0FFFFFFFEh

l00428805:
	lea	eax,[edi+1h]
	mov	dword ptr [ebp-4h],0h
	push	eax
	mov	ecx,esi
	call	428A40h
	mov	ecx,eax
	jmp	428840h
0042881B                                  8B 45 08 8B 4D            .E..M
00428820 E8 89 45 08 40 50 E8 15 02 00 00 89 45 EC B8 34 ..E.@P......E..4
00428830 88 42 00 C3 8B 75 E8 8B 5D E4 8B 7D 08 8B 4D EC .B...u..]..}..M.

l00428840:
	mov	eax,[esi+10h]
	inc	eax
	mov	[ebp-14h],ecx
	cmp	dword ptr [esi+14h],10h
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	push	eax
	jc	42886Fh

l00428855:
	push	dword ptr [esi]
	push	ecx
	call	42D1CFh
	push	1h
	lea	eax,[ebx+1h]
	push	eax
	push	dword ptr [esi]
	call	4289B0h
	add	esp,18h
	jmp	428879h

l0042886F:
	push	esi
	push	ecx
	call	42D1CFh
	add	esp,0Ch

l00428879:
	mov	eax,[ebp-14h]
	mov	[esi],eax
	mov	[esi+14h],edi
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	4h
00428895                CC CC CC CC CC CC CC CC CC CC CC      ...........

;; fn004288A0: 004288A0
;;   Called from:
;;     0042919B (in fn004290A0)
;;     00429606 (in fn004294A0)
;;     0042A0F8 (in fn0042A070)
;;     0042A1D9 (in fn0042A170)
;;     0042B12B (in fn0042B120)
fn004288A0 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	4301A0h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,10h
	push	ebx
	push	esi
	push	edi
	mov	eax,[43A008h]
	xor	eax,ebp
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	[ebp-10h],esp
	mov	esi,ecx
	mov	[ebp-18h],esi
	mov	eax,[ebp+8h]
	cmp	eax,7FFFFFFEh
	jbe	4288DFh

l004288DA:
	call	428A20h

l004288DF:
	mov	ebx,[esi+14h]
	mov	edi,eax
	or	edi,7h
	mov	[ebp-1Ch],ebx
	cmp	edi,7FFFFFFEh
	jbe	4288F6h

l004288F2:
	mov	edi,eax
	jmp	42891Ah

l004288F6:
	mov	eax,0AAAAAAABh
	mov	ecx,ebx
	mul	edi
	shr	ecx,1h
	shr	edx,1h
	cmp	ecx,edx
	jbe	42891Ah

l00428907:
	mov	eax,7FFFFFFEh
	lea	edi,[ecx+ebx]
	sub	eax,ecx
	cmp	ebx,eax
	jbe	42891Ah

l00428915:
	mov	edi,7FFFFFFEh

l0042891A:
	lea	eax,[edi+1h]
	mov	dword ptr [ebp-4h],0h
	push	eax
	mov	ecx,esi
	call	428AA0h
	mov	ecx,eax
	jmp	428955h
00428930 8B 45 08 8B 4D E8 89 45 08 40 50 E8 60 01 00 00 .E..M..E.@P.`...
00428940 89 45 EC B8 49 89 42 00 C3 8B 75 E8 8B 5D E4 8B .E..I.B...u..]..
00428950 7D 08 8B 4D EC                                  }..M.           

l00428955:
	cmp	dword ptr [esi+14h],8h
	mov	eax,[esi+10h]
	mov	[ebp-14h],ecx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	lea	eax,[0002h+eax*2]
	push	eax
	jc	42898Ah

l00428970:
	push	dword ptr [esi]
	push	ecx
	call	42D1CFh
	push	2h
	lea	eax,[ebx+1h]
	push	eax
	push	dword ptr [esi]
	call	4289B0h
	add	esp,18h
	jmp	428994h

l0042898A:
	push	esi
	push	ecx
	call	42D1CFh
	add	esp,0Ch

l00428994:
	mov	eax,[ebp-14h]
	mov	[esi],eax
	mov	[esi+14h],edi
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	4h

;; fn004289B0: 004289B0
;;   Called from:
;;     00428865 (in fn00428790)
;;     00428980 (in fn004288A0)
;;     00429C6E (in fn00429C20)
;;     00429F6B (in fn00429F30)
;;     00429F89 (in fn00429F30)
;;     00429FA6 (in fn00429F30)
;;     0042A6DE (in fn0042A600)
;;     0042AC4B (in fn0042AB60)
;;     0042B2BA (in fn0042B210)
;;     0042B78E (in fn0042B630)
;;     0042B7B5 (in fn0042B630)
;;     0042B7FB (in fn0042B630)
;;     0042B950 (in fn0042B830)
;;     0042B997 (in fn0042B830)
;;     0042B9C1 (in fn0042B830)
;;     0042C1D9 (in fn0042C020)
;;     0042CF02 (in fn0042CD80)
;;     0042CF2C (in fn0042CD80)
fn004289B0 proc
	or	eax,0FFh
	mov	ecx,[esp+8h]
	xor	edx,edx
	div	dword ptr [esp+0Ch]
	cmp	ecx,eax
	jbe	4289C7h

l004289C1:
	jmp	dword ptr [431290h]

l004289C7:
	imul	ecx,[esp+0Ch]
	cmp	ecx,1000h
	jc	428A07h

l004289D4:
	mov	eax,[esp+4h]
	test	al,1Fh
	jz	4289E2h

l004289DC:
	jmp	dword ptr [431290h]

l004289E2:
	mov	ecx,[eax-4h]
	cmp	ecx,eax
	jc	4289EFh

l004289E9:
	jmp	dword ptr [431290h]

l004289EF:
	sub	eax,ecx
	cmp	eax,4h
	jnc	4289FCh

l004289F6:
	jmp	dword ptr [431290h]

l004289FC:
	cmp	eax,23h
	jbe	428A0Bh

l00428A01:
	jmp	dword ptr [431290h]

l00428A07:
	mov	ecx,[esp+4h]

l00428A0B:
	push	ecx
	call	427E3Eh
	pop	ecx
	ret
00428A13          CC CC CC CC CC CC CC CC CC CC CC CC CC    .............

;; fn00428A20: 00428A20
;;   Called from:
;;     004288DA (in fn004288A0)
;;     0042913F (in fn004290A0)
;;     00429557 (in fn004294A0)
fn00428A20 proc
	push	431454h
	call	dword ptr [431194h]
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h

;; fn00428A30: 00428A30
;;   Called from:
;;     00428A2F (in fn00428A20)
;;     00428BD0 (in fn00428AAB)
;;     00428F91 (in fn00428F60)
;;     004290D4 (in fn004290A0)
;;     004290E4 (in fn004290A0)
;;     00429524 (in fn004294A0)
;;     0042A14B (in fn0042A070)
;;     0042A150 (in fn0042A070)
fn00428A30 proc
	push	431464h
	call	dword ptr [43119Ch]
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h

;; fn00428A40: 00428A40
;;   Called from:
;;     00428812 (in fn00428790)
fn00428A40 proc
	mov	eax,[esp+4h]
	test	eax,eax
	jnz	428A4Bh

l00428A48:
	ret	4h

;; fn00428A4B: 00428A4B
;;   Called from:
;;     00428A46 (in fn00428A40)
;;     00428A46 (in fn00428A30)
;;     00428A46 (in fn00428A30)
fn00428A4B proc
	cmp	eax,1000h
	jc	428A80h

l00428A52:
	lea	ecx,[eax+23h]
	cmp	ecx,eax
	ja	428A5Fh

l00428A59:
	call	dword ptr [4311A0h]

l00428A5F:
	push	ecx
	call	427511h
	mov	ecx,eax
	add	esp,4h
	test	ecx,ecx
	jnz	428A74h

l00428A6E:
	call	dword ptr [431290h]

l00428A74:
	lea	eax,[ecx+23h]
	and	eax,0E0h
	mov	[eax-4h],ecx
	ret	4h

l00428A80:
	push	eax
	call	427511h
	add	esp,4h
	test	eax,eax
	jnz	428A48h

l00428A8D:
	call	dword ptr [431290h]
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h

;; fn00428AA0: 00428AA0
;;   Called from:
;;     00428927 (in fn004288A0)
fn00428AA0 proc
	mov	eax,[esp+4h]
	test	eax,eax
	jnz	428AABh

l00428AA8:
	ret	4h

;; fn00428AAB: 00428AAB
;;   Called from:
;;     00428AA6 (in fn00428AA0)
;;     00428AA6 (in fn00428A4B)
;;     00428AA6 (in fn00428A4B)
fn00428AAB proc
	cmp	eax,7FFFFFFFh
	jbe	428AB8h

l00428AB2:
	call	dword ptr [4311A0h]

l00428AB8:
	add	eax,eax
	cmp	eax,1000h
	jc	428AEFh

l00428AC1:
	lea	ecx,[eax+23h]
	cmp	ecx,eax
	ja	428ACEh

l00428AC8:
	call	dword ptr [4311A0h]

l00428ACE:
	push	ecx
	call	427511h
	mov	ecx,eax
	add	esp,4h
	test	ecx,ecx
	jnz	428AE3h

l00428ADD:
	call	dword ptr [431290h]

l00428AE3:
	lea	eax,[ecx+23h]
	and	eax,0E0h
	mov	[eax-4h],ecx
	ret	4h

l00428AEF:
	push	eax
	call	427511h
	add	esp,4h
	test	eax,eax
	jnz	428AA8h

l00428AFC:
	call	dword ptr [431290h]
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	push	ebx
	mov	ebx,[esp+8h]
	push	esi
	mov	esi,ecx
	mov	ecx,[esp+10h]
	mov	eax,[ebx+10h]
	cmp	eax,ecx
	jc	428BD0h

l00428B27:
	mov	edx,[esi+10h]
	sub	eax,ecx
	push	ebp
	mov	ebp,[esp+18h]
	cmp	eax,ebp
	cmovc	ebp,eax

l00428B36:
	mov	eax,edx
	not	eax
	cmp	eax,ebp
	jbe	428BD5h

l00428B42:
	push	edi
	lea	edi,[edx+ebp]
	test	ebp,ebp
	jz	428BC7h

l00428B4A:
	test	edi,edi
	jnz	428B71h

l00428B4E:
	mov	[esi+10h],edi
	cmp	dword ptr [esi+14h],10h
	jc	428B65h

l00428B57:
	mov	eax,[esi]
	pop	edi
	pop	ebp
	mov	byte ptr [eax],0h
	mov	eax,esi
	pop	esi
	pop	ebx
	ret	0Ch

l00428B65:
	pop	edi
	mov	eax,esi
	pop	ebp
	pop	esi
	pop	ebx
	mov	byte ptr [eax],0h
	ret	0Ch

l00428B71:
	cmp	[esi+14h],edi
	jnc	428B82h

l00428B76:
	push	edi
	mov	ecx,esi
	call	428790h
	mov	ecx,[esp+18h]

l00428B82:
	cmp	dword ptr [ebx+14h],10h
	jc	428B8Ah

l00428B88:
	mov	ebx,[ebx]

l00428B8A:
	cmp	dword ptr [esi+14h],10h
	jc	428B94h

l00428B90:
	mov	edx,[esi]
	jmp	428B96h

l00428B94:
	mov	edx,esi

l00428B96:
	lea	eax,[ebx+ecx]
	push	ebp
	push	eax
	mov	eax,[esi+10h]
	add	eax,edx
	push	eax
	call	42D1CFh
	add	esp,0Ch
	mov	[esi+10h],edi
	cmp	dword ptr [esi+14h],10h
	jc	428BC1h

l00428BB2:
	mov	eax,[esi]
	mov	byte ptr [eax+edi],0h
	mov	eax,esi
	pop	edi
	pop	ebp
	pop	esi
	pop	ebx
	ret	0Ch

l00428BC1:
	mov	eax,esi
	mov	byte ptr [eax+edi],0h

l00428BC7:
	pop	edi
	pop	ebp
	mov	eax,esi
	pop	esi
	pop	ebx
	ret	0Ch

l00428BD0:
	call	428A30h

l00428BD5:
	call	403860h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h

;; fn00428BE0: 00428BE0
;;   Called from:
;;     0040410E (in fn00404080)
;;     00404A54 (in fn00404080)
;;     00404AA6 (in fn00404080)
;;     00404BEA (in fn00404080)
;;     0041440D (in fn004143E0)
;;     00428BDF (in fn00428AAB)
fn00428BE0 proc
	push	ebp
	lea	ebp,[esp-204h]
	sub	esp,204h
	push	0FFh
	push	4301C8h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,10h
	mov	eax,[43A008h]
	xor	eax,ebp
	mov	[ebp+200h],eax
	push	ebx
	push	esi
	push	edi
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	edi,[ebp+210h]
	mov	ecx,[ebp+214h]
	mov	edx,[ebp+218h]
	mov	ebx,[ebp+20Ch]
	mov	[ebp-10h],ecx
	mov	[ebp-14h],edx
	test	edi,edi
	jnz	428C4Fh

l00428C3B:
	mov	ecx,ebx
	lea	esi,[ecx+1h]

l00428C40:
	mov	al,[ecx]
	inc	ecx
	test	al,al
	jnz	428C40h

l00428C47:
	sub	ecx,esi
	lea	edi,[ecx+ebx]
	mov	ecx,[ebp-10h]

l00428C4F:
	cmp	ebx,edi
	jz	428CBDh

l00428C53:
	mov	eax,edi
	sub	eax,ebx
	lea	eax,[eax+eax*2]
	mov	[ebp-18h],eax
	cmp	eax,100h
	jbe	428CA6h

l00428C64:
	xor	ecx,ecx
	mov	edx,2h
	mul	edx
	seto	cl
	neg	ecx
	or	ecx,eax
	push	ecx
	call	42D289h
	mov	esi,eax
	mov	[ebp-1Ch],esi
	push	dword ptr [ebp-14h]
	mov	eax,[ebp-18h]
	push	dword ptr [ebp-10h]
	mov	dword ptr [ebp-4h],0h
	lea	eax,[esi+eax*2]
	push	eax
	push	esi
	push	edi
	push	ebx
	call	428DE0h
	push	esi
	call	42D292h
	add	esp,20h
	jmp	428CBDh

l00428CA6:
	push	edx
	push	ecx
	lea	eax,[ebp+200h]
	push	eax
	lea	eax,[ebp+0h]
	push	eax
	push	edi
	push	ebx
	call	428DE0h
	add	esp,18h

l00428CBD:
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	ecx,[ebp+200h]
	xor	ecx,ebp
	call	427500h
	lea	esp,[ebp+204h]
	pop	ebp
	ret
00428CE0 55 8D AC 24 FC FE FF FF 81 EC 04 01 00 00 6A FF U..$..........j.
00428CF0 68 F8 01 43 00 64 A1 00 00 00 00 50 83 EC 10 A1 h..C.d.....P....
00428D00 08 A0 43 00 33 C5 89 85 00 01 00 00 53 56 57 50 ..C.3.......SVWP
00428D10 8D 45 F4 64 A3 00 00 00 00 8B BD 10 01 00 00 8B .E.d............
00428D20 8D 14 01 00 00 8B 95 18 01 00 00 8B 9D 0C 01 00 ................
00428D30 00 89 4D F0 89 55 EC 85 FF 75 1A 8B CB 8D 71 02 ..M..U...u....q.
00428D40 66 8B 01 83 C1 02 66 85 C0 75 F5 2B CE D1 F9 8D f.....f..u.+....
00428D50 3C 4B 8B 4D F0 3B DF 74 5F 8B C7 2B C3 D1 F8 8D <K.M.;.t_..+....
00428D60 04 85 04 00 00 00 89 45 E8 3D 00 01 00 00 76 31 .......E.=....v1
00428D70 50 E8 13 45 00 00 8B F0 89 75 E4 FF 75 EC 8B 45 P..E.....u..u..E
00428D80 E8 FF 75 F0 03 C6 C7 45 FC 00 00 00 00 50 56 57 ..u....E.....PVW
00428D90 53 E8 0A 01 00 00 56 E8 F6 44 00 00 83 C4 20 EB S.....V..D.... .
00428DA0 17 52 51 8D 85 00 01 00 00 50 8D 45 00 50 57 53 .RQ......P.E.PWS
00428DB0 E8 EB 00 00 00 83 C4 18 8B 4D F4 64 89 0D 00 00 .........M.d....
00428DC0 00 00 59 5F 5E 5B 8B 8D 00 01 00 00 33 CD E8 2D ..Y_^[......3..-
00428DD0 E7 FF FF 8D A5 04 01 00 00 5D C3 CC CC CC CC CC .........]......

;; fn00428DE0: 00428DE0
;;   Called from:
;;     00428C96 (in fn00428BE0)
;;     00428CB5 (in fn00428BE0)
fn00428DE0 proc
	sub	esp,40h
	mov	eax,[43A008h]
	xor	eax,esp
	mov	[esp+3Ch],eax
	mov	eax,[esp+50h]
	xorps	xmm0,xmm0
	mov	ecx,[esp+48h]
	mov	edx,[esp+58h]
	push	ebx
	mov	ebx,[esp+50h]
	push	ebp
	push	esi
	mov	esi,[esp+50h]
	lea	ebp,[esp+0Ch]
	push	edi
	mov	edi,[esp+64h]
	push	ebp
	push	eax
	push	ebx
	lea	eax,[esp+20h]
	movq	qword ptr [esp+24h],xmm0
	push	eax
	push	ecx
	push	esi
	lea	eax,[esp+30h]
	mov	ecx,edx
	push	eax
	call	dword ptr [431170h]
	mov	esi,eax
	test	esi,esi
	jnz	428E7Bh

l00428E34:
	mov	edx,[edi+14h]
	cmp	edx,8h
	jc	428E40h

l00428E3C:
	mov	ecx,[edi]
	jmp	428E42h

l00428E40:
	mov	ecx,edi

l00428E42:
	mov	eax,[edi+10h]
	add	eax,eax
	add	ecx,eax
	cmp	edx,8h
	jc	428E52h

l00428E4E:
	mov	edx,[edi]
	jmp	428E54h

l00428E52:
	mov	edx,edi

l00428E54:
	push	dword ptr [esp+14h]
	add	eax,edx
	push	dword ptr [esp+14h]
	push	ebx
	push	ecx
	push	eax
	mov	ecx,edi
	call	4283A0h
	mov	ecx,[esp+4Ch]
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	xor	ecx,esp
	call	427500h
	add	esp,40h
	ret

l00428E7B:
	push	4313FCh
	call	42C310h
	push	eax
	push	esi
	lea	ecx,[esp+2Ch]
	call	428550h
	push	43730Ch
	lea	eax,[esp+24h]
	push	eax
	call	42D1B7h
	int	3h
	sub	esp,40h
	mov	eax,[43A008h]
	xor	eax,esp
	mov	[esp+3Ch],eax
	mov	eax,[esp+50h]
	xorps	xmm0,xmm0
	mov	ecx,[esp+48h]
	mov	edx,[esp+58h]
	push	ebx
	mov	ebx,[esp+50h]
	push	ebp
	push	esi
	mov	esi,[esp+50h]
	lea	ebp,[esp+0Ch]
	push	edi
	mov	edi,[esp+64h]
	push	ebp
	push	eax
	push	ebx
	lea	eax,[esp+20h]
	movq	qword ptr [esp+24h],xmm0
	push	eax
	push	ecx
	push	esi
	lea	eax,[esp+30h]
	mov	ecx,edx
	push	eax
	call	dword ptr [43116Ch]
	mov	esi,eax
	test	esi,esi
	jnz	428F39h

l00428EF4:
	mov	eax,[edi+14h]
	cmp	eax,10h
	jc	428F00h

l00428EFC:
	mov	ecx,[edi]
	jmp	428F02h

l00428F00:
	mov	ecx,edi

l00428F02:
	mov	edx,[edi+10h]
	add	ecx,edx
	cmp	eax,10h
	jc	428F10h

l00428F0C:
	mov	eax,[edi]
	jmp	428F12h

l00428F10:
	mov	eax,edi

l00428F12:
	push	dword ptr [esp+14h]
	add	eax,edx
	push	dword ptr [esp+14h]
	push	ebx
	push	ecx
	push	eax
	mov	ecx,edi
	call	428320h
	mov	ecx,[esp+4Ch]
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	xor	ecx,esp
	call	427500h
	add	esp,40h
	ret

l00428F39:
	push	431428h
	call	42C310h
	push	eax
	push	esi
	lea	ecx,[esp+2Ch]
	call	428550h
	push	43730Ch
	lea	eax,[esp+24h]
	push	eax
	call	42D1B7h
	int	3h
	int	3h
	int	3h

;; fn00428F60: 00428F60
;;   Called from:
;;     004283CC (in fn004283A0)
;;     004283E2 (in fn004283A0)
;;     00428F5F (in fn00428DE0)
;;     0042A0B9 (in fn0042A070)
fn00428F60 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	430220h
	mov	eax,fs:[0000h]
	push	eax
	push	ebx
	push	esi
	push	edi
	mov	eax,[43A008h]
	xor	eax,ebp
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	esi,ecx
	mov	edi,[esi+10h]
	mov	edx,[ebp+8h]
	cmp	edi,edx
	jnc	428F96h

l00428F91:
	call	428A30h

l00428F96:
	mov	ebx,[ebp+0Ch]
	mov	eax,edi
	sub	eax,edx
	cmp	eax,ebx
	ja	428FBEh

l00428FA1:
	cmp	dword ptr [esi+14h],8h
	mov	[esi+10h],edx
	jc	428FB4h

l00428FAA:
	mov	eax,[esi]
	xor	ecx,ecx
	mov	[eax+edx*2],cx
	jmp	429004h

l00428FB4:
	mov	eax,esi
	xor	ecx,ecx
	mov	[eax+edx*2],cx
	jmp	429004h

l00428FBE:
	test	ebx,ebx
	jz	429004h

l00428FC2:
	cmp	dword ptr [esi+14h],8h
	jc	428FCCh

l00428FC8:
	mov	eax,[esi]
	jmp	428FCEh

l00428FCC:
	mov	eax,esi

l00428FCE:
	lea	ecx,[eax+edx*2]
	sub	edi,ebx
	mov	eax,edi
	mov	dword ptr [ebp-4h],0h
	sub	eax,edx
	add	eax,eax
	push	eax
	lea	eax,[ecx+ebx*2]
	push	eax
	push	ecx
	call	dword ptr [4311D8h]
	add	esp,0Ch
	mov	[esi+10h],edi
	cmp	dword ptr [esi+14h],8h
	jc	428FFCh

l00428FF8:
	mov	eax,[esi]
	jmp	428FFEh

l00428FFC:
	mov	eax,esi

l00428FFE:
	xor	ecx,ecx
	mov	[eax+edi*2],cx

l00429004:
	mov	eax,esi
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	8h
0042901A                               CC CC CC CC CC CC           ......
00429020 51 8B 41 04 FF 31 8B C8 C7 44 24 04 00 00 00 00 Q.A..1...D$.....
00429030 FF 74 24 0C 8B 10 FF 52 08 8B 44 24 08 59 C2 04 .t$....R..D$.Y..
00429040 00 CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................

;; fn00429050: 00429050
;;   Called from:
;;     0042939E (in fn004290A0)
;;     004293F7 (in fn004290A0)
;;     0042942E (in fn004290A0)
;;     00429464 (in fn004290A0)
fn00429050 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42DAE0h
	mov	eax,fs:[0000h]
	push	eax
	mov	eax,[43A008h]
	xor	eax,ebp
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	eax,[ebp+10h]
	add	eax,eax
	push	eax
	push	dword ptr [ebp+0Ch]
	push	dword ptr [ebp+8h]
	call	dword ptr [4311D8h]
	add	esp,0Ch
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	mov	esp,ebp
	pop	ebp
	ret
00429096                   CC CC CC CC CC CC CC CC CC CC       ..........

;; fn004290A0: 004290A0
;;   Called from:
;;     00429501 (in fn004294A0)
fn004290A0 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	430240h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,0Ch
	push	ebx
	push	esi
	push	edi
	mov	eax,[43A008h]
	xor	eax,ebp
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	esi,ecx
	mov	eax,[esi+10h]
	mov	edi,[ebp+8h]
	cmp	eax,edi
	jnc	4290D9h

l004290D4:
	call	428A30h

l004290D9:
	mov	ebx,[ebp+10h]
	mov	edx,[ebp+14h]
	cmp	[ebx+10h],edx
	jnc	4290E9h

l004290E4:
	call	428A30h

l004290E9:
	mov	ecx,[ebp+0Ch]
	sub	eax,edi
	mov	[ebp+0Ch],eax
	lea	edi,[ebp-14h]
	cmp	[ebp+0Ch],ecx
	mov	[ebp-18h],eax
	lea	eax,[ebp-18h]
	cmovnc	eax,edi

l00429100:
	mov	[ebp-14h],ecx
	mov	ecx,[ebp+18h]
	lea	edi,[ebp-18h]
	mov	eax,[eax]
	mov	[ebp-10h],eax
	mov	eax,[ebx+10h]
	sub	eax,edx
	mov	[ebp-18h],ecx
	mov	[ebp-14h],eax
	cmp	[ebp-14h],ecx
	mov	[ebp+18h],eax
	lea	eax,[ebp+18h]
	cmovnc	eax,edi

l00429125:
	mov	edi,[ebp+8h]
	mov	ecx,[eax]
	mov	eax,[esi+10h]
	sub	eax,[ebp-10h]
	mov	[ebp-14h],eax
	mov	eax,ecx
	not	eax
	mov	[ebp+18h],ecx
	cmp	eax,[ebp-14h]
	ja	429144h

l0042913F:
	call	428A20h

l00429144:
	mov	ebx,[ebp-14h]
	mov	eax,[ebp-10h]
	add	ebx,ecx
	sub	[ebp+0Ch],eax
	cmp	[esi+10h],ebx
	mov	[ebp-14h],ebx
	mov	ebx,[ebp+10h]
	jnc	4291A9h

l0042915A:
	cmp	dword ptr [ebp-14h],0h
	jnz	42918Bh

l00429160:
	cmp	dword ptr [esi+14h],8h
	mov	dword ptr [esi+10h],0h
	jc	42917Ch

l0042916D:
	mov	edi,[esi]
	xor	edx,edx
	mov	[ebp-18h],edi
	mov	[edi],dx
	mov	edi,[ebp+8h]
	jmp	4291A6h

l0042917C:
	mov	edi,esi
	mov	[ebp-18h],esi
	xor	edx,edx
	mov	[edi],dx
	mov	edi,[ebp+8h]
	jmp	4291A6h

l0042918B:
	mov	edi,[ebp-14h]
	cmp	[esi+14h],edi
	mov	edi,[ebp+8h]
	jnc	4291A9h

l00429196:
	push	dword ptr [ebp-14h]
	mov	ecx,esi
	call	4288A0h
	mov	ecx,[ebp+18h]
	mov	eax,[ebp-10h]

l004291A6:
	mov	edx,[ebp+14h]

l004291A9:
	cmp	ecx,eax
	jnz	4291E6h

l004291AD:
	cmp	dword ptr [ebx+14h],8h
	jc	4291B5h

l004291B3:
	mov	ebx,[ebx]

l004291B5:
	cmp	dword ptr [esi+14h],8h
	jc	4291C2h

l004291BB:
	mov	eax,[esi]
	mov	[ebp+14h],eax
	jmp	4291C5h

l004291C2:
	mov	[ebp+14h],esi

l004291C5:
	lea	eax,[ecx+ecx]
	mov	dword ptr [ebp-4h],0h
	push	eax
	lea	eax,[ebx+edx*2]
	push	eax
	mov	eax,[ebp+14h]
	lea	eax,[eax+edi*2]
	push	eax
	call	dword ptr [4311D8h]
	jmp	429469h

l004291E6:
	cmp	esi,ebx
	jz	429261h

l004291EA:
	cmp	dword ptr [esi+14h],8h
	jc	4291F7h

l004291F0:
	mov	eax,[esi]
	mov	[ebp+8h],eax
	jmp	4291FAh

l004291F7:
	mov	[ebp+8h],esi

l004291FA:
	cmp	dword ptr [esi+14h],8h
	jc	429204h

l00429200:
	mov	edx,[esi]
	jmp	429206h

l00429204:
	mov	edx,esi

l00429206:
	mov	eax,[ebp+0Ch]
	mov	ebx,[ebp+8h]
	add	eax,eax
	push	eax
	mov	eax,[ebp-10h]
	add	eax,edi
	mov	dword ptr [ebp-4h],1h
	lea	eax,[ebx+eax*2]
	push	eax
	lea	eax,[edi+ecx]
	lea	eax,[edx+eax*2]
	push	eax
	call	dword ptr [4311D8h]
	mov	ebx,[ebp+10h]
	add	esp,0Ch
	cmp	dword ptr [ebx+14h],8h
	jc	42923Ah

l00429238:
	mov	ebx,[ebx]

l0042923A:
	cmp	dword ptr [esi+14h],8h
	jc	429244h

l00429240:
	mov	ecx,[esi]
	jmp	429246h

l00429244:
	mov	ecx,esi

l00429246:
	mov	eax,[ebp+18h]
	add	eax,eax
	push	eax
	mov	eax,[ebp+14h]
	lea	eax,[ebx+eax*2]
	push	eax
	lea	eax,[ecx+edi*2]
	push	eax
	call	42D1CFh
	jmp	429469h

l00429261:
	cmp	ecx,eax
	jnc	4292E0h

l00429265:
	cmp	dword ptr [esi+14h],8h
	jc	429272h

l0042926B:
	mov	eax,[esi]
	mov	[ebp+14h],eax
	jmp	429275h

l00429272:
	mov	[ebp+14h],esi

l00429275:
	cmp	dword ptr [esi+14h],8h
	jc	42927Fh

l0042927B:
	mov	ebx,[esi]
	jmp	429281h

l0042927F:
	mov	ebx,esi

l00429281:
	lea	eax,[ecx+ecx]
	mov	dword ptr [ebp-4h],2h
	push	eax
	mov	eax,[ebp+14h]
	lea	eax,[eax+edx*2]
	push	eax
	lea	eax,[ebx+edi*2]
	mov	ebx,[4311D8h]
	push	eax
	call	ebx
	add	esp,0Ch
	cmp	dword ptr [esi+14h],8h
	jc	4292ACh

l004292A8:
	mov	edx,[esi]
	jmp	4292AEh

l004292AC:
	mov	edx,esi

l004292AE:
	cmp	dword ptr [esi+14h],8h
	jc	4292B8h

l004292B4:
	mov	ecx,[esi]
	jmp	4292BAh

l004292B8:
	mov	ecx,esi

l004292BA:
	mov	eax,[ebp+0Ch]
	add	eax,eax
	mov	dword ptr [ebp-4h],3h
	push	eax
	mov	eax,[ebp-10h]
	add	eax,edi
	lea	eax,[edx+eax*2]
	push	eax
	mov	eax,[ebp+18h]
	add	eax,edi
	lea	eax,[ecx+eax*2]
	push	eax
	call	ebx
	jmp	429469h

l004292E0:
	mov	ebx,[ebp+14h]
	cmp	ebx,edi
	ja	42936Bh

l004292EB:
	cmp	dword ptr [esi+14h],8h
	jc	4292F8h

l004292F1:
	mov	eax,[esi]
	mov	[ebp+8h],eax
	jmp	4292FBh

l004292F8:
	mov	[ebp+8h],esi

l004292FB:
	cmp	dword ptr [esi+14h],8h
	jc	429305h

l00429301:
	mov	edx,[esi]
	jmp	429307h

l00429305:
	mov	edx,esi

l00429307:
	mov	eax,[ebp+0Ch]
	mov	ebx,[ebp+8h]
	add	eax,eax
	push	eax
	mov	eax,[ebp-10h]
	add	eax,edi
	mov	dword ptr [ebp-4h],4h
	lea	eax,[ebx+eax*2]
	push	eax
	lea	eax,[edi+ecx]
	lea	eax,[edx+eax*2]
	push	eax
	call	dword ptr [4311D8h]
	add	esp,0Ch
	cmp	dword ptr [esi+14h],8h
	jc	42933Ah

l00429336:
	mov	edx,[esi]
	jmp	42933Ch

l0042933A:
	mov	edx,esi

l0042933C:
	cmp	dword ptr [esi+14h],8h
	jc	429346h

l00429342:
	mov	ecx,[esi]
	jmp	429348h

l00429346:
	mov	ecx,esi

l00429348:
	mov	eax,[ebp+18h]
	mov	ebx,[ebp+14h]
	add	eax,eax
	push	eax
	mov	dword ptr [ebp-4h],5h
	lea	eax,[edx+ebx*2]
	push	eax
	lea	eax,[ecx+edi*2]
	push	eax
	call	dword ptr [4311D8h]
	jmp	429469h

l0042936B:
	lea	edx,[edi+eax]
	mov	[ebp+8h],edx
	cmp	edx,ebx
	ja	4293D6h

l00429375:
	cmp	dword ptr [esi+14h],8h
	jc	42937Fh

l0042937B:
	mov	eax,[esi]
	jmp	429381h

l0042937F:
	mov	eax,esi

l00429381:
	cmp	dword ptr [esi+14h],8h
	jc	42938Bh

l00429387:
	mov	edx,[esi]
	jmp	42938Dh

l0042938B:
	mov	edx,esi

l0042938D:
	mov	ebx,[ebp+8h]
	push	dword ptr [ebp+0Ch]
	lea	eax,[eax+ebx*2]
	push	eax
	lea	eax,[edi+ecx]
	lea	eax,[edx+eax*2]
	push	eax
	call	429050h
	add	esp,0Ch
	cmp	dword ptr [esi+14h],8h
	jc	4293B0h

l004293AC:
	mov	edx,[esi]
	jmp	4293B2h

l004293B0:
	mov	edx,esi

l004293B2:
	cmp	dword ptr [esi+14h],8h
	jc	4293BCh

l004293B8:
	mov	ecx,[esi]
	jmp	4293BEh

l004293BC:
	mov	ecx,esi

l004293BE:
	mov	ebx,[ebp+14h]
	mov	eax,[ebp+18h]
	sub	ebx,[ebp-10h]
	add	ebx,eax
	push	eax
	lea	eax,[edx+ebx*2]
	push	eax
	lea	eax,[ecx+edi*2]
	jmp	429463h

l004293D6:
	cmp	dword ptr [esi+14h],8h
	jc	4293E0h

l004293DC:
	mov	edx,[esi]
	jmp	4293E2h

l004293E0:
	mov	edx,esi

l004293E2:
	cmp	dword ptr [esi+14h],8h
	jc	4293ECh

l004293E8:
	mov	ecx,[esi]
	jmp	4293EEh

l004293EC:
	mov	ecx,esi

l004293EE:
	push	eax
	lea	eax,[edx+ebx*2]
	push	eax
	lea	eax,[ecx+edi*2]
	push	eax
	call	429050h
	add	esp,0Ch
	cmp	dword ptr [esi+14h],8h
	jc	429409h

l00429405:
	mov	eax,[esi]
	jmp	42940Bh

l00429409:
	mov	eax,esi

l0042940B:
	cmp	dword ptr [esi+14h],8h
	jc	429415h

l00429411:
	mov	ecx,[esi]
	jmp	429417h

l00429415:
	mov	ecx,esi

l00429417:
	mov	edx,[ebp+8h]
	push	dword ptr [ebp+0Ch]
	add	edx,edx
	add	eax,edx
	mov	[ebp+14h],edx
	push	eax
	mov	eax,[ebp+18h]
	add	eax,edi
	lea	eax,[ecx+eax*2]
	push	eax
	call	429050h
	add	esp,0Ch
	cmp	dword ptr [esi+14h],8h
	jc	429440h

l0042943C:
	mov	edi,[esi]
	jmp	429442h

l00429440:
	mov	edi,esi

l00429442:
	cmp	dword ptr [esi+14h],8h
	jc	42944Ch

l00429448:
	mov	edx,[esi]
	jmp	42944Eh

l0042944C:
	mov	edx,esi

l0042944E:
	mov	ecx,[ebp+18h]
	mov	eax,ecx
	sub	eax,[ebp-10h]
	push	eax
	lea	eax,[ebx+ecx]
	lea	eax,[edi+eax*2]
	push	eax
	mov	eax,[ebp+14h]
	add	eax,edx

l00429463:
	push	eax
	call	429050h

l00429469:
	mov	ecx,[ebp-14h]
	add	esp,0Ch
	cmp	dword ptr [esi+14h],8h
	mov	[esi+10h],ecx
	jc	42947Ch

l00429478:
	mov	eax,[esi]
	jmp	42947Eh

l0042947C:
	mov	eax,esi

l0042947E:
	xor	edx,edx
	mov	[eax+ecx*2],dx
	mov	eax,esi
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	14h
0042949A                               CC CC CC CC CC CC           ......

;; fn004294A0: 004294A0
;;   Called from:
;;     00428409 (in fn004283A0)
fn004294A0 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	430260h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,8h
	push	ebx
	push	esi
	push	edi
	mov	eax,[43A008h]
	xor	eax,ebp
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	esi,ecx
	mov	edx,[esi+14h]
	cmp	edx,8h
	jc	4294D4h

l004294D2:
	mov	ecx,[esi]

l004294D4:
	mov	ebx,[ebp+10h]
	cmp	ecx,ebx
	ja	42951Ah

l004294DB:
	mov	eax,[esi+10h]
	lea	eax,[ecx+eax*2]
	cmp	ebx,eax
	jnc	42951Ah

l004294E5:
	cmp	edx,8h
	jc	4294EEh

l004294EA:
	mov	eax,[esi]
	jmp	4294F0h

l004294EE:
	mov	eax,esi

l004294F0:
	push	dword ptr [ebp+14h]
	sub	ebx,eax
	mov	ecx,esi
	sar	ebx,1h
	push	ebx
	push	esi
	push	dword ptr [ebp+0Ch]
	push	dword ptr [ebp+8h]
	call	4290A0h
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	10h

l0042951A:
	mov	edi,[esi+10h]
	mov	eax,[ebp+8h]
	cmp	edi,eax
	jnc	429529h

l00429524:
	call	428A30h

l00429529:
	mov	ecx,[ebp+0Ch]
	mov	[ebp+0Ch],edi
	sub	[ebp+0Ch],eax
	cmp	[ebp+0Ch],ecx
	mov	eax,[ebp+0Ch]
	mov	[ebp-14h],eax
	lea	eax,[ebp-14h]
	mov	[ebp-10h],ecx
	lea	ecx,[ebp-10h]
	cmovnc	eax,ecx

l00429547:
	mov	ecx,[eax]
	sub	edi,ecx
	mov	eax,[ebp+14h]
	not	eax
	mov	[ebp-14h],ecx
	cmp	eax,edi
	ja	42955Ch

l00429557:
	call	428A20h

l0042955C:
	mov	eax,[ebp+0Ch]
	mov	edi,[ebp+14h]
	sub	eax,ecx
	mov	[ebp+0Ch],eax
	cmp	edi,ecx
	jnc	4295C3h

l0042956B:
	cmp	edx,8h
	jc	42957Ah

l00429570:
	mov	ebx,[esi]
	mov	[ebp-10h],ebx
	mov	ebx,[ebp+10h]
	jmp	42957Dh

l0042957A:
	mov	[ebp-10h],esi

l0042957D:
	cmp	edx,8h
	jc	42958Ch

l00429582:
	mov	eax,[esi]
	mov	[ebp+10h],eax
	mov	eax,[ebp+0Ch]
	jmp	42958Fh

l0042958C:
	mov	[ebp+10h],esi

l0042958F:
	mov	edx,[ebp+8h]
	add	eax,eax
	push	eax
	mov	dword ptr [ebp-4h],0h
	lea	eax,[edx+ecx]
	mov	ecx,[ebp-10h]
	lea	eax,[ecx+eax*2]
	mov	ecx,[ebp+10h]
	push	eax
	lea	eax,[edx+edi]
	lea	eax,[ecx+eax*2]
	push	eax
	call	dword ptr [4311D8h]
	mov	ecx,[ebp-14h]
	add	esp,0Ch
	mov	dword ptr [ebp-4h],0FFFFFFFFh

l004295C3:
	mov	edi,[esi+10h]
	mov	edx,[ebp+14h]
	sub	edi,ecx
	add	edi,edx
	test	edx,edx
	jnz	4295D9h

l004295D1:
	test	ecx,ecx
	jz	42969Bh

l004295D9:
	test	edi,edi
	jnz	4295FEh

l004295DD:
	cmp	dword ptr [esi+14h],8h
	mov	[esi+10h],edi
	jc	4295F2h

l004295E6:
	mov	eax,[esi]
	xor	ecx,ecx
	mov	[eax],cx
	jmp	42969Bh

l004295F2:
	mov	eax,esi
	xor	ecx,ecx
	mov	[eax],cx
	jmp	42969Bh

l004295FE:
	cmp	[esi+14h],edi
	jnc	429611h

l00429603:
	push	edi
	mov	ecx,esi
	call	4288A0h
	mov	ecx,[ebp-14h]
	mov	edx,[ebp+14h]

l00429611:
	cmp	ecx,edx
	jnc	429666h

l00429615:
	cmp	dword ptr [esi+14h],8h
	jc	429622h

l0042961B:
	mov	eax,[esi]
	mov	[ebp+10h],eax
	jmp	429625h

l00429622:
	mov	[ebp+10h],esi

l00429625:
	cmp	dword ptr [esi+14h],8h
	jc	429632h

l0042962B:
	mov	eax,[esi]
	mov	[ebp-14h],eax
	jmp	429635h

l00429632:
	mov	[ebp-14h],esi

l00429635:
	mov	eax,[ebp+0Ch]
	add	eax,eax
	mov	dword ptr [ebp-4h],1h
	push	eax
	mov	eax,[ebp+8h]
	add	eax,ecx
	mov	ecx,[ebp+10h]
	lea	eax,[ecx+eax*2]
	mov	ecx,[ebp-14h]
	push	eax
	mov	eax,[ebp+8h]
	add	eax,edx
	lea	eax,[ecx+eax*2]
	push	eax
	call	dword ptr [4311D8h]
	mov	edx,[ebp+14h]
	add	esp,0Ch

l00429666:
	cmp	dword ptr [esi+14h],8h
	jc	429670h

l0042966C:
	mov	ecx,[esi]
	jmp	429672h

l00429670:
	mov	ecx,esi

l00429672:
	lea	eax,[edx+edx]
	push	eax
	mov	eax,[ebp+8h]
	push	ebx
	lea	eax,[ecx+eax*2]
	push	eax
	call	42D1CFh
	add	esp,0Ch
	mov	[esi+10h],edi
	cmp	dword ptr [esi+14h],8h
	jc	429693h

l0042968F:
	mov	eax,[esi]
	jmp	429695h

l00429693:
	mov	eax,esi

l00429695:
	xor	ecx,ecx
	mov	[eax+edi*2],cx

l0042969B:
	mov	eax,esi
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	10h
004296B1    CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC  ...............
004296C0 55 8B EC 6A FF 68 88 02 43 00 64 A1 00 00 00 00 U..j.h..C.d.....
004296D0 50 83 EC 24 A1 08 A0 43 00 33 C5 89 45 EC 53 56 P..$...C.3..E.SV
004296E0 57 50 8D 45 F4 64 A3 00 00 00 00 89 65 F0 8B F1 WP.E.d......e...
004296F0 83 7E 24 00 89 75 D0 75 79 8B 46 04 BA CC 13 43 .~$..u.uy.F....C
00429700 00 85 C0 C7 45 FC 00 00 00 00 0F 45 D0 8B CA 8D ....E......E....
00429710 79 01 8A 01 41 84 C0 75 F9 2B CF 51 52 8D 4E 14 y...A..u.+.QR.N.
00429720 E8 4B 93 FD FF 83 7E 24 00 74 0F 6A 02 68 EC 13 .K....~$.t.j.h..
00429730 43 00 8D 4E 14 E8 06 76 FE FF 8D 45 D4 50 8D 4E C..N...v...E.P.N
00429740 0C E8 DA F8 FF FF 6A FF 6A 00 50 8D 4E 14 C6 45 ......j.j.P.N..E
00429750 FC 01 E8 B9 F3 FF FF 8B 45 E8 C6 45 FC 02 83 F8 ........E..E....
00429760 10 72 0F 6A 01 40 50 FF 75 D4 E8 41 F2 FF FF 83 .r.j.@P.u..A....
00429770 C4 0C 83 7E 28 10 8D 46 14 72 02 8B 00 8B 4D F4 ...~(..F.r....M.
00429780 64 89 0D 00 00 00 00 59 5F 5E 5B 8B 4D EC 33 CD d......Y_^[.M.3.
00429790 E8 6B DD FF FF 8B E5 5D C3 8B 45 D0 B9 CC 13 43 .k.....]..E....C
004297A0 00 8B 40 04 85 C0 0F 45 C8 B8 B2 97 42 00 89 4D ..@....E....B..M
004297B0 D0 C3 8B 45 D0 EB C6 CC CC CC CC CC CC CC CC CC ...E............

;; fn004297C0: 004297C0
;;   Called from:
;;     0042995D (in fn00429930)
fn004297C0 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	4302B0h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,8h
	push	ebx
	push	esi
	push	edi
	mov	eax,[43A008h]
	xor	eax,ebp
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	[ebp-10h],esp
	mov	esi,ecx
	push	10h
	mov	dword ptr [esi],0h
	mov	dword ptr [ebp-4h],0h
	call	427511h
	mov	edx,eax
	add	esp,4h
	test	edx,edx
	jz	429826h

l0042980A:
	mov	eax,[ebp+8h]
	mov	dword ptr [edx+4h],1h
	mov	dword ptr [edx+8h],1h
	mov	dword ptr [edx],4315A0h
	mov	[edx+0Ch],eax
	jmp	429828h

l00429826:
	xor	edx,edx

l00429828:
	mov	[esi],edx
	mov	eax,esi
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	4h
00429840 FF 75 08 E8 18 00 00 00 83 C4 04 6A 00 6A 00 E8 .u.........j.j..
00429850 63 39 00 00 CC CC CC CC CC CC CC CC CC CC CC CC c9..............
00429860 56 8B 74 24 08 85 F6 74 12 8B CE E8 C0 06 00 00 V.t$...t........
00429870 6A 48 56 E8 C7 DD FF FF 83 C4 08 5E C3 CC CC CC jHV........^....

;; fn00429880: 00429880
;;   Called from:
;;     00429AD1 (in fn00429A30)
;;     00429BD1 (in fn00429B30)
fn00429880 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	4302D8h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,8h
	push	esi
	push	edi
	mov	eax,[43A008h]
	xor	eax,ebp
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	esi,ecx
	mov	eax,[ebp+8h]
	mov	[ebp-14h],eax
	mov	dword ptr [ebp-10h],0h
	lea	ecx,[ebp-10h]
	mov	dword ptr [ebp-4h],0h
	push	ecx
	push	eax
	lea	eax,[ebp-14h]
	push	eax
	call	429930h
	mov	eax,[esi]
	add	esp,0Ch
	mov	ecx,[ebp-14h]
	mov	[esi],ecx
	mov	edi,[esi+4h]
	mov	[ebp-14h],eax
	mov	eax,[ebp-10h]
	mov	[esi+4h],eax
	mov	[ebp-10h],edi
	mov	dword ptr [ebp-4h],1h
	test	edi,edi
	jz	42991Ah

l004298EF:
	or	esi,0FFh
	lea	ecx,[edi+4h]
	mov	eax,esi
	lock
	xadd	[ecx],eax
	cmp	eax,1h
	jnz	42991Ah

l00429900:
	mov	eax,[edi]
	mov	ecx,edi
	call	dword ptr [eax+4h]
	lea	eax,[edi+8h]
	lock
	xadd	[eax],esi
	cmp	esi,1h
	jnz	42991Ah

l00429913:
	mov	eax,[edi]
	mov	ecx,edi
	call	dword ptr [eax+8h]

l0042991A:
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	mov	esp,ebp
	pop	ebp
	ret	4h
0042992D                                        CC CC CC              ...

;; fn00429930: 00429930
;;   Called from:
;;     004298C6 (in fn00429880)
fn00429930 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	430300h
	mov	eax,fs:[0000h]
	push	eax
	push	ecx
	push	ebx
	push	esi
	push	edi
	mov	eax,[43A008h]
	xor	eax,ebp
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	edi,[ebp+0Ch]
	lea	ecx,[ebp-10h]
	push	edi
	call	4297C0h
	mov	edx,[ebp+10h]
	mov	ecx,[eax]
	mov	esi,[edx]
	mov	[edx],ecx
	mov	[eax],esi
	mov	esi,[ebp-10h]
	mov	dword ptr [ebp-4h],0h
	test	esi,esi
	jz	4299A6h

l0042997B:
	or	ebx,0FFh
	lea	ecx,[esi+4h]
	mov	eax,ebx
	lock
	xadd	[ecx],eax
	cmp	eax,1h
	jnz	4299A6h

l0042998C:
	mov	eax,[esi]
	mov	ecx,esi
	call	dword ptr [eax+4h]
	lea	eax,[esi+8h]
	lock
	xadd	[eax],ebx
	cmp	ebx,1h
	jnz	4299A6h

l0042999F:
	mov	eax,[esi]
	mov	ecx,esi
	call	dword ptr [eax+8h]

l004299A6:
	push	edi
	push	edi
	push	dword ptr [ebp+8h]
	call	4029A0h
	add	esp,0Ch
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret
004299C5                CC CC CC CC CC CC CC CC CC CC CC      ...........
004299D0 56 8B F1 C7 06 00 00 00 00 E8 42 37 00 00 89 46 V.........B7...F
004299E0 04 8B C6 5E C3 CC CC CC CC CC CC CC CC CC CC CC ...^............
004299F0 51 56 8B 74 24 0C 57 8B F9 56 89 7C 24 0C E8 AD QV.t$.W..V.|$...
00429A00 EA FF FF C7 07 98 14 43 00 8B 46 2C 89 47 2C 8B .......C..F,.G,.
00429A10 4E 30 89 4F 30 85 C9 74 0C 83 C1 04 B8 01 00 00 N0.O0..t........
00429A20 00 F0 0F C1 01 8B C7 5F 5E 59 C2 04 00 CC CC CC ......._^Y......

;; fn00429A30: 00429A30
;;   Called from:
;;     0042A40D (in fn0042A390)
fn00429A30 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	430333h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,8h
	push	ebx
	push	esi
	push	edi
	mov	eax,[43A008h]
	xor	eax,ebp
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	[ebp-10h],esp
	mov	esi,ecx
	mov	[ebp-14h],esi
	push	dword ptr [ebp+8h]
	push	dword ptr [ebp+18h]
	push	dword ptr [ebp+14h]
	call	429D00h
	mov	dword ptr [esi],431498h
	mov	dword ptr [esi+2Ch],0h
	mov	dword ptr [ebp-4h],0h
	mov	dword ptr [esi+30h],0h
	push	48h
	mov	byte ptr [ebp-4h],2h
	call	427511h
	add	esp,4h
	test	eax,eax
	jz	429ACBh

l00429A9B:
	mov	dword ptr [eax+10h],0h
	xor	ecx,ecx
	mov	dword ptr [eax+14h],7h
	mov	[eax],cx
	mov	[eax+28h],ecx
	mov	dword ptr [eax+2Ch],7h
	mov	[eax+18h],cx
	mov	[eax+40h],ecx
	mov	dword ptr [eax+44h],0Fh
	mov	[eax+30h],cl
	jmp	429ACDh

l00429ACB:
	xor	eax,eax

l00429ACD:
	push	eax
	lea	ecx,[esi+2Ch]
	call	429880h
	mov	ecx,[esi+2Ch]
	mov	eax,[ebp+0Ch]
	cmp	ecx,eax
	jz	429AEAh

l00429AE0:
	push	0FFh
	push	0h
	push	eax
	call	42A070h

l00429AEA:
	mov	ecx,[esi+2Ch]
	mov	eax,[ebp+10h]
	add	ecx,18h
	cmp	ecx,eax
	jz	429B17h

l00429AF7:
	push	0FFh
	push	0h
	push	eax
	call	42A070h
	jmp	429B17h
00429B03          8B 4D EC 8D 49 2C E8 D2 0F 00 00 B8 14    .M..I,.......
00429B10 9B 42 00 C3 8B 75 EC                            .B...u.         

l00429B17:
	mov	eax,esi
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	14h
00429B2D                                        CC CC CC              ...

;; fn00429B30: 00429B30
;;   Called from:
;;     0042A4C4 (in fn0042A450)
;;     0042A7DA (in fn0042A710)
fn00429B30 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	430363h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,8h
	push	ebx
	push	esi
	push	edi
	mov	eax,[43A008h]
	xor	eax,ebp
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	[ebp-10h],esp
	mov	esi,ecx
	mov	[ebp-14h],esi
	push	dword ptr [ebp+8h]
	push	dword ptr [ebp+14h]
	push	dword ptr [ebp+10h]
	call	429D00h
	mov	dword ptr [esi],431498h
	mov	dword ptr [esi+2Ch],0h
	mov	dword ptr [ebp-4h],0h
	mov	dword ptr [esi+30h],0h
	push	48h
	mov	byte ptr [ebp-4h],2h
	call	427511h
	add	esp,4h
	test	eax,eax
	jz	429BCBh

l00429B9B:
	mov	dword ptr [eax+10h],0h
	xor	ecx,ecx
	mov	dword ptr [eax+14h],7h
	mov	[eax],cx
	mov	[eax+28h],ecx
	mov	dword ptr [eax+2Ch],7h
	mov	[eax+18h],cx
	mov	[eax+40h],ecx
	mov	dword ptr [eax+44h],0Fh
	mov	[eax+30h],cl
	jmp	429BCDh

l00429BCB:
	xor	eax,eax

l00429BCD:
	push	eax
	lea	ecx,[esi+2Ch]
	call	429880h
	mov	ecx,[esi+2Ch]
	mov	eax,[ebp+0Ch]
	cmp	ecx,eax
	jz	429C00h

l00429BE0:
	push	0FFh
	push	0h
	push	eax
	call	42A070h
	jmp	429C00h
00429BEC                                     8B 4D EC 8D             .M..
00429BF0 49 2C E8 E9 0E 00 00 B8 FD 9B 42 00 C3 8B 75 EC I,........B...u.

l00429C00:
	mov	eax,esi
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	10h
00429C16                   CC CC CC CC CC CC CC CC CC CC       ..........

;; fn00429C20: 00429C20
;;   Called from:
;;     0042B765 (in fn0042B630)
fn00429C20 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	430380h
	mov	eax,fs:[0000h]
	push	eax
	push	esi
	mov	eax,[43A008h]
	xor	eax,ebp
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	esi,ecx
	xor	eax,eax
	mov	dword ptr [esi+10h],0h
	mov	dword ptr [esi+14h],7h
	mov	[esi],ax
	mov	[ebp-4h],eax
	cmp	esi,[ebp+8h]
	jz	429C93h

l00429C60:
	mov	eax,[esi+14h]
	cmp	eax,8h
	jc	429C76h

l00429C68:
	push	2h
	inc	eax
	push	eax
	push	dword ptr [esi]
	call	4289B0h
	add	esp,0Ch

l00429C76:
	push	dword ptr [ebp+8h]
	xor	eax,eax
	mov	dword ptr [esi+10h],0h
	mov	dword ptr [esi+14h],7h
	mov	ecx,esi
	mov	[esi],ax
	call	42A010h

l00429C93:
	mov	eax,esi
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	esi
	mov	esp,ebp
	pop	ebp
	ret	4h
00429CA7                      CC CC CC CC CC CC CC CC CC        .........

;; fn00429CB0: 00429CB0
;;   Called from:
;;     0042B758 (in fn0042B630)
fn00429CB0 proc
	push	ecx
	mov	edx,[esp+8h]
	xor	eax,eax
	push	esi
	mov	esi,ecx
	push	edi
	mov	[esp+8h],esi
	mov	dword ptr [esi+10h],0h
	mov	dword ptr [esi+14h],7h
	mov	[esi],ax
	mov	eax,edx
	lea	edi,[eax+2h]

l00429CD5:
	mov	cx,[eax]
	add	eax,2h
	test	cx,cx
	jnz	429CD5h

l00429CE0:
	sub	eax,edi
	mov	ecx,esi
	sar	eax,1h
	push	eax
	push	edx
	call	42A160h
	pop	edi
	mov	eax,esi
	pop	esi
	pop	ecx
	ret	4h
00429CF5                CC CC CC CC CC CC CC CC CC CC CC      ...........

;; fn00429D00: 00429D00
;;   Called from:
;;     00429A69 (in fn00429A30)
;;     00429B69 (in fn00429B30)
fn00429D00 proc
	sub	esp,8h
	push	esi
	mov	esi,ecx
	mov	ecx,[esp+18h]
	mov	[esp+4h],esi
	cmp	dword ptr [ecx+14h],10h
	jc	429D16h

l00429D14:
	mov	ecx,[ecx]

l00429D16:
	lea	eax,[esi+4h]
	mov	dword ptr [esi],431384h
	xorps	xmm0,xmm0
	mov	[esp+4h],ecx
	push	eax
	movq	qword ptr [eax],xmm0
	lea	eax,[esp+8h]
	push	eax
	mov	byte ptr [esp+10h],1h
	call	dword ptr [4311D0h]
	mov	eax,[esp+18h]
	add	esp,8h
	mov	[esi+0Ch],eax
	mov	eax,[esp+14h]
	mov	[esi+10h],eax
	mov	eax,esi
	mov	dword ptr [esi],4313F4h
	mov	dword ptr [esi+24h],0h
	mov	dword ptr [esi+28h],0Fh
	mov	byte ptr [esi+14h],0h
	pop	esi
	add	esp,8h
	ret	0Ch
00429D6D                                        CC CC CC              ...
00429D70 55 8B EC 6A FF 68 A0 03 43 00 64 A1 00 00 00 00 U..j.h..C.d.....
00429D80 50 56 57 A1 08 A0 43 00 33 C5 50 8D 45 F4 64 A3 PVW...C.3.P.E.d.
00429D90 00 00 00 00 8B 71 04 C7 45 FC 00 00 00 00 85 F6 .....q..E.......
00429DA0 74 2B 83 CF FF 8D 4E 04 8B C7 F0 0F C1 01 83 F8 t+....N.........
00429DB0 01 75 1A 8B 06 8B CE FF 50 04 8D 46 08 F0 0F C1 .u......P..F....
00429DC0 38 83 FF 01 75 07 8B 06 8B CE FF 50 08 8B 4D F4 8...u......P..M.
00429DD0 64 89 0D 00 00 00 00 59 5F 5E 8B E5 5D C3 CC CC d......Y_^..]...
00429DE0 55 8B EC 6A FF 68 C0 03 43 00 64 A1 00 00 00 00 U..j.h..C.d.....
00429DF0 50 53 56 57 A1 08 A0 43 00 33 C5 50 8D 45 F4 64 PSVW...C.3.P.E.d
00429E00 A3 00 00 00 00 8B F1 C7 06 98 14 43 00 8B 7E 30 ...........C..~0
00429E10 C7 45 FC 00 00 00 00 85 FF 74 2B 83 CB FF 8D 4F .E.......t+....O
00429E20 04 8B C3 F0 0F C1 01 83 F8 01 75 1A 8B 07 8B CF ..........u.....
00429E30 FF 50 04 8D 47 08 F0 0F C1 18 83 FB 01 75 07 8B .P..G........u..
00429E40 07 8B CF FF 50 08 C7 06 F4 13 43 00 8B 46 28 C7 ....P.....C..F(.
00429E50 45 FC 01 00 00 00 83 F8 10 72 0F 40 6A 01 50 FF E........r.@j.P.
00429E60 76 14 E8 49 EB FF FF 83 C4 0C 8D 46 04 C7 45 FC v..I.......F..E.
00429E70 FF FF FF FF 50 C7 06 84 13 43 00 FF 15 C8 11 43 ....P....C.....C
00429E80 00 83 C4 04 8B 4D F4 64 89 0D 00 00 00 00 59 5F .....M.d......Y_
00429E90 5E 5B 8B E5 5D C3 CC CC CC CC CC CC CC CC CC CC ^[..]...........
00429EA0 55 8B EC 6A FF 68 E0 DA 42 00 64 A1 00 00 00 00 U..j.h..B.d.....
00429EB0 50 A1 08 A0 43 00 33 C5 50 8D 45 F4 64 A3 00 00 P...C.3.P.E.d...
00429EC0 00 00 8B 01 83 F8 FF 74 07 50 FF 15 0C 10 43 00 .......t.P....C.
00429ED0 8B 4D F4 64 89 0D 00 00 00 00 59 8B E5 5D C3 CC .M.d......Y..]..
00429EE0 55 8B EC 6A FF 68 E0 03 43 00 64 A1 00 00 00 00 U..j.h..C.d.....
00429EF0 50 A1 08 A0 43 00 33 C5 50 8D 45 F4 64 A3 00 00 P...C.3.P.E.d...
00429F00 00 00 8B 41 14 C7 45 FC 00 00 00 00 83 F8 08 72 ...A..E........r
00429F10 0E 6A 02 40 50 FF 31 E8 94 EA FF FF 83 C4 0C 8B .j.@P.1.........
00429F20 4D F4 64 89 0D 00 00 00 00 59 8B E5 5D C3 CC CC M.d......Y..]...

;; fn00429F30: 00429F30
;;   Called from:
;;     0042A23A (in fn0042A230)
fn00429F30 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	430400h
	mov	eax,fs:[0000h]
	push	eax
	push	esi
	mov	eax,[43A008h]
	xor	eax,ebp
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	esi,ecx
	mov	eax,[esi+44h]
	mov	dword ptr [ebp-4h],0h
	cmp	eax,10h
	jc	429F73h

l00429F64:
	inc	eax
	push	1h
	push	eax
	push	dword ptr [esi+30h]
	call	4289B0h
	add	esp,0Ch

l00429F73:
	mov	eax,[esi+2Ch]
	mov	dword ptr [ebp-4h],1h
	cmp	eax,8h
	jc	429F91h

l00429F82:
	inc	eax
	push	2h
	push	eax
	push	dword ptr [esi+18h]
	call	4289B0h
	add	esp,0Ch

l00429F91:
	mov	eax,[esi+14h]
	mov	dword ptr [ebp-4h],2h
	cmp	eax,8h
	jc	429FAEh

l00429FA0:
	push	2h
	inc	eax
	push	eax
	push	dword ptr [esi]
	call	4289B0h
	add	esp,0Ch

l00429FAE:
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	esi
	mov	esp,ebp
	pop	ebp
	ret
00429FBE                                           CC CC               ..

;; fn00429FC0: 00429FC0
fn00429FC0 proc
	test	byte ptr [esp+4h],1h
	push	esi
	mov	esi,ecx
	mov	dword ptr [esi],431480h
	jz	429FDBh

l00429FD0:
	push	10h
	push	esi
	call	42763Fh
	add	esp,8h

l00429FDB:
	mov	eax,esi
	pop	esi
	ret	4h
00429FE1    CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC  ...............
00429FF0 56 8B F1 E8 E8 FD FF FF F6 44 24 08 01 74 0B 6A V........D$..t.j
0042A000 34 56 E8 38 D6 FF FF 83 C4 08 8B C6 5E C2 04 00 4V.8........^...

;; fn0042A010: 0042A010
;;   Called from:
;;     00429C8E (in fn00429C20)
;;     0042B96E (in fn0042B830)
fn0042A010 proc
	push	esi
	mov	esi,[esp+8h]
	push	edi
	mov	edi,ecx
	cmp	dword ptr [esi+14h],8h
	jc	42A02Eh

l0042A01E:
	test	edi,edi
	jz	42A026h

l0042A022:
	mov	eax,[esi]
	mov	[edi],eax

l0042A026:
	mov	dword ptr [esi],0h
	jmp	42A043h

l0042A02E:
	mov	eax,[esi+10h]
	lea	eax,[0002h+eax*2]
	push	eax
	push	esi
	push	edi
	call	42D1CFh
	add	esp,0Ch

l0042A043:
	mov	eax,[esi+10h]
	mov	[edi+10h],eax
	mov	eax,[esi+14h]
	mov	[edi+14h],eax
	xor	eax,eax
	mov	dword ptr [esi+10h],0h
	mov	dword ptr [esi+14h],7h
	pop	edi
	mov	[esi],ax
	pop	esi
	ret	4h
0042A067                      CC CC CC CC CC CC CC CC CC        .........

;; fn0042A070: 0042A070
;;   Called from:
;;     00429AE5 (in fn00429A30)
;;     00429AFC (in fn00429A30)
;;     00429BE5 (in fn00429B30)
;;     0042A19B (in fn0042A170)
;;     0042B29F (in fn0042B210)
;;     0042B8C7 (in fn0042B830)
;;     0042C16B (in fn0042C020)
;;     0042C1BE (in fn0042C020)
;;     0042C2CC (in fn0042C2A0)
fn0042A070 proc
	push	ebx
	mov	ebx,[esp+8h]
	push	ebp
	mov	ebp,[esp+10h]
	push	esi
	mov	eax,[ebx+10h]
	mov	esi,ecx
	cmp	eax,ebp
	jc	42A14Bh

l0042A088:
	sub	eax,ebp
	push	edi
	mov	edi,[esp+1Ch]
	cmp	eax,edi
	cmovc	edi,eax

l0042A094:
	cmp	esi,ebx
	jnz	42A0C7h

l0042A098:
	lea	eax,[edi+ebp]
	cmp	[esi+10h],eax
	jc	42A150h

l0042A0A4:
	mov	[esi+10h],eax
	cmp	dword ptr [esi+14h],8h
	jc	42A0AFh

l0042A0AD:
	mov	ecx,[esi]

l0042A0AF:
	xor	edx,edx
	push	ebp
	mov	[ecx+eax*2],dx
	mov	ecx,esi
	push	edx
	call	428F60h
	pop	edi
	mov	eax,esi
	pop	esi
	pop	ebp
	pop	ebx
	ret	0Ch

l0042A0C7:
	test	edi,edi
	jnz	42A0F2h

l0042A0CB:
	cmp	dword ptr [esi+14h],8h
	mov	[esi+10h],edi
	jc	42A0E4h

l0042A0D4:
	mov	eax,[esi]
	xor	ecx,ecx
	pop	edi
	mov	[eax],cx
	mov	eax,esi
	pop	esi
	pop	ebp
	pop	ebx
	ret	0Ch

l0042A0E4:
	pop	edi
	mov	eax,esi
	xor	ecx,ecx
	pop	esi
	pop	ebp
	pop	ebx
	mov	[eax],cx
	ret	0Ch

l0042A0F2:
	cmp	[esi+14h],edi
	jnc	42A0FDh

l0042A0F7:
	push	edi
	call	4288A0h

l0042A0FD:
	cmp	dword ptr [ebx+14h],8h
	jc	42A105h

l0042A103:
	mov	ebx,[ebx]

l0042A105:
	cmp	dword ptr [esi+14h],8h
	jc	42A10Fh

l0042A10B:
	mov	ecx,[esi]
	jmp	42A111h

l0042A10F:
	mov	ecx,esi

l0042A111:
	lea	eax,[edi+edi]
	push	eax
	lea	eax,[ebx+ebp*2]
	push	eax
	push	ecx
	call	42D1CFh
	add	esp,0Ch
	mov	[esi+10h],edi
	cmp	dword ptr [esi+14h],8h
	jc	42A13Ch

l0042A12B:
	mov	eax,[esi]
	xor	ecx,ecx
	mov	[eax+edi*2],cx
	mov	eax,esi
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	ret	0Ch

l0042A13C:
	mov	eax,esi
	xor	ecx,ecx
	mov	[eax+edi*2],cx
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	ret	0Ch

l0042A14B:
	call	428A30h

l0042A150:
	call	428A30h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h

;; fn0042A160: 0042A160
;;   Called from:
;;     00429CE8 (in fn00429CB0)
;;     0042AC06 (in fn0042AB60)
;;     0042B2F5 (in fn0042B210)
;;     0042B527 (in fn0042B4C0)
;;     0042B5C7 (in fn0042B560)
;;     0042B914 (in fn0042B830)
fn0042A160 proc
	push	esi
	mov	esi,ecx
	push	edi
	mov	ecx,[esi+14h]
	cmp	ecx,8h
	jc	42A170h

;; fn0042A16C: 0042A16C
;;   Called from:
;;     0042A16A (in fn0042A160)
;;     0042A16A (in fn0042A070)
fn0042A16C proc
	mov	edx,[esi]
	jmp	42A172h

;; fn0042A170: 0042A170
;;   Called from:
;;     0042A16A (in fn0042A160)
;;     0042A16A (in fn0042A070)
;;     0042A16E (in fn0042A16C)
fn0042A170 proc
	mov	edx,esi

l0042A172:
	mov	edi,[esp+0Ch]
	cmp	edx,edi
	ja	42A1A5h

l0042A17A:
	mov	eax,[esi+10h]
	lea	eax,[edx+eax*2]
	cmp	edi,eax
	jnc	42A1A5h

l0042A184:
	cmp	ecx,8h
	jc	42A18Dh

l0042A189:
	mov	eax,[esi]
	jmp	42A18Fh

l0042A18D:
	mov	eax,esi

l0042A18F:
	push	dword ptr [esp+10h]
	sub	edi,eax
	mov	ecx,esi
	sar	edi,1h
	push	edi
	push	esi
	call	42A070h
	pop	edi
	pop	esi
	ret	8h

l0042A1A5:
	push	ebx
	mov	ebx,[esp+14h]
	test	ebx,ebx
	jnz	42A1D2h

l0042A1AE:
	mov	[esi+10h],ebx
	cmp	ecx,8h
	jc	42A1C5h

l0042A1B6:
	mov	eax,[esi]
	xor	ecx,ecx
	pop	ebx
	pop	edi
	mov	[eax],cx
	mov	eax,esi
	pop	esi
	ret	8h

l0042A1C5:
	mov	eax,esi
	xor	ecx,ecx
	pop	ebx
	pop	edi
	pop	esi
	mov	[eax],cx
	ret	8h

l0042A1D2:
	cmp	ecx,ebx
	jnc	42A1DEh

l0042A1D6:
	push	ebx
	mov	ecx,esi
	call	4288A0h

l0042A1DE:
	cmp	dword ptr [esi+14h],8h
	jc	42A1E8h

l0042A1E4:
	mov	eax,[esi]
	jmp	42A1EAh

l0042A1E8:
	mov	eax,esi

l0042A1EA:
	push	ebp
	lea	ebp,[ebx+ebx]
	push	ebp
	push	edi
	push	eax
	call	42D1CFh
	add	esp,0Ch
	mov	[esi+10h],ebx
	cmp	dword ptr [esi+14h],8h
	jc	42A213h

l0042A202:
	mov	eax,[esi]
	xor	ecx,ecx
	mov	[eax+ebp],cx
	mov	eax,esi
	pop	ebp
	pop	ebx
	pop	edi
	pop	esi
	ret	8h

l0042A213:
	mov	eax,esi
	xor	ecx,ecx
	mov	[eax+ebp],cx
	pop	ebp
	pop	ebx
	pop	edi
	pop	esi
	ret	8h
0042A222       CC CC CC CC CC CC CC CC CC CC CC CC CC CC   ..............

;; fn0042A230: 0042A230
fn0042A230 proc
	push	esi
	mov	esi,[ecx+0Ch]
	test	esi,esi
	jz	42A24Ah

l0042A238:
	mov	ecx,esi
	call	429F30h
	push	48h
	push	esi
	call	42763Fh
	add	esp,8h

l0042A24A:
	pop	esi
	ret
0042A24C                                     CC CC CC CC             ....
0042A250 8B 54 24 04 83 EC 10 8B C2 56 8D 70 02 0F 1F 00 .T$......V.p....
0042A260 66 8B 08 83 C0 02 66 85 C9 75 F5 2B C6 89 54 24 f.....f..u.+..T$
0042A270 10 8B 54 24 1C 8B CA D1 F8 03 C0 66 89 44 24 0C ..T$.......f.D$.
0042A280 8B 44 24 0C 8D 71 02 83 C0 02 66 89 44 24 0E 90 .D$..q....f.D$..
0042A290 66 8B 01 83 C1 02 66 85 C0 75 F5 2B CE 89 54 24 f.....f..u.+..T$
0042A2A0 08 D1 F9 6A 01 8D 04 09 66 89 44 24 08 8B 44 24 ...j....f.D$..D$
0042A2B0 08 83 C0 02 66 89 44 24 0A 8D 44 24 08 50 8D 44 ....f.D$..D$.P.D
0042A2C0 24 14 50 FF 15 A4 B0 43 00 33 C9 84 C0 5E 0F 95 $.P....C.3...^..
0042A2D0 C1 8A C1 83 C4 10 C3 CC CC CC CC CC CC CC CC CC ................
0042A2E0 51 53 55 8B 6C 24 10 56 8B 74 24 18 2B EE 57 90 QSU.l$.V.t$.+.W.
0042A2F0 0F B7 04 2E 0F B7 3E 66 3B C7 75 0D 66 85 C0 75 ......>f;.u.f..u
0042A300 73 5F 5E 5D B0 01 5B 59 C3 66 85 C0 74 6E 66 85 s_^]..[Y.f..tnf.
0042A310 FF 74 69 6A 01 89 44 24 14 8D 44 24 1C 50 6A 01 .tij..D$..D$.Pj.
0042A320 8D 44 24 1C 50 68 00 02 00 00 6A 7F FF 15 20 10 .D$.Ph....j... .
0042A330 43 00 0F B7 5C 24 18 85 C0 75 05 0F B7 5C 24 10 C...\$...u...\$.
0042A340 6A 01 8B C7 89 44 24 14 8D 44 24 20 50 6A 01 8D j....D$..D$ Pj..
0042A350 44 24 1C 50 68 00 02 00 00 6A 7F FF 15 20 10 43 D$.Ph....j... .C
0042A360 00 85 C0 0F B7 44 24 1C 75 05 0F B7 44 24 10 66 .....D$.u...D$.f
0042A370 3B D8 75 08 83 C6 02 E9 74 FF FF FF 5F 5E 5D 32 ;.u.....t..._^]2
0042A380 C0 5B 59 C3 CC CC CC CC CC CC CC CC CC CC CC CC .[Y.............

;; fn0042A390: 0042A390
;;   Called from:
;;     0042AAC6 (in fn0042AA80)
fn0042A390 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	430448h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,5Ch
	mov	eax,[43A008h]
	xor	eax,ebp
	mov	[ebp-10h],eax
	push	ebx
	push	esi
	push	edi
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	eax,[ebp+10h]
	mov	edi,[ebp+8h]
	mov	ebx,[ebp+0Ch]
	mov	esi,[ebp+14h]
	mov	[ebp-60h],eax
	mov	eax,[ebp+18h]
	test	edi,edi
	jnz	42A3DEh

l0042A3D1:
	test	esi,esi
	jz	42A42Ah

l0042A3D5:
	mov	[esi],edi
	call	42D120h
	jmp	42A427h

l0042A3DE:
	test	esi,esi
	jnz	42A420h

l0042A3E2:
	push	eax
	lea	ecx,[ebp-28h]
	call	402890h
	mov	[ebp-4h],esi
	call	42D120h
	push	eax
	push	edi
	lea	ecx,[ebp-68h]
	call	428430h
	lea	ecx,[ebp-5Ch]
	push	dword ptr [eax+4h]
	push	dword ptr [eax]
	lea	eax,[ebp-28h]
	push	dword ptr [ebp-60h]
	push	ebx
	push	eax
	call	429A30h
	push	437718h
	lea	eax,[ebp-5Ch]
	push	eax
	call	42D1B7h

l0042A420:
	call	42D120h
	mov	[esi],edi

l0042A427:
	mov	[esi+4h],eax

l0042A42A:
	test	edi,edi
	setnz	al
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	ecx,[ebp-10h]
	xor	ecx,ebp
	call	427500h
	mov	esp,ebp
	pop	ebp
	ret
0042A44B                                  CC CC CC CC CC            .....

;; fn0042A450: 0042A450
;;   Called from:
;;     0042A90B (in fn0042A8D0)
;;     0042AA34 (in fn0042A9E0)
;;     0042AA6A (in fn0042A9E0)
fn0042A450 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	430478h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,58h
	mov	eax,[43A008h]
	xor	eax,ebp
	mov	[ebp-10h],eax
	push	ebx
	push	esi
	push	edi
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	edi,[ebp+8h]
	mov	ebx,[ebp+0Ch]
	mov	esi,[ebp+10h]
	mov	eax,[ebp+14h]
	test	edi,edi
	jnz	42A498h

l0042A48B:
	test	esi,esi
	jz	42A4E1h

l0042A48F:
	mov	[esi],edi
	call	42D120h
	jmp	42A4DEh

l0042A498:
	test	esi,esi
	jnz	42A4D7h

l0042A49C:
	push	eax
	lea	ecx,[ebp-28h]
	call	402890h
	mov	[ebp-4h],esi
	call	42D120h
	push	eax
	push	edi
	lea	ecx,[ebp-64h]
	call	428430h
	lea	ecx,[ebp-5Ch]
	push	dword ptr [eax+4h]
	push	dword ptr [eax]
	lea	eax,[ebp-28h]
	push	ebx
	push	eax
	call	429B30h
	push	437718h
	lea	eax,[ebp-5Ch]
	push	eax
	call	42D1B7h

l0042A4D7:
	call	42D120h
	mov	[esi],edi

l0042A4DE:
	mov	[esi+4h],eax

l0042A4E1:
	test	edi,edi
	setnz	al
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	ecx,[ebp-10h]
	xor	ecx,ebp
	call	427500h
	mov	esp,ebp
	pop	ebp
	ret
0042A502       CC CC CC CC CC CC CC CC CC CC CC CC CC CC   ..............

;; fn0042A510: 0042A510
fn0042A510 proc
	xor	eax,eax
	ret	4h
0042A515                CC CC CC CC CC CC CC CC CC CC CC      ...........

;; fn0042A520: 0042A520
;;   Called from:
;;     0042A88E (in fn0042A830)
;;     0042AC6F (in fn0042AB60)
fn0042A520 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	4304B0h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,8h
	push	ebx
	push	esi
	push	edi
	mov	eax,[43A008h]
	xor	eax,ebp
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	eax,[ebp+8h]
	cmp	dword ptr [eax+14h],8h
	jc	42A553h

l0042A551:
	mov	eax,[eax]

l0042A553:
	push	0h
	push	2200000h
	push	3h
	push	0h
	push	7h
	push	8h
	push	eax
	call	dword ptr [431050h]
	mov	esi,eax
	mov	[ebp+8h],esi
	mov	dword ptr [ebp-4h],0h
	cmp	esi,0FFh
	jnz	42A57Eh

l0042A57A:
	xor	bl,bl
	jmp	42A5D7h

l0042A57E:
	push	4000h
	call	42D289h
	mov	edi,eax
	add	esp,4h
	mov	[ebp-10h],edi
	push	0h
	lea	eax,[ebp-14h]
	mov	byte ptr [ebp-4h],2h
	push	eax
	push	4000h
	push	edi
	push	0h
	push	0h
	push	900A8h
	push	esi
	call	dword ptr [431014h]
	test	eax,eax
	jnz	42A5B8h

l0042A5B4:
	xor	bl,bl
	jmp	42A5CEh

l0042A5B8:
	mov	eax,[edi]
	cmp	eax,0A000000Ch
	jz	42A5CCh

l0042A5C1:
	cmp	eax,0A0000003h
	jz	42A5CCh

l0042A5C8:
	xor	bl,bl
	jmp	42A5CEh

l0042A5CC:
	mov	bl,1h

l0042A5CE:
	push	edi
	call	42D292h
	add	esp,4h

l0042A5D7:
	mov	dword ptr [ebp-4h],4h
	cmp	esi,0FFh
	jz	42A5EAh

l0042A5E3:
	push	esi
	call	dword ptr [43100Ch]

l0042A5EA:
	mov	al,bl
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret
0042A5FE                                           CC CC               ..

;; fn0042A600: 0042A600
;;   Called from:
;;     0042AC80 (in fn0042AB60)
;;     0042ACE2 (in fn0042AB60)
fn0042A600 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	4304D8h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,1Ch
	mov	eax,[43A008h]
	xor	eax,ebp
	mov	[ebp-10h],eax
	push	esi
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	test	byte ptr [ebp+0Ch],1h
	mov	eax,124h
	mov	ecx,[ebp+8h]
	mov	esi,1B6h
	cmovnz	esi,eax

l0042A63D:
	lea	eax,[ebp-28h]
	push	eax
	call	42B630h
	cmp	dword ptr [ebp-14h],8h
	lea	eax,[ebp-28h]
	push	4314F4h
	cmovnc	eax,[ebp-28h]

l0042A656:
	push	eax
	mov	dword ptr [ebp-4h],0h
	call	dword ptr [43B080h]
	add	esp,8h
	test	al,al
	jnz	42A6C5h

l0042A66B:
	cmp	dword ptr [ebp-14h],8h
	lea	eax,[ebp-28h]
	push	431500h
	cmovnc	eax,[ebp-28h]

l0042A67B:
	push	eax
	call	dword ptr [43B080h]
	add	esp,8h
	test	al,al
	jnz	42A6C5h

l0042A689:
	cmp	dword ptr [ebp-14h],8h
	lea	eax,[ebp-28h]
	push	43150Ch
	cmovnc	eax,[ebp-28h]

l0042A699:
	push	eax
	call	dword ptr [43B080h]
	add	esp,8h
	test	al,al
	jnz	42A6C5h

l0042A6A7:
	cmp	dword ptr [ebp-14h],8h
	lea	eax,[ebp-28h]
	push	431518h
	cmovnc	eax,[ebp-28h]

l0042A6B7:
	push	eax
	call	dword ptr [43B080h]
	add	esp,8h
	test	al,al
	jz	42A6C8h

l0042A6C5:
	or	esi,49h

l0042A6C8:
	mov	ecx,[ebp-14h]
	mov	dword ptr [ebp-4h],1h
	cmp	ecx,8h
	jc	42A6E6h

l0042A6D7:
	push	2h
	inc	ecx
	push	ecx
	push	dword ptr [ebp-28h]
	call	4289B0h
	add	esp,0Ch

l0042A6E6:
	mov	eax,esi
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	esi
	mov	ecx,[ebp-10h]
	xor	ecx,ebp
	call	427500h
	mov	esp,ebp
	pop	ebp
	ret
0042A702       CC CC CC CC CC CC CC CC CC CC CC CC CC CC   ..............

;; fn0042A710: 0042A710
;;   Called from:
;;     0042A85D (in fn0042A830)
;;     0042ABB5 (in fn0042AB60)
;;     0042AC61 (in fn0042AB60)
fn0042A710 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	430448h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,5Ch
	mov	eax,[43A008h]
	xor	eax,ebp
	mov	[ebp-10h],eax
	push	ebx
	push	esi
	push	edi
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	eax,[ebp+0Ch]
	mov	edi,[ebp+8h]
	mov	ebx,[ebp+10h]
	mov	[ebp-60h],eax
	call	dword ptr [431010h]
	mov	esi,eax
	test	ebx,ebx
	jz	42A75Dh

l0042A753:
	call	42D120h
	mov	[ebx],esi
	mov	[ebx+4h],eax

l0042A75D:
	cmp	esi,2h
	jz	42A7FCh

l0042A766:
	cmp	esi,3h
	jz	42A7FCh

l0042A76F:
	cmp	esi,7Bh
	jz	42A7FCh

l0042A778:
	cmp	esi,0Fh
	jz	42A7FCh

l0042A77D:
	cmp	esi,15h
	jz	42A7FCh

l0042A782:
	cmp	esi,57h
	jz	42A7FCh

l0042A787:
	cmp	esi,0A1h
	jz	42A7FCh

l0042A78F:
	cmp	esi,35h
	jz	42A7FCh

l0042A794:
	cmp	esi,20h
	jnz	42A7A8h

l0042A799:
	mov	dword ptr [edi],0Ah
	mov	dword ptr [edi+4h],0FFFFh
	jmp	42A809h

l0042A7A8:
	test	ebx,ebx
	jnz	42A7EDh

l0042A7AC:
	push	431524h
	lea	ecx,[ebp-28h]
	call	402890h
	mov	[ebp-4h],ebx
	call	42D120h
	push	eax
	push	esi
	lea	ecx,[ebp-68h]
	call	428430h
	lea	ecx,[ebp-5Ch]
	push	dword ptr [eax+4h]
	push	dword ptr [eax]
	lea	eax,[ebp-28h]
	push	dword ptr [ebp-60h]
	push	eax
	call	429B30h
	push	437718h
	lea	eax,[ebp-5Ch]
	push	eax
	call	42D1B7h

l0042A7ED:
	mov	dword ptr [edi],0h
	mov	dword ptr [edi+4h],0FFFFh
	jmp	42A809h

l0042A7FC:
	mov	dword ptr [edi],1h
	mov	dword ptr [edi+4h],0h

l0042A809:
	mov	eax,edi
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	ecx,[ebp-10h]
	xor	ecx,ebp
	call	427500h
	mov	esp,ebp
	pop	ebp
	ret
0042A827                      CC CC CC CC CC CC CC CC CC        .........

;; fn0042A830: 0042A830
;;   Called from:
;;     0042A8F0 (in fn0042A8D0)
fn0042A830 proc
	sub	esp,8h
	push	ebx
	push	esi
	mov	esi,[esp+14h]
	cmp	dword ptr [esi+14h],8h
	jc	42A843h

l0042A83F:
	mov	eax,[esi]
	jmp	42A845h

l0042A843:
	mov	eax,esi

l0042A845:
	push	eax
	call	dword ptr [431004h]
	mov	ebx,eax
	cmp	ebx,0FFh
	jnz	42A86Dh

l0042A853:
	push	dword ptr [esp+18h]
	lea	eax,[esp+0Ch]
	push	esi
	push	eax
	call	42A710h
	add	esp,0Ch
	mov	eax,[eax]
	pop	esi
	pop	ebx
	add	esp,8h
	ret

l0042A86D:
	push	edi
	mov	edi,[esp+1Ch]
	test	edi,edi
	jz	42A884h

l0042A876:
	mov	dword ptr [edi],0h
	call	42D120h
	mov	[edi+4h],eax

l0042A884:
	pop	edi
	test	ebx,400h
	jz	42A8BBh

l0042A88D:
	push	esi
	call	42A520h
	add	esp,4h
	test	al,al
	jz	42A8B0h

l0042A89A:
	test	bl,10h
	mov	eax,4h
	mov	ecx,0Bh
	pop	esi
	cmovnz	eax,ecx

l0042A8AB:
	pop	ebx
	add	esp,8h
	ret

l0042A8B0:
	pop	esi
	mov	eax,9h
	pop	ebx
	add	esp,8h
	ret

l0042A8BB:
	and	ebx,10h
	or	ebx,20h
	shr	ebx,4h
	pop	esi
	mov	eax,ebx
	pop	ebx
	add	esp,8h
	ret
0042A8CC                                     CC CC CC CC             ....

;; fn0042A8D0: 0042A8D0
;;   Called from:
;;     00404BFF (in fn00404080)
fn0042A8D0 proc
	sub	esp,8h
	push	esi
	push	edi
	mov	dword ptr [esp+8h],0h
	call	42D120h
	mov	esi,[esp+14h]
	mov	[esp+0Ch],eax
	lea	eax,[esp+8h]
	push	eax
	push	esi
	call	42A830h
	push	4314ACh
	push	dword ptr [esp+24h]
	mov	edi,eax
	xor	ecx,ecx
	test	edi,edi
	push	esi
	cmovz	ecx,[esp+1Ch]

l0042A90A:
	push	ecx
	call	42A450h
	add	esp,18h
	test	al,al
	jz	42A91Fh

l0042A917:
	pop	edi
	xor	al,al
	pop	esi
	add	esp,8h
	ret

l0042A91F:
	push	dword ptr [esp+18h]
	push	edi
	push	esi
	call	42A9E0h
	add	esp,0Ch
	pop	edi
	pop	esi
	add	esp,8h
	ret
0042A933          CC CC CC CC CC CC CC CC CC CC CC CC CC    .............

;; fn0042A940: 0042A940
;;   Called from:
;;     0042AA49 (in fn0042A9E0)
fn0042A940 proc
	mov	eax,[esp+4h]
	cmp	dword ptr [eax+14h],8h
	jc	42A94Ch

l0042A94A:
	mov	eax,[eax]

l0042A94C:
	push	eax
	call	dword ptr [431008h]
	test	eax,eax
	jnz	42A98Ah

l0042A957:
	call	dword ptr [431010h]
	cmp	eax,2h
	jz	42A98Ah

l0042A962:
	cmp	eax,3h
	jz	42A98Ah

l0042A967:
	cmp	eax,7Bh
	jz	42A98Ah

l0042A96C:
	cmp	eax,0Fh
	jz	42A98Ah

l0042A971:
	cmp	eax,15h
	jz	42A98Ah

l0042A976:
	cmp	eax,57h
	jz	42A98Ah

l0042A97B:
	cmp	eax,0A1h
	jz	42A98Ah

l0042A982:
	cmp	eax,35h
	jz	42A98Ah

l0042A987:
	xor	al,al
	ret

l0042A98A:
	mov	al,1h
	ret
0042A98D                                        CC CC CC              ...

;; fn0042A990: 0042A990
;;   Called from:
;;     0042AA13 (in fn0042A9E0)
fn0042A990 proc
	mov	eax,[esp+4h]
	cmp	dword ptr [eax+14h],8h
	jc	42A99Ch

l0042A99A:
	mov	eax,[eax]

l0042A99C:
	push	eax
	call	dword ptr [431048h]
	test	eax,eax
	jnz	42A9DAh

l0042A9A7:
	call	dword ptr [431010h]
	cmp	eax,2h
	jz	42A9DAh

l0042A9B2:
	cmp	eax,3h
	jz	42A9DAh

l0042A9B7:
	cmp	eax,7Bh
	jz	42A9DAh

l0042A9BC:
	cmp	eax,0Fh
	jz	42A9DAh

l0042A9C1:
	cmp	eax,15h
	jz	42A9DAh

l0042A9C6:
	cmp	eax,57h
	jz	42A9DAh

l0042A9CB:
	cmp	eax,0A1h
	jz	42A9DAh

l0042A9D2:
	cmp	eax,35h
	jz	42A9DAh

l0042A9D7:
	xor	al,al
	ret

l0042A9DA:
	mov	al,1h
	ret
0042A9DD                                        CC CC CC              ...

;; fn0042A9E0: 0042A9E0
;;   Called from:
;;     0042A925 (in fn0042A8D0)
fn0042A9E0 proc
	mov	eax,[esp+8h]
	push	esi
	cmp	eax,1h
	jnz	42AA04h

l0042A9EA:
	mov	esi,[esp+10h]
	test	esi,esi
	jz	42AA00h

l0042A9F2:
	mov	dword ptr [esi],0h
	call	42D120h
	mov	[esi+4h],eax

l0042AA00:
	xor	al,al
	pop	esi
	ret

l0042AA04:
	cmp	eax,3h
	jz	42AA44h

l0042AA09:
	cmp	eax,0Bh
	jz	42AA44h

l0042AA0E:
	mov	esi,[esp+8h]
	push	esi
	call	42A990h
	add	esp,4h
	test	al,al
	jnz	42AA27h

l0042AA1F:
	call	dword ptr [431010h]
	jmp	42AA29h

l0042AA27:
	xor	eax,eax

l0042AA29:
	push	4314ACh
	push	dword ptr [esp+14h]
	push	esi
	push	eax
	call	42A450h
	add	esp,10h
	test	al,al
	jz	42AA76h

l0042AA40:
	xor	al,al
	pop	esi
	ret

l0042AA44:
	mov	esi,[esp+8h]
	push	esi
	call	42A940h
	add	esp,4h
	test	al,al
	jnz	42AA5Dh

l0042AA55:
	call	dword ptr [431010h]
	jmp	42AA5Fh

l0042AA5D:
	xor	eax,eax

l0042AA5F:
	push	4314ACh
	push	dword ptr [esp+14h]
	push	esi
	push	eax
	call	42A450h
	add	esp,10h
	test	al,al
	jnz	42AA00h

l0042AA76:
	mov	al,1h
	pop	esi
	ret
0042AA7A                               CC CC CC CC CC CC           ......

;; fn0042AA80: 0042AA80
;;   Called from:
;;     00404ABC (in fn00404080)
fn0042AA80 proc
	push	esi
	mov	esi,[esp+0Ch]
	push	edi
	cmp	dword ptr [esi+14h],8h
	jc	42AA90h

l0042AA8C:
	mov	eax,[esi]
	jmp	42AA92h

l0042AA90:
	mov	eax,esi

l0042AA92:
	mov	edi,[esp+0Ch]
	cmp	dword ptr [edi+14h],8h
	jc	42AAA0h

l0042AA9C:
	mov	ecx,[edi]
	jmp	42AAA2h

l0042AAA0:
	mov	ecx,edi

l0042AAA2:
	push	3h
	push	eax
	push	ecx
	call	dword ptr [43101Ch]
	test	eax,eax
	jnz	42AAB8h

l0042AAB0:
	call	dword ptr [431010h]
	jmp	42AABAh

l0042AAB8:
	xor	eax,eax

l0042AABA:
	push	431580h
	push	dword ptr [esp+18h]
	push	esi
	push	edi
	push	eax
	call	42A390h
	add	esp,14h
	pop	edi
	pop	esi
	ret
0042AAD1    CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC  ...............
0042AAE0 55 8B EC 6A FF 68 A0 03 43 00 64 A1 00 00 00 00 U..j.h..C.d.....
0042AAF0 50 56 57 A1 08 A0 43 00 33 C5 50 8D 45 F4 64 A3 PVW...C.3.P.E.d.
0042AB00 00 00 00 00 C7 01 00 00 00 00 8B 71 04 C7 41 04 ...........q..A.
0042AB10 00 00 00 00 C7 45 FC 00 00 00 00 85 F6 74 2B 83 .....E.......t+.
0042AB20 CF FF 8D 4E 04 8B C7 F0 0F C1 01 83 F8 01 75 1A ...N..........u.
0042AB30 8B 06 8B CE FF 50 04 8D 46 08 F0 0F C1 38 83 FF .....P..F....8..
0042AB40 01 75 07 8B 06 8B CE FF 50 08 8B 4D F4 64 89 0D .u......P..M.d..
0042AB50 00 00 00 00 59 5F 5E 8B E5 5D C3 CC CC CC CC CC ....Y_^..]......

;; fn0042AB60: 0042AB60
;;   Called from:
;;     00403F4D (in fn00403F40)
;;     00404124 (in fn00404080)
fn0042AB60 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	430510h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,2Ch
	mov	eax,[43A008h]
	xor	eax,ebp
	mov	[ebp-10h],eax
	push	ebx
	push	esi
	push	edi
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	edi,[ebp+0Ch]
	mov	esi,[ebp+10h]
	mov	ebx,[ebp+8h]
	mov	[ebp-34h],esi
	cmp	dword ptr [edi+14h],8h
	jc	42ABA1h

l0042AB9D:
	mov	eax,[edi]
	jmp	42ABA3h

l0042ABA1:
	mov	eax,edi

l0042ABA3:
	push	eax
	call	dword ptr [431004h]
	mov	[ebp-38h],eax
	cmp	eax,0FFh
	jnz	42ABC2h

l0042ABB2:
	push	esi
	push	edi
	push	ebx
	call	42A710h
	add	esp,0Ch
	jmp	42ACFAh

l0042ABC2:
	test	eax,400h
	jz	42ACB9h

l0042ABCD:
	cmp	dword ptr [edi+14h],8h
	jc	42ABD7h

l0042ABD3:
	mov	edx,[edi]
	jmp	42ABD9h

l0042ABD7:
	mov	edx,edi

l0042ABD9:
	mov	ecx,edx
	mov	dword ptr [ebp-18h],0h
	xor	eax,eax
	mov	dword ptr [ebp-14h],7h
	mov	[ebp-28h],ax
	lea	esi,[ecx+2h]

l0042ABF2:
	mov	ax,[ecx]
	add	ecx,2h
	test	ax,ax
	jnz	42ABF2h

l0042ABFD:
	sub	ecx,esi
	sar	ecx,1h
	push	ecx
	push	edx
	lea	ecx,[ebp-28h]
	call	42A160h
	cmp	dword ptr [ebp-14h],8h
	lea	eax,[ebp-28h]
	push	0h
	cmovnc	eax,[ebp-28h]

l0042AC18:
	push	2000000h
	push	3h
	push	0h
	push	7h
	push	0h
	push	eax
	mov	dword ptr [ebp-4h],0h
	call	dword ptr [431050h]
	mov	esi,eax
	mov	[ebp-2Ch],esi
	mov	eax,[ebp-14h]
	mov	byte ptr [ebp-4h],3h
	cmp	eax,8h
	jc	42AC53h

l0042AC44:
	inc	eax
	push	2h
	push	eax
	push	dword ptr [ebp-28h]
	call	4289B0h
	add	esp,0Ch

l0042AC53:
	mov	byte ptr [ebp-4h],2h
	cmp	esi,0FFh
	jnz	42AC6Eh

l0042AC5C:
	push	dword ptr [ebp-34h]
	push	edi
	push	ebx
	call	42A710h
	add	esp,0Ch
	jmp	42ACFAh

l0042AC6E:
	push	edi
	call	42A520h
	add	esp,4h
	test	al,al
	jnz	42ACA1h

l0042AC7B:
	mov	eax,[ebp-38h]
	push	eax
	push	edi
	call	42A600h
	add	esp,8h
	mov	dword ptr [ebx],9h
	mov	[ebx+4h],eax
	push	esi
	mov	dword ptr [ebp-4h],5h
	call	dword ptr [43100Ch]
	jmp	42ACFAh

l0042ACA1:
	push	esi
	mov	dword ptr [ebp-4h],6h
	call	dword ptr [43100Ch]
	mov	esi,[ebp-34h]
	mov	dword ptr [ebp-4h],0FFFFFFFFh

l0042ACB9:
	test	esi,esi
	jz	42ACCBh

l0042ACBD:
	mov	dword ptr [esi],0h
	call	42D120h
	mov	[esi+4h],eax

l0042ACCB:
	mov	eax,[ebp-38h]
	mov	dword ptr [ebp-30h],3h
	push	eax
	push	edi
	test	al,10h
	jnz	42ACE2h

l0042ACDB:
	mov	dword ptr [ebp-30h],2h

l0042ACE2:
	call	42A600h
	lea	ecx,[ebp-30h]
	mov	[ebp-2Ch],eax
	mov	eax,[ecx]
	add	esp,8h
	mov	[ebx],eax
	mov	eax,[ecx+4h]
	mov	[ebx+4h],eax

l0042ACFA:
	mov	eax,ebx
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	ecx,[ebp-10h]
	xor	ecx,ebp
	call	427500h
	mov	esp,ebp
	pop	ebp
	ret
0042AD18                         CC CC CC CC CC CC CC CC         ........
0042AD20 55 8B EC 6A FF 68 59 05 43 00 64 A1 00 00 00 00 U..j.hY.C.d.....
0042AD30 50 83 EC 08 53 56 57 A1 08 A0 43 00 33 C5 50 8D P...SVW...C.3.P.
0042AD40 45 F4 64 A3 00 00 00 00 8B F1 C7 45 EC 00 00 00 E.d........E....
0042AD50 00 8B 7D 08 C7 47 10 00 00 00 00 C7 47 14 0F 00 ..}..G......G...
0042AD60 00 00 C6 07 00 8B 5E 10 C7 45 FC 00 00 00 00 C7 ......^..E......
0042AD70 45 EC 01 00 00 00 85 DB 74 30 8B 46 14 83 F8 08 E.......t0.F....
0042AD80 72 07 8B 0E 89 4D F0 EB 03 89 75 F0 83 F8 08 72 r....M....u....r
0042AD90 02 8B 36 E8 88 05 00 00 50 8B 45 F0 57 8D 0C 58 ..6.....P.E.W..X
0042ADA0 51 56 E8 39 DF FF FF 83 C4 10 8B C7 8B 4D F4 64 QV.9.........M.d
0042ADB0 89 0D 00 00 00 00 59 5F 5E 5B 8B E5 5D C2 04 00 ......Y_^[..]...
0042ADC0 55 8B EC 6A FF 68 90 05 43 00 64 A1 00 00 00 00 U..j.h..C.d.....
0042ADD0 50 83 EC 3C A1 08 A0 43 00 33 C5 89 45 EC 53 56 P..<...C.3..E.SV
0042ADE0 57 50 8D 45 F4 64 A3 00 00 00 00 89 65 F0 8B F1 WP.E.d......e...
0042ADF0 8B 7E 2C 89 75 B8 85 FF 75 0A E8 C1 E8 FF FF E9 .~,.u...u.......
0042AE00 13 01 00 00 83 7F 40 00 C7 45 FC 00 00 00 00 0F ......@..E......
0042AE10 85 F4 00 00 00 8B CE E8 A4 E8 FF FF 8B D0 8D 5A ...............Z
0042AE20 01 8A 0A 42 84 C9 75 F9 2B D3 8D 4F 30 52 50 E8 ...B..u.+..O0RP.
0042AE30 3C 7C FD FF 8B 4E 2C 83 79 10 00 74 60 6A 03 68 <|...N,.y..t`j.h
0042AE40 A0 14 43 00 83 C1 30 E8 F4 5E FE FF 8B 4E 2C 8D ..C...0..^...N,.
0042AE50 45 D4 50 E8 C8 FE FF FF 8B 4E 2C 6A FF 6A 00 50 E.P......N,j.j.P
0042AE60 83 C1 30 C6 45 FC 01 E8 A4 DC FF FF 8B 45 E8 C6 ..0.E........E..
0042AE70 45 FC 02 83 F8 10 72 0F 40 6A 01 50 FF 75 D4 E8 E.....r.@j.P.u..
0042AE80 2C DB FF FF 83 C4 0C 8B 4E 2C 6A 01 68 A4 14 43 ,.......N,j.h..C
0042AE90 00 83 C1 30 C6 45 FC 00 E8 A3 5E FE FF 8B 4E 2C ...0.E....^...N,
0042AEA0 83 79 28 00 74 63 6A 03 68 A8 14 43 00 83 C1 30 .y(.tcj.h..C...0
0042AEB0 E8 8B 5E FE FF 8B 4E 2C 8D 45 BC 50 83 C1 18 E8 ..^...N,.E.P....
0042AEC0 5C FE FF FF 8B 4E 2C 6A FF 6A 00 50 83 C1 30 C6 \....N,j.j.P..0.
0042AED0 45 FC 03 E8 38 DC FF FF 8B 45 D0 C6 45 FC 04 83 E...8....E..E...
0042AEE0 F8 10 72 0F 40 6A 01 50 FF 75 BC E8 C0 DA FF FF ..r.@j.P.u......
0042AEF0 83 C4 0C 8B 4E 2C 6A 01 68 A4 14 43 00 83 C1 30 ....N,j.h..C...0
0042AF00 C6 45 FC 00 E8 37 5E FE FF 8B 46 2C 83 C0 30 83 .E...7^...F,..0.
0042AF10 78 14 10 72 02 8B 00 8B 4D F4 64 89 0D 00 00 00 x..r....M.d.....
0042AF20 00 59 5F 5E 5B 8B 4D EC 33 CD E8 D1 C5 FF FF 8B .Y_^[.M.3.......
0042AF30 E5 5D C3 8B 4D B8 E8 85 E7 FF FF 89 45 B8 B8 44 .]..M.......E..D
0042AF40 AF 42 00 C3 8B 45 B8 EB CE CC CC CC CC CC CC CC .B...E..........

;; fn0042AF50: 0042AF50
;;   Called from:
;;     0042BAF7 (in fn0042BAC0)
;;     0042C18D (in fn0042C020)
fn0042AF50 proc
	push	ebx
	push	ebp
	push	esi
	push	edi
	mov	edi,[esp+24h]
	test	edi,edi
	jz	42AFA4h

l0042AF5C:
	mov	eax,[esp+1Ch]
	mov	ecx,[esp+18h]
	cmp	eax,ecx
	jnc	42AFA4h

l0042AF68:
	mov	edx,[esp+14h]
	lea	ebx,[edx+ecx*2]
	lea	edx,[edx+eax*2]
	cmp	edx,ebx
	jnc	42AFA4h

l0042AF76:
	mov	ebp,[esp+20h]
	nop	word ptr [eax+eax+0h]

l0042AF80:
	mov	ecx,edi
	mov	eax,ebp
	test	edi,edi
	jz	42AF9Dh

l0042AF88:
	movzx	esi,word ptr [edx]
	nop	dword ptr [eax+eax+0h]

l0042AF90:
	cmp	[eax],si
	jz	42AFACh

l0042AF95:
	add	eax,2h
	sub	ecx,1h
	jnz	42AF90h

l0042AF9D:
	add	edx,2h
	cmp	edx,ebx
	jc	42AF80h

l0042AFA4:
	pop	edi
	pop	esi
	pop	ebp
	or	eax,0FFh
	pop	ebx
	ret

l0042AFAC:
	sub	edx,[esp+14h]
	pop	edi
	pop	esi
	sar	edx,1h
	pop	ebp
	mov	eax,edx
	pop	ebx
	ret
0042AFB9                            CC CC CC CC CC CC CC          .......

;; fn0042AFC0: 0042AFC0
;;   Called from:
;;     0042BA78 (in fn0042B9F0)
fn0042AFC0 proc
	push	ebx
	push	ebp
	push	esi
	push	edi
	mov	edi,[esp+24h]
	test	edi,edi
	jz	42B021h

l0042AFCC:
	mov	eax,[esp+18h]
	test	eax,eax
	jz	42B021h

l0042AFD4:
	mov	ecx,[esp+1Ch]
	dec	eax
	mov	ebx,[esp+14h]
	cmp	eax,ecx
	mov	ebp,[esp+20h]
	cmovc	ecx,eax

l0042AFE6:
	lea	edx,[ebx+ecx*2]
	nop	dword ptr [eax+0h]

l0042AFF0:
	mov	ecx,edi
	mov	eax,ebp
	test	edi,edi
	jz	42B00Dh

l0042AFF8:
	movzx	esi,word ptr [edx]
	nop	dword ptr [eax+eax+0h]

l0042B000:
	cmp	[eax],si
	jz	42B016h

l0042B005:
	add	eax,2h
	sub	ecx,1h
	jnz	42B000h

l0042B00D:
	cmp	edx,ebx
	jz	42B021h

l0042B011:
	sub	edx,2h
	jmp	42AFF0h

l0042B016:
	pop	edi
	sub	edx,ebx
	pop	esi
	sar	edx,1h
	pop	ebp
	mov	eax,edx
	pop	ebx
	ret

l0042B021:
	pop	edi
	pop	esi
	pop	ebp
	or	eax,0FFh
	pop	ebx
	ret
0042B029                            CC CC CC CC CC CC CC          .......

;; fn0042B030: 0042B030
;;   Called from:
;;     0042B326 (in fn0042B320)
fn0042B030 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	4305C9h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,14h
	push	ebx
	push	esi
	push	edi
	mov	eax,[43A008h]
	xor	eax,ebp
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	push	0h
	lea	ecx,[ebp-14h]
	call	dword ptr [4311B4h]
	mov	eax,[43B0BCh]
	mov	ecx,[431144h]
	mov	dword ptr [ebp-4h],0h
	mov	[ebp-10h],eax
	call	dword ptr [43113Ch]
	mov	ebx,[ebp+8h]
	mov	edi,eax
	mov	eax,[ebx+4h]
	cmp	edi,[eax+0Ch]
	jnc	42B097h

l0042B08B:
	mov	ecx,[eax+8h]
	mov	esi,[ecx+edi*4]
	test	esi,esi
	jnz	42B0FDh

l0042B095:
	jmp	42B099h

l0042B097:
	xor	esi,esi

l0042B099:
	cmp	byte ptr [eax+14h],0h
	jz	42B0B0h

l0042B09F:
	call	dword ptr [4311ACh]
	cmp	edi,[eax+0Ch]
	jnc	42B0B4h

l0042B0AA:
	mov	eax,[eax+8h]
	mov	esi,[eax+edi*4]

l0042B0B0:
	test	esi,esi
	jnz	42B0FDh

l0042B0B4:
	mov	esi,[ebp-10h]
	test	esi,esi
	jnz	42B0FDh

l0042B0BB:
	lea	eax,[ebp-10h]
	push	ebx
	push	eax
	call	dword ptr [431158h]
	add	esp,8h
	cmp	eax,0FFh
	jnz	42B0E4h

l0042B0CE:
	lea	ecx,[ebp-20h]
	call	4013E0h
	push	437AD8h
	lea	eax,[ebp-20h]
	push	eax
	call	42D1B7h

l0042B0E4:
	mov	esi,[ebp-10h]
	mov	ecx,esi
	mov	[43B0BCh],esi
	mov	edx,[esi]
	call	dword ptr [edx+4h]
	push	esi
	call	42749Eh
	add	esp,4h

l0042B0FD:
	lea	ecx,[ebp-14h]
	call	dword ptr [4311B8h]
	mov	eax,esi
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret
0042B11A                               CC CC CC CC CC CC           ......

;; fn0042B120: 0042B120
;;   Called from:
;;     0042C1E7 (in fn0042C020)
fn0042B120 proc
	push	esi
	mov	esi,ecx
	cmp	dword ptr [esi+14h],1h
	jnc	42B130h

l0042B129:
	push	1h
	call	4288A0h

l0042B130:
	cmp	dword ptr [esi+14h],8h
	jc	42B13Ah

l0042B136:
	mov	ecx,[esi]
	jmp	42B13Ch

l0042B13A:
	mov	ecx,esi

l0042B13C:
	mov	ax,[esp+8h]
	mov	[ecx],ax
	cmp	dword ptr [esi+14h],8h
	mov	dword ptr [esi+10h],1h
	jc	42B15Fh

l0042B151:
	mov	eax,[esi]
	xor	ecx,ecx
	mov	[eax+2h],cx
	mov	eax,esi
	pop	esi
	ret	4h

l0042B15F:
	mov	eax,esi
	xor	ecx,ecx
	pop	esi
	mov	[eax+2h],cx
	ret	4h
0042B16B                                  CC CC CC CC CC            .....
0042B170 56 8B F1 FF 15 54 11 43 00 F6 44 24 08 01 74 0B V....T.C..D$..t.
0042B180 6A 34 56 E8 B7 C4 FF FF 83 C4 08 8B C6 5E C2 04 j4V..........^..
0042B190 00 CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................

;; fn0042B1A0: 0042B1A0
;;   Called from:
;;     0042B2CE (in fn0042B210)
fn0042B1A0 proc
	mov	edx,[esp+4h]
	push	esi
	push	edi
	mov	edi,edx
	lea	esi,[edi+2h]
	nop	dword ptr [eax+eax+0h]

l0042B1B0:
	mov	ax,[edi]
	add	edi,2h
	test	ax,ax
	jnz	42B1B0h

l0042B1BB:
	sub	edi,esi
	lea	esi,[ecx+10h]
	sar	edi,1h
	cmp	dword ptr [ecx+14h],8h
	jc	42B1CAh

l0042B1C8:
	mov	ecx,[ecx]

l0042B1CA:
	mov	esi,[esi]
	cmp	esi,edi
	jnz	42B205h

l0042B1D0:
	test	esi,esi
	jz	42B1FEh

l0042B1D4:
	mov	ax,[ecx]
	cmp	ax,[edx]
	jnz	42B1EEh

l0042B1DC:
	add	ecx,2h
	add	edx,2h
	sub	esi,1h
	jnz	42B1D4h

l0042B1E7:
	pop	edi
	mov	al,1h
	pop	esi
	ret	4h

l0042B1EE:
	movzx	eax,word ptr [ecx]
	cmp	ax,[edx]
	sbb	eax,eax
	and	eax,0FEh
	add	eax,1h
	jnz	42B205h

l0042B1FE:
	pop	edi
	mov	al,1h
	pop	esi
	ret	4h

l0042B205:
	pop	edi
	xor	al,al
	pop	esi
	ret	4h
0042B20C                                     CC CC CC CC             ....

;; fn0042B210: 0042B210
;;   Called from:
;;     0042B691 (in fn0042B630)
;;     0042B6A9 (in fn0042B630)
;;     0042B6E1 (in fn0042B630)
;;     0042B6F9 (in fn0042B630)
fn0042B210 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	430631h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,28h
	mov	eax,[43A008h]
	xor	eax,ebp
	mov	[ebp-10h],eax
	push	ebx
	push	esi
	push	edi
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	edi,ecx
	mov	ebx,[ebp+8h]
	xor	eax,eax
	mov	dword ptr [ebp-2Ch],0h
	mov	[ebp-34h],ebx
	mov	dword ptr [ebx+10h],0h
	mov	dword ptr [ebx+14h],7h
	mov	[ebx],ax
	mov	[ebp-4h],eax
	lea	esi,[ebx+1Ch]
	push	0FFh
	lea	eax,[ebp-30h]
	mov	dword ptr [ebp-2Ch],1h
	push	eax
	push	esi
	push	edi
	mov	[ebx+18h],edi
	call	42BB60h
	add	esp,10h
	lea	eax,[ebp-28h]
	mov	ecx,edi
	push	dword ptr [ebp-30h]
	push	dword ptr [esi]
	push	eax
	call	42C2A0h
	mov	dword ptr [ebp-4h],1h
	cmp	ebx,eax
	jz	42B2A4h

l0042B298:
	push	0FFh
	push	0h
	push	eax
	mov	ecx,ebx
	call	42A070h

l0042B2A4:
	mov	eax,[ebp-14h]
	mov	dword ptr [ebp-4h],2h
	cmp	eax,8h
	jc	42B2C2h

l0042B2B3:
	inc	eax
	push	2h
	push	eax
	push	dword ptr [ebp-28h]
	call	4289B0h
	add	esp,0Ch

l0042B2C2:
	push	dword ptr [43A01Ch]
	mov	ecx,ebx
	mov	byte ptr [ebp-4h],0h
	call	42B1A0h
	test	al,al
	jz	42B2FAh

l0042B2D7:
	mov	edx,[43A018h]
	mov	ecx,edx
	lea	esi,[ecx+2h]

l0042B2E2:
	mov	ax,[ecx]
	add	ecx,2h
	test	ax,ax
	jnz	42B2E2h

l0042B2ED:
	sub	ecx,esi
	sar	ecx,1h
	push	ecx
	push	edx
	mov	ecx,ebx
	call	42A160h

l0042B2FA:
	mov	eax,ebx
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	ecx,[ebp-10h]
	xor	ecx,ebp
	call	427500h
	mov	esp,ebp
	pop	ebp
	ret	4h
0042B31A                               CC CC CC CC CC CC           ......

;; fn0042B320: 0042B320
;;   Called from:
;;     00404101 (in fn00404080)
;;     00404A43 (in fn00404080)
;;     00404A94 (in fn00404080)
;;     00404BD9 (in fn00404080)
;;     004143FF (in fn004143E0)
fn0042B320 proc
	call	42C210h
	push	eax
	call	42B030h
	add	esp,4h
	ret
0042B32F                                              CC                .

;; fn0042B330: 0042B330
;;   Called from:
;;     0042BDEF (in fn0042BD90)
;;     0042BE02 (in fn0042BD90)
fn0042B330 proc
	mov	edx,[esp+4h]
	push	ebx
	push	esi
	push	edi
	cmp	dword ptr [edx+14h],8h
	lea	edi,[edx+10h]
	jc	42B342h

l0042B340:
	mov	edx,[edx]

l0042B342:
	cmp	dword ptr [ecx+14h],8h
	lea	ebx,[ecx+10h]
	jc	42B34Dh

l0042B34B:
	mov	ecx,[ecx]

l0042B34D:
	mov	edi,[edi]
	mov	ebx,[ebx]
	cmp	edi,ebx
	mov	esi,ebx
	cmovc	esi,edi

l0042B358:
	test	esi,esi
	jz	42B385h

l0042B35C:
	nop	dword ptr [eax+0h]

l0042B360:
	mov	ax,[ecx]
	cmp	ax,[edx]
	jnz	42B375h

l0042B368:
	add	ecx,2h
	add	edx,2h
	sub	esi,1h
	jnz	42B360h

l0042B373:
	jmp	42B385h

l0042B375:
	movzx	eax,word ptr [ecx]
	cmp	ax,[edx]
	sbb	eax,eax
	and	eax,0FEh
	add	eax,1h
	jnz	42B396h

l0042B385:
	cmp	edi,ebx
	jbe	42B392h

l0042B389:
	pop	edi
	pop	esi
	or	eax,0FFh
	pop	ebx
	ret	4h

l0042B392:
	sbb	eax,eax
	neg	eax

l0042B396:
	pop	edi
	pop	esi
	pop	ebx
	ret	4h
0042B39C                                     CC CC CC CC             ....

;; fn0042B3A0: 0042B3A0
;;   Called from:
;;     0042C270 (in fn0042C210)
fn0042B3A0 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	430677h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,10h
	push	ebx
	push	esi
	push	edi
	mov	eax,[43A008h]
	xor	eax,ebp
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	dword ptr [ebp-10h],0h
	push	1h
	mov	dword ptr [ebp-4h],0h
	call	dword ptr [4311A8h]
	mov	ebx,eax
	mov	[ebp-18h],ebx
	push	34h
	mov	dword ptr [ebp-4h],1h
	call	427511h
	mov	esi,eax
	add	esp,8h
	mov	[ebp-14h],esi
	mov	byte ptr [ebp-4h],2h
	test	esi,esi
	jz	42B413h

l0042B401:
	push	0h
	mov	ecx,esi
	call	dword ptr [43115Ch]
	mov	dword ptr [esi],4315DCh
	jmp	42B415h

l0042B413:
	xor	esi,esi

l0042B415:
	mov	edi,[ebp+8h]
	push	ebx
	mov	byte ptr [ebp-4h],1h
	call	dword ptr [431164h]
	add	esp,4h
	mov	[edi+4h],eax
	test	esi,esi
	jz	42B45Fh

l0042B42D:
	mov	ecx,[431144h]
	call	dword ptr [43113Ch]
	push	eax
	push	esi
	push	dword ptr [edi+4h]
	call	dword ptr [431160h]
	mov	ecx,[edi+4h]
	add	esp,0Ch
	mov	dword ptr [ecx+10h],0h
	add	ecx,18h
	push	4315D4h
	call	dword ptr [431168h]

l0042B45F:
	mov	dword ptr [ebp-4h],3h
	test	ebx,ebx
	jz	42B47Dh

l0042B46A:
	mov	eax,[ebx]
	mov	ecx,ebx
	call	dword ptr [eax+8h]
	test	eax,eax
	jz	42B47Dh

l0042B475:
	mov	edx,[eax]
	mov	ecx,eax
	push	1h
	call	dword ptr [edx]

l0042B47D:
	mov	eax,edi
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret
0042B491    CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC  ...............
0042B4A0 32 C0 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC 2...............
0042B4B0 33 C0 C2 10 00 CC CC CC CC CC CC CC CC CC CC CC 3...............

;; fn0042B4C0: 0042B4C0
;;   Called from:
;;     0042B6C5 (in fn0042B630)
fn0042B4C0 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	4306ACh
	mov	eax,fs:[0000h]
	push	eax
	mov	eax,[43A008h]
	xor	eax,ebp
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	eax,fs:[002Ch]
	mov	ecx,[43B10Ch]
	mov	ecx,[eax+ecx*4]
	mov	eax,[43B0ACh]
	cmp	eax,[ecx+4h]
	jle	42B543h

l0042B4FE:
	push	43B0ACh
	call	42D454h
	add	esp,4h
	cmp	dword ptr [43B0ACh],0FFh
	jnz	42B543h

l0042B514:
	push	2h
	push	431608h
	mov	ecx,43A038h
	mov	dword ptr [ebp-4h],0h
	call	42A160h
	push	4309F0h
	call	427952h
	push	43B0ACh
	call	42D40Ah
	add	esp,8h

l0042B543:
	mov	eax,43A038h
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	mov	esp,ebp
	pop	ebp
	ret
0042B557                      CC CC CC CC CC CC CC CC CC        .........

;; fn0042B560: 0042B560
;;   Called from:
;;     0042B675 (in fn0042B630)
;;     0042B8A7 (in fn0042B830)
;;     0042C157 (in fn0042C020)
fn0042B560 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	4306DCh
	mov	eax,fs:[0000h]
	push	eax
	mov	eax,[43A008h]
	xor	eax,ebp
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	eax,fs:[002Ch]
	mov	ecx,[43B10Ch]
	mov	ecx,[eax+ecx*4]
	mov	eax,[43B0A8h]
	cmp	eax,[ecx+4h]
	jle	42B5E3h

l0042B59E:
	push	43B0A8h
	call	42D454h
	add	esp,4h
	cmp	dword ptr [43B0A8h],0FFh
	jnz	42B5E3h

l0042B5B4:
	push	1h
	push	431604h
	mov	ecx,43A020h
	mov	dword ptr [ebp-4h],0h
	call	42A160h
	push	430A70h
	call	427952h
	push	43B0A8h
	call	42D40Ah
	add	esp,8h

l0042B5E3:
	mov	eax,43A020h
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	mov	esp,ebp
	pop	ebp
	ret
0042B5F7                      CC CC CC CC CC CC CC CC CC        .........

;; fn0042B600: 0042B600
;;   Called from:
;;     0042B686 (in fn0042B630)
;;     0042B69D (in fn0042B630)
;;     0042B6D6 (in fn0042B630)
;;     0042B6ED (in fn0042B630)
fn0042B600 proc
	push	ecx
	mov	eax,[esp+8h]
	xor	edx,edx
	mov	dword ptr [esp],0h
	mov	dword ptr [eax+10h],0h
	mov	dword ptr [eax+14h],7h
	mov	[eax],dx
	mov	[eax+18h],ecx
	mov	ecx,[ecx+10h]
	mov	[eax+1Ch],ecx
	pop	ecx
	ret	4h
0042B62C                                     CC CC CC CC             ....

;; fn0042B630: 0042B630
;;   Called from:
;;     0042A641 (in fn0042A600)
fn0042B630 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	430721h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,54h
	mov	eax,[43A008h]
	xor	eax,ebp
	mov	[ebp-10h],eax
	push	ebx
	push	esi
	push	edi
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	edi,[ebp+8h]
	lea	eax,[ebp-28h]
	push	eax
	mov	dword ptr [ebp-60h],0h
	call	42B830h
	mov	dword ptr [ebp-4h],0h
	call	42B560h
	mov	esi,eax
	sub	esp,20h
	mov	byte ptr [ebp-4h],1h
	mov	ecx,esi
	push	esp
	call	42B600h
	sub	esp,20h
	mov	ecx,esi
	push	esp
	call	42B210h
	sub	esp,20h
	lea	ecx,[ebp-28h]
	push	esp
	call	42B600h
	sub	esp,20h
	lea	ecx,[ebp-28h]
	push	esp
	call	42B210h
	call	42BD90h
	add	esp,80h
	mov	byte ptr [ebp-4h],0h
	test	eax,eax
	jz	42B7D2h

l0042B6C5:
	call	42B4C0h
	mov	esi,eax
	sub	esp,20h
	mov	byte ptr [ebp-4h],2h
	mov	ecx,esi
	push	esp
	call	42B600h
	sub	esp,20h
	mov	ecx,esi
	push	esp
	call	42B210h
	sub	esp,20h
	lea	ecx,[ebp-28h]
	push	esp
	call	42B600h
	sub	esp,20h
	lea	ecx,[ebp-28h]
	push	esp
	call	42B210h
	call	42BD90h
	add	esp,80h
	mov	byte ptr [ebp-4h],0h
	test	eax,eax
	jz	42B7D2h

l0042B715:
	push	0FFh
	push	2Eh
	lea	ecx,[ebp-28h]
	call	42BB10h
	mov	ecx,eax
	cmp	ecx,0FFh
	jnz	42B746h

l0042B728:
	xor	eax,eax
	mov	dword ptr [ebp-30h],0h
	mov	dword ptr [ebp-2Ch],7h
	mov	[ebp-40h],ax
	lea	eax,[ebp-40h]
	mov	ebx,2h
	jmp	42B762h

l0042B746:
	cmp	dword ptr [ebp-14h],8h
	lea	eax,[ebp-28h]
	cmovnc	eax,[ebp-28h]

l0042B751:
	lea	eax,[eax+ecx*2]
	push	eax
	lea	ecx,[ebp-58h]
	call	429CB0h
	mov	ebx,4h

l0042B762:
	push	eax
	mov	ecx,edi
	call	429C20h
	or	ebx,1h
	test	bl,4h
	jz	42B796h

l0042B772:
	and	ebx,0FBh
	mov	[ebp-60h],ebx
	mov	eax,[ebp-44h]
	mov	dword ptr [ebp-4h],5h
	cmp	eax,8h
	jc	42B796h

l0042B787:
	inc	eax
	push	2h
	push	eax
	push	dword ptr [ebp-58h]
	call	4289B0h
	add	esp,0Ch

l0042B796:
	mov	dword ptr [ebp-4h],0h
	test	bl,2h
	jz	42B7BDh

l0042B7A2:
	mov	eax,[ebp-2Ch]
	mov	byte ptr [ebp-4h],6h
	cmp	eax,8h
	jc	42B7BDh

l0042B7AE:
	inc	eax
	push	2h
	push	eax
	push	dword ptr [ebp-40h]
	call	4289B0h
	add	esp,0Ch

l0042B7BD:
	mov	ecx,[ebp-14h]
	mov	dword ptr [ebp-4h],7h
	cmp	ecx,8h
	jc	42B803h

l0042B7CC:
	push	2h
	inc	ecx
	push	ecx
	jmp	42B7F8h

l0042B7D2:
	xor	eax,eax
	mov	dword ptr [edi+10h],0h
	mov	dword ptr [edi+14h],7h
	mov	[edi],ax
	mov	eax,[ebp-14h]
	mov	dword ptr [ebp-4h],3h
	cmp	eax,8h
	jc	42B803h

l0042B7F4:
	push	2h
	inc	eax
	push	eax

l0042B7F8:
	push	dword ptr [ebp-28h]
	call	4289B0h
	add	esp,0Ch

l0042B803:
	mov	eax,edi
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	ecx,[ebp-10h]
	xor	ecx,ebp
	call	427500h
	mov	esp,ebp
	pop	ebp
	ret	4h
0042B823          CC CC CC CC CC CC CC CC CC CC CC CC CC    .............

;; fn0042B830: 0042B830
;;   Called from:
;;     0042B669 (in fn0042B630)
fn0042B830 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	430769h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,3Ch
	mov	eax,[43A008h]
	xor	eax,ebp
	mov	[ebp-10h],eax
	push	ebx
	push	esi
	push	edi
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	ebx,ecx
	mov	edi,[ebp+8h]
	mov	dword ptr [ebp-44h],0h
	mov	esi,[ebx+10h]
	push	esi
	push	ebx
	call	42B9F0h
	add	esp,8h
	mov	[ebp-48h],eax
	test	esi,esi
	jz	42B8D9h

l0042B87B:
	test	eax,eax
	jz	42B8D9h

l0042B87F:
	cmp	dword ptr [ebx+14h],8h
	jc	42B889h

l0042B885:
	mov	ecx,[ebx]
	jmp	42B88Bh

l0042B889:
	mov	ecx,ebx

l0042B88B:
	movzx	ecx,word ptr [ecx+eax*2]
	cmp	ecx,2Fh
	jz	42B899h

l0042B894:
	cmp	ecx,5Ch
	jnz	42B8D9h

l0042B899:
	push	eax
	push	ebx
	call	42BCD0h
	add	esp,8h
	test	al,al
	jnz	42B8D6h

l0042B8A7:
	call	42B560h
	xor	ecx,ecx
	mov	dword ptr [ebp-30h],0h
	push	0FFh
	push	ecx
	mov	[ebp-40h],cx
	lea	ecx,[ebp-40h]
	push	eax
	mov	dword ptr [ebp-2Ch],7h
	call	42A070h
	lea	esi,[ebp-40h]
	mov	ebx,1h
	jmp	42B921h

l0042B8D6:
	mov	eax,[ebp-48h]

l0042B8D9:
	cmp	dword ptr [ebx+14h],8h
	jc	42B8E1h

l0042B8DF:
	mov	ebx,[ebx]

l0042B8E1:
	lea	edx,[ebx+eax*2]
	mov	dword ptr [ebp-18h],0h
	mov	ecx,edx
	mov	dword ptr [ebp-14h],7h
	xor	eax,eax
	mov	[ebp-28h],ax
	lea	esi,[ecx+2h]
	nop	dword ptr [eax]

l0042B900:
	mov	ax,[ecx]
	add	ecx,2h
	test	ax,ax
	jnz	42B900h

l0042B90B:
	sub	ecx,esi
	sar	ecx,1h
	push	ecx
	push	edx
	lea	ecx,[ebp-28h]
	call	42A160h
	lea	esi,[ebp-28h]
	mov	ebx,2h

l0042B921:
	xor	eax,eax
	mov	dword ptr [edi+10h],0h
	mov	dword ptr [edi+14h],7h
	mov	[ebp-44h],ebx
	mov	[edi],ax
	mov	dword ptr [ebp-4h],1h
	cmp	edi,esi
	jz	42B973h

l0042B942:
	mov	eax,[edi+14h]
	cmp	eax,8h
	jc	42B958h

l0042B94A:
	inc	eax
	push	2h
	push	eax
	push	dword ptr [edi]
	call	4289B0h
	add	esp,0Ch

l0042B958:
	xor	eax,eax
	mov	dword ptr [edi+10h],0h
	mov	dword ptr [edi+14h],7h
	mov	ecx,edi
	push	esi
	mov	[edi],ax
	call	42A010h

l0042B973:
	or	ebx,4h
	test	bl,2h
	jz	42B99Fh

l0042B97B:
	and	ebx,0FDh
	mov	[ebp-44h],ebx
	mov	eax,[ebp-14h]
	mov	dword ptr [ebp-4h],2h
	cmp	eax,8h
	jc	42B99Fh

l0042B990:
	inc	eax
	push	2h
	push	eax
	push	dword ptr [ebp-28h]
	call	4289B0h
	add	esp,0Ch

l0042B99F:
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	test	bl,1h
	jz	42B9C9h

l0042B9AB:
	mov	ecx,[ebp-2Ch]
	mov	dword ptr [ebp-4h],3h
	cmp	ecx,8h
	jc	42B9C9h

l0042B9BA:
	push	2h
	inc	ecx
	push	ecx
	push	dword ptr [ebp-40h]
	call	4289B0h
	add	esp,0Ch

l0042B9C9:
	mov	eax,edi
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	ecx,[ebp-10h]
	xor	ecx,ebp
	call	427500h
	mov	esp,ebp
	pop	ebp
	ret	4h
0042B9E9                            CC CC CC CC CC CC CC          .......

;; fn0042B9F0: 0042B9F0
;;   Called from:
;;     0042B86C (in fn0042B830)
fn0042B9F0 proc
	push	esi
	mov	esi,[esp+8h]
	push	edi
	mov	edi,[esp+10h]
	cmp	edi,2h
	jnz	42BA38h

l0042B9FF:
	mov	eax,[esi+14h]
	cmp	eax,8h
	jc	42BA0Bh

l0042BA07:
	mov	ecx,[esi]
	jmp	42BA0Dh

l0042BA0B:
	mov	ecx,esi

l0042BA0D:
	movzx	ecx,word ptr [ecx]
	cmp	ecx,2Fh
	jz	42BA1Ah

l0042BA15:
	cmp	ecx,5Ch
	jnz	42BA3Ch

l0042BA1A:
	cmp	eax,8h
	jc	42BA23h

l0042BA1F:
	mov	eax,[esi]
	jmp	42BA25h

l0042BA23:
	mov	eax,esi

l0042BA25:
	movzx	eax,word ptr [eax+2h]
	cmp	eax,2Fh
	jz	42BA33h

l0042BA2E:
	cmp	eax,5Ch
	jnz	42BA3Ch

l0042BA33:
	pop	edi
	xor	eax,eax
	pop	esi
	ret

l0042BA38:
	test	edi,edi
	jz	42BA5Dh

l0042BA3C:
	cmp	dword ptr [esi+14h],8h
	jc	42BA46h

l0042BA42:
	mov	eax,[esi]
	jmp	42BA48h

l0042BA46:
	mov	eax,esi

l0042BA48:
	movzx	eax,word ptr [eax+edi*2-2h]
	cmp	eax,2Fh
	jz	42BA57h

l0042BA52:
	cmp	eax,5Ch
	jnz	42BA5Dh

l0042BA57:
	lea	eax,[edi-1h]
	pop	edi
	pop	esi
	ret

l0042BA5D:
	cmp	dword ptr [esi+14h],8h
	jc	42BA67h

l0042BA63:
	mov	ecx,[esi]
	jmp	42BA69h

l0042BA67:
	mov	ecx,esi

l0042BA69:
	push	2h
	push	4315B8h
	lea	eax,[edi-1h]
	push	eax
	push	dword ptr [esi+10h]
	push	ecx
	call	42AFC0h
	add	esp,14h
	cmp	eax,0FFh
	jnz	42BA9Ch

l0042BA85:
	cmp	edi,1h
	jbe	42BA33h

l0042BA8A:
	lea	eax,[edi-2h]
	mov	ecx,esi
	push	eax
	push	3Ah
	call	42BB10h
	cmp	eax,0FFh
	jz	42BA33h

l0042BA9C:
	cmp	eax,1h
	jnz	42BABAh

l0042BAA1:
	cmp	dword ptr [esi+14h],8h
	jc	42BAA9h

l0042BAA7:
	mov	esi,[esi]

l0042BAA9:
	movzx	ecx,word ptr [esi]
	cmp	ecx,2Fh
	jz	42BA33h

l0042BAB1:
	cmp	ecx,5Ch
	jz	42BA33h

l0042BABA:
	pop	edi
	inc	eax
	pop	esi
	ret
0042BABE                                           CC CC               ..

;; fn0042BAC0: 0042BAC0
;;   Called from:
;;     0042BD7E (in fn0042BCD0)
fn0042BAC0 proc
	mov	edx,[esp+4h]
	push	edi
	lea	edi,[edx+2h]
	nop	dword ptr [eax+eax+0h]

l0042BAD0:
	mov	ax,[edx]
	add	edx,2h
	test	ax,ax
	jnz	42BAD0h

l0042BADB:
	sub	edx,edi
	lea	eax,[ecx+10h]
	sar	edx,1h
	cmp	dword ptr [ecx+14h],8h
	pop	edi
	jc	42BAEBh

l0042BAE9:
	mov	ecx,[ecx]

l0042BAEB:
	push	edx
	push	dword ptr [esp+8h]
	push	dword ptr [esp+10h]
	push	dword ptr [eax]
	push	ecx
	call	42AF50h
	add	esp,14h
	ret	8h
0042BB02       CC CC CC CC CC CC CC CC CC CC CC CC CC CC   ..............

;; fn0042BB10: 0042BB10
;;   Called from:
;;     0042B71C (in fn0042B630)
;;     0042BA92 (in fn0042B9F0)
fn0042BB10 proc
	mov	edx,ecx
	cmp	dword ptr [edx+14h],8h
	lea	eax,[edx+10h]
	jc	42BB1Dh

l0042BB1B:
	mov	edx,[edx]

l0042BB1D:
	mov	eax,[eax]
	test	eax,eax
	jz	42BB53h

l0042BB23:
	mov	ecx,[esp+8h]
	dec	eax
	cmp	eax,ecx
	cmovc	ecx,eax

l0042BB2D:
	lea	eax,[edx+ecx*2]
	mov	cx,[esp+4h]
	cmp	[eax],cx
	jz	42BB4Ch

l0042BB3A:
	nop	word ptr [eax+eax+0h]

l0042BB40:
	cmp	eax,edx
	jz	42BB53h

l0042BB44:
	sub	eax,2h
	cmp	[eax],cx
	jnz	42BB40h

l0042BB4C:
	sub	eax,edx
	sar	eax,1h
	ret	8h

l0042BB53:
	or	eax,0FFh
	ret	8h
0042BB59                            CC CC CC CC CC CC CC          .......

;; fn0042BB60: 0042BB60
;;   Called from:
;;     0042B275 (in fn0042B210)
fn0042BB60 proc
	push	ebx
	push	ebp
	mov	ebp,[esp+18h]
	push	esi
	mov	esi,[esp+10h]
	cmp	ebp,0FFh
	jnz	42BB73h

l0042BB70:
	mov	ebp,[esi+10h]

l0042BB73:
	mov	eax,[esp+14h]
	mov	ebx,[esp+18h]
	mov	dword ptr [eax],0h
	mov	dword ptr [ebx],0h
	cmp	dword ptr [esi+10h],0h
	jz	42BC9Fh

l0042BB91:
	push	edi
	xor	edi,edi
	cmp	ebp,2h
	jc	42BBF7h

l0042BB99:
	mov	eax,[esi+14h]
	cmp	eax,8h
	jc	42BBA5h

l0042BBA1:
	mov	ecx,[esi]
	jmp	42BBA7h

l0042BBA5:
	mov	ecx,esi

l0042BBA7:
	movzx	ecx,word ptr [ecx]
	cmp	ecx,2Fh
	jz	42BBB4h

l0042BBAF:
	cmp	ecx,5Ch
	jnz	42BBF7h

l0042BBB4:
	cmp	eax,8h
	jc	42BBBDh

l0042BBB9:
	mov	ecx,[esi]
	jmp	42BBBFh

l0042BBBD:
	mov	ecx,esi

l0042BBBF:
	movzx	ecx,word ptr [ecx+2h]
	cmp	ecx,2Fh
	jz	42BBCDh

l0042BBC8:
	cmp	ecx,5Ch
	jnz	42BBF7h

l0042BBCD:
	cmp	ebp,2h
	jz	42BBEEh

l0042BBD2:
	cmp	eax,8h
	jc	42BBDBh

l0042BBD7:
	mov	eax,[esi]
	jmp	42BBDDh

l0042BBDB:
	mov	eax,esi

l0042BBDD:
	movzx	eax,word ptr [eax+4h]
	push	eax
	call	42BCB0h
	add	esp,4h
	test	al,al
	jnz	42BBF7h

l0042BBEE:
	mov	edi,2h
	mov	[ebx],edi
	jmp	42BC10h

l0042BBF7:
	cmp	dword ptr [esi+14h],8h
	jc	42BC01h

l0042BBFD:
	mov	eax,[esi]
	jmp	42BC03h

l0042BC01:
	mov	eax,esi

l0042BC03:
	movzx	eax,word ptr [eax]
	cmp	eax,2Fh
	jz	42BC63h

l0042BC0B:
	cmp	eax,5Ch
	jz	42BC63h

l0042BC10:
	cmp	edi,ebp
	jnc	42BC4Bh

l0042BC14:
	mov	eax,[esi+14h]
	cmp	eax,8h
	jc	42BC20h

l0042BC1C:
	mov	ecx,[esi]
	jmp	42BC22h

l0042BC20:
	mov	ecx,esi

l0042BC22:
	cmp	word ptr [ecx+edi*2],3Ah
	jz	42BC49h

l0042BC29:
	cmp	eax,8h
	jc	42BC32h

l0042BC2E:
	mov	eax,[esi]
	jmp	42BC34h

l0042BC32:
	mov	eax,esi

l0042BC34:
	movzx	eax,word ptr [eax+edi*2]
	cmp	eax,2Fh
	jz	42BC49h

l0042BC3D:
	cmp	eax,5Ch
	jz	42BC49h

l0042BC42:
	inc	dword ptr [ebx]
	inc	edi
	cmp	edi,ebp
	jc	42BC14h

l0042BC49:
	cmp	edi,ebp

l0042BC4B:
	jz	42BC9Eh

l0042BC4D:
	cmp	dword ptr [esi+14h],8h
	jc	42BC55h

l0042BC53:
	mov	esi,[esi]

l0042BC55:
	cmp	word ptr [esi+edi*2],3Ah
	jnz	42BC9Eh

l0042BC5C:
	inc	dword ptr [ebx]
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
	ret

l0042BC63:
	mov	dword ptr [ebx],1h
	cmp	ebp,1h
	jbe	42BC9Eh

l0042BC6E:
	mov	eax,1h
	xor	ecx,ecx

l0042BC75:
	cmp	dword ptr [esi+14h],8h
	jc	42BC7Fh

l0042BC7B:
	mov	edx,[esi]
	jmp	42BC81h

l0042BC7F:
	mov	edx,esi

l0042BC81:
	movzx	edx,word ptr [ecx+edx+2h]
	cmp	edx,2Fh
	jz	42BC90h

l0042BC8B:
	cmp	edx,5Ch
	jnz	42BC9Eh

l0042BC90:
	mov	edx,[esp+18h]
	inc	eax
	add	ecx,2h
	inc	dword ptr [edx]
	cmp	eax,ebp
	jc	42BC75h

l0042BC9E:
	pop	edi

l0042BC9F:
	pop	esi
	pop	ebp
	pop	ebx
	ret
0042BCA3          CC CC CC CC CC CC CC CC CC CC CC CC CC    .............

;; fn0042BCB0: 0042BCB0
;;   Called from:
;;     0042BBE2 (in fn0042BB60)
fn0042BCB0 proc
	mov	ax,[esp+4h]
	cmp	ax,2Fh
	jz	42BCC4h

l0042BCBB:
	cmp	ax,5Ch
	jz	42BCC4h

l0042BCC1:
	xor	al,al
	ret

l0042BCC4:
	mov	al,1h
	ret
0042BCC7                      CC CC CC CC CC CC CC CC CC        .........

;; fn0042BCD0: 0042BCD0
;;   Called from:
;;     0042B89B (in fn0042B830)
;;     0042C148 (in fn0042C020)
fn0042BCD0 proc
	mov	ecx,[esp+4h]
	push	esi
	mov	esi,[esp+0Ch]
	test	esi,esi
	jz	42BD3Ah

l0042BCDD:
	mov	edx,[ecx+14h]

l0042BCE0:
	cmp	edx,8h
	jc	42BCE9h

l0042BCE5:
	mov	eax,[ecx]
	jmp	42BCEBh

l0042BCE9:
	mov	eax,ecx

l0042BCEB:
	movzx	eax,word ptr [eax+esi*2-2h]
	cmp	eax,2Fh
	jz	42BCFAh

l0042BCF5:
	cmp	eax,5Ch
	jnz	42BCFFh

l0042BCFA:
	sub	esi,1h
	jnz	42BCE0h

l0042BCFF:
	test	esi,esi
	jz	42BD3Ah

l0042BD03:
	cmp	esi,2h
	jnz	42BD3Eh

l0042BD08:
	mov	edx,[ecx+14h]
	cmp	edx,8h
	jc	42BD14h

l0042BD10:
	mov	eax,[ecx]
	jmp	42BD16h

l0042BD14:
	mov	eax,ecx

l0042BD16:
	movzx	eax,word ptr [eax]
	cmp	eax,61h
	jc	42BD23h

l0042BD1E:
	cmp	eax,7Ah
	jbe	42BD2Ch

l0042BD23:
	add	eax,0BFh
	cmp	ax,19h
	ja	42BD8Ah

l0042BD2C:
	cmp	edx,8h
	jc	42BD33h

l0042BD31:
	mov	ecx,[ecx]

l0042BD33:
	cmp	word ptr [ecx+2h],3Ah
	jnz	42BD8Ah

l0042BD3A:
	mov	al,1h
	pop	esi
	ret

l0042BD3E:
	cmp	esi,3h
	jc	42BD8Ah

l0042BD43:
	mov	eax,[ecx+14h]
	cmp	eax,8h
	jc	42BD4Fh

l0042BD4B:
	mov	edx,[ecx]
	jmp	42BD51h

l0042BD4F:
	mov	edx,ecx

l0042BD51:
	movzx	edx,word ptr [edx]
	cmp	edx,2Fh
	jz	42BD5Eh

l0042BD59:
	cmp	edx,5Ch
	jnz	42BD8Ah

l0042BD5E:
	cmp	eax,8h
	jc	42BD67h

l0042BD63:
	mov	eax,[ecx]
	jmp	42BD69h

l0042BD67:
	mov	eax,ecx

l0042BD69:
	movzx	eax,word ptr [eax+2h]
	cmp	eax,2Fh
	jz	42BD77h

l0042BD72:
	cmp	eax,5Ch
	jnz	42BD8Ah

l0042BD77:
	push	2h
	push	4315B8h
	call	42BAC0h
	cmp	eax,esi
	pop	esi
	setz	al
	ret

l0042BD8A:
	xor	al,al
	pop	esi
	ret
0042BD8E                                           CC CC               ..

;; fn0042BD90: 0042BD90
;;   Called from:
;;     0042B6AE (in fn0042B630)
;;     0042B6FE (in fn0042B630)
fn0042BD90 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	4307B0h
	mov	eax,fs:[0000h]
	push	eax
	push	ebx
	mov	eax,[43A008h]
	xor	eax,ebp
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	dword ptr [ebp-4h],3h
	nop	word ptr [eax+eax+0h]

l0042BDC0:
	mov	eax,[ebp+40h]
	cmp	[ebp+20h],eax
	mov	edx,[ebp+84h]
	mov	ebx,[ebp+60h]
	mov	eax,[ebp+44h]
	mov	ecx,[ebp+24h]
	jnz	42BDDBh

l0042BDD7:
	cmp	ecx,eax
	jz	42BE25h

l0042BDDB:
	cmp	ebx,[ebp+80h]
	jnz	42BDE8h

l0042BDE3:
	cmp	[ebp+64h],edx
	jz	42BE25h

l0042BDE8:
	lea	eax,[ebp+48h]
	push	eax
	lea	ecx,[ebp+8h]
	call	42B330h
	shr	eax,1Fh
	test	al,al
	jnz	42BE7Ah

l0042BDFB:
	lea	eax,[ebp+8h]
	push	eax
	lea	ecx,[ebp+48h]
	call	42B330h
	shr	eax,1Fh
	test	al,al
	jnz	42BE73h

l0042BE0E:
	lea	eax,[ebp+8h]
	push	eax
	call	42C020h
	lea	eax,[ebp+48h]
	push	eax
	call	42C020h
	add	esp,8h
	jmp	42BDC0h

l0042BE25:
	mov	edx,[ebp+40h]
	cmp	[ebp+20h],edx
	mov	edx,[ebp+84h]
	jnz	42BE61h

l0042BE33:
	cmp	ecx,eax
	jnz	42BE61h

l0042BE37:
	cmp	ebx,[ebp+80h]
	jnz	42BE48h

l0042BE3F:
	cmp	[ebp+64h],edx
	jnz	42BE48h

l0042BE44:
	xor	ebx,ebx
	jmp	42BE7Dh

l0042BE48:
	cmp	ecx,eax
	jnz	42BE61h

l0042BE4C:
	xor	ebx,ebx
	mov	eax,1h
	test	al,al
	setz	bl
	lea	ebx,[0FFFFFFFFh+ebx*2]
	jmp	42BE7Dh

l0042BE61:
	xor	ebx,ebx
	xor	eax,eax
	test	al,al
	setz	bl
	lea	ebx,[0FFFFFFFFh+ebx*2]
	jmp	42BE7Dh

l0042BE73:
	mov	ebx,1h
	jmp	42BE7Dh

l0042BE7A:
	or	ebx,0FFh

l0042BE7D:
	mov	eax,[ebp+1Ch]
	mov	byte ptr [ebp-4h],4h
	cmp	eax,8h
	jc	42BEDEh

l0042BE89:
	mov	ecx,[ebp+8h]
	inc	eax
	cmp	eax,7FFFFFFFh
	jbe	42BE9Ah

l0042BE94:
	call	dword ptr [431290h]

l0042BE9A:
	add	eax,eax
	cmp	eax,1000h
	jc	42BED5h

l0042BEA3:
	test	cl,1Fh
	jz	42BEAEh

l0042BEA8:
	call	dword ptr [431290h]

l0042BEAE:
	mov	eax,[ecx-4h]
	cmp	eax,ecx
	jc	42BEBBh

l0042BEB5:
	call	dword ptr [431290h]

l0042BEBB:
	sub	ecx,eax
	cmp	ecx,4h
	jnc	42BEC8h

l0042BEC2:
	call	dword ptr [431290h]

l0042BEC8:
	cmp	ecx,23h
	jbe	42BED3h

l0042BECD:
	call	dword ptr [431290h]

l0042BED3:
	mov	ecx,eax

l0042BED5:
	push	ecx
	call	427E3Eh
	add	esp,4h

l0042BEDE:
	mov	eax,[ebp+3Ch]
	mov	byte ptr [ebp-4h],5h
	cmp	eax,8h
	jc	42BF3Fh

l0042BEEA:
	mov	ecx,[ebp+28h]
	inc	eax
	cmp	eax,7FFFFFFFh
	jbe	42BEFBh

l0042BEF5:
	call	dword ptr [431290h]

l0042BEFB:
	add	eax,eax
	cmp	eax,1000h
	jc	42BF36h

l0042BF04:
	test	cl,1Fh
	jz	42BF0Fh

l0042BF09:
	call	dword ptr [431290h]

l0042BF0F:
	mov	eax,[ecx-4h]
	cmp	eax,ecx
	jc	42BF1Ch

l0042BF16:
	call	dword ptr [431290h]

l0042BF1C:
	sub	ecx,eax
	cmp	ecx,4h
	jnc	42BF29h

l0042BF23:
	call	dword ptr [431290h]

l0042BF29:
	cmp	ecx,23h
	jbe	42BF34h

l0042BF2E:
	call	dword ptr [431290h]

l0042BF34:
	mov	ecx,eax

l0042BF36:
	push	ecx
	call	427E3Eh
	add	esp,4h

l0042BF3F:
	mov	eax,[ebp+5Ch]
	mov	byte ptr [ebp-4h],6h
	cmp	eax,8h
	jc	42BFA0h

l0042BF4B:
	mov	ecx,[ebp+48h]
	inc	eax
	cmp	eax,7FFFFFFFh
	jbe	42BF5Ch

l0042BF56:
	call	dword ptr [431290h]

l0042BF5C:
	add	eax,eax
	cmp	eax,1000h
	jc	42BF97h

l0042BF65:
	test	cl,1Fh
	jz	42BF70h

l0042BF6A:
	call	dword ptr [431290h]

l0042BF70:
	mov	eax,[ecx-4h]
	cmp	eax,ecx
	jc	42BF7Dh

l0042BF77:
	call	dword ptr [431290h]

l0042BF7D:
	sub	ecx,eax
	cmp	ecx,4h
	jnc	42BF8Ah

l0042BF84:
	call	dword ptr [431290h]

l0042BF8A:
	cmp	ecx,23h
	jbe	42BF95h

l0042BF8F:
	call	dword ptr [431290h]

l0042BF95:
	mov	ecx,eax

l0042BF97:
	push	ecx
	call	427E3Eh
	add	esp,4h

l0042BFA0:
	mov	eax,[ebp+7Ch]
	mov	dword ptr [ebp-4h],7h
	cmp	eax,8h
	jc	42C004h

l0042BFAF:
	mov	ecx,[ebp+68h]
	inc	eax
	cmp	eax,7FFFFFFFh
	jbe	42BFC0h

l0042BFBA:
	call	dword ptr [431290h]

l0042BFC0:
	add	eax,eax
	cmp	eax,1000h
	jc	42BFFBh

l0042BFC9:
	test	cl,1Fh
	jz	42BFD4h

l0042BFCE:
	call	dword ptr [431290h]

l0042BFD4:
	mov	eax,[ecx-4h]
	cmp	eax,ecx
	jc	42BFE1h

l0042BFDB:
	call	dword ptr [431290h]

l0042BFE1:
	sub	ecx,eax
	cmp	ecx,4h
	jnc	42BFEEh

l0042BFE8:
	call	dword ptr [431290h]

l0042BFEE:
	cmp	ecx,23h
	jbe	42BFF9h

l0042BFF3:
	call	dword ptr [431290h]

l0042BFF9:
	mov	ecx,eax

l0042BFFB:
	push	ecx
	call	427E3Eh
	add	esp,4h

l0042C004:
	mov	eax,ebx
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret
0042C016                   CC CC CC CC CC CC CC CC CC CC       ..........

;; fn0042C020: 0042C020
;;   Called from:
;;     0042BE12 (in fn0042BD90)
;;     0042BE1B (in fn0042BD90)
fn0042C020 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	4307D8h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,1Ch
	mov	eax,[43A008h]
	xor	eax,ebp
	mov	[ebp-10h],eax
	push	ebx
	push	esi
	push	edi
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	esi,[ebp+8h]
	mov	edi,[esi+18h]
	mov	eax,[esi+10h]
	add	[esi+1Ch],eax
	mov	ebx,[esi+1Ch]
	cmp	ebx,[edi+10h]
	jnz	42C078h

l0042C05F:
	cmp	dword ptr [esi+14h],8h
	mov	dword ptr [esi+10h],0h
	jc	42C06Eh

l0042C06C:
	mov	esi,[esi]

l0042C06E:
	xor	eax,eax
	mov	[esi],ax
	jmp	42C1ECh

l0042C078:
	mov	edx,eax
	cmp	edx,2h
	jbe	42C0D0h

l0042C07F:
	mov	eax,[esi+14h]
	cmp	eax,8h
	jc	42C08Bh

l0042C087:
	mov	ecx,[esi]
	jmp	42C08Dh

l0042C08B:
	mov	ecx,esi

l0042C08D:
	movzx	ecx,word ptr [ecx]
	cmp	ecx,2Fh
	jz	42C09Ah

l0042C095:
	cmp	ecx,5Ch
	jnz	42C0D0h

l0042C09A:
	cmp	eax,8h
	jc	42C0A3h

l0042C09F:
	mov	ecx,[esi]
	jmp	42C0A5h

l0042C0A3:
	mov	ecx,esi

l0042C0A5:
	movzx	ecx,word ptr [ecx+2h]
	cmp	ecx,2Fh
	jz	42C0B3h

l0042C0AE:
	cmp	ecx,5Ch
	jnz	42C0D0h

l0042C0B3:
	cmp	eax,8h
	jc	42C0BCh

l0042C0B8:
	mov	eax,[esi]
	jmp	42C0BEh

l0042C0BC:
	mov	eax,esi

l0042C0BE:
	movzx	eax,word ptr [eax+4h]
	cmp	eax,2Fh
	jz	42C0D0h

l0042C0C7:
	cmp	eax,5Ch
	jz	42C0D0h

l0042C0CC:
	mov	al,1h
	jmp	42C0D2h

l0042C0D0:
	xor	al,al

l0042C0D2:
	cmp	dword ptr [edi+14h],8h
	jc	42C0DCh

l0042C0D8:
	mov	ecx,[edi]
	jmp	42C0DEh

l0042C0DC:
	mov	ecx,edi

l0042C0DE:
	movzx	ecx,word ptr [ecx+ebx*2]
	cmp	ecx,2Fh
	jz	42C0F0h

l0042C0E7:
	cmp	ecx,5Ch
	jnz	42C172h

l0042C0F0:
	test	al,al
	jnz	42C1E3h

l0042C0F8:
	cmp	dword ptr [esi+14h],8h
	jc	42C102h

l0042C0FE:
	mov	eax,[esi]
	jmp	42C104h

l0042C102:
	mov	eax,esi

l0042C104:
	cmp	word ptr [eax+edx*2-2h],3Ah
	jz	42C1E3h

l0042C110:
	cmp	ebx,[edi+10h]
	jz	42C13Dh

l0042C115:
	cmp	dword ptr [edi+14h],8h
	mov	ecx,[esi+1Ch]
	jc	42C122h

l0042C11E:
	mov	eax,[edi]
	jmp	42C124h

l0042C122:
	mov	eax,edi

l0042C124:
	movzx	eax,word ptr [eax+ecx*2]
	cmp	eax,2Fh
	jz	42C132h

l0042C12D:
	cmp	eax,5Ch
	jnz	42C13Dh

l0042C132:
	lea	eax,[ecx+1h]
	mov	[esi+1Ch],eax
	cmp	eax,[edi+10h]
	jnz	42C115h

l0042C13D:
	mov	ebx,[esi+1Ch]
	cmp	ebx,[edi+10h]
	jnz	42C172h

l0042C145:
	dec	ebx
	push	ebx
	push	edi
	call	42BCD0h
	add	esp,8h
	test	al,al
	jnz	42C172h

l0042C154:
	mov	[esi+1Ch],ebx
	call	42B560h
	cmp	esi,eax
	jz	42C1ECh

l0042C164:
	push	0FFh
	push	0h
	push	eax
	mov	ecx,esi
	call	42A070h
	jmp	42C1ECh

l0042C172:
	cmp	dword ptr [edi+14h],8h
	mov	ebx,[esi+1Ch]
	jc	42C17Fh

l0042C17B:
	mov	eax,[edi]
	jmp	42C181h

l0042C17F:
	mov	eax,edi

l0042C181:
	push	2h
	push	4315B8h
	push	ebx
	push	dword ptr [edi+10h]
	push	eax
	call	42AF50h
	add	esp,14h
	cmp	eax,0FFh
	jnz	42C19Dh

l0042C19A:
	mov	eax,[edi+10h]

l0042C19D:
	sub	eax,ebx
	mov	ecx,edi
	push	eax
	push	ebx
	lea	eax,[ebp-28h]
	push	eax
	call	42C2A0h
	mov	dword ptr [ebp-4h],0h
	cmp	esi,eax
	jz	42C1C3h

l0042C1B7:
	push	0FFh
	push	0h
	push	eax
	mov	ecx,esi
	call	42A070h

l0042C1C3:
	mov	eax,[ebp-14h]
	mov	dword ptr [ebp-4h],1h
	cmp	eax,8h
	jc	42C1ECh

l0042C1D2:
	push	2h
	inc	eax
	push	eax
	push	dword ptr [ebp-28h]
	call	4289B0h
	add	esp,0Ch
	jmp	42C1ECh

l0042C1E3:
	push	2Fh
	mov	ecx,esi
	call	42B120h

l0042C1EC:
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	ecx,[ebp-10h]
	xor	ecx,ebp
	call	427500h
	mov	esp,ebp
	pop	ebp
	ret
0042C208                         CC CC CC CC CC CC CC CC         ........

;; fn0042C210: 0042C210
;;   Called from:
;;     0042B320 (in fn0042B320)
fn0042C210 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	43080Ch
	mov	eax,fs:[0000h]
	push	eax
	mov	eax,[43A008h]
	xor	eax,ebp
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	eax,fs:[002Ch]
	mov	ecx,[43B10Ch]
	mov	ecx,[eax+ecx*4]
	mov	eax,[43B0B8h]
	cmp	eax,[ecx+4h]
	jle	42C28Ch

l0042C24E:
	push	43B0B8h
	call	42D454h
	add	esp,4h
	cmp	dword ptr [43B0B8h],0FFh
	jnz	42C28Ch

l0042C264:
	push	43B0B0h
	mov	dword ptr [ebp-4h],0h
	call	42B3A0h
	push	430AF0h
	call	427952h
	push	43B0B8h
	call	42D40Ah
	add	esp,0Ch

l0042C28C:
	mov	eax,43B0B0h
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	mov	esp,ebp
	pop	ebp
	ret

;; fn0042C2A0: 0042C2A0
;;   Called from:
;;     0042B288 (in fn0042B210)
;;     0042C1A7 (in fn0042C020)
fn0042C2A0 proc
	push	ecx
	push	esi
	push	dword ptr [esp+14h]
	mov	esi,[esp+10h]
	xor	eax,eax
	push	dword ptr [esp+14h]
	mov	dword ptr [esp+0Ch],0h
	push	ecx
	mov	dword ptr [esi+10h],0h
	mov	ecx,esi
	mov	dword ptr [esi+14h],7h
	mov	[esi],ax
	call	42A070h
	mov	eax,esi
	pop	esi
	pop	ecx
	ret	0Ch
0042C2D8                         CC CC CC CC CC CC CC CC         ........

;; fn0042C2E0: 0042C2E0
fn0042C2E0 proc
	test	byte ptr [esp+4h],1h
	push	esi
	mov	esi,ecx
	mov	dword ptr [esi],431624h
	jz	42C2FBh

l0042C2F0:
	push	4h
	push	esi
	call	42763Fh
	add	esp,8h

l0042C2FB:
	mov	eax,esi
	pop	esi
	ret	4h
0042C301    CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC  ...............

;; fn0042C310: 0042C310
;;   Called from:
;;     00428E80 (in fn00428DE0)
;;     00428F3E (in fn00428DE0)
fn0042C310 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	43083Ch
	mov	eax,fs:[0000h]
	push	eax
	mov	eax,[43A008h]
	xor	eax,ebp
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	eax,fs:[002Ch]
	mov	ecx,[43B10Ch]
	mov	ecx,[eax+ecx*4]
	mov	eax,[43B0C0h]
	cmp	eax,[ecx+4h]
	jle	42C382h

l0042C34E:
	push	43B0C0h
	call	42D454h
	add	esp,4h
	cmp	dword ptr [43B0C0h],0FFh
	jnz	42C382h

l0042C364:
	push	430B50h
	mov	dword ptr [ebp-4h],0h
	call	427952h
	push	43B0C0h
	call	42D40Ah
	add	esp,8h

l0042C382:
	mov	eax,43A050h
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	mov	esp,ebp
	pop	ebp
	ret
0042C396                   CC CC CC CC CC CC CC CC CC CC       ..........

;; fn0042C3A0: 0042C3A0
fn0042C3A0 proc
	mov	eax,[esp+4h]
	mov	edx,[esp+8h]
	mov	[eax],edx
	mov	[eax+4h],ecx
	ret	8h

;; fn0042C3B0: 0042C3B0
fn0042C3B0 proc
	mov	eax,[esp+4h]
	cmp	ecx,[eax+4h]
	jnz	42C3C6h

l0042C3B9:
	mov	eax,[eax]
	cmp	eax,[esp+8h]
	jnz	42C3C6h

l0042C3C1:
	mov	al,1h
	ret	8h

l0042C3C6:
	xor	al,al
	ret	8h
0042C3CB                                  CC CC CC CC CC            .....

;; fn0042C3D0: 0042C3D0
fn0042C3D0 proc
	mov	eax,[ecx]
	lea	edx,[esp-8h]
	sub	esp,8h
	push	dword ptr [esp+0Ch]
	push	edx
	call	dword ptr [eax+0Ch]
	mov	edx,[esp+10h]
	mov	ecx,[eax+4h]
	cmp	ecx,[edx+4h]
	jnz	42C3FBh

l0042C3ED:
	mov	eax,[eax]
	cmp	eax,[edx]
	jnz	42C3FBh

l0042C3F3:
	mov	al,1h
	add	esp,8h
	ret	8h

l0042C3FB:
	xor	al,al
	add	esp,8h
	ret	8h
0042C403          CC CC CC CC CC CC CC CC CC CC CC CC CC    .............
0042C410 55 8B EC 6A FF 68 79 08 43 00 64 A1 00 00 00 00 U..j.hy.C.d.....
0042C420 50 51 56 A1 08 A0 43 00 33 C5 50 8D 45 F4 64 A3 PQV...C.3.P.E.d.
0042C430 00 00 00 00 C7 45 F0 00 00 00 00 8B 75 08 C7 46 .....E......u..F
0042C440 10 00 00 00 00 C7 46 14 0F 00 00 00 C6 06 00 8B ......F.........
0042C450 45 0C C7 45 FC 00 00 00 00 C7 45 F0 01 00 00 00 E..E......E.....
0042C460 83 F8 03 77 2B FF 24 85 B4 C4 42 00 6A 02 68 60 ...w+.$...B.j.h`
0042C470 16 43 00 EB 22 6A 07 68 64 16 43 00 EB 19 6A 05 .C.."j.hd.C...j.
0042C480 68 6C 16 43 00 EB 10 6A 06 68 74 16 43 00 EB 07 hl.C...j.ht.C...
0042C490 6A 0D 68 10 16 43 00 8B CE E8 D2 65 FD FF 8B C6 j.h..C.....e....
0042C4A0 8B 4D F4 64 89 0D 00 00 00 00 59 5E 8B E5 5D C2 .M.d......Y^..].
0042C4B0 08 00 66 90 6C C4 42 00 75 C4 42 00 7E C4 42 00 ..f.l.B.u.B.~.B.
0042C4C0 87 C4 42 00 CC CC CC CC CC CC CC CC CC CC CC CC ..B.............
0042C4D0 B8 58 16 43 00 C3 CC CC CC CC CC CC CC CC CC CC .X.C............
0042C4E0 56 57 FF 15 24 10 43 00 8B 4C 24 20 F7 D8 8B 74 VW..$.C..L$ ...t
0042C4F0 24 1C 8B 7C 24 14 1B D2 2B CE 8B C7 D1 F9 42 51 $..|$...+.....BQ
0042C500 8B 4C 24 14 2B C1 56 50 51 6A 01 52 FF 15 28 10 .L$.+.VPQj.R..(.
0042C510 43 00 8B C8 85 C9 75 08 5F 8D 41 02 5E C2 1C 00 C.....u._.A.^...
0042C520 8B 44 24 18 8D 0C 4E 89 38 8B 44 24 24 5F 5E 89 .D$...N.8.D$$_^.
0042C530 08 33 C0 66 89 01 C2 1C 00 CC CC CC CC CC CC CC .3.f............
0042C540 56 57 FF 15 24 10 43 00 8B 4C 24 20 F7 D8 8B 74 VW..$.C..L$ ...t
0042C550 24 1C 8B 7C 24 14 1B D2 6A 00 6A 00 2B CE 8B C7 $..|$...j.j.+...
0042C560 51 8B 4C 24 1C 42 56 2B C1 D1 F8 50 51 68 00 04 Q.L$.BV+...PQh..
0042C570 00 00 52 FF 15 2C 10 43 00 8B C8 85 C9 75 08 5F ..R..,.C.....u._
0042C580 8D 41 02 5E C2 1C 00 8B 44 24 18 03 CE 89 38 8B .A.^....D$....8.
0042C590 44 24 24 5F 5E 89 08 33 C0 C6 01 00 C2 1C 00 CC D$$_^..3........
0042C5A0 55 8B EC 6A FF 68 E0 DA 42 00 64 A1 00 00 00 00 U..j.h..B.d.....
0042C5B0 50 A1 08 A0 43 00 33 C5 50 8D 45 F4 64 A3 00 00 P...C.3.P.E.d...
0042C5C0 00 00 FF 31 FF 15 30 10 43 00 8B 4D F4 64 89 0D ...1..0.C..M.d..
0042C5D0 00 00 00 00 59 8B E5 5D C3 CC CC CC CC CC CC CC ....Y..]........
0042C5E0 56 8B 74 24 0C 81 FE 0B 01 00 00 0F 8F 46 01 00 V.t$.........F..
0042C5F0 00 0F 84 2B 01 00 00 81 FE D4 00 00 00 0F 87 44 ...+...........D
0042C600 04 00 00 0F B6 86 A4 CA 42 00 FF 24 85 5C CA 42 ........B..$.\.B
0042C610 00 8B 74 24 08 6A 00 56 E8 C3 06 00 00 83 C4 08 ..t$.j.V........
0042C620 8B C6 5E C2 08 00 8B 74 24 08 6A 11 56 E8 AE 06 ..^....t$.j.V...
0042C630 00 00 83 C4 08 8B C6 5E C2 08 00 8B 74 24 08 6A .......^....t$.j
0042C640 13 56 E8 99 06 00 00 83 C4 08 8B C6 5E C2 08 00 .V..........^...
0042C650 8B 74 24 08 6A 26 56 E8 84 06 00 00 83 C4 08 8B .t$.j&V.........
0042C660 C6 5E C2 08 00 8B 74 24 08 6A 29 56 E8 6F 06 00 .^....t$.j)V.o..
0042C670 00 83 C4 08 8B C6 5E C2 08 00 8B 74 24 08 6A 1C ......^....t$.j.
0042C680 56 E8 5A 06 00 00 83 C4 08 8B C6 5E C2 08 00 8B V.Z........^....
0042C690 74 24 08 6A 02 56 E8 45 06 00 00 83 C4 08 8B C6 t$.j.V.E........
0042C6A0 5E C2 08 00 8B 74 24 08 6A 28 56 E8 30 06 00 00 ^....t$.j(V.0...
0042C6B0 83 C4 08 8B C6 5E C2 08 00 8B 74 24 08 6A 27 56 .....^....t$.j'V
0042C6C0 E8 1B 06 00 00 83 C4 08 8B C6 5E C2 08 00 8B 74 ..........^....t
0042C6D0 24 08 6A 0C 56 E8 06 06 00 00 83 C4 08 8B C6 5E $.j.V..........^
0042C6E0 C2 08 00 8B 74 24 08 6A 0B 56 E8 F1 05 00 00 83 ....t$.j.V......
0042C6F0 C4 08 8B C6 5E C2 08 00 8B 74 24 08 6A 12 56 E8 ....^....t$.j.V.
0042C700 DC 05 00 00 83 C4 08 8B C6 5E C2 08 00 8B 74 24 .........^....t$
0042C710 08 6A 18 56 E8 C7 05 00 00 83 C4 08 8B C6 5E C2 .j.V..........^.
0042C720 08 00 8B 74 24 08 6A 16 56 E8 B2 05 00 00 83 C4 ...t$.j.V.......
0042C730 08 8B C6 5E C2 08 00 81 FE 14 27 00 00 0F 8F 9E ...^......'.....
0042C740 00 00 00 0F 84 83 00 00 00 81 FE F5 03 00 00 7F ................
0042C750 49 74 1D 8D 86 1D FC FF FF 83 F8 11 0F 87 E5 02 It..............
0042C760 00 00 0F B6 80 8C CB 42 00 FF 24 85 7C CB 42 00 .......B..$.|.B.
0042C770 8B 74 24 08 6A 05 56 E8 64 05 00 00 83 C4 08 8B .t$.j.V.d.......
0042C780 C6 5E C2 08 00 8B 74 24 08 6A 69 56 E8 4F 05 00 .^....t$.jiV.O..
0042C790 00 83 C4 08 8B C6 5E C2 08 00 8B C6 2D D5 04 00 ......^.....-...
0042C7A0 00 0F 84 3C FF FF FF 2D 8C 04 00 00 74 09 83 E8 ...<...-....t...
0042C7B0 03 0F 85 90 02 00 00 8B 74 24 08 6A 10 56 E8 1D ........t$.j.V..
0042C7C0 05 00 00 83 C4 08 8B C6 5E C2 08 00 8B 74 24 08 ........^....t$.
0042C7D0 6A 04 56 E8 08 05 00 00 83 C4 08 8B C6 5E C2 08 j.V..........^..
0042C7E0 00 8D 86 E7 D8 FF FF 83 F8 38 0F 87 57 02 00 00 .........8..W...
0042C7F0 0F B6 80 1C CC 42 00 FF 24 85 A0 CB 42 00 8B 74 .....B..$...B..t
0042C800 24 08 6A 0D 56 E8 D6 04 00 00 83 C4 08 8B C6 5E $.j.V..........^
0042C810 C2 08 00 8B 74 24 08 6A 64 56 E8 C1 04 00 00 83 ....t$.jdV......
0042C820 C4 08 8B C6 5E C2 08 00 8B 74 24 08 6A 65 56 E8 ....^....t$.jeV.
0042C830 AC 04 00 00 83 C4 08 8B C6 5E C2 08 00 8B 74 24 .........^....t$
0042C840 08 6A 66 56 E8 97 04 00 00 83 C4 08 8B C6 5E C2 .jfV..........^.
0042C850 08 00 8B 74 24 08 6A 67 56 E8 82 04 00 00 83 C4 ...t$.jgV.......
0042C860 08 8B C6 5E C2 08 00 8B 74 24 08 6A 09 56 E8 6D ...^....t$.j.V.m
0042C870 04 00 00 83 C4 08 8B C6 5E C2 08 00 8B 74 24 08 ........^....t$.
0042C880 6A 6A 56 E8 58 04 00 00 83 C4 08 8B C6 5E C2 08 jjV.X........^..
0042C890 00 8B 74 24 08 6A 6B 56 E8 43 04 00 00 83 C4 08 ..t$.jkV.C......
0042C8A0 8B C6 5E C2 08 00 8B 74 24 08 6A 6C 56 E8 2E 04 ..^....t$.jlV...
0042C8B0 00 00 83 C4 08 8B C6 5E C2 08 00 8B 74 24 08 6A .......^....t$.j
0042C8C0 6D 56 E8 19 04 00 00 83 C4 08 8B C6 5E C2 08 00 mV..........^...
0042C8D0 8B 74 24 08 6A 0E 56 E8 04 04 00 00 83 C4 08 8B .t$.j.V.........
0042C8E0 C6 5E C2 08 00 8B 74 24 08 6A 6E 56 E8 EF 03 00 .^....t$.jnV....
0042C8F0 00 83 C4 08 8B C6 5E C2 08 00 8B 74 24 08 6A 70 ......^....t$.jp
0042C900 56 E8 DA 03 00 00 83 C4 08 8B C6 5E C2 08 00 8B V..........^....
0042C910 74 24 08 6A 71 56 E8 C5 03 00 00 83 C4 08 8B C6 t$.jqV..........
0042C920 5E C2 08 00 8B 74 24 08 6A 73 56 E8 B0 03 00 00 ^....t$.jsV.....
0042C930 83 C4 08 8B C6 5E C2 08 00 8B 74 24 08 6A 74 56 .....^....t$.jtV
0042C940 E8 9B 03 00 00 83 C4 08 8B C6 5E C2 08 00 8B 74 ..........^....t
0042C950 24 08 6A 75 56 E8 86 03 00 00 83 C4 08 8B C6 5E $.juV..........^
0042C960 C2 08 00 8B 74 24 08 6A 76 56 E8 71 03 00 00 83 ....t$.jvV.q....
0042C970 C4 08 8B C6 5E C2 08 00 8B 74 24 08 6A 77 56 E8 ....^....t$.jwV.
0042C980 5C 03 00 00 83 C4 08 8B C6 5E C2 08 00 8B 74 24 \........^....t$
0042C990 08 6A 7B 56 E8 47 03 00 00 83 C4 08 8B C6 5E C2 .j{V.G........^.
0042C9A0 08 00 8B 74 24 08 6A 7E 56 E8 32 03 00 00 83 C4 ...t$.j~V.2.....
0042C9B0 08 8B C6 5E C2 08 00 8B 74 24 08 68 80 00 00 00 ...^....t$.h....
0042C9C0 56 E8 1A 03 00 00 83 C4 08 8B C6 5E C2 08 00 8B V..........^....
0042C9D0 74 24 08 68 82 00 00 00 56 E8 02 03 00 00 83 C4 t$.h....V.......
0042C9E0 08 8B C6 5E C2 08 00 8B 74 24 08 68 87 00 00 00 ...^....t$.h....
0042C9F0 56 E8 EA 02 00 00 83 C4 08 8B C6 5E C2 08 00 8B V..........^....
0042CA00 74 24 08 68 88 00 00 00 56 E8 D2 02 00 00 83 C4 t$.h....V.......
0042CA10 08 8B C6 5E C2 08 00 8B 74 24 08 68 8A 00 00 00 ...^....t$.h....
0042CA20 56 E8 BA 02 00 00 83 C4 08 8B C6 5E C2 08 00 8B V..........^....
0042CA30 74 24 08 68 8C 00 00 00 56 E8 A2 02 00 00 83 C4 t$.h....V.......
0042CA40 08 8B C6 5E C2 08 00 E8 D4 06 00 00 8B 4C 24 08 ...^.........L$.
0042CA50 89 31 89 41 04 8B C1 5E C2 08 00 90 11 C6 42 00 .1.A...^......B.
0042CA60 A4 C6 42 00 8F C6 42 00 0D C7 42 00 FE C7 42 00 ..B...B...B...B.
0042CA70 22 C7 42 00 CE C6 42 00 3B C6 42 00 F8 C6 42 00 ".B...B.;.B...B.
0042CA80 E3 C6 42 00 70 C7 42 00 B9 C6 42 00 7A C6 42 00 ..B.p.B...B.z.B.
0042CA90 26 C6 42 00 50 C6 42 00 B7 C7 42 00 65 C6 42 00 &.B.P.B...B.e.B.
0042CAA0 47 CA 42 00 00 01 02 02 03 04 05 11 06 11 11 11 G.B.............
0042CAB0 04 11 06 07 04 08 11 04 07 09 11 11 11 0A 11 11 ................
0042CAC0 11 0A 0A 11 04 0B 11 11 11 11 11 0C 11 11 11 11 ................
0042CAD0 11 11 11 11 11 11 11 11 11 11 11 07 11 11 11 11 ................
0042CAE0 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 ................
0042CAF0 11 11 11 11 0D 11 04 11 11 11 11 11 11 11 11 11 ................
0042CB00 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 ................
0042CB10 11 11 0A 0E 0C 11 11 11 11 11 11 11 11 11 11 05 ................
0042CB20 11 11 11 11 11 11 11 05 11 11 11 11 11 11 11 11 ................
0042CB30 11 11 0F 11 11 10 11 11 11 11 11 11 11 11 11 11 ................
0042CB40 11 11 11 11 11 11 11 11 11 11 11 11 11 11 0F 11 ................
0042CB50 11 11 11 11 11 11 11 11 11 11 11 0D 11 11 11 11 ................
0042CB60 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 ................
0042CB70 11 11 11 11 11 11 11 11 0B 0F 1F 00 85 C7 42 00 ..............B.
0042CB80 FE C7 42 00 70 C7 42 00 47 CA 42 00 00 03 03 01 ..B.p.B.G.B.....
0042CB90 03 03 03 03 03 03 03 03 03 03 03 03 02 02 66 90 ..............f.
0042CBA0 67 C8 42 00 FE C7 42 00 D0 C8 42 00 22 C7 42 00 g.B...B...B.".B.
0042CBB0 0D C7 42 00 2F CA 42 00 FA C8 42 00 52 C8 42 00 ..B./.B...B.R.B.
0042CBC0 B7 C9 42 00 BB C8 42 00 24 C9 42 00 FF C9 42 00 ..B...B.$.B...B.
0042CBD0 8D C9 42 00 E7 C9 42 00 CF C9 42 00 3D C8 42 00 ..B...B...B.=.B.
0042CBE0 13 C8 42 00 28 C8 42 00 39 C9 42 00 63 C9 42 00 ..B.(.B.9.B.c.B.
0042CBF0 4E C9 42 00 7C C8 42 00 A6 C8 42 00 78 C9 42 00 N.B.|.B...B.x.B.
0042CC00 0F C9 42 00 A2 C9 42 00 17 CA 42 00 91 C8 42 00 ..B...B...B...B.
0042CC10 50 C6 42 00 E5 C8 42 00 47 CA 42 00 00 1E 1E 1E P.B...B.G.B.....
0042CC20 01 02 1E 1E 1E 1E 1E 1E 1E 03 1E 04 1E 1E 1E 1E ................
0042CC30 1E 1E 1E 1E 1E 1E 05 06 07 08 09 0A 0B 0C 0D 1E ................
0042CC40 0E 1E 0F 10 11 12 13 14 15 16 17 18 19 1E 1E 1A ................
0042CC50 1B 1E 1C 1E 1D CC CC CC CC CC CC CC CC CC CC CC ................
0042CC60 55 8B EC 6A FF 68 E0 DA 42 00 64 A1 00 00 00 00 U..j.h..B.d.....
0042CC70 50 A1 08 A0 43 00 33 C5 50 8D 45 F4 64 A3 00 00 P...C.3.P.E.d...
0042CC80 00 00 64 A1 2C 00 00 00 8B 0D 0C B1 43 00 8B 0C ..d.,.......C...
0042CC90 88 A1 E0 B0 43 00 3B 81 04 00 00 00 7E 2D 68 E0 ....C.;.....~-h.
0042CCA0 B0 43 00 E8 AC 07 00 00 83 C4 04 83 3D E0 B0 43 .C..........=..C
0042CCB0 00 FF 75 17 68 60 0B 43 00 E8 94 AC FF FF 68 E0 ..u.h`.C......h.
0042CCC0 B0 43 00 E8 42 07 00 00 83 C4 08 B8 70 A0 43 00 .C..B.......p.C.
0042CCD0 8B 4D F4 64 89 0D 00 00 00 00 59 8B E5 5D C3 CC .M.d......Y..]..
0042CCE0 55 8B EC 6A FF 68 E0 03 43 00 64 A1 00 00 00 00 U..j.h..C.d.....
0042CCF0 50 A1 08 A0 43 00 33 C5 50 8D 45 F4 64 A3 00 00 P...C.3.P.E.d...
0042CD00 00 00 64 A1 2C 00 00 00 8B 0D 0C B1 43 00 C7 45 ..d.,.......C..E
0042CD10 FC 00 00 00 00 8B 0C 88 A1 E0 B0 43 00 3B 81 04 ...........C.;..
0042CD20 00 00 00 7E 37 68 E0 B0 43 00 E8 25 07 00 00 83 ...~7h..C..%....
0042CD30 C4 04 83 3D E0 B0 43 00 FF 75 21 68 60 0B 43 00 ...=..C..u!h`.C.
0042CD40 C7 05 70 A0 43 00 90 16 43 00 E8 03 AC FF FF 68 ..p.C...C......h
0042CD50 E0 B0 43 00 E8 B1 06 00 00 83 C4 08 8B 45 08 8B ..C..........E..
0042CD60 4D 0C 89 08 C7 40 04 70 A0 43 00 8B 4D F4 64 89 M....@.p.C..M.d.
0042CD70 0D 00 00 00 00 59 8B E5 5D C3 CC CC CC CC CC CC .....Y..].......

;; fn0042CD80: 0042CD80
fn0042CD80 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	4308C5h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,38h
	mov	eax,[43A008h]
	xor	eax,ebp
	mov	[ebp-10h],eax
	push	ebx
	push	esi
	push	edi
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	esi,[ebp+8h]
	mov	edi,[ebp+0Ch]
	mov	dword ptr [ebp-44h],0h
	mov	eax,fs:[002Ch]
	mov	ecx,[43B10Ch]
	mov	ecx,[eax+ecx*4]
	mov	eax,[43B0D8h]
	cmp	eax,[ecx+4h]
	jle	42CE20h

l0042CDD4:
	push	43B0D8h
	call	42D454h
	add	esp,4h
	cmp	dword ptr [43B0D8h],0FFh
	jnz	42CE20h

l0042CDEA:
	push	0Dh
	push	4316C4h
	mov	ecx,43A054h
	mov	dword ptr [ebp-4h],0h
	call	402A70h
	push	430B80h
	call	427952h
	push	43B0D8h
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	42D40Ah
	add	esp,8h

l0042CE20:
	push	edi
	call	dword ptr [431298h]
	mov	edx,eax
	add	esp,4h
	test	edx,edx
	jz	42CE64h

l0042CE30:
	mov	ecx,edx
	mov	dword ptr [ebp-30h],0h
	mov	dword ptr [ebp-2Ch],0Fh
	mov	byte ptr [ebp-40h],0h
	lea	edi,[ecx+1h]

l0042CE47:
	mov	al,[ecx]
	inc	ecx
	test	al,al
	jnz	42CE47h

l0042CE4E:
	sub	ecx,edi
	push	ecx
	push	edx
	lea	ecx,[ebp-40h]
	call	402A70h
	lea	edi,[ebp-40h]
	mov	ebx,1h
	jmp	42CE8Fh

l0042CE64:
	push	0FFh
	push	0h
	push	43A054h
	lea	ecx,[ebp-28h]
	mov	dword ptr [ebp-18h],0h
	mov	dword ptr [ebp-14h],0Fh
	mov	byte ptr [ebp-28h],0h
	call	4113C0h
	lea	edi,[ebp-28h]
	mov	ebx,2h

l0042CE8F:
	cmp	dword ptr [edi+14h],10h
	mov	dword ptr [esi+10h],0h
	mov	dword ptr [esi+14h],0Fh
	mov	byte ptr [esi],0h
	jc	42CEB2h

l0042CEA6:
	mov	eax,[edi]
	mov	[esi],eax
	mov	dword ptr [edi],0h
	jmp	42CEC1h

l0042CEB2:
	mov	eax,[edi+10h]
	inc	eax
	push	eax
	push	edi
	push	esi
	call	42D1CFh
	add	esp,0Ch

l0042CEC1:
	mov	eax,[edi+10h]
	or	ebx,4h
	mov	[esi+10h],eax
	mov	eax,[edi+14h]
	mov	dword ptr [edi+10h],0h
	mov	dword ptr [edi+14h],0Fh
	mov	[esi+14h],eax
	mov	byte ptr [edi],0h
	test	bl,2h
	jz	42CF0Ah

l0042CEE6:
	and	ebx,0FDh
	mov	[ebp-44h],ebx
	mov	eax,[ebp-14h]
	mov	dword ptr [ebp-4h],2h
	cmp	eax,10h
	jc	42CF0Ah

l0042CEFB:
	inc	eax
	push	1h
	push	eax
	push	dword ptr [ebp-28h]
	call	4289B0h
	add	esp,0Ch

l0042CF0A:
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	test	bl,1h
	jz	42CF34h

l0042CF16:
	mov	ecx,[ebp-2Ch]
	mov	dword ptr [ebp-4h],3h
	cmp	ecx,10h
	jc	42CF34h

l0042CF25:
	push	1h
	inc	ecx
	push	ecx
	push	dword ptr [ebp-40h]
	call	4289B0h
	add	esp,0Ch

l0042CF34:
	mov	eax,esi
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	ecx,[ebp-10h]
	xor	ecx,ebp
	call	427500h
	mov	esp,ebp
	pop	ebp
	ret	8h
0042CF54             CC CC CC CC CC CC CC CC CC CC CC CC     ............
0042CF60 55 8B EC 6A FF 68 00 09 43 00 64 A1 00 00 00 00 U..j.h..C.d.....
0042CF70 50 83 EC 2C A1 08 A0 43 00 33 C5 89 45 F0 53 56 P..,...C.3..E.SV
0042CF80 57 50 8D 45 F4 64 A3 00 00 00 00 8B 5D 08 8D 45 WP.E.d......]..E
0042CF90 D0 6A 00 6A 00 50 68 00 04 00 00 FF 75 0C 89 5D .j.j.Ph.....u..]
0042CFA0 D4 6A 00 68 00 13 00 00 C7 45 CC 00 00 00 00 C7 .j.h.....E......
0042CFB0 45 D0 00 00 00 00 FF 15 34 10 43 00 8B 75 D0 89 E.......4.C..u..
0042CFC0 75 C8 C7 45 FC 00 00 00 00 85 C0 75 26 6A 0D 89 u..E.......u&j..
0042CFD0 43 10 8B CB C7 43 14 0F 00 00 00 68 C4 16 43 00 C....C.....h..C.
0042CFE0 88 03 E8 89 5A FD FF C7 45 FC 01 00 00 00 E9 E3 ....Z...E.......
0042CFF0 00 00 00 8B CE C7 45 E8 00 00 00 00 C7 45 EC 0F ......E......E..
0042D000 00 00 00 C6 45 D8 00 8D 51 01 66 0F 1F 44 00 00 ....E...Q.f..D..
0042D010 8A 01 41 84 C0 75 F9 2B CA 51 56 8D 4D D8 E8 4D ..A..u.+.QV.M..M
0042D020 5A FD FF 8B 4D E8 C6 45 FC 02 85 C9 74 7B 66 90 Z...M..E....t{f.
0042D030 8B 55 EC 8D 45 D8 8B 7D D8 83 FA 10 0F 43 C7 80 .U..E..}.....C..
0042D040 7C 08 FF 0A 74 10 83 FA 10 8D 45 D8 0F 43 C7 80 |...t.....E..C..
0042D050 7C 08 FF 0D 75 20 8D 59 FF 3B CB 72 34 83 FA 10 |...u .Y.;.r4...
0042D060 89 5D E8 8D 45 D8 0F 43 C7 C6 04 18 00 8B 4D E8 .]..E..C......M.
0042D070 85 C9 75 BC EB 30 85 C9 74 2C 83 FA 10 8D 45 D8 ..u..0..t,....E.
0042D080 0F 43 C7 80 7C 08 FF 2E 75 1C 8D 59 FF 3B CB 73 .C..|...u..Y.;.s
0042D090 05 E8 9A B9 FF FF 83 FA 10 89 5D E8 8D 45 D8 0F ..........]..E..
0042D0A0 43 C7 C6 04 18 00 8B 5D D4 8D 45 D8 8B CB 50 E8 C......]..E...P.
0042D0B0 9C 57 FD FF 8B 45 EC C6 45 FC 03 83 F8 10 72 0F .W...E..E.....r.
0042D0C0 40 6A 01 50 FF 75 D8 E8 E4 B8 FF FF 83 C4 0C C7 @j.P.u..........
0042D0D0 45 FC 04 00 00 00 56 FF 15 30 10 43 00 8B C3 8B E.....V..0.C....
0042D0E0 4D F4 64 89 0D 00 00 00 00 59 5F 5E 5B 8B 4D F0 M.d......Y_^[.M.
0042D0F0 33 CD E8 09 A4 FF FF 8B E5 5D C2 08 00 CC CC CC 3........]......

;; fn0042D100: 0042D100
fn0042D100 proc
	mov	eax,43167Ch
	ret
0042D106                   CC CC CC CC CC CC CC CC CC CC       ..........
0042D110 B8 84 16 43 00 C3 CC CC CC CC CC CC CC CC CC CC ...C............

;; fn0042D120: 0042D120
;;   Called from:
;;     0042A3D7 (in fn0042A390)
;;     0042A3EE (in fn0042A390)
;;     0042A420 (in fn0042A390)
;;     0042A491 (in fn0042A450)
;;     0042A4A8 (in fn0042A450)
;;     0042A4D7 (in fn0042A450)
;;     0042A753 (in fn0042A710)
;;     0042A7BC (in fn0042A710)
;;     0042A87C (in fn0042A830)
;;     0042A8DD (in fn0042A8D0)
;;     0042A9F8 (in fn0042A9E0)
;;     0042ACC3 (in fn0042AB60)
fn0042D120 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42DAE0h
	mov	eax,fs:[0000h]
	push	eax
	mov	eax,[43A008h]
	xor	eax,ebp
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	eax,fs:[002Ch]
	mov	ecx,[43B10Ch]
	mov	ecx,[eax+ecx*4]
	mov	eax,[43B0DCh]
	cmp	eax,[ecx+4h]
	jle	42D18Bh

l0042D15E:
	push	43B0DCh
	call	42D454h
	add	esp,4h
	cmp	dword ptr [43B0DCh],0FFh
	jnz	42D18Bh

l0042D174:
	push	430B70h
	call	427952h
	push	43B0DCh
	call	42D40Ah
	add	esp,8h

l0042D18B:
	mov	eax,43A06Ch
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	mov	esp,ebp
	pop	ebp
	ret
0042D19F                                              FF                .
0042D1A0 25 C4 11 43 00 FF 25 C8 11 43 00 FF 25 F0 11 43 %..C..%..C..%..C
0042D1B0 00                                              .               
0042D1B1    FF 25 E8 11 43 00 FF 25 E4 11 43 00 FF 25 E0  .%..C..%..C..%.
0042D1C0 11 43 00 FF 25 DC 11 43 00 FF 25 D8 11 43 00 FF .C..%..C..%..C..
0042D1D0 25 D4 11 43 00 FF 25 24 12 43 00 FF 25 18 12 43 %..C..%$.C..%..C
0042D1E0 00 FF 25 88 12 43 00 FF 25 84 12 43 00 FF 25 80 ..%..C..%..C..%.
0042D1F0 12 43 00 FF 25 7C 12 43 00                      .C..%|.C.       
0042D1F9                            FF 25 78 12 43 00             .%x.C. 
0042D1FF                                              FF                .
0042D200 25 70 12 43 00 FF 25 6C 12 43 00 FF 25 68 12 43 %p.C..%l.C..%h.C
0042D210 00 FF 25 64 12 43 00 FF 25 3C 12 43 00 FF 25 5C ..%d.C..%<.C..%\
0042D220 12 43 00 FF 25 58 12 43 00 FF 25 54 12 43 00 FF .C..%X.C..%T.C..
0042D230 25 50 12 43 00 FF 25 4C 12 43 00 FF 25 D4 12 43 %P.C..%L.C..%..C
0042D240 00 FF 25 44 12 43 00 FF 25 48 12 43 00 FF 25 60 ..%D.C..%H.C..%`
0042D250 12 43 00 FF 25 74 12 43 00 FF 25 2C 12 43 00 FF .C..%t.C..%,.C..
0042D260 25 20 12 43 00 FF 25 D8 12 43 00 FF 25 1C 12 43 % .C..%..C..%..C
0042D270 00 FF 25 8C 12 43 00 FF 25 74 10 43 00 FF 25 50 ..%..C..%t.C..%P
0042D280 11 43 00 FF 25 4C 11 43 00                      .C..%L.C.       

;; fn0042D289: 0042D289
;;   Called from:
;;     00428C75 (in fn00428BE0)
;;     0042A583 (in fn0042A520)
fn0042D289 proc
	push	ebp
	mov	ebp,esp
	pop	ebp
	jmp	427511h

;; fn0042D292: 0042D292
;;   Called from:
;;     00428C9C (in fn00428BE0)
;;     0042A5CF (in fn0042A520)
fn0042D292 proc
	jmp	427E3Eh
0042D297                      E8 3F 00 00 00 6A 00 E8 F6        .?...j...
0042D2A0 A4 FF FF 59 84 C0 74 0E 68 CA D3 42 00 E8 A0 A6 ...Y..t.h..B....
0042D2B0 FF FF 59 33 C0 C3 6A 07 E8 2D AD FF FF CC 55 8B ..Y3..j..-....U.
0042D2C0 EC A1 08 A0 43 00 83 E0 1F 6A 20 59 2B C8 8B 45 ....C....j Y+..E
0042D2D0 08 D3 C8 33 05 08 A0 43 00 5D C3 55 8B EC 6A FF ...3...C.].U..j.
0042D2E0 68 25 09 43 00 64 A1 00 00 00 00 50 53 56 57 A1 h%.C.d.....PSVW.
0042D2F0 08 A0 43 00 33 C5 50 8D 45 F4 64 A3 00 00 00 00 ..C.3.P.E.d.....
0042D300 68 A0 0F 00 00 68 E4 B0 43 00 FF 15 40 10 43 00 h....h..C...@.C.
0042D310 68 D8 16 43 00 FF 15 7C 10 43 00 8B F0 85 F6 75 h..C...|.C.....u
0042D320 15 68 1C 17 43 00 FF 15 7C 10 43 00 8B F0 85 F6 .h..C...|.C.....
0042D330 0F 84 8C 00 00 00 68 38 17 43 00 56 FF 15 18 10 ......h8.C.V....
0042D340 43 00 68 54 17 43 00 56 8B D8 FF 15 18 10 43 00 C.hT.C.V......C.
0042D350 68 70 17 43 00 56 8B F8 FF 15 18 10 43 00 8B F0 hp.C.V......C...
0042D360 85 DB 74 38 85 FF 74 34 85 F6 74 30 83 25 00 B1 ..t8..t4..t0.%..
0042D370 43 00 00 8B CB 68 FC B0 43 00 FF 15 E0 12 43 00 C....h..C.....C.
0042D380 FF D3 57 E8 36 FF FF FF 56 A3 04 B1 43 00 E8 2B ..W.6...V...C..+
0042D390 FF FF FF 59 59 A3 08 B1 43 00 EB 16 33 C0 50 50 ...YY...C...3.PP
0042D3A0 6A 01 50 FF 15 5C 10 43 00 A3 00 B1 43 00 85 C0 j.P..\.C....C...
0042D3B0 74 10 8B 4D F4 64 89 0D 00 00 00 00 59 5F 5E 5B t..M.d......Y_^[
0042D3C0 C9 C3 6A 07 E8 21 AC FF FF CC 68 E4 B0 43 00 FF ..j..!....h..C..
0042D3D0 15 44 10 43 00 A1 00 B1 43 00 85 C0 74 07 50 FF .D.C....C...t.P.
0042D3E0 15 0C 10 43 00 C3 55 8B EC 56 BE E4 B0 43 00 56 ...C..U..V...C.V
0042D3F0 FF 15 38 10 43 00 8B 45 08 56 83 20 00 FF 15 3C ..8.C..E.V. ...<
0042D400 10 43 00 5E 5D E9 9C 00 00 00                   .C.^].....      

;; fn0042D40A: 0042D40A
;;   Called from:
;;     0042B53B (in fn0042B4C0)
;;     0042B5DB (in fn0042B560)
;;     0042C284 (in fn0042C210)
;;     0042C37A (in fn0042C310)
;;     0042CE18 (in fn0042CD80)
;;     0042D183 (in fn0042D120)
fn0042D40A proc
	push	ebp
	mov	ebp,esp
	push	esi
	mov	esi,43B0E4h
	push	esi
	call	dword ptr [431038h]
	mov	ecx,[43A074h]
	mov	eax,[ebp+8h]
	inc	ecx
	mov	[43A074h],ecx
	push	esi
	mov	[eax],ecx
	mov	eax,fs:[002Ch]
	mov	ecx,[43B10Ch]
	mov	ecx,[eax+ecx*4]
	mov	eax,[43A074h]
	mov	[ecx+4h],eax
	call	dword ptr [43103Ch]
	pop	esi
	pop	ebp
	jmp	42D4A6h

;; fn0042D454: 0042D454
;;   Called from:
;;     0042B503 (in fn0042B4C0)
;;     0042B5A3 (in fn0042B560)
;;     0042C253 (in fn0042C210)
;;     0042C353 (in fn0042C310)
;;     0042CDD9 (in fn0042CD80)
;;     0042D163 (in fn0042D120)
fn0042D454 proc
	push	ebp
	mov	ebp,esp
	push	esi
	push	edi
	mov	edi,43B0E4h
	push	edi
	call	dword ptr [431038h]
	mov	esi,[ebp+8h]

l0042D468:
	cmp	dword ptr [esi],0h
	jnz	42D47Ch

l0042D46D:
	or	dword ptr [esi],0FFh
	jmp	42D49Bh

l0042D472:
	push	64h
	call	42D4E8h
	pop	ecx
	jmp	42D468h

l0042D47C:
	cmp	dword ptr [esi],0FFh
	jz	42D472h

l0042D481:
	mov	eax,fs:[002Ch]
	mov	ecx,[43B10Ch]
	mov	ecx,[eax+ecx*4]
	mov	eax,[43A074h]
	mov	[ecx+4h],eax

l0042D49B:
	push	edi
	call	dword ptr [43103Ch]
	pop	edi
	pop	esi
	pop	ebp
	ret

l0042D4A6:
	mov	eax,[43B100h]
	test	eax,eax
	jnz	42D4D4h

l0042D4AF:
	push	esi
	mov	esi,[43A008h]
	mov	ecx,esi
	xor	esi,[43B108h]
	and	ecx,1Fh
	ror	esi,cl
	push	43B0FCh
	mov	ecx,esi
	call	dword ptr [4312E0h]
	call	esi
	pop	esi
	ret

l0042D4D4:
	push	eax
	call	dword ptr [43104Ch]
	push	dword ptr [43B100h]
	call	dword ptr [431054h]
	ret

;; fn0042D4E8: 0042D4E8
;;   Called from:
;;     0042D474 (in fn0042D454)
fn0042D4E8 proc
	push	ebp
	mov	ebp,esp
	cmp	dword ptr [43B100h],0h
	push	esi
	jnz	42D521h

l0042D4F5:
	mov	esi,[43A008h]
	mov	ecx,esi
	push	dword ptr [ebp+8h]
	xor	esi,[43B104h]
	and	ecx,1Fh
	push	43B0E4h
	ror	esi,cl
	push	43B0FCh
	mov	ecx,esi
	call	dword ptr [4312E0h]
	call	esi
	jmp	42D545h

l0042D521:
	mov	esi,43B0E4h
	push	esi
	call	dword ptr [43103Ch]
	push	0h
	push	dword ptr [ebp+8h]
	push	dword ptr [43B100h]
	call	dword ptr [431058h]
	push	esi
	call	dword ptr [431038h]

l0042D545:
	pop	esi
	pop	ebp
	ret
0042D548                         CC CC CC CC CC CC CC CC         ........

;; fn0042D550: 0042D550
;;   Called from:
;;     00418CC9 (in fn00418C30)
fn0042D550 proc
	push	edi
	push	esi
	push	ebx
	xor	edi,edi
	mov	eax,[esp+14h]
	or	eax,eax
	jge	42D571h

l0042D55D:
	inc	edi
	mov	edx,[esp+10h]
	neg	eax
	neg	edx
	sbb	eax,0h
	mov	[esp+14h],eax
	mov	[esp+10h],edx

l0042D571:
	mov	eax,[esp+1Ch]
	or	eax,eax
	jge	42D58Dh

l0042D579:
	inc	edi
	mov	edx,[esp+18h]
	neg	eax
	neg	edx
	sbb	eax,0h
	mov	[esp+1Ch],eax
	mov	[esp+18h],edx

l0042D58D:
	or	eax,eax
	jnz	42D5A9h

l0042D591:
	mov	ecx,[esp+18h]
	mov	eax,[esp+14h]
	xor	edx,edx
	div	ecx
	mov	ebx,eax
	mov	eax,[esp+10h]
	div	ecx
	mov	edx,ebx
	jmp	42D5EAh

l0042D5A9:
	mov	ebx,eax
	mov	ecx,[esp+18h]
	mov	edx,[esp+14h]
	mov	eax,[esp+10h]

l0042D5B7:
	shr	ebx,1h
	rcr	ecx,1h
	shr	edx,1h
	rcr	eax,1h
	or	ebx,ebx
	jnz	42D5B7h

l0042D5C3:
	div	ecx
	mov	esi,eax
	mul	dword ptr [esp+1Ch]
	mov	ecx,eax
	mov	eax,[esp+18h]
	mul	esi
	add	edx,ecx
	jc	42D5E5h

l0042D5D7:
	cmp	edx,[esp+14h]
	ja	42D5E5h

l0042D5DD:
	jc	42D5E6h

l0042D5DF:
	cmp	eax,[esp+10h]
	jbe	42D5E6h

l0042D5E5:
	dec	esi

l0042D5E6:
	xor	edx,edx
	mov	eax,esi

l0042D5EA:
	dec	edi
	jnz	42D5F4h

l0042D5ED:
	neg	edx
	neg	eax
	sbb	edx,0h

l0042D5F4:
	pop	ebx
	pop	esi
	pop	edi
	ret	10h
0042D5FA                               CC CC CC CC CC CC           ......
0042D600 8B 44 24 08 8B 4C 24 10 0B C8 8B 4C 24 0C 75 09 .D$..L$....L$.u.
0042D610 8B 44 24 04 F7 E1 C2 10 00 53 F7 E1 8B D8 8B 44 .D$......S.....D
0042D620 24 08 F7 64 24 14 03 D8 8B 44 24 08 F7 E1 03 D3 $..d$....D$.....
0042D630 5B C2 10 00 CC CC CC CC CC CC CC CC CC CC CC CC [...............
0042D640 51 8D 4C 24 04 2B C8 1B C0 F7 D0 23 C8 8B C4 25 Q.L$.+.....#...%
0042D650 00 F0 FF FF 3B C8 F2 72 0B 8B C1 59 94 8B 00 89 ....;..r...Y....
0042D660 04 24 F2 C3 2D 00 10 00 00 85 00 EB E7 CC CC CC .$..-...........

;; fn0042D670: 0042D670
;;   Called from:
;;     00424569 (in fn00424170)
;;     00424718 (in fn00424170)
;;     004248C4 (in fn00424170)
;;     00424A70 (in fn00424170)
fn0042D670 proc
	push	ebx
	push	edi
	xor	edi,edi
	mov	eax,[esp+10h]
	or	eax,eax
	jge	42D690h

l0042D67C:
	inc	edi
	mov	edx,[esp+0Ch]
	neg	eax
	neg	edx
	sbb	eax,0h
	mov	[esp+10h],eax
	mov	[esp+0Ch],edx

l0042D690:
	mov	eax,[esp+18h]
	or	eax,eax
	jge	42D6ABh

l0042D698:
	mov	edx,[esp+14h]
	neg	eax
	neg	edx
	sbb	eax,0h
	mov	[esp+18h],eax
	mov	[esp+14h],edx

l0042D6AB:
	or	eax,eax
	jnz	42D6CAh

l0042D6AF:
	mov	ecx,[esp+14h]
	mov	eax,[esp+10h]
	xor	edx,edx
	div	ecx
	mov	eax,[esp+0Ch]
	div	ecx
	mov	eax,edx
	xor	edx,edx
	dec	edi
	jns	42D716h

l0042D6C8:
	jmp	42D71Dh

l0042D6CA:
	mov	ebx,eax
	mov	ecx,[esp+14h]
	mov	edx,[esp+10h]
	mov	eax,[esp+0Ch]

l0042D6D8:
	shr	ebx,1h
	rcr	ecx,1h
	shr	edx,1h
	rcr	eax,1h
	or	ebx,ebx
	jnz	42D6D8h

l0042D6E4:
	div	ecx
	mov	ecx,eax
	mul	dword ptr [esp+18h]
	xchg	ecx,eax
	mul	dword ptr [esp+14h]
	add	edx,ecx
	jc	42D703h

l0042D6F5:
	cmp	edx,[esp+10h]
	ja	42D703h

l0042D6FB:
	jc	42D70Bh

l0042D6FD:
	cmp	eax,[esp+0Ch]
	jbe	42D70Bh

l0042D703:
	sub	eax,[esp+14h]
	sbb	edx,[esp+18h]

l0042D70B:
	sub	eax,[esp+0Ch]
	sbb	edx,[esp+10h]
	dec	edi
	jns	42D71Dh

l0042D716:
	neg	edx
	neg	eax
	sbb	edx,0h

l0042D71D:
	pop	edi
	pop	ebx
	ret	10h
0042D722       CC CC CC CC CC CC CC CC CC CC CC CC CC CC   ..............

;; fn0042D730: 0042D730
;;   Called from:
;;     0041C582 (in fn0041C3F6)
fn0042D730 proc
	mov	ecx,1h
	movsd	xmm5,double ptr [432FC8h]
	jmp	42D75Bh
0042D73F                                              B9                .
0042D740 02 00 00 00 F2 0F 10 2D D0 2F 43 00 EB 0D B9 03 .......-./C.....
0042D750 00 00 00 F2 0F 10 2D C8 2F 43 00                ......-./C.     

l0042D75B:
	movd	eax,xmm0
	and	eax,7FFFFFFFh
	cmp	eax,7F800000h
	jnc	42D8BBh

l0042D76F:
	cvtss2sd	xmm0,xmm0

;; fn0042D773: 0042D773
;;   Called from:
;;     0042D76F (in fn0042D730)
;;     0042D953 (in fn0042D911)
;;     0042D95C (in fn0042D911)
;;     0042D9C3 (in fn0042D911)
;;     0042D9DD (in fn0042D911)
;;     0042DA21 (in fn0042D911)
;;     0042DA33 (in fn0042D911)
;;     0042DA39 (in fn0042D911)
fn0042D773 proc
	cmp	ecx,2h
	jnz	42D790h

l0042D778:
	movsd	xmm2,double ptr [432FE8h]
	comisd	xmm0,xmm2
	jbe	42D790h

l0042D786:
	mov	edx,10h
	call	42D8CDh

l0042D790:
	comisd	xmm0,xmm5
	jnc	42D8BBh

l0042D79A:
	movsd	xmm6,double ptr [432FC0h]
	comisd	xmm0,xmm6
	jc	42D8BBh

l0042D7AC:
	movdqa	xmm1,xmm0
	psllq	xmm1,1h
	psrlq	xmm1,1h
	cmp	ecx,1h
	jz	42D7F9h

l0042D7BF:
	movsd	xmm2,double ptr [432FE0h]
	comisd	xmm1,xmm2
	ja	42D7F9h

l0042D7CD:
	xorpd	xmm2,xmm2
	comisd	xmm1,xmm2
	jz	42D7F9h

l0042D7D7:
	push	eax
	wait
	fstcw	word ptr [esp]
	mov	ax,[esp]
	test	ax,10h
	pop	eax
	jnz	42D7F9h

l0042D7E7:
	mov	edx,2h
	call	42D8CDh
	xor	eax,eax
	mov	edx,80000000h
	ret

l0042D7F9:
	xorpd	xmm6,xmm6
	comisd	xmm1,xmm6
	jz	42D8ADh

l0042D807:
	movsd	xmm3,double ptr [432FA0h]
	movsd	xmm4,double ptr [432FA8h]
	movd	xmm5,dword ptr [433000h]
	movdqa	xmm6,xmm0
	cmpeqsd	xmm6,xmm1
	movdqa	xmm2,xmm1
	pand	xmm2,xmm3
	por	xmm2,xmm4
	psrlq	xmm1,34h
	movdqa	xmm4,xmm1
	psubq	xmm4,xmm5
	movdqa	xmm3,xmm2
	psllq	xmm3,xmm4
	movdqa	xmm4,xmm5
	psubq	xmm4,xmm1
	movdqa	xmm7,xmm2
	psrlq	xmm7,xmm4
	pcmpgtd	xmm1,xmm5
	punpckldq	xmm1,xmm1
	pand	xmm3,xmm1
	pandn	xmm1,xmm7
	por	xmm1,xmm3
	pxor	xmm5,xmm5
	psubq	xmm5,xmm1
	pand	xmm1,xmm6
	pandn	xmm6,xmm5
	por	xmm6,xmm1
	movd	eax,xmm4
	cmp	eax,0h
	jle	42D8ADh

l0042D88A:
	psllq	xmm7,xmm4
	pxor	xmm2,xmm7
	movd	eax,xmm2
	psrldq	xmm2,4h
	movd	edx,xmm2
	or	eax,edx
	jz	42D8ADh

l0042D8A3:
	mov	edx,10h
	call	42D8CDh

l0042D8AD:
	movd	eax,xmm6
	psrldq	xmm6,4h
	movd	edx,xmm6
	ret

l0042D8BB:
	mov	edx,8h
	call	42D8CDh
	xor	eax,eax
	mov	edx,80000000h
	ret

;; fn0042D8CD: 0042D8CD
;;   Called from:
;;     0042D78B (in fn0042D773)
;;     0042D7EC (in fn0042D773)
;;     0042D8A8 (in fn0042D773)
;;     0042D8C0 (in fn0042D773)
;;     0042D8C0 (in fn0042D730)
;;     0042D988 (in fn0042D911)
;;     0042D992 (in fn0042D911)
;;     0042D99E (in fn0042D911)
;;     0042D9A8 (in fn0042D911)
;;     0042D9CE (in fn0042D911)
;;     0042D9D8 (in fn0042D911)
;;     0042DA18 (in fn0042D911)
fn0042D8CD proc
	sub	esp,20h
	wait
	fstcw	word ptr [esp]
	movzx	eax,word ptr [esp]
	cmp	edx,8h
	jz	42D8E5h

l0042D8DD:
	test	[edx+432FEFh],al
	jnz	42D90Dh

l0042D8E5:
	fldcw	word ptr [433010h]
	mov	[esp],edx
	mov	dword ptr [esp+4h],0h
	movsd	double ptr [esp+8h],xmm0
	movsd	double ptr [esp+10h],xmm0
	mov	[esp+18h],eax
	call	42DAB3h
	fstp	st(0)

l0042D90D:
	add	esp,20h
	ret

;; fn0042D911: 0042D911
;;   Called from:
;;     0041AED1 (in fn0041AE90)
;;     0041C5E8 (in fn0041C5C0)
;;     0041C673 (in fn0041C600)
;;     0041C734 (in fn0041C680)
;;     0041C7C7 (in fn0041C740)
;;     0041C8F6 (in fn0041C7E0)
;;     0041CB7D (in fn0041CB12)
;;     0041CC3F (in fn0041CB12)
;;     0041CCAE (in fn0041CC60)
;;     0041D0D1 (in fn0041CC60)
;;     0041D4BE (in fn0041CC60)
;;     0041D57A (in fn0041CC60)
;;     0041D57A (in fn0041D540)
;;     0041DB93 (in fn0041DAF0)
;;     0041DC68 (in fn0041DAF0)
;;     0041DD73 (in fn0041DAF0)
;;     0041DF09 (in fn0041DAF0)
;;     0041DFCB (in fn0041DAF0)
;;     0041E140 (in fn0041DAF0)
;;     0041E20E (in fn0041DAF0)
;;     0041E31D (in fn0041DAF0)
;;     0041E4B3 (in fn0041DAF0)
;;     0041E575 (in fn0041DAF0)
;;     0041E724 (in fn0041DAF0)
;;     0041E7D5 (in fn0041DAF0)
;;     0041E915 (in fn0041DAF0)
;;     0041EA66 (in fn0041DAF0)
;;     0041EB14 (in fn0041DAF0)
;;     0041EC51 (in fn0041DAF0)
;;     0041ECED (in fn0041DAF0)
;;     0041EDC5 (in fn0041ED20)
;;     0041EE2F (in fn0041ED20)
;;     0041EEE5 (in fn0041EE50)
;;     0041EF93 (in fn0041EE50)
;;     0041F041 (in fn0041EE50)
;;     0041F0EF (in fn0041EE50)
;;     0041F19B (in fn0041EE50)
;;     0041F249 (in fn0041EE50)
;;     0041F2F7 (in fn0041EE50)
;;     00420573 (in fn004204C0)
;;     00420605 (in fn004204C0)
;;     00420697 (in fn004204C0)
;;     00420729 (in fn004204C0)
;;     004207BB (in fn004204C0)
;;     0042084D (in fn004204C0)
;;     004208DF (in fn004204C0)
;;     00420971 (in fn004204C0)
;;     00420A03 (in fn004204C0)
;;     00420A95 (in fn004204C0)
;;     00420B27 (in fn004204C0)
;;     00420BB9 (in fn004204C0)
;;     00420C28 (in fn004204C0)
;;     00420D0D (in fn004204C0)
;;     00420DE7 (in fn004204C0)
;;     00420F34 (in fn004204C0)
;;     00421035 (in fn004204C0)
;;     004210C7 (in fn004204C0)
;;     0042131B (in fn004204C0)
;;     004213F2 (in fn004204C0)
;;     004214C3 (in fn004204C0)
;;     00421555 (in fn004204C0)
;;     004215E7 (in fn004204C0)
;;     004216B8 (in fn00421620)
;;     00421770 (in fn00421620)
;;     0042182D (in fn00421620)
;;     00421943 (in fn00421620)
;;     004237E8 (in fn004237A0)
;;     00423F1B (in fn004237A0)
;;     004240DC (in fn004237A0)
;;     004241AF (in fn00424170)
;;     0042444F (in fn00424170)
;;     00424587 (in fn00424170)
;;     00424736 (in fn00424170)
;;     004248E2 (in fn00424170)
;;     00424A8E (in fn00424170)
;;     00425AAC (in fn00425A20)
;;     00425B56 (in fn00425A20)
;;     00425BF7 (in fn00425A20)
;;     00425C98 (in fn00425A20)
;;     00425D42 (in fn00425A20)
;;     00425DD2 (in fn00425A20)
;;     00425E7C (in fn00425A20)
;;     00425F0C (in fn00425A20)
;;     00425F9C (in fn00425A20)
;;     0042602F (in fn00425A20)
;;     004260C2 (in fn00425A20)
;;     00426155 (in fn00425A20)
;;     004261E8 (in fn00425A20)
;;     004262E4 (in fn004262A0)
;;     004268DC (in fn004262A0)
;;     00426EFC (in fn00426E70)
;;     00426FE1 (in fn00426E70)
;;     004270E2 (in fn00426E70)
;;     00427174 (in fn00426E70)
fn0042D911 proc
	mov	ecx,1h
	movsd	xmm5,double ptr [432FC8h]
	jmp	42D93Ch
0042D920 B9 04 00 00 00 F2 0F 10 2D D0 2F 43 00 EB 0D B9 ........-./C....
0042D930 05 00 00 00 F2 0F 10 2D C8 2F 43 00             .......-./C.    

l0042D93C:
	movdqa	xmm1,xmm0
	psrldq	xmm1,4h
	movd	eax,xmm1
	and	eax,7FFFFFFFh
	cmp	eax,7FF00000h
	jnc	42D8BBh

l0042D959:
	cmp	ecx,1h
	jz	42D773h

l0042D962:
	movdqa	xmm1,xmm0
	psllq	xmm1,1h
	psrlq	xmm1,1h
	movsd	xmm2,double ptr [432FD8h]
	comisd	xmm1,xmm2
	jbe	42D9ADh

l0042D97E:
	cmp	ecx,4h
	jz	42D999h

l0042D983:
	mov	edx,1h
	call	42D8CDh
	mov	edx,10h
	call	42D8CDh
	jmp	42D9ADh

l0042D999:
	mov	edx,10h
	call	42D8CDh
	mov	edx,1h
	call	42D8CDh

l0042D9AD:
	movsd	xmm2,double ptr [432FE0h]
	comisd	xmm1,xmm2
	jnc	42D9E2h

l0042D9BB:
	xorpd	xmm2,xmm2
	comisd	xmm1,xmm2
	jz	42D7F9h

l0042D9C9:
	mov	edx,2h
	call	42D8CDh
	mov	edx,10h
	call	42D8CDh
	jmp	42D7F9h

l0042D9E2:
	movdqa	xmm3,xmm0
	cmp	ecx,4h
	jnz	42D9FDh

l0042D9EB:
	movsd	xmm2,double ptr [432FC8h]
	comisd	xmm3,xmm2
	jc	42D9FDh

l0042D9F9:
	subpd	xmm3,xmm2

l0042D9FD:
	movdqa	xmm4,xmm3
	psllq	xmm4,23h
	psrlq	xmm4,23h
	movd	eax,xmm4
	or	eax,eax
	jz	42DA1Dh

l0042DA13:
	mov	edx,10h
	call	42D8CDh

l0042DA1D:
	comisd	xmm0,xmm5
	jnc	42D8BBh

l0042DA27:
	movsd	xmm2,double ptr [432FC0h]
	comisd	xmm0,xmm2
	jc	42D8BBh

l0042DA39:
	jmp	42D7F9h
0042DA3E                                           8B FF               ..
0042DA40 0F 57 C0 F2 0F 2A C1 C1 E9 1F F2 0F 58 04 CD 90 .W...*......X...
0042DA50 2F 43 00 85 D2 74 1F 0F 57 C9 F2 0F 2A CA C1 EA /C...t..W...*...
0042DA60 1F F2 0F 58 0C D5 90 2F 43 00 F2 0F 59 0D 98 2F ...X.../C...Y../
0042DA70 43 00 F2 0F 58 C1 C3 8D A4 24 00 00 00 00 8B FF C...X....$......
0042DA80 0F 57 C9 F2 0F 2A CA 0F 57 C0 F2 0F 2A C1 C1 E9 .W...*..W...*...
0042DA90 1F F2 0F 59 0D 98 2F 43 00 F2 0F 58 04 CD 90 2F ...Y../C...X.../
0042DAA0 43 00 F2 0F 58 C1 C3 FF 25 CC 11 43 00 FF 25 34 C...X...%..C..%4
0042DAB0 12 43 00                                        .C.             
0042DAB3          FF 25 38 12 43 00 CC CC CC CC CC CC CC    .%8.C........
0042DAC0 8B 54 24 08 8D 42 0C 8B 4A F8 33 C8 E8 2F 9A FF .T$..B..J.3../..
0042DAD0 FF B8 78 48 43 00 E9 C4 F6 FF FF CC CC CC CC CC ..xHC...........
0042DAE0 8B 54 24 08 8D 42 0C 8B 4A FC 33 C8 E8 0F 9A FF .T$..B..J.3.....
0042DAF0 FF B8 78 48 43 00 E9 A4 F6 FF FF CC CC CC CC CC ..xHC...........
0042DB00 8D 4D 08 E9 F8 4C FD FF 8B 54 24 08 8D 42 0C 8B .M...L...T$..B..
0042DB10 4A F0 33 C8 E8 E7 99 FF FF B8 9C 48 43 00 E9 7C J.3........HC..|
0042DB20 F6 FF FF CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0042DB30 8D 4D E4 E9 38 39 FD FF 8D 4D E4 E9 30 39 FD FF .M..89...M..09..
0042DB40 8B 54 24 08 8D 42 0C 8B 4A E0 33 C8 E8 AF 99 FF .T$..B..J.3.....
0042DB50 FF B8 C8 48 43 00 E9 44 F6 FF FF CC CC CC CC CC ...HC..D........
0042DB60 8D 4D 0C E9 98 4C FD FF 8B 54 24 08 8D 42 0C 8B .M...L...T$..B..
0042DB70 4A D8 33 C8 E8 87 99 FF FF B8 1C 49 43 00 E9 1C J.3........IC...
0042DB80 F6 FF FF CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0042DB90 8D 4D 08 E9 68 4C FD FF 8B 4D EC E9 00 45 FD FF .M..hL...M...E..
0042DBA0 8B 4D EC 83 C1 14 E9 35 3A FD FF 8B 4D EC 83 C1 .M.....5:...M...
0042DBB0 2C E9 2A 3A FD FF 8B 4D EC 83 C1 44 E9 1F 4B FD ,.*:...M...D..K.
0042DBC0 FF 8B 4D EC 83 C1 4C E9 34 4C FD FF 8B 4D EC 83 ..M...L.4L...M..
0042DBD0 C1 64 E9 69 4A FD FF 8B 4D EC 83 C1 6C E9 BE 45 .d.iJ...M...l..E
0042DBE0 FD FF 8B 54 24 08 8D 42 0C 8B 4A E8 33 C8 E8 0D ...T$..B..J.3...
0042DBF0 99 FF FF B8 48 49 43 00 E9 A2 F5 FF FF CC CC CC ....HIC.........
0042DC00 8D 4D EC FF 25 B8 11 43 00 8D 4D E8 E9 9F 5A FD .M..%..C..M...Z.
0042DC10 FF 8B 54 24 08 8D 42 0C 8B 4A D4 33 C8 E8 DE 98 ..T$..B..J.3....
0042DC20 FF FF 8B 4A FC 33 C8 E8 D4 98 FF FF B8 B0 49 43 ...J.3........IC
0042DC30 00 E9 69 F5 FF FF CC CC CC CC CC CC CC CC CC CC ..i.............
0042DC40 8D 4D D0 E9 28 5C FD FF 8D 4D D0 E9 80 5B FD FF .M..(\...M...[..
0042DC50 8B 54 24 08 8D 42 0C 8B 4A CC 33 C8 E8 9F 98 FF .T$..B..J.3.....
0042DC60 FF B8 EC 49 43 00 E9 34 F5 FF FF CC CC CC CC CC ...IC..4........
0042DC70 8D 4D E0 E9 48 59 FD FF 8B 54 24 08 8D 42 0C 8B .M..HY...T$..B..
0042DC80 4A DC 33 C8 E8 77 98 FF FF B8 64 4A 43 00 E9 0C J.3..w....dJC...
0042DC90 F5 FF FF CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0042DCA0 8B 54 24 08 8D 42 0C 8B 4A D8 33 C8 E8 4F 98 FF .T$..B..J.3..O..
0042DCB0 FF B8 A8 4A 43 00 E9 E4 F4 FF FF CC CC CC CC CC ...JC...........
0042DCC0 8B 54 24 08 8D 42 0C 8B 4A FC 33 C8 E8 2F 98 FF .T$..B..J.3../..
0042DCD0 FF B8 00 4B 43 00 E9 C4 F4 FF FF CC CC CC CC CC ...KC...........
0042DCE0 8B 54 24 08 8D 42 0C 8B 4A F8 33 C8 E8 0F 98 FF .T$..B..J.3.....
0042DCF0 FF B8 00 4B 43 00 E9 A4 F4 FF FF CC CC CC CC CC ...KC...........
0042DD00 8D 4D D4 E9 68 5B FD FF 8D 4D D4 E9 C0 5A FD FF .M..h[...M...Z..
0042DD10 8B 54 24 08 8D 42 0C 8B 4A D0 33 C8 E8 DF 97 FF .T$..B..J.3.....
0042DD20 FF B8 2C 4B 43 00 E9 74 F4 FF FF CC CC CC CC CC ..,KC..t........
0042DD30 8D 4D EC E9 48 1A FE FF 8D 4D E8 E9 40 1A FE FF .M..H....M..@...
0042DD40 8B 54 24 08 8D 42 0C 8B 4A E4 33 C8 E8 AF 97 FF .T$..B..J.3.....
0042DD50 FF 8B 4A FC 33 C8 E8 A5 97 FF FF B8 A4 4B 43 00 ..J.3........KC.
0042DD60 E9 3A F4 FF FF CC CC CC CC CC CC CC CC CC CC CC .:..............
0042DD70 8B 54 24 08 8D 42 0C 8B 4A F4 33 C8 E8 7F 97 FF .T$..B..J.3.....
0042DD80 FF B8 78 48 43 00 E9 14 F4 FF FF CC CC CC CC CC ..xHC...........
0042DD90 8D 4D CC E9 48 61 FD FF 8D 4D CC E9 40 61 FD FF .M..Ha...M..@a..
0042DDA0 8D 4D 80 E9 C8 36 FD FF 8D 8D E4 FE FF FF E9 3D .M...6.........=
0042DDB0 12 FE FF 8D 8D F0 FE FF FF E9 D2 0F FE FF 8D 8D ................
0042DDC0 10 FF FF FF E9 37 4A FD FF 8D 8D 2C FF FF FF E9 .....7J....,....
0042DDD0 AC 12 FE FF 8D 8D 74 FF FF FF E9 11 70 FD FF 8D ......t.....p...
0042DDE0 4D CC E9 19 4A FD FF 8D 8D E4 FE FF FF E9 6E 6E M...J.........nn
0042DDF0 FD FF 8D 4D 94 E9 E6 60 FD FF 8D 4D 94 E9 DE 60 ...M...`...M...`
0042DE00 FD FF 8D 4D CC E9 D6 60 FD FF 8D 4D CC E9 CE 60 ...M...`...M...`
0042DE10 FD FF 8D 4D CC E9 C6 60 FD FF 8D 4D CC E9 BE 60 ...M...`...M...`
0042DE20 FD FF 8B 54 24 08 8D 42 0C 8B 8A E4 FE FF FF 33 ...T$..B.......3
0042DE30 C8 E8 CA 96 FF FF 8B 4A FC 33 C8 E8 C0 96 FF FF .......J.3......
0042DE40 B8 E8 4B 43 00 E9 55 F3 FF FF CC CC CC CC CC CC ..KC..U.........
0042DE50 8B 54 24 08 8D 42 0C 8B 4A F0 33 C8 E8 9F 96 FF .T$..B..J.3.....
0042DE60 FF B8 00 4B 43 00 E9 34 F3 FF FF CC CC CC CC CC ...KC..4........
0042DE70 8D 4D D0 E9 88 49 FD FF 8D 8D 1C FF FF FF E9 7D .M...I.........}
0042DE80 49 FD FF 8D 8D 34 FF FF FF E9 72 49 FD FF 8D 8D I....4....rI....
0042DE90 4C FF FF FF E9 67 49 FD FF 8D 4D B0 E9 BF 9D FD L....gI...M.....
0042DEA0 FF 8D 4D 90 E9 F7 42 FD FF 8D 8D 64 FF FF FF E9 ..M...B....d....
0042DEB0 AC 9D FD FF 8D 4D A4 E9 D4 12 FE FF 68 B8 00 00 .....M......h...
0042DEC0 00 8B 85 10 FF FF FF 50 E8 72 97 FF FF 83 C4 08 .......P.r......
0042DED0 C3 8D 8D 78 FF FF FF E9 24 49 FD FF 8D 8D 4C FD ...x....$I....L.
0042DEE0 FF FF E9 B9 4A FD FF 8B 8D CC FE FF FF E9 AE 4A ....J..........J
0042DEF0 FD FF 8D 8D 64 FD FF FF E9 A3 4A FD FF 8D 8D 58 ....d.....J....X
0042DF00 FD FF FF E9 98 4A FD FF 8D 8D BC FE FF FF E9 5D .....J.........]
0042DF10 35 FD FF 8D 8D 78 FF FF FF E9 E2 48 FD FF 8D 8D 5....x.....H....
0042DF20 B4 FE FF FF E9 47 35 FD FF 8D 8D 78 FF FF FF E9 .....G5....x....
0042DF30 CC 48 FD FF 8D 8D C4 FE FF FF E9 31 35 FD FF 8D .H.........15...
0042DF40 8D 78 FF FF FF E9 B6 48 FD FF 8B 85 00 FF FF FF .x.....H........
0042DF50 83 E0 01 0F 84 12 00 00 00 83 A5 00 FF FF FF FE ................
0042DF60 8D 8D E8 FE FF FF E9 95 48 FD FF C3 8B 85 00 FF ........H.......
0042DF70 FF FF 83 E0 02 0F 84 12 00 00 00 83 A5 00 FF FF ................
0042DF80 FF FD 8D 8D 9C FE FF FF E9 73 48 FD FF C3 8D 8D .........sH.....
0042DF90 78 FF FF FF E9 47 5F FD FF 8B 85 00 FF FF FF 83 x....G_.........
0042DFA0 E0 04 0F 84 12 00 00 00 83 A5 00 FF FF FF FB 8D ................
0042DFB0 8D 78 FF FF FF E9 26 5F FD FF C3 68 B8 00 00 00 .x....&_...h....
0042DFC0 8B 85 78 FD FF FF 50 E8 73 96 FF FF 83 C4 08 C3 ..x...P.s.......
0042DFD0 8D 8D 9C FE FF FF E9 25 48 FD FF 8D 8D E8 FE FF .......%H.......
0042DFE0 FF E9 1A 48 FD FF 8D 8D E8 FE FF FF E9 0F 48 FD ...H..........H.
0042DFF0 FF 8B 85 00 FF FF FF 83 E0 08 0F 84 12 00 00 00 ................
0042E000 83 A5 00 FF FF FF F7 8D 8D 8C FE FF FF E9 5E 34 ..............^4
0042E010 FD FF C3 8B 85 00 FF FF FF 83 E0 10 0F 84 12 00 ................
0042E020 00 00 83 A5 00 FF FF FF EF 8D 8D 9C FE FF FF E9 ................
0042E030 CC 47 FD FF C3 8B 85 00 FF FF FF 83 E0 20 0F 84 .G........... ..
0042E040 12 00 00 00 83 A5 00 FF FF FF DF 8D 8D 94 FE FF ................
0042E050 FF E9 1A 34 FD FF C3 8B 85 00 FF FF FF 83 E0 40 ...4...........@
0042E060 0F 84 12 00 00 00 83 A5 00 FF FF FF BF 8D 8D E8 ................
0042E070 FE FF FF E9 88 47 FD FF C3 8D 8D 7C FD FF FF E9 .....G.....|....
0042E080 EC 33 FD FF 8D 8D E8 FE FF FF E9 71 47 FD FF 8D .3.........qG...
0042E090 8D 84 FD FF FF E9 D6 33 FD FF 8D 8D E8 FE FF FF .......3........
0042E0A0 E9 5B 47 FD FF 8D 8D 8C FD FF FF E9 C0 33 FD FF .[G..........3..
0042E0B0 8D 8D E8 FE FF FF E9 45 47 FD FF 8D 8D 94 FD FF .......EG.......
0042E0C0 FF E9 AA 33 FD FF 8D 8D E8 FE FF FF E9 2F 47 FD ...3........./G.
0042E0D0 FF 8B 8D 10 FF FF FF E9 24 47 FD FF 8D 8D 9C FD ........$G......
0042E0E0 FF FF E9 89 33 FD FF 8D 8D E8 FE FF FF E9 0E 47 ....3..........G
0042E0F0 FD FF 8D 8D A4 FD FF FF E9 73 33 FD FF 8D 8D E8 .........s3.....
0042E100 FE FF FF E9 F8 46 FD FF 8D 8D AC FD FF FF E9 5D .....F.........]
0042E110 33 FD FF 8D 8D E8 FE FF FF E9 E2 46 FD FF 8D 8D 3..........F....
0042E120 BC FD FF FF E9 47 33 FD FF 8D 8D E8 FE FF FF E9 .....G3.........
0042E130 CC 46 FD FF 8D 8D E4 FD FF FF E9 31 33 FD FF 8D .F.........13...
0042E140 8D E8 FE FF FF E9 B6 46 FD FF 8D 8D B4 FD FF FF .......F........
0042E150 E9 1B 33 FD FF 8D 8D E8 FE FF FF E9 A0 46 FD FF ..3..........F..
0042E160 8D 8D E8 FE FF FF E9 95 46 FD FF 8D 8D 84 FE FF ........F.......
0042E170 FF E9 FA 32 FD FF 8D 8D E8 FE FF FF E9 7F 46 FD ...2..........F.
0042E180 FF 8D 8D 7C FE FF FF E9 E4 32 FD FF 8D 8D E8 FE ...|.....2......
0042E190 FF FF E9 69 46 FD FF 8D 8D E8 FE FF FF E9 5E 46 ...iF.........^F
0042E1A0 FD FF 8D 8D 74 FE FF FF E9 C3 32 FD FF 8D 8D E8 ....t.....2.....
0042E1B0 FE FF FF E9 48 46 FD FF 8D 8D 6C FE FF FF E9 AD ....HF....l.....
0042E1C0 32 FD FF 8D 8D E8 FE FF FF E9 32 46 FD FF 8D 8D 2.........2F....
0042E1D0 64 FE FF FF E9 97 32 FD FF 8D 8D E8 FE FF FF E9 d.....2.........
0042E1E0 1C 46 FD FF 8D 8D 5C FE FF FF E9 81 32 FD FF 8D .F....\.....2...
0042E1F0 8D E8 FE FF FF E9 06 46 FD FF 8D 8D 54 FE FF FF .......F....T...
0042E200 E9 6B 32 FD FF 8D 8D E8 FE FF FF E9 F0 45 FD FF .k2..........E..
0042E210 8D 8D E8 FE FF FF E9 E5 45 FD FF 8D 8D 4C FE FF ........E....L..
0042E220 FF E9 4A 32 FD FF 8D 8D E8 FE FF FF E9 CF 45 FD ..J2..........E.
0042E230 FF 8D 8D 44 FE FF FF E9 34 32 FD FF 8D 8D E8 FE ...D....42......
0042E240 FF FF E9 B9 45 FD FF 8D 8D 3C FE FF FF E9 1E 32 ....E....<.....2
0042E250 FD FF 8D 8D E8 FE FF FF E9 A3 45 FD FF 8D 8D 34 ..........E....4
0042E260 FE FF FF E9 08 32 FD FF 8D 8D E8 FE FF FF E9 8D .....2..........
0042E270 45 FD FF 8D 8D 2C FE FF FF E9 F2 31 FD FF 8D 8D E....,.....1....
0042E280 E8 FE FF FF E9 77 45 FD FF 8D 8D E8 FE FF FF E9 .....wE.........
0042E290 6C 45 FD FF 8D 8D 24 FE FF FF E9 D1 31 FD FF 8D lE....$.....1...
0042E2A0 8D E8 FE FF FF E9 56 45 FD FF 8D 8D 1C FE FF FF ......VE........
0042E2B0 E9 BB 31 FD FF 8D 8D E8 FE FF FF E9 40 45 FD FF ..1.........@E..
0042E2C0 8B 8D 10 FF FF FF E9 35 45 FD FF 8D 8D 14 FE FF .......5E.......
0042E2D0 FF E9 9A 31 FD FF 8D 8D E8 FE FF FF E9 1F 45 FD ...1..........E.
0042E2E0 FF 8B 8D 10 FF FF FF E9 14 45 FD FF 8D 8D 0C FE .........E......
0042E2F0 FF FF E9 79 31 FD FF 8D 8D E8 FE FF FF E9 FE 44 ...y1..........D
0042E300 FD FF 8B 8D 10 FF FF FF E9 F3 44 FD FF 8D 8D 04 ..........D.....
0042E310 FE FF FF E9 58 31 FD FF 8D 8D E8 FE FF FF E9 DD ....X1..........
0042E320 44 FD FF 8D 8D FC FD FF FF E9 42 31 FD FF 8D 8D D.........B1....
0042E330 E8 FE FF FF E9 C7 44 FD FF 8D 8D F4 FD FF FF E9 ......D.........
0042E340 2C 31 FD FF 8D 8D E8 FE FF FF E9 B1 44 FD FF 8D ,1..........D...
0042E350 8D EC FD FF FF E9 16 31 FD FF 8D 8D E8 FE FF FF .......1........
0042E360 E9 9B 44 FD FF 8D 8D 70 FD FF FF E9 00 31 FD FF ..D....p.....1..
0042E370 8D 8D E8 FE FF FF E9 85 44 FD FF 8D 8D DC FD FF ........D.......
0042E380 FF E9 EA 30 FD FF 8D 8D E8 FE FF FF E9 6F 44 FD ...0.........oD.
0042E390 FF 8D 8D E8 FE FF FF E9 64 44 FD FF 8D 8D E8 FE ........dD......
0042E3A0 FF FF E9 59 44 FD FF 8B 8D 10 FF FF FF E9 4E 44 ...YD.........ND
0042E3B0 FD FF 8B 85 00 FF FF FF 25 80 00 00 00 0F 84 15 ........%.......
0042E3C0 00 00 00 81 A5 00 FF FF FF 7F FF FF FF 8D 8D D4 ................
0042E3D0 FD FF FF E9 98 30 FD FF C3 8B 85 00 FF FF FF 25 .....0.........%
0042E3E0 00 01 00 00 0F 84 15 00 00 00 81 A5 00 FF FF FF ................
0042E3F0 FF FE FF FF 8D 8D E8 FE FF FF E9 01 44 FD FF C3 ............D...
0042E400 8D 8D CC FD FF FF E9 65 30 FD FF 8D 8D E8 FE FF .......e0.......
0042E410 FF E9 EA 43 FD FF 8D 8D C4 FD FF FF E9 4F 30 FD ...C.........O0.
0042E420 FF 8D 8D E8 FE FF FF E9 D4 43 FD FF 8D 8D E8 FE .........C......
0042E430 FF FF E9 C9 43 FD FF 8B 54 24 08 8D 42 0C 8B 8A ....C...T$..B...
0042E440 4C FD FF FF 33 C8 E8 B5 90 FF FF 8B 4A FC 33 C8 L...3.......J.3.
0042E450 E8 AB 90 FF FF B8 A0 4C 43 00 E9 40 ED FF FF CC .......LC..@....
0042E460 8D 8D 78 FF FF FF E9 05 30 FD FF 8B 54 24 08 8D ..x.....0...T$..
0042E470 42 0C 8B 8A 78 FF FF FF 33 C8 E8 81 90 FF FF 8B B...x...3.......
0042E480 4A FC 33 C8 E8 77 90 FF FF B8 D0 50 43 00 E9 0C J.3..w.....PC...
0042E490 ED FF FF CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0042E4A0 8D 4D 08 E9 58 43 FD FF 8D 4D CC E9 A0 42 FD FF .M..XC...M...B..
0042E4B0 8D 4D BC E9 D8 08 FE FF 8D 8D 64 FF FF FF E9 3D .M........d....=
0042E4C0 43 FD FF 8D 4D B4 E9 A5 2F FD FF 8D 4D B4 E9 9D C...M.../...M...
0042E4D0 2F FD FF 8B 54 24 08 8D 42 0C 8B 8A 64 FF FF FF /...T$..B...d...
0042E4E0 33 C8 E8 19 90 FF FF 8B 4A FC 33 C8 E8 0F 90 FF 3.......J.3.....
0042E4F0 FF B8 10 51 43 00 E9 A4 EC FF FF CC CC CC CC CC ...QC...........
0042E500 8D 4D 08 E9 F8 42 FD FF 8B 4D D4 E9 F0 42 FD FF .M...B...M...B..
0042E510 8B 4D D4 83 C1 18 E9 35 42 FD FF 8B 4D D4 83 C1 .M.....5B...M...
0042E520 24 E9 DA 42 FD FF 8B 54 24 08 8D 42 0C 8B 4A CC $..B...T$..B..J.
0042E530 33 C8 E8 C9 8F FF FF 8B 4A FC 33 C8 E8 BF 8F FF 3.......J.3.....
0042E540 FF B8 88 51 43 00 E9 54 EC FF FF CC CC CC CC CC ...QC..T........
0042E550 8D 4D D4 E9 F8 41 FD FF 8D 4D E0 E9 F0 41 FD FF .M...A...M...A..
0042E560 8D 4D BC E9 98 42 FD FF 8D 4D A4 E9 90 42 FD FF .M...B...M...B..
0042E570 8D 4D 80 E9 F8 2E FD FF 8D 8D 74 FF FF FF E9 ED .M........t.....
0042E580 2E FD FF 68 B0 00 00 00 8B 45 88 50 E8 AE 90 FF ...h.....E.P....
0042E590 FF 83 C4 08 C3 8B 45 9C 83 E0 02 0F 84 10 00 00 ......E.........
0042E5A0 00 83 65 9C FD 8B 4D 88 83 C1 68 FF 25 A8 10 43 ..e...M...h.%..C
0042E5B0 00 C3 8B 4D 88 83 C1 20 FF 25 F4 10 43 00 8B 54 ...M... .%..C..T
0042E5C0 24 08 8D 42 0C 8B 8A 5C FF FF FF 33 C8 E8 2E 8F $..B...\...3....
0042E5D0 FF FF 8B 4A FC 33 C8 E8 24 8F FF FF B8 D0 51 43 ...J.3..$.....QC
0042E5E0 00 E9 B9 EB FF FF CC CC CC CC CC CC CC CC CC CC ................
0042E5F0 8D 4D 08 E9 08 42 FD FF 8D 4D E8 E9 70 2E FD FF .M...B...M..p...
0042E600 8D 4D E0 E9 68 2E FD FF 8B 54 24 08 8D 42 0C 8B .M..h....T$..B..
0042E610 4A DC 33 C8 E8 E7 8E FF FF B8 60 52 43 00 E9 7C J.3.......`RC..|
0042E620 EB FF FF CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0042E630 8D 4D A8 E9 C8 41 FD FF 8D 4D 90 E9 C0 41 FD FF .M...A...M...A..
0042E640 8D 4D A8 E9 B8 41 FD FF 8D 4D A8 E9 B0 41 FD FF .M...A...M...A..
0042E650 8D 4D A8 E9 A8 41 FD FF 8D 4D A8 E9 A0 41 FD FF .M...A...M...A..
0042E660 8D 4D A8 E9 98 41 FD FF 8B 54 24 08 8D 42 0C 8B .M...A...T$..B..
0042E670 4A 8C 33 C8 E8 87 8E FF FF 8B 4A FC 33 C8 E8 7D J.3.......J.3..}
0042E680 8E FF FF B8 BC 52 43 00 E9 12 EB FF FF CC CC CC .....RC.........
0042E690 8D 4D DC E9 C8 95 FD FF 8D 4D 8C E9 60 41 FD FF .M.......M..`A..
0042E6A0 8D 4D 8C E9 58 41 FD FF 8D 4D 8C E9 50 41 FD FF .M..XA...M..PA..
0042E6B0 8D 4D 8C E9 48 41 FD FF 8D 4D 8C E9 40 41 FD FF .M..HA...M..@A..
0042E6C0 8D 4D 8C E9 38 41 FD FF 8D 4D 8C E9 30 41 FD FF .M..8A...M..0A..
0042E6D0 8D 4D 8C E9 28 41 FD FF 8B 54 24 08 8D 42 0C 8B .M..(A...T$..B..
0042E6E0 4A 88 33 C8 E8 17 8E FF FF 8B 4A FC 33 C8 E8 0D J.3.......J.3...
0042E6F0 8E FF FF B8 18 53 43 00 E9 A2 EA FF FF CC CC CC .....SC.........
0042E700 8D 4D DC E9 F8 40 FD FF 8B 54 24 08 8D 42 0C 8B .M...@...T$..B..
0042E710 4A D4 33 C8 E8 E7 8D FF FF B8 88 53 43 00 E9 7C J.3........SC..|
0042E720 EA FF FF CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0042E730 8D 4D 10 E9 C8 40 FD FF 8D 4D C8 E9 30 2D FD FF .M...@...M..0-..
0042E740 8D 4D D0 E9 B8 40 FD FF 8B 54 24 08 8D 42 0C 8B .M...@...T$..B..
0042E750 4A C4 33 C8 E8 A7 8D FF FF B8 B4 53 43 00 E9 3C J.3........SC..<
0042E760 EA FF FF CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0042E770 8D 4D 0C E9 88 40 FD FF 8D 4D D4 E9 F0 2C FD FF .M...@...M...,..
0042E780 8D 4D DC E9 78 40 FD FF 8B 54 24 08 8D 42 0C 8B .M..x@...T$..B..
0042E790 4A D0 33 C8 E8 67 8D FF FF B8 00 54 43 00 E9 FC J.3..g.....TC...
0042E7A0 E9 FF FF CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0042E7B0 8D 4D 10 E9 48 40 FD FF 8D 4D D8 E9 40 40 FD FF .M..H@...M..@@..
0042E7C0 8B 54 24 08 8D 42 0C 8B 4A D4 33 C8 E8 2F 8D FF .T$..B..J.3../..
0042E7D0 FF 8B 4A FC 33 C8 E8 25 8D FF FF B8 4C 54 43 00 ..J.3..%....LTC.
0042E7E0 E9 BA E9 FF FF CC CC CC CC CC CC CC CC CC CC CC ................
0042E7F0 8B 45 F0 83 E0 01 0F 84 10 00 00 00 83 65 F0 FE .E...........e..
0042E800 8B 4D EC 83 C1 68 FF 25 A8 10 43 00 C3 8B 4D EC .M...h.%..C...M.
0042E810 83 C1 08 FF 25 E4 10 43 00 8B 4D E8 FF 25 AC 10 ....%..C..M..%..
0042E820 43 00 8B 54 24 08 8D 42 0C 8B 4A E8 33 C8 E8 CD C..T$..B..J.3...
0042E830 8C FF FF B8 80 54 43 00 E9 62 E9 FF FF CC CC CC .....TC..b......
0042E840 8B 45 F0 83 E0 01 0F 84 10 00 00 00 83 65 F0 FE .E...........e..
0042E850 8B 4D EC 83 C1 70 FF 25 A8 10 43 00 C3 8B 4D EC .M...p.%..C...M.
0042E860 83 C1 18 FF 25 D4 10 43 00 8B 4D E8 FF 25 AC 10 ....%..C..M..%..
0042E870 43 00 8B 54 24 08 8D 42 0C 8B 4A E8 33 C8 E8 7D C..T$..B..J.3..}
0042E880 8C FF FF B8 BC 54 43 00 E9 12 E9 FF FF CC CC CC .....TC.........
0042E890 8D 4D D4 E9 68 3F FD FF 8B 54 24 08 8D 42 0C 8B .M..h?...T$..B..
0042E8A0 4A C0 33 C8 E8 57 8C FF FF 8B 4A FC 33 C8 E8 4D J.3..W....J.3..M
0042E8B0 8C FF FF B8 F8 54 43 00 E9 E2 E8 FF FF CC CC CC .....TC.........
0042E8C0 8B 54 24 08 8D 42 0C 8B 4A F4 33 C8 E8 2F 8C FF .T$..B..J.3../..
0042E8D0 FF B8 00 4B 43 00 E9 C4 E8 FF FF CC CC CC CC CC ...KC...........
0042E8E0 8D 4D E0 E9 88 2B FD FF 8B 54 24 08 8D 42 0C 8B .M...+...T$..B..
0042E8F0 4A E0 33 C8 E8 07 8C FF FF 8B 4A FC 33 C8 E8 FD J.3.......J.3...
0042E900 8B FF FF B8 24 55 43 00 E9 92 E8 FF FF CC CC CC ....$UC.........
0042E910 8D 4D CC E9 E8 4F FE FF 8B 54 24 08 8D 42 0C 8B .M...O...T$..B..
0042E920 4A A0 33 C8 E8 D7 8B FF FF B8 58 55 43 00 E9 6C J.3.......XUC..l
0042E930 E8 FF FF CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0042E940 8D 4D D8 E9 28 4F FD FF 8D 4D D8 E9 80 4E FD FF .M..(O...M...N..
0042E950 8B 54 24 08 8D 42 0C 8B 4A CC 33 C8 E8 9F 8B FF .T$..B..J.3.....
0042E960 FF B8 84 55 43 00 E9 34 E8 FF FF CC CC CC CC CC ...UC..4........
0042E970 8D 4D D8 E9 88 3E FD FF 8D 4D DC E9 80 2A FD FF .M...>...M...*..
0042E980 8B 54 24 08 8D 42 0C 8B 4A D4 33 C8 E8 6F 8B FF .T$..B..J.3..o..
0042E990 FF B8 FC 55 43 00 E9 04 E8 FF FF CC CC CC CC CC ...UC...........
0042E9A0 8B 4D D8 E9 58 3E FD FF 8B 4D D8 83 C1 18 E9 9D .M..X>...M......
0042E9B0 3D FD FF 8B 4D D8 83 C1 24 E9 42 3E FD FF 8D 4D =...M...$.B>...M
0042E9C0 E0 E9 3A 7B FE FF 8B 4D C4 E9 32 3E FD FF 8B 4D ..:{...M..2>...M
0042E9D0 C4 83 C1 18 E9 77 3D FD FF 8B 54 24 08 8D 42 0C .....w=...T$..B.
0042E9E0 8B 4A B8 33 C8 E8 16 8B FF FF 8B 4A F8 33 C8 E8 .J.3.......J.3..
0042E9F0 0C 8B FF FF B8 30 56 43 00 E9 A1 E7 FF FF CC CC .....0VC........
0042EA00 8B 54 24 08 8D 42 0C 8B 4A F8 33 C8 E8 EF 8A FF .T$..B..J.3.....
0042EA10 FF B8 B8 56 43 00 E9 84 E7 FF FF CC CC CC CC CC ...VC...........
0042EA20 8B 45 F0 83 E0 01 0F 84 0F 00 00 00 83 65 F0 FE .E...........e..
0042EA30 8B 4D EC 83 C1 30 E9 D5 52 FD FF C3 8B 54 24 08 .M...0..R....T$.
0042EA40 8D 42 0C 8B 4A F0 33 C8 E8 B3 8A FF FF B8 E4 56 .B..J.3........V
0042EA50 43 00 E9 48 E7 FF FF CC CC CC CC CC CC CC CC CC C..H............
0042EA60 8B 4D F0 E9 98 29 FD FF 8B 54 24 08 8D 42 0C 8B .M...)...T$..B..
0042EA70 4A EC 33 C8 E8 87 8A FF FF B8 10 57 43 00 E9 1C J.3........WC...
0042EA80 E7 FF FF CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0042EA90 6A 34 8B 45 EC 50 E8 A4 8B FF FF 83 C4 08 C3 8B j4.E.P..........
0042EAA0 45 F0 83 E0 01 0F 84 0F 00 00 00 83 65 F0 FE 8B E...........e...
0042EAB0 4D EC 83 C1 30 E9 56 52 FD FF C3 8B 4D EC E9 3D M...0.VR....M..=
0042EAC0 4E FE FF 8B 54 24 08 8D 42 0C 8B 4A E8 33 C8 E8 N...T$..B..J.3..
0042EAD0 2C 8A FF FF B8 3C 57 43 00 E9 C1 E6 FF FF CC CC ,....<WC........
0042EAE0 8D 4D E4 E9 18 7A FE FF 8B 4D E0 E9 10 3D FD FF .M...z...M...=..
0042EAF0 8B 4D E0 83 C1 18 E9 55 3C FD FF 8B 54 24 08 8D .M.....U<...T$..
0042EB00 42 0C 8B 4A DC 33 C8 E8 F4 89 FF FF 8B 4A FC 33 B..J.3.......J.3
0042EB10 C8 E8 EA 89 FF FF B8 78 57 43 00 E9 7F E6 FF FF .......xWC......
0042EB20 8D 4D B8 E9 48 29 FD FF 8D 8D 40 FF FF FF E9 7D .M..H)....@....}
0042EB30 5D FE FF 8D 8D 2C FF FF FF E9 C2 28 FD FF 8B 54 ]....,.....(...T
0042EB40 24 08 8D 42 0C 8B 8A 28 FF FF FF 33 C8 E8 AE 89 $..B...(...3....
0042EB50 FF FF 8B 4A FC 33 C8 E8 A4 89 FF FF B8 B4 57 43 ...J.3........WC
0042EB60 00 E9 39 E6 FF FF CC CC CC CC CC CC CC CC CC CC ..9.............
0042EB70 8D 4D D8 E9 88 3C FD FF 8D 4D A0 E9 80 28 FD FF .M...<...M...(..
0042EB80 8B 54 24 08 8D 42 0C 8B 4A A0 33 C8 E8 6F 89 FF .T$..B..J.3..o..
0042EB90 FF 8B 4A FC 33 C8 E8 65 89 FF FF B8 F8 57 43 00 ..J.3..e.....WC.
0042EBA0 E9 FA E5 FF FF CC CC CC CC CC CC CC CC CC CC CC ................
0042EBB0 8B 45 F0 83 E0 02 0F 84 0F 00 00 00 83 65 F0 FD .E...........e..
0042EBC0 8B 4D EC 83 C1 30 E9 45 51 FD FF C3 8B 4D EC E9 .M...0.EQ....M..
0042EBD0 2C 4D FE FF 8B 54 24 08 8D 42 0C 8B 4A EC 33 C8 ,M...T$..B..J.3.
0042EBE0 E8 1B 89 FF FF B8 2C 58 43 00 E9 B0 E5 FF FF CC ......,XC.......
0042EBF0 8D 4D CC E9 C8 61 FE FF 8B 54 24 08 8D 42 0C 8B .M...a...T$..B..
0042EC00 4A A0 33 C8 E8 F7 88 FF FF B8 60 58 43 00 E9 8C J.3.......`XC...
0042EC10 E5 FF FF CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0042EC20 6A 34 8B 45 EC 50 E8 14 8A FF FF 83 C4 08 C3 8B j4.E.P..........
0042EC30 45 F0 83 E0 01 0F 84 0F 00 00 00 83 65 F0 FE 8B E...........e...
0042EC40 4D EC 83 C1 30 E9 C6 50 FD FF C3 8B 4D EC E9 6D M...0..P....M..m
0042EC50 61 FE FF 8B 54 24 08 8D 42 0C 8B 4A E8 33 C8 E8 a...T$..B..J.3..
0042EC60 9C 88 FF FF B8 8C 58 43 00 E9 31 E5 FF FF CC CC ......XC..1.....
0042EC70 8D 4D E4 E9 08 89 FE FF 8B 4D E0 83 C1 04 E9 7D .M.......M.....}
0042EC80 3B FD FF 8B 54 24 08 8D 42 0C 8B 4A DC 33 C8 E8 ;...T$..B..J.3..
0042EC90 6C 88 FF FF 8B 4A FC 33 C8 E8 62 88 FF FF B8 C8 l....J.3..b.....
0042ECA0 58 43 00 E9 F7 E4 FF FF CC CC CC CC CC CC CC CC XC..............
0042ECB0 8B 54 24 08 8D 42 0C 8B 4A EC 33 C8 E8 3F 88 FF .T$..B..J.3..?..
0042ECC0 FF B8 04 59 43 00 E9 D4 E4 FF FF CC CC CC CC CC ...YC...........
0042ECD0 8D 4D EC E9 98 27 FD FF 8D 8D 74 FF FF FF E9 CD .M...'....t.....
0042ECE0 5B FE FF 8D 8D 74 FF FF FF E9 C2 5B FE FF 8B 54 [....t.....[...T
0042ECF0 24 08 8D 42 0C 8B 8A 70 FF FF FF 33 C8 E8 FE 87 $..B...p...3....
0042ED00 FF FF B8 50 59 43 00 E9 93 E4 FF FF CC CC CC CC ...PYC..........
0042ED10 8D 4D D0 E9 E8 26 FD FF 8B 54 24 08 8D 42 0C 8B .M...&...T$..B..
0042ED20 4A CC 33 C8 E8 D7 87 FF FF 8B 4A FC 33 C8 E8 CD J.3.......J.3...
0042ED30 87 FF FF B8 94 59 43 00 E9 62 E4 FF FF CC CC CC .....YC..b......
0042ED40 8D 4D BC E9 B8 26 FD FF 8D 4D BC E9 B0 26 FD FF .M...&...M...&..
0042ED50 8D 4D BC E9 A8 26 FD FF 8D 4D BC E9 A0 26 FD FF .M...&...M...&..
0042ED60 8D 4D BC E9 98 26 FD FF 8D 4D BC E9 90 26 FD FF .M...&...M...&..
0042ED70 8D 4D BC E9 88 26 FD FF 8D 4D BC E9 80 26 FD FF .M...&...M...&..
0042ED80 8D 4D BC E9 78 26 FD FF 8D 4D BC E9 70 26 FD FF .M..x&...M..p&..
0042ED90 8B 54 24 08 8D 42 0C 8B 4A B8 33 C8 E8 5F 87 FF .T$..B..J.3.._..
0042EDA0 FF B8 C0 59 43 00 E9 F4 E3 FF FF CC CC CC CC CC ...YC...........
0042EDB0 8D 4D D4 E9 48 26 FD FF 8B 54 24 08 8D 42 0C 8B .M..H&...T$..B..
0042EDC0 4A D0 33 C8 E8 37 87 FF FF B8 38 5A 43 00 E9 CC J.3..7....8ZC...
0042EDD0 E3 FF FF CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0042EDE0 8B 45 F0 83 E0 02 0F 84 0F 00 00 00 83 65 F0 FD .E...........e..
0042EDF0 8B 4D EC 83 C1 30 E9 15 4F FD FF C3 8B 4D EC E9 .M...0..O....M..
0042EE00 BC 5F FE FF 8B 54 24 08 8D 42 0C 8B 4A EC 33 C8 ._...T$..B..J.3.
0042EE10 E8 EB 86 FF FF B8 64 5A 43 00 E9 80 E3 FF FF CC ......dZC.......
0042EE20 8B 54 24 08 8D 42 0C 8B 4A D0 33 C8 E8 CF 86 FF .T$..B..J.3.....
0042EE30 FF B8 98 5A 43 00 E9 64 E3 FF FF CC CC CC CC CC ...ZC..d........
0042EE40 8D 4D D8 E9 18 8E FD FF 8B 54 24 08 8D 42 0C 8B .M.......T$..B..
0042EE50 4A A8 33 C8 E8 A7 86 FF FF 8B 4A F8 33 C8 E8 9D J.3.......J.3...
0042EE60 86 FF FF B8 F8 5A 43 00 E9 32 E3 FF FF CC CC CC .....ZC..2......
0042EE70 8D 4D CC E9 88 98 FE FF 8B 54 24 08 8D 42 0C 8B .M.......T$..B..
0042EE80 4A 9C 33 C8 E8 77 86 FF FF B8 24 5B 43 00 E9 0C J.3..w....$[C...
0042EE90 E3 FF FF CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0042EEA0 8B 85 24 FF FF FF 83 E0 01 0F 84 10 00 00 00 83 ..$.............
0042EEB0 A5 24 FF FF FF FE 8D 4D A4 FF 25 A8 10 43 00 C3 .$.....M..%..C..
0042EEC0 8D 4D 8C E9 C8 96 FE FF 8D 4D 8C E9 30 94 FE FF .M.......M..0...
0042EED0 8B 85 24 FF FF FF 83 E0 02 0F 84 13 00 00 00 83 ..$.............
0042EEE0 A5 24 FF FF FF FD 8D 8D 44 FF FF FF FF 25 A8 10 .$......D....%..
0042EEF0 43 00 C3 8D 8D 2C FF FF FF E9 92 96 FE FF 8D 8D C....,..........
0042EF00 2C FF FF FF E9 F7 93 FE FF 8B 54 24 08 8D 42 0C ,.........T$..B.
0042EF10 8B 8A F8 FE FF FF 33 C8 E8 E3 85 FF FF 8B 4A F8 ......3.......J.
0042EF20 33 C8 E8 D9 85 FF FF B8 50 5B 43 00 E9 6E E2 FF 3.......P[C..n..
0042EF30 FF CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0042EF40 8D 4D D4 E9 B8 38 FD FF 8B 54 24 08 8D 42 0C 8B .M...8...T$..B..
0042EF50 4A C0 33 C8 E8 A7 85 FF FF 8B 4A F8 33 C8 E8 9D J.3.......J.3...
0042EF60 85 FF FF B8 C0 5B 43 00 E9 32 E2 FF FF CC CC CC .....[C..2......
0042EF70 8B 54 24 08 8D 42 0C 8B 4A F4 33 C8 E8 7F 85 FF .T$..B..J.3.....
0042EF80 FF B8 EC 5B 43 00 E9 14 E2 FF FF CC CC CC CC CC ...[C...........
0042EF90 6A 34 8B 45 EC 50 E8 A4 86 FF FF 83 C4 08 C3 8B j4.E.P..........
0042EFA0 45 F0 83 E0 01 0F 84 0F 00 00 00 83 65 F0 FE 8B E...........e...
0042EFB0 4D EC 83 C1 30 E9 56 4D FD FF C3 8B 4D EC E9 3D M...0.VM....M..=
0042EFC0 97 FE FF 8B 54 24 08 8D 42 0C 8B 4A E8 33 C8 E8 ....T$..B..J.3..
0042EFD0 2C 85 FF FF B8 28 5C 43 00 E9 C1 E1 FF FF CC CC ,....(\C........
0042EFE0 8D 4D E0 E9 18 4C FD FF 8B 54 24 08 8D 42 0C 8B .M...L...T$..B..
0042EFF0 4A D4 33 C8 E8 07 85 FF FF 8B 4A F8 33 C8 E8 FD J.3.......J.3...
0042F000 84 FF FF B8 64 5C 43 00 E9 92 E1 FF FF CC CC CC ....d\C.........
0042F010 8B 54 24 08 8D 42 0C 8B 4A E4 33 C8 E8 DF 84 FF .T$..B..J.3.....
0042F020 FF B8 C4 5C 43 00 E9 74 E1 FF FF CC CC CC CC CC ...\C..t........
0042F030 8B 45 F0 83 E0 02 0F 84 0F 00 00 00 83 65 F0 FD .E...........e..
0042F040 8B 4D EC 83 C1 30 E9 C5 4C FD FF C3 8B 4D EC E9 .M...0..L....M..
0042F050 AC 96 FE FF 8B 54 24 08 8D 42 0C 8B 4A EC 33 C8 .....T$..B..J.3.
0042F060 E8 9B 84 FF FF B8 F8 5C 43 00 E9 30 E1 FF FF CC .......\C..0....
0042F070 8B 54 24 08 8D 42 0C 8B 4A CC 33 C8 E8 7F 84 FF .T$..B..J.3.....
0042F080 FF B8 2C 5D 43 00 E9 14 E1 FF FF CC CC CC CC CC ..,]C...........
0042F090 8B 54 24 08 8D 42 0C 8B 4A CC 33 C8 E8 5F 84 FF .T$..B..J.3.._..
0042F0A0 FF B8 B8 5D 43 00 E9 F4 E0 FF FF CC CC CC CC CC ...]C...........
0042F0B0 8B 54 24 08 8D 42 0C 8B 4A E8 33 C8 E8 3F 84 FF .T$..B..J.3..?..
0042F0C0 FF B8 44 5E 43 00 E9 D4 E0 FF FF CC CC CC CC CC ..D^C...........
0042F0D0 8B 54 24 08 8D 42 0C 8B 4A E0 33 C8 E8 1F 84 FF .T$..B..J.3.....
0042F0E0 FF B8 9C 5E 43 00 E9 B4 E0 FF FF CC CC CC CC CC ...^C...........
0042F0F0 8D 8D 98 FD FF FF E9 55 5D FD FF 8D 8D 50 FE FF .......U]....P..
0042F100 FF E9 FA 5D FD FF 8D 8D 00 FF FF FF E9 EF 36 FD ...]..........6.
0042F110 FF 8D 8D 18 FF FF FF E9 E4 36 FD FF 8D 8D 30 FF .........6....0.
0042F120 FF FF E9 E9 44 FD FF 8D 8D 98 FD FF FF E9 0E AC ....D...........
0042F130 FE FF 8B 54 24 08 8D 42 0C 8B 8A 90 FD FF FF 33 ...T$..B.......3
0042F140 C8 E8 BA 83 FF FF 8B 4A FC 33 C8 E8 B0 83 FF FF .......J.3......
0042F150 B8 F4 5E 43 00 E9 45 E0 FF FF CC CC CC CC CC CC ..^C..E.........
0042F160 8B 4D F0 E9 98 36 FD FF 8B 4D F0 83 C1 18 E9 8D .M...6...M......
0042F170 36 FD FF 8B 4D F0 83 C1 30 E9 82 36 FD FF 68 00 6...M...0..6..h.
0042F180 28 40 00 6A 04 6A 18 8B 45 F0 50 E8 B1 83 FF FF (@.j.j..E.P.....
0042F190 C3 8B 4D F0 83 C1 70 E9 64 36 FD FF 8B 54 24 08 ..M...p.d6...T$.
0042F1A0 8D 42 0C 8B 4A F0 33 C8 E8 53 83 FF FF B8 48 5F .B..J.3..S....H_
0042F1B0 43 00 E9 E8 DF FF FF CC CC CC CC CC CC CC CC CC C...............
0042F1C0 8D 4D 08 E9 38 36 FD FF 8B 4D E8 E9 30 36 FD FF .M..86...M..06..
0042F1D0 8B 4D E8 83 C1 18 E9 25 36 FD FF 8B 4D E8 83 C1 .M.....%6...M...
0042F1E0 30 E9 1A 36 FD FF 68 00 28 40 00 6A 04 6A 18 8B 0..6..h.(@.j.j..
0042F1F0 45 E8 50 E8 49 83 FF FF C3 8B 4D E8 83 C1 70 E9 E.P.I.....M...p.
0042F200 FC 35 FD FF 8D 4D D0 E9 F4 35 FD FF 8B 54 24 08 .5...M...5...T$.
0042F210 8D 42 0C 8B 4A CC 33 C8 E8 E3 82 FF FF 8B 4A FC .B..J.3.......J.
0042F220 33 C8 E8 D9 82 FF FF B8 94 5F 43 00 E9 6E DF FF 3........_C..n..
0042F230 FF CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0042F240 8D 4D 0C E9 B8 35 FD FF 8B 85 24 FF FF FF 83 E0 .M...5....$.....
0042F250 01 0F 84 10 00 00 00 83 A5 24 FF FF FF FE 8D 4D .........$.....M
0042F260 8C FF 25 A8 10 43 00 C3 8D 8D 44 FF FF FF FF 25 ..%..C....D....%
0042F270 D4 10 43 00 8B 8D 18 FF FF FF FF 25 AC 10 43 00 ..C........%..C.
0042F280 8D 8D 2C FF FF FF E9 85 B4 FE FF 8D 4D D8 E9 6D ..,.........M..m
0042F290 35 FD FF 8B 54 24 08 8D 42 0C 8B 8A 14 FF FF FF 5...T$..B.......
0042F2A0 33 C8 E8 59 82 FF FF 8B 4A FC 33 C8 E8 4F 82 FF 3..Y....J.3..O..
0042F2B0 FF B8 F0 5F 43 00 E9 E4 DE FF FF CC CC CC CC CC ..._C...........
0042F2C0 8D 4D CC E9 88 34 FD FF 8D 4D D8 E9 30 35 FD FF .M...4...M..05..
0042F2D0 8D 4D 8C E9 98 21 FD FF 8D 4D C0 E9 90 21 FD FF .M...!...M...!..
0042F2E0 8B 54 24 08 8D 42 0C 8B 4A 8C 33 C8 E8 0F 82 FF .T$..B..J.3.....
0042F2F0 FF 8B 4A FC 33 C8 E8 05 82 FF FF B8 48 60 43 00 ..J.3.......H`C.
0042F300 E9 9A DE FF FF CC CC CC CC CC CC CC CC CC CC CC ................
0042F310 8D 4D 08 E9 E8 34 FD FF 8D 4D E4 E9 30 34 FD FF .M...4...M..04..
0042F320 8D 4D DC E9 48 21 FD FF 8D 4D C4 E9 D0 34 FD FF .M..H!...M...4..
0042F330 8D 4D DC E9 38 21 FD FF 8D 4D C4 E9 C0 34 FD FF .M..8!...M...4..
0042F340 8D 4D DC E9 28 21 FD FF 8D 4D C4 E9 B0 34 FD FF .M..(!...M...4..
0042F350 8D 4D DC E9 18 21 FD FF 8D 4D C4 E9 A0 34 FD FF .M...!...M...4..
0042F360 8D 4D DC E9 08 21 FD FF 8D 4D C4 E9 90 34 FD FF .M...!...M...4..
0042F370 8D 4D DC E9 F8 20 FD FF 8D 4D C4 E9 80 34 FD FF .M... ...M...4..
0042F380 8D 4D DC E9 E8 20 FD FF 8D 4D C4 E9 70 34 FD FF .M... ...M..p4..
0042F390 8D 4D DC E9 D8 20 FD FF 8D 4D C4 E9 60 34 FD FF .M... ...M..`4..
0042F3A0 8D 4D DC E9 C8 20 FD FF 8D 4D C4 E9 50 34 FD FF .M... ...M..P4..
0042F3B0 8D 4D DC E9 B8 20 FD FF 8D 4D C4 E9 40 34 FD FF .M... ...M..@4..
0042F3C0 8D 4D DC E9 A8 20 FD FF 8D 4D C4 E9 30 34 FD FF .M... ...M..04..
0042F3D0 8D 4D DC E9 98 20 FD FF 8D 4D C4 E9 20 34 FD FF .M... ...M.. 4..
0042F3E0 8D 4D DC E9 88 20 FD FF 8D 4D C4 E9 10 34 FD FF .M... ...M...4..
0042F3F0 8D 4D DC E9 78 20 FD FF 8D 4D C4 E9 00 34 FD FF .M..x ...M...4..
0042F400 8D 4D DC E9 68 20 FD FF 8D 4D C4 E9 F0 33 FD FF .M..h ...M...3..
0042F410 8D 4D DC E9 58 20 FD FF 8D 4D C4 E9 E0 33 FD FF .M..X ...M...3..
0042F420 8D 4D DC E9 48 20 FD FF 8D 4D C4 E9 D0 33 FD FF .M..H ...M...3..
0042F430 8D 4D DC E9 38 20 FD FF 8D 4D C4 E9 C0 33 FD FF .M..8 ...M...3..
0042F440 8D 4D DC E9 28 20 FD FF 8D 4D C4 E9 B0 33 FD FF .M..( ...M...3..
0042F450 8D 4D DC E9 18 20 FD FF 8D 4D C4 E9 A0 33 FD FF .M... ...M...3..
0042F460 8D 4D DC E9 08 20 FD FF 8D 4D C4 E9 90 33 FD FF .M... ...M...3..
0042F470 8B 54 24 08 8D 42 0C 8B 4A C0 33 C8 E8 7F 80 FF .T$..B..J.3.....
0042F480 FF 8B 4A FC 33 C8 E8 75 80 FF FF B8 B0 60 43 00 ..J.3..u.....`C.
0042F490 E9 0A DD FF FF CC CC CC CC CC CC CC CC CC CC CC ................
0042F4A0 8D 4D 20 E9 58 33 FD FF 8D 4D 08 E9 50 33 FD FF .M .X3...M..P3..
0042F4B0 8D 4D D0 E9 B8 1F FD FF 8D 4D D8 E9 40 33 FD FF .M.......M..@3..
0042F4C0 8B 54 24 08 8D 42 0C 8B 4A CC 33 C8 E8 2F 80 FF .T$..B..J.3../..
0042F4D0 FF B8 E0 62 43 00 E9 C4 DC FF FF CC CC CC CC CC ...bC...........
0042F4E0 8B 4D EC E9 18 33 FD FF 8B 4D E4 E9 10 33 FD FF .M...3...M...3..
0042F4F0 8B 4D E4 E9 08 33 FD FF 8B 54 24 08 8D 42 0C 8B .M...3...T$..B..
0042F500 4A E0 33 C8 E8 F7 7F FF FF 8B 4A FC 33 C8 E8 ED J.3.......J.3...
0042F510 7F FF FF B8 34 63 43 00 E9 82 DC FF FF CC CC CC ....4cC.........
0042F520 8D 4D D4 E9 D8 32 FD FF 8B 54 24 08 8D 42 0C 8B .M...2...T$..B..
0042F530 4A D0 33 C8 E8 C7 7F FF FF 8B 4A FC 33 C8 E8 BD J.3.......J.3...
0042F540 7F FF FF B8 70 63 43 00 E9 52 DC FF FF CC CC CC ....pcC..R......
0042F550 8B 4D F0 E9 A8 32 FD FF 8B 4D 08 E9 A0 32 FD FF .M...2...M...2..
0042F560 8B 4D 08 E9 98 32 FD FF 8B 4D 08 E9 90 32 FD FF .M...2...M...2..
0042F570 8B 54 24 08 8D 42 0C 8B 4A EC 33 C8 E8 7F 7F FF .T$..B..J.3.....
0042F580 FF B8 9C 63 43 00 E9 14 DC FF FF CC CC CC CC CC ...cC...........
0042F590 8B 4D E8 E9 68 32 FD FF 8B 4D E8 E9 60 32 FD FF .M..h2...M..`2..
0042F5A0 8B 4D E8 E9 58 32 FD FF 8B 4D E8 E9 50 32 FD FF .M..X2...M..P2..
0042F5B0 8B 4D E8 E9 48 32 FD FF 8B 4D E8 E9 40 32 FD FF .M..H2...M..@2..
0042F5C0 8B 4D E8 E9 38 32 FD FF 8B 4D E8 E9 30 32 FD FF .M..82...M..02..
0042F5D0 8B 4D E8 E9 28 32 FD FF 8B 4D E8 E9 20 32 FD FF .M..(2...M.. 2..
0042F5E0 8B 4D E8 E9 18 32 FD FF 8B 4D E8 E9 10 32 FD FF .M...2...M...2..
0042F5F0 8B 4D E8 E9 08 32 FD FF 8B 45 E4 83 E0 01 0F 84 .M...2...E......
0042F600 0C 00 00 00 83 65 E4 FE 8D 4D D8 E9 60 1E FD FF .....e...M..`...
0042F610 C3 8B 45 E4 83 E0 02 0F 84 0C 00 00 00 83 65 E4 ..E...........e.
0042F620 FD 8D 4D A8 E9 D7 31 FD FF C3 8B 45 E4 83 E0 04 ..M...1....E....
0042F630 0F 84 0C 00 00 00 83 65 E4 FB 8D 4D A0 E9 2E 1E .......e...M....
0042F640 FD FF C3 8B 45 E4 83 E0 08 0F 84 0C 00 00 00 83 ....E...........
0042F650 65 E4 F7 8D 4D C0 E9 A5 31 FD FF C3 8B 54 24 08 e...M...1....T$.
0042F660 8D 42 0C 8B 4A 9C 33 C8 E8 93 7E FF FF 8B 4A FC .B..J.3...~...J.
0042F670 33 C8 E8 89 7E FF FF B8 E0 63 43 00 E9 1E DB FF 3...~....cC.....
0042F680 FF CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0042F690 8B 4D F0 E9 68 31 FD FF 8B 4D 08 E9 60 31 FD FF .M..h1...M..`1..
0042F6A0 8B 4D 08 E9 58 31 FD FF 8B 4D 08 E9 50 31 FD FF .M..X1...M..P1..
0042F6B0 8B 4D 08 E9 48 31 FD FF 8B 4D 08 E9 40 31 FD FF .M..H1...M..@1..
0042F6C0 8B 4D 08 E9 38 31 FD FF 8B 4D 08 E9 30 31 FD FF .M..81...M..01..
0042F6D0 8B 4D 08 E9 28 31 FD FF 8B 4D 08 E9 20 31 FD FF .M..(1...M.. 1..
0042F6E0 8B 4D 08 E9 18 31 FD FF 8B 4D 08 E9 10 31 FD FF .M...1...M...1..
0042F6F0 8B 54 24 08 8D 42 0C 8B 4A EC 33 C8 E8 FF 7D FF .T$..B..J.3...}.
0042F700 FF B8 B0 64 43 00 E9 94 DA FF FF CC CC CC CC CC ...dC...........
0042F710 8B 4D EC E9 E8 30 FD FF 8B 4D EC E9 E0 30 FD FF .M...0...M...0..
0042F720 8B 4D EC E9 D8 30 FD FF 8B 4D EC E9 D0 30 FD FF .M...0...M...0..
0042F730 8B 4D EC E9 C8 30 FD FF 8B 4D EC E9 C0 30 FD FF .M...0...M...0..
0042F740 8B 4D EC E9 B8 30 FD FF 8B 4D EC E9 B0 30 FD FF .M...0...M...0..
0042F750 8B 54 24 08 8D 42 0C 8B 4A CC 33 C8 E8 9F 7D FF .T$..B..J.3...}.
0042F760 FF 8B 4A FC 33 C8 E8 95 7D FF FF B8 38 65 43 00 ..J.3...}...8eC.
0042F770 E9 2A DA FF FF CC CC CC CC CC CC CC CC CC CC CC .*..............
0042F780 8B 4D F0 E9 78 30 FD FF 8B 4D 08 E9 70 30 FD FF .M..x0...M..p0..
0042F790 8B 54 24 08 8D 42 0C 8B 4A F0 33 C8 E8 5F 7D FF .T$..B..J.3.._}.
0042F7A0 FF B8 A0 65 43 00 E9 F4 D9 FF FF CC CC CC CC CC ...eC...........
0042F7B0 8B 4D EC E9 48 30 FD FF 8B 4D E8 E9 E0 31 FD FF .M..H0...M...1..
0042F7C0 8B 4D E8 E9 38 30 FD FF 8B 4D EC E9 D0 31 FD FF .M..80...M...1..
0042F7D0 8B 4D E8 E9 28 30 FD FF 8B 4D EC E9 C0 31 FD FF .M..(0...M...1..
0042F7E0 8B 4D E8 E9 18 30 FD FF 8B 4D EC E9 B0 31 FD FF .M...0...M...1..
0042F7F0 8B 4D E8 E9 08 30 FD FF 8B 4D EC E9 A0 31 FD FF .M...0...M...1..
0042F800 8B 4D E8 E9 F8 2F FD FF 8B 4D EC E9 90 31 FD FF .M.../...M...1..
0042F810 8B 4D E8 E9 E8 2F FD FF 8B 4D EC E9 80 31 FD FF .M.../...M...1..
0042F820 8B 4D E8 E9 D8 2F FD FF 8B 4D 08 E9 D0 2F FD FF .M.../...M.../..
0042F830 8B 4D 08 E9 C8 2F FD FF 8B 4D 08 E9 C0 2F FD FF .M.../...M.../..
0042F840 8B 4D 08 E9 B8 2F FD FF 8B 4D 08 E9 B0 2F FD FF .M.../...M.../..
0042F850 8B 4D 08 E9 A8 2F FD FF 8B 4D 08 E9 A0 2F FD FF .M.../...M.../..
0042F860 8B 4D 08 E9 98 2F FD FF 8B 4D 08 E9 90 2F FD FF .M.../...M.../..
0042F870 8B 4D 08 E9 88 2F FD FF 8B 4D 08 E9 80 2F FD FF .M.../...M.../..
0042F880 8B 4D 08 E9 78 2F FD FF 8B 4D 08 E9 70 2F FD FF .M..x/...M..p/..
0042F890 8B 4D 08 E9 68 2F FD FF 8B 4D 08 E9 60 2F FD FF .M..h/...M..`/..
0042F8A0 8B 4D 08 E9 58 2F FD FF 8B 4D 08 E9 50 2F FD FF .M..X/...M..P/..
0042F8B0 8B 4D 08 E9 48 2F FD FF 8B 4D 08 E9 40 2F FD FF .M..H/...M..@/..
0042F8C0 8B 4D 08 E9 38 2F FD FF 8B 4D 08 E9 30 2F FD FF .M..8/...M..0/..
0042F8D0 8B 4D 08 E9 28 2F FD FF 8B 4D 08 E9 20 2F FD FF .M..(/...M.. /..
0042F8E0 8B 4D 08 E9 18 2F FD FF 8B 4D 08 E9 10 2F FD FF .M.../...M.../..
0042F8F0 8B 4D 08 E9 08 2F FD FF 8B 4D 08 E9 00 2F FD FF .M.../...M.../..
0042F900 8B 4D 08 E9 F8 2E FD FF 8B 54 24 08 8D 42 0C 8B .M.......T$..B..
0042F910 4A E4 33 C8 E8 E7 7B FF FF B8 D8 65 43 00 E9 7C J.3...{....eC..|
0042F920 D8 FF FF CC CC CC CC CC CC CC CC CC CC CC CC CC ................
0042F930 8B 4D EC E9 C8 2E FD FF 8B 4D EC E9 C0 2E FD FF .M.......M......
0042F940 8B 4D EC E9 B8 2E FD FF 8B 4D EC E9 B0 2E FD FF .M.......M......
0042F950 8B 4D EC E9 A8 2E FD FF 8B 4D EC E9 A0 2E FD FF .M.......M......
0042F960 8B 4D EC E9 98 2E FD FF 8B 4D EC E9 90 2E FD FF .M.......M......
0042F970 8B 4D EC E9 88 2E FD FF 8B 4D EC E9 80 2E FD FF .M.......M......
0042F980 8B 4D EC E9 78 2E FD FF 8B 4D EC E9 70 2E FD FF .M..x....M..p...
0042F990 8B 4D EC E9 68 2E FD FF 8B 4D EC E9 60 2E FD FF .M..h....M..`...
0042F9A0 8B 4D EC E9 58 2E FD FF 8B 4D EC E9 50 2E FD FF .M..X....M..P...
0042F9B0 8B 4D EC E9 48 2E FD FF 8B 4D EC E9 40 2E FD FF .M..H....M..@...
0042F9C0 8B 4D EC E9 38 2E FD FF 8B 4D EC E9 30 2E FD FF .M..8....M..0...
0042F9D0 8B 4D EC E9 28 2E FD FF 8B 4D EC E9 20 2E FD FF .M..(....M.. ...
0042F9E0 8B 4D EC E9 18 2E FD FF 8B 4D EC E9 10 2E FD FF .M.......M......
0042F9F0 8B 4D EC E9 08 2E FD FF 8B 4D EC E9 00 2E FD FF .M.......M......
0042FA00 8B 4D EC E9 F8 2D FD FF 8B 4D EC E9 F0 2D FD FF .M...-...M...-..
0042FA10 8B 4D EC E9 E8 2D FD FF 8B 4D EC E9 E0 2D FD FF .M...-...M...-..
0042FA20 8B 54 24 08 8D 42 0C 8B 4A D8 33 C8 E8 CF 7A FF .T$..B..J.3...z.
0042FA30 FF 8B 4A FC 33 C8 E8 C5 7A FF FF B8 58 67 43 00 ..J.3...z...XgC.
0042FA40 E9 5A D7 FF FF CC CC CC CC CC CC CC CC CC CC CC .Z..............
0042FA50 8B 4D E8 E9 A8 2D FD FF 8B 4D E4 E9 40 2F FD FF .M...-...M..@/..
0042FA60 8B 4D E4 E9 98 2D FD FF 8B 4D E8 E9 30 2F FD FF .M...-...M..0/..
0042FA70 8B 4D E4 E9 88 2D FD FF 8B 4D E8 E9 20 2F FD FF .M...-...M.. /..
0042FA80 8B 4D E4 E9 78 2D FD FF 8B 4D E8 E9 10 2F FD FF .M..x-...M.../..
0042FA90 8B 4D E4 E9 68 2D FD FF 8B 4D E8 E9 00 2F FD FF .M..h-...M.../..
0042FAA0 8B 4D E4 E9 58 2D FD FF 8B 4D E8 E9 F0 2E FD FF .M..X-...M......
0042FAB0 8B 4D E4 E9 48 2D FD FF 8B 4D E8 E9 E0 2E FD FF .M..H-...M......
0042FAC0 8B 4D E4 E9 38 2D FD FF 8B 4D E8 E9 D0 2E FD FF .M..8-...M......
0042FAD0 8B 4D E4 E9 28 2D FD FF 8B 4D 08 E9 20 2D FD FF .M..(-...M.. -..
0042FAE0 8B 4D 08 E9 18 2D FD FF 8B 4D 08 E9 10 2D FD FF .M...-...M...-..
0042FAF0 8B 4D 08 E9 08 2D FD FF 8B 4D 08 E9 00 2D FD FF .M...-...M...-..
0042FB00 8B 4D 08 E9 F8 2C FD FF 8B 4D 08 E9 F0 2C FD FF .M...,...M...,..
0042FB10 8B 4D 08 E9 E8 2C FD FF 8B 4D 08 E9 E0 2C FD FF .M...,...M...,..
0042FB20 8B 4D 08 E9 D8 2C FD FF 8B 4D 08 E9 D0 2C FD FF .M...,...M...,..
0042FB30 8B 4D 08 E9 C8 2C FD FF 8B 4D 08 E9 C0 2C FD FF .M...,...M...,..
0042FB40 8B 4D 08 E9 B8 2C FD FF 8B 4D 08 E9 B0 2C FD FF .M...,...M...,..
0042FB50 8B 4D 08 E9 A8 2C FD FF 8B 4D 08 E9 A0 2C FD FF .M...,...M...,..
0042FB60 8B 4D 08 E9 98 2C FD FF 8B 4D 08 E9 90 2C FD FF .M...,...M...,..
0042FB70 8B 4D 08 E9 88 2C FD FF 8B 4D 08 E9 80 2C FD FF .M...,...M...,..
0042FB80 8B 4D 08 E9 78 2C FD FF 8B 4D 08 E9 70 2C FD FF .M..x,...M..p,..
0042FB90 8B 4D 08 E9 68 2C FD FF 8B 4D 08 E9 60 2C FD FF .M..h,...M..`,..
0042FBA0 8B 4D 08 E9 58 2C FD FF 8B 4D 08 E9 50 2C FD FF .M..X,...M..P,..
0042FBB0 8B 4D 08 E9 48 2C FD FF 8B 4D 08 E9 40 2C FD FF .M..H,...M..@,..
0042FBC0 8B 4D 08 E9 38 2C FD FF 8B 4D 08 E9 30 2C FD FF .M..8,...M..0,..
0042FBD0 8B 4D 08 E9 28 2C FD FF 8B 4D 08 E9 20 2C FD FF .M..(,...M.. ,..
0042FBE0 8B 4D 08 E9 18 2C FD FF 8B 4D 08 E9 10 2C FD FF .M...,...M...,..
0042FBF0 8B 4D 08 E9 08 2C FD FF 8B 4D 08 E9 00 2C FD FF .M...,...M...,..
0042FC00 8B 4D 08 E9 F8 2B FD FF 8B 4D 08 E9 F0 2B FD FF .M...+...M...+..
0042FC10 8B 4D 08 E9 E8 2B FD FF 8B 4D 08 E9 E0 2B FD FF .M...+...M...+..
0042FC20 8B 4D 08 E9 D8 2B FD FF 8B 4D 08 E9 D0 2B FD FF .M...+...M...+..
0042FC30 8B 4D 08 E9 C8 2B FD FF 8B 4D 08 E9 C0 2B FD FF .M...+...M...+..
0042FC40 8B 4D 08 E9 B8 2B FD FF 8B 4D 08 E9 B0 2B FD FF .M...+...M...+..
0042FC50 8B 4D 08 E9 A8 2B FD FF 8B 4D 08 E9 A0 2B FD FF .M...+...M...+..
0042FC60 8D 4D DC E9 08 18 FD FF 8D 4D C4 E9 90 2B FD FF .M.......M...+..
0042FC70 8B 54 24 08 8D 42 0C 8B 4A C0 33 C8 E8 7F 78 FF .T$..B..J.3...x.
0042FC80 FF B8 70 68 43 00 E9 14 D5 FF FF CC CC CC CC CC ..phC...........
0042FC90 8B 4D F0 E9 68 2B FD FF 8B 45 F0 83 E0 01 0F 84 .M..h+...E......
0042FCA0 0C 00 00 00 83 65 F0 FE 8D 4D E4 E9 C0 17 FD FF .....e...M......
0042FCB0 C3 8B 45 F0 83 E0 02 0F 84 0C 00 00 00 83 65 F0 ..E...........e.
0042FCC0 FD 8D 4D E4 E9 A7 17 FD FF C3 8B 45 F0 83 E0 04 ..M........E....
0042FCD0 0F 84 0C 00 00 00 83 65 F0 FB 8D 4D E4 E9 8E 17 .......e...M....
0042FCE0 FD FF C3 8B 4D 08 E9 15 2B FD FF 8B 4D 08 E9 0D ....M...+...M...
0042FCF0 2B FD FF 8B 4D 08 E9 05 2B FD FF 8B 4D 08 E9 FD +...M...+...M...
0042FD00 2A FD FF 8B 45 F0 83 E0 08 0F 84 0C 00 00 00 83 *...E...........
0042FD10 65 F0 F7 8D 4D E4 E9 55 17 FD FF C3 8B 45 F0 83 e...M..U.....E..
0042FD20 E0 10 0F 84 0C 00 00 00 83 65 F0 EF 8D 4D E4 E9 .........e...M..
0042FD30 3C 17 FD FF C3 8B 45 F0 83 E0 20 0F 84 0C 00 00 <.....E... .....
0042FD40 00 83 65 F0 DF 8D 4D E4 E9 23 17 FD FF C3 8B 4D ..e...M..#.....M
0042FD50 08 E9 AA 2A FD FF 8B 4D 08 E9 A2 2A FD FF 8B 4D ...*...M...*...M
0042FD60 08 E9 9A 2A FD FF 8B 4D 08 E9 92 2A FD FF 8B 4D ...*...M...*...M
0042FD70 08 E9 8A 2A FD FF 8B 4D 08 E9 82 2A FD FF 8B 4D ...*...M...*...M
0042FD80 08 E9 7A 2A FD FF 8B 45 F0 83 E0 40 0F 84 0C 00 ..z*...E...@....
0042FD90 00 00 83 65 F0 BF 8D 4D E4 E9 D2 16 FD FF C3 8B ...e...M........
0042FDA0 54 24 08 8D 42 0C 8B 4A D8 33 C8 E8 50 77 FF FF T$..B..J.3..Pw..
0042FDB0 B8 B8 6A 43 00 E9 E5 D3 FF FF CC CC CC CC CC CC ..jC............
0042FDC0 8B 4D EC E9 38 2A FD FF 8B 4D E4 E9 D0 2B FD FF .M..8*...M...+..
0042FDD0 8B 4D E4 E9 28 2A FD FF 8B 4D EC E9 C0 2B FD FF .M..(*...M...+..
0042FDE0 8B 4D E4 E9 18 2A FD FF 8B 4D EC E9 B0 2B FD FF .M...*...M...+..
0042FDF0 8B 4D E4 E9 08 2A FD FF 8B 4D EC E9 A0 2B FD FF .M...*...M...+..
0042FE00 8B 4D E4 E9 F8 29 FD FF 8B 4D EC E9 90 2B FD FF .M...)...M...+..
0042FE10 8B 4D E4 E9 E8 29 FD FF 8B 4D 08 E9 E0 29 FD FF .M...)...M...)..
0042FE20 8B 4D 08 E9 D8 29 FD FF 8B 4D 08 E9 D0 29 FD FF .M...)...M...)..
0042FE30 8B 4D 08 E9 C8 29 FD FF 8B 4D 08 E9 C0 29 FD FF .M...)...M...)..
0042FE40 8B 4D 08 E9 B8 29 FD FF 8B 4D 08 E9 B0 29 FD FF .M...)...M...)..
0042FE50 8B 4D 08 E9 A8 29 FD FF 8B 4D 08 E9 A0 29 FD FF .M...)...M...)..
0042FE60 8B 4D 08 E9 98 29 FD FF 8B 4D 08 E9 90 29 FD FF .M...)...M...)..
0042FE70 8B 4D 08 E9 88 29 FD FF 8B 4D 08 E9 80 29 FD FF .M...)...M...)..
0042FE80 8B 4D 08 E9 78 29 FD FF 8B 4D 08 E9 70 29 FD FF .M..x)...M..p)..
0042FE90 8B 4D 08 E9 68 29 FD FF 8B 4D 08 E9 60 29 FD FF .M..h)...M..`)..
0042FEA0 8B 4D 08 E9 58 29 FD FF 8B 4D 08 E9 50 29 FD FF .M..X)...M..P)..
0042FEB0 8B 4D 08 E9 48 29 FD FF 8B 4D 08 E9 40 29 FD FF .M..H)...M..@)..
0042FEC0 8B 4D 08 E9 38 29 FD FF 8B 4D 08 E9 30 29 FD FF .M..8)...M..0)..
0042FED0 8B 4D 08 E9 28 29 FD FF 8B 4D 08 E9 20 29 FD FF .M..()...M.. )..
0042FEE0 8B 4D 08 E9 18 29 FD FF 8B 4D 08 E9 10 29 FD FF .M...)...M...)..
0042FEF0 8B 4D 08 E9 08 29 FD FF 8B 4D 08 E9 00 29 FD FF .M...)...M...)..
0042FF00 8B 4D 08 E9 F8 28 FD FF 8B 4D 08 E9 F0 28 FD FF .M...(...M...(..
0042FF10 8B 54 24 08 8D 42 0C 8B 4A D4 33 C8 E8 DF 75 FF .T$..B..J.3...u.
0042FF20 FF B8 D0 6B 43 00 E9 74 D2 FF FF CC CC CC CC CC ...kC..t........
0042FF30 8B 4D E8 E9 C8 28 FD FF 8B 4D E8 E9 C0 28 FD FF .M...(...M...(..
0042FF40 8B 4D E8 E9 B8 28 FD FF 8B 4D E8 E9 B0 28 FD FF .M...(...M...(..
0042FF50 8B 4D E8 E9 A8 28 FD FF 8B 4D E8 E9 A0 28 FD FF .M...(...M...(..
0042FF60 8B 4D E8 E9 98 28 FD FF 8B 4D E8 E9 90 28 FD FF .M...(...M...(..
0042FF70 8B 4D E8 E9 88 28 FD FF 8B 4D E8 E9 80 28 FD FF .M...(...M...(..
0042FF80 8B 4D E8 E9 78 28 FD FF 8B 4D E8 E9 70 28 FD FF .M..x(...M..p(..
0042FF90 8B 4D E8 E9 68 28 FD FF 8D 4D E4 E9 D0 14 FD FF .M..h(...M......
0042FFA0 8B 54 24 08 8D 42 0C 8B 4A D8 33 C8 E8 4F 75 FF .T$..B..J.3..Ou.
0042FFB0 FF B8 48 6D 43 00 E9 E4 D1 FF FF CC CC CC CC CC ..HmC...........
0042FFC0 8B 4D EC E9 38 28 FD FF 8B 4D E8 E9 30 28 FD FF .M..8(...M..0(..
0042FFD0 8B 4D E8 E9 28 28 FD FF 8B 4D E8 E9 20 28 FD FF .M..((...M.. (..
0042FFE0 8B 4D E8 E9 18 28 FD FF 8B 4D E8 E9 10 28 FD FF .M...(...M...(..
0042FFF0 8B 4D E8 E9 08 28 FD FF 8B 4D E8 E9 00 28 FD FF .M...(...M...(..
00430000 8B 4D E8 E9 F8 27 FD FF 8B 4D E8 E9 F0 27 FD FF .M...'...M...'..
00430010 8B 4D E8 E9 E8 27 FD FF 8B 4D E8 E9 E0 27 FD FF .M...'...M...'..
00430020 8B 4D E8 E9 D8 27 FD FF 8B 4D E8 E9 D0 27 FD FF .M...'...M...'..
00430030 8B 4D E8 E9 C8 27 FD FF 8B 4D E8 E9 C0 27 FD FF .M...'...M...'..
00430040 8B 4D E8 E9 B8 27 FD FF 8B 4D E8 E9 B0 27 FD FF .M...'...M...'..
00430050 8B 4D E8 E9 A8 27 FD FF 8B 4D E8 E9 A0 27 FD FF .M...'...M...'..
00430060 8B 4D E8 E9 98 27 FD FF 8B 4D E8 E9 90 27 FD FF .M...'...M...'..
00430070 8B 4D E8 E9 88 27 FD FF 8B 4D E8 E9 80 27 FD FF .M...'...M...'..
00430080 8D 4D E0 E9 E8 13 FD FF 8B 54 24 08 8D 42 0C 8B .M.......T$..B..
00430090 4A D4 33 C8 E8 67 74 FF FF B8 F0 6D 43 00 E9 FC J.3..gt....mC...
004300A0 D0 FF FF CC CC CC CC CC CC CC CC CC CC CC CC CC ................
004300B0 8B 4D E0 E9 48 27 FD FF 8B 4D E0 E9 40 27 FD FF .M..H'...M..@'..
004300C0 8B 4D E0 E9 38 27 FD FF 8B 4D E0 E9 30 27 FD FF .M..8'...M..0'..
004300D0 8B 54 24 08 8D 42 0C 8B 4A D8 33 C8 E8 1F 74 FF .T$..B..J.3...t.
004300E0 FF 8B 4A FC 33 C8 E8 15 74 FF FF B8 F0 6E 43 00 ..J.3...t....nC.
004300F0 E9 AA D0 FF FF CC CC CC CC CC CC CC CC CC CC CC ................
00430100 8D 4D D8 E9 B8 72 FF FF 8B 54 24 08 8D 42 0C 8B .M...r...T$..B..
00430110 4A CC 33 C8 E8 E7 73 FF FF B8 34 6F 43 00 E9 7C J.3...s...4oC..|
00430120 D0 FF FF CC CC CC CC CC CC CC CC CC CC CC CC CC ................
00430130 8B 4D F0 E9 98 84 FF FF 8B 54 24 08 8D 42 0C 8B .M.......T$..B..
00430140 4A F0 33 C8 E8 B7 73 FF FF B8 CC 72 43 00 E9 4C J.3...s....rC..L
00430150 D0 FF FF CC CC CC CC CC CC CC CC CC CC CC CC CC ................
00430160 8B 54 24 08 8D 42 0C 8B 4A F8 33 C8 E8 8F 73 FF .T$..B..J.3...s.
00430170 FF B8 00 71 43 00 E9 24 D0 FF FF CC CC CC CC CC ...qC..$........
00430180 8B 54 24 08 8D 42 0C 8B 4A E0 33 C8 E8 6F 73 FF .T$..B..J.3..os.
00430190 FF B8 D4 70 43 00 E9 04 D0 FF FF CC CC CC CC CC ...pC...........
004301A0 8B 54 24 08 8D 42 0C 8B 4A E0 33 C8 E8 4F 73 FF .T$..B..J.3..Os.
004301B0 FF B8 E0 71 43 00 E9 E4 CF FF FF CC CC CC CC CC ...qC...........
004301C0 8D 4D E4 E9 F8 83 FF FF 8B 54 24 08 8D 42 0C 8B .M.......T$..B..
004301D0 4A E0 33 C8 E8 27 73 FF FF 8B 8A 0C 02 00 00 33 J.3..'s........3
004301E0 C8 E8 1A 73 FF FF B8 0C 72 43 00 E9 AF CF FF FF ...s....rC......
004301F0 8D 4D E4 E9 C8 83 FF FF 8B 54 24 08 8D 42 0C 8B .M.......T$..B..
00430200 4A E0 33 C8 E8 F7 72 FF FF 8B 8A 0C 01 00 00 33 J.3...r........3
00430210 C8 E8 EA 72 FF FF B8 38 72 43 00 E9 7F CF FF FF ...r...8rC......
00430220 8B 54 24 08 8D 42 0C 8B 4A F0 33 C8 E8 CF 72 FF .T$..B..J.3...r.
00430230 FF B8 00 71 43 00 E9 64 CF FF FF CC CC CC CC CC ...qC..d........
00430240 8B 54 24 08 8D 42 0C 8B 4A E4 33 C8 E8 AF 72 FF .T$..B..J.3...r.
00430250 FF B8 24 71 43 00 E9 44 CF FF FF CC CC CC CC CC ..$qC..D........
00430260 8B 54 24 08 8D 42 0C 8B 4A E8 33 C8 E8 8F 72 FF .T$..B..J.3...r.
00430270 FF B8 88 71 43 00 E9 24 CF FF FF CC CC CC CC CC ...qC..$........
00430280 8D 4D D4 E9 78 25 FD FF 8B 54 24 08 8D 42 0C 8B .M..x%...T$..B..
00430290 4A CC 33 C8 E8 67 72 FF FF 8B 4A F8 33 C8 E8 5D J.3..gr...J.3..]
004302A0 72 FF FF B8 A0 72 43 00 E9 F2 CE FF FF CC CC CC r....rC.........
004302B0 8B 54 24 08 8D 42 0C 8B 4A E8 33 C8 E8 3F 72 FF .T$..B..J.3..?r.
004302C0 FF B8 F4 76 43 00 E9 D4 CE FF FF CC CC CC CC CC ...vC...........
004302D0 8D 4D F0 E9 98 3B FD FF 8B 54 24 08 8D 42 0C 8B .M...;...T$..B..
004302E0 4A EC 33 C8 E8 17 72 FF FF B8 68 75 43 00 E9 AC J.3...r...huC...
004302F0 CE FF FF CC CC CC CC CC CC CC CC CC CC CC CC CC ................
00430300 8B 54 24 08 8D 42 0C 8B 4A EC 33 C8 E8 EF 71 FF .T$..B..J.3...q.
00430310 FF B8 00 71 43 00 E9 84 CE FF FF CC CC CC CC CC ...qC...........
00430320 8B 4D EC E9 F8 82 FF FF 8B 4D EC 83 C1 2C E9 3D .M.......M...,.=
00430330 9A FF FF 8B 54 24 08 8D 42 0C 8B 4A E8 33 C8 E8 ....T$..B..J.3..
00430340 BC 71 FF FF B8 4C 74 43 00 E9 51 CE FF FF CC CC .q...LtC..Q.....
00430350 8B 4D EC E9 C8 82 FF FF 8B 4D EC 83 C1 2C E9 0D .M.......M...,..
00430360 9A FF FF 8B 54 24 08 8D 42 0C 8B 4A E8 33 C8 E8 ....T$..B..J.3..
00430370 8C 71 FF FF B8 E4 73 43 00 E9 21 CE FF FF CC CC .q....sC..!.....
00430380 8B 54 24 08 8D 42 0C 8B 4A F8 33 C8 E8 6F 71 FF .T$..B..J.3..oq.
00430390 FF B8 50 73 43 00 E9 04 CE FF FF CC CC CC CC CC ..PsC...........
004303A0 8B 54 24 08 8D 42 0C 8B 4A F4 33 C8 E8 4F 71 FF .T$..B..J.3..Oq.
004303B0 FF B8 50 73 43 00 E9 E4 CD FF FF CC CC CC CC CC ..PsC...........
004303C0 8B 54 24 08 8D 42 0C 8B 4A F0 33 C8 E8 2F 71 FF .T$..B..J.3../q.
004303D0 FF B8 80 74 43 00 E9 C4 CD FF FF CC CC CC CC CC ...tC...........
004303E0 8B 54 24 08 8D 42 0C 8B 4A FC 33 C8 E8 0F 71 FF .T$..B..J.3...q.
004303F0 FF B8 50 73 43 00 E9 A4 CD FF FF CC CC CC CC CC ..PsC...........
00430400 8B 54 24 08 8D 42 0C 8B 4A F8 33 C8 E8 EF 70 FF .T$..B..J.3...p.
00430410 FF B8 34 75 43 00 E9 84 CD FF FF CC CC CC CC CC ..4uC...........
00430420 8B 54 24 08 8D 42 0C 8B 4A F4 33 C8 E8 CF 70 FF .T$..B..J.3...p.
00430430 FF B8 00 71 43 00 E9 64 CD FF FF CC CC CC CC CC ...qC..d........
00430440 8D 4D D8 E9 B8 23 FD FF 8B 54 24 08 8D 42 0C 8B .M...#...T$..B..
00430450 4A 94 33 C8 E8 A7 70 FF FF 8B 4A FC 33 C8 E8 9D J.3...p...J.3...
00430460 70 FF FF B8 1C 76 43 00 E9 32 CD FF FF CC CC CC p....vC..2......
00430470 8D 4D D8 E9 88 23 FD FF 8B 54 24 08 8D 42 0C 8B .M...#...T$..B..
00430480 4A 98 33 C8 E8 77 70 FF FF 8B 4A FC 33 C8 E8 6D J.3..wp...J.3..m
00430490 70 FF FF B8 F0 75 43 00 E9 02 CD FF FF CC CC CC p....uC.........
004304A0 8D 4D 08 E9 F8 99 FF FF 8D 4D F0 E9 10 81 FF FF .M.......M......
004304B0 8B 54 24 08 8D 42 0C 8B 4A E8 33 C8 E8 3F 70 FF .T$..B..J.3..?p.
004304C0 FF B8 74 76 43 00 E9 D4 CC FF FF CC CC CC CC CC ..tvC...........
004304D0 8D 4D D8 E9 08 3A FD FF 8B 54 24 08 8D 42 0C 8B .M...:...T$..B..
004304E0 4A DC 33 C8 E8 17 70 FF FF 8B 4A FC 33 C8 E8 0D J.3...p...J.3...
004304F0 70 FF FF B8 50 76 43 00 E9 A2 CC FF FF CC CC CC p...PvC.........
00430500 8D 4D D8 E9 D8 39 FD FF 8D 4D D4 E9 90 99 FF FF .M...9...M......
00430510 8B 54 24 08 8D 42 0C 8B 4A C4 33 C8 E8 DF 6F FF .T$..B..J.3...o.
00430520 FF 8B 4A FC 33 C8 E8 D5 6F FF FF B8 8C 75 43 00 ..J.3...o....uC.
00430530 E9 6A CC FF FF CC CC CC CC CC CC CC CC CC CC CC .j..............
00430540 8B 45 EC 83 E0 01 0F 84 0C 00 00 00 83 65 EC FE .E...........e..
00430550 8B 4D 08 E9 A8 22 FD FF C3 8B 54 24 08 8D 42 0C .M..."....T$..B.
00430560 8B 4A E8 33 C8 E8 96 6F FF FF B8 7C 73 43 00 E9 .J.3...o...|sC..
00430570 2B CC FF FF CC CC CC CC CC CC CC CC CC CC CC CC +...............
00430580 8D 4D D4 E9 78 22 FD FF 8D 4D BC E9 70 22 FD FF .M..x"...M..p"..
00430590 8B 54 24 08 8D 42 0C 8B 4A B4 33 C8 E8 5F 6F FF .T$..B..J.3.._o.
004305A0 FF 8B 4A F8 33 C8 E8 55 6F FF FF B8 C8 74 43 00 ..J.3..Uo....tC.
004305B0 E9 EA CB FF FF CC CC CC CC CC CC CC CC CC CC CC ................
004305C0 8D 4D EC FF 25 B8 11 43 00 8B 54 24 08 8D 42 0C .M..%..C..T$..B.
004305D0 8B 4A DC 33 C8 E8 26 6F FF FF B8 A4 79 43 00 E9 .J.3..&o....yC..
004305E0 BB CB FF FF CC CC CC CC CC CC CC CC CC CC CC CC ................
004305F0 8B 54 24 08 8D 42 0C 8B 4A FC 33 C8 E8 FF 6E FF .T$..B..J.3...n.
00430600 FF B8 00 71 43 00 E9 94 CB FF FF CC CC CC CC CC ...qC...........
00430610 8B 45 D4 83 E0 01 0F 84 0C 00 00 00 83 65 D4 FE .E...........e..
00430620 8B 4D CC E9 B8 98 FF FF C3 8D 4D D8 E9 AF 38 FD .M........M...8.
00430630 FF 8B 54 24 08 8D 42 0C 8B 4A C8 33 C8 E8 BE 6E ..T$..B..J.3...n
00430640 FF FF 8B 4A FC 33 C8 E8 B4 6E FF FF B8 18 78 43 ...J.3...n....xC
00430650 00 E9 49 CB FF FF CC CC CC CC CC CC CC CC CC CC ..I.............
00430660 8D 4D E4 E9 08 0E FD FF 6A 34 8B 45 EC 50 E8 CC .M......j4.E.P..
00430670 6F FF FF 83 C4 08 C3 8B 54 24 08 8D 42 0C 8B 4A o.......T$..B..J
00430680 E0 33 C8 E8 78 6E FF FF B8 4C 79 43 00 E9 0D CB .3..xn...LyC....
00430690 FF FF CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
004306A0 68 AC B0 43 00 E8 3C CD FF FF 59 C3 8B 54 24 08 h..C..<...Y..T$.
004306B0 8D 42 0C 8B 4A FC 33 C8 E8 43 6E FF FF B8 08 79 .B..J.3..Cn....y
004306C0 43 00 E9 D8 CA FF FF CC CC CC CC CC CC CC CC CC C...............
004306D0 68 A8 B0 43 00 E8 0C CD FF FF 59 C3 8B 54 24 08 h..C......Y..T$.
004306E0 8D 42 0C 8B 4A FC 33 C8 E8 13 6E FF FF B8 DC 78 .B..J.3...n....x
004306F0 43 00 E9 A8 CA FF FF CC CC CC CC CC CC CC CC CC C...............
00430700 8D 4D D8 E9 D8 37 FD FF 8B 45 A0 83 E0 02 0F 84 .M...7...E......
00430710 0C 00 00 00 83 65 A0 FD 8D 4D C0 E9 C0 37 FD FF .....e...M...7..
00430720 C3 8B 54 24 08 8D 42 0C 8B 4A 9C 33 C8 E8 CE 6D ..T$..B..J.3...m
00430730 FF FF 8B 4A FC 33 C8 E8 C4 6D FF FF B8 9C 77 43 ...J.3...m....wC
00430740 00 E9 59 CA FF FF CC CC CC CC CC CC CC CC CC CC ..Y.............
00430750 8B 45 BC 83 E0 01 0F 84 0C 00 00 00 83 65 BC FE .E...........e..
00430760 8D 4D C0 E9 78 37 FD FF C3 8B 54 24 08 8D 42 0C .M..x7....T$..B.
00430770 8B 4A B4 33 C8 E8 86 6D FF FF 8B 4A FC 33 C8 E8 .J.3...m...J.3..
00430780 7C 6D FF FF B8 78 77 43 00 E9 11 CA FF FF CC CC |m...xwC........
00430790 8D 4D 68 E9 48 97 FF FF 8D 4D 48 E9 40 97 FF FF .Mh.H....MH.@...
004307A0 8D 4D 28 E9 38 97 FF FF 8D 4D 08 E9 30 97 FF FF .M(.8....M..0...
004307B0 8B 54 24 08 8D 42 0C 8B 4A F8 33 C8 E8 3F 6D FF .T$..B..J.3..?m.
004307C0 FF B8 70 78 43 00 E9 D4 C9 FF FF CC CC CC CC CC ..pxC...........
004307D0 8D 4D D8 E9 08 37 FD FF 8B 54 24 08 8D 42 0C 8B .M...7...T$..B..
004307E0 4A D4 33 C8 E8 17 6D FF FF 8B 4A FC 33 C8 E8 0D J.3...m...J.3...
004307F0 6D FF FF B8 4C 78 43 00 E9 A2 C9 FF FF CC CC CC m...LxC.........
00430800 68 B8 B0 43 00 E8 DC CB FF FF 59 C3 8B 54 24 08 h..C......Y..T$.
00430810 8D 42 0C 8B 4A FC 33 C8 E8 E3 6C FF FF B8 78 79 .B..J.3...l...xy
00430820 43 00 E9 78 C9 FF FF CC CC CC CC CC CC CC CC CC C..x............
00430830 68 C0 B0 43 00 E8 AC CB FF FF 59 C3 8B 54 24 08 h..C......Y..T$.
00430840 8D 42 0C 8B 4A FC 33 C8 E8 B3 6C FF FF B8 D0 79 .B..J.3...l....y
00430850 43 00 E9 48 C9 FF FF CC CC CC CC CC CC CC CC CC C..H............
00430860 8B 45 F0 83 E0 01 0F 84 0C 00 00 00 83 65 F0 FE .E...........e..
00430870 8B 4D 08 E9 88 1F FD FF C3 8B 54 24 08 8D 42 0C .M........T$..B.
00430880 8B 4A F4 33 C8 E8 76 6C FF FF B8 FC 79 43 00 E9 .J.3..vl....yC..
00430890 0B C9 FF FF CC CC CC CC CC CC CC CC CC CC CC CC ................
004308A0 68 D8 B0 43 00 E8 3C CB FF FF 59 C3 8B 45 BC 83 h..C..<...Y..E..
004308B0 E0 01 0F 84 0C 00 00 00 83 65 BC FE 8D 4D C0 E9 .........e...M..
004308C0 3C 1F FD FF C3 8B 54 24 08 8D 42 0C 8B 4A B8 33 <.....T$..B..J.3
004308D0 C8 E8 2A 6C FF FF 8B 4A FC 33 C8 E8 20 6C FF FF ..*l...J.3.. l..
004308E0 B8 40 7A 43 00 E9 B5 C8 FF FF CC CC CC CC CC CC .@zC............
004308F0 8D 4D C8 E9 A8 BC FF FF 8D 4D D8 E9 00 1F FD FF .M.......M......
00430900 8B 54 24 08 8D 42 0C 8B 4A C4 33 C8 E8 EF 6B FF .T$..B..J.3...k.
00430910 FF 8B 4A FC 33 C8 E8 E5 6B FF FF B8 64 7A 43 00 ..J.3...k...dzC.
00430920 E9 7A C8 FF FF 8B 54 24 08 8D 42 0C 8B 4A F0 33 .z....T$..B..J.3
00430930 C8 E8 CA 6B FF FF B8 78 48 43 00 E9 5F C8 FF FF ...k...xHC.._...
00430940 B9 F8 B1 43 00 E9 B6 45 FD FF CC CC CC CC CC CC ...C...E........
00430950 B9 40 B1 43 00 E9 A6 45 FD FF B9 10 AD 43 00 E9 .@.C...E.....C..
00430960 13 6B FF FF CC CC CC CC CC CC CC CC CC CC CC CC .k..............
00430970 55 8B EC 6A FF 68 20 04 43 00 64 A1 00 00 00 00 U..j.h .C.d.....
00430980 50 56 57 A1 08 A0 43 00 33 C5 50 8D 45 F4 64 A3 PVW...C.3.P.E.d.
00430990 00 00 00 00 8B 35 90 B0 43 00 C7 45 FC 00 00 00 .....5..C..E....
004309A0 00 85 F6 74 2B 83 CF FF 8D 4E 04 8B C7 F0 0F C1 ...t+....N......
004309B0 01 83 F8 01 75 1A 8B 06 8B CE FF 50 04 8D 46 08 ....u......P..F.
004309C0 F0 0F C1 38 83 FF 01 75 07 8B 06 8B CE FF 50 08 ...8...u......P.
004309D0 8B 4D F4 64 89 0D 00 00 00 00 59 5F 5E 8B E5 5D .M.d......Y_^..]
004309E0 C3 CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
004309F0 55 8B EC 6A FF 68 60 01 43 00 64 A1 00 00 00 00 U..j.h`.C.d.....
00430A00 50 56 A1 08 A0 43 00 33 C5 50 8D 45 F4 64 A3 00 PV...C.3.P.E.d..
00430A10 00 00 00 83 3D 4C A0 43 00 08 C7 45 FC 00 00 00 ....=L.C...E....
00430A20 00 72 27 8B 35 38 A0 43 00 B9 38 A0 43 00 68 38 .r'.58.C..8.C.h8
00430A30 A0 43 00 E8 E8 79 FF FF A1 4C A0 43 00 6A 02 40 .C...y...L.C.j.@
00430A40 50 56 E8 69 7F FF FF 83 C4 0C B9 38 A0 43 00 E8 PV.i.......8.C..
00430A50 4C 1F FD FF 8B 4D F4 64 89 0D 00 00 00 00 59 5E L....M.d......Y^
00430A60 8B E5 5D C3 CC CC CC CC CC CC CC CC CC CC CC CC ..].............
00430A70 55 8B EC 6A FF 68 60 01 43 00 64 A1 00 00 00 00 U..j.h`.C.d.....
00430A80 50 56 A1 08 A0 43 00 33 C5 50 8D 45 F4 64 A3 00 PV...C.3.P.E.d..
00430A90 00 00 00 83 3D 34 A0 43 00 08 C7 45 FC 00 00 00 ....=4.C...E....
00430AA0 00 72 27 8B 35 20 A0 43 00 B9 20 A0 43 00 68 20 .r'.5 .C.. .C.h 
00430AB0 A0 43 00 E8 68 79 FF FF A1 34 A0 43 00 6A 02 40 .C..hy...4.C.j.@
00430AC0 50 56 E8 E9 7E FF FF 83 C4 0C B9 20 A0 43 00 E8 PV..~...... .C..
00430AD0 CC 1E FD FF 8B 4D F4 64 89 0D 00 00 00 00 59 5E .....M.d......Y^
00430AE0 8B E5 5D C3 CC CC CC CC CC CC CC CC CC CC CC CC ..].............
00430AF0 55 8B EC 6A FF 68 F0 05 43 00 64 A1 00 00 00 00 U..j.h..C.d.....
00430B00 50 A1 08 A0 43 00 33 C5 50 8D 45 F4 64 A3 00 00 P...C.3.P.E.d...
00430B10 00 00 8B 0D B4 B0 43 00 C7 45 FC 00 00 00 00 85 ......C..E......
00430B20 C9 74 11 8B 01 FF 50 08 85 C0 74 08 8B 10 8B C8 .t....P...t.....
00430B30 6A 01 FF 12 8B 4D F4 64 89 0D 00 00 00 00 59 8B j....M.d......Y.
00430B40 E5 5D C3 CC CC CC CC CC CC CC CC CC CC CC CC CC .]..............
00430B50 C7 05 50 A0 43 00 24 16 43 00 C3 CC CC CC CC CC ..P.C.$.C.......
00430B60 C7 05 70 A0 43 00 24 16 43 00 C3 CC CC CC CC CC ..p.C.$.C.......
00430B70 C7 05 6C A0 43 00 24 16 43 00 C3 CC CC CC CC CC ..l.C.$.C.......
00430B80 55 8B EC 6A FF 68 60 01 43 00 64 A1 00 00 00 00 U..j.h`.C.d.....
00430B90 50 56 A1 08 A0 43 00 33 C5 50 8D 45 F4 64 A3 00 PV...C.3.P.E.d..
00430BA0 00 00 00 83 3D 68 A0 43 00 10 C7 45 FC 00 00 00 ....=h.C...E....
00430BB0 00 72 27 8B 35 54 A0 43 00 B9 54 A0 43 00 68 54 .r'.5T.C..T.C.hT
00430BC0 A0 43 00 E8 58 78 FF FF A1 68 A0 43 00 6A 01 40 .C..Xx...h.C.j.@
00430BD0 50 56 E8 D9 7D FF FF 83 C4 0C B9 54 A0 43 00 E8 PV..}......T.C..
00430BE0 BC 1D FD FF 8B 4D F4 64 89 0D 00 00 00 00 59 5E .....M.d......Y^
00430BF0 8B E5 5D C3                                     ..].            
