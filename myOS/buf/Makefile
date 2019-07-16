OBJS_BOOTPACK = bootpack.obj naskfunc.obj hankaku.obj graphic.obj dsctbl.obj \
		int.obj fifo.obj keyboard.obj mouse.obj memory.obj sheet.obj timer.obj \
		mtask.obj window.obj console.obj file.obj

TOOLPATH = ../../z_tools/
INCPATH  = ../../z_tools/haribote/

MAKE     = make -r
NASK     = $(TOOLPATH)nask
CC1      = $(TOOLPATH)gocc1 -I$(INCPATH) -Os -Wall -quiet
GAS2NASK = $(TOOLPATH)gas2nask -a
OBJ2BIM  = $(TOOLPATH)obj2bim
MAKEFONT = $(TOOLPATH)makefont
BIN2OBJ  = $(TOOLPATH)bin2obj
BIM2HRB  = $(TOOLPATH)bim2hrb
RULEFILE = $(TOOLPATH)haribote/haribote.rul
EDIMG    = $(TOOLPATH)edimg
IMGTOL   = $(TOOLPATH)imgtol
COPY     = cp
DEL      = rm -f

# デフォルト動作

default :
	$(MAKE) img

# ファイル生成規則

ipl10.bin : ipl10.nas Makefile
	$(NASK) ipl10.nas ipl10.bin ipl10.lst

asmhead.bin : asmhead.nas Makefile
	$(NASK) asmhead.nas asmhead.bin asmhead.lst

hankaku.bin : hankaku.txt Makefile
	$(MAKEFONT) hankaku.txt hankaku.bin

hankaku.obj : hankaku.bin Makefile
	$(BIN2OBJ) hankaku.bin hankaku.obj _hankaku

bootpack.bim : $(OBJS_BOOTPACK) Makefile
	$(OBJ2BIM) @$(RULEFILE) out:bootpack.bim stack:3136k map:bootpack.map \
		$(OBJS_BOOTPACK)
# 3MB+64KB=3136KB

haribote.sys : asmhead.bin bootpack.hrb Makefile
	cat asmhead.bin bootpack.hrb > haribote.sys

%.bim : %.obj a_nask.obj Makefile
	$(OBJ2BIM) @$(RULEFILE) out:$*.bim stack:1k map:$*.map $*.obj a_nask.obj

%.hrb : %.bim Makefile
	$(BIM2HRB) $*.bim $*.hrb 0

%.hrb : %.nas Makefile
	$(NASK) $*.nas $*.hrb $*.lst

haribote.img : ipl10.bin haribote.sys Makefile \
		hello.hrb hello2.hrb hello3.hrb hello4.hrb hello5.hrb a.hrb crack1.hrb crack2.hrb crack3.hrb crack4.hrb crack5.hrb crack6.hrb bug1.hrb bug2.hrb bug3.hrb
	$(EDIMG)   imgin:../../z_tools/fdimg0at.tek \
		wbinimg src:ipl10.bin len:512 from:0 to:0 \
		copy from:haribote.sys to:@: \
		copy from:ipl10.nas to:@: \
		copy from:make.bat to:@: \
		copy from:a.hrb to:@: \
		copy from:hello.hrb to:@: \
		copy from:hello2.hrb to:@: \
		copy from:hello3.hrb to:@: \
		copy from:hello4.hrb to:@: \
		copy from:hello5.hrb to:@: \
		copy from:crack1.hrb to:@: \
		copy from:crack2.hrb to:@: \
		copy from:crack3.hrb to:@: \
		copy from:crack4.hrb to:@: \
		copy from:crack5.hrb to:@: \
		copy from:crack6.hrb to:@: \
		copy from:bug1.hrb to:@: \
		copy from:bug2.hrb to:@: \
		copy from:bug3.hrb to:@: \
		imgout:haribote.img

# 一般規則

%.gas : %.c bootpack.h Makefile
	$(CC1) -o $*.gas $*.c

%.nas : %.gas Makefile
	$(GAS2NASK) $*.gas $*.nas

%.obj : %.nas Makefile
	$(NASK) $*.nas $*.obj $*.lst

# コマンド

img :
	$(MAKE) haribote.img

run :
	$(MAKE) img
	$(COPY) haribote.img ../../z_tools/qemu/fdimage0.bin
	$(MAKE) -C ../../z_tools/qemu

install :
	$(MAKE) img
	$(IMGTOL) w a: haribote.img

clean :
	-$(DEL) *.bin
	-$(DEL) *.lst
	-$(DEL) *.obj
	-$(DEL) *.map
	-$(DEL) *.bim
	-$(DEL) *.hrb
	-$(DEL) haribote.sys

src_only :
	$(MAKE) clean
	-$(DEL) haribote.img
