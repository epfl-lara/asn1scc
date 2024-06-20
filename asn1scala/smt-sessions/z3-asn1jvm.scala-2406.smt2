; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61192 () Bool)

(assert start!61192)

(declare-fun b!275621 () Bool)

(declare-fun e!195593 () Bool)

(declare-datatypes ((array!15753 0))(
  ( (array!15754 (arr!7811 (Array (_ BitVec 32) (_ BitVec 8))) (size!6824 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12462 0))(
  ( (BitStream!12463 (buf!7292 array!15753) (currentByte!13465 (_ BitVec 32)) (currentBit!13460 (_ BitVec 32))) )
))
(declare-fun bs2!19 () BitStream!12462)

(declare-fun array_inv!6548 (array!15753) Bool)

(assert (=> b!275621 (= e!195593 (array_inv!6548 (buf!7292 bs2!19)))))

(declare-fun b!275622 () Bool)

(declare-fun res!229090 () Bool)

(declare-fun e!195595 () Bool)

(assert (=> b!275622 (=> (not res!229090) (not e!195595))))

(declare-fun bs1!11 () BitStream!12462)

(declare-fun arrayBitRangesEq!0 (array!15753 array!15753 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!275622 (= res!229090 (arrayBitRangesEq!0 (buf!7292 bs1!11) (buf!7292 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!6824 (buf!7292 bs1!11)) (currentByte!13465 bs1!11) (currentBit!13460 bs1!11)))))))

(declare-fun b!275623 () Bool)

(assert (=> b!275623 (= e!195595 (not true))))

(declare-datatypes ((tuple2!22468 0))(
  ( (tuple2!22469 (_1!12266 BitStream!12462) (_2!12266 Bool)) )
))
(declare-fun lt!413647 () tuple2!22468)

(declare-fun readBitPure!0 (BitStream!12462) tuple2!22468)

(assert (=> b!275623 (= lt!413647 (readBitPure!0 (BitStream!12463 (buf!7292 bs2!19) (currentByte!13465 bs1!11) (currentBit!13460 bs1!11))))))

(declare-fun lt!413648 () tuple2!22468)

(assert (=> b!275623 (= lt!413648 (readBitPure!0 bs1!11))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!275623 (invariant!0 (currentBit!13460 bs1!11) (currentByte!13465 bs1!11) (size!6824 (buf!7292 bs2!19)))))

(declare-fun b!275624 () Bool)

(declare-fun res!229088 () Bool)

(assert (=> b!275624 (=> (not res!229088) (not e!195595))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!275624 (= res!229088 (validate_offset_bit!0 ((_ sign_extend 32) (size!6824 (buf!7292 bs1!11))) ((_ sign_extend 32) (currentByte!13465 bs1!11)) ((_ sign_extend 32) (currentBit!13460 bs1!11))))))

(declare-fun b!275625 () Bool)

(declare-fun e!195591 () Bool)

(assert (=> b!275625 (= e!195591 (array_inv!6548 (buf!7292 bs1!11)))))

(declare-fun res!229089 () Bool)

(assert (=> start!61192 (=> (not res!229089) (not e!195595))))

(assert (=> start!61192 (= res!229089 (= (size!6824 (buf!7292 bs1!11)) (size!6824 (buf!7292 bs2!19))))))

(assert (=> start!61192 e!195595))

(declare-fun inv!12 (BitStream!12462) Bool)

(assert (=> start!61192 (and (inv!12 bs1!11) e!195591)))

(assert (=> start!61192 (and (inv!12 bs2!19) e!195593)))

(assert (= (and start!61192 res!229089) b!275624))

(assert (= (and b!275624 res!229088) b!275622))

(assert (= (and b!275622 res!229090) b!275623))

(assert (= start!61192 b!275625))

(assert (= start!61192 b!275621))

(declare-fun m!408315 () Bool)

(assert (=> b!275621 m!408315))

(declare-fun m!408317 () Bool)

(assert (=> b!275624 m!408317))

(declare-fun m!408319 () Bool)

(assert (=> b!275622 m!408319))

(declare-fun m!408321 () Bool)

(assert (=> b!275622 m!408321))

(declare-fun m!408323 () Bool)

(assert (=> start!61192 m!408323))

(declare-fun m!408325 () Bool)

(assert (=> start!61192 m!408325))

(declare-fun m!408327 () Bool)

(assert (=> b!275625 m!408327))

(declare-fun m!408329 () Bool)

(assert (=> b!275623 m!408329))

(declare-fun m!408331 () Bool)

(assert (=> b!275623 m!408331))

(declare-fun m!408333 () Bool)

(assert (=> b!275623 m!408333))

(check-sat (not b!275621) (not b!275623) (not b!275622) (not b!275625) (not start!61192) (not b!275624))
