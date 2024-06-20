; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60298 () Bool)

(assert start!60298)

(declare-fun res!227908 () Bool)

(declare-fun e!193817 () Bool)

(assert (=> start!60298 (=> (not res!227908) (not e!193817))))

(declare-datatypes ((array!15434 0))(
  ( (array!15435 (arr!7688 (Array (_ BitVec 32) (_ BitVec 8))) (size!6701 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12216 0))(
  ( (BitStream!12217 (buf!7169 array!15434) (currentByte!13222 (_ BitVec 32)) (currentBit!13217 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12216)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12216 (_ BitVec 64)) Bool)

(assert (=> start!60298 (= res!227908 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60298 e!193817))

(declare-fun e!193818 () Bool)

(declare-fun inv!12 (BitStream!12216) Bool)

(assert (=> start!60298 (and (inv!12 thiss!882) e!193818)))

(assert (=> start!60298 true))

(declare-fun b!273893 () Bool)

(assert (=> b!273893 (= e!193817 (and (bvslt (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000) #b1111111111111111111111111111111110000000000000000000000000000000)))))

(declare-fun b!273894 () Bool)

(declare-fun array_inv!6425 (array!15434) Bool)

(assert (=> b!273894 (= e!193818 (array_inv!6425 (buf!7169 thiss!882)))))

(assert (= (and start!60298 res!227908) b!273893))

(assert (= start!60298 b!273894))

(declare-fun m!406679 () Bool)

(assert (=> start!60298 m!406679))

(declare-fun m!406681 () Bool)

(assert (=> start!60298 m!406681))

(declare-fun m!406683 () Bool)

(assert (=> b!273894 m!406683))

(check-sat (not b!273894) (not start!60298))
(check-sat)
