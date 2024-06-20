; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60044 () Bool)

(assert start!60044)

(declare-fun res!227652 () Bool)

(declare-fun e!193375 () Bool)

(assert (=> start!60044 (=> (not res!227652) (not e!193375))))

(declare-datatypes ((array!15338 0))(
  ( (array!15339 (arr!7651 (Array (_ BitVec 32) (_ BitVec 8))) (size!6664 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12142 0))(
  ( (BitStream!12143 (buf!7132 array!15338) (currentByte!13160 (_ BitVec 32)) (currentBit!13155 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12142)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12142 (_ BitVec 64)) Bool)

(assert (=> start!60044 (= res!227652 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60044 e!193375))

(declare-fun e!193373 () Bool)

(declare-fun inv!12 (BitStream!12142) Bool)

(assert (=> start!60044 (and (inv!12 thiss!882) e!193373)))

(assert (=> start!60044 true))

(declare-fun b!273504 () Bool)

(declare-fun res!227653 () Bool)

(assert (=> b!273504 (=> (not res!227653) (not e!193375))))

(assert (=> b!273504 (= res!227653 (bvslt (bvadd (currentBit!13155 thiss!882) ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000000))))

(declare-fun b!273505 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!273505 (= e!193375 (not (invariant!0 (currentBit!13155 thiss!882) (currentByte!13160 thiss!882) (size!6664 (buf!7132 thiss!882)))))))

(declare-fun b!273506 () Bool)

(declare-fun array_inv!6388 (array!15338) Bool)

(assert (=> b!273506 (= e!193373 (array_inv!6388 (buf!7132 thiss!882)))))

(assert (= (and start!60044 res!227652) b!273504))

(assert (= (and b!273504 res!227653) b!273505))

(assert (= start!60044 b!273506))

(declare-fun m!406333 () Bool)

(assert (=> start!60044 m!406333))

(declare-fun m!406335 () Bool)

(assert (=> start!60044 m!406335))

(declare-fun m!406337 () Bool)

(assert (=> b!273505 m!406337))

(declare-fun m!406339 () Bool)

(assert (=> b!273506 m!406339))

(push 1)

(assert (not start!60044))

(assert (not b!273505))

(assert (not b!273506))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

