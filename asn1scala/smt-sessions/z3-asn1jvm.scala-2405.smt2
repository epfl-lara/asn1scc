; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61186 () Bool)

(assert start!61186)

(declare-fun b!275576 () Bool)

(declare-fun e!195546 () Bool)

(declare-datatypes ((array!15747 0))(
  ( (array!15748 (arr!7808 (Array (_ BitVec 32) (_ BitVec 8))) (size!6821 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12456 0))(
  ( (BitStream!12457 (buf!7289 array!15747) (currentByte!13462 (_ BitVec 32)) (currentBit!13457 (_ BitVec 32))) )
))
(declare-fun bs1!11 () BitStream!12456)

(declare-fun array_inv!6545 (array!15747) Bool)

(assert (=> b!275576 (= e!195546 (array_inv!6545 (buf!7289 bs1!11)))))

(declare-fun b!275577 () Bool)

(declare-fun res!229063 () Bool)

(declare-fun e!195550 () Bool)

(assert (=> b!275577 (=> (not res!229063) (not e!195550))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!275577 (= res!229063 (validate_offset_bit!0 ((_ sign_extend 32) (size!6821 (buf!7289 bs1!11))) ((_ sign_extend 32) (currentByte!13462 bs1!11)) ((_ sign_extend 32) (currentBit!13457 bs1!11))))))

(declare-fun res!229061 () Bool)

(assert (=> start!61186 (=> (not res!229061) (not e!195550))))

(declare-fun bs2!19 () BitStream!12456)

(assert (=> start!61186 (= res!229061 (= (size!6821 (buf!7289 bs1!11)) (size!6821 (buf!7289 bs2!19))))))

(assert (=> start!61186 e!195550))

(declare-fun inv!12 (BitStream!12456) Bool)

(assert (=> start!61186 (and (inv!12 bs1!11) e!195546)))

(declare-fun e!195547 () Bool)

(assert (=> start!61186 (and (inv!12 bs2!19) e!195547)))

(declare-fun b!275578 () Bool)

(assert (=> b!275578 (= e!195550 (not true))))

(declare-datatypes ((tuple2!22462 0))(
  ( (tuple2!22463 (_1!12263 BitStream!12456) (_2!12263 Bool)) )
))
(declare-fun lt!413629 () tuple2!22462)

(declare-fun readBitPure!0 (BitStream!12456) tuple2!22462)

(assert (=> b!275578 (= lt!413629 (readBitPure!0 (BitStream!12457 (buf!7289 bs2!19) (currentByte!13462 bs1!11) (currentBit!13457 bs1!11))))))

(declare-fun lt!413630 () tuple2!22462)

(assert (=> b!275578 (= lt!413630 (readBitPure!0 bs1!11))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!275578 (invariant!0 (currentBit!13457 bs1!11) (currentByte!13462 bs1!11) (size!6821 (buf!7289 bs2!19)))))

(declare-fun b!275579 () Bool)

(assert (=> b!275579 (= e!195547 (array_inv!6545 (buf!7289 bs2!19)))))

(declare-fun b!275580 () Bool)

(declare-fun res!229062 () Bool)

(assert (=> b!275580 (=> (not res!229062) (not e!195550))))

(declare-fun arrayBitRangesEq!0 (array!15747 array!15747 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!275580 (= res!229062 (arrayBitRangesEq!0 (buf!7289 bs1!11) (buf!7289 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!6821 (buf!7289 bs1!11)) (currentByte!13462 bs1!11) (currentBit!13457 bs1!11)))))))

(assert (= (and start!61186 res!229061) b!275577))

(assert (= (and b!275577 res!229063) b!275580))

(assert (= (and b!275580 res!229062) b!275578))

(assert (= start!61186 b!275576))

(assert (= start!61186 b!275579))

(declare-fun m!408255 () Bool)

(assert (=> b!275576 m!408255))

(declare-fun m!408257 () Bool)

(assert (=> b!275579 m!408257))

(declare-fun m!408259 () Bool)

(assert (=> b!275578 m!408259))

(declare-fun m!408261 () Bool)

(assert (=> b!275578 m!408261))

(declare-fun m!408263 () Bool)

(assert (=> b!275578 m!408263))

(declare-fun m!408265 () Bool)

(assert (=> b!275577 m!408265))

(declare-fun m!408267 () Bool)

(assert (=> b!275580 m!408267))

(declare-fun m!408269 () Bool)

(assert (=> b!275580 m!408269))

(declare-fun m!408271 () Bool)

(assert (=> start!61186 m!408271))

(declare-fun m!408273 () Bool)

(assert (=> start!61186 m!408273))

(check-sat (not b!275579) (not start!61186) (not b!275578) (not b!275580) (not b!275577) (not b!275576))
