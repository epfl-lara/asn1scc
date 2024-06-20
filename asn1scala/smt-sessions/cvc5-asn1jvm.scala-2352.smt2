; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60008 () Bool)

(assert start!60008)

(declare-fun res!227584 () Bool)

(declare-fun e!193301 () Bool)

(assert (=> start!60008 (=> (not res!227584) (not e!193301))))

(declare-datatypes ((array!15329 0))(
  ( (array!15330 (arr!7648 (Array (_ BitVec 32) (_ BitVec 8))) (size!6661 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12136 0))(
  ( (BitStream!12137 (buf!7129 array!15329) (currentByte!13154 (_ BitVec 32)) (currentBit!13149 (_ BitVec 32))) )
))
(declare-fun thiss!890 () BitStream!12136)

(declare-fun diffInBits!18 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12136 (_ BitVec 64)) Bool)

(assert (=> start!60008 (= res!227584 (moveBitIndexPrecond!0 thiss!890 diffInBits!18))))

(assert (=> start!60008 e!193301))

(declare-fun e!193303 () Bool)

(declare-fun inv!12 (BitStream!12136) Bool)

(assert (=> start!60008 (and (inv!12 thiss!890) e!193303)))

(assert (=> start!60008 true))

(declare-fun b!273423 () Bool)

(declare-fun e!193302 () Bool)

(assert (=> b!273423 (= e!193301 e!193302)))

(declare-fun res!227583 () Bool)

(assert (=> b!273423 (=> res!227583 e!193302)))

(declare-datatypes ((Unit!19331 0))(
  ( (Unit!19332) )
))
(declare-datatypes ((tuple2!22424 0))(
  ( (tuple2!22425 (_1!12244 Unit!19331) (_2!12244 BitStream!12136)) )
))
(declare-fun lt!411431 () tuple2!22424)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!273423 (= res!227583 (not (= (bvadd (bitIndex!0 (size!6661 (buf!7129 thiss!890)) (currentByte!13154 thiss!890) (currentBit!13149 thiss!890)) diffInBits!18) (bitIndex!0 (size!6661 (buf!7129 (_2!12244 lt!411431))) (currentByte!13154 (_2!12244 lt!411431)) (currentBit!13149 (_2!12244 lt!411431))))))))

(declare-fun moveBitIndex!0 (BitStream!12136 (_ BitVec 64)) tuple2!22424)

(assert (=> b!273423 (= lt!411431 (moveBitIndex!0 thiss!890 diffInBits!18))))

(declare-fun b!273424 () Bool)

(assert (=> b!273424 (= e!193302 (not (= (size!6661 (buf!7129 thiss!890)) (size!6661 (buf!7129 (_2!12244 lt!411431))))))))

(declare-fun b!273425 () Bool)

(declare-fun array_inv!6385 (array!15329) Bool)

(assert (=> b!273425 (= e!193303 (array_inv!6385 (buf!7129 thiss!890)))))

(assert (= (and start!60008 res!227584) b!273423))

(assert (= (and b!273423 (not res!227583)) b!273424))

(assert (= start!60008 b!273425))

(declare-fun m!406267 () Bool)

(assert (=> start!60008 m!406267))

(declare-fun m!406269 () Bool)

(assert (=> start!60008 m!406269))

(declare-fun m!406271 () Bool)

(assert (=> b!273423 m!406271))

(declare-fun m!406273 () Bool)

(assert (=> b!273423 m!406273))

(declare-fun m!406275 () Bool)

(assert (=> b!273423 m!406275))

(declare-fun m!406277 () Bool)

(assert (=> b!273425 m!406277))

(push 1)

(assert (not b!273425))

(assert (not start!60008))

(assert (not b!273423))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93576 () Bool)

(assert (=> d!93576 (= (array_inv!6385 (buf!7129 thiss!890)) (bvsge (size!6661 (buf!7129 thiss!890)) #b00000000000000000000000000000000))))

(assert (=> b!273425 d!93576))

(declare-fun d!93578 () Bool)

(declare-fun res!227607 () Bool)

(declare-fun e!193334 () Bool)

(assert (=> d!93578 (=> (not res!227607) (not e!193334))))

(assert (=> d!93578 (= res!227607 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6661 (buf!7129 thiss!890)))) diffInBits!18) (bvsle diffInBits!18 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6661 (buf!7129 thiss!890)))))))))

(assert (=> d!93578 (= (moveBitIndexPrecond!0 thiss!890 diffInBits!18) e!193334)))

(declare-fun b!273455 () Bool)

(declare-fun lt!411464 () (_ BitVec 64))

(assert (=> b!273455 (= e!193334 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411464) (bvsle lt!411464 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6661 (buf!7129 thiss!890)))))))))

(assert (=> b!273455 (= lt!411464 (bvadd (bitIndex!0 (size!6661 (buf!7129 thiss!890)) (currentByte!13154 thiss!890) (currentBit!13149 thiss!890)) diffInBits!18))))

(assert (= (and d!93578 res!227607) b!273455))

(assert (=> b!273455 m!406271))

(assert (=> start!60008 d!93578))

(declare-fun d!93584 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!93584 (= (inv!12 thiss!890) (invariant!0 (currentBit!13149 thiss!890) (currentByte!13154 thiss!890) (size!6661 (buf!7129 thiss!890))))))

(declare-fun bs!23589 () Bool)

(assert (= bs!23589 d!93584))

(declare-fun m!406311 () Bool)

(assert (=> bs!23589 m!406311))

(assert (=> start!60008 d!93584))

(declare-fun d!93588 () Bool)

(declare-fun e!193340 () Bool)

(assert (=> d!93588 e!193340))

(declare-fun res!227615 () Bool)

(assert (=> d!93588 (=> (not res!227615) (not e!193340))))

(declare-fun lt!411481 () (_ BitVec 64))

(declare-fun lt!411480 () (_ BitVec 64))

(declare-fun lt!411484 () (_ BitVec 64))

(assert (=> d!93588 (= res!227615 (= lt!411484 (bvsub lt!411480 lt!411481)))))

(assert (=> d!93588 (or (= (bvand lt!411480 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!411481 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!411480 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!411480 lt!411481) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!93588 (= lt!411481 (remainingBits!0 ((_ sign_extend 32) (size!6661 (buf!7129 thiss!890))) ((_ sign_extend 32) (currentByte!13154 thiss!890)) ((_ sign_extend 32) (currentBit!13149 thiss!890))))))

(declare-fun lt!411483 () (_ BitVec 64))

(declare-fun lt!411485 () (_ BitVec 64))

(assert (=> d!93588 (= lt!411480 (bvmul lt!411483 lt!411485))))

(assert (=> d!93588 (or (= lt!411483 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!411485 (bvsdiv (bvmul lt!411483 lt!411485) lt!411483)))))

(assert (=> d!93588 (= lt!411485 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93588 (= lt!411483 ((_ sign_extend 32) (size!6661 (buf!7129 thiss!890))))))

(assert (=> d!93588 (= lt!411484 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13154 thiss!890)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13149 thiss!890))))))

(assert (=> d!93588 (invariant!0 (currentBit!13149 thiss!890) (currentByte!13154 thiss!890) (size!6661 (buf!7129 thiss!890)))))

(assert (=> d!93588 (= (bitIndex!0 (size!6661 (buf!7129 thiss!890)) (currentByte!13154 thiss!890) (currentBit!13149 thiss!890)) lt!411484)))

(declare-fun b!273464 () Bool)

(declare-fun res!227616 () Bool)

(assert (=> b!273464 (=> (not res!227616) (not e!193340))))

(assert (=> b!273464 (= res!227616 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411484))))

(declare-fun b!273465 () Bool)

(declare-fun lt!411482 () (_ BitVec 64))

(assert (=> b!273465 (= e!193340 (bvsle lt!411484 (bvmul lt!411482 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!273465 (or (= lt!411482 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!411482 #b0000000000000000000000000000000000000000000000000000000000001000) lt!411482)))))

(assert (=> b!273465 (= lt!411482 ((_ sign_extend 32) (size!6661 (buf!7129 thiss!890))))))

(assert (= (and d!93588 res!227615) b!273464))

(assert (= (and b!273464 res!227616) b!273465))

(declare-fun m!406315 () Bool)

(assert (=> d!93588 m!406315))

(assert (=> d!93588 m!406311))

(assert (=> b!273423 d!93588))

(declare-fun d!93596 () Bool)

(declare-fun e!193341 () Bool)

(assert (=> d!93596 e!193341))

(declare-fun res!227617 () Bool)

(assert (=> d!93596 (=> (not res!227617) (not e!193341))))

(declare-fun lt!411490 () (_ BitVec 64))

(declare-fun lt!411486 () (_ BitVec 64))

(declare-fun lt!411487 () (_ BitVec 64))

(assert (=> d!93596 (= res!227617 (= lt!411490 (bvsub lt!411486 lt!411487)))))

(assert (=> d!93596 (or (= (bvand lt!411486 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!411487 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!411486 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!411486 lt!411487) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!93596 (= lt!411487 (remainingBits!0 ((_ sign_extend 32) (size!6661 (buf!7129 (_2!12244 lt!411431)))) ((_ sign_extend 32) (currentByte!13154 (_2!12244 lt!411431))) ((_ sign_extend 32) (currentBit!13149 (_2!12244 lt!411431)))))))

(declare-fun lt!411489 () (_ BitVec 64))

(declare-fun lt!411491 () (_ BitVec 64))

(assert (=> d!93596 (= lt!411486 (bvmul lt!411489 lt!411491))))

(assert (=> d!93596 (or (= lt!411489 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!411491 (bvsdiv (bvmul lt!411489 lt!411491) lt!411489)))))

(assert (=> d!93596 (= lt!411491 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93596 (= lt!411489 ((_ sign_extend 32) (size!6661 (buf!7129 (_2!12244 lt!411431)))))))

(assert (=> d!93596 (= lt!411490 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13154 (_2!12244 lt!411431))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13149 (_2!12244 lt!411431)))))))

(assert (=> d!93596 (invariant!0 (currentBit!13149 (_2!12244 lt!411431)) (currentByte!13154 (_2!12244 lt!411431)) (size!6661 (buf!7129 (_2!12244 lt!411431))))))

(assert (=> d!93596 (= (bitIndex!0 (size!6661 (buf!7129 (_2!12244 lt!411431))) (currentByte!13154 (_2!12244 lt!411431)) (currentBit!13149 (_2!12244 lt!411431))) lt!411490)))

(declare-fun b!273466 () Bool)

(declare-fun res!227618 () Bool)

(assert (=> b!273466 (=> (not res!227618) (not e!193341))))

(assert (=> b!273466 (= res!227618 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411490))))

(declare-fun b!273467 () Bool)

(declare-fun lt!411488 () (_ BitVec 64))

(assert (=> b!273467 (= e!193341 (bvsle lt!411490 (bvmul lt!411488 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!273467 (or (= lt!411488 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!411488 #b0000000000000000000000000000000000000000000000000000000000001000) lt!411488)))))

(assert (=> b!273467 (= lt!411488 ((_ sign_extend 32) (size!6661 (buf!7129 (_2!12244 lt!411431)))))))

(assert (= (and d!93596 res!227617) b!273466))

(assert (= (and b!273466 res!227618) b!273467))

(declare-fun m!406317 () Bool)

(assert (=> d!93596 m!406317))

(declare-fun m!406319 () Bool)

(assert (=> d!93596 m!406319))

(assert (=> b!273423 d!93596))

(declare-fun d!93598 () Bool)

(declare-fun lt!411549 () (_ BitVec 32))

(assert (=> d!93598 (= lt!411549 ((_ extract 31 0) (bvsrem diffInBits!18 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!411553 () (_ BitVec 32))

(assert (=> d!93598 (= lt!411553 ((_ extract 31 0) (bvsdiv diffInBits!18 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!193360 () Bool)

(assert (=> d!93598 e!193360))

(declare-fun res!227641 () Bool)

(assert (=> d!93598 (=> (not res!227641) (not e!193360))))

(assert (=> d!93598 (= res!227641 (moveBitIndexPrecond!0 thiss!890 diffInBits!18))))

(declare-fun Unit!19343 () Unit!19331)

(declare-fun Unit!19344 () Unit!19331)

(declare-fun Unit!19345 () Unit!19331)

(assert (=> d!93598 (= (moveBitIndex!0 thiss!890 diffInBits!18) (ite (bvslt (bvadd (currentBit!13149 thiss!890) lt!411549) #b00000000000000000000000000000000) (tuple2!22425 Unit!19343 (BitStream!12137 (buf!7129 thiss!890) (bvsub (bvadd (currentByte!13154 thiss!890) lt!411553) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!411549 (currentBit!13149 thiss!890)))) (ite (bvsge (bvadd (currentBit!13149 thiss!890) lt!411549) #b00000000000000000000000000001000) (tuple2!22425 Unit!19344 (BitStream!12137 (buf!7129 thiss!890) (bvadd (currentByte!13154 thiss!890) lt!411553 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!13149 thiss!890) lt!411549) #b00000000000000000000000000001000))) (tuple2!22425 Unit!19345 (BitStream!12137 (buf!7129 thiss!890) (bvadd (currentByte!13154 thiss!890) lt!411553) (bvadd (currentBit!13149 thiss!890) lt!411549))))))))

(declare-fun b!273490 () Bool)

(declare-fun e!193359 () Bool)

(assert (=> b!273490 (= e!193360 e!193359)))

(declare-fun res!227640 () Bool)

(assert (=> b!273490 (=> (not res!227640) (not e!193359))))

(declare-fun lt!411552 () tuple2!22424)

(declare-fun lt!411554 () (_ BitVec 64))

(assert (=> b!273490 (= res!227640 (= (bvadd lt!411554 diffInBits!18) (bitIndex!0 (size!6661 (buf!7129 (_2!12244 lt!411552))) (currentByte!13154 (_2!12244 lt!411552)) (currentBit!13149 (_2!12244 lt!411552)))))))

(assert (=> b!273490 (or (not (= (bvand lt!411554 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand diffInBits!18 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!411554 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!411554 diffInBits!18) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!273490 (= lt!411554 (bitIndex!0 (size!6661 (buf!7129 thiss!890)) (currentByte!13154 thiss!890) (currentBit!13149 thiss!890)))))

(declare-fun lt!411551 () (_ BitVec 32))

(declare-fun lt!411550 () (_ BitVec 32))

(declare-fun Unit!19346 () Unit!19331)

(declare-fun Unit!19347 () Unit!19331)

(declare-fun Unit!19348 () Unit!19331)

(assert (=> b!273490 (= lt!411552 (ite (bvslt (bvadd (currentBit!13149 thiss!890) lt!411551) #b00000000000000000000000000000000) (tuple2!22425 Unit!19346 (BitStream!12137 (buf!7129 thiss!890) (bvsub (bvadd (currentByte!13154 thiss!890) lt!411550) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!411551 (currentBit!13149 thiss!890)))) (ite (bvsge (bvadd (currentBit!13149 thiss!890) lt!411551) #b00000000000000000000000000001000) (tuple2!22425 Unit!19347 (BitStream!12137 (buf!7129 thiss!890) (bvadd (currentByte!13154 thiss!890) lt!411550 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!13149 thiss!890) lt!411551) #b00000000000000000000000000001000))) (tuple2!22425 Unit!19348 (BitStream!12137 (buf!7129 thiss!890) (bvadd (currentByte!13154 thiss!890) lt!411550) (bvadd (currentBit!13149 thiss!890) lt!411551))))))))

(assert (=> b!273490 (= lt!411551 ((_ extract 31 0) (bvsrem diffInBits!18 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!273490 (= lt!411550 ((_ extract 31 0) (bvsdiv diffInBits!18 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!273491 () Bool)

(assert (=> b!273491 (= e!193359 (and (= (size!6661 (buf!7129 thiss!890)) (size!6661 (buf!7129 (_2!12244 lt!411552)))) (= (buf!7129 thiss!890) (buf!7129 (_2!12244 lt!411552)))))))

(assert (= (and d!93598 res!227641) b!273490))

(assert (= (and b!273490 res!227640) b!273491))

(assert (=> d!93598 m!406267))

(declare-fun m!406329 () Bool)

(assert (=> b!273490 m!406329))

(assert (=> b!273490 m!406271))

(assert (=> b!273423 d!93598))

(push 1)

(assert (not b!273490))

(assert (not d!93588))

(assert (not d!93596))

(assert (not d!93584))

(assert (not d!93598))

(assert (not b!273455))

(check-sat)

(pop 1)

(push 1)

(check-sat)

