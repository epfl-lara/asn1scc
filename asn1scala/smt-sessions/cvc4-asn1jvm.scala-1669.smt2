; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46484 () Bool)

(assert start!46484)

(declare-fun b!223410 () Bool)

(declare-fun e!152056 () Bool)

(declare-datatypes ((array!10975 0))(
  ( (array!10976 (arr!5754 (Array (_ BitVec 32) (_ BitVec 8))) (size!4815 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8732 0))(
  ( (BitStream!8733 (buf!5359 array!10975) (currentByte!10056 (_ BitVec 32)) (currentBit!10051 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8732)

(declare-fun array_inv!4556 (array!10975) Bool)

(assert (=> b!223410 (= e!152056 (array_inv!4556 (buf!5359 thiss!1870)))))

(declare-fun res!187543 () Bool)

(declare-fun e!152055 () Bool)

(assert (=> start!46484 (=> (not res!187543) (not e!152055))))

(declare-fun arr!308 () array!10975)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!46484 (= res!187543 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4815 arr!308))))))

(assert (=> start!46484 e!152055))

(assert (=> start!46484 true))

(assert (=> start!46484 (array_inv!4556 arr!308)))

(declare-fun inv!12 (BitStream!8732) Bool)

(assert (=> start!46484 (and (inv!12 thiss!1870) e!152056)))

(declare-fun b!223408 () Bool)

(declare-fun res!187542 () Bool)

(assert (=> b!223408 (=> (not res!187542) (not e!152055))))

(assert (=> b!223408 (= res!187542 (bvslt i!761 to!496))))

(declare-fun b!223407 () Bool)

(declare-fun res!187544 () Bool)

(assert (=> b!223407 (=> (not res!187544) (not e!152055))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!223407 (= res!187544 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4815 (buf!5359 thiss!1870))) ((_ sign_extend 32) (currentByte!10056 thiss!1870)) ((_ sign_extend 32) (currentBit!10051 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!223409 () Bool)

(declare-datatypes ((Unit!16178 0))(
  ( (Unit!16179) )
))
(declare-datatypes ((tuple3!1156 0))(
  ( (tuple3!1157 (_1!10261 Unit!16178) (_2!10261 BitStream!8732) (_3!720 array!10975)) )
))
(declare-fun lt!353138 () tuple3!1156)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!223409 (= e!152055 (not (invariant!0 (currentBit!10051 (_2!10261 lt!353138)) (currentByte!10056 (_2!10261 lt!353138)) (size!4815 (buf!5359 (_2!10261 lt!353138))))))))

(declare-datatypes ((tuple2!19082 0))(
  ( (tuple2!19083 (_1!10262 (_ BitVec 8)) (_2!10262 BitStream!8732)) )
))
(declare-fun lt!353140 () tuple2!19082)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!223409 (= (bitIndex!0 (size!4815 (buf!5359 (_2!10262 lt!353140))) (currentByte!10056 (_2!10262 lt!353140)) (currentBit!10051 (_2!10262 lt!353140))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!4815 (buf!5359 thiss!1870)) (currentByte!10056 thiss!1870) (currentBit!10051 thiss!1870))))))

(declare-fun readByteArrayLoop!0 (BitStream!8732 array!10975 (_ BitVec 32) (_ BitVec 32)) tuple3!1156)

(assert (=> b!223409 (= lt!353138 (readByteArrayLoop!0 (_2!10262 lt!353140) (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!223409 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4815 (buf!5359 (_2!10262 lt!353140)))) ((_ sign_extend 32) (currentByte!10056 (_2!10262 lt!353140))) ((_ sign_extend 32) (currentBit!10051 (_2!10262 lt!353140))) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!353139 () Unit!16178)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8732 BitStream!8732 (_ BitVec 64) (_ BitVec 32)) Unit!16178)

(assert (=> b!223409 (= lt!353139 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10262 lt!353140) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!8732) tuple2!19082)

(assert (=> b!223409 (= lt!353140 (readByte!0 thiss!1870))))

(assert (= (and start!46484 res!187543) b!223407))

(assert (= (and b!223407 res!187544) b!223408))

(assert (= (and b!223408 res!187542) b!223409))

(assert (= start!46484 b!223410))

(declare-fun m!342239 () Bool)

(assert (=> b!223410 m!342239))

(declare-fun m!342241 () Bool)

(assert (=> start!46484 m!342241))

(declare-fun m!342243 () Bool)

(assert (=> start!46484 m!342243))

(declare-fun m!342245 () Bool)

(assert (=> b!223407 m!342245))

(declare-fun m!342247 () Bool)

(assert (=> b!223409 m!342247))

(declare-fun m!342249 () Bool)

(assert (=> b!223409 m!342249))

(declare-fun m!342251 () Bool)

(assert (=> b!223409 m!342251))

(declare-fun m!342253 () Bool)

(assert (=> b!223409 m!342253))

(declare-fun m!342255 () Bool)

(assert (=> b!223409 m!342255))

(declare-fun m!342257 () Bool)

(assert (=> b!223409 m!342257))

(declare-fun m!342259 () Bool)

(assert (=> b!223409 m!342259))

(declare-fun m!342261 () Bool)

(assert (=> b!223409 m!342261))

(push 1)

(assert (not start!46484))

(assert (not b!223407))

(assert (not b!223409))

(assert (not b!223410))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!75684 () Bool)

(assert (=> d!75684 (= (array_inv!4556 arr!308) (bvsge (size!4815 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!46484 d!75684))

(declare-fun d!75686 () Bool)

(assert (=> d!75686 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10051 thiss!1870) (currentByte!10056 thiss!1870) (size!4815 (buf!5359 thiss!1870))))))

(declare-fun bs!18465 () Bool)

(assert (= bs!18465 d!75686))

(declare-fun m!342267 () Bool)

(assert (=> bs!18465 m!342267))

(assert (=> start!46484 d!75686))

(declare-fun d!75688 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!75688 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4815 (buf!5359 thiss!1870))) ((_ sign_extend 32) (currentByte!10056 thiss!1870)) ((_ sign_extend 32) (currentBit!10051 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4815 (buf!5359 thiss!1870))) ((_ sign_extend 32) (currentByte!10056 thiss!1870)) ((_ sign_extend 32) (currentBit!10051 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18466 () Bool)

(assert (= bs!18466 d!75688))

(declare-fun m!342269 () Bool)

(assert (=> bs!18466 m!342269))

(assert (=> b!223407 d!75688))

(declare-fun d!75690 () Bool)

(assert (=> d!75690 (= (invariant!0 (currentBit!10051 (_2!10261 lt!353138)) (currentByte!10056 (_2!10261 lt!353138)) (size!4815 (buf!5359 (_2!10261 lt!353138)))) (and (bvsge (currentBit!10051 (_2!10261 lt!353138)) #b00000000000000000000000000000000) (bvslt (currentBit!10051 (_2!10261 lt!353138)) #b00000000000000000000000000001000) (bvsge (currentByte!10056 (_2!10261 lt!353138)) #b00000000000000000000000000000000) (or (bvslt (currentByte!10056 (_2!10261 lt!353138)) (size!4815 (buf!5359 (_2!10261 lt!353138)))) (and (= (currentBit!10051 (_2!10261 lt!353138)) #b00000000000000000000000000000000) (= (currentByte!10056 (_2!10261 lt!353138)) (size!4815 (buf!5359 (_2!10261 lt!353138))))))))))

(assert (=> b!223409 d!75690))

(declare-fun d!75692 () Bool)

(declare-fun e!152061 () Bool)

(assert (=> d!75692 e!152061))

(declare-fun res!187551 () Bool)

(assert (=> d!75692 (=> (not res!187551) (not e!152061))))

(declare-fun lt!353156 () (_ BitVec 64))

(declare-fun lt!353153 () (_ BitVec 64))

(declare-fun lt!353155 () (_ BitVec 64))

(assert (=> d!75692 (= res!187551 (= lt!353155 (bvsub lt!353153 lt!353156)))))

(assert (=> d!75692 (or (= (bvand lt!353153 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!353156 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!353153 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!353153 lt!353156) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75692 (= lt!353156 (remainingBits!0 ((_ sign_extend 32) (size!4815 (buf!5359 thiss!1870))) ((_ sign_extend 32) (currentByte!10056 thiss!1870)) ((_ sign_extend 32) (currentBit!10051 thiss!1870))))))

(declare-fun lt!353154 () (_ BitVec 64))

(declare-fun lt!353158 () (_ BitVec 64))

(assert (=> d!75692 (= lt!353153 (bvmul lt!353154 lt!353158))))

(assert (=> d!75692 (or (= lt!353154 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!353158 (bvsdiv (bvmul lt!353154 lt!353158) lt!353154)))))

(assert (=> d!75692 (= lt!353158 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!75692 (= lt!353154 ((_ sign_extend 32) (size!4815 (buf!5359 thiss!1870))))))

(assert (=> d!75692 (= lt!353155 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10056 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10051 thiss!1870))))))

(assert (=> d!75692 (invariant!0 (currentBit!10051 thiss!1870) (currentByte!10056 thiss!1870) (size!4815 (buf!5359 thiss!1870)))))

(assert (=> d!75692 (= (bitIndex!0 (size!4815 (buf!5359 thiss!1870)) (currentByte!10056 thiss!1870) (currentBit!10051 thiss!1870)) lt!353155)))

(declare-fun b!223415 () Bool)

(declare-fun res!187550 () Bool)

(assert (=> b!223415 (=> (not res!187550) (not e!152061))))

(assert (=> b!223415 (= res!187550 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!353155))))

(declare-fun b!223416 () Bool)

(declare-fun lt!353157 () (_ BitVec 64))

(assert (=> b!223416 (= e!152061 (bvsle lt!353155 (bvmul lt!353157 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!223416 (or (= lt!353157 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!353157 #b0000000000000000000000000000000000000000000000000000000000001000) lt!353157)))))

(assert (=> b!223416 (= lt!353157 ((_ sign_extend 32) (size!4815 (buf!5359 thiss!1870))))))

(assert (= (and d!75692 res!187551) b!223415))

(assert (= (and b!223415 res!187550) b!223416))

(assert (=> d!75692 m!342269))

(assert (=> d!75692 m!342267))

(assert (=> b!223409 d!75692))

(declare-fun d!75696 () Bool)

(declare-fun e!152064 () Bool)

(assert (=> d!75696 e!152064))

(declare-fun res!187555 () Bool)

(assert (=> d!75696 (=> (not res!187555) (not e!152064))))

(declare-fun lt!353168 () (_ BitVec 64))

(declare-fun lt!353167 () (_ BitVec 64))

(declare-fun lt!353165 () (_ BitVec 64))

(assert (=> d!75696 (= res!187555 (= lt!353167 (bvsub lt!353165 lt!353168)))))

(assert (=> d!75696 (or (= (bvand lt!353165 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!353168 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!353165 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!353165 lt!353168) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75696 (= lt!353168 (remainingBits!0 ((_ sign_extend 32) (size!4815 (buf!5359 (_2!10262 lt!353140)))) ((_ sign_extend 32) (currentByte!10056 (_2!10262 lt!353140))) ((_ sign_extend 32) (currentBit!10051 (_2!10262 lt!353140)))))))

(declare-fun lt!353166 () (_ BitVec 64))

(declare-fun lt!353170 () (_ BitVec 64))

(assert (=> d!75696 (= lt!353165 (bvmul lt!353166 lt!353170))))

(assert (=> d!75696 (or (= lt!353166 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!353170 (bvsdiv (bvmul lt!353166 lt!353170) lt!353166)))))

(assert (=> d!75696 (= lt!353170 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!75696 (= lt!353166 ((_ sign_extend 32) (size!4815 (buf!5359 (_2!10262 lt!353140)))))))

(assert (=> d!75696 (= lt!353167 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10056 (_2!10262 lt!353140))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10051 (_2!10262 lt!353140)))))))

(assert (=> d!75696 (invariant!0 (currentBit!10051 (_2!10262 lt!353140)) (currentByte!10056 (_2!10262 lt!353140)) (size!4815 (buf!5359 (_2!10262 lt!353140))))))

(assert (=> d!75696 (= (bitIndex!0 (size!4815 (buf!5359 (_2!10262 lt!353140))) (currentByte!10056 (_2!10262 lt!353140)) (currentBit!10051 (_2!10262 lt!353140))) lt!353167)))

(declare-fun b!223419 () Bool)

(declare-fun res!187554 () Bool)

(assert (=> b!223419 (=> (not res!187554) (not e!152064))))

(assert (=> b!223419 (= res!187554 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!353167))))

(declare-fun b!223420 () Bool)

(declare-fun lt!353169 () (_ BitVec 64))

(assert (=> b!223420 (= e!152064 (bvsle lt!353167 (bvmul lt!353169 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!223420 (or (= lt!353169 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!353169 #b0000000000000000000000000000000000000000000000000000000000001000) lt!353169)))))

(assert (=> b!223420 (= lt!353169 ((_ sign_extend 32) (size!4815 (buf!5359 (_2!10262 lt!353140)))))))

(assert (= (and d!75696 res!187555) b!223419))

(assert (= (and b!223419 res!187554) b!223420))

(declare-fun m!342271 () Bool)

(assert (=> d!75696 m!342271))

(declare-fun m!342273 () Bool)

(assert (=> d!75696 m!342273))

(assert (=> b!223409 d!75696))

(declare-fun d!75698 () Bool)

(assert (=> d!75698 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4815 (buf!5359 (_2!10262 lt!353140)))) ((_ sign_extend 32) (currentByte!10056 (_2!10262 lt!353140))) ((_ sign_extend 32) (currentBit!10051 (_2!10262 lt!353140))) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4815 (buf!5359 (_2!10262 lt!353140)))) ((_ sign_extend 32) (currentByte!10056 (_2!10262 lt!353140))) ((_ sign_extend 32) (currentBit!10051 (_2!10262 lt!353140)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18467 () Bool)

(assert (= bs!18467 d!75698))

(assert (=> bs!18467 m!342271))

(assert (=> b!223409 d!75698))

(declare-fun b!223449 () Bool)

(declare-fun res!187572 () Bool)

(declare-fun e!152085 () Bool)

(assert (=> b!223449 (=> (not res!187572) (not e!152085))))

(declare-fun lt!353428 () tuple3!1156)

(assert (=> b!223449 (= res!187572 (and (= (buf!5359 (_2!10262 lt!353140)) (buf!5359 (_2!10261 lt!353428))) (= (size!4815 (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308))) (size!4815 (_3!720 lt!353428)))))))

(declare-fun lt!353406 () (_ BitVec 32))

(declare-fun c!11100 () Bool)

(declare-fun lt!353424 () (_ BitVec 32))

(declare-fun bm!3510 () Bool)

(declare-fun lt!353395 () array!10975)

(declare-fun lt!353394 () tuple3!1156)

(declare-fun lt!353405 () array!10975)

(declare-fun lt!353413 () (_ BitVec 32))

(declare-fun call!3517 () Bool)

(declare-fun arrayRangesEq!713 (array!10975 array!10975 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!3510 (= call!3517 (arrayRangesEq!713 (ite c!11100 (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308)) lt!353405) (ite c!11100 (_3!720 lt!353394) lt!353395) (ite c!11100 lt!353424 lt!353406) (ite c!11100 (bvadd #b00000000000000000000000000000001 i!761) lt!353413)))))

(declare-fun b!223450 () Bool)

(declare-fun e!152084 () Bool)

(declare-datatypes ((tuple2!19088 0))(
  ( (tuple2!19089 (_1!10265 BitStream!8732) (_2!10265 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!8732) tuple2!19088)

(assert (=> b!223450 (= e!152084 (= (select (arr!5754 (_3!720 lt!353428)) (bvadd #b00000000000000000000000000000001 i!761)) (_2!10265 (readBytePure!0 (_2!10262 lt!353140)))))))

(assert (=> b!223450 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4815 (_3!720 lt!353428))))))

(declare-fun b!223452 () Bool)

(declare-fun e!152083 () tuple3!1156)

(declare-fun lt!353426 () Unit!16178)

(assert (=> b!223452 (= e!152083 (tuple3!1157 lt!353426 (_2!10261 lt!353394) (_3!720 lt!353394)))))

(declare-fun lt!353409 () tuple2!19082)

(assert (=> b!223452 (= lt!353409 (readByte!0 (_2!10262 lt!353140)))))

(declare-fun lt!353401 () array!10975)

(assert (=> b!223452 (= lt!353401 (array!10976 (store (arr!5754 (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10262 lt!353409)) (size!4815 (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308)))))))

(declare-fun lt!353422 () (_ BitVec 64))

(assert (=> b!223452 (= lt!353422 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!353414 () (_ BitVec 32))

(assert (=> b!223452 (= lt!353414 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!353412 () Unit!16178)

(assert (=> b!223452 (= lt!353412 (validateOffsetBytesFromBitIndexLemma!0 (_2!10262 lt!353140) (_2!10262 lt!353409) lt!353422 lt!353414))))

(assert (=> b!223452 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4815 (buf!5359 (_2!10262 lt!353409)))) ((_ sign_extend 32) (currentByte!10056 (_2!10262 lt!353409))) ((_ sign_extend 32) (currentBit!10051 (_2!10262 lt!353409))) (bvsub lt!353414 ((_ extract 31 0) (bvsdiv (bvadd lt!353422 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!353402 () Unit!16178)

(assert (=> b!223452 (= lt!353402 lt!353412)))

(assert (=> b!223452 (= lt!353394 (readByteArrayLoop!0 (_2!10262 lt!353409) lt!353401 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(declare-fun call!3516 () (_ BitVec 64))

(assert (=> b!223452 (= (bitIndex!0 (size!4815 (buf!5359 (_2!10262 lt!353409))) (currentByte!10056 (_2!10262 lt!353409)) (currentBit!10051 (_2!10262 lt!353409))) (bvadd call!3516 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!353420 () Unit!16178)

(declare-fun Unit!16191 () Unit!16178)

(assert (=> b!223452 (= lt!353420 Unit!16191)))

(assert (=> b!223452 (= (bvadd (bitIndex!0 (size!4815 (buf!5359 (_2!10262 lt!353409))) (currentByte!10056 (_2!10262 lt!353409)) (currentBit!10051 (_2!10262 lt!353409))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4815 (buf!5359 (_2!10261 lt!353394))) (currentByte!10056 (_2!10261 lt!353394)) (currentBit!10051 (_2!10261 lt!353394))))))

(declare-fun lt!353407 () Unit!16178)

(declare-fun Unit!16192 () Unit!16178)

(assert (=> b!223452 (= lt!353407 Unit!16192)))

(assert (=> b!223452 (= (bvadd call!3516 (bvmul ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4815 (buf!5359 (_2!10261 lt!353394))) (currentByte!10056 (_2!10261 lt!353394)) (currentBit!10051 (_2!10261 lt!353394))))))

(declare-fun lt!353425 () Unit!16178)

(declare-fun Unit!16193 () Unit!16178)

(assert (=> b!223452 (= lt!353425 Unit!16193)))

(assert (=> b!223452 (and (= (buf!5359 (_2!10262 lt!353140)) (buf!5359 (_2!10261 lt!353394))) (= (size!4815 (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308))) (size!4815 (_3!720 lt!353394))))))

(declare-fun lt!353403 () Unit!16178)

(declare-fun Unit!16194 () Unit!16178)

(assert (=> b!223452 (= lt!353403 Unit!16194)))

(declare-fun lt!353423 () Unit!16178)

(declare-fun arrayUpdatedAtPrefixLemma!305 (array!10975 (_ BitVec 32) (_ BitVec 8)) Unit!16178)

(assert (=> b!223452 (= lt!353423 (arrayUpdatedAtPrefixLemma!305 (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) (_1!10262 lt!353409)))))

(assert (=> b!223452 (arrayRangesEq!713 (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308)) (array!10976 (store (arr!5754 (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10262 lt!353409)) (size!4815 (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308)))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun lt!353411 () Unit!16178)

(assert (=> b!223452 (= lt!353411 lt!353423)))

(assert (=> b!223452 (= lt!353424 #b00000000000000000000000000000000)))

(declare-fun lt!353396 () Unit!16178)

(declare-fun arrayRangesEqTransitive!199 (array!10975 array!10975 array!10975 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16178)

(assert (=> b!223452 (= lt!353396 (arrayRangesEqTransitive!199 (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308)) lt!353401 (_3!720 lt!353394) lt!353424 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!223452 call!3517))

(declare-fun lt!353404 () Unit!16178)

(assert (=> b!223452 (= lt!353404 lt!353396)))

(declare-fun call!3515 () Bool)

(assert (=> b!223452 call!3515))

(declare-fun lt!353399 () Unit!16178)

(declare-fun Unit!16195 () Unit!16178)

(assert (=> b!223452 (= lt!353399 Unit!16195)))

(declare-fun lt!353421 () Unit!16178)

(declare-fun arrayRangesEqImpliesEq!74 (array!10975 array!10975 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16178)

(assert (=> b!223452 (= lt!353421 (arrayRangesEqImpliesEq!74 lt!353401 (_3!720 lt!353394) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!223452 (= (select (store (arr!5754 (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10262 lt!353409)) (bvadd #b00000000000000000000000000000001 i!761)) (select (arr!5754 (_3!720 lt!353394)) (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!353408 () Unit!16178)

(assert (=> b!223452 (= lt!353408 lt!353421)))

(declare-fun lt!353416 () Bool)

(assert (=> b!223452 (= lt!353416 (= (select (arr!5754 (_3!720 lt!353394)) (bvadd #b00000000000000000000000000000001 i!761)) (_1!10262 lt!353409)))))

(declare-fun Unit!16196 () Unit!16178)

(assert (=> b!223452 (= lt!353426 Unit!16196)))

(assert (=> b!223452 lt!353416))

(declare-fun bm!3511 () Bool)

(assert (=> bm!3511 (= call!3516 (bitIndex!0 (size!4815 (buf!5359 (_2!10262 lt!353140))) (currentByte!10056 (_2!10262 lt!353140)) (currentBit!10051 (_2!10262 lt!353140))))))

(declare-fun b!223451 () Bool)

(assert (=> b!223451 (= e!152085 (arrayRangesEq!713 (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308)) (_3!720 lt!353428) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun d!75700 () Bool)

(assert (=> d!75700 e!152084))

(declare-fun res!187573 () Bool)

(assert (=> d!75700 (=> res!187573 e!152084)))

(assert (=> d!75700 (= res!187573 (bvsge (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!353398 () Bool)

(assert (=> d!75700 (= lt!353398 e!152085)))

(declare-fun res!187574 () Bool)

(assert (=> d!75700 (=> (not res!187574) (not e!152085))))

(declare-fun lt!353417 () (_ BitVec 64))

(declare-fun lt!353427 () (_ BitVec 64))

(assert (=> d!75700 (= res!187574 (= (bvadd lt!353427 lt!353417) (bitIndex!0 (size!4815 (buf!5359 (_2!10261 lt!353428))) (currentByte!10056 (_2!10261 lt!353428)) (currentBit!10051 (_2!10261 lt!353428)))))))

(assert (=> d!75700 (or (not (= (bvand lt!353427 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!353417 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!353427 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!353427 lt!353417) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!353415 () (_ BitVec 64))

(assert (=> d!75700 (= lt!353417 (bvmul lt!353415 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!75700 (or (= lt!353415 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!353415 #b0000000000000000000000000000000000000000000000000000000000001000) lt!353415)))))

(assert (=> d!75700 (= lt!353415 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))))))

(assert (=> d!75700 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b10000000000000000000000000000000)))))

(assert (=> d!75700 (= lt!353427 (bitIndex!0 (size!4815 (buf!5359 (_2!10262 lt!353140))) (currentByte!10056 (_2!10262 lt!353140)) (currentBit!10051 (_2!10262 lt!353140))))))

(assert (=> d!75700 (= lt!353428 e!152083)))

(assert (=> d!75700 (= c!11100 (bvslt (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> d!75700 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) to!496) (bvsle to!496 (size!4815 (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308)))))))

(assert (=> d!75700 (= (readByteArrayLoop!0 (_2!10262 lt!353140) (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496) lt!353428)))

(declare-fun b!223453 () Bool)

(declare-fun lt!353419 () Unit!16178)

(assert (=> b!223453 (= e!152083 (tuple3!1157 lt!353419 (_2!10262 lt!353140) (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308))))))

(assert (=> b!223453 (= call!3516 call!3516)))

(declare-fun lt!353400 () Unit!16178)

(declare-fun Unit!16204 () Unit!16178)

(assert (=> b!223453 (= lt!353400 Unit!16204)))

(declare-fun lt!353429 () Unit!16178)

(declare-fun arrayRangesEqReflexiveLemma!67 (array!10975) Unit!16178)

(assert (=> b!223453 (= lt!353429 (arrayRangesEqReflexiveLemma!67 (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308))))))

(assert (=> b!223453 call!3515))

(declare-fun lt!353418 () Unit!16178)

(assert (=> b!223453 (= lt!353418 lt!353429)))

(assert (=> b!223453 (= lt!353405 (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308)))))

(assert (=> b!223453 (= lt!353395 (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308)))))

(declare-fun lt!353410 () (_ BitVec 32))

(assert (=> b!223453 (= lt!353410 #b00000000000000000000000000000000)))

(declare-fun lt!353397 () (_ BitVec 32))

(assert (=> b!223453 (= lt!353397 (size!4815 (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308))))))

(assert (=> b!223453 (= lt!353406 #b00000000000000000000000000000000)))

(assert (=> b!223453 (= lt!353413 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun arrayRangesEqSlicedLemma!67 (array!10975 array!10975 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16178)

(assert (=> b!223453 (= lt!353419 (arrayRangesEqSlicedLemma!67 lt!353405 lt!353395 lt!353410 lt!353397 lt!353406 lt!353413))))

(assert (=> b!223453 call!3517))

(declare-fun bm!3512 () Bool)

(assert (=> bm!3512 (= call!3515 (arrayRangesEq!713 (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308)) (ite c!11100 (_3!720 lt!353394) (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308))) #b00000000000000000000000000000000 (ite c!11100 (bvadd #b00000000000000000000000000000001 i!761) (size!4815 (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308))))))))

(assert (= (and d!75700 c!11100) b!223452))

(assert (= (and d!75700 (not c!11100)) b!223453))

(assert (= (or b!223452 b!223453) bm!3510))

(assert (= (or b!223452 b!223453) bm!3512))

(assert (= (or b!223452 b!223453) bm!3511))

(assert (= (and d!75700 res!187574) b!223449))

(assert (= (and b!223449 res!187572) b!223451))

(assert (= (and d!75700 (not res!187573)) b!223450))

(declare-fun m!342283 () Bool)

(assert (=> b!223451 m!342283))

(declare-fun m!342285 () Bool)

(assert (=> d!75700 m!342285))

(assert (=> d!75700 m!342255))

(declare-fun m!342287 () Bool)

(assert (=> b!223453 m!342287))

(declare-fun m!342289 () Bool)

(assert (=> b!223453 m!342289))

(declare-fun m!342291 () Bool)

(assert (=> bm!3512 m!342291))

(declare-fun m!342293 () Bool)

(assert (=> b!223452 m!342293))

(declare-fun m!342295 () Bool)

(assert (=> b!223452 m!342295))

(declare-fun m!342297 () Bool)

(assert (=> b!223452 m!342297))

(declare-fun m!342299 () Bool)

(assert (=> b!223452 m!342299))

(declare-fun m!342301 () Bool)

(assert (=> b!223452 m!342301))

(declare-fun m!342303 () Bool)

(assert (=> b!223452 m!342303))

(declare-fun m!342305 () Bool)

(assert (=> b!223452 m!342305))

(declare-fun m!342307 () Bool)

(assert (=> b!223452 m!342307))

(declare-fun m!342309 () Bool)

(assert (=> b!223452 m!342309))

(declare-fun m!342311 () Bool)

(assert (=> b!223452 m!342311))

(declare-fun m!342313 () Bool)

(assert (=> b!223452 m!342313))

(declare-fun m!342315 () Bool)

(assert (=> b!223452 m!342315))

(declare-fun m!342317 () Bool)

(assert (=> b!223452 m!342317))

(declare-fun m!342319 () Bool)

(assert (=> b!223450 m!342319))

(declare-fun m!342321 () Bool)

(assert (=> b!223450 m!342321))

(assert (=> bm!3511 m!342255))

(declare-fun m!342323 () Bool)

(assert (=> bm!3510 m!342323))

(assert (=> b!223409 d!75700))

(declare-fun d!75704 () Bool)

(declare-fun lt!353549 () (_ BitVec 8))

(declare-fun lt!353550 () (_ BitVec 8))

(assert (=> d!75704 (= lt!353549 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5754 (buf!5359 thiss!1870)) (currentByte!10056 thiss!1870))) ((_ sign_extend 24) lt!353550))))))

(assert (=> d!75704 (= lt!353550 ((_ extract 7 0) (currentBit!10051 thiss!1870)))))

(declare-fun e!152104 () Bool)

(assert (=> d!75704 e!152104))

(declare-fun res!187602 () Bool)

(assert (=> d!75704 (=> (not res!187602) (not e!152104))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!75704 (= res!187602 (validate_offset_bits!1 ((_ sign_extend 32) (size!4815 (buf!5359 thiss!1870))) ((_ sign_extend 32) (currentByte!10056 thiss!1870)) ((_ sign_extend 32) (currentBit!10051 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!19094 0))(
  ( (tuple2!19095 (_1!10268 Unit!16178) (_2!10268 (_ BitVec 8))) )
))
(declare-fun Unit!16209 () Unit!16178)

(declare-fun Unit!16210 () Unit!16178)

(assert (=> d!75704 (= (readByte!0 thiss!1870) (tuple2!19083 (_2!10268 (ite (bvsgt ((_ sign_extend 24) lt!353550) #b00000000000000000000000000000000) (tuple2!19095 Unit!16209 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!353549) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5754 (buf!5359 thiss!1870)) (bvadd (currentByte!10056 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!353550)))))))) (tuple2!19095 Unit!16210 lt!353549))) (BitStream!8733 (buf!5359 thiss!1870) (bvadd (currentByte!10056 thiss!1870) #b00000000000000000000000000000001) (currentBit!10051 thiss!1870))))))

(declare-fun b!223482 () Bool)

(declare-fun e!152105 () Bool)

(assert (=> b!223482 (= e!152104 e!152105)))

(declare-fun res!187601 () Bool)

(assert (=> b!223482 (=> (not res!187601) (not e!152105))))

(declare-fun lt!353551 () tuple2!19082)

(assert (=> b!223482 (= res!187601 (= (buf!5359 (_2!10262 lt!353551)) (buf!5359 thiss!1870)))))

(declare-fun lt!353552 () (_ BitVec 8))

(declare-fun lt!353548 () (_ BitVec 8))

(declare-fun Unit!16211 () Unit!16178)

(declare-fun Unit!16212 () Unit!16178)

(assert (=> b!223482 (= lt!353551 (tuple2!19083 (_2!10268 (ite (bvsgt ((_ sign_extend 24) lt!353552) #b00000000000000000000000000000000) (tuple2!19095 Unit!16211 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!353548) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5754 (buf!5359 thiss!1870)) (bvadd (currentByte!10056 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!353552)))))))) (tuple2!19095 Unit!16212 lt!353548))) (BitStream!8733 (buf!5359 thiss!1870) (bvadd (currentByte!10056 thiss!1870) #b00000000000000000000000000000001) (currentBit!10051 thiss!1870))))))

(assert (=> b!223482 (= lt!353548 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5754 (buf!5359 thiss!1870)) (currentByte!10056 thiss!1870))) ((_ sign_extend 24) lt!353552))))))

(assert (=> b!223482 (= lt!353552 ((_ extract 7 0) (currentBit!10051 thiss!1870)))))

(declare-fun lt!353553 () (_ BitVec 64))

(declare-fun b!223483 () Bool)

(declare-fun lt!353554 () (_ BitVec 64))

(assert (=> b!223483 (= e!152105 (= (bitIndex!0 (size!4815 (buf!5359 (_2!10262 lt!353551))) (currentByte!10056 (_2!10262 lt!353551)) (currentBit!10051 (_2!10262 lt!353551))) (bvadd lt!353553 lt!353554)))))

(assert (=> b!223483 (or (not (= (bvand lt!353553 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!353554 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!353553 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!353553 lt!353554) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!223483 (= lt!353554 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!223483 (= lt!353553 (bitIndex!0 (size!4815 (buf!5359 thiss!1870)) (currentByte!10056 thiss!1870) (currentBit!10051 thiss!1870)))))

(assert (= (and d!75704 res!187602) b!223482))

(assert (= (and b!223482 res!187601) b!223483))

(declare-fun m!342413 () Bool)

(assert (=> d!75704 m!342413))

(declare-fun m!342415 () Bool)

(assert (=> d!75704 m!342415))

(declare-fun m!342417 () Bool)

(assert (=> d!75704 m!342417))

(assert (=> b!223482 m!342417))

(assert (=> b!223482 m!342413))

(declare-fun m!342419 () Bool)

(assert (=> b!223483 m!342419))

(assert (=> b!223483 m!342257))

(assert (=> b!223409 d!75704))

(declare-fun d!75717 () Bool)

(declare-fun e!152115 () Bool)

(assert (=> d!75717 e!152115))

(declare-fun res!187612 () Bool)

(assert (=> d!75717 (=> (not res!187612) (not e!152115))))

(assert (=> d!75717 (= res!187612 (and (or (let ((rhs!3680 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3680 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3680) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!75724 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!75724 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!75724 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3679 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3679 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3679) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!353586 () Unit!16178)

(declare-fun choose!57 (BitStream!8732 BitStream!8732 (_ BitVec 64) (_ BitVec 32)) Unit!16178)

(assert (=> d!75717 (= lt!353586 (choose!57 thiss!1870 (_2!10262 lt!353140) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> d!75717 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10262 lt!353140) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)) lt!353586)))

(declare-fun b!223493 () Bool)

(declare-fun lt!353584 () (_ BitVec 32))

(assert (=> b!223493 (= e!152115 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4815 (buf!5359 (_2!10262 lt!353140)))) ((_ sign_extend 32) (currentByte!10056 (_2!10262 lt!353140))) ((_ sign_extend 32) (currentBit!10051 (_2!10262 lt!353140))) (bvsub (bvsub to!496 i!761) lt!353584)))))

(assert (=> b!223493 (or (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand lt!353584 #b10000000000000000000000000000000)) (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!496 i!761) lt!353584) #b10000000000000000000000000000000)))))

(declare-fun lt!353585 () (_ BitVec 64))

(assert (=> b!223493 (= lt!353584 ((_ extract 31 0) lt!353585))))

(assert (=> b!223493 (and (bvslt lt!353585 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!353585 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!223493 (= lt!353585 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!75717 res!187612) b!223493))

(declare-fun m!342425 () Bool)

(assert (=> d!75717 m!342425))

(declare-fun m!342427 () Bool)

(assert (=> b!223493 m!342427))

(assert (=> b!223409 d!75717))

(declare-fun d!75726 () Bool)

(assert (=> d!75726 (= (array_inv!4556 (buf!5359 thiss!1870)) (bvsge (size!4815 (buf!5359 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!223410 d!75726))

(push 1)

(assert (not d!75698))

(assert (not b!223483))

(assert (not b!223450))

(assert (not bm!3511))

(assert (not d!75700))

(assert (not d!75686))

(assert (not d!75717))

(assert (not d!75692))

(assert (not d!75696))

(assert (not bm!3512))

(assert (not b!223453))

(assert (not b!223452))

(assert (not d!75688))

(assert (not b!223493))

(assert (not bm!3510))

(assert (not b!223451))

(assert (not d!75704))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!75797 () Bool)

(assert (=> d!75797 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4815 (buf!5359 (_2!10262 lt!353140)))) ((_ sign_extend 32) (currentByte!10056 (_2!10262 lt!353140))) ((_ sign_extend 32) (currentBit!10051 (_2!10262 lt!353140))) (bvsub (bvsub to!496 i!761) lt!353584)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!496 i!761) lt!353584)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4815 (buf!5359 (_2!10262 lt!353140)))) ((_ sign_extend 32) (currentByte!10056 (_2!10262 lt!353140))) ((_ sign_extend 32) (currentBit!10051 (_2!10262 lt!353140)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18481 () Bool)

(assert (= bs!18481 d!75797))

(assert (=> bs!18481 m!342271))

(assert (=> b!223493 d!75797))

(declare-fun d!75799 () Bool)

(assert (=> d!75799 (= (remainingBits!0 ((_ sign_extend 32) (size!4815 (buf!5359 thiss!1870))) ((_ sign_extend 32) (currentByte!10056 thiss!1870)) ((_ sign_extend 32) (currentBit!10051 thiss!1870))) (bvsub (bvmul ((_ sign_extend 32) (size!4815 (buf!5359 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10056 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10051 thiss!1870)))))))

(assert (=> d!75688 d!75799))

(declare-fun d!75801 () Bool)

(declare-fun e!152150 () Bool)

(assert (=> d!75801 e!152150))

(declare-fun res!187656 () Bool)

(assert (=> d!75801 (=> (not res!187656) (not e!152150))))

(declare-fun lt!353718 () (_ BitVec 64))

(declare-fun lt!353715 () (_ BitVec 64))

(declare-fun lt!353717 () (_ BitVec 64))

(assert (=> d!75801 (= res!187656 (= lt!353717 (bvsub lt!353715 lt!353718)))))

(assert (=> d!75801 (or (= (bvand lt!353715 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!353718 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!353715 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!353715 lt!353718) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75801 (= lt!353718 (remainingBits!0 ((_ sign_extend 32) (size!4815 (buf!5359 (_2!10262 lt!353551)))) ((_ sign_extend 32) (currentByte!10056 (_2!10262 lt!353551))) ((_ sign_extend 32) (currentBit!10051 (_2!10262 lt!353551)))))))

(declare-fun lt!353716 () (_ BitVec 64))

(declare-fun lt!353720 () (_ BitVec 64))

(assert (=> d!75801 (= lt!353715 (bvmul lt!353716 lt!353720))))

(assert (=> d!75801 (or (= lt!353716 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!353720 (bvsdiv (bvmul lt!353716 lt!353720) lt!353716)))))

(assert (=> d!75801 (= lt!353720 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!75801 (= lt!353716 ((_ sign_extend 32) (size!4815 (buf!5359 (_2!10262 lt!353551)))))))

(assert (=> d!75801 (= lt!353717 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10056 (_2!10262 lt!353551))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10051 (_2!10262 lt!353551)))))))

(assert (=> d!75801 (invariant!0 (currentBit!10051 (_2!10262 lt!353551)) (currentByte!10056 (_2!10262 lt!353551)) (size!4815 (buf!5359 (_2!10262 lt!353551))))))

(assert (=> d!75801 (= (bitIndex!0 (size!4815 (buf!5359 (_2!10262 lt!353551))) (currentByte!10056 (_2!10262 lt!353551)) (currentBit!10051 (_2!10262 lt!353551))) lt!353717)))

(declare-fun b!223538 () Bool)

(declare-fun res!187655 () Bool)

(assert (=> b!223538 (=> (not res!187655) (not e!152150))))

(assert (=> b!223538 (= res!187655 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!353717))))

(declare-fun b!223539 () Bool)

(declare-fun lt!353719 () (_ BitVec 64))

(assert (=> b!223539 (= e!152150 (bvsle lt!353717 (bvmul lt!353719 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!223539 (or (= lt!353719 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!353719 #b0000000000000000000000000000000000000000000000000000000000001000) lt!353719)))))

(assert (=> b!223539 (= lt!353719 ((_ sign_extend 32) (size!4815 (buf!5359 (_2!10262 lt!353551)))))))

(assert (= (and d!75801 res!187656) b!223538))

(assert (= (and b!223538 res!187655) b!223539))

(declare-fun m!342561 () Bool)

(assert (=> d!75801 m!342561))

(declare-fun m!342563 () Bool)

(assert (=> d!75801 m!342563))

(assert (=> b!223483 d!75801))

(assert (=> b!223483 d!75692))

(declare-fun d!75803 () Bool)

(assert (=> d!75803 (= (remainingBits!0 ((_ sign_extend 32) (size!4815 (buf!5359 (_2!10262 lt!353140)))) ((_ sign_extend 32) (currentByte!10056 (_2!10262 lt!353140))) ((_ sign_extend 32) (currentBit!10051 (_2!10262 lt!353140)))) (bvsub (bvmul ((_ sign_extend 32) (size!4815 (buf!5359 (_2!10262 lt!353140)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10056 (_2!10262 lt!353140))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10051 (_2!10262 lt!353140))))))))

(assert (=> d!75696 d!75803))

(declare-fun d!75805 () Bool)

(assert (=> d!75805 (= (invariant!0 (currentBit!10051 (_2!10262 lt!353140)) (currentByte!10056 (_2!10262 lt!353140)) (size!4815 (buf!5359 (_2!10262 lt!353140)))) (and (bvsge (currentBit!10051 (_2!10262 lt!353140)) #b00000000000000000000000000000000) (bvslt (currentBit!10051 (_2!10262 lt!353140)) #b00000000000000000000000000001000) (bvsge (currentByte!10056 (_2!10262 lt!353140)) #b00000000000000000000000000000000) (or (bvslt (currentByte!10056 (_2!10262 lt!353140)) (size!4815 (buf!5359 (_2!10262 lt!353140)))) (and (= (currentBit!10051 (_2!10262 lt!353140)) #b00000000000000000000000000000000) (= (currentByte!10056 (_2!10262 lt!353140)) (size!4815 (buf!5359 (_2!10262 lt!353140))))))))))

(assert (=> d!75696 d!75805))

(declare-fun d!75807 () Bool)

(declare-fun res!187661 () Bool)

(declare-fun e!152155 () Bool)

(assert (=> d!75807 (=> res!187661 e!152155)))

(assert (=> d!75807 (= res!187661 (= (ite c!11100 lt!353424 lt!353406) (ite c!11100 (bvadd #b00000000000000000000000000000001 i!761) lt!353413)))))

(assert (=> d!75807 (= (arrayRangesEq!713 (ite c!11100 (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308)) lt!353405) (ite c!11100 (_3!720 lt!353394) lt!353395) (ite c!11100 lt!353424 lt!353406) (ite c!11100 (bvadd #b00000000000000000000000000000001 i!761) lt!353413)) e!152155)))

(declare-fun b!223544 () Bool)

(declare-fun e!152156 () Bool)

(assert (=> b!223544 (= e!152155 e!152156)))

(declare-fun res!187662 () Bool)

(assert (=> b!223544 (=> (not res!187662) (not e!152156))))

(assert (=> b!223544 (= res!187662 (= (select (arr!5754 (ite c!11100 (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308)) lt!353405)) (ite c!11100 lt!353424 lt!353406)) (select (arr!5754 (ite c!11100 (_3!720 lt!353394) lt!353395)) (ite c!11100 lt!353424 lt!353406))))))

(declare-fun b!223545 () Bool)

(assert (=> b!223545 (= e!152156 (arrayRangesEq!713 (ite c!11100 (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308)) lt!353405) (ite c!11100 (_3!720 lt!353394) lt!353395) (bvadd (ite c!11100 lt!353424 lt!353406) #b00000000000000000000000000000001) (ite c!11100 (bvadd #b00000000000000000000000000000001 i!761) lt!353413)))))

(assert (= (and d!75807 (not res!187661)) b!223544))

(assert (= (and b!223544 res!187662) b!223545))

(declare-fun m!342565 () Bool)

(assert (=> b!223544 m!342565))

(declare-fun m!342567 () Bool)

(assert (=> b!223544 m!342567))

(declare-fun m!342569 () Bool)

(assert (=> b!223545 m!342569))

(assert (=> bm!3510 d!75807))

(declare-fun d!75809 () Bool)

(assert (=> d!75809 (= (invariant!0 (currentBit!10051 thiss!1870) (currentByte!10056 thiss!1870) (size!4815 (buf!5359 thiss!1870))) (and (bvsge (currentBit!10051 thiss!1870) #b00000000000000000000000000000000) (bvslt (currentBit!10051 thiss!1870) #b00000000000000000000000000001000) (bvsge (currentByte!10056 thiss!1870) #b00000000000000000000000000000000) (or (bvslt (currentByte!10056 thiss!1870) (size!4815 (buf!5359 thiss!1870))) (and (= (currentBit!10051 thiss!1870) #b00000000000000000000000000000000) (= (currentByte!10056 thiss!1870) (size!4815 (buf!5359 thiss!1870)))))))))

(assert (=> d!75686 d!75809))

(declare-fun d!75811 () Bool)

(declare-fun lt!353723 () tuple2!19082)

(assert (=> d!75811 (= lt!353723 (readByte!0 (_2!10262 lt!353140)))))

(assert (=> d!75811 (= (readBytePure!0 (_2!10262 lt!353140)) (tuple2!19089 (_2!10262 lt!353723) (_1!10262 lt!353723)))))

(declare-fun bs!18482 () Bool)

(assert (= bs!18482 d!75811))

(assert (=> bs!18482 m!342295))

(assert (=> b!223450 d!75811))

(declare-fun d!75813 () Bool)

(declare-fun e!152157 () Bool)

(assert (=> d!75813 e!152157))

(declare-fun res!187664 () Bool)

(assert (=> d!75813 (=> (not res!187664) (not e!152157))))

(declare-fun lt!353724 () (_ BitVec 64))

(declare-fun lt!353726 () (_ BitVec 64))

(declare-fun lt!353727 () (_ BitVec 64))

(assert (=> d!75813 (= res!187664 (= lt!353726 (bvsub lt!353724 lt!353727)))))

(assert (=> d!75813 (or (= (bvand lt!353724 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!353727 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!353724 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!353724 lt!353727) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75813 (= lt!353727 (remainingBits!0 ((_ sign_extend 32) (size!4815 (buf!5359 (_2!10261 lt!353428)))) ((_ sign_extend 32) (currentByte!10056 (_2!10261 lt!353428))) ((_ sign_extend 32) (currentBit!10051 (_2!10261 lt!353428)))))))

(declare-fun lt!353725 () (_ BitVec 64))

(declare-fun lt!353729 () (_ BitVec 64))

(assert (=> d!75813 (= lt!353724 (bvmul lt!353725 lt!353729))))

(assert (=> d!75813 (or (= lt!353725 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!353729 (bvsdiv (bvmul lt!353725 lt!353729) lt!353725)))))

(assert (=> d!75813 (= lt!353729 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!75813 (= lt!353725 ((_ sign_extend 32) (size!4815 (buf!5359 (_2!10261 lt!353428)))))))

(assert (=> d!75813 (= lt!353726 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10056 (_2!10261 lt!353428))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10051 (_2!10261 lt!353428)))))))

(assert (=> d!75813 (invariant!0 (currentBit!10051 (_2!10261 lt!353428)) (currentByte!10056 (_2!10261 lt!353428)) (size!4815 (buf!5359 (_2!10261 lt!353428))))))

(assert (=> d!75813 (= (bitIndex!0 (size!4815 (buf!5359 (_2!10261 lt!353428))) (currentByte!10056 (_2!10261 lt!353428)) (currentBit!10051 (_2!10261 lt!353428))) lt!353726)))

(declare-fun b!223546 () Bool)

(declare-fun res!187663 () Bool)

(assert (=> b!223546 (=> (not res!187663) (not e!152157))))

(assert (=> b!223546 (= res!187663 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!353726))))

(declare-fun b!223547 () Bool)

(declare-fun lt!353728 () (_ BitVec 64))

(assert (=> b!223547 (= e!152157 (bvsle lt!353726 (bvmul lt!353728 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!223547 (or (= lt!353728 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!353728 #b0000000000000000000000000000000000000000000000000000000000001000) lt!353728)))))

(assert (=> b!223547 (= lt!353728 ((_ sign_extend 32) (size!4815 (buf!5359 (_2!10261 lt!353428)))))))

(assert (= (and d!75813 res!187664) b!223546))

(assert (= (and b!223546 res!187663) b!223547))

(declare-fun m!342571 () Bool)

(assert (=> d!75813 m!342571))

(declare-fun m!342573 () Bool)

(assert (=> d!75813 m!342573))

(assert (=> d!75700 d!75813))

(assert (=> d!75700 d!75696))

(declare-fun d!75815 () Bool)

(declare-fun res!187665 () Bool)

(declare-fun e!152158 () Bool)

(assert (=> d!75815 (=> res!187665 e!152158)))

(assert (=> d!75815 (= res!187665 (= #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!75815 (= (arrayRangesEq!713 (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308)) (_3!720 lt!353428) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) e!152158)))

(declare-fun b!223548 () Bool)

(declare-fun e!152159 () Bool)

(assert (=> b!223548 (= e!152158 e!152159)))

(declare-fun res!187666 () Bool)

(assert (=> b!223548 (=> (not res!187666) (not e!152159))))

(assert (=> b!223548 (= res!187666 (= (select (arr!5754 (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308))) #b00000000000000000000000000000000) (select (arr!5754 (_3!720 lt!353428)) #b00000000000000000000000000000000)))))

(declare-fun b!223549 () Bool)

(assert (=> b!223549 (= e!152159 (arrayRangesEq!713 (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308)) (_3!720 lt!353428) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (= (and d!75815 (not res!187665)) b!223548))

(assert (= (and b!223548 res!187666) b!223549))

(declare-fun m!342575 () Bool)

(assert (=> b!223548 m!342575))

(declare-fun m!342577 () Bool)

(assert (=> b!223548 m!342577))

(declare-fun m!342579 () Bool)

(assert (=> b!223549 m!342579))

(assert (=> b!223451 d!75815))

(declare-fun d!75817 () Bool)

(declare-fun lt!353731 () (_ BitVec 8))

(declare-fun lt!353732 () (_ BitVec 8))

(assert (=> d!75817 (= lt!353731 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5754 (buf!5359 (_2!10262 lt!353140))) (currentByte!10056 (_2!10262 lt!353140)))) ((_ sign_extend 24) lt!353732))))))

(assert (=> d!75817 (= lt!353732 ((_ extract 7 0) (currentBit!10051 (_2!10262 lt!353140))))))

(declare-fun e!152160 () Bool)

(assert (=> d!75817 e!152160))

(declare-fun res!187668 () Bool)

(assert (=> d!75817 (=> (not res!187668) (not e!152160))))

(assert (=> d!75817 (= res!187668 (validate_offset_bits!1 ((_ sign_extend 32) (size!4815 (buf!5359 (_2!10262 lt!353140)))) ((_ sign_extend 32) (currentByte!10056 (_2!10262 lt!353140))) ((_ sign_extend 32) (currentBit!10051 (_2!10262 lt!353140))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!16224 () Unit!16178)

(declare-fun Unit!16225 () Unit!16178)

(assert (=> d!75817 (= (readByte!0 (_2!10262 lt!353140)) (tuple2!19083 (_2!10268 (ite (bvsgt ((_ sign_extend 24) lt!353732) #b00000000000000000000000000000000) (tuple2!19095 Unit!16224 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!353731) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5754 (buf!5359 (_2!10262 lt!353140))) (bvadd (currentByte!10056 (_2!10262 lt!353140)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!353732)))))))) (tuple2!19095 Unit!16225 lt!353731))) (BitStream!8733 (buf!5359 (_2!10262 lt!353140)) (bvadd (currentByte!10056 (_2!10262 lt!353140)) #b00000000000000000000000000000001) (currentBit!10051 (_2!10262 lt!353140)))))))

(declare-fun b!223550 () Bool)

(declare-fun e!152161 () Bool)

(assert (=> b!223550 (= e!152160 e!152161)))

(declare-fun res!187667 () Bool)

(assert (=> b!223550 (=> (not res!187667) (not e!152161))))

(declare-fun lt!353733 () tuple2!19082)

(assert (=> b!223550 (= res!187667 (= (buf!5359 (_2!10262 lt!353733)) (buf!5359 (_2!10262 lt!353140))))))

(declare-fun lt!353734 () (_ BitVec 8))

(declare-fun lt!353730 () (_ BitVec 8))

(declare-fun Unit!16226 () Unit!16178)

(declare-fun Unit!16227 () Unit!16178)

(assert (=> b!223550 (= lt!353733 (tuple2!19083 (_2!10268 (ite (bvsgt ((_ sign_extend 24) lt!353734) #b00000000000000000000000000000000) (tuple2!19095 Unit!16226 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!353730) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5754 (buf!5359 (_2!10262 lt!353140))) (bvadd (currentByte!10056 (_2!10262 lt!353140)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!353734)))))))) (tuple2!19095 Unit!16227 lt!353730))) (BitStream!8733 (buf!5359 (_2!10262 lt!353140)) (bvadd (currentByte!10056 (_2!10262 lt!353140)) #b00000000000000000000000000000001) (currentBit!10051 (_2!10262 lt!353140)))))))

(assert (=> b!223550 (= lt!353730 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5754 (buf!5359 (_2!10262 lt!353140))) (currentByte!10056 (_2!10262 lt!353140)))) ((_ sign_extend 24) lt!353734))))))

(assert (=> b!223550 (= lt!353734 ((_ extract 7 0) (currentBit!10051 (_2!10262 lt!353140))))))

(declare-fun lt!353735 () (_ BitVec 64))

(declare-fun lt!353736 () (_ BitVec 64))

(declare-fun b!223551 () Bool)

(assert (=> b!223551 (= e!152161 (= (bitIndex!0 (size!4815 (buf!5359 (_2!10262 lt!353733))) (currentByte!10056 (_2!10262 lt!353733)) (currentBit!10051 (_2!10262 lt!353733))) (bvadd lt!353735 lt!353736)))))

(assert (=> b!223551 (or (not (= (bvand lt!353735 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!353736 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!353735 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!353735 lt!353736) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!223551 (= lt!353736 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!223551 (= lt!353735 (bitIndex!0 (size!4815 (buf!5359 (_2!10262 lt!353140))) (currentByte!10056 (_2!10262 lt!353140)) (currentBit!10051 (_2!10262 lt!353140))))))

(assert (= (and d!75817 res!187668) b!223550))

(assert (= (and b!223550 res!187667) b!223551))

(declare-fun m!342581 () Bool)

(assert (=> d!75817 m!342581))

(declare-fun m!342583 () Bool)

(assert (=> d!75817 m!342583))

(declare-fun m!342585 () Bool)

(assert (=> d!75817 m!342585))

(assert (=> b!223550 m!342585))

(assert (=> b!223550 m!342581))

(declare-fun m!342587 () Bool)

(assert (=> b!223551 m!342587))

(assert (=> b!223551 m!342255))

(assert (=> b!223452 d!75817))

(declare-fun d!75819 () Bool)

(declare-fun e!152162 () Bool)

(assert (=> d!75819 e!152162))

(declare-fun res!187670 () Bool)

(assert (=> d!75819 (=> (not res!187670) (not e!152162))))

(declare-fun lt!353740 () (_ BitVec 64))

(declare-fun lt!353737 () (_ BitVec 64))

(declare-fun lt!353739 () (_ BitVec 64))

(assert (=> d!75819 (= res!187670 (= lt!353739 (bvsub lt!353737 lt!353740)))))

(assert (=> d!75819 (or (= (bvand lt!353737 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!353740 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!353737 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!353737 lt!353740) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75819 (= lt!353740 (remainingBits!0 ((_ sign_extend 32) (size!4815 (buf!5359 (_2!10262 lt!353409)))) ((_ sign_extend 32) (currentByte!10056 (_2!10262 lt!353409))) ((_ sign_extend 32) (currentBit!10051 (_2!10262 lt!353409)))))))

(declare-fun lt!353738 () (_ BitVec 64))

(declare-fun lt!353742 () (_ BitVec 64))

(assert (=> d!75819 (= lt!353737 (bvmul lt!353738 lt!353742))))

(assert (=> d!75819 (or (= lt!353738 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!353742 (bvsdiv (bvmul lt!353738 lt!353742) lt!353738)))))

(assert (=> d!75819 (= lt!353742 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!75819 (= lt!353738 ((_ sign_extend 32) (size!4815 (buf!5359 (_2!10262 lt!353409)))))))

(assert (=> d!75819 (= lt!353739 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10056 (_2!10262 lt!353409))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10051 (_2!10262 lt!353409)))))))

(assert (=> d!75819 (invariant!0 (currentBit!10051 (_2!10262 lt!353409)) (currentByte!10056 (_2!10262 lt!353409)) (size!4815 (buf!5359 (_2!10262 lt!353409))))))

(assert (=> d!75819 (= (bitIndex!0 (size!4815 (buf!5359 (_2!10262 lt!353409))) (currentByte!10056 (_2!10262 lt!353409)) (currentBit!10051 (_2!10262 lt!353409))) lt!353739)))

(declare-fun b!223552 () Bool)

(declare-fun res!187669 () Bool)

(assert (=> b!223552 (=> (not res!187669) (not e!152162))))

(assert (=> b!223552 (= res!187669 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!353739))))

(declare-fun b!223553 () Bool)

(declare-fun lt!353741 () (_ BitVec 64))

(assert (=> b!223553 (= e!152162 (bvsle lt!353739 (bvmul lt!353741 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!223553 (or (= lt!353741 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!353741 #b0000000000000000000000000000000000000000000000000000000000001000) lt!353741)))))

(assert (=> b!223553 (= lt!353741 ((_ sign_extend 32) (size!4815 (buf!5359 (_2!10262 lt!353409)))))))

(assert (= (and d!75819 res!187670) b!223552))

(assert (= (and b!223552 res!187669) b!223553))

(declare-fun m!342589 () Bool)

(assert (=> d!75819 m!342589))

(declare-fun m!342591 () Bool)

(assert (=> d!75819 m!342591))

(assert (=> b!223452 d!75819))

(declare-fun d!75821 () Bool)

(declare-fun e!152163 () Bool)

(assert (=> d!75821 e!152163))

(declare-fun res!187671 () Bool)

(assert (=> d!75821 (=> (not res!187671) (not e!152163))))

(assert (=> d!75821 (= res!187671 (and (or (let ((rhs!3680 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand lt!353422 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3680 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand lt!353422 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!353422 rhs!3680) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!75724 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!75724 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd lt!353422 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!75724 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3679 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand lt!353422 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3679 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!353422 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!353422 rhs!3679) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!353745 () Unit!16178)

(assert (=> d!75821 (= lt!353745 (choose!57 (_2!10262 lt!353140) (_2!10262 lt!353409) lt!353422 lt!353414))))

(assert (=> d!75821 (= (validateOffsetBytesFromBitIndexLemma!0 (_2!10262 lt!353140) (_2!10262 lt!353409) lt!353422 lt!353414) lt!353745)))

(declare-fun lt!353743 () (_ BitVec 32))

(declare-fun b!223554 () Bool)

(assert (=> b!223554 (= e!152163 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4815 (buf!5359 (_2!10262 lt!353409)))) ((_ sign_extend 32) (currentByte!10056 (_2!10262 lt!353409))) ((_ sign_extend 32) (currentBit!10051 (_2!10262 lt!353409))) (bvsub lt!353414 lt!353743)))))

(assert (=> b!223554 (or (= (bvand lt!353414 #b10000000000000000000000000000000) (bvand lt!353743 #b10000000000000000000000000000000)) (= (bvand lt!353414 #b10000000000000000000000000000000) (bvand (bvsub lt!353414 lt!353743) #b10000000000000000000000000000000)))))

(declare-fun lt!353744 () (_ BitVec 64))

(assert (=> b!223554 (= lt!353743 ((_ extract 31 0) lt!353744))))

(assert (=> b!223554 (and (bvslt lt!353744 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!353744 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!223554 (= lt!353744 (bvsdiv (bvadd lt!353422 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!75821 res!187671) b!223554))

(declare-fun m!342593 () Bool)

(assert (=> d!75821 m!342593))

(declare-fun m!342595 () Bool)

(assert (=> b!223554 m!342595))

(assert (=> b!223452 d!75821))

(declare-fun d!75823 () Bool)

(declare-fun e!152166 () Bool)

(assert (=> d!75823 e!152166))

(declare-fun res!187674 () Bool)

(assert (=> d!75823 (=> (not res!187674) (not e!152166))))

(assert (=> d!75823 (= res!187674 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4815 (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308))))))))

(declare-fun lt!353748 () Unit!16178)

(declare-fun choose!276 (array!10975 (_ BitVec 32) (_ BitVec 8)) Unit!16178)

(assert (=> d!75823 (= lt!353748 (choose!276 (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) (_1!10262 lt!353409)))))

(assert (=> d!75823 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4815 (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308)))))))

(assert (=> d!75823 (= (arrayUpdatedAtPrefixLemma!305 (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) (_1!10262 lt!353409)) lt!353748)))

(declare-fun b!223557 () Bool)

(assert (=> b!223557 (= e!152166 (arrayRangesEq!713 (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308)) (array!10976 (store (arr!5754 (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10262 lt!353409)) (size!4815 (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308)))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (= (and d!75823 res!187674) b!223557))

(declare-fun m!342597 () Bool)

(assert (=> d!75823 m!342597))

(assert (=> b!223557 m!342313))

(assert (=> b!223557 m!342315))

(assert (=> b!223452 d!75823))

(declare-fun d!75825 () Bool)

(declare-fun res!187675 () Bool)

(declare-fun e!152167 () Bool)

(assert (=> d!75825 (=> res!187675 e!152167)))

(assert (=> d!75825 (= res!187675 (= #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!75825 (= (arrayRangesEq!713 (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308)) (array!10976 (store (arr!5754 (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10262 lt!353409)) (size!4815 (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308)))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) e!152167)))

(declare-fun b!223558 () Bool)

(declare-fun e!152168 () Bool)

(assert (=> b!223558 (= e!152167 e!152168)))

(declare-fun res!187676 () Bool)

(assert (=> b!223558 (=> (not res!187676) (not e!152168))))

(assert (=> b!223558 (= res!187676 (= (select (arr!5754 (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308))) #b00000000000000000000000000000000) (select (arr!5754 (array!10976 (store (arr!5754 (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10262 lt!353409)) (size!4815 (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308))))) #b00000000000000000000000000000000)))))

(declare-fun b!223559 () Bool)

(assert (=> b!223559 (= e!152168 (arrayRangesEq!713 (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308)) (array!10976 (store (arr!5754 (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10262 lt!353409)) (size!4815 (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (= (and d!75825 (not res!187675)) b!223558))

(assert (= (and b!223558 res!187676) b!223559))

(assert (=> b!223558 m!342575))

(declare-fun m!342599 () Bool)

(assert (=> b!223558 m!342599))

(declare-fun m!342601 () Bool)

(assert (=> b!223559 m!342601))

(assert (=> b!223452 d!75825))

(declare-fun d!75827 () Bool)

(declare-fun e!152169 () Bool)

(assert (=> d!75827 e!152169))

(declare-fun res!187678 () Bool)

(assert (=> d!75827 (=> (not res!187678) (not e!152169))))

(declare-fun lt!353751 () (_ BitVec 64))

(declare-fun lt!353752 () (_ BitVec 64))

(declare-fun lt!353749 () (_ BitVec 64))

(assert (=> d!75827 (= res!187678 (= lt!353751 (bvsub lt!353749 lt!353752)))))

(assert (=> d!75827 (or (= (bvand lt!353749 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!353752 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!353749 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!353749 lt!353752) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75827 (= lt!353752 (remainingBits!0 ((_ sign_extend 32) (size!4815 (buf!5359 (_2!10261 lt!353394)))) ((_ sign_extend 32) (currentByte!10056 (_2!10261 lt!353394))) ((_ sign_extend 32) (currentBit!10051 (_2!10261 lt!353394)))))))

(declare-fun lt!353750 () (_ BitVec 64))

(declare-fun lt!353754 () (_ BitVec 64))

(assert (=> d!75827 (= lt!353749 (bvmul lt!353750 lt!353754))))

(assert (=> d!75827 (or (= lt!353750 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!353754 (bvsdiv (bvmul lt!353750 lt!353754) lt!353750)))))

(assert (=> d!75827 (= lt!353754 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!75827 (= lt!353750 ((_ sign_extend 32) (size!4815 (buf!5359 (_2!10261 lt!353394)))))))

(assert (=> d!75827 (= lt!353751 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10056 (_2!10261 lt!353394))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10051 (_2!10261 lt!353394)))))))

(assert (=> d!75827 (invariant!0 (currentBit!10051 (_2!10261 lt!353394)) (currentByte!10056 (_2!10261 lt!353394)) (size!4815 (buf!5359 (_2!10261 lt!353394))))))

(assert (=> d!75827 (= (bitIndex!0 (size!4815 (buf!5359 (_2!10261 lt!353394))) (currentByte!10056 (_2!10261 lt!353394)) (currentBit!10051 (_2!10261 lt!353394))) lt!353751)))

(declare-fun b!223560 () Bool)

(declare-fun res!187677 () Bool)

(assert (=> b!223560 (=> (not res!187677) (not e!152169))))

(assert (=> b!223560 (= res!187677 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!353751))))

(declare-fun b!223561 () Bool)

(declare-fun lt!353753 () (_ BitVec 64))

(assert (=> b!223561 (= e!152169 (bvsle lt!353751 (bvmul lt!353753 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!223561 (or (= lt!353753 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!353753 #b0000000000000000000000000000000000000000000000000000000000001000) lt!353753)))))

(assert (=> b!223561 (= lt!353753 ((_ sign_extend 32) (size!4815 (buf!5359 (_2!10261 lt!353394)))))))

(assert (= (and d!75827 res!187678) b!223560))

(assert (= (and b!223560 res!187677) b!223561))

(declare-fun m!342603 () Bool)

(assert (=> d!75827 m!342603))

(declare-fun m!342605 () Bool)

(assert (=> d!75827 m!342605))

(assert (=> b!223452 d!75827))

(declare-fun b!223562 () Bool)

(declare-fun res!187679 () Bool)

(declare-fun e!152172 () Bool)

(assert (=> b!223562 (=> (not res!187679) (not e!152172))))

(declare-fun lt!353789 () tuple3!1156)

(assert (=> b!223562 (= res!187679 (and (= (buf!5359 (_2!10262 lt!353409)) (buf!5359 (_2!10261 lt!353789))) (= (size!4815 lt!353401) (size!4815 (_3!720 lt!353789)))))))

(declare-fun bm!3526 () Bool)

(declare-fun lt!353756 () array!10975)

(declare-fun call!3531 () Bool)

(declare-fun lt!353766 () array!10975)

(declare-fun c!11104 () Bool)

(declare-fun lt!353785 () (_ BitVec 32))

(declare-fun lt!353755 () tuple3!1156)

(declare-fun lt!353774 () (_ BitVec 32))

(declare-fun lt!353767 () (_ BitVec 32))

(assert (=> bm!3526 (= call!3531 (arrayRangesEq!713 (ite c!11104 lt!353401 lt!353766) (ite c!11104 (_3!720 lt!353755) lt!353756) (ite c!11104 lt!353785 lt!353767) (ite c!11104 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) lt!353774)))))

(declare-fun e!152171 () Bool)

(declare-fun b!223563 () Bool)

(assert (=> b!223563 (= e!152171 (= (select (arr!5754 (_3!720 lt!353789)) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)) (_2!10265 (readBytePure!0 (_2!10262 lt!353409)))))))

(assert (=> b!223563 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) (size!4815 (_3!720 lt!353789))))))

(declare-fun b!223565 () Bool)

(declare-fun e!152170 () tuple3!1156)

(declare-fun lt!353787 () Unit!16178)

(assert (=> b!223565 (= e!152170 (tuple3!1157 lt!353787 (_2!10261 lt!353755) (_3!720 lt!353755)))))

(declare-fun lt!353770 () tuple2!19082)

(assert (=> b!223565 (= lt!353770 (readByte!0 (_2!10262 lt!353409)))))

(declare-fun lt!353762 () array!10975)

(assert (=> b!223565 (= lt!353762 (array!10976 (store (arr!5754 lt!353401) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) (_1!10262 lt!353770)) (size!4815 lt!353401)))))

(declare-fun lt!353783 () (_ BitVec 64))

(assert (=> b!223565 (= lt!353783 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!353775 () (_ BitVec 32))

(assert (=> b!223565 (= lt!353775 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(declare-fun lt!353773 () Unit!16178)

(assert (=> b!223565 (= lt!353773 (validateOffsetBytesFromBitIndexLemma!0 (_2!10262 lt!353409) (_2!10262 lt!353770) lt!353783 lt!353775))))

(assert (=> b!223565 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4815 (buf!5359 (_2!10262 lt!353770)))) ((_ sign_extend 32) (currentByte!10056 (_2!10262 lt!353770))) ((_ sign_extend 32) (currentBit!10051 (_2!10262 lt!353770))) (bvsub lt!353775 ((_ extract 31 0) (bvsdiv (bvadd lt!353783 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!353763 () Unit!16178)

(assert (=> b!223565 (= lt!353763 lt!353773)))

(assert (=> b!223565 (= lt!353755 (readByteArrayLoop!0 (_2!10262 lt!353770) lt!353762 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!496))))

(declare-fun call!3530 () (_ BitVec 64))

(assert (=> b!223565 (= (bitIndex!0 (size!4815 (buf!5359 (_2!10262 lt!353770))) (currentByte!10056 (_2!10262 lt!353770)) (currentBit!10051 (_2!10262 lt!353770))) (bvadd call!3530 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!353781 () Unit!16178)

(declare-fun Unit!16228 () Unit!16178)

(assert (=> b!223565 (= lt!353781 Unit!16228)))

(assert (=> b!223565 (= (bvadd (bitIndex!0 (size!4815 (buf!5359 (_2!10262 lt!353770))) (currentByte!10056 (_2!10262 lt!353770)) (currentBit!10051 (_2!10262 lt!353770))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4815 (buf!5359 (_2!10261 lt!353755))) (currentByte!10056 (_2!10261 lt!353755)) (currentBit!10051 (_2!10261 lt!353755))))))

(declare-fun lt!353768 () Unit!16178)

(declare-fun Unit!16229 () Unit!16178)

(assert (=> b!223565 (= lt!353768 Unit!16229)))

(assert (=> b!223565 (= (bvadd call!3530 (bvmul ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4815 (buf!5359 (_2!10261 lt!353755))) (currentByte!10056 (_2!10261 lt!353755)) (currentBit!10051 (_2!10261 lt!353755))))))

(declare-fun lt!353786 () Unit!16178)

(declare-fun Unit!16230 () Unit!16178)

(assert (=> b!223565 (= lt!353786 Unit!16230)))

(assert (=> b!223565 (and (= (buf!5359 (_2!10262 lt!353409)) (buf!5359 (_2!10261 lt!353755))) (= (size!4815 lt!353401) (size!4815 (_3!720 lt!353755))))))

(declare-fun lt!353764 () Unit!16178)

(declare-fun Unit!16231 () Unit!16178)

(assert (=> b!223565 (= lt!353764 Unit!16231)))

(declare-fun lt!353784 () Unit!16178)

(assert (=> b!223565 (= lt!353784 (arrayUpdatedAtPrefixLemma!305 lt!353401 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) (_1!10262 lt!353770)))))

(assert (=> b!223565 (arrayRangesEq!713 lt!353401 (array!10976 (store (arr!5754 lt!353401) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) (_1!10262 lt!353770)) (size!4815 lt!353401)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001))))

(declare-fun lt!353772 () Unit!16178)

(assert (=> b!223565 (= lt!353772 lt!353784)))

(assert (=> b!223565 (= lt!353785 #b00000000000000000000000000000000)))

(declare-fun lt!353757 () Unit!16178)

(assert (=> b!223565 (= lt!353757 (arrayRangesEqTransitive!199 lt!353401 lt!353762 (_3!720 lt!353755) lt!353785 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (=> b!223565 call!3531))

(declare-fun lt!353765 () Unit!16178)

(assert (=> b!223565 (= lt!353765 lt!353757)))

(declare-fun call!3529 () Bool)

(assert (=> b!223565 call!3529))

(declare-fun lt!353760 () Unit!16178)

(declare-fun Unit!16232 () Unit!16178)

(assert (=> b!223565 (= lt!353760 Unit!16232)))

(declare-fun lt!353782 () Unit!16178)

(assert (=> b!223565 (= lt!353782 (arrayRangesEqImpliesEq!74 lt!353762 (_3!720 lt!353755) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (=> b!223565 (= (select (store (arr!5754 lt!353401) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) (_1!10262 lt!353770)) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)) (select (arr!5754 (_3!720 lt!353755)) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(declare-fun lt!353769 () Unit!16178)

(assert (=> b!223565 (= lt!353769 lt!353782)))

(declare-fun lt!353777 () Bool)

(assert (=> b!223565 (= lt!353777 (= (select (arr!5754 (_3!720 lt!353755)) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)) (_1!10262 lt!353770)))))

(declare-fun Unit!16233 () Unit!16178)

(assert (=> b!223565 (= lt!353787 Unit!16233)))

(assert (=> b!223565 lt!353777))

(declare-fun bm!3527 () Bool)

(assert (=> bm!3527 (= call!3530 (bitIndex!0 (size!4815 (buf!5359 (_2!10262 lt!353409))) (currentByte!10056 (_2!10262 lt!353409)) (currentBit!10051 (_2!10262 lt!353409))))))

(declare-fun b!223564 () Bool)

(assert (=> b!223564 (= e!152172 (arrayRangesEq!713 lt!353401 (_3!720 lt!353789) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(declare-fun d!75829 () Bool)

(assert (=> d!75829 e!152171))

(declare-fun res!187680 () Bool)

(assert (=> d!75829 (=> res!187680 e!152171)))

(assert (=> d!75829 (= res!187680 (bvsge (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(declare-fun lt!353759 () Bool)

(assert (=> d!75829 (= lt!353759 e!152172)))

(declare-fun res!187681 () Bool)

(assert (=> d!75829 (=> (not res!187681) (not e!152172))))

(declare-fun lt!353788 () (_ BitVec 64))

(declare-fun lt!353778 () (_ BitVec 64))

(assert (=> d!75829 (= res!187681 (= (bvadd lt!353788 lt!353778) (bitIndex!0 (size!4815 (buf!5359 (_2!10261 lt!353789))) (currentByte!10056 (_2!10261 lt!353789)) (currentBit!10051 (_2!10261 lt!353789)))))))

(assert (=> d!75829 (or (not (= (bvand lt!353788 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!353778 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!353788 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!353788 lt!353778) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!353776 () (_ BitVec 64))

(assert (=> d!75829 (= lt!353778 (bvmul lt!353776 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!75829 (or (= lt!353776 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!353776 #b0000000000000000000000000000000000000000000000000000000000001000) lt!353776)))))

(assert (=> d!75829 (= lt!353776 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001))))))

(assert (=> d!75829 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> d!75829 (= lt!353788 (bitIndex!0 (size!4815 (buf!5359 (_2!10262 lt!353409))) (currentByte!10056 (_2!10262 lt!353409)) (currentBit!10051 (_2!10262 lt!353409))))))

(assert (=> d!75829 (= lt!353789 e!152170)))

(assert (=> d!75829 (= c!11104 (bvslt (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(assert (=> d!75829 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)) (bvsle (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496) (bvsle to!496 (size!4815 lt!353401)))))

(assert (=> d!75829 (= (readByteArrayLoop!0 (_2!10262 lt!353409) lt!353401 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496) lt!353789)))

(declare-fun b!223566 () Bool)

(declare-fun lt!353780 () Unit!16178)

(assert (=> b!223566 (= e!152170 (tuple3!1157 lt!353780 (_2!10262 lt!353409) lt!353401))))

(assert (=> b!223566 (= call!3530 call!3530)))

(declare-fun lt!353761 () Unit!16178)

(declare-fun Unit!16234 () Unit!16178)

(assert (=> b!223566 (= lt!353761 Unit!16234)))

(declare-fun lt!353790 () Unit!16178)

(assert (=> b!223566 (= lt!353790 (arrayRangesEqReflexiveLemma!67 lt!353401))))

(assert (=> b!223566 call!3529))

(declare-fun lt!353779 () Unit!16178)

(assert (=> b!223566 (= lt!353779 lt!353790)))

(assert (=> b!223566 (= lt!353766 lt!353401)))

(assert (=> b!223566 (= lt!353756 lt!353401)))

(declare-fun lt!353771 () (_ BitVec 32))

(assert (=> b!223566 (= lt!353771 #b00000000000000000000000000000000)))

(declare-fun lt!353758 () (_ BitVec 32))

(assert (=> b!223566 (= lt!353758 (size!4815 lt!353401))))

(assert (=> b!223566 (= lt!353767 #b00000000000000000000000000000000)))

(assert (=> b!223566 (= lt!353774 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001))))

(assert (=> b!223566 (= lt!353780 (arrayRangesEqSlicedLemma!67 lt!353766 lt!353756 lt!353771 lt!353758 lt!353767 lt!353774))))

(assert (=> b!223566 call!3531))

(declare-fun bm!3528 () Bool)

(assert (=> bm!3528 (= call!3529 (arrayRangesEq!713 lt!353401 (ite c!11104 (_3!720 lt!353755) lt!353401) #b00000000000000000000000000000000 (ite c!11104 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) (size!4815 lt!353401))))))

(assert (= (and d!75829 c!11104) b!223565))

(assert (= (and d!75829 (not c!11104)) b!223566))

(assert (= (or b!223565 b!223566) bm!3526))

(assert (= (or b!223565 b!223566) bm!3528))

(assert (= (or b!223565 b!223566) bm!3527))

(assert (= (and d!75829 res!187681) b!223562))

(assert (= (and b!223562 res!187679) b!223564))

(assert (= (and d!75829 (not res!187680)) b!223563))

(declare-fun m!342607 () Bool)

(assert (=> b!223564 m!342607))

(declare-fun m!342609 () Bool)

(assert (=> d!75829 m!342609))

(assert (=> d!75829 m!342297))

(declare-fun m!342611 () Bool)

(assert (=> b!223566 m!342611))

(declare-fun m!342613 () Bool)

(assert (=> b!223566 m!342613))

(declare-fun m!342615 () Bool)

(assert (=> bm!3528 m!342615))

(declare-fun m!342617 () Bool)

(assert (=> b!223565 m!342617))

(declare-fun m!342619 () Bool)

(assert (=> b!223565 m!342619))

(declare-fun m!342621 () Bool)

(assert (=> b!223565 m!342621))

(declare-fun m!342623 () Bool)

(assert (=> b!223565 m!342623))

(declare-fun m!342625 () Bool)

(assert (=> b!223565 m!342625))

(declare-fun m!342627 () Bool)

(assert (=> b!223565 m!342627))

(declare-fun m!342629 () Bool)

(assert (=> b!223565 m!342629))

(declare-fun m!342631 () Bool)

(assert (=> b!223565 m!342631))

(declare-fun m!342633 () Bool)

(assert (=> b!223565 m!342633))

(declare-fun m!342635 () Bool)

(assert (=> b!223565 m!342635))

(declare-fun m!342637 () Bool)

(assert (=> b!223565 m!342637))

(declare-fun m!342639 () Bool)

(assert (=> b!223565 m!342639))

(declare-fun m!342641 () Bool)

(assert (=> b!223565 m!342641))

(declare-fun m!342643 () Bool)

(assert (=> b!223563 m!342643))

(declare-fun m!342645 () Bool)

(assert (=> b!223563 m!342645))

(assert (=> bm!3527 m!342297))

(declare-fun m!342647 () Bool)

(assert (=> bm!3526 m!342647))

(assert (=> b!223452 d!75829))

(declare-fun d!75831 () Bool)

(assert (=> d!75831 (arrayRangesEq!713 (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308)) (_3!720 lt!353394) lt!353424 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun lt!353793 () Unit!16178)

(declare-fun choose!277 (array!10975 array!10975 array!10975 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16178)

(assert (=> d!75831 (= lt!353793 (choose!277 (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308)) lt!353401 (_3!720 lt!353394) lt!353424 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> d!75831 (and (bvsle #b00000000000000000000000000000000 lt!353424) (bvsle lt!353424 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> d!75831 (= (arrayRangesEqTransitive!199 (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308)) lt!353401 (_3!720 lt!353394) lt!353424 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)) lt!353793)))

(declare-fun bs!18483 () Bool)

(assert (= bs!18483 d!75831))

(declare-fun m!342649 () Bool)

(assert (=> bs!18483 m!342649))

(declare-fun m!342651 () Bool)

(assert (=> bs!18483 m!342651))

(assert (=> b!223452 d!75831))

(declare-fun d!75833 () Bool)

(assert (=> d!75833 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4815 (buf!5359 (_2!10262 lt!353409)))) ((_ sign_extend 32) (currentByte!10056 (_2!10262 lt!353409))) ((_ sign_extend 32) (currentBit!10051 (_2!10262 lt!353409))) (bvsub lt!353414 ((_ extract 31 0) (bvsdiv (bvadd lt!353422 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)))) (bvsle ((_ sign_extend 32) (bvsub lt!353414 ((_ extract 31 0) (bvsdiv (bvadd lt!353422 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)))) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4815 (buf!5359 (_2!10262 lt!353409)))) ((_ sign_extend 32) (currentByte!10056 (_2!10262 lt!353409))) ((_ sign_extend 32) (currentBit!10051 (_2!10262 lt!353409)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18484 () Bool)

(assert (= bs!18484 d!75833))

(assert (=> bs!18484 m!342589))

(assert (=> b!223452 d!75833))

(declare-fun d!75835 () Bool)

(assert (=> d!75835 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4815 lt!353401)) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4815 (_3!720 lt!353394))) (= (select (arr!5754 lt!353401) (bvadd #b00000000000000000000000000000001 i!761)) (select (arr!5754 (_3!720 lt!353394)) (bvadd #b00000000000000000000000000000001 i!761))))))

(declare-fun lt!353796 () Unit!16178)

(declare-fun choose!278 (array!10975 array!10975 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16178)

(assert (=> d!75835 (= lt!353796 (choose!278 lt!353401 (_3!720 lt!353394) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> d!75835 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> d!75835 (= (arrayRangesEqImpliesEq!74 lt!353401 (_3!720 lt!353394) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)) lt!353796)))

(declare-fun bs!18485 () Bool)

(assert (= bs!18485 d!75835))

(declare-fun m!342653 () Bool)

(assert (=> bs!18485 m!342653))

(assert (=> bs!18485 m!342317))

(declare-fun m!342655 () Bool)

(assert (=> bs!18485 m!342655))

(assert (=> b!223452 d!75835))

(assert (=> bm!3511 d!75696))

(assert (=> d!75698 d!75803))

(declare-fun d!75837 () Bool)

(assert (=> d!75837 (arrayRangesEq!713 (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308)) (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308)) #b00000000000000000000000000000000 (size!4815 (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308))))))

(declare-fun lt!353799 () Unit!16178)

(declare-fun choose!279 (array!10975) Unit!16178)

(assert (=> d!75837 (= lt!353799 (choose!279 (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308))))))

(assert (=> d!75837 (= (arrayRangesEqReflexiveLemma!67 (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308))) lt!353799)))

(declare-fun bs!18486 () Bool)

(assert (= bs!18486 d!75837))

(declare-fun m!342657 () Bool)

(assert (=> bs!18486 m!342657))

(declare-fun m!342659 () Bool)

(assert (=> bs!18486 m!342659))

(assert (=> b!223453 d!75837))

(declare-fun d!75839 () Bool)

(assert (=> d!75839 (arrayRangesEq!713 lt!353405 lt!353395 lt!353406 lt!353413)))

(declare-fun lt!353802 () Unit!16178)

(declare-fun choose!280 (array!10975 array!10975 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16178)

(assert (=> d!75839 (= lt!353802 (choose!280 lt!353405 lt!353395 lt!353410 lt!353397 lt!353406 lt!353413))))

(assert (=> d!75839 (and (bvsle #b00000000000000000000000000000000 lt!353410) (bvsle lt!353410 lt!353397))))

(assert (=> d!75839 (= (arrayRangesEqSlicedLemma!67 lt!353405 lt!353395 lt!353410 lt!353397 lt!353406 lt!353413) lt!353802)))

(declare-fun bs!18487 () Bool)

(assert (= bs!18487 d!75839))

(declare-fun m!342661 () Bool)

(assert (=> bs!18487 m!342661))

(declare-fun m!342663 () Bool)

(assert (=> bs!18487 m!342663))

(assert (=> b!223453 d!75839))

(declare-fun d!75841 () Bool)

(assert (=> d!75841 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4815 (buf!5359 (_2!10262 lt!353140)))) ((_ sign_extend 32) (currentByte!10056 (_2!10262 lt!353140))) ((_ sign_extend 32) (currentBit!10051 (_2!10262 lt!353140))) (bvsub (bvsub to!496 i!761) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!75841 true))

(declare-fun _$7!133 () Unit!16178)

(assert (=> d!75841 (= (choose!57 thiss!1870 (_2!10262 lt!353140) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)) _$7!133)))

(declare-fun bs!18488 () Bool)

(assert (= bs!18488 d!75841))

(declare-fun m!342665 () Bool)

(assert (=> bs!18488 m!342665))

(assert (=> d!75717 d!75841))

(declare-fun d!75843 () Bool)

(assert (=> d!75843 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4815 (buf!5359 thiss!1870))) ((_ sign_extend 32) (currentByte!10056 thiss!1870)) ((_ sign_extend 32) (currentBit!10051 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4815 (buf!5359 thiss!1870))) ((_ sign_extend 32) (currentByte!10056 thiss!1870)) ((_ sign_extend 32) (currentBit!10051 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!18489 () Bool)

(assert (= bs!18489 d!75843))

(assert (=> bs!18489 m!342269))

(assert (=> d!75704 d!75843))

(declare-fun d!75845 () Bool)

(declare-fun res!187682 () Bool)

(declare-fun e!152173 () Bool)

(assert (=> d!75845 (=> res!187682 e!152173)))

(assert (=> d!75845 (= res!187682 (= #b00000000000000000000000000000000 (ite c!11100 (bvadd #b00000000000000000000000000000001 i!761) (size!4815 (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308))))))))

(assert (=> d!75845 (= (arrayRangesEq!713 (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308)) (ite c!11100 (_3!720 lt!353394) (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308))) #b00000000000000000000000000000000 (ite c!11100 (bvadd #b00000000000000000000000000000001 i!761) (size!4815 (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308))))) e!152173)))

(declare-fun b!223567 () Bool)

(declare-fun e!152174 () Bool)

(assert (=> b!223567 (= e!152173 e!152174)))

(declare-fun res!187683 () Bool)

(assert (=> b!223567 (=> (not res!187683) (not e!152174))))

(assert (=> b!223567 (= res!187683 (= (select (arr!5754 (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308))) #b00000000000000000000000000000000) (select (arr!5754 (ite c!11100 (_3!720 lt!353394) (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308)))) #b00000000000000000000000000000000)))))

(declare-fun b!223568 () Bool)

(assert (=> b!223568 (= e!152174 (arrayRangesEq!713 (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308)) (ite c!11100 (_3!720 lt!353394) (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!11100 (bvadd #b00000000000000000000000000000001 i!761) (size!4815 (array!10976 (store (arr!5754 arr!308) i!761 (_1!10262 lt!353140)) (size!4815 arr!308))))))))

(assert (= (and d!75845 (not res!187682)) b!223567))

(assert (= (and b!223567 res!187683) b!223568))

(assert (=> b!223567 m!342575))

(declare-fun m!342667 () Bool)

(assert (=> b!223567 m!342667))

(declare-fun m!342669 () Bool)

(assert (=> b!223568 m!342669))

(assert (=> bm!3512 d!75845))

(assert (=> d!75692 d!75799))

(assert (=> d!75692 d!75809))

(push 1)

(assert (not bm!3526))

(assert (not d!75801))

(assert (not d!75813))

(assert (not d!75819))

(assert (not d!75833))

(assert (not b!223551))

(assert (not b!223545))

(assert (not bm!3527))

(assert (not b!223549))

(assert (not b!223566))

(assert (not b!223559))

(assert (not d!75817))

(assert (not d!75827))

(assert (not b!223565))

(assert (not d!75841))

(assert (not d!75831))

(assert (not bm!3528))

(assert (not b!223568))

(assert (not d!75829))

(assert (not b!223554))

(assert (not d!75811))

(assert (not d!75835))

(assert (not d!75837))

(assert (not d!75823))

(assert (not b!223563))

(assert (not b!223564))

(assert (not b!223557))

(assert (not d!75839))

(assert (not d!75843))

(assert (not d!75797))

(assert (not d!75821))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

