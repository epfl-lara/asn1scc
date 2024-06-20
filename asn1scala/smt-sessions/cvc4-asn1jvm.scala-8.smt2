; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134 () Bool)

(assert start!134)

(declare-datatypes ((array!58 0))(
  ( (array!59 (arr!411 (Array (_ BitVec 32) (_ BitVec 8))) (size!24 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!32 0))(
  ( (BitStream!33 (buf!336 array!58) (currentByte!1228 (_ BitVec 32)) (currentBit!1223 (_ BitVec 32))) )
))
(declare-fun thiss!932 () BitStream!32)

(assert (=> start!134 (and (bvsle ((_ sign_extend 32) (size!24 (buf!336 thiss!932))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!1228 thiss!932)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!1223 thiss!932)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!24 (buf!336 thiss!932))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!1228 thiss!932)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!1223 thiss!932)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!142 () Bool)

(declare-fun inv!12 (BitStream!32) Bool)

(assert (=> start!134 (and (inv!12 thiss!932) e!142)))

(declare-fun b!394 () Bool)

(declare-fun array_inv!21 (array!58) Bool)

(assert (=> b!394 (= e!142 (array_inv!21 (buf!336 thiss!932)))))

(assert (= start!134 b!394))

(declare-fun m!141 () Bool)

(assert (=> start!134 m!141))

(declare-fun m!143 () Bool)

(assert (=> b!394 m!143))

(push 1)

(assert (not start!134))

(assert (not b!394))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!808 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!808 (= (inv!12 thiss!932) (invariant!0 (currentBit!1223 thiss!932) (currentByte!1228 thiss!932) (size!24 (buf!336 thiss!932))))))

(declare-fun bs!368 () Bool)

(assert (= bs!368 d!808))

(declare-fun m!149 () Bool)

(assert (=> bs!368 m!149))

(assert (=> start!134 d!808))

(declare-fun d!812 () Bool)

(assert (=> d!812 (= (array_inv!21 (buf!336 thiss!932)) (bvsge (size!24 (buf!336 thiss!932)) #b00000000000000000000000000000000))))

(assert (=> b!394 d!812))

(push 1)

(assert (not d!808))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

