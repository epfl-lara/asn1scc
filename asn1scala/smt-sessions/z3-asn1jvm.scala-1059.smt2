; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30440 () Bool)

(assert start!30440)

(declare-datatypes ((array!7060 0))(
  ( (array!7061 (arr!3996 (Array (_ BitVec 32) (_ BitVec 8))) (size!3173 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5604 0))(
  ( (BitStream!5605 (buf!3676 array!7060) (currentByte!6731 (_ BitVec 32)) (currentBit!6726 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5604)

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-fun arr!153 () array!7060)

(assert (=> start!30440 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3173 arr!153)) (or (bvsgt ((_ sign_extend 32) (size!3173 (buf!3676 bs!65))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!6731 bs!65)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!6726 bs!65)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!30440 true))

(declare-fun array_inv!2962 (array!7060) Bool)

(assert (=> start!30440 (array_inv!2962 arr!153)))

(declare-fun e!104839 () Bool)

(declare-fun inv!12 (BitStream!5604) Bool)

(assert (=> start!30440 (and (inv!12 bs!65) e!104839)))

(declare-fun b!155605 () Bool)

(assert (=> b!155605 (= e!104839 (array_inv!2962 (buf!3676 bs!65)))))

(assert (= start!30440 b!155605))

(declare-fun m!241729 () Bool)

(assert (=> start!30440 m!241729))

(declare-fun m!241731 () Bool)

(assert (=> start!30440 m!241731))

(declare-fun m!241733 () Bool)

(assert (=> b!155605 m!241733))

(check-sat (not start!30440) (not b!155605))
(check-sat)
