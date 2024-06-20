; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29650 () Bool)

(assert start!29650)

(declare-fun b!152814 () Bool)

(declare-fun res!128064 () Bool)

(declare-fun e!102313 () Bool)

(assert (=> b!152814 (=> (not res!128064) (not e!102313))))

(declare-fun lt!239284 () (_ BitVec 64))

(declare-datatypes ((array!6854 0))(
  ( (array!6855 (arr!3917 (Array (_ BitVec 32) (_ BitVec 8))) (size!3094 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5446 0))(
  ( (BitStream!5447 (buf!3597 array!6854) (currentByte!6571 (_ BitVec 32)) (currentBit!6566 (_ BitVec 32))) )
))
(declare-fun bs2!18 () BitStream!5446)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!152814 (= res!128064 (bvsle lt!239284 (bitIndex!0 (size!3094 (buf!3597 bs2!18)) (currentByte!6571 bs2!18) (currentBit!6566 bs2!18))))))

(declare-fun b!152815 () Bool)

(declare-fun e!102314 () Bool)

(declare-fun array_inv!2883 (array!6854) Bool)

(assert (=> b!152815 (= e!102314 (array_inv!2883 (buf!3597 bs2!18)))))

(declare-fun res!128061 () Bool)

(declare-fun e!102315 () Bool)

(assert (=> start!29650 (=> (not res!128061) (not e!102315))))

(declare-fun bs1!10 () BitStream!5446)

(assert (=> start!29650 (= res!128061 (= (size!3094 (buf!3597 bs1!10)) (size!3094 (buf!3597 bs2!18))))))

(assert (=> start!29650 e!102315))

(declare-fun e!102312 () Bool)

(declare-fun inv!12 (BitStream!5446) Bool)

(assert (=> start!29650 (and (inv!12 bs1!10) e!102312)))

(assert (=> start!29650 (and (inv!12 bs2!18) e!102314)))

(declare-fun b!152816 () Bool)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!152816 (= e!102313 (not (validate_offset_byte!0 ((_ sign_extend 32) (size!3094 (buf!3597 bs1!10))) ((_ sign_extend 32) (currentByte!6571 bs1!10)) ((_ sign_extend 32) (currentBit!6566 bs1!10)))))))

(declare-fun b!152817 () Bool)

(assert (=> b!152817 (= e!102315 e!102313)))

(declare-fun res!128063 () Bool)

(assert (=> b!152817 (=> (not res!128063) (not e!102313))))

(assert (=> b!152817 (= res!128063 (bvsle lt!239284 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3094 (buf!3597 bs1!10))))))))

(assert (=> b!152817 (= lt!239284 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3094 (buf!3597 bs1!10)) (currentByte!6571 bs1!10) (currentBit!6566 bs1!10))))))

(declare-fun b!152818 () Bool)

(declare-fun res!128062 () Bool)

(assert (=> b!152818 (=> (not res!128062) (not e!102313))))

(declare-fun arrayBitRangesEq!0 (array!6854 array!6854 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!152818 (= res!128062 (arrayBitRangesEq!0 (buf!3597 bs1!10) (buf!3597 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!239284))))

(declare-fun b!152819 () Bool)

(assert (=> b!152819 (= e!102312 (array_inv!2883 (buf!3597 bs1!10)))))

(assert (= (and start!29650 res!128061) b!152817))

(assert (= (and b!152817 res!128063) b!152814))

(assert (= (and b!152814 res!128064) b!152818))

(assert (= (and b!152818 res!128062) b!152816))

(assert (= start!29650 b!152819))

(assert (= start!29650 b!152815))

(declare-fun m!238645 () Bool)

(assert (=> start!29650 m!238645))

(declare-fun m!238647 () Bool)

(assert (=> start!29650 m!238647))

(declare-fun m!238649 () Bool)

(assert (=> b!152818 m!238649))

(declare-fun m!238651 () Bool)

(assert (=> b!152819 m!238651))

(declare-fun m!238653 () Bool)

(assert (=> b!152816 m!238653))

(declare-fun m!238655 () Bool)

(assert (=> b!152817 m!238655))

(declare-fun m!238657 () Bool)

(assert (=> b!152814 m!238657))

(declare-fun m!238659 () Bool)

(assert (=> b!152815 m!238659))

(push 1)

(assert (not b!152817))

(assert (not b!152816))

(assert (not b!152819))

(assert (not b!152815))

(assert (not start!29650))

(assert (not b!152814))

(assert (not b!152818))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!50264 () Bool)

(assert (=> d!50264 (= (array_inv!2883 (buf!3597 bs1!10)) (bvsge (size!3094 (buf!3597 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!152819 d!50264))

(declare-fun e!102378 () Bool)

(declare-datatypes ((tuple4!158 0))(
  ( (tuple4!159 (_1!7167 (_ BitVec 32)) (_2!7167 (_ BitVec 32)) (_3!382 (_ BitVec 32)) (_4!79 (_ BitVec 32))) )
))
(declare-fun lt!239333 () tuple4!158)

(declare-fun b!152890 () Bool)

(declare-fun arrayRangesEq!371 (array!6854 array!6854 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!152890 (= e!102378 (arrayRangesEq!371 (buf!3597 bs1!10) (buf!3597 bs2!18) (_1!7167 lt!239333) (_2!7167 lt!239333)))))

(declare-fun b!152891 () Bool)

(declare-fun e!102377 () Bool)

(declare-fun e!102380 () Bool)

(assert (=> b!152891 (= e!102377 e!102380)))

(declare-fun c!8162 () Bool)

(assert (=> b!152891 (= c!8162 (= (_3!382 lt!239333) (_4!79 lt!239333)))))

(declare-fun d!50266 () Bool)

(declare-fun res!128116 () Bool)

(declare-fun e!102381 () Bool)

(assert (=> d!50266 (=> res!128116 e!102381)))

(assert (=> d!50266 (= res!128116 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!239284))))

(assert (=> d!50266 (= (arrayBitRangesEq!0 (buf!3597 bs1!10) (buf!3597 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!239284) e!102381)))

(declare-fun lt!239335 () (_ BitVec 32))

(declare-fun call!2144 () Bool)

(declare-fun bm!2141 () Bool)

(declare-fun lt!239334 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!2141 (= call!2144 (byteRangesEq!0 (ite c!8162 (select (arr!3917 (buf!3597 bs1!10)) (_3!382 lt!239333)) (select (arr!3917 (buf!3597 bs1!10)) (_4!79 lt!239333))) (ite c!8162 (select (arr!3917 (buf!3597 bs2!18)) (_3!382 lt!239333)) (select (arr!3917 (buf!3597 bs2!18)) (_4!79 lt!239333))) (ite c!8162 lt!239335 #b00000000000000000000000000000000) lt!239334))))

(declare-fun b!152892 () Bool)

(declare-fun e!102379 () Bool)

(assert (=> b!152892 (= e!102380 e!102379)))

(declare-fun res!128118 () Bool)

(assert (=> b!152892 (= res!128118 (byteRangesEq!0 (select (arr!3917 (buf!3597 bs1!10)) (_3!382 lt!239333)) (select (arr!3917 (buf!3597 bs2!18)) (_3!382 lt!239333)) lt!239335 #b00000000000000000000000000001000))))

(assert (=> b!152892 (=> (not res!128118) (not e!102379))))

(declare-fun b!152893 () Bool)

(declare-fun res!128117 () Bool)

(assert (=> b!152893 (= res!128117 (= lt!239334 #b00000000000000000000000000000000))))

(declare-fun e!102382 () Bool)

(assert (=> b!152893 (=> res!128117 e!102382)))

(assert (=> b!152893 (= e!102379 e!102382)))

(declare-fun b!152894 () Bool)

(assert (=> b!152894 (= e!102381 e!102377)))

(declare-fun res!128115 () Bool)

(assert (=> b!152894 (=> (not res!128115) (not e!102377))))

(assert (=> b!152894 (= res!128115 e!102378)))

(declare-fun res!128119 () Bool)

(assert (=> b!152894 (=> res!128119 e!102378)))

(assert (=> b!152894 (= res!128119 (bvsge (_1!7167 lt!239333) (_2!7167 lt!239333)))))

(assert (=> b!152894 (= lt!239334 ((_ extract 31 0) (bvsrem lt!239284 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!152894 (= lt!239335 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!158)

(assert (=> b!152894 (= lt!239333 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!239284))))

(declare-fun b!152895 () Bool)

(assert (=> b!152895 (= e!102382 call!2144)))

(declare-fun b!152896 () Bool)

(assert (=> b!152896 (= e!102380 call!2144)))

(assert (= (and d!50266 (not res!128116)) b!152894))

(assert (= (and b!152894 (not res!128119)) b!152890))

(assert (= (and b!152894 res!128115) b!152891))

(assert (= (and b!152891 c!8162) b!152896))

(assert (= (and b!152891 (not c!8162)) b!152892))

(assert (= (and b!152892 res!128118) b!152893))

(assert (= (and b!152893 (not res!128117)) b!152895))

(assert (= (or b!152896 b!152895) bm!2141))

(declare-fun m!238699 () Bool)

(assert (=> b!152890 m!238699))

(declare-fun m!238701 () Bool)

(assert (=> bm!2141 m!238701))

(declare-fun m!238703 () Bool)

(assert (=> bm!2141 m!238703))

(declare-fun m!238705 () Bool)

(assert (=> bm!2141 m!238705))

(declare-fun m!238707 () Bool)

(assert (=> bm!2141 m!238707))

(declare-fun m!238709 () Bool)

(assert (=> bm!2141 m!238709))

(assert (=> b!152892 m!238707))

(assert (=> b!152892 m!238709))

(assert (=> b!152892 m!238707))

(assert (=> b!152892 m!238709))

(declare-fun m!238711 () Bool)

(assert (=> b!152892 m!238711))

(declare-fun m!238713 () Bool)

(assert (=> b!152894 m!238713))

(assert (=> b!152818 d!50266))

(declare-fun d!50276 () Bool)

(declare-fun e!102397 () Bool)

(assert (=> d!50276 e!102397))

(declare-fun res!128138 () Bool)

(assert (=> d!50276 (=> (not res!128138) (not e!102397))))

(declare-fun lt!239364 () (_ BitVec 64))

(declare-fun lt!239368 () (_ BitVec 64))

(declare-fun lt!239363 () (_ BitVec 64))

(assert (=> d!50276 (= res!128138 (= lt!239364 (bvsub lt!239368 lt!239363)))))

(assert (=> d!50276 (or (= (bvand lt!239368 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!239363 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!239368 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!239368 lt!239363) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!50276 (= lt!239363 (remainingBits!0 ((_ sign_extend 32) (size!3094 (buf!3597 bs1!10))) ((_ sign_extend 32) (currentByte!6571 bs1!10)) ((_ sign_extend 32) (currentBit!6566 bs1!10))))))

(declare-fun lt!239367 () (_ BitVec 64))

(declare-fun lt!239365 () (_ BitVec 64))

(assert (=> d!50276 (= lt!239368 (bvmul lt!239367 lt!239365))))

(assert (=> d!50276 (or (= lt!239367 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!239365 (bvsdiv (bvmul lt!239367 lt!239365) lt!239367)))))

(assert (=> d!50276 (= lt!239365 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50276 (= lt!239367 ((_ sign_extend 32) (size!3094 (buf!3597 bs1!10))))))

(assert (=> d!50276 (= lt!239364 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6571 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6566 bs1!10))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!50276 (invariant!0 (currentBit!6566 bs1!10) (currentByte!6571 bs1!10) (size!3094 (buf!3597 bs1!10)))))

(assert (=> d!50276 (= (bitIndex!0 (size!3094 (buf!3597 bs1!10)) (currentByte!6571 bs1!10) (currentBit!6566 bs1!10)) lt!239364)))

(declare-fun b!152916 () Bool)

(declare-fun res!128137 () Bool)

(assert (=> b!152916 (=> (not res!128137) (not e!102397))))

(assert (=> b!152916 (= res!128137 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!239364))))

(declare-fun b!152917 () Bool)

(declare-fun lt!239366 () (_ BitVec 64))

(assert (=> b!152917 (= e!102397 (bvsle lt!239364 (bvmul lt!239366 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!152917 (or (= lt!239366 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!239366 #b0000000000000000000000000000000000000000000000000000000000001000) lt!239366)))))

(assert (=> b!152917 (= lt!239366 ((_ sign_extend 32) (size!3094 (buf!3597 bs1!10))))))

(assert (= (and d!50276 res!128138) b!152916))

(assert (= (and b!152916 res!128137) b!152917))

(declare-fun m!238739 () Bool)

(assert (=> d!50276 m!238739))

(declare-fun m!238741 () Bool)

(assert (=> d!50276 m!238741))

(assert (=> b!152817 d!50276))

(declare-fun d!50290 () Bool)

(assert (=> d!50290 (= (inv!12 bs1!10) (invariant!0 (currentBit!6566 bs1!10) (currentByte!6571 bs1!10) (size!3094 (buf!3597 bs1!10))))))

(declare-fun bs!12294 () Bool)

(assert (= bs!12294 d!50290))

(assert (=> bs!12294 m!238741))

(assert (=> start!29650 d!50290))

(declare-fun d!50292 () Bool)

(assert (=> d!50292 (= (inv!12 bs2!18) (invariant!0 (currentBit!6566 bs2!18) (currentByte!6571 bs2!18) (size!3094 (buf!3597 bs2!18))))))

(declare-fun bs!12295 () Bool)

(assert (= bs!12295 d!50292))

(declare-fun m!238743 () Bool)

(assert (=> bs!12295 m!238743))

(assert (=> start!29650 d!50292))

(declare-fun d!50294 () Bool)

(assert (=> d!50294 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3094 (buf!3597 bs1!10))) ((_ sign_extend 32) (currentByte!6571 bs1!10)) ((_ sign_extend 32) (currentBit!6566 bs1!10))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3094 (buf!3597 bs1!10))) ((_ sign_extend 32) (currentByte!6571 bs1!10)) ((_ sign_extend 32) (currentBit!6566 bs1!10))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!12296 () Bool)

(assert (= bs!12296 d!50294))

(assert (=> bs!12296 m!238739))

(assert (=> b!152816 d!50294))

(declare-fun d!50296 () Bool)

(assert (=> d!50296 (= (array_inv!2883 (buf!3597 bs2!18)) (bvsge (size!3094 (buf!3597 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!152815 d!50296))

(declare-fun d!50298 () Bool)

(declare-fun e!102410 () Bool)

(assert (=> d!50298 e!102410))

(declare-fun res!128150 () Bool)

(assert (=> d!50298 (=> (not res!128150) (not e!102410))))

(declare-fun lt!239376 () (_ BitVec 64))

(declare-fun lt!239375 () (_ BitVec 64))

(declare-fun lt!239380 () (_ BitVec 64))

(assert (=> d!50298 (= res!128150 (= lt!239376 (bvsub lt!239380 lt!239375)))))

(assert (=> d!50298 (or (= (bvand lt!239380 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!239375 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!239380 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!239380 lt!239375) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50298 (= lt!239375 (remainingBits!0 ((_ sign_extend 32) (size!3094 (buf!3597 bs2!18))) ((_ sign_extend 32) (currentByte!6571 bs2!18)) ((_ sign_extend 32) (currentBit!6566 bs2!18))))))

(declare-fun lt!239379 () (_ BitVec 64))

(declare-fun lt!239377 () (_ BitVec 64))

(assert (=> d!50298 (= lt!239380 (bvmul lt!239379 lt!239377))))

(assert (=> d!50298 (or (= lt!239379 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!239377 (bvsdiv (bvmul lt!239379 lt!239377) lt!239379)))))

(assert (=> d!50298 (= lt!239377 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50298 (= lt!239379 ((_ sign_extend 32) (size!3094 (buf!3597 bs2!18))))))

(assert (=> d!50298 (= lt!239376 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6571 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6566 bs2!18))))))

(assert (=> d!50298 (invariant!0 (currentBit!6566 bs2!18) (currentByte!6571 bs2!18) (size!3094 (buf!3597 bs2!18)))))

(assert (=> d!50298 (= (bitIndex!0 (size!3094 (buf!3597 bs2!18)) (currentByte!6571 bs2!18) (currentBit!6566 bs2!18)) lt!239376)))

(declare-fun b!152932 () Bool)

(declare-fun res!128149 () Bool)

(assert (=> b!152932 (=> (not res!128149) (not e!102410))))

(assert (=> b!152932 (= res!128149 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!239376))))

(declare-fun b!152933 () Bool)

(declare-fun lt!239378 () (_ BitVec 64))

(assert (=> b!152933 (= e!102410 (bvsle lt!239376 (bvmul lt!239378 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!152933 (or (= lt!239378 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!239378 #b0000000000000000000000000000000000000000000000000000000000001000) lt!239378)))))

(assert (=> b!152933 (= lt!239378 ((_ sign_extend 32) (size!3094 (buf!3597 bs2!18))))))

(assert (= (and d!50298 res!128150) b!152932))

(assert (= (and b!152932 res!128149) b!152933))

(declare-fun m!238745 () Bool)

(assert (=> d!50298 m!238745))

(assert (=> d!50298 m!238743))

(assert (=> b!152814 d!50298))

(push 1)

(assert (not b!152890))

(assert (not d!50298))

(assert (not d!50294))

(assert (not bm!2141))

(assert (not d!50292))

(assert (not d!50290))

(assert (not b!152894))

(assert (not d!50276))

(assert (not b!152892))

(check-sat)

(pop 1)

(push 1)

(check-sat)

