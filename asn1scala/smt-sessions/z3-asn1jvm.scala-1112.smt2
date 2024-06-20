; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31872 () Bool)

(assert start!31872)

(declare-fun nBits!578 () (_ BitVec 32))

(declare-datatypes ((array!7441 0))(
  ( (array!7442 (arr!4295 (Array (_ BitVec 32) (_ BitVec 8))) (size!3374 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5916 0))(
  ( (BitStream!5917 (buf!3832 array!7441) (currentByte!7038 (_ BitVec 32)) (currentBit!7033 (_ BitVec 32))) )
))
(declare-fun thiss!1825 () BitStream!5916)

(assert (=> start!31872 (and (bvsge nBits!578 #b00000000000000000000000000000000) (bvsle nBits!578 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!3374 (buf!3832 thiss!1825))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!7038 thiss!1825)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!7033 thiss!1825)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!3374 (buf!3832 thiss!1825))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!7038 thiss!1825)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!7033 thiss!1825)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!31872 true))

(declare-fun e!108002 () Bool)

(declare-fun inv!12 (BitStream!5916) Bool)

(assert (=> start!31872 (and (inv!12 thiss!1825) e!108002)))

(declare-fun b!158664 () Bool)

(declare-fun array_inv!3121 (array!7441) Bool)

(assert (=> b!158664 (= e!108002 (array_inv!3121 (buf!3832 thiss!1825)))))

(assert (= start!31872 b!158664))

(declare-fun m!249201 () Bool)

(assert (=> start!31872 m!249201))

(declare-fun m!249203 () Bool)

(assert (=> b!158664 m!249203))

(check-sat (not start!31872) (not b!158664))
(check-sat)
(get-model)

(declare-fun d!53277 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!53277 (= (inv!12 thiss!1825) (invariant!0 (currentBit!7033 thiss!1825) (currentByte!7038 thiss!1825) (size!3374 (buf!3832 thiss!1825))))))

(declare-fun bs!13151 () Bool)

(assert (= bs!13151 d!53277))

(declare-fun m!249209 () Bool)

(assert (=> bs!13151 m!249209))

(assert (=> start!31872 d!53277))

(declare-fun d!53279 () Bool)

(assert (=> d!53279 (= (array_inv!3121 (buf!3832 thiss!1825)) (bvsge (size!3374 (buf!3832 thiss!1825)) #b00000000000000000000000000000000))))

(assert (=> b!158664 d!53279))

(check-sat (not d!53277))
(check-sat)
(get-model)

(declare-fun d!53281 () Bool)

(assert (=> d!53281 (= (invariant!0 (currentBit!7033 thiss!1825) (currentByte!7038 thiss!1825) (size!3374 (buf!3832 thiss!1825))) (and (bvsge (currentBit!7033 thiss!1825) #b00000000000000000000000000000000) (bvslt (currentBit!7033 thiss!1825) #b00000000000000000000000000001000) (bvsge (currentByte!7038 thiss!1825) #b00000000000000000000000000000000) (or (bvslt (currentByte!7038 thiss!1825) (size!3374 (buf!3832 thiss!1825))) (and (= (currentBit!7033 thiss!1825) #b00000000000000000000000000000000) (= (currentByte!7038 thiss!1825) (size!3374 (buf!3832 thiss!1825)))))))))

(assert (=> d!53277 d!53281))

(check-sat)
