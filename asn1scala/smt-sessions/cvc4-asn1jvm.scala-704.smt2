; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19858 () Bool)

(assert start!19858)

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-datatypes ((array!4631 0))(
  ( (array!4632 (arr!2708 (Array (_ BitVec 32) (_ BitVec 8))) (size!2115 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3704 0))(
  ( (BitStream!3705 (buf!2472 array!4631) (currentByte!4908 (_ BitVec 32)) (currentBit!4903 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3704)

(assert (=> start!19858 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000) (or (bvsgt ((_ sign_extend 32) (size!2115 (buf!2472 thiss!1305))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4908 thiss!1305)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4903 thiss!1305)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!19858 true))

(declare-fun e!64781 () Bool)

(declare-fun inv!12 (BitStream!3704) Bool)

(assert (=> start!19858 (and (inv!12 thiss!1305) e!64781)))

(declare-fun b!99053 () Bool)

(declare-fun array_inv!1917 (array!4631) Bool)

(assert (=> b!99053 (= e!64781 (array_inv!1917 (buf!2472 thiss!1305)))))

(assert (= start!19858 b!99053))

(declare-fun m!144485 () Bool)

(assert (=> start!19858 m!144485))

(declare-fun m!144487 () Bool)

(assert (=> b!99053 m!144487))

(push 1)

(assert (not start!19858))

(assert (not b!99053))

(check-sat)

(pop 1)

(push 1)

(check-sat)

