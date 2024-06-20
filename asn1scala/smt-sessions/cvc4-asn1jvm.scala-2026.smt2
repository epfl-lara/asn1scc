; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51814 () Bool)

(assert start!51814)

(declare-fun res!200049 () Bool)

(declare-fun e!165926 () Bool)

(assert (=> start!51814 (=> (not res!200049) (not e!165926))))

(declare-datatypes ((array!13006 0))(
  ( (array!13007 (arr!6687 (Array (_ BitVec 32) (_ BitVec 8))) (size!5700 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10322 0))(
  ( (BitStream!10323 (buf!6154 array!13006) (currentByte!11463 (_ BitVec 32)) (currentBit!11458 (_ BitVec 32))) )
))
(declare-fun thiss!1948 () BitStream!10322)

(assert (=> start!51814 (= res!200049 (and (bvsle ((_ sign_extend 32) (size!5700 (buf!6154 thiss!1948))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!11463 thiss!1948)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!11458 thiss!1948)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!5700 (buf!6154 thiss!1948))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!11463 thiss!1948)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!11458 thiss!1948)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!51814 e!165926))

(declare-fun e!165925 () Bool)

(declare-fun inv!12 (BitStream!10322) Bool)

(assert (=> start!51814 (and (inv!12 thiss!1948) e!165925)))

(declare-fun b!239556 () Bool)

(declare-fun res!200048 () Bool)

(assert (=> b!239556 (=> (not res!200048) (not e!165926))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!239556 (= res!200048 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11458 thiss!1948))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11463 thiss!1948))) ((_ extract 31 0) ((_ sign_extend 32) (size!5700 (buf!6154 thiss!1948))))))))

(declare-fun b!239557 () Bool)

(assert (=> b!239557 (= e!165926 (bvslt ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000100000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!11463 thiss!1948) #b00000000000000000000000000000011)) (currentBit!11458 thiss!1948))) #b00000000000000000000000000011111)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!239558 () Bool)

(declare-fun array_inv!5441 (array!13006) Bool)

(assert (=> b!239558 (= e!165925 (array_inv!5441 (buf!6154 thiss!1948)))))

(assert (= (and start!51814 res!200049) b!239556))

(assert (= (and b!239556 res!200048) b!239557))

(assert (= start!51814 b!239558))

(declare-fun m!361777 () Bool)

(assert (=> start!51814 m!361777))

(declare-fun m!361779 () Bool)

(assert (=> b!239556 m!361779))

(declare-fun m!361781 () Bool)

(assert (=> b!239558 m!361781))

(push 1)

