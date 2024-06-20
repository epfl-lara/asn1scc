; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59692 () Bool)

(assert start!59692)

(declare-fun res!227023 () Bool)

(declare-fun e!192476 () Bool)

(assert (=> start!59692 (=> (not res!227023) (not e!192476))))

(declare-datatypes ((array!15208 0))(
  ( (array!15209 (arr!7598 (Array (_ BitVec 32) (_ BitVec 8))) (size!6611 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12036 0))(
  ( (BitStream!12037 (buf!7079 array!15208) (currentByte!13083 (_ BitVec 32)) (currentBit!13078 (_ BitVec 32))) )
))
(declare-fun bs!71 () BitStream!12036)

(assert (=> start!59692 (= res!227023 (not (= (size!6611 (buf!7079 bs!71)) #b00000000000000000000000000000000)))))

(assert (=> start!59692 e!192476))

(declare-fun e!192477 () Bool)

(declare-fun inv!12 (BitStream!12036) Bool)

(assert (=> start!59692 (and (inv!12 bs!71) e!192477)))

(declare-fun b!272644 () Bool)

(assert (=> b!272644 (= e!192476 (not true))))

(declare-fun lt!410476 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!272644 (= lt!410476 (bitIndex!0 (size!6611 (buf!7079 bs!71)) (currentByte!13083 bs!71) (currentBit!13078 bs!71)))))

(declare-fun arrayBitRangesEq!0 (array!15208 array!15208 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!272644 (arrayBitRangesEq!0 (buf!7079 bs!71) (buf!7079 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6611 (buf!7079 bs!71)))))))

(declare-datatypes ((Unit!19201 0))(
  ( (Unit!19202) )
))
(declare-fun lt!410477 () Unit!19201)

(declare-fun arrayBitEqImpliesRangesEqLemma!0 (array!15208) Unit!19201)

(assert (=> b!272644 (= lt!410477 (arrayBitEqImpliesRangesEqLemma!0 (buf!7079 bs!71)))))

(declare-fun b!272645 () Bool)

(declare-fun array_inv!6335 (array!15208) Bool)

(assert (=> b!272645 (= e!192477 (array_inv!6335 (buf!7079 bs!71)))))

(assert (= (and start!59692 res!227023) b!272644))

(assert (= start!59692 b!272645))

(declare-fun m!405469 () Bool)

(assert (=> start!59692 m!405469))

(declare-fun m!405471 () Bool)

(assert (=> b!272644 m!405471))

(declare-fun m!405473 () Bool)

(assert (=> b!272644 m!405473))

(declare-fun m!405475 () Bool)

(assert (=> b!272644 m!405475))

(declare-fun m!405477 () Bool)

(assert (=> b!272645 m!405477))

(check-sat (not start!59692) (not b!272644) (not b!272645))
