; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!156 () Bool)

(assert start!156)

(declare-fun res!2515 () Bool)

(declare-fun e!159 () Bool)

(assert (=> start!156 (=> (not res!2515) (not e!159))))

(declare-datatypes ((array!65 0))(
  ( (array!66 (arr!413 (Array (_ BitVec 32) (_ BitVec 8))) (size!26 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!36 0))(
  ( (BitStream!37 (buf!338 array!65) (currentByte!1233 (_ BitVec 32)) (currentBit!1228 (_ BitVec 32))) )
))
(declare-fun thiss!932 () BitStream!36)

(assert (=> start!156 (= res!2515 (and (bvsle ((_ sign_extend 32) (size!26 (buf!338 thiss!932))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!1233 thiss!932)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!1228 thiss!932)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!26 (buf!338 thiss!932))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!1233 thiss!932)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!1228 thiss!932)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!156 e!159))

(declare-fun e!160 () Bool)

(declare-fun inv!12 (BitStream!36) Bool)

(assert (=> start!156 (and (inv!12 thiss!932) e!160)))

(declare-fun b!405 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!405 (= e!159 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1228 thiss!932))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1233 thiss!932))) ((_ extract 31 0) ((_ sign_extend 32) (size!26 (buf!338 thiss!932)))))))))

(declare-fun b!406 () Bool)

(declare-fun array_inv!23 (array!65) Bool)

(assert (=> b!406 (= e!160 (array_inv!23 (buf!338 thiss!932)))))

(assert (= (and start!156 res!2515) b!405))

(assert (= start!156 b!406))

(declare-fun m!157 () Bool)

(assert (=> start!156 m!157))

(declare-fun m!159 () Bool)

(assert (=> b!405 m!159))

(declare-fun m!161 () Bool)

(assert (=> b!406 m!161))

(check-sat (not b!406) (not start!156) (not b!405))
(check-sat)
(get-model)

(declare-fun d!822 () Bool)

(assert (=> d!822 (= (array_inv!23 (buf!338 thiss!932)) (bvsge (size!26 (buf!338 thiss!932)) #b00000000000000000000000000000000))))

(assert (=> b!406 d!822))

(declare-fun d!824 () Bool)

(assert (=> d!824 (= (inv!12 thiss!932) (invariant!0 (currentBit!1228 thiss!932) (currentByte!1233 thiss!932) (size!26 (buf!338 thiss!932))))))

(declare-fun bs!372 () Bool)

(assert (= bs!372 d!824))

(declare-fun m!169 () Bool)

(assert (=> bs!372 m!169))

(assert (=> start!156 d!824))

(declare-fun d!826 () Bool)

(assert (=> d!826 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1228 thiss!932))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1233 thiss!932))) ((_ extract 31 0) ((_ sign_extend 32) (size!26 (buf!338 thiss!932))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1228 thiss!932))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1228 thiss!932))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1233 thiss!932))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1233 thiss!932))) ((_ extract 31 0) ((_ sign_extend 32) (size!26 (buf!338 thiss!932))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1228 thiss!932))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1233 thiss!932))) ((_ extract 31 0) ((_ sign_extend 32) (size!26 (buf!338 thiss!932)))))))))))

(assert (=> b!405 d!826))

(check-sat (not d!824))
(check-sat)
