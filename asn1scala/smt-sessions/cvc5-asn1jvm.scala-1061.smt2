; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30460 () Bool)

(assert start!30460)

(declare-fun res!130163 () Bool)

(declare-fun e!104885 () Bool)

(assert (=> start!30460 (=> (not res!130163) (not e!104885))))

(declare-datatypes ((array!7072 0))(
  ( (array!7073 (arr!4001 (Array (_ BitVec 32) (_ BitVec 8))) (size!3178 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5614 0))(
  ( (BitStream!5615 (buf!3681 array!7072) (currentByte!6737 (_ BitVec 32)) (currentBit!6732 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5614)

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-fun arr!153 () array!7072)

(assert (=> start!30460 (= res!130163 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3178 arr!153)) (bvsle ((_ sign_extend 32) (size!3178 (buf!3681 bs!65))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!6737 bs!65)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!6732 bs!65)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!3178 (buf!3681 bs!65))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!6737 bs!65)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!6732 bs!65)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!30460 e!104885))

(assert (=> start!30460 true))

(declare-fun array_inv!2967 (array!7072) Bool)

(assert (=> start!30460 (array_inv!2967 arr!153)))

(declare-fun e!104886 () Bool)

(declare-fun inv!12 (BitStream!5614) Bool)

(assert (=> start!30460 (and (inv!12 bs!65) e!104886)))

(declare-fun b!155622 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!155622 (= e!104885 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!6732 bs!65))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!6737 bs!65))) ((_ extract 31 0) ((_ sign_extend 32) (size!3178 (buf!3681 bs!65)))))))))

(declare-fun b!155623 () Bool)

(assert (=> b!155623 (= e!104886 (array_inv!2967 (buf!3681 bs!65)))))

(assert (= (and start!30460 res!130163) b!155622))

(assert (= start!30460 b!155623))

(declare-fun m!241763 () Bool)

(assert (=> start!30460 m!241763))

(declare-fun m!241765 () Bool)

(assert (=> start!30460 m!241765))

(declare-fun m!241767 () Bool)

(assert (=> b!155622 m!241767))

(declare-fun m!241769 () Bool)

(assert (=> b!155623 m!241769))

(push 1)

(assert (not b!155622))

(assert (not start!30460))

(assert (not b!155623))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!51494 () Bool)

(assert (=> d!51494 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!6732 bs!65))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!6737 bs!65))) ((_ extract 31 0) ((_ sign_extend 32) (size!3178 (buf!3681 bs!65))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!6732 bs!65))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!6732 bs!65))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!6737 bs!65))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!6737 bs!65))) ((_ extract 31 0) ((_ sign_extend 32) (size!3178 (buf!3681 bs!65))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!6732 bs!65))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!6737 bs!65))) ((_ extract 31 0) ((_ sign_extend 32) (size!3178 (buf!3681 bs!65)))))))))))

(assert (=> b!155622 d!51494))

(declare-fun d!51498 () Bool)

(assert (=> d!51498 (= (array_inv!2967 arr!153) (bvsge (size!3178 arr!153) #b00000000000000000000000000000000))))

(assert (=> start!30460 d!51498))

(declare-fun d!51502 () Bool)

(assert (=> d!51502 (= (inv!12 bs!65) (invariant!0 (currentBit!6732 bs!65) (currentByte!6737 bs!65) (size!3178 (buf!3681 bs!65))))))

(declare-fun bs!12586 () Bool)

(assert (= bs!12586 d!51502))

(declare-fun m!241787 () Bool)

(assert (=> bs!12586 m!241787))

(assert (=> start!30460 d!51502))

(declare-fun d!51506 () Bool)

(assert (=> d!51506 (= (array_inv!2967 (buf!3681 bs!65)) (bvsge (size!3178 (buf!3681 bs!65)) #b00000000000000000000000000000000))))

(assert (=> b!155623 d!51506))

(push 1)

(assert (not d!51502))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

