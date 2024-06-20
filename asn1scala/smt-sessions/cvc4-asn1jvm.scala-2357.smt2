; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60174 () Bool)

(assert start!60174)

(declare-fun res!227808 () Bool)

(declare-fun e!193591 () Bool)

(assert (=> start!60174 (=> (not res!227808) (not e!193591))))

(declare-datatypes ((array!15377 0))(
  ( (array!15378 (arr!7665 (Array (_ BitVec 32) (_ BitVec 8))) (size!6678 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12170 0))(
  ( (BitStream!12171 (buf!7146 array!15377) (currentByte!13191 (_ BitVec 32)) (currentBit!13186 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12170)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12170 (_ BitVec 64)) Bool)

(assert (=> start!60174 (= res!227808 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60174 e!193591))

(declare-fun e!193589 () Bool)

(declare-fun inv!12 (BitStream!12170) Bool)

(assert (=> start!60174 (and (inv!12 thiss!882) e!193589)))

(assert (=> start!60174 true))

(declare-fun b!273714 () Bool)

(declare-fun e!193588 () Bool)

(assert (=> b!273714 (= e!193591 e!193588)))

(declare-fun res!227809 () Bool)

(assert (=> b!273714 (=> (not res!227809) (not e!193588))))

(declare-fun lt!411752 () (_ BitVec 32))

(assert (=> b!273714 (= res!227809 (and (bvsge lt!411752 #b00000000000000000000000000000000) (bvslt lt!411752 #b00000000000000000000000000001000)))))

(assert (=> b!273714 (= lt!411752 (bvadd (currentBit!13186 thiss!882) ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!273715 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!273715 (= e!193588 (not (invariant!0 (currentBit!13186 thiss!882) (currentByte!13191 thiss!882) (size!6678 (buf!7146 thiss!882)))))))

(declare-fun b!273716 () Bool)

(declare-fun array_inv!6402 (array!15377) Bool)

(assert (=> b!273716 (= e!193589 (array_inv!6402 (buf!7146 thiss!882)))))

(assert (= (and start!60174 res!227808) b!273714))

(assert (= (and b!273714 res!227809) b!273715))

(assert (= start!60174 b!273716))

(declare-fun m!406491 () Bool)

(assert (=> start!60174 m!406491))

(declare-fun m!406493 () Bool)

(assert (=> start!60174 m!406493))

(declare-fun m!406495 () Bool)

(assert (=> b!273715 m!406495))

(declare-fun m!406497 () Bool)

(assert (=> b!273716 m!406497))

(push 1)

(assert (not b!273716))

(assert (not start!60174))

(assert (not b!273715))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

