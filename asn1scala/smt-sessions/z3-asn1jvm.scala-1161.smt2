; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32808 () Bool)

(assert start!32808)

(declare-fun res!133850 () Bool)

(declare-fun e!109981 () Bool)

(assert (=> start!32808 (=> (not res!133850) (not e!109981))))

(declare-datatypes ((array!7744 0))(
  ( (array!7745 (arr!4418 (Array (_ BitVec 32) (_ BitVec 8))) (size!3497 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6162 0))(
  ( (BitStream!6163 (buf!3955 array!7744) (currentByte!7268 (_ BitVec 32)) (currentBit!7263 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6162)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32808 (= res!133850 (validate_offset_byte!0 ((_ sign_extend 32) (size!3497 (buf!3955 thiss!1602))) ((_ sign_extend 32) (currentByte!7268 thiss!1602)) ((_ sign_extend 32) (currentBit!7263 thiss!1602))))))

(assert (=> start!32808 e!109981))

(declare-fun e!109982 () Bool)

(declare-fun inv!12 (BitStream!6162) Bool)

(assert (=> start!32808 (and (inv!12 thiss!1602) e!109982)))

(declare-fun b!160475 () Bool)

(assert (=> b!160475 (= e!109981 (or (bvslt (currentByte!7268 thiss!1602) #b00000000000000000000000000000000) (bvsge (currentByte!7268 thiss!1602) (size!3497 (buf!3955 thiss!1602)))))))

(declare-fun b!160476 () Bool)

(declare-fun array_inv!3244 (array!7744) Bool)

(assert (=> b!160476 (= e!109982 (array_inv!3244 (buf!3955 thiss!1602)))))

(assert (= (and start!32808 res!133850) b!160475))

(assert (= start!32808 b!160476))

(declare-fun m!253387 () Bool)

(assert (=> start!32808 m!253387))

(declare-fun m!253389 () Bool)

(assert (=> start!32808 m!253389))

(declare-fun m!253391 () Bool)

(assert (=> b!160476 m!253391))

(check-sat (not start!32808) (not b!160476))
(check-sat)
(get-model)

(declare-fun d!54265 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54265 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3497 (buf!3955 thiss!1602))) ((_ sign_extend 32) (currentByte!7268 thiss!1602)) ((_ sign_extend 32) (currentBit!7263 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3497 (buf!3955 thiss!1602))) ((_ sign_extend 32) (currentByte!7268 thiss!1602)) ((_ sign_extend 32) (currentBit!7263 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13459 () Bool)

(assert (= bs!13459 d!54265))

(declare-fun m!253399 () Bool)

(assert (=> bs!13459 m!253399))

(assert (=> start!32808 d!54265))

(declare-fun d!54267 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54267 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7263 thiss!1602) (currentByte!7268 thiss!1602) (size!3497 (buf!3955 thiss!1602))))))

(declare-fun bs!13460 () Bool)

(assert (= bs!13460 d!54267))

(declare-fun m!253401 () Bool)

(assert (=> bs!13460 m!253401))

(assert (=> start!32808 d!54267))

(declare-fun d!54271 () Bool)

(assert (=> d!54271 (= (array_inv!3244 (buf!3955 thiss!1602)) (bvsge (size!3497 (buf!3955 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160476 d!54271))

(check-sat (not d!54265) (not d!54267))
(check-sat)
(get-model)

(declare-fun d!54283 () Bool)

(assert (=> d!54283 (= (remainingBits!0 ((_ sign_extend 32) (size!3497 (buf!3955 thiss!1602))) ((_ sign_extend 32) (currentByte!7268 thiss!1602)) ((_ sign_extend 32) (currentBit!7263 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3497 (buf!3955 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7268 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7263 thiss!1602)))))))

(assert (=> d!54265 d!54283))

(declare-fun d!54285 () Bool)

(assert (=> d!54285 (= (invariant!0 (currentBit!7263 thiss!1602) (currentByte!7268 thiss!1602) (size!3497 (buf!3955 thiss!1602))) (and (bvsge (currentBit!7263 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7263 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7268 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7268 thiss!1602) (size!3497 (buf!3955 thiss!1602))) (and (= (currentBit!7263 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7268 thiss!1602) (size!3497 (buf!3955 thiss!1602)))))))))

(assert (=> d!54267 d!54285))

(check-sat)
