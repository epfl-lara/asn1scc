; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36630 () Bool)

(assert start!36630)

(declare-fun nBits!600 () (_ BitVec 32))

(declare-datatypes ((array!8722 0))(
  ( (array!8723 (arr!4793 (Array (_ BitVec 32) (_ BitVec 8))) (size!3872 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6900 0))(
  ( (BitStream!6901 (buf!4324 array!8722) (currentByte!8184 (_ BitVec 32)) (currentBit!8179 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!6900)

(assert (=> start!36630 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000) (or (bvsgt ((_ sign_extend 32) (size!3872 (buf!4324 thiss!1894))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!8184 thiss!1894)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!8179 thiss!1894)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!36630 true))

(declare-fun e!116843 () Bool)

(declare-fun inv!12 (BitStream!6900) Bool)

(assert (=> start!36630 (and (inv!12 thiss!1894) e!116843)))

(declare-fun b!168243 () Bool)

(declare-fun array_inv!3613 (array!8722) Bool)

(assert (=> b!168243 (= e!116843 (array_inv!3613 (buf!4324 thiss!1894)))))

(assert (= start!36630 b!168243))

(declare-fun m!267877 () Bool)

(assert (=> start!36630 m!267877))

(declare-fun m!267879 () Bool)

(assert (=> b!168243 m!267879))

(check-sat (not start!36630) (not b!168243))
(check-sat)
