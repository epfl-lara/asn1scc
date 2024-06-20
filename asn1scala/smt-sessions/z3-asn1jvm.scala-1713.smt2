; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47344 () Bool)

(assert start!47344)

(declare-fun res!189565 () Bool)

(declare-fun e!154330 () Bool)

(assert (=> start!47344 (=> (not res!189565) (not e!154330))))

(declare-datatypes ((array!11272 0))(
  ( (array!11273 (arr!5903 (Array (_ BitVec 32) (_ BitVec 8))) (size!4946 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11272)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!47344 (= res!189565 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4946 arr!308))))))

(assert (=> start!47344 e!154330))

(assert (=> start!47344 true))

(declare-fun array_inv!4687 (array!11272) Bool)

(assert (=> start!47344 (array_inv!4687 arr!308)))

(declare-datatypes ((BitStream!8988 0))(
  ( (BitStream!8989 (buf!5487 array!11272) (currentByte!10283 (_ BitVec 32)) (currentBit!10278 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8988)

(declare-fun e!154333 () Bool)

(declare-fun inv!12 (BitStream!8988) Bool)

(assert (=> start!47344 (and (inv!12 thiss!1870) e!154333)))

(declare-fun b!225898 () Bool)

(declare-fun e!154331 () Bool)

(assert (=> b!225898 (= e!154330 e!154331)))

(declare-fun res!189562 () Bool)

(assert (=> b!225898 (=> (not res!189562) (not e!154331))))

(declare-datatypes ((tuple2!19336 0))(
  ( (tuple2!19337 (_1!10455 (_ BitVec 8)) (_2!10455 BitStream!8988)) )
))
(declare-fun lt!358956 () tuple2!19336)

(assert (=> b!225898 (= res!189562 (= (size!4946 (buf!5487 thiss!1870)) (size!4946 (buf!5487 (_2!10455 lt!358956)))))))

(declare-fun readByte!0 (BitStream!8988) tuple2!19336)

(assert (=> b!225898 (= lt!358956 (readByte!0 thiss!1870))))

(declare-fun b!225899 () Bool)

(declare-fun res!189563 () Bool)

(assert (=> b!225899 (=> (not res!189563) (not e!154330))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225899 (= res!189563 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4946 (buf!5487 thiss!1870))) ((_ sign_extend 32) (currentByte!10283 thiss!1870)) ((_ sign_extend 32) (currentBit!10278 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!225900 () Bool)

(assert (=> b!225900 (= e!154333 (array_inv!4687 (buf!5487 thiss!1870)))))

(declare-fun b!225901 () Bool)

(declare-fun res!189561 () Bool)

(assert (=> b!225901 (=> (not res!189561) (not e!154330))))

(assert (=> b!225901 (= res!189561 (bvslt i!761 to!496))))

(declare-fun b!225902 () Bool)

(declare-fun e!154328 () Bool)

(declare-fun lt!358955 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!225902 (= e!154328 (not (= lt!358955 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!4946 (buf!5487 thiss!1870)) (currentByte!10283 thiss!1870) (currentBit!10278 thiss!1870))))))))

(declare-fun b!225903 () Bool)

(assert (=> b!225903 (= e!154331 e!154328)))

(declare-fun res!189564 () Bool)

(assert (=> b!225903 (=> (not res!189564) (not e!154328))))

(assert (=> b!225903 (= res!189564 (bvsle #b0000000000000000000000000000000000000000000000000000000000001000 lt!358955))))

(assert (=> b!225903 (= lt!358955 (bitIndex!0 (size!4946 (buf!5487 (_2!10455 lt!358956))) (currentByte!10283 (_2!10455 lt!358956)) (currentBit!10278 (_2!10455 lt!358956))))))

(assert (= (and start!47344 res!189565) b!225899))

(assert (= (and b!225899 res!189563) b!225901))

(assert (= (and b!225901 res!189561) b!225898))

(assert (= (and b!225898 res!189562) b!225903))

(assert (= (and b!225903 res!189564) b!225902))

(assert (= start!47344 b!225900))

(declare-fun m!346929 () Bool)

(assert (=> b!225898 m!346929))

(declare-fun m!346931 () Bool)

(assert (=> b!225900 m!346931))

(declare-fun m!346933 () Bool)

(assert (=> start!47344 m!346933))

(declare-fun m!346935 () Bool)

(assert (=> start!47344 m!346935))

(declare-fun m!346937 () Bool)

(assert (=> b!225902 m!346937))

(declare-fun m!346939 () Bool)

(assert (=> b!225899 m!346939))

(declare-fun m!346941 () Bool)

(assert (=> b!225903 m!346941))

(check-sat (not start!47344) (not b!225899) (not b!225903) (not b!225902) (not b!225900) (not b!225898))
(check-sat)
(get-model)

(declare-fun d!76652 () Bool)

(declare-fun e!154354 () Bool)

(assert (=> d!76652 e!154354))

(declare-fun res!189586 () Bool)

(assert (=> d!76652 (=> (not res!189586) (not e!154354))))

(declare-fun lt!358980 () (_ BitVec 64))

(declare-fun lt!358979 () (_ BitVec 64))

(declare-fun lt!358976 () (_ BitVec 64))

(assert (=> d!76652 (= res!189586 (= lt!358980 (bvsub lt!358976 lt!358979)))))

(assert (=> d!76652 (or (= (bvand lt!358976 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!358979 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!358976 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!358976 lt!358979) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!76652 (= lt!358979 (remainingBits!0 ((_ sign_extend 32) (size!4946 (buf!5487 (_2!10455 lt!358956)))) ((_ sign_extend 32) (currentByte!10283 (_2!10455 lt!358956))) ((_ sign_extend 32) (currentBit!10278 (_2!10455 lt!358956)))))))

(declare-fun lt!358977 () (_ BitVec 64))

(declare-fun lt!358975 () (_ BitVec 64))

(assert (=> d!76652 (= lt!358976 (bvmul lt!358977 lt!358975))))

(assert (=> d!76652 (or (= lt!358977 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!358975 (bvsdiv (bvmul lt!358977 lt!358975) lt!358977)))))

(assert (=> d!76652 (= lt!358975 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76652 (= lt!358977 ((_ sign_extend 32) (size!4946 (buf!5487 (_2!10455 lt!358956)))))))

(assert (=> d!76652 (= lt!358980 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10283 (_2!10455 lt!358956))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10278 (_2!10455 lt!358956)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!76652 (invariant!0 (currentBit!10278 (_2!10455 lt!358956)) (currentByte!10283 (_2!10455 lt!358956)) (size!4946 (buf!5487 (_2!10455 lt!358956))))))

(assert (=> d!76652 (= (bitIndex!0 (size!4946 (buf!5487 (_2!10455 lt!358956))) (currentByte!10283 (_2!10455 lt!358956)) (currentBit!10278 (_2!10455 lt!358956))) lt!358980)))

(declare-fun b!225926 () Bool)

(declare-fun res!189587 () Bool)

(assert (=> b!225926 (=> (not res!189587) (not e!154354))))

(assert (=> b!225926 (= res!189587 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!358980))))

(declare-fun b!225927 () Bool)

(declare-fun lt!358978 () (_ BitVec 64))

(assert (=> b!225927 (= e!154354 (bvsle lt!358980 (bvmul lt!358978 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!225927 (or (= lt!358978 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!358978 #b0000000000000000000000000000000000000000000000000000000000001000) lt!358978)))))

(assert (=> b!225927 (= lt!358978 ((_ sign_extend 32) (size!4946 (buf!5487 (_2!10455 lt!358956)))))))

(assert (= (and d!76652 res!189586) b!225926))

(assert (= (and b!225926 res!189587) b!225927))

(declare-fun m!346957 () Bool)

(assert (=> d!76652 m!346957))

(declare-fun m!346959 () Bool)

(assert (=> d!76652 m!346959))

(assert (=> b!225903 d!76652))

(declare-fun d!76656 () Bool)

(declare-fun lt!359043 () (_ BitVec 8))

(declare-fun lt!359040 () (_ BitVec 8))

(assert (=> d!76656 (= lt!359043 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5903 (buf!5487 thiss!1870)) (currentByte!10283 thiss!1870))) ((_ sign_extend 24) lt!359040))))))

(assert (=> d!76656 (= lt!359040 ((_ extract 7 0) (currentBit!10278 thiss!1870)))))

(declare-fun e!154370 () Bool)

(assert (=> d!76656 e!154370))

(declare-fun res!189609 () Bool)

(assert (=> d!76656 (=> (not res!189609) (not e!154370))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!76656 (= res!189609 (validate_offset_bits!1 ((_ sign_extend 32) (size!4946 (buf!5487 thiss!1870))) ((_ sign_extend 32) (currentByte!10283 thiss!1870)) ((_ sign_extend 32) (currentBit!10278 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((Unit!16623 0))(
  ( (Unit!16624) )
))
(declare-datatypes ((tuple2!19340 0))(
  ( (tuple2!19341 (_1!10457 Unit!16623) (_2!10457 (_ BitVec 8))) )
))
(declare-fun Unit!16625 () Unit!16623)

(declare-fun Unit!16628 () Unit!16623)

(assert (=> d!76656 (= (readByte!0 thiss!1870) (tuple2!19337 (_2!10457 (ite (bvsgt ((_ sign_extend 24) lt!359040) #b00000000000000000000000000000000) (tuple2!19341 Unit!16625 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!359043) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5903 (buf!5487 thiss!1870)) (bvadd (currentByte!10283 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!359040)))))))) (tuple2!19341 Unit!16628 lt!359043))) (BitStream!8989 (buf!5487 thiss!1870) (bvadd (currentByte!10283 thiss!1870) #b00000000000000000000000000000001) (currentBit!10278 thiss!1870))))))

(declare-fun b!225946 () Bool)

(declare-fun e!154369 () Bool)

(assert (=> b!225946 (= e!154370 e!154369)))

(declare-fun res!189608 () Bool)

(assert (=> b!225946 (=> (not res!189608) (not e!154369))))

(declare-fun lt!359042 () tuple2!19336)

(assert (=> b!225946 (= res!189608 (= (buf!5487 (_2!10455 lt!359042)) (buf!5487 thiss!1870)))))

(declare-fun lt!359045 () (_ BitVec 8))

(declare-fun lt!359046 () (_ BitVec 8))

(declare-fun Unit!16631 () Unit!16623)

(declare-fun Unit!16632 () Unit!16623)

(assert (=> b!225946 (= lt!359042 (tuple2!19337 (_2!10457 (ite (bvsgt ((_ sign_extend 24) lt!359046) #b00000000000000000000000000000000) (tuple2!19341 Unit!16631 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!359045) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5903 (buf!5487 thiss!1870)) (bvadd (currentByte!10283 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!359046)))))))) (tuple2!19341 Unit!16632 lt!359045))) (BitStream!8989 (buf!5487 thiss!1870) (bvadd (currentByte!10283 thiss!1870) #b00000000000000000000000000000001) (currentBit!10278 thiss!1870))))))

(assert (=> b!225946 (= lt!359045 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5903 (buf!5487 thiss!1870)) (currentByte!10283 thiss!1870))) ((_ sign_extend 24) lt!359046))))))

(assert (=> b!225946 (= lt!359046 ((_ extract 7 0) (currentBit!10278 thiss!1870)))))

(declare-fun b!225947 () Bool)

(declare-fun lt!359044 () (_ BitVec 64))

(declare-fun lt!359041 () (_ BitVec 64))

(assert (=> b!225947 (= e!154369 (= (bitIndex!0 (size!4946 (buf!5487 (_2!10455 lt!359042))) (currentByte!10283 (_2!10455 lt!359042)) (currentBit!10278 (_2!10455 lt!359042))) (bvadd lt!359041 lt!359044)))))

(assert (=> b!225947 (or (not (= (bvand lt!359041 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!359044 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!359041 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!359041 lt!359044) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!225947 (= lt!359044 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!225947 (= lt!359041 (bitIndex!0 (size!4946 (buf!5487 thiss!1870)) (currentByte!10283 thiss!1870) (currentBit!10278 thiss!1870)))))

(assert (= (and d!76656 res!189609) b!225946))

(assert (= (and b!225946 res!189608) b!225947))

(declare-fun m!346981 () Bool)

(assert (=> d!76656 m!346981))

(declare-fun m!346983 () Bool)

(assert (=> d!76656 m!346983))

(declare-fun m!346985 () Bool)

(assert (=> d!76656 m!346985))

(assert (=> b!225946 m!346985))

(assert (=> b!225946 m!346981))

(declare-fun m!346987 () Bool)

(assert (=> b!225947 m!346987))

(assert (=> b!225947 m!346937))

(assert (=> b!225898 d!76656))

(declare-fun d!76676 () Bool)

(declare-fun e!154371 () Bool)

(assert (=> d!76676 e!154371))

(declare-fun res!189610 () Bool)

(assert (=> d!76676 (=> (not res!189610) (not e!154371))))

(declare-fun lt!359052 () (_ BitVec 64))

(declare-fun lt!359051 () (_ BitVec 64))

(declare-fun lt!359048 () (_ BitVec 64))

(assert (=> d!76676 (= res!189610 (= lt!359052 (bvsub lt!359048 lt!359051)))))

(assert (=> d!76676 (or (= (bvand lt!359048 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!359051 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!359048 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!359048 lt!359051) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!76676 (= lt!359051 (remainingBits!0 ((_ sign_extend 32) (size!4946 (buf!5487 thiss!1870))) ((_ sign_extend 32) (currentByte!10283 thiss!1870)) ((_ sign_extend 32) (currentBit!10278 thiss!1870))))))

(declare-fun lt!359049 () (_ BitVec 64))

(declare-fun lt!359047 () (_ BitVec 64))

(assert (=> d!76676 (= lt!359048 (bvmul lt!359049 lt!359047))))

(assert (=> d!76676 (or (= lt!359049 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!359047 (bvsdiv (bvmul lt!359049 lt!359047) lt!359049)))))

(assert (=> d!76676 (= lt!359047 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76676 (= lt!359049 ((_ sign_extend 32) (size!4946 (buf!5487 thiss!1870))))))

(assert (=> d!76676 (= lt!359052 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10283 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10278 thiss!1870))))))

(assert (=> d!76676 (invariant!0 (currentBit!10278 thiss!1870) (currentByte!10283 thiss!1870) (size!4946 (buf!5487 thiss!1870)))))

(assert (=> d!76676 (= (bitIndex!0 (size!4946 (buf!5487 thiss!1870)) (currentByte!10283 thiss!1870) (currentBit!10278 thiss!1870)) lt!359052)))

(declare-fun b!225948 () Bool)

(declare-fun res!189611 () Bool)

(assert (=> b!225948 (=> (not res!189611) (not e!154371))))

(assert (=> b!225948 (= res!189611 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!359052))))

(declare-fun b!225949 () Bool)

(declare-fun lt!359050 () (_ BitVec 64))

(assert (=> b!225949 (= e!154371 (bvsle lt!359052 (bvmul lt!359050 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!225949 (or (= lt!359050 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!359050 #b0000000000000000000000000000000000000000000000000000000000001000) lt!359050)))))

(assert (=> b!225949 (= lt!359050 ((_ sign_extend 32) (size!4946 (buf!5487 thiss!1870))))))

(assert (= (and d!76676 res!189610) b!225948))

(assert (= (and b!225948 res!189611) b!225949))

(declare-fun m!346989 () Bool)

(assert (=> d!76676 m!346989))

(declare-fun m!346991 () Bool)

(assert (=> d!76676 m!346991))

(assert (=> b!225902 d!76676))

(declare-fun d!76678 () Bool)

(assert (=> d!76678 (= (array_inv!4687 (buf!5487 thiss!1870)) (bvsge (size!4946 (buf!5487 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!225900 d!76678))

(declare-fun d!76680 () Bool)

(assert (=> d!76680 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4946 (buf!5487 thiss!1870))) ((_ sign_extend 32) (currentByte!10283 thiss!1870)) ((_ sign_extend 32) (currentBit!10278 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4946 (buf!5487 thiss!1870))) ((_ sign_extend 32) (currentByte!10283 thiss!1870)) ((_ sign_extend 32) (currentBit!10278 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18741 () Bool)

(assert (= bs!18741 d!76680))

(assert (=> bs!18741 m!346989))

(assert (=> b!225899 d!76680))

(declare-fun d!76682 () Bool)

(assert (=> d!76682 (= (array_inv!4687 arr!308) (bvsge (size!4946 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!47344 d!76682))

(declare-fun d!76684 () Bool)

(assert (=> d!76684 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10278 thiss!1870) (currentByte!10283 thiss!1870) (size!4946 (buf!5487 thiss!1870))))))

(declare-fun bs!18742 () Bool)

(assert (= bs!18742 d!76684))

(assert (=> bs!18742 m!346991))

(assert (=> start!47344 d!76684))

(check-sat (not d!76652) (not d!76680) (not d!76684) (not b!225947) (not d!76656) (not d!76676))
(check-sat)
