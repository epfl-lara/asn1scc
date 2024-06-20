; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15718 () Bool)

(assert start!15718)

(declare-fun nBits!516 () (_ BitVec 64))

(declare-datatypes ((array!3401 0))(
  ( (array!3402 (arr!2171 (Array (_ BitVec 32) (_ BitVec 8))) (size!1570 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2702 0))(
  ( (BitStream!2703 (buf!1960 array!3401) (currentByte!3837 (_ BitVec 32)) (currentBit!3832 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2702)

(assert (=> start!15718 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000) (or (bvsgt ((_ sign_extend 32) (size!1570 (buf!1960 thiss!1716))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!3837 thiss!1716)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!3832 thiss!1716)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!15718 true))

(declare-fun e!52199 () Bool)

(declare-fun inv!12 (BitStream!2702) Bool)

(assert (=> start!15718 (and (inv!12 thiss!1716) e!52199)))

(declare-fun b!79497 () Bool)

(declare-fun array_inv!1416 (array!3401) Bool)

(assert (=> b!79497 (= e!52199 (array_inv!1416 (buf!1960 thiss!1716)))))

(assert (= start!15718 b!79497))

(declare-fun m!124907 () Bool)

(assert (=> start!15718 m!124907))

(declare-fun m!124909 () Bool)

(assert (=> b!79497 m!124909))

(push 1)

(assert (not b!79497))

(assert (not start!15718))

(check-sat)

(pop 1)

(push 1)

(check-sat)

