; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19864 () Bool)

(assert start!19864)

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-datatypes ((array!4637 0))(
  ( (array!4638 (arr!2711 (Array (_ BitVec 32) (_ BitVec 8))) (size!2118 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3710 0))(
  ( (BitStream!3711 (buf!2475 array!4637) (currentByte!4911 (_ BitVec 32)) (currentBit!4906 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3710)

(assert (=> start!19864 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!2118 (buf!2475 thiss!1305))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4911 thiss!1305)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4906 thiss!1305)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!2118 (buf!2475 thiss!1305))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!4911 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!4906 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!19864 true))

(declare-fun e!64799 () Bool)

(declare-fun inv!12 (BitStream!3710) Bool)

(assert (=> start!19864 (and (inv!12 thiss!1305) e!64799)))

(declare-fun b!99062 () Bool)

(declare-fun array_inv!1920 (array!4637) Bool)

(assert (=> b!99062 (= e!64799 (array_inv!1920 (buf!2475 thiss!1305)))))

(assert (= start!19864 b!99062))

(declare-fun m!144497 () Bool)

(assert (=> start!19864 m!144497))

(declare-fun m!144499 () Bool)

(assert (=> b!99062 m!144499))

(push 1)

(assert (not start!19864))

(assert (not b!99062))

(check-sat)

(pop 1)

(push 1)

(check-sat)

