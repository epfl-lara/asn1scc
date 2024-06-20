; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5490 () Bool)

(assert start!5490)

(declare-fun b!22274 () Bool)

(declare-fun res!19200 () Bool)

(declare-fun e!15073 () Bool)

(assert (=> b!22274 (=> (not res!19200) (not e!15073))))

(declare-datatypes ((array!1546 0))(
  ( (array!1547 (arr!1112 (Array (_ BitVec 32) (_ BitVec 8))) (size!659 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1152 0))(
  ( (BitStream!1153 (buf!977 array!1546) (currentByte!2284 (_ BitVec 32)) (currentBit!2279 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1152)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!22274 (= res!19200 (validate_offset_bits!1 ((_ sign_extend 32) (size!659 (buf!977 thiss!1379))) ((_ sign_extend 32) (currentByte!2284 thiss!1379)) ((_ sign_extend 32) (currentBit!2279 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!22275 () Bool)

(declare-fun e!15076 () Bool)

(assert (=> b!22275 (= e!15073 (not e!15076))))

(declare-fun res!19199 () Bool)

(assert (=> b!22275 (=> res!19199 e!15076)))

(assert (=> b!22275 (= res!19199 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1152 BitStream!1152) Bool)

(assert (=> b!22275 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!1928 0))(
  ( (Unit!1929) )
))
(declare-fun lt!32373 () Unit!1928)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1152) Unit!1928)

(assert (=> b!22275 (= lt!32373 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!32376 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!22275 (= lt!32376 (bitIndex!0 (size!659 (buf!977 thiss!1379)) (currentByte!2284 thiss!1379) (currentBit!2279 thiss!1379)))))

(declare-datatypes ((tuple2!2598 0))(
  ( (tuple2!2599 (_1!1384 BitStream!1152) (_2!1384 BitStream!1152)) )
))
(declare-fun lt!32378 () tuple2!2598)

(declare-datatypes ((tuple2!2600 0))(
  ( (tuple2!2601 (_1!1385 Unit!1928) (_2!1385 BitStream!1152)) )
))
(declare-fun lt!32375 () tuple2!2600)

(declare-fun e!15075 () Bool)

(declare-fun b!22276 () Bool)

(declare-fun srcBuffer!2 () array!1546)

(declare-datatypes ((List!277 0))(
  ( (Nil!274) (Cons!273 (h!392 Bool) (t!1027 List!277)) )
))
(declare-fun head!114 (List!277) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1152 array!1546 (_ BitVec 64) (_ BitVec 64)) List!277)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1152 BitStream!1152 (_ BitVec 64)) List!277)

(assert (=> b!22276 (= e!15075 (= (head!114 (byteArrayBitContentToList!0 (_2!1385 lt!32375) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!114 (bitStreamReadBitsIntoList!0 (_2!1385 lt!32375) (_1!1384 lt!32378) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!22277 () Bool)

(declare-fun res!19196 () Bool)

(declare-fun e!15078 () Bool)

(assert (=> b!22277 (=> res!19196 e!15078)))

(declare-fun lt!32377 () tuple2!2600)

(assert (=> b!22277 (= res!19196 (not (= (size!659 (buf!977 thiss!1379)) (size!659 (buf!977 (_2!1385 lt!32377))))))))

(declare-fun b!22278 () Bool)

(declare-fun e!15072 () Bool)

(declare-fun array_inv!629 (array!1546) Bool)

(assert (=> b!22278 (= e!15072 (array_inv!629 (buf!977 thiss!1379)))))

(declare-fun b!22279 () Bool)

(declare-fun e!15071 () Bool)

(assert (=> b!22279 (= e!15076 e!15071)))

(declare-fun res!19197 () Bool)

(assert (=> b!22279 (=> res!19197 e!15071)))

(assert (=> b!22279 (= res!19197 (not (isPrefixOf!0 thiss!1379 (_2!1385 lt!32375))))))

(assert (=> b!22279 (validate_offset_bits!1 ((_ sign_extend 32) (size!659 (buf!977 (_2!1385 lt!32375)))) ((_ sign_extend 32) (currentByte!2284 (_2!1385 lt!32375))) ((_ sign_extend 32) (currentBit!2279 (_2!1385 lt!32375))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!32379 () Unit!1928)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1152 BitStream!1152 (_ BitVec 64) (_ BitVec 64)) Unit!1928)

(assert (=> b!22279 (= lt!32379 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1385 lt!32375) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1152 (_ BitVec 8) (_ BitVec 32)) tuple2!2600)

(assert (=> b!22279 (= lt!32375 (appendBitFromByte!0 thiss!1379 (select (arr!1112 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!22280 () Bool)

(declare-fun res!19195 () Bool)

(assert (=> b!22280 (=> res!19195 e!15078)))

(assert (=> b!22280 (= res!19195 (not (= (bitIndex!0 (size!659 (buf!977 (_2!1385 lt!32377))) (currentByte!2284 (_2!1385 lt!32377)) (currentBit!2279 (_2!1385 lt!32377))) (bvsub (bvadd lt!32376 to!314) i!635))))))

(declare-fun b!22281 () Bool)

(declare-fun res!19201 () Bool)

(assert (=> b!22281 (=> res!19201 e!15078)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!22281 (= res!19201 (not (invariant!0 (currentBit!2279 (_2!1385 lt!32377)) (currentByte!2284 (_2!1385 lt!32377)) (size!659 (buf!977 (_2!1385 lt!32377))))))))

(declare-fun res!19202 () Bool)

(assert (=> start!5490 (=> (not res!19202) (not e!15073))))

(assert (=> start!5490 (= res!19202 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!659 srcBuffer!2))))))))

(assert (=> start!5490 e!15073))

(assert (=> start!5490 true))

(assert (=> start!5490 (array_inv!629 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1152) Bool)

(assert (=> start!5490 (and (inv!12 thiss!1379) e!15072)))

(declare-fun b!22282 () Bool)

(assert (=> b!22282 (= e!15078 (invariant!0 (currentBit!2279 (_2!1385 lt!32375)) (currentByte!2284 (_2!1385 lt!32375)) (size!659 (buf!977 (_2!1385 lt!32375)))))))

(assert (=> b!22282 (= (size!659 (buf!977 (_2!1385 lt!32377))) (size!659 (buf!977 thiss!1379)))))

(declare-fun b!22283 () Bool)

(assert (=> b!22283 (= e!15071 e!15078)))

(declare-fun res!19198 () Bool)

(assert (=> b!22283 (=> res!19198 e!15078)))

(assert (=> b!22283 (= res!19198 (not (isPrefixOf!0 (_2!1385 lt!32375) (_2!1385 lt!32377))))))

(assert (=> b!22283 (isPrefixOf!0 thiss!1379 (_2!1385 lt!32377))))

(declare-fun lt!32374 () Unit!1928)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1152 BitStream!1152 BitStream!1152) Unit!1928)

(assert (=> b!22283 (= lt!32374 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1385 lt!32375) (_2!1385 lt!32377)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1152 array!1546 (_ BitVec 64) (_ BitVec 64)) tuple2!2600)

(assert (=> b!22283 (= lt!32377 (appendBitsMSBFirstLoop!0 (_2!1385 lt!32375) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!22283 e!15075))

(declare-fun res!19194 () Bool)

(assert (=> b!22283 (=> (not res!19194) (not e!15075))))

(assert (=> b!22283 (= res!19194 (validate_offset_bits!1 ((_ sign_extend 32) (size!659 (buf!977 (_2!1385 lt!32375)))) ((_ sign_extend 32) (currentByte!2284 thiss!1379)) ((_ sign_extend 32) (currentBit!2279 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!32380 () Unit!1928)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1152 array!1546 (_ BitVec 64)) Unit!1928)

(assert (=> b!22283 (= lt!32380 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!977 (_2!1385 lt!32375)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1152 BitStream!1152) tuple2!2598)

(assert (=> b!22283 (= lt!32378 (reader!0 thiss!1379 (_2!1385 lt!32375)))))

(assert (= (and start!5490 res!19202) b!22274))

(assert (= (and b!22274 res!19200) b!22275))

(assert (= (and b!22275 (not res!19199)) b!22279))

(assert (= (and b!22279 (not res!19197)) b!22283))

(assert (= (and b!22283 res!19194) b!22276))

(assert (= (and b!22283 (not res!19198)) b!22280))

(assert (= (and b!22280 (not res!19195)) b!22281))

(assert (= (and b!22281 (not res!19201)) b!22277))

(assert (= (and b!22277 (not res!19196)) b!22282))

(assert (= start!5490 b!22278))

(declare-fun m!30991 () Bool)

(assert (=> b!22279 m!30991))

(declare-fun m!30993 () Bool)

(assert (=> b!22279 m!30993))

(declare-fun m!30995 () Bool)

(assert (=> b!22279 m!30995))

(declare-fun m!30997 () Bool)

(assert (=> b!22279 m!30997))

(assert (=> b!22279 m!30995))

(declare-fun m!30999 () Bool)

(assert (=> b!22279 m!30999))

(declare-fun m!31001 () Bool)

(assert (=> b!22278 m!31001))

(declare-fun m!31003 () Bool)

(assert (=> b!22276 m!31003))

(assert (=> b!22276 m!31003))

(declare-fun m!31005 () Bool)

(assert (=> b!22276 m!31005))

(declare-fun m!31007 () Bool)

(assert (=> b!22276 m!31007))

(assert (=> b!22276 m!31007))

(declare-fun m!31009 () Bool)

(assert (=> b!22276 m!31009))

(declare-fun m!31011 () Bool)

(assert (=> b!22280 m!31011))

(declare-fun m!31013 () Bool)

(assert (=> b!22281 m!31013))

(declare-fun m!31015 () Bool)

(assert (=> b!22283 m!31015))

(declare-fun m!31017 () Bool)

(assert (=> b!22283 m!31017))

(declare-fun m!31019 () Bool)

(assert (=> b!22283 m!31019))

(declare-fun m!31021 () Bool)

(assert (=> b!22283 m!31021))

(declare-fun m!31023 () Bool)

(assert (=> b!22283 m!31023))

(declare-fun m!31025 () Bool)

(assert (=> b!22283 m!31025))

(declare-fun m!31027 () Bool)

(assert (=> b!22283 m!31027))

(declare-fun m!31029 () Bool)

(assert (=> b!22282 m!31029))

(declare-fun m!31031 () Bool)

(assert (=> b!22275 m!31031))

(declare-fun m!31033 () Bool)

(assert (=> b!22275 m!31033))

(declare-fun m!31035 () Bool)

(assert (=> b!22275 m!31035))

(declare-fun m!31037 () Bool)

(assert (=> start!5490 m!31037))

(declare-fun m!31039 () Bool)

(assert (=> start!5490 m!31039))

(declare-fun m!31041 () Bool)

(assert (=> b!22274 m!31041))

(check-sat (not start!5490) (not b!22283) (not b!22274) (not b!22276) (not b!22275) (not b!22281) (not b!22279) (not b!22282) (not b!22278) (not b!22280))
(check-sat)
(get-model)

(declare-fun d!7078 () Bool)

(assert (=> d!7078 (= (invariant!0 (currentBit!2279 (_2!1385 lt!32375)) (currentByte!2284 (_2!1385 lt!32375)) (size!659 (buf!977 (_2!1385 lt!32375)))) (and (bvsge (currentBit!2279 (_2!1385 lt!32375)) #b00000000000000000000000000000000) (bvslt (currentBit!2279 (_2!1385 lt!32375)) #b00000000000000000000000000001000) (bvsge (currentByte!2284 (_2!1385 lt!32375)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2284 (_2!1385 lt!32375)) (size!659 (buf!977 (_2!1385 lt!32375)))) (and (= (currentBit!2279 (_2!1385 lt!32375)) #b00000000000000000000000000000000) (= (currentByte!2284 (_2!1385 lt!32375)) (size!659 (buf!977 (_2!1385 lt!32375))))))))))

(assert (=> b!22282 d!7078))

(declare-fun d!7080 () Bool)

(assert (=> d!7080 (= (array_inv!629 (buf!977 thiss!1379)) (bvsge (size!659 (buf!977 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!22278 d!7080))

(declare-fun d!7082 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!7082 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!659 (buf!977 (_2!1385 lt!32375)))) ((_ sign_extend 32) (currentByte!2284 thiss!1379)) ((_ sign_extend 32) (currentBit!2279 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!659 (buf!977 (_2!1385 lt!32375)))) ((_ sign_extend 32) (currentByte!2284 thiss!1379)) ((_ sign_extend 32) (currentBit!2279 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!2060 () Bool)

(assert (= bs!2060 d!7082))

(declare-fun m!31095 () Bool)

(assert (=> bs!2060 m!31095))

(assert (=> b!22283 d!7082))

(declare-fun d!7084 () Bool)

(assert (=> d!7084 (isPrefixOf!0 thiss!1379 (_2!1385 lt!32377))))

(declare-fun lt!32407 () Unit!1928)

(declare-fun choose!30 (BitStream!1152 BitStream!1152 BitStream!1152) Unit!1928)

(assert (=> d!7084 (= lt!32407 (choose!30 thiss!1379 (_2!1385 lt!32375) (_2!1385 lt!32377)))))

(assert (=> d!7084 (isPrefixOf!0 thiss!1379 (_2!1385 lt!32375))))

(assert (=> d!7084 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1385 lt!32375) (_2!1385 lt!32377)) lt!32407)))

(declare-fun bs!2061 () Bool)

(assert (= bs!2061 d!7084))

(assert (=> bs!2061 m!31015))

(declare-fun m!31097 () Bool)

(assert (=> bs!2061 m!31097))

(assert (=> bs!2061 m!30993))

(assert (=> b!22283 d!7084))

(declare-fun d!7086 () Bool)

(assert (=> d!7086 (validate_offset_bits!1 ((_ sign_extend 32) (size!659 (buf!977 (_2!1385 lt!32375)))) ((_ sign_extend 32) (currentByte!2284 thiss!1379)) ((_ sign_extend 32) (currentBit!2279 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!32410 () Unit!1928)

(declare-fun choose!9 (BitStream!1152 array!1546 (_ BitVec 64) BitStream!1152) Unit!1928)

(assert (=> d!7086 (= lt!32410 (choose!9 thiss!1379 (buf!977 (_2!1385 lt!32375)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1153 (buf!977 (_2!1385 lt!32375)) (currentByte!2284 thiss!1379) (currentBit!2279 thiss!1379))))))

(assert (=> d!7086 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!977 (_2!1385 lt!32375)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!32410)))

(declare-fun bs!2062 () Bool)

(assert (= bs!2062 d!7086))

(assert (=> bs!2062 m!31025))

(declare-fun m!31099 () Bool)

(assert (=> bs!2062 m!31099))

(assert (=> b!22283 d!7086))

(declare-fun d!7088 () Bool)

(declare-fun res!19237 () Bool)

(declare-fun e!15108 () Bool)

(assert (=> d!7088 (=> (not res!19237) (not e!15108))))

(assert (=> d!7088 (= res!19237 (= (size!659 (buf!977 thiss!1379)) (size!659 (buf!977 (_2!1385 lt!32377)))))))

(assert (=> d!7088 (= (isPrefixOf!0 thiss!1379 (_2!1385 lt!32377)) e!15108)))

(declare-fun b!22320 () Bool)

(declare-fun res!19238 () Bool)

(assert (=> b!22320 (=> (not res!19238) (not e!15108))))

(assert (=> b!22320 (= res!19238 (bvsle (bitIndex!0 (size!659 (buf!977 thiss!1379)) (currentByte!2284 thiss!1379) (currentBit!2279 thiss!1379)) (bitIndex!0 (size!659 (buf!977 (_2!1385 lt!32377))) (currentByte!2284 (_2!1385 lt!32377)) (currentBit!2279 (_2!1385 lt!32377)))))))

(declare-fun b!22321 () Bool)

(declare-fun e!15107 () Bool)

(assert (=> b!22321 (= e!15108 e!15107)))

(declare-fun res!19236 () Bool)

(assert (=> b!22321 (=> res!19236 e!15107)))

(assert (=> b!22321 (= res!19236 (= (size!659 (buf!977 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!22322 () Bool)

(declare-fun arrayBitRangesEq!0 (array!1546 array!1546 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!22322 (= e!15107 (arrayBitRangesEq!0 (buf!977 thiss!1379) (buf!977 (_2!1385 lt!32377)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!659 (buf!977 thiss!1379)) (currentByte!2284 thiss!1379) (currentBit!2279 thiss!1379))))))

(assert (= (and d!7088 res!19237) b!22320))

(assert (= (and b!22320 res!19238) b!22321))

(assert (= (and b!22321 (not res!19236)) b!22322))

(assert (=> b!22320 m!31035))

(assert (=> b!22320 m!31011))

(assert (=> b!22322 m!31035))

(assert (=> b!22322 m!31035))

(declare-fun m!31101 () Bool)

(assert (=> b!22322 m!31101))

(assert (=> b!22283 d!7088))

(declare-fun d!7090 () Bool)

(declare-fun res!19240 () Bool)

(declare-fun e!15110 () Bool)

(assert (=> d!7090 (=> (not res!19240) (not e!15110))))

(assert (=> d!7090 (= res!19240 (= (size!659 (buf!977 (_2!1385 lt!32375))) (size!659 (buf!977 (_2!1385 lt!32377)))))))

(assert (=> d!7090 (= (isPrefixOf!0 (_2!1385 lt!32375) (_2!1385 lt!32377)) e!15110)))

(declare-fun b!22323 () Bool)

(declare-fun res!19241 () Bool)

(assert (=> b!22323 (=> (not res!19241) (not e!15110))))

(assert (=> b!22323 (= res!19241 (bvsle (bitIndex!0 (size!659 (buf!977 (_2!1385 lt!32375))) (currentByte!2284 (_2!1385 lt!32375)) (currentBit!2279 (_2!1385 lt!32375))) (bitIndex!0 (size!659 (buf!977 (_2!1385 lt!32377))) (currentByte!2284 (_2!1385 lt!32377)) (currentBit!2279 (_2!1385 lt!32377)))))))

(declare-fun b!22324 () Bool)

(declare-fun e!15109 () Bool)

(assert (=> b!22324 (= e!15110 e!15109)))

(declare-fun res!19239 () Bool)

(assert (=> b!22324 (=> res!19239 e!15109)))

(assert (=> b!22324 (= res!19239 (= (size!659 (buf!977 (_2!1385 lt!32375))) #b00000000000000000000000000000000))))

(declare-fun b!22325 () Bool)

(assert (=> b!22325 (= e!15109 (arrayBitRangesEq!0 (buf!977 (_2!1385 lt!32375)) (buf!977 (_2!1385 lt!32377)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!659 (buf!977 (_2!1385 lt!32375))) (currentByte!2284 (_2!1385 lt!32375)) (currentBit!2279 (_2!1385 lt!32375)))))))

(assert (= (and d!7090 res!19240) b!22323))

(assert (= (and b!22323 res!19241) b!22324))

(assert (= (and b!22324 (not res!19239)) b!22325))

(declare-fun m!31103 () Bool)

(assert (=> b!22323 m!31103))

(assert (=> b!22323 m!31011))

(assert (=> b!22325 m!31103))

(assert (=> b!22325 m!31103))

(declare-fun m!31105 () Bool)

(assert (=> b!22325 m!31105))

(assert (=> b!22283 d!7090))

(declare-fun b!22456 () Bool)

(declare-fun res!19339 () Bool)

(declare-fun e!15176 () Bool)

(assert (=> b!22456 (=> (not res!19339) (not e!15176))))

(declare-fun lt!32732 () tuple2!2600)

(assert (=> b!22456 (= res!19339 (= (size!659 (buf!977 (_2!1385 lt!32732))) (size!659 (buf!977 (_2!1385 lt!32375)))))))

(declare-fun b!22458 () Bool)

(declare-fun lt!32737 () tuple2!2598)

(assert (=> b!22458 (= e!15176 (= (bitStreamReadBitsIntoList!0 (_2!1385 lt!32732) (_1!1384 lt!32737) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!1385 lt!32732) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!22458 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!22458 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!32730 () Unit!1928)

(declare-fun lt!32739 () Unit!1928)

(assert (=> b!22458 (= lt!32730 lt!32739)))

(declare-fun lt!32756 () (_ BitVec 64))

(assert (=> b!22458 (validate_offset_bits!1 ((_ sign_extend 32) (size!659 (buf!977 (_2!1385 lt!32732)))) ((_ sign_extend 32) (currentByte!2284 (_2!1385 lt!32375))) ((_ sign_extend 32) (currentBit!2279 (_2!1385 lt!32375))) lt!32756)))

(assert (=> b!22458 (= lt!32739 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1385 lt!32375) (buf!977 (_2!1385 lt!32732)) lt!32756))))

(declare-fun e!15177 () Bool)

(assert (=> b!22458 e!15177))

(declare-fun res!19342 () Bool)

(assert (=> b!22458 (=> (not res!19342) (not e!15177))))

(assert (=> b!22458 (= res!19342 (and (= (size!659 (buf!977 (_2!1385 lt!32375))) (size!659 (buf!977 (_2!1385 lt!32732)))) (bvsge lt!32756 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!22458 (= lt!32756 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!22458 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!22458 (= lt!32737 (reader!0 (_2!1385 lt!32375) (_2!1385 lt!32732)))))

(declare-fun bm!320 () Bool)

(declare-fun lt!32716 () tuple2!2600)

(declare-fun c!1612 () Bool)

(declare-fun call!323 () tuple2!2598)

(assert (=> bm!320 (= call!323 (reader!0 (_2!1385 lt!32375) (ite c!1612 (_2!1385 lt!32716) (_2!1385 lt!32375))))))

(declare-fun b!22459 () Bool)

(declare-fun e!15178 () tuple2!2600)

(declare-fun Unit!1932 () Unit!1928)

(assert (=> b!22459 (= e!15178 (tuple2!2601 Unit!1932 (_2!1385 lt!32375)))))

(assert (=> b!22459 (= (size!659 (buf!977 (_2!1385 lt!32375))) (size!659 (buf!977 (_2!1385 lt!32375))))))

(declare-fun lt!32719 () Unit!1928)

(declare-fun Unit!1933 () Unit!1928)

(assert (=> b!22459 (= lt!32719 Unit!1933)))

(declare-fun checkByteArrayBitContent!0 (BitStream!1152 array!1546 array!1546 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!2606 0))(
  ( (tuple2!2607 (_1!1388 array!1546) (_2!1388 BitStream!1152)) )
))
(declare-fun readBits!0 (BitStream!1152 (_ BitVec 64)) tuple2!2606)

(assert (=> b!22459 (checkByteArrayBitContent!0 (_2!1385 lt!32375) srcBuffer!2 (_1!1388 (readBits!0 (_1!1384 call!323) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!22460 () Bool)

(declare-fun res!19337 () Bool)

(assert (=> b!22460 (=> (not res!19337) (not e!15176))))

(assert (=> b!22460 (= res!19337 (isPrefixOf!0 (_2!1385 lt!32375) (_2!1385 lt!32732)))))

(declare-fun b!22461 () Bool)

(declare-fun res!19338 () Bool)

(assert (=> b!22461 (=> (not res!19338) (not e!15176))))

(assert (=> b!22461 (= res!19338 (invariant!0 (currentBit!2279 (_2!1385 lt!32732)) (currentByte!2284 (_2!1385 lt!32732)) (size!659 (buf!977 (_2!1385 lt!32732)))))))

(declare-fun b!22462 () Bool)

(declare-fun res!19340 () Bool)

(assert (=> b!22462 (=> (not res!19340) (not e!15176))))

(assert (=> b!22462 (= res!19340 (= (size!659 (buf!977 (_2!1385 lt!32375))) (size!659 (buf!977 (_2!1385 lt!32732)))))))

(declare-fun b!22463 () Bool)

(assert (=> b!22463 (= e!15177 (validate_offset_bits!1 ((_ sign_extend 32) (size!659 (buf!977 (_2!1385 lt!32375)))) ((_ sign_extend 32) (currentByte!2284 (_2!1385 lt!32375))) ((_ sign_extend 32) (currentBit!2279 (_2!1385 lt!32375))) lt!32756))))

(declare-fun d!7092 () Bool)

(assert (=> d!7092 e!15176))

(declare-fun res!19341 () Bool)

(assert (=> d!7092 (=> (not res!19341) (not e!15176))))

(declare-fun lt!32717 () (_ BitVec 64))

(assert (=> d!7092 (= res!19341 (= (bitIndex!0 (size!659 (buf!977 (_2!1385 lt!32732))) (currentByte!2284 (_2!1385 lt!32732)) (currentBit!2279 (_2!1385 lt!32732))) (bvsub lt!32717 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!7092 (or (= (bvand lt!32717 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!32717 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!32717 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!32758 () (_ BitVec 64))

(assert (=> d!7092 (= lt!32717 (bvadd lt!32758 to!314))))

(assert (=> d!7092 (or (not (= (bvand lt!32758 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!32758 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!32758 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!7092 (= lt!32758 (bitIndex!0 (size!659 (buf!977 (_2!1385 lt!32375))) (currentByte!2284 (_2!1385 lt!32375)) (currentBit!2279 (_2!1385 lt!32375))))))

(assert (=> d!7092 (= lt!32732 e!15178)))

(assert (=> d!7092 (= c!1612 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!32751 () Unit!1928)

(declare-fun lt!32743 () Unit!1928)

(assert (=> d!7092 (= lt!32751 lt!32743)))

(assert (=> d!7092 (isPrefixOf!0 (_2!1385 lt!32375) (_2!1385 lt!32375))))

(assert (=> d!7092 (= lt!32743 (lemmaIsPrefixRefl!0 (_2!1385 lt!32375)))))

(declare-fun lt!32738 () (_ BitVec 64))

(assert (=> d!7092 (= lt!32738 (bitIndex!0 (size!659 (buf!977 (_2!1385 lt!32375))) (currentByte!2284 (_2!1385 lt!32375)) (currentBit!2279 (_2!1385 lt!32375))))))

(assert (=> d!7092 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!7092 (= (appendBitsMSBFirstLoop!0 (_2!1385 lt!32375) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!32732)))

(declare-fun b!22457 () Bool)

(declare-fun lt!32718 () tuple2!2600)

(declare-fun Unit!1934 () Unit!1928)

(assert (=> b!22457 (= e!15178 (tuple2!2601 Unit!1934 (_2!1385 lt!32718)))))

(assert (=> b!22457 (= lt!32716 (appendBitFromByte!0 (_2!1385 lt!32375) (select (arr!1112 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!32733 () (_ BitVec 64))

(assert (=> b!22457 (= lt!32733 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!32740 () (_ BitVec 64))

(assert (=> b!22457 (= lt!32740 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!32727 () Unit!1928)

(assert (=> b!22457 (= lt!32727 (validateOffsetBitsIneqLemma!0 (_2!1385 lt!32375) (_2!1385 lt!32716) lt!32733 lt!32740))))

(assert (=> b!22457 (validate_offset_bits!1 ((_ sign_extend 32) (size!659 (buf!977 (_2!1385 lt!32716)))) ((_ sign_extend 32) (currentByte!2284 (_2!1385 lt!32716))) ((_ sign_extend 32) (currentBit!2279 (_2!1385 lt!32716))) (bvsub lt!32733 lt!32740))))

(declare-fun lt!32724 () Unit!1928)

(assert (=> b!22457 (= lt!32724 lt!32727)))

(declare-fun lt!32754 () tuple2!2598)

(assert (=> b!22457 (= lt!32754 call!323)))

(declare-fun lt!32753 () (_ BitVec 64))

(assert (=> b!22457 (= lt!32753 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!32728 () Unit!1928)

(assert (=> b!22457 (= lt!32728 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1385 lt!32375) (buf!977 (_2!1385 lt!32716)) lt!32753))))

(assert (=> b!22457 (validate_offset_bits!1 ((_ sign_extend 32) (size!659 (buf!977 (_2!1385 lt!32716)))) ((_ sign_extend 32) (currentByte!2284 (_2!1385 lt!32375))) ((_ sign_extend 32) (currentBit!2279 (_2!1385 lt!32375))) lt!32753)))

(declare-fun lt!32750 () Unit!1928)

(assert (=> b!22457 (= lt!32750 lt!32728)))

(assert (=> b!22457 (= (head!114 (byteArrayBitContentToList!0 (_2!1385 lt!32716) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!114 (bitStreamReadBitsIntoList!0 (_2!1385 lt!32716) (_1!1384 lt!32754) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!32715 () Unit!1928)

(declare-fun Unit!1935 () Unit!1928)

(assert (=> b!22457 (= lt!32715 Unit!1935)))

(assert (=> b!22457 (= lt!32718 (appendBitsMSBFirstLoop!0 (_2!1385 lt!32716) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!32723 () Unit!1928)

(assert (=> b!22457 (= lt!32723 (lemmaIsPrefixTransitive!0 (_2!1385 lt!32375) (_2!1385 lt!32716) (_2!1385 lt!32718)))))

(assert (=> b!22457 (isPrefixOf!0 (_2!1385 lt!32375) (_2!1385 lt!32718))))

(declare-fun lt!32742 () Unit!1928)

(assert (=> b!22457 (= lt!32742 lt!32723)))

(assert (=> b!22457 (= (size!659 (buf!977 (_2!1385 lt!32718))) (size!659 (buf!977 (_2!1385 lt!32375))))))

(declare-fun lt!32745 () Unit!1928)

(declare-fun Unit!1936 () Unit!1928)

(assert (=> b!22457 (= lt!32745 Unit!1936)))

(assert (=> b!22457 (= (bitIndex!0 (size!659 (buf!977 (_2!1385 lt!32718))) (currentByte!2284 (_2!1385 lt!32718)) (currentBit!2279 (_2!1385 lt!32718))) (bvsub (bvadd (bitIndex!0 (size!659 (buf!977 (_2!1385 lt!32375))) (currentByte!2284 (_2!1385 lt!32375)) (currentBit!2279 (_2!1385 lt!32375))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!32755 () Unit!1928)

(declare-fun Unit!1937 () Unit!1928)

(assert (=> b!22457 (= lt!32755 Unit!1937)))

(assert (=> b!22457 (= (bitIndex!0 (size!659 (buf!977 (_2!1385 lt!32718))) (currentByte!2284 (_2!1385 lt!32718)) (currentBit!2279 (_2!1385 lt!32718))) (bvsub (bvsub (bvadd (bitIndex!0 (size!659 (buf!977 (_2!1385 lt!32716))) (currentByte!2284 (_2!1385 lt!32716)) (currentBit!2279 (_2!1385 lt!32716))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!32731 () Unit!1928)

(declare-fun Unit!1938 () Unit!1928)

(assert (=> b!22457 (= lt!32731 Unit!1938)))

(declare-fun lt!32725 () tuple2!2598)

(assert (=> b!22457 (= lt!32725 (reader!0 (_2!1385 lt!32375) (_2!1385 lt!32718)))))

(declare-fun lt!32736 () (_ BitVec 64))

(assert (=> b!22457 (= lt!32736 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!32749 () Unit!1928)

(assert (=> b!22457 (= lt!32749 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1385 lt!32375) (buf!977 (_2!1385 lt!32718)) lt!32736))))

(assert (=> b!22457 (validate_offset_bits!1 ((_ sign_extend 32) (size!659 (buf!977 (_2!1385 lt!32718)))) ((_ sign_extend 32) (currentByte!2284 (_2!1385 lt!32375))) ((_ sign_extend 32) (currentBit!2279 (_2!1385 lt!32375))) lt!32736)))

(declare-fun lt!32744 () Unit!1928)

(assert (=> b!22457 (= lt!32744 lt!32749)))

(declare-fun lt!32721 () tuple2!2598)

(assert (=> b!22457 (= lt!32721 (reader!0 (_2!1385 lt!32716) (_2!1385 lt!32718)))))

(declare-fun lt!32735 () (_ BitVec 64))

(assert (=> b!22457 (= lt!32735 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!32752 () Unit!1928)

(assert (=> b!22457 (= lt!32752 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1385 lt!32716) (buf!977 (_2!1385 lt!32718)) lt!32735))))

(assert (=> b!22457 (validate_offset_bits!1 ((_ sign_extend 32) (size!659 (buf!977 (_2!1385 lt!32718)))) ((_ sign_extend 32) (currentByte!2284 (_2!1385 lt!32716))) ((_ sign_extend 32) (currentBit!2279 (_2!1385 lt!32716))) lt!32735)))

(declare-fun lt!32729 () Unit!1928)

(assert (=> b!22457 (= lt!32729 lt!32752)))

(declare-fun lt!32748 () List!277)

(assert (=> b!22457 (= lt!32748 (byteArrayBitContentToList!0 (_2!1385 lt!32718) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!32720 () List!277)

(assert (=> b!22457 (= lt!32720 (byteArrayBitContentToList!0 (_2!1385 lt!32718) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!32722 () List!277)

(assert (=> b!22457 (= lt!32722 (bitStreamReadBitsIntoList!0 (_2!1385 lt!32718) (_1!1384 lt!32725) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!32757 () List!277)

(assert (=> b!22457 (= lt!32757 (bitStreamReadBitsIntoList!0 (_2!1385 lt!32718) (_1!1384 lt!32721) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!32741 () (_ BitVec 64))

(assert (=> b!22457 (= lt!32741 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!32734 () Unit!1928)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1152 BitStream!1152 BitStream!1152 BitStream!1152 (_ BitVec 64) List!277) Unit!1928)

(assert (=> b!22457 (= lt!32734 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1385 lt!32718) (_2!1385 lt!32718) (_1!1384 lt!32725) (_1!1384 lt!32721) lt!32741 lt!32722))))

(declare-fun tail!83 (List!277) List!277)

(assert (=> b!22457 (= (bitStreamReadBitsIntoList!0 (_2!1385 lt!32718) (_1!1384 lt!32721) (bvsub lt!32741 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!83 lt!32722))))

(declare-fun lt!32746 () Unit!1928)

(assert (=> b!22457 (= lt!32746 lt!32734)))

(declare-fun lt!32747 () Unit!1928)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1546 array!1546 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!1928)

(assert (=> b!22457 (= lt!32747 (arrayBitRangesEqImpliesEq!0 (buf!977 (_2!1385 lt!32716)) (buf!977 (_2!1385 lt!32718)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!32738 (bitIndex!0 (size!659 (buf!977 (_2!1385 lt!32716))) (currentByte!2284 (_2!1385 lt!32716)) (currentBit!2279 (_2!1385 lt!32716)))))))

(declare-fun bitAt!0 (array!1546 (_ BitVec 64)) Bool)

(assert (=> b!22457 (= (bitAt!0 (buf!977 (_2!1385 lt!32716)) lt!32738) (bitAt!0 (buf!977 (_2!1385 lt!32718)) lt!32738))))

(declare-fun lt!32726 () Unit!1928)

(assert (=> b!22457 (= lt!32726 lt!32747)))

(assert (= (and d!7092 c!1612) b!22457))

(assert (= (and d!7092 (not c!1612)) b!22459))

(assert (= (or b!22457 b!22459) bm!320))

(assert (= (and d!7092 res!19341) b!22461))

(assert (= (and b!22461 res!19338) b!22462))

(assert (= (and b!22462 res!19340) b!22460))

(assert (= (and b!22460 res!19337) b!22456))

(assert (= (and b!22456 res!19339) b!22458))

(assert (= (and b!22458 res!19342) b!22463))

(declare-fun m!31229 () Bool)

(assert (=> d!7092 m!31229))

(assert (=> d!7092 m!31103))

(declare-fun m!31231 () Bool)

(assert (=> d!7092 m!31231))

(declare-fun m!31233 () Bool)

(assert (=> d!7092 m!31233))

(declare-fun m!31235 () Bool)

(assert (=> b!22459 m!31235))

(declare-fun m!31237 () Bool)

(assert (=> b!22459 m!31237))

(declare-fun m!31239 () Bool)

(assert (=> b!22461 m!31239))

(declare-fun m!31241 () Bool)

(assert (=> bm!320 m!31241))

(declare-fun m!31243 () Bool)

(assert (=> b!22463 m!31243))

(declare-fun m!31245 () Bool)

(assert (=> b!22460 m!31245))

(declare-fun m!31247 () Bool)

(assert (=> b!22458 m!31247))

(declare-fun m!31249 () Bool)

(assert (=> b!22458 m!31249))

(declare-fun m!31251 () Bool)

(assert (=> b!22458 m!31251))

(declare-fun m!31253 () Bool)

(assert (=> b!22458 m!31253))

(declare-fun m!31255 () Bool)

(assert (=> b!22458 m!31255))

(declare-fun m!31257 () Bool)

(assert (=> b!22457 m!31257))

(declare-fun m!31259 () Bool)

(assert (=> b!22457 m!31259))

(declare-fun m!31261 () Bool)

(assert (=> b!22457 m!31261))

(declare-fun m!31263 () Bool)

(assert (=> b!22457 m!31263))

(declare-fun m!31265 () Bool)

(assert (=> b!22457 m!31265))

(declare-fun m!31267 () Bool)

(assert (=> b!22457 m!31267))

(declare-fun m!31269 () Bool)

(assert (=> b!22457 m!31269))

(declare-fun m!31271 () Bool)

(assert (=> b!22457 m!31271))

(assert (=> b!22457 m!31103))

(declare-fun m!31273 () Bool)

(assert (=> b!22457 m!31273))

(declare-fun m!31275 () Bool)

(assert (=> b!22457 m!31275))

(declare-fun m!31277 () Bool)

(assert (=> b!22457 m!31277))

(declare-fun m!31279 () Bool)

(assert (=> b!22457 m!31279))

(declare-fun m!31281 () Bool)

(assert (=> b!22457 m!31281))

(declare-fun m!31283 () Bool)

(assert (=> b!22457 m!31283))

(declare-fun m!31285 () Bool)

(assert (=> b!22457 m!31285))

(declare-fun m!31287 () Bool)

(assert (=> b!22457 m!31287))

(declare-fun m!31289 () Bool)

(assert (=> b!22457 m!31289))

(declare-fun m!31291 () Bool)

(assert (=> b!22457 m!31291))

(declare-fun m!31293 () Bool)

(assert (=> b!22457 m!31293))

(declare-fun m!31295 () Bool)

(assert (=> b!22457 m!31295))

(assert (=> b!22457 m!31281))

(declare-fun m!31297 () Bool)

(assert (=> b!22457 m!31297))

(declare-fun m!31299 () Bool)

(assert (=> b!22457 m!31299))

(declare-fun m!31301 () Bool)

(assert (=> b!22457 m!31301))

(declare-fun m!31303 () Bool)

(assert (=> b!22457 m!31303))

(declare-fun m!31305 () Bool)

(assert (=> b!22457 m!31305))

(declare-fun m!31307 () Bool)

(assert (=> b!22457 m!31307))

(declare-fun m!31309 () Bool)

(assert (=> b!22457 m!31309))

(assert (=> b!22457 m!31293))

(assert (=> b!22457 m!31307))

(declare-fun m!31311 () Bool)

(assert (=> b!22457 m!31311))

(assert (=> b!22457 m!31269))

(declare-fun m!31313 () Bool)

(assert (=> b!22457 m!31313))

(declare-fun m!31315 () Bool)

(assert (=> b!22457 m!31315))

(declare-fun m!31317 () Bool)

(assert (=> b!22457 m!31317))

(assert (=> b!22283 d!7092))

(declare-fun b!22474 () Bool)

(declare-fun lt!32806 () tuple2!2598)

(declare-fun lt!32817 () (_ BitVec 64))

(declare-fun e!15184 () Bool)

(declare-fun lt!32801 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1152 (_ BitVec 64)) BitStream!1152)

(assert (=> b!22474 (= e!15184 (= (_1!1384 lt!32806) (withMovedBitIndex!0 (_2!1384 lt!32806) (bvsub lt!32801 lt!32817))))))

(assert (=> b!22474 (or (= (bvand lt!32801 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!32817 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!32801 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!32801 lt!32817) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!22474 (= lt!32817 (bitIndex!0 (size!659 (buf!977 (_2!1385 lt!32375))) (currentByte!2284 (_2!1385 lt!32375)) (currentBit!2279 (_2!1385 lt!32375))))))

(assert (=> b!22474 (= lt!32801 (bitIndex!0 (size!659 (buf!977 thiss!1379)) (currentByte!2284 thiss!1379) (currentBit!2279 thiss!1379)))))

(declare-fun b!22475 () Bool)

(declare-fun e!15183 () Unit!1928)

(declare-fun lt!32809 () Unit!1928)

(assert (=> b!22475 (= e!15183 lt!32809)))

(declare-fun lt!32808 () (_ BitVec 64))

(assert (=> b!22475 (= lt!32808 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!32815 () (_ BitVec 64))

(assert (=> b!22475 (= lt!32815 (bitIndex!0 (size!659 (buf!977 thiss!1379)) (currentByte!2284 thiss!1379) (currentBit!2279 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1546 array!1546 (_ BitVec 64) (_ BitVec 64)) Unit!1928)

(assert (=> b!22475 (= lt!32809 (arrayBitRangesEqSymmetric!0 (buf!977 thiss!1379) (buf!977 (_2!1385 lt!32375)) lt!32808 lt!32815))))

(assert (=> b!22475 (arrayBitRangesEq!0 (buf!977 (_2!1385 lt!32375)) (buf!977 thiss!1379) lt!32808 lt!32815)))

(declare-fun d!7148 () Bool)

(assert (=> d!7148 e!15184))

(declare-fun res!19349 () Bool)

(assert (=> d!7148 (=> (not res!19349) (not e!15184))))

(assert (=> d!7148 (= res!19349 (isPrefixOf!0 (_1!1384 lt!32806) (_2!1384 lt!32806)))))

(declare-fun lt!32811 () BitStream!1152)

(assert (=> d!7148 (= lt!32806 (tuple2!2599 lt!32811 (_2!1385 lt!32375)))))

(declare-fun lt!32816 () Unit!1928)

(declare-fun lt!32810 () Unit!1928)

(assert (=> d!7148 (= lt!32816 lt!32810)))

(assert (=> d!7148 (isPrefixOf!0 lt!32811 (_2!1385 lt!32375))))

(assert (=> d!7148 (= lt!32810 (lemmaIsPrefixTransitive!0 lt!32811 (_2!1385 lt!32375) (_2!1385 lt!32375)))))

(declare-fun lt!32814 () Unit!1928)

(declare-fun lt!32813 () Unit!1928)

(assert (=> d!7148 (= lt!32814 lt!32813)))

(assert (=> d!7148 (isPrefixOf!0 lt!32811 (_2!1385 lt!32375))))

(assert (=> d!7148 (= lt!32813 (lemmaIsPrefixTransitive!0 lt!32811 thiss!1379 (_2!1385 lt!32375)))))

(declare-fun lt!32805 () Unit!1928)

(assert (=> d!7148 (= lt!32805 e!15183)))

(declare-fun c!1615 () Bool)

(assert (=> d!7148 (= c!1615 (not (= (size!659 (buf!977 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!32799 () Unit!1928)

(declare-fun lt!32802 () Unit!1928)

(assert (=> d!7148 (= lt!32799 lt!32802)))

(assert (=> d!7148 (isPrefixOf!0 (_2!1385 lt!32375) (_2!1385 lt!32375))))

(assert (=> d!7148 (= lt!32802 (lemmaIsPrefixRefl!0 (_2!1385 lt!32375)))))

(declare-fun lt!32803 () Unit!1928)

(declare-fun lt!32800 () Unit!1928)

(assert (=> d!7148 (= lt!32803 lt!32800)))

(assert (=> d!7148 (= lt!32800 (lemmaIsPrefixRefl!0 (_2!1385 lt!32375)))))

(declare-fun lt!32818 () Unit!1928)

(declare-fun lt!32807 () Unit!1928)

(assert (=> d!7148 (= lt!32818 lt!32807)))

(assert (=> d!7148 (isPrefixOf!0 lt!32811 lt!32811)))

(assert (=> d!7148 (= lt!32807 (lemmaIsPrefixRefl!0 lt!32811))))

(declare-fun lt!32812 () Unit!1928)

(declare-fun lt!32804 () Unit!1928)

(assert (=> d!7148 (= lt!32812 lt!32804)))

(assert (=> d!7148 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!7148 (= lt!32804 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!7148 (= lt!32811 (BitStream!1153 (buf!977 (_2!1385 lt!32375)) (currentByte!2284 thiss!1379) (currentBit!2279 thiss!1379)))))

(assert (=> d!7148 (isPrefixOf!0 thiss!1379 (_2!1385 lt!32375))))

(assert (=> d!7148 (= (reader!0 thiss!1379 (_2!1385 lt!32375)) lt!32806)))

(declare-fun b!22476 () Bool)

(declare-fun res!19351 () Bool)

(assert (=> b!22476 (=> (not res!19351) (not e!15184))))

(assert (=> b!22476 (= res!19351 (isPrefixOf!0 (_2!1384 lt!32806) (_2!1385 lt!32375)))))

(declare-fun b!22477 () Bool)

(declare-fun res!19350 () Bool)

(assert (=> b!22477 (=> (not res!19350) (not e!15184))))

(assert (=> b!22477 (= res!19350 (isPrefixOf!0 (_1!1384 lt!32806) thiss!1379))))

(declare-fun b!22478 () Bool)

(declare-fun Unit!1939 () Unit!1928)

(assert (=> b!22478 (= e!15183 Unit!1939)))

(assert (= (and d!7148 c!1615) b!22475))

(assert (= (and d!7148 (not c!1615)) b!22478))

(assert (= (and d!7148 res!19349) b!22477))

(assert (= (and b!22477 res!19350) b!22476))

(assert (= (and b!22476 res!19351) b!22474))

(declare-fun m!31319 () Bool)

(assert (=> b!22477 m!31319))

(declare-fun m!31321 () Bool)

(assert (=> b!22474 m!31321))

(assert (=> b!22474 m!31103))

(assert (=> b!22474 m!31035))

(assert (=> b!22475 m!31035))

(declare-fun m!31323 () Bool)

(assert (=> b!22475 m!31323))

(declare-fun m!31325 () Bool)

(assert (=> b!22475 m!31325))

(declare-fun m!31327 () Bool)

(assert (=> b!22476 m!31327))

(declare-fun m!31329 () Bool)

(assert (=> d!7148 m!31329))

(declare-fun m!31331 () Bool)

(assert (=> d!7148 m!31331))

(declare-fun m!31333 () Bool)

(assert (=> d!7148 m!31333))

(assert (=> d!7148 m!31233))

(assert (=> d!7148 m!31031))

(declare-fun m!31335 () Bool)

(assert (=> d!7148 m!31335))

(declare-fun m!31337 () Bool)

(assert (=> d!7148 m!31337))

(assert (=> d!7148 m!30993))

(assert (=> d!7148 m!31033))

(assert (=> d!7148 m!31231))

(declare-fun m!31339 () Bool)

(assert (=> d!7148 m!31339))

(assert (=> b!22283 d!7148))

(declare-fun d!7150 () Bool)

(declare-fun e!15187 () Bool)

(assert (=> d!7150 e!15187))

(declare-fun res!19356 () Bool)

(assert (=> d!7150 (=> (not res!19356) (not e!15187))))

(declare-fun lt!32834 () (_ BitVec 64))

(declare-fun lt!32836 () (_ BitVec 64))

(declare-fun lt!32832 () (_ BitVec 64))

(assert (=> d!7150 (= res!19356 (= lt!32832 (bvsub lt!32836 lt!32834)))))

(assert (=> d!7150 (or (= (bvand lt!32836 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!32834 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!32836 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!32836 lt!32834) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!7150 (= lt!32834 (remainingBits!0 ((_ sign_extend 32) (size!659 (buf!977 (_2!1385 lt!32377)))) ((_ sign_extend 32) (currentByte!2284 (_2!1385 lt!32377))) ((_ sign_extend 32) (currentBit!2279 (_2!1385 lt!32377)))))))

(declare-fun lt!32835 () (_ BitVec 64))

(declare-fun lt!32831 () (_ BitVec 64))

(assert (=> d!7150 (= lt!32836 (bvmul lt!32835 lt!32831))))

(assert (=> d!7150 (or (= lt!32835 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!32831 (bvsdiv (bvmul lt!32835 lt!32831) lt!32835)))))

(assert (=> d!7150 (= lt!32831 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!7150 (= lt!32835 ((_ sign_extend 32) (size!659 (buf!977 (_2!1385 lt!32377)))))))

(assert (=> d!7150 (= lt!32832 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2284 (_2!1385 lt!32377))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2279 (_2!1385 lt!32377)))))))

(assert (=> d!7150 (invariant!0 (currentBit!2279 (_2!1385 lt!32377)) (currentByte!2284 (_2!1385 lt!32377)) (size!659 (buf!977 (_2!1385 lt!32377))))))

(assert (=> d!7150 (= (bitIndex!0 (size!659 (buf!977 (_2!1385 lt!32377))) (currentByte!2284 (_2!1385 lt!32377)) (currentBit!2279 (_2!1385 lt!32377))) lt!32832)))

(declare-fun b!22483 () Bool)

(declare-fun res!19357 () Bool)

(assert (=> b!22483 (=> (not res!19357) (not e!15187))))

(assert (=> b!22483 (= res!19357 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!32832))))

(declare-fun b!22484 () Bool)

(declare-fun lt!32833 () (_ BitVec 64))

(assert (=> b!22484 (= e!15187 (bvsle lt!32832 (bvmul lt!32833 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!22484 (or (= lt!32833 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!32833 #b0000000000000000000000000000000000000000000000000000000000001000) lt!32833)))))

(assert (=> b!22484 (= lt!32833 ((_ sign_extend 32) (size!659 (buf!977 (_2!1385 lt!32377)))))))

(assert (= (and d!7150 res!19356) b!22483))

(assert (= (and b!22483 res!19357) b!22484))

(declare-fun m!31341 () Bool)

(assert (=> d!7150 m!31341))

(assert (=> d!7150 m!31013))

(assert (=> b!22280 d!7150))

(declare-fun d!7152 () Bool)

(assert (=> d!7152 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!659 (buf!977 thiss!1379))) ((_ sign_extend 32) (currentByte!2284 thiss!1379)) ((_ sign_extend 32) (currentBit!2279 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!659 (buf!977 thiss!1379))) ((_ sign_extend 32) (currentByte!2284 thiss!1379)) ((_ sign_extend 32) (currentBit!2279 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2070 () Bool)

(assert (= bs!2070 d!7152))

(declare-fun m!31343 () Bool)

(assert (=> bs!2070 m!31343))

(assert (=> b!22274 d!7152))

(declare-fun d!7154 () Bool)

(assert (=> d!7154 (= (array_inv!629 srcBuffer!2) (bvsge (size!659 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!5490 d!7154))

(declare-fun d!7156 () Bool)

(assert (=> d!7156 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2279 thiss!1379) (currentByte!2284 thiss!1379) (size!659 (buf!977 thiss!1379))))))

(declare-fun bs!2071 () Bool)

(assert (= bs!2071 d!7156))

(declare-fun m!31345 () Bool)

(assert (=> bs!2071 m!31345))

(assert (=> start!5490 d!7156))

(declare-fun d!7158 () Bool)

(declare-fun res!19359 () Bool)

(declare-fun e!15189 () Bool)

(assert (=> d!7158 (=> (not res!19359) (not e!15189))))

(assert (=> d!7158 (= res!19359 (= (size!659 (buf!977 thiss!1379)) (size!659 (buf!977 (_2!1385 lt!32375)))))))

(assert (=> d!7158 (= (isPrefixOf!0 thiss!1379 (_2!1385 lt!32375)) e!15189)))

(declare-fun b!22485 () Bool)

(declare-fun res!19360 () Bool)

(assert (=> b!22485 (=> (not res!19360) (not e!15189))))

(assert (=> b!22485 (= res!19360 (bvsle (bitIndex!0 (size!659 (buf!977 thiss!1379)) (currentByte!2284 thiss!1379) (currentBit!2279 thiss!1379)) (bitIndex!0 (size!659 (buf!977 (_2!1385 lt!32375))) (currentByte!2284 (_2!1385 lt!32375)) (currentBit!2279 (_2!1385 lt!32375)))))))

(declare-fun b!22486 () Bool)

(declare-fun e!15188 () Bool)

(assert (=> b!22486 (= e!15189 e!15188)))

(declare-fun res!19358 () Bool)

(assert (=> b!22486 (=> res!19358 e!15188)))

(assert (=> b!22486 (= res!19358 (= (size!659 (buf!977 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!22487 () Bool)

(assert (=> b!22487 (= e!15188 (arrayBitRangesEq!0 (buf!977 thiss!1379) (buf!977 (_2!1385 lt!32375)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!659 (buf!977 thiss!1379)) (currentByte!2284 thiss!1379) (currentBit!2279 thiss!1379))))))

(assert (= (and d!7158 res!19359) b!22485))

(assert (= (and b!22485 res!19360) b!22486))

(assert (= (and b!22486 (not res!19358)) b!22487))

(assert (=> b!22485 m!31035))

(assert (=> b!22485 m!31103))

(assert (=> b!22487 m!31035))

(assert (=> b!22487 m!31035))

(declare-fun m!31347 () Bool)

(assert (=> b!22487 m!31347))

(assert (=> b!22279 d!7158))

(declare-fun d!7160 () Bool)

(assert (=> d!7160 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!659 (buf!977 (_2!1385 lt!32375)))) ((_ sign_extend 32) (currentByte!2284 (_2!1385 lt!32375))) ((_ sign_extend 32) (currentBit!2279 (_2!1385 lt!32375))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!659 (buf!977 (_2!1385 lt!32375)))) ((_ sign_extend 32) (currentByte!2284 (_2!1385 lt!32375))) ((_ sign_extend 32) (currentBit!2279 (_2!1385 lt!32375)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!2072 () Bool)

(assert (= bs!2072 d!7160))

(declare-fun m!31349 () Bool)

(assert (=> bs!2072 m!31349))

(assert (=> b!22279 d!7160))

(declare-fun d!7162 () Bool)

(declare-fun e!15192 () Bool)

(assert (=> d!7162 e!15192))

(declare-fun res!19363 () Bool)

(assert (=> d!7162 (=> (not res!19363) (not e!15192))))

(assert (=> d!7162 (= res!19363 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!32839 () Unit!1928)

(declare-fun choose!27 (BitStream!1152 BitStream!1152 (_ BitVec 64) (_ BitVec 64)) Unit!1928)

(assert (=> d!7162 (= lt!32839 (choose!27 thiss!1379 (_2!1385 lt!32375) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!7162 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!7162 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1385 lt!32375) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!32839)))

(declare-fun b!22490 () Bool)

(assert (=> b!22490 (= e!15192 (validate_offset_bits!1 ((_ sign_extend 32) (size!659 (buf!977 (_2!1385 lt!32375)))) ((_ sign_extend 32) (currentByte!2284 (_2!1385 lt!32375))) ((_ sign_extend 32) (currentBit!2279 (_2!1385 lt!32375))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!7162 res!19363) b!22490))

(declare-fun m!31351 () Bool)

(assert (=> d!7162 m!31351))

(assert (=> b!22490 m!30997))

(assert (=> b!22279 d!7162))

(declare-fun b!22513 () Bool)

(declare-fun e!15206 () Bool)

(declare-datatypes ((tuple2!2608 0))(
  ( (tuple2!2609 (_1!1389 BitStream!1152) (_2!1389 Bool)) )
))
(declare-fun lt!32948 () tuple2!2608)

(declare-fun lt!32947 () tuple2!2600)

(assert (=> b!22513 (= e!15206 (= (bitIndex!0 (size!659 (buf!977 (_1!1389 lt!32948))) (currentByte!2284 (_1!1389 lt!32948)) (currentBit!2279 (_1!1389 lt!32948))) (bitIndex!0 (size!659 (buf!977 (_2!1385 lt!32947))) (currentByte!2284 (_2!1385 lt!32947)) (currentBit!2279 (_2!1385 lt!32947)))))))

(declare-fun b!22514 () Bool)

(declare-fun e!15203 () Bool)

(declare-fun lt!32943 () tuple2!2608)

(declare-fun lt!32946 () tuple2!2600)

(assert (=> b!22514 (= e!15203 (= (bitIndex!0 (size!659 (buf!977 (_1!1389 lt!32943))) (currentByte!2284 (_1!1389 lt!32943)) (currentBit!2279 (_1!1389 lt!32943))) (bitIndex!0 (size!659 (buf!977 (_2!1385 lt!32946))) (currentByte!2284 (_2!1385 lt!32946)) (currentBit!2279 (_2!1385 lt!32946)))))))

(declare-fun b!22515 () Bool)

(declare-fun res!19383 () Bool)

(declare-fun e!15205 () Bool)

(assert (=> b!22515 (=> (not res!19383) (not e!15205))))

(assert (=> b!22515 (= res!19383 (isPrefixOf!0 thiss!1379 (_2!1385 lt!32946)))))

(declare-fun b!22516 () Bool)

(declare-fun res!19381 () Bool)

(declare-fun e!15204 () Bool)

(assert (=> b!22516 (=> (not res!19381) (not e!15204))))

(assert (=> b!22516 (= res!19381 (isPrefixOf!0 thiss!1379 (_2!1385 lt!32947)))))

(declare-fun b!22517 () Bool)

(assert (=> b!22517 (= e!15204 e!15206)))

(declare-fun res!19384 () Bool)

(assert (=> b!22517 (=> (not res!19384) (not e!15206))))

(declare-fun lt!32950 () (_ BitVec 8))

(assert (=> b!22517 (= res!19384 (and (= (_2!1389 lt!32948) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1112 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!32950)) #b00000000000000000000000000000000))) (= (_1!1389 lt!32948) (_2!1385 lt!32947))))))

(declare-fun lt!32942 () tuple2!2606)

(declare-fun lt!32940 () BitStream!1152)

(assert (=> b!22517 (= lt!32942 (readBits!0 lt!32940 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!1152) tuple2!2608)

(assert (=> b!22517 (= lt!32948 (readBitPure!0 lt!32940))))

(declare-fun readerFrom!0 (BitStream!1152 (_ BitVec 32) (_ BitVec 32)) BitStream!1152)

(assert (=> b!22517 (= lt!32940 (readerFrom!0 (_2!1385 lt!32947) (currentBit!2279 thiss!1379) (currentByte!2284 thiss!1379)))))

(declare-fun b!22518 () Bool)

(assert (=> b!22518 (= e!15205 e!15203)))

(declare-fun res!19385 () Bool)

(assert (=> b!22518 (=> (not res!19385) (not e!15203))))

(declare-fun lt!32951 () Bool)

(assert (=> b!22518 (= res!19385 (and (= (_2!1389 lt!32943) lt!32951) (= (_1!1389 lt!32943) (_2!1385 lt!32946))))))

(assert (=> b!22518 (= lt!32943 (readBitPure!0 (readerFrom!0 (_2!1385 lt!32946) (currentBit!2279 thiss!1379) (currentByte!2284 thiss!1379))))))

(declare-fun b!22519 () Bool)

(declare-fun res!19382 () Bool)

(assert (=> b!22519 (=> (not res!19382) (not e!15204))))

(declare-fun lt!32941 () (_ BitVec 64))

(declare-fun lt!32949 () (_ BitVec 64))

(assert (=> b!22519 (= res!19382 (= (bitIndex!0 (size!659 (buf!977 (_2!1385 lt!32947))) (currentByte!2284 (_2!1385 lt!32947)) (currentBit!2279 (_2!1385 lt!32947))) (bvadd lt!32949 lt!32941)))))

(assert (=> b!22519 (or (not (= (bvand lt!32949 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!32941 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!32949 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!32949 lt!32941) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!22519 (= lt!32941 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!22519 (= lt!32949 (bitIndex!0 (size!659 (buf!977 thiss!1379)) (currentByte!2284 thiss!1379) (currentBit!2279 thiss!1379)))))

(declare-fun b!22512 () Bool)

(declare-fun res!19387 () Bool)

(assert (=> b!22512 (=> (not res!19387) (not e!15205))))

(assert (=> b!22512 (= res!19387 (= (bitIndex!0 (size!659 (buf!977 (_2!1385 lt!32946))) (currentByte!2284 (_2!1385 lt!32946)) (currentBit!2279 (_2!1385 lt!32946))) (bvadd (bitIndex!0 (size!659 (buf!977 thiss!1379)) (currentByte!2284 thiss!1379) (currentBit!2279 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun d!7164 () Bool)

(assert (=> d!7164 e!15204))

(declare-fun res!19386 () Bool)

(assert (=> d!7164 (=> (not res!19386) (not e!15204))))

(assert (=> d!7164 (= res!19386 (= (size!659 (buf!977 (_2!1385 lt!32947))) (size!659 (buf!977 thiss!1379))))))

(declare-fun lt!32945 () array!1546)

(assert (=> d!7164 (= lt!32950 (select (arr!1112 lt!32945) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!7164 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!659 lt!32945)))))

(assert (=> d!7164 (= lt!32945 (array!1547 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!32944 () tuple2!2600)

(assert (=> d!7164 (= lt!32947 (tuple2!2601 (_1!1385 lt!32944) (_2!1385 lt!32944)))))

(assert (=> d!7164 (= lt!32944 lt!32946)))

(assert (=> d!7164 e!15205))

(declare-fun res!19380 () Bool)

(assert (=> d!7164 (=> (not res!19380) (not e!15205))))

(assert (=> d!7164 (= res!19380 (= (size!659 (buf!977 thiss!1379)) (size!659 (buf!977 (_2!1385 lt!32946)))))))

(declare-fun appendBit!0 (BitStream!1152 Bool) tuple2!2600)

(assert (=> d!7164 (= lt!32946 (appendBit!0 thiss!1379 lt!32951))))

(assert (=> d!7164 (= lt!32951 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1112 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!7164 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!7164 (= (appendBitFromByte!0 thiss!1379 (select (arr!1112 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!32947)))

(assert (= (and d!7164 res!19380) b!22512))

(assert (= (and b!22512 res!19387) b!22515))

(assert (= (and b!22515 res!19383) b!22518))

(assert (= (and b!22518 res!19385) b!22514))

(assert (= (and d!7164 res!19386) b!22519))

(assert (= (and b!22519 res!19382) b!22516))

(assert (= (and b!22516 res!19381) b!22517))

(assert (= (and b!22517 res!19384) b!22513))

(declare-fun m!31353 () Bool)

(assert (=> b!22517 m!31353))

(declare-fun m!31355 () Bool)

(assert (=> b!22517 m!31355))

(declare-fun m!31357 () Bool)

(assert (=> b!22517 m!31357))

(declare-fun m!31359 () Bool)

(assert (=> b!22516 m!31359))

(declare-fun m!31361 () Bool)

(assert (=> d!7164 m!31361))

(declare-fun m!31363 () Bool)

(assert (=> d!7164 m!31363))

(declare-fun m!31365 () Bool)

(assert (=> d!7164 m!31365))

(declare-fun m!31367 () Bool)

(assert (=> b!22514 m!31367))

(declare-fun m!31369 () Bool)

(assert (=> b!22514 m!31369))

(declare-fun m!31371 () Bool)

(assert (=> b!22518 m!31371))

(assert (=> b!22518 m!31371))

(declare-fun m!31373 () Bool)

(assert (=> b!22518 m!31373))

(assert (=> b!22512 m!31369))

(assert (=> b!22512 m!31035))

(declare-fun m!31375 () Bool)

(assert (=> b!22513 m!31375))

(declare-fun m!31377 () Bool)

(assert (=> b!22513 m!31377))

(assert (=> b!22519 m!31377))

(assert (=> b!22519 m!31035))

(declare-fun m!31379 () Bool)

(assert (=> b!22515 m!31379))

(assert (=> b!22279 d!7164))

(declare-fun d!7166 () Bool)

(assert (=> d!7166 (= (head!114 (byteArrayBitContentToList!0 (_2!1385 lt!32375) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!392 (byteArrayBitContentToList!0 (_2!1385 lt!32375) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!22276 d!7166))

(declare-fun d!7168 () Bool)

(declare-fun c!1620 () Bool)

(assert (=> d!7168 (= c!1620 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!15213 () List!277)

(assert (=> d!7168 (= (byteArrayBitContentToList!0 (_2!1385 lt!32375) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!15213)))

(declare-fun b!22536 () Bool)

(assert (=> b!22536 (= e!15213 Nil!274)))

(declare-fun b!22537 () Bool)

(assert (=> b!22537 (= e!15213 (Cons!273 (not (= (bvand ((_ sign_extend 24) (select (arr!1112 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1385 lt!32375) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!7168 c!1620) b!22536))

(assert (= (and d!7168 (not c!1620)) b!22537))

(assert (=> b!22537 m!30995))

(assert (=> b!22537 m!31365))

(declare-fun m!31381 () Bool)

(assert (=> b!22537 m!31381))

(assert (=> b!22276 d!7168))

(declare-fun d!7170 () Bool)

(assert (=> d!7170 (= (head!114 (bitStreamReadBitsIntoList!0 (_2!1385 lt!32375) (_1!1384 lt!32378) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!392 (bitStreamReadBitsIntoList!0 (_2!1385 lt!32375) (_1!1384 lt!32378) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!22276 d!7170))

(declare-fun b!22554 () Bool)

(declare-datatypes ((tuple2!2610 0))(
  ( (tuple2!2611 (_1!1390 List!277) (_2!1390 BitStream!1152)) )
))
(declare-fun e!15222 () tuple2!2610)

(assert (=> b!22554 (= e!15222 (tuple2!2611 Nil!274 (_1!1384 lt!32378)))))

(declare-fun d!7172 () Bool)

(declare-fun e!15221 () Bool)

(assert (=> d!7172 e!15221))

(declare-fun c!1626 () Bool)

(assert (=> d!7172 (= c!1626 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!33015 () List!277)

(assert (=> d!7172 (= lt!33015 (_1!1390 e!15222))))

(declare-fun c!1627 () Bool)

(assert (=> d!7172 (= c!1627 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!7172 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!7172 (= (bitStreamReadBitsIntoList!0 (_2!1385 lt!32375) (_1!1384 lt!32378) #b0000000000000000000000000000000000000000000000000000000000000001) lt!33015)))

(declare-fun b!22556 () Bool)

(declare-fun isEmpty!61 (List!277) Bool)

(assert (=> b!22556 (= e!15221 (isEmpty!61 lt!33015))))

(declare-fun b!22557 () Bool)

(declare-fun length!56 (List!277) Int)

(assert (=> b!22557 (= e!15221 (> (length!56 lt!33015) 0))))

(declare-fun b!22555 () Bool)

(declare-datatypes ((tuple2!2612 0))(
  ( (tuple2!2613 (_1!1391 Bool) (_2!1391 BitStream!1152)) )
))
(declare-fun lt!33016 () tuple2!2612)

(declare-fun lt!33014 () (_ BitVec 64))

(assert (=> b!22555 (= e!15222 (tuple2!2611 (Cons!273 (_1!1391 lt!33016) (bitStreamReadBitsIntoList!0 (_2!1385 lt!32375) (_2!1391 lt!33016) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!33014))) (_2!1391 lt!33016)))))

(declare-fun readBit!0 (BitStream!1152) tuple2!2612)

(assert (=> b!22555 (= lt!33016 (readBit!0 (_1!1384 lt!32378)))))

(assert (=> b!22555 (= lt!33014 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!7172 c!1627) b!22554))

(assert (= (and d!7172 (not c!1627)) b!22555))

(assert (= (and d!7172 c!1626) b!22556))

(assert (= (and d!7172 (not c!1626)) b!22557))

(declare-fun m!31469 () Bool)

(assert (=> b!22556 m!31469))

(declare-fun m!31471 () Bool)

(assert (=> b!22557 m!31471))

(declare-fun m!31473 () Bool)

(assert (=> b!22555 m!31473))

(declare-fun m!31475 () Bool)

(assert (=> b!22555 m!31475))

(assert (=> b!22276 d!7172))

(declare-fun d!7176 () Bool)

(assert (=> d!7176 (= (invariant!0 (currentBit!2279 (_2!1385 lt!32377)) (currentByte!2284 (_2!1385 lt!32377)) (size!659 (buf!977 (_2!1385 lt!32377)))) (and (bvsge (currentBit!2279 (_2!1385 lt!32377)) #b00000000000000000000000000000000) (bvslt (currentBit!2279 (_2!1385 lt!32377)) #b00000000000000000000000000001000) (bvsge (currentByte!2284 (_2!1385 lt!32377)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2284 (_2!1385 lt!32377)) (size!659 (buf!977 (_2!1385 lt!32377)))) (and (= (currentBit!2279 (_2!1385 lt!32377)) #b00000000000000000000000000000000) (= (currentByte!2284 (_2!1385 lt!32377)) (size!659 (buf!977 (_2!1385 lt!32377))))))))))

(assert (=> b!22281 d!7176))

(declare-fun d!7178 () Bool)

(declare-fun res!19410 () Bool)

(declare-fun e!15226 () Bool)

(assert (=> d!7178 (=> (not res!19410) (not e!15226))))

(assert (=> d!7178 (= res!19410 (= (size!659 (buf!977 thiss!1379)) (size!659 (buf!977 thiss!1379))))))

(assert (=> d!7178 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!15226)))

(declare-fun b!22561 () Bool)

(declare-fun res!19411 () Bool)

(assert (=> b!22561 (=> (not res!19411) (not e!15226))))

(assert (=> b!22561 (= res!19411 (bvsle (bitIndex!0 (size!659 (buf!977 thiss!1379)) (currentByte!2284 thiss!1379) (currentBit!2279 thiss!1379)) (bitIndex!0 (size!659 (buf!977 thiss!1379)) (currentByte!2284 thiss!1379) (currentBit!2279 thiss!1379))))))

(declare-fun b!22562 () Bool)

(declare-fun e!15225 () Bool)

(assert (=> b!22562 (= e!15226 e!15225)))

(declare-fun res!19409 () Bool)

(assert (=> b!22562 (=> res!19409 e!15225)))

(assert (=> b!22562 (= res!19409 (= (size!659 (buf!977 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!22563 () Bool)

(assert (=> b!22563 (= e!15225 (arrayBitRangesEq!0 (buf!977 thiss!1379) (buf!977 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!659 (buf!977 thiss!1379)) (currentByte!2284 thiss!1379) (currentBit!2279 thiss!1379))))))

(assert (= (and d!7178 res!19410) b!22561))

(assert (= (and b!22561 res!19411) b!22562))

(assert (= (and b!22562 (not res!19409)) b!22563))

(assert (=> b!22561 m!31035))

(assert (=> b!22561 m!31035))

(assert (=> b!22563 m!31035))

(assert (=> b!22563 m!31035))

(declare-fun m!31479 () Bool)

(assert (=> b!22563 m!31479))

(assert (=> b!22275 d!7178))

(declare-fun d!7182 () Bool)

(assert (=> d!7182 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!33019 () Unit!1928)

(declare-fun choose!11 (BitStream!1152) Unit!1928)

(assert (=> d!7182 (= lt!33019 (choose!11 thiss!1379))))

(assert (=> d!7182 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!33019)))

(declare-fun bs!2075 () Bool)

(assert (= bs!2075 d!7182))

(assert (=> bs!2075 m!31031))

(declare-fun m!31483 () Bool)

(assert (=> bs!2075 m!31483))

(assert (=> b!22275 d!7182))

(declare-fun d!7186 () Bool)

(declare-fun e!15227 () Bool)

(assert (=> d!7186 e!15227))

(declare-fun res!19412 () Bool)

(assert (=> d!7186 (=> (not res!19412) (not e!15227))))

(declare-fun lt!33023 () (_ BitVec 64))

(declare-fun lt!33025 () (_ BitVec 64))

(declare-fun lt!33027 () (_ BitVec 64))

(assert (=> d!7186 (= res!19412 (= lt!33023 (bvsub lt!33027 lt!33025)))))

(assert (=> d!7186 (or (= (bvand lt!33027 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!33025 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!33027 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!33027 lt!33025) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!7186 (= lt!33025 (remainingBits!0 ((_ sign_extend 32) (size!659 (buf!977 thiss!1379))) ((_ sign_extend 32) (currentByte!2284 thiss!1379)) ((_ sign_extend 32) (currentBit!2279 thiss!1379))))))

(declare-fun lt!33026 () (_ BitVec 64))

(declare-fun lt!33022 () (_ BitVec 64))

(assert (=> d!7186 (= lt!33027 (bvmul lt!33026 lt!33022))))

(assert (=> d!7186 (or (= lt!33026 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!33022 (bvsdiv (bvmul lt!33026 lt!33022) lt!33026)))))

(assert (=> d!7186 (= lt!33022 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!7186 (= lt!33026 ((_ sign_extend 32) (size!659 (buf!977 thiss!1379))))))

(assert (=> d!7186 (= lt!33023 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2284 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2279 thiss!1379))))))

(assert (=> d!7186 (invariant!0 (currentBit!2279 thiss!1379) (currentByte!2284 thiss!1379) (size!659 (buf!977 thiss!1379)))))

(assert (=> d!7186 (= (bitIndex!0 (size!659 (buf!977 thiss!1379)) (currentByte!2284 thiss!1379) (currentBit!2279 thiss!1379)) lt!33023)))

(declare-fun b!22564 () Bool)

(declare-fun res!19413 () Bool)

(assert (=> b!22564 (=> (not res!19413) (not e!15227))))

(assert (=> b!22564 (= res!19413 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!33023))))

(declare-fun b!22565 () Bool)

(declare-fun lt!33024 () (_ BitVec 64))

(assert (=> b!22565 (= e!15227 (bvsle lt!33023 (bvmul lt!33024 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!22565 (or (= lt!33024 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!33024 #b0000000000000000000000000000000000000000000000000000000000001000) lt!33024)))))

(assert (=> b!22565 (= lt!33024 ((_ sign_extend 32) (size!659 (buf!977 thiss!1379))))))

(assert (= (and d!7186 res!19412) b!22564))

(assert (= (and b!22564 res!19413) b!22565))

(assert (=> d!7186 m!31343))

(assert (=> d!7186 m!31345))

(assert (=> b!22275 d!7186))

(check-sat (not b!22487) (not b!22476) (not b!22459) (not d!7164) (not b!22514) (not d!7092) (not b!22474) (not b!22561) (not b!22325) (not b!22515) (not b!22490) (not b!22518) (not d!7182) (not b!22461) (not b!22457) (not b!22519) (not d!7148) (not b!22477) (not bm!320) (not d!7186) (not b!22323) (not d!7082) (not b!22463) (not b!22512) (not b!22475) (not d!7162) (not b!22557) (not b!22516) (not d!7152) (not b!22563) (not b!22513) (not d!7084) (not b!22320) (not b!22517) (not b!22485) (not b!22458) (not b!22537) (not d!7086) (not b!22555) (not b!22556) (not b!22460) (not d!7150) (not d!7160) (not b!22322) (not d!7156))
(check-sat)
