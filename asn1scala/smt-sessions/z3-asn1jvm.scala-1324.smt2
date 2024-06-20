; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37344 () Bool)

(assert start!37344)

(declare-fun res!140900 () Bool)

(declare-fun e!118125 () Bool)

(assert (=> start!37344 (=> (not res!140900) (not e!118125))))

(declare-fun nBits!499 () (_ BitVec 64))

(declare-fun fromArr1!3 () (_ BitVec 64))

(declare-datatypes ((array!8981 0))(
  ( (array!8982 (arr!4901 (Array (_ BitVec 32) (_ BitVec 8))) (size!3977 (_ BitVec 32))) )
))
(declare-fun arr1!28 () array!8981)

(declare-fun arr2!28 () array!8981)

(declare-fun fromArr2!3 () (_ BitVec 64))

(assert (=> start!37344 (= res!140900 (and (bvsge fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt fromArr1!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvslt fromArr2!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvsle (bvadd fromArr1!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3977 arr1!28)))) (bvsle (bvadd fromArr2!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3977 arr2!28))))))))

(assert (=> start!37344 e!118125))

(assert (=> start!37344 true))

(declare-fun array_inv!3718 (array!8981) Bool)

(assert (=> start!37344 (array_inv!3718 arr2!28)))

(assert (=> start!37344 (array_inv!3718 arr1!28)))

(declare-datatypes ((BitStream!7092 0))(
  ( (BitStream!7093 (buf!4420 array!8981) (currentByte!8404 (_ BitVec 32)) (currentBit!8399 (_ BitVec 32))) )
))
(declare-fun thiss!1565 () BitStream!7092)

(declare-fun e!118127 () Bool)

(declare-fun inv!12 (BitStream!7092) Bool)

(assert (=> start!37344 (and (inv!12 thiss!1565) e!118127)))

(declare-fun b!169495 () Bool)

(declare-fun res!140899 () Bool)

(assert (=> b!169495 (=> (not res!140899) (not e!118125))))

(declare-datatypes ((List!933 0))(
  ( (Nil!930) (Cons!929 (h!1048 Bool) (t!1752 List!933)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!7092 array!8981 (_ BitVec 64) (_ BitVec 64)) List!933)

(assert (=> b!169495 (= res!140899 (= (byteArrayBitContentToList!0 thiss!1565 arr2!28 fromArr2!3 nBits!499) (byteArrayBitContentToList!0 thiss!1565 arr1!28 fromArr1!3 nBits!499)))))

(declare-fun b!169496 () Bool)

(assert (=> b!169496 (= e!118125 (and (bvsgt nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (= (bvand fromArr1!3 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand fromArr1!3 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr1!3) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!169497 () Bool)

(assert (=> b!169497 (= e!118127 (array_inv!3718 (buf!4420 thiss!1565)))))

(assert (= (and start!37344 res!140900) b!169495))

(assert (= (and b!169495 res!140899) b!169496))

(assert (= start!37344 b!169497))

(declare-fun m!269199 () Bool)

(assert (=> start!37344 m!269199))

(declare-fun m!269201 () Bool)

(assert (=> start!37344 m!269201))

(declare-fun m!269203 () Bool)

(assert (=> start!37344 m!269203))

(declare-fun m!269205 () Bool)

(assert (=> b!169495 m!269205))

(declare-fun m!269207 () Bool)

(assert (=> b!169495 m!269207))

(declare-fun m!269209 () Bool)

(assert (=> b!169497 m!269209))

(check-sat (not b!169497) (not start!37344) (not b!169495))
(check-sat)
