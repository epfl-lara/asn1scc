; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34568 () Bool)

(assert start!34568)

(declare-fun res!136627 () Bool)

(declare-fun e!113260 () Bool)

(assert (=> start!34568 (=> (not res!136627) (not e!113260))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!34568 (= res!136627 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34568 e!113260))

(assert (=> start!34568 true))

(declare-datatypes ((array!8183 0))(
  ( (array!8184 (arr!4586 (Array (_ BitVec 32) (_ BitVec 8))) (size!3665 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6486 0))(
  ( (BitStream!6487 (buf!4117 array!8183) (currentByte!7676 (_ BitVec 32)) (currentBit!7671 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6486)

(declare-fun e!113258 () Bool)

(declare-fun inv!12 (BitStream!6486) Bool)

(assert (=> start!34568 (and (inv!12 thiss!1577) e!113258)))

(declare-fun b!163975 () Bool)

(declare-fun array_inv!3406 (array!8183) Bool)

(assert (=> b!163975 (= e!113258 (array_inv!3406 (buf!4117 thiss!1577)))))

(declare-fun b!163974 () Bool)

(assert (=> b!163974 (= e!113260 (not true))))

(declare-fun lt!257345 () (_ BitVec 32))

(declare-fun lt!257342 () (_ BitVec 8))

(declare-fun lt!257346 () (_ BitVec 32))

(declare-fun lt!257341 () array!8183)

(declare-fun arrayRangesEq!599 (array!8183 array!8183 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163974 (arrayRangesEq!599 lt!257341 (array!8184 (store (store (arr!4586 (buf!4117 thiss!1577)) (currentByte!7676 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4586 (buf!4117 thiss!1577)) (currentByte!7676 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7671 thiss!1577)))))))) (bvlshr (bvand lt!257346 #b00000000000000000000000011111111) lt!257345)))) (bvadd #b00000000000000000000000000000001 (currentByte!7676 thiss!1577)) lt!257342) (size!3665 (buf!4117 thiss!1577))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7676 thiss!1577)))))

(declare-datatypes ((Unit!11407 0))(
  ( (Unit!11408) )
))
(declare-fun lt!257344 () Unit!11407)

(declare-fun arrayUpdatedAtPrefixLemma!207 (array!8183 (_ BitVec 32) (_ BitVec 8)) Unit!11407)

(assert (=> b!163974 (= lt!257344 (arrayUpdatedAtPrefixLemma!207 lt!257341 (bvadd #b00000000000000000000000000000001 (currentByte!7676 thiss!1577)) lt!257342))))

(assert (=> b!163974 (arrayRangesEq!599 (buf!4117 thiss!1577) (array!8184 (store (arr!4586 (buf!4117 thiss!1577)) (currentByte!7676 thiss!1577) (select (store (store (arr!4586 (buf!4117 thiss!1577)) (currentByte!7676 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4586 (buf!4117 thiss!1577)) (currentByte!7676 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7671 thiss!1577)))))))) (bvlshr (bvand lt!257346 #b00000000000000000000000011111111) lt!257345)))) (bvadd #b00000000000000000000000000000001 (currentByte!7676 thiss!1577)) lt!257342) (currentByte!7676 thiss!1577))) (size!3665 (buf!4117 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7676 thiss!1577))))

(declare-fun lt!257343 () Unit!11407)

(assert (=> b!163974 (= lt!257343 (arrayUpdatedAtPrefixLemma!207 (buf!4117 thiss!1577) (currentByte!7676 thiss!1577) (select (store (store (arr!4586 (buf!4117 thiss!1577)) (currentByte!7676 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4586 (buf!4117 thiss!1577)) (currentByte!7676 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7671 thiss!1577)))))))) (bvlshr (bvand lt!257346 #b00000000000000000000000011111111) lt!257345)))) (bvadd #b00000000000000000000000000000001 (currentByte!7676 thiss!1577)) lt!257342) (currentByte!7676 thiss!1577))))))

(declare-fun lt!257340 () (_ BitVec 32))

(assert (=> b!163974 (= lt!257342 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4586 (buf!4117 thiss!1577)) (currentByte!7676 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4586 (buf!4117 thiss!1577)) (currentByte!7676 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7671 thiss!1577)))))))) (bvlshr (bvand lt!257346 #b00000000000000000000000011111111) lt!257345)))) (bvadd #b00000000000000000000000000000001 (currentByte!7676 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!257340))) (bvshl lt!257346 lt!257340))))))

(assert (=> b!163974 (= lt!257340 (bvsub #b00000000000000000000000000001000 lt!257345))))

(assert (=> b!163974 (= lt!257341 (array!8184 (store (arr!4586 (buf!4117 thiss!1577)) (currentByte!7676 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4586 (buf!4117 thiss!1577)) (currentByte!7676 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7671 thiss!1577)))))))) (bvlshr (bvand lt!257346 #b00000000000000000000000011111111) lt!257345)))) (size!3665 (buf!4117 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!163974 (= lt!257346 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!163974 (= lt!257345 (bvsub (bvadd (currentBit!7671 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!163973 () Bool)

(declare-fun res!136628 () Bool)

(assert (=> b!163973 (=> (not res!136628) (not e!113260))))

(assert (=> b!163973 (= res!136628 (bvsgt (bvadd (currentBit!7671 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!163972 () Bool)

(declare-fun res!136629 () Bool)

(assert (=> b!163972 (=> (not res!136629) (not e!113260))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!163972 (= res!136629 (validate_offset_bits!1 ((_ sign_extend 32) (size!3665 (buf!4117 thiss!1577))) ((_ sign_extend 32) (currentByte!7676 thiss!1577)) ((_ sign_extend 32) (currentBit!7671 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(assert (= (and start!34568 res!136627) b!163972))

(assert (= (and b!163972 res!136629) b!163973))

(assert (= (and b!163973 res!136628) b!163974))

(assert (= start!34568 b!163975))

(declare-fun m!260381 () Bool)

(assert (=> start!34568 m!260381))

(declare-fun m!260383 () Bool)

(assert (=> b!163975 m!260383))

(declare-fun m!260385 () Bool)

(assert (=> b!163974 m!260385))

(declare-fun m!260387 () Bool)

(assert (=> b!163974 m!260387))

(declare-fun m!260389 () Bool)

(assert (=> b!163974 m!260389))

(declare-fun m!260391 () Bool)

(assert (=> b!163974 m!260391))

(declare-fun m!260393 () Bool)

(assert (=> b!163974 m!260393))

(declare-fun m!260395 () Bool)

(assert (=> b!163974 m!260395))

(declare-fun m!260397 () Bool)

(assert (=> b!163974 m!260397))

(declare-fun m!260399 () Bool)

(assert (=> b!163974 m!260399))

(declare-fun m!260401 () Bool)

(assert (=> b!163974 m!260401))

(declare-fun m!260403 () Bool)

(assert (=> b!163974 m!260403))

(declare-fun m!260405 () Bool)

(assert (=> b!163974 m!260405))

(assert (=> b!163974 m!260397))

(declare-fun m!260407 () Bool)

(assert (=> b!163974 m!260407))

(declare-fun m!260409 () Bool)

(assert (=> b!163974 m!260409))

(declare-fun m!260411 () Bool)

(assert (=> b!163972 m!260411))

(check-sat (not b!163975) (not b!163974) (not start!34568) (not b!163972))
