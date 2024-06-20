; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60290 () Bool)

(assert start!60290)

(declare-fun res!227896 () Bool)

(declare-fun e!193781 () Bool)

(assert (=> start!60290 (=> (not res!227896) (not e!193781))))

(declare-datatypes ((array!15426 0))(
  ( (array!15427 (arr!7684 (Array (_ BitVec 32) (_ BitVec 8))) (size!6697 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12208 0))(
  ( (BitStream!12209 (buf!7165 array!15426) (currentByte!13218 (_ BitVec 32)) (currentBit!13213 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12208)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12208 (_ BitVec 64)) Bool)

(assert (=> start!60290 (= res!227896 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60290 e!193781))

(declare-fun e!193782 () Bool)

(declare-fun inv!12 (BitStream!12208) Bool)

(assert (=> start!60290 (and (inv!12 thiss!882) e!193782)))

(assert (=> start!60290 true))

(declare-fun b!273869 () Bool)

(assert (=> b!273869 (= e!193781 (bvsge (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000))))

(declare-fun b!273870 () Bool)

(declare-fun array_inv!6421 (array!15426) Bool)

(assert (=> b!273870 (= e!193782 (array_inv!6421 (buf!7165 thiss!882)))))

(assert (= (and start!60290 res!227896) b!273869))

(assert (= start!60290 b!273870))

(declare-fun m!406655 () Bool)

(assert (=> start!60290 m!406655))

(declare-fun m!406657 () Bool)

(assert (=> start!60290 m!406657))

(declare-fun m!406659 () Bool)

(assert (=> b!273870 m!406659))

(push 1)

(assert (not b!273870))

(assert (not start!60290))

(check-sat)

(pop 1)

(push 1)

(check-sat)

