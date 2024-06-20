; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46430 () Bool)

(assert start!46430)

(declare-fun b!223277 () Bool)

(declare-fun e!151954 () Bool)

(declare-datatypes ((array!10966 0))(
  ( (array!10967 (arr!5748 (Array (_ BitVec 32) (_ BitVec 8))) (size!4812 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8726 0))(
  ( (BitStream!8727 (buf!5356 array!10966) (currentByte!10044 (_ BitVec 32)) (currentBit!10039 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!19066 0))(
  ( (tuple2!19067 (_1!10250 (_ BitVec 8)) (_2!10250 BitStream!8726)) )
))
(declare-fun lt!352627 () tuple2!19066)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!223277 (= e!151954 (not (invariant!0 (currentBit!10039 (_2!10250 lt!352627)) (currentByte!10044 (_2!10250 lt!352627)) (size!4812 (buf!5356 (_2!10250 lt!352627))))))))

(declare-fun thiss!1870 () BitStream!8726)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!223277 (= (bitIndex!0 (size!4812 (buf!5356 (_2!10250 lt!352627))) (currentByte!10044 (_2!10250 lt!352627)) (currentBit!10039 (_2!10250 lt!352627))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!4812 (buf!5356 thiss!1870)) (currentByte!10044 thiss!1870) (currentBit!10039 thiss!1870))))))

(declare-fun arr!308 () array!10966)

(declare-datatypes ((Unit!16145 0))(
  ( (Unit!16146) )
))
(declare-datatypes ((tuple3!1150 0))(
  ( (tuple3!1151 (_1!10251 Unit!16145) (_2!10251 BitStream!8726) (_3!717 array!10966)) )
))
(declare-fun lt!352626 () tuple3!1150)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun readByteArrayLoop!0 (BitStream!8726 array!10966 (_ BitVec 32) (_ BitVec 32)) tuple3!1150)

(assert (=> b!223277 (= lt!352626 (readByteArrayLoop!0 (_2!10250 lt!352627) (array!10967 (store (arr!5748 arr!308) i!761 (_1!10250 lt!352627)) (size!4812 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!223277 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4812 (buf!5356 (_2!10250 lt!352627)))) ((_ sign_extend 32) (currentByte!10044 (_2!10250 lt!352627))) ((_ sign_extend 32) (currentBit!10039 (_2!10250 lt!352627))) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!352625 () Unit!16145)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8726 BitStream!8726 (_ BitVec 64) (_ BitVec 32)) Unit!16145)

(assert (=> b!223277 (= lt!352625 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10250 lt!352627) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!8726) tuple2!19066)

(assert (=> b!223277 (= lt!352627 (readByte!0 thiss!1870))))

(declare-fun b!223278 () Bool)

(declare-fun e!151955 () Bool)

(declare-fun array_inv!4553 (array!10966) Bool)

(assert (=> b!223278 (= e!151955 (array_inv!4553 (buf!5356 thiss!1870)))))

(declare-fun b!223276 () Bool)

(declare-fun res!187435 () Bool)

(assert (=> b!223276 (=> (not res!187435) (not e!151954))))

(assert (=> b!223276 (= res!187435 (bvslt i!761 to!496))))

(declare-fun b!223275 () Bool)

(declare-fun res!187434 () Bool)

(assert (=> b!223275 (=> (not res!187434) (not e!151954))))

(assert (=> b!223275 (= res!187434 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4812 (buf!5356 thiss!1870))) ((_ sign_extend 32) (currentByte!10044 thiss!1870)) ((_ sign_extend 32) (currentBit!10039 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun res!187436 () Bool)

(assert (=> start!46430 (=> (not res!187436) (not e!151954))))

(assert (=> start!46430 (= res!187436 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4812 arr!308))))))

(assert (=> start!46430 e!151954))

(assert (=> start!46430 true))

(assert (=> start!46430 (array_inv!4553 arr!308)))

(declare-fun inv!12 (BitStream!8726) Bool)

(assert (=> start!46430 (and (inv!12 thiss!1870) e!151955)))

(assert (= (and start!46430 res!187436) b!223275))

(assert (= (and b!223275 res!187434) b!223276))

(assert (= (and b!223276 res!187435) b!223277))

(assert (= start!46430 b!223278))

(declare-fun m!341987 () Bool)

(assert (=> b!223277 m!341987))

(declare-fun m!341989 () Bool)

(assert (=> b!223277 m!341989))

(declare-fun m!341991 () Bool)

(assert (=> b!223277 m!341991))

(declare-fun m!341993 () Bool)

(assert (=> b!223277 m!341993))

(declare-fun m!341995 () Bool)

(assert (=> b!223277 m!341995))

(declare-fun m!341997 () Bool)

(assert (=> b!223277 m!341997))

(declare-fun m!341999 () Bool)

(assert (=> b!223277 m!341999))

(declare-fun m!342001 () Bool)

(assert (=> b!223277 m!342001))

(declare-fun m!342003 () Bool)

(assert (=> b!223278 m!342003))

(declare-fun m!342005 () Bool)

(assert (=> b!223275 m!342005))

(declare-fun m!342007 () Bool)

(assert (=> start!46430 m!342007))

(declare-fun m!342009 () Bool)

(assert (=> start!46430 m!342009))

(push 1)

(assert (not b!223275))

(assert (not b!223277))

(assert (not start!46430))

(assert (not b!223278))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!75613 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!75613 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4812 (buf!5356 thiss!1870))) ((_ sign_extend 32) (currentByte!10044 thiss!1870)) ((_ sign_extend 32) (currentBit!10039 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4812 (buf!5356 thiss!1870))) ((_ sign_extend 32) (currentByte!10044 thiss!1870)) ((_ sign_extend 32) (currentBit!10039 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18451 () Bool)

(assert (= bs!18451 d!75613))

(declare-fun m!342013 () Bool)

(assert (=> bs!18451 m!342013))

(assert (=> b!223275 d!75613))

(declare-fun d!75615 () Bool)

(assert (=> d!75615 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4812 (buf!5356 (_2!10250 lt!352627)))) ((_ sign_extend 32) (currentByte!10044 (_2!10250 lt!352627))) ((_ sign_extend 32) (currentBit!10039 (_2!10250 lt!352627))) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4812 (buf!5356 (_2!10250 lt!352627)))) ((_ sign_extend 32) (currentByte!10044 (_2!10250 lt!352627))) ((_ sign_extend 32) (currentBit!10039 (_2!10250 lt!352627)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18452 () Bool)

(assert (= bs!18452 d!75615))

(declare-fun m!342015 () Bool)

(assert (=> bs!18452 m!342015))

(assert (=> b!223277 d!75615))

(declare-fun d!75617 () Bool)

(assert (=> d!75617 (= (invariant!0 (currentBit!10039 (_2!10250 lt!352627)) (currentByte!10044 (_2!10250 lt!352627)) (size!4812 (buf!5356 (_2!10250 lt!352627)))) (and (bvsge (currentBit!10039 (_2!10250 lt!352627)) #b00000000000000000000000000000000) (bvslt (currentBit!10039 (_2!10250 lt!352627)) #b00000000000000000000000000001000) (bvsge (currentByte!10044 (_2!10250 lt!352627)) #b00000000000000000000000000000000) (or (bvslt (currentByte!10044 (_2!10250 lt!352627)) (size!4812 (buf!5356 (_2!10250 lt!352627)))) (and (= (currentBit!10039 (_2!10250 lt!352627)) #b00000000000000000000000000000000) (= (currentByte!10044 (_2!10250 lt!352627)) (size!4812 (buf!5356 (_2!10250 lt!352627))))))))))

(assert (=> b!223277 d!75617))

(declare-fun d!75619 () Bool)

(declare-fun lt!352701 () (_ BitVec 8))

(declare-fun lt!352705 () (_ BitVec 8))

(assert (=> d!75619 (= lt!352701 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5748 (buf!5356 thiss!1870)) (currentByte!10044 thiss!1870))) ((_ sign_extend 24) lt!352705))))))

(assert (=> d!75619 (= lt!352705 ((_ extract 7 0) (currentBit!10039 thiss!1870)))))

(declare-fun e!151975 () Bool)

(assert (=> d!75619 e!151975))

(declare-fun res!187463 () Bool)

(assert (=> d!75619 (=> (not res!187463) (not e!151975))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!75619 (= res!187463 (validate_offset_bits!1 ((_ sign_extend 32) (size!4812 (buf!5356 thiss!1870))) ((_ sign_extend 32) (currentByte!10044 thiss!1870)) ((_ sign_extend 32) (currentBit!10039 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!19074 0))(
  ( (tuple2!19075 (_1!10255 Unit!16145) (_2!10255 (_ BitVec 8))) )
))
(declare-fun Unit!16162 () Unit!16145)

(declare-fun Unit!16163 () Unit!16145)

(assert (=> d!75619 (= (readByte!0 thiss!1870) (tuple2!19067 (_2!10255 (ite (bvsgt ((_ sign_extend 24) lt!352705) #b00000000000000000000000000000000) (tuple2!19075 Unit!16162 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!352701) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5748 (buf!5356 thiss!1870)) (bvadd (currentByte!10044 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!352705)))))))) (tuple2!19075 Unit!16163 lt!352701))) (BitStream!8727 (buf!5356 thiss!1870) (bvadd (currentByte!10044 thiss!1870) #b00000000000000000000000000000001) (currentBit!10039 thiss!1870))))))

(declare-fun b!223301 () Bool)

(declare-fun e!151976 () Bool)

(assert (=> b!223301 (= e!151975 e!151976)))

(declare-fun res!187462 () Bool)

(assert (=> b!223301 (=> (not res!187462) (not e!151976))))

(declare-fun lt!352707 () tuple2!19066)

(assert (=> b!223301 (= res!187462 (= (buf!5356 (_2!10250 lt!352707)) (buf!5356 thiss!1870)))))

(declare-fun lt!352703 () (_ BitVec 8))

(declare-fun lt!352702 () (_ BitVec 8))

(declare-fun Unit!16164 () Unit!16145)

(declare-fun Unit!16165 () Unit!16145)

(assert (=> b!223301 (= lt!352707 (tuple2!19067 (_2!10255 (ite (bvsgt ((_ sign_extend 24) lt!352703) #b00000000000000000000000000000000) (tuple2!19075 Unit!16164 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!352702) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5748 (buf!5356 thiss!1870)) (bvadd (currentByte!10044 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!352703)))))))) (tuple2!19075 Unit!16165 lt!352702))) (BitStream!8727 (buf!5356 thiss!1870) (bvadd (currentByte!10044 thiss!1870) #b00000000000000000000000000000001) (currentBit!10039 thiss!1870))))))

(assert (=> b!223301 (= lt!352702 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5748 (buf!5356 thiss!1870)) (currentByte!10044 thiss!1870))) ((_ sign_extend 24) lt!352703))))))

(assert (=> b!223301 (= lt!352703 ((_ extract 7 0) (currentBit!10039 thiss!1870)))))

(declare-fun lt!352704 () (_ BitVec 64))

(declare-fun b!223302 () Bool)

(declare-fun lt!352706 () (_ BitVec 64))

(assert (=> b!223302 (= e!151976 (= (bitIndex!0 (size!4812 (buf!5356 (_2!10250 lt!352707))) (currentByte!10044 (_2!10250 lt!352707)) (currentBit!10039 (_2!10250 lt!352707))) (bvadd lt!352704 lt!352706)))))

(assert (=> b!223302 (or (not (= (bvand lt!352704 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!352706 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!352704 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!352704 lt!352706) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!223302 (= lt!352706 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!223302 (= lt!352704 (bitIndex!0 (size!4812 (buf!5356 thiss!1870)) (currentByte!10044 thiss!1870) (currentBit!10039 thiss!1870)))))

(assert (= (and d!75619 res!187463) b!223301))

(assert (= (and b!223301 res!187462) b!223302))

(declare-fun m!342033 () Bool)

(assert (=> d!75619 m!342033))

(declare-fun m!342035 () Bool)

(assert (=> d!75619 m!342035))

(declare-fun m!342037 () Bool)

(assert (=> d!75619 m!342037))

(assert (=> b!223301 m!342037))

(assert (=> b!223301 m!342033))

(declare-fun m!342039 () Bool)

(assert (=> b!223302 m!342039))

(assert (=> b!223302 m!342001))

(assert (=> b!223277 d!75619))

(declare-fun d!75635 () Bool)

(declare-fun e!151985 () Bool)

(assert (=> d!75635 e!151985))

(declare-fun res!187478 () Bool)

(assert (=> d!75635 (=> (not res!187478) (not e!151985))))

(declare-fun lt!352753 () (_ BitVec 64))

(declare-fun lt!352754 () (_ BitVec 64))

(declare-fun lt!352752 () (_ BitVec 64))

(assert (=> d!75635 (= res!187478 (= lt!352752 (bvsub lt!352753 lt!352754)))))

(assert (=> d!75635 (or (= (bvand lt!352753 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!352754 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!352753 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!352753 lt!352754) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75635 (= lt!352754 (remainingBits!0 ((_ sign_extend 32) (size!4812 (buf!5356 thiss!1870))) ((_ sign_extend 32) (currentByte!10044 thiss!1870)) ((_ sign_extend 32) (currentBit!10039 thiss!1870))))))

(declare-fun lt!352755 () (_ BitVec 64))

(declare-fun lt!352756 () (_ BitVec 64))

(assert (=> d!75635 (= lt!352753 (bvmul lt!352755 lt!352756))))

(assert (=> d!75635 (or (= lt!352755 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!352756 (bvsdiv (bvmul lt!352755 lt!352756) lt!352755)))))

(assert (=> d!75635 (= lt!352756 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!75635 (= lt!352755 ((_ sign_extend 32) (size!4812 (buf!5356 thiss!1870))))))

(assert (=> d!75635 (= lt!352752 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10044 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10039 thiss!1870))))))

(assert (=> d!75635 (invariant!0 (currentBit!10039 thiss!1870) (currentByte!10044 thiss!1870) (size!4812 (buf!5356 thiss!1870)))))

(assert (=> d!75635 (= (bitIndex!0 (size!4812 (buf!5356 thiss!1870)) (currentByte!10044 thiss!1870) (currentBit!10039 thiss!1870)) lt!352752)))

(declare-fun b!223317 () Bool)

(declare-fun res!187479 () Bool)

(assert (=> b!223317 (=> (not res!187479) (not e!151985))))

(assert (=> b!223317 (= res!187479 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!352752))))

(declare-fun b!223318 () Bool)

(declare-fun lt!352751 () (_ BitVec 64))

(assert (=> b!223318 (= e!151985 (bvsle lt!352752 (bvmul lt!352751 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!223318 (or (= lt!352751 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!352751 #b0000000000000000000000000000000000000000000000000000000000001000) lt!352751)))))

(assert (=> b!223318 (= lt!352751 ((_ sign_extend 32) (size!4812 (buf!5356 thiss!1870))))))

(assert (= (and d!75635 res!187478) b!223317))

(assert (= (and b!223317 res!187479) b!223318))

(assert (=> d!75635 m!342013))

(declare-fun m!342051 () Bool)

(assert (=> d!75635 m!342051))

(assert (=> b!223277 d!75635))

(declare-fun d!75643 () Bool)

(declare-fun e!151986 () Bool)

(assert (=> d!75643 e!151986))

(declare-fun res!187480 () Bool)

(assert (=> d!75643 (=> (not res!187480) (not e!151986))))

(declare-fun lt!352758 () (_ BitVec 64))

(declare-fun lt!352760 () (_ BitVec 64))

(declare-fun lt!352759 () (_ BitVec 64))

(assert (=> d!75643 (= res!187480 (= lt!352758 (bvsub lt!352759 lt!352760)))))

(assert (=> d!75643 (or (= (bvand lt!352759 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!352760 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!352759 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!352759 lt!352760) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75643 (= lt!352760 (remainingBits!0 ((_ sign_extend 32) (size!4812 (buf!5356 (_2!10250 lt!352627)))) ((_ sign_extend 32) (currentByte!10044 (_2!10250 lt!352627))) ((_ sign_extend 32) (currentBit!10039 (_2!10250 lt!352627)))))))

(declare-fun lt!352761 () (_ BitVec 64))

(declare-fun lt!352762 () (_ BitVec 64))

(assert (=> d!75643 (= lt!352759 (bvmul lt!352761 lt!352762))))

(assert (=> d!75643 (or (= lt!352761 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!352762 (bvsdiv (bvmul lt!352761 lt!352762) lt!352761)))))

(assert (=> d!75643 (= lt!352762 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!75643 (= lt!352761 ((_ sign_extend 32) (size!4812 (buf!5356 (_2!10250 lt!352627)))))))

(assert (=> d!75643 (= lt!352758 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10044 (_2!10250 lt!352627))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10039 (_2!10250 lt!352627)))))))

(assert (=> d!75643 (invariant!0 (currentBit!10039 (_2!10250 lt!352627)) (currentByte!10044 (_2!10250 lt!352627)) (size!4812 (buf!5356 (_2!10250 lt!352627))))))

(assert (=> d!75643 (= (bitIndex!0 (size!4812 (buf!5356 (_2!10250 lt!352627))) (currentByte!10044 (_2!10250 lt!352627)) (currentBit!10039 (_2!10250 lt!352627))) lt!352758)))

(declare-fun b!223319 () Bool)

(declare-fun res!187481 () Bool)

(assert (=> b!223319 (=> (not res!187481) (not e!151986))))

(assert (=> b!223319 (= res!187481 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!352758))))

(declare-fun b!223320 () Bool)

(declare-fun lt!352757 () (_ BitVec 64))

(assert (=> b!223320 (= e!151986 (bvsle lt!352758 (bvmul lt!352757 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!223320 (or (= lt!352757 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!352757 #b0000000000000000000000000000000000000000000000000000000000001000) lt!352757)))))

(assert (=> b!223320 (= lt!352757 ((_ sign_extend 32) (size!4812 (buf!5356 (_2!10250 lt!352627)))))))

(assert (= (and d!75643 res!187480) b!223319))

(assert (= (and b!223319 res!187481) b!223320))

(assert (=> d!75643 m!342015))

(assert (=> d!75643 m!341991))

(assert (=> b!223277 d!75643))

(declare-fun d!75645 () Bool)

(declare-fun e!152015 () Bool)

(assert (=> d!75645 e!152015))

(declare-fun res!187509 () Bool)

(assert (=> d!75645 (=> res!187509 e!152015)))

(assert (=> d!75645 (= res!187509 (bvsge (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!353049 () Bool)

(declare-fun e!152016 () Bool)

(assert (=> d!75645 (= lt!353049 e!152016)))

(declare-fun res!187510 () Bool)

(assert (=> d!75645 (=> (not res!187510) (not e!152016))))

(declare-fun lt!353060 () (_ BitVec 64))

(declare-fun lt!353034 () tuple3!1150)

(declare-fun lt!353057 () (_ BitVec 64))

(assert (=> d!75645 (= res!187510 (= (bvadd lt!353060 lt!353057) (bitIndex!0 (size!4812 (buf!5356 (_2!10251 lt!353034))) (currentByte!10044 (_2!10251 lt!353034)) (currentBit!10039 (_2!10251 lt!353034)))))))

(assert (=> d!75645 (or (not (= (bvand lt!353060 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!353057 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!353060 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!353060 lt!353057) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!353046 () (_ BitVec 64))

(assert (=> d!75645 (= lt!353057 (bvmul lt!353046 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!75645 (or (= lt!353046 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!353046 #b0000000000000000000000000000000000000000000000000000000000001000) lt!353046)))))

(assert (=> d!75645 (= lt!353046 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))))))

(assert (=> d!75645 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b10000000000000000000000000000000)))))

(assert (=> d!75645 (= lt!353060 (bitIndex!0 (size!4812 (buf!5356 (_2!10250 lt!352627))) (currentByte!10044 (_2!10250 lt!352627)) (currentBit!10039 (_2!10250 lt!352627))))))

(declare-fun e!152014 () tuple3!1150)

(assert (=> d!75645 (= lt!353034 e!152014)))

(declare-fun c!11092 () Bool)

(assert (=> d!75645 (= c!11092 (bvslt (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> d!75645 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) to!496) (bvsle to!496 (size!4812 (array!10967 (store (arr!5748 arr!308) i!761 (_1!10250 lt!352627)) (size!4812 arr!308)))))))

(assert (=> d!75645 (= (readByteArrayLoop!0 (_2!10250 lt!352627) (array!10967 (store (arr!5748 arr!308) i!761 (_1!10250 lt!352627)) (size!4812 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496) lt!353034)))

(declare-fun call!3495 () (_ BitVec 64))

(declare-fun lt!353056 () tuple3!1150)

(declare-fun bm!3490 () Bool)

(assert (=> bm!3490 (= call!3495 (bitIndex!0 (ite c!11092 (size!4812 (buf!5356 (_2!10251 lt!353056))) (size!4812 (buf!5356 (_2!10250 lt!352627)))) (ite c!11092 (currentByte!10044 (_2!10251 lt!353056)) (currentByte!10044 (_2!10250 lt!352627))) (ite c!11092 (currentBit!10039 (_2!10251 lt!353056)) (currentBit!10039 (_2!10250 lt!352627)))))))

(declare-fun b!223362 () Bool)

(declare-fun lt!353045 () Unit!16145)

(assert (=> b!223362 (= e!152014 (tuple3!1151 lt!353045 (_2!10250 lt!352627) (array!10967 (store (arr!5748 arr!308) i!761 (_1!10250 lt!352627)) (size!4812 arr!308))))))

(assert (=> b!223362 (= call!3495 call!3495)))

(declare-fun lt!353054 () Unit!16145)

(declare-fun Unit!16173 () Unit!16145)

(assert (=> b!223362 (= lt!353054 Unit!16173)))

(declare-fun lt!353068 () Unit!16145)

(declare-fun arrayRangesEqReflexiveLemma!64 (array!10966) Unit!16145)

(assert (=> b!223362 (= lt!353068 (arrayRangesEqReflexiveLemma!64 (array!10967 (store (arr!5748 arr!308) i!761 (_1!10250 lt!352627)) (size!4812 arr!308))))))

(declare-fun call!3493 () Bool)

(assert (=> b!223362 call!3493))

(declare-fun lt!353061 () Unit!16145)

(assert (=> b!223362 (= lt!353061 lt!353068)))

(declare-fun lt!353062 () array!10966)

(assert (=> b!223362 (= lt!353062 (array!10967 (store (arr!5748 arr!308) i!761 (_1!10250 lt!352627)) (size!4812 arr!308)))))

(declare-fun lt!353066 () array!10966)

(assert (=> b!223362 (= lt!353066 (array!10967 (store (arr!5748 arr!308) i!761 (_1!10250 lt!352627)) (size!4812 arr!308)))))

(declare-fun lt!353053 () (_ BitVec 32))

(assert (=> b!223362 (= lt!353053 #b00000000000000000000000000000000)))

(declare-fun lt!353043 () (_ BitVec 32))

(assert (=> b!223362 (= lt!353043 (size!4812 (array!10967 (store (arr!5748 arr!308) i!761 (_1!10250 lt!352627)) (size!4812 arr!308))))))

(declare-fun lt!353036 () (_ BitVec 32))

(assert (=> b!223362 (= lt!353036 #b00000000000000000000000000000000)))

(declare-fun lt!353058 () (_ BitVec 32))

(assert (=> b!223362 (= lt!353058 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun arrayRangesEqSlicedLemma!64 (array!10966 array!10966 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16145)

(assert (=> b!223362 (= lt!353045 (arrayRangesEqSlicedLemma!64 lt!353062 lt!353066 lt!353053 lt!353043 lt!353036 lt!353058))))

(declare-fun call!3494 () Bool)

(assert (=> b!223362 call!3494))

(declare-fun b!223363 () Bool)

(declare-fun lt!353055 () Unit!16145)

(assert (=> b!223363 (= e!152014 (tuple3!1151 lt!353055 (_2!10251 lt!353056) (_3!717 lt!353056)))))

