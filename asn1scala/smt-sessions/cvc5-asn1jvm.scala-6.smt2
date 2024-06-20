; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100 () Bool)

(assert start!100)

(declare-datatypes ((array!39 0))(
  ( (array!40 (arr!403 (Array (_ BitVec 32) (_ BitVec 8))) (size!16 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!16 0))(
  ( (BitStream!17 (buf!328 array!39) (currentByte!1217 (_ BitVec 32)) (currentBit!1212 (_ BitVec 32))) )
))
(declare-fun thiss!873 () BitStream!16)

(declare-fun inv!12 (BitStream!16) Bool)

(assert (=> start!100 (not (inv!12 (BitStream!17 (buf!328 thiss!873) #b00000000000000000000000000000000 #b00000000000000000000000000000000)))))

(declare-fun e!94 () Bool)

(assert (=> start!100 (and (inv!12 thiss!873) e!94)))

(declare-fun b!370 () Bool)

(declare-fun array_inv!13 (array!39) Bool)

(assert (=> b!370 (= e!94 (array_inv!13 (buf!328 thiss!873)))))

(assert (= start!100 b!370))

(declare-fun m!91 () Bool)

(assert (=> start!100 m!91))

(declare-fun m!93 () Bool)

(assert (=> start!100 m!93))

(declare-fun m!95 () Bool)

(assert (=> b!370 m!95))

(push 1)

(assert (not b!370))

(assert (not start!100))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!770 () Bool)

(assert (=> d!770 (= (array_inv!13 (buf!328 thiss!873)) (bvsge (size!16 (buf!328 thiss!873)) #b00000000000000000000000000000000))))

(assert (=> b!370 d!770))

(declare-fun d!776 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!776 (= (inv!12 (BitStream!17 (buf!328 thiss!873) #b00000000000000000000000000000000 #b00000000000000000000000000000000)) (invariant!0 (currentBit!1212 (BitStream!17 (buf!328 thiss!873) #b00000000000000000000000000000000 #b00000000000000000000000000000000)) (currentByte!1217 (BitStream!17 (buf!328 thiss!873) #b00000000000000000000000000000000 #b00000000000000000000000000000000)) (size!16 (buf!328 (BitStream!17 (buf!328 thiss!873) #b00000000000000000000000000000000 #b00000000000000000000000000000000)))))))

(declare-fun bs!354 () Bool)

(assert (= bs!354 d!776))

(declare-fun m!109 () Bool)

(assert (=> bs!354 m!109))

(assert (=> start!100 d!776))

(declare-fun d!780 () Bool)

(assert (=> d!780 (= (inv!12 thiss!873) (invariant!0 (currentBit!1212 thiss!873) (currentByte!1217 thiss!873) (size!16 (buf!328 thiss!873))))))

(declare-fun bs!357 () Bool)

(assert (= bs!357 d!780))

(declare-fun m!115 () Bool)

(assert (=> bs!357 m!115))

(assert (=> start!100 d!780))

(push 1)

(assert (not d!776))

(assert (not d!780))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!792 () Bool)

(assert (=> d!792 (= (invariant!0 (currentBit!1212 (BitStream!17 (buf!328 thiss!873) #b00000000000000000000000000000000 #b00000000000000000000000000000000)) (currentByte!1217 (BitStream!17 (buf!328 thiss!873) #b00000000000000000000000000000000 #b00000000000000000000000000000000)) (size!16 (buf!328 (BitStream!17 (buf!328 thiss!873) #b00000000000000000000000000000000 #b00000000000000000000000000000000)))) (and (bvsge (currentBit!1212 (BitStream!17 (buf!328 thiss!873) #b00000000000000000000000000000000 #b00000000000000000000000000000000)) #b00000000000000000000000000000000) (bvslt (currentBit!1212 (BitStream!17 (buf!328 thiss!873) #b00000000000000000000000000000000 #b00000000000000000000000000000000)) #b00000000000000000000000000001000) (bvsge (currentByte!1217 (BitStream!17 (buf!328 thiss!873) #b00000000000000000000000000000000 #b00000000000000000000000000000000)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1217 (BitStream!17 (buf!328 thiss!873) #b00000000000000000000000000000000 #b00000000000000000000000000000000)) (size!16 (buf!328 (BitStream!17 (buf!328 thiss!873) #b00000000000000000000000000000000 #b00000000000000000000000000000000)))) (and (= (currentBit!1212 (BitStream!17 (buf!328 thiss!873) #b00000000000000000000000000000000 #b00000000000000000000000000000000)) #b00000000000000000000000000000000) (= (currentByte!1217 (BitStream!17 (buf!328 thiss!873) #b00000000000000000000000000000000 #b00000000000000000000000000000000)) (size!16 (buf!328 (BitStream!17 (buf!328 thiss!873) #b00000000000000000000000000000000 #b00000000000000000000000000000000))))))))))

(assert (=> d!776 d!792))

