; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51810 () Bool)

(assert start!51810)

(declare-fun res!200036 () Bool)

(declare-fun e!165908 () Bool)

(assert (=> start!51810 (=> (not res!200036) (not e!165908))))

(declare-datatypes ((array!13002 0))(
  ( (array!13003 (arr!6685 (Array (_ BitVec 32) (_ BitVec 8))) (size!5698 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10318 0))(
  ( (BitStream!10319 (buf!6152 array!13002) (currentByte!11461 (_ BitVec 32)) (currentBit!11456 (_ BitVec 32))) )
))
(declare-fun thiss!1948 () BitStream!10318)

(assert (=> start!51810 (= res!200036 (and (bvsle ((_ sign_extend 32) (size!5698 (buf!6152 thiss!1948))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!11461 thiss!1948)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!11456 thiss!1948)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!5698 (buf!6152 thiss!1948))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!11461 thiss!1948)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!11456 thiss!1948)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!51810 e!165908))

(declare-fun e!165907 () Bool)

(declare-fun inv!12 (BitStream!10318) Bool)

(assert (=> start!51810 (and (inv!12 thiss!1948) e!165907)))

(declare-fun b!239538 () Bool)

(declare-fun res!200037 () Bool)

(assert (=> b!239538 (=> (not res!200037) (not e!165908))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!239538 (= res!200037 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11456 thiss!1948))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11461 thiss!1948))) ((_ extract 31 0) ((_ sign_extend 32) (size!5698 (buf!6152 thiss!1948))))))))

(declare-fun b!239539 () Bool)

(assert (=> b!239539 (= e!165908 (bvslt ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000100000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!11461 thiss!1948) #b00000000000000000000000000000011)) (currentBit!11456 thiss!1948))) #b00000000000000000000000000011111)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!239540 () Bool)

(declare-fun array_inv!5439 (array!13002) Bool)

(assert (=> b!239540 (= e!165907 (array_inv!5439 (buf!6152 thiss!1948)))))

(assert (= (and start!51810 res!200036) b!239538))

(assert (= (and b!239538 res!200037) b!239539))

(assert (= start!51810 b!239540))

(declare-fun m!361765 () Bool)

(assert (=> start!51810 m!361765))

(declare-fun m!361767 () Bool)

(assert (=> b!239538 m!361767))

(declare-fun m!361769 () Bool)

(assert (=> b!239540 m!361769))

(push 1)

