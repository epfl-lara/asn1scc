; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3308 () Bool)

(assert start!3308)

(declare-fun nBits!313 () (_ BitVec 64))

(declare-datatypes ((array!855 0))(
  ( (array!856 (arr!793 (Array (_ BitVec 32) (_ BitVec 8))) (size!364 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!688 0))(
  ( (BitStream!689 (buf!715 array!855) (currentByte!1861 (_ BitVec 32)) (currentBit!1856 (_ BitVec 32))) )
))
(declare-fun thiss!1073 () BitStream!688)

(assert (=> start!3308 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle ((_ sign_extend 32) (size!364 (buf!715 thiss!1073))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!1861 thiss!1073)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!1856 thiss!1073)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!364 (buf!715 thiss!1073))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!1861 thiss!1073)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!1856 thiss!1073)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!3308 true))

(declare-fun e!9158 () Bool)

(declare-fun inv!12 (BitStream!688) Bool)

(assert (=> start!3308 (and (inv!12 thiss!1073) e!9158)))

(declare-fun b!14654 () Bool)

(declare-fun array_inv!353 (array!855) Bool)

(assert (=> b!14654 (= e!9158 (array_inv!353 (buf!715 thiss!1073)))))

(assert (= start!3308 b!14654))

(declare-fun m!21089 () Bool)

(assert (=> start!3308 m!21089))

(declare-fun m!21091 () Bool)

(assert (=> b!14654 m!21091))

(push 1)

(assert (not start!3308))

(assert (not b!14654))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!4814 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!4814 (= (inv!12 thiss!1073) (invariant!0 (currentBit!1856 thiss!1073) (currentByte!1861 thiss!1073) (size!364 (buf!715 thiss!1073))))))

(declare-fun bs!1331 () Bool)

(assert (= bs!1331 d!4814))

(declare-fun m!21103 () Bool)

(assert (=> bs!1331 m!21103))

(assert (=> start!3308 d!4814))

(declare-fun d!4816 () Bool)

(assert (=> d!4816 (= (array_inv!353 (buf!715 thiss!1073)) (bvsge (size!364 (buf!715 thiss!1073)) #b00000000000000000000000000000000))))

(assert (=> b!14654 d!4816))

(push 1)

(assert (not d!4814))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

