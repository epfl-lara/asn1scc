; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31834 () Bool)

(assert start!31834)

(declare-fun res!132461 () Bool)

(declare-fun e!107911 () Bool)

(assert (=> start!31834 (=> (not res!132461) (not e!107911))))

(declare-datatypes ((array!7418 0))(
  ( (array!7419 (arr!4285 (Array (_ BitVec 32) (_ BitVec 8))) (size!3364 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5896 0))(
  ( (BitStream!5897 (buf!3822 array!7418) (currentByte!7025 (_ BitVec 32)) (currentBit!7020 (_ BitVec 32))) )
))
(declare-fun b1!99 () BitStream!5896)

(declare-fun buf!77 () array!7418)

(declare-fun bytes!14 () (_ BitVec 32))

(assert (=> start!31834 (= res!132461 (and (= (size!3364 (buf!3822 b1!99)) (size!3364 buf!77)) (bvsge bytes!14 #b00000000000000000000000000000000)))))

(assert (=> start!31834 e!107911))

(declare-fun e!107913 () Bool)

(declare-fun inv!12 (BitStream!5896) Bool)

(assert (=> start!31834 (and (inv!12 b1!99) e!107913)))

(declare-fun array_inv!3111 (array!7418) Bool)

(assert (=> start!31834 (array_inv!3111 buf!77)))

(assert (=> start!31834 true))

(declare-fun b!158602 () Bool)

(declare-fun res!132460 () Bool)

(assert (=> b!158602 (=> (not res!132460) (not e!107911))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!158602 (= res!132460 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3364 (buf!3822 b1!99))) ((_ sign_extend 32) (currentByte!7025 b1!99)) ((_ sign_extend 32) (currentBit!7020 b1!99)) bytes!14))))

(declare-fun b!158603 () Bool)

(assert (=> b!158603 (= e!107911 (not (inv!12 (BitStream!5897 buf!77 (currentByte!7025 b1!99) (currentBit!7020 b1!99)))))))

(declare-fun b!158604 () Bool)

(assert (=> b!158604 (= e!107913 (array_inv!3111 (buf!3822 b1!99)))))

(assert (= (and start!31834 res!132461) b!158602))

(assert (= (and b!158602 res!132460) b!158603))

(assert (= start!31834 b!158604))

(declare-fun m!249107 () Bool)

(assert (=> start!31834 m!249107))

(declare-fun m!249109 () Bool)

(assert (=> start!31834 m!249109))

(declare-fun m!249111 () Bool)

(assert (=> b!158602 m!249111))

(declare-fun m!249113 () Bool)

(assert (=> b!158603 m!249113))

(declare-fun m!249115 () Bool)

(assert (=> b!158604 m!249115))

(push 1)

(assert (not start!31834))

(assert (not b!158603))

(assert (not b!158604))

(assert (not b!158602))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!53243 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!53243 (= (inv!12 b1!99) (invariant!0 (currentBit!7020 b1!99) (currentByte!7025 b1!99) (size!3364 (buf!3822 b1!99))))))

(declare-fun bs!13134 () Bool)

(assert (= bs!13134 d!53243))

(declare-fun m!249139 () Bool)

(assert (=> bs!13134 m!249139))

(assert (=> start!31834 d!53243))

(declare-fun d!53249 () Bool)

(assert (=> d!53249 (= (array_inv!3111 buf!77) (bvsge (size!3364 buf!77) #b00000000000000000000000000000000))))

(assert (=> start!31834 d!53249))

(declare-fun d!53251 () Bool)

(assert (=> d!53251 (= (inv!12 (BitStream!5897 buf!77 (currentByte!7025 b1!99) (currentBit!7020 b1!99))) (invariant!0 (currentBit!7020 (BitStream!5897 buf!77 (currentByte!7025 b1!99) (currentBit!7020 b1!99))) (currentByte!7025 (BitStream!5897 buf!77 (currentByte!7025 b1!99) (currentBit!7020 b1!99))) (size!3364 (buf!3822 (BitStream!5897 buf!77 (currentByte!7025 b1!99) (currentBit!7020 b1!99))))))))

(declare-fun bs!13135 () Bool)

(assert (= bs!13135 d!53251))

(declare-fun m!249141 () Bool)

(assert (=> bs!13135 m!249141))

(assert (=> b!158603 d!53251))

(declare-fun d!53253 () Bool)

(assert (=> d!53253 (= (array_inv!3111 (buf!3822 b1!99)) (bvsge (size!3364 (buf!3822 b1!99)) #b00000000000000000000000000000000))))

(assert (=> b!158604 d!53253))

(declare-fun d!53257 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!53257 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3364 (buf!3822 b1!99))) ((_ sign_extend 32) (currentByte!7025 b1!99)) ((_ sign_extend 32) (currentBit!7020 b1!99)) bytes!14) (bvsle ((_ sign_extend 32) bytes!14) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3364 (buf!3822 b1!99))) ((_ sign_extend 32) (currentByte!7025 b1!99)) ((_ sign_extend 32) (currentBit!7020 b1!99))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!13138 () Bool)

(assert (= bs!13138 d!53257))

(declare-fun m!249147 () Bool)

(assert (=> bs!13138 m!249147))

(assert (=> b!158602 d!53257))

(push 1)

(assert (not d!53251))

(assert (not d!53257))

(assert (not d!53243))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

