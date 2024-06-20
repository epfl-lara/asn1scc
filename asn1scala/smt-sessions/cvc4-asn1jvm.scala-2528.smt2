; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63862 () Bool)

(assert start!63862)

(declare-fun res!235390 () Bool)

(declare-fun e!203138 () Bool)

(assert (=> start!63862 (=> (not res!235390) (not e!203138))))

(declare-datatypes ((array!16651 0))(
  ( (array!16652 (arr!8178 (Array (_ BitVec 32) (_ BitVec 8))) (size!7182 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12734 0))(
  ( (BitStream!12735 (buf!7428 array!16651) (currentByte!13795 (_ BitVec 32)) (currentBit!13790 (_ BitVec 32))) )
))
(declare-fun thiss!1929 () BitStream!12734)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!63862 (= res!235390 (validate_offset_bits!1 ((_ sign_extend 32) (size!7182 (buf!7428 thiss!1929))) ((_ sign_extend 32) (currentByte!13795 thiss!1929)) ((_ sign_extend 32) (currentBit!13790 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13790 thiss!1929)) #b00000000000000000000000000000111))))))

(assert (=> start!63862 e!203138))

(declare-fun e!203139 () Bool)

(declare-fun inv!12 (BitStream!12734) Bool)

(assert (=> start!63862 (and (inv!12 thiss!1929) e!203139)))

(declare-fun b!284152 () Bool)

(declare-fun res!235391 () Bool)

(assert (=> b!284152 (=> (not res!235391) (not e!203138))))

(assert (=> b!284152 (= res!235391 (not (= (currentBit!13790 thiss!1929) #b00000000000000000000000000000000)))))

(declare-fun b!284153 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!284153 (= e!203138 (bvsgt (bitIndex!0 (size!7182 (buf!7428 thiss!1929)) (bvadd #b00000000000000000000000000000001 (currentByte!13795 thiss!1929)) #b00000000000000000000000000000000) (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 (bitIndex!0 (size!7182 (buf!7428 thiss!1929)) (currentByte!13795 thiss!1929) (currentBit!13790 thiss!1929)))))))

(declare-fun b!284154 () Bool)

(declare-fun array_inv!6875 (array!16651) Bool)

(assert (=> b!284154 (= e!203139 (array_inv!6875 (buf!7428 thiss!1929)))))

(assert (= (and start!63862 res!235390) b!284152))

(assert (= (and b!284152 res!235391) b!284153))

(assert (= start!63862 b!284154))

(declare-fun m!417329 () Bool)

(assert (=> start!63862 m!417329))

(declare-fun m!417331 () Bool)

(assert (=> start!63862 m!417331))

(declare-fun m!417333 () Bool)

(assert (=> b!284153 m!417333))

(declare-fun m!417335 () Bool)

(assert (=> b!284153 m!417335))

(declare-fun m!417337 () Bool)

(assert (=> b!284154 m!417337))

(push 1)

(assert (not b!284153))

(assert (not b!284154))

(assert (not start!63862))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97834 () Bool)

(declare-fun e!203150 () Bool)

(assert (=> d!97834 e!203150))

(declare-fun res!235412 () Bool)

(assert (=> d!97834 (=> (not res!235412) (not e!203150))))

(declare-fun lt!418363 () (_ BitVec 64))

(declare-fun lt!418360 () (_ BitVec 64))

(declare-fun lt!418365 () (_ BitVec 64))

(assert (=> d!97834 (= res!235412 (= lt!418360 (bvsub lt!418363 lt!418365)))))

(assert (=> d!97834 (or (= (bvand lt!418363 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!418365 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!418363 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!418363 lt!418365) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!97834 (= lt!418365 (remainingBits!0 ((_ sign_extend 32) (size!7182 (buf!7428 thiss!1929))) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!13795 thiss!1929))) ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(declare-fun lt!418364 () (_ BitVec 64))

(declare-fun lt!418361 () (_ BitVec 64))

(assert (=> d!97834 (= lt!418363 (bvmul lt!418364 lt!418361))))

(assert (=> d!97834 (or (= lt!418364 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!418361 (bvsdiv (bvmul lt!418364 lt!418361) lt!418364)))))

(assert (=> d!97834 (= lt!418361 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!97834 (= lt!418364 ((_ sign_extend 32) (size!7182 (buf!7428 thiss!1929))))))

(assert (=> d!97834 (= lt!418360 (bvadd (bvmul ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!13795 thiss!1929))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!97834 (invariant!0 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!13795 thiss!1929)) (size!7182 (buf!7428 thiss!1929)))))

(assert (=> d!97834 (= (bitIndex!0 (size!7182 (buf!7428 thiss!1929)) (bvadd #b00000000000000000000000000000001 (currentByte!13795 thiss!1929)) #b00000000000000000000000000000000) lt!418360)))

(declare-fun b!284175 () Bool)

(declare-fun res!235413 () Bool)

(assert (=> b!284175 (=> (not res!235413) (not e!203150))))

(assert (=> b!284175 (= res!235413 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!418360))))

(declare-fun b!284176 () Bool)

(declare-fun lt!418362 () (_ BitVec 64))

(assert (=> b!284176 (= e!203150 (bvsle lt!418360 (bvmul lt!418362 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!284176 (or (= lt!418362 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!418362 #b0000000000000000000000000000000000000000000000000000000000001000) lt!418362)))))

(assert (=> b!284176 (= lt!418362 ((_ sign_extend 32) (size!7182 (buf!7428 thiss!1929))))))

(assert (= (and d!97834 res!235412) b!284175))

(assert (= (and b!284175 res!235413) b!284176))

(declare-fun m!417355 () Bool)

(assert (=> d!97834 m!417355))

(declare-fun m!417357 () Bool)

(assert (=> d!97834 m!417357))

(assert (=> b!284153 d!97834))

(declare-fun d!97842 () Bool)

(declare-fun e!203151 () Bool)

(assert (=> d!97842 e!203151))

(declare-fun res!235414 () Bool)

(assert (=> d!97842 (=> (not res!235414) (not e!203151))))

(declare-fun lt!418369 () (_ BitVec 64))

(declare-fun lt!418371 () (_ BitVec 64))

(declare-fun lt!418366 () (_ BitVec 64))

(assert (=> d!97842 (= res!235414 (= lt!418366 (bvsub lt!418369 lt!418371)))))

(assert (=> d!97842 (or (= (bvand lt!418369 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!418371 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!418369 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!418369 lt!418371) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!97842 (= lt!418371 (remainingBits!0 ((_ sign_extend 32) (size!7182 (buf!7428 thiss!1929))) ((_ sign_extend 32) (currentByte!13795 thiss!1929)) ((_ sign_extend 32) (currentBit!13790 thiss!1929))))))

(declare-fun lt!418370 () (_ BitVec 64))

(declare-fun lt!418367 () (_ BitVec 64))

(assert (=> d!97842 (= lt!418369 (bvmul lt!418370 lt!418367))))

(assert (=> d!97842 (or (= lt!418370 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!418367 (bvsdiv (bvmul lt!418370 lt!418367) lt!418370)))))

(assert (=> d!97842 (= lt!418367 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!97842 (= lt!418370 ((_ sign_extend 32) (size!7182 (buf!7428 thiss!1929))))))

(assert (=> d!97842 (= lt!418366 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13795 thiss!1929)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13790 thiss!1929))))))

(assert (=> d!97842 (invariant!0 (currentBit!13790 thiss!1929) (currentByte!13795 thiss!1929) (size!7182 (buf!7428 thiss!1929)))))

(assert (=> d!97842 (= (bitIndex!0 (size!7182 (buf!7428 thiss!1929)) (currentByte!13795 thiss!1929) (currentBit!13790 thiss!1929)) lt!418366)))

(declare-fun b!284177 () Bool)

(declare-fun res!235415 () Bool)

(assert (=> b!284177 (=> (not res!235415) (not e!203151))))

(assert (=> b!284177 (= res!235415 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!418366))))

(declare-fun b!284178 () Bool)

(declare-fun lt!418368 () (_ BitVec 64))

(assert (=> b!284178 (= e!203151 (bvsle lt!418366 (bvmul lt!418368 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!284178 (or (= lt!418368 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!418368 #b0000000000000000000000000000000000000000000000000000000000001000) lt!418368)))))

(assert (=> b!284178 (= lt!418368 ((_ sign_extend 32) (size!7182 (buf!7428 thiss!1929))))))

(assert (= (and d!97842 res!235414) b!284177))

(assert (= (and b!284177 res!235415) b!284178))

(declare-fun m!417359 () Bool)

(assert (=> d!97842 m!417359))

(declare-fun m!417361 () Bool)

(assert (=> d!97842 m!417361))

(assert (=> b!284153 d!97842))

(declare-fun d!97844 () Bool)

(assert (=> d!97844 (= (array_inv!6875 (buf!7428 thiss!1929)) (bvsge (size!7182 (buf!7428 thiss!1929)) #b00000000000000000000000000000000))))

(assert (=> b!284154 d!97844))

(declare-fun d!97846 () Bool)

(assert (=> d!97846 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7182 (buf!7428 thiss!1929))) ((_ sign_extend 32) (currentByte!13795 thiss!1929)) ((_ sign_extend 32) (currentBit!13790 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13790 thiss!1929)) #b00000000000000000000000000000111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7182 (buf!7428 thiss!1929))) ((_ sign_extend 32) (currentByte!13795 thiss!1929)) ((_ sign_extend 32) (currentBit!13790 thiss!1929))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13790 thiss!1929)) #b00000000000000000000000000000111))))))

(declare-fun bs!24730 () Bool)

(assert (= bs!24730 d!97846))

(assert (=> bs!24730 m!417359))

(assert (=> start!63862 d!97846))

(declare-fun d!97848 () Bool)

(assert (=> d!97848 (= (inv!12 thiss!1929) (invariant!0 (currentBit!13790 thiss!1929) (currentByte!13795 thiss!1929) (size!7182 (buf!7428 thiss!1929))))))

(declare-fun bs!24731 () Bool)

(assert (= bs!24731 d!97848))

(assert (=> bs!24731 m!417361))

(assert (=> start!63862 d!97848))

(push 1)

(assert (not d!97842))

(assert (not d!97834))

(assert (not d!97846))

(assert (not d!97848))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97850 () Bool)

(assert (=> d!97850 (= (remainingBits!0 ((_ sign_extend 32) (size!7182 (buf!7428 thiss!1929))) ((_ sign_extend 32) (currentByte!13795 thiss!1929)) ((_ sign_extend 32) (currentBit!13790 thiss!1929))) (bvsub (bvmul ((_ sign_extend 32) (size!7182 (buf!7428 thiss!1929))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!13795 thiss!1929)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13790 thiss!1929)))))))

(assert (=> d!97842 d!97850))

(declare-fun d!97852 () Bool)

(assert (=> d!97852 (= (invariant!0 (currentBit!13790 thiss!1929) (currentByte!13795 thiss!1929) (size!7182 (buf!7428 thiss!1929))) (and (bvsge (currentBit!13790 thiss!1929) #b00000000000000000000000000000000) (bvslt (currentBit!13790 thiss!1929) #b00000000000000000000000000001000) (bvsge (currentByte!13795 thiss!1929) #b00000000000000000000000000000000) (or (bvslt (currentByte!13795 thiss!1929) (size!7182 (buf!7428 thiss!1929))) (and (= (currentBit!13790 thiss!1929) #b00000000000000000000000000000000) (= (currentByte!13795 thiss!1929) (size!7182 (buf!7428 thiss!1929)))))))))

(assert (=> d!97842 d!97852))

(declare-fun d!97854 () Bool)

(assert (=> d!97854 (= (remainingBits!0 ((_ sign_extend 32) (size!7182 (buf!7428 thiss!1929))) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!13795 thiss!1929))) ((_ sign_extend 32) #b00000000000000000000000000000000)) (bvsub (bvmul ((_ sign_extend 32) (size!7182 (buf!7428 thiss!1929))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!13795 thiss!1929))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) #b00000000000000000000000000000000))))))

(assert (=> d!97834 d!97854))

(declare-fun d!97856 () Bool)

(assert (=> d!97856 (= (invariant!0 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!13795 thiss!1929)) (size!7182 (buf!7428 thiss!1929))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 #b00000000000000000000000000001000) (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!13795 thiss!1929)) #b00000000000000000000000000000000) (or (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!13795 thiss!1929)) (size!7182 (buf!7428 thiss!1929))) (and (= #b00000000000000000000000000000000 #b00000000000000000000000000000000) (= (bvadd #b00000000000000000000000000000001 (currentByte!13795 thiss!1929)) (size!7182 (buf!7428 thiss!1929)))))))))

(assert (=> d!97834 d!97856))

(assert (=> d!97846 d!97850))

(assert (=> d!97848 d!97852))

(push 1)

(check-sat)

(pop 1)

