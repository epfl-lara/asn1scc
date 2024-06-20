; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31746 () Bool)

(assert start!31746)

(declare-fun res!132386 () Bool)

(declare-fun e!107769 () Bool)

(assert (=> start!31746 (=> (not res!132386) (not e!107769))))

(declare-datatypes ((array!7385 0))(
  ( (array!7386 (arr!4273 (Array (_ BitVec 32) (_ BitVec 8))) (size!3352 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5872 0))(
  ( (BitStream!5873 (buf!3810 array!7385) (currentByte!6999 (_ BitVec 32)) (currentBit!6994 (_ BitVec 32))) )
))
(declare-fun b1!99 () BitStream!5872)

(declare-fun buf!77 () array!7385)

(declare-fun bytes!14 () (_ BitVec 32))

(assert (=> start!31746 (= res!132386 (and (= (size!3352 (buf!3810 b1!99)) (size!3352 buf!77)) (bvsge bytes!14 #b00000000000000000000000000000000) (bvsle ((_ sign_extend 32) (size!3352 (buf!3810 b1!99))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!6999 b1!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!6994 b1!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!3352 (buf!3810 b1!99))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!6999 b1!99)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!6994 b1!99)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!31746 e!107769))

(declare-fun e!107767 () Bool)

(declare-fun inv!12 (BitStream!5872) Bool)

(assert (=> start!31746 (and (inv!12 b1!99) e!107767)))

(declare-fun array_inv!3099 (array!7385) Bool)

(assert (=> start!31746 (array_inv!3099 buf!77)))

(assert (=> start!31746 true))

(declare-fun b!158492 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!158492 (= e!107769 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!6994 b1!99))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!6999 b1!99))) ((_ extract 31 0) ((_ sign_extend 32) (size!3352 (buf!3810 b1!99)))))))))

(declare-fun b!158493 () Bool)

(assert (=> b!158493 (= e!107767 (array_inv!3099 (buf!3810 b1!99)))))

(assert (= (and start!31746 res!132386) b!158492))

(assert (= start!31746 b!158493))

(declare-fun m!248975 () Bool)

(assert (=> start!31746 m!248975))

(declare-fun m!248977 () Bool)

(assert (=> start!31746 m!248977))

(declare-fun m!248979 () Bool)

(assert (=> b!158492 m!248979))

(declare-fun m!248981 () Bool)

(assert (=> b!158493 m!248981))

(push 1)

(assert (not b!158492))

(assert (not b!158493))

(assert (not start!31746))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!53155 () Bool)

(assert (=> d!53155 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!6994 b1!99))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!6999 b1!99))) ((_ extract 31 0) ((_ sign_extend 32) (size!3352 (buf!3810 b1!99))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!6994 b1!99))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!6994 b1!99))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!6999 b1!99))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!6999 b1!99))) ((_ extract 31 0) ((_ sign_extend 32) (size!3352 (buf!3810 b1!99))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!6994 b1!99))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!6999 b1!99))) ((_ extract 31 0) ((_ sign_extend 32) (size!3352 (buf!3810 b1!99)))))))))))

(assert (=> b!158492 d!53155))

(declare-fun d!53163 () Bool)

(assert (=> d!53163 (= (array_inv!3099 (buf!3810 b1!99)) (bvsge (size!3352 (buf!3810 b1!99)) #b00000000000000000000000000000000))))

(assert (=> b!158493 d!53163))

(declare-fun d!53167 () Bool)

(assert (=> d!53167 (= (inv!12 b1!99) (invariant!0 (currentBit!6994 b1!99) (currentByte!6999 b1!99) (size!3352 (buf!3810 b1!99))))))

(declare-fun bs!13108 () Bool)

(assert (= bs!13108 d!53167))

(declare-fun m!249003 () Bool)

(assert (=> bs!13108 m!249003))

(assert (=> start!31746 d!53167))

(declare-fun d!53171 () Bool)

(assert (=> d!53171 (= (array_inv!3099 buf!77) (bvsge (size!3352 buf!77) #b00000000000000000000000000000000))))

(assert (=> start!31746 d!53171))

(push 1)

(assert (not d!53167))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

