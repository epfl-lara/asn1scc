; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61526 () Bool)

(assert start!61526)

(declare-fun b!276452 () Bool)

(declare-fun e!196389 () Bool)

(assert (=> b!276452 (= e!196389 (not true))))

(declare-datatypes ((array!15818 0))(
  ( (array!15819 (arr!7842 (Array (_ BitVec 32) (_ BitVec 8))) (size!6849 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12512 0))(
  ( (BitStream!12513 (buf!7317 array!15818) (currentByte!13537 (_ BitVec 32)) (currentBit!13532 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!22540 0))(
  ( (tuple2!22541 (_1!12314 BitStream!12512) (_2!12314 Bool)) )
))
(declare-fun lt!414615 () tuple2!22540)

(declare-fun bs2!19 () BitStream!12512)

(declare-fun bs1!11 () BitStream!12512)

(declare-fun readBitPure!0 (BitStream!12512) tuple2!22540)

(assert (=> b!276452 (= lt!414615 (readBitPure!0 (BitStream!12513 (buf!7317 bs2!19) (currentByte!13537 bs1!11) (currentBit!13532 bs1!11))))))

(declare-fun lt!414614 () tuple2!22540)

(assert (=> b!276452 (= lt!414614 (readBitPure!0 bs1!11))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!276452 (invariant!0 (currentBit!13532 bs1!11) (currentByte!13537 bs1!11) (size!6849 (buf!7317 bs2!19)))))

(declare-fun b!276453 () Bool)

(declare-fun res!229699 () Bool)

(assert (=> b!276453 (=> (not res!229699) (not e!196389))))

(declare-fun arrayBitRangesEq!0 (array!15818 array!15818 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!276453 (= res!229699 (arrayBitRangesEq!0 (buf!7317 bs1!11) (buf!7317 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!6849 (buf!7317 bs1!11)) (currentByte!13537 bs1!11) (currentBit!13532 bs1!11)))))))

(declare-fun b!276454 () Bool)

(declare-fun e!196391 () Bool)

(declare-fun array_inv!6573 (array!15818) Bool)

(assert (=> b!276454 (= e!196391 (array_inv!6573 (buf!7317 bs1!11)))))

(declare-fun res!229697 () Bool)

(assert (=> start!61526 (=> (not res!229697) (not e!196389))))

(assert (=> start!61526 (= res!229697 (= (size!6849 (buf!7317 bs1!11)) (size!6849 (buf!7317 bs2!19))))))

(assert (=> start!61526 e!196389))

(declare-fun inv!12 (BitStream!12512) Bool)

(assert (=> start!61526 (and (inv!12 bs1!11) e!196391)))

(declare-fun e!196390 () Bool)

(assert (=> start!61526 (and (inv!12 bs2!19) e!196390)))

(declare-fun b!276455 () Bool)

(declare-fun res!229698 () Bool)

(assert (=> b!276455 (=> (not res!229698) (not e!196389))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!276455 (= res!229698 (validate_offset_bit!0 ((_ sign_extend 32) (size!6849 (buf!7317 bs1!11))) ((_ sign_extend 32) (currentByte!13537 bs1!11)) ((_ sign_extend 32) (currentBit!13532 bs1!11))))))

(declare-fun b!276456 () Bool)

(assert (=> b!276456 (= e!196390 (array_inv!6573 (buf!7317 bs2!19)))))

(assert (= (and start!61526 res!229697) b!276455))

(assert (= (and b!276455 res!229698) b!276453))

(assert (= (and b!276453 res!229699) b!276452))

(assert (= start!61526 b!276454))

(assert (= start!61526 b!276456))

(declare-fun m!409467 () Bool)

(assert (=> b!276455 m!409467))

(declare-fun m!409469 () Bool)

(assert (=> b!276452 m!409469))

(declare-fun m!409471 () Bool)

(assert (=> b!276452 m!409471))

(declare-fun m!409473 () Bool)

(assert (=> b!276452 m!409473))

(declare-fun m!409475 () Bool)

(assert (=> b!276454 m!409475))

(declare-fun m!409477 () Bool)

(assert (=> b!276456 m!409477))

(declare-fun m!409479 () Bool)

(assert (=> start!61526 m!409479))

(declare-fun m!409481 () Bool)

(assert (=> start!61526 m!409481))

(declare-fun m!409483 () Bool)

(assert (=> b!276453 m!409483))

(declare-fun m!409485 () Bool)

(assert (=> b!276453 m!409485))

(push 1)

(assert (not b!276453))

(assert (not start!61526))

(assert (not b!276455))

(assert (not b!276452))

(assert (not b!276454))

(assert (not b!276456))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

