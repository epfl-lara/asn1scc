; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36408 () Bool)

(assert start!36408)

(declare-fun b!167448 () Bool)

(declare-fun res!139418 () Bool)

(declare-fun e!116181 () Bool)

(assert (=> b!167448 (=> (not res!139418) (not e!116181))))

(declare-datatypes ((array!8678 0))(
  ( (array!8679 (arr!4774 (Array (_ BitVec 32) (_ BitVec 8))) (size!3853 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6862 0))(
  ( (BitStream!6863 (buf!4305 array!8678) (currentByte!8150 (_ BitVec 32)) (currentBit!8145 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6862)

(declare-fun nBits!511 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!167448 (= res!139418 (validate_offset_bits!1 ((_ sign_extend 32) (size!3853 (buf!4305 thiss!1577))) ((_ sign_extend 32) (currentByte!8150 thiss!1577)) ((_ sign_extend 32) (currentBit!8145 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!167449 () Bool)

(declare-fun e!116178 () Bool)

(declare-fun array_inv!3594 (array!8678) Bool)

(assert (=> b!167449 (= e!116178 (array_inv!3594 (buf!4305 thiss!1577)))))

(declare-fun res!139419 () Bool)

(assert (=> start!36408 (=> (not res!139419) (not e!116181))))

(assert (=> start!36408 (= res!139419 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!36408 e!116181))

(assert (=> start!36408 true))

(declare-fun inv!12 (BitStream!6862) Bool)

(assert (=> start!36408 (and (inv!12 thiss!1577) e!116178)))

(declare-fun b!167450 () Bool)

(declare-fun e!116177 () Bool)

(assert (=> b!167450 (= e!116181 (not e!116177))))

(declare-fun res!139420 () Bool)

(assert (=> b!167450 (=> res!139420 e!116177)))

(declare-fun lt!260676 () (_ BitVec 32))

(declare-fun lt!260678 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167450 (= res!139420 (not (byteRangesEq!0 (select (arr!4774 (buf!4305 thiss!1577)) (currentByte!8150 thiss!1577)) lt!260678 #b00000000000000000000000000000000 lt!260676)))))

(declare-fun lt!260683 () array!8678)

(declare-fun arrayRangesEq!682 (array!8678 array!8678 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167450 (arrayRangesEq!682 (buf!4305 thiss!1577) lt!260683 #b00000000000000000000000000000000 (currentByte!8150 thiss!1577))))

(declare-fun lt!260684 () array!8678)

(declare-datatypes ((Unit!11654 0))(
  ( (Unit!11655) )
))
(declare-fun lt!260685 () Unit!11654)

(declare-fun arrayRangesEqTransitive!184 (array!8678 array!8678 array!8678 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11654)

(assert (=> b!167450 (= lt!260685 (arrayRangesEqTransitive!184 (buf!4305 thiss!1577) lt!260684 lt!260683 #b00000000000000000000000000000000 (currentByte!8150 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8150 thiss!1577))))))

(assert (=> b!167450 (arrayRangesEq!682 lt!260684 lt!260683 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8150 thiss!1577)))))

(declare-fun lt!260681 () (_ BitVec 8))

(declare-fun lt!260686 () Unit!11654)

(declare-fun arrayUpdatedAtPrefixLemma!290 (array!8678 (_ BitVec 32) (_ BitVec 8)) Unit!11654)

(assert (=> b!167450 (= lt!260686 (arrayUpdatedAtPrefixLemma!290 lt!260684 (bvadd #b00000000000000000000000000000001 (currentByte!8150 thiss!1577)) lt!260681))))

(assert (=> b!167450 (arrayRangesEq!682 (buf!4305 thiss!1577) (array!8679 (store (arr!4774 (buf!4305 thiss!1577)) (currentByte!8150 thiss!1577) lt!260678) (size!3853 (buf!4305 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8150 thiss!1577))))

(declare-fun lt!260679 () Unit!11654)

(assert (=> b!167450 (= lt!260679 (arrayUpdatedAtPrefixLemma!290 (buf!4305 thiss!1577) (currentByte!8150 thiss!1577) lt!260678))))

(declare-fun lt!260677 () (_ BitVec 32))

(assert (=> b!167450 (= lt!260678 (select (store (store (arr!4774 (buf!4305 thiss!1577)) (currentByte!8150 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4774 (buf!4305 thiss!1577)) (currentByte!8150 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8145 thiss!1577)))))))) (bvlshr (bvand lt!260677 #b00000000000000000000000011111111) lt!260676)))) (bvadd #b00000000000000000000000000000001 (currentByte!8150 thiss!1577)) lt!260681) (currentByte!8150 thiss!1577)))))

(assert (=> b!167450 (= lt!260683 (array!8679 (store (store (arr!4774 (buf!4305 thiss!1577)) (currentByte!8150 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4774 (buf!4305 thiss!1577)) (currentByte!8150 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8145 thiss!1577)))))))) (bvlshr (bvand lt!260677 #b00000000000000000000000011111111) lt!260676)))) (bvadd #b00000000000000000000000000000001 (currentByte!8150 thiss!1577)) lt!260681) (size!3853 (buf!4305 thiss!1577))))))

(declare-fun lt!260675 () (_ BitVec 32))

(assert (=> b!167450 (= lt!260681 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4774 (buf!4305 thiss!1577)) (currentByte!8150 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4774 (buf!4305 thiss!1577)) (currentByte!8150 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8145 thiss!1577)))))))) (bvlshr (bvand lt!260677 #b00000000000000000000000011111111) lt!260676)))) (bvadd #b00000000000000000000000000000001 (currentByte!8150 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!260675))) (bvshl lt!260677 lt!260675))))))

(assert (=> b!167450 (= lt!260675 (bvsub #b00000000000000000000000000001000 lt!260676))))

(assert (=> b!167450 (= lt!260684 (array!8679 (store (arr!4774 (buf!4305 thiss!1577)) (currentByte!8150 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4774 (buf!4305 thiss!1577)) (currentByte!8150 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8145 thiss!1577)))))))) (bvlshr (bvand lt!260677 #b00000000000000000000000011111111) lt!260676)))) (size!3853 (buf!4305 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!167450 (= lt!260677 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!167450 (= lt!260676 (bvsub (bvadd (currentBit!8145 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!167451 () Bool)

(declare-fun e!116179 () Bool)

(assert (=> b!167451 (= e!116177 e!116179)))

(declare-fun res!139421 () Bool)

(assert (=> b!167451 (=> res!139421 e!116179)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!167451 (= res!139421 (not (= (bitIndex!0 (size!3853 (buf!4305 thiss!1577)) (bvadd #b00000000000000000000000000000001 (currentByte!8150 thiss!1577)) lt!260676) (bvadd (bitIndex!0 (size!3853 (buf!4305 thiss!1577)) (currentByte!8150 thiss!1577) (currentBit!8145 thiss!1577)) ((_ sign_extend 32) nBits!511)))))))

(declare-fun lt!260680 () BitStream!6862)

(assert (=> b!167451 (= lt!260680 (BitStream!6863 lt!260683 (bvadd #b00000000000000000000000000000001 (currentByte!8150 thiss!1577)) lt!260676))))

(declare-fun b!167452 () Bool)

(declare-fun res!139417 () Bool)

(assert (=> b!167452 (=> (not res!139417) (not e!116181))))

(assert (=> b!167452 (= res!139417 (bvsgt (bvadd (currentBit!8145 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!167453 () Bool)

(declare-fun res!139416 () Bool)

(assert (=> b!167453 (=> res!139416 e!116179)))

(declare-fun isPrefixOf!0 (BitStream!6862 BitStream!6862) Bool)

(assert (=> b!167453 (= res!139416 (not (isPrefixOf!0 thiss!1577 lt!260680)))))

(declare-fun b!167454 () Bool)

(assert (=> b!167454 (= e!116179 (and (bvsge nBits!511 #b00000000000000000000000000000000) (bvslt nBits!511 #b00000000000000000000000000001001)))))

(declare-datatypes ((tuple2!14600 0))(
  ( (tuple2!14601 (_1!7897 BitStream!6862) (_2!7897 (_ BitVec 8))) )
))
(declare-fun lt!260682 () tuple2!14600)

(declare-fun readPartialBytePure!0 (BitStream!6862 (_ BitVec 32)) tuple2!14600)

(declare-datatypes ((tuple2!14602 0))(
  ( (tuple2!14603 (_1!7898 BitStream!6862) (_2!7898 BitStream!6862)) )
))
(declare-fun reader!0 (BitStream!6862 BitStream!6862) tuple2!14602)

(assert (=> b!167454 (= lt!260682 (readPartialBytePure!0 (_1!7898 (reader!0 thiss!1577 lt!260680)) nBits!511))))

(assert (= (and start!36408 res!139419) b!167448))

(assert (= (and b!167448 res!139418) b!167452))

(assert (= (and b!167452 res!139417) b!167450))

(assert (= (and b!167450 (not res!139420)) b!167451))

(assert (= (and b!167451 (not res!139421)) b!167453))

(assert (= (and b!167453 (not res!139416)) b!167454))

(assert (= start!36408 b!167449))

(declare-fun m!266487 () Bool)

(assert (=> b!167448 m!266487))

(declare-fun m!266489 () Bool)

(assert (=> b!167450 m!266489))

(declare-fun m!266491 () Bool)

(assert (=> b!167450 m!266491))

(declare-fun m!266493 () Bool)

(assert (=> b!167450 m!266493))

(declare-fun m!266495 () Bool)

(assert (=> b!167450 m!266495))

(declare-fun m!266497 () Bool)

(assert (=> b!167450 m!266497))

(declare-fun m!266499 () Bool)

(assert (=> b!167450 m!266499))

(declare-fun m!266501 () Bool)

(assert (=> b!167450 m!266501))

(declare-fun m!266503 () Bool)

(assert (=> b!167450 m!266503))

(declare-fun m!266505 () Bool)

(assert (=> b!167450 m!266505))

(declare-fun m!266507 () Bool)

(assert (=> b!167450 m!266507))

(declare-fun m!266509 () Bool)

(assert (=> b!167450 m!266509))

(declare-fun m!266511 () Bool)

(assert (=> b!167450 m!266511))

(declare-fun m!266513 () Bool)

(assert (=> b!167450 m!266513))

(declare-fun m!266515 () Bool)

(assert (=> b!167450 m!266515))

(declare-fun m!266517 () Bool)

(assert (=> b!167450 m!266517))

(assert (=> b!167450 m!266511))

(declare-fun m!266519 () Bool)

(assert (=> b!167450 m!266519))

(declare-fun m!266521 () Bool)

(assert (=> b!167451 m!266521))

(declare-fun m!266523 () Bool)

(assert (=> b!167451 m!266523))

(declare-fun m!266525 () Bool)

(assert (=> b!167449 m!266525))

(declare-fun m!266527 () Bool)

(assert (=> b!167453 m!266527))

(declare-fun m!266529 () Bool)

(assert (=> b!167454 m!266529))

(declare-fun m!266531 () Bool)

(assert (=> b!167454 m!266531))

(declare-fun m!266533 () Bool)

(assert (=> start!36408 m!266533))

(push 1)

(assert (not b!167451))

(assert (not start!36408))

(assert (not b!167453))

(assert (not b!167448))

(assert (not b!167450))

(assert (not b!167454))

(assert (not b!167449))

(check-sat)

(pop 1)

(push 1)

(check-sat)

