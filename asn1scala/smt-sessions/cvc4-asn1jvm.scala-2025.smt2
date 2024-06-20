; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51798 () Bool)

(assert start!51798)

(declare-fun res!200031 () Bool)

(declare-fun e!165897 () Bool)

(assert (=> start!51798 (=> (not res!200031) (not e!165897))))

(declare-datatypes ((array!12999 0))(
  ( (array!13000 (arr!6684 (Array (_ BitVec 32) (_ BitVec 8))) (size!5697 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10316 0))(
  ( (BitStream!10317 (buf!6151 array!12999) (currentByte!11458 (_ BitVec 32)) (currentBit!11453 (_ BitVec 32))) )
))
(declare-fun thiss!1948 () BitStream!10316)

(assert (=> start!51798 (= res!200031 (and (bvsle ((_ sign_extend 32) (size!5697 (buf!6151 thiss!1948))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!11458 thiss!1948)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!11453 thiss!1948)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!5697 (buf!6151 thiss!1948))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!11458 thiss!1948)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!11453 thiss!1948)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!51798 e!165897))

(declare-fun e!165898 () Bool)

(declare-fun inv!12 (BitStream!10316) Bool)

(assert (=> start!51798 (and (inv!12 thiss!1948) e!165898)))

(declare-fun b!239530 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!239530 (= e!165897 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11453 thiss!1948))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11458 thiss!1948))) ((_ extract 31 0) ((_ sign_extend 32) (size!5697 (buf!6151 thiss!1948)))))))))

(declare-fun b!239531 () Bool)

(declare-fun array_inv!5438 (array!12999) Bool)

(assert (=> b!239531 (= e!165898 (array_inv!5438 (buf!6151 thiss!1948)))))

(assert (= (and start!51798 res!200031) b!239530))

(assert (= start!51798 b!239531))

(declare-fun m!361757 () Bool)

(assert (=> start!51798 m!361757))

(declare-fun m!361759 () Bool)

(assert (=> b!239530 m!361759))

(declare-fun m!361761 () Bool)

(assert (=> b!239531 m!361761))

(push 1)

(assert (not b!239531))

(assert (not b!239530))

(assert (not start!51798))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

