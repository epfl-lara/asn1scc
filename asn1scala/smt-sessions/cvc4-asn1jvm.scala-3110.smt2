; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71544 () Bool)

(assert start!71544)

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-datatypes ((array!20458 0))(
  ( (array!20459 (arr!9999 (Array (_ BitVec 32) (_ BitVec 8))) (size!8907 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13976 0))(
  ( (BitStream!13977 (buf!8049 array!20458) (currentByte!14846 (_ BitVec 32)) (currentBit!14841 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!13976)

(assert (=> start!71544 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000) (or (bvsgt ((_ sign_extend 32) (size!8907 (buf!8049 thiss!1793))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!14846 thiss!1793)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!14841 thiss!1793)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!71544 true))

(declare-fun e!231752 () Bool)

(declare-fun inv!12 (BitStream!13976) Bool)

(assert (=> start!71544 (and (inv!12 thiss!1793) e!231752)))

(declare-fun b!321631 () Bool)

(declare-fun array_inv!8459 (array!20458) Bool)

(assert (=> b!321631 (= e!231752 (array_inv!8459 (buf!8049 thiss!1793)))))

(assert (= start!71544 b!321631))

(declare-fun m!459983 () Bool)

(assert (=> start!71544 m!459983))

(declare-fun m!459985 () Bool)

(assert (=> b!321631 m!459985))

(push 1)

(assert (not start!71544))

(assert (not b!321631))

(check-sat)

(pop 1)

(push 1)

(check-sat)

