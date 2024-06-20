; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46082 () Bool)

(assert start!46082)

(declare-fun res!186816 () Bool)

(declare-fun e!151104 () Bool)

(assert (=> start!46082 (=> (not res!186816) (not e!151104))))

(declare-datatypes ((array!10823 0))(
  ( (array!10824 (arr!5682 (Array (_ BitVec 32) (_ BitVec 8))) (size!4752 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8612 0))(
  ( (BitStream!8613 (buf!5299 array!10823) (currentByte!9953 (_ BitVec 32)) (currentBit!9948 (_ BitVec 32))) )
))
(declare-fun thiss!1933 () BitStream!8612)

(assert (=> start!46082 (= res!186816 (and (bvsle ((_ sign_extend 32) (size!4752 (buf!5299 thiss!1933))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!9953 thiss!1933)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!9948 thiss!1933)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!4752 (buf!5299 thiss!1933))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!9953 thiss!1933)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!9948 thiss!1933)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!46082 e!151104))

(declare-fun e!151105 () Bool)

(declare-fun inv!12 (BitStream!8612) Bool)

(assert (=> start!46082 (and (inv!12 thiss!1933) e!151105)))

(declare-fun b!222452 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!222452 (= e!151104 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!9948 thiss!1933))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!9953 thiss!1933))) ((_ extract 31 0) ((_ sign_extend 32) (size!4752 (buf!5299 thiss!1933)))))))))

(declare-fun b!222453 () Bool)

(declare-fun array_inv!4493 (array!10823) Bool)

(assert (=> b!222453 (= e!151105 (array_inv!4493 (buf!5299 thiss!1933)))))

(assert (= (and start!46082 res!186816) b!222452))

(assert (= start!46082 b!222453))

(declare-fun m!340683 () Bool)

(assert (=> start!46082 m!340683))

(declare-fun m!340685 () Bool)

(assert (=> b!222452 m!340685))

(declare-fun m!340687 () Bool)

(assert (=> b!222453 m!340687))

(push 1)

(assert (not b!222452))

(assert (not b!222453))

(assert (not start!46082))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

