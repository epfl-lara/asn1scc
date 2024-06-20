; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36922 () Bool)

(assert start!36922)

(declare-fun res!140311 () Bool)

(declare-fun e!117193 () Bool)

(assert (=> start!36922 (=> (not res!140311) (not e!117193))))

(declare-fun nBits!600 () (_ BitVec 32))

(assert (=> start!36922 (= res!140311 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000)))))

(assert (=> start!36922 e!117193))

(assert (=> start!36922 true))

(declare-datatypes ((array!8802 0))(
  ( (array!8803 (arr!4822 (Array (_ BitVec 32) (_ BitVec 8))) (size!3901 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6958 0))(
  ( (BitStream!6959 (buf!4353 array!8802) (currentByte!8274 (_ BitVec 32)) (currentBit!8269 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!6958)

(declare-fun e!117195 () Bool)

(declare-fun inv!12 (BitStream!6958) Bool)

(assert (=> start!36922 (and (inv!12 thiss!1894) e!117195)))

(declare-fun b!168634 () Bool)

(declare-fun res!140312 () Bool)

(assert (=> b!168634 (=> (not res!140312) (not e!117193))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!168634 (= res!140312 (validate_offset_bits!1 ((_ sign_extend 32) (size!3901 (buf!4353 thiss!1894))) ((_ sign_extend 32) (currentByte!8274 thiss!1894)) ((_ sign_extend 32) (currentBit!8269 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(declare-fun b!168635 () Bool)

(assert (=> b!168635 (= e!117193 (and (bvsle (bvadd (currentBit!8269 thiss!1894) nBits!600) #b00000000000000000000000000001000) (or (bvslt nBits!600 #b00000000000000000000000000000000) (bvsge nBits!600 #b00000000000000000000000000001001))))))

(declare-fun b!168636 () Bool)

(declare-fun array_inv!3642 (array!8802) Bool)

(assert (=> b!168636 (= e!117195 (array_inv!3642 (buf!4353 thiss!1894)))))

(assert (= (and start!36922 res!140311) b!168634))

(assert (= (and b!168634 res!140312) b!168635))

(assert (= start!36922 b!168636))

(declare-fun m!268233 () Bool)

(assert (=> start!36922 m!268233))

(declare-fun m!268235 () Bool)

(assert (=> b!168634 m!268235))

(declare-fun m!268237 () Bool)

(assert (=> b!168636 m!268237))

(push 1)

(assert (not b!168634))

(assert (not b!168636))

(assert (not start!36922))

(check-sat)

(pop 1)

(push 1)

(check-sat)

