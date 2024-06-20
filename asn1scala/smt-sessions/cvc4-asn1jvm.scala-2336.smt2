; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59700 () Bool)

(assert start!59700)

(declare-fun res!227035 () Bool)

(declare-fun e!192514 () Bool)

(assert (=> start!59700 (=> (not res!227035) (not e!192514))))

(declare-datatypes ((array!15216 0))(
  ( (array!15217 (arr!7602 (Array (_ BitVec 32) (_ BitVec 8))) (size!6615 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12044 0))(
  ( (BitStream!12045 (buf!7083 array!15216) (currentByte!13087 (_ BitVec 32)) (currentBit!13082 (_ BitVec 32))) )
))
(declare-fun bs!71 () BitStream!12044)

(assert (=> start!59700 (= res!227035 (not (= (size!6615 (buf!7083 bs!71)) #b00000000000000000000000000000000)))))

(assert (=> start!59700 e!192514))

(declare-fun e!192513 () Bool)

(declare-fun inv!12 (BitStream!12044) Bool)

(assert (=> start!59700 (and (inv!12 bs!71) e!192513)))

(declare-fun b!272668 () Bool)

(assert (=> b!272668 (= e!192514 (not true))))

(declare-fun lt!410501 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!272668 (= lt!410501 (bitIndex!0 (size!6615 (buf!7083 bs!71)) (currentByte!13087 bs!71) (currentBit!13082 bs!71)))))

(declare-fun arrayBitRangesEq!0 (array!15216 array!15216 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!272668 (arrayBitRangesEq!0 (buf!7083 bs!71) (buf!7083 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6615 (buf!7083 bs!71)))))))

(declare-datatypes ((Unit!19209 0))(
  ( (Unit!19210) )
))
(declare-fun lt!410500 () Unit!19209)

(declare-fun arrayBitEqImpliesRangesEqLemma!0 (array!15216) Unit!19209)

(assert (=> b!272668 (= lt!410500 (arrayBitEqImpliesRangesEqLemma!0 (buf!7083 bs!71)))))

(declare-fun b!272669 () Bool)

(declare-fun array_inv!6339 (array!15216) Bool)

(assert (=> b!272669 (= e!192513 (array_inv!6339 (buf!7083 bs!71)))))

(assert (= (and start!59700 res!227035) b!272668))

(assert (= start!59700 b!272669))

(declare-fun m!405509 () Bool)

(assert (=> start!59700 m!405509))

(declare-fun m!405511 () Bool)

(assert (=> b!272668 m!405511))

(declare-fun m!405513 () Bool)

(assert (=> b!272668 m!405513))

(declare-fun m!405515 () Bool)

(assert (=> b!272668 m!405515))

(declare-fun m!405517 () Bool)

(assert (=> b!272669 m!405517))

(push 1)

(assert (not start!59700))

(assert (not b!272668))

(assert (not b!272669))

(check-sat)

(pop 1)

