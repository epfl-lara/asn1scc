; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37300 () Bool)

(assert start!37300)

(declare-fun b!169455 () Bool)

(declare-fun e!118029 () Bool)

(declare-datatypes ((array!8955 0))(
  ( (array!8956 (arr!4888 (Array (_ BitVec 32) (_ BitVec 8))) (size!3964 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7084 0))(
  ( (BitStream!7085 (buf!4416 array!8955) (currentByte!8400 (_ BitVec 32)) (currentBit!8395 (_ BitVec 32))) )
))
(declare-fun thiss!1565 () BitStream!7084)

(declare-fun array_inv!3705 (array!8955) Bool)

(assert (=> b!169455 (= e!118029 (array_inv!3705 (buf!4416 thiss!1565)))))

(declare-fun b!169454 () Bool)

(declare-fun e!118032 () Bool)

(assert (=> b!169454 (= e!118032 false)))

(declare-fun nBits!499 () (_ BitVec 64))

(declare-datatypes ((Unit!11849 0))(
  ( (Unit!11850) )
))
(declare-fun lt!262240 () Unit!11849)

(declare-fun fromArr1!3 () (_ BitVec 64))

(declare-fun arr2!28 () array!8955)

(declare-fun fromArr2!3 () (_ BitVec 64))

(declare-fun arr1!28 () array!8955)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!7084 array!8955 array!8955 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!11849)

(assert (=> b!169454 (= lt!262240 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 thiss!1565 arr1!28 arr2!28 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr1!3) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr2!3) (bvsub nBits!499 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!169452 () Bool)

(declare-fun res!140868 () Bool)

(assert (=> b!169452 (=> (not res!140868) (not e!118032))))

(declare-datatypes ((List!929 0))(
  ( (Nil!926) (Cons!925 (h!1044 Bool) (t!1748 List!929)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!7084 array!8955 (_ BitVec 64) (_ BitVec 64)) List!929)

(assert (=> b!169452 (= res!140868 (= (byteArrayBitContentToList!0 thiss!1565 arr2!28 fromArr2!3 nBits!499) (byteArrayBitContentToList!0 thiss!1565 arr1!28 fromArr1!3 nBits!499)))))

(declare-fun b!169453 () Bool)

(declare-fun res!140869 () Bool)

(assert (=> b!169453 (=> (not res!140869) (not e!118032))))

(assert (=> b!169453 (= res!140869 (bvsgt nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!140870 () Bool)

(assert (=> start!37300 (=> (not res!140870) (not e!118032))))

(assert (=> start!37300 (= res!140870 (and (bvsge fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt fromArr1!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvslt fromArr2!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvsle (bvadd fromArr1!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3964 arr1!28)))) (bvsle (bvadd fromArr2!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3964 arr2!28))))))))

(assert (=> start!37300 e!118032))

(assert (=> start!37300 true))

(assert (=> start!37300 (array_inv!3705 arr2!28)))

(assert (=> start!37300 (array_inv!3705 arr1!28)))

(declare-fun inv!12 (BitStream!7084) Bool)

(assert (=> start!37300 (and (inv!12 thiss!1565) e!118029)))

(assert (= (and start!37300 res!140870) b!169452))

(assert (= (and b!169452 res!140868) b!169453))

(assert (= (and b!169453 res!140869) b!169454))

(assert (= start!37300 b!169455))

(declare-fun m!269121 () Bool)

(assert (=> b!169455 m!269121))

(declare-fun m!269123 () Bool)

(assert (=> b!169454 m!269123))

(declare-fun m!269125 () Bool)

(assert (=> b!169452 m!269125))

(declare-fun m!269127 () Bool)

(assert (=> b!169452 m!269127))

(declare-fun m!269129 () Bool)

(assert (=> start!37300 m!269129))

(declare-fun m!269131 () Bool)

(assert (=> start!37300 m!269131))

(declare-fun m!269133 () Bool)

(assert (=> start!37300 m!269133))

(push 1)

(assert (not b!169452))

(assert (not b!169454))

(assert (not start!37300))

(assert (not b!169455))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

