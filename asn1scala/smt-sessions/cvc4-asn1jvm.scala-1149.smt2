; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32534 () Bool)

(assert start!32534)

(declare-fun res!133745 () Bool)

(declare-fun e!109666 () Bool)

(assert (=> start!32534 (=> (not res!133745) (not e!109666))))

(declare-datatypes ((array!7652 0))(
  ( (array!7653 (arr!4383 (Array (_ BitVec 32) (_ BitVec 8))) (size!3462 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6092 0))(
  ( (BitStream!6093 (buf!3920 array!7652) (currentByte!7175 (_ BitVec 32)) (currentBit!7170 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6092)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32534 (= res!133745 (validate_offset_byte!0 ((_ sign_extend 32) (size!3462 (buf!3920 thiss!1602))) ((_ sign_extend 32) (currentByte!7175 thiss!1602)) ((_ sign_extend 32) (currentBit!7170 thiss!1602))))))

(assert (=> start!32534 e!109666))

(declare-fun e!109667 () Bool)

(declare-fun inv!12 (BitStream!6092) Bool)

(assert (=> start!32534 (and (inv!12 thiss!1602) e!109667)))

(declare-fun b!160265 () Bool)

(assert (=> b!160265 (= e!109666 (bvsge (currentBit!7170 thiss!1602) #b00000000000000000000000010000000))))

(declare-fun b!160266 () Bool)

(declare-fun array_inv!3209 (array!7652) Bool)

(assert (=> b!160266 (= e!109667 (array_inv!3209 (buf!3920 thiss!1602)))))

(assert (= (and start!32534 res!133745) b!160265))

(assert (= start!32534 b!160266))

(declare-fun m!253015 () Bool)

(assert (=> start!32534 m!253015))

(declare-fun m!253017 () Bool)

(assert (=> start!32534 m!253017))

(declare-fun m!253019 () Bool)

(assert (=> b!160266 m!253019))

(push 1)

(assert (not b!160266))

(assert (not start!32534))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54041 () Bool)

(assert (=> d!54041 (= (array_inv!3209 (buf!3920 thiss!1602)) (bvsge (size!3462 (buf!3920 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160266 d!54041))

(declare-fun d!54043 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54043 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3462 (buf!3920 thiss!1602))) ((_ sign_extend 32) (currentByte!7175 thiss!1602)) ((_ sign_extend 32) (currentBit!7170 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3462 (buf!3920 thiss!1602))) ((_ sign_extend 32) (currentByte!7175 thiss!1602)) ((_ sign_extend 32) (currentBit!7170 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13379 () Bool)

(assert (= bs!13379 d!54043))

(declare-fun m!253029 () Bool)

(assert (=> bs!13379 m!253029))

(assert (=> start!32534 d!54043))

(declare-fun d!54045 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54045 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7170 thiss!1602) (currentByte!7175 thiss!1602) (size!3462 (buf!3920 thiss!1602))))))

(declare-fun bs!13380 () Bool)

(assert (= bs!13380 d!54045))

(declare-fun m!253031 () Bool)

(assert (=> bs!13380 m!253031))

(assert (=> start!32534 d!54045))

(push 1)

(assert (not d!54043))

(assert (not d!54045))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54055 () Bool)

(assert (=> d!54055 (= (remainingBits!0 ((_ sign_extend 32) (size!3462 (buf!3920 thiss!1602))) ((_ sign_extend 32) (currentByte!7175 thiss!1602)) ((_ sign_extend 32) (currentBit!7170 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3462 (buf!3920 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7175 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7170 thiss!1602)))))))

(assert (=> d!54043 d!54055))

(declare-fun d!54057 () Bool)

(assert (=> d!54057 (= (invariant!0 (currentBit!7170 thiss!1602) (currentByte!7175 thiss!1602) (size!3462 (buf!3920 thiss!1602))) (and (bvsge (currentBit!7170 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7170 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7175 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7175 thiss!1602) (size!3462 (buf!3920 thiss!1602))) (and (= (currentBit!7170 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7175 thiss!1602) (size!3462 (buf!3920 thiss!1602)))))))))

(assert (=> d!54045 d!54057))

(push 1)

(check-sat)

