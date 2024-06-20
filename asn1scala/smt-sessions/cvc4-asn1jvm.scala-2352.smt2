; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60012 () Bool)

(assert start!60012)

(declare-fun res!227595 () Bool)

(declare-fun e!193327 () Bool)

(assert (=> start!60012 (=> (not res!227595) (not e!193327))))

(declare-datatypes ((array!15333 0))(
  ( (array!15334 (arr!7650 (Array (_ BitVec 32) (_ BitVec 8))) (size!6663 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12140 0))(
  ( (BitStream!12141 (buf!7131 array!15333) (currentByte!13156 (_ BitVec 32)) (currentBit!13151 (_ BitVec 32))) )
))
(declare-fun thiss!890 () BitStream!12140)

(declare-fun diffInBits!18 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12140 (_ BitVec 64)) Bool)

(assert (=> start!60012 (= res!227595 (moveBitIndexPrecond!0 thiss!890 diffInBits!18))))

(assert (=> start!60012 e!193327))

(declare-fun e!193324 () Bool)

(declare-fun inv!12 (BitStream!12140) Bool)

(assert (=> start!60012 (and (inv!12 thiss!890) e!193324)))

(assert (=> start!60012 true))

(declare-fun b!273441 () Bool)

(declare-fun e!193326 () Bool)

(assert (=> b!273441 (= e!193327 e!193326)))

(declare-fun res!227596 () Bool)

(assert (=> b!273441 (=> res!227596 e!193326)))

(declare-datatypes ((Unit!19335 0))(
  ( (Unit!19336) )
))
(declare-datatypes ((tuple2!22428 0))(
  ( (tuple2!22429 (_1!12246 Unit!19335) (_2!12246 BitStream!12140)) )
))
(declare-fun lt!411437 () tuple2!22428)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!273441 (= res!227596 (not (= (bvadd (bitIndex!0 (size!6663 (buf!7131 thiss!890)) (currentByte!13156 thiss!890) (currentBit!13151 thiss!890)) diffInBits!18) (bitIndex!0 (size!6663 (buf!7131 (_2!12246 lt!411437))) (currentByte!13156 (_2!12246 lt!411437)) (currentBit!13151 (_2!12246 lt!411437))))))))

(declare-fun moveBitIndex!0 (BitStream!12140 (_ BitVec 64)) tuple2!22428)

(assert (=> b!273441 (= lt!411437 (moveBitIndex!0 thiss!890 diffInBits!18))))

(declare-fun b!273442 () Bool)

(assert (=> b!273442 (= e!193326 (not (= (size!6663 (buf!7131 thiss!890)) (size!6663 (buf!7131 (_2!12246 lt!411437))))))))

(declare-fun b!273443 () Bool)

(declare-fun array_inv!6387 (array!15333) Bool)

(assert (=> b!273443 (= e!193324 (array_inv!6387 (buf!7131 thiss!890)))))

(assert (= (and start!60012 res!227595) b!273441))

(assert (= (and b!273441 (not res!227596)) b!273442))

(assert (= start!60012 b!273443))

(declare-fun m!406291 () Bool)

(assert (=> start!60012 m!406291))

(declare-fun m!406293 () Bool)

(assert (=> start!60012 m!406293))

(declare-fun m!406295 () Bool)

(assert (=> b!273441 m!406295))

(declare-fun m!406297 () Bool)

(assert (=> b!273441 m!406297))

(declare-fun m!406299 () Bool)

(assert (=> b!273441 m!406299))

(declare-fun m!406301 () Bool)

(assert (=> b!273443 m!406301))

(push 1)

(assert (not start!60012))

(assert (not b!273441))

(assert (not b!273443))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93586 () Bool)

(declare-fun res!227610 () Bool)

(declare-fun e!193337 () Bool)

(assert (=> d!93586 (=> (not res!227610) (not e!193337))))

(assert (=> d!93586 (= res!227610 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6663 (buf!7131 thiss!890)))) diffInBits!18) (bvsle diffInBits!18 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6663 (buf!7131 thiss!890)))))))))

(assert (=> d!93586 (= (moveBitIndexPrecond!0 thiss!890 diffInBits!18) e!193337)))

(declare-fun b!273459 () Bool)

(declare-fun lt!411467 () (_ BitVec 64))

(assert (=> b!273459 (= e!193337 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411467) (bvsle lt!411467 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6663 (buf!7131 thiss!890)))))))))

(assert (=> b!273459 (= lt!411467 (bvadd (bitIndex!0 (size!6663 (buf!7131 thiss!890)) (currentByte!13156 thiss!890) (currentBit!13151 thiss!890)) diffInBits!18))))

(assert (= (and d!93586 res!227610) b!273459))

(assert (=> b!273459 m!406295))

(assert (=> start!60012 d!93586))

(declare-fun d!93592 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!93592 (= (inv!12 thiss!890) (invariant!0 (currentBit!13151 thiss!890) (currentByte!13156 thiss!890) (size!6663 (buf!7131 thiss!890))))))

(declare-fun bs!23590 () Bool)

(assert (= bs!23590 d!93592))

(declare-fun m!406313 () Bool)

(assert (=> bs!23590 m!406313))

(assert (=> start!60012 d!93592))

(declare-fun d!93594 () Bool)

(declare-fun e!193344 () Bool)

(assert (=> d!93594 e!193344))

(declare-fun res!227624 () Bool)

(assert (=> d!93594 (=> (not res!227624) (not e!193344))))

(declare-fun lt!411504 () (_ BitVec 64))

(declare-fun lt!411505 () (_ BitVec 64))

(declare-fun lt!411509 () (_ BitVec 64))

(assert (=> d!93594 (= res!227624 (= lt!411505 (bvsub lt!411509 lt!411504)))))

(assert (=> d!93594 (or (= (bvand lt!411509 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!411504 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!411509 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!411509 lt!411504) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!93594 (= lt!411504 (remainingBits!0 ((_ sign_extend 32) (size!6663 (buf!7131 thiss!890))) ((_ sign_extend 32) (currentByte!13156 thiss!890)) ((_ sign_extend 32) (currentBit!13151 thiss!890))))))

(declare-fun lt!411506 () (_ BitVec 64))

(declare-fun lt!411507 () (_ BitVec 64))

(assert (=> d!93594 (= lt!411509 (bvmul lt!411506 lt!411507))))

(assert (=> d!93594 (or (= lt!411506 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!411507 (bvsdiv (bvmul lt!411506 lt!411507) lt!411506)))))

(assert (=> d!93594 (= lt!411507 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93594 (= lt!411506 ((_ sign_extend 32) (size!6663 (buf!7131 thiss!890))))))

(assert (=> d!93594 (= lt!411505 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13156 thiss!890)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13151 thiss!890))))))

(assert (=> d!93594 (invariant!0 (currentBit!13151 thiss!890) (currentByte!13156 thiss!890) (size!6663 (buf!7131 thiss!890)))))

(assert (=> d!93594 (= (bitIndex!0 (size!6663 (buf!7131 thiss!890)) (currentByte!13156 thiss!890) (currentBit!13151 thiss!890)) lt!411505)))

(declare-fun b!273472 () Bool)

(declare-fun res!227623 () Bool)

(assert (=> b!273472 (=> (not res!227623) (not e!193344))))

(assert (=> b!273472 (= res!227623 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411505))))

(declare-fun b!273473 () Bool)

(declare-fun lt!411508 () (_ BitVec 64))

(assert (=> b!273473 (= e!193344 (bvsle lt!411505 (bvmul lt!411508 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!273473 (or (= lt!411508 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!411508 #b0000000000000000000000000000000000000000000000000000000000001000) lt!411508)))))

(assert (=> b!273473 (= lt!411508 ((_ sign_extend 32) (size!6663 (buf!7131 thiss!890))))))

(assert (= (and d!93594 res!227624) b!273472))

(assert (= (and b!273472 res!227623) b!273473))

(declare-fun m!406321 () Bool)

(assert (=> d!93594 m!406321))

(assert (=> d!93594 m!406313))

(assert (=> b!273441 d!93594))

(declare-fun d!93602 () Bool)

(declare-fun e!193345 () Bool)

(assert (=> d!93602 e!193345))

(declare-fun res!227626 () Bool)

(assert (=> d!93602 (=> (not res!227626) (not e!193345))))

(declare-fun lt!411510 () (_ BitVec 64))

(declare-fun lt!411511 () (_ BitVec 64))

(declare-fun lt!411515 () (_ BitVec 64))

(assert (=> d!93602 (= res!227626 (= lt!411511 (bvsub lt!411515 lt!411510)))))

(assert (=> d!93602 (or (= (bvand lt!411515 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!411510 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!411515 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!411515 lt!411510) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!93602 (= lt!411510 (remainingBits!0 ((_ sign_extend 32) (size!6663 (buf!7131 (_2!12246 lt!411437)))) ((_ sign_extend 32) (currentByte!13156 (_2!12246 lt!411437))) ((_ sign_extend 32) (currentBit!13151 (_2!12246 lt!411437)))))))

(declare-fun lt!411512 () (_ BitVec 64))

(declare-fun lt!411513 () (_ BitVec 64))

(assert (=> d!93602 (= lt!411515 (bvmul lt!411512 lt!411513))))

(assert (=> d!93602 (or (= lt!411512 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!411513 (bvsdiv (bvmul lt!411512 lt!411513) lt!411512)))))

(assert (=> d!93602 (= lt!411513 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93602 (= lt!411512 ((_ sign_extend 32) (size!6663 (buf!7131 (_2!12246 lt!411437)))))))

(assert (=> d!93602 (= lt!411511 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13156 (_2!12246 lt!411437))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13151 (_2!12246 lt!411437)))))))

(assert (=> d!93602 (invariant!0 (currentBit!13151 (_2!12246 lt!411437)) (currentByte!13156 (_2!12246 lt!411437)) (size!6663 (buf!7131 (_2!12246 lt!411437))))))

(assert (=> d!93602 (= (bitIndex!0 (size!6663 (buf!7131 (_2!12246 lt!411437))) (currentByte!13156 (_2!12246 lt!411437)) (currentBit!13151 (_2!12246 lt!411437))) lt!411511)))

(declare-fun b!273474 () Bool)

(declare-fun res!227625 () Bool)

(assert (=> b!273474 (=> (not res!227625) (not e!193345))))

(assert (=> b!273474 (= res!227625 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411511))))

(declare-fun b!273475 () Bool)

(declare-fun lt!411514 () (_ BitVec 64))

(assert (=> b!273475 (= e!193345 (bvsle lt!411511 (bvmul lt!411514 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!273475 (or (= lt!411514 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!411514 #b0000000000000000000000000000000000000000000000000000000000001000) lt!411514)))))

(assert (=> b!273475 (= lt!411514 ((_ sign_extend 32) (size!6663 (buf!7131 (_2!12246 lt!411437)))))))

(assert (= (and d!93602 res!227626) b!273474))

(assert (= (and b!273474 res!227625) b!273475))

(declare-fun m!406323 () Bool)

(assert (=> d!93602 m!406323))

(declare-fun m!406325 () Bool)

(assert (=> d!93602 m!406325))

(assert (=> b!273441 d!93602))

(declare-fun d!93604 () Bool)

(declare-fun lt!411568 () (_ BitVec 32))

(assert (=> d!93604 (= lt!411568 ((_ extract 31 0) (bvsrem diffInBits!18 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!411567 () (_ BitVec 32))

(assert (=> d!93604 (= lt!411567 ((_ extract 31 0) (bvsdiv diffInBits!18 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!193366 () Bool)

(assert (=> d!93604 e!193366))

(declare-fun res!227646 () Bool)

(assert (=> d!93604 (=> (not res!227646) (not e!193366))))

(assert (=> d!93604 (= res!227646 (moveBitIndexPrecond!0 thiss!890 diffInBits!18))))

(declare-fun Unit!19349 () Unit!19335)

(declare-fun Unit!19350 () Unit!19335)

(declare-fun Unit!19351 () Unit!19335)

(assert (=> d!93604 (= (moveBitIndex!0 thiss!890 diffInBits!18) (ite (bvslt (bvadd (currentBit!13151 thiss!890) lt!411568) #b00000000000000000000000000000000) (tuple2!22429 Unit!19349 (BitStream!12141 (buf!7131 thiss!890) (bvsub (bvadd (currentByte!13156 thiss!890) lt!411567) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!411568 (currentBit!13151 thiss!890)))) (ite (bvsge (bvadd (currentBit!13151 thiss!890) lt!411568) #b00000000000000000000000000001000) (tuple2!22429 Unit!19350 (BitStream!12141 (buf!7131 thiss!890) (bvadd (currentByte!13156 thiss!890) lt!411567 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!13151 thiss!890) lt!411568) #b00000000000000000000000000001000))) (tuple2!22429 Unit!19351 (BitStream!12141 (buf!7131 thiss!890) (bvadd (currentByte!13156 thiss!890) lt!411567) (bvadd (currentBit!13151 thiss!890) lt!411568))))))))

(declare-fun b!273496 () Bool)

(declare-fun e!193365 () Bool)

(assert (=> b!273496 (= e!193366 e!193365)))

(declare-fun res!227647 () Bool)

(assert (=> b!273496 (=> (not res!227647) (not e!193365))))

(declare-fun lt!411569 () (_ BitVec 64))

(declare-fun lt!411570 () tuple2!22428)

(assert (=> b!273496 (= res!227647 (= (bvadd lt!411569 diffInBits!18) (bitIndex!0 (size!6663 (buf!7131 (_2!12246 lt!411570))) (currentByte!13156 (_2!12246 lt!411570)) (currentBit!13151 (_2!12246 lt!411570)))))))

(assert (=> b!273496 (or (not (= (bvand lt!411569 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand diffInBits!18 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!411569 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!411569 diffInBits!18) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!273496 (= lt!411569 (bitIndex!0 (size!6663 (buf!7131 thiss!890)) (currentByte!13156 thiss!890) (currentBit!13151 thiss!890)))))

(declare-fun lt!411572 () (_ BitVec 32))

(declare-fun lt!411571 () (_ BitVec 32))

(declare-fun Unit!19352 () Unit!19335)

(declare-fun Unit!19353 () Unit!19335)

(declare-fun Unit!19354 () Unit!19335)

(assert (=> b!273496 (= lt!411570 (ite (bvslt (bvadd (currentBit!13151 thiss!890) lt!411572) #b00000000000000000000000000000000) (tuple2!22429 Unit!19352 (BitStream!12141 (buf!7131 thiss!890) (bvsub (bvadd (currentByte!13156 thiss!890) lt!411571) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!411572 (currentBit!13151 thiss!890)))) (ite (bvsge (bvadd (currentBit!13151 thiss!890) lt!411572) #b00000000000000000000000000001000) (tuple2!22429 Unit!19353 (BitStream!12141 (buf!7131 thiss!890) (bvadd (currentByte!13156 thiss!890) lt!411571 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!13151 thiss!890) lt!411572) #b00000000000000000000000000001000))) (tuple2!22429 Unit!19354 (BitStream!12141 (buf!7131 thiss!890) (bvadd (currentByte!13156 thiss!890) lt!411571) (bvadd (currentBit!13151 thiss!890) lt!411572))))))))

(assert (=> b!273496 (= lt!411572 ((_ extract 31 0) (bvsrem diffInBits!18 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!273496 (= lt!411571 ((_ extract 31 0) (bvsdiv diffInBits!18 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!273497 () Bool)

(assert (=> b!273497 (= e!193365 (and (= (size!6663 (buf!7131 thiss!890)) (size!6663 (buf!7131 (_2!12246 lt!411570)))) (= (buf!7131 thiss!890) (buf!7131 (_2!12246 lt!411570)))))))

(assert (= (and d!93604 res!227646) b!273496))

(assert (= (and b!273496 res!227647) b!273497))

(assert (=> d!93604 m!406291))

(declare-fun m!406331 () Bool)

(assert (=> b!273496 m!406331))

(assert (=> b!273496 m!406295))

(assert (=> b!273441 d!93604))

(declare-fun d!93614 () Bool)

(assert (=> d!93614 (= (array_inv!6387 (buf!7131 thiss!890)) (bvsge (size!6663 (buf!7131 thiss!890)) #b00000000000000000000000000000000))))

(assert (=> b!273443 d!93614))

(push 1)

(assert (not b!273496))

(assert (not d!93592))

(assert (not d!93604))

(assert (not d!93594))

(assert (not b!273459))

(assert (not d!93602))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

