; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63692 () Bool)

(assert start!63692)

(declare-datatypes ((array!16602 0))(
  ( (array!16603 (arr!8161 (Array (_ BitVec 32) (_ BitVec 8))) (size!7165 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12700 0))(
  ( (BitStream!12701 (buf!7411 array!16602) (currentByte!13743 (_ BitVec 32)) (currentBit!13738 (_ BitVec 32))) )
))
(declare-fun thiss!1929 () BitStream!12700)

(assert (=> start!63692 (and (not (= #b00000000000000000000000000000000 (bvand (currentBit!13738 thiss!1929) #b10000000000000000000000000000000))) (not (= #b00000000000000000000000000000000 (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13738 thiss!1929)) #b10000000000000000000000000000000))))))

(declare-fun e!202982 () Bool)

(declare-fun inv!12 (BitStream!12700) Bool)

(assert (=> start!63692 (and (inv!12 thiss!1929) e!202982)))

(declare-fun b!284004 () Bool)

(declare-fun array_inv!6858 (array!16602) Bool)

(assert (=> b!284004 (= e!202982 (array_inv!6858 (buf!7411 thiss!1929)))))

(assert (= start!63692 b!284004))

(declare-fun m!417141 () Bool)

(assert (=> start!63692 m!417141))

(declare-fun m!417143 () Bool)

(assert (=> b!284004 m!417143))

(push 1)

(assert (not start!63692))

(assert (not b!284004))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97658 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!97658 (= (inv!12 thiss!1929) (invariant!0 (currentBit!13738 thiss!1929) (currentByte!13743 thiss!1929) (size!7165 (buf!7411 thiss!1929))))))

(declare-fun bs!24676 () Bool)

(assert (= bs!24676 d!97658))

(declare-fun m!417155 () Bool)

(assert (=> bs!24676 m!417155))

(assert (=> start!63692 d!97658))

(declare-fun d!97660 () Bool)

(assert (=> d!97660 (= (array_inv!6858 (buf!7411 thiss!1929)) (bvsge (size!7165 (buf!7411 thiss!1929)) #b00000000000000000000000000000000))))

(assert (=> b!284004 d!97660))

(push 1)

(assert (not d!97658))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97666 () Bool)

(assert (=> d!97666 (= (invariant!0 (currentBit!13738 thiss!1929) (currentByte!13743 thiss!1929) (size!7165 (buf!7411 thiss!1929))) (and (bvsge (currentBit!13738 thiss!1929) #b00000000000000000000000000000000) (bvslt (currentBit!13738 thiss!1929) #b00000000000000000000000000001000) (bvsge (currentByte!13743 thiss!1929) #b00000000000000000000000000000000) (or (bvslt (currentByte!13743 thiss!1929) (size!7165 (buf!7411 thiss!1929))) (and (= (currentBit!13738 thiss!1929) #b00000000000000000000000000000000) (= (currentByte!13743 thiss!1929) (size!7165 (buf!7411 thiss!1929)))))))))

(assert (=> d!97658 d!97666))

(push 1)

(check-sat)

(pop 1)

