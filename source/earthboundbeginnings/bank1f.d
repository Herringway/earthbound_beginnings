module earthboundbeginnings.bank1f;

import librehome.nes : MirrorType;

import earthboundbeginnings.bank1c;
import earthboundbeginnings.bank1e;
import earthboundbeginnings.external;
import earthboundbeginnings.globals;

/**
 * Original_Address: $(DOLLAR) $F202, bank $1F
 */
bool unknownF202() {
	assert(0, "NYI");
}

/**
 * Original_Address: $(DOLLAR) $FC8A, bank $1F
 */
void unknownFC8A() {
	ubyte i = 0;
	while (true) {
		unk0200[i] = 0xF0;
		i += 4;
		if (i == 0) {
			break;
		}
	}
}

/**
 * Original_Address: $(DOLLAR) $FCEE, bank $1F
 */
void unknownFCEE() {
	ubyte a = 0;
	while (++a != 0) {
		// clear zero page...
	}
	unknownFC8A();
	nes.PPUCTRL = 0x08;
	zpFF = 0x08;
	zpEF = 0x80; // enable A12 inversion, use fixed $C000 and swappable $8000
	nes.PPUMASK = 0x18;
	zpFE = 0x18;
	nes.setNametableMirroring(MirrorType.vertical);
}

/**
 * Original_Address: $(DOLLAR) $FD14, bank $1F
 */
void unknownFD14() {
	zp07 = 0x1C;
	unk0700[] = 0x00;
	unknownFFC5();
	return unknown1C8006();
}

/**
 * Original_Address: $(DOLLAR) $FD28, bank $1F
 */
void unknownFD28(ubyte a) {
	assert(0, "NYI");
}

/**
 * Original_Address: $(DOLLAR) $FD33, bank $1F
 */
void unknownFD33() {
	assert(0, "NYI");
}

/** Game's entry point, prepares hardware
 * Original_Address: $(DOLLAR) $FF40, bank $1F
 */
void reset() {
	nes.PPUCTRL = 0x08;
	nes.interruptsEnabled = false;
	nes.PPUMASK = 0x00;
	nes.SND_CHN = 0x00;
	nes.DMC_FREQ = 0x00;
	//nes.IRQDISABLE = 0x00;
	nes.JOY2 = 0x40;
	//nes.PRGRAMPROTECT = 0x40;
	for (ubyte frames = 2; frames != 0; frames--) {
		nes.wait();
	}
	nes.PPUADDR = 0x3F;
	nes.PPUADDR = 0x00;
	for (ubyte bytes = 32; bytes != 0; bytes--) {
		nes.PPUDATA = 0x0F;
	};
	nes.PPUADDR = 0x3F;
	nes.PPUADDR = 0x00;
	nes.PPUADDR = 0x00; //work around hardware bug
	nes.PPUADDR = 0x00;
	nes.PPUMASK = 0x1E;
	ubyte ppuAddrWrite = 0x10;
	for (ubyte bytes = 16; bytes != 0; bytes--) {
		nes.PPUADDR = ppuAddrWrite;
		nes.PPUADDR = ppuAddrWrite;
		ppuAddrWrite ^= 0x00; //pointless?
	}
	// initialize stack, mapper...
	unknownFCEE();
	unknownFD14();
	bankSwap(0x13, 0x07);
	zpFF |= 0x80;
	nes.PPUCTRL = zpFF;
	nes.interruptsEnabled = true;
	return unknownCB44();
}

/**
 * Original_Address: $(DOLLAR) $FFC5, bank $1F
 */
void unknownFFC5() {
	bankSwap(zp07, 0x06); //$8000
	bankSwap(0x1D, 0x07); //$A000
}

/** Swaps PRG banks
 * Original_Address: $(DOLLAR) $FFD0, bank $1F
 */
void bankSwap(ubyte a, ubyte x) {
	// This is more meaningful for an MMC3
	zpEE = x;
	zpF0[x] = a;
	ubyte bankselect = x | zpEF;
	ubyte bankdata = zpF0[x];
}
