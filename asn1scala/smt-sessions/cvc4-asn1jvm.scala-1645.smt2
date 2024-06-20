; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46052 () Bool)

(assert start!46052)

(declare-datatypes ((array!10808 0))(
  ( (array!10809 (arr!5676 (Array (_ BitVec 32) (_ BitVec 8))) (size!4746 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8600 0))(
  ( (BitStream!8601 (buf!5293 array!10808) (currentByte!9944 (_ BitVec 32)) (currentBit!9939 (_ BitVec 32))) )
))
(declare-fun thiss!1933 () BitStream!8600)

(assert (=> start!46052 (or (bvsgt ((_ sign_extend 32) (size!4746 (buf!5293 thiss!1933))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!9944 thiss!1933)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!9939 thiss!1933)) #b0000000000000000000000000000000001111111111111111111111111111111))))

(declare-fun e!151060 () Bool)

(declare-fun inv!12 (BitStream!8600) Bool)

(assert (=> start!46052 (and (inv!12 thiss!1933) e!151060)))

(declare-fun b!222426 () Bool)

(declare-fun array_inv!4487 (array!10808) Bool)

(assert (=> b!222426 (= e!151060 (array_inv!4487 (buf!5293 thiss!1933)))))

(assert (= start!46052 b!222426))

(declare-fun m!340649 () Bool)

(assert (=> start!46052 m!340649))

(declare-fun m!340651 () Bool)

(assert (=> b!222426 m!340651))

(push 1)

(assert (not start!46052))

(assert (not b!222426))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

