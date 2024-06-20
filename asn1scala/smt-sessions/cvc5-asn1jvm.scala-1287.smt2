; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36634 () Bool)

(assert start!36634)

(declare-fun nBits!600 () (_ BitVec 32))

(declare-datatypes ((array!8726 0))(
  ( (array!8727 (arr!4795 (Array (_ BitVec 32) (_ BitVec 8))) (size!3874 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6904 0))(
  ( (BitStream!6905 (buf!4326 array!8726) (currentByte!8186 (_ BitVec 32)) (currentBit!8181 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!6904)

(assert (=> start!36634 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000) (bvsle ((_ sign_extend 32) (size!3874 (buf!4326 thiss!1894))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!8186 thiss!1894)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!8181 thiss!1894)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!3874 (buf!4326 thiss!1894))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!8186 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!8181 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!36634 true))

(declare-fun e!116855 () Bool)

(declare-fun inv!12 (BitStream!6904) Bool)

(assert (=> start!36634 (and (inv!12 thiss!1894) e!116855)))

(declare-fun b!168249 () Bool)

(declare-fun array_inv!3615 (array!8726) Bool)

(assert (=> b!168249 (= e!116855 (array_inv!3615 (buf!4326 thiss!1894)))))

(assert (= start!36634 b!168249))

(declare-fun m!267885 () Bool)

(assert (=> start!36634 m!267885))

(declare-fun m!267887 () Bool)

(assert (=> b!168249 m!267887))

(push 1)

(assert (not b!168249))

(assert (not start!36634))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!59227 () Bool)

(assert (=> d!59227 (= (array_inv!3615 (buf!4326 thiss!1894)) (bvsge (size!3874 (buf!4326 thiss!1894)) #b00000000000000000000000000000000))))

(assert (=> b!168249 d!59227))

(declare-fun d!59229 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!59229 (= (inv!12 thiss!1894) (invariant!0 (currentBit!8181 thiss!1894) (currentByte!8186 thiss!1894) (size!3874 (buf!4326 thiss!1894))))))

(declare-fun bs!14674 () Bool)

(assert (= bs!14674 d!59229))

(declare-fun m!267899 () Bool)

(assert (=> bs!14674 m!267899))

(assert (=> start!36634 d!59229))

(push 1)

(assert (not d!59229))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!59233 () Bool)

(assert (=> d!59233 (= (invariant!0 (currentBit!8181 thiss!1894) (currentByte!8186 thiss!1894) (size!3874 (buf!4326 thiss!1894))) (and (bvsge (currentBit!8181 thiss!1894) #b00000000000000000000000000000000) (bvslt (currentBit!8181 thiss!1894) #b00000000000000000000000000001000) (bvsge (currentByte!8186 thiss!1894) #b00000000000000000000000000000000) (or (bvslt (currentByte!8186 thiss!1894) (size!3874 (buf!4326 thiss!1894))) (and (= (currentBit!8181 thiss!1894) #b00000000000000000000000000000000) (= (currentByte!8186 thiss!1894) (size!3874 (buf!4326 thiss!1894)))))))))

(assert (=> d!59229 d!59233))

(push 1)

(check-sat)

