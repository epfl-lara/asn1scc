; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46942 () Bool)

(assert start!46942)

(declare-fun b!224837 () Bool)

(declare-fun res!188700 () Bool)

(declare-fun e!153311 () Bool)

(assert (=> b!224837 (=> (not res!188700) (not e!153311))))

(declare-datatypes ((array!11120 0))(
  ( (array!11121 (arr!5834 (Array (_ BitVec 32) (_ BitVec 8))) (size!4880 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8862 0))(
  ( (BitStream!8863 (buf!5424 array!11120) (currentByte!10170 (_ BitVec 32)) (currentBit!10165 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8862)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!224837 (= res!188700 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4880 (buf!5424 thiss!1870))) ((_ sign_extend 32) (currentByte!10170 thiss!1870)) ((_ sign_extend 32) (currentBit!10165 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!224839 () Bool)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!224839 (= e!153311 (not (validate_offset_byte!0 ((_ sign_extend 32) (size!4880 (buf!5424 thiss!1870))) ((_ sign_extend 32) (currentByte!10170 thiss!1870)) ((_ sign_extend 32) (currentBit!10165 thiss!1870)))))))

(declare-datatypes ((tuple2!19270 0))(
  ( (tuple2!19271 (_1!10420 (_ BitVec 8)) (_2!10420 BitStream!8862)) )
))
(declare-fun lt!357729 () tuple2!19270)

(declare-datatypes ((Unit!16484 0))(
  ( (Unit!16485) )
))
(declare-datatypes ((tuple3!1286 0))(
  ( (tuple3!1287 (_1!10421 Unit!16484) (_2!10421 BitStream!8862) (_3!785 array!11120)) )
))
(declare-fun lt!357723 () tuple3!1286)

(assert (=> b!224839 (and (= (_1!10420 lt!357729) (select (arr!5834 (_3!785 lt!357723)) i!761)) (= (select (arr!5834 (_3!785 lt!357723)) i!761) (_1!10420 lt!357729)))))

(declare-fun lt!357720 () array!11120)

(declare-fun lt!357724 () Unit!16484)

(declare-fun arrayRangesEqImpliesEq!98 (array!11120 array!11120 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16484)

(assert (=> b!224839 (= lt!357724 (arrayRangesEqImpliesEq!98 lt!357720 (_3!785 lt!357723) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun arr!308 () array!11120)

(declare-fun arrayRangesEq!776 (array!11120 array!11120 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224839 (arrayRangesEq!776 arr!308 (_3!785 lt!357723) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!357719 () Unit!16484)

(declare-fun arrayRangesEqTransitive!247 (array!11120 array!11120 array!11120 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16484)

(assert (=> b!224839 (= lt!357719 (arrayRangesEqTransitive!247 arr!308 lt!357720 (_3!785 lt!357723) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!224839 (arrayRangesEq!776 arr!308 lt!357720 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!357721 () Unit!16484)

(declare-fun arrayUpdatedAtPrefixLemma!368 (array!11120 (_ BitVec 32) (_ BitVec 8)) Unit!16484)

(assert (=> b!224839 (= lt!357721 (arrayUpdatedAtPrefixLemma!368 arr!308 i!761 (_1!10420 lt!357729)))))

(declare-fun lt!357722 () (_ BitVec 64))

(declare-fun lt!357728 () (_ BitVec 64))

(declare-fun lt!357727 () (_ BitVec 64))

(declare-fun lt!357726 () (_ BitVec 32))

(assert (=> b!224839 (and (= (bvadd lt!357722 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!357726))) lt!357728) (= (bvadd lt!357727 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!357728) (= (buf!5424 thiss!1870) (buf!5424 (_2!10421 lt!357723))) (= (size!4880 arr!308) (size!4880 (_3!785 lt!357723))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!224839 (= lt!357728 (bitIndex!0 (size!4880 (buf!5424 (_2!10421 lt!357723))) (currentByte!10170 (_2!10421 lt!357723)) (currentBit!10165 (_2!10421 lt!357723))))))

(assert (=> b!224839 (= lt!357722 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!357727))))

(assert (=> b!224839 (= lt!357722 (bitIndex!0 (size!4880 (buf!5424 (_2!10420 lt!357729))) (currentByte!10170 (_2!10420 lt!357729)) (currentBit!10165 (_2!10420 lt!357729))))))

(assert (=> b!224839 (= lt!357727 (bitIndex!0 (size!4880 (buf!5424 thiss!1870)) (currentByte!10170 thiss!1870) (currentBit!10165 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8862 array!11120 (_ BitVec 32) (_ BitVec 32)) tuple3!1286)

(assert (=> b!224839 (= lt!357723 (readByteArrayLoop!0 (_2!10420 lt!357729) lt!357720 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!224839 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4880 (buf!5424 (_2!10420 lt!357729)))) ((_ sign_extend 32) (currentByte!10170 (_2!10420 lt!357729))) ((_ sign_extend 32) (currentBit!10165 (_2!10420 lt!357729))) lt!357726)))

(assert (=> b!224839 (= lt!357726 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!357725 () Unit!16484)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8862 BitStream!8862 (_ BitVec 64) (_ BitVec 32)) Unit!16484)

(assert (=> b!224839 (= lt!357725 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10420 lt!357729) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!224839 (= lt!357720 (array!11121 (store (arr!5834 arr!308) i!761 (_1!10420 lt!357729)) (size!4880 arr!308)))))

(declare-fun readByte!0 (BitStream!8862) tuple2!19270)

(assert (=> b!224839 (= lt!357729 (readByte!0 thiss!1870))))

(declare-fun b!224840 () Bool)

(declare-fun e!153312 () Bool)

(declare-fun array_inv!4621 (array!11120) Bool)

(assert (=> b!224840 (= e!153312 (array_inv!4621 (buf!5424 thiss!1870)))))

(declare-fun b!224838 () Bool)

(declare-fun res!188699 () Bool)

(assert (=> b!224838 (=> (not res!188699) (not e!153311))))

(assert (=> b!224838 (= res!188699 (bvslt i!761 to!496))))

(declare-fun res!188698 () Bool)

(assert (=> start!46942 (=> (not res!188698) (not e!153311))))

(assert (=> start!46942 (= res!188698 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4880 arr!308))))))

(assert (=> start!46942 e!153311))

(assert (=> start!46942 true))

(assert (=> start!46942 (array_inv!4621 arr!308)))

(declare-fun inv!12 (BitStream!8862) Bool)

(assert (=> start!46942 (and (inv!12 thiss!1870) e!153312)))

(assert (= (and start!46942 res!188698) b!224837))

(assert (= (and b!224837 res!188700) b!224838))

(assert (= (and b!224838 res!188699) b!224839))

(assert (= start!46942 b!224840))

(declare-fun m!345565 () Bool)

(assert (=> b!224837 m!345565))

(declare-fun m!345567 () Bool)

(assert (=> b!224839 m!345567))

(declare-fun m!345569 () Bool)

(assert (=> b!224839 m!345569))

(declare-fun m!345571 () Bool)

(assert (=> b!224839 m!345571))

(declare-fun m!345573 () Bool)

(assert (=> b!224839 m!345573))

(declare-fun m!345575 () Bool)

(assert (=> b!224839 m!345575))

(declare-fun m!345577 () Bool)

(assert (=> b!224839 m!345577))

(declare-fun m!345579 () Bool)

(assert (=> b!224839 m!345579))

(declare-fun m!345581 () Bool)

(assert (=> b!224839 m!345581))

(declare-fun m!345583 () Bool)

(assert (=> b!224839 m!345583))

(declare-fun m!345585 () Bool)

(assert (=> b!224839 m!345585))

(declare-fun m!345587 () Bool)

(assert (=> b!224839 m!345587))

(declare-fun m!345589 () Bool)

(assert (=> b!224839 m!345589))

(declare-fun m!345591 () Bool)

(assert (=> b!224839 m!345591))

(declare-fun m!345593 () Bool)

(assert (=> b!224839 m!345593))

(declare-fun m!345595 () Bool)

(assert (=> b!224839 m!345595))

(declare-fun m!345597 () Bool)

(assert (=> b!224840 m!345597))

(declare-fun m!345599 () Bool)

(assert (=> start!46942 m!345599))

(declare-fun m!345601 () Bool)

(assert (=> start!46942 m!345601))

(check-sat (not b!224840) (not b!224839) (not start!46942) (not b!224837))
(check-sat)
(get-model)

(declare-fun d!76263 () Bool)

(assert (=> d!76263 (= (array_inv!4621 (buf!5424 thiss!1870)) (bvsge (size!4880 (buf!5424 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!224840 d!76263))

(declare-fun lt!357988 () tuple3!1286)

(declare-fun b!224914 () Bool)

(declare-fun e!153375 () Bool)

(assert (=> b!224914 (= e!153375 (arrayRangesEq!776 lt!357720 (_3!785 lt!357988) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun call!3646 () (_ BitVec 64))

(declare-fun c!11143 () Bool)

(declare-fun bm!3643 () Bool)

(declare-fun lt!357991 () tuple3!1286)

(assert (=> bm!3643 (= call!3646 (bitIndex!0 (ite c!11143 (size!4880 (buf!5424 (_2!10421 lt!357991))) (size!4880 (buf!5424 (_2!10420 lt!357729)))) (ite c!11143 (currentByte!10170 (_2!10421 lt!357991)) (currentByte!10170 (_2!10420 lt!357729))) (ite c!11143 (currentBit!10165 (_2!10421 lt!357991)) (currentBit!10165 (_2!10420 lt!357729)))))))

(declare-fun b!224915 () Bool)

(declare-fun e!153376 () tuple3!1286)

(declare-fun lt!357974 () Unit!16484)

(assert (=> b!224915 (= e!153376 (tuple3!1287 lt!357974 (_2!10420 lt!357729) lt!357720))))

(assert (=> b!224915 (= call!3646 call!3646)))

(declare-fun lt!357979 () Unit!16484)

(declare-fun Unit!16488 () Unit!16484)

(assert (=> b!224915 (= lt!357979 Unit!16488)))

(declare-fun lt!357993 () Unit!16484)

(declare-fun arrayRangesEqReflexiveLemma!79 (array!11120) Unit!16484)

(assert (=> b!224915 (= lt!357993 (arrayRangesEqReflexiveLemma!79 lt!357720))))

(declare-fun call!3647 () Bool)

(assert (=> b!224915 call!3647))

(declare-fun lt!357969 () Unit!16484)

(assert (=> b!224915 (= lt!357969 lt!357993)))

(declare-fun lt!357981 () array!11120)

(assert (=> b!224915 (= lt!357981 lt!357720)))

(declare-fun lt!357970 () array!11120)

(assert (=> b!224915 (= lt!357970 lt!357720)))

(declare-fun lt!357966 () (_ BitVec 32))

(assert (=> b!224915 (= lt!357966 #b00000000000000000000000000000000)))

(declare-fun lt!357977 () (_ BitVec 32))

(assert (=> b!224915 (= lt!357977 (size!4880 lt!357720))))

(declare-fun lt!357980 () (_ BitVec 32))

(assert (=> b!224915 (= lt!357980 #b00000000000000000000000000000000)))

(declare-fun lt!357964 () (_ BitVec 32))

(assert (=> b!224915 (= lt!357964 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun arrayRangesEqSlicedLemma!79 (array!11120 array!11120 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16484)

(assert (=> b!224915 (= lt!357974 (arrayRangesEqSlicedLemma!79 lt!357981 lt!357970 lt!357966 lt!357977 lt!357980 lt!357964))))

(declare-fun call!3648 () Bool)

(assert (=> b!224915 call!3648))

(declare-fun bm!3644 () Bool)

(declare-fun lt!357965 () tuple2!19270)

(assert (=> bm!3644 (= call!3648 (arrayRangesEq!776 (ite c!11143 lt!357720 lt!357981) (ite c!11143 (array!11121 (store (arr!5834 lt!357720) (bvadd #b00000000000000000000000000000001 i!761) (_1!10420 lt!357965)) (size!4880 lt!357720)) lt!357970) (ite c!11143 #b00000000000000000000000000000000 lt!357980) (ite c!11143 (bvadd #b00000000000000000000000000000001 i!761) lt!357964)))))

(declare-fun b!224916 () Bool)

(declare-fun e!153377 () Bool)

(declare-datatypes ((tuple2!19276 0))(
  ( (tuple2!19277 (_1!10425 BitStream!8862) (_2!10425 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!8862) tuple2!19276)

(assert (=> b!224916 (= e!153377 (= (select (arr!5834 (_3!785 lt!357988)) (bvadd #b00000000000000000000000000000001 i!761)) (_2!10425 (readBytePure!0 (_2!10420 lt!357729)))))))

(assert (=> b!224916 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4880 (_3!785 lt!357988))))))

(declare-fun b!224917 () Bool)

(declare-fun res!188771 () Bool)

(assert (=> b!224917 (=> (not res!188771) (not e!153375))))

(assert (=> b!224917 (= res!188771 (and (= (buf!5424 (_2!10420 lt!357729)) (buf!5424 (_2!10421 lt!357988))) (= (size!4880 lt!357720) (size!4880 (_3!785 lt!357988)))))))

(declare-fun b!224918 () Bool)

(declare-fun lt!357983 () Unit!16484)

(assert (=> b!224918 (= e!153376 (tuple3!1287 lt!357983 (_2!10421 lt!357991) (_3!785 lt!357991)))))

(assert (=> b!224918 (= lt!357965 (readByte!0 (_2!10420 lt!357729)))))

(declare-fun lt!357996 () array!11120)

(assert (=> b!224918 (= lt!357996 (array!11121 (store (arr!5834 lt!357720) (bvadd #b00000000000000000000000000000001 i!761) (_1!10420 lt!357965)) (size!4880 lt!357720)))))

(declare-fun lt!357986 () (_ BitVec 64))

(assert (=> b!224918 (= lt!357986 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!357997 () (_ BitVec 32))

(assert (=> b!224918 (= lt!357997 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!357984 () Unit!16484)

(assert (=> b!224918 (= lt!357984 (validateOffsetBytesFromBitIndexLemma!0 (_2!10420 lt!357729) (_2!10420 lt!357965) lt!357986 lt!357997))))

(assert (=> b!224918 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4880 (buf!5424 (_2!10420 lt!357965)))) ((_ sign_extend 32) (currentByte!10170 (_2!10420 lt!357965))) ((_ sign_extend 32) (currentBit!10165 (_2!10420 lt!357965))) (bvsub lt!357997 ((_ extract 31 0) (bvsdiv (bvadd lt!357986 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!357998 () Unit!16484)

(assert (=> b!224918 (= lt!357998 lt!357984)))

(assert (=> b!224918 (= lt!357991 (readByteArrayLoop!0 (_2!10420 lt!357965) lt!357996 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(assert (=> b!224918 (= (bitIndex!0 (size!4880 (buf!5424 (_2!10420 lt!357965))) (currentByte!10170 (_2!10420 lt!357965)) (currentBit!10165 (_2!10420 lt!357965))) (bvadd (bitIndex!0 (size!4880 (buf!5424 (_2!10420 lt!357729))) (currentByte!10170 (_2!10420 lt!357729)) (currentBit!10165 (_2!10420 lt!357729))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!357972 () Unit!16484)

(declare-fun Unit!16493 () Unit!16484)

(assert (=> b!224918 (= lt!357972 Unit!16493)))

(assert (=> b!224918 (= (bvadd (bitIndex!0 (size!4880 (buf!5424 (_2!10420 lt!357965))) (currentByte!10170 (_2!10420 lt!357965)) (currentBit!10165 (_2!10420 lt!357965))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!3646)))

(declare-fun lt!357999 () Unit!16484)

(declare-fun Unit!16494 () Unit!16484)

(assert (=> b!224918 (= lt!357999 Unit!16494)))

(assert (=> b!224918 (= (bvadd (bitIndex!0 (size!4880 (buf!5424 (_2!10420 lt!357729))) (currentByte!10170 (_2!10420 lt!357729)) (currentBit!10165 (_2!10420 lt!357729))) (bvmul ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))) #b0000000000000000000000000000000000000000000000000000000000001000)) call!3646)))

(declare-fun lt!357968 () Unit!16484)

(declare-fun Unit!16495 () Unit!16484)

(assert (=> b!224918 (= lt!357968 Unit!16495)))

(assert (=> b!224918 (and (= (buf!5424 (_2!10420 lt!357729)) (buf!5424 (_2!10421 lt!357991))) (= (size!4880 lt!357720) (size!4880 (_3!785 lt!357991))))))

(declare-fun lt!357994 () Unit!16484)

(declare-fun Unit!16496 () Unit!16484)

(assert (=> b!224918 (= lt!357994 Unit!16496)))

(declare-fun lt!357971 () Unit!16484)

(assert (=> b!224918 (= lt!357971 (arrayUpdatedAtPrefixLemma!368 lt!357720 (bvadd #b00000000000000000000000000000001 i!761) (_1!10420 lt!357965)))))

(assert (=> b!224918 call!3648))

(declare-fun lt!357990 () Unit!16484)

(assert (=> b!224918 (= lt!357990 lt!357971)))

(declare-fun lt!357978 () (_ BitVec 32))

(assert (=> b!224918 (= lt!357978 #b00000000000000000000000000000000)))

(declare-fun lt!357976 () Unit!16484)

(assert (=> b!224918 (= lt!357976 (arrayRangesEqTransitive!247 lt!357720 lt!357996 (_3!785 lt!357991) lt!357978 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!224918 call!3647))

(declare-fun lt!357967 () Unit!16484)

(assert (=> b!224918 (= lt!357967 lt!357976)))

(assert (=> b!224918 (arrayRangesEq!776 lt!357720 (_3!785 lt!357991) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun lt!357975 () Unit!16484)

(declare-fun Unit!16497 () Unit!16484)

(assert (=> b!224918 (= lt!357975 Unit!16497)))

(declare-fun lt!357987 () Unit!16484)

(assert (=> b!224918 (= lt!357987 (arrayRangesEqImpliesEq!98 lt!357996 (_3!785 lt!357991) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!224918 (= (select (store (arr!5834 lt!357720) (bvadd #b00000000000000000000000000000001 i!761) (_1!10420 lt!357965)) (bvadd #b00000000000000000000000000000001 i!761)) (select (arr!5834 (_3!785 lt!357991)) (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!357995 () Unit!16484)

(assert (=> b!224918 (= lt!357995 lt!357987)))

(declare-fun lt!357985 () Bool)

(assert (=> b!224918 (= lt!357985 (= (select (arr!5834 (_3!785 lt!357991)) (bvadd #b00000000000000000000000000000001 i!761)) (_1!10420 lt!357965)))))

(declare-fun Unit!16498 () Unit!16484)

(assert (=> b!224918 (= lt!357983 Unit!16498)))

(assert (=> b!224918 lt!357985))

(declare-fun d!76265 () Bool)

(assert (=> d!76265 e!153377))

(declare-fun res!188769 () Bool)

(assert (=> d!76265 (=> res!188769 e!153377)))

(assert (=> d!76265 (= res!188769 (bvsge (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!357989 () Bool)

(assert (=> d!76265 (= lt!357989 e!153375)))

(declare-fun res!188770 () Bool)

(assert (=> d!76265 (=> (not res!188770) (not e!153375))))

(declare-fun lt!357973 () (_ BitVec 64))

(declare-fun lt!357982 () (_ BitVec 64))

(assert (=> d!76265 (= res!188770 (= (bvadd lt!357973 lt!357982) (bitIndex!0 (size!4880 (buf!5424 (_2!10421 lt!357988))) (currentByte!10170 (_2!10421 lt!357988)) (currentBit!10165 (_2!10421 lt!357988)))))))

(assert (=> d!76265 (or (not (= (bvand lt!357973 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!357982 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!357973 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!357973 lt!357982) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!357992 () (_ BitVec 64))

(assert (=> d!76265 (= lt!357982 (bvmul lt!357992 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!76265 (or (= lt!357992 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!357992 #b0000000000000000000000000000000000000000000000000000000000001000) lt!357992)))))

(assert (=> d!76265 (= lt!357992 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))))))

(assert (=> d!76265 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b10000000000000000000000000000000)))))

(assert (=> d!76265 (= lt!357973 (bitIndex!0 (size!4880 (buf!5424 (_2!10420 lt!357729))) (currentByte!10170 (_2!10420 lt!357729)) (currentBit!10165 (_2!10420 lt!357729))))))

(assert (=> d!76265 (= lt!357988 e!153376)))

(assert (=> d!76265 (= c!11143 (bvslt (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> d!76265 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) to!496) (bvsle to!496 (size!4880 lt!357720)))))

(assert (=> d!76265 (= (readByteArrayLoop!0 (_2!10420 lt!357729) lt!357720 (bvadd #b00000000000000000000000000000001 i!761) to!496) lt!357988)))

(declare-fun bm!3645 () Bool)

(assert (=> bm!3645 (= call!3647 (arrayRangesEq!776 lt!357720 (ite c!11143 (_3!785 lt!357991) lt!357720) (ite c!11143 lt!357978 #b00000000000000000000000000000000) (ite c!11143 (bvadd #b00000000000000000000000000000001 i!761) (size!4880 lt!357720))))))

(assert (= (and d!76265 c!11143) b!224918))

(assert (= (and d!76265 (not c!11143)) b!224915))

(assert (= (or b!224918 b!224915) bm!3644))

(assert (= (or b!224918 b!224915) bm!3645))

(assert (= (or b!224918 b!224915) bm!3643))

(assert (= (and d!76265 res!188770) b!224917))

(assert (= (and b!224917 res!188771) b!224914))

(assert (= (and d!76265 (not res!188769)) b!224916))

(declare-fun m!345715 () Bool)

(assert (=> d!76265 m!345715))

(assert (=> d!76265 m!345575))

(declare-fun m!345717 () Bool)

(assert (=> b!224915 m!345717))

(declare-fun m!345719 () Bool)

(assert (=> b!224915 m!345719))

(declare-fun m!345721 () Bool)

(assert (=> bm!3643 m!345721))

(declare-fun m!345723 () Bool)

(assert (=> b!224918 m!345723))

(declare-fun m!345725 () Bool)

(assert (=> b!224918 m!345725))

(declare-fun m!345727 () Bool)

(assert (=> b!224918 m!345727))

(declare-fun m!345729 () Bool)

(assert (=> b!224918 m!345729))

(assert (=> b!224918 m!345575))

(declare-fun m!345731 () Bool)

(assert (=> b!224918 m!345731))

(declare-fun m!345733 () Bool)

(assert (=> b!224918 m!345733))

(declare-fun m!345735 () Bool)

(assert (=> b!224918 m!345735))

(declare-fun m!345737 () Bool)

(assert (=> b!224918 m!345737))

(declare-fun m!345739 () Bool)

(assert (=> b!224918 m!345739))

(declare-fun m!345741 () Bool)

(assert (=> b!224918 m!345741))

(declare-fun m!345743 () Bool)

(assert (=> b!224918 m!345743))

(declare-fun m!345745 () Bool)

(assert (=> b!224918 m!345745))

(declare-fun m!345747 () Bool)

(assert (=> b!224916 m!345747))

(declare-fun m!345749 () Bool)

(assert (=> b!224916 m!345749))

(declare-fun m!345751 () Bool)

(assert (=> bm!3645 m!345751))

(assert (=> bm!3644 m!345729))

(declare-fun m!345753 () Bool)

(assert (=> bm!3644 m!345753))

(declare-fun m!345755 () Bool)

(assert (=> b!224914 m!345755))

(assert (=> b!224839 d!76265))

(declare-fun d!76313 () Bool)

(declare-fun lt!358015 () (_ BitVec 8))

(declare-fun lt!358017 () (_ BitVec 8))

(assert (=> d!76313 (= lt!358015 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5834 (buf!5424 thiss!1870)) (currentByte!10170 thiss!1870))) ((_ sign_extend 24) lt!358017))))))

(assert (=> d!76313 (= lt!358017 ((_ extract 7 0) (currentBit!10165 thiss!1870)))))

(declare-fun e!153382 () Bool)

(assert (=> d!76313 e!153382))

(declare-fun res!188778 () Bool)

(assert (=> d!76313 (=> (not res!188778) (not e!153382))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!76313 (= res!188778 (validate_offset_bits!1 ((_ sign_extend 32) (size!4880 (buf!5424 thiss!1870))) ((_ sign_extend 32) (currentByte!10170 thiss!1870)) ((_ sign_extend 32) (currentBit!10165 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!19280 0))(
  ( (tuple2!19281 (_1!10427 Unit!16484) (_2!10427 (_ BitVec 8))) )
))
(declare-fun Unit!16501 () Unit!16484)

(declare-fun Unit!16502 () Unit!16484)

(assert (=> d!76313 (= (readByte!0 thiss!1870) (tuple2!19271 (_2!10427 (ite (bvsgt ((_ sign_extend 24) lt!358017) #b00000000000000000000000000000000) (tuple2!19281 Unit!16501 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!358015) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5834 (buf!5424 thiss!1870)) (bvadd (currentByte!10170 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!358017)))))))) (tuple2!19281 Unit!16502 lt!358015))) (BitStream!8863 (buf!5424 thiss!1870) (bvadd (currentByte!10170 thiss!1870) #b00000000000000000000000000000001) (currentBit!10165 thiss!1870))))))

(declare-fun b!224923 () Bool)

(declare-fun e!153383 () Bool)

(assert (=> b!224923 (= e!153382 e!153383)))

(declare-fun res!188777 () Bool)

(assert (=> b!224923 (=> (not res!188777) (not e!153383))))

(declare-fun lt!358018 () tuple2!19270)

(assert (=> b!224923 (= res!188777 (= (buf!5424 (_2!10420 lt!358018)) (buf!5424 thiss!1870)))))

(declare-fun lt!358014 () (_ BitVec 8))

(declare-fun lt!358020 () (_ BitVec 8))

(declare-fun Unit!16505 () Unit!16484)

(declare-fun Unit!16506 () Unit!16484)

(assert (=> b!224923 (= lt!358018 (tuple2!19271 (_2!10427 (ite (bvsgt ((_ sign_extend 24) lt!358020) #b00000000000000000000000000000000) (tuple2!19281 Unit!16505 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!358014) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5834 (buf!5424 thiss!1870)) (bvadd (currentByte!10170 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!358020)))))))) (tuple2!19281 Unit!16506 lt!358014))) (BitStream!8863 (buf!5424 thiss!1870) (bvadd (currentByte!10170 thiss!1870) #b00000000000000000000000000000001) (currentBit!10165 thiss!1870))))))

(assert (=> b!224923 (= lt!358014 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5834 (buf!5424 thiss!1870)) (currentByte!10170 thiss!1870))) ((_ sign_extend 24) lt!358020))))))

(assert (=> b!224923 (= lt!358020 ((_ extract 7 0) (currentBit!10165 thiss!1870)))))

(declare-fun b!224924 () Bool)

(declare-fun lt!358019 () (_ BitVec 64))

(declare-fun lt!358016 () (_ BitVec 64))

(assert (=> b!224924 (= e!153383 (= (bitIndex!0 (size!4880 (buf!5424 (_2!10420 lt!358018))) (currentByte!10170 (_2!10420 lt!358018)) (currentBit!10165 (_2!10420 lt!358018))) (bvadd lt!358016 lt!358019)))))

(assert (=> b!224924 (or (not (= (bvand lt!358016 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!358019 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!358016 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!358016 lt!358019) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!224924 (= lt!358019 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!224924 (= lt!358016 (bitIndex!0 (size!4880 (buf!5424 thiss!1870)) (currentByte!10170 thiss!1870) (currentBit!10165 thiss!1870)))))

(assert (= (and d!76313 res!188778) b!224923))

(assert (= (and b!224923 res!188777) b!224924))

(declare-fun m!345757 () Bool)

(assert (=> d!76313 m!345757))

(declare-fun m!345759 () Bool)

(assert (=> d!76313 m!345759))

(declare-fun m!345761 () Bool)

(assert (=> d!76313 m!345761))

(assert (=> b!224923 m!345761))

(assert (=> b!224923 m!345757))

(declare-fun m!345763 () Bool)

(assert (=> b!224924 m!345763))

(assert (=> b!224924 m!345585))

(assert (=> b!224839 d!76313))

(declare-fun d!76315 () Bool)

(assert (=> d!76315 (arrayRangesEq!776 arr!308 (_3!785 lt!357723) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!358023 () Unit!16484)

(declare-fun choose!298 (array!11120 array!11120 array!11120 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16484)

(assert (=> d!76315 (= lt!358023 (choose!298 arr!308 lt!357720 (_3!785 lt!357723) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!76315 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!76315 (= (arrayRangesEqTransitive!247 arr!308 lt!357720 (_3!785 lt!357723) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)) lt!358023)))

(declare-fun bs!18614 () Bool)

(assert (= bs!18614 d!76315))

(assert (=> bs!18614 m!345569))

(declare-fun m!345765 () Bool)

(assert (=> bs!18614 m!345765))

(assert (=> b!224839 d!76315))

(declare-fun d!76317 () Bool)

(declare-fun e!153386 () Bool)

(assert (=> d!76317 e!153386))

(declare-fun res!188781 () Bool)

(assert (=> d!76317 (=> (not res!188781) (not e!153386))))

(assert (=> d!76317 (= res!188781 (and (or (let ((rhs!3788 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3788 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3788) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!76318 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!76318 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!76318 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3787 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3787 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3787) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!358030 () Unit!16484)

(declare-fun choose!57 (BitStream!8862 BitStream!8862 (_ BitVec 64) (_ BitVec 32)) Unit!16484)

(assert (=> d!76317 (= lt!358030 (choose!57 thiss!1870 (_2!10420 lt!357729) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> d!76317 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10420 lt!357729) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)) lt!358030)))

(declare-fun b!224927 () Bool)

(declare-fun lt!358032 () (_ BitVec 32))

(assert (=> b!224927 (= e!153386 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4880 (buf!5424 (_2!10420 lt!357729)))) ((_ sign_extend 32) (currentByte!10170 (_2!10420 lt!357729))) ((_ sign_extend 32) (currentBit!10165 (_2!10420 lt!357729))) (bvsub (bvsub to!496 i!761) lt!358032)))))

(assert (=> b!224927 (or (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand lt!358032 #b10000000000000000000000000000000)) (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!496 i!761) lt!358032) #b10000000000000000000000000000000)))))

(declare-fun lt!358031 () (_ BitVec 64))

(assert (=> b!224927 (= lt!358032 ((_ extract 31 0) lt!358031))))

(assert (=> b!224927 (and (bvslt lt!358031 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!358031 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!224927 (= lt!358031 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!76317 res!188781) b!224927))

(declare-fun m!345767 () Bool)

(assert (=> d!76317 m!345767))

(declare-fun m!345769 () Bool)

(assert (=> b!224927 m!345769))

(assert (=> b!224839 d!76317))

(declare-fun d!76320 () Bool)

(declare-fun res!188786 () Bool)

(declare-fun e!153393 () Bool)

(assert (=> d!76320 (=> res!188786 e!153393)))

(assert (=> d!76320 (= res!188786 (= #b00000000000000000000000000000000 i!761))))

(assert (=> d!76320 (= (arrayRangesEq!776 arr!308 (_3!785 lt!357723) #b00000000000000000000000000000000 i!761) e!153393)))

(declare-fun b!224936 () Bool)

(declare-fun e!153394 () Bool)

(assert (=> b!224936 (= e!153393 e!153394)))

(declare-fun res!188787 () Bool)

(assert (=> b!224936 (=> (not res!188787) (not e!153394))))

(assert (=> b!224936 (= res!188787 (= (select (arr!5834 arr!308) #b00000000000000000000000000000000) (select (arr!5834 (_3!785 lt!357723)) #b00000000000000000000000000000000)))))

(declare-fun b!224937 () Bool)

(assert (=> b!224937 (= e!153394 (arrayRangesEq!776 arr!308 (_3!785 lt!357723) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) i!761))))

(assert (= (and d!76320 (not res!188786)) b!224936))

(assert (= (and b!224936 res!188787) b!224937))

(declare-fun m!345771 () Bool)

(assert (=> b!224936 m!345771))

(declare-fun m!345773 () Bool)

(assert (=> b!224936 m!345773))

(declare-fun m!345775 () Bool)

(assert (=> b!224937 m!345775))

(assert (=> b!224839 d!76320))

(declare-fun d!76322 () Bool)

(declare-fun e!153403 () Bool)

(assert (=> d!76322 e!153403))

(declare-fun res!188799 () Bool)

(assert (=> d!76322 (=> (not res!188799) (not e!153403))))

(declare-fun lt!358135 () (_ BitVec 64))

(declare-fun lt!358138 () (_ BitVec 64))

(declare-fun lt!358136 () (_ BitVec 64))

(assert (=> d!76322 (= res!188799 (= lt!358138 (bvsub lt!358135 lt!358136)))))

(assert (=> d!76322 (or (= (bvand lt!358135 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!358136 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!358135 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!358135 lt!358136) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!76322 (= lt!358136 (remainingBits!0 ((_ sign_extend 32) (size!4880 (buf!5424 thiss!1870))) ((_ sign_extend 32) (currentByte!10170 thiss!1870)) ((_ sign_extend 32) (currentBit!10165 thiss!1870))))))

(declare-fun lt!358137 () (_ BitVec 64))

(declare-fun lt!358140 () (_ BitVec 64))

(assert (=> d!76322 (= lt!358135 (bvmul lt!358137 lt!358140))))

(assert (=> d!76322 (or (= lt!358137 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!358140 (bvsdiv (bvmul lt!358137 lt!358140) lt!358137)))))

(assert (=> d!76322 (= lt!358140 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76322 (= lt!358137 ((_ sign_extend 32) (size!4880 (buf!5424 thiss!1870))))))

(assert (=> d!76322 (= lt!358138 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10170 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10165 thiss!1870))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!76322 (invariant!0 (currentBit!10165 thiss!1870) (currentByte!10170 thiss!1870) (size!4880 (buf!5424 thiss!1870)))))

(assert (=> d!76322 (= (bitIndex!0 (size!4880 (buf!5424 thiss!1870)) (currentByte!10170 thiss!1870) (currentBit!10165 thiss!1870)) lt!358138)))

(declare-fun b!224952 () Bool)

(declare-fun res!188798 () Bool)

(assert (=> b!224952 (=> (not res!188798) (not e!153403))))

(assert (=> b!224952 (= res!188798 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!358138))))

(declare-fun b!224953 () Bool)

(declare-fun lt!358139 () (_ BitVec 64))

(assert (=> b!224953 (= e!153403 (bvsle lt!358138 (bvmul lt!358139 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!224953 (or (= lt!358139 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!358139 #b0000000000000000000000000000000000000000000000000000000000001000) lt!358139)))))

(assert (=> b!224953 (= lt!358139 ((_ sign_extend 32) (size!4880 (buf!5424 thiss!1870))))))

(assert (= (and d!76322 res!188799) b!224952))

(assert (= (and b!224952 res!188798) b!224953))

(declare-fun m!345777 () Bool)

(assert (=> d!76322 m!345777))

(declare-fun m!345779 () Bool)

(assert (=> d!76322 m!345779))

(assert (=> b!224839 d!76322))

(declare-fun d!76324 () Bool)

(declare-fun e!153404 () Bool)

(assert (=> d!76324 e!153404))

(declare-fun res!188801 () Bool)

(assert (=> d!76324 (=> (not res!188801) (not e!153404))))

(declare-fun lt!358145 () (_ BitVec 64))

(declare-fun lt!358146 () (_ BitVec 64))

(declare-fun lt!358148 () (_ BitVec 64))

(assert (=> d!76324 (= res!188801 (= lt!358148 (bvsub lt!358145 lt!358146)))))

(assert (=> d!76324 (or (= (bvand lt!358145 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!358146 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!358145 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!358145 lt!358146) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!76324 (= lt!358146 (remainingBits!0 ((_ sign_extend 32) (size!4880 (buf!5424 (_2!10421 lt!357723)))) ((_ sign_extend 32) (currentByte!10170 (_2!10421 lt!357723))) ((_ sign_extend 32) (currentBit!10165 (_2!10421 lt!357723)))))))

(declare-fun lt!358147 () (_ BitVec 64))

(declare-fun lt!358150 () (_ BitVec 64))

(assert (=> d!76324 (= lt!358145 (bvmul lt!358147 lt!358150))))

(assert (=> d!76324 (or (= lt!358147 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!358150 (bvsdiv (bvmul lt!358147 lt!358150) lt!358147)))))

(assert (=> d!76324 (= lt!358150 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76324 (= lt!358147 ((_ sign_extend 32) (size!4880 (buf!5424 (_2!10421 lt!357723)))))))

(assert (=> d!76324 (= lt!358148 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10170 (_2!10421 lt!357723))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10165 (_2!10421 lt!357723)))))))

(assert (=> d!76324 (invariant!0 (currentBit!10165 (_2!10421 lt!357723)) (currentByte!10170 (_2!10421 lt!357723)) (size!4880 (buf!5424 (_2!10421 lt!357723))))))

(assert (=> d!76324 (= (bitIndex!0 (size!4880 (buf!5424 (_2!10421 lt!357723))) (currentByte!10170 (_2!10421 lt!357723)) (currentBit!10165 (_2!10421 lt!357723))) lt!358148)))

(declare-fun b!224954 () Bool)

(declare-fun res!188800 () Bool)

(assert (=> b!224954 (=> (not res!188800) (not e!153404))))

(assert (=> b!224954 (= res!188800 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!358148))))

(declare-fun b!224955 () Bool)

(declare-fun lt!358149 () (_ BitVec 64))

(assert (=> b!224955 (= e!153404 (bvsle lt!358148 (bvmul lt!358149 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!224955 (or (= lt!358149 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!358149 #b0000000000000000000000000000000000000000000000000000000000001000) lt!358149)))))

(assert (=> b!224955 (= lt!358149 ((_ sign_extend 32) (size!4880 (buf!5424 (_2!10421 lt!357723)))))))

(assert (= (and d!76324 res!188801) b!224954))

(assert (= (and b!224954 res!188800) b!224955))

(declare-fun m!345781 () Bool)

(assert (=> d!76324 m!345781))

(declare-fun m!345783 () Bool)

(assert (=> d!76324 m!345783))

(assert (=> b!224839 d!76324))

(declare-fun d!76326 () Bool)

(assert (=> d!76326 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4880 (buf!5424 (_2!10420 lt!357729)))) ((_ sign_extend 32) (currentByte!10170 (_2!10420 lt!357729))) ((_ sign_extend 32) (currentBit!10165 (_2!10420 lt!357729))) lt!357726) (bvsle ((_ sign_extend 32) lt!357726) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4880 (buf!5424 (_2!10420 lt!357729)))) ((_ sign_extend 32) (currentByte!10170 (_2!10420 lt!357729))) ((_ sign_extend 32) (currentBit!10165 (_2!10420 lt!357729)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18615 () Bool)

(assert (= bs!18615 d!76326))

(declare-fun m!345785 () Bool)

(assert (=> bs!18615 m!345785))

(assert (=> b!224839 d!76326))

(declare-fun d!76328 () Bool)

(assert (=> d!76328 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!4880 (buf!5424 thiss!1870))) ((_ sign_extend 32) (currentByte!10170 thiss!1870)) ((_ sign_extend 32) (currentBit!10165 thiss!1870))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4880 (buf!5424 thiss!1870))) ((_ sign_extend 32) (currentByte!10170 thiss!1870)) ((_ sign_extend 32) (currentBit!10165 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!18616 () Bool)

(assert (= bs!18616 d!76328))

(assert (=> bs!18616 m!345777))

(assert (=> b!224839 d!76328))

(declare-fun d!76330 () Bool)

(declare-fun e!153405 () Bool)

(assert (=> d!76330 e!153405))

(declare-fun res!188803 () Bool)

(assert (=> d!76330 (=> (not res!188803) (not e!153405))))

(declare-fun lt!358193 () (_ BitVec 64))

(declare-fun lt!358194 () (_ BitVec 64))

(declare-fun lt!358196 () (_ BitVec 64))

(assert (=> d!76330 (= res!188803 (= lt!358196 (bvsub lt!358193 lt!358194)))))

(assert (=> d!76330 (or (= (bvand lt!358193 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!358194 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!358193 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!358193 lt!358194) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!76330 (= lt!358194 (remainingBits!0 ((_ sign_extend 32) (size!4880 (buf!5424 (_2!10420 lt!357729)))) ((_ sign_extend 32) (currentByte!10170 (_2!10420 lt!357729))) ((_ sign_extend 32) (currentBit!10165 (_2!10420 lt!357729)))))))

(declare-fun lt!358195 () (_ BitVec 64))

(declare-fun lt!358198 () (_ BitVec 64))

(assert (=> d!76330 (= lt!358193 (bvmul lt!358195 lt!358198))))

(assert (=> d!76330 (or (= lt!358195 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!358198 (bvsdiv (bvmul lt!358195 lt!358198) lt!358195)))))

(assert (=> d!76330 (= lt!358198 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76330 (= lt!358195 ((_ sign_extend 32) (size!4880 (buf!5424 (_2!10420 lt!357729)))))))

(assert (=> d!76330 (= lt!358196 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10170 (_2!10420 lt!357729))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10165 (_2!10420 lt!357729)))))))

(assert (=> d!76330 (invariant!0 (currentBit!10165 (_2!10420 lt!357729)) (currentByte!10170 (_2!10420 lt!357729)) (size!4880 (buf!5424 (_2!10420 lt!357729))))))

(assert (=> d!76330 (= (bitIndex!0 (size!4880 (buf!5424 (_2!10420 lt!357729))) (currentByte!10170 (_2!10420 lt!357729)) (currentBit!10165 (_2!10420 lt!357729))) lt!358196)))

(declare-fun b!224956 () Bool)

(declare-fun res!188802 () Bool)

(assert (=> b!224956 (=> (not res!188802) (not e!153405))))

(assert (=> b!224956 (= res!188802 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!358196))))

(declare-fun b!224957 () Bool)

(declare-fun lt!358197 () (_ BitVec 64))

(assert (=> b!224957 (= e!153405 (bvsle lt!358196 (bvmul lt!358197 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!224957 (or (= lt!358197 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!358197 #b0000000000000000000000000000000000000000000000000000000000001000) lt!358197)))))

(assert (=> b!224957 (= lt!358197 ((_ sign_extend 32) (size!4880 (buf!5424 (_2!10420 lt!357729)))))))

(assert (= (and d!76330 res!188803) b!224956))

(assert (= (and b!224956 res!188802) b!224957))

(assert (=> d!76330 m!345785))

(declare-fun m!345787 () Bool)

(assert (=> d!76330 m!345787))

(assert (=> b!224839 d!76330))

(declare-fun d!76332 () Bool)

(assert (=> d!76332 (and (bvsge i!761 #b00000000000000000000000000000000) (bvslt i!761 (size!4880 lt!357720)) (bvslt i!761 (size!4880 (_3!785 lt!357723))) (= (select (arr!5834 lt!357720) i!761) (select (arr!5834 (_3!785 lt!357723)) i!761)))))

(declare-fun lt!358245 () Unit!16484)

(declare-fun choose!301 (array!11120 array!11120 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16484)

(assert (=> d!76332 (= lt!358245 (choose!301 lt!357720 (_3!785 lt!357723) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!76332 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!76332 (= (arrayRangesEqImpliesEq!98 lt!357720 (_3!785 lt!357723) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)) lt!358245)))

(declare-fun bs!18617 () Bool)

(assert (= bs!18617 d!76332))

(declare-fun m!345835 () Bool)

(assert (=> bs!18617 m!345835))

(assert (=> bs!18617 m!345593))

(declare-fun m!345837 () Bool)

(assert (=> bs!18617 m!345837))

(assert (=> b!224839 d!76332))

(declare-fun d!76338 () Bool)

(declare-fun e!153417 () Bool)

(assert (=> d!76338 e!153417))

(declare-fun res!188817 () Bool)

(assert (=> d!76338 (=> (not res!188817) (not e!153417))))

(assert (=> d!76338 (= res!188817 (and (bvsge i!761 #b00000000000000000000000000000000) (bvslt i!761 (size!4880 arr!308))))))

(declare-fun lt!358248 () Unit!16484)

(declare-fun choose!302 (array!11120 (_ BitVec 32) (_ BitVec 8)) Unit!16484)

(assert (=> d!76338 (= lt!358248 (choose!302 arr!308 i!761 (_1!10420 lt!357729)))))

(assert (=> d!76338 (and (bvsle #b00000000000000000000000000000000 i!761) (bvslt i!761 (size!4880 arr!308)))))

(assert (=> d!76338 (= (arrayUpdatedAtPrefixLemma!368 arr!308 i!761 (_1!10420 lt!357729)) lt!358248)))

(declare-fun b!224973 () Bool)

(assert (=> b!224973 (= e!153417 (arrayRangesEq!776 arr!308 (array!11121 (store (arr!5834 arr!308) i!761 (_1!10420 lt!357729)) (size!4880 arr!308)) #b00000000000000000000000000000000 i!761))))

(assert (= (and d!76338 res!188817) b!224973))

(declare-fun m!345839 () Bool)

(assert (=> d!76338 m!345839))

(assert (=> b!224973 m!345591))

(declare-fun m!345841 () Bool)

(assert (=> b!224973 m!345841))

(assert (=> b!224839 d!76338))

(declare-fun d!76340 () Bool)

(declare-fun res!188818 () Bool)

(declare-fun e!153418 () Bool)

(assert (=> d!76340 (=> res!188818 e!153418)))

(assert (=> d!76340 (= res!188818 (= #b00000000000000000000000000000000 i!761))))

(assert (=> d!76340 (= (arrayRangesEq!776 arr!308 lt!357720 #b00000000000000000000000000000000 i!761) e!153418)))

(declare-fun b!224974 () Bool)

(declare-fun e!153419 () Bool)

(assert (=> b!224974 (= e!153418 e!153419)))

(declare-fun res!188819 () Bool)

(assert (=> b!224974 (=> (not res!188819) (not e!153419))))

(assert (=> b!224974 (= res!188819 (= (select (arr!5834 arr!308) #b00000000000000000000000000000000) (select (arr!5834 lt!357720) #b00000000000000000000000000000000)))))

(declare-fun b!224975 () Bool)

(assert (=> b!224975 (= e!153419 (arrayRangesEq!776 arr!308 lt!357720 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) i!761))))

(assert (= (and d!76340 (not res!188818)) b!224974))

(assert (= (and b!224974 res!188819) b!224975))

(assert (=> b!224974 m!345771))

(declare-fun m!345843 () Bool)

(assert (=> b!224974 m!345843))

(declare-fun m!345845 () Bool)

(assert (=> b!224975 m!345845))

(assert (=> b!224839 d!76340))

(declare-fun d!76342 () Bool)

(assert (=> d!76342 (= (array_inv!4621 arr!308) (bvsge (size!4880 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!46942 d!76342))

(declare-fun d!76344 () Bool)

(assert (=> d!76344 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10165 thiss!1870) (currentByte!10170 thiss!1870) (size!4880 (buf!5424 thiss!1870))))))

(declare-fun bs!18619 () Bool)

(assert (= bs!18619 d!76344))

(assert (=> bs!18619 m!345779))

(assert (=> start!46942 d!76344))

(declare-fun d!76346 () Bool)

(assert (=> d!76346 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4880 (buf!5424 thiss!1870))) ((_ sign_extend 32) (currentByte!10170 thiss!1870)) ((_ sign_extend 32) (currentBit!10165 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4880 (buf!5424 thiss!1870))) ((_ sign_extend 32) (currentByte!10170 thiss!1870)) ((_ sign_extend 32) (currentBit!10165 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18620 () Bool)

(assert (= bs!18620 d!76346))

(assert (=> bs!18620 m!345777))

(assert (=> b!224837 d!76346))

(check-sat (not d!76338) (not d!76330) (not b!224927) (not b!224975) (not b!224973) (not bm!3645) (not d!76317) (not b!224914) (not b!224915) (not d!76313) (not b!224937) (not d!76328) (not d!76265) (not d!76315) (not b!224924) (not d!76344) (not d!76322) (not d!76324) (not bm!3643) (not d!76346) (not b!224916) (not d!76326) (not b!224918) (not bm!3644) (not d!76332))
(check-sat)
