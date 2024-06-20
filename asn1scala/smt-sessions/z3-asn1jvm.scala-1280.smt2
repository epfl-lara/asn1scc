; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36410 () Bool)

(assert start!36410)

(declare-fun b!167469 () Bool)

(declare-fun res!139436 () Bool)

(declare-fun e!116192 () Bool)

(assert (=> b!167469 (=> (not res!139436) (not e!116192))))

(declare-datatypes ((array!8680 0))(
  ( (array!8681 (arr!4775 (Array (_ BitVec 32) (_ BitVec 8))) (size!3854 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6864 0))(
  ( (BitStream!6865 (buf!4306 array!8680) (currentByte!8151 (_ BitVec 32)) (currentBit!8146 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6864)

(declare-fun nBits!511 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!167469 (= res!139436 (validate_offset_bits!1 ((_ sign_extend 32) (size!3854 (buf!4306 thiss!1577))) ((_ sign_extend 32) (currentByte!8151 thiss!1577)) ((_ sign_extend 32) (currentBit!8146 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!167470 () Bool)

(declare-fun e!116195 () Bool)

(declare-fun e!116194 () Bool)

(assert (=> b!167470 (= e!116195 e!116194)))

(declare-fun res!139435 () Bool)

(assert (=> b!167470 (=> res!139435 e!116194)))

(declare-fun lt!260718 () (_ BitVec 32))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!167470 (= res!139435 (not (= (bitIndex!0 (size!3854 (buf!4306 thiss!1577)) (bvadd #b00000000000000000000000000000001 (currentByte!8151 thiss!1577)) lt!260718) (bvadd (bitIndex!0 (size!3854 (buf!4306 thiss!1577)) (currentByte!8151 thiss!1577) (currentBit!8146 thiss!1577)) ((_ sign_extend 32) nBits!511)))))))

(declare-fun lt!260720 () array!8680)

(declare-fun lt!260715 () BitStream!6864)

(assert (=> b!167470 (= lt!260715 (BitStream!6865 lt!260720 (bvadd #b00000000000000000000000000000001 (currentByte!8151 thiss!1577)) lt!260718))))

(declare-fun res!139437 () Bool)

(assert (=> start!36410 (=> (not res!139437) (not e!116192))))

(assert (=> start!36410 (= res!139437 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!36410 e!116192))

(assert (=> start!36410 true))

(declare-fun e!116193 () Bool)

(declare-fun inv!12 (BitStream!6864) Bool)

(assert (=> start!36410 (and (inv!12 thiss!1577) e!116193)))

(declare-fun b!167471 () Bool)

(declare-fun res!139438 () Bool)

(assert (=> b!167471 (=> res!139438 e!116194)))

(declare-fun isPrefixOf!0 (BitStream!6864 BitStream!6864) Bool)

(assert (=> b!167471 (= res!139438 (not (isPrefixOf!0 thiss!1577 lt!260715)))))

(declare-fun b!167472 () Bool)

(declare-fun array_inv!3595 (array!8680) Bool)

(assert (=> b!167472 (= e!116193 (array_inv!3595 (buf!4306 thiss!1577)))))

(declare-fun b!167473 () Bool)

(assert (=> b!167473 (= e!116194 (and (bvsge nBits!511 #b00000000000000000000000000000000) (bvslt nBits!511 #b00000000000000000000000000001001)))))

(declare-datatypes ((tuple2!14604 0))(
  ( (tuple2!14605 (_1!7899 BitStream!6864) (_2!7899 (_ BitVec 8))) )
))
(declare-fun lt!260719 () tuple2!14604)

(declare-fun readPartialBytePure!0 (BitStream!6864 (_ BitVec 32)) tuple2!14604)

(declare-datatypes ((tuple2!14606 0))(
  ( (tuple2!14607 (_1!7900 BitStream!6864) (_2!7900 BitStream!6864)) )
))
(declare-fun reader!0 (BitStream!6864 BitStream!6864) tuple2!14606)

(assert (=> b!167473 (= lt!260719 (readPartialBytePure!0 (_1!7900 (reader!0 thiss!1577 lt!260715)) nBits!511))))

(declare-fun b!167474 () Bool)

(declare-fun res!139434 () Bool)

(assert (=> b!167474 (=> (not res!139434) (not e!116192))))

(assert (=> b!167474 (= res!139434 (bvsgt (bvadd (currentBit!8146 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!167475 () Bool)

(assert (=> b!167475 (= e!116192 (not e!116195))))

(declare-fun res!139439 () Bool)

(assert (=> b!167475 (=> res!139439 e!116195)))

(declare-fun lt!260713 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167475 (= res!139439 (not (byteRangesEq!0 (select (arr!4775 (buf!4306 thiss!1577)) (currentByte!8151 thiss!1577)) lt!260713 #b00000000000000000000000000000000 lt!260718)))))

(declare-fun arrayRangesEq!683 (array!8680 array!8680 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167475 (arrayRangesEq!683 (buf!4306 thiss!1577) lt!260720 #b00000000000000000000000000000000 (currentByte!8151 thiss!1577))))

(declare-fun lt!260722 () array!8680)

(declare-datatypes ((Unit!11656 0))(
  ( (Unit!11657) )
))
(declare-fun lt!260721 () Unit!11656)

(declare-fun arrayRangesEqTransitive!185 (array!8680 array!8680 array!8680 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11656)

(assert (=> b!167475 (= lt!260721 (arrayRangesEqTransitive!185 (buf!4306 thiss!1577) lt!260722 lt!260720 #b00000000000000000000000000000000 (currentByte!8151 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8151 thiss!1577))))))

(assert (=> b!167475 (arrayRangesEq!683 lt!260722 lt!260720 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8151 thiss!1577)))))

(declare-fun lt!260716 () (_ BitVec 8))

(declare-fun lt!260714 () Unit!11656)

(declare-fun arrayUpdatedAtPrefixLemma!291 (array!8680 (_ BitVec 32) (_ BitVec 8)) Unit!11656)

(assert (=> b!167475 (= lt!260714 (arrayUpdatedAtPrefixLemma!291 lt!260722 (bvadd #b00000000000000000000000000000001 (currentByte!8151 thiss!1577)) lt!260716))))

(assert (=> b!167475 (arrayRangesEq!683 (buf!4306 thiss!1577) (array!8681 (store (arr!4775 (buf!4306 thiss!1577)) (currentByte!8151 thiss!1577) lt!260713) (size!3854 (buf!4306 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8151 thiss!1577))))

(declare-fun lt!260711 () Unit!11656)

(assert (=> b!167475 (= lt!260711 (arrayUpdatedAtPrefixLemma!291 (buf!4306 thiss!1577) (currentByte!8151 thiss!1577) lt!260713))))

(declare-fun lt!260712 () (_ BitVec 32))

(assert (=> b!167475 (= lt!260713 (select (store (store (arr!4775 (buf!4306 thiss!1577)) (currentByte!8151 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4775 (buf!4306 thiss!1577)) (currentByte!8151 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8146 thiss!1577)))))))) (bvlshr (bvand lt!260712 #b00000000000000000000000011111111) lt!260718)))) (bvadd #b00000000000000000000000000000001 (currentByte!8151 thiss!1577)) lt!260716) (currentByte!8151 thiss!1577)))))

(assert (=> b!167475 (= lt!260720 (array!8681 (store (store (arr!4775 (buf!4306 thiss!1577)) (currentByte!8151 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4775 (buf!4306 thiss!1577)) (currentByte!8151 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8146 thiss!1577)))))))) (bvlshr (bvand lt!260712 #b00000000000000000000000011111111) lt!260718)))) (bvadd #b00000000000000000000000000000001 (currentByte!8151 thiss!1577)) lt!260716) (size!3854 (buf!4306 thiss!1577))))))

(declare-fun lt!260717 () (_ BitVec 32))

(assert (=> b!167475 (= lt!260716 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4775 (buf!4306 thiss!1577)) (currentByte!8151 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4775 (buf!4306 thiss!1577)) (currentByte!8151 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8146 thiss!1577)))))))) (bvlshr (bvand lt!260712 #b00000000000000000000000011111111) lt!260718)))) (bvadd #b00000000000000000000000000000001 (currentByte!8151 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!260717))) (bvshl lt!260712 lt!260717))))))

(assert (=> b!167475 (= lt!260717 (bvsub #b00000000000000000000000000001000 lt!260718))))

(assert (=> b!167475 (= lt!260722 (array!8681 (store (arr!4775 (buf!4306 thiss!1577)) (currentByte!8151 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4775 (buf!4306 thiss!1577)) (currentByte!8151 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8146 thiss!1577)))))))) (bvlshr (bvand lt!260712 #b00000000000000000000000011111111) lt!260718)))) (size!3854 (buf!4306 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!167475 (= lt!260712 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!167475 (= lt!260718 (bvsub (bvadd (currentBit!8146 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(assert (= (and start!36410 res!139437) b!167469))

(assert (= (and b!167469 res!139436) b!167474))

(assert (= (and b!167474 res!139434) b!167475))

(assert (= (and b!167475 (not res!139439)) b!167470))

(assert (= (and b!167470 (not res!139435)) b!167471))

(assert (= (and b!167471 (not res!139438)) b!167473))

(assert (= start!36410 b!167472))

(declare-fun m!266535 () Bool)

(assert (=> b!167475 m!266535))

(declare-fun m!266537 () Bool)

(assert (=> b!167475 m!266537))

(assert (=> b!167475 m!266535))

(declare-fun m!266539 () Bool)

(assert (=> b!167475 m!266539))

(declare-fun m!266541 () Bool)

(assert (=> b!167475 m!266541))

(declare-fun m!266543 () Bool)

(assert (=> b!167475 m!266543))

(declare-fun m!266545 () Bool)

(assert (=> b!167475 m!266545))

(declare-fun m!266547 () Bool)

(assert (=> b!167475 m!266547))

(declare-fun m!266549 () Bool)

(assert (=> b!167475 m!266549))

(declare-fun m!266551 () Bool)

(assert (=> b!167475 m!266551))

(declare-fun m!266553 () Bool)

(assert (=> b!167475 m!266553))

(declare-fun m!266555 () Bool)

(assert (=> b!167475 m!266555))

(declare-fun m!266557 () Bool)

(assert (=> b!167475 m!266557))

(declare-fun m!266559 () Bool)

(assert (=> b!167475 m!266559))

(declare-fun m!266561 () Bool)

(assert (=> b!167475 m!266561))

(declare-fun m!266563 () Bool)

(assert (=> b!167475 m!266563))

(declare-fun m!266565 () Bool)

(assert (=> b!167475 m!266565))

(declare-fun m!266567 () Bool)

(assert (=> b!167471 m!266567))

(declare-fun m!266569 () Bool)

(assert (=> b!167470 m!266569))

(declare-fun m!266571 () Bool)

(assert (=> b!167470 m!266571))

(declare-fun m!266573 () Bool)

(assert (=> b!167472 m!266573))

(declare-fun m!266575 () Bool)

(assert (=> start!36410 m!266575))

(declare-fun m!266577 () Bool)

(assert (=> b!167473 m!266577))

(declare-fun m!266579 () Bool)

(assert (=> b!167473 m!266579))

(declare-fun m!266581 () Bool)

(assert (=> b!167469 m!266581))

(check-sat (not b!167469) (not b!167473) (not b!167475) (not start!36410) (not b!167471) (not b!167472) (not b!167470))
(check-sat)
