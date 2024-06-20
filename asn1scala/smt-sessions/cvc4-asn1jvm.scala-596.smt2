; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17096 () Bool)

(assert start!17096)

(declare-fun b!83478 () Bool)

(declare-fun e!55519 () Bool)

(declare-datatypes ((array!3840 0))(
  ( (array!3841 (arr!2384 (Array (_ BitVec 32) (_ BitVec 8))) (size!1747 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3056 0))(
  ( (BitStream!3057 (buf!2137 array!3840) (currentByte!4240 (_ BitVec 32)) (currentBit!4235 (_ BitVec 32))) )
))
(declare-fun b1!98 () BitStream!3056)

(declare-fun lt!133069 () (_ BitVec 64))

(assert (=> b!83478 (= e!55519 (not (or (= ((_ sign_extend 32) (size!1747 (buf!2137 b1!98))) #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv lt!133069 ((_ sign_extend 32) (size!1747 (buf!2137 b1!98))))))))))

(declare-fun lt!133071 () (_ BitVec 64))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!83478 (= (remainingBits!0 ((_ sign_extend 32) (size!1747 (buf!2137 b1!98))) ((_ sign_extend 32) (currentByte!4240 b1!98)) ((_ sign_extend 32) (currentBit!4235 b1!98))) (bvsub lt!133069 lt!133071))))

(assert (=> b!83478 (= lt!133069 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1747 (buf!2137 b1!98)))))))

(declare-datatypes ((Unit!5597 0))(
  ( (Unit!5598) )
))
(declare-fun lt!133070 () Unit!5597)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!3056) Unit!5597)

(assert (=> b!83478 (= lt!133070 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun b!83479 () Bool)

(declare-fun res!68656 () Bool)

(declare-fun e!55524 () Bool)

(assert (=> b!83479 (=> (not res!68656) (not e!55524))))

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!83479 (= res!68656 (validate_offset_bits!1 ((_ sign_extend 32) (size!1747 (buf!2137 b1!98))) ((_ sign_extend 32) (currentByte!4240 b1!98)) ((_ sign_extend 32) (currentBit!4235 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!83480 () Bool)

(assert (=> b!83480 (= e!55524 e!55519)))

(declare-fun res!68654 () Bool)

(assert (=> b!83480 (=> (not res!68654) (not e!55519))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-fun b2!98 () BitStream!3056)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!83480 (= res!68654 (= (bvadd lt!133071 b1b2Diff!1) (bitIndex!0 (size!1747 (buf!2137 b2!98)) (currentByte!4240 b2!98) (currentBit!4235 b2!98))))))

(assert (=> b!83480 (= lt!133071 (bitIndex!0 (size!1747 (buf!2137 b1!98)) (currentByte!4240 b1!98) (currentBit!4235 b1!98)))))

(declare-fun b!83481 () Bool)

(declare-fun e!55521 () Bool)

(declare-fun array_inv!1593 (array!3840) Bool)

(assert (=> b!83481 (= e!55521 (array_inv!1593 (buf!2137 b1!98)))))

(declare-fun b!83482 () Bool)

(declare-fun e!55522 () Bool)

(assert (=> b!83482 (= e!55522 (array_inv!1593 (buf!2137 b2!98)))))

(declare-fun res!68655 () Bool)

(assert (=> start!17096 (=> (not res!68655) (not e!55524))))

(assert (=> start!17096 (= res!68655 (and (= (size!1747 (buf!2137 b1!98)) (size!1747 (buf!2137 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!17096 e!55524))

(declare-fun inv!12 (BitStream!3056) Bool)

(assert (=> start!17096 (and (inv!12 b1!98) e!55521)))

(assert (=> start!17096 (and (inv!12 b2!98) e!55522)))

(assert (=> start!17096 true))

(assert (= (and start!17096 res!68655) b!83479))

(assert (= (and b!83479 res!68656) b!83480))

(assert (= (and b!83480 res!68654) b!83478))

(assert (= start!17096 b!83481))

(assert (= start!17096 b!83482))

(declare-fun m!130065 () Bool)

(assert (=> b!83478 m!130065))

(declare-fun m!130067 () Bool)

(assert (=> b!83478 m!130067))

(declare-fun m!130069 () Bool)

(assert (=> start!17096 m!130069))

(declare-fun m!130071 () Bool)

(assert (=> start!17096 m!130071))

(declare-fun m!130073 () Bool)

(assert (=> b!83482 m!130073))

(declare-fun m!130075 () Bool)

(assert (=> b!83479 m!130075))

(declare-fun m!130077 () Bool)

(assert (=> b!83481 m!130077))

(declare-fun m!130079 () Bool)

(assert (=> b!83480 m!130079))

(declare-fun m!130081 () Bool)

(assert (=> b!83480 m!130081))

(push 1)

(assert (not b!83482))

(assert (not b!83480))

(assert (not start!17096))

(assert (not b!83478))

(assert (not b!83479))

(assert (not b!83481))

(check-sat)

(pop 1)

(push 1)

(check-sat)

