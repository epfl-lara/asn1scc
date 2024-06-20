; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63260 () Bool)

(assert start!63260)

(declare-datatypes ((array!16441 0))(
  ( (array!16442 (arr!8099 (Array (_ BitVec 32) (_ BitVec 8))) (size!7103 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12576 0))(
  ( (BitStream!12577 (buf!7349 array!16441) (currentByte!13614 (_ BitVec 32)) (currentBit!13609 (_ BitVec 32))) )
))
(declare-fun thiss!1939 () BitStream!12576)

(assert (=> start!63260 (and (bvsle ((_ sign_extend 32) (size!7103 (buf!7349 thiss!1939))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!13614 thiss!1939)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!13609 thiss!1939)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!7103 (buf!7349 thiss!1939))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!13614 thiss!1939)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!13609 thiss!1939)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!202415 () Bool)

(declare-fun inv!12 (BitStream!12576) Bool)

(assert (=> start!63260 (and (inv!12 thiss!1939) e!202415)))

(declare-fun b!283545 () Bool)

(declare-fun array_inv!6796 (array!16441) Bool)

(assert (=> b!283545 (= e!202415 (array_inv!6796 (buf!7349 thiss!1939)))))

(assert (= start!63260 b!283545))

(declare-fun m!416569 () Bool)

(assert (=> start!63260 m!416569))

(declare-fun m!416571 () Bool)

(assert (=> b!283545 m!416571))

(check-sat (not b!283545) (not start!63260))
(check-sat)
(get-model)

(declare-fun d!97264 () Bool)

(assert (=> d!97264 (= (array_inv!6796 (buf!7349 thiss!1939)) (bvsge (size!7103 (buf!7349 thiss!1939)) #b00000000000000000000000000000000))))

(assert (=> b!283545 d!97264))

(declare-fun d!97266 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!97266 (= (inv!12 thiss!1939) (invariant!0 (currentBit!13609 thiss!1939) (currentByte!13614 thiss!1939) (size!7103 (buf!7349 thiss!1939))))))

(declare-fun bs!24538 () Bool)

(assert (= bs!24538 d!97266))

(declare-fun m!416577 () Bool)

(assert (=> bs!24538 m!416577))

(assert (=> start!63260 d!97266))

(check-sat (not d!97266))
(check-sat)
(get-model)

(declare-fun d!97270 () Bool)

(assert (=> d!97270 (= (invariant!0 (currentBit!13609 thiss!1939) (currentByte!13614 thiss!1939) (size!7103 (buf!7349 thiss!1939))) (and (bvsge (currentBit!13609 thiss!1939) #b00000000000000000000000000000000) (bvslt (currentBit!13609 thiss!1939) #b00000000000000000000000000001000) (bvsge (currentByte!13614 thiss!1939) #b00000000000000000000000000000000) (or (bvslt (currentByte!13614 thiss!1939) (size!7103 (buf!7349 thiss!1939))) (and (= (currentBit!13609 thiss!1939) #b00000000000000000000000000000000) (= (currentByte!13614 thiss!1939) (size!7103 (buf!7349 thiss!1939)))))))))

(assert (=> d!97266 d!97270))

(check-sat)
