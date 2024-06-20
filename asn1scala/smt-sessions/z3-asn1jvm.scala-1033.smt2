; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29652 () Bool)

(assert start!29652)

(declare-fun b!152833 () Bool)

(declare-fun e!102328 () Bool)

(declare-datatypes ((array!6856 0))(
  ( (array!6857 (arr!3918 (Array (_ BitVec 32) (_ BitVec 8))) (size!3095 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5448 0))(
  ( (BitStream!5449 (buf!3598 array!6856) (currentByte!6572 (_ BitVec 32)) (currentBit!6567 (_ BitVec 32))) )
))
(declare-fun bs1!10 () BitStream!5448)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!152833 (= e!102328 (not (validate_offset_byte!0 ((_ sign_extend 32) (size!3095 (buf!3598 bs1!10))) ((_ sign_extend 32) (currentByte!6572 bs1!10)) ((_ sign_extend 32) (currentBit!6567 bs1!10)))))))

(declare-fun b!152834 () Bool)

(declare-fun e!102331 () Bool)

(assert (=> b!152834 (= e!102331 e!102328)))

(declare-fun res!128075 () Bool)

(assert (=> b!152834 (=> (not res!128075) (not e!102328))))

(declare-fun lt!239287 () (_ BitVec 64))

(assert (=> b!152834 (= res!128075 (bvsle lt!239287 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3095 (buf!3598 bs1!10))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!152834 (= lt!239287 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3095 (buf!3598 bs1!10)) (currentByte!6572 bs1!10) (currentBit!6567 bs1!10))))))

(declare-fun b!152835 () Bool)

(declare-fun res!128076 () Bool)

(assert (=> b!152835 (=> (not res!128076) (not e!102328))))

(declare-fun bs2!18 () BitStream!5448)

(declare-fun arrayBitRangesEq!0 (array!6856 array!6856 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!152835 (= res!128076 (arrayBitRangesEq!0 (buf!3598 bs1!10) (buf!3598 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!239287))))

(declare-fun b!152836 () Bool)

(declare-fun e!102329 () Bool)

(declare-fun array_inv!2884 (array!6856) Bool)

(assert (=> b!152836 (= e!102329 (array_inv!2884 (buf!3598 bs1!10)))))

(declare-fun b!152837 () Bool)

(declare-fun res!128073 () Bool)

(assert (=> b!152837 (=> (not res!128073) (not e!102328))))

(assert (=> b!152837 (= res!128073 (bvsle lt!239287 (bitIndex!0 (size!3095 (buf!3598 bs2!18)) (currentByte!6572 bs2!18) (currentBit!6567 bs2!18))))))

(declare-fun res!128074 () Bool)

(assert (=> start!29652 (=> (not res!128074) (not e!102331))))

(assert (=> start!29652 (= res!128074 (= (size!3095 (buf!3598 bs1!10)) (size!3095 (buf!3598 bs2!18))))))

(assert (=> start!29652 e!102331))

(declare-fun inv!12 (BitStream!5448) Bool)

(assert (=> start!29652 (and (inv!12 bs1!10) e!102329)))

(declare-fun e!102332 () Bool)

(assert (=> start!29652 (and (inv!12 bs2!18) e!102332)))

(declare-fun b!152832 () Bool)

(assert (=> b!152832 (= e!102332 (array_inv!2884 (buf!3598 bs2!18)))))

(assert (= (and start!29652 res!128074) b!152834))

(assert (= (and b!152834 res!128075) b!152837))

(assert (= (and b!152837 res!128073) b!152835))

(assert (= (and b!152835 res!128076) b!152833))

(assert (= start!29652 b!152836))

(assert (= start!29652 b!152832))

(declare-fun m!238661 () Bool)

(assert (=> b!152834 m!238661))

(declare-fun m!238663 () Bool)

(assert (=> start!29652 m!238663))

(declare-fun m!238665 () Bool)

(assert (=> start!29652 m!238665))

(declare-fun m!238667 () Bool)

(assert (=> b!152835 m!238667))

(declare-fun m!238669 () Bool)

(assert (=> b!152832 m!238669))

(declare-fun m!238671 () Bool)

(assert (=> b!152837 m!238671))

(declare-fun m!238673 () Bool)

(assert (=> b!152833 m!238673))

(declare-fun m!238675 () Bool)

(assert (=> b!152836 m!238675))

(check-sat (not start!29652) (not b!152832) (not b!152834) (not b!152835) (not b!152833) (not b!152836) (not b!152837))
(check-sat)
(get-model)

(declare-fun d!50260 () Bool)

(assert (=> d!50260 (= (array_inv!2884 (buf!3598 bs2!18)) (bvsge (size!3095 (buf!3598 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!152832 d!50260))

(declare-fun d!50262 () Bool)

(declare-fun e!102354 () Bool)

(assert (=> d!50262 e!102354))

(declare-fun res!128093 () Bool)

(assert (=> d!50262 (=> (not res!128093) (not e!102354))))

(declare-fun lt!239305 () (_ BitVec 64))

(declare-fun lt!239307 () (_ BitVec 64))

(declare-fun lt!239303 () (_ BitVec 64))

(assert (=> d!50262 (= res!128093 (= lt!239307 (bvsub lt!239303 lt!239305)))))

(assert (=> d!50262 (or (= (bvand lt!239303 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!239305 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!239303 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!239303 lt!239305) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!50262 (= lt!239305 (remainingBits!0 ((_ sign_extend 32) (size!3095 (buf!3598 bs2!18))) ((_ sign_extend 32) (currentByte!6572 bs2!18)) ((_ sign_extend 32) (currentBit!6567 bs2!18))))))

(declare-fun lt!239306 () (_ BitVec 64))

(declare-fun lt!239304 () (_ BitVec 64))

(assert (=> d!50262 (= lt!239303 (bvmul lt!239306 lt!239304))))

(assert (=> d!50262 (or (= lt!239306 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!239304 (bvsdiv (bvmul lt!239306 lt!239304) lt!239306)))))

(assert (=> d!50262 (= lt!239304 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50262 (= lt!239306 ((_ sign_extend 32) (size!3095 (buf!3598 bs2!18))))))

(assert (=> d!50262 (= lt!239307 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6572 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6567 bs2!18))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!50262 (invariant!0 (currentBit!6567 bs2!18) (currentByte!6572 bs2!18) (size!3095 (buf!3598 bs2!18)))))

(assert (=> d!50262 (= (bitIndex!0 (size!3095 (buf!3598 bs2!18)) (currentByte!6572 bs2!18) (currentBit!6567 bs2!18)) lt!239307)))

(declare-fun b!152860 () Bool)

(declare-fun res!128094 () Bool)

(assert (=> b!152860 (=> (not res!128094) (not e!102354))))

(assert (=> b!152860 (= res!128094 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!239307))))

(declare-fun b!152861 () Bool)

(declare-fun lt!239308 () (_ BitVec 64))

(assert (=> b!152861 (= e!102354 (bvsle lt!239307 (bvmul lt!239308 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!152861 (or (= lt!239308 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!239308 #b0000000000000000000000000000000000000000000000000000000000001000) lt!239308)))))

(assert (=> b!152861 (= lt!239308 ((_ sign_extend 32) (size!3095 (buf!3598 bs2!18))))))

(assert (= (and d!50262 res!128093) b!152860))

(assert (= (and b!152860 res!128094) b!152861))

(declare-fun m!238693 () Bool)

(assert (=> d!50262 m!238693))

(declare-fun m!238695 () Bool)

(assert (=> d!50262 m!238695))

(assert (=> b!152837 d!50262))

(declare-fun d!50268 () Bool)

(assert (=> d!50268 (= (array_inv!2884 (buf!3598 bs1!10)) (bvsge (size!3095 (buf!3598 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!152836 d!50268))

(declare-fun d!50270 () Bool)

(declare-fun res!128130 () Bool)

(declare-fun e!102389 () Bool)

(assert (=> d!50270 (=> res!128130 e!102389)))

(assert (=> d!50270 (= res!128130 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!239287))))

(assert (=> d!50270 (= (arrayBitRangesEq!0 (buf!3598 bs1!10) (buf!3598 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!239287) e!102389)))

(declare-fun b!152903 () Bool)

(declare-fun res!128126 () Bool)

(declare-fun lt!239343 () (_ BitVec 32))

(assert (=> b!152903 (= res!128126 (= lt!239343 #b00000000000000000000000000000000))))

(declare-fun e!102388 () Bool)

(assert (=> b!152903 (=> res!128126 e!102388)))

(declare-fun e!102390 () Bool)

(assert (=> b!152903 (= e!102390 e!102388)))

(declare-fun b!152904 () Bool)

(declare-fun e!102393 () Bool)

(declare-fun e!102392 () Bool)

(assert (=> b!152904 (= e!102393 e!102392)))

(declare-fun c!8163 () Bool)

(declare-datatypes ((tuple4!156 0))(
  ( (tuple4!157 (_1!7166 (_ BitVec 32)) (_2!7166 (_ BitVec 32)) (_3!381 (_ BitVec 32)) (_4!78 (_ BitVec 32))) )
))
(declare-fun lt!239342 () tuple4!156)

(assert (=> b!152904 (= c!8163 (= (_3!381 lt!239342) (_4!78 lt!239342)))))

(declare-fun b!152905 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!152905 (= e!102388 (byteRangesEq!0 (select (arr!3918 (buf!3598 bs1!10)) (_4!78 lt!239342)) (select (arr!3918 (buf!3598 bs2!18)) (_4!78 lt!239342)) #b00000000000000000000000000000000 lt!239343))))

(declare-fun b!152906 () Bool)

(declare-fun call!2147 () Bool)

(assert (=> b!152906 (= e!102392 call!2147)))

(declare-fun b!152907 () Bool)

(assert (=> b!152907 (= e!102392 e!102390)))

(declare-fun res!128127 () Bool)

(assert (=> b!152907 (= res!128127 call!2147)))

(assert (=> b!152907 (=> (not res!128127) (not e!102390))))

(declare-fun bm!2144 () Bool)

(declare-fun lt!239344 () (_ BitVec 32))

(assert (=> bm!2144 (= call!2147 (byteRangesEq!0 (select (arr!3918 (buf!3598 bs1!10)) (_3!381 lt!239342)) (select (arr!3918 (buf!3598 bs2!18)) (_3!381 lt!239342)) lt!239344 (ite c!8163 lt!239343 #b00000000000000000000000000001000)))))

(declare-fun b!152908 () Bool)

(assert (=> b!152908 (= e!102389 e!102393)))

(declare-fun res!128128 () Bool)

(assert (=> b!152908 (=> (not res!128128) (not e!102393))))

(declare-fun e!102391 () Bool)

(assert (=> b!152908 (= res!128128 e!102391)))

(declare-fun res!128129 () Bool)

(assert (=> b!152908 (=> res!128129 e!102391)))

(assert (=> b!152908 (= res!128129 (bvsge (_1!7166 lt!239342) (_2!7166 lt!239342)))))

(assert (=> b!152908 (= lt!239343 ((_ extract 31 0) (bvsrem lt!239287 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!152908 (= lt!239344 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!156)

(assert (=> b!152908 (= lt!239342 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!239287))))

(declare-fun b!152909 () Bool)

(declare-fun arrayRangesEq!372 (array!6856 array!6856 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!152909 (= e!102391 (arrayRangesEq!372 (buf!3598 bs1!10) (buf!3598 bs2!18) (_1!7166 lt!239342) (_2!7166 lt!239342)))))

(assert (= (and d!50270 (not res!128130)) b!152908))

(assert (= (and b!152908 (not res!128129)) b!152909))

(assert (= (and b!152908 res!128128) b!152904))

(assert (= (and b!152904 c!8163) b!152906))

(assert (= (and b!152904 (not c!8163)) b!152907))

(assert (= (and b!152907 res!128127) b!152903))

(assert (= (and b!152903 (not res!128126)) b!152905))

(assert (= (or b!152906 b!152907) bm!2144))

(declare-fun m!238719 () Bool)

(assert (=> b!152905 m!238719))

(declare-fun m!238721 () Bool)

(assert (=> b!152905 m!238721))

(assert (=> b!152905 m!238719))

(assert (=> b!152905 m!238721))

(declare-fun m!238723 () Bool)

(assert (=> b!152905 m!238723))

(declare-fun m!238725 () Bool)

(assert (=> bm!2144 m!238725))

(declare-fun m!238727 () Bool)

(assert (=> bm!2144 m!238727))

(assert (=> bm!2144 m!238725))

(assert (=> bm!2144 m!238727))

(declare-fun m!238729 () Bool)

(assert (=> bm!2144 m!238729))

(declare-fun m!238731 () Bool)

(assert (=> b!152908 m!238731))

(declare-fun m!238733 () Bool)

(assert (=> b!152909 m!238733))

(assert (=> b!152835 d!50270))

(declare-fun d!50282 () Bool)

(declare-fun e!102394 () Bool)

(assert (=> d!50282 e!102394))

(declare-fun res!128131 () Bool)

(assert (=> d!50282 (=> (not res!128131) (not e!102394))))

(declare-fun lt!239349 () (_ BitVec 64))

(declare-fun lt!239345 () (_ BitVec 64))

(declare-fun lt!239347 () (_ BitVec 64))

(assert (=> d!50282 (= res!128131 (= lt!239349 (bvsub lt!239345 lt!239347)))))

(assert (=> d!50282 (or (= (bvand lt!239345 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!239347 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!239345 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!239345 lt!239347) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50282 (= lt!239347 (remainingBits!0 ((_ sign_extend 32) (size!3095 (buf!3598 bs1!10))) ((_ sign_extend 32) (currentByte!6572 bs1!10)) ((_ sign_extend 32) (currentBit!6567 bs1!10))))))

(declare-fun lt!239348 () (_ BitVec 64))

(declare-fun lt!239346 () (_ BitVec 64))

(assert (=> d!50282 (= lt!239345 (bvmul lt!239348 lt!239346))))

(assert (=> d!50282 (or (= lt!239348 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!239346 (bvsdiv (bvmul lt!239348 lt!239346) lt!239348)))))

(assert (=> d!50282 (= lt!239346 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50282 (= lt!239348 ((_ sign_extend 32) (size!3095 (buf!3598 bs1!10))))))

(assert (=> d!50282 (= lt!239349 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6572 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6567 bs1!10))))))

(assert (=> d!50282 (invariant!0 (currentBit!6567 bs1!10) (currentByte!6572 bs1!10) (size!3095 (buf!3598 bs1!10)))))

(assert (=> d!50282 (= (bitIndex!0 (size!3095 (buf!3598 bs1!10)) (currentByte!6572 bs1!10) (currentBit!6567 bs1!10)) lt!239349)))

(declare-fun b!152910 () Bool)

(declare-fun res!128132 () Bool)

(assert (=> b!152910 (=> (not res!128132) (not e!102394))))

(assert (=> b!152910 (= res!128132 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!239349))))

(declare-fun b!152911 () Bool)

(declare-fun lt!239350 () (_ BitVec 64))

(assert (=> b!152911 (= e!102394 (bvsle lt!239349 (bvmul lt!239350 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!152911 (or (= lt!239350 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!239350 #b0000000000000000000000000000000000000000000000000000000000001000) lt!239350)))))

(assert (=> b!152911 (= lt!239350 ((_ sign_extend 32) (size!3095 (buf!3598 bs1!10))))))

(assert (= (and d!50282 res!128131) b!152910))

(assert (= (and b!152910 res!128132) b!152911))

(declare-fun m!238735 () Bool)

(assert (=> d!50282 m!238735))

(declare-fun m!238737 () Bool)

(assert (=> d!50282 m!238737))

(assert (=> b!152834 d!50282))

(declare-fun d!50284 () Bool)

(assert (=> d!50284 (= (inv!12 bs1!10) (invariant!0 (currentBit!6567 bs1!10) (currentByte!6572 bs1!10) (size!3095 (buf!3598 bs1!10))))))

(declare-fun bs!12291 () Bool)

(assert (= bs!12291 d!50284))

(assert (=> bs!12291 m!238737))

(assert (=> start!29652 d!50284))

(declare-fun d!50286 () Bool)

(assert (=> d!50286 (= (inv!12 bs2!18) (invariant!0 (currentBit!6567 bs2!18) (currentByte!6572 bs2!18) (size!3095 (buf!3598 bs2!18))))))

(declare-fun bs!12292 () Bool)

(assert (= bs!12292 d!50286))

(assert (=> bs!12292 m!238695))

(assert (=> start!29652 d!50286))

(declare-fun d!50288 () Bool)

(assert (=> d!50288 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3095 (buf!3598 bs1!10))) ((_ sign_extend 32) (currentByte!6572 bs1!10)) ((_ sign_extend 32) (currentBit!6567 bs1!10))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3095 (buf!3598 bs1!10))) ((_ sign_extend 32) (currentByte!6572 bs1!10)) ((_ sign_extend 32) (currentBit!6567 bs1!10))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!12293 () Bool)

(assert (= bs!12293 d!50288))

(assert (=> bs!12293 m!238735))

(assert (=> b!152833 d!50288))

(check-sat (not b!152909) (not d!50282) (not d!50286) (not d!50262) (not d!50284) (not b!152908) (not b!152905) (not d!50288) (not bm!2144))
(check-sat)
