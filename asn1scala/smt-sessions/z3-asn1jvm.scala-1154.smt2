; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32652 () Bool)

(assert start!32652)

(declare-fun res!133787 () Bool)

(declare-fun e!109794 () Bool)

(assert (=> start!32652 (=> (not res!133787) (not e!109794))))

(declare-datatypes ((array!7689 0))(
  ( (array!7690 (arr!4397 (Array (_ BitVec 32) (_ BitVec 8))) (size!3476 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6120 0))(
  ( (BitStream!6121 (buf!3934 array!7689) (currentByte!7216 (_ BitVec 32)) (currentBit!7211 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6120)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32652 (= res!133787 (validate_offset_byte!0 ((_ sign_extend 32) (size!3476 (buf!3934 thiss!1602))) ((_ sign_extend 32) (currentByte!7216 thiss!1602)) ((_ sign_extend 32) (currentBit!7211 thiss!1602))))))

(assert (=> start!32652 e!109794))

(declare-fun e!109793 () Bool)

(declare-fun inv!12 (BitStream!6120) Bool)

(assert (=> start!32652 (and (inv!12 thiss!1602) e!109793)))

(declare-fun b!160349 () Bool)

(declare-fun lt!252954 () (_ BitVec 32))

(assert (=> b!160349 (= e!109794 (or (bvslt lt!252954 #b00000000000000000000000000000000) (bvsge lt!252954 #b00000000000000000000000000001001)))))

(assert (=> b!160349 (= lt!252954 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7211 thiss!1602)))))))))

(declare-fun b!160350 () Bool)

(declare-fun array_inv!3223 (array!7689) Bool)

(assert (=> b!160350 (= e!109793 (array_inv!3223 (buf!3934 thiss!1602)))))

(assert (= (and start!32652 res!133787) b!160349))

(assert (= start!32652 b!160350))

(declare-fun m!253135 () Bool)

(assert (=> start!32652 m!253135))

(declare-fun m!253137 () Bool)

(assert (=> start!32652 m!253137))

(declare-fun m!253139 () Bool)

(assert (=> b!160350 m!253139))

(check-sat (not b!160350) (not start!32652))
(check-sat)
(get-model)

(declare-fun d!54129 () Bool)

(assert (=> d!54129 (= (array_inv!3223 (buf!3934 thiss!1602)) (bvsge (size!3476 (buf!3934 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160350 d!54129))

(declare-fun d!54131 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54131 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3476 (buf!3934 thiss!1602))) ((_ sign_extend 32) (currentByte!7216 thiss!1602)) ((_ sign_extend 32) (currentBit!7211 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3476 (buf!3934 thiss!1602))) ((_ sign_extend 32) (currentByte!7216 thiss!1602)) ((_ sign_extend 32) (currentBit!7211 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13408 () Bool)

(assert (= bs!13408 d!54131))

(declare-fun m!253147 () Bool)

(assert (=> bs!13408 m!253147))

(assert (=> start!32652 d!54131))

(declare-fun d!54133 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54133 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7211 thiss!1602) (currentByte!7216 thiss!1602) (size!3476 (buf!3934 thiss!1602))))))

(declare-fun bs!13409 () Bool)

(assert (= bs!13409 d!54133))

(declare-fun m!253149 () Bool)

(assert (=> bs!13409 m!253149))

(assert (=> start!32652 d!54133))

(check-sat (not d!54131) (not d!54133))
(check-sat)
(get-model)

(declare-fun d!54147 () Bool)

(assert (=> d!54147 (= (remainingBits!0 ((_ sign_extend 32) (size!3476 (buf!3934 thiss!1602))) ((_ sign_extend 32) (currentByte!7216 thiss!1602)) ((_ sign_extend 32) (currentBit!7211 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3476 (buf!3934 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7216 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7211 thiss!1602)))))))

(assert (=> d!54131 d!54147))

(declare-fun d!54149 () Bool)

(assert (=> d!54149 (= (invariant!0 (currentBit!7211 thiss!1602) (currentByte!7216 thiss!1602) (size!3476 (buf!3934 thiss!1602))) (and (bvsge (currentBit!7211 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7211 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7216 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7216 thiss!1602) (size!3476 (buf!3934 thiss!1602))) (and (= (currentBit!7211 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7216 thiss!1602) (size!3476 (buf!3934 thiss!1602)))))))))

(assert (=> d!54133 d!54149))

(check-sat)
