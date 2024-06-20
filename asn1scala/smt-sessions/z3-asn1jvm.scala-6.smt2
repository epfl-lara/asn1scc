; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102 () Bool)

(assert start!102)

(declare-datatypes ((array!41 0))(
  ( (array!42 (arr!404 (Array (_ BitVec 32) (_ BitVec 8))) (size!17 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!18 0))(
  ( (BitStream!19 (buf!329 array!41) (currentByte!1218 (_ BitVec 32)) (currentBit!1213 (_ BitVec 32))) )
))
(declare-fun thiss!873 () BitStream!18)

(declare-fun inv!12 (BitStream!18) Bool)

(assert (=> start!102 (not (inv!12 (BitStream!19 (buf!329 thiss!873) #b00000000000000000000000000000000 #b00000000000000000000000000000000)))))

(declare-fun e!100 () Bool)

(assert (=> start!102 (and (inv!12 thiss!873) e!100)))

(declare-fun b!373 () Bool)

(declare-fun array_inv!14 (array!41) Bool)

(assert (=> b!373 (= e!100 (array_inv!14 (buf!329 thiss!873)))))

(assert (= start!102 b!373))

(declare-fun m!97 () Bool)

(assert (=> start!102 m!97))

(declare-fun m!99 () Bool)

(assert (=> start!102 m!99))

(declare-fun m!101 () Bool)

(assert (=> b!373 m!101))

(check-sat (not b!373) (not start!102))
(check-sat)
(get-model)

(declare-fun d!772 () Bool)

(assert (=> d!772 (= (array_inv!14 (buf!329 thiss!873)) (bvsge (size!17 (buf!329 thiss!873)) #b00000000000000000000000000000000))))

(assert (=> b!373 d!772))

(declare-fun d!777 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!777 (= (inv!12 (BitStream!19 (buf!329 thiss!873) #b00000000000000000000000000000000 #b00000000000000000000000000000000)) (invariant!0 (currentBit!1213 (BitStream!19 (buf!329 thiss!873) #b00000000000000000000000000000000 #b00000000000000000000000000000000)) (currentByte!1218 (BitStream!19 (buf!329 thiss!873) #b00000000000000000000000000000000 #b00000000000000000000000000000000)) (size!17 (buf!329 (BitStream!19 (buf!329 thiss!873) #b00000000000000000000000000000000 #b00000000000000000000000000000000)))))))

(declare-fun bs!356 () Bool)

(assert (= bs!356 d!777))

(declare-fun m!113 () Bool)

(assert (=> bs!356 m!113))

(assert (=> start!102 d!777))

(declare-fun d!784 () Bool)

(assert (=> d!784 (= (inv!12 thiss!873) (invariant!0 (currentBit!1213 thiss!873) (currentByte!1218 thiss!873) (size!17 (buf!329 thiss!873))))))

(declare-fun bs!358 () Bool)

(assert (= bs!358 d!784))

(declare-fun m!119 () Bool)

(assert (=> bs!358 m!119))

(assert (=> start!102 d!784))

(check-sat (not d!777) (not d!784))
(check-sat)
(get-model)

(declare-fun d!786 () Bool)

(assert (=> d!786 (= (invariant!0 (currentBit!1213 (BitStream!19 (buf!329 thiss!873) #b00000000000000000000000000000000 #b00000000000000000000000000000000)) (currentByte!1218 (BitStream!19 (buf!329 thiss!873) #b00000000000000000000000000000000 #b00000000000000000000000000000000)) (size!17 (buf!329 (BitStream!19 (buf!329 thiss!873) #b00000000000000000000000000000000 #b00000000000000000000000000000000)))) (and (bvsge (currentBit!1213 (BitStream!19 (buf!329 thiss!873) #b00000000000000000000000000000000 #b00000000000000000000000000000000)) #b00000000000000000000000000000000) (bvslt (currentBit!1213 (BitStream!19 (buf!329 thiss!873) #b00000000000000000000000000000000 #b00000000000000000000000000000000)) #b00000000000000000000000000001000) (bvsge (currentByte!1218 (BitStream!19 (buf!329 thiss!873) #b00000000000000000000000000000000 #b00000000000000000000000000000000)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1218 (BitStream!19 (buf!329 thiss!873) #b00000000000000000000000000000000 #b00000000000000000000000000000000)) (size!17 (buf!329 (BitStream!19 (buf!329 thiss!873) #b00000000000000000000000000000000 #b00000000000000000000000000000000)))) (and (= (currentBit!1213 (BitStream!19 (buf!329 thiss!873) #b00000000000000000000000000000000 #b00000000000000000000000000000000)) #b00000000000000000000000000000000) (= (currentByte!1218 (BitStream!19 (buf!329 thiss!873) #b00000000000000000000000000000000 #b00000000000000000000000000000000)) (size!17 (buf!329 (BitStream!19 (buf!329 thiss!873) #b00000000000000000000000000000000 #b00000000000000000000000000000000))))))))))

(assert (=> d!777 d!786))

(declare-fun d!788 () Bool)

(assert (=> d!788 (= (invariant!0 (currentBit!1213 thiss!873) (currentByte!1218 thiss!873) (size!17 (buf!329 thiss!873))) (and (bvsge (currentBit!1213 thiss!873) #b00000000000000000000000000000000) (bvslt (currentBit!1213 thiss!873) #b00000000000000000000000000001000) (bvsge (currentByte!1218 thiss!873) #b00000000000000000000000000000000) (or (bvslt (currentByte!1218 thiss!873) (size!17 (buf!329 thiss!873))) (and (= (currentBit!1213 thiss!873) #b00000000000000000000000000000000) (= (currentByte!1218 thiss!873) (size!17 (buf!329 thiss!873)))))))))

(assert (=> d!784 d!788))

(check-sat)
