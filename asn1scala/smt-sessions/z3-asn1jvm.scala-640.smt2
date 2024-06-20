; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17940 () Bool)

(assert start!17940)

(declare-fun b!88283 () Bool)

(declare-fun e!58439 () Bool)

(declare-datatypes ((array!4157 0))(
  ( (array!4158 (arr!2515 (Array (_ BitVec 32) (_ BitVec 8))) (size!1878 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3318 0))(
  ( (BitStream!3319 (buf!2268 array!4157) (currentByte!4492 (_ BitVec 32)) (currentBit!4487 (_ BitVec 32))) )
))
(declare-fun thiss!1151 () BitStream!3318)

(declare-fun array_inv!1724 (array!4157) Bool)

(assert (=> b!88283 (= e!58439 (array_inv!1724 (buf!2268 thiss!1151)))))

(declare-fun b!88284 () Bool)

(declare-fun res!72680 () Bool)

(declare-fun e!58441 () Bool)

(assert (=> b!88284 (=> (not res!72680) (not e!58441))))

(declare-fun thiss!1152 () BitStream!3318)

(declare-fun i!576 () (_ BitVec 32))

(declare-fun nBits!336 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!88284 (= res!72680 (validate_offset_bits!1 ((_ sign_extend 32) (size!1878 (buf!2268 thiss!1152))) ((_ sign_extend 32) (currentByte!4492 thiss!1152)) ((_ sign_extend 32) (currentBit!4487 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!88285 () Bool)

(declare-fun res!72672 () Bool)

(declare-fun e!58435 () Bool)

(assert (=> b!88285 (=> (not res!72672) (not e!58435))))

(declare-datatypes ((Unit!5775 0))(
  ( (Unit!5776) )
))
(declare-datatypes ((tuple2!7454 0))(
  ( (tuple2!7455 (_1!3960 Unit!5775) (_2!3960 BitStream!3318)) )
))
(declare-fun lt!136028 () tuple2!7454)

(declare-fun isPrefixOf!0 (BitStream!3318 BitStream!3318) Bool)

(assert (=> b!88285 (= res!72672 (isPrefixOf!0 thiss!1152 (_2!3960 lt!136028)))))

(declare-fun b!88286 () Bool)

(declare-fun res!72675 () Bool)

(assert (=> b!88286 (=> (not res!72675) (not e!58441))))

(assert (=> b!88286 (= res!72675 (bvslt i!576 nBits!336))))

(declare-fun b!88287 () Bool)

(declare-fun e!58443 () Bool)

(declare-datatypes ((tuple2!7456 0))(
  ( (tuple2!7457 (_1!3961 BitStream!3318) (_2!3961 Bool)) )
))
(declare-fun lt!136029 () tuple2!7456)

(declare-fun lt!136031 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!88287 (= e!58443 (= (bitIndex!0 (size!1878 (buf!2268 (_1!3961 lt!136029))) (currentByte!4492 (_1!3961 lt!136029)) (currentBit!4487 (_1!3961 lt!136029))) lt!136031))))

(declare-fun b!88288 () Bool)

(declare-fun e!58436 () Bool)

(assert (=> b!88288 (= e!58436 (array_inv!1724 (buf!2268 thiss!1152)))))

(declare-fun b!88290 () Bool)

(declare-fun res!72670 () Bool)

(declare-fun e!58442 () Bool)

(assert (=> b!88290 (=> (not res!72670) (not e!58442))))

(assert (=> b!88290 (= res!72670 (and (bvsle i!576 nBits!336) (= (size!1878 (buf!2268 thiss!1152)) (size!1878 (buf!2268 thiss!1151)))))))

(declare-fun b!88291 () Bool)

(declare-fun res!72676 () Bool)

(assert (=> b!88291 (=> (not res!72676) (not e!58442))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!88291 (= res!72676 (invariant!0 (currentBit!4487 thiss!1152) (currentByte!4492 thiss!1152) (size!1878 (buf!2268 thiss!1152))))))

(declare-fun b!88292 () Bool)

(declare-fun res!72681 () Bool)

(assert (=> b!88292 (=> (not res!72681) (not e!58442))))

(assert (=> b!88292 (= res!72681 (invariant!0 (currentBit!4487 thiss!1151) (currentByte!4492 thiss!1151) (size!1878 (buf!2268 thiss!1151))))))

(declare-fun b!88293 () Bool)

(assert (=> b!88293 (= e!58442 e!58441)))

(declare-fun res!72674 () Bool)

(assert (=> b!88293 (=> (not res!72674) (not e!58441))))

(declare-fun lt!136027 () (_ BitVec 64))

(declare-fun lt!136032 () (_ BitVec 64))

(assert (=> b!88293 (= res!72674 (= lt!136032 (bvadd lt!136027 ((_ sign_extend 32) i!576))))))

(assert (=> b!88293 (= lt!136032 (bitIndex!0 (size!1878 (buf!2268 thiss!1152)) (currentByte!4492 thiss!1152) (currentBit!4487 thiss!1152)))))

(assert (=> b!88293 (= lt!136027 (bitIndex!0 (size!1878 (buf!2268 thiss!1151)) (currentByte!4492 thiss!1151) (currentBit!4487 thiss!1151)))))

(declare-fun b!88294 () Bool)

(declare-fun res!72682 () Bool)

(assert (=> b!88294 (=> (not res!72682) (not e!58442))))

(assert (=> b!88294 (= res!72682 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!88295 () Bool)

(assert (=> b!88295 (= e!58441 (not (invariant!0 (currentBit!4487 (_2!3960 lt!136028)) (currentByte!4492 (_2!3960 lt!136028)) (size!1878 (buf!2268 (_2!3960 lt!136028))))))))

(declare-fun e!58438 () Bool)

(assert (=> b!88295 e!58438))

(declare-fun res!72671 () Bool)

(assert (=> b!88295 (=> (not res!72671) (not e!58438))))

(assert (=> b!88295 (= res!72671 (= (size!1878 (buf!2268 thiss!1152)) (size!1878 (buf!2268 (_2!3960 lt!136028)))))))

(declare-fun lt!136030 () Bool)

(declare-fun appendBit!0 (BitStream!3318 Bool) tuple2!7454)

(assert (=> b!88295 (= lt!136028 (appendBit!0 thiss!1152 lt!136030))))

(declare-fun v!179 () (_ BitVec 64))

(assert (=> b!88295 (= lt!136030 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!72678 () Bool)

(assert (=> start!17940 (=> (not res!72678) (not e!58442))))

(assert (=> start!17940 (= res!72678 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17940 e!58442))

(declare-fun inv!12 (BitStream!3318) Bool)

(assert (=> start!17940 (and (inv!12 thiss!1152) e!58436)))

(assert (=> start!17940 (and (inv!12 thiss!1151) e!58439)))

(assert (=> start!17940 true))

(declare-fun b!88289 () Bool)

(assert (=> b!88289 (= e!58435 e!58443)))

(declare-fun res!72673 () Bool)

(assert (=> b!88289 (=> (not res!72673) (not e!58443))))

(assert (=> b!88289 (= res!72673 (and (= (_2!3961 lt!136029) lt!136030) (= (_1!3961 lt!136029) (_2!3960 lt!136028))))))

(declare-fun readBitPure!0 (BitStream!3318) tuple2!7456)

(declare-fun readerFrom!0 (BitStream!3318 (_ BitVec 32) (_ BitVec 32)) BitStream!3318)

(assert (=> b!88289 (= lt!136029 (readBitPure!0 (readerFrom!0 (_2!3960 lt!136028) (currentBit!4487 thiss!1152) (currentByte!4492 thiss!1152))))))

(declare-fun b!88296 () Bool)

(declare-fun res!72679 () Bool)

(assert (=> b!88296 (=> (not res!72679) (not e!58442))))

(assert (=> b!88296 (= res!72679 (validate_offset_bits!1 ((_ sign_extend 32) (size!1878 (buf!2268 thiss!1151))) ((_ sign_extend 32) (currentByte!4492 thiss!1151)) ((_ sign_extend 32) (currentBit!4487 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!88297 () Bool)

(assert (=> b!88297 (= e!58438 e!58435)))

(declare-fun res!72677 () Bool)

(assert (=> b!88297 (=> (not res!72677) (not e!58435))))

(assert (=> b!88297 (= res!72677 (= lt!136031 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!136032)))))

(assert (=> b!88297 (= lt!136031 (bitIndex!0 (size!1878 (buf!2268 (_2!3960 lt!136028))) (currentByte!4492 (_2!3960 lt!136028)) (currentBit!4487 (_2!3960 lt!136028))))))

(assert (= (and start!17940 res!72678) b!88296))

(assert (= (and b!88296 res!72679) b!88292))

(assert (= (and b!88292 res!72681) b!88294))

(assert (= (and b!88294 res!72682) b!88291))

(assert (= (and b!88291 res!72676) b!88290))

(assert (= (and b!88290 res!72670) b!88293))

(assert (= (and b!88293 res!72674) b!88284))

(assert (= (and b!88284 res!72680) b!88286))

(assert (= (and b!88286 res!72675) b!88295))

(assert (= (and b!88295 res!72671) b!88297))

(assert (= (and b!88297 res!72677) b!88285))

(assert (= (and b!88285 res!72672) b!88289))

(assert (= (and b!88289 res!72673) b!88287))

(assert (= start!17940 b!88288))

(assert (= start!17940 b!88283))

(declare-fun m!133479 () Bool)

(assert (=> b!88293 m!133479))

(declare-fun m!133481 () Bool)

(assert (=> b!88293 m!133481))

(declare-fun m!133483 () Bool)

(assert (=> b!88285 m!133483))

(declare-fun m!133485 () Bool)

(assert (=> b!88292 m!133485))

(declare-fun m!133487 () Bool)

(assert (=> b!88283 m!133487))

(declare-fun m!133489 () Bool)

(assert (=> b!88295 m!133489))

(declare-fun m!133491 () Bool)

(assert (=> b!88295 m!133491))

(declare-fun m!133493 () Bool)

(assert (=> b!88287 m!133493))

(declare-fun m!133495 () Bool)

(assert (=> b!88297 m!133495))

(declare-fun m!133497 () Bool)

(assert (=> b!88296 m!133497))

(declare-fun m!133499 () Bool)

(assert (=> b!88288 m!133499))

(declare-fun m!133501 () Bool)

(assert (=> b!88289 m!133501))

(assert (=> b!88289 m!133501))

(declare-fun m!133503 () Bool)

(assert (=> b!88289 m!133503))

(declare-fun m!133505 () Bool)

(assert (=> b!88291 m!133505))

(declare-fun m!133507 () Bool)

(assert (=> b!88284 m!133507))

(declare-fun m!133509 () Bool)

(assert (=> start!17940 m!133509))

(declare-fun m!133511 () Bool)

(assert (=> start!17940 m!133511))

(check-sat (not b!88293) (not b!88295) (not b!88297) (not b!88283) (not start!17940) (not b!88289) (not b!88287) (not b!88288) (not b!88284) (not b!88291) (not b!88292) (not b!88296) (not b!88285))
(check-sat)
(get-model)

(declare-fun d!27674 () Bool)

(assert (=> d!27674 (= (invariant!0 (currentBit!4487 thiss!1151) (currentByte!4492 thiss!1151) (size!1878 (buf!2268 thiss!1151))) (and (bvsge (currentBit!4487 thiss!1151) #b00000000000000000000000000000000) (bvslt (currentBit!4487 thiss!1151) #b00000000000000000000000000001000) (bvsge (currentByte!4492 thiss!1151) #b00000000000000000000000000000000) (or (bvslt (currentByte!4492 thiss!1151) (size!1878 (buf!2268 thiss!1151))) (and (= (currentBit!4487 thiss!1151) #b00000000000000000000000000000000) (= (currentByte!4492 thiss!1151) (size!1878 (buf!2268 thiss!1151)))))))))

(assert (=> b!88292 d!27674))

(declare-fun d!27676 () Bool)

(assert (=> d!27676 (= (invariant!0 (currentBit!4487 thiss!1152) (currentByte!4492 thiss!1152) (size!1878 (buf!2268 thiss!1152))) (and (bvsge (currentBit!4487 thiss!1152) #b00000000000000000000000000000000) (bvslt (currentBit!4487 thiss!1152) #b00000000000000000000000000001000) (bvsge (currentByte!4492 thiss!1152) #b00000000000000000000000000000000) (or (bvslt (currentByte!4492 thiss!1152) (size!1878 (buf!2268 thiss!1152))) (and (= (currentBit!4487 thiss!1152) #b00000000000000000000000000000000) (= (currentByte!4492 thiss!1152) (size!1878 (buf!2268 thiss!1152)))))))))

(assert (=> b!88291 d!27676))

(declare-fun d!27678 () Bool)

(declare-fun e!58473 () Bool)

(assert (=> d!27678 e!58473))

(declare-fun res!72726 () Bool)

(assert (=> d!27678 (=> (not res!72726) (not e!58473))))

(declare-fun lt!136066 () (_ BitVec 64))

(declare-fun lt!136068 () (_ BitVec 64))

(declare-fun lt!136067 () (_ BitVec 64))

(assert (=> d!27678 (= res!72726 (= lt!136067 (bvsub lt!136066 lt!136068)))))

(assert (=> d!27678 (or (= (bvand lt!136066 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!136068 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!136066 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!136066 lt!136068) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!27678 (= lt!136068 (remainingBits!0 ((_ sign_extend 32) (size!1878 (buf!2268 thiss!1152))) ((_ sign_extend 32) (currentByte!4492 thiss!1152)) ((_ sign_extend 32) (currentBit!4487 thiss!1152))))))

(declare-fun lt!136064 () (_ BitVec 64))

(declare-fun lt!136063 () (_ BitVec 64))

(assert (=> d!27678 (= lt!136066 (bvmul lt!136064 lt!136063))))

(assert (=> d!27678 (or (= lt!136064 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!136063 (bvsdiv (bvmul lt!136064 lt!136063) lt!136064)))))

(assert (=> d!27678 (= lt!136063 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27678 (= lt!136064 ((_ sign_extend 32) (size!1878 (buf!2268 thiss!1152))))))

(assert (=> d!27678 (= lt!136067 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4492 thiss!1152)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4487 thiss!1152))))))

(assert (=> d!27678 (invariant!0 (currentBit!4487 thiss!1152) (currentByte!4492 thiss!1152) (size!1878 (buf!2268 thiss!1152)))))

(assert (=> d!27678 (= (bitIndex!0 (size!1878 (buf!2268 thiss!1152)) (currentByte!4492 thiss!1152) (currentBit!4487 thiss!1152)) lt!136067)))

(declare-fun b!88347 () Bool)

(declare-fun res!72727 () Bool)

(assert (=> b!88347 (=> (not res!72727) (not e!58473))))

(assert (=> b!88347 (= res!72727 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!136067))))

(declare-fun b!88348 () Bool)

(declare-fun lt!136065 () (_ BitVec 64))

(assert (=> b!88348 (= e!58473 (bvsle lt!136067 (bvmul lt!136065 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!88348 (or (= lt!136065 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!136065 #b0000000000000000000000000000000000000000000000000000000000001000) lt!136065)))))

(assert (=> b!88348 (= lt!136065 ((_ sign_extend 32) (size!1878 (buf!2268 thiss!1152))))))

(assert (= (and d!27678 res!72726) b!88347))

(assert (= (and b!88347 res!72727) b!88348))

(declare-fun m!133547 () Bool)

(assert (=> d!27678 m!133547))

(assert (=> d!27678 m!133505))

(assert (=> b!88293 d!27678))

(declare-fun d!27680 () Bool)

(declare-fun e!58474 () Bool)

(assert (=> d!27680 e!58474))

(declare-fun res!72728 () Bool)

(assert (=> d!27680 (=> (not res!72728) (not e!58474))))

(declare-fun lt!136074 () (_ BitVec 64))

(declare-fun lt!136073 () (_ BitVec 64))

(declare-fun lt!136072 () (_ BitVec 64))

(assert (=> d!27680 (= res!72728 (= lt!136073 (bvsub lt!136072 lt!136074)))))

(assert (=> d!27680 (or (= (bvand lt!136072 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!136074 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!136072 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!136072 lt!136074) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27680 (= lt!136074 (remainingBits!0 ((_ sign_extend 32) (size!1878 (buf!2268 thiss!1151))) ((_ sign_extend 32) (currentByte!4492 thiss!1151)) ((_ sign_extend 32) (currentBit!4487 thiss!1151))))))

(declare-fun lt!136070 () (_ BitVec 64))

(declare-fun lt!136069 () (_ BitVec 64))

(assert (=> d!27680 (= lt!136072 (bvmul lt!136070 lt!136069))))

(assert (=> d!27680 (or (= lt!136070 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!136069 (bvsdiv (bvmul lt!136070 lt!136069) lt!136070)))))

(assert (=> d!27680 (= lt!136069 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27680 (= lt!136070 ((_ sign_extend 32) (size!1878 (buf!2268 thiss!1151))))))

(assert (=> d!27680 (= lt!136073 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4492 thiss!1151)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4487 thiss!1151))))))

(assert (=> d!27680 (invariant!0 (currentBit!4487 thiss!1151) (currentByte!4492 thiss!1151) (size!1878 (buf!2268 thiss!1151)))))

(assert (=> d!27680 (= (bitIndex!0 (size!1878 (buf!2268 thiss!1151)) (currentByte!4492 thiss!1151) (currentBit!4487 thiss!1151)) lt!136073)))

(declare-fun b!88349 () Bool)

(declare-fun res!72729 () Bool)

(assert (=> b!88349 (=> (not res!72729) (not e!58474))))

(assert (=> b!88349 (= res!72729 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!136073))))

(declare-fun b!88350 () Bool)

(declare-fun lt!136071 () (_ BitVec 64))

(assert (=> b!88350 (= e!58474 (bvsle lt!136073 (bvmul lt!136071 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!88350 (or (= lt!136071 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!136071 #b0000000000000000000000000000000000000000000000000000000000001000) lt!136071)))))

(assert (=> b!88350 (= lt!136071 ((_ sign_extend 32) (size!1878 (buf!2268 thiss!1151))))))

(assert (= (and d!27680 res!72728) b!88349))

(assert (= (and b!88349 res!72729) b!88350))

(declare-fun m!133549 () Bool)

(assert (=> d!27680 m!133549))

(assert (=> d!27680 m!133485))

(assert (=> b!88293 d!27680))

(declare-fun d!27682 () Bool)

(assert (=> d!27682 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1878 (buf!2268 thiss!1152))) ((_ sign_extend 32) (currentByte!4492 thiss!1152)) ((_ sign_extend 32) (currentBit!4487 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1878 (buf!2268 thiss!1152))) ((_ sign_extend 32) (currentByte!4492 thiss!1152)) ((_ sign_extend 32) (currentBit!4487 thiss!1152))) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun bs!6860 () Bool)

(assert (= bs!6860 d!27682))

(assert (=> bs!6860 m!133547))

(assert (=> b!88284 d!27682))

(declare-fun d!27684 () Bool)

(assert (=> d!27684 (= (array_inv!1724 (buf!2268 thiss!1151)) (bvsge (size!1878 (buf!2268 thiss!1151)) #b00000000000000000000000000000000))))

(assert (=> b!88283 d!27684))

(declare-fun d!27686 () Bool)

(declare-fun res!72736 () Bool)

(declare-fun e!58479 () Bool)

(assert (=> d!27686 (=> (not res!72736) (not e!58479))))

(assert (=> d!27686 (= res!72736 (= (size!1878 (buf!2268 thiss!1152)) (size!1878 (buf!2268 (_2!3960 lt!136028)))))))

(assert (=> d!27686 (= (isPrefixOf!0 thiss!1152 (_2!3960 lt!136028)) e!58479)))

(declare-fun b!88357 () Bool)

(declare-fun res!72737 () Bool)

(assert (=> b!88357 (=> (not res!72737) (not e!58479))))

(assert (=> b!88357 (= res!72737 (bvsle (bitIndex!0 (size!1878 (buf!2268 thiss!1152)) (currentByte!4492 thiss!1152) (currentBit!4487 thiss!1152)) (bitIndex!0 (size!1878 (buf!2268 (_2!3960 lt!136028))) (currentByte!4492 (_2!3960 lt!136028)) (currentBit!4487 (_2!3960 lt!136028)))))))

(declare-fun b!88358 () Bool)

(declare-fun e!58480 () Bool)

(assert (=> b!88358 (= e!58479 e!58480)))

(declare-fun res!72738 () Bool)

(assert (=> b!88358 (=> res!72738 e!58480)))

(assert (=> b!88358 (= res!72738 (= (size!1878 (buf!2268 thiss!1152)) #b00000000000000000000000000000000))))

(declare-fun b!88359 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4157 array!4157 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!88359 (= e!58480 (arrayBitRangesEq!0 (buf!2268 thiss!1152) (buf!2268 (_2!3960 lt!136028)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1878 (buf!2268 thiss!1152)) (currentByte!4492 thiss!1152) (currentBit!4487 thiss!1152))))))

(assert (= (and d!27686 res!72736) b!88357))

(assert (= (and b!88357 res!72737) b!88358))

(assert (= (and b!88358 (not res!72738)) b!88359))

(assert (=> b!88357 m!133479))

(assert (=> b!88357 m!133495))

(assert (=> b!88359 m!133479))

(assert (=> b!88359 m!133479))

(declare-fun m!133551 () Bool)

(assert (=> b!88359 m!133551))

(assert (=> b!88285 d!27686))

(declare-fun d!27688 () Bool)

(assert (=> d!27688 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1878 (buf!2268 thiss!1151))) ((_ sign_extend 32) (currentByte!4492 thiss!1151)) ((_ sign_extend 32) (currentBit!4487 thiss!1151)) ((_ sign_extend 32) nBits!336)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1878 (buf!2268 thiss!1151))) ((_ sign_extend 32) (currentByte!4492 thiss!1151)) ((_ sign_extend 32) (currentBit!4487 thiss!1151))) ((_ sign_extend 32) nBits!336)))))

(declare-fun bs!6861 () Bool)

(assert (= bs!6861 d!27688))

(assert (=> bs!6861 m!133549))

(assert (=> b!88296 d!27688))

(declare-fun d!27690 () Bool)

(assert (=> d!27690 (= (inv!12 thiss!1152) (invariant!0 (currentBit!4487 thiss!1152) (currentByte!4492 thiss!1152) (size!1878 (buf!2268 thiss!1152))))))

(declare-fun bs!6862 () Bool)

(assert (= bs!6862 d!27690))

(assert (=> bs!6862 m!133505))

(assert (=> start!17940 d!27690))

(declare-fun d!27692 () Bool)

(assert (=> d!27692 (= (inv!12 thiss!1151) (invariant!0 (currentBit!4487 thiss!1151) (currentByte!4492 thiss!1151) (size!1878 (buf!2268 thiss!1151))))))

(declare-fun bs!6863 () Bool)

(assert (= bs!6863 d!27692))

(assert (=> bs!6863 m!133485))

(assert (=> start!17940 d!27692))

(declare-fun d!27694 () Bool)

(assert (=> d!27694 (= (invariant!0 (currentBit!4487 (_2!3960 lt!136028)) (currentByte!4492 (_2!3960 lt!136028)) (size!1878 (buf!2268 (_2!3960 lt!136028)))) (and (bvsge (currentBit!4487 (_2!3960 lt!136028)) #b00000000000000000000000000000000) (bvslt (currentBit!4487 (_2!3960 lt!136028)) #b00000000000000000000000000001000) (bvsge (currentByte!4492 (_2!3960 lt!136028)) #b00000000000000000000000000000000) (or (bvslt (currentByte!4492 (_2!3960 lt!136028)) (size!1878 (buf!2268 (_2!3960 lt!136028)))) (and (= (currentBit!4487 (_2!3960 lt!136028)) #b00000000000000000000000000000000) (= (currentByte!4492 (_2!3960 lt!136028)) (size!1878 (buf!2268 (_2!3960 lt!136028))))))))))

(assert (=> b!88295 d!27694))

(declare-fun d!27696 () Bool)

(declare-fun e!58486 () Bool)

(assert (=> d!27696 e!58486))

(declare-fun res!72749 () Bool)

(assert (=> d!27696 (=> (not res!72749) (not e!58486))))

(declare-fun lt!136083 () tuple2!7454)

(assert (=> d!27696 (= res!72749 (= (size!1878 (buf!2268 thiss!1152)) (size!1878 (buf!2268 (_2!3960 lt!136083)))))))

(declare-fun choose!16 (BitStream!3318 Bool) tuple2!7454)

(assert (=> d!27696 (= lt!136083 (choose!16 thiss!1152 lt!136030))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!27696 (validate_offset_bit!0 ((_ sign_extend 32) (size!1878 (buf!2268 thiss!1152))) ((_ sign_extend 32) (currentByte!4492 thiss!1152)) ((_ sign_extend 32) (currentBit!4487 thiss!1152)))))

(assert (=> d!27696 (= (appendBit!0 thiss!1152 lt!136030) lt!136083)))

(declare-fun b!88371 () Bool)

(declare-fun e!58485 () Bool)

(assert (=> b!88371 (= e!58486 e!58485)))

(declare-fun res!72747 () Bool)

(assert (=> b!88371 (=> (not res!72747) (not e!58485))))

(declare-fun lt!136085 () tuple2!7456)

(assert (=> b!88371 (= res!72747 (and (= (_2!3961 lt!136085) lt!136030) (= (_1!3961 lt!136085) (_2!3960 lt!136083))))))

(assert (=> b!88371 (= lt!136085 (readBitPure!0 (readerFrom!0 (_2!3960 lt!136083) (currentBit!4487 thiss!1152) (currentByte!4492 thiss!1152))))))

(declare-fun b!88370 () Bool)

(declare-fun res!72748 () Bool)

(assert (=> b!88370 (=> (not res!72748) (not e!58486))))

(assert (=> b!88370 (= res!72748 (isPrefixOf!0 thiss!1152 (_2!3960 lt!136083)))))

(declare-fun b!88372 () Bool)

(assert (=> b!88372 (= e!58485 (= (bitIndex!0 (size!1878 (buf!2268 (_1!3961 lt!136085))) (currentByte!4492 (_1!3961 lt!136085)) (currentBit!4487 (_1!3961 lt!136085))) (bitIndex!0 (size!1878 (buf!2268 (_2!3960 lt!136083))) (currentByte!4492 (_2!3960 lt!136083)) (currentBit!4487 (_2!3960 lt!136083)))))))

(declare-fun b!88369 () Bool)

(declare-fun res!72750 () Bool)

(assert (=> b!88369 (=> (not res!72750) (not e!58486))))

(declare-fun lt!136084 () (_ BitVec 64))

(declare-fun lt!136086 () (_ BitVec 64))

(assert (=> b!88369 (= res!72750 (= (bitIndex!0 (size!1878 (buf!2268 (_2!3960 lt!136083))) (currentByte!4492 (_2!3960 lt!136083)) (currentBit!4487 (_2!3960 lt!136083))) (bvadd lt!136086 lt!136084)))))

(assert (=> b!88369 (or (not (= (bvand lt!136086 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!136084 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!136086 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!136086 lt!136084) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!88369 (= lt!136084 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!88369 (= lt!136086 (bitIndex!0 (size!1878 (buf!2268 thiss!1152)) (currentByte!4492 thiss!1152) (currentBit!4487 thiss!1152)))))

(assert (= (and d!27696 res!72749) b!88369))

(assert (= (and b!88369 res!72750) b!88370))

(assert (= (and b!88370 res!72748) b!88371))

(assert (= (and b!88371 res!72747) b!88372))

(declare-fun m!133553 () Bool)

(assert (=> b!88371 m!133553))

(assert (=> b!88371 m!133553))

(declare-fun m!133555 () Bool)

(assert (=> b!88371 m!133555))

(declare-fun m!133557 () Bool)

(assert (=> b!88372 m!133557))

(declare-fun m!133559 () Bool)

(assert (=> b!88372 m!133559))

(assert (=> b!88369 m!133559))

(assert (=> b!88369 m!133479))

(declare-fun m!133561 () Bool)

(assert (=> b!88370 m!133561))

(declare-fun m!133563 () Bool)

(assert (=> d!27696 m!133563))

(declare-fun m!133565 () Bool)

(assert (=> d!27696 m!133565))

(assert (=> b!88295 d!27696))

(declare-fun d!27702 () Bool)

(declare-fun e!58487 () Bool)

(assert (=> d!27702 e!58487))

(declare-fun res!72751 () Bool)

(assert (=> d!27702 (=> (not res!72751) (not e!58487))))

(declare-fun lt!136092 () (_ BitVec 64))

(declare-fun lt!136091 () (_ BitVec 64))

(declare-fun lt!136090 () (_ BitVec 64))

(assert (=> d!27702 (= res!72751 (= lt!136091 (bvsub lt!136090 lt!136092)))))

(assert (=> d!27702 (or (= (bvand lt!136090 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!136092 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!136090 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!136090 lt!136092) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27702 (= lt!136092 (remainingBits!0 ((_ sign_extend 32) (size!1878 (buf!2268 (_2!3960 lt!136028)))) ((_ sign_extend 32) (currentByte!4492 (_2!3960 lt!136028))) ((_ sign_extend 32) (currentBit!4487 (_2!3960 lt!136028)))))))

(declare-fun lt!136088 () (_ BitVec 64))

(declare-fun lt!136087 () (_ BitVec 64))

(assert (=> d!27702 (= lt!136090 (bvmul lt!136088 lt!136087))))

(assert (=> d!27702 (or (= lt!136088 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!136087 (bvsdiv (bvmul lt!136088 lt!136087) lt!136088)))))

(assert (=> d!27702 (= lt!136087 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27702 (= lt!136088 ((_ sign_extend 32) (size!1878 (buf!2268 (_2!3960 lt!136028)))))))

(assert (=> d!27702 (= lt!136091 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4492 (_2!3960 lt!136028))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4487 (_2!3960 lt!136028)))))))

(assert (=> d!27702 (invariant!0 (currentBit!4487 (_2!3960 lt!136028)) (currentByte!4492 (_2!3960 lt!136028)) (size!1878 (buf!2268 (_2!3960 lt!136028))))))

(assert (=> d!27702 (= (bitIndex!0 (size!1878 (buf!2268 (_2!3960 lt!136028))) (currentByte!4492 (_2!3960 lt!136028)) (currentBit!4487 (_2!3960 lt!136028))) lt!136091)))

(declare-fun b!88373 () Bool)

(declare-fun res!72752 () Bool)

(assert (=> b!88373 (=> (not res!72752) (not e!58487))))

(assert (=> b!88373 (= res!72752 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!136091))))

(declare-fun b!88374 () Bool)

(declare-fun lt!136089 () (_ BitVec 64))

(assert (=> b!88374 (= e!58487 (bvsle lt!136091 (bvmul lt!136089 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!88374 (or (= lt!136089 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!136089 #b0000000000000000000000000000000000000000000000000000000000001000) lt!136089)))))

(assert (=> b!88374 (= lt!136089 ((_ sign_extend 32) (size!1878 (buf!2268 (_2!3960 lt!136028)))))))

(assert (= (and d!27702 res!72751) b!88373))

(assert (= (and b!88373 res!72752) b!88374))

(declare-fun m!133567 () Bool)

(assert (=> d!27702 m!133567))

(assert (=> d!27702 m!133489))

(assert (=> b!88297 d!27702))

(declare-fun d!27704 () Bool)

(assert (=> d!27704 (= (array_inv!1724 (buf!2268 thiss!1152)) (bvsge (size!1878 (buf!2268 thiss!1152)) #b00000000000000000000000000000000))))

(assert (=> b!88288 d!27704))

(declare-fun d!27706 () Bool)

(declare-fun e!58488 () Bool)

(assert (=> d!27706 e!58488))

(declare-fun res!72753 () Bool)

(assert (=> d!27706 (=> (not res!72753) (not e!58488))))

(declare-fun lt!136096 () (_ BitVec 64))

(declare-fun lt!136098 () (_ BitVec 64))

(declare-fun lt!136097 () (_ BitVec 64))

(assert (=> d!27706 (= res!72753 (= lt!136097 (bvsub lt!136096 lt!136098)))))

(assert (=> d!27706 (or (= (bvand lt!136096 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!136098 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!136096 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!136096 lt!136098) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27706 (= lt!136098 (remainingBits!0 ((_ sign_extend 32) (size!1878 (buf!2268 (_1!3961 lt!136029)))) ((_ sign_extend 32) (currentByte!4492 (_1!3961 lt!136029))) ((_ sign_extend 32) (currentBit!4487 (_1!3961 lt!136029)))))))

(declare-fun lt!136094 () (_ BitVec 64))

(declare-fun lt!136093 () (_ BitVec 64))

(assert (=> d!27706 (= lt!136096 (bvmul lt!136094 lt!136093))))

(assert (=> d!27706 (or (= lt!136094 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!136093 (bvsdiv (bvmul lt!136094 lt!136093) lt!136094)))))

(assert (=> d!27706 (= lt!136093 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27706 (= lt!136094 ((_ sign_extend 32) (size!1878 (buf!2268 (_1!3961 lt!136029)))))))

(assert (=> d!27706 (= lt!136097 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4492 (_1!3961 lt!136029))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4487 (_1!3961 lt!136029)))))))

(assert (=> d!27706 (invariant!0 (currentBit!4487 (_1!3961 lt!136029)) (currentByte!4492 (_1!3961 lt!136029)) (size!1878 (buf!2268 (_1!3961 lt!136029))))))

(assert (=> d!27706 (= (bitIndex!0 (size!1878 (buf!2268 (_1!3961 lt!136029))) (currentByte!4492 (_1!3961 lt!136029)) (currentBit!4487 (_1!3961 lt!136029))) lt!136097)))

(declare-fun b!88375 () Bool)

(declare-fun res!72754 () Bool)

(assert (=> b!88375 (=> (not res!72754) (not e!58488))))

(assert (=> b!88375 (= res!72754 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!136097))))

(declare-fun b!88376 () Bool)

(declare-fun lt!136095 () (_ BitVec 64))

(assert (=> b!88376 (= e!58488 (bvsle lt!136097 (bvmul lt!136095 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!88376 (or (= lt!136095 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!136095 #b0000000000000000000000000000000000000000000000000000000000001000) lt!136095)))))

(assert (=> b!88376 (= lt!136095 ((_ sign_extend 32) (size!1878 (buf!2268 (_1!3961 lt!136029)))))))

(assert (= (and d!27706 res!72753) b!88375))

(assert (= (and b!88375 res!72754) b!88376))

(declare-fun m!133569 () Bool)

(assert (=> d!27706 m!133569))

(declare-fun m!133571 () Bool)

(assert (=> d!27706 m!133571))

(assert (=> b!88287 d!27706))

(declare-fun d!27708 () Bool)

(declare-datatypes ((tuple2!7462 0))(
  ( (tuple2!7463 (_1!3964 Bool) (_2!3964 BitStream!3318)) )
))
(declare-fun lt!136101 () tuple2!7462)

(declare-fun readBit!0 (BitStream!3318) tuple2!7462)

(assert (=> d!27708 (= lt!136101 (readBit!0 (readerFrom!0 (_2!3960 lt!136028) (currentBit!4487 thiss!1152) (currentByte!4492 thiss!1152))))))

(assert (=> d!27708 (= (readBitPure!0 (readerFrom!0 (_2!3960 lt!136028) (currentBit!4487 thiss!1152) (currentByte!4492 thiss!1152))) (tuple2!7457 (_2!3964 lt!136101) (_1!3964 lt!136101)))))

(declare-fun bs!6864 () Bool)

(assert (= bs!6864 d!27708))

(assert (=> bs!6864 m!133501))

(declare-fun m!133573 () Bool)

(assert (=> bs!6864 m!133573))

(assert (=> b!88289 d!27708))

(declare-fun d!27710 () Bool)

(declare-fun e!58491 () Bool)

(assert (=> d!27710 e!58491))

(declare-fun res!72758 () Bool)

(assert (=> d!27710 (=> (not res!72758) (not e!58491))))

(assert (=> d!27710 (= res!72758 (invariant!0 (currentBit!4487 (_2!3960 lt!136028)) (currentByte!4492 (_2!3960 lt!136028)) (size!1878 (buf!2268 (_2!3960 lt!136028)))))))

(assert (=> d!27710 (= (readerFrom!0 (_2!3960 lt!136028) (currentBit!4487 thiss!1152) (currentByte!4492 thiss!1152)) (BitStream!3319 (buf!2268 (_2!3960 lt!136028)) (currentByte!4492 thiss!1152) (currentBit!4487 thiss!1152)))))

(declare-fun b!88379 () Bool)

(assert (=> b!88379 (= e!58491 (invariant!0 (currentBit!4487 thiss!1152) (currentByte!4492 thiss!1152) (size!1878 (buf!2268 (_2!3960 lt!136028)))))))

(assert (= (and d!27710 res!72758) b!88379))

(assert (=> d!27710 m!133489))

(declare-fun m!133575 () Bool)

(assert (=> b!88379 m!133575))

(assert (=> b!88289 d!27710))

(check-sat (not d!27696) (not d!27682) (not b!88357) (not d!27706) (not d!27710) (not d!27702) (not d!27708) (not d!27690) (not d!27688) (not b!88371) (not b!88370) (not b!88379) (not b!88359) (not b!88372) (not d!27680) (not b!88369) (not d!27678) (not d!27692))
