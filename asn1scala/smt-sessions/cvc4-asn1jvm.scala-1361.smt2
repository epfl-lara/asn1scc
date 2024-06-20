; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37690 () Bool)

(assert start!37690)

(declare-fun res!141774 () Bool)

(declare-fun e!119260 () Bool)

(assert (=> start!37690 (=> (not res!141774) (not e!119260))))

(declare-fun nBits!283 () (_ BitVec 64))

(declare-fun from!235 () (_ BitVec 64))

(assert (=> start!37690 (= res!141774 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle nBits!283 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!235) (bvslt from!235 nBits!283)))))

(assert (=> start!37690 e!119260))

(assert (=> start!37690 true))

(declare-datatypes ((array!9074 0))(
  ( (array!9075 (arr!4947 (Array (_ BitVec 32) (_ BitVec 8))) (size!4017 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7172 0))(
  ( (BitStream!7173 (buf!4460 array!9074) (currentByte!8453 (_ BitVec 32)) (currentBit!8448 (_ BitVec 32))) )
))
(declare-fun bs!64 () BitStream!7172)

(declare-fun e!119259 () Bool)

(declare-fun inv!12 (BitStream!7172) Bool)

(assert (=> start!37690 (and (inv!12 bs!64) e!119259)))

(declare-fun b!170869 () Bool)

(declare-fun res!141773 () Bool)

(assert (=> b!170869 (=> (not res!141773) (not e!119260))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!170869 (= res!141773 (validate_offset_bits!1 ((_ sign_extend 32) (size!4017 (buf!4460 bs!64))) ((_ sign_extend 32) (currentByte!8453 bs!64)) ((_ sign_extend 32) (currentBit!8448 bs!64)) (bvsub nBits!283 from!235)))))

(declare-fun b!170870 () Bool)

(declare-fun moveBitIndexPrecond!0 (BitStream!7172 (_ BitVec 64)) Bool)

(assert (=> b!170870 (= e!119260 (not (moveBitIndexPrecond!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-datatypes ((tuple2!14676 0))(
  ( (tuple2!14677 (_1!7971 BitStream!7172) (_2!7971 Bool)) )
))
(declare-fun lt!263380 () tuple2!14676)

(declare-fun readBitPure!0 (BitStream!7172) tuple2!14676)

(assert (=> b!170870 (= lt!263380 (readBitPure!0 bs!64))))

(declare-fun lt!263381 () tuple2!14676)

(declare-fun expected!82 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!7172 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!14676)

(assert (=> b!170870 (= lt!263381 (checkBitsLoopPure!0 bs!64 nBits!283 expected!82 from!235))))

(declare-fun b!170871 () Bool)

(declare-fun array_inv!3758 (array!9074) Bool)

(assert (=> b!170871 (= e!119259 (array_inv!3758 (buf!4460 bs!64)))))

(assert (= (and start!37690 res!141774) b!170869))

(assert (= (and b!170869 res!141773) b!170870))

(assert (= start!37690 b!170871))

(declare-fun m!270031 () Bool)

(assert (=> start!37690 m!270031))

(declare-fun m!270033 () Bool)

(assert (=> b!170869 m!270033))

(declare-fun m!270035 () Bool)

(assert (=> b!170870 m!270035))

(declare-fun m!270037 () Bool)

(assert (=> b!170870 m!270037))

(declare-fun m!270039 () Bool)

(assert (=> b!170870 m!270039))

(declare-fun m!270041 () Bool)

(assert (=> b!170871 m!270041))

(push 1)

(assert (not start!37690))

(assert (not b!170871))

(assert (not b!170870))

(assert (not b!170869))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!60365 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!60365 (= (inv!12 bs!64) (invariant!0 (currentBit!8448 bs!64) (currentByte!8453 bs!64) (size!4017 (buf!4460 bs!64))))))

(declare-fun bs!15025 () Bool)

(assert (= bs!15025 d!60365))

(declare-fun m!270043 () Bool)

(assert (=> bs!15025 m!270043))

(assert (=> start!37690 d!60365))

(declare-fun d!60367 () Bool)

(assert (=> d!60367 (= (array_inv!3758 (buf!4460 bs!64)) (bvsge (size!4017 (buf!4460 bs!64)) #b00000000000000000000000000000000))))

(assert (=> b!170871 d!60367))

(declare-fun d!60369 () Bool)

(declare-fun res!141780 () Bool)

(declare-fun e!119266 () Bool)

(assert (=> d!60369 (=> (not res!141780) (not e!119266))))

(assert (=> d!60369 (= res!141780 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!4017 (buf!4460 bs!64)))) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4017 (buf!4460 bs!64)))))))))

(assert (=> d!60369 (= (moveBitIndexPrecond!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001) e!119266)))

(declare-fun b!170879 () Bool)

(declare-fun lt!263387 () (_ BitVec 64))

(assert (=> b!170879 (= e!119266 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!263387) (bvsle lt!263387 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4017 (buf!4460 bs!64)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!170879 (= lt!263387 (bvadd (bitIndex!0 (size!4017 (buf!4460 bs!64)) (currentByte!8453 bs!64) (currentBit!8448 bs!64)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and d!60369 res!141780) b!170879))

(declare-fun m!270049 () Bool)

(assert (=> b!170879 m!270049))

(assert (=> b!170870 d!60369))

(declare-fun d!60379 () Bool)

(declare-datatypes ((tuple2!14680 0))(
  ( (tuple2!14681 (_1!7973 Bool) (_2!7973 BitStream!7172)) )
))
(declare-fun lt!263395 () tuple2!14680)

(declare-fun readBit!0 (BitStream!7172) tuple2!14680)

(assert (=> d!60379 (= lt!263395 (readBit!0 bs!64))))

(assert (=> d!60379 (= (readBitPure!0 bs!64) (tuple2!14677 (_2!7973 lt!263395) (_1!7973 lt!263395)))))

(declare-fun bs!15028 () Bool)

(assert (= bs!15028 d!60379))

(declare-fun m!270053 () Bool)

(assert (=> bs!15028 m!270053))

(assert (=> b!170870 d!60379))

(declare-fun d!60383 () Bool)

(declare-fun lt!263405 () tuple2!14680)

(declare-fun checkBitsLoop!0 (BitStream!7172 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!14680)

(assert (=> d!60383 (= lt!263405 (checkBitsLoop!0 bs!64 nBits!283 expected!82 from!235))))

(assert (=> d!60383 (= (checkBitsLoopPure!0 bs!64 nBits!283 expected!82 from!235) (tuple2!14677 (_2!7973 lt!263405) (_1!7973 lt!263405)))))

(declare-fun bs!15032 () Bool)

(assert (= bs!15032 d!60383))

(declare-fun m!270063 () Bool)

(assert (=> bs!15032 m!270063))

(assert (=> b!170870 d!60383))

(declare-fun d!60393 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!60393 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4017 (buf!4460 bs!64))) ((_ sign_extend 32) (currentByte!8453 bs!64)) ((_ sign_extend 32) (currentBit!8448 bs!64)) (bvsub nBits!283 from!235)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4017 (buf!4460 bs!64))) ((_ sign_extend 32) (currentByte!8453 bs!64)) ((_ sign_extend 32) (currentBit!8448 bs!64))) (bvsub nBits!283 from!235)))))

(declare-fun bs!15034 () Bool)

(assert (= bs!15034 d!60393))

(declare-fun m!270067 () Bool)

(assert (=> bs!15034 m!270067))

(assert (=> b!170869 d!60393))

(push 1)

(assert (not b!170879))

(assert (not d!60379))

(assert (not d!60393))

(assert (not d!60365))

(assert (not d!60383))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!170920 () Bool)

(declare-fun e!119302 () tuple2!14680)

(declare-fun e!119304 () tuple2!14680)

(assert (=> b!170920 (= e!119302 e!119304)))

(declare-fun lt!263509 () tuple2!14680)

(assert (=> b!170920 (= lt!263509 (readBit!0 bs!64))))

(declare-fun c!8936 () Bool)

(assert (=> b!170920 (= c!8936 (not (= (_1!7973 lt!263509) expected!82)))))

(declare-fun lt!263513 () tuple2!14680)

(declare-fun b!170921 () Bool)

(assert (=> b!170921 (= lt!263513 (checkBitsLoop!0 (_2!7973 lt!263509) nBits!283 expected!82 (bvadd from!235 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-datatypes ((Unit!12217 0))(
  ( (Unit!12218) )
))
(declare-fun lt!263512 () Unit!12217)

(declare-fun lt!263517 () Unit!12217)

(assert (=> b!170921 (= lt!263512 lt!263517)))

(declare-fun lt!263511 () (_ BitVec 64))

(declare-fun lt!263518 () (_ BitVec 64))

(assert (=> b!170921 (validate_offset_bits!1 ((_ sign_extend 32) (size!4017 (buf!4460 (_2!7973 lt!263509)))) ((_ sign_extend 32) (currentByte!8453 (_2!7973 lt!263509))) ((_ sign_extend 32) (currentBit!8448 (_2!7973 lt!263509))) (bvsub lt!263511 lt!263518))))

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!7172 BitStream!7172 (_ BitVec 64) (_ BitVec 64)) Unit!12217)

(assert (=> b!170921 (= lt!263517 (validateOffsetBitsIneqLemma!0 bs!64 (_2!7973 lt!263509) lt!263511 lt!263518))))

(assert (=> b!170921 (= lt!263518 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!170921 (= lt!263511 (bvsub nBits!283 from!235))))

(assert (=> b!170921 (= e!119304 (tuple2!14681 (_1!7973 lt!263513) (_2!7973 lt!263513)))))

(declare-fun b!170922 () Bool)

(declare-fun e!119301 () Bool)

(assert (=> b!170922 (= e!119301 (= expected!82 (_2!7971 (readBitPure!0 bs!64))))))

(declare-fun b!170923 () Bool)

(assert (=> b!170923 (= e!119302 (tuple2!14681 true bs!64))))

(declare-fun b!170924 () Bool)

(declare-fun res!141813 () Bool)

(declare-fun e!119300 () Bool)

(assert (=> b!170924 (=> (not res!141813) (not e!119300))))

(declare-fun lt!263510 () tuple2!14680)

(assert (=> b!170924 (= res!141813 (and (= (buf!4460 bs!64) (buf!4460 (_2!7973 lt!263510))) (or (not (= nBits!283 from!235)) (_1!7973 lt!263510))))))

(declare-fun b!170925 () Bool)

(declare-fun e!119303 () Bool)

(declare-fun lt!263519 () (_ BitVec 64))

(assert (=> b!170925 (= e!119303 (= (bvsub lt!263519 from!235) (bitIndex!0 (size!4017 (buf!4460 (_2!7973 lt!263510))) (currentByte!8453 (_2!7973 lt!263510)) (currentBit!8448 (_2!7973 lt!263510)))))))

(assert (=> b!170925 (or (= (bvand lt!263519 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!235 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!263519 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!263519 from!235) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!263515 () (_ BitVec 64))

(assert (=> b!170925 (= lt!263519 (bvadd lt!263515 nBits!283))))

(assert (=> b!170925 (or (not (= (bvand lt!263515 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!283 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!263515 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!263515 nBits!283) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!170925 (= lt!263515 (bitIndex!0 (size!4017 (buf!4460 bs!64)) (currentByte!8453 bs!64) (currentBit!8448 bs!64)))))

(declare-fun b!170926 () Bool)

(assert (=> b!170926 (= e!119300 e!119301)))

(declare-fun res!141812 () Bool)

(assert (=> b!170926 (=> res!141812 e!119301)))

(assert (=> b!170926 (= res!141812 (or (not (_1!7973 lt!263510)) (bvsge from!235 nBits!283)))))

(declare-fun d!60407 () Bool)

(assert (=> d!60407 e!119300))

(declare-fun res!141816 () Bool)

(assert (=> d!60407 (=> (not res!141816) (not e!119300))))

(declare-fun lt!263516 () (_ BitVec 64))

(assert (=> d!60407 (= res!141816 (bvsge (bvsub lt!263516 from!235) (bitIndex!0 (size!4017 (buf!4460 (_2!7973 lt!263510))) (currentByte!8453 (_2!7973 lt!263510)) (currentBit!8448 (_2!7973 lt!263510)))))))

(assert (=> d!60407 (or (= (bvand lt!263516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!235 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!263516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!263516 from!235) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!263514 () (_ BitVec 64))

(assert (=> d!60407 (= lt!263516 (bvadd lt!263514 nBits!283))))

(assert (=> d!60407 (or (not (= (bvand lt!263514 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!283 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!263514 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!263514 nBits!283) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60407 (= lt!263514 (bitIndex!0 (size!4017 (buf!4460 bs!64)) (currentByte!8453 bs!64) (currentBit!8448 bs!64)))))

(assert (=> d!60407 (= lt!263510 e!119302)))

(declare-fun c!8937 () Bool)

(assert (=> d!60407 (= c!8937 (= from!235 nBits!283))))

(assert (=> d!60407 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle nBits!283 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!60407 (= (checkBitsLoop!0 bs!64 nBits!283 expected!82 from!235) lt!263510)))

(declare-fun b!170927 () Bool)

(assert (=> b!170927 (= e!119304 (tuple2!14681 false (_2!7973 lt!263509)))))

(declare-fun b!170928 () Bool)

(declare-fun res!141815 () Bool)

(assert (=> b!170928 (=> (not res!141815) (not e!119300))))

(assert (=> b!170928 (= res!141815 e!119303)))

(declare-fun res!141814 () Bool)

(assert (=> b!170928 (=> res!141814 e!119303)))

(assert (=> b!170928 (= res!141814 (not (_1!7973 lt!263510)))))

(assert (= (and d!60407 c!8937) b!170923))

(assert (= (and d!60407 (not c!8937)) b!170920))

(assert (= (and b!170920 c!8936) b!170927))

(assert (= (and b!170920 (not c!8936)) b!170921))

(assert (= (and d!60407 res!141816) b!170924))

(assert (= (and b!170924 res!141813) b!170928))

(assert (= (and b!170928 (not res!141814)) b!170925))

(assert (= (and b!170928 res!141815) b!170926))

(assert (= (and b!170926 (not res!141812)) b!170922))

(declare-fun m!270093 () Bool)

(assert (=> b!170921 m!270093))

(declare-fun m!270095 () Bool)

(assert (=> b!170921 m!270095))

(declare-fun m!270097 () Bool)

(assert (=> b!170921 m!270097))

(assert (=> b!170920 m!270053))

(assert (=> b!170922 m!270037))

(declare-fun m!270099 () Bool)

(assert (=> d!60407 m!270099))

(assert (=> d!60407 m!270049))

(assert (=> b!170925 m!270099))

(assert (=> b!170925 m!270049))

(assert (=> d!60383 d!60407))

(declare-fun d!60419 () Bool)

(declare-fun e!119307 () Bool)

(assert (=> d!60419 e!119307))

(declare-fun res!141821 () Bool)

(assert (=> d!60419 (=> (not res!141821) (not e!119307))))

(declare-fun lt!263533 () (_ BitVec 64))

(declare-fun lt!263532 () (_ BitVec 64))

(declare-fun lt!263535 () (_ BitVec 64))

(assert (=> d!60419 (= res!141821 (= lt!263533 (bvsub lt!263535 lt!263532)))))

(assert (=> d!60419 (or (= (bvand lt!263535 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!263532 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!263535 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!263535 lt!263532) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60419 (= lt!263532 (remainingBits!0 ((_ sign_extend 32) (size!4017 (buf!4460 bs!64))) ((_ sign_extend 32) (currentByte!8453 bs!64)) ((_ sign_extend 32) (currentBit!8448 bs!64))))))

(declare-fun lt!263537 () (_ BitVec 64))

(declare-fun lt!263534 () (_ BitVec 64))

(assert (=> d!60419 (= lt!263535 (bvmul lt!263537 lt!263534))))

(assert (=> d!60419 (or (= lt!263537 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!263534 (bvsdiv (bvmul lt!263537 lt!263534) lt!263537)))))

(assert (=> d!60419 (= lt!263534 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!60419 (= lt!263537 ((_ sign_extend 32) (size!4017 (buf!4460 bs!64))))))

(assert (=> d!60419 (= lt!263533 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8453 bs!64)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8448 bs!64))))))

(assert (=> d!60419 (invariant!0 (currentBit!8448 bs!64) (currentByte!8453 bs!64) (size!4017 (buf!4460 bs!64)))))

(assert (=> d!60419 (= (bitIndex!0 (size!4017 (buf!4460 bs!64)) (currentByte!8453 bs!64) (currentBit!8448 bs!64)) lt!263533)))

(declare-fun b!170933 () Bool)

(declare-fun res!141822 () Bool)

(assert (=> b!170933 (=> (not res!141822) (not e!119307))))

(assert (=> b!170933 (= res!141822 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!263533))))

(declare-fun b!170934 () Bool)

(declare-fun lt!263536 () (_ BitVec 64))

(assert (=> b!170934 (= e!119307 (bvsle lt!263533 (bvmul lt!263536 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!170934 (or (= lt!263536 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!263536 #b0000000000000000000000000000000000000000000000000000000000001000) lt!263536)))))

(assert (=> b!170934 (= lt!263536 ((_ sign_extend 32) (size!4017 (buf!4460 bs!64))))))

(assert (= (and d!60419 res!141821) b!170933))

(assert (= (and b!170933 res!141822) b!170934))

(assert (=> d!60419 m!270067))

(assert (=> d!60419 m!270043))

(assert (=> b!170879 d!60419))

(declare-fun d!60421 () Bool)

(declare-fun e!119344 () Bool)

(assert (=> d!60421 e!119344))

(declare-fun res!141855 () Bool)

(assert (=> d!60421 (=> (not res!141855) (not e!119344))))

(declare-datatypes ((tuple2!14688 0))(
  ( (tuple2!14689 (_1!7977 Unit!12217) (_2!7977 BitStream!7172)) )
))
(declare-fun increaseBitIndex!0 (BitStream!7172) tuple2!14688)

(assert (=> d!60421 (= res!141855 (= (buf!4460 (_2!7977 (increaseBitIndex!0 bs!64))) (buf!4460 bs!64)))))

(declare-fun lt!263624 () Bool)

(assert (=> d!60421 (= lt!263624 (not (= (bvand ((_ sign_extend 24) (select (arr!4947 (buf!4460 bs!64)) (currentByte!8453 bs!64))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8448 bs!64)))) #b00000000000000000000000000000000)))))

(declare-fun lt!263622 () tuple2!14680)

(assert (=> d!60421 (= lt!263622 (tuple2!14681 (not (= (bvand ((_ sign_extend 24) (select (arr!4947 (buf!4460 bs!64)) (currentByte!8453 bs!64))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8448 bs!64)))) #b00000000000000000000000000000000)) (_2!7977 (increaseBitIndex!0 bs!64))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!60421 (validate_offset_bit!0 ((_ sign_extend 32) (size!4017 (buf!4460 bs!64))) ((_ sign_extend 32) (currentByte!8453 bs!64)) ((_ sign_extend 32) (currentBit!8448 bs!64)))))

(assert (=> d!60421 (= (readBit!0 bs!64) lt!263622)))

(declare-fun lt!263620 () (_ BitVec 64))

(declare-fun lt!263619 () (_ BitVec 64))

(declare-fun b!170991 () Bool)

(assert (=> b!170991 (= e!119344 (= (bitIndex!0 (size!4017 (buf!4460 (_2!7977 (increaseBitIndex!0 bs!64)))) (currentByte!8453 (_2!7977 (increaseBitIndex!0 bs!64))) (currentBit!8448 (_2!7977 (increaseBitIndex!0 bs!64)))) (bvadd lt!263619 lt!263620)))))

(assert (=> b!170991 (or (not (= (bvand lt!263619 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!263620 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!263619 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!263619 lt!263620) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!170991 (= lt!263620 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!170991 (= lt!263619 (bitIndex!0 (size!4017 (buf!4460 bs!64)) (currentByte!8453 bs!64) (currentBit!8448 bs!64)))))

(declare-fun lt!263618 () Bool)

(assert (=> b!170991 (= lt!263618 (not (= (bvand ((_ sign_extend 24) (select (arr!4947 (buf!4460 bs!64)) (currentByte!8453 bs!64))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8448 bs!64)))) #b00000000000000000000000000000000)))))

(declare-fun lt!263623 () Bool)

(assert (=> b!170991 (= lt!263623 (not (= (bvand ((_ sign_extend 24) (select (arr!4947 (buf!4460 bs!64)) (currentByte!8453 bs!64))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8448 bs!64)))) #b00000000000000000000000000000000)))))

(declare-fun lt!263621 () Bool)

(assert (=> b!170991 (= lt!263621 (not (= (bvand ((_ sign_extend 24) (select (arr!4947 (buf!4460 bs!64)) (currentByte!8453 bs!64))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8448 bs!64)))) #b00000000000000000000000000000000)))))

(assert (= (and d!60421 res!141855) b!170991))

(declare-fun m!270117 () Bool)

(assert (=> d!60421 m!270117))

(declare-fun m!270119 () Bool)

(assert (=> d!60421 m!270119))

(declare-fun m!270121 () Bool)

(assert (=> d!60421 m!270121))

(declare-fun m!270123 () Bool)

(assert (=> d!60421 m!270123))

(assert (=> b!170991 m!270121))

(assert (=> b!170991 m!270119))

(assert (=> b!170991 m!270049))

(declare-fun m!270125 () Bool)

(assert (=> b!170991 m!270125))

(assert (=> b!170991 m!270117))

(assert (=> d!60379 d!60421))

(declare-fun d!60423 () Bool)

(assert (=> d!60423 (= (invariant!0 (currentBit!8448 bs!64) (currentByte!8453 bs!64) (size!4017 (buf!4460 bs!64))) (and (bvsge (currentBit!8448 bs!64) #b00000000000000000000000000000000) (bvslt (currentBit!8448 bs!64) #b00000000000000000000000000001000) (bvsge (currentByte!8453 bs!64) #b00000000000000000000000000000000) (or (bvslt (currentByte!8453 bs!64) (size!4017 (buf!4460 bs!64))) (and (= (currentBit!8448 bs!64) #b00000000000000000000000000000000) (= (currentByte!8453 bs!64) (size!4017 (buf!4460 bs!64)))))))))

(assert (=> d!60365 d!60423))

(declare-fun d!60425 () Bool)

(assert (=> d!60425 (= (remainingBits!0 ((_ sign_extend 32) (size!4017 (buf!4460 bs!64))) ((_ sign_extend 32) (currentByte!8453 bs!64)) ((_ sign_extend 32) (currentBit!8448 bs!64))) (bvsub (bvmul ((_ sign_extend 32) (size!4017 (buf!4460 bs!64))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8453 bs!64)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8448 bs!64)))))))

(assert (=> d!60393 d!60425))

(push 1)

(assert (not d!60407))

(assert (not b!170922))

(assert (not d!60419))

(assert (not b!170921))

(assert (not b!170925))

(assert (not b!170920))

(assert (not d!60421))

(assert (not b!170991))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

