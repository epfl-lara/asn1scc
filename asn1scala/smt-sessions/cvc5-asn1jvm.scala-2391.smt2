; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61006 () Bool)

(assert start!61006)

(declare-fun res!228751 () Bool)

(declare-fun e!194924 () Bool)

(assert (=> start!61006 (=> (not res!228751) (not e!194924))))

(declare-datatypes ((array!15647 0))(
  ( (array!15648 (arr!7765 (Array (_ BitVec 32) (_ BitVec 8))) (size!6778 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12370 0))(
  ( (BitStream!12371 (buf!7246 array!15647) (currentByte!13401 (_ BitVec 32)) (currentBit!13396 (_ BitVec 32))) )
))
(declare-fun b!177 () BitStream!12370)

(declare-fun diffInBits!14 () (_ BitVec 64))

(assert (=> start!61006 (= res!228751 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6778 (buf!7246 b!177)))) diffInBits!14) (bvsle diffInBits!14 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6778 (buf!7246 b!177)))))))))

(assert (=> start!61006 e!194924))

(declare-fun e!194925 () Bool)

(declare-fun inv!12 (BitStream!12370) Bool)

(assert (=> start!61006 (and (inv!12 b!177) e!194925)))

(assert (=> start!61006 true))

(declare-fun b!275024 () Bool)

(declare-fun lt!413389 () (_ BitVec 64))

(declare-fun lt!413390 () (_ BitVec 64))

(assert (=> b!275024 (= e!194924 (and (= lt!413389 (bvand diffInBits!14 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!413389 (bvand (bvadd lt!413390 diffInBits!14) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!275024 (= lt!413389 (bvand lt!413390 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!275024 (= lt!413390 (bitIndex!0 (size!6778 (buf!7246 b!177)) (currentByte!13401 b!177) (currentBit!13396 b!177)))))

(declare-fun b!275025 () Bool)

(declare-fun array_inv!6502 (array!15647) Bool)

(assert (=> b!275025 (= e!194925 (array_inv!6502 (buf!7246 b!177)))))

(assert (= (and start!61006 res!228751) b!275024))

(assert (= start!61006 b!275025))

(declare-fun m!407597 () Bool)

(assert (=> start!61006 m!407597))

(declare-fun m!407599 () Bool)

(assert (=> b!275024 m!407599))

(declare-fun m!407601 () Bool)

(assert (=> b!275025 m!407601))

(push 1)

(assert (not b!275024))

(assert (not b!275025))

(assert (not start!61006))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94544 () Bool)

(declare-fun e!194947 () Bool)

(assert (=> d!94544 e!194947))

(declare-fun res!228762 () Bool)

(assert (=> d!94544 (=> (not res!228762) (not e!194947))))

(declare-fun lt!413418 () (_ BitVec 64))

(declare-fun lt!413421 () (_ BitVec 64))

(declare-fun lt!413422 () (_ BitVec 64))

(assert (=> d!94544 (= res!228762 (= lt!413421 (bvsub lt!413422 lt!413418)))))

(assert (=> d!94544 (or (= (bvand lt!413422 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!413418 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!413422 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!413422 lt!413418) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!94544 (= lt!413418 (remainingBits!0 ((_ sign_extend 32) (size!6778 (buf!7246 b!177))) ((_ sign_extend 32) (currentByte!13401 b!177)) ((_ sign_extend 32) (currentBit!13396 b!177))))))

(declare-fun lt!413419 () (_ BitVec 64))

(declare-fun lt!413417 () (_ BitVec 64))

(assert (=> d!94544 (= lt!413422 (bvmul lt!413419 lt!413417))))

(assert (=> d!94544 (or (= lt!413419 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!413417 (bvsdiv (bvmul lt!413419 lt!413417) lt!413419)))))

(assert (=> d!94544 (= lt!413417 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94544 (= lt!413419 ((_ sign_extend 32) (size!6778 (buf!7246 b!177))))))

(assert (=> d!94544 (= lt!413421 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13401 b!177)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13396 b!177))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!94544 (invariant!0 (currentBit!13396 b!177) (currentByte!13401 b!177) (size!6778 (buf!7246 b!177)))))

(assert (=> d!94544 (= (bitIndex!0 (size!6778 (buf!7246 b!177)) (currentByte!13401 b!177) (currentBit!13396 b!177)) lt!413421)))

(declare-fun b!275042 () Bool)

(declare-fun res!228763 () Bool)

(assert (=> b!275042 (=> (not res!228763) (not e!194947))))

(assert (=> b!275042 (= res!228763 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!413421))))

(declare-fun b!275043 () Bool)

(declare-fun lt!413420 () (_ BitVec 64))

(assert (=> b!275043 (= e!194947 (bvsle lt!413421 (bvmul lt!413420 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!275043 (or (= lt!413420 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!413420 #b0000000000000000000000000000000000000000000000000000000000001000) lt!413420)))))

(assert (=> b!275043 (= lt!413420 ((_ sign_extend 32) (size!6778 (buf!7246 b!177))))))

(assert (= (and d!94544 res!228762) b!275042))

(assert (= (and b!275042 res!228763) b!275043))

(declare-fun m!407617 () Bool)

(assert (=> d!94544 m!407617))

(declare-fun m!407619 () Bool)

(assert (=> d!94544 m!407619))

(assert (=> b!275024 d!94544))

(declare-fun d!94556 () Bool)

(assert (=> d!94556 (= (array_inv!6502 (buf!7246 b!177)) (bvsge (size!6778 (buf!7246 b!177)) #b00000000000000000000000000000000))))

(assert (=> b!275025 d!94556))

(declare-fun d!94558 () Bool)

(assert (=> d!94558 (= (inv!12 b!177) (invariant!0 (currentBit!13396 b!177) (currentByte!13401 b!177) (size!6778 (buf!7246 b!177))))))

(declare-fun bs!23807 () Bool)

(assert (= bs!23807 d!94558))

(assert (=> bs!23807 m!407619))

(assert (=> start!61006 d!94558))

(push 1)

(assert (not d!94544))

(assert (not d!94558))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

