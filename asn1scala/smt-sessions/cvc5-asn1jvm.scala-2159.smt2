; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54824 () Bool)

(assert start!54824)

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(declare-datatypes ((array!13867 0))(
  ( (array!13868 (arr!7072 (Array (_ BitVec 32) (_ BitVec 8))) (size!6085 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11092 0))(
  ( (BitStream!11093 (buf!6607 array!13867) (currentByte!12093 (_ BitVec 32)) (currentBit!12088 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11092)

(assert (=> start!54824 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535) (or (bvsgt ((_ sign_extend 32) (size!6085 (buf!6607 thiss!1754))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!12093 thiss!1754)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!12088 thiss!1754)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!54824 true))

(declare-fun e!177900 () Bool)

(declare-fun inv!12 (BitStream!11092) Bool)

(assert (=> start!54824 (and (inv!12 thiss!1754) e!177900)))

(declare-fun b!256693 () Bool)

(declare-fun array_inv!5826 (array!13867) Bool)

(assert (=> b!256693 (= e!177900 (array_inv!5826 (buf!6607 thiss!1754)))))

(assert (= start!54824 b!256693))

(declare-fun m!386293 () Bool)

(assert (=> start!54824 m!386293))

(declare-fun m!386295 () Bool)

(assert (=> b!256693 m!386295))

(push 1)

(assert (not start!54824))

(assert (not b!256693))

(check-sat)

(pop 1)

(push 1)

(check-sat)

