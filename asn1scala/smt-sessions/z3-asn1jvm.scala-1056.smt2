; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30246 () Bool)

(assert start!30246)

(declare-fun res!129704 () Bool)

(declare-fun e!104355 () Bool)

(assert (=> start!30246 (=> (not res!129704) (not e!104355))))

(declare-datatypes ((array!7033 0))(
  ( (array!7034 (arr!3987 (Array (_ BitVec 32) (_ BitVec 8))) (size!3164 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5586 0))(
  ( (BitStream!5587 (buf!3667 array!7033) (currentByte!6701 (_ BitVec 32)) (currentBit!6696 (_ BitVec 32))) )
))
(declare-fun bs1!10 () BitStream!5586)

(declare-fun bs2!18 () BitStream!5586)

(assert (=> start!30246 (= res!129704 (= (size!3164 (buf!3667 bs1!10)) (size!3164 (buf!3667 bs2!18))))))

(assert (=> start!30246 e!104355))

(declare-fun e!104350 () Bool)

(declare-fun inv!12 (BitStream!5586) Bool)

(assert (=> start!30246 (and (inv!12 bs1!10) e!104350)))

(declare-fun e!104351 () Bool)

(assert (=> start!30246 (and (inv!12 bs2!18) e!104351)))

(declare-fun b!155049 () Bool)

(declare-fun e!104352 () Bool)

(assert (=> b!155049 (= e!104355 e!104352)))

(declare-fun res!129705 () Bool)

(assert (=> b!155049 (=> (not res!129705) (not e!104352))))

(declare-fun lt!241426 () (_ BitVec 64))

(assert (=> b!155049 (= res!129705 (bvsle lt!241426 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3164 (buf!3667 bs1!10))))))))

(declare-fun lt!241423 () (_ BitVec 64))

(assert (=> b!155049 (= lt!241426 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!241423))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!155049 (= lt!241423 (bitIndex!0 (size!3164 (buf!3667 bs1!10)) (currentByte!6701 bs1!10) (currentBit!6696 bs1!10)))))

(declare-fun b!155050 () Bool)

(declare-fun array_inv!2953 (array!7033) Bool)

(assert (=> b!155050 (= e!104351 (array_inv!2953 (buf!3667 bs2!18)))))

(declare-fun b!155051 () Bool)

(assert (=> b!155051 (= e!104350 (array_inv!2953 (buf!3667 bs1!10)))))

(declare-fun b!155052 () Bool)

(declare-fun lt!241425 () (_ BitVec 32))

(assert (=> b!155052 (= e!104352 (and (bvsle #b00000000000000000000000000000000 lt!241425) (bvsle lt!241425 (size!3164 (buf!3667 bs1!10))) (or (bvsgt #b00000000000000000000000000000000 (currentByte!6701 bs1!10)) (bvsge (currentByte!6701 bs1!10) lt!241425))))))

(assert (=> b!155052 (= lt!241425 ((_ extract 31 0) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bvsdiv lt!241423 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-datatypes ((tuple2!13734 0))(
  ( (tuple2!13735 (_1!7278 BitStream!5586) (_2!7278 (_ BitVec 8))) )
))
(declare-fun lt!241424 () tuple2!13734)

(declare-fun readBytePure!0 (BitStream!5586) tuple2!13734)

(assert (=> b!155052 (= lt!241424 (readBytePure!0 (BitStream!5587 (buf!3667 bs2!18) (currentByte!6701 bs1!10) (currentBit!6696 bs1!10))))))

(declare-fun lt!241422 () tuple2!13734)

(assert (=> b!155052 (= lt!241422 (readBytePure!0 bs1!10))))

(declare-fun b!155053 () Bool)

(declare-fun res!129702 () Bool)

(assert (=> b!155053 (=> (not res!129702) (not e!104352))))

(declare-fun arrayBitRangesEq!0 (array!7033 array!7033 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!155053 (= res!129702 (arrayBitRangesEq!0 (buf!3667 bs1!10) (buf!3667 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!241426))))

(declare-fun b!155054 () Bool)

(declare-fun res!129703 () Bool)

(assert (=> b!155054 (=> (not res!129703) (not e!104352))))

(assert (=> b!155054 (= res!129703 (bvsle lt!241426 (bitIndex!0 (size!3164 (buf!3667 bs2!18)) (currentByte!6701 bs2!18) (currentBit!6696 bs2!18))))))

(assert (= (and start!30246 res!129704) b!155049))

(assert (= (and b!155049 res!129705) b!155054))

(assert (= (and b!155054 res!129703) b!155053))

(assert (= (and b!155053 res!129702) b!155052))

(assert (= start!30246 b!155051))

(assert (= start!30246 b!155050))

(declare-fun m!241003 () Bool)

(assert (=> start!30246 m!241003))

(declare-fun m!241005 () Bool)

(assert (=> start!30246 m!241005))

(declare-fun m!241007 () Bool)

(assert (=> b!155052 m!241007))

(declare-fun m!241009 () Bool)

(assert (=> b!155052 m!241009))

(declare-fun m!241011 () Bool)

(assert (=> b!155050 m!241011))

(declare-fun m!241013 () Bool)

(assert (=> b!155054 m!241013))

(declare-fun m!241015 () Bool)

(assert (=> b!155053 m!241015))

(declare-fun m!241017 () Bool)

(assert (=> b!155049 m!241017))

(declare-fun m!241019 () Bool)

(assert (=> b!155051 m!241019))

(check-sat (not b!155049) (not b!155054) (not b!155050) (not b!155052) (not b!155051) (not start!30246) (not b!155053))
(check-sat)
(get-model)

(declare-fun d!51116 () Bool)

(assert (=> d!51116 (= (array_inv!2953 (buf!3667 bs1!10)) (bvsge (size!3164 (buf!3667 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!155051 d!51116))

(declare-fun d!51118 () Bool)

(assert (=> d!51118 (= (array_inv!2953 (buf!3667 bs2!18)) (bvsge (size!3164 (buf!3667 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!155050 d!51118))

(declare-fun d!51120 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!51120 (= (inv!12 bs1!10) (invariant!0 (currentBit!6696 bs1!10) (currentByte!6701 bs1!10) (size!3164 (buf!3667 bs1!10))))))

(declare-fun bs!12515 () Bool)

(assert (= bs!12515 d!51120))

(declare-fun m!241039 () Bool)

(assert (=> bs!12515 m!241039))

(assert (=> start!30246 d!51120))

(declare-fun d!51122 () Bool)

(assert (=> d!51122 (= (inv!12 bs2!18) (invariant!0 (currentBit!6696 bs2!18) (currentByte!6701 bs2!18) (size!3164 (buf!3667 bs2!18))))))

(declare-fun bs!12516 () Bool)

(assert (= bs!12516 d!51122))

(declare-fun m!241041 () Bool)

(assert (=> bs!12516 m!241041))

(assert (=> start!30246 d!51122))

(declare-fun d!51124 () Bool)

(declare-fun e!104376 () Bool)

(assert (=> d!51124 e!104376))

(declare-fun res!129722 () Bool)

(assert (=> d!51124 (=> (not res!129722) (not e!104376))))

(declare-fun lt!241462 () (_ BitVec 64))

(declare-fun lt!241459 () (_ BitVec 64))

(declare-fun lt!241461 () (_ BitVec 64))

(assert (=> d!51124 (= res!129722 (= lt!241462 (bvsub lt!241459 lt!241461)))))

(assert (=> d!51124 (or (= (bvand lt!241459 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!241461 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!241459 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!241459 lt!241461) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!51124 (= lt!241461 (remainingBits!0 ((_ sign_extend 32) (size!3164 (buf!3667 bs1!10))) ((_ sign_extend 32) (currentByte!6701 bs1!10)) ((_ sign_extend 32) (currentBit!6696 bs1!10))))))

(declare-fun lt!241458 () (_ BitVec 64))

(declare-fun lt!241457 () (_ BitVec 64))

(assert (=> d!51124 (= lt!241459 (bvmul lt!241458 lt!241457))))

(assert (=> d!51124 (or (= lt!241458 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!241457 (bvsdiv (bvmul lt!241458 lt!241457) lt!241458)))))

(assert (=> d!51124 (= lt!241457 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!51124 (= lt!241458 ((_ sign_extend 32) (size!3164 (buf!3667 bs1!10))))))

(assert (=> d!51124 (= lt!241462 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6701 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6696 bs1!10))))))

(assert (=> d!51124 (invariant!0 (currentBit!6696 bs1!10) (currentByte!6701 bs1!10) (size!3164 (buf!3667 bs1!10)))))

(assert (=> d!51124 (= (bitIndex!0 (size!3164 (buf!3667 bs1!10)) (currentByte!6701 bs1!10) (currentBit!6696 bs1!10)) lt!241462)))

(declare-fun b!155077 () Bool)

(declare-fun res!129723 () Bool)

(assert (=> b!155077 (=> (not res!129723) (not e!104376))))

(assert (=> b!155077 (= res!129723 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!241462))))

(declare-fun b!155078 () Bool)

(declare-fun lt!241460 () (_ BitVec 64))

(assert (=> b!155078 (= e!104376 (bvsle lt!241462 (bvmul lt!241460 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!155078 (or (= lt!241460 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!241460 #b0000000000000000000000000000000000000000000000000000000000001000) lt!241460)))))

(assert (=> b!155078 (= lt!241460 ((_ sign_extend 32) (size!3164 (buf!3667 bs1!10))))))

(assert (= (and d!51124 res!129722) b!155077))

(assert (= (and b!155077 res!129723) b!155078))

(declare-fun m!241047 () Bool)

(assert (=> d!51124 m!241047))

(assert (=> d!51124 m!241039))

(assert (=> b!155049 d!51124))

(declare-fun d!51138 () Bool)

(declare-fun e!104377 () Bool)

(assert (=> d!51138 e!104377))

(declare-fun res!129724 () Bool)

(assert (=> d!51138 (=> (not res!129724) (not e!104377))))

(declare-fun lt!241466 () (_ BitVec 64))

(declare-fun lt!241468 () (_ BitVec 64))

(declare-fun lt!241469 () (_ BitVec 64))

(assert (=> d!51138 (= res!129724 (= lt!241469 (bvsub lt!241466 lt!241468)))))

(assert (=> d!51138 (or (= (bvand lt!241466 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!241468 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!241466 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!241466 lt!241468) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!51138 (= lt!241468 (remainingBits!0 ((_ sign_extend 32) (size!3164 (buf!3667 bs2!18))) ((_ sign_extend 32) (currentByte!6701 bs2!18)) ((_ sign_extend 32) (currentBit!6696 bs2!18))))))

(declare-fun lt!241465 () (_ BitVec 64))

(declare-fun lt!241464 () (_ BitVec 64))

(assert (=> d!51138 (= lt!241466 (bvmul lt!241465 lt!241464))))

(assert (=> d!51138 (or (= lt!241465 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!241464 (bvsdiv (bvmul lt!241465 lt!241464) lt!241465)))))

(assert (=> d!51138 (= lt!241464 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!51138 (= lt!241465 ((_ sign_extend 32) (size!3164 (buf!3667 bs2!18))))))

(assert (=> d!51138 (= lt!241469 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6701 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6696 bs2!18))))))

(assert (=> d!51138 (invariant!0 (currentBit!6696 bs2!18) (currentByte!6701 bs2!18) (size!3164 (buf!3667 bs2!18)))))

(assert (=> d!51138 (= (bitIndex!0 (size!3164 (buf!3667 bs2!18)) (currentByte!6701 bs2!18) (currentBit!6696 bs2!18)) lt!241469)))

(declare-fun b!155079 () Bool)

(declare-fun res!129725 () Bool)

(assert (=> b!155079 (=> (not res!129725) (not e!104377))))

(assert (=> b!155079 (= res!129725 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!241469))))

(declare-fun b!155080 () Bool)

(declare-fun lt!241467 () (_ BitVec 64))

(assert (=> b!155080 (= e!104377 (bvsle lt!241469 (bvmul lt!241467 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!155080 (or (= lt!241467 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!241467 #b0000000000000000000000000000000000000000000000000000000000001000) lt!241467)))))

(assert (=> b!155080 (= lt!241467 ((_ sign_extend 32) (size!3164 (buf!3667 bs2!18))))))

(assert (= (and d!51138 res!129724) b!155079))

(assert (= (and b!155079 res!129725) b!155080))

(declare-fun m!241051 () Bool)

(assert (=> d!51138 m!241051))

(assert (=> d!51138 m!241041))

(assert (=> b!155054 d!51138))

(declare-fun b!155122 () Bool)

(declare-fun e!104416 () Bool)

(declare-fun call!2237 () Bool)

(assert (=> b!155122 (= e!104416 call!2237)))

(declare-fun b!155123 () Bool)

(declare-fun e!104412 () Bool)

(declare-fun e!104413 () Bool)

(assert (=> b!155123 (= e!104412 e!104413)))

(declare-fun c!8253 () Bool)

(declare-datatypes ((tuple4!218 0))(
  ( (tuple4!219 (_1!7282 (_ BitVec 32)) (_2!7282 (_ BitVec 32)) (_3!412 (_ BitVec 32)) (_4!109 (_ BitVec 32))) )
))
(declare-fun lt!241504 () tuple4!218)

(assert (=> b!155123 (= c!8253 (= (_3!412 lt!241504) (_4!109 lt!241504)))))

(declare-fun d!51144 () Bool)

(declare-fun res!129758 () Bool)

(declare-fun e!104414 () Bool)

(assert (=> d!51144 (=> res!129758 e!104414)))

(assert (=> d!51144 (= res!129758 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!241426))))

(assert (=> d!51144 (= (arrayBitRangesEq!0 (buf!3667 bs1!10) (buf!3667 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!241426) e!104414)))

(declare-fun bm!2234 () Bool)

(declare-fun lt!241503 () (_ BitVec 32))

(declare-fun lt!241505 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!2234 (= call!2237 (byteRangesEq!0 (ite c!8253 (select (arr!3987 (buf!3667 bs1!10)) (_3!412 lt!241504)) (select (arr!3987 (buf!3667 bs1!10)) (_4!109 lt!241504))) (ite c!8253 (select (arr!3987 (buf!3667 bs2!18)) (_3!412 lt!241504)) (select (arr!3987 (buf!3667 bs2!18)) (_4!109 lt!241504))) (ite c!8253 lt!241503 #b00000000000000000000000000000000) lt!241505))))

(declare-fun b!155124 () Bool)

(assert (=> b!155124 (= e!104414 e!104412)))

(declare-fun res!129760 () Bool)

(assert (=> b!155124 (=> (not res!129760) (not e!104412))))

(declare-fun e!104415 () Bool)

(assert (=> b!155124 (= res!129760 e!104415)))

(declare-fun res!129759 () Bool)

(assert (=> b!155124 (=> res!129759 e!104415)))

(assert (=> b!155124 (= res!129759 (bvsge (_1!7282 lt!241504) (_2!7282 lt!241504)))))

(assert (=> b!155124 (= lt!241505 ((_ extract 31 0) (bvsrem lt!241426 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!155124 (= lt!241503 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!218)

(assert (=> b!155124 (= lt!241504 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!241426))))

(declare-fun b!155125 () Bool)

(assert (=> b!155125 (= e!104413 call!2237)))

(declare-fun b!155126 () Bool)

(declare-fun e!104411 () Bool)

(assert (=> b!155126 (= e!104413 e!104411)))

(declare-fun res!129757 () Bool)

(assert (=> b!155126 (= res!129757 (byteRangesEq!0 (select (arr!3987 (buf!3667 bs1!10)) (_3!412 lt!241504)) (select (arr!3987 (buf!3667 bs2!18)) (_3!412 lt!241504)) lt!241503 #b00000000000000000000000000001000))))

(assert (=> b!155126 (=> (not res!129757) (not e!104411))))

(declare-fun b!155127 () Bool)

(declare-fun arrayRangesEq!402 (array!7033 array!7033 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!155127 (= e!104415 (arrayRangesEq!402 (buf!3667 bs1!10) (buf!3667 bs2!18) (_1!7282 lt!241504) (_2!7282 lt!241504)))))

(declare-fun b!155128 () Bool)

(declare-fun res!129761 () Bool)

(assert (=> b!155128 (= res!129761 (= lt!241505 #b00000000000000000000000000000000))))

(assert (=> b!155128 (=> res!129761 e!104416)))

(assert (=> b!155128 (= e!104411 e!104416)))

(assert (= (and d!51144 (not res!129758)) b!155124))

(assert (= (and b!155124 (not res!129759)) b!155127))

(assert (= (and b!155124 res!129760) b!155123))

(assert (= (and b!155123 c!8253) b!155125))

(assert (= (and b!155123 (not c!8253)) b!155126))

(assert (= (and b!155126 res!129757) b!155128))

(assert (= (and b!155128 (not res!129761)) b!155122))

(assert (= (or b!155125 b!155122) bm!2234))

(declare-fun m!241073 () Bool)

(assert (=> bm!2234 m!241073))

(declare-fun m!241075 () Bool)

(assert (=> bm!2234 m!241075))

(declare-fun m!241081 () Bool)

(assert (=> bm!2234 m!241081))

(declare-fun m!241083 () Bool)

(assert (=> bm!2234 m!241083))

(declare-fun m!241085 () Bool)

(assert (=> bm!2234 m!241085))

(declare-fun m!241087 () Bool)

(assert (=> b!155124 m!241087))

(assert (=> b!155126 m!241083))

(assert (=> b!155126 m!241073))

(assert (=> b!155126 m!241083))

(assert (=> b!155126 m!241073))

(declare-fun m!241089 () Bool)

(assert (=> b!155126 m!241089))

(declare-fun m!241091 () Bool)

(assert (=> b!155127 m!241091))

(assert (=> b!155053 d!51144))

(declare-fun d!51156 () Bool)

(declare-datatypes ((tuple2!13740 0))(
  ( (tuple2!13741 (_1!7284 (_ BitVec 8)) (_2!7284 BitStream!5586)) )
))
(declare-fun lt!241514 () tuple2!13740)

(declare-fun readByte!0 (BitStream!5586) tuple2!13740)

(assert (=> d!51156 (= lt!241514 (readByte!0 (BitStream!5587 (buf!3667 bs2!18) (currentByte!6701 bs1!10) (currentBit!6696 bs1!10))))))

(assert (=> d!51156 (= (readBytePure!0 (BitStream!5587 (buf!3667 bs2!18) (currentByte!6701 bs1!10) (currentBit!6696 bs1!10))) (tuple2!13735 (_2!7284 lt!241514) (_1!7284 lt!241514)))))

(declare-fun bs!12523 () Bool)

(assert (= bs!12523 d!51156))

(declare-fun m!241093 () Bool)

(assert (=> bs!12523 m!241093))

(assert (=> b!155052 d!51156))

(declare-fun d!51158 () Bool)

(declare-fun lt!241515 () tuple2!13740)

(assert (=> d!51158 (= lt!241515 (readByte!0 bs1!10))))

(assert (=> d!51158 (= (readBytePure!0 bs1!10) (tuple2!13735 (_2!7284 lt!241515) (_1!7284 lt!241515)))))

(declare-fun bs!12524 () Bool)

(assert (= bs!12524 d!51158))

(declare-fun m!241095 () Bool)

(assert (=> bs!12524 m!241095))

(assert (=> b!155052 d!51158))

(check-sat (not b!155126) (not d!51124) (not b!155124) (not d!51120) (not b!155127) (not d!51156) (not d!51138) (not d!51122) (not d!51158) (not bm!2234))
(check-sat)
(get-model)

(declare-fun d!51170 () Bool)

(assert (=> d!51170 (= (invariant!0 (currentBit!6696 bs2!18) (currentByte!6701 bs2!18) (size!3164 (buf!3667 bs2!18))) (and (bvsge (currentBit!6696 bs2!18) #b00000000000000000000000000000000) (bvslt (currentBit!6696 bs2!18) #b00000000000000000000000000001000) (bvsge (currentByte!6701 bs2!18) #b00000000000000000000000000000000) (or (bvslt (currentByte!6701 bs2!18) (size!3164 (buf!3667 bs2!18))) (and (= (currentBit!6696 bs2!18) #b00000000000000000000000000000000) (= (currentByte!6701 bs2!18) (size!3164 (buf!3667 bs2!18)))))))))

(assert (=> d!51122 d!51170))

(declare-fun d!51172 () Bool)

(assert (=> d!51172 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!241426) (tuple4!219 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv lt!241426 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv lt!241426 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!155124 d!51172))

(declare-fun d!51174 () Bool)

(assert (=> d!51174 (= (remainingBits!0 ((_ sign_extend 32) (size!3164 (buf!3667 bs2!18))) ((_ sign_extend 32) (currentByte!6701 bs2!18)) ((_ sign_extend 32) (currentBit!6696 bs2!18))) (bvsub (bvmul ((_ sign_extend 32) (size!3164 (buf!3667 bs2!18))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6701 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6696 bs2!18)))))))

(assert (=> d!51138 d!51174))

(assert (=> d!51138 d!51170))

(declare-fun d!51176 () Bool)

(assert (=> d!51176 (= (remainingBits!0 ((_ sign_extend 32) (size!3164 (buf!3667 bs1!10))) ((_ sign_extend 32) (currentByte!6701 bs1!10)) ((_ sign_extend 32) (currentBit!6696 bs1!10))) (bvsub (bvmul ((_ sign_extend 32) (size!3164 (buf!3667 bs1!10))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6701 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6696 bs1!10)))))))

(assert (=> d!51124 d!51176))

(declare-fun d!51178 () Bool)

(assert (=> d!51178 (= (invariant!0 (currentBit!6696 bs1!10) (currentByte!6701 bs1!10) (size!3164 (buf!3667 bs1!10))) (and (bvsge (currentBit!6696 bs1!10) #b00000000000000000000000000000000) (bvslt (currentBit!6696 bs1!10) #b00000000000000000000000000001000) (bvsge (currentByte!6701 bs1!10) #b00000000000000000000000000000000) (or (bvslt (currentByte!6701 bs1!10) (size!3164 (buf!3667 bs1!10))) (and (= (currentBit!6696 bs1!10) #b00000000000000000000000000000000) (= (currentByte!6701 bs1!10) (size!3164 (buf!3667 bs1!10)))))))))

(assert (=> d!51124 d!51178))

(declare-fun d!51180 () Bool)

(assert (=> d!51180 (= (byteRangesEq!0 (ite c!8253 (select (arr!3987 (buf!3667 bs1!10)) (_3!412 lt!241504)) (select (arr!3987 (buf!3667 bs1!10)) (_4!109 lt!241504))) (ite c!8253 (select (arr!3987 (buf!3667 bs2!18)) (_3!412 lt!241504)) (select (arr!3987 (buf!3667 bs2!18)) (_4!109 lt!241504))) (ite c!8253 lt!241503 #b00000000000000000000000000000000) lt!241505) (or (= (ite c!8253 lt!241503 #b00000000000000000000000000000000) lt!241505) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!8253 (select (arr!3987 (buf!3667 bs1!10)) (_3!412 lt!241504)) (select (arr!3987 (buf!3667 bs1!10)) (_4!109 lt!241504)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!241505))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!8253 lt!241503 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!8253 (select (arr!3987 (buf!3667 bs2!18)) (_3!412 lt!241504)) (select (arr!3987 (buf!3667 bs2!18)) (_4!109 lt!241504)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!241505))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!8253 lt!241503 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!12527 () Bool)

(assert (= bs!12527 d!51180))

(declare-fun m!241123 () Bool)

(assert (=> bs!12527 m!241123))

(declare-fun m!241125 () Bool)

(assert (=> bs!12527 m!241125))

(assert (=> bm!2234 d!51180))

(declare-fun d!51182 () Bool)

(declare-fun lt!241568 () (_ BitVec 8))

(declare-fun lt!241573 () (_ BitVec 8))

(assert (=> d!51182 (= lt!241568 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3987 (buf!3667 bs1!10)) (currentByte!6701 bs1!10))) ((_ sign_extend 24) lt!241573))))))

(assert (=> d!51182 (= lt!241573 ((_ extract 7 0) (currentBit!6696 bs1!10)))))

(declare-fun e!104444 () Bool)

(assert (=> d!51182 e!104444))

(declare-fun res!129792 () Bool)

(assert (=> d!51182 (=> (not res!129792) (not e!104444))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!51182 (= res!129792 (validate_offset_bits!1 ((_ sign_extend 32) (size!3164 (buf!3667 bs1!10))) ((_ sign_extend 32) (currentByte!6701 bs1!10)) ((_ sign_extend 32) (currentBit!6696 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((Unit!9751 0))(
  ( (Unit!9752) )
))
(declare-datatypes ((tuple2!13744 0))(
  ( (tuple2!13745 (_1!7286 Unit!9751) (_2!7286 (_ BitVec 8))) )
))
(declare-fun Unit!9753 () Unit!9751)

(declare-fun Unit!9754 () Unit!9751)

(assert (=> d!51182 (= (readByte!0 bs1!10) (tuple2!13741 (_2!7286 (ite (bvsgt ((_ sign_extend 24) lt!241573) #b00000000000000000000000000000000) (tuple2!13745 Unit!9753 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!241568) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3987 (buf!3667 bs1!10)) (bvadd (currentByte!6701 bs1!10) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!241573)))))))) (tuple2!13745 Unit!9754 lt!241568))) (BitStream!5587 (buf!3667 bs1!10) (bvadd (currentByte!6701 bs1!10) #b00000000000000000000000000000001) (currentBit!6696 bs1!10))))))

(declare-fun b!155164 () Bool)

(declare-fun e!104445 () Bool)

(assert (=> b!155164 (= e!104444 e!104445)))

(declare-fun res!129793 () Bool)

(assert (=> b!155164 (=> (not res!129793) (not e!104445))))

(declare-fun lt!241570 () tuple2!13740)

(assert (=> b!155164 (= res!129793 (= (buf!3667 (_2!7284 lt!241570)) (buf!3667 bs1!10)))))

(declare-fun lt!241567 () (_ BitVec 8))

(declare-fun lt!241569 () (_ BitVec 8))

(declare-fun Unit!9755 () Unit!9751)

(declare-fun Unit!9756 () Unit!9751)

(assert (=> b!155164 (= lt!241570 (tuple2!13741 (_2!7286 (ite (bvsgt ((_ sign_extend 24) lt!241569) #b00000000000000000000000000000000) (tuple2!13745 Unit!9755 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!241567) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3987 (buf!3667 bs1!10)) (bvadd (currentByte!6701 bs1!10) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!241569)))))))) (tuple2!13745 Unit!9756 lt!241567))) (BitStream!5587 (buf!3667 bs1!10) (bvadd (currentByte!6701 bs1!10) #b00000000000000000000000000000001) (currentBit!6696 bs1!10))))))

(assert (=> b!155164 (= lt!241567 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3987 (buf!3667 bs1!10)) (currentByte!6701 bs1!10))) ((_ sign_extend 24) lt!241569))))))

(assert (=> b!155164 (= lt!241569 ((_ extract 7 0) (currentBit!6696 bs1!10)))))

(declare-fun b!155165 () Bool)

(declare-fun lt!241571 () (_ BitVec 64))

(declare-fun lt!241572 () (_ BitVec 64))

(assert (=> b!155165 (= e!104445 (= (bitIndex!0 (size!3164 (buf!3667 (_2!7284 lt!241570))) (currentByte!6701 (_2!7284 lt!241570)) (currentBit!6696 (_2!7284 lt!241570))) (bvadd lt!241572 lt!241571)))))

(assert (=> b!155165 (or (not (= (bvand lt!241572 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!241571 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!241572 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!241572 lt!241571) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!155165 (= lt!241571 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!155165 (= lt!241572 (bitIndex!0 (size!3164 (buf!3667 bs1!10)) (currentByte!6701 bs1!10) (currentBit!6696 bs1!10)))))

(assert (= (and d!51182 res!129792) b!155164))

(assert (= (and b!155164 res!129793) b!155165))

(declare-fun m!241127 () Bool)

(assert (=> d!51182 m!241127))

(declare-fun m!241129 () Bool)

(assert (=> d!51182 m!241129))

(declare-fun m!241131 () Bool)

(assert (=> d!51182 m!241131))

(assert (=> b!155164 m!241131))

(assert (=> b!155164 m!241127))

(declare-fun m!241133 () Bool)

(assert (=> b!155165 m!241133))

(assert (=> b!155165 m!241017))

(assert (=> d!51158 d!51182))

(declare-fun d!51184 () Bool)

(declare-fun res!129798 () Bool)

(declare-fun e!104450 () Bool)

(assert (=> d!51184 (=> res!129798 e!104450)))

(assert (=> d!51184 (= res!129798 (= (_1!7282 lt!241504) (_2!7282 lt!241504)))))

(assert (=> d!51184 (= (arrayRangesEq!402 (buf!3667 bs1!10) (buf!3667 bs2!18) (_1!7282 lt!241504) (_2!7282 lt!241504)) e!104450)))

(declare-fun b!155170 () Bool)

(declare-fun e!104451 () Bool)

(assert (=> b!155170 (= e!104450 e!104451)))

(declare-fun res!129799 () Bool)

(assert (=> b!155170 (=> (not res!129799) (not e!104451))))

(assert (=> b!155170 (= res!129799 (= (select (arr!3987 (buf!3667 bs1!10)) (_1!7282 lt!241504)) (select (arr!3987 (buf!3667 bs2!18)) (_1!7282 lt!241504))))))

(declare-fun b!155171 () Bool)

(assert (=> b!155171 (= e!104451 (arrayRangesEq!402 (buf!3667 bs1!10) (buf!3667 bs2!18) (bvadd (_1!7282 lt!241504) #b00000000000000000000000000000001) (_2!7282 lt!241504)))))

(assert (= (and d!51184 (not res!129798)) b!155170))

(assert (= (and b!155170 res!129799) b!155171))

(declare-fun m!241135 () Bool)

(assert (=> b!155170 m!241135))

(declare-fun m!241137 () Bool)

(assert (=> b!155170 m!241137))

(declare-fun m!241139 () Bool)

(assert (=> b!155171 m!241139))

(assert (=> b!155127 d!51184))

(assert (=> d!51120 d!51178))

(declare-fun d!51186 () Bool)

(declare-fun lt!241575 () (_ BitVec 8))

(declare-fun lt!241580 () (_ BitVec 8))

(assert (=> d!51186 (= lt!241575 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3987 (buf!3667 (BitStream!5587 (buf!3667 bs2!18) (currentByte!6701 bs1!10) (currentBit!6696 bs1!10)))) (currentByte!6701 (BitStream!5587 (buf!3667 bs2!18) (currentByte!6701 bs1!10) (currentBit!6696 bs1!10))))) ((_ sign_extend 24) lt!241580))))))

(assert (=> d!51186 (= lt!241580 ((_ extract 7 0) (currentBit!6696 (BitStream!5587 (buf!3667 bs2!18) (currentByte!6701 bs1!10) (currentBit!6696 bs1!10)))))))

(declare-fun e!104452 () Bool)

(assert (=> d!51186 e!104452))

(declare-fun res!129800 () Bool)

(assert (=> d!51186 (=> (not res!129800) (not e!104452))))

(assert (=> d!51186 (= res!129800 (validate_offset_bits!1 ((_ sign_extend 32) (size!3164 (buf!3667 (BitStream!5587 (buf!3667 bs2!18) (currentByte!6701 bs1!10) (currentBit!6696 bs1!10))))) ((_ sign_extend 32) (currentByte!6701 (BitStream!5587 (buf!3667 bs2!18) (currentByte!6701 bs1!10) (currentBit!6696 bs1!10)))) ((_ sign_extend 32) (currentBit!6696 (BitStream!5587 (buf!3667 bs2!18) (currentByte!6701 bs1!10) (currentBit!6696 bs1!10)))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!9757 () Unit!9751)

(declare-fun Unit!9758 () Unit!9751)

(assert (=> d!51186 (= (readByte!0 (BitStream!5587 (buf!3667 bs2!18) (currentByte!6701 bs1!10) (currentBit!6696 bs1!10))) (tuple2!13741 (_2!7286 (ite (bvsgt ((_ sign_extend 24) lt!241580) #b00000000000000000000000000000000) (tuple2!13745 Unit!9757 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!241575) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3987 (buf!3667 (BitStream!5587 (buf!3667 bs2!18) (currentByte!6701 bs1!10) (currentBit!6696 bs1!10)))) (bvadd (currentByte!6701 (BitStream!5587 (buf!3667 bs2!18) (currentByte!6701 bs1!10) (currentBit!6696 bs1!10))) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!241580)))))))) (tuple2!13745 Unit!9758 lt!241575))) (BitStream!5587 (buf!3667 (BitStream!5587 (buf!3667 bs2!18) (currentByte!6701 bs1!10) (currentBit!6696 bs1!10))) (bvadd (currentByte!6701 (BitStream!5587 (buf!3667 bs2!18) (currentByte!6701 bs1!10) (currentBit!6696 bs1!10))) #b00000000000000000000000000000001) (currentBit!6696 (BitStream!5587 (buf!3667 bs2!18) (currentByte!6701 bs1!10) (currentBit!6696 bs1!10))))))))

(declare-fun b!155172 () Bool)

(declare-fun e!104453 () Bool)

(assert (=> b!155172 (= e!104452 e!104453)))

(declare-fun res!129801 () Bool)

(assert (=> b!155172 (=> (not res!129801) (not e!104453))))

(declare-fun lt!241577 () tuple2!13740)

(assert (=> b!155172 (= res!129801 (= (buf!3667 (_2!7284 lt!241577)) (buf!3667 (BitStream!5587 (buf!3667 bs2!18) (currentByte!6701 bs1!10) (currentBit!6696 bs1!10)))))))

(declare-fun lt!241574 () (_ BitVec 8))

(declare-fun lt!241576 () (_ BitVec 8))

(declare-fun Unit!9759 () Unit!9751)

(declare-fun Unit!9760 () Unit!9751)

(assert (=> b!155172 (= lt!241577 (tuple2!13741 (_2!7286 (ite (bvsgt ((_ sign_extend 24) lt!241576) #b00000000000000000000000000000000) (tuple2!13745 Unit!9759 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!241574) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3987 (buf!3667 (BitStream!5587 (buf!3667 bs2!18) (currentByte!6701 bs1!10) (currentBit!6696 bs1!10)))) (bvadd (currentByte!6701 (BitStream!5587 (buf!3667 bs2!18) (currentByte!6701 bs1!10) (currentBit!6696 bs1!10))) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!241576)))))))) (tuple2!13745 Unit!9760 lt!241574))) (BitStream!5587 (buf!3667 (BitStream!5587 (buf!3667 bs2!18) (currentByte!6701 bs1!10) (currentBit!6696 bs1!10))) (bvadd (currentByte!6701 (BitStream!5587 (buf!3667 bs2!18) (currentByte!6701 bs1!10) (currentBit!6696 bs1!10))) #b00000000000000000000000000000001) (currentBit!6696 (BitStream!5587 (buf!3667 bs2!18) (currentByte!6701 bs1!10) (currentBit!6696 bs1!10))))))))

(assert (=> b!155172 (= lt!241574 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3987 (buf!3667 (BitStream!5587 (buf!3667 bs2!18) (currentByte!6701 bs1!10) (currentBit!6696 bs1!10)))) (currentByte!6701 (BitStream!5587 (buf!3667 bs2!18) (currentByte!6701 bs1!10) (currentBit!6696 bs1!10))))) ((_ sign_extend 24) lt!241576))))))

(assert (=> b!155172 (= lt!241576 ((_ extract 7 0) (currentBit!6696 (BitStream!5587 (buf!3667 bs2!18) (currentByte!6701 bs1!10) (currentBit!6696 bs1!10)))))))

(declare-fun b!155173 () Bool)

(declare-fun lt!241579 () (_ BitVec 64))

(declare-fun lt!241578 () (_ BitVec 64))

(assert (=> b!155173 (= e!104453 (= (bitIndex!0 (size!3164 (buf!3667 (_2!7284 lt!241577))) (currentByte!6701 (_2!7284 lt!241577)) (currentBit!6696 (_2!7284 lt!241577))) (bvadd lt!241579 lt!241578)))))

(assert (=> b!155173 (or (not (= (bvand lt!241579 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!241578 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!241579 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!241579 lt!241578) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!155173 (= lt!241578 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!155173 (= lt!241579 (bitIndex!0 (size!3164 (buf!3667 (BitStream!5587 (buf!3667 bs2!18) (currentByte!6701 bs1!10) (currentBit!6696 bs1!10)))) (currentByte!6701 (BitStream!5587 (buf!3667 bs2!18) (currentByte!6701 bs1!10) (currentBit!6696 bs1!10))) (currentBit!6696 (BitStream!5587 (buf!3667 bs2!18) (currentByte!6701 bs1!10) (currentBit!6696 bs1!10)))))))

(assert (= (and d!51186 res!129800) b!155172))

(assert (= (and b!155172 res!129801) b!155173))

(declare-fun m!241141 () Bool)

(assert (=> d!51186 m!241141))

(declare-fun m!241143 () Bool)

(assert (=> d!51186 m!241143))

(declare-fun m!241145 () Bool)

(assert (=> d!51186 m!241145))

(assert (=> b!155172 m!241145))

(assert (=> b!155172 m!241141))

(declare-fun m!241147 () Bool)

(assert (=> b!155173 m!241147))

(declare-fun m!241149 () Bool)

(assert (=> b!155173 m!241149))

(assert (=> d!51156 d!51186))

(declare-fun d!51188 () Bool)

(assert (=> d!51188 (= (byteRangesEq!0 (select (arr!3987 (buf!3667 bs1!10)) (_3!412 lt!241504)) (select (arr!3987 (buf!3667 bs2!18)) (_3!412 lt!241504)) lt!241503 #b00000000000000000000000000001000) (or (= lt!241503 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!3987 (buf!3667 bs1!10)) (_3!412 lt!241504))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!241503)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!3987 (buf!3667 bs2!18)) (_3!412 lt!241504))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!241503)))) #b00000000000000000000000011111111))))))

(declare-fun bs!12528 () Bool)

(assert (= bs!12528 d!51188))

(declare-fun m!241151 () Bool)

(assert (=> bs!12528 m!241151))

(declare-fun m!241153 () Bool)

(assert (=> bs!12528 m!241153))

(assert (=> b!155126 d!51188))

(check-sat (not b!155173) (not d!51182) (not b!155165) (not b!155171) (not d!51186))
(check-sat)
