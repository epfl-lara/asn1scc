; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51782 () Bool)

(assert start!51782)

(declare-datatypes ((array!12991 0))(
  ( (array!12992 (arr!6681 (Array (_ BitVec 32) (_ BitVec 8))) (size!5694 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10310 0))(
  ( (BitStream!10311 (buf!6148 array!12991) (currentByte!11454 (_ BitVec 32)) (currentBit!11449 (_ BitVec 32))) )
))
(declare-fun thiss!1948 () BitStream!10310)

(assert (=> start!51782 (and (bvsle ((_ sign_extend 32) (size!5694 (buf!6148 thiss!1948))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!11454 thiss!1948)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!11449 thiss!1948)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!5694 (buf!6148 thiss!1948))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!11454 thiss!1948)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!11449 thiss!1948)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!165871 () Bool)

(declare-fun inv!12 (BitStream!10310) Bool)

(assert (=> start!51782 (and (inv!12 thiss!1948) e!165871)))

(declare-fun b!239513 () Bool)

(declare-fun array_inv!5435 (array!12991) Bool)

(assert (=> b!239513 (= e!165871 (array_inv!5435 (buf!6148 thiss!1948)))))

(assert (= start!51782 b!239513))

(declare-fun m!361737 () Bool)

(assert (=> start!51782 m!361737))

(declare-fun m!361739 () Bool)

(assert (=> b!239513 m!361739))

(push 1)

(assert (not b!239513))

(assert (not start!51782))

(check-sat)

(pop 1)

(push 1)

(check-sat)

