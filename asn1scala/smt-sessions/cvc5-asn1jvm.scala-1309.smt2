; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37234 () Bool)

(assert start!37234)

(declare-fun res!140659 () Bool)

(declare-fun e!117651 () Bool)

(assert (=> start!37234 (=> (not res!140659) (not e!117651))))

(declare-fun nBits!499 () (_ BitVec 64))

(declare-fun fromArr1!3 () (_ BitVec 64))

(declare-datatypes ((array!8904 0))(
  ( (array!8905 (arr!4861 (Array (_ BitVec 32) (_ BitVec 8))) (size!3940 (_ BitVec 32))) )
))
(declare-fun arr1!28 () array!8904)

(declare-fun arr2!28 () array!8904)

(declare-fun fromArr2!3 () (_ BitVec 64))

(assert (=> start!37234 (= res!140659 (and (bvsge fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt fromArr1!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvslt fromArr2!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvsle (bvadd fromArr1!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3940 arr1!28)))) (bvsle (bvadd fromArr2!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3940 arr2!28))))))))

(assert (=> start!37234 e!117651))

(assert (=> start!37234 true))

(declare-fun array_inv!3681 (array!8904) Bool)

(assert (=> start!37234 (array_inv!3681 arr2!28)))

(assert (=> start!37234 (array_inv!3681 arr1!28)))

(declare-datatypes ((BitStream!7036 0))(
  ( (BitStream!7037 (buf!4392 array!8904) (currentByte!8376 (_ BitVec 32)) (currentBit!8371 (_ BitVec 32))) )
))
(declare-fun thiss!1565 () BitStream!7036)

(declare-fun e!117654 () Bool)

(declare-fun inv!12 (BitStream!7036) Bool)

(assert (=> start!37234 (and (inv!12 thiss!1565) e!117654)))

(declare-fun b!169135 () Bool)

(declare-fun res!140660 () Bool)

(assert (=> b!169135 (=> (not res!140660) (not e!117651))))

(declare-datatypes ((List!905 0))(
  ( (Nil!902) (Cons!901 (h!1020 Bool) (t!1724 List!905)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!7036 array!8904 (_ BitVec 64) (_ BitVec 64)) List!905)

(assert (=> b!169135 (= res!140660 (= (byteArrayBitContentToList!0 thiss!1565 arr2!28 fromArr2!3 nBits!499) (byteArrayBitContentToList!0 thiss!1565 arr1!28 fromArr1!3 nBits!499)))))

(declare-fun b!169136 () Bool)

(assert (=> b!169136 (= e!117651 (and (bvsgt nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr1!3) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr2!3) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!169137 () Bool)

(assert (=> b!169137 (= e!117654 (array_inv!3681 (buf!4392 thiss!1565)))))

(assert (= (and start!37234 res!140659) b!169135))

(assert (= (and b!169135 res!140660) b!169136))

(assert (= start!37234 b!169137))

(declare-fun m!268707 () Bool)

(assert (=> start!37234 m!268707))

(declare-fun m!268709 () Bool)

(assert (=> start!37234 m!268709))

(declare-fun m!268711 () Bool)

(assert (=> start!37234 m!268711))

(declare-fun m!268713 () Bool)

(assert (=> b!169135 m!268713))

(declare-fun m!268715 () Bool)

(assert (=> b!169135 m!268715))

(declare-fun m!268717 () Bool)

(assert (=> b!169137 m!268717))

(push 1)

(assert (not start!37234))

(assert (not b!169137))

(assert (not b!169135))

(check-sat)

(pop 1)

(push 1)

(check-sat)

