; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60048 () Bool)

(assert start!60048)

(declare-fun res!227665 () Bool)

(declare-fun e!193392 () Bool)

(assert (=> start!60048 (=> (not res!227665) (not e!193392))))

(declare-datatypes ((array!15342 0))(
  ( (array!15343 (arr!7653 (Array (_ BitVec 32) (_ BitVec 8))) (size!6666 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12146 0))(
  ( (BitStream!12147 (buf!7134 array!15342) (currentByte!13162 (_ BitVec 32)) (currentBit!13157 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12146)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12146 (_ BitVec 64)) Bool)

(assert (=> start!60048 (= res!227665 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60048 e!193392))

(declare-fun e!193393 () Bool)

(declare-fun inv!12 (BitStream!12146) Bool)

(assert (=> start!60048 (and (inv!12 thiss!882) e!193393)))

(assert (=> start!60048 true))

(declare-fun b!273522 () Bool)

(declare-fun res!227664 () Bool)

(assert (=> b!273522 (=> (not res!227664) (not e!193392))))

(assert (=> b!273522 (= res!227664 (bvslt (bvadd (currentBit!13157 thiss!882) ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000000))))

(declare-fun b!273523 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!273523 (= e!193392 (not (invariant!0 (currentBit!13157 thiss!882) (currentByte!13162 thiss!882) (size!6666 (buf!7134 thiss!882)))))))

(declare-fun b!273524 () Bool)

(declare-fun array_inv!6390 (array!15342) Bool)

(assert (=> b!273524 (= e!193393 (array_inv!6390 (buf!7134 thiss!882)))))

(assert (= (and start!60048 res!227665) b!273522))

(assert (= (and b!273522 res!227664) b!273523))

(assert (= start!60048 b!273524))

(declare-fun m!406349 () Bool)

(assert (=> start!60048 m!406349))

(declare-fun m!406351 () Bool)

(assert (=> start!60048 m!406351))

(declare-fun m!406353 () Bool)

(assert (=> b!273523 m!406353))

(declare-fun m!406355 () Bool)

(assert (=> b!273524 m!406355))

(push 1)

(assert (not b!273524))

(assert (not start!60048))

(assert (not b!273523))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

