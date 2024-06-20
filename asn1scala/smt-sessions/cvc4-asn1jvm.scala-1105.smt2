; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31750 () Bool)

(assert start!31750)

(declare-fun res!132392 () Bool)

(declare-fun e!107792 () Bool)

(assert (=> start!31750 (=> (not res!132392) (not e!107792))))

(declare-datatypes ((array!7389 0))(
  ( (array!7390 (arr!4275 (Array (_ BitVec 32) (_ BitVec 8))) (size!3354 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5876 0))(
  ( (BitStream!5877 (buf!3812 array!7389) (currentByte!7001 (_ BitVec 32)) (currentBit!6996 (_ BitVec 32))) )
))
(declare-fun b1!99 () BitStream!5876)

(declare-fun buf!77 () array!7389)

(declare-fun bytes!14 () (_ BitVec 32))

(assert (=> start!31750 (= res!132392 (and (= (size!3354 (buf!3812 b1!99)) (size!3354 buf!77)) (bvsge bytes!14 #b00000000000000000000000000000000) (bvsle ((_ sign_extend 32) (size!3354 (buf!3812 b1!99))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!7001 b1!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!6996 b1!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!3354 (buf!3812 b1!99))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!7001 b1!99)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!6996 b1!99)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!31750 e!107792))

(declare-fun e!107793 () Bool)

(declare-fun inv!12 (BitStream!5876) Bool)

(assert (=> start!31750 (and (inv!12 b1!99) e!107793)))

(declare-fun array_inv!3101 (array!7389) Bool)

(assert (=> start!31750 (array_inv!3101 buf!77)))

(assert (=> start!31750 true))

(declare-fun b!158504 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!158504 (= e!107792 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!6996 b1!99))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!7001 b1!99))) ((_ extract 31 0) ((_ sign_extend 32) (size!3354 (buf!3812 b1!99)))))))))

(declare-fun b!158505 () Bool)

(assert (=> b!158505 (= e!107793 (array_inv!3101 (buf!3812 b1!99)))))

(assert (= (and start!31750 res!132392) b!158504))

(assert (= start!31750 b!158505))

(declare-fun m!248991 () Bool)

(assert (=> start!31750 m!248991))

(declare-fun m!248993 () Bool)

(assert (=> start!31750 m!248993))

(declare-fun m!248995 () Bool)

(assert (=> b!158504 m!248995))

(declare-fun m!248997 () Bool)

(assert (=> b!158505 m!248997))

(push 1)

(assert (not start!31750))

(assert (not b!158504))

(assert (not b!158505))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!53161 () Bool)

(assert (=> d!53161 (= (inv!12 b1!99) (invariant!0 (currentBit!6996 b1!99) (currentByte!7001 b1!99) (size!3354 (buf!3812 b1!99))))))

(declare-fun bs!13107 () Bool)

(assert (= bs!13107 d!53161))

(declare-fun m!249001 () Bool)

(assert (=> bs!13107 m!249001))

(assert (=> start!31750 d!53161))

(declare-fun d!53165 () Bool)

(assert (=> d!53165 (= (array_inv!3101 buf!77) (bvsge (size!3354 buf!77) #b00000000000000000000000000000000))))

(assert (=> start!31750 d!53165))

(declare-fun d!53169 () Bool)

(assert (=> d!53169 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!6996 b1!99))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!7001 b1!99))) ((_ extract 31 0) ((_ sign_extend 32) (size!3354 (buf!3812 b1!99))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!6996 b1!99))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!6996 b1!99))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!7001 b1!99))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!7001 b1!99))) ((_ extract 31 0) ((_ sign_extend 32) (size!3354 (buf!3812 b1!99))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!6996 b1!99))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!7001 b1!99))) ((_ extract 31 0) ((_ sign_extend 32) (size!3354 (buf!3812 b1!99)))))))))))

(assert (=> b!158504 d!53169))

(declare-fun d!53173 () Bool)

(assert (=> d!53173 (= (array_inv!3101 (buf!3812 b1!99)) (bvsge (size!3354 (buf!3812 b1!99)) #b00000000000000000000000000000000))))

(assert (=> b!158505 d!53173))

