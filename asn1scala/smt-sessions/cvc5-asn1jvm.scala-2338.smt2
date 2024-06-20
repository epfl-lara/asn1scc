; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59708 () Bool)

(assert start!59708)

(declare-fun res!227047 () Bool)

(declare-fun e!192549 () Bool)

(assert (=> start!59708 (=> (not res!227047) (not e!192549))))

(declare-datatypes ((array!15224 0))(
  ( (array!15225 (arr!7606 (Array (_ BitVec 32) (_ BitVec 8))) (size!6619 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12052 0))(
  ( (BitStream!12053 (buf!7087 array!15224) (currentByte!13091 (_ BitVec 32)) (currentBit!13086 (_ BitVec 32))) )
))
(declare-fun bs!71 () BitStream!12052)

(assert (=> start!59708 (= res!227047 (not (= (size!6619 (buf!7087 bs!71)) #b00000000000000000000000000000000)))))

(assert (=> start!59708 e!192549))

(declare-fun e!192548 () Bool)

(declare-fun inv!12 (BitStream!12052) Bool)

(assert (=> start!59708 (and (inv!12 bs!71) e!192548)))

(declare-fun b!272692 () Bool)

(assert (=> b!272692 (= e!192549 (not true))))

(declare-fun lt!410524 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!272692 (= lt!410524 (bitIndex!0 (size!6619 (buf!7087 bs!71)) (currentByte!13091 bs!71) (currentBit!13086 bs!71)))))

(declare-fun arrayBitRangesEq!0 (array!15224 array!15224 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!272692 (arrayBitRangesEq!0 (buf!7087 bs!71) (buf!7087 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6619 (buf!7087 bs!71)))))))

(declare-datatypes ((Unit!19217 0))(
  ( (Unit!19218) )
))
(declare-fun lt!410525 () Unit!19217)

(declare-fun arrayBitEqImpliesRangesEqLemma!0 (array!15224) Unit!19217)

(assert (=> b!272692 (= lt!410525 (arrayBitEqImpliesRangesEqLemma!0 (buf!7087 bs!71)))))

(declare-fun b!272693 () Bool)

(declare-fun array_inv!6343 (array!15224) Bool)

(assert (=> b!272693 (= e!192548 (array_inv!6343 (buf!7087 bs!71)))))

(assert (= (and start!59708 res!227047) b!272692))

(assert (= start!59708 b!272693))

(declare-fun m!405549 () Bool)

(assert (=> start!59708 m!405549))

(declare-fun m!405551 () Bool)

(assert (=> b!272692 m!405551))

(declare-fun m!405553 () Bool)

(assert (=> b!272692 m!405553))

(declare-fun m!405555 () Bool)

(assert (=> b!272692 m!405555))

(declare-fun m!405557 () Bool)

(assert (=> b!272693 m!405557))

(push 1)

(assert (not b!272692))

(assert (not b!272693))

(assert (not start!59708))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

