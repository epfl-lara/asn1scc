; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61174 () Bool)

(assert start!61174)

(declare-fun b!275486 () Bool)

(declare-fun e!195456 () Bool)

(assert (=> b!275486 (= e!195456 (not true))))

(declare-datatypes ((array!15735 0))(
  ( (array!15736 (arr!7802 (Array (_ BitVec 32) (_ BitVec 8))) (size!6815 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12444 0))(
  ( (BitStream!12445 (buf!7283 array!15735) (currentByte!13456 (_ BitVec 32)) (currentBit!13451 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!22450 0))(
  ( (tuple2!22451 (_1!12257 BitStream!12444) (_2!12257 Bool)) )
))
(declare-fun lt!413594 () tuple2!22450)

(declare-fun bs2!19 () BitStream!12444)

(declare-fun bs1!11 () BitStream!12444)

(declare-fun readBitPure!0 (BitStream!12444) tuple2!22450)

(assert (=> b!275486 (= lt!413594 (readBitPure!0 (BitStream!12445 (buf!7283 bs2!19) (currentByte!13456 bs1!11) (currentBit!13451 bs1!11))))))

(declare-fun lt!413593 () tuple2!22450)

(assert (=> b!275486 (= lt!413593 (readBitPure!0 bs1!11))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!275486 (invariant!0 (currentBit!13451 bs1!11) (currentByte!13456 bs1!11) (size!6815 (buf!7283 bs2!19)))))

(declare-fun res!229008 () Bool)

(assert (=> start!61174 (=> (not res!229008) (not e!195456))))

(assert (=> start!61174 (= res!229008 (= (size!6815 (buf!7283 bs1!11)) (size!6815 (buf!7283 bs2!19))))))

(assert (=> start!61174 e!195456))

(declare-fun e!195457 () Bool)

(declare-fun inv!12 (BitStream!12444) Bool)

(assert (=> start!61174 (and (inv!12 bs1!11) e!195457)))

(declare-fun e!195460 () Bool)

(assert (=> start!61174 (and (inv!12 bs2!19) e!195460)))

(declare-fun b!275487 () Bool)

(declare-fun res!229007 () Bool)

(assert (=> b!275487 (=> (not res!229007) (not e!195456))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!275487 (= res!229007 (validate_offset_bit!0 ((_ sign_extend 32) (size!6815 (buf!7283 bs1!11))) ((_ sign_extend 32) (currentByte!13456 bs1!11)) ((_ sign_extend 32) (currentBit!13451 bs1!11))))))

(declare-fun b!275488 () Bool)

(declare-fun array_inv!6539 (array!15735) Bool)

(assert (=> b!275488 (= e!195460 (array_inv!6539 (buf!7283 bs2!19)))))

(declare-fun b!275489 () Bool)

(assert (=> b!275489 (= e!195457 (array_inv!6539 (buf!7283 bs1!11)))))

(declare-fun b!275490 () Bool)

(declare-fun res!229009 () Bool)

(assert (=> b!275490 (=> (not res!229009) (not e!195456))))

(declare-fun arrayBitRangesEq!0 (array!15735 array!15735 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!275490 (= res!229009 (arrayBitRangesEq!0 (buf!7283 bs1!11) (buf!7283 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!6815 (buf!7283 bs1!11)) (currentByte!13456 bs1!11) (currentBit!13451 bs1!11)))))))

(assert (= (and start!61174 res!229008) b!275487))

(assert (= (and b!275487 res!229007) b!275490))

(assert (= (and b!275490 res!229009) b!275486))

(assert (= start!61174 b!275489))

(assert (= start!61174 b!275488))

(declare-fun m!408135 () Bool)

(assert (=> b!275488 m!408135))

(declare-fun m!408137 () Bool)

(assert (=> b!275487 m!408137))

(declare-fun m!408139 () Bool)

(assert (=> b!275486 m!408139))

(declare-fun m!408141 () Bool)

(assert (=> b!275486 m!408141))

(declare-fun m!408143 () Bool)

(assert (=> b!275486 m!408143))

(declare-fun m!408145 () Bool)

(assert (=> b!275490 m!408145))

(declare-fun m!408147 () Bool)

(assert (=> b!275490 m!408147))

(declare-fun m!408149 () Bool)

(assert (=> b!275489 m!408149))

(declare-fun m!408151 () Bool)

(assert (=> start!61174 m!408151))

(declare-fun m!408153 () Bool)

(assert (=> start!61174 m!408153))

(check-sat (not start!61174) (not b!275487) (not b!275488) (not b!275490) (not b!275486) (not b!275489))
