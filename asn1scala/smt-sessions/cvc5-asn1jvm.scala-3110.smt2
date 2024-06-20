; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71540 () Bool)

(assert start!71540)

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-datatypes ((array!20454 0))(
  ( (array!20455 (arr!9997 (Array (_ BitVec 32) (_ BitVec 8))) (size!8905 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13972 0))(
  ( (BitStream!13973 (buf!8047 array!20454) (currentByte!14844 (_ BitVec 32)) (currentBit!14839 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!13972)

(assert (=> start!71540 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000) (or (bvsgt ((_ sign_extend 32) (size!8905 (buf!8047 thiss!1793))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!14844 thiss!1793)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!14839 thiss!1793)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!71540 true))

(declare-fun e!231740 () Bool)

(declare-fun inv!12 (BitStream!13972) Bool)

(assert (=> start!71540 (and (inv!12 thiss!1793) e!231740)))

(declare-fun b!321625 () Bool)

(declare-fun array_inv!8457 (array!20454) Bool)

(assert (=> b!321625 (= e!231740 (array_inv!8457 (buf!8047 thiss!1793)))))

(assert (= start!71540 b!321625))

(declare-fun m!459975 () Bool)

(assert (=> start!71540 m!459975))

(declare-fun m!459977 () Bool)

(assert (=> b!321625 m!459977))

(push 1)

(assert (not b!321625))

(assert (not start!71540))

(check-sat)

(pop 1)

(push 1)

(check-sat)

