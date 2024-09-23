module earthboundbeginnings.bank1e;

import earthboundbeginnings.bank13;
import earthboundbeginnings.bank14;
import earthboundbeginnings.bank1f;
import earthboundbeginnings.external;
import earthboundbeginnings.globals;

/**
 * Original_Address: $(DOLLAR) $CB44, bank $1E
 */
void unknownCB44() {
	static void unknownCB448() {
		if (zp48 == 0) {
			return unknownCB76();
		} else if (zp48 == 0xA2) {
			unknownCEE1();
			unknown149779();
			if (unknownF202()) {
				return unknownCB5D();
			}
			unknownCEE1();
			return unknown97A3();
		}
		unknownFD33();
		if (unknownF202()) {
			return unknownCB5D();
		}
		unknownFD28(unk078C);
		if (zp21) {
			unknownCED3();
			unknownAB53();
			if (zp20) {
				return unknownCB5D();
			}
			return unknownCB70();
		}
	}
	static void unknownCB447() {
		unknownCEE1();
		unknown9516();
		return unknownCB448();
	}
	static void unknownCB446() {
		unknownA178();
		return unknownCB447();
	}
	static void unknownCB445() {
		unknown13A000();
		return unknownCB447();
	}
	static void unknownCB444() {
		const a = unknownCC9D();
		if (!(a & 0xA0)) {
			return unknownCB447();
		} else if ((a & 0xA0) >= 0x80) {
			return unknownCB445();
		}
		unknownA82F();
		return unknownCB447();
	}
	unknownFDED();
	unk07EF = 0xC0;
	unknownCEE1();
	unknown9400();
	unk07EF = 0;
	do {
		unknownCED3();
		unknownBCEC();
		unknownC542();
		unknownCEFC();
		zp24 = 0;
		zp0D = (unknown7406 & 0xF) ^ 0x84;
		unknownFD5E();
		unknownCFAC();
		unknownDE99();
		unknownEEF0();
		if (zp25 == 0) {
			if (!(zpDE & 0x70)) {
				zp1F = 0;
			} else if (!(unknownCC9D() & 0x8)) {
				zp1F = 0;
			} else {
				zp1F = 1;
			}
		}
		unknownFD33();
	} while (zp20 != 0);
	unknownDD01();
	unknownDFDA();
	unknownCC2B();
	if (zp21 != 0) {
		unknownCED3();
		if (!unknownA1C6()) {
			return unknownCB448();
		}
	}
	unknownCED3();
	const y = zpDA;
	zpDA = 0;
	if (zp22 || zp23 || zp21 || zp20) {
		return unknownCB448();
	}
	if (((y & 0xF0) >= 0x80)) {
		return unknownCB446();
	}
	if (y & 0xF0) {
		return unknownCB444();
	}
	unknownA123();
	return unknownCB447();
}

/**
 * Original_Address: $(DOLLAR) $CEE1, bank $1E
 */
void unknownCEE1() {
	assert(0, "NYI");
}
