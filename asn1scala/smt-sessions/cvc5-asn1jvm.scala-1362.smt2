; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37758 () Bool)

(assert start!37758)

(declare-fun res!141860 () Bool)

(declare-fun e!119352 () Bool)

(assert (=> start!37758 (=> (not res!141860) (not e!119352))))

(declare-fun nBits!283 () (_ BitVec 64))

(declare-fun from!235 () (_ BitVec 64))

(assert (=> start!37758 (= res!141860 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle nBits!283 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!235) (bvslt from!235 nBits!283)))))

(assert (=> start!37758 e!119352))

(assert (=> start!37758 true))

(declare-datatypes ((array!9079 0))(
  ( (array!9080 (arr!4948 (Array (_ BitVec 32) (_ BitVec 8))) (size!4018 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7174 0))(
  ( (BitStream!7175 (buf!4461 array!9079) (currentByte!8466 (_ BitVec 32)) (currentBit!8461 (_ BitVec 32))) )
))
(declare-fun bs!64 () BitStream!7174)

(declare-fun e!119351 () Bool)

(declare-fun inv!12 (BitStream!7174) Bool)

(assert (=> start!37758 (and (inv!12 bs!64) e!119351)))

(declare-fun b!170998 () Bool)

(declare-fun res!141861 () Bool)

(assert (=> b!170998 (=> (not res!141861) (not e!119352))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!170998 (= res!141861 (validate_offset_bits!1 ((_ sign_extend 32) (size!4018 (buf!4461 bs!64))) ((_ sign_extend 32) (currentByte!8466 bs!64)) ((_ sign_extend 32) (currentBit!8461 bs!64)) (bvsub nBits!283 from!235)))))

(declare-fun b!170999 () Bool)

(assert (=> b!170999 (= e!119352 (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283))))

(declare-fun lt!263633 () BitStream!7174)

(declare-fun withMovedBitIndex!0 (BitStream!7174 (_ BitVec 64)) BitStream!7174)

(assert (=> b!170999 (= lt!263633 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!14690 0))(
  ( (tuple2!14691 (_1!7978 BitStream!7174) (_2!7978 Bool)) )
))
(declare-fun lt!263632 () tuple2!14690)

(declare-fun readBitPure!0 (BitStream!7174) tuple2!14690)

(assert (=> b!170999 (= lt!263632 (readBitPure!0 bs!64))))

(declare-fun lt!263631 () tuple2!14690)

(declare-fun expected!82 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!7174 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!14690)

(assert (=> b!170999 (= lt!263631 (checkBitsLoopPure!0 bs!64 nBits!283 expected!82 from!235))))

(declare-fun b!171000 () Bool)

(declare-fun array_inv!3759 (array!9079) Bool)

(assert (=> b!171000 (= e!119351 (array_inv!3759 (buf!4461 bs!64)))))

(assert (= (and start!37758 res!141860) b!170998))

(assert (= (and b!170998 res!141861) b!170999))

(assert (= start!37758 b!171000))

(declare-fun m!270127 () Bool)

(assert (=> start!37758 m!270127))

(declare-fun m!270129 () Bool)

(assert (=> b!170998 m!270129))

(declare-fun m!270131 () Bool)

(assert (=> b!170999 m!270131))

(declare-fun m!270133 () Bool)

(assert (=> b!170999 m!270133))

(declare-fun m!270135 () Bool)

(assert (=> b!170999 m!270135))

(declare-fun m!270137 () Bool)

(assert (=> b!171000 m!270137))

(push 1)

(assert (not b!171000))

(assert (not b!170998))

(assert (not b!170999))

(assert (not start!37758))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

