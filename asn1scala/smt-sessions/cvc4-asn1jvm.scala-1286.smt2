; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36632 () Bool)

(assert start!36632)

(declare-fun nBits!600 () (_ BitVec 32))

(declare-datatypes ((array!8724 0))(
  ( (array!8725 (arr!4794 (Array (_ BitVec 32) (_ BitVec 8))) (size!3873 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6902 0))(
  ( (BitStream!6903 (buf!4325 array!8724) (currentByte!8185 (_ BitVec 32)) (currentBit!8180 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!6902)

(assert (=> start!36632 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000) (or (bvsgt ((_ sign_extend 32) (size!3873 (buf!4325 thiss!1894))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!8185 thiss!1894)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!8180 thiss!1894)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!36632 true))

(declare-fun e!116849 () Bool)

(declare-fun inv!12 (BitStream!6902) Bool)

(assert (=> start!36632 (and (inv!12 thiss!1894) e!116849)))

(declare-fun b!168246 () Bool)

(declare-fun array_inv!3614 (array!8724) Bool)

(assert (=> b!168246 (= e!116849 (array_inv!3614 (buf!4325 thiss!1894)))))

(assert (= start!36632 b!168246))

(declare-fun m!267881 () Bool)

(assert (=> start!36632 m!267881))

(declare-fun m!267883 () Bool)

(assert (=> b!168246 m!267883))

(push 1)

(assert (not start!36632))

(assert (not b!168246))

(check-sat)

(pop 1)

