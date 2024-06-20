; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46162 () Bool)

(assert start!46162)

(declare-fun res!186843 () Bool)

(declare-fun e!151240 () Bool)

(assert (=> start!46162 (=> (not res!186843) (not e!151240))))

(declare-datatypes ((array!10862 0))(
  ( (array!10863 (arr!5697 (Array (_ BitVec 32) (_ BitVec 8))) (size!4767 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8642 0))(
  ( (BitStream!8643 (buf!5314 array!10862) (currentByte!9974 (_ BitVec 32)) (currentBit!9969 (_ BitVec 32))) )
))
(declare-fun thiss!1888 () BitStream!8642)

(declare-fun to!537 () (_ BitVec 32))

(declare-fun i!769 () (_ BitVec 32))

(declare-fun arr!318 () array!10862)

(assert (=> start!46162 (= res!186843 (and (bvsle #b00000000000000000000000000000000 i!769) (bvsle i!769 to!537) (bvsle to!537 (size!4767 arr!318)) (bvsle ((_ sign_extend 32) (size!4767 (buf!5314 thiss!1888))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!9974 thiss!1888)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!9969 thiss!1888)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!4767 (buf!5314 thiss!1888))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!9974 thiss!1888)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!9969 thiss!1888)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!46162 e!151240))

(assert (=> start!46162 true))

(declare-fun array_inv!4508 (array!10862) Bool)

(assert (=> start!46162 (array_inv!4508 arr!318)))

(declare-fun e!151238 () Bool)

(declare-fun inv!12 (BitStream!8642) Bool)

(assert (=> start!46162 (and (inv!12 thiss!1888) e!151238)))

(declare-fun b!222524 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!222524 (= e!151240 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!9969 thiss!1888))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!9974 thiss!1888))) ((_ extract 31 0) ((_ sign_extend 32) (size!4767 (buf!5314 thiss!1888)))))))))

(declare-fun b!222525 () Bool)

(assert (=> b!222525 (= e!151238 (array_inv!4508 (buf!5314 thiss!1888)))))

(assert (= (and start!46162 res!186843) b!222524))

(assert (= start!46162 b!222525))

(declare-fun m!340785 () Bool)

(assert (=> start!46162 m!340785))

(declare-fun m!340787 () Bool)

(assert (=> start!46162 m!340787))

(declare-fun m!340789 () Bool)

(assert (=> b!222524 m!340789))

(declare-fun m!340791 () Bool)

(assert (=> b!222525 m!340791))

(push 1)

(assert (not b!222524))

(assert (not b!222525))

(assert (not start!46162))

(check-sat)

(pop 1)

(push 1)

(check-sat)

