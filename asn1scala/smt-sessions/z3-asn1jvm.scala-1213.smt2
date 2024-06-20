; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34544 () Bool)

(assert start!34544)

(declare-fun b!163830 () Bool)

(declare-fun e!113150 () Bool)

(assert (=> b!163830 (= e!113150 (not true))))

(declare-fun lt!257100 () (_ BitVec 32))

(declare-fun lt!257101 () (_ BitVec 32))

(declare-datatypes ((array!8159 0))(
  ( (array!8160 (arr!4574 (Array (_ BitVec 32) (_ BitVec 8))) (size!3653 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6462 0))(
  ( (BitStream!6463 (buf!4105 array!8159) (currentByte!7664 (_ BitVec 32)) (currentBit!7659 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6462)

(declare-fun lt!257103 () (_ BitVec 32))

(declare-fun arrayRangesEq!587 (array!8159 array!8159 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163830 (arrayRangesEq!587 (buf!4105 thiss!1577) (array!8160 (store (arr!4574 (buf!4105 thiss!1577)) (currentByte!7664 thiss!1577) (select (store (store (arr!4574 (buf!4105 thiss!1577)) (currentByte!7664 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4574 (buf!4105 thiss!1577)) (currentByte!7664 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7659 thiss!1577)))))))) (bvlshr (bvand lt!257101 #b00000000000000000000000011111111) lt!257100)))) (bvadd #b00000000000000000000000000000001 (currentByte!7664 thiss!1577)) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4574 (buf!4105 thiss!1577)) (currentByte!7664 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4574 (buf!4105 thiss!1577)) (currentByte!7664 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7659 thiss!1577)))))))) (bvlshr (bvand lt!257101 #b00000000000000000000000011111111) lt!257100)))) (bvadd #b00000000000000000000000000000001 (currentByte!7664 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!257103))) (bvshl lt!257101 lt!257103)))) (currentByte!7664 thiss!1577))) (size!3653 (buf!4105 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7664 thiss!1577))))

(declare-datatypes ((Unit!11383 0))(
  ( (Unit!11384) )
))
(declare-fun lt!257102 () Unit!11383)

(declare-fun arrayUpdatedAtPrefixLemma!195 (array!8159 (_ BitVec 32) (_ BitVec 8)) Unit!11383)

(assert (=> b!163830 (= lt!257102 (arrayUpdatedAtPrefixLemma!195 (buf!4105 thiss!1577) (currentByte!7664 thiss!1577) (select (store (store (arr!4574 (buf!4105 thiss!1577)) (currentByte!7664 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4574 (buf!4105 thiss!1577)) (currentByte!7664 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7659 thiss!1577)))))))) (bvlshr (bvand lt!257101 #b00000000000000000000000011111111) lt!257100)))) (bvadd #b00000000000000000000000000000001 (currentByte!7664 thiss!1577)) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4574 (buf!4105 thiss!1577)) (currentByte!7664 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4574 (buf!4105 thiss!1577)) (currentByte!7664 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7659 thiss!1577)))))))) (bvlshr (bvand lt!257101 #b00000000000000000000000011111111) lt!257100)))) (bvadd #b00000000000000000000000000000001 (currentByte!7664 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!257103))) (bvshl lt!257101 lt!257103)))) (currentByte!7664 thiss!1577))))))

(assert (=> b!163830 (= lt!257103 (bvsub #b00000000000000000000000000001000 lt!257100))))

(declare-fun v!206 () (_ BitVec 8))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> b!163830 (= lt!257101 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!163830 (= lt!257100 (bvsub (bvadd (currentBit!7659 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun res!136521 () Bool)

(assert (=> start!34544 (=> (not res!136521) (not e!113150))))

(assert (=> start!34544 (= res!136521 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34544 e!113150))

(assert (=> start!34544 true))

(declare-fun e!113151 () Bool)

(declare-fun inv!12 (BitStream!6462) Bool)

(assert (=> start!34544 (and (inv!12 thiss!1577) e!113151)))

(declare-fun b!163828 () Bool)

(declare-fun res!136519 () Bool)

(assert (=> b!163828 (=> (not res!136519) (not e!113150))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!163828 (= res!136519 (validate_offset_bits!1 ((_ sign_extend 32) (size!3653 (buf!4105 thiss!1577))) ((_ sign_extend 32) (currentByte!7664 thiss!1577)) ((_ sign_extend 32) (currentBit!7659 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!163829 () Bool)

(declare-fun res!136520 () Bool)

(assert (=> b!163829 (=> (not res!136520) (not e!113150))))

(assert (=> b!163829 (= res!136520 (bvsgt (bvadd (currentBit!7659 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!163831 () Bool)

(declare-fun array_inv!3394 (array!8159) Bool)

(assert (=> b!163831 (= e!113151 (array_inv!3394 (buf!4105 thiss!1577)))))

(assert (= (and start!34544 res!136521) b!163828))

(assert (= (and b!163828 res!136519) b!163829))

(assert (= (and b!163829 res!136520) b!163830))

(assert (= start!34544 b!163831))

(declare-fun m!260005 () Bool)

(assert (=> b!163830 m!260005))

(declare-fun m!260007 () Bool)

(assert (=> b!163830 m!260007))

(declare-fun m!260009 () Bool)

(assert (=> b!163830 m!260009))

(declare-fun m!260011 () Bool)

(assert (=> b!163830 m!260011))

(assert (=> b!163830 m!260007))

(declare-fun m!260013 () Bool)

(assert (=> b!163830 m!260013))

(declare-fun m!260015 () Bool)

(assert (=> b!163830 m!260015))

(declare-fun m!260017 () Bool)

(assert (=> b!163830 m!260017))

(declare-fun m!260019 () Bool)

(assert (=> b!163830 m!260019))

(declare-fun m!260021 () Bool)

(assert (=> b!163830 m!260021))

(declare-fun m!260023 () Bool)

(assert (=> b!163830 m!260023))

(declare-fun m!260025 () Bool)

(assert (=> b!163830 m!260025))

(declare-fun m!260027 () Bool)

(assert (=> start!34544 m!260027))

(declare-fun m!260029 () Bool)

(assert (=> b!163828 m!260029))

(declare-fun m!260031 () Bool)

(assert (=> b!163831 m!260031))

(check-sat (not b!163828) (not b!163830) (not b!163831) (not start!34544))
