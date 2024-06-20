; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30482 () Bool)

(assert start!30482)

(declare-fun res!130186 () Bool)

(declare-fun e!104946 () Bool)

(assert (=> start!30482 (=> (not res!130186) (not e!104946))))

(declare-datatypes ((array!7084 0))(
  ( (array!7085 (arr!4006 (Array (_ BitVec 32) (_ BitVec 8))) (size!3183 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5624 0))(
  ( (BitStream!5625 (buf!3686 array!7084) (currentByte!6744 (_ BitVec 32)) (currentBit!6739 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5624)

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-fun arr!153 () array!7084)

(assert (=> start!30482 (= res!130186 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3183 arr!153)) (bvsle ((_ sign_extend 32) (size!3183 (buf!3686 bs!65))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!6744 bs!65)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!6739 bs!65)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!3183 (buf!3686 bs!65))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!6744 bs!65)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!6739 bs!65)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!30482 e!104946))

(assert (=> start!30482 true))

(declare-fun array_inv!2972 (array!7084) Bool)

(assert (=> start!30482 (array_inv!2972 arr!153)))

(declare-fun e!104948 () Bool)

(declare-fun inv!12 (BitStream!5624) Bool)

(assert (=> start!30482 (and (inv!12 bs!65) e!104948)))

(declare-fun b!155660 () Bool)

(declare-fun res!130187 () Bool)

(assert (=> b!155660 (=> (not res!130187) (not e!104946))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!155660 (= res!130187 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!6739 bs!65))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!6744 bs!65))) ((_ extract 31 0) ((_ sign_extend 32) (size!3183 (buf!3686 bs!65))))))))

(declare-fun b!155661 () Bool)

(assert (=> b!155661 (= e!104946 (bvslt (bvsub to!236 from!240) #b00000000000000000000000000000000))))

(declare-fun b!155662 () Bool)

(assert (=> b!155662 (= e!104948 (array_inv!2972 (buf!3686 bs!65)))))

(assert (= (and start!30482 res!130186) b!155660))

(assert (= (and b!155660 res!130187) b!155661))

(assert (= start!30482 b!155662))

(declare-fun m!241807 () Bool)

(assert (=> start!30482 m!241807))

(declare-fun m!241809 () Bool)

(assert (=> start!30482 m!241809))

(declare-fun m!241811 () Bool)

(assert (=> b!155660 m!241811))

(declare-fun m!241813 () Bool)

(assert (=> b!155662 m!241813))

(push 1)

(assert (not b!155660))

(assert (not start!30482))

(assert (not b!155662))

(check-sat)

(pop 1)

(push 1)

(check-sat)

