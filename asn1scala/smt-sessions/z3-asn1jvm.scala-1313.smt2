; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37278 () Bool)

(assert start!37278)

(declare-fun res!140770 () Bool)

(declare-fun e!117864 () Bool)

(assert (=> start!37278 (=> (not res!140770) (not e!117864))))

(declare-fun nBits!499 () (_ BitVec 64))

(declare-fun fromArr1!3 () (_ BitVec 64))

(declare-datatypes ((array!8933 0))(
  ( (array!8934 (arr!4877 (Array (_ BitVec 32) (_ BitVec 8))) (size!3953 (_ BitVec 32))) )
))
(declare-fun arr1!28 () array!8933)

(declare-fun arr2!28 () array!8933)

(declare-fun fromArr2!3 () (_ BitVec 64))

(assert (=> start!37278 (= res!140770 (and (bvsge fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt fromArr1!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvslt fromArr2!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvsle (bvadd fromArr1!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3953 arr1!28)))) (bvsle (bvadd fromArr2!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3953 arr2!28))))))))

(assert (=> start!37278 e!117864))

(assert (=> start!37278 true))

(declare-fun array_inv!3694 (array!8933) Bool)

(assert (=> start!37278 (array_inv!3694 arr2!28)))

(assert (=> start!37278 (array_inv!3694 arr1!28)))

(declare-datatypes ((BitStream!7062 0))(
  ( (BitStream!7063 (buf!4405 array!8933) (currentByte!8389 (_ BitVec 32)) (currentBit!8384 (_ BitVec 32))) )
))
(declare-fun thiss!1565 () BitStream!7062)

(declare-fun e!117867 () Bool)

(declare-fun inv!12 (BitStream!7062) Bool)

(assert (=> start!37278 (and (inv!12 thiss!1565) e!117867)))

(declare-fun b!169320 () Bool)

(declare-fun res!140771 () Bool)

(assert (=> b!169320 (=> (not res!140771) (not e!117864))))

(declare-datatypes ((List!918 0))(
  ( (Nil!915) (Cons!914 (h!1033 Bool) (t!1737 List!918)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!7062 array!8933 (_ BitVec 64) (_ BitVec 64)) List!918)

(assert (=> b!169320 (= res!140771 (= (byteArrayBitContentToList!0 thiss!1565 arr2!28 fromArr2!3 nBits!499) (byteArrayBitContentToList!0 thiss!1565 arr1!28 fromArr1!3 nBits!499)))))

(declare-fun b!169322 () Bool)

(assert (=> b!169322 (= e!117864 false)))

(declare-datatypes ((Unit!11827 0))(
  ( (Unit!11828) )
))
(declare-fun lt!262207 () Unit!11827)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!7062 array!8933 array!8933 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!11827)

(assert (=> b!169322 (= lt!262207 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 thiss!1565 arr1!28 arr2!28 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr1!3) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr2!3) (bvsub nBits!499 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!169323 () Bool)

(assert (=> b!169323 (= e!117867 (array_inv!3694 (buf!4405 thiss!1565)))))

(declare-fun b!169321 () Bool)

(declare-fun res!140769 () Bool)

(assert (=> b!169321 (=> (not res!140769) (not e!117864))))

(assert (=> b!169321 (= res!140769 (bvsgt nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!37278 res!140770) b!169320))

(assert (= (and b!169320 res!140771) b!169321))

(assert (= (and b!169321 res!140769) b!169322))

(assert (= start!37278 b!169323))

(declare-fun m!268967 () Bool)

(assert (=> start!37278 m!268967))

(declare-fun m!268969 () Bool)

(assert (=> start!37278 m!268969))

(declare-fun m!268971 () Bool)

(assert (=> start!37278 m!268971))

(declare-fun m!268973 () Bool)

(assert (=> b!169320 m!268973))

(declare-fun m!268975 () Bool)

(assert (=> b!169320 m!268975))

(declare-fun m!268977 () Bool)

(assert (=> b!169322 m!268977))

(declare-fun m!268979 () Bool)

(assert (=> b!169323 m!268979))

(check-sat (not b!169323) (not b!169320) (not b!169322) (not start!37278))
