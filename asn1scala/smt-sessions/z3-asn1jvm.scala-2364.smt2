; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60292 () Bool)

(assert start!60292)

(declare-fun res!227899 () Bool)

(declare-fun e!193790 () Bool)

(assert (=> start!60292 (=> (not res!227899) (not e!193790))))

(declare-datatypes ((array!15428 0))(
  ( (array!15429 (arr!7685 (Array (_ BitVec 32) (_ BitVec 8))) (size!6698 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12210 0))(
  ( (BitStream!12211 (buf!7166 array!15428) (currentByte!13219 (_ BitVec 32)) (currentBit!13214 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12210)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12210 (_ BitVec 64)) Bool)

(assert (=> start!60292 (= res!227899 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60292 e!193790))

(declare-fun e!193791 () Bool)

(declare-fun inv!12 (BitStream!12210) Bool)

(assert (=> start!60292 (and (inv!12 thiss!882) e!193791)))

(assert (=> start!60292 true))

(declare-fun b!273875 () Bool)

(assert (=> b!273875 (= e!193790 (bvsge (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000))))

(declare-fun b!273876 () Bool)

(declare-fun array_inv!6422 (array!15428) Bool)

(assert (=> b!273876 (= e!193791 (array_inv!6422 (buf!7166 thiss!882)))))

(assert (= (and start!60292 res!227899) b!273875))

(assert (= start!60292 b!273876))

(declare-fun m!406661 () Bool)

(assert (=> start!60292 m!406661))

(declare-fun m!406663 () Bool)

(assert (=> start!60292 m!406663))

(declare-fun m!406665 () Bool)

(assert (=> b!273876 m!406665))

(check-sat (not b!273876) (not start!60292))
(check-sat)
