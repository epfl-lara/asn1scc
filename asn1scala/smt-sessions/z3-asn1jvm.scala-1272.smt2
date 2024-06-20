; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36202 () Bool)

(assert start!36202)

(declare-fun b!166966 () Bool)

(declare-fun res!139004 () Bool)

(declare-fun e!115776 () Bool)

(assert (=> b!166966 (=> (not res!139004) (not e!115776))))

(declare-datatypes ((array!8620 0))(
  ( (array!8621 (arr!4751 (Array (_ BitVec 32) (_ BitVec 8))) (size!3830 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6816 0))(
  ( (BitStream!6817 (buf!4282 array!8620) (currentByte!8109 (_ BitVec 32)) (currentBit!8104 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6816)

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> b!166966 (= res!139004 (bvsgt (bvadd (currentBit!8104 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!166965 () Bool)

(declare-fun res!139002 () Bool)

(assert (=> b!166965 (=> (not res!139002) (not e!115776))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!166965 (= res!139002 (validate_offset_bits!1 ((_ sign_extend 32) (size!3830 (buf!4282 thiss!1577))) ((_ sign_extend 32) (currentByte!8109 thiss!1577)) ((_ sign_extend 32) (currentBit!8104 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!166968 () Bool)

(declare-fun e!115775 () Bool)

(declare-fun array_inv!3571 (array!8620) Bool)

(assert (=> b!166968 (= e!115775 (array_inv!3571 (buf!4282 thiss!1577)))))

(declare-fun b!166967 () Bool)

(assert (=> b!166967 (= e!115776 (not true))))

(declare-fun lt!259937 () (_ BitVec 8))

(declare-fun lt!259940 () (_ BitVec 32))

(declare-fun lt!259936 () (_ BitVec 32))

(declare-fun lt!259935 () array!8620)

(declare-fun arrayRangesEq!659 (array!8620 array!8620 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!166967 (arrayRangesEq!659 lt!259935 (array!8621 (store (store (arr!4751 (buf!4282 thiss!1577)) (currentByte!8109 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4751 (buf!4282 thiss!1577)) (currentByte!8109 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8104 thiss!1577)))))))) (bvlshr (bvand lt!259936 #b00000000000000000000000011111111) lt!259940)))) (bvadd #b00000000000000000000000000000001 (currentByte!8109 thiss!1577)) lt!259937) (size!3830 (buf!4282 thiss!1577))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8109 thiss!1577)))))

(declare-datatypes ((Unit!11608 0))(
  ( (Unit!11609) )
))
(declare-fun lt!259934 () Unit!11608)

(declare-fun arrayUpdatedAtPrefixLemma!267 (array!8620 (_ BitVec 32) (_ BitVec 8)) Unit!11608)

(assert (=> b!166967 (= lt!259934 (arrayUpdatedAtPrefixLemma!267 lt!259935 (bvadd #b00000000000000000000000000000001 (currentByte!8109 thiss!1577)) lt!259937))))

(assert (=> b!166967 (arrayRangesEq!659 (buf!4282 thiss!1577) (array!8621 (store (arr!4751 (buf!4282 thiss!1577)) (currentByte!8109 thiss!1577) (select (store (store (arr!4751 (buf!4282 thiss!1577)) (currentByte!8109 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4751 (buf!4282 thiss!1577)) (currentByte!8109 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8104 thiss!1577)))))))) (bvlshr (bvand lt!259936 #b00000000000000000000000011111111) lt!259940)))) (bvadd #b00000000000000000000000000000001 (currentByte!8109 thiss!1577)) lt!259937) (currentByte!8109 thiss!1577))) (size!3830 (buf!4282 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8109 thiss!1577))))

(declare-fun lt!259938 () Unit!11608)

(assert (=> b!166967 (= lt!259938 (arrayUpdatedAtPrefixLemma!267 (buf!4282 thiss!1577) (currentByte!8109 thiss!1577) (select (store (store (arr!4751 (buf!4282 thiss!1577)) (currentByte!8109 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4751 (buf!4282 thiss!1577)) (currentByte!8109 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8104 thiss!1577)))))))) (bvlshr (bvand lt!259936 #b00000000000000000000000011111111) lt!259940)))) (bvadd #b00000000000000000000000000000001 (currentByte!8109 thiss!1577)) lt!259937) (currentByte!8109 thiss!1577))))))

(declare-fun lt!259939 () (_ BitVec 32))

(assert (=> b!166967 (= lt!259937 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4751 (buf!4282 thiss!1577)) (currentByte!8109 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4751 (buf!4282 thiss!1577)) (currentByte!8109 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8104 thiss!1577)))))))) (bvlshr (bvand lt!259936 #b00000000000000000000000011111111) lt!259940)))) (bvadd #b00000000000000000000000000000001 (currentByte!8109 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!259939))) (bvshl lt!259936 lt!259939))))))

(assert (=> b!166967 (= lt!259939 (bvsub #b00000000000000000000000000001000 lt!259940))))

(assert (=> b!166967 (= lt!259935 (array!8621 (store (arr!4751 (buf!4282 thiss!1577)) (currentByte!8109 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4751 (buf!4282 thiss!1577)) (currentByte!8109 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8104 thiss!1577)))))))) (bvlshr (bvand lt!259936 #b00000000000000000000000011111111) lt!259940)))) (size!3830 (buf!4282 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!166967 (= lt!259936 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!166967 (= lt!259940 (bvsub (bvadd (currentBit!8104 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun res!139003 () Bool)

(assert (=> start!36202 (=> (not res!139003) (not e!115776))))

(assert (=> start!36202 (= res!139003 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!36202 e!115776))

(assert (=> start!36202 true))

(declare-fun inv!12 (BitStream!6816) Bool)

(assert (=> start!36202 (and (inv!12 thiss!1577) e!115775)))

(assert (= (and start!36202 res!139003) b!166965))

(assert (= (and b!166965 res!139002) b!166966))

(assert (= (and b!166966 res!139004) b!166967))

(assert (= start!36202 b!166968))

(declare-fun m!265327 () Bool)

(assert (=> b!166965 m!265327))

(declare-fun m!265329 () Bool)

(assert (=> b!166968 m!265329))

(declare-fun m!265331 () Bool)

(assert (=> b!166967 m!265331))

(declare-fun m!265333 () Bool)

(assert (=> b!166967 m!265333))

(declare-fun m!265335 () Bool)

(assert (=> b!166967 m!265335))

(declare-fun m!265337 () Bool)

(assert (=> b!166967 m!265337))

(declare-fun m!265339 () Bool)

(assert (=> b!166967 m!265339))

(declare-fun m!265341 () Bool)

(assert (=> b!166967 m!265341))

(declare-fun m!265343 () Bool)

(assert (=> b!166967 m!265343))

(declare-fun m!265345 () Bool)

(assert (=> b!166967 m!265345))

(assert (=> b!166967 m!265339))

(declare-fun m!265347 () Bool)

(assert (=> b!166967 m!265347))

(declare-fun m!265349 () Bool)

(assert (=> b!166967 m!265349))

(declare-fun m!265351 () Bool)

(assert (=> b!166967 m!265351))

(declare-fun m!265353 () Bool)

(assert (=> b!166967 m!265353))

(declare-fun m!265355 () Bool)

(assert (=> b!166967 m!265355))

(declare-fun m!265357 () Bool)

(assert (=> start!36202 m!265357))

(check-sat (not b!166965) (not start!36202) (not b!166968) (not b!166967))
