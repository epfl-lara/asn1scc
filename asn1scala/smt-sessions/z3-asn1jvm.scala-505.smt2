; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14870 () Bool)

(assert start!14870)

(declare-fun nBits!322 () (_ BitVec 64))

(declare-datatypes ((array!3162 0))(
  ( (array!3163 (arr!2074 (Array (_ BitVec 32) (_ BitVec 8))) (size!1473 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2520 0))(
  ( (BitStream!2521 (buf!1857 array!3162) (currentByte!3654 (_ BitVec 32)) (currentBit!3649 (_ BitVec 32))) )
))
(declare-fun thiss!1090 () BitStream!2520)

(assert (=> start!14870 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000) (or (bvsgt ((_ sign_extend 32) (size!1473 (buf!1857 thiss!1090))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!3654 thiss!1090)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!3649 thiss!1090)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!14870 true))

(declare-fun e!50204 () Bool)

(declare-fun inv!12 (BitStream!2520) Bool)

(assert (=> start!14870 (and (inv!12 thiss!1090) e!50204)))

(declare-fun b!76530 () Bool)

(declare-fun array_inv!1319 (array!3162) Bool)

(assert (=> b!76530 (= e!50204 (array_inv!1319 (buf!1857 thiss!1090)))))

(assert (= start!14870 b!76530))

(declare-fun m!121767 () Bool)

(assert (=> start!14870 m!121767))

(declare-fun m!121769 () Bool)

(assert (=> b!76530 m!121769))

(check-sat (not start!14870) (not b!76530))
(check-sat)
