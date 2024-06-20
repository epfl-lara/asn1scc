; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37298 () Bool)

(assert start!37298)

(declare-fun b!169443 () Bool)

(declare-fun e!118014 () Bool)

(declare-datatypes ((array!8953 0))(
  ( (array!8954 (arr!4887 (Array (_ BitVec 32) (_ BitVec 8))) (size!3963 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7082 0))(
  ( (BitStream!7083 (buf!4415 array!8953) (currentByte!8399 (_ BitVec 32)) (currentBit!8394 (_ BitVec 32))) )
))
(declare-fun thiss!1565 () BitStream!7082)

(declare-fun array_inv!3704 (array!8953) Bool)

(assert (=> b!169443 (= e!118014 (array_inv!3704 (buf!4415 thiss!1565)))))

(declare-fun b!169440 () Bool)

(declare-fun res!140859 () Bool)

(declare-fun e!118015 () Bool)

(assert (=> b!169440 (=> (not res!140859) (not e!118015))))

(declare-fun nBits!499 () (_ BitVec 64))

(declare-fun fromArr1!3 () (_ BitVec 64))

(declare-fun arr2!28 () array!8953)

(declare-fun fromArr2!3 () (_ BitVec 64))

(declare-fun arr1!28 () array!8953)

(declare-datatypes ((List!928 0))(
  ( (Nil!925) (Cons!924 (h!1043 Bool) (t!1747 List!928)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!7082 array!8953 (_ BitVec 64) (_ BitVec 64)) List!928)

(assert (=> b!169440 (= res!140859 (= (byteArrayBitContentToList!0 thiss!1565 arr2!28 fromArr2!3 nBits!499) (byteArrayBitContentToList!0 thiss!1565 arr1!28 fromArr1!3 nBits!499)))))

(declare-fun res!140861 () Bool)

(assert (=> start!37298 (=> (not res!140861) (not e!118015))))

(assert (=> start!37298 (= res!140861 (and (bvsge fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt fromArr1!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvslt fromArr2!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvsle (bvadd fromArr1!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3963 arr1!28)))) (bvsle (bvadd fromArr2!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3963 arr2!28))))))))

(assert (=> start!37298 e!118015))

(assert (=> start!37298 true))

(assert (=> start!37298 (array_inv!3704 arr2!28)))

(assert (=> start!37298 (array_inv!3704 arr1!28)))

(declare-fun inv!12 (BitStream!7082) Bool)

(assert (=> start!37298 (and (inv!12 thiss!1565) e!118014)))

(declare-fun b!169441 () Bool)

(declare-fun res!140860 () Bool)

(assert (=> b!169441 (=> (not res!140860) (not e!118015))))

(assert (=> b!169441 (= res!140860 (bvsgt nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!169442 () Bool)

(assert (=> b!169442 (= e!118015 false)))

(declare-datatypes ((Unit!11847 0))(
  ( (Unit!11848) )
))
(declare-fun lt!262237 () Unit!11847)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!7082 array!8953 array!8953 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!11847)

(assert (=> b!169442 (= lt!262237 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 thiss!1565 arr1!28 arr2!28 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr1!3) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr2!3) (bvsub nBits!499 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and start!37298 res!140861) b!169440))

(assert (= (and b!169440 res!140859) b!169441))

(assert (= (and b!169441 res!140860) b!169442))

(assert (= start!37298 b!169443))

(declare-fun m!269107 () Bool)

(assert (=> b!169443 m!269107))

(declare-fun m!269109 () Bool)

(assert (=> b!169440 m!269109))

(declare-fun m!269111 () Bool)

(assert (=> b!169440 m!269111))

(declare-fun m!269113 () Bool)

(assert (=> start!37298 m!269113))

(declare-fun m!269115 () Bool)

(assert (=> start!37298 m!269115))

(declare-fun m!269117 () Bool)

(assert (=> start!37298 m!269117))

(declare-fun m!269119 () Bool)

(assert (=> b!169442 m!269119))

(push 1)

(assert (not b!169442))

(assert (not start!37298))

(assert (not b!169443))

(assert (not b!169440))

(check-sat)

(pop 1)

