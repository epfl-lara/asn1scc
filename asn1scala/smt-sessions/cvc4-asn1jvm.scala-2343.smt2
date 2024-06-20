; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59772 () Bool)

(assert start!59772)

(declare-fun res!227170 () Bool)

(declare-fun e!192773 () Bool)

(assert (=> start!59772 (=> (not res!227170) (not e!192773))))

(declare-datatypes ((array!15261 0))(
  ( (array!15262 (arr!7623 (Array (_ BitVec 32) (_ BitVec 8))) (size!6636 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12086 0))(
  ( (BitStream!12087 (buf!7104 array!15261) (currentByte!13111 (_ BitVec 32)) (currentBit!13106 (_ BitVec 32))) )
))
(declare-fun bs!71 () BitStream!12086)

(assert (=> start!59772 (= res!227170 (not (= (size!6636 (buf!7104 bs!71)) #b00000000000000000000000000000000)))))

(assert (=> start!59772 e!192773))

(declare-fun e!192775 () Bool)

(declare-fun inv!12 (BitStream!12086) Bool)

(assert (=> start!59772 (and (inv!12 bs!71) e!192775)))

(declare-fun b!272884 () Bool)

(assert (=> b!272884 (= e!192773 (not true))))

(declare-fun lt!410744 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!272884 (= lt!410744 (bitIndex!0 (size!6636 (buf!7104 bs!71)) (currentByte!13111 bs!71) (currentBit!13106 bs!71)))))

(declare-fun arrayBitRangesEq!0 (array!15261 array!15261 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!272884 (arrayBitRangesEq!0 (buf!7104 bs!71) (buf!7104 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6636 (buf!7104 bs!71)))))))

(declare-datatypes ((Unit!19251 0))(
  ( (Unit!19252) )
))
(declare-fun lt!410743 () Unit!19251)

(declare-fun arrayBitEqImpliesRangesEqLemma!0 (array!15261) Unit!19251)

(assert (=> b!272884 (= lt!410743 (arrayBitEqImpliesRangesEqLemma!0 (buf!7104 bs!71)))))

(declare-fun b!272885 () Bool)

(declare-fun array_inv!6360 (array!15261) Bool)

(assert (=> b!272885 (= e!192775 (array_inv!6360 (buf!7104 bs!71)))))

(assert (= (and start!59772 res!227170) b!272884))

(assert (= start!59772 b!272885))

(declare-fun m!405773 () Bool)

(assert (=> start!59772 m!405773))

(declare-fun m!405775 () Bool)

(assert (=> b!272884 m!405775))

(declare-fun m!405777 () Bool)

(assert (=> b!272884 m!405777))

(declare-fun m!405779 () Bool)

(assert (=> b!272884 m!405779))

(declare-fun m!405781 () Bool)

(assert (=> b!272885 m!405781))

(push 1)

(assert (not b!272884))

