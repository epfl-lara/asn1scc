; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37406 () Bool)

(assert start!37406)

(declare-fun nBits!499 () (_ BitVec 64))

(declare-fun b!169700 () Bool)

(declare-fun fromArr1!3 () (_ BitVec 64))

(declare-datatypes ((array!9016 0))(
  ( (array!9017 (arr!4920 (Array (_ BitVec 32) (_ BitVec 8))) (size!3993 (_ BitVec 32))) )
))
(declare-fun arr2!28 () array!9016)

(declare-fun e!118394 () Bool)

(declare-fun fromArr2!3 () (_ BitVec 64))

(declare-fun arr1!28 () array!9016)

(declare-datatypes ((BitStream!7124 0))(
  ( (BitStream!7125 (buf!4436 array!9016) (currentByte!8420 (_ BitVec 32)) (currentBit!8415 (_ BitVec 32))) )
))
(declare-fun thiss!1565 () BitStream!7124)

(declare-fun checkByteArrayBitContent!0 (BitStream!7124 array!9016 array!9016 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!169700 (= e!118394 (not (checkByteArrayBitContent!0 thiss!1565 arr1!28 arr2!28 fromArr1!3 fromArr2!3 nBits!499)))))

(declare-fun res!141031 () Bool)

(assert (=> start!37406 (=> (not res!141031) (not e!118394))))

(assert (=> start!37406 (= res!141031 (and (bvsge fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt fromArr1!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvslt fromArr2!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvsle (bvadd fromArr1!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3993 arr1!28)))) (bvsle (bvadd fromArr2!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3993 arr2!28))))))))

(assert (=> start!37406 e!118394))

(assert (=> start!37406 true))

(declare-fun array_inv!3734 (array!9016) Bool)

(assert (=> start!37406 (array_inv!3734 arr2!28)))

(assert (=> start!37406 (array_inv!3734 arr1!28)))

(declare-fun e!118397 () Bool)

(declare-fun inv!12 (BitStream!7124) Bool)

(assert (=> start!37406 (and (inv!12 thiss!1565) e!118397)))

(declare-fun b!169698 () Bool)

(declare-fun res!141032 () Bool)

(assert (=> b!169698 (=> (not res!141032) (not e!118394))))

(declare-datatypes ((List!949 0))(
  ( (Nil!946) (Cons!945 (h!1064 Bool) (t!1768 List!949)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!7124 array!9016 (_ BitVec 64) (_ BitVec 64)) List!949)

(assert (=> b!169698 (= res!141032 (= (byteArrayBitContentToList!0 thiss!1565 arr2!28 fromArr2!3 nBits!499) (byteArrayBitContentToList!0 thiss!1565 arr1!28 fromArr1!3 nBits!499)))))

(declare-fun b!169701 () Bool)

(assert (=> b!169701 (= e!118397 (array_inv!3734 (buf!4436 thiss!1565)))))

(declare-fun b!169699 () Bool)

(declare-fun res!141030 () Bool)

(assert (=> b!169699 (=> (not res!141030) (not e!118394))))

(assert (=> b!169699 (= res!141030 (bvsle nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!37406 res!141031) b!169698))

(assert (= (and b!169698 res!141032) b!169699))

(assert (= (and b!169699 res!141030) b!169700))

(assert (= start!37406 b!169701))

(declare-fun m!269467 () Bool)

(assert (=> b!169700 m!269467))

(declare-fun m!269469 () Bool)

(assert (=> start!37406 m!269469))

(declare-fun m!269471 () Bool)

(assert (=> start!37406 m!269471))

(declare-fun m!269473 () Bool)

(assert (=> start!37406 m!269473))

(declare-fun m!269475 () Bool)

(assert (=> b!169698 m!269475))

(declare-fun m!269477 () Bool)

(assert (=> b!169698 m!269477))

(declare-fun m!269479 () Bool)

(assert (=> b!169701 m!269479))

(push 1)

(assert (not b!169701))

(assert (not b!169700))

(assert (not b!169698))

(assert (not start!37406))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!59963 () Bool)

(assert (=> d!59963 (= (array_inv!3734 (buf!4436 thiss!1565)) (bvsge (size!3993 (buf!4436 thiss!1565)) #b00000000000000000000000000000000))))

(assert (=> b!169701 d!59963))

(declare-fun d!59965 () Bool)

(declare-fun res!141049 () Bool)

(declare-fun e!118421 () Bool)

(assert (=> d!59965 (=> res!141049 e!118421)))

