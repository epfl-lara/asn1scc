; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60286 () Bool)

(assert start!60286)

(declare-fun lt!411869 () Bool)

(declare-datatypes ((array!15422 0))(
  ( (array!15423 (arr!7682 (Array (_ BitVec 32) (_ BitVec 8))) (size!6695 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12204 0))(
  ( (BitStream!12205 (buf!7163 array!15422) (currentByte!13216 (_ BitVec 32)) (currentBit!13211 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12204)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12204 (_ BitVec 64)) Bool)

(assert (=> start!60286 (= lt!411869 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60286 false))

(declare-fun e!193767 () Bool)

(declare-fun inv!12 (BitStream!12204) Bool)

(assert (=> start!60286 (and (inv!12 thiss!882) e!193767)))

(assert (=> start!60286 true))

(declare-fun b!273861 () Bool)

(declare-fun array_inv!6419 (array!15422) Bool)

(assert (=> b!273861 (= e!193767 (array_inv!6419 (buf!7163 thiss!882)))))

(assert (= start!60286 b!273861))

(declare-fun m!406643 () Bool)

(assert (=> start!60286 m!406643))

(declare-fun m!406645 () Bool)

(assert (=> start!60286 m!406645))

(declare-fun m!406647 () Bool)

(assert (=> b!273861 m!406647))

(check-sat (not b!273861) (not start!60286))
(check-sat)
