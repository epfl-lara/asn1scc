; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61194 () Bool)

(assert start!61194)

(declare-fun b!275636 () Bool)

(declare-fun e!195607 () Bool)

(declare-datatypes ((array!15755 0))(
  ( (array!15756 (arr!7812 (Array (_ BitVec 32) (_ BitVec 8))) (size!6825 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12464 0))(
  ( (BitStream!12465 (buf!7293 array!15755) (currentByte!13466 (_ BitVec 32)) (currentBit!13461 (_ BitVec 32))) )
))
(declare-fun bs1!11 () BitStream!12464)

(declare-fun array_inv!6549 (array!15755) Bool)

(assert (=> b!275636 (= e!195607 (array_inv!6549 (buf!7293 bs1!11)))))

(declare-fun b!275637 () Bool)

(declare-fun e!195606 () Bool)

(declare-fun bs2!19 () BitStream!12464)

(assert (=> b!275637 (= e!195606 (array_inv!6549 (buf!7293 bs2!19)))))

(declare-fun b!275638 () Bool)

(declare-fun e!195608 () Bool)

(assert (=> b!275638 (= e!195608 (not true))))

(declare-datatypes ((tuple2!22470 0))(
  ( (tuple2!22471 (_1!12267 BitStream!12464) (_2!12267 Bool)) )
))
(declare-fun lt!413654 () tuple2!22470)

(declare-fun readBitPure!0 (BitStream!12464) tuple2!22470)

(assert (=> b!275638 (= lt!413654 (readBitPure!0 (BitStream!12465 (buf!7293 bs2!19) (currentByte!13466 bs1!11) (currentBit!13461 bs1!11))))))

(declare-fun lt!413653 () tuple2!22470)

(assert (=> b!275638 (= lt!413653 (readBitPure!0 bs1!11))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!275638 (invariant!0 (currentBit!13461 bs1!11) (currentByte!13466 bs1!11) (size!6825 (buf!7293 bs2!19)))))

(declare-fun b!275639 () Bool)

(declare-fun res!229097 () Bool)

(assert (=> b!275639 (=> (not res!229097) (not e!195608))))

(declare-fun arrayBitRangesEq!0 (array!15755 array!15755 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!275639 (= res!229097 (arrayBitRangesEq!0 (buf!7293 bs1!11) (buf!7293 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!6825 (buf!7293 bs1!11)) (currentByte!13466 bs1!11) (currentBit!13461 bs1!11)))))))

(declare-fun res!229098 () Bool)

(assert (=> start!61194 (=> (not res!229098) (not e!195608))))

(assert (=> start!61194 (= res!229098 (= (size!6825 (buf!7293 bs1!11)) (size!6825 (buf!7293 bs2!19))))))

(assert (=> start!61194 e!195608))

(declare-fun inv!12 (BitStream!12464) Bool)

(assert (=> start!61194 (and (inv!12 bs1!11) e!195607)))

(assert (=> start!61194 (and (inv!12 bs2!19) e!195606)))

(declare-fun b!275640 () Bool)

(declare-fun res!229099 () Bool)

(assert (=> b!275640 (=> (not res!229099) (not e!195608))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!275640 (= res!229099 (validate_offset_bit!0 ((_ sign_extend 32) (size!6825 (buf!7293 bs1!11))) ((_ sign_extend 32) (currentByte!13466 bs1!11)) ((_ sign_extend 32) (currentBit!13461 bs1!11))))))

(assert (= (and start!61194 res!229098) b!275640))

(assert (= (and b!275640 res!229099) b!275639))

(assert (= (and b!275639 res!229097) b!275638))

(assert (= start!61194 b!275636))

(assert (= start!61194 b!275637))

(declare-fun m!408335 () Bool)

(assert (=> start!61194 m!408335))

(declare-fun m!408337 () Bool)

(assert (=> start!61194 m!408337))

(declare-fun m!408339 () Bool)

(assert (=> b!275639 m!408339))

(declare-fun m!408341 () Bool)

(assert (=> b!275639 m!408341))

(declare-fun m!408343 () Bool)

(assert (=> b!275640 m!408343))

(declare-fun m!408345 () Bool)

(assert (=> b!275638 m!408345))

(declare-fun m!408347 () Bool)

(assert (=> b!275638 m!408347))

(declare-fun m!408349 () Bool)

(assert (=> b!275638 m!408349))

(declare-fun m!408351 () Bool)

(assert (=> b!275637 m!408351))

(declare-fun m!408353 () Bool)

(assert (=> b!275636 m!408353))

(push 1)

(assert (not b!275637))

(assert (not b!275638))

(assert (not start!61194))

(assert (not b!275640))

(assert (not b!275636))

(assert (not b!275639))

(check-sat)

(pop 1)

(push 1)

(check-sat)

