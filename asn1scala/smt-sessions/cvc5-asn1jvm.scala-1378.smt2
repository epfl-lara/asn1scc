; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38102 () Bool)

(assert start!38102)

(declare-fun nBits!575 () (_ BitVec 32))

(declare-datatypes ((array!9159 0))(
  ( (array!9160 (arr!4978 (Array (_ BitVec 32) (_ BitVec 8))) (size!4048 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7204 0))(
  ( (BitStream!7205 (buf!4476 array!9159) (currentByte!8508 (_ BitVec 32)) (currentBit!8503 (_ BitVec 32))) )
))
(declare-fun thiss!1817 () BitStream!7204)

(assert (=> start!38102 (and (bvsge nBits!575 #b00000000000000000000000000000000) (bvsle nBits!575 #b00000000000000000000000001000000) (or (bvsgt ((_ sign_extend 32) (size!4048 (buf!4476 thiss!1817))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!8508 thiss!1817)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!8503 thiss!1817)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!38102 true))

(declare-fun e!119958 () Bool)

(declare-fun inv!12 (BitStream!7204) Bool)

(assert (=> start!38102 (and (inv!12 thiss!1817) e!119958)))

(declare-fun b!171723 () Bool)

(declare-fun array_inv!3789 (array!9159) Bool)

(assert (=> b!171723 (= e!119958 (array_inv!3789 (buf!4476 thiss!1817)))))

(assert (= start!38102 b!171723))

(declare-fun m!270967 () Bool)

(assert (=> start!38102 m!270967))

(declare-fun m!270969 () Bool)

(assert (=> b!171723 m!270969))

(push 1)

(assert (not start!38102))

(assert (not b!171723))

(check-sat)

(pop 1)

(push 1)

(check-sat)

