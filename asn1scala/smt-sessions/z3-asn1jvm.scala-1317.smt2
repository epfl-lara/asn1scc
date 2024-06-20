; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37302 () Bool)

(assert start!37302)

(declare-fun res!140878 () Bool)

(declare-fun e!118043 () Bool)

(assert (=> start!37302 (=> (not res!140878) (not e!118043))))

(declare-fun nBits!499 () (_ BitVec 64))

(declare-fun fromArr1!3 () (_ BitVec 64))

(declare-datatypes ((array!8957 0))(
  ( (array!8958 (arr!4889 (Array (_ BitVec 32) (_ BitVec 8))) (size!3965 (_ BitVec 32))) )
))
(declare-fun arr1!28 () array!8957)

(declare-fun arr2!28 () array!8957)

(declare-fun fromArr2!3 () (_ BitVec 64))

(assert (=> start!37302 (= res!140878 (and (bvsge fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt fromArr1!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvslt fromArr2!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvsle (bvadd fromArr1!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3965 arr1!28)))) (bvsle (bvadd fromArr2!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3965 arr2!28))))))))

(assert (=> start!37302 e!118043))

(assert (=> start!37302 true))

(declare-fun array_inv!3706 (array!8957) Bool)

(assert (=> start!37302 (array_inv!3706 arr2!28)))

(assert (=> start!37302 (array_inv!3706 arr1!28)))

(declare-datatypes ((BitStream!7086 0))(
  ( (BitStream!7087 (buf!4417 array!8957) (currentByte!8401 (_ BitVec 32)) (currentBit!8396 (_ BitVec 32))) )
))
(declare-fun thiss!1565 () BitStream!7086)

(declare-fun e!118045 () Bool)

(declare-fun inv!12 (BitStream!7086) Bool)

(assert (=> start!37302 (and (inv!12 thiss!1565) e!118045)))

(declare-fun b!169466 () Bool)

(assert (=> b!169466 (= e!118043 false)))

(declare-datatypes ((Unit!11851 0))(
  ( (Unit!11852) )
))
(declare-fun lt!262243 () Unit!11851)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!7086 array!8957 array!8957 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!11851)

(assert (=> b!169466 (= lt!262243 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 thiss!1565 arr1!28 arr2!28 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr1!3) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr2!3) (bvsub nBits!499 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!169464 () Bool)

(declare-fun res!140877 () Bool)

(assert (=> b!169464 (=> (not res!140877) (not e!118043))))

(declare-datatypes ((List!930 0))(
  ( (Nil!927) (Cons!926 (h!1045 Bool) (t!1749 List!930)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!7086 array!8957 (_ BitVec 64) (_ BitVec 64)) List!930)

(assert (=> b!169464 (= res!140877 (= (byteArrayBitContentToList!0 thiss!1565 arr2!28 fromArr2!3 nBits!499) (byteArrayBitContentToList!0 thiss!1565 arr1!28 fromArr1!3 nBits!499)))))

(declare-fun b!169465 () Bool)

(declare-fun res!140879 () Bool)

(assert (=> b!169465 (=> (not res!140879) (not e!118043))))

(assert (=> b!169465 (= res!140879 (bvsgt nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!169467 () Bool)

(assert (=> b!169467 (= e!118045 (array_inv!3706 (buf!4417 thiss!1565)))))

(assert (= (and start!37302 res!140878) b!169464))

(assert (= (and b!169464 res!140877) b!169465))

(assert (= (and b!169465 res!140879) b!169466))

(assert (= start!37302 b!169467))

(declare-fun m!269135 () Bool)

(assert (=> start!37302 m!269135))

(declare-fun m!269137 () Bool)

(assert (=> start!37302 m!269137))

(declare-fun m!269139 () Bool)

(assert (=> start!37302 m!269139))

(declare-fun m!269141 () Bool)

(assert (=> b!169466 m!269141))

(declare-fun m!269143 () Bool)

(assert (=> b!169464 m!269143))

(declare-fun m!269145 () Bool)

(assert (=> b!169464 m!269145))

(declare-fun m!269147 () Bool)

(assert (=> b!169467 m!269147))

(check-sat (not b!169466) (not start!37302) (not b!169467) (not b!169464))
