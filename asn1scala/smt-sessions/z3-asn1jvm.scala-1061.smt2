; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30462 () Bool)

(assert start!30462)

(declare-fun res!130166 () Bool)

(declare-fun e!104897 () Bool)

(assert (=> start!30462 (=> (not res!130166) (not e!104897))))

(declare-datatypes ((array!7074 0))(
  ( (array!7075 (arr!4002 (Array (_ BitVec 32) (_ BitVec 8))) (size!3179 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5616 0))(
  ( (BitStream!5617 (buf!3682 array!7074) (currentByte!6738 (_ BitVec 32)) (currentBit!6733 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5616)

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-fun arr!153 () array!7074)

(assert (=> start!30462 (= res!130166 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3179 arr!153)) (bvsle ((_ sign_extend 32) (size!3179 (buf!3682 bs!65))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!6738 bs!65)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!6733 bs!65)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!3179 (buf!3682 bs!65))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!6738 bs!65)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!6733 bs!65)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!30462 e!104897))

(assert (=> start!30462 true))

(declare-fun array_inv!2968 (array!7074) Bool)

(assert (=> start!30462 (array_inv!2968 arr!153)))

(declare-fun e!104898 () Bool)

(declare-fun inv!12 (BitStream!5616) Bool)

(assert (=> start!30462 (and (inv!12 bs!65) e!104898)))

(declare-fun b!155628 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!155628 (= e!104897 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!6733 bs!65))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!6738 bs!65))) ((_ extract 31 0) ((_ sign_extend 32) (size!3179 (buf!3682 bs!65)))))))))

(declare-fun b!155629 () Bool)

(assert (=> b!155629 (= e!104898 (array_inv!2968 (buf!3682 bs!65)))))

(assert (= (and start!30462 res!130166) b!155628))

(assert (= start!30462 b!155629))

(declare-fun m!241771 () Bool)

(assert (=> start!30462 m!241771))

(declare-fun m!241773 () Bool)

(assert (=> start!30462 m!241773))

(declare-fun m!241775 () Bool)

(assert (=> b!155628 m!241775))

(declare-fun m!241777 () Bool)

(assert (=> b!155629 m!241777))

(check-sat (not b!155628) (not b!155629) (not start!30462))
(check-sat)
(get-model)

(declare-fun d!51492 () Bool)

(assert (=> d!51492 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!6733 bs!65))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!6738 bs!65))) ((_ extract 31 0) ((_ sign_extend 32) (size!3179 (buf!3682 bs!65))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!6733 bs!65))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!6733 bs!65))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!6738 bs!65))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!6738 bs!65))) ((_ extract 31 0) ((_ sign_extend 32) (size!3179 (buf!3682 bs!65))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!6733 bs!65))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!6738 bs!65))) ((_ extract 31 0) ((_ sign_extend 32) (size!3179 (buf!3682 bs!65)))))))))))

(assert (=> b!155628 d!51492))

(declare-fun d!51496 () Bool)

(assert (=> d!51496 (= (array_inv!2968 (buf!3682 bs!65)) (bvsge (size!3179 (buf!3682 bs!65)) #b00000000000000000000000000000000))))

(assert (=> b!155629 d!51496))

(declare-fun d!51500 () Bool)

(assert (=> d!51500 (= (array_inv!2968 arr!153) (bvsge (size!3179 arr!153) #b00000000000000000000000000000000))))

(assert (=> start!30462 d!51500))

(declare-fun d!51504 () Bool)

(assert (=> d!51504 (= (inv!12 bs!65) (invariant!0 (currentBit!6733 bs!65) (currentByte!6738 bs!65) (size!3179 (buf!3682 bs!65))))))

(declare-fun bs!12587 () Bool)

(assert (= bs!12587 d!51504))

(declare-fun m!241789 () Bool)

(assert (=> bs!12587 m!241789))

(assert (=> start!30462 d!51504))

(check-sat (not d!51504))
(check-sat)
