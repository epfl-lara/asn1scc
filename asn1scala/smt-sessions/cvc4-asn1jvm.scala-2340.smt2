; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59724 () Bool)

(assert start!59724)

(declare-fun res!227071 () Bool)

(declare-fun e!192621 () Bool)

(assert (=> start!59724 (=> (not res!227071) (not e!192621))))

(declare-datatypes ((array!15240 0))(
  ( (array!15241 (arr!7614 (Array (_ BitVec 32) (_ BitVec 8))) (size!6627 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12068 0))(
  ( (BitStream!12069 (buf!7095 array!15240) (currentByte!13099 (_ BitVec 32)) (currentBit!13094 (_ BitVec 32))) )
))
(declare-fun bs!71 () BitStream!12068)

(assert (=> start!59724 (= res!227071 (not (= (size!6627 (buf!7095 bs!71)) #b00000000000000000000000000000000)))))

(assert (=> start!59724 e!192621))

(declare-fun e!192620 () Bool)

(declare-fun inv!12 (BitStream!12068) Bool)

(assert (=> start!59724 (and (inv!12 bs!71) e!192620)))

(declare-fun b!272740 () Bool)

(assert (=> b!272740 (= e!192621 (not true))))

(declare-fun lt!410572 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!272740 (= lt!410572 (bitIndex!0 (size!6627 (buf!7095 bs!71)) (currentByte!13099 bs!71) (currentBit!13094 bs!71)))))

(declare-fun arrayBitRangesEq!0 (array!15240 array!15240 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!272740 (arrayBitRangesEq!0 (buf!7095 bs!71) (buf!7095 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6627 (buf!7095 bs!71)))))))

(declare-datatypes ((Unit!19233 0))(
  ( (Unit!19234) )
))
(declare-fun lt!410573 () Unit!19233)

(declare-fun arrayBitEqImpliesRangesEqLemma!0 (array!15240) Unit!19233)

(assert (=> b!272740 (= lt!410573 (arrayBitEqImpliesRangesEqLemma!0 (buf!7095 bs!71)))))

(declare-fun b!272741 () Bool)

(declare-fun array_inv!6351 (array!15240) Bool)

(assert (=> b!272741 (= e!192620 (array_inv!6351 (buf!7095 bs!71)))))

(assert (= (and start!59724 res!227071) b!272740))

(assert (= start!59724 b!272741))

(declare-fun m!405623 () Bool)

(assert (=> start!59724 m!405623))

(declare-fun m!405625 () Bool)

(assert (=> b!272740 m!405625))

(declare-fun m!405627 () Bool)

(assert (=> b!272740 m!405627))

(declare-fun m!405629 () Bool)

(assert (=> b!272740 m!405629))

(declare-fun m!405631 () Bool)

(assert (=> b!272741 m!405631))

(push 1)

(assert (not start!59724))

(assert (not b!272740))

(assert (not b!272741))

