; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34718 () Bool)

(assert start!34718)

(declare-fun b!164305 () Bool)

(declare-fun res!136913 () Bool)

(declare-fun e!113538 () Bool)

(assert (=> b!164305 (=> res!136913 e!113538)))

(declare-fun lt!257841 () (_ BitVec 32))

(declare-fun nBits!511 () (_ BitVec 32))

(declare-datatypes ((array!8222 0))(
  ( (array!8223 (arr!4602 (Array (_ BitVec 32) (_ BitVec 8))) (size!3681 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6518 0))(
  ( (BitStream!6519 (buf!4133 array!8222) (currentByte!7706 (_ BitVec 32)) (currentBit!7701 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6518)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!164305 (= res!136913 (not (= (bitIndex!0 (size!3681 (buf!4133 thiss!1577)) (bvadd #b00000000000000000000000000000001 (currentByte!7706 thiss!1577)) lt!257841) (bvadd (bitIndex!0 (size!3681 (buf!4133 thiss!1577)) (currentByte!7706 thiss!1577) (currentBit!7701 thiss!1577)) ((_ sign_extend 32) nBits!511)))))))

(declare-fun b!164306 () Bool)

(declare-fun e!113535 () Bool)

(assert (=> b!164306 (= e!113535 (not e!113538))))

(declare-fun res!136912 () Bool)

(assert (=> b!164306 (=> res!136912 e!113538)))

(declare-fun lt!257837 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!164306 (= res!136912 (not (byteRangesEq!0 (select (arr!4602 (buf!4133 thiss!1577)) (currentByte!7706 thiss!1577)) lt!257837 #b00000000000000000000000000000000 lt!257841)))))

(declare-fun lt!257844 () array!8222)

(declare-fun arrayRangesEq!615 (array!8222 array!8222 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!164306 (arrayRangesEq!615 (buf!4133 thiss!1577) lt!257844 #b00000000000000000000000000000000 (currentByte!7706 thiss!1577))))

(declare-fun lt!257839 () array!8222)

(declare-datatypes ((Unit!11439 0))(
  ( (Unit!11440) )
))
(declare-fun lt!257847 () Unit!11439)

(declare-fun arrayRangesEqTransitive!162 (array!8222 array!8222 array!8222 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11439)

(assert (=> b!164306 (= lt!257847 (arrayRangesEqTransitive!162 (buf!4133 thiss!1577) lt!257839 lt!257844 #b00000000000000000000000000000000 (currentByte!7706 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!7706 thiss!1577))))))

(assert (=> b!164306 (arrayRangesEq!615 lt!257839 lt!257844 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7706 thiss!1577)))))

(declare-fun lt!257846 () (_ BitVec 8))

(declare-fun lt!257845 () Unit!11439)

(declare-fun arrayUpdatedAtPrefixLemma!223 (array!8222 (_ BitVec 32) (_ BitVec 8)) Unit!11439)

(assert (=> b!164306 (= lt!257845 (arrayUpdatedAtPrefixLemma!223 lt!257839 (bvadd #b00000000000000000000000000000001 (currentByte!7706 thiss!1577)) lt!257846))))

(assert (=> b!164306 (arrayRangesEq!615 (buf!4133 thiss!1577) (array!8223 (store (arr!4602 (buf!4133 thiss!1577)) (currentByte!7706 thiss!1577) lt!257837) (size!3681 (buf!4133 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7706 thiss!1577))))

(declare-fun lt!257838 () Unit!11439)

(assert (=> b!164306 (= lt!257838 (arrayUpdatedAtPrefixLemma!223 (buf!4133 thiss!1577) (currentByte!7706 thiss!1577) lt!257837))))

(declare-fun lt!257840 () (_ BitVec 32))

(assert (=> b!164306 (= lt!257837 (select (store (store (arr!4602 (buf!4133 thiss!1577)) (currentByte!7706 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4602 (buf!4133 thiss!1577)) (currentByte!7706 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7701 thiss!1577)))))))) (bvlshr (bvand lt!257840 #b00000000000000000000000011111111) lt!257841)))) (bvadd #b00000000000000000000000000000001 (currentByte!7706 thiss!1577)) lt!257846) (currentByte!7706 thiss!1577)))))

(assert (=> b!164306 (= lt!257844 (array!8223 (store (store (arr!4602 (buf!4133 thiss!1577)) (currentByte!7706 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4602 (buf!4133 thiss!1577)) (currentByte!7706 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7701 thiss!1577)))))))) (bvlshr (bvand lt!257840 #b00000000000000000000000011111111) lt!257841)))) (bvadd #b00000000000000000000000000000001 (currentByte!7706 thiss!1577)) lt!257846) (size!3681 (buf!4133 thiss!1577))))))

(declare-fun lt!257843 () (_ BitVec 32))

(assert (=> b!164306 (= lt!257846 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4602 (buf!4133 thiss!1577)) (currentByte!7706 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4602 (buf!4133 thiss!1577)) (currentByte!7706 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7701 thiss!1577)))))))) (bvlshr (bvand lt!257840 #b00000000000000000000000011111111) lt!257841)))) (bvadd #b00000000000000000000000000000001 (currentByte!7706 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!257843))) (bvshl lt!257840 lt!257843))))))

(assert (=> b!164306 (= lt!257843 (bvsub #b00000000000000000000000000001000 lt!257841))))

(assert (=> b!164306 (= lt!257839 (array!8223 (store (arr!4602 (buf!4133 thiss!1577)) (currentByte!7706 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4602 (buf!4133 thiss!1577)) (currentByte!7706 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7701 thiss!1577)))))))) (bvlshr (bvand lt!257840 #b00000000000000000000000011111111) lt!257841)))) (size!3681 (buf!4133 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!164306 (= lt!257840 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!164306 (= lt!257841 (bvsub (bvadd (currentBit!7701 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun res!136916 () Bool)

(assert (=> start!34718 (=> (not res!136916) (not e!113535))))

(assert (=> start!34718 (= res!136916 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34718 e!113535))

(assert (=> start!34718 true))

(declare-fun e!113536 () Bool)

(declare-fun inv!12 (BitStream!6518) Bool)

(assert (=> start!34718 (and (inv!12 thiss!1577) e!113536)))

(declare-fun b!164307 () Bool)

(assert (=> b!164307 (= e!113538 true)))

(declare-fun lt!257842 () Bool)

(declare-fun isPrefixOf!0 (BitStream!6518 BitStream!6518) Bool)

(assert (=> b!164307 (= lt!257842 (isPrefixOf!0 thiss!1577 (BitStream!6519 lt!257844 (bvadd #b00000000000000000000000000000001 (currentByte!7706 thiss!1577)) lt!257841)))))

(declare-fun b!164308 () Bool)

(declare-fun array_inv!3422 (array!8222) Bool)

(assert (=> b!164308 (= e!113536 (array_inv!3422 (buf!4133 thiss!1577)))))

(declare-fun b!164309 () Bool)

(declare-fun res!136914 () Bool)

(assert (=> b!164309 (=> (not res!136914) (not e!113535))))

(assert (=> b!164309 (= res!136914 (bvsgt (bvadd (currentBit!7701 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!164310 () Bool)

(declare-fun res!136915 () Bool)

(assert (=> b!164310 (=> (not res!136915) (not e!113535))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164310 (= res!136915 (validate_offset_bits!1 ((_ sign_extend 32) (size!3681 (buf!4133 thiss!1577))) ((_ sign_extend 32) (currentByte!7706 thiss!1577)) ((_ sign_extend 32) (currentBit!7701 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(assert (= (and start!34718 res!136916) b!164310))

(assert (= (and b!164310 res!136915) b!164309))

(assert (= (and b!164309 res!136914) b!164306))

(assert (= (and b!164306 (not res!136912)) b!164305))

(assert (= (and b!164305 (not res!136913)) b!164307))

(assert (= start!34718 b!164308))

(declare-fun m!261195 () Bool)

(assert (=> start!34718 m!261195))

(declare-fun m!261197 () Bool)

(assert (=> b!164307 m!261197))

(declare-fun m!261199 () Bool)

(assert (=> b!164308 m!261199))

(declare-fun m!261201 () Bool)

(assert (=> b!164306 m!261201))

(declare-fun m!261203 () Bool)

(assert (=> b!164306 m!261203))

(declare-fun m!261205 () Bool)

(assert (=> b!164306 m!261205))

(declare-fun m!261207 () Bool)

(assert (=> b!164306 m!261207))

(declare-fun m!261209 () Bool)

(assert (=> b!164306 m!261209))

(declare-fun m!261211 () Bool)

(assert (=> b!164306 m!261211))

(declare-fun m!261213 () Bool)

(assert (=> b!164306 m!261213))

(declare-fun m!261215 () Bool)

(assert (=> b!164306 m!261215))

(declare-fun m!261217 () Bool)

(assert (=> b!164306 m!261217))

(declare-fun m!261219 () Bool)

(assert (=> b!164306 m!261219))

(declare-fun m!261221 () Bool)

(assert (=> b!164306 m!261221))

(declare-fun m!261223 () Bool)

(assert (=> b!164306 m!261223))

(declare-fun m!261225 () Bool)

(assert (=> b!164306 m!261225))

(declare-fun m!261227 () Bool)

(assert (=> b!164306 m!261227))

(assert (=> b!164306 m!261205))

(declare-fun m!261229 () Bool)

(assert (=> b!164306 m!261229))

(declare-fun m!261231 () Bool)

(assert (=> b!164306 m!261231))

(declare-fun m!261233 () Bool)

(assert (=> b!164310 m!261233))

(declare-fun m!261235 () Bool)

(assert (=> b!164305 m!261235))

(declare-fun m!261237 () Bool)

(assert (=> b!164305 m!261237))

(push 1)

(assert (not b!164305))

(assert (not b!164306))

(assert (not b!164307))

