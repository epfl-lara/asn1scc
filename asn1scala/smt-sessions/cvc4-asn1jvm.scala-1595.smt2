; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45338 () Bool)

(assert start!45338)

(declare-fun res!185348 () Bool)

(declare-fun e!149395 () Bool)

(assert (=> start!45338 (=> (not res!185348) (not e!149395))))

(declare-fun nBits!265 () (_ BitVec 32))

(declare-fun i!541 () (_ BitVec 32))

(declare-datatypes ((array!10694 0))(
  ( (array!10695 (arr!5628 (Array (_ BitVec 32) (_ BitVec 8))) (size!4698 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8504 0))(
  ( (BitStream!8505 (buf!5245 array!10694) (currentByte!9845 (_ BitVec 32)) (currentBit!9840 (_ BitVec 32))) )
))
(declare-fun bs!62 () BitStream!8504)

(assert (=> start!45338 (= res!185348 (and (bvsle #b00000000000000000000000000000000 i!541) (bvslt i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!4698 (buf!5245 bs!62))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!9845 bs!62)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!9840 bs!62)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!4698 (buf!5245 bs!62))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!9845 bs!62)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!9840 bs!62)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!45338 e!149395))

(assert (=> start!45338 true))

(declare-fun e!149396 () Bool)

(declare-fun inv!12 (BitStream!8504) Bool)

(assert (=> start!45338 (and (inv!12 bs!62) e!149396)))

(declare-fun b!220001 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!220001 (= e!149395 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!9840 bs!62))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!9845 bs!62))) ((_ extract 31 0) ((_ sign_extend 32) (size!4698 (buf!5245 bs!62)))))))))

(declare-fun b!220002 () Bool)

(declare-fun array_inv!4439 (array!10694) Bool)

(assert (=> b!220002 (= e!149396 (array_inv!4439 (buf!5245 bs!62)))))

(assert (= (and start!45338 res!185348) b!220001))

(assert (= start!45338 b!220002))

(declare-fun m!338743 () Bool)

(assert (=> start!45338 m!338743))

(declare-fun m!338745 () Bool)

(assert (=> b!220001 m!338745))

(declare-fun m!338747 () Bool)

(assert (=> b!220002 m!338747))

(push 1)

(assert (not start!45338))

(assert (not b!220001))

(assert (not b!220002))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!74047 () Bool)

(assert (=> d!74047 (= (inv!12 bs!62) (invariant!0 (currentBit!9840 bs!62) (currentByte!9845 bs!62) (size!4698 (buf!5245 bs!62))))))

(declare-fun bs!18093 () Bool)

(assert (= bs!18093 d!74047))

(declare-fun m!338751 () Bool)

(assert (=> bs!18093 m!338751))

(assert (=> start!45338 d!74047))

(declare-fun d!74051 () Bool)

(assert (=> d!74051 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!9840 bs!62))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!9845 bs!62))) ((_ extract 31 0) ((_ sign_extend 32) (size!4698 (buf!5245 bs!62))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!9840 bs!62))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!9840 bs!62))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!9845 bs!62))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!9845 bs!62))) ((_ extract 31 0) ((_ sign_extend 32) (size!4698 (buf!5245 bs!62))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!9840 bs!62))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!9845 bs!62))) ((_ extract 31 0) ((_ sign_extend 32) (size!4698 (buf!5245 bs!62)))))))))))

