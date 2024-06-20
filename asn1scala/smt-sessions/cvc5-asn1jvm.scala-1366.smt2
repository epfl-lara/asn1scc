; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37860 () Bool)

(assert start!37860)

(declare-fun res!142038 () Bool)

(declare-fun e!119555 () Bool)

(assert (=> start!37860 (=> (not res!142038) (not e!119555))))

(declare-fun nBits!283 () (_ BitVec 64))

(declare-fun from!235 () (_ BitVec 64))

(assert (=> start!37860 (= res!142038 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle nBits!283 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!235) (bvslt from!235 nBits!283)))))

(assert (=> start!37860 e!119555))

(assert (=> start!37860 true))

(declare-datatypes ((array!9100 0))(
  ( (array!9101 (arr!4957 (Array (_ BitVec 32) (_ BitVec 8))) (size!4027 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7192 0))(
  ( (BitStream!7193 (buf!4470 array!9100) (currentByte!8487 (_ BitVec 32)) (currentBit!8482 (_ BitVec 32))) )
))
(declare-fun bs!64 () BitStream!7192)

(declare-fun e!119556 () Bool)

(declare-fun inv!12 (BitStream!7192) Bool)

(assert (=> start!37860 (and (inv!12 bs!64) e!119556)))

(declare-fun b!171241 () Bool)

(declare-fun res!142037 () Bool)

(assert (=> b!171241 (=> (not res!142037) (not e!119555))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!171241 (= res!142037 (validate_offset_bits!1 ((_ sign_extend 32) (size!4027 (buf!4470 bs!64))) ((_ sign_extend 32) (currentByte!8487 bs!64)) ((_ sign_extend 32) (currentBit!8482 bs!64)) (bvsub nBits!283 from!235)))))

(declare-fun b!171242 () Bool)

(assert (=> b!171242 (= e!119555 (and (= (bvand from!235 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand from!235 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun lt!264047 () BitStream!7192)

(declare-fun withMovedBitIndex!0 (BitStream!7192 (_ BitVec 64)) BitStream!7192)

(assert (=> b!171242 (= lt!264047 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!14720 0))(
  ( (tuple2!14721 (_1!7993 BitStream!7192) (_2!7993 Bool)) )
))
(declare-fun lt!264045 () tuple2!14720)

(declare-fun readBitPure!0 (BitStream!7192) tuple2!14720)

(assert (=> b!171242 (= lt!264045 (readBitPure!0 bs!64))))

(declare-fun expected!82 () Bool)

(declare-fun lt!264046 () tuple2!14720)

(declare-fun checkBitsLoopPure!0 (BitStream!7192 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!14720)

(assert (=> b!171242 (= lt!264046 (checkBitsLoopPure!0 bs!64 nBits!283 expected!82 from!235))))

(declare-fun b!171243 () Bool)

(declare-fun array_inv!3768 (array!9100) Bool)

(assert (=> b!171243 (= e!119556 (array_inv!3768 (buf!4470 bs!64)))))

(assert (= (and start!37860 res!142038) b!171241))

(assert (= (and b!171241 res!142037) b!171242))

(assert (= start!37860 b!171243))

(declare-fun m!270367 () Bool)

(assert (=> start!37860 m!270367))

(declare-fun m!270369 () Bool)

(assert (=> b!171241 m!270369))

(declare-fun m!270371 () Bool)

(assert (=> b!171242 m!270371))

(declare-fun m!270373 () Bool)

(assert (=> b!171242 m!270373))

(declare-fun m!270375 () Bool)

(assert (=> b!171242 m!270375))

(declare-fun m!270377 () Bool)

(assert (=> b!171243 m!270377))

(push 1)

(assert (not b!171241))

(assert (not start!37860))

(assert (not b!171242))

(assert (not b!171243))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

