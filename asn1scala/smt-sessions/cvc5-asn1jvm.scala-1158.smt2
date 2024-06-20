; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32722 () Bool)

(assert start!32722)

(declare-fun res!133820 () Bool)

(declare-fun e!109891 () Bool)

(assert (=> start!32722 (=> (not res!133820) (not e!109891))))

(declare-datatypes ((array!7717 0))(
  ( (array!7718 (arr!4408 (Array (_ BitVec 32) (_ BitVec 8))) (size!3487 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6142 0))(
  ( (BitStream!6143 (buf!3945 array!7717) (currentByte!7239 (_ BitVec 32)) (currentBit!7234 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6142)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32722 (= res!133820 (validate_offset_byte!0 ((_ sign_extend 32) (size!3487 (buf!3945 thiss!1602))) ((_ sign_extend 32) (currentByte!7239 thiss!1602)) ((_ sign_extend 32) (currentBit!7234 thiss!1602))))))

(assert (=> start!32722 e!109891))

(declare-fun e!109892 () Bool)

(declare-fun inv!12 (BitStream!6142) Bool)

(assert (=> start!32722 (and (inv!12 thiss!1602) e!109892)))

(declare-fun b!160415 () Bool)

(assert (=> b!160415 (= e!109891 (or (bvslt (currentByte!7239 thiss!1602) #b00000000000000000000000000000000) (bvsge (currentByte!7239 thiss!1602) (size!3487 (buf!3945 thiss!1602)))))))

(declare-fun b!160416 () Bool)

(declare-fun array_inv!3234 (array!7717) Bool)

(assert (=> b!160416 (= e!109892 (array_inv!3234 (buf!3945 thiss!1602)))))

(assert (= (and start!32722 res!133820) b!160415))

(assert (= start!32722 b!160416))

(declare-fun m!253267 () Bool)

(assert (=> start!32722 m!253267))

(declare-fun m!253269 () Bool)

(assert (=> start!32722 m!253269))

(declare-fun m!253271 () Bool)

(assert (=> b!160416 m!253271))

(push 1)

(assert (not b!160416))

(assert (not start!32722))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54197 () Bool)

(assert (=> d!54197 (= (array_inv!3234 (buf!3945 thiss!1602)) (bvsge (size!3487 (buf!3945 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160416 d!54197))

(declare-fun d!54199 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54199 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3487 (buf!3945 thiss!1602))) ((_ sign_extend 32) (currentByte!7239 thiss!1602)) ((_ sign_extend 32) (currentBit!7234 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3487 (buf!3945 thiss!1602))) ((_ sign_extend 32) (currentByte!7239 thiss!1602)) ((_ sign_extend 32) (currentBit!7234 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13437 () Bool)

(assert (= bs!13437 d!54199))

(declare-fun m!253289 () Bool)

(assert (=> bs!13437 m!253289))

(assert (=> start!32722 d!54199))

(declare-fun d!54201 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54201 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7234 thiss!1602) (currentByte!7239 thiss!1602) (size!3487 (buf!3945 thiss!1602))))))

(declare-fun bs!13438 () Bool)

(assert (= bs!13438 d!54201))

(declare-fun m!253291 () Bool)

(assert (=> bs!13438 m!253291))

(assert (=> start!32722 d!54201))

(push 1)

(assert (not d!54201))

(assert (not d!54199))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54213 () Bool)

(assert (=> d!54213 (= (invariant!0 (currentBit!7234 thiss!1602) (currentByte!7239 thiss!1602) (size!3487 (buf!3945 thiss!1602))) (and (bvsge (currentBit!7234 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7234 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7239 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7239 thiss!1602) (size!3487 (buf!3945 thiss!1602))) (and (= (currentBit!7234 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7239 thiss!1602) (size!3487 (buf!3945 thiss!1602)))))))))

(assert (=> d!54201 d!54213))

(declare-fun d!54215 () Bool)

(assert (=> d!54215 (= (remainingBits!0 ((_ sign_extend 32) (size!3487 (buf!3945 thiss!1602))) ((_ sign_extend 32) (currentByte!7239 thiss!1602)) ((_ sign_extend 32) (currentBit!7234 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3487 (buf!3945 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7239 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7234 thiss!1602)))))))

(assert (=> d!54199 d!54215))

(push 1)

(check-sat)

(pop 1)

