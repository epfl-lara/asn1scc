; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33886 () Bool)

(assert start!33886)

(declare-fun b!161903 () Bool)

(declare-fun e!111627 () Bool)

(declare-fun lt!254981 () (_ BitVec 64))

(declare-fun lt!254985 () (_ BitVec 64))

(assert (=> b!161903 (= e!111627 (or (not (= lt!254981 #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!254981 (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!254985) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!161903 (= lt!254981 (bvand lt!254985 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((array!8024 0))(
  ( (array!8025 (arr!4520 (Array (_ BitVec 32) (_ BitVec 8))) (size!3599 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6366 0))(
  ( (BitStream!6367 (buf!4057 array!8024) (currentByte!7551 (_ BitVec 32)) (currentBit!7546 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6366)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!161903 (= lt!254985 (bitIndex!0 (size!3599 (buf!4057 thiss!1602)) (currentByte!7551 thiss!1602) (currentBit!7546 thiss!1602)))))

(declare-fun b!161904 () Bool)

(declare-datatypes ((Unit!11168 0))(
  ( (Unit!11169) )
))
(declare-fun e!111621 () Unit!11168)

(declare-fun Unit!11170 () Unit!11168)

(assert (=> b!161904 (= e!111621 Unit!11170)))

(declare-fun call!2729 () Bool)

(assert (=> b!161904 call!2729))

(declare-fun b!161905 () Bool)

(declare-fun e!111625 () Bool)

(declare-fun lt!254988 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161905 (= e!111625 (byteRangesEq!0 (select (arr!4520 (buf!4057 thiss!1602)) (currentByte!7551 thiss!1602)) lt!254988 #b00000000000000000000000000000000 (currentBit!7546 thiss!1602)))))

(declare-fun b!161906 () Bool)

(declare-fun e!111620 () Bool)

(assert (=> b!161906 (= e!111620 e!111627)))

(declare-fun res!134964 () Bool)

(assert (=> b!161906 (=> res!134964 e!111627)))

(declare-datatypes ((tuple3!926 0))(
  ( (tuple3!927 (_1!7814 Unit!11168) (_2!7814 (_ BitVec 8)) (_3!580 BitStream!6366)) )
))
(declare-fun lt!254994 () tuple3!926)

(assert (=> b!161906 (= res!134964 (not (= (size!3599 (buf!4057 thiss!1602)) (size!3599 (buf!4057 (_3!580 lt!254994))))))))

(declare-fun lt!254991 () Unit!11168)

(assert (=> b!161906 (= lt!254991 e!111621)))

(declare-fun c!8468 () Bool)

(declare-fun lt!254989 () Bool)

(assert (=> b!161906 (= c!8468 lt!254989)))

(declare-fun res!134962 () Bool)

(declare-fun e!111626 () Bool)

(assert (=> start!33886 (=> (not res!134962) (not e!111626))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33886 (= res!134962 (validate_offset_byte!0 ((_ sign_extend 32) (size!3599 (buf!4057 thiss!1602))) ((_ sign_extend 32) (currentByte!7551 thiss!1602)) ((_ sign_extend 32) (currentBit!7546 thiss!1602))))))

(assert (=> start!33886 e!111626))

(declare-fun e!111624 () Bool)

(declare-fun inv!12 (BitStream!6366) Bool)

(assert (=> start!33886 (and (inv!12 thiss!1602) e!111624)))

(assert (=> start!33886 true))

(declare-fun b!161907 () Bool)

(assert (=> b!161907 (= e!111626 (not e!111620))))

(declare-fun res!134965 () Bool)

(assert (=> b!161907 (=> res!134965 e!111620)))

(declare-fun lt!254986 () array!8024)

(declare-fun arrayRangesEq!551 (array!8024 array!8024 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161907 (= res!134965 (not (arrayRangesEq!551 (buf!4057 thiss!1602) lt!254986 #b00000000000000000000000000000000 (bvsub (currentByte!7551 (_3!580 lt!254994)) #b00000000000000000000000000000001))))))

(declare-fun lt!254987 () (_ BitVec 8))

(assert (=> b!161907 (arrayRangesEq!551 (buf!4057 thiss!1602) (array!8025 (store (arr!4520 (buf!4057 thiss!1602)) (bvsub (currentByte!7551 (_3!580 lt!254994)) #b00000000000000000000000000000001) lt!254987) (size!3599 (buf!4057 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7551 (_3!580 lt!254994)) #b00000000000000000000000000000001))))

(declare-fun lt!254997 () Unit!11168)

(declare-fun arrayUpdatedAtPrefixLemma!159 (array!8024 (_ BitVec 32) (_ BitVec 8)) Unit!11168)

(assert (=> b!161907 (= lt!254997 (arrayUpdatedAtPrefixLemma!159 (buf!4057 thiss!1602) (bvsub (currentByte!7551 (_3!580 lt!254994)) #b00000000000000000000000000000001) lt!254987))))

(assert (=> b!161907 (= lt!254987 (select (arr!4520 (buf!4057 (_3!580 lt!254994))) (bvsub (currentByte!7551 (_3!580 lt!254994)) #b00000000000000000000000000000001)))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!254996 () (_ BitVec 32))

(declare-fun lt!254990 () (_ BitVec 32))

(declare-fun lt!254983 () (_ BitVec 8))

(declare-fun lt!254992 () (_ BitVec 8))

(declare-fun Unit!11171 () Unit!11168)

(declare-fun Unit!11172 () Unit!11168)

(assert (=> b!161907 (= lt!254994 (ite lt!254989 (let ((bdg!9748 ((_ extract 7 0) (bvnot lt!254990)))) (let ((bdg!9749 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4520 (buf!4057 thiss!1602)) (currentByte!7551 thiss!1602) lt!254983) (currentByte!7551 thiss!1602) lt!254988) (bvadd #b00000000000000000000000000000001 (currentByte!7551 thiss!1602)))) ((_ sign_extend 24) bdg!9748))))) (tuple3!927 Unit!11171 bdg!9748 (BitStream!6367 (array!8025 (store (arr!4520 (array!8025 (store (arr!4520 lt!254986) (bvadd #b00000000000000000000000000000001 (currentByte!7551 thiss!1602)) bdg!9749) (size!3599 lt!254986))) (bvadd #b00000000000000000000000000000001 (currentByte!7551 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9749) (bvshl ((_ sign_extend 24) v!222) lt!254996)))) (size!3599 (array!8025 (store (arr!4520 lt!254986) (bvadd #b00000000000000000000000000000001 (currentByte!7551 thiss!1602)) bdg!9749) (size!3599 lt!254986)))) (bvadd #b00000000000000000000000000000001 (currentByte!7551 thiss!1602)) (currentBit!7546 thiss!1602))))) (tuple3!927 Unit!11172 lt!254992 (BitStream!6367 lt!254986 (bvadd #b00000000000000000000000000000001 (currentByte!7551 thiss!1602)) (currentBit!7546 thiss!1602)))))))

(declare-fun lt!254993 () (_ BitVec 32))

(assert (=> b!161907 (= lt!254989 (bvsgt lt!254993 #b00000000000000000000000000000000))))

(assert (=> b!161907 e!111625))

(declare-fun res!134966 () Bool)

(assert (=> b!161907 (=> res!134966 e!111625)))

(assert (=> b!161907 (= res!134966 (bvsge (currentByte!7551 thiss!1602) (size!3599 (buf!4057 thiss!1602))))))

(assert (=> b!161907 (= lt!254986 (array!8025 (store (store (arr!4520 (buf!4057 thiss!1602)) (currentByte!7551 thiss!1602) lt!254983) (currentByte!7551 thiss!1602) lt!254988) (size!3599 (buf!4057 thiss!1602))))))

(assert (=> b!161907 (= lt!254988 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!254983) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!254993))))))

(assert (=> b!161907 (= lt!254983 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4520 (buf!4057 thiss!1602)) (currentByte!7551 thiss!1602))) lt!254990)))))

(assert (=> b!161907 (= lt!254990 ((_ sign_extend 24) lt!254992))))

(assert (=> b!161907 (= lt!254992 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!254996)))))))

(assert (=> b!161907 (= lt!254996 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!254993))))))

(assert (=> b!161907 (= lt!254993 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7546 thiss!1602))))))

(declare-fun b!161908 () Bool)

(declare-fun e!111623 () Bool)

(assert (=> b!161908 (= e!111623 (arrayRangesEq!551 (buf!4057 thiss!1602) (buf!4057 (_3!580 lt!254994)) #b00000000000000000000000000000000 (currentByte!7551 thiss!1602)))))

(declare-fun b!161909 () Bool)

(declare-fun Unit!11173 () Unit!11168)

(assert (=> b!161909 (= e!111621 Unit!11173)))

(declare-fun lt!254984 () Unit!11168)

(assert (=> b!161909 (= lt!254984 (arrayUpdatedAtPrefixLemma!159 (buf!4057 thiss!1602) (currentByte!7551 (_3!580 lt!254994)) (select (arr!4520 (buf!4057 (_3!580 lt!254994))) (currentByte!7551 (_3!580 lt!254994)))))))

(assert (=> b!161909 (arrayRangesEq!551 (buf!4057 thiss!1602) (array!8025 (store (arr!4520 (buf!4057 thiss!1602)) (currentByte!7551 (_3!580 lt!254994)) (select (arr!4520 (buf!4057 (_3!580 lt!254994))) (currentByte!7551 (_3!580 lt!254994)))) (size!3599 (buf!4057 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7551 (_3!580 lt!254994)))))

(declare-fun lt!254995 () Unit!11168)

(assert (=> b!161909 (= lt!254995 (arrayUpdatedAtPrefixLemma!159 lt!254986 (currentByte!7551 (_3!580 lt!254994)) (select (arr!4520 (buf!4057 (_3!580 lt!254994))) (currentByte!7551 (_3!580 lt!254994)))))))

(assert (=> b!161909 call!2729))

(declare-fun lt!254982 () Unit!11168)

(declare-fun arrayRangesEqTransitive!146 (array!8024 array!8024 array!8024 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11168)

(assert (=> b!161909 (= lt!254982 (arrayRangesEqTransitive!146 (buf!4057 thiss!1602) lt!254986 (buf!4057 (_3!580 lt!254994)) #b00000000000000000000000000000000 (bvsub (currentByte!7551 (_3!580 lt!254994)) #b00000000000000000000000000000001) (currentByte!7551 (_3!580 lt!254994))))))

(declare-fun res!134963 () Bool)

(assert (=> b!161909 (= res!134963 (arrayRangesEq!551 (buf!4057 thiss!1602) (buf!4057 (_3!580 lt!254994)) #b00000000000000000000000000000000 (bvsub (currentByte!7551 (_3!580 lt!254994)) #b00000000000000000000000000000001)))))

(assert (=> b!161909 (=> (not res!134963) (not e!111623))))

(assert (=> b!161909 e!111623))

(declare-fun bm!2726 () Bool)

(assert (=> bm!2726 (= call!2729 (arrayRangesEq!551 (ite c!8468 lt!254986 (buf!4057 thiss!1602)) (ite c!8468 (array!8025 (store (store (store (arr!4520 (buf!4057 thiss!1602)) (currentByte!7551 thiss!1602) lt!254983) (currentByte!7551 thiss!1602) lt!254988) (currentByte!7551 (_3!580 lt!254994)) (select (arr!4520 (buf!4057 (_3!580 lt!254994))) (currentByte!7551 (_3!580 lt!254994)))) (size!3599 (buf!4057 thiss!1602))) (buf!4057 (_3!580 lt!254994))) #b00000000000000000000000000000000 (ite c!8468 (currentByte!7551 (_3!580 lt!254994)) (currentByte!7551 thiss!1602))))))

(declare-fun b!161910 () Bool)

(declare-fun array_inv!3346 (array!8024) Bool)

(assert (=> b!161910 (= e!111624 (array_inv!3346 (buf!4057 thiss!1602)))))

(assert (= (and start!33886 res!134962) b!161907))

(assert (= (and b!161907 (not res!134966)) b!161905))

(assert (= (and b!161907 (not res!134965)) b!161906))

(assert (= (and b!161906 c!8468) b!161909))

(assert (= (and b!161906 (not c!8468)) b!161904))

(assert (= (and b!161909 res!134963) b!161908))

(assert (= (or b!161909 b!161904) bm!2726))

(assert (= (and b!161906 (not res!134964)) b!161903))

(assert (= start!33886 b!161910))

(declare-fun m!256899 () Bool)

(assert (=> b!161903 m!256899))

(declare-fun m!256901 () Bool)

(assert (=> b!161910 m!256901))

(declare-fun m!256903 () Bool)

(assert (=> start!33886 m!256903))

(declare-fun m!256905 () Bool)

(assert (=> start!33886 m!256905))

(declare-fun m!256907 () Bool)

(assert (=> b!161907 m!256907))

(declare-fun m!256909 () Bool)

(assert (=> b!161907 m!256909))

(declare-fun m!256911 () Bool)

(assert (=> b!161907 m!256911))

(declare-fun m!256913 () Bool)

(assert (=> b!161907 m!256913))

(declare-fun m!256915 () Bool)

(assert (=> b!161907 m!256915))

(declare-fun m!256917 () Bool)

(assert (=> b!161907 m!256917))

(declare-fun m!256919 () Bool)

(assert (=> b!161907 m!256919))

(declare-fun m!256921 () Bool)

(assert (=> b!161907 m!256921))

(declare-fun m!256923 () Bool)

(assert (=> b!161907 m!256923))

(declare-fun m!256925 () Bool)

(assert (=> b!161907 m!256925))

(declare-fun m!256927 () Bool)

(assert (=> b!161907 m!256927))

(declare-fun m!256929 () Bool)

(assert (=> b!161907 m!256929))

(declare-fun m!256931 () Bool)

(assert (=> b!161909 m!256931))

(declare-fun m!256933 () Bool)

(assert (=> b!161909 m!256933))

(declare-fun m!256935 () Bool)

(assert (=> b!161909 m!256935))

(assert (=> b!161909 m!256931))

(declare-fun m!256937 () Bool)

(assert (=> b!161909 m!256937))

(assert (=> b!161909 m!256931))

(declare-fun m!256939 () Bool)

(assert (=> b!161909 m!256939))

(declare-fun m!256941 () Bool)

(assert (=> b!161909 m!256941))

(declare-fun m!256943 () Bool)

(assert (=> b!161909 m!256943))

(declare-fun m!256945 () Bool)

(assert (=> b!161908 m!256945))

(declare-fun m!256947 () Bool)

(assert (=> bm!2726 m!256947))

(assert (=> bm!2726 m!256931))

(assert (=> bm!2726 m!256911))

(assert (=> bm!2726 m!256929))

(declare-fun m!256949 () Bool)

(assert (=> bm!2726 m!256949))

(assert (=> b!161905 m!256925))

(assert (=> b!161905 m!256925))

(declare-fun m!256951 () Bool)

(assert (=> b!161905 m!256951))

(check-sat (not start!33886) (not b!161909) (not b!161903) (not bm!2726) (not b!161908) (not b!161910) (not b!161907) (not b!161905))
(check-sat)
(get-model)

(declare-fun d!55387 () Bool)

(declare-fun res!134986 () Bool)

(declare-fun e!111656 () Bool)

(assert (=> d!55387 (=> res!134986 e!111656)))

(assert (=> d!55387 (= res!134986 (= #b00000000000000000000000000000000 (bvsub (currentByte!7551 (_3!580 lt!254994)) #b00000000000000000000000000000001)))))

(assert (=> d!55387 (= (arrayRangesEq!551 (buf!4057 thiss!1602) (buf!4057 (_3!580 lt!254994)) #b00000000000000000000000000000000 (bvsub (currentByte!7551 (_3!580 lt!254994)) #b00000000000000000000000000000001)) e!111656)))

(declare-fun b!161939 () Bool)

(declare-fun e!111657 () Bool)

(assert (=> b!161939 (= e!111656 e!111657)))

(declare-fun res!134987 () Bool)

(assert (=> b!161939 (=> (not res!134987) (not e!111657))))

(assert (=> b!161939 (= res!134987 (= (select (arr!4520 (buf!4057 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4520 (buf!4057 (_3!580 lt!254994))) #b00000000000000000000000000000000)))))

(declare-fun b!161940 () Bool)

(assert (=> b!161940 (= e!111657 (arrayRangesEq!551 (buf!4057 thiss!1602) (buf!4057 (_3!580 lt!254994)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7551 (_3!580 lt!254994)) #b00000000000000000000000000000001)))))

(assert (= (and d!55387 (not res!134986)) b!161939))

(assert (= (and b!161939 res!134987) b!161940))

(declare-fun m!257007 () Bool)

(assert (=> b!161939 m!257007))

(declare-fun m!257009 () Bool)

(assert (=> b!161939 m!257009))

(declare-fun m!257011 () Bool)

(assert (=> b!161940 m!257011))

(assert (=> b!161909 d!55387))

(declare-fun d!55389 () Bool)

(declare-fun res!134988 () Bool)

(declare-fun e!111658 () Bool)

(assert (=> d!55389 (=> res!134988 e!111658)))

(assert (=> d!55389 (= res!134988 (= #b00000000000000000000000000000000 (currentByte!7551 (_3!580 lt!254994))))))

(assert (=> d!55389 (= (arrayRangesEq!551 (buf!4057 thiss!1602) (array!8025 (store (arr!4520 (buf!4057 thiss!1602)) (currentByte!7551 (_3!580 lt!254994)) (select (arr!4520 (buf!4057 (_3!580 lt!254994))) (currentByte!7551 (_3!580 lt!254994)))) (size!3599 (buf!4057 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7551 (_3!580 lt!254994))) e!111658)))

(declare-fun b!161941 () Bool)

(declare-fun e!111659 () Bool)

(assert (=> b!161941 (= e!111658 e!111659)))

(declare-fun res!134989 () Bool)

(assert (=> b!161941 (=> (not res!134989) (not e!111659))))

(assert (=> b!161941 (= res!134989 (= (select (arr!4520 (buf!4057 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4520 (array!8025 (store (arr!4520 (buf!4057 thiss!1602)) (currentByte!7551 (_3!580 lt!254994)) (select (arr!4520 (buf!4057 (_3!580 lt!254994))) (currentByte!7551 (_3!580 lt!254994)))) (size!3599 (buf!4057 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!161942 () Bool)

(assert (=> b!161942 (= e!111659 (arrayRangesEq!551 (buf!4057 thiss!1602) (array!8025 (store (arr!4520 (buf!4057 thiss!1602)) (currentByte!7551 (_3!580 lt!254994)) (select (arr!4520 (buf!4057 (_3!580 lt!254994))) (currentByte!7551 (_3!580 lt!254994)))) (size!3599 (buf!4057 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7551 (_3!580 lt!254994))))))

(assert (= (and d!55389 (not res!134988)) b!161941))

(assert (= (and b!161941 res!134989) b!161942))

(assert (=> b!161941 m!257007))

(declare-fun m!257013 () Bool)

(assert (=> b!161941 m!257013))

(declare-fun m!257015 () Bool)

(assert (=> b!161942 m!257015))

(assert (=> b!161909 d!55389))

(declare-fun d!55391 () Bool)

(declare-fun e!111662 () Bool)

(assert (=> d!55391 e!111662))

(declare-fun res!134992 () Bool)

(assert (=> d!55391 (=> (not res!134992) (not e!111662))))

(assert (=> d!55391 (= res!134992 (and (bvsge (currentByte!7551 (_3!580 lt!254994)) #b00000000000000000000000000000000) (bvslt (currentByte!7551 (_3!580 lt!254994)) (size!3599 (buf!4057 thiss!1602)))))))

(declare-fun lt!255051 () Unit!11168)

(declare-fun choose!170 (array!8024 (_ BitVec 32) (_ BitVec 8)) Unit!11168)

(assert (=> d!55391 (= lt!255051 (choose!170 (buf!4057 thiss!1602) (currentByte!7551 (_3!580 lt!254994)) (select (arr!4520 (buf!4057 (_3!580 lt!254994))) (currentByte!7551 (_3!580 lt!254994)))))))

(assert (=> d!55391 (and (bvsle #b00000000000000000000000000000000 (currentByte!7551 (_3!580 lt!254994))) (bvslt (currentByte!7551 (_3!580 lt!254994)) (size!3599 (buf!4057 thiss!1602))))))

(assert (=> d!55391 (= (arrayUpdatedAtPrefixLemma!159 (buf!4057 thiss!1602) (currentByte!7551 (_3!580 lt!254994)) (select (arr!4520 (buf!4057 (_3!580 lt!254994))) (currentByte!7551 (_3!580 lt!254994)))) lt!255051)))

(declare-fun b!161945 () Bool)

(assert (=> b!161945 (= e!111662 (arrayRangesEq!551 (buf!4057 thiss!1602) (array!8025 (store (arr!4520 (buf!4057 thiss!1602)) (currentByte!7551 (_3!580 lt!254994)) (select (arr!4520 (buf!4057 (_3!580 lt!254994))) (currentByte!7551 (_3!580 lt!254994)))) (size!3599 (buf!4057 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7551 (_3!580 lt!254994))))))

(assert (= (and d!55391 res!134992) b!161945))

(assert (=> d!55391 m!256931))

(declare-fun m!257017 () Bool)

(assert (=> d!55391 m!257017))

(assert (=> b!161945 m!256943))

(assert (=> b!161945 m!256935))

(assert (=> b!161909 d!55391))

(declare-fun d!55393 () Bool)

(declare-fun e!111663 () Bool)

(assert (=> d!55393 e!111663))

(declare-fun res!134993 () Bool)

(assert (=> d!55393 (=> (not res!134993) (not e!111663))))

(assert (=> d!55393 (= res!134993 (and (bvsge (currentByte!7551 (_3!580 lt!254994)) #b00000000000000000000000000000000) (bvslt (currentByte!7551 (_3!580 lt!254994)) (size!3599 lt!254986))))))

(declare-fun lt!255052 () Unit!11168)

(assert (=> d!55393 (= lt!255052 (choose!170 lt!254986 (currentByte!7551 (_3!580 lt!254994)) (select (arr!4520 (buf!4057 (_3!580 lt!254994))) (currentByte!7551 (_3!580 lt!254994)))))))

(assert (=> d!55393 (and (bvsle #b00000000000000000000000000000000 (currentByte!7551 (_3!580 lt!254994))) (bvslt (currentByte!7551 (_3!580 lt!254994)) (size!3599 lt!254986)))))

(assert (=> d!55393 (= (arrayUpdatedAtPrefixLemma!159 lt!254986 (currentByte!7551 (_3!580 lt!254994)) (select (arr!4520 (buf!4057 (_3!580 lt!254994))) (currentByte!7551 (_3!580 lt!254994)))) lt!255052)))

(declare-fun b!161946 () Bool)

(assert (=> b!161946 (= e!111663 (arrayRangesEq!551 lt!254986 (array!8025 (store (arr!4520 lt!254986) (currentByte!7551 (_3!580 lt!254994)) (select (arr!4520 (buf!4057 (_3!580 lt!254994))) (currentByte!7551 (_3!580 lt!254994)))) (size!3599 lt!254986)) #b00000000000000000000000000000000 (currentByte!7551 (_3!580 lt!254994))))))

(assert (= (and d!55393 res!134993) b!161946))

(assert (=> d!55393 m!256931))

(declare-fun m!257019 () Bool)

(assert (=> d!55393 m!257019))

(declare-fun m!257021 () Bool)

(assert (=> b!161946 m!257021))

(declare-fun m!257023 () Bool)

(assert (=> b!161946 m!257023))

(assert (=> b!161909 d!55393))

(declare-fun d!55395 () Bool)

(assert (=> d!55395 (arrayRangesEq!551 (buf!4057 thiss!1602) (buf!4057 (_3!580 lt!254994)) #b00000000000000000000000000000000 (bvsub (currentByte!7551 (_3!580 lt!254994)) #b00000000000000000000000000000001))))

(declare-fun lt!255055 () Unit!11168)

(declare-fun choose!171 (array!8024 array!8024 array!8024 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11168)

(assert (=> d!55395 (= lt!255055 (choose!171 (buf!4057 thiss!1602) lt!254986 (buf!4057 (_3!580 lt!254994)) #b00000000000000000000000000000000 (bvsub (currentByte!7551 (_3!580 lt!254994)) #b00000000000000000000000000000001) (currentByte!7551 (_3!580 lt!254994))))))

(assert (=> d!55395 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7551 (_3!580 lt!254994)) #b00000000000000000000000000000001)) (bvsle (bvsub (currentByte!7551 (_3!580 lt!254994)) #b00000000000000000000000000000001) (currentByte!7551 (_3!580 lt!254994))))))

(assert (=> d!55395 (= (arrayRangesEqTransitive!146 (buf!4057 thiss!1602) lt!254986 (buf!4057 (_3!580 lt!254994)) #b00000000000000000000000000000000 (bvsub (currentByte!7551 (_3!580 lt!254994)) #b00000000000000000000000000000001) (currentByte!7551 (_3!580 lt!254994))) lt!255055)))

(declare-fun bs!13783 () Bool)

(assert (= bs!13783 d!55395))

(assert (=> bs!13783 m!256933))

(declare-fun m!257025 () Bool)

(assert (=> bs!13783 m!257025))

(assert (=> b!161909 d!55395))

(declare-fun d!55397 () Bool)

(declare-fun res!134994 () Bool)

(declare-fun e!111664 () Bool)

(assert (=> d!55397 (=> res!134994 e!111664)))

(assert (=> d!55397 (= res!134994 (= #b00000000000000000000000000000000 (ite c!8468 (currentByte!7551 (_3!580 lt!254994)) (currentByte!7551 thiss!1602))))))

(assert (=> d!55397 (= (arrayRangesEq!551 (ite c!8468 lt!254986 (buf!4057 thiss!1602)) (ite c!8468 (array!8025 (store (store (store (arr!4520 (buf!4057 thiss!1602)) (currentByte!7551 thiss!1602) lt!254983) (currentByte!7551 thiss!1602) lt!254988) (currentByte!7551 (_3!580 lt!254994)) (select (arr!4520 (buf!4057 (_3!580 lt!254994))) (currentByte!7551 (_3!580 lt!254994)))) (size!3599 (buf!4057 thiss!1602))) (buf!4057 (_3!580 lt!254994))) #b00000000000000000000000000000000 (ite c!8468 (currentByte!7551 (_3!580 lt!254994)) (currentByte!7551 thiss!1602))) e!111664)))

(declare-fun b!161947 () Bool)

(declare-fun e!111665 () Bool)

(assert (=> b!161947 (= e!111664 e!111665)))

(declare-fun res!134995 () Bool)

(assert (=> b!161947 (=> (not res!134995) (not e!111665))))

(assert (=> b!161947 (= res!134995 (= (select (arr!4520 (ite c!8468 lt!254986 (buf!4057 thiss!1602))) #b00000000000000000000000000000000) (select (arr!4520 (ite c!8468 (array!8025 (store (store (store (arr!4520 (buf!4057 thiss!1602)) (currentByte!7551 thiss!1602) lt!254983) (currentByte!7551 thiss!1602) lt!254988) (currentByte!7551 (_3!580 lt!254994)) (select (arr!4520 (buf!4057 (_3!580 lt!254994))) (currentByte!7551 (_3!580 lt!254994)))) (size!3599 (buf!4057 thiss!1602))) (buf!4057 (_3!580 lt!254994)))) #b00000000000000000000000000000000)))))

(declare-fun b!161948 () Bool)

(assert (=> b!161948 (= e!111665 (arrayRangesEq!551 (ite c!8468 lt!254986 (buf!4057 thiss!1602)) (ite c!8468 (array!8025 (store (store (store (arr!4520 (buf!4057 thiss!1602)) (currentByte!7551 thiss!1602) lt!254983) (currentByte!7551 thiss!1602) lt!254988) (currentByte!7551 (_3!580 lt!254994)) (select (arr!4520 (buf!4057 (_3!580 lt!254994))) (currentByte!7551 (_3!580 lt!254994)))) (size!3599 (buf!4057 thiss!1602))) (buf!4057 (_3!580 lt!254994))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!8468 (currentByte!7551 (_3!580 lt!254994)) (currentByte!7551 thiss!1602))))))

(assert (= (and d!55397 (not res!134994)) b!161947))

(assert (= (and b!161947 res!134995) b!161948))

(declare-fun m!257027 () Bool)

(assert (=> b!161947 m!257027))

(declare-fun m!257029 () Bool)

(assert (=> b!161947 m!257029))

(declare-fun m!257031 () Bool)

(assert (=> b!161948 m!257031))

(assert (=> bm!2726 d!55397))

(declare-fun d!55399 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!55399 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3599 (buf!4057 thiss!1602))) ((_ sign_extend 32) (currentByte!7551 thiss!1602)) ((_ sign_extend 32) (currentBit!7546 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3599 (buf!4057 thiss!1602))) ((_ sign_extend 32) (currentByte!7551 thiss!1602)) ((_ sign_extend 32) (currentBit!7546 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13784 () Bool)

(assert (= bs!13784 d!55399))

(declare-fun m!257033 () Bool)

(assert (=> bs!13784 m!257033))

(assert (=> start!33886 d!55399))

(declare-fun d!55401 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!55401 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7546 thiss!1602) (currentByte!7551 thiss!1602) (size!3599 (buf!4057 thiss!1602))))))

(declare-fun bs!13785 () Bool)

(assert (= bs!13785 d!55401))

(declare-fun m!257035 () Bool)

(assert (=> bs!13785 m!257035))

(assert (=> start!33886 d!55401))

(declare-fun d!55403 () Bool)

(assert (=> d!55403 (= (byteRangesEq!0 (select (arr!4520 (buf!4057 thiss!1602)) (currentByte!7551 thiss!1602)) lt!254988 #b00000000000000000000000000000000 (currentBit!7546 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7546 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4520 (buf!4057 thiss!1602)) (currentByte!7551 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7546 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!254988) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7546 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13786 () Bool)

(assert (= bs!13786 d!55403))

(declare-fun m!257037 () Bool)

(assert (=> bs!13786 m!257037))

(declare-fun m!257039 () Bool)

(assert (=> bs!13786 m!257039))

(assert (=> b!161905 d!55403))

(declare-fun d!55405 () Bool)

(assert (=> d!55405 (= (array_inv!3346 (buf!4057 thiss!1602)) (bvsge (size!3599 (buf!4057 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!161910 d!55405))

(declare-fun d!55407 () Bool)

(declare-fun res!134996 () Bool)

(declare-fun e!111666 () Bool)

(assert (=> d!55407 (=> res!134996 e!111666)))

(assert (=> d!55407 (= res!134996 (= #b00000000000000000000000000000000 (bvsub (currentByte!7551 (_3!580 lt!254994)) #b00000000000000000000000000000001)))))

(assert (=> d!55407 (= (arrayRangesEq!551 (buf!4057 thiss!1602) lt!254986 #b00000000000000000000000000000000 (bvsub (currentByte!7551 (_3!580 lt!254994)) #b00000000000000000000000000000001)) e!111666)))

(declare-fun b!161949 () Bool)

(declare-fun e!111667 () Bool)

(assert (=> b!161949 (= e!111666 e!111667)))

(declare-fun res!134997 () Bool)

(assert (=> b!161949 (=> (not res!134997) (not e!111667))))

(assert (=> b!161949 (= res!134997 (= (select (arr!4520 (buf!4057 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4520 lt!254986) #b00000000000000000000000000000000)))))

(declare-fun b!161950 () Bool)

(assert (=> b!161950 (= e!111667 (arrayRangesEq!551 (buf!4057 thiss!1602) lt!254986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7551 (_3!580 lt!254994)) #b00000000000000000000000000000001)))))

(assert (= (and d!55407 (not res!134996)) b!161949))

(assert (= (and b!161949 res!134997) b!161950))

(assert (=> b!161949 m!257007))

(declare-fun m!257041 () Bool)

(assert (=> b!161949 m!257041))

(declare-fun m!257043 () Bool)

(assert (=> b!161950 m!257043))

(assert (=> b!161907 d!55407))

(declare-fun d!55409 () Bool)

(declare-fun res!134998 () Bool)

(declare-fun e!111668 () Bool)

(assert (=> d!55409 (=> res!134998 e!111668)))

(assert (=> d!55409 (= res!134998 (= #b00000000000000000000000000000000 (bvsub (currentByte!7551 (_3!580 lt!254994)) #b00000000000000000000000000000001)))))

(assert (=> d!55409 (= (arrayRangesEq!551 (buf!4057 thiss!1602) (array!8025 (store (arr!4520 (buf!4057 thiss!1602)) (bvsub (currentByte!7551 (_3!580 lt!254994)) #b00000000000000000000000000000001) lt!254987) (size!3599 (buf!4057 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7551 (_3!580 lt!254994)) #b00000000000000000000000000000001)) e!111668)))

(declare-fun b!161951 () Bool)

(declare-fun e!111669 () Bool)

(assert (=> b!161951 (= e!111668 e!111669)))

(declare-fun res!134999 () Bool)

(assert (=> b!161951 (=> (not res!134999) (not e!111669))))

(assert (=> b!161951 (= res!134999 (= (select (arr!4520 (buf!4057 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4520 (array!8025 (store (arr!4520 (buf!4057 thiss!1602)) (bvsub (currentByte!7551 (_3!580 lt!254994)) #b00000000000000000000000000000001) lt!254987) (size!3599 (buf!4057 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!161952 () Bool)

(assert (=> b!161952 (= e!111669 (arrayRangesEq!551 (buf!4057 thiss!1602) (array!8025 (store (arr!4520 (buf!4057 thiss!1602)) (bvsub (currentByte!7551 (_3!580 lt!254994)) #b00000000000000000000000000000001) lt!254987) (size!3599 (buf!4057 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7551 (_3!580 lt!254994)) #b00000000000000000000000000000001)))))

(assert (= (and d!55409 (not res!134998)) b!161951))

(assert (= (and b!161951 res!134999) b!161952))

(assert (=> b!161951 m!257007))

(declare-fun m!257045 () Bool)

(assert (=> b!161951 m!257045))

(declare-fun m!257047 () Bool)

(assert (=> b!161952 m!257047))

(assert (=> b!161907 d!55409))

(declare-fun d!55411 () Bool)

(declare-fun e!111670 () Bool)

(assert (=> d!55411 e!111670))

(declare-fun res!135000 () Bool)

(assert (=> d!55411 (=> (not res!135000) (not e!111670))))

(assert (=> d!55411 (= res!135000 (and (bvsge (bvsub (currentByte!7551 (_3!580 lt!254994)) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub (currentByte!7551 (_3!580 lt!254994)) #b00000000000000000000000000000001) (size!3599 (buf!4057 thiss!1602)))))))

(declare-fun lt!255056 () Unit!11168)

(assert (=> d!55411 (= lt!255056 (choose!170 (buf!4057 thiss!1602) (bvsub (currentByte!7551 (_3!580 lt!254994)) #b00000000000000000000000000000001) lt!254987))))

(assert (=> d!55411 (and (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7551 (_3!580 lt!254994)) #b00000000000000000000000000000001)) (bvslt (bvsub (currentByte!7551 (_3!580 lt!254994)) #b00000000000000000000000000000001) (size!3599 (buf!4057 thiss!1602))))))

(assert (=> d!55411 (= (arrayUpdatedAtPrefixLemma!159 (buf!4057 thiss!1602) (bvsub (currentByte!7551 (_3!580 lt!254994)) #b00000000000000000000000000000001) lt!254987) lt!255056)))

(declare-fun b!161953 () Bool)

(assert (=> b!161953 (= e!111670 (arrayRangesEq!551 (buf!4057 thiss!1602) (array!8025 (store (arr!4520 (buf!4057 thiss!1602)) (bvsub (currentByte!7551 (_3!580 lt!254994)) #b00000000000000000000000000000001) lt!254987) (size!3599 (buf!4057 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7551 (_3!580 lt!254994)) #b00000000000000000000000000000001)))))

(assert (= (and d!55411 res!135000) b!161953))

(declare-fun m!257049 () Bool)

(assert (=> d!55411 m!257049))

(assert (=> b!161953 m!256907))

(assert (=> b!161953 m!256919))

(assert (=> b!161907 d!55411))

(declare-fun d!55413 () Bool)

(declare-fun res!135001 () Bool)

(declare-fun e!111671 () Bool)

(assert (=> d!55413 (=> res!135001 e!111671)))

(assert (=> d!55413 (= res!135001 (= #b00000000000000000000000000000000 (currentByte!7551 thiss!1602)))))

(assert (=> d!55413 (= (arrayRangesEq!551 (buf!4057 thiss!1602) (buf!4057 (_3!580 lt!254994)) #b00000000000000000000000000000000 (currentByte!7551 thiss!1602)) e!111671)))

(declare-fun b!161954 () Bool)

(declare-fun e!111672 () Bool)

(assert (=> b!161954 (= e!111671 e!111672)))

(declare-fun res!135002 () Bool)

(assert (=> b!161954 (=> (not res!135002) (not e!111672))))

(assert (=> b!161954 (= res!135002 (= (select (arr!4520 (buf!4057 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4520 (buf!4057 (_3!580 lt!254994))) #b00000000000000000000000000000000)))))

(declare-fun b!161955 () Bool)

(assert (=> b!161955 (= e!111672 (arrayRangesEq!551 (buf!4057 thiss!1602) (buf!4057 (_3!580 lt!254994)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7551 thiss!1602)))))

(assert (= (and d!55413 (not res!135001)) b!161954))

(assert (= (and b!161954 res!135002) b!161955))

(assert (=> b!161954 m!257007))

(assert (=> b!161954 m!257009))

(declare-fun m!257051 () Bool)

(assert (=> b!161955 m!257051))

(assert (=> b!161908 d!55413))

(declare-fun d!55415 () Bool)

(declare-fun e!111675 () Bool)

(assert (=> d!55415 e!111675))

(declare-fun res!135008 () Bool)

(assert (=> d!55415 (=> (not res!135008) (not e!111675))))

(declare-fun lt!255071 () (_ BitVec 64))

(declare-fun lt!255069 () (_ BitVec 64))

(declare-fun lt!255072 () (_ BitVec 64))

(assert (=> d!55415 (= res!135008 (= lt!255072 (bvsub lt!255069 lt!255071)))))

(assert (=> d!55415 (or (= (bvand lt!255069 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!255071 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!255069 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!255069 lt!255071) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!55415 (= lt!255071 (remainingBits!0 ((_ sign_extend 32) (size!3599 (buf!4057 thiss!1602))) ((_ sign_extend 32) (currentByte!7551 thiss!1602)) ((_ sign_extend 32) (currentBit!7546 thiss!1602))))))

(declare-fun lt!255073 () (_ BitVec 64))

(declare-fun lt!255070 () (_ BitVec 64))

(assert (=> d!55415 (= lt!255069 (bvmul lt!255073 lt!255070))))

(assert (=> d!55415 (or (= lt!255073 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!255070 (bvsdiv (bvmul lt!255073 lt!255070) lt!255073)))))

(assert (=> d!55415 (= lt!255070 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!55415 (= lt!255073 ((_ sign_extend 32) (size!3599 (buf!4057 thiss!1602))))))

(assert (=> d!55415 (= lt!255072 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7551 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7546 thiss!1602))))))

(assert (=> d!55415 (invariant!0 (currentBit!7546 thiss!1602) (currentByte!7551 thiss!1602) (size!3599 (buf!4057 thiss!1602)))))

(assert (=> d!55415 (= (bitIndex!0 (size!3599 (buf!4057 thiss!1602)) (currentByte!7551 thiss!1602) (currentBit!7546 thiss!1602)) lt!255072)))

(declare-fun b!161960 () Bool)

(declare-fun res!135007 () Bool)

(assert (=> b!161960 (=> (not res!135007) (not e!111675))))

(assert (=> b!161960 (= res!135007 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!255072))))

(declare-fun b!161961 () Bool)

(declare-fun lt!255074 () (_ BitVec 64))

(assert (=> b!161961 (= e!111675 (bvsle lt!255072 (bvmul lt!255074 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!161961 (or (= lt!255074 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!255074 #b0000000000000000000000000000000000000000000000000000000000001000) lt!255074)))))

(assert (=> b!161961 (= lt!255074 ((_ sign_extend 32) (size!3599 (buf!4057 thiss!1602))))))

(assert (= (and d!55415 res!135008) b!161960))

(assert (= (and b!161960 res!135007) b!161961))

(assert (=> d!55415 m!257033))

(assert (=> d!55415 m!257035))

(assert (=> b!161903 d!55415))

(check-sat (not b!161950) (not d!55411) (not b!161952) (not b!161945) (not b!161953) (not b!161940) (not d!55391) (not b!161955) (not d!55395) (not d!55415) (not b!161946) (not d!55399) (not b!161942) (not d!55393) (not d!55401) (not b!161948))
