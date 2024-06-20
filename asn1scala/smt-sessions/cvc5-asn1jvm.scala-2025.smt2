; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51794 () Bool)

(assert start!51794)

(declare-fun res!200025 () Bool)

(declare-fun e!165879 () Bool)

(assert (=> start!51794 (=> (not res!200025) (not e!165879))))

(declare-datatypes ((array!12995 0))(
  ( (array!12996 (arr!6682 (Array (_ BitVec 32) (_ BitVec 8))) (size!5695 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10312 0))(
  ( (BitStream!10313 (buf!6149 array!12995) (currentByte!11456 (_ BitVec 32)) (currentBit!11451 (_ BitVec 32))) )
))
(declare-fun thiss!1948 () BitStream!10312)

(assert (=> start!51794 (= res!200025 (and (bvsle ((_ sign_extend 32) (size!5695 (buf!6149 thiss!1948))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!11456 thiss!1948)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!11451 thiss!1948)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!5695 (buf!6149 thiss!1948))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!11456 thiss!1948)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!11451 thiss!1948)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!51794 e!165879))

(declare-fun e!165880 () Bool)

(declare-fun inv!12 (BitStream!10312) Bool)

(assert (=> start!51794 (and (inv!12 thiss!1948) e!165880)))

(declare-fun b!239518 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!239518 (= e!165879 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11451 thiss!1948))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11456 thiss!1948))) ((_ extract 31 0) ((_ sign_extend 32) (size!5695 (buf!6149 thiss!1948)))))))))

(declare-fun b!239519 () Bool)

(declare-fun array_inv!5436 (array!12995) Bool)

(assert (=> b!239519 (= e!165880 (array_inv!5436 (buf!6149 thiss!1948)))))

(assert (= (and start!51794 res!200025) b!239518))

(assert (= start!51794 b!239519))

(declare-fun m!361745 () Bool)

(assert (=> start!51794 m!361745))

(declare-fun m!361747 () Bool)

(assert (=> b!239518 m!361747))

(declare-fun m!361749 () Bool)

(assert (=> b!239519 m!361749))

(push 1)

(assert (not b!239518))

(assert (not start!51794))

(assert (not b!239519))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80920 () Bool)

