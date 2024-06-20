; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30438 () Bool)

(assert start!30438)

(declare-datatypes ((array!7058 0))(
  ( (array!7059 (arr!3995 (Array (_ BitVec 32) (_ BitVec 8))) (size!3172 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5602 0))(
  ( (BitStream!5603 (buf!3675 array!7058) (currentByte!6730 (_ BitVec 32)) (currentBit!6725 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5602)

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-fun arr!153 () array!7058)

(assert (=> start!30438 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3172 arr!153)) (or (bvsgt ((_ sign_extend 32) (size!3172 (buf!3675 bs!65))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!6730 bs!65)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!6725 bs!65)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!30438 true))

(declare-fun array_inv!2961 (array!7058) Bool)

(assert (=> start!30438 (array_inv!2961 arr!153)))

(declare-fun e!104830 () Bool)

(declare-fun inv!12 (BitStream!5602) Bool)

(assert (=> start!30438 (and (inv!12 bs!65) e!104830)))

(declare-fun b!155602 () Bool)

(assert (=> b!155602 (= e!104830 (array_inv!2961 (buf!3675 bs!65)))))

(assert (= start!30438 b!155602))

(declare-fun m!241723 () Bool)

(assert (=> start!30438 m!241723))

(declare-fun m!241725 () Bool)

(assert (=> start!30438 m!241725))

(declare-fun m!241727 () Bool)

(assert (=> b!155602 m!241727))

(push 1)

(assert (not start!30438))

(assert (not b!155602))

(check-sat)

(pop 1)

(push 1)

(check-sat)

