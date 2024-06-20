; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53846 () Bool)

(assert start!53846)

(declare-fun b!250661 () Bool)

(declare-fun res!209871 () Bool)

(declare-fun e!173726 () Bool)

(assert (=> b!250661 (=> (not res!209871) (not e!173726))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> b!250661 (= res!209871 (bvslt from!289 nBits!297))))

(declare-fun b!250662 () Bool)

(declare-fun e!173730 () Bool)

(declare-datatypes ((array!13662 0))(
  ( (array!13663 (arr!6980 (Array (_ BitVec 32) (_ BitVec 8))) (size!5993 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10908 0))(
  ( (BitStream!10909 (buf!6489 array!13662) (currentByte!11929 (_ BitVec 32)) (currentBit!11924 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!21516 0))(
  ( (tuple2!21517 (_1!11683 BitStream!10908) (_2!11683 Bool)) )
))
(declare-fun lt!389433 () tuple2!21516)

(declare-datatypes ((tuple2!21518 0))(
  ( (tuple2!21519 (_1!11684 BitStream!10908) (_2!11684 BitStream!10908)) )
))
(declare-fun lt!389437 () tuple2!21518)

(assert (=> b!250662 (= e!173730 (not (or (not (_2!11683 lt!389433)) (not (= (_1!11683 lt!389433) (_2!11684 lt!389437))))))))

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10908 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21516)

(assert (=> b!250662 (= lt!389433 (checkBitsLoopPure!0 (_1!11684 lt!389437) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-datatypes ((Unit!18125 0))(
  ( (Unit!18126) )
))
(declare-datatypes ((tuple2!21520 0))(
  ( (tuple2!21521 (_1!11685 Unit!18125) (_2!11685 BitStream!10908)) )
))
(declare-fun lt!389440 () tuple2!21520)

(declare-fun lt!389441 () tuple2!21520)

(declare-fun lt!389438 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!250662 (validate_offset_bits!1 ((_ sign_extend 32) (size!5993 (buf!6489 (_2!11685 lt!389440)))) ((_ sign_extend 32) (currentByte!11929 (_2!11685 lt!389441))) ((_ sign_extend 32) (currentBit!11924 (_2!11685 lt!389441))) lt!389438)))

(declare-fun lt!389442 () Unit!18125)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10908 array!13662 (_ BitVec 64)) Unit!18125)

(assert (=> b!250662 (= lt!389442 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11685 lt!389441) (buf!6489 (_2!11685 lt!389440)) lt!389438))))

(declare-fun reader!0 (BitStream!10908 BitStream!10908) tuple2!21518)

(assert (=> b!250662 (= lt!389437 (reader!0 (_2!11685 lt!389441) (_2!11685 lt!389440)))))

(declare-fun b!250663 () Bool)

(declare-fun e!173731 () Bool)

(declare-fun e!173723 () Bool)

(assert (=> b!250663 (= e!173731 e!173723)))

(declare-fun res!209864 () Bool)

(assert (=> b!250663 (=> (not res!209864) (not e!173723))))

(declare-fun lt!389435 () (_ BitVec 64))

(declare-fun lt!389436 () (_ BitVec 64))

(assert (=> b!250663 (= res!209864 (= lt!389435 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!389436)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!250663 (= lt!389435 (bitIndex!0 (size!5993 (buf!6489 (_2!11685 lt!389441))) (currentByte!11929 (_2!11685 lt!389441)) (currentBit!11924 (_2!11685 lt!389441))))))

(declare-fun thiss!1005 () BitStream!10908)

(assert (=> b!250663 (= lt!389436 (bitIndex!0 (size!5993 (buf!6489 thiss!1005)) (currentByte!11929 thiss!1005) (currentBit!11924 thiss!1005)))))

(declare-fun res!209863 () Bool)

(assert (=> start!53846 (=> (not res!209863) (not e!173726))))

(assert (=> start!53846 (= res!209863 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53846 e!173726))

(assert (=> start!53846 true))

(declare-fun e!173728 () Bool)

(declare-fun inv!12 (BitStream!10908) Bool)

(assert (=> start!53846 (and (inv!12 thiss!1005) e!173728)))

(declare-fun b!250664 () Bool)

(declare-fun e!173725 () Bool)

(assert (=> b!250664 (= e!173726 (not e!173725))))

(declare-fun res!209874 () Bool)

(assert (=> b!250664 (=> res!209874 e!173725)))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!250664 (= res!209874 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!5993 (buf!6489 (_2!11685 lt!389441)))) ((_ sign_extend 32) (currentByte!11929 thiss!1005)) ((_ sign_extend 32) (currentBit!11924 thiss!1005)))))))

(declare-fun e!173729 () Bool)

(assert (=> b!250664 e!173729))

(declare-fun res!209872 () Bool)

(assert (=> b!250664 (=> (not res!209872) (not e!173729))))

(declare-fun isPrefixOf!0 (BitStream!10908 BitStream!10908) Bool)

(assert (=> b!250664 (= res!209872 (isPrefixOf!0 thiss!1005 (_2!11685 lt!389440)))))

(declare-fun lt!389439 () Unit!18125)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10908 BitStream!10908 BitStream!10908) Unit!18125)

(assert (=> b!250664 (= lt!389439 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11685 lt!389441) (_2!11685 lt!389440)))))

(declare-fun e!173724 () Bool)

(assert (=> b!250664 e!173724))

(declare-fun res!209866 () Bool)

(assert (=> b!250664 (=> (not res!209866) (not e!173724))))

(assert (=> b!250664 (= res!209866 (= (size!5993 (buf!6489 (_2!11685 lt!389441))) (size!5993 (buf!6489 (_2!11685 lt!389440)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10908 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21520)

(assert (=> b!250664 (= lt!389440 (appendNBitsLoop!0 (_2!11685 lt!389441) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!250664 (validate_offset_bits!1 ((_ sign_extend 32) (size!5993 (buf!6489 (_2!11685 lt!389441)))) ((_ sign_extend 32) (currentByte!11929 (_2!11685 lt!389441))) ((_ sign_extend 32) (currentBit!11924 (_2!11685 lt!389441))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!389434 () Unit!18125)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10908 BitStream!10908 (_ BitVec 64) (_ BitVec 64)) Unit!18125)

(assert (=> b!250664 (= lt!389434 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11685 lt!389441) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!250664 e!173731))

(declare-fun res!209868 () Bool)

(assert (=> b!250664 (=> (not res!209868) (not e!173731))))

(assert (=> b!250664 (= res!209868 (= (size!5993 (buf!6489 thiss!1005)) (size!5993 (buf!6489 (_2!11685 lt!389441)))))))

(declare-fun appendBit!0 (BitStream!10908 Bool) tuple2!21520)

(assert (=> b!250664 (= lt!389441 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!250665 () Bool)

(declare-fun e!173732 () Bool)

(assert (=> b!250665 (= e!173723 e!173732)))

(declare-fun res!209873 () Bool)

(assert (=> b!250665 (=> (not res!209873) (not e!173732))))

(declare-fun lt!389432 () tuple2!21516)

(assert (=> b!250665 (= res!209873 (and (= (_2!11683 lt!389432) bit!26) (= (_1!11683 lt!389432) (_2!11685 lt!389441))))))

(declare-fun readBitPure!0 (BitStream!10908) tuple2!21516)

(declare-fun readerFrom!0 (BitStream!10908 (_ BitVec 32) (_ BitVec 32)) BitStream!10908)

(assert (=> b!250665 (= lt!389432 (readBitPure!0 (readerFrom!0 (_2!11685 lt!389441) (currentBit!11924 thiss!1005) (currentByte!11929 thiss!1005))))))

(declare-fun b!250666 () Bool)

(declare-fun res!209869 () Bool)

(assert (=> b!250666 (=> (not res!209869) (not e!173723))))

(assert (=> b!250666 (= res!209869 (isPrefixOf!0 thiss!1005 (_2!11685 lt!389441)))))

(declare-fun b!250667 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!250667 (= e!173729 (invariant!0 (currentBit!11924 thiss!1005) (currentByte!11929 thiss!1005) (size!5993 (buf!6489 (_2!11685 lt!389441)))))))

(declare-fun b!250668 () Bool)

(assert (=> b!250668 (= e!173732 (= (bitIndex!0 (size!5993 (buf!6489 (_1!11683 lt!389432))) (currentByte!11929 (_1!11683 lt!389432)) (currentBit!11924 (_1!11683 lt!389432))) lt!389435))))

(declare-fun b!250669 () Bool)

(declare-fun array_inv!5734 (array!13662) Bool)

(assert (=> b!250669 (= e!173728 (array_inv!5734 (buf!6489 thiss!1005)))))

(declare-fun b!250670 () Bool)

(declare-fun arrayBitRangesEq!0 (array!13662 array!13662 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!250670 (= e!173725 (arrayBitRangesEq!0 (buf!6489 (_2!11685 lt!389441)) (buf!6489 (_2!11685 lt!389440)) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!5993 (buf!6489 (_2!11685 lt!389441))) (currentByte!11929 thiss!1005) (currentBit!11924 thiss!1005)))))))

(declare-fun b!250671 () Bool)

(assert (=> b!250671 (= e!173724 e!173730)))

(declare-fun res!209865 () Bool)

(assert (=> b!250671 (=> (not res!209865) (not e!173730))))

(assert (=> b!250671 (= res!209865 (= (bitIndex!0 (size!5993 (buf!6489 (_2!11685 lt!389440))) (currentByte!11929 (_2!11685 lt!389440)) (currentBit!11924 (_2!11685 lt!389440))) (bvadd (bitIndex!0 (size!5993 (buf!6489 (_2!11685 lt!389441))) (currentByte!11929 (_2!11685 lt!389441)) (currentBit!11924 (_2!11685 lt!389441))) lt!389438)))))

(assert (=> b!250671 (= lt!389438 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!250672 () Bool)

(declare-fun res!209867 () Bool)

(assert (=> b!250672 (=> (not res!209867) (not e!173730))))

(assert (=> b!250672 (= res!209867 (isPrefixOf!0 (_2!11685 lt!389441) (_2!11685 lt!389440)))))

(declare-fun b!250673 () Bool)

(declare-fun res!209870 () Bool)

(assert (=> b!250673 (=> (not res!209870) (not e!173726))))

(assert (=> b!250673 (= res!209870 (validate_offset_bits!1 ((_ sign_extend 32) (size!5993 (buf!6489 thiss!1005))) ((_ sign_extend 32) (currentByte!11929 thiss!1005)) ((_ sign_extend 32) (currentBit!11924 thiss!1005)) (bvsub nBits!297 from!289)))))

(assert (= (and start!53846 res!209863) b!250673))

(assert (= (and b!250673 res!209870) b!250661))

(assert (= (and b!250661 res!209871) b!250664))

(assert (= (and b!250664 res!209868) b!250663))

(assert (= (and b!250663 res!209864) b!250666))

(assert (= (and b!250666 res!209869) b!250665))

(assert (= (and b!250665 res!209873) b!250668))

(assert (= (and b!250664 res!209866) b!250671))

(assert (= (and b!250671 res!209865) b!250672))

(assert (= (and b!250672 res!209867) b!250662))

(assert (= (and b!250664 res!209872) b!250667))

(assert (= (and b!250664 (not res!209874)) b!250670))

(assert (= start!53846 b!250669))

(declare-fun m!377219 () Bool)

(assert (=> b!250670 m!377219))

(declare-fun m!377221 () Bool)

(assert (=> b!250670 m!377221))

(declare-fun m!377223 () Bool)

(assert (=> b!250669 m!377223))

(declare-fun m!377225 () Bool)

(assert (=> b!250663 m!377225))

(declare-fun m!377227 () Bool)

(assert (=> b!250663 m!377227))

(declare-fun m!377229 () Bool)

(assert (=> start!53846 m!377229))

(declare-fun m!377231 () Bool)

(assert (=> b!250662 m!377231))

(declare-fun m!377233 () Bool)

(assert (=> b!250662 m!377233))

(declare-fun m!377235 () Bool)

(assert (=> b!250662 m!377235))

(declare-fun m!377237 () Bool)

(assert (=> b!250662 m!377237))

(declare-fun m!377239 () Bool)

(assert (=> b!250672 m!377239))

(declare-fun m!377241 () Bool)

(assert (=> b!250665 m!377241))

(assert (=> b!250665 m!377241))

(declare-fun m!377243 () Bool)

(assert (=> b!250665 m!377243))

(declare-fun m!377245 () Bool)

(assert (=> b!250664 m!377245))

(declare-fun m!377247 () Bool)

(assert (=> b!250664 m!377247))

(declare-fun m!377249 () Bool)

(assert (=> b!250664 m!377249))

(declare-fun m!377251 () Bool)

(assert (=> b!250664 m!377251))

(declare-fun m!377253 () Bool)

(assert (=> b!250664 m!377253))

(declare-fun m!377255 () Bool)

(assert (=> b!250664 m!377255))

(declare-fun m!377257 () Bool)

(assert (=> b!250664 m!377257))

(declare-fun m!377259 () Bool)

(assert (=> b!250667 m!377259))

(declare-fun m!377261 () Bool)

(assert (=> b!250673 m!377261))

(declare-fun m!377263 () Bool)

(assert (=> b!250668 m!377263))

(declare-fun m!377265 () Bool)

(assert (=> b!250671 m!377265))

(assert (=> b!250671 m!377225))

(declare-fun m!377267 () Bool)

(assert (=> b!250666 m!377267))

(check-sat (not b!250662) (not b!250673) (not b!250666) (not b!250672) (not start!53846) (not b!250665) (not b!250663) (not b!250670) (not b!250668) (not b!250667) (not b!250669) (not b!250664) (not b!250671))
(check-sat)
(get-model)

(declare-fun d!83900 () Bool)

(declare-fun e!173765 () Bool)

(assert (=> d!83900 e!173765))

(declare-fun res!209916 () Bool)

(assert (=> d!83900 (=> (not res!209916) (not e!173765))))

(declare-fun lt!389493 () (_ BitVec 64))

(declare-fun lt!389488 () (_ BitVec 64))

(declare-fun lt!389491 () (_ BitVec 64))

(assert (=> d!83900 (= res!209916 (= lt!389488 (bvsub lt!389491 lt!389493)))))

(assert (=> d!83900 (or (= (bvand lt!389491 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!389493 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!389491 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!389491 lt!389493) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!83900 (= lt!389493 (remainingBits!0 ((_ sign_extend 32) (size!5993 (buf!6489 (_2!11685 lt!389441)))) ((_ sign_extend 32) (currentByte!11929 (_2!11685 lt!389441))) ((_ sign_extend 32) (currentBit!11924 (_2!11685 lt!389441)))))))

(declare-fun lt!389492 () (_ BitVec 64))

(declare-fun lt!389490 () (_ BitVec 64))

(assert (=> d!83900 (= lt!389491 (bvmul lt!389492 lt!389490))))

(assert (=> d!83900 (or (= lt!389492 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!389490 (bvsdiv (bvmul lt!389492 lt!389490) lt!389492)))))

(assert (=> d!83900 (= lt!389490 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!83900 (= lt!389492 ((_ sign_extend 32) (size!5993 (buf!6489 (_2!11685 lt!389441)))))))

(assert (=> d!83900 (= lt!389488 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11929 (_2!11685 lt!389441))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11924 (_2!11685 lt!389441)))))))

(assert (=> d!83900 (invariant!0 (currentBit!11924 (_2!11685 lt!389441)) (currentByte!11929 (_2!11685 lt!389441)) (size!5993 (buf!6489 (_2!11685 lt!389441))))))

(assert (=> d!83900 (= (bitIndex!0 (size!5993 (buf!6489 (_2!11685 lt!389441))) (currentByte!11929 (_2!11685 lt!389441)) (currentBit!11924 (_2!11685 lt!389441))) lt!389488)))

(declare-fun b!250717 () Bool)

(declare-fun res!209915 () Bool)

(assert (=> b!250717 (=> (not res!209915) (not e!173765))))

(assert (=> b!250717 (= res!209915 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!389488))))

(declare-fun b!250718 () Bool)

(declare-fun lt!389489 () (_ BitVec 64))

(assert (=> b!250718 (= e!173765 (bvsle lt!389488 (bvmul lt!389489 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!250718 (or (= lt!389489 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!389489 #b0000000000000000000000000000000000000000000000000000000000001000) lt!389489)))))

(assert (=> b!250718 (= lt!389489 ((_ sign_extend 32) (size!5993 (buf!6489 (_2!11685 lt!389441)))))))

(assert (= (and d!83900 res!209916) b!250717))

(assert (= (and b!250717 res!209915) b!250718))

(declare-fun m!377319 () Bool)

(assert (=> d!83900 m!377319))

(declare-fun m!377321 () Bool)

(assert (=> d!83900 m!377321))

(assert (=> b!250663 d!83900))

(declare-fun d!83902 () Bool)

(declare-fun e!173766 () Bool)

(assert (=> d!83902 e!173766))

(declare-fun res!209918 () Bool)

(assert (=> d!83902 (=> (not res!209918) (not e!173766))))

(declare-fun lt!389497 () (_ BitVec 64))

(declare-fun lt!389494 () (_ BitVec 64))

(declare-fun lt!389499 () (_ BitVec 64))

(assert (=> d!83902 (= res!209918 (= lt!389494 (bvsub lt!389497 lt!389499)))))

(assert (=> d!83902 (or (= (bvand lt!389497 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!389499 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!389497 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!389497 lt!389499) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83902 (= lt!389499 (remainingBits!0 ((_ sign_extend 32) (size!5993 (buf!6489 thiss!1005))) ((_ sign_extend 32) (currentByte!11929 thiss!1005)) ((_ sign_extend 32) (currentBit!11924 thiss!1005))))))

(declare-fun lt!389498 () (_ BitVec 64))

(declare-fun lt!389496 () (_ BitVec 64))

(assert (=> d!83902 (= lt!389497 (bvmul lt!389498 lt!389496))))

(assert (=> d!83902 (or (= lt!389498 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!389496 (bvsdiv (bvmul lt!389498 lt!389496) lt!389498)))))

(assert (=> d!83902 (= lt!389496 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!83902 (= lt!389498 ((_ sign_extend 32) (size!5993 (buf!6489 thiss!1005))))))

(assert (=> d!83902 (= lt!389494 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11929 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11924 thiss!1005))))))

(assert (=> d!83902 (invariant!0 (currentBit!11924 thiss!1005) (currentByte!11929 thiss!1005) (size!5993 (buf!6489 thiss!1005)))))

(assert (=> d!83902 (= (bitIndex!0 (size!5993 (buf!6489 thiss!1005)) (currentByte!11929 thiss!1005) (currentBit!11924 thiss!1005)) lt!389494)))

(declare-fun b!250719 () Bool)

(declare-fun res!209917 () Bool)

(assert (=> b!250719 (=> (not res!209917) (not e!173766))))

(assert (=> b!250719 (= res!209917 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!389494))))

(declare-fun b!250720 () Bool)

(declare-fun lt!389495 () (_ BitVec 64))

(assert (=> b!250720 (= e!173766 (bvsle lt!389494 (bvmul lt!389495 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!250720 (or (= lt!389495 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!389495 #b0000000000000000000000000000000000000000000000000000000000001000) lt!389495)))))

(assert (=> b!250720 (= lt!389495 ((_ sign_extend 32) (size!5993 (buf!6489 thiss!1005))))))

(assert (= (and d!83902 res!209918) b!250719))

(assert (= (and b!250719 res!209917) b!250720))

(declare-fun m!377323 () Bool)

(assert (=> d!83902 m!377323))

(declare-fun m!377325 () Bool)

(assert (=> d!83902 m!377325))

(assert (=> b!250663 d!83902))

(declare-fun d!83904 () Bool)

(assert (=> d!83904 (= (inv!12 thiss!1005) (invariant!0 (currentBit!11924 thiss!1005) (currentByte!11929 thiss!1005) (size!5993 (buf!6489 thiss!1005))))))

(declare-fun bs!21263 () Bool)

(assert (= bs!21263 d!83904))

(assert (=> bs!21263 m!377325))

(assert (=> start!53846 d!83904))

(declare-fun d!83906 () Bool)

(declare-fun res!209927 () Bool)

(declare-fun e!173771 () Bool)

(assert (=> d!83906 (=> (not res!209927) (not e!173771))))

(assert (=> d!83906 (= res!209927 (= (size!5993 (buf!6489 (_2!11685 lt!389441))) (size!5993 (buf!6489 (_2!11685 lt!389440)))))))

(assert (=> d!83906 (= (isPrefixOf!0 (_2!11685 lt!389441) (_2!11685 lt!389440)) e!173771)))

(declare-fun b!250727 () Bool)

(declare-fun res!209926 () Bool)

(assert (=> b!250727 (=> (not res!209926) (not e!173771))))

(assert (=> b!250727 (= res!209926 (bvsle (bitIndex!0 (size!5993 (buf!6489 (_2!11685 lt!389441))) (currentByte!11929 (_2!11685 lt!389441)) (currentBit!11924 (_2!11685 lt!389441))) (bitIndex!0 (size!5993 (buf!6489 (_2!11685 lt!389440))) (currentByte!11929 (_2!11685 lt!389440)) (currentBit!11924 (_2!11685 lt!389440)))))))

(declare-fun b!250728 () Bool)

(declare-fun e!173772 () Bool)

(assert (=> b!250728 (= e!173771 e!173772)))

(declare-fun res!209925 () Bool)

(assert (=> b!250728 (=> res!209925 e!173772)))

(assert (=> b!250728 (= res!209925 (= (size!5993 (buf!6489 (_2!11685 lt!389441))) #b00000000000000000000000000000000))))

(declare-fun b!250729 () Bool)

(assert (=> b!250729 (= e!173772 (arrayBitRangesEq!0 (buf!6489 (_2!11685 lt!389441)) (buf!6489 (_2!11685 lt!389440)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5993 (buf!6489 (_2!11685 lt!389441))) (currentByte!11929 (_2!11685 lt!389441)) (currentBit!11924 (_2!11685 lt!389441)))))))

(assert (= (and d!83906 res!209927) b!250727))

(assert (= (and b!250727 res!209926) b!250728))

(assert (= (and b!250728 (not res!209925)) b!250729))

(assert (=> b!250727 m!377225))

(assert (=> b!250727 m!377265))

(assert (=> b!250729 m!377225))

(assert (=> b!250729 m!377225))

(declare-fun m!377327 () Bool)

(assert (=> b!250729 m!377327))

(assert (=> b!250672 d!83906))

(declare-fun d!83908 () Bool)

(assert (=> d!83908 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5993 (buf!6489 thiss!1005))) ((_ sign_extend 32) (currentByte!11929 thiss!1005)) ((_ sign_extend 32) (currentBit!11924 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5993 (buf!6489 thiss!1005))) ((_ sign_extend 32) (currentByte!11929 thiss!1005)) ((_ sign_extend 32) (currentBit!11924 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!21264 () Bool)

(assert (= bs!21264 d!83908))

(assert (=> bs!21264 m!377323))

(assert (=> b!250673 d!83908))

(declare-fun d!83910 () Bool)

(declare-datatypes ((tuple2!21528 0))(
  ( (tuple2!21529 (_1!11689 Bool) (_2!11689 BitStream!10908)) )
))
(declare-fun lt!389502 () tuple2!21528)

(declare-fun checkBitsLoop!0 (BitStream!10908 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21528)

(assert (=> d!83910 (= lt!389502 (checkBitsLoop!0 (_1!11684 lt!389437) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!83910 (= (checkBitsLoopPure!0 (_1!11684 lt!389437) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21517 (_2!11689 lt!389502) (_1!11689 lt!389502)))))

(declare-fun bs!21265 () Bool)

(assert (= bs!21265 d!83910))

(declare-fun m!377329 () Bool)

(assert (=> bs!21265 m!377329))

(assert (=> b!250662 d!83910))

(declare-fun d!83912 () Bool)

(assert (=> d!83912 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5993 (buf!6489 (_2!11685 lt!389440)))) ((_ sign_extend 32) (currentByte!11929 (_2!11685 lt!389441))) ((_ sign_extend 32) (currentBit!11924 (_2!11685 lt!389441))) lt!389438) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5993 (buf!6489 (_2!11685 lt!389440)))) ((_ sign_extend 32) (currentByte!11929 (_2!11685 lt!389441))) ((_ sign_extend 32) (currentBit!11924 (_2!11685 lt!389441)))) lt!389438))))

(declare-fun bs!21266 () Bool)

(assert (= bs!21266 d!83912))

(declare-fun m!377331 () Bool)

(assert (=> bs!21266 m!377331))

(assert (=> b!250662 d!83912))

(declare-fun d!83914 () Bool)

(assert (=> d!83914 (validate_offset_bits!1 ((_ sign_extend 32) (size!5993 (buf!6489 (_2!11685 lt!389440)))) ((_ sign_extend 32) (currentByte!11929 (_2!11685 lt!389441))) ((_ sign_extend 32) (currentBit!11924 (_2!11685 lt!389441))) lt!389438)))

(declare-fun lt!389505 () Unit!18125)

(declare-fun choose!9 (BitStream!10908 array!13662 (_ BitVec 64) BitStream!10908) Unit!18125)

(assert (=> d!83914 (= lt!389505 (choose!9 (_2!11685 lt!389441) (buf!6489 (_2!11685 lt!389440)) lt!389438 (BitStream!10909 (buf!6489 (_2!11685 lt!389440)) (currentByte!11929 (_2!11685 lt!389441)) (currentBit!11924 (_2!11685 lt!389441)))))))

(assert (=> d!83914 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11685 lt!389441) (buf!6489 (_2!11685 lt!389440)) lt!389438) lt!389505)))

(declare-fun bs!21267 () Bool)

(assert (= bs!21267 d!83914))

(assert (=> bs!21267 m!377233))

(declare-fun m!377333 () Bool)

(assert (=> bs!21267 m!377333))

(assert (=> b!250662 d!83914))

(declare-fun b!250740 () Bool)

(declare-fun res!209936 () Bool)

(declare-fun e!173777 () Bool)

(assert (=> b!250740 (=> (not res!209936) (not e!173777))))

(declare-fun lt!389565 () tuple2!21518)

(assert (=> b!250740 (= res!209936 (isPrefixOf!0 (_2!11684 lt!389565) (_2!11685 lt!389440)))))

(declare-fun d!83916 () Bool)

(assert (=> d!83916 e!173777))

(declare-fun res!209934 () Bool)

(assert (=> d!83916 (=> (not res!209934) (not e!173777))))

(assert (=> d!83916 (= res!209934 (isPrefixOf!0 (_1!11684 lt!389565) (_2!11684 lt!389565)))))

(declare-fun lt!389560 () BitStream!10908)

(assert (=> d!83916 (= lt!389565 (tuple2!21519 lt!389560 (_2!11685 lt!389440)))))

(declare-fun lt!389547 () Unit!18125)

(declare-fun lt!389546 () Unit!18125)

(assert (=> d!83916 (= lt!389547 lt!389546)))

(assert (=> d!83916 (isPrefixOf!0 lt!389560 (_2!11685 lt!389440))))

(assert (=> d!83916 (= lt!389546 (lemmaIsPrefixTransitive!0 lt!389560 (_2!11685 lt!389440) (_2!11685 lt!389440)))))

(declare-fun lt!389551 () Unit!18125)

(declare-fun lt!389559 () Unit!18125)

(assert (=> d!83916 (= lt!389551 lt!389559)))

(assert (=> d!83916 (isPrefixOf!0 lt!389560 (_2!11685 lt!389440))))

(assert (=> d!83916 (= lt!389559 (lemmaIsPrefixTransitive!0 lt!389560 (_2!11685 lt!389441) (_2!11685 lt!389440)))))

(declare-fun lt!389557 () Unit!18125)

(declare-fun e!173778 () Unit!18125)

(assert (=> d!83916 (= lt!389557 e!173778)))

(declare-fun c!11599 () Bool)

(assert (=> d!83916 (= c!11599 (not (= (size!5993 (buf!6489 (_2!11685 lt!389441))) #b00000000000000000000000000000000)))))

(declare-fun lt!389563 () Unit!18125)

(declare-fun lt!389548 () Unit!18125)

(assert (=> d!83916 (= lt!389563 lt!389548)))

(assert (=> d!83916 (isPrefixOf!0 (_2!11685 lt!389440) (_2!11685 lt!389440))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10908) Unit!18125)

(assert (=> d!83916 (= lt!389548 (lemmaIsPrefixRefl!0 (_2!11685 lt!389440)))))

(declare-fun lt!389564 () Unit!18125)

(declare-fun lt!389549 () Unit!18125)

(assert (=> d!83916 (= lt!389564 lt!389549)))

(assert (=> d!83916 (= lt!389549 (lemmaIsPrefixRefl!0 (_2!11685 lt!389440)))))

(declare-fun lt!389553 () Unit!18125)

(declare-fun lt!389554 () Unit!18125)

(assert (=> d!83916 (= lt!389553 lt!389554)))

(assert (=> d!83916 (isPrefixOf!0 lt!389560 lt!389560)))

(assert (=> d!83916 (= lt!389554 (lemmaIsPrefixRefl!0 lt!389560))))

(declare-fun lt!389558 () Unit!18125)

(declare-fun lt!389556 () Unit!18125)

(assert (=> d!83916 (= lt!389558 lt!389556)))

(assert (=> d!83916 (isPrefixOf!0 (_2!11685 lt!389441) (_2!11685 lt!389441))))

(assert (=> d!83916 (= lt!389556 (lemmaIsPrefixRefl!0 (_2!11685 lt!389441)))))

(assert (=> d!83916 (= lt!389560 (BitStream!10909 (buf!6489 (_2!11685 lt!389440)) (currentByte!11929 (_2!11685 lt!389441)) (currentBit!11924 (_2!11685 lt!389441))))))

(assert (=> d!83916 (isPrefixOf!0 (_2!11685 lt!389441) (_2!11685 lt!389440))))

(assert (=> d!83916 (= (reader!0 (_2!11685 lt!389441) (_2!11685 lt!389440)) lt!389565)))

(declare-fun lt!389555 () (_ BitVec 64))

(declare-fun b!250741 () Bool)

(declare-fun lt!389550 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!10908 (_ BitVec 64)) BitStream!10908)

(assert (=> b!250741 (= e!173777 (= (_1!11684 lt!389565) (withMovedBitIndex!0 (_2!11684 lt!389565) (bvsub lt!389550 lt!389555))))))

(assert (=> b!250741 (or (= (bvand lt!389550 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!389555 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!389550 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!389550 lt!389555) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!250741 (= lt!389555 (bitIndex!0 (size!5993 (buf!6489 (_2!11685 lt!389440))) (currentByte!11929 (_2!11685 lt!389440)) (currentBit!11924 (_2!11685 lt!389440))))))

(assert (=> b!250741 (= lt!389550 (bitIndex!0 (size!5993 (buf!6489 (_2!11685 lt!389441))) (currentByte!11929 (_2!11685 lt!389441)) (currentBit!11924 (_2!11685 lt!389441))))))

(declare-fun b!250742 () Bool)

(declare-fun Unit!18129 () Unit!18125)

(assert (=> b!250742 (= e!173778 Unit!18129)))

(declare-fun b!250743 () Bool)

(declare-fun res!209935 () Bool)

(assert (=> b!250743 (=> (not res!209935) (not e!173777))))

(assert (=> b!250743 (= res!209935 (isPrefixOf!0 (_1!11684 lt!389565) (_2!11685 lt!389441)))))

(declare-fun b!250744 () Bool)

(declare-fun lt!389552 () Unit!18125)

(assert (=> b!250744 (= e!173778 lt!389552)))

(declare-fun lt!389561 () (_ BitVec 64))

(assert (=> b!250744 (= lt!389561 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!389562 () (_ BitVec 64))

(assert (=> b!250744 (= lt!389562 (bitIndex!0 (size!5993 (buf!6489 (_2!11685 lt!389441))) (currentByte!11929 (_2!11685 lt!389441)) (currentBit!11924 (_2!11685 lt!389441))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!13662 array!13662 (_ BitVec 64) (_ BitVec 64)) Unit!18125)

(assert (=> b!250744 (= lt!389552 (arrayBitRangesEqSymmetric!0 (buf!6489 (_2!11685 lt!389441)) (buf!6489 (_2!11685 lt!389440)) lt!389561 lt!389562))))

(assert (=> b!250744 (arrayBitRangesEq!0 (buf!6489 (_2!11685 lt!389440)) (buf!6489 (_2!11685 lt!389441)) lt!389561 lt!389562)))

(assert (= (and d!83916 c!11599) b!250744))

(assert (= (and d!83916 (not c!11599)) b!250742))

(assert (= (and d!83916 res!209934) b!250743))

(assert (= (and b!250743 res!209935) b!250740))

(assert (= (and b!250740 res!209936) b!250741))

(declare-fun m!377335 () Bool)

(assert (=> b!250743 m!377335))

(declare-fun m!377337 () Bool)

(assert (=> b!250741 m!377337))

(assert (=> b!250741 m!377265))

(assert (=> b!250741 m!377225))

(declare-fun m!377339 () Bool)

(assert (=> d!83916 m!377339))

(declare-fun m!377341 () Bool)

(assert (=> d!83916 m!377341))

(declare-fun m!377343 () Bool)

(assert (=> d!83916 m!377343))

(declare-fun m!377345 () Bool)

(assert (=> d!83916 m!377345))

(declare-fun m!377347 () Bool)

(assert (=> d!83916 m!377347))

(declare-fun m!377349 () Bool)

(assert (=> d!83916 m!377349))

(declare-fun m!377351 () Bool)

(assert (=> d!83916 m!377351))

(declare-fun m!377353 () Bool)

(assert (=> d!83916 m!377353))

(declare-fun m!377355 () Bool)

(assert (=> d!83916 m!377355))

(declare-fun m!377357 () Bool)

(assert (=> d!83916 m!377357))

(assert (=> d!83916 m!377239))

(assert (=> b!250744 m!377225))

(declare-fun m!377359 () Bool)

(assert (=> b!250744 m!377359))

(declare-fun m!377361 () Bool)

(assert (=> b!250744 m!377361))

(declare-fun m!377363 () Bool)

(assert (=> b!250740 m!377363))

(assert (=> b!250662 d!83916))

(declare-fun d!83918 () Bool)

(declare-fun res!209939 () Bool)

(declare-fun e!173779 () Bool)

(assert (=> d!83918 (=> (not res!209939) (not e!173779))))

(assert (=> d!83918 (= res!209939 (= (size!5993 (buf!6489 thiss!1005)) (size!5993 (buf!6489 (_2!11685 lt!389441)))))))

(assert (=> d!83918 (= (isPrefixOf!0 thiss!1005 (_2!11685 lt!389441)) e!173779)))

(declare-fun b!250745 () Bool)

(declare-fun res!209938 () Bool)

(assert (=> b!250745 (=> (not res!209938) (not e!173779))))

(assert (=> b!250745 (= res!209938 (bvsle (bitIndex!0 (size!5993 (buf!6489 thiss!1005)) (currentByte!11929 thiss!1005) (currentBit!11924 thiss!1005)) (bitIndex!0 (size!5993 (buf!6489 (_2!11685 lt!389441))) (currentByte!11929 (_2!11685 lt!389441)) (currentBit!11924 (_2!11685 lt!389441)))))))

(declare-fun b!250746 () Bool)

(declare-fun e!173780 () Bool)

(assert (=> b!250746 (= e!173779 e!173780)))

(declare-fun res!209937 () Bool)

(assert (=> b!250746 (=> res!209937 e!173780)))

(assert (=> b!250746 (= res!209937 (= (size!5993 (buf!6489 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!250747 () Bool)

(assert (=> b!250747 (= e!173780 (arrayBitRangesEq!0 (buf!6489 thiss!1005) (buf!6489 (_2!11685 lt!389441)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5993 (buf!6489 thiss!1005)) (currentByte!11929 thiss!1005) (currentBit!11924 thiss!1005))))))

(assert (= (and d!83918 res!209939) b!250745))

(assert (= (and b!250745 res!209938) b!250746))

(assert (= (and b!250746 (not res!209937)) b!250747))

(assert (=> b!250745 m!377227))

(assert (=> b!250745 m!377225))

(assert (=> b!250747 m!377227))

(assert (=> b!250747 m!377227))

(declare-fun m!377365 () Bool)

(assert (=> b!250747 m!377365))

(assert (=> b!250666 d!83918))

(declare-fun d!83920 () Bool)

(assert (=> d!83920 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5993 (buf!6489 (_2!11685 lt!389441)))) ((_ sign_extend 32) (currentByte!11929 (_2!11685 lt!389441))) ((_ sign_extend 32) (currentBit!11924 (_2!11685 lt!389441))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5993 (buf!6489 (_2!11685 lt!389441)))) ((_ sign_extend 32) (currentByte!11929 (_2!11685 lt!389441))) ((_ sign_extend 32) (currentBit!11924 (_2!11685 lt!389441)))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!21268 () Bool)

(assert (= bs!21268 d!83920))

(assert (=> bs!21268 m!377319))

(assert (=> b!250664 d!83920))

(declare-fun d!83922 () Bool)

(assert (=> d!83922 (isPrefixOf!0 thiss!1005 (_2!11685 lt!389440))))

(declare-fun lt!389568 () Unit!18125)

(declare-fun choose!30 (BitStream!10908 BitStream!10908 BitStream!10908) Unit!18125)

(assert (=> d!83922 (= lt!389568 (choose!30 thiss!1005 (_2!11685 lt!389441) (_2!11685 lt!389440)))))

(assert (=> d!83922 (isPrefixOf!0 thiss!1005 (_2!11685 lt!389441))))

(assert (=> d!83922 (= (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11685 lt!389441) (_2!11685 lt!389440)) lt!389568)))

(declare-fun bs!21269 () Bool)

(assert (= bs!21269 d!83922))

(assert (=> bs!21269 m!377245))

(declare-fun m!377367 () Bool)

(assert (=> bs!21269 m!377367))

(assert (=> bs!21269 m!377267))

(assert (=> b!250664 d!83922))

(declare-fun d!83924 () Bool)

(declare-fun e!173783 () Bool)

(assert (=> d!83924 e!173783))

(declare-fun res!209942 () Bool)

(assert (=> d!83924 (=> (not res!209942) (not e!173783))))

(assert (=> d!83924 (= res!209942 (or (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!389571 () Unit!18125)

(declare-fun choose!27 (BitStream!10908 BitStream!10908 (_ BitVec 64) (_ BitVec 64)) Unit!18125)

(assert (=> d!83924 (= lt!389571 (choose!27 thiss!1005 (_2!11685 lt!389441) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!83924 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!297 from!289)))))

(assert (=> d!83924 (= (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11685 lt!389441) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) lt!389571)))

(declare-fun b!250750 () Bool)

(assert (=> b!250750 (= e!173783 (validate_offset_bits!1 ((_ sign_extend 32) (size!5993 (buf!6489 (_2!11685 lt!389441)))) ((_ sign_extend 32) (currentByte!11929 (_2!11685 lt!389441))) ((_ sign_extend 32) (currentBit!11924 (_2!11685 lt!389441))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!83924 res!209942) b!250750))

(declare-fun m!377369 () Bool)

(assert (=> d!83924 m!377369))

(assert (=> b!250750 m!377251))

(assert (=> b!250664 d!83924))

(declare-fun b!250763 () Bool)

(declare-fun e!173788 () Bool)

(declare-fun lt!389581 () tuple2!21516)

(declare-fun lt!389583 () tuple2!21520)

(assert (=> b!250763 (= e!173788 (= (bitIndex!0 (size!5993 (buf!6489 (_1!11683 lt!389581))) (currentByte!11929 (_1!11683 lt!389581)) (currentBit!11924 (_1!11683 lt!389581))) (bitIndex!0 (size!5993 (buf!6489 (_2!11685 lt!389583))) (currentByte!11929 (_2!11685 lt!389583)) (currentBit!11924 (_2!11685 lt!389583)))))))

(declare-fun b!250762 () Bool)

(declare-fun e!173789 () Bool)

(assert (=> b!250762 (= e!173789 e!173788)))

(declare-fun res!209954 () Bool)

(assert (=> b!250762 (=> (not res!209954) (not e!173788))))

(assert (=> b!250762 (= res!209954 (and (= (_2!11683 lt!389581) bit!26) (= (_1!11683 lt!389581) (_2!11685 lt!389583))))))

(assert (=> b!250762 (= lt!389581 (readBitPure!0 (readerFrom!0 (_2!11685 lt!389583) (currentBit!11924 thiss!1005) (currentByte!11929 thiss!1005))))))

(declare-fun d!83926 () Bool)

(assert (=> d!83926 e!173789))

(declare-fun res!209952 () Bool)

(assert (=> d!83926 (=> (not res!209952) (not e!173789))))

(assert (=> d!83926 (= res!209952 (= (size!5993 (buf!6489 thiss!1005)) (size!5993 (buf!6489 (_2!11685 lt!389583)))))))

(declare-fun choose!16 (BitStream!10908 Bool) tuple2!21520)

(assert (=> d!83926 (= lt!389583 (choose!16 thiss!1005 bit!26))))

(assert (=> d!83926 (validate_offset_bit!0 ((_ sign_extend 32) (size!5993 (buf!6489 thiss!1005))) ((_ sign_extend 32) (currentByte!11929 thiss!1005)) ((_ sign_extend 32) (currentBit!11924 thiss!1005)))))

(assert (=> d!83926 (= (appendBit!0 thiss!1005 bit!26) lt!389583)))

(declare-fun b!250760 () Bool)

(declare-fun res!209951 () Bool)

(assert (=> b!250760 (=> (not res!209951) (not e!173789))))

(declare-fun lt!389580 () (_ BitVec 64))

(declare-fun lt!389582 () (_ BitVec 64))

(assert (=> b!250760 (= res!209951 (= (bitIndex!0 (size!5993 (buf!6489 (_2!11685 lt!389583))) (currentByte!11929 (_2!11685 lt!389583)) (currentBit!11924 (_2!11685 lt!389583))) (bvadd lt!389580 lt!389582)))))

(assert (=> b!250760 (or (not (= (bvand lt!389580 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!389582 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!389580 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!389580 lt!389582) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!250760 (= lt!389582 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!250760 (= lt!389580 (bitIndex!0 (size!5993 (buf!6489 thiss!1005)) (currentByte!11929 thiss!1005) (currentBit!11924 thiss!1005)))))

(declare-fun b!250761 () Bool)

(declare-fun res!209953 () Bool)

(assert (=> b!250761 (=> (not res!209953) (not e!173789))))

(assert (=> b!250761 (= res!209953 (isPrefixOf!0 thiss!1005 (_2!11685 lt!389583)))))

(assert (= (and d!83926 res!209952) b!250760))

(assert (= (and b!250760 res!209951) b!250761))

(assert (= (and b!250761 res!209953) b!250762))

(assert (= (and b!250762 res!209954) b!250763))

(declare-fun m!377371 () Bool)

(assert (=> d!83926 m!377371))

(declare-fun m!377373 () Bool)

(assert (=> d!83926 m!377373))

(declare-fun m!377375 () Bool)

(assert (=> b!250763 m!377375))

(declare-fun m!377377 () Bool)

(assert (=> b!250763 m!377377))

(declare-fun m!377379 () Bool)

(assert (=> b!250761 m!377379))

(declare-fun m!377381 () Bool)

(assert (=> b!250762 m!377381))

(assert (=> b!250762 m!377381))

(declare-fun m!377383 () Bool)

(assert (=> b!250762 m!377383))

(assert (=> b!250760 m!377377))

(assert (=> b!250760 m!377227))

(assert (=> b!250664 d!83926))

(declare-fun d!83928 () Bool)

(assert (=> d!83928 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!5993 (buf!6489 (_2!11685 lt!389441)))) ((_ sign_extend 32) (currentByte!11929 thiss!1005)) ((_ sign_extend 32) (currentBit!11924 thiss!1005))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5993 (buf!6489 (_2!11685 lt!389441)))) ((_ sign_extend 32) (currentByte!11929 thiss!1005)) ((_ sign_extend 32) (currentBit!11924 thiss!1005))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!21270 () Bool)

(assert (= bs!21270 d!83928))

(declare-fun m!377385 () Bool)

(assert (=> bs!21270 m!377385))

(assert (=> b!250664 d!83928))

(declare-fun d!83930 () Bool)

(declare-fun res!209957 () Bool)

(declare-fun e!173790 () Bool)

(assert (=> d!83930 (=> (not res!209957) (not e!173790))))

(assert (=> d!83930 (= res!209957 (= (size!5993 (buf!6489 thiss!1005)) (size!5993 (buf!6489 (_2!11685 lt!389440)))))))

(assert (=> d!83930 (= (isPrefixOf!0 thiss!1005 (_2!11685 lt!389440)) e!173790)))

(declare-fun b!250764 () Bool)

(declare-fun res!209956 () Bool)

(assert (=> b!250764 (=> (not res!209956) (not e!173790))))

(assert (=> b!250764 (= res!209956 (bvsle (bitIndex!0 (size!5993 (buf!6489 thiss!1005)) (currentByte!11929 thiss!1005) (currentBit!11924 thiss!1005)) (bitIndex!0 (size!5993 (buf!6489 (_2!11685 lt!389440))) (currentByte!11929 (_2!11685 lt!389440)) (currentBit!11924 (_2!11685 lt!389440)))))))

(declare-fun b!250765 () Bool)

(declare-fun e!173791 () Bool)

(assert (=> b!250765 (= e!173790 e!173791)))

(declare-fun res!209955 () Bool)

(assert (=> b!250765 (=> res!209955 e!173791)))

(assert (=> b!250765 (= res!209955 (= (size!5993 (buf!6489 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!250766 () Bool)

(assert (=> b!250766 (= e!173791 (arrayBitRangesEq!0 (buf!6489 thiss!1005) (buf!6489 (_2!11685 lt!389440)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5993 (buf!6489 thiss!1005)) (currentByte!11929 thiss!1005) (currentBit!11924 thiss!1005))))))

(assert (= (and d!83930 res!209957) b!250764))

(assert (= (and b!250764 res!209956) b!250765))

(assert (= (and b!250765 (not res!209955)) b!250766))

(assert (=> b!250764 m!377227))

(assert (=> b!250764 m!377265))

(assert (=> b!250766 m!377227))

(assert (=> b!250766 m!377227))

(declare-fun m!377387 () Bool)

(assert (=> b!250766 m!377387))

(assert (=> b!250664 d!83930))

(declare-fun b!250821 () Bool)

(declare-fun e!173830 () Bool)

(declare-fun lt!389644 () (_ BitVec 64))

(assert (=> b!250821 (= e!173830 (validate_offset_bits!1 ((_ sign_extend 32) (size!5993 (buf!6489 (_2!11685 lt!389441)))) ((_ sign_extend 32) (currentByte!11929 (_2!11685 lt!389441))) ((_ sign_extend 32) (currentBit!11924 (_2!11685 lt!389441))) lt!389644))))

(declare-fun b!250818 () Bool)

(declare-fun res!210004 () Bool)

(declare-fun e!173829 () Bool)

(assert (=> b!250818 (=> (not res!210004) (not e!173829))))

(declare-fun lt!389647 () (_ BitVec 64))

(declare-fun lt!389645 () tuple2!21520)

(declare-fun lt!389648 () (_ BitVec 64))

(assert (=> b!250818 (= res!210004 (= (bitIndex!0 (size!5993 (buf!6489 (_2!11685 lt!389645))) (currentByte!11929 (_2!11685 lt!389645)) (currentBit!11924 (_2!11685 lt!389645))) (bvadd lt!389647 lt!389648)))))

(assert (=> b!250818 (or (not (= (bvand lt!389647 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!389648 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!389647 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!389647 lt!389648) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!250818 (= lt!389648 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!250818 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!250818 (= lt!389647 (bitIndex!0 (size!5993 (buf!6489 (_2!11685 lt!389441))) (currentByte!11929 (_2!11685 lt!389441)) (currentBit!11924 (_2!11685 lt!389441))))))

(declare-fun b!250820 () Bool)

(declare-fun lt!389646 () tuple2!21516)

(declare-fun lt!389651 () tuple2!21518)

(assert (=> b!250820 (= e!173829 (and (_2!11683 lt!389646) (= (_1!11683 lt!389646) (_2!11684 lt!389651))))))

(assert (=> b!250820 (= lt!389646 (checkBitsLoopPure!0 (_1!11684 lt!389651) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!389649 () Unit!18125)

(declare-fun lt!389650 () Unit!18125)

(assert (=> b!250820 (= lt!389649 lt!389650)))

(assert (=> b!250820 (validate_offset_bits!1 ((_ sign_extend 32) (size!5993 (buf!6489 (_2!11685 lt!389645)))) ((_ sign_extend 32) (currentByte!11929 (_2!11685 lt!389441))) ((_ sign_extend 32) (currentBit!11924 (_2!11685 lt!389441))) lt!389644)))

(assert (=> b!250820 (= lt!389650 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11685 lt!389441) (buf!6489 (_2!11685 lt!389645)) lt!389644))))

(assert (=> b!250820 e!173830))

(declare-fun res!210005 () Bool)

(assert (=> b!250820 (=> (not res!210005) (not e!173830))))

(assert (=> b!250820 (= res!210005 (and (= (size!5993 (buf!6489 (_2!11685 lt!389441))) (size!5993 (buf!6489 (_2!11685 lt!389645)))) (bvsge lt!389644 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!250820 (= lt!389644 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!250820 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!250820 (= lt!389651 (reader!0 (_2!11685 lt!389441) (_2!11685 lt!389645)))))

(declare-fun d!83932 () Bool)

(assert (=> d!83932 e!173829))

(declare-fun res!210007 () Bool)

(assert (=> d!83932 (=> (not res!210007) (not e!173829))))

(assert (=> d!83932 (= res!210007 (= (size!5993 (buf!6489 (_2!11685 lt!389441))) (size!5993 (buf!6489 (_2!11685 lt!389645)))))))

(declare-fun choose!51 (BitStream!10908 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21520)

(assert (=> d!83932 (= lt!389645 (choose!51 (_2!11685 lt!389441) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!83932 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!83932 (= (appendNBitsLoop!0 (_2!11685 lt!389441) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) lt!389645)))

(declare-fun b!250819 () Bool)

(declare-fun res!210006 () Bool)

(assert (=> b!250819 (=> (not res!210006) (not e!173829))))

(assert (=> b!250819 (= res!210006 (isPrefixOf!0 (_2!11685 lt!389441) (_2!11685 lt!389645)))))

(assert (= (and d!83932 res!210007) b!250818))

(assert (= (and b!250818 res!210004) b!250819))

(assert (= (and b!250819 res!210006) b!250820))

(assert (= (and b!250820 res!210005) b!250821))

(declare-fun m!377423 () Bool)

(assert (=> b!250819 m!377423))

(declare-fun m!377425 () Bool)

(assert (=> b!250821 m!377425))

(declare-fun m!377427 () Bool)

(assert (=> d!83932 m!377427))

(declare-fun m!377429 () Bool)

(assert (=> b!250818 m!377429))

(assert (=> b!250818 m!377225))

(declare-fun m!377431 () Bool)

(assert (=> b!250820 m!377431))

(declare-fun m!377433 () Bool)

(assert (=> b!250820 m!377433))

(declare-fun m!377435 () Bool)

(assert (=> b!250820 m!377435))

(declare-fun m!377437 () Bool)

(assert (=> b!250820 m!377437))

(assert (=> b!250664 d!83932))

(declare-fun d!83962 () Bool)

(declare-fun lt!389682 () tuple2!21528)

(declare-fun readBit!0 (BitStream!10908) tuple2!21528)

(assert (=> d!83962 (= lt!389682 (readBit!0 (readerFrom!0 (_2!11685 lt!389441) (currentBit!11924 thiss!1005) (currentByte!11929 thiss!1005))))))

(assert (=> d!83962 (= (readBitPure!0 (readerFrom!0 (_2!11685 lt!389441) (currentBit!11924 thiss!1005) (currentByte!11929 thiss!1005))) (tuple2!21517 (_2!11689 lt!389682) (_1!11689 lt!389682)))))

(declare-fun bs!21274 () Bool)

(assert (= bs!21274 d!83962))

(assert (=> bs!21274 m!377241))

(declare-fun m!377449 () Bool)

(assert (=> bs!21274 m!377449))

(assert (=> b!250665 d!83962))

(declare-fun d!83972 () Bool)

(declare-fun e!173839 () Bool)

(assert (=> d!83972 e!173839))

(declare-fun res!210024 () Bool)

(assert (=> d!83972 (=> (not res!210024) (not e!173839))))

(assert (=> d!83972 (= res!210024 (invariant!0 (currentBit!11924 (_2!11685 lt!389441)) (currentByte!11929 (_2!11685 lt!389441)) (size!5993 (buf!6489 (_2!11685 lt!389441)))))))

(assert (=> d!83972 (= (readerFrom!0 (_2!11685 lt!389441) (currentBit!11924 thiss!1005) (currentByte!11929 thiss!1005)) (BitStream!10909 (buf!6489 (_2!11685 lt!389441)) (currentByte!11929 thiss!1005) (currentBit!11924 thiss!1005)))))

(declare-fun b!250837 () Bool)

(assert (=> b!250837 (= e!173839 (invariant!0 (currentBit!11924 thiss!1005) (currentByte!11929 thiss!1005) (size!5993 (buf!6489 (_2!11685 lt!389441)))))))

(assert (= (and d!83972 res!210024) b!250837))

(assert (=> d!83972 m!377321))

(assert (=> b!250837 m!377259))

(assert (=> b!250665 d!83972))

(declare-fun d!83984 () Bool)

(declare-fun e!173840 () Bool)

(assert (=> d!83984 e!173840))

(declare-fun res!210026 () Bool)

(assert (=> d!83984 (=> (not res!210026) (not e!173840))))

(declare-fun lt!389691 () (_ BitVec 64))

(declare-fun lt!389688 () (_ BitVec 64))

(declare-fun lt!389693 () (_ BitVec 64))

(assert (=> d!83984 (= res!210026 (= lt!389688 (bvsub lt!389691 lt!389693)))))

(assert (=> d!83984 (or (= (bvand lt!389691 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!389693 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!389691 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!389691 lt!389693) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83984 (= lt!389693 (remainingBits!0 ((_ sign_extend 32) (size!5993 (buf!6489 (_1!11683 lt!389432)))) ((_ sign_extend 32) (currentByte!11929 (_1!11683 lt!389432))) ((_ sign_extend 32) (currentBit!11924 (_1!11683 lt!389432)))))))

(declare-fun lt!389692 () (_ BitVec 64))

(declare-fun lt!389690 () (_ BitVec 64))

(assert (=> d!83984 (= lt!389691 (bvmul lt!389692 lt!389690))))

(assert (=> d!83984 (or (= lt!389692 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!389690 (bvsdiv (bvmul lt!389692 lt!389690) lt!389692)))))

(assert (=> d!83984 (= lt!389690 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!83984 (= lt!389692 ((_ sign_extend 32) (size!5993 (buf!6489 (_1!11683 lt!389432)))))))

(assert (=> d!83984 (= lt!389688 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11929 (_1!11683 lt!389432))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11924 (_1!11683 lt!389432)))))))

(assert (=> d!83984 (invariant!0 (currentBit!11924 (_1!11683 lt!389432)) (currentByte!11929 (_1!11683 lt!389432)) (size!5993 (buf!6489 (_1!11683 lt!389432))))))

(assert (=> d!83984 (= (bitIndex!0 (size!5993 (buf!6489 (_1!11683 lt!389432))) (currentByte!11929 (_1!11683 lt!389432)) (currentBit!11924 (_1!11683 lt!389432))) lt!389688)))

(declare-fun b!250838 () Bool)

(declare-fun res!210025 () Bool)

(assert (=> b!250838 (=> (not res!210025) (not e!173840))))

(assert (=> b!250838 (= res!210025 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!389688))))

(declare-fun b!250839 () Bool)

(declare-fun lt!389689 () (_ BitVec 64))

(assert (=> b!250839 (= e!173840 (bvsle lt!389688 (bvmul lt!389689 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!250839 (or (= lt!389689 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!389689 #b0000000000000000000000000000000000000000000000000000000000001000) lt!389689)))))

(assert (=> b!250839 (= lt!389689 ((_ sign_extend 32) (size!5993 (buf!6489 (_1!11683 lt!389432)))))))

(assert (= (and d!83984 res!210026) b!250838))

(assert (= (and b!250838 res!210025) b!250839))

(declare-fun m!377459 () Bool)

(assert (=> d!83984 m!377459))

(declare-fun m!377461 () Bool)

(assert (=> d!83984 m!377461))

(assert (=> b!250668 d!83984))

(declare-fun d!83986 () Bool)

(assert (=> d!83986 (= (array_inv!5734 (buf!6489 thiss!1005)) (bvsge (size!5993 (buf!6489 thiss!1005)) #b00000000000000000000000000000000))))

(assert (=> b!250669 d!83986))

(declare-fun d!83990 () Bool)

(assert (=> d!83990 (= (invariant!0 (currentBit!11924 thiss!1005) (currentByte!11929 thiss!1005) (size!5993 (buf!6489 (_2!11685 lt!389441)))) (and (bvsge (currentBit!11924 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11924 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11929 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11929 thiss!1005) (size!5993 (buf!6489 (_2!11685 lt!389441)))) (and (= (currentBit!11924 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11929 thiss!1005) (size!5993 (buf!6489 (_2!11685 lt!389441))))))))))

(assert (=> b!250667 d!83990))

(declare-fun d!83994 () Bool)

(declare-fun e!173841 () Bool)

(assert (=> d!83994 e!173841))

(declare-fun res!210029 () Bool)

(assert (=> d!83994 (=> (not res!210029) (not e!173841))))

(declare-fun lt!389703 () (_ BitVec 64))

(declare-fun lt!389701 () (_ BitVec 64))

(declare-fun lt!389698 () (_ BitVec 64))

(assert (=> d!83994 (= res!210029 (= lt!389698 (bvsub lt!389701 lt!389703)))))

(assert (=> d!83994 (or (= (bvand lt!389701 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!389703 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!389701 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!389701 lt!389703) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83994 (= lt!389703 (remainingBits!0 ((_ sign_extend 32) (size!5993 (buf!6489 (_2!11685 lt!389440)))) ((_ sign_extend 32) (currentByte!11929 (_2!11685 lt!389440))) ((_ sign_extend 32) (currentBit!11924 (_2!11685 lt!389440)))))))

(declare-fun lt!389702 () (_ BitVec 64))

(declare-fun lt!389700 () (_ BitVec 64))

(assert (=> d!83994 (= lt!389701 (bvmul lt!389702 lt!389700))))

(assert (=> d!83994 (or (= lt!389702 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!389700 (bvsdiv (bvmul lt!389702 lt!389700) lt!389702)))))

(assert (=> d!83994 (= lt!389700 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!83994 (= lt!389702 ((_ sign_extend 32) (size!5993 (buf!6489 (_2!11685 lt!389440)))))))

(assert (=> d!83994 (= lt!389698 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11929 (_2!11685 lt!389440))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11924 (_2!11685 lt!389440)))))))

(assert (=> d!83994 (invariant!0 (currentBit!11924 (_2!11685 lt!389440)) (currentByte!11929 (_2!11685 lt!389440)) (size!5993 (buf!6489 (_2!11685 lt!389440))))))

(assert (=> d!83994 (= (bitIndex!0 (size!5993 (buf!6489 (_2!11685 lt!389440))) (currentByte!11929 (_2!11685 lt!389440)) (currentBit!11924 (_2!11685 lt!389440))) lt!389698)))

(declare-fun b!250840 () Bool)

(declare-fun res!210028 () Bool)

(assert (=> b!250840 (=> (not res!210028) (not e!173841))))

(assert (=> b!250840 (= res!210028 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!389698))))

(declare-fun b!250841 () Bool)

(declare-fun lt!389699 () (_ BitVec 64))

(assert (=> b!250841 (= e!173841 (bvsle lt!389698 (bvmul lt!389699 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!250841 (or (= lt!389699 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!389699 #b0000000000000000000000000000000000000000000000000000000000001000) lt!389699)))))

(assert (=> b!250841 (= lt!389699 ((_ sign_extend 32) (size!5993 (buf!6489 (_2!11685 lt!389440)))))))

(assert (= (and d!83994 res!210029) b!250840))

(assert (= (and b!250840 res!210028) b!250841))

(declare-fun m!377467 () Bool)

(assert (=> d!83994 m!377467))

(declare-fun m!377469 () Bool)

(assert (=> d!83994 m!377469))

(assert (=> b!250671 d!83994))

(assert (=> b!250671 d!83900))

(declare-fun b!250868 () Bool)

(declare-fun e!173865 () Bool)

(declare-fun call!3963 () Bool)

(assert (=> b!250868 (= e!173865 call!3963)))

(declare-fun b!250869 () Bool)

(declare-fun res!210056 () Bool)

(declare-fun lt!389712 () (_ BitVec 32))

(assert (=> b!250869 (= res!210056 (= lt!389712 #b00000000000000000000000000000000))))

(declare-fun e!173863 () Bool)

(assert (=> b!250869 (=> res!210056 e!173863)))

(declare-fun e!173867 () Bool)

(assert (=> b!250869 (= e!173867 e!173863)))

(declare-fun b!250870 () Bool)

(declare-fun e!173864 () Bool)

(declare-fun e!173868 () Bool)

(assert (=> b!250870 (= e!173864 e!173868)))

(declare-fun res!210054 () Bool)

(assert (=> b!250870 (=> (not res!210054) (not e!173868))))

(declare-fun e!173866 () Bool)

(assert (=> b!250870 (= res!210054 e!173866)))

(declare-fun res!210053 () Bool)

(assert (=> b!250870 (=> res!210053 e!173866)))

(declare-datatypes ((tuple4!290 0))(
  ( (tuple4!291 (_1!11690 (_ BitVec 32)) (_2!11690 (_ BitVec 32)) (_3!925 (_ BitVec 32)) (_4!145 (_ BitVec 32))) )
))
(declare-fun lt!389711 () tuple4!290)

(assert (=> b!250870 (= res!210053 (bvsge (_1!11690 lt!389711) (_2!11690 lt!389711)))))

(assert (=> b!250870 (= lt!389712 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!5993 (buf!6489 (_2!11685 lt!389441))) (currentByte!11929 thiss!1005) (currentBit!11924 thiss!1005))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!389710 () (_ BitVec 32))

(assert (=> b!250870 (= lt!389710 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!290)

(assert (=> b!250870 (= lt!389711 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!5993 (buf!6489 (_2!11685 lt!389441))) (currentByte!11929 thiss!1005) (currentBit!11924 thiss!1005)))))))

(declare-fun b!250871 () Bool)

(declare-fun arrayRangesEq!922 (array!13662 array!13662 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!250871 (= e!173866 (arrayRangesEq!922 (buf!6489 (_2!11685 lt!389441)) (buf!6489 (_2!11685 lt!389440)) (_1!11690 lt!389711) (_2!11690 lt!389711)))))

(declare-fun b!250872 () Bool)

(assert (=> b!250872 (= e!173865 e!173867)))

(declare-fun res!210055 () Bool)

(assert (=> b!250872 (= res!210055 call!3963)))

(assert (=> b!250872 (=> (not res!210055) (not e!173867))))

(declare-fun d!83996 () Bool)

(declare-fun res!210052 () Bool)

(assert (=> d!83996 (=> res!210052 e!173864)))

(assert (=> d!83996 (= res!210052 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!5993 (buf!6489 (_2!11685 lt!389441))) (currentByte!11929 thiss!1005) (currentBit!11924 thiss!1005)))))))

(assert (=> d!83996 (= (arrayBitRangesEq!0 (buf!6489 (_2!11685 lt!389441)) (buf!6489 (_2!11685 lt!389440)) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!5993 (buf!6489 (_2!11685 lt!389441))) (currentByte!11929 thiss!1005) (currentBit!11924 thiss!1005)))) e!173864)))

(declare-fun b!250873 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!250873 (= e!173863 (byteRangesEq!0 (select (arr!6980 (buf!6489 (_2!11685 lt!389441))) (_4!145 lt!389711)) (select (arr!6980 (buf!6489 (_2!11685 lt!389440))) (_4!145 lt!389711)) #b00000000000000000000000000000000 lt!389712))))

(declare-fun b!250874 () Bool)

(assert (=> b!250874 (= e!173868 e!173865)))

(declare-fun c!11605 () Bool)

(assert (=> b!250874 (= c!11605 (= (_3!925 lt!389711) (_4!145 lt!389711)))))

(declare-fun bm!3960 () Bool)

(assert (=> bm!3960 (= call!3963 (byteRangesEq!0 (select (arr!6980 (buf!6489 (_2!11685 lt!389441))) (_3!925 lt!389711)) (select (arr!6980 (buf!6489 (_2!11685 lt!389440))) (_3!925 lt!389711)) lt!389710 (ite c!11605 lt!389712 #b00000000000000000000000000001000)))))

(assert (= (and d!83996 (not res!210052)) b!250870))

(assert (= (and b!250870 (not res!210053)) b!250871))

(assert (= (and b!250870 res!210054) b!250874))

(assert (= (and b!250874 c!11605) b!250868))

(assert (= (and b!250874 (not c!11605)) b!250872))

(assert (= (and b!250872 res!210055) b!250869))

(assert (= (and b!250869 (not res!210056)) b!250873))

(assert (= (or b!250868 b!250872) bm!3960))

(declare-fun m!377473 () Bool)

(assert (=> b!250870 m!377473))

(declare-fun m!377475 () Bool)

(assert (=> b!250871 m!377475))

(declare-fun m!377477 () Bool)

(assert (=> b!250873 m!377477))

(declare-fun m!377479 () Bool)

(assert (=> b!250873 m!377479))

(assert (=> b!250873 m!377477))

(assert (=> b!250873 m!377479))

(declare-fun m!377481 () Bool)

(assert (=> b!250873 m!377481))

(declare-fun m!377483 () Bool)

(assert (=> bm!3960 m!377483))

(declare-fun m!377485 () Bool)

(assert (=> bm!3960 m!377485))

(assert (=> bm!3960 m!377483))

(assert (=> bm!3960 m!377485))

(declare-fun m!377487 () Bool)

(assert (=> bm!3960 m!377487))

(assert (=> b!250670 d!83996))

(declare-fun d!84002 () Bool)

(declare-fun e!173869 () Bool)

(assert (=> d!84002 e!173869))

(declare-fun res!210058 () Bool)

(assert (=> d!84002 (=> (not res!210058) (not e!173869))))

(declare-fun lt!389718 () (_ BitVec 64))

(declare-fun lt!389716 () (_ BitVec 64))

(declare-fun lt!389713 () (_ BitVec 64))

(assert (=> d!84002 (= res!210058 (= lt!389713 (bvsub lt!389716 lt!389718)))))

(assert (=> d!84002 (or (= (bvand lt!389716 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!389718 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!389716 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!389716 lt!389718) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84002 (= lt!389718 (remainingBits!0 ((_ sign_extend 32) (size!5993 (buf!6489 (_2!11685 lt!389441)))) ((_ sign_extend 32) (currentByte!11929 thiss!1005)) ((_ sign_extend 32) (currentBit!11924 thiss!1005))))))

(declare-fun lt!389717 () (_ BitVec 64))

(declare-fun lt!389715 () (_ BitVec 64))

(assert (=> d!84002 (= lt!389716 (bvmul lt!389717 lt!389715))))

(assert (=> d!84002 (or (= lt!389717 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!389715 (bvsdiv (bvmul lt!389717 lt!389715) lt!389717)))))

(assert (=> d!84002 (= lt!389715 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84002 (= lt!389717 ((_ sign_extend 32) (size!5993 (buf!6489 (_2!11685 lt!389441)))))))

(assert (=> d!84002 (= lt!389713 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11929 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11924 thiss!1005))))))

(assert (=> d!84002 (invariant!0 (currentBit!11924 thiss!1005) (currentByte!11929 thiss!1005) (size!5993 (buf!6489 (_2!11685 lt!389441))))))

(assert (=> d!84002 (= (bitIndex!0 (size!5993 (buf!6489 (_2!11685 lt!389441))) (currentByte!11929 thiss!1005) (currentBit!11924 thiss!1005)) lt!389713)))

(declare-fun b!250875 () Bool)

(declare-fun res!210057 () Bool)

(assert (=> b!250875 (=> (not res!210057) (not e!173869))))

(assert (=> b!250875 (= res!210057 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!389713))))

(declare-fun b!250876 () Bool)

(declare-fun lt!389714 () (_ BitVec 64))

(assert (=> b!250876 (= e!173869 (bvsle lt!389713 (bvmul lt!389714 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!250876 (or (= lt!389714 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!389714 #b0000000000000000000000000000000000000000000000000000000000001000) lt!389714)))))

(assert (=> b!250876 (= lt!389714 ((_ sign_extend 32) (size!5993 (buf!6489 (_2!11685 lt!389441)))))))

(assert (= (and d!84002 res!210058) b!250875))

(assert (= (and b!250875 res!210057) b!250876))

(assert (=> d!84002 m!377385))

(assert (=> d!84002 m!377259))

(assert (=> b!250670 d!84002))

(check-sat (not b!250837) (not b!250763) (not b!250764) (not b!250745) (not b!250750) (not d!83994) (not b!250873) (not b!250747) (not d!83912) (not b!250762) (not bm!3960) (not d!83962) (not d!83932) (not b!250740) (not b!250729) (not b!250766) (not d!83910) (not d!83916) (not b!250870) (not b!250820) (not d!83920) (not d!83900) (not d!83926) (not d!83902) (not b!250821) (not d!83924) (not d!83914) (not d!83922) (not b!250743) (not b!250727) (not d!83972) (not d!83984) (not d!83928) (not b!250744) (not b!250761) (not b!250741) (not d!83908) (not d!84002) (not b!250819) (not d!83904) (not b!250871) (not b!250818) (not b!250760))
