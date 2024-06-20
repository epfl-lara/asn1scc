; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63694 () Bool)

(assert start!63694)

(declare-datatypes ((array!16604 0))(
  ( (array!16605 (arr!8162 (Array (_ BitVec 32) (_ BitVec 8))) (size!7166 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12702 0))(
  ( (BitStream!12703 (buf!7412 array!16604) (currentByte!13744 (_ BitVec 32)) (currentBit!13739 (_ BitVec 32))) )
))
(declare-fun thiss!1929 () BitStream!12702)

(assert (=> start!63694 (and (not (= #b00000000000000000000000000000000 (bvand (currentBit!13739 thiss!1929) #b10000000000000000000000000000000))) (not (= #b00000000000000000000000000000000 (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13739 thiss!1929)) #b10000000000000000000000000000000))))))

(declare-fun e!202988 () Bool)

(declare-fun inv!12 (BitStream!12702) Bool)

(assert (=> start!63694 (and (inv!12 thiss!1929) e!202988)))

(declare-fun b!284007 () Bool)

(declare-fun array_inv!6859 (array!16604) Bool)

(assert (=> b!284007 (= e!202988 (array_inv!6859 (buf!7412 thiss!1929)))))

(assert (= start!63694 b!284007))

(declare-fun m!417145 () Bool)

(assert (=> start!63694 m!417145))

(declare-fun m!417147 () Bool)

(assert (=> b!284007 m!417147))

(check-sat (not b!284007) (not start!63694))
(check-sat)
(get-model)

(declare-fun d!97654 () Bool)

(assert (=> d!97654 (= (array_inv!6859 (buf!7412 thiss!1929)) (bvsge (size!7166 (buf!7412 thiss!1929)) #b00000000000000000000000000000000))))

(assert (=> b!284007 d!97654))

(declare-fun d!97656 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!97656 (= (inv!12 thiss!1929) (invariant!0 (currentBit!13739 thiss!1929) (currentByte!13744 thiss!1929) (size!7166 (buf!7412 thiss!1929))))))

(declare-fun bs!24675 () Bool)

(assert (= bs!24675 d!97656))

(declare-fun m!417153 () Bool)

(assert (=> bs!24675 m!417153))

(assert (=> start!63694 d!97656))

(check-sat (not d!97656))
(check-sat)
(get-model)

(declare-fun d!97662 () Bool)

(assert (=> d!97662 (= (invariant!0 (currentBit!13739 thiss!1929) (currentByte!13744 thiss!1929) (size!7166 (buf!7412 thiss!1929))) (and (bvsge (currentBit!13739 thiss!1929) #b00000000000000000000000000000000) (bvslt (currentBit!13739 thiss!1929) #b00000000000000000000000000001000) (bvsge (currentByte!13744 thiss!1929) #b00000000000000000000000000000000) (or (bvslt (currentByte!13744 thiss!1929) (size!7166 (buf!7412 thiss!1929))) (and (= (currentBit!13739 thiss!1929) #b00000000000000000000000000000000) (= (currentByte!13744 thiss!1929) (size!7166 (buf!7412 thiss!1929)))))))))

(assert (=> d!97656 d!97662))

(check-sat)
