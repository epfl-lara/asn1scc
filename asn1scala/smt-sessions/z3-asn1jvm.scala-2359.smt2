; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60230 () Bool)

(assert start!60230)

(declare-fun lt!411836 () Bool)

(declare-datatypes ((array!15392 0))(
  ( (array!15393 (arr!7670 (Array (_ BitVec 32) (_ BitVec 8))) (size!6683 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12180 0))(
  ( (BitStream!12181 (buf!7151 array!15392) (currentByte!13204 (_ BitVec 32)) (currentBit!13199 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12180)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12180 (_ BitVec 64)) Bool)

(assert (=> start!60230 (= lt!411836 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60230 false))

(declare-fun e!193662 () Bool)

(declare-fun inv!12 (BitStream!12180) Bool)

(assert (=> start!60230 (and (inv!12 thiss!882) e!193662)))

(assert (=> start!60230 true))

(declare-fun b!273787 () Bool)

(declare-fun array_inv!6407 (array!15392) Bool)

(assert (=> b!273787 (= e!193662 (array_inv!6407 (buf!7151 thiss!882)))))

(assert (= start!60230 b!273787))

(declare-fun m!406551 () Bool)

(assert (=> start!60230 m!406551))

(declare-fun m!406553 () Bool)

(assert (=> start!60230 m!406553))

(declare-fun m!406555 () Bool)

(assert (=> b!273787 m!406555))

(check-sat (not start!60230) (not b!273787))
