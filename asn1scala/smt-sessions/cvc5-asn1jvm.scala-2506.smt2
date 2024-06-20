; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63366 () Bool)

(assert start!63366)

(declare-fun lt!417969 () (_ BitVec 32))

(declare-datatypes ((array!16486 0))(
  ( (array!16487 (arr!8116 (Array (_ BitVec 32) (_ BitVec 8))) (size!7120 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12610 0))(
  ( (BitStream!12611 (buf!7366 array!16486) (currentByte!13641 (_ BitVec 32)) (currentBit!13636 (_ BitVec 32))) )
))
(declare-fun thiss!1939 () BitStream!12610)

(assert (=> start!63366 (= lt!417969 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!13641 thiss!1939) #b00000000000000000000000000000001)) (currentBit!13636 thiss!1939)))))

(assert (=> start!63366 (and (not (= #b00000000000000000000000000000000 (bvand lt!417969 #b10000000000000000000000000000000))) (not (= #b00000000000000000000000000000000 (bvand (bvsub #b00000000000000000000000000010000 lt!417969) #b10000000000000000000000000000000))))))

(declare-fun e!202544 () Bool)

(declare-fun inv!12 (BitStream!12610) Bool)

(assert (=> start!63366 (and (inv!12 thiss!1939) e!202544)))

(declare-fun b!283632 () Bool)

(declare-fun array_inv!6813 (array!16486) Bool)

(assert (=> b!283632 (= e!202544 (array_inv!6813 (buf!7366 thiss!1939)))))

(assert (= start!63366 b!283632))

(declare-fun m!416689 () Bool)

(assert (=> start!63366 m!416689))

(declare-fun m!416691 () Bool)

(assert (=> b!283632 m!416691))

(push 1)

(assert (not start!63366))

(assert (not b!283632))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97350 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!97350 (= (inv!12 thiss!1939) (invariant!0 (currentBit!13636 thiss!1939) (currentByte!13641 thiss!1939) (size!7120 (buf!7366 thiss!1939))))))

(declare-fun bs!24576 () Bool)

(assert (= bs!24576 d!97350))

(declare-fun m!416701 () Bool)

(assert (=> bs!24576 m!416701))

(assert (=> start!63366 d!97350))

(declare-fun d!97354 () Bool)

(assert (=> d!97354 (= (array_inv!6813 (buf!7366 thiss!1939)) (bvsge (size!7120 (buf!7366 thiss!1939)) #b00000000000000000000000000000000))))

(assert (=> b!283632 d!97354))

(push 1)

(assert (not d!97350))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97358 () Bool)

(assert (=> d!97358 (= (invariant!0 (currentBit!13636 thiss!1939) (currentByte!13641 thiss!1939) (size!7120 (buf!7366 thiss!1939))) (and (bvsge (currentBit!13636 thiss!1939) #b00000000000000000000000000000000) (bvslt (currentBit!13636 thiss!1939) #b00000000000000000000000000001000) (bvsge (currentByte!13641 thiss!1939) #b00000000000000000000000000000000) (or (bvslt (currentByte!13641 thiss!1939) (size!7120 (buf!7366 thiss!1939))) (and (= (currentBit!13636 thiss!1939) #b00000000000000000000000000000000) (= (currentByte!13641 thiss!1939) (size!7120 (buf!7366 thiss!1939)))))))))

(assert (=> d!97350 d!97358))

(push 1)

(check-sat)

