; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29732 () Bool)

(assert start!29732)

(declare-fun b!153132 () Bool)

(declare-fun e!102590 () Bool)

(declare-datatypes ((array!6876 0))(
  ( (array!6877 (arr!3925 (Array (_ BitVec 32) (_ BitVec 8))) (size!3102 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5462 0))(
  ( (BitStream!5463 (buf!3605 array!6876) (currentByte!6591 (_ BitVec 32)) (currentBit!6586 (_ BitVec 32))) )
))
(declare-fun bs2!18 () BitStream!5462)

(declare-fun array_inv!2891 (array!6876) Bool)

(assert (=> b!153132 (= e!102590 (array_inv!2891 (buf!3605 bs2!18)))))

(declare-fun b!153133 () Bool)

(declare-fun e!102587 () Bool)

(declare-fun e!102591 () Bool)

(assert (=> b!153133 (= e!102587 e!102591)))

(declare-fun res!128297 () Bool)

(assert (=> b!153133 (=> (not res!128297) (not e!102591))))

(declare-fun lt!239541 () (_ BitVec 64))

(declare-fun bs1!10 () BitStream!5462)

(assert (=> b!153133 (= res!128297 (bvsle lt!239541 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3102 (buf!3605 bs1!10))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!153133 (= lt!239541 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3102 (buf!3605 bs1!10)) (currentByte!6591 bs1!10) (currentBit!6586 bs1!10))))))

(declare-fun res!128296 () Bool)

(assert (=> start!29732 (=> (not res!128296) (not e!102587))))

(assert (=> start!29732 (= res!128296 (= (size!3102 (buf!3605 bs1!10)) (size!3102 (buf!3605 bs2!18))))))

(assert (=> start!29732 e!102587))

(declare-fun e!102589 () Bool)

(declare-fun inv!12 (BitStream!5462) Bool)

(assert (=> start!29732 (and (inv!12 bs1!10) e!102589)))

(assert (=> start!29732 (and (inv!12 bs2!18) e!102590)))

(declare-fun b!153134 () Bool)

(declare-fun res!128295 () Bool)

(assert (=> b!153134 (=> (not res!128295) (not e!102591))))

(declare-fun arrayBitRangesEq!0 (array!6876 array!6876 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!153134 (= res!128295 (arrayBitRangesEq!0 (buf!3605 bs1!10) (buf!3605 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!239541))))

(declare-fun b!153135 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!153135 (= e!102591 (not (invariant!0 (currentBit!6586 bs1!10) (currentByte!6591 bs1!10) (size!3102 (buf!3605 bs1!10)))))))

(declare-datatypes ((tuple2!13586 0))(
  ( (tuple2!13587 (_1!7180 BitStream!5462) (_2!7180 (_ BitVec 8))) )
))
(declare-fun lt!239542 () tuple2!13586)

(declare-fun readBytePure!0 (BitStream!5462) tuple2!13586)

(assert (=> b!153135 (= lt!239542 (readBytePure!0 (BitStream!5463 (buf!3605 bs2!18) (currentByte!6591 bs1!10) (currentBit!6586 bs1!10))))))

(declare-fun lt!239540 () tuple2!13586)

(assert (=> b!153135 (= lt!239540 (readBytePure!0 bs1!10))))

(declare-fun b!153136 () Bool)

(declare-fun res!128298 () Bool)

(assert (=> b!153136 (=> (not res!128298) (not e!102591))))

(assert (=> b!153136 (= res!128298 (bvsle lt!239541 (bitIndex!0 (size!3102 (buf!3605 bs2!18)) (currentByte!6591 bs2!18) (currentBit!6586 bs2!18))))))

(declare-fun b!153137 () Bool)

(assert (=> b!153137 (= e!102589 (array_inv!2891 (buf!3605 bs1!10)))))

(assert (= (and start!29732 res!128296) b!153133))

(assert (= (and b!153133 res!128297) b!153136))

(assert (= (and b!153136 res!128298) b!153134))

(assert (= (and b!153134 res!128295) b!153135))

(assert (= start!29732 b!153137))

(assert (= start!29732 b!153132))

(declare-fun m!238943 () Bool)

(assert (=> b!153137 m!238943))

(declare-fun m!238945 () Bool)

(assert (=> start!29732 m!238945))

(declare-fun m!238947 () Bool)

(assert (=> start!29732 m!238947))

(declare-fun m!238949 () Bool)

(assert (=> b!153134 m!238949))

(declare-fun m!238951 () Bool)

(assert (=> b!153133 m!238951))

(declare-fun m!238953 () Bool)

(assert (=> b!153136 m!238953))

(declare-fun m!238955 () Bool)

(assert (=> b!153135 m!238955))

(declare-fun m!238957 () Bool)

(assert (=> b!153135 m!238957))

(declare-fun m!238959 () Bool)

(assert (=> b!153135 m!238959))

(declare-fun m!238961 () Bool)

(assert (=> b!153132 m!238961))

(push 1)

(assert (not b!153133))

(assert (not b!153132))

(assert (not b!153135))

(assert (not b!153136))

(assert (not start!29732))

(assert (not b!153134))

(assert (not b!153137))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!50380 () Bool)

(assert (=> d!50380 (= (inv!12 bs1!10) (invariant!0 (currentBit!6586 bs1!10) (currentByte!6591 bs1!10) (size!3102 (buf!3605 bs1!10))))))

(declare-fun bs!12321 () Bool)

(assert (= bs!12321 d!50380))

(assert (=> bs!12321 m!238955))

(assert (=> start!29732 d!50380))

(declare-fun d!50382 () Bool)

(assert (=> d!50382 (= (inv!12 bs2!18) (invariant!0 (currentBit!6586 bs2!18) (currentByte!6591 bs2!18) (size!3102 (buf!3605 bs2!18))))))

(declare-fun bs!12322 () Bool)

(assert (= bs!12322 d!50382))

(declare-fun m!238969 () Bool)

(assert (=> bs!12322 m!238969))

(assert (=> start!29732 d!50382))

(declare-fun d!50384 () Bool)

(declare-fun e!102602 () Bool)

(assert (=> d!50384 e!102602))

(declare-fun res!128320 () Bool)

(assert (=> d!50384 (=> (not res!128320) (not e!102602))))

(declare-fun lt!239611 () (_ BitVec 64))

(declare-fun lt!239615 () (_ BitVec 64))

(declare-fun lt!239612 () (_ BitVec 64))

(assert (=> d!50384 (= res!128320 (= lt!239612 (bvsub lt!239615 lt!239611)))))

(assert (=> d!50384 (or (= (bvand lt!239615 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!239611 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!239615 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!239615 lt!239611) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!50384 (= lt!239611 (remainingBits!0 ((_ sign_extend 32) (size!3102 (buf!3605 bs1!10))) ((_ sign_extend 32) (currentByte!6591 bs1!10)) ((_ sign_extend 32) (currentBit!6586 bs1!10))))))

(declare-fun lt!239616 () (_ BitVec 64))

(declare-fun lt!239613 () (_ BitVec 64))

(assert (=> d!50384 (= lt!239615 (bvmul lt!239616 lt!239613))))

(assert (=> d!50384 (or (= lt!239616 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!239613 (bvsdiv (bvmul lt!239616 lt!239613) lt!239616)))))

(assert (=> d!50384 (= lt!239613 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50384 (= lt!239616 ((_ sign_extend 32) (size!3102 (buf!3605 bs1!10))))))

(assert (=> d!50384 (= lt!239612 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6591 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6586 bs1!10))))))

(assert (=> d!50384 (invariant!0 (currentBit!6586 bs1!10) (currentByte!6591 bs1!10) (size!3102 (buf!3605 bs1!10)))))

(assert (=> d!50384 (= (bitIndex!0 (size!3102 (buf!3605 bs1!10)) (currentByte!6591 bs1!10) (currentBit!6586 bs1!10)) lt!239612)))

(declare-fun b!153158 () Bool)

(declare-fun res!128319 () Bool)

(assert (=> b!153158 (=> (not res!128319) (not e!102602))))

(assert (=> b!153158 (= res!128319 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!239612))))

(declare-fun b!153159 () Bool)

(declare-fun lt!239614 () (_ BitVec 64))

(assert (=> b!153159 (= e!102602 (bvsle lt!239612 (bvmul lt!239614 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!153159 (or (= lt!239614 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!239614 #b0000000000000000000000000000000000000000000000000000000000001000) lt!239614)))))

(assert (=> b!153159 (= lt!239614 ((_ sign_extend 32) (size!3102 (buf!3605 bs1!10))))))

(assert (= (and d!50384 res!128320) b!153158))

(assert (= (and b!153158 res!128319) b!153159))

(declare-fun m!238985 () Bool)

(assert (=> d!50384 m!238985))

(assert (=> d!50384 m!238955))

(assert (=> b!153133 d!50384))

(declare-fun d!50410 () Bool)

(assert (=> d!50410 (= (array_inv!2891 (buf!3605 bs2!18)) (bvsge (size!3102 (buf!3605 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!153132 d!50410))

(declare-fun d!50412 () Bool)

(assert (=> d!50412 (= (array_inv!2891 (buf!3605 bs1!10)) (bvsge (size!3102 (buf!3605 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!153137 d!50412))

(declare-fun d!50414 () Bool)

(assert (=> d!50414 (= (invariant!0 (currentBit!6586 bs1!10) (currentByte!6591 bs1!10) (size!3102 (buf!3605 bs1!10))) (and (bvsge (currentBit!6586 bs1!10) #b00000000000000000000000000000000) (bvslt (currentBit!6586 bs1!10) #b00000000000000000000000000001000) (bvsge (currentByte!6591 bs1!10) #b00000000000000000000000000000000) (or (bvslt (currentByte!6591 bs1!10) (size!3102 (buf!3605 bs1!10))) (and (= (currentBit!6586 bs1!10) #b00000000000000000000000000000000) (= (currentByte!6591 bs1!10) (size!3102 (buf!3605 bs1!10)))))))))

(assert (=> b!153135 d!50414))

(declare-fun d!50416 () Bool)

(declare-datatypes ((tuple2!13592 0))(
  ( (tuple2!13593 (_1!7185 (_ BitVec 8)) (_2!7185 BitStream!5462)) )
))
(declare-fun lt!239625 () tuple2!13592)

(declare-fun readByte!0 (BitStream!5462) tuple2!13592)

(assert (=> d!50416 (= lt!239625 (readByte!0 (BitStream!5463 (buf!3605 bs2!18) (currentByte!6591 bs1!10) (currentBit!6586 bs1!10))))))

(assert (=> d!50416 (= (readBytePure!0 (BitStream!5463 (buf!3605 bs2!18) (currentByte!6591 bs1!10) (currentBit!6586 bs1!10))) (tuple2!13587 (_2!7185 lt!239625) (_1!7185 lt!239625)))))

(declare-fun bs!12327 () Bool)

(assert (= bs!12327 d!50416))

(declare-fun m!238987 () Bool)

(assert (=> bs!12327 m!238987))

(assert (=> b!153135 d!50416))

(declare-fun d!50418 () Bool)

(declare-fun lt!239626 () tuple2!13592)

(assert (=> d!50418 (= lt!239626 (readByte!0 bs1!10))))

(assert (=> d!50418 (= (readBytePure!0 bs1!10) (tuple2!13587 (_2!7185 lt!239626) (_1!7185 lt!239626)))))

(declare-fun bs!12328 () Bool)

(assert (= bs!12328 d!50418))

(declare-fun m!238989 () Bool)

(assert (=> bs!12328 m!238989))

(assert (=> b!153135 d!50418))

(declare-fun d!50420 () Bool)

(declare-fun e!102615 () Bool)

(assert (=> d!50420 e!102615))

(declare-fun res!128332 () Bool)

(assert (=> d!50420 (=> (not res!128332) (not e!102615))))

(declare-fun lt!239628 () (_ BitVec 64))

(declare-fun lt!239631 () (_ BitVec 64))

(declare-fun lt!239627 () (_ BitVec 64))

(assert (=> d!50420 (= res!128332 (= lt!239628 (bvsub lt!239631 lt!239627)))))

(assert (=> d!50420 (or (= (bvand lt!239631 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!239627 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!239631 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!239631 lt!239627) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50420 (= lt!239627 (remainingBits!0 ((_ sign_extend 32) (size!3102 (buf!3605 bs2!18))) ((_ sign_extend 32) (currentByte!6591 bs2!18)) ((_ sign_extend 32) (currentBit!6586 bs2!18))))))

(declare-fun lt!239632 () (_ BitVec 64))

(declare-fun lt!239629 () (_ BitVec 64))

(assert (=> d!50420 (= lt!239631 (bvmul lt!239632 lt!239629))))

(assert (=> d!50420 (or (= lt!239632 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!239629 (bvsdiv (bvmul lt!239632 lt!239629) lt!239632)))))

(assert (=> d!50420 (= lt!239629 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50420 (= lt!239632 ((_ sign_extend 32) (size!3102 (buf!3605 bs2!18))))))

(assert (=> d!50420 (= lt!239628 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6591 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6586 bs2!18))))))

(assert (=> d!50420 (invariant!0 (currentBit!6586 bs2!18) (currentByte!6591 bs2!18) (size!3102 (buf!3605 bs2!18)))))

(assert (=> d!50420 (= (bitIndex!0 (size!3102 (buf!3605 bs2!18)) (currentByte!6591 bs2!18) (currentBit!6586 bs2!18)) lt!239628)))

(declare-fun b!153174 () Bool)

(declare-fun res!128331 () Bool)

(assert (=> b!153174 (=> (not res!128331) (not e!102615))))

(assert (=> b!153174 (= res!128331 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!239628))))

(declare-fun b!153175 () Bool)

(declare-fun lt!239630 () (_ BitVec 64))

(assert (=> b!153175 (= e!102615 (bvsle lt!239628 (bvmul lt!239630 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!153175 (or (= lt!239630 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!239630 #b0000000000000000000000000000000000000000000000000000000000001000) lt!239630)))))

(assert (=> b!153175 (= lt!239630 ((_ sign_extend 32) (size!3102 (buf!3605 bs2!18))))))

(assert (= (and d!50420 res!128332) b!153174))

(assert (= (and b!153174 res!128331) b!153175))

(declare-fun m!238991 () Bool)

(assert (=> d!50420 m!238991))

(assert (=> d!50420 m!238969))

(assert (=> b!153136 d!50420))

(declare-fun d!50422 () Bool)

(declare-fun res!128363 () Bool)

(declare-fun e!102655 () Bool)

(assert (=> d!50422 (=> res!128363 e!102655)))

(assert (=> d!50422 (= res!128363 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!239541))))

(assert (=> d!50422 (= (arrayBitRangesEq!0 (buf!3605 bs1!10) (buf!3605 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!239541) e!102655)))

(declare-fun b!153218 () Bool)

(declare-fun e!102656 () Bool)

(declare-fun e!102657 () Bool)

(assert (=> b!153218 (= e!102656 e!102657)))

(declare-fun c!8184 () Bool)

(declare-datatypes ((tuple4!172 0))(
  ( (tuple4!173 (_1!7186 (_ BitVec 32)) (_2!7186 (_ BitVec 32)) (_3!389 (_ BitVec 32)) (_4!86 (_ BitVec 32))) )
))
(declare-fun lt!239651 () tuple4!172)

(assert (=> b!153218 (= c!8184 (= (_3!389 lt!239651) (_4!86 lt!239651)))))

(declare-fun b!153219 () Bool)

(declare-fun e!102653 () Bool)

(assert (=> b!153219 (= e!102657 e!102653)))

(declare-fun res!128366 () Bool)

(declare-fun call!2168 () Bool)

(assert (=> b!153219 (= res!128366 call!2168)))

(assert (=> b!153219 (=> (not res!128366) (not e!102653))))

(declare-fun lt!239653 () (_ BitVec 32))

(declare-fun bm!2165 () Bool)

(declare-fun lt!239652 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!2165 (= call!2168 (byteRangesEq!0 (select (arr!3925 (buf!3605 bs1!10)) (_3!389 lt!239651)) (select (arr!3925 (buf!3605 bs2!18)) (_3!389 lt!239651)) lt!239653 (ite c!8184 lt!239652 #b00000000000000000000000000001000)))))

(declare-fun b!153220 () Bool)

(declare-fun e!102654 () Bool)

(declare-fun arrayRangesEq!379 (array!6876 array!6876 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!153220 (= e!102654 (arrayRangesEq!379 (buf!3605 bs1!10) (buf!3605 bs2!18) (_1!7186 lt!239651) (_2!7186 lt!239651)))))

(declare-fun b!153221 () Bool)

(declare-fun e!102652 () Bool)

(assert (=> b!153221 (= e!102652 (byteRangesEq!0 (select (arr!3925 (buf!3605 bs1!10)) (_4!86 lt!239651)) (select (arr!3925 (buf!3605 bs2!18)) (_4!86 lt!239651)) #b00000000000000000000000000000000 lt!239652))))

(declare-fun b!153222 () Bool)

(assert (=> b!153222 (= e!102657 call!2168)))

(declare-fun b!153223 () Bool)

(declare-fun res!128364 () Bool)

(assert (=> b!153223 (= res!128364 (= lt!239652 #b00000000000000000000000000000000))))

(assert (=> b!153223 (=> res!128364 e!102652)))

(assert (=> b!153223 (= e!102653 e!102652)))

(declare-fun b!153224 () Bool)

(assert (=> b!153224 (= e!102655 e!102656)))

(declare-fun res!128367 () Bool)

(assert (=> b!153224 (=> (not res!128367) (not e!102656))))

(assert (=> b!153224 (= res!128367 e!102654)))

(declare-fun res!128365 () Bool)

(assert (=> b!153224 (=> res!128365 e!102654)))

(assert (=> b!153224 (= res!128365 (bvsge (_1!7186 lt!239651) (_2!7186 lt!239651)))))

(assert (=> b!153224 (= lt!239652 ((_ extract 31 0) (bvsrem lt!239541 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!153224 (= lt!239653 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!172)

(assert (=> b!153224 (= lt!239651 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!239541))))

(assert (= (and d!50422 (not res!128363)) b!153224))

(assert (= (and b!153224 (not res!128365)) b!153220))

(assert (= (and b!153224 res!128367) b!153218))

(assert (= (and b!153218 c!8184) b!153222))

(assert (= (and b!153218 (not c!8184)) b!153219))

(assert (= (and b!153219 res!128366) b!153223))

(assert (= (and b!153223 (not res!128364)) b!153221))

(assert (= (or b!153222 b!153219) bm!2165))

(declare-fun m!239025 () Bool)

(assert (=> bm!2165 m!239025))

(declare-fun m!239027 () Bool)

(assert (=> bm!2165 m!239027))

(assert (=> bm!2165 m!239025))

(assert (=> bm!2165 m!239027))

(declare-fun m!239029 () Bool)

(assert (=> bm!2165 m!239029))

(declare-fun m!239031 () Bool)

(assert (=> b!153220 m!239031))

(declare-fun m!239033 () Bool)

(assert (=> b!153221 m!239033))

(declare-fun m!239035 () Bool)

(assert (=> b!153221 m!239035))

(assert (=> b!153221 m!239033))

(assert (=> b!153221 m!239035))

(declare-fun m!239037 () Bool)

(assert (=> b!153221 m!239037))

(declare-fun m!239039 () Bool)

(assert (=> b!153224 m!239039))

(assert (=> b!153134 d!50422))

(push 1)

