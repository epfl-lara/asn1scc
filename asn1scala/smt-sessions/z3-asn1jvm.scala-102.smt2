; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2374 () Bool)

(assert start!2374)

(declare-fun b!11289 () Bool)

(declare-fun res!11104 () Bool)

(declare-fun e!6906 () Bool)

(assert (=> b!11289 (=> (not res!11104) (not e!6906))))

(declare-fun nBits!460 () (_ BitVec 64))

(declare-datatypes ((array!665 0))(
  ( (array!666 (arr!707 (Array (_ BitVec 32) (_ BitVec 8))) (size!287 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!540 0))(
  ( (BitStream!541 (buf!632 array!665) (currentByte!1704 (_ BitVec 32)) (currentBit!1699 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!540)

(declare-datatypes ((Unit!970 0))(
  ( (Unit!971) )
))
(declare-datatypes ((tuple2!1396 0))(
  ( (tuple2!1397 (_1!744 Unit!970) (_2!744 BitStream!540)) )
))
(declare-fun lt!17700 () tuple2!1396)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!11289 (= res!11104 (= (bitIndex!0 (size!287 (buf!632 (_2!744 lt!17700))) (currentByte!1704 (_2!744 lt!17700)) (currentBit!1699 (_2!744 lt!17700))) (bvadd (bitIndex!0 (size!287 (buf!632 thiss!1486)) (currentByte!1704 thiss!1486) (currentBit!1699 thiss!1486)) nBits!460)))))

(declare-fun b!11290 () Bool)

(declare-fun res!11110 () Bool)

(declare-fun e!6910 () Bool)

(assert (=> b!11290 (=> (not res!11110) (not e!6910))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!11290 (= res!11110 (validate_offset_bits!1 ((_ sign_extend 32) (size!287 (buf!632 thiss!1486))) ((_ sign_extend 32) (currentByte!1704 thiss!1486)) ((_ sign_extend 32) (currentBit!1699 thiss!1486)) nBits!460))))

(declare-fun b!11291 () Bool)

(assert (=> b!11291 (= e!6910 e!6906)))

(declare-fun res!11102 () Bool)

(assert (=> b!11291 (=> (not res!11102) (not e!6906))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!11291 (= res!11102 (invariant!0 (currentBit!1699 (_2!744 lt!17700)) (currentByte!1704 (_2!744 lt!17700)) (size!287 (buf!632 (_2!744 lt!17700)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!665)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!540 array!665 (_ BitVec 64) (_ BitVec 64)) tuple2!1396)

(assert (=> b!11291 (= lt!17700 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!11292 () Bool)

(declare-fun e!6905 () Bool)

(declare-datatypes ((tuple2!1398 0))(
  ( (tuple2!1399 (_1!745 BitStream!540) (_2!745 BitStream!540)) )
))
(declare-fun lt!17697 () tuple2!1398)

(declare-datatypes ((tuple2!1400 0))(
  ( (tuple2!1401 (_1!746 array!665) (_2!746 BitStream!540)) )
))
(declare-fun lt!17701 () tuple2!1400)

(declare-fun inv!12 (BitStream!540) Bool)

(assert (=> b!11292 (= e!6905 (inv!12 (BitStream!541 (buf!632 (_1!745 lt!17697)) (currentByte!1704 (_1!745 lt!17697)) (currentBit!1699 (_2!746 lt!17701)))))))

(declare-fun b!11293 () Bool)

(declare-fun e!6908 () Bool)

(declare-fun array_inv!279 (array!665) Bool)

(assert (=> b!11293 (= e!6908 (array_inv!279 (buf!632 thiss!1486)))))

(declare-fun b!11294 () Bool)

(declare-fun res!11106 () Bool)

(assert (=> b!11294 (=> (not res!11106) (not e!6906))))

(declare-fun isPrefixOf!0 (BitStream!540 BitStream!540) Bool)

(assert (=> b!11294 (= res!11106 (isPrefixOf!0 thiss!1486 (_2!744 lt!17700)))))

(declare-fun res!11103 () Bool)

(assert (=> start!2374 (=> (not res!11103) (not e!6910))))

(assert (=> start!2374 (= res!11103 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!287 srcBuffer!6))))))))

(assert (=> start!2374 e!6910))

(assert (=> start!2374 true))

(assert (=> start!2374 (array_inv!279 srcBuffer!6)))

(assert (=> start!2374 (and (inv!12 thiss!1486) e!6908)))

(declare-fun b!11295 () Bool)

(declare-fun res!11109 () Bool)

(assert (=> b!11295 (=> (not res!11109) (not e!6906))))

(assert (=> b!11295 (= res!11109 (= (size!287 (buf!632 thiss!1486)) (size!287 (buf!632 (_2!744 lt!17700)))))))

(declare-fun b!11296 () Bool)

(declare-fun e!6907 () Bool)

(assert (=> b!11296 (= e!6906 (not e!6907))))

(declare-fun res!11108 () Bool)

(assert (=> b!11296 (=> res!11108 e!6907)))

(declare-datatypes ((List!166 0))(
  ( (Nil!163) (Cons!162 (h!281 Bool) (t!916 List!166)) )
))
(declare-fun lt!17699 () List!166)

(declare-fun byteArrayBitContentToList!0 (BitStream!540 array!665 (_ BitVec 64) (_ BitVec 64)) List!166)

(assert (=> b!11296 (= res!11108 (not (= (byteArrayBitContentToList!0 (_2!744 lt!17700) (_1!746 lt!17701) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!17699)))))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!540 BitStream!540 (_ BitVec 64)) List!166)

(assert (=> b!11296 (= lt!17699 (bitStreamReadBitsIntoList!0 (_2!744 lt!17700) (_1!745 lt!17697) nBits!460))))

(declare-fun readBits!0 (BitStream!540 (_ BitVec 64)) tuple2!1400)

(assert (=> b!11296 (= lt!17701 (readBits!0 (_1!745 lt!17697) nBits!460))))

(assert (=> b!11296 (validate_offset_bits!1 ((_ sign_extend 32) (size!287 (buf!632 (_2!744 lt!17700)))) ((_ sign_extend 32) (currentByte!1704 thiss!1486)) ((_ sign_extend 32) (currentBit!1699 thiss!1486)) nBits!460)))

(declare-fun lt!17698 () Unit!970)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!540 array!665 (_ BitVec 64)) Unit!970)

(assert (=> b!11296 (= lt!17698 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!632 (_2!744 lt!17700)) nBits!460))))

(declare-fun reader!0 (BitStream!540 BitStream!540) tuple2!1398)

(assert (=> b!11296 (= lt!17697 (reader!0 thiss!1486 (_2!744 lt!17700)))))

(declare-fun b!11297 () Bool)

(declare-fun res!11105 () Bool)

(assert (=> b!11297 (=> res!11105 e!6907)))

(assert (=> b!11297 (= res!11105 (not (= lt!17699 (byteArrayBitContentToList!0 (_2!744 lt!17700) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!11298 () Bool)

(assert (=> b!11298 (= e!6907 e!6905)))

(declare-fun res!11107 () Bool)

(assert (=> b!11298 (=> res!11107 e!6905)))

(declare-fun checkByteArrayBitContent!0 (BitStream!540 array!665 array!665 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!11298 (= res!11107 (not (checkByteArrayBitContent!0 (_2!744 lt!17700) srcBuffer!6 (_1!746 lt!17701) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460)))))

(declare-fun lt!17702 () Unit!970)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!540 array!665 array!665 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!970)

(assert (=> b!11298 (= lt!17702 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!744 lt!17700) srcBuffer!6 (_1!746 lt!17701) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (= (and start!2374 res!11103) b!11290))

(assert (= (and b!11290 res!11110) b!11291))

(assert (= (and b!11291 res!11102) b!11295))

(assert (= (and b!11295 res!11109) b!11289))

(assert (= (and b!11289 res!11104) b!11294))

(assert (= (and b!11294 res!11106) b!11296))

(assert (= (and b!11296 (not res!11108)) b!11297))

(assert (= (and b!11297 (not res!11105)) b!11298))

(assert (= (and b!11298 (not res!11107)) b!11292))

(assert (= start!2374 b!11293))

(declare-fun m!16471 () Bool)

(assert (=> b!11294 m!16471))

(declare-fun m!16473 () Bool)

(assert (=> start!2374 m!16473))

(declare-fun m!16475 () Bool)

(assert (=> start!2374 m!16475))

(declare-fun m!16477 () Bool)

(assert (=> b!11289 m!16477))

(declare-fun m!16479 () Bool)

(assert (=> b!11289 m!16479))

(declare-fun m!16481 () Bool)

(assert (=> b!11291 m!16481))

(declare-fun m!16483 () Bool)

(assert (=> b!11291 m!16483))

(declare-fun m!16485 () Bool)

(assert (=> b!11293 m!16485))

(declare-fun m!16487 () Bool)

(assert (=> b!11297 m!16487))

(declare-fun m!16489 () Bool)

(assert (=> b!11298 m!16489))

(declare-fun m!16491 () Bool)

(assert (=> b!11298 m!16491))

(declare-fun m!16493 () Bool)

(assert (=> b!11292 m!16493))

(declare-fun m!16495 () Bool)

(assert (=> b!11296 m!16495))

(declare-fun m!16497 () Bool)

(assert (=> b!11296 m!16497))

(declare-fun m!16499 () Bool)

(assert (=> b!11296 m!16499))

(declare-fun m!16501 () Bool)

(assert (=> b!11296 m!16501))

(declare-fun m!16503 () Bool)

(assert (=> b!11296 m!16503))

(declare-fun m!16505 () Bool)

(assert (=> b!11296 m!16505))

(declare-fun m!16507 () Bool)

(assert (=> b!11290 m!16507))

(check-sat (not b!11296) (not b!11290) (not b!11293) (not b!11297) (not start!2374) (not b!11298) (not b!11292) (not b!11289) (not b!11291) (not b!11294))
(check-sat)
(get-model)

(declare-fun d!3486 () Bool)

(declare-fun e!6957 () Bool)

(assert (=> d!3486 e!6957))

(declare-fun res!11160 () Bool)

(assert (=> d!3486 (=> (not res!11160) (not e!6957))))

(declare-fun lt!17807 () (_ BitVec 64))

(declare-fun lt!17810 () (_ BitVec 64))

(declare-fun lt!17805 () (_ BitVec 64))

(assert (=> d!3486 (= res!11160 (= lt!17810 (bvsub lt!17807 lt!17805)))))

(assert (=> d!3486 (or (= (bvand lt!17807 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!17805 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!17807 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!17807 lt!17805) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!3486 (= lt!17805 (remainingBits!0 ((_ sign_extend 32) (size!287 (buf!632 (_2!744 lt!17700)))) ((_ sign_extend 32) (currentByte!1704 (_2!744 lt!17700))) ((_ sign_extend 32) (currentBit!1699 (_2!744 lt!17700)))))))

(declare-fun lt!17808 () (_ BitVec 64))

(declare-fun lt!17806 () (_ BitVec 64))

(assert (=> d!3486 (= lt!17807 (bvmul lt!17808 lt!17806))))

(assert (=> d!3486 (or (= lt!17808 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!17806 (bvsdiv (bvmul lt!17808 lt!17806) lt!17808)))))

(assert (=> d!3486 (= lt!17806 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!3486 (= lt!17808 ((_ sign_extend 32) (size!287 (buf!632 (_2!744 lt!17700)))))))

(assert (=> d!3486 (= lt!17810 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1704 (_2!744 lt!17700))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1699 (_2!744 lt!17700)))))))

(assert (=> d!3486 (invariant!0 (currentBit!1699 (_2!744 lt!17700)) (currentByte!1704 (_2!744 lt!17700)) (size!287 (buf!632 (_2!744 lt!17700))))))

(assert (=> d!3486 (= (bitIndex!0 (size!287 (buf!632 (_2!744 lt!17700))) (currentByte!1704 (_2!744 lt!17700)) (currentBit!1699 (_2!744 lt!17700))) lt!17810)))

(declare-fun b!11377 () Bool)

(declare-fun res!11161 () Bool)

(assert (=> b!11377 (=> (not res!11161) (not e!6957))))

(assert (=> b!11377 (= res!11161 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!17810))))

(declare-fun b!11378 () Bool)

(declare-fun lt!17809 () (_ BitVec 64))

(assert (=> b!11378 (= e!6957 (bvsle lt!17810 (bvmul lt!17809 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!11378 (or (= lt!17809 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!17809 #b0000000000000000000000000000000000000000000000000000000000001000) lt!17809)))))

(assert (=> b!11378 (= lt!17809 ((_ sign_extend 32) (size!287 (buf!632 (_2!744 lt!17700)))))))

(assert (= (and d!3486 res!11160) b!11377))

(assert (= (and b!11377 res!11161) b!11378))

(declare-fun m!16609 () Bool)

(assert (=> d!3486 m!16609))

(assert (=> d!3486 m!16481))

(assert (=> b!11289 d!3486))

(declare-fun d!3488 () Bool)

(declare-fun e!6958 () Bool)

(assert (=> d!3488 e!6958))

(declare-fun res!11162 () Bool)

(assert (=> d!3488 (=> (not res!11162) (not e!6958))))

(declare-fun lt!17816 () (_ BitVec 64))

(declare-fun lt!17813 () (_ BitVec 64))

(declare-fun lt!17811 () (_ BitVec 64))

(assert (=> d!3488 (= res!11162 (= lt!17816 (bvsub lt!17813 lt!17811)))))

(assert (=> d!3488 (or (= (bvand lt!17813 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!17811 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!17813 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!17813 lt!17811) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3488 (= lt!17811 (remainingBits!0 ((_ sign_extend 32) (size!287 (buf!632 thiss!1486))) ((_ sign_extend 32) (currentByte!1704 thiss!1486)) ((_ sign_extend 32) (currentBit!1699 thiss!1486))))))

(declare-fun lt!17814 () (_ BitVec 64))

(declare-fun lt!17812 () (_ BitVec 64))

(assert (=> d!3488 (= lt!17813 (bvmul lt!17814 lt!17812))))

(assert (=> d!3488 (or (= lt!17814 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!17812 (bvsdiv (bvmul lt!17814 lt!17812) lt!17814)))))

(assert (=> d!3488 (= lt!17812 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!3488 (= lt!17814 ((_ sign_extend 32) (size!287 (buf!632 thiss!1486))))))

(assert (=> d!3488 (= lt!17816 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1704 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1699 thiss!1486))))))

(assert (=> d!3488 (invariant!0 (currentBit!1699 thiss!1486) (currentByte!1704 thiss!1486) (size!287 (buf!632 thiss!1486)))))

(assert (=> d!3488 (= (bitIndex!0 (size!287 (buf!632 thiss!1486)) (currentByte!1704 thiss!1486) (currentBit!1699 thiss!1486)) lt!17816)))

(declare-fun b!11379 () Bool)

(declare-fun res!11163 () Bool)

(assert (=> b!11379 (=> (not res!11163) (not e!6958))))

(assert (=> b!11379 (= res!11163 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!17816))))

(declare-fun b!11380 () Bool)

(declare-fun lt!17815 () (_ BitVec 64))

(assert (=> b!11380 (= e!6958 (bvsle lt!17816 (bvmul lt!17815 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!11380 (or (= lt!17815 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!17815 #b0000000000000000000000000000000000000000000000000000000000001000) lt!17815)))))

(assert (=> b!11380 (= lt!17815 ((_ sign_extend 32) (size!287 (buf!632 thiss!1486))))))

(assert (= (and d!3488 res!11162) b!11379))

(assert (= (and b!11379 res!11163) b!11380))

(declare-fun m!16611 () Bool)

(assert (=> d!3488 m!16611))

(declare-fun m!16613 () Bool)

(assert (=> d!3488 m!16613))

(assert (=> b!11289 d!3488))

(declare-fun d!3490 () Bool)

(declare-fun res!11172 () Bool)

(declare-fun e!6964 () Bool)

(assert (=> d!3490 (=> (not res!11172) (not e!6964))))

(assert (=> d!3490 (= res!11172 (= (size!287 (buf!632 thiss!1486)) (size!287 (buf!632 (_2!744 lt!17700)))))))

(assert (=> d!3490 (= (isPrefixOf!0 thiss!1486 (_2!744 lt!17700)) e!6964)))

(declare-fun b!11387 () Bool)

(declare-fun res!11171 () Bool)

(assert (=> b!11387 (=> (not res!11171) (not e!6964))))

(assert (=> b!11387 (= res!11171 (bvsle (bitIndex!0 (size!287 (buf!632 thiss!1486)) (currentByte!1704 thiss!1486) (currentBit!1699 thiss!1486)) (bitIndex!0 (size!287 (buf!632 (_2!744 lt!17700))) (currentByte!1704 (_2!744 lt!17700)) (currentBit!1699 (_2!744 lt!17700)))))))

(declare-fun b!11388 () Bool)

(declare-fun e!6963 () Bool)

(assert (=> b!11388 (= e!6964 e!6963)))

(declare-fun res!11170 () Bool)

(assert (=> b!11388 (=> res!11170 e!6963)))

(assert (=> b!11388 (= res!11170 (= (size!287 (buf!632 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!11389 () Bool)

(declare-fun arrayBitRangesEq!0 (array!665 array!665 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!11389 (= e!6963 (arrayBitRangesEq!0 (buf!632 thiss!1486) (buf!632 (_2!744 lt!17700)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!287 (buf!632 thiss!1486)) (currentByte!1704 thiss!1486) (currentBit!1699 thiss!1486))))))

(assert (= (and d!3490 res!11172) b!11387))

(assert (= (and b!11387 res!11171) b!11388))

(assert (= (and b!11388 (not res!11170)) b!11389))

(assert (=> b!11387 m!16479))

(assert (=> b!11387 m!16477))

(assert (=> b!11389 m!16479))

(assert (=> b!11389 m!16479))

(declare-fun m!16615 () Bool)

(assert (=> b!11389 m!16615))

(assert (=> b!11294 d!3490))

(declare-fun d!3492 () Bool)

(assert (=> d!3492 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!287 (buf!632 thiss!1486))) ((_ sign_extend 32) (currentByte!1704 thiss!1486)) ((_ sign_extend 32) (currentBit!1699 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!287 (buf!632 thiss!1486))) ((_ sign_extend 32) (currentByte!1704 thiss!1486)) ((_ sign_extend 32) (currentBit!1699 thiss!1486))) nBits!460))))

(declare-fun bs!1030 () Bool)

(assert (= bs!1030 d!3492))

(assert (=> bs!1030 m!16611))

(assert (=> b!11290 d!3492))

(declare-fun d!3494 () Bool)

(assert (=> d!3494 (= (invariant!0 (currentBit!1699 (_2!744 lt!17700)) (currentByte!1704 (_2!744 lt!17700)) (size!287 (buf!632 (_2!744 lt!17700)))) (and (bvsge (currentBit!1699 (_2!744 lt!17700)) #b00000000000000000000000000000000) (bvslt (currentBit!1699 (_2!744 lt!17700)) #b00000000000000000000000000001000) (bvsge (currentByte!1704 (_2!744 lt!17700)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1704 (_2!744 lt!17700)) (size!287 (buf!632 (_2!744 lt!17700)))) (and (= (currentBit!1699 (_2!744 lt!17700)) #b00000000000000000000000000000000) (= (currentByte!1704 (_2!744 lt!17700)) (size!287 (buf!632 (_2!744 lt!17700))))))))))

(assert (=> b!11291 d!3494))

(declare-fun b!11467 () Bool)

(declare-fun e!6995 () tuple2!1396)

(declare-fun Unit!989 () Unit!970)

(assert (=> b!11467 (= e!6995 (tuple2!1397 Unit!989 thiss!1486))))

(assert (=> b!11467 (= (size!287 (buf!632 thiss!1486)) (size!287 (buf!632 thiss!1486)))))

(declare-fun lt!18160 () Unit!970)

(declare-fun Unit!990 () Unit!970)

(assert (=> b!11467 (= lt!18160 Unit!990)))

(declare-fun call!212 () tuple2!1398)

(assert (=> b!11467 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!746 (readBits!0 (_1!745 call!212) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun b!11468 () Bool)

(declare-fun lt!18143 () tuple2!1396)

(declare-fun lt!18162 () tuple2!1398)

(declare-fun e!6996 () Bool)

(assert (=> b!11468 (= e!6996 (= (bitStreamReadBitsIntoList!0 (_2!744 lt!18143) (_1!745 lt!18162) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!744 lt!18143) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!11468 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!11468 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!18170 () Unit!970)

(declare-fun lt!18152 () Unit!970)

(assert (=> b!11468 (= lt!18170 lt!18152)))

(declare-fun lt!18136 () (_ BitVec 64))

(assert (=> b!11468 (validate_offset_bits!1 ((_ sign_extend 32) (size!287 (buf!632 (_2!744 lt!18143)))) ((_ sign_extend 32) (currentByte!1704 thiss!1486)) ((_ sign_extend 32) (currentBit!1699 thiss!1486)) lt!18136)))

(assert (=> b!11468 (= lt!18152 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!632 (_2!744 lt!18143)) lt!18136))))

(declare-fun e!6994 () Bool)

(assert (=> b!11468 e!6994))

(declare-fun res!11223 () Bool)

(assert (=> b!11468 (=> (not res!11223) (not e!6994))))

(assert (=> b!11468 (= res!11223 (and (= (size!287 (buf!632 thiss!1486)) (size!287 (buf!632 (_2!744 lt!18143)))) (bvsge lt!18136 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!11468 (= lt!18136 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!11468 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!11468 (= lt!18162 (reader!0 thiss!1486 (_2!744 lt!18143)))))

(declare-fun b!11469 () Bool)

(declare-fun res!11222 () Bool)

(assert (=> b!11469 (=> (not res!11222) (not e!6996))))

(assert (=> b!11469 (= res!11222 (invariant!0 (currentBit!1699 (_2!744 lt!18143)) (currentByte!1704 (_2!744 lt!18143)) (size!287 (buf!632 (_2!744 lt!18143)))))))

(declare-fun d!3496 () Bool)

(assert (=> d!3496 e!6996))

(declare-fun res!11219 () Bool)

(assert (=> d!3496 (=> (not res!11219) (not e!6996))))

(declare-fun lt!18146 () (_ BitVec 64))

(assert (=> d!3496 (= res!11219 (= (bitIndex!0 (size!287 (buf!632 (_2!744 lt!18143))) (currentByte!1704 (_2!744 lt!18143)) (currentBit!1699 (_2!744 lt!18143))) (bvsub lt!18146 from!367)))))

(assert (=> d!3496 (or (= (bvand lt!18146 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!18146 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!18146 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!18141 () (_ BitVec 64))

(assert (=> d!3496 (= lt!18146 (bvadd lt!18141 from!367 nBits!460))))

(assert (=> d!3496 (or (not (= (bvand lt!18141 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!18141 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!18141 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3496 (= lt!18141 (bitIndex!0 (size!287 (buf!632 thiss!1486)) (currentByte!1704 thiss!1486) (currentBit!1699 thiss!1486)))))

(assert (=> d!3496 (= lt!18143 e!6995)))

(declare-fun c!797 () Bool)

(assert (=> d!3496 (= c!797 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!18179 () Unit!970)

(declare-fun lt!18135 () Unit!970)

(assert (=> d!3496 (= lt!18179 lt!18135)))

(assert (=> d!3496 (isPrefixOf!0 thiss!1486 thiss!1486)))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!540) Unit!970)

(assert (=> d!3496 (= lt!18135 (lemmaIsPrefixRefl!0 thiss!1486))))

(declare-fun lt!18168 () (_ BitVec 64))

(assert (=> d!3496 (= lt!18168 (bitIndex!0 (size!287 (buf!632 thiss!1486)) (currentByte!1704 thiss!1486) (currentBit!1699 thiss!1486)))))

(assert (=> d!3496 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3496 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!18143)))

(declare-fun b!11470 () Bool)

(declare-fun lt!18157 () tuple2!1396)

(declare-fun Unit!991 () Unit!970)

(assert (=> b!11470 (= e!6995 (tuple2!1397 Unit!991 (_2!744 lt!18157)))))

(declare-fun lt!18151 () tuple2!1396)

(declare-fun appendBitFromByte!0 (BitStream!540 (_ BitVec 8) (_ BitVec 32)) tuple2!1396)

(assert (=> b!11470 (= lt!18151 (appendBitFromByte!0 thiss!1486 (select (arr!707 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!18145 () (_ BitVec 64))

(assert (=> b!11470 (= lt!18145 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!18167 () (_ BitVec 64))

(assert (=> b!11470 (= lt!18167 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!18138 () Unit!970)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!540 BitStream!540 (_ BitVec 64) (_ BitVec 64)) Unit!970)

(assert (=> b!11470 (= lt!18138 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!744 lt!18151) lt!18145 lt!18167))))

(assert (=> b!11470 (validate_offset_bits!1 ((_ sign_extend 32) (size!287 (buf!632 (_2!744 lt!18151)))) ((_ sign_extend 32) (currentByte!1704 (_2!744 lt!18151))) ((_ sign_extend 32) (currentBit!1699 (_2!744 lt!18151))) (bvsub lt!18145 lt!18167))))

(declare-fun lt!18142 () Unit!970)

(assert (=> b!11470 (= lt!18142 lt!18138)))

(declare-fun lt!18164 () tuple2!1398)

(assert (=> b!11470 (= lt!18164 (reader!0 thiss!1486 (_2!744 lt!18151)))))

(declare-fun lt!18173 () (_ BitVec 64))

(assert (=> b!11470 (= lt!18173 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!18163 () Unit!970)

(assert (=> b!11470 (= lt!18163 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!632 (_2!744 lt!18151)) lt!18173))))

(assert (=> b!11470 (validate_offset_bits!1 ((_ sign_extend 32) (size!287 (buf!632 (_2!744 lt!18151)))) ((_ sign_extend 32) (currentByte!1704 thiss!1486)) ((_ sign_extend 32) (currentBit!1699 thiss!1486)) lt!18173)))

(declare-fun lt!18175 () Unit!970)

(assert (=> b!11470 (= lt!18175 lt!18163)))

(declare-fun head!64 (List!166) Bool)

(assert (=> b!11470 (= (head!64 (byteArrayBitContentToList!0 (_2!744 lt!18151) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!64 (bitStreamReadBitsIntoList!0 (_2!744 lt!18151) (_1!745 lt!18164) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!18150 () Unit!970)

(declare-fun Unit!992 () Unit!970)

(assert (=> b!11470 (= lt!18150 Unit!992)))

(assert (=> b!11470 (= lt!18157 (appendBitsMSBFirstLoop!0 (_2!744 lt!18151) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!18169 () Unit!970)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!540 BitStream!540 BitStream!540) Unit!970)

(assert (=> b!11470 (= lt!18169 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!744 lt!18151) (_2!744 lt!18157)))))

(assert (=> b!11470 (isPrefixOf!0 thiss!1486 (_2!744 lt!18157))))

(declare-fun lt!18158 () Unit!970)

(assert (=> b!11470 (= lt!18158 lt!18169)))

(assert (=> b!11470 (= (size!287 (buf!632 (_2!744 lt!18157))) (size!287 (buf!632 thiss!1486)))))

(declare-fun lt!18172 () Unit!970)

(declare-fun Unit!993 () Unit!970)

(assert (=> b!11470 (= lt!18172 Unit!993)))

(assert (=> b!11470 (= (bitIndex!0 (size!287 (buf!632 (_2!744 lt!18157))) (currentByte!1704 (_2!744 lt!18157)) (currentBit!1699 (_2!744 lt!18157))) (bvsub (bvadd (bitIndex!0 (size!287 (buf!632 thiss!1486)) (currentByte!1704 thiss!1486) (currentBit!1699 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!18156 () Unit!970)

(declare-fun Unit!994 () Unit!970)

(assert (=> b!11470 (= lt!18156 Unit!994)))

(assert (=> b!11470 (= (bitIndex!0 (size!287 (buf!632 (_2!744 lt!18157))) (currentByte!1704 (_2!744 lt!18157)) (currentBit!1699 (_2!744 lt!18157))) (bvsub (bvsub (bvadd (bitIndex!0 (size!287 (buf!632 (_2!744 lt!18151))) (currentByte!1704 (_2!744 lt!18151)) (currentBit!1699 (_2!744 lt!18151))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!18166 () Unit!970)

(declare-fun Unit!995 () Unit!970)

(assert (=> b!11470 (= lt!18166 Unit!995)))

(declare-fun lt!18161 () tuple2!1398)

(assert (=> b!11470 (= lt!18161 call!212)))

(declare-fun lt!18134 () (_ BitVec 64))

(assert (=> b!11470 (= lt!18134 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!18159 () Unit!970)

(assert (=> b!11470 (= lt!18159 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!632 (_2!744 lt!18157)) lt!18134))))

(assert (=> b!11470 (validate_offset_bits!1 ((_ sign_extend 32) (size!287 (buf!632 (_2!744 lt!18157)))) ((_ sign_extend 32) (currentByte!1704 thiss!1486)) ((_ sign_extend 32) (currentBit!1699 thiss!1486)) lt!18134)))

(declare-fun lt!18176 () Unit!970)

(assert (=> b!11470 (= lt!18176 lt!18159)))

(declare-fun lt!18148 () tuple2!1398)

(assert (=> b!11470 (= lt!18148 (reader!0 (_2!744 lt!18151) (_2!744 lt!18157)))))

(declare-fun lt!18174 () (_ BitVec 64))

(assert (=> b!11470 (= lt!18174 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!18171 () Unit!970)

(assert (=> b!11470 (= lt!18171 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!744 lt!18151) (buf!632 (_2!744 lt!18157)) lt!18174))))

(assert (=> b!11470 (validate_offset_bits!1 ((_ sign_extend 32) (size!287 (buf!632 (_2!744 lt!18157)))) ((_ sign_extend 32) (currentByte!1704 (_2!744 lt!18151))) ((_ sign_extend 32) (currentBit!1699 (_2!744 lt!18151))) lt!18174)))

(declare-fun lt!18165 () Unit!970)

(assert (=> b!11470 (= lt!18165 lt!18171)))

(declare-fun lt!18140 () List!166)

(assert (=> b!11470 (= lt!18140 (byteArrayBitContentToList!0 (_2!744 lt!18157) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!18139 () List!166)

(assert (=> b!11470 (= lt!18139 (byteArrayBitContentToList!0 (_2!744 lt!18157) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!18144 () List!166)

(assert (=> b!11470 (= lt!18144 (bitStreamReadBitsIntoList!0 (_2!744 lt!18157) (_1!745 lt!18161) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!18177 () List!166)

(assert (=> b!11470 (= lt!18177 (bitStreamReadBitsIntoList!0 (_2!744 lt!18157) (_1!745 lt!18148) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!18149 () (_ BitVec 64))

(assert (=> b!11470 (= lt!18149 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!18147 () Unit!970)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!540 BitStream!540 BitStream!540 BitStream!540 (_ BitVec 64) List!166) Unit!970)

(assert (=> b!11470 (= lt!18147 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!744 lt!18157) (_2!744 lt!18157) (_1!745 lt!18161) (_1!745 lt!18148) lt!18149 lt!18144))))

(declare-fun tail!72 (List!166) List!166)

(assert (=> b!11470 (= (bitStreamReadBitsIntoList!0 (_2!744 lt!18157) (_1!745 lt!18148) (bvsub lt!18149 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!72 lt!18144))))

(declare-fun lt!18178 () Unit!970)

(assert (=> b!11470 (= lt!18178 lt!18147)))

(declare-fun lt!18137 () Unit!970)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!665 array!665 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!970)

(assert (=> b!11470 (= lt!18137 (arrayBitRangesEqImpliesEq!0 (buf!632 (_2!744 lt!18151)) (buf!632 (_2!744 lt!18157)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!18168 (bitIndex!0 (size!287 (buf!632 (_2!744 lt!18151))) (currentByte!1704 (_2!744 lt!18151)) (currentBit!1699 (_2!744 lt!18151)))))))

(declare-fun bitAt!0 (array!665 (_ BitVec 64)) Bool)

(assert (=> b!11470 (= (bitAt!0 (buf!632 (_2!744 lt!18151)) lt!18168) (bitAt!0 (buf!632 (_2!744 lt!18157)) lt!18168))))

(declare-fun lt!18155 () Unit!970)

(assert (=> b!11470 (= lt!18155 lt!18137)))

(declare-fun b!11471 () Bool)

(declare-fun res!11220 () Bool)

(assert (=> b!11471 (=> (not res!11220) (not e!6996))))

(assert (=> b!11471 (= res!11220 (isPrefixOf!0 thiss!1486 (_2!744 lt!18143)))))

(declare-fun bm!209 () Bool)

(assert (=> bm!209 (= call!212 (reader!0 thiss!1486 (ite c!797 (_2!744 lt!18157) thiss!1486)))))

(declare-fun b!11472 () Bool)

(declare-fun res!11218 () Bool)

(assert (=> b!11472 (=> (not res!11218) (not e!6996))))

(assert (=> b!11472 (= res!11218 (= (size!287 (buf!632 (_2!744 lt!18143))) (size!287 (buf!632 thiss!1486))))))

(declare-fun b!11473 () Bool)

(declare-fun res!11221 () Bool)

(assert (=> b!11473 (=> (not res!11221) (not e!6996))))

(assert (=> b!11473 (= res!11221 (= (size!287 (buf!632 thiss!1486)) (size!287 (buf!632 (_2!744 lt!18143)))))))

(declare-fun b!11474 () Bool)

(assert (=> b!11474 (= e!6994 (validate_offset_bits!1 ((_ sign_extend 32) (size!287 (buf!632 thiss!1486))) ((_ sign_extend 32) (currentByte!1704 thiss!1486)) ((_ sign_extend 32) (currentBit!1699 thiss!1486)) lt!18136))))

(assert (= (and d!3496 c!797) b!11470))

(assert (= (and d!3496 (not c!797)) b!11467))

(assert (= (or b!11470 b!11467) bm!209))

(assert (= (and d!3496 res!11219) b!11469))

(assert (= (and b!11469 res!11222) b!11473))

(assert (= (and b!11473 res!11221) b!11471))

(assert (= (and b!11471 res!11220) b!11472))

(assert (= (and b!11472 res!11218) b!11468))

(assert (= (and b!11468 res!11223) b!11474))

(declare-fun m!16735 () Bool)

(assert (=> bm!209 m!16735))

(declare-fun m!16737 () Bool)

(assert (=> d!3496 m!16737))

(assert (=> d!3496 m!16479))

(declare-fun m!16739 () Bool)

(assert (=> d!3496 m!16739))

(declare-fun m!16741 () Bool)

(assert (=> d!3496 m!16741))

(declare-fun m!16743 () Bool)

(assert (=> b!11468 m!16743))

(declare-fun m!16745 () Bool)

(assert (=> b!11468 m!16745))

(declare-fun m!16747 () Bool)

(assert (=> b!11468 m!16747))

(declare-fun m!16749 () Bool)

(assert (=> b!11468 m!16749))

(declare-fun m!16751 () Bool)

(assert (=> b!11468 m!16751))

(declare-fun m!16753 () Bool)

(assert (=> b!11471 m!16753))

(declare-fun m!16755 () Bool)

(assert (=> b!11470 m!16755))

(declare-fun m!16757 () Bool)

(assert (=> b!11470 m!16757))

(declare-fun m!16759 () Bool)

(assert (=> b!11470 m!16759))

(declare-fun m!16761 () Bool)

(assert (=> b!11470 m!16761))

(declare-fun m!16763 () Bool)

(assert (=> b!11470 m!16763))

(declare-fun m!16765 () Bool)

(assert (=> b!11470 m!16765))

(declare-fun m!16767 () Bool)

(assert (=> b!11470 m!16767))

(declare-fun m!16769 () Bool)

(assert (=> b!11470 m!16769))

(declare-fun m!16771 () Bool)

(assert (=> b!11470 m!16771))

(declare-fun m!16773 () Bool)

(assert (=> b!11470 m!16773))

(declare-fun m!16775 () Bool)

(assert (=> b!11470 m!16775))

(declare-fun m!16777 () Bool)

(assert (=> b!11470 m!16777))

(declare-fun m!16779 () Bool)

(assert (=> b!11470 m!16779))

(declare-fun m!16781 () Bool)

(assert (=> b!11470 m!16781))

(declare-fun m!16783 () Bool)

(assert (=> b!11470 m!16783))

(declare-fun m!16785 () Bool)

(assert (=> b!11470 m!16785))

(declare-fun m!16787 () Bool)

(assert (=> b!11470 m!16787))

(assert (=> b!11470 m!16775))

(declare-fun m!16789 () Bool)

(assert (=> b!11470 m!16789))

(declare-fun m!16791 () Bool)

(assert (=> b!11470 m!16791))

(declare-fun m!16793 () Bool)

(assert (=> b!11470 m!16793))

(declare-fun m!16795 () Bool)

(assert (=> b!11470 m!16795))

(assert (=> b!11470 m!16479))

(assert (=> b!11470 m!16791))

(declare-fun m!16797 () Bool)

(assert (=> b!11470 m!16797))

(declare-fun m!16799 () Bool)

(assert (=> b!11470 m!16799))

(assert (=> b!11470 m!16771))

(declare-fun m!16801 () Bool)

(assert (=> b!11470 m!16801))

(declare-fun m!16803 () Bool)

(assert (=> b!11470 m!16803))

(assert (=> b!11470 m!16793))

(declare-fun m!16805 () Bool)

(assert (=> b!11470 m!16805))

(declare-fun m!16807 () Bool)

(assert (=> b!11470 m!16807))

(declare-fun m!16809 () Bool)

(assert (=> b!11470 m!16809))

(declare-fun m!16811 () Bool)

(assert (=> b!11470 m!16811))

(declare-fun m!16813 () Bool)

(assert (=> b!11470 m!16813))

(declare-fun m!16815 () Bool)

(assert (=> b!11470 m!16815))

(declare-fun m!16817 () Bool)

(assert (=> b!11469 m!16817))

(declare-fun m!16819 () Bool)

(assert (=> b!11474 m!16819))

(declare-fun m!16821 () Bool)

(assert (=> b!11467 m!16821))

(declare-fun m!16823 () Bool)

(assert (=> b!11467 m!16823))

(assert (=> b!11291 d!3496))

(declare-fun d!3510 () Bool)

(assert (=> d!3510 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!287 (buf!632 (_2!744 lt!17700)))) ((_ sign_extend 32) (currentByte!1704 thiss!1486)) ((_ sign_extend 32) (currentBit!1699 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!287 (buf!632 (_2!744 lt!17700)))) ((_ sign_extend 32) (currentByte!1704 thiss!1486)) ((_ sign_extend 32) (currentBit!1699 thiss!1486))) nBits!460))))

(declare-fun bs!1032 () Bool)

(assert (= bs!1032 d!3510))

(declare-fun m!16825 () Bool)

(assert (=> bs!1032 m!16825))

(assert (=> b!11296 d!3510))

(declare-fun e!7023 () Bool)

(declare-fun b!11547 () Bool)

(declare-fun lt!18383 () tuple2!1400)

(assert (=> b!11547 (= e!7023 (= (byteArrayBitContentToList!0 (_2!746 lt!18383) (_1!746 lt!18383) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bitStreamReadBitsIntoList!0 (_2!746 lt!18383) (_1!745 lt!17697) nBits!460)))))

(declare-fun b!11548 () Bool)

(declare-fun res!11290 () Bool)

(assert (=> b!11548 (=> (not res!11290) (not e!7023))))

(assert (=> b!11548 (= res!11290 (bvsle (currentByte!1704 (_1!745 lt!17697)) (currentByte!1704 (_2!746 lt!18383))))))

(declare-fun b!11549 () Bool)

(declare-fun res!11289 () Bool)

(assert (=> b!11549 (=> (not res!11289) (not e!7023))))

(declare-fun lt!18388 () (_ BitVec 64))

(assert (=> b!11549 (= res!11289 (= (bvadd lt!18388 nBits!460) (bitIndex!0 (size!287 (buf!632 (_2!746 lt!18383))) (currentByte!1704 (_2!746 lt!18383)) (currentBit!1699 (_2!746 lt!18383)))))))

(assert (=> b!11549 (or (not (= (bvand lt!18388 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!18388 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!18388 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!11549 (= lt!18388 (bitIndex!0 (size!287 (buf!632 (_1!745 lt!17697))) (currentByte!1704 (_1!745 lt!17697)) (currentBit!1699 (_1!745 lt!17697))))))

(declare-fun b!11550 () Bool)

(declare-fun res!11292 () Bool)

(assert (=> b!11550 (=> (not res!11292) (not e!7023))))

(assert (=> b!11550 (= res!11292 (invariant!0 (currentBit!1699 (_2!746 lt!18383)) (currentByte!1704 (_2!746 lt!18383)) (size!287 (buf!632 (_2!746 lt!18383)))))))

(declare-fun d!3512 () Bool)

(assert (=> d!3512 e!7023))

(declare-fun res!11291 () Bool)

(assert (=> d!3512 (=> (not res!11291) (not e!7023))))

(assert (=> d!3512 (= res!11291 (= (buf!632 (_2!746 lt!18383)) (buf!632 (_1!745 lt!17697))))))

(declare-datatypes ((tuple3!88 0))(
  ( (tuple3!89 (_1!755 Unit!970) (_2!755 BitStream!540) (_3!47 array!665)) )
))
(declare-fun lt!18384 () tuple3!88)

(assert (=> d!3512 (= lt!18383 (tuple2!1401 (_3!47 lt!18384) (_2!755 lt!18384)))))

(declare-fun readBitsLoop!0 (BitStream!540 (_ BitVec 64) array!665 (_ BitVec 64) (_ BitVec 64)) tuple3!88)

(assert (=> d!3512 (= lt!18384 (readBitsLoop!0 (_1!745 lt!17697) nBits!460 (array!666 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!3512 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bvsle nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!3512 (= (readBits!0 (_1!745 lt!17697) nBits!460) lt!18383)))

(declare-fun b!11551 () Bool)

(declare-fun res!11288 () Bool)

(assert (=> b!11551 (=> (not res!11288) (not e!7023))))

(declare-fun lt!18385 () (_ BitVec 64))

(assert (=> b!11551 (= res!11288 (= (size!287 (_1!746 lt!18383)) ((_ extract 31 0) lt!18385)))))

(assert (=> b!11551 (and (bvslt lt!18385 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!18385 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!18382 () (_ BitVec 64))

(declare-fun lt!18389 () (_ BitVec 64))

(assert (=> b!11551 (= lt!18385 (bvsdiv lt!18382 lt!18389))))

(assert (=> b!11551 (and (not (= lt!18389 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!18382 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!18389 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!11551 (= lt!18389 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!18387 () (_ BitVec 64))

(declare-fun lt!18381 () (_ BitVec 64))

(assert (=> b!11551 (= lt!18382 (bvsub lt!18387 lt!18381))))

(assert (=> b!11551 (or (= (bvand lt!18387 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!18381 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!18387 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!18387 lt!18381) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!11551 (= lt!18381 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!18386 () (_ BitVec 64))

(assert (=> b!11551 (= lt!18387 (bvadd nBits!460 lt!18386))))

(assert (=> b!11551 (or (not (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!18386 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!460 lt!18386) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!11551 (= lt!18386 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (= (and d!3512 res!11291) b!11549))

(assert (= (and b!11549 res!11289) b!11550))

(assert (= (and b!11550 res!11292) b!11551))

(assert (= (and b!11551 res!11288) b!11548))

(assert (= (and b!11548 res!11290) b!11547))

(declare-fun m!16949 () Bool)

(assert (=> b!11547 m!16949))

(declare-fun m!16955 () Bool)

(assert (=> b!11547 m!16955))

(declare-fun m!16959 () Bool)

(assert (=> b!11549 m!16959))

(declare-fun m!16961 () Bool)

(assert (=> b!11549 m!16961))

(declare-fun m!16963 () Bool)

(assert (=> b!11550 m!16963))

(declare-fun m!16965 () Bool)

(assert (=> d!3512 m!16965))

(assert (=> b!11296 d!3512))

(declare-fun d!3532 () Bool)

(assert (=> d!3532 (validate_offset_bits!1 ((_ sign_extend 32) (size!287 (buf!632 (_2!744 lt!17700)))) ((_ sign_extend 32) (currentByte!1704 thiss!1486)) ((_ sign_extend 32) (currentBit!1699 thiss!1486)) nBits!460)))

(declare-fun lt!18394 () Unit!970)

(declare-fun choose!9 (BitStream!540 array!665 (_ BitVec 64) BitStream!540) Unit!970)

(assert (=> d!3532 (= lt!18394 (choose!9 thiss!1486 (buf!632 (_2!744 lt!17700)) nBits!460 (BitStream!541 (buf!632 (_2!744 lt!17700)) (currentByte!1704 thiss!1486) (currentBit!1699 thiss!1486))))))

(assert (=> d!3532 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!632 (_2!744 lt!17700)) nBits!460) lt!18394)))

(declare-fun bs!1036 () Bool)

(assert (= bs!1036 d!3532))

(assert (=> bs!1036 m!16505))

(declare-fun m!16975 () Bool)

(assert (=> bs!1036 m!16975))

(assert (=> b!11296 d!3532))

(declare-fun b!11589 () Bool)

(declare-fun e!7047 () Unit!970)

(declare-fun lt!18476 () Unit!970)

(assert (=> b!11589 (= e!7047 lt!18476)))

(declare-fun lt!18466 () (_ BitVec 64))

(assert (=> b!11589 (= lt!18466 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!18472 () (_ BitVec 64))

(assert (=> b!11589 (= lt!18472 (bitIndex!0 (size!287 (buf!632 thiss!1486)) (currentByte!1704 thiss!1486) (currentBit!1699 thiss!1486)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!665 array!665 (_ BitVec 64) (_ BitVec 64)) Unit!970)

(assert (=> b!11589 (= lt!18476 (arrayBitRangesEqSymmetric!0 (buf!632 thiss!1486) (buf!632 (_2!744 lt!17700)) lt!18466 lt!18472))))

(assert (=> b!11589 (arrayBitRangesEq!0 (buf!632 (_2!744 lt!17700)) (buf!632 thiss!1486) lt!18466 lt!18472)))

(declare-fun lt!18471 () (_ BitVec 64))

(declare-fun e!7048 () Bool)

(declare-fun b!11590 () Bool)

(declare-fun lt!18475 () tuple2!1398)

(declare-fun lt!18473 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!540 (_ BitVec 64)) BitStream!540)

(assert (=> b!11590 (= e!7048 (= (_1!745 lt!18475) (withMovedBitIndex!0 (_2!745 lt!18475) (bvsub lt!18473 lt!18471))))))

(assert (=> b!11590 (or (= (bvand lt!18473 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!18471 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!18473 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!18473 lt!18471) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!11590 (= lt!18471 (bitIndex!0 (size!287 (buf!632 (_2!744 lt!17700))) (currentByte!1704 (_2!744 lt!17700)) (currentBit!1699 (_2!744 lt!17700))))))

(assert (=> b!11590 (= lt!18473 (bitIndex!0 (size!287 (buf!632 thiss!1486)) (currentByte!1704 thiss!1486) (currentBit!1699 thiss!1486)))))

(declare-fun b!11591 () Bool)

(declare-fun Unit!997 () Unit!970)

(assert (=> b!11591 (= e!7047 Unit!997)))

(declare-fun b!11592 () Bool)

(declare-fun res!11326 () Bool)

(assert (=> b!11592 (=> (not res!11326) (not e!7048))))

(assert (=> b!11592 (= res!11326 (isPrefixOf!0 (_2!745 lt!18475) (_2!744 lt!17700)))))

(declare-fun d!3540 () Bool)

(assert (=> d!3540 e!7048))

(declare-fun res!11325 () Bool)

(assert (=> d!3540 (=> (not res!11325) (not e!7048))))

(assert (=> d!3540 (= res!11325 (isPrefixOf!0 (_1!745 lt!18475) (_2!745 lt!18475)))))

(declare-fun lt!18467 () BitStream!540)

(assert (=> d!3540 (= lt!18475 (tuple2!1399 lt!18467 (_2!744 lt!17700)))))

(declare-fun lt!18478 () Unit!970)

(declare-fun lt!18481 () Unit!970)

(assert (=> d!3540 (= lt!18478 lt!18481)))

(assert (=> d!3540 (isPrefixOf!0 lt!18467 (_2!744 lt!17700))))

(assert (=> d!3540 (= lt!18481 (lemmaIsPrefixTransitive!0 lt!18467 (_2!744 lt!17700) (_2!744 lt!17700)))))

(declare-fun lt!18477 () Unit!970)

(declare-fun lt!18482 () Unit!970)

(assert (=> d!3540 (= lt!18477 lt!18482)))

(assert (=> d!3540 (isPrefixOf!0 lt!18467 (_2!744 lt!17700))))

(assert (=> d!3540 (= lt!18482 (lemmaIsPrefixTransitive!0 lt!18467 thiss!1486 (_2!744 lt!17700)))))

(declare-fun lt!18470 () Unit!970)

(assert (=> d!3540 (= lt!18470 e!7047)))

(declare-fun c!805 () Bool)

(assert (=> d!3540 (= c!805 (not (= (size!287 (buf!632 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!18469 () Unit!970)

(declare-fun lt!18463 () Unit!970)

(assert (=> d!3540 (= lt!18469 lt!18463)))

(assert (=> d!3540 (isPrefixOf!0 (_2!744 lt!17700) (_2!744 lt!17700))))

(assert (=> d!3540 (= lt!18463 (lemmaIsPrefixRefl!0 (_2!744 lt!17700)))))

(declare-fun lt!18464 () Unit!970)

(declare-fun lt!18468 () Unit!970)

(assert (=> d!3540 (= lt!18464 lt!18468)))

(assert (=> d!3540 (= lt!18468 (lemmaIsPrefixRefl!0 (_2!744 lt!17700)))))

(declare-fun lt!18474 () Unit!970)

(declare-fun lt!18465 () Unit!970)

(assert (=> d!3540 (= lt!18474 lt!18465)))

(assert (=> d!3540 (isPrefixOf!0 lt!18467 lt!18467)))

(assert (=> d!3540 (= lt!18465 (lemmaIsPrefixRefl!0 lt!18467))))

(declare-fun lt!18480 () Unit!970)

(declare-fun lt!18479 () Unit!970)

(assert (=> d!3540 (= lt!18480 lt!18479)))

(assert (=> d!3540 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!3540 (= lt!18479 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!3540 (= lt!18467 (BitStream!541 (buf!632 (_2!744 lt!17700)) (currentByte!1704 thiss!1486) (currentBit!1699 thiss!1486)))))

(assert (=> d!3540 (isPrefixOf!0 thiss!1486 (_2!744 lt!17700))))

(assert (=> d!3540 (= (reader!0 thiss!1486 (_2!744 lt!17700)) lt!18475)))

(declare-fun b!11593 () Bool)

(declare-fun res!11324 () Bool)

(assert (=> b!11593 (=> (not res!11324) (not e!7048))))

(assert (=> b!11593 (= res!11324 (isPrefixOf!0 (_1!745 lt!18475) thiss!1486))))

(assert (= (and d!3540 c!805) b!11589))

(assert (= (and d!3540 (not c!805)) b!11591))

(assert (= (and d!3540 res!11325) b!11593))

(assert (= (and b!11593 res!11324) b!11592))

(assert (= (and b!11592 res!11326) b!11590))

(assert (=> b!11589 m!16479))

(declare-fun m!16989 () Bool)

(assert (=> b!11589 m!16989))

(declare-fun m!16991 () Bool)

(assert (=> b!11589 m!16991))

(declare-fun m!16993 () Bool)

(assert (=> b!11593 m!16993))

(declare-fun m!16995 () Bool)

(assert (=> d!3540 m!16995))

(assert (=> d!3540 m!16471))

(assert (=> d!3540 m!16739))

(declare-fun m!16997 () Bool)

(assert (=> d!3540 m!16997))

(declare-fun m!16999 () Bool)

(assert (=> d!3540 m!16999))

(declare-fun m!17001 () Bool)

(assert (=> d!3540 m!17001))

(declare-fun m!17003 () Bool)

(assert (=> d!3540 m!17003))

(assert (=> d!3540 m!16741))

(declare-fun m!17005 () Bool)

(assert (=> d!3540 m!17005))

(declare-fun m!17007 () Bool)

(assert (=> d!3540 m!17007))

(declare-fun m!17009 () Bool)

(assert (=> d!3540 m!17009))

(declare-fun m!17011 () Bool)

(assert (=> b!11590 m!17011))

(assert (=> b!11590 m!16477))

(assert (=> b!11590 m!16479))

(declare-fun m!17013 () Bool)

(assert (=> b!11592 m!17013))

(assert (=> b!11296 d!3540))

(declare-fun d!3556 () Bool)

(declare-fun c!808 () Bool)

(assert (=> d!3556 (= c!808 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!7051 () List!166)

(assert (=> d!3556 (= (byteArrayBitContentToList!0 (_2!744 lt!17700) (_1!746 lt!17701) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!7051)))

(declare-fun b!11598 () Bool)

(assert (=> b!11598 (= e!7051 Nil!163)))

(declare-fun b!11599 () Bool)

(assert (=> b!11599 (= e!7051 (Cons!162 (not (= (bvand ((_ sign_extend 24) (select (arr!707 (_1!746 lt!17701)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!744 lt!17700) (_1!746 lt!17701) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!3556 c!808) b!11598))

(assert (= (and d!3556 (not c!808)) b!11599))

(declare-fun m!17015 () Bool)

(assert (=> b!11599 m!17015))

(declare-fun m!17017 () Bool)

(assert (=> b!11599 m!17017))

(declare-fun m!17019 () Bool)

(assert (=> b!11599 m!17019))

(assert (=> b!11296 d!3556))

(declare-fun d!3558 () Bool)

(declare-fun e!7057 () Bool)

(assert (=> d!3558 e!7057))

(declare-fun c!813 () Bool)

(assert (=> d!3558 (= c!813 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!18490 () List!166)

(declare-datatypes ((tuple2!1416 0))(
  ( (tuple2!1417 (_1!757 List!166) (_2!757 BitStream!540)) )
))
(declare-fun e!7056 () tuple2!1416)

(assert (=> d!3558 (= lt!18490 (_1!757 e!7056))))

(declare-fun c!814 () Bool)

(assert (=> d!3558 (= c!814 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3558 (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3558 (= (bitStreamReadBitsIntoList!0 (_2!744 lt!17700) (_1!745 lt!17697) nBits!460) lt!18490)))

(declare-fun b!11608 () Bool)

(assert (=> b!11608 (= e!7056 (tuple2!1417 Nil!163 (_1!745 lt!17697)))))

(declare-fun b!11611 () Bool)

(declare-fun length!34 (List!166) Int)

(assert (=> b!11611 (= e!7057 (> (length!34 lt!18490) 0))))

(declare-fun b!11610 () Bool)

(declare-fun isEmpty!39 (List!166) Bool)

(assert (=> b!11610 (= e!7057 (isEmpty!39 lt!18490))))

(declare-fun b!11609 () Bool)

(declare-datatypes ((tuple2!1418 0))(
  ( (tuple2!1419 (_1!758 Bool) (_2!758 BitStream!540)) )
))
(declare-fun lt!18491 () tuple2!1418)

(declare-fun lt!18489 () (_ BitVec 64))

(assert (=> b!11609 (= e!7056 (tuple2!1417 (Cons!162 (_1!758 lt!18491) (bitStreamReadBitsIntoList!0 (_2!744 lt!17700) (_2!758 lt!18491) (bvsub nBits!460 lt!18489))) (_2!758 lt!18491)))))

(declare-fun readBit!0 (BitStream!540) tuple2!1418)

(assert (=> b!11609 (= lt!18491 (readBit!0 (_1!745 lt!17697)))))

(assert (=> b!11609 (= lt!18489 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!3558 c!814) b!11608))

(assert (= (and d!3558 (not c!814)) b!11609))

(assert (= (and d!3558 c!813) b!11610))

(assert (= (and d!3558 (not c!813)) b!11611))

(declare-fun m!17021 () Bool)

(assert (=> b!11611 m!17021))

(declare-fun m!17023 () Bool)

(assert (=> b!11610 m!17023))

(declare-fun m!17025 () Bool)

(assert (=> b!11609 m!17025))

(declare-fun m!17027 () Bool)

(assert (=> b!11609 m!17027))

(assert (=> b!11296 d!3558))

(declare-fun d!3560 () Bool)

(declare-fun c!815 () Bool)

(assert (=> d!3560 (= c!815 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!7058 () List!166)

(assert (=> d!3560 (= (byteArrayBitContentToList!0 (_2!744 lt!17700) srcBuffer!6 from!367 nBits!460) e!7058)))

(declare-fun b!11612 () Bool)

(assert (=> b!11612 (= e!7058 Nil!163)))

(declare-fun b!11613 () Bool)

(assert (=> b!11613 (= e!7058 (Cons!162 (not (= (bvand ((_ sign_extend 24) (select (arr!707 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!744 lt!17700) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!3560 c!815) b!11612))

(assert (= (and d!3560 (not c!815)) b!11613))

(assert (=> b!11613 m!16793))

(declare-fun m!17029 () Bool)

(assert (=> b!11613 m!17029))

(declare-fun m!17031 () Bool)

(assert (=> b!11613 m!17031))

(assert (=> b!11297 d!3560))

(declare-fun d!3562 () Bool)

(assert (=> d!3562 (= (inv!12 (BitStream!541 (buf!632 (_1!745 lt!17697)) (currentByte!1704 (_1!745 lt!17697)) (currentBit!1699 (_2!746 lt!17701)))) (invariant!0 (currentBit!1699 (BitStream!541 (buf!632 (_1!745 lt!17697)) (currentByte!1704 (_1!745 lt!17697)) (currentBit!1699 (_2!746 lt!17701)))) (currentByte!1704 (BitStream!541 (buf!632 (_1!745 lt!17697)) (currentByte!1704 (_1!745 lt!17697)) (currentBit!1699 (_2!746 lt!17701)))) (size!287 (buf!632 (BitStream!541 (buf!632 (_1!745 lt!17697)) (currentByte!1704 (_1!745 lt!17697)) (currentBit!1699 (_2!746 lt!17701)))))))))

(declare-fun bs!1040 () Bool)

(assert (= bs!1040 d!3562))

(declare-fun m!17033 () Bool)

(assert (=> bs!1040 m!17033))

(assert (=> b!11292 d!3562))

(declare-fun d!3564 () Bool)

(assert (=> d!3564 (= (array_inv!279 (buf!632 thiss!1486)) (bvsge (size!287 (buf!632 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!11293 d!3564))

(declare-fun d!3566 () Bool)

(declare-fun res!11331 () Bool)

(declare-fun e!7063 () Bool)

(assert (=> d!3566 (=> res!11331 e!7063)))

(assert (=> d!3566 (= res!11331 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3566 (= (checkByteArrayBitContent!0 (_2!744 lt!17700) srcBuffer!6 (_1!746 lt!17701) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!7063)))

(declare-fun b!11618 () Bool)

(declare-fun e!7064 () Bool)

(assert (=> b!11618 (= e!7063 e!7064)))

(declare-fun res!11332 () Bool)

(assert (=> b!11618 (=> (not res!11332) (not e!7064))))

(assert (=> b!11618 (= res!11332 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!707 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!707 (_1!746 lt!17701)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!11619 () Bool)

(assert (=> b!11619 (= e!7064 (checkByteArrayBitContent!0 (_2!744 lt!17700) srcBuffer!6 (_1!746 lt!17701) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!3566 (not res!11331)) b!11618))

(assert (= (and b!11618 res!11332) b!11619))

(assert (=> b!11618 m!16793))

(assert (=> b!11618 m!17029))

(assert (=> b!11618 m!17015))

(assert (=> b!11618 m!17017))

(declare-fun m!17035 () Bool)

(assert (=> b!11619 m!17035))

(assert (=> b!11298 d!3566))

(declare-fun d!3568 () Bool)

(assert (=> d!3568 (checkByteArrayBitContent!0 (_2!744 lt!17700) srcBuffer!6 (_1!746 lt!17701) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460)))

(declare-fun lt!18494 () Unit!970)

(declare-fun choose!65 (BitStream!540 array!665 array!665 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!970)

(assert (=> d!3568 (= lt!18494 (choose!65 (_2!744 lt!17700) srcBuffer!6 (_1!746 lt!17701) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!3568 (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3568 (= (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!744 lt!17700) srcBuffer!6 (_1!746 lt!17701) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!18494)))

(declare-fun bs!1041 () Bool)

(assert (= bs!1041 d!3568))

(assert (=> bs!1041 m!16489))

(declare-fun m!17037 () Bool)

(assert (=> bs!1041 m!17037))

(assert (=> b!11298 d!3568))

(declare-fun d!3570 () Bool)

(assert (=> d!3570 (= (array_inv!279 srcBuffer!6) (bvsge (size!287 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!2374 d!3570))

(declare-fun d!3572 () Bool)

(assert (=> d!3572 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1699 thiss!1486) (currentByte!1704 thiss!1486) (size!287 (buf!632 thiss!1486))))))

(declare-fun bs!1042 () Bool)

(assert (= bs!1042 d!3572))

(assert (=> bs!1042 m!16613))

(assert (=> start!2374 d!3572))

(check-sat (not b!11599) (not d!3512) (not b!11611) (not b!11610) (not b!11387) (not b!11468) (not b!11589) (not b!11609) (not d!3510) (not b!11590) (not b!11593) (not b!11613) (not b!11547) (not b!11389) (not b!11592) (not d!3572) (not b!11467) (not d!3486) (not b!11474) (not d!3540) (not d!3496) (not b!11550) (not d!3562) (not d!3488) (not b!11469) (not d!3532) (not d!3492) (not d!3568) (not b!11619) (not b!11470) (not b!11549) (not bm!209) (not b!11471))
(check-sat)
(get-model)

(declare-fun d!3574 () Bool)

(declare-fun e!7065 () Bool)

(assert (=> d!3574 e!7065))

(declare-fun res!11333 () Bool)

(assert (=> d!3574 (=> (not res!11333) (not e!7065))))

(declare-fun lt!18497 () (_ BitVec 64))

(declare-fun lt!18500 () (_ BitVec 64))

(declare-fun lt!18495 () (_ BitVec 64))

(assert (=> d!3574 (= res!11333 (= lt!18500 (bvsub lt!18497 lt!18495)))))

(assert (=> d!3574 (or (= (bvand lt!18497 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!18495 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!18497 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!18497 lt!18495) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3574 (= lt!18495 (remainingBits!0 ((_ sign_extend 32) (size!287 (buf!632 (_2!746 lt!18383)))) ((_ sign_extend 32) (currentByte!1704 (_2!746 lt!18383))) ((_ sign_extend 32) (currentBit!1699 (_2!746 lt!18383)))))))

(declare-fun lt!18498 () (_ BitVec 64))

(declare-fun lt!18496 () (_ BitVec 64))

(assert (=> d!3574 (= lt!18497 (bvmul lt!18498 lt!18496))))

(assert (=> d!3574 (or (= lt!18498 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!18496 (bvsdiv (bvmul lt!18498 lt!18496) lt!18498)))))

(assert (=> d!3574 (= lt!18496 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!3574 (= lt!18498 ((_ sign_extend 32) (size!287 (buf!632 (_2!746 lt!18383)))))))

(assert (=> d!3574 (= lt!18500 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1704 (_2!746 lt!18383))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1699 (_2!746 lt!18383)))))))

(assert (=> d!3574 (invariant!0 (currentBit!1699 (_2!746 lt!18383)) (currentByte!1704 (_2!746 lt!18383)) (size!287 (buf!632 (_2!746 lt!18383))))))

(assert (=> d!3574 (= (bitIndex!0 (size!287 (buf!632 (_2!746 lt!18383))) (currentByte!1704 (_2!746 lt!18383)) (currentBit!1699 (_2!746 lt!18383))) lt!18500)))

(declare-fun b!11620 () Bool)

(declare-fun res!11334 () Bool)

(assert (=> b!11620 (=> (not res!11334) (not e!7065))))

(assert (=> b!11620 (= res!11334 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!18500))))

(declare-fun b!11621 () Bool)

(declare-fun lt!18499 () (_ BitVec 64))

(assert (=> b!11621 (= e!7065 (bvsle lt!18500 (bvmul lt!18499 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!11621 (or (= lt!18499 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!18499 #b0000000000000000000000000000000000000000000000000000000000001000) lt!18499)))))

(assert (=> b!11621 (= lt!18499 ((_ sign_extend 32) (size!287 (buf!632 (_2!746 lt!18383)))))))

(assert (= (and d!3574 res!11333) b!11620))

(assert (= (and b!11620 res!11334) b!11621))

(declare-fun m!17039 () Bool)

(assert (=> d!3574 m!17039))

(assert (=> d!3574 m!16963))

(assert (=> b!11549 d!3574))

(declare-fun d!3576 () Bool)

(declare-fun e!7066 () Bool)

(assert (=> d!3576 e!7066))

(declare-fun res!11335 () Bool)

(assert (=> d!3576 (=> (not res!11335) (not e!7066))))

(declare-fun lt!18503 () (_ BitVec 64))

(declare-fun lt!18506 () (_ BitVec 64))

(declare-fun lt!18501 () (_ BitVec 64))

(assert (=> d!3576 (= res!11335 (= lt!18506 (bvsub lt!18503 lt!18501)))))

(assert (=> d!3576 (or (= (bvand lt!18503 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!18501 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!18503 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!18503 lt!18501) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3576 (= lt!18501 (remainingBits!0 ((_ sign_extend 32) (size!287 (buf!632 (_1!745 lt!17697)))) ((_ sign_extend 32) (currentByte!1704 (_1!745 lt!17697))) ((_ sign_extend 32) (currentBit!1699 (_1!745 lt!17697)))))))

(declare-fun lt!18504 () (_ BitVec 64))

(declare-fun lt!18502 () (_ BitVec 64))

(assert (=> d!3576 (= lt!18503 (bvmul lt!18504 lt!18502))))

(assert (=> d!3576 (or (= lt!18504 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!18502 (bvsdiv (bvmul lt!18504 lt!18502) lt!18504)))))

(assert (=> d!3576 (= lt!18502 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!3576 (= lt!18504 ((_ sign_extend 32) (size!287 (buf!632 (_1!745 lt!17697)))))))

(assert (=> d!3576 (= lt!18506 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1704 (_1!745 lt!17697))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1699 (_1!745 lt!17697)))))))

(assert (=> d!3576 (invariant!0 (currentBit!1699 (_1!745 lt!17697)) (currentByte!1704 (_1!745 lt!17697)) (size!287 (buf!632 (_1!745 lt!17697))))))

(assert (=> d!3576 (= (bitIndex!0 (size!287 (buf!632 (_1!745 lt!17697))) (currentByte!1704 (_1!745 lt!17697)) (currentBit!1699 (_1!745 lt!17697))) lt!18506)))

(declare-fun b!11622 () Bool)

(declare-fun res!11336 () Bool)

(assert (=> b!11622 (=> (not res!11336) (not e!7066))))

(assert (=> b!11622 (= res!11336 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!18506))))

(declare-fun b!11623 () Bool)

(declare-fun lt!18505 () (_ BitVec 64))

(assert (=> b!11623 (= e!7066 (bvsle lt!18506 (bvmul lt!18505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!11623 (or (= lt!18505 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!18505 #b0000000000000000000000000000000000000000000000000000000000001000) lt!18505)))))

(assert (=> b!11623 (= lt!18505 ((_ sign_extend 32) (size!287 (buf!632 (_1!745 lt!17697)))))))

(assert (= (and d!3576 res!11335) b!11622))

(assert (= (and b!11622 res!11336) b!11623))

(declare-fun m!17041 () Bool)

(assert (=> d!3576 m!17041))

(declare-fun m!17043 () Bool)

(assert (=> d!3576 m!17043))

(assert (=> b!11549 d!3576))

(declare-fun d!3578 () Bool)

(declare-fun res!11337 () Bool)

(declare-fun e!7067 () Bool)

(assert (=> d!3578 (=> res!11337 e!7067)))

(assert (=> d!3578 (= res!11337 (= (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3578 (= (checkByteArrayBitContent!0 (_2!744 lt!17700) srcBuffer!6 (_1!746 lt!17701) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001)) e!7067)))

(declare-fun b!11624 () Bool)

(declare-fun e!7068 () Bool)

(assert (=> b!11624 (= e!7067 e!7068)))

(declare-fun res!11338 () Bool)

(assert (=> b!11624 (=> (not res!11338) (not e!7068))))

(assert (=> b!11624 (= res!11338 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!707 srcBuffer!6) ((_ extract 31 0) (bvsdiv (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!707 (_1!746 lt!17701)) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!11625 () Bool)

(assert (=> b!11625 (= e!7068 (checkByteArrayBitContent!0 (_2!744 lt!17700) srcBuffer!6 (_1!746 lt!17701) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!3578 (not res!11337)) b!11624))

(assert (= (and b!11624 res!11338) b!11625))

(declare-fun m!17045 () Bool)

(assert (=> b!11624 m!17045))

(declare-fun m!17047 () Bool)

(assert (=> b!11624 m!17047))

(declare-fun m!17049 () Bool)

(assert (=> b!11624 m!17049))

(declare-fun m!17051 () Bool)

(assert (=> b!11624 m!17051))

(declare-fun m!17053 () Bool)

(assert (=> b!11625 m!17053))

(assert (=> b!11619 d!3578))

(declare-fun d!3580 () Bool)

(declare-fun res!11341 () Bool)

(declare-fun e!7070 () Bool)

(assert (=> d!3580 (=> (not res!11341) (not e!7070))))

(assert (=> d!3580 (= res!11341 (= (size!287 (buf!632 (_1!745 lt!18475))) (size!287 (buf!632 thiss!1486))))))

(assert (=> d!3580 (= (isPrefixOf!0 (_1!745 lt!18475) thiss!1486) e!7070)))

(declare-fun b!11626 () Bool)

(declare-fun res!11340 () Bool)

(assert (=> b!11626 (=> (not res!11340) (not e!7070))))

(assert (=> b!11626 (= res!11340 (bvsle (bitIndex!0 (size!287 (buf!632 (_1!745 lt!18475))) (currentByte!1704 (_1!745 lt!18475)) (currentBit!1699 (_1!745 lt!18475))) (bitIndex!0 (size!287 (buf!632 thiss!1486)) (currentByte!1704 thiss!1486) (currentBit!1699 thiss!1486))))))

(declare-fun b!11627 () Bool)

(declare-fun e!7069 () Bool)

(assert (=> b!11627 (= e!7070 e!7069)))

(declare-fun res!11339 () Bool)

(assert (=> b!11627 (=> res!11339 e!7069)))

(assert (=> b!11627 (= res!11339 (= (size!287 (buf!632 (_1!745 lt!18475))) #b00000000000000000000000000000000))))

(declare-fun b!11628 () Bool)

(assert (=> b!11628 (= e!7069 (arrayBitRangesEq!0 (buf!632 (_1!745 lt!18475)) (buf!632 thiss!1486) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!287 (buf!632 (_1!745 lt!18475))) (currentByte!1704 (_1!745 lt!18475)) (currentBit!1699 (_1!745 lt!18475)))))))

(assert (= (and d!3580 res!11341) b!11626))

(assert (= (and b!11626 res!11340) b!11627))

(assert (= (and b!11627 (not res!11339)) b!11628))

(declare-fun m!17055 () Bool)

(assert (=> b!11626 m!17055))

(assert (=> b!11626 m!16479))

(assert (=> b!11628 m!17055))

(assert (=> b!11628 m!17055))

(declare-fun m!17057 () Bool)

(assert (=> b!11628 m!17057))

(assert (=> b!11593 d!3580))

(declare-fun d!3582 () Bool)

(declare-fun c!816 () Bool)

(assert (=> d!3582 (= c!816 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!7071 () List!166)

(assert (=> d!3582 (= (byteArrayBitContentToList!0 (_2!746 lt!18383) (_1!746 lt!18383) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!7071)))

(declare-fun b!11629 () Bool)

(assert (=> b!11629 (= e!7071 Nil!163)))

(declare-fun b!11630 () Bool)

(assert (=> b!11630 (= e!7071 (Cons!162 (not (= (bvand ((_ sign_extend 24) (select (arr!707 (_1!746 lt!18383)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!746 lt!18383) (_1!746 lt!18383) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!3582 c!816) b!11629))

(assert (= (and d!3582 (not c!816)) b!11630))

(declare-fun m!17059 () Bool)

(assert (=> b!11630 m!17059))

(assert (=> b!11630 m!17017))

(declare-fun m!17061 () Bool)

(assert (=> b!11630 m!17061))

(assert (=> b!11547 d!3582))

(declare-fun d!3584 () Bool)

(declare-fun e!7073 () Bool)

(assert (=> d!3584 e!7073))

(declare-fun c!817 () Bool)

(assert (=> d!3584 (= c!817 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!18508 () List!166)

(declare-fun e!7072 () tuple2!1416)

(assert (=> d!3584 (= lt!18508 (_1!757 e!7072))))

(declare-fun c!818 () Bool)

(assert (=> d!3584 (= c!818 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3584 (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3584 (= (bitStreamReadBitsIntoList!0 (_2!746 lt!18383) (_1!745 lt!17697) nBits!460) lt!18508)))

(declare-fun b!11631 () Bool)

(assert (=> b!11631 (= e!7072 (tuple2!1417 Nil!163 (_1!745 lt!17697)))))

(declare-fun b!11634 () Bool)

(assert (=> b!11634 (= e!7073 (> (length!34 lt!18508) 0))))

(declare-fun b!11633 () Bool)

(assert (=> b!11633 (= e!7073 (isEmpty!39 lt!18508))))

(declare-fun lt!18509 () tuple2!1418)

(declare-fun b!11632 () Bool)

(declare-fun lt!18507 () (_ BitVec 64))

(assert (=> b!11632 (= e!7072 (tuple2!1417 (Cons!162 (_1!758 lt!18509) (bitStreamReadBitsIntoList!0 (_2!746 lt!18383) (_2!758 lt!18509) (bvsub nBits!460 lt!18507))) (_2!758 lt!18509)))))

(assert (=> b!11632 (= lt!18509 (readBit!0 (_1!745 lt!17697)))))

(assert (=> b!11632 (= lt!18507 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!3584 c!818) b!11631))

(assert (= (and d!3584 (not c!818)) b!11632))

(assert (= (and d!3584 c!817) b!11633))

(assert (= (and d!3584 (not c!817)) b!11634))

(declare-fun m!17063 () Bool)

(assert (=> b!11634 m!17063))

(declare-fun m!17065 () Bool)

(assert (=> b!11633 m!17065))

(declare-fun m!17067 () Bool)

(assert (=> b!11632 m!17067))

(assert (=> b!11632 m!17027))

(assert (=> b!11547 d!3584))

(declare-fun d!3586 () Bool)

(declare-fun c!819 () Bool)

(assert (=> d!3586 (= c!819 (= (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!7074 () List!166)

(assert (=> d!3586 (= (byteArrayBitContentToList!0 (_2!744 lt!17700) (_1!746 lt!17701) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001)) e!7074)))

(declare-fun b!11635 () Bool)

(assert (=> b!11635 (= e!7074 Nil!163)))

(declare-fun b!11636 () Bool)

(assert (=> b!11636 (= e!7074 (Cons!162 (not (= (bvand ((_ sign_extend 24) (select (arr!707 (_1!746 lt!17701)) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!744 lt!17700) (_1!746 lt!17701) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!3586 c!819) b!11635))

(assert (= (and d!3586 (not c!819)) b!11636))

(assert (=> b!11636 m!17049))

(assert (=> b!11636 m!17051))

(declare-fun m!17069 () Bool)

(assert (=> b!11636 m!17069))

(assert (=> b!11599 d!3586))

(declare-fun d!3588 () Bool)

(assert (=> d!3588 (= (head!64 (byteArrayBitContentToList!0 (_2!744 lt!18151) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!281 (byteArrayBitContentToList!0 (_2!744 lt!18151) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!11470 d!3588))

(declare-fun d!3590 () Bool)

(assert (=> d!3590 (validate_offset_bits!1 ((_ sign_extend 32) (size!287 (buf!632 (_2!744 lt!18151)))) ((_ sign_extend 32) (currentByte!1704 thiss!1486)) ((_ sign_extend 32) (currentBit!1699 thiss!1486)) lt!18173)))

(declare-fun lt!18510 () Unit!970)

(assert (=> d!3590 (= lt!18510 (choose!9 thiss!1486 (buf!632 (_2!744 lt!18151)) lt!18173 (BitStream!541 (buf!632 (_2!744 lt!18151)) (currentByte!1704 thiss!1486) (currentBit!1699 thiss!1486))))))

(assert (=> d!3590 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!632 (_2!744 lt!18151)) lt!18173) lt!18510)))

(declare-fun bs!1043 () Bool)

(assert (= bs!1043 d!3590))

(assert (=> bs!1043 m!16755))

(declare-fun m!17071 () Bool)

(assert (=> bs!1043 m!17071))

(assert (=> b!11470 d!3590))

(declare-fun d!3592 () Bool)

(declare-fun e!7076 () Bool)

(assert (=> d!3592 e!7076))

(declare-fun c!820 () Bool)

(assert (=> d!3592 (= c!820 (= (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!18512 () List!166)

(declare-fun e!7075 () tuple2!1416)

(assert (=> d!3592 (= lt!18512 (_1!757 e!7075))))

(declare-fun c!821 () Bool)

(assert (=> d!3592 (= c!821 (= (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3592 (bvsge (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3592 (= (bitStreamReadBitsIntoList!0 (_2!744 lt!18157) (_1!745 lt!18161) (bvsub (bvadd from!367 nBits!460) from!367)) lt!18512)))

(declare-fun b!11637 () Bool)

(assert (=> b!11637 (= e!7075 (tuple2!1417 Nil!163 (_1!745 lt!18161)))))

(declare-fun b!11640 () Bool)

(assert (=> b!11640 (= e!7076 (> (length!34 lt!18512) 0))))

(declare-fun b!11639 () Bool)

(assert (=> b!11639 (= e!7076 (isEmpty!39 lt!18512))))

(declare-fun lt!18511 () (_ BitVec 64))

(declare-fun b!11638 () Bool)

(declare-fun lt!18513 () tuple2!1418)

(assert (=> b!11638 (= e!7075 (tuple2!1417 (Cons!162 (_1!758 lt!18513) (bitStreamReadBitsIntoList!0 (_2!744 lt!18157) (_2!758 lt!18513) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) lt!18511))) (_2!758 lt!18513)))))

(assert (=> b!11638 (= lt!18513 (readBit!0 (_1!745 lt!18161)))))

(assert (=> b!11638 (= lt!18511 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!3592 c!821) b!11637))

(assert (= (and d!3592 (not c!821)) b!11638))

(assert (= (and d!3592 c!820) b!11639))

(assert (= (and d!3592 (not c!820)) b!11640))

(declare-fun m!17073 () Bool)

(assert (=> b!11640 m!17073))

(declare-fun m!17075 () Bool)

(assert (=> b!11639 m!17075))

(declare-fun m!17077 () Bool)

(assert (=> b!11638 m!17077))

(declare-fun m!17079 () Bool)

(assert (=> b!11638 m!17079))

(assert (=> b!11470 d!3592))

(declare-fun d!3594 () Bool)

(assert (=> d!3594 (= (bitAt!0 (buf!632 (_2!744 lt!18157)) lt!18168) (not (= (bvand ((_ sign_extend 24) (select (arr!707 (buf!632 (_2!744 lt!18157))) ((_ extract 31 0) (bvsdiv lt!18168 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!18168 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!1044 () Bool)

(assert (= bs!1044 d!3594))

(declare-fun m!17081 () Bool)

(assert (=> bs!1044 m!17081))

(declare-fun m!17083 () Bool)

(assert (=> bs!1044 m!17083))

(assert (=> b!11470 d!3594))

(declare-fun b!11641 () Bool)

(declare-fun e!7078 () tuple2!1396)

(declare-fun Unit!998 () Unit!970)

(assert (=> b!11641 (= e!7078 (tuple2!1397 Unit!998 (_2!744 lt!18151)))))

(assert (=> b!11641 (= (size!287 (buf!632 (_2!744 lt!18151))) (size!287 (buf!632 (_2!744 lt!18151))))))

(declare-fun lt!18538 () Unit!970)

(declare-fun Unit!999 () Unit!970)

(assert (=> b!11641 (= lt!18538 Unit!999)))

(declare-fun call!216 () tuple2!1398)

(assert (=> b!11641 (checkByteArrayBitContent!0 (_2!744 lt!18151) srcBuffer!6 (_1!746 (readBits!0 (_1!745 call!216) (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)))) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!18523 () tuple2!1396)

(declare-fun lt!18540 () tuple2!1398)

(declare-fun e!7079 () Bool)

(declare-fun b!11642 () Bool)

(assert (=> b!11642 (= e!7079 (= (bitStreamReadBitsIntoList!0 (_2!744 lt!18523) (_1!745 lt!18540) (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001))) (byteArrayBitContentToList!0 (_2!744 lt!18523) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(assert (=> b!11642 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!11642 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!18548 () Unit!970)

(declare-fun lt!18532 () Unit!970)

(assert (=> b!11642 (= lt!18548 lt!18532)))

(declare-fun lt!18516 () (_ BitVec 64))

(assert (=> b!11642 (validate_offset_bits!1 ((_ sign_extend 32) (size!287 (buf!632 (_2!744 lt!18523)))) ((_ sign_extend 32) (currentByte!1704 (_2!744 lt!18151))) ((_ sign_extend 32) (currentBit!1699 (_2!744 lt!18151))) lt!18516)))

(assert (=> b!11642 (= lt!18532 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!744 lt!18151) (buf!632 (_2!744 lt!18523)) lt!18516))))

(declare-fun e!7077 () Bool)

(assert (=> b!11642 e!7077))

(declare-fun res!11347 () Bool)

(assert (=> b!11642 (=> (not res!11347) (not e!7077))))

(assert (=> b!11642 (= res!11347 (and (= (size!287 (buf!632 (_2!744 lt!18151))) (size!287 (buf!632 (_2!744 lt!18523)))) (bvsge lt!18516 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!11642 (= lt!18516 (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!11642 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!11642 (= lt!18540 (reader!0 (_2!744 lt!18151) (_2!744 lt!18523)))))

(declare-fun b!11643 () Bool)

(declare-fun res!11346 () Bool)

(assert (=> b!11643 (=> (not res!11346) (not e!7079))))

(assert (=> b!11643 (= res!11346 (invariant!0 (currentBit!1699 (_2!744 lt!18523)) (currentByte!1704 (_2!744 lt!18523)) (size!287 (buf!632 (_2!744 lt!18523)))))))

(declare-fun d!3596 () Bool)

(assert (=> d!3596 e!7079))

(declare-fun res!11343 () Bool)

(assert (=> d!3596 (=> (not res!11343) (not e!7079))))

(declare-fun lt!18526 () (_ BitVec 64))

(assert (=> d!3596 (= res!11343 (= (bitIndex!0 (size!287 (buf!632 (_2!744 lt!18523))) (currentByte!1704 (_2!744 lt!18523)) (currentBit!1699 (_2!744 lt!18523))) (bvsub lt!18526 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> d!3596 (or (= (bvand lt!18526 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!18526 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!18526 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!18521 () (_ BitVec 64))

(assert (=> d!3596 (= lt!18526 (bvadd lt!18521 from!367 nBits!460))))

(assert (=> d!3596 (or (not (= (bvand lt!18521 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!18521 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!18521 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3596 (= lt!18521 (bitIndex!0 (size!287 (buf!632 (_2!744 lt!18151))) (currentByte!1704 (_2!744 lt!18151)) (currentBit!1699 (_2!744 lt!18151))))))

(assert (=> d!3596 (= lt!18523 e!7078)))

(declare-fun c!822 () Bool)

(assert (=> d!3596 (= c!822 (bvslt (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!18557 () Unit!970)

(declare-fun lt!18515 () Unit!970)

(assert (=> d!3596 (= lt!18557 lt!18515)))

(assert (=> d!3596 (isPrefixOf!0 (_2!744 lt!18151) (_2!744 lt!18151))))

(assert (=> d!3596 (= lt!18515 (lemmaIsPrefixRefl!0 (_2!744 lt!18151)))))

(declare-fun lt!18546 () (_ BitVec 64))

(assert (=> d!3596 (= lt!18546 (bitIndex!0 (size!287 (buf!632 (_2!744 lt!18151))) (currentByte!1704 (_2!744 lt!18151)) (currentBit!1699 (_2!744 lt!18151))))))

(assert (=> d!3596 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3596 (= (appendBitsMSBFirstLoop!0 (_2!744 lt!18151) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)) lt!18523)))

(declare-fun b!11644 () Bool)

(declare-fun lt!18535 () tuple2!1396)

(declare-fun Unit!1000 () Unit!970)

(assert (=> b!11644 (= e!7078 (tuple2!1397 Unit!1000 (_2!744 lt!18535)))))

(declare-fun lt!18531 () tuple2!1396)

(assert (=> b!11644 (= lt!18531 (appendBitFromByte!0 (_2!744 lt!18151) (select (arr!707 srcBuffer!6) ((_ extract 31 0) (bvsdiv (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!18525 () (_ BitVec 64))

(assert (=> b!11644 (= lt!18525 (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!18545 () (_ BitVec 64))

(assert (=> b!11644 (= lt!18545 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!18518 () Unit!970)

(assert (=> b!11644 (= lt!18518 (validateOffsetBitsIneqLemma!0 (_2!744 lt!18151) (_2!744 lt!18531) lt!18525 lt!18545))))

(assert (=> b!11644 (validate_offset_bits!1 ((_ sign_extend 32) (size!287 (buf!632 (_2!744 lt!18531)))) ((_ sign_extend 32) (currentByte!1704 (_2!744 lt!18531))) ((_ sign_extend 32) (currentBit!1699 (_2!744 lt!18531))) (bvsub lt!18525 lt!18545))))

(declare-fun lt!18522 () Unit!970)

(assert (=> b!11644 (= lt!18522 lt!18518)))

(declare-fun lt!18542 () tuple2!1398)

(assert (=> b!11644 (= lt!18542 (reader!0 (_2!744 lt!18151) (_2!744 lt!18531)))))

(declare-fun lt!18551 () (_ BitVec 64))

(assert (=> b!11644 (= lt!18551 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!18541 () Unit!970)

(assert (=> b!11644 (= lt!18541 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!744 lt!18151) (buf!632 (_2!744 lt!18531)) lt!18551))))

(assert (=> b!11644 (validate_offset_bits!1 ((_ sign_extend 32) (size!287 (buf!632 (_2!744 lt!18531)))) ((_ sign_extend 32) (currentByte!1704 (_2!744 lt!18151))) ((_ sign_extend 32) (currentBit!1699 (_2!744 lt!18151))) lt!18551)))

(declare-fun lt!18553 () Unit!970)

(assert (=> b!11644 (= lt!18553 lt!18541)))

(assert (=> b!11644 (= (head!64 (byteArrayBitContentToList!0 (_2!744 lt!18531) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!64 (bitStreamReadBitsIntoList!0 (_2!744 lt!18531) (_1!745 lt!18542) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!18530 () Unit!970)

(declare-fun Unit!1001 () Unit!970)

(assert (=> b!11644 (= lt!18530 Unit!1001)))

(assert (=> b!11644 (= lt!18535 (appendBitsMSBFirstLoop!0 (_2!744 lt!18531) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!18547 () Unit!970)

(assert (=> b!11644 (= lt!18547 (lemmaIsPrefixTransitive!0 (_2!744 lt!18151) (_2!744 lt!18531) (_2!744 lt!18535)))))

(assert (=> b!11644 (isPrefixOf!0 (_2!744 lt!18151) (_2!744 lt!18535))))

(declare-fun lt!18536 () Unit!970)

(assert (=> b!11644 (= lt!18536 lt!18547)))

(assert (=> b!11644 (= (size!287 (buf!632 (_2!744 lt!18535))) (size!287 (buf!632 (_2!744 lt!18151))))))

(declare-fun lt!18550 () Unit!970)

(declare-fun Unit!1002 () Unit!970)

(assert (=> b!11644 (= lt!18550 Unit!1002)))

(assert (=> b!11644 (= (bitIndex!0 (size!287 (buf!632 (_2!744 lt!18535))) (currentByte!1704 (_2!744 lt!18535)) (currentBit!1699 (_2!744 lt!18535))) (bvsub (bvadd (bitIndex!0 (size!287 (buf!632 (_2!744 lt!18151))) (currentByte!1704 (_2!744 lt!18151)) (currentBit!1699 (_2!744 lt!18151))) from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!18534 () Unit!970)

(declare-fun Unit!1003 () Unit!970)

(assert (=> b!11644 (= lt!18534 Unit!1003)))

(assert (=> b!11644 (= (bitIndex!0 (size!287 (buf!632 (_2!744 lt!18535))) (currentByte!1704 (_2!744 lt!18535)) (currentBit!1699 (_2!744 lt!18535))) (bvsub (bvsub (bvadd (bitIndex!0 (size!287 (buf!632 (_2!744 lt!18531))) (currentByte!1704 (_2!744 lt!18531)) (currentBit!1699 (_2!744 lt!18531))) from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!18544 () Unit!970)

(declare-fun Unit!1004 () Unit!970)

(assert (=> b!11644 (= lt!18544 Unit!1004)))

(declare-fun lt!18539 () tuple2!1398)

(assert (=> b!11644 (= lt!18539 call!216)))

(declare-fun lt!18514 () (_ BitVec 64))

(assert (=> b!11644 (= lt!18514 (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!18537 () Unit!970)

(assert (=> b!11644 (= lt!18537 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!744 lt!18151) (buf!632 (_2!744 lt!18535)) lt!18514))))

(assert (=> b!11644 (validate_offset_bits!1 ((_ sign_extend 32) (size!287 (buf!632 (_2!744 lt!18535)))) ((_ sign_extend 32) (currentByte!1704 (_2!744 lt!18151))) ((_ sign_extend 32) (currentBit!1699 (_2!744 lt!18151))) lt!18514)))

(declare-fun lt!18554 () Unit!970)

(assert (=> b!11644 (= lt!18554 lt!18537)))

(declare-fun lt!18528 () tuple2!1398)

(assert (=> b!11644 (= lt!18528 (reader!0 (_2!744 lt!18531) (_2!744 lt!18535)))))

(declare-fun lt!18552 () (_ BitVec 64))

(assert (=> b!11644 (= lt!18552 (bvsub (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!18549 () Unit!970)

(assert (=> b!11644 (= lt!18549 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!744 lt!18531) (buf!632 (_2!744 lt!18535)) lt!18552))))

(assert (=> b!11644 (validate_offset_bits!1 ((_ sign_extend 32) (size!287 (buf!632 (_2!744 lt!18535)))) ((_ sign_extend 32) (currentByte!1704 (_2!744 lt!18531))) ((_ sign_extend 32) (currentBit!1699 (_2!744 lt!18531))) lt!18552)))

(declare-fun lt!18543 () Unit!970)

(assert (=> b!11644 (= lt!18543 lt!18549)))

(declare-fun lt!18520 () List!166)

(assert (=> b!11644 (= lt!18520 (byteArrayBitContentToList!0 (_2!744 lt!18535) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!18519 () List!166)

(assert (=> b!11644 (= lt!18519 (byteArrayBitContentToList!0 (_2!744 lt!18535) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!18524 () List!166)

(assert (=> b!11644 (= lt!18524 (bitStreamReadBitsIntoList!0 (_2!744 lt!18535) (_1!745 lt!18539) (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!18555 () List!166)

(assert (=> b!11644 (= lt!18555 (bitStreamReadBitsIntoList!0 (_2!744 lt!18535) (_1!745 lt!18528) (bvsub (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!18529 () (_ BitVec 64))

(assert (=> b!11644 (= lt!18529 (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!18527 () Unit!970)

(assert (=> b!11644 (= lt!18527 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!744 lt!18535) (_2!744 lt!18535) (_1!745 lt!18539) (_1!745 lt!18528) lt!18529 lt!18524))))

(assert (=> b!11644 (= (bitStreamReadBitsIntoList!0 (_2!744 lt!18535) (_1!745 lt!18528) (bvsub lt!18529 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!72 lt!18524))))

(declare-fun lt!18556 () Unit!970)

(assert (=> b!11644 (= lt!18556 lt!18527)))

(declare-fun lt!18517 () Unit!970)

(assert (=> b!11644 (= lt!18517 (arrayBitRangesEqImpliesEq!0 (buf!632 (_2!744 lt!18531)) (buf!632 (_2!744 lt!18535)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!18546 (bitIndex!0 (size!287 (buf!632 (_2!744 lt!18531))) (currentByte!1704 (_2!744 lt!18531)) (currentBit!1699 (_2!744 lt!18531)))))))

(assert (=> b!11644 (= (bitAt!0 (buf!632 (_2!744 lt!18531)) lt!18546) (bitAt!0 (buf!632 (_2!744 lt!18535)) lt!18546))))

(declare-fun lt!18533 () Unit!970)

(assert (=> b!11644 (= lt!18533 lt!18517)))

(declare-fun b!11645 () Bool)

(declare-fun res!11344 () Bool)

(assert (=> b!11645 (=> (not res!11344) (not e!7079))))

(assert (=> b!11645 (= res!11344 (isPrefixOf!0 (_2!744 lt!18151) (_2!744 lt!18523)))))

(declare-fun bm!213 () Bool)

(assert (=> bm!213 (= call!216 (reader!0 (_2!744 lt!18151) (ite c!822 (_2!744 lt!18535) (_2!744 lt!18151))))))

(declare-fun b!11646 () Bool)

(declare-fun res!11342 () Bool)

(assert (=> b!11646 (=> (not res!11342) (not e!7079))))

(assert (=> b!11646 (= res!11342 (= (size!287 (buf!632 (_2!744 lt!18523))) (size!287 (buf!632 (_2!744 lt!18151)))))))

(declare-fun b!11647 () Bool)

(declare-fun res!11345 () Bool)

(assert (=> b!11647 (=> (not res!11345) (not e!7079))))

(assert (=> b!11647 (= res!11345 (= (size!287 (buf!632 (_2!744 lt!18151))) (size!287 (buf!632 (_2!744 lt!18523)))))))

(declare-fun b!11648 () Bool)

(assert (=> b!11648 (= e!7077 (validate_offset_bits!1 ((_ sign_extend 32) (size!287 (buf!632 (_2!744 lt!18151)))) ((_ sign_extend 32) (currentByte!1704 (_2!744 lt!18151))) ((_ sign_extend 32) (currentBit!1699 (_2!744 lt!18151))) lt!18516))))

(assert (= (and d!3596 c!822) b!11644))

(assert (= (and d!3596 (not c!822)) b!11641))

(assert (= (or b!11644 b!11641) bm!213))

(assert (= (and d!3596 res!11343) b!11643))

(assert (= (and b!11643 res!11346) b!11647))

(assert (= (and b!11647 res!11345) b!11645))

(assert (= (and b!11645 res!11344) b!11646))

(assert (= (and b!11646 res!11342) b!11642))

(assert (= (and b!11642 res!11347) b!11648))

(declare-fun m!17085 () Bool)

(assert (=> bm!213 m!17085))

(declare-fun m!17087 () Bool)

(assert (=> d!3596 m!17087))

(assert (=> d!3596 m!16775))

(declare-fun m!17089 () Bool)

(assert (=> d!3596 m!17089))

(declare-fun m!17091 () Bool)

(assert (=> d!3596 m!17091))

(declare-fun m!17093 () Bool)

(assert (=> b!11642 m!17093))

(declare-fun m!17095 () Bool)

(assert (=> b!11642 m!17095))

(declare-fun m!17097 () Bool)

(assert (=> b!11642 m!17097))

(declare-fun m!17099 () Bool)

(assert (=> b!11642 m!17099))

(declare-fun m!17101 () Bool)

(assert (=> b!11642 m!17101))

(declare-fun m!17103 () Bool)

(assert (=> b!11645 m!17103))

(declare-fun m!17105 () Bool)

(assert (=> b!11644 m!17105))

(declare-fun m!17107 () Bool)

(assert (=> b!11644 m!17107))

(declare-fun m!17109 () Bool)

(assert (=> b!11644 m!17109))

(declare-fun m!17111 () Bool)

(assert (=> b!11644 m!17111))

(declare-fun m!17113 () Bool)

(assert (=> b!11644 m!17113))

(declare-fun m!17115 () Bool)

(assert (=> b!11644 m!17115))

(declare-fun m!17117 () Bool)

(assert (=> b!11644 m!17117))

(declare-fun m!17119 () Bool)

(assert (=> b!11644 m!17119))

(declare-fun m!17121 () Bool)

(assert (=> b!11644 m!17121))

(declare-fun m!17123 () Bool)

(assert (=> b!11644 m!17123))

(declare-fun m!17125 () Bool)

(assert (=> b!11644 m!17125))

(declare-fun m!17127 () Bool)

(assert (=> b!11644 m!17127))

(declare-fun m!17129 () Bool)

(assert (=> b!11644 m!17129))

(declare-fun m!17131 () Bool)

(assert (=> b!11644 m!17131))

(declare-fun m!17133 () Bool)

(assert (=> b!11644 m!17133))

(declare-fun m!17135 () Bool)

(assert (=> b!11644 m!17135))

(declare-fun m!17137 () Bool)

(assert (=> b!11644 m!17137))

(assert (=> b!11644 m!17125))

(declare-fun m!17139 () Bool)

(assert (=> b!11644 m!17139))

(declare-fun m!17141 () Bool)

(assert (=> b!11644 m!17141))

(assert (=> b!11644 m!17045))

(declare-fun m!17143 () Bool)

(assert (=> b!11644 m!17143))

(assert (=> b!11644 m!16775))

(assert (=> b!11644 m!17141))

(declare-fun m!17145 () Bool)

(assert (=> b!11644 m!17145))

(declare-fun m!17147 () Bool)

(assert (=> b!11644 m!17147))

(assert (=> b!11644 m!17121))

(declare-fun m!17149 () Bool)

(assert (=> b!11644 m!17149))

(declare-fun m!17151 () Bool)

(assert (=> b!11644 m!17151))

(assert (=> b!11644 m!17045))

(declare-fun m!17153 () Bool)

(assert (=> b!11644 m!17153))

(declare-fun m!17155 () Bool)

(assert (=> b!11644 m!17155))

(declare-fun m!17157 () Bool)

(assert (=> b!11644 m!17157))

(declare-fun m!17159 () Bool)

(assert (=> b!11644 m!17159))

(declare-fun m!17161 () Bool)

(assert (=> b!11644 m!17161))

(declare-fun m!17163 () Bool)

(assert (=> b!11644 m!17163))

(declare-fun m!17165 () Bool)

(assert (=> b!11643 m!17165))

(declare-fun m!17167 () Bool)

(assert (=> b!11648 m!17167))

(declare-fun m!17169 () Bool)

(assert (=> b!11641 m!17169))

(declare-fun m!17171 () Bool)

(assert (=> b!11641 m!17171))

(assert (=> b!11470 d!3596))

(declare-fun d!3598 () Bool)

(declare-fun e!7080 () Bool)

(assert (=> d!3598 e!7080))

(declare-fun res!11348 () Bool)

(assert (=> d!3598 (=> (not res!11348) (not e!7080))))

(declare-fun lt!18563 () (_ BitVec 64))

(declare-fun lt!18558 () (_ BitVec 64))

(declare-fun lt!18560 () (_ BitVec 64))

(assert (=> d!3598 (= res!11348 (= lt!18563 (bvsub lt!18560 lt!18558)))))

(assert (=> d!3598 (or (= (bvand lt!18560 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!18558 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!18560 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!18560 lt!18558) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3598 (= lt!18558 (remainingBits!0 ((_ sign_extend 32) (size!287 (buf!632 (_2!744 lt!18151)))) ((_ sign_extend 32) (currentByte!1704 (_2!744 lt!18151))) ((_ sign_extend 32) (currentBit!1699 (_2!744 lt!18151)))))))

(declare-fun lt!18561 () (_ BitVec 64))

(declare-fun lt!18559 () (_ BitVec 64))

(assert (=> d!3598 (= lt!18560 (bvmul lt!18561 lt!18559))))

(assert (=> d!3598 (or (= lt!18561 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!18559 (bvsdiv (bvmul lt!18561 lt!18559) lt!18561)))))

(assert (=> d!3598 (= lt!18559 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!3598 (= lt!18561 ((_ sign_extend 32) (size!287 (buf!632 (_2!744 lt!18151)))))))

(assert (=> d!3598 (= lt!18563 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1704 (_2!744 lt!18151))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1699 (_2!744 lt!18151)))))))

(assert (=> d!3598 (invariant!0 (currentBit!1699 (_2!744 lt!18151)) (currentByte!1704 (_2!744 lt!18151)) (size!287 (buf!632 (_2!744 lt!18151))))))

(assert (=> d!3598 (= (bitIndex!0 (size!287 (buf!632 (_2!744 lt!18151))) (currentByte!1704 (_2!744 lt!18151)) (currentBit!1699 (_2!744 lt!18151))) lt!18563)))

(declare-fun b!11649 () Bool)

(declare-fun res!11349 () Bool)

(assert (=> b!11649 (=> (not res!11349) (not e!7080))))

(assert (=> b!11649 (= res!11349 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!18563))))

(declare-fun b!11650 () Bool)

(declare-fun lt!18562 () (_ BitVec 64))

(assert (=> b!11650 (= e!7080 (bvsle lt!18563 (bvmul lt!18562 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!11650 (or (= lt!18562 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!18562 #b0000000000000000000000000000000000000000000000000000000000001000) lt!18562)))))

(assert (=> b!11650 (= lt!18562 ((_ sign_extend 32) (size!287 (buf!632 (_2!744 lt!18151)))))))

(assert (= (and d!3598 res!11348) b!11649))

(assert (= (and b!11649 res!11349) b!11650))

(declare-fun m!17173 () Bool)

(assert (=> d!3598 m!17173))

(declare-fun m!17175 () Bool)

(assert (=> d!3598 m!17175))

(assert (=> b!11470 d!3598))

(declare-fun d!3600 () Bool)

(declare-fun res!11352 () Bool)

(declare-fun e!7082 () Bool)

(assert (=> d!3600 (=> (not res!11352) (not e!7082))))

(assert (=> d!3600 (= res!11352 (= (size!287 (buf!632 thiss!1486)) (size!287 (buf!632 (_2!744 lt!18157)))))))

(assert (=> d!3600 (= (isPrefixOf!0 thiss!1486 (_2!744 lt!18157)) e!7082)))

(declare-fun b!11651 () Bool)

(declare-fun res!11351 () Bool)

(assert (=> b!11651 (=> (not res!11351) (not e!7082))))

(assert (=> b!11651 (= res!11351 (bvsle (bitIndex!0 (size!287 (buf!632 thiss!1486)) (currentByte!1704 thiss!1486) (currentBit!1699 thiss!1486)) (bitIndex!0 (size!287 (buf!632 (_2!744 lt!18157))) (currentByte!1704 (_2!744 lt!18157)) (currentBit!1699 (_2!744 lt!18157)))))))

(declare-fun b!11652 () Bool)

(declare-fun e!7081 () Bool)

(assert (=> b!11652 (= e!7082 e!7081)))

(declare-fun res!11350 () Bool)

(assert (=> b!11652 (=> res!11350 e!7081)))

(assert (=> b!11652 (= res!11350 (= (size!287 (buf!632 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!11653 () Bool)

(assert (=> b!11653 (= e!7081 (arrayBitRangesEq!0 (buf!632 thiss!1486) (buf!632 (_2!744 lt!18157)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!287 (buf!632 thiss!1486)) (currentByte!1704 thiss!1486) (currentBit!1699 thiss!1486))))))

(assert (= (and d!3600 res!11352) b!11651))

(assert (= (and b!11651 res!11351) b!11652))

(assert (= (and b!11652 (not res!11350)) b!11653))

(assert (=> b!11651 m!16479))

(assert (=> b!11651 m!16801))

(assert (=> b!11653 m!16479))

(assert (=> b!11653 m!16479))

(declare-fun m!17177 () Bool)

(assert (=> b!11653 m!17177))

(assert (=> b!11470 d!3600))

(declare-fun d!3602 () Bool)

(assert (=> d!3602 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!287 (buf!632 (_2!744 lt!18157)))) ((_ sign_extend 32) (currentByte!1704 thiss!1486)) ((_ sign_extend 32) (currentBit!1699 thiss!1486)) lt!18134) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!287 (buf!632 (_2!744 lt!18157)))) ((_ sign_extend 32) (currentByte!1704 thiss!1486)) ((_ sign_extend 32) (currentBit!1699 thiss!1486))) lt!18134))))

(declare-fun bs!1045 () Bool)

(assert (= bs!1045 d!3602))

(declare-fun m!17179 () Bool)

(assert (=> bs!1045 m!17179))

(assert (=> b!11470 d!3602))

(declare-fun d!3604 () Bool)

(declare-fun e!7085 () Bool)

(assert (=> d!3604 e!7085))

(declare-fun res!11355 () Bool)

(assert (=> d!3604 (=> (not res!11355) (not e!7085))))

(declare-fun lt!18569 () (_ BitVec 64))

(assert (=> d!3604 (= res!11355 (or (= (bvand lt!18149 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!18569 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!18149 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!18149 lt!18569) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!3604 (= lt!18569 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!18568 () Unit!970)

(declare-fun choose!42 (BitStream!540 BitStream!540 BitStream!540 BitStream!540 (_ BitVec 64) List!166) Unit!970)

(assert (=> d!3604 (= lt!18568 (choose!42 (_2!744 lt!18157) (_2!744 lt!18157) (_1!745 lt!18161) (_1!745 lt!18148) lt!18149 lt!18144))))

(assert (=> d!3604 (bvsgt lt!18149 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3604 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!744 lt!18157) (_2!744 lt!18157) (_1!745 lt!18161) (_1!745 lt!18148) lt!18149 lt!18144) lt!18568)))

(declare-fun b!11656 () Bool)

(assert (=> b!11656 (= e!7085 (= (bitStreamReadBitsIntoList!0 (_2!744 lt!18157) (_1!745 lt!18148) (bvsub lt!18149 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!72 lt!18144)))))

(assert (= (and d!3604 res!11355) b!11656))

(declare-fun m!17181 () Bool)

(assert (=> d!3604 m!17181))

(assert (=> b!11656 m!16809))

(assert (=> b!11656 m!16777))

(assert (=> b!11470 d!3604))

(declare-fun b!11657 () Bool)

(declare-fun e!7086 () Unit!970)

(declare-fun lt!18583 () Unit!970)

(assert (=> b!11657 (= e!7086 lt!18583)))

(declare-fun lt!18573 () (_ BitVec 64))

(assert (=> b!11657 (= lt!18573 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!18579 () (_ BitVec 64))

(assert (=> b!11657 (= lt!18579 (bitIndex!0 (size!287 (buf!632 (_2!744 lt!18151))) (currentByte!1704 (_2!744 lt!18151)) (currentBit!1699 (_2!744 lt!18151))))))

(assert (=> b!11657 (= lt!18583 (arrayBitRangesEqSymmetric!0 (buf!632 (_2!744 lt!18151)) (buf!632 (_2!744 lt!18157)) lt!18573 lt!18579))))

(assert (=> b!11657 (arrayBitRangesEq!0 (buf!632 (_2!744 lt!18157)) (buf!632 (_2!744 lt!18151)) lt!18573 lt!18579)))

(declare-fun e!7087 () Bool)

(declare-fun b!11658 () Bool)

(declare-fun lt!18578 () (_ BitVec 64))

(declare-fun lt!18582 () tuple2!1398)

(declare-fun lt!18580 () (_ BitVec 64))

(assert (=> b!11658 (= e!7087 (= (_1!745 lt!18582) (withMovedBitIndex!0 (_2!745 lt!18582) (bvsub lt!18580 lt!18578))))))

(assert (=> b!11658 (or (= (bvand lt!18580 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!18578 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!18580 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!18580 lt!18578) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!11658 (= lt!18578 (bitIndex!0 (size!287 (buf!632 (_2!744 lt!18157))) (currentByte!1704 (_2!744 lt!18157)) (currentBit!1699 (_2!744 lt!18157))))))

(assert (=> b!11658 (= lt!18580 (bitIndex!0 (size!287 (buf!632 (_2!744 lt!18151))) (currentByte!1704 (_2!744 lt!18151)) (currentBit!1699 (_2!744 lt!18151))))))

(declare-fun b!11659 () Bool)

(declare-fun Unit!1005 () Unit!970)

(assert (=> b!11659 (= e!7086 Unit!1005)))

(declare-fun b!11660 () Bool)

(declare-fun res!11358 () Bool)

(assert (=> b!11660 (=> (not res!11358) (not e!7087))))

(assert (=> b!11660 (= res!11358 (isPrefixOf!0 (_2!745 lt!18582) (_2!744 lt!18157)))))

(declare-fun d!3606 () Bool)

(assert (=> d!3606 e!7087))

(declare-fun res!11357 () Bool)

(assert (=> d!3606 (=> (not res!11357) (not e!7087))))

(assert (=> d!3606 (= res!11357 (isPrefixOf!0 (_1!745 lt!18582) (_2!745 lt!18582)))))

(declare-fun lt!18574 () BitStream!540)

(assert (=> d!3606 (= lt!18582 (tuple2!1399 lt!18574 (_2!744 lt!18157)))))

(declare-fun lt!18585 () Unit!970)

(declare-fun lt!18588 () Unit!970)

(assert (=> d!3606 (= lt!18585 lt!18588)))

(assert (=> d!3606 (isPrefixOf!0 lt!18574 (_2!744 lt!18157))))

(assert (=> d!3606 (= lt!18588 (lemmaIsPrefixTransitive!0 lt!18574 (_2!744 lt!18157) (_2!744 lt!18157)))))

(declare-fun lt!18584 () Unit!970)

(declare-fun lt!18589 () Unit!970)

(assert (=> d!3606 (= lt!18584 lt!18589)))

(assert (=> d!3606 (isPrefixOf!0 lt!18574 (_2!744 lt!18157))))

(assert (=> d!3606 (= lt!18589 (lemmaIsPrefixTransitive!0 lt!18574 (_2!744 lt!18151) (_2!744 lt!18157)))))

(declare-fun lt!18577 () Unit!970)

(assert (=> d!3606 (= lt!18577 e!7086)))

(declare-fun c!823 () Bool)

(assert (=> d!3606 (= c!823 (not (= (size!287 (buf!632 (_2!744 lt!18151))) #b00000000000000000000000000000000)))))

(declare-fun lt!18576 () Unit!970)

(declare-fun lt!18570 () Unit!970)

(assert (=> d!3606 (= lt!18576 lt!18570)))

(assert (=> d!3606 (isPrefixOf!0 (_2!744 lt!18157) (_2!744 lt!18157))))

(assert (=> d!3606 (= lt!18570 (lemmaIsPrefixRefl!0 (_2!744 lt!18157)))))

(declare-fun lt!18571 () Unit!970)

(declare-fun lt!18575 () Unit!970)

(assert (=> d!3606 (= lt!18571 lt!18575)))

(assert (=> d!3606 (= lt!18575 (lemmaIsPrefixRefl!0 (_2!744 lt!18157)))))

(declare-fun lt!18581 () Unit!970)

(declare-fun lt!18572 () Unit!970)

(assert (=> d!3606 (= lt!18581 lt!18572)))

(assert (=> d!3606 (isPrefixOf!0 lt!18574 lt!18574)))

(assert (=> d!3606 (= lt!18572 (lemmaIsPrefixRefl!0 lt!18574))))

(declare-fun lt!18587 () Unit!970)

(declare-fun lt!18586 () Unit!970)

(assert (=> d!3606 (= lt!18587 lt!18586)))

(assert (=> d!3606 (isPrefixOf!0 (_2!744 lt!18151) (_2!744 lt!18151))))

(assert (=> d!3606 (= lt!18586 (lemmaIsPrefixRefl!0 (_2!744 lt!18151)))))

(assert (=> d!3606 (= lt!18574 (BitStream!541 (buf!632 (_2!744 lt!18157)) (currentByte!1704 (_2!744 lt!18151)) (currentBit!1699 (_2!744 lt!18151))))))

(assert (=> d!3606 (isPrefixOf!0 (_2!744 lt!18151) (_2!744 lt!18157))))

(assert (=> d!3606 (= (reader!0 (_2!744 lt!18151) (_2!744 lt!18157)) lt!18582)))

(declare-fun b!11661 () Bool)

(declare-fun res!11356 () Bool)

(assert (=> b!11661 (=> (not res!11356) (not e!7087))))

(assert (=> b!11661 (= res!11356 (isPrefixOf!0 (_1!745 lt!18582) (_2!744 lt!18151)))))

(assert (= (and d!3606 c!823) b!11657))

(assert (= (and d!3606 (not c!823)) b!11659))

(assert (= (and d!3606 res!11357) b!11661))

(assert (= (and b!11661 res!11356) b!11660))

(assert (= (and b!11660 res!11358) b!11658))

(assert (=> b!11657 m!16775))

(declare-fun m!17183 () Bool)

(assert (=> b!11657 m!17183))

(declare-fun m!17185 () Bool)

(assert (=> b!11657 m!17185))

(declare-fun m!17187 () Bool)

(assert (=> b!11661 m!17187))

(declare-fun m!17189 () Bool)

(assert (=> d!3606 m!17189))

(declare-fun m!17191 () Bool)

(assert (=> d!3606 m!17191))

(assert (=> d!3606 m!17089))

(declare-fun m!17193 () Bool)

(assert (=> d!3606 m!17193))

(declare-fun m!17195 () Bool)

(assert (=> d!3606 m!17195))

(declare-fun m!17197 () Bool)

(assert (=> d!3606 m!17197))

(declare-fun m!17199 () Bool)

(assert (=> d!3606 m!17199))

(assert (=> d!3606 m!17091))

(declare-fun m!17201 () Bool)

(assert (=> d!3606 m!17201))

(declare-fun m!17203 () Bool)

(assert (=> d!3606 m!17203))

(declare-fun m!17205 () Bool)

(assert (=> d!3606 m!17205))

(declare-fun m!17207 () Bool)

(assert (=> b!11658 m!17207))

(assert (=> b!11658 m!16801))

(assert (=> b!11658 m!16775))

(declare-fun m!17209 () Bool)

(assert (=> b!11660 m!17209))

(assert (=> b!11470 d!3606))

(declare-fun d!3608 () Bool)

(assert (=> d!3608 (isPrefixOf!0 thiss!1486 (_2!744 lt!18157))))

(declare-fun lt!18592 () Unit!970)

(declare-fun choose!30 (BitStream!540 BitStream!540 BitStream!540) Unit!970)

(assert (=> d!3608 (= lt!18592 (choose!30 thiss!1486 (_2!744 lt!18151) (_2!744 lt!18157)))))

(assert (=> d!3608 (isPrefixOf!0 thiss!1486 (_2!744 lt!18151))))

(assert (=> d!3608 (= (lemmaIsPrefixTransitive!0 thiss!1486 (_2!744 lt!18151) (_2!744 lt!18157)) lt!18592)))

(declare-fun bs!1046 () Bool)

(assert (= bs!1046 d!3608))

(assert (=> bs!1046 m!16763))

(declare-fun m!17211 () Bool)

(assert (=> bs!1046 m!17211))

(declare-fun m!17213 () Bool)

(assert (=> bs!1046 m!17213))

(assert (=> b!11470 d!3608))

(declare-fun d!3610 () Bool)

(declare-fun e!7090 () Bool)

(assert (=> d!3610 e!7090))

(declare-fun res!11361 () Bool)

(assert (=> d!3610 (=> (not res!11361) (not e!7090))))

(assert (=> d!3610 (= res!11361 (or (= (bvand lt!18145 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!18167 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!18145 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!18145 lt!18167) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!18595 () Unit!970)

(declare-fun choose!27 (BitStream!540 BitStream!540 (_ BitVec 64) (_ BitVec 64)) Unit!970)

(assert (=> d!3610 (= lt!18595 (choose!27 thiss!1486 (_2!744 lt!18151) lt!18145 lt!18167))))

(assert (=> d!3610 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!18167) (bvsle lt!18167 lt!18145))))

(assert (=> d!3610 (= (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!744 lt!18151) lt!18145 lt!18167) lt!18595)))

(declare-fun b!11664 () Bool)

(assert (=> b!11664 (= e!7090 (validate_offset_bits!1 ((_ sign_extend 32) (size!287 (buf!632 (_2!744 lt!18151)))) ((_ sign_extend 32) (currentByte!1704 (_2!744 lt!18151))) ((_ sign_extend 32) (currentBit!1699 (_2!744 lt!18151))) (bvsub lt!18145 lt!18167)))))

(assert (= (and d!3610 res!11361) b!11664))

(declare-fun m!17215 () Bool)

(assert (=> d!3610 m!17215))

(assert (=> b!11664 m!16769))

(assert (=> b!11470 d!3610))

(declare-fun d!3612 () Bool)

(declare-fun e!7091 () Bool)

(assert (=> d!3612 e!7091))

(declare-fun res!11362 () Bool)

(assert (=> d!3612 (=> (not res!11362) (not e!7091))))

(declare-fun lt!18596 () (_ BitVec 64))

(declare-fun lt!18598 () (_ BitVec 64))

(declare-fun lt!18601 () (_ BitVec 64))

(assert (=> d!3612 (= res!11362 (= lt!18601 (bvsub lt!18598 lt!18596)))))

(assert (=> d!3612 (or (= (bvand lt!18598 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!18596 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!18598 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!18598 lt!18596) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3612 (= lt!18596 (remainingBits!0 ((_ sign_extend 32) (size!287 (buf!632 (_2!744 lt!18157)))) ((_ sign_extend 32) (currentByte!1704 (_2!744 lt!18157))) ((_ sign_extend 32) (currentBit!1699 (_2!744 lt!18157)))))))

(declare-fun lt!18599 () (_ BitVec 64))

(declare-fun lt!18597 () (_ BitVec 64))

(assert (=> d!3612 (= lt!18598 (bvmul lt!18599 lt!18597))))

(assert (=> d!3612 (or (= lt!18599 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!18597 (bvsdiv (bvmul lt!18599 lt!18597) lt!18599)))))

(assert (=> d!3612 (= lt!18597 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!3612 (= lt!18599 ((_ sign_extend 32) (size!287 (buf!632 (_2!744 lt!18157)))))))

(assert (=> d!3612 (= lt!18601 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1704 (_2!744 lt!18157))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1699 (_2!744 lt!18157)))))))

(assert (=> d!3612 (invariant!0 (currentBit!1699 (_2!744 lt!18157)) (currentByte!1704 (_2!744 lt!18157)) (size!287 (buf!632 (_2!744 lt!18157))))))

(assert (=> d!3612 (= (bitIndex!0 (size!287 (buf!632 (_2!744 lt!18157))) (currentByte!1704 (_2!744 lt!18157)) (currentBit!1699 (_2!744 lt!18157))) lt!18601)))

(declare-fun b!11665 () Bool)

(declare-fun res!11363 () Bool)

(assert (=> b!11665 (=> (not res!11363) (not e!7091))))

(assert (=> b!11665 (= res!11363 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!18601))))

(declare-fun b!11666 () Bool)

(declare-fun lt!18600 () (_ BitVec 64))

(assert (=> b!11666 (= e!7091 (bvsle lt!18601 (bvmul lt!18600 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!11666 (or (= lt!18600 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!18600 #b0000000000000000000000000000000000000000000000000000000000001000) lt!18600)))))

(assert (=> b!11666 (= lt!18600 ((_ sign_extend 32) (size!287 (buf!632 (_2!744 lt!18157)))))))

(assert (= (and d!3612 res!11362) b!11665))

(assert (= (and b!11665 res!11363) b!11666))

(declare-fun m!17217 () Bool)

(assert (=> d!3612 m!17217))

(declare-fun m!17219 () Bool)

(assert (=> d!3612 m!17219))

(assert (=> b!11470 d!3612))

(declare-fun d!3614 () Bool)

(declare-fun e!7093 () Bool)

(assert (=> d!3614 e!7093))

(declare-fun c!824 () Bool)

(assert (=> d!3614 (= c!824 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!18603 () List!166)

(declare-fun e!7092 () tuple2!1416)

(assert (=> d!3614 (= lt!18603 (_1!757 e!7092))))

(declare-fun c!825 () Bool)

(assert (=> d!3614 (= c!825 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3614 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3614 (= (bitStreamReadBitsIntoList!0 (_2!744 lt!18151) (_1!745 lt!18164) #b0000000000000000000000000000000000000000000000000000000000000001) lt!18603)))

(declare-fun b!11667 () Bool)

(assert (=> b!11667 (= e!7092 (tuple2!1417 Nil!163 (_1!745 lt!18164)))))

(declare-fun b!11670 () Bool)

(assert (=> b!11670 (= e!7093 (> (length!34 lt!18603) 0))))

(declare-fun b!11669 () Bool)

(assert (=> b!11669 (= e!7093 (isEmpty!39 lt!18603))))

(declare-fun lt!18602 () (_ BitVec 64))

(declare-fun b!11668 () Bool)

(declare-fun lt!18604 () tuple2!1418)

(assert (=> b!11668 (= e!7092 (tuple2!1417 (Cons!162 (_1!758 lt!18604) (bitStreamReadBitsIntoList!0 (_2!744 lt!18151) (_2!758 lt!18604) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!18602))) (_2!758 lt!18604)))))

(assert (=> b!11668 (= lt!18604 (readBit!0 (_1!745 lt!18164)))))

(assert (=> b!11668 (= lt!18602 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!3614 c!825) b!11667))

(assert (= (and d!3614 (not c!825)) b!11668))

(assert (= (and d!3614 c!824) b!11669))

(assert (= (and d!3614 (not c!824)) b!11670))

(declare-fun m!17221 () Bool)

(assert (=> b!11670 m!17221))

(declare-fun m!17223 () Bool)

(assert (=> b!11669 m!17223))

(declare-fun m!17225 () Bool)

(assert (=> b!11668 m!17225))

(declare-fun m!17227 () Bool)

(assert (=> b!11668 m!17227))

(assert (=> b!11470 d!3614))

(declare-fun b!11671 () Bool)

(declare-fun e!7094 () Unit!970)

(declare-fun lt!18618 () Unit!970)

(assert (=> b!11671 (= e!7094 lt!18618)))

(declare-fun lt!18608 () (_ BitVec 64))

(assert (=> b!11671 (= lt!18608 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!18614 () (_ BitVec 64))

(assert (=> b!11671 (= lt!18614 (bitIndex!0 (size!287 (buf!632 thiss!1486)) (currentByte!1704 thiss!1486) (currentBit!1699 thiss!1486)))))

(assert (=> b!11671 (= lt!18618 (arrayBitRangesEqSymmetric!0 (buf!632 thiss!1486) (buf!632 (_2!744 lt!18151)) lt!18608 lt!18614))))

(assert (=> b!11671 (arrayBitRangesEq!0 (buf!632 (_2!744 lt!18151)) (buf!632 thiss!1486) lt!18608 lt!18614)))

(declare-fun e!7095 () Bool)

(declare-fun lt!18615 () (_ BitVec 64))

(declare-fun b!11672 () Bool)

(declare-fun lt!18613 () (_ BitVec 64))

(declare-fun lt!18617 () tuple2!1398)

(assert (=> b!11672 (= e!7095 (= (_1!745 lt!18617) (withMovedBitIndex!0 (_2!745 lt!18617) (bvsub lt!18615 lt!18613))))))

(assert (=> b!11672 (or (= (bvand lt!18615 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!18613 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!18615 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!18615 lt!18613) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!11672 (= lt!18613 (bitIndex!0 (size!287 (buf!632 (_2!744 lt!18151))) (currentByte!1704 (_2!744 lt!18151)) (currentBit!1699 (_2!744 lt!18151))))))

(assert (=> b!11672 (= lt!18615 (bitIndex!0 (size!287 (buf!632 thiss!1486)) (currentByte!1704 thiss!1486) (currentBit!1699 thiss!1486)))))

(declare-fun b!11673 () Bool)

(declare-fun Unit!1006 () Unit!970)

(assert (=> b!11673 (= e!7094 Unit!1006)))

(declare-fun b!11674 () Bool)

(declare-fun res!11366 () Bool)

(assert (=> b!11674 (=> (not res!11366) (not e!7095))))

(assert (=> b!11674 (= res!11366 (isPrefixOf!0 (_2!745 lt!18617) (_2!744 lt!18151)))))

(declare-fun d!3616 () Bool)

(assert (=> d!3616 e!7095))

(declare-fun res!11365 () Bool)

(assert (=> d!3616 (=> (not res!11365) (not e!7095))))

(assert (=> d!3616 (= res!11365 (isPrefixOf!0 (_1!745 lt!18617) (_2!745 lt!18617)))))

(declare-fun lt!18609 () BitStream!540)

(assert (=> d!3616 (= lt!18617 (tuple2!1399 lt!18609 (_2!744 lt!18151)))))

(declare-fun lt!18620 () Unit!970)

(declare-fun lt!18623 () Unit!970)

(assert (=> d!3616 (= lt!18620 lt!18623)))

(assert (=> d!3616 (isPrefixOf!0 lt!18609 (_2!744 lt!18151))))

(assert (=> d!3616 (= lt!18623 (lemmaIsPrefixTransitive!0 lt!18609 (_2!744 lt!18151) (_2!744 lt!18151)))))

(declare-fun lt!18619 () Unit!970)

(declare-fun lt!18624 () Unit!970)

(assert (=> d!3616 (= lt!18619 lt!18624)))

(assert (=> d!3616 (isPrefixOf!0 lt!18609 (_2!744 lt!18151))))

(assert (=> d!3616 (= lt!18624 (lemmaIsPrefixTransitive!0 lt!18609 thiss!1486 (_2!744 lt!18151)))))

(declare-fun lt!18612 () Unit!970)

(assert (=> d!3616 (= lt!18612 e!7094)))

(declare-fun c!826 () Bool)

(assert (=> d!3616 (= c!826 (not (= (size!287 (buf!632 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!18611 () Unit!970)

(declare-fun lt!18605 () Unit!970)

(assert (=> d!3616 (= lt!18611 lt!18605)))

(assert (=> d!3616 (isPrefixOf!0 (_2!744 lt!18151) (_2!744 lt!18151))))

(assert (=> d!3616 (= lt!18605 (lemmaIsPrefixRefl!0 (_2!744 lt!18151)))))

(declare-fun lt!18606 () Unit!970)

(declare-fun lt!18610 () Unit!970)

(assert (=> d!3616 (= lt!18606 lt!18610)))

(assert (=> d!3616 (= lt!18610 (lemmaIsPrefixRefl!0 (_2!744 lt!18151)))))

(declare-fun lt!18616 () Unit!970)

(declare-fun lt!18607 () Unit!970)

(assert (=> d!3616 (= lt!18616 lt!18607)))

(assert (=> d!3616 (isPrefixOf!0 lt!18609 lt!18609)))

(assert (=> d!3616 (= lt!18607 (lemmaIsPrefixRefl!0 lt!18609))))

(declare-fun lt!18622 () Unit!970)

(declare-fun lt!18621 () Unit!970)

(assert (=> d!3616 (= lt!18622 lt!18621)))

(assert (=> d!3616 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!3616 (= lt!18621 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!3616 (= lt!18609 (BitStream!541 (buf!632 (_2!744 lt!18151)) (currentByte!1704 thiss!1486) (currentBit!1699 thiss!1486)))))

(assert (=> d!3616 (isPrefixOf!0 thiss!1486 (_2!744 lt!18151))))

(assert (=> d!3616 (= (reader!0 thiss!1486 (_2!744 lt!18151)) lt!18617)))

(declare-fun b!11675 () Bool)

(declare-fun res!11364 () Bool)

(assert (=> b!11675 (=> (not res!11364) (not e!7095))))

(assert (=> b!11675 (= res!11364 (isPrefixOf!0 (_1!745 lt!18617) thiss!1486))))

(assert (= (and d!3616 c!826) b!11671))

(assert (= (and d!3616 (not c!826)) b!11673))

(assert (= (and d!3616 res!11365) b!11675))

(assert (= (and b!11675 res!11364) b!11674))

(assert (= (and b!11674 res!11366) b!11672))

(assert (=> b!11671 m!16479))

(declare-fun m!17229 () Bool)

(assert (=> b!11671 m!17229))

(declare-fun m!17231 () Bool)

(assert (=> b!11671 m!17231))

(declare-fun m!17233 () Bool)

(assert (=> b!11675 m!17233))

(assert (=> d!3616 m!17089))

(assert (=> d!3616 m!17213))

(assert (=> d!3616 m!16739))

(declare-fun m!17235 () Bool)

(assert (=> d!3616 m!17235))

(assert (=> d!3616 m!17091))

(declare-fun m!17237 () Bool)

(assert (=> d!3616 m!17237))

(declare-fun m!17239 () Bool)

(assert (=> d!3616 m!17239))

(assert (=> d!3616 m!16741))

(declare-fun m!17241 () Bool)

(assert (=> d!3616 m!17241))

(declare-fun m!17243 () Bool)

(assert (=> d!3616 m!17243))

(declare-fun m!17245 () Bool)

(assert (=> d!3616 m!17245))

(declare-fun m!17247 () Bool)

(assert (=> b!11672 m!17247))

(assert (=> b!11672 m!16775))

(assert (=> b!11672 m!16479))

(declare-fun m!17249 () Bool)

(assert (=> b!11674 m!17249))

(assert (=> b!11470 d!3616))

(declare-fun d!3618 () Bool)

(assert (=> d!3618 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!287 (buf!632 (_2!744 lt!18157)))) ((_ sign_extend 32) (currentByte!1704 (_2!744 lt!18151))) ((_ sign_extend 32) (currentBit!1699 (_2!744 lt!18151))) lt!18174) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!287 (buf!632 (_2!744 lt!18157)))) ((_ sign_extend 32) (currentByte!1704 (_2!744 lt!18151))) ((_ sign_extend 32) (currentBit!1699 (_2!744 lt!18151)))) lt!18174))))

(declare-fun bs!1047 () Bool)

(assert (= bs!1047 d!3618))

(declare-fun m!17251 () Bool)

(assert (=> bs!1047 m!17251))

(assert (=> b!11470 d!3618))

(declare-fun d!3620 () Bool)

(assert (=> d!3620 (= (bitAt!0 (buf!632 (_2!744 lt!18151)) lt!18168) (bitAt!0 (buf!632 (_2!744 lt!18157)) lt!18168))))

(declare-fun lt!18627 () Unit!970)

(declare-fun choose!31 (array!665 array!665 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!970)

(assert (=> d!3620 (= lt!18627 (choose!31 (buf!632 (_2!744 lt!18151)) (buf!632 (_2!744 lt!18157)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!18168 (bitIndex!0 (size!287 (buf!632 (_2!744 lt!18151))) (currentByte!1704 (_2!744 lt!18151)) (currentBit!1699 (_2!744 lt!18151)))))))

(assert (=> d!3620 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!287 (buf!632 (_2!744 lt!18151))) (currentByte!1704 (_2!744 lt!18151)) (currentBit!1699 (_2!744 lt!18151)))))))

(assert (=> d!3620 (= (arrayBitRangesEqImpliesEq!0 (buf!632 (_2!744 lt!18151)) (buf!632 (_2!744 lt!18157)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!18168 (bitIndex!0 (size!287 (buf!632 (_2!744 lt!18151))) (currentByte!1704 (_2!744 lt!18151)) (currentBit!1699 (_2!744 lt!18151)))) lt!18627)))

(declare-fun bs!1048 () Bool)

(assert (= bs!1048 d!3620))

(assert (=> bs!1048 m!16759))

(assert (=> bs!1048 m!16813))

(assert (=> bs!1048 m!16775))

(declare-fun m!17253 () Bool)

(assert (=> bs!1048 m!17253))

(assert (=> b!11470 d!3620))

(declare-fun d!3622 () Bool)

(assert (=> d!3622 (validate_offset_bits!1 ((_ sign_extend 32) (size!287 (buf!632 (_2!744 lt!18157)))) ((_ sign_extend 32) (currentByte!1704 (_2!744 lt!18151))) ((_ sign_extend 32) (currentBit!1699 (_2!744 lt!18151))) lt!18174)))

(declare-fun lt!18628 () Unit!970)

(assert (=> d!3622 (= lt!18628 (choose!9 (_2!744 lt!18151) (buf!632 (_2!744 lt!18157)) lt!18174 (BitStream!541 (buf!632 (_2!744 lt!18157)) (currentByte!1704 (_2!744 lt!18151)) (currentBit!1699 (_2!744 lt!18151)))))))

(assert (=> d!3622 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!744 lt!18151) (buf!632 (_2!744 lt!18157)) lt!18174) lt!18628)))

(declare-fun bs!1049 () Bool)

(assert (= bs!1049 d!3622))

(assert (=> bs!1049 m!16795))

(declare-fun m!17255 () Bool)

(assert (=> bs!1049 m!17255))

(assert (=> b!11470 d!3622))

(declare-fun d!3624 () Bool)

(assert (=> d!3624 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!287 (buf!632 (_2!744 lt!18151)))) ((_ sign_extend 32) (currentByte!1704 thiss!1486)) ((_ sign_extend 32) (currentBit!1699 thiss!1486)) lt!18173) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!287 (buf!632 (_2!744 lt!18151)))) ((_ sign_extend 32) (currentByte!1704 thiss!1486)) ((_ sign_extend 32) (currentBit!1699 thiss!1486))) lt!18173))))

(declare-fun bs!1050 () Bool)

(assert (= bs!1050 d!3624))

(declare-fun m!17257 () Bool)

(assert (=> bs!1050 m!17257))

(assert (=> b!11470 d!3624))

(declare-fun d!3626 () Bool)

(assert (=> d!3626 (validate_offset_bits!1 ((_ sign_extend 32) (size!287 (buf!632 (_2!744 lt!18157)))) ((_ sign_extend 32) (currentByte!1704 thiss!1486)) ((_ sign_extend 32) (currentBit!1699 thiss!1486)) lt!18134)))

(declare-fun lt!18629 () Unit!970)

(assert (=> d!3626 (= lt!18629 (choose!9 thiss!1486 (buf!632 (_2!744 lt!18157)) lt!18134 (BitStream!541 (buf!632 (_2!744 lt!18157)) (currentByte!1704 thiss!1486) (currentBit!1699 thiss!1486))))))

(assert (=> d!3626 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!632 (_2!744 lt!18157)) lt!18134) lt!18629)))

(declare-fun bs!1051 () Bool)

(assert (= bs!1051 d!3626))

(assert (=> bs!1051 m!16787))

(declare-fun m!17259 () Bool)

(assert (=> bs!1051 m!17259))

(assert (=> b!11470 d!3626))

(declare-fun d!3628 () Bool)

(assert (=> d!3628 (= (tail!72 lt!18144) (t!916 lt!18144))))

(assert (=> b!11470 d!3628))

(assert (=> b!11470 d!3488))

(declare-fun d!3630 () Bool)

(assert (=> d!3630 (= (bitAt!0 (buf!632 (_2!744 lt!18151)) lt!18168) (not (= (bvand ((_ sign_extend 24) (select (arr!707 (buf!632 (_2!744 lt!18151))) ((_ extract 31 0) (bvsdiv lt!18168 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!18168 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!1052 () Bool)

(assert (= bs!1052 d!3630))

(declare-fun m!17261 () Bool)

(assert (=> bs!1052 m!17261))

(assert (=> bs!1052 m!17083))

(assert (=> b!11470 d!3630))

(declare-fun d!3632 () Bool)

(assert (=> d!3632 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!287 (buf!632 (_2!744 lt!18151)))) ((_ sign_extend 32) (currentByte!1704 (_2!744 lt!18151))) ((_ sign_extend 32) (currentBit!1699 (_2!744 lt!18151))) (bvsub lt!18145 lt!18167)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!287 (buf!632 (_2!744 lt!18151)))) ((_ sign_extend 32) (currentByte!1704 (_2!744 lt!18151))) ((_ sign_extend 32) (currentBit!1699 (_2!744 lt!18151)))) (bvsub lt!18145 lt!18167)))))

(declare-fun bs!1053 () Bool)

(assert (= bs!1053 d!3632))

(assert (=> bs!1053 m!17173))

(assert (=> b!11470 d!3632))

(declare-fun d!3634 () Bool)

(declare-fun c!827 () Bool)

(assert (=> d!3634 (= c!827 (= (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!7096 () List!166)

(assert (=> d!3634 (= (byteArrayBitContentToList!0 (_2!744 lt!18157) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)) e!7096)))

(declare-fun b!11676 () Bool)

(assert (=> b!11676 (= e!7096 Nil!163)))

(declare-fun b!11677 () Bool)

(assert (=> b!11677 (= e!7096 (Cons!162 (not (= (bvand ((_ sign_extend 24) (select (arr!707 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!744 lt!18157) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!3634 c!827) b!11676))

(assert (= (and d!3634 (not c!827)) b!11677))

(assert (=> b!11677 m!16793))

(assert (=> b!11677 m!17029))

(assert (=> b!11677 m!16783))

(assert (=> b!11470 d!3634))

(declare-fun d!3636 () Bool)

(declare-fun c!828 () Bool)

(assert (=> d!3636 (= c!828 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!7097 () List!166)

(assert (=> d!3636 (= (byteArrayBitContentToList!0 (_2!744 lt!18151) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001) e!7097)))

(declare-fun b!11678 () Bool)

(assert (=> b!11678 (= e!7097 Nil!163)))

(declare-fun b!11679 () Bool)

(assert (=> b!11679 (= e!7097 (Cons!162 (not (= (bvand ((_ sign_extend 24) (select (arr!707 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!744 lt!18151) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!3636 c!828) b!11678))

(assert (= (and d!3636 (not c!828)) b!11679))

(assert (=> b!11679 m!16793))

(assert (=> b!11679 m!17029))

(declare-fun m!17263 () Bool)

(assert (=> b!11679 m!17263))

(assert (=> b!11470 d!3636))

(declare-fun d!3638 () Bool)

(declare-fun c!829 () Bool)

(assert (=> d!3638 (= c!829 (= (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!7098 () List!166)

(assert (=> d!3638 (= (byteArrayBitContentToList!0 (_2!744 lt!18157) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)) e!7098)))

(declare-fun b!11680 () Bool)

(assert (=> b!11680 (= e!7098 Nil!163)))

(declare-fun b!11681 () Bool)

(assert (=> b!11681 (= e!7098 (Cons!162 (not (= (bvand ((_ sign_extend 24) (select (arr!707 srcBuffer!6) ((_ extract 31 0) (bvsdiv (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!744 lt!18157) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!3638 c!829) b!11680))

(assert (= (and d!3638 (not c!829)) b!11681))

(assert (=> b!11681 m!17045))

(assert (=> b!11681 m!17047))

(declare-fun m!17265 () Bool)

(assert (=> b!11681 m!17265))

(assert (=> b!11470 d!3638))

(declare-fun d!3640 () Bool)

(declare-fun e!7100 () Bool)

(assert (=> d!3640 e!7100))

(declare-fun c!830 () Bool)

(assert (=> d!3640 (= c!830 (= (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!18631 () List!166)

(declare-fun e!7099 () tuple2!1416)

(assert (=> d!3640 (= lt!18631 (_1!757 e!7099))))

(declare-fun c!831 () Bool)

(assert (=> d!3640 (= c!831 (= (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3640 (bvsge (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3640 (= (bitStreamReadBitsIntoList!0 (_2!744 lt!18157) (_1!745 lt!18148) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)) lt!18631)))

(declare-fun b!11682 () Bool)

(assert (=> b!11682 (= e!7099 (tuple2!1417 Nil!163 (_1!745 lt!18148)))))

(declare-fun b!11685 () Bool)

(assert (=> b!11685 (= e!7100 (> (length!34 lt!18631) 0))))

(declare-fun b!11684 () Bool)

(assert (=> b!11684 (= e!7100 (isEmpty!39 lt!18631))))

(declare-fun lt!18630 () (_ BitVec 64))

(declare-fun b!11683 () Bool)

(declare-fun lt!18632 () tuple2!1418)

(assert (=> b!11683 (= e!7099 (tuple2!1417 (Cons!162 (_1!758 lt!18632) (bitStreamReadBitsIntoList!0 (_2!744 lt!18157) (_2!758 lt!18632) (bvsub (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001) lt!18630))) (_2!758 lt!18632)))))

(assert (=> b!11683 (= lt!18632 (readBit!0 (_1!745 lt!18148)))))

(assert (=> b!11683 (= lt!18630 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!3640 c!831) b!11682))

(assert (= (and d!3640 (not c!831)) b!11683))

(assert (= (and d!3640 c!830) b!11684))

(assert (= (and d!3640 (not c!830)) b!11685))

(declare-fun m!17267 () Bool)

(assert (=> b!11685 m!17267))

(declare-fun m!17269 () Bool)

(assert (=> b!11684 m!17269))

(declare-fun m!17271 () Bool)

(assert (=> b!11683 m!17271))

(declare-fun m!17273 () Bool)

(assert (=> b!11683 m!17273))

(assert (=> b!11470 d!3640))

(declare-fun d!3642 () Bool)

(declare-fun e!7102 () Bool)

(assert (=> d!3642 e!7102))

(declare-fun c!832 () Bool)

(assert (=> d!3642 (= c!832 (= (bvsub lt!18149 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!18634 () List!166)

(declare-fun e!7101 () tuple2!1416)

(assert (=> d!3642 (= lt!18634 (_1!757 e!7101))))

(declare-fun c!833 () Bool)

(assert (=> d!3642 (= c!833 (= (bvsub lt!18149 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3642 (bvsge (bvsub lt!18149 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3642 (= (bitStreamReadBitsIntoList!0 (_2!744 lt!18157) (_1!745 lt!18148) (bvsub lt!18149 #b0000000000000000000000000000000000000000000000000000000000000001)) lt!18634)))

(declare-fun b!11686 () Bool)

(assert (=> b!11686 (= e!7101 (tuple2!1417 Nil!163 (_1!745 lt!18148)))))

(declare-fun b!11689 () Bool)

(assert (=> b!11689 (= e!7102 (> (length!34 lt!18634) 0))))

(declare-fun b!11688 () Bool)

(assert (=> b!11688 (= e!7102 (isEmpty!39 lt!18634))))

(declare-fun lt!18633 () (_ BitVec 64))

(declare-fun lt!18635 () tuple2!1418)

(declare-fun b!11687 () Bool)

(assert (=> b!11687 (= e!7101 (tuple2!1417 (Cons!162 (_1!758 lt!18635) (bitStreamReadBitsIntoList!0 (_2!744 lt!18157) (_2!758 lt!18635) (bvsub (bvsub lt!18149 #b0000000000000000000000000000000000000000000000000000000000000001) lt!18633))) (_2!758 lt!18635)))))

(assert (=> b!11687 (= lt!18635 (readBit!0 (_1!745 lt!18148)))))

(assert (=> b!11687 (= lt!18633 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!3642 c!833) b!11686))

(assert (= (and d!3642 (not c!833)) b!11687))

(assert (= (and d!3642 c!832) b!11688))

(assert (= (and d!3642 (not c!832)) b!11689))

(declare-fun m!17275 () Bool)

(assert (=> b!11689 m!17275))

(declare-fun m!17277 () Bool)

(assert (=> b!11688 m!17277))

(declare-fun m!17279 () Bool)

(assert (=> b!11687 m!17279))

(assert (=> b!11687 m!17273))

(assert (=> b!11470 d!3642))

(declare-fun d!3644 () Bool)

(assert (=> d!3644 (= (head!64 (bitStreamReadBitsIntoList!0 (_2!744 lt!18151) (_1!745 lt!18164) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!281 (bitStreamReadBitsIntoList!0 (_2!744 lt!18151) (_1!745 lt!18164) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!11470 d!3644))

(declare-fun b!11707 () Bool)

(declare-fun e!7114 () Bool)

(declare-datatypes ((tuple2!1420 0))(
  ( (tuple2!1421 (_1!759 BitStream!540) (_2!759 Bool)) )
))
(declare-fun lt!18662 () tuple2!1420)

(declare-fun lt!18665 () tuple2!1396)

(assert (=> b!11707 (= e!7114 (= (bitIndex!0 (size!287 (buf!632 (_1!759 lt!18662))) (currentByte!1704 (_1!759 lt!18662)) (currentBit!1699 (_1!759 lt!18662))) (bitIndex!0 (size!287 (buf!632 (_2!744 lt!18665))) (currentByte!1704 (_2!744 lt!18665)) (currentBit!1699 (_2!744 lt!18665)))))))

(declare-fun b!11708 () Bool)

(declare-fun e!7112 () Bool)

(declare-fun e!7111 () Bool)

(assert (=> b!11708 (= e!7112 e!7111)))

(declare-fun res!11389 () Bool)

(assert (=> b!11708 (=> (not res!11389) (not e!7111))))

(declare-fun lt!18670 () tuple2!1420)

(declare-fun lt!18663 () Bool)

(declare-fun lt!18669 () tuple2!1396)

(assert (=> b!11708 (= res!11389 (and (= (_2!759 lt!18670) lt!18663) (= (_1!759 lt!18670) (_2!744 lt!18669))))))

(declare-fun readBitPure!0 (BitStream!540) tuple2!1420)

(declare-fun readerFrom!0 (BitStream!540 (_ BitVec 32) (_ BitVec 32)) BitStream!540)

(assert (=> b!11708 (= lt!18670 (readBitPure!0 (readerFrom!0 (_2!744 lt!18669) (currentBit!1699 thiss!1486) (currentByte!1704 thiss!1486))))))

(declare-fun b!11709 () Bool)

(declare-fun res!11383 () Bool)

(declare-fun e!7113 () Bool)

(assert (=> b!11709 (=> (not res!11383) (not e!7113))))

(declare-fun lt!18666 () (_ BitVec 64))

(declare-fun lt!18661 () (_ BitVec 64))

(assert (=> b!11709 (= res!11383 (= (bitIndex!0 (size!287 (buf!632 (_2!744 lt!18665))) (currentByte!1704 (_2!744 lt!18665)) (currentBit!1699 (_2!744 lt!18665))) (bvadd lt!18666 lt!18661)))))

(assert (=> b!11709 (or (not (= (bvand lt!18666 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!18661 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!18666 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!18666 lt!18661) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!11709 (= lt!18661 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!11709 (= lt!18666 (bitIndex!0 (size!287 (buf!632 thiss!1486)) (currentByte!1704 thiss!1486) (currentBit!1699 thiss!1486)))))

(declare-fun b!11710 () Bool)

(declare-fun res!11384 () Bool)

(assert (=> b!11710 (=> (not res!11384) (not e!7112))))

(assert (=> b!11710 (= res!11384 (isPrefixOf!0 thiss!1486 (_2!744 lt!18669)))))

(declare-fun b!11711 () Bool)

(assert (=> b!11711 (= e!7113 e!7114)))

(declare-fun res!11388 () Bool)

(assert (=> b!11711 (=> (not res!11388) (not e!7114))))

(declare-fun lt!18660 () (_ BitVec 8))

(assert (=> b!11711 (= res!11388 (and (= (_2!759 lt!18662) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!707 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!18660)) #b00000000000000000000000000000000))) (= (_1!759 lt!18662) (_2!744 lt!18665))))))

(declare-fun lt!18667 () tuple2!1400)

(declare-fun lt!18671 () BitStream!540)

(assert (=> b!11711 (= lt!18667 (readBits!0 lt!18671 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!11711 (= lt!18662 (readBitPure!0 lt!18671))))

(assert (=> b!11711 (= lt!18671 (readerFrom!0 (_2!744 lt!18665) (currentBit!1699 thiss!1486) (currentByte!1704 thiss!1486)))))

(declare-fun d!3646 () Bool)

(assert (=> d!3646 e!7113))

(declare-fun res!11386 () Bool)

(assert (=> d!3646 (=> (not res!11386) (not e!7113))))

(assert (=> d!3646 (= res!11386 (= (size!287 (buf!632 (_2!744 lt!18665))) (size!287 (buf!632 thiss!1486))))))

(declare-fun lt!18668 () array!665)

(assert (=> d!3646 (= lt!18660 (select (arr!707 lt!18668) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!3646 (and (bvsge ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!287 lt!18668)))))

(assert (=> d!3646 (= lt!18668 (array!666 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!18664 () tuple2!1396)

(assert (=> d!3646 (= lt!18665 (tuple2!1397 (_1!744 lt!18664) (_2!744 lt!18664)))))

(assert (=> d!3646 (= lt!18664 lt!18669)))

(assert (=> d!3646 e!7112))

(declare-fun res!11390 () Bool)

(assert (=> d!3646 (=> (not res!11390) (not e!7112))))

(assert (=> d!3646 (= res!11390 (= (size!287 (buf!632 thiss!1486)) (size!287 (buf!632 (_2!744 lt!18669)))))))

(declare-fun appendBit!0 (BitStream!540 Bool) tuple2!1396)

(assert (=> d!3646 (= lt!18669 (appendBit!0 thiss!1486 lt!18663))))

(assert (=> d!3646 (= lt!18663 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!707 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!3646 (and (bvsge ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!3646 (= (appendBitFromByte!0 thiss!1486 (select (arr!707 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!18665)))

(declare-fun b!11712 () Bool)

(declare-fun res!11385 () Bool)

(assert (=> b!11712 (=> (not res!11385) (not e!7112))))

(assert (=> b!11712 (= res!11385 (= (bitIndex!0 (size!287 (buf!632 (_2!744 lt!18669))) (currentByte!1704 (_2!744 lt!18669)) (currentBit!1699 (_2!744 lt!18669))) (bvadd (bitIndex!0 (size!287 (buf!632 thiss!1486)) (currentByte!1704 thiss!1486) (currentBit!1699 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!11713 () Bool)

(assert (=> b!11713 (= e!7111 (= (bitIndex!0 (size!287 (buf!632 (_1!759 lt!18670))) (currentByte!1704 (_1!759 lt!18670)) (currentBit!1699 (_1!759 lt!18670))) (bitIndex!0 (size!287 (buf!632 (_2!744 lt!18669))) (currentByte!1704 (_2!744 lt!18669)) (currentBit!1699 (_2!744 lt!18669)))))))

(declare-fun b!11714 () Bool)

(declare-fun res!11387 () Bool)

(assert (=> b!11714 (=> (not res!11387) (not e!7113))))

(assert (=> b!11714 (= res!11387 (isPrefixOf!0 thiss!1486 (_2!744 lt!18665)))))

(assert (= (and d!3646 res!11390) b!11712))

(assert (= (and b!11712 res!11385) b!11710))

(assert (= (and b!11710 res!11384) b!11708))

(assert (= (and b!11708 res!11389) b!11713))

(assert (= (and d!3646 res!11386) b!11709))

(assert (= (and b!11709 res!11383) b!11714))

(assert (= (and b!11714 res!11387) b!11711))

(assert (= (and b!11711 res!11388) b!11707))

(declare-fun m!17281 () Bool)

(assert (=> d!3646 m!17281))

(declare-fun m!17283 () Bool)

(assert (=> d!3646 m!17283))

(assert (=> d!3646 m!17029))

(declare-fun m!17285 () Bool)

(assert (=> b!11709 m!17285))

(assert (=> b!11709 m!16479))

(declare-fun m!17287 () Bool)

(assert (=> b!11712 m!17287))

(assert (=> b!11712 m!16479))

(declare-fun m!17289 () Bool)

(assert (=> b!11708 m!17289))

(assert (=> b!11708 m!17289))

(declare-fun m!17291 () Bool)

(assert (=> b!11708 m!17291))

(declare-fun m!17293 () Bool)

(assert (=> b!11714 m!17293))

(declare-fun m!17295 () Bool)

(assert (=> b!11710 m!17295))

(declare-fun m!17297 () Bool)

(assert (=> b!11711 m!17297))

(declare-fun m!17299 () Bool)

(assert (=> b!11711 m!17299))

(declare-fun m!17301 () Bool)

(assert (=> b!11711 m!17301))

(declare-fun m!17303 () Bool)

(assert (=> b!11713 m!17303))

(assert (=> b!11713 m!17287))

(declare-fun m!17305 () Bool)

(assert (=> b!11707 m!17305))

(assert (=> b!11707 m!17285))

(assert (=> b!11470 d!3646))

(declare-fun d!3648 () Bool)

(assert (=> d!3648 (= (remainingBits!0 ((_ sign_extend 32) (size!287 (buf!632 thiss!1486))) ((_ sign_extend 32) (currentByte!1704 thiss!1486)) ((_ sign_extend 32) (currentBit!1699 thiss!1486))) (bvsub (bvmul ((_ sign_extend 32) (size!287 (buf!632 thiss!1486))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!1704 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1699 thiss!1486)))))))

(assert (=> d!3492 d!3648))

(declare-fun d!3650 () Bool)

(declare-fun res!11393 () Bool)

(declare-fun e!7116 () Bool)

(assert (=> d!3650 (=> (not res!11393) (not e!7116))))

(assert (=> d!3650 (= res!11393 (= (size!287 (buf!632 thiss!1486)) (size!287 (buf!632 (_2!744 lt!18143)))))))

(assert (=> d!3650 (= (isPrefixOf!0 thiss!1486 (_2!744 lt!18143)) e!7116)))

(declare-fun b!11715 () Bool)

(declare-fun res!11392 () Bool)

(assert (=> b!11715 (=> (not res!11392) (not e!7116))))

(assert (=> b!11715 (= res!11392 (bvsle (bitIndex!0 (size!287 (buf!632 thiss!1486)) (currentByte!1704 thiss!1486) (currentBit!1699 thiss!1486)) (bitIndex!0 (size!287 (buf!632 (_2!744 lt!18143))) (currentByte!1704 (_2!744 lt!18143)) (currentBit!1699 (_2!744 lt!18143)))))))

(declare-fun b!11716 () Bool)

(declare-fun e!7115 () Bool)

(assert (=> b!11716 (= e!7116 e!7115)))

(declare-fun res!11391 () Bool)

(assert (=> b!11716 (=> res!11391 e!7115)))

(assert (=> b!11716 (= res!11391 (= (size!287 (buf!632 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!11717 () Bool)

(assert (=> b!11717 (= e!7115 (arrayBitRangesEq!0 (buf!632 thiss!1486) (buf!632 (_2!744 lt!18143)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!287 (buf!632 thiss!1486)) (currentByte!1704 thiss!1486) (currentBit!1699 thiss!1486))))))

(assert (= (and d!3650 res!11393) b!11715))

(assert (= (and b!11715 res!11392) b!11716))

(assert (= (and b!11716 (not res!11391)) b!11717))

(assert (=> b!11715 m!16479))

(assert (=> b!11715 m!16737))

(assert (=> b!11717 m!16479))

(assert (=> b!11717 m!16479))

(declare-fun m!17307 () Bool)

(assert (=> b!11717 m!17307))

(assert (=> b!11471 d!3650))

(declare-fun d!3652 () Bool)

(assert (=> d!3652 (= (invariant!0 (currentBit!1699 (_2!746 lt!18383)) (currentByte!1704 (_2!746 lt!18383)) (size!287 (buf!632 (_2!746 lt!18383)))) (and (bvsge (currentBit!1699 (_2!746 lt!18383)) #b00000000000000000000000000000000) (bvslt (currentBit!1699 (_2!746 lt!18383)) #b00000000000000000000000000001000) (bvsge (currentByte!1704 (_2!746 lt!18383)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1704 (_2!746 lt!18383)) (size!287 (buf!632 (_2!746 lt!18383)))) (and (= (currentBit!1699 (_2!746 lt!18383)) #b00000000000000000000000000000000) (= (currentByte!1704 (_2!746 lt!18383)) (size!287 (buf!632 (_2!746 lt!18383))))))))))

(assert (=> b!11550 d!3652))

(declare-fun b!11718 () Bool)

(declare-fun e!7117 () Unit!970)

(declare-fun lt!18685 () Unit!970)

(assert (=> b!11718 (= e!7117 lt!18685)))

(declare-fun lt!18675 () (_ BitVec 64))

(assert (=> b!11718 (= lt!18675 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!18681 () (_ BitVec 64))

(assert (=> b!11718 (= lt!18681 (bitIndex!0 (size!287 (buf!632 thiss!1486)) (currentByte!1704 thiss!1486) (currentBit!1699 thiss!1486)))))

(assert (=> b!11718 (= lt!18685 (arrayBitRangesEqSymmetric!0 (buf!632 thiss!1486) (buf!632 (ite c!797 (_2!744 lt!18157) thiss!1486)) lt!18675 lt!18681))))

(assert (=> b!11718 (arrayBitRangesEq!0 (buf!632 (ite c!797 (_2!744 lt!18157) thiss!1486)) (buf!632 thiss!1486) lt!18675 lt!18681)))

(declare-fun e!7118 () Bool)

(declare-fun lt!18682 () (_ BitVec 64))

(declare-fun b!11719 () Bool)

(declare-fun lt!18680 () (_ BitVec 64))

(declare-fun lt!18684 () tuple2!1398)

(assert (=> b!11719 (= e!7118 (= (_1!745 lt!18684) (withMovedBitIndex!0 (_2!745 lt!18684) (bvsub lt!18682 lt!18680))))))

(assert (=> b!11719 (or (= (bvand lt!18682 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!18680 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!18682 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!18682 lt!18680) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!11719 (= lt!18680 (bitIndex!0 (size!287 (buf!632 (ite c!797 (_2!744 lt!18157) thiss!1486))) (currentByte!1704 (ite c!797 (_2!744 lt!18157) thiss!1486)) (currentBit!1699 (ite c!797 (_2!744 lt!18157) thiss!1486))))))

(assert (=> b!11719 (= lt!18682 (bitIndex!0 (size!287 (buf!632 thiss!1486)) (currentByte!1704 thiss!1486) (currentBit!1699 thiss!1486)))))

(declare-fun b!11720 () Bool)

(declare-fun Unit!1007 () Unit!970)

(assert (=> b!11720 (= e!7117 Unit!1007)))

(declare-fun b!11721 () Bool)

(declare-fun res!11396 () Bool)

(assert (=> b!11721 (=> (not res!11396) (not e!7118))))

(assert (=> b!11721 (= res!11396 (isPrefixOf!0 (_2!745 lt!18684) (ite c!797 (_2!744 lt!18157) thiss!1486)))))

(declare-fun d!3654 () Bool)

(assert (=> d!3654 e!7118))

(declare-fun res!11395 () Bool)

(assert (=> d!3654 (=> (not res!11395) (not e!7118))))

(assert (=> d!3654 (= res!11395 (isPrefixOf!0 (_1!745 lt!18684) (_2!745 lt!18684)))))

(declare-fun lt!18676 () BitStream!540)

(assert (=> d!3654 (= lt!18684 (tuple2!1399 lt!18676 (ite c!797 (_2!744 lt!18157) thiss!1486)))))

(declare-fun lt!18687 () Unit!970)

(declare-fun lt!18690 () Unit!970)

(assert (=> d!3654 (= lt!18687 lt!18690)))

(assert (=> d!3654 (isPrefixOf!0 lt!18676 (ite c!797 (_2!744 lt!18157) thiss!1486))))

(assert (=> d!3654 (= lt!18690 (lemmaIsPrefixTransitive!0 lt!18676 (ite c!797 (_2!744 lt!18157) thiss!1486) (ite c!797 (_2!744 lt!18157) thiss!1486)))))

(declare-fun lt!18686 () Unit!970)

(declare-fun lt!18691 () Unit!970)

(assert (=> d!3654 (= lt!18686 lt!18691)))

(assert (=> d!3654 (isPrefixOf!0 lt!18676 (ite c!797 (_2!744 lt!18157) thiss!1486))))

(assert (=> d!3654 (= lt!18691 (lemmaIsPrefixTransitive!0 lt!18676 thiss!1486 (ite c!797 (_2!744 lt!18157) thiss!1486)))))

(declare-fun lt!18679 () Unit!970)

(assert (=> d!3654 (= lt!18679 e!7117)))

(declare-fun c!834 () Bool)

(assert (=> d!3654 (= c!834 (not (= (size!287 (buf!632 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!18678 () Unit!970)

(declare-fun lt!18672 () Unit!970)

(assert (=> d!3654 (= lt!18678 lt!18672)))

(assert (=> d!3654 (isPrefixOf!0 (ite c!797 (_2!744 lt!18157) thiss!1486) (ite c!797 (_2!744 lt!18157) thiss!1486))))

(assert (=> d!3654 (= lt!18672 (lemmaIsPrefixRefl!0 (ite c!797 (_2!744 lt!18157) thiss!1486)))))

(declare-fun lt!18673 () Unit!970)

(declare-fun lt!18677 () Unit!970)

(assert (=> d!3654 (= lt!18673 lt!18677)))

(assert (=> d!3654 (= lt!18677 (lemmaIsPrefixRefl!0 (ite c!797 (_2!744 lt!18157) thiss!1486)))))

(declare-fun lt!18683 () Unit!970)

(declare-fun lt!18674 () Unit!970)

(assert (=> d!3654 (= lt!18683 lt!18674)))

(assert (=> d!3654 (isPrefixOf!0 lt!18676 lt!18676)))

(assert (=> d!3654 (= lt!18674 (lemmaIsPrefixRefl!0 lt!18676))))

(declare-fun lt!18689 () Unit!970)

(declare-fun lt!18688 () Unit!970)

(assert (=> d!3654 (= lt!18689 lt!18688)))

(assert (=> d!3654 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!3654 (= lt!18688 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!3654 (= lt!18676 (BitStream!541 (buf!632 (ite c!797 (_2!744 lt!18157) thiss!1486)) (currentByte!1704 thiss!1486) (currentBit!1699 thiss!1486)))))

(assert (=> d!3654 (isPrefixOf!0 thiss!1486 (ite c!797 (_2!744 lt!18157) thiss!1486))))

(assert (=> d!3654 (= (reader!0 thiss!1486 (ite c!797 (_2!744 lt!18157) thiss!1486)) lt!18684)))

(declare-fun b!11722 () Bool)

(declare-fun res!11394 () Bool)

(assert (=> b!11722 (=> (not res!11394) (not e!7118))))

(assert (=> b!11722 (= res!11394 (isPrefixOf!0 (_1!745 lt!18684) thiss!1486))))

(assert (= (and d!3654 c!834) b!11718))

(assert (= (and d!3654 (not c!834)) b!11720))

(assert (= (and d!3654 res!11395) b!11722))

(assert (= (and b!11722 res!11394) b!11721))

(assert (= (and b!11721 res!11396) b!11719))

(assert (=> b!11718 m!16479))

(declare-fun m!17309 () Bool)

(assert (=> b!11718 m!17309))

(declare-fun m!17311 () Bool)

(assert (=> b!11718 m!17311))

(declare-fun m!17313 () Bool)

(assert (=> b!11722 m!17313))

(declare-fun m!17315 () Bool)

(assert (=> d!3654 m!17315))

(declare-fun m!17317 () Bool)

(assert (=> d!3654 m!17317))

(assert (=> d!3654 m!16739))

(declare-fun m!17319 () Bool)

(assert (=> d!3654 m!17319))

(declare-fun m!17321 () Bool)

(assert (=> d!3654 m!17321))

(declare-fun m!17323 () Bool)

(assert (=> d!3654 m!17323))

(declare-fun m!17325 () Bool)

(assert (=> d!3654 m!17325))

(assert (=> d!3654 m!16741))

(declare-fun m!17327 () Bool)

(assert (=> d!3654 m!17327))

(declare-fun m!17329 () Bool)

(assert (=> d!3654 m!17329))

(declare-fun m!17331 () Bool)

(assert (=> d!3654 m!17331))

(declare-fun m!17333 () Bool)

(assert (=> b!11719 m!17333))

(declare-fun m!17335 () Bool)

(assert (=> b!11719 m!17335))

(assert (=> b!11719 m!16479))

(declare-fun m!17337 () Bool)

(assert (=> b!11721 m!17337))

(assert (=> bm!209 d!3654))

(declare-fun d!3656 () Bool)

(assert (=> d!3656 (= (invariant!0 (currentBit!1699 thiss!1486) (currentByte!1704 thiss!1486) (size!287 (buf!632 thiss!1486))) (and (bvsge (currentBit!1699 thiss!1486) #b00000000000000000000000000000000) (bvslt (currentBit!1699 thiss!1486) #b00000000000000000000000000001000) (bvsge (currentByte!1704 thiss!1486) #b00000000000000000000000000000000) (or (bvslt (currentByte!1704 thiss!1486) (size!287 (buf!632 thiss!1486))) (and (= (currentBit!1699 thiss!1486) #b00000000000000000000000000000000) (= (currentByte!1704 thiss!1486) (size!287 (buf!632 thiss!1486)))))))))

(assert (=> d!3572 d!3656))

(assert (=> d!3568 d!3566))

(declare-fun d!3658 () Bool)

(assert (=> d!3658 (checkByteArrayBitContent!0 (_2!744 lt!17700) srcBuffer!6 (_1!746 lt!17701) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460)))

(assert (=> d!3658 true))

(declare-fun _$35!8 () Unit!970)

(assert (=> d!3658 (= (choose!65 (_2!744 lt!17700) srcBuffer!6 (_1!746 lt!17701) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) _$35!8)))

(declare-fun bs!1054 () Bool)

(assert (= bs!1054 d!3658))

(assert (=> bs!1054 m!16489))

(assert (=> d!3568 d!3658))

(declare-fun d!3660 () Bool)

(assert (=> d!3660 (= (remainingBits!0 ((_ sign_extend 32) (size!287 (buf!632 (_2!744 lt!17700)))) ((_ sign_extend 32) (currentByte!1704 thiss!1486)) ((_ sign_extend 32) (currentBit!1699 thiss!1486))) (bvsub (bvmul ((_ sign_extend 32) (size!287 (buf!632 (_2!744 lt!17700)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!1704 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1699 thiss!1486)))))))

(assert (=> d!3510 d!3660))

(declare-fun d!3662 () Bool)

(assert (=> d!3662 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!287 (buf!632 thiss!1486))) ((_ sign_extend 32) (currentByte!1704 thiss!1486)) ((_ sign_extend 32) (currentBit!1699 thiss!1486)) lt!18136) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!287 (buf!632 thiss!1486))) ((_ sign_extend 32) (currentByte!1704 thiss!1486)) ((_ sign_extend 32) (currentBit!1699 thiss!1486))) lt!18136))))

(declare-fun bs!1055 () Bool)

(assert (= bs!1055 d!3662))

(assert (=> bs!1055 m!16611))

(assert (=> b!11474 d!3662))

(declare-fun d!3664 () Bool)

(declare-fun c!835 () Bool)

(assert (=> d!3664 (= c!835 (= (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!7119 () List!166)

(assert (=> d!3664 (= (byteArrayBitContentToList!0 (_2!744 lt!17700) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001)) e!7119)))

(declare-fun b!11723 () Bool)

(assert (=> b!11723 (= e!7119 Nil!163)))

(declare-fun b!11724 () Bool)

(assert (=> b!11724 (= e!7119 (Cons!162 (not (= (bvand ((_ sign_extend 24) (select (arr!707 srcBuffer!6) ((_ extract 31 0) (bvsdiv (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!744 lt!17700) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!3664 c!835) b!11723))

(assert (= (and d!3664 (not c!835)) b!11724))

(assert (=> b!11724 m!17045))

(assert (=> b!11724 m!17047))

(declare-fun m!17339 () Bool)

(assert (=> b!11724 m!17339))

(assert (=> b!11613 d!3664))

(declare-fun b!11743 () Bool)

(declare-fun res!11412 () Bool)

(declare-fun e!7131 () Bool)

(assert (=> b!11743 (=> (not res!11412) (not e!7131))))

(declare-fun lt!18776 () tuple3!88)

(assert (=> b!11743 (= res!11412 (and (= (buf!632 (_1!745 lt!17697)) (buf!632 (_2!755 lt!18776))) (= (size!287 (array!666 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) (size!287 (_3!47 lt!18776)))))))

(declare-fun b!11744 () Bool)

(declare-fun res!11414 () Bool)

(assert (=> b!11744 (=> (not res!11414) (not e!7131))))

(assert (=> b!11744 (= res!11414 (arrayBitRangesEq!0 (array!666 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) (_3!47 lt!18776) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!11745 () Bool)

(assert (=> b!11745 (= e!7131 (= (byteArrayBitContentToList!0 (_2!755 lt!18776) (_3!47 lt!18776) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000)) (bitStreamReadBitsIntoList!0 (_2!755 lt!18776) (_1!745 lt!17697) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!11745 (or (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!11745 (or (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!18778 () Unit!970)

(declare-fun e!7130 () tuple3!88)

(declare-fun b!11746 () Bool)

(assert (=> b!11746 (= e!7130 (tuple3!89 lt!18778 (_1!745 lt!17697) (array!666 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))))))

(declare-fun lt!18773 () Unit!970)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!665) Unit!970)

(assert (=> b!11746 (= lt!18773 (arrayBitRangesEqReflexiveLemma!0 (array!666 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))))))

(declare-fun call!221 () Bool)

(assert (=> b!11746 call!221))

(declare-fun lt!18789 () Unit!970)

(assert (=> b!11746 (= lt!18789 lt!18773)))

(declare-fun lt!18772 () array!665)

(assert (=> b!11746 (= lt!18772 (array!666 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!18782 () array!665)

(assert (=> b!11746 (= lt!18782 (array!666 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!18767 () (_ BitVec 64))

(assert (=> b!11746 (= lt!18767 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!18786 () (_ BitVec 64))

(assert (=> b!11746 (= lt!18786 ((_ sign_extend 32) (size!287 (array!666 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))))))

(declare-fun lt!18798 () (_ BitVec 64))

(assert (=> b!11746 (= lt!18798 (bvmul lt!18786 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!18785 () (_ BitVec 64))

(assert (=> b!11746 (= lt!18785 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!18788 () (_ BitVec 64))

(assert (=> b!11746 (= lt!18788 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!665 array!665 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!970)

(assert (=> b!11746 (= lt!18778 (arrayBitRangesEqSlicedLemma!0 lt!18772 lt!18782 lt!18767 lt!18798 lt!18785 lt!18788))))

(declare-fun call!222 () Bool)

(assert (=> b!11746 call!222))

(declare-fun b!11747 () Bool)

(declare-fun lt!18779 () Unit!970)

(declare-fun lt!18793 () tuple3!88)

(assert (=> b!11747 (= e!7130 (tuple3!89 lt!18779 (_2!755 lt!18793) (_3!47 lt!18793)))))

(declare-fun lt!18796 () tuple2!1418)

(assert (=> b!11747 (= lt!18796 (readBit!0 (_1!745 lt!17697)))))

(declare-fun lt!18787 () (_ BitVec 32))

(assert (=> b!11747 (= lt!18787 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!18797 () (_ BitVec 32))

(assert (=> b!11747 (= lt!18797 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!18784 () array!665)

(assert (=> b!11747 (= lt!18784 (array!666 (store (arr!707 (array!666 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!18787 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!707 (array!666 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!18787)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!18797)))) ((_ sign_extend 24) (ite (_1!758 lt!18796) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!18797) #b00000000))))) (size!287 (array!666 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))))))

(declare-fun lt!18766 () (_ BitVec 64))

(assert (=> b!11747 (= lt!18766 (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!18783 () (_ BitVec 64))

(assert (=> b!11747 (= lt!18783 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!18768 () Unit!970)

(assert (=> b!11747 (= lt!18768 (validateOffsetBitsIneqLemma!0 (_1!745 lt!17697) (_2!758 lt!18796) lt!18766 lt!18783))))

(assert (=> b!11747 (validate_offset_bits!1 ((_ sign_extend 32) (size!287 (buf!632 (_2!758 lt!18796)))) ((_ sign_extend 32) (currentByte!1704 (_2!758 lt!18796))) ((_ sign_extend 32) (currentBit!1699 (_2!758 lt!18796))) (bvsub lt!18766 lt!18783))))

(declare-fun lt!18781 () Unit!970)

(assert (=> b!11747 (= lt!18781 lt!18768)))

(assert (=> b!11747 (= lt!18793 (readBitsLoop!0 (_2!758 lt!18796) nBits!460 lt!18784 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!460))))

(declare-fun res!11411 () Bool)

(assert (=> b!11747 (= res!11411 (= (bvsub (bvadd (bitIndex!0 (size!287 (buf!632 (_1!745 lt!17697))) (currentByte!1704 (_1!745 lt!17697)) (currentBit!1699 (_1!745 lt!17697))) nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000) (bitIndex!0 (size!287 (buf!632 (_2!755 lt!18793))) (currentByte!1704 (_2!755 lt!18793)) (currentBit!1699 (_2!755 lt!18793)))))))

(declare-fun e!7129 () Bool)

(assert (=> b!11747 (=> (not res!11411) (not e!7129))))

(assert (=> b!11747 e!7129))

(declare-fun lt!18799 () Unit!970)

(declare-fun Unit!1008 () Unit!970)

(assert (=> b!11747 (= lt!18799 Unit!1008)))

(declare-fun lt!18774 () (_ BitVec 32))

(assert (=> b!11747 (= lt!18774 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!18770 () (_ BitVec 32))

(assert (=> b!11747 (= lt!18770 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!18794 () Unit!970)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!665 (_ BitVec 64) Bool) Unit!970)

(assert (=> b!11747 (= lt!18794 (arrayBitRangesUpdatedAtLemma!0 (array!666 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 (_1!758 lt!18796)))))

(assert (=> b!11747 call!221))

(declare-fun lt!18764 () Unit!970)

(assert (=> b!11747 (= lt!18764 lt!18794)))

(declare-fun lt!18792 () (_ BitVec 64))

(assert (=> b!11747 (= lt!18792 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!18791 () Unit!970)

(declare-fun arrayBitRangesEqTransitive!0 (array!665 array!665 array!665 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!970)

(assert (=> b!11747 (= lt!18791 (arrayBitRangesEqTransitive!0 (array!666 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) lt!18784 (_3!47 lt!18793) lt!18792 #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!11747 (arrayBitRangesEq!0 (array!666 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) (_3!47 lt!18793) lt!18792 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!18775 () Unit!970)

(assert (=> b!11747 (= lt!18775 lt!18791)))

(assert (=> b!11747 call!222))

(declare-fun lt!18765 () Unit!970)

(declare-fun Unit!1009 () Unit!970)

(assert (=> b!11747 (= lt!18765 Unit!1009)))

(declare-fun lt!18795 () Unit!970)

(assert (=> b!11747 (= lt!18795 (arrayBitRangesEqImpliesEq!0 lt!18784 (_3!47 lt!18793) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!11747 (= (bitAt!0 lt!18784 #b0000000000000000000000000000000000000000000000000000000000000000) (bitAt!0 (_3!47 lt!18793) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!18780 () Unit!970)

(assert (=> b!11747 (= lt!18780 lt!18795)))

(declare-fun lt!18777 () Unit!970)

(declare-fun Unit!1010 () Unit!970)

(assert (=> b!11747 (= lt!18777 Unit!1010)))

(declare-fun lt!18790 () Bool)

(assert (=> b!11747 (= lt!18790 (= (bitAt!0 (_3!47 lt!18793) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!758 lt!18796)))))

(declare-fun Unit!1011 () Unit!970)

(assert (=> b!11747 (= lt!18779 Unit!1011)))

(assert (=> b!11747 lt!18790))

(declare-fun c!838 () Bool)

(declare-fun bm!218 () Bool)

(assert (=> bm!218 (= call!222 (arrayBitRangesEq!0 (ite c!838 (array!666 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) lt!18772) (ite c!838 (_3!47 lt!18793) lt!18782) (ite c!838 #b0000000000000000000000000000000000000000000000000000000000000000 lt!18785) (ite c!838 #b0000000000000000000000000000000000000000000000000000000000000000 lt!18788)))))

(declare-fun b!11748 () Bool)

(declare-fun res!11415 () Bool)

(assert (=> b!11748 (=> (not res!11415) (not e!7131))))

(assert (=> b!11748 (= res!11415 (invariant!0 (currentBit!1699 (_2!755 lt!18776)) (currentByte!1704 (_2!755 lt!18776)) (size!287 (buf!632 (_2!755 lt!18776)))))))

(declare-fun d!3666 () Bool)

(assert (=> d!3666 e!7131))

(declare-fun res!11416 () Bool)

(assert (=> d!3666 (=> (not res!11416) (not e!7131))))

(declare-fun lt!18769 () (_ BitVec 64))

(assert (=> d!3666 (= res!11416 (= (bvsub lt!18769 #b0000000000000000000000000000000000000000000000000000000000000000) (bitIndex!0 (size!287 (buf!632 (_2!755 lt!18776))) (currentByte!1704 (_2!755 lt!18776)) (currentBit!1699 (_2!755 lt!18776)))))))

(assert (=> d!3666 (or (= (bvand lt!18769 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!18769 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!18769 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!18771 () (_ BitVec 64))

(assert (=> d!3666 (= lt!18769 (bvadd lt!18771 nBits!460))))

(assert (=> d!3666 (or (not (= (bvand lt!18771 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!18771 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!18771 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3666 (= lt!18771 (bitIndex!0 (size!287 (buf!632 (_1!745 lt!17697))) (currentByte!1704 (_1!745 lt!17697)) (currentBit!1699 (_1!745 lt!17697))))))

(assert (=> d!3666 (= lt!18776 e!7130)))

(assert (=> d!3666 (= c!838 (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!3666 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bvsle nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!3666 (= (readBitsLoop!0 (_1!745 lt!17697) nBits!460 (array!666 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!18776)))

(declare-fun b!11749 () Bool)

(assert (=> b!11749 (= e!7129 (and (= (buf!632 (_1!745 lt!17697)) (buf!632 (_2!755 lt!18793))) (= (size!287 (array!666 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) (size!287 (_3!47 lt!18793)))))))

(declare-fun b!11750 () Bool)

(declare-fun e!7128 () Bool)

(assert (=> b!11750 (= e!7128 (= (bitAt!0 (_3!47 lt!18776) #b0000000000000000000000000000000000000000000000000000000000000000) (_2!759 (readBitPure!0 (_1!745 lt!17697)))))))

(declare-fun b!11751 () Bool)

(declare-fun res!11413 () Bool)

(assert (=> b!11751 (=> (not res!11413) (not e!7131))))

(assert (=> b!11751 (= res!11413 e!7128)))

(declare-fun res!11417 () Bool)

(assert (=> b!11751 (=> res!11417 e!7128)))

(assert (=> b!11751 (= res!11417 (not (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460)))))

(declare-fun bm!219 () Bool)

(assert (=> bm!219 (= call!221 (arrayBitRangesEq!0 (array!666 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) (ite c!838 (array!666 (store (arr!707 (array!666 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!18774 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!707 (array!666 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!18774)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!18770)))) ((_ sign_extend 24) (ite (_1!758 lt!18796) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!18770) #b00000000))))) (size!287 (array!666 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) (array!666 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!838 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!287 (array!666 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (= (and d!3666 c!838) b!11747))

(assert (= (and d!3666 (not c!838)) b!11746))

(assert (= (and b!11747 res!11411) b!11749))

(assert (= (or b!11747 b!11746) bm!218))

(assert (= (or b!11747 b!11746) bm!219))

(assert (= (and d!3666 res!11416) b!11743))

(assert (= (and b!11743 res!11412) b!11744))

(assert (= (and b!11744 res!11414) b!11751))

(assert (= (and b!11751 (not res!11417)) b!11750))

(assert (= (and b!11751 res!11413) b!11748))

(assert (= (and b!11748 res!11415) b!11745))

(declare-fun m!17341 () Bool)

(assert (=> bm!218 m!17341))

(declare-fun m!17343 () Bool)

(assert (=> b!11745 m!17343))

(declare-fun m!17345 () Bool)

(assert (=> b!11745 m!17345))

(declare-fun m!17347 () Bool)

(assert (=> b!11746 m!17347))

(declare-fun m!17349 () Bool)

(assert (=> b!11746 m!17349))

(declare-fun m!17351 () Bool)

(assert (=> b!11748 m!17351))

(declare-fun m!17353 () Bool)

(assert (=> bm!219 m!17353))

(declare-fun m!17355 () Bool)

(assert (=> bm!219 m!17355))

(declare-fun m!17357 () Bool)

(assert (=> bm!219 m!17357))

(declare-fun m!17359 () Bool)

(assert (=> bm!219 m!17359))

(declare-fun m!17361 () Bool)

(assert (=> d!3666 m!17361))

(assert (=> d!3666 m!16961))

(declare-fun m!17363 () Bool)

(assert (=> b!11744 m!17363))

(declare-fun m!17365 () Bool)

(assert (=> b!11747 m!17365))

(assert (=> b!11747 m!16961))

(declare-fun m!17367 () Bool)

(assert (=> b!11747 m!17367))

(assert (=> b!11747 m!17027))

(declare-fun m!17369 () Bool)

(assert (=> b!11747 m!17369))

(declare-fun m!17371 () Bool)

(assert (=> b!11747 m!17371))

(declare-fun m!17373 () Bool)

(assert (=> b!11747 m!17373))

(declare-fun m!17375 () Bool)

(assert (=> b!11747 m!17375))

(declare-fun m!17377 () Bool)

(assert (=> b!11747 m!17377))

(declare-fun m!17379 () Bool)

(assert (=> b!11747 m!17379))

(declare-fun m!17381 () Bool)

(assert (=> b!11747 m!17381))

(declare-fun m!17383 () Bool)

(assert (=> b!11747 m!17383))

(declare-fun m!17385 () Bool)

(assert (=> b!11747 m!17385))

(declare-fun m!17387 () Bool)

(assert (=> b!11747 m!17387))

(declare-fun m!17389 () Bool)

(assert (=> b!11747 m!17389))

(declare-fun m!17391 () Bool)

(assert (=> b!11750 m!17391))

(declare-fun m!17393 () Bool)

(assert (=> b!11750 m!17393))

(assert (=> d!3512 d!3666))

(declare-fun d!3668 () Bool)

(get-info :version)

(assert (=> d!3668 (= (isEmpty!39 lt!18490) ((_ is Nil!163) lt!18490))))

(assert (=> b!11610 d!3668))

(declare-fun d!3670 () Bool)

(assert (=> d!3670 (= (invariant!0 (currentBit!1699 (BitStream!541 (buf!632 (_1!745 lt!17697)) (currentByte!1704 (_1!745 lt!17697)) (currentBit!1699 (_2!746 lt!17701)))) (currentByte!1704 (BitStream!541 (buf!632 (_1!745 lt!17697)) (currentByte!1704 (_1!745 lt!17697)) (currentBit!1699 (_2!746 lt!17701)))) (size!287 (buf!632 (BitStream!541 (buf!632 (_1!745 lt!17697)) (currentByte!1704 (_1!745 lt!17697)) (currentBit!1699 (_2!746 lt!17701)))))) (and (bvsge (currentBit!1699 (BitStream!541 (buf!632 (_1!745 lt!17697)) (currentByte!1704 (_1!745 lt!17697)) (currentBit!1699 (_2!746 lt!17701)))) #b00000000000000000000000000000000) (bvslt (currentBit!1699 (BitStream!541 (buf!632 (_1!745 lt!17697)) (currentByte!1704 (_1!745 lt!17697)) (currentBit!1699 (_2!746 lt!17701)))) #b00000000000000000000000000001000) (bvsge (currentByte!1704 (BitStream!541 (buf!632 (_1!745 lt!17697)) (currentByte!1704 (_1!745 lt!17697)) (currentBit!1699 (_2!746 lt!17701)))) #b00000000000000000000000000000000) (or (bvslt (currentByte!1704 (BitStream!541 (buf!632 (_1!745 lt!17697)) (currentByte!1704 (_1!745 lt!17697)) (currentBit!1699 (_2!746 lt!17701)))) (size!287 (buf!632 (BitStream!541 (buf!632 (_1!745 lt!17697)) (currentByte!1704 (_1!745 lt!17697)) (currentBit!1699 (_2!746 lt!17701)))))) (and (= (currentBit!1699 (BitStream!541 (buf!632 (_1!745 lt!17697)) (currentByte!1704 (_1!745 lt!17697)) (currentBit!1699 (_2!746 lt!17701)))) #b00000000000000000000000000000000) (= (currentByte!1704 (BitStream!541 (buf!632 (_1!745 lt!17697)) (currentByte!1704 (_1!745 lt!17697)) (currentBit!1699 (_2!746 lt!17701)))) (size!287 (buf!632 (BitStream!541 (buf!632 (_1!745 lt!17697)) (currentByte!1704 (_1!745 lt!17697)) (currentBit!1699 (_2!746 lt!17701))))))))))))

(assert (=> d!3562 d!3670))

(declare-fun d!3672 () Bool)

(declare-fun e!7132 () Bool)

(assert (=> d!3672 e!7132))

(declare-fun res!11418 () Bool)

(assert (=> d!3672 (=> (not res!11418) (not e!7132))))

(declare-fun lt!18802 () (_ BitVec 64))

(declare-fun lt!18800 () (_ BitVec 64))

(declare-fun lt!18805 () (_ BitVec 64))

(assert (=> d!3672 (= res!11418 (= lt!18805 (bvsub lt!18802 lt!18800)))))

(assert (=> d!3672 (or (= (bvand lt!18802 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!18800 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!18802 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!18802 lt!18800) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3672 (= lt!18800 (remainingBits!0 ((_ sign_extend 32) (size!287 (buf!632 (_2!744 lt!18143)))) ((_ sign_extend 32) (currentByte!1704 (_2!744 lt!18143))) ((_ sign_extend 32) (currentBit!1699 (_2!744 lt!18143)))))))

(declare-fun lt!18803 () (_ BitVec 64))

(declare-fun lt!18801 () (_ BitVec 64))

(assert (=> d!3672 (= lt!18802 (bvmul lt!18803 lt!18801))))

(assert (=> d!3672 (or (= lt!18803 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!18801 (bvsdiv (bvmul lt!18803 lt!18801) lt!18803)))))

(assert (=> d!3672 (= lt!18801 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!3672 (= lt!18803 ((_ sign_extend 32) (size!287 (buf!632 (_2!744 lt!18143)))))))

(assert (=> d!3672 (= lt!18805 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1704 (_2!744 lt!18143))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1699 (_2!744 lt!18143)))))))

(assert (=> d!3672 (invariant!0 (currentBit!1699 (_2!744 lt!18143)) (currentByte!1704 (_2!744 lt!18143)) (size!287 (buf!632 (_2!744 lt!18143))))))

(assert (=> d!3672 (= (bitIndex!0 (size!287 (buf!632 (_2!744 lt!18143))) (currentByte!1704 (_2!744 lt!18143)) (currentBit!1699 (_2!744 lt!18143))) lt!18805)))

(declare-fun b!11752 () Bool)

(declare-fun res!11419 () Bool)

(assert (=> b!11752 (=> (not res!11419) (not e!7132))))

(assert (=> b!11752 (= res!11419 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!18805))))

(declare-fun b!11753 () Bool)

(declare-fun lt!18804 () (_ BitVec 64))

(assert (=> b!11753 (= e!7132 (bvsle lt!18805 (bvmul lt!18804 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!11753 (or (= lt!18804 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!18804 #b0000000000000000000000000000000000000000000000000000000000001000) lt!18804)))))

(assert (=> b!11753 (= lt!18804 ((_ sign_extend 32) (size!287 (buf!632 (_2!744 lt!18143)))))))

(assert (= (and d!3672 res!11418) b!11752))

(assert (= (and b!11752 res!11419) b!11753))

(declare-fun m!17395 () Bool)

(assert (=> d!3672 m!17395))

(assert (=> d!3672 m!16817))

(assert (=> d!3496 d!3672))

(assert (=> d!3496 d!3488))

(declare-fun d!3674 () Bool)

(declare-fun res!11422 () Bool)

(declare-fun e!7134 () Bool)

(assert (=> d!3674 (=> (not res!11422) (not e!7134))))

(assert (=> d!3674 (= res!11422 (= (size!287 (buf!632 thiss!1486)) (size!287 (buf!632 thiss!1486))))))

(assert (=> d!3674 (= (isPrefixOf!0 thiss!1486 thiss!1486) e!7134)))

(declare-fun b!11754 () Bool)

(declare-fun res!11421 () Bool)

(assert (=> b!11754 (=> (not res!11421) (not e!7134))))

(assert (=> b!11754 (= res!11421 (bvsle (bitIndex!0 (size!287 (buf!632 thiss!1486)) (currentByte!1704 thiss!1486) (currentBit!1699 thiss!1486)) (bitIndex!0 (size!287 (buf!632 thiss!1486)) (currentByte!1704 thiss!1486) (currentBit!1699 thiss!1486))))))

(declare-fun b!11755 () Bool)

(declare-fun e!7133 () Bool)

(assert (=> b!11755 (= e!7134 e!7133)))

(declare-fun res!11420 () Bool)

(assert (=> b!11755 (=> res!11420 e!7133)))

(assert (=> b!11755 (= res!11420 (= (size!287 (buf!632 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!11756 () Bool)

(assert (=> b!11756 (= e!7133 (arrayBitRangesEq!0 (buf!632 thiss!1486) (buf!632 thiss!1486) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!287 (buf!632 thiss!1486)) (currentByte!1704 thiss!1486) (currentBit!1699 thiss!1486))))))

(assert (= (and d!3674 res!11422) b!11754))

(assert (= (and b!11754 res!11421) b!11755))

(assert (= (and b!11755 (not res!11420)) b!11756))

(assert (=> b!11754 m!16479))

(assert (=> b!11754 m!16479))

(assert (=> b!11756 m!16479))

(assert (=> b!11756 m!16479))

(declare-fun m!17397 () Bool)

(assert (=> b!11756 m!17397))

(assert (=> d!3496 d!3674))

(declare-fun d!3676 () Bool)

(assert (=> d!3676 (isPrefixOf!0 thiss!1486 thiss!1486)))

(declare-fun lt!18808 () Unit!970)

(declare-fun choose!11 (BitStream!540) Unit!970)

(assert (=> d!3676 (= lt!18808 (choose!11 thiss!1486))))

(assert (=> d!3676 (= (lemmaIsPrefixRefl!0 thiss!1486) lt!18808)))

(declare-fun bs!1057 () Bool)

(assert (= bs!1057 d!3676))

(assert (=> bs!1057 m!16739))

(declare-fun m!17399 () Bool)

(assert (=> bs!1057 m!17399))

(assert (=> d!3496 d!3676))

(declare-fun d!3678 () Bool)

(declare-fun e!7136 () Bool)

(assert (=> d!3678 e!7136))

(declare-fun c!839 () Bool)

(assert (=> d!3678 (= c!839 (= (bvsub nBits!460 lt!18489) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!18810 () List!166)

(declare-fun e!7135 () tuple2!1416)

(assert (=> d!3678 (= lt!18810 (_1!757 e!7135))))

(declare-fun c!840 () Bool)

(assert (=> d!3678 (= c!840 (= (bvsub nBits!460 lt!18489) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3678 (bvsge (bvsub nBits!460 lt!18489) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3678 (= (bitStreamReadBitsIntoList!0 (_2!744 lt!17700) (_2!758 lt!18491) (bvsub nBits!460 lt!18489)) lt!18810)))

(declare-fun b!11757 () Bool)

(assert (=> b!11757 (= e!7135 (tuple2!1417 Nil!163 (_2!758 lt!18491)))))

(declare-fun b!11760 () Bool)

(assert (=> b!11760 (= e!7136 (> (length!34 lt!18810) 0))))

(declare-fun b!11759 () Bool)

(assert (=> b!11759 (= e!7136 (isEmpty!39 lt!18810))))

(declare-fun lt!18811 () tuple2!1418)

(declare-fun b!11758 () Bool)

(declare-fun lt!18809 () (_ BitVec 64))

(assert (=> b!11758 (= e!7135 (tuple2!1417 (Cons!162 (_1!758 lt!18811) (bitStreamReadBitsIntoList!0 (_2!744 lt!17700) (_2!758 lt!18811) (bvsub (bvsub nBits!460 lt!18489) lt!18809))) (_2!758 lt!18811)))))

(assert (=> b!11758 (= lt!18811 (readBit!0 (_2!758 lt!18491)))))

(assert (=> b!11758 (= lt!18809 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!3678 c!840) b!11757))

(assert (= (and d!3678 (not c!840)) b!11758))

(assert (= (and d!3678 c!839) b!11759))

(assert (= (and d!3678 (not c!839)) b!11760))

(declare-fun m!17401 () Bool)

(assert (=> b!11760 m!17401))

(declare-fun m!17403 () Bool)

(assert (=> b!11759 m!17403))

(declare-fun m!17405 () Bool)

(assert (=> b!11758 m!17405))

(declare-fun m!17407 () Bool)

(assert (=> b!11758 m!17407))

(assert (=> b!11609 d!3678))

(declare-fun d!3680 () Bool)

(declare-fun e!7143 () Bool)

(assert (=> d!3680 e!7143))

(declare-fun res!11425 () Bool)

(assert (=> d!3680 (=> (not res!11425) (not e!7143))))

(declare-fun increaseBitIndex!0 (BitStream!540) tuple2!1396)

(assert (=> d!3680 (= res!11425 (= (buf!632 (_2!744 (increaseBitIndex!0 (_1!745 lt!17697)))) (buf!632 (_1!745 lt!17697))))))

(declare-fun lt!18827 () Bool)

(assert (=> d!3680 (= lt!18827 (not (= (bvand ((_ sign_extend 24) (select (arr!707 (buf!632 (_1!745 lt!17697))) (currentByte!1704 (_1!745 lt!17697)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!1699 (_1!745 lt!17697))))) #b00000000000000000000000000000000)))))

(declare-fun lt!18831 () tuple2!1418)

(assert (=> d!3680 (= lt!18831 (tuple2!1419 (not (= (bvand ((_ sign_extend 24) (select (arr!707 (buf!632 (_1!745 lt!17697))) (currentByte!1704 (_1!745 lt!17697)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!1699 (_1!745 lt!17697))))) #b00000000000000000000000000000000)) (_2!744 (increaseBitIndex!0 (_1!745 lt!17697)))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!3680 (validate_offset_bit!0 ((_ sign_extend 32) (size!287 (buf!632 (_1!745 lt!17697)))) ((_ sign_extend 32) (currentByte!1704 (_1!745 lt!17697))) ((_ sign_extend 32) (currentBit!1699 (_1!745 lt!17697))))))

(assert (=> d!3680 (= (readBit!0 (_1!745 lt!17697)) lt!18831)))

(declare-fun lt!18829 () (_ BitVec 64))

(declare-fun lt!18830 () (_ BitVec 64))

(declare-fun b!11763 () Bool)

(assert (=> b!11763 (= e!7143 (= (bitIndex!0 (size!287 (buf!632 (_2!744 (increaseBitIndex!0 (_1!745 lt!17697))))) (currentByte!1704 (_2!744 (increaseBitIndex!0 (_1!745 lt!17697)))) (currentBit!1699 (_2!744 (increaseBitIndex!0 (_1!745 lt!17697))))) (bvadd lt!18830 lt!18829)))))

(assert (=> b!11763 (or (not (= (bvand lt!18830 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!18829 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!18830 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!18830 lt!18829) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!11763 (= lt!18829 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!11763 (= lt!18830 (bitIndex!0 (size!287 (buf!632 (_1!745 lt!17697))) (currentByte!1704 (_1!745 lt!17697)) (currentBit!1699 (_1!745 lt!17697))))))

(declare-fun lt!18826 () Bool)

(assert (=> b!11763 (= lt!18826 (not (= (bvand ((_ sign_extend 24) (select (arr!707 (buf!632 (_1!745 lt!17697))) (currentByte!1704 (_1!745 lt!17697)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!1699 (_1!745 lt!17697))))) #b00000000000000000000000000000000)))))

(declare-fun lt!18832 () Bool)

(assert (=> b!11763 (= lt!18832 (not (= (bvand ((_ sign_extend 24) (select (arr!707 (buf!632 (_1!745 lt!17697))) (currentByte!1704 (_1!745 lt!17697)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!1699 (_1!745 lt!17697))))) #b00000000000000000000000000000000)))))

(declare-fun lt!18828 () Bool)

(assert (=> b!11763 (= lt!18828 (not (= (bvand ((_ sign_extend 24) (select (arr!707 (buf!632 (_1!745 lt!17697))) (currentByte!1704 (_1!745 lt!17697)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!1699 (_1!745 lt!17697))))) #b00000000000000000000000000000000)))))

(assert (= (and d!3680 res!11425) b!11763))

(declare-fun m!17409 () Bool)

(assert (=> d!3680 m!17409))

(declare-fun m!17411 () Bool)

(assert (=> d!3680 m!17411))

(declare-fun m!17413 () Bool)

(assert (=> d!3680 m!17413))

(declare-fun m!17415 () Bool)

(assert (=> d!3680 m!17415))

(assert (=> b!11763 m!17409))

(assert (=> b!11763 m!16961))

(assert (=> b!11763 m!17411))

(declare-fun m!17417 () Bool)

(assert (=> b!11763 m!17417))

(assert (=> b!11763 m!17413))

(assert (=> b!11609 d!3680))

(declare-fun d!3682 () Bool)

(declare-fun res!11426 () Bool)

(declare-fun e!7144 () Bool)

(assert (=> d!3682 (=> res!11426 e!7144)))

(assert (=> d!3682 (= res!11426 (= (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3682 (= (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!746 (readBits!0 (_1!745 call!212) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367)) e!7144)))

(declare-fun b!11764 () Bool)

(declare-fun e!7145 () Bool)

(assert (=> b!11764 (= e!7144 e!7145)))

(declare-fun res!11427 () Bool)

(assert (=> b!11764 (=> (not res!11427) (not e!7145))))

(assert (=> b!11764 (= res!11427 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!707 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!707 (_1!746 (readBits!0 (_1!745 call!212) (bvsub (bvadd from!367 nBits!460) from!367)))) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!11765 () Bool)

(assert (=> b!11765 (= e!7145 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!746 (readBits!0 (_1!745 call!212) (bvsub (bvadd from!367 nBits!460) from!367))) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!3682 (not res!11426)) b!11764))

(assert (= (and b!11764 res!11427) b!11765))

(assert (=> b!11764 m!16793))

(assert (=> b!11764 m!17029))

(declare-fun m!17419 () Bool)

(assert (=> b!11764 m!17419))

(assert (=> b!11764 m!17017))

(declare-fun m!17421 () Bool)

(assert (=> b!11765 m!17421))

(assert (=> b!11467 d!3682))

(declare-fun lt!18835 () tuple2!1400)

(declare-fun b!11766 () Bool)

(declare-fun e!7146 () Bool)

(assert (=> b!11766 (= e!7146 (= (byteArrayBitContentToList!0 (_2!746 lt!18835) (_1!746 lt!18835) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367)) (bitStreamReadBitsIntoList!0 (_2!746 lt!18835) (_1!745 call!212) (bvsub (bvadd from!367 nBits!460) from!367))))))

(declare-fun b!11767 () Bool)

(declare-fun res!11430 () Bool)

(assert (=> b!11767 (=> (not res!11430) (not e!7146))))

(assert (=> b!11767 (= res!11430 (bvsle (currentByte!1704 (_1!745 call!212)) (currentByte!1704 (_2!746 lt!18835))))))

(declare-fun b!11768 () Bool)

(declare-fun res!11429 () Bool)

(assert (=> b!11768 (=> (not res!11429) (not e!7146))))

(declare-fun lt!18840 () (_ BitVec 64))

(assert (=> b!11768 (= res!11429 (= (bvadd lt!18840 (bvsub (bvadd from!367 nBits!460) from!367)) (bitIndex!0 (size!287 (buf!632 (_2!746 lt!18835))) (currentByte!1704 (_2!746 lt!18835)) (currentBit!1699 (_2!746 lt!18835)))))))

(assert (=> b!11768 (or (not (= (bvand lt!18840 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!18840 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!18840 (bvsub (bvadd from!367 nBits!460) from!367)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!11768 (= lt!18840 (bitIndex!0 (size!287 (buf!632 (_1!745 call!212))) (currentByte!1704 (_1!745 call!212)) (currentBit!1699 (_1!745 call!212))))))

(declare-fun b!11769 () Bool)

(declare-fun res!11432 () Bool)

(assert (=> b!11769 (=> (not res!11432) (not e!7146))))

(assert (=> b!11769 (= res!11432 (invariant!0 (currentBit!1699 (_2!746 lt!18835)) (currentByte!1704 (_2!746 lt!18835)) (size!287 (buf!632 (_2!746 lt!18835)))))))

(declare-fun d!3684 () Bool)

(assert (=> d!3684 e!7146))

(declare-fun res!11431 () Bool)

(assert (=> d!3684 (=> (not res!11431) (not e!7146))))

(assert (=> d!3684 (= res!11431 (= (buf!632 (_2!746 lt!18835)) (buf!632 (_1!745 call!212))))))

(declare-fun lt!18836 () tuple3!88)

(assert (=> d!3684 (= lt!18835 (tuple2!1401 (_3!47 lt!18836) (_2!755 lt!18836)))))

(assert (=> d!3684 (= lt!18836 (readBitsLoop!0 (_1!745 call!212) (bvsub (bvadd from!367 nBits!460) from!367) (array!666 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367)))))

(assert (=> d!3684 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367)) (bvsle (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!3684 (= (readBits!0 (_1!745 call!212) (bvsub (bvadd from!367 nBits!460) from!367)) lt!18835)))

(declare-fun b!11770 () Bool)

(declare-fun res!11428 () Bool)

(assert (=> b!11770 (=> (not res!11428) (not e!7146))))

(declare-fun lt!18837 () (_ BitVec 64))

(assert (=> b!11770 (= res!11428 (= (size!287 (_1!746 lt!18835)) ((_ extract 31 0) lt!18837)))))

(assert (=> b!11770 (and (bvslt lt!18837 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!18837 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!18834 () (_ BitVec 64))

(declare-fun lt!18841 () (_ BitVec 64))

(assert (=> b!11770 (= lt!18837 (bvsdiv lt!18834 lt!18841))))

(assert (=> b!11770 (and (not (= lt!18841 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!18834 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!18841 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!11770 (= lt!18841 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!18839 () (_ BitVec 64))

(declare-fun lt!18833 () (_ BitVec 64))

(assert (=> b!11770 (= lt!18834 (bvsub lt!18839 lt!18833))))

(assert (=> b!11770 (or (= (bvand lt!18839 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!18833 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!18839 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!18839 lt!18833) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!11770 (= lt!18833 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!18838 () (_ BitVec 64))

(assert (=> b!11770 (= lt!18839 (bvadd (bvsub (bvadd from!367 nBits!460) from!367) lt!18838))))

(assert (=> b!11770 (or (not (= (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!18838 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd (bvsub (bvadd from!367 nBits!460) from!367) lt!18838) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!11770 (= lt!18838 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (= (and d!3684 res!11431) b!11768))

(assert (= (and b!11768 res!11429) b!11769))

(assert (= (and b!11769 res!11432) b!11770))

(assert (= (and b!11770 res!11428) b!11767))

(assert (= (and b!11767 res!11430) b!11766))

(declare-fun m!17423 () Bool)

(assert (=> b!11766 m!17423))

(declare-fun m!17425 () Bool)

(assert (=> b!11766 m!17425))

(declare-fun m!17427 () Bool)

(assert (=> b!11768 m!17427))

(declare-fun m!17429 () Bool)

(assert (=> b!11768 m!17429))

(declare-fun m!17431 () Bool)

(assert (=> b!11769 m!17431))

(declare-fun m!17433 () Bool)

(assert (=> d!3684 m!17433))

(assert (=> b!11467 d!3684))

(assert (=> b!11589 d!3488))

(declare-fun d!3686 () Bool)

(assert (=> d!3686 (arrayBitRangesEq!0 (buf!632 (_2!744 lt!17700)) (buf!632 thiss!1486) lt!18466 lt!18472)))

(declare-fun lt!18844 () Unit!970)

(declare-fun choose!8 (array!665 array!665 (_ BitVec 64) (_ BitVec 64)) Unit!970)

(assert (=> d!3686 (= lt!18844 (choose!8 (buf!632 thiss!1486) (buf!632 (_2!744 lt!17700)) lt!18466 lt!18472))))

(assert (=> d!3686 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!18466) (bvsle lt!18466 lt!18472))))

(assert (=> d!3686 (= (arrayBitRangesEqSymmetric!0 (buf!632 thiss!1486) (buf!632 (_2!744 lt!17700)) lt!18466 lt!18472) lt!18844)))

(declare-fun bs!1058 () Bool)

(assert (= bs!1058 d!3686))

(assert (=> bs!1058 m!16991))

(declare-fun m!17435 () Bool)

(assert (=> bs!1058 m!17435))

(assert (=> b!11589 d!3686))

(declare-fun b!11785 () Bool)

(declare-fun res!11445 () Bool)

(declare-fun lt!18852 () (_ BitVec 32))

(assert (=> b!11785 (= res!11445 (= lt!18852 #b00000000000000000000000000000000))))

(declare-fun e!7162 () Bool)

(assert (=> b!11785 (=> res!11445 e!7162)))

(declare-fun e!7159 () Bool)

(assert (=> b!11785 (= e!7159 e!7162)))

(declare-datatypes ((tuple4!6 0))(
  ( (tuple4!7 (_1!760 (_ BitVec 32)) (_2!760 (_ BitVec 32)) (_3!49 (_ BitVec 32)) (_4!3 (_ BitVec 32))) )
))
(declare-fun lt!18853 () tuple4!6)

(declare-fun call!225 () Bool)

(declare-fun bm!222 () Bool)

(declare-fun c!843 () Bool)

(declare-fun lt!18851 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!222 (= call!225 (byteRangesEq!0 (ite c!843 (select (arr!707 (buf!632 (_2!744 lt!17700))) (_3!49 lt!18853)) (select (arr!707 (buf!632 (_2!744 lt!17700))) (_4!3 lt!18853))) (ite c!843 (select (arr!707 (buf!632 thiss!1486)) (_3!49 lt!18853)) (select (arr!707 (buf!632 thiss!1486)) (_4!3 lt!18853))) (ite c!843 lt!18851 #b00000000000000000000000000000000) lt!18852))))

(declare-fun b!11787 () Bool)

(declare-fun e!7164 () Bool)

(declare-fun e!7161 () Bool)

(assert (=> b!11787 (= e!7164 e!7161)))

(assert (=> b!11787 (= c!843 (= (_3!49 lt!18853) (_4!3 lt!18853)))))

(declare-fun b!11788 () Bool)

(declare-fun e!7163 () Bool)

(assert (=> b!11788 (= e!7163 e!7164)))

(declare-fun res!11444 () Bool)

(assert (=> b!11788 (=> (not res!11444) (not e!7164))))

(declare-fun e!7160 () Bool)

(assert (=> b!11788 (= res!11444 e!7160)))

(declare-fun res!11447 () Bool)

(assert (=> b!11788 (=> res!11447 e!7160)))

(assert (=> b!11788 (= res!11447 (bvsge (_1!760 lt!18853) (_2!760 lt!18853)))))

(assert (=> b!11788 (= lt!18852 ((_ extract 31 0) (bvsrem lt!18472 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!11788 (= lt!18851 ((_ extract 31 0) (bvsrem lt!18466 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!6)

(assert (=> b!11788 (= lt!18853 (arrayBitIndices!0 lt!18466 lt!18472))))

(declare-fun b!11789 () Bool)

(assert (=> b!11789 (= e!7161 call!225)))

(declare-fun d!3688 () Bool)

(declare-fun res!11443 () Bool)

(assert (=> d!3688 (=> res!11443 e!7163)))

(assert (=> d!3688 (= res!11443 (bvsge lt!18466 lt!18472))))

(assert (=> d!3688 (= (arrayBitRangesEq!0 (buf!632 (_2!744 lt!17700)) (buf!632 thiss!1486) lt!18466 lt!18472) e!7163)))

(declare-fun b!11786 () Bool)

(declare-fun arrayRangesEq!4 (array!665 array!665 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!11786 (= e!7160 (arrayRangesEq!4 (buf!632 (_2!744 lt!17700)) (buf!632 thiss!1486) (_1!760 lt!18853) (_2!760 lt!18853)))))

(declare-fun b!11790 () Bool)

(assert (=> b!11790 (= e!7162 call!225)))

(declare-fun b!11791 () Bool)

(assert (=> b!11791 (= e!7161 e!7159)))

(declare-fun res!11446 () Bool)

(assert (=> b!11791 (= res!11446 (byteRangesEq!0 (select (arr!707 (buf!632 (_2!744 lt!17700))) (_3!49 lt!18853)) (select (arr!707 (buf!632 thiss!1486)) (_3!49 lt!18853)) lt!18851 #b00000000000000000000000000001000))))

(assert (=> b!11791 (=> (not res!11446) (not e!7159))))

(assert (= (and d!3688 (not res!11443)) b!11788))

(assert (= (and b!11788 (not res!11447)) b!11786))

(assert (= (and b!11788 res!11444) b!11787))

(assert (= (and b!11787 c!843) b!11789))

(assert (= (and b!11787 (not c!843)) b!11791))

(assert (= (and b!11791 res!11446) b!11785))

(assert (= (and b!11785 (not res!11445)) b!11790))

(assert (= (or b!11789 b!11790) bm!222))

(declare-fun m!17437 () Bool)

(assert (=> bm!222 m!17437))

(declare-fun m!17439 () Bool)

(assert (=> bm!222 m!17439))

(declare-fun m!17441 () Bool)

(assert (=> bm!222 m!17441))

(declare-fun m!17443 () Bool)

(assert (=> bm!222 m!17443))

(declare-fun m!17445 () Bool)

(assert (=> bm!222 m!17445))

(declare-fun m!17447 () Bool)

(assert (=> b!11788 m!17447))

(declare-fun m!17449 () Bool)

(assert (=> b!11786 m!17449))

(assert (=> b!11791 m!17445))

(assert (=> b!11791 m!17439))

(assert (=> b!11791 m!17445))

(assert (=> b!11791 m!17439))

(declare-fun m!17451 () Bool)

(assert (=> b!11791 m!17451))

(assert (=> b!11589 d!3688))

(declare-fun d!3690 () Bool)

(declare-fun c!844 () Bool)

(assert (=> d!3690 (= c!844 (= (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!7165 () List!166)

(assert (=> d!3690 (= (byteArrayBitContentToList!0 (_2!744 lt!18143) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)) e!7165)))

(declare-fun b!11792 () Bool)

(assert (=> b!11792 (= e!7165 Nil!163)))

(declare-fun b!11793 () Bool)

(assert (=> b!11793 (= e!7165 (Cons!162 (not (= (bvand ((_ sign_extend 24) (select (arr!707 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!744 lt!18143) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!3690 c!844) b!11792))

(assert (= (and d!3690 (not c!844)) b!11793))

(assert (=> b!11793 m!16793))

(assert (=> b!11793 m!17029))

(declare-fun m!17453 () Bool)

(assert (=> b!11793 m!17453))

(assert (=> b!11468 d!3690))

(declare-fun b!11794 () Bool)

(declare-fun e!7166 () Unit!970)

(declare-fun lt!18867 () Unit!970)

(assert (=> b!11794 (= e!7166 lt!18867)))

(declare-fun lt!18857 () (_ BitVec 64))

(assert (=> b!11794 (= lt!18857 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!18863 () (_ BitVec 64))

(assert (=> b!11794 (= lt!18863 (bitIndex!0 (size!287 (buf!632 thiss!1486)) (currentByte!1704 thiss!1486) (currentBit!1699 thiss!1486)))))

(assert (=> b!11794 (= lt!18867 (arrayBitRangesEqSymmetric!0 (buf!632 thiss!1486) (buf!632 (_2!744 lt!18143)) lt!18857 lt!18863))))

(assert (=> b!11794 (arrayBitRangesEq!0 (buf!632 (_2!744 lt!18143)) (buf!632 thiss!1486) lt!18857 lt!18863)))

(declare-fun lt!18864 () (_ BitVec 64))

(declare-fun b!11795 () Bool)

(declare-fun lt!18862 () (_ BitVec 64))

(declare-fun lt!18866 () tuple2!1398)

(declare-fun e!7167 () Bool)

(assert (=> b!11795 (= e!7167 (= (_1!745 lt!18866) (withMovedBitIndex!0 (_2!745 lt!18866) (bvsub lt!18864 lt!18862))))))

(assert (=> b!11795 (or (= (bvand lt!18864 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!18862 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!18864 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!18864 lt!18862) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!11795 (= lt!18862 (bitIndex!0 (size!287 (buf!632 (_2!744 lt!18143))) (currentByte!1704 (_2!744 lt!18143)) (currentBit!1699 (_2!744 lt!18143))))))

(assert (=> b!11795 (= lt!18864 (bitIndex!0 (size!287 (buf!632 thiss!1486)) (currentByte!1704 thiss!1486) (currentBit!1699 thiss!1486)))))

(declare-fun b!11796 () Bool)

(declare-fun Unit!1012 () Unit!970)

(assert (=> b!11796 (= e!7166 Unit!1012)))

(declare-fun b!11797 () Bool)

(declare-fun res!11450 () Bool)

(assert (=> b!11797 (=> (not res!11450) (not e!7167))))

(assert (=> b!11797 (= res!11450 (isPrefixOf!0 (_2!745 lt!18866) (_2!744 lt!18143)))))

(declare-fun d!3692 () Bool)

(assert (=> d!3692 e!7167))

(declare-fun res!11449 () Bool)

(assert (=> d!3692 (=> (not res!11449) (not e!7167))))

(assert (=> d!3692 (= res!11449 (isPrefixOf!0 (_1!745 lt!18866) (_2!745 lt!18866)))))

(declare-fun lt!18858 () BitStream!540)

(assert (=> d!3692 (= lt!18866 (tuple2!1399 lt!18858 (_2!744 lt!18143)))))

(declare-fun lt!18869 () Unit!970)

(declare-fun lt!18872 () Unit!970)

(assert (=> d!3692 (= lt!18869 lt!18872)))

(assert (=> d!3692 (isPrefixOf!0 lt!18858 (_2!744 lt!18143))))

(assert (=> d!3692 (= lt!18872 (lemmaIsPrefixTransitive!0 lt!18858 (_2!744 lt!18143) (_2!744 lt!18143)))))

(declare-fun lt!18868 () Unit!970)

(declare-fun lt!18873 () Unit!970)

(assert (=> d!3692 (= lt!18868 lt!18873)))

(assert (=> d!3692 (isPrefixOf!0 lt!18858 (_2!744 lt!18143))))

(assert (=> d!3692 (= lt!18873 (lemmaIsPrefixTransitive!0 lt!18858 thiss!1486 (_2!744 lt!18143)))))

(declare-fun lt!18861 () Unit!970)

(assert (=> d!3692 (= lt!18861 e!7166)))

(declare-fun c!845 () Bool)

(assert (=> d!3692 (= c!845 (not (= (size!287 (buf!632 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!18860 () Unit!970)

(declare-fun lt!18854 () Unit!970)

(assert (=> d!3692 (= lt!18860 lt!18854)))

(assert (=> d!3692 (isPrefixOf!0 (_2!744 lt!18143) (_2!744 lt!18143))))

(assert (=> d!3692 (= lt!18854 (lemmaIsPrefixRefl!0 (_2!744 lt!18143)))))

(declare-fun lt!18855 () Unit!970)

(declare-fun lt!18859 () Unit!970)

(assert (=> d!3692 (= lt!18855 lt!18859)))

(assert (=> d!3692 (= lt!18859 (lemmaIsPrefixRefl!0 (_2!744 lt!18143)))))

(declare-fun lt!18865 () Unit!970)

(declare-fun lt!18856 () Unit!970)

(assert (=> d!3692 (= lt!18865 lt!18856)))

(assert (=> d!3692 (isPrefixOf!0 lt!18858 lt!18858)))

(assert (=> d!3692 (= lt!18856 (lemmaIsPrefixRefl!0 lt!18858))))

(declare-fun lt!18871 () Unit!970)

(declare-fun lt!18870 () Unit!970)

(assert (=> d!3692 (= lt!18871 lt!18870)))

(assert (=> d!3692 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!3692 (= lt!18870 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!3692 (= lt!18858 (BitStream!541 (buf!632 (_2!744 lt!18143)) (currentByte!1704 thiss!1486) (currentBit!1699 thiss!1486)))))

(assert (=> d!3692 (isPrefixOf!0 thiss!1486 (_2!744 lt!18143))))

(assert (=> d!3692 (= (reader!0 thiss!1486 (_2!744 lt!18143)) lt!18866)))

(declare-fun b!11798 () Bool)

(declare-fun res!11448 () Bool)

(assert (=> b!11798 (=> (not res!11448) (not e!7167))))

(assert (=> b!11798 (= res!11448 (isPrefixOf!0 (_1!745 lt!18866) thiss!1486))))

(assert (= (and d!3692 c!845) b!11794))

(assert (= (and d!3692 (not c!845)) b!11796))

(assert (= (and d!3692 res!11449) b!11798))

(assert (= (and b!11798 res!11448) b!11797))

(assert (= (and b!11797 res!11450) b!11795))

(assert (=> b!11794 m!16479))

(declare-fun m!17455 () Bool)

(assert (=> b!11794 m!17455))

(declare-fun m!17457 () Bool)

(assert (=> b!11794 m!17457))

(declare-fun m!17459 () Bool)

(assert (=> b!11798 m!17459))

(declare-fun m!17461 () Bool)

(assert (=> d!3692 m!17461))

(assert (=> d!3692 m!16753))

(assert (=> d!3692 m!16739))

(declare-fun m!17463 () Bool)

(assert (=> d!3692 m!17463))

(declare-fun m!17465 () Bool)

(assert (=> d!3692 m!17465))

(declare-fun m!17467 () Bool)

(assert (=> d!3692 m!17467))

(declare-fun m!17469 () Bool)

(assert (=> d!3692 m!17469))

(assert (=> d!3692 m!16741))

(declare-fun m!17471 () Bool)

(assert (=> d!3692 m!17471))

(declare-fun m!17473 () Bool)

(assert (=> d!3692 m!17473))

(declare-fun m!17475 () Bool)

(assert (=> d!3692 m!17475))

(declare-fun m!17477 () Bool)

(assert (=> b!11795 m!17477))

(assert (=> b!11795 m!16737))

(assert (=> b!11795 m!16479))

(declare-fun m!17479 () Bool)

(assert (=> b!11797 m!17479))

(assert (=> b!11468 d!3692))

(declare-fun d!3694 () Bool)

(assert (=> d!3694 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!287 (buf!632 (_2!744 lt!18143)))) ((_ sign_extend 32) (currentByte!1704 thiss!1486)) ((_ sign_extend 32) (currentBit!1699 thiss!1486)) lt!18136) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!287 (buf!632 (_2!744 lt!18143)))) ((_ sign_extend 32) (currentByte!1704 thiss!1486)) ((_ sign_extend 32) (currentBit!1699 thiss!1486))) lt!18136))))

(declare-fun bs!1059 () Bool)

(assert (= bs!1059 d!3694))

(declare-fun m!17481 () Bool)

(assert (=> bs!1059 m!17481))

(assert (=> b!11468 d!3694))

(declare-fun d!3696 () Bool)

(assert (=> d!3696 (validate_offset_bits!1 ((_ sign_extend 32) (size!287 (buf!632 (_2!744 lt!18143)))) ((_ sign_extend 32) (currentByte!1704 thiss!1486)) ((_ sign_extend 32) (currentBit!1699 thiss!1486)) lt!18136)))

(declare-fun lt!18874 () Unit!970)

(assert (=> d!3696 (= lt!18874 (choose!9 thiss!1486 (buf!632 (_2!744 lt!18143)) lt!18136 (BitStream!541 (buf!632 (_2!744 lt!18143)) (currentByte!1704 thiss!1486) (currentBit!1699 thiss!1486))))))

(assert (=> d!3696 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!632 (_2!744 lt!18143)) lt!18136) lt!18874)))

(declare-fun bs!1060 () Bool)

(assert (= bs!1060 d!3696))

(assert (=> bs!1060 m!16745))

(declare-fun m!17483 () Bool)

(assert (=> bs!1060 m!17483))

(assert (=> b!11468 d!3696))

(declare-fun d!3698 () Bool)

(declare-fun e!7169 () Bool)

(assert (=> d!3698 e!7169))

(declare-fun c!846 () Bool)

(assert (=> d!3698 (= c!846 (= (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!18876 () List!166)

(declare-fun e!7168 () tuple2!1416)

(assert (=> d!3698 (= lt!18876 (_1!757 e!7168))))

(declare-fun c!847 () Bool)

(assert (=> d!3698 (= c!847 (= (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3698 (bvsge (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3698 (= (bitStreamReadBitsIntoList!0 (_2!744 lt!18143) (_1!745 lt!18162) (bvsub (bvadd from!367 nBits!460) from!367)) lt!18876)))

(declare-fun b!11799 () Bool)

(assert (=> b!11799 (= e!7168 (tuple2!1417 Nil!163 (_1!745 lt!18162)))))

(declare-fun b!11802 () Bool)

(assert (=> b!11802 (= e!7169 (> (length!34 lt!18876) 0))))

(declare-fun b!11801 () Bool)

(assert (=> b!11801 (= e!7169 (isEmpty!39 lt!18876))))

(declare-fun lt!18877 () tuple2!1418)

(declare-fun b!11800 () Bool)

(declare-fun lt!18875 () (_ BitVec 64))

(assert (=> b!11800 (= e!7168 (tuple2!1417 (Cons!162 (_1!758 lt!18877) (bitStreamReadBitsIntoList!0 (_2!744 lt!18143) (_2!758 lt!18877) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) lt!18875))) (_2!758 lt!18877)))))

(assert (=> b!11800 (= lt!18877 (readBit!0 (_1!745 lt!18162)))))

(assert (=> b!11800 (= lt!18875 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!3698 c!847) b!11799))

(assert (= (and d!3698 (not c!847)) b!11800))

(assert (= (and d!3698 c!846) b!11801))

(assert (= (and d!3698 (not c!846)) b!11802))

(declare-fun m!17485 () Bool)

(assert (=> b!11802 m!17485))

(declare-fun m!17487 () Bool)

(assert (=> b!11801 m!17487))

(declare-fun m!17489 () Bool)

(assert (=> b!11800 m!17489))

(declare-fun m!17491 () Bool)

(assert (=> b!11800 m!17491))

(assert (=> b!11468 d!3698))

(declare-fun d!3700 () Bool)

(declare-fun res!11453 () Bool)

(declare-fun e!7171 () Bool)

(assert (=> d!3700 (=> (not res!11453) (not e!7171))))

(assert (=> d!3700 (= res!11453 (= (size!287 (buf!632 lt!18467)) (size!287 (buf!632 (_2!744 lt!17700)))))))

(assert (=> d!3700 (= (isPrefixOf!0 lt!18467 (_2!744 lt!17700)) e!7171)))

(declare-fun b!11803 () Bool)

(declare-fun res!11452 () Bool)

(assert (=> b!11803 (=> (not res!11452) (not e!7171))))

(assert (=> b!11803 (= res!11452 (bvsle (bitIndex!0 (size!287 (buf!632 lt!18467)) (currentByte!1704 lt!18467) (currentBit!1699 lt!18467)) (bitIndex!0 (size!287 (buf!632 (_2!744 lt!17700))) (currentByte!1704 (_2!744 lt!17700)) (currentBit!1699 (_2!744 lt!17700)))))))

(declare-fun b!11804 () Bool)

(declare-fun e!7170 () Bool)

(assert (=> b!11804 (= e!7171 e!7170)))

(declare-fun res!11451 () Bool)

(assert (=> b!11804 (=> res!11451 e!7170)))

(assert (=> b!11804 (= res!11451 (= (size!287 (buf!632 lt!18467)) #b00000000000000000000000000000000))))

(declare-fun b!11805 () Bool)

(assert (=> b!11805 (= e!7170 (arrayBitRangesEq!0 (buf!632 lt!18467) (buf!632 (_2!744 lt!17700)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!287 (buf!632 lt!18467)) (currentByte!1704 lt!18467) (currentBit!1699 lt!18467))))))

(assert (= (and d!3700 res!11453) b!11803))

(assert (= (and b!11803 res!11452) b!11804))

(assert (= (and b!11804 (not res!11451)) b!11805))

(declare-fun m!17493 () Bool)

(assert (=> b!11803 m!17493))

(assert (=> b!11803 m!16477))

(assert (=> b!11805 m!17493))

(assert (=> b!11805 m!17493))

(declare-fun m!17495 () Bool)

(assert (=> b!11805 m!17495))

(assert (=> d!3540 d!3700))

(declare-fun d!3702 () Bool)

(assert (=> d!3702 (isPrefixOf!0 lt!18467 lt!18467)))

(declare-fun lt!18878 () Unit!970)

(assert (=> d!3702 (= lt!18878 (choose!11 lt!18467))))

(assert (=> d!3702 (= (lemmaIsPrefixRefl!0 lt!18467) lt!18878)))

(declare-fun bs!1061 () Bool)

(assert (= bs!1061 d!3702))

(assert (=> bs!1061 m!17005))

(declare-fun m!17497 () Bool)

(assert (=> bs!1061 m!17497))

(assert (=> d!3540 d!3702))

(declare-fun d!3704 () Bool)

(assert (=> d!3704 (isPrefixOf!0 lt!18467 (_2!744 lt!17700))))

(declare-fun lt!18879 () Unit!970)

(assert (=> d!3704 (= lt!18879 (choose!30 lt!18467 (_2!744 lt!17700) (_2!744 lt!17700)))))

(assert (=> d!3704 (isPrefixOf!0 lt!18467 (_2!744 lt!17700))))

(assert (=> d!3704 (= (lemmaIsPrefixTransitive!0 lt!18467 (_2!744 lt!17700) (_2!744 lt!17700)) lt!18879)))

(declare-fun bs!1062 () Bool)

(assert (= bs!1062 d!3704))

(assert (=> bs!1062 m!17003))

(declare-fun m!17499 () Bool)

(assert (=> bs!1062 m!17499))

(assert (=> bs!1062 m!17003))

(assert (=> d!3540 d!3704))

(assert (=> d!3540 d!3676))

(declare-fun d!3706 () Bool)

(declare-fun res!11456 () Bool)

(declare-fun e!7173 () Bool)

(assert (=> d!3706 (=> (not res!11456) (not e!7173))))

(assert (=> d!3706 (= res!11456 (= (size!287 (buf!632 (_1!745 lt!18475))) (size!287 (buf!632 (_2!745 lt!18475)))))))

(assert (=> d!3706 (= (isPrefixOf!0 (_1!745 lt!18475) (_2!745 lt!18475)) e!7173)))

(declare-fun b!11806 () Bool)

(declare-fun res!11455 () Bool)

(assert (=> b!11806 (=> (not res!11455) (not e!7173))))

(assert (=> b!11806 (= res!11455 (bvsle (bitIndex!0 (size!287 (buf!632 (_1!745 lt!18475))) (currentByte!1704 (_1!745 lt!18475)) (currentBit!1699 (_1!745 lt!18475))) (bitIndex!0 (size!287 (buf!632 (_2!745 lt!18475))) (currentByte!1704 (_2!745 lt!18475)) (currentBit!1699 (_2!745 lt!18475)))))))

(declare-fun b!11807 () Bool)

(declare-fun e!7172 () Bool)

(assert (=> b!11807 (= e!7173 e!7172)))

(declare-fun res!11454 () Bool)

(assert (=> b!11807 (=> res!11454 e!7172)))

(assert (=> b!11807 (= res!11454 (= (size!287 (buf!632 (_1!745 lt!18475))) #b00000000000000000000000000000000))))

(declare-fun b!11808 () Bool)

(assert (=> b!11808 (= e!7172 (arrayBitRangesEq!0 (buf!632 (_1!745 lt!18475)) (buf!632 (_2!745 lt!18475)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!287 (buf!632 (_1!745 lt!18475))) (currentByte!1704 (_1!745 lt!18475)) (currentBit!1699 (_1!745 lt!18475)))))))

(assert (= (and d!3706 res!11456) b!11806))

(assert (= (and b!11806 res!11455) b!11807))

(assert (= (and b!11807 (not res!11454)) b!11808))

(assert (=> b!11806 m!17055))

(declare-fun m!17501 () Bool)

(assert (=> b!11806 m!17501))

(assert (=> b!11808 m!17055))

(assert (=> b!11808 m!17055))

(declare-fun m!17503 () Bool)

(assert (=> b!11808 m!17503))

(assert (=> d!3540 d!3706))

(declare-fun d!3708 () Bool)

(declare-fun res!11459 () Bool)

(declare-fun e!7175 () Bool)

(assert (=> d!3708 (=> (not res!11459) (not e!7175))))

(assert (=> d!3708 (= res!11459 (= (size!287 (buf!632 lt!18467)) (size!287 (buf!632 lt!18467))))))

(assert (=> d!3708 (= (isPrefixOf!0 lt!18467 lt!18467) e!7175)))

(declare-fun b!11809 () Bool)

(declare-fun res!11458 () Bool)

(assert (=> b!11809 (=> (not res!11458) (not e!7175))))

(assert (=> b!11809 (= res!11458 (bvsle (bitIndex!0 (size!287 (buf!632 lt!18467)) (currentByte!1704 lt!18467) (currentBit!1699 lt!18467)) (bitIndex!0 (size!287 (buf!632 lt!18467)) (currentByte!1704 lt!18467) (currentBit!1699 lt!18467))))))

(declare-fun b!11810 () Bool)

(declare-fun e!7174 () Bool)

(assert (=> b!11810 (= e!7175 e!7174)))

(declare-fun res!11457 () Bool)

(assert (=> b!11810 (=> res!11457 e!7174)))

(assert (=> b!11810 (= res!11457 (= (size!287 (buf!632 lt!18467)) #b00000000000000000000000000000000))))

(declare-fun b!11811 () Bool)

(assert (=> b!11811 (= e!7174 (arrayBitRangesEq!0 (buf!632 lt!18467) (buf!632 lt!18467) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!287 (buf!632 lt!18467)) (currentByte!1704 lt!18467) (currentBit!1699 lt!18467))))))

(assert (= (and d!3708 res!11459) b!11809))

(assert (= (and b!11809 res!11458) b!11810))

(assert (= (and b!11810 (not res!11457)) b!11811))

(assert (=> b!11809 m!17493))

(assert (=> b!11809 m!17493))

(assert (=> b!11811 m!17493))

(assert (=> b!11811 m!17493))

(declare-fun m!17505 () Bool)

(assert (=> b!11811 m!17505))

(assert (=> d!3540 d!3708))

(assert (=> d!3540 d!3490))

(declare-fun d!3710 () Bool)

(declare-fun res!11462 () Bool)

(declare-fun e!7177 () Bool)

(assert (=> d!3710 (=> (not res!11462) (not e!7177))))

(assert (=> d!3710 (= res!11462 (= (size!287 (buf!632 (_2!744 lt!17700))) (size!287 (buf!632 (_2!744 lt!17700)))))))

(assert (=> d!3710 (= (isPrefixOf!0 (_2!744 lt!17700) (_2!744 lt!17700)) e!7177)))

(declare-fun b!11812 () Bool)

(declare-fun res!11461 () Bool)

(assert (=> b!11812 (=> (not res!11461) (not e!7177))))

(assert (=> b!11812 (= res!11461 (bvsle (bitIndex!0 (size!287 (buf!632 (_2!744 lt!17700))) (currentByte!1704 (_2!744 lt!17700)) (currentBit!1699 (_2!744 lt!17700))) (bitIndex!0 (size!287 (buf!632 (_2!744 lt!17700))) (currentByte!1704 (_2!744 lt!17700)) (currentBit!1699 (_2!744 lt!17700)))))))

(declare-fun b!11813 () Bool)

(declare-fun e!7176 () Bool)

(assert (=> b!11813 (= e!7177 e!7176)))

(declare-fun res!11460 () Bool)

(assert (=> b!11813 (=> res!11460 e!7176)))

(assert (=> b!11813 (= res!11460 (= (size!287 (buf!632 (_2!744 lt!17700))) #b00000000000000000000000000000000))))

(declare-fun b!11814 () Bool)

(assert (=> b!11814 (= e!7176 (arrayBitRangesEq!0 (buf!632 (_2!744 lt!17700)) (buf!632 (_2!744 lt!17700)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!287 (buf!632 (_2!744 lt!17700))) (currentByte!1704 (_2!744 lt!17700)) (currentBit!1699 (_2!744 lt!17700)))))))

(assert (= (and d!3710 res!11462) b!11812))

(assert (= (and b!11812 res!11461) b!11813))

(assert (= (and b!11813 (not res!11460)) b!11814))

(assert (=> b!11812 m!16477))

(assert (=> b!11812 m!16477))

(assert (=> b!11814 m!16477))

(assert (=> b!11814 m!16477))

(declare-fun m!17507 () Bool)

(assert (=> b!11814 m!17507))

(assert (=> d!3540 d!3710))

(declare-fun d!3712 () Bool)

(assert (=> d!3712 (isPrefixOf!0 (_2!744 lt!17700) (_2!744 lt!17700))))

(declare-fun lt!18880 () Unit!970)

(assert (=> d!3712 (= lt!18880 (choose!11 (_2!744 lt!17700)))))

(assert (=> d!3712 (= (lemmaIsPrefixRefl!0 (_2!744 lt!17700)) lt!18880)))

(declare-fun bs!1063 () Bool)

(assert (= bs!1063 d!3712))

(assert (=> bs!1063 m!16995))

(declare-fun m!17509 () Bool)

(assert (=> bs!1063 m!17509))

(assert (=> d!3540 d!3712))

(declare-fun d!3714 () Bool)

(assert (=> d!3714 (isPrefixOf!0 lt!18467 (_2!744 lt!17700))))

(declare-fun lt!18881 () Unit!970)

(assert (=> d!3714 (= lt!18881 (choose!30 lt!18467 thiss!1486 (_2!744 lt!17700)))))

(assert (=> d!3714 (isPrefixOf!0 lt!18467 thiss!1486)))

(assert (=> d!3714 (= (lemmaIsPrefixTransitive!0 lt!18467 thiss!1486 (_2!744 lt!17700)) lt!18881)))

(declare-fun bs!1064 () Bool)

(assert (= bs!1064 d!3714))

(assert (=> bs!1064 m!17003))

(declare-fun m!17511 () Bool)

(assert (=> bs!1064 m!17511))

(declare-fun m!17513 () Bool)

(assert (=> bs!1064 m!17513))

(assert (=> d!3540 d!3714))

(assert (=> d!3540 d!3674))

(assert (=> d!3532 d!3510))

(declare-fun d!3716 () Bool)

(assert (=> d!3716 (validate_offset_bits!1 ((_ sign_extend 32) (size!287 (buf!632 (_2!744 lt!17700)))) ((_ sign_extend 32) (currentByte!1704 thiss!1486)) ((_ sign_extend 32) (currentBit!1699 thiss!1486)) nBits!460)))

(assert (=> d!3716 true))

(declare-fun _$6!168 () Unit!970)

(assert (=> d!3716 (= (choose!9 thiss!1486 (buf!632 (_2!744 lt!17700)) nBits!460 (BitStream!541 (buf!632 (_2!744 lt!17700)) (currentByte!1704 thiss!1486) (currentBit!1699 thiss!1486))) _$6!168)))

(declare-fun bs!1065 () Bool)

(assert (= bs!1065 d!3716))

(assert (=> bs!1065 m!16505))

(assert (=> d!3532 d!3716))

(declare-fun d!3718 () Bool)

(assert (=> d!3718 (= (invariant!0 (currentBit!1699 (_2!744 lt!18143)) (currentByte!1704 (_2!744 lt!18143)) (size!287 (buf!632 (_2!744 lt!18143)))) (and (bvsge (currentBit!1699 (_2!744 lt!18143)) #b00000000000000000000000000000000) (bvslt (currentBit!1699 (_2!744 lt!18143)) #b00000000000000000000000000001000) (bvsge (currentByte!1704 (_2!744 lt!18143)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1704 (_2!744 lt!18143)) (size!287 (buf!632 (_2!744 lt!18143)))) (and (= (currentBit!1699 (_2!744 lt!18143)) #b00000000000000000000000000000000) (= (currentByte!1704 (_2!744 lt!18143)) (size!287 (buf!632 (_2!744 lt!18143))))))))))

(assert (=> b!11469 d!3718))

(declare-fun d!3720 () Bool)

(declare-fun size!289 (List!166) Int)

(assert (=> d!3720 (= (length!34 lt!18490) (size!289 lt!18490))))

(declare-fun bs!1066 () Bool)

(assert (= bs!1066 d!3720))

(declare-fun m!17515 () Bool)

(assert (=> bs!1066 m!17515))

(assert (=> b!11611 d!3720))

(assert (=> b!11387 d!3488))

(assert (=> b!11387 d!3486))

(declare-fun d!3722 () Bool)

(declare-fun res!11465 () Bool)

(declare-fun e!7179 () Bool)

(assert (=> d!3722 (=> (not res!11465) (not e!7179))))

(assert (=> d!3722 (= res!11465 (= (size!287 (buf!632 (_2!745 lt!18475))) (size!287 (buf!632 (_2!744 lt!17700)))))))

(assert (=> d!3722 (= (isPrefixOf!0 (_2!745 lt!18475) (_2!744 lt!17700)) e!7179)))

(declare-fun b!11815 () Bool)

(declare-fun res!11464 () Bool)

(assert (=> b!11815 (=> (not res!11464) (not e!7179))))

(assert (=> b!11815 (= res!11464 (bvsle (bitIndex!0 (size!287 (buf!632 (_2!745 lt!18475))) (currentByte!1704 (_2!745 lt!18475)) (currentBit!1699 (_2!745 lt!18475))) (bitIndex!0 (size!287 (buf!632 (_2!744 lt!17700))) (currentByte!1704 (_2!744 lt!17700)) (currentBit!1699 (_2!744 lt!17700)))))))

(declare-fun b!11816 () Bool)

(declare-fun e!7178 () Bool)

(assert (=> b!11816 (= e!7179 e!7178)))

(declare-fun res!11463 () Bool)

(assert (=> b!11816 (=> res!11463 e!7178)))

(assert (=> b!11816 (= res!11463 (= (size!287 (buf!632 (_2!745 lt!18475))) #b00000000000000000000000000000000))))

(declare-fun b!11817 () Bool)

(assert (=> b!11817 (= e!7178 (arrayBitRangesEq!0 (buf!632 (_2!745 lt!18475)) (buf!632 (_2!744 lt!17700)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!287 (buf!632 (_2!745 lt!18475))) (currentByte!1704 (_2!745 lt!18475)) (currentBit!1699 (_2!745 lt!18475)))))))

(assert (= (and d!3722 res!11465) b!11815))

(assert (= (and b!11815 res!11464) b!11816))

(assert (= (and b!11816 (not res!11463)) b!11817))

(assert (=> b!11815 m!17501))

(assert (=> b!11815 m!16477))

(assert (=> b!11817 m!17501))

(assert (=> b!11817 m!17501))

(declare-fun m!17517 () Bool)

(assert (=> b!11817 m!17517))

(assert (=> b!11592 d!3722))

(assert (=> d!3488 d!3648))

(assert (=> d!3488 d!3656))

(declare-fun d!3724 () Bool)

(assert (=> d!3724 (= (remainingBits!0 ((_ sign_extend 32) (size!287 (buf!632 (_2!744 lt!17700)))) ((_ sign_extend 32) (currentByte!1704 (_2!744 lt!17700))) ((_ sign_extend 32) (currentBit!1699 (_2!744 lt!17700)))) (bvsub (bvmul ((_ sign_extend 32) (size!287 (buf!632 (_2!744 lt!17700)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!1704 (_2!744 lt!17700))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1699 (_2!744 lt!17700))))))))

(assert (=> d!3486 d!3724))

(assert (=> d!3486 d!3494))

(declare-fun b!11818 () Bool)

(declare-fun res!11468 () Bool)

(declare-fun lt!18883 () (_ BitVec 32))

(assert (=> b!11818 (= res!11468 (= lt!18883 #b00000000000000000000000000000000))))

(declare-fun e!7183 () Bool)

(assert (=> b!11818 (=> res!11468 e!7183)))

(declare-fun e!7180 () Bool)

(assert (=> b!11818 (= e!7180 e!7183)))

(declare-fun bm!223 () Bool)

(declare-fun c!848 () Bool)

(declare-fun call!226 () Bool)

(declare-fun lt!18884 () tuple4!6)

(declare-fun lt!18882 () (_ BitVec 32))

(assert (=> bm!223 (= call!226 (byteRangesEq!0 (ite c!848 (select (arr!707 (buf!632 thiss!1486)) (_3!49 lt!18884)) (select (arr!707 (buf!632 thiss!1486)) (_4!3 lt!18884))) (ite c!848 (select (arr!707 (buf!632 (_2!744 lt!17700))) (_3!49 lt!18884)) (select (arr!707 (buf!632 (_2!744 lt!17700))) (_4!3 lt!18884))) (ite c!848 lt!18882 #b00000000000000000000000000000000) lt!18883))))

(declare-fun b!11820 () Bool)

(declare-fun e!7185 () Bool)

(declare-fun e!7182 () Bool)

(assert (=> b!11820 (= e!7185 e!7182)))

(assert (=> b!11820 (= c!848 (= (_3!49 lt!18884) (_4!3 lt!18884)))))

(declare-fun b!11821 () Bool)

(declare-fun e!7184 () Bool)

(assert (=> b!11821 (= e!7184 e!7185)))

(declare-fun res!11467 () Bool)

(assert (=> b!11821 (=> (not res!11467) (not e!7185))))

(declare-fun e!7181 () Bool)

(assert (=> b!11821 (= res!11467 e!7181)))

(declare-fun res!11470 () Bool)

(assert (=> b!11821 (=> res!11470 e!7181)))

(assert (=> b!11821 (= res!11470 (bvsge (_1!760 lt!18884) (_2!760 lt!18884)))))

(assert (=> b!11821 (= lt!18883 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!287 (buf!632 thiss!1486)) (currentByte!1704 thiss!1486) (currentBit!1699 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!11821 (= lt!18882 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!11821 (= lt!18884 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!287 (buf!632 thiss!1486)) (currentByte!1704 thiss!1486) (currentBit!1699 thiss!1486))))))

(declare-fun b!11822 () Bool)

(assert (=> b!11822 (= e!7182 call!226)))

(declare-fun d!3726 () Bool)

(declare-fun res!11466 () Bool)

(assert (=> d!3726 (=> res!11466 e!7184)))

(assert (=> d!3726 (= res!11466 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!287 (buf!632 thiss!1486)) (currentByte!1704 thiss!1486) (currentBit!1699 thiss!1486))))))

(assert (=> d!3726 (= (arrayBitRangesEq!0 (buf!632 thiss!1486) (buf!632 (_2!744 lt!17700)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!287 (buf!632 thiss!1486)) (currentByte!1704 thiss!1486) (currentBit!1699 thiss!1486))) e!7184)))

(declare-fun b!11819 () Bool)

(assert (=> b!11819 (= e!7181 (arrayRangesEq!4 (buf!632 thiss!1486) (buf!632 (_2!744 lt!17700)) (_1!760 lt!18884) (_2!760 lt!18884)))))

(declare-fun b!11823 () Bool)

(assert (=> b!11823 (= e!7183 call!226)))

(declare-fun b!11824 () Bool)

(assert (=> b!11824 (= e!7182 e!7180)))

(declare-fun res!11469 () Bool)

(assert (=> b!11824 (= res!11469 (byteRangesEq!0 (select (arr!707 (buf!632 thiss!1486)) (_3!49 lt!18884)) (select (arr!707 (buf!632 (_2!744 lt!17700))) (_3!49 lt!18884)) lt!18882 #b00000000000000000000000000001000))))

(assert (=> b!11824 (=> (not res!11469) (not e!7180))))

(assert (= (and d!3726 (not res!11466)) b!11821))

(assert (= (and b!11821 (not res!11470)) b!11819))

(assert (= (and b!11821 res!11467) b!11820))

(assert (= (and b!11820 c!848) b!11822))

(assert (= (and b!11820 (not c!848)) b!11824))

(assert (= (and b!11824 res!11469) b!11818))

(assert (= (and b!11818 (not res!11468)) b!11823))

(assert (= (or b!11822 b!11823) bm!223))

(declare-fun m!17519 () Bool)

(assert (=> bm!223 m!17519))

(declare-fun m!17521 () Bool)

(assert (=> bm!223 m!17521))

(declare-fun m!17523 () Bool)

(assert (=> bm!223 m!17523))

(declare-fun m!17525 () Bool)

(assert (=> bm!223 m!17525))

(declare-fun m!17527 () Bool)

(assert (=> bm!223 m!17527))

(assert (=> b!11821 m!16479))

(declare-fun m!17529 () Bool)

(assert (=> b!11821 m!17529))

(declare-fun m!17531 () Bool)

(assert (=> b!11819 m!17531))

(assert (=> b!11824 m!17527))

(assert (=> b!11824 m!17521))

(assert (=> b!11824 m!17527))

(assert (=> b!11824 m!17521))

(declare-fun m!17533 () Bool)

(assert (=> b!11824 m!17533))

(assert (=> b!11389 d!3726))

(assert (=> b!11389 d!3488))

(declare-fun d!3728 () Bool)

(declare-fun e!7188 () Bool)

(assert (=> d!3728 e!7188))

(declare-fun res!11473 () Bool)

(assert (=> d!3728 (=> (not res!11473) (not e!7188))))

(declare-fun lt!18889 () BitStream!540)

(declare-fun lt!18890 () (_ BitVec 64))

(assert (=> d!3728 (= res!11473 (= (bvadd lt!18890 (bvsub lt!18473 lt!18471)) (bitIndex!0 (size!287 (buf!632 lt!18889)) (currentByte!1704 lt!18889) (currentBit!1699 lt!18889))))))

(assert (=> d!3728 (or (not (= (bvand lt!18890 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!18473 lt!18471) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!18890 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!18890 (bvsub lt!18473 lt!18471)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3728 (= lt!18890 (bitIndex!0 (size!287 (buf!632 (_2!745 lt!18475))) (currentByte!1704 (_2!745 lt!18475)) (currentBit!1699 (_2!745 lt!18475))))))

(declare-fun moveBitIndex!0 (BitStream!540 (_ BitVec 64)) tuple2!1396)

(assert (=> d!3728 (= lt!18889 (_2!744 (moveBitIndex!0 (_2!745 lt!18475) (bvsub lt!18473 lt!18471))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!540 (_ BitVec 64)) Bool)

(assert (=> d!3728 (moveBitIndexPrecond!0 (_2!745 lt!18475) (bvsub lt!18473 lt!18471))))

(assert (=> d!3728 (= (withMovedBitIndex!0 (_2!745 lt!18475) (bvsub lt!18473 lt!18471)) lt!18889)))

(declare-fun b!11827 () Bool)

(assert (=> b!11827 (= e!7188 (= (size!287 (buf!632 (_2!745 lt!18475))) (size!287 (buf!632 lt!18889))))))

(assert (= (and d!3728 res!11473) b!11827))

(declare-fun m!17535 () Bool)

(assert (=> d!3728 m!17535))

(assert (=> d!3728 m!17501))

(declare-fun m!17537 () Bool)

(assert (=> d!3728 m!17537))

(declare-fun m!17539 () Bool)

(assert (=> d!3728 m!17539))

(assert (=> b!11590 d!3728))

(assert (=> b!11590 d!3486))

(assert (=> b!11590 d!3488))

(check-sat (not b!11653) (not b!11628) (not b!11684) (not b!11765) (not b!11711) (not d!3590) (not b!11651) (not d!3624) (not d!3620) (not b!11814) (not b!11718) (not b!11745) (not b!11809) (not b!11645) (not d!3602) (not bm!218) (not b!11717) (not b!11625) (not b!11681) (not b!11748) (not b!11798) (not b!11811) (not b!11636) (not b!11819) (not d!3604) (not b!11634) (not b!11797) (not d!3712) (not b!11713) (not b!11630) (not d!3672) (not d!3720) (not b!11664) (not b!11644) (not b!11672) (not b!11815) (not b!11671) (not b!11688) (not b!11642) (not b!11759) (not d!3626) (not d!3714) (not b!11689) (not b!11643) (not bm!222) (not b!11769) (not b!11768) (not d!3654) (not b!11812) (not d!3596) (not b!11791) (not b!11712) (not b!11821) (not d!3676) (not b!11677) (not d!3684) (not b!11660) (not b!11766) (not d!3692) (not d!3646) (not b!11758) (not b!11675) (not b!11633) (not b!11744) (not b!11793) (not d!3680) (not d!3662) (not d!3622) (not b!11658) (not b!11685) (not d!3716) (not b!11794) (not d!3612) (not d!3574) (not d!3616) (not d!3686) (not b!11648) (not b!11670) (not bm!219) (not d!3694) (not d!3610) (not b!11763) (not b!11806) (not d!3658) (not b!11708) (not d!3606) (not b!11802) (not b!11707) (not b!11714) (not b!11687) (not b!11668) (not bm!213) (not b!11756) (not b!11656) (not d!3696) (not b!11801) (not d!3728) (not d!3576) (not b!11747) (not b!11715) (not b!11661) (not b!11788) (not b!11803) (not b!11641) (not b!11638) (not b!11824) (not b!11639) (not b!11626) (not d!3598) (not d!3702) (not b!11786) (not b!11674) (not d!3632) (not b!11760) (not b!11669) (not b!11800) (not b!11754) (not b!11710) (not b!11808) (not b!11709) (not b!11721) (not b!11805) (not b!11657) (not b!11632) (not b!11722) (not b!11719) (not bm!223) (not b!11817) (not b!11750) (not b!11640) (not d!3704) (not b!11746) (not b!11679) (not d!3666) (not b!11683) (not b!11795) (not b!11724) (not d!3618) (not d!3608))
(check-sat)
