; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16918 () Bool)

(assert start!16918)

(declare-fun b!83025 () Bool)

(declare-fun e!55056 () Bool)

(assert (=> b!83025 (= e!55056 (not true))))

(declare-datatypes ((array!3782 0))(
  ( (array!3783 (arr!2361 (Array (_ BitVec 32) (_ BitVec 8))) (size!1724 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3010 0))(
  ( (BitStream!3011 (buf!2114 array!3782) (currentByte!4184 (_ BitVec 32)) (currentBit!4179 (_ BitVec 32))) )
))
(declare-fun b1!98 () BitStream!3010)

(declare-fun lt!132351 () (_ BitVec 64))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!83025 (= (remainingBits!0 ((_ sign_extend 32) (size!1724 (buf!2114 b1!98))) ((_ sign_extend 32) (currentByte!4184 b1!98)) ((_ sign_extend 32) (currentBit!4179 b1!98))) (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1724 (buf!2114 b1!98)))) lt!132351))))

(declare-datatypes ((Unit!5557 0))(
  ( (Unit!5558) )
))
(declare-fun lt!132350 () Unit!5557)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!3010) Unit!5557)

(assert (=> b!83025 (= lt!132350 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun b!83026 () Bool)

(declare-fun e!55055 () Bool)

(declare-fun b2!98 () BitStream!3010)

(declare-fun array_inv!1570 (array!3782) Bool)

(assert (=> b!83026 (= e!55055 (array_inv!1570 (buf!2114 b2!98)))))

(declare-fun res!68348 () Bool)

(declare-fun e!55052 () Bool)

(assert (=> start!16918 (=> (not res!68348) (not e!55052))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(assert (=> start!16918 (= res!68348 (and (= (size!1724 (buf!2114 b1!98)) (size!1724 (buf!2114 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16918 e!55052))

(declare-fun e!55054 () Bool)

(declare-fun inv!12 (BitStream!3010) Bool)

(assert (=> start!16918 (and (inv!12 b1!98) e!55054)))

(assert (=> start!16918 (and (inv!12 b2!98) e!55055)))

(assert (=> start!16918 true))

(declare-fun b!83027 () Bool)

(assert (=> b!83027 (= e!55054 (array_inv!1570 (buf!2114 b1!98)))))

(declare-fun b!83028 () Bool)

(declare-fun res!68349 () Bool)

(assert (=> b!83028 (=> (not res!68349) (not e!55052))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!83028 (= res!68349 (validate_offset_bits!1 ((_ sign_extend 32) (size!1724 (buf!2114 b1!98))) ((_ sign_extend 32) (currentByte!4184 b1!98)) ((_ sign_extend 32) (currentBit!4179 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!83029 () Bool)

(assert (=> b!83029 (= e!55052 e!55056)))

(declare-fun res!68350 () Bool)

(assert (=> b!83029 (=> (not res!68350) (not e!55056))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!83029 (= res!68350 (= (bvadd lt!132351 b1b2Diff!1) (bitIndex!0 (size!1724 (buf!2114 b2!98)) (currentByte!4184 b2!98) (currentBit!4179 b2!98))))))

(assert (=> b!83029 (= lt!132351 (bitIndex!0 (size!1724 (buf!2114 b1!98)) (currentByte!4184 b1!98) (currentBit!4179 b1!98)))))

(assert (= (and start!16918 res!68348) b!83028))

(assert (= (and b!83028 res!68349) b!83029))

(assert (= (and b!83029 res!68350) b!83025))

(assert (= start!16918 b!83027))

(assert (= start!16918 b!83026))

(declare-fun m!129555 () Bool)

(assert (=> start!16918 m!129555))

(declare-fun m!129557 () Bool)

(assert (=> start!16918 m!129557))

(declare-fun m!129559 () Bool)

(assert (=> b!83027 m!129559))

(declare-fun m!129561 () Bool)

(assert (=> b!83028 m!129561))

(declare-fun m!129563 () Bool)

(assert (=> b!83026 m!129563))

(declare-fun m!129565 () Bool)

(assert (=> b!83025 m!129565))

(declare-fun m!129567 () Bool)

(assert (=> b!83025 m!129567))

(declare-fun m!129569 () Bool)

(assert (=> b!83029 m!129569))

(declare-fun m!129571 () Bool)

(assert (=> b!83029 m!129571))

(push 1)

(assert (not b!83026))

(assert (not b!83028))

(assert (not b!83027))

(assert (not b!83025))

(assert (not start!16918))

(assert (not b!83029))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

