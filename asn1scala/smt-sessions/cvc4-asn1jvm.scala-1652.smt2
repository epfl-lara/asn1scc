; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46144 () Bool)

(assert start!46144)

(declare-datatypes ((array!10853 0))(
  ( (array!10854 (arr!5694 (Array (_ BitVec 32) (_ BitVec 8))) (size!4764 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8636 0))(
  ( (BitStream!8637 (buf!5311 array!10853) (currentByte!9970 (_ BitVec 32)) (currentBit!9965 (_ BitVec 32))) )
))
(declare-fun thiss!1888 () BitStream!8636)

(declare-fun arr!318 () array!10853)

(declare-fun to!537 () (_ BitVec 32))

(declare-fun i!769 () (_ BitVec 32))

(assert (=> start!46144 (and (bvsle #b00000000000000000000000000000000 i!769) (bvsle i!769 to!537) (bvsle to!537 (size!4764 arr!318)) (bvsle ((_ sign_extend 32) (size!4764 (buf!5311 thiss!1888))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!9970 thiss!1888)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!9965 thiss!1888)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!4764 (buf!5311 thiss!1888))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!9970 thiss!1888)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!9965 thiss!1888)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!46144 true))

(declare-fun array_inv!4505 (array!10853) Bool)

(assert (=> start!46144 (array_inv!4505 arr!318)))

(declare-fun e!151204 () Bool)

(declare-fun inv!12 (BitStream!8636) Bool)

(assert (=> start!46144 (and (inv!12 thiss!1888) e!151204)))

(declare-fun b!222507 () Bool)

(assert (=> b!222507 (= e!151204 (array_inv!4505 (buf!5311 thiss!1888)))))

(assert (= start!46144 b!222507))

(declare-fun m!340759 () Bool)

(assert (=> start!46144 m!340759))

(declare-fun m!340761 () Bool)

(assert (=> start!46144 m!340761))

(declare-fun m!340763 () Bool)

(assert (=> b!222507 m!340763))

(push 1)

(assert (not b!222507))

(assert (not start!46144))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

