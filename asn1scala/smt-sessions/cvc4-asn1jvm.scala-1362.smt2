; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37762 () Bool)

(assert start!37762)

(declare-fun res!141873 () Bool)

(declare-fun e!119371 () Bool)

(assert (=> start!37762 (=> (not res!141873) (not e!119371))))

(declare-fun nBits!283 () (_ BitVec 64))

(declare-fun from!235 () (_ BitVec 64))

(assert (=> start!37762 (= res!141873 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle nBits!283 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!235) (bvslt from!235 nBits!283)))))

(assert (=> start!37762 e!119371))

(assert (=> start!37762 true))

(declare-datatypes ((array!9083 0))(
  ( (array!9084 (arr!4950 (Array (_ BitVec 32) (_ BitVec 8))) (size!4020 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7178 0))(
  ( (BitStream!7179 (buf!4463 array!9083) (currentByte!8468 (_ BitVec 32)) (currentBit!8463 (_ BitVec 32))) )
))
(declare-fun bs!64 () BitStream!7178)

(declare-fun e!119370 () Bool)

(declare-fun inv!12 (BitStream!7178) Bool)

(assert (=> start!37762 (and (inv!12 bs!64) e!119370)))

(declare-fun b!171016 () Bool)

(declare-fun res!141872 () Bool)

(assert (=> b!171016 (=> (not res!141872) (not e!119371))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!171016 (= res!141872 (validate_offset_bits!1 ((_ sign_extend 32) (size!4020 (buf!4463 bs!64))) ((_ sign_extend 32) (currentByte!8468 bs!64)) ((_ sign_extend 32) (currentBit!8463 bs!64)) (bvsub nBits!283 from!235)))))

(declare-fun b!171017 () Bool)

(assert (=> b!171017 (= e!119371 (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283))))

(declare-fun lt!263649 () BitStream!7178)

(declare-fun withMovedBitIndex!0 (BitStream!7178 (_ BitVec 64)) BitStream!7178)

(assert (=> b!171017 (= lt!263649 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!14694 0))(
  ( (tuple2!14695 (_1!7980 BitStream!7178) (_2!7980 Bool)) )
))
(declare-fun lt!263650 () tuple2!14694)

(declare-fun readBitPure!0 (BitStream!7178) tuple2!14694)

(assert (=> b!171017 (= lt!263650 (readBitPure!0 bs!64))))

(declare-fun expected!82 () Bool)

(declare-fun lt!263651 () tuple2!14694)

(declare-fun checkBitsLoopPure!0 (BitStream!7178 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!14694)

(assert (=> b!171017 (= lt!263651 (checkBitsLoopPure!0 bs!64 nBits!283 expected!82 from!235))))

(declare-fun b!171018 () Bool)

(declare-fun array_inv!3761 (array!9083) Bool)

(assert (=> b!171018 (= e!119370 (array_inv!3761 (buf!4463 bs!64)))))

(assert (= (and start!37762 res!141873) b!171016))

(assert (= (and b!171016 res!141872) b!171017))

(assert (= start!37762 b!171018))

(declare-fun m!270151 () Bool)

(assert (=> start!37762 m!270151))

(declare-fun m!270153 () Bool)

(assert (=> b!171016 m!270153))

(declare-fun m!270155 () Bool)

(assert (=> b!171017 m!270155))

(declare-fun m!270157 () Bool)

(assert (=> b!171017 m!270157))

(declare-fun m!270159 () Bool)

(assert (=> b!171017 m!270159))

(declare-fun m!270161 () Bool)

(assert (=> b!171018 m!270161))

(push 1)

(assert (not b!171016))

(assert (not b!171018))

(assert (not b!171017))

(assert (not start!37762))

(check-sat)

(pop 1)

(push 1)

(check-sat)

