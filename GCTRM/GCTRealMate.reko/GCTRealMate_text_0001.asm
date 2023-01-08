;;; Segment .text (00401000)

l0041104B:
	mov	dword ptr [esi+38h],0h
	jmp	41105Fh

l00411054:
	mov	ecx,esi
	mov	[esi+38h],edi
	call	dword ptr [431114h]

l0041105F:
	mov	dword ptr [ebp-4h],1h
	mov	ecx,[ebp-1Ch]
	test	ecx,ecx
	jz	41107Eh

l0041106D:
	mov	eax,[ecx]
	call	dword ptr [eax+8h]
	test	eax,eax
	jz	41107Eh

l00411076:
	mov	edx,[eax]
	mov	ecx,eax
	push	1h
	call	dword ptr [edx]

l0041107E:
	mov	eax,esi
	jmp	411084h

l00411082:
	xor	eax,eax

l00411084:
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	mov	ecx,[ebp-10h]
	xor	ecx,ebp
	call	427500h
	mov	esp,ebp
	pop	ebp
	ret	0Ch
004110A1    CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC  ...............

;; fn004110B0: 004110B0
;;   Called from:
;;     0040A69A (in fn00409E70)
;;     00410C0F (in fn00419888)
;;     00410C5C (in fn00410C50)
;;     0041A664 (in fn0041A350)
;;     004271CF (in fn00427410)
fn004110B0 proc
	push	esi
	mov	esi,ecx
	test	byte ptr [esi+3Ch],1h
	jz	411100h

l004110B9:
	mov	eax,[esi+20h]
	mov	ecx,[eax]
	test	ecx,ecx
	jz	4110CBh

l004110C2:
	mov	eax,[esi+30h]
	mov	edx,[eax]
	add	edx,ecx
	jmp	4110D5h

l004110CB:
	mov	eax,[esi+2Ch]
	mov	ecx,[esi+1Ch]
	mov	edx,[eax]
	add	edx,[ecx]

l004110D5:
	mov	eax,[esi+0Ch]
	mov	eax,[eax]
	sub	edx,eax
	cmp	edx,1000h
	jc	4110F6h

l004110E4:
	mov	ecx,[eax-4h]
	add	edx,23h
	sub	eax,ecx
	add	eax,0FCh
	cmp	eax,1Fh
	ja	411143h

l004110F4:
	mov	eax,ecx

l004110F6:
	push	edx
	push	eax
	call	42763Fh
	add	esp,8h

l00411100:
	mov	eax,[esi+0Ch]
	mov	dword ptr [eax],0h
	mov	eax,[esi+1Ch]
	mov	dword ptr [eax],0h
	mov	eax,[esi+2Ch]
	mov	dword ptr [eax],0h
	mov	eax,[esi+10h]
	mov	dword ptr [eax],0h
	mov	eax,[esi+20h]
	mov	dword ptr [eax],0h
	mov	eax,[esi+30h]
	mov	dword ptr [eax],0h
	and	dword ptr [esi+3Ch],0FEh
	mov	dword ptr [esi+38h],0h
	pop	esi
	ret

l00411143:
	call	dword ptr [431290h]
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h

;; fn00411150: 00411150
;;   Called from:
;;     004118C1 (in fn00411790)
fn00411150 proc
	push	ebp
	mov	ebp,esp
	mov	eax,[ebp+8h]
	xorps	xmm0,xmm0
	mov	[ecx],eax
	mov	eax,[ebp+0Ch]
	mov	[ecx+4h],eax
	mov	eax,ecx
	mov	dword ptr [ecx+8h],0h
	mov	dword ptr [ecx+0Ch],0h
	movq	qword ptr [ecx+10h],xmm0
	pop	ebp
	ret	8h
0041117A                               CC CC CC CC CC CC           ......

;; fn00411180: 00411180
;;   Called from:
;;     004164DD (in fn00416170)
fn00411180 proc
	push	ebp
	mov	ebp,esp
	push	esi
	mov	esi,[ebp+8h]
	push	edi
	mov	edi,[ebp+0Ch]
	cmp	esi,edi
	jz	41119Eh

l0041118F:
	nop

l00411190:
	mov	ecx,esi
	call	4148B0h
	add	esi,78h
	cmp	esi,edi
	jnz	411190h

l0041119E:
	pop	edi
	pop	esi
	pop	ebp
	ret	8h
004111A4             CC CC CC CC CC CC CC CC CC CC CC CC     ............

;; fn004111B0: 004111B0
;;   Called from:
;;     004164E8 (in fn00416170)
fn004111B0 proc
	push	ebp
	mov	ebp,esp
	mov	ecx,[ebp+0Ch]
	mov	edx,[ebp+8h]
	shl	ecx,4h
	sub	ecx,[ebp+0Ch]
	shl	ecx,3h
	cmp	ecx,1000h
	jc	4111DEh

l004111CA:
	push	esi
	mov	esi,[edx-4h]
	add	ecx,23h
	sub	edx,esi
	lea	eax,[edx-4h]
	cmp	eax,1Fh
	ja	4111ECh

l004111DB:
	mov	edx,esi
	pop	esi

l004111DE:
	push	ecx
	push	edx
	call	42763Fh
	add	esp,8h
	pop	ebp
	ret	8h

l004111EC:
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

;; fn00411200: 00411200
;;   Called from:
;;     0040AEFE (in fn0040AA30)
;;     0040AF79 (in fn0040AA30)
;;     0040B658 (in fn0040AA30)
;;     0040B6E8 (in fn0040AA30)
;;     0040B880 (in fn0040AA30)
;;     0040B901 (in fn0040AA30)
;;     0040B97D (in fn0040AA30)
;;     0040B9F5 (in fn0040AA30)
;;     0040BB5C (in fn0040AA30)
;;     0040BBD4 (in fn0040AA30)
;;     0040BD6F (in fn0040AA30)
;;     0040C034 (in fn0040BE00)
;;     0040C184 (in fn0040BE00)
;;     0040C388 (in fn0040BE00)
;;     0040C406 (in fn0040BE00)
;;     0040C484 (in fn0040BE00)
;;     0040C4F9 (in fn0040BE00)
;;     0040C8DB (in fn0040BE00)
;;     0040C96F (in fn0040BE00)
;;     0040D04B (in fn0040BE00)
;;     0040D0E0 (in fn0040BE00)
;;     0040D267 (in fn0040BE00)
;;     0040D2E5 (in fn0040BE00)
;;     0040D35E (in fn0040BE00)
;;     0040D3D3 (in fn0040BE00)
;;     0040D4A2 (in fn0040BE00)
;;     0040D514 (in fn0040BE00)
;;     0040D643 (in fn0040BE00)
;;     0040D6B8 (in fn0040BE00)
;;     0040D785 (in fn0040BE00)
;;     0040D7F7 (in fn0040BE00)
;;     0040D876 (in fn0040BE00)
;;     0040D8E8 (in fn0040BE00)
;;     0040D95A (in fn0040BE00)
;;     0040DADC (in fn0040BE00)
;;     0040F233 (in fn0040F225)
;;     0040F2C3 (in fn0040F2A0)
;;     004111FF (in fn004111B0)
;;     004194E1 (in fn004194C0)
fn00411200 proc
	push	ebp
	mov	ebp,esp
	sub	esp,14h
	push	ebx
	push	esi
	mov	esi,ecx
	mov	eax,1h
	push	edi
	mov	[ebp-8h],esi
	mov	edx,[esi+8h]
	test	edx,edx
	cmovnz	eax,edx

l0041121B:
	nop	dword ptr [eax+eax+0h]

l00411220:
	mov	ebx,eax
	sub	ebx,edx
	cmp	ebx,1h
	jc	41122Eh

l00411229:
	cmp	eax,8h
	jnc	411241h

l0041122E:
	mov	ecx,0FFFFFFFh
	sub	ecx,eax
	cmp	ecx,eax
	jc	411391h

l0041123D:
	add	eax,eax
	jmp	411220h

l00411241:
	mov	edi,[esi+0Ch]
	lea	ecx,[0000h+eax*4]
	shr	edi,4h
	mov	[ebp-10h],edi
	cmp	eax,3FFFFFFFh
	jbe	41125Dh

l00411258:
	or	ecx,0FFh
	jmp	411265h

l0041125D:
	cmp	ecx,1000h
	jc	41128Ch

l00411265:
	lea	eax,[ecx+23h]
	or	edx,0FFh
	cmp	eax,ecx
	cmovbe	eax,edx

l00411270:
	push	eax
	call	427511h
	add	esp,4h
	test	eax,eax
	jz	41138Bh

l00411281:
	lea	edx,[eax+23h]
	and	edx,0E0h
	mov	[edx-4h],eax
	jmp	41129Fh

l0041128C:
	test	ecx,ecx
	jz	41129Dh

l00411290:
	push	ecx
	call	427511h
	add	esp,4h
	mov	edx,eax
	jmp	41129Fh

l0041129D:
	xor	edx,edx

l0041129F:
	mov	eax,[esi+4h]
	mov	esi,[esi+8h]
	shl	edi,2h
	shl	esi,2h
	mov	[ebp-0Ch],edi
	mov	[ebp-4h],edx
	lea	ecx,[eax+edi]
	add	edi,edx
	sub	esi,ecx
	add	esi,eax
	push	esi
	push	ecx
	push	edi
	call	42D1C9h
	lea	eax,[esi+edi]
	add	esp,0Ch
	mov	edi,[ebp-8h]
	mov	esi,[ebp-10h]
	mov	[ebp-14h],eax
	mov	edx,[edi+4h]
	cmp	esi,ebx
	ja	41130Dh

l004112D8:
	lea	ecx,[0000h+esi*4]
	push	ecx
	push	edx
	push	eax
	call	42D1C9h
	mov	eax,ebx
	sub	eax,esi
	mov	esi,[ebp-0Ch]
	shl	eax,2h
	push	eax
	mov	eax,[ebp-14h]
	add	eax,esi
	push	0h
	push	eax
	call	42D1C3h
	push	esi
	mov	esi,[ebp-4h]
	push	0h
	push	esi
	call	42D1C3h
	jmp	411348h

l0041130D:
	lea	edi,[0000h+ebx*4]
	push	edi
	push	edx
	push	eax
	call	42D1C9h
	mov	esi,[ebp-8h]
	mov	esi,[esi+4h]
	lea	eax,[edi+esi]
	sub	esi,eax
	add	esi,[ebp-0Ch]
	push	esi
	push	eax
	push	dword ptr [ebp-4h]
	call	42D1C9h
	mov	eax,[ebp-4h]
	push	edi
	add	eax,esi
	push	0h
	push	eax
	call	42D1C3h
	mov	esi,[ebp-4h]
	mov	edi,[ebp-8h]

l00411348:
	mov	eax,[edi+4h]
	add	esp,24h
	test	eax,eax
	jz	41137Ch

l00411352:
	mov	ecx,[edi+8h]
	shl	ecx,2h
	cmp	ecx,1000h
	jc	411372h

l00411360:
	mov	edx,[eax-4h]
	add	ecx,23h
	sub	eax,edx
	add	eax,0FCh
	cmp	eax,1Fh
	ja	41138Bh

l00411370:
	mov	eax,edx

l00411372:
	push	ecx
	push	eax
	call	42763Fh
	add	esp,8h

l0041137C:
	mov	[edi+4h],esi
	add	[edi+8h],ebx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	4h

l0041138B:
	call	dword ptr [431290h]

l00411391:
	call	410C90h
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

;; fn004113A0: 004113A0
;;   Called from:
;;     0040C9A1 (in fn0040BE00)
fn004113A0 proc
	push	10h
	call	427511h
	add	esp,4h
	ret	4h
004113AD                                        CC CC CC              ...

;; fn004113B0: 004113B0
;;   Called from:
;;     004099FC (in fn00408FF1)
;;     0040A832 (in fn00409E70)
;;     0040BDF1 (in fn0040AA30)
;;     0040DD19 (in fn0040BE00)
;;     0040DD1E (in fn0040BE00)
;;     0040E11C (in fn0040DFF0)
;;     0040E29D (in fn0040E130)
;;     0040E9C7 (in fn0040E990)
;;     0040ED85 (in fn0040EB40)
;;     0040F83E (in fn0040F7F0)
;;     0040F889 (in fn0040F870)
;;     00410D3A (in fn00410CF0)
;;     00410DEB (in fn00410DA0)
;;     004113F7 (in fn004113F7)
;;     00416940 (in fn004167E0)
;;     004170B8 (in fn00416DA0)
;;     004173E8 (in fn004170C0)
;;     0041AE50 (in fn0041A760)
;;     0041C17D (in fn0041AEF0)
;;     0041C39F (in fn0041C39F)
;;     0041CA7E (in fn0041C910)
;;     0041D52B (in fn0041CC60)
;;     0041D530 (in fn0041CC60)
;;     0041D535 (in fn0041CC60)
;;     00426E4E (in fn004262A0)
;;     00426E53 (in fn004262A0)
;;     00426E58 (in fn004262A0)
;;     00426E5D (in fn004262A0)
fn004113B0 proc
	push	431DFCh
	call	dword ptr [43119Ch]
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h

;; fn004113C0: 004113C0
;;   Called from:
;;     0042CE82 (in fn0042CD80)
fn004113C0 proc
	push	ebp
	mov	ebp,esp
	mov	eax,[ebp+8h]
	mov	edx,[ebp+10h]
	push	esi
	mov	esi,[ebp+0Ch]
	push	edi
	mov	edi,ecx
	mov	ecx,[eax+10h]
	cmp	ecx,esi
	jc	4113F7h

;; fn004113D7: 004113D7
;;   Called from:
;;     004113D5 (in fn004113C0)
;;     004113D5 (in fn004113B0)
fn004113D7 proc
	sub	ecx,esi
	cmp	ecx,edx
	cmovc	edx,ecx

l004113DE:
	cmp	dword ptr [eax+14h],10h
	jc	4113E6h

l004113E4:
	mov	eax,[eax]

l004113E6:
	push	edx
	add	eax,esi
	mov	ecx,edi
	push	eax
	call	402A70h
	pop	edi
	pop	esi
	pop	ebp
	ret	0Ch

;; fn004113F7: 004113F7
;;   Called from:
;;     004113D5 (in fn004113C0)
;;     004113D5 (in fn004113B0)
fn004113F7 proc
	call	4113B0h
	int	3h
	int	3h
	int	3h
	int	3h

;; fn00411400: 00411400
;;   Called from:
;;     0040A6B3 (in fn00409E70)
;;     0041A459 (in fn0041A350)
fn00411400 proc
	push	ebp
	mov	ebp,esp
	push	ebx
	mov	ebx,[ebp+0Ch]
	push	esi
	mov	esi,ecx
	cmp	ebx,7FFFFFFFh
	jbe	411418h

;; fn00411412: 00411412
;;   Called from:
;;     00411410 (in fn00411400)
;;     00411410 (in fn004113F7)
fn00411412 proc
	call	dword ptr [4311A0h]

;; fn00411418: 00411418
;;   Called from:
;;     00411410 (in fn00411400)
;;     00411410 (in fn004113F7)
;;     00411412 (in fn00411412)
fn00411418 proc
	mov	ecx,[ebp+10h]
	test	ebx,ebx
	jz	4114E6h

l00411423:
	mov	eax,ecx
	and	eax,6h
	cmp	al,6h
	jz	4114E6h

l00411430:
	push	edi
	cmp	ebx,1000h
	jc	411462h

l00411439:
	lea	eax,[ebx+23h]
	or	ecx,0FFh
	cmp	eax,ebx
	cmovbe	eax,ecx

l00411444:
	push	eax
	call	427511h
	add	esp,4h
	test	eax,eax
	jz	41145Ch

l00411451:
	lea	edi,[eax+23h]
	and	edi,0E0h
	mov	[edi-4h],eax
	jmp	41146Dh

l0041145C:
	call	dword ptr [431290h]

l00411462:
	push	ebx
	call	427511h
	add	esp,4h
	mov	edi,eax

l0041146D:
	push	ebx
	push	dword ptr [ebp+8h]
	push	edi
	call	42D1CFh
	mov	ecx,[ebp+10h]
	lea	eax,[edi+ebx]
	mov	[esi+38h],eax
	add	esp,0Ch
	mov	eax,ecx
	and	eax,4h
	mov	[ebp+0Ch],eax
	jnz	41149Ch

l0041148D:
	mov	eax,[esi+0Ch]
	mov	[eax],edi
	mov	eax,[esi+1Ch]
	mov	[eax],edi
	mov	eax,[esi+2Ch]
	mov	[eax],ebx

l0041149C:
	test	cl,2h
	jnz	4114D9h

l004114A1:
	mov	eax,[esi+10h]
	test	cl,18h
	mov	edx,[esi+38h]
	mov	ecx,edx
	cmovz	ecx,edi

l004114AF:
	sub	edx,ecx
	cmp	dword ptr [ebp+0Ch],0h
	mov	[eax],edi
	mov	eax,[esi+20h]
	mov	[eax],ecx
	mov	eax,[esi+30h]
	mov	ecx,[ebp+10h]
	mov	[eax],edx
	jz	4114D9h

l004114C6:
	mov	eax,[esi+0Ch]
	mov	[eax],edi
	mov	eax,[esi+1Ch]
	mov	dword ptr [eax],0h
	mov	eax,[esi+2Ch]
	mov	[eax],edi

l004114D9:
	or	ecx,1h
	pop	edi
	mov	[esi+3Ch],ecx
	pop	esi
	pop	ebx
	pop	ebp
	ret	0Ch

l004114E6:
	mov	dword ptr [esi+38h],0h
	mov	[esi+3Ch],ecx
	pop	esi
	pop	ebx
	pop	ebp
	ret	0Ch
004114F6                   CC CC CC CC CC CC CC CC CC CC       ..........

;; fn00411500: 00411500
;;   Called from:
;;     0040C98F (in fn0040BE00)
fn00411500 proc
	push	ebp
	mov	ebp,esp
	mov	eax,[ecx+8h]
	mov	ecx,[ebp+8h]
	dec	eax
	shr	ecx,4h
	and	eax,ecx
	pop	ebp
	ret	4h
00411513          CC CC CC CC CC CC CC CC CC CC CC CC CC    .............

;; fn00411520: 00411520
;;   Called from:
;;     004140AF (in fn00413B30)
;;     00415605 (in fn004154B0)
;;     00415C35 (in fn0041568F)
;;     00415C4F (in fn0041568F)
;;     00415C69 (in fn0041568F)
;;     00415C83 (in fn0041568F)
;;     00415C9D (in fn0041568F)
;;     00415CB7 (in fn0041568F)
;;     00415CD1 (in fn0041568F)
;;     00415CEB (in fn0041568F)
;;     00415D05 (in fn0041568F)
;;     00415D1F (in fn0041568F)
fn00411520 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42E918h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,5Ch
	mov	eax,[43A008h]
	xor	eax,ebp
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	edx,ecx
	lea	ecx,[ebp-34h]
	call	414420h
	mov	edx,eax
	mov	dword ptr [ebp-4h],0h
	lea	ecx,[ebp-68h]
	call	414490h
	push	437C18h
	lea	eax,[ebp-68h]
	push	eax
	call	42D1B7h
	int	3h
	int	3h

;; fn00411570: 00411570
;;   Called from:
;;     00405BD7 (in fn00404FB0)
;;     00407847 (in fn00404FB0)
;;     0041156F (in fn00411520)
;;     00417ABB (in fn00417731)
;;     00417B08 (in fn00417731)
fn00411570 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42E950h
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
	mov	[ebp-10h],esp
	mov	[ebp-20h],edx
	mov	[ebp-14h],ecx
	mov	edi,[ecx]
	xor	esi,esi
	mov	[ebp-18h],esi
	mov	[ebp-28h],ecx
	mov	eax,[edi+4h]
	mov	edx,[eax+ecx+38h]
	test	edx,edx
	jz	4115C2h

l004115B6:
	mov	eax,[edx]
	mov	ecx,edx
	call	dword ptr [eax+4h]
	mov	ecx,[ebp-14h]
	mov	edi,[ecx]

l004115C2:
	mov	dword ptr [ebp-4h],0h
	mov	eax,edi
	mov	ebx,[edi+4h]
	mov	edx,edi
	cmp	dword ptr [ebx+ecx+0Ch],0h
	jnz	4115F2h

l004115D7:
	mov	ebx,[ebx+ecx+3Ch]
	test	ebx,ebx
	jz	4115F2h

l004115DF:
	cmp	ebx,ecx
	jz	4115F2h

l004115E3:
	mov	ecx,ebx
	call	dword ptr [43117Ch]
	mov	ecx,[ebp-14h]
	mov	eax,[ecx]
	mov	edx,eax

l004115F2:
	mov	ebx,[eax+4h]
	mov	eax,[ebx+ecx+0Ch]
	add	ebx,ecx
	test	eax,eax
	mov	[ebp-1Ch],ebx
	setz	byte ptr [ebp-24h]
	mov	dword ptr [ebp-4h],1h
	test	eax,eax
	jnz	411715h

l00411613:
	mov	edi,[ebx+20h]
	mov	ebx,[ebx+24h]
	test	ebx,ebx
	jg	411634h

l0041161D:
	jl	411624h

l0041161F:
	cmp	edi,1h
	ja	411634h

l00411624:
	xorps	xmm0,xmm0
	movlpd	qword ptr [ebp-30h],xmm0
	mov	ebx,[ebp-2Ch]
	mov	edi,[ebp-30h]
	jmp	41163Ah

l00411634:
	sub	edi,1h
	sbb	ebx,0h

l0041163A:
	mov	eax,[ebp-1Ch]
	mov	byte ptr [ebp-4h],2h
	mov	eax,[eax+14h]
	and	eax,1C0h
	cmp	eax,40h
	jz	411696h

l0041164E:
	nop

l00411650:
	test	esi,esi
	jnz	41170Eh

l00411658:
	test	ebx,ebx
	jl	411694h

l0041165C:
	jg	411662h

l0041165E:
	test	edi,edi
	jz	411694h

l00411662:
	mov	eax,[ecx]
	mov	eax,[eax+4h]
	add	ecx,eax
	mov	al,[ecx+40h]
	mov	ecx,[ecx+38h]
	mov	[ebp-1Ch],al
	push	dword ptr [ebp-1Ch]
	call	dword ptr [431178h]
	mov	ecx,[ebp-14h]
	cmp	eax,0FFh
	mov	eax,4h
	cmovz	esi,eax

l00411689:
	add	edi,0FFh
	mov	[ebp-18h],esi
	adc	ebx,0FFh
	jmp	411650h

l00411694:
	mov	edx,[ecx]

l00411696:
	mov	eax,[edx+4h]
	push	dword ptr [ebp-20h]
	mov	ecx,[eax+ecx+38h]
	call	dword ptr [431178h]
	cmp	eax,0FFh
	mov	eax,4h
	cmovz	esi,eax

l004116B1:
	mov	[ebp-18h],esi
	test	esi,esi
	jnz	41170Eh

l004116B8:
	test	ebx,ebx
	jl	41170Eh

l004116BC:
	jg	4116C2h

l004116BE:
	test	edi,edi
	jz	41170Eh

l004116C2:
	mov	ecx,[ebp-14h]
	mov	eax,[ecx]
	mov	eax,[eax+4h]
	add	ecx,eax
	mov	al,[ecx+40h]
	mov	ecx,[ecx+38h]
	mov	[ebp-20h],al
	push	dword ptr [ebp-20h]
	call	dword ptr [431178h]
	cmp	eax,0FFh
	mov	eax,4h
	cmovz	esi,eax

l004116E9:
	add	edi,0FFh
	adc	ebx,0FFh
	jmp	4116B1h
004116F1    8B 55 EC 6A 01 6A 04 8B 02 8B 48 04 03 CA FF  .U.j.j....H....
00411700 15 8C 11 43 00 B8 0B 17 41 00 C3 8B 75 E8       ...C....A...u.  

l0041170E:
	mov	dword ptr [ebp-4h],1h

l00411715:
	mov	ebx,[ebp-14h]
	push	0h
	push	esi
	mov	eax,[ebx]
	mov	eax,[eax+4h]
	mov	dword ptr [eax+ebx+20h],0h
	mov	dword ptr [eax+ebx+24h],0h
	mov	eax,[ebx]
	mov	ecx,[eax+4h]
	add	ecx,ebx
	call	dword ptr [43118Ch]
	mov	dword ptr [ebp-4h],4h
	call	dword ptr [4311A4h]
	mov	esi,[ebp-28h]
	test	al,al
	jnz	411759h

l00411751:
	mov	ecx,esi
	call	dword ptr [431190h]

l00411759:
	mov	byte ptr [ebp-4h],5h
	mov	eax,[esi]
	mov	eax,[eax+4h]
	mov	ecx,[eax+esi+38h]
	test	ecx,ecx
	jz	41176Fh

l0041176A:
	mov	eax,[ecx]
	call	dword ptr [eax+8h]

l0041176F:
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
00411783          CC CC CC CC CC CC CC CC CC CC CC CC CC    .............

;; fn00411790: 00411790
fn00411790 proc
	push	ebp
	mov	ebp,esp
	and	esp,0F8h
	sub	esp,0Ch
	push	ebx
	mov	ebx,[ebp+10h]
	push	esi
	mov	esi,ecx
	mov	[esp+10h],ebx
	push	edi
	mov	edi,[ebp+0Ch]
	mov	[esp+10h],edi
	mov	edx,[esi+20h]
	mov	eax,[edx]
	test	eax,eax
	jz	4117BDh

l004117B5:
	cmp	[esi+38h],eax
	jnc	4117BDh

l004117BA:
	mov	[esi+38h],eax

l004117BD:
	mov	ecx,[ebp+18h]
	test	cl,1h
	jz	411870h

l004117C9:
	mov	eax,[esi+1Ch]
	mov	edx,[eax]
	mov	[esp+0Ch],edx
	test	edx,edx
	jz	41186Dh

l004117DA:
	mov	eax,[ebp+14h]
	cmp	eax,2h
	jnz	4117F2h

l004117E2:
	mov	eax,[esi+38h]
	sub	eax,edx
	cdq
	add	edi,eax
	adc	ebx,edx
	mov	edx,[esp+0Ch]
	jmp	411812h

l004117F2:
	test	eax,eax
	jnz	411808h

l004117F6:
	mov	eax,[esi+0Ch]
	mov	eax,[eax]
	sub	eax,edx
	cdq
	add	edi,eax
	adc	ebx,edx
	mov	edx,[esp+0Ch]
	jmp	411812h

l00411808:
	cmp	eax,1h
	jnz	41185Bh

l0041180D:
	test	cl,2h
	jnz	41185Bh

l00411812:
	mov	eax,[esi+0Ch]
	add	edx,edi
	cmp	[eax],edx
	ja	4118D1h

l0041181F:
	cmp	edx,[esi+38h]
	ja	4118D1h

l00411828:
	mov	eax,[esi+2Ch]
	sub	[eax],edi
	mov	eax,[esi+1Ch]
	add	[eax],edi
	test	cl,2h
	jz	4118D6h

l0041183B:
	mov	eax,[esi+20h]
	mov	edx,[eax]
	test	edx,edx
	jz	4118D6h

l00411848:
	mov	eax,[esi+1Ch]
	mov	ecx,[eax]
	mov	eax,[esi+30h]
	sub	ecx,edx
	sub	[eax],ecx
	mov	eax,[esi+20h]
	add	[eax],ecx
	jmp	4118D6h

l0041185B:
	mov	eax,[ebp+8h]
	mov	dword ptr [eax],0FFFFFFFFh
	mov	dword ptr [eax+4h],0FFFFFFFFh
	jmp	4118DEh

l0041186D:
	mov	edx,[esi+20h]

l00411870:
	test	cl,2h
	jz	4118D1h

l00411875:
	mov	ecx,[edx]
	test	ecx,ecx
	jz	4118D1h

l0041187B:
	mov	eax,[ebp+14h]
	cmp	eax,2h
	jnz	411888h

l00411883:
	mov	eax,[esi+38h]
	jmp	411891h

l00411888:
	test	eax,eax
	jnz	4118BAh

l0041188C:
	mov	eax,[esi+10h]
	mov	eax,[eax]

l00411891:
	sub	eax,ecx
	cdq
	mov	edi,eax
	mov	ebx,edx
	add	edi,[esp+10h]
	mov	eax,[esi+10h]
	adc	ebx,[esp+14h]
	add	ecx,edi
	cmp	[eax],ecx
	ja	4118D1h

l004118A9:
	cmp	ecx,[esi+38h]
	ja	4118D1h

l004118AE:
	mov	eax,[esi+30h]
	sub	[eax],edi
	mov	eax,[esi+20h]
	add	[eax],edi
	jmp	4118D6h

l004118BA:
	mov	ecx,[ebp+8h]
	push	0FFh
	push	0FFh
	call	411150h
	mov	eax,ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	14h

l004118D1:
	or	edi,0FFh
	or	ebx,edi

l004118D6:
	mov	eax,[ebp+8h]
	mov	[eax],edi
	mov	[eax+4h],ebx

l004118DE:
	pop	edi
	xorps	xmm0,xmm0
	mov	dword ptr [eax+8h],0h
	pop	esi
	mov	dword ptr [eax+0Ch],0h
	movq	qword ptr [eax+10h],xmm0
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	14h
004118FD                                        CC CC CC              ...

;; fn00411900: 00411900
fn00411900 proc
	push	ebp
	mov	ebp,esp
	and	esp,0F8h
	sub	esp,0Ch
	push	ebx
	mov	ebx,[ebp+8h]
	push	esi
	mov	esi,[ebp+0Ch]
	add	esi,[ebp+14h]
	push	edi
	mov	edi,ecx
	mov	ecx,[ebp+10h]
	adc	ecx,[ebp+18h]
	mov	[esp+0Ch],ecx
	mov	eax,[edi+20h]
	mov	eax,[eax]
	test	eax,eax
	jz	411932h

l0041192A:
	cmp	[edi+38h],eax
	jnc	411932h

l0041192F:
	mov	[edi+38h],eax

l00411932:
	mov	eax,esi
	and	eax,ecx
	cmp	eax,0FFh
	jz	411A1Eh

l0041193F:
	mov	edx,[ebp+24h]
	test	dl,1h
	jz	4119C6h

l00411947:
	mov	eax,[edi+1Ch]
	mov	eax,[eax]
	mov	[esp+14h],eax
	test	eax,eax
	jz	4119C6h

l00411954:
	test	ecx,ecx
	jl	411A12h

l0041195C:
	jg	411966h

l0041195E:
	test	esi,esi
	jc	411A12h

l00411966:
	mov	eax,[edi+0Ch]
	mov	edx,[eax]
	mov	eax,[edi+38h]
	sub	eax,edx
	mov	[esp+10h],edx
	cdq
	cmp	ecx,edx
	jg	411A12h

l0041197D:
	jl	411987h

l0041197F:
	cmp	esi,eax
	ja	411A12h

l00411987:
	mov	eax,[edi+2Ch]
	mov	edx,[esp+10h]
	sub	edx,[esp+14h]
	add	edx,esi
	sub	[eax],edx
	mov	eax,[edi+1Ch]
	add	[eax],edx
	test	byte ptr [ebp+24h],2h
	jz	411A17h

l004119A1:
	mov	eax,[edi+20h]
	mov	edx,[eax]
	test	edx,edx
	jz	411A17h

l004119AA:
	mov	eax,[edi+1Ch]
	mov	ecx,[eax]
	mov	eax,[edi+30h]
	sub	ecx,edx
	sub	[eax],ecx
	mov	eax,[edi+20h]
	add	[eax],ecx
	mov	ecx,[esp+0Ch]
	mov	[ebx],esi
	mov	[ebx+4h],ecx
	jmp	411A43h

l004119C6:
	test	dl,2h
	jz	411A12h

l004119CB:
	mov	eax,[edi+20h]
	cmp	dword ptr [eax],0h
	jz	411A12h

l004119D3:
	test	ecx,ecx
	jl	411A12h

l004119D7:
	jg	4119DDh

l004119D9:
	test	esi,esi
	jc	411A12h

l004119DD:
	mov	eax,[edi+0Ch]
	mov	edx,[eax]
	mov	eax,[edi+38h]
	sub	eax,edx
	mov	[esp+0Ch],edx
	cdq
	cmp	ecx,edx
	jg	411A12h

l004119F0:
	jl	4119F6h

l004119F2:
	cmp	esi,eax
	ja	411A12h

l004119F6:
	mov	eax,[edi+20h]
	mov	edx,[esp+0Ch]
	sub	edx,[eax]
	mov	eax,[edi+30h]
	add	edx,esi
	sub	[eax],edx
	mov	eax,[edi+20h]
	add	[eax],edx
	mov	[ebx],esi
	mov	[ebx+4h],ecx
	jmp	411A43h

l00411A12:
	or	esi,0FFh
	or	ecx,esi

l00411A17:
	mov	[ebx],esi
	mov	[ebx+4h],ecx
	jmp	411A43h

l00411A1E:
	push	0B0h
	push	431E18h
	push	431E7Ch
	call	dword ptr [431294h]
	add	esp,0Ch
	mov	dword ptr [ebx],0FFFFFFFFh
	mov	dword ptr [ebx+4h],0FFFFFFFFh

l00411A43:
	pop	edi
	mov	dword ptr [ebx+8h],0h
	xorps	xmm0,xmm0
	mov	dword ptr [ebx+0Ch],0h
	mov	eax,ebx
	pop	esi
	movq	qword ptr [ebx+10h],xmm0
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	20h
00411A64             CC CC CC CC CC CC CC CC CC CC CC CC     ............

;; fn00411A70: 00411A70
fn00411A70 proc
	push	ebx
	push	edi
	mov	edi,[ecx+1Ch]
	mov	edx,[edi]
	test	edx,edx
	jz	411AC3h

l00411A7B:
	mov	ebx,[ecx+2Ch]
	mov	eax,[ebx]
	add	eax,edx
	cmp	edx,eax
	jnc	411A8Ch

l00411A86:
	movzx	eax,byte ptr [edx]
	pop	edi
	pop	ebx
	ret

l00411A8C:
	test	byte ptr [ecx+40h],1h
	jz	411AC3h

l00411A92:
	mov	eax,[ecx+20h]
	mov	eax,[eax]
	test	eax,eax
	jz	411AC3h

l00411A9B:
	cmp	edx,eax
	jc	411AA4h

l00411A9F:
	cmp	edx,[ecx+38h]
	jnc	411AC3h

l00411AA4:
	push	esi
	mov	esi,[ecx+38h]
	cmp	esi,eax
	jnc	411AB3h

l00411AAC:
	mov	[ecx+38h],eax
	mov	esi,eax
	mov	edx,[edi]

l00411AB3:
	sub	esi,edx
	mov	[ebx],esi
	mov	eax,[ecx+1Ch]
	pop	esi
	pop	edi
	pop	ebx
	mov	eax,[eax]
	movzx	eax,byte ptr [eax]
	ret

l00411AC3:
	pop	edi
	or	eax,0FFh
	pop	ebx
	ret
00411AC9                            CC CC CC CC CC CC CC          .......

;; fn00411AD0: 00411AD0
fn00411AD0 proc
	push	ebp
	mov	ebp,esp
	mov	eax,[ecx+1Ch]
	push	esi
	mov	esi,[eax]
	test	esi,esi
	jz	411B1Ch

l00411ADD:
	mov	eax,[ecx+0Ch]
	cmp	[eax],esi
	jnc	411B1Ch

l00411AE4:
	test	byte ptr [ecx+40h],2h
	mov	edx,[ebp+8h]
	jnz	411AF7h

l00411AED:
	cmp	edx,0FFh
	jz	411AF7h

l00411AF2:
	cmp	dl,[esi-1h]
	jnz	411B1Ch

l00411AF7:
	mov	eax,[ecx+2Ch]
	inc	dword ptr [eax]
	mov	eax,[ecx+1Ch]
	dec	dword ptr [eax]
	cmp	edx,0FFh
	jz	411B0Dh

l00411B06:
	mov	ecx,[ecx+1Ch]
	mov	ecx,[ecx]
	mov	[ecx],dl

l00411B0D:
	xor	eax,eax
	cmp	edx,0FFh
	pop	esi
	cmovz	edx,eax

l00411B16:
	mov	eax,edx
	pop	ebp
	ret	4h

l00411B1C:
	or	eax,0FFh
	pop	esi
	pop	ebp
	ret	4h
00411B24             CC CC CC CC CC CC CC CC CC CC CC CC     ............

;; fn00411B30: 00411B30
fn00411B30 proc
	push	ebp
	mov	ebp,esp
	sub	esp,10h
	cmp	dword ptr [ebp+8h],0FFh
	push	edi
	mov	edi,ecx
	jnz	411B48h

l00411B3F:
	xor	eax,eax
	pop	edi
	mov	esp,ebp
	pop	ebp
	ret	4h

l00411B48:
	mov	eax,[edi+20h]
	push	esi
	mov	edx,[eax]
	test	edx,edx
	jz	411B61h

l00411B52:
	mov	eax,[edi+30h]
	mov	eax,[eax]
	add	eax,edx
	cmp	edx,eax
	jc	411D15h

l00411B61:
	test	byte ptr [edi+40h],2h
	jnz	411B72h

l00411B67:
	pop	esi
	or	eax,0FFh
	pop	edi
	mov	esp,ebp
	pop	ebp
	ret	4h

l00411B72:
	test	edx,edx
	jnz	411B7Ah

l00411B76:
	xor	esi,esi
	jmp	411B86h

l00411B7A:
	mov	eax,[edi+30h]
	mov	ecx,[edi+0Ch]
	mov	esi,[eax]
	sub	esi,[ecx]
	add	esi,edx

l00411B86:
	mov	ecx,esi
	mov	[ebp-8h],esi
	shr	ecx,1h
	mov	eax,100h
	cmp	ecx,eax
	push	ebx
	cmovc	ecx,eax

l00411B98:
	mov	eax,[edi+0Ch]
	xor	ebx,ebx
	mov	eax,[eax]
	mov	[ebp-4h],eax
	test	ecx,ecx
	jz	411BFFh

l00411BA6:
	mov	eax,ecx
	not	eax
	cmp	eax,esi
	jnc	411BB4h

l00411BAE:
	shr	ecx,1h
	jnz	411BA6h

l00411BB2:
	jmp	411BFCh

l00411BB4:
	test	ecx,ecx
	jz	411BFCh

l00411BB8:
	lea	edx,[ecx+esi]
	mov	[ebp-8h],edx
	cmp	edx,1000h
	jc	411BE9h

l00411BC6:
	lea	eax,[edx+23h]
	or	ecx,0FFh
	cmp	eax,edx
	cmovbe	eax,ecx

l00411BD1:
	push	eax
	call	427511h
	add	esp,4h
	test	eax,eax
	jz	411C33h

l00411BDE:
	lea	ebx,[eax+23h]
	and	ebx,0E0h
	mov	[ebx-4h],eax
	jmp	411BFCh

l00411BE9:
	test	edx,edx
	jz	411BFAh

l00411BED:
	push	edx
	call	427511h
	add	esp,4h
	mov	ebx,eax
	jmp	411BFCh

l00411BFA:
	xor	ebx,ebx

l00411BFC:
	mov	eax,[ebp-4h]

l00411BFF:
	test	esi,esi
	jz	411C0Eh

l00411C03:
	push	esi
	push	eax
	push	ebx
	call	42D1CFh
	add	esp,0Ch

l00411C0E:
	cmp	byte ptr [edi+3Ch],0h
	jz	411C43h

l00411C14:
	mov	eax,[ebp-4h]
	mov	edx,esi
	mov	ecx,eax
	cmp	esi,1000h
	jc	411C39h

l00411C23:
	mov	ecx,[eax-4h]
	lea	edx,[esi+23h]
	sub	eax,ecx
	add	eax,0FCh
	cmp	eax,1Fh
	jbe	411C39h

l00411C33:
	call	dword ptr [431290h]

l00411C39:
	push	edx
	push	ecx
	call	42763Fh
	add	esp,8h

l00411C43:
	mov	edx,[edi+10h]
	mov	byte ptr [edi+3Ch],1h
	test	esi,esi
	jnz	411C90h

l00411C4E:
	mov	[edi+38h],ebx
	mov	[edx],ebx
	mov	eax,[edi+20h]
	mov	edx,[ebp-8h]
	mov	[eax],ebx
	mov	eax,[edi+30h]
	mov	[eax],edx
	mov	eax,[edi+0Ch]
	mov	ecx,[edi+40h]
	mov	[eax],ebx
	mov	eax,[edi+1Ch]
	and	ecx,1h
	jz	411C80h

l00411C70:
	mov	[eax],ebx
	mov	eax,[edi+2Ch]
	mov	dword ptr [eax],1h
	jmp	411D14h

l00411C80:
	mov	dword ptr [eax],0h
	mov	eax,[edi+2Ch]
	mov	[eax],ebx
	jmp	411D14h

l00411C90:
	mov	eax,[edi+38h]
	mov	ecx,[ebp-4h]
	sub	eax,ecx
	add	eax,ebx
	mov	[edi+38h],eax
	mov	eax,[edi+20h]
	mov	edx,[edx]
	mov	esi,[eax]
	mov	eax,[edi+1Ch]
	sub	esi,edx
	sub	edx,ecx
	mov	ecx,ebx
	add	edx,ebx
	sub	ecx,edx
	mov	eax,[eax]
	add	ecx,[ebp-8h]
	mov	[ebp-4h],eax
	mov	eax,[edi+0Ch]
	mov	eax,[eax]
	mov	[ebp-10h],eax
	mov	eax,[edi+10h]
	mov	[eax],edx
	mov	eax,[edi+20h]
	mov	[eax],edx
	mov	eax,[edi+30h]
	mov	[eax],ecx
	mov	eax,[edi+30h]
	sub	[eax],esi
	mov	eax,[edi+20h]
	add	[eax],esi
	test	byte ptr [edi+40h],1h
	jz	411D01h

l00411CE0:
	mov	eax,[edi+20h]
	mov	edx,[ebp-4h]
	sub	edx,[ebp-10h]
	add	edx,ebx
	mov	ecx,[eax]
	mov	eax,[edi+0Ch]
	sub	ecx,edx
	inc	ecx
	mov	[eax],ebx
	mov	eax,[edi+1Ch]
	mov	[eax],edx
	mov	eax,[edi+2Ch]
	mov	[eax],ecx
	jmp	411D14h

l00411D01:
	mov	eax,[edi+0Ch]
	mov	[eax],ebx
	mov	edx,[edi+1Ch]
	mov	dword ptr [edx],0h
	mov	edx,[edi+2Ch]
	mov	[edx],ebx

l00411D14:
	pop	ebx

l00411D15:
	mov	esi,[ebp+8h]
	mov	ecx,edi
	push	esi
	call	dword ptr [431178h]
	mov	eax,esi
	pop	esi
	pop	edi
	mov	esp,ebp
	pop	ebp
	ret	4h
00411D2B                                  CC CC CC CC CC            .....

;; fn00411D30: 00411D30
;;   Called from:
;;     00404876 (in fn00404080)
fn00411D30 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42E980h
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
	mov	esi,edx
	mov	ecx,[esi+4h]
	mov	eax,88888889h
	sub	ecx,[esi]
	imul	ecx
	add	edx,ecx
	sar	edx,6h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx
	jnz	411D95h

l00411D74:
	cmp	dword ptr [esi+40h],10h
	lea	edx,[esi+2Ch]
	mov	eax,[edx+10h]
	jc	411D82h

l00411D80:
	mov	edx,[edx]

l00411D82:
	push	eax
	mov	ecx,43B1F8h
	call	4038C0h
	add	esp,4h
	jmp	411EC1h

l00411D95:
	mov	ecx,[esi+20h]
	mov	edx,[esi+24h]
	cmp	ecx,edx
	jge	411DA9h

l00411D9F:
	test	byte ptr [esi+44h],2h
	jnz	411EDCh

l00411DA9:
	test	byte ptr [esi+1Ch],4h
	jz	411E1Bh

l00411DAF:
	lea	eax,[ebp-28h]
	mov	ecx,esi
	push	eax
	call	4140C0h
	mov	dword ptr [ebp-4h],1h
	cmp	dword ptr [eax+14h],10h
	mov	ecx,[eax+10h]
	jc	411DCCh

l00411DCA:
	mov	eax,[eax]

l00411DCC:
	push	ecx
	mov	edx,eax
	mov	ecx,43B1F8h
	call	4038C0h
	mov	edx,[ebp-14h]
	add	esp,4h
	cmp	edx,10h
	jc	411EC1h

l00411DE8:
	mov	ecx,[ebp-28h]
	inc	edx
	mov	eax,ecx
	cmp	edx,1000h
	jc	411E0Ch

l00411DF6:
	mov	ecx,[ecx-4h]
	add	edx,23h
	sub	eax,ecx
	add	eax,0FCh
	cmp	eax,1Fh
	jbe	411E0Ch

l00411E06:
	call	dword ptr [431290h]

l00411E0C:
	push	edx
	push	ecx
	call	42763Fh
	add	esp,8h
	jmp	411EC1h

l00411E1B:
	cmp	dword ptr [esi+40h],10h
	lea	edx,[esi+2Ch]
	mov	eax,[edx+10h]
	jc	411E29h

l00411E27:
	mov	edx,[edx]

l00411E29:
	push	eax
	mov	ecx,43B1F8h
	call	4038C0h
	mov	ecx,[esi+4h]
	xor	eax,eax
	mov	edi,[esi]
	add	esp,4h
	mov	[ebp-10h],eax
	sub	ecx,edi
	mov	eax,88888889h
	imul	ecx
	add	edx,ecx
	sar	edx,6h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx
	jz	411EC1h

l00411E58:
	xor	ebx,ebx
	nop	word ptr [eax+eax+0h]

l00411E60:
	lea	edx,[edi+4h]
	add	edx,ebx
	cmp	dword ptr [edx+14h],10h
	mov	eax,[edx+10h]
	jc	411E70h

l00411E6E:
	mov	edx,[edx]

l00411E70:
	push	eax
	mov	ecx,43B1F8h
	call	4038C0h
	lea	edx,[edi+1Ch]
	add	esp,4h
	add	edx,ebx
	cmp	dword ptr [edx+14h],10h
	mov	eax,[edx+10h]
	jc	411E8Eh

l00411E8C:
	mov	edx,[edx]

l00411E8E:
	push	eax
	mov	ecx,43B1F8h
	call	4038C0h
	mov	ecx,[esi+4h]
	mov	eax,88888889h
	mov	edi,[esi]
	add	esp,4h
	inc	dword ptr [ebp-10h]
	sub	ecx,edi
	imul	ecx
	add	ebx,78h
	add	edx,ecx
	sar	edx,6h
	mov	ecx,edx
	shr	ecx,1Fh
	add	ecx,edx
	cmp	[ebp-10h],ecx
	jc	411E60h

l00411EC1:
	mov	byte ptr [esi+28h],1h
	mov	eax,43B1F8h
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret

l00411EDC:
	push	edx
	push	ecx
	lea	ecx,[ebp-24h]
	call	404000h
	mov	ecx,eax
	mov	dword ptr [ebp-4h],0h
	call	414540h
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

;; fn00411F00: 00411F00
;;   Called from:
;;     004056D2 (in fn00404FB0)
;;     00405802 (in fn00404FB0)
;;     00405DB4 (in fn00404FB0)
;;     00405E1A (in fn00404FB0)
;;     00405ED8 (in fn00404FB0)
;;     00405F79 (in fn00404FB0)
;;     00405FDF (in fn00404FB0)
;;     00406047 (in fn00404FB0)
;;     004061A4 (in fn00404FB0)
;;     0040620A (in fn00404FB0)
;;     00406272 (in fn00404FB0)
;;     0040632B (in fn00404FB0)
;;     0040639A (in fn00404FB0)
;;     00406406 (in fn00404FB0)
;;     004064E5 (in fn00404FB0)
;;     004065E0 (in fn00404FB0)
;;     004068E3 (in fn00404FB0)
;;     0040694A (in fn00404FB0)
;;     004069B5 (in fn00404FB0)
;;     00406A22 (in fn00404FB0)
;;     00406A8E (in fn00404FB0)
;;     00406B2F (in fn00404FB0)
;;     00406BA1 (in fn00404FB0)
;;     00406C13 (in fn00404FB0)
;;     00406C85 (in fn00404FB0)
;;     00406CF7 (in fn00404FB0)
;;     00406E05 (in fn00404FB0)
;;     00406E66 (in fn00404FB0)
;;     00406F1C (in fn00404FB0)
;;     00406FD2 (in fn00404FB0)
;;     004070E9 (in fn00404FB0)
;;     00407195 (in fn00404FB0)
;;     00407220 (in fn00404FB0)
;;     004072AA (in fn00404FB0)
;;     00407335 (in fn00404FB0)
;;     004073A5 (in fn00404FB0)
;;     0040756C (in fn00404FB0)
;;     00407643 (in fn00404FB0)
;;     004076C5 (in fn00404FB0)
;;     0040840B (in fn00407D10)
;;     00408C6B (in fn00408570)
;;     0040A8CF (in fn0040A880)
;;     00411EFF (in fn00411D30)
;;     0041B00B (in fn0041AEF0)
;;     0041B0C2 (in fn0041AEF0)
;;     0041B15D (in fn0041AEF0)
;;     0041B224 (in fn0041AEF0)
;;     0041B2BF (in fn0041AEF0)
;;     0041B3AF (in fn0041AEF0)
;;     0041B4A4 (in fn0041AEF0)
;;     0041B5AF (in fn0041AEF0)
;;     0041B64A (in fn0041AEF0)
;;     0041B6E5 (in fn0041AEF0)
;;     0041B7DA (in fn0041AEF0)
;;     0041B8CF (in fn0041AEF0)
;;     0041B9DE (in fn0041AEF0)
;;     0041BA79 (in fn0041AEF0)
;;     0041BB3A (in fn0041AEF0)
;;     0041BBD5 (in fn0041AEF0)
;;     0041BCCA (in fn0041AEF0)
;;     0041BDBF (in fn0041AEF0)
;;     0041BECE (in fn0041AEF0)
;;     0041BF69 (in fn0041AEF0)
;;     0041C010 (in fn0041AEF0)
;;     0041D2B3 (in fn0041CC60)
;;     0041D33B (in fn0041CC60)
;;     004236A5 (in fn00421620)
;;     00423878 (in fn004237A0)
;;     00423914 (in fn004237A0)
;;     004239B0 (in fn004237A0)
;;     00423BE9 (in fn004237A0)
;;     00423C55 (in fn004237A0)
;;     00423CBC (in fn004237A0)
fn00411F00 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42DC78h
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
	mov	edi,edx
	mov	esi,ecx
	mov	eax,[ebp+8h]
	mov	dword ptr [ebp-4h],0h
	mov	ecx,[eax+4h]
	mov	[ebp-1Ch],ecx
	mov	eax,[ecx]
	call	dword ptr [eax+4h]
	mov	dword ptr [ebp-4h],1h
	mov	ecx,esi
	mov	ebx,[esi+14h]
	cmp	ebx,10h
	jc	411F54h

l00411F52:
	mov	ecx,[esi]

l00411F54:
	mov	edx,[esi+10h]
	add	edx,ecx
	mov	[ebp-18h],edx
	cmp	ebx,10h
	jc	411F63h

l00411F61:
	mov	esi,[esi]

l00411F63:
	mov	ecx,edi
	lea	ebx,[ecx+1h]

l00411F68:
	mov	al,[ecx]
	inc	ecx
	test	al,al
	jnz	411F68h

l00411F6F:
	sub	ecx,ebx
	lea	eax,[ecx+edi]
	mov	[ebp+8h],eax
	cmp	esi,edx
	jz	411FC6h

l00411F7B:
	nop	dword ptr [eax+eax+0h]

l00411F80:
	cmp	edi,eax
	jz	411FCAh

l00411F84:
	mov	al,[esi]
	lea	ecx,[ebp-20h]
	mov	[ebp-10h],al
	push	dword ptr [ebp-10h]
	call	402DD0h
	mov	ecx,eax
	call	dword ptr [431140h]
	mov	cl,[edi]
	mov	bl,al
	mov	[ebp-14h],cl
	lea	ecx,[ebp-20h]
	push	dword ptr [ebp-14h]
	call	402DD0h
	mov	ecx,eax
	call	dword ptr [431140h]
	cmp	bl,al
	jnz	411FD2h

l00411FBA:
	mov	edx,[ebp-18h]
	inc	esi
	mov	eax,[ebp+8h]
	inc	edi
	cmp	esi,edx
	jnz	411F80h

l00411FC6:
	cmp	edi,eax
	jnz	412005h

l00411FCA:
	cmp	esi,edx
	jnz	412005h

l00411FCE:
	mov	bl,1h
	jmp	412007h

l00411FD2:
	mov	dword ptr [ebp-4h],2h
	mov	ecx,[ebp-1Ch]
	test	ecx,ecx
	jz	411FF1h

l00411FE0:
	mov	eax,[ecx]
	call	dword ptr [eax+8h]
	test	eax,eax
	jz	411FF1h

l00411FE9:
	mov	edx,[eax]
	mov	ecx,eax
	push	1h
	call	dword ptr [edx]

l00411FF1:
	xor	al,al
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret

l00412005:
	xor	bl,bl

l00412007:
	mov	dword ptr [ebp-4h],3h
	mov	ecx,[ebp-1Ch]
	test	ecx,ecx
	jz	412026h

l00412015:
	mov	eax,[ecx]
	call	dword ptr [eax+8h]
	test	eax,eax
	jz	412026h

l0041201E:
	mov	edx,[eax]
	mov	ecx,eax
	push	1h
	call	dword ptr [edx]

l00412026:
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
0041203A                               CC CC CC CC CC CC           ......

;; fn00412040: 00412040
;;   Called from:
;;     0040595E (in fn00404FB0)
fn00412040 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42DC78h
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
	mov	esi,ecx
	mov	eax,[ebp+8h]
	mov	dword ptr [ebp-4h],0h
	mov	ecx,[eax+4h]
	mov	[ebp-1Ch],ecx
	mov	eax,[ecx]
	call	dword ptr [eax+4h]
	mov	dword ptr [ebp-4h],1h
	mov	ecx,esi
	mov	edx,[esi+14h]
	cmp	edx,10h
	jc	412092h

l00412090:
	mov	ecx,[esi]

l00412092:
	mov	eax,[esi+10h]
	add	eax,ecx
	mov	[ebp-14h],eax
	cmp	edx,10h
	jc	4120A1h

l0041209F:
	mov	esi,[esi]

l004120A1:
	cmp	esi,eax
	jz	41213Ah

l004120A9:
	mov	edi,431B90h
	nop

l004120B0:
	cmp	edi,431B98h
	jz	4120FFh

l004120B8:
	mov	al,[esi]
	lea	ecx,[ebp-20h]
	mov	[ebp+8h],al
	push	dword ptr [ebp+8h]
	call	402DD0h
	mov	ecx,eax
	call	dword ptr [431140h]
	mov	cl,[edi]
	mov	bl,al
	mov	[ebp-10h],cl
	lea	ecx,[ebp-20h]
	push	dword ptr [ebp-10h]
	call	402DD0h
	mov	ecx,eax
	call	dword ptr [431140h]
	cmp	bl,al
	jnz	412107h

l004120EE:
	mov	eax,[ebp-14h]
	inc	esi
	inc	edi
	cmp	esi,eax
	jnz	4120B0h

l004120F7:
	cmp	edi,431B98h
	jnz	41213Ah

l004120FF:
	cmp	esi,eax
	jnz	41213Ah

l00412103:
	mov	bl,1h
	jmp	41213Ch

l00412107:
	mov	dword ptr [ebp-4h],2h
	mov	ecx,[ebp-1Ch]
	test	ecx,ecx
	jz	412126h

l00412115:
	mov	eax,[ecx]
	call	dword ptr [eax+8h]
	test	eax,eax
	jz	412126h

l0041211E:
	mov	edx,[eax]
	mov	ecx,eax
	push	1h
	call	dword ptr [edx]

l00412126:
	xor	al,al
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret

l0041213A:
	xor	bl,bl

l0041213C:
	mov	dword ptr [ebp-4h],3h
	mov	ecx,[ebp-1Ch]
	test	ecx,ecx
	jz	41215Bh

l0041214A:
	mov	eax,[ecx]
	call	dword ptr [eax+8h]
	test	eax,eax
	jz	41215Bh

l00412153:
	mov	edx,[eax]
	mov	ecx,eax
	push	1h
	call	dword ptr [edx]

l0041215B:
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
0041216F                                              CC                .

;; fn00412170: 00412170
;;   Called from:
;;     0040599F (in fn00404FB0)
fn00412170 proc
	push	ebp
	mov	ebp,esp
	and	esp,0F8h
	sub	esp,1Ch
	mov	eax,[43A008h]
	xor	eax,esp
	mov	[esp+18h],eax
	mov	eax,[esp+8h]
	push	esi
	mov	esi,ecx
	mov	dword ptr [esp+4h],431A0Ch
	mov	dword ptr [esp+8h],431A0Dh
	movq	xmm0,qword ptr [esp+4h]
	movq	qword ptr [esp+10h],xmm0
	mov	edx,[esi+14h]
	mov	[esp+18h],eax
	cmp	edx,10h
	jc	4121B5h

l004121B3:
	mov	ecx,[esi]

l004121B5:
	mov	eax,[esi+10h]
	add	eax,ecx
	mov	ecx,esi
	cmp	edx,10h
	jc	4121C3h

l004121C1:
	mov	ecx,[esi]

l004121C3:
	push	eax
	push	ecx
	lea	eax,[esp+0Ch]
	push	eax
	lea	ecx,[esp+1Ch]
	call	416080h
	mov	ecx,[eax]
	mov	eax,[eax+4h]
	cmp	ecx,eax
	jz	41220Eh

l004121DC:
	movq	xmm0,qword ptr [esp+10h]
	sub	esp,8h
	mov	edx,esp
	mov	[edx],ecx
	mov	ecx,esi
	mov	[edx+4h],eax
	push	dword ptr [esp+0Ch]
	mov	eax,[esp+24h]
	push	dword ptr [esp+10h]
	sub	esp,0Ch
	mov	edx,esp
	movq	qword ptr [edx],xmm0
	mov	[edx+8h],eax
	call	416DA0h
	add	esp,1Ch

l0041220E:
	mov	ecx,[esp+1Ch]
	pop	esi
	xor	ecx,esp
	call	427500h
	mov	esp,ebp
	pop	ebp
	ret
0041221E                                           CC CC               ..

;; fn00412220: 00412220
;;   Called from:
;;     00405B50 (in fn00404FB0)
fn00412220 proc
	push	ebp
	mov	ebp,esp
	sub	esp,8h
	cmp	dword ptr [edx+14h],10h
	push	ebx
	push	esi
	mov	ebx,ecx
	push	edi
	mov	[ebp-8h],ebx
	mov	edi,edx
	jc	412238h

l00412236:
	mov	edi,[edx]

l00412238:
	mov	esi,[ebp+8h]
	mov	ecx,[edx+10h]
	mov	[ebp-4h],ecx
	mov	eax,[esi+14h]
	mov	edx,[esi+10h]
	sub	eax,edx
	cmp	ecx,eax
	ja	4122BEh

l0041224D:
	cmp	dword ptr [esi+14h],10h
	lea	eax,[edx+ecx]
	mov	[esi+10h],eax
	mov	ebx,esi
	jc	41225Dh

l0041225B:
	mov	ebx,[esi]

l0041225D:
	lea	eax,[ecx+edi]
	cmp	eax,ebx
	jbe	412281h

l00412264:
	lea	eax,[ebx+edx]
	cmp	edi,eax
	ja	412281h

l0041226B:
	cmp	ebx,edi
	ja	412278h

l0041226F:
	mov	dword ptr [ebp+8h],0h
	jmp	412284h

l00412278:
	mov	eax,ebx
	sub	eax,edi
	mov	[ebp+8h],eax
	jmp	412284h

l00412281:
	mov	[ebp+8h],ecx

l00412284:
	lea	eax,[edx+1h]
	push	eax
	lea	eax,[ebx+ecx]
	push	ebx
	push	eax
	call	42D1C9h
	push	dword ptr [ebp+8h]
	push	edi
	push	ebx
	call	42D1CFh
	mov	ecx,[ebp-4h]
	mov	eax,ecx
	mov	edx,[ebp+8h]
	sub	eax,edx
	push	eax
	lea	eax,[edx+ecx]
	add	eax,edi
	push	eax
	lea	eax,[ebx+edx]
	push	eax
	call	42D1CFh
	mov	ebx,[ebp-8h]
	add	esp,24h
	jmp	4122D2h

l004122BE:
	push	ecx
	push	edi
	push	ecx
	mov	byte ptr [ebp+8h],0h
	push	dword ptr [ebp+8h]
	push	ecx
	mov	ecx,esi
	call	414760h
	mov	esi,eax

l004122D2:
	mov	dword ptr [ebx+10h],0h
	mov	eax,ebx
	mov	dword ptr [ebx+14h],0h
	movups	xmm0,[esi]
	pop	edi
	movups	[ebx],xmm0
	movq	xmm0,qword ptr [esi+10h]
	movq	qword ptr [ebx+10h],xmm0
	mov	dword ptr [esi+10h],0h
	mov	dword ptr [esi+14h],0Fh
	mov	byte ptr [esi],0h
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret
0041230A                               CC CC CC CC CC CC           ......

;; fn00412310: 00412310
;;   Called from:
;;     00408162 (in fn00407D10)
;;     004089C2 (in fn00408570)
fn00412310 proc
	push	ebp
	mov	ebp,esp
	sub	esp,14h
	mov	eax,[ebp+8h]
	push	ebx
	push	esi
	mov	esi,eax
	mov	[ebp-8h],eax
	push	edi
	mov	edi,ecx
	mov	eax,92492493h
	sub	esi,[edi]
	mov	ecx,[edi+4h]
	sub	ecx,[edi]
	imul	esi
	add	edx,esi
	sar	edx,4h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx
	mov	[ebp-4h],eax
	mov	eax,92492493h
	imul	ecx
	add	edx,ecx
	sar	edx,4h
	mov	ebx,edx
	shr	ebx,1Fh
	add	ebx,edx
	cmp	ebx,9249249h
	jz	4124DCh

l0041235F:
	mov	ecx,[edi+8h]
	mov	eax,92492493h
	sub	ecx,[edi]
	inc	ebx
	imul	ecx
	mov	eax,9249249h
	mov	[ebp-0Ch],ebx
	add	edx,ecx
	sar	edx,4h
	mov	ecx,edx
	shr	ecx,1Fh
	add	ecx,edx
	mov	edx,ecx
	shr	edx,1h
	sub	eax,edx
	cmp	ecx,eax
	jbe	41238Eh

l0041238A:
	mov	eax,ebx
	jmp	412396h

l0041238E:
	lea	eax,[edx+ecx]
	cmp	eax,ebx
	cmovc	eax,ebx

l00412396:
	lea	ecx,[0000h+eax*8]
	sub	ecx,eax
	shl	ecx,2h
	mov	[ebp-10h],ecx
	cmp	eax,9249249h
	jbe	4123B1h

l004123AC:
	or	ecx,0FFh
	jmp	4123B9h

l004123B1:
	cmp	ecx,1000h
	jc	4123E0h

l004123B9:
	lea	eax,[ecx+23h]
	or	edx,0FFh
	cmp	eax,ecx
	cmovbe	eax,edx

l004123C4:
	push	eax
	call	427511h
	add	esp,4h
	test	eax,eax
	jz	4124D6h

l004123D5:
	lea	esi,[eax+23h]
	and	esi,0E0h
	mov	[esi-4h],eax
	jmp	4123F3h

l004123E0:
	test	ecx,ecx
	jz	4123F1h

l004123E4:
	push	ecx
	call	427511h
	add	esp,4h
	mov	esi,eax
	jmp	4123F3h

l004123F1:
	xor	esi,esi

l004123F3:
	mov	ecx,[ebp-4h]
	xorps	xmm0,xmm0
	lea	eax,[0000h+ecx*8]
	sub	eax,ecx
	shl	eax,2h
	mov	[ebp-14h],eax
	add	eax,esi
	mov	[ebp-4h],eax
	movups	[eax],xmm0
	movq	qword ptr [eax+10h],xmm0
	mov	dword ptr [eax+18h],0h
	mov	dword ptr [eax+14h],0Fh
	mov	ecx,[edi]
	mov	edx,[edi+4h]
	mov	eax,[ebp-8h]
	push	ecx
	push	esi
	cmp	eax,edx
	jz	412448h

l00412431:
	mov	edx,eax
	call	414630h
	mov	eax,[ebp-4h]
	add	esp,4h
	mov	edx,[edi+4h]
	add	eax,1Ch
	mov	ecx,[ebp-8h]
	push	eax

l00412448:
	call	414630h
	mov	ecx,[edi]
	add	esp,8h
	test	ecx,ecx
	jz	4124AFh

l00412456:
	mov	edx,[edi+4h]
	push	ecx
	call	4133E0h
	mov	ecx,[edi+8h]
	mov	eax,92492493h
	mov	ebx,[edi]
	add	esp,4h
	sub	ecx,ebx
	imul	ecx
	add	edx,ecx
	sar	edx,4h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx
	lea	ecx,[0000h+eax*8]
	sub	ecx,eax
	shl	ecx,2h
	cmp	ecx,1000h
	jc	4124A2h

l00412490:
	mov	edx,[ebx-4h]
	add	ecx,23h
	sub	ebx,edx
	lea	eax,[ebx-4h]
	cmp	eax,1Fh
	ja	4124D6h

l004124A0:
	mov	ebx,edx

l004124A2:
	push	ecx
	push	ebx
	call	42763Fh
	mov	ebx,[ebp-0Ch]
	add	esp,8h

l004124AF:
	lea	eax,[0000h+ebx*8]
	mov	[edi],esi
	sub	eax,ebx
	lea	eax,[esi+eax*4]
	mov	[edi+4h],eax
	mov	eax,[ebp-10h]
	add	eax,esi
	mov	[edi+8h],eax
	mov	eax,[edi]
	add	eax,[ebp-14h]
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	4h

l004124D6:
	call	dword ptr [431290h]

l004124DC:
	call	403730h
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
	int	3h

;; fn004124F0: 004124F0
;;   Called from:
;;     00408E3E (in fn00408570)
;;     00408E3E (in fn00408DD0)
;;     00408EA6 (in fn00408E51)
;;     00408F0F (in fn00408E51)
;;     00409C68 (in fn00409BCD)
;;     00409CB6 (in fn00409BCD)
;;     00409FAE (in fn00409E70)
;;     00409FFD (in fn00409E70)
fn004124F0 proc
	push	ebp
	mov	ebp,esp
	sub	esp,0Ch
	mov	edx,[ebp+8h]
	mov	eax,2AAAAAABh
	push	ebx
	mov	ebx,ecx
	push	esi
	push	edi
	mov	edi,[ebx]
	sub	edx,edi
	mov	ecx,[ebx+4h]
	imul	edx
	sub	ecx,edi
	sar	edx,2h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx
	mov	[ebp-4h],eax
	mov	eax,2AAAAAABh
	imul	ecx
	sar	edx,2h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx
	mov	[ebp-8h],eax
	cmp	eax,0AAAAAAAh
	jz	412630h

;; fn0041253A: 0041253A
;;   Called from:
;;     00412534 (in fn004124F0)
;;     00412534 (in fn00412310)
fn0041253A proc
	mov	ecx,[ebx+8h]
	lea	esi,[eax+1h]
	sub	ecx,edi
	mov	eax,2AAAAAABh
	imul	ecx
	mov	eax,0AAAAAAAh
	sar	edx,2h
	mov	ecx,edx
	shr	ecx,1Fh
	add	ecx,edx
	mov	edx,ecx
	shr	edx,1h
	sub	eax,edx
	cmp	ecx,eax
	jbe	412566h

l00412562:
	mov	edi,esi
	jmp	41256Eh

l00412566:
	lea	edi,[edx+ecx]
	cmp	edi,esi
	cmovc	edi,esi

l0041256E:
	lea	ecx,[edi+edi*2]
	shl	ecx,3h
	cmp	edi,0AAAAAAAh
	jbe	412581h

l0041257C:
	or	ecx,0FFh
	jmp	412589h

l00412581:
	cmp	ecx,1000h
	jc	4125B2h

l00412589:
	lea	eax,[ecx+23h]
	or	edx,0FFh
	cmp	eax,ecx
	cmovbe	eax,edx

l00412594:
	push	eax
	call	427511h
	add	esp,4h
	test	eax,eax
	jz	4125ACh

l004125A1:
	lea	esi,[eax+23h]
	and	esi,0E0h
	mov	[esi-4h],eax
	jmp	4125C5h

l004125AC:
	call	dword ptr [431290h]

l004125B2:
	test	ecx,ecx
	jz	4125C3h

l004125B6:
	push	ecx
	call	427511h
	add	esp,4h
	mov	esi,eax
	jmp	4125C5h

l004125C3:
	xor	esi,esi

l004125C5:
	mov	eax,[ebp-4h]
	lea	eax,[eax+eax*2]
	shl	eax,3h
	mov	[ebp-0Ch],eax
	add	eax,esi
	mov	[ebp-4h],eax
	mov	dword ptr [eax+10h],0h
	mov	dword ptr [eax+14h],0Fh
	mov	byte ptr [eax],0h
	mov	ecx,[ebx]
	mov	edx,[ebx+4h]
	mov	eax,[ebp+8h]
	push	ecx
	push	esi
	cmp	eax,edx
	jz	41260Ch

l004125F5:
	mov	edx,eax
	call	403BA0h
	mov	eax,[ebp-4h]
	add	esp,4h
	mov	edx,[ebx+4h]
	add	eax,18h
	mov	ecx,[ebp+8h]
	push	eax

l0041260C:
	call	403BA0h
	mov	eax,[ebp-8h]
	add	esp,8h
	inc	eax
	mov	ecx,ebx
	push	edi
	push	eax
	push	esi
	call	403740h
	mov	eax,[ebx]
	add	eax,[ebp-0Ch]
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	4h

;; fn00412630: 00412630
;;   Called from:
;;     00412534 (in fn004124F0)
;;     00412534 (in fn00412310)
fn00412630 proc
	call	403730h
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

;; fn00412640: 00412640
;;   Called from:
;;     0040942D (in fn00408FF1)
fn00412640 proc
	push	ebp
	mov	ebp,esp
	sub	esp,10h
	push	ebx
	mov	ebx,[ebp+8h]
	push	esi
	push	edi
	mov	edi,ecx
	mov	[ebp-8h],ebx
	mov	edx,[edi]
	sub	ebx,edx
	mov	eax,[edi+4h]
	sub	eax,edx
	sar	ebx,2h
	sar	eax,2h
	cmp	eax,3FFFFFFFh
	jz	412798h

;; fn0041266B: 0041266B
;;   Called from:
;;     00412665 (in fn00412640)
;;     00412665 (in fn00412630)
fn0041266B proc
	mov	ecx,[edi+8h]
	lea	esi,[eax+1h]
	sub	ecx,edx
	mov	[ebp-0Ch],esi
	sar	ecx,2h
	mov	eax,3FFFFFFFh
	mov	edx,ecx
	shr	edx,1h
	sub	eax,edx
	cmp	ecx,eax
	jbe	41268Ch

l00412688:
	mov	eax,esi
	jmp	412694h

l0041268C:
	lea	eax,[edx+ecx]
	cmp	eax,esi
	cmovc	eax,esi

l00412694:
	lea	ecx,[0000h+eax*4]
	mov	[ebp-10h],ecx
	cmp	eax,3FFFFFFFh
	jbe	4126AAh

l004126A5:
	or	ecx,0FFh
	jmp	4126B2h

l004126AA:
	cmp	ecx,1000h
	jc	4126D9h

l004126B2:
	lea	eax,[ecx+23h]
	or	edx,0FFh
	cmp	eax,ecx
	cmovbe	eax,edx

l004126BD:
	push	eax
	call	427511h
	add	esp,4h
	test	eax,eax
	jz	412792h

l004126CE:
	lea	esi,[eax+23h]
	and	esi,0E0h
	mov	[esi-4h],eax
	jmp	4126ECh

l004126D9:
	test	ecx,ecx
	jz	4126EAh

l004126DD:
	push	ecx
	call	427511h
	add	esp,4h
	mov	esi,eax
	jmp	4126ECh

l004126EA:
	xor	esi,esi

l004126EC:
	mov	eax,[ebp+0Ch]
	lea	ecx,[0000h+ebx*4]
	mov	ebx,[ebp-8h]
	mov	[ebp-4h],ecx
	mov	eax,[eax]
	mov	[ecx+esi],eax
	mov	eax,[edi+4h]
	mov	ecx,[edi]
	cmp	ebx,eax
	jnz	41271Ch

l0041270A:
	sub	eax,ecx
	push	eax
	push	ecx
	push	esi
	call	42D1C9h
	mov	ebx,[ebp-4h]
	add	esp,0Ch
	jmp	412740h

l0041271C:
	mov	eax,ebx
	sub	eax,ecx
	push	eax
	push	ecx
	push	esi
	call	42D1C9h
	mov	eax,[edi+4h]
	sub	eax,ebx
	push	eax
	push	ebx
	mov	ebx,[ebp-4h]
	lea	eax,[ebx+4h]
	add	eax,esi
	push	eax
	call	42D1C9h
	add	esp,18h

l00412740:
	mov	eax,[edi]
	test	eax,eax
	jz	412772h

l00412746:
	mov	ecx,[edi+8h]
	sub	ecx,eax
	and	ecx,0FCh
	cmp	ecx,1000h
	jc	412768h

l00412756:
	mov	edx,[eax-4h]
	add	ecx,23h
	sub	eax,edx
	add	eax,0FCh
	cmp	eax,1Fh
	ja	412792h

l00412766:
	mov	eax,edx

l00412768:
	push	ecx
	push	eax
	call	42763Fh
	add	esp,8h

l00412772:
	mov	eax,[ebp-0Ch]
	mov	[edi],esi
	lea	eax,[esi+eax*4]
	mov	[edi+4h],eax
	mov	eax,[ebp-10h]
	add	eax,esi
	mov	[edi+8h],eax
	mov	eax,[edi]
	pop	edi
	pop	esi
	add	eax,ebx
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	8h

l00412792:
	call	dword ptr [431290h]

;; fn00412798: 00412798
;;   Called from:
;;     00412665 (in fn00412640)
;;     00412665 (in fn00412630)
;;     00412792 (in fn0041266B)
fn00412798 proc
	call	403730h
	int	3h
	int	3h
	int	3h

;; fn004127A0: 004127A0
;;   Called from:
;;     0040953A (in fn00408FF1)
;;     0041A870 (in fn0041A760)
fn004127A0 proc
	push	ebp
	mov	ebp,esp
	sub	esp,8h
	mov	edx,[ebp+8h]
	mov	eax,2AAAAAABh
	push	ebx
	mov	ebx,ecx
	push	esi
	push	edi
	mov	edi,[ebx]
	sub	edx,edi
	mov	ecx,[ebx+4h]
	imul	edx
	sub	ecx,edi
	sar	edx,2h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx
	mov	[ebp-4h],eax
	mov	eax,2AAAAAABh
	imul	ecx
	sar	edx,2h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx
	mov	[ebp-8h],eax
	cmp	eax,0AAAAAAAh
	jz	412902h

;; fn004127EA: 004127EA
;;   Called from:
;;     004127E4 (in fn004127A0)
;;     004127E4 (in fn00412798)
fn004127EA proc
	mov	ecx,[ebx+8h]
	lea	esi,[eax+1h]
	sub	ecx,edi
	mov	eax,2AAAAAABh
	imul	ecx
	mov	eax,0AAAAAAAh
	sar	edx,2h
	mov	ecx,edx
	shr	ecx,1Fh
	add	ecx,edx
	mov	edx,ecx
	shr	edx,1h
	sub	eax,edx
	cmp	ecx,eax
	jbe	412816h

l00412812:
	mov	edi,esi
	jmp	41281Eh

l00412816:
	lea	edi,[edx+ecx]
	cmp	edi,esi
	cmovc	edi,esi

l0041281E:
	lea	ecx,[edi+edi*2]
	shl	ecx,3h
	cmp	edi,0AAAAAAAh
	jbe	412831h

l0041282C:
	or	ecx,0FFh
	jmp	412839h

l00412831:
	cmp	ecx,1000h
	jc	412862h

l00412839:
	lea	eax,[ecx+23h]
	or	edx,0FFh
	cmp	eax,ecx
	cmovbe	eax,edx

l00412844:
	push	eax
	call	427511h
	add	esp,4h
	test	eax,eax
	jz	41285Ch

l00412851:
	lea	esi,[eax+23h]
	and	esi,0E0h
	mov	[esi-4h],eax
	jmp	412875h

l0041285C:
	call	dword ptr [431290h]

l00412862:
	test	ecx,ecx
	jz	412873h

l00412866:
	push	ecx
	call	427511h
	add	esp,4h
	mov	esi,eax
	jmp	412875h

l00412873:
	xor	esi,esi

l00412875:
	mov	eax,[ebp-4h]
	lea	ecx,[eax+eax*2]
	mov	eax,[ebp+0Ch]
	shl	ecx,3h
	mov	[ebp-4h],ecx
	mov	dword ptr [ecx+esi+10h],0h
	mov	dword ptr [ecx+esi+14h],0h
	movups	xmm0,[eax]
	movups	[ecx+esi],xmm0
	movq	xmm0,qword ptr [eax+10h]
	movq	qword ptr [ecx+esi+10h],xmm0
	mov	dword ptr [eax+10h],0h
	mov	dword ptr [eax+14h],0Fh
	mov	byte ptr [eax],0h
	mov	ecx,[ebx]
	mov	edx,[ebx+4h]
	mov	eax,[ebp+8h]
	push	ecx
	push	esi
	cmp	eax,edx
	jz	4128DEh

l004128C5:
	mov	edx,eax
	call	403BA0h
	mov	eax,[ebp-4h]
	add	esp,4h
	mov	edx,[ebx+4h]
	add	eax,18h
	mov	ecx,[ebp+8h]
	add	eax,esi
	push	eax

l004128DE:
	call	403BA0h
	mov	eax,[ebp-8h]
	add	esp,8h
	inc	eax
	mov	ecx,ebx
	push	edi
	push	eax
	push	esi
	call	403740h
	mov	eax,[ebx]
	add	eax,[ebp-4h]
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	8h

;; fn00412902: 00412902
;;   Called from:
;;     004127E4 (in fn004127A0)
;;     004127E4 (in fn00412798)
fn00412902 proc
	call	403730h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h

;; fn00412910: 00412910
;;   Called from:
;;     00409704 (in fn00408FF1)
;;     004098E3 (in fn00408FF1)
fn00412910 proc
	push	ebp
	mov	ebp,esp
	sub	esp,10h
	mov	eax,[ebp+8h]
	mov	edx,eax
	push	ebx
	push	esi
	push	edi
	mov	edi,ecx
	mov	[ebp-8h],eax
	mov	eax,2AAAAAABh
	mov	esi,[edi]
	sub	edx,esi
	mov	ecx,[edi+4h]
	imul	edx
	sub	ecx,esi
	sar	edx,3h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx
	mov	[ebp-4h],eax
	mov	eax,2AAAAAABh
	imul	ecx
	sar	edx,3h
	mov	ebx,edx
	shr	ebx,1Fh
	add	ebx,edx
	cmp	ebx,5555555h
	jz	412AD1h

;; fn0041295D: 0041295D
;;   Called from:
;;     00412957 (in fn00412910)
;;     00412957 (in fn00412902)
fn0041295D proc
	mov	ecx,[edi+8h]
	mov	eax,2AAAAAABh
	sub	ecx,esi
	inc	ebx
	imul	ecx
	mov	eax,5555555h
	mov	[ebp-0Ch],ebx
	sar	edx,3h
	mov	ecx,edx
	shr	ecx,1Fh
	add	ecx,edx
	mov	edx,ecx
	shr	edx,1h
	sub	eax,edx
	cmp	ecx,eax
	jbe	41298Ah

l00412986:
	mov	eax,ebx
	jmp	412992h

l0041298A:
	lea	eax,[edx+ecx]
	cmp	eax,ebx
	cmovc	eax,ebx

l00412992:
	lea	ecx,[eax+eax*2]
	shl	ecx,4h
	mov	[ebp-10h],ecx
	cmp	eax,5555555h
	jbe	4129A7h

l004129A2:
	or	ecx,0FFh
	jmp	4129AFh

l004129A7:
	cmp	ecx,1000h
	jc	4129D6h

l004129AF:
	lea	eax,[ecx+23h]
	or	edx,0FFh
	cmp	eax,ecx
	cmovbe	eax,edx

l004129BA:
	push	eax
	call	427511h
	add	esp,4h
	test	eax,eax
	jz	412ACBh

l004129CB:
	lea	esi,[eax+23h]
	and	esi,0E0h
	mov	[esi-4h],eax
	jmp	4129E9h

l004129D6:
	test	ecx,ecx
	jz	4129E7h

l004129DA:
	push	ecx
	call	427511h
	add	esp,4h
	mov	esi,eax
	jmp	4129E9h

l004129E7:
	xor	esi,esi

l004129E9:
	mov	eax,[ebp-4h]
	push	30h
	push	0h
	lea	eax,[eax+eax*2]
	shl	eax,4h
	mov	[ebp-4h],eax
	add	eax,esi
	push	eax
	call	42D1C3h
	mov	eax,[ebp-4h]
	add	esp,0Ch
	add	eax,esi
	mov	dword ptr [eax+14h],0Fh
	mov	dword ptr [eax+28h],0h
	mov	dword ptr [eax+2Ch],0Fh
	mov	byte ptr [eax+18h],0h
	mov	ecx,[edi]
	mov	edx,[edi+4h]
	mov	eax,[ebp-8h]
	push	ecx
	push	esi
	cmp	eax,edx
	jz	412A49h

l00412A30:
	mov	edx,eax
	call	4146B0h
	mov	eax,[ebp-4h]
	add	esp,4h
	mov	edx,[edi+4h]
	add	eax,30h
	mov	ecx,[ebp-8h]
	add	eax,esi
	push	eax

l00412A49:
	call	4146B0h
	mov	ecx,[edi]
	add	esp,8h
	test	ecx,ecx
	jz	412AA8h

l00412A57:
	mov	edx,[edi+4h]
	push	ecx
	call	403460h
	mov	ecx,[edi+8h]
	mov	eax,2AAAAAABh
	mov	ebx,[edi]
	add	esp,4h
	sub	ecx,ebx
	imul	ecx
	sar	edx,3h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx
	lea	ecx,[eax+eax*2]
	shl	ecx,4h
	cmp	ecx,1000h
	jc	412A9Bh

l00412A89:
	mov	edx,[ebx-4h]
	add	ecx,23h
	sub	ebx,edx
	lea	eax,[ebx-4h]
	cmp	eax,1Fh
	ja	412ACBh

l00412A99:
	mov	ebx,edx

l00412A9B:
	push	ecx
	push	ebx
	call	42763Fh
	mov	ebx,[ebp-0Ch]
	add	esp,8h

l00412AA8:
	lea	eax,[ebx+ebx*2]
	mov	[edi],esi
	shl	eax,4h
	add	eax,esi
	mov	[edi+4h],eax
	mov	eax,[ebp-10h]
	add	eax,esi
	mov	[edi+8h],eax
	mov	eax,[edi]
	add	eax,[ebp-4h]
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	4h

l00412ACB:
	call	dword ptr [431290h]

;; fn00412AD1: 00412AD1
;;   Called from:
;;     00412957 (in fn00412910)
;;     00412957 (in fn00412902)
;;     00412ACB (in fn0041295D)
fn00412AD1 proc
	call	403730h
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

;; fn00412AE0: 00412AE0
;;   Called from:
;;     00409BD1 (in fn00409BCD)
fn00412AE0 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42E9D9h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,38h
	mov	eax,[43A008h]
	xor	eax,ebp
	mov	[ebp-14h],eax
	push	ebx
	push	esi
	push	edi
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	[ebp-10h],esp
	mov	ebx,ecx
	mov	eax,[ebp+8h]
	mov	esi,eax
	mov	edi,[ebx]
	sub	esi,edi
	mov	ecx,[ebx+4h]
	mov	[ebp-3Ch],eax
	sub	ecx,edi
	mov	eax,88888889h
	imul	esi
	mov	eax,88888889h
	add	edx,esi
	sar	edx,5h
	mov	esi,edx
	shr	esi,1Fh
	add	esi,edx
	imul	ecx
	add	edx,ecx
	sar	edx,5h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx
	cmp	eax,4444444h
	jz	412DD4h

;; fn00412B52: 00412B52
;;   Called from:
;;     00412B4C (in fn00412AE0)
;;     00412B4C (in fn00412AD1)
fn00412B52 proc
	mov	ecx,[ebx+8h]
	inc	eax
	sub	ecx,edi
	mov	[ebp-2Ch],eax
	mov	eax,88888889h
	imul	ecx
	mov	eax,4444444h
	add	edx,ecx
	sar	edx,5h
	mov	ecx,edx
	shr	ecx,1Fh
	add	ecx,edx
	mov	edx,ecx
	shr	edx,1h
	sub	eax,edx
	cmp	ecx,eax
	jbe	412B87h

l00412B7D:
	mov	ecx,[ebp-2Ch]
	mov	eax,ecx
	mov	[ebp-34h],ecx
	jmp	412B94h

l00412B87:
	lea	eax,[edx+ecx]
	cmp	eax,[ebp-2Ch]
	cmovc	eax,[ebp-2Ch]

l00412B91:
	mov	[ebp-34h],eax

l00412B94:
	mov	ecx,eax
	shl	ecx,4h
	sub	ecx,eax
	shl	ecx,2h
	cmp	eax,4444444h
	jbe	412BAAh

l00412BA5:
	or	ecx,0FFh
	jmp	412BB2h

l00412BAA:
	cmp	ecx,1000h
	jc	412BDBh

l00412BB2:
	lea	eax,[ecx+23h]
	or	edx,0FFh
	cmp	eax,ecx
	cmovbe	eax,edx

l00412BBD:
	push	eax
	call	427511h
	add	esp,4h
	test	eax,eax
	jz	412BD5h

l00412BCA:
	lea	edi,[eax+23h]
	and	edi,0E0h
	mov	[edi-4h],eax
	jmp	412BEEh

l00412BD5:
	call	dword ptr [431290h]

l00412BDB:
	test	ecx,ecx
	jz	412BECh

l00412BDF:
	push	ecx
	call	427511h
	add	esp,4h
	mov	edi,eax
	jmp	412BEEh

l00412BEC:
	xor	edi,edi

l00412BEE:
	mov	eax,esi
	mov	dword ptr [ebp-4h],0h
	shl	eax,4h
	sub	eax,esi
	mov	[ebp-24h],edi
	shl	eax,2h
	lea	esi,[eax+edi]
	mov	[ebp-40h],eax
	lea	eax,[esi+3Ch]
	mov	dword ptr [esi+10h],0h
	mov	dword ptr [esi+14h],0Fh
	mov	[ebp-44h],edi
	mov	[ebp-38h],eax
	mov	[ebp-30h],eax
	mov	[ebp-28h],esi
	mov	byte ptr [esi],0h
	mov	dword ptr [esi+18h],0h
	mov	dword ptr [esi+1Ch],0h
	mov	dword ptr [esi+20h],0h
	mov	dword ptr [esi+34h],0h
	mov	dword ptr [esi+38h],0Fh
	mov	byte ptr [esi+24h],0h
	push	0h
	push	4317A9h
	mov	ecx,esi
	mov	byte ptr [ebp-4h],3h
	call	402A70h
	push	0h
	push	4317A9h
	lea	ecx,[esi+24h]
	call	402A70h
	mov	byte ptr [ebp-4h],0h
	mov	eax,[ebx+4h]
	mov	[ebp-30h],esi
	mov	esi,[ebp-3Ch]
	mov	[ebp-28h],eax
	cmp	esi,eax
	jnz	412CE6h

l00412C84:
	mov	esi,[ebp-24h]
	xorps	xmm0,xmm0
	mov	edi,[ebx]
	movq	qword ptr [ebp-20h],xmm0
	mov	dword ptr [ebp-18h],0h
	mov	[ebp-20h],esi
	mov	[ebp-1Ch],esi
	mov	[ebp-18h],ebx
	mov	byte ptr [ebp-4h],4h

l00412CA5:
	cmp	edi,eax
	jz	412D04h

l00412CA9:
	push	edi
	mov	ecx,esi
	mov	[ebp-3Ch],esi
	call	4028D0h
	lea	eax,[edi+18h]
	mov	byte ptr [ebp-4h],5h
	push	eax
	lea	ecx,[esi+18h]
	call	418780h
	lea	eax,[edi+24h]
	mov	byte ptr [ebp-4h],6h
	push	eax
	lea	ecx,[esi+24h]
	call	4028D0h
	add	esi,3Ch
	mov	byte ptr [ebp-4h],4h
	mov	eax,[ebp-28h]
	add	edi,3Ch
	mov	[ebp-1Ch],esi
	jmp	412CA5h

l00412CE6:
	push	edi
	push	esi
	push	dword ptr [ebx]
	mov	ecx,ebx
	call	413980h
	push	dword ptr [ebp-38h]
	mov	ecx,ebx
	mov	[ebp-30h],edi
	push	dword ptr [ebx+4h]
	push	esi
	call	413980h
	jmp	412D07h

l00412D04:
	mov	edi,[ebp-24h]

l00412D07:
	mov	esi,[ebx]
	test	esi,esi
	jz	412D72h

l00412D0D:
	mov	eax,[ebx+4h]
	mov	[ebp-28h],eax
	cmp	esi,eax
	jz	412D28h

l00412D17:
	mov	ecx,esi
	call	4014C0h
	add	esi,3Ch
	cmp	esi,[ebp-28h]
	jnz	412D17h

l00412D26:
	mov	esi,[ebx]

l00412D28:
	mov	ecx,[ebx+8h]
	mov	eax,88888889h
	sub	ecx,esi
	imul	ecx
	add	edx,ecx
	sar	edx,5h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx
	mov	ecx,eax
	shl	ecx,4h
	sub	ecx,eax
	shl	ecx,2h
	cmp	ecx,1000h
	jc	412D68h

l00412D52:
	mov	edx,[esi-4h]
	add	ecx,23h
	sub	esi,edx
	lea	eax,[esi-4h]
	cmp	eax,1Fh
	ja	412BD5h

l00412D66:
	mov	esi,edx

l00412D68:
	push	ecx
	push	esi
	call	42763Fh
	add	esp,8h

l00412D72:
	mov	eax,[ebp-2Ch]
	shl	eax,4h
	sub	eax,[ebp-2Ch]
	mov	[ebx],edi
	lea	eax,[edi+eax*4]
	mov	[ebx+4h],eax
	mov	eax,[ebp-34h]
	shl	eax,4h
	sub	eax,[ebp-34h]
	lea	eax,[edi+eax*4]
	mov	[ebx+8h],eax
	mov	eax,[ebx]
	add	eax,[ebp-40h]
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	ecx,[ebp-14h]
	xor	ecx,ebp
	call	427500h
	mov	esp,ebp
	pop	ebp
	ret	4h
00412DB5                FF 75 C8 FF 75 D0 E8 30 FC FE FF      .u..u..0...
00412DC0 FF 75 CC FF 75 BC E8 B5 FE FE FF 6A 00 6A 00 E8 .u..u......j.j..
00412DD0 E3 A3 01 00                                     ....            

;; fn00412DD4: 00412DD4
;;   Called from:
;;     00412B4C (in fn00412AE0)
;;     00412B4C (in fn00412AD1)
fn00412DD4 proc
	call	403730h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h

;; fn00412DE0: 00412DE0
;;   Called from:
;;     0040A5CF (in fn00409E70)
fn00412DE0 proc
	push	ebp
	mov	ebp,esp
	and	esp,0F8h
	sub	esp,24h
	mov	eax,[43A008h]
	xor	eax,esp
	mov	[esp+20h],eax
	push	ebx
	push	esi
	mov	esi,[ebp+8h]
	push	edi
	mov	edi,ecx
	mov	ecx,esi
	mov	ebx,[esi+14h]
	cmp	ebx,10h
	jc	412E08h

;; fn00412E06: 00412E06
;;   Called from:
;;     00412E04 (in fn00412DE0)
;;     00412E04 (in fn00412DD4)
fn00412E06 proc
	mov	ecx,[esi]

;; fn00412E08: 00412E08
;;   Called from:
;;     00412E04 (in fn00412DE0)
;;     00412E04 (in fn00412DD4)
;;     00412E06 (in fn00412E06)
fn00412E08 proc
	mov	eax,[esi+10h]
	add	eax,ecx
	mov	[esp+10h],eax
	cmp	ebx,10h
	jc	412E18h

l00412E16:
	mov	esi,[esi]

l00412E18:
	mov	ebx,[edx+14h]
	mov	ecx,edx
	cmp	ebx,10h
	jc	412E24h

l00412E22:
	mov	ecx,[edx]

l00412E24:
	mov	eax,[edx+10h]
	add	eax,ecx
	cmp	ebx,10h
	jc	412E30h

l00412E2E:
	mov	edx,[edx]

l00412E30:
	mov	[esp+14h],edx
	mov	ecx,edi
	mov	edx,[edi+14h]
	mov	[esp+18h],eax
	movq	xmm0,qword ptr [esp+14h]
	mov	eax,[esp+1Ch]
	movq	qword ptr [esp+20h],xmm0
	mov	[esp+28h],eax
	cmp	edx,10h
	jc	412E58h

l00412E56:
	mov	ecx,[edi]

l00412E58:
	mov	eax,[edi+10h]
	add	eax,ecx
	mov	ecx,edi
	cmp	edx,10h
	jc	412E66h

l00412E64:
	mov	ecx,[edi]

l00412E66:
	push	eax
	push	ecx
	lea	eax,[esp+1Ch]
	push	eax
	lea	ecx,[esp+2Ch]
	call	4160F0h
	mov	ecx,[eax]
	mov	eax,[eax+4h]
	cmp	ecx,eax
	jz	412EB1h

l00412E7F:
	mov	ebx,[esp+10h]
	movq	xmm0,qword ptr [esp+20h]
	push	ebx
	push	esi
	sub	esp,8h
	mov	edx,esp
	push	ebx
	push	esi
	mov	[edx],ecx
	sub	esp,0Ch
	mov	[edx+4h],eax
	mov	ecx,edi
	mov	eax,[esp+4Ch]
	mov	edx,esp
	movq	qword ptr [edx],xmm0
	mov	[edx+8h],eax
	call	4170C0h
	add	esp,24h

l00412EB1:
	mov	ecx,[esp+2Ch]
	pop	edi
	pop	esi
	pop	ebx
	xor	ecx,esp
	call	427500h
	mov	esp,ebp
	pop	ebp
	ret
00412EC3          CC CC CC CC CC CC CC CC CC CC CC CC CC    .............

;; fn00412ED0: 00412ED0
;;   Called from:
;;     0040FBCA (in fn0040FBC0)
;;     00411038 (in fn00410F60)
fn00412ED0 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42DC11h
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
	mov	ebx,ecx
	push	0h
	lea	ecx,[ebp-14h]
	call	dword ptr [4311B4h]
	mov	dword ptr [ebp-4h],0h
	mov	eax,[43B114h]
	mov	ecx,[431130h]
	mov	[ebp-1Ch],eax
	call	dword ptr [43113Ch]
	mov	edi,eax
	mov	eax,[ebx+4h]
	cmp	edi,[eax+0Ch]
	jnc	412F39h

l00412F2D:
	mov	ecx,[eax+8h]
	mov	esi,[ecx+edi*4]
	test	esi,esi
	jnz	412F93h

l00412F37:
	jmp	412F3Bh

l00412F39:
	xor	esi,esi

l00412F3B:
	cmp	byte ptr [eax+14h],0h
	jz	412F52h

l00412F41:
	call	dword ptr [4311ACh]
	cmp	edi,[eax+0Ch]
	jnc	412F56h

l00412F4C:
	mov	eax,[eax+8h]
	mov	esi,[eax+edi*4]

l00412F52:
	test	esi,esi
	jnz	412F93h

l00412F56:
	mov	esi,[ebp-1Ch]
	test	esi,esi
	jnz	412F93h

l00412F5D:
	lea	eax,[ebp-1Ch]
	push	ebx
	push	eax
	call	dword ptr [431120h]
	add	esp,8h
	cmp	eax,0FFh
	jz	412FBAh

l00412F70:
	mov	esi,[ebp-1Ch]
	mov	[ebp-18h],esi
	push	esi
	mov	byte ptr [ebp-4h],1h
	call	42749Eh
	mov	eax,[esi]
	add	esp,4h
	mov	ecx,esi
	call	dword ptr [eax+4h]
	mov	esi,[ebp-1Ch]
	mov	[43B114h],esi

l00412F93:
	lea	ecx,[ebp-14h]
	call	dword ptr [4311B8h]
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
	ret

l00412FBA:
	lea	ecx,[ebp-28h]
	call	4013E0h
	push	437AD8h
	lea	eax,[ebp-28h]
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
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h

;; fn00412FE0: 00412FE0
;;   Called from:
;;     00407DE5 (in fn00407D10)
;;     00407E1B (in fn00407D10)
;;     00407E79 (in fn00407D10)
;;     00407EAF (in fn00407D10)
;;     00407F00 (in fn00407D10)
;;     00407FDB (in fn00407D10)
;;     0040803F (in fn00407D10)
;;     00408111 (in fn00407D10)
;;     004083A6 (in fn00407D10)
;;     004083DC (in fn00407D10)
;;     0040848E (in fn00407D10)
;;     00408645 (in fn00408570)
;;     0040867B (in fn00408570)
;;     004086D9 (in fn00408570)
;;     0040870F (in fn00408570)
;;     00408760 (in fn00408570)
;;     0040883B (in fn00408570)
;;     0040889F (in fn00408570)
;;     00408971 (in fn00408570)
;;     00408C06 (in fn00408570)
;;     00408C3C (in fn00408570)
;;     00408CEE (in fn00408570)
;;     00408F91 (in fn00408E51)
;;     00408FDF (in fn00408E51)
;;     00409D4B (in fn00409BCD)
;;     00409DC9 (in fn00409BCD)
;;     0040A092 (in fn00409E70)
;;     0041022B (in fn00410120)
;;     00419839 (in fn004197A0)
;;     0041A545 (in fn0041A350)
fn00412FE0 proc
	push	ebp
	mov	ebp,esp
	sub	esp,8h
	push	ebx
	mov	ebx,ecx
	mov	ecx,7FFFFFFFh
	mov	eax,ecx
	push	esi
	push	edi
	mov	edx,[ebx+10h]
	sub	eax,edx
	mov	[ebp-4h],edx
	cmp	eax,1h
	jc	41310Eh

;; fn00413003: 00413003
;;   Called from:
;;     00412FFD (in fn00412FE0)
;;     00412FFD (in fn00412ED0)
fn00413003 proc
	mov	esi,[ebx+14h]
	lea	edi,[edx+1h]
	or	edi,0Fh
	mov	[ebp-8h],esi
	cmp	edi,ecx
	jbe	413017h

l00413013:
	mov	edi,ecx
	jmp	41302Fh

l00413017:
	mov	eax,esi
	shr	eax,1h
	sub	ecx,eax
	cmp	esi,ecx
	jbe	413028h

l00413021:
	mov	edi,7FFFFFFFh
	jmp	41302Fh

l00413028:
	add	eax,esi
	cmp	edi,eax
	cmovc	edi,eax

l0041302F:
	xor	ecx,ecx
	mov	eax,edi
	add	eax,1h
	setc	cl
	neg	ecx
	or	ecx,eax
	cmp	ecx,1000h
	jc	41306Fh

l00413045:
	lea	eax,[ecx+23h]
	or	edx,0FFh
	cmp	eax,ecx
	cmovbe	eax,edx

l00413050:
	push	eax
	call	427511h
	add	esp,4h
	test	eax,eax
	jz	4130E8h

l00413061:
	mov	edx,[ebp-4h]
	lea	esi,[eax+23h]
	and	esi,0E0h
	mov	[esi-4h],eax
	jmp	413085h

l0041306F:
	test	ecx,ecx
	jz	413083h

l00413073:
	push	ecx
	call	427511h
	mov	edx,[ebp-4h]
	add	esp,4h
	mov	esi,eax
	jmp	413085h

l00413083:
	xor	esi,esi

l00413085:
	cmp	dword ptr [ebp-8h],10h
	lea	eax,[edx+1h]
	mov	[ebx+14h],edi
	lea	edi,[esi+edx]
	mov	[ebx+10h],eax
	mov	[ebp-4h],edi
	push	edx
	jc	4130EEh

l0041309B:
	mov	edi,[ebx]
	push	edi
	push	esi
	call	42D1CFh
	mov	ecx,[ebp-4h]
	add	esp,0Ch
	mov	al,[ebp+10h]
	mov	[ecx],al
	mov	byte ptr [ecx+1h],0h
	mov	ecx,[ebp-8h]
	inc	ecx
	cmp	ecx,1000h
	jc	4130D1h

l004130BF:
	mov	edx,[edi-4h]
	add	ecx,23h
	sub	edi,edx
	lea	eax,[edi-4h]
	cmp	eax,1Fh
	ja	4130E8h

l004130CF:
	mov	edi,edx

l004130D1:
	push	ecx
	push	edi
	call	42763Fh
	add	esp,8h
	mov	[ebx],esi
	mov	eax,ebx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	0Ch

l004130E8:
	call	dword ptr [431290h]

l004130EE:
	push	ebx
	push	esi
	call	42D1CFh
	mov	cl,[ebp+10h]
	add	esp,0Ch
	mov	[edi],cl
	mov	eax,ebx
	mov	byte ptr [edi+1h],0h
	mov	[ebx],esi
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	0Ch

;; fn0041310E: 0041310E
;;   Called from:
;;     00412FFD (in fn00412FE0)
;;     00412FFD (in fn00412ED0)
fn0041310E proc
	call	403860h
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

;; fn00413120: 00413120
;;   Called from:
;;     0040EC9A (in fn0040EB40)
;;     004142EB (in fn00414126)
;;     00417C7C (in fn00417731)
;;     00418D4E (in fn00418C30)
;;     00418D9F (in fn00418C30)
;;     00418E44 (in fn00418C30)
;;     00418EB7 (in fn00418C30)
fn00413120 proc
	push	ebp
	mov	ebp,esp
	sub	esp,10h
	push	ebx
	mov	ebx,ecx
	mov	ecx,7FFFFFFFh
	mov	eax,ecx
	push	esi
	mov	esi,[ebp+8h]
	mov	edx,[ebx+10h]
	sub	eax,edx
	mov	[ebp-4h],edx
	push	edi
	cmp	eax,esi
	jc	413275h

;; fn00413145: 00413145
;;   Called from:
;;     0041313F (in fn00413120)
;;     0041313F (in fn0041310E)
fn00413145 proc
	lea	eax,[edx+esi]
	mov	esi,[ebx+14h]
	mov	edi,eax
	mov	[ebp-8h],eax
	or	edi,0Fh
	mov	[ebp-0Ch],esi
	cmp	edi,ecx
	jbe	41315Eh

l0041315A:
	mov	edi,ecx
	jmp	413176h

l0041315E:
	mov	eax,esi
	shr	eax,1h
	sub	ecx,eax
	cmp	esi,ecx
	jbe	41316Fh

l00413168:
	mov	edi,7FFFFFFFh
	jmp	413176h

l0041316F:
	add	eax,esi
	cmp	edi,eax
	cmovc	edi,eax

l00413176:
	xor	ecx,ecx
	mov	eax,edi
	add	eax,1h
	setc	cl
	neg	ecx
	or	ecx,eax
	cmp	ecx,1000h
	jc	4131B6h

l0041318C:
	lea	eax,[ecx+23h]
	or	edx,0FFh
	cmp	eax,ecx
	cmovbe	eax,edx

l00413197:
	push	eax
	call	427511h
	add	esp,4h
	test	eax,eax
	jz	413246h

l004131A8:
	mov	edx,[ebp-4h]
	lea	esi,[eax+23h]
	and	esi,0E0h
	mov	[esi-4h],eax
	jmp	4131CCh

l004131B6:
	test	ecx,ecx
	jz	4131CAh

l004131BA:
	push	ecx
	call	427511h
	mov	edx,[ebp-4h]
	add	esp,4h
	mov	esi,eax
	jmp	4131CCh

l004131CA:
	xor	esi,esi

l004131CC:
	mov	eax,[ebp-8h]
	mov	[ebx+10h],eax
	movsx	eax,byte ptr [ebp+14h]
	mov	[ebp-4h],eax
	mov	eax,[ebp+10h]
	mov	[ebx+14h],edi
	lea	edi,[esi+edx]
	add	eax,edi
	mov	[ebp-10h],edi
	cmp	dword ptr [ebp-0Ch],10h
	mov	[ebp-8h],eax
	push	edx
	jc	41324Ch

l004131F1:
	mov	edi,[ebx]
	push	edi
	push	esi
	call	42D1CFh
	push	dword ptr [ebp+10h]
	push	dword ptr [ebp-4h]
	push	dword ptr [ebp-10h]
	call	42D1C3h
	mov	eax,[ebp-8h]
	add	esp,18h
	mov	ecx,[ebp-0Ch]
	inc	ecx
	mov	byte ptr [eax],0h
	cmp	ecx,1000h
	jc	41322Fh

l0041321D:
	mov	edx,[edi-4h]
	add	ecx,23h
	sub	edi,edx
	lea	eax,[edi-4h]
	cmp	eax,1Fh
	ja	413246h

l0041322D:
	mov	edi,edx

l0041322F:
	push	ecx
	push	edi
	call	42763Fh
	add	esp,8h
	mov	[ebx],esi
	mov	eax,ebx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	10h

l00413246:
	call	dword ptr [431290h]

l0041324C:
	push	ebx
	push	esi
	call	42D1CFh
	push	dword ptr [ebp+10h]
	push	dword ptr [ebp-4h]
	push	edi
	call	42D1C3h
	mov	eax,[ebp-8h]
	add	esp,18h
	mov	byte ptr [eax],0h
	mov	eax,ebx
	pop	edi
	mov	[ebx],esi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	10h

;; fn00413275: 00413275
;;   Called from:
;;     0041313F (in fn00413120)
;;     0041313F (in fn0041310E)
fn00413275 proc
	call	403860h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h

;; fn00413280: 00413280
;;   Called from:
;;     0040ECEE (in fn0040EB40)
;;     00410D93 (in fn00410CF0)
;;     004141D9 (in fn00414126)
;;     00414261 (in fn00414126)
;;     00414343 (in fn00414126)
;;     00417CF3 (in fn00417731)
;;     00418DE9 (in fn00418C30)
;;     00418F05 (in fn00418C30)
fn00413280 proc
	push	ebp
	mov	ebp,esp
	sub	esp,10h
	mov	eax,[ebp+10h]
	push	ebx
	mov	ebx,ecx
	mov	[ebp-10h],eax
	mov	ecx,7FFFFFFFh
	mov	eax,ecx
	push	esi
	mov	edx,[ebx+10h]
	sub	eax,edx
	mov	esi,[ebp+8h]
	mov	[ebp-4h],edx
	push	edi
	cmp	eax,esi
	jc	4133D4h

;; fn004132AB: 004132AB
;;   Called from:
;;     004132A5 (in fn00413280)
;;     004132A5 (in fn00413275)
fn004132AB proc
	mov	edi,[ebx+14h]
	lea	eax,[edx+esi]
	mov	esi,eax
	mov	[ebp-8h],eax
	or	esi,0Fh
	mov	[ebp-0Ch],edi
	cmp	esi,ecx
	jbe	4132C4h

l004132C0:
	mov	esi,ecx
	jmp	4132DCh

l004132C4:
	mov	eax,edi
	shr	eax,1h
	sub	ecx,eax
	cmp	edi,ecx
	jbe	4132D5h

l004132CE:
	mov	esi,7FFFFFFFh
	jmp	4132DCh

l004132D5:
	add	eax,edi
	cmp	esi,eax
	cmovc	esi,eax

l004132DC:
	xor	ecx,ecx
	mov	eax,esi
	add	eax,1h
	setc	cl
	neg	ecx
	or	ecx,eax
	cmp	ecx,1000h
	jc	41331Ch

l004132F2:
	lea	eax,[ecx+23h]
	or	edx,0FFh
	cmp	eax,ecx
	cmovbe	eax,edx

l004132FD:
	push	eax
	call	427511h
	add	esp,4h
	test	eax,eax
	jz	4133A5h

l0041330E:
	mov	edx,[ebp-4h]
	lea	edi,[eax+23h]
	and	edi,0E0h
	mov	[edi-4h],eax
	jmp	413332h

l0041331C:
	test	ecx,ecx
	jz	413330h

l00413320:
	push	ecx
	call	427511h
	mov	edx,[ebp-4h]
	add	esp,4h
	mov	edi,eax
	jmp	413332h

l00413330:
	xor	edi,edi

l00413332:
	mov	eax,[ebp-8h]
	mov	[ebx+10h],eax
	mov	eax,[ebp+14h]
	mov	[ebx+14h],esi
	lea	esi,[edi+edx]
	add	eax,esi
	mov	[ebp-8h],esi
	cmp	dword ptr [ebp-0Ch],10h
	mov	[ebp-4h],eax
	push	edx
	jc	4133ABh

l00413350:
	mov	esi,[ebx]
	push	esi
	push	edi
	call	42D1CFh
	push	dword ptr [ebp+14h]
	push	dword ptr [ebp-10h]
	push	dword ptr [ebp-8h]
	call	42D1CFh
	mov	eax,[ebp-4h]
	add	esp,18h
	mov	ecx,[ebp-0Ch]
	inc	ecx
	mov	byte ptr [eax],0h
	cmp	ecx,1000h
	jc	41338Eh

l0041337C:
	mov	edx,[esi-4h]
	add	ecx,23h
	sub	esi,edx
	lea	eax,[esi-4h]
	cmp	eax,1Fh
	ja	4133A5h

l0041338C:
	mov	esi,edx

l0041338E:
	push	ecx
	push	esi
	call	42763Fh
	add	esp,8h
	mov	[ebx],edi
	mov	eax,ebx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	10h

l004133A5:
	call	dword ptr [431290h]

l004133AB:
	push	ebx
	push	edi
	call	42D1CFh
	push	dword ptr [ebp+14h]
	push	dword ptr [ebp-10h]
	push	esi
	call	42D1CFh
	mov	eax,[ebp-4h]
	add	esp,18h
	mov	byte ptr [eax],0h
	mov	eax,ebx
	mov	[ebx],edi
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	10h

;; fn004133D4: 004133D4
;;   Called from:
;;     004132A5 (in fn00413280)
;;     004132A5 (in fn00413275)
fn004133D4 proc
	call	403860h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h

;; fn004133E0: 004133E0
;;   Called from:
;;     0040F19E (in fn0040F199)
;;     0041245A (in fn00412310)
;;     0041469A (in fn00414630)
fn004133E0 proc
	push	ebp
	mov	ebp,esp
	push	esi
	push	edi
	mov	edi,edx
	mov	esi,ecx
	cmp	esi,edi
	jz	413437h

;; fn004133ED: 004133ED
;;   Called from:
;;     004133EB (in fn004133E0)
;;     004133EB (in fn004133D4)
;;     004133EB (in fn004133D4)
fn004133ED proc
	nop	dword ptr [eax]

l004133F0:
	mov	ecx,[esi+14h]
	cmp	ecx,10h
	jc	41341Fh

l004133F8:
	mov	eax,[esi]
	inc	ecx
	cmp	ecx,1000h
	jc	413415h

l00413403:
	mov	edx,[eax-4h]
	add	ecx,23h
	sub	eax,edx
	add	eax,0FCh
	cmp	eax,1Fh
	ja	41343Bh

l00413413:
	mov	eax,edx

l00413415:
	push	ecx
	push	eax
	call	42763Fh
	add	esp,8h

l0041341F:
	mov	dword ptr [esi+10h],0h
	mov	dword ptr [esi+14h],0Fh
	mov	byte ptr [esi],0h
	add	esi,1Ch
	cmp	esi,edi
	jnz	4133F0h

l00413437:
	pop	edi
	pop	esi
	pop	ebp
	ret

l0041343B:
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
	int	3h
	push	ebp
	mov	ebp,esp
	push	ecx
	push	esi
	mov	esi,ecx
	push	edi
	mov	edi,[ebp+8h]
	mov	[ebp-4h],esi
	mov	dword ptr [esi],431834h
	mov	ecx,[edi+4h]
	mov	[esi+4h],ecx
	test	ecx,ecx
	jz	413473h

l0041346E:
	mov	eax,[ecx]
	call	dword ptr [eax+0Ch]

l00413473:
	mov	eax,[edi+8h]
	mov	[esi+8h],eax
	mov	eax,[edi+0Ch]
	mov	[esi+0Ch],eax
	mov	eax,[edi+10h]
	mov	[esi+10h],eax
	mov	eax,esi
	pop	edi
	pop	esi
	mov	esp,ebp
	pop	ebp
	ret	4h
0041348F                                              CC                .
00413490 C7 01 8C 24 43 00 8B C1 C2 04 00 CC CC CC CC CC ...$C...........
004134A0 55 8B EC 6A FF 68 00 EA 42 00 64 A1 00 00 00 00 U..j.h..B.d.....
004134B0 50 56 A1 08 A0 43 00 33 C5 50 8D 45 F4 64 A3 00 PV...C.3.P.E.d..
004134C0 00 00 00 8B F1 8B 46 28 C7 06 98 23 43 00 C7 46 ......F(...#C..F
004134D0 14 AC 23 43 00 8B 40 04 C7 44 30 28 50 18 43 00 ..#C..@..D0(P.C.
004134E0 8B 46 28 8B 48 04 8D 41 F8 89 44 31 24 C7 06 8C .F(.H..A..D1$...
004134F0 23 43 00 C7 46 14 34 18 43 00 C7 45 FC 00 00 00 #C..F.4.C..E....
00413500 00 8B 4E 18 85 C9 74 12 8B 01 8B 40 10 FF D0 84 ..N...t....@....
00413510 C0 74 07 C7 46 18 00 00 00 00 8D 46 04 C7 06 84 .t..F......F....
00413520 13 43 00 50 FF 15 C8 11 43 00 83 C4 04 C7 46 30 .C.P....C.....F0
00413530 8C 24 43 00 8B 4D F4 64 89 0D 00 00 00 00 59 5E .$C..M.d......Y^
00413540 8B E5 5D C3 CC CC CC CC CC CC CC CC CC CC CC CC ..].............
00413550 55 8B EC 6A FF 68 3C EA 42 00 64 A1 00 00 00 00 U..j.h<.B.d.....
00413560 50 83 EC 08 56 A1 08 A0 43 00 33 C5 50 8D 45 F4 P...V...C.3.P.E.
00413570 64 A3 00 00 00 00 8B F1 89 75 EC 83 7D 0C 00 C7 d........u..}...
00413580 45 F0 00 00 00 00 74 1C C7 46 28 80 23 43 00 C7 E.....t..F(.#C..
00413590 46 30 8C 24 43 00 C7 45 FC 00 00 00 00 C7 45 F0 F0.$C..E......E.
004135A0 01 00 00 00 FF 75 08 8B CE E8 42 00 00 00 8B 46 .....u....B....F
004135B0 28 C7 06 98 23 43 00 C7 46 14 AC 23 43 00 8B 40 (...#C..F..#C..@
004135C0 04 C7 44 30 28 50 18 43 00 8B 46 28 8B 40 04 C7 ..D0(P.C..F(.@..
004135D0 44 30 24 00 00 00 00 8B C6 8B 4D F4 64 89 0D 00 D0$.......M.d...
004135E0 00 00 00 59 5E 8B E5 5D C2 08 00 CC CC CC CC CC ...Y^..]........

;; fn004135F0: 004135F0
;;   Called from:
;;     004144E2 (in fn00414490)
fn004135F0 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42EA68h
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
	mov	edi,ecx
	mov	[ebp-10h],edi
	mov	ebx,[ebp+8h]
	lea	eax,[edi+4h]
	xorps	xmm0,xmm0
	mov	dword ptr [edi],431384h
	push	eax
	movq	qword ptr [eax],xmm0
	lea	eax,[ebx+4h]
	push	eax
	call	dword ptr [4311D0h]
	mov	dword ptr [edi],4324DCh
	add	esp,8h
	mov	eax,[ebx+0Ch]
	mov	[edi+0Ch],eax
	mov	eax,[ebx+10h]
	mov	[edi+10h],eax
	lea	esi,[edi+14h]
	mov	dword ptr [ebp-4h],0h
	mov	dword ptr [esi],431834h
	mov	ecx,[ebx+18h]
	mov	[ebp+8h],esi
	mov	[esi+4h],ecx
	test	ecx,ecx
	jz	413670h

l0041366B:
	mov	eax,[ecx]
	call	dword ptr [eax+0Ch]

l00413670:
	mov	eax,[ebx+1Ch]
	mov	[esi+8h],eax
	mov	eax,[ebx+20h]
	mov	[esi+0Ch],eax
	mov	eax,[ebx+24h]
	mov	[esi+10h],eax
	mov	eax,edi
	mov	dword ptr [edi],43238Ch
	mov	dword ptr [esi],4323B4h
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	4h
004136A4             CC CC CC CC CC CC CC CC CC CC CC CC     ............
004136B0 55 8B EC 56 8B 75 08 0F 57 C0 57 8B F9 8D 47 04 U..V.u..W.W...G.
004136C0 50 C7 07 84 13 43 00 66 0F D6 00 8D 46 04 50 FF P....C.f....F.P.
004136D0 15 D0 11 43 00 C7 07 DC 24 43 00 83 C4 08 8B 46 ...C....$C.....F
004136E0 0C 89 47 0C 8B 46 10 89 47 10 8B C7 5F 5E 5D C2 ..G..F..G..._^].
004136F0 04 00 CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
00413700 55 8B EC 56 8B F1 0F 57 C0 8D 46 04 50 C7 06 84 U..V...W..F.P...
00413710 13 43 00 66 0F D6 00 8B 45 08 83 C0 04 50 FF 15 .C.f....E....P..
00413720 D0 11 43 00 83 C4 08 C7 06 34 24 43 00 8B C6 5E ..C......4$C...^
00413730 5D C2 04 00 CC CC CC CC CC CC CC CC CC CC CC CC ]...............
00413740 55 8B EC 56 8B F1 E8 55 FD FF FF F6 45 08 01 74 U..V...U....E..t
00413750 0B 6A 34 56 E8 E6 3E 01 00 83 C4 08 8B C6 5E 5D .j4V..>.......^]
00413760 C2 04 00 CC CC CC CC CC CC CC CC CC CC CC CC CC ................

;; fn00413770: 00413770
;;   Called from:
;;     004198E6 (in fn004198E3)
fn00413770 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42EA00h
	mov	eax,fs:[0000h]
	push	eax
	push	esi
	mov	eax,[43A008h]
	xor	eax,ebp
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	esi,ecx
	mov	dword ptr [esi],43238Ch
	mov	dword ptr [esi+14h],431834h
	mov	dword ptr [ebp-4h],0h
	mov	ecx,[esi+18h]
	test	ecx,ecx
	jz	4137C2h

l004137B0:
	mov	eax,[ecx]
	mov	eax,[eax+10h]
	call	eax
	test	al,al
	jz	4137C2h

l004137BB:
	mov	dword ptr [esi+18h],0h

l004137C2:
	lea	eax,[esi+4h]
	mov	dword ptr [esi],431384h
	push	eax
	call	dword ptr [4311C8h]
	add	esp,4h
	test	byte ptr [ebp+8h],1h
	jz	4137E6h

l004137DB:
	push	28h
	push	esi
	call	42763Fh
	add	esp,8h

l004137E6:
	mov	eax,esi
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	esi
	mov	esp,ebp
	pop	ebp
	ret	4h
004137FA                               CC CC CC CC CC CC           ......
00413800 55 8B EC 83 EC 34 8D 41 D0 8D 4D CC 6A 01 50 E8 U....4.A..M.j.P.
00413810 3C FD FF FF 68 18 7C 43 00 8D 45 CC 50 E8 95 99 <...h.|C..E.P...
00413820 01 00 CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
00413830 55 8B EC 6A FF 68 C3 EA 42 00 64 A1 00 00 00 00 U..j.h..B.d.....
00413840 50 83 EC 08 53 56 57 A1 08 A0 43 00 33 C5 50 8D P...SVW...C.3.P.
00413850 45 F4 64 A3 00 00 00 00 8B F9 6A 34 C7 45 F0 00 E.d.......j4.E..
00413860 00 00 00 E8 A9 3C 01 00 8B D8 83 C4 04 89 5D EC .....<........].
00413870 C7 45 FC 00 00 00 00 83 C7 D0 C7 43 28 80 23 43 .E.........C(.#C
00413880 00 C7 43 30 8C 24 43 00 C6 45 FC 01 8B CB 57 C7 ..C0.$C..E....W.
00413890 45 F0 01 00 00 00 E8 55 FD FF FF C7 45 FC 02 00 E......U....E...
004138A0 00 00 8D 4B 14 8B 43 28 8D 57 14 C7 03 98 23 43 ...K..C(.W....#C
004138B0 00 F7 DF C7 01 AC 23 43 00 1B FF 8B 40 04 23 D7 ......#C....@.#.
004138C0 C7 44 18 28 50 18 43 00 8B 43 28 8B 70 04 8D 46 .D.(P.C..C(.p..F
004138D0 F8 89 44 1E 24 E8 76 04 FF FF 8B 43 28 83 C3 28 ..D.$.v....C(..(
004138E0 8B 40 04 03 C3 8B 4D F4 64 89 0D 00 00 00 00 59 .@....M.d......Y
004138F0 5F 5E 5B 8B E5 5D C3 CC CC CC CC CC CC CC CC CC _^[..]..........
00413900 55 8B EC 6A FF 68 00 EA 42 00 64 A1 00 00 00 00 U..j.h..B.d.....
00413910 50 56 A1 08 A0 43 00 33 C5 50 8D 45 F4 64 A3 00 PV...C.3.P.E.d..
00413920 00 00 00 8B F1 C7 06 8C 23 43 00 C7 46 14 34 18 ........#C..F.4.
00413930 43 00 C7 45 FC 00 00 00 00 8B 4E 18 85 C9 74 12 C..E......N...t.
00413940 8B 01 8B 40 10 FF D0 84 C0 74 07 C7 46 18 00 00 ...@.....t..F...
00413950 00 00 8D 46 04 C7 06 84 13 43 00 50 FF 15 C8 11 ...F.....C.P....
00413960 43 00 83 C4 04 8B 4D F4 64 89 0D 00 00 00 00 59 C.....M.d......Y
00413970 5E 8B E5 5D C3 CC CC CC CC CC CC CC CC CC CC CC ^..]............

;; fn00413980: 00413980
;;   Called from:
;;     00412CEC (in fn00412B52)
;;     00412CFD (in fn00412B52)
fn00413980 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42EAFBh
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,14h
	mov	eax,[43A008h]
	xor	eax,ebp
	mov	[ebp-10h],eax
	push	ebx
	push	esi
	push	edi
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	edi,[ebp+10h]
	xorps	xmm0,xmm0
	mov	ebx,[ebp+8h]
	movq	qword ptr [ebp-1Ch],xmm0
	mov	dword ptr [ebp-14h],0h
	mov	[ebp-1Ch],edi
	mov	[ebp-18h],edi
	mov	[ebp-14h],ecx
	mov	dword ptr [ebp-4h],0h
	cmp	ebx,[ebp+0Ch]
	jz	413A12h

l004139D5:
	push	ebx
	mov	ecx,edi
	mov	[ebp-20h],edi
	call	4028D0h
	lea	esi,[ebx+24h]
	mov	byte ptr [ebp-4h],1h
	lea	eax,[esi-0Ch]
	push	eax
	lea	ecx,[edi+18h]
	call	418780h
	push	esi
	lea	ecx,[edi+24h]
	mov	byte ptr [ebp-4h],2h
	call	4028D0h
	add	edi,3Ch
	mov	byte ptr [ebp-4h],0h
	add	ebx,3Ch
	mov	[ebp-18h],edi
	cmp	ebx,[ebp+0Ch]
	jnz	4139D5h

l00413A12:
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
	ret	0Ch
00413A32       CC CC CC CC CC CC CC CC CC CC CC CC CC CC   ..............

;; fn00413A40: 00413A40
;;   Called from:
;;     004054BA (in fn00404FB0)
;;     004055ED (in fn00404FB0)
;;     00405614 (in fn00404FB0)
fn00413A40 proc
	push	ebp
	mov	ebp,esp
	push	ecx
	cmp	dword ptr [ecx+14h],10h
	jc	413A4Ch

l00413A4A:
	mov	eax,[ecx]

l00413A4C:
	cmp	dword ptr [ecx+10h],0h
	jnz	413A5Ch

l00413A52:
	xor	eax,eax
	mov	al,1h
	mov	esp,ebp
	pop	ebp
	ret	4h

l00413A5C:
	xor	al,al
	mov	esp,ebp
	pop	ebp
	ret	4h
00413A64             CC CC CC CC CC CC CC CC CC CC CC CC     ............

;; fn00413A70: 00413A70
;;   Called from:
;;     004059E8 (in fn00404FB0)
fn00413A70 proc
	push	ebp
	mov	ebp,esp
	push	ecx
	push	ebx
	mov	ebx,[ebp+0Ch]
	push	esi
	mov	[ebp-4h],ecx
	mov	esi,ebx
	cmp	dword ptr [ebx+14h],10h
	jc	413A86h

l00413A84:
	mov	esi,[ebx]

l00413A86:
	mov	eax,[ecx+14h]
	mov	edx,[ecx+10h]
	sub	eax,edx
	mov	ebx,[ebx+10h]
	cmp	ebx,eax
	ja	413B0Bh

l00413A95:
	cmp	dword ptr [ecx+14h],10h
	lea	eax,[edx+ebx]
	push	edi
	mov	[ecx+10h],eax
	mov	edi,ecx
	jc	413AA6h

l00413AA4:
	mov	edi,[ecx]

l00413AA6:
	lea	eax,[ebx+esi]
	cmp	eax,edi
	jbe	413ACAh

l00413AAD:
	lea	eax,[edi+edx]
	cmp	esi,eax
	ja	413ACAh

l00413AB4:
	cmp	edi,esi
	ja	413AC1h

l00413AB8:
	mov	dword ptr [ebp+0Ch],0h
	jmp	413ACDh

l00413AC1:
	mov	eax,edi
	sub	eax,esi
	mov	[ebp+0Ch],eax
	jmp	413ACDh

l00413ACA:
	mov	[ebp+0Ch],ebx

l00413ACD:
	lea	eax,[edx+1h]
	push	eax
	lea	eax,[edi+ebx]
	push	edi
	push	eax
	call	42D1C9h
	push	dword ptr [ebp+0Ch]
	push	esi
	push	edi
	call	42D1CFh
	mov	eax,[ebp+0Ch]
	mov	ecx,ebx
	sub	ecx,eax
	push	ecx
	lea	ecx,[eax+ebx]
	add	ecx,esi
	push	ecx
	lea	ecx,[edi+eax]
	push	ecx
	call	42D1CFh
	mov	eax,[ebp-4h]
	add	esp,24h
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	8h

l00413B0B:
	push	ebx
	push	esi
	push	ecx
	mov	byte ptr [ebp+0Ch],0h
	push	dword ptr [ebp+0Ch]
	push	ebx
	call	414760h
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	8h
00413B23          CC CC CC CC CC CC CC CC CC CC CC CC CC    .............

;; fn00413B30: 00413B30
;;   Called from:
;;     004047FC (in fn00404080)
fn00413B30 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42EB3Eh
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,0C8h
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
	mov	[ebp-20h],ebx
	mov	esi,[ebp+8h]
	lea	eax,[ebp-48h]
	push	eax
	call	415100h
	mov	ecx,eax
	mov	dword ptr [ebp-4h],0h
	call	402DD0h
	mov	edi,eax
	mov	[ebp-3Ch],edi
	mov	dword ptr [ebp-4h],1h
	mov	ecx,[ebp-44h]
	test	ecx,ecx
	jz	413BA1h

l00413B90:
	mov	edx,[ecx]
	call	dword ptr [edx+8h]
	test	eax,eax
	jz	413BA1h

l00413B99:
	mov	edx,[eax]
	mov	ecx,eax
	push	1h
	call	dword ptr [edx]

l00413BA1:
	push	25h
	mov	ecx,edi
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	dword ptr [431100h]
	mov	cl,[ebx+44h]
	or	edi,0FFh
	mov	[ebp-14h],cl
	mov	dl,al
	push	dword ptr [ebp-14h]
	mov	ecx,esi
	mov	[ebp-22h],al
	push	dword ptr [ebp-3Ch]
	mov	byte ptr [ebp-15h],1h
	mov	[ebp-38h],edi
	call	4154B0h
	add	esp,8h
	mov	ecx,ebx
	push	eax
	call	415200h
	xor	al,al
	mov	dword ptr [ebp-2Ch],0h
	xor	edx,edx
	mov	dword ptr [ebp-1Ch],0h
	xor	ebx,ebx
	mov	[ebp-21h],al
	mov	[ebp-28h],ebx
	nop	dword ptr [eax+0h]

l00413C00:
	mov	edi,[esi+14h]
	mov	ebx,esi
	cmp	edi,10h
	jc	413C0Ch

l00413C0A:
	mov	ebx,[esi]

l00413C0C:
	mov	eax,[esi+10h]
	cmp	edx,eax
	jnc	413EC2h

l00413C17:
	sub	eax,edx
	push	eax
	movsx	eax,byte ptr [ebp-22h]
	push	eax
	lea	eax,[ebx+edx]
	push	eax
	call	42DAA7h
	mov	ecx,eax
	add	esp,0Ch
	test	ecx,ecx
	jz	413EBFh

l00413C35:
	sub	ecx,ebx
	mov	[ebp-14h],ecx
	cmp	ecx,0FFh
	jz	413EBFh

l00413C43:
	mov	eax,[ebp-28h]
	test	eax,eax
	jnz	413C52h

l00413C4A:
	mov	ebx,[ebp-20h]
	add	ebx,2Ch
	jmp	413C67h

l00413C52:
	mov	ecx,eax
	shl	ecx,4h
	sub	ecx,eax
	mov	eax,[ebp-20h]
	mov	ebx,[eax]
	add	ebx,0A4h
	lea	ebx,[ebx+ecx*8]
	mov	ecx,[ebp-14h]

l00413C67:
	mov	eax,esi
	cmp	edi,10h
	jc	413C70h

l00413C6E:
	mov	eax,[esi]

l00413C70:
	mov	edx,esi
	jc	413C76h

l00413C74:
	mov	edx,[esi]

l00413C76:
	mov	al,[ecx+eax+1h]
	cmp	al,[ecx+edx]
	jnz	413CE8h

l00413C7F:
	mov	eax,esi
	cmp	edi,10h
	jc	413C88h

l00413C86:
	mov	eax,[esi]

l00413C88:
	inc	ecx
	add	eax,ecx
	mov	ecx,esi
	cmp	edi,10h
	jc	413C94h

l00413C92:
	mov	ecx,[esi]

l00413C94:
	mov	edx,[ebp-1Ch]
	mov	edi,[ebx+14h]
	add	edx,ecx
	mov	ecx,ebx
	cmp	edi,10h
	jc	413CA5h

l00413CA3:
	mov	ecx,[ebx]

l00413CA5:
	add	ecx,[ebx+10h]
	mov	[ebp-1Ch],ecx
	mov	ecx,ebx
	cmp	edi,10h
	jc	413CB4h

l00413CB2:
	mov	ecx,[ebx]

l00413CB4:
	add	ecx,[ebx+10h]
	sub	[ebp-1Ch],ecx
	mov	[ebp-30h],ebx
	cmp	edi,10h
	jc	413CC6h

l00413CC2:
	mov	edi,[ebx]
	jmp	413CC9h

l00413CC6:
	mov	edi,[ebp-30h]

l00413CC9:
	sub	eax,edx
	sub	ecx,edi
	push	eax
	push	edx
	push	dword ptr [ebp-1Ch]
	push	ecx
	mov	ecx,ebx
	call	4167E0h
	mov	edx,[ebp-14h]
	add	edx,2h
	mov	[ebp-1Ch],edx
	jmp	413C00h

l00413CE8:
	mov	eax,[ebp-20h]
	mov	ecx,[eax+4h]
	sub	ecx,[eax]
	mov	eax,88888889h
	imul	ecx
	add	edx,ecx
	mov	ecx,[ebp-28h]
	sar	edx,6h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx
	cmp	ecx,eax
	jc	413D29h

l00413D0A:
	test	ecx,ecx
	jz	413D29h

l00413D0E:
	push	1B9h
	push	431E80h
	push	431ED8h
	call	dword ptr [431294h]
	mov	edi,[esi+14h]
	add	esp,0Ch

l00413D29:
	mov	eax,[ebp-14h]
	mov	edx,[ebp-1Ch]
	cmp	eax,edx
	jz	413D93h

l00413D33:
	mov	ecx,esi
	cmp	edi,10h
	jc	413D3Ch

l00413D3A:
	mov	ecx,[esi]

l00413D3C:
	add	eax,ecx
	mov	ecx,esi
	cmp	edi,10h
	jc	413D47h

l00413D45:
	mov	ecx,[esi]

l00413D47:
	mov	edi,[ebx+14h]
	add	ecx,edx
	mov	edx,ebx
	cmp	edi,10h
	jc	413D55h

l00413D53:
	mov	edx,[ebx]

l00413D55:
	add	edx,[ebx+10h]
	mov	[ebp-1Ch],edx
	mov	edx,ebx
	cmp	edi,10h
	jc	413D64h

l00413D62:
	mov	edx,[ebx]

l00413D64:
	add	edx,[ebx+10h]
	sub	[ebp-1Ch],edx
	mov	[ebp-30h],ebx
	cmp	edi,10h
	jc	413D76h

l00413D72:
	mov	edi,[ebx]
	jmp	413D79h

l00413D76:
	mov	edi,[ebp-30h]

l00413D79:
	sub	eax,ecx
	sub	edx,edi
	push	eax
	push	ecx
	push	dword ptr [ebp-1Ch]
	mov	ecx,ebx
	push	edx
	call	4167E0h
	mov	eax,[ebp-14h]
	mov	edi,[esi+14h]
	mov	[ebp-1Ch],eax

l00413D93:
	lea	ecx,[eax+1h]
	mov	eax,esi
	mov	[ebp-30h],ecx
	cmp	edi,10h
	jc	413DA2h

l00413DA0:
	mov	eax,[esi]

l00413DA2:
	mov	ebx,[ebp-28h]
	add	eax,ecx
	mov	ecx,[ebp-20h]
	shl	ebx,4h
	sub	ebx,[ebp-28h]
	shl	ebx,3h
	mov	edx,[ecx]
	mov	[ebp-14h],eax
	add	edx,ebx
	mov	al,[ecx+44h]
	mov	ecx,esi
	mov	[ebp-40h],al
	cmp	edi,10h
	jc	413DC9h

l00413DC7:
	mov	ecx,[esi]

l00413DC9:
	push	dword ptr [ebp-40h]
	mov	eax,[esi+10h]
	push	dword ptr [ebp-30h]
	add	eax,ecx
	lea	ecx,[ebp-14h]
	push	dword ptr [ebp-3Ch]
	mov	[ebp-34h],eax
	push	edx
	lea	edx,[ebp-34h]
	call	415610h
	add	esp,10h
	mov	ecx,esi
	cmp	dword ptr [esi+14h],10h
	jc	413DF3h

l00413DF1:
	mov	ecx,[esi]

l00413DF3:
	mov	edx,[ebp-14h]
	sub	edx,ecx
	mov	[ebp-34h],edx
	test	al,al
	jz	413C00h

l00413E03:
	mov	ecx,[ebp-20h]
	mov	[ebp-1Ch],edx
	mov	edi,[ecx]
	add	edi,ebx
	mov	eax,[edi+70h]
	test	al,1h
	jz	413E63h

l00413E14:
	mov	ecx,[edi+4Ch]
	test	cl,40h
	jz	413E47h

l00413E1C:
	test	ecx,180h
	jz	413E42h

l00413E24:
	push	0B4h
	push	432068h
	push	4320C0h
	call	dword ptr [431294h]
	mov	eax,[edi+70h]
	add	esp,0Ch
	mov	edx,[ebp-34h]

l00413E42:
	and	eax,0FEh
	jmp	413E5Dh

l00413E47:
	and	ecx,0FFFFFF3Fh
	mov	byte ptr [edi+48h],30h
	and	eax,0FDh
	or	ecx,100h
	mov	[edi+4Ch],ecx

l00413E5D:
	mov	ecx,[ebp-20h]
	mov	[edi+70h],eax

l00413E63:
	test	al,2h
	jz	413E73h

l00413E67:
	test	byte ptr [edi+4Ch],20h
	jz	413E73h

l00413E6D:
	and	eax,0FDh
	mov	[edi+70h],eax

l00413E73:
	mov	eax,[ecx]
	mov	eax,[ebx+eax]
	cmp	eax,0FDh
	jz	413C00h

l00413E81:
	cmp	eax,0FFh
	jnz	413E95h

l00413E86:
	inc	dword ptr [ebp-2Ch]
	inc	dword ptr [ebp-28h]
	mov	byte ptr [ebp-15h],0h
	jmp	413C00h

l00413E95:
	cmp	eax,0FEh
	jnz	413EA9h

l00413E9A:
	inc	dword ptr [ebp-2Ch]
	inc	dword ptr [ebp-28h]
	mov	byte ptr [ebp-21h],1h
	jmp	413C00h

l00413EA9:
	mov	ecx,[ebp-38h]
	cmp	eax,ecx
	cmovg	ecx,eax

l00413EB1:
	inc	dword ptr [ebp-2Ch]
	inc	dword ptr [ebp-28h]
	mov	[ebp-38h],ecx
	jmp	413C00h

l00413EBF:
	mov	eax,[esi+10h]

l00413EC2:
	mov	ebx,[ebp-28h]
	cmp	ebx,[ebp-2Ch]
	jz	413EE8h

l00413ECA:
	push	1D3h
	push	431E80h
	push	431F60h
	call	dword ptr [431294h]
	mov	eax,[esi+10h]
	add	esp,0Ch
	mov	edi,[esi+14h]

l00413EE8:
	test	ebx,ebx
	jnz	413EF4h

l00413EEC:
	mov	ecx,[ebp-20h]
	add	ecx,2Ch
	jmp	413F0Ch

l00413EF4:
	mov	eax,[ebp-20h]
	mov	ecx,ebx
	shl	ecx,4h
	sub	ecx,ebx
	mov	eax,[eax]
	lea	ecx,[0FFFFFFA4h+ecx*8]
	add	ecx,eax
	mov	eax,[esi+10h]

l00413F0C:
	mov	edx,esi
	cmp	edi,10h
	jc	413F15h

l00413F13:
	mov	edx,[esi]

l00413F15:
	add	eax,edx
	cmp	edi,10h
	jc	413F1Eh

l00413F1C:
	mov	esi,[esi]

l00413F1E:
	mov	edx,[ebp-1Ch]
	mov	edi,[ecx+14h]
	add	edx,esi
	mov	esi,ecx
	cmp	edi,10h
	jc	413F2Fh

l00413F2D:
	mov	esi,[ecx]

l00413F2F:
	mov	ebx,[ecx+10h]
	add	ebx,esi
	mov	esi,ecx
	cmp	edi,10h
	jc	413F3Dh

l00413F3B:
	mov	esi,[ecx]

l00413F3D:
	add	esi,[ecx+10h]
	sub	ebx,esi
	mov	[ebp-34h],ecx
	cmp	edi,10h
	jc	413F4Eh

l00413F4A:
	mov	edi,[ecx]
	jmp	413F51h

l00413F4E:
	mov	edi,[ebp-34h]

l00413F51:
	sub	eax,edx
	sub	esi,edi
	push	eax
	push	edx
	push	ebx
	push	esi
	call	4167E0h
	cmp	byte ptr [ebp-15h],0h
	mov	edi,[ebp-38h]
	jnz	413F9Ch

l00413F67:
	mov	ebx,[ebp-20h]
	test	edi,edi
	js	413F78h

l00413F6E:
	test	byte ptr [ebx+44h],1h
	jnz	414098h

l00413F78:
	mov	eax,[ebp-2Ch]
	xor	ecx,ecx
	test	eax,eax
	jle	413F99h

l00413F81:
	xor	edx,edx
	mov	esi,eax

l00413F85:
	mov	eax,[ebx]
	cmp	dword ptr [edx+eax],0FFh
	jnz	413F91h

l00413F8D:
	mov	[edx+eax],ecx
	inc	ecx

l00413F91:
	add	edx,78h
	sub	esi,1h
	jnz	413F85h

l00413F99:
	lea	edi,[ecx-1h]

l00413F9C:
	mov	ecx,[ebp-3Ch]
	push	20h
	call	dword ptr [431100h]
	xorps	xmm0,xmm0
	mov	dword ptr [ebp-0C0h],0FFFFFFFFh
	mov	dword ptr [ebp-0ACh],0h
	mov	dword ptr [ebp-0A8h],0Fh
	mov	byte ptr [ebp-0BCh],0h
	mov	dword ptr [ebp-94h],0h
	mov	dword ptr [ebp-90h],0Fh
	mov	byte ptr [ebp-0A4h],0h
	mov	byte ptr [ebp-68h],0h
	movlpd	qword ptr [ebp-88h],xmm0
	mov	dword ptr [ebp-80h],6h
	mov	dword ptr [ebp-7Ch],0h
	mov	[ebp-78h],al
	mov	dword ptr [ebp-74h],201h
	mov	dword ptr [ebp-6Ch],0h
	mov	dword ptr [ebp-70h],0h
	mov	dword ptr [ebp-58h],0FFFFFFFFh
	mov	dword ptr [ebp-54h],7FFFFFFFh
	mov	dword ptr [ebp-50h],0h
	lea	eax,[ebp-0C0h]
	mov	dword ptr [ebp-4h],3h
	mov	ebx,[ebp-20h]
	mov	ecx,ebx
	push	eax
	push	ebx
	push	dword ptr [ebp-2Ch]
	call	416170h
	lea	ecx,[ebp-0C0h]
	call	4148B0h
	cmp	byte ptr [ebp-21h],0h
	jz	414062h

l0041405E:
	or	dword ptr [ebx+1Ch],4h

l00414062:
	cmp	byte ptr [ebp-15h],0h
	lea	eax,[edi+1h]
	mov	[ebx+24h],eax
	jz	414074h

l0041406E:
	or	dword ptr [ebx+1Ch],1h
	jmp	414078h

l00414074:
	and	dword ptr [ebx+1Ch],0FEh

l00414078:
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

l00414098:
	push	0h
	push	edi
	lea	ecx,[ebp-0D4h]
	call	403F80h
	mov	ecx,eax
	mov	dword ptr [ebp-4h],2h
	call	411520h
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

;; fn004140C0: 004140C0
;;   Called from:
;;     00411DB5 (in fn00411D30)
fn004140C0 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42EB80h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,54h
	mov	eax,[43A008h]
	xor	eax,ebp
	mov	[ebp-10h],eax
	push	esi
	push	edi
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	[ebp-38h],ecx
	mov	eax,[ebp+8h]
	mov	[ebp-40h],eax
	mov	esi,[ecx+4h]
	mov	edi,[ecx]
	sub	esi,edi
	mov	[ebp-3Ch],eax
	mov	eax,88888889h
	imul	esi
	add	edx,esi
	sar	edx,6h
	mov	esi,edx
	shr	esi,1Fh
	add	esi,edx
	jnz	414126h

;; fn00414112: 00414112
;;   Called from:
;;     00414110 (in fn004140C0)
;;     00414110 (in fn00413B30)
fn00414112 proc
	add	ecx,2Ch
	push	ecx
	mov	ecx,[ebp-3Ch]
	call	4028D0h
	mov	eax,[ebp-3Ch]
	jmp	4143A1h

;; fn00414126: 00414126
;;   Called from:
;;     00414110 (in fn004140C0)
;;     00414110 (in fn00413B30)
;;     00414121 (in fn00414112)
fn00414126 proc
	mov	edx,[ecx+20h]
	mov	eax,[ecx+24h]
	cmp	edx,eax
	jge	41413Ah

l00414130:
	test	byte ptr [ecx+44h],2h
	jnz	4143BEh

l0041413A:
	mov	dword ptr [ebp-18h],0h
	mov	dword ptr [ebp-14h],0Fh
	mov	byte ptr [ebp-28h],0h
	mov	dword ptr [ebp-4h],1h
	mov	ecx,[ecx+3Ch]
	test	esi,esi
	jz	41417Dh

l0041415A:
	nop	word ptr [eax+eax+0h]

l00414160:
	add	ecx,[edi+14h]
	cmp	dword ptr [edi],0FEh
	jnz	414172h

l00414168:
	mov	eax,[edi+38h]
	cmp	ecx,eax
	cmovnc	eax,ecx

l00414170:
	mov	ecx,eax

l00414172:
	add	ecx,[edi+2Ch]
	add	edi,78h
	sub	esi,1h
	jnz	414160h

l0041417D:
	push	ecx
	lea	ecx,[ebp-28h]
	call	414E40h
	mov	edi,[ebp-38h]
	cmp	dword ptr [edi+40h],10h
	lea	edx,[edi+2Ch]
	jc	414195h

l00414192:
	mov	edx,[edi+2Ch]

l00414195:
	mov	ecx,[edi+3Ch]
	mov	eax,[ebp-14h]
	mov	esi,[ebp-18h]
	sub	eax,esi
	mov	[ebp-2Ch],ecx
	push	ecx
	push	edx
	cmp	ecx,eax
	ja	4141CEh

l004141A9:
	cmp	dword ptr [ebp-14h],10h
	lea	eax,[esi+ecx]
	mov	[ebp-18h],eax
	lea	eax,[ebp-28h]
	cmovnc	eax,[ebp-28h]

l004141BA:
	add	esi,eax
	push	esi
	call	42D1C9h
	mov	eax,[ebp-2Ch]
	add	esp,0Ch
	mov	byte ptr [esi+eax],0h
	jmp	4141DEh

l004141CE:
	mov	byte ptr [ebp-2Ch],0h
	push	dword ptr [ebp-2Ch]
	push	ecx
	lea	ecx,[ebp-28h]
	call	413280h

l004141DE:
	mov	esi,[edi]
	xor	ecx,ecx
	mov	[ebp-2Ch],ecx
	mov	eax,88888889h
	mov	ecx,[edi+4h]
	sub	ecx,esi
	mov	[ebp-34h],esi
	imul	ecx
	add	edx,ecx
	sar	edx,6h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx
	jz	41437Bh

l00414206:
	xor	eax,eax
	mov	[ebp-30h],eax
	nop	dword ptr [eax+eax+0h]

l00414210:
	cmp	dword ptr [eax+esi+18h],10h
	lea	edi,[eax+esi]
	lea	ecx,[edi+4h]
	jc	414220h

l0041421D:
	mov	ecx,[edi+4h]

l00414220:
	mov	eax,[ebp-14h]
	mov	edi,[edi+14h]
	mov	edx,[ebp-18h]
	sub	eax,edx
	push	edi
	push	ecx
	cmp	edi,eax
	ja	414256h

l00414231:
	cmp	dword ptr [ebp-14h],10h
	lea	esi,[ebp-28h]
	lea	eax,[edi+edx]
	cmovnc	esi,[ebp-28h]

l0041423F:
	add	esi,edx
	mov	[ebp-18h],eax
	push	esi
	call	42D1C9h
	mov	byte ptr [esi+edi],0h
	add	esp,0Ch
	mov	esi,[ebp-34h]
	jmp	414266h

l00414256:
	mov	byte ptr [ebp-44h],0h
	lea	ecx,[ebp-28h]
	push	dword ptr [ebp-44h]
	push	edi
	call	413280h

l00414266:
	mov	eax,[ebp-30h]
	cmp	dword ptr [eax+esi],0FEh
	jnz	4142F3h

l00414273:
	test	byte ptr [eax+esi+70h],8h
	jnz	414295h

l0041427A:
	push	0EAh
	push	431F90h
	push	432000h
	call	dword ptr [431294h]
	mov	eax,[ebp-30h]
	add	esp,0Ch

l00414295:
	mov	edi,[eax+esi+38h]
	mov	ecx,[ebp-18h]
	cmp	edi,ecx
	jbe	4142F6h

l004142A0:
	mov	dl,[eax+esi+48h]
	sub	edi,ecx
	mov	eax,[ebp-14h]
	sub	eax,ecx
	mov	[ebp-48h],dl
	cmp	edi,eax
	ja	4142DCh

l004142B2:
	cmp	dword ptr [ebp-14h],10h
	lea	eax,[ecx+edi]
	mov	[ebp-18h],eax
	lea	esi,[ebp-28h]
	cmovnc	esi,[ebp-28h]

l004142C3:
	push	edi
	movsx	eax,dl
	add	esi,ecx
	push	eax
	push	esi
	call	42D1C3h
	mov	byte ptr [esi+edi],0h
	add	esp,0Ch
	mov	esi,[ebp-34h]
	jmp	4142F0h

l004142DC:
	push	dword ptr [ebp-48h]
	mov	byte ptr [ebp-4Ch],0h
	lea	ecx,[ebp-28h]
	push	edi
	push	dword ptr [ebp-4Ch]
	push	edi
	call	413120h

l004142F0:
	mov	eax,[ebp-30h]

l004142F3:
	mov	ecx,[ebp-18h]

l004142F6:
	cmp	dword ptr [eax+esi+30h],10h
	lea	edi,[eax+esi]
	lea	edx,[edi+1Ch]
	jc	414306h

l00414303:
	mov	edx,[edi+1Ch]

l00414306:
	mov	esi,[ebp-14h]
	mov	eax,esi
	mov	edi,[edi+2Ch]
	sub	eax,ecx
	push	edi
	push	edx
	cmp	edi,eax
	ja	414338h

l00414316:
	lea	eax,[ecx+edi]
	cmp	esi,10h
	mov	[ebp-18h],eax
	lea	eax,[ebp-28h]
	cmovnc	eax,[ebp-28h]

l00414326:
	lea	esi,[eax+ecx]
	push	esi
	call	42D1C9h
	add	esp,0Ch
	mov	byte ptr [esi+edi],0h
	jmp	414348h

l00414338:
	mov	byte ptr [ebp-40h],0h
	lea	ecx,[ebp-28h]
	push	dword ptr [ebp-40h]
	push	edi
	call	413280h

l00414348:
	mov	edi,[ebp-38h]
	mov	eax,88888889h
	add	dword ptr [ebp-30h],78h
	inc	dword ptr [ebp-2Ch]
	mov	esi,[edi]
	mov	ecx,[edi+4h]
	sub	ecx,esi
	mov	[ebp-34h],esi
	imul	ecx
	add	edx,ecx
	sar	edx,6h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx
	cmp	[ebp-2Ch],eax
	mov	eax,[ebp-30h]
	jc	414210h

l0041437B:
	mov	eax,[ebp-3Ch]
	movups	xmm0,[ebp-28h]
	mov	byte ptr [edi+28h],1h
	mov	dword ptr [eax+10h],0h
	mov	dword ptr [eax+14h],0h
	movups	[eax],xmm0
	movq	xmm0,qword ptr [ebp-18h]
	movq	qword ptr [eax+10h],xmm0

l004143A1:
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	mov	ecx,[ebp-10h]
	xor	ecx,ebp
	call	427500h
	mov	esp,ebp
	pop	ebp
	ret	4h

l004143BE:
	push	eax
	push	edx
	lea	ecx,[ebp-60h]
	call	404000h
	mov	ecx,eax
	mov	dword ptr [ebp-4h],0h
	call	414540h
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

;; fn004143E0: 004143E0
;;   Called from:
;;     00405A24 (in fn00404FB0)
;;     004143DF (in fn00414126)
fn004143E0 proc
	push	ebp
	mov	ebp,esp
	push	ecx
	push	ebx
	push	esi
	mov	esi,ecx
	mov	[ebp-4h],edx
	mov	ebx,[esi+10h]
	test	ebx,ebx
	jz	414416h

l004143F2:
	cmp	dword ptr [esi+14h],10h
	push	edi
	mov	edi,esi
	jc	4143FFh

l004143FB:
	mov	edi,[esi]
	mov	esi,edi

l004143FF:
	call	42B320h
	push	eax
	push	dword ptr [ebp-4h]
	lea	eax,[ebx+edi]
	push	eax
	push	esi
	call	428BE0h
	add	esp,10h
	pop	edi

l00414416:
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret
0041441C                                     CC CC CC CC             ....

;; fn00414420: 00414420
;;   Called from:
;;     0041154A (in fn00411520)
fn00414420 proc
	push	esi
	push	edi
	mov	edi,ecx
	mov	esi,edx
	lea	eax,[edi+4h]
	xorps	xmm0,xmm0
	push	eax
	mov	dword ptr [edi],431384h
	movq	qword ptr [eax],xmm0
	lea	eax,[esi+4h]
	push	eax
	call	dword ptr [4311D0h]
	mov	dword ptr [edi],4324DCh
	add	esp,8h
	mov	eax,[esi+0Ch]
	mov	[edi+0Ch],eax
	mov	eax,[esi+10h]
	mov	[edi+10h],eax
	mov	eax,edi
	mov	dword ptr [edi+18h],0h
	mov	dword ptr [edi+1Ch],0h
	mov	dword ptr [edi+20h],0h
	mov	dword ptr [edi+24h],0FFFFFFFFh
	mov	dword ptr [edi],43238Ch
	mov	dword ptr [edi+14h],4323B4h
	pop	edi
	pop	esi
	ret
00414484             CC CC CC CC CC CC CC CC CC CC CC CC     ............

;; fn00414490: 00414490
;;   Called from:
;;     0041155B (in fn00411520)
fn00414490 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42EBD4h
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
	mov	esi,edx
	mov	edi,ecx
	mov	[ebp-14h],edi
	mov	dword ptr [ebp-10h],0h
	mov	dword ptr [edi+28h],432380h
	mov	dword ptr [edi+30h],43248Ch
	mov	dword ptr [ebp-4h],0h
	push	esi
	mov	dword ptr [ebp-10h],2h
	call	4135F0h
	mov	dword ptr [ebp-4h],1h
	lea	ecx,[edi+14h]
	mov	eax,[edi+28h]
	mov	dword ptr [edi],432398h
	mov	dword ptr [ecx],4323ACh
	mov	eax,[eax+4h]
	mov	dword ptr [eax+edi+28h],431850h
	mov	eax,[edi+28h]
	mov	edx,[eax+4h]
	lea	eax,[edx-8h]
	mov	[edx+edi+24h],eax
	lea	edx,[esi+14h]
	neg	esi
	sbb	esi,esi
	and	edx,esi
	call	403D50h
	mov	eax,edi
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	mov	esp,ebp
	pop	ebp
	ret
00414539                            CC CC CC CC CC CC CC          .......

;; fn00414540: 00414540
;;   Called from:
;;     00411EEF (in fn00411D30)
;;     004143D1 (in fn00414126)
fn00414540 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42EBF8h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,5Ch
	mov	eax,[43A008h]
	xor	eax,ebp
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	edx,ecx
	lea	ecx,[ebp-34h]
	call	415F60h
	mov	edx,eax
	mov	dword ptr [ebp-4h],0h
	lea	ecx,[ebp-68h]
	call	415FD0h
	push	437B20h
	lea	eax,[ebp-68h]
	push	eax
	call	42D1B7h
	int	3h
	int	3h

;; fn00414590: 00414590
;;   Called from:
;;     0040820F (in fn00407D10)
;;     00408A6F (in fn00408570)
;;     0041458F (in fn00414540)
fn00414590 proc
	push	ebp
	mov	ebp,esp
	push	dword ptr [ebp+0Ch]
	push	dword ptr [ebp+8h]
	call	402D70h
	xorps	xmm0,xmm0
	movups	[eax+8h],xmm0
	movq	qword ptr [eax+18h],xmm0
	mov	dword ptr [eax+20h],0h
	mov	dword ptr [eax+18h],0h
	mov	dword ptr [eax+1Ch],0Fh
	mov	byte ptr [eax+8h],0h
	pop	ebp
	ret	8h
004145C7                      CC CC CC CC CC CC CC CC CC        .........

;; fn004145D0: 004145D0
;;   Called from:
;;     0040A910 (in fn0040A880)
fn004145D0 proc
	push	ebp
	mov	ebp,esp
	and	esp,0F8h
	push	ecx
	cmp	dword ptr [ecx+14h],10h
	mov	edx,ecx
	push	esi
	jc	4145E2h

l004145E0:
	mov	edx,[ecx]

l004145E2:
	mov	eax,[ecx+10h]
	lea	esi,[eax+edx]
	jc	4145ECh

l004145EA:
	mov	ecx,[ecx]

l004145EC:
	cmp	ecx,esi
	jz	41461Ch

l004145F0:
	mov	edx,431D0Ch

l004145F5:
	cmp	edx,431D13h
	jz	414611h

l004145FD:
	mov	al,[ecx]
	cmp	al,[edx]
	jnz	41461Ch

l00414603:
	inc	ecx
	inc	edx
	cmp	ecx,esi
	jnz	4145F5h

l00414609:
	cmp	edx,431D13h
	jnz	41461Ch

l00414611:
	cmp	ecx,esi
	jnz	41461Ch

l00414615:
	mov	al,1h
	pop	esi
	mov	esp,ebp
	pop	ebp
	ret

l0041461C:
	xor	al,al
	pop	esi
	mov	esp,ebp
	pop	ebp
	ret
00414623          CC CC CC CC CC CC CC CC CC CC CC CC CC    .............

;; fn00414630: 00414630
;;   Called from:
;;     00412433 (in fn00412310)
;;     00412448 (in fn00412310)
fn00414630 proc
	push	ebp
	mov	ebp,esp
	push	esi
	mov	esi,[ebp+8h]
	mov	eax,ecx
	push	edi
	mov	edi,edx
	cmp	eax,edi
	jz	414695h

l00414640:
	mov	ecx,esi
	lea	edx,[eax+14h]
	sub	ecx,eax
	nop	word ptr [eax+eax+0h]

l00414650:
	mov	dword ptr [esi+10h],0h
	lea	edx,[edx+1Ch]
	mov	dword ptr [ecx+edx-1Ch],0h
	movups	xmm0,[edx-30h]
	movups	[esi],xmm0
	movq	xmm0,qword ptr [edx-20h]
	movq	qword ptr [esi+10h],xmm0
	mov	dword ptr [edx-20h],0h
	mov	dword ptr [edx-1Ch],0Fh
	mov	byte ptr [edx-30h],0h
	mov	eax,[edx-18h]
	mov	[esi+18h],eax
	lea	eax,[edx-14h]
	add	esi,1Ch
	cmp	eax,edi
	jnz	414650h

l00414695:
	push	ecx
	mov	edx,esi
	mov	ecx,esi
	call	4133E0h
	add	esp,4h
	mov	eax,esi
	pop	edi
	pop	esi
	pop	ebp
	ret
004146A8                         CC CC CC CC CC CC CC CC         ........

;; fn004146B0: 004146B0
;;   Called from:
;;     00412A32 (in fn0041295D)
;;     00412A49 (in fn0041295D)
fn004146B0 proc
	push	ebp
	mov	ebp,esp
	push	esi
	mov	esi,[ebp+8h]
	mov	eax,ecx
	push	edi
	mov	edi,edx
	cmp	eax,edi
	jz	414741h

l004146C4:
	mov	ecx,esi
	lea	edx,[eax+2Ch]
	sub	ecx,eax
	nop	dword ptr [eax+eax+0h]

l004146D0:
	mov	dword ptr [esi+10h],0h
	lea	edx,[edx+30h]
	mov	dword ptr [esi+14h],0h
	lea	eax,[edx-2Ch]
	movups	xmm0,[edx-5Ch]
	movups	[esi],xmm0
	movq	xmm0,qword ptr [edx-4Ch]
	movq	qword ptr [esi+10h],xmm0
	mov	dword ptr [edx-4Ch],0h
	mov	dword ptr [edx-48h],0Fh
	mov	byte ptr [edx-5Ch],0h
	mov	dword ptr [esi+28h],0h
	mov	dword ptr [ecx+edx-30h],0h
	movups	xmm0,[edx-44h]
	movups	[esi+18h],xmm0
	movq	xmm0,qword ptr [edx-34h]
	movq	qword ptr [esi+28h],xmm0
	add	esi,30h
	mov	dword ptr [edx-34h],0h
	mov	dword ptr [edx-30h],0Fh
	mov	byte ptr [edx-44h],0h
	cmp	eax,edi
	jnz	4146D0h

l00414741:
	push	ecx
	mov	edx,esi
	mov	ecx,esi
	call	403460h
	add	esp,4h
	mov	eax,esi
	pop	edi
	pop	esi
	pop	ebp
	ret
00414754             CC CC CC CC CC CC CC CC CC CC CC CC     ............

;; fn00414760: 00414760
;;   Called from:
;;     004122CB (in fn00412220)
;;     00413B16 (in fn00413A70)
fn00414760 proc
	push	ebp
	mov	ebp,esp
	sub	esp,10h
	mov	eax,[ebp+14h]
	mov	edx,[ebp+8h]
	push	ebx
	mov	ebx,ecx
	mov	[ebp-10h],eax
	mov	ecx,7FFFFFFFh
	push	esi
	mov	eax,ecx
	mov	esi,[ebx+10h]
	sub	eax,esi
	mov	[ebp-8h],esi
	push	edi
	cmp	eax,edx
	jc	41489Fh

l0041478B:
	lea	eax,[esi+edx]
	mov	esi,[ebx+14h]
	mov	edi,eax
	mov	[ebp-4h],eax
	or	edi,0Fh
	mov	[ebp-0Ch],esi
	cmp	edi,ecx
	jbe	4147A4h

l004147A0:
	mov	edi,ecx
	jmp	4147BCh

l004147A4:
	mov	eax,esi
	shr	eax,1h
	sub	ecx,eax
	cmp	esi,ecx
	jbe	4147B5h

l004147AE:
	mov	edi,7FFFFFFFh
	jmp	4147BCh

l004147B5:
	add	eax,esi
	cmp	edi,eax
	cmovc	edi,eax

l004147BC:
	xor	ecx,ecx
	mov	eax,edi
	add	eax,1h
	setc	cl
	neg	ecx
	or	ecx,eax
	cmp	ecx,1000h
	jc	4147F9h

l004147D2:
	lea	eax,[ecx+23h]
	or	edx,0FFh
	cmp	eax,ecx
	cmovbe	eax,edx

l004147DD:
	push	eax
	call	427511h
	add	esp,4h
	test	eax,eax
	jz	41487Ah

l004147EE:
	lea	esi,[eax+23h]
	and	esi,0E0h
	mov	[esi-4h],eax
	jmp	41480Ch

l004147F9:
	test	ecx,ecx
	jz	41480Ah

l004147FD:
	push	ecx
	call	427511h
	add	esp,4h
	mov	esi,eax
	jmp	41480Ch

l0041480A:
	xor	esi,esi

l0041480C:
	mov	eax,[ebp-4h]
	mov	[ebx+10h],eax
	mov	eax,[ebp+18h]
	mov	[ebx+14h],edi
	mov	edi,[ebp-8h]
	push	eax
	push	dword ptr [ebp-10h]
	inc	edi
	lea	ecx,[esi+eax]
	cmp	dword ptr [ebp-0Ch],10h
	mov	[ebp-4h],ecx
	push	esi
	jc	414880h

l0041482D:
	mov	edi,[ebx]
	call	42D1CFh
	mov	eax,[ebp-8h]
	inc	eax
	push	eax
	push	edi
	push	dword ptr [ebp-4h]
	call	42D1CFh
	mov	ecx,[ebp-0Ch]
	add	esp,18h
	inc	ecx
	cmp	ecx,1000h
	jc	414863h

l00414851:
	mov	edx,[edi-4h]
	add	ecx,23h
	sub	edi,edx
	lea	eax,[edi-4h]
	cmp	eax,1Fh
	ja	41487Ah

l00414861:
	mov	edi,edx

l00414863:
	push	ecx
	push	edi
	call	42763Fh
	add	esp,8h
	mov	[ebx],esi
	mov	eax,ebx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	14h

l0041487A:
	call	dword ptr [431290h]

l00414880:
	call	42D1CFh
	push	edi
	push	ebx
	push	dword ptr [ebp-4h]
	call	42D1CFh
	add	esp,18h
	mov	[ebx],esi
	mov	eax,ebx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	14h

l0041489F:
	call	403860h
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

;; fn004148B0: 004148B0
;;   Called from:
;;     00404D62 (in fn00404C60)
;;     0040F004 (in fn0040EE50)
;;     00411192 (in fn00411180)
;;     00414053 (in fn00413B30)
;;     004148AF (in fn00414760)
;;     0041530F (in fn00415200)
;;     004153C0 (in fn00415200)
;;     004163D2 (in fn00416170)
;;     004164AA (in fn00416170)
;;     004165D2 (in fn00416530)
;;     00416732 (in fn00416530)
;;     00417592 (in fn004173F0)
fn004148B0 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42DCE0h
	mov	eax,fs:[0000h]
	push	eax
	push	esi
	mov	eax,[43A008h]
	xor	eax,ebp
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	esi,ecx
	cmp	byte ptr [esi+58h],0h
	jz	4148FEh

l004148DB:
	mov	dword ptr [ebp-4h],0h
	mov	ecx,[esi+60h]
	test	ecx,ecx
	jz	4148FAh

l004148E9:
	mov	eax,[ecx]
	call	dword ptr [eax+8h]
	test	eax,eax
	jz	4148FAh

l004148F2:
	mov	edx,[eax]
	mov	ecx,eax
	push	1h
	call	dword ptr [edx]

l004148FA:
	mov	byte ptr [esi+58h],0h

l004148FE:
	mov	ecx,[esi+30h]
	cmp	ecx,10h
	jc	41492Eh

l00414906:
	mov	eax,[esi+1Ch]
	inc	ecx
	cmp	ecx,1000h
	jc	414924h

l00414912:
	mov	edx,[eax-4h]
	add	ecx,23h
	sub	eax,edx
	add	eax,0FCh
	cmp	eax,1Fh
	ja	414992h

l00414922:
	mov	eax,edx

l00414924:
	push	ecx
	push	eax
	call	42763Fh
	add	esp,8h

l0041492E:
	mov	dword ptr [esi+2Ch],0h
	mov	dword ptr [esi+30h],0Fh
	mov	byte ptr [esi+1Ch],0h
	mov	ecx,[esi+18h]
	cmp	ecx,10h
	jc	414970h

l00414948:
	mov	eax,[esi+4h]
	inc	ecx
	cmp	ecx,1000h
	jc	414966h

l00414954:
	mov	edx,[eax-4h]
	add	ecx,23h
	sub	eax,edx
	add	eax,0FCh
	cmp	eax,1Fh
	ja	414992h

l00414964:
	mov	eax,edx

l00414966:
	push	ecx
	push	eax
	call	42763Fh
	add	esp,8h

l00414970:
	mov	dword ptr [esi+14h],0h
	mov	dword ptr [esi+18h],0Fh
	mov	byte ptr [esi+4h],0h
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	esi
	mov	esp,ebp
	pop	ebp
	ret

l00414992:
	call	dword ptr [431290h]
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h

;; fn004149A0: 004149A0
;;   Called from:
;;     00414C06 (in fn00414C00)
fn004149A0 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42EA00h
	mov	eax,fs:[0000h]
	push	eax
	push	esi
	mov	eax,[43A008h]
	xor	eax,ebp
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	esi,ecx
	mov	eax,[esi+28h]
	mov	dword ptr [esi],432428h
	mov	dword ptr [esi+14h],4324ACh
	mov	eax,[eax+4h]
	mov	dword ptr [eax+esi+28h],43249Ch
	mov	eax,[esi+28h]
	mov	ecx,[eax+4h]
	lea	eax,[ecx-8h]
	mov	[ecx+esi+24h],eax
	mov	dword ptr [esi],432480h
	mov	dword ptr [esi+14h],431834h
	mov	dword ptr [ebp-4h],0h
	mov	ecx,[esi+18h]
	test	ecx,ecx
	jz	414A1Ah

;; fn00414A08: 00414A08
;;   Called from:
;;     00414A06 (in fn004149A0)
;;     00414A06 (in fn004148B0)
;;     00414A06 (in fn004148B0)
fn00414A08 proc
	mov	eax,[ecx]
	mov	eax,[eax+10h]
	call	eax
	test	al,al
	jz	414A1Ah

l00414A13:
	mov	dword ptr [esi+18h],0h

l00414A1A:
	lea	eax,[esi+4h]
	mov	dword ptr [esi],431384h
	push	eax
	call	dword ptr [4311C8h]
	add	esp,4h
	mov	dword ptr [esi+30h],43248Ch
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	esi
	mov	esp,ebp
	pop	ebp
	ret
00414A44             CC CC CC CC CC CC CC CC CC CC CC CC     ............
00414A50 55 8B EC 6A FF 68 3C EA 42 00 64 A1 00 00 00 00 U..j.h<.B.d.....
00414A60 50 83 EC 08 56 A1 08 A0 43 00 33 C5 50 8D 45 F4 P...V...C.3.P.E.
00414A70 64 A3 00 00 00 00 8B F1 89 75 EC 83 7D 0C 00 C7 d........u..}...
00414A80 45 F0 00 00 00 00 74 1C C7 46 28 80 23 43 00 C7 E.....t..F(.#C..
00414A90 46 30 8C 24 43 00 C7 45 FC 00 00 00 00 C7 45 F0 F0.$C..E......E.
00414AA0 01 00 00 00 FF 75 08 8B CE E8 42 00 00 00 8B 46 .....u....B....F
00414AB0 28 C7 06 28 24 43 00 C7 46 14 AC 24 43 00 8B 40 (..($C..F..$C..@
00414AC0 04 C7 44 30 28 9C 24 43 00 8B 46 28 8B 40 04 C7 ..D0(.$C..F(.@..
00414AD0 44 30 24 00 00 00 00 8B C6 8B 4D F4 64 89 0D 00 D0$.......M.d...
00414AE0 00 00 00 59 5E 8B E5 5D C2 08 00 CC CC CC CC CC ...Y^..]........

;; fn00414AF0: 00414AF0
;;   Called from:
;;     00416022 (in fn00415FD0)
fn00414AF0 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42EA68h
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
	mov	edi,ecx
	mov	[ebp-10h],edi
	mov	ebx,[ebp+8h]
	lea	eax,[edi+4h]
	xorps	xmm0,xmm0
	mov	dword ptr [edi],431384h
	push	eax
	movq	qword ptr [eax],xmm0
	lea	eax,[ebx+4h]
	push	eax
	call	dword ptr [4311D0h]
	mov	dword ptr [edi],4324E8h
	add	esp,8h
	mov	eax,[ebx+0Ch]
	mov	[edi+0Ch],eax
	mov	eax,[ebx+10h]
	mov	[edi+10h],eax
	lea	esi,[edi+14h]
	mov	dword ptr [ebp-4h],0h
	mov	dword ptr [esi],431834h
	mov	ecx,[ebx+18h]
	mov	[ebp+8h],esi
	mov	[esi+4h],ecx
	test	ecx,ecx
	jz	414B70h

l00414B6B:
	mov	eax,[ecx]
	call	dword ptr [eax+0Ch]

l00414B70:
	mov	eax,[ebx+1Ch]
	mov	[esi+8h],eax
	mov	eax,[ebx+20h]
	mov	[esi+0Ch],eax
	mov	eax,[ebx+24h]
	mov	[esi+10h],eax
	mov	eax,edi
	mov	dword ptr [edi],432480h
	mov	dword ptr [esi],432420h
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	4h
00414BA4             CC CC CC CC CC CC CC CC CC CC CC CC     ............
00414BB0 55 8B EC 56 8B 75 08 0F 57 C0 57 8B F9 8D 47 04 U..V.u..W.W...G.
00414BC0 50 C7 07 84 13 43 00 66 0F D6 00 8D 46 04 50 FF P....C.f....F.P.
00414BD0 15 D0 11 43 00 C7 07 E8 24 43 00 83 C4 08 8B 46 ...C....$C.....F
00414BE0 0C 89 47 0C 8B 46 10 89 47 10 8B C7 5F 5E 5D C2 ..G..F..G..._^].
00414BF0 04 00 CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................

;; fn00414C00: 00414C00
;;   Called from:
;;     0041987B (in fn00419878)
fn00414C00 proc
	push	ebp
	mov	ebp,esp
	push	esi
	mov	esi,ecx
	call	4149A0h
	test	byte ptr [ebp+8h],1h
	jz	414C1Ch

l00414C11:
	push	34h
	push	esi
	call	42763Fh
	add	esp,8h

l00414C1C:
	mov	eax,esi
	pop	esi
	pop	ebp
	ret	4h
00414C23          CC CC CC CC CC CC CC CC CC CC CC CC CC    .............
00414C30 55 8B EC 6A FF 68 00 EA 42 00 64 A1 00 00 00 00 U..j.h..B.d.....
00414C40 50 56 A1 08 A0 43 00 33 C5 50 8D 45 F4 64 A3 00 PV...C.3.P.E.d..
00414C50 00 00 00 8B F1 C7 06 80 24 43 00 C7 46 14 34 18 ........$C..F.4.
00414C60 43 00 C7 45 FC 00 00 00 00 8B 4E 18 85 C9 74 12 C..E......N...t.
00414C70 8B 01 8B 40 10 FF D0 84 C0 74 07 C7 46 18 00 00 ...@.....t..F...
00414C80 00 00 8D 46 04 C7 06 84 13 43 00 50 FF 15 C8 11 ...F.....C.P....
00414C90 43 00 83 C4 04 F6 45 08 01 74 0B 6A 28 56 E8 9C C.....E..t.j(V..
00414CA0 29 01 00 83 C4 08 8B C6 8B 4D F4 64 89 0D 00 00 )........M.d....
00414CB0 00 00 59 5E 8B E5 5D C2 04 00 CC CC CC CC CC CC ..Y^..].........
00414CC0 55 8B EC 83 EC 34 8D 41 D0 8D 4D CC 6A 01 50 E8 U....4.A..M.j.P.
00414CD0 7C FD FF FF 68 20 7B 43 00 8D 45 CC 50 E8 D5 84 |...h {C..E.P...
00414CE0 01 00 CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
00414CF0 55 8B EC 6A FF 68 53 EC 42 00 64 A1 00 00 00 00 U..j.hS.B.d.....
00414D00 50 83 EC 08 53 56 57 A1 08 A0 43 00 33 C5 50 8D P...SVW...C.3.P.
00414D10 45 F4 64 A3 00 00 00 00 8B F9 6A 34 C7 45 F0 00 E.d.......j4.E..
00414D20 00 00 00 E8 E9 27 01 00 8B D8 83 C4 04 89 5D EC .....'........].
00414D30 C7 45 FC 00 00 00 00 83 C7 D0 C7 43 28 80 23 43 .E.........C(.#C
00414D40 00 C7 43 30 8C 24 43 00 C6 45 FC 01 8B CB 57 C7 ..C0.$C..E....W.
00414D50 45 F0 01 00 00 00 E8 95 FD FF FF C7 45 FC 02 00 E...........E...
00414D60 00 00 8D 4B 14 8B 43 28 8D 57 14 C7 03 28 24 43 ...K..C(.W...($C
00414D70 00 F7 DF C7 01 AC 24 43 00 1B FF 8B 40 04 23 D7 ......$C....@.#.
00414D80 C7 44 18 28 9C 24 43 00 8B 43 28 8B 70 04 8D 46 .D.(.$C..C(.p..F
00414D90 F8 89 44 1E 24 E8 B6 EF FE FF 8B 43 28 83 C3 28 ..D.$......C(..(
00414DA0 8B 40 04 03 C3 8B 4D F4 64 89 0D 00 00 00 00 59 .@....M.d......Y
00414DB0 5F 5E 5B 8B E5 5D C3 CC CC CC CC CC CC CC CC CC _^[..]..........
00414DC0 55 8B EC 6A FF 68 00 EA 42 00 64 A1 00 00 00 00 U..j.h..B.d.....
00414DD0 50 56 A1 08 A0 43 00 33 C5 50 8D 45 F4 64 A3 00 PV...C.3.P.E.d..
00414DE0 00 00 00 8B F1 C7 06 80 24 43 00 C7 46 14 34 18 ........$C..F.4.
00414DF0 43 00 C7 45 FC 00 00 00 00 8B 4E 18 85 C9 74 12 C..E......N...t.
00414E00 8B 01 8B 40 10 FF D0 84 C0 74 07 C7 46 18 00 00 ...@.....t..F...
00414E10 00 00 8D 46 04 C7 06 84 13 43 00 50 FF 15 C8 11 ...F.....C.P....
00414E20 43 00 83 C4 04 8B 4D F4 64 89 0D 00 00 00 00 59 C.....M.d......Y
00414E30 5E 8B E5 5D C3 CC CC CC CC CC CC CC CC CC CC CC ^..]............

;; fn00414E40: 00414E40
;;   Called from:
;;     00414181 (in fn00414126)
;;     00417FFD (in fn00417F50)
;;     00418CB6 (in fn00418C30)
;;     00418E66 (in fn00418C30)
fn00414E40 proc
	push	ebp
	mov	ebp,esp
	sub	esp,8h
	push	ebx
	mov	ebx,[ebp+8h]
	push	esi
	mov	esi,ecx
	mov	eax,[esi+10h]
	mov	[ebp-8h],eax
	cmp	eax,ebx
	ja	414FCBh

l00414E5B:
	mov	edx,[esi+14h]
	mov	[ebp-4h],edx
	cmp	edx,ebx
	jz	414FCBh

l00414E69:
	push	edi
	jnc	414F83h

l00414E70:
	mov	ecx,ebx
	sub	ecx,eax
	mov	eax,7FFFFFFFh
	sub	eax,[ebp-8h]
	cmp	eax,ecx
	jc	414FD9h

l00414E84:
	mov	edi,ebx
	or	edi,0Fh
	cmp	edi,7FFFFFFFh
	jbe	414E98h

l00414E91:
	mov	edi,7FFFFFFFh
	jmp	414EB6h

l00414E98:
	mov	ecx,edx
	mov	eax,7FFFFFFFh
	shr	ecx,1h
	sub	eax,ecx
	cmp	edx,eax
	jbe	414EAEh

l00414EA7:
	mov	edi,7FFFFFFFh
	jmp	414EB6h

l00414EAE:
	lea	eax,[ecx+edx]
	cmp	edi,eax
	cmovc	edi,eax

l00414EB6:
	xor	ecx,ecx
	mov	eax,edi
	add	eax,1h
	setc	cl
	neg	ecx
	or	ecx,eax
	cmp	ecx,1000h
	jc	414EF6h

l00414ECC:
	lea	eax,[ecx+23h]
	or	edx,0FFh
	cmp	eax,ecx
	cmovbe	eax,edx

l00414ED7:
	push	eax
	call	427511h
	add	esp,4h
	test	eax,eax
	jz	414FD3h

l00414EE8:
	mov	edx,[ebp-4h]
	lea	ebx,[eax+23h]
	and	ebx,0E0h
	mov	[ebx-4h],eax
	jmp	414F0Ch

l00414EF6:
	test	ecx,ecx
	jz	414F0Ah

l00414EFA:
	push	ecx
	call	427511h
	mov	edx,[ebp-4h]
	add	esp,4h
	mov	ebx,eax
	jmp	414F0Ch

l00414F0A:
	xor	ebx,ebx

l00414F0C:
	mov	eax,[ebp+8h]
	mov	[esi+10h],eax
	mov	eax,[ebp-8h]
	inc	eax
	mov	[esi+14h],edi
	push	eax
	cmp	edx,10h
	jc	414F68h

l00414F1F:
	mov	edi,[esi]
	push	edi
	push	ebx
	call	42D1CFh
	mov	ecx,[ebp-4h]
	add	esp,0Ch
	inc	ecx
	cmp	ecx,1000h
	jc	414F4Dh

l00414F37:
	mov	edx,[edi-4h]
	add	ecx,23h
	sub	edi,edx
	lea	eax,[edi-4h]
	cmp	eax,1Fh
	ja	414FD3h

l00414F4B:
	mov	edi,edx

l00414F4D:
	push	ecx
	push	edi
	call	42763Fh
	mov	eax,[ebp-8h]
	add	esp,8h
	mov	[esi],ebx
	mov	[esi+10h],eax
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	4h

l00414F68:
	push	esi
	push	ebx
	call	42D1CFh
	mov	eax,[ebp-8h]
	add	esp,0Ch
	mov	[esi],ebx
	mov	[esi+10h],eax
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	4h

l00414F83:
	cmp	ebx,10h
	jnc	414FCAh

l00414F88:
	cmp	edx,10h
	jc	414FCAh

l00414F8D:
	mov	edi,[esi]
	inc	eax
	push	eax
	push	edi
	push	esi
	call	42D1CFh
	mov	ecx,[esi+14h]
	add	esp,0Ch
	inc	ecx
	cmp	ecx,1000h
	jc	414FB9h

l00414FA7:
	mov	edx,[edi-4h]
	add	ecx,23h
	sub	edi,edx
	lea	eax,[edi-4h]
	cmp	eax,1Fh
	ja	414FD3h

l00414FB7:
	mov	edi,edx

l00414FB9:
	push	ecx
	push	edi
	call	42763Fh
	add	esp,8h
	mov	dword ptr [esi+14h],0Fh

l00414FCA:
	pop	edi

l00414FCB:
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	4h

l00414FD3:
	call	dword ptr [431290h]

l00414FD9:
	call	403860h
	int	3h
	int	3h

;; fn00414FE0: 00414FE0
;;   Called from:
;;     0041629F (in fn00416170)
;;     00416472 (in fn00416170)
;;     0041669B (in fn00416530)
;;     004166E4 (in fn00416530)
fn00414FE0 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42EC83h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,14h
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
	xorps	xmm0,xmm0
	mov	esi,[ebp+10h]
	mov	ebx,[ebp+0Ch]
	movq	qword ptr [ebp-1Ch],xmm0
	mov	dword ptr [ebp-14h],0h
	mov	[ebp-1Ch],edi
	mov	[ebp-18h],edi
	mov	[ebp-14h],ecx
	mov	dword ptr [ebp-4h],0h
	test	ebx,ebx
	jz	4150D6h

;; fn0041503B: 0041503B
;;   Called from:
;;     00415035 (in fn00414FE0)
;;     00415035 (in fn00414E40)
;;     00415035 (in fn00414E40)
fn0041503B proc
	lea	ecx,[esi+4h]
	nop

l00415040:
	mov	eax,[esi]
	push	ecx
	lea	ecx,[edi+4h]
	mov	[ebp-20h],edi
	mov	[edi],eax
	call	4028D0h
	lea	eax,[esi+1Ch]
	mov	byte ptr [ebp-4h],1h
	push	eax
	lea	ecx,[edi+1Ch]
	call	4028D0h
	mov	eax,[esi+38h]
	mov	[edi+38h],eax
	mov	eax,[esi+3Ch]
	mov	[edi+3Ch],eax
	mov	eax,[esi+40h]
	mov	[edi+40h],eax
	mov	eax,[esi+44h]
	mov	[edi+44h],eax
	movzx	eax,byte ptr [esi+48h]
	mov	[edi+48h],al
	mov	eax,[esi+4Ch]
	mov	[edi+4Ch],eax
	mov	eax,[esi+50h]
	mov	[edi+50h],eax
	mov	eax,[esi+54h]
	mov	[edi+54h],eax
	mov	byte ptr [edi+58h],0h
	cmp	byte ptr [esi+58h],0h
	jz	4150AEh

l0041509B:
	mov	byte ptr [ebp-4h],2h
	mov	ecx,[esi+60h]
	mov	[edi+60h],ecx
	mov	eax,[ecx]
	call	dword ptr [eax+4h]
	mov	byte ptr [edi+58h],1h

l004150AE:
	mov	eax,[esi+68h]
	mov	[edi+68h],eax
	mov	eax,[esi+6Ch]
	mov	[edi+6Ch],eax
	mov	ecx,[esi+70h]
	mov	[edi+70h],ecx
	add	edi,78h
	mov	byte ptr [ebp-4h],0h
	lea	ecx,[esi+4h]
	mov	[ebp-18h],edi
	sub	ebx,1h
	jnz	415040h

l004150D6:
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
	ret	0Ch
004150F6                   CC CC CC CC CC CC CC CC CC CC       ..........

;; fn00415100: 00415100
;;   Called from:
;;     00413B6A (in fn00413B30)
;;     00415231 (in fn00415200)
fn00415100 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42ECB0h
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
	cmp	byte ptr [ecx+90h],0h
	mov	dword ptr [ebp-10h],0h
	jz	415153h

l00415136:
	mov	dword ptr [ebp-4h],0h
	mov	esi,[ecx+98h]
	mov	ecx,esi
	mov	eax,[esi]
	call	dword ptr [eax+4h]
	mov	ebx,1h
	mov	ecx,esi
	jmp	415172h

l00415153:
	push	1h
	mov	dword ptr [ebp-4h],1h
	call	dword ptr [4311A8h]
	mov	esi,[ebp+8h]
	add	esp,4h
	mov	[ebp-10h],eax
	mov	ebx,2h
	mov	ecx,eax

l00415172:
	mov	edi,[ebp+8h]
	mov	dword ptr [ebp-4h],2h
	mov	[edi+4h],ecx
	mov	eax,[ecx]
	call	dword ptr [eax+4h]
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	test	bl,2h
	jz	4151B9h

l00415190:
	and	ebx,0FDh
	mov	ecx,[ebp-10h]
	mov	dword ptr [ebp-4h],3h
	test	ecx,ecx
	jz	4151B2h

l004151A1:
	mov	eax,[ecx]
	call	dword ptr [eax+8h]
	test	eax,eax
	jz	4151B2h

l004151AA:
	mov	edx,[eax]
	mov	ecx,eax
	push	1h
	call	dword ptr [edx]

l004151B2:
	mov	dword ptr [ebp-4h],0FFFFFFFFh

l004151B9:
	test	bl,1h
	jz	4151DCh

l004151BE:
	mov	dword ptr [ebp-4h],4h
	test	esi,esi
	jz	4151DCh

l004151C9:
	mov	eax,[esi]
	mov	ecx,esi
	call	dword ptr [eax+8h]
	test	eax,eax
	jz	4151DCh

l004151D4:
	mov	edx,[eax]
	mov	ecx,eax
	push	1h
	call	dword ptr [edx]

l004151DC:
	mov	eax,edi
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	4h
004151F2       CC CC CC CC CC CC CC CC CC CC CC CC CC CC   ..............

;; fn00415200: 00415200
;;   Called from:
;;     00413BDA (in fn00413B30)
fn00415200 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42ECEEh
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,80h
	push	ebx
	push	esi
	push	edi
	mov	eax,[43A008h]
	xor	eax,ebp
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	esi,ecx
	lea	eax,[ebp-14h]
	push	eax
	call	415100h
	push	20h
	mov	ecx,eax
	mov	dword ptr [ebp-4h],0h
	call	402DD0h
	mov	ecx,eax
	call	dword ptr [431100h]
	mov	bl,al
	mov	dword ptr [ebp-4h],1h
	mov	ecx,[ebp-10h]
	test	ecx,ecx
	jz	41526Fh

l0041525E:
	mov	edx,[ecx]
	call	dword ptr [edx+8h]
	test	eax,eax
	jz	41526Fh

l00415267:
	mov	edx,[eax]
	mov	ecx,eax
	push	1h
	call	dword ptr [edx]

l0041526F:
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	mov	eax,88888889h
	mov	ecx,[esi+4h]
	sub	ecx,[esi]
	imul	ecx
	add	edx,ecx
	sar	edx,6h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx
	jnz	415319h

l00415294:
	xorps	xmm0,xmm0
	mov	dword ptr [ebp-8Ch],0FFFFFFFFh
	mov	[ebp-78h],eax
	mov	dword ptr [ebp-74h],0Fh
	mov	[ebp-88h],al
	mov	[ebp-60h],eax
	mov	dword ptr [ebp-5Ch],0Fh
	mov	[ebp-70h],al
	mov	[ebp-34h],al
	movlpd	qword ptr [ebp-54h],xmm0
	mov	dword ptr [ebp-4Ch],6h
	mov	[ebp-48h],eax
	mov	[ebp-44h],bl
	mov	dword ptr [ebp-40h],201h
	mov	[ebp-38h],eax
	mov	[ebp-3Ch],eax
	mov	dword ptr [ebp-24h],0FFFFFFFFh
	mov	dword ptr [ebp-20h],7FFFFFFFh
	mov	[ebp-1Ch],eax
	lea	eax,[ebp-8Ch]
	mov	dword ptr [ebp-4h],2h
	push	eax
	push	dword ptr [ebp+8h]
	mov	ecx,esi
	call	416530h
	lea	ecx,[ebp-8Ch]
	call	4148B0h
	jmp	415469h

l00415319:
	mov	edi,[ebp+8h]
	cmp	edi,eax
	jbe	4153C5h

l00415324:
	xorps	xmm0,xmm0
	mov	dword ptr [ebp-8Ch],0FFFFFFFFh
	mov	dword ptr [ebp-78h],0h
	mov	dword ptr [ebp-74h],0Fh
	mov	byte ptr [ebp-88h],0h
	mov	dword ptr [ebp-60h],0h
	mov	dword ptr [ebp-5Ch],0Fh
	mov	byte ptr [ebp-70h],0h
	mov	byte ptr [ebp-34h],0h
	movlpd	qword ptr [ebp-54h],xmm0
	mov	dword ptr [ebp-4Ch],6h
	mov	dword ptr [ebp-48h],0h
	mov	[ebp-44h],bl
	mov	dword ptr [ebp-40h],201h
	mov	dword ptr [ebp-38h],0h
	mov	dword ptr [ebp-3Ch],0h
	mov	dword ptr [ebp-24h],0FFFFFFFFh
	mov	dword ptr [ebp-20h],7FFFFFFFh
	mov	dword ptr [ebp-1Ch],0h
	lea	eax,[ebp-8Ch]
	mov	dword ptr [ebp-4h],3h
	push	eax
	push	esi
	push	edi
	mov	ecx,esi
	call	416170h
	lea	ecx,[ebp-8Ch]
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	4148B0h

l004153C5:
	sub	esp,8h
	lea	ecx,[esi+0Ch]
	call	416760h
	test	edi,edi
	jz	415469h

l004153D8:
	xor	edx,edx
	nop	word ptr [eax+eax+0h]

l004153E0:
	mov	eax,[esi]
	add	eax,edx
	lea	ecx,[eax+4h]
	mov	dword ptr [eax],0FFFFFFFFh
	mov	dword ptr [eax+68h],0FFFFFFFFh
	mov	dword ptr [eax+6Ch],7FFFFFFFh
	mov	dword ptr [eax+70h],0h
	mov	dword ptr [ecx+10h],0h
	cmp	dword ptr [ecx+14h],10h
	jc	415411h

l0041540F:
	mov	ecx,[ecx]

l00415411:
	mov	byte ptr [ecx],0h
	lea	ecx,[eax+1Ch]
	mov	dword ptr [ecx+10h],0h
	cmp	dword ptr [ecx+14h],10h
	jc	415426h

l00415424:
	mov	ecx,[ecx]

l00415426:
	mov	byte ptr [ecx],0h
	add	edx,78h
	mov	dword ptr [eax+38h],0h
	mov	dword ptr [eax+3Ch],0h
	mov	dword ptr [eax+40h],6h
	mov	dword ptr [eax+44h],0h
	mov	[eax+48h],bl
	mov	dword ptr [eax+4Ch],201h
	mov	dword ptr [eax+54h],0h
	mov	dword ptr [eax+50h],0h
	sub	edi,1h
	jnz	4153E0h

l00415469:
	mov	dword ptr [esi+3Ch],0h
	cmp	dword ptr [esi+40h],10h
	jc	415490h

l00415476:
	mov	eax,[esi+2Ch]
	mov	byte ptr [eax],0h
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	4h

l00415490:
	mov	byte ptr [esi+2Ch],0h
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	4h
004154A8                         CC CC CC CC CC CC CC CC         ........

;; fn004154B0: 004154B0
;;   Called from:
;;     00413BCF (in fn00413B30)
fn004154B0 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42ED18h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,24h
	mov	eax,[43A008h]
	xor	eax,ebp
	mov	[ebp-10h],eax
	push	ebx
	push	esi
	push	edi
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	[ebp-11h],dl
	mov	esi,ecx
	mov	ebx,[esi+14h]
	xor	ecx,ecx
	xor	eax,eax
	mov	[ebp-18h],eax

l004154EA:
	mov	eax,[esi+10h]
	nop	dword ptr [eax]

l004154F0:
	mov	[ebp-1Ch],esi
	mov	edx,esi
	cmp	ebx,10h
	jc	4154FFh

l004154FA:
	mov	edx,[esi]
	mov	[ebp-1Ch],edx

l004154FF:
	cmp	ecx,eax
	jnc	4155CCh

l00415507:
	sub	eax,ecx
	push	eax
	movsx	eax,byte ptr [ebp-11h]
	push	eax
	lea	eax,[edx+ecx]
	push	eax
	call	42DAA7h
	mov	edi,eax
	add	esp,0Ch
	test	edi,edi
	jz	4155CCh

l00415525:
	sub	edi,[ebp-1Ch]
	cmp	edi,0FFh
	jz	4155CCh

l00415531:
	lea	edx,[edi+1h]
	cmp	edx,[esi+10h]
	jnc	4155C0h

l0041553D:
	mov	eax,esi
	cmp	ebx,10h
	jc	415546h

l00415544:
	mov	eax,[esi]

l00415546:
	mov	ecx,esi
	jc	41554Ch

l0041554A:
	mov	ecx,[esi]

l0041554C:
	mov	al,[edi+eax+1h]
	cmp	al,[edi+ecx]
	jnz	41555Ah

l00415555:
	lea	ecx,[edi+2h]
	jmp	4154EAh

l0041555A:
	mov	[ebp-1Ch],esi
	cmp	ebx,10h
	jc	415567h

l00415562:
	mov	eax,[esi]
	mov	[ebp-1Ch],eax

l00415567:
	mov	eax,esi
	jc	41556Dh

l0041556B:
	mov	eax,[esi]

l0041556D:
	add	eax,[esi+10h]
	mov	ecx,esi
	cmp	ebx,10h
	jc	415579h

l00415577:
	mov	ecx,[esi]

l00415579:
	add	ecx,edx
	cmp	ecx,eax
	jz	415599h

l0041557F:
	mov	edx,[ebp+8h]
	mov	edi,[edx+0Ch]

l00415585:
	movzx	edx,byte ptr [ecx]
	movsx	edx,word ptr [edi+edx*2]
	shr	edx,2h
	test	dl,1h
	jz	415599h

l00415594:
	inc	ecx
	cmp	ecx,eax
	jnz	415585h

l00415599:
	sub	ecx,[ebp-1Ch]
	mov	eax,[esi+10h]
	cmp	ecx,eax
	jnc	4155B8h

l004155A3:
	mov	eax,esi
	cmp	ebx,10h
	jc	4155ACh

l004155AA:
	mov	eax,[esi]

l004155AC:
	mov	dl,[ebp-11h]
	cmp	[eax+ecx],dl
	mov	eax,[esi+10h]
	jnz	4155B8h

l004155B7:
	inc	ecx

l004155B8:
	inc	dword ptr [ebp-18h]
	jmp	4154F0h

l004155C0:
	test	byte ptr [ebp+0Ch],1h
	jnz	4155EBh

l004155C6:
	mov	eax,[ebp-18h]
	inc	eax
	jmp	4155CFh

l004155CC:
	mov	eax,[ebp-18h]

l004155CF:
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

l004155EB:
	mov	ecx,esi
	call	402A60h
	push	eax
	push	edi
	lea	ecx,[ebp-30h]
	call	403F80h
	mov	ecx,eax
	mov	dword ptr [ebp-4h],0h
	call	411520h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h

;; fn00415610: 00415610
;;   Called from:
;;     00413DE1 (in fn00413B30)
fn00415610 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42ED90h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,38h
	push	ebx
	push	esi
	push	edi
	mov	eax,[43A008h]
	xor	eax,ebp
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	eax,edx
	mov	[ebp-10h],eax
	mov	esi,ecx
	mov	[ebp-20h],esi
	mov	ebx,[ebp+8h]
	mov	ecx,[ebp+0Ch]
	mov	[ebp-2Ch],ebx
	mov	[ebp-18h],ecx
	mov	dword ptr [ebx],0FFFFFFFFh
	mov	eax,[eax]
	mov	edx,eax
	mov	edi,[esi]
	sub	edx,edi
	add	edx,[ebp+10h]
	mov	byte ptr [ebp-1Ah],0h
	mov	byte ptr [ebp-19h],0h
	mov	[ebp-30h],edi
	mov	[ebp-24h],edx
	cmp	edi,eax
	jc	41568Fh

;; fn00415671: 00415671
;;   Called from:
;;     0041566F (in fn00415610)
;;     0041566F (in fn004154B0)
fn00415671 proc
	test	byte ptr [ebp+14h],1h
	jnz	415C3Ah

l0041567B:
	xor	al,al
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret

;; fn0041568F: 0041568F
;;   Called from:
;;     0041566F (in fn00415610)
;;     0041566F (in fn004154B0)
;;     00415675 (in fn00415671)
;;     00415675 (in fn00415671)
fn0041568F proc
	push	7Ch
	call	dword ptr [431100h]
	cmp	[edi],al
	jnz	4156BBh

l0041569B:
	mov	eax,[ebp-10h]
	inc	dword ptr [esi]
	mov	ecx,[esi]
	mov	byte ptr [ebp-19h],1h
	cmp	ecx,[eax]
	jc	4156BBh

l004156AA:
	sub	ecx,edi
	add	ecx,[ebp+10h]
	test	byte ptr [ebp+14h],1h
	jnz	415C54h

l004156B9:
	jmp	41567Bh

l004156BB:
	mov	ecx,[ebp-18h]
	mov	esi,[esi]
	push	30h
	call	dword ptr [431100h]
	cmp	[esi],al
	mov	edx,[ebp-18h]
	mov	esi,[ebp-20h]
	jz	4157BFh

l004156D6:
	mov	ecx,[esi]
	mov	eax,[edx+0Ch]
	mov	[ebp-28h],ecx
	movzx	ecx,byte ptr [ecx]
	movsx	eax,word ptr [eax+ecx*2]
	shr	eax,2h
	test	al,1h
	jz	4157BFh

l004156F0:
	mov	ecx,[ebp-10h]
	mov	eax,[ebp-28h]
	mov	dword ptr [ebp-14h],0h
	cmp	eax,[ecx]
	jz	415751h

l00415701:
	mov	esi,edx
	mov	edi,eax
	mov	ebx,ecx

l00415707:
	mov	dl,[edi]
	mov	eax,[esi+0Ch]
	movzx	ecx,dl
	movsx	eax,word ptr [eax+ecx*2]
	shr	eax,2h
	test	al,1h
	jz	41573Ch

l0041571A:
	push	0h
	push	edx
	mov	ecx,esi
	call	dword ptr [4310FCh]
	mov	ecx,[ebp-14h]
	inc	edi
	movsx	eax,al
	lea	ecx,[ecx+ecx*4]
	lea	eax,[eax+ecx*2]
	add	eax,0D0h
	mov	[ebp-14h],eax
	cmp	edi,[ebx]
	jnz	415707h

l0041573C:
	mov	ebx,[ebp-2Ch]
	mov	esi,[ebp-20h]
	mov	edx,[ebp-18h]
	mov	ecx,[ebp-10h]
	mov	[ebp-28h],edi
	mov	edi,[ebp-30h]
	mov	eax,[ebp-28h]

l00415751:
	mov	[esi],eax
	cmp	eax,[ecx]
	jc	41576Bh

l00415757:
	sub	eax,edi
	add	eax,[ebp+10h]
	test	byte ptr [ebp+14h],1h
	jnz	415C6Eh

l00415766:
	jmp	41567Bh

l0041576B:
	push	25h
	mov	ecx,edx
	call	dword ptr [431100h]
	mov	ecx,[ebp-28h]
	cmp	[ecx],al
	jnz	4157A0h

l0041577C:
	mov	eax,[ebp-14h]
	dec	eax
	mov	[ebx],eax
	mov	eax,[esi]
	inc	eax
	cmp	byte ptr [ebp-19h],0h
	mov	[esi],eax
	jz	415A92h

l00415791:
	sub	eax,edi
	add	eax,[ebp+10h]
	test	byte ptr [ebp+14h],1h
	jnz	415C88h

l004157A0:
	mov	ecx,[ebp-18h]
	mov	esi,[esi]
	push	24h
	call	dword ptr [431100h]
	cmp	[esi],al
	mov	eax,[ebp-14h]
	mov	esi,[ebp-20h]
	jnz	415800h

l004157B7:
	mov	edx,[ebp-18h]
	dec	eax
	mov	[ebx],eax
	inc	dword ptr [esi]

l004157BF:
	mov	ecx,[ebp-10h]
	mov	eax,[esi]
	mov	[ebp-14h],eax
	mov	ecx,[ecx]
	cmp	eax,ecx
	jz	415861h

l004157D1:
	mov	al,[eax]
	mov	ecx,edx
	mov	[ebp-28h],al
	push	0h
	push	dword ptr [ebp-28h]
	call	dword ptr [4310FCh]
	movsx	eax,al
	add	eax,0E0h
	cmp	eax,4Ch
	ja	415875h

l004157F2:
	movzx	eax,byte ptr [eax+415D48h]
	jmp	dword ptr [415D24h+eax*4]

l00415800:
	cdq
	mov	[ebx+3Ch],edx
	mov	edx,[ebp-18h]
	mov	[ebx+38h],eax
	mov	dword ptr [ebx],0FFFFFFFFh
	mov	eax,[esi]
	mov	[ebp-14h],eax
	jmp	415922h

l0041581A:
	or	dword ptr [ebx+4Ch],40h
	jmp	415845h

l00415820:
	or	dword ptr [ebx+70h],4h
	jmp	415845h

l00415826:
	or	dword ptr [ebx+4Ch],100h
	jmp	415845h

l0041582F:
	or	dword ptr [ebx+70h],2h
	jmp	415845h

l00415835:
	or	dword ptr [ebx+4Ch],20h
	jmp	415845h

l0041583B:
	or	dword ptr [ebx+70h],1h
	jmp	415845h

l00415841:
	or	dword ptr [ebx+4Ch],18h

l00415845:
	mov	eax,[esi]
	mov	ecx,[ebp-10h]
	inc	eax
	mov	edx,[ebp-18h]
	mov	[esi],eax
	mov	[ebp-14h],eax
	mov	ecx,[ecx]
	cmp	eax,ecx
	jnz	4157D1h

l0041585D:
	cmp	eax,ecx
	jc	41587Ah

l00415861:
	sub	eax,edi
	add	eax,[ebp+10h]
	test	byte ptr [ebp+14h],1h
	jnz	415CA2h

l00415870:
	jmp	415A92h

l00415875:
	mov	eax,[esi]
	mov	[ebp-14h],eax

l0041587A:
	mov	ecx,[ebp-18h]
	push	2Ah
	call	dword ptr [431100h]
	mov	ecx,[ebp-14h]
	mov	edx,[esi]
	cmp	[ecx],al
	jnz	4158D6h

l0041588E:
	mov	eax,[ebp-10h]
	inc	edx
	mov	[ebp-14h],edx
	mov	eax,[eax]
	cmp	edx,eax
	jz	4158D4h

l0041589B:
	mov	ecx,[ebp-18h]
	mov	ecx,[ecx+0Ch]
	mov	edi,ecx

l004158A3:
	movzx	ecx,byte ptr [edx]
	movsx	ecx,word ptr [edi+ecx*2]
	shr	ecx,2h
	test	cl,1h
	jz	4158B7h

l004158B2:
	inc	edx
	cmp	edx,eax
	jnz	4158A3h

l004158B7:
	mov	edi,[ebp-30h]
	mov	[ebp-14h],edx
	cmp	edx,eax
	jz	4158D4h

l004158C1:
	mov	ecx,[ebp-18h]
	push	24h
	call	dword ptr [431100h]
	mov	edx,[ebp-14h]
	cmp	[edx],al
	jnz	4158D4h

l004158D3:
	inc	edx

l004158D4:
	mov	[esi],edx

l004158D6:
	mov	ecx,[ebp-10h]
	mov	eax,edx
	mov	[ebp-14h],eax
	cmp	edx,[ecx]
	jz	41591Ah

l004158E2:
	movzx	ecx,byte ptr [edx]
	mov	[ebp-14h],edx
	mov	edx,[ebp-18h]
	mov	eax,[edx+0Ch]
	movsx	eax,word ptr [eax+ecx*2]
	shr	eax,2h
	test	al,1h
	jz	41591Fh

l004158F9:
	push	edx
	lea	eax,[ebx+38h]
	mov	edx,esi
	push	eax
	push	dword ptr [ebp-10h]
	lea	ecx,[ebp-14h]
	call	416CD0h
	mov	edx,[ebp-18h]
	add	esp,0Ch
	mov	eax,[eax]
	mov	[ebp-14h],eax
	mov	[esi],eax
	jmp	415922h

l0041591A:
	mov	edx,[ebp-18h]
	jmp	415925h

l0041591F:
	mov	eax,[ebp-14h]

l00415922:
	mov	ecx,[ebp-10h]

l00415925:
	cmp	eax,[ecx]
	jc	41593Dh

l00415929:
	sub	eax,edi
	add	eax,[ebp+10h]
	test	byte ptr [ebp+14h],1h
	jnz	415CBCh

l00415938:
	jmp	415A92h

l0041593D:
	push	2Eh
	mov	ecx,edx
	call	dword ptr [431100h]
	mov	ecx,[ebp-14h]
	cmp	[ecx],al
	jnz	4159FFh

l00415952:
	mov	eax,[ebp-10h]
	inc	dword ptr [esi]
	mov	ecx,[esi]
	mov	[ebp-14h],ecx
	cmp	ecx,[eax]
	jz	4159B8h

l00415960:
	mov	ecx,[ebp-18h]
	push	2Ah
	call	dword ptr [431100h]
	mov	ecx,[ebp-14h]
	cmp	[ecx],al
	mov	eax,[ebp-10h]
	jnz	4159B8h

l00415975:
	mov	esi,[esi]
	mov	eax,[eax]
	inc	esi
	mov	edx,[ebp-18h]
	cmp	esi,eax
	jz	4159AEh

l00415981:
	mov	edi,[edx+0Ch]

l00415984:
	movzx	ecx,byte ptr [esi]
	movsx	ecx,word ptr [edi+ecx*2]
	shr	ecx,2h
	test	cl,1h
	jz	415998h

l00415993:
	inc	esi
	cmp	esi,eax
	jnz	415984h

l00415998:
	mov	edi,[ebp-30h]
	cmp	esi,eax
	jz	4159AEh

l0041599F:
	push	24h
	mov	ecx,edx
	call	dword ptr [431100h]
	cmp	[esi],al
	jnz	4159AEh

l004159AD:
	inc	esi

l004159AE:
	mov	eax,[ebp-20h]
	mov	[eax],esi
	mov	esi,eax
	mov	eax,[ebp-10h]

l004159B8:
	mov	ecx,[esi]
	cmp	ecx,[eax]
	jz	4159F1h

l004159BE:
	mov	edx,[ebp-18h]
	movzx	ecx,byte ptr [ecx]
	mov	eax,[edx+0Ch]
	movsx	eax,word ptr [eax+ecx*2]
	shr	eax,2h
	test	al,1h
	jz	4159F1h

l004159D2:
	push	edx
	lea	eax,[ebx+40h]
	mov	edx,esi
	push	eax
	push	dword ptr [ebp-10h]
	lea	ecx,[ebp-14h]
	call	416CD0h
	add	esp,0Ch
	mov	byte ptr [ebp-1Ah],1h
	mov	eax,[eax]
	mov	[esi],eax
	jmp	4159FFh

l004159F1:
	mov	dword ptr [ebx+40h],0h
	mov	dword ptr [ebx+44h],0h

l004159FF:
	mov	ecx,[ebp-10h]
	mov	eax,[esi]
	mov	[ebp-14h],eax
	cmp	eax,[ecx]
	jz	415A5Eh

l00415A0B:
	mov	edi,[ebp-18h]
	mov	ebx,eax

l00415A10:
	push	6Ch
	mov	ecx,edi
	call	dword ptr [431100h]
	cmp	[ebx],al
	jz	415A49h

l00415A1E:
	mov	esi,[esi]
	mov	ecx,edi
	push	4Ch
	call	dword ptr [431100h]
	cmp	[esi],al
	jz	415A46h

l00415A2E:
	mov	eax,[ebp-20h]
	mov	ecx,edi
	push	68h
	mov	esi,[eax]
	call	dword ptr [431100h]
	cmp	[esi],al
	mov	esi,[ebp-20h]
	jnz	415A55h

l00415A44:
	jmp	415A49h

l00415A46:
	mov	esi,[ebp-20h]

l00415A49:
	mov	ebx,[esi]
	mov	eax,[ebp-10h]
	inc	ebx
	mov	[esi],ebx
	cmp	ebx,[eax]
	jnz	415A10h

l00415A55:
	mov	edi,[ebp-30h]
	mov	ebx,[ebp-2Ch]
	mov	ecx,[ebp-10h]

l00415A5E:
	mov	eax,[esi]
	mov	[ebp-2Ch],eax
	cmp	eax,[ecx]
	jc	415A78h

l00415A67:
	sub	eax,edi
	add	eax,[ebp+10h]
	test	byte ptr [ebp+14h],1h
	jnz	415CD6h

l00415A76:
	jmp	415A92h

l00415A78:
	cmp	byte ptr [ebp-19h],0h
	jz	415AA6h

l00415A7E:
	mov	ecx,[ebp-18h]
	push	7Ch
	call	dword ptr [431100h]
	mov	ecx,[ebp-2Ch]
	cmp	[ecx],al
	jnz	415AA6h

l00415A90:
	inc	dword ptr [esi]

l00415A92:
	mov	al,1h
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret

l00415AA6:
	mov	eax,[esi]
	mov	ecx,[ebp-18h]
	push	0h
	mov	al,[eax]
	mov	[ebp-2Ch],al
	push	dword ptr [ebp-2Ch]
	call	dword ptr [4310FCh]
	movsx	eax,al
	add	eax,0BDh
	cmp	eax,35h
	ja	415C0Fh

l00415ACA:
	movzx	eax,byte ptr [eax+415DD4h]
	jmp	dword ptr [415D98h+eax*4]

l00415AD8:
	or	dword ptr [ebx+4Ch],4h

l00415ADC:
	mov	eax,[ebx+4Ch]
	and	eax,0FFFFF9FFh
	or	eax,800h
	jmp	415B2Ah

l00415AEB:
	mov	eax,[ebx+4Ch]
	and	eax,0FFFFF5FFh
	or	eax,400h
	jmp	415B2Ah

l00415AFA:
	or	dword ptr [ebx+4Ch],4h

l00415AFE:
	mov	eax,[ebx+4Ch]
	and	eax,0FFFFD3FFh
	or	eax,1200h
	jmp	415B2Ah

l00415B0D:
	mov	eax,[ebx+4Ch]
	and	eax,0FFFFEFFFh
	or	eax,2000h
	mov	[ebx+4Ch],eax

l00415B1D:
	mov	eax,[ebx+4Ch]
	and	eax,0FFFFF3FFh

l00415B25:
	or	eax,200h

l00415B2A:
	mov	[ebx+4Ch],eax

l00415B2D:
	mov	ecx,[ebp-10h]

l00415B30:
	mov	ebx,[esi]
	inc	ebx
	cmp	byte ptr [ebp-19h],0h
	mov	[esi],ebx
	jz	415A92h

l00415B3F:
	cmp	ebx,[ecx]
	jz	415B56h

l00415B43:
	mov	ecx,[ebp-18h]
	push	7Ch
	call	dword ptr [431100h]
	cmp	[ebx],al
	jz	415A90h

l00415B56:
	mov	eax,[esi]
	sub	eax,edi
	add	eax,[ebp+10h]
	test	byte ptr [ebp+14h],1h
	jnz	415CF0h

l00415B67:
	jmp	415A92h

l00415B6C:
	mov	ecx,[ebp-10h]
	inc	dword ptr [esi]
	mov	eax,[esi]
	cmp	eax,[ecx]
	jc	415B88h

l00415B77:
	sub	eax,edi
	add	eax,[ebp+10h]
	test	byte ptr [ebp+14h],1h
	jnz	415D0Ah

l00415B86:
	jmp	415B8Dh

l00415B88:
	mov	al,[eax]
	mov	[ebx+48h],al

l00415B8D:
	or	dword ptr [ebx+70h],8h
	mov	dword ptr [ebx],0FFFFFFFEh
	jmp	415B30h

l00415B99:
	mov	ecx,[ebp-18h]
	push	20h
	call	dword ptr [431100h]
	or	dword ptr [ebx+70h],8h
	mov	[ebx+48h],al
	mov	dword ptr [ebx],0FFFFFFFEh
	jmp	415B2Dh

l00415BB6:
	or	dword ptr [ebx+4Ch],4h
	jmp	415B2Dh

l00415BBF:
	mov	eax,[ebx+4Ch]
	and	eax,0FFFFC3FFh
	jmp	415B25h

l00415BCC:
	mov	dword ptr [ebx+68h],1h
	mov	dword ptr [ebx+6Ch],0h
	jmp	415B2Dh

l00415BDF:
	cmp	byte ptr [ebp-1Ah],0h
	jz	415BF1h

l00415BE5:
	mov	eax,[ebx+40h]
	mov	[ebx+68h],eax
	mov	eax,[ebx+44h]
	mov	[ebx+6Ch],eax

l00415BF1:
	mov	dword ptr [ebx+40h],6h
	mov	dword ptr [ebx+44h],0h
	jmp	415B2Dh

l00415C04:
	mov	dword ptr [ebx],0FFFFFFFDh
	jmp	415B2Dh

l00415C0F:
	mov	eax,[esi]
	sub	eax,edi
	add	eax,[ebp+10h]
	test	byte ptr [ebp+14h],1h
	jz	415B2Dh

l00415C20:
	push	dword ptr [ebp-24h]
	lea	ecx,[ebp-44h]
	push	eax
	call	403F80h
	mov	ecx,eax
	mov	dword ptr [ebp-4h],8h
	call	411520h

l00415C3A:
	push	edx
	push	dword ptr [ebp+10h]
	lea	ecx,[ebp-44h]
	call	403F80h
	mov	ecx,eax
	mov	dword ptr [ebp-4h],0h
	call	411520h

l00415C54:
	push	dword ptr [ebp-24h]
	push	ecx
	lea	ecx,[ebp-44h]
	call	403F80h
	mov	ecx,eax
	mov	dword ptr [ebp-4h],1h
	call	411520h

l00415C6E:
	push	dword ptr [ebp-24h]
	lea	ecx,[ebp-44h]
	push	eax
	call	403F80h
	mov	ecx,eax
	mov	dword ptr [ebp-4h],2h
	call	411520h

l00415C88:
	push	dword ptr [ebp-24h]
	lea	ecx,[ebp-44h]
	push	eax
	call	403F80h
	mov	ecx,eax
	mov	dword ptr [ebp-4h],3h
	call	411520h

l00415CA2:
	push	dword ptr [ebp-24h]
	lea	ecx,[ebp-44h]
	push	eax
	call	403F80h
	mov	ecx,eax
	mov	dword ptr [ebp-4h],4h
	call	411520h

l00415CBC:
	push	dword ptr [ebp-24h]
	lea	ecx,[ebp-44h]
	push	eax
	call	403F80h
	mov	ecx,eax
	mov	dword ptr [ebp-4h],5h
	call	411520h

l00415CD6:
	push	dword ptr [ebp-24h]
	lea	ecx,[ebp-44h]
	push	eax
	call	403F80h
	mov	ecx,eax
	mov	dword ptr [ebp-4h],6h
	call	411520h

l00415CF0:
	push	dword ptr [ebp-24h]
	lea	ecx,[ebp-44h]
	push	eax
	call	403F80h
	mov	ecx,eax
	mov	dword ptr [ebp-4h],9h
	call	411520h

l00415D0A:
	push	dword ptr [ebp-24h]
	lea	ecx,[ebp-44h]
	push	eax
	call	403F80h
	mov	ecx,eax
	mov	dword ptr [ebp-4h],7h
	call	411520h
l00415D24	dd	0x0041582F
l00415D28	dd	0x00415841
l00415D2C	dd	0x00415845
l00415D30	dd	0x00415835
l00415D34	dd	0x0041581A
l00415D38	dd	0x0041583B
l00415D3C	dd	0x00415820
l00415D40	dd	0x00415826
l00415D44	dd	0x00415875
l00415D48	db	0x00
l00415D49	db	0x08
l00415D4A	db	0x08
l00415D4B	db	0x01
l00415D4C	db	0x08
l00415D4D	db	0x08
l00415D4E	db	0x08
l00415D4F	db	0x02
l00415D50	db	0x08
l00415D51	db	0x08
l00415D52	db	0x08
l00415D53	db	0x03
l00415D54	db	0x08
l00415D55	db	0x04
l00415D56	db	0x08
l00415D57	db	0x08
l00415D58	db	0x05
l00415D59	db	0x08
l00415D5A	db	0x08
l00415D5B	db	0x08
l00415D5C	db	0x08
l00415D5D	db	0x08
l00415D5E	db	0x08
l00415D5F	db	0x08
l00415D60	db	0x08
l00415D61	db	0x08
l00415D62	db	0x08
l00415D63	db	0x08
l00415D64	db	0x08
l00415D65	db	0x06
l00415D66	db	0x08
l00415D67	db	0x08
l00415D68	db	0x08
l00415D69	db	0x08
l00415D6A	db	0x08
l00415D6B	db	0x08
l00415D6C	db	0x08
l00415D6D	db	0x08
l00415D6E	db	0x08
l00415D6F	db	0x08
l00415D70	db	0x08
l00415D71	db	0x08
l00415D72	db	0x08
l00415D73	db	0x08
l00415D74	db	0x08
l00415D75	db	0x08
l00415D76	db	0x08
l00415D77	db	0x08
l00415D78	db	0x08
l00415D79	db	0x08
l00415D7A	db	0x08
l00415D7B	db	0x08
l00415D7C	db	0x08
l00415D7D	db	0x08
l00415D7E	db	0x08
l00415D7F	db	0x08
l00415D80	db	0x08
l00415D81	db	0x08
l00415D82	db	0x08
l00415D83	db	0x08
l00415D84	db	0x08
l00415D85	db	0x08
l00415D86	db	0x08
l00415D87	db	0x07
l00415D88	db	0x08
l00415D89	db	0x08
l00415D8A	db	0x08
l00415D8B	db	0x08
l00415D8C	db	0x08
l00415D8D	db	0x08
l00415D8E	db	0x08
l00415D8F	db	0x08
l00415D90	db	0x02
l00415D91	db	0x08
l00415D92	db	0x08
l00415D93	db	0x08
l00415D94	db	0x02
00415D95                0F 1F 00                              ...        
l00415D98	dd	0x00415BCC
l00415D9C	dd	0x00415AFA
l00415DA0	dd	0x00415BB6
l00415DA4	dd	0x00415BDF
l00415DA8	dd	0x00415B6C
l00415DAC	dd	0x00415AD8
l00415DB0	dd	0x00415B1D
l00415DB4	dd	0x00415AFE
l00415DB8	dd	0x00415B0D
l00415DBC	dd	0x00415BBF
l00415DC0	dd	0x00415C04
l00415DC4	dd	0x00415AEB
l00415DC8	dd	0x00415ADC
l00415DCC	dd	0x00415B99
l00415DD0	dd	0x00415C0F
l00415DD4	db	0x00
l00415DD5	db	0x0E
l00415DD6	db	0x01
l00415DD7	db	0x0E
l00415DD8	db	0x02
l00415DD9	db	0x0E
l00415DDA	db	0x0E
l00415DDB	db	0x0E
l00415DDC	db	0x0E
l00415DDD	db	0x0E
l00415DDE	db	0x0E
l00415DDF	db	0x0E
l00415DE0	db	0x0E
l00415DE1	db	0x0E
l00415DE2	db	0x0E
l00415DE3	db	0x0E
l00415DE4	db	0x03
l00415DE5	db	0x04
l00415DE6	db	0x0E
l00415DE7	db	0x0E
l00415DE8	db	0x0E
l00415DE9	db	0x05
l00415DEA	db	0x0E
l00415DEB	db	0x0E
l00415DEC	db	0x0E
l00415DED	db	0x0E
l00415DEE	db	0x0E
l00415DEF	db	0x0E
l00415DF0	db	0x0E
l00415DF1	db	0x0E
l00415DF2	db	0x0E
l00415DF3	db	0x0E
l00415DF4	db	0x00
l00415DF5	db	0x06
l00415DF6	db	0x07
l00415DF7	db	0x08
l00415DF8	db	0x09
l00415DF9	db	0x0E
l00415DFA	db	0x06
l00415DFB	db	0x0E
l00415DFC	db	0x0E
l00415DFD	db	0x0E
l00415DFE	db	0x0E
l00415DFF	db	0x0A
l00415E00	db	0x0B
l00415E01	db	0x0C
l00415E02	db	0x0E
l00415E03	db	0x0E
l00415E04	db	0x03
l00415E05	db	0x0D
l00415E06	db	0x06
l00415E07	db	0x0E
l00415E08	db	0x0E
l00415E09	db	0x0C
00415E0A                               CC CC CC CC CC CC           ......

;; fn00415E10: 00415E10
;;   Called from:
;;     0040486F (in fn00404080)
fn00415E10 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42EDB8h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,20h
	push	ebx
	push	esi
	push	edi
	mov	eax,[43A008h]
	xor	eax,ebp
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	[ebp-18h],edx
	mov	esi,ecx
	cmp	byte ptr [esi+28h],0h
	jz	415E48h

;; fn00415E43: 00415E43
;;   Called from:
;;     00415E41 (in fn00415E10)
;;     00415E41 (in fn0041568F)
fn00415E43 proc
	call	416BB0h

;; fn00415E48: 00415E48
;;   Called from:
;;     00415E41 (in fn00415E10)
;;     00415E41 (in fn0041568F)
;;     00415E43 (in fn00415E43)
fn00415E48 proc
	mov	edi,[esi+20h]
	mov	ecx,[esi+24h]
	cmp	edi,ecx
	jl	415E61h

l00415E52:
	test	byte ptr [esi+44h],4h
	jnz	415F3Ch

l00415E5C:
	jmp	415EF6h

l00415E61:
	mov	ecx,[esi+4h]
	mov	eax,88888889h
	mov	ebx,[esi]
	sub	ecx,ebx
	imul	ecx
	mov	dword ptr [ebp-10h],0h
	add	edx,ecx
	sar	edx,6h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx
	jz	415EF6h

l00415E84:
	xor	eax,eax
	xor	ecx,ecx
	mov	[ebp-14h],eax
	nop	dword ptr [eax+eax+0h]

l00415E90:
	mov	edi,[esi+20h]
	lea	edx,[eax+ebx]
	cmp	[edx],edi
	jnz	415ECAh

l00415E9A:
	xor	ecx,ecx
	lea	eax,[esi+94h]
	cmp	[esi+90h],cl
	cmovz	eax,ecx

l00415EAB:
	mov	ecx,[ebp-18h]
	push	eax
	lea	eax,[esi+48h]
	push	eax
	lea	eax,[edx+4h]
	push	eax
	call	417600h
	mov	ebx,[esi]
	add	esp,0Ch
	mov	edi,[esi+20h]
	mov	eax,[ebp-14h]
	mov	ecx,[ebp-10h]

l00415ECA:
	add	eax,78h
	inc	ecx
	mov	[ebp-14h],eax
	mov	eax,88888889h
	mov	[ebp-10h],ecx
	mov	ecx,[esi+4h]
	sub	ecx,ebx
	imul	ecx
	add	edx,ecx
	mov	ecx,[ebp-10h]
	sar	edx,6h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx
	cmp	ecx,eax
	mov	eax,[ebp-14h]
	jc	415E90h

l00415EF6:
	inc	edi
	cmp	dword ptr [esi+18h],0h
	mov	[esi+20h],edi
	jz	415F28h

l00415F00:
	mov	ebx,[esi+24h]
	cmp	edi,ebx
	jge	415F28h

l00415F07:
	mov	eax,[esi+0Ch]
	mov	ecx,edi
	and	ecx,1Fh
	mov	edx,1h
	shl	edx,cl
	mov	ecx,edi
	shr	ecx,5h
	test	[eax+ecx*4],edx
	jz	415F28h

l00415F20:
	inc	edi
	mov	[esi+20h],edi
	cmp	edi,ebx
	jl	415F07h

l00415F28:
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

l00415F3C:
	push	ecx
	push	edi
	lea	ecx,[ebp-2Ch]
	call	404040h
	mov	ecx,eax
	mov	dword ptr [ebp-4h],0h
	call	4175B0h
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

;; fn00415F60: 00415F60
;;   Called from:
;;     0041456A (in fn00414540)
fn00415F60 proc
	push	esi
	push	edi
	mov	edi,ecx
	mov	esi,edx
	lea	eax,[edi+4h]
	xorps	xmm0,xmm0
	push	eax
	mov	dword ptr [edi],431384h
	movq	qword ptr [eax],xmm0
	lea	eax,[esi+4h]
	push	eax
	call	dword ptr [4311D0h]
	mov	dword ptr [edi],4324E8h
	add	esp,8h
	mov	eax,[esi+0Ch]
	mov	[edi+0Ch],eax
	mov	eax,[esi+10h]
	mov	[edi+10h],eax
	mov	eax,edi
	mov	dword ptr [edi+18h],0h
	mov	dword ptr [edi+1Ch],0h
	mov	dword ptr [edi+20h],0h
	mov	dword ptr [edi+24h],0FFFFFFFFh
	mov	dword ptr [edi],432480h
	mov	dword ptr [edi+14h],432420h
	pop	edi
	pop	esi
	ret
00415FC4             CC CC CC CC CC CC CC CC CC CC CC CC     ............

;; fn00415FD0: 00415FD0
;;   Called from:
;;     0041457B (in fn00414540)
fn00415FD0 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42EE04h
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
	mov	esi,edx
	mov	edi,ecx
	mov	[ebp-14h],edi
	mov	dword ptr [ebp-10h],0h
	mov	dword ptr [edi+28h],432380h
	mov	dword ptr [edi+30h],43248Ch
	mov	dword ptr [ebp-4h],0h
	push	esi
	mov	dword ptr [ebp-10h],2h
	call	414AF0h
	mov	dword ptr [ebp-4h],1h
	lea	ecx,[edi+14h]
	mov	eax,[edi+28h]
	mov	dword ptr [edi],432428h
	mov	dword ptr [ecx],4324ACh
	mov	eax,[eax+4h]
	mov	dword ptr [eax+edi+28h],43249Ch
	mov	eax,[edi+28h]
	mov	edx,[eax+4h]
	lea	eax,[edx-8h]
	mov	[edx+edi+24h],eax
	lea	edx,[esi+14h]
	neg	esi
	sbb	esi,esi
	and	edx,esi
	call	403D50h
	mov	eax,edi
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	mov	esp,ebp
	pop	ebp
	ret
00416079                            CC CC CC CC CC CC CC          .......

;; fn00416080: 00416080
;;   Called from:
;;     004121CE (in fn00412170)
;;     00416F57 (in fn00416DA0)
fn00416080 proc
	push	ebp
	mov	ebp,esp
	sub	esp,8h
	mov	edx,[ebp+10h]
	mov	eax,[ebp+8h]
	push	ebx
	push	esi
	mov	esi,[ebp+0Ch]
	mov	[ebp-4h],eax
	push	edi
	cmp	esi,edx
	jz	4160CFh

l00416099:
	mov	ebx,[ecx]
	mov	edi,[ecx+4h]
	mov	[ebp-8h],ebx

l004160A1:
	cmp	ebx,edi
	jz	4160CCh

l004160A5:
	mov	eax,esi
	mov	ecx,ebx
	cmp	esi,edx
	jz	4160C3h

l004160AD:
	nop	dword ptr [eax]

l004160B0:
	cmp	ecx,edi
	jz	4160DDh

l004160B4:
	mov	bl,[eax]
	cmp	bl,[ecx]
	jnz	4160C0h

l004160BA:
	inc	eax
	inc	ecx
	cmp	eax,edx
	jnz	4160B0h

l004160C0:
	mov	ebx,[ebp-8h]

l004160C3:
	cmp	ecx,edi
	jz	4160DDh

l004160C7:
	inc	esi
	cmp	esi,edx
	jnz	4160A1h

l004160CC:
	mov	eax,[ebp-4h]

l004160CF:
	pop	edi
	pop	esi
	mov	[eax],edx
	mov	[eax+4h],edx
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	0Ch

l004160DD:
	mov	ecx,[ebp-4h]
	pop	edi
	mov	[ecx],esi
	pop	esi
	mov	[ecx+4h],eax
	mov	eax,ecx
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	0Ch

;; fn004160F0: 004160F0
;;   Called from:
;;     00412E71 (in fn00412E08)
;;     00417213 (in fn004170C0)
fn004160F0 proc
	push	ebp
	mov	ebp,esp
	sub	esp,8h
	mov	edx,[ebp+10h]
	push	ebx
	mov	ebx,[ebp+8h]
	push	esi
	mov	esi,[ebp+0Ch]
	mov	[ebp-4h],ebx
	push	edi
	cmp	esi,edx
	jz	41613Fh

l00416109:
	mov	eax,[ecx]
	mov	edi,[ecx+4h]
	mov	[ebp-8h],eax

l00416111:
	cmp	eax,edi
	jz	41613Ch

l00416115:
	mov	ecx,esi
	cmp	esi,edx
	jz	416130h

l0041611B:
	nop	dword ptr [eax+eax+0h]

l00416120:
	cmp	eax,edi
	jz	41614Fh

l00416124:
	mov	bl,[ecx]
	cmp	bl,[eax]
	jnz	416130h

l0041612A:
	inc	ecx
	inc	eax
	cmp	ecx,edx
	jnz	416120h

l00416130:
	cmp	eax,edi
	jz	41614Fh

l00416134:
	mov	eax,[ebp-8h]
	inc	esi
	cmp	esi,edx
	jnz	416111h

l0041613C:
	mov	ebx,[ebp-4h]

l0041613F:
	pop	edi
	pop	esi
	mov	[ebx],edx
	mov	eax,ebx
	mov	[ebx+4h],edx
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	0Ch

l0041614F:
	mov	ebx,[ebp-4h]
	mov	eax,ebx
	pop	edi
	mov	[ebx],esi
	pop	esi
	mov	[ebx+4h],ecx
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	0Ch
00416162       CC CC CC CC CC CC CC CC CC CC CC CC CC CC   ..............

;; fn00416170: 00416170
;;   Called from:
;;     00414048 (in fn00413B30)
;;     004153AE (in fn00415200)
fn00416170 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42EE20h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,20h
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
	mov	[ebp-1Ch],esi
	mov	eax,[esi+4h]
	mov	ecx,eax
	sub	ecx,[esi]
	mov	[ebp-14h],eax
	mov	eax,88888889h
	imul	ecx
	mov	edi,[ebp+8h]
	add	edx,ecx
	mov	[ebp-28h],edi
	mov	ecx,[esi+8h]
	sub	ecx,[esi]
	sar	edx,6h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx
	mov	[ebp-24h],eax
	mov	eax,88888889h
	imul	ecx
	add	edx,ecx
	sar	edx,6h
	mov	ecx,edx
	shr	ecx,1Fh
	add	ecx,edx
	cmp	edi,ecx
	jbe	41645Fh

l004161E6:
	cmp	edi,2222222h
	ja	4164D3h

l004161F2:
	mov	edx,ecx
	mov	eax,2222222h
	shr	edx,1h
	sub	eax,edx
	cmp	ecx,eax
	jbe	416208h

l00416201:
	mov	eax,edi
	mov	[ebp-14h],edi
	jmp	416213h

l00416208:
	lea	eax,[ecx+edx]
	cmp	eax,edi
	cmovc	eax,edi

l00416210:
	mov	[ebp-14h],eax

l00416213:
	mov	ecx,eax
	shl	ecx,4h
	sub	ecx,eax
	shl	ecx,3h
	mov	[ebp-2Ch],ecx
	cmp	eax,2222222h
	jbe	41622Ch

l00416227:
	or	ecx,0FFh
	jmp	416234h

l0041622C:
	cmp	ecx,1000h
	jc	41625Dh

l00416234:
	lea	eax,[ecx+23h]
	or	edx,0FFh
	cmp	eax,ecx
	cmovbe	eax,edx

l0041623F:
	push	eax
	call	427511h
	add	esp,4h
	test	eax,eax
	jz	416257h

l0041624C:
	lea	ecx,[eax+23h]
	and	ecx,0E0h
	mov	[ecx-4h],eax
	jmp	416276h

l00416257:
	call	dword ptr [431290h]

l0041625D:
	test	ecx,ecx
	jz	416274h

l00416261:
	push	ecx
	call	427511h
	add	esp,4h
	mov	[ebp-20h],eax
	mov	ecx,eax
	mov	[ebp-18h],eax
	jmp	41627Ch

l00416274:
	xor	ecx,ecx

l00416276:
	mov	[ebp-18h],ecx
	mov	[ebp-20h],ecx

l0041627C:
	mov	edx,[ebp-24h]
	mov	eax,edx
	shl	eax,4h
	sub	eax,edx
	mov	dword ptr [ebp-4h],0h
	push	dword ptr [ebp+10h]
	lea	ecx,[ecx+eax*8]
	mov	eax,edi
	sub	eax,edx
	mov	[ebp-24h],ecx
	push	eax
	push	ecx
	mov	ecx,[ebp+0Ch]
	call	414FE0h
	mov	eax,[esi+4h]
	mov	esi,[esi]
	mov	[ebp-14h],eax
	mov	[ebp-18h],esi
	cmp	esi,eax
	jz	4163BCh

l004162B7:
	mov	eax,[ebp-20h]
	add	esi,18h
	mov	ecx,[ebp-18h]
	mov	edx,[ebp-14h]
	sub	ecx,eax
	mov	[ebp-18h],ecx
	lea	edi,[eax+14h]
	nop	dword ptr [eax+eax+0h]

l004162D0:
	mov	eax,[esi-18h]
	mov	[edi-14h],eax
	mov	dword ptr [edi],0h
	mov	dword ptr [edi+4h],0h
	movups	xmm0,[esi-14h]
	movups	[edi-10h],xmm0
	movq	xmm0,qword ptr [esi-4h]
	movq	qword ptr [edi],xmm0
	mov	dword ptr [ecx+edi],0h
	mov	dword ptr [esi],0Fh
	mov	byte ptr [esi-14h],0h
	mov	dword ptr [edi+18h],0h
	mov	dword ptr [edi+1Ch],0h
	movups	xmm0,[esi+4h]
	movups	[edi+8h],xmm0
	movq	xmm0,qword ptr [esi+14h]
	movq	qword ptr [edi+18h],xmm0
	mov	dword ptr [esi+14h],0h
	mov	dword ptr [esi+18h],0Fh
	mov	byte ptr [esi+4h],0h
	mov	eax,[esi+20h]
	mov	[edi+24h],eax
	mov	eax,[esi+24h]
	mov	[edi+28h],eax
	mov	eax,[esi+28h]
	mov	[edi+2Ch],eax
	mov	eax,[esi+2Ch]
	mov	[edi+30h],eax
	movzx	eax,byte ptr [esi+30h]
	mov	[edi+34h],al
	mov	eax,[esi+34h]
	mov	[edi+38h],eax
	mov	eax,[esi+38h]
	mov	[edi+3Ch],eax
	mov	eax,[esi+3Ch]
	mov	[edi+40h],eax
	mov	byte ptr [edi+44h],0h
	cmp	byte ptr [esi+40h],0h
	jz	41638Fh

l00416372:
	mov	byte ptr [ebp-4h],1h
	mov	ecx,[esi+48h]
	mov	[edi+4Ch],ecx
	mov	eax,[ecx]
	call	dword ptr [eax+4h]
	mov	ecx,[ebp-18h]
	mov	edx,[ebp-14h]
	mov	byte ptr [ebp-4h],0h
	mov	byte ptr [edi+44h],1h

l0041638F:
	mov	eax,[esi+50h]
	mov	[edi+54h],eax
	mov	eax,[esi+54h]
	mov	[edi+58h],eax
	mov	eax,[esi+58h]
	add	esi,78h
	mov	[edi+5Ch],eax
	add	edi,78h
	lea	eax,[esi-18h]
	cmp	eax,edx
	jnz	4162D0h

l004163B2:
	mov	eax,[ebp-1Ch]
	mov	edi,[ebp-28h]
	mov	esi,[eax]
	jmp	4163BFh

l004163BC:
	mov	eax,[ebp-1Ch]

l004163BF:
	test	esi,esi
	jz	41642Eh

l004163C3:
	mov	ecx,[eax+4h]
	mov	[ebp-28h],ecx
	cmp	esi,ecx
	jz	4163E4h

l004163CD:
	nop	dword ptr [eax]

l004163D0:
	mov	ecx,esi
	call	4148B0h
	add	esi,78h
	cmp	esi,[ebp-28h]
	jnz	4163D0h

l004163DF:
	mov	eax,[ebp-1Ch]
	mov	esi,[eax]

l004163E4:
	mov	ecx,[eax+8h]
	mov	eax,88888889h
	sub	ecx,esi
	imul	ecx
	add	edx,ecx
	sar	edx,6h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx
	mov	ecx,eax
	shl	ecx,4h
	sub	ecx,eax
	shl	ecx,3h
	cmp	ecx,1000h
	jc	416424h

l0041640E:
	mov	edx,[esi-4h]
	add	ecx,23h
	sub	esi,edx
	lea	eax,[esi-4h]
	cmp	eax,1Fh
	ja	416257h

l00416422:
	mov	esi,edx

l00416424:
	push	ecx
	push	esi
	call	42763Fh
	add	esp,8h

l0041642E:
	mov	ecx,[ebp-20h]
	mov	eax,edi
	mov	edx,[ebp-1Ch]
	shl	eax,4h
	sub	eax,edi
	mov	[edx],ecx
	lea	eax,[ecx+eax*8]
	mov	[edx+4h],eax
	mov	eax,[ebp-2Ch]
	add	eax,ecx
	mov	[edx+8h],eax
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	0Ch

l0041645F:
	mov	edx,[ebp-24h]
	cmp	edi,edx
	jbe	41648Eh

l00416466:
	push	dword ptr [ebp+10h]
	mov	ecx,[ebp+0Ch]
	sub	edi,edx
	push	edi
	push	dword ptr [ebp-14h]
	call	414FE0h
	mov	[esi+4h],eax
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	0Ch

l0041648E:
	jz	4164BFh

l00416490:
	mov	ecx,[esi]
	mov	eax,edi
	shl	eax,4h
	sub	eax,edi
	mov	edi,[ebp-14h]
	lea	eax,[ecx+eax*8]
	mov	[ebp-2Ch],eax
	mov	esi,eax
	cmp	eax,edi
	jz	4164B6h

l004164A8:
	mov	ecx,esi
	call	4148B0h
	add	esi,78h
	cmp	esi,edi
	jnz	4164A8h

l004164B6:
	mov	eax,[ebp-1Ch]
	mov	ecx,[ebp-2Ch]
	mov	[eax+4h],ecx

l004164BF:
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	0Ch

l004164D3:
	call	403730h
	mov	eax,[ebp-24h]
	push	eax
	push	eax
	call	411180h
	push	dword ptr [ebp-14h]
	push	dword ptr [ebp-18h]
	call	4111B0h
	push	0h
	push	0h
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
	push	esi
	mov	esi,[ecx]
	push	edi
	mov	edi,[ecx+4h]
	cmp	esi,edi
	jz	41651Eh

l0041650B:
	nop	dword ptr [eax+eax+0h]

l00416510:
	mov	ecx,esi
	call	4014C0h
	add	esi,3Ch
	cmp	esi,edi
	jnz	416510h

l0041651E:
	pop	edi
	pop	esi
	ret
00416521    CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC  ...............

;; fn00416530: 00416530
;;   Called from:
;;     00415304 (in fn00415200)
fn00416530 proc
	push	ebp
	mov	ebp,esp
	sub	esp,14h
	mov	eax,[ebp+8h]
	mov	[ebp-4h],eax
	mov	eax,[ebp+0Ch]
	push	ebx
	mov	ebx,ecx
	mov	[ebp-0Ch],eax
	push	esi
	push	edi
	mov	eax,88888889h
	mov	[ebp-10h],ebx
	mov	edi,[ebx+4h]
	mov	ecx,edi
	mov	esi,[ebx]
	sub	ecx,esi
	imul	ecx
	add	edx,ecx
	mov	ecx,[ebx+8h]
	sar	edx,6h
	sub	ecx,esi
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx
	mov	[ebp-8h],eax
	mov	eax,88888889h
	imul	ecx
	add	edx,ecx
	mov	ecx,[ebp-4h]
	sar	edx,6h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx
	mov	[ebp-14h],eax
	cmp	ecx,eax
	jbe	4166ACh

l0041658F:
	cmp	ecx,2222222h
	ja	41674Dh

l0041659B:
	mov	edx,eax
	mov	eax,2222222h
	shr	edx,1h
	sub	eax,edx
	mov	[ebp-10h],edx
	mov	edx,[ebp-14h]
	cmp	edx,eax
	jbe	4165B5h

l004165B0:
	mov	[ebp-8h],ecx
	jmp	4165C2h

l004165B5:
	mov	eax,[ebp-10h]
	add	eax,edx
	cmp	eax,ecx
	cmovc	eax,ecx

l004165BF:
	mov	[ebp-8h],eax

l004165C2:
	test	esi,esi
	jz	416610h

l004165C6:
	cmp	esi,edi
	jz	4165E3h

l004165CA:
	nop	word ptr [eax+eax+0h]

l004165D0:
	mov	ecx,esi
	call	4148B0h
	add	esi,78h
	cmp	esi,edi
	jnz	4165D0h

l004165DE:
	mov	esi,[ebx]
	mov	edx,[ebp-14h]

l004165E3:
	mov	eax,edx
	shl	eax,4h
	sub	eax,edx
	shl	eax,3h
	cmp	eax,1000h
	jc	416606h

l004165F4:
	mov	ecx,[esi-4h]
	add	eax,23h
	sub	esi,ecx
	add	esi,0FCh
	cmp	esi,1Fh
	ja	41666Dh

l00416604:
	mov	esi,ecx

l00416606:
	push	eax
	push	esi
	call	42763Fh
	add	esp,8h

l00416610:
	mov	eax,[ebp-8h]
	mov	dword ptr [ebx],0h
	mov	dword ptr [ebx+4h],0h
	mov	dword ptr [ebx+8h],0h
	test	eax,eax
	jz	416690h

l0041662B:
	cmp	eax,2222222h
	ja	41674Dh

l00416636:
	mov	esi,eax
	shl	esi,4h
	sub	esi,eax
	shl	esi,3h
	cmp	esi,1000h
	jc	416673h

l00416648:
	lea	eax,[esi+23h]
	or	ecx,0FFh
	cmp	eax,esi
	cmovbe	eax,ecx

l00416653:
	push	eax
	call	427511h
	mov	ecx,eax
	add	esp,4h
	test	ecx,ecx
	jz	41666Dh

l00416662:
	lea	eax,[ecx+23h]
	and	eax,0E0h
	mov	[eax-4h],ecx
	jmp	416684h

l0041666D:
	call	dword ptr [431290h]

l00416673:
	test	esi,esi
	jz	416682h

l00416677:
	push	esi
	call	427511h
	add	esp,4h
	jmp	416684h

l00416682:
	xor	eax,eax

l00416684:
	mov	[ebx],eax
	mov	[ebx+4h],eax
	mov	eax,[ebx]
	add	eax,esi
	mov	[ebx+8h],eax

l00416690:
	push	dword ptr [ebp-0Ch]
	mov	eax,[ebp-4h]
	mov	ecx,ebx
	push	eax
	push	dword ptr [ebx]
	call	414FE0h
	pop	edi
	pop	esi
	mov	[ebx+4h],eax
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	8h

l004166AC:
	mov	eax,[ebp-8h]
	cmp	ecx,eax
	jbe	4166F5h

l004166B3:
	cmp	esi,edi
	jz	4166DBh

l004166B7:
	mov	ebx,[ebp-0Ch]
	nop	word ptr [eax+eax+0h]

l004166C0:
	push	ebx
	mov	ecx,esi
	call	418390h
	add	esi,78h
	cmp	esi,edi
	jnz	4166C0h

l004166CF:
	mov	ebx,[ebp-10h]
	mov	ecx,[ebp-4h]
	mov	eax,[ebp-8h]
	mov	edi,[ebx+4h]

l004166DB:
	push	dword ptr [ebp-0Ch]
	sub	ecx,eax
	push	ecx
	push	edi
	mov	ecx,ebx
	call	414FE0h
	pop	edi
	pop	esi
	mov	[ebx+4h],eax
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	8h

l004166F5:
	mov	eax,ecx
	shl	eax,4h
	sub	eax,ecx
	lea	eax,[esi+eax*8]
	mov	[ebp-4h],eax
	cmp	esi,eax
	jz	41672Ah

l00416706:
	mov	ebx,eax
	nop	dword ptr [eax+eax+0h]

l00416710:
	push	dword ptr [ebp-0Ch]
	mov	ecx,esi
	call	418390h
	add	esi,78h
	cmp	esi,ebx
	jnz	416710h

l00416721:
	mov	ebx,[ebp-10h]
	mov	eax,[ebp-4h]
	mov	edi,[ebx+4h]

l0041672A:
	mov	esi,eax
	cmp	eax,edi
	jz	416741h

l00416730:
	mov	ecx,esi
	call	4148B0h
	add	esi,78h
	cmp	esi,edi
	jnz	416730h

l0041673E:
	mov	eax,[ebp-4h]

l00416741:
	pop	edi
	pop	esi
	mov	[ebx+4h],eax
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	8h

l0041674D:
	call	403730h
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

;; fn00416760: 00416760
;;   Called from:
;;     004153CB (in fn00415200)
fn00416760 proc
	push	ebp
	mov	ebp,esp
	and	esp,0F8h
	sub	esp,14h
	push	ebx
	push	esi
	push	edi
	mov	edi,ecx
	mov	esi,[edi+0Ch]
	test	esi,esi
	jz	4167CDh

;; fn00416775: 00416775
;;   Called from:
;;     00416773 (in fn00416760)
;;     00416773 (in fn00416530)
;;     00416773 (in fn00416530)
fn00416775 proc
	mov	ecx,[edi]
	jns	416793h

l00416779:
	mov	eax,esi
	neg	eax
	jz	416793h

l0041677F:
	mov	eax,esi
	mov	ebx,ecx
	not	eax
	shr	eax,5h
	lea	eax,[0004h+eax*4]
	sub	ebx,eax
	jmp	41679Bh

l00416793:
	mov	eax,esi
	shr	eax,5h
	lea	ebx,[ecx+eax*4]

l0041679B:
	push	0h
	lea	eax,[esp+1Ch]
	mov	[esp+14h],ecx
	push	eax
	lea	ecx,[esp+18h]
	mov	dword ptr [esp+1Ch],0h
	and	esi,1Fh
	call	416950h
	push	esi
	push	ebx
	mov	ecx,edi
	push	dword ptr [eax+4h]
	push	dword ptr [eax]
	lea	eax,[esp+20h]
	push	eax
	call	4169B0h

l004167CD:
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	8h
004167D6                   CC CC CC CC CC CC CC CC CC CC       ..........

;; fn004167E0: 004167E0
;;   Called from:
;;     00413CD5 (in fn00413B30)
;;     00413D85 (in fn00413B30)
;;     00413F59 (in fn00413B30)
;;     0041803E (in fn00417F50)
;;     00428385 (in fn00428320)
fn004167E0 proc
	push	ebp
	mov	ebp,esp
	sub	esp,14h
	mov	eax,[ebp+8h]
	mov	edx,[ebp+0Ch]
	push	ebx
	mov	ebx,[ebp+14h]
	push	esi
	push	edi
	mov	edi,ecx
	mov	[ebp-4h],eax
	mov	ecx,[ebp+10h]
	mov	[ebp-14h],ecx
	mov	esi,[edi+10h]
	cmp	esi,eax
	jc	416940h

l00416808:
	mov	eax,esi
	sub	eax,[ebp-4h]
	cmp	eax,edx
	cmovc	edx,eax

l00416812:
	mov	[ebp-0Ch],edx
	cmp	edx,ebx
	jnz	41683Eh

l00416819:
	cmp	dword ptr [edi+14h],10h
	mov	edx,edi
	jc	416823h

l00416821:
	mov	edx,[edi]

l00416823:
	push	ebx
	push	ecx
	mov	ecx,[ebp-4h]
	add	ecx,edx
	push	ecx
	call	42D1C9h
	add	esp,0Ch
	mov	eax,edi
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	10h

l0041683E:
	mov	eax,esi
	sub	eax,edx
	sub	eax,[ebp-4h]
	inc	eax
	mov	[ebp-10h],eax
	mov	eax,ebx
	sub	eax,edx
	mov	[ebp-8h],eax
	cmp	ebx,edx
	jnc	416890h

l00416854:
	add	eax,esi
	mov	edx,edi
	cmp	dword ptr [edi+14h],10h
	mov	[edi+10h],eax
	jc	416863h

l00416861:
	mov	edx,[edi]

l00416863:
	mov	esi,[ebp-4h]
	push	ebx
	add	esi,edx
	push	ecx
	push	esi
	call	42D1C9h
	push	dword ptr [ebp-10h]
	mov	eax,[ebp-0Ch]
	add	eax,esi
	push	eax
	lea	eax,[ebx+esi]
	push	eax
	call	42D1C9h
	add	esp,18h
	mov	eax,edi
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	10h

l00416890:
	mov	eax,[edi+14h]
	sub	eax,esi
	cmp	[ebp-8h],eax
	ja	416920h

l0041689E:
	mov	eax,[ebp-8h]
	add	eax,esi
	mov	[ebp-0Ch],edi
	cmp	dword ptr [edi+14h],10h
	mov	[edi+10h],eax
	jc	4168B4h

l004168AF:
	mov	eax,[edi]
	mov	[ebp-0Ch],eax

l004168B4:
	mov	eax,[ebp-4h]
	add	eax,[ebp-0Ch]
	mov	[ebp-4h],eax
	add	edx,eax
	lea	eax,[ebx+ecx]
	cmp	eax,[ebp-4h]
	jbe	4168DEh

l004168C7:
	mov	eax,[ebp-0Ch]
	add	eax,esi
	cmp	ecx,eax
	ja	4168DEh

l004168D0:
	cmp	edx,ecx
	ja	4168D8h

l004168D4:
	xor	esi,esi
	jmp	4168E0h

l004168D8:
	mov	esi,edx
	sub	esi,ecx
	jmp	4168E0h

l004168DE:
	mov	esi,ebx

l004168E0:
	push	dword ptr [ebp-10h]
	mov	eax,[ebp-8h]
	push	edx
	add	eax,edx
	push	eax
	call	42D1C9h
	push	esi
	push	dword ptr [ebp-14h]
	push	dword ptr [ebp-4h]
	call	42D1C9h
	mov	eax,[ebp-14h]
	sub	ebx,esi
	add	eax,esi
	add	eax,[ebp-8h]
	push	ebx
	push	eax
	mov	eax,[ebp-4h]
	add	eax,esi
	push	eax
	call	42D1CFh
	add	esp,24h
	mov	eax,edi
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	10h

l00416920:
	push	ebx
	push	ecx
	push	edx
	push	dword ptr [ebp-4h]
	mov	byte ptr [ebp-10h],0h
	mov	ecx,edi
	push	dword ptr [ebp-10h]
	push	dword ptr [ebp-8h]
	call	4173F0h
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	10h

l00416940:
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

;; fn00416950: 00416950
;;   Called from:
;;     004167B5 (in fn00416775)
fn00416950 proc
	push	ebp
	mov	ebp,esp
	mov	edx,[ecx+4h]
	push	esi
	mov	esi,[ecx]
	mov	ecx,[ebp+0Ch]
	push	edi
	mov	edi,[ebp+8h]
	test	ecx,ecx
	jns	416991h

;; fn00416964: 00416964
;;   Called from:
;;     00416962 (in fn00416950)
;;     00416962 (in fn004167E0)
;;     00416962 (in fn004167E0)
fn00416964 proc
	mov	eax,ecx
	neg	eax
	cmp	edx,eax
	jnc	416991h

l0041696C:
	add	edx,ecx
	mov	eax,0FFFFFFFCh
	mov	ecx,edx
	not	ecx
	shr	ecx,5h
	shl	ecx,2h
	sub	eax,ecx
	add	esi,eax
	and	edx,1Fh
	mov	[edi],esi
	mov	eax,edi
	mov	[edi+4h],edx
	pop	edi
	pop	esi
	pop	ebp
	ret	8h

l00416991:
	add	edx,ecx
	mov	eax,edx
	shr	eax,5h
	and	edx,1Fh
	mov	[edi+4h],edx
	lea	esi,[esi+eax*4]
	mov	eax,edi
	mov	[edi],esi
	pop	edi
	pop	esi
	pop	ebp
	ret	8h
004169AB                                  CC CC CC CC CC            .....

;; fn004169B0: 004169B0
;;   Called from:
;;     004167C8 (in fn00416775)
fn004169B0 proc
	push	ebp
	mov	ebp,esp
	sub	esp,20h
	mov	eax,[43A008h]
	xor	eax,ebp
	mov	[ebp-8h],eax
	mov	eax,ecx
	xorps	xmm0,xmm0
	mov	ecx,[ebp+8h]
	push	ebx
	push	esi
	push	edi
	mov	edi,[eax]
	xor	esi,esi
	mov	[ebp-1Ch],eax
	mov	edx,edi
	mov	eax,[eax+0Ch]
	mov	[ebp-20h],ecx
	movlpd	qword ptr [ebp-10h],xmm0
	mov	[ebp-18h],edi
	mov	[ebp-14h],eax
	test	eax,eax
	jz	416A1Fh

l004169E9:
	mov	esi,[ebp+0Ch]
	sub	esi,edi
	sar	esi,2h
	shl	esi,5h
	add	esi,[ebp+10h]
	jns	416A11h

l004169F9:
	mov	eax,esi
	neg	eax
	jz	416A11h

l004169FF:
	mov	eax,esi
	not	eax
	shr	eax,5h
	lea	eax,[0004h+eax*4]
	sub	edx,eax
	jmp	416A19h

l00416A11:
	mov	eax,esi
	shr	eax,5h
	lea	edx,[edi+eax*4]

l00416A19:
	mov	eax,[ebp-14h]
	and	esi,1Fh

l00416A1F:
	xor	ecx,ecx
	movlpd	qword ptr [ebp-10h],xmm0
	mov	ebx,edi
	test	eax,eax
	jz	416A62h

l00416A2C:
	mov	ecx,[ebp+14h]
	sub	ecx,edi
	sar	ecx,2h
	shl	ecx,5h
	add	ecx,[ebp+18h]
	jns	416A54h

l00416A3C:
	mov	eax,ecx
	neg	eax
	jz	416A54h

l00416A42:
	mov	eax,ecx
	not	eax
	shr	eax,5h
	lea	eax,[0004h+eax*4]
	sub	ebx,eax
	jmp	416A5Ch

l00416A54:
	mov	eax,ecx
	shr	eax,5h
	lea	ebx,[edi+eax*4]

l00416A5C:
	mov	eax,[ebp-14h]
	and	ecx,1Fh

l00416A62:
	mov	edi,edx
	sub	edi,[ebp-18h]
	sar	edi,2h
	shl	edi,5h
	add	edi,esi
	mov	[ebp-0Ch],edi
	cmp	edx,ebx
	jnz	416A7Eh

l00416A76:
	cmp	esi,ecx
	jz	416B4Dh

l00416A7E:
	test	eax,eax
	jns	416A9Ch

l00416A82:
	neg	eax
	mov	eax,[ebp-14h]
	jz	416A9Ch

l00416A89:
	mov	edi,[ebp-18h]
	not	eax
	shr	eax,5h
	lea	eax,[0004h+eax*4]
	sub	edi,eax
	jmp	416AA5h

l00416A9C:
	mov	edi,[ebp-18h]
	shr	eax,5h
	lea	edi,[edi+eax*4]

l00416AA5:
	mov	eax,[ebp-14h]
	and	eax,1Fh
	mov	dword ptr [ebp-18h],1h
	mov	[ebp-14h],eax

l00416AB5:
	cmp	ebx,edi
	jnz	416ABDh

l00416AB9:
	cmp	ecx,eax
	jz	416AF1h

l00416ABD:
	mov	eax,[ebp-18h]
	shl	eax,cl
	test	[ebx],eax
	mov	eax,[edx]
	jz	416ACDh

l00416AC8:
	bts	eax,esi
	jmp	416AD0h

l00416ACD:
	btr	eax,esi

l00416AD0:
	mov	[edx],eax
	cmp	esi,1Fh
	jnc	416ADAh

l00416AD7:
	inc	esi
	jmp	416ADFh

l00416ADA:
	xor	esi,esi
	add	edx,4h

l00416ADF:
	mov	eax,[ebp-14h]
	cmp	ecx,1Fh
	jnc	416AEAh

l00416AE7:
	inc	ecx
	jmp	416AB5h

l00416AEA:
	xor	ecx,ecx
	add	ebx,4h
	jmp	416AB5h

l00416AF1:
	mov	eax,[ebp-1Ch]
	mov	edi,[ebp-0Ch]
	mov	ecx,[eax]
	sub	edx,ecx
	sar	edx,2h
	shl	edx,5h
	add	edx,esi
	cmp	edx,7FFFFFFFh
	ja	416B94h

l00416B0F:
	mov	ebx,[eax+4h]
	lea	esi,[edx+1Fh]
	mov	eax,ebx
	shr	esi,5h
	sub	eax,ecx
	sar	eax,2h
	cmp	esi,eax
	jnc	416B32h

l00416B23:
	lea	eax,[ecx+esi*4]
	cmp	eax,ebx
	mov	ebx,[ebp-1Ch]
	jz	416B35h

l00416B2D:
	mov	[ebx+4h],eax
	jmp	416B35h

l00416B32:
	mov	ebx,[ebp-1Ch]

l00416B35:
	mov	[ebx+0Ch],edx
	and	edx,1Fh
	jbe	416B50h

l00416B3D:
	mov	eax,[ebx]
	mov	ecx,edx
	mov	edx,[ebp-18h]
	shl	edx,cl
	dec	edx
	and	[eax+esi*4-4h],edx
	jmp	416B50h

l00416B4D:
	mov	ebx,[ebp-1Ch]

l00416B50:
	mov	ecx,[ebx]
	test	edi,edi
	jns	416B6Eh

l00416B56:
	mov	eax,edi
	neg	eax
	jz	416B6Eh

l00416B5C:
	mov	eax,edi
	not	eax
	shr	eax,5h
	lea	eax,[0004h+eax*4]
	sub	ecx,eax
	jmp	416B76h

l00416B6E:
	mov	eax,edi
	shr	eax,5h
	lea	ecx,[ecx+eax*4]

l00416B76:
	mov	eax,[ebp-20h]
	and	edi,1Fh
	mov	[eax],ecx
	mov	ecx,[ebp-8h]
	mov	[eax+4h],edi
	xor	ecx,ebp
	pop	edi
	pop	esi
	pop	ebx
	call	427500h
	mov	esp,ebp
	pop	ebp
	ret	14h

l00416B94:
	call	416BA0h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h

;; fn00416BA0: 00416BA0
;;   Called from:
;;     00416B94 (in fn004169B0)
;;     00416B9F (in fn004169B0)
fn00416BA0 proc
	push	432150h
	call	dword ptr [431194h]
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h

;; fn00416BB0: 00416BB0
;;   Called from:
;;     00415E43 (in fn00415E43)
;;     00416BAF (in fn00416BA0)
fn00416BB0 proc
	push	ebp
	mov	ebp,esp
	sub	esp,0Ch
	push	ebx
	push	esi
	mov	esi,ecx
	push	edi
	mov	eax,[esi+18h]
	mov	ebx,eax
	test	eax,eax
	jz	416BE4h

l00416BC4:
	cmp	[esi+24h],eax
	jz	416BE4h

l00416BC9:
	push	87h
	push	431F90h
	push	432168h
	call	dword ptr [431294h]
	mov	ebx,[esi+18h]
	add	esp,0Ch

l00416BE4:
	mov	edi,[esi]
	xor	ecx,ecx
	mov	[ebp-8h],ecx
	mov	eax,88888889h
	mov	ecx,[esi+4h]
	sub	ecx,edi
	imul	ecx
	add	edx,ecx
	sar	edx,6h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx
	jz	416C7Fh

l00416C05:
	xor	edx,edx
	mov	[ebp-4h],edx
	nop	word ptr [eax+eax+0h]

l00416C10:
	mov	ebx,[esi+18h]
	test	ebx,ebx
	jz	416C3Ah

l00416C17:
	mov	ecx,[edx+edi]
	test	ecx,ecx
	js	416C3Ah

l00416C1E:
	mov	edx,[esi+0Ch]
	mov	edi,ecx
	shr	edi,5h
	and	ecx,1Fh
	mov	eax,1h
	shl	eax,cl
	test	[edx+edi*4],eax
	mov	edx,[ebp-4h]
	jnz	416C54h

l00416C38:
	mov	edi,[esi]

l00416C3A:
	lea	eax,[edi+4h]
	add	eax,edx
	mov	dword ptr [eax+10h],0h
	cmp	dword ptr [eax+14h],10h
	jc	416C4Eh

l00416C4C:
	mov	eax,[eax]

l00416C4E:
	mov	byte ptr [eax],0h
	mov	ebx,[esi+18h]

l00416C54:
	mov	ecx,[esi+4h]
	add	edx,78h
	mov	edi,[esi]
	mov	eax,88888889h
	inc	dword ptr [ebp-8h]
	sub	ecx,edi
	mov	[ebp-4h],edx
	imul	ecx
	add	edx,ecx
	sar	edx,6h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx
	mov	edx,[ebp-4h]
	cmp	[ebp-8h],eax
	jc	416C10h

l00416C7F:
	mov	dword ptr [esi+20h],0h
	mov	byte ptr [esi+28h],0h
	test	ebx,ebx
	jz	416CB8h

l00416C8E:
	mov	ebx,[esi+24h]
	test	ebx,ebx
	jle	416CB8h

l00416C95:
	xor	edi,edi

l00416C97:
	mov	eax,[esi+0Ch]
	mov	ecx,edi
	and	ecx,1Fh
	mov	edx,1h
	shl	edx,cl
	mov	ecx,edi
	shr	ecx,5h
	test	[eax+ecx*4],edx
	jz	416CB8h

l00416CB0:
	inc	edi
	mov	[esi+20h],edi
	cmp	edi,ebx
	jl	416C97h

l00416CB8:
	pop	edi
	mov	eax,esi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret
00416CC1    CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC  ...............

;; fn00416CD0: 00416CD0
;;   Called from:
;;     00415906 (in fn0041568F)
;;     004159DF (in fn0041568F)
fn00416CD0 proc
	push	ebp
	mov	ebp,esp
	sub	esp,8h
	push	ebx
	push	esi
	mov	esi,[ebp+0Ch]
	mov	ebx,ecx
	mov	ecx,[ebp+8h]
	mov	[ebp-8h],ebx
	mov	dword ptr [esi],0h
	mov	dword ptr [esi+4h],0h
	mov	eax,[edx]
	mov	[ebx],eax
	cmp	eax,[ecx]
	jz	416D6Dh

l00416CF8:
	push	edi
	nop	dword ptr [eax+0h]

l00416D00:
	mov	dl,[eax]
	mov	edi,[ebp+10h]
	movzx	ecx,dl
	mov	eax,[edi+0Ch]
	movsx	eax,word ptr [eax+ecx*2]
	shr	eax,2h
	test	al,1h
	jz	416D64h

l00416D16:
	mov	[ebp-4h],dl
	mov	ecx,edi
	push	0h
	push	dword ptr [ebp-4h]
	call	dword ptr [4310FCh]
	mov	edi,[esi]
	mov	ecx,edi
	movsx	eax,al
	sub	eax,30h
	cdq
	mov	ebx,eax
	mov	eax,[esi+4h]
	mov	esi,eax
	shld	esi,ecx,2h
	shl	ecx,2h
	add	edi,ecx
	mov	ecx,[ebp+8h]
	adc	eax,esi
	mov	esi,[ebp+0Ch]
	shld	eax,edi,1h
	add	edi,edi
	add	ebx,edi
	mov	[esi],ebx
	mov	ebx,[ebp-8h]
	adc	edx,eax
	mov	[esi+4h],edx
	mov	eax,[ebx]
	inc	eax
	mov	[ebx],eax
	cmp	eax,[ecx]
	jnz	416D00h

l00416D64:
	pop	edi
	pop	esi
	mov	eax,ebx
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret

l00416D6D:
	pop	esi
	mov	eax,ebx
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret
00416D75                CC CC CC CC CC CC CC CC CC CC CC      ...........
00416D80 55 8B EC 8B 45 0C 8B 4D 08 FF 30 FF 15 24 11 43 U...E..M..0..$.C
00416D90 00 5D C3 CC CC CC CC CC CC CC CC CC CC CC CC CC .]..............

;; fn00416DA0: 00416DA0
;;   Called from:
;;     00412206 (in fn00412170)
fn00416DA0 proc
	push	ebx
	mov	ebx,esp
	sub	esp,8h
	and	esp,0F8h
	add	esp,4h
	push	ebp
	mov	ebp,[ebx+4h]
	mov	[esp+4h],ebp
	mov	ebp,esp
	push	0FFh
	push	42EE48h
	mov	eax,fs:[0000h]
	push	eax
	push	ebx
	sub	esp,48h
	mov	eax,[43A008h]
	xor	eax,ebp
	mov	[ebp-14h],eax
	push	esi
	push	edi
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	[ebp-34h],ecx
	mov	al,[ebx+14h]
	xorps	xmm0,xmm0
	mov	esi,[ebx+1Ch]
	mov	edi,[ebx+20h]
	movups	[ebp-28h],xmm0
	mov	dword ptr [ebp-18h],0h
	push	8h
	mov	[ebp-2Ch],al
	mov	dword ptr [ebp-28h],0h
	mov	dword ptr [ebp-24h],0h
	mov	dword ptr [ebp-20h],0h
	mov	dword ptr [ebp-1Ch],0h
	mov	dword ptr [ebp-18h],0h
	call	427511h
	mov	[ebp-28h],eax
	lea	ecx,[ebp-28h]
	add	esp,4h
	mov	dword ptr [eax],0h
	mov	dword ptr [eax+4h],0h
	mov	eax,[ebp-28h]
	mov	[eax],ecx
	mov	edx,[ebp-34h]
	mov	ecx,edx
	mov	dword ptr [ebp-4h],0h
	mov	[ebp-30h],ecx
	mov	eax,[edx+14h]
	mov	[ebp-3Ch],eax
	cmp	eax,10h
	jc	416E5Fh

l00416E5A:
	mov	ecx,[edx]
	mov	[ebp-30h],ecx

l00416E5F:
	cmp	dword ptr [edx+14h],10h
	mov	eax,edx
	mov	[ebp-38h],eax
	jc	416E6Fh

l00416E6A:
	mov	eax,[edx]
	mov	[ebp-38h],eax

l00416E6F:
	cmp	esi,edi
	jnz	416EE6h

l00416E73:
	mov	eax,[ebp-3Ch]
	mov	esi,edx

l00416E78:
	mov	ecx,esi
	cmp	eax,10h
	jc	416E81h

l00416E7F:
	mov	ecx,[esi]

l00416E81:
	mov	eax,[esi+10h]
	lea	edi,[esi+10h]
	add	eax,ecx
	mov	[ebp-34h],edi
	push	eax
	push	dword ptr [ebp-38h]
	lea	edx,[ebp-28h]
	push	dword ptr [ebp-30h]
	push	ecx
	lea	ecx,[ebp-40h]
	call	417E50h
	mov	edx,[ebp-18h]
	add	esp,10h
	mov	eax,[eax]
	test	edx,edx
	jnz	416FA9h

l00416EAF:
	cmp	dword ptr [esi+14h],10h
	mov	ecx,esi
	jc	416EB9h

l00416EB7:
	mov	ecx,[esi]

l00416EB9:
	mov	edx,[edi]
	add	ecx,edx
	cmp	dword ptr [esi+14h],10h
	mov	[ebp-30h],esi
	jc	416ECBh

l00416EC6:
	mov	edi,[esi]
	mov	[ebp-30h],edi

l00416ECB:
	mov	edi,eax
	sub	edi,[ebp-30h]
	cmp	edx,edi
	jc	4170B8h

l00416ED8:
	jmp	416F74h
00416EDD                                        0F 1F 00              ...

l00416EE0:
	mov	eax,[ebp-38h]
	mov	ecx,[ebp-30h]

l00416EE6:
	push	esi
	push	eax
	push	ecx
	push	ecx
	lea	edx,[ebp-28h]
	lea	ecx,[ebp-3Ch]
	call	417E50h
	mov	edx,[ebp-18h]
	add	esp,10h
	add	edx,[ebp-1Ch]
	mov	[ebp-38h],edi
	mov	eax,[eax]
	push	0h
	push	0h
	sub	esp,0Ch
	mov	[ebp-30h],eax
	mov	eax,[ebp-28h]
	mov	ecx,esp
	mov	dword ptr [ecx],0h
	mov	dword ptr [ecx+4h],0h
	test	eax,eax
	jz	416F2Dh

l00416F23:
	mov	eax,[eax]
	test	eax,eax
	jz	416F2Dh

l00416F29:
	mov	eax,[eax]
	mov	[ecx],eax

l00416F2D:
	lea	eax,[ebp-54h]
	mov	[ecx+8h],edx
	push	eax
	lea	ecx,[ebp-28h]
	call	418F20h
	mov	eax,[ebp-34h]
	mov	ecx,eax
	cmp	dword ptr [eax+14h],10h
	jc	416F49h

l00416F47:
	mov	ecx,[eax]

l00416F49:
	mov	eax,[eax+10h]
	add	eax,ecx
	lea	ecx,[ebx+8h]
	push	eax
	push	edi
	lea	eax,[ebp-48h]
	push	eax
	call	416080h
	mov	esi,[eax]
	mov	edi,[eax+4h]
	cmp	esi,edi
	jnz	416EE0h

l00416F69:
	mov	esi,[ebp-34h]
	mov	eax,[esi+14h]
	jmp	416E78h

l00416F74:
	sub	ecx,eax
	mov	eax,edx
	sub	eax,edi
	cmp	eax,ecx
	cmovc	ecx,eax

l00416F7F:
	cmp	dword ptr [esi+14h],10h
	mov	[ebp-3Ch],ecx
	jc	416F8Ah

l00416F88:
	mov	esi,[esi]

l00416F8A:
	mov	eax,[ebp-3Ch]
	lea	ecx,[esi+edi]
	mov	esi,[ebp-34h]
	sub	edx,eax
	add	eax,ecx
	mov	[esi],edx
	sub	edx,edi
	inc	edx
	push	edx
	push	eax
	push	ecx
	call	42D1C9h
	add	esp,0Ch
	jmp	416FFEh

l00416FA9:
	mov	eax,[ebp-1Ch]
	sub	esp,0Ch
	mov	ecx,esp
	add	eax,edx
	sub	esp,0Ch
	mov	dword ptr [ecx],0h
	mov	dword ptr [ecx+4h],0h
	mov	[ecx+8h],eax
	mov	eax,[ebp-28h]
	mov	[ecx],eax
	mov	ecx,esp
	mov	eax,[ebp-1Ch]
	mov	dword ptr [ecx],0h
	mov	dword ptr [ecx+4h],0h
	mov	[ecx+8h],eax
	mov	eax,[ebp-28h]
	mov	[ecx],eax
	mov	ecx,esi
	cmp	dword ptr [esi+14h],10h
	jc	416FEFh

l00416FED:
	mov	ecx,[esi]

l00416FEF:
	mov	eax,[edi]
	add	eax,ecx
	mov	ecx,esi
	push	eax
	call	417F50h
	add	esp,1Ch

l00416FFE:
	mov	ecx,[ebp-18h]
	test	ecx,ecx
	jz	417025h

l00417005:
	mov	eax,[ebp-1Ch]
	nop	dword ptr [eax+eax+0h]

l00417010:
	sub	ecx,1h
	mov	edx,0h
	cmovz	eax,edx

l0041701B:
	test	ecx,ecx
	jnz	417010h

l0041701F:
	mov	[ebp-1Ch],eax
	mov	[ebp-18h],ecx

l00417025:
	mov	esi,[ebp-20h]
	mov	ecx,[ebp-24h]
	test	esi,esi
	jz	41704Eh

l0041702F:
	nop

l00417030:
	mov	eax,[ecx+esi*4-4h]
	dec	esi
	test	eax,eax
	jz	417047h

l00417039:
	push	10h
	push	eax
	call	42763Fh
	mov	ecx,[ebp-24h]
	add	esp,8h

l00417047:
	test	esi,esi
	jnz	417030h

l0041704B:
	mov	esi,[ebp-20h]

l0041704E:
	test	ecx,ecx
	jz	41707Fh

l00417052:
	shl	esi,2h
	mov	eax,ecx
	cmp	esi,1000h
	jc	417075h

l0041705F:
	mov	ecx,[ecx-4h]
	add	esi,23h
	sub	eax,ecx
	add	eax,0FCh
	cmp	eax,1Fh
	jbe	417075h

l0041706F:
	call	dword ptr [431290h]

l00417075:
	push	esi
	push	ecx
	call	42763Fh
	add	esp,8h

l0041707F:
	push	8h
	push	dword ptr [ebp-28h]
	mov	dword ptr [ebp-20h],0h
	mov	dword ptr [ebp-24h],0h
	call	42763Fh
	add	esp,8h
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	mov	ecx,[ebp-14h]
	xor	ecx,ebp
	call	427500h
	mov	esp,ebp
	pop	ebp
	mov	esp,ebx
	pop	ebx
	ret

l004170B8:
	call	4113B0h
	int	3h
	int	3h
	int	3h

;; fn004170C0: 004170C0
;;   Called from:
;;     00412EA9 (in fn00412E08)
;;     004170BF (in fn00416DA0)
fn004170C0 proc
	push	ebx
	mov	ebx,esp
	sub	esp,8h
	and	esp,0F8h
	add	esp,4h
	push	ebp
	mov	ebp,[ebx+4h]
	mov	[esp+4h],ebp
	mov	ebp,esp
	push	0FFh
	push	42EE48h
	mov	eax,fs:[0000h]
	push	eax
	push	ebx
	sub	esp,48h
	mov	eax,[43A008h]
	xor	eax,ebp
	mov	[ebp-14h],eax
	push	esi
	push	edi
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	[ebp-34h],ecx
	mov	eax,[ebx+24h]
	xorps	xmm0,xmm0
	mov	edi,[ebx+1Ch]
	mov	esi,[ebx+20h]
	movups	[ebp-28h],xmm0
	mov	[ebp-40h],eax
	mov	eax,[ebx+28h]
	mov	dword ptr [ebp-18h],0h
	push	8h
	mov	[ebp-2Ch],eax
	mov	dword ptr [ebp-28h],0h
	mov	dword ptr [ebp-24h],0h
	mov	dword ptr [ebp-20h],0h
	mov	dword ptr [ebp-1Ch],0h
	mov	dword ptr [ebp-18h],0h
	call	427511h
	mov	[ebp-28h],eax
	lea	ecx,[ebp-28h]
	add	esp,4h
	mov	dword ptr [eax],0h
	mov	dword ptr [eax+4h],0h
	mov	eax,[ebp-28h]
	mov	[eax],ecx
	mov	edx,[ebp-34h]
	mov	ecx,edx
	mov	dword ptr [ebp-4h],0h
	mov	[ebp-3Ch],ecx
	mov	eax,[edx+14h]
	mov	[ebp-30h],eax
	cmp	eax,10h
	jc	417185h

l00417180:
	mov	ecx,[edx]
	mov	[ebp-3Ch],ecx

l00417185:
	cmp	dword ptr [edx+14h],10h
	mov	eax,edx
	mov	[ebp-38h],eax
	jc	417195h

l00417190:
	mov	eax,[edx]
	mov	[ebp-38h],eax

l00417195:
	cmp	edi,esi
	jz	417240h

l0041719D:
	nop	dword ptr [eax]

l004171A0:
	push	edi
	push	eax
	push	ecx
	push	ecx
	lea	edx,[ebp-28h]
	lea	ecx,[ebp-30h]
	call	417E50h
	mov	edx,[ebp-18h]
	add	esp,10h
	add	edx,[ebp-1Ch]
	mov	[ebp-38h],esi
	mov	eax,[eax]
	push	dword ptr [ebp-2Ch]
	mov	[ebp-3Ch],eax
	push	dword ptr [ebp-40h]
	mov	eax,[ebp-28h]
	sub	esp,0Ch
	mov	ecx,esp
	mov	dword ptr [ecx],0h
	mov	dword ptr [ecx+4h],0h
	test	eax,eax
	jz	4171E9h

l004171DF:
	mov	eax,[eax]
	test	eax,eax
	jz	4171E9h

l004171E5:
	mov	eax,[eax]
	mov	[ecx],eax

l004171E9:
	lea	eax,[ebp-54h]
	mov	[ecx+8h],edx
	push	eax
	lea	ecx,[ebp-28h]
	call	4191F0h
	mov	eax,[ebp-34h]
	mov	ecx,eax
	cmp	dword ptr [eax+14h],10h
	jc	417205h

l00417203:
	mov	ecx,[eax]

l00417205:
	mov	eax,[eax+10h]
	add	eax,ecx
	lea	ecx,[ebx+8h]
	push	eax
	push	esi
	lea	eax,[ebp-48h]
	push	eax
	call	4160F0h
	mov	edi,[eax]
	mov	esi,[eax+4h]
	cmp	edi,esi
	jz	417238h

l00417221:
	mov	eax,[ebx+14h]
	mov	ecx,[ebp-3Ch]
	mov	[ebp-40h],eax
	mov	eax,[ebx+18h]
	mov	[ebp-2Ch],eax
	mov	eax,[ebp-38h]
	jmp	4171A0h

l00417238:
	mov	esi,[ebp-34h]
	mov	eax,[esi+14h]
	jmp	417245h

l00417240:
	mov	eax,[ebp-30h]
	mov	esi,edx

l00417245:
	mov	ecx,esi
	cmp	eax,10h
	jc	41724Eh

l0041724C:
	mov	ecx,[esi]

l0041724E:
	mov	eax,[esi+10h]
	lea	edi,[esi+10h]
	add	eax,ecx
	mov	[ebp-30h],edi
	push	eax
	push	dword ptr [ebp-38h]
	lea	edx,[ebp-28h]
	push	dword ptr [ebp-3Ch]
	push	ecx
	lea	ecx,[ebp-40h]
	call	417E50h
	mov	edx,[ebp-18h]
	add	esp,10h
	mov	eax,[eax]
	test	edx,edx
	jnz	4172DCh

l00417278:
	mov	ecx,[esi+14h]
	mov	[ebp-2Ch],esi
	cmp	ecx,10h
	jc	417288h

l00417283:
	mov	edx,[esi]
	mov	[ebp-2Ch],edx

l00417288:
	mov	edx,[edi]
	mov	edi,[ebp-2Ch]
	add	edi,edx
	mov	[ebp-2Ch],esi
	cmp	ecx,10h
	jc	41729Ch

l00417297:
	mov	ecx,[esi]
	mov	[ebp-2Ch],ecx

l0041729C:
	mov	ecx,eax
	sub	ecx,[ebp-2Ch]
	mov	[ebp-2Ch],ecx
	cmp	edx,ecx
	jc	4173E8h

l004172AC:
	sub	edi,eax
	mov	eax,edx
	sub	eax,ecx
	cmp	eax,edi
	cmovc	edi,eax

l004172B7:
	cmp	dword ptr [esi+14h],10h
	jc	4172BFh

l004172BD:
	mov	esi,[esi]

l004172BF:
	mov	eax,[ebp-30h]
	sub	edx,edi
	add	ecx,esi
	mov	[eax],edx
	sub	edx,[ebp-2Ch]
	lea	eax,[ecx+edi]
	inc	edx
	push	edx
	push	eax
	push	ecx
	call	42D1C9h
	add	esp,0Ch
	jmp	417331h

l004172DC:
	mov	eax,[ebp-1Ch]
	sub	esp,0Ch
	mov	ecx,esp
	add	eax,edx
	sub	esp,0Ch
	mov	dword ptr [ecx],0h
	mov	dword ptr [ecx+4h],0h
	mov	[ecx+8h],eax
	mov	eax,[ebp-28h]
	mov	[ecx],eax
	mov	ecx,esp
	mov	eax,[ebp-1Ch]
	mov	dword ptr [ecx],0h
	mov	dword ptr [ecx+4h],0h
	mov	[ecx+8h],eax
	mov	eax,[ebp-28h]
	mov	[ecx],eax
	mov	ecx,esi
	cmp	dword ptr [esi+14h],10h
	jc	417322h

l00417320:
	mov	ecx,[esi]

l00417322:
	mov	eax,[edi]
	add	eax,ecx
	mov	ecx,esi
	push	eax
	call	417F50h
	add	esp,1Ch

l00417331:
	mov	ecx,[ebp-18h]
	test	ecx,ecx
	jz	417355h

l00417338:
	mov	eax,[ebp-1Ch]
	nop	dword ptr [eax+eax+0h]

l00417340:
	sub	ecx,1h
	mov	edx,0h
	cmovz	eax,edx

l0041734B:
	test	ecx,ecx
	jnz	417340h

l0041734F:
	mov	[ebp-1Ch],eax
	mov	[ebp-18h],ecx

l00417355:
	mov	esi,[ebp-20h]
	mov	ecx,[ebp-24h]
	test	esi,esi
	jz	41737Eh

l0041735F:
	nop

l00417360:
	mov	eax,[ecx+esi*4-4h]
	dec	esi
	test	eax,eax
	jz	417377h

l00417369:
	push	10h
	push	eax
	call	42763Fh
	mov	ecx,[ebp-24h]
	add	esp,8h

l00417377:
	test	esi,esi
	jnz	417360h

l0041737B:
	mov	esi,[ebp-20h]

l0041737E:
	test	ecx,ecx
	jz	4173AFh

l00417382:
	shl	esi,2h
	mov	eax,ecx
	cmp	esi,1000h
	jc	4173A5h

l0041738F:
	mov	ecx,[ecx-4h]
	add	esi,23h
	sub	eax,ecx
	add	eax,0FCh
	cmp	eax,1Fh
	jbe	4173A5h

l0041739F:
	call	dword ptr [431290h]

l004173A5:
	push	esi
	push	ecx
	call	42763Fh
	add	esp,8h

l004173AF:
	push	8h
	push	dword ptr [ebp-28h]
	mov	dword ptr [ebp-20h],0h
	mov	dword ptr [ebp-24h],0h
	call	42763Fh
	add	esp,8h
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	mov	ecx,[ebp-14h]
	xor	ecx,ebp
	call	427500h
	mov	esp,ebp
	pop	ebp
	mov	esp,ebx
	pop	ebx
	ret

l004173E8:
	call	4113B0h
	int	3h
	int	3h
	int	3h

;; fn004173F0: 004173F0
;;   Called from:
;;     00416932 (in fn004167E0)
;;     004173EF (in fn004170C0)
fn004173F0 proc
	push	ebp
	mov	ebp,esp
	sub	esp,14h
	mov	eax,[ebp+18h]
	push	ebx
	mov	ebx,ecx
	mov	[ebp-10h],eax
	mov	ecx,7FFFFFFFh
	mov	eax,ecx
	push	esi
	mov	edx,[ebx+10h]
	sub	eax,edx
	mov	esi,[ebp+8h]
	mov	[ebp-4h],edx
	push	edi
	cmp	eax,esi
	jc	41756Eh

l0041741B:
	mov	edi,[ebx+14h]
	lea	eax,[edx+esi]
	mov	esi,eax
	mov	[ebp-8h],eax
	or	esi,0Fh
	mov	[ebp-0Ch],edi
	cmp	esi,ecx
	jbe	417434h

l00417430:
	mov	esi,ecx
	jmp	41744Ch

l00417434:
	mov	eax,edi
	shr	eax,1h
	sub	ecx,eax
	cmp	edi,ecx
	jbe	417445h

l0041743E:
	mov	esi,7FFFFFFFh
	jmp	41744Ch

l00417445:
	add	eax,edi
	cmp	esi,eax
	cmovc	esi,eax

l0041744C:
	xor	ecx,ecx
	mov	eax,esi
	add	eax,1h
	setc	cl
	neg	ecx
	or	ecx,eax
	cmp	ecx,1000h
	jc	41748Ch

l00417462:
	lea	eax,[ecx+23h]
	or	edx,0FFh
	cmp	eax,ecx
	cmovbe	eax,edx

l0041746D:
	push	eax
	call	427511h
	add	esp,4h
	test	eax,eax
	jz	417531h

l0041747E:
	mov	edx,[ebp-4h]
	lea	edi,[eax+23h]
	and	edi,0E0h
	mov	[edi-4h],eax
	jmp	4174A2h

l0041748C:
	test	ecx,ecx
	jz	4174A0h

l00417490:
	push	ecx
	call	427511h
	mov	edx,[ebp-4h]
	add	esp,4h
	mov	edi,eax
	jmp	4174A2h

l004174A0:
	xor	edi,edi

l004174A2:
	mov	eax,[ebp-8h]
	mov	[ebx+10h],eax
	mov	eax,[ebp+10h]
	sub	edx,eax
	sub	edx,[ebp+14h]
	mov	[ebx+14h],esi
	push	eax
	lea	esi,[edi+eax]
	lea	ecx,[edx+1h]
	mov	[ebp-14h],esi
	mov	[ebp-4h],ecx
	mov	ecx,[ebp+1Ch]
	add	ecx,esi
	cmp	dword ptr [ebp-0Ch],10h
	mov	[ebp-8h],ecx
	jc	417537h

l004174CE:
	mov	esi,[ebx]
	push	esi
	push	edi
	call	42D1CFh
	push	dword ptr [ebp+1Ch]
	push	dword ptr [ebp-10h]
	push	dword ptr [ebp-14h]
	call	42D1CFh
	mov	eax,[ebp+10h]
	push	dword ptr [ebp-4h]
	add	eax,esi
	add	eax,[ebp+14h]
	push	eax
	push	dword ptr [ebp-8h]
	call	42D1CFh
	mov	ecx,[ebp-0Ch]
	add	esp,24h
	inc	ecx
	cmp	ecx,1000h
	jc	41751Ah

l00417508:
	mov	edx,[esi-4h]
	add	ecx,23h
	sub	esi,edx
	lea	eax,[esi-4h]
	cmp	eax,1Fh
	ja	417531h

l00417518:
	mov	esi,edx

l0041751A:
	push	ecx
	push	esi
	call	42763Fh
	add	esp,8h
	mov	[ebx],edi
	mov	eax,ebx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	18h

l00417531:
	call	dword ptr [431290h]

l00417537:
	push	ebx
	push	edi
	call	42D1CFh
	push	dword ptr [ebp+1Ch]
	push	dword ptr [ebp-10h]
	push	esi
	call	42D1CFh
	mov	ecx,[ebp+10h]
	push	dword ptr [ebp-4h]
	add	ecx,ebx
	add	ecx,[ebp+14h]
	push	ecx
	push	dword ptr [ebp-8h]
	call	42D1CFh
	add	esp,24h
	mov	[ebx],edi
	mov	eax,ebx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	18h

l0041756E:
	call	403860h
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
	push	esi
	mov	esi,[ecx]
	push	edi
	mov	edi,[ecx+4h]
	cmp	esi,edi
	jz	41759Eh

l0041758B:
	nop	dword ptr [eax+eax+0h]

l00417590:
	mov	ecx,esi
	call	4148B0h
	add	esi,78h
	cmp	esi,edi
	jnz	417590h

l0041759E:
	pop	edi
	pop	esi
	ret
004175A1    CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC  ...............

;; fn004175B0: 004175B0
;;   Called from:
;;     00415F4F (in fn00415E48)
fn004175B0 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42EE78h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,60h
	mov	eax,[43A008h]
	xor	eax,ebp
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	edx,ecx
	lea	ecx,[ebp-34h]
	call	418B10h
	mov	edx,eax
	mov	dword ptr [ebp-4h],0h
	lea	ecx,[ebp-68h]
	call	418B80h
	push	437CD4h
	lea	eax,[ebp-68h]
	push	eax
	call	42D1B7h
	int	3h
	int	3h

;; fn00417600: 00417600
;;   Called from:
;;     00415EB7 (in fn00415E48)
fn00417600 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42EF09h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,0F8h
	mov	eax,[43A008h]
	xor	eax,ebp
	mov	[ebp-14h],eax
	push	ebx
	push	esi
	push	edi
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	esi,edx
	mov	[ebp-0E8h],esi
	mov	[ebp-0E4h],ecx
	mov	eax,[ebp+10h]
	mov	edi,[ebp+0Ch]
	mov	ebx,[ebp+8h]
	push	60h
	mov	[ebp-0F0h],eax
	lea	eax,[ebp-74h]
	push	0h
	push	eax
	mov	[ebp-0FCh],edi
	mov	dword ptr [ebp-0DCh],0h
	call	42D1C3h
	add	esp,0Ch
	mov	dword ptr [ebp-6Ch],4324B0h
	lea	ecx,[ebp-5Ch]
	call	dword ptr [431108h]
	mov	dword ptr [ebp-4h],0h
	lea	ecx,[ebp-70h]
	push	dword ptr [ebp-0FCh]
	mov	dword ptr [ebp-0DCh],1h
	push	edi
	mov	[ebp-74h],edi
	call	419630h
	push	edi
	lea	eax,[ebp-74h]
	push	edi
	push	eax
	call	4029A0h
	add	esp,0Ch
	push	0h
	push	0h
	mov	dword ptr [ebp-4h],1h
	lea	ecx,[ebp-6Ch]
	push	dword ptr [ebp-74h]
	call	dword ptr [431098h]
	mov	eax,[ebp-6Ch]
	mov	eax,[eax+4h]
	mov	dword ptr [ebp+eax-6Ch],4323A4h
	mov	eax,[ebp-6Ch]
	mov	ecx,[eax+4h]
	lea	eax,[ecx-10h]
	mov	[ebp+ecx-70h],eax
	mov	eax,[ebp-0F0h]
	mov	dword ptr [ebp-4h],2h
	test	eax,eax
	jz	417731h

;; fn004176EF: 004176EF
;;   Called from:
;;     004176ED (in fn00417600)
;;     004176ED (in fn004175B0)
fn004176EF proc
	push	eax
	lea	eax,[ebp-104h]
	push	eax
	mov	eax,[ebp-6Ch]
	lea	ecx,[ebp-6Ch]
	mov	eax,[eax+4h]
	add	ecx,eax
	call	dword ptr [431128h]
	mov	byte ptr [ebp-4h],3h
	mov	ecx,[ebp-100h]
	test	ecx,ecx
	jz	417727h

l00417716:
	mov	eax,[ecx]
	call	dword ptr [eax+8h]
	test	eax,eax
	jz	417727h

l0041771F:
	mov	edx,[eax]
	mov	ecx,eax
	push	1h
	call	dword ptr [edx]

l00417727:
	mov	eax,[ebp-0F0h]
	mov	byte ptr [ebp-4h],2h

;; fn00417731: 00417731
;;   Called from:
;;     004176ED (in fn00417600)
;;     004176ED (in fn004175B0)
;;     0041772D (in fn004176EF)
fn00417731 proc
	push	eax
	mov	eax,[ebp-6Ch]
	lea	edx,[ebp-6Ch]
	lea	ecx,[esi+38h]
	mov	eax,[eax+4h]
	add	eax,edx
	push	eax
	call	418A20h
	mov	eax,[ebp-0E4h]
	lea	ecx,[ebp-6Ch]
	push	dword ptr [eax]
	mov	eax,[eax+4h]
	push	ecx
	call	eax
	mov	eax,[ebp-6Ch]
	add	esp,8h
	mov	ecx,[eax+4h]
	mov	eax,[ebp+ecx-58h]
	mov	edx,[ebp+ecx-4Ch]
	mov	ecx,[ebp+ecx-48h]
	mov	[ebp-0E0h],eax
	shr	eax,8h
	mov	[ebp-0F8h],edx
	mov	[ebp-0F4h],ecx
	and	al,1h
	jz	417792h

l00417785:
	mov	eax,edx
	mov	byte ptr [ebp-0D5h],1h
	or	eax,ecx
	jnz	417799h

l00417792:
	mov	byte ptr [ebp-0D5h],0h

l00417799:
	lea	eax,[ebx+10h]
	mov	dword ptr [eax],0h
	cmp	dword ptr [ebx+14h],10h
	mov	[ebp-0ECh],eax
	mov	eax,ebx
	jc	4177B2h

l004177B0:
	mov	eax,[ebx]

l004177B2:
	cmp	byte ptr [ebp-0D5h],0h
	mov	byte ptr [eax],0h
	jnz	4178DAh

l004177C2:
	test	ecx,ecx
	jl	4177E2h

l004177C6:
	jg	4177CCh

l004177C8:
	test	edx,edx
	jz	4177E2h

l004177CC:
	mov	eax,[ebp-6Ch]
	mov	eax,[eax+4h]
	mov	dword ptr [ebp+eax-4Ch],0h
	mov	dword ptr [ebp+eax-48h],0h

l004177E2:
	mov	eax,[ebp-0E4h]
	lea	ecx,[ebp-6Ch]
	push	dword ptr [eax]
	mov	eax,[eax+8h]
	push	ecx
	call	eax
	mov	eax,[edi+10h]
	add	esp,8h
	test	byte ptr [esi+70h],2h
	mov	byte ptr [ebp-0E4h],0h
	mov	ecx,[eax]
	mov	[ebp-0ECh],ecx
	jz	417864h

l0041780E:
	mov	eax,[edi+20h]
	mov	eax,[eax]
	sub	eax,ecx
	jz	41784Bh

l00417817:
	mov	eax,[ebp-6Ch]
	lea	ecx,[ebp-6Ch]
	push	2Bh
	mov	eax,[eax+4h]
	add	ecx,eax
	call	dword ptr [431188h]
	mov	esi,[ebp-0ECh]
	cmp	[esi],al
	jz	417864h

l00417834:
	mov	eax,[ebp-6Ch]
	lea	ecx,[ebp-6Ch]
	push	2Dh
	mov	eax,[eax+4h]
	add	ecx,eax
	call	dword ptr [431188h]
	cmp	[esi],al
	jz	417864h

l0041784B:
	mov	eax,[ebp-6Ch]
	lea	ecx,[ebp-6Ch]
	push	20h
	mov	eax,[eax+4h]
	add	ecx,eax
	call	dword ptr [431188h]
	mov	[ebp-0E4h],al

l00417864:
	mov	ecx,[edi+20h]
	xor	eax,eax
	mov	edx,[ebp-0E8h]
	mov	esi,[ecx]
	mov	ecx,[edi+10h]
	sub	esi,[ecx]
	cmp	[ebp-0E4h],al
	mov	ecx,[edx+68h]
	setnz	al
	sub	ecx,eax
	mov	eax,[ebp-6Ch]
	cmp	esi,ecx
	cmovnc	esi,ecx

l0041788C:
	mov	ecx,[ebp-0F4h]
	mov	eax,[eax+4h]
	mov	al,[ebp+eax-2Ch]
	mov	[ebp-0FCh],al
	mov	eax,[edx+70h]
	mov	edx,[ebp-0ECh]
	shr	eax,2h
	and	al,1h
	movzx	eax,al
	push	eax
	push	dword ptr [ebp-0E4h]
	push	dword ptr [ebp-0E0h]
	push	dword ptr [ebp-0FCh]
	push	ecx
	push	dword ptr [ebp-0F8h]
	mov	ecx,ebx
	push	esi
	call	418C30h
	add	esp,1Ch
	jmp	417DDBh

l004178DA:
	mov	eax,[ebp-0E4h]
	lea	ecx,[ebp-6Ch]
	push	dword ptr [eax]
	mov	eax,[eax+8h]
	push	ecx
	call	eax
	mov	eax,[edi+10h]
	add	esp,8h
	mov	byte ptr [ebp-0D5h],0h
	mov	ecx,[eax]
	mov	eax,[edi+20h]
	mov	[ebp-0DCh],ecx
	mov	eax,[eax]
	sub	eax,ecx
	test	byte ptr [esi+70h],2h
	mov	[ebp-0E0h],eax
	jz	417958h

l00417913:
	test	eax,eax
	jz	417951h

l00417917:
	mov	eax,[ebp-6Ch]
	lea	ecx,[ebp-6Ch]
	push	2Bh
	mov	eax,[eax+4h]
	add	ecx,eax
	call	dword ptr [431188h]
	mov	ecx,[ebp-0DCh]
	cmp	[ecx],al
	jz	417958h

l00417934:
	mov	eax,[ebp-6Ch]
	lea	ecx,[ebp-6Ch]
	push	2Dh
	mov	eax,[eax+4h]
	add	ecx,eax
	call	dword ptr [431188h]
	mov	ecx,[ebp-0DCh]
	cmp	[ecx],al
	jz	417958h

l00417951:
	mov	byte ptr [ebp-0D5h],1h

l00417958:
	mov	eax,[ebp-0F8h]
	mov	edx,[ebp-0E0h]
	cmp	edx,eax
	jnz	417996h

l00417968:
	mov	ecx,[ebp-0F4h]
	cmp	ecx,[esi+6Ch]
	jg	417996h

l00417973:
	jl	41797Ah

l00417975:
	cmp	eax,[esi+68h]
	ja	417996h

l0041797A:
	cmp	byte ptr [ebp-0D5h],0h
	jnz	417996h

l00417983:
	push	edx
	push	dword ptr [ebp-0DCh]
	mov	ecx,ebx
	call	402A70h
	jmp	417DDBh

l00417996:
	push	edx
	push	dword ptr [ebp-0DCh]
	mov	ecx,ebx
	call	402A70h
	mov	ecx,edi
	call	418980h
	push	60h
	lea	eax,[ebp-0D4h]
	push	0h
	push	eax
	call	42D1C3h
	add	esp,0Ch
	mov	dword ptr [ebp-0CCh],4324B0h
	lea	ecx,[ebp-0BCh]
	call	dword ptr [431108h]
	mov	byte ptr [ebp-4h],4h
	lea	ecx,[ebp-0D0h]
	push	dword ptr [ebp-100h]
	mov	dword ptr [ebp-0DCh],3h
	push	edi
	mov	[ebp-0D4h],edi
	call	419630h
	push	edi
	lea	eax,[ebp-0D4h]
	push	edi
	push	eax
	call	4029A0h
	add	esp,0Ch
	push	0h
	push	0h
	mov	dword ptr [ebp-4h],5h
	lea	ecx,[ebp-0CCh]
	push	dword ptr [ebp-0D4h]
	call	dword ptr [431098h]
	mov	eax,[ebp-0CCh]
	mov	eax,[eax+4h]
	mov	dword ptr [ebp+eax-0CCh],4323A4h
	mov	eax,[ebp-0CCh]
	mov	edx,[eax+4h]
	lea	eax,[edx-10h]
	mov	[ebp+edx-0D0h],eax
	mov	eax,[ebp-0F0h]
	lea	ecx,[ebp-0CCh]
	push	eax
	mov	byte ptr [ebp-4h],6h
	mov	eax,[ebp-0CCh]
	mov	eax,[eax+4h]
	add	eax,ecx
	lea	ecx,[esi+38h]
	push	eax
	call	418A20h
	mov	esi,[ebp-0E4h]
	lea	eax,[ebp-0CCh]
	push	dword ptr [esi]
	push	eax
	mov	eax,[esi+4h]
	call	eax
	mov	eax,[ebp-0CCh]
	add	esp,8h
	cmp	byte ptr [ebp-0D5h],0h
	mov	eax,[eax+4h]
	mov	dword ptr [ebp+eax-0ACh],0h
	mov	dword ptr [ebp+eax-0A8h],0h
	jz	417AC0h

l00417AB3:
	mov	dl,20h
	lea	ecx,[ebp-0CCh]
	call	411570h

l00417AC0:
	push	dword ptr [esi]
	lea	eax,[ebp-0CCh]
	push	eax
	mov	eax,[esi+8h]
	call	eax
	mov	eax,[edi+20h]
	add	esp,8h
	mov	esi,[eax]
	mov	eax,[edi+10h]
	mov	edx,[eax]
	mov	eax,esi
	sub	eax,edx
	mov	[ebp-0F0h],edx
	mov	eax,[ebp-0E8h]
	jnz	417B23h

l00417AED:
	test	byte ptr [eax+70h],2h
	mov	[ebp-0F0h],edx
	jz	417B23h

l00417AF9:
	mov	dl,20h
	mov	byte ptr [ebp-0D5h],1h
	lea	ecx,[ebp-0CCh]
	call	411570h
	mov	eax,[edi+10h]
	mov	edx,[eax]
	mov	eax,[edi+20h]
	mov	[ebp-0F0h],edx
	mov	esi,[eax]
	mov	eax,[ebp-0E8h]

l00417B23:
	mov	eax,[eax+68h]
	sub	esi,edx
	cmp	esi,eax
	cmovnc	esi,eax

l00417B2D:
	mov	[ebp-0E4h],esi
	cmp	[ebp-0F8h],esi
	ja	417B49h

l00417B3B:
	push	esi
	push	edx
	mov	ecx,ebx
	call	402A70h
	jmp	417D84h

l00417B49:
	xor	eax,eax
	mov	ecx,esi
	cmp	[ebp-0D5h],al
	setnz	al
	mov	[ebp-0E8h],eax
	add	eax,[ebp-0E0h]
	cmp	esi,eax
	cmovnc	ecx,eax

l00417B67:
	movzx	eax,byte ptr [ebp-0D5h]
	mov	edi,eax
	mov	[ebp-0E0h],ecx
	mov	[ebp-0DCh],eax
	cmp	edi,ecx
	jnc	417BAFh

l00417B80:
	mov	esi,[ebp-0E8h]

l00417B86:
	cmp	dword ptr [ebx+14h],10h
	mov	ecx,ebx
	jc	417B90h

l00417B8E:
	mov	ecx,[ebx]

l00417B90:
	mov	al,[edi+edx]
	sub	ecx,esi
	cmp	al,[ecx+edi]
	jnz	417BA3h

l00417B9A:
	inc	edi
	cmp	edi,[ebp-0E0h]
	jc	417B86h

l00417BA3:
	mov	esi,[ebp-0E4h]
	mov	eax,[ebp-0DCh]

l00417BAF:
	cmp	edi,esi
	mov	ecx,ebx
	cmovnc	edi,eax

l00417BB6:
	push	edi
	push	edx
	call	402A70h
	mov	ecx,[ebp-0F8h]
	mov	eax,[ebp-0F4h]
	sub	ecx,esi
	mov	[ebp-0E8h],ecx
	sbb	eax,0h
	mov	[ebp-0F4h],eax
	test	eax,eax
	jg	417C02h

l00417BDE:
	jl	417BE4h

l00417BE0:
	test	ecx,ecx
	jnz	417C02h

l00417BE4:
	push	107h
	push	4321F0h
	push	432248h
	call	dword ptr [431294h]
	mov	ecx,[ebp-0E8h]
	add	esp,0Ch

l00417C02:
	mov	eax,[ebp-0CCh]
	mov	eax,[eax+4h]
	mov	al,[ebp+eax-8Ch]
	mov	[ebp-0E0h],al
	mov	eax,[ebp-0ECh]
	mov	edx,[eax]
	mov	eax,[ebx+14h]
	sub	eax,edx
	cmp	ecx,eax
	ja	417C65h

l00417C29:
	cmp	dword ptr [ebx+14h],10h
	lea	eax,[ecx+edx]
	mov	esi,[ebp-0ECh]
	mov	[esi],eax
	mov	eax,ebx
	jc	417C3Eh

l00417C3C:
	mov	eax,[ebx]

l00417C3E:
	lea	esi,[eax+edx]
	movsx	eax,byte ptr [ebp-0E0h]
	push	ecx
	push	eax
	push	esi
	call	42D1C3h
	mov	eax,[ebp-0E8h]
	add	esp,0Ch
	mov	byte ptr [eax+esi],0h
	mov	esi,[ebp-0E4h]
	jmp	417C81h

l00417C65:
	push	dword ptr [ebp-0E0h]
	mov	byte ptr [ebp-0DCh],0h
	push	ecx
	push	dword ptr [ebp-0DCh]
	push	ecx
	mov	ecx,ebx
	call	413120h

l00417C81:
	mov	eax,[ebp-0F0h]
	mov	ecx,esi
	add	eax,edi
	sub	ecx,edi
	mov	edi,[ebp-0ECh]
	mov	[ebp-0E0h],eax
	mov	eax,[ebx+14h]
	mov	[ebp-0DCh],ecx
	mov	edx,[edi]
	sub	eax,edx
	cmp	ecx,eax
	ja	417CDCh

l00417CAA:
	cmp	dword ptr [ebx+14h],10h
	lea	eax,[edx+ecx]
	mov	[edi],eax
	jc	417CB7h

l00417CB5:
	mov	ebx,[ebx]

l00417CB7:
	push	ecx
	push	dword ptr [ebp-0E0h]
	lea	esi,[ebx+edx]
	push	esi
	call	42D1C9h
	mov	eax,[ebp-0DCh]
	add	esp,0Ch
	mov	byte ptr [eax+esi],0h
	mov	esi,[ebp-0E4h]
	jmp	417CF8h

l00417CDC:
	push	ecx
	push	dword ptr [ebp-0E0h]
	mov	byte ptr [ebp-0ECh],0h
	push	dword ptr [ebp-0ECh]
	push	ecx
	mov	ecx,ebx
	call	413280h

l00417CF8:
	mov	ecx,[ebp-0F4h]
	test	ecx,ecx
	jg	417D27h

l00417D02:
	jl	417D0Eh

l00417D04:
	mov	eax,[ebp-0E8h]
	test	eax,eax
	jnc	417D2Dh

l00417D0E:
	xorps	xmm0,xmm0
	movlpd	qword ptr [ebp-104h],xmm0
	mov	ecx,[ebp-100h]
	mov	eax,[ebp-104h]
	jmp	417D2Dh

l00417D27:
	mov	eax,[ebp-0E8h]

l00417D2D:
	mov	ebx,[ebp-0F8h]
	add	esi,eax
	mov	eax,0h
	adc	eax,ecx
	cmp	esi,ebx
	jnz	417D44h

l00417D40:
	test	eax,eax
	jz	417D60h

l00417D44:
	mov	esi,[431294h]
	push	10Bh
	push	4321F0h
	push	432250h
	call	esi
	add	esp,0Ch
	jmp	417D66h

l00417D60:
	mov	esi,[431294h]

l00417D66:
	cmp	[edi],ebx
	jz	417D7Eh

l00417D6A:
	push	10Ch
	push	4321F0h
	push	4322F0h
	call	esi
	add	esp,0Ch

l00417D7E:
	mov	edi,[ebp-0FCh]

l00417D84:
	lea	ecx,[ebp-0C4h]
	call	dword ptr [4310E4h]
	mov	byte ptr [ebp-4h],7h
	mov	esi,[ebp-0D0h]
	test	esi,esi
	jz	417DCBh

l00417D9E:
	or	ebx,0FFh
	lea	eax,[esi+4h]
	mov	ecx,ebx
	lock
	xadd	[eax],ecx
	cmp	ecx,1h
	jnz	417DCBh

l00417DAF:
	mov	eax,[esi]
	mov	ecx,esi
	call	dword ptr [eax+4h]
	lea	eax,[esi+8h]
	mov	edx,ebx
	lock
	xadd	[eax],edx
	cmp	edx,1h
	jnz	417DCBh

l00417DC4:
	mov	eax,[esi]
	mov	ecx,esi
	call	dword ptr [eax+8h]

l00417DCB:
	lea	ecx,[ebp-0BCh]
	mov	byte ptr [ebp-4h],2h
	call	dword ptr [4310A8h]

l00417DDB:
	mov	ecx,edi
	call	418980h
	lea	ecx,[ebp-64h]
	call	dword ptr [4310E4h]
	mov	dword ptr [ebp-4h],8h
	mov	esi,[ebp-70h]
	test	esi,esi
	jz	417E24h

l00417DF9:
	or	ebx,0FFh
	lea	eax,[esi+4h]
	mov	ecx,ebx
	lock
	xadd	[eax],ecx
	cmp	ecx,1h
	jnz	417E24h

l00417E0A:
	mov	eax,[esi]
	mov	ecx,esi
	call	dword ptr [eax+4h]
	lea	eax,[esi+8h]
	lock
	xadd	[eax],ebx
	cmp	ebx,1h
	jnz	417E24h

l00417E1D:
	mov	eax,[esi]
	mov	ecx,esi
	call	dword ptr [eax+8h]

l00417E24:
	lea	ecx,[ebp-5Ch]
	call	dword ptr [4310A8h]
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	ecx,[ebp-14h]
	xor	ecx,ebp
	call	427500h
	mov	esp,ebp
	pop	ebp
	ret
00417E49                            CC CC CC CC CC CC CC          .......

;; fn00417E50: 00417E50
;;   Called from:
;;     00416E9A (in fn00416DA0)
;;     00416EF0 (in fn00416DA0)
;;     004171AA (in fn004170C0)
;;     00417267 (in fn004170C0)
fn00417E50 proc
	push	ebp
	mov	ebp,esp
	sub	esp,0Ch
	mov	eax,[43A008h]
	xor	eax,ebp
	mov	[ebp-4h],eax
	push	ebx
	mov	ebx,edx
	mov	edx,ecx
	mov	ecx,[ebp+14h]
	push	esi
	mov	esi,[ebp+0Ch]
	mov	eax,[ebx+10h]
	mov	[ebp-0Ch],edx
	mov	[ebp-8h],ecx
	push	edi
	mov	edi,[ebp+10h]
	test	eax,eax
	jz	417EB3h

l00417E7D:
	nop	dword ptr [eax]

l00417E80:
	cmp	esi,edi
	jz	417EA9h

l00417E84:
	mov	ecx,ebx
	call	410CC0h
	mov	al,[eax]
	mov	[esi],al
	add	dword ptr [ebx+10h],0FFh
	jnz	417E9Eh

l00417E95:
	mov	dword ptr [ebx+0Ch],0h
	jmp	417EA1h

l00417E9E:
	inc	dword ptr [ebx+0Ch]

l00417EA1:
	mov	eax,[ebx+10h]
	inc	esi
	test	eax,eax
	jnz	417E80h

l00417EA9:
	mov	ecx,[ebp-8h]
	mov	edx,[ebp-0Ch]
	test	eax,eax
	jnz	417EF9h

l00417EB3:
	cmp	esi,edi
	jnz	417ECCh

l00417EB7:
	pop	edi
	pop	esi
	mov	[edx],ecx
	mov	eax,edx
	pop	ebx
	mov	ecx,[ebp-4h]
	xor	ecx,ebp
	call	427500h
	mov	esp,ebp
	pop	ebp
	ret

l00417ECC:
	sub	ecx,edi
	push	ecx
	push	edi
	push	esi
	mov	[ebp-8h],ecx
	call	42D1C9h
	mov	ecx,[ebp-0Ch]
	add	esp,0Ch
	mov	eax,[ebp-8h]
	add	eax,esi
	pop	edi
	pop	esi
	mov	[ecx],eax
	mov	eax,ecx
	pop	ebx
	mov	ecx,[ebp-4h]
	xor	ecx,ebp
	call	427500h
	mov	esp,ebp
	pop	ebp
	ret

l00417EF9:
	cmp	esi,ecx
	jz	417F2Ah

l00417EFD:
	mov	edi,[ebp-8h]

l00417F00:
	push	esi
	mov	ecx,ebx
	call	40F210h
	mov	ecx,ebx
	call	410CC0h
	mov	al,[eax]
	mov	[esi],al
	add	dword ptr [ebx+10h],0FFh
	jnz	417F22h

l00417F19:
	mov	dword ptr [ebx+0Ch],0h
	jmp	417F25h

l00417F22:
	inc	dword ptr [ebx+0Ch]

l00417F25:
	inc	esi
	cmp	esi,edi
	jnz	417F00h

l00417F2A:
	mov	ecx,[ebp-0Ch]
	mov	eax,ecx
	pop	edi
	mov	[ecx],esi
	mov	ecx,[ebp-4h]
	pop	esi
	xor	ecx,ebp
	pop	ebx
	call	427500h
	mov	esp,ebp
	pop	ebp
	ret
00417F42       CC CC CC CC CC CC CC CC CC CC CC CC CC CC   ..............

;; fn00417F50: 00417F50
;;   Called from:
;;     00416FF6 (in fn00416DA0)
;;     00417329 (in fn004170C0)
fn00417F50 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42EF48h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,30h
	mov	eax,[43A008h]
	xor	eax,ebp
	mov	[ebp-14h],eax
	push	ebx
	push	esi
	push	edi
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	edi,ecx
	mov	ecx,[ebp+18h]
	xor	eax,eax
	test	ecx,ecx
	jz	417F8Eh

l00417F86:
	mov	ecx,[ecx]
	test	ecx,ecx
	jz	417F8Eh

l00417F8C:
	mov	eax,[ecx]

l00417F8E:
	mov	edx,[ebp+0Ch]
	xor	ecx,ecx
	test	edx,edx
	jz	417F9Fh

l00417F97:
	mov	edx,[edx]
	test	edx,edx
	jz	417F9Fh

l00417F9D:
	mov	ecx,[edx]

l00417F9F:
	xor	edx,edx
	test	eax,eax
	jz	417FADh

l00417FA5:
	mov	eax,[eax]
	test	eax,eax
	jz	417FADh

l00417FAB:
	mov	edx,[eax]

l00417FAD:
	xor	eax,eax
	test	ecx,ecx
	jz	417FBBh

l00417FB3:
	mov	ecx,[ecx]
	test	ecx,ecx
	jz	417FBBh

l00417FB9:
	mov	eax,[ecx]

l00417FBB:
	mov	ebx,[ebp+8h]
	test	eax,eax
	jnz	417FC7h

l00417FC2:
	mov	[ebp-34h],eax
	jmp	417FCCh

l00417FC7:
	mov	eax,[eax]
	mov	[ebp-34h],eax

l00417FCC:
	mov	ecx,[ebp+14h]
	mov	[ebp-38h],ecx
	test	edx,edx
	jnz	417FDBh

l00417FD6:
	mov	[ebp-30h],edx
	jmp	417FE0h

l00417FDB:
	mov	eax,[edx]
	mov	[ebp-30h],eax

l00417FE0:
	mov	esi,[ebp+20h]
	mov	eax,esi
	sub	eax,ecx
	mov	dword ptr [ebp-1Ch],0h
	push	eax
	lea	ecx,[ebp-2Ch]
	mov	dword ptr [ebp-18h],0Fh
	mov	byte ptr [ebp-2Ch],0h
	call	414E40h
	push	dword ptr [ebp-38h]
	lea	ecx,[ebp-2Ch]
	push	esi
	push	dword ptr [ebp-30h]
	push	dword ptr [ebp-38h]
	push	dword ptr [ebp-34h]
	call	4197A0h
	mov	dword ptr [ebp-4h],0h
	mov	eax,edi
	cmp	dword ptr [edi+14h],10h
	jc	418028h

l00418026:
	mov	eax,[edi]

l00418028:
	push	dword ptr [ebp-1Ch]
	sub	ebx,eax
	mov	ecx,edi
	cmp	dword ptr [ebp-18h],10h
	lea	eax,[ebp-2Ch]
	cmovnc	eax,[ebp-2Ch]

l0041803A:
	push	eax
	push	0h
	push	ebx
	call	4167E0h
	mov	edx,[ebp-18h]
	cmp	edx,10h
	jc	418079h

l0041804B:
	mov	ecx,[ebp-2Ch]
	inc	edx
	mov	eax,ecx
	cmp	edx,1000h
	jc	41806Fh

l00418059:
	mov	ecx,[ecx-4h]
	add	edx,23h
	sub	eax,ecx
	add	eax,0FCh
	cmp	eax,1Fh
	jbe	41806Fh

l00418069:
	call	dword ptr [431290h]

l0041806F:
	push	edx
	push	ecx
	call	42763Fh
	add	esp,8h

l00418079:
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	ecx,[ebp-14h]
	xor	ecx,ebp
	call	427500h
	mov	esp,ebp
	pop	ebp
	ret
00418095                CC CC CC CC CC CC CC CC CC CC CC      ...........

;; fn004180A0: 004180A0
;;   Called from:
;;     004184D6 (in fn004184D0)
fn004180A0 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42EA00h
	mov	eax,fs:[0000h]
	push	eax
	push	esi
	mov	eax,[43A008h]
	xor	eax,ebp
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	esi,ecx
	mov	eax,[esi+28h]
	mov	dword ptr [esi],4323BCh
	mov	dword ptr [esi+14h],431874h
	mov	eax,[eax+4h]
	mov	dword ptr [eax+esi+28h],4324CCh
	mov	eax,[esi+28h]
	mov	ecx,[eax+4h]
	lea	eax,[ecx-8h]
	mov	[ecx+esi+24h],eax
	mov	dword ptr [esi],431868h
	mov	dword ptr [esi+14h],431834h
	mov	dword ptr [ebp-4h],0h
	mov	ecx,[esi+18h]
	test	ecx,ecx
	jz	41811Ah

l00418108:
	mov	eax,[ecx]
	mov	eax,[eax+10h]
	call	eax
	test	al,al
	jz	41811Ah

l00418113:
	mov	dword ptr [esi+18h],0h

l0041811A:
	lea	eax,[esi+4h]
	mov	dword ptr [esi],431384h
	push	eax
	call	dword ptr [4311C8h]
	add	esp,4h
	mov	dword ptr [esi+30h],43248Ch
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	esi
	mov	esp,ebp
	pop	ebp
	ret
00418144             CC CC CC CC CC CC CC CC CC CC CC CC     ............

;; fn00418150: 00418150
;;   Called from:
;;     0041860F (in fn004198D3)
fn00418150 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42EA3Ch
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,8h
	push	esi
	mov	eax,[43A008h]
	xor	eax,ebp
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	esi,ecx
	mov	[ebp-14h],esi
	cmp	dword ptr [ebp+0Ch],0h
	mov	dword ptr [ebp-10h],0h
	jz	4181A4h

l00418188:
	mov	dword ptr [esi+28h],432380h
	mov	dword ptr [esi+30h],43248Ch
	mov	dword ptr [ebp-4h],0h
	mov	dword ptr [ebp-10h],1h

l004181A4:
	push	dword ptr [ebp+8h]
	mov	ecx,esi
	call	4181F0h
	mov	eax,[esi+28h]
	mov	dword ptr [esi],4323BCh
	mov	dword ptr [esi+14h],431874h
	mov	eax,[eax+4h]
	mov	dword ptr [eax+esi+28h],4324CCh
	mov	eax,[esi+28h]
	mov	eax,[eax+4h]
	mov	dword ptr [eax+esi+24h],0h
	mov	eax,esi
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	esi
	mov	esp,ebp
	pop	ebp
	ret	8h
004181EB                                  CC CC CC CC CC            .....

;; fn004181F0: 004181F0
;;   Called from:
;;     004181A9 (in fn00418150)
;;     00418696 (in fn004198FB)
;;     00418696 (in fn004198D3)
;;     00418BD2 (in fn00418B80)
fn004181F0 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42EA68h
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
	mov	edi,ecx
	mov	[ebp-10h],edi
	mov	ebx,[ebp+8h]
	lea	eax,[edi+4h]
	xorps	xmm0,xmm0
	mov	dword ptr [edi],431384h
	push	eax
	movq	qword ptr [eax],xmm0
	lea	eax,[ebx+4h]
	push	eax
	call	dword ptr [4311D0h]
	mov	dword ptr [edi],431844h
	add	esp,8h
	mov	eax,[ebx+0Ch]
	mov	[edi+0Ch],eax
	mov	eax,[ebx+10h]
	mov	[edi+10h],eax
	lea	esi,[edi+14h]
	mov	dword ptr [ebp-4h],0h
	mov	dword ptr [esi],431834h
	mov	ecx,[ebx+18h]
	mov	[ebp+8h],esi
	mov	[esi+4h],ecx
	test	ecx,ecx
	jz	418270h

l0041826B:
	mov	eax,[ecx]
	call	dword ptr [eax+0Ch]

l00418270:
	mov	eax,[ebx+1Ch]
	mov	[esi+8h],eax
	mov	eax,[ebx+20h]
	mov	[esi+0Ch],eax
	mov	eax,[ebx+24h]
	mov	[esi+10h],eax
	mov	eax,edi
	mov	dword ptr [edi],431868h
	mov	dword ptr [esi],432408h
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	4h
004182A4             CC CC CC CC CC CC CC CC CC CC CC CC     ............
004182B0 55 8B EC 56 8B 75 08 0F 57 C0 57 8B F9 8D 47 04 U..V.u..W.W...G.
004182C0 50 C7 07 84 13 43 00 66 0F D6 00 8D 46 04 50 FF P....C.f....F.P.
004182D0 15 D0 11 43 00 C7 07 44 18 43 00 83 C4 08 8B 46 ...C...D.C.....F
004182E0 0C 89 47 0C 8B 46 10 89 47 10 8B C7 5F 5E 5D C2 ..G..F..G..._^].
004182F0 04 00 CC CC CC CC CC CC CC CC CC CC CC CC CC CC ................
00418300 55 8B EC 6A FF 68 50 DE 42 00 64 A1 00 00 00 00 U..j.hP.B.d.....
00418310 50 53 56 57 A1 08 A0 43 00 33 C5 50 8D 45 F4 64 PSVW...C.3.P.E.d
00418320 A3 00 00 00 00 8B F1 8D 4E 10 8D 5E 18 FF 15 E4 ........N..^....
00418330 10 43 00 C7 45 FC 00 00 00 00 8B 76 04 85 F6 74 .C..E......v...t
00418340 2B 83 CF FF 8D 4E 04 8B C7 F0 0F C1 01 83 F8 01 +....N..........
00418350 75 1A 8B 06 8B CE FF 50 04 8D 46 08 F0 0F C1 38 u......P..F....8
00418360 83 FF 01 75 07 8B 06 8B CE FF 50 08 8B CB FF 15 ...u......P.....
00418370 A8 10 43 00 8B 4D F4 64 89 0D 00 00 00 00 59 5F ..C..M.d......Y_
00418380 5E 5B 8B E5 5D C3 CC CC CC CC CC CC CC CC CC CC ^[..]...........

;; fn00418390: 00418390
;;   Called from:
;;     004166C3 (in fn00416530)
;;     00416715 (in fn00416530)
fn00418390 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42EF70h
	mov	eax,fs:[0000h]
	push	eax
	push	esi
	push	edi
	mov	eax,[43A008h]
	xor	eax,ebp
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	esi,ecx
	mov	edi,[ebp+8h]
	lea	ecx,[esi+4h]
	mov	eax,[edi]
	mov	[esi],eax
	lea	eax,[edi+4h]
	cmp	ecx,eax
	jz	4183DAh

l004183C7:
	cmp	dword ptr [eax+14h],10h
	mov	edx,eax
	jc	4183D1h

l004183CF:
	mov	edx,[eax]

l004183D1:
	push	dword ptr [eax+10h]
	push	edx
	call	402A70h

l004183DA:
	lea	eax,[edi+1Ch]
	lea	ecx,[esi+1Ch]
	cmp	ecx,eax
	jz	4183F7h

l004183E4:
	cmp	dword ptr [eax+14h],10h
	mov	edx,eax
	jc	4183EEh

l004183EC:
	mov	edx,[eax]

l004183EE:
	push	dword ptr [eax+10h]
	push	edx
	call	402A70h

l004183F7:
	mov	eax,[edi+38h]
	mov	[esi+38h],eax
	mov	eax,[edi+3Ch]
	mov	[esi+3Ch],eax
	mov	eax,[edi+40h]
	mov	[esi+40h],eax
	mov	eax,[edi+44h]
	mov	[esi+44h],eax
	mov	al,[edi+48h]
	mov	[esi+48h],al
	mov	eax,[edi+4Ch]
	mov	[esi+4Ch],eax
	mov	eax,[edi+50h]
	mov	[esi+50h],eax
	mov	eax,[edi+54h]
	mov	[esi+54h],eax
	cmp	byte ptr [esi+58h],0h
	jz	418485h

l0041842D:
	cmp	byte ptr [edi+58h],0h
	jz	418460h

l00418433:
	mov	dword ptr [ebp-4h],0h
	mov	ecx,[esi+60h]
	cmp	ecx,[edi+60h]
	jz	4184A1h

l00418442:
	mov	eax,[ecx]
	call	dword ptr [eax+8h]
	test	eax,eax
	jz	418453h

l0041844B:
	mov	edx,[eax]
	mov	ecx,eax
	push	1h
	call	dword ptr [edx]

l00418453:
	mov	ecx,[edi+60h]
	mov	[esi+60h],ecx
	mov	eax,[ecx]
	call	dword ptr [eax+4h]
	jmp	4184A1h

l00418460:
	mov	dword ptr [ebp-4h],1h
	mov	ecx,[esi+60h]
	test	ecx,ecx
	jz	41847Fh

l0041846E:
	mov	eax,[ecx]
	call	dword ptr [eax+8h]
	test	eax,eax
	jz	41847Fh

l00418477:
	mov	edx,[eax]
	mov	ecx,eax
	push	1h
	call	dword ptr [edx]

l0041847F:
	mov	byte ptr [esi+58h],0h
	jmp	4184A1h

l00418485:
	cmp	byte ptr [edi+58h],0h
	jz	4184A1h

l0041848B:
	mov	dword ptr [ebp-4h],2h
	mov	ecx,[edi+60h]
	mov	[esi+60h],ecx
	mov	eax,[ecx]
	call	dword ptr [eax+4h]
	mov	byte ptr [esi+58h],1h

l004184A1:
	mov	eax,[edi+68h]
	mov	[esi+68h],eax
	mov	eax,[edi+6Ch]
	mov	[esi+6Ch],eax
	mov	eax,[edi+70h]
	mov	[esi+70h],eax
	mov	eax,esi
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	mov	esp,ebp
	pop	ebp
	ret	4h
004184C8                         CC CC CC CC CC CC CC CC         ........

;; fn004184D0: 004184D0
;;   Called from:
;;     00419873 (in fn0041986D)
;;     00419883 (in fn00419880)
fn004184D0 proc
	push	ebp
	mov	ebp,esp
	push	esi
	mov	esi,ecx
	call	4180A0h
	test	byte ptr [ebp+8h],1h
	jz	4184ECh

l004184E1:
	push	34h
	push	esi
	call	42763Fh
	add	esp,8h

l004184EC:
	mov	eax,esi
	pop	esi
	pop	ebp
	ret	4h
004184F3          CC CC CC CC CC CC CC CC CC CC CC CC CC    .............
00418500 55 8B EC 6A FF 68 00 EA 42 00 64 A1 00 00 00 00 U..j.h..B.d.....
00418510 50 56 A1 08 A0 43 00 33 C5 50 8D 45 F4 64 A3 00 PV...C.3.P.E.d..
00418520 00 00 00 8B F1 C7 06 68 18 43 00 C7 46 14 34 18 .......h.C..F.4.
00418530 43 00 C7 45 FC 00 00 00 00 8B 4E 18 85 C9 74 12 C..E......N...t.
00418540 8B 01 8B 40 10 FF D0 84 C0 74 07 C7 46 18 00 00 ...@.....t..F...
00418550 00 00 8D 46 04 C7 06 84 13 43 00 50 FF 15 C8 11 ...F.....C.P....
00418560 43 00 83 C4 04 F6 45 08 01 74 0B 6A 28 56 E8 CC C.....E..t.j(V..
00418570 F0 00 00 83 C4 08 8B C6 8B 4D F4 64 89 0D 00 00 .........M.d....
00418580 00 00 59 5E 8B E5 5D C2 04 00 CC CC CC CC CC CC ..Y^..].........
00418590 55 8B EC 6A FF 68 C0 E8 42 00 64 A1 00 00 00 00 U..j.h..B.d.....
004185A0 50 56 57 A1 08 A0 43 00 33 C5 50 8D 45 F4 64 A3 PVW...C.3.P.E.d.
004185B0 00 00 00 00 C7 45 FC 00 00 00 00 8B 71 04 85 F6 .....E......q...
004185C0 74 2B 83 CF FF 8D 4E 04 8B C7 F0 0F C1 01 83 F8 t+....N.........
004185D0 01 75 1A 8B 06 8B CE FF 50 04 8D 46 08 F0 0F C1 .u......P..F....
004185E0 38 83 FF 01 75 07 8B 06 8B CE FF 50 08 8B 4D F4 8...u......P..M.
004185F0 64 89 0D 00 00 00 00 59 5F 5E 8B E5 5D C3 CC CC d......Y_^..]...

l00418600:
	push	ebp
	mov	ebp,esp
	sub	esp,34h
	lea	eax,[ecx-30h]
	lea	ecx,[ebp-34h]
	push	1h
	push	eax
	call	418150h
	push	437CD4h
	lea	eax,[ebp-34h]
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
	int	3h
	int	3h
	int	3h
	int	3h

l00418630:
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42EFC3h
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
	mov	edi,ecx
	push	34h
	mov	dword ptr [ebp-10h],0h
	call	427511h
	mov	ebx,eax
	add	esp,4h
	mov	[ebp-14h],ebx
	mov	dword ptr [ebp-4h],0h
	add	edi,0D0h
	mov	dword ptr [ebx+28h],432380h
	mov	dword ptr [ebx+30h],43248Ch
	mov	byte ptr [ebp-4h],1h
	mov	ecx,ebx
	push	edi
	mov	dword ptr [ebp-10h],1h
	call	4181F0h
	mov	dword ptr [ebp-4h],2h
	lea	ecx,[ebx+14h]
	mov	eax,[ebx+28h]
	lea	edx,[edi+14h]
	mov	dword ptr [ebx],4323BCh
	neg	edi
	mov	dword ptr [ecx],431874h
	sbb	edi,edi
	mov	eax,[eax+4h]
	and	edx,edi
	mov	dword ptr [eax+ebx+28h],4324CCh
	mov	eax,[ebx+28h]
	mov	esi,[eax+4h]
	lea	eax,[esi-8h]
	mov	[esi+ebx+24h],eax
	call	403D50h
	mov	eax,[ebx+28h]
	add	ebx,28h
	mov	eax,[eax+4h]
	add	eax,ebx
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret
004186F7                      CC CC CC CC CC CC CC CC CC        .........
00418700 55 8B EC 6A FF 68 00 EA 42 00 64 A1 00 00 00 00 U..j.h..B.d.....
00418710 50 56 A1 08 A0 43 00 33 C5 50 8D 45 F4 64 A3 00 PV...C.3.P.E.d..
00418720 00 00 00 8B F1 C7 06 68 18 43 00 C7 46 14 34 18 .......h.C..F.4.
00418730 43 00 C7 45 FC 00 00 00 00 8B 4E 18 85 C9 74 12 C..E......N...t.
00418740 8B 01 8B 40 10 FF D0 84 C0 74 07 C7 46 18 00 00 ...@.....t..F...
00418750 00 00 8D 46 04 C7 06 84 13 43 00 50 FF 15 C8 11 ...F.....C.P....
00418760 43 00 83 C4 04 8B 4D F4 64 89 0D 00 00 00 00 59 C.....M.d......Y
00418770 5E 8B E5 5D C3 CC CC CC CC CC CC CC CC CC CC CC ^..]............

;; fn00418780: 00418780
;;   Called from:
;;     00412CBF (in fn00412B52)
;;     004139EE (in fn00413980)
fn00418780 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42EFE8h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,1Ch
	mov	eax,[43A008h]
	xor	eax,ebp
	mov	[ebp-14h],eax
	push	ebx
	push	esi
	push	edi
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	[ebp-10h],esp
	mov	ebx,ecx
	mov	edi,[ebp+8h]
	mov	eax,2AAAAAABh
	mov	dword ptr [ebx],0h
	mov	dword ptr [ebx+4h],0h
	mov	dword ptr [ebx+8h],0h
	mov	ecx,[edi+4h]
	sub	ecx,[edi]
	imul	ecx
	mov	[ebp-28h],ebx
	sar	edx,2h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx
	jz	41889Eh

l004187E6:
	cmp	eax,0AAAAAAAh
	ja	4188BEh

l004187F1:
	lea	esi,[eax+eax*2]
	shl	esi,3h
	cmp	esi,1000h
	jc	41882Ah

l004187FF:
	lea	eax,[esi+23h]
	or	ecx,0FFh
	cmp	eax,esi
	cmovbe	eax,ecx

l0041880A:
	push	eax
	call	427511h
	mov	ecx,eax
	add	esp,4h
	test	ecx,ecx
	jz	418824h

l00418819:
	lea	eax,[ecx+23h]
	and	eax,0E0h
	mov	[eax-4h],ecx
	jmp	41883Bh

l00418824:
	call	dword ptr [431290h]

l0041882A:
	test	esi,esi
	jz	418839h

l0041882E:
	push	esi
	call	427511h
	add	esp,4h
	jmp	41883Bh

l00418839:
	xor	eax,eax

l0041883B:
	mov	[ebx],eax
	xorps	xmm0,xmm0
	mov	[ebx+4h],eax
	mov	eax,[ebx]
	add	eax,esi
	mov	dword ptr [ebp-4h],0h
	mov	[ebx+8h],eax
	mov	esi,[ebx]
	mov	eax,[edi+4h]
	mov	edi,[edi]
	movq	qword ptr [ebp-20h],xmm0
	mov	dword ptr [ebp-18h],0h
	mov	[ebp-24h],eax
	mov	[ebp-20h],esi
	mov	[ebp-1Ch],esi
	mov	[ebp-18h],ebx
	mov	byte ptr [ebp-4h],1h

l00418874:
	cmp	edi,eax
	jz	41888Eh

l00418878:
	push	edi
	mov	ecx,esi
	call	4028D0h
	mov	eax,[ebp-24h]
	add	esi,18h
	mov	[ebp-1Ch],esi
	add	edi,18h
	jmp	418874h

l0041888E:
	push	ecx
	mov	edx,esi
	mov	ecx,esi
	call	403510h
	add	esp,4h
	mov	[ebx+4h],esi

l0041889E:
	mov	eax,ebx
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	ecx,[ebp-14h]
	xor	ecx,ebp
	call	427500h
	mov	esp,ebp
	pop	ebp
	ret	4h

l004188BE:
	call	403730h
	mov	ecx,[ebp-28h]
	call	402750h
	push	0h
	push	0h
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
	int	3h
	int	3h

;; fn004188E0: 004188E0
;;   Called from:
;;     004188DF (in fn00418780)
;;     004198DE (in fn004198DB)
fn004188E0 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42DE50h
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
	mov	ebx,ecx
	lea	ecx,[ebx-8h]
	lea	edi,[ebx-18h]
	call	dword ptr [4310E4h]
	mov	dword ptr [ebp-4h],0h
	mov	esi,[ebx-14h]
	test	esi,esi
	jz	41894Dh

;; fn00418921: 00418921
;;   Called from:
;;     0041891F (in fn004188E0)
;;     0041891F (in fn004188E0)
fn00418921 proc
	lea	ecx,[esi+4h]
	or	eax,0FFh
	lock
	xadd	[ecx],eax
	cmp	eax,1h
	jnz	41894Dh

l00418930:
	mov	eax,[esi]
	mov	ecx,esi
	call	dword ptr [eax+4h]
	lea	eax,[esi+8h]
	or	ecx,0FFh
	lock
	xadd	[eax],ecx
	cmp	ecx,1h
	jnz	41894Dh

l00418946:
	mov	eax,[esi]
	mov	ecx,esi
	call	dword ptr [eax+8h]

;; fn0041894D: 0041894D
;;   Called from:
;;     0041891F (in fn004188E0)
;;     0041891F (in fn004188E0)
;;     0041892E (in fn00418921)
;;     00418944 (in fn00418921)
;;     0041894A (in fn00418921)
fn0041894D proc
	mov	ecx,ebx
	call	dword ptr [4310A8h]
	test	byte ptr [ebp+8h],1h
	jz	418966h

l0041895B:
	push	60h
	push	edi
	call	42763Fh
	add	esp,8h

l00418966:
	mov	eax,edi
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	4h
0041897C                                     CC CC CC CC             ....

;; fn00418980: 00418980
;;   Called from:
;;     004179A6 (in fn00417731)
;;     00417DDD (in fn00417731)
fn00418980 proc
	push	ebp
	mov	ebp,esp
	sub	esp,1Ch
	push	esi
	mov	esi,ecx
	mov	eax,[esi+20h]
	mov	ecx,[eax]
	test	ecx,ecx
	jz	4189CEh

l00418992:
	mov	eax,[esi+10h]
	cmp	ecx,[eax]
	jz	4189CEh

l00418999:
	push	2h
	sub	esp,18h
	lea	ecx,[ebp-18h]
	mov	eax,esp
	xorps	xmm0,xmm0
	push	ecx
	mov	dword ptr [eax],0h
	mov	ecx,esi
	mov	dword ptr [eax+4h],0h
	mov	dword ptr [eax+8h],0h
	mov	dword ptr [eax+0Ch],0h
	movq	qword ptr [eax+10h],xmm0
	mov	eax,[esi]
	call	dword ptr [eax+2Ch]

l004189CE:
	mov	eax,[esi+1Ch]
	mov	ecx,[eax]
	test	ecx,ecx
	jz	418A13h

l004189D7:
	mov	eax,[esi+0Ch]
	cmp	ecx,[eax]
	jz	418A13h

l004189DE:
	push	1h
	sub	esp,18h
	lea	ecx,[ebp-18h]
	mov	eax,esp
	xorps	xmm0,xmm0
	push	ecx
	mov	dword ptr [eax],0h
	mov	ecx,esi
	mov	dword ptr [eax+4h],0h
	mov	dword ptr [eax+8h],0h
	mov	dword ptr [eax+0Ch],0h
	movq	qword ptr [eax+10h],xmm0
	mov	eax,[esi]
	call	dword ptr [eax+2Ch]

l00418A13:
	pop	esi
	mov	esp,ebp
	pop	ebp
	ret
00418A18                         CC CC CC CC CC CC CC CC         ........

;; fn00418A20: 00418A20
;;   Called from:
;;     00417741 (in fn00417731)
;;     00417A6F (in fn00417731)
fn00418A20 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42F010h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,10h
	push	esi
	push	edi
	mov	eax,[43A008h]
	xor	eax,ebp
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	edi,ecx
	cmp	byte ptr [edi+20h],0h
	mov	esi,[ebp+8h]
	jz	418A6Eh

l00418A52:
	lea	eax,[edi+24h]
	mov	ecx,esi
	push	eax
	lea	eax,[ebp-14h]
	push	eax
	call	dword ptr [431128h]
	mov	dword ptr [ebp-4h],0h
	mov	ecx,[ebp-10h]
	jmp	418A8Ch

l00418A6E:
	mov	eax,[ebp+0Ch]
	test	eax,eax
	jz	418AA8h

l00418A75:
	push	eax
	lea	eax,[ebp-1Ch]
	mov	ecx,esi
	push	eax
	call	dword ptr [431128h]
	mov	dword ptr [ebp-4h],1h
	mov	ecx,[ebp-18h]

l00418A8C:
	test	ecx,ecx
	jz	418AA1h

l00418A90:
	mov	eax,[ecx]
	call	dword ptr [eax+8h]
	test	eax,eax
	jz	418AA1h

l00418A99:
	mov	edx,[eax]
	mov	ecx,eax
	push	1h
	call	dword ptr [edx]

l00418AA1:
	mov	dword ptr [ebp-4h],0FFFFFFFFh

l00418AA8:
	mov	ecx,[edi]
	mov	eax,ecx
	mov	edx,[edi+4h]
	and	eax,edx
	cmp	eax,0FFh
	jz	418ABCh

l00418AB6:
	mov	[esi+20h],ecx
	mov	[esi+24h],edx

l00418ABC:
	mov	ecx,[edi+8h]
	mov	eax,ecx
	mov	edx,[edi+0Ch]
	and	eax,edx
	cmp	eax,0FFh
	jz	418AD1h

l00418ACB:
	mov	[esi+18h],ecx
	mov	[esi+1Ch],edx

l00418AD1:
	mov	al,[edi+10h]
	test	al,al
	jz	418ADBh

l00418AD8:
	mov	[esi+40h],al

l00418ADB:
	movzx	eax,word ptr [edi+14h]
	mov	ecx,esi
	push	0h
	mov	[esi+14h],eax
	push	dword ptr [edi+18h]
	call	dword ptr [43110Ch]
	push	dword ptr [edi+1Ch]
	mov	ecx,esi
	call	dword ptr [4310F8h]
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	mov	esp,ebp
	pop	ebp
	ret	8h
00418B0D                                        CC CC CC              ...

;; fn00418B10: 00418B10
;;   Called from:
;;     004175DA (in fn004175B0)
fn00418B10 proc
	push	esi
	push	edi
	mov	edi,ecx
	mov	esi,edx
	lea	eax,[edi+4h]
	xorps	xmm0,xmm0
	push	eax
	mov	dword ptr [edi],431384h
	movq	qword ptr [eax],xmm0
	lea	eax,[esi+4h]
	push	eax
	call	dword ptr [4311D0h]
	mov	dword ptr [edi],431844h
	add	esp,8h
	mov	eax,[esi+0Ch]
	mov	[edi+0Ch],eax
	mov	eax,[esi+10h]
	mov	[edi+10h],eax
	mov	eax,edi
	mov	dword ptr [edi+18h],0h
	mov	dword ptr [edi+1Ch],0h
	mov	dword ptr [edi+20h],0h
	mov	dword ptr [edi+24h],0FFFFFFFFh
	mov	dword ptr [edi],431868h
	mov	dword ptr [edi+14h],432408h
	pop	edi
	pop	esi
	ret
00418B74             CC CC CC CC CC CC CC CC CC CC CC CC     ............

;; fn00418B80: 00418B80
;;   Called from:
;;     004175EB (in fn004175B0)
fn00418B80 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42F054h
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
	mov	esi,edx
	mov	edi,ecx
	mov	[ebp-14h],edi
	mov	dword ptr [ebp-10h],0h
	mov	dword ptr [edi+28h],432380h
	mov	dword ptr [edi+30h],43248Ch
	mov	dword ptr [ebp-4h],0h
	push	esi
	mov	dword ptr [ebp-10h],2h
	call	4181F0h
	mov	dword ptr [ebp-4h],1h
	lea	ecx,[edi+14h]
	mov	eax,[edi+28h]
	mov	dword ptr [edi],4323BCh
	mov	dword ptr [ecx],431874h
	mov	eax,[eax+4h]
	mov	dword ptr [eax+edi+28h],4324CCh
	mov	eax,[edi+28h]
	mov	edx,[eax+4h]
	lea	eax,[edx-8h]
	mov	[edx+edi+24h],eax
	lea	edx,[esi+14h]
	neg	esi
	sbb	esi,esi
	and	edx,esi
	call	403D50h
	mov	eax,edi
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	mov	esp,ebp
	pop	ebp
	ret
00418C29                            CC CC CC CC CC CC CC          .......

;; fn00418C30: 00418C30
;;   Called from:
;;     004178CD (in fn00417731)
fn00418C30 proc
	push	ebp
	mov	ebp,esp
	sub	esp,20h
	push	ebx
	push	esi
	push	edi
	mov	edi,ecx
	mov	esi,edx
	mov	[ebp-8h],esi
	mov	eax,edi
	mov	dword ptr [edi+10h],0h
	cmp	dword ptr [edi+14h],10h
	jc	418C51h

l00418C4F:
	mov	eax,[edi]

l00418C51:
	mov	ebx,[ebp+8h]
	mov	byte ptr [eax],0h
	mov	eax,[ebp+10h]
	test	eax,eax
	jl	418E50h

l00418C62:
	mov	ecx,[ebp+0Ch]
	jg	418C6Fh

l00418C67:
	test	ecx,ecx
	jz	418E50h

l00418C6F:
	cmp	ecx,ebx
	jbe	418E50h

l00418C77:
	cmp	byte ptr [ebp+1Ch],0h
	jz	418C8Bh

l00418C7D:
	mov	edx,1h
	mov	dword ptr [ebp+10h],0h
	jmp	418C9Ch

l00418C8B:
	xorps	xmm0,xmm0
	movlpd	qword ptr [ebp-1Ch],xmm0
	mov	edx,[ebp-18h]
	mov	[ebp+10h],edx
	mov	edx,[ebp-1Ch]

l00418C9C:
	mov	esi,ecx
	xorps	xmm0,xmm0
	sub	esi,ebx
	movlpd	qword ptr [ebp-14h],xmm0
	push	ecx
	sbb	eax,0h
	mov	ecx,edi
	sub	esi,edx
	sbb	eax,[ebp+10h]
	mov	[ebp+10h],eax
	call	414E40h
	cmp	byte ptr [ebp+20h],0h
	jz	418CDAh

l00418CC1:
	push	0h
	push	2h
	push	dword ptr [ebp+10h]
	push	esi
	call	42D550h
	mov	ecx,[ebp+10h]
	sub	esi,eax
	mov	[ebp-18h],edx
	sbb	ecx,edx
	jmp	418CF7h

l00418CDA:
	test	byte ptr [ebp+18h],40h
	jz	418CEBh

l00418CE0:
	mov	edx,[ebp+10h]
	mov	[ebp-10h],esi
	mov	[ebp-18h],edx
	jmp	418D53h

l00418CEB:
	mov	eax,[ebp-10h]
	mov	ecx,[ebp+10h]
	mov	[ebp-18h],eax
	mov	eax,[ebp-14h]

l00418CF7:
	mov	[ebp-10h],eax
	mov	eax,esi
	or	eax,ecx
	mov	[ebp-0Ch],esi
	jz	418D53h

l00418D03:
	mov	edx,[edi+14h]
	mov	eax,edx
	mov	ecx,[edi+10h]
	sub	eax,ecx
	cmp	esi,eax
	ja	418D3Fh

l00418D11:
	lea	eax,[ecx+esi]
	mov	[edi+10h],eax
	mov	eax,edi
	cmp	edx,10h
	jc	418D20h

l00418D1E:
	mov	eax,[edi]

l00418D20:
	push	dword ptr [ebp-0Ch]
	lea	esi,[eax+ecx]
	mov	eax,[ebp+14h]
	movsx	eax,al
	push	eax
	push	esi
	call	42D1C3h
	mov	eax,[ebp-0Ch]
	add	esp,0Ch
	mov	byte ptr [esi+eax],0h
	jmp	418D53h

l00418D3F:
	mov	eax,[ebp+14h]
	mov	ecx,edi
	push	eax
	push	esi
	mov	byte ptr [ebp+10h],0h
	push	dword ptr [ebp+10h]
	push	esi
	call	413120h

l00418D53:
	mov	ecx,[ebp+1Ch]
	test	cl,cl
	jz	418DA4h

l00418D5A:
	mov	esi,[edi+14h]
	mov	eax,esi
	mov	edx,[edi+10h]
	sub	eax,edx
	cmp	eax,1h
	jc	418D91h

l00418D69:
	lea	eax,[edx+1h]
	mov	[edi+10h],eax
	cmp	esi,10h
	jc	418D78h

l00418D74:
	mov	esi,[edi]
	jmp	418D7Ah

l00418D78:
	mov	esi,edi

l00418D7A:
	movsx	ecx,cl
	movzx	eax,cl
	shl	cx,8h
	or	cx,ax
	mov	[esi+edx],cl
	mov	byte ptr [esi+edx+1h],0h
	jmp	418DA4h

l00418D91:
	push	ecx
	push	1h
	mov	byte ptr [ebp+10h],0h
	mov	ecx,edi
	push	dword ptr [ebp+10h]
	push	1h
	call	413120h

l00418DA4:
	test	ebx,ebx
	jz	418DEEh

l00418DA8:
	mov	edx,[edi+14h]
	mov	eax,edx
	mov	ecx,[edi+10h]
	sub	eax,ecx
	cmp	ebx,eax
	ja	418DDBh

l00418DB6:
	lea	eax,[ecx+ebx]
	mov	[edi+10h],eax
	mov	eax,edi
	cmp	edx,10h
	jc	418DC5h

l00418DC3:
	mov	eax,[edi]

l00418DC5:
	push	ebx
	push	dword ptr [ebp-8h]
	lea	esi,[eax+ecx]
	push	esi
	call	42D1C9h
	add	esp,0Ch
	mov	byte ptr [esi+ebx],0h
	jmp	418DEEh

l00418DDB:
	push	ebx
	push	dword ptr [ebp-8h]
	mov	byte ptr [ebp+10h],0h
	mov	ecx,edi
	push	dword ptr [ebp+10h]
	push	ebx
	call	413280h

l00418DEE:
	mov	ebx,[ebp-10h]
	mov	eax,ebx
	or	eax,[ebp-18h]
	jz	418F0Ah

l00418DFC:
	mov	edx,[edi+14h]
	mov	eax,edx
	mov	ecx,[edi+10h]
	sub	eax,ecx
	cmp	ebx,eax
	ja	418E36h

l00418E0A:
	lea	eax,[ecx+ebx]
	mov	[edi+10h],eax
	cmp	edx,10h
	jc	418E17h

l00418E15:
	mov	edi,[edi]

l00418E17:
	mov	eax,[ebp+14h]
	lea	esi,[edi+ecx]
	push	ebx
	movsx	eax,al
	push	eax
	push	esi
	call	42D1C3h
	add	esp,0Ch
	mov	byte ptr [esi+ebx],0h
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret

l00418E36:
	push	dword ptr [ebp+14h]
	mov	byte ptr [ebp+10h],0h
	mov	ecx,edi
	push	ebx
	push	dword ptr [ebp+10h]
	push	ebx
	call	413120h
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret

l00418E50:
	xor	ecx,ecx
	cmp	[ebp+1Ch],cl
	setnz	cl
	xor	eax,eax
	add	ecx,ebx
	setc	al
	neg	eax
	or	eax,ecx
	mov	ecx,edi
	push	eax
	call	414E40h
	mov	ecx,[ebp+1Ch]
	test	cl,cl
	jz	418EBFh

l00418E72:
	mov	esi,[edi+14h]
	mov	eax,esi
	mov	edx,[edi+10h]
	sub	eax,edx
	cmp	eax,1h
	jc	418EA9h

l00418E81:
	lea	eax,[edx+1h]
	mov	[edi+10h],eax
	cmp	esi,10h
	jc	418E90h

l00418E8C:
	mov	esi,[edi]
	jmp	418E92h

l00418E90:
	mov	esi,edi

l00418E92:
	movsx	ecx,cl
	movzx	eax,cl
	shl	cx,8h
	or	cx,ax
	mov	[esi+edx],cl
	mov	byte ptr [esi+edx+1h],0h
	jmp	418EBCh

l00418EA9:
	push	ecx
	push	1h
	mov	byte ptr [ebp+10h],0h
	mov	ecx,edi
	push	dword ptr [ebp+10h]
	push	1h
	call	413120h

l00418EBC:
	mov	esi,[ebp-8h]

l00418EBF:
	test	ebx,ebx
	jz	418F0Ah

l00418EC3:
	mov	edx,[edi+14h]
	mov	eax,edx
	mov	ecx,[edi+10h]
	sub	eax,ecx
	cmp	ebx,eax
	ja	418EF9h

l00418ED1:
	lea	eax,[ecx+ebx]
	mov	[edi+10h],eax
	cmp	edx,10h
	jc	418EDEh

l00418EDC:
	mov	edi,[edi]

l00418EDE:
	push	ebx
	push	dword ptr [ebp-8h]
	lea	esi,[edi+ecx]
	push	esi
	call	42D1C9h
	add	esp,0Ch
	mov	byte ptr [esi+ebx],0h
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret

l00418EF9:
	push	ebx
	push	esi
	mov	byte ptr [ebp+10h],0h
	mov	ecx,edi
	push	dword ptr [ebp+10h]
	push	ebx
	call	413280h

l00418F0A:
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret
00418F11    CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC  ...............

;; fn00418F20: 00418F20
;;   Called from:
;;     00416F37 (in fn00416DA0)
fn00418F20 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42F070h
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
	mov	[ebp-10h],esp
	mov	edi,ecx
	mov	edx,[ebp+14h]
	sub	edx,[edi+0Ch]
	mov	esi,[ebp+18h]
	mov	ebx,[ebp+1Ch]
	mov	eax,[ebp+8h]
	mov	ecx,[edi+10h]
	mov	[ebp-14h],edi
	mov	[ebp-20h],eax
	mov	[ebp-1Ch],edx
	mov	[ebp-18h],ecx
	cmp	esi,ebx
	jz	41918Bh

l00418F73:
	mov	eax,ecx
	shr	eax,1h
	cmp	edx,eax
	ja	4190A8h

l00418F7F:
	mov	dword ptr [ebp-4h],0h

l00418F86:
	cmp	esi,ebx
	jz	418FC1h

l00418F8A:
	push	esi
	mov	ecx,edi
	call	4194C0h
	inc	esi
	jmp	418F86h
00418F95                8B 45 EC 8B 4D E8 3B 48 10 0F 83      .E..M.;H...
00418FA0 35 02 00 00 83 40 10 FF 75 09 C7 40 0C 00 00 00 5....@..u..@....
00418FB0 00 EB 03 FF 40 0C 3B 48 10 0F 83 1A 02 00 00 EB ....@.;H........
00418FC0 E3                                              .               

l00418FC1:
	mov	esi,[edi+10h]
	xor	ecx,ecx
	sub	esi,[ebp-18h]
	mov	eax,[edi]
	mov	ebx,[edi+0Ch]
	test	eax,eax
	jz	418FDAh

l00418FD2:
	mov	edx,[eax]
	test	edx,edx
	jz	418FDAh

l00418FD8:
	mov	ecx,[edx]

l00418FDA:
	xor	edx,edx
	test	ecx,ecx
	jz	418FE8h

l00418FE0:
	mov	ecx,[ecx]
	test	ecx,ecx
	jz	418FE8h

l00418FE6:
	mov	edx,[ecx]

l00418FE8:
	test	edx,edx
	jnz	418FF0h

l00418FEC:
	xor	ecx,ecx
	jmp	418FF2h

l00418FF0:
	mov	ecx,[edx]

l00418FF2:
	test	eax,eax
	jz	418FF8h

l00418FF6:
	mov	eax,[eax]

l00418FF8:
	lea	edx,[ebx+esi]
	push	edx
	push	ecx
	push	ebx
	push	eax
	call	4196C0h
	mov	edx,[edi]
	add	esp,4h
	mov	ebx,[edi+0Ch]
	xor	eax,eax
	mov	ecx,esp
	test	edx,edx
	jz	41901Ch

l00419014:
	mov	edx,[edx]
	test	edx,edx
	jz	41901Ch

l0041901A:
	mov	eax,[edx]

l0041901C:
	lea	edx,[ebx+esi]
	mov	dword ptr [ecx],0h
	add	edx,[ebp-1Ch]
	mov	dword ptr [ecx+4h],0h
	test	eax,eax
	jz	41903Dh

l00419033:
	mov	eax,[eax]
	test	eax,eax
	jz	41903Dh

l00419039:
	mov	eax,[eax]
	mov	[ecx],eax

l0041903D:
	mov	[ecx+8h],edx
	sub	esp,0Ch
	mov	edx,[edi]
	xor	eax,eax
	mov	ebx,[edi+0Ch]
	mov	ecx,esp
	test	edx,edx
	jz	419058h

l00419050:
	mov	edx,[edx]
	test	edx,edx
	jz	419058h

l00419056:
	mov	eax,[edx]

l00419058:
	mov	dword ptr [ecx],0h
	lea	edx,[ebx+esi]
	mov	dword ptr [ecx+4h],0h
	test	eax,eax
	jz	419076h

l0041906C:
	mov	eax,[eax]
	test	eax,eax
	jz	419076h

l00419072:
	mov	eax,[eax]
	mov	[ecx],eax

l00419076:
	mov	[ecx+8h],edx
	sub	esp,0Ch
	mov	eax,[edi+0Ch]
	mov	ecx,esp
	mov	dword ptr [ecx],0h
	mov	dword ptr [ecx+4h],0h
	mov	[ecx+8h],eax
	mov	eax,[edi]
	mov	[ecx],eax
	lea	ecx,[ebp-2Ch]
	call	419550h
	mov	ebx,[ebp-1Ch]
	add	esp,24h
	jmp	41918Dh

l004190A8:
	mov	dword ptr [ebp-4h],2h
	nop

l004190B0:
	cmp	esi,ebx
	jz	4190E8h

l004190B4:
	push	esi
	mov	ecx,edi
	call	40F210h
	inc	esi
	jmp	4190B0h
004190BF                                              8B                .
004190C0 45 EC 8B 4D E8 3B 48 10 0F 83 14 01 00 00 66 90 E..M.;H.......f.
004190D0 83 40 10 FF 75 07 C7 40 0C 00 00 00 00 3B 48 10 .@..u..@.....;H.
004190E0 0F 83 FC 00 00 00 EB E8                         ........        

l004190E8:
	mov	eax,[edi+0Ch]
	sub	esp,0Ch
	add	eax,[edi+10h]
	mov	ecx,esp
	sub	esp,0Ch
	mov	dword ptr [ecx],0h
	mov	[ecx+8h],eax
	mov	dword ptr [ecx+4h],0h
	mov	eax,[edi]
	mov	[ecx],eax
	xor	eax,eax
	mov	edx,[edi]
	mov	ecx,esp
	mov	esi,[edi+0Ch]
	test	edx,edx
	jz	41911Fh

l00419117:
	mov	edx,[edx]
	test	edx,edx
	jz	41911Fh

l0041911D:
	mov	eax,[edx]

l0041911F:
	mov	edx,[ebp-18h]
	add	edx,esi
	mov	dword ptr [ecx],0h
	mov	dword ptr [ecx+4h],0h
	test	eax,eax
	jz	41913Fh

l00419135:
	mov	eax,[eax]
	test	eax,eax
	jz	41913Fh

l0041913B:
	mov	eax,[eax]
	mov	[ecx],eax

l0041913F:
	mov	[ecx+8h],edx
	sub	esp,0Ch
	mov	edx,[edi]
	xor	eax,eax
	mov	esi,[edi+0Ch]
	mov	ecx,esp
	test	edx,edx
	jz	41915Ah

l00419152:
	mov	edx,[edx]
	test	edx,edx
	jz	41915Ah

l00419158:
	mov	eax,[edx]

l0041915A:
	mov	ebx,[ebp-1Ch]
	mov	dword ptr [ecx],0h
	mov	dword ptr [ecx+4h],0h
	lea	edx,[esi+ebx]
	test	eax,eax
	jz	41917Bh

l00419171:
	mov	eax,[eax]
	test	eax,eax
	jz	41917Bh

l00419177:
	mov	eax,[eax]
	mov	[ecx],eax

l0041917B:
	mov	[ecx+8h],edx
	lea	ecx,[ebp-2Ch]
	call	419550h
	add	esp,24h
	jmp	41918Dh

l0041918B:
	mov	ebx,edx

l0041918D:
	mov	ecx,[edi]
	xor	eax,eax
	mov	edx,[edi+0Ch]
	test	ecx,ecx
	jz	4191A0h

l00419198:
	mov	ecx,[ecx]
	test	ecx,ecx
	jz	4191A0h

l0041919E:
	mov	eax,[ecx]

l004191A0:
	add	edx,ebx
	mov	ebx,[ebp-20h]
	mov	dword ptr [ebx],0h
	mov	dword ptr [ebx+4h],0h
	test	eax,eax
	jz	4191C0h

l004191B6:
	mov	ecx,[eax]
	test	ecx,ecx
	jz	4191C0h

l004191BC:
	mov	ecx,[ecx]
	mov	[ebx],ecx

l004191C0:
	mov	[ebx+8h],edx
	mov	eax,ebx
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	18h
004191D9                            6A 00 6A 00 E8 D5 3F          j.j...?
004191E0 01 00 6A 00 6A 00 E8 CC 3F 01 00 CC CC CC CC CC ..j.j...?.......

;; fn004191F0: 004191F0
;;   Called from:
;;     004171F3 (in fn004170C0)
fn004191F0 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42F090h
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
	mov	[ebp-10h],esp
	mov	edi,ecx
	mov	edx,[ebp+14h]
	sub	edx,[edi+0Ch]
	mov	esi,[ebp+18h]
	mov	ebx,[ebp+1Ch]
	mov	eax,[ebp+8h]
	mov	ecx,[edi+10h]
	mov	[ebp-14h],edi
	mov	[ebp-20h],eax
	mov	[ebp-1Ch],edx
	mov	[ebp-18h],ecx
	cmp	esi,ebx
	jz	41945Bh

l00419243:
	mov	eax,ecx
	shr	eax,1h
	cmp	edx,eax
	ja	419378h

l0041924F:
	mov	dword ptr [ebp-4h],0h

l00419256:
	cmp	esi,ebx
	jz	419291h

l0041925A:
	push	esi
	mov	ecx,edi
	call	4194C0h
	inc	esi
	jmp	419256h
00419265                8B 45 EC 8B 4D E8 3B 48 10 0F 83      .E..M.;H...
00419270 35 02 00 00 83 40 10 FF 75 09 C7 40 0C 00 00 00 5....@..u..@....
00419280 00 EB 03 FF 40 0C 3B 48 10 0F 83 1A 02 00 00 EB ....@.;H........
00419290 E3                                              .               

l00419291:
	mov	esi,[edi+10h]
	xor	ecx,ecx
	sub	esi,[ebp-18h]
	mov	eax,[edi]
	mov	ebx,[edi+0Ch]
	test	eax,eax
	jz	4192AAh

l004192A2:
	mov	edx,[eax]
	test	edx,edx
	jz	4192AAh

l004192A8:
	mov	ecx,[edx]

l004192AA:
	xor	edx,edx
	test	ecx,ecx
	jz	4192B8h

l004192B0:
	mov	ecx,[ecx]
	test	ecx,ecx
	jz	4192B8h

l004192B6:
	mov	edx,[ecx]

l004192B8:
	test	edx,edx
	jnz	4192C0h

l004192BC:
	xor	ecx,ecx
	jmp	4192C2h

l004192C0:
	mov	ecx,[edx]

l004192C2:
	test	eax,eax
	jz	4192C8h

l004192C6:
	mov	eax,[eax]

l004192C8:
	lea	edx,[ebx+esi]
	push	edx
	push	ecx
	push	ebx
	push	eax
	call	4196C0h
	mov	edx,[edi]
	add	esp,4h
	mov	ebx,[edi+0Ch]
	xor	eax,eax
	mov	ecx,esp
	test	edx,edx
	jz	4192ECh

l004192E4:
	mov	edx,[edx]
	test	edx,edx
	jz	4192ECh

l004192EA:
	mov	eax,[edx]

l004192EC:
	lea	edx,[ebx+esi]
	mov	dword ptr [ecx],0h
	add	edx,[ebp-1Ch]
	mov	dword ptr [ecx+4h],0h
	test	eax,eax
	jz	41930Dh

l00419303:
	mov	eax,[eax]
	test	eax,eax
	jz	41930Dh

l00419309:
	mov	eax,[eax]
	mov	[ecx],eax

l0041930D:
	mov	[ecx+8h],edx
	sub	esp,0Ch
	mov	edx,[edi]
	xor	eax,eax
	mov	ebx,[edi+0Ch]
	mov	ecx,esp
	test	edx,edx
	jz	419328h

l00419320:
	mov	edx,[edx]
	test	edx,edx
	jz	419328h

l00419326:
	mov	eax,[edx]

l00419328:
	mov	dword ptr [ecx],0h
	lea	edx,[ebx+esi]
	mov	dword ptr [ecx+4h],0h
	test	eax,eax
	jz	419346h

l0041933C:
	mov	eax,[eax]
	test	eax,eax
	jz	419346h

l00419342:
	mov	eax,[eax]
	mov	[ecx],eax

l00419346:
	mov	[ecx+8h],edx
	sub	esp,0Ch
	mov	eax,[edi+0Ch]
	mov	ecx,esp
	mov	dword ptr [ecx],0h
	mov	dword ptr [ecx+4h],0h
	mov	[ecx+8h],eax
	mov	eax,[edi]
	mov	[ecx],eax
	lea	ecx,[ebp-2Ch]
	call	419550h
	mov	ebx,[ebp-1Ch]
	add	esp,24h
	jmp	41945Dh

l00419378:
	mov	dword ptr [ebp-4h],2h
	nop

l00419380:
	cmp	esi,ebx
	jz	4193B8h

l00419384:
	push	esi
	mov	ecx,edi
	call	40F210h
	inc	esi
	jmp	419380h
0041938F                                              8B                .
00419390 45 EC 8B 4D E8 3B 48 10 0F 83 14 01 00 00 66 90 E..M.;H.......f.
004193A0 83 40 10 FF 75 07 C7 40 0C 00 00 00 00 3B 48 10 .@..u..@.....;H.
004193B0 0F 83 FC 00 00 00 EB E8                         ........        

l004193B8:
	mov	eax,[edi+10h]
	sub	esp,0Ch
	add	eax,[edi+0Ch]
	mov	ecx,esp
	sub	esp,0Ch
	mov	dword ptr [ecx],0h
	mov	[ecx+8h],eax
	mov	dword ptr [ecx+4h],0h
	mov	eax,[edi]
	mov	[ecx],eax
	xor	eax,eax
	mov	edx,[edi]
	mov	ecx,esp
	mov	esi,[edi+0Ch]
	test	edx,edx
	jz	4193EFh

l004193E7:
	mov	edx,[edx]
	test	edx,edx
	jz	4193EFh

l004193ED:
	mov	eax,[edx]

l004193EF:
	mov	edx,[ebp-18h]
	add	edx,esi
	mov	dword ptr [ecx],0h
	mov	dword ptr [ecx+4h],0h
	test	eax,eax
	jz	41940Fh

l00419405:
	mov	eax,[eax]
	test	eax,eax
	jz	41940Fh

l0041940B:
	mov	eax,[eax]
	mov	[ecx],eax

l0041940F:
	mov	[ecx+8h],edx
	sub	esp,0Ch
	mov	edx,[edi]
	xor	eax,eax
	mov	esi,[edi+0Ch]
	mov	ecx,esp
	test	edx,edx
	jz	41942Ah

l00419422:
	mov	edx,[edx]
	test	edx,edx
	jz	41942Ah

l00419428:
	mov	eax,[edx]

l0041942A:
	mov	ebx,[ebp-1Ch]
	mov	dword ptr [ecx],0h
	mov	dword ptr [ecx+4h],0h
	lea	edx,[esi+ebx]
	test	eax,eax
	jz	41944Bh

l00419441:
	mov	eax,[eax]
	test	eax,eax
	jz	41944Bh

l00419447:
	mov	eax,[eax]
	mov	[ecx],eax

l0041944B:
	mov	[ecx+8h],edx
	lea	ecx,[ebp-2Ch]
	call	419550h
	add	esp,24h
	jmp	41945Dh

l0041945B:
	mov	ebx,edx

l0041945D:
	mov	ecx,[edi]
	xor	eax,eax
	mov	edx,[edi+0Ch]
	test	ecx,ecx
	jz	419470h

l00419468:
	mov	ecx,[ecx]
	test	ecx,ecx
	jz	419470h

l0041946E:
	mov	eax,[ecx]

l00419470:
	add	edx,ebx
	mov	ebx,[ebp-20h]
	mov	dword ptr [ebx],0h
	mov	dword ptr [ebx+4h],0h
	test	eax,eax
	jz	419490h

l00419486:
	mov	ecx,[eax]
	test	ecx,ecx
	jz	419490h

l0041948C:
	mov	ecx,[ecx]
	mov	[ebx],ecx

l00419490:
	mov	[ebx+8h],edx
	mov	eax,ebx
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	18h
004194A9                            6A 00 6A 00 E8 05 3D          j.j...=
004194B0 01 00 6A 00 6A 00 E8 FC 3C 01 00 CC CC CC CC CC ..j.j...<.......

;; fn004194C0: 004194C0
;;   Called from:
;;     00418F8D (in fn00418F20)
;;     0041925D (in fn004191F0)
fn004194C0 proc
	push	ebp
	mov	ebp,esp
	push	ebx
	push	esi
	mov	esi,ecx
	push	edi
	mov	ecx,[esi+0Ch]
	test	cl,0Fh
	jnz	4194E9h

l004194D0:
	mov	eax,[esi+10h]
	add	eax,10h
	shr	eax,4h
	cmp	[esi+8h],eax
	ja	4194E9h

l004194DE:
	push	ecx
	mov	ecx,esi
	call	411200h
	mov	ecx,[esi+0Ch]

l004194E9:
	mov	edi,[esi+8h]
	shl	edi,4h
	dec	edi
	and	edi,ecx
	mov	[esi+0Ch],edi
	mov	ecx,[esi+8h]
	mov	eax,ecx
	shl	eax,4h
	test	edi,edi
	cmovz	edi,eax

l00419502:
	dec	ecx
	dec	edi
	mov	eax,edi
	shr	eax,4h
	and	ecx,eax
	lea	ebx,[0000h+ecx*4]
	mov	ecx,[esi+4h]
	cmp	dword ptr [ecx+ebx],0h
	jnz	41952Eh

l0041951B:
	push	10h
	call	427511h
	mov	ecx,[esi+4h]
	add	esp,4h
	mov	[ebx+ecx],eax
	mov	ecx,[esi+4h]

l0041952E:
	mov	ecx,[ebx+ecx]
	mov	edx,edi
	mov	eax,[ebp+8h]
	and	edx,0Fh
	mov	al,[eax]
	mov	[edx+ecx],al
	mov	[esi+0Ch],edi
	inc	dword ptr [esi+10h]
	pop	edi
	pop	esi
	pop	ebx
	pop	ebp
	ret	4h
0041954B                                  CC CC CC CC CC            .....

;; fn00419550: 00419550
;;   Called from:
;;     00419098 (in fn00418F20)
;;     00419181 (in fn00418F20)
;;     00419368 (in fn004191F0)
;;     00419451 (in fn004191F0)
fn00419550 proc
	push	ebp
	mov	ebp,esp
	sub	esp,20h
	mov	eax,[43A008h]
	xor	eax,ebp
	mov	[ebp-4h],eax
	mov	eax,[ebp+20h]
	push	ebx
	push	esi
	mov	esi,ecx
	push	edi
	test	eax,eax
	jnz	419570h

l0041956C:
	xor	ecx,ecx
	jmp	419572h

l00419570:
	mov	ecx,[eax]

l00419572:
	mov	eax,[ebp+14h]
	mov	edi,[ebp+28h]
	mov	[ebp-8h],ecx
	test	eax,eax
	jnz	419584h

l0041957F:
	mov	[ebp-14h],eax
	jmp	419589h

l00419584:
	mov	eax,[eax]
	mov	[ebp-14h],eax

l00419589:
	mov	eax,[ebp+1Ch]
	mov	[ebp-10h],eax
	mov	eax,[ebp+8h]
	test	eax,eax
	jnz	41959Ah

l00419596:
	xor	edx,edx
	jmp	41959Ch

l0041959A:
	mov	edx,[eax]

l0041959C:
	mov	ebx,[ebp+10h]
	mov	[ebp-18h],edx
	cmp	ebx,[ebp-10h]
	jz	4195E4h

l004195A7:
	mov	ecx,[ebp-10h]
	cmp	ecx,edi
	jnz	4195B2h

l004195AE:
	mov	edi,ebx
	jmp	4195E4h

l004195B2:
	push	ecx
	push	dword ptr [ebp-14h]
	push	ebx
	push	edx
	call	4196C0h
	push	edi
	push	dword ptr [ebp-8h]
	push	dword ptr [ebp-10h]
	push	dword ptr [ebp-14h]
	call	4196C0h
	push	edi
	push	dword ptr [ebp-8h]
	push	ebx
	push	dword ptr [ebp-18h]
	call	4196C0h
	sub	ebx,[ebp-10h]
	add	esp,30h
	mov	eax,[ebp+8h]
	add	edi,ebx

l004195E4:
	mov	[ebp+10h],edi
	mov	dword ptr [esi],0h
	mov	dword ptr [esi+4h],0h
	test	eax,eax
	jz	419618h

l004195F8:
	mov	ecx,[eax]
	mov	eax,esi
	test	ecx,ecx
	jz	41961Ah

l00419600:
	mov	ecx,[ecx]
	mov	[esi],ecx
	mov	[esi+8h],edi
	pop	edi
	pop	esi
	pop	ebx
	mov	ecx,[ebp-4h]
	xor	ecx,ebp
	call	427500h
	mov	esp,ebp
	pop	ebp
	ret

l00419618:
	mov	eax,esi

l0041961A:
	mov	ecx,[ebp-4h]
	mov	[esi+8h],edi
	xor	ecx,ebp
	pop	edi
	pop	esi
	pop	ebx
	call	427500h
	mov	esp,ebp
	pop	ebp
	ret
0041962E                                           CC CC               ..

;; fn00419630: 00419630
;;   Called from:
;;     00417699 (in fn004175B0)
;;     00417699 (in fn00417600)
;;     004179F5 (in fn00417731)
fn00419630 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42F0B0h
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
	push	14h
	mov	dword ptr [esi],0h
	mov	dword ptr [ebp-4h],0h
	call	427511h
	add	esp,4h
	mov	dword ptr [eax+10h],0h
	mov	ecx,[ebp+8h]
	mov	dword ptr [eax+4h],1h
	mov	dword ptr [eax+8h],1h
	mov	dword ptr [eax],43181Ch
	mov	[eax+0Ch],ecx
	mov	[esi],eax
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
004196AD                                        6A 00 6A              j.j
004196B0 00 E8 01 3B 01 00 CC CC CC CC CC CC CC CC CC CC ...;............

;; fn004196C0: 004196C0
;;   Called from:
;;     00418FFF (in fn00418F20)
;;     004192CF (in fn004191F0)
;;     004195B8 (in fn00419550)
;;     004195C7 (in fn00419550)
;;     004195D4 (in fn00419550)
fn004196C0 proc
	push	ebp
	mov	ebp,esp
	sub	esp,8h
	mov	edx,[ebp+10h]
	mov	eax,[ebp+8h]
	push	ebx
	mov	ebx,[ebp+0Ch]
	push	esi
	push	edi
	mov	edi,[ebp+14h]
	mov	[ebp-8h],edx
	mov	[ebp-4h],eax
	cmp	ebx,edi
	jz	419724h

l004196DF:
	nop

l004196E0:
	dec	edi
	cmp	ebx,edi
	jz	419724h

l004196E5:
	mov	eax,[edx+8h]
	mov	ecx,edi
	dec	eax
	shr	ecx,4h
	and	ecx,eax
	mov	esi,edi
	mov	eax,[edx+4h]
	and	esi,0Fh
	mov	edx,[ebp-4h]
	add	esi,[eax+ecx*4]
	mov	eax,ebx
	mov	ecx,[edx+8h]
	shr	eax,4h
	dec	ecx
	and	ecx,eax
	mov	eax,[edx+4h]
	mov	edx,ebx
	inc	ebx
	and	edx,0Fh
	add	edx,[eax+ecx*4]
	mov	al,[esi]
	mov	cl,[edx]
	mov	[edx],al
	mov	edx,[ebp-8h]
	mov	[esi],cl
	cmp	ebx,edi
	jnz	4196E0h

l00419724:
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret
0041972B                                  CC CC CC CC CC            .....

;; fn00419730: 00419730
fn00419730 proc
	lea	eax,[ecx+10h]
	ret
00419734             CC CC CC CC CC CC CC CC CC CC CC CC     ............

;; fn00419740: 00419740
fn00419740 proc
	push	ebp
	mov	ebp,esp
	mov	eax,[ebp+8h]
	push	esi
	add	eax,4h
	mov	esi,ecx
	push	43A5B4h
	push	eax
	call	dword ptr [4311ECh]
	add	esp,8h
	test	eax,eax
	jnz	419767h

l0041975F:
	lea	eax,[esi+10h]
	pop	esi
	pop	ebp
	ret	4h

l00419767:
	xor	eax,eax
	pop	esi
	pop	ebp
	ret	4h
0041976E                                           CC CC               ..

;; fn00419770: 00419770
fn00419770 proc
	push	ebp
	mov	ebp,esp
	test	byte ptr [ebp+8h],1h
	push	esi
	mov	esi,ecx
	mov	dword ptr [esi],431480h
	jz	41978Dh

l00419782:
	push	14h
	push	esi
	call	42763Fh
	add	esp,8h

l0041978D:
	mov	eax,esi
	pop	esi
	pop	ebp
	ret	4h
00419794             CC CC CC CC CC CC CC CC CC CC CC CC     ............

;; fn004197A0: 004197A0
;;   Called from:
;;     00418012 (in fn00417F50)
fn004197A0 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42F0D0h
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
	mov	edi,ecx
	mov	dword ptr [ebp-4h],0h
	mov	eax,[ebp+0Ch]
	mov	[ebp-1Ch],edi
	nop	word ptr [eax+eax+0h]

l004197E0:
	cmp	eax,[ebp+14h]
	jz	419847h

l004197E5:
	mov	edx,[ebp+8h]
	mov	ecx,eax
	shr	ecx,4h
	and	eax,0Fh
	mov	esi,[edx+8h]
	dec	esi
	and	esi,ecx
	mov	ecx,[edx+4h]
	mov	ecx,[ecx+esi*4]
	mov	esi,[edi+14h]
	mov	dl,[eax+ecx]
	mov	ecx,[edi+10h]
	mov	[ebp-14h],dl
	cmp	ecx,esi
	jnc	41982Ch

l0041980C:
	lea	eax,[ecx+1h]
	mov	[edi+10h],eax
	mov	eax,edi
	cmp	esi,10h
	jc	41981Bh

l00419819:
	mov	eax,[edi]

l0041981B:
	mov	[eax+ecx],dl
	mov	byte ptr [eax+ecx+1h],0h
	mov	eax,[ebp+0Ch]
	inc	eax
	mov	[ebp+0Ch],eax
	jmp	4197E0h

l0041982C:
	push	dword ptr [ebp-14h]
	mov	byte ptr [ebp-18h],0h
	push	dword ptr [ebp-18h]
	push	ecx
	mov	ecx,edi
	call	412FE0h
	mov	eax,[ebp+0Ch]
	inc	eax
	mov	[ebp+0Ch],eax
	jmp	4197E0h

l00419847:
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	14h
0041985B                                  8B 4D E4 E8 9D            .M...
00419860 8F FE FF 6A 00 6A 00 E8 4B 39 01 00 CC          ...j.j..K9...   

;; fn0041986D: 0041986D
fn0041986D proc
	sub	ecx,[ecx-4h]
	sub	ecx,30h
	jmp	4184D0h

;; fn00419878: 00419878
fn00419878 proc
	sub	ecx,14h
	jmp	414C00h

;; fn00419880: 00419880
fn00419880 proc
	sub	ecx,14h
	jmp	4184D0h

;; fn00419888: 00419888
fn00419888 proc
	sub	ecx,[ecx-4h]
	jmp	410BE0h
00419890 2B 49 FC 83 E9 30 E9 A5 9E FF FF 2B 49 FC E9 5D +I...0.....+I..]
004198A0 9F FF FF 83 E9 14 E9 95 9E FF FF                ...........     

;; fn004198AB: 004198AB
fn004198AB proc
	sub	ecx,[ecx-4h]
	jmp	410B10h
004198B3          2B 49 FC E9 35 B4 FF FF 83 E9 14 E9 6D    +I..5.......m
004198C0 B3 FF FF                                        ...             

;; fn004198C3: 004198C3
fn004198C3 proc
	sub	ecx,[ecx-4h]
	jmp	410AE0h
004198CB                                  2B 49 FC E9 ED            +I...
004198D0 B3 FF FF                                        ...             

;; fn004198D3: 004198D3
fn004198D3 proc
	sub	ecx,[ecx-4h]
	jmp	418600h

;; fn004198DB: 004198DB
fn004198DB proc
	sub	ecx,[ecx-4h]
	jmp	4188E0h

;; fn004198E3: 004198E3
fn004198E3 proc
	sub	ecx,14h
	jmp	413770h
004198EB                                  83 E9 14 E9 0D            .....
004198F0 EC FF FF 2B 49 FC E9 35 9F FF FF                ...+I..5...     

;; fn004198FB: 004198FB
fn004198FB proc
	sub	ecx,[ecx-4h]
	jmp	418630h
00419903          2B 49 FC 83 E9 30 E9 F2 B2 FF FF CC CC    +I...0.......

;; fn00419910: 00419910
;;   Called from:
;;     00427B21 (in Win32CrtStartup)
fn00419910 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42F132h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,260h
	mov	eax,[43A008h]
	xor	eax,ebp
	mov	[ebp-10h],eax
	push	ebx
	push	esi
	push	edi
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	ebx,[ebp+0Ch]
	lea	eax,[ebp-268h]
	push	258h
	push	0h
	push	eax
	call	42D1C3h
	add	esp,8h
	lea	ecx,[ebp-268h]
	call	40FAE0h
	push	ecx
	lea	ecx,[ebp-1B0h]
	mov	dword ptr [ebp-4h],0h
	call	40F940h
	mov	dword ptr [ebp-0F0h],0h
	mov	dword ptr [ebp-0ECh],0Fh
	mov	byte ptr [ebp-100h],0h
	mov	dword ptr [ebp-0D8h],0h
	mov	dword ptr [ebp-0D4h],0Fh
	mov	byte ptr [ebp-0E8h],0h
	lea	ecx,[ebp-0D0h]
	mov	byte ptr [ebp-4h],3h
	call	419F00h
	mov	byte ptr [ebp-4h],4h
	push	8h
	mov	dword ptr [ebp-48h],0h
	mov	dword ptr [ebp-44h],0h
	mov	dword ptr [ebp-40h],0h
	mov	dword ptr [ebp-3Ch],0h
	mov	dword ptr [ebp-38h],0h
	call	427511h
	mov	[ebp-48h],eax
	lea	ecx,[ebp-48h]
	add	esp,4h
	mov	dword ptr [eax],0h
	mov	dword ptr [eax+4h],0h
	mov	eax,[ebp-48h]
	mov	[eax],ecx
	mov	dword ptr [ebp-30h],0DEC0D000h
	mov	dword ptr [ebp-2Ch],0DEC0D000h
	mov	dword ptr [ebp-28h],0F0h
	mov	dword ptr [ebp-24h],0h
	mov	dword ptr [ebp-1Ch],0h
	mov	dword ptr [ebp-18h],0h
	mov	byte ptr [ebp-13h],0h
	mov	edi,[ebp+8h]
	mov	dword ptr [ebp-4h],5h
	mov	byte ptr [43B123h],0h
	mov	byte ptr [43B122h],0h
	mov	byte ptr [43B120h],0h
	mov	byte ptr [43B124h],0h
	mov	byte ptr [43B121h],1h
	cmp	edi,1h
	jg	419B1Ah

l00419A67:
	mov	ecx,[4311B0h]
	mov	edx,4324F0h
	push	403150h
	call	402EE0h
	mov	ecx,eax
	call	dword ptr [431174h]
	mov	ecx,[4311B0h]
	mov	edx,432508h
	push	403150h
	call	402EE0h
	mov	ecx,eax
	call	dword ptr [431174h]
	mov	ecx,[4311B0h]
	mov	edx,432520h
	push	403150h
	call	402EE0h
	mov	ecx,eax
	call	dword ptr [431174h]
	mov	ecx,[4311B0h]
	mov	edx,432550h
	push	403150h
	call	402EE0h
	mov	ecx,eax
	call	dword ptr [431174h]
	mov	ecx,[4311B0h]
	mov	edx,4325C0h
	push	403150h
	call	402EE0h
	mov	ecx,eax
	call	dword ptr [431174h]
	mov	ecx,[4311B0h]
	mov	edx,432630h
	push	403150h
	call	402EE0h
	mov	ecx,eax
	call	dword ptr [431174h]
	jmp	419C1Ah

l00419B1A:
	mov	esi,1h
	nop

l00419B20:
	mov	eax,[ebx+esi*4]
	cmp	byte ptr [eax],2Dh
	jnz	419C05h

l00419B2C:
	movsx	eax,byte ptr [eax+1h]
	add	eax,0D6h
	cmp	eax,4Ah
	ja	419C11h

l00419B3C:
	movzx	eax,byte ptr [eax+419CE8h]
	jmp	dword ptr [419CCCh+eax*4]

l00419B4A:
	mov	byte ptr [43B120h],1h

l00419B51:
	mov	byte ptr [43B124h],1h

l00419B58:
	cmp	dword ptr [43B248h],0h
	mov	byte ptr [43B123h],1h
	jnz	419C11h

l00419B6C:
	push	ecx
	push	12h
	push	432688h
	mov	ecx,43B1FCh
	call	410F60h
	test	eax,eax
	mov	eax,[43B1F8h]
	push	0h
	mov	ecx,[eax+4h]
	jnz	419B9Ch

l00419B8C:
	push	2h
	add	ecx,43B1F8h
	call	dword ptr [43118Ch]
	jmp	419C11h

l00419B9C:
	push	0h
	add	ecx,43B1F8h
	call	dword ptr [43110Ch]
	jmp	419C11h

l00419BAC:
	cmp	dword ptr [43B190h],0h
	mov	byte ptr [43B122h],1h
	jnz	419C11h

l00419BBC:
	push	ecx
	push	12h
	push	432694h
	mov	ecx,43B144h
	call	410F60h
	test	eax,eax
	mov	eax,[43B140h]
	push	0h
	mov	ecx,[eax+4h]
	jnz	419BECh

l00419BDC:
	push	2h
	add	ecx,43B140h
	call	dword ptr [43118Ch]
	jmp	419C11h

l00419BEC:
	push	0h
	add	ecx,43B140h
	call	dword ptr [43110Ch]
	jmp	419C11h

l00419BFC:
	mov	byte ptr [43B121h],0h
	jmp	419C11h

l00419C05:
	push	eax
	lea	ecx,[ebp-268h]
	call	404080h

l00419C11:
	inc	esi
	cmp	esi,edi
	jl	419B20h

l00419C1A:
	cmp	dword ptr [43B190h],0h
	jz	419C48h

l00419C23:
	mov	ecx,43B144h
	call	410EF0h
	test	eax,eax
	jnz	419C48h

l00419C31:
	push	eax
	mov	eax,[43B140h]
	push	2h
	mov	ecx,[eax+4h]
	add	ecx,43B140h
	call	dword ptr [43118Ch]

l00419C48:
	cmp	dword ptr [43B248h],0h
	jz	419C76h

l00419C51:
	mov	ecx,43B1FCh
	call	410EF0h
	test	eax,eax
	jnz	419C76h

l00419C5F:
	push	eax
	mov	eax,[43B1F8h]
	push	2h
	mov	ecx,[eax+4h]
	add	ecx,43B1F8h
	call	dword ptr [43118Ch]

l00419C76:
	cmp	byte ptr [43B121h],0h
	jz	419CA1h

l00419C7F:
	mov	ecx,[4311B0h]
	mov	edx,43269Ch
	call	402EE0h
	mov	ecx,[431138h]
	push	0FFh
	push	0h
	push	1h
	call	dword ptr [4310DCh]

l00419CA1:
	lea	ecx,[ebp-268h]
	call	419D40h
	xor	eax,eax
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
00419CCA                               66 90                       f.    
l00419CCC	dd	0x00419B51
l00419CD0	dd	0x00419C11
l00419CD4	dd	0x00419B4A
l00419CD8	dd	0x00419BAC
l00419CDC	dd	0x00419BFC
l00419CE0	dd	0x00419B58
l00419CE4	dd	0x00419C11
l00419CE8	db	0x00
l00419CE9	db	0x06
l00419CEA	db	0x06
l00419CEB	db	0x06
l00419CEC	db	0x06
l00419CED	db	0x06
l00419CEE	db	0x06
l00419CEF	db	0x06
l00419CF0	db	0x06
l00419CF1	db	0x06
l00419CF2	db	0x06
l00419CF3	db	0x06
l00419CF4	db	0x06
l00419CF5	db	0x06
l00419CF6	db	0x06
l00419CF7	db	0x06
l00419CF8	db	0x06
l00419CF9	db	0x06
l00419CFA	db	0x06
l00419CFB	db	0x06
l00419CFC	db	0x06
l00419CFD	db	0x06
l00419CFE	db	0x06
l00419CFF	db	0x06
l00419D00	db	0x06
l00419D01	db	0x01
l00419D02	db	0x06
l00419D03	db	0x06
l00419D04	db	0x06
l00419D05	db	0x02
l00419D06	db	0x06
l00419D07	db	0x06
l00419D08	db	0x06
l00419D09	db	0x06
l00419D0A	db	0x03
l00419D0B	db	0x06
l00419D0C	db	0x06
l00419D0D	db	0x06
l00419D0E	db	0x01
l00419D0F	db	0x04
l00419D10	db	0x06
l00419D11	db	0x06
l00419D12	db	0x05
l00419D13	db	0x06
l00419D14	db	0x06
l00419D15	db	0x06
l00419D16	db	0x06
l00419D17	db	0x06
l00419D18	db	0x06
l00419D19	db	0x06
l00419D1A	db	0x06
l00419D1B	db	0x06
l00419D1C	db	0x06
l00419D1D	db	0x06
l00419D1E	db	0x06
l00419D1F	db	0x06
l00419D20	db	0x06
l00419D21	db	0x01
l00419D22	db	0x06
l00419D23	db	0x06
l00419D24	db	0x06
l00419D25	db	0x02
l00419D26	db	0x06
l00419D27	db	0x06
l00419D28	db	0x06
l00419D29	db	0x06
l00419D2A	db	0x03
l00419D2B	db	0x06
l00419D2C	db	0x06
l00419D2D	db	0x06
l00419D2E	db	0x01
l00419D2F	db	0x04
l00419D30	db	0x06
l00419D31	db	0x06
l00419D32	db	0x05
00419D33          CC CC CC CC CC CC CC CC CC CC CC CC CC    .............

;; fn00419D40: 00419D40
;;   Called from:
;;     00419CA7 (in fn00419910)
fn00419D40 proc
	push	esi
	mov	esi,ecx
	mov	ecx,[esi+230h]
	test	ecx,ecx
	jz	419D8Dh

l00419D4D:
	nop	dword ptr [eax]

l00419D50:
	mov	eax,[esi+22Ch]
	dec	eax
	add	ecx,eax
	mov	eax,[esi+228h]
	dec	eax
	and	ecx,eax
	mov	eax,[esi+224h]
	mov	ecx,[eax+ecx*4]
	call	402260h
	add	dword ptr [esi+230h],0FFh
	jnz	419D83h

l00419D79:
	mov	dword ptr [esi+22Ch],0h

l00419D83:
	mov	ecx,[esi+230h]
	test	ecx,ecx
	jnz	419D50h

l00419D8D:
	push	edi
	mov	edi,[esi+228h]
	test	edi,edi
	jz	419DC0h

l00419D98:
	nop	dword ptr [eax+eax+0h]

l00419DA0:
	mov	eax,[esi+224h]
	dec	edi
	mov	eax,[eax+edi*4]
	test	eax,eax
	jz	419DBCh

l00419DAE:
	push	80h
	push	eax
	call	42763Fh
	add	esp,8h

l00419DBC:
	test	edi,edi
	jnz	419DA0h

l00419DC0:
	mov	eax,[esi+224h]
	pop	edi
	test	eax,eax
	jz	419DFCh

l00419DCB:
	mov	ecx,[esi+228h]
	shl	ecx,2h
	cmp	ecx,1000h
	jc	419DF2h

l00419DDC:
	mov	edx,[eax-4h]
	add	ecx,23h
	sub	eax,edx
	add	eax,0FCh
	cmp	eax,1Fh
	ja	419EEEh

l00419DF0:
	mov	eax,edx

l00419DF2:
	push	ecx
	push	eax
	call	42763Fh
	add	esp,8h

l00419DFC:
	mov	dword ptr [esi+228h],0h
	mov	dword ptr [esi+224h],0h
	push	8h
	push	dword ptr [esi+220h]
	call	42763Fh
	add	esp,8h
	mov	dword ptr [esi+220h],0h
	lea	ecx,[esi+198h]
	call	403610h
	mov	ecx,[esi+194h]
	cmp	ecx,10h
	jc	419E6Fh

l00419E40:
	mov	eax,[esi+180h]
	inc	ecx
	cmp	ecx,1000h
	jc	419E65h

l00419E4F:
	mov	edx,[eax-4h]
	add	ecx,23h
	sub	eax,edx
	add	eax,0FCh
	cmp	eax,1Fh
	ja	419EEEh

l00419E63:
	mov	eax,edx

l00419E65:
	push	ecx
	push	eax
	call	42763Fh
	add	esp,8h

l00419E6F:
	mov	dword ptr [esi+190h],0h
	mov	dword ptr [esi+194h],0Fh
	mov	byte ptr [esi+180h],0h
	mov	ecx,[esi+17Ch]
	cmp	ecx,10h
	jc	419EC0h

l00419E95:
	mov	eax,[esi+168h]
	inc	ecx
	cmp	ecx,1000h
	jc	419EB6h

l00419EA4:
	mov	edx,[eax-4h]
	add	ecx,23h
	sub	eax,edx
	add	eax,0FCh
	cmp	eax,1Fh
	ja	419EEEh

l00419EB4:
	mov	eax,edx

l00419EB6:
	push	ecx
	push	eax
	call	42763Fh
	add	esp,8h

l00419EC0:
	mov	dword ptr [esi+178h],0h
	lea	ecx,[esi+0B8h]
	mov	dword ptr [esi+17Ch],0Fh
	mov	byte ptr [esi+168h],0h
	call	404F00h
	mov	ecx,esi
	pop	esi
	jmp	404E50h

l00419EEE:
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

;; fn00419F00: 00419F00
;;   Called from:
;;     00407BD5 (in fn00407B80)
;;     004199B5 (in fn00419910)
;;     00419EFF (in fn00419D40)
fn00419F00 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42F19Ch
	mov	eax,fs:[0000h]
	push	eax
	push	ecx
	push	esi
	push	edi
	mov	eax,[43A008h]
	xor	eax,ebp
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	edi,ecx
	mov	[ebp-10h],edi
	push	0h
	mov	dword ptr [edi+10h],0h
	mov	dword ptr [edi+14h],0Fh
	push	4317A9h
	mov	byte ptr [edi],0h
	call	402A70h
	lea	ecx,[edi+18h]
	mov	dword ptr [ebp-4h],0h
	push	0h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	4317A9h
	mov	byte ptr [ecx],0h
	call	402A70h
	lea	ecx,[edi+30h]
	mov	byte ptr [ebp-4h],1h
	push	0h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	4317A9h
	mov	byte ptr [ecx],0h
	call	402A70h
	lea	ecx,[edi+48h]
	mov	byte ptr [ebp-4h],2h
	push	0h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	4317A9h
	mov	byte ptr [ecx],0h
	call	402A70h
	mov	dword ptr [ebp-4h],3h
	lea	ecx,[edi+70h]
	mov	byte ptr [edi+68h],1h
	push	0h
	mov	dword ptr [edi+80h],0h
	mov	dword ptr [edi+84h],0Fh
	push	4317A9h
	mov	byte ptr [edi+70h],0h
	call	402A70h
	push	0h
	mov	byte ptr [ebp-4h],4h
	lea	ecx,[edi+70h]
	push	4317A9h
	mov	byte ptr [edi+68h],0h
	call	402A70h
	mov	eax,edi
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	mov	esp,ebp
	pop	ebp
	ret
0041A012       CC CC CC CC CC CC CC CC CC CC CC CC CC CC   ..............

;; fn0041A020: 0041A020
;;   Called from:
;;     00407ACD (in fn00407A70)
fn0041A020 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42F19Ch
	mov	eax,fs:[0000h]
	push	eax
	push	ecx
	push	esi
	push	edi
	mov	eax,[43A008h]
	xor	eax,ebp
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	edi,ecx
	mov	[ebp-10h],edi
	push	0h
	mov	dword ptr [edi+10h],0h
	mov	dword ptr [edi+14h],0Fh
	push	4317A9h
	mov	byte ptr [edi],0h
	call	402A70h
	lea	ecx,[edi+18h]
	mov	dword ptr [ebp-4h],0h
	push	0h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	4317A9h
	mov	byte ptr [ecx],0h
	call	402A70h
	lea	ecx,[edi+30h]
	mov	byte ptr [ebp-4h],1h
	push	0h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	4317A9h
	mov	byte ptr [ecx],0h
	call	402A70h
	lea	ecx,[edi+48h]
	mov	byte ptr [ebp-4h],2h
	push	0h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	4317A9h
	mov	byte ptr [ecx],0h
	call	402A70h
	mov	dword ptr [ebp-4h],3h
	lea	ecx,[edi+70h]
	mov	byte ptr [edi+68h],1h
	push	0h
	mov	dword ptr [edi+80h],0h
	mov	dword ptr [edi+84h],0Fh
	push	4317A9h
	mov	byte ptr [edi+70h],0h
	call	402A70h
	push	0h
	push	4317A9h
	lea	ecx,[edi+70h]
	mov	byte ptr [ebp-4h],4h
	call	402A70h
	push	0h
	push	4317A9h
	lea	ecx,[edi+70h]
	mov	byte ptr [edi+68h],0h
	call	402A70h
	mov	eax,[ebp+8h]
	mov	[edi+60h],eax
	mov	eax,edi
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	mov	esp,ebp
	pop	ebp
	ret	4h
0041A149                            CC CC CC CC CC CC CC          .......

;; fn0041A150: 0041A150
;;   Called from:
;;     00407B70 (in fn00407AE0)
fn0041A150 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42F20Ch
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,24h
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
	mov	[ebp-14h],edi
	mov	[ebp-18h],edi
	mov	dword ptr [ebp-4h],0h
	push	0h
	mov	dword ptr [edi+10h],0h
	mov	dword ptr [edi+14h],0Fh
	push	4317A9h
	mov	byte ptr [edi],0h
	call	402A70h
	lea	ecx,[edi+18h]
	mov	byte ptr [ebp-4h],1h
	push	0h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	4317A9h
	mov	byte ptr [ecx],0h
	call	402A70h
	lea	ecx,[edi+30h]
	mov	byte ptr [ebp-4h],2h
	push	0h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	4317A9h
	mov	byte ptr [ecx],0h
	call	402A70h
	lea	ecx,[edi+48h]
	mov	byte ptr [ebp-4h],3h
	push	0h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	4317A9h
	mov	byte ptr [ecx],0h
	call	402A70h
	mov	byte ptr [ebp-4h],4h
	lea	ecx,[edi+70h]
	mov	byte ptr [edi+68h],1h
	push	0h
	mov	dword ptr [edi+80h],0h
	mov	dword ptr [edi+84h],0Fh
	push	4317A9h
	mov	byte ptr [edi+70h],0h
	call	402A70h
	push	0h
	push	4317A9h
	lea	ecx,[edi+70h]
	mov	byte ptr [ebp-4h],5h
	call	402A70h
	lea	eax,[ebp+8h]
	push	eax
	lea	ecx,[ebp-30h]
	call	4028D0h
	mov	byte ptr [ebp-4h],6h
	mov	byte ptr [edi+68h],0h
	call	dword ptr [43129Ch]
	cmp	dword ptr [ebp-1Ch],10h
	lea	esi,[ebp-30h]
	mov	ebx,eax
	lea	eax,[ebp-14h]
	cmovnc	esi,[ebp-30h]

l0041A27F:
	push	10h
	push	eax
	push	esi
	mov	dword ptr [ebx],0h
	call	dword ptr [4311FCh]
	add	esp,0Ch
	cmp	esi,[ebp-14h]
	jnz	41A2A2h

l0041A297:
	push	4318ACh
	call	dword ptr [431134h]

l0041A2A2:
	cmp	dword ptr [ebx],22h
	jnz	41A2B2h

l0041A2A7:
	push	4318C4h
	call	dword ptr [43119Ch]

l0041A2B2:
	mov	edx,[ebp-1Ch]
	mov	[edi+60h],eax
	cmp	edx,10h
	jc	41A2EBh

l0041A2BD:
	mov	ecx,[ebp-30h]
	inc	edx
	mov	eax,ecx
	cmp	edx,1000h
	jc	41A2E1h

l0041A2CB:
	mov	ecx,[ecx-4h]
	add	edx,23h
	sub	eax,ecx
	add	eax,0FCh
	cmp	eax,1Fh
	jbe	41A2E1h

l0041A2DB:
	call	dword ptr [431290h]

l0041A2E1:
	push	edx
	push	ecx
	call	42763Fh
	add	esp,8h

l0041A2EB:
	mov	edx,[ebp+1Ch]
	cmp	edx,10h
	jc	41A321h

l0041A2F3:
	mov	ecx,[ebp+8h]
	inc	edx
	mov	eax,ecx
	cmp	edx,1000h
	jc	41A317h

l0041A301:
	mov	ecx,[ecx-4h]
	add	edx,23h
	sub	eax,ecx
	add	eax,0FCh
	cmp	eax,1Fh
	jbe	41A317h

l0041A311:
	call	dword ptr [431290h]

l0041A317:
	push	edx
	push	ecx
	call	42763Fh
	add	esp,8h

l0041A321:
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
	ret	18h
0041A341    CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC  ...............

;; fn0041A350: 0041A350
;;   Called from:
;;     0041AF66 (in fn0041AEF0)
fn0041A350 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42F293h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,0DCh
	mov	eax,[43A008h]
	xor	eax,ebp
	mov	[ebp-10h],eax
	push	ebx
	push	esi
	push	edi
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	eax,[ebp+24h]
	mov	edi,[ebp+8h]
	mov	[ebp-0E4h],eax
	mov	eax,[ebp+28h]
	mov	[ebp-0E0h],eax
	mov	dword ptr [ebp-0DCh],0h
	push	0A8h
	lea	eax,[ebp-0D4h]
	mov	dword ptr [ebp-4h],0h
	push	0h
	push	eax
	call	42D1C3h
	add	esp,0Ch
	mov	dword ptr [ebp-0D4h],432E38h
	lea	ecx,[ebp-74h]
	call	dword ptr [431108h]
	push	0h
	push	0h
	lea	eax,[ebp-0C4h]
	mov	byte ptr [ebp-4h],1h
	push	eax
	lea	ecx,[ebp-0D4h]
	mov	dword ptr [ebp-0DCh],1h
	call	dword ptr [431094h]
	mov	dword ptr [ebp-4h],2h
	mov	eax,[ebp-0D4h]
	mov	eax,[eax+4h]
	mov	dword ptr [ebp+eax-0D4h],432E44h
	mov	eax,[ebp-0D4h]
	mov	ecx,[eax+4h]
	lea	eax,[ecx-60h]
	mov	[ebp+ecx-0D8h],eax
	lea	eax,[ebp-0C4h]
	mov	ecx,eax
	mov	[ebp-0E8h],eax
	call	dword ptr [43111Ch]
	mov	byte ptr [ebp-4h],3h
	lea	eax,[ebp+0Ch]
	cmp	dword ptr [ebp+20h],10h
	lea	ecx,[ebp-0C4h]
	push	2h
	push	dword ptr [ebp+1Ch]
	cmovnc	eax,[ebp+0Ch]

l0041A44E:
	push	eax
	mov	dword ptr [ebp-0C4h],432440h
	call	411400h
	mov	dword ptr [ebp-18h],0h
	mov	dword ptr [ebp-14h],0Fh
	mov	byte ptr [ebp-28h],0h
	mov	byte ptr [ebp-4h],5h
	mov	eax,[ebp-0D4h]
	mov	eax,[eax+4h]
	test	byte ptr [ebp+eax-0C8h],1h
	jnz	41A58Ah

l0041A48B:
	nop	dword ptr [eax+eax+0h]

l0041A490:
	push	0h
	push	4317A9h
	lea	ecx,[ebp-28h]
	call	402A70h
	nop

l0041A4A0:
	lea	ecx,[ebp-0D4h]
	call	dword ptr [4310E0h]
	cmp	eax,20h
	jz	41A4C2h

l0041A4B1:
	lea	ecx,[ebp-0D4h]
	call	dword ptr [4310E0h]
	cmp	eax,9h
	jnz	41A4D0h

l0041A4C2:
	lea	ecx,[ebp-0D4h]
	call	dword ptr [4311BCh]
	jmp	41A4A0h

l0041A4D0:
	lea	eax,[ebp-2Ch]
	push	eax
	lea	ecx,[ebp-0D4h]
	call	dword ptr [4310D8h]
	mov	eax,[ebp-0D4h]
	mov	eax,[eax+4h]
	test	byte ptr [ebp+eax-0C8h],1h
	jnz	41A54Ch

l0041A4F3:
	mov	edx,[ebp-2Ch]
	movsx	eax,dl
	add	eax,0F7h
	cmp	eax,23h
	ja	41A50Fh

l0041A501:
	movzx	eax,byte ptr [eax+41A6E8h]
	jmp	dword ptr [41A6E0h+eax*4]

l0041A50F:
	mov	eax,[ebp-18h]
	mov	esi,[ebp-14h]
	cmp	eax,esi
	jnc	41A533h

l0041A519:
	lea	ecx,[eax+1h]
	cmp	esi,10h
	mov	[ebp-18h],ecx
	lea	ecx,[ebp-28h]
	cmovnc	ecx,[ebp-28h]

l0041A529:
	mov	[ecx+eax],dl
	mov	byte ptr [ecx+eax+1h],0h
	jmp	41A4D0h

l0041A533:
	push	edx
	mov	byte ptr [ebp-0DCh],0h
	push	dword ptr [ebp-0DCh]
	push	ecx
	lea	ecx,[ebp-28h]
	call	412FE0h
	jmp	41A4D0h

l0041A54C:
	cmp	dword ptr [ebp-18h],0h
	jz	41A573h

l0041A552:
	mov	eax,[edi+4h]
	lea	ecx,[ebp-28h]
	push	ecx
	cmp	[edi+8h],eax
	jz	41A56Bh

l0041A55E:
	mov	ecx,eax
	call	4028D0h
	add	dword ptr [edi+4h],18h
	jmp	41A573h

l0041A56B:
	push	eax
	mov	ecx,edi
	call	4032C0h

l0041A573:
	mov	eax,[ebp-0D4h]
	mov	eax,[eax+4h]
	test	byte ptr [ebp+eax-0C8h],1h
	jz	41A490h

l0041A58A:
	mov	ecx,[edi+4h]
	mov	eax,2AAAAAABh
	sub	ecx,[edi]
	imul	ecx
	sar	edx,2h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx

l0041A5A0:
	mov	ebx,1h
	mov	byte ptr [ebp-0D5h],0h
	cmp	eax,ebx
	jbe	41A5F7h

l0041A5B0:
	lea	esi,[ebx+17h]

l0041A5B3:
	push	dword ptr [ebp-0E0h]
	lea	eax,[ebp-0D5h]
	push	dword ptr [ebp-0E4h]
	push	eax
	mov	eax,[edi]
	add	eax,esi
	push	eax
	call	41A760h
	mov	ecx,[edi+4h]
	mov	eax,2AAAAAABh
	sub	ecx,[edi]
	inc	ebx
	imul	ecx
	add	esi,18h
	sar	edx,2h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx
	cmp	ebx,eax
	jc	41A5B3h

l0041A5EE:
	cmp	byte ptr [ebp-0D5h],0h
	jnz	41A5A0h

l0041A5F7:
	mov	edx,[ebp-14h]
	cmp	edx,10h
	jc	41A62Dh

l0041A5FF:
	mov	ecx,[ebp-28h]
	inc	edx
	mov	eax,ecx
	cmp	edx,1000h
	jc	41A623h

l0041A60D:
	mov	ecx,[ecx-4h]
	add	edx,23h
	sub	eax,ecx
	add	eax,0FCh
	cmp	eax,1Fh
	jbe	41A623h

l0041A61D:
	call	dword ptr [431290h]

l0041A623:
	push	edx
	push	ecx
	call	42763Fh
	add	esp,8h

l0041A62D:
	mov	eax,[ebp-0D4h]
	mov	eax,[eax+4h]
	mov	dword ptr [ebp+eax-0D4h],432E44h
	mov	eax,[ebp-0D4h]
	mov	ecx,[eax+4h]
	lea	eax,[ecx-60h]
	mov	[ebp+ecx-0D8h],eax
	lea	ecx,[ebp-0C4h]
	mov	dword ptr [ebp-0C4h],432440h
	call	4110B0h
	lea	ecx,[ebp-0C4h]
	call	dword ptr [4310ACh]
	lea	ecx,[ebp-0BCh]
	call	dword ptr [4310D4h]
	lea	ecx,[ebp-74h]
	call	dword ptr [4310A8h]
	mov	edx,[ebp+20h]
	cmp	edx,10h
	jc	41A6C0h

l0041A692:
	mov	ecx,[ebp+0Ch]
	inc	edx
	mov	eax,ecx
	cmp	edx,1000h
	jc	41A6B6h

l0041A6A0:
	mov	ecx,[ecx-4h]
	add	edx,23h
	sub	eax,ecx
	add	eax,0FCh
	cmp	eax,1Fh
	jbe	41A6B6h

l0041A6B0:
	call	dword ptr [431290h]

l0041A6B6:
	push	edx
	push	ecx
	call	42763Fh
	add	esp,8h

l0041A6C0:
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
	ret	24h
0041A6DE                                           66 90               f.
l0041A6E0	dd	0x0041A54C
l0041A6E4	dd	0x0041A50F
l0041A6E8	db	0x00
l0041A6E9	db	0x01
l0041A6EA	db	0x01
l0041A6EB	db	0x01
l0041A6EC	db	0x01
l0041A6ED	db	0x01
l0041A6EE	db	0x01
l0041A6EF	db	0x01
l0041A6F0	db	0x01
l0041A6F1	db	0x01
l0041A6F2	db	0x01
l0041A6F3	db	0x01
l0041A6F4	db	0x01
l0041A6F5	db	0x01
l0041A6F6	db	0x01
l0041A6F7	db	0x01
l0041A6F8	db	0x01
l0041A6F9	db	0x01
l0041A6FA	db	0x01
l0041A6FB	db	0x01
l0041A6FC	db	0x01
l0041A6FD	db	0x01
l0041A6FE	db	0x01
l0041A6FF	db	0x00
l0041A700	db	0x01
l0041A701	db	0x01
l0041A702	db	0x01
l0041A703	db	0x01
l0041A704	db	0x01
l0041A705	db	0x01
l0041A706	db	0x01
l0041A707	db	0x00
l0041A708	db	0x00
l0041A709	db	0x01
l0041A70A	db	0x01
l0041A70B	db	0x00
0041A70C                                     CC CC CC CC             ....
0041A710 8B 01 56 57 8D 79 60 8B 40 04 C7 44 38 A0 44 2E ..VW.y`.@..D8.D.
0041A720 43 00 8B 47 A0 8B 48 04 8D 41 A0 89 44 39 9C 8D C..G..H..A..D9..
0041A730 4F B0 C7 47 B0 40 24 43 00 E8 72 69 FF FF 8D 4F O..G.@$C..ri...O
0041A740 B0 FF 15 AC 10 43 00 8D 4F B8 FF 15 D4 10 43 00 .....C..O.....C.
0041A750 8B CF 5F 5E FF 25 A8 10 43 00 CC CC CC CC CC CC .._^.%..C.......

;; fn0041A760: 0041A760
;;   Called from:
;;     0041A5CB (in fn0041A350)
fn0041A760 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42F2E0h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,68h
	mov	eax,[43A008h]
	xor	eax,ebp
	mov	[ebp-10h],eax
	push	esi
	push	edi
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	eax,[ebp+0Ch]
	xorps	xmm0,xmm0
	mov	edx,[ebp+10h]
	mov	esi,[ebp+8h]
	mov	[ebp-48h],eax
	mov	eax,[ebp+14h]
	movq	qword ptr [ebp-34h],xmm0
	mov	dword ptr [ebp-2Ch],0h
	mov	[ebp-38h],edx
	mov	[ebp-50h],eax
	mov	dword ptr [ebp-34h],0h
	mov	dword ptr [ebp-30h],0h
	mov	dword ptr [ebp-2Ch],0h
	mov	dword ptr [ebp-4h],0h
	xor	eax,eax
	mov	edi,[esi+10h]
	add	edi,0FEh
	mov	[ebp-54h],eax
	test	edi,edi
	jle	41A969h

l0041A7DD:
	nop	dword ptr [eax]

l0041A7E0:
	cmp	dword ptr [esi+14h],10h
	mov	eax,esi
	jc	41A7EAh

l0041A7E8:
	mov	eax,[esi]

l0041A7EA:
	cmp	byte ptr [eax+edi],2Bh
	jnz	41A95Dh

l0041A7F4:
	mov	eax,[esi+10h]
	lea	ecx,[edi+1h]
	mov	dword ptr [ebp-18h],0h
	mov	dword ptr [ebp-14h],0Fh
	mov	byte ptr [ebp-28h],0h
	cmp	eax,ecx
	jc	41AE50h

l0041A814:
	sub	eax,ecx
	or	edx,0FFh
	cmp	eax,0FFh
	cmovc	edx,eax

l0041A81F:
	cmp	dword ptr [esi+14h],10h
	mov	eax,esi
	jc	41A829h

l0041A827:
	mov	eax,[esi]

l0041A829:
	add	eax,ecx
	lea	ecx,[ebp-28h]
	push	edx
	push	eax
	call	402A70h
	mov	byte ptr [ebp-4h],1h
	mov	eax,[ebp-30h]
	cmp	[ebp-2Ch],eax
	jz	41A868h

l0041A841:
	movups	xmm0,[ebp-28h]
	mov	dword ptr [eax+10h],0h
	mov	edx,0Fh
	mov	byte ptr [ebp-28h],0h
	movups	[eax],xmm0
	movq	xmm0,qword ptr [ebp-18h]
	movq	qword ptr [eax+10h],xmm0
	add	dword ptr [ebp-30h],18h
	jmp	41A878h

l0041A868:
	lea	ecx,[ebp-28h]
	push	ecx
	push	eax
	lea	ecx,[ebp-34h]
	call	4127A0h
	mov	edx,[ebp-14h]

l0041A878:
	mov	byte ptr [ebp-4h],0h
	cmp	edx,10h
	jc	41A8ADh

l0041A881:
	mov	ecx,[ebp-28h]
	inc	edx
	mov	eax,ecx
	cmp	edx,1000h
	jc	41A8A3h

l0041A88F:
	mov	ecx,[ecx-4h]
	add	edx,23h
	sub	eax,ecx
	add	eax,0FCh
	cmp	eax,1Fh
	ja	41AE0Dh

l0041A8A3:
	push	edx
	push	ecx
	call	42763Fh
	add	esp,8h

l0041A8AD:
	cmp	[esi+10h],edi
	mov	ecx,edi
	mov	dword ptr [ebp-18h],0h
	mov	eax,esi
	cmovc	ecx,[esi+10h]

l0041A8BF:
	cmp	dword ptr [esi+14h],10h
	mov	dword ptr [ebp-14h],0Fh
	mov	byte ptr [ebp-28h],0h
	jc	41A8D2h

l0041A8D0:
	mov	eax,[esi]

l0041A8D2:
	push	ecx
	push	eax
	lea	ecx,[ebp-28h]
	call	402A70h
	lea	eax,[ebp-28h]
	cmp	esi,eax
	jz	41A929h

l0041A8E3:
	mov	ecx,[esi+14h]
	cmp	ecx,10h
	jc	41A916h

l0041A8EB:
	mov	eax,[esi]
	inc	ecx
	cmp	ecx,1000h
	jc	41A90Ch

l0041A8F6:
	mov	edx,[eax-4h]
	add	ecx,23h
	sub	eax,edx
	add	eax,0FCh
	cmp	eax,1Fh
	ja	41AE0Dh

l0041A90A:
	mov	eax,edx

l0041A90C:
	push	ecx
	push	eax
	call	42763Fh
	add	esp,8h

l0041A916:
	movups	xmm0,[ebp-28h]
	movups	[esi],xmm0
	movq	xmm0,qword ptr [ebp-18h]
	movq	qword ptr [esi+10h],xmm0
	jmp	41A95Dh

l0041A929:
	mov	edx,[ebp-14h]
	cmp	edx,10h
	jc	41A95Dh

l0041A931:
	mov	ecx,[ebp-28h]
	inc	edx
	mov	eax,ecx
	cmp	edx,1000h
	jc	41A953h

l0041A93F:
	mov	ecx,[ecx-4h]
	add	edx,23h
	sub	eax,ecx
	add	eax,0FCh
	cmp	eax,1Fh
	ja	41AE0Dh

l0041A953:
	push	edx
	push	ecx
	call	42763Fh
	add	esp,8h

l0041A95D:
	dec	edi
	test	edi,edi
	jg	41A7E0h

l0041A966:
	mov	edx,[ebp-38h]

l0041A969:
	mov	ecx,[edx+4h]
	mov	eax,2AAAAAABh
	sub	ecx,[edx]
	imul	ecx
	mov	dword ptr [ebp-3Ch],0h
	sar	edx,3h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx
	jz	41AA95h

l0041A98C:
	mov	dword ptr [ebp-4Ch],0h

l0041A993:
	push	1h
	mov	byte ptr [ebp-4h],2h
	call	dword ptr [4311A8h]
	mov	edi,eax
	add	esp,4h
	mov	[ebp-70h],edi
	mov	byte ptr [ebp-4h],3h
	mov	ecx,[ebp-38h]
	mov	eax,[ecx]
	mov	ecx,[ecx+4h]
	sub	ecx,eax
	mov	eax,2AAAAAABh
	imul	ecx
	sar	edx,3h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx
	cmp	eax,[ebp-3Ch]
	jbe	41AE55h

l0041A9CF:
	mov	edx,[ebp-38h]
	mov	ecx,esi
	mov	eax,[ebp-4Ch]
	mov	edx,[edx]
	lea	edx,[edx+eax]
	lea	eax,[ebp-74h]
	push	eax
	call	403180h
	add	esp,4h
	mov	[ebp-41h],al
	mov	byte ptr [ebp-4h],4h
	test	edi,edi
	jz	41AA0Bh

l0041A9F3:
	mov	eax,[edi]
	mov	ecx,edi
	mov	eax,[eax+8h]
	call	eax
	mov	ecx,eax
	test	ecx,ecx
	jz	41AA08h

l0041AA02:
	mov	eax,[ecx]
	push	1h
	call	dword ptr [eax]

l0041AA08:
	mov	al,[ebp-41h]

l0041AA0B:
	mov	byte ptr [ebp-4h],0h
	test	al,al
	jnz	41AA41h

l0041AA13:
	mov	eax,[ebp-38h]
	mov	edi,[ebp-3Ch]
	add	dword ptr [ebp-4Ch],30h
	inc	edi
	mov	[ebp-3Ch],edi
	mov	ecx,[eax+4h]
	sub	ecx,[eax]
	mov	eax,2AAAAAABh
	imul	ecx
	sar	edx,3h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx
	cmp	edi,eax
	jc	41A993h

l0041AA3F:
	jmp	41AA95h

l0041AA41:
	mov	eax,[ebp-48h]
	mov	byte ptr [eax],1h
	mov	eax,[ebp-38h]
	mov	ecx,[eax+4h]
	mov	edi,[eax]
	sub	ecx,edi
	mov	eax,2AAAAAABh
	imul	ecx
	mov	ecx,[ebp-3Ch]
	sar	edx,3h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx
	cmp	eax,ecx
	jbe	41AE55h

l0041AA6D:
	lea	eax,[ecx+ecx*2]
	shl	eax,4h
	add	eax,18h
	add	eax,edi
	cmp	esi,eax
	jz	41ABC7h

l0041AA80:
	cmp	dword ptr [eax+14h],10h
	mov	ecx,eax
	jc	41AA8Ah

l0041AA88:
	mov	ecx,[eax]

l0041AA8A:
	push	dword ptr [eax+10h]
	push	ecx
	mov	ecx,esi
	call	402A70h

l0041AA95:
	mov	eax,[ebp-48h]
	cmp	byte ptr [eax],0h
	jnz	41ABC7h

l0041AAA1:
	mov	eax,[ebp-50h]
	xor	edi,edi
	mov	ecx,[eax+4h]
	sub	ecx,[eax]
	mov	eax,2AAAAAABh
	imul	ecx
	sar	edx,3h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx
	jz	41ABC7h

l0041AAC2:
	mov	[ebp-4Ch],edi
	nop	word ptr [eax+eax+0h]

l0041AAD0:
	push	1h
	mov	byte ptr [ebp-4h],5h
	call	dword ptr [4311A8h]
	add	esp,4h
	mov	[ebp-3Ch],eax
	mov	ecx,[ebp-50h]
	mov	byte ptr [ebp-4h],6h
	mov	eax,[ecx]
	mov	ecx,[ecx+4h]
	sub	ecx,eax
	mov	eax,2AAAAAABh
	imul	ecx
	sar	edx,3h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx
	cmp	eax,edi
	jbe	41AE55h

l0041AB09:
	mov	edx,[ebp-50h]
	mov	ecx,esi
	mov	eax,[ebp-4Ch]
	mov	edx,[edx]
	lea	edx,[edx+eax]
	lea	eax,[ebp-40h]
	push	eax
	call	403180h
	add	esp,4h
	mov	[ebp-41h],al
	mov	byte ptr [ebp-4h],7h
	mov	ecx,[ebp-3Ch]
	test	ecx,ecx
	jz	41AB43h

l0041AB30:
	mov	eax,[ecx]
	mov	eax,[eax+8h]
	call	eax
	mov	ecx,eax
	test	ecx,ecx
	jz	41AB43h

l0041AB3D:
	mov	eax,[ecx]
	push	1h
	call	dword ptr [eax]

l0041AB43:
	cmp	byte ptr [ebp-41h],0h
	mov	byte ptr [ebp-4h],0h
	jnz	41AB75h

l0041AB4D:
	mov	eax,[ebp-50h]
	inc	edi
	add	dword ptr [ebp-4Ch],30h
	mov	ecx,[eax+4h]
	sub	ecx,[eax]
	mov	eax,2AAAAAABh
	imul	ecx
	sar	edx,3h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx
	cmp	edi,eax
	jc	41AAD0h

l0041AB73:
	jmp	41ABC7h

l0041AB75:
	mov	eax,[ebp-48h]
	mov	ecx,[ebp-50h]
	mov	byte ptr [eax],1h
	mov	eax,[ecx]
	mov	ecx,[ecx+4h]
	sub	ecx,eax
	mov	eax,2AAAAAABh
	imul	ecx
	sar	edx,3h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx
	cmp	eax,edi
	jbe	41AE5Ah

l0041AB9E:
	mov	edx,[ebp-50h]
	lea	eax,[edi+edi*2]
	shl	eax,4h
	mov	ecx,[edx]
	add	ecx,18h
	add	eax,ecx
	cmp	esi,eax
	jz	41ABC7h

l0041ABB2:
	cmp	dword ptr [eax+14h],10h
	mov	ecx,eax
	jc	41ABBCh

l0041ABBA:
	mov	ecx,[eax]

l0041ABBC:
	push	dword ptr [eax+10h]
	push	ecx
	mov	ecx,esi
	call	402A70h

l0041ABC7:
	mov	ecx,[ebp-30h]
	mov	eax,2AAAAAABh
	sub	ecx,[ebp-34h]
	xor	edi,edi
	imul	ecx
	mov	[ebp-4Ch],edi
	sar	edx,2h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx
	jz	41ADC1h

l0041ABE9:
	nop	dword ptr [eax+0h]

l0041ABF0:
	test	edi,edi
	jnz	41AC38h

l0041ABF4:
	call	dword ptr [43129Ch]
	cmp	dword ptr [esi+14h],10h
	mov	edi,esi
	mov	[ebp-48h],eax
	jc	41AC07h

l0041AC05:
	mov	edi,[esi]

l0041AC07:
	mov	dword ptr [eax],0h
	lea	eax,[ebp-3Ch]
	push	0h
	push	eax
	push	edi
	call	dword ptr [4311FCh]
	add	esp,0Ch
	mov	[ebp-54h],eax
	cmp	edi,[ebp-3Ch]
	jz	41AE1Eh

l0041AC29:
	mov	eax,[ebp-48h]
	cmp	dword ptr [eax],22h
	jz	41AE13h

l0041AC35:
	mov	edi,[ebp-4Ch]

l0041AC38:
	mov	eax,[ebp-34h]
	lea	ecx,[edi+edi*2]
	lea	edi,[eax+ecx*8]
	call	dword ptr [43129Ch]
	cmp	dword ptr [edi+14h],10h
	mov	[ebp-48h],eax
	jc	41AC52h

l0041AC50:
	mov	edi,[edi]

l0041AC52:
	mov	dword ptr [eax],0h
	lea	eax,[ebp-38h]
	push	0h
	push	eax
	push	edi
	call	dword ptr [4311FCh]
	add	esp,0Ch
	mov	ecx,eax
	cmp	edi,[ebp-38h]
	jz	41AE1Eh

l0041AC73:
	mov	eax,[ebp-48h]
	cmp	dword ptr [eax],22h
	jz	41AE13h

l0041AC7F:
	mov	eax,[ebp-54h]
	lea	edi,[ebp-13h]
	add	eax,ecx
	mov	[ebp-54h],eax
	mov	ecx,eax
	jns	41ACC3h

l0041AC8E:
	neg	ecx
	mov	[ebp-48h],ecx

l0041AC93:
	mov	eax,0CCCCCCCDh
	dec	edi
	mul	ecx
	shr	edx,3h
	mov	al,dl
	mov	cl,dl
	shl	al,2h
	add	cl,al
	mov	eax,[ebp-48h]
	add	cl,cl
	sub	al,cl
	mov	ecx,edx
	add	al,30h
	mov	[edi],al
	mov	eax,edx
	mov	[ebp-48h],eax
	test	eax,eax
	jnz	41AC93h

l0041ACBD:
	dec	edi
	mov	byte ptr [edi],2Dh
	jmp	41ACF0h

l0041ACC3:
	mov	[ebp-48h],ecx

l0041ACC6:
	mov	eax,0CCCCCCCDh
	dec	edi
	mul	ecx
	shr	edx,3h
	mov	al,dl
	mov	cl,dl
	shl	al,2h
	add	cl,al
	mov	eax,[ebp-48h]
	add	cl,cl
	sub	al,cl
	mov	ecx,edx
	add	al,30h
	mov	[edi],al
	mov	eax,edx
	mov	[ebp-48h],eax
	test	eax,eax
	jnz	41ACC6h

l0041ACF0:
	lea	ecx,[ebp-13h]
	mov	dword ptr [ebp-5Ch],0h
	mov	byte ptr [ebp-6Ch],0h
	mov	eax,0Fh
	mov	[ebp-58h],eax
	cmp	edi,ecx
	jz	41AD1Bh

l0041AD0A:
	mov	eax,ecx
	lea	ecx,[ebp-6Ch]
	sub	eax,edi
	push	eax
	push	edi
	call	402A70h
	mov	eax,[ebp-58h]

l0041AD1B:
	lea	ecx,[ebp-6Ch]
	cmp	esi,ecx
	jz	41AD68h

l0041AD22:
	mov	ecx,[esi+14h]
	cmp	ecx,10h
	jc	41AD55h

l0041AD2A:
	mov	eax,[esi]
	inc	ecx
	cmp	ecx,1000h
	jc	41AD4Bh

l0041AD35:
	mov	edx,[eax-4h]
	add	ecx,23h
	sub	eax,edx
	add	eax,0FCh
	cmp	eax,1Fh
	ja	41AE0Dh

l0041AD49:
	mov	eax,edx

l0041AD4B:
	push	ecx
	push	eax
	call	42763Fh
	add	esp,8h

l0041AD55:
	movups	xmm0,[ebp-6Ch]
	movups	[esi],xmm0
	movq	xmm0,qword ptr [ebp-5Ch]
	movq	qword ptr [esi+10h],xmm0
	jmp	41AD9Bh

l0041AD68:
	cmp	eax,10h
	jc	41AD9Bh

l0041AD6D:
	mov	ecx,[ebp-6Ch]
	lea	edx,[eax+1h]
	mov	eax,ecx
	cmp	edx,1000h
	jc	41AD91h

l0041AD7D:
	mov	ecx,[ecx-4h]
	add	edx,23h
	sub	eax,ecx
	add	eax,0FCh
	cmp	eax,1Fh
	ja	41AE0Dh

l0041AD91:
	push	edx
	push	ecx
	call	42763Fh
	add	esp,8h

l0041AD9B:
	mov	ecx,[ebp-30h]
	mov	eax,2AAAAAABh
	sub	ecx,[ebp-34h]
	mov	edi,[ebp-4Ch]
	imul	ecx
	inc	edi
	sar	edx,2h
	mov	eax,edx
	mov	[ebp-4Ch],edi
	shr	eax,1Fh
	add	eax,edx
	cmp	edi,eax
	jc	41ABF0h

l0041ADC1:
	mov	ecx,[ebp-34h]
	test	ecx,ecx
	jz	41AE33h

l0041ADC8:
	mov	edx,[ebp-30h]
	push	ecx
	call	403510h
	mov	ecx,[ebp-2Ch]
	mov	eax,2AAAAAABh
	mov	esi,[ebp-34h]
	add	esp,4h
	sub	ecx,esi
	imul	ecx
	sar	edx,2h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx
	lea	ecx,[eax+eax*2]
	mov	eax,esi
	shl	ecx,3h
	cmp	ecx,1000h
	jc	41AE29h

l0041ADFD:
	mov	esi,[esi-4h]
	add	ecx,23h
	sub	eax,esi
	add	eax,0FCh
	cmp	eax,1Fh
	jbe	41AE29h

l0041AE0D:
	call	dword ptr [431290h]

l0041AE13:
	push	4318C4h
	call	dword ptr [43119Ch]

l0041AE1E:
	push	4318ACh
	call	dword ptr [431134h]

l0041AE29:
	push	ecx
	push	esi
	call	42763Fh
	add	esp,8h

l0041AE33:
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	mov	ecx,[ebp-10h]
	xor	ecx,ebp
	call	427500h
	mov	esp,ebp
	pop	ebp
	ret	10h

l0041AE50:
	call	4113B0h

l0041AE55:
	call	4029E0h

l0041AE5A:
	call	4029E0h
	int	3h

;; fn0041AE60: 0041AE60
;;   Called from:
;;     0040CEEC (in fn0040BE00)
;;     0040DB7F (in fn0040BE00)
;;     0040DBA3 (in fn0040BE00)
;;     0040DBCC (in fn0040BE00)
;;     0040DBEB (in fn0040BE00)
;;     0040DC04 (in fn0040BE00)
;;     0040DC34 (in fn0040BE00)
;;     0040DC90 (in fn0040BE00)
;;     0040DCBC (in fn0040BE00)
;;     0040DCD8 (in fn0040BE00)
fn0041AE60 proc
	push	ebp
	mov	ebp,esp
	push	esi
	mov	esi,ecx
	push	0h
	push	4317A9h
	lea	ecx,[esi+70h]
	mov	byte ptr [esi+68h],0h
	call	402A70h
	mov	eax,[ebp+8h]
	mov	[esi+60h],eax
	pop	esi
	pop	ebp
	ret	4h
0041AE84             CC CC CC CC CC CC CC CC CC CC CC CC     ............

;; fn0041AE90: 0041AE90
;;   Called from:
;;     0040552E (in fn00404FB0)
fn0041AE90 proc
	push	ebp
	mov	ebp,esp
	push	esi
	mov	esi,ecx
	mov	eax,[esi+6Ch]
	cmp	eax,3h
	ja	41AEAEh

l0041AE9E:
	mov	eax,[ebp+8h]
	and	eax,3FFFFFCh
	add	[esi+60h],eax
	pop	esi
	pop	ebp
	ret	4h

l0041AEAE:
	add	eax,0FCh
	cmp	eax,3h
	ja	41AEDCh

l0041AEB6:
	mov	edx,[ebp+8h]
	push	edi
	movzx	edi,dx
	add	edi,[esi+60h]
	mov	[esi+60h],edi
	test	edx,edx
	jns	41AEDBh

l0041AEC7:
	mov	edx,15h
	call	427210h
	call	42D911h
	xor	eax,edi
	mov	[esi+60h],eax

l0041AEDB:
	pop	edi

l0041AEDC:
	pop	esi
	pop	ebp
	ret	4h
0041AEE1    CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC  ...............

;; fn0041AEF0: 0041AEF0
;;   Called from:
;;     004074FE (in fn00404FB0)
;;     0040BFCE (in fn0040BE00)
fn0041AEF0 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42F470h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,30h
	mov	eax,[43A008h]
	xor	eax,ebp
	mov	[ebp-10h],eax
	push	ebx
	push	esi
	push	edi
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	esi,ecx
	mov	edx,[ebp+20h]
	mov	eax,[ebp+24h]
	mov	dword ptr [ebp-4h],0h
	xorps	xmm0,xmm0
	movq	qword ptr [ebp-1Ch],xmm0
	mov	dword ptr [ebp-14h],0h
	mov	dword ptr [ebp-1Ch],0h
	mov	dword ptr [ebp-18h],0h
	mov	dword ptr [ebp-14h],0h
	push	eax
	push	edx
	sub	esp,18h
	mov	byte ptr [ebp-4h],1h
	lea	eax,[ebp+8h]
	mov	ecx,esp
	push	eax
	call	4028D0h
	lea	eax,[ebp-1Ch]
	push	eax
	call	41A350h
	push	0h
	push	4317A9h
	lea	ecx,[esi+70h]
	call	402A70h
	mov	ecx,[ebp-18h]
	mov	eax,2AAAAAABh
	mov	edi,[ebp-1Ch]
	sub	ecx,edi
	imul	ecx
	mov	dword ptr [esi+64h],0h
	sar	edx,2h
	mov	eax,edx
	mov	dword ptr [esi+60h],0FFFFFFFFh
	shr	eax,1Fh
	add	eax,edx
	jz	41C0ACh

l0041AFA7:
	cmp	dword ptr [edi+10h],0h
	jbe	41C17Dh

l0041AFB1:
	cmp	dword ptr [edi+14h],10h
	jc	41AFB9h

l0041AFB7:
	mov	edi,[edi]

l0041AFB9:
	movsx	eax,byte ptr [edi]
	add	eax,0BFh
	cmp	eax,37h
	ja	41C0ACh

l0041AFC8:
	movzx	eax,byte ptr [eax+41C1B8h]
	jmp	dword ptr [41C184h+eax*4]

l0041AFD6:
	push	1h
	mov	byte ptr [ebp-4h],2h
	call	dword ptr [4311A8h]
	add	esp,4h
	mov	[ebp-20h],eax
	push	4h
	push	0h
	lea	eax,[ebp-3Ch]
	mov	byte ptr [ebp-4h],3h
	mov	ecx,[ebp-1Ch]
	push	eax
	call	40F7F0h
	lea	ecx,[ebp-24h]
	mov	byte ptr [ebp-4h],4h
	push	ecx
	mov	edx,431D24h
	mov	ecx,eax
	call	411F00h
	mov	byte ptr [ebp-4h],3h
	add	esp,4h
	mov	edx,[ebp-28h]
	mov	bl,al
	cmp	edx,10h
	jc	41B04Fh

l0041B021:
	mov	ecx,[ebp-3Ch]
	inc	edx
	mov	eax,ecx
	cmp	edx,1000h
	jc	41B045h

l0041B02F:
	mov	ecx,[ecx-4h]
	add	edx,23h
	sub	eax,ecx
	add	eax,0FCh
	cmp	eax,1Fh
	jbe	41B045h

l0041B03F:
	call	dword ptr [431290h]

l0041B045:
	push	edx
	push	ecx
	call	42763Fh
	add	esp,8h

l0041B04F:
	lea	ecx,[ebp-24h]
	mov	dword ptr [ebp-2Ch],0h
	mov	dword ptr [ebp-28h],0Fh
	mov	byte ptr [ebp-3Ch],0h
	mov	byte ptr [ebp-4h],1h
	call	401470h
	lea	eax,[ebp-1Ch]
	mov	ecx,esi
	push	eax
	test	bl,bl
	jz	41B081h

l0041B077:
	call	41C3B0h
	jmp	41C0ACh

l0041B081:
	call	41CC60h
	jmp	41C0ACh

l0041B08B:
	mov	byte ptr [ebp-4h],5h
	mov	edi,[4311A8h]
	push	1h
	call	edi
	add	esp,4h
	mov	[ebp-20h],eax
	push	4h
	push	0h
	lea	eax,[ebp-3Ch]
	mov	byte ptr [ebp-4h],6h
	mov	ecx,[ebp-1Ch]
	push	eax
	call	40F7F0h
	lea	ecx,[ebp-24h]
	mov	byte ptr [ebp-4h],7h
	push	ecx
	mov	edx,4326B4h
	mov	ecx,eax
	call	411F00h
	mov	byte ptr [ebp-4h],6h
	add	esp,4h
	mov	edx,[ebp-28h]
	mov	bl,al
	cmp	edx,10h
	jc	41B106h

l0041B0D8:
	mov	ecx,[ebp-3Ch]
	inc	edx
	mov	eax,ecx
	cmp	edx,1000h
	jc	41B0FCh

l0041B0E6:
	mov	ecx,[ecx-4h]
	add	edx,23h
	sub	eax,ecx
	add	eax,0FCh
	cmp	eax,1Fh
	jbe	41B0FCh

l0041B0F6:
	call	dword ptr [431290h]

l0041B0FC:
	push	edx
	push	ecx
	call	42763Fh
	add	esp,8h

l0041B106:
	lea	ecx,[ebp-24h]
	mov	dword ptr [ebp-2Ch],0h
	mov	dword ptr [ebp-28h],0Fh
	mov	byte ptr [ebp-3Ch],0h
	mov	byte ptr [ebp-4h],1h
	call	401470h
	test	bl,bl
	jnz	41C0A1h

l0041B12C:
	push	1h
	mov	byte ptr [ebp-4h],8h
	call	edi
	add	esp,4h
	mov	[ebp-20h],eax
	push	3h
	push	0h
	lea	eax,[ebp-3Ch]
	mov	byte ptr [ebp-4h],9h
	mov	ecx,[ebp-1Ch]
	push	eax
	call	40F7F0h
	lea	ecx,[ebp-24h]
	mov	byte ptr [ebp-4h],0Ah
	push	ecx
	mov	edx,4326BCh
	mov	ecx,eax
	call	411F00h
	mov	byte ptr [ebp-4h],9h
	add	esp,4h
	mov	edx,[ebp-28h]
	mov	bl,al
	cmp	edx,10h
	jc	41B1A1h

l0041B173:
	mov	ecx,[ebp-3Ch]
	inc	edx
	mov	eax,ecx
	cmp	edx,1000h
	jc	41B197h

l0041B181:
	mov	ecx,[ecx-4h]
	add	edx,23h
	sub	eax,ecx
	add	eax,0FCh
	cmp	eax,1Fh
	jbe	41B197h

l0041B191:
	call	dword ptr [431290h]

l0041B197:
	push	edx
	push	ecx
	call	42763Fh
	add	esp,8h

l0041B1A1:
	lea	ecx,[ebp-24h]
	mov	dword ptr [ebp-2Ch],0h
	mov	dword ptr [ebp-28h],0Fh
	mov	byte ptr [ebp-3Ch],0h
	mov	byte ptr [ebp-4h],1h
	call	401470h
	lea	eax,[ebp-1Ch]
	mov	ecx,esi
	push	eax
	test	bl,bl
	jz	41B1D3h

l0041B1C9:
	call	41DAF0h
	jmp	41C0ACh

l0041B1D3:
	call	41D540h
	jmp	41C0ACh

l0041B1DD:
	lea	eax,[ebp-1Ch]
	mov	ecx,esi
	push	eax
	call	4262A0h
	jmp	41C0ACh

l0041B1ED:
	mov	byte ptr [ebp-4h],0Bh
	mov	edi,[4311A8h]
	push	1h
	call	edi
	add	esp,4h
	mov	[ebp-20h],eax
	push	2h
	push	0h
	lea	eax,[ebp-3Ch]
	mov	byte ptr [ebp-4h],0Ch
	mov	ecx,[ebp-1Ch]
	push	eax
	call	40F7F0h
	lea	ecx,[ebp-24h]
	mov	byte ptr [ebp-4h],0Dh
	push	ecx
	mov	edx,4326C0h
	mov	ecx,eax
	call	411F00h
	mov	byte ptr [ebp-4h],0Ch
	add	esp,4h
	mov	edx,[ebp-28h]
	mov	bl,al
	cmp	edx,10h
	jc	41B268h

l0041B23A:
	mov	ecx,[ebp-3Ch]
	inc	edx
	mov	eax,ecx
	cmp	edx,1000h
	jc	41B25Eh

l0041B248:
	mov	ecx,[ecx-4h]
	add	edx,23h
	sub	eax,ecx
	add	eax,0FCh
	cmp	eax,1Fh
	jbe	41B25Eh

l0041B258:
	call	dword ptr [431290h]

l0041B25E:
	push	edx
	push	ecx
	call	42763Fh
	add	esp,8h

l0041B268:
	lea	ecx,[ebp-24h]
	mov	dword ptr [ebp-2Ch],0h
	mov	dword ptr [ebp-28h],0Fh
	mov	byte ptr [ebp-3Ch],0h
	mov	byte ptr [ebp-4h],1h
	call	401470h
	test	bl,bl
	jz	41B568h

l0041B28E:
	push	1h
	mov	byte ptr [ebp-4h],0Eh
	call	edi
	add	esp,4h
	mov	[ebp-20h],eax
	push	6h
	push	2h
	lea	eax,[ebp-3Ch]
	mov	byte ptr [ebp-4h],0Fh
	mov	ecx,[ebp-1Ch]
	push	eax
	call	40F7F0h
	lea	ecx,[ebp-24h]
	mov	byte ptr [ebp-4h],10h
	push	ecx
	mov	edx,4326C4h
	mov	ecx,eax
	call	411F00h
	mov	byte ptr [ebp-4h],0Fh
	add	esp,4h
	mov	edx,[ebp-28h]
	mov	bl,al
	cmp	edx,10h
	jc	41B303h

l0041B2D5:
	mov	ecx,[ebp-3Ch]
	inc	edx
	mov	eax,ecx
	cmp	edx,1000h
	jc	41B2F9h

l0041B2E3:
	mov	ecx,[ecx-4h]
	add	edx,23h
	sub	eax,ecx
	add	eax,0FCh
	cmp	eax,1Fh
	jbe	41B2F9h

l0041B2F3:
	call	dword ptr [431290h]

l0041B2F9:
	push	edx
	push	ecx
	call	42763Fh
	add	esp,8h

l0041B303:
	lea	ecx,[ebp-24h]
	mov	dword ptr [ebp-2Ch],0h
	mov	dword ptr [ebp-28h],0Fh
	mov	byte ptr [ebp-3Ch],0h
	mov	byte ptr [ebp-4h],1h
	call	401470h
	test	bl,bl
	jz	41B37Eh

l0041B325:
	mov	edi,[ebp-1Ch]
	add	edi,18h
	call	dword ptr [43129Ch]
	cmp	dword ptr [edi+14h],10h
	mov	ebx,eax
	jc	41B33Bh

l0041B339:
	mov	edi,[edi]

l0041B33B:
	push	0h
	lea	eax,[ebp-20h]
	mov	dword ptr [ebx],0h
	push	eax
	push	edi
	call	dword ptr [4311FCh]
	add	esp,0Ch
	cmp	edi,[ebp-20h]
	jnz	41B361h

l0041B356:
	push	4318ACh
	call	dword ptr [431134h]

l0041B361:
	cmp	dword ptr [ebx],22h
	jnz	41B371h

l0041B366:
	push	4318C4h
	call	dword ptr [43119Ch]

l0041B371:
	and	eax,0FFFFFFh
	mov	[esi+60h],eax
	jmp	41C0ACh

l0041B37E:
	push	1h
	mov	byte ptr [ebp-4h],11h
	call	edi
	add	esp,4h
	mov	[ebp-20h],eax
	push	6h
	push	2h
	lea	eax,[ebp-3Ch]
	mov	byte ptr [ebp-4h],12h
	mov	ecx,[ebp-1Ch]
	push	eax
	call	40F7F0h
	lea	ecx,[ebp-24h]
	mov	byte ptr [ebp-4h],13h
	push	ecx
	mov	edx,4326CCh
	mov	ecx,eax
	call	411F00h
	mov	byte ptr [ebp-4h],12h
	add	esp,4h
	mov	edx,[ebp-28h]
	mov	bl,al
	cmp	edx,10h
	jc	41B3F3h

l0041B3C5:
	mov	ecx,[ebp-3Ch]
	inc	edx
	mov	eax,ecx
	cmp	edx,1000h
	jc	41B3E9h

l0041B3D3:
	mov	ecx,[ecx-4h]
	add	edx,23h
	sub	eax,ecx
	add	eax,0FCh
	cmp	eax,1Fh
	jbe	41B3E9h

l0041B3E3:
	call	dword ptr [431290h]

l0041B3E9:
	push	edx
	push	ecx
	call	42763Fh
	add	esp,8h

l0041B3F3:
	lea	ecx,[ebp-24h]
	mov	dword ptr [ebp-2Ch],0h
	mov	dword ptr [ebp-28h],0Fh
	mov	byte ptr [ebp-3Ch],0h
	mov	byte ptr [ebp-4h],1h
	call	401470h
	test	bl,bl
	jz	41B473h

l0041B415:
	mov	edi,[ebp-1Ch]
	add	edi,18h
	call	dword ptr [43129Ch]
	cmp	dword ptr [edi+14h],10h
	mov	ebx,eax
	jc	41B42Bh

l0041B429:
	mov	edi,[edi]

l0041B42B:
	push	0h
	lea	eax,[ebp-20h]
	mov	dword ptr [ebx],0h
	push	eax
	push	edi
	call	dword ptr [4311FCh]
	add	esp,0Ch
	cmp	edi,[ebp-20h]
	jnz	41B451h

l0041B446:
	push	4318ACh
	call	dword ptr [431134h]

l0041B451:
	cmp	dword ptr [ebx],22h
	jnz	41B461h

l0041B456:
	push	4318C4h
	call	dword ptr [43119Ch]

l0041B461:
	and	eax,0FFFFFFh
	add	eax,1000000h
	mov	[esi+60h],eax
	jmp	41C0ACh

l0041B473:
	push	1h
	mov	byte ptr [ebp-4h],14h
	call	edi
	add	esp,4h
	mov	[ebp-20h],eax
	push	4h
	push	2h
	lea	eax,[ebp-3Ch]
	mov	byte ptr [ebp-4h],15h
	mov	ecx,[ebp-1Ch]
	push	eax
	call	40F7F0h
	lea	ecx,[ebp-24h]
	mov	byte ptr [ebp-4h],16h
	push	ecx
	mov	edx,4326D4h
	mov	ecx,eax
	call	411F00h
	mov	byte ptr [ebp-4h],15h
	add	esp,4h
	mov	edx,[ebp-28h]
	mov	bl,al
	cmp	edx,10h
	jc	41B4E8h

l0041B4BA:
	mov	ecx,[ebp-3Ch]
	inc	edx
	mov	eax,ecx
	cmp	edx,1000h
	jc	41B4DEh

l0041B4C8:
	mov	ecx,[ecx-4h]
	add	edx,23h
	sub	eax,ecx
	add	eax,0FCh
	cmp	eax,1Fh
	jbe	41B4DEh

l0041B4D8:
	call	dword ptr [431290h]

l0041B4DE:
	push	edx
	push	ecx
	call	42763Fh
	add	esp,8h

l0041B4E8:
	lea	ecx,[ebp-24h]
	mov	dword ptr [ebp-2Ch],0h
	mov	dword ptr [ebp-28h],0Fh
	mov	byte ptr [ebp-3Ch],0h
	mov	byte ptr [ebp-4h],1h
	call	401470h
	test	bl,bl
	jz	41B568h

l0041B50A:
	mov	edi,[ebp-1Ch]
	add	edi,18h
	call	dword ptr [43129Ch]
	cmp	dword ptr [edi+14h],10h
	mov	ebx,eax
	jc	41B520h

l0041B51E:
	mov	edi,[edi]

l0041B520:
	push	0h
	lea	eax,[ebp-20h]
	mov	dword ptr [ebx],0h
	push	eax
	push	edi
	call	dword ptr [4311FCh]
	add	esp,0Ch
	cmp	edi,[ebp-20h]
	jnz	41B546h

l0041B53B:
	push	4318ACh
	call	dword ptr [431134h]

l0041B546:
	cmp	dword ptr [ebx],22h
	jnz	41B556h

l0041B54B:
	push	4318C4h
	call	dword ptr [43119Ch]

l0041B556:
	and	eax,0FFFFFFh
	add	eax,2000000h
	mov	[esi+60h],eax
	jmp	41C0ACh

l0041B568:
	lea	eax,[ebp-1Ch]
	mov	ecx,esi
	push	eax
	call	41ED20h
	jmp	41C0ACh

l0041B578:
	mov	byte ptr [ebp-4h],17h
	mov	edi,[4311A8h]
	push	1h
	call	edi
	add	esp,4h
	mov	[ebp-20h],eax
	push	2h
	push	0h
	lea	eax,[ebp-3Ch]
	mov	byte ptr [ebp-4h],18h
	mov	ecx,[ebp-1Ch]
	push	eax
	call	40F7F0h
	lea	ecx,[ebp-24h]
	mov	byte ptr [ebp-4h],19h
	push	ecx
	mov	edx,4326DCh
	mov	ecx,eax
	call	411F00h
	mov	byte ptr [ebp-4h],18h
	add	esp,4h
	mov	edx,[ebp-28h]
	mov	bl,al
	cmp	edx,10h
	jc	41B5F3h

l0041B5C5:
	mov	ecx,[ebp-3Ch]
	inc	edx
	mov	eax,ecx
	cmp	edx,1000h
	jc	41B5E9h

l0041B5D3:
	mov	ecx,[ecx-4h]
	add	edx,23h
	sub	eax,ecx
	add	eax,0FCh
	cmp	eax,1Fh
	jbe	41B5E9h

l0041B5E3:
	call	dword ptr [431290h]

l0041B5E9:
	push	edx
	push	ecx
	call	42763Fh
	add	esp,8h

l0041B5F3:
	lea	ecx,[ebp-24h]
	mov	dword ptr [ebp-2Ch],0h
	mov	dword ptr [ebp-28h],0Fh
	mov	byte ptr [ebp-3Ch],0h
	mov	byte ptr [ebp-4h],1h
	call	401470h
	test	bl,bl
	jnz	41C0A1h

l0041B619:
	push	1h
	mov	byte ptr [ebp-4h],1Ah
	call	edi
	add	esp,4h
	mov	[ebp-20h],eax
	push	2h
	push	0h
	lea	eax,[ebp-3Ch]
	mov	byte ptr [ebp-4h],1Bh
	mov	ecx,[ebp-1Ch]
	push	eax
	call	40F7F0h
	lea	ecx,[ebp-24h]
	mov	byte ptr [ebp-4h],1Ch
	push	ecx
	mov	edx,4326E0h
	mov	ecx,eax
	call	411F00h
	mov	byte ptr [ebp-4h],1Bh
	add	esp,4h
	mov	edx,[ebp-28h]
	mov	bl,al
	cmp	edx,10h
	jc	41B68Eh

l0041B660:
	mov	ecx,[ebp-3Ch]
	inc	edx
	mov	eax,ecx
	cmp	edx,1000h
	jc	41B684h

l0041B66E:
	mov	ecx,[ecx-4h]
	add	edx,23h
	sub	eax,ecx
	add	eax,0FCh
	cmp	eax,1Fh
	jbe	41B684h

l0041B67E:
	call	dword ptr [431290h]

l0041B684:
	push	edx
	push	ecx
	call	42763Fh
	add	esp,8h

l0041B68E:
	lea	ecx,[ebp-24h]
	mov	dword ptr [ebp-2Ch],0h
	mov	dword ptr [ebp-28h],0Fh
	mov	byte ptr [ebp-3Ch],0h
	mov	byte ptr [ebp-4h],1h
	call	401470h
	test	bl,bl
	jz	41B997h

l0041B6B4:
	push	1h
	mov	byte ptr [ebp-4h],1Dh
	call	edi
	add	esp,4h
	mov	[ebp-20h],eax
	push	6h
	push	2h
	lea	eax,[ebp-3Ch]
	mov	byte ptr [ebp-4h],1Eh
	mov	ecx,[ebp-1Ch]
	push	eax
	call	40F7F0h
	lea	ecx,[ebp-24h]
	mov	byte ptr [ebp-4h],1Fh
	push	ecx
	mov	edx,4326C4h
	mov	ecx,eax
	call	411F00h
	mov	byte ptr [ebp-4h],1Eh
	add	esp,4h
	mov	edx,[ebp-28h]
	mov	bl,al
	cmp	edx,10h
	jc	41B729h

l0041B6FB:
	mov	ecx,[ebp-3Ch]
	inc	edx
	mov	eax,ecx
	cmp	edx,1000h
	jc	41B71Fh

l0041B709:
	mov	ecx,[ecx-4h]
	add	edx,23h
	sub	eax,ecx
	add	eax,0FCh
	cmp	eax,1Fh
	jbe	41B71Fh

l0041B719:
	call	dword ptr [431290h]

l0041B71F:
	push	edx
	push	ecx
	call	42763Fh
	add	esp,8h

l0041B729:
	lea	ecx,[ebp-24h]
	mov	dword ptr [ebp-2Ch],0h
	mov	dword ptr [ebp-28h],0Fh
	mov	byte ptr [ebp-3Ch],0h
	mov	byte ptr [ebp-4h],1h
	call	401470h
	test	bl,bl
	jz	41B7A9h

l0041B74B:
	mov	edi,[ebp-1Ch]
	add	edi,18h
	call	dword ptr [43129Ch]
	cmp	dword ptr [edi+14h],10h
	mov	ebx,eax
	jc	41B761h

l0041B75F:
	mov	edi,[edi]

l0041B761:
	push	0h
	lea	eax,[ebp-20h]
	mov	dword ptr [ebx],0h
	push	eax
	push	edi
	call	dword ptr [4311FCh]
	add	esp,0Ch
	cmp	edi,[ebp-20h]
	jnz	41B787h

l0041B77C:
	push	4318ACh
	call	dword ptr [431134h]

l0041B787:
	cmp	dword ptr [ebx],22h
	jnz	41B797h

l0041B78C:
	push	4318C4h
	call	dword ptr [43119Ch]

l0041B797:
	and	eax,0FFFFFFh
	add	eax,10000000h
	mov	[esi+60h],eax
	jmp	41C0ACh

l0041B7A9:
	push	1h
	mov	byte ptr [ebp-4h],20h
	call	edi
	add	esp,4h
	mov	[ebp-20h],eax
	push	6h
	push	2h
	lea	eax,[ebp-3Ch]
	mov	byte ptr [ebp-4h],21h
	mov	ecx,[ebp-1Ch]
	push	eax
	call	40F7F0h
	lea	ecx,[ebp-24h]
	mov	byte ptr [ebp-4h],22h
	push	ecx
	mov	edx,4326CCh
	mov	ecx,eax
	call	411F00h
	mov	byte ptr [ebp-4h],21h
	add	esp,4h
	mov	edx,[ebp-28h]
	mov	bl,al
	cmp	edx,10h
	jc	41B81Eh

l0041B7F0:
	mov	ecx,[ebp-3Ch]
	inc	edx
	mov	eax,ecx
	cmp	edx,1000h
	jc	41B814h

l0041B7FE:
	mov	ecx,[ecx-4h]
	add	edx,23h
	sub	eax,ecx
	add	eax,0FCh
	cmp	eax,1Fh
	jbe	41B814h

l0041B80E:
	call	dword ptr [431290h]

l0041B814:
	push	edx
	push	ecx
	call	42763Fh
	add	esp,8h

l0041B81E:
	lea	ecx,[ebp-24h]
	mov	dword ptr [ebp-2Ch],0h
	mov	dword ptr [ebp-28h],0Fh
	mov	byte ptr [ebp-3Ch],0h
	mov	byte ptr [ebp-4h],1h
	call	401470h
	test	bl,bl
	jz	41B89Eh

l0041B840:
	mov	edi,[ebp-1Ch]
	add	edi,18h
	call	dword ptr [43129Ch]
	cmp	dword ptr [edi+14h],10h
	mov	ebx,eax
	jc	41B856h

l0041B854:
	mov	edi,[edi]

l0041B856:
	push	0h
	lea	eax,[ebp-20h]
	mov	dword ptr [ebx],0h
	push	eax
	push	edi
	call	dword ptr [4311FCh]
	add	esp,0Ch
	cmp	edi,[ebp-20h]
	jnz	41B87Ch

l0041B871:
	push	4318ACh
	call	dword ptr [431134h]

l0041B87C:
	cmp	dword ptr [ebx],22h
	jnz	41B88Ch

l0041B881:
	push	4318C4h
	call	dword ptr [43119Ch]

l0041B88C:
	and	eax,0FFFFFFh
	add	eax,11000000h
	mov	[esi+60h],eax
	jmp	41C0ACh

l0041B89E:
	push	1h
	mov	byte ptr [ebp-4h],23h
	call	edi
	add	esp,4h
	mov	[ebp-20h],eax
	push	4h
	push	2h
	lea	eax,[ebp-3Ch]
	mov	byte ptr [ebp-4h],24h
	mov	ecx,[ebp-1Ch]
	push	eax
	call	40F7F0h
	lea	ecx,[ebp-24h]
	mov	byte ptr [ebp-4h],25h
	push	ecx
	mov	edx,4326D4h
	mov	ecx,eax
	call	411F00h
	mov	byte ptr [ebp-4h],24h
	add	esp,4h
	mov	edx,[ebp-28h]
	mov	bl,al
	cmp	edx,10h
	jc	41B913h

l0041B8E5:
	mov	ecx,[ebp-3Ch]
	inc	edx
	mov	eax,ecx
	cmp	edx,1000h
	jc	41B909h

l0041B8F3:
	mov	ecx,[ecx-4h]
	add	edx,23h
	sub	eax,ecx
	add	eax,0FCh
	cmp	eax,1Fh
	jbe	41B909h

l0041B903:
	call	dword ptr [431290h]

l0041B909:
	push	edx
	push	ecx
	call	42763Fh
	add	esp,8h

l0041B913:
	lea	ecx,[ebp-24h]
	mov	dword ptr [ebp-2Ch],0h
	mov	dword ptr [ebp-28h],0Fh
	mov	byte ptr [ebp-3Ch],0h
	mov	byte ptr [ebp-4h],1h
	call	401470h
	test	bl,bl
	jz	41C0ACh

l0041B939:
	mov	edi,[ebp-1Ch]
	add	edi,18h
	call	dword ptr [43129Ch]
	cmp	dword ptr [edi+14h],10h
	mov	ebx,eax
	jc	41B94Fh

l0041B94D:
	mov	edi,[edi]

l0041B94F:
	push	0h
	lea	eax,[ebp-20h]
	mov	dword ptr [ebx],0h
	push	eax
	push	edi
	call	dword ptr [4311FCh]
	add	esp,0Ch
	cmp	edi,[ebp-20h]
	jnz	41B975h

l0041B96A:
	push	4318ACh
	call	dword ptr [431134h]

l0041B975:
	cmp	dword ptr [ebx],22h
	jnz	41B985h

l0041B97A:
	push	4318C4h
	call	dword ptr [43119Ch]

l0041B985:
	and	eax,0FFFFFFh
	add	eax,12000000h
	mov	[esi+60h],eax
	jmp	41C0ACh

l0041B997:
	lea	eax,[ebp-1Ch]
	mov	ecx,esi
	push	eax
	call	41EE50h
	jmp	41C0ACh

l0041B9A7:
	mov	byte ptr [ebp-4h],26h
	mov	edi,[4311A8h]
	push	1h
	call	edi
	add	esp,4h
	mov	[ebp-20h],eax
	push	3h
	push	0h
	lea	eax,[ebp-3Ch]
	mov	byte ptr [ebp-4h],27h
	mov	ecx,[ebp-1Ch]
	push	eax
	call	40F7F0h
	lea	ecx,[ebp-24h]
	mov	byte ptr [ebp-4h],28h
	push	ecx
	mov	edx,4326E4h
	mov	ecx,eax
	call	411F00h
	mov	byte ptr [ebp-4h],27h
	add	esp,4h
	mov	edx,[ebp-28h]
	mov	bl,al
	cmp	edx,10h
	jc	41BA22h

l0041B9F4:
	mov	ecx,[ebp-3Ch]
	inc	edx
	mov	eax,ecx
	cmp	edx,1000h
	jc	41BA18h

l0041BA02:
	mov	ecx,[ecx-4h]
	add	edx,23h
	sub	eax,ecx
	add	eax,0FCh
	cmp	eax,1Fh
	jbe	41BA18h

l0041BA12:
	call	dword ptr [431290h]

l0041BA18:
	push	edx
	push	ecx
	call	42763Fh
	add	esp,8h

l0041BA22:
	lea	ecx,[ebp-24h]
	mov	dword ptr [ebp-2Ch],0h
	mov	dword ptr [ebp-28h],0Fh
	mov	byte ptr [ebp-3Ch],0h
	mov	byte ptr [ebp-4h],1h
	call	401470h
	test	bl,bl
	jnz	41C0A1h

l0041BA48:
	push	1h
	mov	byte ptr [ebp-4h],29h
	call	edi
	add	esp,4h
	mov	[ebp-20h],eax
	push	2h
	push	0h
	lea	eax,[ebp-3Ch]
	mov	byte ptr [ebp-4h],2Ah
	mov	ecx,[ebp-1Ch]
	push	eax
	call	40F7F0h
	lea	ecx,[ebp-24h]
	mov	byte ptr [ebp-4h],2Bh
	push	ecx
	mov	edx,4326E8h
	mov	ecx,eax
	call	411F00h
	mov	byte ptr [ebp-4h],2Ah
	add	esp,4h
	mov	edx,[ebp-28h]
	mov	bl,al
	cmp	edx,10h
	jc	41BABDh

l0041BA8F:
	mov	ecx,[ebp-3Ch]
	inc	edx
	mov	eax,ecx
	cmp	edx,1000h
	jc	41BAB3h

l0041BA9D:
	mov	ecx,[ecx-4h]
	add	edx,23h
	sub	eax,ecx
	add	eax,0FCh
	cmp	eax,1Fh
	jbe	41BAB3h

l0041BAAD:
	call	dword ptr [431290h]

l0041BAB3:
	push	edx
	push	ecx
	call	42763Fh
	add	esp,8h

l0041BABD:
	lea	ecx,[ebp-24h]
	mov	dword ptr [ebp-2Ch],0h
	mov	dword ptr [ebp-28h],0Fh
	mov	byte ptr [ebp-3Ch],0h
	mov	byte ptr [ebp-4h],1h
	call	401470h
	lea	eax,[ebp-1Ch]
	mov	ecx,esi
	push	eax
	test	bl,bl
	jnz	41C0A7h

l0041BAE9:
	call	4237A0h
	jmp	41C0ACh

l0041BAF3:
	lea	eax,[ebp-1Ch]
	mov	ecx,esi
	push	eax
	call	424170h
	jmp	41C0ACh

l0041BB03:
	mov	byte ptr [ebp-4h],2Ch
	mov	edi,[4311A8h]
	push	1h
	call	edi
	add	esp,4h
	mov	[ebp-20h],eax
	push	2h
	push	0h
	lea	eax,[ebp-3Ch]
	mov	byte ptr [ebp-4h],2Dh
	mov	ecx,[ebp-1Ch]
	push	eax
	call	40F7F0h
	lea	ecx,[ebp-24h]
	mov	byte ptr [ebp-4h],2Eh
	push	ecx
	mov	edx,4326ECh
	mov	ecx,eax
	call	411F00h
	mov	byte ptr [ebp-4h],2Dh
	add	esp,4h
	mov	edx,[ebp-28h]
	mov	bl,al
	cmp	edx,10h
	jc	41BB7Eh

l0041BB50:
	mov	ecx,[ebp-3Ch]
	inc	edx
	mov	eax,ecx
	cmp	edx,1000h
	jc	41BB74h

l0041BB5E:
	mov	ecx,[ecx-4h]
	add	edx,23h
	sub	eax,ecx
	add	eax,0FCh
	cmp	eax,1Fh
	jbe	41BB74h

l0041BB6E:
	call	dword ptr [431290h]

l0041BB74:
	push	edx
	push	ecx
	call	42763Fh
	add	esp,8h

l0041BB7E:
	lea	ecx,[ebp-24h]
	mov	dword ptr [ebp-2Ch],0h
	mov	dword ptr [ebp-28h],0Fh
	mov	byte ptr [ebp-3Ch],0h
	mov	byte ptr [ebp-4h],1h
	call	401470h
	test	bl,bl
	jz	41BE87h

l0041BBA4:
	push	1h
	mov	byte ptr [ebp-4h],2Fh
	call	edi
	add	esp,4h
	mov	[ebp-20h],eax
	push	6h
	push	2h
	lea	eax,[ebp-3Ch]
	mov	byte ptr [ebp-4h],30h
	mov	ecx,[ebp-1Ch]
	push	eax
	call	40F7F0h
	lea	ecx,[ebp-24h]
	mov	byte ptr [ebp-4h],31h
	push	ecx
	mov	edx,4326C4h
	mov	ecx,eax
	call	411F00h
	mov	byte ptr [ebp-4h],30h
	add	esp,4h
	mov	edx,[ebp-28h]
	mov	bl,al
	cmp	edx,10h
	jc	41BC19h

l0041BBEB:
	mov	ecx,[ebp-3Ch]
	inc	edx
	mov	eax,ecx
	cmp	edx,1000h
	jc	41BC0Fh

l0041BBF9:
	mov	ecx,[ecx-4h]
	add	edx,23h
	sub	eax,ecx
	add	eax,0FCh
	cmp	eax,1Fh
	jbe	41BC0Fh

l0041BC09:
	call	dword ptr [431290h]

l0041BC0F:
	push	edx
	push	ecx
	call	42763Fh
	add	esp,8h

l0041BC19:
	lea	ecx,[ebp-24h]
	mov	dword ptr [ebp-2Ch],0h
	mov	dword ptr [ebp-28h],0Fh
	mov	byte ptr [ebp-3Ch],0h
	mov	byte ptr [ebp-4h],1h
	call	401470h
	test	bl,bl
	jz	41BC99h

l0041BC3B:
	mov	edi,[ebp-1Ch]
	add	edi,18h
	call	dword ptr [43129Ch]
	cmp	dword ptr [edi+14h],10h
	mov	ebx,eax
	jc	41BC51h

l0041BC4F:
	mov	edi,[edi]

l0041BC51:
	push	0h
	lea	eax,[ebp-20h]
	mov	dword ptr [ebx],0h
	push	eax
	push	edi
	call	dword ptr [4311FCh]
	add	esp,0Ch
	cmp	edi,[ebp-20h]
	jnz	41BC77h

l0041BC6C:
	push	4318ACh
	call	dword ptr [431134h]

l0041BC77:
	cmp	dword ptr [ebx],22h
	jnz	41BC87h

l0041BC7C:
	push	4318C4h
	call	dword ptr [43119Ch]

l0041BC87:
	and	eax,0FFFFFFh
	add	eax,20000000h
	mov	[esi+60h],eax
	jmp	41C0ACh

l0041BC99:
	push	1h
	mov	byte ptr [ebp-4h],32h
	call	edi
	add	esp,4h
	mov	[ebp-20h],eax
	push	6h
	push	2h
	lea	eax,[ebp-3Ch]
	mov	byte ptr [ebp-4h],33h
	mov	ecx,[ebp-1Ch]
	push	eax
	call	40F7F0h
	lea	ecx,[ebp-24h]
	mov	byte ptr [ebp-4h],34h
	push	ecx
	mov	edx,4326CCh
	mov	ecx,eax
	call	411F00h
	mov	byte ptr [ebp-4h],33h
	add	esp,4h
	mov	edx,[ebp-28h]
	mov	bl,al
	cmp	edx,10h
	jc	41BD0Eh

l0041BCE0:
	mov	ecx,[ebp-3Ch]
	inc	edx
	mov	eax,ecx
	cmp	edx,1000h
	jc	41BD04h

l0041BCEE:
	mov	ecx,[ecx-4h]
	add	edx,23h
	sub	eax,ecx
	add	eax,0FCh
	cmp	eax,1Fh
	jbe	41BD04h

l0041BCFE:
	call	dword ptr [431290h]

l0041BD04:
	push	edx
	push	ecx
	call	42763Fh
	add	esp,8h

l0041BD0E:
	lea	ecx,[ebp-24h]
	mov	dword ptr [ebp-2Ch],0h
	mov	dword ptr [ebp-28h],0Fh
	mov	byte ptr [ebp-3Ch],0h
	mov	byte ptr [ebp-4h],1h
	call	401470h
	test	bl,bl
	jz	41BD8Eh

l0041BD30:
	mov	edi,[ebp-1Ch]
	add	edi,18h
	call	dword ptr [43129Ch]
	cmp	dword ptr [edi+14h],10h
	mov	ebx,eax
	jc	41BD46h

l0041BD44:
	mov	edi,[edi]

l0041BD46:
	push	0h
	lea	eax,[ebp-20h]
	mov	dword ptr [ebx],0h
	push	eax
	push	edi
	call	dword ptr [4311FCh]
	add	esp,0Ch
	cmp	edi,[ebp-20h]
	jnz	41BD6Ch

l0041BD61:
	push	4318ACh
	call	dword ptr [431134h]

l0041BD6C:
	cmp	dword ptr [ebx],22h
	jnz	41BD7Ch

l0041BD71:
	push	4318C4h
	call	dword ptr [43119Ch]

l0041BD7C:
	and	eax,0FFFFFFh
	add	eax,21000000h
	mov	[esi+60h],eax
	jmp	41C0ACh

l0041BD8E:
	push	1h
	mov	byte ptr [ebp-4h],35h
	call	edi
	add	esp,4h
	mov	[ebp-20h],eax
	push	4h
	push	2h
	lea	eax,[ebp-3Ch]
	mov	byte ptr [ebp-4h],36h
	mov	ecx,[ebp-1Ch]
	push	eax
	call	40F7F0h
	lea	ecx,[ebp-24h]
	mov	byte ptr [ebp-4h],37h
	push	ecx
	mov	edx,4326D4h
	mov	ecx,eax
	call	411F00h
	mov	byte ptr [ebp-4h],36h
	add	esp,4h
	mov	edx,[ebp-28h]
	mov	bl,al
	cmp	edx,10h
	jc	41BE03h

l0041BDD5:
	mov	ecx,[ebp-3Ch]
	inc	edx
	mov	eax,ecx
	cmp	edx,1000h
	jc	41BDF9h

l0041BDE3:
	mov	ecx,[ecx-4h]
	add	edx,23h
	sub	eax,ecx
	add	eax,0FCh
	cmp	eax,1Fh
	jbe	41BDF9h

l0041BDF3:
	call	dword ptr [431290h]

l0041BDF9:
	push	edx
	push	ecx
	call	42763Fh
	add	esp,8h

l0041BE03:
	lea	ecx,[ebp-24h]
	mov	dword ptr [ebp-2Ch],0h
	mov	dword ptr [ebp-28h],0Fh
	mov	byte ptr [ebp-3Ch],0h
	mov	byte ptr [ebp-4h],1h
	call	401470h
	test	bl,bl
	jz	41C0ACh

l0041BE29:
	mov	edi,[ebp-1Ch]
	add	edi,18h
	call	dword ptr [43129Ch]
	cmp	dword ptr [edi+14h],10h
	mov	ebx,eax
	jc	41BE3Fh

l0041BE3D:
	mov	edi,[edi]

l0041BE3F:
	push	0h
	lea	eax,[ebp-20h]
	mov	dword ptr [ebx],0h
	push	eax
	push	edi
	call	dword ptr [4311FCh]
	add	esp,0Ch
	cmp	edi,[ebp-20h]
	jnz	41BE65h

l0041BE5A:
	push	4318ACh
	call	dword ptr [431134h]

l0041BE65:
	cmp	dword ptr [ebx],22h
	jnz	41BE75h

l0041BE6A:
	push	4318C4h
	call	dword ptr [43119Ch]

l0041BE75:
	and	eax,0FFFFFFh
	add	eax,22000000h
	mov	[esi+60h],eax
	jmp	41C0ACh

l0041BE87:
	lea	eax,[ebp-1Ch]
	mov	ecx,esi
	push	eax

l0041BE8D:
	call	425A20h
	jmp	41C0ACh

l0041BE97:
	mov	byte ptr [ebp-4h],38h
	mov	edi,[4311A8h]
	push	1h
	call	edi
	add	esp,4h
	mov	[ebp-20h],eax
	push	3h
	push	0h
	lea	eax,[ebp-3Ch]
	mov	byte ptr [ebp-4h],39h
	mov	ecx,[ebp-1Ch]
	push	eax
	call	40F7F0h
	lea	ecx,[ebp-24h]
	mov	byte ptr [ebp-4h],3Ah
	push	ecx
	mov	edx,4326F0h
	mov	ecx,eax
	call	411F00h
	mov	byte ptr [ebp-4h],39h
	add	esp,4h
	mov	edx,[ebp-28h]
	mov	bl,al
	cmp	edx,10h
	jc	41BF12h

l0041BEE4:
	mov	ecx,[ebp-3Ch]
	inc	edx
	mov	eax,ecx
	cmp	edx,1000h
	jc	41BF08h

l0041BEF2:
	mov	ecx,[ecx-4h]
	add	edx,23h
	sub	eax,ecx
	add	eax,0FCh
	cmp	eax,1Fh
	jbe	41BF08h

l0041BF02:
	call	dword ptr [431290h]

l0041BF08:
	push	edx
	push	ecx
	call	42763Fh
	add	esp,8h

l0041BF12:
	lea	ecx,[ebp-24h]
	mov	dword ptr [ebp-2Ch],0h
	mov	dword ptr [ebp-28h],0Fh
	mov	byte ptr [ebp-3Ch],0h
	mov	byte ptr [ebp-4h],1h
	call	401470h
	test	bl,bl
	jnz	41C0A1h

l0041BF38:
	push	1h
	mov	byte ptr [ebp-4h],3Bh
	call	edi
	add	esp,4h
	mov	[ebp-20h],eax
	push	2h
	push	0h
	lea	eax,[ebp-3Ch]
	mov	byte ptr [ebp-4h],3Ch
	mov	ecx,[ebp-1Ch]
	push	eax
	call	40F7F0h
	lea	ecx,[ebp-24h]
	mov	byte ptr [ebp-4h],3Dh
	push	ecx
	mov	edx,4326F4h
	mov	ecx,eax
	call	411F00h
	mov	byte ptr [ebp-4h],3Ch
	add	esp,4h
	mov	edx,[ebp-28h]
	mov	bl,al
	cmp	edx,10h
	jc	41BFADh

l0041BF7F:
	mov	ecx,[ebp-3Ch]
	inc	edx
	mov	eax,ecx
	cmp	edx,1000h
	jc	41BFA3h

l0041BF8D:
	mov	ecx,[ecx-4h]
	add	edx,23h
	sub	eax,ecx
	add	eax,0FCh
	cmp	eax,1Fh
	jbe	41BFA3h

l0041BF9D:
	call	dword ptr [431290h]

l0041BFA3:
	push	edx
	push	ecx
	call	42763Fh
	add	esp,8h

l0041BFAD:
	lea	ecx,[ebp-24h]
	mov	dword ptr [ebp-2Ch],0h
	mov	dword ptr [ebp-28h],0Fh
	mov	byte ptr [ebp-3Ch],0h
	mov	byte ptr [ebp-4h],1h
	call	401470h
	test	bl,bl
	jz	41BFDFh

l0041BFCF:
	lea	eax,[ebp-1Ch]
	mov	ecx,esi
	push	eax
	call	4204C0h
	jmp	41C0ACh

l0041BFDF:
	push	1h
	mov	byte ptr [ebp-4h],3Eh
	call	edi
	add	esp,4h
	mov	[ebp-20h],eax
	push	6h
	push	0h
	lea	eax,[ebp-3Ch]
	mov	byte ptr [ebp-4h],3Fh
	mov	ecx,[ebp-1Ch]
	push	eax
	call	40F7F0h
	lea	ecx,[ebp-24h]
	mov	byte ptr [ebp-4h],40h
	push	ecx
	mov	edx,431D70h
	mov	ecx,eax
	call	411F00h
	mov	byte ptr [ebp-4h],3Fh
	add	esp,4h
	mov	edx,[ebp-28h]
	mov	bl,al
	cmp	edx,10h
	jc	41C054h

l0041C026:
	mov	ecx,[ebp-3Ch]
	inc	edx
	mov	eax,ecx
	cmp	edx,1000h
	jc	41C04Ah

l0041C034:
	mov	ecx,[ecx-4h]
	add	edx,23h
	sub	eax,ecx
	add	eax,0FCh
	cmp	eax,1Fh
	jbe	41C04Ah

l0041C044:
	call	dword ptr [431290h]

l0041C04A:
	push	edx
	push	ecx
	call	42763Fh
	add	esp,8h

l0041C054:
	lea	ecx,[ebp-24h]
	mov	dword ptr [ebp-2Ch],0h
	mov	dword ptr [ebp-28h],0Fh
	mov	byte ptr [ebp-3Ch],0h
	mov	byte ptr [ebp-4h],1h
	call	401470h
	lea	eax,[ebp-1Ch]
	mov	ecx,esi
	push	eax
	test	bl,bl
	jz	41BE8Dh

l0041C080:
	call	41C3B0h
	jmp	41C0ACh

l0041C087:
	lea	eax,[ebp-1Ch]
	mov	ecx,esi
	push	eax
	call	426E70h
	jmp	41C0ACh

l0041C094:
	lea	eax,[ebp-1Ch]
	mov	ecx,esi
	push	eax
	call	41C3B0h
	jmp	41C0ACh

l0041C0A1:
	lea	eax,[ebp-1Ch]
	mov	ecx,esi
	push	eax

l0041C0A7:
	call	421620h

l0041C0AC:
	cmp	dword ptr [esi+60h],0FFh
	mov	edi,[ebp-1Ch]
	setz	al
	mov	[esi+68h],al
	test	edi,edi
	jz	41C129h

l0041C0BD:
	mov	edx,[ebp-18h]
	push	ecx
	mov	ecx,edi
	call	403510h
	mov	ecx,[ebp-14h]
	mov	eax,2AAAAAABh
	mov	esi,[ebp-1Ch]
	add	esp,4h
	sub	ecx,esi
	imul	ecx
	sar	edx,2h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx
	lea	ecx,[eax+eax*2]
	mov	eax,esi
	shl	ecx,3h
	cmp	ecx,1000h
	jc	41C10Ah

l0041C0F4:
	mov	esi,[esi-4h]
	add	ecx,23h
	sub	eax,esi
	add	eax,0FCh
	cmp	eax,1Fh
	jbe	41C10Ah

l0041C104:
	call	dword ptr [431290h]

l0041C10A:
	push	ecx
	push	esi
	call	42763Fh
	add	esp,8h
	mov	dword ptr [ebp-1Ch],0h
	mov	dword ptr [ebp-18h],0h
	mov	dword ptr [ebp-14h],0h

l0041C129:
	mov	edx,[ebp+1Ch]
	cmp	edx,10h
	jc	41C15Fh

l0041C131:
	mov	ecx,[ebp+8h]
	inc	edx
	mov	eax,ecx
	cmp	edx,1000h
	jc	41C155h

l0041C13F:
	mov	ecx,[ecx-4h]
	add	edx,23h
	sub	eax,ecx
	add	eax,0FCh
	cmp	eax,1Fh
	jbe	41C155h

l0041C14F:
	call	dword ptr [431290h]

l0041C155:
	push	edx
	push	ecx
	call	42763Fh
	add	esp,8h

l0041C15F:
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
	ret	20h

l0041C17D:
	call	4113B0h
	nop
l0041C184	dd	0x0041C0A1
l0041C188	dd	0x0041AFD6
l0041C18C	dd	0x0041B08B
l0041C190	dd	0x0041B1DD
l0041C194	dd	0x0041C094
l0041C198	dd	0x0041B1ED
l0041C19C	dd	0x0041B578
l0041C1A0	dd	0x0041B9A7
l0041C1A4	dd	0x0041BAF3
l0041C1A8	dd	0x0041BB03
l0041C1AC	dd	0x0041BE97
l0041C1B0	dd	0x0041C087
l0041C1B4	dd	0x0041C0AC
l0041C1B8	db	0x00
l0041C1B9	db	0x01
l0041C1BA	db	0x02
l0041C1BB	db	0x00
l0041C1BC	db	0x00
l0041C1BD	db	0x03
l0041C1BE	db	0x0C
l0041C1BF	db	0x04
l0041C1C0	db	0x05
l0041C1C1	db	0x0C
l0041C1C2	db	0x0C
l0041C1C3	db	0x06
l0041C1C4	db	0x07
l0041C1C5	db	0x00
l0041C1C6	db	0x00
l0041C1C7	db	0x08
l0041C1C8	db	0x0C
l0041C1C9	db	0x09
l0041C1CA	db	0x0A
l0041C1CB	db	0x0B
l0041C1CC	db	0x0C
l0041C1CD	db	0x0C
l0041C1CE	db	0x04
l0041C1CF	db	0x00
l0041C1D0	db	0x0C
l0041C1D1	db	0x0C
l0041C1D2	db	0x0C
l0041C1D3	db	0x0C
l0041C1D4	db	0x0C
l0041C1D5	db	0x0C
l0041C1D6	db	0x0C
l0041C1D7	db	0x0C
l0041C1D8	db	0x00
l0041C1D9	db	0x01
l0041C1DA	db	0x02
l0041C1DB	db	0x00
l0041C1DC	db	0x00
l0041C1DD	db	0x03
l0041C1DE	db	0x0C
l0041C1DF	db	0x04
l0041C1E0	db	0x05
l0041C1E1	db	0x0C
l0041C1E2	db	0x0C
l0041C1E3	db	0x06
l0041C1E4	db	0x07
l0041C1E5	db	0x00
l0041C1E6	db	0x00
l0041C1E7	db	0x08
l0041C1E8	db	0x0C
l0041C1E9	db	0x09
l0041C1EA	db	0x0A
l0041C1EB	db	0x0B
l0041C1EC	db	0x0C
l0041C1ED	db	0x0C
l0041C1EE	db	0x04
l0041C1EF	db	0x00

;; fn0041C1F0: 0041C1F0
;;   Called from:
;;     0041C475 (in fn0041C3F6)
;;     0041C4CA (in fn0041C3F6)
;;     0041C520 (in fn0041C3F6)
;;     0041CAFC (in fn0041C910)
;;     0041CAFC (in fn0041CA90)
;;     0041CB52 (in fn0041CB12)
;;     0041CBC5 (in fn0041CB12)
;;     0041CC11 (in fn0041CB12)
;;     0041CCFE (in fn0041CC60)
;;     0041CD59 (in fn0041CC60)
;;     0041CDB4 (in fn0041CC60)
;;     0041CE0F (in fn0041CC60)
;;     0041CE6A (in fn0041CC60)
;;     0041CEC5 (in fn0041CC60)
;;     0041CF20 (in fn0041CC60)
;;     0041CF7B (in fn0041CC60)
;;     0041CFD6 (in fn0041CC60)
;;     0041D035 (in fn0041CC60)
;;     0041D094 (in fn0041CC60)
;;     0041D132 (in fn0041CC60)
;;     0041D192 (in fn0041CC60)
;;     0041D5C6 (in fn0041CC60)
;;     0041D5C6 (in fn0041D540)
;;     0041D63F (in fn0041D5FE)
;;     0041D6B8 (in fn0041D5FE)
;;     0041D71A (in fn0041D5FE)
;;     0041D793 (in fn0041D5FE)
;;     0041D7F3 (in fn0041D5FE)
;;     0041D86C (in fn0041D5FE)
;;     0041D8E3 (in fn0041D5FE)
;;     0041D957 (in fn0041D5FE)
;;     0041D9D0 (in fn0041D5FE)
;;     0041DA30 (in fn0041D5FE)
;;     0041DAA6 (in fn0041D5FE)
;;     0041DB61 (in fn0041DAF0)
;;     0041DED7 (in fn0041DAF0)
;;     0041E10E (in fn0041DAF0)
;;     0041E481 (in fn0041DAF0)
;;     0041E6B8 (in fn0041DAF0)
;;     0041E8BA (in fn0041DAF0)
;;     0041E9FA (in fn0041DAF0)
;;     0041EBF6 (in fn0041DAF0)
;;     0041ED8B (in fn0041ED20)
;;     0041EE14 (in fn0041ED20)
;;     0041EEC7 (in fn0041EE50)
;;     0041EF75 (in fn0041EE50)
;;     0041F023 (in fn0041EE50)
;;     0041F0D1 (in fn0041EE50)
;;     0041F17D (in fn0041EE50)
;;     0041F22B (in fn0041EE50)
;;     0041F2D9 (in fn0041EE50)
;;     0041F375 (in fn0041EE50)
;;     0041F406 (in fn0041EE50)
;;     0041F499 (in fn0041EE50)
;;     0041F52C (in fn0041EE50)
;;     0041F5BF (in fn0041EE50)
;;     0041F650 (in fn0041EE50)
;;     0041F6E3 (in fn0041EE50)
;;     0041F776 (in fn0041EE50)
;;     0041F809 (in fn0041EE50)
;;     0041F89A (in fn0041EE50)
;;     0041F942 (in fn0041EE50)
;;     0041F9EA (in fn0041EE50)
;;     0041FA92 (in fn0041EE50)
;;     0041FB3A (in fn0041EE50)
;;     0041FBE2 (in fn0041EE50)
;;     0041FC8A (in fn0041EE50)
;;     0041FD22 (in fn0041EE50)
;;     0041FDB5 (in fn0041EE50)
;;     0041FE48 (in fn0041EE50)
;;     0041FEF0 (in fn0041EE50)
;;     0041FF31 (in fn0041EE50)
;;     0041FFD9 (in fn0041EE50)
;;     00420081 (in fn0041EE50)
;;     00420129 (in fn0041EE50)
;;     004201D1 (in fn0041EE50)
;;     0042026B (in fn0041EE50)
;;     00420316 (in fn0041EE50)
;;     004203BE (in fn0041EE50)
;;     00420451 (in fn0041EE50)
;;     00420531 (in fn004204C0)
;;     004205C3 (in fn004204C0)
;;     00420655 (in fn004204C0)
;;     004206E7 (in fn004204C0)
;;     00420779 (in fn004204C0)
;;     0042080B (in fn004204C0)
;;     0042089D (in fn004204C0)
;;     0042092F (in fn004204C0)
;;     004209C1 (in fn004204C0)
;;     00420A53 (in fn004204C0)
;;     00420AE5 (in fn004204C0)
;;     00420B77 (in fn004204C0)
;;     00420C09 (in fn004204C0)
;;     00420CEE (in fn004204C0)
;;     00420DCC (in fn004204C0)
;;     00420E53 (in fn004204C0)
;;     00420EB4 (in fn004204C0)
;;     00420F15 (in fn004204C0)
;;     00420FF3 (in fn004204C0)
;;     00421085 (in fn004204C0)
;;     00421117 (in fn004204C0)
;;     00421178 (in fn004204C0)
;;     004211D9 (in fn004204C0)
;;     0042123A (in fn004204C0)
;;     0042129B (in fn004204C0)
;;     004212FC (in fn004204C0)
;;     004213D7 (in fn004204C0)
;;     00421481 (in fn004204C0)
;;     00421513 (in fn004204C0)
;;     004215A5 (in fn004204C0)
;;     0042169A (in fn00421620)
;;     00421752 (in fn00421620)
;;     0042180F (in fn00421620)
;;     004218B5 (in fn00421620)
;;     00421925 (in fn00421620)
;;     004219C8 (in fn00421620)
;;     00421A38 (in fn00421620)
;;     00421AA8 (in fn00421620)
;;     00421B06 (in fn00421620)
;;     00421B62 (in fn00421620)
;;     00421BD3 (in fn00421620)
;;     00421C5C (in fn00421620)
;;     00421CED (in fn00421620)
;;     00421D7E (in fn00421620)
;;     00421E0F (in fn00421620)
;;     00421EA2 (in fn00421620)
;;     00421F35 (in fn00421620)
;;     00421FC8 (in fn00421620)
;;     0042204B (in fn00421620)
;;     004220CE (in fn00421620)
;;     00422151 (in fn00421620)
;;     004221D4 (in fn00421620)
;;     00422257 (in fn00421620)
;;     004222EA (in fn00421620)
;;     0042237B (in fn00421620)
;;     0042240C (in fn00421620)
;;     004224A5 (in fn00421620)
;;     00422538 (in fn00421620)
;;     004225CB (in fn00421620)
;;     0042265C (in fn00421620)
;;     004226ED (in fn00421620)
;;     00422780 (in fn00421620)
;;     00422813 (in fn00421620)
;;     004228A6 (in fn00421620)
;;     00422939 (in fn00421620)
;;     004229CC (in fn00421620)
;;     00422A5F (in fn00421620)
;;     00422AF8 (in fn00421620)
;;     00422B91 (in fn00421620)
;;     00422C2A (in fn00421620)
;;     00422CC3 (in fn00421620)
;;     00422D5C (in fn00421620)
;;     00422DF5 (in fn00421620)
;;     00422E44 (in fn00421620)
;;     00422ED5 (in fn00421620)
;;     00422F66 (in fn00421620)
;;     00422FF9 (in fn00421620)
;;     0042308C (in fn00421620)
;;     0042311F (in fn00421620)
;;     004231B2 (in fn00421620)
;;     00423245 (in fn00421620)
;;     004232D8 (in fn00421620)
;;     0042336B (in fn00421620)
;;     004233FE (in fn00421620)
;;     00423481 (in fn00421620)
;;     00423504 (in fn00421620)
;;     00423587 (in fn00421620)
;;     00423605 (in fn00421620)
;;     00423834 (in fn004237A0)
;;     00423A61 (in fn004237A0)
;;     00423ACD (in fn004237A0)
;;     00423B39 (in fn004237A0)
;;     00423BA5 (in fn004237A0)
;;     00423D57 (in fn004237A0)
;;     00423DC3 (in fn004237A0)
;;     00423E2F (in fn004237A0)
;;     00423E9B (in fn004237A0)
;;     00423F05 (in fn004237A0)
;;     00423F84 (in fn004237A0)
;;     00424055 (in fn004237A0)
;;     00424204 (in fn00424170)
;;     004242B0 (in fn00424170)
;;     00424338 (in fn00424170)
;;     004243A5 (in fn00424170)
;;     0042442D (in fn00424170)
;;     004245DE (in fn00424170)
;;     0042478A (in fn00424170)
;;     00424936 (in fn00424170)
;;     00424AE2 (in fn00424170)
;;     00424B5A (in fn00424170)
;;     00424BD2 (in fn00424170)
;;     00424C4A (in fn00424170)
;;     00424CC0 (in fn00424170)
;;     00424D36 (in fn00424170)
;;     00424DAC (in fn00424170)
;;     00424E32 (in fn00424170)
;;     00424EB8 (in fn00424170)
;;     00424F46 (in fn00424170)
;;     00424FD4 (in fn00424170)
;;     00425062 (in fn00424170)
;;     004250F9 (in fn00424170)
;;     00425190 (in fn00424170)
;;     00425227 (in fn00424170)
;;     004252AF (in fn00424170)
;;     00425337 (in fn00424170)
;;     004253BF (in fn00424170)
;;     00425447 (in fn00424170)
;;     004254DE (in fn00424170)
;;     00425575 (in fn00424170)
;;     004255BA (in fn00424170)
;;     00425651 (in fn00424170)
;;     004256E8 (in fn00424170)
;;     0042577F (in fn00424170)
;;     00425816 (in fn00424170)
;;     0042589F (in fn00424170)
;;     0042592A (in fn00424170)
;;     004259B0 (in fn00424170)
;;     00425A91 (in fn00425A20)
;;     00425B3B (in fn00425A20)
;;     00425BDC (in fn00425A20)
;;     00425C7D (in fn00425A20)
;;     00425D27 (in fn00425A20)
;;     00425DB7 (in fn00425A20)
;;     00425E61 (in fn00425A20)
;;     00425EF1 (in fn00425A20)
;;     00425F81 (in fn00425A20)
;;     00426014 (in fn00425A20)
;;     004260A7 (in fn00425A20)
;;     0042613A (in fn00425A20)
;;     004261CD (in fn00425A20)
;;     00426330 (in fn004262A0)
;;     004263A1 (in fn004262A0)
;;     00426410 (in fn004262A0)
;;     00426481 (in fn004262A0)
;;     004264F2 (in fn004262A0)
;;     00426561 (in fn004262A0)
;;     004265D2 (in fn004262A0)
;;     00426643 (in fn004262A0)
;;     004266B4 (in fn004262A0)
;;     00426723 (in fn004262A0)
;;     00426792 (in fn004262A0)
;;     0042680C (in fn004262A0)
;;     00426925 (in fn004262A0)
;;     0042699C (in fn004262A0)
;;     00426A13 (in fn004262A0)
;;     00426A92 (in fn004262A0)
;;     00426B09 (in fn004262A0)
;;     00426B78 (in fn004262A0)
;;     00426BE7 (in fn004262A0)
;;     00426C56 (in fn004262A0)
;;     00426CA7 (in fn004262A0)
;;     00426CF8 (in fn004262A0)
;;     00426D49 (in fn004262A0)
;;     00426D97 (in fn004262A0)
;;     00426EE1 (in fn00426E70)
;;     00426FC2 (in fn00426E70)
;;     004270A0 (in fn00426E70)
;;     00427132 (in fn00426E70)
fn0041C1F0 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42F4C0h
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
	mov	edi,ecx
	mov	dword ptr [ebp-4h],0h
	mov	ebx,[ebp+30h]
	push	1h
	mov	byte ptr [ebp-4h],2h
	call	dword ptr [4311A8h]
	mov	esi,eax
	add	esp,4h
	mov	[ebp-2Ch],esi
	mov	byte ptr [ebp-4h],3h
	mov	edx,[edi+64h]
	mov	eax,[ebp+18h]
	mov	dword ptr [ebp-18h],0h
	mov	dword ptr [ebp-14h],0Fh
	mov	byte ptr [ebp-28h],0h
	cmp	eax,edx
	jc	41C39Fh

;; fn0041C25C: 0041C25C
;;   Called from:
;;     0041C256 (in fn0041C1F0)
;;     0041C256 (in fn0041AEF0)
fn0041C25C proc
	sub	eax,edx
	mov	ecx,ebx
	cmp	eax,ebx
	cmovc	ecx,eax

l0041C265:
	cmp	dword ptr [ebp+1Ch],10h
	lea	eax,[ebp+8h]
	cmovnc	eax,[ebp+8h]

l0041C270:
	push	ecx
	add	eax,edx
	lea	ecx,[ebp-28h]
	push	eax
	call	402A70h
	lea	eax,[ebp-30h]
	mov	byte ptr [ebp-4h],4h
	push	eax
	lea	edx,[ebp+20h]
	lea	ecx,[ebp-28h]
	call	403180h
	mov	byte ptr [ebp-4h],3h
	add	esp,4h
	mov	edx,[ebp-14h]
	mov	[ebp-0Dh],al
	cmp	edx,10h
	jc	41C2CFh

l0041C2A1:
	mov	ecx,[ebp-28h]
	inc	edx
	mov	eax,ecx
	cmp	edx,1000h
	jc	41C2C5h

l0041C2AF:
	mov	ecx,[ecx-4h]
	add	edx,23h
	sub	eax,ecx
	add	eax,0FCh
	cmp	eax,1Fh
	jbe	41C2C5h

l0041C2BF:
	call	dword ptr [431290h]

l0041C2C5:
	push	edx
	push	ecx
	call	42763Fh
	add	esp,8h

l0041C2CF:
	mov	dword ptr [ebp-18h],0h
	mov	dword ptr [ebp-14h],0Fh
	mov	byte ptr [ebp-28h],0h
	mov	byte ptr [ebp-4h],5h
	test	esi,esi
	jz	41C2FCh

l0041C2E9:
	mov	eax,[esi]
	mov	ecx,esi
	call	dword ptr [eax+8h]
	test	eax,eax
	jz	41C2FCh

l0041C2F4:
	mov	edx,[eax]
	mov	ecx,eax
	push	1h
	call	dword ptr [edx]

l0041C2FC:
	cmp	byte ptr [ebp-0Dh],0h
	jnz	41C306h

l0041C302:
	xor	bl,bl
	jmp	41C30Bh

l0041C306:
	add	[edi+64h],ebx
	mov	bl,1h

l0041C30B:
	mov	edx,[ebp+1Ch]
	cmp	edx,10h
	jc	41C341h

l0041C313:
	mov	ecx,[ebp+8h]
	inc	edx
	mov	eax,ecx
	cmp	edx,1000h
	jc	41C337h

l0041C321:
	mov	ecx,[ecx-4h]
	add	edx,23h
	sub	eax,ecx
	add	eax,0FCh
	cmp	eax,1Fh
	jbe	41C337h

l0041C331:
	call	dword ptr [431290h]

l0041C337:
	push	edx
	push	ecx
	call	42763Fh
	add	esp,8h

l0041C341:
	mov	edx,[ebp+34h]
	mov	dword ptr [ebp+18h],0h
	mov	dword ptr [ebp+1Ch],0Fh
	mov	byte ptr [ebp+8h],0h
	cmp	edx,10h
	jc	41C389h

l0041C35B:
	mov	ecx,[ebp+20h]
	inc	edx
	mov	eax,ecx
	cmp	edx,1000h
	jc	41C37Fh

l0041C369:
	mov	ecx,[ecx-4h]
	add	edx,23h
	sub	eax,ecx
	add	eax,0FCh
	cmp	eax,1Fh
	jbe	41C37Fh

l0041C379:
	call	dword ptr [431290h]

l0041C37F:
	push	edx
	push	ecx
	call	42763Fh
	add	esp,8h

l0041C389:
	mov	al,bl
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	30h

;; fn0041C39F: 0041C39F
;;   Called from:
;;     0041C256 (in fn0041C1F0)
;;     0041C256 (in fn0041AEF0)
fn0041C39F proc
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

;; fn0041C3B0: 0041C3B0
;;   Called from:
;;     0041B077 (in fn0041AEF0)
;;     0041C080 (in fn0041AEF0)
;;     0041C09A (in fn0041AEF0)
fn0041C3B0 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42F4F8h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,10h
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
	mov	esi,[ebx]
	add	esi,18h
	call	dword ptr [43129Ch]
	cmp	dword ptr [esi+14h],10h
	mov	[ebp-18h],eax
	jc	41C3F6h

;; fn0041C3F4: 0041C3F4
;;   Called from:
;;     0041C3F2 (in fn0041C3B0)
;;     0041C3F2 (in fn0041C39F)
fn0041C3F4 proc
	mov	esi,[esi]

;; fn0041C3F6: 0041C3F6
;;   Called from:
;;     0041C3F2 (in fn0041C3B0)
;;     0041C3F2 (in fn0041C39F)
;;     0041C3F4 (in fn0041C3F4)
fn0041C3F6 proc
	mov	dword ptr [eax],0h
	lea	eax,[ebp-14h]
	push	0h
	push	eax
	push	esi
	call	dword ptr [4311FCh]
	add	esp,0Ch
	mov	ecx,eax
	cmp	esi,[ebp-14h]
	jnz	41C41Eh

l0041C413:
	push	4318ACh
	call	dword ptr [431134h]

l0041C41E:
	mov	eax,[ebp-18h]
	cmp	dword ptr [eax],22h
	jnz	41C431h

l0041C426:
	push	4318C4h
	call	dword ptr [43119Ch]

l0041C431:
	sub	esp,18h
	mov	[edi+60h],ecx
	mov	ecx,esp
	mov	[ebp-14h],esp
	push	4h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	431D40h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],0h
	mov	ecx,esp
	push	dword ptr [ebx]
	call	4028D0h
	mov	ecx,edi
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	41C489h

l0041C47E:
	xor	eax,eax
	mov	[edi+62h],ax
	jmp	41C58Ah

l0041C489:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-1Ch],esp
	push	4h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	431D24h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],1h
	mov	ecx,esp
	push	dword ptr [ebx]
	call	4028D0h
	mov	ecx,edi
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	41C4DFh

l0041C4D3:
	and	dword ptr [edi+60h],0FFh
	jmp	41C58Ah

l0041C4DF:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-1Ch],esp
	push	6h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	431D70h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],2h
	mov	ecx,esp
	push	dword ptr [ebx]
	call	4028D0h
	mov	ecx,edi
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	41C58Ah

l0041C529:
	mov	esi,[ebx]
	add	esi,18h
	call	dword ptr [43129Ch]
	cmp	dword ptr [esi+14h],10h
	mov	ebx,eax
	jc	41C53Eh

l0041C53C:
	mov	esi,[esi]

l0041C53E:
	lea	eax,[ebp-18h]
	mov	dword ptr [ebx],0h
	push	eax
	push	esi
	call	dword ptr [431204h]
	add	esp,8h
	fstp	dword ptr [ebp-14h]
	cmp	esi,[ebp-18h]
	jnz	41C565h

l0041C55A:
	push	4318E0h
	call	dword ptr [431134h]

l0041C565:
	cmp	dword ptr [ebx],22h
	jnz	41C575h

l0041C56A:
	push	4318F8h
	call	dword ptr [43119Ch]

l0041C575:
	movss	xmm0,dword ptr [ebp-14h]
	mulss	xmm0,dword ptr [432F70h]
	call	42D730h
	mov	[edi+60h],eax

l0041C58A:
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
0041C5A8                         CC CC CC CC CC CC CC CC         ........

;; fn0041C5B0: 0041C5B0
;;   Called from:
;;     00423650 (in fn00421620)
fn0041C5B0 proc
	mov	eax,[ecx+60h]
	shr	eax,1Ah
	ret
0041C5B7                      CC CC CC CC CC CC CC CC CC        .........

;; fn0041C5C0: 0041C5C0
;;   Called from:
;;     0041F3C1 (in fn0041EE50)
;;     0041F452 (in fn0041EE50)
;;     0041F4E5 (in fn0041EE50)
;;     0041F578 (in fn0041EE50)
;;     0041F60B (in fn0041EE50)
;;     0041F69C (in fn0041EE50)
;;     0041F72F (in fn0041EE50)
;;     0041F7C2 (in fn0041EE50)
;;     0041F855 (in fn0041EE50)
;;     0041F8EC (in fn0041EE50)
;;     0041F994 (in fn0041EE50)
;;     0041FA3C (in fn0041EE50)
;;     0041FAE4 (in fn0041EE50)
;;     0041FB8C (in fn0041EE50)
;;     0041FC34 (in fn0041EE50)
;;     0041FCDF (in fn0041EE50)
;;     0041FD6E (in fn0041EE50)
;;     0041FE01 (in fn0041EE50)
;;     0041FE9A (in fn0041EE50)
;;     0041FF83 (in fn0041EE50)
;;     0042002B (in fn0041EE50)
;;     004200D3 (in fn0041EE50)
;;     0042017B (in fn0041EE50)
;;     00420226 (in fn0041EE50)
;;     004202C0 (in fn0041EE50)
;;     00420368 (in fn0041EE50)
;;     0042040A (in fn0041EE50)
;;     0042049D (in fn0041EE50)
;;     00421C15 (in fn00421620)
;;     00421CA8 (in fn00421620)
;;     00421D39 (in fn00421620)
;;     00421DCA (in fn00421620)
;;     00421E5B (in fn00421620)
;;     00421EEE (in fn00421620)
;;     00421F81 (in fn00421620)
;;     00422004 (in fn00421620)
;;     00422087 (in fn00421620)
;;     0042210A (in fn00421620)
;;     0042218D (in fn00421620)
;;     00422210 (in fn00421620)
;;     004222A3 (in fn00421620)
;;     00422336 (in fn00421620)
;;     004223C7 (in fn00421620)
;;     0042245E (in fn00421620)
;;     004224F1 (in fn00421620)
;;     00422584 (in fn00421620)
;;     00422617 (in fn00421620)
;;     004226A8 (in fn00421620)
;;     00422739 (in fn00421620)
;;     004227CC (in fn00421620)
;;     0042285F (in fn00421620)
;;     004228F2 (in fn00421620)
;;     00422985 (in fn00421620)
;;     00422A18 (in fn00421620)
;;     00422AB1 (in fn00421620)
;;     00422B4A (in fn00421620)
;;     00422BE3 (in fn00421620)
;;     00422C7C (in fn00421620)
;;     00422D15 (in fn00421620)
;;     00422DAE (in fn00421620)
;;     00422E02 (in fn00421620)
;;     00422E90 (in fn00421620)
;;     00422F21 (in fn00421620)
;;     00422FB2 (in fn00421620)
;;     00423045 (in fn00421620)
;;     004230D8 (in fn00421620)
;;     0042316B (in fn00421620)
;;     004231FE (in fn00421620)
;;     00423291 (in fn00421620)
;;     00423324 (in fn00421620)
;;     004233B7 (in fn00421620)
;;     0042343A (in fn00421620)
;;     004234BD (in fn00421620)
;;     00423540 (in fn00421620)
;;     004235C3 (in fn00421620)
;;     00423641 (in fn00421620)
;;     00424641 (in fn00424170)
;;     004247ED (in fn00424170)
;;     00424999 (in fn00424170)
fn0041C5C0 proc
	push	ebp
	mov	ebp,esp
	mov	edx,1Ah
	call	427210h
	mov	eax,[ebp+8h]
	movd	xmm1,eax
	cvtdq2pd	xmm1,xmm1
	shr	eax,1Fh
	addsd	xmm1,double ptr [432F80h+eax*8]
	mulsd	xmm0,xmm1
	call	42D911h
	pop	ebp
	ret	4h
0041C5F1    CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC  ...............

;; fn0041C600: 0041C600
;;   Called from:
;;     0041CD0B (in fn0041CC60)
;;     0041CD66 (in fn0041CC60)
;;     0041CDC1 (in fn0041CC60)
;;     0041CE1C (in fn0041CC60)
;;     0041CE77 (in fn0041CC60)
;;     0041CED2 (in fn0041CC60)
;;     0041CF2D (in fn0041CC60)
;;     0041CF88 (in fn0041CC60)
;;     0041CFE3 (in fn0041CC60)
;;     0041D042 (in fn0041CC60)
;;     0041D0B3 (in fn0041CC60)
fn0041C600 proc
	push	ebp
	mov	ebp,esp
	and	esp,0F8h
	sub	esp,8h
	movsd	xmm0,double ptr [432E60h]
	movsd	xmm1,double ptr [432ED0h]
	call	42DAADh
	mov	eax,[ebp+8h]
	movd	xmm1,eax
	cvtdq2pd	xmm1,xmm1
	shr	eax,1Fh
	addsd	xmm1,double ptr [432F80h+eax*8]
	mulsd	xmm0,xmm1
	movsd	xmm1,double ptr [432EB0h]
	movsd	double ptr [esp],xmm0
	movsd	xmm0,double ptr [432E60h]
	call	42DAADh
	mov	eax,[ebp+0Ch]
	movd	xmm1,eax
	cvtdq2pd	xmm1,xmm1
	shr	eax,1Fh
	addsd	xmm1,double ptr [432F80h+eax*8]
	mulsd	xmm0,xmm1
	addsd	xmm0,double ptr [esp]
	call	42D911h
	mov	esp,ebp
	pop	ebp
	ret	8h
0041C67E                                           CC CC               ..

;; fn0041C680: 0041C680
;;   Called from:
;;     0041D5EF (in fn0041D5CF)
;;     0041D668 (in fn0041D5FE)
;;     0041D743 (in fn0041D5FE)
;;     0041D81C (in fn0041D5FE)
;;     0041D895 (in fn0041D5FE)
;;     0041D909 (in fn0041D5FE)
;;     0041D980 (in fn0041D5FE)
;;     0041DA59 (in fn0041D5FE)
;;     0041DACF (in fn0041D5FE)
;;     0041EDAC (in fn0041ED20)
;;     0041EF17 (in fn0041EE50)
;;     0041EFC5 (in fn0041EE50)
;;     0041F073 (in fn0041EE50)
;;     0041F121 (in fn0041EE50)
;;     0041F1CD (in fn0041EE50)
;;     0041F27B (in fn0041EE50)
;;     0041F329 (in fn0041EE50)
;;     0041F3B6 (in fn0041EE50)
;;     0041F447 (in fn0041EE50)
;;     0041F4DA (in fn0041EE50)
;;     0041F56D (in fn0041EE50)
;;     0041F600 (in fn0041EE50)
;;     0041F691 (in fn0041EE50)
;;     0041F724 (in fn0041EE50)
;;     0041F7B7 (in fn0041EE50)
;;     0041F84A (in fn0041EE50)
;;     0041FD63 (in fn0041EE50)
;;     0041FDF6 (in fn0041EE50)
;;     004203FF (in fn0041EE50)
;;     00420492 (in fn0041EE50)
;;     0042055A (in fn004204C0)
;;     004205EC (in fn004204C0)
;;     0042067E (in fn004204C0)
;;     00420710 (in fn004204C0)
;;     004207A2 (in fn004204C0)
;;     00420834 (in fn004204C0)
;;     004208C6 (in fn004204C0)
;;     00420958 (in fn004204C0)
;;     004209EA (in fn004204C0)
;;     00420A7C (in fn004204C0)
;;     00420B0E (in fn004204C0)
;;     00420BA0 (in fn004204C0)
;;     0042101C (in fn004204C0)
;;     004210AE (in fn004204C0)
;;     004214AA (in fn004204C0)
;;     0042153C (in fn004204C0)
;;     004215CE (in fn004204C0)
;;     00421C9D (in fn00421620)
;;     00421D2E (in fn00421620)
;;     00421DBF (in fn00421620)
;;     00421E50 (in fn00421620)
;;     00421EE3 (in fn00421620)
;;     00421F76 (in fn00421620)
;;     00421FF9 (in fn00421620)
;;     0042207C (in fn00421620)
;;     004220FF (in fn00421620)
;;     00422182 (in fn00421620)
;;     00422205 (in fn00421620)
;;     00422298 (in fn00421620)
;;     0042232B (in fn00421620)
;;     004223BC (in fn00421620)
;;     004224E6 (in fn00421620)
;;     00422579 (in fn00421620)
;;     0042260C (in fn00421620)
;;     0042269D (in fn00421620)
;;     0042272E (in fn00421620)
;;     004227C1 (in fn00421620)
;;     00422854 (in fn00421620)
;;     004228E7 (in fn00421620)
;;     0042297A (in fn00421620)
;;     00422A0D (in fn00421620)
;;     00422E85 (in fn00421620)
;;     00422F16 (in fn00421620)
;;     00422FA7 (in fn00421620)
;;     0042303A (in fn00421620)
;;     004230CD (in fn00421620)
;;     00423160 (in fn00421620)
;;     004231F3 (in fn00421620)
;;     00423286 (in fn00421620)
;;     00423319 (in fn00421620)
;;     004233AC (in fn00421620)
;;     0042342F (in fn00421620)
;;     004234B2 (in fn00421620)
;;     00423535 (in fn00421620)
;;     004235B8 (in fn00421620)
;;     00423636 (in fn00421620)
;;     004238D7 (in fn004237A0)
;;     00423973 (in fn004237A0)
;;     00423A13 (in fn004237A0)
;;     00423A7A (in fn004237A0)
;;     00423AE6 (in fn004237A0)
;;     00423B52 (in fn004237A0)
;;     00423D09 (in fn004237A0)
;;     00423D70 (in fn004237A0)
;;     00423DDC (in fn004237A0)
;;     00423E48 (in fn004237A0)
;;     00423EB4 (in fn004237A0)
;;     00423F32 (in fn004237A0)
;;     00424B13 (in fn00424170)
;;     00424B8B (in fn00424170)
;;     00424C03 (in fn00424170)
;;     00424C7B (in fn00424170)
;;     00424CF1 (in fn00424170)
;;     00424D67 (in fn00424170)
;;     00424DED (in fn00424170)
;;     00424E73 (in fn00424170)
;;     00424EE9 (in fn00424170)
;;     00424F77 (in fn00424170)
;;     00425005 (in fn00424170)
;;     00425268 (in fn00424170)
;;     004252F0 (in fn00424170)
;;     00425378 (in fn00424170)
;;     00425400 (in fn00424170)
;;     0042585A (in fn00424170)
;;     004258E3 (in fn00424170)
;;     0042596E (in fn00424170)
;;     004259F4 (in fn00424170)
;;     00425D69 (in fn00425A20)
;;     00425EA3 (in fn00425A20)
;;     00425F33 (in fn00425A20)
;;     00425FC3 (in fn00425A20)
;;     00426056 (in fn00425A20)
;;     004260E9 (in fn00425A20)
;;     0042617C (in fn00425A20)
;;     0042620F (in fn00425A20)
;;     00426351 (in fn004262A0)
;;     004263C2 (in fn004262A0)
;;     00426431 (in fn004262A0)
;;     004264A2 (in fn004262A0)
;;     00426513 (in fn004262A0)
;;     00426582 (in fn004262A0)
;;     004265F3 (in fn004262A0)
;;     00426664 (in fn004262A0)
;;     004266D5 (in fn004262A0)
;;     00426744 (in fn004262A0)
;;     004267BE (in fn004262A0)
;;     00426838 (in fn004262A0)
;;     0042694E (in fn004262A0)
;;     004269C5 (in fn004262A0)
;;     00426A37 (in fn004262A0)
;;     00426ABB (in fn004262A0)
;;     00426B2A (in fn004262A0)
;;     00426B99 (in fn004262A0)
;;     00426C08 (in fn004262A0)
;;     004270C9 (in fn00426E70)
;;     0042715B (in fn00426E70)
fn0041C680 proc
	push	ebp
	mov	ebp,esp
	and	esp,0F8h
	sub	esp,8h
	movsd	xmm0,double ptr [432E60h]
	movsd	xmm1,double ptr [432ED0h]
	call	42DAADh
	mov	eax,[ebp+8h]
	movaps	xmm1,xmm0
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	addsd	xmm0,double ptr [432F80h+eax*8]
	mulsd	xmm1,xmm0
	movsd	xmm0,double ptr [432E60h]
	movsd	double ptr [esp],xmm1
	movsd	xmm1,double ptr [432EB0h]
	call	42DAADh
	mov	eax,[ebp+0Ch]
	movd	xmm1,eax
	cvtdq2pd	xmm1,xmm1
	shr	eax,1Fh
	addsd	xmm1,double ptr [432F80h+eax*8]
	mulsd	xmm0,xmm1
	movsd	xmm1,double ptr [esp]
	addsd	xmm1,xmm0
	movsd	xmm0,double ptr [432E60h]
	movsd	double ptr [esp],xmm1
	movsd	xmm1,double ptr [432E90h]
	call	42DAADh
	mov	eax,[ebp+10h]
	movd	xmm1,eax
	cvtdq2pd	xmm1,xmm1
	shr	eax,1Fh
	addsd	xmm1,double ptr [432F80h+eax*8]
	mulsd	xmm0,xmm1
	addsd	xmm0,double ptr [esp]
	call	42D911h
	mov	esp,ebp
	pop	ebp
	ret	0Ch
0041C73F                                              CC                .

;; fn0041C740: 0041C740
;;   Called from:
;;     0041F8E1 (in fn0041EE50)
;;     0041F989 (in fn0041EE50)
;;     0041FA31 (in fn0041EE50)
;;     0041FAD9 (in fn0041EE50)
;;     0041FB81 (in fn0041EE50)
;;     0041FC29 (in fn0041EE50)
;;     0041FCD4 (in fn0041EE50)
;;     0041FE8F (in fn0041EE50)
;;     0041FF78 (in fn0041EE50)
;;     00420020 (in fn0041EE50)
;;     004200C8 (in fn0041EE50)
;;     00420170 (in fn0041EE50)
;;     0042021B (in fn0041EE50)
;;     004202B5 (in fn0041EE50)
;;     0042035D (in fn0041EE50)
;;     00420C95 (in fn004204C0)
;;     00420D7E (in fn004204C0)
;;     00420FA2 (in fn004204C0)
;;     00421389 (in fn004204C0)
;;     004216F5 (in fn00421620)
;;     004217B2 (in fn00421620)
;;     00421859 (in fn00421620)
;;     00421C0A (in fn00421620)
;;     00422453 (in fn00421620)
;;     00422AA6 (in fn00421620)
;;     00422B3F (in fn00421620)
;;     00422BD8 (in fn00421620)
;;     00422C71 (in fn00421620)
;;     00422D0A (in fn00421620)
;;     00422DA3 (in fn00421620)
;;     00426F69 (in fn00426E70)
;;     00427052 (in fn00426E70)
fn0041C740 proc
	push	ebp
	mov	ebp,esp
	and	esp,0F8h
	sub	esp,8h
	movsd	xmm0,double ptr [432E60h]
	movsd	xmm1,double ptr [432ED0h]
	call	42DAADh
	mov	eax,[ebp+8h]
	movd	xmm1,eax
	cvtdq2pd	xmm1,xmm1
	shr	eax,1Fh
	addsd	xmm1,double ptr [432F80h+eax*8]
	mulsd	xmm0,xmm1
	movsd	xmm1,double ptr [432EB0h]
	movsd	double ptr [esp],xmm0
	movsd	xmm0,double ptr [432E60h]
	call	42DAADh
	mov	eax,[ebp+10h]
	movd	xmm1,eax
	cvtdq2pd	xmm1,xmm1
	shr	eax,1Fh
	addsd	xmm1,double ptr [432F80h+eax*8]
	movzx	eax,word ptr [ebp+0Ch]
	mulsd	xmm0,xmm1
	movsd	xmm1,double ptr [esp]
	addsd	xmm1,xmm0
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	addsd	xmm0,xmm1
	call	42D911h
	mov	esp,ebp
	pop	ebp
	ret	0Ch
0041C7D2       CC CC CC CC CC CC CC CC CC CC CC CC CC CC   ..............

;; fn0041C7E0: 0041C7E0
;;   Called from:
;;     00424259 (in fn00424170)
;;     004250B7 (in fn00424170)
;;     0042514E (in fn00424170)
;;     004251E5 (in fn00424170)
;;     0042549C (in fn00424170)
;;     00425533 (in fn00424170)
;;     0042560F (in fn00424170)
;;     004256A6 (in fn00424170)
;;     0042573D (in fn00424170)
;;     004257D4 (in fn00424170)
;;     00425AED (in fn00425A20)
;;     00425B8E (in fn00425A20)
;;     00425C2F (in fn00425A20)
;;     00425CD9 (in fn00425A20)
;;     00425E13 (in fn00425A20)
;;     00426DCC (in fn004262A0)
fn0041C7E0 proc
	push	ebp
	mov	ebp,esp
	and	esp,0F8h
	sub	esp,8h
	movsd	xmm0,double ptr [432E60h]
	movsd	xmm1,double ptr [432EB0h]
	call	42DAADh
	mov	eax,[ebp+8h]
	movaps	xmm1,xmm0
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	addsd	xmm0,double ptr [432F80h+eax*8]
	mulsd	xmm1,xmm0
	movsd	xmm0,double ptr [432E60h]
	movsd	double ptr [esp],xmm1
	movsd	xmm1,double ptr [432E90h]
	call	42DAADh
	mov	eax,[ebp+10h]
	movaps	xmm1,xmm0
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	addsd	xmm0,double ptr [432F80h+eax*8]
	mulsd	xmm1,xmm0
	movsd	xmm0,double ptr [esp]
	addsd	xmm0,xmm1
	movsd	xmm1,double ptr [432E78h]
	movsd	double ptr [esp],xmm0
	movsd	xmm0,double ptr [432E60h]
	call	42DAADh
	mov	eax,[ebp+14h]
	movd	xmm1,eax
	cvtdq2pd	xmm1,xmm1
	shr	eax,1Fh
	addsd	xmm1,double ptr [432F80h+eax*8]
	mulsd	xmm0,xmm1
	movsd	xmm1,double ptr [esp]
	addsd	xmm1,xmm0
	movsd	xmm0,double ptr [432E60h]
	movsd	double ptr [esp],xmm1
	movsd	xmm1,double ptr [432ED0h]
	call	42DAADh
	mov	eax,[ebp+0Ch]
	movd	xmm1,eax
	cvtdq2pd	xmm1,xmm1
	shr	eax,1Fh
	addsd	xmm1,double ptr [432F80h+eax*8]
	mov	eax,[ebp+18h]
	add	eax,eax
	mulsd	xmm0,xmm1
	movsd	xmm1,double ptr [esp]
	addsd	xmm1,xmm0
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	addsd	xmm0,double ptr [432F80h+eax*8]
	addsd	xmm0,xmm1
	call	42D911h
	mov	esp,ebp
	pop	ebp
	ret	14h
0041C901    CC CC CC CC CC CC CC CC CC CC CC CC CC CC CC  ...............

;; fn0041C910: 0041C910
;;   Called from:
;;     0041D0A6 (in fn0041CC60)
;;     0041D0AD (in fn0041CC60)
;;     0041D5D5 (in fn0041D5CF)
;;     0041D5DF (in fn0041D5CF)
;;     0041D5E9 (in fn0041D5CF)
;;     0041D64E (in fn0041D5FE)
;;     0041D658 (in fn0041D5FE)
;;     0041D662 (in fn0041D5FE)
;;     0041D6C7 (in fn0041D5FE)
;;     0041D6CE (in fn0041D5FE)
;;     0041D729 (in fn0041D5FE)
;;     0041D733 (in fn0041D5FE)
;;     0041D73D (in fn0041D5FE)
;;     0041D7A2 (in fn0041D5FE)
;;     0041D7A9 (in fn0041D5FE)
;;     0041D802 (in fn0041D5FE)
;;     0041D80C (in fn0041D5FE)
;;     0041D816 (in fn0041D5FE)
;;     0041D87B (in fn0041D5FE)
;;     0041D885 (in fn0041D5FE)
;;     0041D88F (in fn0041D5FE)
;;     0041D8F2 (in fn0041D5FE)
;;     0041D8F9 (in fn0041D5FE)
;;     0041D903 (in fn0041D5FE)
;;     0041D966 (in fn0041D5FE)
;;     0041D970 (in fn0041D5FE)
;;     0041D97A (in fn0041D5FE)
;;     0041D9DF (in fn0041D5FE)
;;     0041D9E6 (in fn0041D5FE)
;;     0041DA3F (in fn0041D5FE)
;;     0041DA49 (in fn0041D5FE)
;;     0041DA53 (in fn0041D5FE)
;;     0041DAB5 (in fn0041D5FE)
;;     0041DABF (in fn0041D5FE)
;;     0041DAC9 (in fn0041D5FE)
;;     0041DBE8 (in fn0041DAF0)
;;     0041DCC3 (in fn0041DAF0)
;;     0041DD27 (in fn0041DAF0)
;;     0041DDD0 (in fn0041DAF0)
;;     0041DDD9 (in fn0041DAF0)
;;     0041DE12 (in fn0041DAF0)
;;     0041DF62 (in fn0041DAF0)
;;     0041E02A (in fn0041DAF0)
;;     0041E08E (in fn0041DAF0)
;;     0041E199 (in fn0041DAF0)
;;     0041E26D (in fn0041DAF0)
;;     0041E2D1 (in fn0041DAF0)
;;     0041E37A (in fn0041DAF0)
;;     0041E383 (in fn0041DAF0)
;;     0041E3BC (in fn0041DAF0)
;;     0041E50C (in fn0041DAF0)
;;     0041E5D4 (in fn0041DAF0)
;;     0041E638 (in fn0041DAF0)
;;     0041E6DC (in fn0041DAF0)
;;     0041E752 (in fn0041DAF0)
;;     0041E78D (in fn0041DAF0)
;;     0041E803 (in fn0041DAF0)
;;     0041E842 (in fn0041DAF0)
;;     0041E8CD (in fn0041DAF0)
;;     0041E943 (in fn0041DAF0)
;;     0041E982 (in fn0041DAF0)
;;     0041EA1E (in fn0041DAF0)
;;     0041EA91 (in fn0041DAF0)
;;     0041EACC (in fn0041DAF0)
;;     0041EB3F (in fn0041DAF0)
;;     0041EB7E (in fn0041DAF0)
;;     0041EC09 (in fn0041DAF0)
;;     0041EC7C (in fn0041DAF0)
;;     0041ECBB (in fn0041DAF0)
;;     0041ED9A (in fn0041ED20)
;;     0041EDA4 (in fn0041ED20)
;;     0041EEF7 (in fn0041EE50)
;;     0041EF03 (in fn0041EE50)
;;     0041EF0F (in fn0041EE50)
;;     0041EFA5 (in fn0041EE50)
;;     0041EFB1 (in fn0041EE50)
;;     0041EFBD (in fn0041EE50)
;;     0041F053 (in fn0041EE50)
;;     0041F05F (in fn0041EE50)
;;     0041F06B (in fn0041EE50)
;;     0041F101 (in fn0041EE50)
;;     0041F10D (in fn0041EE50)
;;     0041F119 (in fn0041EE50)
;;     0041F1AD (in fn0041EE50)
;;     0041F1B9 (in fn0041EE50)
;;     0041F1C5 (in fn0041EE50)
;;     0041F25B (in fn0041EE50)
;;     0041F267 (in fn0041EE50)
;;     0041F273 (in fn0041EE50)
;;     0041F309 (in fn0041EE50)
;;     0041F315 (in fn0041EE50)
;;     0041F321 (in fn0041EE50)
;;     0041F38A (in fn0041EE50)
;;     0041F39C (in fn0041EE50)
;;     0041F3AE (in fn0041EE50)
;;     0041F41B (in fn0041EE50)
;;     0041F42D (in fn0041EE50)
;;     0041F43F (in fn0041EE50)
;;     0041F4AE (in fn0041EE50)
;;     0041F4C0 (in fn0041EE50)
;;     0041F4D2 (in fn0041EE50)
;;     0041F541 (in fn0041EE50)
;;     0041F553 (in fn0041EE50)
;;     0041F565 (in fn0041EE50)
;;     0041F5D4 (in fn0041EE50)
;;     0041F5E6 (in fn0041EE50)
;;     0041F5F8 (in fn0041EE50)
;;     0041F665 (in fn0041EE50)
;;     0041F677 (in fn0041EE50)
;;     0041F689 (in fn0041EE50)
;;     0041F6F8 (in fn0041EE50)
;;     0041F70A (in fn0041EE50)
;;     0041F71C (in fn0041EE50)
;;     0041F78B (in fn0041EE50)
;;     0041F79D (in fn0041EE50)
;;     0041F7AF (in fn0041EE50)
;;     0041F81E (in fn0041EE50)
;;     0041F830 (in fn0041EE50)
;;     0041F842 (in fn0041EE50)
;;     0041F8AF (in fn0041EE50)
;;     0041F8D9 (in fn0041EE50)
;;     0041F957 (in fn0041EE50)
;;     0041F981 (in fn0041EE50)
;;     0041F9FF (in fn0041EE50)
;;     0041FA29 (in fn0041EE50)
;;     0041FAA7 (in fn0041EE50)
;;     0041FAD1 (in fn0041EE50)
;;     0041FB4F (in fn0041EE50)
;;     0041FB79 (in fn0041EE50)
;;     0041FBF7 (in fn0041EE50)
;;     0041FC21 (in fn0041EE50)
;;     0041FC9F (in fn0041EE50)
;;     0041FCCC (in fn0041EE50)
;;     0041FD37 (in fn0041EE50)
;;     0041FD49 (in fn0041EE50)
;;     0041FD5B (in fn0041EE50)
;;     0041FDCA (in fn0041EE50)
;;     0041FDDC (in fn0041EE50)
;;     0041FDEE (in fn0041EE50)
;;     0041FE5D (in fn0041EE50)
;;     0041FE87 (in fn0041EE50)
;;     0041FF46 (in fn0041EE50)
;;     0041FF70 (in fn0041EE50)
;;     0041FFEE (in fn0041EE50)
;;     00420018 (in fn0041EE50)
;;     00420096 (in fn0041EE50)
;;     004200C0 (in fn0041EE50)
;;     0042013E (in fn0041EE50)
;;     00420168 (in fn0041EE50)
;;     004201E6 (in fn0041EE50)
;;     00420213 (in fn0041EE50)
;;     00420280 (in fn0041EE50)
;;     004202AD (in fn0041EE50)
;;     0042032B (in fn0041EE50)
;;     00420355 (in fn0041EE50)
;;     004203D3 (in fn0041EE50)
;;     004203E5 (in fn0041EE50)
;;     004203F7 (in fn0041EE50)
;;     00420466 (in fn0041EE50)
;;     00420478 (in fn0041EE50)
;;     0042048A (in fn0041EE50)
;;     00420540 (in fn004204C0)
;;     0042054A (in fn004204C0)
;;     00420554 (in fn004204C0)
;;     004205D2 (in fn004204C0)
;;     004205DC (in fn004204C0)
;;     004205E6 (in fn004204C0)
;;     00420664 (in fn004204C0)
;;     0042066E (in fn004204C0)
;;     00420678 (in fn004204C0)
;;     004206F6 (in fn004204C0)
;;     00420700 (in fn004204C0)
;;     0042070A (in fn004204C0)
;;     00420788 (in fn004204C0)
;;     00420792 (in fn004204C0)
;;     0042079C (in fn004204C0)
;;     0042081A (in fn004204C0)
;;     00420824 (in fn004204C0)
;;     0042082E (in fn004204C0)
;;     004208AC (in fn004204C0)
;;     004208B6 (in fn004204C0)
;;     004208C0 (in fn004204C0)
;;     0042093E (in fn004204C0)
;;     00420948 (in fn004204C0)
;;     00420952 (in fn004204C0)
;;     004209D0 (in fn004204C0)
;;     004209DA (in fn004204C0)
;;     004209E4 (in fn004204C0)
;;     00420A62 (in fn004204C0)
;;     00420A6C (in fn004204C0)
;;     00420A76 (in fn004204C0)
;;     00420AF4 (in fn004204C0)
;;     00420AFE (in fn004204C0)
;;     00420B08 (in fn004204C0)
;;     00420B86 (in fn004204C0)
;;     00420B90 (in fn004204C0)
;;     00420B9A (in fn004204C0)
;;     00420C85 (in fn004204C0)
;;     00420C8F (in fn004204C0)
;;     00420D6E (in fn004204C0)
;;     00420D78 (in fn004204C0)
;;     00420F8E (in fn004204C0)
;;     00420F9C (in fn004204C0)
;;     00421002 (in fn004204C0)
;;     0042100C (in fn004204C0)
;;     00421016 (in fn004204C0)
;;     00421094 (in fn004204C0)
;;     0042109E (in fn004204C0)
;;     004210A8 (in fn004204C0)
;;     00421375 (in fn004204C0)
;;     00421383 (in fn004204C0)
;;     00421490 (in fn004204C0)
;;     0042149A (in fn004204C0)
;;     004214A4 (in fn004204C0)
;;     00421522 (in fn004204C0)
;;     0042152C (in fn004204C0)
;;     00421536 (in fn004204C0)
;;     004215B4 (in fn004204C0)
;;     004215BE (in fn004204C0)
;;     004215C8 (in fn004204C0)
;;     004216D2 (in fn00421620)
;;     004216ED (in fn00421620)
;;     0042178A (in fn00421620)
;;     004217AA (in fn00421620)
;;     00421851 (in fn00421620)
;;     0042195D (in fn00421620)
;;     00421B1B (in fn00421620)
;;     00421B77 (in fn00421620)
;;     00421C02 (in fn00421620)
;;     00421C71 (in fn00421620)
;;     00421C83 (in fn00421620)
;;     00421C95 (in fn00421620)
;;     00421D02 (in fn00421620)
;;     00421D14 (in fn00421620)
;;     00421D26 (in fn00421620)
;;     00421D93 (in fn00421620)
;;     00421DA5 (in fn00421620)
;;     00421DB7 (in fn00421620)
;;     00421E24 (in fn00421620)
;;     00421E36 (in fn00421620)
;;     00421E48 (in fn00421620)
;;     00421EB7 (in fn00421620)
;;     00421EC9 (in fn00421620)
;;     00421EDB (in fn00421620)
;;     00421F4A (in fn00421620)
;;     00421F5C (in fn00421620)
;;     00421F6E (in fn00421620)
;;     00421FDF (in fn00421620)
;;     00421FF1 (in fn00421620)
;;     00422062 (in fn00421620)
;;     00422074 (in fn00421620)
;;     004220E5 (in fn00421620)
;;     004220F7 (in fn00421620)
;;     00422168 (in fn00421620)
;;     0042217A (in fn00421620)
;;     004221EB (in fn00421620)
;;     004221FD (in fn00421620)
;;     0042226C (in fn00421620)
;;     0042227E (in fn00421620)
;;     00422290 (in fn00421620)
;;     004222FF (in fn00421620)
;;     00422311 (in fn00421620)
;;     00422323 (in fn00421620)
;;     00422390 (in fn00421620)
;;     004223A2 (in fn00421620)
;;     004223B4 (in fn00421620)
;;     00422421 (in fn00421620)
;;     0042244B (in fn00421620)
;;     004224BA (in fn00421620)
;;     004224CC (in fn00421620)
;;     004224DE (in fn00421620)
;;     0042254D (in fn00421620)
;;     0042255F (in fn00421620)
;;     00422571 (in fn00421620)
;;     004225E0 (in fn00421620)
;;     004225F2 (in fn00421620)
;;     00422604 (in fn00421620)
;;     00422671 (in fn00421620)
;;     00422683 (in fn00421620)
;;     00422695 (in fn00421620)
;;     00422702 (in fn00421620)
;;     00422714 (in fn00421620)
;;     00422726 (in fn00421620)
;;     00422795 (in fn00421620)
;;     004227A7 (in fn00421620)
;;     004227B9 (in fn00421620)
;;     00422828 (in fn00421620)
;;     0042283A (in fn00421620)
;;     0042284C (in fn00421620)
;;     004228BB (in fn00421620)
;;     004228CD (in fn00421620)
;;     004228DF (in fn00421620)
;;     0042294E (in fn00421620)
;;     00422960 (in fn00421620)
;;     00422972 (in fn00421620)
;;     004229E1 (in fn00421620)
;;     004229F3 (in fn00421620)
;;     00422A05 (in fn00421620)
;;     00422A74 (in fn00421620)
;;     00422A9E (in fn00421620)
;;     00422B0D (in fn00421620)
;;     00422B37 (in fn00421620)
;;     00422BA6 (in fn00421620)
;;     00422BD0 (in fn00421620)
;;     00422C3F (in fn00421620)
;;     00422C69 (in fn00421620)
;;     00422CD8 (in fn00421620)
;;     00422D02 (in fn00421620)
;;     00422D71 (in fn00421620)
;;     00422D9B (in fn00421620)
;;     00422E59 (in fn00421620)
;;     00422E6B (in fn00421620)
;;     00422E7D (in fn00421620)
;;     00422EEA (in fn00421620)
;;     00422EFC (in fn00421620)
;;     00422F0E (in fn00421620)
;;     00422F7B (in fn00421620)
;;     00422F8D (in fn00421620)
;;     00422F9F (in fn00421620)
;;     0042300E (in fn00421620)
;;     00423020 (in fn00421620)
;;     00423032 (in fn00421620)
;;     004230A1 (in fn00421620)
;;     004230B3 (in fn00421620)
;;     004230C5 (in fn00421620)
;;     00423134 (in fn00421620)
;;     00423146 (in fn00421620)
;;     00423158 (in fn00421620)
;;     004231C7 (in fn00421620)
;;     004231D9 (in fn00421620)
;;     004231EB (in fn00421620)
;;     0042325A (in fn00421620)
;;     0042326C (in fn00421620)
;;     0042327E (in fn00421620)
;;     004232ED (in fn00421620)
;;     004232FF (in fn00421620)
;;     00423311 (in fn00421620)
;;     00423380 (in fn00421620)
;;     00423392 (in fn00421620)
;;     004233A4 (in fn00421620)
;;     00423415 (in fn00421620)
;;     00423427 (in fn00421620)
;;     00423498 (in fn00421620)
;;     004234AA (in fn00421620)
;;     0042351B (in fn00421620)
;;     0042352D (in fn00421620)
;;     0042359E (in fn00421620)
;;     004235B0 (in fn00421620)
;;     0042361C (in fn00421620)
;;     0042362E (in fn00421620)
;;     0042388A (in fn004237A0)
;;     004238D1 (in fn004237A0)
;;     00423926 (in fn004237A0)
;;     0042396D (in fn004237A0)
;;     004239C2 (in fn004237A0)
;;     00423A0D (in fn004237A0)
;;     00423A74 (in fn004237A0)
;;     00423AE0 (in fn004237A0)
;;     00423B4C (in fn004237A0)
;;     00423BFB (in fn004237A0)
;;     00423C67 (in fn004237A0)
;;     00423CCE (in fn004237A0)
;;     00423D03 (in fn004237A0)
;;     00423D6A (in fn004237A0)
;;     00423DD6 (in fn004237A0)
;;     00423E42 (in fn004237A0)
;;     00423EAE (in fn004237A0)
;;     00423F2C (in fn004237A0)
;;     00423F9A (in fn004237A0)
;;     00423FD9 (in fn004237A0)
;;     00424068 (in fn004237A0)
;;     00424218 (in fn00424170)
;;     00424225 (in fn00424170)
;;     0042423C (in fn00424170)
;;     00424248 (in fn00424170)
;;     00424251 (in fn00424170)
;;     004242C4 (in fn00424170)
;;     004242D1 (in fn00424170)
;;     0042434C (in fn00424170)
;;     004243B9 (in fn00424170)
;;     004243C6 (in fn00424170)
;;     00424461 (in fn00424170)
;;     00424473 (in fn00424170)
;;     004244B5 (in fn00424170)
;;     00424508 (in fn00424170)
;;     004245F7 (in fn00424170)
;;     00424608 (in fn00424170)
;;     00424670 (in fn00424170)
;;     004246B6 (in fn00424170)
;;     004247A3 (in fn00424170)
;;     004247B4 (in fn00424170)
;;     0042481C (in fn00424170)
;;     00424862 (in fn00424170)
;;     0042494F (in fn00424170)
;;     00424960 (in fn00424170)
;;     004249C8 (in fn00424170)
;;     00424A0E (in fn00424170)
;;     00424AF7 (in fn00424170)
;;     00424B0B (in fn00424170)
;;     00424B6F (in fn00424170)
;;     00424B83 (in fn00424170)
;;     00424BE7 (in fn00424170)
;;     00424BFB (in fn00424170)
;;     00424C5F (in fn00424170)
;;     00424C73 (in fn00424170)
;;     00424CD5 (in fn00424170)
;;     00424CE9 (in fn00424170)
;;     00424D4B (in fn00424170)
;;     00424D5F (in fn00424170)
;;     00424DC1 (in fn00424170)
;;     00424DD3 (in fn00424170)
;;     00424DE5 (in fn00424170)
;;     00424E47 (in fn00424170)
;;     00424E59 (in fn00424170)
;;     00424E6B (in fn00424170)
;;     00424ECF (in fn00424170)
;;     00424EE1 (in fn00424170)
;;     00424EFC (in fn00424170)
;;     00424F5D (in fn00424170)
;;     00424F6F (in fn00424170)
;;     00424F8A (in fn00424170)
;;     00424FEB (in fn00424170)
;;     00424FFD (in fn00424170)
;;     00425018 (in fn00424170)
;;     00425079 (in fn00424170)
;;     0042508B (in fn00424170)
;;     0042509D (in fn00424170)
;;     004250AF (in fn00424170)
;;     00425110 (in fn00424170)
;;     00425122 (in fn00424170)
;;     00425134 (in fn00424170)
;;     00425146 (in fn00424170)
;;     004251A7 (in fn00424170)
;;     004251B9 (in fn00424170)
;;     004251CB (in fn00424170)
;;     004251DD (in fn00424170)
;;     0042523C (in fn00424170)
;;     0042524E (in fn00424170)
;;     00425260 (in fn00424170)
;;     004252C4 (in fn00424170)
;;     004252D6 (in fn00424170)
;;     004252E8 (in fn00424170)
;;     0042534C (in fn00424170)
;;     0042535E (in fn00424170)
;;     00425370 (in fn00424170)
;;     004253D4 (in fn00424170)
;;     004253E6 (in fn00424170)
;;     004253F8 (in fn00424170)
;;     0042545E (in fn00424170)
;;     00425470 (in fn00424170)
;;     00425482 (in fn00424170)
;;     00425494 (in fn00424170)
;;     004254F5 (in fn00424170)
;;     00425507 (in fn00424170)
;;     00425519 (in fn00424170)
;;     0042552B (in fn00424170)
;;     004255D1 (in fn00424170)
;;     004255E3 (in fn00424170)
;;     004255F5 (in fn00424170)
;;     00425607 (in fn00424170)
;;     00425668 (in fn00424170)
;;     0042567A (in fn00424170)
;;     0042568C (in fn00424170)
;;     0042569E (in fn00424170)
;;     004256FF (in fn00424170)
;;     00425711 (in fn00424170)
;;     00425723 (in fn00424170)
;;     00425735 (in fn00424170)
;;     00425796 (in fn00424170)
;;     004257A8 (in fn00424170)
;;     004257BA (in fn00424170)
;;     004257CC (in fn00424170)
;;     0042582B (in fn00424170)
;;     0042583D (in fn00424170)
;;     0042584F (in fn00424170)
;;     004258B4 (in fn00424170)
;;     004258C6 (in fn00424170)
;;     004258D8 (in fn00424170)
;;     0042593F (in fn00424170)
;;     00425951 (in fn00424170)
;;     00425963 (in fn00424170)
;;     004259C5 (in fn00424170)
;;     004259D7 (in fn00424170)
;;     004259E9 (in fn00424170)
;;     00425AC9 (in fn00425A20)
;;     00425AD0 (in fn00425A20)
;;     00425AD7 (in fn00425A20)
;;     00425ADE (in fn00425A20)
;;     00425AE7 (in fn00425A20)
;;     00425B6A (in fn00425A20)
;;     00425B7A (in fn00425A20)
;;     00425B81 (in fn00425A20)
;;     00425B88 (in fn00425A20)
;;     00425C0D (in fn00425A20)
;;     00425C14 (in fn00425A20)
;;     00425C22 (in fn00425A20)
;;     00425C29 (in fn00425A20)
;;     00425CB5 (in fn00425A20)
;;     00425CBC (in fn00425A20)
;;     00425CC3 (in fn00425A20)
;;     00425CCA (in fn00425A20)
;;     00425CD3 (in fn00425A20)
;;     00425D55 (in fn00425A20)
;;     00425D5C (in fn00425A20)
;;     00425D63 (in fn00425A20)
;;     00425DEF (in fn00425A20)
;;     00425DF6 (in fn00425A20)
;;     00425DFD (in fn00425A20)
;;     00425E04 (in fn00425A20)
;;     00425E0D (in fn00425A20)
;;     00425E8F (in fn00425A20)
;;     00425E96 (in fn00425A20)
;;     00425E9D (in fn00425A20)
;;     00425F1F (in fn00425A20)
;;     00425F26 (in fn00425A20)
;;     00425F2D (in fn00425A20)
;;     00425FAF (in fn00425A20)
;;     00425FB6 (in fn00425A20)
;;     00425FBD (in fn00425A20)
;;     00426042 (in fn00425A20)
;;     00426049 (in fn00425A20)
;;     00426050 (in fn00425A20)
;;     004260D5 (in fn00425A20)
;;     004260DC (in fn00425A20)
;;     004260E3 (in fn00425A20)
;;     00426168 (in fn00425A20)
;;     0042616F (in fn00425A20)
;;     00426176 (in fn00425A20)
;;     004261FB (in fn00425A20)
;;     00426202 (in fn00425A20)
;;     00426209 (in fn00425A20)
;;     00426342 (in fn004262A0)
;;     0042634B (in fn004262A0)
;;     004263B3 (in fn004262A0)
;;     004263BC (in fn004262A0)
;;     00426422 (in fn004262A0)
;;     0042642B (in fn004262A0)
;;     00426493 (in fn004262A0)
;;     0042649C (in fn004262A0)
;;     00426504 (in fn004262A0)
;;     0042650D (in fn004262A0)
;;     00426573 (in fn004262A0)
;;     0042657C (in fn004262A0)
;;     004265E4 (in fn004262A0)
;;     004265ED (in fn004262A0)
;;     00426655 (in fn004262A0)
;;     0042665E (in fn004262A0)
;;     004266C6 (in fn004262A0)
;;     004266CF (in fn004262A0)
;;     00426735 (in fn004262A0)
;;     0042673E (in fn004262A0)
;;     004267A7 (in fn004262A0)
;;     004267AE (in fn004262A0)
;;     004267B5 (in fn004262A0)
;;     00426821 (in fn004262A0)
;;     00426828 (in fn004262A0)
;;     0042682F (in fn004262A0)
;;     0042693A (in fn004262A0)
;;     00426941 (in fn004262A0)
;;     00426948 (in fn004262A0)
;;     004269B1 (in fn004262A0)
;;     004269B8 (in fn004262A0)
;;     004269BF (in fn004262A0)
;;     00426A2A (in fn004262A0)
;;     00426A31 (in fn004262A0)
;;     00426A3F (in fn004262A0)
;;     00426AA7 (in fn004262A0)
;;     00426AAE (in fn004262A0)
;;     00426AB5 (in fn004262A0)
;;     00426B1B (in fn004262A0)
;;     00426B24 (in fn004262A0)
;;     00426B8A (in fn004262A0)
;;     00426B93 (in fn004262A0)
;;     00426BF9 (in fn004262A0)
;;     00426C02 (in fn004262A0)
;;     00426DB1 (in fn004262A0)
;;     00426DB8 (in fn004262A0)
;;     00426DBF (in fn004262A0)
;;     00426DC6 (in fn004262A0)
;;     00426F59 (in fn00426E70)
;;     00426F63 (in fn00426E70)
;;     00427042 (in fn00426E70)
;;     0042704C (in fn00426E70)
;;     004270AF (in fn00426E70)
;;     004270B9 (in fn00426E70)
;;     004270C3 (in fn00426E70)
;;     00427141 (in fn00426E70)
;;     0042714B (in fn00426E70)
;;     00427155 (in fn00426E70)
fn0041C910 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42F528h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,20h
	mov	eax,[43A008h]
	xor	eax,ebp
	mov	[ebp-10h],eax
	push	ebx
	push	esi
	push	edi
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	eax,[ebp+8h]
	xor	edx,edx
	mov	esi,eax
	mov	ecx,[eax+14h]
	cmp	ecx,10h
	jc	41C94Ch

l0041C94A:
	mov	esi,[eax]

l0041C94C:
	cmp	byte ptr [esi],73h
	jnz	41C967h

l0041C951:
	mov	esi,eax
	cmp	ecx,10h
	jc	41C95Ah

l0041C958:
	mov	esi,[eax]

l0041C95A:
	cmp	byte ptr [esi+1h],70h
	jnz	41C967h

l0041C960:
	mov	edx,2h
	jmp	41C988h

l0041C967:
	mov	esi,eax
	cmp	ecx,10h
	jc	41C970h

l0041C96E:
	mov	esi,[eax]

l0041C970:
	cmp	byte ptr [esi],63h
	jz	41C983h

l0041C975:
	mov	esi,eax
	cmp	ecx,10h
	jc	41C97Eh

l0041C97C:
	mov	esi,[eax]

l0041C97E:
	cmp	byte ptr [esi],66h
	jnz	41C988h

l0041C983:
	mov	edx,1h

l0041C988:
	mov	edi,eax
	cmp	ecx,10h
	jc	41C991h

l0041C98F:
	mov	edi,[eax]

l0041C991:
	cmp	byte ptr [edi+edx],72h
	lea	esi,[edx+1h]
	mov	dword ptr [ebp-1Ch],0h
	cmovnz	esi,edx

l0041C9A2:
	mov	dword ptr [ebp-18h],0Fh
	mov	edx,[eax+10h]
	mov	byte ptr [ebp-2Ch],0h
	cmp	edx,esi
	jc	41CA7Eh

l0041C9B8:
	sub	edx,esi
	or	edi,0FFh
	cmp	edx,0FFh
	cmovc	edi,edx

l0041C9C3:
	cmp	ecx,10h
	jc	41C9CAh

l0041C9C8:
	mov	eax,[eax]

l0041C9CA:
	push	edi
	add	eax,esi
	lea	ecx,[ebp-2Ch]
	push	eax
	call	402A70h
	mov	dword ptr [ebp-4h],0h
	call	dword ptr [43129Ch]
	cmp	dword ptr [ebp-18h],10h
	lea	esi,[ebp-2Ch]
	mov	edi,eax
	lea	eax,[ebp-14h]
	cmovnc	esi,[ebp-2Ch]

l0041C9F3:
	push	0Ah
	push	eax
	push	esi
	mov	dword ptr [edi],0h
	call	dword ptr [431200h]
	add	esp,0Ch
	mov	ebx,eax
	cmp	esi,[ebp-14h]
	jnz	41CA18h

l0041CA0D:
	push	431878h
	call	dword ptr [431134h]

l0041CA18:
	cmp	dword ptr [edi],22h
	jz	41CA73h

l0041CA1D:
	mov	edx,[ebp-18h]
	cmp	edx,10h
	jc	41CA53h

l0041CA25:
	mov	ecx,[ebp-2Ch]
	inc	edx
	mov	eax,ecx
	cmp	edx,1000h
	jc	41CA49h

l0041CA33:
	mov	ecx,[ecx-4h]
	add	edx,23h
	sub	eax,ecx
	add	eax,0FCh
	cmp	eax,1Fh
	jbe	41CA49h

l0041CA43:
	call	dword ptr [431290h]

l0041CA49:
	push	edx
	push	ecx
	call	42763Fh
	add	esp,8h

l0041CA53:
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

l0041CA73:
	push	431890h
	call	dword ptr [43119Ch]

l0041CA7E:
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

;; fn0041CA90: 0041CA90
;;   Called from:
;;     0041D0EA (in fn0041CC60)
fn0041CA90 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42F570h
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
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-10h],esp
	push	2h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	4326F8h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],0h
	mov	edi,[ebp+8h]
	mov	ecx,esp
	push	edi
	call	4028D0h
	mov	ecx,esi
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	41CB12h

;; fn0041CB05: 0041CB05
;;   Called from:
;;     0041CB03 (in fn0041CA90)
;;     0041CB03 (in fn0041C910)
fn0041CB05 proc
	add	dword ptr [esi+60h],20h
	mov	dword ptr [esi+6Ch],9h
	jmp	41CB85h

;; fn0041CB12: 0041CB12
;;   Called from:
;;     0041CB03 (in fn0041CA90)
;;     0041CB03 (in fn0041C910)
;;     0041CB10 (in fn0041CB05)
fn0041CB12 proc
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	3h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	4326FCh
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],1h
	mov	ecx,esp
	push	edi
	call	4028D0h
	mov	ecx,esi
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	41CB6Bh

l0041CB5B:
	add	dword ptr [esi+60h],420h
	mov	dword ptr [esi+6Ch],0Bh
	jmp	41CB85h

l0041CB6B:
	mov	edx,1Ah
	call	427210h
	mulsd	xmm0,double ptr [432E68h]
	call	42D911h
	sub	[esi+60h],eax

l0041CB85:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	1h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432700h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],2h
	mov	ecx,esp
	push	edi
	call	4028D0h
	mov	ecx,esi
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	41CBD1h

l0041CBCE:
	inc	dword ptr [esi+60h]

l0041CBD1:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	1h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432704h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],3h
	mov	ecx,esp
	push	edi
	call	4028D0h
	mov	ecx,esi
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	41CC47h

l0041CC1A:
	mov	edx,15h
	call	427210h
	mov	eax,[esi+60h]
	movd	xmm1,eax
	cvtdq2pd	xmm1,xmm1
	shr	eax,1Fh
	addsd	xmm1,double ptr [432F80h+eax*8]
	addsd	xmm0,xmm1
	call	42D911h
	mov	[esi+60h],eax

l0041CC47:
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	mov	esp,ebp
	pop	ebp
	ret	4h
0041CC5A                               CC CC CC CC CC CC           ......

;; fn0041CC60: 0041CC60
;;   Called from:
;;     0041B081 (in fn0041AEF0)
fn0041CC60 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42F65Ch
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
	mov	edi,ecx
	mov	ebx,[ebp+8h]
	mov	edx,1Ah
	mov	dword ptr [ebp-1Ch],0h
	call	427210h
	movsd	double ptr [ebp-28h],xmm0
	mulsd	xmm0,double ptr [432EC0h]
	call	42D911h
	sub	esp,18h
	mov	[edi+60h],eax
	mov	ecx,esp
	mov	[ebp-18h],esp
	mov	dword ptr [edi+6Ch],4h
	push	3h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432708h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],0h
	mov	ecx,esp
	push	dword ptr [ebx]
	call	4028D0h
	mov	ecx,edi
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	41CD18h

l0041CD07:
	push	2h
	push	0Ch
	call	41C600h
	add	[edi+60h],eax
	jmp	41D0E0h

l0041CD18:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-18h],esp
	push	3h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	43270Ch
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],1h
	mov	ecx,esp
	push	dword ptr [ebx]
	call	4028D0h
	mov	ecx,edi
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	41CD73h

l0041CD62:
	push	2h
	push	4h
	call	41C600h
	add	[edi+60h],eax
	jmp	41D0E0h

l0041CD73:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-18h],esp
	push	3h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432710h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],2h
	mov	ecx,esp
	push	dword ptr [ebx]
	call	4028D0h
	mov	ecx,edi
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	41CDCEh

l0041CDBD:
	push	0h
	push	0Ch
	call	41C600h
	add	[edi+60h],eax
	jmp	41D0E0h

l0041CDCE:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-18h],esp
	push	3h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432714h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],3h
	mov	ecx,esp
	push	dword ptr [ebx]
	call	4028D0h
	mov	ecx,edi
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	41CE29h

l0041CE18:
	push	0h
	push	4h
	call	41C600h
	add	[edi+60h],eax
	jmp	41D0E0h

l0041CE29:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-18h],esp
	push	3h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432718h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],4h
	mov	ecx,esp
	push	dword ptr [ebx]
	call	4028D0h
	mov	ecx,edi
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	41CE84h

l0041CE73:
	push	1h
	push	0Ch
	call	41C600h
	add	[edi+60h],eax
	jmp	41D0E0h

l0041CE84:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-18h],esp
	push	3h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	43271Ch
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],5h
	mov	ecx,esp
	push	dword ptr [ebx]
	call	4028D0h
	mov	ecx,edi
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	41CEDFh

l0041CECE:
	push	1h
	push	4h
	call	41C600h
	add	[edi+60h],eax
	jmp	41D0E0h

l0041CEDF:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-18h],esp
	push	3h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432720h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],6h
	mov	ecx,esp
	push	dword ptr [ebx]
	call	4028D0h
	mov	ecx,edi
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	41CF3Ah

l0041CF29:
	push	0h
	push	12h
	call	41C600h
	add	[edi+60h],eax
	jmp	41D0E0h

l0041CF3A:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-18h],esp
	push	4h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432724h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],7h
	mov	ecx,esp
	push	dword ptr [ebx]
	call	4028D0h
	mov	ecx,edi
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	41CF95h

l0041CF84:
	push	0h
	push	10h
	call	41C600h
	add	[edi+60h],eax
	jmp	41D0E0h

l0041CF95:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-18h],esp
	push	4h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	43272Ch
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],8h
	mov	ecx,esp
	push	dword ptr [ebx]
	call	4028D0h
	mov	ecx,edi
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	41CFF4h

l0041CFDF:
	push	0h
	push	14h
	call	41C600h
	add	[edi+60h],eax
	add	dword ptr [edi+64h],0FDh
	jmp	41D0E0h

l0041CFF4:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-18h],esp
	push	3h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432734h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],9h
	mov	ecx,esp
	push	dword ptr [ebx]
	call	4028D0h
	mov	ecx,edi
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	41D053h

l0041D03E:
	push	0h
	push	14h
	call	41C600h
	add	[edi+60h],eax
	add	dword ptr [edi+64h],0FEh
	jmp	41D0E0h

l0041D053:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-18h],esp
	push	2h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432738h
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
	jz	41D0C4h

l0041D09D:
	mov	eax,[ebx]
	lea	ecx,[eax+30h]
	push	ecx
	lea	esi,[eax+18h]
	call	41C910h
	push	eax
	push	esi
	call	41C910h
	push	eax
	call	41C600h
	add	[edi+60h],eax
	mov	dword ptr [edi+6Ch],4h
	jmp	41D0E0h

l0041D0C4:
	movsd	xmm0,double ptr [ebp-28h]
	mulsd	xmm0,double ptr [432EB8h]
	call	42D911h
	mov	[edi+60h],eax
	mov	dword ptr [edi+6Ch],0h

l0041D0E0:
	cmp	dword ptr [edi+6Ch],0h
	jz	41D0F1h

l0041D0E6:
	push	dword ptr [ebx]
	mov	ecx,edi
	call	41CA90h
	jmp	41D13Eh

l0041D0F1:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-18h],esp
	push	2h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	43273Ch
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
	jz	41D13Eh

l0041D13B:
	inc	dword ptr [edi+60h]

l0041D13E:
	mov	eax,[edi+60h]
	and	eax,0FC000000h
	cmp	eax,4C000000h
	jz	41D213h

l0041D151:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-18h],esp
	push	1h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432740h
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
	jz	41D19Fh

l0041D19B:
	add	dword ptr [edi+60h],2h

l0041D19F:
	mov	ecx,[ebx+4h]
	mov	eax,2AAAAAABh
	mov	esi,[ebx]
	sub	ecx,esi
	imul	ecx
	sar	edx,2h
	mov	eax,edx
	shr	eax,1Fh
	add	eax,edx
	cmp	eax,2h
	jbe	41D213h

l0041D1BC:
	mov	ecx,[esi+28h]
	lea	eax,[esi+18h]
	test	ecx,ecx
	jz	41D52Bh

l0041D1CA:
	mov	edx,[eax+14h]
	mov	esi,eax
	cmp	edx,10h
	jc	41D1D6h

l0041D1D4:
	mov	esi,[eax]

l0041D1D6:
	cmp	byte ptr [esi],63h
	jnz	41D213h

l0041D1DB:
	cmp	ecx,1h
	jbe	41D530h

l0041D1E4:
	mov	esi,eax
	cmp	edx,10h
	jc	41D1EDh

l0041D1EB:
	mov	esi,[eax]

l0041D1ED:
	cmp	byte ptr [esi+1h],72h
	jnz	41D213h

l0041D1F3:
	cmp	ecx,2h
	jbe	41D535h

l0041D1FC:
	cmp	edx,10h
	jc	41D203h

l0041D201:
	mov	eax,[eax]

l0041D203:
	movsx	ecx,byte ptr [eax+2h]
	add	ecx,3FD0h
	shl	ecx,12h
	or	[edi+60h],ecx

l0041D213:
	mov	ecx,[ebx+4h]
	mov	eax,2AAAAAABh
	sub	ecx,[ebx]
	imul	ecx
	sar	edx,2h
	mov	esi,edx
	shr	esi,1Fh
	add	esi,edx
	cmp	esi,1h
	jbe	41D50Dh

l0041D232:
	push	1h
	mov	dword ptr [ebp-4h],0Dh
	call	dword ptr [4311A8h]
	add	esp,4h
	mov	[ebp-24h],eax
	mov	dword ptr [ebp-4h],0Eh
	lea	eax,[esi-1h]
	mov	ecx,[ebx]
	lea	eax,[eax+eax*2]
	shl	eax,3h
	mov	edx,2h
	add	ecx,eax
	mov	dword ptr [ebp-48h],0h
	mov	dword ptr [ebp-44h],0Fh
	mov	byte ptr [ebp-58h],0h
	mov	dword ptr [ebp-1Ch],1h
	cmp	[ecx+10h],edx
	mov	[ebp-14h],eax
	cmovc	edx,[ecx+10h]

l0041D283:
	cmp	dword ptr [ecx+14h],10h
	jc	41D28Bh

l0041D289:
	mov	ecx,[ecx]

l0041D28B:
	push	edx
	push	ecx
	lea	ecx,[ebp-58h]
	call	402A70h
	mov	eax,13h
	mov	dword ptr [ebp-4h],0Fh
	mov	[ebp-18h],eax
	lea	ecx,[ebp-58h]
	mov	[ebp-1Ch],eax
	mov	edx,432744h
	lea	eax,[ebp-28h]
	push	eax
	call	411F00h
	add	esp,4h
	test	al,al
	jnz	41D34Ch

l0041D2C3:
	push	1h
	mov	dword ptr [ebp-4h],10h
	call	dword ptr [4311A8h]
	mov	esi,eax
	add	esp,4h
	mov	[ebp-5Ch],esi
	mov	dword ptr [ebp-4h],11h
	mov	edx,3h
	mov	ecx,[ebx]
	add	ecx,[ebp-14h]
	mov	dword ptr [ebp-30h],0h
	mov	dword ptr [ebp-2Ch],0Fh
	mov	byte ptr [ebp-40h],0h
	cmp	[ecx+10h],edx
	mov	dword ptr [ebp-1Ch],17h
	cmovc	edx,[ecx+10h]

l0041D30B:
	cmp	dword ptr [ecx+14h],10h
	jc	41D313h

l0041D311:
	mov	ecx,[ecx]

l0041D313:
	push	edx
	push	ecx
	lea	ecx,[ebp-40h]
	call	402A70h
	mov	eax,3Fh
	mov	dword ptr [ebp-4h],12h
	mov	[ebp-18h],eax
	lea	ecx,[ebp-40h]
	mov	[ebp-1Ch],eax
	mov	edx,432748h
	lea	eax,[ebp-60h]
	push	eax
	call	411F00h
	add	esp,4h
	test	al,al
	jnz	41D34Fh

l0041D347:
	mov	[ebp-1Dh],al
	jmp	41D353h

l0041D34C:
	mov	esi,[ebp-5Ch]

l0041D34F:
	mov	byte ptr [ebp-1Dh],1h

l0041D353:
	mov	dword ptr [ebp-4h],11h
	mov	eax,[ebp-18h]
	test	al,8h
	jz	41D3B2h

l0041D361:
	mov	edx,[ebp-2Ch]
	and	eax,0F7h
	mov	[ebp-18h],eax
	cmp	edx,10h
	jc	41D3A0h

l0041D36F:
	mov	ecx,[ebp-40h]
	inc	edx
	mov	eax,ecx
	cmp	edx,1000h
	jc	41D393h

l0041D37D:
	mov	ecx,[ecx-4h]
	add	edx,23h
	sub	eax,ecx
	add	eax,0FCh
	cmp	eax,1Fh
	jbe	41D393h

l0041D38D:
	call	dword ptr [431290h]

l0041D393:
	push	edx
	push	ecx
	call	42763Fh
	mov	eax,[ebp-18h]
	add	esp,8h

l0041D3A0:
	mov	dword ptr [ebp-30h],0h
	mov	dword ptr [ebp-2Ch],0Fh
	mov	byte ptr [ebp-40h],0h

l0041D3B2:
	test	al,4h
	jz	41D3DAh

l0041D3B6:
	and	eax,0FBh
	mov	[ebp-1Ch],eax
	mov	dword ptr [ebp-4h],13h
	test	esi,esi
	jz	41D3DAh

l0041D3C7:
	mov	eax,[esi]
	mov	ecx,esi
	call	dword ptr [eax+8h]
	test	eax,eax
	jz	41D3DAh

l0041D3D2:
	mov	edx,[eax]
	mov	ecx,eax
	push	1h
	call	dword ptr [edx]

l0041D3DA:
	mov	dword ptr [ebp-4h],0Eh
	mov	edx,[ebp-44h]
	cmp	edx,10h
	jc	41D417h

l0041D3E9:
	mov	ecx,[ebp-58h]
	inc	edx
	mov	eax,ecx
	cmp	edx,1000h
	jc	41D40Dh

l0041D3F7:
	mov	ecx,[ecx-4h]
	add	edx,23h
	sub	eax,ecx
	add	eax,0FCh
	cmp	eax,1Fh
	jbe	41D40Dh

l0041D407:
	call	dword ptr [431290h]

l0041D40D:
	push	edx
	push	ecx
	call	42763Fh
	add	esp,8h

l0041D417:
	mov	dword ptr [ebp-48h],0h
	mov	dword ptr [ebp-44h],0Fh
	mov	byte ptr [ebp-58h],0h
	mov	dword ptr [ebp-4h],14h
	mov	ecx,[ebp-24h]
	test	ecx,ecx
	jz	41D448h

l0041D437:
	mov	eax,[ecx]
	call	dword ptr [eax+8h]
	test	eax,eax
	jz	41D448h

l0041D440:
	mov	edx,[eax]
	mov	ecx,eax
	push	1h
	call	dword ptr [edx]

l0041D448:
	cmp	byte ptr [ebp-1Dh],0h
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	jz	41D4EEh

l0041D459:
	mov	ebx,[ebx]
	add	ebx,[ebp-14h]
	call	dword ptr [43129Ch]
	cmp	dword ptr [ebx+14h],10h
	mov	[ebp-18h],eax
	jc	41D46Fh

l0041D46D:
	mov	ebx,[ebx]

l0041D46F:
	mov	dword ptr [eax],0h
	lea	eax,[ebp-14h]
	push	10h
	push	eax
	push	ebx
	call	dword ptr [431200h]
	add	esp,0Ch
	mov	esi,eax
	cmp	ebx,[ebp-14h]
	jnz	41D497h

l0041D48C:
	push	431878h
	call	dword ptr [431134h]

l0041D497:
	mov	eax,[ebp-18h]
	cmp	dword ptr [eax],22h
	jz	41D4E3h

l0041D49F:
	cmp	dword ptr [edi+6Ch],0h
	jnz	41D4B0h

l0041D4A5:
	and	esi,3FFFFFCh
	or	[edi+60h],esi
	jmp	41D50Dh

l0041D4B0:
	test	esi,esi
	jns	41D4D3h

l0041D4B4:
	mov	edx,15h
	call	427210h
	call	42D911h
	xor	eax,[edi+60h]
	and	esi,0FFFCh
	or	esi,eax
	mov	[edi+60h],esi
	jmp	41D50Dh

l0041D4D3:
	mov	eax,[edi+60h]
	and	esi,0FFFCh
	or	esi,eax
	mov	[edi+60h],esi
	jmp	41D50Dh

l0041D4E3:
	push	431890h
	call	dword ptr [43119Ch]

l0041D4EE:
	mov	eax,[ebx]
	lea	ecx,[edi+70h]
	add	eax,[ebp-14h]
	cmp	ecx,eax
	jz	41D50Dh

l0041D4FA:
	cmp	dword ptr [eax+14h],10h
	mov	edx,eax
	jc	41D504h

l0041D502:
	mov	edx,[eax]

l0041D504:
	push	dword ptr [eax+10h]
	push	edx
	call	402A70h

l0041D50D:
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

l0041D52B:
	call	4113B0h

l0041D530:
	call	4113B0h

l0041D535:
	call	4113B0h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h
	int	3h

;; fn0041D540: 0041D540
;;   Called from:
;;     0041B1D3 (in fn0041AEF0)
fn0041D540 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42F6F0h
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
	mov	ebx,ecx
	mov	edx,1Ah
	call	427210h
	mulsd	xmm0,double ptr [432EC0h]
	call	42D911h
	sub	esp,18h
	mov	[ebx+60h],eax
	mov	ecx,esp
	mov	[ebp-10h],esp
	push	5h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	43274Ch
	mov	byte ptr [ecx],0h
	call	402A70h
	mov	dword ptr [ebp-4h],0h
	sub	esp,18h
	mov	esi,[ebp+8h]
	mov	ecx,esp
	push	dword ptr [esi]
	call	4028D0h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	41D5FEh

;; fn0041D5CF: 0041D5CF
;;   Called from:
;;     0041D5CD (in fn0041D540)
;;     0041D5CD (in fn0041CC60)
fn0041D5CF proc
	mov	esi,[esi]
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
	add	eax,202h
	jmp	41DAD9h

;; fn0041D5FE: 0041D5FE
;;   Called from:
;;     0041D5CD (in fn0041D540)
;;     0041D5CD (in fn0041CC60)
;;     0041D5F9 (in fn0041D5CF)
fn0041D5FE proc
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	4h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432754h
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
	jz	41D677h

l0041D648:
	mov	esi,[esi]
	lea	eax,[esi+48h]
	push	eax
	call	41C910h
	push	eax
	lea	eax,[esi+30h]
	push	eax
	call	41C910h
	push	eax
	lea	eax,[esi+18h]

l0041D661:
	push	eax
	call	41C910h
	push	eax
	call	41C680h
	add	eax,382h
	jmp	41DAD9h

l0041D677:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	6h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	43275Ch
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
	jz	41D6D9h

l0041D6C1:
	mov	edi,[esi]
	lea	esi,[edi+30h]
	push	esi
	call	41C910h
	push	eax
	push	esi
	call	41C910h
	push	eax
	lea	eax,[edi+18h]
	jmp	41D661h

l0041D6D9:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	5h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432764h
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
	jz	41D752h

l0041D723:
	mov	esi,[esi]
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

l0041D73D:
	call	41C910h
	push	eax
	call	41C680h
	add	eax,182h
	jmp	41DAD9h

l0041D752:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	5h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	43276Ch
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
	jz	41D7B2h

l0041D79C:
	mov	esi,[esi]
	add	esi,18h
	push	esi
	call	41C910h
	push	eax
	push	esi
	call	41C910h
	push	eax
	push	esi
	jmp	41D73Dh

l0041D7B2:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	6h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432774h
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
	jz	41D82Bh

l0041D7FC:
	mov	esi,[esi]
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
	add	eax,1C2h
	jmp	41DAD9h

l0041D82B:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	5h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	43277Ch
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
	jz	41D8A2h

l0041D875:
	mov	esi,[esi]
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
	add	eax,42h
	jmp	41DAD9h

l0041D8A2:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	5h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432784h
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
	jz	41D916h

l0041D8EC:
	mov	edi,[esi]
	lea	esi,[edi+30h]
	push	esi
	call	41C910h
	push	eax
	push	esi
	call	41C910h
	push	eax
	lea	eax,[edi+18h]
	push	eax
	call	41C910h
	push	eax
	call	41C680h
	add	eax,42h
	jmp	41DAD9h

l0041D916:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	5h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	43278Ch
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
	jz	41D98Fh

l0041D960:
	mov	esi,[esi]
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

l0041D97A:
	call	41C910h
	push	eax
	call	41C680h
	add	eax,242h
	jmp	41DAD9h

l0041D98F:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	5h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432794h
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
	jz	41D9EFh

l0041D9D9:
	mov	esi,[esi]
	add	esi,18h
	push	esi
	call	41C910h
	push	eax
	push	esi
	call	41C910h
	push	eax
	push	esi
	jmp	41D97Ah

l0041D9EF:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	6h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	43279Ch
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
	jz	41DA65h

l0041DA39:
	mov	esi,[esi]
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
	add	eax,102h
	jmp	41DAD9h

l0041DA65:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	5h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	4327A4h
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
	jz	41DADCh

l0041DAAF:
	mov	esi,[esi]
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
	add	eax,342h

l0041DAD9:
	add	[ebx+60h],eax

l0041DADC:
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	4h

;; fn0041DAF0: 0041DAF0
;;   Called from:
;;     0041B1C9 (in fn0041AEF0)
fn0041DAF0 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42F750h
	mov	eax,fs:[0000h]
	push	eax
	sub	esp,24h
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
	mov	esi,[ebp+8h]
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-14h],esp
	push	4h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	4327ACh
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],0h
	mov	ecx,esp
	push	dword ptr [esi]
	call	4028D0h
	mov	ecx,edi
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	41DE96h

l0041DB6E:
	mov	ecx,[esi+4h]
	mov	edx,1Ah
	mov	ebx,[esi]
	sub	ecx,ebx
	lea	eax,[ecx-48h]
	cmp	eax,18h
	jnc	41DC4Fh

l0041DB86:
	call	427210h
	mulsd	xmm0,double ptr [432E90h]
	call	42D911h
	mov	esi,eax
	lea	eax,[ebx+18h]
	mov	[ebp-24h],eax
	call	dword ptr [43129Ch]
	add	ebx,30h
	mov	[ebp-2Ch],eax
	cmp	dword ptr [ebx+14h],10h
	jc	41DBB4h

l0041DBB2:
	mov	ebx,[ebx]

l0041DBB4:
	mov	dword ptr [eax],0h
	lea	eax,[ebp-28h]
	push	0h
	push	eax
	push	ebx
	call	dword ptr [431200h]
	add	esp,0Ch
	mov	[ebp-1Ch],eax
	cmp	ebx,[ebp-28h]
	jnz	41DBDDh

l0041DBD2:
	push	431878h
	call	dword ptr [431134h]

l0041DBDD:
	mov	eax,[ebp-2Ch]
	cmp	dword ptr [eax],22h
	jz	41DC44h

l0041DBE5:
	push	dword ptr [ebp-24h]
	call	41C910h
	mov	edx,10h
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	addsd	xmm0,double ptr [432F80h+eax*8]
	movsd	double ptr [ebp-18h],xmm0
	call	427210h
	mulsd	xmm0,double ptr [ebp-18h]
	mov	eax,[ebp-1Ch]
	movd	xmm1,esi
	cvtdq2pd	xmm1,xmm1
	shr	esi,1Fh
	movzx	eax,ax
	addsd	xmm1,double ptr [432F80h+esi*8]
	addsd	xmm0,xmm1
	movd	xmm1,eax
	cvtdq2pd	xmm1,xmm1
	addsd	xmm0,xmm1
	jmp	41ECEDh

l0041DC44:
	push	431890h
	call	dword ptr [43119Ch]

l0041DC4F:
	lea	eax,[ecx-60h]
	cmp	eax,18h
	jnc	41DD66h

l0041DC5B:
	call	427210h
	mulsd	xmm0,double ptr [432E90h]
	call	42D911h
	mov	[ebp-28h],eax
	lea	eax,[ebx+30h]
	mov	[ebp-2Ch],eax
	call	dword ptr [43129Ch]
	add	ebx,48h
	mov	[ebp-24h],eax
	cmp	dword ptr [ebx+14h],10h
	jc	41DC8Ah

l0041DC88:
	mov	ebx,[ebx]

l0041DC8A:
	mov	dword ptr [eax],0h
	lea	eax,[ebp-1Ch]
	push	0h
	push	eax
	push	ebx
	call	dword ptr [431200h]
	add	esp,0Ch
	mov	[ebp-14h],eax
	cmp	ebx,[ebp-1Ch]
	jnz	41DCB3h

l0041DCA8:
	push	431878h
	call	dword ptr [431134h]

l0041DCB3:
	mov	eax,[ebp-24h]
	cmp	dword ptr [eax],22h
	jz	41DC44h

l0041DCBB:
	mov	esi,[esi]
	push	dword ptr [ebp-2Ch]
	add	esi,18h
	call	41C910h
	mov	edx,10h
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	addsd	xmm0,double ptr [432F80h+eax*8]
	movsd	double ptr [ebp-30h],xmm0
	call	427210h
	mov	eax,[ebp-28h]
	movsd	xmm1,double ptr [ebp-30h]
	mulsd	xmm1,xmm0
	push	esi
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	addsd	xmm0,double ptr [432F80h+eax*8]
	mov	eax,[ebp-14h]
	movzx	eax,ax
	addsd	xmm1,xmm0
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	addsd	xmm1,xmm0
	movsd	double ptr [ebp-30h],xmm1
	call	41C910h
	mov	edx,17h
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	addsd	xmm0,double ptr [432F80h+eax*8]
	movsd	double ptr [ebp-18h],xmm0
	call	427210h
	movsd	xmm1,double ptr [ebp-18h]
	mulsd	xmm1,xmm0
	movsd	xmm0,double ptr [ebp-30h]
	addsd	xmm0,xmm1
	jmp	41ECEDh

l0041DD66:
	call	427210h
	mulsd	xmm0,double ptr [432E90h]
	call	42D911h
	mov	[ebp-2Ch],eax
	lea	eax,[ebx+48h]
	mov	[ebp-24h],eax
	call	dword ptr [43129Ch]
	add	ebx,60h
	mov	[ebp-1Ch],eax
	cmp	dword ptr [ebx+14h],10h
	jc	41DD95h

l0041DD93:
	mov	ebx,[ebx]

l0041DD95:
	mov	dword ptr [eax],0h
	lea	eax,[ebp-14h]
	push	0h
	push	eax
	push	ebx
	call	dword ptr [431200h]
	add	esp,0Ch
	mov	[ebp-28h],eax
	cmp	ebx,[ebp-14h]
	jnz	41DDBEh

l0041DDB3:
	push	431878h
	call	dword ptr [431134h]

l0041DDBE:
	mov	eax,[ebp-1Ch]
	cmp	dword ptr [eax],22h
	jz	41DC44h

l0041DDCA:
	mov	esi,[esi]
	lea	eax,[esi+30h]
	push	eax
	call	41C910h
	lea	eax,[esi+18h]
	push	eax
	call	41C910h
	mov	edx,17h
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	addsd	xmm0,double ptr [432F80h+eax*8]
	movsd	double ptr [ebp-20h],xmm0
	call	427210h
	movsd	xmm1,double ptr [ebp-20h]
	push	dword ptr [ebp-24h]
	mulsd	xmm1,xmm0
	movsd	double ptr [ebp-20h],xmm1
	call	41C910h
	mov	edx,10h
	movd	xmm1,eax
	cvtdq2pd	xmm1,xmm1
	shr	eax,1Fh
	addsd	xmm1,double ptr [432F80h+eax*8]
	movsd	double ptr [ebp-18h],xmm1
	call	427210h
	mov	eax,[ebp-2Ch]
	mov	edx,15h
	movsd	xmm2,double ptr [ebp-18h]
	mulsd	xmm2,xmm0
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	addsd	xmm0,double ptr [432F80h+eax*8]
	mov	eax,[ebp-28h]
	movzx	eax,ax
	addsd	xmm2,xmm0
	movd	xmm1,eax
	cvtdq2pd	xmm1,xmm1
	addsd	xmm2,xmm1
	addsd	xmm2,double ptr [ebp-20h]
	movsd	double ptr [ebp-18h],xmm2
	call	427210h
	mulsd	xmm0,double ptr [432E48h]
	addsd	xmm0,double ptr [ebp-18h]
	jmp	41ECEDh

l0041DE96:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-14h],esp
	push	5h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	4327B4h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],1h
	mov	ecx,esp
	push	dword ptr [esi]
	call	4028D0h
	mov	ecx,edi
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	41E0CDh

l0041DEE4:
	mov	eax,[esi+4h]
	mov	edx,1Ah
	mov	ebx,[esi]
	sub	eax,ebx
	sub	eax,48h
	cmp	eax,18h
	jnc	41DFBEh

l0041DEFC:
	call	427210h
	mulsd	xmm0,double ptr [432E90h]
	call	42D911h
	mov	[ebp-2Ch],eax
	lea	eax,[ebx+18h]
	mov	[ebp-24h],eax
	call	dword ptr [43129Ch]
	cmp	dword ptr [ebx+44h],10h
	lea	esi,[ebx+30h]
	mov	[ebp-1Ch],eax
	jc	41DF2Bh

l0041DF29:
	mov	esi,[esi]

l0041DF2B:
	mov	dword ptr [eax],0h
	lea	eax,[ebp-14h]
	push	0h
	push	eax
	push	esi
	call	dword ptr [431200h]
	add	esp,0Ch
	mov	ebx,eax
	cmp	esi,[ebp-14h]
	jnz	41DF53h

l0041DF48:
	push	431878h
	call	dword ptr [431134h]

l0041DF53:
	mov	eax,[ebp-1Ch]
	cmp	dword ptr [eax],22h
	jz	41DC44h

l0041DF5F:
	push	dword ptr [ebp-24h]
	call	41C910h
	mov	edx,10h
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	addsd	xmm0,double ptr [432F80h+eax*8]
	movsd	double ptr [ebp-18h],xmm0
	call	427210h
	mov	eax,[ebp-2Ch]
	mulsd	xmm0,double ptr [ebp-18h]
	movd	xmm1,eax
	cvtdq2pd	xmm1,xmm1
	shr	eax,1Fh
	addsd	xmm1,double ptr [432F80h+eax*8]
	movzx	eax,bx
	addsd	xmm0,xmm1
	movd	xmm1,eax
	cvtdq2pd	xmm1,xmm1
	addsd	xmm0,xmm1
	jmp	41ECEDh

l0041DFBE:
	call	427210h
	mulsd	xmm0,double ptr [432E90h]
	call	42D911h
	mov	[ebp-2Ch],eax
	lea	eax,[ebx+30h]
	mov	[ebp-24h],eax
	call	dword ptr [43129Ch]
	add	ebx,48h
	mov	[ebp-1Ch],eax
	cmp	dword ptr [ebx+14h],10h
	jc	41DFEDh

l0041DFEB:
	mov	ebx,[ebx]

l0041DFED:
	mov	dword ptr [eax],0h
	lea	eax,[ebp-14h]
	push	0h
	push	eax
	push	ebx
	call	dword ptr [431200h]
	add	esp,0Ch
	mov	[ebp-28h],eax
	cmp	ebx,[ebp-14h]
	jnz	41E016h

l0041E00B:
	push	431878h
	call	dword ptr [431134h]

l0041E016:
	mov	eax,[ebp-1Ch]
	cmp	dword ptr [eax],22h
	jz	41DC44h

l0041E022:
	mov	esi,[esi]
	push	dword ptr [ebp-24h]
	add	esi,18h
	call	41C910h
	mov	edx,10h
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	addsd	xmm0,double ptr [432F80h+eax*8]
	movsd	double ptr [ebp-20h],xmm0
	call	427210h
	mov	eax,[ebp-2Ch]
	movsd	xmm1,double ptr [ebp-20h]
	mulsd	xmm1,xmm0
	push	esi
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	addsd	xmm0,double ptr [432F80h+eax*8]
	mov	eax,[ebp-28h]
	movzx	eax,ax
	addsd	xmm1,xmm0
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	addsd	xmm1,xmm0
	movsd	double ptr [ebp-20h],xmm1
	call	41C910h
	mov	edx,17h
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	addsd	xmm0,double ptr [432F80h+eax*8]
	movsd	double ptr [ebp-18h],xmm0
	call	427210h
	movsd	xmm1,double ptr [ebp-18h]
	mulsd	xmm1,xmm0
	movsd	xmm0,double ptr [ebp-20h]
	addsd	xmm0,xmm1
	jmp	41ECEDh

l0041E0CD:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-14h],esp
	push	4h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	4327ACh
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],2h
	mov	ecx,esp
	push	dword ptr [esi]
	call	4028D0h
	mov	ecx,edi
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	41E440h

l0041E11B:
	mov	ecx,[esi+4h]
	mov	edx,1Ah
	mov	ebx,[esi]
	sub	ecx,ebx
	lea	eax,[ecx-48h]
	cmp	eax,18h
	jnc	41E1F5h

l0041E133:
	call	427210h
	mulsd	xmm0,double ptr [432E88h]
	call	42D911h
	mov	esi,eax
	lea	eax,[ebx+18h]
	mov	[ebp-24h],eax
	call	dword ptr [43129Ch]
	add	ebx,30h
	mov	[ebp-1Ch],eax
	cmp	dword ptr [ebx+14h],10h
	jc	41E161h

l0041E15F:
	mov	ebx,[ebx]

l0041E161:
	mov	dword ptr [eax],0h
	lea	eax,[ebp-14h]
	push	0h
	push	eax
	push	ebx
	call	dword ptr [431200h]
	add	esp,0Ch
	mov	[ebp-2Ch],eax
	cmp	ebx,[ebp-14h]
	jnz	41E18Ah

l0041E17F:
	push	431878h
	call	dword ptr [431134h]

l0041E18A:
	mov	eax,[ebp-1Ch]
	cmp	dword ptr [eax],22h
	jz	41DC44h

l0041E196:
	push	dword ptr [ebp-24h]
	call	41C910h
	mov	edx,10h
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	addsd	xmm0,double ptr [432F80h+eax*8]
	movsd	double ptr [ebp-18h],xmm0
	call	427210h
	mulsd	xmm0,double ptr [ebp-18h]
	mov	eax,[ebp-2Ch]
	movd	xmm1,esi
	cvtdq2pd	xmm1,xmm1
	shr	esi,1Fh
	movzx	eax,ax
	addsd	xmm1,double ptr [432F80h+esi*8]
	addsd	xmm0,xmm1
	movd	xmm1,eax
	cvtdq2pd	xmm1,xmm1
	addsd	xmm0,xmm1
	jmp	41ECEDh

l0041E1F5:
	lea	eax,[ecx-60h]
	cmp	eax,18h
	jnc	41E310h

l0041E201:
	call	427210h
	mulsd	xmm0,double ptr [432E88h]
	call	42D911h
	mov	[ebp-2Ch],eax
	lea	eax,[ebx+30h]
	mov	[ebp-24h],eax
	call	dword ptr [43129Ch]
	add	ebx,48h
	mov	[ebp-1Ch],eax
	cmp	dword ptr [ebx+14h],10h
	jc	41E230h

l0041E22E:
	mov	ebx,[ebx]

l0041E230:
	mov	dword ptr [eax],0h
	lea	eax,[ebp-14h]
	push	0h
	push	eax
	push	ebx
	call	dword ptr [431200h]
	add	esp,0Ch
	mov	[ebp-28h],eax
	cmp	ebx,[ebp-14h]
	jnz	41E259h

l0041E24E:
	push	431878h
	call	dword ptr [431134h]

l0041E259:
	mov	eax,[ebp-1Ch]
	cmp	dword ptr [eax],22h
	jz	41DC44h

l0041E265:
	mov	esi,[esi]
	push	dword ptr [ebp-24h]
	add	esi,18h
	call	41C910h
	mov	edx,10h
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	addsd	xmm0,double ptr [432F80h+eax*8]
	movsd	double ptr [ebp-20h],xmm0
	call	427210h
	mov	eax,[ebp-2Ch]
	movsd	xmm1,double ptr [ebp-20h]
	mulsd	xmm1,xmm0
	push	esi
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	addsd	xmm0,double ptr [432F80h+eax*8]
	mov	eax,[ebp-28h]
	movzx	eax,ax
	addsd	xmm1,xmm0
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	addsd	xmm1,xmm0
	movsd	double ptr [ebp-20h],xmm1
	call	41C910h
	mov	edx,17h
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	addsd	xmm0,double ptr [432F80h+eax*8]
	movsd	double ptr [ebp-18h],xmm0
	call	427210h
	movsd	xmm1,double ptr [ebp-18h]
	mulsd	xmm1,xmm0
	movsd	xmm0,double ptr [ebp-20h]
	addsd	xmm0,xmm1
	jmp	41ECEDh

l0041E310:
	call	427210h
	mulsd	xmm0,double ptr [432E88h]
	call	42D911h
	mov	[ebp-2Ch],eax
	lea	eax,[ebx+48h]
	mov	[ebp-24h],eax
	call	dword ptr [43129Ch]
	add	ebx,60h
	mov	[ebp-1Ch],eax
	cmp	dword ptr [ebx+14h],10h
	jc	41E33Fh

l0041E33D:
	mov	ebx,[ebx]

l0041E33F:
	mov	dword ptr [eax],0h
	lea	eax,[ebp-14h]
	push	0h
	push	eax
	push	ebx
	call	dword ptr [431200h]
	add	esp,0Ch
	mov	[ebp-28h],eax
	cmp	ebx,[ebp-14h]
	jnz	41E368h

l0041E35D:
	push	431878h
	call	dword ptr [431134h]

l0041E368:
	mov	eax,[ebp-1Ch]
	cmp	dword ptr [eax],22h
	jz	41DC44h

l0041E374:
	mov	esi,[esi]
	lea	eax,[esi+30h]
	push	eax
	call	41C910h
	lea	eax,[esi+18h]
	push	eax
	call	41C910h
	mov	edx,17h
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	addsd	xmm0,double ptr [432F80h+eax*8]
	movsd	double ptr [ebp-20h],xmm0
	call	427210h
	movsd	xmm1,double ptr [ebp-20h]
	push	dword ptr [ebp-24h]
	mulsd	xmm1,xmm0
	movsd	double ptr [ebp-20h],xmm1
	call	41C910h
	mov	edx,10h
	movd	xmm1,eax
	cvtdq2pd	xmm1,xmm1
	shr	eax,1Fh
	addsd	xmm1,double ptr [432F80h+eax*8]
	movsd	double ptr [ebp-18h],xmm1
	call	427210h
	mov	eax,[ebp-2Ch]
	mov	edx,15h
	movsd	xmm2,double ptr [ebp-18h]
	mulsd	xmm2,xmm0
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	addsd	xmm0,double ptr [432F80h+eax*8]
	mov	eax,[ebp-28h]
	movzx	eax,ax
	addsd	xmm2,xmm0
	movd	xmm1,eax
	cvtdq2pd	xmm1,xmm1
	addsd	xmm2,xmm1
	addsd	xmm2,double ptr [ebp-20h]
	movsd	double ptr [ebp-18h],xmm2
	call	427210h
	mulsd	xmm0,double ptr [432E48h]
	addsd	xmm0,double ptr [ebp-18h]
	jmp	41ECEDh

l0041E440:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-14h],esp
	push	6h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	4327BCh
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],3h
	mov	ecx,esp
	push	dword ptr [esi]
	call	4028D0h
	mov	ecx,edi
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	41E677h

l0041E48E:
	mov	eax,[esi+4h]
	mov	edx,1Ah
	mov	ebx,[esi]
	sub	eax,ebx
	sub	eax,48h
	cmp	eax,18h
	jnc	41E568h

l0041E4A6:
	call	427210h
	mulsd	xmm0,double ptr [432E88h]
	call	42D911h
	mov	[ebp-2Ch],eax
	lea	eax,[ebx+18h]
	mov	[ebp-24h],eax
	call	dword ptr [43129Ch]
	cmp	dword ptr [ebx+44h],10h
	lea	esi,[ebx+30h]
	mov	[ebp-1Ch],eax
	jc	41E4D5h

l0041E4D3:
	mov	esi,[esi]

l0041E4D5:
	mov	dword ptr [eax],0h
	lea	eax,[ebp-14h]
	push	0h
	push	eax
	push	esi
	call	dword ptr [431200h]
	add	esp,0Ch
	mov	ebx,eax
	cmp	esi,[ebp-14h]
	jnz	41E4FDh

l0041E4F2:
	push	431878h
	call	dword ptr [431134h]

l0041E4FD:
	mov	eax,[ebp-1Ch]
	cmp	dword ptr [eax],22h
	jz	41DC44h

l0041E509:
	push	dword ptr [ebp-24h]
	call	41C910h
	mov	edx,10h
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	addsd	xmm0,double ptr [432F80h+eax*8]
	movsd	double ptr [ebp-18h],xmm0
	call	427210h
	mov	eax,[ebp-2Ch]
	mulsd	xmm0,double ptr [ebp-18h]
	movd	xmm1,eax
	cvtdq2pd	xmm1,xmm1
	shr	eax,1Fh
	addsd	xmm1,double ptr [432F80h+eax*8]
	movzx	eax,bx
	addsd	xmm0,xmm1
	movd	xmm1,eax
	cvtdq2pd	xmm1,xmm1
	addsd	xmm0,xmm1
	jmp	41ECEDh

l0041E568:
	call	427210h
	mulsd	xmm0,double ptr [432E88h]
	call	42D911h
	mov	[ebp-2Ch],eax
	lea	eax,[ebx+30h]
	mov	[ebp-1Ch],eax
	call	dword ptr [43129Ch]
	add	ebx,48h
	mov	[ebp-14h],eax
	cmp	dword ptr [ebx+14h],10h
	jc	41E597h

l0041E595:
	mov	ebx,[ebx]

l0041E597:
	mov	dword ptr [eax],0h
	lea	eax,[ebp-24h]
	push	0h
	push	eax
	push	ebx
	call	dword ptr [431200h]
	add	esp,0Ch
	mov	[ebp-28h],eax
	cmp	ebx,[ebp-24h]
	jnz	41E5C0h

l0041E5B5:
	push	431878h
	call	dword ptr [431134h]

l0041E5C0:
	mov	eax,[ebp-14h]
	cmp	dword ptr [eax],22h
	jz	41DC44h

l0041E5CC:
	mov	esi,[esi]
	push	dword ptr [ebp-1Ch]
	add	esi,18h
	call	41C910h
	mov	edx,10h
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	addsd	xmm0,double ptr [432F80h+eax*8]
	movsd	double ptr [ebp-18h],xmm0
	call	427210h
	mov	eax,[ebp-2Ch]
	movsd	xmm1,double ptr [ebp-18h]
	mulsd	xmm1,xmm0
	push	esi
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	addsd	xmm0,double ptr [432F80h+eax*8]
	mov	eax,[ebp-28h]
	movzx	eax,ax
	addsd	xmm1,xmm0
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	addsd	xmm1,xmm0
	movsd	double ptr [ebp-18h],xmm1
	call	41C910h
	mov	edx,17h
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	addsd	xmm0,double ptr [432F80h+eax*8]
	movsd	double ptr [ebp-20h],xmm0
	call	427210h
	movsd	xmm1,double ptr [ebp-20h]
	mulsd	xmm1,xmm0
	movsd	xmm0,double ptr [ebp-18h]
	addsd	xmm0,xmm1
	jmp	41ECEDh

l0041E677:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-14h],esp
	push	5h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	4327C4h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],4h
	mov	ecx,esp
	push	dword ptr [esi]
	call	4028D0h
	mov	ecx,edi
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	41E879h

l0041E6C5:
	mov	eax,[esi+4h]
	mov	ebx,[esi]
	sub	eax,ebx
	sub	eax,48h
	cmp	eax,18h
	jnc	41E789h

l0041E6D8:
	lea	eax,[ebx+18h]
	push	eax
	call	41C910h
	mov	edx,10h
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	addsd	xmm0,double ptr [432F80h+eax*8]
	movsd	double ptr [ebp-18h],xmm0
	call	427210h
	movsd	xmm2,double ptr [ebp-18h]
	mov	edx,1Ah
	mulsd	xmm2,xmm0
	movsd	double ptr [ebp-18h],xmm2
	call	427210h
	mulsd	xmm0,double ptr [432EE0h]
	call	42D911h
	movsd	xmm1,double ptr [ebp-18h]
	add	eax,40h
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	addsd	xmm0,double ptr [432F80h+eax*8]
	lea	eax,[ebx+30h]
	push	eax
	addsd	xmm1,xmm0
	movsd	double ptr [ebp-18h],xmm1
	call	41C910h
	mov	edx,0Bh
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	addsd	xmm0,double ptr [432F80h+eax*8]
	movsd	double ptr [ebp-20h],xmm0
	call	427210h
	mulsd	xmm0,double ptr [ebp-20h]
	addsd	xmm0,double ptr [ebp-18h]
	jmp	41ECEDh

l0041E789:
	lea	eax,[ebx+30h]
	push	eax
	call	41C910h
	mov	edx,10h
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	addsd	xmm0,double ptr [432F80h+eax*8]
	movsd	double ptr [ebp-18h],xmm0
	call	427210h
	movsd	xmm2,double ptr [ebp-18h]
	mov	edx,1Ah
	mulsd	xmm2,xmm0
	movsd	double ptr [ebp-18h],xmm2
	call	427210h
	mulsd	xmm0,double ptr [432EE0h]
	call	42D911h
	movsd	xmm1,double ptr [ebp-18h]
	add	eax,40h
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	addsd	xmm0,double ptr [432F80h+eax*8]
	lea	eax,[ebx+48h]
	push	eax
	addsd	xmm1,xmm0
	movsd	double ptr [ebp-18h],xmm1
	call	41C910h
	mov	edx,0Bh
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	addsd	xmm0,double ptr [432F80h+eax*8]
	movsd	double ptr [ebp-20h],xmm0
	call	427210h
	movsd	xmm1,double ptr [ebp-20h]
	lea	eax,[ebx+18h]
	mulsd	xmm1,xmm0
	push	eax
	addsd	xmm1,double ptr [ebp-18h]
	movsd	double ptr [ebp-20h],xmm1
	call	41C910h
	mov	edx,17h
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	addsd	xmm0,double ptr [432F80h+eax*8]
	movsd	double ptr [ebp-18h],xmm0
	call	427210h
	mulsd	xmm0,double ptr [ebp-18h]
	addsd	xmm0,double ptr [ebp-20h]
	jmp	41ECEDh

l0041E879:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-14h],esp
	push	4h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	4327CCh
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],5h
	mov	ecx,esp
	push	dword ptr [esi]
	call	4028D0h
	mov	ecx,edi
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	41E9B9h

l0041E8C7:
	mov	esi,[esi]
	lea	eax,[esi+18h]
	push	eax
	call	41C910h
	mov	edx,17h
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	addsd	xmm0,double ptr [432F80h+eax*8]
	movsd	double ptr [ebp-18h],xmm0
	call	427210h
	movsd	xmm2,double ptr [ebp-18h]
	mov	edx,1Ah
	mulsd	xmm2,xmm0
	movsd	double ptr [ebp-18h],xmm2
	call	427210h
	mulsd	xmm0,double ptr [432EE0h]
	call	42D911h
	movsd	xmm1,double ptr [ebp-18h]
	add	eax,40h
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	addsd	xmm0,double ptr [432F80h+eax*8]
	lea	eax,[esi+30h]
	push	eax
	addsd	xmm1,xmm0
	movsd	double ptr [ebp-18h],xmm1
	call	41C910h
	mov	edx,10h
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	addsd	xmm0,double ptr [432F80h+eax*8]
	movsd	double ptr [ebp-20h],xmm0
	call	427210h
	movsd	xmm1,double ptr [ebp-20h]
	lea	eax,[esi+48h]
	mulsd	xmm1,xmm0
	push	eax
	addsd	xmm1,double ptr [ebp-18h]
	movsd	double ptr [ebp-20h],xmm1
	call	41C910h
	mov	edx,0Bh
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	addsd	xmm0,double ptr [432F80h+eax*8]
	movsd	double ptr [ebp-18h],xmm0
	call	427210h
	mulsd	xmm0,double ptr [ebp-18h]
	addsd	xmm0,double ptr [ebp-20h]
	jmp	41ECEDh

l0041E9B9:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-14h],esp
	push	4h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	4327D4h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],6h
	mov	ecx,esp
	push	dword ptr [esi]
	call	4028D0h
	mov	ecx,edi
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	41EBB5h

l0041EA07:
	mov	eax,[esi+4h]
	mov	ebx,[esi]
	sub	eax,ebx
	sub	eax,48h
	cmp	eax,18h
	jnc	41EAC8h

l0041EA1A:
	lea	eax,[ebx+18h]
	push	eax
	call	41C910h
	mov	edx,10h
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	addsd	xmm0,double ptr [432F80h+eax*8]
	movsd	double ptr [ebp-18h],xmm0
	call	427210h
	movsd	xmm2,double ptr [ebp-18h]
	mov	edx,1Ah
	mulsd	xmm2,xmm0
	movsd	double ptr [ebp-18h],xmm2
	call	427210h
	mulsd	xmm0,double ptr [432EE0h]
	call	42D911h
	movsd	xmm1,double ptr [ebp-18h]
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	addsd	xmm0,double ptr [432F80h+eax*8]
	lea	eax,[ebx+30h]
	push	eax
	addsd	xmm1,xmm0
	movsd	double ptr [ebp-18h],xmm1
	call	41C910h
	mov	edx,0Bh
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	addsd	xmm0,double ptr [432F80h+eax*8]
	movsd	double ptr [ebp-20h],xmm0
	call	427210h
	mulsd	xmm0,double ptr [ebp-20h]
	addsd	xmm0,double ptr [ebp-18h]
	jmp	41ECEDh

l0041EAC8:
	lea	eax,[ebx+30h]
	push	eax
	call	41C910h
	mov	edx,10h
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	addsd	xmm0,double ptr [432F80h+eax*8]
	movsd	double ptr [ebp-18h],xmm0
	call	427210h
	movsd	xmm2,double ptr [ebp-18h]
	mov	edx,1Ah
	mulsd	xmm2,xmm0
	movsd	double ptr [ebp-18h],xmm2
	call	427210h
	mulsd	xmm0,double ptr [432EE0h]
	call	42D911h
	movsd	xmm1,double ptr [ebp-18h]
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	addsd	xmm0,double ptr [432F80h+eax*8]
	lea	eax,[ebx+48h]
	push	eax
	addsd	xmm1,xmm0
	movsd	double ptr [ebp-18h],xmm1
	call	41C910h
	mov	edx,0Bh
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	addsd	xmm0,double ptr [432F80h+eax*8]
	movsd	double ptr [ebp-20h],xmm0
	call	427210h
	movsd	xmm1,double ptr [ebp-20h]
	lea	eax,[ebx+18h]
	mulsd	xmm1,xmm0
	push	eax
	addsd	xmm1,double ptr [ebp-18h]
	movsd	double ptr [ebp-20h],xmm1
	call	41C910h
	mov	edx,17h
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	addsd	xmm0,double ptr [432F80h+eax*8]
	movsd	double ptr [ebp-18h],xmm0
	call	427210h
	mulsd	xmm0,double ptr [ebp-18h]
	addsd	xmm0,double ptr [ebp-20h]
	jmp	41ECEDh

l0041EBB5:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-14h],esp
	push	3h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	4326BCh
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],7h
	mov	ecx,esp
	push	dword ptr [esi]
	call	4028D0h
	mov	ecx,edi
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	41ECF5h

l0041EC03:
	mov	esi,[esi]
	lea	eax,[esi+18h]
	push	eax
	call	41C910h
	mov	edx,17h
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	addsd	xmm0,double ptr [432F80h+eax*8]
	movsd	double ptr [ebp-18h],xmm0
	call	427210h
	movsd	xmm2,double ptr [ebp-18h]
	mov	edx,1Ah
	mulsd	xmm2,xmm0
	movsd	double ptr [ebp-18h],xmm2
	call	427210h
	mulsd	xmm0,double ptr [432EE0h]
	call	42D911h
	movsd	xmm1,double ptr [ebp-18h]
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	addsd	xmm0,double ptr [432F80h+eax*8]
	lea	eax,[esi+30h]
	push	eax
	addsd	xmm1,xmm0
	movsd	double ptr [ebp-18h],xmm1
	call	41C910h
	mov	edx,10h
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	addsd	xmm0,double ptr [432F80h+eax*8]
	movsd	double ptr [ebp-20h],xmm0
	call	427210h
	movsd	xmm1,double ptr [ebp-20h]
	lea	eax,[esi+48h]
	mulsd	xmm1,xmm0
	push	eax
	addsd	xmm1,double ptr [ebp-18h]
	movsd	double ptr [ebp-20h],xmm1
	call	41C910h
	mov	edx,0Bh
	movd	xmm0,eax
	cvtdq2pd	xmm0,xmm0
	shr	eax,1Fh
	addsd	xmm0,double ptr [432F80h+eax*8]
	movsd	double ptr [ebp-18h],xmm0
	call	427210h
	mulsd	xmm0,double ptr [ebp-18h]
	addsd	xmm0,double ptr [ebp-20h]

l0041ECED:
	call	42D911h
	mov	[edi+60h],eax

l0041ECF5:
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
0041ED13          CC CC CC CC CC CC CC CC CC CC CC CC CC    .............

;; fn0041ED20: 0041ED20
;;   Called from:
;;     0041B56E (in fn0041AEF0)
fn0041ED20 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42F790h
	mov	eax,fs:[0000h]
	push	eax
	push	ecx
	push	esi
	push	edi
	mov	eax,[43A008h]
	xor	eax,ebp
	push	eax
	lea	eax,[ebp-0Ch]
	mov	fs:[0000h],eax
	mov	edi,ecx
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-10h],esp
	push	4h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	4327DCh
	mov	byte ptr [ecx],0h
	call	402A70h
	mov	dword ptr [ebp-4h],0h
	sub	esp,18h
	mov	esi,[ebp+8h]
	mov	ecx,esp
	push	dword ptr [esi]
	call	4028D0h
	mov	ecx,edi
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	41EDD3h

l0041ED94:
	mov	esi,[esi]
	lea	eax,[esi+30h]
	push	eax
	call	41C910h
	push	eax
	lea	eax,[esi+18h]
	push	eax
	call	41C910h
	push	eax
	push	0h
	call	41C680h
	mov	edx,1Ah
	mov	esi,eax
	call	427210h
	mulsd	xmm0,double ptr [432EE0h]
	call	42D911h
	add	eax,7ACh
	add	eax,esi
	jmp	41EE39h

l0041EDD3:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	5h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	4327E4h
	mov	byte ptr [ecx],0h
	call	402A70h
	sub	esp,18h
	mov	dword ptr [ebp-4h],1h
	mov	ecx,esp
	push	dword ptr [esi]
	call	4028D0h
	mov	ecx,edi
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	41EE3Ch

l0041EE1D:
	mov	edx,1Ah
	call	427210h
	mulsd	xmm0,double ptr [432EC0h]
	call	42D911h
	add	eax,12Ch

l0041EE39:
	mov	[edi+60h],eax

l0041EE3C:
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	mov	esp,ebp
	pop	ebp
	ret	4h
0041EE4F                                              CC                .

;; fn0041EE50: 0041EE50
;;   Called from:
;;     0041B99D (in fn0041AEF0)
fn0041EE50 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42F908h
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
	mov	ebx,ecx
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-14h],esp
	push	4327ECh
	call	402890h
	mov	dword ptr [ebp-4h],0h
	lea	eax,[ebp-0Dh]
	mov	edi,[ebp+8h]
	sub	esp,18h
	mov	esi,esp
	mov	ecx,esi
	mov	edi,[edi]
	push	eax
	mov	[ebp-18h],esi
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
	jz	41EF28h

l0041EED0:
	mov	edx,1Ah
	lea	ecx,[edx-18h]
	call	427210h
	mulsd	xmm0,double ptr [432EE0h]
	call	42D911h
	mov	edi,eax
	mov	eax,[ebp+8h]
	mov	esi,[eax]
	lea	ecx,[esi+48h]
	push	ecx
	mov	ecx,ebx
	call	41C910h
	push	eax
	lea	ecx,[esi+30h]
	push	ecx
	mov	ecx,ebx
	call	41C910h
	push	eax
	lea	eax,[esi+18h]
	mov	ecx,ebx
	push	eax
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	add	eax,0EEh
	add	eax,edi
	jmp	4204A9h

l0041EF28:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-18h],esp
	push	4327F4h
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
	jz	41EFD6h

l0041EF7E:
	mov	edx,1Ah
	lea	ecx,[edx-18h]
	call	427210h
	mulsd	xmm0,double ptr [432EE0h]
	call	42D911h
	mov	edi,eax
	mov	eax,[ebp+8h]
	mov	esi,[eax]
	lea	ecx,[esi+48h]
	push	ecx
	mov	ecx,ebx
	call	41C910h
	push	eax
	lea	ecx,[esi+30h]
	push	ecx
	mov	ecx,ebx
	call	41C910h
	push	eax
	lea	eax,[esi+18h]
	mov	ecx,ebx
	push	eax
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	add	eax,26Eh
	add	eax,edi
	jmp	4204A9h

l0041EFD6:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-18h],esp
	push	4327FCh
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
	jz	41F084h

l0041F02C:
	mov	edx,1Ah
	lea	ecx,[edx-18h]
	call	427210h
	mulsd	xmm0,double ptr [432EE0h]
	call	42D911h
	mov	edi,eax
	mov	eax,[ebp+8h]
	mov	esi,[eax]
	lea	ecx,[esi+48h]
	push	ecx
	mov	ecx,ebx
	call	41C910h
	push	eax
	lea	ecx,[esi+30h]
	push	ecx
	mov	ecx,ebx
	call	41C910h
	push	eax
	lea	eax,[esi+18h]
	mov	ecx,ebx
	push	eax
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	add	eax,2EEh
	add	eax,edi
	jmp	4204A9h

l0041F084:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-18h],esp
	push	432804h
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
	jz	41F130h

l0041F0DA:
	mov	edx,1Ah
	lea	ecx,[edx-18h]
	call	427210h
	mulsd	xmm0,double ptr [432EE0h]
	call	42D911h
	mov	edi,eax
	mov	eax,[ebp+8h]
	mov	esi,[eax]
	lea	ecx,[esi+48h]
	push	ecx
	mov	ecx,ebx
	call	41C910h
	push	eax
	lea	ecx,[esi+30h]
	push	ecx
	mov	ecx,ebx
	call	41C910h
	push	eax
	lea	eax,[esi+18h]
	mov	ecx,ebx
	push	eax
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	add	eax,6Eh
	add	eax,edi
	jmp	4204A9h

l0041F130:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-18h],esp
	push	43280Ch
	call	402890h
	mov	dword ptr [ebp-4h],8h
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
	mov	byte ptr [ebp-4h],9h
	call	402BB0h
	mov	byte ptr [ebp-4h],8h
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	41F1DEh

l0041F186:
	mov	edx,1Ah
	lea	ecx,[edx-18h]
	call	427210h
	mulsd	xmm0,double ptr [432EE0h]
	call	42D911h
	mov	edi,eax
	mov	eax,[ebp+8h]
	mov	esi,[eax]
	lea	ecx,[esi+48h]
	push	ecx
	mov	ecx,ebx
	call	41C910h
	push	eax
	lea	ecx,[esi+30h]
	push	ecx
	mov	ecx,ebx
	call	41C910h
	push	eax
	lea	eax,[esi+18h]
	mov	ecx,ebx
	push	eax
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	add	eax,2EAh
	add	eax,edi
	jmp	4204A9h

l0041F1DE:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-18h],esp
	push	432814h
	call	402890h
	mov	dword ptr [ebp-4h],0Ah
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
	mov	byte ptr [ebp-4h],0Bh
	call	402BB0h
	mov	byte ptr [ebp-4h],0Ah
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	41F28Ch

l0041F234:
	mov	edx,1Ah
	lea	ecx,[edx-18h]
	call	427210h
	mulsd	xmm0,double ptr [432EE0h]
	call	42D911h
	mov	edi,eax
	mov	eax,[ebp+8h]
	mov	esi,[eax]
	lea	ecx,[esi+48h]
	push	ecx
	mov	ecx,ebx
	call	41C910h
	push	eax
	lea	ecx,[esi+30h]
	push	ecx
	mov	ecx,ebx
	call	41C910h
	push	eax
	lea	eax,[esi+18h]
	mov	ecx,ebx
	push	eax
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	add	eax,46Eh
	add	eax,edi
	jmp	4204A9h

l0041F28C:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-18h],esp
	push	43281Ch
	call	402890h
	mov	dword ptr [ebp-4h],0Ch
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
	mov	byte ptr [ebp-4h],0Dh
	call	402BB0h
	mov	byte ptr [ebp-4h],0Ch
	mov	ecx,ebx
	mov	dword ptr [ebp-4h],0FFFFFFFFh
	call	41C1F0h
	test	al,al
	jz	41F33Ah

l0041F2E2:
	mov	edx,1Ah
	lea	ecx,[edx-18h]
	call	427210h
	mulsd	xmm0,double ptr [432EE0h]
	call	42D911h
	mov	edi,eax
	mov	eax,[ebp+8h]
	mov	esi,[eax]
	lea	ecx,[esi+48h]
	push	ecx
	mov	ecx,ebx
	call	41C910h
	push	eax
	lea	ecx,[esi+30h]
	push	ecx
	mov	ecx,ebx
	call	41C910h
	push	eax
	lea	eax,[esi+18h]
	mov	ecx,ebx
	push	eax
	call	41C910h
	push	eax
	mov	ecx,ebx
	call	41C680h
	add	eax,4EEh
	add	eax,edi
	jmp	4204A9h

l0041F33A:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-18h],esp
	push	432824h
	call	402890h
	sub	esp,18h
	mov	dword ptr [ebp-4h],0Eh
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
	jz	41F3CEh

l0041F37E:
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
	add	eax,6Ah
	jmp	4204A7h

l0041F3CE:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	43282Ch
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
	jz	41F461h

l0041F40F:
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
	add	eax,0AEh
	jmp	4204A7h

l0041F461:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432834h
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
	jz	41F4F4h

l0041F4A2:
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
	add	eax,22Eh
	jmp	4204A7h

l0041F4F4:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	43283Ch
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
	jz	41F587h

l0041F535:
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
	add	eax,2AEh
	jmp	4204A7h

l0041F587:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432844h
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
	jz	41F618h

l0041F5C8:
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
	add	eax,2Eh
	jmp	4204A7h

l0041F618:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	43284Ch
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
	jz	41F6ABh

l0041F659:
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
	add	eax,2AAh
	jmp	4204A7h

l0041F6AB:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432854h
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
	jz	41F73Eh

l0041F6EC:
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
	add	eax,42Eh
	jmp	4204A7h

l0041F73E:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	43285Ch
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
	jz	41F7D1h

l0041F77F:
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
	add	eax,4AEh
	jmp	4204A7h

l0041F7D1:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432864h
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
	jz	41F862h

l0041F812:
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
	add	eax,2Ah
	jmp	4204A7h

l0041F862:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432868h
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
	jz	41F90Ah

l0041F8A3:
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	0h
	push	2h
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
	push	23h
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	esi,eax
	mov	[ebx+60h],esi
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	4h

l0041F90A:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432870h
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
	jz	41F9B2h

l0041F94B:
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	0h
	push	2h
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
	push	29h
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	esi,eax
	mov	[ebx+60h],esi
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	4h

l0041F9B2:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432878h
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
	jz	41FA5Ah

l0041F9F3:
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	0h
	push	2h
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
	push	2Bh
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	esi,eax
	mov	[ebx+60h],esi
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	4h

l0041FA5A:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432880h
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
	jz	41FB02h

l0041FA9B:
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	0h
	push	2h
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
	push	21h
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	esi,eax
	mov	[ebx+60h],esi
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	4h

l0041FB02:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432888h
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
	jz	41FBAAh

l0041FB43:
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	0h
	push	2h
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
	push	31h
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	esi,eax
	mov	[ebx+60h],esi
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	4h

l0041FBAA:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432890h
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
	jz	41FC52h

l0041FBEB:
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	0h
	push	2h
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
	push	33h
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	esi,eax
	mov	[ebx+60h],esi
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	4h

l0041FC52:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	432898h
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
	jz	41FCEAh

l0041FC93:
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	0h
	push	2h
	mov	ecx,edi
	call	40F760h
	xor	edx,edx
	mov	ecx,eax
	call	403C30h
	add	esp,4h
	shl	eax,2h
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
	push	3Ah
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	inc	eax
	jmp	4204A7h

l0041FCEA:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	43289Ch
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
	jz	41FD7Dh

l0041FD2B:
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
	add	eax,62Ch
	jmp	4204A7h

l0041FD7D:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	4328A4h
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
	jz	41FE10h

l0041FDBE:
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
	add	eax,42Ch
	jmp	4204A7h

l0041FE10:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	4328ACh
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
	jz	41FEB8h

l0041FE51:
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	0h
	push	2h
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
	push	22h
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	esi,eax
	mov	[ebx+60h],esi
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	4h

l0041FEB8:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	4328B0h
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
	jnz	41FF3Ah

l0041FEF9:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	4328B4h
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
	jz	41FFA1h

l0041FF3A:
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	0h
	push	2h
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
	push	28h
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	esi,eax
	mov	[ebx+60h],esi
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	4h

l0041FFA1:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	4328B8h
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
	jz	420049h

l0041FFE2:
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	0h
	push	2h
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
	push	20h
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	esi,eax
	mov	[ebx+60h],esi
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	4h

l00420049:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	4328BCh
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
	jz	4200F1h

l0042008A:
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	0h
	push	2h
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
	push	30h
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	esi,eax
	mov	[ebx+60h],esi
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	4h

l004200F1:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	4328C0h
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
	jz	420199h

l00420132:
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	0h
	push	2h
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
	push	32h
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	esi,eax
	mov	[ebx+60h],esi
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	4h

l00420199:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	4328C4h
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
	jz	420233h

l004201DA:
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	0h
	push	2h
	mov	ecx,edi
	call	40F760h
	xor	edx,edx
	mov	ecx,eax
	call	403C30h
	add	esp,4h
	shl	eax,2h
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
	push	3Ah
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	eax,2h
	jmp	4204A7h

l00420233:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	4328C8h
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
	jz	4202DEh

l00420274:
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	0h
	push	2h
	mov	ecx,edi
	call	40F760h
	xor	edx,edx
	mov	ecx,eax
	call	403C30h
	add	esp,4h
	shl	eax,2h
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
	push	3Ah
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	esi,eax
	mov	[ebx+60h],esi
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	4h

l004202DE:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	4328CCh
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
	jz	420386h

l0042031F:
	push	3h
	mov	ecx,edi
	call	40F760h
	push	eax
	mov	ecx,ebx
	call	41C910h
	push	eax
	push	0h
	push	2h
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
	push	2Eh
	mov	ecx,ebx
	mov	esi,eax
	call	41C5C0h
	add	esi,eax
	mov	[ebx+60h],esi
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	4h

l00420386:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	4328D0h
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
	jz	420419h

l004203C7:
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
	add	eax,4AAh
	jmp	4204A7h

l00420419:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp+8h],esp
	push	4328D8h
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
	jz	4204ACh

l0042045A:
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
	add	eax,42Ah

l004204A7:
	add	eax,esi

l004204A9:
	mov	[ebx+60h],eax

l004204AC:
	mov	ecx,[ebp-0Ch]
	mov	fs:[0000h],ecx
	pop	ecx
	pop	edi
	pop	esi
	pop	ebx
	mov	esp,ebp
	pop	ebp
	ret	4h

;; fn004204C0: 004204C0
;;   Called from:
;;     0041BFD5 (in fn0041AEF0)
fn004204C0 proc
	push	ebp
	mov	ebp,esp
	push	0FFh
	push	42FA20h
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
	mov	[ebp-14h],esp
	push	5h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	4328E0h
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
	jz	420582h

l0042053A:
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
	add	eax,1EEh
	jmp	4215F1h

l00420582:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-14h],esp
	push	5h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	4328E8h
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
	jz	420614h

l004205CC:
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
	add	eax,36Eh
	jmp	4215F1h

l00420614:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-14h],esp
	push	5h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	4328F0h
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
	jz	4206A6h

l0042065E:
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
	add	eax,16Eh
	jmp	4215F1h

l004206A6:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-14h],esp
	push	6h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	4328F8h
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
	jz	420738h

l004206F0:
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
	add	eax,56Eh
	jmp	4215F1h

l00420738:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-14h],esp
	push	6h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432900h
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
	jz	4207CAh

l00420782:
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
	add	eax,5EEh
	jmp	4215F1h

l004207CA:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-14h],esp
	push	5h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432908h
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
	jz	42085Ch

l00420814:
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
	add	eax,16Ah
	jmp	4215F1h

l0042085C:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-14h],esp
	push	4h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432910h
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
	jz	4208EEh

l004208A6:
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
	add	eax,1AEh
	jmp	4215F1h

l004208EE:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-14h],esp
	push	4h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432918h
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
	jz	420980h

l00420938:
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
	add	eax,32Eh
	jmp	4215F1h

l00420980:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-14h],esp
	push	4h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432920h
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
	jz	420A12h

l004209CA:
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
	add	eax,12Eh
	jmp	4215F1h

l00420A12:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-14h],esp
	push	5h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432928h
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
	jz	420AA4h

l00420A5C:
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
	add	eax,52Eh
	jmp	4215F1h

l00420AA4:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-14h],esp
	push	5h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432930h
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
	jz	420B36h

l00420AEE:
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
	add	eax,5AEh
	jmp	4215F1h

l00420B36:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-14h],esp
	push	4h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432938h
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
	jz	420BC8h

l00420B80:
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
	add	eax,12Ah
	jmp	4215F1h

l00420BC8:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-14h],esp
	push	4h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432940h
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
	jz	420CADh

l00420C16:
	mov	edx,1Ah
	call	427210h
	mulsd	xmm0,double ptr [432F00h]
	call	42D911h
	mov	esi,[edi]
	mov	[ebp-14h],eax
	lea	eax,[esi+48h]
	mov	[ebp-20h],eax
	call	dword ptr [43129Ch]
	add	esi,30h
	mov	[ebp-24h],eax
	cmp	dword ptr [esi+14h],10h
	jc	420C4Ch

l00420C4A:
	mov	esi,[esi]

l00420C4C:
	mov	dword ptr [eax],0h
	lea	eax,[ebp-18h]
	push	0h
	push	eax
	push	esi
	call	dword ptr [431200h]
	add	esp,0Ch
	mov	[ebp-1Ch],eax
	cmp	esi,[ebp-18h]
	jnz	420C75h

l00420C6A:
	push	431878h
	call	dword ptr [431134h]

l00420C75:
	mov	eax,[ebp-24h]
	cmp	dword ptr [eax],22h
	jz	420CA2h

l00420C7D:
	mov	esi,[edi]
	push	dword ptr [ebp-20h]
	add	esi,18h
	call	41C910h
	push	eax
	push	dword ptr [ebp-1Ch]
	push	esi
	call	41C910h
	push	eax
	call	41C740h
	add	eax,[ebp-14h]
	jmp	4215F3h

l00420CA2:
	push	431890h
	call	dword ptr [43119Ch]

l00420CAD:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-14h],esp
	push	4h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432948h
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
	jz	420D8Bh

l00420CFB:
	mov	edx,1Ah
	call	427210h
	mulsd	xmm0,double ptr [432F10h]
	call	42D911h
	mov	esi,[edi]
	mov	[ebp-18h],eax
	lea	eax,[esi+48h]
	mov	[ebp-20h],eax
	call	dword ptr [43129Ch]
	add	esi,30h
	mov	[ebp-1Ch],eax
	cmp	dword ptr [esi+14h],10h
	jc	420D31h

l00420D2F:
	mov	esi,[esi]

l00420D31:
	mov	dword ptr [eax],0h
	lea	eax,[ebp-14h]
	push	0h
	push	eax
	push	esi
	call	dword ptr [431200h]
	add	esp,0Ch
	mov	[ebp-24h],eax
	cmp	esi,[ebp-14h]
	jnz	420D5Ah

l00420D4F:
	push	431878h
	call	dword ptr [431134h]

l00420D5A:
	mov	eax,[ebp-1Ch]

l00420D5D:
	cmp	dword ptr [eax],22h
	jz	420CA2h

l00420D66:
	mov	esi,[edi]
	push	dword ptr [ebp-20h]
	add	esi,18h
	call	41C910h
	push	eax
	push	dword ptr [ebp-24h]
	push	esi
	call	41C910h
	push	eax
	call	41C740h
	add	eax,[ebp-18h]
	jmp	4215F3h

l00420D8B:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-14h],esp
	push	4h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432950h
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
	jz	420E12h

l00420DD5:
	mov	edx,1Ah
	call	427210h
	mulsd	xmm0,double ptr [432EF0h]

l00420DE7:
	call	42D911h
	mov	esi,[edi]
	mov	[ebp-18h],eax
	lea	eax,[esi+48h]
	mov	[ebp-20h],eax
	call	dword ptr [43129Ch]
	add	esi,30h
	mov	[ebp-1Ch],eax
	cmp	dword ptr [esi+14h],10h
	jc	420D31h

l00420E0D:
	jmp	420D2Fh

l00420E12:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-14h],esp
	push	5h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432958h
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
	jz	420E73h

l00420E5C:
	mov	edx,1Ah
	call	427210h
	mulsd	xmm0,double ptr [432F28h]
	jmp	420DE7h

l00420E73:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-14h],esp
	push	5h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432960h
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
	jz	420ED4h

l00420EBD:
	mov	edx,1Ah
	call	427210h
	mulsd	xmm0,double ptr [432F38h]
	jmp	420DE7h

l00420ED4:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-14h],esp
	push	4h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432968h
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
	jz	420FB2h

l00420F22:
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
	jc	420F58h

l00420F56:
	mov	esi,[esi]

l00420F58:
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

l00420F7A:
	mov	eax,[ebp-1Ch]
	cmp	dword ptr [eax],22h
	jz	420CA2h

l00420F86:
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
	mov	ecx,[ebp-18h]
	inc	ecx
	add	eax,ecx
	jmp	4215F3h

l00420FB2:
	sub	esp,18h
	mov	ecx,esp
	mov	[ebp-14h],esp
	push	6h
	mov	dword ptr [ecx+10h],0h
	mov	dword ptr [ecx+14h],0Fh
	push	432970h
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
	jz	421044h

l00420FFC:
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
	add	eax,72Ch
	jmp	4215F1h
