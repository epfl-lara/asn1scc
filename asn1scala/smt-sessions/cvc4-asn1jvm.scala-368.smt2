; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8492 () Bool)

(assert start!8492)

(declare-fun b!42457 () Bool)

(declare-fun e!28354 () Bool)

(declare-datatypes ((array!2181 0))(
  ( (array!2182 (arr!1486 (Array (_ BitVec 32) (_ BitVec 8))) (size!987 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1718 0))(
  ( (BitStream!1719 (buf!1318 array!2181) (currentByte!2776 (_ BitVec 32)) (currentBit!2771 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1718)

(declare-fun array_inv!912 (array!2181) Bool)

(assert (=> b!42457 (= e!28354 (array_inv!912 (buf!1318 thiss!1379)))))

(declare-fun res!36104 () Bool)

(declare-fun e!28351 () Bool)

(assert (=> start!8492 (=> (not res!36104) (not e!28351))))

(declare-fun srcBuffer!2 () array!2181)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!8492 (= res!36104 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!987 srcBuffer!2))))))))

(assert (=> start!8492 e!28351))

(assert (=> start!8492 true))

(assert (=> start!8492 (array_inv!912 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1718) Bool)

(assert (=> start!8492 (and (inv!12 thiss!1379) e!28354)))

(declare-fun b!42456 () Bool)

(declare-fun e!28353 () Bool)

(declare-datatypes ((Unit!3028 0))(
  ( (Unit!3029) )
))
(declare-datatypes ((tuple2!4166 0))(
  ( (tuple2!4167 (_1!2176 Unit!3028) (_2!2176 BitStream!1718)) )
))
(declare-fun lt!63805 () tuple2!4166)

(declare-fun isPrefixOf!0 (BitStream!1718 BitStream!1718) Bool)

(assert (=> b!42456 (= e!28353 (isPrefixOf!0 thiss!1379 (_2!2176 lt!63805)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!42456 (validate_offset_bits!1 ((_ sign_extend 32) (size!987 (buf!1318 (_2!2176 lt!63805)))) ((_ sign_extend 32) (currentByte!2776 (_2!2176 lt!63805))) ((_ sign_extend 32) (currentBit!2771 (_2!2176 lt!63805))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!63804 () Unit!3028)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1718 BitStream!1718 (_ BitVec 64) (_ BitVec 64)) Unit!3028)

(assert (=> b!42456 (= lt!63804 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2176 lt!63805) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1718 (_ BitVec 8) (_ BitVec 32)) tuple2!4166)

(assert (=> b!42456 (= lt!63805 (appendBitFromByte!0 thiss!1379 (select (arr!1486 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!42454 () Bool)

(declare-fun res!36105 () Bool)

(assert (=> b!42454 (=> (not res!36105) (not e!28351))))

(assert (=> b!42454 (= res!36105 (validate_offset_bits!1 ((_ sign_extend 32) (size!987 (buf!1318 thiss!1379))) ((_ sign_extend 32) (currentByte!2776 thiss!1379)) ((_ sign_extend 32) (currentBit!2771 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!42455 () Bool)

(assert (=> b!42455 (= e!28351 (not e!28353))))

(declare-fun res!36103 () Bool)

(assert (=> b!42455 (=> res!36103 e!28353)))

(assert (=> b!42455 (= res!36103 (bvsge i!635 to!314))))

(assert (=> b!42455 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!63803 () Unit!3028)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1718) Unit!3028)

(assert (=> b!42455 (= lt!63803 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!63802 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!42455 (= lt!63802 (bitIndex!0 (size!987 (buf!1318 thiss!1379)) (currentByte!2776 thiss!1379) (currentBit!2771 thiss!1379)))))

(assert (= (and start!8492 res!36104) b!42454))

(assert (= (and b!42454 res!36105) b!42455))

(assert (= (and b!42455 (not res!36103)) b!42456))

(assert (= start!8492 b!42457))

(declare-fun m!64423 () Bool)

(assert (=> start!8492 m!64423))

(declare-fun m!64425 () Bool)

(assert (=> start!8492 m!64425))

(declare-fun m!64427 () Bool)

(assert (=> b!42455 m!64427))

(declare-fun m!64429 () Bool)

(assert (=> b!42455 m!64429))

(declare-fun m!64431 () Bool)

(assert (=> b!42455 m!64431))

(declare-fun m!64433 () Bool)

(assert (=> b!42454 m!64433))

(declare-fun m!64435 () Bool)

(assert (=> b!42456 m!64435))

(declare-fun m!64437 () Bool)

(assert (=> b!42456 m!64437))

(declare-fun m!64439 () Bool)

(assert (=> b!42456 m!64439))

(declare-fun m!64441 () Bool)

(assert (=> b!42456 m!64441))

(assert (=> b!42456 m!64435))

(declare-fun m!64443 () Bool)

(assert (=> b!42456 m!64443))

(declare-fun m!64445 () Bool)

(assert (=> b!42457 m!64445))

(push 1)

(assert (not b!42456))

(assert (not start!8492))

(assert (not b!42457))

(assert (not b!42454))

(assert (not b!42455))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!12306 () Bool)

(declare-fun res!36146 () Bool)

(declare-fun e!28382 () Bool)

(assert (=> d!12306 (=> (not res!36146) (not e!28382))))

(assert (=> d!12306 (= res!36146 (= (size!987 (buf!1318 thiss!1379)) (size!987 (buf!1318 thiss!1379))))))

(assert (=> d!12306 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!28382)))

(declare-fun b!42496 () Bool)

(declare-fun res!36145 () Bool)

(assert (=> b!42496 (=> (not res!36145) (not e!28382))))

(assert (=> b!42496 (= res!36145 (bvsle (bitIndex!0 (size!987 (buf!1318 thiss!1379)) (currentByte!2776 thiss!1379) (currentBit!2771 thiss!1379)) (bitIndex!0 (size!987 (buf!1318 thiss!1379)) (currentByte!2776 thiss!1379) (currentBit!2771 thiss!1379))))))

(declare-fun b!42497 () Bool)

(declare-fun e!28381 () Bool)

(assert (=> b!42497 (= e!28382 e!28381)))

(declare-fun res!36144 () Bool)

(assert (=> b!42497 (=> res!36144 e!28381)))

(assert (=> b!42497 (= res!36144 (= (size!987 (buf!1318 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!42498 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2181 array!2181 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!42498 (= e!28381 (arrayBitRangesEq!0 (buf!1318 thiss!1379) (buf!1318 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!987 (buf!1318 thiss!1379)) (currentByte!2776 thiss!1379) (currentBit!2771 thiss!1379))))))

(assert (= (and d!12306 res!36146) b!42496))

(assert (= (and b!42496 res!36145) b!42497))

(assert (= (and b!42497 (not res!36144)) b!42498))

(assert (=> b!42496 m!64431))

(assert (=> b!42496 m!64431))

(assert (=> b!42498 m!64431))

(assert (=> b!42498 m!64431))

(declare-fun m!64473 () Bool)

(assert (=> b!42498 m!64473))

(assert (=> b!42455 d!12306))

(declare-fun d!12308 () Bool)

(assert (=> d!12308 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!63835 () Unit!3028)

(declare-fun choose!11 (BitStream!1718) Unit!3028)

(assert (=> d!12308 (= lt!63835 (choose!11 thiss!1379))))

(assert (=> d!12308 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!63835)))

(declare-fun bs!3322 () Bool)

(assert (= bs!3322 d!12308))

(assert (=> bs!3322 m!64427))

(declare-fun m!64477 () Bool)

(assert (=> bs!3322 m!64477))

(assert (=> b!42455 d!12308))

(declare-fun d!12312 () Bool)

(declare-fun e!28386 () Bool)

(assert (=> d!12312 e!28386))

(declare-fun res!36152 () Bool)

(assert (=> d!12312 (=> (not res!36152) (not e!28386))))

(declare-fun lt!63850 () (_ BitVec 64))

(declare-fun lt!63849 () (_ BitVec 64))

(declare-fun lt!63852 () (_ BitVec 64))

(assert (=> d!12312 (= res!36152 (= lt!63849 (bvsub lt!63850 lt!63852)))))

(assert (=> d!12312 (or (= (bvand lt!63850 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!63852 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!63850 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!63850 lt!63852) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!12312 (= lt!63852 (remainingBits!0 ((_ sign_extend 32) (size!987 (buf!1318 thiss!1379))) ((_ sign_extend 32) (currentByte!2776 thiss!1379)) ((_ sign_extend 32) (currentBit!2771 thiss!1379))))))

(declare-fun lt!63851 () (_ BitVec 64))

(declare-fun lt!63848 () (_ BitVec 64))

(assert (=> d!12312 (= lt!63850 (bvmul lt!63851 lt!63848))))

(assert (=> d!12312 (or (= lt!63851 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!63848 (bvsdiv (bvmul lt!63851 lt!63848) lt!63851)))))

(assert (=> d!12312 (= lt!63848 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!12312 (= lt!63851 ((_ sign_extend 32) (size!987 (buf!1318 thiss!1379))))))

(assert (=> d!12312 (= lt!63849 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2776 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2771 thiss!1379))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!12312 (invariant!0 (currentBit!2771 thiss!1379) (currentByte!2776 thiss!1379) (size!987 (buf!1318 thiss!1379)))))

(assert (=> d!12312 (= (bitIndex!0 (size!987 (buf!1318 thiss!1379)) (currentByte!2776 thiss!1379) (currentBit!2771 thiss!1379)) lt!63849)))

(declare-fun b!42504 () Bool)

(declare-fun res!36153 () Bool)

(assert (=> b!42504 (=> (not res!36153) (not e!28386))))

(assert (=> b!42504 (= res!36153 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!63849))))

(declare-fun b!42505 () Bool)

(declare-fun lt!63853 () (_ BitVec 64))

(assert (=> b!42505 (= e!28386 (bvsle lt!63849 (bvmul lt!63853 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!42505 (or (= lt!63853 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!63853 #b0000000000000000000000000000000000000000000000000000000000001000) lt!63853)))))

(assert (=> b!42505 (= lt!63853 ((_ sign_extend 32) (size!987 (buf!1318 thiss!1379))))))

(assert (= (and d!12312 res!36152) b!42504))

(assert (= (and b!42504 res!36153) b!42505))

(declare-fun m!64479 () Bool)

(assert (=> d!12312 m!64479))

(declare-fun m!64481 () Bool)

(assert (=> d!12312 m!64481))

(assert (=> b!42455 d!12312))

(declare-fun d!12314 () Bool)

(assert (=> d!12314 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!987 (buf!1318 thiss!1379))) ((_ sign_extend 32) (currentByte!2776 thiss!1379)) ((_ sign_extend 32) (currentBit!2771 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!987 (buf!1318 thiss!1379))) ((_ sign_extend 32) (currentByte!2776 thiss!1379)) ((_ sign_extend 32) (currentBit!2771 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3323 () Bool)

(assert (= bs!3323 d!12314))

(assert (=> bs!3323 m!64479))

(assert (=> b!42454 d!12314))

(declare-fun d!12316 () Bool)

(assert (=> d!12316 (= (array_inv!912 (buf!1318 thiss!1379)) (bvsge (size!987 (buf!1318 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!42457 d!12316))

(declare-fun d!12318 () Bool)

(assert (=> d!12318 (= (array_inv!912 srcBuffer!2) (bvsge (size!987 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!8492 d!12318))

(declare-fun d!12320 () Bool)

(assert (=> d!12320 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2771 thiss!1379) (currentByte!2776 thiss!1379) (size!987 (buf!1318 thiss!1379))))))

(declare-fun bs!3324 () Bool)

(assert (= bs!3324 d!12320))

(assert (=> bs!3324 m!64481))

(assert (=> start!8492 d!12320))

(declare-fun d!12322 () Bool)

(declare-fun res!36156 () Bool)

(declare-fun e!28388 () Bool)

(assert (=> d!12322 (=> (not res!36156) (not e!28388))))

(assert (=> d!12322 (= res!36156 (= (size!987 (buf!1318 thiss!1379)) (size!987 (buf!1318 (_2!2176 lt!63805)))))))

(assert (=> d!12322 (= (isPrefixOf!0 thiss!1379 (_2!2176 lt!63805)) e!28388)))

(declare-fun b!42506 () Bool)

(declare-fun res!36155 () Bool)

(assert (=> b!42506 (=> (not res!36155) (not e!28388))))

(assert (=> b!42506 (= res!36155 (bvsle (bitIndex!0 (size!987 (buf!1318 thiss!1379)) (currentByte!2776 thiss!1379) (currentBit!2771 thiss!1379)) (bitIndex!0 (size!987 (buf!1318 (_2!2176 lt!63805))) (currentByte!2776 (_2!2176 lt!63805)) (currentBit!2771 (_2!2176 lt!63805)))))))

(declare-fun b!42507 () Bool)

(declare-fun e!28387 () Bool)

(assert (=> b!42507 (= e!28388 e!28387)))

(declare-fun res!36154 () Bool)

(assert (=> b!42507 (=> res!36154 e!28387)))

(assert (=> b!42507 (= res!36154 (= (size!987 (buf!1318 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!42508 () Bool)

(assert (=> b!42508 (= e!28387 (arrayBitRangesEq!0 (buf!1318 thiss!1379) (buf!1318 (_2!2176 lt!63805)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!987 (buf!1318 thiss!1379)) (currentByte!2776 thiss!1379) (currentBit!2771 thiss!1379))))))

(assert (= (and d!12322 res!36156) b!42506))

(assert (= (and b!42506 res!36155) b!42507))

(assert (= (and b!42507 (not res!36154)) b!42508))

(assert (=> b!42506 m!64431))

(declare-fun m!64483 () Bool)

(assert (=> b!42506 m!64483))

(assert (=> b!42508 m!64431))

(assert (=> b!42508 m!64431))

(declare-fun m!64485 () Bool)

(assert (=> b!42508 m!64485))

(assert (=> b!42456 d!12322))

(declare-fun d!12324 () Bool)

(assert (=> d!12324 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!987 (buf!1318 (_2!2176 lt!63805)))) ((_ sign_extend 32) (currentByte!2776 (_2!2176 lt!63805))) ((_ sign_extend 32) (currentBit!2771 (_2!2176 lt!63805))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!987 (buf!1318 (_2!2176 lt!63805)))) ((_ sign_extend 32) (currentByte!2776 (_2!2176 lt!63805))) ((_ sign_extend 32) (currentBit!2771 (_2!2176 lt!63805)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!3325 () Bool)

(assert (= bs!3325 d!12324))

(declare-fun m!64487 () Bool)

(assert (=> bs!3325 m!64487))

(assert (=> b!42456 d!12324))

(declare-fun d!12326 () Bool)

(declare-fun e!28391 () Bool)

(assert (=> d!12326 e!28391))

(declare-fun res!36159 () Bool)

(assert (=> d!12326 (=> (not res!36159) (not e!28391))))

(assert (=> d!12326 (= res!36159 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!63856 () Unit!3028)

(declare-fun choose!27 (BitStream!1718 BitStream!1718 (_ BitVec 64) (_ BitVec 64)) Unit!3028)

(assert (=> d!12326 (= lt!63856 (choose!27 thiss!1379 (_2!2176 lt!63805) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!12326 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!12326 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2176 lt!63805) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!63856)))

(declare-fun b!42511 () Bool)

(assert (=> b!42511 (= e!28391 (validate_offset_bits!1 ((_ sign_extend 32) (size!987 (buf!1318 (_2!2176 lt!63805)))) ((_ sign_extend 32) (currentByte!2776 (_2!2176 lt!63805))) ((_ sign_extend 32) (currentBit!2771 (_2!2176 lt!63805))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!12326 res!36159) b!42511))

(declare-fun m!64489 () Bool)

(assert (=> d!12326 m!64489))

(assert (=> b!42511 m!64437))

(assert (=> b!42456 d!12326))

(declare-fun b!42582 () Bool)

(declare-fun res!36234 () Bool)

(declare-fun e!28426 () Bool)

(assert (=> b!42582 (=> (not res!36234) (not e!28426))))

(declare-fun lt!63967 () tuple2!4166)

(assert (=> b!42582 (= res!36234 (isPrefixOf!0 thiss!1379 (_2!2176 lt!63967)))))

(declare-fun b!42583 () Bool)

(declare-fun e!28427 () Bool)

(assert (=> b!42583 (= e!28426 e!28427)))

(declare-fun res!36229 () Bool)

(assert (=> b!42583 (=> (not res!36229) (not e!28427))))

(declare-fun lt!63966 () Bool)

(declare-datatypes ((tuple2!4176 0))(
  ( (tuple2!4177 (_1!2181 BitStream!1718) (_2!2181 Bool)) )
))
(declare-fun lt!63962 () tuple2!4176)

(assert (=> b!42583 (= res!36229 (and (= (_2!2181 lt!63962) lt!63966) (= (_1!2181 lt!63962) (_2!2176 lt!63967))))))

(declare-fun readBitPure!0 (BitStream!1718) tuple2!4176)

(declare-fun readerFrom!0 (BitStream!1718 (_ BitVec 32) (_ BitVec 32)) BitStream!1718)

(assert (=> b!42583 (= lt!63962 (readBitPure!0 (readerFrom!0 (_2!2176 lt!63967) (currentBit!2771 thiss!1379) (currentByte!2776 thiss!1379))))))

(declare-fun d!12328 () Bool)

(declare-fun e!28428 () Bool)

(assert (=> d!12328 e!28428))

(declare-fun res!36232 () Bool)

(assert (=> d!12328 (=> (not res!36232) (not e!28428))))

(declare-fun lt!63957 () tuple2!4166)

(assert (=> d!12328 (= res!36232 (= (size!987 (buf!1318 (_2!2176 lt!63957))) (size!987 (buf!1318 thiss!1379))))))

(declare-fun lt!63965 () (_ BitVec 8))

(declare-fun lt!63956 () array!2181)

(assert (=> d!12328 (= lt!63965 (select (arr!1486 lt!63956) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!12328 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!987 lt!63956)))))

(assert (=> d!12328 (= lt!63956 (array!2182 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!63964 () tuple2!4166)

(assert (=> d!12328 (= lt!63957 (tuple2!4167 (_1!2176 lt!63964) (_2!2176 lt!63964)))))

(assert (=> d!12328 (= lt!63964 lt!63967)))

(assert (=> d!12328 e!28426))

(declare-fun res!36230 () Bool)

(assert (=> d!12328 (=> (not res!36230) (not e!28426))))

(assert (=> d!12328 (= res!36230 (= (size!987 (buf!1318 thiss!1379)) (size!987 (buf!1318 (_2!2176 lt!63967)))))))

(declare-fun appendBit!0 (BitStream!1718 Bool) tuple2!4166)

(assert (=> d!12328 (= lt!63967 (appendBit!0 thiss!1379 lt!63966))))

(assert (=> d!12328 (= lt!63966 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1486 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!12328 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!12328 (= (appendBitFromByte!0 thiss!1379 (select (arr!1486 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!63957)))

(declare-fun b!42584 () Bool)

(assert (=> b!42584 (= e!28427 (= (bitIndex!0 (size!987 (buf!1318 (_1!2181 lt!63962))) (currentByte!2776 (_1!2181 lt!63962)) (currentBit!2771 (_1!2181 lt!63962))) (bitIndex!0 (size!987 (buf!1318 (_2!2176 lt!63967))) (currentByte!2776 (_2!2176 lt!63967)) (currentBit!2771 (_2!2176 lt!63967)))))))

(declare-fun b!42585 () Bool)

(declare-fun res!36228 () Bool)

(assert (=> b!42585 (=> (not res!36228) (not e!28426))))

(assert (=> b!42585 (= res!36228 (= (bitIndex!0 (size!987 (buf!1318 (_2!2176 lt!63967))) (currentByte!2776 (_2!2176 lt!63967)) (currentBit!2771 (_2!2176 lt!63967))) (bvadd (bitIndex!0 (size!987 (buf!1318 thiss!1379)) (currentByte!2776 thiss!1379) (currentBit!2771 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!42586 () Bool)

(declare-fun e!28429 () Bool)

(declare-fun lt!63961 () tuple2!4176)

(assert (=> b!42586 (= e!28429 (= (bitIndex!0 (size!987 (buf!1318 (_1!2181 lt!63961))) (currentByte!2776 (_1!2181 lt!63961)) (currentBit!2771 (_1!2181 lt!63961))) (bitIndex!0 (size!987 (buf!1318 (_2!2176 lt!63957))) (currentByte!2776 (_2!2176 lt!63957)) (currentBit!2771 (_2!2176 lt!63957)))))))

(declare-fun b!42587 () Bool)

(declare-fun res!36231 () Bool)

(assert (=> b!42587 (=> (not res!36231) (not e!28428))))

(assert (=> b!42587 (= res!36231 (isPrefixOf!0 thiss!1379 (_2!2176 lt!63957)))))

(declare-fun b!42588 () Bool)

(declare-fun res!36233 () Bool)

(assert (=> b!42588 (=> (not res!36233) (not e!28428))))

(declare-fun lt!63963 () (_ BitVec 64))

(declare-fun lt!63959 () (_ BitVec 64))

(assert (=> b!42588 (= res!36233 (= (bitIndex!0 (size!987 (buf!1318 (_2!2176 lt!63957))) (currentByte!2776 (_2!2176 lt!63957)) (currentBit!2771 (_2!2176 lt!63957))) (bvadd lt!63959 lt!63963)))))

(assert (=> b!42588 (or (not (= (bvand lt!63959 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!63963 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!63959 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!63959 lt!63963) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!42588 (= lt!63963 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!42588 (= lt!63959 (bitIndex!0 (size!987 (buf!1318 thiss!1379)) (currentByte!2776 thiss!1379) (currentBit!2771 thiss!1379)))))

(declare-fun b!42589 () Bool)

(assert (=> b!42589 (= e!28428 e!28429)))

(declare-fun res!36227 () Bool)

(assert (=> b!42589 (=> (not res!36227) (not e!28429))))

(assert (=> b!42589 (= res!36227 (and (= (_2!2181 lt!63961) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1486 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!63965)) #b00000000000000000000000000000000))) (= (_1!2181 lt!63961) (_2!2176 lt!63957))))))

(declare-datatypes ((tuple2!4178 0))(
  ( (tuple2!4179 (_1!2182 array!2181) (_2!2182 BitStream!1718)) )
))
(declare-fun lt!63958 () tuple2!4178)

(declare-fun lt!63960 () BitStream!1718)

(declare-fun readBits!0 (BitStream!1718 (_ BitVec 64)) tuple2!4178)

(assert (=> b!42589 (= lt!63958 (readBits!0 lt!63960 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!42589 (= lt!63961 (readBitPure!0 lt!63960))))

(assert (=> b!42589 (= lt!63960 (readerFrom!0 (_2!2176 lt!63957) (currentBit!2771 thiss!1379) (currentByte!2776 thiss!1379)))))

(assert (= (and d!12328 res!36230) b!42585))

(assert (= (and b!42585 res!36228) b!42582))

(assert (= (and b!42582 res!36234) b!42583))

(assert (= (and b!42583 res!36229) b!42584))

(assert (= (and d!12328 res!36232) b!42588))

(assert (= (and b!42588 res!36233) b!42587))

(assert (= (and b!42587 res!36231) b!42589))

(assert (= (and b!42589 res!36227) b!42586))

(declare-fun m!64551 () Bool)

(assert (=> b!42585 m!64551))

(assert (=> b!42585 m!64431))

(declare-fun m!64553 () Bool)

(assert (=> b!42589 m!64553))

(declare-fun m!64555 () Bool)

(assert (=> b!42589 m!64555))

(declare-fun m!64557 () Bool)

(assert (=> b!42589 m!64557))

(declare-fun m!64559 () Bool)

(assert (=> b!42588 m!64559))

(assert (=> b!42588 m!64431))

(declare-fun m!64561 () Bool)

(assert (=> b!42587 m!64561))

(declare-fun m!64563 () Bool)

(assert (=> b!42586 m!64563))

(assert (=> b!42586 m!64559))

(declare-fun m!64565 () Bool)

(assert (=> b!42584 m!64565))

(assert (=> b!42584 m!64551))

(declare-fun m!64567 () Bool)

(assert (=> b!42582 m!64567))

