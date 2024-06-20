; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3252 () Bool)

(assert start!3252)

(declare-fun nBytes!1 () (_ BitVec 32))

(declare-datatypes ((array!825 0))(
  ( (array!826 (arr!781 (Array (_ BitVec 32) (_ BitVec 8))) (size!352 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!664 0))(
  ( (BitStream!665 (buf!703 array!825) (currentByte!1844 (_ BitVec 32)) (currentBit!1839 (_ BitVec 32))) )
))
(declare-fun thiss!1862 () BitStream!664)

(assert (=> start!3252 (and (bvsge nBytes!1 #b00000000000000000000000000000000) (bvsle ((_ sign_extend 32) (size!352 (buf!703 thiss!1862))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!1844 thiss!1862)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!1839 thiss!1862)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!352 (buf!703 thiss!1862))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!1844 thiss!1862)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!1839 thiss!1862)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!3252 true))

(declare-fun e!9068 () Bool)

(declare-fun inv!12 (BitStream!664) Bool)

(assert (=> start!3252 (and (inv!12 thiss!1862) e!9068)))

(declare-fun b!14591 () Bool)

(declare-fun array_inv!341 (array!825) Bool)

(assert (=> b!14591 (= e!9068 (array_inv!341 (buf!703 thiss!1862)))))

(assert (= start!3252 b!14591))

(declare-fun m!21019 () Bool)

(assert (=> start!3252 m!21019))

(declare-fun m!21021 () Bool)

(assert (=> b!14591 m!21021))

(push 1)

(assert (not b!14591))

(assert (not start!3252))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!4774 () Bool)

(assert (=> d!4774 (= (array_inv!341 (buf!703 thiss!1862)) (bvsge (size!352 (buf!703 thiss!1862)) #b00000000000000000000000000000000))))

(assert (=> b!14591 d!4774))

(declare-fun d!4776 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!4776 (= (inv!12 thiss!1862) (invariant!0 (currentBit!1839 thiss!1862) (currentByte!1844 thiss!1862) (size!352 (buf!703 thiss!1862))))))

(declare-fun bs!1314 () Bool)

(assert (= bs!1314 d!4776))

(declare-fun m!21033 () Bool)

(assert (=> bs!1314 m!21033))

(assert (=> start!3252 d!4776))

(push 1)

(assert (not d!4776))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!4784 () Bool)

(assert (=> d!4784 (= (invariant!0 (currentBit!1839 thiss!1862) (currentByte!1844 thiss!1862) (size!352 (buf!703 thiss!1862))) (and (bvsge (currentBit!1839 thiss!1862) #b00000000000000000000000000000000) (bvslt (currentBit!1839 thiss!1862) #b00000000000000000000000000001000) (bvsge (currentByte!1844 thiss!1862) #b00000000000000000000000000000000) (or (bvslt (currentByte!1844 thiss!1862) (size!352 (buf!703 thiss!1862))) (and (= (currentBit!1839 thiss!1862) #b00000000000000000000000000000000) (= (currentByte!1844 thiss!1862) (size!352 (buf!703 thiss!1862)))))))))

(assert (=> d!4776 d!4784))

