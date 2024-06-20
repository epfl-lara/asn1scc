; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37864 () Bool)

(assert start!37864)

(declare-fun res!142049 () Bool)

(declare-fun e!119573 () Bool)

(assert (=> start!37864 (=> (not res!142049) (not e!119573))))

(declare-fun nBits!283 () (_ BitVec 64))

(declare-fun from!235 () (_ BitVec 64))

(assert (=> start!37864 (= res!142049 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle nBits!283 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!235) (bvslt from!235 nBits!283)))))

(assert (=> start!37864 e!119573))

(assert (=> start!37864 true))

(declare-datatypes ((array!9104 0))(
  ( (array!9105 (arr!4959 (Array (_ BitVec 32) (_ BitVec 8))) (size!4029 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7196 0))(
  ( (BitStream!7197 (buf!4472 array!9104) (currentByte!8489 (_ BitVec 32)) (currentBit!8484 (_ BitVec 32))) )
))
(declare-fun bs!64 () BitStream!7196)

(declare-fun e!119575 () Bool)

(declare-fun inv!12 (BitStream!7196) Bool)

(assert (=> start!37864 (and (inv!12 bs!64) e!119575)))

(declare-fun b!171259 () Bool)

(declare-fun res!142050 () Bool)

(assert (=> b!171259 (=> (not res!142050) (not e!119573))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!171259 (= res!142050 (validate_offset_bits!1 ((_ sign_extend 32) (size!4029 (buf!4472 bs!64))) ((_ sign_extend 32) (currentByte!8489 bs!64)) ((_ sign_extend 32) (currentBit!8484 bs!64)) (bvsub nBits!283 from!235)))))

(declare-fun b!171260 () Bool)

(assert (=> b!171260 (= e!119573 (and (= (bvand from!235 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand from!235 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun lt!264063 () BitStream!7196)

(declare-fun withMovedBitIndex!0 (BitStream!7196 (_ BitVec 64)) BitStream!7196)

(assert (=> b!171260 (= lt!264063 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!14724 0))(
  ( (tuple2!14725 (_1!7995 BitStream!7196) (_2!7995 Bool)) )
))
(declare-fun lt!264065 () tuple2!14724)

(declare-fun readBitPure!0 (BitStream!7196) tuple2!14724)

(assert (=> b!171260 (= lt!264065 (readBitPure!0 bs!64))))

(declare-fun lt!264064 () tuple2!14724)

(declare-fun expected!82 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!7196 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!14724)

(assert (=> b!171260 (= lt!264064 (checkBitsLoopPure!0 bs!64 nBits!283 expected!82 from!235))))

(declare-fun b!171261 () Bool)

(declare-fun array_inv!3770 (array!9104) Bool)

(assert (=> b!171261 (= e!119575 (array_inv!3770 (buf!4472 bs!64)))))

(assert (= (and start!37864 res!142049) b!171259))

(assert (= (and b!171259 res!142050) b!171260))

(assert (= start!37864 b!171261))

(declare-fun m!270391 () Bool)

(assert (=> start!37864 m!270391))

(declare-fun m!270393 () Bool)

(assert (=> b!171259 m!270393))

(declare-fun m!270395 () Bool)

(assert (=> b!171260 m!270395))

(declare-fun m!270397 () Bool)

(assert (=> b!171260 m!270397))

(declare-fun m!270399 () Bool)

(assert (=> b!171260 m!270399))

(declare-fun m!270401 () Bool)

(assert (=> b!171261 m!270401))

(push 1)

(assert (not b!171259))

(assert (not start!37864))

(assert (not b!171260))

(assert (not b!171261))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

