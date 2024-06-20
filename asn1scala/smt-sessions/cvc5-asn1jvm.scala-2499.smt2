; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63258 () Bool)

(assert start!63258)

(declare-datatypes ((array!16439 0))(
  ( (array!16440 (arr!8098 (Array (_ BitVec 32) (_ BitVec 8))) (size!7102 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12574 0))(
  ( (BitStream!12575 (buf!7348 array!16439) (currentByte!13613 (_ BitVec 32)) (currentBit!13608 (_ BitVec 32))) )
))
(declare-fun thiss!1939 () BitStream!12574)

(assert (=> start!63258 (and (bvsle ((_ sign_extend 32) (size!7102 (buf!7348 thiss!1939))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!13613 thiss!1939)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!13608 thiss!1939)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!7102 (buf!7348 thiss!1939))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!13613 thiss!1939)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!13608 thiss!1939)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!202409 () Bool)

(declare-fun inv!12 (BitStream!12574) Bool)

(assert (=> start!63258 (and (inv!12 thiss!1939) e!202409)))

(declare-fun b!283542 () Bool)

(declare-fun array_inv!6795 (array!16439) Bool)

(assert (=> b!283542 (= e!202409 (array_inv!6795 (buf!7348 thiss!1939)))))

(assert (= start!63258 b!283542))

(declare-fun m!416565 () Bool)

(assert (=> start!63258 m!416565))

(declare-fun m!416567 () Bool)

(assert (=> b!283542 m!416567))

(push 1)

(assert (not start!63258))

(assert (not b!283542))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97268 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!97268 (= (inv!12 thiss!1939) (invariant!0 (currentBit!13608 thiss!1939) (currentByte!13613 thiss!1939) (size!7102 (buf!7348 thiss!1939))))))

(declare-fun bs!24539 () Bool)

(assert (= bs!24539 d!97268))

(declare-fun m!416579 () Bool)

(assert (=> bs!24539 m!416579))

(assert (=> start!63258 d!97268))

(declare-fun d!97272 () Bool)

(assert (=> d!97272 (= (array_inv!6795 (buf!7348 thiss!1939)) (bvsge (size!7102 (buf!7348 thiss!1939)) #b00000000000000000000000000000000))))

(assert (=> b!283542 d!97272))

(push 1)

