; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60294 () Bool)

(assert start!60294)

(declare-fun res!227902 () Bool)

(declare-fun e!193799 () Bool)

(assert (=> start!60294 (=> (not res!227902) (not e!193799))))

(declare-datatypes ((array!15430 0))(
  ( (array!15431 (arr!7686 (Array (_ BitVec 32) (_ BitVec 8))) (size!6699 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12212 0))(
  ( (BitStream!12213 (buf!7167 array!15430) (currentByte!13220 (_ BitVec 32)) (currentBit!13215 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12212)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12212 (_ BitVec 64)) Bool)

(assert (=> start!60294 (= res!227902 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60294 e!193799))

(declare-fun e!193800 () Bool)

(declare-fun inv!12 (BitStream!12212) Bool)

(assert (=> start!60294 (and (inv!12 thiss!882) e!193800)))

(assert (=> start!60294 true))

(declare-fun b!273881 () Bool)

(assert (=> b!273881 (= e!193799 (bvsge (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000))))

(declare-fun b!273882 () Bool)

(declare-fun array_inv!6423 (array!15430) Bool)

(assert (=> b!273882 (= e!193800 (array_inv!6423 (buf!7167 thiss!882)))))

(assert (= (and start!60294 res!227902) b!273881))

(assert (= start!60294 b!273882))

(declare-fun m!406667 () Bool)

(assert (=> start!60294 m!406667))

(declare-fun m!406669 () Bool)

(assert (=> start!60294 m!406669))

(declare-fun m!406671 () Bool)

(assert (=> b!273882 m!406671))

(push 1)

(assert (not start!60294))

(assert (not b!273882))

(check-sat)

(pop 1)

(push 1)

(check-sat)

