; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45336 () Bool)

(assert start!45336)

(declare-fun res!185345 () Bool)

(declare-fun e!149386 () Bool)

(assert (=> start!45336 (=> (not res!185345) (not e!149386))))

(declare-fun nBits!265 () (_ BitVec 32))

(declare-fun i!541 () (_ BitVec 32))

(declare-datatypes ((array!10692 0))(
  ( (array!10693 (arr!5627 (Array (_ BitVec 32) (_ BitVec 8))) (size!4697 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8502 0))(
  ( (BitStream!8503 (buf!5244 array!10692) (currentByte!9844 (_ BitVec 32)) (currentBit!9839 (_ BitVec 32))) )
))
(declare-fun bs!62 () BitStream!8502)

(assert (=> start!45336 (= res!185345 (and (bvsle #b00000000000000000000000000000000 i!541) (bvslt i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!4697 (buf!5244 bs!62))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!9844 bs!62)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!9839 bs!62)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!4697 (buf!5244 bs!62))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!9844 bs!62)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!9839 bs!62)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!45336 e!149386))

(assert (=> start!45336 true))

(declare-fun e!149387 () Bool)

(declare-fun inv!12 (BitStream!8502) Bool)

(assert (=> start!45336 (and (inv!12 bs!62) e!149387)))

(declare-fun b!219995 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!219995 (= e!149386 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!9839 bs!62))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!9844 bs!62))) ((_ extract 31 0) ((_ sign_extend 32) (size!4697 (buf!5244 bs!62)))))))))

(declare-fun b!219996 () Bool)

(declare-fun array_inv!4438 (array!10692) Bool)

(assert (=> b!219996 (= e!149387 (array_inv!4438 (buf!5244 bs!62)))))

(assert (= (and start!45336 res!185345) b!219995))

(assert (= start!45336 b!219996))

(declare-fun m!338737 () Bool)

(assert (=> start!45336 m!338737))

(declare-fun m!338739 () Bool)

(assert (=> b!219995 m!338739))

(declare-fun m!338741 () Bool)

(assert (=> b!219996 m!338741))

(check-sat (not start!45336) (not b!219995) (not b!219996))
(check-sat)
(get-model)

(declare-fun d!74037 () Bool)

(assert (=> d!74037 (= (inv!12 bs!62) (invariant!0 (currentBit!9839 bs!62) (currentByte!9844 bs!62) (size!4697 (buf!5244 bs!62))))))

(declare-fun bs!18092 () Bool)

(assert (= bs!18092 d!74037))

(declare-fun m!338749 () Bool)

(assert (=> bs!18092 m!338749))

(assert (=> start!45336 d!74037))

(declare-fun d!74039 () Bool)

(assert (=> d!74039 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!9839 bs!62))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!9844 bs!62))) ((_ extract 31 0) ((_ sign_extend 32) (size!4697 (buf!5244 bs!62))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!9839 bs!62))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!9839 bs!62))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!9844 bs!62))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!9844 bs!62))) ((_ extract 31 0) ((_ sign_extend 32) (size!4697 (buf!5244 bs!62))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!9839 bs!62))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!9844 bs!62))) ((_ extract 31 0) ((_ sign_extend 32) (size!4697 (buf!5244 bs!62)))))))))))

(assert (=> b!219995 d!74039))

(declare-fun d!74043 () Bool)

(assert (=> d!74043 (= (array_inv!4438 (buf!5244 bs!62)) (bvsge (size!4697 (buf!5244 bs!62)) #b00000000000000000000000000000000))))

(assert (=> b!219996 d!74043))

(check-sat (not d!74037))
(check-sat)
