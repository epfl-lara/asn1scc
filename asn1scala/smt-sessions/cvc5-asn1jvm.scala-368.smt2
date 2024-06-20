; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8488 () Bool)

(assert start!8488)

(declare-fun res!36085 () Bool)

(declare-fun e!28324 () Bool)

(assert (=> start!8488 (=> (not res!36085) (not e!28324))))

(declare-datatypes ((array!2177 0))(
  ( (array!2178 (arr!1484 (Array (_ BitVec 32) (_ BitVec 8))) (size!985 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2177)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!8488 (= res!36085 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!985 srcBuffer!2))))))))

(assert (=> start!8488 e!28324))

(assert (=> start!8488 true))

(declare-fun array_inv!910 (array!2177) Bool)

(assert (=> start!8488 (array_inv!910 srcBuffer!2)))

(declare-datatypes ((BitStream!1714 0))(
  ( (BitStream!1715 (buf!1316 array!2177) (currentByte!2774 (_ BitVec 32)) (currentBit!2769 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1714)

(declare-fun e!28321 () Bool)

(declare-fun inv!12 (BitStream!1714) Bool)

(assert (=> start!8488 (and (inv!12 thiss!1379) e!28321)))

(declare-fun b!42433 () Bool)

(assert (=> b!42433 (= e!28321 (array_inv!910 (buf!1316 thiss!1379)))))

(declare-fun b!42431 () Bool)

(declare-fun e!28322 () Bool)

(assert (=> b!42431 (= e!28324 (not e!28322))))

(declare-fun res!36087 () Bool)

(assert (=> b!42431 (=> res!36087 e!28322)))

(assert (=> b!42431 (= res!36087 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1714 BitStream!1714) Bool)

(assert (=> b!42431 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3024 0))(
  ( (Unit!3025) )
))
(declare-fun lt!63781 () Unit!3024)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1714) Unit!3024)

(assert (=> b!42431 (= lt!63781 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!63780 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!42431 (= lt!63780 (bitIndex!0 (size!985 (buf!1316 thiss!1379)) (currentByte!2774 thiss!1379) (currentBit!2769 thiss!1379)))))

(declare-fun b!42432 () Bool)

(declare-datatypes ((tuple2!4162 0))(
  ( (tuple2!4163 (_1!2174 Unit!3024) (_2!2174 BitStream!1714)) )
))
(declare-fun lt!63778 () tuple2!4162)

(assert (=> b!42432 (= e!28322 (isPrefixOf!0 thiss!1379 (_2!2174 lt!63778)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!42432 (validate_offset_bits!1 ((_ sign_extend 32) (size!985 (buf!1316 (_2!2174 lt!63778)))) ((_ sign_extend 32) (currentByte!2774 (_2!2174 lt!63778))) ((_ sign_extend 32) (currentBit!2769 (_2!2174 lt!63778))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!63779 () Unit!3024)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1714 BitStream!1714 (_ BitVec 64) (_ BitVec 64)) Unit!3024)

(assert (=> b!42432 (= lt!63779 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2174 lt!63778) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1714 (_ BitVec 8) (_ BitVec 32)) tuple2!4162)

(assert (=> b!42432 (= lt!63778 (appendBitFromByte!0 thiss!1379 (select (arr!1484 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!42430 () Bool)

(declare-fun res!36086 () Bool)

(assert (=> b!42430 (=> (not res!36086) (not e!28324))))

(assert (=> b!42430 (= res!36086 (validate_offset_bits!1 ((_ sign_extend 32) (size!985 (buf!1316 thiss!1379))) ((_ sign_extend 32) (currentByte!2774 thiss!1379)) ((_ sign_extend 32) (currentBit!2769 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!8488 res!36085) b!42430))

(assert (= (and b!42430 res!36086) b!42431))

(assert (= (and b!42431 (not res!36087)) b!42432))

(assert (= start!8488 b!42433))

(declare-fun m!64375 () Bool)

(assert (=> b!42430 m!64375))

(declare-fun m!64377 () Bool)

(assert (=> b!42431 m!64377))

(declare-fun m!64379 () Bool)

(assert (=> b!42431 m!64379))

(declare-fun m!64381 () Bool)

(assert (=> b!42431 m!64381))

(declare-fun m!64383 () Bool)

(assert (=> start!8488 m!64383))

(declare-fun m!64385 () Bool)

(assert (=> start!8488 m!64385))

(declare-fun m!64387 () Bool)

(assert (=> b!42433 m!64387))

(declare-fun m!64389 () Bool)

(assert (=> b!42432 m!64389))

(declare-fun m!64391 () Bool)

(assert (=> b!42432 m!64391))

(declare-fun m!64393 () Bool)

(assert (=> b!42432 m!64393))

(declare-fun m!64395 () Bool)

(assert (=> b!42432 m!64395))

(assert (=> b!42432 m!64389))

(declare-fun m!64397 () Bool)

(assert (=> b!42432 m!64397))

(push 1)

(assert (not b!42432))

(assert (not b!42433))

(assert (not start!8488))

(assert (not b!42431))

(assert (not b!42430))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!12284 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!12284 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!985 (buf!1316 thiss!1379))) ((_ sign_extend 32) (currentByte!2774 thiss!1379)) ((_ sign_extend 32) (currentBit!2769 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!985 (buf!1316 thiss!1379))) ((_ sign_extend 32) (currentByte!2774 thiss!1379)) ((_ sign_extend 32) (currentBit!2769 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3317 () Bool)

(assert (= bs!3317 d!12284))

(declare-fun m!64455 () Bool)

(assert (=> bs!3317 m!64455))

(assert (=> b!42430 d!12284))

(declare-fun d!12286 () Bool)

(assert (=> d!12286 (= (array_inv!910 srcBuffer!2) (bvsge (size!985 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!8488 d!12286))

(declare-fun d!12288 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!12288 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2769 thiss!1379) (currentByte!2774 thiss!1379) (size!985 (buf!1316 thiss!1379))))))

(declare-fun bs!3318 () Bool)

(assert (= bs!3318 d!12288))

(declare-fun m!64457 () Bool)

(assert (=> bs!3318 m!64457))

(assert (=> start!8488 d!12288))

(declare-fun d!12290 () Bool)

(assert (=> d!12290 (= (array_inv!910 (buf!1316 thiss!1379)) (bvsge (size!985 (buf!1316 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!42433 d!12290))

(declare-fun d!12292 () Bool)

(declare-fun res!36135 () Bool)

(declare-fun e!28374 () Bool)

(assert (=> d!12292 (=> (not res!36135) (not e!28374))))

(assert (=> d!12292 (= res!36135 (= (size!985 (buf!1316 thiss!1379)) (size!985 (buf!1316 (_2!2174 lt!63778)))))))

(assert (=> d!12292 (= (isPrefixOf!0 thiss!1379 (_2!2174 lt!63778)) e!28374)))

(declare-fun b!42485 () Bool)

(declare-fun res!36134 () Bool)

(assert (=> b!42485 (=> (not res!36134) (not e!28374))))

(assert (=> b!42485 (= res!36134 (bvsle (bitIndex!0 (size!985 (buf!1316 thiss!1379)) (currentByte!2774 thiss!1379) (currentBit!2769 thiss!1379)) (bitIndex!0 (size!985 (buf!1316 (_2!2174 lt!63778))) (currentByte!2774 (_2!2174 lt!63778)) (currentBit!2769 (_2!2174 lt!63778)))))))

(declare-fun b!42486 () Bool)

(declare-fun e!28373 () Bool)

(assert (=> b!42486 (= e!28374 e!28373)))

(declare-fun res!36133 () Bool)

(assert (=> b!42486 (=> res!36133 e!28373)))

(assert (=> b!42486 (= res!36133 (= (size!985 (buf!1316 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!42487 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2177 array!2177 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!42487 (= e!28373 (arrayBitRangesEq!0 (buf!1316 thiss!1379) (buf!1316 (_2!2174 lt!63778)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!985 (buf!1316 thiss!1379)) (currentByte!2774 thiss!1379) (currentBit!2769 thiss!1379))))))

(assert (= (and d!12292 res!36135) b!42485))

(assert (= (and b!42485 res!36134) b!42486))

(assert (= (and b!42486 (not res!36133)) b!42487))

(assert (=> b!42485 m!64381))

(declare-fun m!64467 () Bool)

(assert (=> b!42485 m!64467))

(assert (=> b!42487 m!64381))

(assert (=> b!42487 m!64381))

(declare-fun m!64469 () Bool)

(assert (=> b!42487 m!64469))

(assert (=> b!42432 d!12292))

(declare-fun d!12302 () Bool)

(assert (=> d!12302 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!985 (buf!1316 (_2!2174 lt!63778)))) ((_ sign_extend 32) (currentByte!2774 (_2!2174 lt!63778))) ((_ sign_extend 32) (currentBit!2769 (_2!2174 lt!63778))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!985 (buf!1316 (_2!2174 lt!63778)))) ((_ sign_extend 32) (currentByte!2774 (_2!2174 lt!63778))) ((_ sign_extend 32) (currentBit!2769 (_2!2174 lt!63778)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!3320 () Bool)

(assert (= bs!3320 d!12302))

(declare-fun m!64471 () Bool)

(assert (=> bs!3320 m!64471))

(assert (=> b!42432 d!12302))

(declare-fun d!12304 () Bool)

(declare-fun e!28383 () Bool)

(assert (=> d!12304 e!28383))

(declare-fun res!36147 () Bool)

(assert (=> d!12304 (=> (not res!36147) (not e!28383))))

(assert (=> d!12304 (= res!36147 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!63832 () Unit!3024)

(declare-fun choose!27 (BitStream!1714 BitStream!1714 (_ BitVec 64) (_ BitVec 64)) Unit!3024)

(assert (=> d!12304 (= lt!63832 (choose!27 thiss!1379 (_2!2174 lt!63778) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!12304 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!12304 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2174 lt!63778) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!63832)))

(declare-fun b!42499 () Bool)

(assert (=> b!42499 (= e!28383 (validate_offset_bits!1 ((_ sign_extend 32) (size!985 (buf!1316 (_2!2174 lt!63778)))) ((_ sign_extend 32) (currentByte!2774 (_2!2174 lt!63778))) ((_ sign_extend 32) (currentBit!2769 (_2!2174 lt!63778))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!12304 res!36147) b!42499))

(declare-fun m!64475 () Bool)

(assert (=> d!12304 m!64475))

(assert (=> b!42499 m!64391))

(assert (=> b!42432 d!12304))

(declare-fun b!42559 () Bool)

(declare-fun e!28415 () Bool)

(declare-datatypes ((tuple2!4172 0))(
  ( (tuple2!4173 (_1!2179 BitStream!1714) (_2!2179 Bool)) )
))
(declare-fun lt!63930 () tuple2!4172)

(declare-fun lt!63926 () tuple2!4162)

(assert (=> b!42559 (= e!28415 (= (bitIndex!0 (size!985 (buf!1316 (_1!2179 lt!63930))) (currentByte!2774 (_1!2179 lt!63930)) (currentBit!2769 (_1!2179 lt!63930))) (bitIndex!0 (size!985 (buf!1316 (_2!2174 lt!63926))) (currentByte!2774 (_2!2174 lt!63926)) (currentBit!2769 (_2!2174 lt!63926)))))))

(declare-fun b!42560 () Bool)

(declare-fun res!36208 () Bool)

(declare-fun e!28414 () Bool)

(assert (=> b!42560 (=> (not res!36208) (not e!28414))))

(declare-fun lt!63933 () tuple2!4162)

(assert (=> b!42560 (= res!36208 (isPrefixOf!0 thiss!1379 (_2!2174 lt!63933)))))

(declare-fun b!42561 () Bool)

(declare-fun e!28417 () Bool)

(assert (=> b!42561 (= e!28417 e!28415)))

(declare-fun res!36205 () Bool)

(assert (=> b!42561 (=> (not res!36205) (not e!28415))))

(declare-fun lt!63925 () Bool)

(assert (=> b!42561 (= res!36205 (and (= (_2!2179 lt!63930) lt!63925) (= (_1!2179 lt!63930) (_2!2174 lt!63926))))))

(declare-fun readBitPure!0 (BitStream!1714) tuple2!4172)

(declare-fun readerFrom!0 (BitStream!1714 (_ BitVec 32) (_ BitVec 32)) BitStream!1714)

(assert (=> b!42561 (= lt!63930 (readBitPure!0 (readerFrom!0 (_2!2174 lt!63926) (currentBit!2769 thiss!1379) (currentByte!2774 thiss!1379))))))

(declare-fun b!42562 () Bool)

(declare-fun res!36204 () Bool)

(assert (=> b!42562 (=> (not res!36204) (not e!28414))))

(declare-fun lt!63927 () (_ BitVec 64))

(declare-fun lt!63931 () (_ BitVec 64))

(assert (=> b!42562 (= res!36204 (= (bitIndex!0 (size!985 (buf!1316 (_2!2174 lt!63933))) (currentByte!2774 (_2!2174 lt!63933)) (currentBit!2769 (_2!2174 lt!63933))) (bvadd lt!63931 lt!63927)))))

(assert (=> b!42562 (or (not (= (bvand lt!63931 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!63927 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!63931 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!63931 lt!63927) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!42562 (= lt!63927 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!42562 (= lt!63931 (bitIndex!0 (size!985 (buf!1316 thiss!1379)) (currentByte!2774 thiss!1379) (currentBit!2769 thiss!1379)))))

(declare-fun b!42563 () Bool)

(declare-fun e!28416 () Bool)

(declare-fun lt!63928 () tuple2!4172)

(assert (=> b!42563 (= e!28416 (= (bitIndex!0 (size!985 (buf!1316 (_1!2179 lt!63928))) (currentByte!2774 (_1!2179 lt!63928)) (currentBit!2769 (_1!2179 lt!63928))) (bitIndex!0 (size!985 (buf!1316 (_2!2174 lt!63933))) (currentByte!2774 (_2!2174 lt!63933)) (currentBit!2769 (_2!2174 lt!63933)))))))

(declare-fun d!12310 () Bool)

(assert (=> d!12310 e!28414))

(declare-fun res!36207 () Bool)

(assert (=> d!12310 (=> (not res!36207) (not e!28414))))

(assert (=> d!12310 (= res!36207 (= (size!985 (buf!1316 (_2!2174 lt!63933))) (size!985 (buf!1316 thiss!1379))))))

(declare-fun lt!63934 () (_ BitVec 8))

(declare-fun lt!63932 () array!2177)

(assert (=> d!12310 (= lt!63934 (select (arr!1484 lt!63932) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!12310 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!985 lt!63932)))))

(assert (=> d!12310 (= lt!63932 (array!2178 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!63935 () tuple2!4162)

(assert (=> d!12310 (= lt!63933 (tuple2!4163 (_1!2174 lt!63935) (_2!2174 lt!63935)))))

(assert (=> d!12310 (= lt!63935 lt!63926)))

(assert (=> d!12310 e!28417))

(declare-fun res!36211 () Bool)

(assert (=> d!12310 (=> (not res!36211) (not e!28417))))

(assert (=> d!12310 (= res!36211 (= (size!985 (buf!1316 thiss!1379)) (size!985 (buf!1316 (_2!2174 lt!63926)))))))

(declare-fun appendBit!0 (BitStream!1714 Bool) tuple2!4162)

(assert (=> d!12310 (= lt!63926 (appendBit!0 thiss!1379 lt!63925))))

(assert (=> d!12310 (= lt!63925 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1484 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!12310 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!12310 (= (appendBitFromByte!0 thiss!1379 (select (arr!1484 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!63933)))

(declare-fun b!42564 () Bool)

(declare-fun res!36206 () Bool)

(assert (=> b!42564 (=> (not res!36206) (not e!28417))))

(assert (=> b!42564 (= res!36206 (isPrefixOf!0 thiss!1379 (_2!2174 lt!63926)))))

(declare-fun b!42565 () Bool)

(declare-fun res!36209 () Bool)

(assert (=> b!42565 (=> (not res!36209) (not e!28417))))

(assert (=> b!42565 (= res!36209 (= (bitIndex!0 (size!985 (buf!1316 (_2!2174 lt!63926))) (currentByte!2774 (_2!2174 lt!63926)) (currentBit!2769 (_2!2174 lt!63926))) (bvadd (bitIndex!0 (size!985 (buf!1316 thiss!1379)) (currentByte!2774 thiss!1379) (currentBit!2769 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!42566 () Bool)

(assert (=> b!42566 (= e!28414 e!28416)))

(declare-fun res!36210 () Bool)

(assert (=> b!42566 (=> (not res!36210) (not e!28416))))

(assert (=> b!42566 (= res!36210 (and (= (_2!2179 lt!63928) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1484 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!63934)) #b00000000000000000000000000000000))) (= (_1!2179 lt!63928) (_2!2174 lt!63933))))))

(declare-datatypes ((tuple2!4174 0))(
  ( (tuple2!4175 (_1!2180 array!2177) (_2!2180 BitStream!1714)) )
))
(declare-fun lt!63929 () tuple2!4174)

(declare-fun lt!63936 () BitStream!1714)

(declare-fun readBits!0 (BitStream!1714 (_ BitVec 64)) tuple2!4174)

(assert (=> b!42566 (= lt!63929 (readBits!0 lt!63936 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!42566 (= lt!63928 (readBitPure!0 lt!63936))))

(assert (=> b!42566 (= lt!63936 (readerFrom!0 (_2!2174 lt!63933) (currentBit!2769 thiss!1379) (currentByte!2774 thiss!1379)))))

(assert (= (and d!12310 res!36211) b!42565))

(assert (= (and b!42565 res!36209) b!42564))

(assert (= (and b!42564 res!36206) b!42561))

(assert (= (and b!42561 res!36205) b!42559))

(assert (= (and d!12310 res!36207) b!42562))

(assert (= (and b!42562 res!36204) b!42560))

(assert (= (and b!42560 res!36208) b!42566))

(assert (= (and b!42566 res!36210) b!42563))

(declare-fun m!64519 () Bool)

(assert (=> b!42564 m!64519))

(declare-fun m!64521 () Bool)

(assert (=> b!42559 m!64521))

(declare-fun m!64523 () Bool)

(assert (=> b!42559 m!64523))

(declare-fun m!64525 () Bool)

(assert (=> b!42562 m!64525))

(assert (=> b!42562 m!64381))

(assert (=> b!42565 m!64523))

(assert (=> b!42565 m!64381))

(declare-fun m!64527 () Bool)

(assert (=> b!42566 m!64527))

(declare-fun m!64529 () Bool)

(assert (=> b!42566 m!64529))

(declare-fun m!64531 () Bool)

(assert (=> b!42566 m!64531))

(declare-fun m!64533 () Bool)

(assert (=> b!42563 m!64533))

(assert (=> b!42563 m!64525))

(declare-fun m!64535 () Bool)

(assert (=> d!12310 m!64535))

(declare-fun m!64537 () Bool)

(assert (=> d!12310 m!64537))

(declare-fun m!64539 () Bool)

(assert (=> d!12310 m!64539))

(declare-fun m!64541 () Bool)

(assert (=> b!42560 m!64541))

(declare-fun m!64543 () Bool)

(assert (=> b!42561 m!64543))

(assert (=> b!42561 m!64543))

(declare-fun m!64545 () Bool)

(assert (=> b!42561 m!64545))

(assert (=> b!42432 d!12310))

(declare-fun d!12330 () Bool)

(declare-fun res!36226 () Bool)

(declare-fun e!28425 () Bool)

(assert (=> d!12330 (=> (not res!36226) (not e!28425))))

(assert (=> d!12330 (= res!36226 (= (size!985 (buf!1316 thiss!1379)) (size!985 (buf!1316 thiss!1379))))))

(assert (=> d!12330 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!28425)))

(declare-fun b!42579 () Bool)

(declare-fun res!36225 () Bool)

(assert (=> b!42579 (=> (not res!36225) (not e!28425))))

(assert (=> b!42579 (= res!36225 (bvsle (bitIndex!0 (size!985 (buf!1316 thiss!1379)) (currentByte!2774 thiss!1379) (currentBit!2769 thiss!1379)) (bitIndex!0 (size!985 (buf!1316 thiss!1379)) (currentByte!2774 thiss!1379) (currentBit!2769 thiss!1379))))))

(declare-fun b!42580 () Bool)

(declare-fun e!28424 () Bool)

(assert (=> b!42580 (= e!28425 e!28424)))

(declare-fun res!36224 () Bool)

(assert (=> b!42580 (=> res!36224 e!28424)))

(assert (=> b!42580 (= res!36224 (= (size!985 (buf!1316 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!42581 () Bool)

(assert (=> b!42581 (= e!28424 (arrayBitRangesEq!0 (buf!1316 thiss!1379) (buf!1316 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!985 (buf!1316 thiss!1379)) (currentByte!2774 thiss!1379) (currentBit!2769 thiss!1379))))))

(assert (= (and d!12330 res!36226) b!42579))

(assert (= (and b!42579 res!36225) b!42580))

(assert (= (and b!42580 (not res!36224)) b!42581))

(assert (=> b!42579 m!64381))

(assert (=> b!42579 m!64381))

(assert (=> b!42581 m!64381))

(assert (=> b!42581 m!64381))

(declare-fun m!64547 () Bool)

(assert (=> b!42581 m!64547))

(assert (=> b!42431 d!12330))

(declare-fun d!12332 () Bool)

(assert (=> d!12332 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!63955 () Unit!3024)

(declare-fun choose!11 (BitStream!1714) Unit!3024)

(assert (=> d!12332 (= lt!63955 (choose!11 thiss!1379))))

(assert (=> d!12332 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!63955)))

(declare-fun bs!3327 () Bool)

(assert (= bs!3327 d!12332))

(assert (=> bs!3327 m!64377))

(declare-fun m!64549 () Bool)

(assert (=> bs!3327 m!64549))

(assert (=> b!42431 d!12332))

(declare-fun d!12334 () Bool)

(declare-fun e!28432 () Bool)

(assert (=> d!12334 e!28432))

(declare-fun res!36240 () Bool)

(assert (=> d!12334 (=> (not res!36240) (not e!28432))))

(declare-fun lt!63982 () (_ BitVec 64))

(declare-fun lt!63980 () (_ BitVec 64))

(declare-fun lt!63984 () (_ BitVec 64))

(assert (=> d!12334 (= res!36240 (= lt!63980 (bvsub lt!63984 lt!63982)))))

(assert (=> d!12334 (or (= (bvand lt!63984 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!63982 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!63984 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!63984 lt!63982) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!12334 (= lt!63982 (remainingBits!0 ((_ sign_extend 32) (size!985 (buf!1316 thiss!1379))) ((_ sign_extend 32) (currentByte!2774 thiss!1379)) ((_ sign_extend 32) (currentBit!2769 thiss!1379))))))

(declare-fun lt!63981 () (_ BitVec 64))

(declare-fun lt!63985 () (_ BitVec 64))

(assert (=> d!12334 (= lt!63984 (bvmul lt!63981 lt!63985))))

(assert (=> d!12334 (or (= lt!63981 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!63985 (bvsdiv (bvmul lt!63981 lt!63985) lt!63981)))))

(assert (=> d!12334 (= lt!63985 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!12334 (= lt!63981 ((_ sign_extend 32) (size!985 (buf!1316 thiss!1379))))))

(assert (=> d!12334 (= lt!63980 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2774 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2769 thiss!1379))))))

(assert (=> d!12334 (invariant!0 (currentBit!2769 thiss!1379) (currentByte!2774 thiss!1379) (size!985 (buf!1316 thiss!1379)))))

(assert (=> d!12334 (= (bitIndex!0 (size!985 (buf!1316 thiss!1379)) (currentByte!2774 thiss!1379) (currentBit!2769 thiss!1379)) lt!63980)))

(declare-fun b!42594 () Bool)

(declare-fun res!36239 () Bool)

(assert (=> b!42594 (=> (not res!36239) (not e!28432))))

(assert (=> b!42594 (= res!36239 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!63980))))

(declare-fun b!42595 () Bool)

(declare-fun lt!63983 () (_ BitVec 64))

(assert (=> b!42595 (= e!28432 (bvsle lt!63980 (bvmul lt!63983 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!42595 (or (= lt!63983 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!63983 #b0000000000000000000000000000000000000000000000000000000000001000) lt!63983)))))

(assert (=> b!42595 (= lt!63983 ((_ sign_extend 32) (size!985 (buf!1316 thiss!1379))))))

(assert (= (and d!12334 res!36240) b!42594))

(assert (= (and b!42594 res!36239) b!42595))

(assert (=> d!12334 m!64455))

(assert (=> d!12334 m!64457))

(assert (=> b!42431 d!12334))

(push 1)

(assert (not b!42561))

(assert (not b!42565))

(assert (not d!12310))

(assert (not d!12304))

(assert (not b!42564))

(assert (not b!42559))

(assert (not d!12332))

(assert (not b!42499))

(assert (not b!42562))

(assert (not d!12284))

(assert (not b!42581))

(assert (not b!42485))

(assert (not d!12334))

(assert (not b!42487))

(assert (not d!12302))

(assert (not b!42566))

(assert (not d!12288))

(assert (not b!42560))

(assert (not b!42563))

(assert (not b!42579))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

