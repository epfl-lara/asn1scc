; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61524 () Bool)

(assert start!61524)

(declare-fun b!276437 () Bool)

(declare-fun e!196375 () Bool)

(declare-datatypes ((array!15816 0))(
  ( (array!15817 (arr!7841 (Array (_ BitVec 32) (_ BitVec 8))) (size!6848 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12510 0))(
  ( (BitStream!12511 (buf!7316 array!15816) (currentByte!13536 (_ BitVec 32)) (currentBit!13531 (_ BitVec 32))) )
))
(declare-fun bs2!19 () BitStream!12510)

(declare-fun array_inv!6572 (array!15816) Bool)

(assert (=> b!276437 (= e!196375 (array_inv!6572 (buf!7316 bs2!19)))))

(declare-fun b!276438 () Bool)

(declare-fun e!196374 () Bool)

(declare-fun bs1!11 () BitStream!12510)

(assert (=> b!276438 (= e!196374 (array_inv!6572 (buf!7316 bs1!11)))))

(declare-fun b!276439 () Bool)

(declare-fun res!229688 () Bool)

(declare-fun e!196373 () Bool)

(assert (=> b!276439 (=> (not res!229688) (not e!196373))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!276439 (= res!229688 (validate_offset_bit!0 ((_ sign_extend 32) (size!6848 (buf!7316 bs1!11))) ((_ sign_extend 32) (currentByte!13536 bs1!11)) ((_ sign_extend 32) (currentBit!13531 bs1!11))))))

(declare-fun b!276440 () Bool)

(declare-fun res!229689 () Bool)

(assert (=> b!276440 (=> (not res!229689) (not e!196373))))

(declare-fun arrayBitRangesEq!0 (array!15816 array!15816 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!276440 (= res!229689 (arrayBitRangesEq!0 (buf!7316 bs1!11) (buf!7316 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!6848 (buf!7316 bs1!11)) (currentByte!13536 bs1!11) (currentBit!13531 bs1!11)))))))

(declare-fun b!276441 () Bool)

(assert (=> b!276441 (= e!196373 (not true))))

(declare-datatypes ((tuple2!22538 0))(
  ( (tuple2!22539 (_1!12313 BitStream!12510) (_2!12313 Bool)) )
))
(declare-fun lt!414609 () tuple2!22538)

(declare-fun readBitPure!0 (BitStream!12510) tuple2!22538)

(assert (=> b!276441 (= lt!414609 (readBitPure!0 (BitStream!12511 (buf!7316 bs2!19) (currentByte!13536 bs1!11) (currentBit!13531 bs1!11))))))

(declare-fun lt!414608 () tuple2!22538)

(assert (=> b!276441 (= lt!414608 (readBitPure!0 bs1!11))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!276441 (invariant!0 (currentBit!13531 bs1!11) (currentByte!13536 bs1!11) (size!6848 (buf!7316 bs2!19)))))

(declare-fun res!229690 () Bool)

(assert (=> start!61524 (=> (not res!229690) (not e!196373))))

(assert (=> start!61524 (= res!229690 (= (size!6848 (buf!7316 bs1!11)) (size!6848 (buf!7316 bs2!19))))))

(assert (=> start!61524 e!196373))

(declare-fun inv!12 (BitStream!12510) Bool)

(assert (=> start!61524 (and (inv!12 bs1!11) e!196374)))

(assert (=> start!61524 (and (inv!12 bs2!19) e!196375)))

(assert (= (and start!61524 res!229690) b!276439))

(assert (= (and b!276439 res!229688) b!276440))

(assert (= (and b!276440 res!229689) b!276441))

(assert (= start!61524 b!276438))

(assert (= start!61524 b!276437))

(declare-fun m!409447 () Bool)

(assert (=> start!61524 m!409447))

(declare-fun m!409449 () Bool)

(assert (=> start!61524 m!409449))

(declare-fun m!409451 () Bool)

(assert (=> b!276441 m!409451))

(declare-fun m!409453 () Bool)

(assert (=> b!276441 m!409453))

(declare-fun m!409455 () Bool)

(assert (=> b!276441 m!409455))

(declare-fun m!409457 () Bool)

(assert (=> b!276437 m!409457))

(declare-fun m!409459 () Bool)

(assert (=> b!276438 m!409459))

(declare-fun m!409461 () Bool)

(assert (=> b!276440 m!409461))

(declare-fun m!409463 () Bool)

(assert (=> b!276440 m!409463))

(declare-fun m!409465 () Bool)

(assert (=> b!276439 m!409465))

(check-sat (not b!276438) (not start!61524) (not b!276440) (not b!276437) (not b!276441) (not b!276439))
