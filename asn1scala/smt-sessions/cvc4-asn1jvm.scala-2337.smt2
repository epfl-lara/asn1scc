; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59706 () Bool)

(assert start!59706)

(declare-fun res!227044 () Bool)

(declare-fun e!192539 () Bool)

(assert (=> start!59706 (=> (not res!227044) (not e!192539))))

(declare-datatypes ((array!15222 0))(
  ( (array!15223 (arr!7605 (Array (_ BitVec 32) (_ BitVec 8))) (size!6618 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12050 0))(
  ( (BitStream!12051 (buf!7086 array!15222) (currentByte!13090 (_ BitVec 32)) (currentBit!13085 (_ BitVec 32))) )
))
(declare-fun bs!71 () BitStream!12050)

(assert (=> start!59706 (= res!227044 (not (= (size!6618 (buf!7086 bs!71)) #b00000000000000000000000000000000)))))

(assert (=> start!59706 e!192539))

(declare-fun e!192541 () Bool)

(declare-fun inv!12 (BitStream!12050) Bool)

(assert (=> start!59706 (and (inv!12 bs!71) e!192541)))

(declare-fun b!272686 () Bool)

(assert (=> b!272686 (= e!192539 (not true))))

(declare-fun lt!410518 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!272686 (= lt!410518 (bitIndex!0 (size!6618 (buf!7086 bs!71)) (currentByte!13090 bs!71) (currentBit!13085 bs!71)))))

(declare-fun arrayBitRangesEq!0 (array!15222 array!15222 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!272686 (arrayBitRangesEq!0 (buf!7086 bs!71) (buf!7086 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6618 (buf!7086 bs!71)))))))

(declare-datatypes ((Unit!19215 0))(
  ( (Unit!19216) )
))
(declare-fun lt!410519 () Unit!19215)

(declare-fun arrayBitEqImpliesRangesEqLemma!0 (array!15222) Unit!19215)

(assert (=> b!272686 (= lt!410519 (arrayBitEqImpliesRangesEqLemma!0 (buf!7086 bs!71)))))

(declare-fun b!272687 () Bool)

(declare-fun array_inv!6342 (array!15222) Bool)

(assert (=> b!272687 (= e!192541 (array_inv!6342 (buf!7086 bs!71)))))

(assert (= (and start!59706 res!227044) b!272686))

(assert (= start!59706 b!272687))

(declare-fun m!405539 () Bool)

(assert (=> start!59706 m!405539))

(declare-fun m!405541 () Bool)

(assert (=> b!272686 m!405541))

(declare-fun m!405543 () Bool)

(assert (=> b!272686 m!405543))

(declare-fun m!405545 () Bool)

(assert (=> b!272686 m!405545))

(declare-fun m!405547 () Bool)

(assert (=> b!272687 m!405547))

(push 1)

(assert (not b!272687))

(assert (not start!59706))

(assert (not b!272686))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

