; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37286 () Bool)

(assert start!37286)

(declare-fun b!169371 () Bool)

(declare-fun e!117925 () Bool)

(declare-datatypes ((array!8941 0))(
  ( (array!8942 (arr!4881 (Array (_ BitVec 32) (_ BitVec 8))) (size!3957 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7070 0))(
  ( (BitStream!7071 (buf!4409 array!8941) (currentByte!8393 (_ BitVec 32)) (currentBit!8388 (_ BitVec 32))) )
))
(declare-fun thiss!1565 () BitStream!7070)

(declare-fun array_inv!3698 (array!8941) Bool)

(assert (=> b!169371 (= e!117925 (array_inv!3698 (buf!4409 thiss!1565)))))

(declare-fun b!169369 () Bool)

(declare-fun res!140805 () Bool)

(declare-fun e!117923 () Bool)

(assert (=> b!169369 (=> (not res!140805) (not e!117923))))

(declare-fun nBits!499 () (_ BitVec 64))

(assert (=> b!169369 (= res!140805 (bvsgt nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!140807 () Bool)

(assert (=> start!37286 (=> (not res!140807) (not e!117923))))

(declare-fun fromArr1!3 () (_ BitVec 64))

(declare-fun arr1!28 () array!8941)

(declare-fun arr2!28 () array!8941)

(declare-fun fromArr2!3 () (_ BitVec 64))

(assert (=> start!37286 (= res!140807 (and (bvsge fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt fromArr1!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvslt fromArr2!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvsle (bvadd fromArr1!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3957 arr1!28)))) (bvsle (bvadd fromArr2!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3957 arr2!28))))))))

(assert (=> start!37286 e!117923))

(assert (=> start!37286 true))

(assert (=> start!37286 (array_inv!3698 arr2!28)))

(assert (=> start!37286 (array_inv!3698 arr1!28)))

(declare-fun inv!12 (BitStream!7070) Bool)

(assert (=> start!37286 (and (inv!12 thiss!1565) e!117925)))

(declare-fun b!169370 () Bool)

(assert (=> b!169370 (= e!117923 false)))

(declare-datatypes ((Unit!11835 0))(
  ( (Unit!11836) )
))
(declare-fun lt!262219 () Unit!11835)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!7070 array!8941 array!8941 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!11835)

(assert (=> b!169370 (= lt!262219 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 thiss!1565 arr1!28 arr2!28 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr1!3) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr2!3) (bvsub nBits!499 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!169368 () Bool)

(declare-fun res!140806 () Bool)

(assert (=> b!169368 (=> (not res!140806) (not e!117923))))

(declare-datatypes ((List!922 0))(
  ( (Nil!919) (Cons!918 (h!1037 Bool) (t!1741 List!922)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!7070 array!8941 (_ BitVec 64) (_ BitVec 64)) List!922)

(assert (=> b!169368 (= res!140806 (= (byteArrayBitContentToList!0 thiss!1565 arr2!28 fromArr2!3 nBits!499) (byteArrayBitContentToList!0 thiss!1565 arr1!28 fromArr1!3 nBits!499)))))

(assert (= (and start!37286 res!140807) b!169368))

(assert (= (and b!169368 res!140806) b!169369))

(assert (= (and b!169369 res!140805) b!169370))

(assert (= start!37286 b!169371))

(declare-fun m!269023 () Bool)

(assert (=> b!169371 m!269023))

(declare-fun m!269025 () Bool)

(assert (=> start!37286 m!269025))

(declare-fun m!269027 () Bool)

(assert (=> start!37286 m!269027))

(declare-fun m!269029 () Bool)

(assert (=> start!37286 m!269029))

(declare-fun m!269031 () Bool)

(assert (=> b!169370 m!269031))

(declare-fun m!269033 () Bool)

(assert (=> b!169368 m!269033))

(declare-fun m!269035 () Bool)

(assert (=> b!169368 m!269035))

(push 1)

(assert (not b!169371))

(assert (not b!169370))

(assert (not b!169368))

(assert (not start!37286))

(check-sat)

