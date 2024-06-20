; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59688 () Bool)

(assert start!59688)

(declare-fun res!227017 () Bool)

(declare-fun e!192459 () Bool)

(assert (=> start!59688 (=> (not res!227017) (not e!192459))))

(declare-datatypes ((array!15204 0))(
  ( (array!15205 (arr!7596 (Array (_ BitVec 32) (_ BitVec 8))) (size!6609 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12032 0))(
  ( (BitStream!12033 (buf!7077 array!15204) (currentByte!13081 (_ BitVec 32)) (currentBit!13076 (_ BitVec 32))) )
))
(declare-fun bs!71 () BitStream!12032)

(assert (=> start!59688 (= res!227017 (not (= (size!6609 (buf!7077 bs!71)) #b00000000000000000000000000000000)))))

(assert (=> start!59688 e!192459))

(declare-fun e!192460 () Bool)

(declare-fun inv!12 (BitStream!12032) Bool)

(assert (=> start!59688 (and (inv!12 bs!71) e!192460)))

(declare-fun b!272632 () Bool)

(assert (=> b!272632 (= e!192459 (not true))))

(declare-fun lt!410464 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!272632 (= lt!410464 (bitIndex!0 (size!6609 (buf!7077 bs!71)) (currentByte!13081 bs!71) (currentBit!13076 bs!71)))))

(declare-fun arrayBitRangesEq!0 (array!15204 array!15204 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!272632 (arrayBitRangesEq!0 (buf!7077 bs!71) (buf!7077 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6609 (buf!7077 bs!71)))))))

(declare-datatypes ((Unit!19197 0))(
  ( (Unit!19198) )
))
(declare-fun lt!410465 () Unit!19197)

(declare-fun arrayBitEqImpliesRangesEqLemma!0 (array!15204) Unit!19197)

(assert (=> b!272632 (= lt!410465 (arrayBitEqImpliesRangesEqLemma!0 (buf!7077 bs!71)))))

(declare-fun b!272633 () Bool)

(declare-fun array_inv!6333 (array!15204) Bool)

(assert (=> b!272633 (= e!192460 (array_inv!6333 (buf!7077 bs!71)))))

(assert (= (and start!59688 res!227017) b!272632))

(assert (= start!59688 b!272633))

(declare-fun m!405449 () Bool)

(assert (=> start!59688 m!405449))

(declare-fun m!405451 () Bool)

(assert (=> b!272632 m!405451))

(declare-fun m!405453 () Bool)

(assert (=> b!272632 m!405453))

(declare-fun m!405455 () Bool)

(assert (=> b!272632 m!405455))

(declare-fun m!405457 () Bool)

(assert (=> b!272633 m!405457))

(push 1)

(assert (not b!272632))

