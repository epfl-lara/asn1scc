; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37272 () Bool)

(assert start!37272)

(declare-fun res!140743 () Bool)

(declare-fun e!117821 () Bool)

(assert (=> start!37272 (=> (not res!140743) (not e!117821))))

(declare-fun nBits!499 () (_ BitVec 64))

(declare-fun fromArr1!3 () (_ BitVec 64))

(declare-datatypes ((array!8927 0))(
  ( (array!8928 (arr!4874 (Array (_ BitVec 32) (_ BitVec 8))) (size!3950 (_ BitVec 32))) )
))
(declare-fun arr1!28 () array!8927)

(declare-fun arr2!28 () array!8927)

(declare-fun fromArr2!3 () (_ BitVec 64))

(assert (=> start!37272 (= res!140743 (and (bvsge fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt fromArr1!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvslt fromArr2!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvsle (bvadd fromArr1!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3950 arr1!28)))) (bvsle (bvadd fromArr2!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3950 arr2!28))))))))

(assert (=> start!37272 e!117821))

(assert (=> start!37272 true))

(declare-fun array_inv!3691 (array!8927) Bool)

(assert (=> start!37272 (array_inv!3691 arr2!28)))

(assert (=> start!37272 (array_inv!3691 arr1!28)))

(declare-datatypes ((BitStream!7056 0))(
  ( (BitStream!7057 (buf!4402 array!8927) (currentByte!8386 (_ BitVec 32)) (currentBit!8381 (_ BitVec 32))) )
))
(declare-fun thiss!1565 () BitStream!7056)

(declare-fun e!117822 () Bool)

(declare-fun inv!12 (BitStream!7056) Bool)

(assert (=> start!37272 (and (inv!12 thiss!1565) e!117822)))

(declare-fun b!169285 () Bool)

(declare-fun res!140742 () Bool)

(assert (=> b!169285 (=> (not res!140742) (not e!117821))))

(assert (=> b!169285 (= res!140742 (bvsgt nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!169286 () Bool)

(assert (=> b!169286 (= e!117821 false)))

(declare-datatypes ((Unit!11821 0))(
  ( (Unit!11822) )
))
(declare-fun lt!262198 () Unit!11821)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!7056 array!8927 array!8927 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!11821)

(assert (=> b!169286 (= lt!262198 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 thiss!1565 arr1!28 arr2!28 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr1!3) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr2!3) (bvsub nBits!499 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!169284 () Bool)

(declare-fun res!140744 () Bool)

(assert (=> b!169284 (=> (not res!140744) (not e!117821))))

(declare-datatypes ((List!915 0))(
  ( (Nil!912) (Cons!911 (h!1030 Bool) (t!1734 List!915)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!7056 array!8927 (_ BitVec 64) (_ BitVec 64)) List!915)

(assert (=> b!169284 (= res!140744 (= (byteArrayBitContentToList!0 thiss!1565 arr2!28 fromArr2!3 nBits!499) (byteArrayBitContentToList!0 thiss!1565 arr1!28 fromArr1!3 nBits!499)))))

(declare-fun b!169287 () Bool)

(assert (=> b!169287 (= e!117822 (array_inv!3691 (buf!4402 thiss!1565)))))

(assert (= (and start!37272 res!140743) b!169284))

(assert (= (and b!169284 res!140744) b!169285))

(assert (= (and b!169285 res!140742) b!169286))

(assert (= start!37272 b!169287))

(declare-fun m!268925 () Bool)

(assert (=> start!37272 m!268925))

(declare-fun m!268927 () Bool)

(assert (=> start!37272 m!268927))

(declare-fun m!268929 () Bool)

(assert (=> start!37272 m!268929))

(declare-fun m!268931 () Bool)

(assert (=> b!169286 m!268931))

(declare-fun m!268933 () Bool)

(assert (=> b!169284 m!268933))

(declare-fun m!268935 () Bool)

(assert (=> b!169284 m!268935))

(declare-fun m!268937 () Bool)

(assert (=> b!169287 m!268937))

(check-sat (not b!169284) (not b!169286) (not start!37272) (not b!169287))
