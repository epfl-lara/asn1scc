; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51772 () Bool)

(assert start!51772)

(declare-datatypes ((array!12981 0))(
  ( (array!12982 (arr!6676 (Array (_ BitVec 32) (_ BitVec 8))) (size!5689 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10300 0))(
  ( (BitStream!10301 (buf!6143 array!12981) (currentByte!11449 (_ BitVec 32)) (currentBit!11444 (_ BitVec 32))) )
))
(declare-fun thiss!1948 () BitStream!10300)

(assert (=> start!51772 (or (bvsgt ((_ sign_extend 32) (size!5689 (buf!6143 thiss!1948))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!11449 thiss!1948)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!11444 thiss!1948)) #b0000000000000000000000000000000001111111111111111111111111111111))))

(declare-fun e!165841 () Bool)

(declare-fun inv!12 (BitStream!10300) Bool)

(assert (=> start!51772 (and (inv!12 thiss!1948) e!165841)))

(declare-fun b!239498 () Bool)

(declare-fun array_inv!5430 (array!12981) Bool)

(assert (=> b!239498 (= e!165841 (array_inv!5430 (buf!6143 thiss!1948)))))

(assert (= start!51772 b!239498))

(declare-fun m!361717 () Bool)

(assert (=> start!51772 m!361717))

(declare-fun m!361719 () Bool)

(assert (=> b!239498 m!361719))

(push 1)

(assert (not start!51772))

(assert (not b!239498))

(check-sat)

(pop 1)

(push 1)

(check-sat)

