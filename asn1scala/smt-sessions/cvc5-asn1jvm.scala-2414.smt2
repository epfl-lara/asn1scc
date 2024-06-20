; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61522 () Bool)

(assert start!61522)

(declare-fun b!276422 () Bool)

(declare-fun res!229680 () Bool)

(declare-fun e!196358 () Bool)

(assert (=> b!276422 (=> (not res!229680) (not e!196358))))

(declare-datatypes ((array!15814 0))(
  ( (array!15815 (arr!7840 (Array (_ BitVec 32) (_ BitVec 8))) (size!6847 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12508 0))(
  ( (BitStream!12509 (buf!7315 array!15814) (currentByte!13535 (_ BitVec 32)) (currentBit!13530 (_ BitVec 32))) )
))
(declare-fun bs1!11 () BitStream!12508)

(declare-fun bs2!19 () BitStream!12508)

(declare-fun arrayBitRangesEq!0 (array!15814 array!15814 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!276422 (= res!229680 (arrayBitRangesEq!0 (buf!7315 bs1!11) (buf!7315 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!6847 (buf!7315 bs1!11)) (currentByte!13535 bs1!11) (currentBit!13530 bs1!11)))))))

(declare-fun b!276423 () Bool)

(declare-fun e!196357 () Bool)

(declare-fun array_inv!6571 (array!15814) Bool)

(assert (=> b!276423 (= e!196357 (array_inv!6571 (buf!7315 bs2!19)))))

(declare-fun b!276424 () Bool)

(declare-fun res!229681 () Bool)

(assert (=> b!276424 (=> (not res!229681) (not e!196358))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!276424 (= res!229681 (validate_offset_bit!0 ((_ sign_extend 32) (size!6847 (buf!7315 bs1!11))) ((_ sign_extend 32) (currentByte!13535 bs1!11)) ((_ sign_extend 32) (currentBit!13530 bs1!11))))))

(declare-fun res!229679 () Bool)

(assert (=> start!61522 (=> (not res!229679) (not e!196358))))

(assert (=> start!61522 (= res!229679 (= (size!6847 (buf!7315 bs1!11)) (size!6847 (buf!7315 bs2!19))))))

(assert (=> start!61522 e!196358))

(declare-fun e!196359 () Bool)

(declare-fun inv!12 (BitStream!12508) Bool)

(assert (=> start!61522 (and (inv!12 bs1!11) e!196359)))

(assert (=> start!61522 (and (inv!12 bs2!19) e!196357)))

(declare-fun b!276425 () Bool)

(assert (=> b!276425 (= e!196358 (not true))))

(declare-datatypes ((tuple2!22536 0))(
  ( (tuple2!22537 (_1!12312 BitStream!12508) (_2!12312 Bool)) )
))
(declare-fun lt!414603 () tuple2!22536)

(declare-fun readBitPure!0 (BitStream!12508) tuple2!22536)

(assert (=> b!276425 (= lt!414603 (readBitPure!0 (BitStream!12509 (buf!7315 bs2!19) (currentByte!13535 bs1!11) (currentBit!13530 bs1!11))))))

(declare-fun lt!414602 () tuple2!22536)

(assert (=> b!276425 (= lt!414602 (readBitPure!0 bs1!11))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!276425 (invariant!0 (currentBit!13530 bs1!11) (currentByte!13535 bs1!11) (size!6847 (buf!7315 bs2!19)))))

(declare-fun b!276426 () Bool)

(assert (=> b!276426 (= e!196359 (array_inv!6571 (buf!7315 bs1!11)))))

(assert (= (and start!61522 res!229679) b!276424))

(assert (= (and b!276424 res!229681) b!276422))

(assert (= (and b!276422 res!229680) b!276425))

(assert (= start!61522 b!276426))

(assert (= start!61522 b!276423))

(declare-fun m!409427 () Bool)

(assert (=> b!276426 m!409427))

(declare-fun m!409429 () Bool)

(assert (=> b!276425 m!409429))

(declare-fun m!409431 () Bool)

(assert (=> b!276425 m!409431))

(declare-fun m!409433 () Bool)

(assert (=> b!276425 m!409433))

(declare-fun m!409435 () Bool)

(assert (=> b!276424 m!409435))

(declare-fun m!409437 () Bool)

(assert (=> start!61522 m!409437))

(declare-fun m!409439 () Bool)

(assert (=> start!61522 m!409439))

(declare-fun m!409441 () Bool)

(assert (=> b!276423 m!409441))

(declare-fun m!409443 () Bool)

(assert (=> b!276422 m!409443))

(declare-fun m!409445 () Bool)

(assert (=> b!276422 m!409445))

(push 1)

(assert (not b!276423))

(assert (not b!276422))

(assert (not b!276426))

(assert (not b!276424))

(assert (not b!276425))

(assert (not start!61522))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

