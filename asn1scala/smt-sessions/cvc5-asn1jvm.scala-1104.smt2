; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31728 () Bool)

(assert start!31728)

(declare-datatypes ((array!7377 0))(
  ( (array!7378 (arr!4270 (Array (_ BitVec 32) (_ BitVec 8))) (size!3349 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5866 0))(
  ( (BitStream!5867 (buf!3807 array!7377) (currentByte!6995 (_ BitVec 32)) (currentBit!6990 (_ BitVec 32))) )
))
(declare-fun b1!99 () BitStream!5866)

(declare-fun buf!77 () array!7377)

(declare-fun bytes!14 () (_ BitVec 32))

(assert (=> start!31728 (and (= (size!3349 (buf!3807 b1!99)) (size!3349 buf!77)) (bvsge bytes!14 #b00000000000000000000000000000000) (bvsle ((_ sign_extend 32) (size!3349 (buf!3807 b1!99))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!6995 b1!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!6990 b1!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!3349 (buf!3807 b1!99))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!6995 b1!99)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!6990 b1!99)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!107737 () Bool)

(declare-fun inv!12 (BitStream!5866) Bool)

(assert (=> start!31728 (and (inv!12 b1!99) e!107737)))

(declare-fun array_inv!3096 (array!7377) Bool)

(assert (=> start!31728 (array_inv!3096 buf!77)))

(assert (=> start!31728 true))

(declare-fun b!158481 () Bool)

(assert (=> b!158481 (= e!107737 (array_inv!3096 (buf!3807 b1!99)))))

(assert (= start!31728 b!158481))

(declare-fun m!248953 () Bool)

(assert (=> start!31728 m!248953))

(declare-fun m!248955 () Bool)

(assert (=> start!31728 m!248955))

(declare-fun m!248957 () Bool)

(assert (=> b!158481 m!248957))

(push 1)

(assert (not b!158481))

(assert (not start!31728))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!53139 () Bool)

(assert (=> d!53139 (= (array_inv!3096 (buf!3807 b1!99)) (bvsge (size!3349 (buf!3807 b1!99)) #b00000000000000000000000000000000))))

(assert (=> b!158481 d!53139))

(declare-fun d!53141 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!53141 (= (inv!12 b1!99) (invariant!0 (currentBit!6990 b1!99) (currentByte!6995 b1!99) (size!3349 (buf!3807 b1!99))))))

(declare-fun bs!13102 () Bool)

(assert (= bs!13102 d!53141))

(declare-fun m!248973 () Bool)

(assert (=> bs!13102 m!248973))

(assert (=> start!31728 d!53141))

(declare-fun d!53143 () Bool)

(assert (=> d!53143 (= (array_inv!3096 buf!77) (bvsge (size!3349 buf!77) #b00000000000000000000000000000000))))

(assert (=> start!31728 d!53143))

(push 1)

(assert (not d!53141))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

