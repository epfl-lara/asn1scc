; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37350 () Bool)

(assert start!37350)

(declare-fun res!140917 () Bool)

(declare-fun e!118173 () Bool)

(assert (=> start!37350 (=> (not res!140917) (not e!118173))))

(declare-fun nBits!499 () (_ BitVec 64))

(declare-fun fromArr1!3 () (_ BitVec 64))

(declare-datatypes ((array!8987 0))(
  ( (array!8988 (arr!4904 (Array (_ BitVec 32) (_ BitVec 8))) (size!3980 (_ BitVec 32))) )
))
(declare-fun arr1!28 () array!8987)

(declare-fun arr2!28 () array!8987)

(declare-fun fromArr2!3 () (_ BitVec 64))

(assert (=> start!37350 (= res!140917 (and (bvsge fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt fromArr1!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvslt fromArr2!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvsle (bvadd fromArr1!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3980 arr1!28)))) (bvsle (bvadd fromArr2!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3980 arr2!28))))))))

(assert (=> start!37350 e!118173))

(assert (=> start!37350 true))

(declare-fun array_inv!3721 (array!8987) Bool)

(assert (=> start!37350 (array_inv!3721 arr2!28)))

(assert (=> start!37350 (array_inv!3721 arr1!28)))

(declare-datatypes ((BitStream!7098 0))(
  ( (BitStream!7099 (buf!4423 array!8987) (currentByte!8407 (_ BitVec 32)) (currentBit!8402 (_ BitVec 32))) )
))
(declare-fun thiss!1565 () BitStream!7098)

(declare-fun e!118170 () Bool)

(declare-fun inv!12 (BitStream!7098) Bool)

(assert (=> start!37350 (and (inv!12 thiss!1565) e!118170)))

(declare-fun b!169522 () Bool)

(declare-fun res!140918 () Bool)

(assert (=> b!169522 (=> (not res!140918) (not e!118173))))

(declare-datatypes ((List!936 0))(
  ( (Nil!933) (Cons!932 (h!1051 Bool) (t!1755 List!936)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!7098 array!8987 (_ BitVec 64) (_ BitVec 64)) List!936)

(assert (=> b!169522 (= res!140918 (= (byteArrayBitContentToList!0 thiss!1565 arr2!28 fromArr2!3 nBits!499) (byteArrayBitContentToList!0 thiss!1565 arr1!28 fromArr1!3 nBits!499)))))

(declare-fun b!169523 () Bool)

(assert (=> b!169523 (= e!118173 (and (bvsgt nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (= (bvand fromArr2!3 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand fromArr2!3 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr2!3) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!169524 () Bool)

(assert (=> b!169524 (= e!118170 (array_inv!3721 (buf!4423 thiss!1565)))))

(assert (= (and start!37350 res!140917) b!169522))

(assert (= (and b!169522 res!140918) b!169523))

(assert (= start!37350 b!169524))

(declare-fun m!269235 () Bool)

(assert (=> start!37350 m!269235))

(declare-fun m!269237 () Bool)

(assert (=> start!37350 m!269237))

(declare-fun m!269239 () Bool)

(assert (=> start!37350 m!269239))

(declare-fun m!269241 () Bool)

(assert (=> b!169522 m!269241))

(declare-fun m!269243 () Bool)

(assert (=> b!169522 m!269243))

(declare-fun m!269245 () Bool)

(assert (=> b!169524 m!269245))

(check-sat (not b!169524) (not start!37350) (not b!169522))
(check-sat)
