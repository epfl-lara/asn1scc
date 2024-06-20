; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59764 () Bool)

(assert start!59764)

(declare-fun res!227158 () Bool)

(declare-fun e!192738 () Bool)

(assert (=> start!59764 (=> (not res!227158) (not e!192738))))

(declare-datatypes ((array!15253 0))(
  ( (array!15254 (arr!7619 (Array (_ BitVec 32) (_ BitVec 8))) (size!6632 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12078 0))(
  ( (BitStream!12079 (buf!7100 array!15253) (currentByte!13107 (_ BitVec 32)) (currentBit!13102 (_ BitVec 32))) )
))
(declare-fun bs!71 () BitStream!12078)

(assert (=> start!59764 (= res!227158 (not (= (size!6632 (buf!7100 bs!71)) #b00000000000000000000000000000000)))))

(assert (=> start!59764 e!192738))

(declare-fun e!192737 () Bool)

(declare-fun inv!12 (BitStream!12078) Bool)

(assert (=> start!59764 (and (inv!12 bs!71) e!192737)))

(declare-fun b!272860 () Bool)

(assert (=> b!272860 (= e!192738 (not true))))

(declare-fun lt!410720 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!272860 (= lt!410720 (bitIndex!0 (size!6632 (buf!7100 bs!71)) (currentByte!13107 bs!71) (currentBit!13102 bs!71)))))

(declare-fun arrayBitRangesEq!0 (array!15253 array!15253 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!272860 (arrayBitRangesEq!0 (buf!7100 bs!71) (buf!7100 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6632 (buf!7100 bs!71)))))))

(declare-datatypes ((Unit!19243 0))(
  ( (Unit!19244) )
))
(declare-fun lt!410719 () Unit!19243)

(declare-fun arrayBitEqImpliesRangesEqLemma!0 (array!15253) Unit!19243)

(assert (=> b!272860 (= lt!410719 (arrayBitEqImpliesRangesEqLemma!0 (buf!7100 bs!71)))))

(declare-fun b!272861 () Bool)

(declare-fun array_inv!6356 (array!15253) Bool)

(assert (=> b!272861 (= e!192737 (array_inv!6356 (buf!7100 bs!71)))))

(assert (= (and start!59764 res!227158) b!272860))

(assert (= start!59764 b!272861))

(declare-fun m!405733 () Bool)

(assert (=> start!59764 m!405733))

(declare-fun m!405735 () Bool)

(assert (=> b!272860 m!405735))

(declare-fun m!405737 () Bool)

(assert (=> b!272860 m!405737))

(declare-fun m!405739 () Bool)

(assert (=> b!272860 m!405739))

(declare-fun m!405741 () Bool)

(assert (=> b!272861 m!405741))

(check-sat (not b!272861) (not start!59764) (not b!272860))
