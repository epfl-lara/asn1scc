; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24772 () Bool)

(assert start!24772)

(declare-fun res!104068 () Bool)

(declare-fun e!82680 () Bool)

(assert (=> start!24772 (=> (not res!104068) (not e!82680))))

(declare-fun noOfBytes!1 () (_ BitVec 32))

(declare-datatypes ((array!5669 0))(
  ( (array!5670 (arr!3160 (Array (_ BitVec 32) (_ BitVec 8))) (size!2567 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4458 0))(
  ( (BitStream!4459 (buf!2943 array!5669) (currentByte!5656 (_ BitVec 32)) (currentBit!5651 (_ BitVec 32))) )
))
(declare-fun thiss!1614 () BitStream!4458)

(declare-fun arr!227 () array!5669)

(assert (=> start!24772 (= res!104068 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2567 arr!227)) (bvsle ((_ sign_extend 32) (size!2567 (buf!2943 thiss!1614))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!5656 thiss!1614)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!5651 thiss!1614)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!2567 (buf!2943 thiss!1614))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!5656 thiss!1614)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!5651 thiss!1614)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!24772 e!82680))

(assert (=> start!24772 true))

(declare-fun array_inv!2356 (array!5669) Bool)

(assert (=> start!24772 (array_inv!2356 arr!227)))

(declare-fun e!82681 () Bool)

(declare-fun inv!12 (BitStream!4458) Bool)

(assert (=> start!24772 (and (inv!12 thiss!1614) e!82681)))

(declare-fun b!125638 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!125638 (= e!82680 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!5651 thiss!1614))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!5656 thiss!1614))) ((_ extract 31 0) ((_ sign_extend 32) (size!2567 (buf!2943 thiss!1614)))))))))

(declare-fun b!125639 () Bool)

(assert (=> b!125639 (= e!82681 (array_inv!2356 (buf!2943 thiss!1614)))))

(assert (= (and start!24772 res!104068) b!125638))

(assert (= start!24772 b!125639))

(declare-fun m!191007 () Bool)

(assert (=> start!24772 m!191007))

(declare-fun m!191009 () Bool)

(assert (=> start!24772 m!191009))

(declare-fun m!191011 () Bool)

(assert (=> b!125638 m!191011))

(declare-fun m!191013 () Bool)

(assert (=> b!125639 m!191013))

(check-sat (not start!24772) (not b!125639) (not b!125638))
(check-sat)
(get-model)

(declare-fun d!40834 () Bool)

(assert (=> d!40834 (= (array_inv!2356 arr!227) (bvsge (size!2567 arr!227) #b00000000000000000000000000000000))))

(assert (=> start!24772 d!40834))

(declare-fun d!40836 () Bool)

(assert (=> d!40836 (= (inv!12 thiss!1614) (invariant!0 (currentBit!5651 thiss!1614) (currentByte!5656 thiss!1614) (size!2567 (buf!2943 thiss!1614))))))

(declare-fun bs!9889 () Bool)

(assert (= bs!9889 d!40836))

(declare-fun m!191023 () Bool)

(assert (=> bs!9889 m!191023))

(assert (=> start!24772 d!40836))

(declare-fun d!40838 () Bool)

(assert (=> d!40838 (= (array_inv!2356 (buf!2943 thiss!1614)) (bvsge (size!2567 (buf!2943 thiss!1614)) #b00000000000000000000000000000000))))

(assert (=> b!125639 d!40838))

(declare-fun d!40840 () Bool)

(assert (=> d!40840 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!5651 thiss!1614))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!5656 thiss!1614))) ((_ extract 31 0) ((_ sign_extend 32) (size!2567 (buf!2943 thiss!1614))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!5651 thiss!1614))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!5651 thiss!1614))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!5656 thiss!1614))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!5656 thiss!1614))) ((_ extract 31 0) ((_ sign_extend 32) (size!2567 (buf!2943 thiss!1614))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!5651 thiss!1614))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!5656 thiss!1614))) ((_ extract 31 0) ((_ sign_extend 32) (size!2567 (buf!2943 thiss!1614)))))))))))

(assert (=> b!125638 d!40840))

(check-sat (not d!40836))
(check-sat)
