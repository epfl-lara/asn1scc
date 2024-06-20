; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104 () Bool)

(assert start!104)

(declare-datatypes ((array!43 0))(
  ( (array!44 (arr!405 (Array (_ BitVec 32) (_ BitVec 8))) (size!18 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!20 0))(
  ( (BitStream!21 (buf!330 array!43) (currentByte!1219 (_ BitVec 32)) (currentBit!1214 (_ BitVec 32))) )
))
(declare-fun thiss!873 () BitStream!20)

(declare-fun inv!12 (BitStream!20) Bool)

(assert (=> start!104 (not (inv!12 (BitStream!21 (buf!330 thiss!873) #b00000000000000000000000000000000 #b00000000000000000000000000000000)))))

(declare-fun e!106 () Bool)

(assert (=> start!104 (and (inv!12 thiss!873) e!106)))

(declare-fun b!376 () Bool)

(declare-fun array_inv!15 (array!43) Bool)

(assert (=> b!376 (= e!106 (array_inv!15 (buf!330 thiss!873)))))

(assert (= start!104 b!376))

(declare-fun m!103 () Bool)

(assert (=> start!104 m!103))

(declare-fun m!105 () Bool)

(assert (=> start!104 m!105))

(declare-fun m!107 () Bool)

(assert (=> b!376 m!107))

(push 1)

(assert (not b!376))

(assert (not start!104))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!768 () Bool)

(assert (=> d!768 (= (array_inv!15 (buf!330 thiss!873)) (bvsge (size!18 (buf!330 thiss!873)) #b00000000000000000000000000000000))))

(assert (=> b!376 d!768))

(declare-fun d!778 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!778 (= (inv!12 (BitStream!21 (buf!330 thiss!873) #b00000000000000000000000000000000 #b00000000000000000000000000000000)) (invariant!0 (currentBit!1214 (BitStream!21 (buf!330 thiss!873) #b00000000000000000000000000000000 #b00000000000000000000000000000000)) (currentByte!1219 (BitStream!21 (buf!330 thiss!873) #b00000000000000000000000000000000 #b00000000000000000000000000000000)) (size!18 (buf!330 (BitStream!21 (buf!330 thiss!873) #b00000000000000000000000000000000 #b00000000000000000000000000000000)))))))

(declare-fun bs!355 () Bool)

(assert (= bs!355 d!778))

(declare-fun m!112 () Bool)

(assert (=> bs!355 m!112))

(assert (=> start!104 d!778))

(declare-fun d!782 () Bool)

(assert (=> d!782 (= (inv!12 thiss!873) (invariant!0 (currentBit!1214 thiss!873) (currentByte!1219 thiss!873) (size!18 (buf!330 thiss!873))))))

(declare-fun bs!359 () Bool)

(assert (= bs!359 d!782))

(declare-fun m!117 () Bool)

(assert (=> bs!359 m!117))

(assert (=> start!104 d!782))

(push 1)

(assert (not d!778))

(assert (not d!782))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!790 () Bool)

(assert (=> d!790 (= (invariant!0 (currentBit!1214 (BitStream!21 (buf!330 thiss!873) #b00000000000000000000000000000000 #b00000000000000000000000000000000)) (currentByte!1219 (BitStream!21 (buf!330 thiss!873) #b00000000000000000000000000000000 #b00000000000000000000000000000000)) (size!18 (buf!330 (BitStream!21 (buf!330 thiss!873) #b00000000000000000000000000000000 #b00000000000000000000000000000000)))) (and (bvsge (currentBit!1214 (BitStream!21 (buf!330 thiss!873) #b00000000000000000000000000000000 #b00000000000000000000000000000000)) #b00000000000000000000000000000000) (bvslt (currentBit!1214 (BitStream!21 (buf!330 thiss!873) #b00000000000000000000000000000000 #b00000000000000000000000000000000)) #b00000000000000000000000000001000) (bvsge (currentByte!1219 (BitStream!21 (buf!330 thiss!873) #b00000000000000000000000000000000 #b00000000000000000000000000000000)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1219 (BitStream!21 (buf!330 thiss!873) #b00000000000000000000000000000000 #b00000000000000000000000000000000)) (size!18 (buf!330 (BitStream!21 (buf!330 thiss!873) #b00000000000000000000000000000000 #b00000000000000000000000000000000)))) (and (= (currentBit!1214 (BitStream!21 (buf!330 thiss!873) #b00000000000000000000000000000000 #b00000000000000000000000000000000)) #b00000000000000000000000000000000) (= (currentByte!1219 (BitStream!21 (buf!330 thiss!873) #b00000000000000000000000000000000 #b00000000000000000000000000000000)) (size!18 (buf!330 (BitStream!21 (buf!330 thiss!873) #b00000000000000000000000000000000 #b00000000000000000000000000000000))))))))))

