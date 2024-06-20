; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63342 () Bool)

(assert start!63342)

(declare-fun lt!417954 () (_ BitVec 32))

(declare-fun lt!417953 () (_ BitVec 32))

(assert (=> start!63342 (= lt!417954 (bvand lt!417953 #b10000000000000000000000000000000))))

(declare-datatypes ((array!16477 0))(
  ( (array!16478 (arr!8113 (Array (_ BitVec 32) (_ BitVec 8))) (size!7117 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12604 0))(
  ( (BitStream!12605 (buf!7363 array!16477) (currentByte!13635 (_ BitVec 32)) (currentBit!13630 (_ BitVec 32))) )
))
(declare-fun thiss!1939 () BitStream!12604)

(assert (=> start!63342 (= lt!417953 (bvmul #b00000000000000000000000000001000 (bvand (currentByte!13635 thiss!1939) #b00000000000000000000000000000001)))))

(assert (=> start!63342 (and (= lt!417954 (bvand (currentBit!13630 thiss!1939) #b10000000000000000000000000000000)) (not (= lt!417954 (bvand (bvadd lt!417953 (currentBit!13630 thiss!1939)) #b10000000000000000000000000000000))))))

(declare-fun e!202526 () Bool)

(declare-fun inv!12 (BitStream!12604) Bool)

(assert (=> start!63342 (and (inv!12 thiss!1939) e!202526)))

(declare-fun b!283623 () Bool)

(declare-fun array_inv!6810 (array!16477) Bool)

(assert (=> b!283623 (= e!202526 (array_inv!6810 (buf!7363 thiss!1939)))))

(assert (= start!63342 b!283623))

(declare-fun m!416671 () Bool)

(assert (=> start!63342 m!416671))

(declare-fun m!416673 () Bool)

(assert (=> b!283623 m!416673))

(push 1)

(assert (not b!283623))

(assert (not start!63342))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97332 () Bool)

(assert (=> d!97332 (= (array_inv!6810 (buf!7363 thiss!1939)) (bvsge (size!7117 (buf!7363 thiss!1939)) #b00000000000000000000000000000000))))

(assert (=> b!283623 d!97332))

(declare-fun d!97334 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!97334 (= (inv!12 thiss!1939) (invariant!0 (currentBit!13630 thiss!1939) (currentByte!13635 thiss!1939) (size!7117 (buf!7363 thiss!1939))))))

(declare-fun bs!24571 () Bool)

(assert (= bs!24571 d!97334))

(declare-fun m!416685 () Bool)

(assert (=> bs!24571 m!416685))

(assert (=> start!63342 d!97334))

(push 1)

(assert (not d!97334))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97344 () Bool)

(assert (=> d!97344 (= (invariant!0 (currentBit!13630 thiss!1939) (currentByte!13635 thiss!1939) (size!7117 (buf!7363 thiss!1939))) (and (bvsge (currentBit!13630 thiss!1939) #b00000000000000000000000000000000) (bvslt (currentBit!13630 thiss!1939) #b00000000000000000000000000001000) (bvsge (currentByte!13635 thiss!1939) #b00000000000000000000000000000000) (or (bvslt (currentByte!13635 thiss!1939) (size!7117 (buf!7363 thiss!1939))) (and (= (currentBit!13630 thiss!1939) #b00000000000000000000000000000000) (= (currentByte!13635 thiss!1939) (size!7117 (buf!7363 thiss!1939)))))))))

(assert (=> d!97334 d!97344))

(push 1)

