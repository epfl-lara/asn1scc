; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37764 () Bool)

(assert start!37764)

(declare-fun res!141879 () Bool)

(declare-fun e!119379 () Bool)

(assert (=> start!37764 (=> (not res!141879) (not e!119379))))

(declare-fun nBits!283 () (_ BitVec 64))

(declare-fun from!235 () (_ BitVec 64))

(assert (=> start!37764 (= res!141879 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle nBits!283 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!235) (bvslt from!235 nBits!283)))))

(assert (=> start!37764 e!119379))

(assert (=> start!37764 true))

(declare-datatypes ((array!9085 0))(
  ( (array!9086 (arr!4951 (Array (_ BitVec 32) (_ BitVec 8))) (size!4021 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7180 0))(
  ( (BitStream!7181 (buf!4464 array!9085) (currentByte!8469 (_ BitVec 32)) (currentBit!8464 (_ BitVec 32))) )
))
(declare-fun bs!64 () BitStream!7180)

(declare-fun e!119380 () Bool)

(declare-fun inv!12 (BitStream!7180) Bool)

(assert (=> start!37764 (and (inv!12 bs!64) e!119380)))

(declare-fun b!171025 () Bool)

(declare-fun res!141878 () Bool)

(assert (=> b!171025 (=> (not res!141878) (not e!119379))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!171025 (= res!141878 (validate_offset_bits!1 ((_ sign_extend 32) (size!4021 (buf!4464 bs!64))) ((_ sign_extend 32) (currentByte!8469 bs!64)) ((_ sign_extend 32) (currentBit!8464 bs!64)) (bvsub nBits!283 from!235)))))

(declare-fun b!171026 () Bool)

(assert (=> b!171026 (= e!119379 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235))))))

(declare-fun lt!263658 () BitStream!7180)

(declare-fun withMovedBitIndex!0 (BitStream!7180 (_ BitVec 64)) BitStream!7180)

(assert (=> b!171026 (= lt!263658 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!14696 0))(
  ( (tuple2!14697 (_1!7981 BitStream!7180) (_2!7981 Bool)) )
))
(declare-fun lt!263659 () tuple2!14696)

(declare-fun readBitPure!0 (BitStream!7180) tuple2!14696)

(assert (=> b!171026 (= lt!263659 (readBitPure!0 bs!64))))

(declare-fun lt!263660 () tuple2!14696)

(declare-fun expected!82 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!7180 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!14696)

(assert (=> b!171026 (= lt!263660 (checkBitsLoopPure!0 bs!64 nBits!283 expected!82 from!235))))

(declare-fun b!171027 () Bool)

(declare-fun array_inv!3762 (array!9085) Bool)

(assert (=> b!171027 (= e!119380 (array_inv!3762 (buf!4464 bs!64)))))

(assert (= (and start!37764 res!141879) b!171025))

(assert (= (and b!171025 res!141878) b!171026))

(assert (= start!37764 b!171027))

(declare-fun m!270163 () Bool)

(assert (=> start!37764 m!270163))

(declare-fun m!270165 () Bool)

(assert (=> b!171025 m!270165))

(declare-fun m!270167 () Bool)

(assert (=> b!171026 m!270167))

(declare-fun m!270169 () Bool)

(assert (=> b!171026 m!270169))

(declare-fun m!270171 () Bool)

(assert (=> b!171026 m!270171))

(declare-fun m!270173 () Bool)

(assert (=> b!171027 m!270173))

(push 1)

(assert (not b!171025))

(assert (not start!37764))

(assert (not b!171026))

(assert (not b!171027))

(check-sat)

(pop 1)

(push 1)

(check-sat)

