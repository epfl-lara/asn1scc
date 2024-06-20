; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31726 () Bool)

(assert start!31726)

(declare-datatypes ((array!7375 0))(
  ( (array!7376 (arr!4269 (Array (_ BitVec 32) (_ BitVec 8))) (size!3348 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5864 0))(
  ( (BitStream!5865 (buf!3806 array!7375) (currentByte!6994 (_ BitVec 32)) (currentBit!6989 (_ BitVec 32))) )
))
(declare-fun b1!99 () BitStream!5864)

(declare-fun buf!77 () array!7375)

(declare-fun bytes!14 () (_ BitVec 32))

(assert (=> start!31726 (and (= (size!3348 (buf!3806 b1!99)) (size!3348 buf!77)) (bvsge bytes!14 #b00000000000000000000000000000000) (or (bvsgt ((_ sign_extend 32) (size!3348 (buf!3806 b1!99))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!6994 b1!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!6989 b1!99)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun e!107728 () Bool)

(declare-fun inv!12 (BitStream!5864) Bool)

(assert (=> start!31726 (and (inv!12 b1!99) e!107728)))

(declare-fun array_inv!3095 (array!7375) Bool)

(assert (=> start!31726 (array_inv!3095 buf!77)))

(assert (=> start!31726 true))

(declare-fun b!158478 () Bool)

(assert (=> b!158478 (= e!107728 (array_inv!3095 (buf!3806 b1!99)))))

(assert (= start!31726 b!158478))

(declare-fun m!248947 () Bool)

(assert (=> start!31726 m!248947))

(declare-fun m!248949 () Bool)

(assert (=> start!31726 m!248949))

(declare-fun m!248951 () Bool)

(assert (=> b!158478 m!248951))

(push 1)

(assert (not b!158478))

(assert (not start!31726))

(check-sat)

(pop 1)

(push 1)

(check-sat)

