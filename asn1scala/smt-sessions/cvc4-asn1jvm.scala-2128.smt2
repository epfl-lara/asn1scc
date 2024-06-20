; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53956 () Bool)

(assert start!53956)

(declare-fun b!251113 () Bool)

(declare-fun res!210272 () Bool)

(declare-fun e!174024 () Bool)

(assert (=> b!251113 (=> (not res!210272) (not e!174024))))

(declare-datatypes ((array!13673 0))(
  ( (array!13674 (arr!6984 (Array (_ BitVec 32) (_ BitVec 8))) (size!5997 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10916 0))(
  ( (BitStream!10917 (buf!6496 array!13673) (currentByte!11945 (_ BitVec 32)) (currentBit!11940 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!18136 0))(
  ( (Unit!18137) )
))
(declare-datatypes ((tuple2!21546 0))(
  ( (tuple2!21547 (_1!11701 Unit!18136) (_2!11701 BitStream!10916)) )
))
(declare-fun lt!390107 () tuple2!21546)

(declare-fun lt!390113 () tuple2!21546)

(declare-fun isPrefixOf!0 (BitStream!10916 BitStream!10916) Bool)

(assert (=> b!251113 (= res!210272 (isPrefixOf!0 (_2!11701 lt!390107) (_2!11701 lt!390113)))))

(declare-fun b!251114 () Bool)

(declare-fun res!210271 () Bool)

(declare-fun e!174023 () Bool)

(assert (=> b!251114 (=> (not res!210271) (not e!174023))))

(declare-fun thiss!1005 () BitStream!10916)

(assert (=> b!251114 (= res!210271 (isPrefixOf!0 thiss!1005 (_2!11701 lt!390107)))))

(declare-fun b!251115 () Bool)

(declare-fun e!174026 () Bool)

(declare-datatypes ((tuple2!21548 0))(
  ( (tuple2!21549 (_1!11702 BitStream!10916) (_2!11702 BitStream!10916)) )
))
(declare-fun lt!390110 () tuple2!21548)

(declare-fun bit!26 () Bool)

(declare-datatypes ((tuple2!21550 0))(
  ( (tuple2!21551 (_1!11703 BitStream!10916) (_2!11703 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!10916) tuple2!21550)

(assert (=> b!251115 (= e!174026 (not (= (_2!11703 (readBitPure!0 (_1!11702 lt!390110))) bit!26)))))

(declare-fun lt!390114 () tuple2!21548)

(declare-fun reader!0 (BitStream!10916 BitStream!10916) tuple2!21548)

(assert (=> b!251115 (= lt!390114 (reader!0 (_2!11701 lt!390107) (_2!11701 lt!390113)))))

(assert (=> b!251115 (= lt!390110 (reader!0 thiss!1005 (_2!11701 lt!390113)))))

(declare-fun e!174028 () Bool)

(assert (=> b!251115 e!174028))

(declare-fun res!210278 () Bool)

(assert (=> b!251115 (=> (not res!210278) (not e!174028))))

(declare-fun lt!390105 () tuple2!21550)

(declare-fun lt!390101 () tuple2!21550)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!251115 (= res!210278 (= (bitIndex!0 (size!5997 (buf!6496 (_1!11703 lt!390105))) (currentByte!11945 (_1!11703 lt!390105)) (currentBit!11940 (_1!11703 lt!390105))) (bitIndex!0 (size!5997 (buf!6496 (_1!11703 lt!390101))) (currentByte!11945 (_1!11703 lt!390101)) (currentBit!11940 (_1!11703 lt!390101)))))))

(declare-fun lt!390098 () Unit!18136)

(declare-fun lt!390108 () BitStream!10916)

(declare-fun readBitPrefixLemma!0 (BitStream!10916 BitStream!10916) Unit!18136)

(assert (=> b!251115 (= lt!390098 (readBitPrefixLemma!0 lt!390108 (_2!11701 lt!390113)))))

(assert (=> b!251115 (= lt!390101 (readBitPure!0 (BitStream!10917 (buf!6496 (_2!11701 lt!390113)) (currentByte!11945 thiss!1005) (currentBit!11940 thiss!1005))))))

(assert (=> b!251115 (= lt!390105 (readBitPure!0 lt!390108))))

(assert (=> b!251115 (= lt!390108 (BitStream!10917 (buf!6496 (_2!11701 lt!390107)) (currentByte!11945 thiss!1005) (currentBit!11940 thiss!1005)))))

(declare-fun e!174029 () Bool)

(assert (=> b!251115 e!174029))

(declare-fun res!210270 () Bool)

(assert (=> b!251115 (=> (not res!210270) (not e!174029))))

(assert (=> b!251115 (= res!210270 (isPrefixOf!0 thiss!1005 (_2!11701 lt!390113)))))

(declare-fun lt!390104 () Unit!18136)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10916 BitStream!10916 BitStream!10916) Unit!18136)

(assert (=> b!251115 (= lt!390104 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11701 lt!390107) (_2!11701 lt!390113)))))

(declare-fun e!174025 () Bool)

(assert (=> b!251115 e!174025))

(declare-fun res!210275 () Bool)

(assert (=> b!251115 (=> (not res!210275) (not e!174025))))

(assert (=> b!251115 (= res!210275 (= (size!5997 (buf!6496 (_2!11701 lt!390107))) (size!5997 (buf!6496 (_2!11701 lt!390113)))))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun appendNBitsLoop!0 (BitStream!10916 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21546)

(assert (=> b!251115 (= lt!390113 (appendNBitsLoop!0 (_2!11701 lt!390107) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!251115 (validate_offset_bits!1 ((_ sign_extend 32) (size!5997 (buf!6496 (_2!11701 lt!390107)))) ((_ sign_extend 32) (currentByte!11945 (_2!11701 lt!390107))) ((_ sign_extend 32) (currentBit!11940 (_2!11701 lt!390107))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!390106 () Unit!18136)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10916 BitStream!10916 (_ BitVec 64) (_ BitVec 64)) Unit!18136)

(assert (=> b!251115 (= lt!390106 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11701 lt!390107) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!174027 () Bool)

(assert (=> b!251115 e!174027))

(declare-fun res!210274 () Bool)

(assert (=> b!251115 (=> (not res!210274) (not e!174027))))

(assert (=> b!251115 (= res!210274 (= (size!5997 (buf!6496 thiss!1005)) (size!5997 (buf!6496 (_2!11701 lt!390107)))))))

(declare-fun appendBit!0 (BitStream!10916 Bool) tuple2!21546)

(assert (=> b!251115 (= lt!390107 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!251116 () Bool)

(declare-fun e!174020 () Bool)

(declare-fun lt!390111 () tuple2!21550)

(declare-fun lt!390100 () (_ BitVec 64))

(assert (=> b!251116 (= e!174020 (= (bitIndex!0 (size!5997 (buf!6496 (_1!11703 lt!390111))) (currentByte!11945 (_1!11703 lt!390111)) (currentBit!11940 (_1!11703 lt!390111))) lt!390100))))

(declare-fun b!251117 () Bool)

(assert (=> b!251117 (= e!174027 e!174023)))

(declare-fun res!210269 () Bool)

(assert (=> b!251117 (=> (not res!210269) (not e!174023))))

(declare-fun lt!390099 () (_ BitVec 64))

(assert (=> b!251117 (= res!210269 (= lt!390100 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!390099)))))

(assert (=> b!251117 (= lt!390100 (bitIndex!0 (size!5997 (buf!6496 (_2!11701 lt!390107))) (currentByte!11945 (_2!11701 lt!390107)) (currentBit!11940 (_2!11701 lt!390107))))))

(assert (=> b!251117 (= lt!390099 (bitIndex!0 (size!5997 (buf!6496 thiss!1005)) (currentByte!11945 thiss!1005) (currentBit!11940 thiss!1005)))))

(declare-fun b!251118 () Bool)

(declare-fun res!210279 () Bool)

(assert (=> b!251118 (=> (not res!210279) (not e!174026))))

(assert (=> b!251118 (= res!210279 (validate_offset_bits!1 ((_ sign_extend 32) (size!5997 (buf!6496 thiss!1005))) ((_ sign_extend 32) (currentByte!11945 thiss!1005)) ((_ sign_extend 32) (currentBit!11940 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!251119 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!251119 (= e!174029 (invariant!0 (currentBit!11940 thiss!1005) (currentByte!11945 thiss!1005) (size!5997 (buf!6496 (_2!11701 lt!390113)))))))

(declare-fun b!251120 () Bool)

(assert (=> b!251120 (= e!174023 e!174020)))

(declare-fun res!210267 () Bool)

(assert (=> b!251120 (=> (not res!210267) (not e!174020))))

(assert (=> b!251120 (= res!210267 (and (= (_2!11703 lt!390111) bit!26) (= (_1!11703 lt!390111) (_2!11701 lt!390107))))))

(declare-fun readerFrom!0 (BitStream!10916 (_ BitVec 32) (_ BitVec 32)) BitStream!10916)

(assert (=> b!251120 (= lt!390111 (readBitPure!0 (readerFrom!0 (_2!11701 lt!390107) (currentBit!11940 thiss!1005) (currentByte!11945 thiss!1005))))))

(declare-fun res!210277 () Bool)

(assert (=> start!53956 (=> (not res!210277) (not e!174026))))

(assert (=> start!53956 (= res!210277 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53956 e!174026))

(assert (=> start!53956 true))

(declare-fun e!174021 () Bool)

(declare-fun inv!12 (BitStream!10916) Bool)

(assert (=> start!53956 (and (inv!12 thiss!1005) e!174021)))

(declare-fun b!251121 () Bool)

(declare-fun res!210276 () Bool)

(assert (=> b!251121 (=> (not res!210276) (not e!174026))))

(assert (=> b!251121 (= res!210276 (bvslt from!289 nBits!297))))

(declare-fun b!251122 () Bool)

(declare-fun res!210268 () Bool)

(assert (=> b!251122 (=> (not res!210268) (not e!174029))))

(assert (=> b!251122 (= res!210268 (invariant!0 (currentBit!11940 thiss!1005) (currentByte!11945 thiss!1005) (size!5997 (buf!6496 (_2!11701 lt!390107)))))))

(declare-fun b!251123 () Bool)

(assert (=> b!251123 (= e!174025 e!174024)))

(declare-fun res!210273 () Bool)

(assert (=> b!251123 (=> (not res!210273) (not e!174024))))

(declare-fun lt!390102 () (_ BitVec 64))

(assert (=> b!251123 (= res!210273 (= (bitIndex!0 (size!5997 (buf!6496 (_2!11701 lt!390113))) (currentByte!11945 (_2!11701 lt!390113)) (currentBit!11940 (_2!11701 lt!390113))) (bvadd (bitIndex!0 (size!5997 (buf!6496 (_2!11701 lt!390107))) (currentByte!11945 (_2!11701 lt!390107)) (currentBit!11940 (_2!11701 lt!390107))) lt!390102)))))

(assert (=> b!251123 (= lt!390102 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!251124 () Bool)

(declare-fun lt!390112 () tuple2!21550)

(declare-fun lt!390109 () tuple2!21548)

(assert (=> b!251124 (= e!174024 (not (or (not (_2!11703 lt!390112)) (not (= (_1!11703 lt!390112) (_2!11702 lt!390109))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10916 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21550)

(assert (=> b!251124 (= lt!390112 (checkBitsLoopPure!0 (_1!11702 lt!390109) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!251124 (validate_offset_bits!1 ((_ sign_extend 32) (size!5997 (buf!6496 (_2!11701 lt!390113)))) ((_ sign_extend 32) (currentByte!11945 (_2!11701 lt!390107))) ((_ sign_extend 32) (currentBit!11940 (_2!11701 lt!390107))) lt!390102)))

(declare-fun lt!390103 () Unit!18136)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10916 array!13673 (_ BitVec 64)) Unit!18136)

(assert (=> b!251124 (= lt!390103 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11701 lt!390107) (buf!6496 (_2!11701 lt!390113)) lt!390102))))

(assert (=> b!251124 (= lt!390109 (reader!0 (_2!11701 lt!390107) (_2!11701 lt!390113)))))

(declare-fun b!251125 () Bool)

(declare-fun array_inv!5738 (array!13673) Bool)

(assert (=> b!251125 (= e!174021 (array_inv!5738 (buf!6496 thiss!1005)))))

(declare-fun b!251126 () Bool)

(assert (=> b!251126 (= e!174028 (= (_2!11703 lt!390105) (_2!11703 lt!390101)))))

(assert (= (and start!53956 res!210277) b!251118))

(assert (= (and b!251118 res!210279) b!251121))

(assert (= (and b!251121 res!210276) b!251115))

(assert (= (and b!251115 res!210274) b!251117))

(assert (= (and b!251117 res!210269) b!251114))

(assert (= (and b!251114 res!210271) b!251120))

(assert (= (and b!251120 res!210267) b!251116))

(assert (= (and b!251115 res!210275) b!251123))

(assert (= (and b!251123 res!210273) b!251113))

(assert (= (and b!251113 res!210272) b!251124))

(assert (= (and b!251115 res!210270) b!251122))

(assert (= (and b!251122 res!210268) b!251119))

(assert (= (and b!251115 res!210278) b!251126))

(assert (= start!53956 b!251125))

(declare-fun m!377775 () Bool)

(assert (=> b!251124 m!377775))

(declare-fun m!377777 () Bool)

(assert (=> b!251124 m!377777))

(declare-fun m!377779 () Bool)

(assert (=> b!251124 m!377779))

(declare-fun m!377781 () Bool)

(assert (=> b!251124 m!377781))

(declare-fun m!377783 () Bool)

(assert (=> b!251117 m!377783))

(declare-fun m!377785 () Bool)

(assert (=> b!251117 m!377785))

(declare-fun m!377787 () Bool)

(assert (=> b!251120 m!377787))

(assert (=> b!251120 m!377787))

(declare-fun m!377789 () Bool)

(assert (=> b!251120 m!377789))

(declare-fun m!377791 () Bool)

(assert (=> b!251115 m!377791))

(declare-fun m!377793 () Bool)

(assert (=> b!251115 m!377793))

(declare-fun m!377795 () Bool)

(assert (=> b!251115 m!377795))

(declare-fun m!377797 () Bool)

(assert (=> b!251115 m!377797))

(declare-fun m!377799 () Bool)

(assert (=> b!251115 m!377799))

(declare-fun m!377801 () Bool)

(assert (=> b!251115 m!377801))

(declare-fun m!377803 () Bool)

(assert (=> b!251115 m!377803))

(declare-fun m!377805 () Bool)

(assert (=> b!251115 m!377805))

(declare-fun m!377807 () Bool)

(assert (=> b!251115 m!377807))

(declare-fun m!377809 () Bool)

(assert (=> b!251115 m!377809))

(declare-fun m!377811 () Bool)

(assert (=> b!251115 m!377811))

(declare-fun m!377813 () Bool)

(assert (=> b!251115 m!377813))

(assert (=> b!251115 m!377781))

(declare-fun m!377815 () Bool)

(assert (=> b!251115 m!377815))

(declare-fun m!377817 () Bool)

(assert (=> b!251125 m!377817))

(declare-fun m!377819 () Bool)

(assert (=> b!251122 m!377819))

(declare-fun m!377821 () Bool)

(assert (=> start!53956 m!377821))

(declare-fun m!377823 () Bool)

(assert (=> b!251118 m!377823))

(declare-fun m!377825 () Bool)

(assert (=> b!251114 m!377825))

(declare-fun m!377827 () Bool)

(assert (=> b!251119 m!377827))

(declare-fun m!377829 () Bool)

(assert (=> b!251123 m!377829))

(assert (=> b!251123 m!377783))

(declare-fun m!377831 () Bool)

(assert (=> b!251116 m!377831))

(declare-fun m!377833 () Bool)

(assert (=> b!251113 m!377833))

(push 1)

(assert (not b!251120))

(assert (not b!251114))

(assert (not b!251117))

(assert (not b!251113))

(assert (not b!251116))

(assert (not start!53956))

(assert (not b!251123))

(assert (not b!251125))

(assert (not b!251118))

(assert (not b!251115))

(assert (not b!251124))

(assert (not b!251122))

(assert (not b!251119))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!84112 () Bool)

(declare-fun e!174079 () Bool)

(assert (=> d!84112 e!174079))

(declare-fun res!210361 () Bool)

(assert (=> d!84112 (=> (not res!210361) (not e!174079))))

(declare-fun lt!390322 () (_ BitVec 64))

(declare-fun lt!390321 () (_ BitVec 64))

(declare-fun lt!390325 () (_ BitVec 64))

(assert (=> d!84112 (= res!210361 (= lt!390321 (bvsub lt!390325 lt!390322)))))

(assert (=> d!84112 (or (= (bvand lt!390325 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!390322 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!390325 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!390325 lt!390322) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!84112 (= lt!390322 (remainingBits!0 ((_ sign_extend 32) (size!5997 (buf!6496 (_2!11701 lt!390107)))) ((_ sign_extend 32) (currentByte!11945 (_2!11701 lt!390107))) ((_ sign_extend 32) (currentBit!11940 (_2!11701 lt!390107)))))))

(declare-fun lt!390326 () (_ BitVec 64))

(declare-fun lt!390323 () (_ BitVec 64))

(assert (=> d!84112 (= lt!390325 (bvmul lt!390326 lt!390323))))

(assert (=> d!84112 (or (= lt!390326 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!390323 (bvsdiv (bvmul lt!390326 lt!390323) lt!390326)))))

(assert (=> d!84112 (= lt!390323 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84112 (= lt!390326 ((_ sign_extend 32) (size!5997 (buf!6496 (_2!11701 lt!390107)))))))

(assert (=> d!84112 (= lt!390321 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11945 (_2!11701 lt!390107))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11940 (_2!11701 lt!390107)))))))

(assert (=> d!84112 (invariant!0 (currentBit!11940 (_2!11701 lt!390107)) (currentByte!11945 (_2!11701 lt!390107)) (size!5997 (buf!6496 (_2!11701 lt!390107))))))

(assert (=> d!84112 (= (bitIndex!0 (size!5997 (buf!6496 (_2!11701 lt!390107))) (currentByte!11945 (_2!11701 lt!390107)) (currentBit!11940 (_2!11701 lt!390107))) lt!390321)))

(declare-fun b!251216 () Bool)

(declare-fun res!210362 () Bool)

(assert (=> b!251216 (=> (not res!210362) (not e!174079))))

(assert (=> b!251216 (= res!210362 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!390321))))

(declare-fun b!251217 () Bool)

(declare-fun lt!390324 () (_ BitVec 64))

(assert (=> b!251217 (= e!174079 (bvsle lt!390321 (bvmul lt!390324 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!251217 (or (= lt!390324 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!390324 #b0000000000000000000000000000000000000000000000000000000000001000) lt!390324)))))

(assert (=> b!251217 (= lt!390324 ((_ sign_extend 32) (size!5997 (buf!6496 (_2!11701 lt!390107)))))))

(assert (= (and d!84112 res!210361) b!251216))

(assert (= (and b!251216 res!210362) b!251217))

(declare-fun m!377979 () Bool)

(assert (=> d!84112 m!377979))

(declare-fun m!377981 () Bool)

(assert (=> d!84112 m!377981))

(assert (=> b!251117 d!84112))

(declare-fun d!84114 () Bool)

(declare-fun e!174080 () Bool)

(assert (=> d!84114 e!174080))

(declare-fun res!210363 () Bool)

(assert (=> d!84114 (=> (not res!210363) (not e!174080))))

(declare-fun lt!390327 () (_ BitVec 64))

(declare-fun lt!390328 () (_ BitVec 64))

(declare-fun lt!390331 () (_ BitVec 64))

(assert (=> d!84114 (= res!210363 (= lt!390327 (bvsub lt!390331 lt!390328)))))

(assert (=> d!84114 (or (= (bvand lt!390331 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!390328 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!390331 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!390331 lt!390328) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84114 (= lt!390328 (remainingBits!0 ((_ sign_extend 32) (size!5997 (buf!6496 thiss!1005))) ((_ sign_extend 32) (currentByte!11945 thiss!1005)) ((_ sign_extend 32) (currentBit!11940 thiss!1005))))))

(declare-fun lt!390332 () (_ BitVec 64))

(declare-fun lt!390329 () (_ BitVec 64))

(assert (=> d!84114 (= lt!390331 (bvmul lt!390332 lt!390329))))

(assert (=> d!84114 (or (= lt!390332 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!390329 (bvsdiv (bvmul lt!390332 lt!390329) lt!390332)))))

(assert (=> d!84114 (= lt!390329 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84114 (= lt!390332 ((_ sign_extend 32) (size!5997 (buf!6496 thiss!1005))))))

(assert (=> d!84114 (= lt!390327 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11945 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11940 thiss!1005))))))

(assert (=> d!84114 (invariant!0 (currentBit!11940 thiss!1005) (currentByte!11945 thiss!1005) (size!5997 (buf!6496 thiss!1005)))))

(assert (=> d!84114 (= (bitIndex!0 (size!5997 (buf!6496 thiss!1005)) (currentByte!11945 thiss!1005) (currentBit!11940 thiss!1005)) lt!390327)))

(declare-fun b!251218 () Bool)

(declare-fun res!210364 () Bool)

(assert (=> b!251218 (=> (not res!210364) (not e!174080))))

(assert (=> b!251218 (= res!210364 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!390327))))

(declare-fun b!251219 () Bool)

(declare-fun lt!390330 () (_ BitVec 64))

(assert (=> b!251219 (= e!174080 (bvsle lt!390327 (bvmul lt!390330 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!251219 (or (= lt!390330 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!390330 #b0000000000000000000000000000000000000000000000000000000000001000) lt!390330)))))

(assert (=> b!251219 (= lt!390330 ((_ sign_extend 32) (size!5997 (buf!6496 thiss!1005))))))

(assert (= (and d!84114 res!210363) b!251218))

(assert (= (and b!251218 res!210364) b!251219))

(declare-fun m!377983 () Bool)

(assert (=> d!84114 m!377983))

(declare-fun m!377985 () Bool)

(assert (=> d!84114 m!377985))

(assert (=> b!251117 d!84114))

(declare-fun d!84116 () Bool)

(assert (=> d!84116 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5997 (buf!6496 thiss!1005))) ((_ sign_extend 32) (currentByte!11945 thiss!1005)) ((_ sign_extend 32) (currentBit!11940 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5997 (buf!6496 thiss!1005))) ((_ sign_extend 32) (currentByte!11945 thiss!1005)) ((_ sign_extend 32) (currentBit!11940 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!21304 () Bool)

(assert (= bs!21304 d!84116))

(assert (=> bs!21304 m!377983))

(assert (=> b!251118 d!84116))

(declare-fun d!84118 () Bool)

(declare-datatypes ((tuple2!21554 0))(
  ( (tuple2!21555 (_1!11705 Bool) (_2!11705 BitStream!10916)) )
))
(declare-fun lt!390335 () tuple2!21554)

(declare-fun readBit!0 (BitStream!10916) tuple2!21554)

(assert (=> d!84118 (= lt!390335 (readBit!0 (readerFrom!0 (_2!11701 lt!390107) (currentBit!11940 thiss!1005) (currentByte!11945 thiss!1005))))))

(assert (=> d!84118 (= (readBitPure!0 (readerFrom!0 (_2!11701 lt!390107) (currentBit!11940 thiss!1005) (currentByte!11945 thiss!1005))) (tuple2!21551 (_2!11705 lt!390335) (_1!11705 lt!390335)))))

(declare-fun bs!21305 () Bool)

(assert (= bs!21305 d!84118))

(assert (=> bs!21305 m!377787))

(declare-fun m!377987 () Bool)

(assert (=> bs!21305 m!377987))

(assert (=> b!251120 d!84118))

(declare-fun d!84120 () Bool)

(declare-fun e!174083 () Bool)

(assert (=> d!84120 e!174083))

(declare-fun res!210368 () Bool)

(assert (=> d!84120 (=> (not res!210368) (not e!174083))))

(assert (=> d!84120 (= res!210368 (invariant!0 (currentBit!11940 (_2!11701 lt!390107)) (currentByte!11945 (_2!11701 lt!390107)) (size!5997 (buf!6496 (_2!11701 lt!390107)))))))

(assert (=> d!84120 (= (readerFrom!0 (_2!11701 lt!390107) (currentBit!11940 thiss!1005) (currentByte!11945 thiss!1005)) (BitStream!10917 (buf!6496 (_2!11701 lt!390107)) (currentByte!11945 thiss!1005) (currentBit!11940 thiss!1005)))))

(declare-fun b!251222 () Bool)

(assert (=> b!251222 (= e!174083 (invariant!0 (currentBit!11940 thiss!1005) (currentByte!11945 thiss!1005) (size!5997 (buf!6496 (_2!11701 lt!390107)))))))

(assert (= (and d!84120 res!210368) b!251222))

(assert (=> d!84120 m!377981))

(assert (=> b!251222 m!377819))

(assert (=> b!251120 d!84120))

(declare-fun d!84122 () Bool)

(assert (=> d!84122 (= (invariant!0 (currentBit!11940 thiss!1005) (currentByte!11945 thiss!1005) (size!5997 (buf!6496 (_2!11701 lt!390113)))) (and (bvsge (currentBit!11940 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11940 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11945 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11945 thiss!1005) (size!5997 (buf!6496 (_2!11701 lt!390113)))) (and (= (currentBit!11940 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11945 thiss!1005) (size!5997 (buf!6496 (_2!11701 lt!390113))))))))))

(assert (=> b!251119 d!84122))

(declare-fun d!84124 () Bool)

(assert (=> d!84124 (= (invariant!0 (currentBit!11940 thiss!1005) (currentByte!11945 thiss!1005) (size!5997 (buf!6496 (_2!11701 lt!390107)))) (and (bvsge (currentBit!11940 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11940 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11945 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11945 thiss!1005) (size!5997 (buf!6496 (_2!11701 lt!390107)))) (and (= (currentBit!11940 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11945 thiss!1005) (size!5997 (buf!6496 (_2!11701 lt!390107))))))))))

(assert (=> b!251122 d!84124))

(declare-fun d!84126 () Bool)

(declare-fun res!210375 () Bool)

(declare-fun e!174088 () Bool)

(assert (=> d!84126 (=> (not res!210375) (not e!174088))))

(assert (=> d!84126 (= res!210375 (= (size!5997 (buf!6496 (_2!11701 lt!390107))) (size!5997 (buf!6496 (_2!11701 lt!390113)))))))

(assert (=> d!84126 (= (isPrefixOf!0 (_2!11701 lt!390107) (_2!11701 lt!390113)) e!174088)))

(declare-fun b!251229 () Bool)

(declare-fun res!210376 () Bool)

(assert (=> b!251229 (=> (not res!210376) (not e!174088))))

(assert (=> b!251229 (= res!210376 (bvsle (bitIndex!0 (size!5997 (buf!6496 (_2!11701 lt!390107))) (currentByte!11945 (_2!11701 lt!390107)) (currentBit!11940 (_2!11701 lt!390107))) (bitIndex!0 (size!5997 (buf!6496 (_2!11701 lt!390113))) (currentByte!11945 (_2!11701 lt!390113)) (currentBit!11940 (_2!11701 lt!390113)))))))

(declare-fun b!251230 () Bool)

(declare-fun e!174089 () Bool)

(assert (=> b!251230 (= e!174088 e!174089)))

(declare-fun res!210377 () Bool)

(assert (=> b!251230 (=> res!210377 e!174089)))

(assert (=> b!251230 (= res!210377 (= (size!5997 (buf!6496 (_2!11701 lt!390107))) #b00000000000000000000000000000000))))

(declare-fun b!251231 () Bool)

(declare-fun arrayBitRangesEq!0 (array!13673 array!13673 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!251231 (= e!174089 (arrayBitRangesEq!0 (buf!6496 (_2!11701 lt!390107)) (buf!6496 (_2!11701 lt!390113)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5997 (buf!6496 (_2!11701 lt!390107))) (currentByte!11945 (_2!11701 lt!390107)) (currentBit!11940 (_2!11701 lt!390107)))))))

(assert (= (and d!84126 res!210375) b!251229))

(assert (= (and b!251229 res!210376) b!251230))

(assert (= (and b!251230 (not res!210377)) b!251231))

(assert (=> b!251229 m!377783))

(assert (=> b!251229 m!377829))

(assert (=> b!251231 m!377783))

(assert (=> b!251231 m!377783))

(declare-fun m!377989 () Bool)

(assert (=> b!251231 m!377989))

(assert (=> b!251113 d!84126))

(declare-fun lt!390338 () tuple2!21554)

(declare-fun d!84128 () Bool)

(declare-fun checkBitsLoop!0 (BitStream!10916 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21554)

(assert (=> d!84128 (= lt!390338 (checkBitsLoop!0 (_1!11702 lt!390109) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!84128 (= (checkBitsLoopPure!0 (_1!11702 lt!390109) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21551 (_2!11705 lt!390338) (_1!11705 lt!390338)))))

(declare-fun bs!21306 () Bool)

(assert (= bs!21306 d!84128))

(declare-fun m!377991 () Bool)

(assert (=> bs!21306 m!377991))

(assert (=> b!251124 d!84128))

(declare-fun d!84132 () Bool)

(assert (=> d!84132 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5997 (buf!6496 (_2!11701 lt!390113)))) ((_ sign_extend 32) (currentByte!11945 (_2!11701 lt!390107))) ((_ sign_extend 32) (currentBit!11940 (_2!11701 lt!390107))) lt!390102) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5997 (buf!6496 (_2!11701 lt!390113)))) ((_ sign_extend 32) (currentByte!11945 (_2!11701 lt!390107))) ((_ sign_extend 32) (currentBit!11940 (_2!11701 lt!390107)))) lt!390102))))

(declare-fun bs!21307 () Bool)

(assert (= bs!21307 d!84132))

(declare-fun m!377993 () Bool)

(assert (=> bs!21307 m!377993))

(assert (=> b!251124 d!84132))

(declare-fun d!84134 () Bool)

(assert (=> d!84134 (validate_offset_bits!1 ((_ sign_extend 32) (size!5997 (buf!6496 (_2!11701 lt!390113)))) ((_ sign_extend 32) (currentByte!11945 (_2!11701 lt!390107))) ((_ sign_extend 32) (currentBit!11940 (_2!11701 lt!390107))) lt!390102)))

(declare-fun lt!390344 () Unit!18136)

(declare-fun choose!9 (BitStream!10916 array!13673 (_ BitVec 64) BitStream!10916) Unit!18136)

(assert (=> d!84134 (= lt!390344 (choose!9 (_2!11701 lt!390107) (buf!6496 (_2!11701 lt!390113)) lt!390102 (BitStream!10917 (buf!6496 (_2!11701 lt!390113)) (currentByte!11945 (_2!11701 lt!390107)) (currentBit!11940 (_2!11701 lt!390107)))))))

(assert (=> d!84134 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11701 lt!390107) (buf!6496 (_2!11701 lt!390113)) lt!390102) lt!390344)))

(declare-fun bs!21309 () Bool)

(assert (= bs!21309 d!84134))

(assert (=> bs!21309 m!377777))

(declare-fun m!377997 () Bool)

(assert (=> bs!21309 m!377997))

(assert (=> b!251124 d!84134))

(declare-fun b!251267 () Bool)

(declare-fun e!174110 () Unit!18136)

(declare-fun Unit!18140 () Unit!18136)

(assert (=> b!251267 (= e!174110 Unit!18140)))

(declare-fun b!251268 () Bool)

(declare-fun res!210412 () Bool)

(declare-fun e!174111 () Bool)

(assert (=> b!251268 (=> (not res!210412) (not e!174111))))

(declare-fun lt!390424 () tuple2!21548)

(assert (=> b!251268 (= res!210412 (isPrefixOf!0 (_2!11702 lt!390424) (_2!11701 lt!390113)))))

(declare-fun b!251269 () Bool)

(declare-fun lt!390426 () Unit!18136)

(assert (=> b!251269 (= e!174110 lt!390426)))

(declare-fun lt!390430 () (_ BitVec 64))

(assert (=> b!251269 (= lt!390430 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!390427 () (_ BitVec 64))

(assert (=> b!251269 (= lt!390427 (bitIndex!0 (size!5997 (buf!6496 (_2!11701 lt!390107))) (currentByte!11945 (_2!11701 lt!390107)) (currentBit!11940 (_2!11701 lt!390107))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!13673 array!13673 (_ BitVec 64) (_ BitVec 64)) Unit!18136)

(assert (=> b!251269 (= lt!390426 (arrayBitRangesEqSymmetric!0 (buf!6496 (_2!11701 lt!390107)) (buf!6496 (_2!11701 lt!390113)) lt!390430 lt!390427))))

(assert (=> b!251269 (arrayBitRangesEq!0 (buf!6496 (_2!11701 lt!390113)) (buf!6496 (_2!11701 lt!390107)) lt!390430 lt!390427)))

(declare-fun lt!390422 () (_ BitVec 64))

(declare-fun b!251270 () Bool)

(declare-fun lt!390434 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!10916 (_ BitVec 64)) BitStream!10916)

(assert (=> b!251270 (= e!174111 (= (_1!11702 lt!390424) (withMovedBitIndex!0 (_2!11702 lt!390424) (bvsub lt!390434 lt!390422))))))

(assert (=> b!251270 (or (= (bvand lt!390434 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!390422 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!390434 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!390434 lt!390422) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!251270 (= lt!390422 (bitIndex!0 (size!5997 (buf!6496 (_2!11701 lt!390113))) (currentByte!11945 (_2!11701 lt!390113)) (currentBit!11940 (_2!11701 lt!390113))))))

(assert (=> b!251270 (= lt!390434 (bitIndex!0 (size!5997 (buf!6496 (_2!11701 lt!390107))) (currentByte!11945 (_2!11701 lt!390107)) (currentBit!11940 (_2!11701 lt!390107))))))

(declare-fun d!84138 () Bool)

(assert (=> d!84138 e!174111))

(declare-fun res!210411 () Bool)

(assert (=> d!84138 (=> (not res!210411) (not e!174111))))

(assert (=> d!84138 (= res!210411 (isPrefixOf!0 (_1!11702 lt!390424) (_2!11702 lt!390424)))))

(declare-fun lt!390417 () BitStream!10916)

(assert (=> d!84138 (= lt!390424 (tuple2!21549 lt!390417 (_2!11701 lt!390113)))))

(declare-fun lt!390432 () Unit!18136)

(declare-fun lt!390420 () Unit!18136)

(assert (=> d!84138 (= lt!390432 lt!390420)))

(assert (=> d!84138 (isPrefixOf!0 lt!390417 (_2!11701 lt!390113))))

(assert (=> d!84138 (= lt!390420 (lemmaIsPrefixTransitive!0 lt!390417 (_2!11701 lt!390113) (_2!11701 lt!390113)))))

(declare-fun lt!390431 () Unit!18136)

(declare-fun lt!390433 () Unit!18136)

(assert (=> d!84138 (= lt!390431 lt!390433)))

(assert (=> d!84138 (isPrefixOf!0 lt!390417 (_2!11701 lt!390113))))

(assert (=> d!84138 (= lt!390433 (lemmaIsPrefixTransitive!0 lt!390417 (_2!11701 lt!390107) (_2!11701 lt!390113)))))

(declare-fun lt!390421 () Unit!18136)

(assert (=> d!84138 (= lt!390421 e!174110)))

(declare-fun c!11621 () Bool)

(assert (=> d!84138 (= c!11621 (not (= (size!5997 (buf!6496 (_2!11701 lt!390107))) #b00000000000000000000000000000000)))))

(declare-fun lt!390428 () Unit!18136)

(declare-fun lt!390419 () Unit!18136)

(assert (=> d!84138 (= lt!390428 lt!390419)))

(assert (=> d!84138 (isPrefixOf!0 (_2!11701 lt!390113) (_2!11701 lt!390113))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10916) Unit!18136)

(assert (=> d!84138 (= lt!390419 (lemmaIsPrefixRefl!0 (_2!11701 lt!390113)))))

(declare-fun lt!390418 () Unit!18136)

(declare-fun lt!390429 () Unit!18136)

(assert (=> d!84138 (= lt!390418 lt!390429)))

(assert (=> d!84138 (= lt!390429 (lemmaIsPrefixRefl!0 (_2!11701 lt!390113)))))

(declare-fun lt!390415 () Unit!18136)

(declare-fun lt!390416 () Unit!18136)

(assert (=> d!84138 (= lt!390415 lt!390416)))

(assert (=> d!84138 (isPrefixOf!0 lt!390417 lt!390417)))

(assert (=> d!84138 (= lt!390416 (lemmaIsPrefixRefl!0 lt!390417))))

(declare-fun lt!390423 () Unit!18136)

(declare-fun lt!390425 () Unit!18136)

(assert (=> d!84138 (= lt!390423 lt!390425)))

(assert (=> d!84138 (isPrefixOf!0 (_2!11701 lt!390107) (_2!11701 lt!390107))))

(assert (=> d!84138 (= lt!390425 (lemmaIsPrefixRefl!0 (_2!11701 lt!390107)))))

(assert (=> d!84138 (= lt!390417 (BitStream!10917 (buf!6496 (_2!11701 lt!390113)) (currentByte!11945 (_2!11701 lt!390107)) (currentBit!11940 (_2!11701 lt!390107))))))

(assert (=> d!84138 (isPrefixOf!0 (_2!11701 lt!390107) (_2!11701 lt!390113))))

(assert (=> d!84138 (= (reader!0 (_2!11701 lt!390107) (_2!11701 lt!390113)) lt!390424)))

(declare-fun b!251271 () Bool)

(declare-fun res!210410 () Bool)

(assert (=> b!251271 (=> (not res!210410) (not e!174111))))

(assert (=> b!251271 (= res!210410 (isPrefixOf!0 (_1!11702 lt!390424) (_2!11701 lt!390107)))))

(assert (= (and d!84138 c!11621) b!251269))

(assert (= (and d!84138 (not c!11621)) b!251267))

(assert (= (and d!84138 res!210411) b!251271))

(assert (= (and b!251271 res!210410) b!251268))

(assert (= (and b!251268 res!210412) b!251270))

(declare-fun m!378021 () Bool)

(assert (=> b!251268 m!378021))

(declare-fun m!378023 () Bool)

(assert (=> b!251270 m!378023))

(assert (=> b!251270 m!377829))

(assert (=> b!251270 m!377783))

(declare-fun m!378025 () Bool)

(assert (=> d!84138 m!378025))

(declare-fun m!378027 () Bool)

(assert (=> d!84138 m!378027))

(declare-fun m!378029 () Bool)

(assert (=> d!84138 m!378029))

(declare-fun m!378031 () Bool)

(assert (=> d!84138 m!378031))

(declare-fun m!378033 () Bool)

(assert (=> d!84138 m!378033))

(declare-fun m!378035 () Bool)

(assert (=> d!84138 m!378035))

(declare-fun m!378037 () Bool)

(assert (=> d!84138 m!378037))

(declare-fun m!378039 () Bool)

(assert (=> d!84138 m!378039))

(declare-fun m!378041 () Bool)

(assert (=> d!84138 m!378041))

(assert (=> d!84138 m!377833))

(declare-fun m!378043 () Bool)

(assert (=> d!84138 m!378043))

(declare-fun m!378045 () Bool)

(assert (=> b!251271 m!378045))

(assert (=> b!251269 m!377783))

(declare-fun m!378047 () Bool)

(assert (=> b!251269 m!378047))

(declare-fun m!378049 () Bool)

(assert (=> b!251269 m!378049))

(assert (=> b!251124 d!84138))

(declare-fun d!84164 () Bool)

(declare-fun e!174112 () Bool)

(assert (=> d!84164 e!174112))

(declare-fun res!210413 () Bool)

(assert (=> d!84164 (=> (not res!210413) (not e!174112))))

(declare-fun lt!390442 () (_ BitVec 64))

(declare-fun lt!390438 () (_ BitVec 64))

(declare-fun lt!390439 () (_ BitVec 64))

(assert (=> d!84164 (= res!210413 (= lt!390438 (bvsub lt!390442 lt!390439)))))

(assert (=> d!84164 (or (= (bvand lt!390442 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!390439 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!390442 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!390442 lt!390439) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84164 (= lt!390439 (remainingBits!0 ((_ sign_extend 32) (size!5997 (buf!6496 (_2!11701 lt!390113)))) ((_ sign_extend 32) (currentByte!11945 (_2!11701 lt!390113))) ((_ sign_extend 32) (currentBit!11940 (_2!11701 lt!390113)))))))

(declare-fun lt!390443 () (_ BitVec 64))

(declare-fun lt!390440 () (_ BitVec 64))

(assert (=> d!84164 (= lt!390442 (bvmul lt!390443 lt!390440))))

(assert (=> d!84164 (or (= lt!390443 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!390440 (bvsdiv (bvmul lt!390443 lt!390440) lt!390443)))))

(assert (=> d!84164 (= lt!390440 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84164 (= lt!390443 ((_ sign_extend 32) (size!5997 (buf!6496 (_2!11701 lt!390113)))))))

(assert (=> d!84164 (= lt!390438 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11945 (_2!11701 lt!390113))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11940 (_2!11701 lt!390113)))))))

(assert (=> d!84164 (invariant!0 (currentBit!11940 (_2!11701 lt!390113)) (currentByte!11945 (_2!11701 lt!390113)) (size!5997 (buf!6496 (_2!11701 lt!390113))))))

(assert (=> d!84164 (= (bitIndex!0 (size!5997 (buf!6496 (_2!11701 lt!390113))) (currentByte!11945 (_2!11701 lt!390113)) (currentBit!11940 (_2!11701 lt!390113))) lt!390438)))

(declare-fun b!251272 () Bool)

(declare-fun res!210414 () Bool)

(assert (=> b!251272 (=> (not res!210414) (not e!174112))))

(assert (=> b!251272 (= res!210414 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!390438))))

(declare-fun b!251273 () Bool)

(declare-fun lt!390441 () (_ BitVec 64))

(assert (=> b!251273 (= e!174112 (bvsle lt!390438 (bvmul lt!390441 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!251273 (or (= lt!390441 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!390441 #b0000000000000000000000000000000000000000000000000000000000001000) lt!390441)))))

(assert (=> b!251273 (= lt!390441 ((_ sign_extend 32) (size!5997 (buf!6496 (_2!11701 lt!390113)))))))

(assert (= (and d!84164 res!210413) b!251272))

(assert (= (and b!251272 res!210414) b!251273))

(declare-fun m!378051 () Bool)

(assert (=> d!84164 m!378051))

(declare-fun m!378053 () Bool)

(assert (=> d!84164 m!378053))

(assert (=> b!251123 d!84164))

(assert (=> b!251123 d!84112))

(declare-fun d!84166 () Bool)

(assert (=> d!84166 (= (inv!12 thiss!1005) (invariant!0 (currentBit!11940 thiss!1005) (currentByte!11945 thiss!1005) (size!5997 (buf!6496 thiss!1005))))))

(declare-fun bs!21313 () Bool)

(assert (= bs!21313 d!84166))

(assert (=> bs!21313 m!377985))

(assert (=> start!53956 d!84166))

(declare-fun d!84168 () Bool)

(assert (=> d!84168 (= (array_inv!5738 (buf!6496 thiss!1005)) (bvsge (size!5997 (buf!6496 thiss!1005)) #b00000000000000000000000000000000))))

(assert (=> b!251125 d!84168))

(declare-fun d!84172 () Bool)

(declare-fun res!210415 () Bool)

(declare-fun e!174113 () Bool)

(assert (=> d!84172 (=> (not res!210415) (not e!174113))))

(assert (=> d!84172 (= res!210415 (= (size!5997 (buf!6496 thiss!1005)) (size!5997 (buf!6496 (_2!11701 lt!390107)))))))

(assert (=> d!84172 (= (isPrefixOf!0 thiss!1005 (_2!11701 lt!390107)) e!174113)))

(declare-fun b!251274 () Bool)

(declare-fun res!210416 () Bool)

(assert (=> b!251274 (=> (not res!210416) (not e!174113))))

(assert (=> b!251274 (= res!210416 (bvsle (bitIndex!0 (size!5997 (buf!6496 thiss!1005)) (currentByte!11945 thiss!1005) (currentBit!11940 thiss!1005)) (bitIndex!0 (size!5997 (buf!6496 (_2!11701 lt!390107))) (currentByte!11945 (_2!11701 lt!390107)) (currentBit!11940 (_2!11701 lt!390107)))))))

(declare-fun b!251275 () Bool)

(declare-fun e!174114 () Bool)

(assert (=> b!251275 (= e!174113 e!174114)))

(declare-fun res!210417 () Bool)

(assert (=> b!251275 (=> res!210417 e!174114)))

(assert (=> b!251275 (= res!210417 (= (size!5997 (buf!6496 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!251276 () Bool)

(assert (=> b!251276 (= e!174114 (arrayBitRangesEq!0 (buf!6496 thiss!1005) (buf!6496 (_2!11701 lt!390107)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5997 (buf!6496 thiss!1005)) (currentByte!11945 thiss!1005) (currentBit!11940 thiss!1005))))))

(assert (= (and d!84172 res!210415) b!251274))

(assert (= (and b!251274 res!210416) b!251275))

(assert (= (and b!251275 (not res!210417)) b!251276))

(assert (=> b!251274 m!377785))

(assert (=> b!251274 m!377783))

(assert (=> b!251276 m!377785))

(assert (=> b!251276 m!377785))

(declare-fun m!378057 () Bool)

(assert (=> b!251276 m!378057))

(assert (=> b!251114 d!84172))

(declare-fun d!84174 () Bool)

(declare-fun e!174115 () Bool)

(assert (=> d!84174 e!174115))

(declare-fun res!210418 () Bool)

(assert (=> d!84174 (=> (not res!210418) (not e!174115))))

(declare-fun lt!390447 () (_ BitVec 64))

(declare-fun lt!390451 () (_ BitVec 64))

(declare-fun lt!390448 () (_ BitVec 64))

(assert (=> d!84174 (= res!210418 (= lt!390447 (bvsub lt!390451 lt!390448)))))

(assert (=> d!84174 (or (= (bvand lt!390451 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!390448 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!390451 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!390451 lt!390448) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84174 (= lt!390448 (remainingBits!0 ((_ sign_extend 32) (size!5997 (buf!6496 (_1!11703 lt!390111)))) ((_ sign_extend 32) (currentByte!11945 (_1!11703 lt!390111))) ((_ sign_extend 32) (currentBit!11940 (_1!11703 lt!390111)))))))

(declare-fun lt!390452 () (_ BitVec 64))

(declare-fun lt!390449 () (_ BitVec 64))

(assert (=> d!84174 (= lt!390451 (bvmul lt!390452 lt!390449))))

(assert (=> d!84174 (or (= lt!390452 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!390449 (bvsdiv (bvmul lt!390452 lt!390449) lt!390452)))))

(assert (=> d!84174 (= lt!390449 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84174 (= lt!390452 ((_ sign_extend 32) (size!5997 (buf!6496 (_1!11703 lt!390111)))))))

(assert (=> d!84174 (= lt!390447 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11945 (_1!11703 lt!390111))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11940 (_1!11703 lt!390111)))))))

(assert (=> d!84174 (invariant!0 (currentBit!11940 (_1!11703 lt!390111)) (currentByte!11945 (_1!11703 lt!390111)) (size!5997 (buf!6496 (_1!11703 lt!390111))))))

(assert (=> d!84174 (= (bitIndex!0 (size!5997 (buf!6496 (_1!11703 lt!390111))) (currentByte!11945 (_1!11703 lt!390111)) (currentBit!11940 (_1!11703 lt!390111))) lt!390447)))

(declare-fun b!251277 () Bool)

(declare-fun res!210419 () Bool)

(assert (=> b!251277 (=> (not res!210419) (not e!174115))))

(assert (=> b!251277 (= res!210419 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!390447))))

(declare-fun b!251278 () Bool)

(declare-fun lt!390450 () (_ BitVec 64))

(assert (=> b!251278 (= e!174115 (bvsle lt!390447 (bvmul lt!390450 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!251278 (or (= lt!390450 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!390450 #b0000000000000000000000000000000000000000000000000000000000001000) lt!390450)))))

(assert (=> b!251278 (= lt!390450 ((_ sign_extend 32) (size!5997 (buf!6496 (_1!11703 lt!390111)))))))

(assert (= (and d!84174 res!210418) b!251277))

(assert (= (and b!251277 res!210419) b!251278))

(declare-fun m!378059 () Bool)

(assert (=> d!84174 m!378059))

(declare-fun m!378061 () Bool)

(assert (=> d!84174 m!378061))

(assert (=> b!251116 d!84174))

(declare-fun d!84176 () Bool)

(declare-fun lt!390453 () tuple2!21554)

(assert (=> d!84176 (= lt!390453 (readBit!0 lt!390108))))

(assert (=> d!84176 (= (readBitPure!0 lt!390108) (tuple2!21551 (_2!11705 lt!390453) (_1!11705 lt!390453)))))

(declare-fun bs!21315 () Bool)

(assert (= bs!21315 d!84176))

(declare-fun m!378063 () Bool)

(assert (=> bs!21315 m!378063))

(assert (=> b!251115 d!84176))

(declare-fun d!84178 () Bool)

(declare-fun res!210420 () Bool)

(declare-fun e!174116 () Bool)

(assert (=> d!84178 (=> (not res!210420) (not e!174116))))

(assert (=> d!84178 (= res!210420 (= (size!5997 (buf!6496 thiss!1005)) (size!5997 (buf!6496 (_2!11701 lt!390113)))))))

(assert (=> d!84178 (= (isPrefixOf!0 thiss!1005 (_2!11701 lt!390113)) e!174116)))

(declare-fun b!251279 () Bool)

(declare-fun res!210421 () Bool)

(assert (=> b!251279 (=> (not res!210421) (not e!174116))))

(assert (=> b!251279 (= res!210421 (bvsle (bitIndex!0 (size!5997 (buf!6496 thiss!1005)) (currentByte!11945 thiss!1005) (currentBit!11940 thiss!1005)) (bitIndex!0 (size!5997 (buf!6496 (_2!11701 lt!390113))) (currentByte!11945 (_2!11701 lt!390113)) (currentBit!11940 (_2!11701 lt!390113)))))))

(declare-fun b!251280 () Bool)

(declare-fun e!174117 () Bool)

(assert (=> b!251280 (= e!174116 e!174117)))

(declare-fun res!210422 () Bool)

(assert (=> b!251280 (=> res!210422 e!174117)))

(assert (=> b!251280 (= res!210422 (= (size!5997 (buf!6496 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!251281 () Bool)

(assert (=> b!251281 (= e!174117 (arrayBitRangesEq!0 (buf!6496 thiss!1005) (buf!6496 (_2!11701 lt!390113)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5997 (buf!6496 thiss!1005)) (currentByte!11945 thiss!1005) (currentBit!11940 thiss!1005))))))

(assert (= (and d!84178 res!210420) b!251279))

(assert (= (and b!251279 res!210421) b!251280))

(assert (= (and b!251280 (not res!210422)) b!251281))

(assert (=> b!251279 m!377785))

(assert (=> b!251279 m!377829))

(assert (=> b!251281 m!377785))

(assert (=> b!251281 m!377785))

(declare-fun m!378065 () Bool)

(assert (=> b!251281 m!378065))

(assert (=> b!251115 d!84178))

(declare-fun d!84180 () Bool)

(declare-fun e!174120 () Bool)

(assert (=> d!84180 e!174120))

(declare-fun res!210425 () Bool)

(assert (=> d!84180 (=> (not res!210425) (not e!174120))))

(declare-fun lt!390462 () tuple2!21550)

(declare-fun lt!390465 () tuple2!21550)

(assert (=> d!84180 (= res!210425 (= (bitIndex!0 (size!5997 (buf!6496 (_1!11703 lt!390462))) (currentByte!11945 (_1!11703 lt!390462)) (currentBit!11940 (_1!11703 lt!390462))) (bitIndex!0 (size!5997 (buf!6496 (_1!11703 lt!390465))) (currentByte!11945 (_1!11703 lt!390465)) (currentBit!11940 (_1!11703 lt!390465)))))))

(declare-fun lt!390464 () BitStream!10916)

(declare-fun lt!390463 () Unit!18136)

(declare-fun choose!50 (BitStream!10916 BitStream!10916 BitStream!10916 tuple2!21550 tuple2!21550 BitStream!10916 Bool tuple2!21550 tuple2!21550 BitStream!10916 Bool) Unit!18136)

(assert (=> d!84180 (= lt!390463 (choose!50 lt!390108 (_2!11701 lt!390113) lt!390464 lt!390462 (tuple2!21551 (_1!11703 lt!390462) (_2!11703 lt!390462)) (_1!11703 lt!390462) (_2!11703 lt!390462) lt!390465 (tuple2!21551 (_1!11703 lt!390465) (_2!11703 lt!390465)) (_1!11703 lt!390465) (_2!11703 lt!390465)))))

(assert (=> d!84180 (= lt!390465 (readBitPure!0 lt!390464))))

(assert (=> d!84180 (= lt!390462 (readBitPure!0 lt!390108))))

(assert (=> d!84180 (= lt!390464 (BitStream!10917 (buf!6496 (_2!11701 lt!390113)) (currentByte!11945 lt!390108) (currentBit!11940 lt!390108)))))

(assert (=> d!84180 (invariant!0 (currentBit!11940 lt!390108) (currentByte!11945 lt!390108) (size!5997 (buf!6496 (_2!11701 lt!390113))))))

(assert (=> d!84180 (= (readBitPrefixLemma!0 lt!390108 (_2!11701 lt!390113)) lt!390463)))

(declare-fun b!251284 () Bool)

(assert (=> b!251284 (= e!174120 (= (_2!11703 lt!390462) (_2!11703 lt!390465)))))

(assert (= (and d!84180 res!210425) b!251284))

(declare-fun m!378067 () Bool)

(assert (=> d!84180 m!378067))

(declare-fun m!378069 () Bool)

(assert (=> d!84180 m!378069))

(declare-fun m!378071 () Bool)

(assert (=> d!84180 m!378071))

(declare-fun m!378073 () Bool)

(assert (=> d!84180 m!378073))

(assert (=> d!84180 m!377815))

(declare-fun m!378075 () Bool)

(assert (=> d!84180 m!378075))

(assert (=> b!251115 d!84180))

(declare-fun d!84182 () Bool)

(assert (=> d!84182 (isPrefixOf!0 thiss!1005 (_2!11701 lt!390113))))

(declare-fun lt!390468 () Unit!18136)

(declare-fun choose!30 (BitStream!10916 BitStream!10916 BitStream!10916) Unit!18136)

(assert (=> d!84182 (= lt!390468 (choose!30 thiss!1005 (_2!11701 lt!390107) (_2!11701 lt!390113)))))

(assert (=> d!84182 (isPrefixOf!0 thiss!1005 (_2!11701 lt!390107))))

(assert (=> d!84182 (= (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11701 lt!390107) (_2!11701 lt!390113)) lt!390468)))

(declare-fun bs!21316 () Bool)

(assert (= bs!21316 d!84182))

(assert (=> bs!21316 m!377805))

(declare-fun m!378077 () Bool)

(assert (=> bs!21316 m!378077))

(assert (=> bs!21316 m!377825))

(assert (=> b!251115 d!84182))

(declare-fun d!84184 () Bool)

(declare-fun e!174123 () Bool)

(assert (=> d!84184 e!174123))

(declare-fun res!210428 () Bool)

(assert (=> d!84184 (=> (not res!210428) (not e!174123))))

(assert (=> d!84184 (= res!210428 (or (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!390471 () Unit!18136)

(declare-fun choose!27 (BitStream!10916 BitStream!10916 (_ BitVec 64) (_ BitVec 64)) Unit!18136)

(assert (=> d!84184 (= lt!390471 (choose!27 thiss!1005 (_2!11701 lt!390107) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!84184 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!297 from!289)))))

(assert (=> d!84184 (= (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11701 lt!390107) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) lt!390471)))

(declare-fun b!251287 () Bool)

(assert (=> b!251287 (= e!174123 (validate_offset_bits!1 ((_ sign_extend 32) (size!5997 (buf!6496 (_2!11701 lt!390107)))) ((_ sign_extend 32) (currentByte!11945 (_2!11701 lt!390107))) ((_ sign_extend 32) (currentBit!11940 (_2!11701 lt!390107))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!84184 res!210428) b!251287))

(declare-fun m!378079 () Bool)

(assert (=> d!84184 m!378079))

(assert (=> b!251287 m!377799))

(assert (=> b!251115 d!84184))

(declare-fun d!84186 () Bool)

(declare-fun e!174124 () Bool)

(assert (=> d!84186 e!174124))

(declare-fun res!210429 () Bool)

(assert (=> d!84186 (=> (not res!210429) (not e!174124))))

(declare-fun lt!390476 () (_ BitVec 64))

(declare-fun lt!390472 () (_ BitVec 64))

(declare-fun lt!390473 () (_ BitVec 64))

(assert (=> d!84186 (= res!210429 (= lt!390472 (bvsub lt!390476 lt!390473)))))

(assert (=> d!84186 (or (= (bvand lt!390476 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!390473 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!390476 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!390476 lt!390473) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84186 (= lt!390473 (remainingBits!0 ((_ sign_extend 32) (size!5997 (buf!6496 (_1!11703 lt!390101)))) ((_ sign_extend 32) (currentByte!11945 (_1!11703 lt!390101))) ((_ sign_extend 32) (currentBit!11940 (_1!11703 lt!390101)))))))

(declare-fun lt!390477 () (_ BitVec 64))

(declare-fun lt!390474 () (_ BitVec 64))

(assert (=> d!84186 (= lt!390476 (bvmul lt!390477 lt!390474))))

(assert (=> d!84186 (or (= lt!390477 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!390474 (bvsdiv (bvmul lt!390477 lt!390474) lt!390477)))))

(assert (=> d!84186 (= lt!390474 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84186 (= lt!390477 ((_ sign_extend 32) (size!5997 (buf!6496 (_1!11703 lt!390101)))))))

(assert (=> d!84186 (= lt!390472 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11945 (_1!11703 lt!390101))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11940 (_1!11703 lt!390101)))))))

(assert (=> d!84186 (invariant!0 (currentBit!11940 (_1!11703 lt!390101)) (currentByte!11945 (_1!11703 lt!390101)) (size!5997 (buf!6496 (_1!11703 lt!390101))))))

(assert (=> d!84186 (= (bitIndex!0 (size!5997 (buf!6496 (_1!11703 lt!390101))) (currentByte!11945 (_1!11703 lt!390101)) (currentBit!11940 (_1!11703 lt!390101))) lt!390472)))

(declare-fun b!251288 () Bool)

(declare-fun res!210430 () Bool)

(assert (=> b!251288 (=> (not res!210430) (not e!174124))))

(assert (=> b!251288 (= res!210430 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!390472))))

(declare-fun b!251289 () Bool)

(declare-fun lt!390475 () (_ BitVec 64))

(assert (=> b!251289 (= e!174124 (bvsle lt!390472 (bvmul lt!390475 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!251289 (or (= lt!390475 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!390475 #b0000000000000000000000000000000000000000000000000000000000001000) lt!390475)))))

(assert (=> b!251289 (= lt!390475 ((_ sign_extend 32) (size!5997 (buf!6496 (_1!11703 lt!390101)))))))

(assert (= (and d!84186 res!210429) b!251288))

(assert (= (and b!251288 res!210430) b!251289))

(declare-fun m!378081 () Bool)

(assert (=> d!84186 m!378081))

(declare-fun m!378083 () Bool)

(assert (=> d!84186 m!378083))

(assert (=> b!251115 d!84186))

(declare-fun d!84188 () Bool)

(declare-fun lt!390478 () tuple2!21554)

(assert (=> d!84188 (= lt!390478 (readBit!0 (BitStream!10917 (buf!6496 (_2!11701 lt!390113)) (currentByte!11945 thiss!1005) (currentBit!11940 thiss!1005))))))

(assert (=> d!84188 (= (readBitPure!0 (BitStream!10917 (buf!6496 (_2!11701 lt!390113)) (currentByte!11945 thiss!1005) (currentBit!11940 thiss!1005))) (tuple2!21551 (_2!11705 lt!390478) (_1!11705 lt!390478)))))

(declare-fun bs!21317 () Bool)

(assert (= bs!21317 d!84188))

(declare-fun m!378085 () Bool)

(assert (=> bs!21317 m!378085))

(assert (=> b!251115 d!84188))

(assert (=> b!251115 d!84138))

(declare-fun d!84190 () Bool)

(declare-fun e!174125 () Bool)

(assert (=> d!84190 e!174125))

(declare-fun res!210431 () Bool)

(assert (=> d!84190 (=> (not res!210431) (not e!174125))))

(declare-fun lt!390480 () (_ BitVec 64))

(declare-fun lt!390483 () (_ BitVec 64))

(declare-fun lt!390479 () (_ BitVec 64))

(assert (=> d!84190 (= res!210431 (= lt!390479 (bvsub lt!390483 lt!390480)))))

(assert (=> d!84190 (or (= (bvand lt!390483 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!390480 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!390483 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!390483 lt!390480) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84190 (= lt!390480 (remainingBits!0 ((_ sign_extend 32) (size!5997 (buf!6496 (_1!11703 lt!390105)))) ((_ sign_extend 32) (currentByte!11945 (_1!11703 lt!390105))) ((_ sign_extend 32) (currentBit!11940 (_1!11703 lt!390105)))))))

(declare-fun lt!390484 () (_ BitVec 64))

(declare-fun lt!390481 () (_ BitVec 64))

(assert (=> d!84190 (= lt!390483 (bvmul lt!390484 lt!390481))))

(assert (=> d!84190 (or (= lt!390484 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!390481 (bvsdiv (bvmul lt!390484 lt!390481) lt!390484)))))

(assert (=> d!84190 (= lt!390481 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84190 (= lt!390484 ((_ sign_extend 32) (size!5997 (buf!6496 (_1!11703 lt!390105)))))))

(assert (=> d!84190 (= lt!390479 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11945 (_1!11703 lt!390105))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11940 (_1!11703 lt!390105)))))))

(assert (=> d!84190 (invariant!0 (currentBit!11940 (_1!11703 lt!390105)) (currentByte!11945 (_1!11703 lt!390105)) (size!5997 (buf!6496 (_1!11703 lt!390105))))))

(assert (=> d!84190 (= (bitIndex!0 (size!5997 (buf!6496 (_1!11703 lt!390105))) (currentByte!11945 (_1!11703 lt!390105)) (currentBit!11940 (_1!11703 lt!390105))) lt!390479)))

(declare-fun b!251290 () Bool)

(declare-fun res!210432 () Bool)

(assert (=> b!251290 (=> (not res!210432) (not e!174125))))

(assert (=> b!251290 (= res!210432 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!390479))))

(declare-fun b!251291 () Bool)

(declare-fun lt!390482 () (_ BitVec 64))

(assert (=> b!251291 (= e!174125 (bvsle lt!390479 (bvmul lt!390482 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!251291 (or (= lt!390482 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!390482 #b0000000000000000000000000000000000000000000000000000000000001000) lt!390482)))))

(assert (=> b!251291 (= lt!390482 ((_ sign_extend 32) (size!5997 (buf!6496 (_1!11703 lt!390105)))))))

(assert (= (and d!84190 res!210431) b!251290))

(assert (= (and b!251290 res!210432) b!251291))

(declare-fun m!378087 () Bool)

(assert (=> d!84190 m!378087))

(declare-fun m!378089 () Bool)

(assert (=> d!84190 m!378089))

(assert (=> b!251115 d!84190))

(declare-fun d!84192 () Bool)

(declare-fun lt!390485 () tuple2!21554)

(assert (=> d!84192 (= lt!390485 (readBit!0 (_1!11702 lt!390110)))))

(assert (=> d!84192 (= (readBitPure!0 (_1!11702 lt!390110)) (tuple2!21551 (_2!11705 lt!390485) (_1!11705 lt!390485)))))

(declare-fun bs!21318 () Bool)

(assert (= bs!21318 d!84192))

(declare-fun m!378091 () Bool)

(assert (=> bs!21318 m!378091))

(assert (=> b!251115 d!84192))

(declare-fun d!84194 () Bool)

(declare-fun e!174141 () Bool)

(assert (=> d!84194 e!174141))

(declare-fun res!210457 () Bool)

(assert (=> d!84194 (=> (not res!210457) (not e!174141))))

(declare-fun lt!390579 () tuple2!21546)

(assert (=> d!84194 (= res!210457 (= (size!5997 (buf!6496 thiss!1005)) (size!5997 (buf!6496 (_2!11701 lt!390579)))))))

(declare-fun choose!16 (BitStream!10916 Bool) tuple2!21546)

(assert (=> d!84194 (= lt!390579 (choose!16 thiss!1005 bit!26))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!84194 (validate_offset_bit!0 ((_ sign_extend 32) (size!5997 (buf!6496 thiss!1005))) ((_ sign_extend 32) (currentByte!11945 thiss!1005)) ((_ sign_extend 32) (currentBit!11940 thiss!1005)))))

(assert (=> d!84194 (= (appendBit!0 thiss!1005 bit!26) lt!390579)))

(declare-fun b!251327 () Bool)

(declare-fun e!174142 () Bool)

(declare-fun lt!390580 () tuple2!21550)

(assert (=> b!251327 (= e!174142 (= (bitIndex!0 (size!5997 (buf!6496 (_1!11703 lt!390580))) (currentByte!11945 (_1!11703 lt!390580)) (currentBit!11940 (_1!11703 lt!390580))) (bitIndex!0 (size!5997 (buf!6496 (_2!11701 lt!390579))) (currentByte!11945 (_2!11701 lt!390579)) (currentBit!11940 (_2!11701 lt!390579)))))))

(declare-fun b!251324 () Bool)

(declare-fun res!210456 () Bool)

(assert (=> b!251324 (=> (not res!210456) (not e!174141))))

(declare-fun lt!390578 () (_ BitVec 64))

(declare-fun lt!390577 () (_ BitVec 64))

(assert (=> b!251324 (= res!210456 (= (bitIndex!0 (size!5997 (buf!6496 (_2!11701 lt!390579))) (currentByte!11945 (_2!11701 lt!390579)) (currentBit!11940 (_2!11701 lt!390579))) (bvadd lt!390578 lt!390577)))))

(assert (=> b!251324 (or (not (= (bvand lt!390578 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!390577 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!390578 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!390578 lt!390577) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!251324 (= lt!390577 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!251324 (= lt!390578 (bitIndex!0 (size!5997 (buf!6496 thiss!1005)) (currentByte!11945 thiss!1005) (currentBit!11940 thiss!1005)))))

(declare-fun b!251325 () Bool)

(declare-fun res!210458 () Bool)

(assert (=> b!251325 (=> (not res!210458) (not e!174141))))

(assert (=> b!251325 (= res!210458 (isPrefixOf!0 thiss!1005 (_2!11701 lt!390579)))))

(declare-fun b!251326 () Bool)

(assert (=> b!251326 (= e!174141 e!174142)))

(declare-fun res!210459 () Bool)

(assert (=> b!251326 (=> (not res!210459) (not e!174142))))

(assert (=> b!251326 (= res!210459 (and (= (_2!11703 lt!390580) bit!26) (= (_1!11703 lt!390580) (_2!11701 lt!390579))))))

(assert (=> b!251326 (= lt!390580 (readBitPure!0 (readerFrom!0 (_2!11701 lt!390579) (currentBit!11940 thiss!1005) (currentByte!11945 thiss!1005))))))

(assert (= (and d!84194 res!210457) b!251324))

(assert (= (and b!251324 res!210456) b!251325))

(assert (= (and b!251325 res!210458) b!251326))

(assert (= (and b!251326 res!210459) b!251327))

(declare-fun m!378151 () Bool)

(assert (=> b!251326 m!378151))

(assert (=> b!251326 m!378151))

(declare-fun m!378153 () Bool)

(assert (=> b!251326 m!378153))

(declare-fun m!378155 () Bool)

(assert (=> b!251324 m!378155))

(assert (=> b!251324 m!377785))

(declare-fun m!378157 () Bool)

(assert (=> b!251325 m!378157))

(declare-fun m!378159 () Bool)

(assert (=> b!251327 m!378159))

(assert (=> b!251327 m!378155))

(declare-fun m!378161 () Bool)

(assert (=> d!84194 m!378161))

(declare-fun m!378163 () Bool)

(assert (=> d!84194 m!378163))

(assert (=> b!251115 d!84194))

(declare-fun d!84202 () Bool)

(assert (=> d!84202 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5997 (buf!6496 (_2!11701 lt!390107)))) ((_ sign_extend 32) (currentByte!11945 (_2!11701 lt!390107))) ((_ sign_extend 32) (currentBit!11940 (_2!11701 lt!390107))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5997 (buf!6496 (_2!11701 lt!390107)))) ((_ sign_extend 32) (currentByte!11945 (_2!11701 lt!390107))) ((_ sign_extend 32) (currentBit!11940 (_2!11701 lt!390107)))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!21319 () Bool)

(assert (= bs!21319 d!84202))

(assert (=> bs!21319 m!377979))

(assert (=> b!251115 d!84202))

(declare-fun d!84204 () Bool)

(declare-fun e!174150 () Bool)

(assert (=> d!84204 e!174150))

(declare-fun res!210473 () Bool)

(assert (=> d!84204 (=> (not res!210473) (not e!174150))))

(declare-fun lt!390614 () tuple2!21546)

(assert (=> d!84204 (= res!210473 (= (size!5997 (buf!6496 (_2!11701 lt!390107))) (size!5997 (buf!6496 (_2!11701 lt!390614)))))))

(declare-fun choose!51 (BitStream!10916 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21546)

(assert (=> d!84204 (= lt!390614 (choose!51 (_2!11701 lt!390107) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!84204 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!84204 (= (appendNBitsLoop!0 (_2!11701 lt!390107) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) lt!390614)))

(declare-fun b!251342 () Bool)

(declare-fun e!174151 () Bool)

(declare-fun lt!390617 () (_ BitVec 64))

(assert (=> b!251342 (= e!174151 (validate_offset_bits!1 ((_ sign_extend 32) (size!5997 (buf!6496 (_2!11701 lt!390107)))) ((_ sign_extend 32) (currentByte!11945 (_2!11701 lt!390107))) ((_ sign_extend 32) (currentBit!11940 (_2!11701 lt!390107))) lt!390617))))

(declare-fun b!251341 () Bool)

(declare-fun lt!390613 () tuple2!21550)

(declare-fun lt!390612 () tuple2!21548)

(assert (=> b!251341 (= e!174150 (and (_2!11703 lt!390613) (= (_1!11703 lt!390613) (_2!11702 lt!390612))))))

(assert (=> b!251341 (= lt!390613 (checkBitsLoopPure!0 (_1!11702 lt!390612) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!390610 () Unit!18136)

(declare-fun lt!390611 () Unit!18136)

(assert (=> b!251341 (= lt!390610 lt!390611)))

(assert (=> b!251341 (validate_offset_bits!1 ((_ sign_extend 32) (size!5997 (buf!6496 (_2!11701 lt!390614)))) ((_ sign_extend 32) (currentByte!11945 (_2!11701 lt!390107))) ((_ sign_extend 32) (currentBit!11940 (_2!11701 lt!390107))) lt!390617)))

(assert (=> b!251341 (= lt!390611 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11701 lt!390107) (buf!6496 (_2!11701 lt!390614)) lt!390617))))

(assert (=> b!251341 e!174151))

(declare-fun res!210474 () Bool)

(assert (=> b!251341 (=> (not res!210474) (not e!174151))))

(assert (=> b!251341 (= res!210474 (and (= (size!5997 (buf!6496 (_2!11701 lt!390107))) (size!5997 (buf!6496 (_2!11701 lt!390614)))) (bvsge lt!390617 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!251341 (= lt!390617 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!251341 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!251341 (= lt!390612 (reader!0 (_2!11701 lt!390107) (_2!11701 lt!390614)))))

(declare-fun b!251339 () Bool)

(declare-fun res!210472 () Bool)

(assert (=> b!251339 (=> (not res!210472) (not e!174150))))

(declare-fun lt!390616 () (_ BitVec 64))

(declare-fun lt!390615 () (_ BitVec 64))

(assert (=> b!251339 (= res!210472 (= (bitIndex!0 (size!5997 (buf!6496 (_2!11701 lt!390614))) (currentByte!11945 (_2!11701 lt!390614)) (currentBit!11940 (_2!11701 lt!390614))) (bvadd lt!390615 lt!390616)))))

(assert (=> b!251339 (or (not (= (bvand lt!390615 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!390616 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!390615 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!390615 lt!390616) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!251339 (= lt!390616 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!251339 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!251339 (= lt!390615 (bitIndex!0 (size!5997 (buf!6496 (_2!11701 lt!390107))) (currentByte!11945 (_2!11701 lt!390107)) (currentBit!11940 (_2!11701 lt!390107))))))

(declare-fun b!251340 () Bool)

(declare-fun res!210471 () Bool)

(assert (=> b!251340 (=> (not res!210471) (not e!174150))))

(assert (=> b!251340 (= res!210471 (isPrefixOf!0 (_2!11701 lt!390107) (_2!11701 lt!390614)))))

(assert (= (and d!84204 res!210473) b!251339))

(assert (= (and b!251339 res!210472) b!251340))

(assert (= (and b!251340 res!210471) b!251341))

(assert (= (and b!251341 res!210474) b!251342))

(declare-fun m!378177 () Bool)

(assert (=> b!251339 m!378177))

(assert (=> b!251339 m!377783))

(declare-fun m!378179 () Bool)

(assert (=> b!251340 m!378179))

(declare-fun m!378181 () Bool)

(assert (=> d!84204 m!378181))

(declare-fun m!378183 () Bool)

(assert (=> b!251341 m!378183))

(declare-fun m!378185 () Bool)

(assert (=> b!251341 m!378185))

(declare-fun m!378187 () Bool)

(assert (=> b!251341 m!378187))

(declare-fun m!378189 () Bool)

(assert (=> b!251341 m!378189))

(declare-fun m!378191 () Bool)

(assert (=> b!251342 m!378191))

(assert (=> b!251115 d!84204))

(declare-fun b!251343 () Bool)

(declare-fun e!174152 () Unit!18136)

(declare-fun Unit!18143 () Unit!18136)

(assert (=> b!251343 (= e!174152 Unit!18143)))

(declare-fun b!251344 () Bool)

(declare-fun res!210477 () Bool)

(declare-fun e!174153 () Bool)

(assert (=> b!251344 (=> (not res!210477) (not e!174153))))

(declare-fun lt!390627 () tuple2!21548)

(assert (=> b!251344 (= res!210477 (isPrefixOf!0 (_2!11702 lt!390627) (_2!11701 lt!390113)))))

(declare-fun b!251345 () Bool)

(declare-fun lt!390629 () Unit!18136)

(assert (=> b!251345 (= e!174152 lt!390629)))

(declare-fun lt!390633 () (_ BitVec 64))

(assert (=> b!251345 (= lt!390633 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!390630 () (_ BitVec 64))

(assert (=> b!251345 (= lt!390630 (bitIndex!0 (size!5997 (buf!6496 thiss!1005)) (currentByte!11945 thiss!1005) (currentBit!11940 thiss!1005)))))

(assert (=> b!251345 (= lt!390629 (arrayBitRangesEqSymmetric!0 (buf!6496 thiss!1005) (buf!6496 (_2!11701 lt!390113)) lt!390633 lt!390630))))

(assert (=> b!251345 (arrayBitRangesEq!0 (buf!6496 (_2!11701 lt!390113)) (buf!6496 thiss!1005) lt!390633 lt!390630)))

(declare-fun lt!390625 () (_ BitVec 64))

(declare-fun lt!390637 () (_ BitVec 64))

(declare-fun b!251346 () Bool)

(assert (=> b!251346 (= e!174153 (= (_1!11702 lt!390627) (withMovedBitIndex!0 (_2!11702 lt!390627) (bvsub lt!390637 lt!390625))))))

(assert (=> b!251346 (or (= (bvand lt!390637 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!390625 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!390637 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!390637 lt!390625) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!251346 (= lt!390625 (bitIndex!0 (size!5997 (buf!6496 (_2!11701 lt!390113))) (currentByte!11945 (_2!11701 lt!390113)) (currentBit!11940 (_2!11701 lt!390113))))))

(assert (=> b!251346 (= lt!390637 (bitIndex!0 (size!5997 (buf!6496 thiss!1005)) (currentByte!11945 thiss!1005) (currentBit!11940 thiss!1005)))))

(declare-fun d!84212 () Bool)

(assert (=> d!84212 e!174153))

(declare-fun res!210476 () Bool)

(assert (=> d!84212 (=> (not res!210476) (not e!174153))))

(assert (=> d!84212 (= res!210476 (isPrefixOf!0 (_1!11702 lt!390627) (_2!11702 lt!390627)))))

(declare-fun lt!390620 () BitStream!10916)

(assert (=> d!84212 (= lt!390627 (tuple2!21549 lt!390620 (_2!11701 lt!390113)))))

(declare-fun lt!390635 () Unit!18136)

(declare-fun lt!390623 () Unit!18136)

(assert (=> d!84212 (= lt!390635 lt!390623)))

(assert (=> d!84212 (isPrefixOf!0 lt!390620 (_2!11701 lt!390113))))

(assert (=> d!84212 (= lt!390623 (lemmaIsPrefixTransitive!0 lt!390620 (_2!11701 lt!390113) (_2!11701 lt!390113)))))

(declare-fun lt!390634 () Unit!18136)

(declare-fun lt!390636 () Unit!18136)

(assert (=> d!84212 (= lt!390634 lt!390636)))

(assert (=> d!84212 (isPrefixOf!0 lt!390620 (_2!11701 lt!390113))))

(assert (=> d!84212 (= lt!390636 (lemmaIsPrefixTransitive!0 lt!390620 thiss!1005 (_2!11701 lt!390113)))))

(declare-fun lt!390624 () Unit!18136)

(assert (=> d!84212 (= lt!390624 e!174152)))

(declare-fun c!11626 () Bool)

(assert (=> d!84212 (= c!11626 (not (= (size!5997 (buf!6496 thiss!1005)) #b00000000000000000000000000000000)))))

(declare-fun lt!390631 () Unit!18136)

(declare-fun lt!390622 () Unit!18136)

(assert (=> d!84212 (= lt!390631 lt!390622)))

(assert (=> d!84212 (isPrefixOf!0 (_2!11701 lt!390113) (_2!11701 lt!390113))))

(assert (=> d!84212 (= lt!390622 (lemmaIsPrefixRefl!0 (_2!11701 lt!390113)))))

(declare-fun lt!390621 () Unit!18136)

(declare-fun lt!390632 () Unit!18136)

(assert (=> d!84212 (= lt!390621 lt!390632)))

(assert (=> d!84212 (= lt!390632 (lemmaIsPrefixRefl!0 (_2!11701 lt!390113)))))

(declare-fun lt!390618 () Unit!18136)

(declare-fun lt!390619 () Unit!18136)

(assert (=> d!84212 (= lt!390618 lt!390619)))

(assert (=> d!84212 (isPrefixOf!0 lt!390620 lt!390620)))

(assert (=> d!84212 (= lt!390619 (lemmaIsPrefixRefl!0 lt!390620))))

(declare-fun lt!390626 () Unit!18136)

(declare-fun lt!390628 () Unit!18136)

(assert (=> d!84212 (= lt!390626 lt!390628)))

(assert (=> d!84212 (isPrefixOf!0 thiss!1005 thiss!1005)))

(assert (=> d!84212 (= lt!390628 (lemmaIsPrefixRefl!0 thiss!1005))))

(assert (=> d!84212 (= lt!390620 (BitStream!10917 (buf!6496 (_2!11701 lt!390113)) (currentByte!11945 thiss!1005) (currentBit!11940 thiss!1005)))))

(assert (=> d!84212 (isPrefixOf!0 thiss!1005 (_2!11701 lt!390113))))

(assert (=> d!84212 (= (reader!0 thiss!1005 (_2!11701 lt!390113)) lt!390627)))

(declare-fun b!251347 () Bool)

(declare-fun res!210475 () Bool)

(assert (=> b!251347 (=> (not res!210475) (not e!174153))))

(assert (=> b!251347 (= res!210475 (isPrefixOf!0 (_1!11702 lt!390627) thiss!1005))))

(assert (= (and d!84212 c!11626) b!251345))

(assert (= (and d!84212 (not c!11626)) b!251343))

(assert (= (and d!84212 res!210476) b!251347))

(assert (= (and b!251347 res!210475) b!251344))

(assert (= (and b!251344 res!210477) b!251346))

(declare-fun m!378193 () Bool)

(assert (=> b!251344 m!378193))

(declare-fun m!378195 () Bool)

(assert (=> b!251346 m!378195))

(assert (=> b!251346 m!377829))

(assert (=> b!251346 m!377785))

(declare-fun m!378197 () Bool)

(assert (=> d!84212 m!378197))

(declare-fun m!378199 () Bool)

(assert (=> d!84212 m!378199))

(assert (=> d!84212 m!378029))

(assert (=> d!84212 m!378031))

(declare-fun m!378201 () Bool)

(assert (=> d!84212 m!378201))

(declare-fun m!378203 () Bool)

(assert (=> d!84212 m!378203))

(declare-fun m!378205 () Bool)

(assert (=> d!84212 m!378205))

(declare-fun m!378207 () Bool)

(assert (=> d!84212 m!378207))

(declare-fun m!378209 () Bool)

(assert (=> d!84212 m!378209))

(assert (=> d!84212 m!377805))

(declare-fun m!378211 () Bool)

(assert (=> d!84212 m!378211))

(declare-fun m!378213 () Bool)

(assert (=> b!251347 m!378213))

(assert (=> b!251345 m!377785))

(declare-fun m!378215 () Bool)

(assert (=> b!251345 m!378215))

(declare-fun m!378217 () Bool)

(assert (=> b!251345 m!378217))

(assert (=> b!251115 d!84212))

(push 1)

(assert (not b!251324))

(assert (not d!84202))

(assert (not d!84138))

(assert (not d!84204))

(assert (not d!84164))

(assert (not b!251268))

(assert (not b!251222))

(assert (not d!84188))

(assert (not d!84194))

(assert (not b!251341))

(assert (not b!251271))

(assert (not d!84186))

(assert (not d!84174))

(assert (not d!84120))

(assert (not d!84132))

(assert (not b!251327))

(assert (not b!251276))

(assert (not b!251279))

(assert (not b!251269))

(assert (not b!251270))

(assert (not b!251344))

(assert (not d!84116))

(assert (not b!251287))

(assert (not d!84192))

(assert (not b!251347))

(assert (not d!84118))

(assert (not b!251340))

(assert (not d!84180))

(assert (not b!251229))

(assert (not d!84166))

(assert (not d!84212))

(assert (not d!84184))

(assert (not d!84190))

(assert (not b!251345))

(assert (not b!251326))

(assert (not d!84182))

(assert (not b!251325))

(assert (not d!84134))

(assert (not b!251231))

(assert (not d!84112))

(assert (not d!84128))

(assert (not d!84176))

(assert (not b!251342))

(assert (not d!84114))

(assert (not b!251346))

(assert (not b!251339))

(assert (not b!251274))

(assert (not b!251281))

(check-sat)

(pop 1)

(push 1)

(check-sat)

