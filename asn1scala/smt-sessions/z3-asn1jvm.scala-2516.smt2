; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63544 () Bool)

(assert start!63544)

(declare-fun res!235199 () Bool)

(declare-fun e!202831 () Bool)

(assert (=> start!63544 (=> (not res!235199) (not e!202831))))

(declare-datatypes ((array!16554 0))(
  ( (array!16555 (arr!8144 (Array (_ BitVec 32) (_ BitVec 8))) (size!7148 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12666 0))(
  ( (BitStream!12667 (buf!7394 array!16554) (currentByte!13697 (_ BitVec 32)) (currentBit!13692 (_ BitVec 32))) )
))
(declare-fun thiss!1929 () BitStream!12666)

(assert (=> start!63544 (= res!235199 (and (bvsle ((_ sign_extend 32) (size!7148 (buf!7394 thiss!1929))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!13697 thiss!1929)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!13692 thiss!1929)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!7148 (buf!7394 thiss!1929))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!13697 thiss!1929)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!13692 thiss!1929)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!63544 e!202831))

(declare-fun e!202832 () Bool)

(declare-fun inv!12 (BitStream!12666) Bool)

(assert (=> start!63544 (and (inv!12 thiss!1929) e!202832)))

(declare-fun b!283859 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!283859 (= e!202831 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!13692 thiss!1929))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!13697 thiss!1929))) ((_ extract 31 0) ((_ sign_extend 32) (size!7148 (buf!7394 thiss!1929)))))))))

(declare-fun b!283860 () Bool)

(declare-fun array_inv!6841 (array!16554) Bool)

(assert (=> b!283860 (= e!202832 (array_inv!6841 (buf!7394 thiss!1929)))))

(assert (= (and start!63544 res!235199) b!283859))

(assert (= start!63544 b!283860))

(declare-fun m!416983 () Bool)

(assert (=> start!63544 m!416983))

(declare-fun m!416985 () Bool)

(assert (=> b!283859 m!416985))

(declare-fun m!416987 () Bool)

(assert (=> b!283860 m!416987))

(check-sat (not start!63544) (not b!283860) (not b!283859))
(check-sat)
(get-model)

(declare-fun d!97522 () Bool)

(assert (=> d!97522 (= (inv!12 thiss!1929) (invariant!0 (currentBit!13692 thiss!1929) (currentByte!13697 thiss!1929) (size!7148 (buf!7394 thiss!1929))))))

(declare-fun bs!24633 () Bool)

(assert (= bs!24633 d!97522))

(declare-fun m!416995 () Bool)

(assert (=> bs!24633 m!416995))

(assert (=> start!63544 d!97522))

(declare-fun d!97524 () Bool)

(assert (=> d!97524 (= (array_inv!6841 (buf!7394 thiss!1929)) (bvsge (size!7148 (buf!7394 thiss!1929)) #b00000000000000000000000000000000))))

(assert (=> b!283860 d!97524))

(declare-fun d!97526 () Bool)

(assert (=> d!97526 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!13692 thiss!1929))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!13697 thiss!1929))) ((_ extract 31 0) ((_ sign_extend 32) (size!7148 (buf!7394 thiss!1929))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!13692 thiss!1929))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!13692 thiss!1929))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!13697 thiss!1929))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!13697 thiss!1929))) ((_ extract 31 0) ((_ sign_extend 32) (size!7148 (buf!7394 thiss!1929))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!13692 thiss!1929))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!13697 thiss!1929))) ((_ extract 31 0) ((_ sign_extend 32) (size!7148 (buf!7394 thiss!1929)))))))))))

(assert (=> b!283859 d!97526))

(check-sat (not d!97522))
(check-sat)
