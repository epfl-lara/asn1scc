; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61008 () Bool)

(assert start!61008)

(declare-fun res!228754 () Bool)

(declare-fun e!194934 () Bool)

(assert (=> start!61008 (=> (not res!228754) (not e!194934))))

(declare-datatypes ((array!15649 0))(
  ( (array!15650 (arr!7766 (Array (_ BitVec 32) (_ BitVec 8))) (size!6779 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12372 0))(
  ( (BitStream!12373 (buf!7247 array!15649) (currentByte!13402 (_ BitVec 32)) (currentBit!13397 (_ BitVec 32))) )
))
(declare-fun b!177 () BitStream!12372)

(declare-fun diffInBits!14 () (_ BitVec 64))

(assert (=> start!61008 (= res!228754 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6779 (buf!7247 b!177)))) diffInBits!14) (bvsle diffInBits!14 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6779 (buf!7247 b!177)))))))))

(assert (=> start!61008 e!194934))

(declare-fun e!194935 () Bool)

(declare-fun inv!12 (BitStream!12372) Bool)

(assert (=> start!61008 (and (inv!12 b!177) e!194935)))

(assert (=> start!61008 true))

(declare-fun lt!413396 () (_ BitVec 64))

(declare-fun lt!413395 () (_ BitVec 64))

(declare-fun b!275030 () Bool)

(assert (=> b!275030 (= e!194934 (and (= lt!413395 (bvand diffInBits!14 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!413395 (bvand (bvadd lt!413396 diffInBits!14) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!275030 (= lt!413395 (bvand lt!413396 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!275030 (= lt!413396 (bitIndex!0 (size!6779 (buf!7247 b!177)) (currentByte!13402 b!177) (currentBit!13397 b!177)))))

(declare-fun b!275031 () Bool)

(declare-fun array_inv!6503 (array!15649) Bool)

(assert (=> b!275031 (= e!194935 (array_inv!6503 (buf!7247 b!177)))))

(assert (= (and start!61008 res!228754) b!275030))

(assert (= start!61008 b!275031))

(declare-fun m!407603 () Bool)

(assert (=> start!61008 m!407603))

(declare-fun m!407605 () Bool)

(assert (=> b!275030 m!407605))

(declare-fun m!407607 () Bool)

(assert (=> b!275031 m!407607))

(check-sat (not b!275031) (not b!275030) (not start!61008))
(check-sat)
(get-model)

(declare-fun d!94546 () Bool)

(assert (=> d!94546 (= (array_inv!6503 (buf!7247 b!177)) (bvsge (size!6779 (buf!7247 b!177)) #b00000000000000000000000000000000))))

(assert (=> b!275031 d!94546))

(declare-fun d!94548 () Bool)

(declare-fun e!194950 () Bool)

(assert (=> d!94548 e!194950))

(declare-fun res!228768 () Bool)

(assert (=> d!94548 (=> (not res!228768) (not e!194950))))

(declare-fun lt!413437 () (_ BitVec 64))

(declare-fun lt!413434 () (_ BitVec 64))

(declare-fun lt!413433 () (_ BitVec 64))

(assert (=> d!94548 (= res!228768 (= lt!413433 (bvsub lt!413434 lt!413437)))))

(assert (=> d!94548 (or (= (bvand lt!413434 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!413437 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!413434 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!413434 lt!413437) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!94548 (= lt!413437 (remainingBits!0 ((_ sign_extend 32) (size!6779 (buf!7247 b!177))) ((_ sign_extend 32) (currentByte!13402 b!177)) ((_ sign_extend 32) (currentBit!13397 b!177))))))

(declare-fun lt!413438 () (_ BitVec 64))

(declare-fun lt!413436 () (_ BitVec 64))

(assert (=> d!94548 (= lt!413434 (bvmul lt!413438 lt!413436))))

(assert (=> d!94548 (or (= lt!413438 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!413436 (bvsdiv (bvmul lt!413438 lt!413436) lt!413438)))))

(assert (=> d!94548 (= lt!413436 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94548 (= lt!413438 ((_ sign_extend 32) (size!6779 (buf!7247 b!177))))))

(assert (=> d!94548 (= lt!413433 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13402 b!177)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13397 b!177))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!94548 (invariant!0 (currentBit!13397 b!177) (currentByte!13402 b!177) (size!6779 (buf!7247 b!177)))))

(assert (=> d!94548 (= (bitIndex!0 (size!6779 (buf!7247 b!177)) (currentByte!13402 b!177) (currentBit!13397 b!177)) lt!413433)))

(declare-fun b!275048 () Bool)

(declare-fun res!228769 () Bool)

(assert (=> b!275048 (=> (not res!228769) (not e!194950))))

(assert (=> b!275048 (= res!228769 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!413433))))

(declare-fun b!275049 () Bool)

(declare-fun lt!413435 () (_ BitVec 64))

(assert (=> b!275049 (= e!194950 (bvsle lt!413433 (bvmul lt!413435 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!275049 (or (= lt!413435 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!413435 #b0000000000000000000000000000000000000000000000000000000000001000) lt!413435)))))

(assert (=> b!275049 (= lt!413435 ((_ sign_extend 32) (size!6779 (buf!7247 b!177))))))

(assert (= (and d!94548 res!228768) b!275048))

(assert (= (and b!275048 res!228769) b!275049))

(declare-fun m!407621 () Bool)

(assert (=> d!94548 m!407621))

(declare-fun m!407623 () Bool)

(assert (=> d!94548 m!407623))

(assert (=> b!275030 d!94548))

(declare-fun d!94560 () Bool)

(assert (=> d!94560 (= (inv!12 b!177) (invariant!0 (currentBit!13397 b!177) (currentByte!13402 b!177) (size!6779 (buf!7247 b!177))))))

(declare-fun bs!23808 () Bool)

(assert (= bs!23808 d!94560))

(assert (=> bs!23808 m!407623))

(assert (=> start!61008 d!94560))

(check-sat (not d!94560) (not d!94548))
