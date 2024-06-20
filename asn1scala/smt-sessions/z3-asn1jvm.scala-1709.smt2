; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47260 () Bool)

(assert start!47260)

(declare-fun b!225661 () Bool)

(declare-fun e!154102 () Bool)

(declare-datatypes ((array!11242 0))(
  ( (array!11243 (arr!5891 (Array (_ BitVec 32) (_ BitVec 8))) (size!4934 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8964 0))(
  ( (BitStream!8965 (buf!5475 array!11242) (currentByte!10259 (_ BitVec 32)) (currentBit!10254 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8964)

(declare-datatypes ((tuple2!19300 0))(
  ( (tuple2!19301 (_1!10437 (_ BitVec 8)) (_2!10437 BitStream!8964)) )
))
(declare-fun readByte!0 (BitStream!8964) tuple2!19300)

(assert (=> b!225661 (= e!154102 (not (= (size!4934 (buf!5475 thiss!1870)) (size!4934 (buf!5475 (_2!10437 (readByte!0 thiss!1870)))))))))

(declare-fun b!225659 () Bool)

(declare-fun res!189354 () Bool)

(assert (=> b!225659 (=> (not res!189354) (not e!154102))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225659 (= res!189354 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4934 (buf!5475 thiss!1870))) ((_ sign_extend 32) (currentByte!10259 thiss!1870)) ((_ sign_extend 32) (currentBit!10254 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!225662 () Bool)

(declare-fun e!154101 () Bool)

(declare-fun array_inv!4675 (array!11242) Bool)

(assert (=> b!225662 (= e!154101 (array_inv!4675 (buf!5475 thiss!1870)))))

(declare-fun b!225660 () Bool)

(declare-fun res!189353 () Bool)

(assert (=> b!225660 (=> (not res!189353) (not e!154102))))

(assert (=> b!225660 (= res!189353 (bvslt i!761 to!496))))

(declare-fun res!189352 () Bool)

(assert (=> start!47260 (=> (not res!189352) (not e!154102))))

(declare-fun arr!308 () array!11242)

(assert (=> start!47260 (= res!189352 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4934 arr!308))))))

(assert (=> start!47260 e!154102))

(assert (=> start!47260 true))

(assert (=> start!47260 (array_inv!4675 arr!308)))

(declare-fun inv!12 (BitStream!8964) Bool)

(assert (=> start!47260 (and (inv!12 thiss!1870) e!154101)))

(assert (= (and start!47260 res!189352) b!225659))

(assert (= (and b!225659 res!189354) b!225660))

(assert (= (and b!225660 res!189353) b!225661))

(assert (= start!47260 b!225662))

(declare-fun m!346687 () Bool)

(assert (=> b!225661 m!346687))

(declare-fun m!346689 () Bool)

(assert (=> b!225659 m!346689))

(declare-fun m!346691 () Bool)

(assert (=> b!225662 m!346691))

(declare-fun m!346693 () Bool)

(assert (=> start!47260 m!346693))

(declare-fun m!346695 () Bool)

(assert (=> start!47260 m!346695))

(check-sat (not b!225661) (not start!47260) (not b!225659) (not b!225662))
(check-sat)
(get-model)

(declare-fun d!76568 () Bool)

(declare-fun lt!358744 () (_ BitVec 8))

(declare-fun lt!358746 () (_ BitVec 8))

(assert (=> d!76568 (= lt!358744 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5891 (buf!5475 thiss!1870)) (currentByte!10259 thiss!1870))) ((_ sign_extend 24) lt!358746))))))

(assert (=> d!76568 (= lt!358746 ((_ extract 7 0) (currentBit!10254 thiss!1870)))))

(declare-fun e!154127 () Bool)

(assert (=> d!76568 e!154127))

(declare-fun res!189377 () Bool)

(assert (=> d!76568 (=> (not res!189377) (not e!154127))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!76568 (= res!189377 (validate_offset_bits!1 ((_ sign_extend 32) (size!4934 (buf!5475 thiss!1870))) ((_ sign_extend 32) (currentByte!10259 thiss!1870)) ((_ sign_extend 32) (currentBit!10254 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((Unit!16589 0))(
  ( (Unit!16590) )
))
(declare-datatypes ((tuple2!19304 0))(
  ( (tuple2!19305 (_1!10439 Unit!16589) (_2!10439 (_ BitVec 8))) )
))
(declare-fun Unit!16591 () Unit!16589)

(declare-fun Unit!16593 () Unit!16589)

(assert (=> d!76568 (= (readByte!0 thiss!1870) (tuple2!19301 (_2!10439 (ite (bvsgt ((_ sign_extend 24) lt!358746) #b00000000000000000000000000000000) (tuple2!19305 Unit!16591 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!358744) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5891 (buf!5475 thiss!1870)) (bvadd (currentByte!10259 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!358746)))))))) (tuple2!19305 Unit!16593 lt!358744))) (BitStream!8965 (buf!5475 thiss!1870) (bvadd (currentByte!10259 thiss!1870) #b00000000000000000000000000000001) (currentBit!10254 thiss!1870))))))

(declare-fun b!225685 () Bool)

(declare-fun e!154126 () Bool)

(assert (=> b!225685 (= e!154127 e!154126)))

(declare-fun res!189378 () Bool)

(assert (=> b!225685 (=> (not res!189378) (not e!154126))))

(declare-fun lt!358745 () tuple2!19300)

(assert (=> b!225685 (= res!189378 (= (buf!5475 (_2!10437 lt!358745)) (buf!5475 thiss!1870)))))

(declare-fun lt!358747 () (_ BitVec 8))

(declare-fun lt!358749 () (_ BitVec 8))

(declare-fun Unit!16595 () Unit!16589)

(declare-fun Unit!16596 () Unit!16589)

(assert (=> b!225685 (= lt!358745 (tuple2!19301 (_2!10439 (ite (bvsgt ((_ sign_extend 24) lt!358749) #b00000000000000000000000000000000) (tuple2!19305 Unit!16595 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!358747) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5891 (buf!5475 thiss!1870)) (bvadd (currentByte!10259 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!358749)))))))) (tuple2!19305 Unit!16596 lt!358747))) (BitStream!8965 (buf!5475 thiss!1870) (bvadd (currentByte!10259 thiss!1870) #b00000000000000000000000000000001) (currentBit!10254 thiss!1870))))))

(assert (=> b!225685 (= lt!358747 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5891 (buf!5475 thiss!1870)) (currentByte!10259 thiss!1870))) ((_ sign_extend 24) lt!358749))))))

(assert (=> b!225685 (= lt!358749 ((_ extract 7 0) (currentBit!10254 thiss!1870)))))

(declare-fun lt!358743 () (_ BitVec 64))

(declare-fun b!225686 () Bool)

(declare-fun lt!358748 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!225686 (= e!154126 (= (bitIndex!0 (size!4934 (buf!5475 (_2!10437 lt!358745))) (currentByte!10259 (_2!10437 lt!358745)) (currentBit!10254 (_2!10437 lt!358745))) (bvadd lt!358748 lt!358743)))))

(assert (=> b!225686 (or (not (= (bvand lt!358748 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!358743 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!358748 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!358748 lt!358743) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!225686 (= lt!358743 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!225686 (= lt!358748 (bitIndex!0 (size!4934 (buf!5475 thiss!1870)) (currentByte!10259 thiss!1870) (currentBit!10254 thiss!1870)))))

(assert (= (and d!76568 res!189377) b!225685))

(assert (= (and b!225685 res!189378) b!225686))

(declare-fun m!346711 () Bool)

(assert (=> d!76568 m!346711))

(declare-fun m!346715 () Bool)

(assert (=> d!76568 m!346715))

(declare-fun m!346719 () Bool)

(assert (=> d!76568 m!346719))

(assert (=> b!225685 m!346719))

(assert (=> b!225685 m!346711))

(declare-fun m!346723 () Bool)

(assert (=> b!225686 m!346723))

(declare-fun m!346727 () Bool)

(assert (=> b!225686 m!346727))

(assert (=> b!225661 d!76568))

(declare-fun d!76576 () Bool)

(assert (=> d!76576 (= (array_inv!4675 arr!308) (bvsge (size!4934 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!47260 d!76576))

(declare-fun d!76578 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!76578 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10254 thiss!1870) (currentByte!10259 thiss!1870) (size!4934 (buf!5475 thiss!1870))))))

(declare-fun bs!18715 () Bool)

(assert (= bs!18715 d!76578))

(declare-fun m!346731 () Bool)

(assert (=> bs!18715 m!346731))

(assert (=> start!47260 d!76578))

(declare-fun d!76582 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!76582 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4934 (buf!5475 thiss!1870))) ((_ sign_extend 32) (currentByte!10259 thiss!1870)) ((_ sign_extend 32) (currentBit!10254 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4934 (buf!5475 thiss!1870))) ((_ sign_extend 32) (currentByte!10259 thiss!1870)) ((_ sign_extend 32) (currentBit!10254 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18716 () Bool)

(assert (= bs!18716 d!76582))

(declare-fun m!346733 () Bool)

(assert (=> bs!18716 m!346733))

(assert (=> b!225659 d!76582))

(declare-fun d!76584 () Bool)

(assert (=> d!76584 (= (array_inv!4675 (buf!5475 thiss!1870)) (bvsge (size!4934 (buf!5475 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!225662 d!76584))

(check-sat (not d!76568) (not d!76582) (not b!225686) (not d!76578))
