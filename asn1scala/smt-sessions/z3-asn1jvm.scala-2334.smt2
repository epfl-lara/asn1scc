; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59686 () Bool)

(assert start!59686)

(declare-fun res!227014 () Bool)

(declare-fun e!192450 () Bool)

(assert (=> start!59686 (=> (not res!227014) (not e!192450))))

(declare-datatypes ((array!15202 0))(
  ( (array!15203 (arr!7595 (Array (_ BitVec 32) (_ BitVec 8))) (size!6608 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12030 0))(
  ( (BitStream!12031 (buf!7076 array!15202) (currentByte!13080 (_ BitVec 32)) (currentBit!13075 (_ BitVec 32))) )
))
(declare-fun bs!71 () BitStream!12030)

(assert (=> start!59686 (= res!227014 (not (= (size!6608 (buf!7076 bs!71)) #b00000000000000000000000000000000)))))

(assert (=> start!59686 e!192450))

(declare-fun e!192451 () Bool)

(declare-fun inv!12 (BitStream!12030) Bool)

(assert (=> start!59686 (and (inv!12 bs!71) e!192451)))

(declare-fun b!272626 () Bool)

(assert (=> b!272626 (= e!192450 (not true))))

(declare-fun lt!410458 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!272626 (= lt!410458 (bitIndex!0 (size!6608 (buf!7076 bs!71)) (currentByte!13080 bs!71) (currentBit!13075 bs!71)))))

(declare-fun arrayBitRangesEq!0 (array!15202 array!15202 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!272626 (arrayBitRangesEq!0 (buf!7076 bs!71) (buf!7076 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6608 (buf!7076 bs!71)))))))

(declare-datatypes ((Unit!19195 0))(
  ( (Unit!19196) )
))
(declare-fun lt!410459 () Unit!19195)

(declare-fun arrayBitEqImpliesRangesEqLemma!0 (array!15202) Unit!19195)

(assert (=> b!272626 (= lt!410459 (arrayBitEqImpliesRangesEqLemma!0 (buf!7076 bs!71)))))

(declare-fun b!272627 () Bool)

(declare-fun array_inv!6332 (array!15202) Bool)

(assert (=> b!272627 (= e!192451 (array_inv!6332 (buf!7076 bs!71)))))

(assert (= (and start!59686 res!227014) b!272626))

(assert (= start!59686 b!272627))

(declare-fun m!405439 () Bool)

(assert (=> start!59686 m!405439))

(declare-fun m!405441 () Bool)

(assert (=> b!272626 m!405441))

(declare-fun m!405443 () Bool)

(assert (=> b!272626 m!405443))

(declare-fun m!405445 () Bool)

(assert (=> b!272626 m!405445))

(declare-fun m!405447 () Bool)

(assert (=> b!272627 m!405447))

(check-sat (not b!272626) (not b!272627) (not start!59686))
