; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61196 () Bool)

(assert start!61196)

(declare-fun b!275651 () Bool)

(declare-fun e!195624 () Bool)

(assert (=> b!275651 (= e!195624 (not true))))

(declare-datatypes ((array!15757 0))(
  ( (array!15758 (arr!7813 (Array (_ BitVec 32) (_ BitVec 8))) (size!6826 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12466 0))(
  ( (BitStream!12467 (buf!7294 array!15757) (currentByte!13467 (_ BitVec 32)) (currentBit!13462 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!22472 0))(
  ( (tuple2!22473 (_1!12268 BitStream!12466) (_2!12268 Bool)) )
))
(declare-fun lt!413660 () tuple2!22472)

(declare-fun bs2!19 () BitStream!12466)

(declare-fun bs1!11 () BitStream!12466)

(declare-fun readBitPure!0 (BitStream!12466) tuple2!22472)

(assert (=> b!275651 (= lt!413660 (readBitPure!0 (BitStream!12467 (buf!7294 bs2!19) (currentByte!13467 bs1!11) (currentBit!13462 bs1!11))))))

(declare-fun lt!413659 () tuple2!22472)

(assert (=> b!275651 (= lt!413659 (readBitPure!0 bs1!11))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!275651 (invariant!0 (currentBit!13462 bs1!11) (currentByte!13467 bs1!11) (size!6826 (buf!7294 bs2!19)))))

(declare-fun b!275652 () Bool)

(declare-fun e!195625 () Bool)

(declare-fun array_inv!6550 (array!15757) Bool)

(assert (=> b!275652 (= e!195625 (array_inv!6550 (buf!7294 bs1!11)))))

(declare-fun b!275653 () Bool)

(declare-fun res!229106 () Bool)

(assert (=> b!275653 (=> (not res!229106) (not e!195624))))

(declare-fun arrayBitRangesEq!0 (array!15757 array!15757 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!275653 (= res!229106 (arrayBitRangesEq!0 (buf!7294 bs1!11) (buf!7294 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!6826 (buf!7294 bs1!11)) (currentByte!13467 bs1!11) (currentBit!13462 bs1!11)))))))

(declare-fun b!275654 () Bool)

(declare-fun res!229108 () Bool)

(assert (=> b!275654 (=> (not res!229108) (not e!195624))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!275654 (= res!229108 (validate_offset_bit!0 ((_ sign_extend 32) (size!6826 (buf!7294 bs1!11))) ((_ sign_extend 32) (currentByte!13467 bs1!11)) ((_ sign_extend 32) (currentBit!13462 bs1!11))))))

(declare-fun res!229107 () Bool)

(assert (=> start!61196 (=> (not res!229107) (not e!195624))))

(assert (=> start!61196 (= res!229107 (= (size!6826 (buf!7294 bs1!11)) (size!6826 (buf!7294 bs2!19))))))

(assert (=> start!61196 e!195624))

(declare-fun inv!12 (BitStream!12466) Bool)

(assert (=> start!61196 (and (inv!12 bs1!11) e!195625)))

(declare-fun e!195622 () Bool)

(assert (=> start!61196 (and (inv!12 bs2!19) e!195622)))

(declare-fun b!275655 () Bool)

(assert (=> b!275655 (= e!195622 (array_inv!6550 (buf!7294 bs2!19)))))

(assert (= (and start!61196 res!229107) b!275654))

(assert (= (and b!275654 res!229108) b!275653))

(assert (= (and b!275653 res!229106) b!275651))

(assert (= start!61196 b!275652))

(assert (= start!61196 b!275655))

(declare-fun m!408355 () Bool)

(assert (=> b!275654 m!408355))

(declare-fun m!408357 () Bool)

(assert (=> b!275652 m!408357))

(declare-fun m!408359 () Bool)

(assert (=> b!275655 m!408359))

(declare-fun m!408361 () Bool)

(assert (=> start!61196 m!408361))

(declare-fun m!408363 () Bool)

(assert (=> start!61196 m!408363))

(declare-fun m!408365 () Bool)

(assert (=> b!275651 m!408365))

(declare-fun m!408367 () Bool)

(assert (=> b!275651 m!408367))

(declare-fun m!408369 () Bool)

(assert (=> b!275651 m!408369))

(declare-fun m!408371 () Bool)

(assert (=> b!275653 m!408371))

(declare-fun m!408373 () Bool)

(assert (=> b!275653 m!408373))

(push 1)

(assert (not b!275654))

(assert (not start!61196))

(assert (not b!275651))

(assert (not b!275655))

(assert (not b!275653))

(assert (not b!275652))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

