; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46100 () Bool)

(assert start!46100)

(declare-fun res!186822 () Bool)

(declare-fun e!151115 () Bool)

(assert (=> start!46100 (=> (not res!186822) (not e!151115))))

(declare-datatypes ((array!10828 0))(
  ( (array!10829 (arr!5683 (Array (_ BitVec 32) (_ BitVec 8))) (size!4753 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8614 0))(
  ( (BitStream!8615 (buf!5300 array!10828) (currentByte!9957 (_ BitVec 32)) (currentBit!9952 (_ BitVec 32))) )
))
(declare-fun thiss!1933 () BitStream!8614)

(assert (=> start!46100 (= res!186822 (and (bvsle ((_ sign_extend 32) (size!4753 (buf!5300 thiss!1933))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!9957 thiss!1933)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!9952 thiss!1933)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!4753 (buf!5300 thiss!1933))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!9957 thiss!1933)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!9952 thiss!1933)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!46100 e!151115))

(declare-fun e!151114 () Bool)

(declare-fun inv!12 (BitStream!8614) Bool)

(assert (=> start!46100 (and (inv!12 thiss!1933) e!151114)))

(declare-fun b!222460 () Bool)

(declare-fun res!186821 () Bool)

(assert (=> b!222460 (=> (not res!186821) (not e!151115))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!222460 (= res!186821 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!9952 thiss!1933))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!9957 thiss!1933))) ((_ extract 31 0) ((_ sign_extend 32) (size!4753 (buf!5300 thiss!1933))))))))

(declare-fun b!222461 () Bool)

(assert (=> b!222461 (= e!151115 (bvslt ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!9952 thiss!1933)) #b00000000000000000000000000000111)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!222462 () Bool)

(declare-fun array_inv!4494 (array!10828) Bool)

(assert (=> b!222462 (= e!151114 (array_inv!4494 (buf!5300 thiss!1933)))))

(assert (= (and start!46100 res!186822) b!222460))

(assert (= (and b!222460 res!186821) b!222461))

(assert (= start!46100 b!222462))

(declare-fun m!340693 () Bool)

(assert (=> start!46100 m!340693))

(declare-fun m!340695 () Bool)

(assert (=> b!222460 m!340695))

(declare-fun m!340697 () Bool)

(assert (=> b!222462 m!340697))

(push 1)

(assert (not start!46100))

(assert (not b!222460))

