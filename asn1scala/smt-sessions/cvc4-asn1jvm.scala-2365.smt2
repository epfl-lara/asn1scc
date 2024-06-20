; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60300 () Bool)

(assert start!60300)

(declare-fun res!227911 () Bool)

(declare-fun e!193826 () Bool)

(assert (=> start!60300 (=> (not res!227911) (not e!193826))))

(declare-datatypes ((array!15436 0))(
  ( (array!15437 (arr!7689 (Array (_ BitVec 32) (_ BitVec 8))) (size!6702 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12218 0))(
  ( (BitStream!12219 (buf!7170 array!15436) (currentByte!13223 (_ BitVec 32)) (currentBit!13218 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12218)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12218 (_ BitVec 64)) Bool)

(assert (=> start!60300 (= res!227911 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60300 e!193826))

(declare-fun e!193827 () Bool)

(declare-fun inv!12 (BitStream!12218) Bool)

(assert (=> start!60300 (and (inv!12 thiss!882) e!193827)))

(assert (=> start!60300 true))

(declare-fun b!273899 () Bool)

(assert (=> b!273899 (= e!193826 (and (bvslt (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000) #b1111111111111111111111111111111110000000000000000000000000000000)))))

(declare-fun b!273900 () Bool)

(declare-fun array_inv!6426 (array!15436) Bool)

(assert (=> b!273900 (= e!193827 (array_inv!6426 (buf!7170 thiss!882)))))

(assert (= (and start!60300 res!227911) b!273899))

(assert (= start!60300 b!273900))

(declare-fun m!406685 () Bool)

(assert (=> start!60300 m!406685))

(declare-fun m!406687 () Bool)

(assert (=> start!60300 m!406687))

(declare-fun m!406689 () Bool)

(assert (=> b!273900 m!406689))

(push 1)

(assert (not start!60300))

(assert (not b!273900))

(check-sat)

(pop 1)

