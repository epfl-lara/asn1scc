; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37230 () Bool)

(assert start!37230)

(declare-fun res!140648 () Bool)

(declare-fun e!117623 () Bool)

(assert (=> start!37230 (=> (not res!140648) (not e!117623))))

(declare-fun nBits!499 () (_ BitVec 64))

(declare-fun fromArr1!3 () (_ BitVec 64))

(declare-datatypes ((array!8900 0))(
  ( (array!8901 (arr!4859 (Array (_ BitVec 32) (_ BitVec 8))) (size!3938 (_ BitVec 32))) )
))
(declare-fun arr1!28 () array!8900)

(declare-fun arr2!28 () array!8900)

(declare-fun fromArr2!3 () (_ BitVec 64))

(assert (=> start!37230 (= res!140648 (and (bvsge fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt fromArr1!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvslt fromArr2!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvsle (bvadd fromArr1!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3938 arr1!28)))) (bvsle (bvadd fromArr2!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3938 arr2!28))))))))

(assert (=> start!37230 e!117623))

(assert (=> start!37230 true))

(declare-fun array_inv!3679 (array!8900) Bool)

(assert (=> start!37230 (array_inv!3679 arr2!28)))

(assert (=> start!37230 (array_inv!3679 arr1!28)))

(declare-datatypes ((BitStream!7032 0))(
  ( (BitStream!7033 (buf!4390 array!8900) (currentByte!8374 (_ BitVec 32)) (currentBit!8369 (_ BitVec 32))) )
))
(declare-fun thiss!1565 () BitStream!7032)

(declare-fun e!117622 () Bool)

(declare-fun inv!12 (BitStream!7032) Bool)

(assert (=> start!37230 (and (inv!12 thiss!1565) e!117622)))

(declare-fun b!169117 () Bool)

(declare-fun res!140647 () Bool)

(assert (=> b!169117 (=> (not res!140647) (not e!117623))))

(declare-datatypes ((List!903 0))(
  ( (Nil!900) (Cons!899 (h!1018 Bool) (t!1722 List!903)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!7032 array!8900 (_ BitVec 64) (_ BitVec 64)) List!903)

(assert (=> b!169117 (= res!140647 (= (byteArrayBitContentToList!0 thiss!1565 arr2!28 fromArr2!3 nBits!499) (byteArrayBitContentToList!0 thiss!1565 arr1!28 fromArr1!3 nBits!499)))))

(declare-fun b!169118 () Bool)

(assert (=> b!169118 (= e!117623 (and (bvsgt nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr1!3) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!169119 () Bool)

(assert (=> b!169119 (= e!117622 (array_inv!3679 (buf!4390 thiss!1565)))))

(assert (= (and start!37230 res!140648) b!169117))

(assert (= (and b!169117 res!140647) b!169118))

(assert (= start!37230 b!169119))

(declare-fun m!268683 () Bool)

(assert (=> start!37230 m!268683))

(declare-fun m!268685 () Bool)

(assert (=> start!37230 m!268685))

(declare-fun m!268687 () Bool)

(assert (=> start!37230 m!268687))

(declare-fun m!268689 () Bool)

(assert (=> b!169117 m!268689))

(declare-fun m!268691 () Bool)

(assert (=> b!169117 m!268691))

(declare-fun m!268693 () Bool)

(assert (=> b!169119 m!268693))

(check-sat (not start!37230) (not b!169119) (not b!169117))
(check-sat)
