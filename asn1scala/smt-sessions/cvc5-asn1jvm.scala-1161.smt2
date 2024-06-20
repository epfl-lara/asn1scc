; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32806 () Bool)

(assert start!32806)

(declare-fun res!133847 () Bool)

(declare-fun e!109972 () Bool)

(assert (=> start!32806 (=> (not res!133847) (not e!109972))))

(declare-datatypes ((array!7742 0))(
  ( (array!7743 (arr!4417 (Array (_ BitVec 32) (_ BitVec 8))) (size!3496 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6160 0))(
  ( (BitStream!6161 (buf!3954 array!7742) (currentByte!7267 (_ BitVec 32)) (currentBit!7262 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6160)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32806 (= res!133847 (validate_offset_byte!0 ((_ sign_extend 32) (size!3496 (buf!3954 thiss!1602))) ((_ sign_extend 32) (currentByte!7267 thiss!1602)) ((_ sign_extend 32) (currentBit!7262 thiss!1602))))))

(assert (=> start!32806 e!109972))

(declare-fun e!109973 () Bool)

(declare-fun inv!12 (BitStream!6160) Bool)

(assert (=> start!32806 (and (inv!12 thiss!1602) e!109973)))

(declare-fun b!160469 () Bool)

(assert (=> b!160469 (= e!109972 (or (bvslt (currentByte!7267 thiss!1602) #b00000000000000000000000000000000) (bvsge (currentByte!7267 thiss!1602) (size!3496 (buf!3954 thiss!1602)))))))

(declare-fun b!160470 () Bool)

(declare-fun array_inv!3243 (array!7742) Bool)

(assert (=> b!160470 (= e!109973 (array_inv!3243 (buf!3954 thiss!1602)))))

(assert (= (and start!32806 res!133847) b!160469))

(assert (= start!32806 b!160470))

(declare-fun m!253381 () Bool)

(assert (=> start!32806 m!253381))

(declare-fun m!253383 () Bool)

(assert (=> start!32806 m!253383))

(declare-fun m!253385 () Bool)

(assert (=> b!160470 m!253385))

(push 1)

(assert (not start!32806))

(assert (not b!160470))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54269 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54269 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3496 (buf!3954 thiss!1602))) ((_ sign_extend 32) (currentByte!7267 thiss!1602)) ((_ sign_extend 32) (currentBit!7262 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3496 (buf!3954 thiss!1602))) ((_ sign_extend 32) (currentByte!7267 thiss!1602)) ((_ sign_extend 32) (currentBit!7262 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13461 () Bool)

(assert (= bs!13461 d!54269))

(declare-fun m!253403 () Bool)

(assert (=> bs!13461 m!253403))

(assert (=> start!32806 d!54269))

(declare-fun d!54273 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54273 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7262 thiss!1602) (currentByte!7267 thiss!1602) (size!3496 (buf!3954 thiss!1602))))))

(declare-fun bs!13462 () Bool)

(assert (= bs!13462 d!54273))

(declare-fun m!253405 () Bool)

(assert (=> bs!13462 m!253405))

(assert (=> start!32806 d!54273))

(declare-fun d!54275 () Bool)

(assert (=> d!54275 (= (array_inv!3243 (buf!3954 thiss!1602)) (bvsge (size!3496 (buf!3954 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160470 d!54275))

(push 1)

(assert (not d!54269))

(assert (not d!54273))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54287 () Bool)

(assert (=> d!54287 (= (remainingBits!0 ((_ sign_extend 32) (size!3496 (buf!3954 thiss!1602))) ((_ sign_extend 32) (currentByte!7267 thiss!1602)) ((_ sign_extend 32) (currentBit!7262 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3496 (buf!3954 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7267 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7262 thiss!1602)))))))

(assert (=> d!54269 d!54287))

(declare-fun d!54289 () Bool)

(assert (=> d!54289 (= (invariant!0 (currentBit!7262 thiss!1602) (currentByte!7267 thiss!1602) (size!3496 (buf!3954 thiss!1602))) (and (bvsge (currentBit!7262 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7262 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7267 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7267 thiss!1602) (size!3496 (buf!3954 thiss!1602))) (and (= (currentBit!7262 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7267 thiss!1602) (size!3496 (buf!3954 thiss!1602)))))))))

(assert (=> d!54273 d!54289))

(push 1)

(check-sat)

(pop 1)

