; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37364 () Bool)

(assert start!37364)

(declare-fun res!140959 () Bool)

(declare-fun e!118275 () Bool)

(assert (=> start!37364 (=> (not res!140959) (not e!118275))))

(declare-fun nBits!499 () (_ BitVec 64))

(declare-fun fromArr1!3 () (_ BitVec 64))

(declare-datatypes ((array!9001 0))(
  ( (array!9002 (arr!4911 (Array (_ BitVec 32) (_ BitVec 8))) (size!3987 (_ BitVec 32))) )
))
(declare-fun arr1!28 () array!9001)

(declare-fun arr2!28 () array!9001)

(declare-fun fromArr2!3 () (_ BitVec 64))

(assert (=> start!37364 (= res!140959 (and (bvsge fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt fromArr1!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvslt fromArr2!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvsle (bvadd fromArr1!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3987 arr1!28)))) (bvsle (bvadd fromArr2!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3987 arr2!28))))))))

(assert (=> start!37364 e!118275))

(assert (=> start!37364 true))

(declare-fun array_inv!3728 (array!9001) Bool)

(assert (=> start!37364 (array_inv!3728 arr2!28)))

(assert (=> start!37364 (array_inv!3728 arr1!28)))

(declare-datatypes ((BitStream!7112 0))(
  ( (BitStream!7113 (buf!4430 array!9001) (currentByte!8414 (_ BitVec 32)) (currentBit!8409 (_ BitVec 32))) )
))
(declare-fun thiss!1565 () BitStream!7112)

(declare-fun e!118274 () Bool)

(declare-fun inv!12 (BitStream!7112) Bool)

(assert (=> start!37364 (and (inv!12 thiss!1565) e!118274)))

(declare-fun b!169585 () Bool)

(declare-fun res!140960 () Bool)

(assert (=> b!169585 (=> (not res!140960) (not e!118275))))

(declare-datatypes ((List!943 0))(
  ( (Nil!940) (Cons!939 (h!1058 Bool) (t!1762 List!943)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!7112 array!9001 (_ BitVec 64) (_ BitVec 64)) List!943)

(assert (=> b!169585 (= res!140960 (= (byteArrayBitContentToList!0 thiss!1565 arr2!28 fromArr2!3 nBits!499) (byteArrayBitContentToList!0 thiss!1565 arr1!28 fromArr1!3 nBits!499)))))

(declare-fun b!169586 () Bool)

(assert (=> b!169586 (= e!118275 (and (bvsgt nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge (bvsub nBits!499 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!499)))))

(declare-fun b!169587 () Bool)

(assert (=> b!169587 (= e!118274 (array_inv!3728 (buf!4430 thiss!1565)))))

(assert (= (and start!37364 res!140959) b!169585))

(assert (= (and b!169585 res!140960) b!169586))

(assert (= start!37364 b!169587))

(declare-fun m!269319 () Bool)

(assert (=> start!37364 m!269319))

(declare-fun m!269321 () Bool)

(assert (=> start!37364 m!269321))

(declare-fun m!269323 () Bool)

(assert (=> start!37364 m!269323))

(declare-fun m!269325 () Bool)

(assert (=> b!169585 m!269325))

(declare-fun m!269327 () Bool)

(assert (=> b!169585 m!269327))

(declare-fun m!269329 () Bool)

(assert (=> b!169587 m!269329))

(push 1)

(assert (not b!169587))

(assert (not start!37364))

(assert (not b!169585))

(check-sat)

(pop 1)

(push 1)

(check-sat)

