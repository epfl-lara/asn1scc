; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17516 () Bool)

(assert start!17516)

(declare-fun res!69319 () Bool)

(declare-fun e!56434 () Bool)

(assert (=> start!17516 (=> (not res!69319) (not e!56434))))

(declare-fun nBits!333 () (_ BitVec 32))

(assert (=> start!17516 (= res!69319 (and (bvsge nBits!333 #b00000000000000000000000000000000) (bvsle nBits!333 #b00000000000000000000000001000000)))))

(assert (=> start!17516 e!56434))

(assert (=> start!17516 true))

(declare-datatypes ((array!4006 0))(
  ( (array!4007 (arr!2450 (Array (_ BitVec 32) (_ BitVec 8))) (size!1813 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3188 0))(
  ( (BitStream!3189 (buf!2203 array!4006) (currentByte!4367 (_ BitVec 32)) (currentBit!4362 (_ BitVec 32))) )
))
(declare-fun thiss!1136 () BitStream!3188)

(declare-fun e!56436 () Bool)

(declare-fun inv!12 (BitStream!3188) Bool)

(assert (=> start!17516 (and (inv!12 thiss!1136) e!56436)))

(declare-fun b!84470 () Bool)

(declare-fun res!69318 () Bool)

(assert (=> b!84470 (=> (not res!69318) (not e!56434))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!84470 (= res!69318 (validate_offset_bits!1 ((_ sign_extend 32) (size!1813 (buf!2203 thiss!1136))) ((_ sign_extend 32) (currentByte!4367 thiss!1136)) ((_ sign_extend 32) (currentBit!4362 thiss!1136)) ((_ sign_extend 32) nBits!333)))))

(declare-fun b!84471 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!84471 (= e!56434 (not (invariant!0 (currentBit!4362 thiss!1136) (currentByte!4367 thiss!1136) (size!1813 (buf!2203 thiss!1136)))))))

(declare-fun b!84472 () Bool)

(declare-fun array_inv!1659 (array!4006) Bool)

(assert (=> b!84472 (= e!56436 (array_inv!1659 (buf!2203 thiss!1136)))))

(assert (= (and start!17516 res!69319) b!84470))

(assert (= (and b!84470 res!69318) b!84471))

(assert (= start!17516 b!84472))

(declare-fun m!131037 () Bool)

(assert (=> start!17516 m!131037))

(declare-fun m!131039 () Bool)

(assert (=> b!84470 m!131039))

(declare-fun m!131041 () Bool)

(assert (=> b!84471 m!131041))

(declare-fun m!131043 () Bool)

(assert (=> b!84472 m!131043))

(push 1)

(assert (not b!84470))

(assert (not start!17516))

(assert (not b!84471))

(assert (not b!84472))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!27148 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!27148 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1813 (buf!2203 thiss!1136))) ((_ sign_extend 32) (currentByte!4367 thiss!1136)) ((_ sign_extend 32) (currentBit!4362 thiss!1136)) ((_ sign_extend 32) nBits!333)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1813 (buf!2203 thiss!1136))) ((_ sign_extend 32) (currentByte!4367 thiss!1136)) ((_ sign_extend 32) (currentBit!4362 thiss!1136))) ((_ sign_extend 32) nBits!333)))))

(declare-fun bs!6719 () Bool)

(assert (= bs!6719 d!27148))

(declare-fun m!131045 () Bool)

(assert (=> bs!6719 m!131045))

(assert (=> b!84470 d!27148))

(declare-fun d!27154 () Bool)

(assert (=> d!27154 (= (inv!12 thiss!1136) (invariant!0 (currentBit!4362 thiss!1136) (currentByte!4367 thiss!1136) (size!1813 (buf!2203 thiss!1136))))))

(declare-fun bs!6721 () Bool)

(assert (= bs!6721 d!27154))

(assert (=> bs!6721 m!131041))

(assert (=> start!17516 d!27154))

(declare-fun d!27162 () Bool)

