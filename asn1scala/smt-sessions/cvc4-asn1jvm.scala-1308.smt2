; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37232 () Bool)

(assert start!37232)

(declare-fun res!140653 () Bool)

(declare-fun e!117638 () Bool)

(assert (=> start!37232 (=> (not res!140653) (not e!117638))))

(declare-fun nBits!499 () (_ BitVec 64))

(declare-fun fromArr1!3 () (_ BitVec 64))

(declare-datatypes ((array!8902 0))(
  ( (array!8903 (arr!4860 (Array (_ BitVec 32) (_ BitVec 8))) (size!3939 (_ BitVec 32))) )
))
(declare-fun arr1!28 () array!8902)

(declare-fun fromArr2!3 () (_ BitVec 64))

(declare-fun arr2!28 () array!8902)

(assert (=> start!37232 (= res!140653 (and (bvsge fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt fromArr1!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvslt fromArr2!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvsle (bvadd fromArr1!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3939 arr1!28)))) (bvsle (bvadd fromArr2!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3939 arr2!28))))))))

(assert (=> start!37232 e!117638))

(assert (=> start!37232 true))

(declare-fun array_inv!3680 (array!8902) Bool)

(assert (=> start!37232 (array_inv!3680 arr2!28)))

(assert (=> start!37232 (array_inv!3680 arr1!28)))

(declare-datatypes ((BitStream!7034 0))(
  ( (BitStream!7035 (buf!4391 array!8902) (currentByte!8375 (_ BitVec 32)) (currentBit!8370 (_ BitVec 32))) )
))
(declare-fun thiss!1565 () BitStream!7034)

(declare-fun e!117637 () Bool)

(declare-fun inv!12 (BitStream!7034) Bool)

(assert (=> start!37232 (and (inv!12 thiss!1565) e!117637)))

(declare-fun b!169126 () Bool)

(declare-fun res!140654 () Bool)

(assert (=> b!169126 (=> (not res!140654) (not e!117638))))

(declare-datatypes ((List!904 0))(
  ( (Nil!901) (Cons!900 (h!1019 Bool) (t!1723 List!904)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!7034 array!8902 (_ BitVec 64) (_ BitVec 64)) List!904)

(assert (=> b!169126 (= res!140654 (= (byteArrayBitContentToList!0 thiss!1565 arr2!28 fromArr2!3 nBits!499) (byteArrayBitContentToList!0 thiss!1565 arr1!28 fromArr1!3 nBits!499)))))

(declare-fun b!169127 () Bool)

(assert (=> b!169127 (= e!117638 (and (bvsgt nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr1!3) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!169128 () Bool)

(assert (=> b!169128 (= e!117637 (array_inv!3680 (buf!4391 thiss!1565)))))

(assert (= (and start!37232 res!140653) b!169126))

(assert (= (and b!169126 res!140654) b!169127))

(assert (= start!37232 b!169128))

(declare-fun m!268695 () Bool)

(assert (=> start!37232 m!268695))

(declare-fun m!268697 () Bool)

(assert (=> start!37232 m!268697))

(declare-fun m!268699 () Bool)

(assert (=> start!37232 m!268699))

(declare-fun m!268701 () Bool)

(assert (=> b!169126 m!268701))

(declare-fun m!268703 () Bool)

(assert (=> b!169126 m!268703))

(declare-fun m!268705 () Bool)

(assert (=> b!169128 m!268705))

(push 1)

(assert (not start!37232))

(assert (not b!169128))

(assert (not b!169126))

(check-sat)

(pop 1)

(push 1)

(check-sat)

