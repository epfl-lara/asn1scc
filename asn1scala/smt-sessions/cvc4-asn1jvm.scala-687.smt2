; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19362 () Bool)

(assert start!19362)

(declare-fun nBits!388 () (_ BitVec 32))

(declare-datatypes ((array!4510 0))(
  ( (array!4511 (arr!2657 (Array (_ BitVec 32) (_ BitVec 8))) (size!2064 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3602 0))(
  ( (BitStream!3603 (buf!2410 array!4510) (currentByte!4813 (_ BitVec 32)) (currentBit!4808 (_ BitVec 32))) )
))
(declare-fun thiss!1288 () BitStream!3602)

(assert (=> start!19362 (and (bvsge nBits!388 #b00000000000000000000000000000000) (bvsle nBits!388 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!2064 (buf!2410 thiss!1288))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4813 thiss!1288)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4808 thiss!1288)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!2064 (buf!2410 thiss!1288))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!4813 thiss!1288)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!4808 thiss!1288)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!19362 true))

(declare-fun e!63449 () Bool)

(declare-fun inv!12 (BitStream!3602) Bool)

(assert (=> start!19362 (and (inv!12 thiss!1288) e!63449)))

(declare-fun b!96834 () Bool)

(declare-fun array_inv!1866 (array!4510) Bool)

(assert (=> b!96834 (= e!63449 (array_inv!1866 (buf!2410 thiss!1288)))))

(assert (= start!19362 b!96834))

(declare-fun m!140481 () Bool)

(assert (=> start!19362 m!140481))

(declare-fun m!140483 () Bool)

(assert (=> b!96834 m!140483))

(push 1)

(assert (not start!19362))

(assert (not b!96834))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!30386 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!30386 (= (inv!12 thiss!1288) (invariant!0 (currentBit!4808 thiss!1288) (currentByte!4813 thiss!1288) (size!2064 (buf!2410 thiss!1288))))))

(declare-fun bs!7424 () Bool)

(assert (= bs!7424 d!30386))

(declare-fun m!140489 () Bool)

(assert (=> bs!7424 m!140489))

(assert (=> start!19362 d!30386))

(declare-fun d!30390 () Bool)

(assert (=> d!30390 (= (array_inv!1866 (buf!2410 thiss!1288)) (bvsge (size!2064 (buf!2410 thiss!1288)) #b00000000000000000000000000000000))))

(assert (=> b!96834 d!30390))

(push 1)

(assert (not d!30386))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!30396 () Bool)

(assert (=> d!30396 (= (invariant!0 (currentBit!4808 thiss!1288) (currentByte!4813 thiss!1288) (size!2064 (buf!2410 thiss!1288))) (and (bvsge (currentBit!4808 thiss!1288) #b00000000000000000000000000000000) (bvslt (currentBit!4808 thiss!1288) #b00000000000000000000000000001000) (bvsge (currentByte!4813 thiss!1288) #b00000000000000000000000000000000) (or (bvslt (currentByte!4813 thiss!1288) (size!2064 (buf!2410 thiss!1288))) (and (= (currentBit!4808 thiss!1288) #b00000000000000000000000000000000) (= (currentByte!4813 thiss!1288) (size!2064 (buf!2410 thiss!1288)))))))))

