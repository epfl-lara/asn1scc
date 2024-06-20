; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37346 () Bool)

(assert start!37346)

(declare-fun res!140906 () Bool)

(declare-fun e!118143 () Bool)

(assert (=> start!37346 (=> (not res!140906) (not e!118143))))

(declare-fun nBits!499 () (_ BitVec 64))

(declare-fun fromArr1!3 () (_ BitVec 64))

(declare-datatypes ((array!8983 0))(
  ( (array!8984 (arr!4902 (Array (_ BitVec 32) (_ BitVec 8))) (size!3978 (_ BitVec 32))) )
))
(declare-fun arr1!28 () array!8983)

(declare-fun arr2!28 () array!8983)

(declare-fun fromArr2!3 () (_ BitVec 64))

(assert (=> start!37346 (= res!140906 (and (bvsge fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt fromArr1!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvslt fromArr2!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvsle (bvadd fromArr1!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3978 arr1!28)))) (bvsle (bvadd fromArr2!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3978 arr2!28))))))))

(assert (=> start!37346 e!118143))

(assert (=> start!37346 true))

(declare-fun array_inv!3719 (array!8983) Bool)

(assert (=> start!37346 (array_inv!3719 arr2!28)))

(assert (=> start!37346 (array_inv!3719 arr1!28)))

(declare-datatypes ((BitStream!7094 0))(
  ( (BitStream!7095 (buf!4421 array!8983) (currentByte!8405 (_ BitVec 32)) (currentBit!8400 (_ BitVec 32))) )
))
(declare-fun thiss!1565 () BitStream!7094)

(declare-fun e!118141 () Bool)

(declare-fun inv!12 (BitStream!7094) Bool)

(assert (=> start!37346 (and (inv!12 thiss!1565) e!118141)))

(declare-fun b!169504 () Bool)

(declare-fun res!140905 () Bool)

(assert (=> b!169504 (=> (not res!140905) (not e!118143))))

(declare-datatypes ((List!934 0))(
  ( (Nil!931) (Cons!930 (h!1049 Bool) (t!1753 List!934)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!7094 array!8983 (_ BitVec 64) (_ BitVec 64)) List!934)

(assert (=> b!169504 (= res!140905 (= (byteArrayBitContentToList!0 thiss!1565 arr2!28 fromArr2!3 nBits!499) (byteArrayBitContentToList!0 thiss!1565 arr1!28 fromArr1!3 nBits!499)))))

(declare-fun b!169505 () Bool)

(assert (=> b!169505 (= e!118143 (and (bvsgt nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (= (bvand fromArr1!3 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand fromArr1!3 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr1!3) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!169506 () Bool)

(assert (=> b!169506 (= e!118141 (array_inv!3719 (buf!4421 thiss!1565)))))

(assert (= (and start!37346 res!140906) b!169504))

(assert (= (and b!169504 res!140905) b!169505))

(assert (= start!37346 b!169506))

(declare-fun m!269211 () Bool)

(assert (=> start!37346 m!269211))

(declare-fun m!269213 () Bool)

(assert (=> start!37346 m!269213))

(declare-fun m!269215 () Bool)

(assert (=> start!37346 m!269215))

(declare-fun m!269217 () Bool)

(assert (=> b!169504 m!269217))

(declare-fun m!269219 () Bool)

(assert (=> b!169504 m!269219))

(declare-fun m!269221 () Bool)

(assert (=> b!169506 m!269221))

(push 1)

(assert (not b!169506))

(assert (not start!37346))

(assert (not b!169504))

(check-sat)

(pop 1)

(push 1)

(check-sat)

