; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37282 () Bool)

(assert start!37282)

(declare-fun b!169344 () Bool)

(declare-fun res!140788 () Bool)

(declare-fun e!117894 () Bool)

(assert (=> b!169344 (=> (not res!140788) (not e!117894))))

(declare-fun nBits!499 () (_ BitVec 64))

(declare-fun fromArr1!3 () (_ BitVec 64))

(declare-datatypes ((array!8937 0))(
  ( (array!8938 (arr!4879 (Array (_ BitVec 32) (_ BitVec 8))) (size!3955 (_ BitVec 32))) )
))
(declare-fun arr2!28 () array!8937)

(declare-fun fromArr2!3 () (_ BitVec 64))

(declare-fun arr1!28 () array!8937)

(declare-datatypes ((BitStream!7066 0))(
  ( (BitStream!7067 (buf!4407 array!8937) (currentByte!8391 (_ BitVec 32)) (currentBit!8386 (_ BitVec 32))) )
))
(declare-fun thiss!1565 () BitStream!7066)

(declare-datatypes ((List!920 0))(
  ( (Nil!917) (Cons!916 (h!1035 Bool) (t!1739 List!920)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!7066 array!8937 (_ BitVec 64) (_ BitVec 64)) List!920)

(assert (=> b!169344 (= res!140788 (= (byteArrayBitContentToList!0 thiss!1565 arr2!28 fromArr2!3 nBits!499) (byteArrayBitContentToList!0 thiss!1565 arr1!28 fromArr1!3 nBits!499)))))

(declare-fun b!169345 () Bool)

(declare-fun res!140789 () Bool)

(assert (=> b!169345 (=> (not res!140789) (not e!117894))))

(assert (=> b!169345 (= res!140789 (bvsgt nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!169346 () Bool)

(assert (=> b!169346 (= e!117894 false)))

(declare-datatypes ((Unit!11831 0))(
  ( (Unit!11832) )
))
(declare-fun lt!262213 () Unit!11831)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!7066 array!8937 array!8937 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!11831)

(assert (=> b!169346 (= lt!262213 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 thiss!1565 arr1!28 arr2!28 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr1!3) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr2!3) (bvsub nBits!499 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!169347 () Bool)

(declare-fun e!117893 () Bool)

(declare-fun array_inv!3696 (array!8937) Bool)

(assert (=> b!169347 (= e!117893 (array_inv!3696 (buf!4407 thiss!1565)))))

(declare-fun res!140787 () Bool)

(assert (=> start!37282 (=> (not res!140787) (not e!117894))))

(assert (=> start!37282 (= res!140787 (and (bvsge fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt fromArr1!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvslt fromArr2!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvsle (bvadd fromArr1!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3955 arr1!28)))) (bvsle (bvadd fromArr2!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3955 arr2!28))))))))

(assert (=> start!37282 e!117894))

(assert (=> start!37282 true))

(assert (=> start!37282 (array_inv!3696 arr2!28)))

(assert (=> start!37282 (array_inv!3696 arr1!28)))

(declare-fun inv!12 (BitStream!7066) Bool)

(assert (=> start!37282 (and (inv!12 thiss!1565) e!117893)))

(assert (= (and start!37282 res!140787) b!169344))

(assert (= (and b!169344 res!140788) b!169345))

(assert (= (and b!169345 res!140789) b!169346))

(assert (= start!37282 b!169347))

(declare-fun m!268995 () Bool)

(assert (=> b!169344 m!268995))

(declare-fun m!268997 () Bool)

(assert (=> b!169344 m!268997))

(declare-fun m!268999 () Bool)

(assert (=> b!169346 m!268999))

(declare-fun m!269001 () Bool)

(assert (=> b!169347 m!269001))

(declare-fun m!269003 () Bool)

(assert (=> start!37282 m!269003))

(declare-fun m!269005 () Bool)

(assert (=> start!37282 m!269005))

(declare-fun m!269007 () Bool)

(assert (=> start!37282 m!269007))

(push 1)

(assert (not b!169347))

(assert (not b!169346))

(assert (not b!169344))

(assert (not start!37282))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

