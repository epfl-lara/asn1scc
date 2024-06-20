; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59698 () Bool)

(assert start!59698)

(declare-fun res!227032 () Bool)

(declare-fun e!192504 () Bool)

(assert (=> start!59698 (=> (not res!227032) (not e!192504))))

(declare-datatypes ((array!15214 0))(
  ( (array!15215 (arr!7601 (Array (_ BitVec 32) (_ BitVec 8))) (size!6614 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12042 0))(
  ( (BitStream!12043 (buf!7082 array!15214) (currentByte!13086 (_ BitVec 32)) (currentBit!13081 (_ BitVec 32))) )
))
(declare-fun bs!71 () BitStream!12042)

(assert (=> start!59698 (= res!227032 (not (= (size!6614 (buf!7082 bs!71)) #b00000000000000000000000000000000)))))

(assert (=> start!59698 e!192504))

(declare-fun e!192503 () Bool)

(declare-fun inv!12 (BitStream!12042) Bool)

(assert (=> start!59698 (and (inv!12 bs!71) e!192503)))

(declare-fun b!272662 () Bool)

(assert (=> b!272662 (= e!192504 (not true))))

(declare-fun lt!410495 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!272662 (= lt!410495 (bitIndex!0 (size!6614 (buf!7082 bs!71)) (currentByte!13086 bs!71) (currentBit!13081 bs!71)))))

(declare-fun arrayBitRangesEq!0 (array!15214 array!15214 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!272662 (arrayBitRangesEq!0 (buf!7082 bs!71) (buf!7082 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6614 (buf!7082 bs!71)))))))

(declare-datatypes ((Unit!19207 0))(
  ( (Unit!19208) )
))
(declare-fun lt!410494 () Unit!19207)

(declare-fun arrayBitEqImpliesRangesEqLemma!0 (array!15214) Unit!19207)

(assert (=> b!272662 (= lt!410494 (arrayBitEqImpliesRangesEqLemma!0 (buf!7082 bs!71)))))

(declare-fun b!272663 () Bool)

(declare-fun array_inv!6338 (array!15214) Bool)

(assert (=> b!272663 (= e!192503 (array_inv!6338 (buf!7082 bs!71)))))

(assert (= (and start!59698 res!227032) b!272662))

(assert (= start!59698 b!272663))

(declare-fun m!405499 () Bool)

(assert (=> start!59698 m!405499))

(declare-fun m!405501 () Bool)

(assert (=> b!272662 m!405501))

(declare-fun m!405503 () Bool)

(assert (=> b!272662 m!405503))

(declare-fun m!405505 () Bool)

(assert (=> b!272662 m!405505))

(declare-fun m!405507 () Bool)

(assert (=> b!272663 m!405507))

(check-sat (not start!59698) (not b!272662) (not b!272663))
