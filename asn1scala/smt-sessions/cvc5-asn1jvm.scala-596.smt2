; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17092 () Bool)

(assert start!17092)

(declare-fun b!83448 () Bool)

(declare-fun e!55484 () Bool)

(declare-fun e!55485 () Bool)

(assert (=> b!83448 (= e!55484 e!55485)))

(declare-fun res!68636 () Bool)

(assert (=> b!83448 (=> (not res!68636) (not e!55485))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-datatypes ((array!3836 0))(
  ( (array!3837 (arr!2382 (Array (_ BitVec 32) (_ BitVec 8))) (size!1745 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3052 0))(
  ( (BitStream!3053 (buf!2135 array!3836) (currentByte!4238 (_ BitVec 32)) (currentBit!4233 (_ BitVec 32))) )
))
(declare-fun b2!98 () BitStream!3052)

(declare-fun lt!133052 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!83448 (= res!68636 (= (bvadd lt!133052 b1b2Diff!1) (bitIndex!0 (size!1745 (buf!2135 b2!98)) (currentByte!4238 b2!98) (currentBit!4233 b2!98))))))

(declare-fun b1!98 () BitStream!3052)

(assert (=> b!83448 (= lt!133052 (bitIndex!0 (size!1745 (buf!2135 b1!98)) (currentByte!4238 b1!98) (currentBit!4233 b1!98)))))

(declare-fun b!83449 () Bool)

(declare-fun lt!133051 () (_ BitVec 64))

(assert (=> b!83449 (= e!55485 (not (or (= ((_ sign_extend 32) (size!1745 (buf!2135 b1!98))) #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv lt!133051 ((_ sign_extend 32) (size!1745 (buf!2135 b1!98))))))))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!83449 (= (remainingBits!0 ((_ sign_extend 32) (size!1745 (buf!2135 b1!98))) ((_ sign_extend 32) (currentByte!4238 b1!98)) ((_ sign_extend 32) (currentBit!4233 b1!98))) (bvsub lt!133051 lt!133052))))

(assert (=> b!83449 (= lt!133051 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1745 (buf!2135 b1!98)))))))

(declare-datatypes ((Unit!5593 0))(
  ( (Unit!5594) )
))
(declare-fun lt!133053 () Unit!5593)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!3052) Unit!5593)

(assert (=> b!83449 (= lt!133053 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun res!68637 () Bool)

(assert (=> start!17092 (=> (not res!68637) (not e!55484))))

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(assert (=> start!17092 (= res!68637 (and (= (size!1745 (buf!2135 b1!98)) (size!1745 (buf!2135 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!17092 e!55484))

(declare-fun e!55488 () Bool)

(declare-fun inv!12 (BitStream!3052) Bool)

(assert (=> start!17092 (and (inv!12 b1!98) e!55488)))

(declare-fun e!55486 () Bool)

(assert (=> start!17092 (and (inv!12 b2!98) e!55486)))

(assert (=> start!17092 true))

(declare-fun b!83450 () Bool)

(declare-fun res!68638 () Bool)

(assert (=> b!83450 (=> (not res!68638) (not e!55484))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!83450 (= res!68638 (validate_offset_bits!1 ((_ sign_extend 32) (size!1745 (buf!2135 b1!98))) ((_ sign_extend 32) (currentByte!4238 b1!98)) ((_ sign_extend 32) (currentBit!4233 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!83451 () Bool)

(declare-fun array_inv!1591 (array!3836) Bool)

(assert (=> b!83451 (= e!55486 (array_inv!1591 (buf!2135 b2!98)))))

(declare-fun b!83452 () Bool)

(assert (=> b!83452 (= e!55488 (array_inv!1591 (buf!2135 b1!98)))))

(assert (= (and start!17092 res!68637) b!83450))

(assert (= (and b!83450 res!68638) b!83448))

(assert (= (and b!83448 res!68636) b!83449))

(assert (= start!17092 b!83452))

(assert (= start!17092 b!83451))

(declare-fun m!130029 () Bool)

(assert (=> b!83451 m!130029))

(declare-fun m!130031 () Bool)

(assert (=> b!83448 m!130031))

(declare-fun m!130033 () Bool)

(assert (=> b!83448 m!130033))

(declare-fun m!130035 () Bool)

(assert (=> b!83449 m!130035))

(declare-fun m!130037 () Bool)

(assert (=> b!83449 m!130037))

(declare-fun m!130039 () Bool)

(assert (=> b!83450 m!130039))

(declare-fun m!130041 () Bool)

(assert (=> b!83452 m!130041))

(declare-fun m!130043 () Bool)

(assert (=> start!17092 m!130043))

(declare-fun m!130045 () Bool)

(assert (=> start!17092 m!130045))

(push 1)

(assert (not b!83449))

(assert (not b!83448))

(assert (not b!83451))

(assert (not b!83450))

(assert (not b!83452))

(assert (not start!17092))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

