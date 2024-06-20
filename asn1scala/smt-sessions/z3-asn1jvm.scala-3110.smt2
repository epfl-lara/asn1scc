; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71542 () Bool)

(assert start!71542)

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-datatypes ((array!20456 0))(
  ( (array!20457 (arr!9998 (Array (_ BitVec 32) (_ BitVec 8))) (size!8906 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13974 0))(
  ( (BitStream!13975 (buf!8048 array!20456) (currentByte!14845 (_ BitVec 32)) (currentBit!14840 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!13974)

(assert (=> start!71542 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000) (or (bvsgt ((_ sign_extend 32) (size!8906 (buf!8048 thiss!1793))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!14845 thiss!1793)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!14840 thiss!1793)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!71542 true))

(declare-fun e!231746 () Bool)

(declare-fun inv!12 (BitStream!13974) Bool)

(assert (=> start!71542 (and (inv!12 thiss!1793) e!231746)))

(declare-fun b!321628 () Bool)

(declare-fun array_inv!8458 (array!20456) Bool)

(assert (=> b!321628 (= e!231746 (array_inv!8458 (buf!8048 thiss!1793)))))

(assert (= start!71542 b!321628))

(declare-fun m!459979 () Bool)

(assert (=> start!71542 m!459979))

(declare-fun m!459981 () Bool)

(assert (=> b!321628 m!459981))

(check-sat (not start!71542) (not b!321628))
(check-sat)
