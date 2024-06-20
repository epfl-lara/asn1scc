; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37284 () Bool)

(assert start!37284)

(declare-fun b!169357 () Bool)

(declare-fun res!140797 () Bool)

(declare-fun e!117910 () Bool)

(assert (=> b!169357 (=> (not res!140797) (not e!117910))))

(declare-fun nBits!499 () (_ BitVec 64))

(assert (=> b!169357 (= res!140797 (bvsgt nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!169359 () Bool)

(declare-fun e!117909 () Bool)

(declare-datatypes ((array!8939 0))(
  ( (array!8940 (arr!4880 (Array (_ BitVec 32) (_ BitVec 8))) (size!3956 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7068 0))(
  ( (BitStream!7069 (buf!4408 array!8939) (currentByte!8392 (_ BitVec 32)) (currentBit!8387 (_ BitVec 32))) )
))
(declare-fun thiss!1565 () BitStream!7068)

(declare-fun array_inv!3697 (array!8939) Bool)

(assert (=> b!169359 (= e!117909 (array_inv!3697 (buf!4408 thiss!1565)))))

(declare-fun b!169356 () Bool)

(declare-fun res!140796 () Bool)

(assert (=> b!169356 (=> (not res!140796) (not e!117910))))

(declare-fun arr2!28 () array!8939)

(declare-fun fromArr2!3 () (_ BitVec 64))

(declare-fun fromArr1!3 () (_ BitVec 64))

(declare-fun arr1!28 () array!8939)

(declare-datatypes ((List!921 0))(
  ( (Nil!918) (Cons!917 (h!1036 Bool) (t!1740 List!921)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!7068 array!8939 (_ BitVec 64) (_ BitVec 64)) List!921)

(assert (=> b!169356 (= res!140796 (= (byteArrayBitContentToList!0 thiss!1565 arr2!28 fromArr2!3 nBits!499) (byteArrayBitContentToList!0 thiss!1565 arr1!28 fromArr1!3 nBits!499)))))

(declare-fun res!140798 () Bool)

(assert (=> start!37284 (=> (not res!140798) (not e!117910))))

(assert (=> start!37284 (= res!140798 (and (bvsge fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt fromArr1!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvslt fromArr2!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvsle (bvadd fromArr1!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3956 arr1!28)))) (bvsle (bvadd fromArr2!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3956 arr2!28))))))))

(assert (=> start!37284 e!117910))

(assert (=> start!37284 true))

(assert (=> start!37284 (array_inv!3697 arr2!28)))

(assert (=> start!37284 (array_inv!3697 arr1!28)))

(declare-fun inv!12 (BitStream!7068) Bool)

(assert (=> start!37284 (and (inv!12 thiss!1565) e!117909)))

(declare-fun b!169358 () Bool)

(assert (=> b!169358 (= e!117910 false)))

(declare-datatypes ((Unit!11833 0))(
  ( (Unit!11834) )
))
(declare-fun lt!262216 () Unit!11833)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!7068 array!8939 array!8939 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!11833)

(assert (=> b!169358 (= lt!262216 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 thiss!1565 arr1!28 arr2!28 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr1!3) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr2!3) (bvsub nBits!499 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and start!37284 res!140798) b!169356))

(assert (= (and b!169356 res!140796) b!169357))

(assert (= (and b!169357 res!140797) b!169358))

(assert (= start!37284 b!169359))

(declare-fun m!269009 () Bool)

(assert (=> b!169359 m!269009))

(declare-fun m!269011 () Bool)

(assert (=> b!169356 m!269011))

(declare-fun m!269013 () Bool)

(assert (=> b!169356 m!269013))

(declare-fun m!269015 () Bool)

(assert (=> start!37284 m!269015))

(declare-fun m!269017 () Bool)

(assert (=> start!37284 m!269017))

(declare-fun m!269019 () Bool)

(assert (=> start!37284 m!269019))

(declare-fun m!269021 () Bool)

(assert (=> b!169358 m!269021))

(check-sat (not b!169356) (not start!37284) (not b!169359) (not b!169358))
