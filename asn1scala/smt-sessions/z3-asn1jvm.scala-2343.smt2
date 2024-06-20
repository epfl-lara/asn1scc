; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59770 () Bool)

(assert start!59770)

(declare-fun res!227167 () Bool)

(declare-fun e!192766 () Bool)

(assert (=> start!59770 (=> (not res!227167) (not e!192766))))

(declare-datatypes ((array!15259 0))(
  ( (array!15260 (arr!7622 (Array (_ BitVec 32) (_ BitVec 8))) (size!6635 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12084 0))(
  ( (BitStream!12085 (buf!7103 array!15259) (currentByte!13110 (_ BitVec 32)) (currentBit!13105 (_ BitVec 32))) )
))
(declare-fun bs!71 () BitStream!12084)

(assert (=> start!59770 (= res!227167 (not (= (size!6635 (buf!7103 bs!71)) #b00000000000000000000000000000000)))))

(assert (=> start!59770 e!192766))

(declare-fun e!192764 () Bool)

(declare-fun inv!12 (BitStream!12084) Bool)

(assert (=> start!59770 (and (inv!12 bs!71) e!192764)))

(declare-fun b!272878 () Bool)

(assert (=> b!272878 (= e!192766 (not true))))

(declare-fun lt!410738 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!272878 (= lt!410738 (bitIndex!0 (size!6635 (buf!7103 bs!71)) (currentByte!13110 bs!71) (currentBit!13105 bs!71)))))

(declare-fun arrayBitRangesEq!0 (array!15259 array!15259 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!272878 (arrayBitRangesEq!0 (buf!7103 bs!71) (buf!7103 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6635 (buf!7103 bs!71)))))))

(declare-datatypes ((Unit!19249 0))(
  ( (Unit!19250) )
))
(declare-fun lt!410737 () Unit!19249)

(declare-fun arrayBitEqImpliesRangesEqLemma!0 (array!15259) Unit!19249)

(assert (=> b!272878 (= lt!410737 (arrayBitEqImpliesRangesEqLemma!0 (buf!7103 bs!71)))))

(declare-fun b!272879 () Bool)

(declare-fun array_inv!6359 (array!15259) Bool)

(assert (=> b!272879 (= e!192764 (array_inv!6359 (buf!7103 bs!71)))))

(assert (= (and start!59770 res!227167) b!272878))

(assert (= start!59770 b!272879))

(declare-fun m!405763 () Bool)

(assert (=> start!59770 m!405763))

(declare-fun m!405765 () Bool)

(assert (=> b!272878 m!405765))

(declare-fun m!405767 () Bool)

(assert (=> b!272878 m!405767))

(declare-fun m!405769 () Bool)

(assert (=> b!272878 m!405769))

(declare-fun m!405771 () Bool)

(assert (=> b!272879 m!405771))

(check-sat (not b!272878) (not b!272879) (not start!59770))
