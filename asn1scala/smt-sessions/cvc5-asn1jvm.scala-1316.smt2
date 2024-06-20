; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37294 () Bool)

(assert start!37294)

(declare-fun b!169418 () Bool)

(declare-fun e!117983 () Bool)

(assert (=> b!169418 (= e!117983 false)))

(declare-fun nBits!499 () (_ BitVec 64))

(declare-fun fromArr1!3 () (_ BitVec 64))

(declare-datatypes ((array!8949 0))(
  ( (array!8950 (arr!4885 (Array (_ BitVec 32) (_ BitVec 8))) (size!3961 (_ BitVec 32))) )
))
(declare-fun arr2!28 () array!8949)

(declare-datatypes ((Unit!11843 0))(
  ( (Unit!11844) )
))
(declare-fun lt!262231 () Unit!11843)

(declare-fun fromArr2!3 () (_ BitVec 64))

(declare-fun arr1!28 () array!8949)

(declare-datatypes ((BitStream!7078 0))(
  ( (BitStream!7079 (buf!4413 array!8949) (currentByte!8397 (_ BitVec 32)) (currentBit!8392 (_ BitVec 32))) )
))
(declare-fun thiss!1565 () BitStream!7078)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!7078 array!8949 array!8949 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!11843)

(assert (=> b!169418 (= lt!262231 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 thiss!1565 arr1!28 arr2!28 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr1!3) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr2!3) (bvsub nBits!499 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!169417 () Bool)

(declare-fun res!140841 () Bool)

(assert (=> b!169417 (=> (not res!140841) (not e!117983))))

(assert (=> b!169417 (= res!140841 (bvsgt nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!140842 () Bool)

(assert (=> start!37294 (=> (not res!140842) (not e!117983))))

(assert (=> start!37294 (= res!140842 (and (bvsge fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt fromArr1!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvslt fromArr2!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvsle (bvadd fromArr1!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3961 arr1!28)))) (bvsle (bvadd fromArr2!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3961 arr2!28))))))))

(assert (=> start!37294 e!117983))

(assert (=> start!37294 true))

(declare-fun array_inv!3702 (array!8949) Bool)

(assert (=> start!37294 (array_inv!3702 arr2!28)))

(assert (=> start!37294 (array_inv!3702 arr1!28)))

(declare-fun e!117985 () Bool)

(declare-fun inv!12 (BitStream!7078) Bool)

(assert (=> start!37294 (and (inv!12 thiss!1565) e!117985)))

(declare-fun b!169416 () Bool)

(declare-fun res!140843 () Bool)

(assert (=> b!169416 (=> (not res!140843) (not e!117983))))

(declare-datatypes ((List!926 0))(
  ( (Nil!923) (Cons!922 (h!1041 Bool) (t!1745 List!926)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!7078 array!8949 (_ BitVec 64) (_ BitVec 64)) List!926)

(assert (=> b!169416 (= res!140843 (= (byteArrayBitContentToList!0 thiss!1565 arr2!28 fromArr2!3 nBits!499) (byteArrayBitContentToList!0 thiss!1565 arr1!28 fromArr1!3 nBits!499)))))

(declare-fun b!169419 () Bool)

(assert (=> b!169419 (= e!117985 (array_inv!3702 (buf!4413 thiss!1565)))))

(assert (= (and start!37294 res!140842) b!169416))

(assert (= (and b!169416 res!140843) b!169417))

(assert (= (and b!169417 res!140841) b!169418))

(assert (= start!37294 b!169419))

(declare-fun m!269079 () Bool)

(assert (=> b!169418 m!269079))

(declare-fun m!269081 () Bool)

(assert (=> start!37294 m!269081))

(declare-fun m!269083 () Bool)

(assert (=> start!37294 m!269083))

(declare-fun m!269085 () Bool)

(assert (=> start!37294 m!269085))

(declare-fun m!269087 () Bool)

(assert (=> b!169416 m!269087))

(declare-fun m!269089 () Bool)

(assert (=> b!169416 m!269089))

(declare-fun m!269091 () Bool)

(assert (=> b!169419 m!269091))

(push 1)

(assert (not b!169418))

(assert (not start!37294))

(assert (not b!169419))

(assert (not b!169416))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

