; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37264 () Bool)

(assert start!37264)

(declare-fun b!169238 () Bool)

(declare-fun e!117762 () Bool)

(assert (=> b!169238 (= e!117762 false)))

(declare-fun nBits!499 () (_ BitVec 64))

(declare-fun fromArr1!3 () (_ BitVec 64))

(declare-datatypes ((Unit!11813 0))(
  ( (Unit!11814) )
))
(declare-fun lt!262186 () Unit!11813)

(declare-datatypes ((array!8919 0))(
  ( (array!8920 (arr!4870 (Array (_ BitVec 32) (_ BitVec 8))) (size!3946 (_ BitVec 32))) )
))
(declare-fun arr2!28 () array!8919)

(declare-fun fromArr2!3 () (_ BitVec 64))

(declare-fun arr1!28 () array!8919)

(declare-datatypes ((BitStream!7048 0))(
  ( (BitStream!7049 (buf!4398 array!8919) (currentByte!8382 (_ BitVec 32)) (currentBit!8377 (_ BitVec 32))) )
))
(declare-fun thiss!1565 () BitStream!7048)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!7048 array!8919 array!8919 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!11813)

(assert (=> b!169238 (= lt!262186 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 thiss!1565 arr1!28 arr2!28 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr1!3) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr2!3) (bvsub nBits!499 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!169239 () Bool)

(declare-fun e!117759 () Bool)

(declare-fun array_inv!3687 (array!8919) Bool)

(assert (=> b!169239 (= e!117759 (array_inv!3687 (buf!4398 thiss!1565)))))

(declare-fun b!169236 () Bool)

(declare-fun res!140707 () Bool)

(assert (=> b!169236 (=> (not res!140707) (not e!117762))))

(declare-datatypes ((List!911 0))(
  ( (Nil!908) (Cons!907 (h!1026 Bool) (t!1730 List!911)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!7048 array!8919 (_ BitVec 64) (_ BitVec 64)) List!911)

(assert (=> b!169236 (= res!140707 (= (byteArrayBitContentToList!0 thiss!1565 arr2!28 fromArr2!3 nBits!499) (byteArrayBitContentToList!0 thiss!1565 arr1!28 fromArr1!3 nBits!499)))))

(declare-fun res!140708 () Bool)

(assert (=> start!37264 (=> (not res!140708) (not e!117762))))

(assert (=> start!37264 (= res!140708 (and (bvsge fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt fromArr1!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvslt fromArr2!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvsle (bvadd fromArr1!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3946 arr1!28)))) (bvsle (bvadd fromArr2!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3946 arr2!28))))))))

(assert (=> start!37264 e!117762))

(assert (=> start!37264 true))

(assert (=> start!37264 (array_inv!3687 arr2!28)))

(assert (=> start!37264 (array_inv!3687 arr1!28)))

(declare-fun inv!12 (BitStream!7048) Bool)

(assert (=> start!37264 (and (inv!12 thiss!1565) e!117759)))

(declare-fun b!169237 () Bool)

(declare-fun res!140706 () Bool)

(assert (=> b!169237 (=> (not res!140706) (not e!117762))))

(assert (=> b!169237 (= res!140706 (bvsgt nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!37264 res!140708) b!169236))

(assert (= (and b!169236 res!140707) b!169237))

(assert (= (and b!169237 res!140706) b!169238))

(assert (= start!37264 b!169239))

(declare-fun m!268869 () Bool)

(assert (=> b!169238 m!268869))

(declare-fun m!268871 () Bool)

(assert (=> b!169239 m!268871))

(declare-fun m!268873 () Bool)

(assert (=> b!169236 m!268873))

(declare-fun m!268875 () Bool)

(assert (=> b!169236 m!268875))

(declare-fun m!268877 () Bool)

(assert (=> start!37264 m!268877))

(declare-fun m!268879 () Bool)

(assert (=> start!37264 m!268879))

(declare-fun m!268881 () Bool)

(assert (=> start!37264 m!268881))

(push 1)

(assert (not b!169238))

(assert (not start!37264))

(assert (not b!169236))

(assert (not b!169239))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

