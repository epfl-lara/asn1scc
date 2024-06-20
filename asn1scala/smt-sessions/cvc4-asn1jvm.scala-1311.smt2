; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37268 () Bool)

(assert start!37268)

(declare-fun b!169260 () Bool)

(declare-fun res!140724 () Bool)

(declare-fun e!117788 () Bool)

(assert (=> b!169260 (=> (not res!140724) (not e!117788))))

(declare-fun nBits!499 () (_ BitVec 64))

(declare-fun fromArr1!3 () (_ BitVec 64))

(declare-datatypes ((array!8923 0))(
  ( (array!8924 (arr!4872 (Array (_ BitVec 32) (_ BitVec 8))) (size!3948 (_ BitVec 32))) )
))
(declare-fun arr2!28 () array!8923)

(declare-fun fromArr2!3 () (_ BitVec 64))

(declare-fun arr1!28 () array!8923)

(declare-datatypes ((BitStream!7052 0))(
  ( (BitStream!7053 (buf!4400 array!8923) (currentByte!8384 (_ BitVec 32)) (currentBit!8379 (_ BitVec 32))) )
))
(declare-fun thiss!1565 () BitStream!7052)

(declare-datatypes ((List!913 0))(
  ( (Nil!910) (Cons!909 (h!1028 Bool) (t!1732 List!913)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!7052 array!8923 (_ BitVec 64) (_ BitVec 64)) List!913)

(assert (=> b!169260 (= res!140724 (= (byteArrayBitContentToList!0 thiss!1565 arr2!28 fromArr2!3 nBits!499) (byteArrayBitContentToList!0 thiss!1565 arr1!28 fromArr1!3 nBits!499)))))

(declare-fun res!140725 () Bool)

(assert (=> start!37268 (=> (not res!140725) (not e!117788))))

(assert (=> start!37268 (= res!140725 (and (bvsge fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt fromArr1!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvslt fromArr2!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvsle (bvadd fromArr1!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3948 arr1!28)))) (bvsle (bvadd fromArr2!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3948 arr2!28))))))))

(assert (=> start!37268 e!117788))

(assert (=> start!37268 true))

(declare-fun array_inv!3689 (array!8923) Bool)

(assert (=> start!37268 (array_inv!3689 arr2!28)))

(assert (=> start!37268 (array_inv!3689 arr1!28)))

(declare-fun e!117789 () Bool)

(declare-fun inv!12 (BitStream!7052) Bool)

(assert (=> start!37268 (and (inv!12 thiss!1565) e!117789)))

(declare-fun b!169263 () Bool)

(assert (=> b!169263 (= e!117789 (array_inv!3689 (buf!4400 thiss!1565)))))

(declare-fun b!169262 () Bool)

(assert (=> b!169262 (= e!117788 false)))

(declare-datatypes ((Unit!11817 0))(
  ( (Unit!11818) )
))
(declare-fun lt!262192 () Unit!11817)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!7052 array!8923 array!8923 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!11817)

(assert (=> b!169262 (= lt!262192 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 thiss!1565 arr1!28 arr2!28 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr1!3) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr2!3) (bvsub nBits!499 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!169261 () Bool)

(declare-fun res!140726 () Bool)

(assert (=> b!169261 (=> (not res!140726) (not e!117788))))

(assert (=> b!169261 (= res!140726 (bvsgt nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!37268 res!140725) b!169260))

(assert (= (and b!169260 res!140724) b!169261))

(assert (= (and b!169261 res!140726) b!169262))

(assert (= start!37268 b!169263))

(declare-fun m!268897 () Bool)

(assert (=> b!169260 m!268897))

(declare-fun m!268899 () Bool)

(assert (=> b!169260 m!268899))

(declare-fun m!268901 () Bool)

(assert (=> start!37268 m!268901))

(declare-fun m!268903 () Bool)

(assert (=> start!37268 m!268903))

(declare-fun m!268905 () Bool)

(assert (=> start!37268 m!268905))

(declare-fun m!268907 () Bool)

(assert (=> b!169263 m!268907))

(declare-fun m!268909 () Bool)

(assert (=> b!169262 m!268909))

(push 1)

(assert (not b!169262))

(assert (not start!37268))

(assert (not b!169260))

(assert (not b!169263))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

