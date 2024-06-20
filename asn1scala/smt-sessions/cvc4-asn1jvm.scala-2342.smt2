; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59766 () Bool)

(assert start!59766)

(declare-fun res!227161 () Bool)

(declare-fun e!192748 () Bool)

(assert (=> start!59766 (=> (not res!227161) (not e!192748))))

(declare-datatypes ((array!15255 0))(
  ( (array!15256 (arr!7620 (Array (_ BitVec 32) (_ BitVec 8))) (size!6633 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12080 0))(
  ( (BitStream!12081 (buf!7101 array!15255) (currentByte!13108 (_ BitVec 32)) (currentBit!13103 (_ BitVec 32))) )
))
(declare-fun bs!71 () BitStream!12080)

(assert (=> start!59766 (= res!227161 (not (= (size!6633 (buf!7101 bs!71)) #b00000000000000000000000000000000)))))

(assert (=> start!59766 e!192748))

(declare-fun e!192746 () Bool)

(declare-fun inv!12 (BitStream!12080) Bool)

(assert (=> start!59766 (and (inv!12 bs!71) e!192746)))

(declare-fun b!272866 () Bool)

(assert (=> b!272866 (= e!192748 (not true))))

(declare-fun lt!410726 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!272866 (= lt!410726 (bitIndex!0 (size!6633 (buf!7101 bs!71)) (currentByte!13108 bs!71) (currentBit!13103 bs!71)))))

(declare-fun arrayBitRangesEq!0 (array!15255 array!15255 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!272866 (arrayBitRangesEq!0 (buf!7101 bs!71) (buf!7101 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6633 (buf!7101 bs!71)))))))

(declare-datatypes ((Unit!19245 0))(
  ( (Unit!19246) )
))
(declare-fun lt!410725 () Unit!19245)

(declare-fun arrayBitEqImpliesRangesEqLemma!0 (array!15255) Unit!19245)

(assert (=> b!272866 (= lt!410725 (arrayBitEqImpliesRangesEqLemma!0 (buf!7101 bs!71)))))

(declare-fun b!272867 () Bool)

(declare-fun array_inv!6357 (array!15255) Bool)

(assert (=> b!272867 (= e!192746 (array_inv!6357 (buf!7101 bs!71)))))

(assert (= (and start!59766 res!227161) b!272866))

(assert (= start!59766 b!272867))

(declare-fun m!405743 () Bool)

(assert (=> start!59766 m!405743))

(declare-fun m!405745 () Bool)

(assert (=> b!272866 m!405745))

(declare-fun m!405747 () Bool)

(assert (=> b!272866 m!405747))

(declare-fun m!405749 () Bool)

(assert (=> b!272866 m!405749))

(declare-fun m!405751 () Bool)

(assert (=> b!272867 m!405751))

(push 1)

(assert (not b!272867))

(assert (not start!59766))

(assert (not b!272866))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

