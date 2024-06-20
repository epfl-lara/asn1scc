; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49738 () Bool)

(assert start!49738)

(declare-fun b!234505 () Bool)

(declare-fun e!162109 () Bool)

(declare-datatypes ((array!12301 0))(
  ( (array!12302 (arr!6392 (Array (_ BitVec 32) (_ BitVec 8))) (size!5405 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9774 0))(
  ( (BitStream!9775 (buf!5880 array!12301) (currentByte!10941 (_ BitVec 32)) (currentBit!10936 (_ BitVec 32))) )
))
(declare-fun bs!63 () BitStream!9774)

(declare-fun moveBitIndexPrecond!0 (BitStream!9774 (_ BitVec 64)) Bool)

(assert (=> b!234505 (= e!162109 (not (moveBitIndexPrecond!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-datatypes ((tuple2!19692 0))(
  ( (tuple2!19693 (_1!10750 BitStream!9774) (_2!10750 Bool)) )
))
(declare-fun lt!370058 () tuple2!19692)

(declare-fun readBitPure!0 (BitStream!9774) tuple2!19692)

(assert (=> b!234505 (= lt!370058 (readBitPure!0 bs!63))))

(declare-fun nBits!274 () (_ BitVec 32))

(declare-fun acc!118 () (_ BitVec 64))

(declare-fun i!546 () (_ BitVec 32))

(declare-datatypes ((tuple2!19694 0))(
  ( (tuple2!19695 (_1!10751 BitStream!9774) (_2!10751 (_ BitVec 64))) )
))
(declare-fun lt!370059 () tuple2!19694)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!9774 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19694)

(assert (=> b!234505 (= lt!370059 (readNLeastSignificantBitsLoopPure!0 bs!63 nBits!274 i!546 acc!118))))

(declare-fun b!234506 () Bool)

(declare-fun res!196125 () Bool)

(assert (=> b!234506 (=> (not res!196125) (not e!162109))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!234506 (= res!196125 (validate_offset_bits!1 ((_ sign_extend 32) (size!5405 (buf!5880 bs!63))) ((_ sign_extend 32) (currentByte!10941 bs!63)) ((_ sign_extend 32) (currentBit!10936 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(declare-fun b!234507 () Bool)

(declare-fun res!196122 () Bool)

(assert (=> b!234507 (=> (not res!196122) (not e!162109))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!234507 (= res!196122 (= (bvand acc!118 (onesLSBLong!0 nBits!274)) acc!118))))

(declare-fun b!234508 () Bool)

(declare-fun res!196124 () Bool)

(assert (=> b!234508 (=> (not res!196124) (not e!162109))))

(assert (=> b!234508 (= res!196124 (= (bvand acc!118 (onesLSBLong!0 (bvsub nBits!274 i!546))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!196123 () Bool)

(assert (=> start!49738 (=> (not res!196123) (not e!162109))))

(assert (=> start!49738 (= res!196123 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000)))))

(assert (=> start!49738 e!162109))

(assert (=> start!49738 true))

(declare-fun e!162110 () Bool)

(declare-fun inv!12 (BitStream!9774) Bool)

(assert (=> start!49738 (and (inv!12 bs!63) e!162110)))

(declare-fun b!234509 () Bool)

(declare-fun array_inv!5146 (array!12301) Bool)

(assert (=> b!234509 (= e!162110 (array_inv!5146 (buf!5880 bs!63)))))

(assert (= (and start!49738 res!196123) b!234506))

(assert (= (and b!234506 res!196125) b!234508))

(assert (= (and b!234508 res!196124) b!234507))

(assert (= (and b!234507 res!196122) b!234505))

(assert (= start!49738 b!234509))

(declare-fun m!357119 () Bool)

(assert (=> b!234507 m!357119))

(declare-fun m!357121 () Bool)

(assert (=> b!234508 m!357121))

(declare-fun m!357123 () Bool)

(assert (=> b!234506 m!357123))

(declare-fun m!357125 () Bool)

(assert (=> start!49738 m!357125))

(declare-fun m!357127 () Bool)

(assert (=> b!234509 m!357127))

(declare-fun m!357129 () Bool)

(assert (=> b!234505 m!357129))

(declare-fun m!357131 () Bool)

(assert (=> b!234505 m!357131))

(declare-fun m!357133 () Bool)

(assert (=> b!234505 m!357133))

(check-sat (not b!234506) (not b!234508) (not b!234507) (not b!234505) (not start!49738) (not b!234509))
(check-sat)
(get-model)

(declare-fun d!79018 () Bool)

(assert (=> d!79018 (= (array_inv!5146 (buf!5880 bs!63)) (bvsge (size!5405 (buf!5880 bs!63)) #b00000000000000000000000000000000))))

(assert (=> b!234509 d!79018))

(declare-fun d!79020 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!79020 (= (inv!12 bs!63) (invariant!0 (currentBit!10936 bs!63) (currentByte!10941 bs!63) (size!5405 (buf!5880 bs!63))))))

(declare-fun bs!19707 () Bool)

(assert (= bs!19707 d!79020))

(declare-fun m!357155 () Bool)

(assert (=> bs!19707 m!357155))

(assert (=> start!49738 d!79020))

(declare-fun d!79022 () Bool)

(assert (=> d!79022 (= (onesLSBLong!0 (bvsub nBits!274 i!546)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!274 i!546)))))))

(assert (=> b!234508 d!79022))

(declare-fun d!79026 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!79026 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5405 (buf!5880 bs!63))) ((_ sign_extend 32) (currentByte!10941 bs!63)) ((_ sign_extend 32) (currentBit!10936 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5405 (buf!5880 bs!63))) ((_ sign_extend 32) (currentByte!10941 bs!63)) ((_ sign_extend 32) (currentBit!10936 bs!63))) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(declare-fun bs!19708 () Bool)

(assert (= bs!19708 d!79026))

(declare-fun m!357161 () Bool)

(assert (=> bs!19708 m!357161))

(assert (=> b!234506 d!79026))

(declare-fun d!79030 () Bool)

(assert (=> d!79030 (= (onesLSBLong!0 nBits!274) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!274))))))

(assert (=> b!234507 d!79030))

(declare-fun d!79032 () Bool)

(declare-fun res!196146 () Bool)

(declare-fun e!162128 () Bool)

(assert (=> d!79032 (=> (not res!196146) (not e!162128))))

(assert (=> d!79032 (= res!196146 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!5405 (buf!5880 bs!63)))) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5405 (buf!5880 bs!63)))))))))

(assert (=> d!79032 (= (moveBitIndexPrecond!0 bs!63 #b0000000000000000000000000000000000000000000000000000000000000001) e!162128)))

(declare-fun b!234536 () Bool)

(declare-fun lt!370086 () (_ BitVec 64))

(assert (=> b!234536 (= e!162128 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!370086) (bvsle lt!370086 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5405 (buf!5880 bs!63)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!234536 (= lt!370086 (bvadd (bitIndex!0 (size!5405 (buf!5880 bs!63)) (currentByte!10941 bs!63) (currentBit!10936 bs!63)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and d!79032 res!196146) b!234536))

(declare-fun m!357173 () Bool)

(assert (=> b!234536 m!357173))

(assert (=> b!234505 d!79032))

(declare-fun d!79048 () Bool)

(declare-datatypes ((tuple2!19708 0))(
  ( (tuple2!19709 (_1!10758 Bool) (_2!10758 BitStream!9774)) )
))
(declare-fun lt!370089 () tuple2!19708)

(declare-fun readBit!0 (BitStream!9774) tuple2!19708)

(assert (=> d!79048 (= lt!370089 (readBit!0 bs!63))))

(assert (=> d!79048 (= (readBitPure!0 bs!63) (tuple2!19693 (_2!10758 lt!370089) (_1!10758 lt!370089)))))

(declare-fun bs!19715 () Bool)

(assert (= bs!19715 d!79048))

(declare-fun m!357177 () Bool)

(assert (=> bs!19715 m!357177))

(assert (=> b!234505 d!79048))

(declare-fun d!79050 () Bool)

(declare-datatypes ((tuple2!19710 0))(
  ( (tuple2!19711 (_1!10759 (_ BitVec 64)) (_2!10759 BitStream!9774)) )
))
(declare-fun lt!370092 () tuple2!19710)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!9774 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19710)

(assert (=> d!79050 (= lt!370092 (readNLeastSignificantBitsLoop!0 bs!63 nBits!274 i!546 acc!118))))

(assert (=> d!79050 (= (readNLeastSignificantBitsLoopPure!0 bs!63 nBits!274 i!546 acc!118) (tuple2!19695 (_2!10759 lt!370092) (_1!10759 lt!370092)))))

(declare-fun bs!19716 () Bool)

(assert (= bs!19716 d!79050))

(declare-fun m!357179 () Bool)

(assert (=> bs!19716 m!357179))

(assert (=> b!234505 d!79050))

(check-sat (not d!79026) (not d!79048) (not d!79020) (not d!79050) (not b!234536))
(check-sat)
(get-model)

(declare-fun d!79052 () Bool)

(declare-fun e!162131 () Bool)

(assert (=> d!79052 e!162131))

(declare-fun res!196151 () Bool)

(assert (=> d!79052 (=> (not res!196151) (not e!162131))))

(declare-fun lt!370106 () (_ BitVec 64))

(declare-fun lt!370105 () (_ BitVec 64))

(declare-fun lt!370110 () (_ BitVec 64))

(assert (=> d!79052 (= res!196151 (= lt!370105 (bvsub lt!370106 lt!370110)))))

(assert (=> d!79052 (or (= (bvand lt!370106 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!370110 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!370106 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!370106 lt!370110) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79052 (= lt!370110 (remainingBits!0 ((_ sign_extend 32) (size!5405 (buf!5880 bs!63))) ((_ sign_extend 32) (currentByte!10941 bs!63)) ((_ sign_extend 32) (currentBit!10936 bs!63))))))

(declare-fun lt!370109 () (_ BitVec 64))

(declare-fun lt!370107 () (_ BitVec 64))

(assert (=> d!79052 (= lt!370106 (bvmul lt!370109 lt!370107))))

(assert (=> d!79052 (or (= lt!370109 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!370107 (bvsdiv (bvmul lt!370109 lt!370107) lt!370109)))))

(assert (=> d!79052 (= lt!370107 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!79052 (= lt!370109 ((_ sign_extend 32) (size!5405 (buf!5880 bs!63))))))

(assert (=> d!79052 (= lt!370105 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10941 bs!63)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10936 bs!63))))))

(assert (=> d!79052 (invariant!0 (currentBit!10936 bs!63) (currentByte!10941 bs!63) (size!5405 (buf!5880 bs!63)))))

(assert (=> d!79052 (= (bitIndex!0 (size!5405 (buf!5880 bs!63)) (currentByte!10941 bs!63) (currentBit!10936 bs!63)) lt!370105)))

(declare-fun b!234541 () Bool)

(declare-fun res!196152 () Bool)

(assert (=> b!234541 (=> (not res!196152) (not e!162131))))

(assert (=> b!234541 (= res!196152 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!370105))))

(declare-fun b!234542 () Bool)

(declare-fun lt!370108 () (_ BitVec 64))

(assert (=> b!234542 (= e!162131 (bvsle lt!370105 (bvmul lt!370108 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!234542 (or (= lt!370108 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!370108 #b0000000000000000000000000000000000000000000000000000000000001000) lt!370108)))))

(assert (=> b!234542 (= lt!370108 ((_ sign_extend 32) (size!5405 (buf!5880 bs!63))))))

(assert (= (and d!79052 res!196151) b!234541))

(assert (= (and b!234541 res!196152) b!234542))

(assert (=> d!79052 m!357161))

(assert (=> d!79052 m!357155))

(assert (=> b!234536 d!79052))

(declare-fun d!79054 () Bool)

(declare-fun e!162142 () Bool)

(assert (=> d!79054 e!162142))

(declare-fun res!196155 () Bool)

(assert (=> d!79054 (=> (not res!196155) (not e!162142))))

(declare-datatypes ((Unit!17279 0))(
  ( (Unit!17280) )
))
(declare-datatypes ((tuple2!19712 0))(
  ( (tuple2!19713 (_1!10760 Unit!17279) (_2!10760 BitStream!9774)) )
))
(declare-fun increaseBitIndex!0 (BitStream!9774) tuple2!19712)

(assert (=> d!79054 (= res!196155 (= (buf!5880 (_2!10760 (increaseBitIndex!0 bs!63))) (buf!5880 bs!63)))))

(declare-fun lt!370130 () Bool)

(assert (=> d!79054 (= lt!370130 (not (= (bvand ((_ sign_extend 24) (select (arr!6392 (buf!5880 bs!63)) (currentByte!10941 bs!63))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!10936 bs!63)))) #b00000000000000000000000000000000)))))

(declare-fun lt!370126 () tuple2!19708)

(assert (=> d!79054 (= lt!370126 (tuple2!19709 (not (= (bvand ((_ sign_extend 24) (select (arr!6392 (buf!5880 bs!63)) (currentByte!10941 bs!63))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!10936 bs!63)))) #b00000000000000000000000000000000)) (_2!10760 (increaseBitIndex!0 bs!63))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!79054 (validate_offset_bit!0 ((_ sign_extend 32) (size!5405 (buf!5880 bs!63))) ((_ sign_extend 32) (currentByte!10941 bs!63)) ((_ sign_extend 32) (currentBit!10936 bs!63)))))

(assert (=> d!79054 (= (readBit!0 bs!63) lt!370126)))

(declare-fun b!234545 () Bool)

(declare-fun lt!370131 () (_ BitVec 64))

(declare-fun lt!370129 () (_ BitVec 64))

(assert (=> b!234545 (= e!162142 (= (bitIndex!0 (size!5405 (buf!5880 (_2!10760 (increaseBitIndex!0 bs!63)))) (currentByte!10941 (_2!10760 (increaseBitIndex!0 bs!63))) (currentBit!10936 (_2!10760 (increaseBitIndex!0 bs!63)))) (bvadd lt!370131 lt!370129)))))

(assert (=> b!234545 (or (not (= (bvand lt!370131 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!370129 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!370131 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!370131 lt!370129) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!234545 (= lt!370129 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!234545 (= lt!370131 (bitIndex!0 (size!5405 (buf!5880 bs!63)) (currentByte!10941 bs!63) (currentBit!10936 bs!63)))))

(declare-fun lt!370125 () Bool)

(assert (=> b!234545 (= lt!370125 (not (= (bvand ((_ sign_extend 24) (select (arr!6392 (buf!5880 bs!63)) (currentByte!10941 bs!63))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!10936 bs!63)))) #b00000000000000000000000000000000)))))

(declare-fun lt!370127 () Bool)

(assert (=> b!234545 (= lt!370127 (not (= (bvand ((_ sign_extend 24) (select (arr!6392 (buf!5880 bs!63)) (currentByte!10941 bs!63))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!10936 bs!63)))) #b00000000000000000000000000000000)))))

(declare-fun lt!370128 () Bool)

(assert (=> b!234545 (= lt!370128 (not (= (bvand ((_ sign_extend 24) (select (arr!6392 (buf!5880 bs!63)) (currentByte!10941 bs!63))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!10936 bs!63)))) #b00000000000000000000000000000000)))))

(assert (= (and d!79054 res!196155) b!234545))

(declare-fun m!357181 () Bool)

(assert (=> d!79054 m!357181))

(declare-fun m!357183 () Bool)

(assert (=> d!79054 m!357183))

(declare-fun m!357185 () Bool)

(assert (=> d!79054 m!357185))

(declare-fun m!357187 () Bool)

(assert (=> d!79054 m!357187))

(assert (=> b!234545 m!357185))

(assert (=> b!234545 m!357183))

(declare-fun m!357189 () Bool)

(assert (=> b!234545 m!357189))

(assert (=> b!234545 m!357181))

(assert (=> b!234545 m!357173))

(assert (=> d!79048 d!79054))

(declare-fun b!234575 () Bool)

(declare-fun res!196184 () Bool)

(declare-fun e!162159 () Bool)

(assert (=> b!234575 (=> (not res!196184) (not e!162159))))

(declare-fun lt!370208 () (_ BitVec 64))

(declare-fun lt!370214 () (_ BitVec 64))

(declare-fun lt!370209 () tuple2!19710)

(assert (=> b!234575 (= res!196184 (= (bvlshr (_1!10759 lt!370209) lt!370214) (bvlshr acc!118 lt!370208)))))

(assert (=> b!234575 (and (bvsge lt!370208 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!370208 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!234575 (= lt!370208 ((_ sign_extend 32) (bvsub nBits!274 i!546)))))

(assert (=> b!234575 (or (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand i!546 #b10000000000000000000000000000000)) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 i!546) #b10000000000000000000000000000000)))))

(assert (=> b!234575 (and (bvsge lt!370214 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!370214 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!234575 (= lt!370214 ((_ sign_extend 32) (bvsub nBits!274 i!546)))))

(assert (=> b!234575 (or (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand i!546 #b10000000000000000000000000000000)) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 i!546) #b10000000000000000000000000000000)))))

(declare-fun b!234576 () Bool)

(declare-fun e!162160 () tuple2!19710)

(declare-fun lt!370207 () tuple2!19710)

(assert (=> b!234576 (= e!162160 (tuple2!19711 (_1!10759 lt!370207) (_2!10759 lt!370207)))))

(declare-fun lt!370211 () tuple2!19708)

(assert (=> b!234576 (= lt!370211 (readBit!0 bs!63))))

(assert (=> b!234576 (= lt!370207 (readNLeastSignificantBitsLoop!0 (_2!10758 lt!370211) nBits!274 (bvadd i!546 #b00000000000000000000000000000001) (bvor acc!118 (ite (_1!10758 lt!370211) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!274 #b00000000000000000000000000000001) i!546))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!234577 () Bool)

(declare-fun res!196185 () Bool)

(assert (=> b!234577 (=> (not res!196185) (not e!162159))))

(declare-fun lt!370213 () (_ BitVec 64))

(declare-fun lt!370210 () (_ BitVec 64))

(assert (=> b!234577 (= res!196185 (= (bitIndex!0 (size!5405 (buf!5880 (_2!10759 lt!370209))) (currentByte!10941 (_2!10759 lt!370209)) (currentBit!10936 (_2!10759 lt!370209))) (bvadd lt!370213 lt!370210)))))

(assert (=> b!234577 (or (not (= (bvand lt!370213 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!370210 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!370213 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!370213 lt!370210) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!234577 (= lt!370210 ((_ sign_extend 32) (bvsub nBits!274 i!546)))))

(assert (=> b!234577 (or (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand i!546 #b10000000000000000000000000000000)) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 i!546) #b10000000000000000000000000000000)))))

(assert (=> b!234577 (= lt!370213 (bitIndex!0 (size!5405 (buf!5880 bs!63)) (currentByte!10941 bs!63) (currentBit!10936 bs!63)))))

(declare-fun b!234578 () Bool)

(assert (=> b!234578 (= e!162160 (tuple2!19711 acc!118 bs!63))))

(declare-fun b!234579 () Bool)

(declare-fun res!196183 () Bool)

(assert (=> b!234579 (=> (not res!196183) (not e!162159))))

(assert (=> b!234579 (= res!196183 (= (bvand (_1!10759 lt!370209) (onesLSBLong!0 nBits!274)) (_1!10759 lt!370209)))))

(declare-fun d!79062 () Bool)

(assert (=> d!79062 e!162159))

(declare-fun res!196181 () Bool)

(assert (=> d!79062 (=> (not res!196181) (not e!162159))))

(assert (=> d!79062 (= res!196181 (= (buf!5880 (_2!10759 lt!370209)) (buf!5880 bs!63)))))

(assert (=> d!79062 (= lt!370209 e!162160)))

(declare-fun c!11260 () Bool)

(assert (=> d!79062 (= c!11260 (= nBits!274 i!546))))

(assert (=> d!79062 (and (bvsle #b00000000000000000000000000000000 i!546) (bvsle i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000))))

(assert (=> d!79062 (= (readNLeastSignificantBitsLoop!0 bs!63 nBits!274 i!546 acc!118) lt!370209)))

(declare-fun b!234580 () Bool)

(declare-fun e!162158 () Bool)

(declare-fun lt!370215 () (_ BitVec 64))

(assert (=> b!234580 (= e!162158 (= (= (bvand (bvlshr (_1!10759 lt!370209) lt!370215) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!10750 (readBitPure!0 bs!63))))))

(assert (=> b!234580 (and (bvsge lt!370215 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!370215 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!370212 () (_ BitVec 32))

(assert (=> b!234580 (= lt!370215 ((_ sign_extend 32) (bvsub lt!370212 i!546)))))

(assert (=> b!234580 (or (= (bvand lt!370212 #b10000000000000000000000000000000) (bvand i!546 #b10000000000000000000000000000000)) (= (bvand lt!370212 #b10000000000000000000000000000000) (bvand (bvsub lt!370212 i!546) #b10000000000000000000000000000000)))))

(assert (=> b!234580 (= lt!370212 (bvsub nBits!274 #b00000000000000000000000000000001))))

(assert (=> b!234580 (or (= (bvand nBits!274 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!234581 () Bool)

(assert (=> b!234581 (= e!162159 e!162158)))

(declare-fun res!196182 () Bool)

(assert (=> b!234581 (=> res!196182 e!162158)))

(assert (=> b!234581 (= res!196182 (bvsge i!546 nBits!274))))

(assert (= (and d!79062 c!11260) b!234578))

(assert (= (and d!79062 (not c!11260)) b!234576))

(assert (= (and d!79062 res!196181) b!234577))

(assert (= (and b!234577 res!196185) b!234575))

(assert (= (and b!234575 res!196184) b!234579))

(assert (= (and b!234579 res!196183) b!234581))

(assert (= (and b!234581 (not res!196182)) b!234580))

(assert (=> b!234576 m!357177))

(declare-fun m!357201 () Bool)

(assert (=> b!234576 m!357201))

(declare-fun m!357203 () Bool)

(assert (=> b!234577 m!357203))

(assert (=> b!234577 m!357173))

(assert (=> b!234579 m!357119))

(assert (=> b!234580 m!357131))

(assert (=> d!79050 d!79062))

(declare-fun d!79074 () Bool)

(assert (=> d!79074 (= (invariant!0 (currentBit!10936 bs!63) (currentByte!10941 bs!63) (size!5405 (buf!5880 bs!63))) (and (bvsge (currentBit!10936 bs!63) #b00000000000000000000000000000000) (bvslt (currentBit!10936 bs!63) #b00000000000000000000000000001000) (bvsge (currentByte!10941 bs!63) #b00000000000000000000000000000000) (or (bvslt (currentByte!10941 bs!63) (size!5405 (buf!5880 bs!63))) (and (= (currentBit!10936 bs!63) #b00000000000000000000000000000000) (= (currentByte!10941 bs!63) (size!5405 (buf!5880 bs!63)))))))))

(assert (=> d!79020 d!79074))

(declare-fun d!79076 () Bool)

(assert (=> d!79076 (= (remainingBits!0 ((_ sign_extend 32) (size!5405 (buf!5880 bs!63))) ((_ sign_extend 32) (currentByte!10941 bs!63)) ((_ sign_extend 32) (currentBit!10936 bs!63))) (bvsub (bvmul ((_ sign_extend 32) (size!5405 (buf!5880 bs!63))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10941 bs!63)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10936 bs!63)))))))

(assert (=> d!79026 d!79076))

(check-sat (not d!79054) (not b!234545) (not b!234576) (not b!234580) (not b!234577) (not b!234579) (not d!79052))
(check-sat)
