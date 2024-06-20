; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76 () Bool)

(assert start!76)

(declare-datatypes ((array!30 0))(
  ( (array!31 (arr!400 (Array (_ BitVec 32) (_ BitVec 8))) (size!13 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10 0))(
  ( (BitStream!11 (buf!325 array!30) (currentByte!1211 (_ BitVec 32)) (currentBit!1206 (_ BitVec 32))) )
))
(declare-fun thiss!873 () BitStream!10)

(declare-fun inv!12 (BitStream!10) Bool)

(assert (=> start!76 (not (inv!12 (BitStream!11 (buf!325 thiss!873) (currentByte!1211 thiss!873) #b00000000000000000000000000000000)))))

(declare-fun e!76 () Bool)

(assert (=> start!76 (and (inv!12 thiss!873) e!76)))

(declare-fun b!361 () Bool)

(declare-fun array_inv!10 (array!30) Bool)

(assert (=> b!361 (= e!76 (array_inv!10 (buf!325 thiss!873)))))

(assert (= start!76 b!361))

(declare-fun m!61 () Bool)

(assert (=> start!76 m!61))

(declare-fun m!63 () Bool)

(assert (=> start!76 m!63))

(declare-fun m!65 () Bool)

(assert (=> b!361 m!65))

(push 1)

(assert (not start!76))

(assert (not b!361))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!736 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!736 (= (inv!12 (BitStream!11 (buf!325 thiss!873) (currentByte!1211 thiss!873) #b00000000000000000000000000000000)) (invariant!0 (currentBit!1206 (BitStream!11 (buf!325 thiss!873) (currentByte!1211 thiss!873) #b00000000000000000000000000000000)) (currentByte!1211 (BitStream!11 (buf!325 thiss!873) (currentByte!1211 thiss!873) #b00000000000000000000000000000000)) (size!13 (buf!325 (BitStream!11 (buf!325 thiss!873) (currentByte!1211 thiss!873) #b00000000000000000000000000000000)))))))

(declare-fun bs!346 () Bool)

(assert (= bs!346 d!736))

(declare-fun m!81 () Bool)

(assert (=> bs!346 m!81))

(assert (=> start!76 d!736))

(declare-fun d!746 () Bool)

(assert (=> d!746 (= (inv!12 thiss!873) (invariant!0 (currentBit!1206 thiss!873) (currentByte!1211 thiss!873) (size!13 (buf!325 thiss!873))))))

(declare-fun bs!348 () Bool)

(assert (= bs!348 d!746))

(declare-fun m!83 () Bool)

(assert (=> bs!348 m!83))

(assert (=> start!76 d!746))

(declare-fun d!750 () Bool)

(assert (=> d!750 (= (array_inv!10 (buf!325 thiss!873)) (bvsge (size!13 (buf!325 thiss!873)) #b00000000000000000000000000000000))))

(assert (=> b!361 d!750))

(push 1)

(assert (not d!746))

(assert (not d!736))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!756 () Bool)

(assert (=> d!756 (= (invariant!0 (currentBit!1206 thiss!873) (currentByte!1211 thiss!873) (size!13 (buf!325 thiss!873))) (and (bvsge (currentBit!1206 thiss!873) #b00000000000000000000000000000000) (bvslt (currentBit!1206 thiss!873) #b00000000000000000000000000001000) (bvsge (currentByte!1211 thiss!873) #b00000000000000000000000000000000) (or (bvslt (currentByte!1211 thiss!873) (size!13 (buf!325 thiss!873))) (and (= (currentBit!1206 thiss!873) #b00000000000000000000000000000000) (= (currentByte!1211 thiss!873) (size!13 (buf!325 thiss!873)))))))))

(assert (=> d!746 d!756))

(declare-fun d!760 () Bool)

(assert (=> d!760 (= (invariant!0 (currentBit!1206 (BitStream!11 (buf!325 thiss!873) (currentByte!1211 thiss!873) #b00000000000000000000000000000000)) (currentByte!1211 (BitStream!11 (buf!325 thiss!873) (currentByte!1211 thiss!873) #b00000000000000000000000000000000)) (size!13 (buf!325 (BitStream!11 (buf!325 thiss!873) (currentByte!1211 thiss!873) #b00000000000000000000000000000000)))) (and (bvsge (currentBit!1206 (BitStream!11 (buf!325 thiss!873) (currentByte!1211 thiss!873) #b00000000000000000000000000000000)) #b00000000000000000000000000000000) (bvslt (currentBit!1206 (BitStream!11 (buf!325 thiss!873) (currentByte!1211 thiss!873) #b00000000000000000000000000000000)) #b00000000000000000000000000001000) (bvsge (currentByte!1211 (BitStream!11 (buf!325 thiss!873) (currentByte!1211 thiss!873) #b00000000000000000000000000000000)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1211 (BitStream!11 (buf!325 thiss!873) (currentByte!1211 thiss!873) #b00000000000000000000000000000000)) (size!13 (buf!325 (BitStream!11 (buf!325 thiss!873) (currentByte!1211 thiss!873) #b00000000000000000000000000000000)))) (and (= (currentBit!1206 (BitStream!11 (buf!325 thiss!873) (currentByte!1211 thiss!873) #b00000000000000000000000000000000)) #b00000000000000000000000000000000) (= (currentByte!1211 (BitStream!11 (buf!325 thiss!873) (currentByte!1211 thiss!873) #b00000000000000000000000000000000)) (size!13 (buf!325 (BitStream!11 (buf!325 thiss!873) (currentByte!1211 thiss!873) #b00000000000000000000000000000000))))))))))

(assert (=> d!736 d!760))

(push 1)

(check-sat)

(pop 1)

