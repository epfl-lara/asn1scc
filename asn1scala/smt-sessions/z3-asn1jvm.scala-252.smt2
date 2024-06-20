; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4872 () Bool)

(assert start!4872)

(declare-fun b!19354 () Bool)

(declare-fun e!12858 () Bool)

(declare-datatypes ((array!1396 0))(
  ( (array!1397 (arr!1034 (Array (_ BitVec 32) (_ BitVec 8))) (size!593 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1020 0))(
  ( (BitStream!1021 (buf!893 array!1396) (currentByte!2173 (_ BitVec 32)) (currentBit!2168 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1020)

(declare-fun array_inv!563 (array!1396) Bool)

(assert (=> b!19354 (= e!12858 (array_inv!563 (buf!893 thiss!1379)))))

(declare-fun res!16907 () Bool)

(declare-fun e!12855 () Bool)

(assert (=> start!4872 (=> (not res!16907) (not e!12855))))

(declare-fun srcBuffer!2 () array!1396)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!4872 (= res!16907 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!593 srcBuffer!2))))))))

(assert (=> start!4872 e!12855))

(assert (=> start!4872 true))

(assert (=> start!4872 (array_inv!563 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1020) Bool)

(assert (=> start!4872 (and (inv!12 thiss!1379) e!12858)))

(declare-fun b!19355 () Bool)

(declare-fun e!12854 () Bool)

(declare-datatypes ((tuple2!2220 0))(
  ( (tuple2!2221 (_1!1195 BitStream!1020) (_2!1195 BitStream!1020)) )
))
(declare-fun lt!27432 () tuple2!2220)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!19355 (= e!12854 (validate_offset_bits!1 ((_ sign_extend 32) (size!593 (buf!893 (_1!1195 lt!27432)))) ((_ sign_extend 32) (currentByte!2173 (_1!1195 lt!27432))) ((_ sign_extend 32) (currentBit!2168 (_1!1195 lt!27432))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!1730 0))(
  ( (Unit!1731) )
))
(declare-datatypes ((tuple2!2222 0))(
  ( (tuple2!2223 (_1!1196 Unit!1730) (_2!1196 BitStream!1020)) )
))
(declare-fun lt!27431 () tuple2!2222)

(assert (=> b!19355 (validate_offset_bits!1 ((_ sign_extend 32) (size!593 (buf!893 (_2!1196 lt!27431)))) ((_ sign_extend 32) (currentByte!2173 thiss!1379)) ((_ sign_extend 32) (currentBit!2168 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!27436 () Unit!1730)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1020 array!1396 (_ BitVec 64)) Unit!1730)

(assert (=> b!19355 (= lt!27436 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!893 (_2!1196 lt!27431)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1020 BitStream!1020) tuple2!2220)

(assert (=> b!19355 (= lt!27432 (reader!0 thiss!1379 (_2!1196 lt!27431)))))

(declare-fun b!19356 () Bool)

(declare-fun e!12856 () Bool)

(assert (=> b!19356 (= e!12855 (not e!12856))))

(declare-fun res!16904 () Bool)

(assert (=> b!19356 (=> res!16904 e!12856)))

(assert (=> b!19356 (= res!16904 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1020 BitStream!1020) Bool)

(assert (=> b!19356 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!27434 () Unit!1730)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1020) Unit!1730)

(assert (=> b!19356 (= lt!27434 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!27435 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!19356 (= lt!27435 (bitIndex!0 (size!593 (buf!893 thiss!1379)) (currentByte!2173 thiss!1379) (currentBit!2168 thiss!1379)))))

(declare-fun b!19357 () Bool)

(assert (=> b!19357 (= e!12856 e!12854)))

(declare-fun res!16905 () Bool)

(assert (=> b!19357 (=> res!16905 e!12854)))

(assert (=> b!19357 (= res!16905 (not (isPrefixOf!0 thiss!1379 (_2!1196 lt!27431))))))

(assert (=> b!19357 (validate_offset_bits!1 ((_ sign_extend 32) (size!593 (buf!893 (_2!1196 lt!27431)))) ((_ sign_extend 32) (currentByte!2173 (_2!1196 lt!27431))) ((_ sign_extend 32) (currentBit!2168 (_2!1196 lt!27431))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!27433 () Unit!1730)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1020 BitStream!1020 (_ BitVec 64) (_ BitVec 64)) Unit!1730)

(assert (=> b!19357 (= lt!27433 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1196 lt!27431) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1020 (_ BitVec 8) (_ BitVec 32)) tuple2!2222)

(assert (=> b!19357 (= lt!27431 (appendBitFromByte!0 thiss!1379 (select (arr!1034 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!19358 () Bool)

(declare-fun res!16906 () Bool)

(assert (=> b!19358 (=> (not res!16906) (not e!12855))))

(assert (=> b!19358 (= res!16906 (validate_offset_bits!1 ((_ sign_extend 32) (size!593 (buf!893 thiss!1379))) ((_ sign_extend 32) (currentByte!2173 thiss!1379)) ((_ sign_extend 32) (currentBit!2168 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!4872 res!16907) b!19358))

(assert (= (and b!19358 res!16906) b!19356))

(assert (= (and b!19356 (not res!16904)) b!19357))

(assert (= (and b!19357 (not res!16905)) b!19355))

(assert (= start!4872 b!19354))

(declare-fun m!26063 () Bool)

(assert (=> b!19358 m!26063))

(declare-fun m!26065 () Bool)

(assert (=> b!19355 m!26065))

(declare-fun m!26067 () Bool)

(assert (=> b!19355 m!26067))

(declare-fun m!26069 () Bool)

(assert (=> b!19355 m!26069))

(declare-fun m!26071 () Bool)

(assert (=> b!19355 m!26071))

(declare-fun m!26073 () Bool)

(assert (=> b!19356 m!26073))

(declare-fun m!26075 () Bool)

(assert (=> b!19356 m!26075))

(declare-fun m!26077 () Bool)

(assert (=> b!19356 m!26077))

(declare-fun m!26079 () Bool)

(assert (=> b!19357 m!26079))

(declare-fun m!26081 () Bool)

(assert (=> b!19357 m!26081))

(declare-fun m!26083 () Bool)

(assert (=> b!19357 m!26083))

(declare-fun m!26085 () Bool)

(assert (=> b!19357 m!26085))

(declare-fun m!26087 () Bool)

(assert (=> b!19357 m!26087))

(assert (=> b!19357 m!26081))

(declare-fun m!26089 () Bool)

(assert (=> start!4872 m!26089))

(declare-fun m!26091 () Bool)

(assert (=> start!4872 m!26091))

(declare-fun m!26093 () Bool)

(assert (=> b!19354 m!26093))

(check-sat (not start!4872) (not b!19355) (not b!19354) (not b!19356) (not b!19357) (not b!19358))
(check-sat)
(get-model)

(declare-fun d!6332 () Bool)

(declare-fun res!16928 () Bool)

(declare-fun e!12881 () Bool)

(assert (=> d!6332 (=> (not res!16928) (not e!12881))))

(assert (=> d!6332 (= res!16928 (= (size!593 (buf!893 thiss!1379)) (size!593 (buf!893 (_2!1196 lt!27431)))))))

(assert (=> d!6332 (= (isPrefixOf!0 thiss!1379 (_2!1196 lt!27431)) e!12881)))

(declare-fun b!19380 () Bool)

(declare-fun res!16927 () Bool)

(assert (=> b!19380 (=> (not res!16927) (not e!12881))))

(assert (=> b!19380 (= res!16927 (bvsle (bitIndex!0 (size!593 (buf!893 thiss!1379)) (currentByte!2173 thiss!1379) (currentBit!2168 thiss!1379)) (bitIndex!0 (size!593 (buf!893 (_2!1196 lt!27431))) (currentByte!2173 (_2!1196 lt!27431)) (currentBit!2168 (_2!1196 lt!27431)))))))

(declare-fun b!19381 () Bool)

(declare-fun e!12882 () Bool)

(assert (=> b!19381 (= e!12881 e!12882)))

(declare-fun res!16926 () Bool)

(assert (=> b!19381 (=> res!16926 e!12882)))

(assert (=> b!19381 (= res!16926 (= (size!593 (buf!893 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!19382 () Bool)

(declare-fun arrayBitRangesEq!0 (array!1396 array!1396 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!19382 (= e!12882 (arrayBitRangesEq!0 (buf!893 thiss!1379) (buf!893 (_2!1196 lt!27431)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!593 (buf!893 thiss!1379)) (currentByte!2173 thiss!1379) (currentBit!2168 thiss!1379))))))

(assert (= (and d!6332 res!16928) b!19380))

(assert (= (and b!19380 res!16927) b!19381))

(assert (= (and b!19381 (not res!16926)) b!19382))

(assert (=> b!19380 m!26077))

(declare-fun m!26127 () Bool)

(assert (=> b!19380 m!26127))

(assert (=> b!19382 m!26077))

(assert (=> b!19382 m!26077))

(declare-fun m!26129 () Bool)

(assert (=> b!19382 m!26129))

(assert (=> b!19357 d!6332))

(declare-fun d!6334 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!6334 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!593 (buf!893 (_2!1196 lt!27431)))) ((_ sign_extend 32) (currentByte!2173 (_2!1196 lt!27431))) ((_ sign_extend 32) (currentBit!2168 (_2!1196 lt!27431))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!593 (buf!893 (_2!1196 lt!27431)))) ((_ sign_extend 32) (currentByte!2173 (_2!1196 lt!27431))) ((_ sign_extend 32) (currentBit!2168 (_2!1196 lt!27431)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!1856 () Bool)

(assert (= bs!1856 d!6334))

(declare-fun m!26131 () Bool)

(assert (=> bs!1856 m!26131))

(assert (=> b!19357 d!6334))

(declare-fun d!6336 () Bool)

(declare-fun e!12885 () Bool)

(assert (=> d!6336 e!12885))

(declare-fun res!16931 () Bool)

(assert (=> d!6336 (=> (not res!16931) (not e!12885))))

(assert (=> d!6336 (= res!16931 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!27457 () Unit!1730)

(declare-fun choose!27 (BitStream!1020 BitStream!1020 (_ BitVec 64) (_ BitVec 64)) Unit!1730)

(assert (=> d!6336 (= lt!27457 (choose!27 thiss!1379 (_2!1196 lt!27431) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!6336 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!6336 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1196 lt!27431) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!27457)))

(declare-fun b!19385 () Bool)

(assert (=> b!19385 (= e!12885 (validate_offset_bits!1 ((_ sign_extend 32) (size!593 (buf!893 (_2!1196 lt!27431)))) ((_ sign_extend 32) (currentByte!2173 (_2!1196 lt!27431))) ((_ sign_extend 32) (currentBit!2168 (_2!1196 lt!27431))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!6336 res!16931) b!19385))

(declare-fun m!26133 () Bool)

(assert (=> d!6336 m!26133))

(assert (=> b!19385 m!26087))

(assert (=> b!19357 d!6336))

(declare-fun b!19461 () Bool)

(declare-fun e!12930 () Bool)

(declare-fun e!12929 () Bool)

(assert (=> b!19461 (= e!12930 e!12929)))

(declare-fun res!16999 () Bool)

(assert (=> b!19461 (=> (not res!16999) (not e!12929))))

(declare-fun lt!27587 () tuple2!2222)

(declare-fun lt!27597 () (_ BitVec 8))

(declare-datatypes ((tuple2!2228 0))(
  ( (tuple2!2229 (_1!1199 BitStream!1020) (_2!1199 Bool)) )
))
(declare-fun lt!27586 () tuple2!2228)

(assert (=> b!19461 (= res!16999 (and (= (_2!1199 lt!27586) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1034 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!27597)) #b00000000000000000000000000000000))) (= (_1!1199 lt!27586) (_2!1196 lt!27587))))))

(declare-datatypes ((tuple2!2230 0))(
  ( (tuple2!2231 (_1!1200 array!1396) (_2!1200 BitStream!1020)) )
))
(declare-fun lt!27589 () tuple2!2230)

(declare-fun lt!27593 () BitStream!1020)

(declare-fun readBits!0 (BitStream!1020 (_ BitVec 64)) tuple2!2230)

(assert (=> b!19461 (= lt!27589 (readBits!0 lt!27593 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!1020) tuple2!2228)

(assert (=> b!19461 (= lt!27586 (readBitPure!0 lt!27593))))

(declare-fun readerFrom!0 (BitStream!1020 (_ BitVec 32) (_ BitVec 32)) BitStream!1020)

(assert (=> b!19461 (= lt!27593 (readerFrom!0 (_2!1196 lt!27587) (currentBit!2168 thiss!1379) (currentByte!2173 thiss!1379)))))

(declare-fun b!19462 () Bool)

(assert (=> b!19462 (= e!12929 (= (bitIndex!0 (size!593 (buf!893 (_1!1199 lt!27586))) (currentByte!2173 (_1!1199 lt!27586)) (currentBit!2168 (_1!1199 lt!27586))) (bitIndex!0 (size!593 (buf!893 (_2!1196 lt!27587))) (currentByte!2173 (_2!1196 lt!27587)) (currentBit!2168 (_2!1196 lt!27587)))))))

(declare-fun b!19463 () Bool)

(declare-fun e!12928 () Bool)

(declare-fun lt!27596 () tuple2!2228)

(declare-fun lt!27595 () tuple2!2222)

(assert (=> b!19463 (= e!12928 (= (bitIndex!0 (size!593 (buf!893 (_1!1199 lt!27596))) (currentByte!2173 (_1!1199 lt!27596)) (currentBit!2168 (_1!1199 lt!27596))) (bitIndex!0 (size!593 (buf!893 (_2!1196 lt!27595))) (currentByte!2173 (_2!1196 lt!27595)) (currentBit!2168 (_2!1196 lt!27595)))))))

(declare-fun b!19464 () Bool)

(declare-fun res!17004 () Bool)

(declare-fun e!12927 () Bool)

(assert (=> b!19464 (=> (not res!17004) (not e!12927))))

(assert (=> b!19464 (= res!17004 (isPrefixOf!0 thiss!1379 (_2!1196 lt!27595)))))

(declare-fun b!19465 () Bool)

(declare-fun res!17001 () Bool)

(assert (=> b!19465 (=> (not res!17001) (not e!12927))))

(assert (=> b!19465 (= res!17001 (= (bitIndex!0 (size!593 (buf!893 (_2!1196 lt!27595))) (currentByte!2173 (_2!1196 lt!27595)) (currentBit!2168 (_2!1196 lt!27595))) (bvadd (bitIndex!0 (size!593 (buf!893 thiss!1379)) (currentByte!2173 thiss!1379) (currentBit!2168 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!19460 () Bool)

(declare-fun res!17005 () Bool)

(assert (=> b!19460 (=> (not res!17005) (not e!12930))))

(assert (=> b!19460 (= res!17005 (isPrefixOf!0 thiss!1379 (_2!1196 lt!27587)))))

(declare-fun d!6338 () Bool)

(assert (=> d!6338 e!12930))

(declare-fun res!17003 () Bool)

(assert (=> d!6338 (=> (not res!17003) (not e!12930))))

(assert (=> d!6338 (= res!17003 (= (size!593 (buf!893 (_2!1196 lt!27587))) (size!593 (buf!893 thiss!1379))))))

(declare-fun lt!27590 () array!1396)

(assert (=> d!6338 (= lt!27597 (select (arr!1034 lt!27590) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!6338 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!593 lt!27590)))))

(assert (=> d!6338 (= lt!27590 (array!1397 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!27588 () tuple2!2222)

(assert (=> d!6338 (= lt!27587 (tuple2!2223 (_1!1196 lt!27588) (_2!1196 lt!27588)))))

(assert (=> d!6338 (= lt!27588 lt!27595)))

(assert (=> d!6338 e!12927))

(declare-fun res!17002 () Bool)

(assert (=> d!6338 (=> (not res!17002) (not e!12927))))

(assert (=> d!6338 (= res!17002 (= (size!593 (buf!893 thiss!1379)) (size!593 (buf!893 (_2!1196 lt!27595)))))))

(declare-fun lt!27594 () Bool)

(declare-fun appendBit!0 (BitStream!1020 Bool) tuple2!2222)

(assert (=> d!6338 (= lt!27595 (appendBit!0 thiss!1379 lt!27594))))

(assert (=> d!6338 (= lt!27594 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1034 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!6338 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!6338 (= (appendBitFromByte!0 thiss!1379 (select (arr!1034 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!27587)))

(declare-fun b!19466 () Bool)

(assert (=> b!19466 (= e!12927 e!12928)))

(declare-fun res!16998 () Bool)

(assert (=> b!19466 (=> (not res!16998) (not e!12928))))

(assert (=> b!19466 (= res!16998 (and (= (_2!1199 lt!27596) lt!27594) (= (_1!1199 lt!27596) (_2!1196 lt!27595))))))

(assert (=> b!19466 (= lt!27596 (readBitPure!0 (readerFrom!0 (_2!1196 lt!27595) (currentBit!2168 thiss!1379) (currentByte!2173 thiss!1379))))))

(declare-fun b!19467 () Bool)

(declare-fun res!17000 () Bool)

(assert (=> b!19467 (=> (not res!17000) (not e!12930))))

(declare-fun lt!27592 () (_ BitVec 64))

(declare-fun lt!27591 () (_ BitVec 64))

(assert (=> b!19467 (= res!17000 (= (bitIndex!0 (size!593 (buf!893 (_2!1196 lt!27587))) (currentByte!2173 (_2!1196 lt!27587)) (currentBit!2168 (_2!1196 lt!27587))) (bvadd lt!27591 lt!27592)))))

(assert (=> b!19467 (or (not (= (bvand lt!27591 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!27592 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!27591 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!27591 lt!27592) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!19467 (= lt!27592 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!19467 (= lt!27591 (bitIndex!0 (size!593 (buf!893 thiss!1379)) (currentByte!2173 thiss!1379) (currentBit!2168 thiss!1379)))))

(assert (= (and d!6338 res!17002) b!19465))

(assert (= (and b!19465 res!17001) b!19464))

(assert (= (and b!19464 res!17004) b!19466))

(assert (= (and b!19466 res!16998) b!19463))

(assert (= (and d!6338 res!17003) b!19467))

(assert (= (and b!19467 res!17000) b!19460))

(assert (= (and b!19460 res!17005) b!19461))

(assert (= (and b!19461 res!16999) b!19462))

(declare-fun m!26195 () Bool)

(assert (=> b!19465 m!26195))

(assert (=> b!19465 m!26077))

(declare-fun m!26197 () Bool)

(assert (=> b!19464 m!26197))

(declare-fun m!26199 () Bool)

(assert (=> b!19466 m!26199))

(assert (=> b!19466 m!26199))

(declare-fun m!26201 () Bool)

(assert (=> b!19466 m!26201))

(declare-fun m!26203 () Bool)

(assert (=> d!6338 m!26203))

(declare-fun m!26205 () Bool)

(assert (=> d!6338 m!26205))

(declare-fun m!26207 () Bool)

(assert (=> d!6338 m!26207))

(declare-fun m!26209 () Bool)

(assert (=> b!19461 m!26209))

(declare-fun m!26211 () Bool)

(assert (=> b!19461 m!26211))

(declare-fun m!26213 () Bool)

(assert (=> b!19461 m!26213))

(declare-fun m!26215 () Bool)

(assert (=> b!19467 m!26215))

(assert (=> b!19467 m!26077))

(declare-fun m!26217 () Bool)

(assert (=> b!19460 m!26217))

(declare-fun m!26219 () Bool)

(assert (=> b!19463 m!26219))

(assert (=> b!19463 m!26195))

(declare-fun m!26221 () Bool)

(assert (=> b!19462 m!26221))

(assert (=> b!19462 m!26215))

(assert (=> b!19357 d!6338))

(declare-fun d!6386 () Bool)

(declare-fun res!17016 () Bool)

(declare-fun e!12935 () Bool)

(assert (=> d!6386 (=> (not res!17016) (not e!12935))))

(assert (=> d!6386 (= res!17016 (= (size!593 (buf!893 thiss!1379)) (size!593 (buf!893 thiss!1379))))))

(assert (=> d!6386 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!12935)))

(declare-fun b!19476 () Bool)

(declare-fun res!17015 () Bool)

(assert (=> b!19476 (=> (not res!17015) (not e!12935))))

(assert (=> b!19476 (= res!17015 (bvsle (bitIndex!0 (size!593 (buf!893 thiss!1379)) (currentByte!2173 thiss!1379) (currentBit!2168 thiss!1379)) (bitIndex!0 (size!593 (buf!893 thiss!1379)) (currentByte!2173 thiss!1379) (currentBit!2168 thiss!1379))))))

(declare-fun b!19477 () Bool)

(declare-fun e!12936 () Bool)

(assert (=> b!19477 (= e!12935 e!12936)))

(declare-fun res!17014 () Bool)

(assert (=> b!19477 (=> res!17014 e!12936)))

(assert (=> b!19477 (= res!17014 (= (size!593 (buf!893 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!19478 () Bool)

(assert (=> b!19478 (= e!12936 (arrayBitRangesEq!0 (buf!893 thiss!1379) (buf!893 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!593 (buf!893 thiss!1379)) (currentByte!2173 thiss!1379) (currentBit!2168 thiss!1379))))))

(assert (= (and d!6386 res!17016) b!19476))

(assert (= (and b!19476 res!17015) b!19477))

(assert (= (and b!19477 (not res!17014)) b!19478))

(assert (=> b!19476 m!26077))

(assert (=> b!19476 m!26077))

(assert (=> b!19478 m!26077))

(assert (=> b!19478 m!26077))

(declare-fun m!26223 () Bool)

(assert (=> b!19478 m!26223))

(assert (=> b!19356 d!6386))

(declare-fun d!6388 () Bool)

(assert (=> d!6388 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!27622 () Unit!1730)

(declare-fun choose!11 (BitStream!1020) Unit!1730)

(assert (=> d!6388 (= lt!27622 (choose!11 thiss!1379))))

(assert (=> d!6388 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!27622)))

(declare-fun bs!1870 () Bool)

(assert (= bs!1870 d!6388))

(assert (=> bs!1870 m!26073))

(declare-fun m!26255 () Bool)

(assert (=> bs!1870 m!26255))

(assert (=> b!19356 d!6388))

(declare-fun d!6394 () Bool)

(declare-fun e!12943 () Bool)

(assert (=> d!6394 e!12943))

(declare-fun res!17029 () Bool)

(assert (=> d!6394 (=> (not res!17029) (not e!12943))))

(declare-fun lt!27639 () (_ BitVec 64))

(declare-fun lt!27643 () (_ BitVec 64))

(declare-fun lt!27642 () (_ BitVec 64))

(assert (=> d!6394 (= res!17029 (= lt!27643 (bvsub lt!27642 lt!27639)))))

(assert (=> d!6394 (or (= (bvand lt!27642 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!27639 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!27642 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!27642 lt!27639) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!6394 (= lt!27639 (remainingBits!0 ((_ sign_extend 32) (size!593 (buf!893 thiss!1379))) ((_ sign_extend 32) (currentByte!2173 thiss!1379)) ((_ sign_extend 32) (currentBit!2168 thiss!1379))))))

(declare-fun lt!27638 () (_ BitVec 64))

(declare-fun lt!27641 () (_ BitVec 64))

(assert (=> d!6394 (= lt!27642 (bvmul lt!27638 lt!27641))))

(assert (=> d!6394 (or (= lt!27638 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!27641 (bvsdiv (bvmul lt!27638 lt!27641) lt!27638)))))

(assert (=> d!6394 (= lt!27641 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!6394 (= lt!27638 ((_ sign_extend 32) (size!593 (buf!893 thiss!1379))))))

(assert (=> d!6394 (= lt!27643 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2173 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2168 thiss!1379))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!6394 (invariant!0 (currentBit!2168 thiss!1379) (currentByte!2173 thiss!1379) (size!593 (buf!893 thiss!1379)))))

(assert (=> d!6394 (= (bitIndex!0 (size!593 (buf!893 thiss!1379)) (currentByte!2173 thiss!1379) (currentBit!2168 thiss!1379)) lt!27643)))

(declare-fun b!19491 () Bool)

(declare-fun res!17030 () Bool)

(assert (=> b!19491 (=> (not res!17030) (not e!12943))))

(assert (=> b!19491 (= res!17030 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!27643))))

(declare-fun b!19492 () Bool)

(declare-fun lt!27640 () (_ BitVec 64))

(assert (=> b!19492 (= e!12943 (bvsle lt!27643 (bvmul lt!27640 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!19492 (or (= lt!27640 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!27640 #b0000000000000000000000000000000000000000000000000000000000001000) lt!27640)))))

(assert (=> b!19492 (= lt!27640 ((_ sign_extend 32) (size!593 (buf!893 thiss!1379))))))

(assert (= (and d!6394 res!17029) b!19491))

(assert (= (and b!19491 res!17030) b!19492))

(declare-fun m!26261 () Bool)

(assert (=> d!6394 m!26261))

(declare-fun m!26263 () Bool)

(assert (=> d!6394 m!26263))

(assert (=> b!19356 d!6394))

(declare-fun d!6400 () Bool)

(assert (=> d!6400 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!593 (buf!893 thiss!1379))) ((_ sign_extend 32) (currentByte!2173 thiss!1379)) ((_ sign_extend 32) (currentBit!2168 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!593 (buf!893 thiss!1379))) ((_ sign_extend 32) (currentByte!2173 thiss!1379)) ((_ sign_extend 32) (currentBit!2168 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!1873 () Bool)

(assert (= bs!1873 d!6400))

(assert (=> bs!1873 m!26261))

(assert (=> b!19358 d!6400))

(declare-fun d!6402 () Bool)

(assert (=> d!6402 (= (array_inv!563 (buf!893 thiss!1379)) (bvsge (size!593 (buf!893 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!19354 d!6402))

(declare-fun d!6404 () Bool)

(assert (=> d!6404 (= (array_inv!563 srcBuffer!2) (bvsge (size!593 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!4872 d!6404))

(declare-fun d!6406 () Bool)

(assert (=> d!6406 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2168 thiss!1379) (currentByte!2173 thiss!1379) (size!593 (buf!893 thiss!1379))))))

(declare-fun bs!1874 () Bool)

(assert (= bs!1874 d!6406))

(assert (=> bs!1874 m!26263))

(assert (=> start!4872 d!6406))

(declare-fun d!6408 () Bool)

(assert (=> d!6408 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!593 (buf!893 (_1!1195 lt!27432)))) ((_ sign_extend 32) (currentByte!2173 (_1!1195 lt!27432))) ((_ sign_extend 32) (currentBit!2168 (_1!1195 lt!27432))) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!593 (buf!893 (_1!1195 lt!27432)))) ((_ sign_extend 32) (currentByte!2173 (_1!1195 lt!27432))) ((_ sign_extend 32) (currentBit!2168 (_1!1195 lt!27432)))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!1875 () Bool)

(assert (= bs!1875 d!6408))

(declare-fun m!26265 () Bool)

(assert (=> bs!1875 m!26265))

(assert (=> b!19355 d!6408))

(declare-fun d!6410 () Bool)

(assert (=> d!6410 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!593 (buf!893 (_2!1196 lt!27431)))) ((_ sign_extend 32) (currentByte!2173 thiss!1379)) ((_ sign_extend 32) (currentBit!2168 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!593 (buf!893 (_2!1196 lt!27431)))) ((_ sign_extend 32) (currentByte!2173 thiss!1379)) ((_ sign_extend 32) (currentBit!2168 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!1876 () Bool)

(assert (= bs!1876 d!6410))

(declare-fun m!26267 () Bool)

(assert (=> bs!1876 m!26267))

(assert (=> b!19355 d!6410))

(declare-fun d!6412 () Bool)

(assert (=> d!6412 (validate_offset_bits!1 ((_ sign_extend 32) (size!593 (buf!893 (_2!1196 lt!27431)))) ((_ sign_extend 32) (currentByte!2173 thiss!1379)) ((_ sign_extend 32) (currentBit!2168 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!27646 () Unit!1730)

(declare-fun choose!9 (BitStream!1020 array!1396 (_ BitVec 64) BitStream!1020) Unit!1730)

(assert (=> d!6412 (= lt!27646 (choose!9 thiss!1379 (buf!893 (_2!1196 lt!27431)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1021 (buf!893 (_2!1196 lt!27431)) (currentByte!2173 thiss!1379) (currentBit!2168 thiss!1379))))))

(assert (=> d!6412 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!893 (_2!1196 lt!27431)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!27646)))

(declare-fun bs!1877 () Bool)

(assert (= bs!1877 d!6412))

(assert (=> bs!1877 m!26067))

(declare-fun m!26269 () Bool)

(assert (=> bs!1877 m!26269))

(assert (=> b!19355 d!6412))

(declare-fun d!6414 () Bool)

(declare-fun e!12962 () Bool)

(assert (=> d!6414 e!12962))

(declare-fun res!17063 () Bool)

(assert (=> d!6414 (=> (not res!17063) (not e!12962))))

(declare-fun lt!27786 () tuple2!2220)

(assert (=> d!6414 (= res!17063 (isPrefixOf!0 (_1!1195 lt!27786) (_2!1195 lt!27786)))))

(declare-fun lt!27788 () BitStream!1020)

(assert (=> d!6414 (= lt!27786 (tuple2!2221 lt!27788 (_2!1196 lt!27431)))))

(declare-fun lt!27776 () Unit!1730)

(declare-fun lt!27782 () Unit!1730)

(assert (=> d!6414 (= lt!27776 lt!27782)))

(assert (=> d!6414 (isPrefixOf!0 lt!27788 (_2!1196 lt!27431))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1020 BitStream!1020 BitStream!1020) Unit!1730)

(assert (=> d!6414 (= lt!27782 (lemmaIsPrefixTransitive!0 lt!27788 (_2!1196 lt!27431) (_2!1196 lt!27431)))))

(declare-fun lt!27781 () Unit!1730)

(declare-fun lt!27783 () Unit!1730)

(assert (=> d!6414 (= lt!27781 lt!27783)))

(assert (=> d!6414 (isPrefixOf!0 lt!27788 (_2!1196 lt!27431))))

(assert (=> d!6414 (= lt!27783 (lemmaIsPrefixTransitive!0 lt!27788 thiss!1379 (_2!1196 lt!27431)))))

(declare-fun lt!27771 () Unit!1730)

(declare-fun e!12963 () Unit!1730)

(assert (=> d!6414 (= lt!27771 e!12963)))

(declare-fun c!1396 () Bool)

(assert (=> d!6414 (= c!1396 (not (= (size!593 (buf!893 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!27773 () Unit!1730)

(declare-fun lt!27789 () Unit!1730)

(assert (=> d!6414 (= lt!27773 lt!27789)))

(assert (=> d!6414 (isPrefixOf!0 (_2!1196 lt!27431) (_2!1196 lt!27431))))

(assert (=> d!6414 (= lt!27789 (lemmaIsPrefixRefl!0 (_2!1196 lt!27431)))))

(declare-fun lt!27778 () Unit!1730)

(declare-fun lt!27780 () Unit!1730)

(assert (=> d!6414 (= lt!27778 lt!27780)))

(assert (=> d!6414 (= lt!27780 (lemmaIsPrefixRefl!0 (_2!1196 lt!27431)))))

(declare-fun lt!27785 () Unit!1730)

(declare-fun lt!27772 () Unit!1730)

(assert (=> d!6414 (= lt!27785 lt!27772)))

(assert (=> d!6414 (isPrefixOf!0 lt!27788 lt!27788)))

(assert (=> d!6414 (= lt!27772 (lemmaIsPrefixRefl!0 lt!27788))))

(declare-fun lt!27779 () Unit!1730)

(declare-fun lt!27777 () Unit!1730)

(assert (=> d!6414 (= lt!27779 lt!27777)))

(assert (=> d!6414 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!6414 (= lt!27777 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!6414 (= lt!27788 (BitStream!1021 (buf!893 (_2!1196 lt!27431)) (currentByte!2173 thiss!1379) (currentBit!2168 thiss!1379)))))

(assert (=> d!6414 (isPrefixOf!0 thiss!1379 (_2!1196 lt!27431))))

(assert (=> d!6414 (= (reader!0 thiss!1379 (_2!1196 lt!27431)) lt!27786)))

(declare-fun b!19535 () Bool)

(declare-fun Unit!1735 () Unit!1730)

(assert (=> b!19535 (= e!12963 Unit!1735)))

(declare-fun b!19536 () Bool)

(declare-fun lt!27774 () Unit!1730)

(assert (=> b!19536 (= e!12963 lt!27774)))

(declare-fun lt!27784 () (_ BitVec 64))

(assert (=> b!19536 (= lt!27784 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27787 () (_ BitVec 64))

(assert (=> b!19536 (= lt!27787 (bitIndex!0 (size!593 (buf!893 thiss!1379)) (currentByte!2173 thiss!1379) (currentBit!2168 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1396 array!1396 (_ BitVec 64) (_ BitVec 64)) Unit!1730)

(assert (=> b!19536 (= lt!27774 (arrayBitRangesEqSymmetric!0 (buf!893 thiss!1379) (buf!893 (_2!1196 lt!27431)) lt!27784 lt!27787))))

(assert (=> b!19536 (arrayBitRangesEq!0 (buf!893 (_2!1196 lt!27431)) (buf!893 thiss!1379) lt!27784 lt!27787)))

(declare-fun b!19537 () Bool)

(declare-fun res!17062 () Bool)

(assert (=> b!19537 (=> (not res!17062) (not e!12962))))

(assert (=> b!19537 (= res!17062 (isPrefixOf!0 (_1!1195 lt!27786) thiss!1379))))

(declare-fun lt!27790 () (_ BitVec 64))

(declare-fun lt!27775 () (_ BitVec 64))

(declare-fun b!19538 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!1020 (_ BitVec 64)) BitStream!1020)

(assert (=> b!19538 (= e!12962 (= (_1!1195 lt!27786) (withMovedBitIndex!0 (_2!1195 lt!27786) (bvsub lt!27790 lt!27775))))))

(assert (=> b!19538 (or (= (bvand lt!27790 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!27775 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!27790 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!27790 lt!27775) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!19538 (= lt!27775 (bitIndex!0 (size!593 (buf!893 (_2!1196 lt!27431))) (currentByte!2173 (_2!1196 lt!27431)) (currentBit!2168 (_2!1196 lt!27431))))))

(assert (=> b!19538 (= lt!27790 (bitIndex!0 (size!593 (buf!893 thiss!1379)) (currentByte!2173 thiss!1379) (currentBit!2168 thiss!1379)))))

(declare-fun b!19539 () Bool)

(declare-fun res!17064 () Bool)

(assert (=> b!19539 (=> (not res!17064) (not e!12962))))

(assert (=> b!19539 (= res!17064 (isPrefixOf!0 (_2!1195 lt!27786) (_2!1196 lt!27431)))))

(assert (= (and d!6414 c!1396) b!19536))

(assert (= (and d!6414 (not c!1396)) b!19535))

(assert (= (and d!6414 res!17063) b!19537))

(assert (= (and b!19537 res!17062) b!19539))

(assert (= (and b!19539 res!17064) b!19538))

(declare-fun m!26297 () Bool)

(assert (=> b!19539 m!26297))

(declare-fun m!26299 () Bool)

(assert (=> b!19537 m!26299))

(declare-fun m!26301 () Bool)

(assert (=> b!19538 m!26301))

(assert (=> b!19538 m!26127))

(assert (=> b!19538 m!26077))

(assert (=> b!19536 m!26077))

(declare-fun m!26303 () Bool)

(assert (=> b!19536 m!26303))

(declare-fun m!26305 () Bool)

(assert (=> b!19536 m!26305))

(declare-fun m!26307 () Bool)

(assert (=> d!6414 m!26307))

(assert (=> d!6414 m!26079))

(declare-fun m!26309 () Bool)

(assert (=> d!6414 m!26309))

(declare-fun m!26311 () Bool)

(assert (=> d!6414 m!26311))

(declare-fun m!26313 () Bool)

(assert (=> d!6414 m!26313))

(declare-fun m!26315 () Bool)

(assert (=> d!6414 m!26315))

(declare-fun m!26317 () Bool)

(assert (=> d!6414 m!26317))

(assert (=> d!6414 m!26075))

(declare-fun m!26319 () Bool)

(assert (=> d!6414 m!26319))

(assert (=> d!6414 m!26073))

(declare-fun m!26321 () Bool)

(assert (=> d!6414 m!26321))

(assert (=> b!19355 d!6414))

(check-sat (not d!6412) (not b!19539) (not b!19537) (not b!19467) (not d!6338) (not b!19385) (not b!19464) (not b!19478) (not d!6394) (not d!6336) (not b!19382) (not d!6388) (not b!19465) (not d!6408) (not b!19462) (not b!19380) (not b!19460) (not b!19536) (not d!6334) (not b!19476) (not b!19461) (not d!6406) (not d!6410) (not b!19466) (not d!6400) (not b!19538) (not d!6414) (not b!19463))
(check-sat)
