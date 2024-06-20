; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60070 () Bool)

(assert start!60070)

(declare-fun res!227686 () Bool)

(declare-fun e!193426 () Bool)

(assert (=> start!60070 (=> (not res!227686) (not e!193426))))

(declare-datatypes ((array!15348 0))(
  ( (array!15349 (arr!7655 (Array (_ BitVec 32) (_ BitVec 8))) (size!6668 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12150 0))(
  ( (BitStream!12151 (buf!7136 array!15348) (currentByte!13166 (_ BitVec 32)) (currentBit!13161 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12150)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12150 (_ BitVec 64)) Bool)

(assert (=> start!60070 (= res!227686 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60070 e!193426))

(declare-fun e!193423 () Bool)

(declare-fun inv!12 (BitStream!12150) Bool)

(assert (=> start!60070 (and (inv!12 thiss!882) e!193423)))

(assert (=> start!60070 true))

(declare-fun b!273552 () Bool)

(declare-fun e!193425 () Bool)

(assert (=> b!273552 (= e!193426 e!193425)))

(declare-fun res!227685 () Bool)

(assert (=> b!273552 (=> (not res!227685) (not e!193425))))

(declare-fun lt!411587 () (_ BitVec 32))

(assert (=> b!273552 (= res!227685 (bvslt (bvadd (currentBit!13161 thiss!882) lt!411587) #b00000000000000000000000000000000))))

(assert (=> b!273552 (= lt!411587 ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!273553 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!273553 (= e!193425 (not (invariant!0 (bvadd #b00000000000000000000000000001000 lt!411587 (currentBit!13161 thiss!882)) (bvsub (bvadd (currentByte!13166 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (size!6668 (buf!7136 thiss!882)))))))

(declare-fun b!273554 () Bool)

(declare-fun array_inv!6392 (array!15348) Bool)

(assert (=> b!273554 (= e!193423 (array_inv!6392 (buf!7136 thiss!882)))))

(assert (= (and start!60070 res!227686) b!273552))

(assert (= (and b!273552 res!227685) b!273553))

(assert (= start!60070 b!273554))

(declare-fun m!406369 () Bool)

(assert (=> start!60070 m!406369))

(declare-fun m!406371 () Bool)

(assert (=> start!60070 m!406371))

(declare-fun m!406373 () Bool)

(assert (=> b!273553 m!406373))

(declare-fun m!406375 () Bool)

(assert (=> b!273554 m!406375))

(check-sat (not b!273554) (not b!273553) (not start!60070))
(check-sat)
(get-model)

(declare-fun d!93638 () Bool)

(assert (=> d!93638 (= (array_inv!6392 (buf!7136 thiss!882)) (bvsge (size!6668 (buf!7136 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!273554 d!93638))

(declare-fun d!93640 () Bool)

(assert (=> d!93640 (= (invariant!0 (bvadd #b00000000000000000000000000001000 lt!411587 (currentBit!13161 thiss!882)) (bvsub (bvadd (currentByte!13166 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (size!6668 (buf!7136 thiss!882))) (and (bvsge (bvadd #b00000000000000000000000000001000 lt!411587 (currentBit!13161 thiss!882)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000001000 lt!411587 (currentBit!13161 thiss!882)) #b00000000000000000000000000001000) (bvsge (bvsub (bvadd (currentByte!13166 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (or (bvslt (bvsub (bvadd (currentByte!13166 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (size!6668 (buf!7136 thiss!882))) (and (= (bvadd #b00000000000000000000000000001000 lt!411587 (currentBit!13161 thiss!882)) #b00000000000000000000000000000000) (= (bvsub (bvadd (currentByte!13166 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (size!6668 (buf!7136 thiss!882)))))))))

(assert (=> b!273553 d!93640))

(declare-fun d!93642 () Bool)

(declare-fun res!227695 () Bool)

(declare-fun e!193441 () Bool)

(assert (=> d!93642 (=> (not res!227695) (not e!193441))))

(assert (=> d!93642 (= res!227695 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6668 (buf!7136 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6668 (buf!7136 thiss!882)))))))))

(assert (=> d!93642 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!193441)))

(declare-fun b!273567 () Bool)

(declare-fun lt!411593 () (_ BitVec 64))

(assert (=> b!273567 (= e!193441 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411593) (bvsle lt!411593 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6668 (buf!7136 thiss!882)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!273567 (= lt!411593 (bvadd (bitIndex!0 (size!6668 (buf!7136 thiss!882)) (currentByte!13166 thiss!882) (currentBit!13161 thiss!882)) diffInBits!15))))

(assert (= (and d!93642 res!227695) b!273567))

(declare-fun m!406385 () Bool)

(assert (=> b!273567 m!406385))

(assert (=> start!60070 d!93642))

(declare-fun d!93648 () Bool)

(assert (=> d!93648 (= (inv!12 thiss!882) (invariant!0 (currentBit!13161 thiss!882) (currentByte!13166 thiss!882) (size!6668 (buf!7136 thiss!882))))))

(declare-fun bs!23600 () Bool)

(assert (= bs!23600 d!93648))

(declare-fun m!406387 () Bool)

(assert (=> bs!23600 m!406387))

(assert (=> start!60070 d!93648))

(check-sat (not b!273567) (not d!93648))
(check-sat)
(get-model)

(declare-fun d!93662 () Bool)

(declare-fun e!193450 () Bool)

(assert (=> d!93662 e!193450))

(declare-fun res!227707 () Bool)

(assert (=> d!93662 (=> (not res!227707) (not e!193450))))

(declare-fun lt!411615 () (_ BitVec 64))

(declare-fun lt!411617 () (_ BitVec 64))

(declare-fun lt!411613 () (_ BitVec 64))

(assert (=> d!93662 (= res!227707 (= lt!411617 (bvsub lt!411613 lt!411615)))))

(assert (=> d!93662 (or (= (bvand lt!411613 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!411615 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!411613 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!411613 lt!411615) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!93662 (= lt!411615 (remainingBits!0 ((_ sign_extend 32) (size!6668 (buf!7136 thiss!882))) ((_ sign_extend 32) (currentByte!13166 thiss!882)) ((_ sign_extend 32) (currentBit!13161 thiss!882))))))

(declare-fun lt!411616 () (_ BitVec 64))

(declare-fun lt!411614 () (_ BitVec 64))

(assert (=> d!93662 (= lt!411613 (bvmul lt!411616 lt!411614))))

(assert (=> d!93662 (or (= lt!411616 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!411614 (bvsdiv (bvmul lt!411616 lt!411614) lt!411616)))))

(assert (=> d!93662 (= lt!411614 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93662 (= lt!411616 ((_ sign_extend 32) (size!6668 (buf!7136 thiss!882))))))

(assert (=> d!93662 (= lt!411617 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13166 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13161 thiss!882))))))

(assert (=> d!93662 (invariant!0 (currentBit!13161 thiss!882) (currentByte!13166 thiss!882) (size!6668 (buf!7136 thiss!882)))))

(assert (=> d!93662 (= (bitIndex!0 (size!6668 (buf!7136 thiss!882)) (currentByte!13166 thiss!882) (currentBit!13161 thiss!882)) lt!411617)))

(declare-fun b!273580 () Bool)

(declare-fun res!227706 () Bool)

(assert (=> b!273580 (=> (not res!227706) (not e!193450))))

(assert (=> b!273580 (= res!227706 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411617))))

(declare-fun b!273581 () Bool)

(declare-fun lt!411612 () (_ BitVec 64))

(assert (=> b!273581 (= e!193450 (bvsle lt!411617 (bvmul lt!411612 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!273581 (or (= lt!411612 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!411612 #b0000000000000000000000000000000000000000000000000000000000001000) lt!411612)))))

(assert (=> b!273581 (= lt!411612 ((_ sign_extend 32) (size!6668 (buf!7136 thiss!882))))))

(assert (= (and d!93662 res!227707) b!273580))

(assert (= (and b!273580 res!227706) b!273581))

(declare-fun m!406397 () Bool)

(assert (=> d!93662 m!406397))

(assert (=> d!93662 m!406387))

(assert (=> b!273567 d!93662))

(declare-fun d!93664 () Bool)

(assert (=> d!93664 (= (invariant!0 (currentBit!13161 thiss!882) (currentByte!13166 thiss!882) (size!6668 (buf!7136 thiss!882))) (and (bvsge (currentBit!13161 thiss!882) #b00000000000000000000000000000000) (bvslt (currentBit!13161 thiss!882) #b00000000000000000000000000001000) (bvsge (currentByte!13166 thiss!882) #b00000000000000000000000000000000) (or (bvslt (currentByte!13166 thiss!882) (size!6668 (buf!7136 thiss!882))) (and (= (currentBit!13161 thiss!882) #b00000000000000000000000000000000) (= (currentByte!13166 thiss!882) (size!6668 (buf!7136 thiss!882)))))))))

(assert (=> d!93648 d!93664))

(check-sat (not d!93662))
(check-sat)
