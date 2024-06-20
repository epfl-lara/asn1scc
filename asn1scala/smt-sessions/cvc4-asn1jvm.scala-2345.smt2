; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59814 () Bool)

(assert start!59814)

(declare-fun res!227260 () Bool)

(declare-fun e!192899 () Bool)

(assert (=> start!59814 (=> (not res!227260) (not e!192899))))

(declare-datatypes ((array!15276 0))(
  ( (array!15277 (arr!7629 (Array (_ BitVec 32) (_ BitVec 8))) (size!6642 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12098 0))(
  ( (BitStream!12099 (buf!7110 array!15276) (currentByte!13120 (_ BitVec 32)) (currentBit!13115 (_ BitVec 32))) )
))
(declare-fun bs!71 () BitStream!12098)

(assert (=> start!59814 (= res!227260 (not (= (size!6642 (buf!7110 bs!71)) #b00000000000000000000000000000000)))))

(assert (=> start!59814 e!192899))

(declare-fun e!192900 () Bool)

(declare-fun inv!12 (BitStream!12098) Bool)

(assert (=> start!59814 (and (inv!12 bs!71) e!192900)))

(declare-fun b!273010 () Bool)

(assert (=> b!273010 (= e!192899 (not true))))

(declare-fun lt!410897 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!273010 (= lt!410897 (bitIndex!0 (size!6642 (buf!7110 bs!71)) (currentByte!13120 bs!71) (currentBit!13115 bs!71)))))

(declare-fun arrayBitRangesEq!0 (array!15276 array!15276 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!273010 (arrayBitRangesEq!0 (buf!7110 bs!71) (buf!7110 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6642 (buf!7110 bs!71)))))))

(declare-datatypes ((Unit!19263 0))(
  ( (Unit!19264) )
))
(declare-fun lt!410896 () Unit!19263)

(declare-fun arrayBitEqImpliesRangesEqLemma!0 (array!15276) Unit!19263)

(assert (=> b!273010 (= lt!410896 (arrayBitEqImpliesRangesEqLemma!0 (buf!7110 bs!71)))))

(declare-fun b!273011 () Bool)

(declare-fun array_inv!6366 (array!15276) Bool)

(assert (=> b!273011 (= e!192900 (array_inv!6366 (buf!7110 bs!71)))))

(assert (= (and start!59814 res!227260) b!273010))

(assert (= start!59814 b!273011))

(declare-fun m!405893 () Bool)

(assert (=> start!59814 m!405893))

(declare-fun m!405895 () Bool)

(assert (=> b!273010 m!405895))

(declare-fun m!405897 () Bool)

(assert (=> b!273010 m!405897))

(declare-fun m!405899 () Bool)

(assert (=> b!273010 m!405899))

(declare-fun m!405901 () Bool)

(assert (=> b!273011 m!405901))

(push 1)

(assert (not b!273011))

(assert (not b!273010))

(assert (not start!59814))

(check-sat)

