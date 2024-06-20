; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14906 () Bool)

(assert start!14906)

(declare-fun b!76573 () Bool)

(declare-fun e!50266 () Bool)

(declare-datatypes ((array!3182 0))(
  ( (array!3183 (arr!2082 (Array (_ BitVec 32) (_ BitVec 8))) (size!1481 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2536 0))(
  ( (BitStream!2537 (buf!1865 array!3182) (currentByte!3664 (_ BitVec 32)) (currentBit!3659 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!5047 0))(
  ( (Unit!5048) )
))
(declare-datatypes ((tuple2!6656 0))(
  ( (tuple2!6657 (_1!3462 Unit!5047) (_2!3462 BitStream!2536)) )
))
(declare-fun lt!122600 () tuple2!6656)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!76573 (= e!50266 (not (invariant!0 (currentBit!3659 (_2!3462 lt!122600)) (currentByte!3664 (_2!3462 lt!122600)) (size!1481 (buf!1865 (_2!3462 lt!122600))))))))

(declare-fun e!50265 () Bool)

(assert (=> b!76573 e!50265))

(declare-fun res!63258 () Bool)

(assert (=> b!76573 (=> (not res!63258) (not e!50265))))

(declare-fun thiss!1090 () BitStream!2536)

(assert (=> b!76573 (= res!63258 (= (size!1481 (buf!1865 thiss!1090)) (size!1481 (buf!1865 (_2!3462 lt!122600)))))))

(declare-fun nBits!322 () (_ BitVec 64))

(declare-fun appendNBits!0 (BitStream!2536 (_ BitVec 64) Bool) tuple2!6656)

(assert (=> b!76573 (= lt!122600 (appendNBits!0 thiss!1090 nBits!322 false))))

(declare-fun b!76574 () Bool)

(declare-fun res!63262 () Bool)

(assert (=> b!76574 (=> (not res!63262) (not e!50265))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!76574 (= res!63262 (= (bitIndex!0 (size!1481 (buf!1865 (_2!3462 lt!122600))) (currentByte!3664 (_2!3462 lt!122600)) (currentBit!3659 (_2!3462 lt!122600))) (bvadd (bitIndex!0 (size!1481 (buf!1865 thiss!1090)) (currentByte!3664 thiss!1090) (currentBit!3659 thiss!1090)) nBits!322)))))

(declare-fun res!63260 () Bool)

(assert (=> start!14906 (=> (not res!63260) (not e!50266))))

(assert (=> start!14906 (= res!63260 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!14906 e!50266))

(assert (=> start!14906 true))

(declare-fun e!50267 () Bool)

(declare-fun inv!12 (BitStream!2536) Bool)

(assert (=> start!14906 (and (inv!12 thiss!1090) e!50267)))

(declare-fun b!76575 () Bool)

(declare-fun res!63261 () Bool)

(assert (=> b!76575 (=> (not res!63261) (not e!50266))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!76575 (= res!63261 (validate_offset_bits!1 ((_ sign_extend 32) (size!1481 (buf!1865 thiss!1090))) ((_ sign_extend 32) (currentByte!3664 thiss!1090)) ((_ sign_extend 32) (currentBit!3659 thiss!1090)) nBits!322))))

(declare-fun b!76576 () Bool)

(declare-fun array_inv!1327 (array!3182) Bool)

(assert (=> b!76576 (= e!50267 (array_inv!1327 (buf!1865 thiss!1090)))))

(declare-fun b!76577 () Bool)

(declare-datatypes ((tuple2!6658 0))(
  ( (tuple2!6659 (_1!3463 BitStream!2536) (_2!3463 Bool)) )
))
(declare-fun lt!122599 () tuple2!6658)

(declare-datatypes ((tuple2!6660 0))(
  ( (tuple2!6661 (_1!3464 BitStream!2536) (_2!3464 BitStream!2536)) )
))
(declare-fun lt!122598 () tuple2!6660)

(assert (=> b!76577 (= e!50265 (not (or (not (_2!3463 lt!122599)) (not (= (_1!3463 lt!122599) (_2!3464 lt!122598))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!2536 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!6658)

(assert (=> b!76577 (= lt!122599 (checkBitsLoopPure!0 (_1!3464 lt!122598) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!76577 (validate_offset_bits!1 ((_ sign_extend 32) (size!1481 (buf!1865 (_2!3462 lt!122600)))) ((_ sign_extend 32) (currentByte!3664 thiss!1090)) ((_ sign_extend 32) (currentBit!3659 thiss!1090)) nBits!322)))

(declare-fun lt!122601 () Unit!5047)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2536 array!3182 (_ BitVec 64)) Unit!5047)

(assert (=> b!76577 (= lt!122601 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1865 (_2!3462 lt!122600)) nBits!322))))

(declare-fun reader!0 (BitStream!2536 BitStream!2536) tuple2!6660)

(assert (=> b!76577 (= lt!122598 (reader!0 thiss!1090 (_2!3462 lt!122600)))))

(declare-fun b!76578 () Bool)

(declare-fun res!63259 () Bool)

(assert (=> b!76578 (=> (not res!63259) (not e!50265))))

(declare-fun isPrefixOf!0 (BitStream!2536 BitStream!2536) Bool)

(assert (=> b!76578 (= res!63259 (isPrefixOf!0 thiss!1090 (_2!3462 lt!122600)))))

(assert (= (and start!14906 res!63260) b!76575))

(assert (= (and b!76575 res!63261) b!76573))

(assert (= (and b!76573 res!63258) b!76574))

(assert (= (and b!76574 res!63262) b!76578))

(assert (= (and b!76578 res!63259) b!76577))

(assert (= start!14906 b!76576))

(declare-fun m!121811 () Bool)

(assert (=> b!76575 m!121811))

(declare-fun m!121813 () Bool)

(assert (=> b!76577 m!121813))

(declare-fun m!121815 () Bool)

(assert (=> b!76577 m!121815))

(declare-fun m!121817 () Bool)

(assert (=> b!76577 m!121817))

(declare-fun m!121819 () Bool)

(assert (=> b!76577 m!121819))

(declare-fun m!121821 () Bool)

(assert (=> b!76576 m!121821))

(declare-fun m!121823 () Bool)

(assert (=> b!76578 m!121823))

(declare-fun m!121825 () Bool)

(assert (=> b!76574 m!121825))

(declare-fun m!121827 () Bool)

(assert (=> b!76574 m!121827))

(declare-fun m!121829 () Bool)

(assert (=> start!14906 m!121829))

(declare-fun m!121831 () Bool)

(assert (=> b!76573 m!121831))

(declare-fun m!121833 () Bool)

(assert (=> b!76573 m!121833))

(push 1)

(assert (not b!76578))

(assert (not b!76577))

(assert (not b!76575))

(assert (not b!76574))

(assert (not start!14906))

(assert (not b!76573))

(assert (not b!76576))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!24222 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!24222 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1481 (buf!1865 thiss!1090))) ((_ sign_extend 32) (currentByte!3664 thiss!1090)) ((_ sign_extend 32) (currentBit!3659 thiss!1090)) nBits!322) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1481 (buf!1865 thiss!1090))) ((_ sign_extend 32) (currentByte!3664 thiss!1090)) ((_ sign_extend 32) (currentBit!3659 thiss!1090))) nBits!322))))

(declare-fun bs!5848 () Bool)

(assert (= bs!5848 d!24222))

(declare-fun m!121883 () Bool)

(assert (=> bs!5848 m!121883))

(assert (=> b!76575 d!24222))

(declare-fun d!24226 () Bool)

(assert (=> d!24226 (= (inv!12 thiss!1090) (invariant!0 (currentBit!3659 thiss!1090) (currentByte!3664 thiss!1090) (size!1481 (buf!1865 thiss!1090))))))

(declare-fun bs!5850 () Bool)

(assert (= bs!5850 d!24226))

(declare-fun m!121889 () Bool)

(assert (=> bs!5850 m!121889))

(assert (=> start!14906 d!24226))

(declare-fun d!24231 () Bool)

(declare-fun e!50295 () Bool)

(assert (=> d!24231 e!50295))

(declare-fun res!63297 () Bool)

(assert (=> d!24231 (=> (not res!63297) (not e!50295))))

(declare-fun lt!122647 () (_ BitVec 64))

(declare-fun lt!122649 () (_ BitVec 64))

(declare-fun lt!122644 () (_ BitVec 64))

(assert (=> d!24231 (= res!63297 (= lt!122644 (bvsub lt!122649 lt!122647)))))

(assert (=> d!24231 (or (= (bvand lt!122649 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!122647 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!122649 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!122649 lt!122647) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24231 (= lt!122647 (remainingBits!0 ((_ sign_extend 32) (size!1481 (buf!1865 (_2!3462 lt!122600)))) ((_ sign_extend 32) (currentByte!3664 (_2!3462 lt!122600))) ((_ sign_extend 32) (currentBit!3659 (_2!3462 lt!122600)))))))

(declare-fun lt!122645 () (_ BitVec 64))

(declare-fun lt!122648 () (_ BitVec 64))

(assert (=> d!24231 (= lt!122649 (bvmul lt!122645 lt!122648))))

(assert (=> d!24231 (or (= lt!122645 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!122648 (bvsdiv (bvmul lt!122645 lt!122648) lt!122645)))))

(assert (=> d!24231 (= lt!122648 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24231 (= lt!122645 ((_ sign_extend 32) (size!1481 (buf!1865 (_2!3462 lt!122600)))))))

(assert (=> d!24231 (= lt!122644 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3664 (_2!3462 lt!122600))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3659 (_2!3462 lt!122600)))))))

(assert (=> d!24231 (invariant!0 (currentBit!3659 (_2!3462 lt!122600)) (currentByte!3664 (_2!3462 lt!122600)) (size!1481 (buf!1865 (_2!3462 lt!122600))))))

(assert (=> d!24231 (= (bitIndex!0 (size!1481 (buf!1865 (_2!3462 lt!122600))) (currentByte!3664 (_2!3462 lt!122600)) (currentBit!3659 (_2!3462 lt!122600))) lt!122644)))

(declare-fun b!76619 () Bool)

(declare-fun res!63298 () Bool)

(assert (=> b!76619 (=> (not res!63298) (not e!50295))))

(assert (=> b!76619 (= res!63298 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!122644))))

(declare-fun b!76620 () Bool)

(declare-fun lt!122646 () (_ BitVec 64))

(assert (=> b!76620 (= e!50295 (bvsle lt!122644 (bvmul lt!122646 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!76620 (or (= lt!122646 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!122646 #b0000000000000000000000000000000000000000000000000000000000001000) lt!122646)))))

(assert (=> b!76620 (= lt!122646 ((_ sign_extend 32) (size!1481 (buf!1865 (_2!3462 lt!122600)))))))

(assert (= (and d!24231 res!63297) b!76619))

(assert (= (and b!76619 res!63298) b!76620))

(declare-fun m!121895 () Bool)

(assert (=> d!24231 m!121895))

(assert (=> d!24231 m!121831))

(assert (=> b!76574 d!24231))

(declare-fun d!24240 () Bool)

(declare-fun e!50296 () Bool)

(assert (=> d!24240 e!50296))

(declare-fun res!63299 () Bool)

(assert (=> d!24240 (=> (not res!63299) (not e!50296))))

(declare-fun lt!122655 () (_ BitVec 64))

(declare-fun lt!122653 () (_ BitVec 64))

(declare-fun lt!122650 () (_ BitVec 64))

(assert (=> d!24240 (= res!63299 (= lt!122650 (bvsub lt!122655 lt!122653)))))

(assert (=> d!24240 (or (= (bvand lt!122655 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!122653 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!122655 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!122655 lt!122653) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24240 (= lt!122653 (remainingBits!0 ((_ sign_extend 32) (size!1481 (buf!1865 thiss!1090))) ((_ sign_extend 32) (currentByte!3664 thiss!1090)) ((_ sign_extend 32) (currentBit!3659 thiss!1090))))))

(declare-fun lt!122651 () (_ BitVec 64))

(declare-fun lt!122654 () (_ BitVec 64))

(assert (=> d!24240 (= lt!122655 (bvmul lt!122651 lt!122654))))

(assert (=> d!24240 (or (= lt!122651 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!122654 (bvsdiv (bvmul lt!122651 lt!122654) lt!122651)))))

(assert (=> d!24240 (= lt!122654 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24240 (= lt!122651 ((_ sign_extend 32) (size!1481 (buf!1865 thiss!1090))))))

(assert (=> d!24240 (= lt!122650 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3664 thiss!1090)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3659 thiss!1090))))))

(assert (=> d!24240 (invariant!0 (currentBit!3659 thiss!1090) (currentByte!3664 thiss!1090) (size!1481 (buf!1865 thiss!1090)))))

(assert (=> d!24240 (= (bitIndex!0 (size!1481 (buf!1865 thiss!1090)) (currentByte!3664 thiss!1090) (currentBit!3659 thiss!1090)) lt!122650)))

(declare-fun b!76621 () Bool)

(declare-fun res!63300 () Bool)

(assert (=> b!76621 (=> (not res!63300) (not e!50296))))

(assert (=> b!76621 (= res!63300 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!122650))))

(declare-fun b!76622 () Bool)

(declare-fun lt!122652 () (_ BitVec 64))

(assert (=> b!76622 (= e!50296 (bvsle lt!122650 (bvmul lt!122652 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!76622 (or (= lt!122652 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!122652 #b0000000000000000000000000000000000000000000000000000000000001000) lt!122652)))))

(assert (=> b!76622 (= lt!122652 ((_ sign_extend 32) (size!1481 (buf!1865 thiss!1090))))))

(assert (= (and d!24240 res!63299) b!76621))

(assert (= (and b!76621 res!63300) b!76622))

(assert (=> d!24240 m!121883))

(assert (=> d!24240 m!121889))

(assert (=> b!76574 d!24240))

(declare-fun d!24242 () Bool)

(assert (=> d!24242 (= (invariant!0 (currentBit!3659 (_2!3462 lt!122600)) (currentByte!3664 (_2!3462 lt!122600)) (size!1481 (buf!1865 (_2!3462 lt!122600)))) (and (bvsge (currentBit!3659 (_2!3462 lt!122600)) #b00000000000000000000000000000000) (bvslt (currentBit!3659 (_2!3462 lt!122600)) #b00000000000000000000000000001000) (bvsge (currentByte!3664 (_2!3462 lt!122600)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3664 (_2!3462 lt!122600)) (size!1481 (buf!1865 (_2!3462 lt!122600)))) (and (= (currentBit!3659 (_2!3462 lt!122600)) #b00000000000000000000000000000000) (= (currentByte!3664 (_2!3462 lt!122600)) (size!1481 (buf!1865 (_2!3462 lt!122600))))))))))

(assert (=> b!76573 d!24242))

(declare-fun b!76687 () Bool)

(declare-fun res!63353 () Bool)

(declare-fun e!50327 () Bool)

(assert (=> b!76687 (=> (not res!63353) (not e!50327))))

(declare-fun lt!122841 () tuple2!6656)

(declare-fun lt!122837 () (_ BitVec 64))

(assert (=> b!76687 (= res!63353 (= (bitIndex!0 (size!1481 (buf!1865 (_2!3462 lt!122841))) (currentByte!3664 (_2!3462 lt!122841)) (currentBit!3659 (_2!3462 lt!122841))) (bvadd lt!122837 nBits!322)))))

(assert (=> b!76687 (or (not (= (bvand lt!122837 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!322 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!122837 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!122837 nBits!322) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!76687 (= lt!122837 (bitIndex!0 (size!1481 (buf!1865 thiss!1090)) (currentByte!3664 thiss!1090) (currentBit!3659 thiss!1090)))))

(declare-fun b!76690 () Bool)

(declare-fun e!50328 () Bool)

(assert (=> b!76690 (= e!50328 (validate_offset_bits!1 ((_ sign_extend 32) (size!1481 (buf!1865 thiss!1090))) ((_ sign_extend 32) (currentByte!3664 thiss!1090)) ((_ sign_extend 32) (currentBit!3659 thiss!1090)) nBits!322))))

(declare-fun b!76689 () Bool)

(declare-fun lt!122838 () tuple2!6658)

(declare-fun lt!122836 () tuple2!6660)

(assert (=> b!76689 (= e!50327 (and (_2!3463 lt!122838) (= (_1!3463 lt!122838) (_2!3464 lt!122836))))))

(assert (=> b!76689 (= lt!122838 (checkBitsLoopPure!0 (_1!3464 lt!122836) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!122840 () Unit!5047)

(declare-fun lt!122839 () Unit!5047)

(assert (=> b!76689 (= lt!122840 lt!122839)))

(assert (=> b!76689 (validate_offset_bits!1 ((_ sign_extend 32) (size!1481 (buf!1865 (_2!3462 lt!122841)))) ((_ sign_extend 32) (currentByte!3664 thiss!1090)) ((_ sign_extend 32) (currentBit!3659 thiss!1090)) nBits!322)))

(assert (=> b!76689 (= lt!122839 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1865 (_2!3462 lt!122841)) nBits!322))))

(assert (=> b!76689 e!50328))

(declare-fun res!63355 () Bool)

(assert (=> b!76689 (=> (not res!63355) (not e!50328))))

(assert (=> b!76689 (= res!63355 (and (= (size!1481 (buf!1865 thiss!1090)) (size!1481 (buf!1865 (_2!3462 lt!122841)))) (bvsge nBits!322 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!76689 (= lt!122836 (reader!0 thiss!1090 (_2!3462 lt!122841)))))

(declare-fun b!76688 () Bool)

(declare-fun res!63356 () Bool)

(assert (=> b!76688 (=> (not res!63356) (not e!50327))))

(assert (=> b!76688 (= res!63356 (isPrefixOf!0 thiss!1090 (_2!3462 lt!122841)))))

(declare-fun d!24244 () Bool)

(assert (=> d!24244 e!50327))

(declare-fun res!63354 () Bool)

(assert (=> d!24244 (=> (not res!63354) (not e!50327))))

(assert (=> d!24244 (= res!63354 (= (size!1481 (buf!1865 thiss!1090)) (size!1481 (buf!1865 (_2!3462 lt!122841)))))))

(declare-fun choose!36 (BitStream!2536 (_ BitVec 64) Bool) tuple2!6656)

(assert (=> d!24244 (= lt!122841 (choose!36 thiss!1090 nBits!322 false))))

(assert (=> d!24244 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!24244 (= (appendNBits!0 thiss!1090 nBits!322 false) lt!122841)))

(assert (= (and d!24244 res!63354) b!76687))

(assert (= (and b!76687 res!63353) b!76688))

(assert (= (and b!76688 res!63356) b!76689))

(assert (= (and b!76689 res!63355) b!76690))

(declare-fun m!121985 () Bool)

(assert (=> b!76687 m!121985))

(assert (=> b!76687 m!121827))

(declare-fun m!121989 () Bool)

(assert (=> d!24244 m!121989))

(assert (=> b!76690 m!121811))

(declare-fun m!121991 () Bool)

(assert (=> b!76688 m!121991))

(declare-fun m!121993 () Bool)

(assert (=> b!76689 m!121993))

(declare-fun m!121995 () Bool)

(assert (=> b!76689 m!121995))

(declare-fun m!121997 () Bool)

(assert (=> b!76689 m!121997))

(declare-fun m!121999 () Bool)

(assert (=> b!76689 m!121999))

(assert (=> b!76573 d!24244))

(declare-fun d!24270 () Bool)

(declare-fun res!63367 () Bool)

(declare-fun e!50335 () Bool)

(assert (=> d!24270 (=> (not res!63367) (not e!50335))))

(assert (=> d!24270 (= res!63367 (= (size!1481 (buf!1865 thiss!1090)) (size!1481 (buf!1865 (_2!3462 lt!122600)))))))

(assert (=> d!24270 (= (isPrefixOf!0 thiss!1090 (_2!3462 lt!122600)) e!50335)))

(declare-fun b!76700 () Bool)

(declare-fun res!63368 () Bool)

(assert (=> b!76700 (=> (not res!63368) (not e!50335))))

(assert (=> b!76700 (= res!63368 (bvsle (bitIndex!0 (size!1481 (buf!1865 thiss!1090)) (currentByte!3664 thiss!1090) (currentBit!3659 thiss!1090)) (bitIndex!0 (size!1481 (buf!1865 (_2!3462 lt!122600))) (currentByte!3664 (_2!3462 lt!122600)) (currentBit!3659 (_2!3462 lt!122600)))))))

(declare-fun b!76701 () Bool)

(declare-fun e!50336 () Bool)

(assert (=> b!76701 (= e!50335 e!50336)))

(declare-fun res!63366 () Bool)

(assert (=> b!76701 (=> res!63366 e!50336)))

(assert (=> b!76701 (= res!63366 (= (size!1481 (buf!1865 thiss!1090)) #b00000000000000000000000000000000))))

(declare-fun b!76702 () Bool)

(declare-fun arrayBitRangesEq!0 (array!3182 array!3182 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!76702 (= e!50336 (arrayBitRangesEq!0 (buf!1865 thiss!1090) (buf!1865 (_2!3462 lt!122600)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1481 (buf!1865 thiss!1090)) (currentByte!3664 thiss!1090) (currentBit!3659 thiss!1090))))))

(assert (= (and d!24270 res!63367) b!76700))

(assert (= (and b!76700 res!63368) b!76701))

(assert (= (and b!76701 (not res!63366)) b!76702))

(assert (=> b!76700 m!121827))

(assert (=> b!76700 m!121825))

(assert (=> b!76702 m!121827))

(assert (=> b!76702 m!121827))

(declare-fun m!122001 () Bool)

(assert (=> b!76702 m!122001))

(assert (=> b!76578 d!24270))

(declare-fun d!24274 () Bool)

(declare-datatypes ((tuple2!6678 0))(
  ( (tuple2!6679 (_1!3473 Bool) (_2!3473 BitStream!2536)) )
))
(declare-fun lt!122856 () tuple2!6678)

(declare-fun checkBitsLoop!0 (BitStream!2536 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!6678)

(assert (=> d!24274 (= lt!122856 (checkBitsLoop!0 (_1!3464 lt!122598) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!24274 (= (checkBitsLoopPure!0 (_1!3464 lt!122598) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000) (tuple2!6659 (_2!3473 lt!122856) (_1!3473 lt!122856)))))

(declare-fun bs!5859 () Bool)

(assert (= bs!5859 d!24274))

(declare-fun m!122003 () Bool)

(assert (=> bs!5859 m!122003))

(assert (=> b!76577 d!24274))

(declare-fun d!24276 () Bool)

(assert (=> d!24276 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1481 (buf!1865 (_2!3462 lt!122600)))) ((_ sign_extend 32) (currentByte!3664 thiss!1090)) ((_ sign_extend 32) (currentBit!3659 thiss!1090)) nBits!322) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1481 (buf!1865 (_2!3462 lt!122600)))) ((_ sign_extend 32) (currentByte!3664 thiss!1090)) ((_ sign_extend 32) (currentBit!3659 thiss!1090))) nBits!322))))

(declare-fun bs!5860 () Bool)

(assert (= bs!5860 d!24276))

(declare-fun m!122005 () Bool)

(assert (=> bs!5860 m!122005))

(assert (=> b!76577 d!24276))

(declare-fun d!24278 () Bool)

(assert (=> d!24278 (validate_offset_bits!1 ((_ sign_extend 32) (size!1481 (buf!1865 (_2!3462 lt!122600)))) ((_ sign_extend 32) (currentByte!3664 thiss!1090)) ((_ sign_extend 32) (currentBit!3659 thiss!1090)) nBits!322)))

(declare-fun lt!122871 () Unit!5047)

(declare-fun choose!9 (BitStream!2536 array!3182 (_ BitVec 64) BitStream!2536) Unit!5047)

(assert (=> d!24278 (= lt!122871 (choose!9 thiss!1090 (buf!1865 (_2!3462 lt!122600)) nBits!322 (BitStream!2537 (buf!1865 (_2!3462 lt!122600)) (currentByte!3664 thiss!1090) (currentBit!3659 thiss!1090))))))

(assert (=> d!24278 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1865 (_2!3462 lt!122600)) nBits!322) lt!122871)))

(declare-fun bs!5861 () Bool)

(assert (= bs!5861 d!24278))

(assert (=> bs!5861 m!121815))

(declare-fun m!122009 () Bool)

(assert (=> bs!5861 m!122009))

(assert (=> b!76577 d!24278))

(declare-fun b!76742 () Bool)

(declare-fun res!63406 () Bool)

(declare-fun e!50358 () Bool)

(assert (=> b!76742 (=> (not res!63406) (not e!50358))))

(declare-fun lt!122934 () tuple2!6660)

(assert (=> b!76742 (= res!63406 (isPrefixOf!0 (_1!3464 lt!122934) thiss!1090))))

(declare-fun b!76743 () Bool)

(declare-fun e!50357 () Unit!5047)

(declare-fun lt!122948 () Unit!5047)

(assert (=> b!76743 (= e!50357 lt!122948)))

(declare-fun lt!122939 () (_ BitVec 64))

(assert (=> b!76743 (= lt!122939 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122940 () (_ BitVec 64))

(assert (=> b!76743 (= lt!122940 (bitIndex!0 (size!1481 (buf!1865 thiss!1090)) (currentByte!3664 thiss!1090) (currentBit!3659 thiss!1090)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!3182 array!3182 (_ BitVec 64) (_ BitVec 64)) Unit!5047)

(assert (=> b!76743 (= lt!122948 (arrayBitRangesEqSymmetric!0 (buf!1865 thiss!1090) (buf!1865 (_2!3462 lt!122600)) lt!122939 lt!122940))))

(assert (=> b!76743 (arrayBitRangesEq!0 (buf!1865 (_2!3462 lt!122600)) (buf!1865 thiss!1090) lt!122939 lt!122940)))

(declare-fun b!76744 () Bool)

(declare-fun Unit!5055 () Unit!5047)

(assert (=> b!76744 (= e!50357 Unit!5055)))

(declare-fun d!24282 () Bool)

(assert (=> d!24282 e!50358))

(declare-fun res!63404 () Bool)

(assert (=> d!24282 (=> (not res!63404) (not e!50358))))

(assert (=> d!24282 (= res!63404 (isPrefixOf!0 (_1!3464 lt!122934) (_2!3464 lt!122934)))))

(declare-fun lt!122941 () BitStream!2536)

(assert (=> d!24282 (= lt!122934 (tuple2!6661 lt!122941 (_2!3462 lt!122600)))))

(declare-fun lt!122936 () Unit!5047)

(declare-fun lt!122933 () Unit!5047)

(assert (=> d!24282 (= lt!122936 lt!122933)))

(assert (=> d!24282 (isPrefixOf!0 lt!122941 (_2!3462 lt!122600))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2536 BitStream!2536 BitStream!2536) Unit!5047)

(assert (=> d!24282 (= lt!122933 (lemmaIsPrefixTransitive!0 lt!122941 (_2!3462 lt!122600) (_2!3462 lt!122600)))))

(declare-fun lt!122938 () Unit!5047)

(declare-fun lt!122946 () Unit!5047)

(assert (=> d!24282 (= lt!122938 lt!122946)))

(assert (=> d!24282 (isPrefixOf!0 lt!122941 (_2!3462 lt!122600))))

(assert (=> d!24282 (= lt!122946 (lemmaIsPrefixTransitive!0 lt!122941 thiss!1090 (_2!3462 lt!122600)))))

(declare-fun lt!122935 () Unit!5047)

(assert (=> d!24282 (= lt!122935 e!50357)))

(declare-fun c!5585 () Bool)

(assert (=> d!24282 (= c!5585 (not (= (size!1481 (buf!1865 thiss!1090)) #b00000000000000000000000000000000)))))

(declare-fun lt!122942 () Unit!5047)

(declare-fun lt!122944 () Unit!5047)

(assert (=> d!24282 (= lt!122942 lt!122944)))

(assert (=> d!24282 (isPrefixOf!0 (_2!3462 lt!122600) (_2!3462 lt!122600))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2536) Unit!5047)

(assert (=> d!24282 (= lt!122944 (lemmaIsPrefixRefl!0 (_2!3462 lt!122600)))))

(declare-fun lt!122943 () Unit!5047)

(declare-fun lt!122945 () Unit!5047)

(assert (=> d!24282 (= lt!122943 lt!122945)))

(assert (=> d!24282 (= lt!122945 (lemmaIsPrefixRefl!0 (_2!3462 lt!122600)))))

(declare-fun lt!122932 () Unit!5047)

(declare-fun lt!122931 () Unit!5047)

(assert (=> d!24282 (= lt!122932 lt!122931)))

(assert (=> d!24282 (isPrefixOf!0 lt!122941 lt!122941)))

(assert (=> d!24282 (= lt!122931 (lemmaIsPrefixRefl!0 lt!122941))))

(declare-fun lt!122937 () Unit!5047)

(declare-fun lt!122949 () Unit!5047)

(assert (=> d!24282 (= lt!122937 lt!122949)))

(assert (=> d!24282 (isPrefixOf!0 thiss!1090 thiss!1090)))

(assert (=> d!24282 (= lt!122949 (lemmaIsPrefixRefl!0 thiss!1090))))

(assert (=> d!24282 (= lt!122941 (BitStream!2537 (buf!1865 (_2!3462 lt!122600)) (currentByte!3664 thiss!1090) (currentBit!3659 thiss!1090)))))

(assert (=> d!24282 (isPrefixOf!0 thiss!1090 (_2!3462 lt!122600))))

(assert (=> d!24282 (= (reader!0 thiss!1090 (_2!3462 lt!122600)) lt!122934)))

(declare-fun b!76745 () Bool)

(declare-fun lt!122947 () (_ BitVec 64))

(declare-fun lt!122930 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2536 (_ BitVec 64)) BitStream!2536)

(assert (=> b!76745 (= e!50358 (= (_1!3464 lt!122934) (withMovedBitIndex!0 (_2!3464 lt!122934) (bvsub lt!122930 lt!122947))))))

(assert (=> b!76745 (or (= (bvand lt!122930 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!122947 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!122930 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!122930 lt!122947) #b1000000000000000000000000000000000000000000000000000000000000000)))))

