; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59712 () Bool)

(assert start!59712)

(declare-fun res!227053 () Bool)

(declare-fun e!192568 () Bool)

(assert (=> start!59712 (=> (not res!227053) (not e!192568))))

(declare-datatypes ((array!15228 0))(
  ( (array!15229 (arr!7608 (Array (_ BitVec 32) (_ BitVec 8))) (size!6621 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12056 0))(
  ( (BitStream!12057 (buf!7089 array!15228) (currentByte!13093 (_ BitVec 32)) (currentBit!13088 (_ BitVec 32))) )
))
(declare-fun bs!71 () BitStream!12056)

(assert (=> start!59712 (= res!227053 (not (= (size!6621 (buf!7089 bs!71)) #b00000000000000000000000000000000)))))

(assert (=> start!59712 e!192568))

(declare-fun e!192567 () Bool)

(declare-fun inv!12 (BitStream!12056) Bool)

(assert (=> start!59712 (and (inv!12 bs!71) e!192567)))

(declare-fun b!272704 () Bool)

(assert (=> b!272704 (= e!192568 (not true))))

(declare-fun lt!410537 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!272704 (= lt!410537 (bitIndex!0 (size!6621 (buf!7089 bs!71)) (currentByte!13093 bs!71) (currentBit!13088 bs!71)))))

(declare-fun arrayBitRangesEq!0 (array!15228 array!15228 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!272704 (arrayBitRangesEq!0 (buf!7089 bs!71) (buf!7089 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6621 (buf!7089 bs!71)))))))

(declare-datatypes ((Unit!19221 0))(
  ( (Unit!19222) )
))
(declare-fun lt!410536 () Unit!19221)

(declare-fun arrayBitEqImpliesRangesEqLemma!0 (array!15228) Unit!19221)

(assert (=> b!272704 (= lt!410536 (arrayBitEqImpliesRangesEqLemma!0 (buf!7089 bs!71)))))

(declare-fun b!272705 () Bool)

(declare-fun array_inv!6345 (array!15228) Bool)

(assert (=> b!272705 (= e!192567 (array_inv!6345 (buf!7089 bs!71)))))

(assert (= (and start!59712 res!227053) b!272704))

(assert (= start!59712 b!272705))

(declare-fun m!405569 () Bool)

(assert (=> start!59712 m!405569))

(declare-fun m!405571 () Bool)

(assert (=> b!272704 m!405571))

(declare-fun m!405573 () Bool)

(assert (=> b!272704 m!405573))

(declare-fun m!405575 () Bool)

(assert (=> b!272704 m!405575))

(declare-fun m!405577 () Bool)

(assert (=> b!272705 m!405577))

(push 1)

(assert (not b!272704))

(assert (not b!272705))

(assert (not start!59712))

(check-sat)

