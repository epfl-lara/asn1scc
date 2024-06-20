; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30448 () Bool)

(assert start!30448)

(declare-datatypes ((array!7068 0))(
  ( (array!7069 (arr!4000 (Array (_ BitVec 32) (_ BitVec 8))) (size!3177 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5612 0))(
  ( (BitStream!5613 (buf!3680 array!7068) (currentByte!6735 (_ BitVec 32)) (currentBit!6730 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5612)

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-fun arr!153 () array!7068)

(assert (=> start!30448 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3177 arr!153)) (bvsle ((_ sign_extend 32) (size!3177 (buf!3680 bs!65))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!6735 bs!65)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!6730 bs!65)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!3177 (buf!3680 bs!65))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!6735 bs!65)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!6730 bs!65)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!30448 true))

(declare-fun array_inv!2966 (array!7068) Bool)

(assert (=> start!30448 (array_inv!2966 arr!153)))

(declare-fun e!104875 () Bool)

(declare-fun inv!12 (BitStream!5612) Bool)

(assert (=> start!30448 (and (inv!12 bs!65) e!104875)))

(declare-fun b!155617 () Bool)

(assert (=> b!155617 (= e!104875 (array_inv!2966 (buf!3680 bs!65)))))

(assert (= start!30448 b!155617))

(declare-fun m!241753 () Bool)

(assert (=> start!30448 m!241753))

(declare-fun m!241755 () Bool)

(assert (=> start!30448 m!241755))

(declare-fun m!241757 () Bool)

(assert (=> b!155617 m!241757))

(push 1)

(assert (not start!30448))

(assert (not b!155617))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

