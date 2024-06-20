; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61200 () Bool)

(assert start!61200)

(declare-fun b!275681 () Bool)

(declare-fun res!229126 () Bool)

(declare-fun e!195651 () Bool)

(assert (=> b!275681 (=> (not res!229126) (not e!195651))))

(declare-datatypes ((array!15761 0))(
  ( (array!15762 (arr!7815 (Array (_ BitVec 32) (_ BitVec 8))) (size!6828 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12470 0))(
  ( (BitStream!12471 (buf!7296 array!15761) (currentByte!13469 (_ BitVec 32)) (currentBit!13464 (_ BitVec 32))) )
))
(declare-fun bs1!11 () BitStream!12470)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!275681 (= res!229126 (validate_offset_bit!0 ((_ sign_extend 32) (size!6828 (buf!7296 bs1!11))) ((_ sign_extend 32) (currentByte!13469 bs1!11)) ((_ sign_extend 32) (currentBit!13464 bs1!11))))))

(declare-fun b!275682 () Bool)

(declare-fun res!229124 () Bool)

(assert (=> b!275682 (=> (not res!229124) (not e!195651))))

(declare-fun bs2!19 () BitStream!12470)

(declare-fun arrayBitRangesEq!0 (array!15761 array!15761 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!275682 (= res!229124 (arrayBitRangesEq!0 (buf!7296 bs1!11) (buf!7296 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!6828 (buf!7296 bs1!11)) (currentByte!13469 bs1!11) (currentBit!13464 bs1!11)))))))

(declare-fun b!275683 () Bool)

(assert (=> b!275683 (= e!195651 (not true))))

(declare-datatypes ((tuple2!22476 0))(
  ( (tuple2!22477 (_1!12270 BitStream!12470) (_2!12270 Bool)) )
))
(declare-fun lt!413672 () tuple2!22476)

(declare-fun readBitPure!0 (BitStream!12470) tuple2!22476)

(assert (=> b!275683 (= lt!413672 (readBitPure!0 (BitStream!12471 (buf!7296 bs2!19) (currentByte!13469 bs1!11) (currentBit!13464 bs1!11))))))

(declare-fun lt!413671 () tuple2!22476)

(assert (=> b!275683 (= lt!413671 (readBitPure!0 bs1!11))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!275683 (invariant!0 (currentBit!13464 bs1!11) (currentByte!13469 bs1!11) (size!6828 (buf!7296 bs2!19)))))

(declare-fun res!229125 () Bool)

(assert (=> start!61200 (=> (not res!229125) (not e!195651))))

(assert (=> start!61200 (= res!229125 (= (size!6828 (buf!7296 bs1!11)) (size!6828 (buf!7296 bs2!19))))))

(assert (=> start!61200 e!195651))

(declare-fun e!195655 () Bool)

(declare-fun inv!12 (BitStream!12470) Bool)

(assert (=> start!61200 (and (inv!12 bs1!11) e!195655)))

(declare-fun e!195653 () Bool)

(assert (=> start!61200 (and (inv!12 bs2!19) e!195653)))

(declare-fun b!275684 () Bool)

(declare-fun array_inv!6552 (array!15761) Bool)

(assert (=> b!275684 (= e!195655 (array_inv!6552 (buf!7296 bs1!11)))))

(declare-fun b!275685 () Bool)

(assert (=> b!275685 (= e!195653 (array_inv!6552 (buf!7296 bs2!19)))))

(assert (= (and start!61200 res!229125) b!275681))

(assert (= (and b!275681 res!229126) b!275682))

(assert (= (and b!275682 res!229124) b!275683))

(assert (= start!61200 b!275684))

(assert (= start!61200 b!275685))

(declare-fun m!408395 () Bool)

(assert (=> start!61200 m!408395))

(declare-fun m!408397 () Bool)

(assert (=> start!61200 m!408397))

(declare-fun m!408399 () Bool)

(assert (=> b!275685 m!408399))

(declare-fun m!408401 () Bool)

(assert (=> b!275681 m!408401))

(declare-fun m!408403 () Bool)

(assert (=> b!275682 m!408403))

(declare-fun m!408405 () Bool)

(assert (=> b!275682 m!408405))

(declare-fun m!408407 () Bool)

(assert (=> b!275683 m!408407))

(declare-fun m!408409 () Bool)

(assert (=> b!275683 m!408409))

(declare-fun m!408411 () Bool)

(assert (=> b!275683 m!408411))

(declare-fun m!408413 () Bool)

(assert (=> b!275684 m!408413))

(push 1)

(assert (not b!275684))

(assert (not b!275681))

(assert (not start!61200))

(assert (not b!275683))

(assert (not b!275682))

(assert (not b!275685))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

