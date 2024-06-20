; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71476 () Bool)

(assert start!71476)

(declare-fun i!747 () (_ BitVec 32))

(declare-fun nBits!568 () (_ BitVec 32))

(declare-datatypes ((array!20414 0))(
  ( (array!20415 (arr!9979 (Array (_ BitVec 32) (_ BitVec 8))) (size!8887 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13936 0))(
  ( (BitStream!13937 (buf!8029 array!20414) (currentByte!14823 (_ BitVec 32)) (currentBit!14818 (_ BitVec 32))) )
))
(declare-fun thiss!1811 () BitStream!13936)

(assert (=> start!71476 (and (bvsle #b00000000000000000000000000000000 i!747) (bvsle i!747 nBits!568) (bvsle nBits!568 #b00000000000000000000000001000000) (or (bvsgt ((_ sign_extend 32) (size!8887 (buf!8029 thiss!1811))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!14823 thiss!1811)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!14818 thiss!1811)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!71476 true))

(declare-fun e!231596 () Bool)

(declare-fun inv!12 (BitStream!13936) Bool)

(assert (=> start!71476 (and (inv!12 thiss!1811) e!231596)))

(declare-fun b!321508 () Bool)

(declare-fun array_inv!8439 (array!20414) Bool)

(assert (=> b!321508 (= e!231596 (array_inv!8439 (buf!8029 thiss!1811)))))

(assert (= start!71476 b!321508))

(declare-fun m!459871 () Bool)

(assert (=> start!71476 m!459871))

(declare-fun m!459873 () Bool)

(assert (=> b!321508 m!459873))

(push 1)

(assert (not start!71476))

(assert (not b!321508))

(check-sat)

(pop 1)

(push 1)

(check-sat)

