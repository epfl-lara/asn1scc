; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34574 () Bool)

(assert start!34574)

(declare-fun b!164008 () Bool)

(declare-fun res!136656 () Bool)

(declare-fun e!113285 () Bool)

(assert (=> b!164008 (=> (not res!136656) (not e!113285))))

(declare-datatypes ((array!8189 0))(
  ( (array!8190 (arr!4589 (Array (_ BitVec 32) (_ BitVec 8))) (size!3668 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6492 0))(
  ( (BitStream!6493 (buf!4120 array!8189) (currentByte!7679 (_ BitVec 32)) (currentBit!7674 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6492)

(declare-fun nBits!511 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164008 (= res!136656 (validate_offset_bits!1 ((_ sign_extend 32) (size!3668 (buf!4120 thiss!1577))) ((_ sign_extend 32) (currentByte!7679 thiss!1577)) ((_ sign_extend 32) (currentBit!7674 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!164009 () Bool)

(declare-fun res!136654 () Bool)

(assert (=> b!164009 (=> (not res!136654) (not e!113285))))

(assert (=> b!164009 (= res!136654 (bvsgt (bvadd (currentBit!7674 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun res!136655 () Bool)

(assert (=> start!34574 (=> (not res!136655) (not e!113285))))

(assert (=> start!34574 (= res!136655 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34574 e!113285))

(assert (=> start!34574 true))

(declare-fun e!113286 () Bool)

(declare-fun inv!12 (BitStream!6492) Bool)

(assert (=> start!34574 (and (inv!12 thiss!1577) e!113286)))

(declare-fun b!164011 () Bool)

(declare-fun array_inv!3409 (array!8189) Bool)

(assert (=> b!164011 (= e!113286 (array_inv!3409 (buf!4120 thiss!1577)))))

(declare-fun b!164010 () Bool)

(assert (=> b!164010 (= e!113285 (not true))))

(declare-fun lt!257409 () (_ BitVec 8))

(declare-fun lt!257405 () array!8189)

(declare-fun lt!257406 () (_ BitVec 32))

(declare-fun lt!257404 () (_ BitVec 32))

(declare-fun arrayRangesEq!602 (array!8189 array!8189 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!164010 (arrayRangesEq!602 lt!257405 (array!8190 (store (store (arr!4589 (buf!4120 thiss!1577)) (currentByte!7679 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4589 (buf!4120 thiss!1577)) (currentByte!7679 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7674 thiss!1577)))))))) (bvlshr (bvand lt!257404 #b00000000000000000000000011111111) lt!257406)))) (bvadd #b00000000000000000000000000000001 (currentByte!7679 thiss!1577)) lt!257409) (size!3668 (buf!4120 thiss!1577))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7679 thiss!1577)))))

(declare-datatypes ((Unit!11413 0))(
  ( (Unit!11414) )
))
(declare-fun lt!257403 () Unit!11413)

(declare-fun arrayUpdatedAtPrefixLemma!210 (array!8189 (_ BitVec 32) (_ BitVec 8)) Unit!11413)

(assert (=> b!164010 (= lt!257403 (arrayUpdatedAtPrefixLemma!210 lt!257405 (bvadd #b00000000000000000000000000000001 (currentByte!7679 thiss!1577)) lt!257409))))

(assert (=> b!164010 (arrayRangesEq!602 (buf!4120 thiss!1577) (array!8190 (store (arr!4589 (buf!4120 thiss!1577)) (currentByte!7679 thiss!1577) (select (store (store (arr!4589 (buf!4120 thiss!1577)) (currentByte!7679 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4589 (buf!4120 thiss!1577)) (currentByte!7679 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7674 thiss!1577)))))))) (bvlshr (bvand lt!257404 #b00000000000000000000000011111111) lt!257406)))) (bvadd #b00000000000000000000000000000001 (currentByte!7679 thiss!1577)) lt!257409) (currentByte!7679 thiss!1577))) (size!3668 (buf!4120 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7679 thiss!1577))))

(declare-fun lt!257408 () Unit!11413)

(assert (=> b!164010 (= lt!257408 (arrayUpdatedAtPrefixLemma!210 (buf!4120 thiss!1577) (currentByte!7679 thiss!1577) (select (store (store (arr!4589 (buf!4120 thiss!1577)) (currentByte!7679 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4589 (buf!4120 thiss!1577)) (currentByte!7679 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7674 thiss!1577)))))))) (bvlshr (bvand lt!257404 #b00000000000000000000000011111111) lt!257406)))) (bvadd #b00000000000000000000000000000001 (currentByte!7679 thiss!1577)) lt!257409) (currentByte!7679 thiss!1577))))))

(declare-fun lt!257407 () (_ BitVec 32))

(assert (=> b!164010 (= lt!257409 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4589 (buf!4120 thiss!1577)) (currentByte!7679 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4589 (buf!4120 thiss!1577)) (currentByte!7679 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7674 thiss!1577)))))))) (bvlshr (bvand lt!257404 #b00000000000000000000000011111111) lt!257406)))) (bvadd #b00000000000000000000000000000001 (currentByte!7679 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!257407))) (bvshl lt!257404 lt!257407))))))

(assert (=> b!164010 (= lt!257407 (bvsub #b00000000000000000000000000001000 lt!257406))))

(assert (=> b!164010 (= lt!257405 (array!8190 (store (arr!4589 (buf!4120 thiss!1577)) (currentByte!7679 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4589 (buf!4120 thiss!1577)) (currentByte!7679 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7674 thiss!1577)))))))) (bvlshr (bvand lt!257404 #b00000000000000000000000011111111) lt!257406)))) (size!3668 (buf!4120 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!164010 (= lt!257404 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!164010 (= lt!257406 (bvsub (bvadd (currentBit!7674 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(assert (= (and start!34574 res!136655) b!164008))

(assert (= (and b!164008 res!136656) b!164009))

(assert (= (and b!164009 res!136654) b!164010))

(assert (= start!34574 b!164011))

(declare-fun m!260477 () Bool)

(assert (=> b!164008 m!260477))

(declare-fun m!260479 () Bool)

(assert (=> start!34574 m!260479))

(declare-fun m!260481 () Bool)

(assert (=> b!164011 m!260481))

(declare-fun m!260483 () Bool)

(assert (=> b!164010 m!260483))

(declare-fun m!260485 () Bool)

(assert (=> b!164010 m!260485))

(declare-fun m!260487 () Bool)

(assert (=> b!164010 m!260487))

(declare-fun m!260489 () Bool)

(assert (=> b!164010 m!260489))

(declare-fun m!260491 () Bool)

(assert (=> b!164010 m!260491))

(declare-fun m!260493 () Bool)

(assert (=> b!164010 m!260493))

(declare-fun m!260495 () Bool)

(assert (=> b!164010 m!260495))

(declare-fun m!260497 () Bool)

(assert (=> b!164010 m!260497))

(declare-fun m!260499 () Bool)

(assert (=> b!164010 m!260499))

(declare-fun m!260501 () Bool)

(assert (=> b!164010 m!260501))

(declare-fun m!260503 () Bool)

(assert (=> b!164010 m!260503))

(assert (=> b!164010 m!260487))

(declare-fun m!260505 () Bool)

(assert (=> b!164010 m!260505))

(declare-fun m!260507 () Bool)

(assert (=> b!164010 m!260507))

(check-sat (not b!164011) (not b!164010) (not b!164008) (not start!34574))
