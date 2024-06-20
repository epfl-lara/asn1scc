; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37292 () Bool)

(assert start!37292)

(declare-fun b!169405 () Bool)

(declare-fun res!140833 () Bool)

(declare-fun e!117968 () Bool)

(assert (=> b!169405 (=> (not res!140833) (not e!117968))))

(declare-fun nBits!499 () (_ BitVec 64))

(assert (=> b!169405 (= res!140833 (bvsgt nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!169406 () Bool)

(assert (=> b!169406 (= e!117968 false)))

(declare-datatypes ((Unit!11841 0))(
  ( (Unit!11842) )
))
(declare-fun lt!262228 () Unit!11841)

(declare-fun fromArr1!3 () (_ BitVec 64))

(declare-datatypes ((array!8947 0))(
  ( (array!8948 (arr!4884 (Array (_ BitVec 32) (_ BitVec 8))) (size!3960 (_ BitVec 32))) )
))
(declare-fun arr2!28 () array!8947)

(declare-fun fromArr2!3 () (_ BitVec 64))

(declare-fun arr1!28 () array!8947)

(declare-datatypes ((BitStream!7076 0))(
  ( (BitStream!7077 (buf!4412 array!8947) (currentByte!8396 (_ BitVec 32)) (currentBit!8391 (_ BitVec 32))) )
))
(declare-fun thiss!1565 () BitStream!7076)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!7076 array!8947 array!8947 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!11841)

(assert (=> b!169406 (= lt!262228 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 thiss!1565 arr1!28 arr2!28 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr1!3) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr2!3) (bvsub nBits!499 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!169404 () Bool)

(declare-fun res!140834 () Bool)

(assert (=> b!169404 (=> (not res!140834) (not e!117968))))

(declare-datatypes ((List!925 0))(
  ( (Nil!922) (Cons!921 (h!1040 Bool) (t!1744 List!925)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!7076 array!8947 (_ BitVec 64) (_ BitVec 64)) List!925)

(assert (=> b!169404 (= res!140834 (= (byteArrayBitContentToList!0 thiss!1565 arr2!28 fromArr2!3 nBits!499) (byteArrayBitContentToList!0 thiss!1565 arr1!28 fromArr1!3 nBits!499)))))

(declare-fun res!140832 () Bool)

(assert (=> start!37292 (=> (not res!140832) (not e!117968))))

(assert (=> start!37292 (= res!140832 (and (bvsge fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt fromArr1!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvslt fromArr2!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvsle (bvadd fromArr1!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3960 arr1!28)))) (bvsle (bvadd fromArr2!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3960 arr2!28))))))))

(assert (=> start!37292 e!117968))

(assert (=> start!37292 true))

(declare-fun array_inv!3701 (array!8947) Bool)

(assert (=> start!37292 (array_inv!3701 arr2!28)))

(assert (=> start!37292 (array_inv!3701 arr1!28)))

(declare-fun e!117970 () Bool)

(declare-fun inv!12 (BitStream!7076) Bool)

(assert (=> start!37292 (and (inv!12 thiss!1565) e!117970)))

(declare-fun b!169407 () Bool)

(assert (=> b!169407 (= e!117970 (array_inv!3701 (buf!4412 thiss!1565)))))

(assert (= (and start!37292 res!140832) b!169404))

(assert (= (and b!169404 res!140834) b!169405))

(assert (= (and b!169405 res!140833) b!169406))

(assert (= start!37292 b!169407))

(declare-fun m!269065 () Bool)

(assert (=> b!169406 m!269065))

(declare-fun m!269067 () Bool)

(assert (=> b!169404 m!269067))

(declare-fun m!269069 () Bool)

(assert (=> b!169404 m!269069))

(declare-fun m!269071 () Bool)

(assert (=> start!37292 m!269071))

(declare-fun m!269073 () Bool)

(assert (=> start!37292 m!269073))

(declare-fun m!269075 () Bool)

(assert (=> start!37292 m!269075))

(declare-fun m!269077 () Bool)

(assert (=> b!169407 m!269077))

(push 1)

(assert (not b!169404))

(assert (not start!37292))

(assert (not b!169406))

(assert (not b!169407))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

