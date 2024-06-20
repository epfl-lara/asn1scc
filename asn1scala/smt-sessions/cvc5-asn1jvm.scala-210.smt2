; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4174 () Bool)

(assert start!4174)

(declare-fun res!15434 () Bool)

(declare-fun e!11203 () Bool)

(assert (=> start!4174 (=> (not res!15434) (not e!11203))))

(declare-fun nBits!604 () (_ BitVec 64))

(declare-datatypes ((array!1142 0))(
  ( (array!1143 (arr!916 (Array (_ BitVec 32) (_ BitVec 8))) (size!487 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!844 0))(
  ( (BitStream!845 (buf!805 array!1142) (currentByte!1996 (_ BitVec 32)) (currentBit!1991 (_ BitVec 32))) )
))
(declare-fun thiss!1917 () BitStream!844)

(assert (=> start!4174 (= res!15434 (and (bvsge nBits!604 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle ((_ sign_extend 32) (size!487 (buf!805 thiss!1917))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!1996 thiss!1917)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!1991 thiss!1917)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!487 (buf!805 thiss!1917))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!1996 thiss!1917)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!1991 thiss!1917)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!4174 e!11203))

(assert (=> start!4174 true))

(declare-fun e!11204 () Bool)

(declare-fun inv!12 (BitStream!844) Bool)

(assert (=> start!4174 (and (inv!12 thiss!1917) e!11204)))

(declare-fun b!17476 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!17476 (= e!11203 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1991 thiss!1917))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1996 thiss!1917))) ((_ extract 31 0) ((_ sign_extend 32) (size!487 (buf!805 thiss!1917)))))))))

(declare-fun b!17477 () Bool)

(declare-fun array_inv!457 (array!1142) Bool)

(assert (=> b!17477 (= e!11204 (array_inv!457 (buf!805 thiss!1917)))))

(assert (= (and start!4174 res!15434) b!17476))

(assert (= start!4174 b!17477))

(declare-fun m!23785 () Bool)

(assert (=> start!4174 m!23785))

(declare-fun m!23787 () Bool)

(assert (=> b!17476 m!23787))

(declare-fun m!23789 () Bool)

(assert (=> b!17477 m!23789))

(push 1)

(assert (not start!4174))

(assert (not b!17476))

(assert (not b!17477))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!5710 () Bool)

(assert (=> d!5710 (= (inv!12 thiss!1917) (invariant!0 (currentBit!1991 thiss!1917) (currentByte!1996 thiss!1917) (size!487 (buf!805 thiss!1917))))))

(declare-fun bs!1633 () Bool)

(assert (= bs!1633 d!5710))

(declare-fun m!23805 () Bool)

(assert (=> bs!1633 m!23805))

(assert (=> start!4174 d!5710))

(declare-fun d!5714 () Bool)

(assert (=> d!5714 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1991 thiss!1917))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1996 thiss!1917))) ((_ extract 31 0) ((_ sign_extend 32) (size!487 (buf!805 thiss!1917))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1991 thiss!1917))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1991 thiss!1917))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1996 thiss!1917))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1996 thiss!1917))) ((_ extract 31 0) ((_ sign_extend 32) (size!487 (buf!805 thiss!1917))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1991 thiss!1917))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1996 thiss!1917))) ((_ extract 31 0) ((_ sign_extend 32) (size!487 (buf!805 thiss!1917)))))))))))

(assert (=> b!17476 d!5714))

