; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15348 () Bool)

(assert start!15348)

(declare-fun b!78110 () Bool)

(declare-fun res!64531 () Bool)

(declare-fun e!51261 () Bool)

(assert (=> b!78110 (=> (not res!64531) (not e!51261))))

(declare-datatypes ((array!3325 0))(
  ( (array!3326 (arr!2142 (Array (_ BitVec 32) (_ BitVec 8))) (size!1541 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2644 0))(
  ( (BitStream!2645 (buf!1931 array!3325) (currentByte!3760 (_ BitVec 32)) (currentBit!3755 (_ BitVec 32))) )
))
(declare-fun thiss!1107 () BitStream!2644)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!78110 (= res!64531 (validate_offset_bit!0 ((_ sign_extend 32) (size!1541 (buf!1931 thiss!1107))) ((_ sign_extend 32) (currentByte!3760 thiss!1107)) ((_ sign_extend 32) (currentBit!3755 thiss!1107))))))

(declare-fun b!78111 () Bool)

(declare-fun e!51263 () Bool)

(assert (=> b!78111 (= e!51261 (not e!51263))))

(declare-fun res!64530 () Bool)

(assert (=> b!78111 (=> res!64530 e!51263)))

(declare-datatypes ((Unit!5167 0))(
  ( (Unit!5168) )
))
(declare-datatypes ((tuple2!6956 0))(
  ( (tuple2!6957 (_1!3615 Unit!5167) (_2!3615 BitStream!2644)) )
))
(declare-fun lt!125070 () tuple2!6956)

(assert (=> b!78111 (= res!64530 (not (= (size!1541 (buf!1931 (_2!3615 lt!125070))) (size!1541 (buf!1931 thiss!1107)))))))

(declare-fun e!51266 () Bool)

(assert (=> b!78111 e!51266))

(declare-fun res!64525 () Bool)

(assert (=> b!78111 (=> (not res!64525) (not e!51266))))

(assert (=> b!78111 (= res!64525 (= (size!1541 (buf!1931 thiss!1107)) (size!1541 (buf!1931 (_2!3615 lt!125070)))))))

(declare-fun lt!125067 () Bool)

(declare-fun appendBit!0 (BitStream!2644 Bool) tuple2!6956)

(assert (=> b!78111 (= lt!125070 (appendBit!0 thiss!1107 lt!125067))))

(declare-fun b!215 () (_ BitVec 8))

(declare-fun bitNr!1 () (_ BitVec 32))

(assert (=> b!78111 (= lt!125067 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) b!215))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) bitNr!1))) #b00000000000000000000000000000000)))))

(declare-fun b!78112 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!78112 (= e!51263 (invariant!0 (currentBit!3755 thiss!1107) (currentByte!3760 thiss!1107) (size!1541 (buf!1931 thiss!1107))))))

(declare-fun b!78113 () Bool)

(declare-fun e!51267 () Bool)

(declare-datatypes ((tuple2!6958 0))(
  ( (tuple2!6959 (_1!3616 BitStream!2644) (_2!3616 Bool)) )
))
(declare-fun lt!125069 () tuple2!6958)

(declare-fun lt!125068 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!78113 (= e!51267 (= (bitIndex!0 (size!1541 (buf!1931 (_1!3616 lt!125069))) (currentByte!3760 (_1!3616 lt!125069)) (currentBit!3755 (_1!3616 lt!125069))) lt!125068))))

(declare-fun b!78114 () Bool)

(declare-fun e!51262 () Bool)

(assert (=> b!78114 (= e!51262 e!51267)))

(declare-fun res!64529 () Bool)

(assert (=> b!78114 (=> (not res!64529) (not e!51267))))

(assert (=> b!78114 (= res!64529 (and (= (_2!3616 lt!125069) lt!125067) (= (_1!3616 lt!125069) (_2!3615 lt!125070))))))

(declare-fun readBitPure!0 (BitStream!2644) tuple2!6958)

(declare-fun readerFrom!0 (BitStream!2644 (_ BitVec 32) (_ BitVec 32)) BitStream!2644)

(assert (=> b!78114 (= lt!125069 (readBitPure!0 (readerFrom!0 (_2!3615 lt!125070) (currentBit!3755 thiss!1107) (currentByte!3760 thiss!1107))))))

(declare-fun b!78115 () Bool)

(declare-fun e!51264 () Bool)

(declare-fun array_inv!1387 (array!3325) Bool)

(assert (=> b!78115 (= e!51264 (array_inv!1387 (buf!1931 thiss!1107)))))

(declare-fun b!78116 () Bool)

(declare-fun res!64526 () Bool)

(assert (=> b!78116 (=> (not res!64526) (not e!51262))))

(declare-fun isPrefixOf!0 (BitStream!2644 BitStream!2644) Bool)

(assert (=> b!78116 (= res!64526 (isPrefixOf!0 thiss!1107 (_2!3615 lt!125070)))))

(declare-fun res!64527 () Bool)

(assert (=> start!15348 (=> (not res!64527) (not e!51261))))

(assert (=> start!15348 (= res!64527 (and (bvsge bitNr!1 #b00000000000000000000000000000000) (bvslt bitNr!1 #b00000000000000000000000000001000)))))

(assert (=> start!15348 e!51261))

(assert (=> start!15348 true))

(declare-fun inv!12 (BitStream!2644) Bool)

(assert (=> start!15348 (and (inv!12 thiss!1107) e!51264)))

(declare-fun b!78117 () Bool)

(assert (=> b!78117 (= e!51266 e!51262)))

(declare-fun res!64528 () Bool)

(assert (=> b!78117 (=> (not res!64528) (not e!51262))))

(declare-fun lt!125066 () (_ BitVec 64))

(assert (=> b!78117 (= res!64528 (= lt!125068 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!125066)))))

(assert (=> b!78117 (= lt!125068 (bitIndex!0 (size!1541 (buf!1931 (_2!3615 lt!125070))) (currentByte!3760 (_2!3615 lt!125070)) (currentBit!3755 (_2!3615 lt!125070))))))

(assert (=> b!78117 (= lt!125066 (bitIndex!0 (size!1541 (buf!1931 thiss!1107)) (currentByte!3760 thiss!1107) (currentBit!3755 thiss!1107)))))

(assert (= (and start!15348 res!64527) b!78110))

(assert (= (and b!78110 res!64531) b!78111))

(assert (= (and b!78111 res!64525) b!78117))

(assert (= (and b!78117 res!64528) b!78116))

(assert (= (and b!78116 res!64526) b!78114))

(assert (= (and b!78114 res!64529) b!78113))

(assert (= (and b!78111 (not res!64530)) b!78112))

(assert (= start!15348 b!78115))

(declare-fun m!123711 () Bool)

(assert (=> b!78113 m!123711))

(declare-fun m!123713 () Bool)

(assert (=> b!78111 m!123713))

(declare-fun m!123715 () Bool)

(assert (=> b!78111 m!123715))

(declare-fun m!123717 () Bool)

(assert (=> b!78110 m!123717))

(declare-fun m!123719 () Bool)

(assert (=> b!78114 m!123719))

(assert (=> b!78114 m!123719))

(declare-fun m!123721 () Bool)

(assert (=> b!78114 m!123721))

(declare-fun m!123723 () Bool)

(assert (=> start!15348 m!123723))

(declare-fun m!123725 () Bool)

(assert (=> b!78115 m!123725))

(declare-fun m!123727 () Bool)

(assert (=> b!78112 m!123727))

(declare-fun m!123729 () Bool)

(assert (=> b!78117 m!123729))

(declare-fun m!123731 () Bool)

(assert (=> b!78117 m!123731))

(declare-fun m!123733 () Bool)

(assert (=> b!78116 m!123733))

(push 1)

(assert (not b!78111))

(assert (not b!78115))

(assert (not b!78113))

(assert (not b!78112))

(assert (not b!78116))

(assert (not start!15348))

(assert (not b!78110))

(assert (not b!78117))

(assert (not b!78114))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!24652 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!24652 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!1541 (buf!1931 thiss!1107))) ((_ sign_extend 32) (currentByte!3760 thiss!1107)) ((_ sign_extend 32) (currentBit!3755 thiss!1107))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1541 (buf!1931 thiss!1107))) ((_ sign_extend 32) (currentByte!3760 thiss!1107)) ((_ sign_extend 32) (currentBit!3755 thiss!1107))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!5988 () Bool)

(assert (= bs!5988 d!24652))

(declare-fun m!123785 () Bool)

(assert (=> bs!5988 m!123785))

(assert (=> b!78110 d!24652))

(declare-fun d!24654 () Bool)

(assert (=> d!24654 (= (array_inv!1387 (buf!1931 thiss!1107)) (bvsge (size!1541 (buf!1931 thiss!1107)) #b00000000000000000000000000000000))))

(assert (=> b!78115 d!24654))

(declare-fun d!24656 () Bool)

(declare-fun res!64603 () Bool)

(declare-fun e!51326 () Bool)

(assert (=> d!24656 (=> (not res!64603) (not e!51326))))

(assert (=> d!24656 (= res!64603 (= (size!1541 (buf!1931 thiss!1107)) (size!1541 (buf!1931 (_2!3615 lt!125070)))))))

(assert (=> d!24656 (= (isPrefixOf!0 thiss!1107 (_2!3615 lt!125070)) e!51326)))

(declare-fun b!78194 () Bool)

(declare-fun res!64601 () Bool)

(assert (=> b!78194 (=> (not res!64601) (not e!51326))))

(assert (=> b!78194 (= res!64601 (bvsle (bitIndex!0 (size!1541 (buf!1931 thiss!1107)) (currentByte!3760 thiss!1107) (currentBit!3755 thiss!1107)) (bitIndex!0 (size!1541 (buf!1931 (_2!3615 lt!125070))) (currentByte!3760 (_2!3615 lt!125070)) (currentBit!3755 (_2!3615 lt!125070)))))))

(declare-fun b!78195 () Bool)

(declare-fun e!51327 () Bool)

(assert (=> b!78195 (= e!51326 e!51327)))

(declare-fun res!64602 () Bool)

(assert (=> b!78195 (=> res!64602 e!51327)))

(assert (=> b!78195 (= res!64602 (= (size!1541 (buf!1931 thiss!1107)) #b00000000000000000000000000000000))))

(declare-fun b!78196 () Bool)

(declare-fun arrayBitRangesEq!0 (array!3325 array!3325 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!78196 (= e!51327 (arrayBitRangesEq!0 (buf!1931 thiss!1107) (buf!1931 (_2!3615 lt!125070)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1541 (buf!1931 thiss!1107)) (currentByte!3760 thiss!1107) (currentBit!3755 thiss!1107))))))

(assert (= (and d!24656 res!64603) b!78194))

(assert (= (and b!78194 res!64601) b!78195))

(assert (= (and b!78195 (not res!64602)) b!78196))

(assert (=> b!78194 m!123731))

(assert (=> b!78194 m!123729))

(assert (=> b!78196 m!123731))

(assert (=> b!78196 m!123731))

(declare-fun m!123801 () Bool)

(assert (=> b!78196 m!123801))

(assert (=> b!78116 d!24656))

(declare-fun d!24664 () Bool)

(assert (=> d!24664 (= (inv!12 thiss!1107) (invariant!0 (currentBit!3755 thiss!1107) (currentByte!3760 thiss!1107) (size!1541 (buf!1931 thiss!1107))))))

(declare-fun bs!5991 () Bool)

(assert (= bs!5991 d!24664))

(assert (=> bs!5991 m!123727))

(assert (=> start!15348 d!24664))

(declare-fun b!78222 () Bool)

(declare-fun res!64633 () Bool)

(declare-fun e!51344 () Bool)

(assert (=> b!78222 (=> (not res!64633) (not e!51344))))

(declare-fun lt!125157 () (_ BitVec 64))

(declare-fun lt!125159 () (_ BitVec 64))

(declare-fun lt!125158 () tuple2!6956)

(assert (=> b!78222 (= res!64633 (= (bitIndex!0 (size!1541 (buf!1931 (_2!3615 lt!125158))) (currentByte!3760 (_2!3615 lt!125158)) (currentBit!3755 (_2!3615 lt!125158))) (bvadd lt!125157 lt!125159)))))

(assert (=> b!78222 (or (not (= (bvand lt!125157 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125159 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!125157 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!125157 lt!125159) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!78222 (= lt!125159 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!78222 (= lt!125157 (bitIndex!0 (size!1541 (buf!1931 thiss!1107)) (currentByte!3760 thiss!1107) (currentBit!3755 thiss!1107)))))

(declare-fun d!24666 () Bool)

(assert (=> d!24666 e!51344))

(declare-fun res!64632 () Bool)

(assert (=> d!24666 (=> (not res!64632) (not e!51344))))

(assert (=> d!24666 (= res!64632 (= (size!1541 (buf!1931 thiss!1107)) (size!1541 (buf!1931 (_2!3615 lt!125158)))))))

(declare-fun choose!16 (BitStream!2644 Bool) tuple2!6956)

(assert (=> d!24666 (= lt!125158 (choose!16 thiss!1107 lt!125067))))

(assert (=> d!24666 (validate_offset_bit!0 ((_ sign_extend 32) (size!1541 (buf!1931 thiss!1107))) ((_ sign_extend 32) (currentByte!3760 thiss!1107)) ((_ sign_extend 32) (currentBit!3755 thiss!1107)))))

(assert (=> d!24666 (= (appendBit!0 thiss!1107 lt!125067) lt!125158)))

(declare-fun b!78223 () Bool)

(declare-fun res!64630 () Bool)

(assert (=> b!78223 (=> (not res!64630) (not e!51344))))

(assert (=> b!78223 (= res!64630 (isPrefixOf!0 thiss!1107 (_2!3615 lt!125158)))))

(declare-fun b!78225 () Bool)

(declare-fun e!51343 () Bool)

(declare-fun lt!125160 () tuple2!6958)

(assert (=> b!78225 (= e!51343 (= (bitIndex!0 (size!1541 (buf!1931 (_1!3616 lt!125160))) (currentByte!3760 (_1!3616 lt!125160)) (currentBit!3755 (_1!3616 lt!125160))) (bitIndex!0 (size!1541 (buf!1931 (_2!3615 lt!125158))) (currentByte!3760 (_2!3615 lt!125158)) (currentBit!3755 (_2!3615 lt!125158)))))))

(declare-fun b!78224 () Bool)

(assert (=> b!78224 (= e!51344 e!51343)))

(declare-fun res!64631 () Bool)

(assert (=> b!78224 (=> (not res!64631) (not e!51343))))

(assert (=> b!78224 (= res!64631 (and (= (_2!3616 lt!125160) lt!125067) (= (_1!3616 lt!125160) (_2!3615 lt!125158))))))

(assert (=> b!78224 (= lt!125160 (readBitPure!0 (readerFrom!0 (_2!3615 lt!125158) (currentBit!3755 thiss!1107) (currentByte!3760 thiss!1107))))))

(assert (= (and d!24666 res!64632) b!78222))

(assert (= (and b!78222 res!64633) b!78223))

(assert (= (and b!78223 res!64630) b!78224))

(assert (= (and b!78224 res!64631) b!78225))

(declare-fun m!123821 () Bool)

(assert (=> b!78224 m!123821))

(assert (=> b!78224 m!123821))

(declare-fun m!123823 () Bool)

(assert (=> b!78224 m!123823))

(declare-fun m!123825 () Bool)

(assert (=> b!78223 m!123825))

(declare-fun m!123827 () Bool)

(assert (=> b!78222 m!123827))

(assert (=> b!78222 m!123731))

(declare-fun m!123829 () Bool)

(assert (=> d!24666 m!123829))

(assert (=> d!24666 m!123717))

(declare-fun m!123831 () Bool)

(assert (=> b!78225 m!123831))

(assert (=> b!78225 m!123827))

(assert (=> b!78111 d!24666))

(declare-fun d!24686 () Bool)

(assert (=> d!24686 (= (invariant!0 (currentBit!3755 thiss!1107) (currentByte!3760 thiss!1107) (size!1541 (buf!1931 thiss!1107))) (and (bvsge (currentBit!3755 thiss!1107) #b00000000000000000000000000000000) (bvslt (currentBit!3755 thiss!1107) #b00000000000000000000000000001000) (bvsge (currentByte!3760 thiss!1107) #b00000000000000000000000000000000) (or (bvslt (currentByte!3760 thiss!1107) (size!1541 (buf!1931 thiss!1107))) (and (= (currentBit!3755 thiss!1107) #b00000000000000000000000000000000) (= (currentByte!3760 thiss!1107) (size!1541 (buf!1931 thiss!1107)))))))))

(assert (=> b!78112 d!24686))

(declare-fun d!24688 () Bool)

(declare-fun e!51357 () Bool)

(assert (=> d!24688 e!51357))

(declare-fun res!64656 () Bool)

(assert (=> d!24688 (=> (not res!64656) (not e!51357))))

(declare-fun lt!125188 () (_ BitVec 64))

(declare-fun lt!125186 () (_ BitVec 64))

(declare-fun lt!125187 () (_ BitVec 64))

(assert (=> d!24688 (= res!64656 (= lt!125186 (bvsub lt!125187 lt!125188)))))

(assert (=> d!24688 (or (= (bvand lt!125187 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125188 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!125187 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!125187 lt!125188) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24688 (= lt!125188 (remainingBits!0 ((_ sign_extend 32) (size!1541 (buf!1931 (_2!3615 lt!125070)))) ((_ sign_extend 32) (currentByte!3760 (_2!3615 lt!125070))) ((_ sign_extend 32) (currentBit!3755 (_2!3615 lt!125070)))))))

(declare-fun lt!125190 () (_ BitVec 64))

(declare-fun lt!125185 () (_ BitVec 64))

(assert (=> d!24688 (= lt!125187 (bvmul lt!125190 lt!125185))))

(assert (=> d!24688 (or (= lt!125190 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!125185 (bvsdiv (bvmul lt!125190 lt!125185) lt!125190)))))

(assert (=> d!24688 (= lt!125185 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24688 (= lt!125190 ((_ sign_extend 32) (size!1541 (buf!1931 (_2!3615 lt!125070)))))))

(assert (=> d!24688 (= lt!125186 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3760 (_2!3615 lt!125070))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3755 (_2!3615 lt!125070)))))))

(assert (=> d!24688 (invariant!0 (currentBit!3755 (_2!3615 lt!125070)) (currentByte!3760 (_2!3615 lt!125070)) (size!1541 (buf!1931 (_2!3615 lt!125070))))))

(assert (=> d!24688 (= (bitIndex!0 (size!1541 (buf!1931 (_2!3615 lt!125070))) (currentByte!3760 (_2!3615 lt!125070)) (currentBit!3755 (_2!3615 lt!125070))) lt!125186)))

(declare-fun b!78249 () Bool)

(declare-fun res!64657 () Bool)

(assert (=> b!78249 (=> (not res!64657) (not e!51357))))

(assert (=> b!78249 (= res!64657 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!125186))))

(declare-fun b!78250 () Bool)

(declare-fun lt!125189 () (_ BitVec 64))

(assert (=> b!78250 (= e!51357 (bvsle lt!125186 (bvmul lt!125189 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!78250 (or (= lt!125189 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!125189 #b0000000000000000000000000000000000000000000000000000000000001000) lt!125189)))))

(assert (=> b!78250 (= lt!125189 ((_ sign_extend 32) (size!1541 (buf!1931 (_2!3615 lt!125070)))))))

(assert (= (and d!24688 res!64656) b!78249))

(assert (= (and b!78249 res!64657) b!78250))

(declare-fun m!123845 () Bool)

(assert (=> d!24688 m!123845))

(declare-fun m!123847 () Bool)

(assert (=> d!24688 m!123847))

(assert (=> b!78117 d!24688))

(declare-fun d!24694 () Bool)

(declare-fun e!51358 () Bool)

(assert (=> d!24694 e!51358))

(declare-fun res!64658 () Bool)

(assert (=> d!24694 (=> (not res!64658) (not e!51358))))

(declare-fun lt!125193 () (_ BitVec 64))

(declare-fun lt!125194 () (_ BitVec 64))

(declare-fun lt!125192 () (_ BitVec 64))

(assert (=> d!24694 (= res!64658 (= lt!125192 (bvsub lt!125193 lt!125194)))))

(assert (=> d!24694 (or (= (bvand lt!125193 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125194 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!125193 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!125193 lt!125194) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24694 (= lt!125194 (remainingBits!0 ((_ sign_extend 32) (size!1541 (buf!1931 thiss!1107))) ((_ sign_extend 32) (currentByte!3760 thiss!1107)) ((_ sign_extend 32) (currentBit!3755 thiss!1107))))))

(declare-fun lt!125196 () (_ BitVec 64))

(declare-fun lt!125191 () (_ BitVec 64))

(assert (=> d!24694 (= lt!125193 (bvmul lt!125196 lt!125191))))

(assert (=> d!24694 (or (= lt!125196 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!125191 (bvsdiv (bvmul lt!125196 lt!125191) lt!125196)))))

(assert (=> d!24694 (= lt!125191 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24694 (= lt!125196 ((_ sign_extend 32) (size!1541 (buf!1931 thiss!1107))))))

(assert (=> d!24694 (= lt!125192 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3760 thiss!1107)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3755 thiss!1107))))))

(assert (=> d!24694 (invariant!0 (currentBit!3755 thiss!1107) (currentByte!3760 thiss!1107) (size!1541 (buf!1931 thiss!1107)))))

(assert (=> d!24694 (= (bitIndex!0 (size!1541 (buf!1931 thiss!1107)) (currentByte!3760 thiss!1107) (currentBit!3755 thiss!1107)) lt!125192)))

(declare-fun b!78251 () Bool)

(declare-fun res!64659 () Bool)

(assert (=> b!78251 (=> (not res!64659) (not e!51358))))

(assert (=> b!78251 (= res!64659 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!125192))))

(declare-fun b!78252 () Bool)

(declare-fun lt!125195 () (_ BitVec 64))

(assert (=> b!78252 (= e!51358 (bvsle lt!125192 (bvmul lt!125195 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!78252 (or (= lt!125195 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!125195 #b0000000000000000000000000000000000000000000000000000000000001000) lt!125195)))))

(assert (=> b!78252 (= lt!125195 ((_ sign_extend 32) (size!1541 (buf!1931 thiss!1107))))))

(assert (= (and d!24694 res!64658) b!78251))

(assert (= (and b!78251 res!64659) b!78252))

(assert (=> d!24694 m!123785))

(assert (=> d!24694 m!123727))

(assert (=> b!78117 d!24694))

(declare-fun d!24696 () Bool)

(declare-fun e!51361 () Bool)

(assert (=> d!24696 e!51361))

(declare-fun res!64663 () Bool)

(assert (=> d!24696 (=> (not res!64663) (not e!51361))))

(declare-fun lt!125199 () (_ BitVec 64))

(declare-fun lt!125198 () (_ BitVec 64))

(declare-fun lt!125200 () (_ BitVec 64))

(assert (=> d!24696 (= res!64663 (= lt!125198 (bvsub lt!125199 lt!125200)))))

(assert (=> d!24696 (or (= (bvand lt!125199 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125200 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!125199 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!125199 lt!125200) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24696 (= lt!125200 (remainingBits!0 ((_ sign_extend 32) (size!1541 (buf!1931 (_1!3616 lt!125069)))) ((_ sign_extend 32) (currentByte!3760 (_1!3616 lt!125069))) ((_ sign_extend 32) (currentBit!3755 (_1!3616 lt!125069)))))))

(declare-fun lt!125202 () (_ BitVec 64))

(declare-fun lt!125197 () (_ BitVec 64))

(assert (=> d!24696 (= lt!125199 (bvmul lt!125202 lt!125197))))

(assert (=> d!24696 (or (= lt!125202 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!125197 (bvsdiv (bvmul lt!125202 lt!125197) lt!125202)))))

(assert (=> d!24696 (= lt!125197 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24696 (= lt!125202 ((_ sign_extend 32) (size!1541 (buf!1931 (_1!3616 lt!125069)))))))

(assert (=> d!24696 (= lt!125198 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3760 (_1!3616 lt!125069))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3755 (_1!3616 lt!125069)))))))

(assert (=> d!24696 (invariant!0 (currentBit!3755 (_1!3616 lt!125069)) (currentByte!3760 (_1!3616 lt!125069)) (size!1541 (buf!1931 (_1!3616 lt!125069))))))

(assert (=> d!24696 (= (bitIndex!0 (size!1541 (buf!1931 (_1!3616 lt!125069))) (currentByte!3760 (_1!3616 lt!125069)) (currentBit!3755 (_1!3616 lt!125069))) lt!125198)))

(declare-fun b!78256 () Bool)

(declare-fun res!64664 () Bool)

(assert (=> b!78256 (=> (not res!64664) (not e!51361))))

(assert (=> b!78256 (= res!64664 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!125198))))

(declare-fun b!78257 () Bool)

(declare-fun lt!125201 () (_ BitVec 64))

(assert (=> b!78257 (= e!51361 (bvsle lt!125198 (bvmul lt!125201 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!78257 (or (= lt!125201 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!125201 #b0000000000000000000000000000000000000000000000000000000000001000) lt!125201)))))

(assert (=> b!78257 (= lt!125201 ((_ sign_extend 32) (size!1541 (buf!1931 (_1!3616 lt!125069)))))))

(assert (= (and d!24696 res!64663) b!78256))

(assert (= (and b!78256 res!64664) b!78257))

(declare-fun m!123851 () Bool)

(assert (=> d!24696 m!123851))

(declare-fun m!123853 () Bool)

(assert (=> d!24696 m!123853))

(assert (=> b!78113 d!24696))

(declare-fun d!24700 () Bool)

(declare-datatypes ((tuple2!6972 0))(
  ( (tuple2!6973 (_1!3623 Bool) (_2!3623 BitStream!2644)) )
))
(declare-fun lt!125205 () tuple2!6972)

(declare-fun readBit!0 (BitStream!2644) tuple2!6972)

(assert (=> d!24700 (= lt!125205 (readBit!0 (readerFrom!0 (_2!3615 lt!125070) (currentBit!3755 thiss!1107) (currentByte!3760 thiss!1107))))))

(assert (=> d!24700 (= (readBitPure!0 (readerFrom!0 (_2!3615 lt!125070) (currentBit!3755 thiss!1107) (currentByte!3760 thiss!1107))) (tuple2!6959 (_2!3623 lt!125205) (_1!3623 lt!125205)))))

(declare-fun bs!5995 () Bool)

(assert (= bs!5995 d!24700))

(assert (=> bs!5995 m!123719))

(declare-fun m!123857 () Bool)

(assert (=> bs!5995 m!123857))

(assert (=> b!78114 d!24700))

(declare-fun d!24704 () Bool)

(declare-fun e!51364 () Bool)

(assert (=> d!24704 e!51364))

(declare-fun res!64668 () Bool)

(assert (=> d!24704 (=> (not res!64668) (not e!51364))))

(assert (=> d!24704 (= res!64668 (invariant!0 (currentBit!3755 (_2!3615 lt!125070)) (currentByte!3760 (_2!3615 lt!125070)) (size!1541 (buf!1931 (_2!3615 lt!125070)))))))

(assert (=> d!24704 (= (readerFrom!0 (_2!3615 lt!125070) (currentBit!3755 thiss!1107) (currentByte!3760 thiss!1107)) (BitStream!2645 (buf!1931 (_2!3615 lt!125070)) (currentByte!3760 thiss!1107) (currentBit!3755 thiss!1107)))))

(declare-fun b!78260 () Bool)

(assert (=> b!78260 (= e!51364 (invariant!0 (currentBit!3755 thiss!1107) (currentByte!3760 thiss!1107) (size!1541 (buf!1931 (_2!3615 lt!125070)))))))

(assert (= (and d!24704 res!64668) b!78260))

(assert (=> d!24704 m!123847))

(declare-fun m!123859 () Bool)

(assert (=> b!78260 m!123859))

(assert (=> b!78114 d!24704))

(push 1)

(assert (not d!24700))

(assert (not b!78196))

(assert (not d!24652))

(assert (not b!78223))

(assert (not b!78224))

(assert (not d!24688))

(assert (not b!78222))

(assert (not b!78194))

(assert (not d!24694))

(assert (not d!24696))

(assert (not b!78260))

(assert (not d!24704))

(assert (not d!24664))

(assert (not d!24666))

(assert (not b!78225))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

