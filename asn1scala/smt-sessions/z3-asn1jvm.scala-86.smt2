; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1774 () Bool)

(assert start!1774)

(declare-fun b!8446 () Bool)

(declare-fun res!8987 () Bool)

(declare-fun e!5281 () Bool)

(assert (=> b!8446 (=> (not res!8987) (not e!5281))))

(declare-datatypes ((array!563 0))(
  ( (array!564 (arr!647 (Array (_ BitVec 32) (_ BitVec 8))) (size!242 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!462 0))(
  ( (BitStream!463 (buf!578 array!563) (currentByte!1608 (_ BitVec 32)) (currentBit!1603 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!462)

(declare-datatypes ((Unit!717 0))(
  ( (Unit!718) )
))
(declare-datatypes ((tuple2!1140 0))(
  ( (tuple2!1141 (_1!601 Unit!717) (_2!601 BitStream!462)) )
))
(declare-fun lt!12029 () tuple2!1140)

(assert (=> b!8446 (= res!8987 (= (size!242 (buf!578 thiss!1486)) (size!242 (buf!578 (_2!601 lt!12029)))))))

(declare-fun b!8447 () Bool)

(declare-fun isPrefixOf!0 (BitStream!462 BitStream!462) Bool)

(assert (=> b!8447 (= e!5281 (not (isPrefixOf!0 thiss!1486 (_2!601 lt!12029))))))

(declare-fun b!8448 () Bool)

(declare-fun res!8986 () Bool)

(assert (=> b!8448 (=> (not res!8986) (not e!5281))))

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!8448 (= res!8986 (= (bitIndex!0 (size!242 (buf!578 (_2!601 lt!12029))) (currentByte!1608 (_2!601 lt!12029)) (currentBit!1603 (_2!601 lt!12029))) (bvadd (bitIndex!0 (size!242 (buf!578 thiss!1486)) (currentByte!1608 thiss!1486) (currentBit!1603 thiss!1486)) nBits!460)))))

(declare-fun b!8449 () Bool)

(declare-fun res!8988 () Bool)

(declare-fun e!5284 () Bool)

(assert (=> b!8449 (=> (not res!8988) (not e!5284))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!8449 (= res!8988 (validate_offset_bits!1 ((_ sign_extend 32) (size!242 (buf!578 thiss!1486))) ((_ sign_extend 32) (currentByte!1608 thiss!1486)) ((_ sign_extend 32) (currentBit!1603 thiss!1486)) nBits!460))))

(declare-fun b!8451 () Bool)

(declare-fun e!5282 () Bool)

(declare-fun array_inv!237 (array!563) Bool)

(assert (=> b!8451 (= e!5282 (array_inv!237 (buf!578 thiss!1486)))))

(declare-fun res!8989 () Bool)

(assert (=> start!1774 (=> (not res!8989) (not e!5284))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!563)

(assert (=> start!1774 (= res!8989 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!242 srcBuffer!6))))))))

(assert (=> start!1774 e!5284))

(assert (=> start!1774 true))

(assert (=> start!1774 (array_inv!237 srcBuffer!6)))

(declare-fun inv!12 (BitStream!462) Bool)

(assert (=> start!1774 (and (inv!12 thiss!1486) e!5282)))

(declare-fun b!8450 () Bool)

(assert (=> b!8450 (= e!5284 e!5281)))

(declare-fun res!8985 () Bool)

(assert (=> b!8450 (=> (not res!8985) (not e!5281))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!8450 (= res!8985 (invariant!0 (currentBit!1603 (_2!601 lt!12029)) (currentByte!1608 (_2!601 lt!12029)) (size!242 (buf!578 (_2!601 lt!12029)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!462 array!563 (_ BitVec 64) (_ BitVec 64)) tuple2!1140)

(assert (=> b!8450 (= lt!12029 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(assert (= (and start!1774 res!8989) b!8449))

(assert (= (and b!8449 res!8988) b!8450))

(assert (= (and b!8450 res!8985) b!8446))

(assert (= (and b!8446 res!8987) b!8448))

(assert (= (and b!8448 res!8986) b!8447))

(assert (= start!1774 b!8451))

(declare-fun m!11445 () Bool)

(assert (=> b!8450 m!11445))

(declare-fun m!11447 () Bool)

(assert (=> b!8450 m!11447))

(declare-fun m!11449 () Bool)

(assert (=> start!1774 m!11449))

(declare-fun m!11451 () Bool)

(assert (=> start!1774 m!11451))

(declare-fun m!11453 () Bool)

(assert (=> b!8451 m!11453))

(declare-fun m!11455 () Bool)

(assert (=> b!8449 m!11455))

(declare-fun m!11457 () Bool)

(assert (=> b!8448 m!11457))

(declare-fun m!11459 () Bool)

(assert (=> b!8448 m!11459))

(declare-fun m!11461 () Bool)

(assert (=> b!8447 m!11461))

(check-sat (not b!8451) (not b!8447) (not b!8448) (not start!1774) (not b!8450) (not b!8449))
(check-sat)
(get-model)

(declare-fun d!2494 () Bool)

(assert (=> d!2494 (= (array_inv!237 (buf!578 thiss!1486)) (bvsge (size!242 (buf!578 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!8451 d!2494))

(declare-fun d!2496 () Bool)

(declare-fun res!9023 () Bool)

(declare-fun e!5311 () Bool)

(assert (=> d!2496 (=> (not res!9023) (not e!5311))))

(assert (=> d!2496 (= res!9023 (= (size!242 (buf!578 thiss!1486)) (size!242 (buf!578 (_2!601 lt!12029)))))))

(assert (=> d!2496 (= (isPrefixOf!0 thiss!1486 (_2!601 lt!12029)) e!5311)))

(declare-fun b!8486 () Bool)

(declare-fun res!9022 () Bool)

(assert (=> b!8486 (=> (not res!9022) (not e!5311))))

(assert (=> b!8486 (= res!9022 (bvsle (bitIndex!0 (size!242 (buf!578 thiss!1486)) (currentByte!1608 thiss!1486) (currentBit!1603 thiss!1486)) (bitIndex!0 (size!242 (buf!578 (_2!601 lt!12029))) (currentByte!1608 (_2!601 lt!12029)) (currentBit!1603 (_2!601 lt!12029)))))))

(declare-fun b!8487 () Bool)

(declare-fun e!5310 () Bool)

(assert (=> b!8487 (= e!5311 e!5310)))

(declare-fun res!9021 () Bool)

(assert (=> b!8487 (=> res!9021 e!5310)))

(assert (=> b!8487 (= res!9021 (= (size!242 (buf!578 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!8488 () Bool)

(declare-fun arrayBitRangesEq!0 (array!563 array!563 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!8488 (= e!5310 (arrayBitRangesEq!0 (buf!578 thiss!1486) (buf!578 (_2!601 lt!12029)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!242 (buf!578 thiss!1486)) (currentByte!1608 thiss!1486) (currentBit!1603 thiss!1486))))))

(assert (= (and d!2496 res!9023) b!8486))

(assert (= (and b!8486 res!9022) b!8487))

(assert (= (and b!8487 (not res!9021)) b!8488))

(assert (=> b!8486 m!11459))

(assert (=> b!8486 m!11457))

(assert (=> b!8488 m!11459))

(assert (=> b!8488 m!11459))

(declare-fun m!11487 () Bool)

(assert (=> b!8488 m!11487))

(assert (=> b!8447 d!2496))

(declare-fun d!2502 () Bool)

(declare-fun e!5329 () Bool)

(assert (=> d!2502 e!5329))

(declare-fun res!9052 () Bool)

(assert (=> d!2502 (=> (not res!9052) (not e!5329))))

(declare-fun lt!12098 () (_ BitVec 64))

(declare-fun lt!12097 () (_ BitVec 64))

(declare-fun lt!12093 () (_ BitVec 64))

(assert (=> d!2502 (= res!9052 (= lt!12098 (bvsub lt!12093 lt!12097)))))

(assert (=> d!2502 (or (= (bvand lt!12093 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!12097 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!12093 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!12093 lt!12097) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!2502 (= lt!12097 (remainingBits!0 ((_ sign_extend 32) (size!242 (buf!578 (_2!601 lt!12029)))) ((_ sign_extend 32) (currentByte!1608 (_2!601 lt!12029))) ((_ sign_extend 32) (currentBit!1603 (_2!601 lt!12029)))))))

(declare-fun lt!12095 () (_ BitVec 64))

(declare-fun lt!12096 () (_ BitVec 64))

(assert (=> d!2502 (= lt!12093 (bvmul lt!12095 lt!12096))))

(assert (=> d!2502 (or (= lt!12095 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!12096 (bvsdiv (bvmul lt!12095 lt!12096) lt!12095)))))

(assert (=> d!2502 (= lt!12096 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!2502 (= lt!12095 ((_ sign_extend 32) (size!242 (buf!578 (_2!601 lt!12029)))))))

(assert (=> d!2502 (= lt!12098 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1608 (_2!601 lt!12029))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1603 (_2!601 lt!12029)))))))

(assert (=> d!2502 (invariant!0 (currentBit!1603 (_2!601 lt!12029)) (currentByte!1608 (_2!601 lt!12029)) (size!242 (buf!578 (_2!601 lt!12029))))))

(assert (=> d!2502 (= (bitIndex!0 (size!242 (buf!578 (_2!601 lt!12029))) (currentByte!1608 (_2!601 lt!12029)) (currentBit!1603 (_2!601 lt!12029))) lt!12098)))

(declare-fun b!8517 () Bool)

(declare-fun res!9053 () Bool)

(assert (=> b!8517 (=> (not res!9053) (not e!5329))))

(assert (=> b!8517 (= res!9053 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!12098))))

(declare-fun b!8518 () Bool)

(declare-fun lt!12094 () (_ BitVec 64))

(assert (=> b!8518 (= e!5329 (bvsle lt!12098 (bvmul lt!12094 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!8518 (or (= lt!12094 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!12094 #b0000000000000000000000000000000000000000000000000000000000001000) lt!12094)))))

(assert (=> b!8518 (= lt!12094 ((_ sign_extend 32) (size!242 (buf!578 (_2!601 lt!12029)))))))

(assert (= (and d!2502 res!9052) b!8517))

(assert (= (and b!8517 res!9053) b!8518))

(declare-fun m!11499 () Bool)

(assert (=> d!2502 m!11499))

(assert (=> d!2502 m!11445))

(assert (=> b!8448 d!2502))

(declare-fun d!2526 () Bool)

(declare-fun e!5330 () Bool)

(assert (=> d!2526 e!5330))

(declare-fun res!9054 () Bool)

(assert (=> d!2526 (=> (not res!9054) (not e!5330))))

(declare-fun lt!12104 () (_ BitVec 64))

(declare-fun lt!12099 () (_ BitVec 64))

(declare-fun lt!12103 () (_ BitVec 64))

(assert (=> d!2526 (= res!9054 (= lt!12104 (bvsub lt!12099 lt!12103)))))

(assert (=> d!2526 (or (= (bvand lt!12099 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!12103 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!12099 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!12099 lt!12103) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2526 (= lt!12103 (remainingBits!0 ((_ sign_extend 32) (size!242 (buf!578 thiss!1486))) ((_ sign_extend 32) (currentByte!1608 thiss!1486)) ((_ sign_extend 32) (currentBit!1603 thiss!1486))))))

(declare-fun lt!12101 () (_ BitVec 64))

(declare-fun lt!12102 () (_ BitVec 64))

(assert (=> d!2526 (= lt!12099 (bvmul lt!12101 lt!12102))))

(assert (=> d!2526 (or (= lt!12101 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!12102 (bvsdiv (bvmul lt!12101 lt!12102) lt!12101)))))

(assert (=> d!2526 (= lt!12102 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!2526 (= lt!12101 ((_ sign_extend 32) (size!242 (buf!578 thiss!1486))))))

(assert (=> d!2526 (= lt!12104 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1608 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1603 thiss!1486))))))

(assert (=> d!2526 (invariant!0 (currentBit!1603 thiss!1486) (currentByte!1608 thiss!1486) (size!242 (buf!578 thiss!1486)))))

(assert (=> d!2526 (= (bitIndex!0 (size!242 (buf!578 thiss!1486)) (currentByte!1608 thiss!1486) (currentBit!1603 thiss!1486)) lt!12104)))

(declare-fun b!8519 () Bool)

(declare-fun res!9055 () Bool)

(assert (=> b!8519 (=> (not res!9055) (not e!5330))))

(assert (=> b!8519 (= res!9055 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!12104))))

(declare-fun b!8520 () Bool)

(declare-fun lt!12100 () (_ BitVec 64))

(assert (=> b!8520 (= e!5330 (bvsle lt!12104 (bvmul lt!12100 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!8520 (or (= lt!12100 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!12100 #b0000000000000000000000000000000000000000000000000000000000001000) lt!12100)))))

(assert (=> b!8520 (= lt!12100 ((_ sign_extend 32) (size!242 (buf!578 thiss!1486))))))

(assert (= (and d!2526 res!9054) b!8519))

(assert (= (and b!8519 res!9055) b!8520))

(declare-fun m!11501 () Bool)

(assert (=> d!2526 m!11501))

(declare-fun m!11503 () Bool)

(assert (=> d!2526 m!11503))

(assert (=> b!8448 d!2526))

(declare-fun d!2528 () Bool)

(assert (=> d!2528 (= (array_inv!237 srcBuffer!6) (bvsge (size!242 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!1774 d!2528))

(declare-fun d!2530 () Bool)

(assert (=> d!2530 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1603 thiss!1486) (currentByte!1608 thiss!1486) (size!242 (buf!578 thiss!1486))))))

(declare-fun bs!843 () Bool)

(assert (= bs!843 d!2530))

(assert (=> bs!843 m!11503))

(assert (=> start!1774 d!2530))

(declare-fun d!2532 () Bool)

(assert (=> d!2532 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!242 (buf!578 thiss!1486))) ((_ sign_extend 32) (currentByte!1608 thiss!1486)) ((_ sign_extend 32) (currentBit!1603 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!242 (buf!578 thiss!1486))) ((_ sign_extend 32) (currentByte!1608 thiss!1486)) ((_ sign_extend 32) (currentBit!1603 thiss!1486))) nBits!460))))

(declare-fun bs!844 () Bool)

(assert (= bs!844 d!2532))

(assert (=> bs!844 m!11501))

(assert (=> b!8449 d!2532))

(declare-fun d!2534 () Bool)

(assert (=> d!2534 (= (invariant!0 (currentBit!1603 (_2!601 lt!12029)) (currentByte!1608 (_2!601 lt!12029)) (size!242 (buf!578 (_2!601 lt!12029)))) (and (bvsge (currentBit!1603 (_2!601 lt!12029)) #b00000000000000000000000000000000) (bvslt (currentBit!1603 (_2!601 lt!12029)) #b00000000000000000000000000001000) (bvsge (currentByte!1608 (_2!601 lt!12029)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1608 (_2!601 lt!12029)) (size!242 (buf!578 (_2!601 lt!12029)))) (and (= (currentBit!1603 (_2!601 lt!12029)) #b00000000000000000000000000000000) (= (currentByte!1608 (_2!601 lt!12029)) (size!242 (buf!578 (_2!601 lt!12029))))))))))

(assert (=> b!8450 d!2534))

(declare-fun b!8585 () Bool)

(declare-fun e!5357 () tuple2!1140)

(declare-fun Unit!730 () Unit!717)

(assert (=> b!8585 (= e!5357 (tuple2!1141 Unit!730 thiss!1486))))

(assert (=> b!8585 (= (size!242 (buf!578 thiss!1486)) (size!242 (buf!578 thiss!1486)))))

(declare-fun lt!12479 () Unit!717)

(declare-fun Unit!731 () Unit!717)

(assert (=> b!8585 (= lt!12479 Unit!731)))

(declare-datatypes ((tuple2!1150 0))(
  ( (tuple2!1151 (_1!606 BitStream!462) (_2!606 BitStream!462)) )
))
(declare-fun call!128 () tuple2!1150)

(declare-fun checkByteArrayBitContent!0 (BitStream!462 array!563 array!563 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!1152 0))(
  ( (tuple2!1153 (_1!607 array!563) (_2!607 BitStream!462)) )
))
(declare-fun readBits!0 (BitStream!462 (_ BitVec 64)) tuple2!1152)

(assert (=> b!8585 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!607 (readBits!0 (_1!606 call!128) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun b!8586 () Bool)

(declare-fun e!5356 () Bool)

(declare-fun lt!12483 () (_ BitVec 64))

(assert (=> b!8586 (= e!5356 (validate_offset_bits!1 ((_ sign_extend 32) (size!242 (buf!578 thiss!1486))) ((_ sign_extend 32) (currentByte!1608 thiss!1486)) ((_ sign_extend 32) (currentBit!1603 thiss!1486)) lt!12483))))

(declare-fun b!8587 () Bool)

(declare-fun lt!12474 () tuple2!1140)

(declare-fun Unit!734 () Unit!717)

(assert (=> b!8587 (= e!5357 (tuple2!1141 Unit!734 (_2!601 lt!12474)))))

(declare-fun lt!12478 () tuple2!1140)

(declare-fun appendBitFromByte!0 (BitStream!462 (_ BitVec 8) (_ BitVec 32)) tuple2!1140)

(assert (=> b!8587 (= lt!12478 (appendBitFromByte!0 thiss!1486 (select (arr!647 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!12498 () (_ BitVec 64))

(assert (=> b!8587 (= lt!12498 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!12486 () (_ BitVec 64))

(assert (=> b!8587 (= lt!12486 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!12466 () Unit!717)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!462 BitStream!462 (_ BitVec 64) (_ BitVec 64)) Unit!717)

(assert (=> b!8587 (= lt!12466 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!601 lt!12478) lt!12498 lt!12486))))

(assert (=> b!8587 (validate_offset_bits!1 ((_ sign_extend 32) (size!242 (buf!578 (_2!601 lt!12478)))) ((_ sign_extend 32) (currentByte!1608 (_2!601 lt!12478))) ((_ sign_extend 32) (currentBit!1603 (_2!601 lt!12478))) (bvsub lt!12498 lt!12486))))

(declare-fun lt!12459 () Unit!717)

(assert (=> b!8587 (= lt!12459 lt!12466)))

(declare-fun lt!12477 () tuple2!1150)

(declare-fun reader!0 (BitStream!462 BitStream!462) tuple2!1150)

(assert (=> b!8587 (= lt!12477 (reader!0 thiss!1486 (_2!601 lt!12478)))))

(declare-fun lt!12473 () (_ BitVec 64))

(assert (=> b!8587 (= lt!12473 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!12465 () Unit!717)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!462 array!563 (_ BitVec 64)) Unit!717)

(assert (=> b!8587 (= lt!12465 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!578 (_2!601 lt!12478)) lt!12473))))

(assert (=> b!8587 (validate_offset_bits!1 ((_ sign_extend 32) (size!242 (buf!578 (_2!601 lt!12478)))) ((_ sign_extend 32) (currentByte!1608 thiss!1486)) ((_ sign_extend 32) (currentBit!1603 thiss!1486)) lt!12473)))

(declare-fun lt!12475 () Unit!717)

(assert (=> b!8587 (= lt!12475 lt!12465)))

(declare-datatypes ((List!140 0))(
  ( (Nil!137) (Cons!136 (h!255 Bool) (t!890 List!140)) )
))
(declare-fun head!46 (List!140) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!462 array!563 (_ BitVec 64) (_ BitVec 64)) List!140)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!462 BitStream!462 (_ BitVec 64)) List!140)

(assert (=> b!8587 (= (head!46 (byteArrayBitContentToList!0 (_2!601 lt!12478) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!46 (bitStreamReadBitsIntoList!0 (_2!601 lt!12478) (_1!606 lt!12477) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!12492 () Unit!717)

(declare-fun Unit!736 () Unit!717)

(assert (=> b!8587 (= lt!12492 Unit!736)))

(assert (=> b!8587 (= lt!12474 (appendBitsMSBFirstLoop!0 (_2!601 lt!12478) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!12460 () Unit!717)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!462 BitStream!462 BitStream!462) Unit!717)

(assert (=> b!8587 (= lt!12460 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!601 lt!12478) (_2!601 lt!12474)))))

(assert (=> b!8587 (isPrefixOf!0 thiss!1486 (_2!601 lt!12474))))

(declare-fun lt!12462 () Unit!717)

(assert (=> b!8587 (= lt!12462 lt!12460)))

(assert (=> b!8587 (= (size!242 (buf!578 (_2!601 lt!12474))) (size!242 (buf!578 thiss!1486)))))

(declare-fun lt!12497 () Unit!717)

(declare-fun Unit!737 () Unit!717)

(assert (=> b!8587 (= lt!12497 Unit!737)))

(assert (=> b!8587 (= (bitIndex!0 (size!242 (buf!578 (_2!601 lt!12474))) (currentByte!1608 (_2!601 lt!12474)) (currentBit!1603 (_2!601 lt!12474))) (bvsub (bvadd (bitIndex!0 (size!242 (buf!578 thiss!1486)) (currentByte!1608 thiss!1486) (currentBit!1603 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!12494 () Unit!717)

(declare-fun Unit!738 () Unit!717)

(assert (=> b!8587 (= lt!12494 Unit!738)))

(assert (=> b!8587 (= (bitIndex!0 (size!242 (buf!578 (_2!601 lt!12474))) (currentByte!1608 (_2!601 lt!12474)) (currentBit!1603 (_2!601 lt!12474))) (bvsub (bvsub (bvadd (bitIndex!0 (size!242 (buf!578 (_2!601 lt!12478))) (currentByte!1608 (_2!601 lt!12478)) (currentBit!1603 (_2!601 lt!12478))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!12470 () Unit!717)

(declare-fun Unit!739 () Unit!717)

(assert (=> b!8587 (= lt!12470 Unit!739)))

(declare-fun lt!12476 () tuple2!1150)

(assert (=> b!8587 (= lt!12476 call!128)))

(declare-fun lt!12461 () (_ BitVec 64))

(assert (=> b!8587 (= lt!12461 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!12490 () Unit!717)

(assert (=> b!8587 (= lt!12490 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!578 (_2!601 lt!12474)) lt!12461))))

(assert (=> b!8587 (validate_offset_bits!1 ((_ sign_extend 32) (size!242 (buf!578 (_2!601 lt!12474)))) ((_ sign_extend 32) (currentByte!1608 thiss!1486)) ((_ sign_extend 32) (currentBit!1603 thiss!1486)) lt!12461)))

(declare-fun lt!12488 () Unit!717)

(assert (=> b!8587 (= lt!12488 lt!12490)))

(declare-fun lt!12493 () tuple2!1150)

(assert (=> b!8587 (= lt!12493 (reader!0 (_2!601 lt!12478) (_2!601 lt!12474)))))

(declare-fun lt!12468 () (_ BitVec 64))

(assert (=> b!8587 (= lt!12468 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!12458 () Unit!717)

(assert (=> b!8587 (= lt!12458 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!601 lt!12478) (buf!578 (_2!601 lt!12474)) lt!12468))))

(assert (=> b!8587 (validate_offset_bits!1 ((_ sign_extend 32) (size!242 (buf!578 (_2!601 lt!12474)))) ((_ sign_extend 32) (currentByte!1608 (_2!601 lt!12478))) ((_ sign_extend 32) (currentBit!1603 (_2!601 lt!12478))) lt!12468)))

(declare-fun lt!12467 () Unit!717)

(assert (=> b!8587 (= lt!12467 lt!12458)))

(declare-fun lt!12495 () List!140)

(assert (=> b!8587 (= lt!12495 (byteArrayBitContentToList!0 (_2!601 lt!12474) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!12489 () List!140)

(assert (=> b!8587 (= lt!12489 (byteArrayBitContentToList!0 (_2!601 lt!12474) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!12464 () List!140)

(assert (=> b!8587 (= lt!12464 (bitStreamReadBitsIntoList!0 (_2!601 lt!12474) (_1!606 lt!12476) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!12496 () List!140)

(assert (=> b!8587 (= lt!12496 (bitStreamReadBitsIntoList!0 (_2!601 lt!12474) (_1!606 lt!12493) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!12480 () (_ BitVec 64))

(assert (=> b!8587 (= lt!12480 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!12485 () Unit!717)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!462 BitStream!462 BitStream!462 BitStream!462 (_ BitVec 64) List!140) Unit!717)

(assert (=> b!8587 (= lt!12485 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!601 lt!12474) (_2!601 lt!12474) (_1!606 lt!12476) (_1!606 lt!12493) lt!12480 lt!12464))))

(declare-fun tail!54 (List!140) List!140)

(assert (=> b!8587 (= (bitStreamReadBitsIntoList!0 (_2!601 lt!12474) (_1!606 lt!12493) (bvsub lt!12480 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!54 lt!12464))))

(declare-fun lt!12457 () Unit!717)

(assert (=> b!8587 (= lt!12457 lt!12485)))

(declare-fun lt!12481 () Unit!717)

(declare-fun lt!12499 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!563 array!563 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!717)

(assert (=> b!8587 (= lt!12481 (arrayBitRangesEqImpliesEq!0 (buf!578 (_2!601 lt!12478)) (buf!578 (_2!601 lt!12474)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!12499 (bitIndex!0 (size!242 (buf!578 (_2!601 lt!12478))) (currentByte!1608 (_2!601 lt!12478)) (currentBit!1603 (_2!601 lt!12478)))))))

(declare-fun bitAt!0 (array!563 (_ BitVec 64)) Bool)

(assert (=> b!8587 (= (bitAt!0 (buf!578 (_2!601 lt!12478)) lt!12499) (bitAt!0 (buf!578 (_2!601 lt!12474)) lt!12499))))

(declare-fun lt!12484 () Unit!717)

(assert (=> b!8587 (= lt!12484 lt!12481)))

(declare-fun b!8588 () Bool)

(declare-fun res!9109 () Bool)

(declare-fun e!5355 () Bool)

(assert (=> b!8588 (=> (not res!9109) (not e!5355))))

(declare-fun lt!12469 () tuple2!1140)

(assert (=> b!8588 (= res!9109 (invariant!0 (currentBit!1603 (_2!601 lt!12469)) (currentByte!1608 (_2!601 lt!12469)) (size!242 (buf!578 (_2!601 lt!12469)))))))

(declare-fun b!8589 () Bool)

(declare-fun res!9108 () Bool)

(assert (=> b!8589 (=> (not res!9108) (not e!5355))))

(assert (=> b!8589 (= res!9108 (isPrefixOf!0 thiss!1486 (_2!601 lt!12469)))))

(declare-fun bm!125 () Bool)

(declare-fun c!473 () Bool)

(assert (=> bm!125 (= call!128 (reader!0 thiss!1486 (ite c!473 (_2!601 lt!12474) thiss!1486)))))

(declare-fun b!8590 () Bool)

(declare-fun res!9105 () Bool)

(assert (=> b!8590 (=> (not res!9105) (not e!5355))))

(assert (=> b!8590 (= res!9105 (= (size!242 (buf!578 thiss!1486)) (size!242 (buf!578 (_2!601 lt!12469)))))))

(declare-fun d!2536 () Bool)

(assert (=> d!2536 e!5355))

(declare-fun res!9106 () Bool)

(assert (=> d!2536 (=> (not res!9106) (not e!5355))))

(declare-fun lt!12487 () (_ BitVec 64))

(assert (=> d!2536 (= res!9106 (= (bitIndex!0 (size!242 (buf!578 (_2!601 lt!12469))) (currentByte!1608 (_2!601 lt!12469)) (currentBit!1603 (_2!601 lt!12469))) (bvsub lt!12487 from!367)))))

(assert (=> d!2536 (or (= (bvand lt!12487 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!12487 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!12487 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!12500 () (_ BitVec 64))

(assert (=> d!2536 (= lt!12487 (bvadd lt!12500 from!367 nBits!460))))

(assert (=> d!2536 (or (not (= (bvand lt!12500 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!12500 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!12500 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2536 (= lt!12500 (bitIndex!0 (size!242 (buf!578 thiss!1486)) (currentByte!1608 thiss!1486) (currentBit!1603 thiss!1486)))))

(assert (=> d!2536 (= lt!12469 e!5357)))

(assert (=> d!2536 (= c!473 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!12482 () Unit!717)

(declare-fun lt!12491 () Unit!717)

(assert (=> d!2536 (= lt!12482 lt!12491)))

(assert (=> d!2536 (isPrefixOf!0 thiss!1486 thiss!1486)))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!462) Unit!717)

(assert (=> d!2536 (= lt!12491 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!2536 (= lt!12499 (bitIndex!0 (size!242 (buf!578 thiss!1486)) (currentByte!1608 thiss!1486) (currentBit!1603 thiss!1486)))))

(assert (=> d!2536 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2536 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!12469)))

(declare-fun b!8591 () Bool)

(declare-fun res!9107 () Bool)

(assert (=> b!8591 (=> (not res!9107) (not e!5355))))

(assert (=> b!8591 (= res!9107 (= (size!242 (buf!578 (_2!601 lt!12469))) (size!242 (buf!578 thiss!1486))))))

(declare-fun lt!12472 () tuple2!1150)

(declare-fun b!8592 () Bool)

(assert (=> b!8592 (= e!5355 (= (bitStreamReadBitsIntoList!0 (_2!601 lt!12469) (_1!606 lt!12472) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!601 lt!12469) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!8592 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8592 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!12463 () Unit!717)

(declare-fun lt!12471 () Unit!717)

(assert (=> b!8592 (= lt!12463 lt!12471)))

(assert (=> b!8592 (validate_offset_bits!1 ((_ sign_extend 32) (size!242 (buf!578 (_2!601 lt!12469)))) ((_ sign_extend 32) (currentByte!1608 thiss!1486)) ((_ sign_extend 32) (currentBit!1603 thiss!1486)) lt!12483)))

(assert (=> b!8592 (= lt!12471 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!578 (_2!601 lt!12469)) lt!12483))))

(assert (=> b!8592 e!5356))

(declare-fun res!9104 () Bool)

(assert (=> b!8592 (=> (not res!9104) (not e!5356))))

(assert (=> b!8592 (= res!9104 (and (= (size!242 (buf!578 thiss!1486)) (size!242 (buf!578 (_2!601 lt!12469)))) (bvsge lt!12483 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8592 (= lt!12483 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!8592 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8592 (= lt!12472 (reader!0 thiss!1486 (_2!601 lt!12469)))))

(assert (= (and d!2536 c!473) b!8587))

(assert (= (and d!2536 (not c!473)) b!8585))

(assert (= (or b!8587 b!8585) bm!125))

(assert (= (and d!2536 res!9106) b!8588))

(assert (= (and b!8588 res!9109) b!8590))

(assert (= (and b!8590 res!9105) b!8589))

(assert (= (and b!8589 res!9108) b!8591))

(assert (= (and b!8591 res!9107) b!8592))

(assert (= (and b!8592 res!9104) b!8586))

(declare-fun m!11685 () Bool)

(assert (=> b!8592 m!11685))

(declare-fun m!11687 () Bool)

(assert (=> b!8592 m!11687))

(declare-fun m!11689 () Bool)

(assert (=> b!8592 m!11689))

(declare-fun m!11691 () Bool)

(assert (=> b!8592 m!11691))

(declare-fun m!11693 () Bool)

(assert (=> b!8592 m!11693))

(declare-fun m!11695 () Bool)

(assert (=> b!8586 m!11695))

(declare-fun m!11697 () Bool)

(assert (=> b!8589 m!11697))

(declare-fun m!11699 () Bool)

(assert (=> b!8585 m!11699))

(declare-fun m!11701 () Bool)

(assert (=> b!8585 m!11701))

(declare-fun m!11703 () Bool)

(assert (=> d!2536 m!11703))

(assert (=> d!2536 m!11459))

(declare-fun m!11705 () Bool)

(assert (=> d!2536 m!11705))

(declare-fun m!11707 () Bool)

(assert (=> d!2536 m!11707))

(declare-fun m!11709 () Bool)

(assert (=> bm!125 m!11709))

(declare-fun m!11711 () Bool)

(assert (=> b!8588 m!11711))

(declare-fun m!11713 () Bool)

(assert (=> b!8587 m!11713))

(declare-fun m!11715 () Bool)

(assert (=> b!8587 m!11715))

(declare-fun m!11717 () Bool)

(assert (=> b!8587 m!11717))

(declare-fun m!11719 () Bool)

(assert (=> b!8587 m!11719))

(declare-fun m!11721 () Bool)

(assert (=> b!8587 m!11721))

(declare-fun m!11723 () Bool)

(assert (=> b!8587 m!11723))

(declare-fun m!11725 () Bool)

(assert (=> b!8587 m!11725))

(declare-fun m!11727 () Bool)

(assert (=> b!8587 m!11727))

(declare-fun m!11729 () Bool)

(assert (=> b!8587 m!11729))

(declare-fun m!11731 () Bool)

(assert (=> b!8587 m!11731))

(declare-fun m!11733 () Bool)

(assert (=> b!8587 m!11733))

(declare-fun m!11735 () Bool)

(assert (=> b!8587 m!11735))

(assert (=> b!8587 m!11715))

(declare-fun m!11737 () Bool)

(assert (=> b!8587 m!11737))

(declare-fun m!11739 () Bool)

(assert (=> b!8587 m!11739))

(declare-fun m!11741 () Bool)

(assert (=> b!8587 m!11741))

(declare-fun m!11743 () Bool)

(assert (=> b!8587 m!11743))

(declare-fun m!11745 () Bool)

(assert (=> b!8587 m!11745))

(declare-fun m!11747 () Bool)

(assert (=> b!8587 m!11747))

(declare-fun m!11749 () Bool)

(assert (=> b!8587 m!11749))

(declare-fun m!11751 () Bool)

(assert (=> b!8587 m!11751))

(declare-fun m!11753 () Bool)

(assert (=> b!8587 m!11753))

(declare-fun m!11755 () Bool)

(assert (=> b!8587 m!11755))

(declare-fun m!11757 () Bool)

(assert (=> b!8587 m!11757))

(declare-fun m!11759 () Bool)

(assert (=> b!8587 m!11759))

(declare-fun m!11761 () Bool)

(assert (=> b!8587 m!11761))

(assert (=> b!8587 m!11725))

(declare-fun m!11763 () Bool)

(assert (=> b!8587 m!11763))

(assert (=> b!8587 m!11753))

(declare-fun m!11765 () Bool)

(assert (=> b!8587 m!11765))

(declare-fun m!11767 () Bool)

(assert (=> b!8587 m!11767))

(declare-fun m!11769 () Bool)

(assert (=> b!8587 m!11769))

(assert (=> b!8587 m!11459))

(declare-fun m!11771 () Bool)

(assert (=> b!8587 m!11771))

(declare-fun m!11773 () Bool)

(assert (=> b!8587 m!11773))

(assert (=> b!8587 m!11759))

(assert (=> b!8450 d!2536))

(check-sat (not d!2530) (not b!8488) (not d!2502) (not b!8589) (not b!8587) (not d!2532) (not d!2536) (not d!2526) (not b!8585) (not b!8592) (not b!8586) (not b!8588) (not b!8486) (not bm!125))
