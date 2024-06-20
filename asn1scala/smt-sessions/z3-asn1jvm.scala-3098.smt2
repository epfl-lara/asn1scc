; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71358 () Bool)

(assert start!71358)

(declare-datatypes ((array!20375 0))(
  ( (array!20376 (arr!9965 (Array (_ BitVec 32) (_ BitVec 8))) (size!8873 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13908 0))(
  ( (BitStream!13909 (buf!8015 array!20375) (currentByte!14786 (_ BitVec 32)) (currentBit!14781 (_ BitVec 32))) )
))
(declare-fun thiss!1701 () BitStream!13908)

(assert (=> start!71358 (or (bvsgt ((_ sign_extend 32) (size!8873 (buf!8015 thiss!1701))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!14786 thiss!1701)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!14781 thiss!1701)) #b0000000000000000000000000000000001111111111111111111111111111111))))

(declare-fun e!231485 () Bool)

(declare-fun inv!12 (BitStream!13908) Bool)

(assert (=> start!71358 (and (inv!12 thiss!1701) e!231485)))

(declare-fun b!321439 () Bool)

(declare-fun array_inv!8425 (array!20375) Bool)

(assert (=> b!321439 (= e!231485 (array_inv!8425 (buf!8015 thiss!1701)))))

(assert (= start!71358 b!321439))

(declare-fun m!459763 () Bool)

(assert (=> start!71358 m!459763))

(declare-fun m!459765 () Bool)

(assert (=> b!321439 m!459765))

(check-sat (not start!71358) (not b!321439))
(check-sat)
