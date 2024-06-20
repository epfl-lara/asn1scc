; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30464 () Bool)

(assert start!30464)

(declare-fun res!130169 () Bool)

(declare-fun e!104909 () Bool)

(assert (=> start!30464 (=> (not res!130169) (not e!104909))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-datatypes ((array!7076 0))(
  ( (array!7077 (arr!4003 (Array (_ BitVec 32) (_ BitVec 8))) (size!3180 (_ BitVec 32))) )
))
(declare-fun arr!153 () array!7076)

(declare-datatypes ((BitStream!5618 0))(
  ( (BitStream!5619 (buf!3683 array!7076) (currentByte!6739 (_ BitVec 32)) (currentBit!6734 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5618)

(assert (=> start!30464 (= res!130169 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3180 arr!153)) (bvsle ((_ sign_extend 32) (size!3180 (buf!3683 bs!65))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!6739 bs!65)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!6734 bs!65)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!3180 (buf!3683 bs!65))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!6739 bs!65)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!6734 bs!65)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!30464 e!104909))

(assert (=> start!30464 true))

(declare-fun array_inv!2969 (array!7076) Bool)

(assert (=> start!30464 (array_inv!2969 arr!153)))

(declare-fun e!104910 () Bool)

(declare-fun inv!12 (BitStream!5618) Bool)

(assert (=> start!30464 (and (inv!12 bs!65) e!104910)))

(declare-fun b!155634 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!155634 (= e!104909 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!6734 bs!65))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!6739 bs!65))) ((_ extract 31 0) ((_ sign_extend 32) (size!3180 (buf!3683 bs!65)))))))))

(declare-fun b!155635 () Bool)

(assert (=> b!155635 (= e!104910 (array_inv!2969 (buf!3683 bs!65)))))

(assert (= (and start!30464 res!130169) b!155634))

(assert (= start!30464 b!155635))

(declare-fun m!241779 () Bool)

(assert (=> start!30464 m!241779))

(declare-fun m!241781 () Bool)

(assert (=> start!30464 m!241781))

(declare-fun m!241783 () Bool)

(assert (=> b!155634 m!241783))

(declare-fun m!241785 () Bool)

(assert (=> b!155635 m!241785))

(push 1)

(assert (not b!155635))

(assert (not b!155634))

(assert (not start!30464))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

