; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46134 () Bool)

(assert start!46134)

(declare-datatypes ((array!10843 0))(
  ( (array!10844 (arr!5689 (Array (_ BitVec 32) (_ BitVec 8))) (size!4759 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8626 0))(
  ( (BitStream!8627 (buf!5306 array!10843) (currentByte!9965 (_ BitVec 32)) (currentBit!9960 (_ BitVec 32))) )
))
(declare-fun thiss!1888 () BitStream!8626)

(declare-fun arr!318 () array!10843)

(declare-fun to!537 () (_ BitVec 32))

(declare-fun i!769 () (_ BitVec 32))

(assert (=> start!46134 (and (bvsle #b00000000000000000000000000000000 i!769) (bvsle i!769 to!537) (bvsle to!537 (size!4759 arr!318)) (or (bvsgt ((_ sign_extend 32) (size!4759 (buf!5306 thiss!1888))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!9965 thiss!1888)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!9960 thiss!1888)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!46134 true))

(declare-fun array_inv!4500 (array!10843) Bool)

(assert (=> start!46134 (array_inv!4500 arr!318)))

(declare-fun e!151159 () Bool)

(declare-fun inv!12 (BitStream!8626) Bool)

(assert (=> start!46134 (and (inv!12 thiss!1888) e!151159)))

(declare-fun b!222492 () Bool)

(assert (=> b!222492 (= e!151159 (array_inv!4500 (buf!5306 thiss!1888)))))

(assert (= start!46134 b!222492))

(declare-fun m!340729 () Bool)

(assert (=> start!46134 m!340729))

(declare-fun m!340731 () Bool)

(assert (=> start!46134 m!340731))

(declare-fun m!340733 () Bool)

(assert (=> b!222492 m!340733))

(push 1)

(assert (not b!222492))

(assert (not start!46134))

(check-sat)

(pop 1)

(push 1)

(check-sat)

