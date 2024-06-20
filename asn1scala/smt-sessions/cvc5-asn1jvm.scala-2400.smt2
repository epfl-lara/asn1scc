; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61154 () Bool)

(assert start!61154)

(declare-fun b!275336 () Bool)

(declare-fun res!228919 () Bool)

(declare-fun e!195307 () Bool)

(assert (=> b!275336 (=> (not res!228919) (not e!195307))))

(declare-datatypes ((array!15715 0))(
  ( (array!15716 (arr!7792 (Array (_ BitVec 32) (_ BitVec 8))) (size!6805 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12424 0))(
  ( (BitStream!12425 (buf!7273 array!15715) (currentByte!13446 (_ BitVec 32)) (currentBit!13441 (_ BitVec 32))) )
))
(declare-fun bs1!11 () BitStream!12424)

(declare-fun bs2!19 () BitStream!12424)

(declare-fun arrayBitRangesEq!0 (array!15715 array!15715 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!275336 (= res!228919 (arrayBitRangesEq!0 (buf!7273 bs1!11) (buf!7273 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!6805 (buf!7273 bs1!11)) (currentByte!13446 bs1!11) (currentBit!13441 bs1!11)))))))

(declare-fun b!275337 () Bool)

(declare-fun res!228918 () Bool)

(assert (=> b!275337 (=> (not res!228918) (not e!195307))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!275337 (= res!228918 (validate_offset_bit!0 ((_ sign_extend 32) (size!6805 (buf!7273 bs1!11))) ((_ sign_extend 32) (currentByte!13446 bs1!11)) ((_ sign_extend 32) (currentBit!13441 bs1!11))))))

(declare-fun res!228917 () Bool)

(assert (=> start!61154 (=> (not res!228917) (not e!195307))))

(assert (=> start!61154 (= res!228917 (= (size!6805 (buf!7273 bs1!11)) (size!6805 (buf!7273 bs2!19))))))

(assert (=> start!61154 e!195307))

(declare-fun e!195309 () Bool)

(declare-fun inv!12 (BitStream!12424) Bool)

(assert (=> start!61154 (and (inv!12 bs1!11) e!195309)))

(declare-fun e!195308 () Bool)

(assert (=> start!61154 (and (inv!12 bs2!19) e!195308)))

(declare-fun b!275338 () Bool)

(declare-fun array_inv!6529 (array!15715) Bool)

(assert (=> b!275338 (= e!195308 (array_inv!6529 (buf!7273 bs2!19)))))

(declare-fun b!275339 () Bool)

(assert (=> b!275339 (= e!195309 (array_inv!6529 (buf!7273 bs1!11)))))

(declare-fun b!275340 () Bool)

(assert (=> b!275340 (= e!195307 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!6805 (buf!7273 bs2!19))) ((_ sign_extend 32) (currentByte!13446 bs1!11)) ((_ sign_extend 32) (currentBit!13441 bs1!11)))))))

(declare-datatypes ((tuple2!22430 0))(
  ( (tuple2!22431 (_1!12247 BitStream!12424) (_2!12247 Bool)) )
))
(declare-fun lt!413540 () tuple2!22430)

(declare-fun readBitPure!0 (BitStream!12424) tuple2!22430)

(assert (=> b!275340 (= lt!413540 (readBitPure!0 bs1!11))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!275340 (invariant!0 (currentBit!13441 bs1!11) (currentByte!13446 bs1!11) (size!6805 (buf!7273 bs2!19)))))

(assert (= (and start!61154 res!228917) b!275337))

(assert (= (and b!275337 res!228918) b!275336))

(assert (= (and b!275336 res!228919) b!275340))

(assert (= start!61154 b!275339))

(assert (= start!61154 b!275338))

(declare-fun m!407923 () Bool)

(assert (=> b!275338 m!407923))

(declare-fun m!407925 () Bool)

(assert (=> start!61154 m!407925))

(declare-fun m!407927 () Bool)

(assert (=> start!61154 m!407927))

(declare-fun m!407929 () Bool)

(assert (=> b!275337 m!407929))

(declare-fun m!407931 () Bool)

(assert (=> b!275340 m!407931))

(declare-fun m!407933 () Bool)

(assert (=> b!275340 m!407933))

(declare-fun m!407935 () Bool)

(assert (=> b!275340 m!407935))

(declare-fun m!407937 () Bool)

(assert (=> b!275336 m!407937))

(declare-fun m!407939 () Bool)

(assert (=> b!275336 m!407939))

(declare-fun m!407941 () Bool)

(assert (=> b!275339 m!407941))

(push 1)

(assert (not b!275337))

(assert (not b!275339))

(assert (not b!275340))

(assert (not b!275338))

(assert (not start!61154))

(assert (not b!275336))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

