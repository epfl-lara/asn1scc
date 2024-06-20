; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37228 () Bool)

(assert start!37228)

(declare-fun res!140641 () Bool)

(declare-fun e!117606 () Bool)

(assert (=> start!37228 (=> (not res!140641) (not e!117606))))

(declare-fun nBits!499 () (_ BitVec 64))

(declare-fun fromArr1!3 () (_ BitVec 64))

(declare-datatypes ((array!8898 0))(
  ( (array!8899 (arr!4858 (Array (_ BitVec 32) (_ BitVec 8))) (size!3937 (_ BitVec 32))) )
))
(declare-fun arr1!28 () array!8898)

(declare-fun arr2!28 () array!8898)

(declare-fun fromArr2!3 () (_ BitVec 64))

(assert (=> start!37228 (= res!140641 (and (bvsge fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt fromArr1!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvslt fromArr2!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvsle (bvadd fromArr1!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3937 arr1!28)))) (bvsle (bvadd fromArr2!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3937 arr2!28))))))))

(assert (=> start!37228 e!117606))

(assert (=> start!37228 true))

(declare-fun array_inv!3678 (array!8898) Bool)

(assert (=> start!37228 (array_inv!3678 arr2!28)))

(assert (=> start!37228 (array_inv!3678 arr1!28)))

(declare-datatypes ((BitStream!7030 0))(
  ( (BitStream!7031 (buf!4389 array!8898) (currentByte!8373 (_ BitVec 32)) (currentBit!8368 (_ BitVec 32))) )
))
(declare-fun thiss!1565 () BitStream!7030)

(declare-fun e!117605 () Bool)

(declare-fun inv!12 (BitStream!7030) Bool)

(assert (=> start!37228 (and (inv!12 thiss!1565) e!117605)))

(declare-fun b!169108 () Bool)

(declare-fun res!140642 () Bool)

(assert (=> b!169108 (=> (not res!140642) (not e!117606))))

(declare-datatypes ((List!902 0))(
  ( (Nil!899) (Cons!898 (h!1017 Bool) (t!1721 List!902)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!7030 array!8898 (_ BitVec 64) (_ BitVec 64)) List!902)

(assert (=> b!169108 (= res!140642 (= (byteArrayBitContentToList!0 thiss!1565 arr2!28 fromArr2!3 nBits!499) (byteArrayBitContentToList!0 thiss!1565 arr1!28 fromArr1!3 nBits!499)))))

(declare-fun b!169109 () Bool)

(assert (=> b!169109 (= e!117606 (and (bvsgt nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr1!3) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!169110 () Bool)

(assert (=> b!169110 (= e!117605 (array_inv!3678 (buf!4389 thiss!1565)))))

(assert (= (and start!37228 res!140641) b!169108))

(assert (= (and b!169108 res!140642) b!169109))

(assert (= start!37228 b!169110))

(declare-fun m!268671 () Bool)

(assert (=> start!37228 m!268671))

(declare-fun m!268673 () Bool)

(assert (=> start!37228 m!268673))

(declare-fun m!268675 () Bool)

(assert (=> start!37228 m!268675))

(declare-fun m!268677 () Bool)

(assert (=> b!169108 m!268677))

(declare-fun m!268679 () Bool)

(assert (=> b!169108 m!268679))

(declare-fun m!268681 () Bool)

(assert (=> b!169110 m!268681))

(push 1)

(assert (not b!169108))

(assert (not start!37228))

(assert (not b!169110))

(check-sat)

(pop 1)

(push 1)

(check-sat)

