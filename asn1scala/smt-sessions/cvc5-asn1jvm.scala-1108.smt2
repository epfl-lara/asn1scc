; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31804 () Bool)

(assert start!31804)

(declare-fun b!158568 () Bool)

(declare-fun res!132436 () Bool)

(declare-fun e!107877 () Bool)

(assert (=> b!158568 (=> (not res!132436) (not e!107877))))

(declare-datatypes ((array!7409 0))(
  ( (array!7410 (arr!4282 (Array (_ BitVec 32) (_ BitVec 8))) (size!3361 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5890 0))(
  ( (BitStream!5891 (buf!3819 array!7409) (currentByte!7016 (_ BitVec 32)) (currentBit!7011 (_ BitVec 32))) )
))
(declare-fun b1!99 () BitStream!5890)

(declare-fun bytes!14 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!158568 (= res!132436 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3361 (buf!3819 b1!99))) ((_ sign_extend 32) (currentByte!7016 b1!99)) ((_ sign_extend 32) (currentBit!7011 b1!99)) bytes!14))))

(declare-fun b!158569 () Bool)

(declare-fun res!132437 () Bool)

(assert (=> b!158569 (=> (not res!132437) (not e!107877))))

(declare-fun buf!77 () array!7409)

(assert (=> b!158569 (= res!132437 (and (bvsle ((_ sign_extend 32) (size!3361 buf!77)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!7016 b1!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!7011 b1!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!3361 buf!77)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!7016 b1!99)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!7011 b1!99)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!158571 () Bool)

(declare-fun e!107874 () Bool)

(declare-fun array_inv!3108 (array!7409) Bool)

(assert (=> b!158571 (= e!107874 (array_inv!3108 (buf!3819 b1!99)))))

(declare-fun res!132435 () Bool)

(assert (=> start!31804 (=> (not res!132435) (not e!107877))))

(assert (=> start!31804 (= res!132435 (and (= (size!3361 (buf!3819 b1!99)) (size!3361 buf!77)) (bvsge bytes!14 #b00000000000000000000000000000000)))))

(assert (=> start!31804 e!107877))

(declare-fun inv!12 (BitStream!5890) Bool)

(assert (=> start!31804 (and (inv!12 b1!99) e!107874)))

(assert (=> start!31804 (array_inv!3108 buf!77)))

(assert (=> start!31804 true))

(declare-fun b!158570 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!158570 (= e!107877 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!7011 b1!99))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!7016 b1!99))) ((_ extract 31 0) ((_ sign_extend 32) (size!3361 buf!77))))))))

(assert (= (and start!31804 res!132435) b!158568))

(assert (= (and b!158568 res!132436) b!158569))

(assert (= (and b!158569 res!132437) b!158570))

(assert (= start!31804 b!158571))

(declare-fun m!249065 () Bool)

(assert (=> b!158568 m!249065))

(declare-fun m!249067 () Bool)

(assert (=> b!158571 m!249067))

(declare-fun m!249069 () Bool)

(assert (=> start!31804 m!249069))

(declare-fun m!249071 () Bool)

(assert (=> start!31804 m!249071))

(declare-fun m!249073 () Bool)

(assert (=> b!158570 m!249073))

(push 1)

(assert (not b!158571))

(assert (not b!158568))

(assert (not b!158570))

(assert (not start!31804))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!53219 () Bool)

(assert (=> d!53219 (= (array_inv!3108 (buf!3819 b1!99)) (bvsge (size!3361 (buf!3819 b1!99)) #b00000000000000000000000000000000))))

(assert (=> b!158571 d!53219))

(declare-fun d!53223 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!53223 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3361 (buf!3819 b1!99))) ((_ sign_extend 32) (currentByte!7016 b1!99)) ((_ sign_extend 32) (currentBit!7011 b1!99)) bytes!14) (bvsle ((_ sign_extend 32) bytes!14) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3361 (buf!3819 b1!99))) ((_ sign_extend 32) (currentByte!7016 b1!99)) ((_ sign_extend 32) (currentBit!7011 b1!99))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!13126 () Bool)

(assert (= bs!13126 d!53223))

(declare-fun m!249099 () Bool)

(assert (=> bs!13126 m!249099))

(assert (=> b!158568 d!53223))

(declare-fun d!53227 () Bool)

(assert (=> d!53227 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!7011 b1!99))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!7016 b1!99))) ((_ extract 31 0) ((_ sign_extend 32) (size!3361 buf!77)))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!7011 b1!99))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!7011 b1!99))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!7016 b1!99))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!7016 b1!99))) ((_ extract 31 0) ((_ sign_extend 32) (size!3361 buf!77)))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!7011 b1!99))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!7016 b1!99))) ((_ extract 31 0) ((_ sign_extend 32) (size!3361 buf!77))))))))))

(assert (=> b!158570 d!53227))

(declare-fun d!53233 () Bool)

(assert (=> d!53233 (= (inv!12 b1!99) (invariant!0 (currentBit!7011 b1!99) (currentByte!7016 b1!99) (size!3361 (buf!3819 b1!99))))))

(declare-fun bs!13129 () Bool)

(assert (= bs!13129 d!53233))

(declare-fun m!249105 () Bool)

(assert (=> bs!13129 m!249105))

(assert (=> start!31804 d!53233))

(declare-fun d!53237 () Bool)

(assert (=> d!53237 (= (array_inv!3108 buf!77) (bvsge (size!3361 buf!77) #b00000000000000000000000000000000))))

(assert (=> start!31804 d!53237))

(push 1)

(assert (not d!53233))

(assert (not d!53223))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

