; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36972 () Bool)

(assert start!36972)

(declare-fun res!140372 () Bool)

(declare-fun e!117283 () Bool)

(assert (=> start!36972 (=> (not res!140372) (not e!117283))))

(declare-fun nBits!600 () (_ BitVec 32))

(assert (=> start!36972 (= res!140372 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000)))))

(assert (=> start!36972 e!117283))

(assert (=> start!36972 true))

(declare-datatypes ((array!8825 0))(
  ( (array!8826 (arr!4832 (Array (_ BitVec 32) (_ BitVec 8))) (size!3911 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6978 0))(
  ( (BitStream!6979 (buf!4363 array!8825) (currentByte!8293 (_ BitVec 32)) (currentBit!8288 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!6978)

(declare-fun e!117285 () Bool)

(declare-fun inv!12 (BitStream!6978) Bool)

(assert (=> start!36972 (and (inv!12 thiss!1894) e!117285)))

(declare-fun b!168724 () Bool)

(declare-fun res!140371 () Bool)

(assert (=> b!168724 (=> (not res!140371) (not e!117283))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!168724 (= res!140371 (validate_offset_bits!1 ((_ sign_extend 32) (size!3911 (buf!4363 thiss!1894))) ((_ sign_extend 32) (currentByte!8293 thiss!1894)) ((_ sign_extend 32) (currentBit!8288 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(declare-fun b!168725 () Bool)

(assert (=> b!168725 (= e!117283 (and (bvsgt (bvadd (currentBit!8288 thiss!1894) nBits!600) #b00000000000000000000000000001000) (bvsle (bvsub (bvadd (currentBit!8288 thiss!1894) nBits!600) #b00000000000000000000000000001000) #b00000000000000000000000000100000) (or (bvslt (currentByte!8293 thiss!1894) #b00000000000000000000000000000000) (bvsge (currentByte!8293 thiss!1894) (size!3911 (buf!4363 thiss!1894))))))))

(declare-fun b!168726 () Bool)

(declare-fun array_inv!3652 (array!8825) Bool)

(assert (=> b!168726 (= e!117285 (array_inv!3652 (buf!4363 thiss!1894)))))

(assert (= (and start!36972 res!140372) b!168724))

(assert (= (and b!168724 res!140371) b!168725))

(assert (= start!36972 b!168726))

(declare-fun m!268305 () Bool)

(assert (=> start!36972 m!268305))

(declare-fun m!268307 () Bool)

(assert (=> b!168724 m!268307))

(declare-fun m!268309 () Bool)

(assert (=> b!168726 m!268309))

(check-sat (not b!168724) (not b!168726) (not start!36972))
(check-sat)
(get-model)

(declare-fun d!59537 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!59537 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3911 (buf!4363 thiss!1894))) ((_ sign_extend 32) (currentByte!8293 thiss!1894)) ((_ sign_extend 32) (currentBit!8288 thiss!1894)) ((_ sign_extend 32) nBits!600)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3911 (buf!4363 thiss!1894))) ((_ sign_extend 32) (currentByte!8293 thiss!1894)) ((_ sign_extend 32) (currentBit!8288 thiss!1894))) ((_ sign_extend 32) nBits!600)))))

(declare-fun bs!14754 () Bool)

(assert (= bs!14754 d!59537))

(declare-fun m!268317 () Bool)

(assert (=> bs!14754 m!268317))

(assert (=> b!168724 d!59537))

(declare-fun d!59539 () Bool)

(assert (=> d!59539 (= (array_inv!3652 (buf!4363 thiss!1894)) (bvsge (size!3911 (buf!4363 thiss!1894)) #b00000000000000000000000000000000))))

(assert (=> b!168726 d!59539))

(declare-fun d!59541 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!59541 (= (inv!12 thiss!1894) (invariant!0 (currentBit!8288 thiss!1894) (currentByte!8293 thiss!1894) (size!3911 (buf!4363 thiss!1894))))))

(declare-fun bs!14755 () Bool)

(assert (= bs!14755 d!59541))

(declare-fun m!268319 () Bool)

(assert (=> bs!14755 m!268319))

(assert (=> start!36972 d!59541))

(check-sat (not d!59541) (not d!59537))
(check-sat)
(get-model)

(declare-fun d!59549 () Bool)

(assert (=> d!59549 (= (invariant!0 (currentBit!8288 thiss!1894) (currentByte!8293 thiss!1894) (size!3911 (buf!4363 thiss!1894))) (and (bvsge (currentBit!8288 thiss!1894) #b00000000000000000000000000000000) (bvslt (currentBit!8288 thiss!1894) #b00000000000000000000000000001000) (bvsge (currentByte!8293 thiss!1894) #b00000000000000000000000000000000) (or (bvslt (currentByte!8293 thiss!1894) (size!3911 (buf!4363 thiss!1894))) (and (= (currentBit!8288 thiss!1894) #b00000000000000000000000000000000) (= (currentByte!8293 thiss!1894) (size!3911 (buf!4363 thiss!1894)))))))))

(assert (=> d!59541 d!59549))

(declare-fun d!59551 () Bool)

(assert (=> d!59551 (= (remainingBits!0 ((_ sign_extend 32) (size!3911 (buf!4363 thiss!1894))) ((_ sign_extend 32) (currentByte!8293 thiss!1894)) ((_ sign_extend 32) (currentBit!8288 thiss!1894))) (bvsub (bvmul ((_ sign_extend 32) (size!3911 (buf!4363 thiss!1894))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8293 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8288 thiss!1894)))))))

(assert (=> d!59537 d!59551))

(check-sat)
