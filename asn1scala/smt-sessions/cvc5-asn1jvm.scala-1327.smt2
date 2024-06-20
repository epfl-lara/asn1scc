; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37360 () Bool)

(assert start!37360)

(declare-fun res!140947 () Bool)

(declare-fun e!118248 () Bool)

(assert (=> start!37360 (=> (not res!140947) (not e!118248))))

(declare-fun nBits!499 () (_ BitVec 64))

(declare-fun fromArr1!3 () (_ BitVec 64))

(declare-datatypes ((array!8997 0))(
  ( (array!8998 (arr!4909 (Array (_ BitVec 32) (_ BitVec 8))) (size!3985 (_ BitVec 32))) )
))
(declare-fun arr1!28 () array!8997)

(declare-fun arr2!28 () array!8997)

(declare-fun fromArr2!3 () (_ BitVec 64))

(assert (=> start!37360 (= res!140947 (and (bvsge fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt fromArr1!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvslt fromArr2!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvsle (bvadd fromArr1!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3985 arr1!28)))) (bvsle (bvadd fromArr2!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3985 arr2!28))))))))

(assert (=> start!37360 e!118248))

(assert (=> start!37360 true))

(declare-fun array_inv!3726 (array!8997) Bool)

(assert (=> start!37360 (array_inv!3726 arr2!28)))

(assert (=> start!37360 (array_inv!3726 arr1!28)))

(declare-datatypes ((BitStream!7108 0))(
  ( (BitStream!7109 (buf!4428 array!8997) (currentByte!8412 (_ BitVec 32)) (currentBit!8407 (_ BitVec 32))) )
))
(declare-fun thiss!1565 () BitStream!7108)

(declare-fun e!118246 () Bool)

(declare-fun inv!12 (BitStream!7108) Bool)

(assert (=> start!37360 (and (inv!12 thiss!1565) e!118246)))

(declare-fun b!169567 () Bool)

(declare-fun res!140948 () Bool)

(assert (=> b!169567 (=> (not res!140948) (not e!118248))))

(declare-datatypes ((List!941 0))(
  ( (Nil!938) (Cons!937 (h!1056 Bool) (t!1760 List!941)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!7108 array!8997 (_ BitVec 64) (_ BitVec 64)) List!941)

(assert (=> b!169567 (= res!140948 (= (byteArrayBitContentToList!0 thiss!1565 arr2!28 fromArr2!3 nBits!499) (byteArrayBitContentToList!0 thiss!1565 arr1!28 fromArr1!3 nBits!499)))))

(declare-fun b!169568 () Bool)

(assert (=> b!169568 (= e!118248 (and (bvsgt nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge (bvsub nBits!499 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!499)))))

(declare-fun b!169569 () Bool)

(assert (=> b!169569 (= e!118246 (array_inv!3726 (buf!4428 thiss!1565)))))

(assert (= (and start!37360 res!140947) b!169567))

(assert (= (and b!169567 res!140948) b!169568))

(assert (= start!37360 b!169569))

(declare-fun m!269295 () Bool)

(assert (=> start!37360 m!269295))

(declare-fun m!269297 () Bool)

(assert (=> start!37360 m!269297))

(declare-fun m!269299 () Bool)

(assert (=> start!37360 m!269299))

(declare-fun m!269301 () Bool)

(assert (=> b!169567 m!269301))

(declare-fun m!269303 () Bool)

(assert (=> b!169567 m!269303))

(declare-fun m!269305 () Bool)

(assert (=> b!169569 m!269305))

(push 1)

(assert (not b!169569))

(assert (not start!37360))

(assert (not b!169567))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

