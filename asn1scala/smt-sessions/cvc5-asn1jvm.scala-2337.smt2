; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59702 () Bool)

(assert start!59702)

(declare-fun res!227038 () Bool)

(declare-fun e!192522 () Bool)

(assert (=> start!59702 (=> (not res!227038) (not e!192522))))

(declare-datatypes ((array!15218 0))(
  ( (array!15219 (arr!7603 (Array (_ BitVec 32) (_ BitVec 8))) (size!6616 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12046 0))(
  ( (BitStream!12047 (buf!7084 array!15218) (currentByte!13088 (_ BitVec 32)) (currentBit!13083 (_ BitVec 32))) )
))
(declare-fun bs!71 () BitStream!12046)

(assert (=> start!59702 (= res!227038 (not (= (size!6616 (buf!7084 bs!71)) #b00000000000000000000000000000000)))))

(assert (=> start!59702 e!192522))

(declare-fun e!192523 () Bool)

(declare-fun inv!12 (BitStream!12046) Bool)

(assert (=> start!59702 (and (inv!12 bs!71) e!192523)))

(declare-fun b!272674 () Bool)

(assert (=> b!272674 (= e!192522 (not true))))

(declare-fun lt!410506 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!272674 (= lt!410506 (bitIndex!0 (size!6616 (buf!7084 bs!71)) (currentByte!13088 bs!71) (currentBit!13083 bs!71)))))

(declare-fun arrayBitRangesEq!0 (array!15218 array!15218 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!272674 (arrayBitRangesEq!0 (buf!7084 bs!71) (buf!7084 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6616 (buf!7084 bs!71)))))))

(declare-datatypes ((Unit!19211 0))(
  ( (Unit!19212) )
))
(declare-fun lt!410507 () Unit!19211)

(declare-fun arrayBitEqImpliesRangesEqLemma!0 (array!15218) Unit!19211)

(assert (=> b!272674 (= lt!410507 (arrayBitEqImpliesRangesEqLemma!0 (buf!7084 bs!71)))))

(declare-fun b!272675 () Bool)

(declare-fun array_inv!6340 (array!15218) Bool)

(assert (=> b!272675 (= e!192523 (array_inv!6340 (buf!7084 bs!71)))))

(assert (= (and start!59702 res!227038) b!272674))

(assert (= start!59702 b!272675))

(declare-fun m!405519 () Bool)

(assert (=> start!59702 m!405519))

(declare-fun m!405521 () Bool)

(assert (=> b!272674 m!405521))

(declare-fun m!405523 () Bool)

(assert (=> b!272674 m!405523))

(declare-fun m!405525 () Bool)

(assert (=> b!272674 m!405525))

(declare-fun m!405527 () Bool)

(assert (=> b!272675 m!405527))

(push 1)

(assert (not b!272675))

(assert (not start!59702))

(assert (not b!272674))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

