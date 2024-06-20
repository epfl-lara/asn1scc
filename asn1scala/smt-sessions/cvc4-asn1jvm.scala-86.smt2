; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1776 () Bool)

(assert start!1776)

(declare-fun b!8464 () Bool)

(declare-fun res!9004 () Bool)

(declare-fun e!5298 () Bool)

(assert (=> b!8464 (=> (not res!9004) (not e!5298))))

(declare-datatypes ((array!565 0))(
  ( (array!566 (arr!648 (Array (_ BitVec 32) (_ BitVec 8))) (size!243 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!464 0))(
  ( (BitStream!465 (buf!579 array!565) (currentByte!1609 (_ BitVec 32)) (currentBit!1604 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!464)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!8464 (= res!9004 (validate_offset_bits!1 ((_ sign_extend 32) (size!243 (buf!579 thiss!1486))) ((_ sign_extend 32) (currentByte!1609 thiss!1486)) ((_ sign_extend 32) (currentBit!1604 thiss!1486)) nBits!460))))

(declare-fun b!8465 () Bool)

(declare-fun e!5300 () Bool)

(declare-datatypes ((Unit!719 0))(
  ( (Unit!720) )
))
(declare-datatypes ((tuple2!1142 0))(
  ( (tuple2!1143 (_1!602 Unit!719) (_2!602 BitStream!464)) )
))
(declare-fun lt!12032 () tuple2!1142)

(declare-fun isPrefixOf!0 (BitStream!464 BitStream!464) Bool)

(assert (=> b!8465 (= e!5300 (not (isPrefixOf!0 thiss!1486 (_2!602 lt!12032))))))

(declare-fun b!8466 () Bool)

(assert (=> b!8466 (= e!5298 e!5300)))

(declare-fun res!9003 () Bool)

(assert (=> b!8466 (=> (not res!9003) (not e!5300))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!8466 (= res!9003 (invariant!0 (currentBit!1604 (_2!602 lt!12032)) (currentByte!1609 (_2!602 lt!12032)) (size!243 (buf!579 (_2!602 lt!12032)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!565)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!464 array!565 (_ BitVec 64) (_ BitVec 64)) tuple2!1142)

(assert (=> b!8466 (= lt!12032 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun res!9001 () Bool)

(assert (=> start!1776 (=> (not res!9001) (not e!5298))))

(assert (=> start!1776 (= res!9001 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!243 srcBuffer!6))))))))

(assert (=> start!1776 e!5298))

(assert (=> start!1776 true))

(declare-fun array_inv!238 (array!565) Bool)

(assert (=> start!1776 (array_inv!238 srcBuffer!6)))

(declare-fun e!5296 () Bool)

(declare-fun inv!12 (BitStream!464) Bool)

(assert (=> start!1776 (and (inv!12 thiss!1486) e!5296)))

(declare-fun b!8467 () Bool)

(assert (=> b!8467 (= e!5296 (array_inv!238 (buf!579 thiss!1486)))))

(declare-fun b!8468 () Bool)

(declare-fun res!9000 () Bool)

(assert (=> b!8468 (=> (not res!9000) (not e!5300))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!8468 (= res!9000 (= (bitIndex!0 (size!243 (buf!579 (_2!602 lt!12032))) (currentByte!1609 (_2!602 lt!12032)) (currentBit!1604 (_2!602 lt!12032))) (bvadd (bitIndex!0 (size!243 (buf!579 thiss!1486)) (currentByte!1609 thiss!1486) (currentBit!1604 thiss!1486)) nBits!460)))))

(declare-fun b!8469 () Bool)

(declare-fun res!9002 () Bool)

(assert (=> b!8469 (=> (not res!9002) (not e!5300))))

(assert (=> b!8469 (= res!9002 (= (size!243 (buf!579 thiss!1486)) (size!243 (buf!579 (_2!602 lt!12032)))))))

(assert (= (and start!1776 res!9001) b!8464))

(assert (= (and b!8464 res!9004) b!8466))

(assert (= (and b!8466 res!9003) b!8469))

(assert (= (and b!8469 res!9002) b!8468))

(assert (= (and b!8468 res!9000) b!8465))

(assert (= start!1776 b!8467))

(declare-fun m!11463 () Bool)

(assert (=> b!8464 m!11463))

(declare-fun m!11465 () Bool)

(assert (=> b!8465 m!11465))

(declare-fun m!11467 () Bool)

(assert (=> b!8468 m!11467))

(declare-fun m!11469 () Bool)

(assert (=> b!8468 m!11469))

(declare-fun m!11471 () Bool)

(assert (=> start!1776 m!11471))

(declare-fun m!11473 () Bool)

(assert (=> start!1776 m!11473))

(declare-fun m!11475 () Bool)

(assert (=> b!8467 m!11475))

(declare-fun m!11477 () Bool)

(assert (=> b!8466 m!11477))

(declare-fun m!11479 () Bool)

(assert (=> b!8466 m!11479))

(push 1)

(assert (not b!8468))

(assert (not start!1776))

(assert (not b!8464))

(assert (not b!8465))

(assert (not b!8466))

(assert (not b!8467))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2490 () Bool)

(assert (=> d!2490 (= (array_inv!238 (buf!579 thiss!1486)) (bvsge (size!243 (buf!579 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!8467 d!2490))

(declare-fun d!2492 () Bool)

(declare-fun e!5309 () Bool)

(assert (=> d!2492 e!5309))

(declare-fun res!9019 () Bool)

(assert (=> d!2492 (=> (not res!9019) (not e!5309))))

(declare-fun lt!12061 () (_ BitVec 64))

(declare-fun lt!12062 () (_ BitVec 64))

(declare-fun lt!12059 () (_ BitVec 64))

(assert (=> d!2492 (= res!9019 (= lt!12062 (bvsub lt!12061 lt!12059)))))

(assert (=> d!2492 (or (= (bvand lt!12061 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!12059 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!12061 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!12061 lt!12059) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!2492 (= lt!12059 (remainingBits!0 ((_ sign_extend 32) (size!243 (buf!579 (_2!602 lt!12032)))) ((_ sign_extend 32) (currentByte!1609 (_2!602 lt!12032))) ((_ sign_extend 32) (currentBit!1604 (_2!602 lt!12032)))))))

(declare-fun lt!12058 () (_ BitVec 64))

(declare-fun lt!12057 () (_ BitVec 64))

(assert (=> d!2492 (= lt!12061 (bvmul lt!12058 lt!12057))))

(assert (=> d!2492 (or (= lt!12058 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!12057 (bvsdiv (bvmul lt!12058 lt!12057) lt!12058)))))

(assert (=> d!2492 (= lt!12057 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!2492 (= lt!12058 ((_ sign_extend 32) (size!243 (buf!579 (_2!602 lt!12032)))))))

(assert (=> d!2492 (= lt!12062 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1609 (_2!602 lt!12032))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1604 (_2!602 lt!12032)))))))

(assert (=> d!2492 (invariant!0 (currentBit!1604 (_2!602 lt!12032)) (currentByte!1609 (_2!602 lt!12032)) (size!243 (buf!579 (_2!602 lt!12032))))))

(assert (=> d!2492 (= (bitIndex!0 (size!243 (buf!579 (_2!602 lt!12032))) (currentByte!1609 (_2!602 lt!12032)) (currentBit!1604 (_2!602 lt!12032))) lt!12062)))

(declare-fun b!8484 () Bool)

(declare-fun res!9020 () Bool)

(assert (=> b!8484 (=> (not res!9020) (not e!5309))))

(assert (=> b!8484 (= res!9020 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!12062))))

(declare-fun b!8485 () Bool)

(declare-fun lt!12060 () (_ BitVec 64))

(assert (=> b!8485 (= e!5309 (bvsle lt!12062 (bvmul lt!12060 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!8485 (or (= lt!12060 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!12060 #b0000000000000000000000000000000000000000000000000000000000001000) lt!12060)))))

(assert (=> b!8485 (= lt!12060 ((_ sign_extend 32) (size!243 (buf!579 (_2!602 lt!12032)))))))

(assert (= (and d!2492 res!9019) b!8484))

(assert (= (and b!8484 res!9020) b!8485))

(declare-fun m!11483 () Bool)

(assert (=> d!2492 m!11483))

(assert (=> d!2492 m!11477))

(assert (=> b!8468 d!2492))

(declare-fun d!2498 () Bool)

(declare-fun e!5313 () Bool)

(assert (=> d!2498 e!5313))

(declare-fun res!9026 () Bool)

(assert (=> d!2498 (=> (not res!9026) (not e!5313))))

(declare-fun lt!12073 () (_ BitVec 64))

(declare-fun lt!12074 () (_ BitVec 64))

(declare-fun lt!12071 () (_ BitVec 64))

(assert (=> d!2498 (= res!9026 (= lt!12074 (bvsub lt!12073 lt!12071)))))

(assert (=> d!2498 (or (= (bvand lt!12073 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!12071 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!12073 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!12073 lt!12071) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2498 (= lt!12071 (remainingBits!0 ((_ sign_extend 32) (size!243 (buf!579 thiss!1486))) ((_ sign_extend 32) (currentByte!1609 thiss!1486)) ((_ sign_extend 32) (currentBit!1604 thiss!1486))))))

(declare-fun lt!12070 () (_ BitVec 64))

(declare-fun lt!12069 () (_ BitVec 64))

(assert (=> d!2498 (= lt!12073 (bvmul lt!12070 lt!12069))))

(assert (=> d!2498 (or (= lt!12070 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!12069 (bvsdiv (bvmul lt!12070 lt!12069) lt!12070)))))

(assert (=> d!2498 (= lt!12069 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!2498 (= lt!12070 ((_ sign_extend 32) (size!243 (buf!579 thiss!1486))))))

(assert (=> d!2498 (= lt!12074 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1609 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1604 thiss!1486))))))

(assert (=> d!2498 (invariant!0 (currentBit!1604 thiss!1486) (currentByte!1609 thiss!1486) (size!243 (buf!579 thiss!1486)))))

(assert (=> d!2498 (= (bitIndex!0 (size!243 (buf!579 thiss!1486)) (currentByte!1609 thiss!1486) (currentBit!1604 thiss!1486)) lt!12074)))

(declare-fun b!8491 () Bool)

(declare-fun res!9027 () Bool)

(assert (=> b!8491 (=> (not res!9027) (not e!5313))))

(assert (=> b!8491 (= res!9027 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!12074))))

(declare-fun b!8492 () Bool)

(declare-fun lt!12072 () (_ BitVec 64))

(assert (=> b!8492 (= e!5313 (bvsle lt!12074 (bvmul lt!12072 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!8492 (or (= lt!12072 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!12072 #b0000000000000000000000000000000000000000000000000000000000001000) lt!12072)))))

(assert (=> b!8492 (= lt!12072 ((_ sign_extend 32) (size!243 (buf!579 thiss!1486))))))

(assert (= (and d!2498 res!9026) b!8491))

(assert (= (and b!8491 res!9027) b!8492))

(declare-fun m!11489 () Bool)

(assert (=> d!2498 m!11489))

(declare-fun m!11491 () Bool)

(assert (=> d!2498 m!11491))

(assert (=> b!8468 d!2498))

(declare-fun d!2504 () Bool)

(assert (=> d!2504 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!243 (buf!579 thiss!1486))) ((_ sign_extend 32) (currentByte!1609 thiss!1486)) ((_ sign_extend 32) (currentBit!1604 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!243 (buf!579 thiss!1486))) ((_ sign_extend 32) (currentByte!1609 thiss!1486)) ((_ sign_extend 32) (currentBit!1604 thiss!1486))) nBits!460))))

(declare-fun bs!840 () Bool)

(assert (= bs!840 d!2504))

(assert (=> bs!840 m!11489))

(assert (=> b!8464 d!2504))

(declare-fun d!2508 () Bool)

(declare-fun res!9042 () Bool)

(declare-fun e!5324 () Bool)

(assert (=> d!2508 (=> (not res!9042) (not e!5324))))

(assert (=> d!2508 (= res!9042 (= (size!243 (buf!579 thiss!1486)) (size!243 (buf!579 (_2!602 lt!12032)))))))

(assert (=> d!2508 (= (isPrefixOf!0 thiss!1486 (_2!602 lt!12032)) e!5324)))

(declare-fun b!8507 () Bool)

(declare-fun res!9043 () Bool)

(assert (=> b!8507 (=> (not res!9043) (not e!5324))))

(assert (=> b!8507 (= res!9043 (bvsle (bitIndex!0 (size!243 (buf!579 thiss!1486)) (currentByte!1609 thiss!1486) (currentBit!1604 thiss!1486)) (bitIndex!0 (size!243 (buf!579 (_2!602 lt!12032))) (currentByte!1609 (_2!602 lt!12032)) (currentBit!1604 (_2!602 lt!12032)))))))

(declare-fun b!8508 () Bool)

(declare-fun e!5323 () Bool)

(assert (=> b!8508 (= e!5324 e!5323)))

(declare-fun res!9044 () Bool)

(assert (=> b!8508 (=> res!9044 e!5323)))

(assert (=> b!8508 (= res!9044 (= (size!243 (buf!579 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!8509 () Bool)

(declare-fun arrayBitRangesEq!0 (array!565 array!565 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!8509 (= e!5323 (arrayBitRangesEq!0 (buf!579 thiss!1486) (buf!579 (_2!602 lt!12032)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!243 (buf!579 thiss!1486)) (currentByte!1609 thiss!1486) (currentBit!1604 thiss!1486))))))

(assert (= (and d!2508 res!9042) b!8507))

(assert (= (and b!8507 res!9043) b!8508))

(assert (= (and b!8508 (not res!9044)) b!8509))

(assert (=> b!8507 m!11469))

(assert (=> b!8507 m!11467))

(assert (=> b!8509 m!11469))

(assert (=> b!8509 m!11469))

(declare-fun m!11495 () Bool)

(assert (=> b!8509 m!11495))

(assert (=> b!8465 d!2508))

(declare-fun d!2514 () Bool)

(assert (=> d!2514 (= (array_inv!238 srcBuffer!6) (bvsge (size!243 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!1776 d!2514))

(declare-fun d!2516 () Bool)

(assert (=> d!2516 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1604 thiss!1486) (currentByte!1609 thiss!1486) (size!243 (buf!579 thiss!1486))))))

(declare-fun bs!842 () Bool)

(assert (= bs!842 d!2516))

(assert (=> bs!842 m!11491))

(assert (=> start!1776 d!2516))

(declare-fun d!2518 () Bool)

(assert (=> d!2518 (= (invariant!0 (currentBit!1604 (_2!602 lt!12032)) (currentByte!1609 (_2!602 lt!12032)) (size!243 (buf!579 (_2!602 lt!12032)))) (and (bvsge (currentBit!1604 (_2!602 lt!12032)) #b00000000000000000000000000000000) (bvslt (currentBit!1604 (_2!602 lt!12032)) #b00000000000000000000000000001000) (bvsge (currentByte!1609 (_2!602 lt!12032)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1609 (_2!602 lt!12032)) (size!243 (buf!579 (_2!602 lt!12032)))) (and (= (currentBit!1604 (_2!602 lt!12032)) #b00000000000000000000000000000000) (= (currentByte!1609 (_2!602 lt!12032)) (size!243 (buf!579 (_2!602 lt!12032))))))))))

(assert (=> b!8466 d!2518))

(declare-fun d!2524 () Bool)

(declare-fun e!5347 () Bool)

(assert (=> d!2524 e!5347))

(declare-fun res!9085 () Bool)

(assert (=> d!2524 (=> (not res!9085) (not e!5347))))

(declare-fun lt!12306 () (_ BitVec 64))

(declare-fun lt!12323 () tuple2!1142)

(assert (=> d!2524 (= res!9085 (= (bitIndex!0 (size!243 (buf!579 (_2!602 lt!12323))) (currentByte!1609 (_2!602 lt!12323)) (currentBit!1604 (_2!602 lt!12323))) (bvsub lt!12306 from!367)))))

(assert (=> d!2524 (or (= (bvand lt!12306 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!12306 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!12306 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!12342 () (_ BitVec 64))

(assert (=> d!2524 (= lt!12306 (bvadd lt!12342 from!367 nBits!460))))

(assert (=> d!2524 (or (not (= (bvand lt!12342 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!12342 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!12342 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2524 (= lt!12342 (bitIndex!0 (size!243 (buf!579 thiss!1486)) (currentByte!1609 thiss!1486) (currentBit!1604 thiss!1486)))))

(declare-fun e!5346 () tuple2!1142)

(assert (=> d!2524 (= lt!12323 e!5346)))

(declare-fun c!471 () Bool)

(assert (=> d!2524 (= c!471 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!12318 () Unit!719)

(declare-fun lt!12302 () Unit!719)

(assert (=> d!2524 (= lt!12318 lt!12302)))

(assert (=> d!2524 (isPrefixOf!0 thiss!1486 thiss!1486)))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!464) Unit!719)

(assert (=> d!2524 (= lt!12302 (lemmaIsPrefixRefl!0 thiss!1486))))

(declare-fun lt!12309 () (_ BitVec 64))

(assert (=> d!2524 (= lt!12309 (bitIndex!0 (size!243 (buf!579 thiss!1486)) (currentByte!1609 thiss!1486) (currentBit!1604 thiss!1486)))))

(assert (=> d!2524 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2524 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!12323)))

(declare-fun b!8557 () Bool)

(declare-fun lt!12304 () tuple2!1142)

(declare-fun Unit!724 () Unit!719)

(assert (=> b!8557 (= e!5346 (tuple2!1143 Unit!724 (_2!602 lt!12304)))))

(declare-fun lt!12313 () tuple2!1142)

(declare-fun appendBitFromByte!0 (BitStream!464 (_ BitVec 8) (_ BitVec 32)) tuple2!1142)

(assert (=> b!8557 (= lt!12313 (appendBitFromByte!0 thiss!1486 (select (arr!648 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!12344 () (_ BitVec 64))

(assert (=> b!8557 (= lt!12344 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!12339 () (_ BitVec 64))

(assert (=> b!8557 (= lt!12339 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!12340 () Unit!719)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!464 BitStream!464 (_ BitVec 64) (_ BitVec 64)) Unit!719)

(assert (=> b!8557 (= lt!12340 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!602 lt!12313) lt!12344 lt!12339))))

(assert (=> b!8557 (validate_offset_bits!1 ((_ sign_extend 32) (size!243 (buf!579 (_2!602 lt!12313)))) ((_ sign_extend 32) (currentByte!1609 (_2!602 lt!12313))) ((_ sign_extend 32) (currentBit!1604 (_2!602 lt!12313))) (bvsub lt!12344 lt!12339))))

(declare-fun lt!12327 () Unit!719)

(assert (=> b!8557 (= lt!12327 lt!12340)))

(declare-datatypes ((tuple2!1148 0))(
  ( (tuple2!1149 (_1!605 BitStream!464) (_2!605 BitStream!464)) )
))
(declare-fun lt!12343 () tuple2!1148)

(declare-fun reader!0 (BitStream!464 BitStream!464) tuple2!1148)

(assert (=> b!8557 (= lt!12343 (reader!0 thiss!1486 (_2!602 lt!12313)))))

(declare-fun lt!12308 () (_ BitVec 64))

(assert (=> b!8557 (= lt!12308 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!12311 () Unit!719)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!464 array!565 (_ BitVec 64)) Unit!719)

(assert (=> b!8557 (= lt!12311 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!579 (_2!602 lt!12313)) lt!12308))))

(assert (=> b!8557 (validate_offset_bits!1 ((_ sign_extend 32) (size!243 (buf!579 (_2!602 lt!12313)))) ((_ sign_extend 32) (currentByte!1609 thiss!1486)) ((_ sign_extend 32) (currentBit!1604 thiss!1486)) lt!12308)))

(declare-fun lt!12324 () Unit!719)

(assert (=> b!8557 (= lt!12324 lt!12311)))

(declare-datatypes ((List!139 0))(
  ( (Nil!136) (Cons!135 (h!254 Bool) (t!889 List!139)) )
))
(declare-fun head!45 (List!139) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!464 array!565 (_ BitVec 64) (_ BitVec 64)) List!139)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!464 BitStream!464 (_ BitVec 64)) List!139)

(assert (=> b!8557 (= (head!45 (byteArrayBitContentToList!0 (_2!602 lt!12313) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!45 (bitStreamReadBitsIntoList!0 (_2!602 lt!12313) (_1!605 lt!12343) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!12328 () Unit!719)

(declare-fun Unit!729 () Unit!719)

(assert (=> b!8557 (= lt!12328 Unit!729)))

(assert (=> b!8557 (= lt!12304 (appendBitsMSBFirstLoop!0 (_2!602 lt!12313) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!12314 () Unit!719)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!464 BitStream!464 BitStream!464) Unit!719)

(assert (=> b!8557 (= lt!12314 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!602 lt!12313) (_2!602 lt!12304)))))

(assert (=> b!8557 (isPrefixOf!0 thiss!1486 (_2!602 lt!12304))))

(declare-fun lt!12312 () Unit!719)

(assert (=> b!8557 (= lt!12312 lt!12314)))

(assert (=> b!8557 (= (size!243 (buf!579 (_2!602 lt!12304))) (size!243 (buf!579 thiss!1486)))))

(declare-fun lt!12320 () Unit!719)

(declare-fun Unit!732 () Unit!719)

(assert (=> b!8557 (= lt!12320 Unit!732)))

(assert (=> b!8557 (= (bitIndex!0 (size!243 (buf!579 (_2!602 lt!12304))) (currentByte!1609 (_2!602 lt!12304)) (currentBit!1604 (_2!602 lt!12304))) (bvsub (bvadd (bitIndex!0 (size!243 (buf!579 thiss!1486)) (currentByte!1609 thiss!1486) (currentBit!1604 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!12305 () Unit!719)

(declare-fun Unit!733 () Unit!719)

(assert (=> b!8557 (= lt!12305 Unit!733)))

(assert (=> b!8557 (= (bitIndex!0 (size!243 (buf!579 (_2!602 lt!12304))) (currentByte!1609 (_2!602 lt!12304)) (currentBit!1604 (_2!602 lt!12304))) (bvsub (bvsub (bvadd (bitIndex!0 (size!243 (buf!579 (_2!602 lt!12313))) (currentByte!1609 (_2!602 lt!12313)) (currentBit!1604 (_2!602 lt!12313))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!12310 () Unit!719)

(declare-fun Unit!735 () Unit!719)

(assert (=> b!8557 (= lt!12310 Unit!735)))

(declare-fun lt!12303 () tuple2!1148)

(assert (=> b!8557 (= lt!12303 (reader!0 thiss!1486 (_2!602 lt!12304)))))

(declare-fun lt!12329 () (_ BitVec 64))

(assert (=> b!8557 (= lt!12329 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!12301 () Unit!719)

(assert (=> b!8557 (= lt!12301 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!579 (_2!602 lt!12304)) lt!12329))))

(assert (=> b!8557 (validate_offset_bits!1 ((_ sign_extend 32) (size!243 (buf!579 (_2!602 lt!12304)))) ((_ sign_extend 32) (currentByte!1609 thiss!1486)) ((_ sign_extend 32) (currentBit!1604 thiss!1486)) lt!12329)))

(declare-fun lt!12333 () Unit!719)

(assert (=> b!8557 (= lt!12333 lt!12301)))

(declare-fun lt!12337 () tuple2!1148)

(declare-fun call!124 () tuple2!1148)

(assert (=> b!8557 (= lt!12337 call!124)))

(declare-fun lt!12338 () (_ BitVec 64))

(assert (=> b!8557 (= lt!12338 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!12332 () Unit!719)

(assert (=> b!8557 (= lt!12332 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!602 lt!12313) (buf!579 (_2!602 lt!12304)) lt!12338))))

(assert (=> b!8557 (validate_offset_bits!1 ((_ sign_extend 32) (size!243 (buf!579 (_2!602 lt!12304)))) ((_ sign_extend 32) (currentByte!1609 (_2!602 lt!12313))) ((_ sign_extend 32) (currentBit!1604 (_2!602 lt!12313))) lt!12338)))

(declare-fun lt!12326 () Unit!719)

(assert (=> b!8557 (= lt!12326 lt!12332)))

(declare-fun lt!12334 () List!139)

(assert (=> b!8557 (= lt!12334 (byteArrayBitContentToList!0 (_2!602 lt!12304) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!12307 () List!139)

(assert (=> b!8557 (= lt!12307 (byteArrayBitContentToList!0 (_2!602 lt!12304) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!12341 () List!139)

(assert (=> b!8557 (= lt!12341 (bitStreamReadBitsIntoList!0 (_2!602 lt!12304) (_1!605 lt!12303) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!12336 () List!139)

(assert (=> b!8557 (= lt!12336 (bitStreamReadBitsIntoList!0 (_2!602 lt!12304) (_1!605 lt!12337) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!12330 () (_ BitVec 64))

(assert (=> b!8557 (= lt!12330 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!12319 () Unit!719)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!464 BitStream!464 BitStream!464 BitStream!464 (_ BitVec 64) List!139) Unit!719)

(assert (=> b!8557 (= lt!12319 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!602 lt!12304) (_2!602 lt!12304) (_1!605 lt!12303) (_1!605 lt!12337) lt!12330 lt!12341))))

(declare-fun tail!53 (List!139) List!139)

(assert (=> b!8557 (= (bitStreamReadBitsIntoList!0 (_2!602 lt!12304) (_1!605 lt!12337) (bvsub lt!12330 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!53 lt!12341))))

(declare-fun lt!12325 () Unit!719)

(assert (=> b!8557 (= lt!12325 lt!12319)))

(declare-fun lt!12331 () Unit!719)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!565 array!565 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!719)

(assert (=> b!8557 (= lt!12331 (arrayBitRangesEqImpliesEq!0 (buf!579 (_2!602 lt!12313)) (buf!579 (_2!602 lt!12304)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!12309 (bitIndex!0 (size!243 (buf!579 (_2!602 lt!12313))) (currentByte!1609 (_2!602 lt!12313)) (currentBit!1604 (_2!602 lt!12313)))))))

(declare-fun bitAt!0 (array!565 (_ BitVec 64)) Bool)

(assert (=> b!8557 (= (bitAt!0 (buf!579 (_2!602 lt!12313)) lt!12309) (bitAt!0 (buf!579 (_2!602 lt!12304)) lt!12309))))

(declare-fun lt!12317 () Unit!719)

(assert (=> b!8557 (= lt!12317 lt!12331)))

(declare-fun bm!121 () Bool)

(assert (=> bm!121 (= call!124 (reader!0 (ite c!471 (_2!602 lt!12313) thiss!1486) (ite c!471 (_2!602 lt!12304) thiss!1486)))))

(declare-fun b!8558 () Bool)

(declare-fun res!9083 () Bool)

(assert (=> b!8558 (=> (not res!9083) (not e!5347))))

(assert (=> b!8558 (= res!9083 (isPrefixOf!0 thiss!1486 (_2!602 lt!12323)))))

(declare-fun b!8559 () Bool)

(declare-fun res!9082 () Bool)

(assert (=> b!8559 (=> (not res!9082) (not e!5347))))

(assert (=> b!8559 (= res!9082 (invariant!0 (currentBit!1604 (_2!602 lt!12323)) (currentByte!1609 (_2!602 lt!12323)) (size!243 (buf!579 (_2!602 lt!12323)))))))

(declare-fun b!8560 () Bool)

(declare-fun Unit!740 () Unit!719)

(assert (=> b!8560 (= e!5346 (tuple2!1143 Unit!740 thiss!1486))))

(assert (=> b!8560 (= (size!243 (buf!579 thiss!1486)) (size!243 (buf!579 thiss!1486)))))

(declare-fun lt!12321 () Unit!719)

(declare-fun Unit!741 () Unit!719)

(assert (=> b!8560 (= lt!12321 Unit!741)))

(declare-fun checkByteArrayBitContent!0 (BitStream!464 array!565 array!565 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!1154 0))(
  ( (tuple2!1155 (_1!608 array!565) (_2!608 BitStream!464)) )
))
(declare-fun readBits!0 (BitStream!464 (_ BitVec 64)) tuple2!1154)

(assert (=> b!8560 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!608 (readBits!0 (_1!605 call!124) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun b!8561 () Bool)

(declare-fun res!9081 () Bool)

(assert (=> b!8561 (=> (not res!9081) (not e!5347))))

(assert (=> b!8561 (= res!9081 (= (size!243 (buf!579 (_2!602 lt!12323))) (size!243 (buf!579 thiss!1486))))))

(declare-fun b!8562 () Bool)

(declare-fun res!9080 () Bool)

(assert (=> b!8562 (=> (not res!9080) (not e!5347))))

(assert (=> b!8562 (= res!9080 (= (size!243 (buf!579 thiss!1486)) (size!243 (buf!579 (_2!602 lt!12323)))))))

(declare-fun lt!12315 () tuple2!1148)

(declare-fun b!8563 () Bool)

(assert (=> b!8563 (= e!5347 (= (bitStreamReadBitsIntoList!0 (_2!602 lt!12323) (_1!605 lt!12315) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!602 lt!12323) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!8563 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8563 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!12322 () Unit!719)

(declare-fun lt!12335 () Unit!719)

(assert (=> b!8563 (= lt!12322 lt!12335)))

(declare-fun lt!12316 () (_ BitVec 64))

(assert (=> b!8563 (validate_offset_bits!1 ((_ sign_extend 32) (size!243 (buf!579 (_2!602 lt!12323)))) ((_ sign_extend 32) (currentByte!1609 thiss!1486)) ((_ sign_extend 32) (currentBit!1604 thiss!1486)) lt!12316)))

(assert (=> b!8563 (= lt!12335 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!579 (_2!602 lt!12323)) lt!12316))))

(declare-fun e!5345 () Bool)

(assert (=> b!8563 e!5345))

(declare-fun res!9084 () Bool)

(assert (=> b!8563 (=> (not res!9084) (not e!5345))))

(assert (=> b!8563 (= res!9084 (and (= (size!243 (buf!579 thiss!1486)) (size!243 (buf!579 (_2!602 lt!12323)))) (bvsge lt!12316 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8563 (= lt!12316 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!8563 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8563 (= lt!12315 (reader!0 thiss!1486 (_2!602 lt!12323)))))

(declare-fun b!8564 () Bool)

(assert (=> b!8564 (= e!5345 (validate_offset_bits!1 ((_ sign_extend 32) (size!243 (buf!579 thiss!1486))) ((_ sign_extend 32) (currentByte!1609 thiss!1486)) ((_ sign_extend 32) (currentBit!1604 thiss!1486)) lt!12316))))

(assert (= (and d!2524 c!471) b!8557))

(assert (= (and d!2524 (not c!471)) b!8560))

(assert (= (or b!8557 b!8560) bm!121))

(assert (= (and d!2524 res!9085) b!8559))

(assert (= (and b!8559 res!9082) b!8562))

(assert (= (and b!8562 res!9080) b!8558))

(assert (= (and b!8558 res!9083) b!8561))

(assert (= (and b!8561 res!9081) b!8563))

(assert (= (and b!8563 res!9084) b!8564))

(declare-fun m!11505 () Bool)

(assert (=> b!8563 m!11505))

(declare-fun m!11507 () Bool)

(assert (=> b!8563 m!11507))

(declare-fun m!11509 () Bool)

(assert (=> b!8563 m!11509))

(declare-fun m!11511 () Bool)

(assert (=> b!8563 m!11511))

(declare-fun m!11513 () Bool)

(assert (=> b!8563 m!11513))

(declare-fun m!11515 () Bool)

(assert (=> d!2524 m!11515))

(assert (=> d!2524 m!11469))

(declare-fun m!11517 () Bool)

(assert (=> d!2524 m!11517))

(declare-fun m!11519 () Bool)

(assert (=> d!2524 m!11519))

(declare-fun m!11521 () Bool)

(assert (=> b!8564 m!11521))

(declare-fun m!11523 () Bool)

(assert (=> b!8560 m!11523))

(declare-fun m!11525 () Bool)

(assert (=> b!8560 m!11525))

(declare-fun m!11527 () Bool)

(assert (=> bm!121 m!11527))

(declare-fun m!11529 () Bool)

(assert (=> b!8558 m!11529))

(declare-fun m!11531 () Bool)

(assert (=> b!8557 m!11531))

(declare-fun m!11533 () Bool)

(assert (=> b!8557 m!11533))

(declare-fun m!11535 () Bool)

(assert (=> b!8557 m!11535))

(declare-fun m!11537 () Bool)

(assert (=> b!8557 m!11537))

(declare-fun m!11539 () Bool)

(assert (=> b!8557 m!11539))

(declare-fun m!11541 () Bool)

(assert (=> b!8557 m!11541))

(declare-fun m!11543 () Bool)

(assert (=> b!8557 m!11543))

(declare-fun m!11545 () Bool)

(assert (=> b!8557 m!11545))

(declare-fun m!11547 () Bool)

(assert (=> b!8557 m!11547))

(declare-fun m!11549 () Bool)

(assert (=> b!8557 m!11549))

(declare-fun m!11551 () Bool)

(assert (=> b!8557 m!11551))

(declare-fun m!11553 () Bool)

(assert (=> b!8557 m!11553))

(declare-fun m!11555 () Bool)

(assert (=> b!8557 m!11555))

(declare-fun m!11557 () Bool)

(assert (=> b!8557 m!11557))

(declare-fun m!11559 () Bool)

(assert (=> b!8557 m!11559))

(declare-fun m!11561 () Bool)

(assert (=> b!8557 m!11561))

(declare-fun m!11563 () Bool)

(assert (=> b!8557 m!11563))

(declare-fun m!11565 () Bool)

(assert (=> b!8557 m!11565))

(declare-fun m!11567 () Bool)

(assert (=> b!8557 m!11567))

(declare-fun m!11569 () Bool)

(assert (=> b!8557 m!11569))

(declare-fun m!11571 () Bool)

(assert (=> b!8557 m!11571))

(declare-fun m!11573 () Bool)

(assert (=> b!8557 m!11573))

(declare-fun m!11575 () Bool)

(assert (=> b!8557 m!11575))

(declare-fun m!11577 () Bool)

(assert (=> b!8557 m!11577))

(declare-fun m!11579 () Bool)

(assert (=> b!8557 m!11579))

(declare-fun m!11581 () Bool)

(assert (=> b!8557 m!11581))

(declare-fun m!11583 () Bool)

(assert (=> b!8557 m!11583))

(assert (=> b!8557 m!11569))

(declare-fun m!11585 () Bool)

(assert (=> b!8557 m!11585))

(assert (=> b!8557 m!11585))

(declare-fun m!11587 () Bool)

(assert (=> b!8557 m!11587))

(assert (=> b!8557 m!11551))

(declare-fun m!11589 () Bool)

(assert (=> b!8557 m!11589))

(assert (=> b!8557 m!11469))

(assert (=> b!8557 m!11565))

(declare-fun m!11591 () Bool)

(assert (=> b!8557 m!11591))

(declare-fun m!11593 () Bool)

(assert (=> b!8559 m!11593))

(assert (=> b!8466 d!2524))

(push 1)

