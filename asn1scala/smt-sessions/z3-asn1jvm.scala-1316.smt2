; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37296 () Bool)

(assert start!37296)

(declare-fun b!169429 () Bool)

(declare-fun res!140850 () Bool)

(declare-fun e!118002 () Bool)

(assert (=> b!169429 (=> (not res!140850) (not e!118002))))

(declare-fun nBits!499 () (_ BitVec 64))

(assert (=> b!169429 (= res!140850 (bvsgt nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!169431 () Bool)

(declare-fun e!117999 () Bool)

(declare-datatypes ((array!8951 0))(
  ( (array!8952 (arr!4886 (Array (_ BitVec 32) (_ BitVec 8))) (size!3962 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7080 0))(
  ( (BitStream!7081 (buf!4414 array!8951) (currentByte!8398 (_ BitVec 32)) (currentBit!8393 (_ BitVec 32))) )
))
(declare-fun thiss!1565 () BitStream!7080)

(declare-fun array_inv!3703 (array!8951) Bool)

(assert (=> b!169431 (= e!117999 (array_inv!3703 (buf!4414 thiss!1565)))))

(declare-fun b!169430 () Bool)

(assert (=> b!169430 (= e!118002 false)))

(declare-datatypes ((Unit!11845 0))(
  ( (Unit!11846) )
))
(declare-fun lt!262234 () Unit!11845)

(declare-fun fromArr1!3 () (_ BitVec 64))

(declare-fun arr2!28 () array!8951)

(declare-fun fromArr2!3 () (_ BitVec 64))

(declare-fun arr1!28 () array!8951)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!7080 array!8951 array!8951 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!11845)

(assert (=> b!169430 (= lt!262234 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 thiss!1565 arr1!28 arr2!28 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr1!3) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr2!3) (bvsub nBits!499 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!169428 () Bool)

(declare-fun res!140851 () Bool)

(assert (=> b!169428 (=> (not res!140851) (not e!118002))))

(declare-datatypes ((List!927 0))(
  ( (Nil!924) (Cons!923 (h!1042 Bool) (t!1746 List!927)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!7080 array!8951 (_ BitVec 64) (_ BitVec 64)) List!927)

(assert (=> b!169428 (= res!140851 (= (byteArrayBitContentToList!0 thiss!1565 arr2!28 fromArr2!3 nBits!499) (byteArrayBitContentToList!0 thiss!1565 arr1!28 fromArr1!3 nBits!499)))))

(declare-fun res!140852 () Bool)

(assert (=> start!37296 (=> (not res!140852) (not e!118002))))

(assert (=> start!37296 (= res!140852 (and (bvsge fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt fromArr1!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvslt fromArr2!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvsle (bvadd fromArr1!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3962 arr1!28)))) (bvsle (bvadd fromArr2!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3962 arr2!28))))))))

(assert (=> start!37296 e!118002))

(assert (=> start!37296 true))

(assert (=> start!37296 (array_inv!3703 arr2!28)))

(assert (=> start!37296 (array_inv!3703 arr1!28)))

(declare-fun inv!12 (BitStream!7080) Bool)

(assert (=> start!37296 (and (inv!12 thiss!1565) e!117999)))

(assert (= (and start!37296 res!140852) b!169428))

(assert (= (and b!169428 res!140851) b!169429))

(assert (= (and b!169429 res!140850) b!169430))

(assert (= start!37296 b!169431))

(declare-fun m!269093 () Bool)

(assert (=> b!169431 m!269093))

(declare-fun m!269095 () Bool)

(assert (=> b!169430 m!269095))

(declare-fun m!269097 () Bool)

(assert (=> b!169428 m!269097))

(declare-fun m!269099 () Bool)

(assert (=> b!169428 m!269099))

(declare-fun m!269101 () Bool)

(assert (=> start!37296 m!269101))

(declare-fun m!269103 () Bool)

(assert (=> start!37296 m!269103))

(declare-fun m!269105 () Bool)

(assert (=> start!37296 m!269105))

(check-sat (not b!169428) (not b!169430) (not start!37296) (not b!169431))
