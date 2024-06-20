; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72352 () Bool)

(assert start!72352)

(declare-datatypes ((array!20733 0))(
  ( (array!20734 (arr!10115 (Array (_ BitVec 32) (_ BitVec 8))) (size!9023 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14208 0))(
  ( (BitStream!14209 (buf!8165 array!20733) (currentByte!15060 (_ BitVec 32)) (currentBit!15055 (_ BitVec 32))) )
))
(declare-fun thiss!1702 () BitStream!14208)

(assert (=> start!72352 (and (bvsle ((_ sign_extend 32) (size!9023 (buf!8165 thiss!1702))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!15060 thiss!1702)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!15055 thiss!1702)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!9023 (buf!8165 thiss!1702))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!15060 thiss!1702)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!15055 thiss!1702)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!233447 () Bool)

(declare-fun inv!12 (BitStream!14208) Bool)

(assert (=> start!72352 (and (inv!12 thiss!1702) e!233447)))

(declare-fun b!324016 () Bool)

(declare-fun array_inv!8575 (array!20733) Bool)

(assert (=> b!324016 (= e!233447 (array_inv!8575 (buf!8165 thiss!1702)))))

(assert (= start!72352 b!324016))

(declare-fun m!462083 () Bool)

(assert (=> start!72352 m!462083))

(declare-fun m!462085 () Bool)

(assert (=> b!324016 m!462085))

(check-sat (not start!72352) (not b!324016))
(check-sat)
(get-model)

(declare-fun d!106296 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!106296 (= (inv!12 thiss!1702) (invariant!0 (currentBit!15055 thiss!1702) (currentByte!15060 thiss!1702) (size!9023 (buf!8165 thiss!1702))))))

(declare-fun bs!28001 () Bool)

(assert (= bs!28001 d!106296))

(declare-fun m!462091 () Bool)

(assert (=> bs!28001 m!462091))

(assert (=> start!72352 d!106296))

(declare-fun d!106298 () Bool)

(assert (=> d!106298 (= (array_inv!8575 (buf!8165 thiss!1702)) (bvsge (size!9023 (buf!8165 thiss!1702)) #b00000000000000000000000000000000))))

(assert (=> b!324016 d!106298))

(check-sat (not d!106296))
(check-sat)
(get-model)

(declare-fun d!106302 () Bool)

(assert (=> d!106302 (= (invariant!0 (currentBit!15055 thiss!1702) (currentByte!15060 thiss!1702) (size!9023 (buf!8165 thiss!1702))) (and (bvsge (currentBit!15055 thiss!1702) #b00000000000000000000000000000000) (bvslt (currentBit!15055 thiss!1702) #b00000000000000000000000000001000) (bvsge (currentByte!15060 thiss!1702) #b00000000000000000000000000000000) (or (bvslt (currentByte!15060 thiss!1702) (size!9023 (buf!8165 thiss!1702))) (and (= (currentBit!15055 thiss!1702) #b00000000000000000000000000000000) (= (currentByte!15060 thiss!1702) (size!9023 (buf!8165 thiss!1702)))))))))

(assert (=> d!106296 d!106302))

(check-sat)
