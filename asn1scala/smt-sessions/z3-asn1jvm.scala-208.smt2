; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4146 () Bool)

(assert start!4146)

(declare-fun nBits!604 () (_ BitVec 64))

(declare-datatypes ((array!1129 0))(
  ( (array!1130 (arr!911 (Array (_ BitVec 32) (_ BitVec 8))) (size!482 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!834 0))(
  ( (BitStream!835 (buf!800 array!1129) (currentByte!1988 (_ BitVec 32)) (currentBit!1983 (_ BitVec 32))) )
))
(declare-fun thiss!1917 () BitStream!834)

(assert (=> start!4146 (and (bvsge nBits!604 #b0000000000000000000000000000000000000000000000000000000000000000) (or (bvsgt ((_ sign_extend 32) (size!482 (buf!800 thiss!1917))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!1988 thiss!1917)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!1983 thiss!1917)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!4146 true))

(declare-fun e!11171 () Bool)

(declare-fun inv!12 (BitStream!834) Bool)

(assert (=> start!4146 (and (inv!12 thiss!1917) e!11171)))

(declare-fun b!17459 () Bool)

(declare-fun array_inv!452 (array!1129) Bool)

(assert (=> b!17459 (= e!11171 (array_inv!452 (buf!800 thiss!1917)))))

(assert (= start!4146 b!17459))

(declare-fun m!23759 () Bool)

(assert (=> start!4146 m!23759))

(declare-fun m!23761 () Bool)

(assert (=> b!17459 m!23761))

(check-sat (not start!4146) (not b!17459))
(check-sat)
