; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51774 () Bool)

(assert start!51774)

(declare-datatypes ((array!12983 0))(
  ( (array!12984 (arr!6677 (Array (_ BitVec 32) (_ BitVec 8))) (size!5690 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10302 0))(
  ( (BitStream!10303 (buf!6144 array!12983) (currentByte!11450 (_ BitVec 32)) (currentBit!11445 (_ BitVec 32))) )
))
(declare-fun thiss!1948 () BitStream!10302)

(assert (=> start!51774 (or (bvsgt ((_ sign_extend 32) (size!5690 (buf!6144 thiss!1948))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!11450 thiss!1948)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!11445 thiss!1948)) #b0000000000000000000000000000000001111111111111111111111111111111))))

(declare-fun e!165847 () Bool)

(declare-fun inv!12 (BitStream!10302) Bool)

(assert (=> start!51774 (and (inv!12 thiss!1948) e!165847)))

(declare-fun b!239501 () Bool)

(declare-fun array_inv!5431 (array!12983) Bool)

(assert (=> b!239501 (= e!165847 (array_inv!5431 (buf!6144 thiss!1948)))))

(assert (= start!51774 b!239501))

(declare-fun m!361721 () Bool)

(assert (=> start!51774 m!361721))

(declare-fun m!361723 () Bool)

(assert (=> b!239501 m!361723))

(check-sat (not start!51774) (not b!239501))
(check-sat)
