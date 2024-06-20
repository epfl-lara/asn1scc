; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37290 () Bool)

(assert start!37290)

(declare-fun b!169394 () Bool)

(declare-fun e!117953 () Bool)

(assert (=> b!169394 (= e!117953 false)))

(declare-fun nBits!499 () (_ BitVec 64))

(declare-fun fromArr1!3 () (_ BitVec 64))

(declare-datatypes ((array!8945 0))(
  ( (array!8946 (arr!4883 (Array (_ BitVec 32) (_ BitVec 8))) (size!3959 (_ BitVec 32))) )
))
(declare-fun arr2!28 () array!8945)

(declare-datatypes ((Unit!11839 0))(
  ( (Unit!11840) )
))
(declare-fun lt!262225 () Unit!11839)

(declare-fun fromArr2!3 () (_ BitVec 64))

(declare-fun arr1!28 () array!8945)

(declare-datatypes ((BitStream!7074 0))(
  ( (BitStream!7075 (buf!4411 array!8945) (currentByte!8395 (_ BitVec 32)) (currentBit!8390 (_ BitVec 32))) )
))
(declare-fun thiss!1565 () BitStream!7074)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!7074 array!8945 array!8945 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!11839)

(assert (=> b!169394 (= lt!262225 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 thiss!1565 arr1!28 arr2!28 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr1!3) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr2!3) (bvsub nBits!499 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun res!140825 () Bool)

(assert (=> start!37290 (=> (not res!140825) (not e!117953))))

(assert (=> start!37290 (= res!140825 (and (bvsge fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt fromArr1!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvslt fromArr2!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvsle (bvadd fromArr1!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3959 arr1!28)))) (bvsle (bvadd fromArr2!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3959 arr2!28))))))))

(assert (=> start!37290 e!117953))

(assert (=> start!37290 true))

(declare-fun array_inv!3700 (array!8945) Bool)

(assert (=> start!37290 (array_inv!3700 arr2!28)))

(assert (=> start!37290 (array_inv!3700 arr1!28)))

(declare-fun e!117955 () Bool)

(declare-fun inv!12 (BitStream!7074) Bool)

(assert (=> start!37290 (and (inv!12 thiss!1565) e!117955)))

(declare-fun b!169392 () Bool)

(declare-fun res!140823 () Bool)

(assert (=> b!169392 (=> (not res!140823) (not e!117953))))

(declare-datatypes ((List!924 0))(
  ( (Nil!921) (Cons!920 (h!1039 Bool) (t!1743 List!924)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!7074 array!8945 (_ BitVec 64) (_ BitVec 64)) List!924)

(assert (=> b!169392 (= res!140823 (= (byteArrayBitContentToList!0 thiss!1565 arr2!28 fromArr2!3 nBits!499) (byteArrayBitContentToList!0 thiss!1565 arr1!28 fromArr1!3 nBits!499)))))

(declare-fun b!169395 () Bool)

(assert (=> b!169395 (= e!117955 (array_inv!3700 (buf!4411 thiss!1565)))))

(declare-fun b!169393 () Bool)

(declare-fun res!140824 () Bool)

(assert (=> b!169393 (=> (not res!140824) (not e!117953))))

(assert (=> b!169393 (= res!140824 (bvsgt nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!37290 res!140825) b!169392))

(assert (= (and b!169392 res!140823) b!169393))

(assert (= (and b!169393 res!140824) b!169394))

(assert (= start!37290 b!169395))

(declare-fun m!269051 () Bool)

(assert (=> b!169394 m!269051))

(declare-fun m!269053 () Bool)

(assert (=> start!37290 m!269053))

(declare-fun m!269055 () Bool)

(assert (=> start!37290 m!269055))

(declare-fun m!269057 () Bool)

(assert (=> start!37290 m!269057))

(declare-fun m!269059 () Bool)

(assert (=> b!169392 m!269059))

(declare-fun m!269061 () Bool)

(assert (=> b!169392 m!269061))

(declare-fun m!269063 () Bool)

(assert (=> b!169395 m!269063))

(check-sat (not b!169394) (not b!169395) (not b!169392) (not start!37290))
