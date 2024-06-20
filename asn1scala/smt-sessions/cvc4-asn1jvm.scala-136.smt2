; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3250 () Bool)

(assert start!3250)

(declare-fun nBytes!1 () (_ BitVec 32))

(declare-datatypes ((array!823 0))(
  ( (array!824 (arr!780 (Array (_ BitVec 32) (_ BitVec 8))) (size!351 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!662 0))(
  ( (BitStream!663 (buf!702 array!823) (currentByte!1843 (_ BitVec 32)) (currentBit!1838 (_ BitVec 32))) )
))
(declare-fun thiss!1862 () BitStream!662)

(assert (=> start!3250 (and (bvsge nBytes!1 #b00000000000000000000000000000000) (or (bvsgt ((_ sign_extend 32) (size!351 (buf!702 thiss!1862))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!1843 thiss!1862)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!1838 thiss!1862)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!3250 true))

(declare-fun e!9062 () Bool)

(declare-fun inv!12 (BitStream!662) Bool)

(assert (=> start!3250 (and (inv!12 thiss!1862) e!9062)))

(declare-fun b!14588 () Bool)

(declare-fun array_inv!340 (array!823) Bool)

(assert (=> b!14588 (= e!9062 (array_inv!340 (buf!702 thiss!1862)))))

(assert (= start!3250 b!14588))

(declare-fun m!21015 () Bool)

(assert (=> start!3250 m!21015))

(declare-fun m!21017 () Bool)

(assert (=> b!14588 m!21017))

(push 1)

(assert (not b!14588))

(assert (not start!3250))

(check-sat)

(pop 1)

(push 1)

(check-sat)

