; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45334 () Bool)

(assert start!45334)

(declare-fun res!185342 () Bool)

(declare-fun e!149377 () Bool)

(assert (=> start!45334 (=> (not res!185342) (not e!149377))))

(declare-datatypes ((array!10690 0))(
  ( (array!10691 (arr!5626 (Array (_ BitVec 32) (_ BitVec 8))) (size!4696 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8500 0))(
  ( (BitStream!8501 (buf!5243 array!10690) (currentByte!9843 (_ BitVec 32)) (currentBit!9838 (_ BitVec 32))) )
))
(declare-fun bs!62 () BitStream!8500)

(declare-fun nBits!265 () (_ BitVec 32))

(declare-fun i!541 () (_ BitVec 32))

(assert (=> start!45334 (= res!185342 (and (bvsle #b00000000000000000000000000000000 i!541) (bvslt i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!4696 (buf!5243 bs!62))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!9843 bs!62)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!9838 bs!62)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!4696 (buf!5243 bs!62))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!9843 bs!62)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!9838 bs!62)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!45334 e!149377))

(assert (=> start!45334 true))

(declare-fun e!149378 () Bool)

(declare-fun inv!12 (BitStream!8500) Bool)

(assert (=> start!45334 (and (inv!12 bs!62) e!149378)))

(declare-fun b!219989 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!219989 (= e!149377 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!9838 bs!62))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!9843 bs!62))) ((_ extract 31 0) ((_ sign_extend 32) (size!4696 (buf!5243 bs!62)))))))))

(declare-fun b!219990 () Bool)

(declare-fun array_inv!4437 (array!10690) Bool)

(assert (=> b!219990 (= e!149378 (array_inv!4437 (buf!5243 bs!62)))))

(assert (= (and start!45334 res!185342) b!219989))

(assert (= start!45334 b!219990))

(declare-fun m!338731 () Bool)

(assert (=> start!45334 m!338731))

(declare-fun m!338733 () Bool)

(assert (=> b!219989 m!338733))

(declare-fun m!338735 () Bool)

(assert (=> b!219990 m!338735))

(push 1)

(assert (not b!219989))

(assert (not b!219990))

(assert (not start!45334))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!74041 () Bool)

(assert (=> d!74041 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!9838 bs!62))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!9843 bs!62))) ((_ extract 31 0) ((_ sign_extend 32) (size!4696 (buf!5243 bs!62))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!9838 bs!62))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!9838 bs!62))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!9843 bs!62))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!9843 bs!62))) ((_ extract 31 0) ((_ sign_extend 32) (size!4696 (buf!5243 bs!62))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!9838 bs!62))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!9843 bs!62))) ((_ extract 31 0) ((_ sign_extend 32) (size!4696 (buf!5243 bs!62)))))))))))

(assert (=> b!219989 d!74041))

(declare-fun d!74045 () Bool)

(assert (=> d!74045 (= (array_inv!4437 (buf!5243 bs!62)) (bvsge (size!4696 (buf!5243 bs!62)) #b00000000000000000000000000000000))))

(assert (=> b!219990 d!74045))

(declare-fun d!74049 () Bool)

(assert (=> d!74049 (= (inv!12 bs!62) (invariant!0 (currentBit!9838 bs!62) (currentByte!9843 bs!62) (size!4696 (buf!5243 bs!62))))))

(declare-fun bs!18094 () Bool)

(assert (= bs!18094 d!74049))

(declare-fun m!338753 () Bool)

(assert (=> bs!18094 m!338753))

(assert (=> start!45334 d!74049))

(push 1)

(assert (not d!74049))

(check-sat)

