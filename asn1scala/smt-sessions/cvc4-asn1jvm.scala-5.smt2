; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80 () Bool)

(assert start!80)

(declare-datatypes ((array!34 0))(
  ( (array!35 (arr!402 (Array (_ BitVec 32) (_ BitVec 8))) (size!15 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14 0))(
  ( (BitStream!15 (buf!327 array!34) (currentByte!1213 (_ BitVec 32)) (currentBit!1208 (_ BitVec 32))) )
))
(declare-fun thiss!873 () BitStream!14)

(declare-fun inv!12 (BitStream!14) Bool)

(assert (=> start!80 (not (inv!12 (BitStream!15 (buf!327 thiss!873) (currentByte!1213 thiss!873) #b00000000000000000000000000000000)))))

(declare-fun e!88 () Bool)

(assert (=> start!80 (and (inv!12 thiss!873) e!88)))

(declare-fun b!367 () Bool)

(declare-fun array_inv!12 (array!34) Bool)

(assert (=> b!367 (= e!88 (array_inv!12 (buf!327 thiss!873)))))

(assert (= start!80 b!367))

(declare-fun m!73 () Bool)

(assert (=> start!80 m!73))

(declare-fun m!75 () Bool)

(assert (=> start!80 m!75))

(declare-fun m!77 () Bool)

(assert (=> b!367 m!77))

(push 1)

(assert (not b!367))

(assert (not start!80))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!740 () Bool)

(assert (=> d!740 (= (array_inv!12 (buf!327 thiss!873)) (bvsge (size!15 (buf!327 thiss!873)) #b00000000000000000000000000000000))))

(assert (=> b!367 d!740))

(declare-fun d!742 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!742 (= (inv!12 (BitStream!15 (buf!327 thiss!873) (currentByte!1213 thiss!873) #b00000000000000000000000000000000)) (invariant!0 (currentBit!1208 (BitStream!15 (buf!327 thiss!873) (currentByte!1213 thiss!873) #b00000000000000000000000000000000)) (currentByte!1213 (BitStream!15 (buf!327 thiss!873) (currentByte!1213 thiss!873) #b00000000000000000000000000000000)) (size!15 (buf!327 (BitStream!15 (buf!327 thiss!873) (currentByte!1213 thiss!873) #b00000000000000000000000000000000)))))))

(declare-fun bs!349 () Bool)

(assert (= bs!349 d!742))

(declare-fun m!87 () Bool)

(assert (=> bs!349 m!87))

(assert (=> start!80 d!742))

(declare-fun d!752 () Bool)

(assert (=> d!752 (= (inv!12 thiss!873) (invariant!0 (currentBit!1208 thiss!873) (currentByte!1213 thiss!873) (size!15 (buf!327 thiss!873))))))

(declare-fun bs!350 () Bool)

(assert (= bs!350 d!752))

(declare-fun m!89 () Bool)

(assert (=> bs!350 m!89))

(assert (=> start!80 d!752))

(push 1)

(assert (not d!742))

(assert (not d!752))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!762 () Bool)

(assert (=> d!762 (= (invariant!0 (currentBit!1208 (BitStream!15 (buf!327 thiss!873) (currentByte!1213 thiss!873) #b00000000000000000000000000000000)) (currentByte!1213 (BitStream!15 (buf!327 thiss!873) (currentByte!1213 thiss!873) #b00000000000000000000000000000000)) (size!15 (buf!327 (BitStream!15 (buf!327 thiss!873) (currentByte!1213 thiss!873) #b00000000000000000000000000000000)))) (and (bvsge (currentBit!1208 (BitStream!15 (buf!327 thiss!873) (currentByte!1213 thiss!873) #b00000000000000000000000000000000)) #b00000000000000000000000000000000) (bvslt (currentBit!1208 (BitStream!15 (buf!327 thiss!873) (currentByte!1213 thiss!873) #b00000000000000000000000000000000)) #b00000000000000000000000000001000) (bvsge (currentByte!1213 (BitStream!15 (buf!327 thiss!873) (currentByte!1213 thiss!873) #b00000000000000000000000000000000)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1213 (BitStream!15 (buf!327 thiss!873) (currentByte!1213 thiss!873) #b00000000000000000000000000000000)) (size!15 (buf!327 (BitStream!15 (buf!327 thiss!873) (currentByte!1213 thiss!873) #b00000000000000000000000000000000)))) (and (= (currentBit!1208 (BitStream!15 (buf!327 thiss!873) (currentByte!1213 thiss!873) #b00000000000000000000000000000000)