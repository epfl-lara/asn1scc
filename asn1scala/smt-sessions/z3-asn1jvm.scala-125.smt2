; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3094 () Bool)

(assert start!3094)

(declare-fun res!13366 () Bool)

(declare-fun e!8670 () Bool)

(assert (=> start!3094 (=> (not res!13366) (not e!8670))))

(declare-datatypes ((array!788 0))(
  ( (array!789 (arr!767 (Array (_ BitVec 32) (_ BitVec 8))) (size!338 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!636 0))(
  ( (BitStream!637 (buf!689 array!788) (currentByte!1821 (_ BitVec 32)) (currentBit!1816 (_ BitVec 32))) )
))
(declare-fun thiss!957 () BitStream!636)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!3094 (= res!13366 (validate_offset_bit!0 ((_ sign_extend 32) (size!338 (buf!689 thiss!957))) ((_ sign_extend 32) (currentByte!1821 thiss!957)) ((_ sign_extend 32) (currentBit!1816 thiss!957))))))

(assert (=> start!3094 e!8670))

(declare-fun e!8672 () Bool)

(declare-fun inv!12 (BitStream!636) Bool)

(assert (=> start!3094 (and (inv!12 thiss!957) e!8672)))

(declare-fun b!14085 () Bool)

(declare-fun e!8674 () Bool)

(declare-fun e!8669 () Bool)

(assert (=> b!14085 (= e!8674 e!8669)))

(declare-fun res!13363 () Bool)

(assert (=> b!14085 (=> (not res!13363) (not e!8669))))

(declare-datatypes ((tuple2!1656 0))(
  ( (tuple2!1657 (_1!883 BitStream!636) (_2!883 Bool)) )
))
(declare-fun lt!21734 () tuple2!1656)

(declare-datatypes ((Unit!1141 0))(
  ( (Unit!1142) )
))
(declare-datatypes ((tuple2!1658 0))(
  ( (tuple2!1659 (_1!884 Unit!1141) (_2!884 BitStream!636)) )
))
(declare-fun lt!21729 () tuple2!1658)

(assert (=> b!14085 (= res!13363 (and (not (_2!883 lt!21734)) (= (_1!883 lt!21734) (_2!884 lt!21729))))))

(declare-fun readBitPure!0 (BitStream!636) tuple2!1656)

(declare-fun readerFrom!0 (BitStream!636 (_ BitVec 32) (_ BitVec 32)) BitStream!636)

(assert (=> b!14085 (= lt!21734 (readBitPure!0 (readerFrom!0 (_2!884 lt!21729) (currentBit!1816 thiss!957) (currentByte!1821 thiss!957))))))

(declare-fun b!14086 () Bool)

(declare-fun res!13364 () Bool)

(assert (=> b!14086 (=> (not res!13364) (not e!8674))))

(declare-fun isPrefixOf!0 (BitStream!636 BitStream!636) Bool)

(assert (=> b!14086 (= res!13364 (isPrefixOf!0 thiss!957 (_2!884 lt!21729)))))

(declare-fun b!14087 () Bool)

(declare-fun e!8673 () Bool)

(assert (=> b!14087 (= e!8670 (not e!8673))))

(declare-fun res!13365 () Bool)

(assert (=> b!14087 (=> res!13365 e!8673)))

(assert (=> b!14087 (= res!13365 (not (= (size!338 (buf!689 (_2!884 lt!21729))) (size!338 (buf!689 thiss!957)))))))

(declare-fun e!8671 () Bool)

(assert (=> b!14087 e!8671))

(declare-fun res!13361 () Bool)

(assert (=> b!14087 (=> (not res!13361) (not e!8671))))

(assert (=> b!14087 (= res!13361 (= (size!338 (buf!689 thiss!957)) (size!338 (buf!689 (_2!884 lt!21729)))))))

(declare-fun appendBit!0 (BitStream!636 Bool) tuple2!1658)

(assert (=> b!14087 (= lt!21729 (appendBit!0 thiss!957 false))))

(declare-fun b!14088 () Bool)

(declare-fun array_inv!327 (array!788) Bool)

(assert (=> b!14088 (= e!8672 (array_inv!327 (buf!689 thiss!957)))))

(declare-fun b!14089 () Bool)

(declare-fun lt!21732 () (_ BitVec 64))

(declare-fun lt!21730 () (_ BitVec 64))

(assert (=> b!14089 (= e!8673 (or (not (= lt!21732 #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!21732 (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!21730) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!14089 (= lt!21732 (bvand lt!21730 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!14089 (= lt!21730 (bitIndex!0 (size!338 (buf!689 thiss!957)) (currentByte!1821 thiss!957) (currentBit!1816 thiss!957)))))

(declare-fun b!14090 () Bool)

(declare-fun lt!21733 () (_ BitVec 64))

(assert (=> b!14090 (= e!8669 (= (bitIndex!0 (size!338 (buf!689 (_1!883 lt!21734))) (currentByte!1821 (_1!883 lt!21734)) (currentBit!1816 (_1!883 lt!21734))) lt!21733))))

(declare-fun b!14091 () Bool)

(assert (=> b!14091 (= e!8671 e!8674)))

(declare-fun res!13362 () Bool)

(assert (=> b!14091 (=> (not res!13362) (not e!8674))))

(declare-fun lt!21731 () (_ BitVec 64))

(assert (=> b!14091 (= res!13362 (= lt!21733 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!21731)))))

(assert (=> b!14091 (= lt!21733 (bitIndex!0 (size!338 (buf!689 (_2!884 lt!21729))) (currentByte!1821 (_2!884 lt!21729)) (currentBit!1816 (_2!884 lt!21729))))))

(assert (=> b!14091 (= lt!21731 (bitIndex!0 (size!338 (buf!689 thiss!957)) (currentByte!1821 thiss!957) (currentBit!1816 thiss!957)))))

(assert (= (and start!3094 res!13366) b!14087))

(assert (= (and b!14087 res!13361) b!14091))

(assert (= (and b!14091 res!13362) b!14086))

(assert (= (and b!14086 res!13364) b!14085))

(assert (= (and b!14085 res!13363) b!14090))

(assert (= (and b!14087 (not res!13365)) b!14089))

(assert (= start!3094 b!14088))

(declare-fun m!20597 () Bool)

(assert (=> b!14091 m!20597))

(declare-fun m!20599 () Bool)

(assert (=> b!14091 m!20599))

(declare-fun m!20601 () Bool)

(assert (=> b!14088 m!20601))

(declare-fun m!20603 () Bool)

(assert (=> start!3094 m!20603))

(declare-fun m!20605 () Bool)

(assert (=> start!3094 m!20605))

(declare-fun m!20607 () Bool)

(assert (=> b!14085 m!20607))

(assert (=> b!14085 m!20607))

(declare-fun m!20609 () Bool)

(assert (=> b!14085 m!20609))

(declare-fun m!20611 () Bool)

(assert (=> b!14087 m!20611))

(assert (=> b!14089 m!20599))

(declare-fun m!20613 () Bool)

(assert (=> b!14086 m!20613))

(declare-fun m!20615 () Bool)

(assert (=> b!14090 m!20615))

(check-sat (not b!14091) (not b!14087) (not b!14086) (not b!14089) (not start!3094) (not b!14090) (not b!14088) (not b!14085))
(check-sat)
(get-model)

(declare-fun d!4574 () Bool)

(declare-fun e!8705 () Bool)

(assert (=> d!4574 e!8705))

(declare-fun res!13400 () Bool)

(assert (=> d!4574 (=> (not res!13400) (not e!8705))))

(declare-fun lt!21779 () tuple2!1658)

(assert (=> d!4574 (= res!13400 (= (size!338 (buf!689 thiss!957)) (size!338 (buf!689 (_2!884 lt!21779)))))))

(declare-fun choose!16 (BitStream!636 Bool) tuple2!1658)

(assert (=> d!4574 (= lt!21779 (choose!16 thiss!957 false))))

(assert (=> d!4574 (validate_offset_bit!0 ((_ sign_extend 32) (size!338 (buf!689 thiss!957))) ((_ sign_extend 32) (currentByte!1821 thiss!957)) ((_ sign_extend 32) (currentBit!1816 thiss!957)))))

(assert (=> d!4574 (= (appendBit!0 thiss!957 false) lt!21779)))

(declare-fun b!14130 () Bool)

(declare-fun e!8704 () Bool)

(assert (=> b!14130 (= e!8705 e!8704)))

(declare-fun res!13402 () Bool)

(assert (=> b!14130 (=> (not res!13402) (not e!8704))))

(declare-fun lt!21781 () tuple2!1656)

(assert (=> b!14130 (= res!13402 (and (= (_2!883 lt!21781) false) (= (_1!883 lt!21781) (_2!884 lt!21779))))))

(assert (=> b!14130 (= lt!21781 (readBitPure!0 (readerFrom!0 (_2!884 lt!21779) (currentBit!1816 thiss!957) (currentByte!1821 thiss!957))))))

(declare-fun b!14131 () Bool)

(assert (=> b!14131 (= e!8704 (= (bitIndex!0 (size!338 (buf!689 (_1!883 lt!21781))) (currentByte!1821 (_1!883 lt!21781)) (currentBit!1816 (_1!883 lt!21781))) (bitIndex!0 (size!338 (buf!689 (_2!884 lt!21779))) (currentByte!1821 (_2!884 lt!21779)) (currentBit!1816 (_2!884 lt!21779)))))))

(declare-fun b!14129 () Bool)

(declare-fun res!13399 () Bool)

(assert (=> b!14129 (=> (not res!13399) (not e!8705))))

(assert (=> b!14129 (= res!13399 (isPrefixOf!0 thiss!957 (_2!884 lt!21779)))))

(declare-fun b!14128 () Bool)

(declare-fun res!13401 () Bool)

(assert (=> b!14128 (=> (not res!13401) (not e!8705))))

(declare-fun lt!21780 () (_ BitVec 64))

(declare-fun lt!21782 () (_ BitVec 64))

(assert (=> b!14128 (= res!13401 (= (bitIndex!0 (size!338 (buf!689 (_2!884 lt!21779))) (currentByte!1821 (_2!884 lt!21779)) (currentBit!1816 (_2!884 lt!21779))) (bvadd lt!21782 lt!21780)))))

(assert (=> b!14128 (or (not (= (bvand lt!21782 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21780 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!21782 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!21782 lt!21780) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!14128 (= lt!21780 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!14128 (= lt!21782 (bitIndex!0 (size!338 (buf!689 thiss!957)) (currentByte!1821 thiss!957) (currentBit!1816 thiss!957)))))

(assert (= (and d!4574 res!13400) b!14128))

(assert (= (and b!14128 res!13401) b!14129))

(assert (= (and b!14129 res!13399) b!14130))

(assert (= (and b!14130 res!13402) b!14131))

(declare-fun m!20641 () Bool)

(assert (=> b!14128 m!20641))

(assert (=> b!14128 m!20599))

(declare-fun m!20643 () Bool)

(assert (=> d!4574 m!20643))

(assert (=> d!4574 m!20603))

(declare-fun m!20645 () Bool)

(assert (=> b!14129 m!20645))

(declare-fun m!20647 () Bool)

(assert (=> b!14131 m!20647))

(assert (=> b!14131 m!20641))

(declare-fun m!20649 () Bool)

(assert (=> b!14130 m!20649))

(assert (=> b!14130 m!20649))

(declare-fun m!20651 () Bool)

(assert (=> b!14130 m!20651))

(assert (=> b!14087 d!4574))

(declare-fun d!4586 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!4586 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!338 (buf!689 thiss!957))) ((_ sign_extend 32) (currentByte!1821 thiss!957)) ((_ sign_extend 32) (currentBit!1816 thiss!957))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!338 (buf!689 thiss!957))) ((_ sign_extend 32) (currentByte!1821 thiss!957)) ((_ sign_extend 32) (currentBit!1816 thiss!957))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!1255 () Bool)

(assert (= bs!1255 d!4586))

(declare-fun m!20653 () Bool)

(assert (=> bs!1255 m!20653))

(assert (=> start!3094 d!4586))

(declare-fun d!4588 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!4588 (= (inv!12 thiss!957) (invariant!0 (currentBit!1816 thiss!957) (currentByte!1821 thiss!957) (size!338 (buf!689 thiss!957))))))

(declare-fun bs!1256 () Bool)

(assert (= bs!1256 d!4588))

(declare-fun m!20655 () Bool)

(assert (=> bs!1256 m!20655))

(assert (=> start!3094 d!4588))

(declare-fun d!4590 () Bool)

(declare-fun e!8711 () Bool)

(assert (=> d!4590 e!8711))

(declare-fun res!13414 () Bool)

(assert (=> d!4590 (=> (not res!13414) (not e!8711))))

(declare-fun lt!21815 () (_ BitVec 64))

(declare-fun lt!21816 () (_ BitVec 64))

(declare-fun lt!21814 () (_ BitVec 64))

(assert (=> d!4590 (= res!13414 (= lt!21816 (bvsub lt!21815 lt!21814)))))

(assert (=> d!4590 (or (= (bvand lt!21815 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21814 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!21815 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!21815 lt!21814) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4590 (= lt!21814 (remainingBits!0 ((_ sign_extend 32) (size!338 (buf!689 (_2!884 lt!21729)))) ((_ sign_extend 32) (currentByte!1821 (_2!884 lt!21729))) ((_ sign_extend 32) (currentBit!1816 (_2!884 lt!21729)))))))

(declare-fun lt!21813 () (_ BitVec 64))

(declare-fun lt!21818 () (_ BitVec 64))

(assert (=> d!4590 (= lt!21815 (bvmul lt!21813 lt!21818))))

(assert (=> d!4590 (or (= lt!21813 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!21818 (bvsdiv (bvmul lt!21813 lt!21818) lt!21813)))))

(assert (=> d!4590 (= lt!21818 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4590 (= lt!21813 ((_ sign_extend 32) (size!338 (buf!689 (_2!884 lt!21729)))))))

(assert (=> d!4590 (= lt!21816 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1821 (_2!884 lt!21729))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1816 (_2!884 lt!21729)))))))

(assert (=> d!4590 (invariant!0 (currentBit!1816 (_2!884 lt!21729)) (currentByte!1821 (_2!884 lt!21729)) (size!338 (buf!689 (_2!884 lt!21729))))))

(assert (=> d!4590 (= (bitIndex!0 (size!338 (buf!689 (_2!884 lt!21729))) (currentByte!1821 (_2!884 lt!21729)) (currentBit!1816 (_2!884 lt!21729))) lt!21816)))

(declare-fun b!14142 () Bool)

(declare-fun res!13413 () Bool)

(assert (=> b!14142 (=> (not res!13413) (not e!8711))))

(assert (=> b!14142 (= res!13413 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!21816))))

(declare-fun b!14143 () Bool)

(declare-fun lt!21817 () (_ BitVec 64))

(assert (=> b!14143 (= e!8711 (bvsle lt!21816 (bvmul lt!21817 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!14143 (or (= lt!21817 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!21817 #b0000000000000000000000000000000000000000000000000000000000001000) lt!21817)))))

(assert (=> b!14143 (= lt!21817 ((_ sign_extend 32) (size!338 (buf!689 (_2!884 lt!21729)))))))

(assert (= (and d!4590 res!13414) b!14142))

(assert (= (and b!14142 res!13413) b!14143))

(declare-fun m!20661 () Bool)

(assert (=> d!4590 m!20661))

(declare-fun m!20663 () Bool)

(assert (=> d!4590 m!20663))

(assert (=> b!14091 d!4590))

(declare-fun d!4594 () Bool)

(declare-fun e!8712 () Bool)

(assert (=> d!4594 e!8712))

(declare-fun res!13416 () Bool)

(assert (=> d!4594 (=> (not res!13416) (not e!8712))))

(declare-fun lt!21820 () (_ BitVec 64))

(declare-fun lt!21821 () (_ BitVec 64))

(declare-fun lt!21822 () (_ BitVec 64))

(assert (=> d!4594 (= res!13416 (= lt!21822 (bvsub lt!21821 lt!21820)))))

(assert (=> d!4594 (or (= (bvand lt!21821 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21820 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!21821 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!21821 lt!21820) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4594 (= lt!21820 (remainingBits!0 ((_ sign_extend 32) (size!338 (buf!689 thiss!957))) ((_ sign_extend 32) (currentByte!1821 thiss!957)) ((_ sign_extend 32) (currentBit!1816 thiss!957))))))

(declare-fun lt!21819 () (_ BitVec 64))

(declare-fun lt!21824 () (_ BitVec 64))

(assert (=> d!4594 (= lt!21821 (bvmul lt!21819 lt!21824))))

(assert (=> d!4594 (or (= lt!21819 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!21824 (bvsdiv (bvmul lt!21819 lt!21824) lt!21819)))))

(assert (=> d!4594 (= lt!21824 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4594 (= lt!21819 ((_ sign_extend 32) (size!338 (buf!689 thiss!957))))))

(assert (=> d!4594 (= lt!21822 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1821 thiss!957)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1816 thiss!957))))))

(assert (=> d!4594 (invariant!0 (currentBit!1816 thiss!957) (currentByte!1821 thiss!957) (size!338 (buf!689 thiss!957)))))

(assert (=> d!4594 (= (bitIndex!0 (size!338 (buf!689 thiss!957)) (currentByte!1821 thiss!957) (currentBit!1816 thiss!957)) lt!21822)))

(declare-fun b!14144 () Bool)

(declare-fun res!13415 () Bool)

(assert (=> b!14144 (=> (not res!13415) (not e!8712))))

(assert (=> b!14144 (= res!13415 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!21822))))

(declare-fun b!14145 () Bool)

(declare-fun lt!21823 () (_ BitVec 64))

(assert (=> b!14145 (= e!8712 (bvsle lt!21822 (bvmul lt!21823 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!14145 (or (= lt!21823 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!21823 #b0000000000000000000000000000000000000000000000000000000000001000) lt!21823)))))

(assert (=> b!14145 (= lt!21823 ((_ sign_extend 32) (size!338 (buf!689 thiss!957))))))

(assert (= (and d!4594 res!13416) b!14144))

(assert (= (and b!14144 res!13415) b!14145))

(assert (=> d!4594 m!20653))

(assert (=> d!4594 m!20655))

(assert (=> b!14091 d!4594))

(declare-fun d!4596 () Bool)

(declare-fun res!13436 () Bool)

(declare-fun e!8723 () Bool)

(assert (=> d!4596 (=> (not res!13436) (not e!8723))))

(assert (=> d!4596 (= res!13436 (= (size!338 (buf!689 thiss!957)) (size!338 (buf!689 (_2!884 lt!21729)))))))

(assert (=> d!4596 (= (isPrefixOf!0 thiss!957 (_2!884 lt!21729)) e!8723)))

(declare-fun b!14163 () Bool)

(declare-fun res!13435 () Bool)

(assert (=> b!14163 (=> (not res!13435) (not e!8723))))

(assert (=> b!14163 (= res!13435 (bvsle (bitIndex!0 (size!338 (buf!689 thiss!957)) (currentByte!1821 thiss!957) (currentBit!1816 thiss!957)) (bitIndex!0 (size!338 (buf!689 (_2!884 lt!21729))) (currentByte!1821 (_2!884 lt!21729)) (currentBit!1816 (_2!884 lt!21729)))))))

(declare-fun b!14165 () Bool)

(declare-fun e!8724 () Bool)

(assert (=> b!14165 (= e!8723 e!8724)))

(declare-fun res!13437 () Bool)

(assert (=> b!14165 (=> res!13437 e!8724)))

(assert (=> b!14165 (= res!13437 (= (size!338 (buf!689 thiss!957)) #b00000000000000000000000000000000))))

(declare-fun b!14167 () Bool)

(declare-fun arrayBitRangesEq!0 (array!788 array!788 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!14167 (= e!8724 (arrayBitRangesEq!0 (buf!689 thiss!957) (buf!689 (_2!884 lt!21729)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!338 (buf!689 thiss!957)) (currentByte!1821 thiss!957) (currentBit!1816 thiss!957))))))

(assert (= (and d!4596 res!13436) b!14163))

(assert (= (and b!14163 res!13435) b!14165))

(assert (= (and b!14165 (not res!13437)) b!14167))

(assert (=> b!14163 m!20599))

(assert (=> b!14163 m!20597))

(assert (=> b!14167 m!20599))

(assert (=> b!14167 m!20599))

(declare-fun m!20665 () Bool)

(assert (=> b!14167 m!20665))

(assert (=> b!14086 d!4596))

(declare-fun d!4598 () Bool)

(declare-fun e!8725 () Bool)

(assert (=> d!4598 e!8725))

(declare-fun res!13439 () Bool)

(assert (=> d!4598 (=> (not res!13439) (not e!8725))))

(declare-fun lt!21840 () (_ BitVec 64))

(declare-fun lt!21838 () (_ BitVec 64))

(declare-fun lt!21839 () (_ BitVec 64))

(assert (=> d!4598 (= res!13439 (= lt!21840 (bvsub lt!21839 lt!21838)))))

(assert (=> d!4598 (or (= (bvand lt!21839 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21838 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!21839 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!21839 lt!21838) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4598 (= lt!21838 (remainingBits!0 ((_ sign_extend 32) (size!338 (buf!689 (_1!883 lt!21734)))) ((_ sign_extend 32) (currentByte!1821 (_1!883 lt!21734))) ((_ sign_extend 32) (currentBit!1816 (_1!883 lt!21734)))))))

(declare-fun lt!21837 () (_ BitVec 64))

(declare-fun lt!21842 () (_ BitVec 64))

(assert (=> d!4598 (= lt!21839 (bvmul lt!21837 lt!21842))))

(assert (=> d!4598 (or (= lt!21837 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!21842 (bvsdiv (bvmul lt!21837 lt!21842) lt!21837)))))

(assert (=> d!4598 (= lt!21842 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4598 (= lt!21837 ((_ sign_extend 32) (size!338 (buf!689 (_1!883 lt!21734)))))))

(assert (=> d!4598 (= lt!21840 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1821 (_1!883 lt!21734))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1816 (_1!883 lt!21734)))))))

(assert (=> d!4598 (invariant!0 (currentBit!1816 (_1!883 lt!21734)) (currentByte!1821 (_1!883 lt!21734)) (size!338 (buf!689 (_1!883 lt!21734))))))

(assert (=> d!4598 (= (bitIndex!0 (size!338 (buf!689 (_1!883 lt!21734))) (currentByte!1821 (_1!883 lt!21734)) (currentBit!1816 (_1!883 lt!21734))) lt!21840)))

(declare-fun b!14168 () Bool)

(declare-fun res!13438 () Bool)

(assert (=> b!14168 (=> (not res!13438) (not e!8725))))

(assert (=> b!14168 (= res!13438 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!21840))))

(declare-fun b!14169 () Bool)

(declare-fun lt!21841 () (_ BitVec 64))

(assert (=> b!14169 (= e!8725 (bvsle lt!21840 (bvmul lt!21841 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!14169 (or (= lt!21841 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!21841 #b0000000000000000000000000000000000000000000000000000000000001000) lt!21841)))))

(assert (=> b!14169 (= lt!21841 ((_ sign_extend 32) (size!338 (buf!689 (_1!883 lt!21734)))))))

(assert (= (and d!4598 res!13439) b!14168))

(assert (= (and b!14168 res!13438) b!14169))

(declare-fun m!20679 () Bool)

(assert (=> d!4598 m!20679))

(declare-fun m!20681 () Bool)

(assert (=> d!4598 m!20681))

(assert (=> b!14090 d!4598))

(declare-fun d!4602 () Bool)

(declare-datatypes ((tuple2!1664 0))(
  ( (tuple2!1665 (_1!887 Bool) (_2!887 BitStream!636)) )
))
(declare-fun lt!21851 () tuple2!1664)

(declare-fun readBit!0 (BitStream!636) tuple2!1664)

(assert (=> d!4602 (= lt!21851 (readBit!0 (readerFrom!0 (_2!884 lt!21729) (currentBit!1816 thiss!957) (currentByte!1821 thiss!957))))))

(assert (=> d!4602 (= (readBitPure!0 (readerFrom!0 (_2!884 lt!21729) (currentBit!1816 thiss!957) (currentByte!1821 thiss!957))) (tuple2!1657 (_2!887 lt!21851) (_1!887 lt!21851)))))

(declare-fun bs!1257 () Bool)

(assert (= bs!1257 d!4602))

(assert (=> bs!1257 m!20607))

(declare-fun m!20687 () Bool)

(assert (=> bs!1257 m!20687))

(assert (=> b!14085 d!4602))

(declare-fun d!4606 () Bool)

(declare-fun e!8731 () Bool)

(assert (=> d!4606 e!8731))

(declare-fun res!13448 () Bool)

(assert (=> d!4606 (=> (not res!13448) (not e!8731))))

(assert (=> d!4606 (= res!13448 (invariant!0 (currentBit!1816 (_2!884 lt!21729)) (currentByte!1821 (_2!884 lt!21729)) (size!338 (buf!689 (_2!884 lt!21729)))))))

(assert (=> d!4606 (= (readerFrom!0 (_2!884 lt!21729) (currentBit!1816 thiss!957) (currentByte!1821 thiss!957)) (BitStream!637 (buf!689 (_2!884 lt!21729)) (currentByte!1821 thiss!957) (currentBit!1816 thiss!957)))))

(declare-fun b!14176 () Bool)

(assert (=> b!14176 (= e!8731 (invariant!0 (currentBit!1816 thiss!957) (currentByte!1821 thiss!957) (size!338 (buf!689 (_2!884 lt!21729)))))))

(assert (= (and d!4606 res!13448) b!14176))

(assert (=> d!4606 m!20663))

(declare-fun m!20691 () Bool)

(assert (=> b!14176 m!20691))

(assert (=> b!14085 d!4606))

(declare-fun d!4610 () Bool)

(assert (=> d!4610 (= (array_inv!327 (buf!689 thiss!957)) (bvsge (size!338 (buf!689 thiss!957)) #b00000000000000000000000000000000))))

(assert (=> b!14088 d!4610))

(assert (=> b!14089 d!4594))

(check-sat (not d!4586) (not d!4594) (not d!4590) (not b!14129) (not b!14130) (not d!4602) (not b!14167) (not d!4588) (not b!14163) (not d!4574) (not d!4598) (not d!4606) (not b!14176) (not b!14131) (not b!14128))
