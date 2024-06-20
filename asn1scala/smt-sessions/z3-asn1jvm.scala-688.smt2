; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19384 () Bool)

(assert start!19384)

(declare-fun res!79489 () Bool)

(declare-fun e!63466 () Bool)

(assert (=> start!19384 (=> (not res!79489) (not e!63466))))

(declare-fun nBits!388 () (_ BitVec 32))

(declare-datatypes ((array!4517 0))(
  ( (array!4518 (arr!2659 (Array (_ BitVec 32) (_ BitVec 8))) (size!2066 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3606 0))(
  ( (BitStream!3607 (buf!2412 array!4517) (currentByte!4818 (_ BitVec 32)) (currentBit!4813 (_ BitVec 32))) )
))
(declare-fun thiss!1288 () BitStream!3606)

(assert (=> start!19384 (= res!79489 (and (bvsge nBits!388 #b00000000000000000000000000000000) (bvsle nBits!388 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!2066 (buf!2412 thiss!1288))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4818 thiss!1288)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4813 thiss!1288)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!2066 (buf!2412 thiss!1288))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!4818 thiss!1288)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!4813 thiss!1288)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!19384 e!63466))

(assert (=> start!19384 true))

(declare-fun e!63467 () Bool)

(declare-fun inv!12 (BitStream!3606) Bool)

(assert (=> start!19384 (and (inv!12 thiss!1288) e!63467)))

(declare-fun b!96845 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!96845 (= e!63466 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4813 thiss!1288))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4818 thiss!1288))) ((_ extract 31 0) ((_ sign_extend 32) (size!2066 (buf!2412 thiss!1288)))))))))

(declare-fun b!96846 () Bool)

(declare-fun array_inv!1868 (array!4517) Bool)

(assert (=> b!96846 (= e!63467 (array_inv!1868 (buf!2412 thiss!1288)))))

(assert (= (and start!19384 res!79489) b!96845))

(assert (= start!19384 b!96846))

(declare-fun m!140497 () Bool)

(assert (=> start!19384 m!140497))

(declare-fun m!140499 () Bool)

(assert (=> b!96845 m!140499))

(declare-fun m!140501 () Bool)

(assert (=> b!96846 m!140501))

(check-sat (not b!96846) (not b!96845) (not start!19384))
(check-sat)
(get-model)

(declare-fun d!30400 () Bool)

(assert (=> d!30400 (= (array_inv!1868 (buf!2412 thiss!1288)) (bvsge (size!2066 (buf!2412 thiss!1288)) #b00000000000000000000000000000000))))

(assert (=> b!96846 d!30400))

(declare-fun d!30402 () Bool)

(assert (=> d!30402 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4813 thiss!1288))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4818 thiss!1288))) ((_ extract 31 0) ((_ sign_extend 32) (size!2066 (buf!2412 thiss!1288))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4813 thiss!1288))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4813 thiss!1288))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4818 thiss!1288))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4818 thiss!1288))) ((_ extract 31 0) ((_ sign_extend 32) (size!2066 (buf!2412 thiss!1288))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4813 thiss!1288))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4818 thiss!1288))) ((_ extract 31 0) ((_ sign_extend 32) (size!2066 (buf!2412 thiss!1288)))))))))))

(assert (=> b!96845 d!30402))

(declare-fun d!30404 () Bool)

(assert (=> d!30404 (= (inv!12 thiss!1288) (invariant!0 (currentBit!4813 thiss!1288) (currentByte!4818 thiss!1288) (size!2066 (buf!2412 thiss!1288))))))

(declare-fun bs!7428 () Bool)

(assert (= bs!7428 d!30404))

(declare-fun m!140509 () Bool)

(assert (=> bs!7428 m!140509))

(assert (=> start!19384 d!30404))

(check-sat (not d!30404))
(check-sat)
