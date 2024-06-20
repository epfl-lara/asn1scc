; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52 () Bool)

(assert start!52)

(declare-datatypes ((array!21 0))(
  ( (array!22 (arr!397 (Array (_ BitVec 32) (_ BitVec 8))) (size!10 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4 0))(
  ( (BitStream!5 (buf!322 array!21) (currentByte!1205 (_ BitVec 32)) (currentBit!1200 (_ BitVec 32))) )
))
(declare-fun thiss!909 () BitStream!4)

(assert (=> start!52 (and (bvsgt (currentBit!1200 thiss!909) #b00000000000000000000000000000000) (= (bvand (currentByte!1205 thiss!909) #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand (currentByte!1205 thiss!909) #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 (currentByte!1205 thiss!909)) #b10000000000000000000000000000000))))))

(declare-fun e!58 () Bool)

(declare-fun inv!12 (BitStream!4) Bool)

(assert (=> start!52 (and (inv!12 thiss!909) e!58)))

(declare-fun b!352 () Bool)

(declare-fun array_inv!7 (array!21) Bool)

(assert (=> b!352 (= e!58 (array_inv!7 (buf!322 thiss!909)))))

(assert (= start!52 b!352))

(declare-fun m!43 () Bool)

(assert (=> start!52 m!43))

(declare-fun m!45 () Bool)

(assert (=> b!352 m!45))

(push 1)

(assert (not b!352))

(assert (not start!52))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!718 () Bool)

(assert (=> d!718 (= (array_inv!7 (buf!322 thiss!909)) (bvsge (size!10 (buf!322 thiss!909)) #b00000000000000000000000000000000))))

(assert (=> b!352 d!718))

(declare-fun d!722 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!722 (= (inv!12 thiss!909) (invariant!0 (currentBit!1200 thiss!909) (currentByte!1205 thiss!909) (size!10 (buf!322 thiss!909))))))

(declare-fun bs!341 () Bool)

(assert (= bs!341 d!722))

(declare-fun m!59 () Bool)

(assert (=> bs!341 m!59))

(assert (=> start!52 d!722))

(push 1)

(assert (not d!722))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!730 () Bool)

(assert (=> d!730 (= (invariant!0 (currentBit!1200 thiss!909) (currentByte!1205 thiss!909) (size!10 (buf!322 thiss!909))) (and (bvsge (currentBit!1200 thiss!909) #b00000000000000000000000000000000) (bvslt (currentBit!1200 thiss!909) #b00000000000000000000000000001000) (bvsge (currentByte!1205 thiss!909) #b00000000000000000000000000000000) (or (bvslt (currentByte!1205 thiss!909) (size!10 (buf!322 thiss!909))) (and (= (currentBit!1200 thiss!909) #b00000000000000000000000000000000) (= (currentByte!1205 thiss!909) (size!10 (buf!322 thiss!909)))))))))

(assert (=> d!722 d!730))

(push 1)

(check-sat)

