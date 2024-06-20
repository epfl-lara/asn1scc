; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37342 () Bool)

(assert start!37342)

(declare-fun res!140893 () Bool)

(declare-fun e!118112 () Bool)

(assert (=> start!37342 (=> (not res!140893) (not e!118112))))

(declare-fun nBits!499 () (_ BitVec 64))

(declare-fun fromArr1!3 () (_ BitVec 64))

(declare-datatypes ((array!8979 0))(
  ( (array!8980 (arr!4900 (Array (_ BitVec 32) (_ BitVec 8))) (size!3976 (_ BitVec 32))) )
))
(declare-fun arr1!28 () array!8979)

(declare-fun arr2!28 () array!8979)

(declare-fun fromArr2!3 () (_ BitVec 64))

(assert (=> start!37342 (= res!140893 (and (bvsge fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt fromArr1!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvslt fromArr2!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvsle (bvadd fromArr1!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3976 arr1!28)))) (bvsle (bvadd fromArr2!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3976 arr2!28))))))))

(assert (=> start!37342 e!118112))

(assert (=> start!37342 true))

(declare-fun array_inv!3717 (array!8979) Bool)

(assert (=> start!37342 (array_inv!3717 arr2!28)))

(assert (=> start!37342 (array_inv!3717 arr1!28)))

(declare-datatypes ((BitStream!7090 0))(
  ( (BitStream!7091 (buf!4419 array!8979) (currentByte!8403 (_ BitVec 32)) (currentBit!8398 (_ BitVec 32))) )
))
(declare-fun thiss!1565 () BitStream!7090)

(declare-fun e!118110 () Bool)

(declare-fun inv!12 (BitStream!7090) Bool)

(assert (=> start!37342 (and (inv!12 thiss!1565) e!118110)))

(declare-fun b!169486 () Bool)

(declare-fun res!140894 () Bool)

(assert (=> b!169486 (=> (not res!140894) (not e!118112))))

(declare-datatypes ((List!932 0))(
  ( (Nil!929) (Cons!928 (h!1047 Bool) (t!1751 List!932)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!7090 array!8979 (_ BitVec 64) (_ BitVec 64)) List!932)

(assert (=> b!169486 (= res!140894 (= (byteArrayBitContentToList!0 thiss!1565 arr2!28 fromArr2!3 nBits!499) (byteArrayBitContentToList!0 thiss!1565 arr1!28 fromArr1!3 nBits!499)))))

(declare-fun b!169487 () Bool)

(assert (=> b!169487 (= e!118112 (and (bvsgt nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (= (bvand fromArr1!3 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand fromArr1!3 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr1!3) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!169488 () Bool)

(assert (=> b!169488 (= e!118110 (array_inv!3717 (buf!4419 thiss!1565)))))

(assert (= (and start!37342 res!140893) b!169486))

(assert (= (and b!169486 res!140894) b!169487))

(assert (= start!37342 b!169488))

(declare-fun m!269187 () Bool)

(assert (=> start!37342 m!269187))

(declare-fun m!269189 () Bool)

(assert (=> start!37342 m!269189))

(declare-fun m!269191 () Bool)

(assert (=> start!37342 m!269191))

(declare-fun m!269193 () Bool)

(assert (=> b!169486 m!269193))

(declare-fun m!269195 () Bool)

(assert (=> b!169486 m!269195))

(declare-fun m!269197 () Bool)

(assert (=> b!169488 m!269197))

(push 1)

(assert (not start!37342))

(assert (not b!169486))

(assert (not b!169488))

(check-sat)

(pop 1)

(push 1)

(check-sat)

