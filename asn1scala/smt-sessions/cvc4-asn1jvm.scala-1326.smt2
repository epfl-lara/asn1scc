; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37358 () Bool)

(assert start!37358)

(declare-fun res!140942 () Bool)

(declare-fun e!118231 () Bool)

(assert (=> start!37358 (=> (not res!140942) (not e!118231))))

(declare-fun nBits!499 () (_ BitVec 64))

(declare-datatypes ((array!8995 0))(
  ( (array!8996 (arr!4908 (Array (_ BitVec 32) (_ BitVec 8))) (size!3984 (_ BitVec 32))) )
))
(declare-fun arr1!28 () array!8995)

(declare-fun fromArr2!3 () (_ BitVec 64))

(declare-fun fromArr1!3 () (_ BitVec 64))

(declare-fun arr2!28 () array!8995)

(assert (=> start!37358 (= res!140942 (and (bvsge fromArr1!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge fromArr2!3 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt fromArr1!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvslt fromArr2!3 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!499)) (bvsle (bvadd fromArr1!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3984 arr1!28)))) (bvsle (bvadd fromArr2!3 nBits!499) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3984 arr2!28))))))))

(assert (=> start!37358 e!118231))

(assert (=> start!37358 true))

(declare-fun array_inv!3725 (array!8995) Bool)

(assert (=> start!37358 (array_inv!3725 arr2!28)))

(assert (=> start!37358 (array_inv!3725 arr1!28)))

(declare-datatypes ((BitStream!7106 0))(
  ( (BitStream!7107 (buf!4427 array!8995) (currentByte!8411 (_ BitVec 32)) (currentBit!8406 (_ BitVec 32))) )
))
(declare-fun thiss!1565 () BitStream!7106)

(declare-fun e!118229 () Bool)

(declare-fun inv!12 (BitStream!7106) Bool)

(assert (=> start!37358 (and (inv!12 thiss!1565) e!118229)))

(declare-fun b!169558 () Bool)

(declare-fun res!140941 () Bool)

(assert (=> b!169558 (=> (not res!140941) (not e!118231))))

(declare-datatypes ((List!940 0))(
  ( (Nil!937) (Cons!936 (h!1055 Bool) (t!1759 List!940)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!7106 array!8995 (_ BitVec 64) (_ BitVec 64)) List!940)

(assert (=> b!169558 (= res!140941 (= (byteArrayBitContentToList!0 thiss!1565 arr2!28 fromArr2!3 nBits!499) (byteArrayBitContentToList!0 thiss!1565 arr1!28 fromArr1!3 nBits!499)))))

(declare-fun b!169559 () Bool)

(assert (=> b!169559 (= e!118231 (and (bvsgt nBits!499 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand nBits!499 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand nBits!499 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!499 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!169560 () Bool)

(assert (=> b!169560 (= e!118229 (array_inv!3725 (buf!4427 thiss!1565)))))

(assert (= (and start!37358 res!140942) b!169558))

(assert (= (and b!169558 res!140941) b!169559))

(assert (= start!37358 b!169560))

(declare-fun m!269283 () Bool)

(assert (=> start!37358 m!269283))

(declare-fun m!269285 () Bool)

(assert (=> start!37358 m!269285))

(declare-fun m!269287 () Bool)

(assert (=> start!37358 m!269287))

(declare-fun m!269289 () Bool)

(assert (=> b!169558 m!269289))

(declare-fun m!269291 () Bool)

(assert (=> b!169558 m!269291))

(declare-fun m!269293 () Bool)

(assert (=> b!169560 m!269293))

(push 1)

(assert (not b!169560))

(assert (not start!37358))

(assert (not b!169558))

(check-sat)

(pop 1)

(push 1)

(check-sat)

