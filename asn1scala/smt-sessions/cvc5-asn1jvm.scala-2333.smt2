; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59678 () Bool)

(assert start!59678)

(declare-fun res!227002 () Bool)

(declare-fun e!192413 () Bool)

(assert (=> start!59678 (=> (not res!227002) (not e!192413))))

(declare-datatypes ((array!15194 0))(
  ( (array!15195 (arr!7591 (Array (_ BitVec 32) (_ BitVec 8))) (size!6604 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12022 0))(
  ( (BitStream!12023 (buf!7072 array!15194) (currentByte!13076 (_ BitVec 32)) (currentBit!13071 (_ BitVec 32))) )
))
(declare-fun bs!71 () BitStream!12022)

(assert (=> start!59678 (= res!227002 (not (= (size!6604 (buf!7072 bs!71)) #b00000000000000000000000000000000)))))

(assert (=> start!59678 e!192413))

(declare-fun e!192414 () Bool)

(declare-fun inv!12 (BitStream!12022) Bool)

(assert (=> start!59678 (and (inv!12 bs!71) e!192414)))

(declare-fun b!272602 () Bool)

(assert (=> b!272602 (= e!192413 (not true))))

(declare-fun lt!410434 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!272602 (= lt!410434 (bitIndex!0 (size!6604 (buf!7072 bs!71)) (currentByte!13076 bs!71) (currentBit!13071 bs!71)))))

(declare-fun arrayBitRangesEq!0 (array!15194 array!15194 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!272602 (arrayBitRangesEq!0 (buf!7072 bs!71) (buf!7072 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6604 (buf!7072 bs!71)))))))

(declare-datatypes ((Unit!19187 0))(
  ( (Unit!19188) )
))
(declare-fun lt!410435 () Unit!19187)

(declare-fun arrayBitEqImpliesRangesEqLemma!0 (array!15194) Unit!19187)

(assert (=> b!272602 (= lt!410435 (arrayBitEqImpliesRangesEqLemma!0 (buf!7072 bs!71)))))

(declare-fun b!272603 () Bool)

(declare-fun array_inv!6328 (array!15194) Bool)

(assert (=> b!272603 (= e!192414 (array_inv!6328 (buf!7072 bs!71)))))

(assert (= (and start!59678 res!227002) b!272602))

(assert (= start!59678 b!272603))

(declare-fun m!405399 () Bool)

(assert (=> start!59678 m!405399))

(declare-fun m!405401 () Bool)

(assert (=> b!272602 m!405401))

(declare-fun m!405403 () Bool)

(assert (=> b!272602 m!405403))

(declare-fun m!405405 () Bool)

(assert (=> b!272602 m!405405))

(declare-fun m!405407 () Bool)

(assert (=> b!272603 m!405407))

(push 1)

(assert (not b!272603))

(assert (not b!272602))

(assert (not start!59678))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

