; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30098 () Bool)

(assert start!30098)

(declare-fun b!154449 () Bool)

(declare-fun e!103838 () Bool)

(declare-fun e!103839 () Bool)

(assert (=> b!154449 (= e!103838 e!103839)))

(declare-fun res!129259 () Bool)

(assert (=> b!154449 (=> (not res!129259) (not e!103839))))

(declare-fun lt!240796 () (_ BitVec 64))

(declare-datatypes ((array!6993 0))(
  ( (array!6994 (arr!3973 (Array (_ BitVec 32) (_ BitVec 8))) (size!3150 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5558 0))(
  ( (BitStream!5559 (buf!3653 array!6993) (currentByte!6675 (_ BitVec 32)) (currentBit!6670 (_ BitVec 32))) )
))
(declare-fun bs1!10 () BitStream!5558)

(assert (=> b!154449 (= res!129259 (bvsle lt!240796 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3150 (buf!3653 bs1!10))))))))

(declare-fun lt!240797 () (_ BitVec 64))

(assert (=> b!154449 (= lt!240796 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!240797))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!154449 (= lt!240797 (bitIndex!0 (size!3150 (buf!3653 bs1!10)) (currentByte!6675 bs1!10) (currentBit!6670 bs1!10)))))

(declare-fun b!154450 () Bool)

(declare-fun e!103836 () Bool)

(declare-fun bs2!18 () BitStream!5558)

(declare-fun array_inv!2939 (array!6993) Bool)

(assert (=> b!154450 (= e!103836 (array_inv!2939 (buf!3653 bs2!18)))))

(declare-fun b!154451 () Bool)

(declare-fun res!129261 () Bool)

(assert (=> b!154451 (=> (not res!129261) (not e!103839))))

(assert (=> b!154451 (= res!129261 (bvsle lt!240796 (bitIndex!0 (size!3150 (buf!3653 bs2!18)) (currentByte!6675 bs2!18) (currentBit!6670 bs2!18))))))

(declare-fun b!154452 () Bool)

(assert (=> b!154452 (= e!103839 (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bvsdiv lt!240797 #b0000000000000000000000000000000000000000000000000000000000001000)) #b0000000000000000000000000000000010000000000000000000000000000000))))

(declare-datatypes ((tuple2!13682 0))(
  ( (tuple2!13683 (_1!7240 BitStream!5558) (_2!7240 (_ BitVec 8))) )
))
(declare-fun lt!240799 () tuple2!13682)

(declare-fun readBytePure!0 (BitStream!5558) tuple2!13682)

(assert (=> b!154452 (= lt!240799 (readBytePure!0 (BitStream!5559 (buf!3653 bs2!18) (currentByte!6675 bs1!10) (currentBit!6670 bs1!10))))))

(declare-fun lt!240798 () tuple2!13682)

(assert (=> b!154452 (= lt!240798 (readBytePure!0 bs1!10))))

(declare-fun b!154453 () Bool)

(declare-fun e!103837 () Bool)

(assert (=> b!154453 (= e!103837 (array_inv!2939 (buf!3653 bs1!10)))))

(declare-fun res!129260 () Bool)

(assert (=> start!30098 (=> (not res!129260) (not e!103838))))

(assert (=> start!30098 (= res!129260 (= (size!3150 (buf!3653 bs1!10)) (size!3150 (buf!3653 bs2!18))))))

(assert (=> start!30098 e!103838))

(declare-fun inv!12 (BitStream!5558) Bool)

(assert (=> start!30098 (and (inv!12 bs1!10) e!103837)))

(assert (=> start!30098 (and (inv!12 bs2!18) e!103836)))

(declare-fun b!154454 () Bool)

(declare-fun res!129258 () Bool)

(assert (=> b!154454 (=> (not res!129258) (not e!103839))))

(declare-fun arrayBitRangesEq!0 (array!6993 array!6993 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!154454 (= res!129258 (arrayBitRangesEq!0 (buf!3653 bs1!10) (buf!3653 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!240796))))

(assert (= (and start!30098 res!129260) b!154449))

(assert (= (and b!154449 res!129259) b!154451))

(assert (= (and b!154451 res!129261) b!154454))

(assert (= (and b!154454 res!129258) b!154452))

(assert (= start!30098 b!154453))

(assert (= start!30098 b!154450))

(declare-fun m!240415 () Bool)

(assert (=> b!154453 m!240415))

(declare-fun m!240417 () Bool)

(assert (=> start!30098 m!240417))

(declare-fun m!240419 () Bool)

(assert (=> start!30098 m!240419))

(declare-fun m!240421 () Bool)

(assert (=> b!154452 m!240421))

(declare-fun m!240423 () Bool)

(assert (=> b!154452 m!240423))

(declare-fun m!240425 () Bool)

(assert (=> b!154450 m!240425))

(declare-fun m!240427 () Bool)

(assert (=> b!154449 m!240427))

(declare-fun m!240429 () Bool)

(assert (=> b!154451 m!240429))

(declare-fun m!240431 () Bool)

(assert (=> b!154454 m!240431))

(push 1)

(assert (not b!154453))

(assert (not start!30098))

(assert (not b!154452))

(assert (not b!154454))

(assert (not b!154449))

(assert (not b!154451))

(assert (not b!154450))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun e!103898 () Bool)

(declare-fun b!154528 () Bool)

(declare-datatypes ((tuple4!196 0))(
  ( (tuple4!197 (_1!7243 (_ BitVec 32)) (_2!7243 (_ BitVec 32)) (_3!401 (_ BitVec 32)) (_4!98 (_ BitVec 32))) )
))
(declare-fun lt!240878 () tuple4!196)

(declare-fun arrayRangesEq!391 (array!6993 array!6993 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!154528 (= e!103898 (arrayRangesEq!391 (buf!3653 bs1!10) (buf!3653 bs2!18) (_1!7243 lt!240878) (_2!7243 lt!240878)))))

(declare-fun b!154529 () Bool)

(declare-fun e!103897 () Bool)

(declare-fun call!2204 () Bool)

(assert (=> b!154529 (= e!103897 call!2204)))

(declare-fun b!154530 () Bool)

(declare-fun e!103900 () Bool)

(declare-fun e!103896 () Bool)

(assert (=> b!154530 (= e!103900 e!103896)))

(declare-fun res!129318 () Bool)

(assert (=> b!154530 (=> (not res!129318) (not e!103896))))

(assert (=> b!154530 (= res!129318 e!103898)))

(declare-fun res!129320 () Bool)

(assert (=> b!154530 (=> res!129320 e!103898)))

(assert (=> b!154530 (= res!129320 (bvsge (_1!7243 lt!240878) (_2!7243 lt!240878)))))

(declare-fun lt!240876 () (_ BitVec 32))

(assert (=> b!154530 (= lt!240876 ((_ extract 31 0) (bvsrem lt!240796 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!240877 () (_ BitVec 32))

(assert (=> b!154530 (= lt!240877 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!196)

(assert (=> b!154530 (= lt!240878 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!240796))))

(declare-fun b!154531 () Bool)

(declare-fun e!103899 () Bool)

(assert (=> b!154531 (= e!103897 e!103899)))

(declare-fun res!129322 () Bool)

(assert (=> b!154531 (= res!129322 call!2204)))

(assert (=> b!154531 (=> (not res!129322) (not e!103899))))

(declare-fun b!154532 () Bool)

(assert (=> b!154532 (= e!103896 e!103897)))

(declare-fun c!8220 () Bool)

(assert (=> b!154532 (= c!8220 (= (_3!401 lt!240878) (_4!98 lt!240878)))))

(declare-fun b!154527 () Bool)

(declare-fun res!129319 () Bool)

(assert (=> b!154527 (= res!129319 (= lt!240876 #b00000000000000000000000000000000))))

(declare-fun e!103901 () Bool)

(assert (=> b!154527 (=> res!129319 e!103901)))

(assert (=> b!154527 (= e!103899 e!103901)))

(declare-fun d!50900 () Bool)

(declare-fun res!129321 () Bool)

(assert (=> d!50900 (=> res!129321 e!103900)))

(assert (=> d!50900 (= res!129321 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!240796))))

(assert (=> d!50900 (= (arrayBitRangesEq!0 (buf!3653 bs1!10) (buf!3653 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!240796) e!103900)))

(declare-fun b!154533 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!154533 (= e!103901 (byteRangesEq!0 (select (arr!3973 (buf!3653 bs1!10)) (_4!98 lt!240878)) (select (arr!3973 (buf!3653 bs2!18)) (_4!98 lt!240878)) #b00000000000000000000000000000000 lt!240876))))

(declare-fun bm!2201 () Bool)

(assert (=> bm!2201 (= call!2204 (byteRangesEq!0 (select (arr!3973 (buf!3653 bs1!10)) (_3!401 lt!240878)) (select (arr!3973 (buf!3653 bs2!18)) (_3!401 lt!240878)) lt!240877 (ite c!8220 lt!240876 #b00000000000000000000000000001000)))))

(assert (= (and d!50900 (not res!129321)) b!154530))

(assert (= (and b!154530 (not res!129320)) b!154528))

(assert (= (and b!154530 res!129318) b!154532))

(assert (= (and b!154532 c!8220) b!154529))

(assert (= (and b!154532 (not c!8220)) b!154531))

(assert (= (and b!154531 res!129322) b!154527))

(assert (= (and b!154527 (not res!129319)) b!154533))

(assert (= (or b!154529 b!154531) bm!2201))

(declare-fun m!240485 () Bool)

(assert (=> b!154528 m!240485))

(declare-fun m!240487 () Bool)

(assert (=> b!154530 m!240487))

(declare-fun m!240489 () Bool)

(assert (=> b!154533 m!240489))

(declare-fun m!240491 () Bool)

(assert (=> b!154533 m!240491))

(assert (=> b!154533 m!240489))

(assert (=> b!154533 m!240491))

(declare-fun m!240493 () Bool)

(assert (=> b!154533 m!240493))

(declare-fun m!240495 () Bool)

(assert (=> bm!2201 m!240495))

(declare-fun m!240497 () Bool)

(assert (=> bm!2201 m!240497))

(assert (=> bm!2201 m!240495))

(assert (=> bm!2201 m!240497))

(declare-fun m!240499 () Bool)

(assert (=> bm!2201 m!240499))

(assert (=> b!154454 d!50900))

(declare-fun d!50926 () Bool)

(assert (=> d!50926 (= (array_inv!2939 (buf!3653 bs1!10)) (bvsge (size!3150 (buf!3653 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!154453 d!50926))

(declare-fun d!50928 () Bool)

(assert (=> d!50928 (= (array_inv!2939 (buf!3653 bs2!18)) (bvsge (size!3150 (buf!3653 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!154450 d!50928))

(declare-fun d!50930 () Bool)

(declare-fun e!103904 () Bool)

(assert (=> d!50930 e!103904))

(declare-fun res!129328 () Bool)

(assert (=> d!50930 (=> (not res!129328) (not e!103904))))

(declare-fun lt!240898 () (_ BitVec 64))

(declare-fun lt!240899 () (_ BitVec 64))

(declare-fun lt!240900 () (_ BitVec 64))

(assert (=> d!50930 (= res!129328 (= lt!240900 (bvsub lt!240899 lt!240898)))))

(assert (=> d!50930 (or (= (bvand lt!240899 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!240898 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!240899 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!240899 lt!240898) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!50930 (= lt!240898 (remainingBits!0 ((_ sign_extend 32) (size!3150 (buf!3653 bs1!10))) ((_ sign_extend 32) (currentByte!6675 bs1!10)) ((_ sign_extend 32) (currentBit!6670 bs1!10))))))

(declare-fun lt!240895 () (_ BitVec 64))

(declare-fun lt!240896 () (_ BitVec 64))

(assert (=> d!50930 (= lt!240899 (bvmul lt!240895 lt!240896))))

(assert (=> d!50930 (or (= lt!240895 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!240896 (bvsdiv (bvmul lt!240895 lt!240896) lt!240895)))))

(assert (=> d!50930 (= lt!240896 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50930 (= lt!240895 ((_ sign_extend 32) (size!3150 (buf!3653 bs1!10))))))

(assert (=> d!50930 (= lt!240900 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6675 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6670 bs1!10))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!50930 (invariant!0 (currentBit!6670 bs1!10) (currentByte!6675 bs1!10) (size!3150 (buf!3653 bs1!10)))))

(assert (=> d!50930 (= (bitIndex!0 (size!3150 (buf!3653 bs1!10)) (currentByte!6675 bs1!10) (currentBit!6670 bs1!10)) lt!240900)))

(declare-fun b!154538 () Bool)

(declare-fun res!129327 () Bool)

(assert (=> b!154538 (=> (not res!129327) (not e!103904))))

(assert (=> b!154538 (= res!129327 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!240900))))

(declare-fun b!154539 () Bool)

(declare-fun lt!240897 () (_ BitVec 64))

(assert (=> b!154539 (= e!103904 (bvsle lt!240900 (bvmul lt!240897 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!154539 (or (= lt!240897 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!240897 #b0000000000000000000000000000000000000000000000000000000000001000) lt!240897)))))

(assert (=> b!154539 (= lt!240897 ((_ sign_extend 32) (size!3150 (buf!3653 bs1!10))))))

(assert (= (and d!50930 res!129328) b!154538))

(assert (= (and b!154538 res!129327) b!154539))

(declare-fun m!240505 () Bool)

(assert (=> d!50930 m!240505))

(declare-fun m!240507 () Bool)

(assert (=> d!50930 m!240507))

(assert (=> b!154449 d!50930))

(declare-fun d!50934 () Bool)

(declare-fun e!103905 () Bool)

(assert (=> d!50934 e!103905))

(declare-fun res!129330 () Bool)

(assert (=> d!50934 (=> (not res!129330) (not e!103905))))

(declare-fun lt!240904 () (_ BitVec 64))

(declare-fun lt!240906 () (_ BitVec 64))

(declare-fun lt!240905 () (_ BitVec 64))

(assert (=> d!50934 (= res!129330 (= lt!240906 (bvsub lt!240905 lt!240904)))))

(assert (=> d!50934 (or (= (bvand lt!240905 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!240904 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!240905 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!240905 lt!240904) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50934 (= lt!240904 (remainingBits!0 ((_ sign_extend 32) (size!3150 (buf!3653 bs2!18))) ((_ sign_extend 32) (currentByte!6675 bs2!18)) ((_ sign_extend 32) (currentBit!6670 bs2!18))))))

(declare-fun lt!240901 () (_ BitVec 64))

(declare-fun lt!240902 () (_ BitVec 64))

(assert (=> d!50934 (= lt!240905 (bvmul lt!240901 lt!240902))))

(assert (=> d!50934 (or (= lt!240901 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!240902 (bvsdiv (bvmul lt!240901 lt!240902) lt!240901)))))

(assert (=> d!50934 (= lt!240902 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50934 (= lt!240901 ((_ sign_extend 32) (size!3150 (buf!3653 bs2!18))))))

(assert (=> d!50934 (= lt!240906 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6675 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6670 bs2!18))))))

(assert (=> d!50934 (invariant!0 (currentBit!6670 bs2!18) (currentByte!6675 bs2!18) (size!3150 (buf!3653 bs2!18)))))

(assert (=> d!50934 (= (bitIndex!0 (size!3150 (buf!3653 bs2!18)) (currentByte!6675 bs2!18) (currentBit!6670 bs2!18)) lt!240906)))

(declare-fun b!154540 () Bool)

(declare-fun res!129329 () Bool)

(assert (=> b!154540 (=> (not res!129329) (not e!103905))))

(assert (=> b!154540 (= res!129329 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!240906))))

(declare-fun b!154541 () Bool)

(declare-fun lt!240903 () (_ BitVec 64))

(assert (=> b!154541 (= e!103905 (bvsle lt!240906 (bvmul lt!240903 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!154541 (or (= lt!240903 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!240903 #b0000000000000000000000000000000000000000000000000000000000001000) lt!240903)))))

(assert (=> b!154541 (= lt!240903 ((_ sign_extend 32) (size!3150 (buf!3653 bs2!18))))))

(assert (= (and d!50934 res!129330) b!154540))

(assert (= (and b!154540 res!129329) b!154541))

(declare-fun m!240509 () Bool)

(assert (=> d!50934 m!240509))

(declare-fun m!240511 () Bool)

(assert (=> d!50934 m!240511))

(assert (=> b!154451 d!50934))

(declare-fun d!50936 () Bool)

(assert (=> d!50936 (= (inv!12 bs1!10) (invariant!0 (currentBit!6670 bs1!10) (currentByte!6675 bs1!10) (size!3150 (buf!3653 bs1!10))))))

(declare-fun bs!12460 () Bool)

(assert (= bs!12460 d!50936))

(assert (=> bs!12460 m!240507))

(assert (=> start!30098 d!50936))

(declare-fun d!50938 () Bool)

(assert (=> d!50938 (= (inv!12 bs2!18) (invariant!0 (currentBit!6670 bs2!18) (currentByte!6675 bs2!18) (size!3150 (buf!3653 bs2!18))))))

(declare-fun bs!12461 () Bool)

(assert (= bs!12461 d!50938))

(assert (=> bs!12461 m!240511))

(assert (=> start!30098 d!50938))

(declare-fun d!50940 () Bool)

(declare-datatypes ((tuple2!13688 0))(
  ( (tuple2!13689 (_1!7246 (_ BitVec 8)) (_2!7246 BitStream!5558)) )
))
(declare-fun lt!240909 () tuple2!13688)

(declare-fun readByte!0 (BitStream!5558) tuple2!13688)

(assert (=> d!50940 (= lt!240909 (readByte!0 (BitStream!5559 (buf!3653 bs2!18) (currentByte!6675 bs1!10) (currentBit!6670 bs1!10))))))

(assert (=> d!50940 (= (readBytePure!0 (BitStream!5559 (buf!3653 bs2!18) (currentByte!6675 bs1!10) (currentBit!6670 bs1!10))) (tuple2!13683 (_2!7246 lt!240909) (_1!7246 lt!240909)))))

(declare-fun bs!12462 () Bool)

(assert (= bs!12462 d!50940))

(declare-fun m!240513 () Bool)

(assert (=> bs!12462 m!240513))

(assert (=> b!154452 d!50940))

(declare-fun d!50942 () Bool)

(declare-fun lt!240910 () tuple2!13688)

(assert (=> d!50942 (= lt!240910 (readByte!0 bs1!10))))

(assert (=> d!50942 (= (readBytePure!0 bs1!10) (tuple2!13683 (_2!7246 lt!240910) (_1!7246 lt!240910)))))

(declare-fun bs!12463 () Bool)

(assert (= bs!12463 d!50942))

(declare-fun m!240515 () Bool)

(assert (=> bs!12463 m!240515))

(assert (=> b!154452 d!50942))

(push 1)

(assert (not bm!2201))

(assert (not d!50938))

(assert (not d!50934))

(assert (not d!50930))

(assert (not d!50942))

(assert (not b!154533))

(assert (not d!50940))

(assert (not b!154528))

(assert (not b!154530))

(assert (not d!50936))

(check-sat)

(pop 1)

(push 1)

(check-sat)

