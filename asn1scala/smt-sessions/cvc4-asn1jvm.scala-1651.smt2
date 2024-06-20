; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46138 () Bool)

(assert start!46138)

(declare-datatypes ((array!10847 0))(
  ( (array!10848 (arr!5691 (Array (_ BitVec 32) (_ BitVec 8))) (size!4761 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8630 0))(
  ( (BitStream!8631 (buf!5308 array!10847) (currentByte!9967 (_ BitVec 32)) (currentBit!9962 (_ BitVec 32))) )
))
(declare-fun thiss!1888 () BitStream!8630)

(declare-fun arr!318 () array!10847)

(declare-fun to!537 () (_ BitVec 32))

(declare-fun i!769 () (_ BitVec 32))

(assert (=> start!46138 (and (bvsle #b00000000000000000000000000000000 i!769) (bvsle i!769 to!537) (bvsle to!537 (size!4761 arr!318)) (or (bvsgt ((_ sign_extend 32) (size!4761 (buf!5308 thiss!1888))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!9967 thiss!1888)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!9962 thiss!1888)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!46138 true))

(declare-fun array_inv!4502 (array!10847) Bool)

(assert (=> start!46138 (array_inv!4502 arr!318)))

(declare-fun e!151177 () Bool)

(declare-fun inv!12 (BitStream!8630) Bool)

(assert (=> start!46138 (and (inv!12 thiss!1888) e!151177)))

(declare-fun b!222498 () Bool)

(assert (=> b!222498 (= e!151177 (array_inv!4502 (buf!5308 thiss!1888)))))

(assert (= start!46138 b!222498))

(declare-fun m!340741 () Bool)

(assert (=> start!46138 m!340741))

(declare-fun m!340743 () Bool)

(assert (=> start!46138 m!340743))

(declare-fun m!340745 () Bool)

(assert (=> b!222498 m!340745))

(push 1)

(assert (not start!46138))

(assert (not b!222498))

(check-sat)

(pop 1)

(push 1)

(check-sat)

