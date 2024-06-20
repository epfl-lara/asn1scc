; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47752 () Bool)

(assert start!47752)

(declare-fun res!190712 () Bool)

(declare-fun e!155560 () Bool)

(assert (=> start!47752 (=> (not res!190712) (not e!155560))))

(declare-datatypes ((array!11419 0))(
  ( (array!11420 (arr!5984 (Array (_ BitVec 32) (_ BitVec 8))) (size!5009 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11419)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!47752 (= res!190712 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5009 arr!308))))))

(assert (=> start!47752 e!155560))

(assert (=> start!47752 true))

(declare-fun array_inv!4750 (array!11419) Bool)

(assert (=> start!47752 (array_inv!4750 arr!308)))

(declare-datatypes ((BitStream!9114 0))(
  ( (BitStream!9115 (buf!5550 array!11419) (currentByte!10388 (_ BitVec 32)) (currentBit!10383 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9114)

(declare-fun e!155559 () Bool)

(declare-fun inv!12 (BitStream!9114) Bool)

(assert (=> start!47752 (and (inv!12 thiss!1870) e!155559)))

(declare-fun b!227324 () Bool)

(declare-fun res!190713 () Bool)

(assert (=> b!227324 (=> (not res!190713) (not e!155560))))

(assert (=> b!227324 (= res!190713 (bvslt i!761 to!496))))

(declare-fun b!227325 () Bool)

(declare-fun e!155557 () Bool)

(assert (=> b!227325 (= e!155560 (not e!155557))))

(declare-fun res!190711 () Bool)

(assert (=> b!227325 (=> res!190711 e!155557)))

(assert (=> b!227325 (= res!190711 (or (bvsgt i!761 (bvadd #b00000000000000000000000000000001 i!761)) (bvsgt i!761 (size!5009 arr!308)) (bvsgt (bvadd #b00000000000000000000000000000001 i!761) (size!5009 arr!308))))))

(declare-fun lt!363235 () array!11419)

(declare-fun arrayRangesEq!845 (array!11419 array!11419 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227325 (arrayRangesEq!845 arr!308 lt!363235 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((tuple2!19540 0))(
  ( (tuple2!19541 (_1!10612 (_ BitVec 8)) (_2!10612 BitStream!9114)) )
))
(declare-fun lt!363230 () tuple2!19540)

(declare-datatypes ((Unit!16961 0))(
  ( (Unit!16962) )
))
(declare-fun lt!363232 () Unit!16961)

(declare-fun arrayUpdatedAtPrefixLemma!404 (array!11419 (_ BitVec 32) (_ BitVec 8)) Unit!16961)

(assert (=> b!227325 (= lt!363232 (arrayUpdatedAtPrefixLemma!404 arr!308 i!761 (_1!10612 lt!363230)))))

(declare-fun lt!363237 () (_ BitVec 64))

(declare-fun lt!363236 () (_ BitVec 64))

(declare-datatypes ((tuple3!1400 0))(
  ( (tuple3!1401 (_1!10613 Unit!16961) (_2!10613 BitStream!9114) (_3!842 array!11419)) )
))
(declare-fun lt!363233 () tuple3!1400)

(declare-fun lt!363229 () (_ BitVec 64))

(declare-fun lt!363234 () (_ BitVec 32))

(assert (=> b!227325 (and (= (bvadd lt!363229 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!363234))) lt!363236) (= (bvadd lt!363237 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!363236) (= (buf!5550 thiss!1870) (buf!5550 (_2!10613 lt!363233))) (= (size!5009 arr!308) (size!5009 (_3!842 lt!363233))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!227325 (= lt!363236 (bitIndex!0 (size!5009 (buf!5550 (_2!10613 lt!363233))) (currentByte!10388 (_2!10613 lt!363233)) (currentBit!10383 (_2!10613 lt!363233))))))

(assert (=> b!227325 (= lt!363229 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!363237))))

(assert (=> b!227325 (= lt!363229 (bitIndex!0 (size!5009 (buf!5550 (_2!10612 lt!363230))) (currentByte!10388 (_2!10612 lt!363230)) (currentBit!10383 (_2!10612 lt!363230))))))

(assert (=> b!227325 (= lt!363237 (bitIndex!0 (size!5009 (buf!5550 thiss!1870)) (currentByte!10388 thiss!1870) (currentBit!10383 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9114 array!11419 (_ BitVec 32) (_ BitVec 32)) tuple3!1400)

(assert (=> b!227325 (= lt!363233 (readByteArrayLoop!0 (_2!10612 lt!363230) lt!363235 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227325 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5009 (buf!5550 (_2!10612 lt!363230)))) ((_ sign_extend 32) (currentByte!10388 (_2!10612 lt!363230))) ((_ sign_extend 32) (currentBit!10383 (_2!10612 lt!363230))) lt!363234)))

(assert (=> b!227325 (= lt!363234 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!363231 () Unit!16961)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9114 BitStream!9114 (_ BitVec 64) (_ BitVec 32)) Unit!16961)

(assert (=> b!227325 (= lt!363231 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10612 lt!363230) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!227325 (= lt!363235 (array!11420 (store (arr!5984 arr!308) i!761 (_1!10612 lt!363230)) (size!5009 arr!308)))))

(declare-fun readByte!0 (BitStream!9114) tuple2!19540)

(assert (=> b!227325 (= lt!363230 (readByte!0 thiss!1870))))

(declare-fun b!227326 () Bool)

(assert (=> b!227326 (= e!155559 (array_inv!4750 (buf!5550 thiss!1870)))))

(declare-fun b!227327 () Bool)

(declare-fun res!190714 () Bool)

(assert (=> b!227327 (=> (not res!190714) (not e!155560))))

(assert (=> b!227327 (= res!190714 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5009 (buf!5550 thiss!1870))) ((_ sign_extend 32) (currentByte!10388 thiss!1870)) ((_ sign_extend 32) (currentBit!10383 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!227328 () Bool)

(assert (=> b!227328 (= e!155557 (arrayRangesEq!845 lt!363235 (_3!842 lt!363233) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (= (and start!47752 res!190712) b!227327))

(assert (= (and b!227327 res!190714) b!227324))

(assert (= (and b!227324 res!190713) b!227325))

(assert (= (and b!227325 (not res!190711)) b!227328))

(assert (= start!47752 b!227326))

(declare-fun m!349585 () Bool)

(assert (=> b!227328 m!349585))

(declare-fun m!349587 () Bool)

(assert (=> b!227325 m!349587))

(declare-fun m!349589 () Bool)

(assert (=> b!227325 m!349589))

(declare-fun m!349591 () Bool)

(assert (=> b!227325 m!349591))

(declare-fun m!349593 () Bool)

(assert (=> b!227325 m!349593))

(declare-fun m!349595 () Bool)

(assert (=> b!227325 m!349595))

(declare-fun m!349597 () Bool)

(assert (=> b!227325 m!349597))

(declare-fun m!349599 () Bool)

(assert (=> b!227325 m!349599))

(declare-fun m!349601 () Bool)

(assert (=> b!227325 m!349601))

(declare-fun m!349603 () Bool)

(assert (=> b!227325 m!349603))

(declare-fun m!349605 () Bool)

(assert (=> b!227325 m!349605))

(declare-fun m!349607 () Bool)

(assert (=> start!47752 m!349607))

(declare-fun m!349609 () Bool)

(assert (=> start!47752 m!349609))

(declare-fun m!349611 () Bool)

(assert (=> b!227326 m!349611))

(declare-fun m!349613 () Bool)

(assert (=> b!227327 m!349613))

(check-sat (not b!227327) (not start!47752) (not b!227328) (not b!227325) (not b!227326))
(check-sat)
(get-model)

(declare-fun d!77126 () Bool)

(assert (=> d!77126 (= (array_inv!4750 (buf!5550 thiss!1870)) (bvsge (size!5009 (buf!5550 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!227326 d!77126))

(declare-fun d!77128 () Bool)

(declare-fun e!155582 () Bool)

(assert (=> d!77128 e!155582))

(declare-fun res!190740 () Bool)

(assert (=> d!77128 (=> (not res!190740) (not e!155582))))

(declare-fun lt!363302 () (_ BitVec 64))

(declare-fun lt!363303 () (_ BitVec 64))

(declare-fun lt!363301 () (_ BitVec 64))

(assert (=> d!77128 (= res!190740 (= lt!363303 (bvsub lt!363302 lt!363301)))))

(assert (=> d!77128 (or (= (bvand lt!363302 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!363301 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!363302 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!363302 lt!363301) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!77128 (= lt!363301 (remainingBits!0 ((_ sign_extend 32) (size!5009 (buf!5550 (_2!10612 lt!363230)))) ((_ sign_extend 32) (currentByte!10388 (_2!10612 lt!363230))) ((_ sign_extend 32) (currentBit!10383 (_2!10612 lt!363230)))))))

(declare-fun lt!363304 () (_ BitVec 64))

(declare-fun lt!363305 () (_ BitVec 64))

(assert (=> d!77128 (= lt!363302 (bvmul lt!363304 lt!363305))))

(assert (=> d!77128 (or (= lt!363304 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!363305 (bvsdiv (bvmul lt!363304 lt!363305) lt!363304)))))

(assert (=> d!77128 (= lt!363305 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77128 (= lt!363304 ((_ sign_extend 32) (size!5009 (buf!5550 (_2!10612 lt!363230)))))))

(assert (=> d!77128 (= lt!363303 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10388 (_2!10612 lt!363230))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10383 (_2!10612 lt!363230)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!77128 (invariant!0 (currentBit!10383 (_2!10612 lt!363230)) (currentByte!10388 (_2!10612 lt!363230)) (size!5009 (buf!5550 (_2!10612 lt!363230))))))

(assert (=> d!77128 (= (bitIndex!0 (size!5009 (buf!5550 (_2!10612 lt!363230))) (currentByte!10388 (_2!10612 lt!363230)) (currentBit!10383 (_2!10612 lt!363230))) lt!363303)))

(declare-fun b!227356 () Bool)

(declare-fun res!190739 () Bool)

(assert (=> b!227356 (=> (not res!190739) (not e!155582))))

(assert (=> b!227356 (= res!190739 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!363303))))

(declare-fun b!227357 () Bool)

(declare-fun lt!363306 () (_ BitVec 64))

(assert (=> b!227357 (= e!155582 (bvsle lt!363303 (bvmul lt!363306 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!227357 (or (= lt!363306 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!363306 #b0000000000000000000000000000000000000000000000000000000000001000) lt!363306)))))

(assert (=> b!227357 (= lt!363306 ((_ sign_extend 32) (size!5009 (buf!5550 (_2!10612 lt!363230)))))))

(assert (= (and d!77128 res!190740) b!227356))

(assert (= (and b!227356 res!190739) b!227357))

(declare-fun m!349653 () Bool)

(assert (=> d!77128 m!349653))

(declare-fun m!349655 () Bool)

(assert (=> d!77128 m!349655))

(assert (=> b!227325 d!77128))

(declare-fun bm!3850 () Bool)

(declare-fun call!3854 () (_ BitVec 64))

(assert (=> bm!3850 (= call!3854 (bitIndex!0 (size!5009 (buf!5550 (_2!10612 lt!363230))) (currentByte!10388 (_2!10612 lt!363230)) (currentBit!10383 (_2!10612 lt!363230))))))

(declare-fun b!227447 () Bool)

(declare-fun e!155651 () Bool)

(declare-fun lt!363694 () tuple3!1400)

(assert (=> b!227447 (= e!155651 (arrayRangesEq!845 lt!363235 (_3!842 lt!363694) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun b!227448 () Bool)

(declare-fun res!190818 () Bool)

(assert (=> b!227448 (=> (not res!190818) (not e!155651))))

(assert (=> b!227448 (= res!190818 (and (= (buf!5550 (_2!10612 lt!363230)) (buf!5550 (_2!10613 lt!363694))) (= (size!5009 lt!363235) (size!5009 (_3!842 lt!363694)))))))

(declare-fun lt!363699 () array!11419)

(declare-fun lt!363713 () array!11419)

(declare-fun lt!363702 () tuple3!1400)

(declare-fun call!3853 () Bool)

(declare-fun lt!363707 () (_ BitVec 32))

(declare-fun c!11212 () Bool)

(declare-fun lt!363688 () (_ BitVec 32))

(declare-fun lt!363714 () (_ BitVec 32))

(declare-fun bm!3851 () Bool)

(assert (=> bm!3851 (= call!3853 (arrayRangesEq!845 (ite c!11212 lt!363235 lt!363713) (ite c!11212 (_3!842 lt!363702) lt!363699) (ite c!11212 lt!363707 lt!363714) (ite c!11212 (bvadd #b00000000000000000000000000000001 i!761) lt!363688)))))

(declare-fun b!227449 () Bool)

(declare-fun e!155650 () tuple3!1400)

(declare-fun lt!363700 () Unit!16961)

(assert (=> b!227449 (= e!155650 (tuple3!1401 lt!363700 (_2!10612 lt!363230) lt!363235))))

(assert (=> b!227449 (= call!3854 call!3854)))

(declare-fun lt!363697 () Unit!16961)

(declare-fun Unit!16987 () Unit!16961)

(assert (=> b!227449 (= lt!363697 Unit!16987)))

(declare-fun lt!363692 () Unit!16961)

(declare-fun arrayRangesEqReflexiveLemma!135 (array!11419) Unit!16961)

(assert (=> b!227449 (= lt!363692 (arrayRangesEqReflexiveLemma!135 lt!363235))))

(declare-fun call!3855 () Bool)

(assert (=> b!227449 call!3855))

(declare-fun lt!363717 () Unit!16961)

(assert (=> b!227449 (= lt!363717 lt!363692)))

(assert (=> b!227449 (= lt!363713 lt!363235)))

(assert (=> b!227449 (= lt!363699 lt!363235)))

(declare-fun lt!363711 () (_ BitVec 32))

(assert (=> b!227449 (= lt!363711 #b00000000000000000000000000000000)))

(declare-fun lt!363695 () (_ BitVec 32))

(assert (=> b!227449 (= lt!363695 (size!5009 lt!363235))))

(assert (=> b!227449 (= lt!363714 #b00000000000000000000000000000000)))

(assert (=> b!227449 (= lt!363688 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun arrayRangesEqSlicedLemma!120 (array!11419 array!11419 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16961)

(assert (=> b!227449 (= lt!363700 (arrayRangesEqSlicedLemma!120 lt!363713 lt!363699 lt!363711 lt!363695 lt!363714 lt!363688))))

(assert (=> b!227449 call!3853))

(declare-fun b!227450 () Bool)

(declare-fun e!155652 () Bool)

(declare-datatypes ((tuple2!19552 0))(
  ( (tuple2!19553 (_1!10620 BitStream!9114) (_2!10620 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!9114) tuple2!19552)

(assert (=> b!227450 (= e!155652 (= (select (arr!5984 (_3!842 lt!363694)) (bvadd #b00000000000000000000000000000001 i!761)) (_2!10620 (readBytePure!0 (_2!10612 lt!363230)))))))

(assert (=> b!227450 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!5009 (_3!842 lt!363694))))))

(declare-fun bm!3852 () Bool)

(declare-fun lt!363710 () tuple2!19540)

(assert (=> bm!3852 (= call!3855 (arrayRangesEq!845 lt!363235 (ite c!11212 (array!11420 (store (arr!5984 lt!363235) (bvadd #b00000000000000000000000000000001 i!761) (_1!10612 lt!363710)) (size!5009 lt!363235)) lt!363235) #b00000000000000000000000000000000 (ite c!11212 (bvadd #b00000000000000000000000000000001 i!761) (size!5009 lt!363235))))))

(declare-fun d!77140 () Bool)

(assert (=> d!77140 e!155652))

(declare-fun res!190816 () Bool)

(assert (=> d!77140 (=> res!190816 e!155652)))

(assert (=> d!77140 (= res!190816 (bvsge (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!363709 () Bool)

(assert (=> d!77140 (= lt!363709 e!155651)))

(declare-fun res!190817 () Bool)

(assert (=> d!77140 (=> (not res!190817) (not e!155651))))

(declare-fun lt!363706 () (_ BitVec 64))

(declare-fun lt!363721 () (_ BitVec 64))

(assert (=> d!77140 (= res!190817 (= (bvadd lt!363721 lt!363706) (bitIndex!0 (size!5009 (buf!5550 (_2!10613 lt!363694))) (currentByte!10388 (_2!10613 lt!363694)) (currentBit!10383 (_2!10613 lt!363694)))))))

(assert (=> d!77140 (or (not (= (bvand lt!363721 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!363706 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!363721 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!363721 lt!363706) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!363696 () (_ BitVec 64))

(assert (=> d!77140 (= lt!363706 (bvmul lt!363696 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!77140 (or (= lt!363696 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!363696 #b0000000000000000000000000000000000000000000000000000000000001000) lt!363696)))))

(assert (=> d!77140 (= lt!363696 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))))))

(assert (=> d!77140 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b10000000000000000000000000000000)))))

(assert (=> d!77140 (= lt!363721 (bitIndex!0 (size!5009 (buf!5550 (_2!10612 lt!363230))) (currentByte!10388 (_2!10612 lt!363230)) (currentBit!10383 (_2!10612 lt!363230))))))

(assert (=> d!77140 (= lt!363694 e!155650)))

(assert (=> d!77140 (= c!11212 (bvslt (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> d!77140 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) to!496) (bvsle to!496 (size!5009 lt!363235)))))

(assert (=> d!77140 (= (readByteArrayLoop!0 (_2!10612 lt!363230) lt!363235 (bvadd #b00000000000000000000000000000001 i!761) to!496) lt!363694)))

(declare-fun b!227451 () Bool)

(declare-fun lt!363704 () Unit!16961)

(assert (=> b!227451 (= e!155650 (tuple3!1401 lt!363704 (_2!10613 lt!363702) (_3!842 lt!363702)))))

(assert (=> b!227451 (= lt!363710 (readByte!0 (_2!10612 lt!363230)))))

(declare-fun lt!363698 () array!11419)

(assert (=> b!227451 (= lt!363698 (array!11420 (store (arr!5984 lt!363235) (bvadd #b00000000000000000000000000000001 i!761) (_1!10612 lt!363710)) (size!5009 lt!363235)))))

(declare-fun lt!363712 () (_ BitVec 64))

(assert (=> b!227451 (= lt!363712 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!363716 () (_ BitVec 32))

(assert (=> b!227451 (= lt!363716 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!363689 () Unit!16961)

(assert (=> b!227451 (= lt!363689 (validateOffsetBytesFromBitIndexLemma!0 (_2!10612 lt!363230) (_2!10612 lt!363710) lt!363712 lt!363716))))

(assert (=> b!227451 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5009 (buf!5550 (_2!10612 lt!363710)))) ((_ sign_extend 32) (currentByte!10388 (_2!10612 lt!363710))) ((_ sign_extend 32) (currentBit!10383 (_2!10612 lt!363710))) (bvsub lt!363716 ((_ extract 31 0) (bvsdiv (bvadd lt!363712 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!363719 () Unit!16961)

(assert (=> b!227451 (= lt!363719 lt!363689)))

(assert (=> b!227451 (= lt!363702 (readByteArrayLoop!0 (_2!10612 lt!363710) lt!363698 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(assert (=> b!227451 (= (bitIndex!0 (size!5009 (buf!5550 (_2!10612 lt!363710))) (currentByte!10388 (_2!10612 lt!363710)) (currentBit!10383 (_2!10612 lt!363710))) (bvadd call!3854 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!363708 () Unit!16961)

(declare-fun Unit!16988 () Unit!16961)

(assert (=> b!227451 (= lt!363708 Unit!16988)))

(assert (=> b!227451 (= (bvadd (bitIndex!0 (size!5009 (buf!5550 (_2!10612 lt!363710))) (currentByte!10388 (_2!10612 lt!363710)) (currentBit!10383 (_2!10612 lt!363710))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!5009 (buf!5550 (_2!10613 lt!363702))) (currentByte!10388 (_2!10613 lt!363702)) (currentBit!10383 (_2!10613 lt!363702))))))

(declare-fun lt!363718 () Unit!16961)

(declare-fun Unit!16989 () Unit!16961)

(assert (=> b!227451 (= lt!363718 Unit!16989)))

(assert (=> b!227451 (= (bvadd call!3854 (bvmul ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!5009 (buf!5550 (_2!10613 lt!363702))) (currentByte!10388 (_2!10613 lt!363702)) (currentBit!10383 (_2!10613 lt!363702))))))

(declare-fun lt!363691 () Unit!16961)

(declare-fun Unit!16990 () Unit!16961)

(assert (=> b!227451 (= lt!363691 Unit!16990)))

(assert (=> b!227451 (and (= (buf!5550 (_2!10612 lt!363230)) (buf!5550 (_2!10613 lt!363702))) (= (size!5009 lt!363235) (size!5009 (_3!842 lt!363702))))))

(declare-fun lt!363705 () Unit!16961)

(declare-fun Unit!16991 () Unit!16961)

(assert (=> b!227451 (= lt!363705 Unit!16991)))

(declare-fun lt!363723 () Unit!16961)

(assert (=> b!227451 (= lt!363723 (arrayUpdatedAtPrefixLemma!404 lt!363235 (bvadd #b00000000000000000000000000000001 i!761) (_1!10612 lt!363710)))))

(assert (=> b!227451 call!3855))

(declare-fun lt!363703 () Unit!16961)

(assert (=> b!227451 (= lt!363703 lt!363723)))

(assert (=> b!227451 (= lt!363707 #b00000000000000000000000000000000)))

(declare-fun lt!363701 () Unit!16961)

(declare-fun arrayRangesEqTransitive!269 (array!11419 array!11419 array!11419 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16961)

(assert (=> b!227451 (= lt!363701 (arrayRangesEqTransitive!269 lt!363235 lt!363698 (_3!842 lt!363702) lt!363707 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!227451 call!3853))

(declare-fun lt!363693 () Unit!16961)

(assert (=> b!227451 (= lt!363693 lt!363701)))

(assert (=> b!227451 (arrayRangesEq!845 lt!363235 (_3!842 lt!363702) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun lt!363722 () Unit!16961)

(declare-fun Unit!16992 () Unit!16961)

(assert (=> b!227451 (= lt!363722 Unit!16992)))

(declare-fun lt!363720 () Unit!16961)

(declare-fun arrayRangesEqImpliesEq!120 (array!11419 array!11419 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16961)

(assert (=> b!227451 (= lt!363720 (arrayRangesEqImpliesEq!120 lt!363698 (_3!842 lt!363702) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!227451 (= (select (store (arr!5984 lt!363235) (bvadd #b00000000000000000000000000000001 i!761) (_1!10612 lt!363710)) (bvadd #b00000000000000000000000000000001 i!761)) (select (arr!5984 (_3!842 lt!363702)) (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!363715 () Unit!16961)

(assert (=> b!227451 (= lt!363715 lt!363720)))

(declare-fun lt!363690 () Bool)

(assert (=> b!227451 (= lt!363690 (= (select (arr!5984 (_3!842 lt!363702)) (bvadd #b00000000000000000000000000000001 i!761)) (_1!10612 lt!363710)))))

(declare-fun Unit!16993 () Unit!16961)

(assert (=> b!227451 (= lt!363704 Unit!16993)))

(assert (=> b!227451 lt!363690))

(assert (= (and d!77140 c!11212) b!227451))

(assert (= (and d!77140 (not c!11212)) b!227449))

(assert (= (or b!227451 b!227449) bm!3851))

(assert (= (or b!227451 b!227449) bm!3852))

(assert (= (or b!227451 b!227449) bm!3850))

(assert (= (and d!77140 res!190817) b!227448))

(assert (= (and b!227448 res!190818) b!227447))

(assert (= (and d!77140 (not res!190816)) b!227450))

(declare-fun m!349805 () Bool)

(assert (=> b!227449 m!349805))

(declare-fun m!349807 () Bool)

(assert (=> b!227449 m!349807))

(declare-fun m!349809 () Bool)

(assert (=> d!77140 m!349809))

(assert (=> d!77140 m!349587))

(declare-fun m!349811 () Bool)

(assert (=> b!227447 m!349811))

(declare-fun m!349813 () Bool)

(assert (=> bm!3852 m!349813))

(declare-fun m!349815 () Bool)

(assert (=> bm!3852 m!349815))

(assert (=> b!227451 m!349813))

(declare-fun m!349817 () Bool)

(assert (=> b!227451 m!349817))

(declare-fun m!349819 () Bool)

(assert (=> b!227451 m!349819))

(declare-fun m!349821 () Bool)

(assert (=> b!227451 m!349821))

(declare-fun m!349823 () Bool)

(assert (=> b!227451 m!349823))

(declare-fun m!349825 () Bool)

(assert (=> b!227451 m!349825))

(declare-fun m!349827 () Bool)

(assert (=> b!227451 m!349827))

(declare-fun m!349829 () Bool)

(assert (=> b!227451 m!349829))

(declare-fun m!349831 () Bool)

(assert (=> b!227451 m!349831))

(declare-fun m!349833 () Bool)

(assert (=> b!227451 m!349833))

(declare-fun m!349835 () Bool)

(assert (=> b!227451 m!349835))

(declare-fun m!349837 () Bool)

(assert (=> b!227451 m!349837))

(declare-fun m!349839 () Bool)

(assert (=> b!227451 m!349839))

(declare-fun m!349841 () Bool)

(assert (=> b!227450 m!349841))

(declare-fun m!349843 () Bool)

(assert (=> b!227450 m!349843))

(declare-fun m!349845 () Bool)

(assert (=> bm!3851 m!349845))

(assert (=> bm!3850 m!349587))

(assert (=> b!227325 d!77140))

(declare-fun d!77190 () Bool)

(declare-fun e!155655 () Bool)

(assert (=> d!77190 e!155655))

(declare-fun res!190822 () Bool)

(assert (=> d!77190 (=> (not res!190822) (not e!155655))))

(declare-fun lt!363731 () (_ BitVec 64))

(declare-fun lt!363730 () (_ BitVec 64))

(declare-fun lt!363732 () (_ BitVec 64))

(assert (=> d!77190 (= res!190822 (= lt!363732 (bvsub lt!363731 lt!363730)))))

(assert (=> d!77190 (or (= (bvand lt!363731 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!363730 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!363731 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!363731 lt!363730) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77190 (= lt!363730 (remainingBits!0 ((_ sign_extend 32) (size!5009 (buf!5550 thiss!1870))) ((_ sign_extend 32) (currentByte!10388 thiss!1870)) ((_ sign_extend 32) (currentBit!10383 thiss!1870))))))

(declare-fun lt!363733 () (_ BitVec 64))

(declare-fun lt!363734 () (_ BitVec 64))

(assert (=> d!77190 (= lt!363731 (bvmul lt!363733 lt!363734))))

(assert (=> d!77190 (or (= lt!363733 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!363734 (bvsdiv (bvmul lt!363733 lt!363734) lt!363733)))))

(assert (=> d!77190 (= lt!363734 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77190 (= lt!363733 ((_ sign_extend 32) (size!5009 (buf!5550 thiss!1870))))))

(assert (=> d!77190 (= lt!363732 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10388 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10383 thiss!1870))))))

(assert (=> d!77190 (invariant!0 (currentBit!10383 thiss!1870) (currentByte!10388 thiss!1870) (size!5009 (buf!5550 thiss!1870)))))

(assert (=> d!77190 (= (bitIndex!0 (size!5009 (buf!5550 thiss!1870)) (currentByte!10388 thiss!1870) (currentBit!10383 thiss!1870)) lt!363732)))

(declare-fun b!227454 () Bool)

(declare-fun res!190821 () Bool)

(assert (=> b!227454 (=> (not res!190821) (not e!155655))))

(assert (=> b!227454 (= res!190821 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!363732))))

(declare-fun b!227455 () Bool)

(declare-fun lt!363735 () (_ BitVec 64))

(assert (=> b!227455 (= e!155655 (bvsle lt!363732 (bvmul lt!363735 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!227455 (or (= lt!363735 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!363735 #b0000000000000000000000000000000000000000000000000000000000001000) lt!363735)))))

(assert (=> b!227455 (= lt!363735 ((_ sign_extend 32) (size!5009 (buf!5550 thiss!1870))))))

(assert (= (and d!77190 res!190822) b!227454))

(assert (= (and b!227454 res!190821) b!227455))

(declare-fun m!349847 () Bool)

(assert (=> d!77190 m!349847))

(declare-fun m!349849 () Bool)

(assert (=> d!77190 m!349849))

(assert (=> b!227325 d!77190))

(declare-fun d!77192 () Bool)

(declare-fun e!155656 () Bool)

(assert (=> d!77192 e!155656))

(declare-fun res!190824 () Bool)

(assert (=> d!77192 (=> (not res!190824) (not e!155656))))

(declare-fun lt!363737 () (_ BitVec 64))

(declare-fun lt!363738 () (_ BitVec 64))

(declare-fun lt!363736 () (_ BitVec 64))

(assert (=> d!77192 (= res!190824 (= lt!363738 (bvsub lt!363737 lt!363736)))))

(assert (=> d!77192 (or (= (bvand lt!363737 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!363736 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!363737 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!363737 lt!363736) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77192 (= lt!363736 (remainingBits!0 ((_ sign_extend 32) (size!5009 (buf!5550 (_2!10613 lt!363233)))) ((_ sign_extend 32) (currentByte!10388 (_2!10613 lt!363233))) ((_ sign_extend 32) (currentBit!10383 (_2!10613 lt!363233)))))))

(declare-fun lt!363739 () (_ BitVec 64))

(declare-fun lt!363740 () (_ BitVec 64))

(assert (=> d!77192 (= lt!363737 (bvmul lt!363739 lt!363740))))

(assert (=> d!77192 (or (= lt!363739 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!363740 (bvsdiv (bvmul lt!363739 lt!363740) lt!363739)))))

(assert (=> d!77192 (= lt!363740 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77192 (= lt!363739 ((_ sign_extend 32) (size!5009 (buf!5550 (_2!10613 lt!363233)))))))

(assert (=> d!77192 (= lt!363738 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10388 (_2!10613 lt!363233))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10383 (_2!10613 lt!363233)))))))

(assert (=> d!77192 (invariant!0 (currentBit!10383 (_2!10613 lt!363233)) (currentByte!10388 (_2!10613 lt!363233)) (size!5009 (buf!5550 (_2!10613 lt!363233))))))

(assert (=> d!77192 (= (bitIndex!0 (size!5009 (buf!5550 (_2!10613 lt!363233))) (currentByte!10388 (_2!10613 lt!363233)) (currentBit!10383 (_2!10613 lt!363233))) lt!363738)))

(declare-fun b!227456 () Bool)

(declare-fun res!190823 () Bool)

(assert (=> b!227456 (=> (not res!190823) (not e!155656))))

(assert (=> b!227456 (= res!190823 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!363738))))

(declare-fun b!227457 () Bool)

(declare-fun lt!363741 () (_ BitVec 64))

(assert (=> b!227457 (= e!155656 (bvsle lt!363738 (bvmul lt!363741 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!227457 (or (= lt!363741 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!363741 #b0000000000000000000000000000000000000000000000000000000000001000) lt!363741)))))

(assert (=> b!227457 (= lt!363741 ((_ sign_extend 32) (size!5009 (buf!5550 (_2!10613 lt!363233)))))))

(assert (= (and d!77192 res!190824) b!227456))

(assert (= (and b!227456 res!190823) b!227457))

(declare-fun m!349851 () Bool)

(assert (=> d!77192 m!349851))

(declare-fun m!349853 () Bool)

(assert (=> d!77192 m!349853))

(assert (=> b!227325 d!77192))

(declare-fun d!77194 () Bool)

(assert (=> d!77194 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5009 (buf!5550 (_2!10612 lt!363230)))) ((_ sign_extend 32) (currentByte!10388 (_2!10612 lt!363230))) ((_ sign_extend 32) (currentBit!10383 (_2!10612 lt!363230))) lt!363234) (bvsle ((_ sign_extend 32) lt!363234) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5009 (buf!5550 (_2!10612 lt!363230)))) ((_ sign_extend 32) (currentByte!10388 (_2!10612 lt!363230))) ((_ sign_extend 32) (currentBit!10383 (_2!10612 lt!363230)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18867 () Bool)

(assert (= bs!18867 d!77194))

(assert (=> bs!18867 m!349653))

(assert (=> b!227325 d!77194))

(declare-fun d!77196 () Bool)

(declare-fun res!190830 () Bool)

(declare-fun e!155662 () Bool)

(assert (=> d!77196 (=> res!190830 e!155662)))

(assert (=> d!77196 (= res!190830 (= #b00000000000000000000000000000000 i!761))))

(assert (=> d!77196 (= (arrayRangesEq!845 arr!308 lt!363235 #b00000000000000000000000000000000 i!761) e!155662)))

(declare-fun b!227463 () Bool)

(declare-fun e!155663 () Bool)

(assert (=> b!227463 (= e!155662 e!155663)))

(declare-fun res!190831 () Bool)

(assert (=> b!227463 (=> (not res!190831) (not e!155663))))

(assert (=> b!227463 (= res!190831 (= (select (arr!5984 arr!308) #b00000000000000000000000000000000) (select (arr!5984 lt!363235) #b00000000000000000000000000000000)))))

(declare-fun b!227464 () Bool)

(assert (=> b!227464 (= e!155663 (arrayRangesEq!845 arr!308 lt!363235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) i!761))))

(assert (= (and d!77196 (not res!190830)) b!227463))

(assert (= (and b!227463 res!190831) b!227464))

(declare-fun m!349859 () Bool)

(assert (=> b!227463 m!349859))

(declare-fun m!349861 () Bool)

(assert (=> b!227463 m!349861))

(declare-fun m!349863 () Bool)

(assert (=> b!227464 m!349863))

(assert (=> b!227325 d!77196))

(declare-fun d!77198 () Bool)

(declare-fun e!155666 () Bool)

(assert (=> d!77198 e!155666))

(declare-fun res!190834 () Bool)

(assert (=> d!77198 (=> (not res!190834) (not e!155666))))

(assert (=> d!77198 (= res!190834 (and (or (let ((rhs!3967 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3967 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3967) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!77199 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!77199 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!77199 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3966 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3966 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3966) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!363751 () Unit!16961)

(declare-fun choose!57 (BitStream!9114 BitStream!9114 (_ BitVec 64) (_ BitVec 32)) Unit!16961)

(assert (=> d!77198 (= lt!363751 (choose!57 thiss!1870 (_2!10612 lt!363230) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> d!77198 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10612 lt!363230) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)) lt!363751)))

(declare-fun b!227467 () Bool)

(declare-fun lt!363753 () (_ BitVec 32))

(assert (=> b!227467 (= e!155666 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5009 (buf!5550 (_2!10612 lt!363230)))) ((_ sign_extend 32) (currentByte!10388 (_2!10612 lt!363230))) ((_ sign_extend 32) (currentBit!10383 (_2!10612 lt!363230))) (bvsub (bvsub to!496 i!761) lt!363753)))))

(assert (=> b!227467 (or (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand lt!363753 #b10000000000000000000000000000000)) (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!496 i!761) lt!363753) #b10000000000000000000000000000000)))))

(declare-fun lt!363752 () (_ BitVec 64))

(assert (=> b!227467 (= lt!363753 ((_ extract 31 0) lt!363752))))

(assert (=> b!227467 (and (bvslt lt!363752 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!363752 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!227467 (= lt!363752 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!77198 res!190834) b!227467))

(declare-fun m!349865 () Bool)

(assert (=> d!77198 m!349865))

(declare-fun m!349867 () Bool)

(assert (=> b!227467 m!349867))

(assert (=> b!227325 d!77198))

(declare-fun d!77201 () Bool)

(declare-fun lt!363768 () (_ BitVec 8))

(declare-fun lt!363769 () (_ BitVec 8))

(assert (=> d!77201 (= lt!363768 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5984 (buf!5550 thiss!1870)) (currentByte!10388 thiss!1870))) ((_ sign_extend 24) lt!363769))))))

(assert (=> d!77201 (= lt!363769 ((_ extract 7 0) (currentBit!10383 thiss!1870)))))

(declare-fun e!155671 () Bool)

(assert (=> d!77201 e!155671))

(declare-fun res!190841 () Bool)

(assert (=> d!77201 (=> (not res!190841) (not e!155671))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!77201 (= res!190841 (validate_offset_bits!1 ((_ sign_extend 32) (size!5009 (buf!5550 thiss!1870))) ((_ sign_extend 32) (currentByte!10388 thiss!1870)) ((_ sign_extend 32) (currentBit!10383 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!19554 0))(
  ( (tuple2!19555 (_1!10621 Unit!16961) (_2!10621 (_ BitVec 8))) )
))
(declare-fun Unit!16994 () Unit!16961)

(declare-fun Unit!16995 () Unit!16961)

(assert (=> d!77201 (= (readByte!0 thiss!1870) (tuple2!19541 (_2!10621 (ite (bvsgt ((_ sign_extend 24) lt!363769) #b00000000000000000000000000000000) (tuple2!19555 Unit!16994 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!363768) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5984 (buf!5550 thiss!1870)) (bvadd (currentByte!10388 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!363769)))))))) (tuple2!19555 Unit!16995 lt!363768))) (BitStream!9115 (buf!5550 thiss!1870) (bvadd (currentByte!10388 thiss!1870) #b00000000000000000000000000000001) (currentBit!10383 thiss!1870))))))

