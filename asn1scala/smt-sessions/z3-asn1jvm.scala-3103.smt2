; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71478 () Bool)

(assert start!71478)

(declare-fun i!747 () (_ BitVec 32))

(declare-fun nBits!568 () (_ BitVec 32))

(declare-datatypes ((array!20416 0))(
  ( (array!20417 (arr!9980 (Array (_ BitVec 32) (_ BitVec 8))) (size!8888 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13938 0))(
  ( (BitStream!13939 (buf!8030 array!20416) (currentByte!14824 (_ BitVec 32)) (currentBit!14819 (_ BitVec 32))) )
))
(declare-fun thiss!1811 () BitStream!13938)

(assert (=> start!71478 (and (bvsle #b00000000000000000000000000000000 i!747) (bvsle i!747 nBits!568) (bvsle nBits!568 #b00000000000000000000000001000000) (or (bvsgt ((_ sign_extend 32) (size!8888 (buf!8030 thiss!1811))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!14824 thiss!1811)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!14819 thiss!1811)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!71478 true))

(declare-fun e!231602 () Bool)

(declare-fun inv!12 (BitStream!13938) Bool)

(assert (=> start!71478 (and (inv!12 thiss!1811) e!231602)))

(declare-fun b!321511 () Bool)

(declare-fun array_inv!8440 (array!20416) Bool)

(assert (=> b!321511 (= e!231602 (array_inv!8440 (buf!8030 thiss!1811)))))

(assert (= start!71478 b!321511))

(declare-fun m!459875 () Bool)

(assert (=> start!71478 m!459875))

(declare-fun m!459877 () Bool)

(assert (=> b!321511 m!459877))

(check-sat (not b!321511) (not start!71478))
(check-sat)
