; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37356 () Bool)

(assert start!37356)

(declare-fun res!140935 () Bool)

(declare-fun e!118217 () Bool)

(assert (=> start!37356 (=> (not res!140935) (not e!118217))))

(declare-fun nBits!499 () (_ BitVec 64))

(declare-fun fromArr1!3 () (_ BitVec 64))

(declare-datatypes ((array!8993 0))(
  ( (array!8994 (arr!4907 (Array (_ BitVec 32) (_ BitVec 8))) (size!3983 (_ BitVec 32))) )
))
(declare-fun arr1!28 () array!8993)

(declare-fun arr2!28 () array!8993)

(declare-fun fromArr2!3 () (_ BitVec 64))

(assert (=> start!37356 (= res!140935 (and (bvsge fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt fromArr1!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvslt fromArr2!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvsle (bvadd fromArr1!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3983 arr1!28)))) (bvsle (bvadd fromArr2!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3983 arr2!28))))))))

(assert (=> start!37356 e!118217))

(assert (=> start!37356 true))

(declare-fun array_inv!3724 (array!8993) Bool)

(assert (=> start!37356 (array_inv!3724 arr2!28)))

(assert (=> start!37356 (array_inv!3724 arr1!28)))

(declare-datatypes ((BitStream!7104 0))(
  ( (BitStream!7105 (buf!4426 array!8993) (currentByte!8410 (_ BitVec 32)) (currentBit!8405 (_ BitVec 32))) )
))
(declare-fun thiss!1565 () BitStream!7104)

(declare-fun e!118218 () Bool)

(declare-fun inv!12 (BitStream!7104) Bool)

(assert (=> start!37356 (and (inv!12 thiss!1565) e!118218)))

(declare-fun b!169549 () Bool)

(declare-fun res!140936 () Bool)

(assert (=> b!169549 (=> (not res!140936) (not e!118217))))

(declare-datatypes ((List!939 0))(
  ( (Nil!936) (Cons!935 (h!1054 Bool) (t!1758 List!939)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!7104 array!8993 (_ BitVec 64) (_ BitVec 64)) List!939)

(assert (=> b!169549 (= res!140936 (= (byteArrayBitContentToList!0 thiss!1565 arr2!28 fromArr2!3 nBits!499) (byteArrayBitContentToList!0 thiss!1565 arr1!28 fromArr1!3 nBits!499)))))

(declare-fun b!169550 () Bool)

(assert (=> b!169550 (= e!118217 (and (bvsgt nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand nBits!499 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand nBits!499 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!499 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!169551 () Bool)

(assert (=> b!169551 (= e!118218 (array_inv!3724 (buf!4426 thiss!1565)))))

(assert (= (and start!37356 res!140935) b!169549))

(assert (= (and b!169549 res!140936) b!169550))

(assert (= start!37356 b!169551))

(declare-fun m!269271 () Bool)

(assert (=> start!37356 m!269271))

(declare-fun m!269273 () Bool)

(assert (=> start!37356 m!269273))

(declare-fun m!269275 () Bool)

(assert (=> start!37356 m!269275))

(declare-fun m!269277 () Bool)

(assert (=> b!169549 m!269277))

(declare-fun m!269279 () Bool)

(assert (=> b!169549 m!269279))

(declare-fun m!269281 () Bool)

(assert (=> b!169551 m!269281))

(check-sat (not b!169551) (not start!37356) (not b!169549))
(check-sat)
