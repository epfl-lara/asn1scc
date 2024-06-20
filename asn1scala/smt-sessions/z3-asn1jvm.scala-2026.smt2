; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51812 () Bool)

(assert start!51812)

(declare-fun res!200042 () Bool)

(declare-fun e!165915 () Bool)

(assert (=> start!51812 (=> (not res!200042) (not e!165915))))

(declare-datatypes ((array!13004 0))(
  ( (array!13005 (arr!6686 (Array (_ BitVec 32) (_ BitVec 8))) (size!5699 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10320 0))(
  ( (BitStream!10321 (buf!6153 array!13004) (currentByte!11462 (_ BitVec 32)) (currentBit!11457 (_ BitVec 32))) )
))
(declare-fun thiss!1948 () BitStream!10320)

(assert (=> start!51812 (= res!200042 (and (bvsle ((_ sign_extend 32) (size!5699 (buf!6153 thiss!1948))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!11462 thiss!1948)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!11457 thiss!1948)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!5699 (buf!6153 thiss!1948))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!11462 thiss!1948)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!11457 thiss!1948)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!51812 e!165915))

(declare-fun e!165916 () Bool)

(declare-fun inv!12 (BitStream!10320) Bool)

(assert (=> start!51812 (and (inv!12 thiss!1948) e!165916)))

(declare-fun b!239547 () Bool)

(declare-fun res!200043 () Bool)

(assert (=> b!239547 (=> (not res!200043) (not e!165915))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!239547 (= res!200043 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11457 thiss!1948))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11462 thiss!1948))) ((_ extract 31 0) ((_ sign_extend 32) (size!5699 (buf!6153 thiss!1948))))))))

(declare-fun b!239548 () Bool)

(assert (=> b!239548 (= e!165915 (bvslt ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000100000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!11462 thiss!1948) #b00000000000000000000000000000011)) (currentBit!11457 thiss!1948))) #b00000000000000000000000000011111)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!239549 () Bool)

(declare-fun array_inv!5440 (array!13004) Bool)

(assert (=> b!239549 (= e!165916 (array_inv!5440 (buf!6153 thiss!1948)))))

(assert (= (and start!51812 res!200042) b!239547))

(assert (= (and b!239547 res!200043) b!239548))

(assert (= start!51812 b!239549))

(declare-fun m!361771 () Bool)

(assert (=> start!51812 m!361771))

(declare-fun m!361773 () Bool)

(assert (=> b!239547 m!361773))

(declare-fun m!361775 () Bool)

(assert (=> b!239549 m!361775))

(check-sat (not b!239547) (not start!51812) (not b!239549))
(check-sat)
