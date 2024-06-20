; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71480 () Bool)

(assert start!71480)

(declare-fun i!747 () (_ BitVec 32))

(declare-fun nBits!568 () (_ BitVec 32))

(declare-datatypes ((array!20418 0))(
  ( (array!20419 (arr!9981 (Array (_ BitVec 32) (_ BitVec 8))) (size!8889 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13940 0))(
  ( (BitStream!13941 (buf!8031 array!20418) (currentByte!14825 (_ BitVec 32)) (currentBit!14820 (_ BitVec 32))) )
))
(declare-fun thiss!1811 () BitStream!13940)

(assert (=> start!71480 (and (bvsle #b00000000000000000000000000000000 i!747) (bvsle i!747 nBits!568) (bvsle nBits!568 #b00000000000000000000000001000000) (or (bvsgt ((_ sign_extend 32) (size!8889 (buf!8031 thiss!1811))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!14825 thiss!1811)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!14820 thiss!1811)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!71480 true))

(declare-fun e!231608 () Bool)

(declare-fun inv!12 (BitStream!13940) Bool)

(assert (=> start!71480 (and (inv!12 thiss!1811) e!231608)))

(declare-fun b!321514 () Bool)

(declare-fun array_inv!8441 (array!20418) Bool)

(assert (=> b!321514 (= e!231608 (array_inv!8441 (buf!8031 thiss!1811)))))

(assert (= start!71480 b!321514))

(declare-fun m!459879 () Bool)

(assert (=> start!71480 m!459879))

(declare-fun m!459881 () Bool)

(assert (=> b!321514 m!459881))

(push 1)

(assert (not b!321514))

(assert (not start!71480))

(check-sat)

(pop 1)

(push 1)

(check-sat)

