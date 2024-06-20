; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31730 () Bool)

(assert start!31730)

(declare-datatypes ((array!7379 0))(
  ( (array!7380 (arr!4271 (Array (_ BitVec 32) (_ BitVec 8))) (size!3350 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5868 0))(
  ( (BitStream!5869 (buf!3808 array!7379) (currentByte!6996 (_ BitVec 32)) (currentBit!6991 (_ BitVec 32))) )
))
(declare-fun b1!99 () BitStream!5868)

(declare-fun buf!77 () array!7379)

(declare-fun bytes!14 () (_ BitVec 32))

(assert (=> start!31730 (and (= (size!3350 (buf!3808 b1!99)) (size!3350 buf!77)) (bvsge bytes!14 #b00000000000000000000000000000000) (bvsle ((_ sign_extend 32) (size!3350 (buf!3808 b1!99))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!6996 b1!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!6991 b1!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!3350 (buf!3808 b1!99))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!6996 b1!99)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!6991 b1!99)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!107746 () Bool)

(declare-fun inv!12 (BitStream!5868) Bool)

(assert (=> start!31730 (and (inv!12 b1!99) e!107746)))

(declare-fun array_inv!3097 (array!7379) Bool)

(assert (=> start!31730 (array_inv!3097 buf!77)))

(assert (=> start!31730 true))

(declare-fun b!158484 () Bool)

(assert (=> b!158484 (= e!107746 (array_inv!3097 (buf!3808 b1!99)))))

(assert (= start!31730 b!158484))

(declare-fun m!248959 () Bool)

(assert (=> start!31730 m!248959))

(declare-fun m!248961 () Bool)

(assert (=> start!31730 m!248961))

(declare-fun m!248963 () Bool)

(assert (=> b!158484 m!248963))

(check-sat (not b!158484) (not start!31730))
(check-sat)
(get-model)

(declare-fun d!53133 () Bool)

(assert (=> d!53133 (= (array_inv!3097 (buf!3808 b1!99)) (bvsge (size!3350 (buf!3808 b1!99)) #b00000000000000000000000000000000))))

(assert (=> b!158484 d!53133))

(declare-fun d!53135 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!53135 (= (inv!12 b1!99) (invariant!0 (currentBit!6991 b1!99) (currentByte!6996 b1!99) (size!3350 (buf!3808 b1!99))))))

(declare-fun bs!13101 () Bool)

(assert (= bs!13101 d!53135))

(declare-fun m!248971 () Bool)

(assert (=> bs!13101 m!248971))

(assert (=> start!31730 d!53135))

(declare-fun d!53137 () Bool)

(assert (=> d!53137 (= (array_inv!3097 buf!77) (bvsge (size!3350 buf!77) #b00000000000000000000000000000000))))

(assert (=> start!31730 d!53137))

(check-sat (not d!53135))
(check-sat)
(get-model)

(declare-fun d!53145 () Bool)

(assert (=> d!53145 (= (invariant!0 (currentBit!6991 b1!99) (currentByte!6996 b1!99) (size!3350 (buf!3808 b1!99))) (and (bvsge (currentBit!6991 b1!99) #b00000000000000000000000000000000) (bvslt (currentBit!6991 b1!99) #b00000000000000000000000000001000) (bvsge (currentByte!6996 b1!99) #b00000000000000000000000000000000) (or (bvslt (currentByte!6996 b1!99) (size!3350 (buf!3808 b1!99))) (and (= (currentBit!6991 b1!99) #b00000000000000000000000000000000) (= (currentByte!6996 b1!99) (size!3350 (buf!3808 b1!99)))))))))

(assert (=> d!53135 d!53145))

(check-sat)
