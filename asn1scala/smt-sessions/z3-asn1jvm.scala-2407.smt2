; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61198 () Bool)

(assert start!61198)

(declare-fun b!275666 () Bool)

(declare-fun e!195637 () Bool)

(declare-datatypes ((array!15759 0))(
  ( (array!15760 (arr!7814 (Array (_ BitVec 32) (_ BitVec 8))) (size!6827 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12468 0))(
  ( (BitStream!12469 (buf!7295 array!15759) (currentByte!13468 (_ BitVec 32)) (currentBit!13463 (_ BitVec 32))) )
))
(declare-fun bs1!11 () BitStream!12468)

(declare-fun array_inv!6551 (array!15759) Bool)

(assert (=> b!275666 (= e!195637 (array_inv!6551 (buf!7295 bs1!11)))))

(declare-fun b!275667 () Bool)

(declare-fun e!195640 () Bool)

(declare-fun bs2!19 () BitStream!12468)

(assert (=> b!275667 (= e!195640 (array_inv!6551 (buf!7295 bs2!19)))))

(declare-fun b!275668 () Bool)

(declare-fun res!229116 () Bool)

(declare-fun e!195639 () Bool)

(assert (=> b!275668 (=> (not res!229116) (not e!195639))))

(declare-fun arrayBitRangesEq!0 (array!15759 array!15759 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!275668 (= res!229116 (arrayBitRangesEq!0 (buf!7295 bs1!11) (buf!7295 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!6827 (buf!7295 bs1!11)) (currentByte!13468 bs1!11) (currentBit!13463 bs1!11)))))))

(declare-fun b!275669 () Bool)

(declare-fun res!229117 () Bool)

(assert (=> b!275669 (=> (not res!229117) (not e!195639))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!275669 (= res!229117 (validate_offset_bit!0 ((_ sign_extend 32) (size!6827 (buf!7295 bs1!11))) ((_ sign_extend 32) (currentByte!13468 bs1!11)) ((_ sign_extend 32) (currentBit!13463 bs1!11))))))

(declare-fun b!275670 () Bool)

(assert (=> b!275670 (= e!195639 (not true))))

(declare-datatypes ((tuple2!22474 0))(
  ( (tuple2!22475 (_1!12269 BitStream!12468) (_2!12269 Bool)) )
))
(declare-fun lt!413665 () tuple2!22474)

(declare-fun readBitPure!0 (BitStream!12468) tuple2!22474)

(assert (=> b!275670 (= lt!413665 (readBitPure!0 (BitStream!12469 (buf!7295 bs2!19) (currentByte!13468 bs1!11) (currentBit!13463 bs1!11))))))

(declare-fun lt!413666 () tuple2!22474)

(assert (=> b!275670 (= lt!413666 (readBitPure!0 bs1!11))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!275670 (invariant!0 (currentBit!13463 bs1!11) (currentByte!13468 bs1!11) (size!6827 (buf!7295 bs2!19)))))

(declare-fun res!229115 () Bool)

(assert (=> start!61198 (=> (not res!229115) (not e!195639))))

(assert (=> start!61198 (= res!229115 (= (size!6827 (buf!7295 bs1!11)) (size!6827 (buf!7295 bs2!19))))))

(assert (=> start!61198 e!195639))

(declare-fun inv!12 (BitStream!12468) Bool)

(assert (=> start!61198 (and (inv!12 bs1!11) e!195637)))

(assert (=> start!61198 (and (inv!12 bs2!19) e!195640)))

(assert (= (and start!61198 res!229115) b!275669))

(assert (= (and b!275669 res!229117) b!275668))

(assert (= (and b!275668 res!229116) b!275670))

(assert (= start!61198 b!275666))

(assert (= start!61198 b!275667))

(declare-fun m!408375 () Bool)

(assert (=> b!275668 m!408375))

(declare-fun m!408377 () Bool)

(assert (=> b!275668 m!408377))

(declare-fun m!408379 () Bool)

(assert (=> b!275667 m!408379))

(declare-fun m!408381 () Bool)

(assert (=> b!275669 m!408381))

(declare-fun m!408383 () Bool)

(assert (=> b!275666 m!408383))

(declare-fun m!408385 () Bool)

(assert (=> start!61198 m!408385))

(declare-fun m!408387 () Bool)

(assert (=> start!61198 m!408387))

(declare-fun m!408389 () Bool)

(assert (=> b!275670 m!408389))

(declare-fun m!408391 () Bool)

(assert (=> b!275670 m!408391))

(declare-fun m!408393 () Bool)

(assert (=> b!275670 m!408393))

(check-sat (not b!275668) (not start!61198) (not b!275666) (not b!275667) (not b!275670) (not b!275669))
