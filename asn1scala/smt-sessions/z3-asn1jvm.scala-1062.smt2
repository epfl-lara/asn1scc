; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30480 () Bool)

(assert start!30480)

(declare-fun res!130180 () Bool)

(declare-fun e!104934 () Bool)

(assert (=> start!30480 (=> (not res!130180) (not e!104934))))

(declare-datatypes ((array!7082 0))(
  ( (array!7083 (arr!4005 (Array (_ BitVec 32) (_ BitVec 8))) (size!3182 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5622 0))(
  ( (BitStream!5623 (buf!3685 array!7082) (currentByte!6743 (_ BitVec 32)) (currentBit!6738 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5622)

(declare-fun from!240 () (_ BitVec 32))

(declare-fun arr!153 () array!7082)

(declare-fun to!236 () (_ BitVec 32))

(assert (=> start!30480 (= res!130180 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3182 arr!153)) (bvsle ((_ sign_extend 32) (size!3182 (buf!3685 bs!65))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!6743 bs!65)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!6738 bs!65)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!3182 (buf!3685 bs!65))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!6743 bs!65)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!6738 bs!65)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!30480 e!104934))

(assert (=> start!30480 true))

(declare-fun array_inv!2971 (array!7082) Bool)

(assert (=> start!30480 (array_inv!2971 arr!153)))

(declare-fun e!104936 () Bool)

(declare-fun inv!12 (BitStream!5622) Bool)

(assert (=> start!30480 (and (inv!12 bs!65) e!104936)))

(declare-fun b!155651 () Bool)

(declare-fun res!130181 () Bool)

(assert (=> b!155651 (=> (not res!130181) (not e!104934))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!155651 (= res!130181 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!6738 bs!65))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!6743 bs!65))) ((_ extract 31 0) ((_ sign_extend 32) (size!3182 (buf!3685 bs!65))))))))

(declare-fun b!155652 () Bool)

(assert (=> b!155652 (= e!104934 (bvslt (bvsub to!236 from!240) #b00000000000000000000000000000000))))

(declare-fun b!155653 () Bool)

(assert (=> b!155653 (= e!104936 (array_inv!2971 (buf!3685 bs!65)))))

(assert (= (and start!30480 res!130180) b!155651))

(assert (= (and b!155651 res!130181) b!155652))

(assert (= start!30480 b!155653))

(declare-fun m!241799 () Bool)

(assert (=> start!30480 m!241799))

(declare-fun m!241801 () Bool)

(assert (=> start!30480 m!241801))

(declare-fun m!241803 () Bool)

(assert (=> b!155651 m!241803))

(declare-fun m!241805 () Bool)

(assert (=> b!155653 m!241805))

(check-sat (not b!155651) (not start!30480) (not b!155653))
(check-sat)
