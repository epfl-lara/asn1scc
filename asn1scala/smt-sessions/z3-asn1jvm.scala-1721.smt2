; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47506 () Bool)

(assert start!47506)

(declare-fun lt!360317 () (_ BitVec 64))

(declare-fun e!154785 () Bool)

(declare-fun lt!360320 () (_ BitVec 64))

(declare-fun b!226424 () Bool)

(declare-fun lt!360318 () (_ BitVec 64))

(assert (=> b!226424 (= e!154785 (not (or (not (= lt!360320 (bvand lt!360317 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!360320 (bvand (bvadd lt!360318 lt!360317) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!226424 (= lt!360320 (bvand lt!360318 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!360324 () (_ BitVec 32))

(assert (=> b!226424 (= lt!360317 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!360324)))))

(declare-fun lt!360319 () (_ BitVec 64))

(assert (=> b!226424 (= lt!360318 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!360319))))

(declare-datatypes ((array!11329 0))(
  ( (array!11330 (arr!5933 (Array (_ BitVec 32) (_ BitVec 8))) (size!4970 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9036 0))(
  ( (BitStream!9037 (buf!5511 array!11329) (currentByte!10325 (_ BitVec 32)) (currentBit!10320 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!19414 0))(
  ( (tuple2!19415 (_1!10510 (_ BitVec 8)) (_2!10510 BitStream!9036)) )
))
(declare-fun lt!360323 () tuple2!19414)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!226424 (= lt!360318 (bitIndex!0 (size!4970 (buf!5511 (_2!10510 lt!360323))) (currentByte!10325 (_2!10510 lt!360323)) (currentBit!10320 (_2!10510 lt!360323))))))

(declare-fun thiss!1870 () BitStream!9036)

(assert (=> b!226424 (= lt!360319 (bitIndex!0 (size!4970 (buf!5511 thiss!1870)) (currentByte!10325 thiss!1870) (currentBit!10320 thiss!1870)))))

(declare-datatypes ((Unit!16751 0))(
  ( (Unit!16752) )
))
(declare-datatypes ((tuple3!1322 0))(
  ( (tuple3!1323 (_1!10511 Unit!16751) (_2!10511 BitStream!9036) (_3!803 array!11329)) )
))
(declare-fun lt!360322 () tuple3!1322)

(declare-fun arr!308 () array!11329)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun readByteArrayLoop!0 (BitStream!9036 array!11329 (_ BitVec 32) (_ BitVec 32)) tuple3!1322)

(assert (=> b!226424 (= lt!360322 (readByteArrayLoop!0 (_2!10510 lt!360323) (array!11330 (store (arr!5933 arr!308) i!761 (_1!10510 lt!360323)) (size!4970 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!226424 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4970 (buf!5511 (_2!10510 lt!360323)))) ((_ sign_extend 32) (currentByte!10325 (_2!10510 lt!360323))) ((_ sign_extend 32) (currentBit!10320 (_2!10510 lt!360323))) lt!360324)))

(assert (=> b!226424 (= lt!360324 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!360321 () Unit!16751)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9036 BitStream!9036 (_ BitVec 64) (_ BitVec 32)) Unit!16751)

(assert (=> b!226424 (= lt!360321 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10510 lt!360323) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!9036) tuple2!19414)

(assert (=> b!226424 (= lt!360323 (readByte!0 thiss!1870))))

(declare-fun b!226423 () Bool)

(declare-fun res!189986 () Bool)

(assert (=> b!226423 (=> (not res!189986) (not e!154785))))

(assert (=> b!226423 (= res!189986 (bvslt i!761 to!496))))

(declare-fun b!226422 () Bool)

(declare-fun res!189987 () Bool)

(assert (=> b!226422 (=> (not res!189987) (not e!154785))))

(assert (=> b!226422 (= res!189987 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4970 (buf!5511 thiss!1870))) ((_ sign_extend 32) (currentByte!10325 thiss!1870)) ((_ sign_extend 32) (currentBit!10320 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun res!189988 () Bool)

(assert (=> start!47506 (=> (not res!189988) (not e!154785))))

(assert (=> start!47506 (= res!189988 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4970 arr!308))))))

(assert (=> start!47506 e!154785))

(assert (=> start!47506 true))

(declare-fun array_inv!4711 (array!11329) Bool)

(assert (=> start!47506 (array_inv!4711 arr!308)))

(declare-fun e!154784 () Bool)

(declare-fun inv!12 (BitStream!9036) Bool)

(assert (=> start!47506 (and (inv!12 thiss!1870) e!154784)))

(declare-fun b!226425 () Bool)

(assert (=> b!226425 (= e!154784 (array_inv!4711 (buf!5511 thiss!1870)))))

(assert (= (and start!47506 res!189988) b!226422))

(assert (= (and b!226422 res!189987) b!226423))

(assert (= (and b!226423 res!189986) b!226424))

(assert (= start!47506 b!226425))

(declare-fun m!347807 () Bool)

(assert (=> b!226424 m!347807))

(declare-fun m!347809 () Bool)

(assert (=> b!226424 m!347809))

(declare-fun m!347811 () Bool)

(assert (=> b!226424 m!347811))

(declare-fun m!347813 () Bool)

(assert (=> b!226424 m!347813))

(declare-fun m!347815 () Bool)

(assert (=> b!226424 m!347815))

(declare-fun m!347817 () Bool)

(assert (=> b!226424 m!347817))

(declare-fun m!347819 () Bool)

(assert (=> b!226424 m!347819))

(declare-fun m!347821 () Bool)

(assert (=> b!226422 m!347821))

(declare-fun m!347823 () Bool)

(assert (=> start!47506 m!347823))

(declare-fun m!347825 () Bool)

(assert (=> start!47506 m!347825))

(declare-fun m!347827 () Bool)

(assert (=> b!226425 m!347827))

(check-sat (not b!226422) (not start!47506) (not b!226425) (not b!226424))
(check-sat)
(get-model)

(declare-fun d!76842 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!76842 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4970 (buf!5511 thiss!1870))) ((_ sign_extend 32) (currentByte!10325 thiss!1870)) ((_ sign_extend 32) (currentBit!10320 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4970 (buf!5511 thiss!1870))) ((_ sign_extend 32) (currentByte!10325 thiss!1870)) ((_ sign_extend 32) (currentBit!10320 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18788 () Bool)

(assert (= bs!18788 d!76842))

(declare-fun m!347863 () Bool)

(assert (=> bs!18788 m!347863))

(assert (=> b!226422 d!76842))

(declare-fun d!76846 () Bool)

(assert (=> d!76846 (= (array_inv!4711 arr!308) (bvsge (size!4970 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!47506 d!76846))

(declare-fun d!76848 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!76848 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10320 thiss!1870) (currentByte!10325 thiss!1870) (size!4970 (buf!5511 thiss!1870))))))

(declare-fun bs!18790 () Bool)

(assert (= bs!18790 d!76848))

(declare-fun m!347867 () Bool)

(assert (=> bs!18790 m!347867))

(assert (=> start!47506 d!76848))

(declare-fun d!76852 () Bool)

(assert (=> d!76852 (= (array_inv!4711 (buf!5511 thiss!1870)) (bvsge (size!4970 (buf!5511 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!226425 d!76852))

(declare-fun d!76854 () Bool)

(assert (=> d!76854 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4970 (buf!5511 (_2!10510 lt!360323)))) ((_ sign_extend 32) (currentByte!10325 (_2!10510 lt!360323))) ((_ sign_extend 32) (currentBit!10320 (_2!10510 lt!360323))) lt!360324) (bvsle ((_ sign_extend 32) lt!360324) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4970 (buf!5511 (_2!10510 lt!360323)))) ((_ sign_extend 32) (currentByte!10325 (_2!10510 lt!360323))) ((_ sign_extend 32) (currentBit!10320 (_2!10510 lt!360323)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18791 () Bool)

(assert (= bs!18791 d!76854))

(declare-fun m!347869 () Bool)

(assert (=> bs!18791 m!347869))

(assert (=> b!226424 d!76854))

(declare-fun d!76856 () Bool)

(declare-fun lt!360434 () (_ BitVec 8))

(declare-fun lt!360435 () (_ BitVec 8))

(assert (=> d!76856 (= lt!360434 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5933 (buf!5511 thiss!1870)) (currentByte!10325 thiss!1870))) ((_ sign_extend 24) lt!360435))))))

(assert (=> d!76856 (= lt!360435 ((_ extract 7 0) (currentBit!10320 thiss!1870)))))

(declare-fun e!154821 () Bool)

(assert (=> d!76856 e!154821))

(declare-fun res!190026 () Bool)

(assert (=> d!76856 (=> (not res!190026) (not e!154821))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!76856 (= res!190026 (validate_offset_bits!1 ((_ sign_extend 32) (size!4970 (buf!5511 thiss!1870))) ((_ sign_extend 32) (currentByte!10325 thiss!1870)) ((_ sign_extend 32) (currentBit!10320 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!19420 0))(
  ( (tuple2!19421 (_1!10515 Unit!16751) (_2!10515 (_ BitVec 8))) )
))
(declare-fun Unit!16760 () Unit!16751)

(declare-fun Unit!16761 () Unit!16751)

(assert (=> d!76856 (= (readByte!0 thiss!1870) (tuple2!19415 (_2!10515 (ite (bvsgt ((_ sign_extend 24) lt!360435) #b00000000000000000000000000000000) (tuple2!19421 Unit!16760 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!360434) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5933 (buf!5511 thiss!1870)) (bvadd (currentByte!10325 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!360435)))))))) (tuple2!19421 Unit!16761 lt!360434))) (BitStream!9037 (buf!5511 thiss!1870) (bvadd (currentByte!10325 thiss!1870) #b00000000000000000000000000000001) (currentBit!10320 thiss!1870))))))

(declare-fun b!226463 () Bool)

(declare-fun e!154820 () Bool)

(assert (=> b!226463 (= e!154821 e!154820)))

(declare-fun res!190027 () Bool)

(assert (=> b!226463 (=> (not res!190027) (not e!154820))))

(declare-fun lt!360431 () tuple2!19414)

(assert (=> b!226463 (= res!190027 (= (buf!5511 (_2!10510 lt!360431)) (buf!5511 thiss!1870)))))

(declare-fun lt!360433 () (_ BitVec 8))

(declare-fun lt!360432 () (_ BitVec 8))

(declare-fun Unit!16762 () Unit!16751)

(declare-fun Unit!16764 () Unit!16751)

(assert (=> b!226463 (= lt!360431 (tuple2!19415 (_2!10515 (ite (bvsgt ((_ sign_extend 24) lt!360432) #b00000000000000000000000000000000) (tuple2!19421 Unit!16762 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!360433) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5933 (buf!5511 thiss!1870)) (bvadd (currentByte!10325 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!360432)))))))) (tuple2!19421 Unit!16764 lt!360433))) (BitStream!9037 (buf!5511 thiss!1870) (bvadd (currentByte!10325 thiss!1870) #b00000000000000000000000000000001) (currentBit!10320 thiss!1870))))))

(assert (=> b!226463 (= lt!360433 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5933 (buf!5511 thiss!1870)) (currentByte!10325 thiss!1870))) ((_ sign_extend 24) lt!360432))))))

(assert (=> b!226463 (= lt!360432 ((_ extract 7 0) (currentBit!10320 thiss!1870)))))

(declare-fun lt!360437 () (_ BitVec 64))

(declare-fun b!226464 () Bool)

(declare-fun lt!360436 () (_ BitVec 64))

(assert (=> b!226464 (= e!154820 (= (bitIndex!0 (size!4970 (buf!5511 (_2!10510 lt!360431))) (currentByte!10325 (_2!10510 lt!360431)) (currentBit!10320 (_2!10510 lt!360431))) (bvadd lt!360436 lt!360437)))))

(assert (=> b!226464 (or (not (= (bvand lt!360436 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!360437 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!360436 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!360436 lt!360437) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!226464 (= lt!360437 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!226464 (= lt!360436 (bitIndex!0 (size!4970 (buf!5511 thiss!1870)) (currentByte!10325 thiss!1870) (currentBit!10320 thiss!1870)))))

(assert (= (and d!76856 res!190026) b!226463))

(assert (= (and b!226463 res!190027) b!226464))

(declare-fun m!347881 () Bool)

(assert (=> d!76856 m!347881))

(declare-fun m!347883 () Bool)

(assert (=> d!76856 m!347883))

(declare-fun m!347885 () Bool)

(assert (=> d!76856 m!347885))

(assert (=> b!226463 m!347885))

(assert (=> b!226463 m!347881))

(declare-fun m!347887 () Bool)

(assert (=> b!226464 m!347887))

(assert (=> b!226464 m!347819))

(assert (=> b!226424 d!76856))

(declare-fun d!76871 () Bool)

(declare-fun e!154828 () Bool)

(assert (=> d!76871 e!154828))

(declare-fun res!190039 () Bool)

(assert (=> d!76871 (=> (not res!190039) (not e!154828))))

(declare-fun lt!360472 () (_ BitVec 64))

(declare-fun lt!360469 () (_ BitVec 64))

(declare-fun lt!360474 () (_ BitVec 64))

(assert (=> d!76871 (= res!190039 (= lt!360472 (bvsub lt!360474 lt!360469)))))

(assert (=> d!76871 (or (= (bvand lt!360474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!360469 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!360474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!360474 lt!360469) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!76871 (= lt!360469 (remainingBits!0 ((_ sign_extend 32) (size!4970 (buf!5511 thiss!1870))) ((_ sign_extend 32) (currentByte!10325 thiss!1870)) ((_ sign_extend 32) (currentBit!10320 thiss!1870))))))

(declare-fun lt!360471 () (_ BitVec 64))

(declare-fun lt!360473 () (_ BitVec 64))

(assert (=> d!76871 (= lt!360474 (bvmul lt!360471 lt!360473))))

(assert (=> d!76871 (or (= lt!360471 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!360473 (bvsdiv (bvmul lt!360471 lt!360473) lt!360471)))))

(assert (=> d!76871 (= lt!360473 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76871 (= lt!360471 ((_ sign_extend 32) (size!4970 (buf!5511 thiss!1870))))))

(assert (=> d!76871 (= lt!360472 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10325 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10320 thiss!1870))))))

(assert (=> d!76871 (invariant!0 (currentBit!10320 thiss!1870) (currentByte!10325 thiss!1870) (size!4970 (buf!5511 thiss!1870)))))

(assert (=> d!76871 (= (bitIndex!0 (size!4970 (buf!5511 thiss!1870)) (currentByte!10325 thiss!1870) (currentBit!10320 thiss!1870)) lt!360472)))

(declare-fun b!226475 () Bool)

(declare-fun res!190038 () Bool)

(assert (=> b!226475 (=> (not res!190038) (not e!154828))))

(assert (=> b!226475 (= res!190038 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!360472))))

(declare-fun b!226476 () Bool)

(declare-fun lt!360470 () (_ BitVec 64))

(assert (=> b!226476 (= e!154828 (bvsle lt!360472 (bvmul lt!360470 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!226476 (or (= lt!360470 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!360470 #b0000000000000000000000000000000000000000000000000000000000001000) lt!360470)))))

(assert (=> b!226476 (= lt!360470 ((_ sign_extend 32) (size!4970 (buf!5511 thiss!1870))))))

(assert (= (and d!76871 res!190039) b!226475))

(assert (= (and b!226475 res!190038) b!226476))

(assert (=> d!76871 m!347863))

(assert (=> d!76871 m!347867))

(assert (=> b!226424 d!76871))

(declare-fun lt!360710 () tuple2!19414)

(declare-fun call!3736 () (_ BitVec 64))

(declare-fun c!11175 () Bool)

(declare-fun bm!3733 () Bool)

(assert (=> bm!3733 (= call!3736 (bitIndex!0 (ite c!11175 (size!4970 (buf!5511 (_2!10510 lt!360710))) (size!4970 (buf!5511 (_2!10510 lt!360323)))) (ite c!11175 (currentByte!10325 (_2!10510 lt!360710)) (currentByte!10325 (_2!10510 lt!360323))) (ite c!11175 (currentBit!10320 (_2!10510 lt!360710)) (currentBit!10320 (_2!10510 lt!360323)))))))

(declare-fun b!226513 () Bool)

(declare-fun lt!360701 () Unit!16751)

(declare-fun e!154853 () tuple3!1322)

(assert (=> b!226513 (= e!154853 (tuple3!1323 lt!360701 (_2!10510 lt!360323) (array!11330 (store (arr!5933 arr!308) i!761 (_1!10510 lt!360323)) (size!4970 arr!308))))))

(assert (=> b!226513 (= call!3736 call!3736)))

(declare-fun lt!360713 () Unit!16751)

(declare-fun Unit!16774 () Unit!16751)

(assert (=> b!226513 (= lt!360713 Unit!16774)))

(declare-fun lt!360708 () Unit!16751)

(declare-fun arrayRangesEqReflexiveLemma!122 (array!11329) Unit!16751)

(assert (=> b!226513 (= lt!360708 (arrayRangesEqReflexiveLemma!122 (array!11330 (store (arr!5933 arr!308) i!761 (_1!10510 lt!360323)) (size!4970 arr!308))))))

(declare-fun call!3737 () Bool)

(assert (=> b!226513 call!3737))

(declare-fun lt!360728 () Unit!16751)

(assert (=> b!226513 (= lt!360728 lt!360708)))

(declare-fun lt!360724 () array!11329)

(assert (=> b!226513 (= lt!360724 (array!11330 (store (arr!5933 arr!308) i!761 (_1!10510 lt!360323)) (size!4970 arr!308)))))

(declare-fun lt!360703 () array!11329)

(assert (=> b!226513 (= lt!360703 (array!11330 (store (arr!5933 arr!308) i!761 (_1!10510 lt!360323)) (size!4970 arr!308)))))

(declare-fun lt!360722 () (_ BitVec 32))

(assert (=> b!226513 (= lt!360722 #b00000000000000000000000000000000)))

(declare-fun lt!360733 () (_ BitVec 32))

(assert (=> b!226513 (= lt!360733 (size!4970 (array!11330 (store (arr!5933 arr!308) i!761 (_1!10510 lt!360323)) (size!4970 arr!308))))))

(declare-fun lt!360706 () (_ BitVec 32))

(assert (=> b!226513 (= lt!360706 #b00000000000000000000000000000000)))

(declare-fun lt!360729 () (_ BitVec 32))

(assert (=> b!226513 (= lt!360729 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun arrayRangesEqSlicedLemma!107 (array!11329 array!11329 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16751)

(assert (=> b!226513 (= lt!360701 (arrayRangesEqSlicedLemma!107 lt!360724 lt!360703 lt!360722 lt!360733 lt!360706 lt!360729))))

(declare-fun call!3738 () Bool)

(assert (=> b!226513 call!3738))

(declare-fun d!76875 () Bool)

(declare-fun e!154852 () Bool)

(assert (=> d!76875 e!154852))

(declare-fun res!190064 () Bool)

(assert (=> d!76875 (=> res!190064 e!154852)))

(assert (=> d!76875 (= res!190064 (bvsge (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!360726 () Bool)

(declare-fun e!154851 () Bool)

(assert (=> d!76875 (= lt!360726 e!154851)))

(declare-fun res!190062 () Bool)

(assert (=> d!76875 (=> (not res!190062) (not e!154851))))

(declare-fun lt!360719 () (_ BitVec 64))

(declare-fun lt!360702 () tuple3!1322)

(declare-fun lt!360715 () (_ BitVec 64))

(assert (=> d!76875 (= res!190062 (= (bvadd lt!360719 lt!360715) (bitIndex!0 (size!4970 (buf!5511 (_2!10511 lt!360702))) (currentByte!10325 (_2!10511 lt!360702)) (currentBit!10320 (_2!10511 lt!360702)))))))

(assert (=> d!76875 (or (not (= (bvand lt!360719 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!360715 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!360719 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!360719 lt!360715) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!360700 () (_ BitVec 64))

(assert (=> d!76875 (= lt!360715 (bvmul lt!360700 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!76875 (or (= lt!360700 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!360700 #b0000000000000000000000000000000000000000000000000000000000001000) lt!360700)))))

(assert (=> d!76875 (= lt!360700 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))))))

(assert (=> d!76875 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b10000000000000000000000000000000)))))

(assert (=> d!76875 (= lt!360719 (bitIndex!0 (size!4970 (buf!5511 (_2!10510 lt!360323))) (currentByte!10325 (_2!10510 lt!360323)) (currentBit!10320 (_2!10510 lt!360323))))))

(assert (=> d!76875 (= lt!360702 e!154853)))

(assert (=> d!76875 (= c!11175 (bvslt (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> d!76875 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) to!496) (bvsle to!496 (size!4970 (array!11330 (store (arr!5933 arr!308) i!761 (_1!10510 lt!360323)) (size!4970 arr!308)))))))

(assert (=> d!76875 (= (readByteArrayLoop!0 (_2!10510 lt!360323) (array!11330 (store (arr!5933 arr!308) i!761 (_1!10510 lt!360323)) (size!4970 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496) lt!360702)))

(declare-fun lt!360727 () (_ BitVec 32))

(declare-fun lt!360720 () tuple3!1322)

(declare-fun bm!3734 () Bool)

(declare-fun arrayRangesEq!818 (array!11329 array!11329 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!3734 (= call!3737 (arrayRangesEq!818 (array!11330 (store (arr!5933 arr!308) i!761 (_1!10510 lt!360323)) (size!4970 arr!308)) (ite c!11175 (_3!803 lt!360720) (array!11330 (store (arr!5933 arr!308) i!761 (_1!10510 lt!360323)) (size!4970 arr!308))) (ite c!11175 lt!360727 #b00000000000000000000000000000000) (ite c!11175 (bvadd #b00000000000000000000000000000001 i!761) (size!4970 (array!11330 (store (arr!5933 arr!308) i!761 (_1!10510 lt!360323)) (size!4970 arr!308))))))))

(declare-fun b!226514 () Bool)

(declare-fun res!190063 () Bool)

(assert (=> b!226514 (=> (not res!190063) (not e!154851))))

(assert (=> b!226514 (= res!190063 (and (= (buf!5511 (_2!10510 lt!360323)) (buf!5511 (_2!10511 lt!360702))) (= (size!4970 (array!11330 (store (arr!5933 arr!308) i!761 (_1!10510 lt!360323)) (size!4970 arr!308))) (size!4970 (_3!803 lt!360702)))))))

(declare-fun b!226515 () Bool)

(declare-fun lt!360704 () Unit!16751)

(assert (=> b!226515 (= e!154853 (tuple3!1323 lt!360704 (_2!10511 lt!360720) (_3!803 lt!360720)))))

(assert (=> b!226515 (= lt!360710 (readByte!0 (_2!10510 lt!360323)))))

(declare-fun lt!360699 () array!11329)

(assert (=> b!226515 (= lt!360699 (array!11330 (store (arr!5933 (array!11330 (store (arr!5933 arr!308) i!761 (_1!10510 lt!360323)) (size!4970 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10510 lt!360710)) (size!4970 (array!11330 (store (arr!5933 arr!308) i!761 (_1!10510 lt!360323)) (size!4970 arr!308)))))))

(declare-fun lt!360716 () (_ BitVec 64))

(assert (=> b!226515 (= lt!360716 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!360698 () (_ BitVec 32))

(assert (=> b!226515 (= lt!360698 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!360731 () Unit!16751)

(assert (=> b!226515 (= lt!360731 (validateOffsetBytesFromBitIndexLemma!0 (_2!10510 lt!360323) (_2!10510 lt!360710) lt!360716 lt!360698))))

(assert (=> b!226515 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4970 (buf!5511 (_2!10510 lt!360710)))) ((_ sign_extend 32) (currentByte!10325 (_2!10510 lt!360710))) ((_ sign_extend 32) (currentBit!10320 (_2!10510 lt!360710))) (bvsub lt!360698 ((_ extract 31 0) (bvsdiv (bvadd lt!360716 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!360718 () Unit!16751)

(assert (=> b!226515 (= lt!360718 lt!360731)))

(assert (=> b!226515 (= lt!360720 (readByteArrayLoop!0 (_2!10510 lt!360710) lt!360699 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(assert (=> b!226515 (= call!3736 (bvadd (bitIndex!0 (size!4970 (buf!5511 (_2!10510 lt!360323))) (currentByte!10325 (_2!10510 lt!360323)) (currentBit!10320 (_2!10510 lt!360323))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!360717 () Unit!16751)

(declare-fun Unit!16775 () Unit!16751)

(assert (=> b!226515 (= lt!360717 Unit!16775)))

(assert (=> b!226515 (= (bvadd call!3736 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4970 (buf!5511 (_2!10511 lt!360720))) (currentByte!10325 (_2!10511 lt!360720)) (currentBit!10320 (_2!10511 lt!360720))))))

(declare-fun lt!360721 () Unit!16751)

(declare-fun Unit!16776 () Unit!16751)

(assert (=> b!226515 (= lt!360721 Unit!16776)))

(assert (=> b!226515 (= (bvadd (bitIndex!0 (size!4970 (buf!5511 (_2!10510 lt!360323))) (currentByte!10325 (_2!10510 lt!360323)) (currentBit!10320 (_2!10510 lt!360323))) (bvmul ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4970 (buf!5511 (_2!10511 lt!360720))) (currentByte!10325 (_2!10511 lt!360720)) (currentBit!10320 (_2!10511 lt!360720))))))

(declare-fun lt!360732 () Unit!16751)

(declare-fun Unit!16777 () Unit!16751)

(assert (=> b!226515 (= lt!360732 Unit!16777)))

(assert (=> b!226515 (and (= (buf!5511 (_2!10510 lt!360323)) (buf!5511 (_2!10511 lt!360720))) (= (size!4970 (array!11330 (store (arr!5933 arr!308) i!761 (_1!10510 lt!360323)) (size!4970 arr!308))) (size!4970 (_3!803 lt!360720))))))

(declare-fun lt!360723 () Unit!16751)

(declare-fun Unit!16778 () Unit!16751)

(assert (=> b!226515 (= lt!360723 Unit!16778)))

(declare-fun lt!360714 () Unit!16751)

(declare-fun arrayUpdatedAtPrefixLemma!377 (array!11329 (_ BitVec 32) (_ BitVec 8)) Unit!16751)

(assert (=> b!226515 (= lt!360714 (arrayUpdatedAtPrefixLemma!377 (array!11330 (store (arr!5933 arr!308) i!761 (_1!10510 lt!360323)) (size!4970 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) (_1!10510 lt!360710)))))

(assert (=> b!226515 (arrayRangesEq!818 (array!11330 (store (arr!5933 arr!308) i!761 (_1!10510 lt!360323)) (size!4970 arr!308)) (array!11330 (store (arr!5933 (array!11330 (store (arr!5933 arr!308) i!761 (_1!10510 lt!360323)) (size!4970 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10510 lt!360710)) (size!4970 (array!11330 (store (arr!5933 arr!308) i!761 (_1!10510 lt!360323)) (size!4970 arr!308)))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun lt!360707 () Unit!16751)

(assert (=> b!226515 (= lt!360707 lt!360714)))

(assert (=> b!226515 (= lt!360727 #b00000000000000000000000000000000)))

(declare-fun lt!360730 () Unit!16751)

(declare-fun arrayRangesEqTransitive!256 (array!11329 array!11329 array!11329 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16751)

(assert (=> b!226515 (= lt!360730 (arrayRangesEqTransitive!256 (array!11330 (store (arr!5933 arr!308) i!761 (_1!10510 lt!360323)) (size!4970 arr!308)) lt!360699 (_3!803 lt!360720) lt!360727 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!226515 call!3737))

(declare-fun lt!360711 () Unit!16751)

(assert (=> b!226515 (= lt!360711 lt!360730)))

(assert (=> b!226515 call!3738))

(declare-fun lt!360712 () Unit!16751)

(declare-fun Unit!16779 () Unit!16751)

(assert (=> b!226515 (= lt!360712 Unit!16779)))

(declare-fun lt!360709 () Unit!16751)

(declare-fun arrayRangesEqImpliesEq!107 (array!11329 array!11329 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16751)

(assert (=> b!226515 (= lt!360709 (arrayRangesEqImpliesEq!107 lt!360699 (_3!803 lt!360720) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!226515 (= (select (store (arr!5933 (array!11330 (store (arr!5933 arr!308) i!761 (_1!10510 lt!360323)) (size!4970 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10510 lt!360710)) (bvadd #b00000000000000000000000000000001 i!761)) (select (arr!5933 (_3!803 lt!360720)) (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!360705 () Unit!16751)

(assert (=> b!226515 (= lt!360705 lt!360709)))

(declare-fun lt!360725 () Bool)

(assert (=> b!226515 (= lt!360725 (= (select (arr!5933 (_3!803 lt!360720)) (bvadd #b00000000000000000000000000000001 i!761)) (_1!10510 lt!360710)))))

(declare-fun Unit!16780 () Unit!16751)

(assert (=> b!226515 (= lt!360704 Unit!16780)))

(assert (=> b!226515 lt!360725))

(declare-fun b!226516 () Bool)

(declare-datatypes ((tuple2!19426 0))(
  ( (tuple2!19427 (_1!10518 BitStream!9036) (_2!10518 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!9036) tuple2!19426)

(assert (=> b!226516 (= e!154852 (= (select (arr!5933 (_3!803 lt!360702)) (bvadd #b00000000000000000000000000000001 i!761)) (_2!10518 (readBytePure!0 (_2!10510 lt!360323)))))))

(assert (=> b!226516 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4970 (_3!803 lt!360702))))))

(declare-fun bm!3735 () Bool)

(assert (=> bm!3735 (= call!3738 (arrayRangesEq!818 (ite c!11175 (array!11330 (store (arr!5933 arr!308) i!761 (_1!10510 lt!360323)) (size!4970 arr!308)) lt!360724) (ite c!11175 (_3!803 lt!360720) lt!360703) (ite c!11175 #b00000000000000000000000000000000 lt!360706) (ite c!11175 (bvadd #b00000000000000000000000000000001 i!761) lt!360729)))))

(declare-fun b!226517 () Bool)

(assert (=> b!226517 (= e!154851 (arrayRangesEq!818 (array!11330 (store (arr!5933 arr!308) i!761 (_1!10510 lt!360323)) (size!4970 arr!308)) (_3!803 lt!360702) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (= (and d!76875 c!11175) b!226515))

(assert (= (and d!76875 (not c!11175)) b!226513))

(assert (= (or b!226515 b!226513) bm!3735))

(assert (= (or b!226515 b!226513) bm!3734))

(assert (= (or b!226515 b!226513) bm!3733))

(assert (= (and d!76875 res!190062) b!226514))

(assert (= (and b!226514 res!190063) b!226517))

(assert (= (and d!76875 (not res!190064)) b!226516))

(declare-fun m!347947 () Bool)

(assert (=> d!76875 m!347947))

(assert (=> d!76875 m!347815))

(declare-fun m!347949 () Bool)

(assert (=> b!226513 m!347949))

(declare-fun m!347951 () Bool)

(assert (=> b!226513 m!347951))

(declare-fun m!347953 () Bool)

(assert (=> bm!3734 m!347953))

(declare-fun m!347955 () Bool)

(assert (=> b!226516 m!347955))

(declare-fun m!347957 () Bool)

(assert (=> b!226516 m!347957))

(declare-fun m!347959 () Bool)

(assert (=> b!226515 m!347959))

(declare-fun m!347961 () Bool)

(assert (=> b!226515 m!347961))

(declare-fun m!347963 () Bool)

(assert (=> b!226515 m!347963))

(declare-fun m!347965 () Bool)

(assert (=> b!226515 m!347965))

(declare-fun m!347967 () Bool)

(assert (=> b!226515 m!347967))

(declare-fun m!347969 () Bool)

(assert (=> b!226515 m!347969))

(declare-fun m!347971 () Bool)

(assert (=> b!226515 m!347971))

(declare-fun m!347973 () Bool)

(assert (=> b!226515 m!347973))

(assert (=> b!226515 m!347815))

(declare-fun m!347975 () Bool)

(assert (=> b!226515 m!347975))

(declare-fun m!347977 () Bool)

(assert (=> b!226515 m!347977))

(declare-fun m!347979 () Bool)

(assert (=> b!226515 m!347979))

(declare-fun m!347981 () Bool)

(assert (=> b!226515 m!347981))

(declare-fun m!347983 () Bool)

(assert (=> bm!3733 m!347983))

(declare-fun m!347985 () Bool)

(assert (=> b!226517 m!347985))

(declare-fun m!347987 () Bool)

(assert (=> bm!3735 m!347987))

(assert (=> b!226424 d!76875))

(declare-fun d!76886 () Bool)

(declare-fun e!154854 () Bool)

(assert (=> d!76886 e!154854))

(declare-fun res!190066 () Bool)

(assert (=> d!76886 (=> (not res!190066) (not e!154854))))

(declare-fun lt!360781 () (_ BitVec 64))

(declare-fun lt!360776 () (_ BitVec 64))

(declare-fun lt!360779 () (_ BitVec 64))

(assert (=> d!76886 (= res!190066 (= lt!360779 (bvsub lt!360781 lt!360776)))))

(assert (=> d!76886 (or (= (bvand lt!360781 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!360776 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!360781 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!360781 lt!360776) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!76886 (= lt!360776 (remainingBits!0 ((_ sign_extend 32) (size!4970 (buf!5511 (_2!10510 lt!360323)))) ((_ sign_extend 32) (currentByte!10325 (_2!10510 lt!360323))) ((_ sign_extend 32) (currentBit!10320 (_2!10510 lt!360323)))))))

(declare-fun lt!360778 () (_ BitVec 64))

(declare-fun lt!360780 () (_ BitVec 64))

(assert (=> d!76886 (= lt!360781 (bvmul lt!360778 lt!360780))))

(assert (=> d!76886 (or (= lt!360778 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!360780 (bvsdiv (bvmul lt!360778 lt!360780) lt!360778)))))

(assert (=> d!76886 (= lt!360780 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76886 (= lt!360778 ((_ sign_extend 32) (size!4970 (buf!5511 (_2!10510 lt!360323)))))))

(assert (=> d!76886 (= lt!360779 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10325 (_2!10510 lt!360323))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10320 (_2!10510 lt!360323)))))))

(assert (=> d!76886 (invariant!0 (currentBit!10320 (_2!10510 lt!360323)) (currentByte!10325 (_2!10510 lt!360323)) (size!4970 (buf!5511 (_2!10510 lt!360323))))))

(assert (=> d!76886 (= (bitIndex!0 (size!4970 (buf!5511 (_2!10510 lt!360323))) (currentByte!10325 (_2!10510 lt!360323)) (currentBit!10320 (_2!10510 lt!360323))) lt!360779)))

(declare-fun b!226518 () Bool)

(declare-fun res!190065 () Bool)

(assert (=> b!226518 (=> (not res!190065) (not e!154854))))

(assert (=> b!226518 (= res!190065 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!360779))))

(declare-fun b!226519 () Bool)

(declare-fun lt!360777 () (_ BitVec 64))

(assert (=> b!226519 (= e!154854 (bvsle lt!360779 (bvmul lt!360777 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!226519 (or (= lt!360777 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!360777 #b0000000000000000000000000000000000000000000000000000000000001000) lt!360777)))))

(assert (=> b!226519 (= lt!360777 ((_ sign_extend 32) (size!4970 (buf!5511 (_2!10510 lt!360323)))))))

(assert (= (and d!76886 res!190066) b!226518))

(assert (= (and b!226518 res!190065) b!226519))

(assert (=> d!76886 m!347869))

(declare-fun m!347989 () Bool)

(assert (=> d!76886 m!347989))

(assert (=> b!226424 d!76886))

(declare-fun d!76888 () Bool)

(declare-fun e!154864 () Bool)

(assert (=> d!76888 e!154864))

(declare-fun res!190078 () Bool)

(assert (=> d!76888 (=> (not res!190078) (not e!154864))))

(assert (=> d!76888 (= res!190078 (and (or (let ((rhs!3887 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3887 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3887) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!76889 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!76889 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!76889 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3886 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3886 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3886) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!360832 () Unit!16751)

(declare-fun choose!57 (BitStream!9036 BitStream!9036 (_ BitVec 64) (_ BitVec 32)) Unit!16751)

(assert (=> d!76888 (= lt!360832 (choose!57 thiss!1870 (_2!10510 lt!360323) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> d!76888 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10510 lt!360323) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)) lt!360832)))

(declare-fun b!226533 () Bool)

(declare-fun lt!360834 () (_ BitVec 32))

(assert (=> b!226533 (= e!154864 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4970 (buf!5511 (_2!10510 lt!360323)))) ((_ sign_extend 32) (currentByte!10325 (_2!10510 lt!360323))) ((_ sign_extend 32) (currentBit!10320 (_2!10510 lt!360323))) (bvsub (bvsub to!496 i!761) lt!360834)))))

(assert (=> b!226533 (or (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand lt!360834 #b10000000000000000000000000000000)) (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!496 i!761) lt!360834) #b10000000000000000000000000000000)))))

(declare-fun lt!360833 () (_ BitVec 64))

(assert (=> b!226533 (= lt!360834 ((_ extract 31 0) lt!360833))))

(assert (=> b!226533 (and (bvslt lt!360833 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!360833 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!226533 (= lt!360833 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!76888 res!190078) b!226533))

(declare-fun m!347991 () Bool)

(assert (=> d!76888 m!347991))

(declare-fun m!347993 () Bool)

(assert (=> b!226533 m!347993))

(assert (=> b!226424 d!76888))

(check-sat (not b!226516) (not bm!3733) (not d!76842) (not b!226515) (not d!76875) (not bm!3735) (not b!226533) (not d!76871) (not bm!3734) (not b!226517) (not b!226464) (not d!76888) (not d!76886) (not d!76848) (not b!226513) (not d!76854) (not d!76856))
