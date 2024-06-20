; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59684 () Bool)

(assert start!59684)

(declare-fun res!227011 () Bool)

(declare-fun e!192440 () Bool)

(assert (=> start!59684 (=> (not res!227011) (not e!192440))))

(declare-datatypes ((array!15200 0))(
  ( (array!15201 (arr!7594 (Array (_ BitVec 32) (_ BitVec 8))) (size!6607 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12028 0))(
  ( (BitStream!12029 (buf!7075 array!15200) (currentByte!13079 (_ BitVec 32)) (currentBit!13074 (_ BitVec 32))) )
))
(declare-fun bs!71 () BitStream!12028)

(assert (=> start!59684 (= res!227011 (not (= (size!6607 (buf!7075 bs!71)) #b00000000000000000000000000000000)))))

(assert (=> start!59684 e!192440))

(declare-fun e!192441 () Bool)

(declare-fun inv!12 (BitStream!12028) Bool)

(assert (=> start!59684 (and (inv!12 bs!71) e!192441)))

(declare-fun b!272620 () Bool)

(assert (=> b!272620 (= e!192440 (not true))))

(declare-fun lt!410453 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!272620 (= lt!410453 (bitIndex!0 (size!6607 (buf!7075 bs!71)) (currentByte!13079 bs!71) (currentBit!13074 bs!71)))))

(declare-fun arrayBitRangesEq!0 (array!15200 array!15200 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!272620 (arrayBitRangesEq!0 (buf!7075 bs!71) (buf!7075 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6607 (buf!7075 bs!71)))))))

(declare-datatypes ((Unit!19193 0))(
  ( (Unit!19194) )
))
(declare-fun lt!410452 () Unit!19193)

(declare-fun arrayBitEqImpliesRangesEqLemma!0 (array!15200) Unit!19193)

(assert (=> b!272620 (= lt!410452 (arrayBitEqImpliesRangesEqLemma!0 (buf!7075 bs!71)))))

(declare-fun b!272621 () Bool)

(declare-fun array_inv!6331 (array!15200) Bool)

(assert (=> b!272621 (= e!192441 (array_inv!6331 (buf!7075 bs!71)))))

(assert (= (and start!59684 res!227011) b!272620))

(assert (= start!59684 b!272621))

(declare-fun m!405429 () Bool)

(assert (=> start!59684 m!405429))

(declare-fun m!405431 () Bool)

(assert (=> b!272620 m!405431))

(declare-fun m!405433 () Bool)

(assert (=> b!272620 m!405433))

(declare-fun m!405435 () Bool)

(assert (=> b!272620 m!405435))

(declare-fun m!405437 () Bool)

(assert (=> b!272621 m!405437))

(push 1)

(assert (not b!272620))

(assert (not b!272621))

(assert (not start!59684))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

