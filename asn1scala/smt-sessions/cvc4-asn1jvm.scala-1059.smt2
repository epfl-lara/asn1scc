; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30442 () Bool)

(assert start!30442)

(declare-datatypes ((array!7062 0))(
  ( (array!7063 (arr!3997 (Array (_ BitVec 32) (_ BitVec 8))) (size!3174 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5606 0))(
  ( (BitStream!5607 (buf!3677 array!7062) (currentByte!6732 (_ BitVec 32)) (currentBit!6727 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5606)

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-fun arr!153 () array!7062)

(assert (=> start!30442 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3174 arr!153)) (or (bvsgt ((_ sign_extend 32) (size!3174 (buf!3677 bs!65))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!6732 bs!65)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!6727 bs!65)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!30442 true))

(declare-fun array_inv!2963 (array!7062) Bool)

(assert (=> start!30442 (array_inv!2963 arr!153)))

(declare-fun e!104848 () Bool)

(declare-fun inv!12 (BitStream!5606) Bool)

(assert (=> start!30442 (and (inv!12 bs!65) e!104848)))

(declare-fun b!155608 () Bool)

(assert (=> b!155608 (= e!104848 (array_inv!2963 (buf!3677 bs!65)))))

(assert (= start!30442 b!155608))

(declare-fun m!241735 () Bool)

(assert (=> start!30442 m!241735))

(declare-fun m!241737 () Bool)

(assert (=> start!30442 m!241737))

(declare-fun m!241739 () Bool)

(assert (=> b!155608 m!241739))

(push 1)

(assert (not start!30442))

(assert (not b!155608))

(check-sat)

(pop 1)

(push 1)

(check-sat)

