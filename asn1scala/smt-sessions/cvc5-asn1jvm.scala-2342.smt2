; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59762 () Bool)

(assert start!59762)

(declare-fun res!227155 () Bool)

(declare-fun e!192728 () Bool)

(assert (=> start!59762 (=> (not res!227155) (not e!192728))))

(declare-datatypes ((array!15251 0))(
  ( (array!15252 (arr!7618 (Array (_ BitVec 32) (_ BitVec 8))) (size!6631 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12076 0))(
  ( (BitStream!12077 (buf!7099 array!15251) (currentByte!13106 (_ BitVec 32)) (currentBit!13101 (_ BitVec 32))) )
))
(declare-fun bs!71 () BitStream!12076)

(assert (=> start!59762 (= res!227155 (not (= (size!6631 (buf!7099 bs!71)) #b00000000000000000000000000000000)))))

(assert (=> start!59762 e!192728))

(declare-fun e!192730 () Bool)

(declare-fun inv!12 (BitStream!12076) Bool)

(assert (=> start!59762 (and (inv!12 bs!71) e!192730)))

(declare-fun b!272854 () Bool)

(assert (=> b!272854 (= e!192728 (not true))))

(declare-fun lt!410714 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!272854 (= lt!410714 (bitIndex!0 (size!6631 (buf!7099 bs!71)) (currentByte!13106 bs!71) (currentBit!13101 bs!71)))))

(declare-fun arrayBitRangesEq!0 (array!15251 array!15251 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!272854 (arrayBitRangesEq!0 (buf!7099 bs!71) (buf!7099 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6631 (buf!7099 bs!71)))))))

(declare-datatypes ((Unit!19241 0))(
  ( (Unit!19242) )
))
(declare-fun lt!410713 () Unit!19241)

(declare-fun arrayBitEqImpliesRangesEqLemma!0 (array!15251) Unit!19241)

(assert (=> b!272854 (= lt!410713 (arrayBitEqImpliesRangesEqLemma!0 (buf!7099 bs!71)))))

(declare-fun b!272855 () Bool)

(declare-fun array_inv!6355 (array!15251) Bool)

(assert (=> b!272855 (= e!192730 (array_inv!6355 (buf!7099 bs!71)))))

(assert (= (and start!59762 res!227155) b!272854))

(assert (= start!59762 b!272855))

(declare-fun m!405723 () Bool)

(assert (=> start!59762 m!405723))

(declare-fun m!405725 () Bool)

(assert (=> b!272854 m!405725))

(declare-fun m!405727 () Bool)

(assert (=> b!272854 m!405727))

(declare-fun m!405729 () Bool)

(assert (=> b!272854 m!405729))

(declare-fun m!405731 () Bool)

(assert (=> b!272855 m!405731))

(push 1)

(assert (not b!272855))

(assert (not start!59762))

(assert (not b!272854))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

