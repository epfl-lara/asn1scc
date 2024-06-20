; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37276 () Bool)

(assert start!37276)

(declare-fun b!169309 () Bool)

(declare-fun res!140762 () Bool)

(declare-fun e!117852 () Bool)

(assert (=> b!169309 (=> (not res!140762) (not e!117852))))

(declare-fun nBits!499 () (_ BitVec 64))

(assert (=> b!169309 (= res!140762 (bvsgt nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!169308 () Bool)

(declare-fun res!140760 () Bool)

(assert (=> b!169308 (=> (not res!140760) (not e!117852))))

(declare-fun fromArr1!3 () (_ BitVec 64))

(declare-datatypes ((array!8931 0))(
  ( (array!8932 (arr!4876 (Array (_ BitVec 32) (_ BitVec 8))) (size!3952 (_ BitVec 32))) )
))
(declare-fun arr2!28 () array!8931)

(declare-fun fromArr2!3 () (_ BitVec 64))

(declare-fun arr1!28 () array!8931)

(declare-datatypes ((BitStream!7060 0))(
  ( (BitStream!7061 (buf!4404 array!8931) (currentByte!8388 (_ BitVec 32)) (currentBit!8383 (_ BitVec 32))) )
))
(declare-fun thiss!1565 () BitStream!7060)

(declare-datatypes ((List!917 0))(
  ( (Nil!914) (Cons!913 (h!1032 Bool) (t!1736 List!917)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!7060 array!8931 (_ BitVec 64) (_ BitVec 64)) List!917)

(assert (=> b!169308 (= res!140760 (= (byteArrayBitContentToList!0 thiss!1565 arr2!28 fromArr2!3 nBits!499) (byteArrayBitContentToList!0 thiss!1565 arr1!28 fromArr1!3 nBits!499)))))

(declare-fun b!169310 () Bool)

(assert (=> b!169310 (= e!117852 false)))

(declare-datatypes ((Unit!11825 0))(
  ( (Unit!11826) )
))
(declare-fun lt!262204 () Unit!11825)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!7060 array!8931 array!8931 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!11825)

(assert (=> b!169310 (= lt!262204 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 thiss!1565 arr1!28 arr2!28 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr1!3) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr2!3) (bvsub nBits!499 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun res!140761 () Bool)

(assert (=> start!37276 (=> (not res!140761) (not e!117852))))

(assert (=> start!37276 (= res!140761 (and (bvsge fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt fromArr1!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvslt fromArr2!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvsle (bvadd fromArr1!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3952 arr1!28)))) (bvsle (bvadd fromArr2!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3952 arr2!28))))))))

(assert (=> start!37276 e!117852))

(assert (=> start!37276 true))

(declare-fun array_inv!3693 (array!8931) Bool)

(assert (=> start!37276 (array_inv!3693 arr2!28)))

(assert (=> start!37276 (array_inv!3693 arr1!28)))

(declare-fun e!117850 () Bool)

(declare-fun inv!12 (BitStream!7060) Bool)

(assert (=> start!37276 (and (inv!12 thiss!1565) e!117850)))

(declare-fun b!169311 () Bool)

(assert (=> b!169311 (= e!117850 (array_inv!3693 (buf!4404 thiss!1565)))))

(assert (= (and start!37276 res!140761) b!169308))

(assert (= (and b!169308 res!140760) b!169309))

(assert (= (and b!169309 res!140762) b!169310))

(assert (= start!37276 b!169311))

(declare-fun m!268953 () Bool)

(assert (=> b!169308 m!268953))

(declare-fun m!268955 () Bool)

(assert (=> b!169308 m!268955))

(declare-fun m!268957 () Bool)

(assert (=> b!169310 m!268957))

(declare-fun m!268959 () Bool)

(assert (=> start!37276 m!268959))

(declare-fun m!268961 () Bool)

(assert (=> start!37276 m!268961))

(declare-fun m!268963 () Bool)

(assert (=> start!37276 m!268963))

(declare-fun m!268965 () Bool)

(assert (=> b!169311 m!268965))

(push 1)

(assert (not b!169308))

(assert (not b!169310))

(assert (not start!37276))

(assert (not b!169311))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

