; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31806 () Bool)

(assert start!31806)

(declare-fun res!132446 () Bool)

(declare-fun e!107886 () Bool)

(assert (=> start!31806 (=> (not res!132446) (not e!107886))))

(declare-datatypes ((array!7411 0))(
  ( (array!7412 (arr!4283 (Array (_ BitVec 32) (_ BitVec 8))) (size!3362 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5892 0))(
  ( (BitStream!5893 (buf!3820 array!7411) (currentByte!7017 (_ BitVec 32)) (currentBit!7012 (_ BitVec 32))) )
))
(declare-fun b1!99 () BitStream!5892)

(declare-fun bytes!14 () (_ BitVec 32))

(declare-fun buf!77 () array!7411)

(assert (=> start!31806 (= res!132446 (and (= (size!3362 (buf!3820 b1!99)) (size!3362 buf!77)) (bvsge bytes!14 #b00000000000000000000000000000000)))))

(assert (=> start!31806 e!107886))

(declare-fun e!107889 () Bool)

(declare-fun inv!12 (BitStream!5892) Bool)

(assert (=> start!31806 (and (inv!12 b1!99) e!107889)))

(declare-fun array_inv!3109 (array!7411) Bool)

(assert (=> start!31806 (array_inv!3109 buf!77)))

(assert (=> start!31806 true))

(declare-fun b!158581 () Bool)

(declare-fun res!132445 () Bool)

(assert (=> b!158581 (=> (not res!132445) (not e!107886))))

(assert (=> b!158581 (= res!132445 (and (bvsle ((_ sign_extend 32) (size!3362 buf!77)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!7017 b1!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!7012 b1!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!3362 buf!77)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!7017 b1!99)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!7012 b1!99)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!158580 () Bool)

(declare-fun res!132444 () Bool)

(assert (=> b!158580 (=> (not res!132444) (not e!107886))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!158580 (= res!132444 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3362 (buf!3820 b1!99))) ((_ sign_extend 32) (currentByte!7017 b1!99)) ((_ sign_extend 32) (currentBit!7012 b1!99)) bytes!14))))

(declare-fun b!158583 () Bool)

(assert (=> b!158583 (= e!107889 (array_inv!3109 (buf!3820 b1!99)))))

(declare-fun b!158582 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!158582 (= e!107886 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!7012 b1!99))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!7017 b1!99))) ((_ extract 31 0) ((_ sign_extend 32) (size!3362 buf!77))))))))

(assert (= (and start!31806 res!132446) b!158580))

(assert (= (and b!158580 res!132444) b!158581))

(assert (= (and b!158581 res!132445) b!158582))

(assert (= start!31806 b!158583))

(declare-fun m!249075 () Bool)

(assert (=> start!31806 m!249075))

(declare-fun m!249077 () Bool)

(assert (=> start!31806 m!249077))

(declare-fun m!249079 () Bool)

(assert (=> b!158580 m!249079))

(declare-fun m!249081 () Bool)

(assert (=> b!158583 m!249081))

(declare-fun m!249083 () Bool)

(assert (=> b!158582 m!249083))

(check-sat (not b!158582) (not start!31806) (not b!158583) (not b!158580))
(check-sat)
(get-model)

(declare-fun d!53209 () Bool)

(assert (=> d!53209 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!7012 b1!99))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!7017 b1!99))) ((_ extract 31 0) ((_ sign_extend 32) (size!3362 buf!77)))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!7012 b1!99))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!7012 b1!99))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!7017 b1!99))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!7017 b1!99))) ((_ extract 31 0) ((_ sign_extend 32) (size!3362 buf!77)))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!7012 b1!99))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!7017 b1!99))) ((_ extract 31 0) ((_ sign_extend 32) (size!3362 buf!77))))))))))

(assert (=> b!158582 d!53209))

(declare-fun d!53211 () Bool)

(assert (=> d!53211 (= (inv!12 b1!99) (invariant!0 (currentBit!7012 b1!99) (currentByte!7017 b1!99) (size!3362 (buf!3820 b1!99))))))

(declare-fun bs!13124 () Bool)

(assert (= bs!13124 d!53211))

(declare-fun m!249095 () Bool)

(assert (=> bs!13124 m!249095))

(assert (=> start!31806 d!53211))

(declare-fun d!53213 () Bool)

(assert (=> d!53213 (= (array_inv!3109 buf!77) (bvsge (size!3362 buf!77) #b00000000000000000000000000000000))))

(assert (=> start!31806 d!53213))

(declare-fun d!53215 () Bool)

(assert (=> d!53215 (= (array_inv!3109 (buf!3820 b1!99)) (bvsge (size!3362 (buf!3820 b1!99)) #b00000000000000000000000000000000))))

(assert (=> b!158583 d!53215))

(declare-fun d!53221 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!53221 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3362 (buf!3820 b1!99))) ((_ sign_extend 32) (currentByte!7017 b1!99)) ((_ sign_extend 32) (currentBit!7012 b1!99)) bytes!14) (bvsle ((_ sign_extend 32) bytes!14) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3362 (buf!3820 b1!99))) ((_ sign_extend 32) (currentByte!7017 b1!99)) ((_ sign_extend 32) (currentBit!7012 b1!99))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!13127 () Bool)

(assert (= bs!13127 d!53221))

(declare-fun m!249101 () Bool)

(assert (=> bs!13127 m!249101))

(assert (=> b!158580 d!53221))

(check-sat (not d!53211) (not d!53221))
