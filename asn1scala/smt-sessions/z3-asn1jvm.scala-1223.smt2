; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34722 () Bool)

(assert start!34722)

(declare-fun b!164346 () Bool)

(declare-fun e!113564 () Bool)

(assert (=> b!164346 (= e!113564 true)))

(declare-datatypes ((array!8226 0))(
  ( (array!8227 (arr!4604 (Array (_ BitVec 32) (_ BitVec 8))) (size!3683 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6522 0))(
  ( (BitStream!6523 (buf!4135 array!8226) (currentByte!7708 (_ BitVec 32)) (currentBit!7703 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!14542 0))(
  ( (tuple2!14543 (_1!7862 BitStream!6522) (_2!7862 BitStream!6522)) )
))
(declare-fun lt!257915 () tuple2!14542)

(declare-fun thiss!1577 () BitStream!6522)

(declare-fun lt!257911 () BitStream!6522)

(declare-fun reader!0 (BitStream!6522 BitStream!6522) tuple2!14542)

(assert (=> b!164346 (= lt!257915 (reader!0 thiss!1577 lt!257911))))

(declare-fun b!164347 () Bool)

(declare-fun res!136950 () Bool)

(assert (=> b!164347 (=> res!136950 e!113564)))

(declare-fun isPrefixOf!0 (BitStream!6522 BitStream!6522) Bool)

(assert (=> b!164347 (= res!136950 (not (isPrefixOf!0 thiss!1577 lt!257911)))))

(declare-fun b!164348 () Bool)

(declare-fun e!113568 () Bool)

(assert (=> b!164348 (= e!113568 e!113564)))

(declare-fun res!136948 () Bool)

(assert (=> b!164348 (=> res!136948 e!113564)))

(declare-fun lt!257912 () (_ BitVec 32))

(declare-fun nBits!511 () (_ BitVec 32))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!164348 (= res!136948 (not (= (bitIndex!0 (size!3683 (buf!4135 thiss!1577)) (bvadd #b00000000000000000000000000000001 (currentByte!7708 thiss!1577)) lt!257912) (bvadd (bitIndex!0 (size!3683 (buf!4135 thiss!1577)) (currentByte!7708 thiss!1577) (currentBit!7703 thiss!1577)) ((_ sign_extend 32) nBits!511)))))))

(declare-fun lt!257916 () array!8226)

(assert (=> b!164348 (= lt!257911 (BitStream!6523 lt!257916 (bvadd #b00000000000000000000000000000001 (currentByte!7708 thiss!1577)) lt!257912))))

(declare-fun b!164349 () Bool)

(declare-fun e!113567 () Bool)

(assert (=> b!164349 (= e!113567 (not e!113568))))

(declare-fun res!136947 () Bool)

(assert (=> b!164349 (=> res!136947 e!113568)))

(declare-fun lt!257917 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!164349 (= res!136947 (not (byteRangesEq!0 (select (arr!4604 (buf!4135 thiss!1577)) (currentByte!7708 thiss!1577)) lt!257917 #b00000000000000000000000000000000 lt!257912)))))

(declare-fun arrayRangesEq!617 (array!8226 array!8226 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!164349 (arrayRangesEq!617 (buf!4135 thiss!1577) lt!257916 #b00000000000000000000000000000000 (currentByte!7708 thiss!1577))))

(declare-fun lt!257918 () array!8226)

(declare-datatypes ((Unit!11443 0))(
  ( (Unit!11444) )
))
(declare-fun lt!257914 () Unit!11443)

(declare-fun arrayRangesEqTransitive!164 (array!8226 array!8226 array!8226 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11443)

(assert (=> b!164349 (= lt!257914 (arrayRangesEqTransitive!164 (buf!4135 thiss!1577) lt!257918 lt!257916 #b00000000000000000000000000000000 (currentByte!7708 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!7708 thiss!1577))))))

(assert (=> b!164349 (arrayRangesEq!617 lt!257918 lt!257916 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7708 thiss!1577)))))

(declare-fun lt!257908 () (_ BitVec 8))

(declare-fun lt!257910 () Unit!11443)

(declare-fun arrayUpdatedAtPrefixLemma!225 (array!8226 (_ BitVec 32) (_ BitVec 8)) Unit!11443)

(assert (=> b!164349 (= lt!257910 (arrayUpdatedAtPrefixLemma!225 lt!257918 (bvadd #b00000000000000000000000000000001 (currentByte!7708 thiss!1577)) lt!257908))))

(assert (=> b!164349 (arrayRangesEq!617 (buf!4135 thiss!1577) (array!8227 (store (arr!4604 (buf!4135 thiss!1577)) (currentByte!7708 thiss!1577) lt!257917) (size!3683 (buf!4135 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7708 thiss!1577))))

(declare-fun lt!257909 () Unit!11443)

(assert (=> b!164349 (= lt!257909 (arrayUpdatedAtPrefixLemma!225 (buf!4135 thiss!1577) (currentByte!7708 thiss!1577) lt!257917))))

(declare-fun lt!257919 () (_ BitVec 32))

(assert (=> b!164349 (= lt!257917 (select (store (store (arr!4604 (buf!4135 thiss!1577)) (currentByte!7708 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4604 (buf!4135 thiss!1577)) (currentByte!7708 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7703 thiss!1577)))))))) (bvlshr (bvand lt!257919 #b00000000000000000000000011111111) lt!257912)))) (bvadd #b00000000000000000000000000000001 (currentByte!7708 thiss!1577)) lt!257908) (currentByte!7708 thiss!1577)))))

(assert (=> b!164349 (= lt!257916 (array!8227 (store (store (arr!4604 (buf!4135 thiss!1577)) (currentByte!7708 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4604 (buf!4135 thiss!1577)) (currentByte!7708 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7703 thiss!1577)))))))) (bvlshr (bvand lt!257919 #b00000000000000000000000011111111) lt!257912)))) (bvadd #b00000000000000000000000000000001 (currentByte!7708 thiss!1577)) lt!257908) (size!3683 (buf!4135 thiss!1577))))))

(declare-fun lt!257913 () (_ BitVec 32))

(assert (=> b!164349 (= lt!257908 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4604 (buf!4135 thiss!1577)) (currentByte!7708 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4604 (buf!4135 thiss!1577)) (currentByte!7708 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7703 thiss!1577)))))))) (bvlshr (bvand lt!257919 #b00000000000000000000000011111111) lt!257912)))) (bvadd #b00000000000000000000000000000001 (currentByte!7708 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!257913))) (bvshl lt!257919 lt!257913))))))

(assert (=> b!164349 (= lt!257913 (bvsub #b00000000000000000000000000001000 lt!257912))))

(assert (=> b!164349 (= lt!257918 (array!8227 (store (arr!4604 (buf!4135 thiss!1577)) (currentByte!7708 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4604 (buf!4135 thiss!1577)) (currentByte!7708 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7703 thiss!1577)))))))) (bvlshr (bvand lt!257919 #b00000000000000000000000011111111) lt!257912)))) (size!3683 (buf!4135 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!164349 (= lt!257919 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!164349 (= lt!257912 (bvsub (bvadd (currentBit!7703 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!164350 () Bool)

(declare-fun res!136949 () Bool)

(assert (=> b!164350 (=> (not res!136949) (not e!113567))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164350 (= res!136949 (validate_offset_bits!1 ((_ sign_extend 32) (size!3683 (buf!4135 thiss!1577))) ((_ sign_extend 32) (currentByte!7708 thiss!1577)) ((_ sign_extend 32) (currentBit!7703 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun res!136952 () Bool)

(assert (=> start!34722 (=> (not res!136952) (not e!113567))))

(assert (=> start!34722 (= res!136952 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34722 e!113567))

(assert (=> start!34722 true))

(declare-fun e!113565 () Bool)

(declare-fun inv!12 (BitStream!6522) Bool)

(assert (=> start!34722 (and (inv!12 thiss!1577) e!113565)))

(declare-fun b!164351 () Bool)

(declare-fun res!136951 () Bool)

(assert (=> b!164351 (=> (not res!136951) (not e!113567))))

(assert (=> b!164351 (= res!136951 (bvsgt (bvadd (currentBit!7703 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!164352 () Bool)

(declare-fun array_inv!3424 (array!8226) Bool)

(assert (=> b!164352 (= e!113565 (array_inv!3424 (buf!4135 thiss!1577)))))

(assert (= (and start!34722 res!136952) b!164350))

(assert (= (and b!164350 res!136949) b!164351))

(assert (= (and b!164351 res!136951) b!164349))

(assert (= (and b!164349 (not res!136947)) b!164348))

(assert (= (and b!164348 (not res!136948)) b!164347))

(assert (= (and b!164347 (not res!136950)) b!164346))

(assert (= start!34722 b!164352))

(declare-fun m!261285 () Bool)

(assert (=> b!164347 m!261285))

(declare-fun m!261287 () Bool)

(assert (=> start!34722 m!261287))

(declare-fun m!261289 () Bool)

(assert (=> b!164348 m!261289))

(declare-fun m!261291 () Bool)

(assert (=> b!164348 m!261291))

(declare-fun m!261293 () Bool)

(assert (=> b!164352 m!261293))

(declare-fun m!261295 () Bool)

(assert (=> b!164346 m!261295))

(declare-fun m!261297 () Bool)

(assert (=> b!164350 m!261297))

(declare-fun m!261299 () Bool)

(assert (=> b!164349 m!261299))

(declare-fun m!261301 () Bool)

(assert (=> b!164349 m!261301))

(declare-fun m!261303 () Bool)

(assert (=> b!164349 m!261303))

(declare-fun m!261305 () Bool)

(assert (=> b!164349 m!261305))

(declare-fun m!261307 () Bool)

(assert (=> b!164349 m!261307))

(declare-fun m!261309 () Bool)

(assert (=> b!164349 m!261309))

(declare-fun m!261311 () Bool)

(assert (=> b!164349 m!261311))

(declare-fun m!261313 () Bool)

(assert (=> b!164349 m!261313))

(assert (=> b!164349 m!261303))

(declare-fun m!261315 () Bool)

(assert (=> b!164349 m!261315))

(declare-fun m!261317 () Bool)

(assert (=> b!164349 m!261317))

(declare-fun m!261319 () Bool)

(assert (=> b!164349 m!261319))

(declare-fun m!261321 () Bool)

(assert (=> b!164349 m!261321))

(declare-fun m!261323 () Bool)

(assert (=> b!164349 m!261323))

(declare-fun m!261325 () Bool)

(assert (=> b!164349 m!261325))

(declare-fun m!261327 () Bool)

(assert (=> b!164349 m!261327))

(declare-fun m!261329 () Bool)

(assert (=> b!164349 m!261329))

(check-sat (not start!34722) (not b!164347) (not b!164349) (not b!164348) (not b!164346) (not b!164350) (not b!164352))
