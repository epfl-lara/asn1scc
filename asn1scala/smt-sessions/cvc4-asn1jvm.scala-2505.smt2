; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63346 () Bool)

(assert start!63346)

(declare-fun lt!417966 () (_ BitVec 32))

(declare-fun lt!417965 () (_ BitVec 32))

(assert (=> start!63346 (= lt!417966 (bvand lt!417965 #b10000000000000000000000000000000))))

(declare-datatypes ((array!16481 0))(
  ( (array!16482 (arr!8115 (Array (_ BitVec 32) (_ BitVec 8))) (size!7119 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12608 0))(
  ( (BitStream!12609 (buf!7365 array!16481) (currentByte!13637 (_ BitVec 32)) (currentBit!13632 (_ BitVec 32))) )
))
(declare-fun thiss!1939 () BitStream!12608)

(assert (=> start!63346 (= lt!417965 (bvmul #b00000000000000000000000000001000 (bvand (currentByte!13637 thiss!1939) #b00000000000000000000000000000001)))))

(assert (=> start!63346 (and (= lt!417966 (bvand (currentBit!13632 thiss!1939) #b10000000000000000000000000000000)) (not (= lt!417966 (bvand (bvadd lt!417965 (currentBit!13632 thiss!1939)) #b10000000000000000000000000000000))))))

(declare-fun e!202538 () Bool)

(declare-fun inv!12 (BitStream!12608) Bool)

(assert (=> start!63346 (and (inv!12 thiss!1939) e!202538)))

(declare-fun b!283629 () Bool)

(declare-fun array_inv!6812 (array!16481) Bool)

(assert (=> b!283629 (= e!202538 (array_inv!6812 (buf!7365 thiss!1939)))))

(assert (= start!63346 b!283629))

(declare-fun m!416679 () Bool)

(assert (=> start!63346 m!416679))

(declare-fun m!416681 () Bool)

(assert (=> b!283629 m!416681))

(push 1)

(assert (not b!283629))

(assert (not start!63346))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97336 () Bool)

(assert (=> d!97336 (= (array_inv!6812 (buf!7365 thiss!1939)) (bvsge (size!7119 (buf!7365 thiss!1939)) #b00000000000000000000000000000000))))

(assert (=> b!283629 d!97336))

(declare-fun d!97338 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!97338 (= (inv!12 thiss!1939) (invariant!0 (currentBit!13632 thiss!1939) (currentByte!13637 thiss!1939) (size!7119 (buf!7365 thiss!1939))))))

(declare-fun bs!24572 () Bool)

(assert (= bs!24572 d!97338))

(declare-fun m!416687 () Bool)

(assert (=> bs!24572 m!416687))

(assert (=> start!63346 d!97338))

(push 1)

(assert (not d!97338))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97346 () Bool)

