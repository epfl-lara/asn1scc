; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46048 () Bool)

(assert start!46048)

(declare-datatypes ((array!10804 0))(
  ( (array!10805 (arr!5674 (Array (_ BitVec 32) (_ BitVec 8))) (size!4744 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8596 0))(
  ( (BitStream!8597 (buf!5291 array!10804) (currentByte!9942 (_ BitVec 32)) (currentBit!9937 (_ BitVec 32))) )
))
(declare-fun thiss!1933 () BitStream!8596)

(assert (=> start!46048 (or (bvsgt ((_ sign_extend 32) (size!4744 (buf!5291 thiss!1933))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!9942 thiss!1933)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!9937 thiss!1933)) #b0000000000000000000000000000000001111111111111111111111111111111))))

(declare-fun e!151048 () Bool)

(declare-fun inv!12 (BitStream!8596) Bool)

(assert (=> start!46048 (and (inv!12 thiss!1933) e!151048)))

(declare-fun b!222420 () Bool)

(declare-fun array_inv!4485 (array!10804) Bool)

(assert (=> b!222420 (= e!151048 (array_inv!4485 (buf!5291 thiss!1933)))))

(assert (= start!46048 b!222420))

(declare-fun m!340641 () Bool)

(assert (=> start!46048 m!340641))

(declare-fun m!340643 () Bool)

(assert (=> b!222420 m!340643))

(push 1)

(assert (not start!46048))

(assert (not b!222420))

(check-sat)

(pop 1)

(push 1)

(check-sat)

