; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47346 () Bool)

(assert start!47346)

(declare-fun b!225916 () Bool)

(declare-fun res!189580 () Bool)

(declare-fun e!154347 () Bool)

(assert (=> b!225916 (=> (not res!189580) (not e!154347))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!225916 (= res!189580 (bvslt i!761 to!496))))

(declare-fun b!225917 () Bool)

(declare-fun e!154350 () Bool)

(assert (=> b!225917 (= e!154347 e!154350)))

(declare-fun res!189578 () Bool)

(assert (=> b!225917 (=> (not res!189578) (not e!154350))))

(declare-datatypes ((array!11274 0))(
  ( (array!11275 (arr!5904 (Array (_ BitVec 32) (_ BitVec 8))) (size!4947 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8990 0))(
  ( (BitStream!8991 (buf!5488 array!11274) (currentByte!10284 (_ BitVec 32)) (currentBit!10279 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8990)

(declare-datatypes ((tuple2!19338 0))(
  ( (tuple2!19339 (_1!10456 (_ BitVec 8)) (_2!10456 BitStream!8990)) )
))
(declare-fun lt!358962 () tuple2!19338)

(assert (=> b!225917 (= res!189578 (= (size!4947 (buf!5488 thiss!1870)) (size!4947 (buf!5488 (_2!10456 lt!358962)))))))

(declare-fun readByte!0 (BitStream!8990) tuple2!19338)

(assert (=> b!225917 (= lt!358962 (readByte!0 thiss!1870))))

(declare-fun b!225918 () Bool)

(declare-fun res!189576 () Bool)

(assert (=> b!225918 (=> (not res!189576) (not e!154347))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225918 (= res!189576 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4947 (buf!5488 thiss!1870))) ((_ sign_extend 32) (currentByte!10284 thiss!1870)) ((_ sign_extend 32) (currentBit!10279 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!225919 () Bool)

(declare-fun e!154348 () Bool)

(assert (=> b!225919 (= e!154350 e!154348)))

(declare-fun res!189577 () Bool)

(assert (=> b!225919 (=> (not res!189577) (not e!154348))))

(declare-fun lt!358961 () (_ BitVec 64))

(assert (=> b!225919 (= res!189577 (bvsle #b0000000000000000000000000000000000000000000000000000000000001000 lt!358961))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!225919 (= lt!358961 (bitIndex!0 (size!4947 (buf!5488 (_2!10456 lt!358962))) (currentByte!10284 (_2!10456 lt!358962)) (currentBit!10279 (_2!10456 lt!358962))))))

(declare-fun b!225920 () Bool)

(assert (=> b!225920 (= e!154348 (not (= lt!358961 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!4947 (buf!5488 thiss!1870)) (currentByte!10284 thiss!1870) (currentBit!10279 thiss!1870))))))))

(declare-fun b!225921 () Bool)

(declare-fun e!154346 () Bool)

(declare-fun array_inv!4688 (array!11274) Bool)

(assert (=> b!225921 (= e!154346 (array_inv!4688 (buf!5488 thiss!1870)))))

(declare-fun res!189579 () Bool)

(assert (=> start!47346 (=> (not res!189579) (not e!154347))))

(declare-fun arr!308 () array!11274)

(assert (=> start!47346 (= res!189579 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4947 arr!308))))))

(assert (=> start!47346 e!154347))

(assert (=> start!47346 true))

(assert (=> start!47346 (array_inv!4688 arr!308)))

(declare-fun inv!12 (BitStream!8990) Bool)

(assert (=> start!47346 (and (inv!12 thiss!1870) e!154346)))

(assert (= (and start!47346 res!189579) b!225918))

(assert (= (and b!225918 res!189576) b!225916))

(assert (= (and b!225916 res!189580) b!225917))

(assert (= (and b!225917 res!189578) b!225919))

(assert (= (and b!225919 res!189577) b!225920))

(assert (= start!47346 b!225921))

(declare-fun m!346943 () Bool)

(assert (=> b!225920 m!346943))

(declare-fun m!346945 () Bool)

(assert (=> b!225919 m!346945))

(declare-fun m!346947 () Bool)

(assert (=> b!225918 m!346947))

(declare-fun m!346949 () Bool)

(assert (=> b!225917 m!346949))

(declare-fun m!346951 () Bool)

(assert (=> b!225921 m!346951))

(declare-fun m!346953 () Bool)

(assert (=> start!47346 m!346953))

(declare-fun m!346955 () Bool)

(assert (=> start!47346 m!346955))

(push 1)

(assert (not b!225919))

(assert (not start!47346))

(assert (not b!225918))

(assert (not b!225921))

(assert (not b!225917))

(assert (not b!225920))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!76658 () Bool)

(declare-fun e!154357 () Bool)

(assert (=> d!76658 e!154357))

(declare-fun res!189594 () Bool)

(assert (=> d!76658 (=> (not res!189594) (not e!154357))))

(declare-fun lt!358994 () (_ BitVec 64))

(declare-fun lt!358997 () (_ BitVec 64))

(declare-fun lt!358998 () (_ BitVec 64))

(assert (=> d!76658 (= res!189594 (= lt!358998 (bvsub lt!358994 lt!358997)))))

(assert (=> d!76658 (or (= (bvand lt!358994 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!358997 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!358994 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!358994 lt!358997) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!76658 (= lt!358997 (remainingBits!0 ((_ sign_extend 32) (size!4947 (buf!5488 (_2!10456 lt!358962)))) ((_ sign_extend 32) (currentByte!10284 (_2!10456 lt!358962))) ((_ sign_extend 32) (currentBit!10279 (_2!10456 lt!358962)))))))

(declare-fun lt!358996 () (_ BitVec 64))

(declare-fun lt!358995 () (_ BitVec 64))

(assert (=> d!76658 (= lt!358994 (bvmul lt!358996 lt!358995))))

(assert (=> d!76658 (or (= lt!358996 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!358995 (bvsdiv (bvmul lt!358996 lt!358995) lt!358996)))))

(assert (=> d!76658 (= lt!358995 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76658 (= lt!358996 ((_ sign_extend 32) (size!4947 (buf!5488 (_2!10456 lt!358962)))))))

(assert (=> d!76658 (= lt!358998 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10284 (_2!10456 lt!358962))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10279 (_2!10456 lt!358962)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!76658 (invariant!0 (currentBit!10279 (_2!10456 lt!358962)) (currentByte!10284 (_2!10456 lt!358962)) (size!4947 (buf!5488 (_2!10456 lt!358962))))))

(assert (=> d!76658 (= (bitIndex!0 (size!4947 (buf!5488 (_2!10456 lt!358962))) (currentByte!10284 (_2!10456 lt!358962)) (currentBit!10279 (_2!10456 lt!358962))) lt!358998)))

(declare-fun b!225932 () Bool)

(declare-fun res!189593 () Bool)

(assert (=> b!225932 (=> (not res!189593) (not e!154357))))

(assert (=> b!225932 (= res!189593 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!358998))))

(declare-fun b!225933 () Bool)

(declare-fun lt!358993 () (_ BitVec 64))

(assert (=> b!225933 (= e!154357 (bvsle lt!358998 (bvmul lt!358993 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!225933 (or (= lt!358993 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!358993 #b0000000000000000000000000000000000000000000000000000000000001000) lt!358993)))))

(assert (=> b!225933 (= lt!358993 ((_ sign_extend 32) (size!4947 (buf!5488 (_2!10456 lt!358962)))))))

(assert (= (and d!76658 res!189594) b!225932))

(assert (= (and b!225932 res!189593) b!225933))

(declare-fun m!346961 () Bool)

(assert (=> d!76658 m!346961))

(declare-fun m!346963 () Bool)

(assert (=> d!76658 m!346963))

(assert (=> b!225919 d!76658))

(declare-fun d!76660 () Bool)

(declare-fun e!154358 () Bool)

(assert (=> d!76660 e!154358))

(declare-fun res!189596 () Bool)

(assert (=> d!76660 (=> (not res!189596) (not e!154358))))

(declare-fun lt!359003 () (_ BitVec 64))

(declare-fun lt!359004 () (_ BitVec 64))

(declare-fun lt!359000 () (_ BitVec 64))

(assert (=> d!76660 (= res!189596 (= lt!359004 (bvsub lt!359000 lt!359003)))))

(assert (=> d!76660 (or (= (bvand lt!359000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!359003 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!359000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!359000 lt!359003) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!76660 (= lt!359003 (remainingBits!0 ((_ sign_extend 32) (size!4947 (buf!5488 thiss!1870))) ((_ sign_extend 32) (currentByte!10284 thiss!1870)) ((_ sign_extend 32) (currentBit!10279 thiss!1870))))))

(declare-fun lt!359002 () (_ BitVec 64))

(declare-fun lt!359001 () (_ BitVec 64))

(assert (=> d!76660 (= lt!359000 (bvmul lt!359002 lt!359001))))

(assert (=> d!76660 (or (= lt!359002 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!359001 (bvsdiv (bvmul lt!359002 lt!359001) lt!359002)))))

(assert (=> d!76660 (= lt!359001 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76660 (= lt!359002 ((_ sign_extend 32) (size!4947 (buf!5488 thiss!1870))))))

(assert (=> d!76660 (= lt!359004 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10284 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10279 thiss!1870))))))

(assert (=> d!76660 (invariant!0 (currentBit!10279 thiss!1870) (currentByte!10284 thiss!1870) (size!4947 (buf!5488 thiss!1870)))))

(assert (=> d!76660 (= (bitIndex!0 (size!4947 (buf!5488 thiss!1870)) (currentByte!10284 thiss!1870) (currentBit!10279 thiss!1870)) lt!359004)))

(declare-fun b!225934 () Bool)

(declare-fun res!189595 () Bool)

(assert (=> b!225934 (=> (not res!189595) (not e!154358))))

(assert (=> b!225934 (= res!189595 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!359004))))

(declare-fun b!225935 () Bool)

(declare-fun lt!358999 () (_ BitVec 64))

(assert (=> b!225935 (= e!154358 (bvsle lt!359004 (bvmul lt!358999 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!225935 (or (= lt!358999 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!358999 #b0000000000000000000000000000000000000000000000000000000000001000) lt!358999)))))

(assert (=> b!225935 (= lt!358999 ((_ sign_extend 32) (size!4947 (buf!5488 thiss!1870))))))

(assert (= (and d!76660 res!189596) b!225934))

(assert (= (and b!225934 res!189595) b!225935))

(declare-fun m!346965 () Bool)

(assert (=> d!76660 m!346965))

(declare-fun m!346967 () Bool)

(assert (=> d!76660 m!346967))

(assert (=> b!225920 d!76660))

(declare-fun d!76662 () Bool)

(assert (=> d!76662 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4947 (buf!5488 thiss!1870))) ((_ sign_extend 32) (currentByte!10284 thiss!1870)) ((_ sign_extend 32) (currentBit!10279 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4947 (buf!5488 thiss!1870))) ((_ sign_extend 32) (currentByte!10284 thiss!1870)) ((_ sign_extend 32) (currentBit!10279 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18738 () Bool)

(assert (= bs!18738 d!76662))

(assert (=> bs!18738 m!346965))

(assert (=> b!225918 d!76662))

(declare-fun d!76664 () Bool)

(declare-fun lt!359094 () (_ BitVec 8))

(declare-fun lt!359096 () (_ BitVec 8))

(assert (=> d!76664 (= lt!359094 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5904 (buf!5488 thiss!1870)) (currentByte!10284 thiss!1870))) ((_ sign_extend 24) lt!359096))))))

(assert (=> d!76664 (= lt!359096 ((_ extract 7 0) (currentBit!10279 thiss!1870)))))

(declare-fun e!154380 () Bool)

(assert (=> d!76664 e!154380))

(declare-fun res!189624 () Bool)

(assert (=> d!76664 (=> (not res!189624) (not e!154380))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!76664 (= res!189624 (validate_offset_bits!1 ((_ sign_extend 32) (size!4947 (buf!5488 thiss!1870))) ((_ sign_extend 32) (currentByte!10284 thiss!1870)) ((_ sign_extend 32) (currentBit!10279 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((Unit!16635 0))(
  ( (Unit!16636) )
))
(declare-datatypes ((tuple2!19344 0))(
  ( (tuple2!19345 (_1!10459 Unit!16635) (_2!10459 (_ BitVec 8))) )
))
(declare-fun Unit!16637 () Unit!16635)

(declare-fun Unit!16638 () Unit!16635)

(assert (=> d!76664 (= (readByte!0 thiss!1870) (tuple2!19339 (_2!10459 (ite (bvsgt ((_ sign_extend 24) lt!359096) #b00000000000000000000000000000000) (tuple2!19345 Unit!16637 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!359094) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5904 (buf!5488 thiss!1870)) (bvadd (currentByte!10284 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!359096)))))))) (tuple2!19345 Unit!16638 lt!359094))) (BitStream!8991 (buf!5488 thiss!1870) (bvadd (currentByte!10284 thiss!1870) #b00000000000000000000000000000001) (currentBit!10279 thiss!1870))))))

(declare-fun b!225962 () Bool)

(declare-fun e!154381 () Bool)

(assert (=> b!225962 (= e!154380 e!154381)))

(declare-fun res!189625 () Bool)

(assert (=> b!225962 (=> (not res!189625) (not e!154381))))

(declare-fun lt!359091 () tuple2!19338)

(assert (=> b!225962 (= res!189625 (= (buf!5488 (_2!10456 lt!359091)) (buf!5488 thiss!1870)))))

(declare-fun lt!359097 () (_ BitVec 8))

(declare-fun lt!359092 () (_ BitVec 8))

(declare-fun Unit!16639 () Unit!16635)

(declare-fun Unit!16640 () Unit!16635)

(assert (=> b!225962 (= lt!359091 (tuple2!19339 (_2!10459 (ite (bvsgt ((_ sign_extend 24) lt!359092) #b00000000000000000000000000000000) (tuple2!19345 Unit!16639 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!359097) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5904 (buf!5488 thiss!1870)) (bvadd (currentByte!10284 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!359092)))))))) (tuple2!19345 Unit!16640 lt!359097))) (BitStream!8991 (buf!5488 thiss!1870) (bvadd (currentByte!10284 thiss!1870) #b00000000000000000000000000000001) (currentBit!10279 thiss!1870))))))

(assert (=> b!225962 (= lt!359097 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5904 (buf!5488 thiss!1870)) (currentByte!10284 thiss!1870))) ((_ sign_extend 24) lt!359092))))))

(assert (=> b!225962 (= lt!359092 ((_ extract 7 0) (currentBit!10279 thiss!1870)))))

(declare-fun lt!359093 () (_ BitVec 64))

(declare-fun b!225963 () Bool)

(declare-fun lt!359095 () (_ BitVec 64))

(assert (=> b!225963 (= e!154381 (= (bitIndex!0 (size!4947 (buf!5488 (_2!10456 lt!359091))) (currentByte!10284 (_2!10456 lt!359091)) (currentBit!10279 (_2!10456 lt!359091))) (bvadd lt!359095 lt!359093)))))

(assert (=> b!225963 (or (not (= (bvand lt!359095 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!359093 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!359095 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!359095 lt!359093) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!225963 (= lt!359093 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!225963 (= lt!359095 (bitIndex!0 (size!4947 (buf!5488 thiss!1870)) (currentByte!10284 thiss!1870) (currentBit!10279 thiss!1870)))))

(assert (= (and d!76664 res!189624) b!225962))

(assert (= (and b!225962 res!189625) b!225963))

(declare-fun m!346997 () Bool)

(assert (=> d!76664 m!346997))

(declare-fun m!346999 () Bool)

(assert (=> d!76664 m!346999))

(declare-fun m!347001 () Bool)

(assert (=> d!76664 m!347001))

(assert (=> b!225962 m!347001))

(assert (=> b!225962 m!346997))

(declare-fun m!347003 () Bool)

(assert (=> b!225963 m!347003))

(assert (=> b!225963 m!346943))

(assert (=> b!225917 d!76664))

(declare-fun d!76688 () Bool)

(assert (=> d!76688 (= (array_inv!4688 arr!308) (bvsge (size!4947 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!47346 d!76688))

(declare-fun d!76690 () Bool)

(assert (=> d!76690 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10279 thiss!1870) (currentByte!10284 thiss!1870) (size!4947 (buf!5488 thiss!1870))))))

(declare-fun bs!18743 () Bool)

(assert (= bs!18743 d!76690))

(assert (=> bs!18743 m!346967))

(assert (=> start!47346 d!76690))

(declare-fun d!76692 () Bool)

(assert (=> d!76692 (= (array_inv!4688 (buf!5488 thiss!1870)) (bvsge (size!4947 (buf!5488 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!225921 d!76692))

(push 1)

(assert (not b!225963))

(assert (not d!76658))

(assert (not d!76690))

(assert (not d!76660))

(assert (not d!76662))

(assert (not d!76664))

(check-sat)

(pop 1)

(push 1)

(check-sat)

