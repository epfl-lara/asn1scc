; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60236 () Bool)

(assert start!60236)

(declare-fun lt!411845 () Bool)

(declare-datatypes ((array!15398 0))(
  ( (array!15399 (arr!7673 (Array (_ BitVec 32) (_ BitVec 8))) (size!6686 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12186 0))(
  ( (BitStream!12187 (buf!7154 array!15398) (currentByte!13207 (_ BitVec 32)) (currentBit!13202 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12186)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12186 (_ BitVec 64)) Bool)

(assert (=> start!60236 (= lt!411845 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60236 false))

(declare-fun e!193680 () Bool)

(declare-fun inv!12 (BitStream!12186) Bool)

(assert (=> start!60236 (and (inv!12 thiss!882) e!193680)))

(assert (=> start!60236 true))

(declare-fun b!273796 () Bool)

(declare-fun array_inv!6410 (array!15398) Bool)

(assert (=> b!273796 (= e!193680 (array_inv!6410 (buf!7154 thiss!882)))))

(assert (= start!60236 b!273796))

(declare-fun m!406569 () Bool)

(assert (=> start!60236 m!406569))

(declare-fun m!406571 () Bool)

(assert (=> start!60236 m!406571))

(declare-fun m!406573 () Bool)

(assert (=> b!273796 m!406573))

(check-sat (not start!60236) (not b!273796))
