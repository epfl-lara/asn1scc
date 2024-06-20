; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46216 () Bool)

(assert start!46216)

(declare-fun res!186868 () Bool)

(declare-fun e!151362 () Bool)

(assert (=> start!46216 (=> (not res!186868) (not e!151362))))

(declare-datatypes ((array!10895 0))(
  ( (array!10896 (arr!5711 (Array (_ BitVec 32) (_ BitVec 8))) (size!4781 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!10895)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!46216 (= res!186868 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4781 arr!308))))))

(assert (=> start!46216 e!151362))

(assert (=> start!46216 true))

(declare-fun array_inv!4522 (array!10895) Bool)

(assert (=> start!46216 (array_inv!4522 arr!308)))

(declare-datatypes ((BitStream!8664 0))(
  ( (BitStream!8665 (buf!5325 array!10895) (currentByte!9989 (_ BitVec 32)) (currentBit!9984 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8664)

(declare-fun e!151363 () Bool)

(declare-fun inv!12 (BitStream!8664) Bool)

(assert (=> start!46216 (and (inv!12 thiss!1870) e!151363)))

(declare-fun b!222585 () Bool)

(assert (=> b!222585 (= e!151363 (array_inv!4522 (buf!5325 thiss!1870)))))

(declare-fun b!222584 () Bool)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!222584 (= e!151362 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4781 (buf!5325 thiss!1870))) ((_ sign_extend 32) (currentByte!9989 thiss!1870)) ((_ sign_extend 32) (currentBit!9984 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!222582 () Bool)

(declare-fun res!186870 () Bool)

(assert (=> b!222582 (=> (not res!186870) (not e!151362))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!222582 (= res!186870 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4781 (buf!5325 thiss!1870))) ((_ sign_extend 32) (currentByte!9989 thiss!1870)) ((_ sign_extend 32) (currentBit!9984 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!222583 () Bool)

(declare-fun res!186869 () Bool)

(assert (=> b!222583 (=> (not res!186869) (not e!151362))))

(assert (=> b!222583 (= res!186869 (bvslt i!761 to!496))))

(assert (= (and start!46216 res!186868) b!222582))

(assert (= (and b!222582 res!186870) b!222583))

(assert (= (and b!222583 res!186869) b!222584))

(assert (= start!46216 b!222585))

(declare-fun m!340877 () Bool)

(assert (=> start!46216 m!340877))

(declare-fun m!340879 () Bool)

(assert (=> start!46216 m!340879))

(declare-fun m!340881 () Bool)

(assert (=> b!222585 m!340881))

(declare-fun m!340883 () Bool)

(assert (=> b!222584 m!340883))

(declare-fun m!340885 () Bool)

(assert (=> b!222582 m!340885))

(check-sat (not b!222582) (not b!222584) (not start!46216) (not b!222585))
(check-sat)
(get-model)

(declare-fun d!75339 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!75339 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4781 (buf!5325 thiss!1870))) ((_ sign_extend 32) (currentByte!9989 thiss!1870)) ((_ sign_extend 32) (currentBit!9984 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4781 (buf!5325 thiss!1870))) ((_ sign_extend 32) (currentByte!9989 thiss!1870)) ((_ sign_extend 32) (currentBit!9984 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18376 () Bool)

(assert (= bs!18376 d!75339))

(declare-fun m!340897 () Bool)

(assert (=> bs!18376 m!340897))

(assert (=> b!222582 d!75339))

(declare-fun d!75341 () Bool)

(assert (=> d!75341 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4781 (buf!5325 thiss!1870))) ((_ sign_extend 32) (currentByte!9989 thiss!1870)) ((_ sign_extend 32) (currentBit!9984 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4781 (buf!5325 thiss!1870))) ((_ sign_extend 32) (currentByte!9989 thiss!1870)) ((_ sign_extend 32) (currentBit!9984 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!18377 () Bool)

(assert (= bs!18377 d!75341))

(assert (=> bs!18377 m!340897))

(assert (=> b!222584 d!75341))

(declare-fun d!75345 () Bool)

(assert (=> d!75345 (= (array_inv!4522 arr!308) (bvsge (size!4781 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!46216 d!75345))

(declare-fun d!75349 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!75349 (= (inv!12 thiss!1870) (invariant!0 (currentBit!9984 thiss!1870) (currentByte!9989 thiss!1870) (size!4781 (buf!5325 thiss!1870))))))

(declare-fun bs!18379 () Bool)

(assert (= bs!18379 d!75349))

(declare-fun m!340901 () Bool)

(assert (=> bs!18379 m!340901))

(assert (=> start!46216 d!75349))

(declare-fun d!75353 () Bool)

(assert (=> d!75353 (= (array_inv!4522 (buf!5325 thiss!1870)) (bvsge (size!4781 (buf!5325 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!222585 d!75353))

(check-sat (not d!75341) (not d!75339) (not d!75349))
(check-sat)
