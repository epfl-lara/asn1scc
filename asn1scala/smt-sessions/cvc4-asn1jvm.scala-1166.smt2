; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32990 () Bool)

(assert start!32990)

(declare-fun res!133898 () Bool)

(declare-fun e!110125 () Bool)

(assert (=> start!32990 (=> (not res!133898) (not e!110125))))

(declare-datatypes ((array!7791 0))(
  ( (array!7792 (arr!4434 (Array (_ BitVec 32) (_ BitVec 8))) (size!3513 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6194 0))(
  ( (BitStream!6195 (buf!3971 array!7791) (currentByte!7329 (_ BitVec 32)) (currentBit!7324 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6194)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32990 (= res!133898 (validate_offset_byte!0 ((_ sign_extend 32) (size!3513 (buf!3971 thiss!1602))) ((_ sign_extend 32) (currentByte!7329 thiss!1602)) ((_ sign_extend 32) (currentBit!7324 thiss!1602))))))

(assert (=> start!32990 e!110125))

(declare-fun e!110126 () Bool)

(declare-fun inv!12 (BitStream!6194) Bool)

(assert (=> start!32990 (and (inv!12 thiss!1602) e!110126)))

(declare-fun b!160571 () Bool)

(assert (=> b!160571 (= e!110125 (and (bvslt (currentByte!7329 thiss!1602) (size!3513 (buf!3971 thiss!1602))) (bvslt (currentByte!7329 thiss!1602) #b00000000000000000000000000000000)))))

(declare-fun b!160572 () Bool)

(declare-fun array_inv!3260 (array!7791) Bool)

(assert (=> b!160572 (= e!110126 (array_inv!3260 (buf!3971 thiss!1602)))))

(assert (= (and start!32990 res!133898) b!160571))

(assert (= start!32990 b!160572))

(declare-fun m!253579 () Bool)

(assert (=> start!32990 m!253579))

(declare-fun m!253581 () Bool)

(assert (=> start!32990 m!253581))

(declare-fun m!253583 () Bool)

(assert (=> b!160572 m!253583))

(push 1)

(assert (not b!160572))

(assert (not start!32990))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54445 () Bool)

(assert (=> d!54445 (= (array_inv!3260 (buf!3971 thiss!1602)) (bvsge (size!3513 (buf!3971 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160572 d!54445))

(declare-fun d!54447 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54447 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3513 (buf!3971 thiss!1602))) ((_ sign_extend 32) (currentByte!7329 thiss!1602)) ((_ sign_extend 32) (currentBit!7324 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3513 (buf!3971 thiss!1602))) ((_ sign_extend 32) (currentByte!7329 thiss!1602)) ((_ sign_extend 32) (currentBit!7324 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13511 () Bool)

(assert (= bs!13511 d!54447))

(declare-fun m!253593 () Bool)

(assert (=> bs!13511 m!253593))

(assert (=> start!32990 d!54447))

(declare-fun d!54453 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54453 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7324 thiss!1602) (currentByte!7329 thiss!1602) (size!3513 (buf!3971 thiss!1602))))))

(declare-fun bs!13512 () Bool)

(assert (= bs!13512 d!54453))

(declare-fun m!253595 () Bool)

(assert (=> bs!13512 m!253595))

(assert (=> start!32990 d!54453))

(push 1)

(assert (not d!54453))

(assert (not d!54447))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

