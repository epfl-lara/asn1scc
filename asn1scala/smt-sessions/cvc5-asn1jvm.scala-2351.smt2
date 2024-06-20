; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59972 () Bool)

(assert start!59972)

(declare-fun res!227527 () Bool)

(declare-fun e!193236 () Bool)

(assert (=> start!59972 (=> (not res!227527) (not e!193236))))

(declare-datatypes ((array!15320 0))(
  ( (array!15321 (arr!7645 (Array (_ BitVec 32) (_ BitVec 8))) (size!6658 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12130 0))(
  ( (BitStream!12131 (buf!7126 array!15320) (currentByte!13148 (_ BitVec 32)) (currentBit!13143 (_ BitVec 32))) )
))
(declare-fun thiss!890 () BitStream!12130)

(declare-fun diffInBits!18 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12130 (_ BitVec 64)) Bool)

(assert (=> start!59972 (= res!227527 (moveBitIndexPrecond!0 thiss!890 diffInBits!18))))

(assert (=> start!59972 e!193236))

(declare-fun e!193237 () Bool)

(declare-fun inv!12 (BitStream!12130) Bool)

(assert (=> start!59972 (and (inv!12 thiss!890) e!193237)))

(assert (=> start!59972 true))

(declare-fun lt!411293 () (_ BitVec 64))

(declare-fun b!273355 () Bool)

(declare-fun lt!411292 () (_ BitVec 64))

(assert (=> b!273355 (= e!193236 (and (= lt!411293 (bvand diffInBits!18 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!411293 (bvand (bvadd lt!411292 diffInBits!18) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!273355 (= lt!411293 (bvand lt!411292 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!273355 (= lt!411292 (bitIndex!0 (size!6658 (buf!7126 thiss!890)) (currentByte!13148 thiss!890) (currentBit!13143 thiss!890)))))

(declare-datatypes ((Unit!19313 0))(
  ( (Unit!19314) )
))
(declare-datatypes ((tuple2!22418 0))(
  ( (tuple2!22419 (_1!12241 Unit!19313) (_2!12241 BitStream!12130)) )
))
(declare-fun lt!411291 () tuple2!22418)

(declare-fun moveBitIndex!0 (BitStream!12130 (_ BitVec 64)) tuple2!22418)

(assert (=> b!273355 (= lt!411291 (moveBitIndex!0 thiss!890 diffInBits!18))))

(declare-fun b!273356 () Bool)

(declare-fun array_inv!6382 (array!15320) Bool)

(assert (=> b!273356 (= e!193237 (array_inv!6382 (buf!7126 thiss!890)))))

(assert (= (and start!59972 res!227527) b!273355))

(assert (= start!59972 b!273356))

(declare-fun m!406219 () Bool)

(assert (=> start!59972 m!406219))

(declare-fun m!406221 () Bool)

(assert (=> start!59972 m!406221))

(declare-fun m!406223 () Bool)

(assert (=> b!273355 m!406223))

(declare-fun m!406225 () Bool)

(assert (=> b!273355 m!406225))

(declare-fun m!406227 () Bool)

(assert (=> b!273356 m!406227))

(push 1)

(assert (not b!273355))

(assert (not start!59972))

(assert (not b!273356))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93536 () Bool)

(declare-fun e!193261 () Bool)

(assert (=> d!93536 e!193261))

(declare-fun res!227541 () Bool)

(assert (=> d!93536 (=> (not res!227541) (not e!193261))))

(declare-fun lt!411330 () (_ BitVec 64))

(declare-fun lt!411327 () (_ BitVec 64))

(declare-fun lt!411332 () (_ BitVec 64))

(assert (=> d!93536 (= res!227541 (= lt!411327 (bvsub lt!411330 lt!411332)))))

(assert (=> d!93536 (or (= (bvand lt!411330 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!411332 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!411330 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!411330 lt!411332) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!93536 (= lt!411332 (remainingBits!0 ((_ sign_extend 32) (size!6658 (buf!7126 thiss!890))) ((_ sign_extend 32) (currentByte!13148 thiss!890)) ((_ sign_extend 32) (currentBit!13143 thiss!890))))))

(declare-fun lt!411329 () (_ BitVec 64))

(declare-fun lt!411328 () (_ BitVec 64))

(assert (=> d!93536 (= lt!411330 (bvmul lt!411329 lt!411328))))

(assert (=> d!93536 (or (= lt!411329 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!411328 (bvsdiv (bvmul lt!411329 lt!411328) lt!411329)))))

(assert (=> d!93536 (= lt!411328 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93536 (= lt!411329 ((_ sign_extend 32) (size!6658 (buf!7126 thiss!890))))))

(assert (=> d!93536 (= lt!411327 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13148 thiss!890)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13143 thiss!890))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!93536 (invariant!0 (currentBit!13143 thiss!890) (currentByte!13148 thiss!890) (size!6658 (buf!7126 thiss!890)))))

(assert (=> d!93536 (= (bitIndex!0 (size!6658 (buf!7126 thiss!890)) (currentByte!13148 thiss!890) (currentBit!13143 thiss!890)) lt!411327)))

(declare-fun b!273377 () Bool)

(declare-fun res!227542 () Bool)

(assert (=> b!273377 (=> (not res!227542) (not e!193261))))

(assert (=> b!273377 (= res!227542 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411327))))

(declare-fun b!273378 () Bool)

(declare-fun lt!411331 () (_ BitVec 64))

(assert (=> b!273378 (= e!193261 (bvsle lt!411327 (bvmul lt!411331 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!273378 (or (= lt!411331 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!411331 #b0000000000000000000000000000000000000000000000000000000000001000) lt!411331)))))

(assert (=> b!273378 (= lt!411331 ((_ sign_extend 32) (size!6658 (buf!7126 thiss!890))))))

(assert (= (and d!93536 res!227541) b!273377))

(assert (= (and b!273377 res!227542) b!273378))

(declare-fun m!406251 () Bool)

(assert (=> d!93536 m!406251))

(declare-fun m!406253 () Bool)

(assert (=> d!93536 m!406253))

(assert (=> b!273355 d!93536))

(declare-fun d!93550 () Bool)

(declare-fun lt!411384 () (_ BitVec 32))

(assert (=> d!93550 (= lt!411384 ((_ extract 31 0) (bvsrem diffInBits!18 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!411385 () (_ BitVec 32))

(assert (=> d!93550 (= lt!411385 ((_ extract 31 0) (bvsdiv diffInBits!18 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!193272 () Bool)

(assert (=> d!93550 e!193272))

(declare-fun res!227559 () Bool)

(assert (=> d!93550 (=> (not res!227559) (not e!193272))))

(assert (=> d!93550 (= res!227559 (moveBitIndexPrecond!0 thiss!890 diffInBits!18))))

(declare-fun Unit!19319 () Unit!19313)

(declare-fun Unit!19320 () Unit!19313)

(declare-fun Unit!19321 () Unit!19313)

(assert (=> d!93550 (= (moveBitIndex!0 thiss!890 diffInBits!18) (ite (bvslt (bvadd (currentBit!13143 thiss!890) lt!411384) #b00000000000000000000000000000000) (tuple2!22419 Unit!19319 (BitStream!12131 (buf!7126 thiss!890) (bvsub (bvadd (currentByte!13148 thiss!890) lt!411385) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!411384 (currentBit!13143 thiss!890)))) (ite (bvsge (bvadd (currentBit!13143 thiss!890) lt!411384) #b00000000000000000000000000001000) (tuple2!22419 Unit!19320 (BitStream!12131 (buf!7126 thiss!890) (bvadd (currentByte!13148 thiss!890) lt!411385 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!13143 thiss!890) lt!411384) #b00000000000000000000000000001000))) (tuple2!22419 Unit!19321 (BitStream!12131 (buf!7126 thiss!890) (bvadd (currentByte!13148 thiss!890) lt!411385) (bvadd (currentBit!13143 thiss!890) lt!411384))))))))

(declare-fun b!273395 () Bool)

(declare-fun e!193273 () Bool)

(assert (=> b!273395 (= e!193272 e!193273)))

(declare-fun res!227560 () Bool)

(assert (=> b!273395 (=> (not res!227560) (not e!193273))))

(declare-fun lt!411382 () tuple2!22418)

(declare-fun lt!411381 () (_ BitVec 64))

(assert (=> b!273395 (= res!227560 (= (bvadd lt!411381 diffInBits!18) (bitIndex!0 (size!6658 (buf!7126 (_2!12241 lt!411382))) (currentByte!13148 (_2!12241 lt!411382)) (currentBit!13143 (_2!12241 lt!411382)))))))

(assert (=> b!273395 (or (not (= (bvand lt!411381 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand diffInBits!18 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!411381 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!411381 diffInBits!18) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!273395 (= lt!411381 (bitIndex!0 (size!6658 (buf!7126 thiss!890)) (currentByte!13148 thiss!890) (currentBit!13143 thiss!890)))))

(declare-fun lt!411383 () (_ BitVec 32))

(declare-fun lt!411386 () (_ BitVec 32))

(declare-fun Unit!19322 () Unit!19313)

(declare-fun Unit!19323 () Unit!19313)

(declare-fun Unit!19324 () Unit!19313)

(assert (=> b!273395 (= lt!411382 (ite (bvslt (bvadd (currentBit!13143 thiss!890) lt!411383) #b00000000000000000000000000000000) (tuple2!22419 Unit!19322 (BitStream!12131 (buf!7126 thiss!890) (bvsub (bvadd (currentByte!13148 thiss!890) lt!411386) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!411383 (currentBit!13143 thiss!890)))) (ite (bvsge (bvadd (currentBit!13143 thiss!890) lt!411383) #b00000000000000000000000000001000) (tuple2!22419 Unit!19323 (BitStream!12131 (buf!7126 thiss!890) (bvadd (currentByte!13148 thiss!890) lt!411386 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!13143 thiss!890) lt!411383) #b00000000000000000000000000001000))) (tuple2!22419 Unit!19324 (BitStream!12131 (buf!7126 thiss!890) (bvadd (currentByte!13148 thiss!890) lt!411386) (bvadd (currentBit!13143 thiss!890) lt!411383))))))))

(assert (=> b!273395 (= lt!411383 ((_ extract 31 0) (bvsrem diffInBits!18 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!273395 (= lt!411386 ((_ extract 31 0) (bvsdiv diffInBits!18 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!273396 () Bool)

(assert (=> b!273396 (= e!193273 (and (= (size!6658 (buf!7126 thiss!890)) (size!6658 (buf!7126 (_2!12241 lt!411382)))) (= (buf!7126 thiss!890) (buf!7126 (_2!12241 lt!411382)))))))

(assert (= (and d!93550 res!227559) b!273395))

(assert (= (and b!273395 res!227560) b!273396))

(assert (=> d!93550 m!406219))

(declare-fun m!406261 () Bool)

(assert (=> b!273395 m!406261))

(assert (=> b!273395 m!406223))

(assert (=> b!273355 d!93550))

(declare-fun d!93562 () Bool)

(declare-fun res!227567 () Bool)

(declare-fun e!193280 () Bool)

(assert (=> d!93562 (=> (not res!227567) (not e!193280))))

(assert (=> d!93562 (= res!227567 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6658 (buf!7126 thiss!890)))) diffInBits!18) (bvsle diffInBits!18 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6658 (buf!7126 thiss!890)))))))))

(assert (=> d!93562 (= (moveBitIndexPrecond!0 thiss!890 diffInBits!18) e!193280)))

(declare-fun b!273404 () Bool)

(declare-fun lt!411401 () (_ BitVec 64))

(assert (=> b!273404 (= e!193280 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411401) (bvsle lt!411401 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6658 (buf!7126 thiss!890)))))))))

(assert (=> b!273404 (= lt!411401 (bvadd (bitIndex!0 (size!6658 (buf!7126 thiss!890)) (currentByte!13148 thiss!890) (currentBit!13143 thiss!890)) diffInBits!18))))

(assert (= (and d!93562 res!227567) b!273404))

(assert (=> b!273404 m!406223))

(assert (=> start!59972 d!93562))

(declare-fun d!93564 () Bool)

(assert (=> d!93564 (= (inv!12 thiss!890) (invariant!0 (currentBit!13143 thiss!890) (currentByte!13148 thiss!890) (size!6658 (buf!7126 thiss!890))))))

(declare-fun bs!23585 () Bool)

(assert (= bs!23585 d!93564))

(assert (=> bs!23585 m!406253))

(assert (=> start!59972 d!93564))

(declare-fun d!93566 () Bool)

(assert (=> d!93566 (= (array_inv!6382 (buf!7126 thiss!890)) (bvsge (size!6658 (buf!7126 thiss!890)) #b00000000000000000000000000000000))))

(assert (=> b!273356 d!93566))

(push 1)

(assert (not b!273404))

(assert (not b!273395))

(assert (not d!93536))

(assert (not d!93550))

(assert (not d!93564))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

