; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37288 () Bool)

(assert start!37288)

(declare-fun b!169383 () Bool)

(declare-fun e!117940 () Bool)

(declare-datatypes ((array!8943 0))(
  ( (array!8944 (arr!4882 (Array (_ BitVec 32) (_ BitVec 8))) (size!3958 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7072 0))(
  ( (BitStream!7073 (buf!4410 array!8943) (currentByte!8394 (_ BitVec 32)) (currentBit!8389 (_ BitVec 32))) )
))
(declare-fun thiss!1565 () BitStream!7072)

(declare-fun array_inv!3699 (array!8943) Bool)

(assert (=> b!169383 (= e!117940 (array_inv!3699 (buf!4410 thiss!1565)))))

(declare-fun b!169380 () Bool)

(declare-fun res!140815 () Bool)

(declare-fun e!117941 () Bool)

(assert (=> b!169380 (=> (not res!140815) (not e!117941))))

(declare-fun nBits!499 () (_ BitVec 64))

(declare-fun fromArr1!3 () (_ BitVec 64))

(declare-fun arr2!28 () array!8943)

(declare-fun fromArr2!3 () (_ BitVec 64))

(declare-fun arr1!28 () array!8943)

(declare-datatypes ((List!923 0))(
  ( (Nil!920) (Cons!919 (h!1038 Bool) (t!1742 List!923)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!7072 array!8943 (_ BitVec 64) (_ BitVec 64)) List!923)

(assert (=> b!169380 (= res!140815 (= (byteArrayBitContentToList!0 thiss!1565 arr2!28 fromArr2!3 nBits!499) (byteArrayBitContentToList!0 thiss!1565 arr1!28 fromArr1!3 nBits!499)))))

(declare-fun b!169382 () Bool)

(assert (=> b!169382 (= e!117941 false)))

(declare-datatypes ((Unit!11837 0))(
  ( (Unit!11838) )
))
(declare-fun lt!262222 () Unit!11837)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!7072 array!8943 array!8943 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!11837)

(assert (=> b!169382 (= lt!262222 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 thiss!1565 arr1!28 arr2!28 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr1!3) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr2!3) (bvsub nBits!499 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!169381 () Bool)

(declare-fun res!140814 () Bool)

(assert (=> b!169381 (=> (not res!140814) (not e!117941))))

(assert (=> b!169381 (= res!140814 (bvsgt nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!140816 () Bool)

(assert (=> start!37288 (=> (not res!140816) (not e!117941))))

(assert (=> start!37288 (= res!140816 (and (bvsge fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt fromArr1!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvslt fromArr2!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvsle (bvadd fromArr1!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3958 arr1!28)))) (bvsle (bvadd fromArr2!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3958 arr2!28))))))))

(assert (=> start!37288 e!117941))

(assert (=> start!37288 true))

(assert (=> start!37288 (array_inv!3699 arr2!28)))

(assert (=> start!37288 (array_inv!3699 arr1!28)))

(declare-fun inv!12 (BitStream!7072) Bool)

(assert (=> start!37288 (and (inv!12 thiss!1565) e!117940)))

(assert (= (and start!37288 res!140816) b!169380))

(assert (= (and b!169380 res!140815) b!169381))

(assert (= (and b!169381 res!140814) b!169382))

(assert (= start!37288 b!169383))

(declare-fun m!269037 () Bool)

(assert (=> b!169383 m!269037))

(declare-fun m!269039 () Bool)

(assert (=> b!169380 m!269039))

(declare-fun m!269041 () Bool)

(assert (=> b!169380 m!269041))

(declare-fun m!269043 () Bool)

(assert (=> b!169382 m!269043))

(declare-fun m!269045 () Bool)

(assert (=> start!37288 m!269045))

(declare-fun m!269047 () Bool)

(assert (=> start!37288 m!269047))

(declare-fun m!269049 () Bool)

(assert (=> start!37288 m!269049))

(push 1)

(assert (not b!169380))

(assert (not start!37288))

(assert (not b!169382))

(assert (not b!169383))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

