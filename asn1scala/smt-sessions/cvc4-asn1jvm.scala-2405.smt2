; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61188 () Bool)

(assert start!61188)

(declare-fun b!275591 () Bool)

(declare-fun res!229070 () Bool)

(declare-fun e!195561 () Bool)

(assert (=> b!275591 (=> (not res!229070) (not e!195561))))

(declare-datatypes ((array!15749 0))(
  ( (array!15750 (arr!7809 (Array (_ BitVec 32) (_ BitVec 8))) (size!6822 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12458 0))(
  ( (BitStream!12459 (buf!7290 array!15749) (currentByte!13463 (_ BitVec 32)) (currentBit!13458 (_ BitVec 32))) )
))
(declare-fun bs1!11 () BitStream!12458)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!275591 (= res!229070 (validate_offset_bit!0 ((_ sign_extend 32) (size!6822 (buf!7290 bs1!11))) ((_ sign_extend 32) (currentByte!13463 bs1!11)) ((_ sign_extend 32) (currentBit!13458 bs1!11))))))

(declare-fun b!275592 () Bool)

(declare-fun e!195564 () Bool)

(declare-fun array_inv!6546 (array!15749) Bool)

(assert (=> b!275592 (= e!195564 (array_inv!6546 (buf!7290 bs1!11)))))

(declare-fun b!275593 () Bool)

(declare-fun e!195562 () Bool)

(declare-fun bs2!19 () BitStream!12458)

(assert (=> b!275593 (= e!195562 (array_inv!6546 (buf!7290 bs2!19)))))

(declare-fun res!229071 () Bool)

(assert (=> start!61188 (=> (not res!229071) (not e!195561))))

(assert (=> start!61188 (= res!229071 (= (size!6822 (buf!7290 bs1!11)) (size!6822 (buf!7290 bs2!19))))))

(assert (=> start!61188 e!195561))

(declare-fun inv!12 (BitStream!12458) Bool)

(assert (=> start!61188 (and (inv!12 bs1!11) e!195564)))

(assert (=> start!61188 (and (inv!12 bs2!19) e!195562)))

(declare-fun b!275594 () Bool)

(assert (=> b!275594 (= e!195561 (not true))))

(declare-datatypes ((tuple2!22464 0))(
  ( (tuple2!22465 (_1!12264 BitStream!12458) (_2!12264 Bool)) )
))
(declare-fun lt!413635 () tuple2!22464)

(declare-fun readBitPure!0 (BitStream!12458) tuple2!22464)

(assert (=> b!275594 (= lt!413635 (readBitPure!0 (BitStream!12459 (buf!7290 bs2!19) (currentByte!13463 bs1!11) (currentBit!13458 bs1!11))))))

(declare-fun lt!413636 () tuple2!22464)

(assert (=> b!275594 (= lt!413636 (readBitPure!0 bs1!11))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!275594 (invariant!0 (currentBit!13458 bs1!11) (currentByte!13463 bs1!11) (size!6822 (buf!7290 bs2!19)))))

(declare-fun b!275595 () Bool)

(declare-fun res!229072 () Bool)

(assert (=> b!275595 (=> (not res!229072) (not e!195561))))

(declare-fun arrayBitRangesEq!0 (array!15749 array!15749 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!275595 (= res!229072 (arrayBitRangesEq!0 (buf!7290 bs1!11) (buf!7290 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!6822 (buf!7290 bs1!11)) (currentByte!13463 bs1!11) (currentBit!13458 bs1!11)))))))

(assert (= (and start!61188 res!229071) b!275591))

(assert (= (and b!275591 res!229070) b!275595))

(assert (= (and b!275595 res!229072) b!275594))

(assert (= start!61188 b!275592))

(assert (= start!61188 b!275593))

(declare-fun m!408275 () Bool)

(assert (=> b!275594 m!408275))

(declare-fun m!408277 () Bool)

(assert (=> b!275594 m!408277))

(declare-fun m!408279 () Bool)

(assert (=> b!275594 m!408279))

(declare-fun m!408281 () Bool)

(assert (=> b!275595 m!408281))

(declare-fun m!408283 () Bool)

(assert (=> b!275595 m!408283))

(declare-fun m!408285 () Bool)

(assert (=> b!275591 m!408285))

(declare-fun m!408287 () Bool)

(assert (=> b!275592 m!408287))

(declare-fun m!408289 () Bool)

(assert (=> start!61188 m!408289))

(declare-fun m!408291 () Bool)

(assert (=> start!61188 m!408291))

(declare-fun m!408293 () Bool)

(assert (=> b!275593 m!408293))

(push 1)

(assert (not start!61188))

(assert (not b!275591))

(assert (not b!275593))

(assert (not b!275594))

(assert (not b!275592))

(assert (not b!275595))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

