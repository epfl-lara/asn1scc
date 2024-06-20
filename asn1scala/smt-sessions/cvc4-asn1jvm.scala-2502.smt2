; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63310 () Bool)

(assert start!63310)

(declare-fun res!235055 () Bool)

(declare-fun e!202501 () Bool)

(assert (=> start!63310 (=> (not res!235055) (not e!202501))))

(declare-datatypes ((array!16466 0))(
  ( (array!16467 (arr!8109 (Array (_ BitVec 32) (_ BitVec 8))) (size!7113 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12596 0))(
  ( (BitStream!12597 (buf!7359 array!16466) (currentByte!13628 (_ BitVec 32)) (currentBit!13623 (_ BitVec 32))) )
))
(declare-fun thiss!1939 () BitStream!12596)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!63310 (= res!235055 (validate_offset_bits!1 ((_ sign_extend 32) (size!7113 (buf!7359 thiss!1939))) ((_ sign_extend 32) (currentByte!13628 thiss!1939)) ((_ sign_extend 32) (currentBit!13623 thiss!1939)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000010000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!13628 thiss!1939) #b00000000000000000000000000000001)) (currentBit!13623 thiss!1939))) #b00000000000000000000000000001111))))))

(assert (=> start!63310 e!202501))

(declare-fun e!202502 () Bool)

(declare-fun inv!12 (BitStream!12596) Bool)

(assert (=> start!63310 (and (inv!12 thiss!1939) e!202502)))

(declare-fun b!283610 () Bool)

(assert (=> b!283610 (= e!202501 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!7113 (buf!7359 thiss!1939))) ((_ sign_extend 32) (currentByte!13628 thiss!1939)) ((_ sign_extend 32) (currentBit!13623 thiss!1939)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13623 thiss!1939)) #b00000000000000000000000000000111)))))))

(declare-fun b!283611 () Bool)

(declare-fun array_inv!6806 (array!16466) Bool)

(assert (=> b!283611 (= e!202502 (array_inv!6806 (buf!7359 thiss!1939)))))

(assert (= (and start!63310 res!235055) b!283610))

(assert (= start!63310 b!283611))

(declare-fun m!416639 () Bool)

(assert (=> start!63310 m!416639))

(declare-fun m!416641 () Bool)

(assert (=> start!63310 m!416641))

(declare-fun m!416643 () Bool)

(assert (=> b!283610 m!416643))

(declare-fun m!416645 () Bool)

(assert (=> b!283611 m!416645))

(push 1)

(assert (not start!63310))

(assert (not b!283610))

(assert (not b!283611))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97308 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!97308 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7113 (buf!7359 thiss!1939))) ((_ sign_extend 32) (currentByte!13628 thiss!1939)) ((_ sign_extend 32) (currentBit!13623 thiss!1939)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000010000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!13628 thiss!1939) #b00000000000000000000000000000001)) (currentBit!13623 thiss!1939))) #b00000000000000000000000000001111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7113 (buf!7359 thiss!1939))) ((_ sign_extend 32) (currentByte!13628 thiss!1939)) ((_ sign_extend 32) (currentBit!13623 thiss!1939))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000010000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!13628 thiss!1939) #b00000000000000000000000000000001)) (currentBit!13623 thiss!1939))) #b00000000000000000000000000001111))))))

(declare-fun bs!24556 () Bool)

(assert (= bs!24556 d!97308))

(declare-fun m!416653 () Bool)

(assert (=> bs!24556 m!416653))

(assert (=> start!63310 d!97308))

(declare-fun d!97314 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!97314 (= (inv!12 thiss!1939) (invariant!0 (currentBit!13623 thiss!1939) (currentByte!13628 thiss!1939) (size!7113 (buf!7359 thiss!1939))))))

(declare-fun bs!24558 () Bool)

(assert (= bs!24558 d!97314))

(declare-fun m!416655 () Bool)

(assert (=> bs!24558 m!416655))

(assert (=> start!63310 d!97314))

(declare-fun d!97320 () Bool)

