; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15250 () Bool)

(assert start!15250)

(declare-fun bitNr!1 () (_ BitVec 32))

(declare-datatypes ((array!3301 0))(
  ( (array!3302 (arr!2134 (Array (_ BitVec 32) (_ BitVec 8))) (size!1533 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2628 0))(
  ( (BitStream!2629 (buf!1923 array!3301) (currentByte!3740 (_ BitVec 32)) (currentBit!3735 (_ BitVec 32))) )
))
(declare-fun thiss!1107 () BitStream!2628)

(assert (=> start!15250 (and (bvsge bitNr!1 #b00000000000000000000000000000000) (bvslt bitNr!1 #b00000000000000000000000000001000) (bvsle ((_ sign_extend 32) (size!1533 (buf!1923 thiss!1107))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!3740 thiss!1107)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!3735 thiss!1107)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!1533 (buf!1923 thiss!1107))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!3740 thiss!1107)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!3735 thiss!1107)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!15250 true))

(declare-fun e!51089 () Bool)

(declare-fun inv!12 (BitStream!2628) Bool)

(assert (=> start!15250 (and (inv!12 thiss!1107) e!51089)))

(declare-fun b!77895 () Bool)

(declare-fun array_inv!1379 (array!3301) Bool)

(assert (=> b!77895 (= e!51089 (array_inv!1379 (buf!1923 thiss!1107)))))

(assert (= start!15250 b!77895))

(declare-fun m!123519 () Bool)

(assert (=> start!15250 m!123519))

(declare-fun m!123521 () Bool)

(assert (=> b!77895 m!123521))

(check-sat (not b!77895) (not start!15250))
(check-sat)
(get-model)

(declare-fun d!24548 () Bool)

(assert (=> d!24548 (= (array_inv!1379 (buf!1923 thiss!1107)) (bvsge (size!1533 (buf!1923 thiss!1107)) #b00000000000000000000000000000000))))

(assert (=> b!77895 d!24548))

(declare-fun d!24550 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!24550 (= (inv!12 thiss!1107) (invariant!0 (currentBit!3735 thiss!1107) (currentByte!3740 thiss!1107) (size!1533 (buf!1923 thiss!1107))))))

(declare-fun bs!5965 () Bool)

(assert (= bs!5965 d!24550))

(declare-fun m!123527 () Bool)

(assert (=> bs!5965 m!123527))

(assert (=> start!15250 d!24550))

(check-sat (not d!24550))
(check-sat)
(get-model)

(declare-fun d!24554 () Bool)

(assert (=> d!24554 (= (invariant!0 (currentBit!3735 thiss!1107) (currentByte!3740 thiss!1107) (size!1533 (buf!1923 thiss!1107))) (and (bvsge (currentBit!3735 thiss!1107) #b00000000000000000000000000000000) (bvslt (currentBit!3735 thiss!1107) #b00000000000000000000000000001000) (bvsge (currentByte!3740 thiss!1107) #b00000000000000000000000000000000) (or (bvslt (currentByte!3740 thiss!1107) (size!1533 (buf!1923 thiss!1107))) (and (= (currentBit!3735 thiss!1107) #b00000000000000000000000000000000) (= (currentByte!3740 thiss!1107) (size!1533 (buf!1923 thiss!1107)))))))))

(assert (=> d!24550 d!24554))

(check-sat)
