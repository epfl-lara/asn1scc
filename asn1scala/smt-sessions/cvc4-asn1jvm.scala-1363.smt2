; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37768 () Bool)

(assert start!37768)

(declare-fun res!141891 () Bool)

(declare-fun e!119397 () Bool)

(assert (=> start!37768 (=> (not res!141891) (not e!119397))))

(declare-fun nBits!283 () (_ BitVec 64))

(declare-fun from!235 () (_ BitVec 64))

(assert (=> start!37768 (= res!141891 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle nBits!283 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!235) (bvslt from!235 nBits!283)))))

(assert (=> start!37768 e!119397))

(assert (=> start!37768 true))

(declare-datatypes ((array!9089 0))(
  ( (array!9090 (arr!4953 (Array (_ BitVec 32) (_ BitVec 8))) (size!4023 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7184 0))(
  ( (BitStream!7185 (buf!4466 array!9089) (currentByte!8471 (_ BitVec 32)) (currentBit!8466 (_ BitVec 32))) )
))
(declare-fun bs!64 () BitStream!7184)

(declare-fun e!119396 () Bool)

(declare-fun inv!12 (BitStream!7184) Bool)

(assert (=> start!37768 (and (inv!12 bs!64) e!119396)))

(declare-fun b!171043 () Bool)

(declare-fun res!141890 () Bool)

(assert (=> b!171043 (=> (not res!141890) (not e!119397))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!171043 (= res!141890 (validate_offset_bits!1 ((_ sign_extend 32) (size!4023 (buf!4466 bs!64))) ((_ sign_extend 32) (currentByte!8471 bs!64)) ((_ sign_extend 32) (currentBit!8466 bs!64)) (bvsub nBits!283 from!235)))))

(declare-fun b!171044 () Bool)

(assert (=> b!171044 (= e!119397 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235))))))

(declare-fun lt!263677 () BitStream!7184)

(declare-fun withMovedBitIndex!0 (BitStream!7184 (_ BitVec 64)) BitStream!7184)

(assert (=> b!171044 (= lt!263677 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!14700 0))(
  ( (tuple2!14701 (_1!7983 BitStream!7184) (_2!7983 Bool)) )
))
(declare-fun lt!263676 () tuple2!14700)

(declare-fun readBitPure!0 (BitStream!7184) tuple2!14700)

(assert (=> b!171044 (= lt!263676 (readBitPure!0 bs!64))))

(declare-fun expected!82 () Bool)

(declare-fun lt!263678 () tuple2!14700)

(declare-fun checkBitsLoopPure!0 (BitStream!7184 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!14700)

(assert (=> b!171044 (= lt!263678 (checkBitsLoopPure!0 bs!64 nBits!283 expected!82 from!235))))

(declare-fun b!171045 () Bool)

(declare-fun array_inv!3764 (array!9089) Bool)

(assert (=> b!171045 (= e!119396 (array_inv!3764 (buf!4466 bs!64)))))

(assert (= (and start!37768 res!141891) b!171043))

(assert (= (and b!171043 res!141890) b!171044))

(assert (= start!37768 b!171045))

(declare-fun m!270187 () Bool)

(assert (=> start!37768 m!270187))

(declare-fun m!270189 () Bool)

(assert (=> b!171043 m!270189))

(declare-fun m!270191 () Bool)

(assert (=> b!171044 m!270191))

(declare-fun m!270193 () Bool)

(assert (=> b!171044 m!270193))

(declare-fun m!270195 () Bool)

(assert (=> b!171044 m!270195))

(declare-fun m!270197 () Bool)

(assert (=> b!171045 m!270197))

(push 1)

(assert (not b!171043))

(assert (not b!171045))

(assert (not start!37768))

(assert (not b!171044))

(check-sat)

(pop 1)

(push 1)

(check-sat)

