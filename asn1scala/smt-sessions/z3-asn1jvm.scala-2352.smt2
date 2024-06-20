; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60010 () Bool)

(assert start!60010)

(declare-fun res!227590 () Bool)

(declare-fun e!193312 () Bool)

(assert (=> start!60010 (=> (not res!227590) (not e!193312))))

(declare-datatypes ((array!15331 0))(
  ( (array!15332 (arr!7649 (Array (_ BitVec 32) (_ BitVec 8))) (size!6662 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12138 0))(
  ( (BitStream!12139 (buf!7130 array!15331) (currentByte!13155 (_ BitVec 32)) (currentBit!13150 (_ BitVec 32))) )
))
(declare-fun thiss!890 () BitStream!12138)

(declare-fun diffInBits!18 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12138 (_ BitVec 64)) Bool)

(assert (=> start!60010 (= res!227590 (moveBitIndexPrecond!0 thiss!890 diffInBits!18))))

(assert (=> start!60010 e!193312))

(declare-fun e!193315 () Bool)

(declare-fun inv!12 (BitStream!12138) Bool)

(assert (=> start!60010 (and (inv!12 thiss!890) e!193315)))

(assert (=> start!60010 true))

(declare-fun b!273432 () Bool)

(declare-fun e!193313 () Bool)

(assert (=> b!273432 (= e!193312 e!193313)))

(declare-fun res!227589 () Bool)

(assert (=> b!273432 (=> res!227589 e!193313)))

(declare-datatypes ((Unit!19333 0))(
  ( (Unit!19334) )
))
(declare-datatypes ((tuple2!22426 0))(
  ( (tuple2!22427 (_1!12245 Unit!19333) (_2!12245 BitStream!12138)) )
))
(declare-fun lt!411434 () tuple2!22426)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!273432 (= res!227589 (not (= (bvadd (bitIndex!0 (size!6662 (buf!7130 thiss!890)) (currentByte!13155 thiss!890) (currentBit!13150 thiss!890)) diffInBits!18) (bitIndex!0 (size!6662 (buf!7130 (_2!12245 lt!411434))) (currentByte!13155 (_2!12245 lt!411434)) (currentBit!13150 (_2!12245 lt!411434))))))))

(declare-fun moveBitIndex!0 (BitStream!12138 (_ BitVec 64)) tuple2!22426)

(assert (=> b!273432 (= lt!411434 (moveBitIndex!0 thiss!890 diffInBits!18))))

(declare-fun b!273433 () Bool)

(assert (=> b!273433 (= e!193313 (not (= (size!6662 (buf!7130 thiss!890)) (size!6662 (buf!7130 (_2!12245 lt!411434))))))))

(declare-fun b!273434 () Bool)

(declare-fun array_inv!6386 (array!15331) Bool)

(assert (=> b!273434 (= e!193315 (array_inv!6386 (buf!7130 thiss!890)))))

(assert (= (and start!60010 res!227590) b!273432))

(assert (= (and b!273432 (not res!227589)) b!273433))

(assert (= start!60010 b!273434))

(declare-fun m!406279 () Bool)

(assert (=> start!60010 m!406279))

(declare-fun m!406281 () Bool)

(assert (=> start!60010 m!406281))

(declare-fun m!406283 () Bool)

(assert (=> b!273432 m!406283))

(declare-fun m!406285 () Bool)

(assert (=> b!273432 m!406285))

(declare-fun m!406287 () Bool)

(assert (=> b!273432 m!406287))

(declare-fun m!406289 () Bool)

(assert (=> b!273434 m!406289))

(check-sat (not b!273432) (not b!273434) (not start!60010))
(check-sat)
(get-model)

(declare-fun d!93574 () Bool)

(declare-fun e!193330 () Bool)

(assert (=> d!93574 e!193330))

(declare-fun res!227601 () Bool)

(assert (=> d!93574 (=> (not res!227601) (not e!193330))))

(declare-fun lt!411453 () (_ BitVec 64))

(declare-fun lt!411455 () (_ BitVec 64))

(declare-fun lt!411452 () (_ BitVec 64))

(assert (=> d!93574 (= res!227601 (= lt!411453 (bvsub lt!411452 lt!411455)))))

(assert (=> d!93574 (or (= (bvand lt!411452 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!411455 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!411452 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!411452 lt!411455) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!93574 (= lt!411455 (remainingBits!0 ((_ sign_extend 32) (size!6662 (buf!7130 thiss!890))) ((_ sign_extend 32) (currentByte!13155 thiss!890)) ((_ sign_extend 32) (currentBit!13150 thiss!890))))))

(declare-fun lt!411454 () (_ BitVec 64))

(declare-fun lt!411451 () (_ BitVec 64))

(assert (=> d!93574 (= lt!411452 (bvmul lt!411454 lt!411451))))

(assert (=> d!93574 (or (= lt!411454 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!411451 (bvsdiv (bvmul lt!411454 lt!411451) lt!411454)))))

(assert (=> d!93574 (= lt!411451 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93574 (= lt!411454 ((_ sign_extend 32) (size!6662 (buf!7130 thiss!890))))))

(assert (=> d!93574 (= lt!411453 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13155 thiss!890)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13150 thiss!890))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!93574 (invariant!0 (currentBit!13150 thiss!890) (currentByte!13155 thiss!890) (size!6662 (buf!7130 thiss!890)))))

(assert (=> d!93574 (= (bitIndex!0 (size!6662 (buf!7130 thiss!890)) (currentByte!13155 thiss!890) (currentBit!13150 thiss!890)) lt!411453)))

(declare-fun b!273448 () Bool)

(declare-fun res!227602 () Bool)

(assert (=> b!273448 (=> (not res!227602) (not e!193330))))

(assert (=> b!273448 (= res!227602 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411453))))

(declare-fun b!273449 () Bool)

(declare-fun lt!411450 () (_ BitVec 64))

(assert (=> b!273449 (= e!193330 (bvsle lt!411453 (bvmul lt!411450 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!273449 (or (= lt!411450 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!411450 #b0000000000000000000000000000000000000000000000000000000000001000) lt!411450)))))

(assert (=> b!273449 (= lt!411450 ((_ sign_extend 32) (size!6662 (buf!7130 thiss!890))))))

(assert (= (and d!93574 res!227601) b!273448))

(assert (= (and b!273448 res!227602) b!273449))

(declare-fun m!406303 () Bool)

(assert (=> d!93574 m!406303))

(declare-fun m!406305 () Bool)

(assert (=> d!93574 m!406305))

(assert (=> b!273432 d!93574))

(declare-fun d!93580 () Bool)

(declare-fun e!193331 () Bool)

(assert (=> d!93580 e!193331))

(declare-fun res!227603 () Bool)

(assert (=> d!93580 (=> (not res!227603) (not e!193331))))

(declare-fun lt!411461 () (_ BitVec 64))

(declare-fun lt!411458 () (_ BitVec 64))

(declare-fun lt!411459 () (_ BitVec 64))

(assert (=> d!93580 (= res!227603 (= lt!411459 (bvsub lt!411458 lt!411461)))))

(assert (=> d!93580 (or (= (bvand lt!411458 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!411461 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!411458 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!411458 lt!411461) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!93580 (= lt!411461 (remainingBits!0 ((_ sign_extend 32) (size!6662 (buf!7130 (_2!12245 lt!411434)))) ((_ sign_extend 32) (currentByte!13155 (_2!12245 lt!411434))) ((_ sign_extend 32) (currentBit!13150 (_2!12245 lt!411434)))))))

(declare-fun lt!411460 () (_ BitVec 64))

(declare-fun lt!411457 () (_ BitVec 64))

(assert (=> d!93580 (= lt!411458 (bvmul lt!411460 lt!411457))))

(assert (=> d!93580 (or (= lt!411460 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!411457 (bvsdiv (bvmul lt!411460 lt!411457) lt!411460)))))

(assert (=> d!93580 (= lt!411457 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93580 (= lt!411460 ((_ sign_extend 32) (size!6662 (buf!7130 (_2!12245 lt!411434)))))))

(assert (=> d!93580 (= lt!411459 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13155 (_2!12245 lt!411434))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13150 (_2!12245 lt!411434)))))))

(assert (=> d!93580 (invariant!0 (currentBit!13150 (_2!12245 lt!411434)) (currentByte!13155 (_2!12245 lt!411434)) (size!6662 (buf!7130 (_2!12245 lt!411434))))))

(assert (=> d!93580 (= (bitIndex!0 (size!6662 (buf!7130 (_2!12245 lt!411434))) (currentByte!13155 (_2!12245 lt!411434)) (currentBit!13150 (_2!12245 lt!411434))) lt!411459)))

(declare-fun b!273450 () Bool)

(declare-fun res!227604 () Bool)

(assert (=> b!273450 (=> (not res!227604) (not e!193331))))

(assert (=> b!273450 (= res!227604 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411459))))

(declare-fun b!273451 () Bool)

(declare-fun lt!411456 () (_ BitVec 64))

(assert (=> b!273451 (= e!193331 (bvsle lt!411459 (bvmul lt!411456 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!273451 (or (= lt!411456 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!411456 #b0000000000000000000000000000000000000000000000000000000000001000) lt!411456)))))

(assert (=> b!273451 (= lt!411456 ((_ sign_extend 32) (size!6662 (buf!7130 (_2!12245 lt!411434)))))))

(assert (= (and d!93580 res!227603) b!273450))

(assert (= (and b!273450 res!227604) b!273451))

(declare-fun m!406307 () Bool)

(assert (=> d!93580 m!406307))

(declare-fun m!406309 () Bool)

(assert (=> d!93580 m!406309))

(assert (=> b!273432 d!93580))

(declare-fun d!93582 () Bool)

(declare-fun lt!411528 () (_ BitVec 32))

(assert (=> d!93582 (= lt!411528 ((_ extract 31 0) (bvsrem diffInBits!18 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!411530 () (_ BitVec 32))

(assert (=> d!93582 (= lt!411530 ((_ extract 31 0) (bvsdiv diffInBits!18 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!193350 () Bool)

(assert (=> d!93582 e!193350))

(declare-fun res!227632 () Bool)

(assert (=> d!93582 (=> (not res!227632) (not e!193350))))

(assert (=> d!93582 (= res!227632 (moveBitIndexPrecond!0 thiss!890 diffInBits!18))))

(declare-fun Unit!19337 () Unit!19333)

(declare-fun Unit!19338 () Unit!19333)

(declare-fun Unit!19339 () Unit!19333)

(assert (=> d!93582 (= (moveBitIndex!0 thiss!890 diffInBits!18) (ite (bvslt (bvadd (currentBit!13150 thiss!890) lt!411528) #b00000000000000000000000000000000) (tuple2!22427 Unit!19337 (BitStream!12139 (buf!7130 thiss!890) (bvsub (bvadd (currentByte!13155 thiss!890) lt!411530) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!411528 (currentBit!13150 thiss!890)))) (ite (bvsge (bvadd (currentBit!13150 thiss!890) lt!411528) #b00000000000000000000000000001000) (tuple2!22427 Unit!19338 (BitStream!12139 (buf!7130 thiss!890) (bvadd (currentByte!13155 thiss!890) lt!411530 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!13150 thiss!890) lt!411528) #b00000000000000000000000000001000))) (tuple2!22427 Unit!19339 (BitStream!12139 (buf!7130 thiss!890) (bvadd (currentByte!13155 thiss!890) lt!411530) (bvadd (currentBit!13150 thiss!890) lt!411528))))))))

(declare-fun b!273480 () Bool)

(declare-fun e!193351 () Bool)

(assert (=> b!273480 (= e!193350 e!193351)))

(declare-fun res!227631 () Bool)

(assert (=> b!273480 (=> (not res!227631) (not e!193351))))

(declare-fun lt!411532 () tuple2!22426)

(declare-fun lt!411531 () (_ BitVec 64))

(assert (=> b!273480 (= res!227631 (= (bvadd lt!411531 diffInBits!18) (bitIndex!0 (size!6662 (buf!7130 (_2!12245 lt!411532))) (currentByte!13155 (_2!12245 lt!411532)) (currentBit!13150 (_2!12245 lt!411532)))))))

(assert (=> b!273480 (or (not (= (bvand lt!411531 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand diffInBits!18 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!411531 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!411531 diffInBits!18) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!273480 (= lt!411531 (bitIndex!0 (size!6662 (buf!7130 thiss!890)) (currentByte!13155 thiss!890) (currentBit!13150 thiss!890)))))

(declare-fun lt!411529 () (_ BitVec 32))

(declare-fun lt!411533 () (_ BitVec 32))

(declare-fun Unit!19340 () Unit!19333)

(declare-fun Unit!19341 () Unit!19333)

(declare-fun Unit!19342 () Unit!19333)

(assert (=> b!273480 (= lt!411532 (ite (bvslt (bvadd (currentBit!13150 thiss!890) lt!411529) #b00000000000000000000000000000000) (tuple2!22427 Unit!19340 (BitStream!12139 (buf!7130 thiss!890) (bvsub (bvadd (currentByte!13155 thiss!890) lt!411533) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!411529 (currentBit!13150 thiss!890)))) (ite (bvsge (bvadd (currentBit!13150 thiss!890) lt!411529) #b00000000000000000000000000001000) (tuple2!22427 Unit!19341 (BitStream!12139 (buf!7130 thiss!890) (bvadd (currentByte!13155 thiss!890) lt!411533 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!13150 thiss!890) lt!411529) #b00000000000000000000000000001000))) (tuple2!22427 Unit!19342 (BitStream!12139 (buf!7130 thiss!890) (bvadd (currentByte!13155 thiss!890) lt!411533) (bvadd (currentBit!13150 thiss!890) lt!411529))))))))

(assert (=> b!273480 (= lt!411529 ((_ extract 31 0) (bvsrem diffInBits!18 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!273480 (= lt!411533 ((_ extract 31 0) (bvsdiv diffInBits!18 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!273481 () Bool)

(assert (=> b!273481 (= e!193351 (and (= (size!6662 (buf!7130 thiss!890)) (size!6662 (buf!7130 (_2!12245 lt!411532)))) (= (buf!7130 thiss!890) (buf!7130 (_2!12245 lt!411532)))))))

(assert (= (and d!93582 res!227632) b!273480))

(assert (= (and b!273480 res!227631) b!273481))

(assert (=> d!93582 m!406279))

(declare-fun m!406327 () Bool)

(assert (=> b!273480 m!406327))

(assert (=> b!273480 m!406283))

(assert (=> b!273432 d!93582))

(declare-fun d!93608 () Bool)

(assert (=> d!93608 (= (array_inv!6386 (buf!7130 thiss!890)) (bvsge (size!6662 (buf!7130 thiss!890)) #b00000000000000000000000000000000))))

(assert (=> b!273434 d!93608))

(declare-fun d!93610 () Bool)

(declare-fun res!227635 () Bool)

(declare-fun e!193354 () Bool)

(assert (=> d!93610 (=> (not res!227635) (not e!193354))))

(assert (=> d!93610 (= res!227635 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6662 (buf!7130 thiss!890)))) diffInBits!18) (bvsle diffInBits!18 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6662 (buf!7130 thiss!890)))))))))

(assert (=> d!93610 (= (moveBitIndexPrecond!0 thiss!890 diffInBits!18) e!193354)))

(declare-fun b!273485 () Bool)

(declare-fun lt!411536 () (_ BitVec 64))

(assert (=> b!273485 (= e!193354 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411536) (bvsle lt!411536 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6662 (buf!7130 thiss!890)))))))))

(assert (=> b!273485 (= lt!411536 (bvadd (bitIndex!0 (size!6662 (buf!7130 thiss!890)) (currentByte!13155 thiss!890) (currentBit!13150 thiss!890)) diffInBits!18))))

(assert (= (and d!93610 res!227635) b!273485))

(assert (=> b!273485 m!406283))

(assert (=> start!60010 d!93610))

(declare-fun d!93612 () Bool)

(assert (=> d!93612 (= (inv!12 thiss!890) (invariant!0 (currentBit!13150 thiss!890) (currentByte!13155 thiss!890) (size!6662 (buf!7130 thiss!890))))))

(declare-fun bs!23591 () Bool)

(assert (= bs!23591 d!93612))

(assert (=> bs!23591 m!406305))

(assert (=> start!60010 d!93612))

(check-sat (not b!273485) (not d!93580) (not d!93612) (not b!273480) (not d!93574) (not d!93582))
(check-sat)
