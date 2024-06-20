; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128 () Bool)

(assert start!128)

(declare-datatypes ((array!52 0))(
  ( (array!53 (arr!408 (Array (_ BitVec 32) (_ BitVec 8))) (size!21 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!26 0))(
  ( (BitStream!27 (buf!333 array!52) (currentByte!1225 (_ BitVec 32)) (currentBit!1220 (_ BitVec 32))) )
))
(declare-fun thiss!932 () BitStream!26)

(assert (=> start!128 (or (bvsgt ((_ sign_extend 32) (size!21 (buf!333 thiss!932))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!1225 thiss!932)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!1220 thiss!932)) #b0000000000000000000000000000000001111111111111111111111111111111))))

(declare-fun e!124 () Bool)

(declare-fun inv!12 (BitStream!26) Bool)

(assert (=> start!128 (and (inv!12 thiss!932) e!124)))

(declare-fun b!385 () Bool)

(declare-fun array_inv!18 (array!52) Bool)

(assert (=> b!385 (= e!124 (array_inv!18 (buf!333 thiss!932)))))

(assert (= start!128 b!385))

(declare-fun m!129 () Bool)

(assert (=> start!128 m!129))

(declare-fun m!131 () Bool)

(assert (=> b!385 m!131))

(push 1)

(assert (not start!128))

(assert (not b!385))

(check-sat)

(pop 1)

(push 1)

(check-sat)

