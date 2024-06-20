; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37270 () Bool)

(assert start!37270)

(declare-fun b!169275 () Bool)

(declare-fun e!117805 () Bool)

(declare-datatypes ((array!8925 0))(
  ( (array!8926 (arr!4873 (Array (_ BitVec 32) (_ BitVec 8))) (size!3949 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7054 0))(
  ( (BitStream!7055 (buf!4401 array!8925) (currentByte!8385 (_ BitVec 32)) (currentBit!8380 (_ BitVec 32))) )
))
(declare-fun thiss!1565 () BitStream!7054)

(declare-fun array_inv!3690 (array!8925) Bool)

(assert (=> b!169275 (= e!117805 (array_inv!3690 (buf!4401 thiss!1565)))))

(declare-fun b!169274 () Bool)

(declare-fun e!117807 () Bool)

(assert (=> b!169274 (= e!117807 false)))

(declare-fun nBits!499 () (_ BitVec 64))

(declare-datatypes ((Unit!11819 0))(
  ( (Unit!11820) )
))
(declare-fun lt!262195 () Unit!11819)

(declare-fun fromArr1!3 () (_ BitVec 64))

(declare-fun arr2!28 () array!8925)

(declare-fun fromArr2!3 () (_ BitVec 64))

(declare-fun arr1!28 () array!8925)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!7054 array!8925 array!8925 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!11819)

(assert (=> b!169274 (= lt!262195 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 thiss!1565 arr1!28 arr2!28 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr1!3) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr2!3) (bvsub nBits!499 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!169272 () Bool)

(declare-fun res!140735 () Bool)

(assert (=> b!169272 (=> (not res!140735) (not e!117807))))

(declare-datatypes ((List!914 0))(
  ( (Nil!911) (Cons!910 (h!1029 Bool) (t!1733 List!914)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!7054 array!8925 (_ BitVec 64) (_ BitVec 64)) List!914)

(assert (=> b!169272 (= res!140735 (= (byteArrayBitContentToList!0 thiss!1565 arr2!28 fromArr2!3 nBits!499) (byteArrayBitContentToList!0 thiss!1565 arr1!28 fromArr1!3 nBits!499)))))

(declare-fun b!169273 () Bool)

(declare-fun res!140734 () Bool)

(assert (=> b!169273 (=> (not res!140734) (not e!117807))))

(assert (=> b!169273 (= res!140734 (bvsgt nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!140733 () Bool)

(assert (=> start!37270 (=> (not res!140733) (not e!117807))))

(assert (=> start!37270 (= res!140733 (and (bvsge fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt fromArr1!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvslt fromArr2!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvsle (bvadd fromArr1!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3949 arr1!28)))) (bvsle (bvadd fromArr2!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3949 arr2!28))))))))

(assert (=> start!37270 e!117807))

(assert (=> start!37270 true))

(assert (=> start!37270 (array_inv!3690 arr2!28)))

(assert (=> start!37270 (array_inv!3690 arr1!28)))

(declare-fun inv!12 (BitStream!7054) Bool)

(assert (=> start!37270 (and (inv!12 thiss!1565) e!117805)))

(assert (= (and start!37270 res!140733) b!169272))

(assert (= (and b!169272 res!140735) b!169273))

(assert (= (and b!169273 res!140734) b!169274))

(assert (= start!37270 b!169275))

(declare-fun m!268911 () Bool)

(assert (=> b!169275 m!268911))

(declare-fun m!268913 () Bool)

(assert (=> b!169274 m!268913))

(declare-fun m!268915 () Bool)

(assert (=> b!169272 m!268915))

(declare-fun m!268917 () Bool)

(assert (=> b!169272 m!268917))

(declare-fun m!268919 () Bool)

(assert (=> start!37270 m!268919))

(declare-fun m!268921 () Bool)

(assert (=> start!37270 m!268921))

(declare-fun m!268923 () Bool)

(assert (=> start!37270 m!268923))

(push 1)

(assert (not b!169275))

(assert (not b!169272))

(assert (not b!169274))

(assert (not start!37270))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

