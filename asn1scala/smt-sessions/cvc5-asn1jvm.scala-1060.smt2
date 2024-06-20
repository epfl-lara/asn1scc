; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30444 () Bool)

(assert start!30444)

(declare-datatypes ((array!7064 0))(
  ( (array!7065 (arr!3998 (Array (_ BitVec 32) (_ BitVec 8))) (size!3175 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5608 0))(
  ( (BitStream!5609 (buf!3678 array!7064) (currentByte!6733 (_ BitVec 32)) (currentBit!6728 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5608)

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-fun arr!153 () array!7064)

(assert (=> start!30444 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3175 arr!153)) (bvsle ((_ sign_extend 32) (size!3175 (buf!3678 bs!65))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!6733 bs!65)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!6728 bs!65)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!3175 (buf!3678 bs!65))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!6733 bs!65)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!6728 bs!65)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!30444 true))

(declare-fun array_inv!2964 (array!7064) Bool)

(assert (=> start!30444 (array_inv!2964 arr!153)))

(declare-fun e!104857 () Bool)

(declare-fun inv!12 (BitStream!5608) Bool)

(assert (=> start!30444 (and (inv!12 bs!65) e!104857)))

(declare-fun b!155611 () Bool)

(assert (=> b!155611 (= e!104857 (array_inv!2964 (buf!3678 bs!65)))))

(assert (= start!30444 b!155611))

(declare-fun m!241741 () Bool)

(assert (=> start!30444 m!241741))

(declare-fun m!241743 () Bool)

(assert (=> start!30444 m!241743))

(declare-fun m!241745 () Bool)

(assert (=> b!155611 m!241745))

(push 1)

(assert (not start!30444))

(assert (not b!155611))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!51484 () Bool)

(assert (=> d!51484 (= (array_inv!2964 arr!153) (bvsge (size!3175 arr!153) #b00000000000000000000000000000000))))

(assert (=> start!30444 d!51484))

(declare-fun d!51486 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!51486 (= (inv!12 bs!65) (invariant!0 (currentBit!6728 bs!65) (currentByte!6733 bs!65) (size!3175 (buf!3678 bs!65))))))

