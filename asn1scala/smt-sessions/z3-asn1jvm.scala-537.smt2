; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15716 () Bool)

(assert start!15716)

(declare-fun nBits!516 () (_ BitVec 64))

(declare-datatypes ((array!3399 0))(
  ( (array!3400 (arr!2170 (Array (_ BitVec 32) (_ BitVec 8))) (size!1569 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2700 0))(
  ( (BitStream!2701 (buf!1959 array!3399) (currentByte!3836 (_ BitVec 32)) (currentBit!3831 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2700)

(assert (=> start!15716 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000) (or (bvsgt ((_ sign_extend 32) (size!1569 (buf!1959 thiss!1716))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!3836 thiss!1716)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!3831 thiss!1716)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!15716 true))

(declare-fun e!52193 () Bool)

(declare-fun inv!12 (BitStream!2700) Bool)

(assert (=> start!15716 (and (inv!12 thiss!1716) e!52193)))

(declare-fun b!79494 () Bool)

(declare-fun array_inv!1415 (array!3399) Bool)

(assert (=> b!79494 (= e!52193 (array_inv!1415 (buf!1959 thiss!1716)))))

(assert (= start!15716 b!79494))

(declare-fun m!124903 () Bool)

(assert (=> start!15716 m!124903))

(declare-fun m!124905 () Bool)

(assert (=> b!79494 m!124905))

(check-sat (not b!79494) (not start!15716))
(check-sat)
