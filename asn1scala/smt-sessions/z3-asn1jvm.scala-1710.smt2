; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47290 () Bool)

(assert start!47290)

(declare-fun b!225718 () Bool)

(declare-fun e!154161 () Bool)

(declare-datatypes ((array!11251 0))(
  ( (array!11252 (arr!5894 (Array (_ BitVec 32) (_ BitVec 8))) (size!4937 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8970 0))(
  ( (BitStream!8971 (buf!5478 array!11251) (currentByte!10265 (_ BitVec 32)) (currentBit!10260 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!19312 0))(
  ( (tuple2!19313 (_1!10443 (_ BitVec 8)) (_2!10443 BitStream!8970)) )
))
(declare-fun lt!358776 () tuple2!19312)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!225718 (= e!154161 (bvsgt #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!4937 (buf!5478 (_2!10443 lt!358776))) (currentByte!10265 (_2!10443 lt!358776)) (currentBit!10260 (_2!10443 lt!358776)))))))

(declare-fun res!189405 () Bool)

(declare-fun e!154162 () Bool)

(assert (=> start!47290 (=> (not res!189405) (not e!154162))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun arr!308 () array!11251)

(assert (=> start!47290 (= res!189405 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4937 arr!308))))))

(assert (=> start!47290 e!154162))

(assert (=> start!47290 true))

(declare-fun array_inv!4678 (array!11251) Bool)

(assert (=> start!47290 (array_inv!4678 arr!308)))

(declare-fun thiss!1870 () BitStream!8970)

(declare-fun e!154159 () Bool)

(declare-fun inv!12 (BitStream!8970) Bool)

(assert (=> start!47290 (and (inv!12 thiss!1870) e!154159)))

(declare-fun b!225719 () Bool)

(assert (=> b!225719 (= e!154162 e!154161)))

(declare-fun res!189406 () Bool)

(assert (=> b!225719 (=> (not res!189406) (not e!154161))))

(assert (=> b!225719 (= res!189406 (= (size!4937 (buf!5478 thiss!1870)) (size!4937 (buf!5478 (_2!10443 lt!358776)))))))

(declare-fun readByte!0 (BitStream!8970) tuple2!19312)

(assert (=> b!225719 (= lt!358776 (readByte!0 thiss!1870))))

(declare-fun b!225720 () Bool)

(assert (=> b!225720 (= e!154159 (array_inv!4678 (buf!5478 thiss!1870)))))

(declare-fun b!225721 () Bool)

(declare-fun res!189408 () Bool)

(assert (=> b!225721 (=> (not res!189408) (not e!154162))))

(assert (=> b!225721 (= res!189408 (bvslt i!761 to!496))))

(declare-fun b!225722 () Bool)

(declare-fun res!189407 () Bool)

(assert (=> b!225722 (=> (not res!189407) (not e!154162))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225722 (= res!189407 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4937 (buf!5478 thiss!1870))) ((_ sign_extend 32) (currentByte!10265 thiss!1870)) ((_ sign_extend 32) (currentBit!10260 thiss!1870)) (bvsub to!496 i!761)))))

(assert (= (and start!47290 res!189405) b!225722))

(assert (= (and b!225722 res!189407) b!225721))

(assert (= (and b!225721 res!189408) b!225719))

(assert (= (and b!225719 res!189406) b!225718))

(assert (= start!47290 b!225720))

(declare-fun m!346761 () Bool)

(assert (=> start!47290 m!346761))

(declare-fun m!346763 () Bool)

(assert (=> start!47290 m!346763))

(declare-fun m!346765 () Bool)

(assert (=> b!225719 m!346765))

(declare-fun m!346767 () Bool)

(assert (=> b!225720 m!346767))

(declare-fun m!346769 () Bool)

(assert (=> b!225718 m!346769))

(declare-fun m!346771 () Bool)

(assert (=> b!225722 m!346771))

(check-sat (not start!47290) (not b!225719) (not b!225722) (not b!225720) (not b!225718))
(check-sat)
(get-model)

(declare-fun d!76604 () Bool)

(declare-fun e!154188 () Bool)

(assert (=> d!76604 e!154188))

(declare-fun res!189438 () Bool)

(assert (=> d!76604 (=> (not res!189438) (not e!154188))))

(declare-fun lt!358829 () (_ BitVec 64))

(declare-fun lt!358826 () (_ BitVec 64))

(declare-fun lt!358828 () (_ BitVec 64))

(assert (=> d!76604 (= res!189438 (= lt!358828 (bvsub lt!358829 lt!358826)))))

(assert (=> d!76604 (or (= (bvand lt!358829 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!358826 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!358829 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!358829 lt!358826) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!76604 (= lt!358826 (remainingBits!0 ((_ sign_extend 32) (size!4937 (buf!5478 (_2!10443 lt!358776)))) ((_ sign_extend 32) (currentByte!10265 (_2!10443 lt!358776))) ((_ sign_extend 32) (currentBit!10260 (_2!10443 lt!358776)))))))

(declare-fun lt!358825 () (_ BitVec 64))

(declare-fun lt!358824 () (_ BitVec 64))

(assert (=> d!76604 (= lt!358829 (bvmul lt!358825 lt!358824))))

(assert (=> d!76604 (or (= lt!358825 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!358824 (bvsdiv (bvmul lt!358825 lt!358824) lt!358825)))))

(assert (=> d!76604 (= lt!358824 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76604 (= lt!358825 ((_ sign_extend 32) (size!4937 (buf!5478 (_2!10443 lt!358776)))))))

(assert (=> d!76604 (= lt!358828 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10265 (_2!10443 lt!358776))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10260 (_2!10443 lt!358776)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!76604 (invariant!0 (currentBit!10260 (_2!10443 lt!358776)) (currentByte!10265 (_2!10443 lt!358776)) (size!4937 (buf!5478 (_2!10443 lt!358776))))))

(assert (=> d!76604 (= (bitIndex!0 (size!4937 (buf!5478 (_2!10443 lt!358776))) (currentByte!10265 (_2!10443 lt!358776)) (currentBit!10260 (_2!10443 lt!358776))) lt!358828)))

(declare-fun b!225752 () Bool)

(declare-fun res!189437 () Bool)

(assert (=> b!225752 (=> (not res!189437) (not e!154188))))

(assert (=> b!225752 (= res!189437 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!358828))))

(declare-fun b!225753 () Bool)

(declare-fun lt!358827 () (_ BitVec 64))

(assert (=> b!225753 (= e!154188 (bvsle lt!358828 (bvmul lt!358827 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!225753 (or (= lt!358827 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!358827 #b0000000000000000000000000000000000000000000000000000000000001000) lt!358827)))))

(assert (=> b!225753 (= lt!358827 ((_ sign_extend 32) (size!4937 (buf!5478 (_2!10443 lt!358776)))))))

(assert (= (and d!76604 res!189438) b!225752))

(assert (= (and b!225752 res!189437) b!225753))

(declare-fun m!346795 () Bool)

(assert (=> d!76604 m!346795))

(declare-fun m!346797 () Bool)

(assert (=> d!76604 m!346797))

(assert (=> b!225718 d!76604))

(declare-fun d!76614 () Bool)

(assert (=> d!76614 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4937 (buf!5478 thiss!1870))) ((_ sign_extend 32) (currentByte!10265 thiss!1870)) ((_ sign_extend 32) (currentBit!10260 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4937 (buf!5478 thiss!1870))) ((_ sign_extend 32) (currentByte!10265 thiss!1870)) ((_ sign_extend 32) (currentBit!10260 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18725 () Bool)

(assert (= bs!18725 d!76614))

(declare-fun m!346799 () Bool)

(assert (=> bs!18725 m!346799))

(assert (=> b!225722 d!76614))

(declare-fun d!76616 () Bool)

(assert (=> d!76616 (= (array_inv!4678 arr!308) (bvsge (size!4937 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!47290 d!76616))

(declare-fun d!76618 () Bool)

(assert (=> d!76618 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10260 thiss!1870) (currentByte!10265 thiss!1870) (size!4937 (buf!5478 thiss!1870))))))

(declare-fun bs!18726 () Bool)

(assert (= bs!18726 d!76618))

(declare-fun m!346811 () Bool)

(assert (=> bs!18726 m!346811))

(assert (=> start!47290 d!76618))

(declare-fun d!76622 () Bool)

(assert (=> d!76622 (= (array_inv!4678 (buf!5478 thiss!1870)) (bvsge (size!4937 (buf!5478 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!225720 d!76622))

(declare-fun d!76624 () Bool)

(declare-fun lt!358892 () (_ BitVec 8))

(declare-fun lt!358891 () (_ BitVec 8))

(assert (=> d!76624 (= lt!358892 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5894 (buf!5478 thiss!1870)) (currentByte!10265 thiss!1870))) ((_ sign_extend 24) lt!358891))))))

(assert (=> d!76624 (= lt!358891 ((_ extract 7 0) (currentBit!10260 thiss!1870)))))

(declare-fun e!154205 () Bool)

(assert (=> d!76624 e!154205))

(declare-fun res!189458 () Bool)

(assert (=> d!76624 (=> (not res!189458) (not e!154205))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!76624 (= res!189458 (validate_offset_bits!1 ((_ sign_extend 32) (size!4937 (buf!5478 thiss!1870))) ((_ sign_extend 32) (currentByte!10265 thiss!1870)) ((_ sign_extend 32) (currentBit!10260 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((Unit!16617 0))(
  ( (Unit!16618) )
))
(declare-datatypes ((tuple2!19320 0))(
  ( (tuple2!19321 (_1!10447 Unit!16617) (_2!10447 (_ BitVec 8))) )
))
(declare-fun Unit!16619 () Unit!16617)

(declare-fun Unit!16620 () Unit!16617)

(assert (=> d!76624 (= (readByte!0 thiss!1870) (tuple2!19313 (_2!10447 (ite (bvsgt ((_ sign_extend 24) lt!358891) #b00000000000000000000000000000000) (tuple2!19321 Unit!16619 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!358892) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5894 (buf!5478 thiss!1870)) (bvadd (currentByte!10265 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!358891)))))))) (tuple2!19321 Unit!16620 lt!358892))) (BitStream!8971 (buf!5478 thiss!1870) (bvadd (currentByte!10265 thiss!1870) #b00000000000000000000000000000001) (currentBit!10260 thiss!1870))))))

(declare-fun b!225772 () Bool)

(declare-fun e!154204 () Bool)

(assert (=> b!225772 (= e!154205 e!154204)))

(declare-fun res!189459 () Bool)

(assert (=> b!225772 (=> (not res!189459) (not e!154204))))

(declare-fun lt!358890 () tuple2!19312)

(assert (=> b!225772 (= res!189459 (= (buf!5478 (_2!10443 lt!358890)) (buf!5478 thiss!1870)))))

(declare-fun lt!358895 () (_ BitVec 8))

(declare-fun lt!358896 () (_ BitVec 8))

(declare-fun Unit!16621 () Unit!16617)

(declare-fun Unit!16622 () Unit!16617)

(assert (=> b!225772 (= lt!358890 (tuple2!19313 (_2!10447 (ite (bvsgt ((_ sign_extend 24) lt!358895) #b00000000000000000000000000000000) (tuple2!19321 Unit!16621 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!358896) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5894 (buf!5478 thiss!1870)) (bvadd (currentByte!10265 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!358895)))))))) (tuple2!19321 Unit!16622 lt!358896))) (BitStream!8971 (buf!5478 thiss!1870) (bvadd (currentByte!10265 thiss!1870) #b00000000000000000000000000000001) (currentBit!10260 thiss!1870))))))

(assert (=> b!225772 (= lt!358896 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5894 (buf!5478 thiss!1870)) (currentByte!10265 thiss!1870))) ((_ sign_extend 24) lt!358895))))))

(assert (=> b!225772 (= lt!358895 ((_ extract 7 0) (currentBit!10260 thiss!1870)))))

(declare-fun lt!358894 () (_ BitVec 64))

(declare-fun lt!358893 () (_ BitVec 64))

(declare-fun b!225773 () Bool)

(assert (=> b!225773 (= e!154204 (= (bitIndex!0 (size!4937 (buf!5478 (_2!10443 lt!358890))) (currentByte!10265 (_2!10443 lt!358890)) (currentBit!10260 (_2!10443 lt!358890))) (bvadd lt!358893 lt!358894)))))

(assert (=> b!225773 (or (not (= (bvand lt!358893 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!358894 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!358893 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!358893 lt!358894) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!225773 (= lt!358894 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!225773 (= lt!358893 (bitIndex!0 (size!4937 (buf!5478 thiss!1870)) (currentByte!10265 thiss!1870) (currentBit!10260 thiss!1870)))))

(assert (= (and d!76624 res!189458) b!225772))

(assert (= (and b!225772 res!189459) b!225773))

(declare-fun m!346829 () Bool)

(assert (=> d!76624 m!346829))

(declare-fun m!346831 () Bool)

(assert (=> d!76624 m!346831))

(declare-fun m!346833 () Bool)

(assert (=> d!76624 m!346833))

(assert (=> b!225772 m!346833))

(assert (=> b!225772 m!346829))

(declare-fun m!346835 () Bool)

(assert (=> b!225773 m!346835))

(declare-fun m!346837 () Bool)

(assert (=> b!225773 m!346837))

(assert (=> b!225719 d!76624))

(check-sat (not b!225773) (not d!76618) (not d!76624) (not d!76604) (not d!76614))
(check-sat)
