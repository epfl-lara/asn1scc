; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31910 () Bool)

(assert start!31910)

(declare-fun res!132512 () Bool)

(declare-fun e!108052 () Bool)

(assert (=> start!31910 (=> (not res!132512) (not e!108052))))

(declare-fun nBits!578 () (_ BitVec 32))

(declare-datatypes ((array!7457 0))(
  ( (array!7458 (arr!4301 (Array (_ BitVec 32) (_ BitVec 8))) (size!3380 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5928 0))(
  ( (BitStream!5929 (buf!3838 array!7457) (currentByte!7048 (_ BitVec 32)) (currentBit!7043 (_ BitVec 32))) )
))
(declare-fun thiss!1825 () BitStream!5928)

(assert (=> start!31910 (= res!132512 (and (bvsge nBits!578 #b00000000000000000000000000000000) (bvsle nBits!578 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!3380 (buf!3838 thiss!1825))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!7048 thiss!1825)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!7043 thiss!1825)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!3380 (buf!3838 thiss!1825))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!7048 thiss!1825)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!7043 thiss!1825)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!31910 e!108052))

(assert (=> start!31910 true))

(declare-fun e!108054 () Bool)

(declare-fun inv!12 (BitStream!5928) Bool)

(assert (=> start!31910 (and (inv!12 thiss!1825) e!108054)))

(declare-fun b!158701 () Bool)

(declare-fun res!132511 () Bool)

(assert (=> b!158701 (=> (not res!132511) (not e!108052))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!158701 (= res!132511 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!7043 thiss!1825))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!7048 thiss!1825))) ((_ extract 31 0) ((_ sign_extend 32) (size!3380 (buf!3838 thiss!1825))))))))

(declare-fun b!158702 () Bool)

(assert (=> b!158702 (= e!108052 (bvslt ((_ sign_extend 32) nBits!578) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!158703 () Bool)

(declare-fun array_inv!3127 (array!7457) Bool)

(assert (=> b!158703 (= e!108054 (array_inv!3127 (buf!3838 thiss!1825)))))

(assert (= (and start!31910 res!132512) b!158701))

(assert (= (and b!158701 res!132511) b!158702))

(assert (= start!31910 b!158703))

(declare-fun m!249241 () Bool)

(assert (=> start!31910 m!249241))

(declare-fun m!249243 () Bool)

(assert (=> b!158701 m!249243))

(declare-fun m!249245 () Bool)

(assert (=> b!158703 m!249245))

(check-sat (not start!31910) (not b!158701) (not b!158703))
(check-sat)
