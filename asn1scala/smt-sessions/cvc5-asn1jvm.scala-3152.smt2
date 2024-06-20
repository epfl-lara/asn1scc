; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72350 () Bool)

(assert start!72350)

(declare-datatypes ((array!20731 0))(
  ( (array!20732 (arr!10114 (Array (_ BitVec 32) (_ BitVec 8))) (size!9022 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14206 0))(
  ( (BitStream!14207 (buf!8164 array!20731) (currentByte!15059 (_ BitVec 32)) (currentBit!15054 (_ BitVec 32))) )
))
(declare-fun thiss!1702 () BitStream!14206)

(assert (=> start!72350 (and (bvsle ((_ sign_extend 32) (size!9022 (buf!8164 thiss!1702))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!15059 thiss!1702)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!15054 thiss!1702)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!9022 (buf!8164 thiss!1702))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!15059 thiss!1702)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!15054 thiss!1702)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!233441 () Bool)

(declare-fun inv!12 (BitStream!14206) Bool)

(assert (=> start!72350 (and (inv!12 thiss!1702) e!233441)))

(declare-fun b!324013 () Bool)

(declare-fun array_inv!8574 (array!20731) Bool)

(assert (=> b!324013 (= e!233441 (array_inv!8574 (buf!8164 thiss!1702)))))

(assert (= start!72350 b!324013))

(declare-fun m!462079 () Bool)

(assert (=> start!72350 m!462079))

(declare-fun m!462081 () Bool)

(assert (=> b!324013 m!462081))

(push 1)

(assert (not start!72350))

(assert (not b!324013))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106300 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!106300 (= (inv!12 thiss!1702) (invariant!0 (currentBit!15054 thiss!1702) (currentByte!15059 thiss!1702) (size!9022 (buf!8164 thiss!1702))))))

(declare-fun bs!28002 () Bool)

(assert (= bs!28002 d!106300))

(declare-fun m!462093 () Bool)

(assert (=> bs!28002 m!462093))

(assert (=> start!72350 d!106300))

(declare-fun d!106304 () Bool)

(assert (=> d!106304 (= (array_inv!8574 (buf!8164 thiss!1702)) (bvsge (size!9022 (buf!8164 thiss!1702)) #b00000000000000000000000000000000))))

(assert (=> b!324013 d!106304))

(push 1)

(assert (not d!106300))

(check-sat)

