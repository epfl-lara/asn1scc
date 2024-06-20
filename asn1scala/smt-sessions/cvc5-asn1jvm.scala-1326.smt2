; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37354 () Bool)

(assert start!37354)

(declare-fun res!140929 () Bool)

(declare-fun e!118201 () Bool)

(assert (=> start!37354 (=> (not res!140929) (not e!118201))))

(declare-fun nBits!499 () (_ BitVec 64))

(declare-fun fromArr1!3 () (_ BitVec 64))

(declare-datatypes ((array!8991 0))(
  ( (array!8992 (arr!4906 (Array (_ BitVec 32) (_ BitVec 8))) (size!3982 (_ BitVec 32))) )
))
(declare-fun arr1!28 () array!8991)

(declare-fun arr2!28 () array!8991)

(declare-fun fromArr2!3 () (_ BitVec 64))

(assert (=> start!37354 (= res!140929 (and (bvsge fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt fromArr1!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvslt fromArr2!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvsle (bvadd fromArr1!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3982 arr1!28)))) (bvsle (bvadd fromArr2!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3982 arr2!28))))))))

(assert (=> start!37354 e!118201))

(assert (=> start!37354 true))

(declare-fun array_inv!3723 (array!8991) Bool)

(assert (=> start!37354 (array_inv!3723 arr2!28)))

(assert (=> start!37354 (array_inv!3723 arr1!28)))

(declare-datatypes ((BitStream!7102 0))(
  ( (BitStream!7103 (buf!4425 array!8991) (currentByte!8409 (_ BitVec 32)) (currentBit!8404 (_ BitVec 32))) )
))
(declare-fun thiss!1565 () BitStream!7102)

(declare-fun e!118200 () Bool)

(declare-fun inv!12 (BitStream!7102) Bool)

(assert (=> start!37354 (and (inv!12 thiss!1565) e!118200)))

(declare-fun b!169540 () Bool)

(declare-fun res!140930 () Bool)

(assert (=> b!169540 (=> (not res!140930) (not e!118201))))

(declare-datatypes ((List!938 0))(
  ( (Nil!935) (Cons!934 (h!1053 Bool) (t!1757 List!938)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!7102 array!8991 (_ BitVec 64) (_ BitVec 64)) List!938)

(assert (=> b!169540 (= res!140930 (= (byteArrayBitContentToList!0 thiss!1565 arr2!28 fromArr2!3 nBits!499) (byteArrayBitContentToList!0 thiss!1565 arr1!28 fromArr1!3 nBits!499)))))

(declare-fun b!169541 () Bool)

(assert (=> b!169541 (= e!118201 (and (bvsgt nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand nBits!499 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand nBits!499 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!499 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!169542 () Bool)

(assert (=> b!169542 (= e!118200 (array_inv!3723 (buf!4425 thiss!1565)))))

(assert (= (and start!37354 res!140929) b!169540))

(assert (= (and b!169540 res!140930) b!169541))

(assert (= start!37354 b!169542))

(declare-fun m!269259 () Bool)

(assert (=> start!37354 m!269259))

(declare-fun m!269261 () Bool)

(assert (=> start!37354 m!269261))

(declare-fun m!269263 () Bool)

(assert (=> start!37354 m!269263))

(declare-fun m!269265 () Bool)

(assert (=> b!169540 m!269265))

(declare-fun m!269267 () Bool)

(assert (=> b!169540 m!269267))

(declare-fun m!269269 () Bool)

(assert (=> b!169542 m!269269))

(push 1)

(assert (not b!169542))

(assert (not start!37354))

(assert (not b!169540))

(check-sat)

(pop 1)

(push 1)

(check-sat)

