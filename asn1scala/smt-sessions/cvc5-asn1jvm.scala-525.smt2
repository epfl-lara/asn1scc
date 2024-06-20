; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15248 () Bool)

(assert start!15248)

(declare-fun bitNr!1 () (_ BitVec 32))

(declare-datatypes ((array!3299 0))(
  ( (array!3300 (arr!2133 (Array (_ BitVec 32) (_ BitVec 8))) (size!1532 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2626 0))(
  ( (BitStream!2627 (buf!1922 array!3299) (currentByte!3739 (_ BitVec 32)) (currentBit!3734 (_ BitVec 32))) )
))
(declare-fun thiss!1107 () BitStream!2626)

(assert (=> start!15248 (and (bvsge bitNr!1 #b00000000000000000000000000000000) (bvslt bitNr!1 #b00000000000000000000000000001000) (bvsle ((_ sign_extend 32) (size!1532 (buf!1922 thiss!1107))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!3739 thiss!1107)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!3734 thiss!1107)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!1532 (buf!1922 thiss!1107))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!3739 thiss!1107)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!3734 thiss!1107)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!15248 true))

(declare-fun e!51083 () Bool)

(declare-fun inv!12 (BitStream!2626) Bool)

(assert (=> start!15248 (and (inv!12 thiss!1107) e!51083)))

(declare-fun b!77892 () Bool)

(declare-fun array_inv!1378 (array!3299) Bool)

(assert (=> b!77892 (= e!51083 (array_inv!1378 (buf!1922 thiss!1107)))))

(assert (= start!15248 b!77892))

(declare-fun m!123515 () Bool)

(assert (=> start!15248 m!123515))

(declare-fun m!123517 () Bool)

(assert (=> b!77892 m!123517))

(push 1)

(assert (not b!77892))

(assert (not start!15248))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!24552 () Bool)

(assert (=> d!24552 (= (array_inv!1378 (buf!1922 thiss!1107)) (bvsge (size!1532 (buf!1922 thiss!1107)) #b00000000000000000000000000000000))))

(assert (=> b!77892 d!24552))

(declare-fun d!24556 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!24556 (= (inv!12 thiss!1107) (invariant!0 (currentBit!3734 thiss!1107) (currentByte!3739 thiss!1107) (size!1532 (buf!1922 thiss!1107))))))

(declare-fun bs!5966 () Bool)

(assert (= bs!5966 d!24556))

(declare-fun m!123529 () Bool)

(assert (=> bs!5966 m!123529))

(assert (=> start!15248 d!24556))

(push 1)

