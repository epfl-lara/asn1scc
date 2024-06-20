; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24750 () Bool)

(assert start!24750)

(declare-fun noOfBytes!1 () (_ BitVec 32))

(declare-datatypes ((array!5660 0))(
  ( (array!5661 (arr!3157 (Array (_ BitVec 32) (_ BitVec 8))) (size!2564 (_ BitVec 32))) )
))
(declare-fun arr!227 () array!5660)

(declare-datatypes ((BitStream!4452 0))(
  ( (BitStream!4453 (buf!2940 array!5660) (currentByte!5651 (_ BitVec 32)) (currentBit!5646 (_ BitVec 32))) )
))
(declare-fun thiss!1614 () BitStream!4452)

(assert (=> start!24750 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2564 arr!227)) (bvsle ((_ sign_extend 32) (size!2564 (buf!2940 thiss!1614))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!5651 thiss!1614)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!5646 thiss!1614)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!2564 (buf!2940 thiss!1614))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!5651 thiss!1614)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!5646 thiss!1614)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!24750 true))

(declare-fun array_inv!2353 (array!5660) Bool)

(assert (=> start!24750 (array_inv!2353 arr!227)))

(declare-fun e!82648 () Bool)

(declare-fun inv!12 (BitStream!4452) Bool)

(assert (=> start!24750 (and (inv!12 thiss!1614) e!82648)))

(declare-fun b!125624 () Bool)

(assert (=> b!125624 (= e!82648 (array_inv!2353 (buf!2940 thiss!1614)))))

(assert (= start!24750 b!125624))

(declare-fun m!190983 () Bool)

(assert (=> start!24750 m!190983))

(declare-fun m!190985 () Bool)

(assert (=> start!24750 m!190985))

(declare-fun m!190987 () Bool)

(assert (=> b!125624 m!190987))

(check-sat (not start!24750) (not b!125624))
(check-sat)
(get-model)

(declare-fun d!40812 () Bool)

(assert (=> d!40812 (= (array_inv!2353 arr!227) (bvsge (size!2564 arr!227) #b00000000000000000000000000000000))))

(assert (=> start!24750 d!40812))

(declare-fun d!40814 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!40814 (= (inv!12 thiss!1614) (invariant!0 (currentBit!5646 thiss!1614) (currentByte!5651 thiss!1614) (size!2564 (buf!2940 thiss!1614))))))

(declare-fun bs!9884 () Bool)

(assert (= bs!9884 d!40814))

(declare-fun m!190995 () Bool)

(assert (=> bs!9884 m!190995))

(assert (=> start!24750 d!40814))

(declare-fun d!40820 () Bool)

(assert (=> d!40820 (= (array_inv!2353 (buf!2940 thiss!1614)) (bvsge (size!2564 (buf!2940 thiss!1614)) #b00000000000000000000000000000000))))

(assert (=> b!125624 d!40820))

(check-sat (not d!40814))
(check-sat)
(get-model)

(declare-fun d!40824 () Bool)

(assert (=> d!40824 (= (invariant!0 (currentBit!5646 thiss!1614) (currentByte!5651 thiss!1614) (size!2564 (buf!2940 thiss!1614))) (and (bvsge (currentBit!5646 thiss!1614) #b00000000000000000000000000000000) (bvslt (currentBit!5646 thiss!1614) #b00000000000000000000000000001000) (bvsge (currentByte!5651 thiss!1614) #b00000000000000000000000000000000) (or (bvslt (currentByte!5651 thiss!1614) (size!2564 (buf!2940 thiss!1614))) (and (= (currentBit!5646 thiss!1614) #b00000000000000000000000000000000) (= (currentByte!5651 thiss!1614) (size!2564 (buf!2940 thiss!1614)))))))))

(assert (=> d!40814 d!40824))

(check-sat)
