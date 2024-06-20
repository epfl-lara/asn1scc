; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61180 () Bool)

(assert start!61180)

(declare-fun b!275531 () Bool)

(declare-fun e!195503 () Bool)

(assert (=> b!275531 (= e!195503 (not true))))

(declare-datatypes ((array!15741 0))(
  ( (array!15742 (arr!7805 (Array (_ BitVec 32) (_ BitVec 8))) (size!6818 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12450 0))(
  ( (BitStream!12451 (buf!7286 array!15741) (currentByte!13459 (_ BitVec 32)) (currentBit!13454 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!22456 0))(
  ( (tuple2!22457 (_1!12260 BitStream!12450) (_2!12260 Bool)) )
))
(declare-fun lt!413612 () tuple2!22456)

(declare-fun bs2!19 () BitStream!12450)

(declare-fun bs1!11 () BitStream!12450)

(declare-fun readBitPure!0 (BitStream!12450) tuple2!22456)

(assert (=> b!275531 (= lt!413612 (readBitPure!0 (BitStream!12451 (buf!7286 bs2!19) (currentByte!13459 bs1!11) (currentBit!13454 bs1!11))))))

(declare-fun lt!413611 () tuple2!22456)

(assert (=> b!275531 (= lt!413611 (readBitPure!0 bs1!11))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!275531 (invariant!0 (currentBit!13454 bs1!11) (currentByte!13459 bs1!11) (size!6818 (buf!7286 bs2!19)))))

(declare-fun b!275532 () Bool)

(declare-fun res!229036 () Bool)

(assert (=> b!275532 (=> (not res!229036) (not e!195503))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!275532 (= res!229036 (validate_offset_bit!0 ((_ sign_extend 32) (size!6818 (buf!7286 bs1!11))) ((_ sign_extend 32) (currentByte!13459 bs1!11)) ((_ sign_extend 32) (currentBit!13454 bs1!11))))))

(declare-fun res!229034 () Bool)

(assert (=> start!61180 (=> (not res!229034) (not e!195503))))

(assert (=> start!61180 (= res!229034 (= (size!6818 (buf!7286 bs1!11)) (size!6818 (buf!7286 bs2!19))))))

(assert (=> start!61180 e!195503))

(declare-fun e!195501 () Bool)

(declare-fun inv!12 (BitStream!12450) Bool)

(assert (=> start!61180 (and (inv!12 bs1!11) e!195501)))

(declare-fun e!195504 () Bool)

(assert (=> start!61180 (and (inv!12 bs2!19) e!195504)))

(declare-fun b!275533 () Bool)

(declare-fun res!229035 () Bool)

(assert (=> b!275533 (=> (not res!229035) (not e!195503))))

(declare-fun arrayBitRangesEq!0 (array!15741 array!15741 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!275533 (= res!229035 (arrayBitRangesEq!0 (buf!7286 bs1!11) (buf!7286 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!6818 (buf!7286 bs1!11)) (currentByte!13459 bs1!11) (currentBit!13454 bs1!11)))))))

(declare-fun b!275534 () Bool)

(declare-fun array_inv!6542 (array!15741) Bool)

(assert (=> b!275534 (= e!195504 (array_inv!6542 (buf!7286 bs2!19)))))

(declare-fun b!275535 () Bool)

(assert (=> b!275535 (= e!195501 (array_inv!6542 (buf!7286 bs1!11)))))

(assert (= (and start!61180 res!229034) b!275532))

(assert (= (and b!275532 res!229036) b!275533))

(assert (= (and b!275533 res!229035) b!275531))

(assert (= start!61180 b!275535))

(assert (= start!61180 b!275534))

(declare-fun m!408195 () Bool)

(assert (=> b!275535 m!408195))

(declare-fun m!408197 () Bool)

(assert (=> b!275531 m!408197))

(declare-fun m!408199 () Bool)

(assert (=> b!275531 m!408199))

(declare-fun m!408201 () Bool)

(assert (=> b!275531 m!408201))

(declare-fun m!408203 () Bool)

(assert (=> start!61180 m!408203))

(declare-fun m!408205 () Bool)

(assert (=> start!61180 m!408205))

(declare-fun m!408207 () Bool)

(assert (=> b!275534 m!408207))

(declare-fun m!408209 () Bool)

(assert (=> b!275533 m!408209))

(declare-fun m!408211 () Bool)

(assert (=> b!275533 m!408211))

(declare-fun m!408213 () Bool)

(assert (=> b!275532 m!408213))

(check-sat (not b!275531) (not b!275535) (not b!275533) (not start!61180) (not b!275532) (not b!275534))
