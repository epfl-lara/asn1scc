; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37266 () Bool)

(assert start!37266)

(declare-fun b!169250 () Bool)

(declare-fun e!117773 () Bool)

(assert (=> b!169250 (= e!117773 false)))

(declare-fun nBits!499 () (_ BitVec 64))

(declare-fun fromArr1!3 () (_ BitVec 64))

(declare-datatypes ((Unit!11815 0))(
  ( (Unit!11816) )
))
(declare-fun lt!262189 () Unit!11815)

(declare-datatypes ((array!8921 0))(
  ( (array!8922 (arr!4871 (Array (_ BitVec 32) (_ BitVec 8))) (size!3947 (_ BitVec 32))) )
))
(declare-fun arr2!28 () array!8921)

(declare-fun fromArr2!3 () (_ BitVec 64))

(declare-fun arr1!28 () array!8921)

(declare-datatypes ((BitStream!7050 0))(
  ( (BitStream!7051 (buf!4399 array!8921) (currentByte!8383 (_ BitVec 32)) (currentBit!8378 (_ BitVec 32))) )
))
(declare-fun thiss!1565 () BitStream!7050)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!7050 array!8921 array!8921 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!11815)

(assert (=> b!169250 (= lt!262189 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 thiss!1565 arr1!28 arr2!28 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr1!3) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr2!3) (bvsub nBits!499 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!169248 () Bool)

(declare-fun res!140717 () Bool)

(assert (=> b!169248 (=> (not res!140717) (not e!117773))))

(declare-datatypes ((List!912 0))(
  ( (Nil!909) (Cons!908 (h!1027 Bool) (t!1731 List!912)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!7050 array!8921 (_ BitVec 64) (_ BitVec 64)) List!912)

(assert (=> b!169248 (= res!140717 (= (byteArrayBitContentToList!0 thiss!1565 arr2!28 fromArr2!3 nBits!499) (byteArrayBitContentToList!0 thiss!1565 arr1!28 fromArr1!3 nBits!499)))))

(declare-fun b!169251 () Bool)

(declare-fun e!117774 () Bool)

(declare-fun array_inv!3688 (array!8921) Bool)

(assert (=> b!169251 (= e!117774 (array_inv!3688 (buf!4399 thiss!1565)))))

(declare-fun b!169249 () Bool)

(declare-fun res!140715 () Bool)

(assert (=> b!169249 (=> (not res!140715) (not e!117773))))

(assert (=> b!169249 (= res!140715 (bvsgt nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!140716 () Bool)

(assert (=> start!37266 (=> (not res!140716) (not e!117773))))

(assert (=> start!37266 (= res!140716 (and (bvsge fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt fromArr1!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvslt fromArr2!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvsle (bvadd fromArr1!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3947 arr1!28)))) (bvsle (bvadd fromArr2!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3947 arr2!28))))))))

(assert (=> start!37266 e!117773))

(assert (=> start!37266 true))

(assert (=> start!37266 (array_inv!3688 arr2!28)))

(assert (=> start!37266 (array_inv!3688 arr1!28)))

(declare-fun inv!12 (BitStream!7050) Bool)

(assert (=> start!37266 (and (inv!12 thiss!1565) e!117774)))

(assert (= (and start!37266 res!140716) b!169248))

(assert (= (and b!169248 res!140717) b!169249))

(assert (= (and b!169249 res!140715) b!169250))

(assert (= start!37266 b!169251))

(declare-fun m!268883 () Bool)

(assert (=> b!169250 m!268883))

(declare-fun m!268885 () Bool)

(assert (=> b!169248 m!268885))

(declare-fun m!268887 () Bool)

(assert (=> b!169248 m!268887))

(declare-fun m!268889 () Bool)

(assert (=> b!169251 m!268889))

(declare-fun m!268891 () Bool)

(assert (=> start!37266 m!268891))

(declare-fun m!268893 () Bool)

(assert (=> start!37266 m!268893))

(declare-fun m!268895 () Bool)

(assert (=> start!37266 m!268895))

(check-sat (not b!169248) (not b!169251) (not b!169250) (not start!37266))
