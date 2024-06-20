; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15720 () Bool)

(assert start!15720)

(declare-fun nBits!516 () (_ BitVec 64))

(declare-datatypes ((array!3403 0))(
  ( (array!3404 (arr!2172 (Array (_ BitVec 32) (_ BitVec 8))) (size!1571 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2704 0))(
  ( (BitStream!2705 (buf!1961 array!3403) (currentByte!3838 (_ BitVec 32)) (currentBit!3833 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2704)

(assert (=> start!15720 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle ((_ sign_extend 32) (size!1571 (buf!1961 thiss!1716))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!3838 thiss!1716)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!3833 thiss!1716)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!1571 (buf!1961 thiss!1716))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!3838 thiss!1716)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!3833 thiss!1716)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!15720 true))

(declare-fun e!52205 () Bool)

(declare-fun inv!12 (BitStream!2704) Bool)

(assert (=> start!15720 (and (inv!12 thiss!1716) e!52205)))

(declare-fun b!79500 () Bool)

(declare-fun array_inv!1417 (array!3403) Bool)

(assert (=> b!79500 (= e!52205 (array_inv!1417 (buf!1961 thiss!1716)))))

(assert (= start!15720 b!79500))

(declare-fun m!124911 () Bool)

(assert (=> start!15720 m!124911))

(declare-fun m!124913 () Bool)

(assert (=> b!79500 m!124913))

(push 1)

(assert (not b!79500))

(assert (not start!15720))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

