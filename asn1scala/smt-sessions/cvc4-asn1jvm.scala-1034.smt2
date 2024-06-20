; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29690 () Bool)

(assert start!29690)

(declare-fun b!152991 () Bool)

(declare-fun e!102468 () Bool)

(declare-datatypes ((array!6867 0))(
  ( (array!6868 (arr!3922 (Array (_ BitVec 32) (_ BitVec 8))) (size!3099 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5456 0))(
  ( (BitStream!5457 (buf!3602 array!6867) (currentByte!6582 (_ BitVec 32)) (currentBit!6577 (_ BitVec 32))) )
))
(declare-fun bs2!18 () BitStream!5456)

(declare-fun bs1!10 () BitStream!5456)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!152991 (= e!102468 (not (validate_offset_byte!0 ((_ sign_extend 32) (size!3099 (buf!3602 bs2!18))) ((_ sign_extend 32) (currentByte!6582 bs1!10)) ((_ sign_extend 32) (currentBit!6577 bs1!10)))))))

(declare-datatypes ((tuple2!13574 0))(
  ( (tuple2!13575 (_1!7171 BitStream!5456) (_2!7171 (_ BitVec 8))) )
))
(declare-fun lt!239407 () tuple2!13574)

(declare-fun readBytePure!0 (BitStream!5456) tuple2!13574)

(assert (=> b!152991 (= lt!239407 (readBytePure!0 bs1!10))))

(declare-fun b!152992 () Bool)

(declare-fun res!128190 () Bool)

(assert (=> b!152992 (=> (not res!128190) (not e!102468))))

(declare-fun lt!239406 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!6867 array!6867 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!152992 (= res!128190 (arrayBitRangesEq!0 (buf!3602 bs1!10) (buf!3602 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!239406))))

(declare-fun b!152993 () Bool)

(declare-fun e!102471 () Bool)

(assert (=> b!152993 (= e!102471 e!102468)))

(declare-fun res!128193 () Bool)

(assert (=> b!152993 (=> (not res!128193) (not e!102468))))

(assert (=> b!152993 (= res!128193 (bvsle lt!239406 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3099 (buf!3602 bs1!10))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!152993 (= lt!239406 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3099 (buf!3602 bs1!10)) (currentByte!6582 bs1!10) (currentBit!6577 bs1!10))))))

(declare-fun b!152994 () Bool)

(declare-fun res!128192 () Bool)

(assert (=> b!152994 (=> (not res!128192) (not e!102468))))

(assert (=> b!152994 (= res!128192 (bvsle lt!239406 (bitIndex!0 (size!3099 (buf!3602 bs2!18)) (currentByte!6582 bs2!18) (currentBit!6577 bs2!18))))))

(declare-fun b!152995 () Bool)

(declare-fun e!102467 () Bool)

(declare-fun array_inv!2888 (array!6867) Bool)

(assert (=> b!152995 (= e!102467 (array_inv!2888 (buf!3602 bs1!10)))))

(declare-fun res!128191 () Bool)

(assert (=> start!29690 (=> (not res!128191) (not e!102471))))

(assert (=> start!29690 (= res!128191 (= (size!3099 (buf!3602 bs1!10)) (size!3099 (buf!3602 bs2!18))))))

(assert (=> start!29690 e!102471))

(declare-fun inv!12 (BitStream!5456) Bool)

(assert (=> start!29690 (and (inv!12 bs1!10) e!102467)))

(declare-fun e!102466 () Bool)

(assert (=> start!29690 (and (inv!12 bs2!18) e!102466)))

(declare-fun b!152996 () Bool)

(assert (=> b!152996 (= e!102466 (array_inv!2888 (buf!3602 bs2!18)))))

(assert (= (and start!29690 res!128191) b!152993))

(assert (= (and b!152993 res!128193) b!152994))

(assert (= (and b!152994 res!128192) b!152992))

(assert (= (and b!152992 res!128190) b!152991))

(assert (= start!29690 b!152995))

(assert (= start!29690 b!152996))

(declare-fun m!238801 () Bool)

(assert (=> start!29690 m!238801))

(declare-fun m!238803 () Bool)

(assert (=> start!29690 m!238803))

(declare-fun m!238805 () Bool)

(assert (=> b!152993 m!238805))

(declare-fun m!238807 () Bool)

(assert (=> b!152991 m!238807))

(declare-fun m!238809 () Bool)

(assert (=> b!152991 m!238809))

(declare-fun m!238811 () Bool)

(assert (=> b!152996 m!238811))

(declare-fun m!238813 () Bool)

(assert (=> b!152994 m!238813))

(declare-fun m!238815 () Bool)

(assert (=> b!152992 m!238815))

(declare-fun m!238817 () Bool)

(assert (=> b!152995 m!238817))

(push 1)

(assert (not start!29690))

(assert (not b!152993))

(assert (not b!152992))

(assert (not b!152995))

(assert (not b!152996))

(assert (not b!152991))

(assert (not b!152994))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!50316 () Bool)

(assert (=> d!50316 (= (array_inv!2888 (buf!3602 bs2!18)) (bvsge (size!3099 (buf!3602 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!152996 d!50316))

(declare-fun d!50318 () Bool)

(assert (=> d!50318 (= (array_inv!2888 (buf!3602 bs1!10)) (bvsge (size!3099 (buf!3602 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!152995 d!50318))

(declare-fun d!50320 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!50320 (= (inv!12 bs1!10) (invariant!0 (currentBit!6577 bs1!10) (currentByte!6582 bs1!10) (size!3099 (buf!3602 bs1!10))))))

(declare-fun bs!12302 () Bool)

(assert (= bs!12302 d!50320))

(declare-fun m!238819 () Bool)

(assert (=> bs!12302 m!238819))

(assert (=> start!29690 d!50320))

(declare-fun d!50322 () Bool)

(assert (=> d!50322 (= (inv!12 bs2!18) (invariant!0 (currentBit!6577 bs2!18) (currentByte!6582 bs2!18) (size!3099 (buf!3602 bs2!18))))))

(declare-fun bs!12303 () Bool)

(assert (= bs!12303 d!50322))

(declare-fun m!238821 () Bool)

(assert (=> bs!12303 m!238821))

(assert (=> start!29690 d!50322))

(declare-fun d!50324 () Bool)

(declare-fun e!102497 () Bool)

(assert (=> d!50324 e!102497))

(declare-fun res!128224 () Bool)

(assert (=> d!50324 (=> (not res!128224) (not e!102497))))

(declare-fun lt!239464 () (_ BitVec 64))

(declare-fun lt!239466 () (_ BitVec 64))

(declare-fun lt!239462 () (_ BitVec 64))

(assert (=> d!50324 (= res!128224 (= lt!239466 (bvsub lt!239462 lt!239464)))))

(assert (=> d!50324 (or (= (bvand lt!239462 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!239464 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!239462 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!239462 lt!239464) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!50324 (= lt!239464 (remainingBits!0 ((_ sign_extend 32) (size!3099 (buf!3602 bs2!18))) ((_ sign_extend 32) (currentByte!6582 bs2!18)) ((_ sign_extend 32) (currentBit!6577 bs2!18))))))

(declare-fun lt!239463 () (_ BitVec 64))

(declare-fun lt!239465 () (_ BitVec 64))

(assert (=> d!50324 (= lt!239462 (bvmul lt!239463 lt!239465))))

(assert (=> d!50324 (or (= lt!239463 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!239465 (bvsdiv (bvmul lt!239463 lt!239465) lt!239463)))))

(assert (=> d!50324 (= lt!239465 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50324 (= lt!239463 ((_ sign_extend 32) (size!3099 (buf!3602 bs2!18))))))

(assert (=> d!50324 (= lt!239466 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6582 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6577 bs2!18))))))

(assert (=> d!50324 (invariant!0 (currentBit!6577 bs2!18) (currentByte!6582 bs2!18) (size!3099 (buf!3602 bs2!18)))))

(assert (=> d!50324 (= (bitIndex!0 (size!3099 (buf!3602 bs2!18)) (currentByte!6582 bs2!18) (currentBit!6577 bs2!18)) lt!239466)))

(declare-fun b!153032 () Bool)

(declare-fun res!128223 () Bool)

(assert (=> b!153032 (=> (not res!128223) (not e!102497))))

(assert (=> b!153032 (= res!128223 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!239466))))

(declare-fun b!153033 () Bool)

(declare-fun lt!239467 () (_ BitVec 64))

(assert (=> b!153033 (= e!102497 (bvsle lt!239466 (bvmul lt!239467 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!153033 (or (= lt!239467 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!239467 #b0000000000000000000000000000000000000000000000000000000000001000) lt!239467)))))

(assert (=> b!153033 (= lt!239467 ((_ sign_extend 32) (size!3099 (buf!3602 bs2!18))))))

(assert (= (and d!50324 res!128224) b!153032))

(assert (= (and b!153032 res!128223) b!153033))

(declare-fun m!238849 () Bool)

(assert (=> d!50324 m!238849))

(assert (=> d!50324 m!238821))

(assert (=> b!152994 d!50324))

(declare-fun d!50342 () Bool)

(declare-fun e!102498 () Bool)

(assert (=> d!50342 e!102498))

(declare-fun res!128226 () Bool)

(assert (=> d!50342 (=> (not res!128226) (not e!102498))))

(declare-fun lt!239468 () (_ BitVec 64))

(declare-fun lt!239470 () (_ BitVec 64))

(declare-fun lt!239472 () (_ BitVec 64))

(assert (=> d!50342 (= res!128226 (= lt!239472 (bvsub lt!239468 lt!239470)))))

(assert (=> d!50342 (or (= (bvand lt!239468 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!239470 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!239468 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!239468 lt!239470) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50342 (= lt!239470 (remainingBits!0 ((_ sign_extend 32) (size!3099 (buf!3602 bs1!10))) ((_ sign_extend 32) (currentByte!6582 bs1!10)) ((_ sign_extend 32) (currentBit!6577 bs1!10))))))

(declare-fun lt!239469 () (_ BitVec 64))

(declare-fun lt!239471 () (_ BitVec 64))

(assert (=> d!50342 (= lt!239468 (bvmul lt!239469 lt!239471))))

(assert (=> d!50342 (or (= lt!239469 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!239471 (bvsdiv (bvmul lt!239469 lt!239471) lt!239469)))))

(assert (=> d!50342 (= lt!239471 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50342 (= lt!239469 ((_ sign_extend 32) (size!3099 (buf!3602 bs1!10))))))

(assert (=> d!50342 (= lt!239472 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6582 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6577 bs1!10))))))

(assert (=> d!50342 (invariant!0 (currentBit!6577 bs1!10) (currentByte!6582 bs1!10) (size!3099 (buf!3602 bs1!10)))))

(assert (=> d!50342 (= (bitIndex!0 (size!3099 (buf!3602 bs1!10)) (currentByte!6582 bs1!10) (currentBit!6577 bs1!10)) lt!239472)))

(declare-fun b!153034 () Bool)

(declare-fun res!128225 () Bool)

(assert (=> b!153034 (=> (not res!128225) (not e!102498))))

(assert (=> b!153034 (= res!128225 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!239472))))

(declare-fun b!153035 () Bool)

(declare-fun lt!239473 () (_ BitVec 64))

(assert (=> b!153035 (= e!102498 (bvsle lt!239472 (bvmul lt!239473 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!153035 (or (= lt!239473 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!239473 #b0000000000000000000000000000000000000000000000000000000000001000) lt!239473)))))

(assert (=> b!153035 (= lt!239473 ((_ sign_extend 32) (size!3099 (buf!3602 bs1!10))))))

(assert (= (and d!50342 res!128226) b!153034))

(assert (= (and b!153034 res!128225) b!153035))

(declare-fun m!238851 () Bool)

(assert (=> d!50342 m!238851))

(assert (=> d!50342 m!238819))

(assert (=> b!152993 d!50342))

(declare-fun e!102526 () Bool)

(declare-fun lt!239503 () (_ BitVec 32))

(declare-fun b!153068 () Bool)

(declare-datatypes ((tuple4!166 0))(
  ( (tuple4!167 (_1!7176 (_ BitVec 32)) (_2!7176 (_ BitVec 32)) (_3!386 (_ BitVec 32)) (_4!83 (_ BitVec 32))) )
))
(declare-fun lt!239501 () tuple4!166)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!153068 (= e!102526 (byteRangesEq!0 (select (arr!3922 (buf!3602 bs1!10)) (_4!83 lt!239501)) (select (arr!3922 (buf!3602 bs2!18)) (_4!83 lt!239501)) #b00000000000000000000000000000000 lt!239503))))

(declare-fun b!153069 () Bool)

(declare-fun e!102530 () Bool)

(declare-fun e!102529 () Bool)

(assert (=> b!153069 (= e!102530 e!102529)))

(declare-fun res!128254 () Bool)

(declare-fun call!2158 () Bool)

(assert (=> b!153069 (= res!128254 call!2158)))

(assert (=> b!153069 (=> (not res!128254) (not e!102529))))

(declare-fun d!50344 () Bool)

(declare-fun res!128252 () Bool)

(declare-fun e!102527 () Bool)

(assert (=> d!50344 (=> res!128252 e!102527)))

(assert (=> d!50344 (= res!128252 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!239406))))

(assert (=> d!50344 (= (arrayBitRangesEq!0 (buf!3602 bs1!10) (buf!3602 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!239406) e!102527)))

(declare-fun e!102525 () Bool)

(declare-fun b!153070 () Bool)

(declare-fun arrayRangesEq!376 (array!6867 array!6867 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!153070 (= e!102525 (arrayRangesEq!376 (buf!3602 bs1!10) (buf!3602 bs2!18) (_1!7176 lt!239501) (_2!7176 lt!239501)))))

(declare-fun c!8174 () Bool)

(declare-fun bm!2155 () Bool)

(declare-fun lt!239502 () (_ BitVec 32))

(assert (=> bm!2155 (= call!2158 (byteRangesEq!0 (select (arr!3922 (buf!3602 bs1!10)) (_3!386 lt!239501)) (select (arr!3922 (buf!3602 bs2!18)) (_3!386 lt!239501)) lt!239502 (ite c!8174 lt!239503 #b00000000000000000000000000001000)))))

(declare-fun b!153071 () Bool)

(declare-fun res!128253 () Bool)

(assert (=> b!153071 (= res!128253 (= lt!239503 #b00000000000000000000000000000000))))

(assert (=> b!153071 (=> res!128253 e!102526)))

(assert (=> b!153071 (= e!102529 e!102526)))

(declare-fun b!153072 () Bool)

(declare-fun e!102528 () Bool)

(assert (=> b!153072 (= e!102527 e!102528)))

(declare-fun res!128251 () Bool)

(assert (=> b!153072 (=> (not res!128251) (not e!102528))))

(assert (=> b!153072 (= res!128251 e!102525)))

(declare-fun res!128255 () Bool)

(assert (=> b!153072 (=> res!128255 e!102525)))

(assert (=> b!153072 (= res!128255 (bvsge (_1!7176 lt!239501) (_2!7176 lt!239501)))))

(assert (=> b!153072 (= lt!239503 ((_ extract 31 0) (bvsrem lt!239406 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!153072 (= lt!239502 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!166)

(assert (=> b!153072 (= lt!239501 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!239406))))

(declare-fun b!153073 () Bool)

(assert (=> b!153073 (= e!102530 call!2158)))

(declare-fun b!153074 () Bool)

(assert (=> b!153074 (= e!102528 e!102530)))

(assert (=> b!153074 (= c!8174 (= (_3!386 lt!239501) (_4!83 lt!239501)))))

(assert (= (and d!50344 (not res!128252)) b!153072))

(assert (= (and b!153072 (not res!128255)) b!153070))

(assert (= (and b!153072 res!128251) b!153074))

(assert (= (and b!153074 c!8174) b!153073))

(assert (= (and b!153074 (not c!8174)) b!153069))

(assert (= (and b!153069 res!128254) b!153071))

(assert (= (and b!153071 (not res!128253)) b!153068))

(assert (= (or b!153073 b!153069) bm!2155))

(declare-fun m!238865 () Bool)

(assert (=> b!153068 m!238865))

(declare-fun m!238867 () Bool)

(assert (=> b!153068 m!238867))

(assert (=> b!153068 m!238865))

(assert (=> b!153068 m!238867))

(declare-fun m!238869 () Bool)

(assert (=> b!153068 m!238869))

(declare-fun m!238871 () Bool)

(assert (=> b!153070 m!238871))

(declare-fun m!238873 () Bool)

(assert (=> bm!2155 m!238873))

(declare-fun m!238875 () Bool)

(assert (=> bm!2155 m!238875))

(assert (=> bm!2155 m!238873))

(assert (=> bm!2155 m!238875))

(declare-fun m!238877 () Bool)

(assert (=> bm!2155 m!238877))

(declare-fun m!238879 () Bool)

(assert (=> b!153072 m!238879))

(assert (=> b!152992 d!50344))

(declare-fun d!50356 () Bool)

(assert (=> d!50356 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3099 (buf!3602 bs2!18))) ((_ sign_extend 32) (currentByte!6582 bs1!10)) ((_ sign_extend 32) (currentBit!6577 bs1!10))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3099 (buf!3602 bs2!18))) ((_ sign_extend 32) (currentByte!6582 bs1!10)) ((_ sign_extend 32) (currentBit!6577 bs1!10))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!12312 () Bool)

(assert (= bs!12312 d!50356))

(declare-fun m!238881 () Bool)

(assert (=> bs!12312 m!238881))

(assert (=> b!152991 d!50356))

(declare-fun d!50358 () Bool)

(declare-datatypes ((tuple2!13580 0))(
  ( (tuple2!13581 (_1!7177 (_ BitVec 8)) (_2!7177 BitStream!5456)) )
))
(declare-fun lt!239515 () tuple2!13580)

(declare-fun readByte!0 (BitStream!5456) tuple2!13580)

(assert (=> d!50358 (= lt!239515 (readByte!0 bs1!10))))

(assert (=> d!50358 (= (readBytePure!0 bs1!10) (tuple2!13575 (_2!7177 lt!239515) (_1!7177 lt!239515)))))

(declare-fun bs!12313 () Bool)

(assert (= bs!12313 d!50358))

(declare-fun m!238901 () Bool)

(assert (=> bs!12313 m!238901))

(assert (=> b!152991 d!50358))

(push 1)

(assert (not d!50358))

(assert (not d!50356))

(assert (not b!153068))

(assert (not b!153072))

(assert (not d!50320))

(assert (not d!50322))

(assert (not bm!2155))

(assert (not d!50324))

(assert (not d!50342))

(assert (not b!153070))

(check-sat)

(pop 1)

(push 1)

(check-sat)

