; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45318 () Bool)

(assert start!45318)

(declare-fun i!541 () (_ BitVec 32))

(declare-fun nBits!265 () (_ BitVec 32))

(declare-datatypes ((array!10682 0))(
  ( (array!10683 (arr!5623 (Array (_ BitVec 32) (_ BitVec 8))) (size!4693 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8494 0))(
  ( (BitStream!8495 (buf!5240 array!10682) (currentByte!9839 (_ BitVec 32)) (currentBit!9834 (_ BitVec 32))) )
))
(declare-fun bs!62 () BitStream!8494)

(assert (=> start!45318 (and (bvsle #b00000000000000000000000000000000 i!541) (bvslt i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!4693 (buf!5240 bs!62))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!9839 bs!62)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!9834 bs!62)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!4693 (buf!5240 bs!62))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!9839 bs!62)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!9834 bs!62)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!45318 true))

(declare-fun e!149357 () Bool)

(declare-fun inv!12 (BitStream!8494) Bool)

(assert (=> start!45318 (and (inv!12 bs!62) e!149357)))

(declare-fun b!219978 () Bool)

(declare-fun array_inv!4434 (array!10682) Bool)

(assert (=> b!219978 (= e!149357 (array_inv!4434 (buf!5240 bs!62)))))

(assert (= start!45318 b!219978))

(declare-fun m!338715 () Bool)

(assert (=> start!45318 m!338715))

(declare-fun m!338717 () Bool)

(assert (=> b!219978 m!338717))

(push 1)

(assert (not b!219978))

(assert (not start!45318))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!74031 () Bool)

(assert (=> d!74031 (= (array_inv!4434 (buf!5240 bs!62)) (bvsge (size!4693 (buf!5240 bs!62)) #b00000000000000000000000000000000))))

(assert (=> b!219978 d!74031))

(declare-fun d!74033 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!74033 (= (inv!12 bs!62) (invariant!0 (currentBit!9834 bs!62) (currentByte!9839 bs!62) (size!4693 (buf!5240 bs!62))))))

