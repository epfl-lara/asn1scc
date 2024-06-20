; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37686 () Bool)

(assert start!37686)

(declare-fun res!141762 () Bool)

(declare-fun e!119242 () Bool)

(assert (=> start!37686 (=> (not res!141762) (not e!119242))))

(declare-fun nBits!283 () (_ BitVec 64))

(declare-fun from!235 () (_ BitVec 64))

(assert (=> start!37686 (= res!141762 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle nBits!283 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!235) (bvslt from!235 nBits!283)))))

(assert (=> start!37686 e!119242))

(assert (=> start!37686 true))

(declare-datatypes ((array!9070 0))(
  ( (array!9071 (arr!4945 (Array (_ BitVec 32) (_ BitVec 8))) (size!4015 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7168 0))(
  ( (BitStream!7169 (buf!4458 array!9070) (currentByte!8451 (_ BitVec 32)) (currentBit!8446 (_ BitVec 32))) )
))
(declare-fun bs!64 () BitStream!7168)

(declare-fun e!119241 () Bool)

(declare-fun inv!12 (BitStream!7168) Bool)

(assert (=> start!37686 (and (inv!12 bs!64) e!119241)))

(declare-fun b!170851 () Bool)

(declare-fun res!141761 () Bool)

(assert (=> b!170851 (=> (not res!141761) (not e!119242))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!170851 (= res!141761 (validate_offset_bits!1 ((_ sign_extend 32) (size!4015 (buf!4458 bs!64))) ((_ sign_extend 32) (currentByte!8451 bs!64)) ((_ sign_extend 32) (currentBit!8446 bs!64)) (bvsub nBits!283 from!235)))))

(declare-fun b!170852 () Bool)

(declare-fun moveBitIndexPrecond!0 (BitStream!7168 (_ BitVec 64)) Bool)

(assert (=> b!170852 (= e!119242 (not (moveBitIndexPrecond!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-datatypes ((tuple2!14672 0))(
  ( (tuple2!14673 (_1!7969 BitStream!7168) (_2!7969 Bool)) )
))
(declare-fun lt!263368 () tuple2!14672)

(declare-fun readBitPure!0 (BitStream!7168) tuple2!14672)

(assert (=> b!170852 (= lt!263368 (readBitPure!0 bs!64))))

(declare-fun expected!82 () Bool)

(declare-fun lt!263369 () tuple2!14672)

(declare-fun checkBitsLoopPure!0 (BitStream!7168 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!14672)

(assert (=> b!170852 (= lt!263369 (checkBitsLoopPure!0 bs!64 nBits!283 expected!82 from!235))))

(declare-fun b!170853 () Bool)

(declare-fun array_inv!3756 (array!9070) Bool)

(assert (=> b!170853 (= e!119241 (array_inv!3756 (buf!4458 bs!64)))))

(assert (= (and start!37686 res!141762) b!170851))

(assert (= (and b!170851 res!141761) b!170852))

(assert (= start!37686 b!170853))

(declare-fun m!270007 () Bool)

(assert (=> start!37686 m!270007))

(declare-fun m!270009 () Bool)

(assert (=> b!170851 m!270009))

(declare-fun m!270011 () Bool)

(assert (=> b!170852 m!270011))

(declare-fun m!270013 () Bool)

(assert (=> b!170852 m!270013))

(declare-fun m!270015 () Bool)

(assert (=> b!170852 m!270015))

(declare-fun m!270017 () Bool)

(assert (=> b!170853 m!270017))

(push 1)

(assert (not b!170853))

(assert (not b!170852))

(assert (not b!170851))

(assert (not start!37686))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!60361 () Bool)

(assert (=> d!60361 (= (array_inv!3756 (buf!4458 bs!64)) (bvsge (size!4015 (buf!4458 bs!64)) #b00000000000000000000000000000000))))

(assert (=> b!170853 d!60361))

(declare-fun d!60363 () Bool)

(declare-fun res!141777 () Bool)

(declare-fun e!119263 () Bool)

(assert (=> d!60363 (=> (not res!141777) (not e!119263))))

(assert (=> d!60363 (= res!141777 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!4015 (buf!4458 bs!64)))) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4015 (buf!4458 bs!64)))))))))

(assert (=> d!60363 (= (moveBitIndexPrecond!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001) e!119263)))

(declare-fun b!170875 () Bool)

(declare-fun lt!263384 () (_ BitVec 64))

(assert (=> b!170875 (= e!119263 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!263384) (bvsle lt!263384 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4015 (buf!4458 bs!64)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!170875 (= lt!263384 (bvadd (bitIndex!0 (size!4015 (buf!4458 bs!64)) (currentByte!8451 bs!64) (currentBit!8446 bs!64)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and d!60363 res!141777) b!170875))

(declare-fun m!270047 () Bool)

(assert (=> b!170875 m!270047))

(assert (=> b!170852 d!60363))

(declare-fun d!60377 () Bool)

(declare-datatypes ((tuple2!14678 0))(
  ( (tuple2!14679 (_1!7972 Bool) (_2!7972 BitStream!7168)) )
))
(declare-fun lt!263390 () tuple2!14678)

(declare-fun readBit!0 (BitStream!7168) tuple2!14678)

(assert (=> d!60377 (= lt!263390 (readBit!0 bs!64))))

(assert (=> d!60377 (= (readBitPure!0 bs!64) (tuple2!14673 (_2!7972 lt!263390) (_1!7972 lt!263390)))))

(declare-fun bs!15027 () Bool)

(assert (= bs!15027 d!60377))

(declare-fun m!270051 () Bool)

(assert (=> bs!15027 m!270051))

(assert (=> b!170852 d!60377))

(declare-fun lt!263399 () tuple2!14678)

(declare-fun d!60381 () Bool)

(declare-fun checkBitsLoop!0 (BitStream!7168 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!14678)

(assert (=> d!60381 (= lt!263399 (checkBitsLoop!0 bs!64 nBits!283 expected!82 from!235))))

(assert (=> d!60381 (= (checkBitsLoopPure!0 bs!64 nBits!283 expected!82 from!235) (tuple2!14673 (_2!7972 lt!263399) (_1!7972 lt!263399)))))

(declare-fun bs!15029 () Bool)

(assert (= bs!15029 d!60381))

(declare-fun m!270057 () Bool)

(assert (=> bs!15029 m!270057))

(assert (=> b!170852 d!60381))

(declare-fun d!60387 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!60387 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4015 (buf!4458 bs!64))) ((_ sign_extend 32) (currentByte!8451 bs!64)) ((_ sign_extend 32) (currentBit!8446 bs!64)) (bvsub nBits!283 from!235)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4015 (buf!4458 bs!64))) ((_ sign_extend 32) (currentByte!8451 bs!64)) ((_ sign_extend 32) (currentBit!8446 bs!64))) (bvsub nBits!283 from!235)))))

(declare-fun bs!15030 () Bool)

(assert (= bs!15030 d!60387))

(declare-fun m!270059 () Bool)

(assert (=> bs!15030 m!270059))

(assert (=> b!170851 d!60387))

(declare-fun d!60389 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!60389 (= (inv!12 bs!64) (invariant!0 (currentBit!8446 bs!64) (currentByte!8451 bs!64) (size!4015 (buf!4458 bs!64))))))

(declare-fun bs!15033 () Bool)

(assert (= bs!15033 d!60389))

(declare-fun m!270065 () Bool)

(assert (=> bs!15033 m!270065))

(assert (=> start!37686 d!60389))

(push 1)

(assert (not b!170875))

(assert (not d!60389))

(assert (not d!60387))

(assert (not d!60377))

(assert (not d!60381))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!60397 () Bool)

(assert (=> d!60397 (= (remainingBits!0 ((_ sign_extend 32) (size!4015 (buf!4458 bs!64))) ((_ sign_extend 32) (currentByte!8451 bs!64)) ((_ sign_extend 32) (currentBit!8446 bs!64))) (bvsub (bvmul ((_ sign_extend 32) (size!4015 (buf!4458 bs!64))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8451 bs!64)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8446 bs!64)))))))

(assert (=> d!60387 d!60397))

(declare-fun d!60401 () Bool)

(declare-fun e!119274 () Bool)

(assert (=> d!60401 e!119274))

(declare-fun res!141793 () Bool)

(assert (=> d!60401 (=> (not res!141793) (not e!119274))))

(declare-fun lt!263436 () (_ BitVec 64))

(declare-fun lt!263433 () (_ BitVec 64))

(declare-fun lt!263438 () (_ BitVec 64))

(assert (=> d!60401 (= res!141793 (= lt!263438 (bvsub lt!263433 lt!263436)))))

(assert (=> d!60401 (or (= (bvand lt!263433 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!263436 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!263433 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!263433 lt!263436) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60401 (= lt!263436 (remainingBits!0 ((_ sign_extend 32) (size!4015 (buf!4458 bs!64))) ((_ sign_extend 32) (currentByte!8451 bs!64)) ((_ sign_extend 32) (currentBit!8446 bs!64))))))

(declare-fun lt!263435 () (_ BitVec 64))

(declare-fun lt!263437 () (_ BitVec 64))

(assert (=> d!60401 (= lt!263433 (bvmul lt!263435 lt!263437))))

(assert (=> d!60401 (or (= lt!263435 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!263437 (bvsdiv (bvmul lt!263435 lt!263437) lt!263435)))))

(assert (=> d!60401 (= lt!263437 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!60401 (= lt!263435 ((_ sign_extend 32) (size!4015 (buf!4458 bs!64))))))

(assert (=> d!60401 (= lt!263438 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8451 bs!64)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8446 bs!64))))))

(assert (=> d!60401 (invariant!0 (currentBit!8446 bs!64) (currentByte!8451 bs!64) (size!4015 (buf!4458 bs!64)))))

(assert (=> d!60401 (= (bitIndex!0 (size!4015 (buf!4458 bs!64)) (currentByte!8451 bs!64) (currentBit!8446 bs!64)) lt!263438)))

(declare-fun b!170892 () Bool)

(declare-fun res!141792 () Bool)

(assert (=> b!170892 (=> (not res!141792) (not e!119274))))

(assert (=> b!170892 (= res!141792 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!263438))))

(declare-fun b!170893 () Bool)

(declare-fun lt!263434 () (_ BitVec 64))

(assert (=> b!170893 (= e!119274 (bvsle lt!263438 (bvmul lt!263434 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!170893 (or (= lt!263434 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!263434 #b0000000000000000000000000000000000000000000000000000000000001000) lt!263434)))))

(assert (=> b!170893 (= lt!263434 ((_ sign_extend 32) (size!4015 (buf!4458 bs!64))))))

(assert (= (and d!60401 res!141793) b!170892))

(assert (= (and b!170892 res!141792) b!170893))

(assert (=> d!60401 m!270059))

(assert (=> d!60401 m!270065))

(assert (=> b!170875 d!60401))

(declare-fun d!60409 () Bool)

(declare-fun e!119288 () Bool)

(assert (=> d!60409 e!119288))

(declare-fun res!141800 () Bool)

(assert (=> d!60409 (=> (not res!141800) (not e!119288))))

(declare-datatypes ((Unit!12213 0))(
  ( (Unit!12214) )
))
(declare-datatypes ((tuple2!14684 0))(
  ( (tuple2!14685 (_1!7975 Unit!12213) (_2!7975 BitStream!7168)) )
))
(declare-fun increaseBitIndex!0 (BitStream!7168) tuple2!14684)

(assert (=> d!60409 (= res!141800 (= (buf!4458 (_2!7975 (increaseBitIndex!0 bs!64))) (buf!4458 bs!64)))))

(declare-fun lt!263478 () Bool)

(assert (=> d!60409 (= lt!263478 (not (= (bvand ((_ sign_extend 24) (select (arr!4945 (buf!4458 bs!64)) (currentByte!8451 bs!64))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8446 bs!64)))) #b00000000000000000000000000000000)))))

(declare-fun lt!263475 () tuple2!14678)

(assert (=> d!60409 (= lt!263475 (tuple2!14679 (not (= (bvand ((_ sign_extend 24) (select (arr!4945 (buf!4458 bs!64)) (currentByte!8451 bs!64))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8446 bs!64)))) #b00000000000000000000000000000000)) (_2!7975 (increaseBitIndex!0 bs!64))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!60409 (validate_offset_bit!0 ((_ sign_extend 32) (size!4015 (buf!4458 bs!64))) ((_ sign_extend 32) (currentByte!8451 bs!64)) ((_ sign_extend 32) (currentBit!8446 bs!64)))))

(assert (=> d!60409 (= (readBit!0 bs!64) lt!263475)))

(declare-fun lt!263473 () (_ BitVec 64))

(declare-fun lt!263474 () (_ BitVec 64))

(declare-fun b!170900 () Bool)

(assert (=> b!170900 (= e!119288 (= (bitIndex!0 (size!4015 (buf!4458 (_2!7975 (increaseBitIndex!0 bs!64)))) (currentByte!8451 (_2!7975 (increaseBitIndex!0 bs!64))) (currentBit!8446 (_2!7975 (increaseBitIndex!0 bs!64)))) (bvadd lt!263474 lt!263473)))))

(assert (=> b!170900 (or (not (= (bvand lt!263474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!263473 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!263474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!263474 lt!263473) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!170900 (= lt!263473 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!170900 (= lt!263474 (bitIndex!0 (size!4015 (buf!4458 bs!64)) (currentByte!8451 bs!64) (currentBit!8446 bs!64)))))

(declare-fun lt!263479 () Bool)

(assert (=> b!170900 (= lt!263479 (not (= (bvand ((_ sign_extend 24) (select (arr!4945 (buf!4458 bs!64)) (currentByte!8451 bs!64))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8446 bs!64)))) #b00000000000000000000000000000000)))))

(declare-fun lt!263477 () Bool)

(assert (=> b!170900 (= lt!263477 (not (= (bvand ((_ sign_extend 24) (select (arr!4945 (buf!4458 bs!64)) (currentByte!8451 bs!64))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8446 bs!64)))) #b00000000000000000000000000000000)))))

(declare-fun lt!263476 () Bool)

(assert (=> b!170900 (= lt!263476 (not (= (bvand ((_ sign_extend 24) (select (arr!4945 (buf!4458 bs!64)) (currentByte!8451 bs!64))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8446 bs!64)))) #b00000000000000000000000000000000)))))

(assert (= (and d!60409 res!141800) b!170900))

(declare-fun m!270073 () Bool)

(assert (=> d!60409 m!270073))

(declare-fun m!270075 () Bool)

(assert (=> d!60409 m!270075))

(declare-fun m!270077 () Bool)

(assert (=> d!60409 m!270077))

(declare-fun m!270079 () Bool)

(assert (=> d!60409 m!270079))

(assert (=> b!170900 m!270073))

(assert (=> b!170900 m!270077))

(assert (=> b!170900 m!270075))

(assert (=> b!170900 m!270047))

(declare-fun m!270081 () Bool)

(assert (=> b!170900 m!270081))

(assert (=> d!60377 d!60409))

(declare-fun d!60413 () Bool)

(assert (=> d!60413 (= (invariant!0 (currentBit!8446 bs!64) (currentByte!8451 bs!64) (size!4015 (buf!4458 bs!64))) (and (bvsge (currentBit!8446 bs!64) #b00000000000000000000000000000000) (bvslt (currentBit!8446 bs!64) #b00000000000000000000000000001000) (bvsge (currentByte!8451 bs!64) #b00000000000000000000000000000000) (or (bvslt (currentByte!8451 bs!64) (size!4015 (buf!4458 bs!64))) (and (= (currentBit!8446 bs!64) #b00000000000000000000000000000000) (= (currentByte!8451 bs!64) (size!4015 (buf!4458 bs!64)))))))))

(assert (=> d!60389 d!60413))

(declare-fun b!170980 () Bool)

(declare-fun e!119339 () tuple2!14678)

(declare-fun e!119340 () tuple2!14678)

(assert (=> b!170980 (= e!119339 e!119340)))

(declare-fun lt!263602 () tuple2!14678)

(assert (=> b!170980 (= lt!263602 (readBit!0 bs!64))))

(declare-fun c!8949 () Bool)

(assert (=> b!170980 (= c!8949 (not (= (_1!7972 lt!263602) expected!82)))))

(declare-fun lt!263598 () tuple2!14678)

(declare-fun b!170982 () Bool)

(assert (=> b!170982 (= lt!263598 (checkBitsLoop!0 (_2!7972 lt!263602) nBits!283 expected!82 (bvadd from!235 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!263594 () Unit!12213)

(declare-fun lt!263597 () Unit!12213)

(assert (=> b!170982 (= lt!263594 lt!263597)))

(declare-fun lt!263601 () (_ BitVec 64))

(declare-fun lt!263599 () (_ BitVec 64))

(assert (=> b!170982 (validate_offset_bits!1 ((_ sign_extend 32) (size!4015 (buf!4458 (_2!7972 lt!263602)))) ((_ sign_extend 32) (currentByte!8451 (_2!7972 lt!263602))) ((_ sign_extend 32) (currentBit!8446 (_2!7972 lt!263602))) (bvsub lt!263601 lt!263599))))

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!7168 BitStream!7168 (_ BitVec 64) (_ BitVec 64)) Unit!12213)

(assert (=> b!170982 (= lt!263597 (validateOffsetBitsIneqLemma!0 bs!64 (_2!7972 lt!263602) lt!263601 lt!263599))))

(assert (=> b!170982 (= lt!263599 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!170982 (= lt!263601 (bvsub nBits!283 from!235))))

(assert (=> b!170982 (= e!119340 (tuple2!14679 (_1!7972 lt!263598) (_2!7972 lt!263598)))))

(declare-fun b!170983 () Bool)

(assert (=> b!170983 (= e!119340 (tuple2!14679 false (_2!7972 lt!263602)))))

(declare-fun b!170984 () Bool)

(declare-fun e!119338 () Bool)

(declare-fun e!119341 () Bool)

(assert (=> b!170984 (= e!119338 e!119341)))

(declare-fun res!141850 () Bool)

(assert (=> b!170984 (=> res!141850 e!119341)))

(declare-fun lt!263593 () tuple2!14678)

(assert (=> b!170984 (= res!141850 (or (not (_1!7972 lt!263593)) (bvsge from!235 nBits!283)))))

(declare-fun b!170985 () Bool)

(assert (=> b!170985 (= e!119341 (= expected!82 (_2!7969 (readBitPure!0 bs!64))))))

(declare-fun b!170986 () Bool)

(assert (=> b!170986 (= e!119339 (tuple2!14679 true bs!64))))

(declare-fun b!170987 () Bool)

(declare-fun res!141852 () Bool)

(assert (=> b!170987 (=> (not res!141852) (not e!119338))))

(assert (=> b!170987 (= res!141852 (and (= (buf!4458 bs!64) (buf!4458 (_2!7972 lt!263593))) (or (not (= nBits!283 from!235)) (_1!7972 lt!263593))))))

(declare-fun b!170988 () Bool)

(declare-fun res!141851 () Bool)

(assert (=> b!170988 (=> (not res!141851) (not e!119338))))

(declare-fun e!119337 () Bool)

(assert (=> b!170988 (= res!141851 e!119337)))

(declare-fun res!141849 () Bool)

(assert (=> b!170988 (=> res!141849 e!119337)))

(assert (=> b!170988 (= res!141849 (not (_1!7972 lt!263593)))))

(declare-fun d!60417 () Bool)

(assert (=> d!60417 e!119338))

(declare-fun res!141848 () Bool)

(assert (=> d!60417 (=> (not res!141848) (not e!119338))))

(declare-fun lt!263596 () (_ BitVec 64))

(assert (=> d!60417 (= res!141848 (bvsge (bvsub lt!263596 from!235) (bitIndex!0 (size!4015 (buf!4458 (_2!7972 lt!263593))) (currentByte!8451 (_2!7972 lt!263593)) (currentBit!8446 (_2!7972 lt!263593)))))))

(assert (=> d!60417 (or (= (bvand lt!263596 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!235 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!263596 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!263596 from!235) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!263595 () (_ BitVec 64))

(assert (=> d!60417 (= lt!263596 (bvadd lt!263595 nBits!283))))

(assert (=> d!60417 (or (not (= (bvand lt!263595 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!283 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!263595 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!263595 nBits!283) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60417 (= lt!263595 (bitIndex!0 (size!4015 (buf!4458 bs!64)) (currentByte!8451 bs!64) (currentBit!8446 bs!64)))))

(assert (=> d!60417 (= lt!263593 e!119339)))

(declare-fun c!8948 () Bool)

(assert (=> d!60417 (= c!8948 (= from!235 nBits!283))))

(assert (=> d!60417 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle nBits!283 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!60417 (= (checkBitsLoop!0 bs!64 nBits!283 expected!82 from!235) lt!263593)))

(declare-fun lt!263603 () (_ BitVec 64))

(declare-fun b!170981 () Bool)

(assert (=> b!170981 (= e!119337 (= (bvsub lt!263603 from!235) (bitIndex!0 (size!4015 (buf!4458 (_2!7972 lt!263593))) (currentByte!8451 (_2!7972 lt!263593)) (currentBit!8446 (_2!7972 lt!263593)))))))

(assert (=> b!170981 (or (= (bvand lt!263603 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!235 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!263603 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!263603 from!235) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!263600 () (_ BitVec 64))

(assert (=> b!170981 (= lt!263603 (bvadd lt!263600 nBits!283))))

(assert (=> b!170981 (or (not (= (bvand lt!263600 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!283 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!263600 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!263600 nBits!283) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!170981 (= lt!263600 (bitIndex!0 (size!4015 (buf!4458 bs!64)) (currentByte!8451 bs!64) (currentBit!8446 bs!64)))))

(assert (= (and d!60417 c!8948) b!170986))

(assert (= (and d!60417 (not c!8948)) b!170980))

(assert (= (and b!170980 c!8949) b!170983))

(assert (= (and b!170980 (not c!8949)) b!170982))

(assert (= (and d!60417 res!141848) b!170987))

(assert (= (and b!170987 res!141852) b!170988))

(assert (= (and b!170988 (not res!141849)) b!170981))

(assert (= (and b!170988 res!141851) b!170984))

(assert (= (and b!170984 (not res!141850)) b!170985))

(declare-fun m!270109 () Bool)

(assert (=> b!170982 m!270109))

(declare-fun m!270111 () Bool)

(assert (=> b!170982 m!270111))

(declare-fun m!270113 () Bool)

(assert (=> b!170982 m!270113))

(declare-fun m!270115 () Bool)

(assert (=> b!170981 m!270115))

(assert (=> b!170981 m!270047))

(assert (=> b!170985 m!270013))

(assert (=> d!60417 m!270115))

(assert (=> d!60417 m!270047))

(assert (=> b!170980 m!270051))

(assert (=> d!60381 d!60417))

(push 1)

(assert (not d!60417))

(assert (not d!60409))

(assert (not b!170980))

(assert (not b!170981))

(assert (not b!170900))

(assert (not d!60401))

(assert (not b!170982))

(assert (not b!170985))

(check-sat)

(pop 1)

(push 1)

(check-sat)

