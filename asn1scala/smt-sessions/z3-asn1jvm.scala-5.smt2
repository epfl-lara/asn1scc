; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78 () Bool)

(assert start!78)

(declare-datatypes ((array!32 0))(
  ( (array!33 (arr!401 (Array (_ BitVec 32) (_ BitVec 8))) (size!14 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12 0))(
  ( (BitStream!13 (buf!326 array!32) (currentByte!1212 (_ BitVec 32)) (currentBit!1207 (_ BitVec 32))) )
))
(declare-fun thiss!873 () BitStream!12)

(declare-fun inv!12 (BitStream!12) Bool)

(assert (=> start!78 (not (inv!12 (BitStream!13 (buf!326 thiss!873) (currentByte!1212 thiss!873) #b00000000000000000000000000000000)))))

(declare-fun e!82 () Bool)

(assert (=> start!78 (and (inv!12 thiss!873) e!82)))

(declare-fun b!364 () Bool)

(declare-fun array_inv!11 (array!32) Bool)

(assert (=> b!364 (= e!82 (array_inv!11 (buf!326 thiss!873)))))

(assert (= start!78 b!364))

(declare-fun m!67 () Bool)

(assert (=> start!78 m!67))

(declare-fun m!69 () Bool)

(assert (=> start!78 m!69))

(declare-fun m!71 () Bool)

(assert (=> b!364 m!71))

(check-sat (not start!78) (not b!364))
(check-sat)
(get-model)

(declare-fun d!738 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!738 (= (inv!12 (BitStream!13 (buf!326 thiss!873) (currentByte!1212 thiss!873) #b00000000000000000000000000000000)) (invariant!0 (currentBit!1207 (BitStream!13 (buf!326 thiss!873) (currentByte!1212 thiss!873) #b00000000000000000000000000000000)) (currentByte!1212 (BitStream!13 (buf!326 thiss!873) (currentByte!1212 thiss!873) #b00000000000000000000000000000000)) (size!14 (buf!326 (BitStream!13 (buf!326 thiss!873) (currentByte!1212 thiss!873) #b00000000000000000000000000000000)))))))

(declare-fun bs!345 () Bool)

(assert (= bs!345 d!738))

(declare-fun m!79 () Bool)

(assert (=> bs!345 m!79))

(assert (=> start!78 d!738))

(declare-fun d!744 () Bool)

(assert (=> d!744 (= (inv!12 thiss!873) (invariant!0 (currentBit!1207 thiss!873) (currentByte!1212 thiss!873) (size!14 (buf!326 thiss!873))))))

(declare-fun bs!347 () Bool)

(assert (= bs!347 d!744))

(declare-fun m!85 () Bool)

(assert (=> bs!347 m!85))

(assert (=> start!78 d!744))

(declare-fun d!748 () Bool)

(assert (=> d!748 (= (array_inv!11 (buf!326 thiss!873)) (bvsge (size!14 (buf!326 thiss!873)) #b00000000000000000000000000000000))))

(assert (=> b!364 d!748))

(check-sat (not d!744) (not d!738))
(check-sat)
(get-model)

(declare-fun d!754 () Bool)

(assert (=> d!754 (= (invariant!0 (currentBit!1207 thiss!873) (currentByte!1212 thiss!873) (size!14 (buf!326 thiss!873))) (and (bvsge (currentBit!1207 thiss!873) #b00000000000000000000000000000000) (bvslt (currentBit!1207 thiss!873) #b00000000000000000000000000001000) (bvsge (currentByte!1212 thiss!873) #b00000000000000000000000000000000) (or (bvslt (currentByte!1212 thiss!873) (size!14 (buf!326 thiss!873))) (and (= (currentBit!1207 thiss!873) #b00000000000000000000000000000000) (= (currentByte!1212 thiss!873) (size!14 (buf!326 thiss!873)))))))))

(assert (=> d!744 d!754))

(declare-fun d!758 () Bool)

(assert (=> d!758 (= (invariant!0 (currentBit!1207 (BitStream!13 (buf!326 thiss!873) (currentByte!1212 thiss!873) #b00000000000000000000000000000000)) (currentByte!1212 (BitStream!13 (buf!326 thiss!873) (currentByte!1212 thiss!873) #b00000000000000000000000000000000)) (size!14 (buf!326 (BitStream!13 (buf!326 thiss!873) (currentByte!1212 thiss!873) #b00000000000000000000000000000000)))) (and (bvsge (currentBit!1207 (BitStream!13 (buf!326 thiss!873) (currentByte!1212 thiss!873) #b00000000000000000000000000000000)) #b00000000000000000000000000000000) (bvslt (currentBit!1207 (BitStream!13 (buf!326 thiss!873) (currentByte!1212 thiss!873) #b00000000000000000000000000000000)) #b00000000000000000000000000001000) (bvsge (currentByte!1212 (BitStream!13 (buf!326 thiss!873) (currentByte!1212 thiss!873) #b00000000000000000000000000000000)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1212 (BitStream!13 (buf!326 thiss!873) (currentByte!1212 thiss!873) #b00000000000000000000000000000000)) (size!14 (buf!326 (BitStream!13 (buf!326 thiss!873) (currentByte!1212 thiss!873) #b00000000000000000000000000000000)))) (and (= (currentBit!1207 (BitStream!13 (buf!326 thiss!873) (currentByte!1212 thiss!873) #b00000000000000000000000000000000)) #b00000000000000000000000000000000) (= (currentByte!1212 (BitStream!13 (buf!326 thiss!873) (currentByte!1212 thiss!873) #b00000000000000000000000000000000)) (size!14 (buf!326 (BitStream!13 (buf!326 thiss!873) (currentByte!1212 thiss!873) #b00000000000000000000000000000000))))))))))

(assert (=> d!738 d!758))

(check-sat)
