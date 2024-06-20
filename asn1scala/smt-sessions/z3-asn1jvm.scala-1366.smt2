; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37862 () Bool)

(assert start!37862)

(declare-fun res!142044 () Bool)

(declare-fun e!119564 () Bool)

(assert (=> start!37862 (=> (not res!142044) (not e!119564))))

(declare-fun nBits!283 () (_ BitVec 64))

(declare-fun from!235 () (_ BitVec 64))

(assert (=> start!37862 (= res!142044 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle nBits!283 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!235) (bvslt from!235 nBits!283)))))

(assert (=> start!37862 e!119564))

(assert (=> start!37862 true))

(declare-datatypes ((array!9102 0))(
  ( (array!9103 (arr!4958 (Array (_ BitVec 32) (_ BitVec 8))) (size!4028 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7194 0))(
  ( (BitStream!7195 (buf!4471 array!9102) (currentByte!8488 (_ BitVec 32)) (currentBit!8483 (_ BitVec 32))) )
))
(declare-fun bs!64 () BitStream!7194)

(declare-fun e!119565 () Bool)

(declare-fun inv!12 (BitStream!7194) Bool)

(assert (=> start!37862 (and (inv!12 bs!64) e!119565)))

(declare-fun b!171250 () Bool)

(declare-fun res!142043 () Bool)

(assert (=> b!171250 (=> (not res!142043) (not e!119564))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!171250 (= res!142043 (validate_offset_bits!1 ((_ sign_extend 32) (size!4028 (buf!4471 bs!64))) ((_ sign_extend 32) (currentByte!8488 bs!64)) ((_ sign_extend 32) (currentBit!8483 bs!64)) (bvsub nBits!283 from!235)))))

(declare-fun b!171251 () Bool)

(assert (=> b!171251 (= e!119564 (and (= (bvand from!235 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand from!235 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun lt!264055 () BitStream!7194)

(declare-fun withMovedBitIndex!0 (BitStream!7194 (_ BitVec 64)) BitStream!7194)

(assert (=> b!171251 (= lt!264055 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!14722 0))(
  ( (tuple2!14723 (_1!7994 BitStream!7194) (_2!7994 Bool)) )
))
(declare-fun lt!264054 () tuple2!14722)

(declare-fun readBitPure!0 (BitStream!7194) tuple2!14722)

(assert (=> b!171251 (= lt!264054 (readBitPure!0 bs!64))))

(declare-fun lt!264056 () tuple2!14722)

(declare-fun expected!82 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!7194 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!14722)

(assert (=> b!171251 (= lt!264056 (checkBitsLoopPure!0 bs!64 nBits!283 expected!82 from!235))))

(declare-fun b!171252 () Bool)

(declare-fun array_inv!3769 (array!9102) Bool)

(assert (=> b!171252 (= e!119565 (array_inv!3769 (buf!4471 bs!64)))))

(assert (= (and start!37862 res!142044) b!171250))

(assert (= (and b!171250 res!142043) b!171251))

(assert (= start!37862 b!171252))

(declare-fun m!270379 () Bool)

(assert (=> start!37862 m!270379))

(declare-fun m!270381 () Bool)

(assert (=> b!171250 m!270381))

(declare-fun m!270383 () Bool)

(assert (=> b!171251 m!270383))

(declare-fun m!270385 () Bool)

(assert (=> b!171251 m!270385))

(declare-fun m!270387 () Bool)

(assert (=> b!171251 m!270387))

(declare-fun m!270389 () Bool)

(assert (=> b!171252 m!270389))

(check-sat (not b!171252) (not b!171250) (not b!171251) (not start!37862))
