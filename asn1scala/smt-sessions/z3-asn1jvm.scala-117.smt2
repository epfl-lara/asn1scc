; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2746 () Bool)

(assert start!2746)

(declare-datatypes ((array!719 0))(
  ( (array!720 (arr!743 (Array (_ BitVec 32) (_ BitVec 8))) (size!314 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!588 0))(
  ( (BitStream!589 (buf!665 array!719) (currentByte!1749 (_ BitVec 32)) (currentBit!1744 (_ BitVec 32))) )
))
(declare-fun thiss!957 () BitStream!588)

(assert (=> start!2746 (or (bvsgt ((_ sign_extend 32) (size!314 (buf!665 thiss!957))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!1749 thiss!957)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!1744 thiss!957)) #b0000000000000000000000000000000001111111111111111111111111111111))))

(declare-fun e!7966 () Bool)

(declare-fun inv!12 (BitStream!588) Bool)

(assert (=> start!2746 (and (inv!12 thiss!957) e!7966)))

(declare-fun b!13116 () Bool)

(declare-fun array_inv!303 (array!719) Bool)

(assert (=> b!13116 (= e!7966 (array_inv!303 (buf!665 thiss!957)))))

(assert (= start!2746 b!13116))

(declare-fun m!19767 () Bool)

(assert (=> start!2746 m!19767))

(declare-fun m!19769 () Bool)

(assert (=> b!13116 m!19769))

(check-sat (not b!13116) (not start!2746))
(check-sat)
