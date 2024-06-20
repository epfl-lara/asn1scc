; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37072 () Bool)

(assert start!37072)

(declare-fun res!140429 () Bool)

(declare-fun e!117357 () Bool)

(assert (=> start!37072 (=> (not res!140429) (not e!117357))))

(declare-fun nBits!600 () (_ BitVec 32))

(assert (=> start!37072 (= res!140429 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000)))))

(assert (=> start!37072 e!117357))

(assert (=> start!37072 true))

(declare-datatypes ((array!8850 0))(
  ( (array!8851 (arr!4840 (Array (_ BitVec 32) (_ BitVec 8))) (size!3919 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6994 0))(
  ( (BitStream!6995 (buf!4371 array!8850) (currentByte!8325 (_ BitVec 32)) (currentBit!8320 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!6994)

(declare-fun e!117355 () Bool)

(declare-fun inv!12 (BitStream!6994) Bool)

(assert (=> start!37072 (and (inv!12 thiss!1894) e!117355)))

(declare-fun b!168805 () Bool)

(declare-fun res!140428 () Bool)

(assert (=> b!168805 (=> (not res!140428) (not e!117357))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!168805 (= res!140428 (validate_offset_bits!1 ((_ sign_extend 32) (size!3919 (buf!4371 thiss!1894))) ((_ sign_extend 32) (currentByte!8325 thiss!1894)) ((_ sign_extend 32) (currentBit!8320 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(declare-fun b!168806 () Bool)

(assert (=> b!168806 (= e!117357 (and (bvsgt (bvadd (currentBit!8320 thiss!1894) nBits!600) #b00000000000000000000000000001000) (bvsgt (bvsub #b00000000000000000000000000001000 (bvsub (bvadd (currentBit!8320 thiss!1894) nBits!600) #b00000000000000000000000000001000)) #b00000000000000000000000000100000)))))

(declare-fun b!168807 () Bool)

(declare-fun array_inv!3660 (array!8850) Bool)

(assert (=> b!168807 (= e!117355 (array_inv!3660 (buf!4371 thiss!1894)))))

(assert (= (and start!37072 res!140429) b!168805))

(assert (= (and b!168805 res!140428) b!168806))

(assert (= start!37072 b!168807))

(declare-fun m!268401 () Bool)

(assert (=> start!37072 m!268401))

(declare-fun m!268403 () Bool)

(assert (=> b!168805 m!268403))

(declare-fun m!268405 () Bool)

(assert (=> b!168807 m!268405))

(push 1)

(assert (not start!37072))

(assert (not b!168805))

(assert (not b!168807))

(check-sat)

(pop 1)

(push 1)

(check-sat)

