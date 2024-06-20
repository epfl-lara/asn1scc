; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30446 () Bool)

(assert start!30446)

(declare-datatypes ((array!7066 0))(
  ( (array!7067 (arr!3999 (Array (_ BitVec 32) (_ BitVec 8))) (size!3176 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5610 0))(
  ( (BitStream!5611 (buf!3679 array!7066) (currentByte!6734 (_ BitVec 32)) (currentBit!6729 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5610)

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-fun arr!153 () array!7066)

(assert (=> start!30446 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3176 arr!153)) (bvsle ((_ sign_extend 32) (size!3176 (buf!3679 bs!65))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!6734 bs!65)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!6729 bs!65)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!3176 (buf!3679 bs!65))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!6734 bs!65)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!6729 bs!65)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!30446 true))

(declare-fun array_inv!2965 (array!7066) Bool)

(assert (=> start!30446 (array_inv!2965 arr!153)))

(declare-fun e!104866 () Bool)

(declare-fun inv!12 (BitStream!5610) Bool)

(assert (=> start!30446 (and (inv!12 bs!65) e!104866)))

(declare-fun b!155614 () Bool)

(assert (=> b!155614 (= e!104866 (array_inv!2965 (buf!3679 bs!65)))))

(assert (= start!30446 b!155614))

(declare-fun m!241747 () Bool)

(assert (=> start!30446 m!241747))

(declare-fun m!241749 () Bool)

(assert (=> start!30446 m!241749))

(declare-fun m!241751 () Bool)

(assert (=> b!155614 m!241751))

(check-sat (not b!155614) (not start!30446))
(check-sat)
(get-model)

(declare-fun d!51476 () Bool)

(assert (=> d!51476 (= (array_inv!2965 (buf!3679 bs!65)) (bvsge (size!3176 (buf!3679 bs!65)) #b00000000000000000000000000000000))))

(assert (=> b!155614 d!51476))

(declare-fun d!51478 () Bool)

(assert (=> d!51478 (= (array_inv!2965 arr!153) (bvsge (size!3176 arr!153) #b00000000000000000000000000000000))))

(assert (=> start!30446 d!51478))

(declare-fun d!51480 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!51480 (= (inv!12 bs!65) (invariant!0 (currentBit!6729 bs!65) (currentByte!6734 bs!65) (size!3176 (buf!3679 bs!65))))))

(declare-fun bs!12581 () Bool)

(assert (= bs!12581 d!51480))

(declare-fun m!241759 () Bool)

(assert (=> bs!12581 m!241759))

(assert (=> start!30446 d!51480))

(check-sat (not d!51480))
(check-sat)
(get-model)

(declare-fun d!51482 () Bool)

(assert (=> d!51482 (= (invariant!0 (currentBit!6729 bs!65) (currentByte!6734 bs!65) (size!3176 (buf!3679 bs!65))) (and (bvsge (currentBit!6729 bs!65) #b00000000000000000000000000000000) (bvslt (currentBit!6729 bs!65) #b00000000000000000000000000001000) (bvsge (currentByte!6734 bs!65) #b00000000000000000000000000000000) (or (bvslt (currentByte!6734 bs!65) (size!3176 (buf!3679 bs!65))) (and (= (currentBit!6729 bs!65) #b00000000000000000000000000000000) (= (currentByte!6734 bs!65) (size!3176 (buf!3679 bs!65)))))))))

(assert (=> d!51480 d!51482))

(check-sat)
