; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21950 () Bool)

(assert start!21950)

(declare-fun b!110729 () Bool)

(declare-fun e!72663 () Bool)

(declare-fun e!72661 () Bool)

(assert (=> b!110729 (= e!72663 e!72661)))

(declare-fun res!91407 () Bool)

(assert (=> b!110729 (=> (not res!91407) (not e!72661))))

(declare-datatypes ((array!5079 0))(
  ( (array!5080 (arr!2903 (Array (_ BitVec 32) (_ BitVec 8))) (size!2310 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4094 0))(
  ( (BitStream!4095 (buf!2707 array!5079) (currentByte!5264 (_ BitVec 32)) (currentBit!5259 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4094)

(declare-fun lt!167577 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!110729 (= res!91407 (validate_offset_bits!1 ((_ sign_extend 32) (size!2310 (buf!2707 thiss!1305))) ((_ sign_extend 32) (currentByte!5264 thiss!1305)) ((_ sign_extend 32) (currentBit!5259 thiss!1305)) lt!167577))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!110729 (= lt!167577 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun lt!167579 () (_ BitVec 64))

(declare-fun lt!167581 () (_ BitVec 64))

(declare-fun e!72659 () Bool)

(declare-fun lt!167580 () (_ BitVec 64))

(declare-fun b!110730 () Bool)

(assert (=> b!110730 (= e!72659 (or (not (= (bvand lt!167581 lt!167580) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!167581 lt!167579) lt!167581)))))

(declare-fun res!91411 () Bool)

(assert (=> start!21950 (=> (not res!91411) (not e!72663))))

(assert (=> start!21950 (= res!91411 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21950 e!72663))

(assert (=> start!21950 true))

(declare-fun e!72664 () Bool)

(declare-fun inv!12 (BitStream!4094) Bool)

(assert (=> start!21950 (and (inv!12 thiss!1305) e!72664)))

(declare-fun b!110731 () Bool)

(declare-fun e!72665 () Bool)

(declare-fun e!72662 () Bool)

(assert (=> b!110731 (= e!72665 (not e!72662))))

(declare-fun res!91410 () Bool)

(assert (=> b!110731 (=> res!91410 e!72662)))

(declare-fun lt!167576 () (_ BitVec 64))

(assert (=> b!110731 (= res!91410 (not (= lt!167576 (bvadd lt!167576 lt!167577))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110731 (= lt!167576 (bitIndex!0 (size!2310 (buf!2707 thiss!1305)) (currentByte!5264 thiss!1305) (currentBit!5259 thiss!1305)))))

(declare-fun isPrefixOf!0 (BitStream!4094 BitStream!4094) Bool)

(assert (=> b!110731 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-datatypes ((Unit!6788 0))(
  ( (Unit!6789) )
))
(declare-fun lt!167575 () Unit!6788)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4094) Unit!6788)

(assert (=> b!110731 (= lt!167575 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-fun b!110732 () Bool)

(assert (=> b!110732 (= e!72662 e!72659)))

(declare-fun res!91409 () Bool)

(assert (=> b!110732 (=> res!91409 e!72659)))

(declare-datatypes ((tuple2!9214 0))(
  ( (tuple2!9215 (_1!4864 BitStream!4094) (_2!4864 BitStream!4094)) )
))
(declare-fun lt!167578 () tuple2!9214)

(assert (=> b!110732 (= res!91409 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!2310 (buf!2707 (_1!4864 lt!167578)))) ((_ sign_extend 32) (currentByte!5264 (_1!4864 lt!167578))) ((_ sign_extend 32) (currentBit!5259 (_1!4864 lt!167578))) lt!167577)))))

(declare-fun lt!167582 () Unit!6788)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4094 array!5079 (_ BitVec 64)) Unit!6788)

(assert (=> b!110732 (= lt!167582 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2707 thiss!1305) lt!167577))))

(declare-fun v!199 () (_ BitVec 64))

(assert (=> b!110732 (= lt!167581 (bvand v!199 (bvnot lt!167580)))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110732 (= lt!167580 (onesLSBLong!0 (bvsub nBits!396 i!615)))))

(declare-fun reader!0 (BitStream!4094 BitStream!4094) tuple2!9214)

(assert (=> b!110732 (= lt!167578 (reader!0 thiss!1305 thiss!1305))))

(declare-fun b!110733 () Bool)

(declare-fun array_inv!2112 (array!5079) Bool)

(assert (=> b!110733 (= e!72664 (array_inv!2112 (buf!2707 thiss!1305)))))

(declare-fun b!110734 () Bool)

(assert (=> b!110734 (= e!72661 e!72665)))

(declare-fun res!91408 () Bool)

(assert (=> b!110734 (=> (not res!91408) (not e!72665))))

(assert (=> b!110734 (= res!91408 (and (= (bvand v!199 lt!167579) v!199) (bvsge i!615 nBits!396)))))

(assert (=> b!110734 (= lt!167579 (onesLSBLong!0 nBits!396))))

(assert (= (and start!21950 res!91411) b!110729))

(assert (= (and b!110729 res!91407) b!110734))

(assert (= (and b!110734 res!91408) b!110731))

(assert (= (and b!110731 (not res!91410)) b!110732))

(assert (= (and b!110732 (not res!91409)) b!110730))

(assert (= start!21950 b!110733))

(declare-fun m!164317 () Bool)

(assert (=> b!110732 m!164317))

(declare-fun m!164319 () Bool)

(assert (=> b!110732 m!164319))

(declare-fun m!164321 () Bool)

(assert (=> b!110732 m!164321))

(declare-fun m!164323 () Bool)

(assert (=> b!110732 m!164323))

(declare-fun m!164325 () Bool)

(assert (=> start!21950 m!164325))

(declare-fun m!164327 () Bool)

(assert (=> b!110731 m!164327))

(declare-fun m!164329 () Bool)

(assert (=> b!110731 m!164329))

(declare-fun m!164331 () Bool)

(assert (=> b!110731 m!164331))

(declare-fun m!164333 () Bool)

(assert (=> b!110733 m!164333))

(declare-fun m!164335 () Bool)

(assert (=> b!110729 m!164335))

(declare-fun m!164337 () Bool)

(assert (=> b!110734 m!164337))

(push 1)

(assert (not b!110732))

(assert (not start!21950))

(assert (not b!110731))

(assert (not b!110729))

(assert (not b!110734))

(assert (not b!110733))

(check-sat)

(pop 1)

(push 1)

(check-sat)

