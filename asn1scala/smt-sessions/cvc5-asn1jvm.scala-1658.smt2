; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46214 () Bool)

(assert start!46214)

(declare-fun b!222570 () Bool)

(declare-fun res!186859 () Bool)

(declare-fun e!151351 () Bool)

(assert (=> b!222570 (=> (not res!186859) (not e!151351))))

(declare-datatypes ((array!10893 0))(
  ( (array!10894 (arr!5710 (Array (_ BitVec 32) (_ BitVec 8))) (size!4780 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8662 0))(
  ( (BitStream!8663 (buf!5324 array!10893) (currentByte!9988 (_ BitVec 32)) (currentBit!9983 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8662)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!222570 (= res!186859 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4780 (buf!5324 thiss!1870))) ((_ sign_extend 32) (currentByte!9988 thiss!1870)) ((_ sign_extend 32) (currentBit!9983 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun res!186861 () Bool)

(assert (=> start!46214 (=> (not res!186861) (not e!151351))))

(declare-fun arr!308 () array!10893)

(assert (=> start!46214 (= res!186861 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4780 arr!308))))))

(assert (=> start!46214 e!151351))

(assert (=> start!46214 true))

(declare-fun array_inv!4521 (array!10893) Bool)

(assert (=> start!46214 (array_inv!4521 arr!308)))

(declare-fun e!151349 () Bool)

(declare-fun inv!12 (BitStream!8662) Bool)

(assert (=> start!46214 (and (inv!12 thiss!1870) e!151349)))

(declare-fun b!222573 () Bool)

(assert (=> b!222573 (= e!151349 (array_inv!4521 (buf!5324 thiss!1870)))))

(declare-fun b!222571 () Bool)

(declare-fun res!186860 () Bool)

(assert (=> b!222571 (=> (not res!186860) (not e!151351))))

(assert (=> b!222571 (= res!186860 (bvslt i!761 to!496))))

(declare-fun b!222572 () Bool)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!222572 (= e!151351 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4780 (buf!5324 thiss!1870))) ((_ sign_extend 32) (currentByte!9988 thiss!1870)) ((_ sign_extend 32) (currentBit!9983 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and start!46214 res!186861) b!222570))

(assert (= (and b!222570 res!186859) b!222571))

(assert (= (and b!222571 res!186860) b!222572))

(assert (= start!46214 b!222573))

(declare-fun m!340867 () Bool)

(assert (=> b!222570 m!340867))

(declare-fun m!340869 () Bool)

(assert (=> start!46214 m!340869))

(declare-fun m!340871 () Bool)

(assert (=> start!46214 m!340871))

(declare-fun m!340873 () Bool)

(assert (=> b!222573 m!340873))

(declare-fun m!340875 () Bool)

(assert (=> b!222572 m!340875))

(push 1)

(assert (not b!222572))

(assert (not start!46214))

(assert (not b!222573))

(assert (not b!222570))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!75343 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!75343 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4780 (buf!5324 thiss!1870))) ((_ sign_extend 32) (currentByte!9988 thiss!1870)) ((_ sign_extend 32) (currentBit!9983 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4780 (buf!5324 thiss!1870))) ((_ sign_extend 32) (currentByte!9988 thiss!1870)) ((_ sign_extend 32) (currentBit!9983 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!18378 () Bool)

(assert (= bs!18378 d!75343))

(declare-fun m!340899 () Bool)

(assert (=> bs!18378 m!340899))

(assert (=> b!222572 d!75343))

(declare-fun d!75347 () Bool)

(assert (=> d!75347 (= (array_inv!4521 arr!308) (bvsge (size!4780 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!46214 d!75347))

(declare-fun d!75351 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!75351 (= (inv!12 thiss!1870) (invariant!0 (currentBit!9983 thiss!1870) (currentByte!9988 thiss!1870) (size!4780 (buf!5324 thiss!1870))))))

(declare-fun bs!18380 () Bool)

(assert (= bs!18380 d!75351))

(declare-fun m!340903 () Bool)

(assert (=> bs!18380 m!340903))

(assert (=> start!46214 d!75351))

(declare-fun d!75355 () Bool)

(assert (=> d!75355 (= (array_inv!4521 (buf!5324 thiss!1870)) (bvsge (size!4780 (buf!5324 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!222573 d!75355))

(declare-fun d!75357 () Bool)

(assert (=> d!75357 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4780 (buf!5324 thiss!1870))) ((_ sign_extend 32) (currentByte!9988 thiss!1870)) ((_ sign_extend 32) (currentBit!9983 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4780 (buf!5324 thiss!1870))) ((_ sign_extend 32) (currentByte!9988 thiss!1870)) ((_ sign_extend 32) (currentBit!9983 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18381 () Bool)

(assert (= bs!18381 d!75357))

(assert (=> bs!18381 m!340899))

(assert (=> b!222570 d!75357))

(push 1)

(assert (not d!75351))

(assert (not d!75343))

(assert (not d!75357))

(check-sat)

(pop 1)

(push 1)

(check-sat)

