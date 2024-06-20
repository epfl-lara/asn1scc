; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29688 () Bool)

(assert start!29688)

(declare-fun b!152973 () Bool)

(declare-fun e!102450 () Bool)

(declare-datatypes ((array!6865 0))(
  ( (array!6866 (arr!3921 (Array (_ BitVec 32) (_ BitVec 8))) (size!3098 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5454 0))(
  ( (BitStream!5455 (buf!3601 array!6865) (currentByte!6581 (_ BitVec 32)) (currentBit!6576 (_ BitVec 32))) )
))
(declare-fun bs1!10 () BitStream!5454)

(declare-fun array_inv!2887 (array!6865) Bool)

(assert (=> b!152973 (= e!102450 (array_inv!2887 (buf!3601 bs1!10)))))

(declare-fun b!152974 () Bool)

(declare-fun res!128178 () Bool)

(declare-fun e!102452 () Bool)

(assert (=> b!152974 (=> (not res!128178) (not e!102452))))

(declare-fun bs2!18 () BitStream!5454)

(declare-fun lt!239400 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!6865 array!6865 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!152974 (= res!128178 (arrayBitRangesEq!0 (buf!3601 bs1!10) (buf!3601 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!239400))))

(declare-fun b!152975 () Bool)

(declare-fun e!102453 () Bool)

(assert (=> b!152975 (= e!102453 (array_inv!2887 (buf!3601 bs2!18)))))

(declare-fun res!128180 () Bool)

(declare-fun e!102449 () Bool)

(assert (=> start!29688 (=> (not res!128180) (not e!102449))))

(assert (=> start!29688 (= res!128180 (= (size!3098 (buf!3601 bs1!10)) (size!3098 (buf!3601 bs2!18))))))

(assert (=> start!29688 e!102449))

(declare-fun inv!12 (BitStream!5454) Bool)

(assert (=> start!29688 (and (inv!12 bs1!10) e!102450)))

(assert (=> start!29688 (and (inv!12 bs2!18) e!102453)))

(declare-fun b!152976 () Bool)

(declare-fun res!128179 () Bool)

(assert (=> b!152976 (=> (not res!128179) (not e!102452))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!152976 (= res!128179 (bvsle lt!239400 (bitIndex!0 (size!3098 (buf!3601 bs2!18)) (currentByte!6581 bs2!18) (currentBit!6576 bs2!18))))))

(declare-fun b!152977 () Bool)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!152977 (= e!102452 (not (validate_offset_byte!0 ((_ sign_extend 32) (size!3098 (buf!3601 bs2!18))) ((_ sign_extend 32) (currentByte!6581 bs1!10)) ((_ sign_extend 32) (currentBit!6576 bs1!10)))))))

(declare-datatypes ((tuple2!13572 0))(
  ( (tuple2!13573 (_1!7170 BitStream!5454) (_2!7170 (_ BitVec 8))) )
))
(declare-fun lt!239401 () tuple2!13572)

(declare-fun readBytePure!0 (BitStream!5454) tuple2!13572)

(assert (=> b!152977 (= lt!239401 (readBytePure!0 bs1!10))))

(declare-fun b!152978 () Bool)

(assert (=> b!152978 (= e!102449 e!102452)))

(declare-fun res!128181 () Bool)

(assert (=> b!152978 (=> (not res!128181) (not e!102452))))

(assert (=> b!152978 (= res!128181 (bvsle lt!239400 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3098 (buf!3601 bs1!10))))))))

(assert (=> b!152978 (= lt!239400 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3098 (buf!3601 bs1!10)) (currentByte!6581 bs1!10) (currentBit!6576 bs1!10))))))

(assert (= (and start!29688 res!128180) b!152978))

(assert (= (and b!152978 res!128181) b!152976))

(assert (= (and b!152976 res!128179) b!152974))

(assert (= (and b!152974 res!128178) b!152977))

(assert (= start!29688 b!152973))

(assert (= start!29688 b!152975))

(declare-fun m!238783 () Bool)

(assert (=> b!152975 m!238783))

(declare-fun m!238785 () Bool)

(assert (=> b!152978 m!238785))

(declare-fun m!238787 () Bool)

(assert (=> b!152976 m!238787))

(declare-fun m!238789 () Bool)

(assert (=> b!152977 m!238789))

(declare-fun m!238791 () Bool)

(assert (=> b!152977 m!238791))

(declare-fun m!238793 () Bool)

(assert (=> b!152974 m!238793))

(declare-fun m!238795 () Bool)

(assert (=> b!152973 m!238795))

(declare-fun m!238797 () Bool)

(assert (=> start!29688 m!238797))

(declare-fun m!238799 () Bool)

(assert (=> start!29688 m!238799))

(check-sat (not b!152976) (not b!152977) (not start!29688) (not b!152978) (not b!152975) (not b!152973) (not b!152974))
(check-sat)
(get-model)

(declare-fun d!50310 () Bool)

(assert (=> d!50310 (= (array_inv!2887 (buf!3601 bs2!18)) (bvsge (size!3098 (buf!3601 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!152975 d!50310))

(declare-datatypes ((tuple4!162 0))(
  ( (tuple4!163 (_1!7172 (_ BitVec 32)) (_2!7172 (_ BitVec 32)) (_3!384 (_ BitVec 32)) (_4!81 (_ BitVec 32))) )
))
(declare-fun lt!239415 () tuple4!162)

(declare-fun c!8169 () Bool)

(declare-fun bm!2150 () Bool)

(declare-fun lt!239416 () (_ BitVec 32))

(declare-fun call!2153 () Bool)

(declare-fun lt!239414 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!2150 (= call!2153 (byteRangesEq!0 (ite c!8169 (select (arr!3921 (buf!3601 bs1!10)) (_3!384 lt!239415)) (select (arr!3921 (buf!3601 bs1!10)) (_4!81 lt!239415))) (ite c!8169 (select (arr!3921 (buf!3601 bs2!18)) (_3!384 lt!239415)) (select (arr!3921 (buf!3601 bs2!18)) (_4!81 lt!239415))) (ite c!8169 lt!239416 #b00000000000000000000000000000000) lt!239414))))

(declare-fun b!153011 () Bool)

(declare-fun e!102486 () Bool)

(assert (=> b!153011 (= e!102486 call!2153)))

(declare-fun b!153012 () Bool)

(declare-fun e!102484 () Bool)

(declare-fun e!102488 () Bool)

(assert (=> b!153012 (= e!102484 e!102488)))

(declare-fun res!128204 () Bool)

(assert (=> b!153012 (= res!128204 (byteRangesEq!0 (select (arr!3921 (buf!3601 bs1!10)) (_3!384 lt!239415)) (select (arr!3921 (buf!3601 bs2!18)) (_3!384 lt!239415)) lt!239416 #b00000000000000000000000000001000))))

(assert (=> b!153012 (=> (not res!128204) (not e!102488))))

(declare-fun e!102489 () Bool)

(declare-fun b!153013 () Bool)

(declare-fun arrayRangesEq!374 (array!6865 array!6865 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!153013 (= e!102489 (arrayRangesEq!374 (buf!3601 bs1!10) (buf!3601 bs2!18) (_1!7172 lt!239415) (_2!7172 lt!239415)))))

(declare-fun d!50312 () Bool)

(declare-fun res!128207 () Bool)

(declare-fun e!102487 () Bool)

(assert (=> d!50312 (=> res!128207 e!102487)))

(assert (=> d!50312 (= res!128207 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!239400))))

(assert (=> d!50312 (= (arrayBitRangesEq!0 (buf!3601 bs1!10) (buf!3601 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!239400) e!102487)))

(declare-fun b!153014 () Bool)

(assert (=> b!153014 (= e!102484 call!2153)))

(declare-fun b!153015 () Bool)

(declare-fun e!102485 () Bool)

(assert (=> b!153015 (= e!102485 e!102484)))

(assert (=> b!153015 (= c!8169 (= (_3!384 lt!239415) (_4!81 lt!239415)))))

(declare-fun b!153016 () Bool)

(declare-fun res!128208 () Bool)

(assert (=> b!153016 (= res!128208 (= lt!239414 #b00000000000000000000000000000000))))

(assert (=> b!153016 (=> res!128208 e!102486)))

(assert (=> b!153016 (= e!102488 e!102486)))

(declare-fun b!153017 () Bool)

(assert (=> b!153017 (= e!102487 e!102485)))

(declare-fun res!128205 () Bool)

(assert (=> b!153017 (=> (not res!128205) (not e!102485))))

(assert (=> b!153017 (= res!128205 e!102489)))

(declare-fun res!128206 () Bool)

(assert (=> b!153017 (=> res!128206 e!102489)))

(assert (=> b!153017 (= res!128206 (bvsge (_1!7172 lt!239415) (_2!7172 lt!239415)))))

(assert (=> b!153017 (= lt!239414 ((_ extract 31 0) (bvsrem lt!239400 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!153017 (= lt!239416 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!162)

(assert (=> b!153017 (= lt!239415 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!239400))))

(assert (= (and d!50312 (not res!128207)) b!153017))

(assert (= (and b!153017 (not res!128206)) b!153013))

(assert (= (and b!153017 res!128205) b!153015))

(assert (= (and b!153015 c!8169) b!153014))

(assert (= (and b!153015 (not c!8169)) b!153012))

(assert (= (and b!153012 res!128204) b!153016))

(assert (= (and b!153016 (not res!128208)) b!153011))

(assert (= (or b!153014 b!153011) bm!2150))

(declare-fun m!238823 () Bool)

(assert (=> bm!2150 m!238823))

(declare-fun m!238825 () Bool)

(assert (=> bm!2150 m!238825))

(declare-fun m!238827 () Bool)

(assert (=> bm!2150 m!238827))

(declare-fun m!238829 () Bool)

(assert (=> bm!2150 m!238829))

(declare-fun m!238831 () Bool)

(assert (=> bm!2150 m!238831))

(assert (=> b!153012 m!238823))

(assert (=> b!153012 m!238831))

(assert (=> b!153012 m!238823))

(assert (=> b!153012 m!238831))

(declare-fun m!238833 () Bool)

(assert (=> b!153012 m!238833))

(declare-fun m!238835 () Bool)

(assert (=> b!153013 m!238835))

(declare-fun m!238837 () Bool)

(assert (=> b!153017 m!238837))

(assert (=> b!152974 d!50312))

(declare-fun d!50326 () Bool)

(assert (=> d!50326 (= (array_inv!2887 (buf!3601 bs1!10)) (bvsge (size!3098 (buf!3601 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!152973 d!50326))

(declare-fun d!50328 () Bool)

(declare-fun e!102499 () Bool)

(assert (=> d!50328 e!102499))

(declare-fun res!128227 () Bool)

(assert (=> d!50328 (=> (not res!128227) (not e!102499))))

(declare-fun lt!239477 () (_ BitVec 64))

(declare-fun lt!239478 () (_ BitVec 64))

(declare-fun lt!239476 () (_ BitVec 64))

(assert (=> d!50328 (= res!128227 (= lt!239478 (bvsub lt!239477 lt!239476)))))

(assert (=> d!50328 (or (= (bvand lt!239477 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!239476 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!239477 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!239477 lt!239476) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!50328 (= lt!239476 (remainingBits!0 ((_ sign_extend 32) (size!3098 (buf!3601 bs1!10))) ((_ sign_extend 32) (currentByte!6581 bs1!10)) ((_ sign_extend 32) (currentBit!6576 bs1!10))))))

(declare-fun lt!239474 () (_ BitVec 64))

(declare-fun lt!239475 () (_ BitVec 64))

(assert (=> d!50328 (= lt!239477 (bvmul lt!239474 lt!239475))))

(assert (=> d!50328 (or (= lt!239474 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!239475 (bvsdiv (bvmul lt!239474 lt!239475) lt!239474)))))

(assert (=> d!50328 (= lt!239475 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50328 (= lt!239474 ((_ sign_extend 32) (size!3098 (buf!3601 bs1!10))))))

(assert (=> d!50328 (= lt!239478 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6581 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6576 bs1!10))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!50328 (invariant!0 (currentBit!6576 bs1!10) (currentByte!6581 bs1!10) (size!3098 (buf!3601 bs1!10)))))

(assert (=> d!50328 (= (bitIndex!0 (size!3098 (buf!3601 bs1!10)) (currentByte!6581 bs1!10) (currentBit!6576 bs1!10)) lt!239478)))

(declare-fun b!153036 () Bool)

(declare-fun res!128228 () Bool)

(assert (=> b!153036 (=> (not res!128228) (not e!102499))))

(assert (=> b!153036 (= res!128228 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!239478))))

(declare-fun b!153037 () Bool)

(declare-fun lt!239479 () (_ BitVec 64))

(assert (=> b!153037 (= e!102499 (bvsle lt!239478 (bvmul lt!239479 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!153037 (or (= lt!239479 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!239479 #b0000000000000000000000000000000000000000000000000000000000001000) lt!239479)))))

(assert (=> b!153037 (= lt!239479 ((_ sign_extend 32) (size!3098 (buf!3601 bs1!10))))))

(assert (= (and d!50328 res!128227) b!153036))

(assert (= (and b!153036 res!128228) b!153037))

(declare-fun m!238853 () Bool)

(assert (=> d!50328 m!238853))

(declare-fun m!238855 () Bool)

(assert (=> d!50328 m!238855))

(assert (=> b!152978 d!50328))

(declare-fun d!50346 () Bool)

(assert (=> d!50346 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3098 (buf!3601 bs2!18))) ((_ sign_extend 32) (currentByte!6581 bs1!10)) ((_ sign_extend 32) (currentBit!6576 bs1!10))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3098 (buf!3601 bs2!18))) ((_ sign_extend 32) (currentByte!6581 bs1!10)) ((_ sign_extend 32) (currentBit!6576 bs1!10))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!12308 () Bool)

(assert (= bs!12308 d!50346))

(declare-fun m!238857 () Bool)

(assert (=> bs!12308 m!238857))

(assert (=> b!152977 d!50346))

(declare-fun d!50348 () Bool)

(declare-datatypes ((tuple2!13576 0))(
  ( (tuple2!13577 (_1!7173 (_ BitVec 8)) (_2!7173 BitStream!5454)) )
))
(declare-fun lt!239482 () tuple2!13576)

(declare-fun readByte!0 (BitStream!5454) tuple2!13576)

(assert (=> d!50348 (= lt!239482 (readByte!0 bs1!10))))

(assert (=> d!50348 (= (readBytePure!0 bs1!10) (tuple2!13573 (_2!7173 lt!239482) (_1!7173 lt!239482)))))

(declare-fun bs!12309 () Bool)

(assert (= bs!12309 d!50348))

(declare-fun m!238859 () Bool)

(assert (=> bs!12309 m!238859))

(assert (=> b!152977 d!50348))

(declare-fun d!50350 () Bool)

(assert (=> d!50350 (= (inv!12 bs1!10) (invariant!0 (currentBit!6576 bs1!10) (currentByte!6581 bs1!10) (size!3098 (buf!3601 bs1!10))))))

(declare-fun bs!12310 () Bool)

(assert (= bs!12310 d!50350))

(assert (=> bs!12310 m!238855))

(assert (=> start!29688 d!50350))

(declare-fun d!50352 () Bool)

(assert (=> d!50352 (= (inv!12 bs2!18) (invariant!0 (currentBit!6576 bs2!18) (currentByte!6581 bs2!18) (size!3098 (buf!3601 bs2!18))))))

(declare-fun bs!12311 () Bool)

(assert (= bs!12311 d!50352))

(declare-fun m!238861 () Bool)

(assert (=> bs!12311 m!238861))

(assert (=> start!29688 d!50352))

(declare-fun d!50354 () Bool)

(declare-fun e!102500 () Bool)

(assert (=> d!50354 e!102500))

(declare-fun res!128229 () Bool)

(assert (=> d!50354 (=> (not res!128229) (not e!102500))))

(declare-fun lt!239487 () (_ BitVec 64))

(declare-fun lt!239486 () (_ BitVec 64))

(declare-fun lt!239485 () (_ BitVec 64))

(assert (=> d!50354 (= res!128229 (= lt!239487 (bvsub lt!239486 lt!239485)))))

(assert (=> d!50354 (or (= (bvand lt!239486 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!239485 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!239486 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!239486 lt!239485) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50354 (= lt!239485 (remainingBits!0 ((_ sign_extend 32) (size!3098 (buf!3601 bs2!18))) ((_ sign_extend 32) (currentByte!6581 bs2!18)) ((_ sign_extend 32) (currentBit!6576 bs2!18))))))

(declare-fun lt!239483 () (_ BitVec 64))

(declare-fun lt!239484 () (_ BitVec 64))

(assert (=> d!50354 (= lt!239486 (bvmul lt!239483 lt!239484))))

(assert (=> d!50354 (or (= lt!239483 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!239484 (bvsdiv (bvmul lt!239483 lt!239484) lt!239483)))))

(assert (=> d!50354 (= lt!239484 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50354 (= lt!239483 ((_ sign_extend 32) (size!3098 (buf!3601 bs2!18))))))

(assert (=> d!50354 (= lt!239487 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6581 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6576 bs2!18))))))

(assert (=> d!50354 (invariant!0 (currentBit!6576 bs2!18) (currentByte!6581 bs2!18) (size!3098 (buf!3601 bs2!18)))))

(assert (=> d!50354 (= (bitIndex!0 (size!3098 (buf!3601 bs2!18)) (currentByte!6581 bs2!18) (currentBit!6576 bs2!18)) lt!239487)))

(declare-fun b!153038 () Bool)

(declare-fun res!128230 () Bool)

(assert (=> b!153038 (=> (not res!128230) (not e!102500))))

(assert (=> b!153038 (= res!128230 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!239487))))

(declare-fun b!153039 () Bool)

(declare-fun lt!239488 () (_ BitVec 64))

(assert (=> b!153039 (= e!102500 (bvsle lt!239487 (bvmul lt!239488 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!153039 (or (= lt!239488 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!239488 #b0000000000000000000000000000000000000000000000000000000000001000) lt!239488)))))

(assert (=> b!153039 (= lt!239488 ((_ sign_extend 32) (size!3098 (buf!3601 bs2!18))))))

(assert (= (and d!50354 res!128229) b!153038))

(assert (= (and b!153038 res!128230) b!153039))

(declare-fun m!238863 () Bool)

(assert (=> d!50354 m!238863))

(assert (=> d!50354 m!238861))

(assert (=> b!152976 d!50354))

(check-sat (not d!50350) (not d!50348) (not d!50346) (not bm!2150) (not d!50328) (not b!153017) (not b!153013) (not d!50352) (not d!50354) (not b!153012))
(check-sat)
