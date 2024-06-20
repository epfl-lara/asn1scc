; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37352 () Bool)

(assert start!37352)

(declare-fun res!140924 () Bool)

(declare-fun e!118186 () Bool)

(assert (=> start!37352 (=> (not res!140924) (not e!118186))))

(declare-fun nBits!499 () (_ BitVec 64))

(declare-fun fromArr1!3 () (_ BitVec 64))

(declare-datatypes ((array!8989 0))(
  ( (array!8990 (arr!4905 (Array (_ BitVec 32) (_ BitVec 8))) (size!3981 (_ BitVec 32))) )
))
(declare-fun arr1!28 () array!8989)

(declare-fun arr2!28 () array!8989)

(declare-fun fromArr2!3 () (_ BitVec 64))

(assert (=> start!37352 (= res!140924 (and (bvsge fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt fromArr1!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvslt fromArr2!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvsle (bvadd fromArr1!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3981 arr1!28)))) (bvsle (bvadd fromArr2!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3981 arr2!28))))))))

(assert (=> start!37352 e!118186))

(assert (=> start!37352 true))

(declare-fun array_inv!3722 (array!8989) Bool)

(assert (=> start!37352 (array_inv!3722 arr2!28)))

(assert (=> start!37352 (array_inv!3722 arr1!28)))

(declare-datatypes ((BitStream!7100 0))(
  ( (BitStream!7101 (buf!4424 array!8989) (currentByte!8408 (_ BitVec 32)) (currentBit!8403 (_ BitVec 32))) )
))
(declare-fun thiss!1565 () BitStream!7100)

(declare-fun e!118187 () Bool)

(declare-fun inv!12 (BitStream!7100) Bool)

(assert (=> start!37352 (and (inv!12 thiss!1565) e!118187)))

(declare-fun b!169531 () Bool)

(declare-fun res!140923 () Bool)

(assert (=> b!169531 (=> (not res!140923) (not e!118186))))

(declare-datatypes ((List!937 0))(
  ( (Nil!934) (Cons!933 (h!1052 Bool) (t!1756 List!937)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!7100 array!8989 (_ BitVec 64) (_ BitVec 64)) List!937)

(assert (=> b!169531 (= res!140923 (= (byteArrayBitContentToList!0 thiss!1565 arr2!28 fromArr2!3 nBits!499) (byteArrayBitContentToList!0 thiss!1565 arr1!28 fromArr1!3 nBits!499)))))

(declare-fun b!169532 () Bool)

(assert (=> b!169532 (= e!118186 (and (bvsgt nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (= (bvand fromArr2!3 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand fromArr2!3 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 fromArr2!3) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!169533 () Bool)

(assert (=> b!169533 (= e!118187 (array_inv!3722 (buf!4424 thiss!1565)))))

(assert (= (and start!37352 res!140924) b!169531))

(assert (= (and b!169531 res!140923) b!169532))

(assert (= start!37352 b!169533))

(declare-fun m!269247 () Bool)

(assert (=> start!37352 m!269247))

(declare-fun m!269249 () Bool)

(assert (=> start!37352 m!269249))

(declare-fun m!269251 () Bool)

(assert (=> start!37352 m!269251))

(declare-fun m!269253 () Bool)

(assert (=> b!169531 m!269253))

(declare-fun m!269255 () Bool)

(assert (=> b!169531 m!269255))

(declare-fun m!269257 () Bool)

(assert (=> b!169533 m!269257))

(push 1)

(assert (not b!169533))

(assert (not start!37352))

(assert (not b!169531))

(check-sat)

(pop 1)

(push 1)

(check-sat)

