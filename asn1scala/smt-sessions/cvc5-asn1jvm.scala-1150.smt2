; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32566 () Bool)

(assert start!32566)

(declare-fun res!133748 () Bool)

(declare-fun e!109675 () Bool)

(assert (=> start!32566 (=> (not res!133748) (not e!109675))))

(declare-datatypes ((array!7657 0))(
  ( (array!7658 (arr!4384 (Array (_ BitVec 32) (_ BitVec 8))) (size!3463 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6094 0))(
  ( (BitStream!6095 (buf!3921 array!7657) (currentByte!7185 (_ BitVec 32)) (currentBit!7180 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6094)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32566 (= res!133748 (validate_offset_byte!0 ((_ sign_extend 32) (size!3463 (buf!3921 thiss!1602))) ((_ sign_extend 32) (currentByte!7185 thiss!1602)) ((_ sign_extend 32) (currentBit!7180 thiss!1602))))))

(assert (=> start!32566 e!109675))

(declare-fun e!109676 () Bool)

(declare-fun inv!12 (BitStream!6094) Bool)

(assert (=> start!32566 (and (inv!12 thiss!1602) e!109676)))

(declare-fun b!160271 () Bool)

(assert (=> b!160271 (= e!109675 (and (bvslt (currentBit!7180 thiss!1602) #b00000000000000000000000010000000) (bvslt (currentBit!7180 thiss!1602) #b11111111111111111111111110000000)))))

(declare-fun b!160272 () Bool)

(declare-fun array_inv!3210 (array!7657) Bool)

(assert (=> b!160272 (= e!109676 (array_inv!3210 (buf!3921 thiss!1602)))))

(assert (= (and start!32566 res!133748) b!160271))

(assert (= start!32566 b!160272))

(declare-fun m!253033 () Bool)

(assert (=> start!32566 m!253033))

(declare-fun m!253035 () Bool)

(assert (=> start!32566 m!253035))

(declare-fun m!253037 () Bool)

(assert (=> b!160272 m!253037))

(push 1)

(assert (not start!32566))

(assert (not b!160272))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54065 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54065 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3463 (buf!3921 thiss!1602))) ((_ sign_extend 32) (currentByte!7185 thiss!1602)) ((_ sign_extend 32) (currentBit!7180 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3463 (buf!3921 thiss!1602))) ((_ sign_extend 32) (currentByte!7185 thiss!1602)) ((_ sign_extend 32) (currentBit!7180 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13384 () Bool)

(assert (= bs!13384 d!54065))

(declare-fun m!253051 () Bool)

(assert (=> bs!13384 m!253051))

(assert (=> start!32566 d!54065))

(declare-fun d!54067 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54067 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7180 thiss!1602) (currentByte!7185 thiss!1602) (size!3463 (buf!3921 thiss!1602))))))

(declare-fun bs!13386 () Bool)

(assert (= bs!13386 d!54067))

(declare-fun m!253055 () Bool)

(assert (=> bs!13386 m!253055))

(assert (=> start!32566 d!54067))

(declare-fun d!54075 () Bool)

(assert (=> d!54075 (= (array_inv!3210 (buf!3921 thiss!1602)) (bvsge (size!3463 (buf!3921 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160272 d!54075))

(push 1)

(assert (not d!54065))

(assert (not d!54067))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54079 () Bool)

(assert (=> d!54079 (= (remainingBits!0 ((_ sign_extend 32) (size!3463 (buf!3921 thiss!1602))) ((_ sign_extend 32) (currentByte!7185 thiss!1602)) ((_ sign_extend 32) (currentBit!7180 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3463 (buf!3921 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7185 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7180 thiss!1602)))))))

(assert (=> d!54065 d!54079))

(declare-fun d!54083 () Bool)

(assert (=> d!54083 (= (invariant!0 (currentBit!7180 thiss!1602) (currentByte!7185 thiss!1602) (size!3463 (buf!3921 thiss!1602))) (and (bvsge (currentBit!7180 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7180 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7185 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7185 thiss!1602) (size!3463 (buf!3921 thiss!1602))) (and (= (currentBit!7180 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7185 thiss!1602) (size!3463 (buf!3921 thiss!1602)))))))))

(assert (=> d!54067 d!54083))

(push 1)

(check-sat)

