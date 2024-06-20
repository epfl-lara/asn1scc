; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59710 () Bool)

(assert start!59710)

(declare-fun res!227050 () Bool)

(declare-fun e!192558 () Bool)

(assert (=> start!59710 (=> (not res!227050) (not e!192558))))

(declare-datatypes ((array!15226 0))(
  ( (array!15227 (arr!7607 (Array (_ BitVec 32) (_ BitVec 8))) (size!6620 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12054 0))(
  ( (BitStream!12055 (buf!7088 array!15226) (currentByte!13092 (_ BitVec 32)) (currentBit!13087 (_ BitVec 32))) )
))
(declare-fun bs!71 () BitStream!12054)

(assert (=> start!59710 (= res!227050 (not (= (size!6620 (buf!7088 bs!71)) #b00000000000000000000000000000000)))))

(assert (=> start!59710 e!192558))

(declare-fun e!192559 () Bool)

(declare-fun inv!12 (BitStream!12054) Bool)

(assert (=> start!59710 (and (inv!12 bs!71) e!192559)))

(declare-fun b!272698 () Bool)

(assert (=> b!272698 (= e!192558 (not true))))

(declare-fun lt!410531 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!272698 (= lt!410531 (bitIndex!0 (size!6620 (buf!7088 bs!71)) (currentByte!13092 bs!71) (currentBit!13087 bs!71)))))

(declare-fun arrayBitRangesEq!0 (array!15226 array!15226 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!272698 (arrayBitRangesEq!0 (buf!7088 bs!71) (buf!7088 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6620 (buf!7088 bs!71)))))))

(declare-datatypes ((Unit!19219 0))(
  ( (Unit!19220) )
))
(declare-fun lt!410530 () Unit!19219)

(declare-fun arrayBitEqImpliesRangesEqLemma!0 (array!15226) Unit!19219)

(assert (=> b!272698 (= lt!410530 (arrayBitEqImpliesRangesEqLemma!0 (buf!7088 bs!71)))))

(declare-fun b!272699 () Bool)

(declare-fun array_inv!6344 (array!15226) Bool)

(assert (=> b!272699 (= e!192559 (array_inv!6344 (buf!7088 bs!71)))))

(assert (= (and start!59710 res!227050) b!272698))

(assert (= start!59710 b!272699))

(declare-fun m!405559 () Bool)

(assert (=> start!59710 m!405559))

(declare-fun m!405561 () Bool)

(assert (=> b!272698 m!405561))

(declare-fun m!405563 () Bool)

(assert (=> b!272698 m!405563))

(declare-fun m!405565 () Bool)

(assert (=> b!272698 m!405565))

(declare-fun m!405567 () Bool)

(assert (=> b!272699 m!405567))

(check-sat (not b!272698) (not b!272699) (not start!59710))
