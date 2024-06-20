; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37348 () Bool)

(assert start!37348)

(declare-fun res!140911 () Bool)

(declare-fun e!118156 () Bool)

(assert (=> start!37348 (=> (not res!140911) (not e!118156))))

(declare-fun nBits!499 () (_ BitVec 64))

(declare-fun fromArr1!3 () (_ BitVec 64))

(declare-datatypes ((array!8985 0))(
  ( (array!8986 (arr!4903 (Array (_ BitVec 32) (_ BitVec 8))) (size!3979 (_ BitVec 32))) )
))
(declare-fun arr1!28 () array!8985)

(declare-fun arr2!28 () array!8985)

(declare-fun fromArr2!3 () (_ BitVec 64))

(assert (=> start!37348 (= res!140911 (and (bvsge fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt fromArr1!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvslt fromArr2!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvsle (bvadd fromArr1!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3979 arr1!28)))) (bvsle (bvadd fromArr2!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3979 arr2!28))))))))

(assert (=> start!37348 e!118156))

(assert (=> start!37348 true))

(declare-fun array_inv!3720 (array!8985) Bool)

(assert (=> start!37348 (array_inv!3720 arr2!28)))

(assert (=> start!37348 (array_inv!3720 arr1!28)))

(declare-datatypes ((BitStream!7096 0))(
  ( (BitStream!7097 (buf!4422 array!8985) (currentByte!8406 (_ BitVec 32)) (currentBit!8401 (_ BitVec 32))) )
))
(declare-fun thiss!1565 () BitStream!7096)

(declare-fun e!118157 () Bool)

(declare-fun inv!12 (BitStream!7096) Bool)

(assert (=> start!37348 (and (inv!12 thiss!1565) e!118157)))

(declare-fun b!169513 () Bool)

(declare-fun res!140912 () Bool)

(assert (=> b!169513 (=> (not res!140912) (not e!118156))))

(declare-datatypes ((List!935 0))(
  ( (Nil!932) (Cons!931 (h!1050 Bool) (t!1754 List!935)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!7096 array!8985 (_ BitVec 64) (_ BitVec 64)) List!935)

(assert (=> b!169513 (= res!140912 (= (byteArrayBitContentToList!0 thiss!1565 arr2!28 fromArr2!3 nBits!499) (byteArrayBitContentToList!0 thiss!1565 arr1!28 fromArr1!3 nBits!499)))))

(declare-fun b!169514 () Bool)

(assert (=> b!169514 (= e!118156 (and (bvsgt nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (= (bvand fromArr2!3 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand fromArr2!3 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr2!3) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!169515 () Bool)

(assert (=> b!169515 (= e!118157 (array_inv!3720 (buf!4422 thiss!1565)))))

(assert (= (and start!37348 res!140911) b!169513))

(assert (= (and b!169513 res!140912) b!169514))

(assert (= start!37348 b!169515))

(declare-fun m!269223 () Bool)

(assert (=> start!37348 m!269223))

(declare-fun m!269225 () Bool)

(assert (=> start!37348 m!269225))

(declare-fun m!269227 () Bool)

(assert (=> start!37348 m!269227))

(declare-fun m!269229 () Bool)

(assert (=> b!169513 m!269229))

(declare-fun m!269231 () Bool)

(assert (=> b!169513 m!269231))

(declare-fun m!269233 () Bool)

(assert (=> b!169515 m!269233))

(push 1)

(assert (not b!169515))

(assert (not start!37348))

(assert (not b!169513))

(check-sat)

(pop 1)

(push 1)

(check-sat)

