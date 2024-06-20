; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46158 () Bool)

(assert start!46158)

(declare-fun res!186837 () Bool)

(declare-fun e!151215 () Bool)

(assert (=> start!46158 (=> (not res!186837) (not e!151215))))

(declare-datatypes ((array!10858 0))(
  ( (array!10859 (arr!5695 (Array (_ BitVec 32) (_ BitVec 8))) (size!4765 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8638 0))(
  ( (BitStream!8639 (buf!5312 array!10858) (currentByte!9972 (_ BitVec 32)) (currentBit!9967 (_ BitVec 32))) )
))
(declare-fun thiss!1888 () BitStream!8638)

(declare-fun arr!318 () array!10858)

(declare-fun to!537 () (_ BitVec 32))

(declare-fun i!769 () (_ BitVec 32))

(assert (=> start!46158 (= res!186837 (and (bvsle #b00000000000000000000000000000000 i!769) (bvsle i!769 to!537) (bvsle to!537 (size!4765 arr!318)) (bvsle ((_ sign_extend 32) (size!4765 (buf!5312 thiss!1888))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!9972 thiss!1888)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!9967 thiss!1888)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!4765 (buf!5312 thiss!1888))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!9972 thiss!1888)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!9967 thiss!1888)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!46158 e!151215))

(assert (=> start!46158 true))

(declare-fun array_inv!4506 (array!10858) Bool)

(assert (=> start!46158 (array_inv!4506 arr!318)))

(declare-fun e!151214 () Bool)

(declare-fun inv!12 (BitStream!8638) Bool)

(assert (=> start!46158 (and (inv!12 thiss!1888) e!151214)))

(declare-fun b!222512 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!222512 (= e!151215 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!9967 thiss!1888))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!9972 thiss!1888))) ((_ extract 31 0) ((_ sign_extend 32) (size!4765 (buf!5312 thiss!1888)))))))))

(declare-fun b!222513 () Bool)

(assert (=> b!222513 (= e!151214 (array_inv!4506 (buf!5312 thiss!1888)))))

(assert (= (and start!46158 res!186837) b!222512))

(assert (= start!46158 b!222513))

(declare-fun m!340769 () Bool)

(assert (=> start!46158 m!340769))

(declare-fun m!340771 () Bool)

(assert (=> start!46158 m!340771))

(declare-fun m!340773 () Bool)

(assert (=> b!222512 m!340773))

(declare-fun m!340775 () Bool)

(assert (=> b!222513 m!340775))

(push 1)

(assert (not b!222513))

(assert (not start!46158))

(assert (not b!222512))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!75303 () Bool)

(assert (=> d!75303 (= (array_inv!4506 (buf!5312 thiss!1888)) (bvsge (size!4765 (buf!5312 thiss!1888)) #b00000000000000000000000000000000))))

(assert (=> b!222513 d!75303))

(push 1)

(check-sat)

