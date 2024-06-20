; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132 () Bool)

(assert start!132)

(declare-datatypes ((array!56 0))(
  ( (array!57 (arr!410 (Array (_ BitVec 32) (_ BitVec 8))) (size!23 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!30 0))(
  ( (BitStream!31 (buf!335 array!56) (currentByte!1227 (_ BitVec 32)) (currentBit!1222 (_ BitVec 32))) )
))
(declare-fun thiss!932 () BitStream!30)

(assert (=> start!132 (and (bvsle ((_ sign_extend 32) (size!23 (buf!335 thiss!932))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!1227 thiss!932)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!1222 thiss!932)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!23 (buf!335 thiss!932))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!1227 thiss!932)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!1222 thiss!932)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!136 () Bool)

(declare-fun inv!12 (BitStream!30) Bool)

(assert (=> start!132 (and (inv!12 thiss!932) e!136)))

(declare-fun b!391 () Bool)

(declare-fun array_inv!20 (array!56) Bool)

(assert (=> b!391 (= e!136 (array_inv!20 (buf!335 thiss!932)))))

(assert (= start!132 b!391))

(declare-fun m!137 () Bool)

(assert (=> start!132 m!137))

(declare-fun m!139 () Bool)

(assert (=> b!391 m!139))

(check-sat (not b!391) (not start!132))
(check-sat)
(get-model)

(declare-fun d!802 () Bool)

(assert (=> d!802 (= (array_inv!20 (buf!335 thiss!932)) (bvsge (size!23 (buf!335 thiss!932)) #b00000000000000000000000000000000))))

(assert (=> b!391 d!802))

(declare-fun d!804 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!804 (= (inv!12 thiss!932) (invariant!0 (currentBit!1222 thiss!932) (currentByte!1227 thiss!932) (size!23 (buf!335 thiss!932))))))

(declare-fun bs!366 () Bool)

(assert (= bs!366 d!804))

(declare-fun m!145 () Bool)

(assert (=> bs!366 m!145))

(assert (=> start!132 d!804))

(check-sat (not d!804))
(check-sat)
(get-model)

(declare-fun d!814 () Bool)

(assert (=> d!814 (= (invariant!0 (currentBit!1222 thiss!932) (currentByte!1227 thiss!932) (size!23 (buf!335 thiss!932))) (and (bvsge (currentBit!1222 thiss!932) #b00000000000000000000000000000000) (bvslt (currentBit!1222 thiss!932) #b00000000000000000000000000001000) (bvsge (currentByte!1227 thiss!932) #b00000000000000000000000000000000) (or (bvslt (currentByte!1227 thiss!932) (size!23 (buf!335 thiss!932))) (and (= (currentBit!1222 thiss!932) #b00000000000000000000000000000000) (= (currentByte!1227 thiss!932) (size!23 (buf!335 thiss!932)))))))))

(assert (=> d!804 d!814))

(check-sat)
