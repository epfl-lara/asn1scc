; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31866 () Bool)

(assert start!31866)

(declare-fun nBits!578 () (_ BitVec 32))

(declare-datatypes ((array!7435 0))(
  ( (array!7436 (arr!4292 (Array (_ BitVec 32) (_ BitVec 8))) (size!3371 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5910 0))(
  ( (BitStream!5911 (buf!3829 array!7435) (currentByte!7035 (_ BitVec 32)) (currentBit!7030 (_ BitVec 32))) )
))
(declare-fun thiss!1825 () BitStream!5910)

(assert (=> start!31866 (and (bvsge nBits!578 #b00000000000000000000000000000000) (bvsle nBits!578 #b00000000000000000000000001000000) (or (bvsgt ((_ sign_extend 32) (size!3371 (buf!3829 thiss!1825))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!7035 thiss!1825)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!7030 thiss!1825)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!31866 true))

(declare-fun e!107984 () Bool)

(declare-fun inv!12 (BitStream!5910) Bool)

(assert (=> start!31866 (and (inv!12 thiss!1825) e!107984)))

(declare-fun b!158655 () Bool)

(declare-fun array_inv!3118 (array!7435) Bool)

(assert (=> b!158655 (= e!107984 (array_inv!3118 (buf!3829 thiss!1825)))))

(assert (= start!31866 b!158655))

(declare-fun m!249189 () Bool)

(assert (=> start!31866 m!249189))

(declare-fun m!249191 () Bool)

(assert (=> b!158655 m!249191))

(check-sat (not start!31866) (not b!158655))
(check-sat)
