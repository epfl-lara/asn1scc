; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46426 () Bool)

(assert start!46426)

(declare-fun b!223251 () Bool)

(declare-fun res!187418 () Bool)

(declare-fun e!151931 () Bool)

(assert (=> b!223251 (=> (not res!187418) (not e!151931))))

(declare-datatypes ((array!10962 0))(
  ( (array!10963 (arr!5746 (Array (_ BitVec 32) (_ BitVec 8))) (size!4810 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8722 0))(
  ( (BitStream!8723 (buf!5354 array!10962) (currentByte!10042 (_ BitVec 32)) (currentBit!10037 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8722)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!223251 (= res!187418 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4810 (buf!5354 thiss!1870))) ((_ sign_extend 32) (currentByte!10042 thiss!1870)) ((_ sign_extend 32) (currentBit!10037 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!223254 () Bool)

(declare-fun e!151929 () Bool)

(declare-fun array_inv!4551 (array!10962) Bool)

(assert (=> b!223254 (= e!151929 (array_inv!4551 (buf!5354 thiss!1870)))))

(declare-fun b!223253 () Bool)

(declare-datatypes ((tuple2!19062 0))(
  ( (tuple2!19063 (_1!10246 (_ BitVec 8)) (_2!10246 BitStream!8722)) )
))
(declare-fun lt!352609 () tuple2!19062)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!223253 (= e!151931 (not (invariant!0 (currentBit!10037 (_2!10246 lt!352609)) (currentByte!10042 (_2!10246 lt!352609)) (size!4810 (buf!5354 (_2!10246 lt!352609))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!223253 (= (bitIndex!0 (size!4810 (buf!5354 (_2!10246 lt!352609))) (currentByte!10042 (_2!10246 lt!352609)) (currentBit!10037 (_2!10246 lt!352609))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!4810 (buf!5354 thiss!1870)) (currentByte!10042 thiss!1870) (currentBit!10037 thiss!1870))))))

(declare-fun arr!308 () array!10962)

(declare-datatypes ((Unit!16141 0))(
  ( (Unit!16142) )
))
(declare-datatypes ((tuple3!1146 0))(
  ( (tuple3!1147 (_1!10247 Unit!16141) (_2!10247 BitStream!8722) (_3!715 array!10962)) )
))
(declare-fun lt!352608 () tuple3!1146)

(declare-fun readByteArrayLoop!0 (BitStream!8722 array!10962 (_ BitVec 32) (_ BitVec 32)) tuple3!1146)

(assert (=> b!223253 (= lt!352608 (readByteArrayLoop!0 (_2!10246 lt!352609) (array!10963 (store (arr!5746 arr!308) i!761 (_1!10246 lt!352609)) (size!4810 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!223253 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4810 (buf!5354 (_2!10246 lt!352609)))) ((_ sign_extend 32) (currentByte!10042 (_2!10246 lt!352609))) ((_ sign_extend 32) (currentBit!10037 (_2!10246 lt!352609))) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!352607 () Unit!16141)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8722 BitStream!8722 (_ BitVec 64) (_ BitVec 32)) Unit!16141)

(assert (=> b!223253 (= lt!352607 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10246 lt!352609) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!8722) tuple2!19062)

(assert (=> b!223253 (= lt!352609 (readByte!0 thiss!1870))))

(declare-fun b!223252 () Bool)

(declare-fun res!187416 () Bool)

(assert (=> b!223252 (=> (not res!187416) (not e!151931))))

(assert (=> b!223252 (= res!187416 (bvslt i!761 to!496))))

(declare-fun res!187417 () Bool)

(assert (=> start!46426 (=> (not res!187417) (not e!151931))))

(assert (=> start!46426 (= res!187417 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4810 arr!308))))))

(assert (=> start!46426 e!151931))

(assert (=> start!46426 true))

(assert (=> start!46426 (array_inv!4551 arr!308)))

(declare-fun inv!12 (BitStream!8722) Bool)

(assert (=> start!46426 (and (inv!12 thiss!1870) e!151929)))

(assert (= (and start!46426 res!187417) b!223251))

(assert (= (and b!223251 res!187418) b!223252))

(assert (= (and b!223252 res!187416) b!223253))

(assert (= start!46426 b!223254))

(declare-fun m!341939 () Bool)

(assert (=> b!223251 m!341939))

(declare-fun m!341941 () Bool)

(assert (=> b!223254 m!341941))

(declare-fun m!341943 () Bool)

(assert (=> b!223253 m!341943))

(declare-fun m!341945 () Bool)

(assert (=> b!223253 m!341945))

(declare-fun m!341947 () Bool)

(assert (=> b!223253 m!341947))

(declare-fun m!341949 () Bool)

(assert (=> b!223253 m!341949))

(declare-fun m!341951 () Bool)

(assert (=> b!223253 m!341951))

(declare-fun m!341953 () Bool)

(assert (=> b!223253 m!341953))

(declare-fun m!341955 () Bool)

(assert (=> b!223253 m!341955))

(declare-fun m!341957 () Bool)

(assert (=> b!223253 m!341957))

(declare-fun m!341959 () Bool)

(assert (=> start!46426 m!341959))

(declare-fun m!341961 () Bool)

(assert (=> start!46426 m!341961))

(push 1)

(assert (not b!223253))

(assert (not b!223254))

(assert (not start!46426))

(assert (not b!223251))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!75607 () Bool)

(declare-fun e!151959 () Bool)

(assert (=> d!75607 e!151959))

(declare-fun res!187441 () Bool)

(assert (=> d!75607 (=> (not res!187441) (not e!151959))))

(declare-fun lt!352644 () (_ BitVec 64))

(declare-fun lt!352640 () (_ BitVec 64))

(declare-fun lt!352642 () (_ BitVec 64))

(assert (=> d!75607 (= res!187441 (= lt!352640 (bvsub lt!352642 lt!352644)))))

(assert (=> d!75607 (or (= (bvand lt!352642 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!352644 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!352642 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!352642 lt!352644) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!75607 (= lt!352644 (remainingBits!0 ((_ sign_extend 32) (size!4810 (buf!5354 (_2!10246 lt!352609)))) ((_ sign_extend 32) (currentByte!10042 (_2!10246 lt!352609))) ((_ sign_extend 32) (currentBit!10037 (_2!10246 lt!352609)))))))

(declare-fun lt!352643 () (_ BitVec 64))

(declare-fun lt!352645 () (_ BitVec 64))

(assert (=> d!75607 (= lt!352642 (bvmul lt!352643 lt!352645))))

(assert (=> d!75607 (or (= lt!352643 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!352645 (bvsdiv (bvmul lt!352643 lt!352645) lt!352643)))))

(assert (=> d!75607 (= lt!352645 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!75607 (= lt!352643 ((_ sign_extend 32) (size!4810 (buf!5354 (_2!10246 lt!352609)))))))

(assert (=> d!75607 (= lt!352640 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10042 (_2!10246 lt!352609))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10037 (_2!10246 lt!352609)))))))

(assert (=> d!75607 (invariant!0 (currentBit!10037 (_2!10246 lt!352609)) (currentByte!10042 (_2!10246 lt!352609)) (size!4810 (buf!5354 (_2!10246 lt!352609))))))

(assert (=> d!75607 (= (bitIndex!0 (size!4810 (buf!5354 (_2!10246 lt!352609))) (currentByte!10042 (_2!10246 lt!352609)) (currentBit!10037 (_2!10246 lt!352609))) lt!352640)))

(declare-fun b!223283 () Bool)

(declare-fun res!187442 () Bool)

(assert (=> b!223283 (=> (not res!187442) (not e!151959))))

(assert (=> b!223283 (= res!187442 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!352640))))

(declare-fun b!223284 () Bool)

(declare-fun lt!352641 () (_ BitVec 64))

(assert (=> b!223284 (= e!151959 (bvsle lt!352640 (bvmul lt!352641 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!223284 (or (= lt!352641 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!352641 #b0000000000000000000000000000000000000000000000000000000000001000) lt!352641)))))

(assert (=> b!223284 (= lt!352641 ((_ sign_extend 32) (size!4810 (buf!5354 (_2!10246 lt!352609)))))))

(assert (= (and d!75607 res!187441) b!223283))

(assert (= (and b!223283 res!187442) b!223284))

(declare-fun m!342011 () Bool)

(assert (=> d!75607 m!342011))

(assert (=> d!75607 m!341957))

(assert (=> b!223253 d!75607))

(declare-fun d!75609 () Bool)

(assert (=> d!75609 (= (invariant!0 (currentBit!10037 (_2!10246 lt!352609)) (currentByte!10042 (_2!10246 lt!352609)) (size!4810 (buf!5354 (_2!10246 lt!352609)))) (and (bvsge (currentBit!10037 (_2!10246 lt!352609)) #b00000000000000000000000000000000) (bvslt (currentBit!10037 (_2!10246 lt!352609)) #b00000000000000000000000000001000) (bvsge (currentByte!10042 (_2!10246 lt!352609)) #b00000000000000000000000000000000) (or (bvslt (currentByte!10042 (_2!10246 lt!352609)) (size!4810 (buf!5354 (_2!10246 lt!352609)))) (and (= (currentBit!10037 (_2!10246 lt!352609)) #b00000000000000000000000000000000) (= (currentByte!10042 (_2!10246 lt!352609)) (size!4810 (buf!5354 (_2!10246 lt!352609))))))))))

(assert (=> b!223253 d!75609))

(declare-fun d!75611 () Bool)

(declare-fun lt!352666 () (_ BitVec 8))

(declare-fun lt!352664 () (_ BitVec 8))

(assert (=> d!75611 (= lt!352666 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5746 (buf!5354 thiss!1870)) (currentByte!10042 thiss!1870))) ((_ sign_extend 24) lt!352664))))))

(assert (=> d!75611 (= lt!352664 ((_ extract 7 0) (currentBit!10037 thiss!1870)))))

(declare-fun e!151965 () Bool)

(assert (=> d!75611 e!151965))

(declare-fun res!187450 () Bool)

(assert (=> d!75611 (=> (not res!187450) (not e!151965))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!75611 (= res!187450 (validate_offset_bits!1 ((_ sign_extend 32) (size!4810 (buf!5354 thiss!1870))) ((_ sign_extend 32) (currentByte!10042 thiss!1870)) ((_ sign_extend 32) (currentBit!10037 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!19068 0))(
  ( (tuple2!19069 (_1!10252 Unit!16141) (_2!10252 (_ BitVec 8))) )
))
(declare-fun Unit!16147 () Unit!16141)

(declare-fun Unit!16148 () Unit!16141)

(assert (=> d!75611 (= (readByte!0 thiss!1870) (tuple2!19063 (_2!10252 (ite (bvsgt ((_ sign_extend 24) lt!352664) #b00000000000000000000000000000000) (tuple2!19069 Unit!16147 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!352666) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5746 (buf!5354 thiss!1870)) (bvadd (currentByte!10042 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!352664)))))))) (tuple2!19069 Unit!16148 lt!352666))) (BitStream!8723 (buf!5354 thiss!1870) (bvadd (currentByte!10042 thiss!1870) #b00000000000000000000000000000001) (currentBit!10037 thiss!1870))))))

(declare-fun b!223289 () Bool)

(declare-fun e!151964 () Bool)

(assert (=> b!223289 (= e!151965 e!151964)))

(declare-fun res!187451 () Bool)

(assert (=> b!223289 (=> (not res!187451) (not e!151964))))

(declare-fun lt!352660 () tuple2!19062)

(assert (=> b!223289 (= res!187451 (= (buf!5354 (_2!10246 lt!352660)) (buf!5354 thiss!1870)))))

(declare-fun lt!352665 () (_ BitVec 8))

(declare-fun lt!352663 () (_ BitVec 8))

(declare-fun Unit!16149 () Unit!16141)

(declare-fun Unit!16150 () Unit!16141)

(assert (=> b!223289 (= lt!352660 (tuple2!19063 (_2!10252 (ite (bvsgt ((_ sign_extend 24) lt!352663) #b00000000000000000000000000000000) (tuple2!19069 Unit!16149 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!352665) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5746 (buf!5354 thiss!1870)) (bvadd (currentByte!10042 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!352663)))))))) (tuple2!19069 Unit!16150 lt!352665))) (BitStream!8723 (buf!5354 thiss!1870) (bvadd (currentByte!10042 thiss!1870) #b00000000000000000000000000000001) (currentBit!10037 thiss!1870))))))

(assert (=> b!223289 (= lt!352665 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5746 (buf!5354 thiss!1870)) (currentByte!10042 thiss!1870))) ((_ sign_extend 24) lt!352663))))))

(assert (=> b!223289 (= lt!352663 ((_ extract 7 0) (currentBit!10037 thiss!1870)))))

(declare-fun lt!352661 () (_ BitVec 64))

(declare-fun lt!352662 () (_ BitVec 64))

(declare-fun b!223290 () Bool)

(assert (=> b!223290 (= e!151964 (= (bitIndex!0 (size!4810 (buf!5354 (_2!10246 lt!352660))) (currentByte!10042 (_2!10246 lt!352660)) (currentBit!10037 (_2!10246 lt!352660))) (bvadd lt!352662 lt!352661)))))

(assert (=> b!223290 (or (not (= (bvand lt!352662 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!352661 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!352662 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!352662 lt!352661) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!223290 (= lt!352661 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!223290 (= lt!352662 (bitIndex!0 (size!4810 (buf!5354 thiss!1870)) (currentByte!10042 thiss!1870) (currentBit!10037 thiss!1870)))))

(assert (= (and d!75611 res!187450) b!223289))

(assert (= (and b!223289 res!187451) b!223290))

(declare-fun m!342021 () Bool)

(assert (=> d!75611 m!342021))

(declare-fun m!342023 () Bool)

(assert (=> d!75611 m!342023))

(declare-fun m!342025 () Bool)

(assert (=> d!75611 m!342025))

(assert (=> b!223289 m!342025))

(assert (=> b!223289 m!342021))

(declare-fun m!342027 () Bool)

(assert (=> b!223290 m!342027))

(assert (=> b!223290 m!341955))

(assert (=> b!223253 d!75611))

(declare-fun d!75631 () Bool)

(declare-fun e!151966 () Bool)

(assert (=> d!75631 e!151966))

(declare-fun res!187452 () Bool)

(assert (=> d!75631 (=> (not res!187452) (not e!151966))))

(declare-fun lt!352667 () (_ BitVec 64))

(declare-fun lt!352669 () (_ BitVec 64))

(declare-fun lt!352671 () (_ BitVec 64))

(assert (=> d!75631 (= res!187452 (= lt!352667 (bvsub lt!352669 lt!352671)))))

(assert (=> d!75631 (or (= (bvand lt!352669 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!352671 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!352669 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!352669 lt!352671) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75631 (= lt!352671 (remainingBits!0 ((_ sign_extend 32) (size!4810 (buf!5354 thiss!1870))) ((_ sign_extend 32) (currentByte!10042 thiss!1870)) ((_ sign_extend 32) (currentBit!10037 thiss!1870))))))

(declare-fun lt!352670 () (_ BitVec 64))

(declare-fun lt!352672 () (_ BitVec 64))

(assert (=> d!75631 (= lt!352669 (bvmul lt!352670 lt!352672))))

(assert (=> d!75631 (or (= lt!352670 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!352672 (bvsdiv (bvmul lt!352670 lt!352672) lt!352670)))))

(assert (=> d!75631 (= lt!352672 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!75631 (= lt!352670 ((_ sign_extend 32) (size!4810 (buf!5354 thiss!1870))))))

(assert (=> d!75631 (= lt!352667 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10042 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10037 thiss!1870))))))

(assert (=> d!75631 (invariant!0 (currentBit!10037 thiss!1870) (currentByte!10042 thiss!1870) (size!4810 (buf!5354 thiss!1870)))))

(assert (=> d!75631 (= (bitIndex!0 (size!4810 (buf!5354 thiss!1870)) (currentByte!10042 thiss!1870) (currentBit!10037 thiss!1870)) lt!352667)))

(declare-fun b!223291 () Bool)

(declare-fun res!187453 () Bool)

(assert (=> b!223291 (=> (not res!187453) (not e!151966))))

(assert (=> b!223291 (= res!187453 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!352667))))

(declare-fun b!223292 () Bool)

(declare-fun lt!352668 () (_ BitVec 64))

(assert (=> b!223292 (= e!151966 (bvsle lt!352667 (bvmul lt!352668 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!223292 (or (= lt!352668 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!352668 #b0000000000000000000000000000000000000000000000000000000000001000) lt!352668)))))

(assert (=> b!223292 (= lt!352668 ((_ sign_extend 32) (size!4810 (buf!5354 thiss!1870))))))

(assert (= (and d!75631 res!187452) b!223291))

(assert (= (and b!223291 res!187453) b!223292))

(declare-fun m!342029 () Bool)

(assert (=> d!75631 m!342029))

(declare-fun m!342031 () Bool)

(assert (=> d!75631 m!342031))

(assert (=> b!223253 d!75631))

(declare-fun b!223334 () Bool)

(declare-fun e!151996 () tuple3!1146)

(declare-fun lt!352879 () Unit!16141)

(assert (=> b!223334 (= e!151996 (tuple3!1147 lt!352879 (_2!10246 lt!352609) (array!10963 (store (arr!5746 arr!308) i!761 (_1!10246 lt!352609)) (size!4810 arr!308))))))

(declare-fun call!3478 () (_ BitVec 64))

(assert (=> b!223334 (= call!3478 call!3478)))

(declare-fun lt!352858 () Unit!16141)

(declare-fun Unit!16151 () Unit!16141)

(assert (=> b!223334 (= lt!352858 Unit!16151)))

(declare-fun lt!352859 () Unit!16141)

(declare-fun arrayRangesEqReflexiveLemma!62 (array!10962) Unit!16141)

(assert (=> b!223334 (= lt!352859 (arrayRangesEqReflexiveLemma!62 (array!10963 (store (arr!5746 arr!308) i!761 (_1!10246 lt!352609)) (size!4810 arr!308))))))

(declare-fun call!3479 () Bool)

(assert (=> b!223334 call!3479))

(declare-fun lt!352864 () Unit!16141)

(assert (=> b!223334 (= lt!352864 lt!352859)))

(declare-fun lt!352855 () array!10962)

(assert (=> b!223334 (= lt!352855 (array!10963 (store (arr!5746 arr!308) i!761 (_1!10246 lt!352609)) (size!4810 arr!308)))))

(declare-fun lt!352866 () array!10962)

(assert (=> b!223334 (= lt!352866 (array!10963 (store (arr!5746 arr!308) i!761 (_1!10246 lt!352609)) (size!4810 arr!308)))))

(declare-fun lt!352873 () (_ BitVec 32))

(assert (=> b!223334 (= lt!352873 #b00000000000000000000000000000000)))

(declare-fun lt!352856 () (_ BitVec 32))

(assert (=> b!223334 (= lt!352856 (size!4810 (array!10963 (store (arr!5746 arr!308) i!761 (_1!10246 lt!352609)) (size!4810 arr!308))))))

(declare-fun lt!352869 () (_ BitVec 32))

(assert (=> b!223334 (= lt!352869 #b00000000000000000000000000000000)))

(declare-fun lt!352857 () (_ BitVec 32))

(assert (=> b!223334 (= lt!352857 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun arrayRangesEqSlicedLemma!62 (array!10962 array!10962 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16141)

(assert (=> b!223334 (= lt!352879 (arrayRangesEqSlicedLemma!62 lt!352855 lt!352866 lt!352873 lt!352856 lt!352869 lt!352857))))

(declare-fun call!3480 () Bool)

(assert (=> b!223334 call!3480))

(declare-fun b!223335 () Bool)

(declare-fun e!151997 () Bool)

(declare-fun lt!352874 () tuple3!1146)

(declare-datatypes ((tuple2!19070 0))(
  ( (tuple2!19071 (_1!10253 BitStream!8722) (_2!10253 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!8722) tuple2!19070)

(assert (=> b!223335 (= e!151997 (= (select (arr!5746 (_3!715 lt!352874)) (bvadd #b00000000000000000000000000000001 i!761)) (_2!10253 (readBytePure!0 (_2!10246 lt!352609)))))))

(assert (=> b!223335 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4810 (_3!715 lt!352874))))))

(declare-fun lt!352850 () tuple2!19062)

(declare-fun c!11087 () Bool)

(declare-fun bm!3475 () Bool)

(assert (=> bm!3475 (= call!3478 (bitIndex!0 (ite c!11087 (size!4810 (buf!5354 (_2!10246 lt!352850))) (size!4810 (buf!5354 (_2!10246 lt!352609)))) (ite c!11087 (currentByte!10042 (_2!10246 lt!352850)) (currentByte!10042 (_2!10246 lt!352609))) (ite c!11087 (currentBit!10037 (_2!10246 lt!352850)) (currentBit!10037 (_2!10246 lt!352609)))))))

(declare-fun bm!3476 () Bool)

(declare-fun lt!352848 () tuple3!1146)

(declare-fun lt!352844 () (_ BitVec 32))

(declare-fun arrayRangesEq!710 (array!10962 array!10962 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!3476 (= call!3479 (arrayRangesEq!710 (array!10963 (store (arr!5746 arr!308) i!761 (_1!10246 lt!352609)) (size!4810 arr!308)) (ite c!11087 (_3!715 lt!352848) (array!10963 (store (arr!5746 arr!308) i!761 (_1!10246 lt!352609)) (size!4810 arr!308))) (ite c!11087 lt!352844 #b00000000000000000000000000000000) (ite c!11087 (bvadd #b00000000000000000000000000000001 i!761) (size!4810 (array!10963 (store (arr!5746 arr!308) i!761 (_1!10246 lt!352609)) (size!4810 arr!308))))))))

(declare-fun b!223336 () Bool)

(declare-fun lt!352852 () Unit!16141)

(assert (=> b!223336 (= e!151996 (tuple3!1147 lt!352852 (_2!10247 lt!352848) (_3!715 lt!352848)))))

(assert (=> b!223336 (= lt!352850 (readByte!0 (_2!10246 lt!352609)))))

(declare-fun lt!352845 () array!10962)

(assert (=> b!223336 (= lt!352845 (array!10963 (store (arr!5746 (array!10963 (store (arr!5746 arr!308) i!761 (_1!10246 lt!352609)) (size!4810 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10246 lt!352850)) (size!4810 (array!10963 (store (arr!5746 arr!308) i!761 (_1!10246 lt!352609)) (size!4810 arr!308)))))))

(declare-fun lt!352860 () (_ BitVec 64))

(assert (=> b!223336 (= lt!352860 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!352863 () (_ BitVec 32))

(assert (=> b!223336 (= lt!352863 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!352871 () Unit!16141)

(assert (=> b!223336 (= lt!352871 (validateOffsetBytesFromBitIndexLemma!0 (_2!10246 lt!352609) (_2!10246 lt!352850) lt!352860 lt!352863))))

(assert (=> b!223336 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4810 (buf!5354 (_2!10246 lt!352850)))) ((_ sign_extend 32) (currentByte!10042 (_2!10246 lt!352850))) ((_ sign_extend 32) (currentBit!10037 (_2!10246 lt!352850))) (bvsub lt!352863 ((_ extract 31 0) (bvsdiv (bvadd lt!352860 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!352876 () Unit!16141)

(assert (=> b!223336 (= lt!352876 lt!352871)))

(assert (=> b!223336 (= lt!352848 (readByteArrayLoop!0 (_2!10246 lt!352850) lt!352845 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(assert (=> b!223336 (= call!3478 (bvadd (bitIndex!0 (size!4810 (buf!5354 (_2!10246 lt!352609))) (currentByte!10042 (_2!10246 lt!352609)) (currentBit!10037 (_2!10246 lt!352609))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!352875 () Unit!16141)

(declare-fun Unit!16152 () Unit!16141)

(assert (=> b!223336 (= lt!352875 Unit!16152)))

(assert (=> b!223336 (= (bvadd call!3478 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4810 (buf!5354 (_2!10247 lt!352848))) (currentByte!10042 (_2!10247 lt!352848)) (currentBit!10037 (_2!10247 lt!352848))))))

(declare-fun lt!352862 () Unit!16141)

(declare-fun Unit!16153 () Unit!16141)

(assert (=> b!223336 (= lt!352862 Unit!16153)))

(assert (=> b!223336 (= (bvadd (bitIndex!0 (size!4810 (buf!5354 (_2!10246 lt!352609))) (currentByte!10042 (_2!10246 lt!352609)) (currentBit!10037 (_2!10246 lt!352609))) (bvmul ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4810 (buf!5354 (_2!10247 lt!352848))) (currentByte!10042 (_2!10247 lt!352848)) (currentBit!10037 (_2!10247 lt!352848))))))

(declare-fun lt!352851 () Unit!16141)

(declare-fun Unit!16154 () Unit!16141)

(assert (=> b!223336 (= lt!352851 Unit!16154)))

(assert (=> b!223336 (and (= (buf!5354 (_2!10246 lt!352609)) (buf!5354 (_2!10247 lt!352848))) (= (size!4810 (array!10963 (store (arr!5746 arr!308) i!761 (_1!10246 lt!352609)) (size!4810 arr!308))) (size!4810 (_3!715 lt!352848))))))

(declare-fun lt!352877 () Unit!16141)

(declare-fun Unit!16155 () Unit!16141)

(assert (=> b!223336 (= lt!352877 Unit!16155)))

(declare-fun lt!352849 () Unit!16141)

(declare-fun arrayUpdatedAtPrefixLemma!302 (array!10962 (_ BitVec 32) (_ BitVec 8)) Unit!16141)

(assert (=> b!223336 (= lt!352849 (arrayUpdatedAtPrefixLemma!302 (array!10963 (store (arr!5746 arr!308) i!761 (_1!10246 lt!352609)) (size!4810 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) (_1!10246 lt!352850)))))

(assert (=> b!223336 (arrayRangesEq!710 (array!10963 (store (arr!5746 arr!308) i!761 (_1!10246 lt!352609)) (size!4810 arr!308)) (array!10963 (store (arr!5746 (array!10963 (store (arr!5746 arr!308) i!761 (_1!10246 lt!352609)) (size!4810 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10246 lt!352850)) (size!4810 (array!10963 (store (arr!5746 arr!308) i!761 (_1!10246 lt!352609)) (size!4810 arr!308)))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun lt!352846 () Unit!16141)

(assert (=> b!223336 (= lt!352846 lt!352849)))

(assert (=> b!223336 (= lt!352844 #b00000000000000000000000000000000)))

(declare-fun lt!352853 () Unit!16141)

(declare-fun arrayRangesEqTransitive!196 (array!10962 array!10962 array!10962 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16141)

(assert (=> b!223336 (= lt!352853 (arrayRangesEqTransitive!196 (array!10963 (store (arr!5746 arr!308) i!761 (_1!10246 lt!352609)) (size!4810 arr!308)) lt!352845 (_3!715 lt!352848) lt!352844 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!223336 call!3479))

(declare-fun lt!352872 () Unit!16141)

(assert (=> b!223336 (= lt!352872 lt!352853)))

(assert (=> b!223336 call!3480))

(declare-fun lt!352870 () Unit!16141)

(declare-fun Unit!16156 () Unit!16141)

(assert (=> b!223336 (= lt!352870 Unit!16156)))

(declare-fun lt!352865 () Unit!16141)

(declare-fun arrayRangesEqImpliesEq!71 (array!10962 array!10962 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16141)

(assert (=> b!223336 (= lt!352865 (arrayRangesEqImpliesEq!71 lt!352845 (_3!715 lt!352848) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!223336 (= (select (store (arr!5746 (array!10963 (store (arr!5746 arr!308) i!761 (_1!10246 lt!352609)) (size!4810 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10246 lt!352850)) (bvadd #b00000000000000000000000000000001 i!761)) (select (arr!5746 (_3!715 lt!352848)) (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!352847 () Unit!16141)

(assert (=> b!223336 (= lt!352847 lt!352865)))

(declare-fun lt!352861 () Bool)

(assert (=> b!223336 (= lt!352861 (= (select (arr!5746 (_3!715 lt!352848)) (bvadd #b00000000000000000000000000000001 i!761)) (_1!10246 lt!352850)))))

(declare-fun Unit!16159 () Unit!16141)

(assert (=> b!223336 (= lt!352852 Unit!16159)))

(assert (=> b!223336 lt!352861))

(declare-fun d!75633 () Bool)

(assert (=> d!75633 e!151997))

(declare-fun res!187491 () Bool)

(assert (=> d!75633 (=> res!187491 e!151997)))

(assert (=> d!75633 (= res!187491 (bvsge (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!352878 () Bool)

(declare-fun e!151998 () Bool)

(assert (=> d!75633 (= lt!352878 e!151998)))

(declare-fun res!187493 () Bool)

(assert (=> d!75633 (=> (not res!187493) (not e!151998))))

(declare-fun lt!352868 () (_ BitVec 64))

(declare-fun lt!352854 () (_ BitVec 64))

(assert (=> d!75633 (= res!187493 (= (bvadd lt!352854 lt!352868) (bitIndex!0 (size!4810 (buf!5354 (_2!10247 lt!352874))) (currentByte!10042 (_2!10247 lt!352874)) (currentBit!10037 (_2!10247 lt!352874)))))))

(assert (=> d!75633 (or (not (= (bvand lt!352854 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!352868 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!352854 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!352854 lt!352868) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!352867 () (_ BitVec 64))

(assert (=> d!75633 (= lt!352868 (bvmul lt!352867 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!75633 (or (= lt!352867 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!352867 #b0000000000000000000000000000000000000000000000000000000000001000) lt!352867)))))

(assert (=> d!75633 (= lt!352867 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))))))

(assert (=> d!75633 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b10000000000000000000000000000000)))))

(assert (=> d!75633 (= lt!352854 (bitIndex!0 (size!4810 (buf!5354 (_2!10246 lt!352609))) (currentByte!10042 (_2!10246 lt!352609)) (currentBit!10037 (_2!10246 lt!352609))))))

(assert (=> d!75633 (= lt!352874 e!151996)))

(assert (=> d!75633 (= c!11087 (bvslt (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> d!75633 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) to!496) (bvsle to!496 (size!4810 (array!10963 (store (arr!5746 arr!308) i!761 (_1!10246 lt!352609)) (size!4810 arr!308)))))))

(assert (=> d!75633 (= (readByteArrayLoop!0 (_2!10246 lt!352609) (array!10963 (store (arr!5746 arr!308) i!761 (_1!10246 lt!352609)) (size!4810 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496) lt!352874)))

(declare-fun b!223337 () Bool)

(declare-fun res!187492 () Bool)

(assert (=> b!223337 (=> (not res!187492) (not e!151998))))

(assert (=> b!223337 (= res!187492 (and (= (buf!5354 (_2!10246 lt!352609)) (buf!5354 (_2!10247 lt!352874))) (= (size!4810 (array!10963 (store (arr!5746 arr!308) i!761 (_1!10246 lt!352609)) (size!4810 arr!308))) (size!4810 (_3!715 lt!352874)))))))

(declare-fun bm!3477 () Bool)

(assert (=> bm!3477 (= call!3480 (arrayRangesEq!710 (ite c!11087 (array!10963 (store (arr!5746 arr!308) i!761 (_1!10246 lt!352609)) (size!4810 arr!308)) lt!352855) (ite c!11087 (_3!715 lt!352848) lt!352866) (ite c!11087 #b00000000000000000000000000000000 lt!352869) (ite c!11087 (bvadd #b00000000000000000000000000000001 i!761) lt!352857)))))

(declare-fun b!223338 () Bool)

(assert (=> b!223338 (= e!151998 (arrayRangesEq!710 (array!10963 (store (arr!5746 arr!308) i!761 (_1!10246 lt!352609)) (size!4810 arr!308)) (_3!715 lt!352874) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (= (and d!75633 c!11087) b!223336))

(assert (= (and d!75633 (not c!11087)) b!223334))

(assert (= (or b!223336 b!223334) bm!3477))

(assert (= (or b!223336 b!223334) bm!3476))

(assert (= (or b!223336 b!223334) bm!3475))

(assert (= (and d!75633 res!187493) b!223337))

(assert (= (and b!223337 res!187492) b!223338))

(assert (= (and d!75633 (not res!187491)) b!223335))

(declare-fun m!342057 () Bool)

(assert (=> b!223335 m!342057))

(declare-fun m!342059 () Bool)

(assert (=> b!223335 m!342059))

(declare-fun m!342061 () Bool)

(assert (=> b!223336 m!342061))

(declare-fun m!342063 () Bool)

(assert (=> b!223336 m!342063))

(declare-fun m!342065 () Bool)

(assert (=> b!223336 m!342065))

(declare-fun m!342067 () Bool)

(assert (=> b!223336 m!342067))

(declare-fun m!342069 () Bool)

(assert (=> b!223336 m!342069))

(declare-fun m!342071 () Bool)

(assert (=> b!223336 m!342071))

(declare-fun m!342073 () Bool)

(assert (=> b!223336 m!342073))

(declare-fun m!342075 () Bool)

(assert (=> b!223336 m!342075))

(declare-fun m!342077 () Bool)

(assert (=> b!223336 m!342077))

(declare-fun m!342079 () Bool)

(assert (=> b!223336 m!342079))

(declare-fun m!342081 () Bool)

(assert (=> b!223336 m!342081))

(assert (=> b!223336 m!341947))

(declare-fun m!342083 () Bool)

(assert (=> b!223336 m!342083))

(declare-fun m!342085 () Bool)

(assert (=> d!75633 m!342085))

(assert (=> d!75633 m!341947))

(declare-fun m!342087 () Bool)

(assert (=> bm!3477 m!342087))

(declare-fun m!342089 () Bool)

(assert (=> b!223334 m!342089))

(declare-fun m!342091 () Bool)

(assert (=> b!223334 m!342091))

(declare-fun m!342093 () Bool)

(assert (=> bm!3475 m!342093))

(declare-fun m!342095 () Bool)

(assert (=> b!223338 m!342095))

(declare-fun m!342097 () Bool)

(assert (=> bm!3476 m!342097))

(assert (=> b!223253 d!75633))

(declare-fun d!75652 () Bool)

(declare-fun e!152001 () Bool)

(assert (=> d!75652 e!152001))

(declare-fun res!187496 () Bool)

(assert (=> d!75652 (=> (not res!187496) (not e!152001))))

(assert (=> d!75652 (= res!187496 (and (or (let ((rhs!3659 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3659 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3659) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!75653 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!75653 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!75653 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3658 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3658 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3658) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!352888 () Unit!16141)

(declare-fun choose!57 (BitStream!8722 BitStream!8722 (_ BitVec 64) (_ BitVec 32)) Unit!16141)

(assert (=> d!75652 (= lt!352888 (choose!57 thiss!1870 (_2!10246 lt!352609) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> d!75652 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10246 lt!352609) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)) lt!352888)))

(declare-fun lt!352887 () (_ BitVec 32))

(declare-fun b!223341 () Bool)

(assert (=> b!223341 (= e!152001 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4810 (buf!5354 (_2!10246 lt!352609)))) ((_ sign_extend 32) (currentByte!10042 (_2!10246 lt!352609))) ((_ sign_extend 32) (currentBit!10037 (_2!10246 lt!352609))) (bvsub (bvsub to!496 i!761) lt!352887)))))

(assert (=> b!223341 (or (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand lt!352887 #b10000000000000000000000000000000)) (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!496 i!761) lt!352887) #b10000000000000000000000000000000)))))

(declare-fun lt!352886 () (_ BitVec 64))

(assert (=> b!223341 (= lt!352887 ((_ extract 31 0) lt!352886))))

(assert (=> b!223341 (and (bvslt lt!352886 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!352886 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!223341 (= lt!352886 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!75652 res!187496) b!223341))

(declare-fun m!342099 () Bool)

(assert (=> d!75652 m!342099))

(declare-fun m!342101 () Bool)

(assert (=> b!223341 m!342101))

(assert (=> b!223253 d!75652))

(declare-fun d!75655 () Bool)

(assert (=> d!75655 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4810 (buf!5354 (_2!10246 lt!352609)))) ((_ sign_extend 32) (currentByte!10042 (_2!10246 lt!352609))) ((_ sign_extend 32) (currentBit!10037 (_2!10246 lt!352609))) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4810 (buf!5354 (_2!10246 lt!352609)))) ((_ sign_extend 32) (currentByte!10042 (_2!10246 lt!352609))) ((_ sign_extend 32) (currentBit!10037 (_2!10246 lt!352609)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18455 () Bool)

(assert (= bs!18455 d!75655))

(assert (=> bs!18455 m!342011))

(assert (=> b!223253 d!75655))

(declare-fun d!75657 () Bool)

(assert (=> d!75657 (= (array_inv!4551 (buf!5354 thiss!1870)) (bvsge (size!4810 (buf!5354 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!223254 d!75657))

(declare-fun d!75659 () Bool)

(assert (=> d!75659 (= (array_inv!4551 arr!308) (bvsge (size!4810 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!46426 d!75659))

(declare-fun d!75661 () Bool)

(assert (=> d!75661 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10037 thiss!1870) (currentByte!10042 thiss!1870) (size!4810 (buf!5354 thiss!1870))))))

(declare-fun bs!18456 () Bool)

(assert (= bs!18456 d!75661))

(assert (=> bs!18456 m!342031))

(assert (=> start!46426 d!75661))

(declare-fun d!75663 () Bool)

(assert (=> d!75663 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4810 (buf!5354 thiss!1870))) ((_ sign_extend 32) (currentByte!10042 thiss!1870)) ((_ sign_extend 32) (currentBit!10037 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4810 (buf!5354 thiss!1870))) ((_ sign_extend 32) (currentByte!10042 thiss!1870)) ((_ sign_extend 32) (currentBit!10037 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18457 () Bool)

(assert (= bs!18457 d!75663))

(assert (=> bs!18457 m!342029))

(assert (=> b!223251 d!75663))

(push 1)

(assert (not d!75663))

(assert (not b!223336))

(assert (not b!223334))

(assert (not bm!3477))

(assert (not d!75655))

(assert (not d!75631))

(assert (not d!75652))

(assert (not d!75607))

(assert (not d!75633))

(assert (not b!223338))

(assert (not bm!3475))

(assert (not b!223341))

(assert (not bm!3476))

(assert (not b!223335))

(assert (not b!223290))

(assert (not d!75661))

(assert (not d!75611))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

