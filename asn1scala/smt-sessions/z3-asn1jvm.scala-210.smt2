; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4176 () Bool)

(assert start!4176)

(declare-fun res!15437 () Bool)

(declare-fun e!11212 () Bool)

(assert (=> start!4176 (=> (not res!15437) (not e!11212))))

(declare-fun nBits!604 () (_ BitVec 64))

(declare-datatypes ((array!1144 0))(
  ( (array!1145 (arr!917 (Array (_ BitVec 32) (_ BitVec 8))) (size!488 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!846 0))(
  ( (BitStream!847 (buf!806 array!1144) (currentByte!1997 (_ BitVec 32)) (currentBit!1992 (_ BitVec 32))) )
))
(declare-fun thiss!1917 () BitStream!846)

(assert (=> start!4176 (= res!15437 (and (bvsge nBits!604 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle ((_ sign_extend 32) (size!488 (buf!806 thiss!1917))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!1997 thiss!1917)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!1992 thiss!1917)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!488 (buf!806 thiss!1917))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!1997 thiss!1917)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!1992 thiss!1917)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!4176 e!11212))

(assert (=> start!4176 true))

(declare-fun e!11213 () Bool)

(declare-fun inv!12 (BitStream!846) Bool)

(assert (=> start!4176 (and (inv!12 thiss!1917) e!11213)))

(declare-fun b!17482 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!17482 (= e!11212 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1992 thiss!1917))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1997 thiss!1917))) ((_ extract 31 0) ((_ sign_extend 32) (size!488 (buf!806 thiss!1917)))))))))

(declare-fun b!17483 () Bool)

(declare-fun array_inv!458 (array!1144) Bool)

(assert (=> b!17483 (= e!11213 (array_inv!458 (buf!806 thiss!1917)))))

(assert (= (and start!4176 res!15437) b!17482))

(assert (= start!4176 b!17483))

(declare-fun m!23791 () Bool)

(assert (=> start!4176 m!23791))

(declare-fun m!23793 () Bool)

(assert (=> b!17482 m!23793))

(declare-fun m!23795 () Bool)

(assert (=> b!17483 m!23795))

(check-sat (not b!17483) (not start!4176) (not b!17482))
(check-sat)
(get-model)

(declare-fun d!5706 () Bool)

(assert (=> d!5706 (= (array_inv!458 (buf!806 thiss!1917)) (bvsge (size!488 (buf!806 thiss!1917)) #b00000000000000000000000000000000))))

(assert (=> b!17483 d!5706))

(declare-fun d!5708 () Bool)

(assert (=> d!5708 (= (inv!12 thiss!1917) (invariant!0 (currentBit!1992 thiss!1917) (currentByte!1997 thiss!1917) (size!488 (buf!806 thiss!1917))))))

(declare-fun bs!1632 () Bool)

(assert (= bs!1632 d!5708))

(declare-fun m!23803 () Bool)

(assert (=> bs!1632 m!23803))

(assert (=> start!4176 d!5708))

(declare-fun d!5712 () Bool)

(assert (=> d!5712 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1992 thiss!1917))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1997 thiss!1917))) ((_ extract 31 0) ((_ sign_extend 32) (size!488 (buf!806 thiss!1917))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1992 thiss!1917))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1992 thiss!1917))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1997 thiss!1917))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1997 thiss!1917))) ((_ extract 31 0) ((_ sign_extend 32) (size!488 (buf!806 thiss!1917))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1992 thiss!1917))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1997 thiss!1917))) ((_ extract 31 0) ((_ sign_extend 32) (size!488 (buf!806 thiss!1917)))))))))))

(assert (=> b!17482 d!5712))

(check-sat (not d!5708))
(check-sat)
