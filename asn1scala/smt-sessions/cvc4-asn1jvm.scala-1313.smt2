; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37280 () Bool)

(assert start!37280)

(declare-fun b!169332 () Bool)

(declare-fun res!140779 () Bool)

(declare-fun e!117882 () Bool)

(assert (=> b!169332 (=> (not res!140779) (not e!117882))))

(declare-fun fromArr1!3 () (_ BitVec 64))

(declare-datatypes ((array!8935 0))(
  ( (array!8936 (arr!4878 (Array (_ BitVec 32) (_ BitVec 8))) (size!3954 (_ BitVec 32))) )
))
(declare-fun arr2!28 () array!8935)

(declare-fun fromArr2!3 () (_ BitVec 64))

(declare-fun nBits!499 () (_ BitVec 64))

(declare-fun arr1!28 () array!8935)

(declare-datatypes ((BitStream!7064 0))(
  ( (BitStream!7065 (buf!4406 array!8935) (currentByte!8390 (_ BitVec 32)) (currentBit!8385 (_ BitVec 32))) )
))
(declare-fun thiss!1565 () BitStream!7064)

(declare-datatypes ((List!919 0))(
  ( (Nil!916) (Cons!915 (h!1034 Bool) (t!1738 List!919)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!7064 array!8935 (_ BitVec 64) (_ BitVec 64)) List!919)

(assert (=> b!169332 (= res!140779 (= (byteArrayBitContentToList!0 thiss!1565 arr2!28 fromArr2!3 nBits!499) (byteArrayBitContentToList!0 thiss!1565 arr1!28 fromArr1!3 nBits!499)))))

(declare-fun b!169335 () Bool)

(declare-fun e!117879 () Bool)

(declare-fun array_inv!3695 (array!8935) Bool)

(assert (=> b!169335 (= e!117879 (array_inv!3695 (buf!4406 thiss!1565)))))

(declare-fun b!169334 () Bool)

(assert (=> b!169334 (= e!117882 false)))

(declare-datatypes ((Unit!11829 0))(
  ( (Unit!11830) )
))
(declare-fun lt!262210 () Unit!11829)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!7064 array!8935 array!8935 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!11829)

(assert (=> b!169334 (= lt!262210 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 thiss!1565 arr1!28 arr2!28 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr1!3) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr2!3) (bvsub nBits!499 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!169333 () Bool)

(declare-fun res!140780 () Bool)

(assert (=> b!169333 (=> (not res!140780) (not e!117882))))

(assert (=> b!169333 (= res!140780 (bvsgt nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!140778 () Bool)

(assert (=> start!37280 (=> (not res!140778) (not e!117882))))

(assert (=> start!37280 (= res!140778 (and (bvsge fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt fromArr1!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvslt fromArr2!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvsle (bvadd fromArr1!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3954 arr1!28)))) (bvsle (bvadd fromArr2!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3954 arr2!28))))))))

(assert (=> start!37280 e!117882))

(assert (=> start!37280 true))

(assert (=> start!37280 (array_inv!3695 arr2!28)))

(assert (=> start!37280 (array_inv!3695 arr1!28)))

(declare-fun inv!12 (BitStream!7064) Bool)

(assert (=> start!37280 (and (inv!12 thiss!1565) e!117879)))

(assert (= (and start!37280 res!140778) b!169332))

(assert (= (and b!169332 res!140779) b!169333))

(assert (= (and b!169333 res!140780) b!169334))

(assert (= start!37280 b!169335))

(declare-fun m!268981 () Bool)

(assert (=> b!169332 m!268981))

(declare-fun m!268983 () Bool)

(assert (=> b!169332 m!268983))

(declare-fun m!268985 () Bool)

(assert (=> b!169335 m!268985))

(declare-fun m!268987 () Bool)

(assert (=> b!169334 m!268987))

(declare-fun m!268989 () Bool)

(assert (=> start!37280 m!268989))

(declare-fun m!268991 () Bool)

(assert (=> start!37280 m!268991))

(declare-fun m!268993 () Bool)

(assert (=> start!37280 m!268993))

(push 1)

(assert (not b!169332))

(assert (not b!169334))

(assert (not start!37280))

(assert (not b!169335))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

