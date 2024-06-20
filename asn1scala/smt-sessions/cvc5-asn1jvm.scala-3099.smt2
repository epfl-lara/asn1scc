; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71362 () Bool)

(assert start!71362)

(declare-datatypes ((array!20379 0))(
  ( (array!20380 (arr!9967 (Array (_ BitVec 32) (_ BitVec 8))) (size!8875 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13912 0))(
  ( (BitStream!13913 (buf!8017 array!20379) (currentByte!14788 (_ BitVec 32)) (currentBit!14783 (_ BitVec 32))) )
))
(declare-fun thiss!1701 () BitStream!13912)

(assert (=> start!71362 (and (bvsle ((_ sign_extend 32) (size!8875 (buf!8017 thiss!1701))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14788 thiss!1701)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14783 thiss!1701)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!8875 (buf!8017 thiss!1701))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!14788 thiss!1701)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!14783 thiss!1701)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!231497 () Bool)

(declare-fun inv!12 (BitStream!13912) Bool)

(assert (=> start!71362 (and (inv!12 thiss!1701) e!231497)))

(declare-fun b!321445 () Bool)

(declare-fun array_inv!8427 (array!20379) Bool)

(assert (=> b!321445 (= e!231497 (array_inv!8427 (buf!8017 thiss!1701)))))

(assert (= start!71362 b!321445))

(declare-fun m!459771 () Bool)

(assert (=> start!71362 m!459771))

(declare-fun m!459773 () Bool)

(assert (=> b!321445 m!459773))

(push 1)

(assert (not b!321445))

(assert (not start!71362))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!105374 () Bool)

(assert (=> d!105374 (= (array_inv!8427 (buf!8017 thiss!1701)) (bvsge (size!8875 (buf!8017 thiss!1701)) #b00000000000000000000000000000000))))

(assert (=> b!321445 d!105374))

(declare-fun d!105376 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!105376 (= (inv!12 thiss!1701) (invariant!0 (currentBit!14783 thiss!1701) (currentByte!14788 thiss!1701) (size!8875 (buf!8017 thiss!1701))))))

(declare-fun bs!27718 () Bool)

(assert (= bs!27718 d!105376))

(declare-fun m!459785 () Bool)

(assert (=> bs!27718 m!459785))

(assert (=> start!71362 d!105376))

(push 1)

(assert (not d!105376))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

