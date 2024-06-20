; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61010 () Bool)

(assert start!61010)

(declare-fun res!228757 () Bool)

(declare-fun e!194944 () Bool)

(assert (=> start!61010 (=> (not res!228757) (not e!194944))))

(declare-datatypes ((array!15651 0))(
  ( (array!15652 (arr!7767 (Array (_ BitVec 32) (_ BitVec 8))) (size!6780 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12374 0))(
  ( (BitStream!12375 (buf!7248 array!15651) (currentByte!13403 (_ BitVec 32)) (currentBit!13398 (_ BitVec 32))) )
))
(declare-fun b!177 () BitStream!12374)

(declare-fun diffInBits!14 () (_ BitVec 64))

(assert (=> start!61010 (= res!228757 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6780 (buf!7248 b!177)))) diffInBits!14) (bvsle diffInBits!14 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6780 (buf!7248 b!177)))))))))

(assert (=> start!61010 e!194944))

(declare-fun e!194943 () Bool)

(declare-fun inv!12 (BitStream!12374) Bool)

(assert (=> start!61010 (and (inv!12 b!177) e!194943)))

(assert (=> start!61010 true))

(declare-fun lt!413401 () (_ BitVec 64))

(declare-fun b!275036 () Bool)

(declare-fun lt!413402 () (_ BitVec 64))

(assert (=> b!275036 (= e!194944 (and (= lt!413401 (bvand diffInBits!14 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!413401 (bvand (bvadd lt!413402 diffInBits!14) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!275036 (= lt!413401 (bvand lt!413402 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!275036 (= lt!413402 (bitIndex!0 (size!6780 (buf!7248 b!177)) (currentByte!13403 b!177) (currentBit!13398 b!177)))))

(declare-fun b!275037 () Bool)

(declare-fun array_inv!6504 (array!15651) Bool)

(assert (=> b!275037 (= e!194943 (array_inv!6504 (buf!7248 b!177)))))

(assert (= (and start!61010 res!228757) b!275036))

(assert (= start!61010 b!275037))

(declare-fun m!407609 () Bool)

(assert (=> start!61010 m!407609))

(declare-fun m!407611 () Bool)

(assert (=> b!275036 m!407611))

(declare-fun m!407613 () Bool)

(assert (=> b!275037 m!407613))

(push 1)

(assert (not b!275037))

(assert (not start!61010))

(assert (not b!275036))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94550 () Bool)

(assert (=> d!94550 (= (array_inv!6504 (buf!7248 b!177)) (bvsge (size!6780 (buf!7248 b!177)) #b00000000000000000000000000000000))))

(assert (=> b!275037 d!94550))

(declare-fun d!94552 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!94552 (= (inv!12 b!177) (invariant!0 (currentBit!13398 b!177) (currentByte!13403 b!177) (size!6780 (buf!7248 b!177))))))

(declare-fun bs!23806 () Bool)

(assert (= bs!23806 d!94552))

(declare-fun m!407615 () Bool)

(assert (=> bs!23806 m!407615))

(assert (=> start!61010 d!94552))

(declare-fun d!94554 () Bool)

(declare-fun e!194953 () Bool)

(assert (=> d!94554 e!194953))

(declare-fun res!228775 () Bool)

(assert (=> d!94554 (=> (not res!228775) (not e!194953))))

(declare-fun lt!413456 () (_ BitVec 64))

(declare-fun lt!413451 () (_ BitVec 64))

(declare-fun lt!413455 () (_ BitVec 64))

(assert (=> d!94554 (= res!228775 (= lt!413451 (bvsub lt!413456 lt!413455)))))

(assert (=> d!94554 (or (= (bvand lt!413456 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!413455 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!413456 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!413456 lt!413455) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!94554 (= lt!413455 (remainingBits!0 ((_ sign_extend 32) (size!6780 (buf!7248 b!177))) ((_ sign_extend 32) (currentByte!13403 b!177)) ((_ sign_extend 32) (currentBit!13398 b!177))))))

(declare-fun lt!413452 () (_ BitVec 64))

(declare-fun lt!413453 () (_ BitVec 64))

(assert (=> d!94554 (= lt!413456 (bvmul lt!413452 lt!413453))))

(assert (=> d!94554 (or (= lt!413452 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!413453 (bvsdiv (bvmul lt!413452 lt!413453) lt!413452)))))

(assert (=> d!94554 (= lt!413453 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94554 (= lt!413452 ((_ sign_extend 32) (size!6780 (buf!7248 b!177))))))

(assert (=> d!94554 (= lt!413451 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13403 b!177)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13398 b!177))))))

(assert (=> d!94554 (invariant!0 (currentBit!13398 b!177) (currentByte!13403 b!177) (size!6780 (buf!7248 b!177)))))

(assert (=> d!94554 (= (bitIndex!0 (size!6780 (buf!7248 b!177)) (currentByte!13403 b!177) (currentBit!13398 b!177)) lt!413451)))

(declare-fun b!275054 () Bool)

(declare-fun res!228774 () Bool)

(assert (=> b!275054 (=> (not res!228774) (not e!194953))))

(assert (=> b!275054 (= res!228774 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!413451))))

(declare-fun b!275055 () Bool)

(declare-fun lt!413454 () (_ BitVec 64))

(assert (=> b!275055 (= e!194953 (bvsle lt!413451 (bvmul lt!413454 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!275055 (or (= lt!413454 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!413454 #b0000000000000000000000000000000000000000000000000000000000001000) lt!413454)))))

(assert (=> b!275055 (= lt!413454 ((_ sign_extend 32) (size!6780 (buf!7248 b!177))))))

(assert (= (and d!94554 res!228775) b!275054))

(assert (= (and b!275054 res!228774) b!275055))

(declare-fun m!407625 () Bool)

(assert (=> d!94554 m!407625))

(assert (=> d!94554 m!407615))

(assert (=> b!275036 d!94554))

(push 1)

(assert (not d!94552))

(assert (not d!94554))

(check-sat)

(pop 1)

(push 1)

(check-sat)

