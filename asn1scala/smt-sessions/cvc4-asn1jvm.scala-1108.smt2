; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31808 () Bool)

(assert start!31808)

(declare-fun b!158592 () Bool)

(declare-fun res!132455 () Bool)

(declare-fun e!107901 () Bool)

(assert (=> b!158592 (=> (not res!132455) (not e!107901))))

(declare-datatypes ((array!7413 0))(
  ( (array!7414 (arr!4284 (Array (_ BitVec 32) (_ BitVec 8))) (size!3363 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5894 0))(
  ( (BitStream!5895 (buf!3821 array!7413) (currentByte!7018 (_ BitVec 32)) (currentBit!7013 (_ BitVec 32))) )
))
(declare-fun b1!99 () BitStream!5894)

(declare-fun bytes!14 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!158592 (= res!132455 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3363 (buf!3821 b1!99))) ((_ sign_extend 32) (currentByte!7018 b1!99)) ((_ sign_extend 32) (currentBit!7013 b1!99)) bytes!14))))

(declare-fun b!158595 () Bool)

(declare-fun e!107899 () Bool)

(declare-fun array_inv!3110 (array!7413) Bool)

(assert (=> b!158595 (= e!107899 (array_inv!3110 (buf!3821 b1!99)))))

(declare-fun b!158593 () Bool)

(declare-fun res!132453 () Bool)

(assert (=> b!158593 (=> (not res!132453) (not e!107901))))

(declare-fun buf!77 () array!7413)

(assert (=> b!158593 (= res!132453 (and (bvsle ((_ sign_extend 32) (size!3363 buf!77)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!7018 b1!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!7013 b1!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!3363 buf!77)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!7018 b1!99)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!7013 b1!99)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!132454 () Bool)

(assert (=> start!31808 (=> (not res!132454) (not e!107901))))

(assert (=> start!31808 (= res!132454 (and (= (size!3363 (buf!3821 b1!99)) (size!3363 buf!77)) (bvsge bytes!14 #b00000000000000000000000000000000)))))

(assert (=> start!31808 e!107901))

(declare-fun inv!12 (BitStream!5894) Bool)

(assert (=> start!31808 (and (inv!12 b1!99) e!107899)))

(assert (=> start!31808 (array_inv!3110 buf!77)))

(assert (=> start!31808 true))

(declare-fun b!158594 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!158594 (= e!107901 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!7013 b1!99))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!7018 b1!99))) ((_ extract 31 0) ((_ sign_extend 32) (size!3363 buf!77))))))))

(assert (= (and start!31808 res!132454) b!158592))

(assert (= (and b!158592 res!132455) b!158593))

(assert (= (and b!158593 res!132453) b!158594))

(assert (= start!31808 b!158595))

(declare-fun m!249085 () Bool)

(assert (=> b!158592 m!249085))

(declare-fun m!249087 () Bool)

(assert (=> b!158595 m!249087))

(declare-fun m!249089 () Bool)

(assert (=> start!31808 m!249089))

(declare-fun m!249091 () Bool)

(assert (=> start!31808 m!249091))

(declare-fun m!249093 () Bool)

(assert (=> b!158594 m!249093))

(push 1)

(assert (not b!158592))

(assert (not start!31808))

(assert (not b!158594))

(assert (not b!158595))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!53217 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!53217 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3363 (buf!3821 b1!99))) ((_ sign_extend 32) (currentByte!7018 b1!99)) ((_ sign_extend 32) (currentBit!7013 b1!99)) bytes!14) (bvsle ((_ sign_extend 32) bytes!14) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3363 (buf!3821 b1!99))) ((_ sign_extend 32) (currentByte!7018 b1!99)) ((_ sign_extend 32) (currentBit!7013 b1!99))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!13125 () Bool)

(assert (= bs!13125 d!53217))

(declare-fun m!249097 () Bool)

(assert (=> bs!13125 m!249097))

(assert (=> b!158592 d!53217))

(declare-fun d!53225 () Bool)

(assert (=> d!53225 (= (inv!12 b1!99) (invariant!0 (currentBit!7013 b1!99) (currentByte!7018 b1!99) (size!3363 (buf!3821 b1!99))))))

(declare-fun bs!13128 () Bool)

(assert (= bs!13128 d!53225))

(declare-fun m!249103 () Bool)

(assert (=> bs!13128 m!249103))

(assert (=> start!31808 d!53225))

(declare-fun d!53229 () Bool)

(assert (=> d!53229 (= (array_inv!3110 buf!77) (bvsge (size!3363 buf!77) #b00000000000000000000000000000000))))

(assert (=> start!31808 d!53229))

(declare-fun d!53231 () Bool)

(assert (=> d!53231 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!7013 b1!99))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!7018 b1!99))) ((_ extract 31 0) ((_ sign_extend 32) (size!3363 buf!77)))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!7013 b1!99))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!7013 b1!99))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!7018 b1!99))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!7018 b1!99))) ((_ extract 31 0) ((_ sign_extend 32) (size!3363 buf!77)))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!7013 b1!99))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!7018 b1!99))) ((_ extract 31 0) ((_ sign_extend 32) (size!3363 buf!77))))))))))

(assert (=> b!158594 d!53231))

(declare-fun d!53235 () Bool)

(assert (=> d!53235 (= (array_inv!3110 (buf!3821 b1!99)) (bvsge (size!3363 (buf!3821 b1!99)) #b00000000000000000000000000000000))))

(assert (=> b!158595 d!53235))

(push 1)

