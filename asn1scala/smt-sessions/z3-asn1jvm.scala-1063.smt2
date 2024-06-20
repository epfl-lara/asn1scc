; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30486 () Bool)

(assert start!30486)

(declare-fun res!130199 () Bool)

(declare-fun e!104972 () Bool)

(assert (=> start!30486 (=> (not res!130199) (not e!104972))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-datatypes ((array!7088 0))(
  ( (array!7089 (arr!4008 (Array (_ BitVec 32) (_ BitVec 8))) (size!3185 (_ BitVec 32))) )
))
(declare-fun arr!153 () array!7088)

(assert (=> start!30486 (= res!130199 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3185 arr!153))))))

(assert (=> start!30486 e!104972))

(assert (=> start!30486 true))

(declare-fun array_inv!2974 (array!7088) Bool)

(assert (=> start!30486 (array_inv!2974 arr!153)))

(declare-datatypes ((BitStream!5628 0))(
  ( (BitStream!5629 (buf!3688 array!7088) (currentByte!6746 (_ BitVec 32)) (currentBit!6741 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5628)

(declare-fun e!104971 () Bool)

(declare-fun inv!12 (BitStream!5628) Bool)

(assert (=> start!30486 (and (inv!12 bs!65) e!104971)))

(declare-fun b!155678 () Bool)

(declare-fun res!130198 () Bool)

(assert (=> b!155678 (=> (not res!130198) (not e!104972))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!155678 (= res!130198 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3185 (buf!3688 bs!65))) ((_ sign_extend 32) (currentByte!6746 bs!65)) ((_ sign_extend 32) (currentBit!6741 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!155679 () Bool)

(assert (=> b!155679 (= e!104972 (bvsgt from!240 to!236))))

(declare-fun b!155680 () Bool)

(assert (=> b!155680 (= e!104971 (array_inv!2974 (buf!3688 bs!65)))))

(assert (= (and start!30486 res!130199) b!155678))

(assert (= (and b!155678 res!130198) b!155679))

(assert (= start!30486 b!155680))

(declare-fun m!241823 () Bool)

(assert (=> start!30486 m!241823))

(declare-fun m!241825 () Bool)

(assert (=> start!30486 m!241825))

(declare-fun m!241827 () Bool)

(assert (=> b!155678 m!241827))

(declare-fun m!241829 () Bool)

(assert (=> b!155680 m!241829))

(check-sat (not start!30486) (not b!155680) (not b!155678))
(check-sat)
