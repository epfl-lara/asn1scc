; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41558 () Bool)

(assert start!41558)

(declare-fun res!163352 () Bool)

(declare-fun e!134270 () Bool)

(assert (=> start!41558 (=> (not res!163352) (not e!134270))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!41558 (= res!163352 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41558 e!134270))

(assert (=> start!41558 true))

(declare-datatypes ((array!10016 0))(
  ( (array!10017 (arr!5347 (Array (_ BitVec 32) (_ BitVec 8))) (size!4417 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7942 0))(
  ( (BitStream!7943 (buf!4903 array!10016) (currentByte!9199 (_ BitVec 32)) (currentBit!9194 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7942)

(declare-fun e!134268 () Bool)

(declare-fun inv!12 (BitStream!7942) Bool)

(assert (=> start!41558 (and (inv!12 thiss!1204) e!134268)))

(declare-fun b!195282 () Bool)

(declare-fun res!163353 () Bool)

(assert (=> b!195282 (=> (not res!163353) (not e!134270))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!195282 (= res!163353 (validate_offset_bits!1 ((_ sign_extend 32) (size!4417 (buf!4903 thiss!1204))) ((_ sign_extend 32) (currentByte!9199 thiss!1204)) ((_ sign_extend 32) (currentBit!9194 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!195283 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!195283 (= e!134270 (not (invariant!0 (currentBit!9194 thiss!1204) (currentByte!9199 thiss!1204) (size!4417 (buf!4903 thiss!1204)))))))

(declare-fun b!195284 () Bool)

(declare-fun array_inv!4158 (array!10016) Bool)

(assert (=> b!195284 (= e!134268 (array_inv!4158 (buf!4903 thiss!1204)))))

(assert (= (and start!41558 res!163352) b!195282))

(assert (= (and b!195282 res!163353) b!195283))

(assert (= start!41558 b!195284))

(declare-fun m!302525 () Bool)

(assert (=> start!41558 m!302525))

(declare-fun m!302527 () Bool)

(assert (=> b!195282 m!302527))

(declare-fun m!302529 () Bool)

(assert (=> b!195283 m!302529))

(declare-fun m!302531 () Bool)

(assert (=> b!195284 m!302531))

(push 1)

(assert (not b!195282))

(assert (not start!41558))

(assert (not b!195283))

(assert (not b!195284))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!66219 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!66219 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4417 (buf!4903 thiss!1204))) ((_ sign_extend 32) (currentByte!9199 thiss!1204)) ((_ sign_extend 32) (currentBit!9194 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4417 (buf!4903 thiss!1204))) ((_ sign_extend 32) (currentByte!9199 thiss!1204)) ((_ sign_extend 32) (currentBit!9194 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!16458 () Bool)

(assert (= bs!16458 d!66219))

(declare-fun m!302549 () Bool)

(assert (=> bs!16458 m!302549))

(assert (=> b!195282 d!66219))

(declare-fun d!66221 () Bool)

(assert (=> d!66221 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9194 thiss!1204) (currentByte!9199 thiss!1204) (size!4417 (buf!4903 thiss!1204))))))

(declare-fun bs!16459 () Bool)

(assert (= bs!16459 d!66221))

(assert (=> bs!16459 m!302529))

(assert (=> start!41558 d!66221))

(declare-fun d!66225 () Bool)

(assert (=> d!66225 (= (invariant!0 (currentBit!9194 thiss!1204) (currentByte!9199 thiss!1204) (size!4417 (buf!4903 thiss!1204))) (and (bvsge (currentBit!9194 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9194 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9199 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9199 thiss!1204) (size!4417 (buf!4903 thiss!1204))) (and (= (currentBit!9194 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9199 thiss!1204) (size!4417 (buf!4903 thiss!1204)))))))))

(assert (=> b!195283 d!66225))

(declare-fun d!66231 () Bool)

(assert (=> d!66231 (= (array_inv!4158 (buf!4903 thiss!1204)) (bvsge (size!4417 (buf!4903 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!195284 d!66231))

(push 1)

(assert (not d!66221))

(assert (not d!66219))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

