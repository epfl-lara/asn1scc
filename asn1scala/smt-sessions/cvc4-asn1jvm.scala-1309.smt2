; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37238 () Bool)

(assert start!37238)

(declare-fun res!140671 () Bool)

(declare-fun e!117681 () Bool)

(assert (=> start!37238 (=> (not res!140671) (not e!117681))))

(declare-fun nBits!499 () (_ BitVec 64))

(declare-datatypes ((array!8908 0))(
  ( (array!8909 (arr!4863 (Array (_ BitVec 32) (_ BitVec 8))) (size!3942 (_ BitVec 32))) )
))
(declare-fun arr1!28 () array!8908)

(declare-fun arr2!28 () array!8908)

(declare-fun fromArr2!3 () (_ BitVec 64))

(declare-fun fromArr1!3 () (_ BitVec 64))

(assert (=> start!37238 (= res!140671 (and (bvsge fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt fromArr1!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvslt fromArr2!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvsle (bvadd fromArr1!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3942 arr1!28)))) (bvsle (bvadd fromArr2!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3942 arr2!28))))))))

(assert (=> start!37238 e!117681))

(assert (=> start!37238 true))

(declare-fun array_inv!3683 (array!8908) Bool)

(assert (=> start!37238 (array_inv!3683 arr2!28)))

(assert (=> start!37238 (array_inv!3683 arr1!28)))

(declare-datatypes ((BitStream!7040 0))(
  ( (BitStream!7041 (buf!4394 array!8908) (currentByte!8378 (_ BitVec 32)) (currentBit!8373 (_ BitVec 32))) )
))
(declare-fun thiss!1565 () BitStream!7040)

(declare-fun e!117682 () Bool)

(declare-fun inv!12 (BitStream!7040) Bool)

(assert (=> start!37238 (and (inv!12 thiss!1565) e!117682)))

(declare-fun b!169153 () Bool)

(declare-fun res!140672 () Bool)

(assert (=> b!169153 (=> (not res!140672) (not e!117681))))

(declare-datatypes ((List!907 0))(
  ( (Nil!904) (Cons!903 (h!1022 Bool) (t!1726 List!907)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!7040 array!8908 (_ BitVec 64) (_ BitVec 64)) List!907)

(assert (=> b!169153 (= res!140672 (= (byteArrayBitContentToList!0 thiss!1565 arr2!28 fromArr2!3 nBits!499) (byteArrayBitContentToList!0 thiss!1565 arr1!28 fromArr1!3 nBits!499)))))

(declare-fun b!169154 () Bool)

(assert (=> b!169154 (= e!117681 (and (bvsgt nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr1!3) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr2!3) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!169155 () Bool)

(assert (=> b!169155 (= e!117682 (array_inv!3683 (buf!4394 thiss!1565)))))

(assert (= (and start!37238 res!140671) b!169153))

(assert (= (and b!169153 res!140672) b!169154))

(assert (= start!37238 b!169155))

(declare-fun m!268731 () Bool)

(assert (=> start!37238 m!268731))

(declare-fun m!268733 () Bool)

(assert (=> start!37238 m!268733))

(declare-fun m!268735 () Bool)

(assert (=> start!37238 m!268735))

(declare-fun m!268737 () Bool)

(assert (=> b!169153 m!268737))

(declare-fun m!268739 () Bool)

(assert (=> b!169153 m!268739))

(declare-fun m!268741 () Bool)

(assert (=> b!169155 m!268741))

(push 1)

(assert (not start!37238))

(assert (not b!169155))

(assert (not b!169153))

(check-sat)

(pop 1)

(push 1)

(check-sat)

