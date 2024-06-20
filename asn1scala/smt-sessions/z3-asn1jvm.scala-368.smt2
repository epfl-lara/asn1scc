; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8490 () Bool)

(assert start!8490)

(declare-fun b!42442 () Bool)

(declare-fun res!36096 () Bool)

(declare-fun e!28336 () Bool)

(assert (=> b!42442 (=> (not res!36096) (not e!28336))))

(declare-datatypes ((array!2179 0))(
  ( (array!2180 (arr!1485 (Array (_ BitVec 32) (_ BitVec 8))) (size!986 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1716 0))(
  ( (BitStream!1717 (buf!1317 array!2179) (currentByte!2775 (_ BitVec 32)) (currentBit!2770 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1716)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!42442 (= res!36096 (validate_offset_bits!1 ((_ sign_extend 32) (size!986 (buf!1317 thiss!1379))) ((_ sign_extend 32) (currentByte!2775 thiss!1379)) ((_ sign_extend 32) (currentBit!2770 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!42443 () Bool)

(declare-fun e!28337 () Bool)

(assert (=> b!42443 (= e!28336 (not e!28337))))

(declare-fun res!36094 () Bool)

(assert (=> b!42443 (=> res!36094 e!28337)))

(assert (=> b!42443 (= res!36094 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1716 BitStream!1716) Bool)

(assert (=> b!42443 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3026 0))(
  ( (Unit!3027) )
))
(declare-fun lt!63793 () Unit!3026)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1716) Unit!3026)

(assert (=> b!42443 (= lt!63793 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!63791 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!42443 (= lt!63791 (bitIndex!0 (size!986 (buf!1317 thiss!1379)) (currentByte!2775 thiss!1379) (currentBit!2770 thiss!1379)))))

(declare-fun b!42445 () Bool)

(declare-fun e!28339 () Bool)

(declare-fun array_inv!911 (array!2179) Bool)

(assert (=> b!42445 (= e!28339 (array_inv!911 (buf!1317 thiss!1379)))))

(declare-fun b!42444 () Bool)

(declare-datatypes ((tuple2!4164 0))(
  ( (tuple2!4165 (_1!2175 Unit!3026) (_2!2175 BitStream!1716)) )
))
(declare-fun lt!63790 () tuple2!4164)

(assert (=> b!42444 (= e!28337 (isPrefixOf!0 thiss!1379 (_2!2175 lt!63790)))))

(assert (=> b!42444 (validate_offset_bits!1 ((_ sign_extend 32) (size!986 (buf!1317 (_2!2175 lt!63790)))) ((_ sign_extend 32) (currentByte!2775 (_2!2175 lt!63790))) ((_ sign_extend 32) (currentBit!2770 (_2!2175 lt!63790))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!63792 () Unit!3026)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1716 BitStream!1716 (_ BitVec 64) (_ BitVec 64)) Unit!3026)

(assert (=> b!42444 (= lt!63792 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2175 lt!63790) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!2179)

(declare-fun appendBitFromByte!0 (BitStream!1716 (_ BitVec 8) (_ BitVec 32)) tuple2!4164)

(assert (=> b!42444 (= lt!63790 (appendBitFromByte!0 thiss!1379 (select (arr!1485 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun res!36095 () Bool)

(assert (=> start!8490 (=> (not res!36095) (not e!28336))))

(assert (=> start!8490 (= res!36095 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!986 srcBuffer!2))))))))

(assert (=> start!8490 e!28336))

(assert (=> start!8490 true))

(assert (=> start!8490 (array_inv!911 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1716) Bool)

(assert (=> start!8490 (and (inv!12 thiss!1379) e!28339)))

(assert (= (and start!8490 res!36095) b!42442))

(assert (= (and b!42442 res!36096) b!42443))

(assert (= (and b!42443 (not res!36094)) b!42444))

(assert (= start!8490 b!42445))

(declare-fun m!64399 () Bool)

(assert (=> b!42442 m!64399))

(declare-fun m!64401 () Bool)

(assert (=> start!8490 m!64401))

(declare-fun m!64403 () Bool)

(assert (=> start!8490 m!64403))

(declare-fun m!64405 () Bool)

(assert (=> b!42444 m!64405))

(declare-fun m!64407 () Bool)

(assert (=> b!42444 m!64407))

(declare-fun m!64409 () Bool)

(assert (=> b!42444 m!64409))

(assert (=> b!42444 m!64405))

(declare-fun m!64411 () Bool)

(assert (=> b!42444 m!64411))

(declare-fun m!64413 () Bool)

(assert (=> b!42444 m!64413))

(declare-fun m!64415 () Bool)

(assert (=> b!42445 m!64415))

(declare-fun m!64417 () Bool)

(assert (=> b!42443 m!64417))

(declare-fun m!64419 () Bool)

(assert (=> b!42443 m!64419))

(declare-fun m!64421 () Bool)

(assert (=> b!42443 m!64421))

(check-sat (not start!8490) (not b!42445) (not b!42442) (not b!42443) (not b!42444))
(check-sat)
(get-model)

(declare-fun d!12270 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!12270 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!986 (buf!1317 thiss!1379))) ((_ sign_extend 32) (currentByte!2775 thiss!1379)) ((_ sign_extend 32) (currentBit!2770 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!986 (buf!1317 thiss!1379))) ((_ sign_extend 32) (currentByte!2775 thiss!1379)) ((_ sign_extend 32) (currentBit!2770 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3313 () Bool)

(assert (= bs!3313 d!12270))

(declare-fun m!64447 () Bool)

(assert (=> bs!3313 m!64447))

(assert (=> b!42442 d!12270))

(declare-fun d!12272 () Bool)

(assert (=> d!12272 (= (array_inv!911 (buf!1317 thiss!1379)) (bvsge (size!986 (buf!1317 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!42445 d!12272))

(declare-fun d!12274 () Bool)

(assert (=> d!12274 (= (array_inv!911 srcBuffer!2) (bvsge (size!986 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!8490 d!12274))

(declare-fun d!12276 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!12276 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2770 thiss!1379) (currentByte!2775 thiss!1379) (size!986 (buf!1317 thiss!1379))))))

(declare-fun bs!3314 () Bool)

(assert (= bs!3314 d!12276))

(declare-fun m!64449 () Bool)

(assert (=> bs!3314 m!64449))

(assert (=> start!8490 d!12276))

(declare-fun d!12278 () Bool)

(declare-fun res!36112 () Bool)

(declare-fun e!28359 () Bool)

(assert (=> d!12278 (=> (not res!36112) (not e!28359))))

(assert (=> d!12278 (= res!36112 (= (size!986 (buf!1317 thiss!1379)) (size!986 (buf!1317 thiss!1379))))))

(assert (=> d!12278 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!28359)))

(declare-fun b!42464 () Bool)

(declare-fun res!36113 () Bool)

(assert (=> b!42464 (=> (not res!36113) (not e!28359))))

(assert (=> b!42464 (= res!36113 (bvsle (bitIndex!0 (size!986 (buf!1317 thiss!1379)) (currentByte!2775 thiss!1379) (currentBit!2770 thiss!1379)) (bitIndex!0 (size!986 (buf!1317 thiss!1379)) (currentByte!2775 thiss!1379) (currentBit!2770 thiss!1379))))))

(declare-fun b!42465 () Bool)

(declare-fun e!28360 () Bool)

(assert (=> b!42465 (= e!28359 e!28360)))

(declare-fun res!36114 () Bool)

(assert (=> b!42465 (=> res!36114 e!28360)))

(assert (=> b!42465 (= res!36114 (= (size!986 (buf!1317 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!42466 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2179 array!2179 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!42466 (= e!28360 (arrayBitRangesEq!0 (buf!1317 thiss!1379) (buf!1317 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!986 (buf!1317 thiss!1379)) (currentByte!2775 thiss!1379) (currentBit!2770 thiss!1379))))))

(assert (= (and d!12278 res!36112) b!42464))

(assert (= (and b!42464 res!36113) b!42465))

(assert (= (and b!42465 (not res!36114)) b!42466))

(assert (=> b!42464 m!64421))

(assert (=> b!42464 m!64421))

(assert (=> b!42466 m!64421))

(assert (=> b!42466 m!64421))

(declare-fun m!64451 () Bool)

(assert (=> b!42466 m!64451))

(assert (=> b!42443 d!12278))

(declare-fun d!12280 () Bool)

(assert (=> d!12280 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!63808 () Unit!3026)

(declare-fun choose!11 (BitStream!1716) Unit!3026)

(assert (=> d!12280 (= lt!63808 (choose!11 thiss!1379))))

(assert (=> d!12280 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!63808)))

(declare-fun bs!3316 () Bool)

(assert (= bs!3316 d!12280))

(assert (=> bs!3316 m!64417))

(declare-fun m!64453 () Bool)

(assert (=> bs!3316 m!64453))

(assert (=> b!42443 d!12280))

(declare-fun d!12282 () Bool)

(declare-fun e!28363 () Bool)

(assert (=> d!12282 e!28363))

(declare-fun res!36119 () Bool)

(assert (=> d!12282 (=> (not res!36119) (not e!28363))))

(declare-fun lt!63823 () (_ BitVec 64))

(declare-fun lt!63825 () (_ BitVec 64))

(declare-fun lt!63822 () (_ BitVec 64))

(assert (=> d!12282 (= res!36119 (= lt!63823 (bvsub lt!63822 lt!63825)))))

(assert (=> d!12282 (or (= (bvand lt!63822 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!63825 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!63822 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!63822 lt!63825) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!12282 (= lt!63825 (remainingBits!0 ((_ sign_extend 32) (size!986 (buf!1317 thiss!1379))) ((_ sign_extend 32) (currentByte!2775 thiss!1379)) ((_ sign_extend 32) (currentBit!2770 thiss!1379))))))

(declare-fun lt!63821 () (_ BitVec 64))

(declare-fun lt!63826 () (_ BitVec 64))

(assert (=> d!12282 (= lt!63822 (bvmul lt!63821 lt!63826))))

(assert (=> d!12282 (or (= lt!63821 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!63826 (bvsdiv (bvmul lt!63821 lt!63826) lt!63821)))))

(assert (=> d!12282 (= lt!63826 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!12282 (= lt!63821 ((_ sign_extend 32) (size!986 (buf!1317 thiss!1379))))))

(assert (=> d!12282 (= lt!63823 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2775 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2770 thiss!1379))))))

(assert (=> d!12282 (invariant!0 (currentBit!2770 thiss!1379) (currentByte!2775 thiss!1379) (size!986 (buf!1317 thiss!1379)))))

(assert (=> d!12282 (= (bitIndex!0 (size!986 (buf!1317 thiss!1379)) (currentByte!2775 thiss!1379) (currentBit!2770 thiss!1379)) lt!63823)))

(declare-fun b!42471 () Bool)

(declare-fun res!36120 () Bool)

(assert (=> b!42471 (=> (not res!36120) (not e!28363))))

(assert (=> b!42471 (= res!36120 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!63823))))

(declare-fun b!42472 () Bool)

(declare-fun lt!63824 () (_ BitVec 64))

(assert (=> b!42472 (= e!28363 (bvsle lt!63823 (bvmul lt!63824 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!42472 (or (= lt!63824 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!63824 #b0000000000000000000000000000000000000000000000000000000000001000) lt!63824)))))

(assert (=> b!42472 (= lt!63824 ((_ sign_extend 32) (size!986 (buf!1317 thiss!1379))))))

(assert (= (and d!12282 res!36119) b!42471))

(assert (= (and b!42471 res!36120) b!42472))

(assert (=> d!12282 m!64447))

(assert (=> d!12282 m!64449))

(assert (=> b!42443 d!12282))

(declare-fun d!12294 () Bool)

(declare-fun res!36121 () Bool)

(declare-fun e!28364 () Bool)

(assert (=> d!12294 (=> (not res!36121) (not e!28364))))

(assert (=> d!12294 (= res!36121 (= (size!986 (buf!1317 thiss!1379)) (size!986 (buf!1317 (_2!2175 lt!63790)))))))

(assert (=> d!12294 (= (isPrefixOf!0 thiss!1379 (_2!2175 lt!63790)) e!28364)))

(declare-fun b!42473 () Bool)

(declare-fun res!36122 () Bool)

(assert (=> b!42473 (=> (not res!36122) (not e!28364))))

(assert (=> b!42473 (= res!36122 (bvsle (bitIndex!0 (size!986 (buf!1317 thiss!1379)) (currentByte!2775 thiss!1379) (currentBit!2770 thiss!1379)) (bitIndex!0 (size!986 (buf!1317 (_2!2175 lt!63790))) (currentByte!2775 (_2!2175 lt!63790)) (currentBit!2770 (_2!2175 lt!63790)))))))

(declare-fun b!42474 () Bool)

(declare-fun e!28365 () Bool)

(assert (=> b!42474 (= e!28364 e!28365)))

(declare-fun res!36123 () Bool)

(assert (=> b!42474 (=> res!36123 e!28365)))

(assert (=> b!42474 (= res!36123 (= (size!986 (buf!1317 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!42475 () Bool)

(assert (=> b!42475 (= e!28365 (arrayBitRangesEq!0 (buf!1317 thiss!1379) (buf!1317 (_2!2175 lt!63790)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!986 (buf!1317 thiss!1379)) (currentByte!2775 thiss!1379) (currentBit!2770 thiss!1379))))))

(assert (= (and d!12294 res!36121) b!42473))

(assert (= (and b!42473 res!36122) b!42474))

(assert (= (and b!42474 (not res!36123)) b!42475))

(assert (=> b!42473 m!64421))

(declare-fun m!64459 () Bool)

(assert (=> b!42473 m!64459))

(assert (=> b!42475 m!64421))

(assert (=> b!42475 m!64421))

(declare-fun m!64461 () Bool)

(assert (=> b!42475 m!64461))

(assert (=> b!42444 d!12294))

(declare-fun d!12296 () Bool)

(assert (=> d!12296 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!986 (buf!1317 (_2!2175 lt!63790)))) ((_ sign_extend 32) (currentByte!2775 (_2!2175 lt!63790))) ((_ sign_extend 32) (currentBit!2770 (_2!2175 lt!63790))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!986 (buf!1317 (_2!2175 lt!63790)))) ((_ sign_extend 32) (currentByte!2775 (_2!2175 lt!63790))) ((_ sign_extend 32) (currentBit!2770 (_2!2175 lt!63790)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!3319 () Bool)

(assert (= bs!3319 d!12296))

(declare-fun m!64463 () Bool)

(assert (=> bs!3319 m!64463))

(assert (=> b!42444 d!12296))

(declare-fun d!12298 () Bool)

(declare-fun e!28372 () Bool)

(assert (=> d!12298 e!28372))

(declare-fun res!36132 () Bool)

(assert (=> d!12298 (=> (not res!36132) (not e!28372))))

(assert (=> d!12298 (= res!36132 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!63829 () Unit!3026)

(declare-fun choose!27 (BitStream!1716 BitStream!1716 (_ BitVec 64) (_ BitVec 64)) Unit!3026)

(assert (=> d!12298 (= lt!63829 (choose!27 thiss!1379 (_2!2175 lt!63790) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!12298 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!12298 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2175 lt!63790) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!63829)))

(declare-fun b!42484 () Bool)

(assert (=> b!42484 (= e!28372 (validate_offset_bits!1 ((_ sign_extend 32) (size!986 (buf!1317 (_2!2175 lt!63790)))) ((_ sign_extend 32) (currentByte!2775 (_2!2175 lt!63790))) ((_ sign_extend 32) (currentBit!2770 (_2!2175 lt!63790))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!12298 res!36132) b!42484))

(declare-fun m!64465 () Bool)

(assert (=> d!12298 m!64465))

(assert (=> b!42484 m!64409))

(assert (=> b!42444 d!12298))

(declare-fun b!42529 () Bool)

(declare-fun res!36176 () Bool)

(declare-fun e!28402 () Bool)

(assert (=> b!42529 (=> (not res!36176) (not e!28402))))

(declare-fun lt!63890 () tuple2!4164)

(assert (=> b!42529 (= res!36176 (isPrefixOf!0 thiss!1379 (_2!2175 lt!63890)))))

(declare-fun d!12300 () Bool)

(assert (=> d!12300 e!28402))

(declare-fun res!36179 () Bool)

(assert (=> d!12300 (=> (not res!36179) (not e!28402))))

(assert (=> d!12300 (= res!36179 (= (size!986 (buf!1317 (_2!2175 lt!63890))) (size!986 (buf!1317 thiss!1379))))))

(declare-fun lt!63882 () (_ BitVec 8))

(declare-fun lt!63886 () array!2179)

(assert (=> d!12300 (= lt!63882 (select (arr!1485 lt!63886) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!12300 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!986 lt!63886)))))

(assert (=> d!12300 (= lt!63886 (array!2180 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!63885 () tuple2!4164)

(assert (=> d!12300 (= lt!63890 (tuple2!4165 (_1!2175 lt!63885) (_2!2175 lt!63885)))))

(declare-fun lt!63883 () tuple2!4164)

(assert (=> d!12300 (= lt!63885 lt!63883)))

(declare-fun e!28400 () Bool)

(assert (=> d!12300 e!28400))

(declare-fun res!36177 () Bool)

(assert (=> d!12300 (=> (not res!36177) (not e!28400))))

(assert (=> d!12300 (= res!36177 (= (size!986 (buf!1317 thiss!1379)) (size!986 (buf!1317 (_2!2175 lt!63883)))))))

(declare-fun lt!63891 () Bool)

(declare-fun appendBit!0 (BitStream!1716 Bool) tuple2!4164)

(assert (=> d!12300 (= lt!63883 (appendBit!0 thiss!1379 lt!63891))))

(assert (=> d!12300 (= lt!63891 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1485 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!12300 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!12300 (= (appendBitFromByte!0 thiss!1379 (select (arr!1485 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!63890)))

(declare-fun b!42530 () Bool)

(declare-fun e!28401 () Bool)

(assert (=> b!42530 (= e!28402 e!28401)))

(declare-fun res!36178 () Bool)

(assert (=> b!42530 (=> (not res!36178) (not e!28401))))

(declare-datatypes ((tuple2!4168 0))(
  ( (tuple2!4169 (_1!2177 BitStream!1716) (_2!2177 Bool)) )
))
(declare-fun lt!63887 () tuple2!4168)

(assert (=> b!42530 (= res!36178 (and (= (_2!2177 lt!63887) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1485 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!63882)) #b00000000000000000000000000000000))) (= (_1!2177 lt!63887) (_2!2175 lt!63890))))))

(declare-datatypes ((tuple2!4170 0))(
  ( (tuple2!4171 (_1!2178 array!2179) (_2!2178 BitStream!1716)) )
))
(declare-fun lt!63892 () tuple2!4170)

(declare-fun lt!63888 () BitStream!1716)

(declare-fun readBits!0 (BitStream!1716 (_ BitVec 64)) tuple2!4170)

(assert (=> b!42530 (= lt!63892 (readBits!0 lt!63888 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!1716) tuple2!4168)

(assert (=> b!42530 (= lt!63887 (readBitPure!0 lt!63888))))

(declare-fun readerFrom!0 (BitStream!1716 (_ BitVec 32) (_ BitVec 32)) BitStream!1716)

(assert (=> b!42530 (= lt!63888 (readerFrom!0 (_2!2175 lt!63890) (currentBit!2770 thiss!1379) (currentByte!2775 thiss!1379)))))

(declare-fun b!42531 () Bool)

(declare-fun res!36182 () Bool)

(assert (=> b!42531 (=> (not res!36182) (not e!28400))))

(assert (=> b!42531 (= res!36182 (isPrefixOf!0 thiss!1379 (_2!2175 lt!63883)))))

(declare-fun b!42532 () Bool)

(declare-fun res!36181 () Bool)

(assert (=> b!42532 (=> (not res!36181) (not e!28400))))

(assert (=> b!42532 (= res!36181 (= (bitIndex!0 (size!986 (buf!1317 (_2!2175 lt!63883))) (currentByte!2775 (_2!2175 lt!63883)) (currentBit!2770 (_2!2175 lt!63883))) (bvadd (bitIndex!0 (size!986 (buf!1317 thiss!1379)) (currentByte!2775 thiss!1379) (currentBit!2770 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!42533 () Bool)

(declare-fun e!28403 () Bool)

(declare-fun lt!63889 () tuple2!4168)

(assert (=> b!42533 (= e!28403 (= (bitIndex!0 (size!986 (buf!1317 (_1!2177 lt!63889))) (currentByte!2775 (_1!2177 lt!63889)) (currentBit!2770 (_1!2177 lt!63889))) (bitIndex!0 (size!986 (buf!1317 (_2!2175 lt!63883))) (currentByte!2775 (_2!2175 lt!63883)) (currentBit!2770 (_2!2175 lt!63883)))))))

(declare-fun b!42534 () Bool)

(assert (=> b!42534 (= e!28400 e!28403)))

(declare-fun res!36180 () Bool)

(assert (=> b!42534 (=> (not res!36180) (not e!28403))))

(assert (=> b!42534 (= res!36180 (and (= (_2!2177 lt!63889) lt!63891) (= (_1!2177 lt!63889) (_2!2175 lt!63883))))))

(assert (=> b!42534 (= lt!63889 (readBitPure!0 (readerFrom!0 (_2!2175 lt!63883) (currentBit!2770 thiss!1379) (currentByte!2775 thiss!1379))))))

(declare-fun b!42535 () Bool)

(assert (=> b!42535 (= e!28401 (= (bitIndex!0 (size!986 (buf!1317 (_1!2177 lt!63887))) (currentByte!2775 (_1!2177 lt!63887)) (currentBit!2770 (_1!2177 lt!63887))) (bitIndex!0 (size!986 (buf!1317 (_2!2175 lt!63890))) (currentByte!2775 (_2!2175 lt!63890)) (currentBit!2770 (_2!2175 lt!63890)))))))

(declare-fun b!42536 () Bool)

(declare-fun res!36183 () Bool)

(assert (=> b!42536 (=> (not res!36183) (not e!28402))))

(declare-fun lt!63884 () (_ BitVec 64))

(declare-fun lt!63881 () (_ BitVec 64))

(assert (=> b!42536 (= res!36183 (= (bitIndex!0 (size!986 (buf!1317 (_2!2175 lt!63890))) (currentByte!2775 (_2!2175 lt!63890)) (currentBit!2770 (_2!2175 lt!63890))) (bvadd lt!63881 lt!63884)))))

(assert (=> b!42536 (or (not (= (bvand lt!63881 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!63884 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!63881 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!63881 lt!63884) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!42536 (= lt!63884 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!42536 (= lt!63881 (bitIndex!0 (size!986 (buf!1317 thiss!1379)) (currentByte!2775 thiss!1379) (currentBit!2770 thiss!1379)))))

(assert (= (and d!12300 res!36177) b!42532))

(assert (= (and b!42532 res!36181) b!42531))

(assert (= (and b!42531 res!36182) b!42534))

(assert (= (and b!42534 res!36180) b!42533))

(assert (= (and d!12300 res!36179) b!42536))

(assert (= (and b!42536 res!36183) b!42529))

(assert (= (and b!42529 res!36176) b!42530))

(assert (= (and b!42530 res!36178) b!42535))

(declare-fun m!64491 () Bool)

(assert (=> d!12300 m!64491))

(declare-fun m!64493 () Bool)

(assert (=> d!12300 m!64493))

(declare-fun m!64495 () Bool)

(assert (=> d!12300 m!64495))

(declare-fun m!64497 () Bool)

(assert (=> b!42534 m!64497))

(assert (=> b!42534 m!64497))

(declare-fun m!64499 () Bool)

(assert (=> b!42534 m!64499))

(declare-fun m!64501 () Bool)

(assert (=> b!42531 m!64501))

(declare-fun m!64503 () Bool)

(assert (=> b!42536 m!64503))

(assert (=> b!42536 m!64421))

(declare-fun m!64505 () Bool)

(assert (=> b!42533 m!64505))

(declare-fun m!64507 () Bool)

(assert (=> b!42533 m!64507))

(declare-fun m!64509 () Bool)

(assert (=> b!42529 m!64509))

(declare-fun m!64511 () Bool)

(assert (=> b!42530 m!64511))

(declare-fun m!64513 () Bool)

(assert (=> b!42530 m!64513))

(declare-fun m!64515 () Bool)

(assert (=> b!42530 m!64515))

(declare-fun m!64517 () Bool)

(assert (=> b!42535 m!64517))

(assert (=> b!42535 m!64503))

(assert (=> b!42532 m!64507))

(assert (=> b!42532 m!64421))

(assert (=> b!42444 d!12300))

(check-sat (not b!42464) (not b!42534) (not b!42535) (not b!42484) (not d!12298) (not b!42473) (not b!42536) (not d!12276) (not b!42533) (not b!42532) (not b!42530) (not d!12280) (not d!12296) (not d!12282) (not b!42529) (not b!42466) (not b!42475) (not d!12300) (not b!42531) (not d!12270))
