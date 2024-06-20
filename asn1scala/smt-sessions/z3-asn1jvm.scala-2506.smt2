; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63368 () Bool)

(assert start!63368)

(declare-fun lt!417972 () (_ BitVec 32))

(declare-datatypes ((array!16488 0))(
  ( (array!16489 (arr!8117 (Array (_ BitVec 32) (_ BitVec 8))) (size!7121 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12612 0))(
  ( (BitStream!12613 (buf!7367 array!16488) (currentByte!13642 (_ BitVec 32)) (currentBit!13637 (_ BitVec 32))) )
))
(declare-fun thiss!1939 () BitStream!12612)

(assert (=> start!63368 (= lt!417972 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!13642 thiss!1939) #b00000000000000000000000000000001)) (currentBit!13637 thiss!1939)))))

(assert (=> start!63368 (and (not (= #b00000000000000000000000000000000 (bvand lt!417972 #b10000000000000000000000000000000))) (not (= #b00000000000000000000000000000000 (bvand (bvsub #b00000000000000000000000000010000 lt!417972) #b10000000000000000000000000000000))))))

(declare-fun e!202550 () Bool)

(declare-fun inv!12 (BitStream!12612) Bool)

(assert (=> start!63368 (and (inv!12 thiss!1939) e!202550)))

(declare-fun b!283635 () Bool)

(declare-fun array_inv!6814 (array!16488) Bool)

(assert (=> b!283635 (= e!202550 (array_inv!6814 (buf!7367 thiss!1939)))))

(assert (= start!63368 b!283635))

(declare-fun m!416693 () Bool)

(assert (=> start!63368 m!416693))

(declare-fun m!416695 () Bool)

(assert (=> b!283635 m!416695))

(check-sat (not start!63368) (not b!283635))
(check-sat)
(get-model)

(declare-fun d!97352 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!97352 (= (inv!12 thiss!1939) (invariant!0 (currentBit!13637 thiss!1939) (currentByte!13642 thiss!1939) (size!7121 (buf!7367 thiss!1939))))))

(declare-fun bs!24577 () Bool)

(assert (= bs!24577 d!97352))

(declare-fun m!416703 () Bool)

(assert (=> bs!24577 m!416703))

(assert (=> start!63368 d!97352))

(declare-fun d!97356 () Bool)

(assert (=> d!97356 (= (array_inv!6814 (buf!7367 thiss!1939)) (bvsge (size!7121 (buf!7367 thiss!1939)) #b00000000000000000000000000000000))))

(assert (=> b!283635 d!97356))

(check-sat (not d!97352))
(check-sat)
(get-model)

(declare-fun d!97364 () Bool)

(assert (=> d!97364 (= (invariant!0 (currentBit!13637 thiss!1939) (currentByte!13642 thiss!1939) (size!7121 (buf!7367 thiss!1939))) (and (bvsge (currentBit!13637 thiss!1939) #b00000000000000000000000000000000) (bvslt (currentBit!13637 thiss!1939) #b00000000000000000000000000001000) (bvsge (currentByte!13642 thiss!1939) #b00000000000000000000000000000000) (or (bvslt (currentByte!13642 thiss!1939) (size!7121 (buf!7367 thiss!1939))) (and (= (currentBit!13637 thiss!1939) #b00000000000000000000000000000000) (= (currentByte!13642 thiss!1939) (size!7121 (buf!7367 thiss!1939)))))))))

(assert (=> d!97352 d!97364))

(check-sat)
