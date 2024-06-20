; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3522 () Bool)

(assert start!3522)

(declare-fun res!14340 () Bool)

(declare-fun e!9640 () Bool)

(assert (=> start!3522 (=> (not res!14340) (not e!9640))))

(declare-fun nBits!313 () (_ BitVec 64))

(assert (=> start!3522 (= res!14340 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!3522 e!9640))

(assert (=> start!3522 true))

(declare-datatypes ((array!929 0))(
  ( (array!930 (arr!824 (Array (_ BitVec 32) (_ BitVec 8))) (size!395 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!750 0))(
  ( (BitStream!751 (buf!752 array!929) (currentByte!1915 (_ BitVec 32)) (currentBit!1910 (_ BitVec 32))) )
))
(declare-fun thiss!1073 () BitStream!750)

(declare-fun e!9642 () Bool)

(declare-fun inv!12 (BitStream!750) Bool)

(assert (=> start!3522 (and (inv!12 thiss!1073) e!9642)))

(declare-fun b!15405 () Bool)

(declare-fun e!9641 () Bool)

(declare-datatypes ((tuple2!1844 0))(
  ( (tuple2!1845 (_1!983 BitStream!750) (_2!983 Bool)) )
))
(declare-fun lt!23343 () tuple2!1844)

(declare-datatypes ((tuple2!1846 0))(
  ( (tuple2!1847 (_1!984 BitStream!750) (_2!984 BitStream!750)) )
))
(declare-fun lt!23344 () tuple2!1846)

(assert (=> b!15405 (= e!9641 (not (or (not (_2!983 lt!23343)) (not (= (_1!983 lt!23343) (_2!984 lt!23344))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!750 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!1844)

(assert (=> b!15405 (= lt!23343 (checkBitsLoopPure!0 (_1!984 lt!23344) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!1278 0))(
  ( (Unit!1279) )
))
(declare-datatypes ((tuple2!1848 0))(
  ( (tuple2!1849 (_1!985 Unit!1278) (_2!985 BitStream!750)) )
))
(declare-fun lt!23346 () tuple2!1848)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!15405 (validate_offset_bits!1 ((_ sign_extend 32) (size!395 (buf!752 (_2!985 lt!23346)))) ((_ sign_extend 32) (currentByte!1915 thiss!1073)) ((_ sign_extend 32) (currentBit!1910 thiss!1073)) nBits!313)))

(declare-fun lt!23341 () Unit!1278)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!750 array!929 (_ BitVec 64)) Unit!1278)

(assert (=> b!15405 (= lt!23341 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!752 (_2!985 lt!23346)) nBits!313))))

(declare-fun reader!0 (BitStream!750 BitStream!750) tuple2!1846)

(assert (=> b!15405 (= lt!23344 (reader!0 thiss!1073 (_2!985 lt!23346)))))

(declare-fun b!15406 () Bool)

(declare-fun array_inv!384 (array!929) Bool)

(assert (=> b!15406 (= e!9642 (array_inv!384 (buf!752 thiss!1073)))))

(declare-fun b!15407 () Bool)

(declare-fun lt!23340 () tuple2!1846)

(assert (=> b!15407 (= e!9640 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!395 (buf!752 (_1!984 lt!23340)))) ((_ sign_extend 32) (currentByte!1915 (_1!984 lt!23340))) ((_ sign_extend 32) (currentBit!1910 (_1!984 lt!23340))) nBits!313)))))

(assert (=> b!15407 (validate_offset_bits!1 ((_ sign_extend 32) (size!395 (buf!752 (_2!985 lt!23346)))) ((_ sign_extend 32) (currentByte!1915 thiss!1073)) ((_ sign_extend 32) (currentBit!1910 thiss!1073)) nBits!313)))

(declare-fun lt!23347 () Unit!1278)

(assert (=> b!15407 (= lt!23347 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!752 (_2!985 lt!23346)) nBits!313))))

(assert (=> b!15407 (= lt!23340 (reader!0 thiss!1073 (_2!985 lt!23346)))))

(declare-fun lt!23339 () Bool)

(declare-fun isPrefixOf!0 (BitStream!750 BitStream!750) Bool)

(assert (=> b!15407 (= lt!23339 (isPrefixOf!0 thiss!1073 (_2!985 lt!23346)))))

(declare-fun lt!23345 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!15407 (= lt!23345 (bitIndex!0 (size!395 (buf!752 (_2!985 lt!23346))) (currentByte!1915 (_2!985 lt!23346)) (currentBit!1910 (_2!985 lt!23346))))))

(declare-fun lt!23342 () (_ BitVec 64))

(assert (=> b!15407 (= lt!23342 (bitIndex!0 (size!395 (buf!752 thiss!1073)) (currentByte!1915 thiss!1073) (currentBit!1910 thiss!1073)))))

(assert (=> b!15407 e!9641))

(declare-fun res!14342 () Bool)

(assert (=> b!15407 (=> (not res!14342) (not e!9641))))

(assert (=> b!15407 (= res!14342 (= (size!395 (buf!752 thiss!1073)) (size!395 (buf!752 (_2!985 lt!23346)))))))

(declare-fun appendNBits!0 (BitStream!750 (_ BitVec 64) Bool) tuple2!1848)

(assert (=> b!15407 (= lt!23346 (appendNBits!0 thiss!1073 nBits!313 true))))

(declare-fun b!15408 () Bool)

(declare-fun res!14339 () Bool)

(assert (=> b!15408 (=> (not res!14339) (not e!9640))))

(assert (=> b!15408 (= res!14339 (validate_offset_bits!1 ((_ sign_extend 32) (size!395 (buf!752 thiss!1073))) ((_ sign_extend 32) (currentByte!1915 thiss!1073)) ((_ sign_extend 32) (currentBit!1910 thiss!1073)) nBits!313))))

(declare-fun b!15409 () Bool)

(declare-fun res!14338 () Bool)

(assert (=> b!15409 (=> (not res!14338) (not e!9641))))

(assert (=> b!15409 (= res!14338 (= (bitIndex!0 (size!395 (buf!752 (_2!985 lt!23346))) (currentByte!1915 (_2!985 lt!23346)) (currentBit!1910 (_2!985 lt!23346))) (bvadd (bitIndex!0 (size!395 (buf!752 thiss!1073)) (currentByte!1915 thiss!1073) (currentBit!1910 thiss!1073)) nBits!313)))))

(declare-fun b!15410 () Bool)

(declare-fun res!14341 () Bool)

(assert (=> b!15410 (=> (not res!14341) (not e!9641))))

(assert (=> b!15410 (= res!14341 (isPrefixOf!0 thiss!1073 (_2!985 lt!23346)))))

(assert (= (and start!3522 res!14340) b!15408))

(assert (= (and b!15408 res!14339) b!15407))

(assert (= (and b!15407 res!14342) b!15409))

(assert (= (and b!15409 res!14338) b!15410))

(assert (= (and b!15410 res!14341) b!15405))

(assert (= start!3522 b!15406))

(declare-fun m!22041 () Bool)

(assert (=> b!15405 m!22041))

(declare-fun m!22043 () Bool)

(assert (=> b!15405 m!22043))

(declare-fun m!22045 () Bool)

(assert (=> b!15405 m!22045))

(declare-fun m!22047 () Bool)

(assert (=> b!15405 m!22047))

(declare-fun m!22049 () Bool)

(assert (=> b!15406 m!22049))

(declare-fun m!22051 () Bool)

(assert (=> b!15409 m!22051))

(declare-fun m!22053 () Bool)

(assert (=> b!15409 m!22053))

(declare-fun m!22055 () Bool)

(assert (=> b!15410 m!22055))

(assert (=> b!15407 m!22047))

(assert (=> b!15407 m!22053))

(assert (=> b!15407 m!22045))

(assert (=> b!15407 m!22043))

(assert (=> b!15407 m!22051))

(assert (=> b!15407 m!22055))

(declare-fun m!22057 () Bool)

(assert (=> b!15407 m!22057))

(declare-fun m!22059 () Bool)

(assert (=> b!15407 m!22059))

(declare-fun m!22061 () Bool)

(assert (=> b!15408 m!22061))

(declare-fun m!22063 () Bool)

(assert (=> start!3522 m!22063))

(check-sat (not b!15407) (not b!15405) (not b!15408) (not b!15406) (not start!3522) (not b!15409) (not b!15410))
(check-sat)
(get-model)

(declare-fun d!5020 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!5020 (= (inv!12 thiss!1073) (invariant!0 (currentBit!1910 thiss!1073) (currentByte!1915 thiss!1073) (size!395 (buf!752 thiss!1073))))))

(declare-fun bs!1400 () Bool)

(assert (= bs!1400 d!5020))

(declare-fun m!22099 () Bool)

(assert (=> bs!1400 m!22099))

(assert (=> start!3522 d!5020))

(declare-fun d!5022 () Bool)

(assert (=> d!5022 (validate_offset_bits!1 ((_ sign_extend 32) (size!395 (buf!752 (_2!985 lt!23346)))) ((_ sign_extend 32) (currentByte!1915 thiss!1073)) ((_ sign_extend 32) (currentBit!1910 thiss!1073)) nBits!313)))

(declare-fun lt!23387 () Unit!1278)

(declare-fun choose!9 (BitStream!750 array!929 (_ BitVec 64) BitStream!750) Unit!1278)

(assert (=> d!5022 (= lt!23387 (choose!9 thiss!1073 (buf!752 (_2!985 lt!23346)) nBits!313 (BitStream!751 (buf!752 (_2!985 lt!23346)) (currentByte!1915 thiss!1073) (currentBit!1910 thiss!1073))))))

(assert (=> d!5022 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!752 (_2!985 lt!23346)) nBits!313) lt!23387)))

(declare-fun bs!1401 () Bool)

(assert (= bs!1401 d!5022))

(assert (=> bs!1401 m!22043))

(declare-fun m!22101 () Bool)

(assert (=> bs!1401 m!22101))

(assert (=> b!15407 d!5022))

(declare-fun d!5024 () Bool)

(declare-fun e!9667 () Bool)

(assert (=> d!5024 e!9667))

(declare-fun res!14379 () Bool)

(assert (=> d!5024 (=> (not res!14379) (not e!9667))))

(declare-fun lt!23420 () (_ BitVec 64))

(declare-fun lt!23421 () (_ BitVec 64))

(declare-fun lt!23417 () (_ BitVec 64))

(assert (=> d!5024 (= res!14379 (= lt!23417 (bvsub lt!23421 lt!23420)))))

(assert (=> d!5024 (or (= (bvand lt!23421 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!23420 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!23421 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!23421 lt!23420) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!5024 (= lt!23420 (remainingBits!0 ((_ sign_extend 32) (size!395 (buf!752 (_2!985 lt!23346)))) ((_ sign_extend 32) (currentByte!1915 (_2!985 lt!23346))) ((_ sign_extend 32) (currentBit!1910 (_2!985 lt!23346)))))))

(declare-fun lt!23418 () (_ BitVec 64))

(declare-fun lt!23419 () (_ BitVec 64))

(assert (=> d!5024 (= lt!23421 (bvmul lt!23418 lt!23419))))

(assert (=> d!5024 (or (= lt!23418 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!23419 (bvsdiv (bvmul lt!23418 lt!23419) lt!23418)))))

(assert (=> d!5024 (= lt!23419 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!5024 (= lt!23418 ((_ sign_extend 32) (size!395 (buf!752 (_2!985 lt!23346)))))))

(assert (=> d!5024 (= lt!23417 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1915 (_2!985 lt!23346))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1910 (_2!985 lt!23346)))))))

(assert (=> d!5024 (invariant!0 (currentBit!1910 (_2!985 lt!23346)) (currentByte!1915 (_2!985 lt!23346)) (size!395 (buf!752 (_2!985 lt!23346))))))

(assert (=> d!5024 (= (bitIndex!0 (size!395 (buf!752 (_2!985 lt!23346))) (currentByte!1915 (_2!985 lt!23346)) (currentBit!1910 (_2!985 lt!23346))) lt!23417)))

(declare-fun b!15450 () Bool)

(declare-fun res!14380 () Bool)

(assert (=> b!15450 (=> (not res!14380) (not e!9667))))

(assert (=> b!15450 (= res!14380 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!23417))))

(declare-fun b!15451 () Bool)

(declare-fun lt!23422 () (_ BitVec 64))

(assert (=> b!15451 (= e!9667 (bvsle lt!23417 (bvmul lt!23422 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!15451 (or (= lt!23422 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!23422 #b0000000000000000000000000000000000000000000000000000000000001000) lt!23422)))))

(assert (=> b!15451 (= lt!23422 ((_ sign_extend 32) (size!395 (buf!752 (_2!985 lt!23346)))))))

(assert (= (and d!5024 res!14379) b!15450))

(assert (= (and b!15450 res!14380) b!15451))

(declare-fun m!22115 () Bool)

(assert (=> d!5024 m!22115))

(declare-fun m!22117 () Bool)

(assert (=> d!5024 m!22117))

(assert (=> b!15407 d!5024))

(declare-fun d!5038 () Bool)

(declare-fun res!14394 () Bool)

(declare-fun e!9677 () Bool)

(assert (=> d!5038 (=> (not res!14394) (not e!9677))))

(assert (=> d!5038 (= res!14394 (= (size!395 (buf!752 thiss!1073)) (size!395 (buf!752 (_2!985 lt!23346)))))))

(assert (=> d!5038 (= (isPrefixOf!0 thiss!1073 (_2!985 lt!23346)) e!9677)))

(declare-fun b!15468 () Bool)

(declare-fun res!14393 () Bool)

(assert (=> b!15468 (=> (not res!14393) (not e!9677))))

(assert (=> b!15468 (= res!14393 (bvsle (bitIndex!0 (size!395 (buf!752 thiss!1073)) (currentByte!1915 thiss!1073) (currentBit!1910 thiss!1073)) (bitIndex!0 (size!395 (buf!752 (_2!985 lt!23346))) (currentByte!1915 (_2!985 lt!23346)) (currentBit!1910 (_2!985 lt!23346)))))))

(declare-fun b!15469 () Bool)

(declare-fun e!9676 () Bool)

(assert (=> b!15469 (= e!9677 e!9676)))

(declare-fun res!14395 () Bool)

(assert (=> b!15469 (=> res!14395 e!9676)))

(assert (=> b!15469 (= res!14395 (= (size!395 (buf!752 thiss!1073)) #b00000000000000000000000000000000))))

(declare-fun b!15470 () Bool)

(declare-fun arrayBitRangesEq!0 (array!929 array!929 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!15470 (= e!9676 (arrayBitRangesEq!0 (buf!752 thiss!1073) (buf!752 (_2!985 lt!23346)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!395 (buf!752 thiss!1073)) (currentByte!1915 thiss!1073) (currentBit!1910 thiss!1073))))))

(assert (= (and d!5038 res!14394) b!15468))

(assert (= (and b!15468 res!14393) b!15469))

(assert (= (and b!15469 (not res!14395)) b!15470))

(assert (=> b!15468 m!22053))

(assert (=> b!15468 m!22051))

(assert (=> b!15470 m!22053))

(assert (=> b!15470 m!22053))

(declare-fun m!22119 () Bool)

(assert (=> b!15470 m!22119))

(assert (=> b!15407 d!5038))

(declare-fun d!5040 () Bool)

(declare-fun e!9678 () Bool)

(assert (=> d!5040 e!9678))

(declare-fun res!14396 () Bool)

(assert (=> d!5040 (=> (not res!14396) (not e!9678))))

(declare-fun lt!23467 () (_ BitVec 64))

(declare-fun lt!23466 () (_ BitVec 64))

(declare-fun lt!23463 () (_ BitVec 64))

(assert (=> d!5040 (= res!14396 (= lt!23463 (bvsub lt!23467 lt!23466)))))

(assert (=> d!5040 (or (= (bvand lt!23467 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!23466 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!23467 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!23467 lt!23466) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!5040 (= lt!23466 (remainingBits!0 ((_ sign_extend 32) (size!395 (buf!752 thiss!1073))) ((_ sign_extend 32) (currentByte!1915 thiss!1073)) ((_ sign_extend 32) (currentBit!1910 thiss!1073))))))

(declare-fun lt!23464 () (_ BitVec 64))

(declare-fun lt!23465 () (_ BitVec 64))

(assert (=> d!5040 (= lt!23467 (bvmul lt!23464 lt!23465))))

(assert (=> d!5040 (or (= lt!23464 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!23465 (bvsdiv (bvmul lt!23464 lt!23465) lt!23464)))))

(assert (=> d!5040 (= lt!23465 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!5040 (= lt!23464 ((_ sign_extend 32) (size!395 (buf!752 thiss!1073))))))

(assert (=> d!5040 (= lt!23463 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1915 thiss!1073)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1910 thiss!1073))))))

(assert (=> d!5040 (invariant!0 (currentBit!1910 thiss!1073) (currentByte!1915 thiss!1073) (size!395 (buf!752 thiss!1073)))))

(assert (=> d!5040 (= (bitIndex!0 (size!395 (buf!752 thiss!1073)) (currentByte!1915 thiss!1073) (currentBit!1910 thiss!1073)) lt!23463)))

(declare-fun b!15471 () Bool)

(declare-fun res!14397 () Bool)

(assert (=> b!15471 (=> (not res!14397) (not e!9678))))

(assert (=> b!15471 (= res!14397 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!23463))))

(declare-fun b!15472 () Bool)

(declare-fun lt!23468 () (_ BitVec 64))

(assert (=> b!15472 (= e!9678 (bvsle lt!23463 (bvmul lt!23468 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!15472 (or (= lt!23468 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!23468 #b0000000000000000000000000000000000000000000000000000000000001000) lt!23468)))))

(assert (=> b!15472 (= lt!23468 ((_ sign_extend 32) (size!395 (buf!752 thiss!1073))))))

(assert (= (and d!5040 res!14396) b!15471))

(assert (= (and b!15471 res!14397) b!15472))

(declare-fun m!22121 () Bool)

(assert (=> d!5040 m!22121))

(assert (=> d!5040 m!22099))

(assert (=> b!15407 d!5040))

(declare-fun d!5042 () Bool)

(assert (=> d!5042 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!395 (buf!752 (_2!985 lt!23346)))) ((_ sign_extend 32) (currentByte!1915 thiss!1073)) ((_ sign_extend 32) (currentBit!1910 thiss!1073)) nBits!313) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!395 (buf!752 (_2!985 lt!23346)))) ((_ sign_extend 32) (currentByte!1915 thiss!1073)) ((_ sign_extend 32) (currentBit!1910 thiss!1073))) nBits!313))))

(declare-fun bs!1405 () Bool)

(assert (= bs!1405 d!5042))

(declare-fun m!22123 () Bool)

(assert (=> bs!1405 m!22123))

(assert (=> b!15407 d!5042))

(declare-fun d!5044 () Bool)

(declare-fun e!9702 () Bool)

(assert (=> d!5044 e!9702))

(declare-fun res!14437 () Bool)

(assert (=> d!5044 (=> (not res!14437) (not e!9702))))

(declare-fun lt!23587 () tuple2!1846)

(assert (=> d!5044 (= res!14437 (isPrefixOf!0 (_1!984 lt!23587) (_2!984 lt!23587)))))

(declare-fun lt!23584 () BitStream!750)

(assert (=> d!5044 (= lt!23587 (tuple2!1847 lt!23584 (_2!985 lt!23346)))))

(declare-fun lt!23589 () Unit!1278)

(declare-fun lt!23585 () Unit!1278)

(assert (=> d!5044 (= lt!23589 lt!23585)))

(assert (=> d!5044 (isPrefixOf!0 lt!23584 (_2!985 lt!23346))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!750 BitStream!750 BitStream!750) Unit!1278)

(assert (=> d!5044 (= lt!23585 (lemmaIsPrefixTransitive!0 lt!23584 (_2!985 lt!23346) (_2!985 lt!23346)))))

(declare-fun lt!23572 () Unit!1278)

(declare-fun lt!23579 () Unit!1278)

(assert (=> d!5044 (= lt!23572 lt!23579)))

(assert (=> d!5044 (isPrefixOf!0 lt!23584 (_2!985 lt!23346))))

(assert (=> d!5044 (= lt!23579 (lemmaIsPrefixTransitive!0 lt!23584 thiss!1073 (_2!985 lt!23346)))))

(declare-fun lt!23575 () Unit!1278)

(declare-fun e!9701 () Unit!1278)

(assert (=> d!5044 (= lt!23575 e!9701)))

(declare-fun c!1045 () Bool)

(assert (=> d!5044 (= c!1045 (not (= (size!395 (buf!752 thiss!1073)) #b00000000000000000000000000000000)))))

(declare-fun lt!23586 () Unit!1278)

(declare-fun lt!23581 () Unit!1278)

(assert (=> d!5044 (= lt!23586 lt!23581)))

(assert (=> d!5044 (isPrefixOf!0 (_2!985 lt!23346) (_2!985 lt!23346))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!750) Unit!1278)

(assert (=> d!5044 (= lt!23581 (lemmaIsPrefixRefl!0 (_2!985 lt!23346)))))

(declare-fun lt!23577 () Unit!1278)

(declare-fun lt!23576 () Unit!1278)

(assert (=> d!5044 (= lt!23577 lt!23576)))

(assert (=> d!5044 (= lt!23576 (lemmaIsPrefixRefl!0 (_2!985 lt!23346)))))

(declare-fun lt!23588 () Unit!1278)

(declare-fun lt!23573 () Unit!1278)

(assert (=> d!5044 (= lt!23588 lt!23573)))

(assert (=> d!5044 (isPrefixOf!0 lt!23584 lt!23584)))

(assert (=> d!5044 (= lt!23573 (lemmaIsPrefixRefl!0 lt!23584))))

(declare-fun lt!23580 () Unit!1278)

(declare-fun lt!23590 () Unit!1278)

(assert (=> d!5044 (= lt!23580 lt!23590)))

(assert (=> d!5044 (isPrefixOf!0 thiss!1073 thiss!1073)))

(assert (=> d!5044 (= lt!23590 (lemmaIsPrefixRefl!0 thiss!1073))))

(assert (=> d!5044 (= lt!23584 (BitStream!751 (buf!752 (_2!985 lt!23346)) (currentByte!1915 thiss!1073) (currentBit!1910 thiss!1073)))))

(assert (=> d!5044 (isPrefixOf!0 thiss!1073 (_2!985 lt!23346))))

(assert (=> d!5044 (= (reader!0 thiss!1073 (_2!985 lt!23346)) lt!23587)))

(declare-fun b!15517 () Bool)

(declare-fun lt!23583 () Unit!1278)

(assert (=> b!15517 (= e!9701 lt!23583)))

(declare-fun lt!23582 () (_ BitVec 64))

(assert (=> b!15517 (= lt!23582 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!23571 () (_ BitVec 64))

(assert (=> b!15517 (= lt!23571 (bitIndex!0 (size!395 (buf!752 thiss!1073)) (currentByte!1915 thiss!1073) (currentBit!1910 thiss!1073)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!929 array!929 (_ BitVec 64) (_ BitVec 64)) Unit!1278)

(assert (=> b!15517 (= lt!23583 (arrayBitRangesEqSymmetric!0 (buf!752 thiss!1073) (buf!752 (_2!985 lt!23346)) lt!23582 lt!23571))))

(assert (=> b!15517 (arrayBitRangesEq!0 (buf!752 (_2!985 lt!23346)) (buf!752 thiss!1073) lt!23582 lt!23571)))

(declare-fun b!15518 () Bool)

(declare-fun Unit!1284 () Unit!1278)

(assert (=> b!15518 (= e!9701 Unit!1284)))

(declare-fun b!15519 () Bool)

(declare-fun lt!23574 () (_ BitVec 64))

(declare-fun lt!23578 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!750 (_ BitVec 64)) BitStream!750)

(assert (=> b!15519 (= e!9702 (= (_1!984 lt!23587) (withMovedBitIndex!0 (_2!984 lt!23587) (bvsub lt!23574 lt!23578))))))

(assert (=> b!15519 (or (= (bvand lt!23574 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!23578 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!23574 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!23574 lt!23578) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!15519 (= lt!23578 (bitIndex!0 (size!395 (buf!752 (_2!985 lt!23346))) (currentByte!1915 (_2!985 lt!23346)) (currentBit!1910 (_2!985 lt!23346))))))

(assert (=> b!15519 (= lt!23574 (bitIndex!0 (size!395 (buf!752 thiss!1073)) (currentByte!1915 thiss!1073) (currentBit!1910 thiss!1073)))))

(declare-fun b!15520 () Bool)

(declare-fun res!14436 () Bool)

(assert (=> b!15520 (=> (not res!14436) (not e!9702))))

(assert (=> b!15520 (= res!14436 (isPrefixOf!0 (_2!984 lt!23587) (_2!985 lt!23346)))))

(declare-fun b!15521 () Bool)

(declare-fun res!14438 () Bool)

(assert (=> b!15521 (=> (not res!14438) (not e!9702))))

(assert (=> b!15521 (= res!14438 (isPrefixOf!0 (_1!984 lt!23587) thiss!1073))))

(assert (= (and d!5044 c!1045) b!15517))

(assert (= (and d!5044 (not c!1045)) b!15518))

(assert (= (and d!5044 res!14437) b!15521))

(assert (= (and b!15521 res!14438) b!15520))

(assert (= (and b!15520 res!14436) b!15519))

(declare-fun m!22177 () Bool)

(assert (=> b!15519 m!22177))

(assert (=> b!15519 m!22051))

(assert (=> b!15519 m!22053))

(declare-fun m!22179 () Bool)

(assert (=> b!15520 m!22179))

(declare-fun m!22181 () Bool)

(assert (=> d!5044 m!22181))

(declare-fun m!22183 () Bool)

(assert (=> d!5044 m!22183))

(declare-fun m!22185 () Bool)

(assert (=> d!5044 m!22185))

(declare-fun m!22187 () Bool)

(assert (=> d!5044 m!22187))

(assert (=> d!5044 m!22055))

(declare-fun m!22189 () Bool)

(assert (=> d!5044 m!22189))

(declare-fun m!22191 () Bool)

(assert (=> d!5044 m!22191))

(declare-fun m!22193 () Bool)

(assert (=> d!5044 m!22193))

(declare-fun m!22195 () Bool)

(assert (=> d!5044 m!22195))

(declare-fun m!22197 () Bool)

(assert (=> d!5044 m!22197))

(declare-fun m!22199 () Bool)

(assert (=> d!5044 m!22199))

(declare-fun m!22201 () Bool)

(assert (=> b!15521 m!22201))

(assert (=> b!15517 m!22053))

(declare-fun m!22203 () Bool)

(assert (=> b!15517 m!22203))

(declare-fun m!22205 () Bool)

(assert (=> b!15517 m!22205))

(assert (=> b!15407 d!5044))

(declare-fun d!5058 () Bool)

(assert (=> d!5058 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!395 (buf!752 (_1!984 lt!23340)))) ((_ sign_extend 32) (currentByte!1915 (_1!984 lt!23340))) ((_ sign_extend 32) (currentBit!1910 (_1!984 lt!23340))) nBits!313) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!395 (buf!752 (_1!984 lt!23340)))) ((_ sign_extend 32) (currentByte!1915 (_1!984 lt!23340))) ((_ sign_extend 32) (currentBit!1910 (_1!984 lt!23340)))) nBits!313))))

(declare-fun bs!1407 () Bool)

(assert (= bs!1407 d!5058))

(declare-fun m!22207 () Bool)

(assert (=> bs!1407 m!22207))

(assert (=> b!15407 d!5058))

(declare-fun b!15558 () Bool)

(declare-fun res!14470 () Bool)

(declare-fun e!9719 () Bool)

(assert (=> b!15558 (=> (not res!14470) (not e!9719))))

(declare-fun lt!23692 () tuple2!1848)

(assert (=> b!15558 (= res!14470 (isPrefixOf!0 thiss!1073 (_2!985 lt!23692)))))

(declare-fun b!15557 () Bool)

(declare-fun res!14468 () Bool)

(assert (=> b!15557 (=> (not res!14468) (not e!9719))))

(declare-fun lt!23695 () (_ BitVec 64))

(assert (=> b!15557 (= res!14468 (= (bitIndex!0 (size!395 (buf!752 (_2!985 lt!23692))) (currentByte!1915 (_2!985 lt!23692)) (currentBit!1910 (_2!985 lt!23692))) (bvadd lt!23695 nBits!313)))))

(assert (=> b!15557 (or (not (= (bvand lt!23695 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!313 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!23695 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!23695 nBits!313) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!15557 (= lt!23695 (bitIndex!0 (size!395 (buf!752 thiss!1073)) (currentByte!1915 thiss!1073) (currentBit!1910 thiss!1073)))))

(declare-fun d!5060 () Bool)

(assert (=> d!5060 e!9719))

(declare-fun res!14471 () Bool)

(assert (=> d!5060 (=> (not res!14471) (not e!9719))))

(assert (=> d!5060 (= res!14471 (= (size!395 (buf!752 thiss!1073)) (size!395 (buf!752 (_2!985 lt!23692)))))))

(declare-fun choose!36 (BitStream!750 (_ BitVec 64) Bool) tuple2!1848)

(assert (=> d!5060 (= lt!23692 (choose!36 thiss!1073 nBits!313 true))))

(assert (=> d!5060 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!5060 (= (appendNBits!0 thiss!1073 nBits!313 true) lt!23692)))

(declare-fun b!15559 () Bool)

(declare-fun lt!23694 () tuple2!1844)

(declare-fun lt!23693 () tuple2!1846)

(assert (=> b!15559 (= e!9719 (and (_2!983 lt!23694) (= (_1!983 lt!23694) (_2!984 lt!23693))))))

(assert (=> b!15559 (= lt!23694 (checkBitsLoopPure!0 (_1!984 lt!23693) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!23690 () Unit!1278)

(declare-fun lt!23691 () Unit!1278)

(assert (=> b!15559 (= lt!23690 lt!23691)))

(assert (=> b!15559 (validate_offset_bits!1 ((_ sign_extend 32) (size!395 (buf!752 (_2!985 lt!23692)))) ((_ sign_extend 32) (currentByte!1915 thiss!1073)) ((_ sign_extend 32) (currentBit!1910 thiss!1073)) nBits!313)))

(assert (=> b!15559 (= lt!23691 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!752 (_2!985 lt!23692)) nBits!313))))

(declare-fun e!9720 () Bool)

(assert (=> b!15559 e!9720))

(declare-fun res!14469 () Bool)

(assert (=> b!15559 (=> (not res!14469) (not e!9720))))

(assert (=> b!15559 (= res!14469 (and (= (size!395 (buf!752 thiss!1073)) (size!395 (buf!752 (_2!985 lt!23692)))) (bvsge nBits!313 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!15559 (= lt!23693 (reader!0 thiss!1073 (_2!985 lt!23692)))))

(declare-fun b!15560 () Bool)

(assert (=> b!15560 (= e!9720 (validate_offset_bits!1 ((_ sign_extend 32) (size!395 (buf!752 thiss!1073))) ((_ sign_extend 32) (currentByte!1915 thiss!1073)) ((_ sign_extend 32) (currentBit!1910 thiss!1073)) nBits!313))))

(assert (= (and d!5060 res!14471) b!15557))

(assert (= (and b!15557 res!14468) b!15558))

(assert (= (and b!15558 res!14470) b!15559))

(assert (= (and b!15559 res!14469) b!15560))

(declare-fun m!22259 () Bool)

(assert (=> b!15559 m!22259))

(declare-fun m!22261 () Bool)

(assert (=> b!15559 m!22261))

(declare-fun m!22263 () Bool)

(assert (=> b!15559 m!22263))

(declare-fun m!22265 () Bool)

(assert (=> b!15559 m!22265))

(declare-fun m!22267 () Bool)

(assert (=> d!5060 m!22267))

(declare-fun m!22269 () Bool)

(assert (=> b!15558 m!22269))

(assert (=> b!15560 m!22061))

(declare-fun m!22271 () Bool)

(assert (=> b!15557 m!22271))

(assert (=> b!15557 m!22053))

(assert (=> b!15407 d!5060))

(declare-fun d!5072 () Bool)

(assert (=> d!5072 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!395 (buf!752 thiss!1073))) ((_ sign_extend 32) (currentByte!1915 thiss!1073)) ((_ sign_extend 32) (currentBit!1910 thiss!1073)) nBits!313) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!395 (buf!752 thiss!1073))) ((_ sign_extend 32) (currentByte!1915 thiss!1073)) ((_ sign_extend 32) (currentBit!1910 thiss!1073))) nBits!313))))

(declare-fun bs!1411 () Bool)

(assert (= bs!1411 d!5072))

(assert (=> bs!1411 m!22121))

(assert (=> b!15408 d!5072))

(assert (=> b!15409 d!5024))

(assert (=> b!15409 d!5040))

(assert (=> b!15410 d!5038))

(declare-fun d!5074 () Bool)

(declare-datatypes ((tuple2!1860 0))(
  ( (tuple2!1861 (_1!991 Bool) (_2!991 BitStream!750)) )
))
(declare-fun lt!23698 () tuple2!1860)

(declare-fun checkBitsLoop!0 (BitStream!750 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!1860)

(assert (=> d!5074 (= lt!23698 (checkBitsLoop!0 (_1!984 lt!23344) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!5074 (= (checkBitsLoopPure!0 (_1!984 lt!23344) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000) (tuple2!1845 (_2!991 lt!23698) (_1!991 lt!23698)))))

(declare-fun bs!1412 () Bool)

(assert (= bs!1412 d!5074))

(declare-fun m!22273 () Bool)

(assert (=> bs!1412 m!22273))

(assert (=> b!15405 d!5074))

(assert (=> b!15405 d!5042))

(assert (=> b!15405 d!5022))

(assert (=> b!15405 d!5044))

(declare-fun d!5076 () Bool)

(assert (=> d!5076 (= (array_inv!384 (buf!752 thiss!1073)) (bvsge (size!395 (buf!752 thiss!1073)) #b00000000000000000000000000000000))))

(assert (=> b!15406 d!5076))

(check-sat (not b!15519) (not b!15520) (not d!5042) (not b!15470) (not b!15517) (not d!5040) (not d!5024) (not d!5022) (not d!5020) (not d!5074) (not d!5058) (not d!5044) (not b!15559) (not d!5072) (not b!15557) (not b!15468) (not b!15558) (not b!15521) (not d!5060) (not b!15560))
(check-sat)
