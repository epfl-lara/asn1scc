; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5492 () Bool)

(assert start!5492)

(declare-fun b!22304 () Bool)

(declare-fun e!15100 () Bool)

(declare-datatypes ((array!1548 0))(
  ( (array!1549 (arr!1113 (Array (_ BitVec 32) (_ BitVec 8))) (size!660 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1154 0))(
  ( (BitStream!1155 (buf!978 array!1548) (currentByte!2285 (_ BitVec 32)) (currentBit!2280 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!1930 0))(
  ( (Unit!1931) )
))
(declare-datatypes ((tuple2!2602 0))(
  ( (tuple2!2603 (_1!1386 Unit!1930) (_2!1386 BitStream!1154)) )
))
(declare-fun lt!32403 () tuple2!2602)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!22304 (= e!15100 (invariant!0 (currentBit!2280 (_2!1386 lt!32403)) (currentByte!2285 (_2!1386 lt!32403)) (size!660 (buf!978 (_2!1386 lt!32403)))))))

(declare-fun lt!32399 () tuple2!2602)

(declare-fun thiss!1379 () BitStream!1154)

(assert (=> b!22304 (= (size!660 (buf!978 (_2!1386 lt!32399))) (size!660 (buf!978 thiss!1379)))))

(declare-fun b!22305 () Bool)

(declare-fun res!19228 () Bool)

(assert (=> b!22305 (=> res!19228 e!15100)))

(assert (=> b!22305 (= res!19228 (not (invariant!0 (currentBit!2280 (_2!1386 lt!32399)) (currentByte!2285 (_2!1386 lt!32399)) (size!660 (buf!978 (_2!1386 lt!32399))))))))

(declare-fun b!22306 () Bool)

(declare-fun res!19221 () Bool)

(assert (=> b!22306 (=> res!19221 e!15100)))

(assert (=> b!22306 (= res!19221 (not (= (size!660 (buf!978 thiss!1379)) (size!660 (buf!978 (_2!1386 lt!32399))))))))

(declare-fun res!19227 () Bool)

(declare-fun e!15102 () Bool)

(assert (=> start!5492 (=> (not res!19227) (not e!15102))))

(declare-fun srcBuffer!2 () array!1548)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!5492 (= res!19227 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!660 srcBuffer!2))))))))

(assert (=> start!5492 e!15102))

(assert (=> start!5492 true))

(declare-fun array_inv!630 (array!1548) Bool)

(assert (=> start!5492 (array_inv!630 srcBuffer!2)))

(declare-fun e!15096 () Bool)

(declare-fun inv!12 (BitStream!1154) Bool)

(assert (=> start!5492 (and (inv!12 thiss!1379) e!15096)))

(declare-fun b!22307 () Bool)

(declare-fun res!19222 () Bool)

(assert (=> b!22307 (=> (not res!19222) (not e!15102))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!22307 (= res!19222 (validate_offset_bits!1 ((_ sign_extend 32) (size!660 (buf!978 thiss!1379))) ((_ sign_extend 32) (currentByte!2285 thiss!1379)) ((_ sign_extend 32) (currentBit!2280 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!22308 () Bool)

(declare-fun e!15099 () Bool)

(assert (=> b!22308 (= e!15102 (not e!15099))))

(declare-fun res!19225 () Bool)

(assert (=> b!22308 (=> res!19225 e!15099)))

(assert (=> b!22308 (= res!19225 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1154 BitStream!1154) Bool)

(assert (=> b!22308 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!32397 () Unit!1930)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1154) Unit!1930)

(assert (=> b!22308 (= lt!32397 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!32400 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!22308 (= lt!32400 (bitIndex!0 (size!660 (buf!978 thiss!1379)) (currentByte!2285 thiss!1379) (currentBit!2280 thiss!1379)))))

(declare-fun b!22309 () Bool)

(declare-fun e!15095 () Bool)

(assert (=> b!22309 (= e!15099 e!15095)))

(declare-fun res!19223 () Bool)

(assert (=> b!22309 (=> res!19223 e!15095)))

(assert (=> b!22309 (= res!19223 (not (isPrefixOf!0 thiss!1379 (_2!1386 lt!32403))))))

(assert (=> b!22309 (validate_offset_bits!1 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!32403)))) ((_ sign_extend 32) (currentByte!2285 (_2!1386 lt!32403))) ((_ sign_extend 32) (currentBit!2280 (_2!1386 lt!32403))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!32404 () Unit!1930)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1154 BitStream!1154 (_ BitVec 64) (_ BitVec 64)) Unit!1930)

(assert (=> b!22309 (= lt!32404 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1386 lt!32403) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1154 (_ BitVec 8) (_ BitVec 32)) tuple2!2602)

(assert (=> b!22309 (= lt!32403 (appendBitFromByte!0 thiss!1379 (select (arr!1113 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!22310 () Bool)

(assert (=> b!22310 (= e!15096 (array_inv!630 (buf!978 thiss!1379)))))

(declare-fun b!22311 () Bool)

(assert (=> b!22311 (= e!15095 e!15100)))

(declare-fun res!19226 () Bool)

(assert (=> b!22311 (=> res!19226 e!15100)))

(assert (=> b!22311 (= res!19226 (not (isPrefixOf!0 (_2!1386 lt!32403) (_2!1386 lt!32399))))))

(assert (=> b!22311 (isPrefixOf!0 thiss!1379 (_2!1386 lt!32399))))

(declare-fun lt!32402 () Unit!1930)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1154 BitStream!1154 BitStream!1154) Unit!1930)

(assert (=> b!22311 (= lt!32402 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1386 lt!32403) (_2!1386 lt!32399)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1154 array!1548 (_ BitVec 64) (_ BitVec 64)) tuple2!2602)

(assert (=> b!22311 (= lt!32399 (appendBitsMSBFirstLoop!0 (_2!1386 lt!32403) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!15097 () Bool)

(assert (=> b!22311 e!15097))

(declare-fun res!19229 () Bool)

(assert (=> b!22311 (=> (not res!19229) (not e!15097))))

(assert (=> b!22311 (= res!19229 (validate_offset_bits!1 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!32403)))) ((_ sign_extend 32) (currentByte!2285 thiss!1379)) ((_ sign_extend 32) (currentBit!2280 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!32398 () Unit!1930)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1154 array!1548 (_ BitVec 64)) Unit!1930)

(assert (=> b!22311 (= lt!32398 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!978 (_2!1386 lt!32403)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!2604 0))(
  ( (tuple2!2605 (_1!1387 BitStream!1154) (_2!1387 BitStream!1154)) )
))
(declare-fun lt!32401 () tuple2!2604)

(declare-fun reader!0 (BitStream!1154 BitStream!1154) tuple2!2604)

(assert (=> b!22311 (= lt!32401 (reader!0 thiss!1379 (_2!1386 lt!32403)))))

(declare-fun b!22312 () Bool)

(declare-fun res!19224 () Bool)

(assert (=> b!22312 (=> res!19224 e!15100)))

(assert (=> b!22312 (= res!19224 (not (= (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!32399))) (currentByte!2285 (_2!1386 lt!32399)) (currentBit!2280 (_2!1386 lt!32399))) (bvsub (bvadd lt!32400 to!314) i!635))))))

(declare-fun b!22313 () Bool)

(declare-datatypes ((List!278 0))(
  ( (Nil!275) (Cons!274 (h!393 Bool) (t!1028 List!278)) )
))
(declare-fun head!115 (List!278) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1154 array!1548 (_ BitVec 64) (_ BitVec 64)) List!278)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1154 BitStream!1154 (_ BitVec 64)) List!278)

(assert (=> b!22313 (= e!15097 (= (head!115 (byteArrayBitContentToList!0 (_2!1386 lt!32403) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!115 (bitStreamReadBitsIntoList!0 (_2!1386 lt!32403) (_1!1387 lt!32401) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and start!5492 res!19227) b!22307))

(assert (= (and b!22307 res!19222) b!22308))

(assert (= (and b!22308 (not res!19225)) b!22309))

(assert (= (and b!22309 (not res!19223)) b!22311))

(assert (= (and b!22311 res!19229) b!22313))

(assert (= (and b!22311 (not res!19226)) b!22312))

(assert (= (and b!22312 (not res!19224)) b!22305))

(assert (= (and b!22305 (not res!19228)) b!22306))

(assert (= (and b!22306 (not res!19221)) b!22304))

(assert (= start!5492 b!22310))

(declare-fun m!31043 () Bool)

(assert (=> b!22312 m!31043))

(declare-fun m!31045 () Bool)

(assert (=> start!5492 m!31045))

(declare-fun m!31047 () Bool)

(assert (=> start!5492 m!31047))

(declare-fun m!31049 () Bool)

(assert (=> b!22311 m!31049))

(declare-fun m!31051 () Bool)

(assert (=> b!22311 m!31051))

(declare-fun m!31053 () Bool)

(assert (=> b!22311 m!31053))

(declare-fun m!31055 () Bool)

(assert (=> b!22311 m!31055))

(declare-fun m!31057 () Bool)

(assert (=> b!22311 m!31057))

(declare-fun m!31059 () Bool)

(assert (=> b!22311 m!31059))

(declare-fun m!31061 () Bool)

(assert (=> b!22311 m!31061))

(declare-fun m!31063 () Bool)

(assert (=> b!22309 m!31063))

(declare-fun m!31065 () Bool)

(assert (=> b!22309 m!31065))

(declare-fun m!31067 () Bool)

(assert (=> b!22309 m!31067))

(declare-fun m!31069 () Bool)

(assert (=> b!22309 m!31069))

(assert (=> b!22309 m!31065))

(declare-fun m!31071 () Bool)

(assert (=> b!22309 m!31071))

(declare-fun m!31073 () Bool)

(assert (=> b!22307 m!31073))

(declare-fun m!31075 () Bool)

(assert (=> b!22308 m!31075))

(declare-fun m!31077 () Bool)

(assert (=> b!22308 m!31077))

(declare-fun m!31079 () Bool)

(assert (=> b!22308 m!31079))

(declare-fun m!31081 () Bool)

(assert (=> b!22304 m!31081))

(declare-fun m!31083 () Bool)

(assert (=> b!22305 m!31083))

(declare-fun m!31085 () Bool)

(assert (=> b!22310 m!31085))

(declare-fun m!31087 () Bool)

(assert (=> b!22313 m!31087))

(assert (=> b!22313 m!31087))

(declare-fun m!31089 () Bool)

(assert (=> b!22313 m!31089))

(declare-fun m!31091 () Bool)

(assert (=> b!22313 m!31091))

(assert (=> b!22313 m!31091))

(declare-fun m!31093 () Bool)

(assert (=> b!22313 m!31093))

(push 1)

(assert (not b!22308))

(assert (not b!22310))

(assert (not b!22313))

(assert (not b!22304))

(assert (not b!22307))

(assert (not b!22305))

(assert (not b!22311))

(assert (not b!22312))

(assert (not b!22309))

(assert (not start!5492))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!7118 () Bool)

(declare-fun res!19270 () Bool)

(declare-fun e!15137 () Bool)

(assert (=> d!7118 (=> (not res!19270) (not e!15137))))

(assert (=> d!7118 (= res!19270 (= (size!660 (buf!978 thiss!1379)) (size!660 (buf!978 (_2!1386 lt!32403)))))))

(assert (=> d!7118 (= (isPrefixOf!0 thiss!1379 (_2!1386 lt!32403)) e!15137)))

(declare-fun b!22370 () Bool)

(declare-fun res!19268 () Bool)

(assert (=> b!22370 (=> (not res!19268) (not e!15137))))

(assert (=> b!22370 (= res!19268 (bvsle (bitIndex!0 (size!660 (buf!978 thiss!1379)) (currentByte!2285 thiss!1379) (currentBit!2280 thiss!1379)) (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!32403))) (currentByte!2285 (_2!1386 lt!32403)) (currentBit!2280 (_2!1386 lt!32403)))))))

(declare-fun b!22371 () Bool)

(declare-fun e!15136 () Bool)

(assert (=> b!22371 (= e!15137 e!15136)))

(declare-fun res!19269 () Bool)

(assert (=> b!22371 (=> res!19269 e!15136)))

(assert (=> b!22371 (= res!19269 (= (size!660 (buf!978 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!22372 () Bool)

(declare-fun arrayBitRangesEq!0 (array!1548 array!1548 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!22372 (= e!15136 (arrayBitRangesEq!0 (buf!978 thiss!1379) (buf!978 (_2!1386 lt!32403)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!660 (buf!978 thiss!1379)) (currentByte!2285 thiss!1379) (currentBit!2280 thiss!1379))))))

(assert (= (and d!7118 res!19270) b!22370))

(assert (= (and b!22370 res!19268) b!22371))

(assert (= (and b!22371 (not res!19269)) b!22372))

(assert (=> b!22370 m!31079))

(declare-fun m!31133 () Bool)

(assert (=> b!22370 m!31133))

(assert (=> b!22372 m!31079))

(assert (=> b!22372 m!31079))

(declare-fun m!31135 () Bool)

(assert (=> b!22372 m!31135))

(assert (=> b!22309 d!7118))

(declare-fun d!7120 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!7120 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!32403)))) ((_ sign_extend 32) (currentByte!2285 (_2!1386 lt!32403))) ((_ sign_extend 32) (currentBit!2280 (_2!1386 lt!32403))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!32403)))) ((_ sign_extend 32) (currentByte!2285 (_2!1386 lt!32403))) ((_ sign_extend 32) (currentBit!2280 (_2!1386 lt!32403)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!2066 () Bool)

(assert (= bs!2066 d!7120))

(declare-fun m!31137 () Bool)

(assert (=> bs!2066 m!31137))

(assert (=> b!22309 d!7120))

(declare-fun d!7122 () Bool)

(declare-fun e!15146 () Bool)

(assert (=> d!7122 e!15146))

(declare-fun res!19282 () Bool)

(assert (=> d!7122 (=> (not res!19282) (not e!15146))))

(assert (=> d!7122 (= res!19282 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!32509 () Unit!1930)

(declare-fun choose!27 (BitStream!1154 BitStream!1154 (_ BitVec 64) (_ BitVec 64)) Unit!1930)

(assert (=> d!7122 (= lt!32509 (choose!27 thiss!1379 (_2!1386 lt!32403) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!7122 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!7122 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1386 lt!32403) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!32509)))

(declare-fun b!22390 () Bool)

(assert (=> b!22390 (= e!15146 (validate_offset_bits!1 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!32403)))) ((_ sign_extend 32) (currentByte!2285 (_2!1386 lt!32403))) ((_ sign_extend 32) (currentBit!2280 (_2!1386 lt!32403))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!7122 res!19282) b!22390))

(declare-fun m!31165 () Bool)

(assert (=> d!7122 m!31165))

(assert (=> b!22390 m!31067))

(assert (=> b!22309 d!7122))

(declare-fun b!22408 () Bool)

(declare-fun res!19299 () Bool)

(declare-fun e!15157 () Bool)

(assert (=> b!22408 (=> (not res!19299) (not e!15157))))

(declare-fun lt!32545 () tuple2!2602)

(assert (=> b!22408 (= res!19299 (isPrefixOf!0 thiss!1379 (_2!1386 lt!32545)))))

(declare-fun b!22409 () Bool)

(declare-fun res!19305 () Bool)

(declare-fun e!15156 () Bool)

(assert (=> b!22409 (=> (not res!19305) (not e!15156))))

(declare-fun lt!32540 () tuple2!2602)

(declare-fun lt!32534 () (_ BitVec 64))

(declare-fun lt!32539 () (_ BitVec 64))

(assert (=> b!22409 (= res!19305 (= (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!32540))) (currentByte!2285 (_2!1386 lt!32540)) (currentBit!2280 (_2!1386 lt!32540))) (bvadd lt!32539 lt!32534)))))

(assert (=> b!22409 (or (not (= (bvand lt!32539 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!32534 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!32539 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!32539 lt!32534) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!22409 (= lt!32534 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!22409 (= lt!32539 (bitIndex!0 (size!660 (buf!978 thiss!1379)) (currentByte!2285 thiss!1379) (currentBit!2280 thiss!1379)))))

(declare-fun b!22410 () Bool)

(declare-fun res!19306 () Bool)

(assert (=> b!22410 (=> (not res!19306) (not e!15157))))

(assert (=> b!22410 (= res!19306 (= (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!32545))) (currentByte!2285 (_2!1386 lt!32545)) (currentBit!2280 (_2!1386 lt!32545))) (bvadd (bitIndex!0 (size!660 (buf!978 thiss!1379)) (currentByte!2285 thiss!1379) (currentBit!2280 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun d!7126 () Bool)

(assert (=> d!7126 e!15156))

(declare-fun res!19303 () Bool)

(assert (=> d!7126 (=> (not res!19303) (not e!15156))))

(assert (=> d!7126 (= res!19303 (= (size!660 (buf!978 (_2!1386 lt!32540))) (size!660 (buf!978 thiss!1379))))))

(declare-fun lt!32538 () (_ BitVec 8))

(declare-fun lt!32541 () array!1548)

(assert (=> d!7126 (= lt!32538 (select (arr!1113 lt!32541) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!7126 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!660 lt!32541)))))

(assert (=> d!7126 (= lt!32541 (array!1549 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!32544 () tuple2!2602)

(assert (=> d!7126 (= lt!32540 (tuple2!2603 (_1!1386 lt!32544) (_2!1386 lt!32544)))))

(assert (=> d!7126 (= lt!32544 lt!32545)))

(assert (=> d!7126 e!15157))

(declare-fun res!19300 () Bool)

(assert (=> d!7126 (=> (not res!19300) (not e!15157))))

(assert (=> d!7126 (= res!19300 (= (size!660 (buf!978 thiss!1379)) (size!660 (buf!978 (_2!1386 lt!32545)))))))

(declare-fun lt!32542 () Bool)

(declare-fun appendBit!0 (BitStream!1154 Bool) tuple2!2602)

(assert (=> d!7126 (= lt!32545 (appendBit!0 thiss!1379 lt!32542))))

(assert (=> d!7126 (= lt!32542 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1113 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!7126 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!7126 (= (appendBitFromByte!0 thiss!1379 (select (arr!1113 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!32540)))

(declare-fun b!22411 () Bool)

(declare-fun e!15155 () Bool)

(declare-datatypes ((tuple2!2622 0))(
  ( (tuple2!2623 (_1!1396 BitStream!1154) (_2!1396 Bool)) )
))
(declare-fun lt!32543 () tuple2!2622)

(assert (=> b!22411 (= e!15155 (= (bitIndex!0 (size!660 (buf!978 (_1!1396 lt!32543))) (currentByte!2285 (_1!1396 lt!32543)) (currentBit!2280 (_1!1396 lt!32543))) (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!32540))) (currentByte!2285 (_2!1386 lt!32540)) (currentBit!2280 (_2!1386 lt!32540)))))))

(declare-fun b!22412 () Bool)

(declare-fun e!15158 () Bool)

(declare-fun lt!32537 () tuple2!2622)

(assert (=> b!22412 (= e!15158 (= (bitIndex!0 (size!660 (buf!978 (_1!1396 lt!32537))) (currentByte!2285 (_1!1396 lt!32537)) (currentBit!2280 (_1!1396 lt!32537))) (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!32545))) (currentByte!2285 (_2!1386 lt!32545)) (currentBit!2280 (_2!1386 lt!32545)))))))

(declare-fun b!22413 () Bool)

(assert (=> b!22413 (= e!15156 e!15155)))

(declare-fun res!19301 () Bool)

(assert (=> b!22413 (=> (not res!19301) (not e!15155))))

(assert (=> b!22413 (= res!19301 (and (= (_2!1396 lt!32543) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1113 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!32538)) #b00000000000000000000000000000000))) (= (_1!1396 lt!32543) (_2!1386 lt!32540))))))

(declare-datatypes ((tuple2!2624 0))(
  ( (tuple2!2625 (_1!1397 array!1548) (_2!1397 BitStream!1154)) )
))
(declare-fun lt!32536 () tuple2!2624)

(declare-fun lt!32535 () BitStream!1154)

(declare-fun readBits!0 (BitStream!1154 (_ BitVec 64)) tuple2!2624)

(assert (=> b!22413 (= lt!32536 (readBits!0 lt!32535 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!1154) tuple2!2622)

(assert (=> b!22413 (= lt!32543 (readBitPure!0 lt!32535))))

(declare-fun readerFrom!0 (BitStream!1154 (_ BitVec 32) (_ BitVec 32)) BitStream!1154)

(assert (=> b!22413 (= lt!32535 (readerFrom!0 (_2!1386 lt!32540) (currentBit!2280 thiss!1379) (currentByte!2285 thiss!1379)))))

(declare-fun b!22414 () Bool)

(assert (=> b!22414 (= e!15157 e!15158)))

(declare-fun res!19304 () Bool)

(assert (=> b!22414 (=> (not res!19304) (not e!15158))))

(assert (=> b!22414 (= res!19304 (and (= (_2!1396 lt!32537) lt!32542) (= (_1!1396 lt!32537) (_2!1386 lt!32545))))))

(assert (=> b!22414 (= lt!32537 (readBitPure!0 (readerFrom!0 (_2!1386 lt!32545) (currentBit!2280 thiss!1379) (currentByte!2285 thiss!1379))))))

(declare-fun b!22415 () Bool)

(declare-fun res!19302 () Bool)

(assert (=> b!22415 (=> (not res!19302) (not e!15156))))

(assert (=> b!22415 (= res!19302 (isPrefixOf!0 thiss!1379 (_2!1386 lt!32540)))))

(assert (= (and d!7126 res!19300) b!22410))

(assert (= (and b!22410 res!19306) b!22408))

(assert (= (and b!22408 res!19299) b!22414))

(assert (= (and b!22414 res!19304) b!22412))

(assert (= (and d!7126 res!19303) b!22409))

(assert (= (and b!22409 res!19305) b!22415))

(assert (= (and b!22415 res!19302) b!22413))

(assert (= (and b!22413 res!19301) b!22411))

(declare-fun m!31167 () Bool)

(assert (=> b!22413 m!31167))

(declare-fun m!31169 () Bool)

(assert (=> b!22413 m!31169))

(declare-fun m!31171 () Bool)

(assert (=> b!22413 m!31171))

(declare-fun m!31173 () Bool)

(assert (=> b!22410 m!31173))

(assert (=> b!22410 m!31079))

(declare-fun m!31175 () Bool)

(assert (=> b!22415 m!31175))

(declare-fun m!31177 () Bool)

(assert (=> b!22408 m!31177))

(declare-fun m!31179 () Bool)

(assert (=> b!22412 m!31179))

(assert (=> b!22412 m!31173))

(declare-fun m!31181 () Bool)

(assert (=> d!7126 m!31181))

(declare-fun m!31183 () Bool)

(assert (=> d!7126 m!31183))

(declare-fun m!31185 () Bool)

(assert (=> d!7126 m!31185))

(declare-fun m!31187 () Bool)

(assert (=> b!22409 m!31187))

(assert (=> b!22409 m!31079))

(declare-fun m!31189 () Bool)

(assert (=> b!22411 m!31189))

(assert (=> b!22411 m!31187))

(declare-fun m!31191 () Bool)

(assert (=> b!22414 m!31191))

(assert (=> b!22414 m!31191))

(declare-fun m!31193 () Bool)

(assert (=> b!22414 m!31193))

(assert (=> b!22309 d!7126))

(declare-fun d!7128 () Bool)

(declare-fun res!19309 () Bool)

(declare-fun e!15160 () Bool)

(assert (=> d!7128 (=> (not res!19309) (not e!15160))))

(assert (=> d!7128 (= res!19309 (= (size!660 (buf!978 thiss!1379)) (size!660 (buf!978 thiss!1379))))))

(assert (=> d!7128 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!15160)))

(declare-fun b!22416 () Bool)

(declare-fun res!19307 () Bool)

(assert (=> b!22416 (=> (not res!19307) (not e!15160))))

(assert (=> b!22416 (= res!19307 (bvsle (bitIndex!0 (size!660 (buf!978 thiss!1379)) (currentByte!2285 thiss!1379) (currentBit!2280 thiss!1379)) (bitIndex!0 (size!660 (buf!978 thiss!1379)) (currentByte!2285 thiss!1379) (currentBit!2280 thiss!1379))))))

(declare-fun b!22417 () Bool)

(declare-fun e!15159 () Bool)

(assert (=> b!22417 (= e!15160 e!15159)))

(declare-fun res!19308 () Bool)

(assert (=> b!22417 (=> res!19308 e!15159)))

(assert (=> b!22417 (= res!19308 (= (size!660 (buf!978 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!22418 () Bool)

(assert (=> b!22418 (= e!15159 (arrayBitRangesEq!0 (buf!978 thiss!1379) (buf!978 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!660 (buf!978 thiss!1379)) (currentByte!2285 thiss!1379) (currentBit!2280 thiss!1379))))))

(assert (= (and d!7128 res!19309) b!22416))

(assert (= (and b!22416 res!19307) b!22417))

(assert (= (and b!22417 (not res!19308)) b!22418))

(assert (=> b!22416 m!31079))

(assert (=> b!22416 m!31079))

(assert (=> b!22418 m!31079))

(assert (=> b!22418 m!31079))

(declare-fun m!31195 () Bool)

(assert (=> b!22418 m!31195))

(assert (=> b!22308 d!7128))

(declare-fun d!7130 () Bool)

(assert (=> d!7130 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!32548 () Unit!1930)

(declare-fun choose!11 (BitStream!1154) Unit!1930)

(assert (=> d!7130 (= lt!32548 (choose!11 thiss!1379))))

(assert (=> d!7130 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!32548)))

(declare-fun bs!2068 () Bool)

(assert (= bs!2068 d!7130))

(assert (=> bs!2068 m!31075))

(declare-fun m!31197 () Bool)

(assert (=> bs!2068 m!31197))

(assert (=> b!22308 d!7130))

(declare-fun d!7132 () Bool)

(declare-fun e!15163 () Bool)

(assert (=> d!7132 e!15163))

(declare-fun res!19314 () Bool)

(assert (=> d!7132 (=> (not res!19314) (not e!15163))))

(declare-fun lt!32566 () (_ BitVec 64))

(declare-fun lt!32561 () (_ BitVec 64))

(declare-fun lt!32563 () (_ BitVec 64))

(assert (=> d!7132 (= res!19314 (= lt!32561 (bvsub lt!32566 lt!32563)))))

(assert (=> d!7132 (or (= (bvand lt!32566 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!32563 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!32566 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!32566 lt!32563) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!7132 (= lt!32563 (remainingBits!0 ((_ sign_extend 32) (size!660 (buf!978 thiss!1379))) ((_ sign_extend 32) (currentByte!2285 thiss!1379)) ((_ sign_extend 32) (currentBit!2280 thiss!1379))))))

(declare-fun lt!32564 () (_ BitVec 64))

(declare-fun lt!32562 () (_ BitVec 64))

(assert (=> d!7132 (= lt!32566 (bvmul lt!32564 lt!32562))))

(assert (=> d!7132 (or (= lt!32564 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!32562 (bvsdiv (bvmul lt!32564 lt!32562) lt!32564)))))

(assert (=> d!7132 (= lt!32562 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!7132 (= lt!32564 ((_ sign_extend 32) (size!660 (buf!978 thiss!1379))))))

(assert (=> d!7132 (= lt!32561 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2285 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2280 thiss!1379))))))

(assert (=> d!7132 (invariant!0 (currentBit!2280 thiss!1379) (currentByte!2285 thiss!1379) (size!660 (buf!978 thiss!1379)))))

(assert (=> d!7132 (= (bitIndex!0 (size!660 (buf!978 thiss!1379)) (currentByte!2285 thiss!1379) (currentBit!2280 thiss!1379)) lt!32561)))

(declare-fun b!22423 () Bool)

(declare-fun res!19315 () Bool)

(assert (=> b!22423 (=> (not res!19315) (not e!15163))))

(assert (=> b!22423 (= res!19315 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!32561))))

(declare-fun b!22424 () Bool)

(declare-fun lt!32565 () (_ BitVec 64))

(assert (=> b!22424 (= e!15163 (bvsle lt!32561 (bvmul lt!32565 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!22424 (or (= lt!32565 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!32565 #b0000000000000000000000000000000000000000000000000000000000001000) lt!32565)))))

(assert (=> b!22424 (= lt!32565 ((_ sign_extend 32) (size!660 (buf!978 thiss!1379))))))

(assert (= (and d!7132 res!19314) b!22423))

(assert (= (and b!22423 res!19315) b!22424))

(declare-fun m!31199 () Bool)

(assert (=> d!7132 m!31199))

(declare-fun m!31201 () Bool)

(assert (=> d!7132 m!31201))

(assert (=> b!22308 d!7132))

(declare-fun d!7134 () Bool)

(assert (=> d!7134 (= (invariant!0 (currentBit!2280 (_2!1386 lt!32399)) (currentByte!2285 (_2!1386 lt!32399)) (size!660 (buf!978 (_2!1386 lt!32399)))) (and (bvsge (currentBit!2280 (_2!1386 lt!32399)) #b00000000000000000000000000000000) (bvslt (currentBit!2280 (_2!1386 lt!32399)) #b00000000000000000000000000001000) (bvsge (currentByte!2285 (_2!1386 lt!32399)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2285 (_2!1386 lt!32399)) (size!660 (buf!978 (_2!1386 lt!32399)))) (and (= (currentBit!2280 (_2!1386 lt!32399)) #b00000000000000000000000000000000) (= (currentByte!2285 (_2!1386 lt!32399)) (size!660 (buf!978 (_2!1386 lt!32399))))))))))

(assert (=> b!22305 d!7134))

(declare-fun d!7136 () Bool)

(assert (=> d!7136 (= (array_inv!630 (buf!978 thiss!1379)) (bvsge (size!660 (buf!978 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!22310 d!7136))

(declare-fun d!7138 () Bool)

(assert (=> d!7138 (= (array_inv!630 srcBuffer!2) (bvsge (size!660 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!5492 d!7138))

(declare-fun d!7140 () Bool)

(assert (=> d!7140 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2280 thiss!1379) (currentByte!2285 thiss!1379) (size!660 (buf!978 thiss!1379))))))

(declare-fun bs!2069 () Bool)

(assert (= bs!2069 d!7140))

(assert (=> bs!2069 m!31201))

(assert (=> start!5492 d!7140))

(declare-fun d!7142 () Bool)

(assert (=> d!7142 (= (invariant!0 (currentBit!2280 (_2!1386 lt!32403)) (currentByte!2285 (_2!1386 lt!32403)) (size!660 (buf!978 (_2!1386 lt!32403)))) (and (bvsge (currentBit!2280 (_2!1386 lt!32403)) #b00000000000000000000000000000000) (bvslt (currentBit!2280 (_2!1386 lt!32403)) #b00000000000000000000000000001000) (bvsge (currentByte!2285 (_2!1386 lt!32403)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2285 (_2!1386 lt!32403)) (size!660 (buf!978 (_2!1386 lt!32403)))) (and (= (currentBit!2280 (_2!1386 lt!32403)) #b00000000000000000000000000000000) (= (currentByte!2285 (_2!1386 lt!32403)) (size!660 (buf!978 (_2!1386 lt!32403))))))))))

(assert (=> b!22304 d!7142))

(declare-fun b!22435 () Bool)

(declare-fun res!19322 () Bool)

(declare-fun e!15169 () Bool)

(assert (=> b!22435 (=> (not res!19322) (not e!15169))))

(declare-fun lt!32613 () tuple2!2604)

(assert (=> b!22435 (= res!19322 (isPrefixOf!0 (_1!1387 lt!32613) thiss!1379))))

(declare-fun d!7144 () Bool)

(assert (=> d!7144 e!15169))

(declare-fun res!19324 () Bool)

(assert (=> d!7144 (=> (not res!19324) (not e!15169))))

(assert (=> d!7144 (= res!19324 (isPrefixOf!0 (_1!1387 lt!32613) (_2!1387 lt!32613)))))

(declare-fun lt!32610 () BitStream!1154)

(assert (=> d!7144 (= lt!32613 (tuple2!2605 lt!32610 (_2!1386 lt!32403)))))

(declare-fun lt!32615 () Unit!1930)

(declare-fun lt!32614 () Unit!1930)

(assert (=> d!7144 (= lt!32615 lt!32614)))

(assert (=> d!7144 (isPrefixOf!0 lt!32610 (_2!1386 lt!32403))))

(assert (=> d!7144 (= lt!32614 (lemmaIsPrefixTransitive!0 lt!32610 (_2!1386 lt!32403) (_2!1386 lt!32403)))))

(declare-fun lt!32620 () Unit!1930)

(declare-fun lt!32611 () Unit!1930)

(assert (=> d!7144 (= lt!32620 lt!32611)))

(assert (=> d!7144 (isPrefixOf!0 lt!32610 (_2!1386 lt!32403))))

(assert (=> d!7144 (= lt!32611 (lemmaIsPrefixTransitive!0 lt!32610 thiss!1379 (_2!1386 lt!32403)))))

(declare-fun lt!32608 () Unit!1930)

(declare-fun e!15168 () Unit!1930)

(assert (=> d!7144 (= lt!32608 e!15168)))

(declare-fun c!1609 () Bool)

(assert (=> d!7144 (= c!1609 (not (= (size!660 (buf!978 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!32617 () Unit!1930)

(declare-fun lt!32626 () Unit!1930)

(assert (=> d!7144 (= lt!32617 lt!32626)))

(assert (=> d!7144 (isPrefixOf!0 (_2!1386 lt!32403) (_2!1386 lt!32403))))

(assert (=> d!7144 (= lt!32626 (lemmaIsPrefixRefl!0 (_2!1386 lt!32403)))))

(declare-fun lt!32621 () Unit!1930)

(declare-fun lt!32612 () Unit!1930)

(assert (=> d!7144 (= lt!32621 lt!32612)))

(assert (=> d!7144 (= lt!32612 (lemmaIsPrefixRefl!0 (_2!1386 lt!32403)))))

(declare-fun lt!32616 () Unit!1930)

(declare-fun lt!32625 () Unit!1930)

(assert (=> d!7144 (= lt!32616 lt!32625)))

(assert (=> d!7144 (isPrefixOf!0 lt!32610 lt!32610)))

(assert (=> d!7144 (= lt!32625 (lemmaIsPrefixRefl!0 lt!32610))))

(declare-fun lt!32607 () Unit!1930)

(declare-fun lt!32623 () Unit!1930)

(assert (=> d!7144 (= lt!32607 lt!32623)))

(assert (=> d!7144 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!7144 (= lt!32623 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!7144 (= lt!32610 (BitStream!1155 (buf!978 (_2!1386 lt!32403)) (currentByte!2285 thiss!1379) (currentBit!2280 thiss!1379)))))

(assert (=> d!7144 (isPrefixOf!0 thiss!1379 (_2!1386 lt!32403))))

(assert (=> d!7144 (= (reader!0 thiss!1379 (_2!1386 lt!32403)) lt!32613)))

(declare-fun b!22436 () Bool)

(declare-fun Unit!1948 () Unit!1930)

(assert (=> b!22436 (= e!15168 Unit!1948)))

(declare-fun lt!32624 () (_ BitVec 64))

(declare-fun b!22437 () Bool)

(declare-fun lt!32609 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1154 (_ BitVec 64)) BitStream!1154)

(assert (=> b!22437 (= e!15169 (= (_1!1387 lt!32613) (withMovedBitIndex!0 (_2!1387 lt!32613) (bvsub lt!32624 lt!32609))))))

(assert (=> b!22437 (or (= (bvand lt!32624 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!32609 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!32624 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!32624 lt!32609) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!22437 (= lt!32609 (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!32403))) (currentByte!2285 (_2!1386 lt!32403)) (currentBit!2280 (_2!1386 lt!32403))))))

(assert (=> b!22437 (= lt!32624 (bitIndex!0 (size!660 (buf!978 thiss!1379)) (currentByte!2285 thiss!1379) (currentBit!2280 thiss!1379)))))

(declare-fun b!22438 () Bool)

(declare-fun res!19323 () Bool)

(assert (=> b!22438 (=> (not res!19323) (not e!15169))))

(assert (=> b!22438 (= res!19323 (isPrefixOf!0 (_2!1387 lt!32613) (_2!1386 lt!32403)))))

(declare-fun b!22439 () Bool)

(declare-fun lt!32622 () Unit!1930)

(assert (=> b!22439 (= e!15168 lt!32622)))

(declare-fun lt!32618 () (_ BitVec 64))

(assert (=> b!22439 (= lt!32618 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!32619 () (_ BitVec 64))

(assert (=> b!22439 (= lt!32619 (bitIndex!0 (size!660 (buf!978 thiss!1379)) (currentByte!2285 thiss!1379) (currentBit!2280 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1548 array!1548 (_ BitVec 64) (_ BitVec 64)) Unit!1930)

(assert (=> b!22439 (= lt!32622 (arrayBitRangesEqSymmetric!0 (buf!978 thiss!1379) (buf!978 (_2!1386 lt!32403)) lt!32618 lt!32619))))

(assert (=> b!22439 (arrayBitRangesEq!0 (buf!978 (_2!1386 lt!32403)) (buf!978 thiss!1379) lt!32618 lt!32619)))

(assert (= (and d!7144 c!1609) b!22439))

(assert (= (and d!7144 (not c!1609)) b!22436))

(assert (= (and d!7144 res!19324) b!22435))

(assert (= (and b!22435 res!19322) b!22438))

(assert (= (and b!22438 res!19323) b!22437))

(assert (=> b!22439 m!31079))

(declare-fun m!31203 () Bool)

(assert (=> b!22439 m!31203))

(declare-fun m!31205 () Bool)

(assert (=> b!22439 m!31205))

(declare-fun m!31207 () Bool)

(assert (=> b!22438 m!31207))

(declare-fun m!31209 () Bool)

(assert (=> b!22437 m!31209))

(assert (=> b!22437 m!31133))

(assert (=> b!22437 m!31079))

(declare-fun m!31211 () Bool)

(assert (=> b!22435 m!31211))

(declare-fun m!31213 () Bool)

(assert (=> d!7144 m!31213))

(declare-fun m!31215 () Bool)

(assert (=> d!7144 m!31215))

(assert (=> d!7144 m!31063))

(declare-fun m!31217 () Bool)

(assert (=> d!7144 m!31217))

(declare-fun m!31219 () Bool)

(assert (=> d!7144 m!31219))

(declare-fun m!31221 () Bool)

(assert (=> d!7144 m!31221))

(assert (=> d!7144 m!31077))

(assert (=> d!7144 m!31075))

(declare-fun m!31223 () Bool)

(assert (=> d!7144 m!31223))

(declare-fun m!31225 () Bool)

(assert (=> d!7144 m!31225))

(declare-fun m!31227 () Bool)

(assert (=> d!7144 m!31227))

(assert (=> b!22311 d!7144))

(declare-fun lt!33196 () tuple2!2602)

(declare-fun lt!33189 () tuple2!2604)

(declare-fun e!15251 () Bool)

(declare-fun b!22613 () Bool)

(assert (=> b!22613 (= e!15251 (= (bitStreamReadBitsIntoList!0 (_2!1386 lt!33196) (_1!1387 lt!33189) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!1386 lt!33196) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!22613 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!22613 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!33199 () Unit!1930)

(declare-fun lt!33162 () Unit!1930)

(assert (=> b!22613 (= lt!33199 lt!33162)))

(declare-fun lt!33194 () (_ BitVec 64))

(assert (=> b!22613 (validate_offset_bits!1 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!33196)))) ((_ sign_extend 32) (currentByte!2285 (_2!1386 lt!32403))) ((_ sign_extend 32) (currentBit!2280 (_2!1386 lt!32403))) lt!33194)))

(assert (=> b!22613 (= lt!33162 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1386 lt!32403) (buf!978 (_2!1386 lt!33196)) lt!33194))))

(declare-fun e!15253 () Bool)

(assert (=> b!22613 e!15253))

(declare-fun res!19456 () Bool)

(assert (=> b!22613 (=> (not res!19456) (not e!15253))))

(assert (=> b!22613 (= res!19456 (and (= (size!660 (buf!978 (_2!1386 lt!32403))) (size!660 (buf!978 (_2!1386 lt!33196)))) (bvsge lt!33194 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!22613 (= lt!33194 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!22613 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!22613 (= lt!33189 (reader!0 (_2!1386 lt!32403) (_2!1386 lt!33196)))))

(declare-fun b!22614 () Bool)

(declare-fun res!19461 () Bool)

(assert (=> b!22614 (=> (not res!19461) (not e!15251))))

(assert (=> b!22614 (= res!19461 (invariant!0 (currentBit!2280 (_2!1386 lt!33196)) (currentByte!2285 (_2!1386 lt!33196)) (size!660 (buf!978 (_2!1386 lt!33196)))))))

(declare-fun b!22615 () Bool)

(declare-fun res!19459 () Bool)

(assert (=> b!22615 (=> (not res!19459) (not e!15251))))

(assert (=> b!22615 (= res!19459 (= (size!660 (buf!978 (_2!1386 lt!32403))) (size!660 (buf!978 (_2!1386 lt!33196)))))))

(declare-fun b!22616 () Bool)

(declare-fun res!19458 () Bool)

(assert (=> b!22616 (=> (not res!19458) (not e!15251))))

(assert (=> b!22616 (= res!19458 (isPrefixOf!0 (_2!1386 lt!32403) (_2!1386 lt!33196)))))

(declare-fun c!1630 () Bool)

(declare-fun lt!33190 () tuple2!2602)

(declare-fun call!329 () tuple2!2604)

(declare-fun bm!326 () Bool)

(declare-fun lt!33171 () tuple2!2602)

(assert (=> bm!326 (= call!329 (reader!0 (ite c!1630 (_2!1386 lt!33190) (_2!1386 lt!32403)) (ite c!1630 (_2!1386 lt!33171) (_2!1386 lt!32403))))))

(declare-fun b!22617 () Bool)

(assert (=> b!22617 (= e!15253 (validate_offset_bits!1 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!32403)))) ((_ sign_extend 32) (currentByte!2285 (_2!1386 lt!32403))) ((_ sign_extend 32) (currentBit!2280 (_2!1386 lt!32403))) lt!33194))))

(declare-fun b!22618 () Bool)

(declare-fun e!15252 () tuple2!2602)

(declare-fun Unit!1949 () Unit!1930)

(assert (=> b!22618 (= e!15252 (tuple2!2603 Unit!1949 (_2!1386 lt!32403)))))

(assert (=> b!22618 (= (size!660 (buf!978 (_2!1386 lt!32403))) (size!660 (buf!978 (_2!1386 lt!32403))))))

(declare-fun lt!33198 () Unit!1930)

(declare-fun Unit!1950 () Unit!1930)

(assert (=> b!22618 (= lt!33198 Unit!1950)))

(declare-fun checkByteArrayBitContent!0 (BitStream!1154 array!1548 array!1548 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!22618 (checkByteArrayBitContent!0 (_2!1386 lt!32403) srcBuffer!2 (_1!1397 (readBits!0 (_1!1387 call!329) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!22619 () Bool)

(declare-fun res!19460 () Bool)

(assert (=> b!22619 (=> (not res!19460) (not e!15251))))

(assert (=> b!22619 (= res!19460 (= (size!660 (buf!978 (_2!1386 lt!33196))) (size!660 (buf!978 (_2!1386 lt!32403)))))))

(declare-fun d!7146 () Bool)

(assert (=> d!7146 e!15251))

(declare-fun res!19457 () Bool)

(assert (=> d!7146 (=> (not res!19457) (not e!15251))))

(declare-fun lt!33191 () (_ BitVec 64))

(assert (=> d!7146 (= res!19457 (= (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!33196))) (currentByte!2285 (_2!1386 lt!33196)) (currentBit!2280 (_2!1386 lt!33196))) (bvsub lt!33191 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!7146 (or (= (bvand lt!33191 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!33191 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!33191 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!33202 () (_ BitVec 64))

(assert (=> d!7146 (= lt!33191 (bvadd lt!33202 to!314))))

(assert (=> d!7146 (or (not (= (bvand lt!33202 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!33202 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!33202 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!7146 (= lt!33202 (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!32403))) (currentByte!2285 (_2!1386 lt!32403)) (currentBit!2280 (_2!1386 lt!32403))))))

(assert (=> d!7146 (= lt!33196 e!15252)))

(assert (=> d!7146 (= c!1630 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!33172 () Unit!1930)

(declare-fun lt!33176 () Unit!1930)

(assert (=> d!7146 (= lt!33172 lt!33176)))

(assert (=> d!7146 (isPrefixOf!0 (_2!1386 lt!32403) (_2!1386 lt!32403))))

(assert (=> d!7146 (= lt!33176 (lemmaIsPrefixRefl!0 (_2!1386 lt!32403)))))

(declare-fun lt!33186 () (_ BitVec 64))

(assert (=> d!7146 (= lt!33186 (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!32403))) (currentByte!2285 (_2!1386 lt!32403)) (currentBit!2280 (_2!1386 lt!32403))))))

(assert (=> d!7146 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!7146 (= (appendBitsMSBFirstLoop!0 (_2!1386 lt!32403) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!33196)))

(declare-fun b!22620 () Bool)

(declare-fun Unit!1951 () Unit!1930)

(assert (=> b!22620 (= e!15252 (tuple2!2603 Unit!1951 (_2!1386 lt!33171)))))

(assert (=> b!22620 (= lt!33190 (appendBitFromByte!0 (_2!1386 lt!32403) (select (arr!1113 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!33165 () (_ BitVec 64))

(assert (=> b!22620 (= lt!33165 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!33160 () (_ BitVec 64))

(assert (=> b!22620 (= lt!33160 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!33180 () Unit!1930)

(assert (=> b!22620 (= lt!33180 (validateOffsetBitsIneqLemma!0 (_2!1386 lt!32403) (_2!1386 lt!33190) lt!33165 lt!33160))))

(assert (=> b!22620 (validate_offset_bits!1 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!33190)))) ((_ sign_extend 32) (currentByte!2285 (_2!1386 lt!33190))) ((_ sign_extend 32) (currentBit!2280 (_2!1386 lt!33190))) (bvsub lt!33165 lt!33160))))

(declare-fun lt!33159 () Unit!1930)

(assert (=> b!22620 (= lt!33159 lt!33180)))

(declare-fun lt!33187 () tuple2!2604)

(assert (=> b!22620 (= lt!33187 (reader!0 (_2!1386 lt!32403) (_2!1386 lt!33190)))))

(declare-fun lt!33168 () (_ BitVec 64))

(assert (=> b!22620 (= lt!33168 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!33184 () Unit!1930)

(assert (=> b!22620 (= lt!33184 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1386 lt!32403) (buf!978 (_2!1386 lt!33190)) lt!33168))))

(assert (=> b!22620 (validate_offset_bits!1 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!33190)))) ((_ sign_extend 32) (currentByte!2285 (_2!1386 lt!32403))) ((_ sign_extend 32) (currentBit!2280 (_2!1386 lt!32403))) lt!33168)))

(declare-fun lt!33195 () Unit!1930)

(assert (=> b!22620 (= lt!33195 lt!33184)))

(assert (=> b!22620 (= (head!115 (byteArrayBitContentToList!0 (_2!1386 lt!33190) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!115 (bitStreamReadBitsIntoList!0 (_2!1386 lt!33190) (_1!1387 lt!33187) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!33188 () Unit!1930)

(declare-fun Unit!1952 () Unit!1930)

(assert (=> b!22620 (= lt!33188 Unit!1952)))

(assert (=> b!22620 (= lt!33171 (appendBitsMSBFirstLoop!0 (_2!1386 lt!33190) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!33181 () Unit!1930)

(assert (=> b!22620 (= lt!33181 (lemmaIsPrefixTransitive!0 (_2!1386 lt!32403) (_2!1386 lt!33190) (_2!1386 lt!33171)))))

(assert (=> b!22620 (isPrefixOf!0 (_2!1386 lt!32403) (_2!1386 lt!33171))))

(declare-fun lt!33164 () Unit!1930)

(assert (=> b!22620 (= lt!33164 lt!33181)))

(assert (=> b!22620 (= (size!660 (buf!978 (_2!1386 lt!33171))) (size!660 (buf!978 (_2!1386 lt!32403))))))

(declare-fun lt!33161 () Unit!1930)

(declare-fun Unit!1953 () Unit!1930)

(assert (=> b!22620 (= lt!33161 Unit!1953)))

(assert (=> b!22620 (= (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!33171))) (currentByte!2285 (_2!1386 lt!33171)) (currentBit!2280 (_2!1386 lt!33171))) (bvsub (bvadd (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!32403))) (currentByte!2285 (_2!1386 lt!32403)) (currentBit!2280 (_2!1386 lt!32403))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!33177 () Unit!1930)

(declare-fun Unit!1954 () Unit!1930)

(assert (=> b!22620 (= lt!33177 Unit!1954)))

(assert (=> b!22620 (= (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!33171))) (currentByte!2285 (_2!1386 lt!33171)) (currentBit!2280 (_2!1386 lt!33171))) (bvsub (bvsub (bvadd (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!33190))) (currentByte!2285 (_2!1386 lt!33190)) (currentBit!2280 (_2!1386 lt!33190))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!33182 () Unit!1930)

(declare-fun Unit!1955 () Unit!1930)

(assert (=> b!22620 (= lt!33182 Unit!1955)))

(declare-fun lt!33174 () tuple2!2604)

(assert (=> b!22620 (= lt!33174 (reader!0 (_2!1386 lt!32403) (_2!1386 lt!33171)))))

(declare-fun lt!33192 () (_ BitVec 64))

(assert (=> b!22620 (= lt!33192 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!33169 () Unit!1930)

(assert (=> b!22620 (= lt!33169 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1386 lt!32403) (buf!978 (_2!1386 lt!33171)) lt!33192))))

(assert (=> b!22620 (validate_offset_bits!1 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!33171)))) ((_ sign_extend 32) (currentByte!2285 (_2!1386 lt!32403))) ((_ sign_extend 32) (currentBit!2280 (_2!1386 lt!32403))) lt!33192)))

(declare-fun lt!33166 () Unit!1930)

(assert (=> b!22620 (= lt!33166 lt!33169)))

(declare-fun lt!33170 () tuple2!2604)

(assert (=> b!22620 (= lt!33170 call!329)))

(declare-fun lt!33197 () (_ BitVec 64))

(assert (=> b!22620 (= lt!33197 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!33201 () Unit!1930)

(assert (=> b!22620 (= lt!33201 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1386 lt!33190) (buf!978 (_2!1386 lt!33171)) lt!33197))))

(assert (=> b!22620 (validate_offset_bits!1 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!33171)))) ((_ sign_extend 32) (currentByte!2285 (_2!1386 lt!33190))) ((_ sign_extend 32) (currentBit!2280 (_2!1386 lt!33190))) lt!33197)))

(declare-fun lt!33163 () Unit!1930)

(assert (=> b!22620 (= lt!33163 lt!33201)))

(declare-fun lt!33173 () List!278)

(assert (=> b!22620 (= lt!33173 (byteArrayBitContentToList!0 (_2!1386 lt!33171) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!33200 () List!278)

(assert (=> b!22620 (= lt!33200 (byteArrayBitContentToList!0 (_2!1386 lt!33171) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!33183 () List!278)

(assert (=> b!22620 (= lt!33183 (bitStreamReadBitsIntoList!0 (_2!1386 lt!33171) (_1!1387 lt!33174) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!33193 () List!278)

(assert (=> b!22620 (= lt!33193 (bitStreamReadBitsIntoList!0 (_2!1386 lt!33171) (_1!1387 lt!33170) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!33175 () (_ BitVec 64))

(assert (=> b!22620 (= lt!33175 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!33167 () Unit!1930)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1154 BitStream!1154 BitStream!1154 BitStream!1154 (_ BitVec 64) List!278) Unit!1930)

(assert (=> b!22620 (= lt!33167 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1386 lt!33171) (_2!1386 lt!33171) (_1!1387 lt!33174) (_1!1387 lt!33170) lt!33175 lt!33183))))

(declare-fun tail!85 (List!278) List!278)

(assert (=> b!22620 (= (bitStreamReadBitsIntoList!0 (_2!1386 lt!33171) (_1!1387 lt!33170) (bvsub lt!33175 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!85 lt!33183))))

(declare-fun lt!33179 () Unit!1930)

(assert (=> b!22620 (= lt!33179 lt!33167)))

(declare-fun lt!33185 () Unit!1930)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1548 array!1548 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!1930)

(assert (=> b!22620 (= lt!33185 (arrayBitRangesEqImpliesEq!0 (buf!978 (_2!1386 lt!33190)) (buf!978 (_2!1386 lt!33171)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!33186 (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!33190))) (currentByte!2285 (_2!1386 lt!33190)) (currentBit!2280 (_2!1386 lt!33190)))))))

(declare-fun bitAt!0 (array!1548 (_ BitVec 64)) Bool)

(assert (=> b!22620 (= (bitAt!0 (buf!978 (_2!1386 lt!33190)) lt!33186) (bitAt!0 (buf!978 (_2!1386 lt!33171)) lt!33186))))

(declare-fun lt!33178 () Unit!1930)

(assert (=> b!22620 (= lt!33178 lt!33185)))

(assert (= (and d!7146 c!1630) b!22620))

(assert (= (and d!7146 (not c!1630)) b!22618))

(assert (= (or b!22620 b!22618) bm!326))

(assert (= (and d!7146 res!19457) b!22614))

(assert (= (and b!22614 res!19461) b!22615))

(assert (= (and b!22615 res!19459) b!22616))

(assert (= (and b!22616 res!19458) b!22619))

(assert (= (and b!22619 res!19460) b!22613))

(assert (= (and b!22613 res!19456) b!22617))

(declare-fun m!31521 () Bool)

(assert (=> b!22614 m!31521))

(declare-fun m!31523 () Bool)

(assert (=> d!7146 m!31523))

(assert (=> d!7146 m!31133))

(assert (=> d!7146 m!31219))

(assert (=> d!7146 m!31217))

(declare-fun m!31525 () Bool)

(assert (=> b!22613 m!31525))

(declare-fun m!31527 () Bool)

(assert (=> b!22613 m!31527))

(declare-fun m!31529 () Bool)

(assert (=> b!22613 m!31529))

(declare-fun m!31531 () Bool)

(assert (=> b!22613 m!31531))

(declare-fun m!31533 () Bool)

(assert (=> b!22613 m!31533))

(declare-fun m!31535 () Bool)

(assert (=> b!22618 m!31535))

(declare-fun m!31537 () Bool)

(assert (=> b!22618 m!31537))

(declare-fun m!31539 () Bool)

(assert (=> bm!326 m!31539))

(declare-fun m!31541 () Bool)

(assert (=> b!22620 m!31541))

(declare-fun m!31543 () Bool)

(assert (=> b!22620 m!31543))

(declare-fun m!31545 () Bool)

(assert (=> b!22620 m!31545))

(declare-fun m!31547 () Bool)

(assert (=> b!22620 m!31547))

(declare-fun m!31549 () Bool)

(assert (=> b!22620 m!31549))

(assert (=> b!22620 m!31547))

(declare-fun m!31551 () Bool)

(assert (=> b!22620 m!31551))

(assert (=> b!22620 m!31541))

(declare-fun m!31553 () Bool)

(assert (=> b!22620 m!31553))

(declare-fun m!31555 () Bool)

(assert (=> b!22620 m!31555))

(declare-fun m!31557 () Bool)

(assert (=> b!22620 m!31557))

(declare-fun m!31559 () Bool)

(assert (=> b!22620 m!31559))

(declare-fun m!31561 () Bool)

(assert (=> b!22620 m!31561))

(declare-fun m!31563 () Bool)

(assert (=> b!22620 m!31563))

(declare-fun m!31565 () Bool)

(assert (=> b!22620 m!31565))

(declare-fun m!31567 () Bool)

(assert (=> b!22620 m!31567))

(declare-fun m!31569 () Bool)

(assert (=> b!22620 m!31569))

(assert (=> b!22620 m!31563))

(declare-fun m!31571 () Bool)

(assert (=> b!22620 m!31571))

(assert (=> b!22620 m!31555))

(declare-fun m!31573 () Bool)

(assert (=> b!22620 m!31573))

(declare-fun m!31575 () Bool)

(assert (=> b!22620 m!31575))

(declare-fun m!31577 () Bool)

(assert (=> b!22620 m!31577))

(declare-fun m!31579 () Bool)

(assert (=> b!22620 m!31579))

(declare-fun m!31581 () Bool)

(assert (=> b!22620 m!31581))

(declare-fun m!31583 () Bool)

(assert (=> b!22620 m!31583))

(declare-fun m!31585 () Bool)

(assert (=> b!22620 m!31585))

(declare-fun m!31587 () Bool)

(assert (=> b!22620 m!31587))

(declare-fun m!31589 () Bool)

(assert (=> b!22620 m!31589))

(declare-fun m!31591 () Bool)

(assert (=> b!22620 m!31591))

(declare-fun m!31593 () Bool)

(assert (=> b!22620 m!31593))

(assert (=> b!22620 m!31133))

(declare-fun m!31595 () Bool)

(assert (=> b!22620 m!31595))

(declare-fun m!31597 () Bool)

(assert (=> b!22620 m!31597))

(declare-fun m!31599 () Bool)

(assert (=> b!22620 m!31599))

(declare-fun m!31601 () Bool)

(assert (=> b!22620 m!31601))

(declare-fun m!31603 () Bool)

(assert (=> b!22616 m!31603))

(declare-fun m!31605 () Bool)

(assert (=> b!22617 m!31605))

(assert (=> b!22311 d!7146))

(declare-fun d!7206 () Bool)

(assert (=> d!7206 (validate_offset_bits!1 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!32403)))) ((_ sign_extend 32) (currentByte!2285 thiss!1379)) ((_ sign_extend 32) (currentBit!2280 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!33205 () Unit!1930)

(declare-fun choose!9 (BitStream!1154 array!1548 (_ BitVec 64) BitStream!1154) Unit!1930)

(assert (=> d!7206 (= lt!33205 (choose!9 thiss!1379 (buf!978 (_2!1386 lt!32403)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1155 (buf!978 (_2!1386 lt!32403)) (currentByte!2285 thiss!1379) (currentBit!2280 thiss!1379))))))

(assert (=> d!7206 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!978 (_2!1386 lt!32403)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!33205)))

(declare-fun bs!2080 () Bool)

(assert (= bs!2080 d!7206))

(assert (=> bs!2080 m!31061))

(declare-fun m!31607 () Bool)

(assert (=> bs!2080 m!31607))

(assert (=> b!22311 d!7206))

(declare-fun d!7208 () Bool)

(assert (=> d!7208 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!32403)))) ((_ sign_extend 32) (currentByte!2285 thiss!1379)) ((_ sign_extend 32) (currentBit!2280 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!32403)))) ((_ sign_extend 32) (currentByte!2285 thiss!1379)) ((_ sign_extend 32) (currentBit!2280 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!2081 () Bool)

(assert (= bs!2081 d!7208))

(declare-fun m!31609 () Bool)

(assert (=> bs!2081 m!31609))

(assert (=> b!22311 d!7208))

(declare-fun d!7210 () Bool)

(declare-fun res!19464 () Bool)

(declare-fun e!15255 () Bool)

(assert (=> d!7210 (=> (not res!19464) (not e!15255))))

(assert (=> d!7210 (= res!19464 (= (size!660 (buf!978 (_2!1386 lt!32403))) (size!660 (buf!978 (_2!1386 lt!32399)))))))

(assert (=> d!7210 (= (isPrefixOf!0 (_2!1386 lt!32403) (_2!1386 lt!32399)) e!15255)))

(declare-fun b!22621 () Bool)

(declare-fun res!19462 () Bool)

(assert (=> b!22621 (=> (not res!19462) (not e!15255))))

(assert (=> b!22621 (= res!19462 (bvsle (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!32403))) (currentByte!2285 (_2!1386 lt!32403)) (currentBit!2280 (_2!1386 lt!32403))) (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!32399))) (currentByte!2285 (_2!1386 lt!32399)) (currentBit!2280 (_2!1386 lt!32399)))))))

(declare-fun b!22622 () Bool)

(declare-fun e!15254 () Bool)

(assert (=> b!22622 (= e!15255 e!15254)))

(declare-fun res!19463 () Bool)

(assert (=> b!22622 (=> res!19463 e!15254)))

(assert (=> b!22622 (= res!19463 (= (size!660 (buf!978 (_2!1386 lt!32403))) #b00000000000000000000000000000000))))

(declare-fun b!22623 () Bool)

(assert (=> b!22623 (= e!15254 (arrayBitRangesEq!0 (buf!978 (_2!1386 lt!32403)) (buf!978 (_2!1386 lt!32399)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!32403))) (currentByte!2285 (_2!1386 lt!32403)) (currentBit!2280 (_2!1386 lt!32403)))))))

(assert (= (and d!7210 res!19464) b!22621))

(assert (= (and b!22621 res!19462) b!22622))

(assert (= (and b!22622 (not res!19463)) b!22623))

(assert (=> b!22621 m!31133))

(assert (=> b!22621 m!31043))

(assert (=> b!22623 m!31133))

(assert (=> b!22623 m!31133))

(declare-fun m!31611 () Bool)

(assert (=> b!22623 m!31611))

(assert (=> b!22311 d!7210))

(declare-fun d!7212 () Bool)

(declare-fun res!19467 () Bool)

(declare-fun e!15257 () Bool)

(assert (=> d!7212 (=> (not res!19467) (not e!15257))))

(assert (=> d!7212 (= res!19467 (= (size!660 (buf!978 thiss!1379)) (size!660 (buf!978 (_2!1386 lt!32399)))))))

(assert (=> d!7212 (= (isPrefixOf!0 thiss!1379 (_2!1386 lt!32399)) e!15257)))

(declare-fun b!22624 () Bool)

(declare-fun res!19465 () Bool)

(assert (=> b!22624 (=> (not res!19465) (not e!15257))))

(assert (=> b!22624 (= res!19465 (bvsle (bitIndex!0 (size!660 (buf!978 thiss!1379)) (currentByte!2285 thiss!1379) (currentBit!2280 thiss!1379)) (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!32399))) (currentByte!2285 (_2!1386 lt!32399)) (currentBit!2280 (_2!1386 lt!32399)))))))

(declare-fun b!22625 () Bool)

(declare-fun e!15256 () Bool)

(assert (=> b!22625 (= e!15257 e!15256)))

(declare-fun res!19466 () Bool)

(assert (=> b!22625 (=> res!19466 e!15256)))

(assert (=> b!22625 (= res!19466 (= (size!660 (buf!978 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!22626 () Bool)

(assert (=> b!22626 (= e!15256 (arrayBitRangesEq!0 (buf!978 thiss!1379) (buf!978 (_2!1386 lt!32399)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!660 (buf!978 thiss!1379)) (currentByte!2285 thiss!1379) (currentBit!2280 thiss!1379))))))

(assert (= (and d!7212 res!19467) b!22624))

(assert (= (and b!22624 res!19465) b!22625))

(assert (= (and b!22625 (not res!19466)) b!22626))

(assert (=> b!22624 m!31079))

(assert (=> b!22624 m!31043))

(assert (=> b!22626 m!31079))

(assert (=> b!22626 m!31079))

(declare-fun m!31613 () Bool)

(assert (=> b!22626 m!31613))

(assert (=> b!22311 d!7212))

(declare-fun d!7214 () Bool)

(assert (=> d!7214 (isPrefixOf!0 thiss!1379 (_2!1386 lt!32399))))

(declare-fun lt!33208 () Unit!1930)

(declare-fun choose!30 (BitStream!1154 BitStream!1154 BitStream!1154) Unit!1930)

(assert (=> d!7214 (= lt!33208 (choose!30 thiss!1379 (_2!1386 lt!32403) (_2!1386 lt!32399)))))

(assert (=> d!7214 (isPrefixOf!0 thiss!1379 (_2!1386 lt!32403))))

(assert (=> d!7214 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1386 lt!32403) (_2!1386 lt!32399)) lt!33208)))

(declare-fun bs!2082 () Bool)

(assert (= bs!2082 d!7214))

(assert (=> bs!2082 m!31057))

(declare-fun m!31615 () Bool)

(assert (=> bs!2082 m!31615))

(assert (=> bs!2082 m!31063))

(assert (=> b!22311 d!7214))

(declare-fun d!7216 () Bool)

(assert (=> d!7216 (= (head!115 (byteArrayBitContentToList!0 (_2!1386 lt!32403) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!393 (byteArrayBitContentToList!0 (_2!1386 lt!32403) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!22313 d!7216))

(declare-fun d!7218 () Bool)

(declare-fun c!1633 () Bool)

(assert (=> d!7218 (= c!1633 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!15260 () List!278)

(assert (=> d!7218 (= (byteArrayBitContentToList!0 (_2!1386 lt!32403) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!15260)))

(declare-fun b!22631 () Bool)

(assert (=> b!22631 (= e!15260 Nil!275)))

(declare-fun b!22632 () Bool)

(assert (=> b!22632 (= e!15260 (Cons!274 (not (= (bvand ((_ sign_extend 24) (select (arr!1113 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1386 lt!32403) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!7218 c!1633) b!22631))

(assert (= (and d!7218 (not c!1633)) b!22632))

(assert (=> b!22632 m!31065))

(assert (=> b!22632 m!31185))

(declare-fun m!31617 () Bool)

(assert (=> b!22632 m!31617))

(assert (=> b!22313 d!7218))

(declare-fun d!7220 () Bool)

(assert (=> d!7220 (= (head!115 (bitStreamReadBitsIntoList!0 (_2!1386 lt!32403) (_1!1387 lt!32401) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!393 (bitStreamReadBitsIntoList!0 (_2!1386 lt!32403) (_1!1387 lt!32401) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!22313 d!7220))

(declare-fun b!22643 () Bool)

(declare-fun e!15266 () Bool)

(declare-fun lt!33215 () List!278)

(declare-fun isEmpty!63 (List!278) Bool)

(assert (=> b!22643 (= e!15266 (isEmpty!63 lt!33215))))

(declare-fun b!22641 () Bool)

(declare-datatypes ((tuple2!2626 0))(
  ( (tuple2!2627 (_1!1398 List!278) (_2!1398 BitStream!1154)) )
))
(declare-fun e!15265 () tuple2!2626)

(assert (=> b!22641 (= e!15265 (tuple2!2627 Nil!275 (_1!1387 lt!32401)))))

(declare-fun b!22642 () Bool)

(declare-fun lt!33216 () (_ BitVec 64))

(declare-datatypes ((tuple2!2628 0))(
  ( (tuple2!2629 (_1!1399 Bool) (_2!1399 BitStream!1154)) )
))
(declare-fun lt!33217 () tuple2!2628)

(assert (=> b!22642 (= e!15265 (tuple2!2627 (Cons!274 (_1!1399 lt!33217) (bitStreamReadBitsIntoList!0 (_2!1386 lt!32403) (_2!1399 lt!33217) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!33216))) (_2!1399 lt!33217)))))

(declare-fun readBit!0 (BitStream!1154) tuple2!2628)

(assert (=> b!22642 (= lt!33217 (readBit!0 (_1!1387 lt!32401)))))

(assert (=> b!22642 (= lt!33216 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!7222 () Bool)

(assert (=> d!7222 e!15266))

(declare-fun c!1639 () Bool)

(assert (=> d!7222 (= c!1639 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!7222 (= lt!33215 (_1!1398 e!15265))))

(declare-fun c!1638 () Bool)

(assert (=> d!7222 (= c!1638 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!7222 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!7222 (= (bitStreamReadBitsIntoList!0 (_2!1386 lt!32403) (_1!1387 lt!32401) #b0000000000000000000000000000000000000000000000000000000000000001) lt!33215)))

(declare-fun b!22644 () Bool)

(declare-fun length!58 (List!278) Int)

(assert (=> b!22644 (= e!15266 (> (length!58 lt!33215) 0))))

(assert (= (and d!7222 c!1638) b!22641))

(assert (= (and d!7222 (not c!1638)) b!22642))

(assert (= (and d!7222 c!1639) b!22643))

(assert (= (and d!7222 (not c!1639)) b!22644))

(declare-fun m!31619 () Bool)

(assert (=> b!22643 m!31619))

(declare-fun m!31621 () Bool)

(assert (=> b!22642 m!31621))

(declare-fun m!31623 () Bool)

(assert (=> b!22642 m!31623))

(declare-fun m!31625 () Bool)

(assert (=> b!22644 m!31625))

(assert (=> b!22313 d!7222))

(declare-fun d!7224 () Bool)

(assert (=> d!7224 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!660 (buf!978 thiss!1379))) ((_ sign_extend 32) (currentByte!2285 thiss!1379)) ((_ sign_extend 32) (currentBit!2280 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!660 (buf!978 thiss!1379))) ((_ sign_extend 32) (currentByte!2285 thiss!1379)) ((_ sign_extend 32) (currentBit!2280 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2083 () Bool)

(assert (= bs!2083 d!7224))

(assert (=> bs!2083 m!31199))

(assert (=> b!22307 d!7224))

(declare-fun d!7226 () Bool)

(declare-fun e!15267 () Bool)

(assert (=> d!7226 e!15267))

(declare-fun res!19468 () Bool)

(assert (=> d!7226 (=> (not res!19468) (not e!15267))))

(declare-fun lt!33218 () (_ BitVec 64))

(declare-fun lt!33223 () (_ BitVec 64))

(declare-fun lt!33220 () (_ BitVec 64))

(assert (=> d!7226 (= res!19468 (= lt!33218 (bvsub lt!33223 lt!33220)))))

(assert (=> d!7226 (or (= (bvand lt!33223 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!33220 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!33223 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!33223 lt!33220) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!7226 (= lt!33220 (remainingBits!0 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!32399)))) ((_ sign_extend 32) (currentByte!2285 (_2!1386 lt!32399))) ((_ sign_extend 32) (currentBit!2280 (_2!1386 lt!32399)))))))

(declare-fun lt!33221 () (_ BitVec 64))

(declare-fun lt!33219 () (_ BitVec 64))

(assert (=> d!7226 (= lt!33223 (bvmul lt!33221 lt!33219))))

(assert (=> d!7226 (or (= lt!33221 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!33219 (bvsdiv (bvmul lt!33221 lt!33219) lt!33221)))))

(assert (=> d!7226 (= lt!33219 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!7226 (= lt!33221 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!32399)))))))

(assert (=> d!7226 (= lt!33218 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2285 (_2!1386 lt!32399))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2280 (_2!1386 lt!32399)))))))

(assert (=> d!7226 (invariant!0 (currentBit!2280 (_2!1386 lt!32399)) (currentByte!2285 (_2!1386 lt!32399)) (size!660 (buf!978 (_2!1386 lt!32399))))))

(assert (=> d!7226 (= (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!32399))) (currentByte!2285 (_2!1386 lt!32399)) (currentBit!2280 (_2!1386 lt!32399))) lt!33218)))

(declare-fun b!22645 () Bool)

(declare-fun res!19469 () Bool)

(assert (=> b!22645 (=> (not res!19469) (not e!15267))))

(assert (=> b!22645 (= res!19469 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!33218))))

(declare-fun b!22646 () Bool)

(declare-fun lt!33222 () (_ BitVec 64))

(assert (=> b!22646 (= e!15267 (bvsle lt!33218 (bvmul lt!33222 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!22646 (or (= lt!33222 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!33222 #b0000000000000000000000000000000000000000000000000000000000001000) lt!33222)))))

(assert (=> b!22646 (= lt!33222 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!32399)))))))

(assert (= (and d!7226 res!19468) b!22645))

(assert (= (and b!22645 res!19469) b!22646))

(declare-fun m!31627 () Bool)

(assert (=> d!7226 m!31627))

(assert (=> d!7226 m!31083))

(assert (=> b!22312 d!7226))

(push 1)

(assert (not b!22415))

(assert (not d!7120))

(assert (not b!22616))

(assert (not b!22643))

(assert (not b!22414))

(assert (not d!7144))

(assert (not b!22372))

(assert (not b!22438))

(assert (not d!7206))

(assert (not d!7130))

(assert (not b!22617))

(assert (not b!22408))

(assert (not b!22623))

(assert (not b!22418))

(assert (not d!7208))

(assert (not bm!326))

(assert (not b!22644))

(assert (not d!7146))

(assert (not b!22613))

(assert (not d!7140))

(assert (not d!7132))

(assert (not b!22409))

(assert (not b!22624))

(assert (not d!7126))

(assert (not b!22413))

(assert (not b!22412))

(assert (not b!22632))

(assert (not b!22416))

(assert (not b!22439))

(assert (not b!22437))

(assert (not d!7226))

(assert (not d!7224))

(assert (not b!22435))

(assert (not b!22626))

(assert (not b!22621))

(assert (not b!22618))

(assert (not b!22411))

(assert (not b!22390))

(assert (not b!22370))

(assert (not b!22410))

(assert (not b!22614))

(assert (not b!22620))

(assert (not d!7214))

(assert (not b!22642))

(assert (not d!7122))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(assert (=> b!22370 d!7132))

(declare-fun d!7228 () Bool)

(declare-fun e!15268 () Bool)

(assert (=> d!7228 e!15268))

(declare-fun res!19470 () Bool)

(assert (=> d!7228 (=> (not res!19470) (not e!15268))))

(declare-fun lt!33224 () (_ BitVec 64))

(declare-fun lt!33226 () (_ BitVec 64))

(declare-fun lt!33229 () (_ BitVec 64))

(assert (=> d!7228 (= res!19470 (= lt!33224 (bvsub lt!33229 lt!33226)))))

(assert (=> d!7228 (or (= (bvand lt!33229 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!33226 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!33229 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!33229 lt!33226) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!7228 (= lt!33226 (remainingBits!0 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!32403)))) ((_ sign_extend 32) (currentByte!2285 (_2!1386 lt!32403))) ((_ sign_extend 32) (currentBit!2280 (_2!1386 lt!32403)))))))

(declare-fun lt!33227 () (_ BitVec 64))

(declare-fun lt!33225 () (_ BitVec 64))

(assert (=> d!7228 (= lt!33229 (bvmul lt!33227 lt!33225))))

(assert (=> d!7228 (or (= lt!33227 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!33225 (bvsdiv (bvmul lt!33227 lt!33225) lt!33227)))))

(assert (=> d!7228 (= lt!33225 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!7228 (= lt!33227 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!32403)))))))

(assert (=> d!7228 (= lt!33224 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2285 (_2!1386 lt!32403))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2280 (_2!1386 lt!32403)))))))

(assert (=> d!7228 (invariant!0 (currentBit!2280 (_2!1386 lt!32403)) (currentByte!2285 (_2!1386 lt!32403)) (size!660 (buf!978 (_2!1386 lt!32403))))))

(assert (=> d!7228 (= (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!32403))) (currentByte!2285 (_2!1386 lt!32403)) (currentBit!2280 (_2!1386 lt!32403))) lt!33224)))

(declare-fun b!22647 () Bool)

(declare-fun res!19471 () Bool)

(assert (=> b!22647 (=> (not res!19471) (not e!15268))))

(assert (=> b!22647 (= res!19471 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!33224))))

(declare-fun b!22648 () Bool)

(declare-fun lt!33228 () (_ BitVec 64))

(assert (=> b!22648 (= e!15268 (bvsle lt!33224 (bvmul lt!33228 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!22648 (or (= lt!33228 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!33228 #b0000000000000000000000000000000000000000000000000000000000001000) lt!33228)))))

(assert (=> b!22648 (= lt!33228 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!32403)))))))

(assert (= (and d!7228 res!19470) b!22647))

(assert (= (and b!22647 res!19471) b!22648))

(assert (=> d!7228 m!31137))

(assert (=> d!7228 m!31081))

(assert (=> b!22370 d!7228))

(declare-fun d!7230 () Bool)

(declare-fun res!19474 () Bool)

(declare-fun e!15270 () Bool)

(assert (=> d!7230 (=> (not res!19474) (not e!15270))))

(assert (=> d!7230 (= res!19474 (= (size!660 (buf!978 (_2!1386 lt!32403))) (size!660 (buf!978 (_2!1386 lt!33196)))))))

(assert (=> d!7230 (= (isPrefixOf!0 (_2!1386 lt!32403) (_2!1386 lt!33196)) e!15270)))

(declare-fun b!22649 () Bool)

(declare-fun res!19472 () Bool)

(assert (=> b!22649 (=> (not res!19472) (not e!15270))))

(assert (=> b!22649 (= res!19472 (bvsle (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!32403))) (currentByte!2285 (_2!1386 lt!32403)) (currentBit!2280 (_2!1386 lt!32403))) (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!33196))) (currentByte!2285 (_2!1386 lt!33196)) (currentBit!2280 (_2!1386 lt!33196)))))))

(declare-fun b!22650 () Bool)

(declare-fun e!15269 () Bool)

(assert (=> b!22650 (= e!15270 e!15269)))

(declare-fun res!19473 () Bool)

(assert (=> b!22650 (=> res!19473 e!15269)))

(assert (=> b!22650 (= res!19473 (= (size!660 (buf!978 (_2!1386 lt!32403))) #b00000000000000000000000000000000))))

(declare-fun b!22651 () Bool)

(assert (=> b!22651 (= e!15269 (arrayBitRangesEq!0 (buf!978 (_2!1386 lt!32403)) (buf!978 (_2!1386 lt!33196)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!32403))) (currentByte!2285 (_2!1386 lt!32403)) (currentBit!2280 (_2!1386 lt!32403)))))))

(assert (= (and d!7230 res!19474) b!22649))

(assert (= (and b!22649 res!19472) b!22650))

(assert (= (and b!22650 (not res!19473)) b!22651))

(assert (=> b!22649 m!31133))

(assert (=> b!22649 m!31523))

(assert (=> b!22651 m!31133))

(assert (=> b!22651 m!31133))

(declare-fun m!31629 () Bool)

(assert (=> b!22651 m!31629))

(assert (=> b!22616 d!7230))

(declare-fun b!22654 () Bool)

(declare-fun e!15272 () Bool)

(declare-fun lt!33230 () List!278)

(assert (=> b!22654 (= e!15272 (isEmpty!63 lt!33230))))

(declare-fun b!22652 () Bool)

(declare-fun e!15271 () tuple2!2626)

(assert (=> b!22652 (= e!15271 (tuple2!2627 Nil!275 (_2!1399 lt!33217)))))

(declare-fun b!22653 () Bool)

(declare-fun lt!33231 () (_ BitVec 64))

(declare-fun lt!33232 () tuple2!2628)

(assert (=> b!22653 (= e!15271 (tuple2!2627 (Cons!274 (_1!1399 lt!33232) (bitStreamReadBitsIntoList!0 (_2!1386 lt!32403) (_2!1399 lt!33232) (bvsub (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!33216) lt!33231))) (_2!1399 lt!33232)))))

(assert (=> b!22653 (= lt!33232 (readBit!0 (_2!1399 lt!33217)))))

(assert (=> b!22653 (= lt!33231 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!7232 () Bool)

(assert (=> d!7232 e!15272))

(declare-fun c!1641 () Bool)

(assert (=> d!7232 (= c!1641 (= (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!33216) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!7232 (= lt!33230 (_1!1398 e!15271))))

(declare-fun c!1640 () Bool)

(assert (=> d!7232 (= c!1640 (= (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!33216) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!7232 (bvsge (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!33216) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!7232 (= (bitStreamReadBitsIntoList!0 (_2!1386 lt!32403) (_2!1399 lt!33217) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!33216)) lt!33230)))

(declare-fun b!22655 () Bool)

(assert (=> b!22655 (= e!15272 (> (length!58 lt!33230) 0))))

(assert (= (and d!7232 c!1640) b!22652))

(assert (= (and d!7232 (not c!1640)) b!22653))

(assert (= (and d!7232 c!1641) b!22654))

(assert (= (and d!7232 (not c!1641)) b!22655))

(declare-fun m!31631 () Bool)

(assert (=> b!22654 m!31631))

(declare-fun m!31633 () Bool)

(assert (=> b!22653 m!31633))

(declare-fun m!31635 () Bool)

(assert (=> b!22653 m!31635))

(declare-fun m!31637 () Bool)

(assert (=> b!22655 m!31637))

(assert (=> b!22642 d!7232))

(declare-fun d!7234 () Bool)

(declare-fun e!15279 () Bool)

(assert (=> d!7234 e!15279))

(declare-fun res!19477 () Bool)

(assert (=> d!7234 (=> (not res!19477) (not e!15279))))

(declare-fun increaseBitIndex!0 (BitStream!1154) tuple2!2602)

(assert (=> d!7234 (= res!19477 (= (buf!978 (_2!1386 (increaseBitIndex!0 (_1!1387 lt!32401)))) (buf!978 (_1!1387 lt!32401))))))

(declare-fun lt!33251 () Bool)

(assert (=> d!7234 (= lt!33251 (not (= (bvand ((_ sign_extend 24) (select (arr!1113 (buf!978 (_1!1387 lt!32401))) (currentByte!2285 (_1!1387 lt!32401)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2280 (_1!1387 lt!32401))))) #b00000000000000000000000000000000)))))

(declare-fun lt!33252 () tuple2!2628)

(assert (=> d!7234 (= lt!33252 (tuple2!2629 (not (= (bvand ((_ sign_extend 24) (select (arr!1113 (buf!978 (_1!1387 lt!32401))) (currentByte!2285 (_1!1387 lt!32401)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2280 (_1!1387 lt!32401))))) #b00000000000000000000000000000000)) (_2!1386 (increaseBitIndex!0 (_1!1387 lt!32401)))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!7234 (validate_offset_bit!0 ((_ sign_extend 32) (size!660 (buf!978 (_1!1387 lt!32401)))) ((_ sign_extend 32) (currentByte!2285 (_1!1387 lt!32401))) ((_ sign_extend 32) (currentBit!2280 (_1!1387 lt!32401))))))

(assert (=> d!7234 (= (readBit!0 (_1!1387 lt!32401)) lt!33252)))

(declare-fun b!22658 () Bool)

(declare-fun lt!33253 () (_ BitVec 64))

(declare-fun lt!33249 () (_ BitVec 64))

(assert (=> b!22658 (= e!15279 (= (bitIndex!0 (size!660 (buf!978 (_2!1386 (increaseBitIndex!0 (_1!1387 lt!32401))))) (currentByte!2285 (_2!1386 (increaseBitIndex!0 (_1!1387 lt!32401)))) (currentBit!2280 (_2!1386 (increaseBitIndex!0 (_1!1387 lt!32401))))) (bvadd lt!33249 lt!33253)))))

(assert (=> b!22658 (or (not (= (bvand lt!33249 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!33253 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!33249 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!33249 lt!33253) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!22658 (= lt!33253 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!22658 (= lt!33249 (bitIndex!0 (size!660 (buf!978 (_1!1387 lt!32401))) (currentByte!2285 (_1!1387 lt!32401)) (currentBit!2280 (_1!1387 lt!32401))))))

(declare-fun lt!33247 () Bool)

(assert (=> b!22658 (= lt!33247 (not (= (bvand ((_ sign_extend 24) (select (arr!1113 (buf!978 (_1!1387 lt!32401))) (currentByte!2285 (_1!1387 lt!32401)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2280 (_1!1387 lt!32401))))) #b00000000000000000000000000000000)))))

(declare-fun lt!33248 () Bool)

(assert (=> b!22658 (= lt!33248 (not (= (bvand ((_ sign_extend 24) (select (arr!1113 (buf!978 (_1!1387 lt!32401))) (currentByte!2285 (_1!1387 lt!32401)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2280 (_1!1387 lt!32401))))) #b00000000000000000000000000000000)))))

(declare-fun lt!33250 () Bool)

(assert (=> b!22658 (= lt!33250 (not (= (bvand ((_ sign_extend 24) (select (arr!1113 (buf!978 (_1!1387 lt!32401))) (currentByte!2285 (_1!1387 lt!32401)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2280 (_1!1387 lt!32401))))) #b00000000000000000000000000000000)))))

(assert (= (and d!7234 res!19477) b!22658))

(declare-fun m!31639 () Bool)

(assert (=> d!7234 m!31639))

(declare-fun m!31641 () Bool)

(assert (=> d!7234 m!31641))

(declare-fun m!31643 () Bool)

(assert (=> d!7234 m!31643))

(declare-fun m!31645 () Bool)

(assert (=> d!7234 m!31645))

(declare-fun m!31647 () Bool)

(assert (=> b!22658 m!31647))

(assert (=> b!22658 m!31639))

(assert (=> b!22658 m!31641))

(assert (=> b!22658 m!31643))

(declare-fun m!31649 () Bool)

(assert (=> b!22658 m!31649))

(assert (=> b!22642 d!7234))

(declare-fun d!7236 () Bool)

(assert (=> d!7236 (validate_offset_bits!1 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!32403)))) ((_ sign_extend 32) (currentByte!2285 (_2!1386 lt!32403))) ((_ sign_extend 32) (currentBit!2280 (_2!1386 lt!32403))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!7236 true))

(declare-fun _$1!288 () Unit!1930)

(assert (=> d!7236 (= (choose!27 thiss!1379 (_2!1386 lt!32403) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) _$1!288)))

(declare-fun bs!2084 () Bool)

(assert (= bs!2084 d!7236))

(assert (=> bs!2084 m!31067))

(assert (=> d!7122 d!7236))

(assert (=> b!22624 d!7132))

(assert (=> b!22624 d!7226))

(declare-fun b!22659 () Bool)

(declare-fun res!19478 () Bool)

(declare-fun e!15281 () Bool)

(assert (=> b!22659 (=> (not res!19478) (not e!15281))))

(declare-fun lt!33260 () tuple2!2604)

(assert (=> b!22659 (= res!19478 (isPrefixOf!0 (_1!1387 lt!33260) (ite c!1630 (_2!1386 lt!33190) (_2!1386 lt!32403))))))

(declare-fun d!7238 () Bool)

(assert (=> d!7238 e!15281))

(declare-fun res!19480 () Bool)

(assert (=> d!7238 (=> (not res!19480) (not e!15281))))

(assert (=> d!7238 (= res!19480 (isPrefixOf!0 (_1!1387 lt!33260) (_2!1387 lt!33260)))))

(declare-fun lt!33257 () BitStream!1154)

(assert (=> d!7238 (= lt!33260 (tuple2!2605 lt!33257 (ite c!1630 (_2!1386 lt!33171) (_2!1386 lt!32403))))))

(declare-fun lt!33262 () Unit!1930)

(declare-fun lt!33261 () Unit!1930)

(assert (=> d!7238 (= lt!33262 lt!33261)))

(assert (=> d!7238 (isPrefixOf!0 lt!33257 (ite c!1630 (_2!1386 lt!33171) (_2!1386 lt!32403)))))

(assert (=> d!7238 (= lt!33261 (lemmaIsPrefixTransitive!0 lt!33257 (ite c!1630 (_2!1386 lt!33171) (_2!1386 lt!32403)) (ite c!1630 (_2!1386 lt!33171) (_2!1386 lt!32403))))))

(declare-fun lt!33267 () Unit!1930)

(declare-fun lt!33258 () Unit!1930)

(assert (=> d!7238 (= lt!33267 lt!33258)))

(assert (=> d!7238 (isPrefixOf!0 lt!33257 (ite c!1630 (_2!1386 lt!33171) (_2!1386 lt!32403)))))

(assert (=> d!7238 (= lt!33258 (lemmaIsPrefixTransitive!0 lt!33257 (ite c!1630 (_2!1386 lt!33190) (_2!1386 lt!32403)) (ite c!1630 (_2!1386 lt!33171) (_2!1386 lt!32403))))))

(declare-fun lt!33255 () Unit!1930)

(declare-fun e!15280 () Unit!1930)

(assert (=> d!7238 (= lt!33255 e!15280)))

(declare-fun c!1642 () Bool)

(assert (=> d!7238 (= c!1642 (not (= (size!660 (buf!978 (ite c!1630 (_2!1386 lt!33190) (_2!1386 lt!32403)))) #b00000000000000000000000000000000)))))

(declare-fun lt!33264 () Unit!1930)

(declare-fun lt!33273 () Unit!1930)

(assert (=> d!7238 (= lt!33264 lt!33273)))

(assert (=> d!7238 (isPrefixOf!0 (ite c!1630 (_2!1386 lt!33171) (_2!1386 lt!32403)) (ite c!1630 (_2!1386 lt!33171) (_2!1386 lt!32403)))))

(assert (=> d!7238 (= lt!33273 (lemmaIsPrefixRefl!0 (ite c!1630 (_2!1386 lt!33171) (_2!1386 lt!32403))))))

(declare-fun lt!33268 () Unit!1930)

(declare-fun lt!33259 () Unit!1930)

(assert (=> d!7238 (= lt!33268 lt!33259)))

(assert (=> d!7238 (= lt!33259 (lemmaIsPrefixRefl!0 (ite c!1630 (_2!1386 lt!33171) (_2!1386 lt!32403))))))

(declare-fun lt!33263 () Unit!1930)

(declare-fun lt!33272 () Unit!1930)

(assert (=> d!7238 (= lt!33263 lt!33272)))

(assert (=> d!7238 (isPrefixOf!0 lt!33257 lt!33257)))

(assert (=> d!7238 (= lt!33272 (lemmaIsPrefixRefl!0 lt!33257))))

(declare-fun lt!33254 () Unit!1930)

(declare-fun lt!33270 () Unit!1930)

(assert (=> d!7238 (= lt!33254 lt!33270)))

(assert (=> d!7238 (isPrefixOf!0 (ite c!1630 (_2!1386 lt!33190) (_2!1386 lt!32403)) (ite c!1630 (_2!1386 lt!33190) (_2!1386 lt!32403)))))

(assert (=> d!7238 (= lt!33270 (lemmaIsPrefixRefl!0 (ite c!1630 (_2!1386 lt!33190) (_2!1386 lt!32403))))))

(assert (=> d!7238 (= lt!33257 (BitStream!1155 (buf!978 (ite c!1630 (_2!1386 lt!33171) (_2!1386 lt!32403))) (currentByte!2285 (ite c!1630 (_2!1386 lt!33190) (_2!1386 lt!32403))) (currentBit!2280 (ite c!1630 (_2!1386 lt!33190) (_2!1386 lt!32403)))))))

(assert (=> d!7238 (isPrefixOf!0 (ite c!1630 (_2!1386 lt!33190) (_2!1386 lt!32403)) (ite c!1630 (_2!1386 lt!33171) (_2!1386 lt!32403)))))

(assert (=> d!7238 (= (reader!0 (ite c!1630 (_2!1386 lt!33190) (_2!1386 lt!32403)) (ite c!1630 (_2!1386 lt!33171) (_2!1386 lt!32403))) lt!33260)))

(declare-fun b!22660 () Bool)

(declare-fun Unit!1956 () Unit!1930)

(assert (=> b!22660 (= e!15280 Unit!1956)))

(declare-fun lt!33271 () (_ BitVec 64))

(declare-fun lt!33256 () (_ BitVec 64))

(declare-fun b!22661 () Bool)

(assert (=> b!22661 (= e!15281 (= (_1!1387 lt!33260) (withMovedBitIndex!0 (_2!1387 lt!33260) (bvsub lt!33271 lt!33256))))))

(assert (=> b!22661 (or (= (bvand lt!33271 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!33256 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!33271 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!33271 lt!33256) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!22661 (= lt!33256 (bitIndex!0 (size!660 (buf!978 (ite c!1630 (_2!1386 lt!33171) (_2!1386 lt!32403)))) (currentByte!2285 (ite c!1630 (_2!1386 lt!33171) (_2!1386 lt!32403))) (currentBit!2280 (ite c!1630 (_2!1386 lt!33171) (_2!1386 lt!32403)))))))

(assert (=> b!22661 (= lt!33271 (bitIndex!0 (size!660 (buf!978 (ite c!1630 (_2!1386 lt!33190) (_2!1386 lt!32403)))) (currentByte!2285 (ite c!1630 (_2!1386 lt!33190) (_2!1386 lt!32403))) (currentBit!2280 (ite c!1630 (_2!1386 lt!33190) (_2!1386 lt!32403)))))))

(declare-fun b!22662 () Bool)

(declare-fun res!19479 () Bool)

(assert (=> b!22662 (=> (not res!19479) (not e!15281))))

(assert (=> b!22662 (= res!19479 (isPrefixOf!0 (_2!1387 lt!33260) (ite c!1630 (_2!1386 lt!33171) (_2!1386 lt!32403))))))

(declare-fun b!22663 () Bool)

(declare-fun lt!33269 () Unit!1930)

(assert (=> b!22663 (= e!15280 lt!33269)))

(declare-fun lt!33265 () (_ BitVec 64))

(assert (=> b!22663 (= lt!33265 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!33266 () (_ BitVec 64))

(assert (=> b!22663 (= lt!33266 (bitIndex!0 (size!660 (buf!978 (ite c!1630 (_2!1386 lt!33190) (_2!1386 lt!32403)))) (currentByte!2285 (ite c!1630 (_2!1386 lt!33190) (_2!1386 lt!32403))) (currentBit!2280 (ite c!1630 (_2!1386 lt!33190) (_2!1386 lt!32403)))))))

(assert (=> b!22663 (= lt!33269 (arrayBitRangesEqSymmetric!0 (buf!978 (ite c!1630 (_2!1386 lt!33190) (_2!1386 lt!32403))) (buf!978 (ite c!1630 (_2!1386 lt!33171) (_2!1386 lt!32403))) lt!33265 lt!33266))))

(assert (=> b!22663 (arrayBitRangesEq!0 (buf!978 (ite c!1630 (_2!1386 lt!33171) (_2!1386 lt!32403))) (buf!978 (ite c!1630 (_2!1386 lt!33190) (_2!1386 lt!32403))) lt!33265 lt!33266)))

(assert (= (and d!7238 c!1642) b!22663))

(assert (= (and d!7238 (not c!1642)) b!22660))

(assert (= (and d!7238 res!19480) b!22659))

(assert (= (and b!22659 res!19478) b!22662))

(assert (= (and b!22662 res!19479) b!22661))

(declare-fun m!31651 () Bool)

(assert (=> b!22663 m!31651))

(declare-fun m!31653 () Bool)

(assert (=> b!22663 m!31653))

(declare-fun m!31655 () Bool)

(assert (=> b!22663 m!31655))

(declare-fun m!31657 () Bool)

(assert (=> b!22662 m!31657))

(declare-fun m!31659 () Bool)

(assert (=> b!22661 m!31659))

(declare-fun m!31661 () Bool)

(assert (=> b!22661 m!31661))

(assert (=> b!22661 m!31651))

(declare-fun m!31663 () Bool)

(assert (=> b!22659 m!31663))

(declare-fun m!31665 () Bool)

(assert (=> d!7238 m!31665))

(declare-fun m!31667 () Bool)

(assert (=> d!7238 m!31667))

(declare-fun m!31669 () Bool)

(assert (=> d!7238 m!31669))

(declare-fun m!31671 () Bool)

(assert (=> d!7238 m!31671))

(declare-fun m!31673 () Bool)

(assert (=> d!7238 m!31673))

(declare-fun m!31675 () Bool)

(assert (=> d!7238 m!31675))

(declare-fun m!31677 () Bool)

(assert (=> d!7238 m!31677))

(declare-fun m!31679 () Bool)

(assert (=> d!7238 m!31679))

(declare-fun m!31681 () Bool)

(assert (=> d!7238 m!31681))

(declare-fun m!31683 () Bool)

(assert (=> d!7238 m!31683))

(declare-fun m!31685 () Bool)

(assert (=> d!7238 m!31685))

(assert (=> bm!326 d!7238))

(declare-fun d!7240 () Bool)

(declare-fun c!1643 () Bool)

(assert (=> d!7240 (= c!1643 (= (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!15282 () List!278)

(assert (=> d!7240 (= (byteArrayBitContentToList!0 (_2!1386 lt!32403) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001)) e!15282)))

(declare-fun b!22664 () Bool)

(assert (=> b!22664 (= e!15282 Nil!275)))

(declare-fun b!22665 () Bool)

(assert (=> b!22665 (= e!15282 (Cons!274 (not (= (bvand ((_ sign_extend 24) (select (arr!1113 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1386 lt!32403) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!7240 c!1643) b!22664))

(assert (= (and d!7240 (not c!1643)) b!22665))

(declare-fun m!31687 () Bool)

(assert (=> b!22665 m!31687))

(declare-fun m!31689 () Bool)

(assert (=> b!22665 m!31689))

(declare-fun m!31691 () Bool)

(assert (=> b!22665 m!31691))

(assert (=> b!22632 d!7240))

(declare-fun d!7242 () Bool)

(assert (=> d!7242 (= (isEmpty!63 lt!33215) (is-Nil!275 lt!33215))))

(assert (=> b!22643 d!7242))

(declare-fun d!7244 () Bool)

(assert (=> d!7244 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!32403)))) ((_ sign_extend 32) (currentByte!2285 (_2!1386 lt!32403))) ((_ sign_extend 32) (currentBit!2280 (_2!1386 lt!32403))) lt!33194) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!32403)))) ((_ sign_extend 32) (currentByte!2285 (_2!1386 lt!32403))) ((_ sign_extend 32) (currentBit!2280 (_2!1386 lt!32403)))) lt!33194))))

(declare-fun bs!2085 () Bool)

(assert (= bs!2085 d!7244))

(assert (=> bs!2085 m!31137))

(assert (=> b!22617 d!7244))

(declare-fun d!7246 () Bool)

(declare-fun e!15283 () Bool)

(assert (=> d!7246 e!15283))

(declare-fun res!19481 () Bool)

(assert (=> d!7246 (=> (not res!19481) (not e!15283))))

(declare-fun lt!33276 () (_ BitVec 64))

(declare-fun lt!33279 () (_ BitVec 64))

(declare-fun lt!33274 () (_ BitVec 64))

(assert (=> d!7246 (= res!19481 (= lt!33274 (bvsub lt!33279 lt!33276)))))

(assert (=> d!7246 (or (= (bvand lt!33279 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!33276 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!33279 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!33279 lt!33276) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!7246 (= lt!33276 (remainingBits!0 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!33196)))) ((_ sign_extend 32) (currentByte!2285 (_2!1386 lt!33196))) ((_ sign_extend 32) (currentBit!2280 (_2!1386 lt!33196)))))))

(declare-fun lt!33277 () (_ BitVec 64))

(declare-fun lt!33275 () (_ BitVec 64))

(assert (=> d!7246 (= lt!33279 (bvmul lt!33277 lt!33275))))

(assert (=> d!7246 (or (= lt!33277 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!33275 (bvsdiv (bvmul lt!33277 lt!33275) lt!33277)))))

(assert (=> d!7246 (= lt!33275 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!7246 (= lt!33277 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!33196)))))))

(assert (=> d!7246 (= lt!33274 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2285 (_2!1386 lt!33196))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2280 (_2!1386 lt!33196)))))))

(assert (=> d!7246 (invariant!0 (currentBit!2280 (_2!1386 lt!33196)) (currentByte!2285 (_2!1386 lt!33196)) (size!660 (buf!978 (_2!1386 lt!33196))))))

(assert (=> d!7246 (= (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!33196))) (currentByte!2285 (_2!1386 lt!33196)) (currentBit!2280 (_2!1386 lt!33196))) lt!33274)))

(declare-fun b!22666 () Bool)

(declare-fun res!19482 () Bool)

(assert (=> b!22666 (=> (not res!19482) (not e!15283))))

(assert (=> b!22666 (= res!19482 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!33274))))

(declare-fun b!22667 () Bool)

(declare-fun lt!33278 () (_ BitVec 64))

(assert (=> b!22667 (= e!15283 (bvsle lt!33274 (bvmul lt!33278 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!22667 (or (= lt!33278 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!33278 #b0000000000000000000000000000000000000000000000000000000000001000) lt!33278)))))

(assert (=> b!22667 (= lt!33278 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!33196)))))))

(assert (= (and d!7246 res!19481) b!22666))

(assert (= (and b!22666 res!19482) b!22667))

(declare-fun m!31693 () Bool)

(assert (=> d!7246 m!31693))

(assert (=> d!7246 m!31521))

(assert (=> d!7146 d!7246))

(assert (=> d!7146 d!7228))

(declare-fun d!7248 () Bool)

(declare-fun res!19485 () Bool)

(declare-fun e!15285 () Bool)

(assert (=> d!7248 (=> (not res!19485) (not e!15285))))

(assert (=> d!7248 (= res!19485 (= (size!660 (buf!978 (_2!1386 lt!32403))) (size!660 (buf!978 (_2!1386 lt!32403)))))))

(assert (=> d!7248 (= (isPrefixOf!0 (_2!1386 lt!32403) (_2!1386 lt!32403)) e!15285)))

(declare-fun b!22668 () Bool)

(declare-fun res!19483 () Bool)

(assert (=> b!22668 (=> (not res!19483) (not e!15285))))

(assert (=> b!22668 (= res!19483 (bvsle (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!32403))) (currentByte!2285 (_2!1386 lt!32403)) (currentBit!2280 (_2!1386 lt!32403))) (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!32403))) (currentByte!2285 (_2!1386 lt!32403)) (currentBit!2280 (_2!1386 lt!32403)))))))

(declare-fun b!22669 () Bool)

(declare-fun e!15284 () Bool)

(assert (=> b!22669 (= e!15285 e!15284)))

(declare-fun res!19484 () Bool)

(assert (=> b!22669 (=> res!19484 e!15284)))

(assert (=> b!22669 (= res!19484 (= (size!660 (buf!978 (_2!1386 lt!32403))) #b00000000000000000000000000000000))))

(declare-fun b!22670 () Bool)

(assert (=> b!22670 (= e!15284 (arrayBitRangesEq!0 (buf!978 (_2!1386 lt!32403)) (buf!978 (_2!1386 lt!32403)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!32403))) (currentByte!2285 (_2!1386 lt!32403)) (currentBit!2280 (_2!1386 lt!32403)))))))

(assert (= (and d!7248 res!19485) b!22668))

(assert (= (and b!22668 res!19483) b!22669))

(assert (= (and b!22669 (not res!19484)) b!22670))

(assert (=> b!22668 m!31133))

(assert (=> b!22668 m!31133))

(assert (=> b!22670 m!31133))

(assert (=> b!22670 m!31133))

(declare-fun m!31695 () Bool)

(assert (=> b!22670 m!31695))

(assert (=> d!7146 d!7248))

(declare-fun d!7250 () Bool)

(assert (=> d!7250 (isPrefixOf!0 (_2!1386 lt!32403) (_2!1386 lt!32403))))

(declare-fun lt!33280 () Unit!1930)

(assert (=> d!7250 (= lt!33280 (choose!11 (_2!1386 lt!32403)))))

(assert (=> d!7250 (= (lemmaIsPrefixRefl!0 (_2!1386 lt!32403)) lt!33280)))

(declare-fun bs!2086 () Bool)

(assert (= bs!2086 d!7250))

(assert (=> bs!2086 m!31219))

(declare-fun m!31697 () Bool)

(assert (=> bs!2086 m!31697))

(assert (=> d!7146 d!7250))

(declare-fun d!7252 () Bool)

(assert (=> d!7252 (= (invariant!0 (currentBit!2280 (_2!1386 lt!33196)) (currentByte!2285 (_2!1386 lt!33196)) (size!660 (buf!978 (_2!1386 lt!33196)))) (and (bvsge (currentBit!2280 (_2!1386 lt!33196)) #b00000000000000000000000000000000) (bvslt (currentBit!2280 (_2!1386 lt!33196)) #b00000000000000000000000000001000) (bvsge (currentByte!2285 (_2!1386 lt!33196)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2285 (_2!1386 lt!33196)) (size!660 (buf!978 (_2!1386 lt!33196)))) (and (= (currentBit!2280 (_2!1386 lt!33196)) #b00000000000000000000000000000000) (= (currentByte!2285 (_2!1386 lt!33196)) (size!660 (buf!978 (_2!1386 lt!33196))))))))))

(assert (=> b!22614 d!7252))

(declare-fun d!7254 () Bool)

(assert (=> d!7254 (= (remainingBits!0 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!32403)))) ((_ sign_extend 32) (currentByte!2285 thiss!1379)) ((_ sign_extend 32) (currentBit!2280 thiss!1379))) (bvsub (bvmul ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!32403)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!2285 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2280 thiss!1379)))))))

(assert (=> d!7208 d!7254))

(declare-fun d!7256 () Bool)

(declare-fun e!15286 () Bool)

(assert (=> d!7256 e!15286))

(declare-fun res!19486 () Bool)

(assert (=> d!7256 (=> (not res!19486) (not e!15286))))

(declare-fun lt!33286 () (_ BitVec 64))

(declare-fun lt!33281 () (_ BitVec 64))

(declare-fun lt!33283 () (_ BitVec 64))

(assert (=> d!7256 (= res!19486 (= lt!33281 (bvsub lt!33286 lt!33283)))))

(assert (=> d!7256 (or (= (bvand lt!33286 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!33283 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!33286 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!33286 lt!33283) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!7256 (= lt!33283 (remainingBits!0 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!32540)))) ((_ sign_extend 32) (currentByte!2285 (_2!1386 lt!32540))) ((_ sign_extend 32) (currentBit!2280 (_2!1386 lt!32540)))))))

(declare-fun lt!33284 () (_ BitVec 64))

(declare-fun lt!33282 () (_ BitVec 64))

(assert (=> d!7256 (= lt!33286 (bvmul lt!33284 lt!33282))))

(assert (=> d!7256 (or (= lt!33284 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!33282 (bvsdiv (bvmul lt!33284 lt!33282) lt!33284)))))

(assert (=> d!7256 (= lt!33282 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!7256 (= lt!33284 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!32540)))))))

(assert (=> d!7256 (= lt!33281 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2285 (_2!1386 lt!32540))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2280 (_2!1386 lt!32540)))))))

(assert (=> d!7256 (invariant!0 (currentBit!2280 (_2!1386 lt!32540)) (currentByte!2285 (_2!1386 lt!32540)) (size!660 (buf!978 (_2!1386 lt!32540))))))

(assert (=> d!7256 (= (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!32540))) (currentByte!2285 (_2!1386 lt!32540)) (currentBit!2280 (_2!1386 lt!32540))) lt!33281)))

(declare-fun b!22671 () Bool)

(declare-fun res!19487 () Bool)

(assert (=> b!22671 (=> (not res!19487) (not e!15286))))

(assert (=> b!22671 (= res!19487 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!33281))))

(declare-fun b!22672 () Bool)

(declare-fun lt!33285 () (_ BitVec 64))

(assert (=> b!22672 (= e!15286 (bvsle lt!33281 (bvmul lt!33285 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!22672 (or (= lt!33285 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!33285 #b0000000000000000000000000000000000000000000000000000000000001000) lt!33285)))))

(assert (=> b!22672 (= lt!33285 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!32540)))))))

(assert (= (and d!7256 res!19486) b!22671))

(assert (= (and b!22671 res!19487) b!22672))

(declare-fun m!31699 () Bool)

(assert (=> d!7256 m!31699))

(declare-fun m!31701 () Bool)

(assert (=> d!7256 m!31701))

(assert (=> b!22409 d!7256))

(assert (=> b!22409 d!7132))

(assert (=> d!7214 d!7212))

(declare-fun d!7258 () Bool)

(assert (=> d!7258 (isPrefixOf!0 thiss!1379 (_2!1386 lt!32399))))

(assert (=> d!7258 true))

(declare-fun _$15!144 () Unit!1930)

(assert (=> d!7258 (= (choose!30 thiss!1379 (_2!1386 lt!32403) (_2!1386 lt!32399)) _$15!144)))

(declare-fun bs!2087 () Bool)

(assert (= bs!2087 d!7258))

(assert (=> bs!2087 m!31057))

(assert (=> d!7214 d!7258))

(assert (=> d!7214 d!7118))

(declare-fun d!7260 () Bool)

(declare-fun res!19490 () Bool)

(declare-fun e!15288 () Bool)

(assert (=> d!7260 (=> (not res!19490) (not e!15288))))

(assert (=> d!7260 (= res!19490 (= (size!660 (buf!978 thiss!1379)) (size!660 (buf!978 (_2!1386 lt!32545)))))))

(assert (=> d!7260 (= (isPrefixOf!0 thiss!1379 (_2!1386 lt!32545)) e!15288)))

(declare-fun b!22673 () Bool)

(declare-fun res!19488 () Bool)

(assert (=> b!22673 (=> (not res!19488) (not e!15288))))

(assert (=> b!22673 (= res!19488 (bvsle (bitIndex!0 (size!660 (buf!978 thiss!1379)) (currentByte!2285 thiss!1379) (currentBit!2280 thiss!1379)) (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!32545))) (currentByte!2285 (_2!1386 lt!32545)) (currentBit!2280 (_2!1386 lt!32545)))))))

(declare-fun b!22674 () Bool)

(declare-fun e!15287 () Bool)

(assert (=> b!22674 (= e!15288 e!15287)))

(declare-fun res!19489 () Bool)

(assert (=> b!22674 (=> res!19489 e!15287)))

(assert (=> b!22674 (= res!19489 (= (size!660 (buf!978 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!22675 () Bool)

(assert (=> b!22675 (= e!15287 (arrayBitRangesEq!0 (buf!978 thiss!1379) (buf!978 (_2!1386 lt!32545)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!660 (buf!978 thiss!1379)) (currentByte!2285 thiss!1379) (currentBit!2280 thiss!1379))))))

(assert (= (and d!7260 res!19490) b!22673))

(assert (= (and b!22673 res!19488) b!22674))

(assert (= (and b!22674 (not res!19489)) b!22675))

(assert (=> b!22673 m!31079))

(assert (=> b!22673 m!31173))

(assert (=> b!22675 m!31079))

(assert (=> b!22675 m!31079))

(declare-fun m!31703 () Bool)

(assert (=> b!22675 m!31703))

(assert (=> b!22408 d!7260))

(assert (=> b!22416 d!7132))

(assert (=> d!7206 d!7208))

(declare-fun d!7262 () Bool)

(assert (=> d!7262 (validate_offset_bits!1 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!32403)))) ((_ sign_extend 32) (currentByte!2285 thiss!1379)) ((_ sign_extend 32) (currentBit!2280 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!7262 true))

(declare-fun _$6!177 () Unit!1930)

(assert (=> d!7262 (= (choose!9 thiss!1379 (buf!978 (_2!1386 lt!32403)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1155 (buf!978 (_2!1386 lt!32403)) (currentByte!2285 thiss!1379) (currentBit!2280 thiss!1379))) _$6!177)))

(declare-fun bs!2088 () Bool)

(assert (= bs!2088 d!7262))

(assert (=> bs!2088 m!31061))

(assert (=> d!7206 d!7262))

(declare-fun d!7264 () Bool)

(declare-fun size!661 (List!278) Int)

(assert (=> d!7264 (= (length!58 lt!33215) (size!661 lt!33215))))

(declare-fun bs!2089 () Bool)

(assert (= bs!2089 d!7264))

(declare-fun m!31705 () Bool)

(assert (=> bs!2089 m!31705))

(assert (=> b!22644 d!7264))

(declare-fun b!22690 () Bool)

(declare-fun res!19505 () Bool)

(declare-fun lt!33294 () (_ BitVec 32))

(assert (=> b!22690 (= res!19505 (= lt!33294 #b00000000000000000000000000000000))))

(declare-fun e!15301 () Bool)

(assert (=> b!22690 (=> res!19505 e!15301)))

(declare-fun e!15305 () Bool)

(assert (=> b!22690 (= e!15305 e!15301)))

(declare-fun b!22691 () Bool)

(declare-fun e!15304 () Bool)

(declare-fun e!15306 () Bool)

(assert (=> b!22691 (= e!15304 e!15306)))

(declare-fun res!19501 () Bool)

(assert (=> b!22691 (=> (not res!19501) (not e!15306))))

(declare-fun e!15303 () Bool)

(assert (=> b!22691 (= res!19501 e!15303)))

(declare-fun res!19502 () Bool)

(assert (=> b!22691 (=> res!19502 e!15303)))

(declare-datatypes ((tuple4!12 0))(
  ( (tuple4!13 (_1!1400 (_ BitVec 32)) (_2!1400 (_ BitVec 32)) (_3!85 (_ BitVec 32)) (_4!6 (_ BitVec 32))) )
))
(declare-fun lt!33295 () tuple4!12)

(assert (=> b!22691 (= res!19502 (bvsge (_1!1400 lt!33295) (_2!1400 lt!33295)))))

(assert (=> b!22691 (= lt!33294 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!660 (buf!978 thiss!1379)) (currentByte!2285 thiss!1379) (currentBit!2280 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!33293 () (_ BitVec 32))

(assert (=> b!22691 (= lt!33293 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!12)

(assert (=> b!22691 (= lt!33295 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!660 (buf!978 thiss!1379)) (currentByte!2285 thiss!1379) (currentBit!2280 thiss!1379))))))

(declare-fun b!22692 () Bool)

(declare-fun e!15302 () Bool)

(assert (=> b!22692 (= e!15302 e!15305)))

(declare-fun res!19503 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!22692 (= res!19503 (byteRangesEq!0 (select (arr!1113 (buf!978 thiss!1379)) (_3!85 lt!33295)) (select (arr!1113 (buf!978 (_2!1386 lt!32399))) (_3!85 lt!33295)) lt!33293 #b00000000000000000000000000001000))))

(assert (=> b!22692 (=> (not res!19503) (not e!15305))))

(declare-fun b!22693 () Bool)

(declare-fun call!332 () Bool)

(assert (=> b!22693 (= e!15301 call!332)))

(declare-fun bm!329 () Bool)

(declare-fun c!1646 () Bool)

(assert (=> bm!329 (= call!332 (byteRangesEq!0 (ite c!1646 (select (arr!1113 (buf!978 thiss!1379)) (_3!85 lt!33295)) (select (arr!1113 (buf!978 thiss!1379)) (_4!6 lt!33295))) (ite c!1646 (select (arr!1113 (buf!978 (_2!1386 lt!32399))) (_3!85 lt!33295)) (select (arr!1113 (buf!978 (_2!1386 lt!32399))) (_4!6 lt!33295))) (ite c!1646 lt!33293 #b00000000000000000000000000000000) lt!33294))))

(declare-fun b!22694 () Bool)

(assert (=> b!22694 (= e!15306 e!15302)))

(assert (=> b!22694 (= c!1646 (= (_3!85 lt!33295) (_4!6 lt!33295)))))

(declare-fun b!22695 () Bool)

(declare-fun arrayRangesEq!7 (array!1548 array!1548 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!22695 (= e!15303 (arrayRangesEq!7 (buf!978 thiss!1379) (buf!978 (_2!1386 lt!32399)) (_1!1400 lt!33295) (_2!1400 lt!33295)))))

(declare-fun b!22696 () Bool)

(assert (=> b!22696 (= e!15302 call!332)))

(declare-fun d!7266 () Bool)

(declare-fun res!19504 () Bool)

(assert (=> d!7266 (=> res!19504 e!15304)))

(assert (=> d!7266 (= res!19504 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!660 (buf!978 thiss!1379)) (currentByte!2285 thiss!1379) (currentBit!2280 thiss!1379))))))

(assert (=> d!7266 (= (arrayBitRangesEq!0 (buf!978 thiss!1379) (buf!978 (_2!1386 lt!32399)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!660 (buf!978 thiss!1379)) (currentByte!2285 thiss!1379) (currentBit!2280 thiss!1379))) e!15304)))

(assert (= (and d!7266 (not res!19504)) b!22691))

(assert (= (and b!22691 (not res!19502)) b!22695))

(assert (= (and b!22691 res!19501) b!22694))

(assert (= (and b!22694 c!1646) b!22696))

(assert (= (and b!22694 (not c!1646)) b!22692))

(assert (= (and b!22692 res!19503) b!22690))

(assert (= (and b!22690 (not res!19505)) b!22693))

(assert (= (or b!22696 b!22693) bm!329))

(assert (=> b!22691 m!31079))

(declare-fun m!31707 () Bool)

(assert (=> b!22691 m!31707))

(declare-fun m!31709 () Bool)

(assert (=> b!22692 m!31709))

(declare-fun m!31711 () Bool)

(assert (=> b!22692 m!31711))

(assert (=> b!22692 m!31709))

(assert (=> b!22692 m!31711))

(declare-fun m!31713 () Bool)

(assert (=> b!22692 m!31713))

(assert (=> bm!329 m!31709))

(assert (=> bm!329 m!31711))

(declare-fun m!31715 () Bool)

(assert (=> bm!329 m!31715))

(declare-fun m!31717 () Bool)

(assert (=> bm!329 m!31717))

(declare-fun m!31719 () Bool)

(assert (=> bm!329 m!31719))

(declare-fun m!31721 () Bool)

(assert (=> b!22695 m!31721))

(assert (=> b!22626 d!7266))

(assert (=> b!22626 d!7132))

(declare-fun d!7268 () Bool)

(declare-fun res!19510 () Bool)

(declare-fun e!15311 () Bool)

(assert (=> d!7268 (=> res!19510 e!15311)))

(assert (=> d!7268 (= res!19510 (= (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!7268 (= (checkByteArrayBitContent!0 (_2!1386 lt!32403) srcBuffer!2 (_1!1397 (readBits!0 (_1!1387 call!329) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) e!15311)))

(declare-fun b!22701 () Bool)

(declare-fun e!15312 () Bool)

(assert (=> b!22701 (= e!15311 e!15312)))

(declare-fun res!19511 () Bool)

(assert (=> b!22701 (=> (not res!19511) (not e!15312))))

(assert (=> b!22701 (= res!19511 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!1113 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!1113 (_1!1397 (readBits!0 (_1!1387 call!329) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!22702 () Bool)

(assert (=> b!22702 (= e!15312 (checkByteArrayBitContent!0 (_2!1386 lt!32403) srcBuffer!2 (_1!1397 (readBits!0 (_1!1387 call!329) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!7268 (not res!19510)) b!22701))

(assert (= (and b!22701 res!19511) b!22702))

(assert (=> b!22701 m!31541))

(declare-fun m!31723 () Bool)

(assert (=> b!22701 m!31723))

(declare-fun m!31725 () Bool)

(assert (=> b!22701 m!31725))

(declare-fun m!31727 () Bool)

(assert (=> b!22701 m!31727))

(declare-fun m!31729 () Bool)

(assert (=> b!22702 m!31729))

(assert (=> b!22618 d!7268))

(declare-fun b!22713 () Bool)

(declare-fun res!19526 () Bool)

(declare-fun e!15315 () Bool)

(assert (=> b!22713 (=> (not res!19526) (not e!15315))))

(declare-fun lt!33321 () tuple2!2624)

(declare-fun lt!33318 () (_ BitVec 64))

(assert (=> b!22713 (= res!19526 (= (bvadd lt!33318 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (bitIndex!0 (size!660 (buf!978 (_2!1397 lt!33321))) (currentByte!2285 (_2!1397 lt!33321)) (currentBit!2280 (_2!1397 lt!33321)))))))

(assert (=> b!22713 (or (not (= (bvand lt!33318 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!33318 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!33318 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!22713 (= lt!33318 (bitIndex!0 (size!660 (buf!978 (_1!1387 call!329))) (currentByte!2285 (_1!1387 call!329)) (currentBit!2280 (_1!1387 call!329))))))

(declare-fun d!7270 () Bool)

(assert (=> d!7270 e!15315))

(declare-fun res!19523 () Bool)

(assert (=> d!7270 (=> (not res!19523) (not e!15315))))

(assert (=> d!7270 (= res!19523 (= (buf!978 (_2!1397 lt!33321)) (buf!978 (_1!1387 call!329))))))

(declare-datatypes ((tuple3!158 0))(
  ( (tuple3!159 (_1!1401 Unit!1930) (_2!1401 BitStream!1154) (_3!86 array!1548)) )
))
(declare-fun lt!33320 () tuple3!158)

(assert (=> d!7270 (= lt!33321 (tuple2!2625 (_3!86 lt!33320) (_2!1401 lt!33320)))))

(declare-fun readBitsLoop!0 (BitStream!1154 (_ BitVec 64) array!1548 (_ BitVec 64) (_ BitVec 64)) tuple3!158)

(assert (=> d!7270 (= lt!33320 (readBitsLoop!0 (_1!1387 call!329) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) (array!1549 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!7270 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (bvsle (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!7270 (= (readBits!0 (_1!1387 call!329) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) lt!33321)))

(declare-fun b!22714 () Bool)

(declare-fun res!19522 () Bool)

(assert (=> b!22714 (=> (not res!19522) (not e!15315))))

(assert (=> b!22714 (= res!19522 (bvsle (currentByte!2285 (_1!1387 call!329)) (currentByte!2285 (_2!1397 lt!33321))))))

(declare-fun b!22715 () Bool)

(assert (=> b!22715 (= e!15315 (= (byteArrayBitContentToList!0 (_2!1397 lt!33321) (_1!1397 lt!33321) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (bitStreamReadBitsIntoList!0 (_2!1397 lt!33321) (_1!1387 call!329) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(declare-fun b!22716 () Bool)

(declare-fun res!19525 () Bool)

(assert (=> b!22716 (=> (not res!19525) (not e!15315))))

(declare-fun lt!33314 () (_ BitVec 64))

(assert (=> b!22716 (= res!19525 (= (size!660 (_1!1397 lt!33321)) ((_ extract 31 0) lt!33314)))))

(assert (=> b!22716 (and (bvslt lt!33314 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!33314 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!33319 () (_ BitVec 64))

(declare-fun lt!33317 () (_ BitVec 64))

(assert (=> b!22716 (= lt!33314 (bvsdiv lt!33319 lt!33317))))

(assert (=> b!22716 (and (not (= lt!33317 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!33319 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!33317 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!22716 (= lt!33317 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!33315 () (_ BitVec 64))

(declare-fun lt!33316 () (_ BitVec 64))

(assert (=> b!22716 (= lt!33319 (bvsub lt!33315 lt!33316))))

(assert (=> b!22716 (or (= (bvand lt!33315 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!33316 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!33315 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!33315 lt!33316) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!22716 (= lt!33316 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!33322 () (_ BitVec 64))

(assert (=> b!22716 (= lt!33315 (bvadd (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) lt!33322))))

(assert (=> b!22716 (or (not (= (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!33322 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) lt!33322) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!22716 (= lt!33322 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!22717 () Bool)

(declare-fun res!19524 () Bool)

(assert (=> b!22717 (=> (not res!19524) (not e!15315))))

(assert (=> b!22717 (= res!19524 (invariant!0 (currentBit!2280 (_2!1397 lt!33321)) (currentByte!2285 (_2!1397 lt!33321)) (size!660 (buf!978 (_2!1397 lt!33321)))))))

(assert (= (and d!7270 res!19523) b!22713))

(assert (= (and b!22713 res!19526) b!22717))

(assert (= (and b!22717 res!19524) b!22716))

(assert (= (and b!22716 res!19525) b!22714))

(assert (= (and b!22714 res!19522) b!22715))

(declare-fun m!31731 () Bool)

(assert (=> b!22713 m!31731))

(declare-fun m!31733 () Bool)

(assert (=> b!22713 m!31733))

(declare-fun m!31735 () Bool)

(assert (=> d!7270 m!31735))

(declare-fun m!31737 () Bool)

(assert (=> b!22715 m!31737))

(declare-fun m!31739 () Bool)

(assert (=> b!22715 m!31739))

(declare-fun m!31741 () Bool)

(assert (=> b!22717 m!31741))

(assert (=> b!22618 d!7270))

(declare-fun d!7272 () Bool)

(assert (=> d!7272 (= (remainingBits!0 ((_ sign_extend 32) (size!660 (buf!978 thiss!1379))) ((_ sign_extend 32) (currentByte!2285 thiss!1379)) ((_ sign_extend 32) (currentBit!2280 thiss!1379))) (bvsub (bvmul ((_ sign_extend 32) (size!660 (buf!978 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!2285 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2280 thiss!1379)))))))

(assert (=> d!7132 d!7272))

(declare-fun d!7274 () Bool)

(assert (=> d!7274 (= (invariant!0 (currentBit!2280 thiss!1379) (currentByte!2285 thiss!1379) (size!660 (buf!978 thiss!1379))) (and (bvsge (currentBit!2280 thiss!1379) #b00000000000000000000000000000000) (bvslt (currentBit!2280 thiss!1379) #b00000000000000000000000000001000) (bvsge (currentByte!2285 thiss!1379) #b00000000000000000000000000000000) (or (bvslt (currentByte!2285 thiss!1379) (size!660 (buf!978 thiss!1379))) (and (= (currentBit!2280 thiss!1379) #b00000000000000000000000000000000) (= (currentByte!2285 thiss!1379) (size!660 (buf!978 thiss!1379)))))))))

(assert (=> d!7132 d!7274))

(declare-fun b!22718 () Bool)

(declare-fun res!19531 () Bool)

(declare-fun lt!33324 () (_ BitVec 32))

(assert (=> b!22718 (= res!19531 (= lt!33324 #b00000000000000000000000000000000))))

(declare-fun e!15316 () Bool)

(assert (=> b!22718 (=> res!19531 e!15316)))

(declare-fun e!15320 () Bool)

(assert (=> b!22718 (= e!15320 e!15316)))

(declare-fun b!22719 () Bool)

(declare-fun e!15319 () Bool)

(declare-fun e!15321 () Bool)

(assert (=> b!22719 (= e!15319 e!15321)))

(declare-fun res!19527 () Bool)

(assert (=> b!22719 (=> (not res!19527) (not e!15321))))

(declare-fun e!15318 () Bool)

(assert (=> b!22719 (= res!19527 e!15318)))

(declare-fun res!19528 () Bool)

(assert (=> b!22719 (=> res!19528 e!15318)))

(declare-fun lt!33325 () tuple4!12)

(assert (=> b!22719 (= res!19528 (bvsge (_1!1400 lt!33325) (_2!1400 lt!33325)))))

(assert (=> b!22719 (= lt!33324 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!660 (buf!978 thiss!1379)) (currentByte!2285 thiss!1379) (currentBit!2280 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!33323 () (_ BitVec 32))

(assert (=> b!22719 (= lt!33323 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!22719 (= lt!33325 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!660 (buf!978 thiss!1379)) (currentByte!2285 thiss!1379) (currentBit!2280 thiss!1379))))))

(declare-fun b!22720 () Bool)

(declare-fun e!15317 () Bool)

(assert (=> b!22720 (= e!15317 e!15320)))

(declare-fun res!19529 () Bool)

(assert (=> b!22720 (= res!19529 (byteRangesEq!0 (select (arr!1113 (buf!978 thiss!1379)) (_3!85 lt!33325)) (select (arr!1113 (buf!978 (_2!1386 lt!32403))) (_3!85 lt!33325)) lt!33323 #b00000000000000000000000000001000))))

(assert (=> b!22720 (=> (not res!19529) (not e!15320))))

(declare-fun b!22721 () Bool)

(declare-fun call!333 () Bool)

(assert (=> b!22721 (= e!15316 call!333)))

(declare-fun bm!330 () Bool)

(declare-fun c!1647 () Bool)

(assert (=> bm!330 (= call!333 (byteRangesEq!0 (ite c!1647 (select (arr!1113 (buf!978 thiss!1379)) (_3!85 lt!33325)) (select (arr!1113 (buf!978 thiss!1379)) (_4!6 lt!33325))) (ite c!1647 (select (arr!1113 (buf!978 (_2!1386 lt!32403))) (_3!85 lt!33325)) (select (arr!1113 (buf!978 (_2!1386 lt!32403))) (_4!6 lt!33325))) (ite c!1647 lt!33323 #b00000000000000000000000000000000) lt!33324))))

(declare-fun b!22722 () Bool)

(assert (=> b!22722 (= e!15321 e!15317)))

(assert (=> b!22722 (= c!1647 (= (_3!85 lt!33325) (_4!6 lt!33325)))))

(declare-fun b!22723 () Bool)

(assert (=> b!22723 (= e!15318 (arrayRangesEq!7 (buf!978 thiss!1379) (buf!978 (_2!1386 lt!32403)) (_1!1400 lt!33325) (_2!1400 lt!33325)))))

(declare-fun b!22724 () Bool)

(assert (=> b!22724 (= e!15317 call!333)))

(declare-fun d!7276 () Bool)

(declare-fun res!19530 () Bool)

(assert (=> d!7276 (=> res!19530 e!15319)))

(assert (=> d!7276 (= res!19530 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!660 (buf!978 thiss!1379)) (currentByte!2285 thiss!1379) (currentBit!2280 thiss!1379))))))

(assert (=> d!7276 (= (arrayBitRangesEq!0 (buf!978 thiss!1379) (buf!978 (_2!1386 lt!32403)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!660 (buf!978 thiss!1379)) (currentByte!2285 thiss!1379) (currentBit!2280 thiss!1379))) e!15319)))

(assert (= (and d!7276 (not res!19530)) b!22719))

(assert (= (and b!22719 (not res!19528)) b!22723))

(assert (= (and b!22719 res!19527) b!22722))

(assert (= (and b!22722 c!1647) b!22724))

(assert (= (and b!22722 (not c!1647)) b!22720))

(assert (= (and b!22720 res!19529) b!22718))

(assert (= (and b!22718 (not res!19531)) b!22721))

(assert (= (or b!22724 b!22721) bm!330))

(assert (=> b!22719 m!31079))

(assert (=> b!22719 m!31707))

(declare-fun m!31743 () Bool)

(assert (=> b!22720 m!31743))

(declare-fun m!31745 () Bool)

(assert (=> b!22720 m!31745))

(assert (=> b!22720 m!31743))

(assert (=> b!22720 m!31745))

(declare-fun m!31747 () Bool)

(assert (=> b!22720 m!31747))

(assert (=> bm!330 m!31743))

(assert (=> bm!330 m!31745))

(declare-fun m!31749 () Bool)

(assert (=> bm!330 m!31749))

(declare-fun m!31751 () Bool)

(assert (=> bm!330 m!31751))

(declare-fun m!31753 () Bool)

(assert (=> bm!330 m!31753))

(declare-fun m!31755 () Bool)

(assert (=> b!22723 m!31755))

(assert (=> b!22372 d!7276))

(assert (=> b!22372 d!7132))

(assert (=> d!7144 d!7128))

(declare-fun d!7278 () Bool)

(declare-fun res!19534 () Bool)

(declare-fun e!15323 () Bool)

(assert (=> d!7278 (=> (not res!19534) (not e!15323))))

(assert (=> d!7278 (= res!19534 (= (size!660 (buf!978 (_1!1387 lt!32613))) (size!660 (buf!978 (_2!1387 lt!32613)))))))

(assert (=> d!7278 (= (isPrefixOf!0 (_1!1387 lt!32613) (_2!1387 lt!32613)) e!15323)))

(declare-fun b!22725 () Bool)

(declare-fun res!19532 () Bool)

(assert (=> b!22725 (=> (not res!19532) (not e!15323))))

(assert (=> b!22725 (= res!19532 (bvsle (bitIndex!0 (size!660 (buf!978 (_1!1387 lt!32613))) (currentByte!2285 (_1!1387 lt!32613)) (currentBit!2280 (_1!1387 lt!32613))) (bitIndex!0 (size!660 (buf!978 (_2!1387 lt!32613))) (currentByte!2285 (_2!1387 lt!32613)) (currentBit!2280 (_2!1387 lt!32613)))))))

(declare-fun b!22726 () Bool)

(declare-fun e!15322 () Bool)

(assert (=> b!22726 (= e!15323 e!15322)))

(declare-fun res!19533 () Bool)

(assert (=> b!22726 (=> res!19533 e!15322)))

(assert (=> b!22726 (= res!19533 (= (size!660 (buf!978 (_1!1387 lt!32613))) #b00000000000000000000000000000000))))

(declare-fun b!22727 () Bool)

(assert (=> b!22727 (= e!15322 (arrayBitRangesEq!0 (buf!978 (_1!1387 lt!32613)) (buf!978 (_2!1387 lt!32613)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!660 (buf!978 (_1!1387 lt!32613))) (currentByte!2285 (_1!1387 lt!32613)) (currentBit!2280 (_1!1387 lt!32613)))))))

(assert (= (and d!7278 res!19534) b!22725))

(assert (= (and b!22725 res!19532) b!22726))

(assert (= (and b!22726 (not res!19533)) b!22727))

(declare-fun m!31757 () Bool)

(assert (=> b!22725 m!31757))

(declare-fun m!31759 () Bool)

(assert (=> b!22725 m!31759))

(assert (=> b!22727 m!31757))

(assert (=> b!22727 m!31757))

(declare-fun m!31761 () Bool)

(assert (=> b!22727 m!31761))

(assert (=> d!7144 d!7278))

(declare-fun d!7280 () Bool)

(assert (=> d!7280 (isPrefixOf!0 lt!32610 (_2!1386 lt!32403))))

(declare-fun lt!33326 () Unit!1930)

(assert (=> d!7280 (= lt!33326 (choose!30 lt!32610 thiss!1379 (_2!1386 lt!32403)))))

(assert (=> d!7280 (isPrefixOf!0 lt!32610 thiss!1379)))

(assert (=> d!7280 (= (lemmaIsPrefixTransitive!0 lt!32610 thiss!1379 (_2!1386 lt!32403)) lt!33326)))

(declare-fun bs!2090 () Bool)

(assert (= bs!2090 d!7280))

(assert (=> bs!2090 m!31221))

(declare-fun m!31763 () Bool)

(assert (=> bs!2090 m!31763))

(declare-fun m!31765 () Bool)

(assert (=> bs!2090 m!31765))

(assert (=> d!7144 d!7280))

(assert (=> d!7144 d!7118))

(declare-fun d!7282 () Bool)

(assert (=> d!7282 (isPrefixOf!0 lt!32610 (_2!1386 lt!32403))))

(declare-fun lt!33327 () Unit!1930)

(assert (=> d!7282 (= lt!33327 (choose!30 lt!32610 (_2!1386 lt!32403) (_2!1386 lt!32403)))))

(assert (=> d!7282 (isPrefixOf!0 lt!32610 (_2!1386 lt!32403))))

(assert (=> d!7282 (= (lemmaIsPrefixTransitive!0 lt!32610 (_2!1386 lt!32403) (_2!1386 lt!32403)) lt!33327)))

(declare-fun bs!2091 () Bool)

(assert (= bs!2091 d!7282))

(assert (=> bs!2091 m!31221))

(declare-fun m!31767 () Bool)

(assert (=> bs!2091 m!31767))

(assert (=> bs!2091 m!31221))

(assert (=> d!7144 d!7282))

(declare-fun d!7284 () Bool)

(declare-fun res!19537 () Bool)

(declare-fun e!15325 () Bool)

(assert (=> d!7284 (=> (not res!19537) (not e!15325))))

(assert (=> d!7284 (= res!19537 (= (size!660 (buf!978 lt!32610)) (size!660 (buf!978 lt!32610))))))

(assert (=> d!7284 (= (isPrefixOf!0 lt!32610 lt!32610) e!15325)))

(declare-fun b!22728 () Bool)

(declare-fun res!19535 () Bool)

(assert (=> b!22728 (=> (not res!19535) (not e!15325))))

(assert (=> b!22728 (= res!19535 (bvsle (bitIndex!0 (size!660 (buf!978 lt!32610)) (currentByte!2285 lt!32610) (currentBit!2280 lt!32610)) (bitIndex!0 (size!660 (buf!978 lt!32610)) (currentByte!2285 lt!32610) (currentBit!2280 lt!32610))))))

(declare-fun b!22729 () Bool)

(declare-fun e!15324 () Bool)

(assert (=> b!22729 (= e!15325 e!15324)))

(declare-fun res!19536 () Bool)

(assert (=> b!22729 (=> res!19536 e!15324)))

(assert (=> b!22729 (= res!19536 (= (size!660 (buf!978 lt!32610)) #b00000000000000000000000000000000))))

(declare-fun b!22730 () Bool)

(assert (=> b!22730 (= e!15324 (arrayBitRangesEq!0 (buf!978 lt!32610) (buf!978 lt!32610) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!660 (buf!978 lt!32610)) (currentByte!2285 lt!32610) (currentBit!2280 lt!32610))))))

(assert (= (and d!7284 res!19537) b!22728))

(assert (= (and b!22728 res!19535) b!22729))

(assert (= (and b!22729 (not res!19536)) b!22730))

(declare-fun m!31769 () Bool)

(assert (=> b!22728 m!31769))

(assert (=> b!22728 m!31769))

(assert (=> b!22730 m!31769))

(assert (=> b!22730 m!31769))

(declare-fun m!31771 () Bool)

(assert (=> b!22730 m!31771))

(assert (=> d!7144 d!7284))

(assert (=> d!7144 d!7248))

(assert (=> d!7144 d!7130))

(declare-fun d!7286 () Bool)

(declare-fun res!19540 () Bool)

(declare-fun e!15327 () Bool)

(assert (=> d!7286 (=> (not res!19540) (not e!15327))))

(assert (=> d!7286 (= res!19540 (= (size!660 (buf!978 lt!32610)) (size!660 (buf!978 (_2!1386 lt!32403)))))))

(assert (=> d!7286 (= (isPrefixOf!0 lt!32610 (_2!1386 lt!32403)) e!15327)))

(declare-fun b!22731 () Bool)

(declare-fun res!19538 () Bool)

(assert (=> b!22731 (=> (not res!19538) (not e!15327))))

(assert (=> b!22731 (= res!19538 (bvsle (bitIndex!0 (size!660 (buf!978 lt!32610)) (currentByte!2285 lt!32610) (currentBit!2280 lt!32610)) (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!32403))) (currentByte!2285 (_2!1386 lt!32403)) (currentBit!2280 (_2!1386 lt!32403)))))))

(declare-fun b!22732 () Bool)

(declare-fun e!15326 () Bool)

(assert (=> b!22732 (= e!15327 e!15326)))

(declare-fun res!19539 () Bool)

(assert (=> b!22732 (=> res!19539 e!15326)))

(assert (=> b!22732 (= res!19539 (= (size!660 (buf!978 lt!32610)) #b00000000000000000000000000000000))))

(declare-fun b!22733 () Bool)

(assert (=> b!22733 (= e!15326 (arrayBitRangesEq!0 (buf!978 lt!32610) (buf!978 (_2!1386 lt!32403)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!660 (buf!978 lt!32610)) (currentByte!2285 lt!32610) (currentBit!2280 lt!32610))))))

(assert (= (and d!7286 res!19540) b!22731))

(assert (= (and b!22731 res!19538) b!22732))

(assert (= (and b!22732 (not res!19539)) b!22733))

(assert (=> b!22731 m!31769))

(assert (=> b!22731 m!31133))

(assert (=> b!22733 m!31769))

(assert (=> b!22733 m!31769))

(declare-fun m!31773 () Bool)

(assert (=> b!22733 m!31773))

(assert (=> d!7144 d!7286))

(assert (=> d!7144 d!7250))

(declare-fun d!7288 () Bool)

(assert (=> d!7288 (isPrefixOf!0 lt!32610 lt!32610)))

(declare-fun lt!33328 () Unit!1930)

(assert (=> d!7288 (= lt!33328 (choose!11 lt!32610))))

(assert (=> d!7288 (= (lemmaIsPrefixRefl!0 lt!32610) lt!33328)))

(declare-fun bs!2092 () Bool)

(assert (= bs!2092 d!7288))

(assert (=> bs!2092 m!31225))

(declare-fun m!31775 () Bool)

(assert (=> bs!2092 m!31775))

(assert (=> d!7144 d!7288))

(declare-fun d!7290 () Bool)

(assert (=> d!7290 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!33190)))) ((_ sign_extend 32) (currentByte!2285 (_2!1386 lt!32403))) ((_ sign_extend 32) (currentBit!2280 (_2!1386 lt!32403))) lt!33168) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!33190)))) ((_ sign_extend 32) (currentByte!2285 (_2!1386 lt!32403))) ((_ sign_extend 32) (currentBit!2280 (_2!1386 lt!32403)))) lt!33168))))

(declare-fun bs!2093 () Bool)

(assert (= bs!2093 d!7290))

(declare-fun m!31777 () Bool)

(assert (=> bs!2093 m!31777))

(assert (=> b!22620 d!7290))

(declare-fun d!7292 () Bool)

(declare-fun res!19543 () Bool)

(declare-fun e!15329 () Bool)

(assert (=> d!7292 (=> (not res!19543) (not e!15329))))

(assert (=> d!7292 (= res!19543 (= (size!660 (buf!978 (_2!1386 lt!32403))) (size!660 (buf!978 (_2!1386 lt!33171)))))))

(assert (=> d!7292 (= (isPrefixOf!0 (_2!1386 lt!32403) (_2!1386 lt!33171)) e!15329)))

(declare-fun b!22734 () Bool)

(declare-fun res!19541 () Bool)

(assert (=> b!22734 (=> (not res!19541) (not e!15329))))

(assert (=> b!22734 (= res!19541 (bvsle (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!32403))) (currentByte!2285 (_2!1386 lt!32403)) (currentBit!2280 (_2!1386 lt!32403))) (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!33171))) (currentByte!2285 (_2!1386 lt!33171)) (currentBit!2280 (_2!1386 lt!33171)))))))

(declare-fun b!22735 () Bool)

(declare-fun e!15328 () Bool)

(assert (=> b!22735 (= e!15329 e!15328)))

(declare-fun res!19542 () Bool)

(assert (=> b!22735 (=> res!19542 e!15328)))

(assert (=> b!22735 (= res!19542 (= (size!660 (buf!978 (_2!1386 lt!32403))) #b00000000000000000000000000000000))))

(declare-fun b!22736 () Bool)

(assert (=> b!22736 (= e!15328 (arrayBitRangesEq!0 (buf!978 (_2!1386 lt!32403)) (buf!978 (_2!1386 lt!33171)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!32403))) (currentByte!2285 (_2!1386 lt!32403)) (currentBit!2280 (_2!1386 lt!32403)))))))

(assert (= (and d!7292 res!19543) b!22734))

(assert (= (and b!22734 res!19541) b!22735))

(assert (= (and b!22735 (not res!19542)) b!22736))

(assert (=> b!22734 m!31133))

(assert (=> b!22734 m!31597))

(assert (=> b!22736 m!31133))

(assert (=> b!22736 m!31133))

(declare-fun m!31779 () Bool)

(assert (=> b!22736 m!31779))

(assert (=> b!22620 d!7292))

(declare-fun b!22739 () Bool)

(declare-fun e!15331 () Bool)

(declare-fun lt!33329 () List!278)

(assert (=> b!22739 (= e!15331 (isEmpty!63 lt!33329))))

(declare-fun b!22737 () Bool)

(declare-fun e!15330 () tuple2!2626)

(assert (=> b!22737 (= e!15330 (tuple2!2627 Nil!275 (_1!1387 lt!33174)))))

(declare-fun lt!33330 () (_ BitVec 64))

(declare-fun b!22738 () Bool)

(declare-fun lt!33331 () tuple2!2628)

(assert (=> b!22738 (= e!15330 (tuple2!2627 (Cons!274 (_1!1399 lt!33331) (bitStreamReadBitsIntoList!0 (_2!1386 lt!33171) (_2!1399 lt!33331) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) lt!33330))) (_2!1399 lt!33331)))))

(assert (=> b!22738 (= lt!33331 (readBit!0 (_1!1387 lt!33174)))))

(assert (=> b!22738 (= lt!33330 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!7294 () Bool)

(assert (=> d!7294 e!15331))

(declare-fun c!1649 () Bool)

(assert (=> d!7294 (= c!1649 (= (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!7294 (= lt!33329 (_1!1398 e!15330))))

(declare-fun c!1648 () Bool)

(assert (=> d!7294 (= c!1648 (= (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!7294 (bvsge (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!7294 (= (bitStreamReadBitsIntoList!0 (_2!1386 lt!33171) (_1!1387 lt!33174) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) lt!33329)))

(declare-fun b!22740 () Bool)

(assert (=> b!22740 (= e!15331 (> (length!58 lt!33329) 0))))

(assert (= (and d!7294 c!1648) b!22737))

(assert (= (and d!7294 (not c!1648)) b!22738))

(assert (= (and d!7294 c!1649) b!22739))

(assert (= (and d!7294 (not c!1649)) b!22740))

(declare-fun m!31781 () Bool)

(assert (=> b!22739 m!31781))

(declare-fun m!31783 () Bool)

(assert (=> b!22738 m!31783))

(declare-fun m!31785 () Bool)

(assert (=> b!22738 m!31785))

(declare-fun m!31787 () Bool)

(assert (=> b!22740 m!31787))

(assert (=> b!22620 d!7294))

(declare-fun d!7296 () Bool)

(assert (=> d!7296 (= (bitAt!0 (buf!978 (_2!1386 lt!33171)) lt!33186) (not (= (bvand ((_ sign_extend 24) (select (arr!1113 (buf!978 (_2!1386 lt!33171))) ((_ extract 31 0) (bvsdiv lt!33186 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!33186 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2094 () Bool)

(assert (= bs!2094 d!7296))

(declare-fun m!31789 () Bool)

(assert (=> bs!2094 m!31789))

(declare-fun m!31791 () Bool)

(assert (=> bs!2094 m!31791))

(assert (=> b!22620 d!7296))

(declare-fun d!7298 () Bool)

(assert (=> d!7298 (= (bitAt!0 (buf!978 (_2!1386 lt!33190)) lt!33186) (not (= (bvand ((_ sign_extend 24) (select (arr!1113 (buf!978 (_2!1386 lt!33190))) ((_ extract 31 0) (bvsdiv lt!33186 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!33186 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2095 () Bool)

(assert (= bs!2095 d!7298))

(declare-fun m!31793 () Bool)

(assert (=> bs!2095 m!31793))

(assert (=> bs!2095 m!31791))

(assert (=> b!22620 d!7298))

(declare-fun d!7300 () Bool)

(assert (=> d!7300 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!33190)))) ((_ sign_extend 32) (currentByte!2285 (_2!1386 lt!33190))) ((_ sign_extend 32) (currentBit!2280 (_2!1386 lt!33190))) (bvsub lt!33165 lt!33160)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!33190)))) ((_ sign_extend 32) (currentByte!2285 (_2!1386 lt!33190))) ((_ sign_extend 32) (currentBit!2280 (_2!1386 lt!33190)))) (bvsub lt!33165 lt!33160)))))

(declare-fun bs!2096 () Bool)

(assert (= bs!2096 d!7300))

(declare-fun m!31795 () Bool)

(assert (=> bs!2096 m!31795))

(assert (=> b!22620 d!7300))

(declare-fun b!22743 () Bool)

(declare-fun e!15333 () Bool)

(declare-fun lt!33332 () List!278)

(assert (=> b!22743 (= e!15333 (isEmpty!63 lt!33332))))

(declare-fun b!22741 () Bool)

(declare-fun e!15332 () tuple2!2626)

(assert (=> b!22741 (= e!15332 (tuple2!2627 Nil!275 (_1!1387 lt!33170)))))

(declare-fun lt!33333 () (_ BitVec 64))

(declare-fun lt!33334 () tuple2!2628)

(declare-fun b!22742 () Bool)

(assert (=> b!22742 (= e!15332 (tuple2!2627 (Cons!274 (_1!1399 lt!33334) (bitStreamReadBitsIntoList!0 (_2!1386 lt!33171) (_2!1399 lt!33334) (bvsub (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!33333))) (_2!1399 lt!33334)))))

(assert (=> b!22742 (= lt!33334 (readBit!0 (_1!1387 lt!33170)))))

(assert (=> b!22742 (= lt!33333 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!7302 () Bool)

(assert (=> d!7302 e!15333))

(declare-fun c!1651 () Bool)

(assert (=> d!7302 (= c!1651 (= (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!7302 (= lt!33332 (_1!1398 e!15332))))

(declare-fun c!1650 () Bool)

(assert (=> d!7302 (= c!1650 (= (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!7302 (bvsge (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!7302 (= (bitStreamReadBitsIntoList!0 (_2!1386 lt!33171) (_1!1387 lt!33170) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)) lt!33332)))

(declare-fun b!22744 () Bool)

(assert (=> b!22744 (= e!15333 (> (length!58 lt!33332) 0))))

(assert (= (and d!7302 c!1650) b!22741))

(assert (= (and d!7302 (not c!1650)) b!22742))

(assert (= (and d!7302 c!1651) b!22743))

(assert (= (and d!7302 (not c!1651)) b!22744))

(declare-fun m!31797 () Bool)

(assert (=> b!22743 m!31797))

(declare-fun m!31799 () Bool)

(assert (=> b!22742 m!31799))

(declare-fun m!31801 () Bool)

(assert (=> b!22742 m!31801))

(declare-fun m!31803 () Bool)

(assert (=> b!22744 m!31803))

(assert (=> b!22620 d!7302))

(declare-fun d!7304 () Bool)

(declare-fun e!15334 () Bool)

(assert (=> d!7304 e!15334))

(declare-fun res!19544 () Bool)

(assert (=> d!7304 (=> (not res!19544) (not e!15334))))

(assert (=> d!7304 (= res!19544 (or (= (bvand lt!33165 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!33160 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!33165 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!33165 lt!33160) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!33335 () Unit!1930)

(assert (=> d!7304 (= lt!33335 (choose!27 (_2!1386 lt!32403) (_2!1386 lt!33190) lt!33165 lt!33160))))

(assert (=> d!7304 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!33160) (bvsle lt!33160 lt!33165))))

(assert (=> d!7304 (= (validateOffsetBitsIneqLemma!0 (_2!1386 lt!32403) (_2!1386 lt!33190) lt!33165 lt!33160) lt!33335)))

(declare-fun b!22745 () Bool)

(assert (=> b!22745 (= e!15334 (validate_offset_bits!1 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!33190)))) ((_ sign_extend 32) (currentByte!2285 (_2!1386 lt!33190))) ((_ sign_extend 32) (currentBit!2280 (_2!1386 lt!33190))) (bvsub lt!33165 lt!33160)))))

(assert (= (and d!7304 res!19544) b!22745))

(declare-fun m!31805 () Bool)

(assert (=> d!7304 m!31805))

(assert (=> b!22745 m!31567))

(assert (=> b!22620 d!7304))

(declare-fun d!7306 () Bool)

(assert (=> d!7306 (validate_offset_bits!1 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!33171)))) ((_ sign_extend 32) (currentByte!2285 (_2!1386 lt!33190))) ((_ sign_extend 32) (currentBit!2280 (_2!1386 lt!33190))) lt!33197)))

(declare-fun lt!33336 () Unit!1930)

(assert (=> d!7306 (= lt!33336 (choose!9 (_2!1386 lt!33190) (buf!978 (_2!1386 lt!33171)) lt!33197 (BitStream!1155 (buf!978 (_2!1386 lt!33171)) (currentByte!2285 (_2!1386 lt!33190)) (currentBit!2280 (_2!1386 lt!33190)))))))

(assert (=> d!7306 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1386 lt!33190) (buf!978 (_2!1386 lt!33171)) lt!33197) lt!33336)))

(declare-fun bs!2097 () Bool)

(assert (= bs!2097 d!7306))

(assert (=> bs!2097 m!31569))

(declare-fun m!31807 () Bool)

(assert (=> bs!2097 m!31807))

(assert (=> b!22620 d!7306))

(declare-fun d!7308 () Bool)

(assert (=> d!7308 (validate_offset_bits!1 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!33171)))) ((_ sign_extend 32) (currentByte!2285 (_2!1386 lt!32403))) ((_ sign_extend 32) (currentBit!2280 (_2!1386 lt!32403))) lt!33192)))

(declare-fun lt!33337 () Unit!1930)

(assert (=> d!7308 (= lt!33337 (choose!9 (_2!1386 lt!32403) (buf!978 (_2!1386 lt!33171)) lt!33192 (BitStream!1155 (buf!978 (_2!1386 lt!33171)) (currentByte!2285 (_2!1386 lt!32403)) (currentBit!2280 (_2!1386 lt!32403)))))))

(assert (=> d!7308 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1386 lt!32403) (buf!978 (_2!1386 lt!33171)) lt!33192) lt!33337)))

(declare-fun bs!2098 () Bool)

(assert (= bs!2098 d!7308))

(assert (=> bs!2098 m!31557))

(declare-fun m!31809 () Bool)

(assert (=> bs!2098 m!31809))

(assert (=> b!22620 d!7308))

(declare-fun d!7310 () Bool)

(assert (=> d!7310 (isPrefixOf!0 (_2!1386 lt!32403) (_2!1386 lt!33171))))

(declare-fun lt!33338 () Unit!1930)

(assert (=> d!7310 (= lt!33338 (choose!30 (_2!1386 lt!32403) (_2!1386 lt!33190) (_2!1386 lt!33171)))))

(assert (=> d!7310 (isPrefixOf!0 (_2!1386 lt!32403) (_2!1386 lt!33190))))

(assert (=> d!7310 (= (lemmaIsPrefixTransitive!0 (_2!1386 lt!32403) (_2!1386 lt!33190) (_2!1386 lt!33171)) lt!33338)))

(declare-fun bs!2099 () Bool)

(assert (= bs!2099 d!7310))

(assert (=> bs!2099 m!31551))

(declare-fun m!31811 () Bool)

(assert (=> bs!2099 m!31811))

(declare-fun m!31813 () Bool)

(assert (=> bs!2099 m!31813))

(assert (=> b!22620 d!7310))

(declare-fun d!7312 () Bool)

(assert (=> d!7312 (= (tail!85 lt!33183) (t!1028 lt!33183))))

(assert (=> b!22620 d!7312))

(declare-fun d!7314 () Bool)

(declare-fun c!1652 () Bool)

(assert (=> d!7314 (= c!1652 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!15335 () List!278)

(assert (=> d!7314 (= (byteArrayBitContentToList!0 (_2!1386 lt!33190) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) e!15335)))

(declare-fun b!22746 () Bool)

(assert (=> b!22746 (= e!15335 Nil!275)))

(declare-fun b!22747 () Bool)

(assert (=> b!22747 (= e!15335 (Cons!274 (not (= (bvand ((_ sign_extend 24) (select (arr!1113 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1386 lt!33190) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!7314 c!1652) b!22746))

(assert (= (and d!7314 (not c!1652)) b!22747))

(assert (=> b!22747 m!31541))

(assert (=> b!22747 m!31723))

(declare-fun m!31815 () Bool)

(assert (=> b!22747 m!31815))

(assert (=> b!22620 d!7314))

(declare-fun b!22750 () Bool)

(declare-fun e!15337 () Bool)

(declare-fun lt!33339 () List!278)

(assert (=> b!22750 (= e!15337 (isEmpty!63 lt!33339))))

(declare-fun b!22748 () Bool)

(declare-fun e!15336 () tuple2!2626)

(assert (=> b!22748 (= e!15336 (tuple2!2627 Nil!275 (_1!1387 lt!33187)))))

(declare-fun lt!33340 () (_ BitVec 64))

(declare-fun lt!33341 () tuple2!2628)

(declare-fun b!22749 () Bool)

(assert (=> b!22749 (= e!15336 (tuple2!2627 (Cons!274 (_1!1399 lt!33341) (bitStreamReadBitsIntoList!0 (_2!1386 lt!33190) (_2!1399 lt!33341) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!33340))) (_2!1399 lt!33341)))))

(assert (=> b!22749 (= lt!33341 (readBit!0 (_1!1387 lt!33187)))))

(assert (=> b!22749 (= lt!33340 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!7316 () Bool)

(assert (=> d!7316 e!15337))

(declare-fun c!1654 () Bool)

(assert (=> d!7316 (= c!1654 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!7316 (= lt!33339 (_1!1398 e!15336))))

(declare-fun c!1653 () Bool)

(assert (=> d!7316 (= c!1653 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!7316 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!7316 (= (bitStreamReadBitsIntoList!0 (_2!1386 lt!33190) (_1!1387 lt!33187) #b0000000000000000000000000000000000000000000000000000000000000001) lt!33339)))

(declare-fun b!22751 () Bool)

(assert (=> b!22751 (= e!15337 (> (length!58 lt!33339) 0))))

(assert (= (and d!7316 c!1653) b!22748))

(assert (= (and d!7316 (not c!1653)) b!22749))

(assert (= (and d!7316 c!1654) b!22750))

(assert (= (and d!7316 (not c!1654)) b!22751))

(declare-fun m!31817 () Bool)

(assert (=> b!22750 m!31817))

(declare-fun m!31819 () Bool)

(assert (=> b!22749 m!31819))

(declare-fun m!31821 () Bool)

(assert (=> b!22749 m!31821))

(declare-fun m!31823 () Bool)

(assert (=> b!22751 m!31823))

(assert (=> b!22620 d!7316))

(assert (=> b!22620 d!7228))

(declare-fun b!22752 () Bool)

(declare-fun res!19545 () Bool)

(declare-fun e!15339 () Bool)

(assert (=> b!22752 (=> (not res!19545) (not e!15339))))

(declare-fun lt!33348 () tuple2!2604)

(assert (=> b!22752 (= res!19545 (isPrefixOf!0 (_1!1387 lt!33348) (_2!1386 lt!32403)))))

(declare-fun d!7318 () Bool)

(assert (=> d!7318 e!15339))

(declare-fun res!19547 () Bool)

(assert (=> d!7318 (=> (not res!19547) (not e!15339))))

(assert (=> d!7318 (= res!19547 (isPrefixOf!0 (_1!1387 lt!33348) (_2!1387 lt!33348)))))

(declare-fun lt!33345 () BitStream!1154)

(assert (=> d!7318 (= lt!33348 (tuple2!2605 lt!33345 (_2!1386 lt!33190)))))

(declare-fun lt!33350 () Unit!1930)

(declare-fun lt!33349 () Unit!1930)

(assert (=> d!7318 (= lt!33350 lt!33349)))

(assert (=> d!7318 (isPrefixOf!0 lt!33345 (_2!1386 lt!33190))))

(assert (=> d!7318 (= lt!33349 (lemmaIsPrefixTransitive!0 lt!33345 (_2!1386 lt!33190) (_2!1386 lt!33190)))))

(declare-fun lt!33355 () Unit!1930)

(declare-fun lt!33346 () Unit!1930)

(assert (=> d!7318 (= lt!33355 lt!33346)))

(assert (=> d!7318 (isPrefixOf!0 lt!33345 (_2!1386 lt!33190))))

(assert (=> d!7318 (= lt!33346 (lemmaIsPrefixTransitive!0 lt!33345 (_2!1386 lt!32403) (_2!1386 lt!33190)))))

(declare-fun lt!33343 () Unit!1930)

(declare-fun e!15338 () Unit!1930)

(assert (=> d!7318 (= lt!33343 e!15338)))

(declare-fun c!1655 () Bool)

(assert (=> d!7318 (= c!1655 (not (= (size!660 (buf!978 (_2!1386 lt!32403))) #b00000000000000000000000000000000)))))

(declare-fun lt!33352 () Unit!1930)

(declare-fun lt!33361 () Unit!1930)

(assert (=> d!7318 (= lt!33352 lt!33361)))

(assert (=> d!7318 (isPrefixOf!0 (_2!1386 lt!33190) (_2!1386 lt!33190))))

(assert (=> d!7318 (= lt!33361 (lemmaIsPrefixRefl!0 (_2!1386 lt!33190)))))

(declare-fun lt!33356 () Unit!1930)

(declare-fun lt!33347 () Unit!1930)

(assert (=> d!7318 (= lt!33356 lt!33347)))

(assert (=> d!7318 (= lt!33347 (lemmaIsPrefixRefl!0 (_2!1386 lt!33190)))))

(declare-fun lt!33351 () Unit!1930)

(declare-fun lt!33360 () Unit!1930)

(assert (=> d!7318 (= lt!33351 lt!33360)))

(assert (=> d!7318 (isPrefixOf!0 lt!33345 lt!33345)))

(assert (=> d!7318 (= lt!33360 (lemmaIsPrefixRefl!0 lt!33345))))

(declare-fun lt!33342 () Unit!1930)

(declare-fun lt!33358 () Unit!1930)

(assert (=> d!7318 (= lt!33342 lt!33358)))

(assert (=> d!7318 (isPrefixOf!0 (_2!1386 lt!32403) (_2!1386 lt!32403))))

(assert (=> d!7318 (= lt!33358 (lemmaIsPrefixRefl!0 (_2!1386 lt!32403)))))

(assert (=> d!7318 (= lt!33345 (BitStream!1155 (buf!978 (_2!1386 lt!33190)) (currentByte!2285 (_2!1386 lt!32403)) (currentBit!2280 (_2!1386 lt!32403))))))

(assert (=> d!7318 (isPrefixOf!0 (_2!1386 lt!32403) (_2!1386 lt!33190))))

(assert (=> d!7318 (= (reader!0 (_2!1386 lt!32403) (_2!1386 lt!33190)) lt!33348)))

(declare-fun b!22753 () Bool)

(declare-fun Unit!1957 () Unit!1930)

(assert (=> b!22753 (= e!15338 Unit!1957)))

(declare-fun b!22754 () Bool)

(declare-fun lt!33359 () (_ BitVec 64))

(declare-fun lt!33344 () (_ BitVec 64))

(assert (=> b!22754 (= e!15339 (= (_1!1387 lt!33348) (withMovedBitIndex!0 (_2!1387 lt!33348) (bvsub lt!33359 lt!33344))))))

(assert (=> b!22754 (or (= (bvand lt!33359 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!33344 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!33359 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!33359 lt!33344) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!22754 (= lt!33344 (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!33190))) (currentByte!2285 (_2!1386 lt!33190)) (currentBit!2280 (_2!1386 lt!33190))))))

(assert (=> b!22754 (= lt!33359 (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!32403))) (currentByte!2285 (_2!1386 lt!32403)) (currentBit!2280 (_2!1386 lt!32403))))))

(declare-fun b!22755 () Bool)

(declare-fun res!19546 () Bool)

(assert (=> b!22755 (=> (not res!19546) (not e!15339))))

(assert (=> b!22755 (= res!19546 (isPrefixOf!0 (_2!1387 lt!33348) (_2!1386 lt!33190)))))

(declare-fun b!22756 () Bool)

(declare-fun lt!33357 () Unit!1930)

(assert (=> b!22756 (= e!15338 lt!33357)))

(declare-fun lt!33353 () (_ BitVec 64))

(assert (=> b!22756 (= lt!33353 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!33354 () (_ BitVec 64))

(assert (=> b!22756 (= lt!33354 (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!32403))) (currentByte!2285 (_2!1386 lt!32403)) (currentBit!2280 (_2!1386 lt!32403))))))

(assert (=> b!22756 (= lt!33357 (arrayBitRangesEqSymmetric!0 (buf!978 (_2!1386 lt!32403)) (buf!978 (_2!1386 lt!33190)) lt!33353 lt!33354))))

(assert (=> b!22756 (arrayBitRangesEq!0 (buf!978 (_2!1386 lt!33190)) (buf!978 (_2!1386 lt!32403)) lt!33353 lt!33354)))

(assert (= (and d!7318 c!1655) b!22756))

(assert (= (and d!7318 (not c!1655)) b!22753))

(assert (= (and d!7318 res!19547) b!22752))

(assert (= (and b!22752 res!19545) b!22755))

(assert (= (and b!22755 res!19546) b!22754))

(assert (=> b!22756 m!31133))

(declare-fun m!31825 () Bool)

(assert (=> b!22756 m!31825))

(declare-fun m!31827 () Bool)

(assert (=> b!22756 m!31827))

(declare-fun m!31829 () Bool)

(assert (=> b!22755 m!31829))

(declare-fun m!31831 () Bool)

(assert (=> b!22754 m!31831))

(assert (=> b!22754 m!31555))

(assert (=> b!22754 m!31133))

(declare-fun m!31833 () Bool)

(assert (=> b!22752 m!31833))

(declare-fun m!31835 () Bool)

(assert (=> d!7318 m!31835))

(declare-fun m!31837 () Bool)

(assert (=> d!7318 m!31837))

(assert (=> d!7318 m!31813))

(declare-fun m!31839 () Bool)

(assert (=> d!7318 m!31839))

(declare-fun m!31841 () Bool)

(assert (=> d!7318 m!31841))

(declare-fun m!31843 () Bool)

(assert (=> d!7318 m!31843))

(assert (=> d!7318 m!31217))

(assert (=> d!7318 m!31219))

(declare-fun m!31845 () Bool)

(assert (=> d!7318 m!31845))

(declare-fun m!31847 () Bool)

(assert (=> d!7318 m!31847))

(declare-fun m!31849 () Bool)

(assert (=> d!7318 m!31849))

(assert (=> b!22620 d!7318))

(declare-fun d!7320 () Bool)

(assert (=> d!7320 (= (head!115 (byteArrayBitContentToList!0 (_2!1386 lt!33190) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!393 (byteArrayBitContentToList!0 (_2!1386 lt!33190) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!22620 d!7320))

(declare-fun d!7322 () Bool)

(assert (=> d!7322 (= (head!115 (bitStreamReadBitsIntoList!0 (_2!1386 lt!33190) (_1!1387 lt!33187) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!393 (bitStreamReadBitsIntoList!0 (_2!1386 lt!33190) (_1!1387 lt!33187) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!22620 d!7322))

(declare-fun d!7324 () Bool)

(assert (=> d!7324 (validate_offset_bits!1 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!33190)))) ((_ sign_extend 32) (currentByte!2285 (_2!1386 lt!32403))) ((_ sign_extend 32) (currentBit!2280 (_2!1386 lt!32403))) lt!33168)))

(declare-fun lt!33362 () Unit!1930)

(assert (=> d!7324 (= lt!33362 (choose!9 (_2!1386 lt!32403) (buf!978 (_2!1386 lt!33190)) lt!33168 (BitStream!1155 (buf!978 (_2!1386 lt!33190)) (currentByte!2285 (_2!1386 lt!32403)) (currentBit!2280 (_2!1386 lt!32403)))))))

(assert (=> d!7324 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1386 lt!32403) (buf!978 (_2!1386 lt!33190)) lt!33168) lt!33362)))

(declare-fun bs!2100 () Bool)

(assert (= bs!2100 d!7324))

(assert (=> bs!2100 m!31577))

(declare-fun m!31851 () Bool)

(assert (=> bs!2100 m!31851))

(assert (=> b!22620 d!7324))

(declare-fun d!7326 () Bool)

(assert (=> d!7326 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!33171)))) ((_ sign_extend 32) (currentByte!2285 (_2!1386 lt!33190))) ((_ sign_extend 32) (currentBit!2280 (_2!1386 lt!33190))) lt!33197) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!33171)))) ((_ sign_extend 32) (currentByte!2285 (_2!1386 lt!33190))) ((_ sign_extend 32) (currentBit!2280 (_2!1386 lt!33190)))) lt!33197))))

(declare-fun bs!2101 () Bool)

(assert (= bs!2101 d!7326))

(declare-fun m!31853 () Bool)

(assert (=> bs!2101 m!31853))

(assert (=> b!22620 d!7326))

(declare-fun d!7328 () Bool)

(declare-fun e!15340 () Bool)

(assert (=> d!7328 e!15340))

(declare-fun res!19548 () Bool)

(assert (=> d!7328 (=> (not res!19548) (not e!15340))))

(declare-fun lt!33365 () (_ BitVec 64))

(declare-fun lt!33363 () (_ BitVec 64))

(declare-fun lt!33368 () (_ BitVec 64))

(assert (=> d!7328 (= res!19548 (= lt!33363 (bvsub lt!33368 lt!33365)))))

(assert (=> d!7328 (or (= (bvand lt!33368 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!33365 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!33368 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!33368 lt!33365) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!7328 (= lt!33365 (remainingBits!0 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!33190)))) ((_ sign_extend 32) (currentByte!2285 (_2!1386 lt!33190))) ((_ sign_extend 32) (currentBit!2280 (_2!1386 lt!33190)))))))

(declare-fun lt!33366 () (_ BitVec 64))

(declare-fun lt!33364 () (_ BitVec 64))

(assert (=> d!7328 (= lt!33368 (bvmul lt!33366 lt!33364))))

(assert (=> d!7328 (or (= lt!33366 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!33364 (bvsdiv (bvmul lt!33366 lt!33364) lt!33366)))))

(assert (=> d!7328 (= lt!33364 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!7328 (= lt!33366 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!33190)))))))

(assert (=> d!7328 (= lt!33363 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2285 (_2!1386 lt!33190))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2280 (_2!1386 lt!33190)))))))

(assert (=> d!7328 (invariant!0 (currentBit!2280 (_2!1386 lt!33190)) (currentByte!2285 (_2!1386 lt!33190)) (size!660 (buf!978 (_2!1386 lt!33190))))))

(assert (=> d!7328 (= (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!33190))) (currentByte!2285 (_2!1386 lt!33190)) (currentBit!2280 (_2!1386 lt!33190))) lt!33363)))

(declare-fun b!22757 () Bool)

(declare-fun res!19549 () Bool)

(assert (=> b!22757 (=> (not res!19549) (not e!15340))))

(assert (=> b!22757 (= res!19549 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!33363))))

(declare-fun b!22758 () Bool)

(declare-fun lt!33367 () (_ BitVec 64))

(assert (=> b!22758 (= e!15340 (bvsle lt!33363 (bvmul lt!33367 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!22758 (or (= lt!33367 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!33367 #b0000000000000000000000000000000000000000000000000000000000001000) lt!33367)))))

(assert (=> b!22758 (= lt!33367 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!33190)))))))

(assert (= (and d!7328 res!19548) b!22757))

(assert (= (and b!22757 res!19549) b!22758))

(assert (=> d!7328 m!31795))

(declare-fun m!31855 () Bool)

(assert (=> d!7328 m!31855))

(assert (=> b!22620 d!7328))

(declare-fun b!22761 () Bool)

(declare-fun e!15342 () Bool)

(declare-fun lt!33369 () List!278)

(assert (=> b!22761 (= e!15342 (isEmpty!63 lt!33369))))

(declare-fun b!22759 () Bool)

(declare-fun e!15341 () tuple2!2626)

(assert (=> b!22759 (= e!15341 (tuple2!2627 Nil!275 (_1!1387 lt!33170)))))

(declare-fun b!22760 () Bool)

(declare-fun lt!33370 () (_ BitVec 64))

(declare-fun lt!33371 () tuple2!2628)

(assert (=> b!22760 (= e!15341 (tuple2!2627 (Cons!274 (_1!1399 lt!33371) (bitStreamReadBitsIntoList!0 (_2!1386 lt!33171) (_2!1399 lt!33371) (bvsub (bvsub lt!33175 #b0000000000000000000000000000000000000000000000000000000000000001) lt!33370))) (_2!1399 lt!33371)))))

(assert (=> b!22760 (= lt!33371 (readBit!0 (_1!1387 lt!33170)))))

(assert (=> b!22760 (= lt!33370 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!7330 () Bool)

(assert (=> d!7330 e!15342))

(declare-fun c!1657 () Bool)

(assert (=> d!7330 (= c!1657 (= (bvsub lt!33175 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!7330 (= lt!33369 (_1!1398 e!15341))))

(declare-fun c!1656 () Bool)

(assert (=> d!7330 (= c!1656 (= (bvsub lt!33175 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!7330 (bvsge (bvsub lt!33175 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!7330 (= (bitStreamReadBitsIntoList!0 (_2!1386 lt!33171) (_1!1387 lt!33170) (bvsub lt!33175 #b0000000000000000000000000000000000000000000000000000000000000001)) lt!33369)))

(declare-fun b!22762 () Bool)

(assert (=> b!22762 (= e!15342 (> (length!58 lt!33369) 0))))

(assert (= (and d!7330 c!1656) b!22759))

(assert (= (and d!7330 (not c!1656)) b!22760))

(assert (= (and d!7330 c!1657) b!22761))

(assert (= (and d!7330 (not c!1657)) b!22762))

(declare-fun m!31857 () Bool)

(assert (=> b!22761 m!31857))

(declare-fun m!31859 () Bool)

(assert (=> b!22760 m!31859))

(assert (=> b!22760 m!31801))

(declare-fun m!31861 () Bool)

(assert (=> b!22762 m!31861))

(assert (=> b!22620 d!7330))

(declare-fun d!7332 () Bool)

(assert (=> d!7332 (= (bitAt!0 (buf!978 (_2!1386 lt!33190)) lt!33186) (bitAt!0 (buf!978 (_2!1386 lt!33171)) lt!33186))))

(declare-fun lt!33374 () Unit!1930)

(declare-fun choose!31 (array!1548 array!1548 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!1930)

(assert (=> d!7332 (= lt!33374 (choose!31 (buf!978 (_2!1386 lt!33190)) (buf!978 (_2!1386 lt!33171)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!33186 (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!33190))) (currentByte!2285 (_2!1386 lt!33190)) (currentBit!2280 (_2!1386 lt!33190)))))))

(assert (=> d!7332 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!33190))) (currentByte!2285 (_2!1386 lt!33190)) (currentBit!2280 (_2!1386 lt!33190)))))))

(assert (=> d!7332 (= (arrayBitRangesEqImpliesEq!0 (buf!978 (_2!1386 lt!33190)) (buf!978 (_2!1386 lt!33171)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!33186 (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!33190))) (currentByte!2285 (_2!1386 lt!33190)) (currentBit!2280 (_2!1386 lt!33190)))) lt!33374)))

(declare-fun bs!2102 () Bool)

(assert (= bs!2102 d!7332))

(assert (=> bs!2102 m!31587))

(assert (=> bs!2102 m!31543))

(assert (=> bs!2102 m!31555))

(declare-fun m!31863 () Bool)

(assert (=> bs!2102 m!31863))

(assert (=> b!22620 d!7332))

(declare-fun d!7334 () Bool)

(declare-fun c!1658 () Bool)

(assert (=> d!7334 (= c!1658 (= (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!15343 () List!278)

(assert (=> d!7334 (= (byteArrayBitContentToList!0 (_2!1386 lt!33171) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)) e!15343)))

(declare-fun b!22763 () Bool)

(assert (=> b!22763 (= e!15343 Nil!275)))

(declare-fun b!22764 () Bool)

(assert (=> b!22764 (= e!15343 (Cons!274 (not (= (bvand ((_ sign_extend 24) (select (arr!1113 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1386 lt!33171) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!7334 c!1658) b!22763))

(assert (= (and d!7334 (not c!1658)) b!22764))

(declare-fun m!31865 () Bool)

(assert (=> b!22764 m!31865))

(declare-fun m!31867 () Bool)

(assert (=> b!22764 m!31867))

(declare-fun m!31869 () Bool)

(assert (=> b!22764 m!31869))

(assert (=> b!22620 d!7334))

(declare-fun d!7336 () Bool)

(assert (=> d!7336 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!33171)))) ((_ sign_extend 32) (currentByte!2285 (_2!1386 lt!32403))) ((_ sign_extend 32) (currentBit!2280 (_2!1386 lt!32403))) lt!33192) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!33171)))) ((_ sign_extend 32) (currentByte!2285 (_2!1386 lt!32403))) ((_ sign_extend 32) (currentBit!2280 (_2!1386 lt!32403)))) lt!33192))))

(declare-fun bs!2103 () Bool)

(assert (= bs!2103 d!7336))

(declare-fun m!31871 () Bool)

(assert (=> bs!2103 m!31871))

(assert (=> b!22620 d!7336))

(declare-fun b!22765 () Bool)

(declare-fun res!19550 () Bool)

(declare-fun e!15346 () Bool)

(assert (=> b!22765 (=> (not res!19550) (not e!15346))))

(declare-fun lt!33386 () tuple2!2602)

(assert (=> b!22765 (= res!19550 (isPrefixOf!0 (_2!1386 lt!32403) (_2!1386 lt!33386)))))

(declare-fun b!22766 () Bool)

(declare-fun res!19556 () Bool)

(declare-fun e!15345 () Bool)

(assert (=> b!22766 (=> (not res!19556) (not e!15345))))

(declare-fun lt!33381 () tuple2!2602)

(declare-fun lt!33380 () (_ BitVec 64))

(declare-fun lt!33375 () (_ BitVec 64))

(assert (=> b!22766 (= res!19556 (= (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!33381))) (currentByte!2285 (_2!1386 lt!33381)) (currentBit!2280 (_2!1386 lt!33381))) (bvadd lt!33380 lt!33375)))))

(assert (=> b!22766 (or (not (= (bvand lt!33380 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!33375 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!33380 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!33380 lt!33375) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!22766 (= lt!33375 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!22766 (= lt!33380 (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!32403))) (currentByte!2285 (_2!1386 lt!32403)) (currentBit!2280 (_2!1386 lt!32403))))))

(declare-fun b!22767 () Bool)

(declare-fun res!19557 () Bool)

(assert (=> b!22767 (=> (not res!19557) (not e!15346))))

(assert (=> b!22767 (= res!19557 (= (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!33386))) (currentByte!2285 (_2!1386 lt!33386)) (currentBit!2280 (_2!1386 lt!33386))) (bvadd (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!32403))) (currentByte!2285 (_2!1386 lt!32403)) (currentBit!2280 (_2!1386 lt!32403))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun d!7338 () Bool)

(assert (=> d!7338 e!15345))

(declare-fun res!19554 () Bool)

(assert (=> d!7338 (=> (not res!19554) (not e!15345))))

(assert (=> d!7338 (= res!19554 (= (size!660 (buf!978 (_2!1386 lt!33381))) (size!660 (buf!978 (_2!1386 lt!32403)))))))

(declare-fun lt!33379 () (_ BitVec 8))

(declare-fun lt!33382 () array!1548)

(assert (=> d!7338 (= lt!33379 (select (arr!1113 lt!33382) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!7338 (and (bvsge ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)) (size!660 lt!33382)))))

(assert (=> d!7338 (= lt!33382 (array!1549 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!33385 () tuple2!2602)

(assert (=> d!7338 (= lt!33381 (tuple2!2603 (_1!1386 lt!33385) (_2!1386 lt!33385)))))

(assert (=> d!7338 (= lt!33385 lt!33386)))

(assert (=> d!7338 e!15346))

(declare-fun res!19551 () Bool)

(assert (=> d!7338 (=> (not res!19551) (not e!15346))))

(assert (=> d!7338 (= res!19551 (= (size!660 (buf!978 (_2!1386 lt!32403))) (size!660 (buf!978 (_2!1386 lt!33386)))))))

(declare-fun lt!33383 () Bool)

(assert (=> d!7338 (= lt!33386 (appendBit!0 (_2!1386 lt!32403) lt!33383))))

(assert (=> d!7338 (= lt!33383 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1113 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!7338 (and (bvsge ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!7338 (= (appendBitFromByte!0 (_2!1386 lt!32403) (select (arr!1113 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) lt!33381)))

(declare-fun b!22768 () Bool)

(declare-fun e!15344 () Bool)

(declare-fun lt!33384 () tuple2!2622)

(assert (=> b!22768 (= e!15344 (= (bitIndex!0 (size!660 (buf!978 (_1!1396 lt!33384))) (currentByte!2285 (_1!1396 lt!33384)) (currentBit!2280 (_1!1396 lt!33384))) (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!33381))) (currentByte!2285 (_2!1386 lt!33381)) (currentBit!2280 (_2!1386 lt!33381)))))))

(declare-fun b!22769 () Bool)

(declare-fun e!15347 () Bool)

(declare-fun lt!33378 () tuple2!2622)

(assert (=> b!22769 (= e!15347 (= (bitIndex!0 (size!660 (buf!978 (_1!1396 lt!33378))) (currentByte!2285 (_1!1396 lt!33378)) (currentBit!2280 (_1!1396 lt!33378))) (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!33386))) (currentByte!2285 (_2!1386 lt!33386)) (currentBit!2280 (_2!1386 lt!33386)))))))

(declare-fun b!22770 () Bool)

(assert (=> b!22770 (= e!15345 e!15344)))

(declare-fun res!19552 () Bool)

(assert (=> b!22770 (=> (not res!19552) (not e!15344))))

(assert (=> b!22770 (= res!19552 (and (= (_2!1396 lt!33384) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1113 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!33379)) #b00000000000000000000000000000000))) (= (_1!1396 lt!33384) (_2!1386 lt!33381))))))

(declare-fun lt!33377 () tuple2!2624)

(declare-fun lt!33376 () BitStream!1154)

(assert (=> b!22770 (= lt!33377 (readBits!0 lt!33376 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!22770 (= lt!33384 (readBitPure!0 lt!33376))))

(assert (=> b!22770 (= lt!33376 (readerFrom!0 (_2!1386 lt!33381) (currentBit!2280 (_2!1386 lt!32403)) (currentByte!2285 (_2!1386 lt!32403))))))

(declare-fun b!22771 () Bool)

(assert (=> b!22771 (= e!15346 e!15347)))

(declare-fun res!19555 () Bool)

(assert (=> b!22771 (=> (not res!19555) (not e!15347))))

(assert (=> b!22771 (= res!19555 (and (= (_2!1396 lt!33378) lt!33383) (= (_1!1396 lt!33378) (_2!1386 lt!33386))))))

(assert (=> b!22771 (= lt!33378 (readBitPure!0 (readerFrom!0 (_2!1386 lt!33386) (currentBit!2280 (_2!1386 lt!32403)) (currentByte!2285 (_2!1386 lt!32403)))))))

(declare-fun b!22772 () Bool)

(declare-fun res!19553 () Bool)

(assert (=> b!22772 (=> (not res!19553) (not e!15345))))

(assert (=> b!22772 (= res!19553 (isPrefixOf!0 (_2!1386 lt!32403) (_2!1386 lt!33381)))))

(assert (= (and d!7338 res!19551) b!22767))

(assert (= (and b!22767 res!19557) b!22765))

(assert (= (and b!22765 res!19550) b!22771))

(assert (= (and b!22771 res!19555) b!22769))

(assert (= (and d!7338 res!19554) b!22766))

(assert (= (and b!22766 res!19556) b!22772))

(assert (= (and b!22772 res!19553) b!22770))

(assert (= (and b!22770 res!19552) b!22768))

(declare-fun m!31873 () Bool)

(assert (=> b!22770 m!31873))

(declare-fun m!31875 () Bool)

(assert (=> b!22770 m!31875))

(declare-fun m!31877 () Bool)

(assert (=> b!22770 m!31877))

(declare-fun m!31879 () Bool)

(assert (=> b!22767 m!31879))

(assert (=> b!22767 m!31133))

(declare-fun m!31881 () Bool)

(assert (=> b!22772 m!31881))

(declare-fun m!31883 () Bool)

(assert (=> b!22765 m!31883))

(declare-fun m!31885 () Bool)

(assert (=> b!22769 m!31885))

(assert (=> b!22769 m!31879))

(declare-fun m!31887 () Bool)

(assert (=> d!7338 m!31887))

(declare-fun m!31889 () Bool)

(assert (=> d!7338 m!31889))

(assert (=> d!7338 m!31723))

(declare-fun m!31891 () Bool)

(assert (=> b!22766 m!31891))

(assert (=> b!22766 m!31133))

(declare-fun m!31893 () Bool)

(assert (=> b!22768 m!31893))

(assert (=> b!22768 m!31891))

(declare-fun m!31895 () Bool)

(assert (=> b!22771 m!31895))

(assert (=> b!22771 m!31895))

(declare-fun m!31897 () Bool)

(assert (=> b!22771 m!31897))

(assert (=> b!22620 d!7338))

(declare-fun d!7340 () Bool)

(declare-fun e!15350 () Bool)

(assert (=> d!7340 e!15350))

(declare-fun res!19560 () Bool)

(assert (=> d!7340 (=> (not res!19560) (not e!15350))))

(declare-fun lt!33392 () (_ BitVec 64))

(assert (=> d!7340 (= res!19560 (or (= (bvand lt!33175 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!33392 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!33175 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!33175 lt!33392) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!7340 (= lt!33392 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!33391 () Unit!1930)

(declare-fun choose!42 (BitStream!1154 BitStream!1154 BitStream!1154 BitStream!1154 (_ BitVec 64) List!278) Unit!1930)

(assert (=> d!7340 (= lt!33391 (choose!42 (_2!1386 lt!33171) (_2!1386 lt!33171) (_1!1387 lt!33174) (_1!1387 lt!33170) lt!33175 lt!33183))))

(assert (=> d!7340 (bvsgt lt!33175 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!7340 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1386 lt!33171) (_2!1386 lt!33171) (_1!1387 lt!33174) (_1!1387 lt!33170) lt!33175 lt!33183) lt!33391)))

(declare-fun b!22775 () Bool)

(assert (=> b!22775 (= e!15350 (= (bitStreamReadBitsIntoList!0 (_2!1386 lt!33171) (_1!1387 lt!33170) (bvsub lt!33175 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!85 lt!33183)))))

(assert (= (and d!7340 res!19560) b!22775))

(declare-fun m!31899 () Bool)

(assert (=> d!7340 m!31899))

(assert (=> b!22775 m!31565))

(assert (=> b!22775 m!31599))

(assert (=> b!22620 d!7340))

(declare-fun d!7342 () Bool)

(declare-fun c!1659 () Bool)

(assert (=> d!7342 (= c!1659 (= (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!15351 () List!278)

(assert (=> d!7342 (= (byteArrayBitContentToList!0 (_2!1386 lt!33171) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) e!15351)))

(declare-fun b!22776 () Bool)

(assert (=> b!22776 (= e!15351 Nil!275)))

(declare-fun b!22777 () Bool)

(assert (=> b!22777 (= e!15351 (Cons!274 (not (= (bvand ((_ sign_extend 24) (select (arr!1113 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1386 lt!33171) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!7342 c!1659) b!22776))

(assert (= (and d!7342 (not c!1659)) b!22777))

(assert (=> b!22777 m!31541))

(assert (=> b!22777 m!31723))

(assert (=> b!22777 m!31581))

(assert (=> b!22620 d!7342))

(declare-fun lt!33423 () tuple2!2604)

(declare-fun e!15352 () Bool)

(declare-fun lt!33430 () tuple2!2602)

(declare-fun b!22778 () Bool)

(assert (=> b!22778 (= e!15352 (= (bitStreamReadBitsIntoList!0 (_2!1386 lt!33430) (_1!1387 lt!33423) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001))) (byteArrayBitContentToList!0 (_2!1386 lt!33430) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(assert (=> b!22778 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!22778 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!33433 () Unit!1930)

(declare-fun lt!33396 () Unit!1930)

(assert (=> b!22778 (= lt!33433 lt!33396)))

(declare-fun lt!33428 () (_ BitVec 64))

(assert (=> b!22778 (validate_offset_bits!1 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!33430)))) ((_ sign_extend 32) (currentByte!2285 (_2!1386 lt!33190))) ((_ sign_extend 32) (currentBit!2280 (_2!1386 lt!33190))) lt!33428)))

(assert (=> b!22778 (= lt!33396 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1386 lt!33190) (buf!978 (_2!1386 lt!33430)) lt!33428))))

(declare-fun e!15354 () Bool)

(assert (=> b!22778 e!15354))

(declare-fun res!19561 () Bool)

(assert (=> b!22778 (=> (not res!19561) (not e!15354))))

(assert (=> b!22778 (= res!19561 (and (= (size!660 (buf!978 (_2!1386 lt!33190))) (size!660 (buf!978 (_2!1386 lt!33430)))) (bvsge lt!33428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!22778 (= lt!33428 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!22778 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!22778 (= lt!33423 (reader!0 (_2!1386 lt!33190) (_2!1386 lt!33430)))))

(declare-fun b!22779 () Bool)

(declare-fun res!19566 () Bool)

(assert (=> b!22779 (=> (not res!19566) (not e!15352))))

(assert (=> b!22779 (= res!19566 (invariant!0 (currentBit!2280 (_2!1386 lt!33430)) (currentByte!2285 (_2!1386 lt!33430)) (size!660 (buf!978 (_2!1386 lt!33430)))))))

(declare-fun b!22780 () Bool)

(declare-fun res!19564 () Bool)

(assert (=> b!22780 (=> (not res!19564) (not e!15352))))

(assert (=> b!22780 (= res!19564 (= (size!660 (buf!978 (_2!1386 lt!33190))) (size!660 (buf!978 (_2!1386 lt!33430)))))))

(declare-fun b!22781 () Bool)

(declare-fun res!19563 () Bool)

(assert (=> b!22781 (=> (not res!19563) (not e!15352))))

(assert (=> b!22781 (= res!19563 (isPrefixOf!0 (_2!1386 lt!33190) (_2!1386 lt!33430)))))

(declare-fun lt!33424 () tuple2!2602)

(declare-fun lt!33405 () tuple2!2602)

(declare-fun c!1660 () Bool)

(declare-fun bm!331 () Bool)

(declare-fun call!334 () tuple2!2604)

(assert (=> bm!331 (= call!334 (reader!0 (ite c!1660 (_2!1386 lt!33424) (_2!1386 lt!33190)) (ite c!1660 (_2!1386 lt!33405) (_2!1386 lt!33190))))))

(declare-fun b!22782 () Bool)

(assert (=> b!22782 (= e!15354 (validate_offset_bits!1 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!33190)))) ((_ sign_extend 32) (currentByte!2285 (_2!1386 lt!33190))) ((_ sign_extend 32) (currentBit!2280 (_2!1386 lt!33190))) lt!33428))))

(declare-fun b!22783 () Bool)

(declare-fun e!15353 () tuple2!2602)

(declare-fun Unit!1958 () Unit!1930)

(assert (=> b!22783 (= e!15353 (tuple2!2603 Unit!1958 (_2!1386 lt!33190)))))

(assert (=> b!22783 (= (size!660 (buf!978 (_2!1386 lt!33190))) (size!660 (buf!978 (_2!1386 lt!33190))))))

(declare-fun lt!33432 () Unit!1930)

(declare-fun Unit!1959 () Unit!1930)

(assert (=> b!22783 (= lt!33432 Unit!1959)))

(assert (=> b!22783 (checkByteArrayBitContent!0 (_2!1386 lt!33190) srcBuffer!2 (_1!1397 (readBits!0 (_1!1387 call!334) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!22784 () Bool)

(declare-fun res!19565 () Bool)

(assert (=> b!22784 (=> (not res!19565) (not e!15352))))

(assert (=> b!22784 (= res!19565 (= (size!660 (buf!978 (_2!1386 lt!33430))) (size!660 (buf!978 (_2!1386 lt!33190)))))))

(declare-fun d!7344 () Bool)

(assert (=> d!7344 e!15352))

(declare-fun res!19562 () Bool)

(assert (=> d!7344 (=> (not res!19562) (not e!15352))))

(declare-fun lt!33425 () (_ BitVec 64))

(assert (=> d!7344 (= res!19562 (= (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!33430))) (currentByte!2285 (_2!1386 lt!33430)) (currentBit!2280 (_2!1386 lt!33430))) (bvsub lt!33425 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> d!7344 (or (= (bvand lt!33425 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!33425 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!33425 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!33436 () (_ BitVec 64))

(assert (=> d!7344 (= lt!33425 (bvadd lt!33436 to!314))))

(assert (=> d!7344 (or (not (= (bvand lt!33436 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!33436 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!33436 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!7344 (= lt!33436 (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!33190))) (currentByte!2285 (_2!1386 lt!33190)) (currentBit!2280 (_2!1386 lt!33190))))))

(assert (=> d!7344 (= lt!33430 e!15353)))

(assert (=> d!7344 (= c!1660 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!33406 () Unit!1930)

(declare-fun lt!33410 () Unit!1930)

(assert (=> d!7344 (= lt!33406 lt!33410)))

(assert (=> d!7344 (isPrefixOf!0 (_2!1386 lt!33190) (_2!1386 lt!33190))))

(assert (=> d!7344 (= lt!33410 (lemmaIsPrefixRefl!0 (_2!1386 lt!33190)))))

(declare-fun lt!33420 () (_ BitVec 64))

(assert (=> d!7344 (= lt!33420 (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!33190))) (currentByte!2285 (_2!1386 lt!33190)) (currentBit!2280 (_2!1386 lt!33190))))))

(assert (=> d!7344 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!7344 (= (appendBitsMSBFirstLoop!0 (_2!1386 lt!33190) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314) lt!33430)))

(declare-fun b!22785 () Bool)

(declare-fun Unit!1960 () Unit!1930)

(assert (=> b!22785 (= e!15353 (tuple2!2603 Unit!1960 (_2!1386 lt!33405)))))

(assert (=> b!22785 (= lt!33424 (appendBitFromByte!0 (_2!1386 lt!33190) (select (arr!1113 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!33399 () (_ BitVec 64))

(assert (=> b!22785 (= lt!33399 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!33394 () (_ BitVec 64))

(assert (=> b!22785 (= lt!33394 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!33414 () Unit!1930)

(assert (=> b!22785 (= lt!33414 (validateOffsetBitsIneqLemma!0 (_2!1386 lt!33190) (_2!1386 lt!33424) lt!33399 lt!33394))))

(assert (=> b!22785 (validate_offset_bits!1 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!33424)))) ((_ sign_extend 32) (currentByte!2285 (_2!1386 lt!33424))) ((_ sign_extend 32) (currentBit!2280 (_2!1386 lt!33424))) (bvsub lt!33399 lt!33394))))

(declare-fun lt!33393 () Unit!1930)

(assert (=> b!22785 (= lt!33393 lt!33414)))

(declare-fun lt!33421 () tuple2!2604)

(assert (=> b!22785 (= lt!33421 (reader!0 (_2!1386 lt!33190) (_2!1386 lt!33424)))))

(declare-fun lt!33402 () (_ BitVec 64))

(assert (=> b!22785 (= lt!33402 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!33418 () Unit!1930)

(assert (=> b!22785 (= lt!33418 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1386 lt!33190) (buf!978 (_2!1386 lt!33424)) lt!33402))))

(assert (=> b!22785 (validate_offset_bits!1 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!33424)))) ((_ sign_extend 32) (currentByte!2285 (_2!1386 lt!33190))) ((_ sign_extend 32) (currentBit!2280 (_2!1386 lt!33190))) lt!33402)))

(declare-fun lt!33429 () Unit!1930)

(assert (=> b!22785 (= lt!33429 lt!33418)))

(assert (=> b!22785 (= (head!115 (byteArrayBitContentToList!0 (_2!1386 lt!33424) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!115 (bitStreamReadBitsIntoList!0 (_2!1386 lt!33424) (_1!1387 lt!33421) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!33422 () Unit!1930)

(declare-fun Unit!1961 () Unit!1930)

(assert (=> b!22785 (= lt!33422 Unit!1961)))

(assert (=> b!22785 (= lt!33405 (appendBitsMSBFirstLoop!0 (_2!1386 lt!33424) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!33415 () Unit!1930)

(assert (=> b!22785 (= lt!33415 (lemmaIsPrefixTransitive!0 (_2!1386 lt!33190) (_2!1386 lt!33424) (_2!1386 lt!33405)))))

(assert (=> b!22785 (isPrefixOf!0 (_2!1386 lt!33190) (_2!1386 lt!33405))))

(declare-fun lt!33398 () Unit!1930)

(assert (=> b!22785 (= lt!33398 lt!33415)))

(assert (=> b!22785 (= (size!660 (buf!978 (_2!1386 lt!33405))) (size!660 (buf!978 (_2!1386 lt!33190))))))

(declare-fun lt!33395 () Unit!1930)

(declare-fun Unit!1962 () Unit!1930)

(assert (=> b!22785 (= lt!33395 Unit!1962)))

(assert (=> b!22785 (= (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!33405))) (currentByte!2285 (_2!1386 lt!33405)) (currentBit!2280 (_2!1386 lt!33405))) (bvsub (bvadd (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!33190))) (currentByte!2285 (_2!1386 lt!33190)) (currentBit!2280 (_2!1386 lt!33190))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!33411 () Unit!1930)

(declare-fun Unit!1963 () Unit!1930)

(assert (=> b!22785 (= lt!33411 Unit!1963)))

(assert (=> b!22785 (= (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!33405))) (currentByte!2285 (_2!1386 lt!33405)) (currentBit!2280 (_2!1386 lt!33405))) (bvsub (bvsub (bvadd (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!33424))) (currentByte!2285 (_2!1386 lt!33424)) (currentBit!2280 (_2!1386 lt!33424))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!33416 () Unit!1930)

(declare-fun Unit!1964 () Unit!1930)

(assert (=> b!22785 (= lt!33416 Unit!1964)))

(declare-fun lt!33408 () tuple2!2604)

(assert (=> b!22785 (= lt!33408 (reader!0 (_2!1386 lt!33190) (_2!1386 lt!33405)))))

(declare-fun lt!33426 () (_ BitVec 64))

(assert (=> b!22785 (= lt!33426 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!33403 () Unit!1930)

(assert (=> b!22785 (= lt!33403 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1386 lt!33190) (buf!978 (_2!1386 lt!33405)) lt!33426))))

(assert (=> b!22785 (validate_offset_bits!1 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!33405)))) ((_ sign_extend 32) (currentByte!2285 (_2!1386 lt!33190))) ((_ sign_extend 32) (currentBit!2280 (_2!1386 lt!33190))) lt!33426)))

(declare-fun lt!33400 () Unit!1930)

(assert (=> b!22785 (= lt!33400 lt!33403)))

(declare-fun lt!33404 () tuple2!2604)

(assert (=> b!22785 (= lt!33404 call!334)))

(declare-fun lt!33431 () (_ BitVec 64))

(assert (=> b!22785 (= lt!33431 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!33435 () Unit!1930)

(assert (=> b!22785 (= lt!33435 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1386 lt!33424) (buf!978 (_2!1386 lt!33405)) lt!33431))))

(assert (=> b!22785 (validate_offset_bits!1 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!33405)))) ((_ sign_extend 32) (currentByte!2285 (_2!1386 lt!33424))) ((_ sign_extend 32) (currentBit!2280 (_2!1386 lt!33424))) lt!33431)))

(declare-fun lt!33397 () Unit!1930)

(assert (=> b!22785 (= lt!33397 lt!33435)))

(declare-fun lt!33407 () List!278)

(assert (=> b!22785 (= lt!33407 (byteArrayBitContentToList!0 (_2!1386 lt!33405) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!33434 () List!278)

(assert (=> b!22785 (= lt!33434 (byteArrayBitContentToList!0 (_2!1386 lt!33405) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!33417 () List!278)

(assert (=> b!22785 (= lt!33417 (bitStreamReadBitsIntoList!0 (_2!1386 lt!33405) (_1!1387 lt!33408) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!33427 () List!278)

(assert (=> b!22785 (= lt!33427 (bitStreamReadBitsIntoList!0 (_2!1386 lt!33405) (_1!1387 lt!33404) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!33409 () (_ BitVec 64))

(assert (=> b!22785 (= lt!33409 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!33401 () Unit!1930)

(assert (=> b!22785 (= lt!33401 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1386 lt!33405) (_2!1386 lt!33405) (_1!1387 lt!33408) (_1!1387 lt!33404) lt!33409 lt!33417))))

(assert (=> b!22785 (= (bitStreamReadBitsIntoList!0 (_2!1386 lt!33405) (_1!1387 lt!33404) (bvsub lt!33409 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!85 lt!33417))))

(declare-fun lt!33413 () Unit!1930)

(assert (=> b!22785 (= lt!33413 lt!33401)))

(declare-fun lt!33419 () Unit!1930)

(assert (=> b!22785 (= lt!33419 (arrayBitRangesEqImpliesEq!0 (buf!978 (_2!1386 lt!33424)) (buf!978 (_2!1386 lt!33405)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!33420 (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!33424))) (currentByte!2285 (_2!1386 lt!33424)) (currentBit!2280 (_2!1386 lt!33424)))))))

(assert (=> b!22785 (= (bitAt!0 (buf!978 (_2!1386 lt!33424)) lt!33420) (bitAt!0 (buf!978 (_2!1386 lt!33405)) lt!33420))))

(declare-fun lt!33412 () Unit!1930)

(assert (=> b!22785 (= lt!33412 lt!33419)))

(assert (= (and d!7344 c!1660) b!22785))

(assert (= (and d!7344 (not c!1660)) b!22783))

(assert (= (or b!22785 b!22783) bm!331))

(assert (= (and d!7344 res!19562) b!22779))

(assert (= (and b!22779 res!19566) b!22780))

(assert (= (and b!22780 res!19564) b!22781))

(assert (= (and b!22781 res!19563) b!22784))

(assert (= (and b!22784 res!19565) b!22778))

(assert (= (and b!22778 res!19561) b!22782))

(declare-fun m!31901 () Bool)

(assert (=> b!22779 m!31901))

(declare-fun m!31903 () Bool)

(assert (=> d!7344 m!31903))

(assert (=> d!7344 m!31555))

(assert (=> d!7344 m!31841))

(assert (=> d!7344 m!31839))

(declare-fun m!31905 () Bool)

(assert (=> b!22778 m!31905))

(declare-fun m!31907 () Bool)

(assert (=> b!22778 m!31907))

(declare-fun m!31909 () Bool)

(assert (=> b!22778 m!31909))

(declare-fun m!31911 () Bool)

(assert (=> b!22778 m!31911))

(declare-fun m!31913 () Bool)

(assert (=> b!22778 m!31913))

(declare-fun m!31915 () Bool)

(assert (=> b!22783 m!31915))

(declare-fun m!31917 () Bool)

(assert (=> b!22783 m!31917))

(declare-fun m!31919 () Bool)

(assert (=> bm!331 m!31919))

(assert (=> b!22785 m!31865))

(declare-fun m!31921 () Bool)

(assert (=> b!22785 m!31921))

(declare-fun m!31923 () Bool)

(assert (=> b!22785 m!31923))

(declare-fun m!31925 () Bool)

(assert (=> b!22785 m!31925))

(declare-fun m!31927 () Bool)

(assert (=> b!22785 m!31927))

(assert (=> b!22785 m!31925))

(declare-fun m!31929 () Bool)

(assert (=> b!22785 m!31929))

(assert (=> b!22785 m!31865))

(declare-fun m!31931 () Bool)

(assert (=> b!22785 m!31931))

(declare-fun m!31933 () Bool)

(assert (=> b!22785 m!31933))

(declare-fun m!31935 () Bool)

(assert (=> b!22785 m!31935))

(declare-fun m!31937 () Bool)

(assert (=> b!22785 m!31937))

(declare-fun m!31939 () Bool)

(assert (=> b!22785 m!31939))

(declare-fun m!31941 () Bool)

(assert (=> b!22785 m!31941))

(declare-fun m!31943 () Bool)

(assert (=> b!22785 m!31943))

(declare-fun m!31945 () Bool)

(assert (=> b!22785 m!31945))

(declare-fun m!31947 () Bool)

(assert (=> b!22785 m!31947))

(assert (=> b!22785 m!31941))

(declare-fun m!31949 () Bool)

(assert (=> b!22785 m!31949))

(assert (=> b!22785 m!31933))

(declare-fun m!31951 () Bool)

(assert (=> b!22785 m!31951))

(declare-fun m!31953 () Bool)

(assert (=> b!22785 m!31953))

(declare-fun m!31955 () Bool)

(assert (=> b!22785 m!31955))

(declare-fun m!31957 () Bool)

(assert (=> b!22785 m!31957))

(declare-fun m!31959 () Bool)

(assert (=> b!22785 m!31959))

(declare-fun m!31961 () Bool)

(assert (=> b!22785 m!31961))

(declare-fun m!31963 () Bool)

(assert (=> b!22785 m!31963))

(declare-fun m!31965 () Bool)

(assert (=> b!22785 m!31965))

(declare-fun m!31967 () Bool)

(assert (=> b!22785 m!31967))

(declare-fun m!31969 () Bool)

(assert (=> b!22785 m!31969))

(declare-fun m!31971 () Bool)

(assert (=> b!22785 m!31971))

(assert (=> b!22785 m!31555))

(declare-fun m!31973 () Bool)

(assert (=> b!22785 m!31973))

(declare-fun m!31975 () Bool)

(assert (=> b!22785 m!31975))

(declare-fun m!31977 () Bool)

(assert (=> b!22785 m!31977))

(declare-fun m!31979 () Bool)

(assert (=> b!22785 m!31979))

(declare-fun m!31981 () Bool)

(assert (=> b!22781 m!31981))

(declare-fun m!31983 () Bool)

(assert (=> b!22782 m!31983))

(assert (=> b!22620 d!7344))

(declare-fun d!7346 () Bool)

(declare-fun e!15355 () Bool)

(assert (=> d!7346 e!15355))

(declare-fun res!19567 () Bool)

(assert (=> d!7346 (=> (not res!19567) (not e!15355))))

(declare-fun lt!33442 () (_ BitVec 64))

(declare-fun lt!33437 () (_ BitVec 64))

(declare-fun lt!33439 () (_ BitVec 64))

(assert (=> d!7346 (= res!19567 (= lt!33437 (bvsub lt!33442 lt!33439)))))

(assert (=> d!7346 (or (= (bvand lt!33442 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!33439 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!33442 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!33442 lt!33439) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!7346 (= lt!33439 (remainingBits!0 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!33171)))) ((_ sign_extend 32) (currentByte!2285 (_2!1386 lt!33171))) ((_ sign_extend 32) (currentBit!2280 (_2!1386 lt!33171)))))))

(declare-fun lt!33440 () (_ BitVec 64))

(declare-fun lt!33438 () (_ BitVec 64))

(assert (=> d!7346 (= lt!33442 (bvmul lt!33440 lt!33438))))

(assert (=> d!7346 (or (= lt!33440 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!33438 (bvsdiv (bvmul lt!33440 lt!33438) lt!33440)))))

(assert (=> d!7346 (= lt!33438 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!7346 (= lt!33440 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!33171)))))))

(assert (=> d!7346 (= lt!33437 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2285 (_2!1386 lt!33171))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2280 (_2!1386 lt!33171)))))))

(assert (=> d!7346 (invariant!0 (currentBit!2280 (_2!1386 lt!33171)) (currentByte!2285 (_2!1386 lt!33171)) (size!660 (buf!978 (_2!1386 lt!33171))))))

(assert (=> d!7346 (= (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!33171))) (currentByte!2285 (_2!1386 lt!33171)) (currentBit!2280 (_2!1386 lt!33171))) lt!33437)))

(declare-fun b!22786 () Bool)

(declare-fun res!19568 () Bool)

(assert (=> b!22786 (=> (not res!19568) (not e!15355))))

(assert (=> b!22786 (= res!19568 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!33437))))

(declare-fun b!22787 () Bool)

(declare-fun lt!33441 () (_ BitVec 64))

(assert (=> b!22787 (= e!15355 (bvsle lt!33437 (bvmul lt!33441 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!22787 (or (= lt!33441 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!33441 #b0000000000000000000000000000000000000000000000000000000000001000) lt!33441)))))

(assert (=> b!22787 (= lt!33441 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!33171)))))))

(assert (= (and d!7346 res!19567) b!22786))

(assert (= (and b!22786 res!19568) b!22787))

(declare-fun m!31985 () Bool)

(assert (=> d!7346 m!31985))

(declare-fun m!31987 () Bool)

(assert (=> d!7346 m!31987))

(assert (=> b!22620 d!7346))

(declare-fun b!22788 () Bool)

(declare-fun res!19569 () Bool)

(declare-fun e!15357 () Bool)

(assert (=> b!22788 (=> (not res!19569) (not e!15357))))

(declare-fun lt!33449 () tuple2!2604)

(assert (=> b!22788 (= res!19569 (isPrefixOf!0 (_1!1387 lt!33449) (_2!1386 lt!32403)))))

(declare-fun d!7348 () Bool)

(assert (=> d!7348 e!15357))

(declare-fun res!19571 () Bool)

(assert (=> d!7348 (=> (not res!19571) (not e!15357))))

(assert (=> d!7348 (= res!19571 (isPrefixOf!0 (_1!1387 lt!33449) (_2!1387 lt!33449)))))

(declare-fun lt!33446 () BitStream!1154)

(assert (=> d!7348 (= lt!33449 (tuple2!2605 lt!33446 (_2!1386 lt!33171)))))

(declare-fun lt!33451 () Unit!1930)

(declare-fun lt!33450 () Unit!1930)

(assert (=> d!7348 (= lt!33451 lt!33450)))

(assert (=> d!7348 (isPrefixOf!0 lt!33446 (_2!1386 lt!33171))))

(assert (=> d!7348 (= lt!33450 (lemmaIsPrefixTransitive!0 lt!33446 (_2!1386 lt!33171) (_2!1386 lt!33171)))))

(declare-fun lt!33456 () Unit!1930)

(declare-fun lt!33447 () Unit!1930)

(assert (=> d!7348 (= lt!33456 lt!33447)))

(assert (=> d!7348 (isPrefixOf!0 lt!33446 (_2!1386 lt!33171))))

(assert (=> d!7348 (= lt!33447 (lemmaIsPrefixTransitive!0 lt!33446 (_2!1386 lt!32403) (_2!1386 lt!33171)))))

(declare-fun lt!33444 () Unit!1930)

(declare-fun e!15356 () Unit!1930)

(assert (=> d!7348 (= lt!33444 e!15356)))

(declare-fun c!1661 () Bool)

(assert (=> d!7348 (= c!1661 (not (= (size!660 (buf!978 (_2!1386 lt!32403))) #b00000000000000000000000000000000)))))

(declare-fun lt!33453 () Unit!1930)

(declare-fun lt!33462 () Unit!1930)

(assert (=> d!7348 (= lt!33453 lt!33462)))

(assert (=> d!7348 (isPrefixOf!0 (_2!1386 lt!33171) (_2!1386 lt!33171))))

(assert (=> d!7348 (= lt!33462 (lemmaIsPrefixRefl!0 (_2!1386 lt!33171)))))

(declare-fun lt!33457 () Unit!1930)

(declare-fun lt!33448 () Unit!1930)

(assert (=> d!7348 (= lt!33457 lt!33448)))

(assert (=> d!7348 (= lt!33448 (lemmaIsPrefixRefl!0 (_2!1386 lt!33171)))))

(declare-fun lt!33452 () Unit!1930)

(declare-fun lt!33461 () Unit!1930)

(assert (=> d!7348 (= lt!33452 lt!33461)))

(assert (=> d!7348 (isPrefixOf!0 lt!33446 lt!33446)))

(assert (=> d!7348 (= lt!33461 (lemmaIsPrefixRefl!0 lt!33446))))

(declare-fun lt!33443 () Unit!1930)

(declare-fun lt!33459 () Unit!1930)

(assert (=> d!7348 (= lt!33443 lt!33459)))

(assert (=> d!7348 (isPrefixOf!0 (_2!1386 lt!32403) (_2!1386 lt!32403))))

(assert (=> d!7348 (= lt!33459 (lemmaIsPrefixRefl!0 (_2!1386 lt!32403)))))

(assert (=> d!7348 (= lt!33446 (BitStream!1155 (buf!978 (_2!1386 lt!33171)) (currentByte!2285 (_2!1386 lt!32403)) (currentBit!2280 (_2!1386 lt!32403))))))

(assert (=> d!7348 (isPrefixOf!0 (_2!1386 lt!32403) (_2!1386 lt!33171))))

(assert (=> d!7348 (= (reader!0 (_2!1386 lt!32403) (_2!1386 lt!33171)) lt!33449)))

(declare-fun b!22789 () Bool)

(declare-fun Unit!1965 () Unit!1930)

(assert (=> b!22789 (= e!15356 Unit!1965)))

(declare-fun lt!33460 () (_ BitVec 64))

(declare-fun b!22790 () Bool)

(declare-fun lt!33445 () (_ BitVec 64))

(assert (=> b!22790 (= e!15357 (= (_1!1387 lt!33449) (withMovedBitIndex!0 (_2!1387 lt!33449) (bvsub lt!33460 lt!33445))))))

(assert (=> b!22790 (or (= (bvand lt!33460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!33445 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!33460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!33460 lt!33445) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!22790 (= lt!33445 (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!33171))) (currentByte!2285 (_2!1386 lt!33171)) (currentBit!2280 (_2!1386 lt!33171))))))

(assert (=> b!22790 (= lt!33460 (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!32403))) (currentByte!2285 (_2!1386 lt!32403)) (currentBit!2280 (_2!1386 lt!32403))))))

(declare-fun b!22791 () Bool)

(declare-fun res!19570 () Bool)

(assert (=> b!22791 (=> (not res!19570) (not e!15357))))

(assert (=> b!22791 (= res!19570 (isPrefixOf!0 (_2!1387 lt!33449) (_2!1386 lt!33171)))))

(declare-fun b!22792 () Bool)

(declare-fun lt!33458 () Unit!1930)

(assert (=> b!22792 (= e!15356 lt!33458)))

(declare-fun lt!33454 () (_ BitVec 64))

(assert (=> b!22792 (= lt!33454 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!33455 () (_ BitVec 64))

(assert (=> b!22792 (= lt!33455 (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!32403))) (currentByte!2285 (_2!1386 lt!32403)) (currentBit!2280 (_2!1386 lt!32403))))))

(assert (=> b!22792 (= lt!33458 (arrayBitRangesEqSymmetric!0 (buf!978 (_2!1386 lt!32403)) (buf!978 (_2!1386 lt!33171)) lt!33454 lt!33455))))

(assert (=> b!22792 (arrayBitRangesEq!0 (buf!978 (_2!1386 lt!33171)) (buf!978 (_2!1386 lt!32403)) lt!33454 lt!33455)))

(assert (= (and d!7348 c!1661) b!22792))

(assert (= (and d!7348 (not c!1661)) b!22789))

(assert (= (and d!7348 res!19571) b!22788))

(assert (= (and b!22788 res!19569) b!22791))

(assert (= (and b!22791 res!19570) b!22790))

(assert (=> b!22792 m!31133))

(declare-fun m!31989 () Bool)

(assert (=> b!22792 m!31989))

(declare-fun m!31991 () Bool)

(assert (=> b!22792 m!31991))

(declare-fun m!31993 () Bool)

(assert (=> b!22791 m!31993))

(declare-fun m!31995 () Bool)

(assert (=> b!22790 m!31995))

(assert (=> b!22790 m!31597))

(assert (=> b!22790 m!31133))

(declare-fun m!31997 () Bool)

(assert (=> b!22788 m!31997))

(declare-fun m!31999 () Bool)

(assert (=> d!7348 m!31999))

(declare-fun m!32001 () Bool)

(assert (=> d!7348 m!32001))

(assert (=> d!7348 m!31551))

(declare-fun m!32003 () Bool)

(assert (=> d!7348 m!32003))

(declare-fun m!32005 () Bool)

(assert (=> d!7348 m!32005))

(declare-fun m!32007 () Bool)

(assert (=> d!7348 m!32007))

(assert (=> d!7348 m!31217))

(assert (=> d!7348 m!31219))

(declare-fun m!32009 () Bool)

(assert (=> d!7348 m!32009))

(declare-fun m!32011 () Bool)

(assert (=> d!7348 m!32011))

(declare-fun m!32013 () Bool)

(assert (=> d!7348 m!32013))

(assert (=> b!22620 d!7348))

(declare-fun d!7350 () Bool)

(assert (=> d!7350 (= (remainingBits!0 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!32403)))) ((_ sign_extend 32) (currentByte!2285 (_2!1386 lt!32403))) ((_ sign_extend 32) (currentBit!2280 (_2!1386 lt!32403)))) (bvsub (bvmul ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!32403)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!2285 (_2!1386 lt!32403))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2280 (_2!1386 lt!32403))))))))

(assert (=> d!7120 d!7350))

(declare-fun b!22793 () Bool)

(declare-fun res!19576 () Bool)

(declare-fun e!15358 () Bool)

(assert (=> b!22793 (=> (not res!19576) (not e!15358))))

(declare-fun lt!33467 () (_ BitVec 64))

(declare-fun lt!33470 () tuple2!2624)

(assert (=> b!22793 (= res!19576 (= (bvadd lt!33467 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!660 (buf!978 (_2!1397 lt!33470))) (currentByte!2285 (_2!1397 lt!33470)) (currentBit!2280 (_2!1397 lt!33470)))))))

(assert (=> b!22793 (or (not (= (bvand lt!33467 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!33467 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!33467 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!22793 (= lt!33467 (bitIndex!0 (size!660 (buf!978 lt!32535)) (currentByte!2285 lt!32535) (currentBit!2280 lt!32535)))))

(declare-fun d!7352 () Bool)

(assert (=> d!7352 e!15358))

(declare-fun res!19573 () Bool)

(assert (=> d!7352 (=> (not res!19573) (not e!15358))))

(assert (=> d!7352 (= res!19573 (= (buf!978 (_2!1397 lt!33470)) (buf!978 lt!32535)))))

(declare-fun lt!33469 () tuple3!158)

(assert (=> d!7352 (= lt!33470 (tuple2!2625 (_3!86 lt!33469) (_2!1401 lt!33469)))))

(assert (=> d!7352 (= lt!33469 (readBitsLoop!0 lt!32535 #b0000000000000000000000000000000000000000000000000000000000000001 (array!1549 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!7352 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!7352 (= (readBits!0 lt!32535 #b0000000000000000000000000000000000000000000000000000000000000001) lt!33470)))

(declare-fun b!22794 () Bool)

(declare-fun res!19572 () Bool)

(assert (=> b!22794 (=> (not res!19572) (not e!15358))))

(assert (=> b!22794 (= res!19572 (bvsle (currentByte!2285 lt!32535) (currentByte!2285 (_2!1397 lt!33470))))))

(declare-fun b!22795 () Bool)

(assert (=> b!22795 (= e!15358 (= (byteArrayBitContentToList!0 (_2!1397 lt!33470) (_1!1397 lt!33470) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bitStreamReadBitsIntoList!0 (_2!1397 lt!33470) lt!32535 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!22796 () Bool)

(declare-fun res!19575 () Bool)

(assert (=> b!22796 (=> (not res!19575) (not e!15358))))

(declare-fun lt!33463 () (_ BitVec 64))

(assert (=> b!22796 (= res!19575 (= (size!660 (_1!1397 lt!33470)) ((_ extract 31 0) lt!33463)))))

(assert (=> b!22796 (and (bvslt lt!33463 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!33463 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!33468 () (_ BitVec 64))

(declare-fun lt!33466 () (_ BitVec 64))

(assert (=> b!22796 (= lt!33463 (bvsdiv lt!33468 lt!33466))))

(assert (=> b!22796 (and (not (= lt!33466 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!33468 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!33466 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!22796 (= lt!33466 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!33464 () (_ BitVec 64))

(declare-fun lt!33465 () (_ BitVec 64))

(assert (=> b!22796 (= lt!33468 (bvsub lt!33464 lt!33465))))

(assert (=> b!22796 (or (= (bvand lt!33464 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!33465 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!33464 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!33464 lt!33465) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!22796 (= lt!33465 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!33471 () (_ BitVec 64))

(assert (=> b!22796 (= lt!33464 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!33471))))

(assert (=> b!22796 (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!33471 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!33471) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!22796 (= lt!33471 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!22797 () Bool)

(declare-fun res!19574 () Bool)

(assert (=> b!22797 (=> (not res!19574) (not e!15358))))

(assert (=> b!22797 (= res!19574 (invariant!0 (currentBit!2280 (_2!1397 lt!33470)) (currentByte!2285 (_2!1397 lt!33470)) (size!660 (buf!978 (_2!1397 lt!33470)))))))

(assert (= (and d!7352 res!19573) b!22793))

(assert (= (and b!22793 res!19576) b!22797))

(assert (= (and b!22797 res!19574) b!22796))

(assert (= (and b!22796 res!19575) b!22794))

(assert (= (and b!22794 res!19572) b!22795))

(declare-fun m!32015 () Bool)

(assert (=> b!22793 m!32015))

(declare-fun m!32017 () Bool)

(assert (=> b!22793 m!32017))

(declare-fun m!32019 () Bool)

(assert (=> d!7352 m!32019))

(declare-fun m!32021 () Bool)

(assert (=> b!22795 m!32021))

(declare-fun m!32023 () Bool)

(assert (=> b!22795 m!32023))

(declare-fun m!32025 () Bool)

(assert (=> b!22797 m!32025))

(assert (=> b!22413 d!7352))

(declare-fun d!7354 () Bool)

(declare-fun lt!33474 () tuple2!2628)

(assert (=> d!7354 (= lt!33474 (readBit!0 lt!32535))))

(assert (=> d!7354 (= (readBitPure!0 lt!32535) (tuple2!2623 (_2!1399 lt!33474) (_1!1399 lt!33474)))))

(declare-fun bs!2104 () Bool)

(assert (= bs!2104 d!7354))

(declare-fun m!32027 () Bool)

(assert (=> bs!2104 m!32027))

(assert (=> b!22413 d!7354))

(declare-fun d!7356 () Bool)

(declare-fun e!15361 () Bool)

(assert (=> d!7356 e!15361))

(declare-fun res!19580 () Bool)

(assert (=> d!7356 (=> (not res!19580) (not e!15361))))

(assert (=> d!7356 (= res!19580 (invariant!0 (currentBit!2280 (_2!1386 lt!32540)) (currentByte!2285 (_2!1386 lt!32540)) (size!660 (buf!978 (_2!1386 lt!32540)))))))

(assert (=> d!7356 (= (readerFrom!0 (_2!1386 lt!32540) (currentBit!2280 thiss!1379) (currentByte!2285 thiss!1379)) (BitStream!1155 (buf!978 (_2!1386 lt!32540)) (currentByte!2285 thiss!1379) (currentBit!2280 thiss!1379)))))

(declare-fun b!22800 () Bool)

(assert (=> b!22800 (= e!15361 (invariant!0 (currentBit!2280 thiss!1379) (currentByte!2285 thiss!1379) (size!660 (buf!978 (_2!1386 lt!32540)))))))

(assert (= (and d!7356 res!19580) b!22800))

(assert (=> d!7356 m!31701))

(declare-fun m!32029 () Bool)

(assert (=> b!22800 m!32029))

(assert (=> b!22413 d!7356))

(declare-fun d!7358 () Bool)

(declare-fun e!15362 () Bool)

(assert (=> d!7358 e!15362))

(declare-fun res!19581 () Bool)

(assert (=> d!7358 (=> (not res!19581) (not e!15362))))

(declare-fun lt!33477 () (_ BitVec 64))

(declare-fun lt!33480 () (_ BitVec 64))

(declare-fun lt!33475 () (_ BitVec 64))

(assert (=> d!7358 (= res!19581 (= lt!33475 (bvsub lt!33480 lt!33477)))))

(assert (=> d!7358 (or (= (bvand lt!33480 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!33477 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!33480 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!33480 lt!33477) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!7358 (= lt!33477 (remainingBits!0 ((_ sign_extend 32) (size!660 (buf!978 (_1!1396 lt!32537)))) ((_ sign_extend 32) (currentByte!2285 (_1!1396 lt!32537))) ((_ sign_extend 32) (currentBit!2280 (_1!1396 lt!32537)))))))

(declare-fun lt!33478 () (_ BitVec 64))

(declare-fun lt!33476 () (_ BitVec 64))

(assert (=> d!7358 (= lt!33480 (bvmul lt!33478 lt!33476))))

(assert (=> d!7358 (or (= lt!33478 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!33476 (bvsdiv (bvmul lt!33478 lt!33476) lt!33478)))))

(assert (=> d!7358 (= lt!33476 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!7358 (= lt!33478 ((_ sign_extend 32) (size!660 (buf!978 (_1!1396 lt!32537)))))))

(assert (=> d!7358 (= lt!33475 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2285 (_1!1396 lt!32537))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2280 (_1!1396 lt!32537)))))))

(assert (=> d!7358 (invariant!0 (currentBit!2280 (_1!1396 lt!32537)) (currentByte!2285 (_1!1396 lt!32537)) (size!660 (buf!978 (_1!1396 lt!32537))))))

(assert (=> d!7358 (= (bitIndex!0 (size!660 (buf!978 (_1!1396 lt!32537))) (currentByte!2285 (_1!1396 lt!32537)) (currentBit!2280 (_1!1396 lt!32537))) lt!33475)))

(declare-fun b!22801 () Bool)

(declare-fun res!19582 () Bool)

(assert (=> b!22801 (=> (not res!19582) (not e!15362))))

(assert (=> b!22801 (= res!19582 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!33475))))

(declare-fun b!22802 () Bool)

(declare-fun lt!33479 () (_ BitVec 64))

(assert (=> b!22802 (= e!15362 (bvsle lt!33475 (bvmul lt!33479 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!22802 (or (= lt!33479 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!33479 #b0000000000000000000000000000000000000000000000000000000000001000) lt!33479)))))

(assert (=> b!22802 (= lt!33479 ((_ sign_extend 32) (size!660 (buf!978 (_1!1396 lt!32537)))))))

(assert (= (and d!7358 res!19581) b!22801))

(assert (= (and b!22801 res!19582) b!22802))

(declare-fun m!32031 () Bool)

(assert (=> d!7358 m!32031))

(declare-fun m!32033 () Bool)

(assert (=> d!7358 m!32033))

(assert (=> b!22412 d!7358))

(declare-fun d!7360 () Bool)

(declare-fun e!15363 () Bool)

(assert (=> d!7360 e!15363))

(declare-fun res!19583 () Bool)

(assert (=> d!7360 (=> (not res!19583) (not e!15363))))

(declare-fun lt!33486 () (_ BitVec 64))

(declare-fun lt!33483 () (_ BitVec 64))

(declare-fun lt!33481 () (_ BitVec 64))

(assert (=> d!7360 (= res!19583 (= lt!33481 (bvsub lt!33486 lt!33483)))))

(assert (=> d!7360 (or (= (bvand lt!33486 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!33483 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!33486 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!33486 lt!33483) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!7360 (= lt!33483 (remainingBits!0 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!32545)))) ((_ sign_extend 32) (currentByte!2285 (_2!1386 lt!32545))) ((_ sign_extend 32) (currentBit!2280 (_2!1386 lt!32545)))))))

(declare-fun lt!33484 () (_ BitVec 64))

(declare-fun lt!33482 () (_ BitVec 64))

(assert (=> d!7360 (= lt!33486 (bvmul lt!33484 lt!33482))))

(assert (=> d!7360 (or (= lt!33484 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!33482 (bvsdiv (bvmul lt!33484 lt!33482) lt!33484)))))

(assert (=> d!7360 (= lt!33482 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!7360 (= lt!33484 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!32545)))))))

(assert (=> d!7360 (= lt!33481 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2285 (_2!1386 lt!32545))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2280 (_2!1386 lt!32545)))))))

(assert (=> d!7360 (invariant!0 (currentBit!2280 (_2!1386 lt!32545)) (currentByte!2285 (_2!1386 lt!32545)) (size!660 (buf!978 (_2!1386 lt!32545))))))

(assert (=> d!7360 (= (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!32545))) (currentByte!2285 (_2!1386 lt!32545)) (currentBit!2280 (_2!1386 lt!32545))) lt!33481)))

(declare-fun b!22803 () Bool)

(declare-fun res!19584 () Bool)

(assert (=> b!22803 (=> (not res!19584) (not e!15363))))

(assert (=> b!22803 (= res!19584 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!33481))))

(declare-fun b!22804 () Bool)

(declare-fun lt!33485 () (_ BitVec 64))

(assert (=> b!22804 (= e!15363 (bvsle lt!33481 (bvmul lt!33485 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!22804 (or (= lt!33485 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!33485 #b0000000000000000000000000000000000000000000000000000000000001000) lt!33485)))))

(assert (=> b!22804 (= lt!33485 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!32545)))))))

(assert (= (and d!7360 res!19583) b!22803))

(assert (= (and b!22803 res!19584) b!22804))

(declare-fun m!32035 () Bool)

(assert (=> d!7360 m!32035))

(declare-fun m!32037 () Bool)

(assert (=> d!7360 m!32037))

(assert (=> b!22412 d!7360))

(declare-fun d!7362 () Bool)

(declare-fun lt!33487 () tuple2!2628)

(assert (=> d!7362 (= lt!33487 (readBit!0 (readerFrom!0 (_2!1386 lt!32545) (currentBit!2280 thiss!1379) (currentByte!2285 thiss!1379))))))

(assert (=> d!7362 (= (readBitPure!0 (readerFrom!0 (_2!1386 lt!32545) (currentBit!2280 thiss!1379) (currentByte!2285 thiss!1379))) (tuple2!2623 (_2!1399 lt!33487) (_1!1399 lt!33487)))))

(declare-fun bs!2105 () Bool)

(assert (= bs!2105 d!7362))

(assert (=> bs!2105 m!31191))

(declare-fun m!32039 () Bool)

(assert (=> bs!2105 m!32039))

(assert (=> b!22414 d!7362))

(declare-fun d!7364 () Bool)

(declare-fun e!15364 () Bool)

(assert (=> d!7364 e!15364))

(declare-fun res!19585 () Bool)

(assert (=> d!7364 (=> (not res!19585) (not e!15364))))

(assert (=> d!7364 (= res!19585 (invariant!0 (currentBit!2280 (_2!1386 lt!32545)) (currentByte!2285 (_2!1386 lt!32545)) (size!660 (buf!978 (_2!1386 lt!32545)))))))

(assert (=> d!7364 (= (readerFrom!0 (_2!1386 lt!32545) (currentBit!2280 thiss!1379) (currentByte!2285 thiss!1379)) (BitStream!1155 (buf!978 (_2!1386 lt!32545)) (currentByte!2285 thiss!1379) (currentBit!2280 thiss!1379)))))

(declare-fun b!22805 () Bool)

(assert (=> b!22805 (= e!15364 (invariant!0 (currentBit!2280 thiss!1379) (currentByte!2285 thiss!1379) (size!660 (buf!978 (_2!1386 lt!32545)))))))

(assert (= (and d!7364 res!19585) b!22805))

(assert (=> d!7364 m!32037))

(declare-fun m!32041 () Bool)

(assert (=> b!22805 m!32041))

(assert (=> b!22414 d!7364))

(assert (=> d!7130 d!7128))

(declare-fun d!7366 () Bool)

(assert (=> d!7366 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!7366 true))

(declare-fun _$14!226 () Unit!1930)

(assert (=> d!7366 (= (choose!11 thiss!1379) _$14!226)))

(declare-fun bs!2107 () Bool)

(assert (= bs!2107 d!7366))

(assert (=> bs!2107 m!31075))

(assert (=> d!7130 d!7366))

(declare-fun b!22806 () Bool)

(declare-fun res!19590 () Bool)

(declare-fun lt!33489 () (_ BitVec 32))

(assert (=> b!22806 (= res!19590 (= lt!33489 #b00000000000000000000000000000000))))

(declare-fun e!15365 () Bool)

(assert (=> b!22806 (=> res!19590 e!15365)))

(declare-fun e!15369 () Bool)

(assert (=> b!22806 (= e!15369 e!15365)))

(declare-fun b!22807 () Bool)

(declare-fun e!15368 () Bool)

(declare-fun e!15370 () Bool)

(assert (=> b!22807 (= e!15368 e!15370)))

(declare-fun res!19586 () Bool)

(assert (=> b!22807 (=> (not res!19586) (not e!15370))))

(declare-fun e!15367 () Bool)

(assert (=> b!22807 (= res!19586 e!15367)))

(declare-fun res!19587 () Bool)

(assert (=> b!22807 (=> res!19587 e!15367)))

(declare-fun lt!33490 () tuple4!12)

(assert (=> b!22807 (= res!19587 (bvsge (_1!1400 lt!33490) (_2!1400 lt!33490)))))

(assert (=> b!22807 (= lt!33489 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!32403))) (currentByte!2285 (_2!1386 lt!32403)) (currentBit!2280 (_2!1386 lt!32403))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!33488 () (_ BitVec 32))

(assert (=> b!22807 (= lt!33488 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!22807 (= lt!33490 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!32403))) (currentByte!2285 (_2!1386 lt!32403)) (currentBit!2280 (_2!1386 lt!32403)))))))

(declare-fun b!22808 () Bool)

(declare-fun e!15366 () Bool)

(assert (=> b!22808 (= e!15366 e!15369)))

(declare-fun res!19588 () Bool)

(assert (=> b!22808 (= res!19588 (byteRangesEq!0 (select (arr!1113 (buf!978 (_2!1386 lt!32403))) (_3!85 lt!33490)) (select (arr!1113 (buf!978 (_2!1386 lt!32399))) (_3!85 lt!33490)) lt!33488 #b00000000000000000000000000001000))))

(assert (=> b!22808 (=> (not res!19588) (not e!15369))))

(declare-fun b!22809 () Bool)

(declare-fun call!335 () Bool)

(assert (=> b!22809 (= e!15365 call!335)))

(declare-fun bm!332 () Bool)

(declare-fun c!1662 () Bool)

(assert (=> bm!332 (= call!335 (byteRangesEq!0 (ite c!1662 (select (arr!1113 (buf!978 (_2!1386 lt!32403))) (_3!85 lt!33490)) (select (arr!1113 (buf!978 (_2!1386 lt!32403))) (_4!6 lt!33490))) (ite c!1662 (select (arr!1113 (buf!978 (_2!1386 lt!32399))) (_3!85 lt!33490)) (select (arr!1113 (buf!978 (_2!1386 lt!32399))) (_4!6 lt!33490))) (ite c!1662 lt!33488 #b00000000000000000000000000000000) lt!33489))))

(declare-fun b!22810 () Bool)

(assert (=> b!22810 (= e!15370 e!15366)))

(assert (=> b!22810 (= c!1662 (= (_3!85 lt!33490) (_4!6 lt!33490)))))

(declare-fun b!22811 () Bool)

(assert (=> b!22811 (= e!15367 (arrayRangesEq!7 (buf!978 (_2!1386 lt!32403)) (buf!978 (_2!1386 lt!32399)) (_1!1400 lt!33490) (_2!1400 lt!33490)))))

(declare-fun b!22812 () Bool)

(assert (=> b!22812 (= e!15366 call!335)))

(declare-fun d!7368 () Bool)

(declare-fun res!19589 () Bool)

(assert (=> d!7368 (=> res!19589 e!15368)))

(assert (=> d!7368 (= res!19589 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!32403))) (currentByte!2285 (_2!1386 lt!32403)) (currentBit!2280 (_2!1386 lt!32403)))))))

(assert (=> d!7368 (= (arrayBitRangesEq!0 (buf!978 (_2!1386 lt!32403)) (buf!978 (_2!1386 lt!32399)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!32403))) (currentByte!2285 (_2!1386 lt!32403)) (currentBit!2280 (_2!1386 lt!32403)))) e!15368)))

(assert (= (and d!7368 (not res!19589)) b!22807))

(assert (= (and b!22807 (not res!19587)) b!22811))

(assert (= (and b!22807 res!19586) b!22810))

(assert (= (and b!22810 c!1662) b!22812))

(assert (= (and b!22810 (not c!1662)) b!22808))

(assert (= (and b!22808 res!19588) b!22806))

(assert (= (and b!22806 (not res!19590)) b!22809))

(assert (= (or b!22812 b!22809) bm!332))

(assert (=> b!22807 m!31133))

(declare-fun m!32043 () Bool)

(assert (=> b!22807 m!32043))

(declare-fun m!32045 () Bool)

(assert (=> b!22808 m!32045))

(declare-fun m!32047 () Bool)

(assert (=> b!22808 m!32047))

(assert (=> b!22808 m!32045))

(assert (=> b!22808 m!32047))

(declare-fun m!32049 () Bool)

(assert (=> b!22808 m!32049))

(assert (=> bm!332 m!32045))

(assert (=> bm!332 m!32047))

(declare-fun m!32051 () Bool)

(assert (=> bm!332 m!32051))

(declare-fun m!32053 () Bool)

(assert (=> bm!332 m!32053))

(declare-fun m!32055 () Bool)

(assert (=> bm!332 m!32055))

(declare-fun m!32057 () Bool)

(assert (=> b!22811 m!32057))

(assert (=> b!22623 d!7368))

(assert (=> b!22623 d!7228))

(assert (=> d!7224 d!7272))

(declare-fun d!7370 () Bool)

(declare-fun res!19593 () Bool)

(declare-fun e!15372 () Bool)

(assert (=> d!7370 (=> (not res!19593) (not e!15372))))

(assert (=> d!7370 (= res!19593 (= (size!660 (buf!978 (_1!1387 lt!32613))) (size!660 (buf!978 thiss!1379))))))

(assert (=> d!7370 (= (isPrefixOf!0 (_1!1387 lt!32613) thiss!1379) e!15372)))

(declare-fun b!22813 () Bool)

(declare-fun res!19591 () Bool)

(assert (=> b!22813 (=> (not res!19591) (not e!15372))))

(assert (=> b!22813 (= res!19591 (bvsle (bitIndex!0 (size!660 (buf!978 (_1!1387 lt!32613))) (currentByte!2285 (_1!1387 lt!32613)) (currentBit!2280 (_1!1387 lt!32613))) (bitIndex!0 (size!660 (buf!978 thiss!1379)) (currentByte!2285 thiss!1379) (currentBit!2280 thiss!1379))))))

(declare-fun b!22814 () Bool)

(declare-fun e!15371 () Bool)

(assert (=> b!22814 (= e!15372 e!15371)))

(declare-fun res!19592 () Bool)

(assert (=> b!22814 (=> res!19592 e!15371)))

(assert (=> b!22814 (= res!19592 (= (size!660 (buf!978 (_1!1387 lt!32613))) #b00000000000000000000000000000000))))

(declare-fun b!22815 () Bool)

(assert (=> b!22815 (= e!15371 (arrayBitRangesEq!0 (buf!978 (_1!1387 lt!32613)) (buf!978 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!660 (buf!978 (_1!1387 lt!32613))) (currentByte!2285 (_1!1387 lt!32613)) (currentBit!2280 (_1!1387 lt!32613)))))))

(assert (= (and d!7370 res!19593) b!22813))

(assert (= (and b!22813 res!19591) b!22814))

(assert (= (and b!22814 (not res!19592)) b!22815))

(assert (=> b!22813 m!31757))

(assert (=> b!22813 m!31079))

(assert (=> b!22815 m!31757))

(assert (=> b!22815 m!31757))

(declare-fun m!32059 () Bool)

(assert (=> b!22815 m!32059))

(assert (=> b!22435 d!7370))

(assert (=> b!22410 d!7360))

(assert (=> b!22410 d!7132))

(declare-fun b!22816 () Bool)

(declare-fun res!19598 () Bool)

(declare-fun lt!33492 () (_ BitVec 32))

(assert (=> b!22816 (= res!19598 (= lt!33492 #b00000000000000000000000000000000))))

(declare-fun e!15373 () Bool)

(assert (=> b!22816 (=> res!19598 e!15373)))

(declare-fun e!15377 () Bool)

(assert (=> b!22816 (= e!15377 e!15373)))

(declare-fun b!22817 () Bool)

(declare-fun e!15376 () Bool)

(declare-fun e!15378 () Bool)

(assert (=> b!22817 (= e!15376 e!15378)))

(declare-fun res!19594 () Bool)

(assert (=> b!22817 (=> (not res!19594) (not e!15378))))

(declare-fun e!15375 () Bool)

(assert (=> b!22817 (= res!19594 e!15375)))

(declare-fun res!19595 () Bool)

(assert (=> b!22817 (=> res!19595 e!15375)))

(declare-fun lt!33493 () tuple4!12)

(assert (=> b!22817 (= res!19595 (bvsge (_1!1400 lt!33493) (_2!1400 lt!33493)))))

(assert (=> b!22817 (= lt!33492 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!660 (buf!978 thiss!1379)) (currentByte!2285 thiss!1379) (currentBit!2280 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!33491 () (_ BitVec 32))

(assert (=> b!22817 (= lt!33491 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!22817 (= lt!33493 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!660 (buf!978 thiss!1379)) (currentByte!2285 thiss!1379) (currentBit!2280 thiss!1379))))))

(declare-fun b!22818 () Bool)

(declare-fun e!15374 () Bool)

(assert (=> b!22818 (= e!15374 e!15377)))

(declare-fun res!19596 () Bool)

(assert (=> b!22818 (= res!19596 (byteRangesEq!0 (select (arr!1113 (buf!978 thiss!1379)) (_3!85 lt!33493)) (select (arr!1113 (buf!978 thiss!1379)) (_3!85 lt!33493)) lt!33491 #b00000000000000000000000000001000))))

(assert (=> b!22818 (=> (not res!19596) (not e!15377))))

(declare-fun b!22819 () Bool)

(declare-fun call!336 () Bool)

(assert (=> b!22819 (= e!15373 call!336)))

(declare-fun bm!333 () Bool)

(declare-fun c!1663 () Bool)

(assert (=> bm!333 (= call!336 (byteRangesEq!0 (ite c!1663 (select (arr!1113 (buf!978 thiss!1379)) (_3!85 lt!33493)) (select (arr!1113 (buf!978 thiss!1379)) (_4!6 lt!33493))) (ite c!1663 (select (arr!1113 (buf!978 thiss!1379)) (_3!85 lt!33493)) (select (arr!1113 (buf!978 thiss!1379)) (_4!6 lt!33493))) (ite c!1663 lt!33491 #b00000000000000000000000000000000) lt!33492))))

(declare-fun b!22820 () Bool)

(assert (=> b!22820 (= e!15378 e!15374)))

(assert (=> b!22820 (= c!1663 (= (_3!85 lt!33493) (_4!6 lt!33493)))))

(declare-fun b!22821 () Bool)

(assert (=> b!22821 (= e!15375 (arrayRangesEq!7 (buf!978 thiss!1379) (buf!978 thiss!1379) (_1!1400 lt!33493) (_2!1400 lt!33493)))))

(declare-fun b!22822 () Bool)

(assert (=> b!22822 (= e!15374 call!336)))

(declare-fun d!7372 () Bool)

(declare-fun res!19597 () Bool)

(assert (=> d!7372 (=> res!19597 e!15376)))

(assert (=> d!7372 (= res!19597 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!660 (buf!978 thiss!1379)) (currentByte!2285 thiss!1379) (currentBit!2280 thiss!1379))))))

(assert (=> d!7372 (= (arrayBitRangesEq!0 (buf!978 thiss!1379) (buf!978 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!660 (buf!978 thiss!1379)) (currentByte!2285 thiss!1379) (currentBit!2280 thiss!1379))) e!15376)))

(assert (= (and d!7372 (not res!19597)) b!22817))

(assert (= (and b!22817 (not res!19595)) b!22821))

(assert (= (and b!22817 res!19594) b!22820))

(assert (= (and b!22820 c!1663) b!22822))

(assert (= (and b!22820 (not c!1663)) b!22818))

(assert (= (and b!22818 res!19596) b!22816))

(assert (= (and b!22816 (not res!19598)) b!22819))

(assert (= (or b!22822 b!22819) bm!333))

(assert (=> b!22817 m!31079))

(assert (=> b!22817 m!31707))

(declare-fun m!32061 () Bool)

(assert (=> b!22818 m!32061))

(assert (=> b!22818 m!32061))

(assert (=> b!22818 m!32061))

(assert (=> b!22818 m!32061))

(declare-fun m!32063 () Bool)

(assert (=> b!22818 m!32063))

(assert (=> bm!333 m!32061))

(assert (=> bm!333 m!32061))

(declare-fun m!32065 () Bool)

(assert (=> bm!333 m!32065))

(declare-fun m!32067 () Bool)

(assert (=> bm!333 m!32067))

(assert (=> bm!333 m!32067))

(declare-fun m!32069 () Bool)

(assert (=> b!22821 m!32069))

(assert (=> b!22418 d!7372))

(assert (=> b!22418 d!7132))

(declare-fun d!7374 () Bool)

(declare-fun e!15379 () Bool)

(assert (=> d!7374 e!15379))

(declare-fun res!19599 () Bool)

(assert (=> d!7374 (=> (not res!19599) (not e!15379))))

(declare-fun lt!33496 () (_ BitVec 64))

(declare-fun lt!33494 () (_ BitVec 64))

(declare-fun lt!33499 () (_ BitVec 64))

(assert (=> d!7374 (= res!19599 (= lt!33494 (bvsub lt!33499 lt!33496)))))

(assert (=> d!7374 (or (= (bvand lt!33499 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!33496 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!33499 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!33499 lt!33496) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!7374 (= lt!33496 (remainingBits!0 ((_ sign_extend 32) (size!660 (buf!978 (_1!1396 lt!32543)))) ((_ sign_extend 32) (currentByte!2285 (_1!1396 lt!32543))) ((_ sign_extend 32) (currentBit!2280 (_1!1396 lt!32543)))))))

(declare-fun lt!33497 () (_ BitVec 64))

(declare-fun lt!33495 () (_ BitVec 64))

(assert (=> d!7374 (= lt!33499 (bvmul lt!33497 lt!33495))))

(assert (=> d!7374 (or (= lt!33497 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!33495 (bvsdiv (bvmul lt!33497 lt!33495) lt!33497)))))

(assert (=> d!7374 (= lt!33495 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!7374 (= lt!33497 ((_ sign_extend 32) (size!660 (buf!978 (_1!1396 lt!32543)))))))

(assert (=> d!7374 (= lt!33494 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2285 (_1!1396 lt!32543))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2280 (_1!1396 lt!32543)))))))

(assert (=> d!7374 (invariant!0 (currentBit!2280 (_1!1396 lt!32543)) (currentByte!2285 (_1!1396 lt!32543)) (size!660 (buf!978 (_1!1396 lt!32543))))))

(assert (=> d!7374 (= (bitIndex!0 (size!660 (buf!978 (_1!1396 lt!32543))) (currentByte!2285 (_1!1396 lt!32543)) (currentBit!2280 (_1!1396 lt!32543))) lt!33494)))

(declare-fun b!22823 () Bool)

(declare-fun res!19600 () Bool)

(assert (=> b!22823 (=> (not res!19600) (not e!15379))))

(assert (=> b!22823 (= res!19600 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!33494))))

(declare-fun b!22824 () Bool)

(declare-fun lt!33498 () (_ BitVec 64))

(assert (=> b!22824 (= e!15379 (bvsle lt!33494 (bvmul lt!33498 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!22824 (or (= lt!33498 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!33498 #b0000000000000000000000000000000000000000000000000000000000001000) lt!33498)))))

(assert (=> b!22824 (= lt!33498 ((_ sign_extend 32) (size!660 (buf!978 (_1!1396 lt!32543)))))))

(assert (= (and d!7374 res!19599) b!22823))

(assert (= (and b!22823 res!19600) b!22824))

(declare-fun m!32071 () Bool)

(assert (=> d!7374 m!32071))

(declare-fun m!32073 () Bool)

(assert (=> d!7374 m!32073))

(assert (=> b!22411 d!7374))

(assert (=> b!22411 d!7256))

(assert (=> b!22621 d!7228))

(assert (=> b!22621 d!7226))

(assert (=> b!22439 d!7132))

(declare-fun d!7376 () Bool)

(assert (=> d!7376 (arrayBitRangesEq!0 (buf!978 (_2!1386 lt!32403)) (buf!978 thiss!1379) lt!32618 lt!32619)))

(declare-fun lt!33502 () Unit!1930)

(declare-fun choose!8 (array!1548 array!1548 (_ BitVec 64) (_ BitVec 64)) Unit!1930)

(assert (=> d!7376 (= lt!33502 (choose!8 (buf!978 thiss!1379) (buf!978 (_2!1386 lt!32403)) lt!32618 lt!32619))))

(assert (=> d!7376 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!32618) (bvsle lt!32618 lt!32619))))

(assert (=> d!7376 (= (arrayBitRangesEqSymmetric!0 (buf!978 thiss!1379) (buf!978 (_2!1386 lt!32403)) lt!32618 lt!32619) lt!33502)))

(declare-fun bs!2108 () Bool)

(assert (= bs!2108 d!7376))

(assert (=> bs!2108 m!31205))

(declare-fun m!32075 () Bool)

(assert (=> bs!2108 m!32075))

(assert (=> b!22439 d!7376))

(declare-fun b!22825 () Bool)

(declare-fun res!19605 () Bool)

(declare-fun lt!33504 () (_ BitVec 32))

(assert (=> b!22825 (= res!19605 (= lt!33504 #b00000000000000000000000000000000))))

(declare-fun e!15380 () Bool)

(assert (=> b!22825 (=> res!19605 e!15380)))

(declare-fun e!15384 () Bool)

(assert (=> b!22825 (= e!15384 e!15380)))

(declare-fun b!22826 () Bool)

(declare-fun e!15383 () Bool)

(declare-fun e!15385 () Bool)

(assert (=> b!22826 (= e!15383 e!15385)))

(declare-fun res!19601 () Bool)

(assert (=> b!22826 (=> (not res!19601) (not e!15385))))

(declare-fun e!15382 () Bool)

(assert (=> b!22826 (= res!19601 e!15382)))

(declare-fun res!19602 () Bool)

(assert (=> b!22826 (=> res!19602 e!15382)))

(declare-fun lt!33505 () tuple4!12)

(assert (=> b!22826 (= res!19602 (bvsge (_1!1400 lt!33505) (_2!1400 lt!33505)))))

(assert (=> b!22826 (= lt!33504 ((_ extract 31 0) (bvsrem lt!32619 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!33503 () (_ BitVec 32))

(assert (=> b!22826 (= lt!33503 ((_ extract 31 0) (bvsrem lt!32618 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!22826 (= lt!33505 (arrayBitIndices!0 lt!32618 lt!32619))))

(declare-fun b!22827 () Bool)

(declare-fun e!15381 () Bool)

(assert (=> b!22827 (= e!15381 e!15384)))

(declare-fun res!19603 () Bool)

(assert (=> b!22827 (= res!19603 (byteRangesEq!0 (select (arr!1113 (buf!978 (_2!1386 lt!32403))) (_3!85 lt!33505)) (select (arr!1113 (buf!978 thiss!1379)) (_3!85 lt!33505)) lt!33503 #b00000000000000000000000000001000))))

(assert (=> b!22827 (=> (not res!19603) (not e!15384))))

(declare-fun b!22828 () Bool)

(declare-fun call!337 () Bool)

(assert (=> b!22828 (= e!15380 call!337)))

(declare-fun bm!334 () Bool)

(declare-fun c!1664 () Bool)

(assert (=> bm!334 (= call!337 (byteRangesEq!0 (ite c!1664 (select (arr!1113 (buf!978 (_2!1386 lt!32403))) (_3!85 lt!33505)) (select (arr!1113 (buf!978 (_2!1386 lt!32403))) (_4!6 lt!33505))) (ite c!1664 (select (arr!1113 (buf!978 thiss!1379)) (_3!85 lt!33505)) (select (arr!1113 (buf!978 thiss!1379)) (_4!6 lt!33505))) (ite c!1664 lt!33503 #b00000000000000000000000000000000) lt!33504))))

(declare-fun b!22829 () Bool)

(assert (=> b!22829 (= e!15385 e!15381)))

(assert (=> b!22829 (= c!1664 (= (_3!85 lt!33505) (_4!6 lt!33505)))))

(declare-fun b!22830 () Bool)

(assert (=> b!22830 (= e!15382 (arrayRangesEq!7 (buf!978 (_2!1386 lt!32403)) (buf!978 thiss!1379) (_1!1400 lt!33505) (_2!1400 lt!33505)))))

(declare-fun b!22831 () Bool)

(assert (=> b!22831 (= e!15381 call!337)))

(declare-fun d!7378 () Bool)

(declare-fun res!19604 () Bool)

(assert (=> d!7378 (=> res!19604 e!15383)))

(assert (=> d!7378 (= res!19604 (bvsge lt!32618 lt!32619))))

(assert (=> d!7378 (= (arrayBitRangesEq!0 (buf!978 (_2!1386 lt!32403)) (buf!978 thiss!1379) lt!32618 lt!32619) e!15383)))

(assert (= (and d!7378 (not res!19604)) b!22826))

(assert (= (and b!22826 (not res!19602)) b!22830))

(assert (= (and b!22826 res!19601) b!22829))

(assert (= (and b!22829 c!1664) b!22831))

(assert (= (and b!22829 (not c!1664)) b!22827))

(assert (= (and b!22827 res!19603) b!22825))

(assert (= (and b!22825 (not res!19605)) b!22828))

(assert (= (or b!22831 b!22828) bm!334))

(declare-fun m!32077 () Bool)

(assert (=> b!22826 m!32077))

(declare-fun m!32079 () Bool)

(assert (=> b!22827 m!32079))

(declare-fun m!32081 () Bool)

(assert (=> b!22827 m!32081))

(assert (=> b!22827 m!32079))

(assert (=> b!22827 m!32081))

(declare-fun m!32083 () Bool)

(assert (=> b!22827 m!32083))

(assert (=> bm!334 m!32079))

(assert (=> bm!334 m!32081))

(declare-fun m!32085 () Bool)

(assert (=> bm!334 m!32085))

(declare-fun m!32087 () Bool)

(assert (=> bm!334 m!32087))

(declare-fun m!32089 () Bool)

(assert (=> bm!334 m!32089))

(declare-fun m!32091 () Bool)

(assert (=> b!22830 m!32091))

(assert (=> b!22439 d!7378))

(assert (=> d!7140 d!7274))

(declare-fun b!22843 () Bool)

(declare-fun e!15390 () Bool)

(declare-fun e!15391 () Bool)

(assert (=> b!22843 (= e!15390 e!15391)))

(declare-fun res!19617 () Bool)

(assert (=> b!22843 (=> (not res!19617) (not e!15391))))

(declare-fun lt!33515 () tuple2!2622)

(declare-fun lt!33517 () tuple2!2602)

(assert (=> b!22843 (= res!19617 (and (= (_2!1396 lt!33515) lt!32542) (= (_1!1396 lt!33515) (_2!1386 lt!33517))))))

(assert (=> b!22843 (= lt!33515 (readBitPure!0 (readerFrom!0 (_2!1386 lt!33517) (currentBit!2280 thiss!1379) (currentByte!2285 thiss!1379))))))

(declare-fun b!22844 () Bool)

(assert (=> b!22844 (= e!15391 (= (bitIndex!0 (size!660 (buf!978 (_1!1396 lt!33515))) (currentByte!2285 (_1!1396 lt!33515)) (currentBit!2280 (_1!1396 lt!33515))) (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!33517))) (currentByte!2285 (_2!1386 lt!33517)) (currentBit!2280 (_2!1386 lt!33517)))))))

(declare-fun b!22842 () Bool)

(declare-fun res!19615 () Bool)

(assert (=> b!22842 (=> (not res!19615) (not e!15390))))

(assert (=> b!22842 (= res!19615 (isPrefixOf!0 thiss!1379 (_2!1386 lt!33517)))))

(declare-fun d!7380 () Bool)

(assert (=> d!7380 e!15390))

(declare-fun res!19614 () Bool)

(assert (=> d!7380 (=> (not res!19614) (not e!15390))))

(assert (=> d!7380 (= res!19614 (= (size!660 (buf!978 thiss!1379)) (size!660 (buf!978 (_2!1386 lt!33517)))))))

(declare-fun choose!16 (BitStream!1154 Bool) tuple2!2602)

(assert (=> d!7380 (= lt!33517 (choose!16 thiss!1379 lt!32542))))

(assert (=> d!7380 (validate_offset_bit!0 ((_ sign_extend 32) (size!660 (buf!978 thiss!1379))) ((_ sign_extend 32) (currentByte!2285 thiss!1379)) ((_ sign_extend 32) (currentBit!2280 thiss!1379)))))

(assert (=> d!7380 (= (appendBit!0 thiss!1379 lt!32542) lt!33517)))

(declare-fun b!22841 () Bool)

(declare-fun res!19616 () Bool)

(assert (=> b!22841 (=> (not res!19616) (not e!15390))))

(declare-fun lt!33514 () (_ BitVec 64))

(declare-fun lt!33516 () (_ BitVec 64))

(assert (=> b!22841 (= res!19616 (= (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!33517))) (currentByte!2285 (_2!1386 lt!33517)) (currentBit!2280 (_2!1386 lt!33517))) (bvadd lt!33514 lt!33516)))))

(assert (=> b!22841 (or (not (= (bvand lt!33514 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!33516 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!33514 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!33514 lt!33516) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!22841 (= lt!33516 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!22841 (= lt!33514 (bitIndex!0 (size!660 (buf!978 thiss!1379)) (currentByte!2285 thiss!1379) (currentBit!2280 thiss!1379)))))

(assert (= (and d!7380 res!19614) b!22841))

(assert (= (and b!22841 res!19616) b!22842))

(assert (= (and b!22842 res!19615) b!22843))

(assert (= (and b!22843 res!19617) b!22844))

(declare-fun m!32093 () Bool)

(assert (=> b!22843 m!32093))

(assert (=> b!22843 m!32093))

(declare-fun m!32095 () Bool)

(assert (=> b!22843 m!32095))

(declare-fun m!32097 () Bool)

(assert (=> b!22844 m!32097))

(declare-fun m!32099 () Bool)

(assert (=> b!22844 m!32099))

(declare-fun m!32101 () Bool)

(assert (=> b!22842 m!32101))

(assert (=> b!22841 m!32099))

(assert (=> b!22841 m!31079))

(declare-fun m!32103 () Bool)

(assert (=> d!7380 m!32103))

(declare-fun m!32105 () Bool)

(assert (=> d!7380 m!32105))

(assert (=> d!7126 d!7380))

(declare-fun b!22847 () Bool)

(declare-fun e!15393 () Bool)

(declare-fun lt!33518 () List!278)

(assert (=> b!22847 (= e!15393 (isEmpty!63 lt!33518))))

(declare-fun b!22845 () Bool)

(declare-fun e!15392 () tuple2!2626)

(assert (=> b!22845 (= e!15392 (tuple2!2627 Nil!275 (_1!1387 lt!33189)))))

(declare-fun lt!33520 () tuple2!2628)

(declare-fun lt!33519 () (_ BitVec 64))

(declare-fun b!22846 () Bool)

(assert (=> b!22846 (= e!15392 (tuple2!2627 (Cons!274 (_1!1399 lt!33520) (bitStreamReadBitsIntoList!0 (_2!1386 lt!33196) (_2!1399 lt!33520) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) lt!33519))) (_2!1399 lt!33520)))))

(assert (=> b!22846 (= lt!33520 (readBit!0 (_1!1387 lt!33189)))))

(assert (=> b!22846 (= lt!33519 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!7382 () Bool)

(assert (=> d!7382 e!15393))

(declare-fun c!1666 () Bool)

(assert (=> d!7382 (= c!1666 (= (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!7382 (= lt!33518 (_1!1398 e!15392))))

(declare-fun c!1665 () Bool)

(assert (=> d!7382 (= c!1665 (= (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!7382 (bvsge (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!7382 (= (bitStreamReadBitsIntoList!0 (_2!1386 lt!33196) (_1!1387 lt!33189) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) lt!33518)))

(declare-fun b!22848 () Bool)

(assert (=> b!22848 (= e!15393 (> (length!58 lt!33518) 0))))

(assert (= (and d!7382 c!1665) b!22845))

(assert (= (and d!7382 (not c!1665)) b!22846))

(assert (= (and d!7382 c!1666) b!22847))

(assert (= (and d!7382 (not c!1666)) b!22848))

(declare-fun m!32107 () Bool)

(assert (=> b!22847 m!32107))

(declare-fun m!32109 () Bool)

(assert (=> b!22846 m!32109))

(declare-fun m!32111 () Bool)

(assert (=> b!22846 m!32111))

(declare-fun m!32113 () Bool)

(assert (=> b!22848 m!32113))

(assert (=> b!22613 d!7382))

(declare-fun d!7384 () Bool)

(declare-fun c!1667 () Bool)

(assert (=> d!7384 (= c!1667 (= (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!15394 () List!278)

(assert (=> d!7384 (= (byteArrayBitContentToList!0 (_2!1386 lt!33196) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) e!15394)))

(declare-fun b!22849 () Bool)

(assert (=> b!22849 (= e!15394 Nil!275)))

(declare-fun b!22850 () Bool)

(assert (=> b!22850 (= e!15394 (Cons!274 (not (= (bvand ((_ sign_extend 24) (select (arr!1113 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1386 lt!33196) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!7384 c!1667) b!22849))

(assert (= (and d!7384 (not c!1667)) b!22850))

(assert (=> b!22850 m!31541))

(assert (=> b!22850 m!31723))

(declare-fun m!32115 () Bool)

(assert (=> b!22850 m!32115))

(assert (=> b!22613 d!7384))

(declare-fun b!22851 () Bool)

(declare-fun res!19618 () Bool)

(declare-fun e!15396 () Bool)

(assert (=> b!22851 (=> (not res!19618) (not e!15396))))

(declare-fun lt!33527 () tuple2!2604)

(assert (=> b!22851 (= res!19618 (isPrefixOf!0 (_1!1387 lt!33527) (_2!1386 lt!32403)))))

(declare-fun d!7386 () Bool)

(assert (=> d!7386 e!15396))

(declare-fun res!19620 () Bool)

(assert (=> d!7386 (=> (not res!19620) (not e!15396))))

(assert (=> d!7386 (= res!19620 (isPrefixOf!0 (_1!1387 lt!33527) (_2!1387 lt!33527)))))

(declare-fun lt!33524 () BitStream!1154)

(assert (=> d!7386 (= lt!33527 (tuple2!2605 lt!33524 (_2!1386 lt!33196)))))

(declare-fun lt!33529 () Unit!1930)

(declare-fun lt!33528 () Unit!1930)

(assert (=> d!7386 (= lt!33529 lt!33528)))

(assert (=> d!7386 (isPrefixOf!0 lt!33524 (_2!1386 lt!33196))))

(assert (=> d!7386 (= lt!33528 (lemmaIsPrefixTransitive!0 lt!33524 (_2!1386 lt!33196) (_2!1386 lt!33196)))))

(declare-fun lt!33534 () Unit!1930)

(declare-fun lt!33525 () Unit!1930)

(assert (=> d!7386 (= lt!33534 lt!33525)))

(assert (=> d!7386 (isPrefixOf!0 lt!33524 (_2!1386 lt!33196))))

(assert (=> d!7386 (= lt!33525 (lemmaIsPrefixTransitive!0 lt!33524 (_2!1386 lt!32403) (_2!1386 lt!33196)))))

(declare-fun lt!33522 () Unit!1930)

(declare-fun e!15395 () Unit!1930)

(assert (=> d!7386 (= lt!33522 e!15395)))

(declare-fun c!1668 () Bool)

(assert (=> d!7386 (= c!1668 (not (= (size!660 (buf!978 (_2!1386 lt!32403))) #b00000000000000000000000000000000)))))

(declare-fun lt!33531 () Unit!1930)

(declare-fun lt!33540 () Unit!1930)

(assert (=> d!7386 (= lt!33531 lt!33540)))

(assert (=> d!7386 (isPrefixOf!0 (_2!1386 lt!33196) (_2!1386 lt!33196))))

(assert (=> d!7386 (= lt!33540 (lemmaIsPrefixRefl!0 (_2!1386 lt!33196)))))

(declare-fun lt!33535 () Unit!1930)

(declare-fun lt!33526 () Unit!1930)

(assert (=> d!7386 (= lt!33535 lt!33526)))

(assert (=> d!7386 (= lt!33526 (lemmaIsPrefixRefl!0 (_2!1386 lt!33196)))))

(declare-fun lt!33530 () Unit!1930)

(declare-fun lt!33539 () Unit!1930)

(assert (=> d!7386 (= lt!33530 lt!33539)))

(assert (=> d!7386 (isPrefixOf!0 lt!33524 lt!33524)))

(assert (=> d!7386 (= lt!33539 (lemmaIsPrefixRefl!0 lt!33524))))

(declare-fun lt!33521 () Unit!1930)

(declare-fun lt!33537 () Unit!1930)

(assert (=> d!7386 (= lt!33521 lt!33537)))

(assert (=> d!7386 (isPrefixOf!0 (_2!1386 lt!32403) (_2!1386 lt!32403))))

(assert (=> d!7386 (= lt!33537 (lemmaIsPrefixRefl!0 (_2!1386 lt!32403)))))

(assert (=> d!7386 (= lt!33524 (BitStream!1155 (buf!978 (_2!1386 lt!33196)) (currentByte!2285 (_2!1386 lt!32403)) (currentBit!2280 (_2!1386 lt!32403))))))

(assert (=> d!7386 (isPrefixOf!0 (_2!1386 lt!32403) (_2!1386 lt!33196))))

(assert (=> d!7386 (= (reader!0 (_2!1386 lt!32403) (_2!1386 lt!33196)) lt!33527)))

(declare-fun b!22852 () Bool)

(declare-fun Unit!1966 () Unit!1930)

(assert (=> b!22852 (= e!15395 Unit!1966)))

(declare-fun b!22853 () Bool)

(declare-fun lt!33538 () (_ BitVec 64))

(declare-fun lt!33523 () (_ BitVec 64))

(assert (=> b!22853 (= e!15396 (= (_1!1387 lt!33527) (withMovedBitIndex!0 (_2!1387 lt!33527) (bvsub lt!33538 lt!33523))))))

(assert (=> b!22853 (or (= (bvand lt!33538 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!33523 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!33538 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!33538 lt!33523) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!22853 (= lt!33523 (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!33196))) (currentByte!2285 (_2!1386 lt!33196)) (currentBit!2280 (_2!1386 lt!33196))))))

(assert (=> b!22853 (= lt!33538 (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!32403))) (currentByte!2285 (_2!1386 lt!32403)) (currentBit!2280 (_2!1386 lt!32403))))))

(declare-fun b!22854 () Bool)

(declare-fun res!19619 () Bool)

(assert (=> b!22854 (=> (not res!19619) (not e!15396))))

(assert (=> b!22854 (= res!19619 (isPrefixOf!0 (_2!1387 lt!33527) (_2!1386 lt!33196)))))

(declare-fun b!22855 () Bool)

(declare-fun lt!33536 () Unit!1930)

(assert (=> b!22855 (= e!15395 lt!33536)))

(declare-fun lt!33532 () (_ BitVec 64))

(assert (=> b!22855 (= lt!33532 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!33533 () (_ BitVec 64))

(assert (=> b!22855 (= lt!33533 (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!32403))) (currentByte!2285 (_2!1386 lt!32403)) (currentBit!2280 (_2!1386 lt!32403))))))

(assert (=> b!22855 (= lt!33536 (arrayBitRangesEqSymmetric!0 (buf!978 (_2!1386 lt!32403)) (buf!978 (_2!1386 lt!33196)) lt!33532 lt!33533))))

(assert (=> b!22855 (arrayBitRangesEq!0 (buf!978 (_2!1386 lt!33196)) (buf!978 (_2!1386 lt!32403)) lt!33532 lt!33533)))

(assert (= (and d!7386 c!1668) b!22855))

(assert (= (and d!7386 (not c!1668)) b!22852))

(assert (= (and d!7386 res!19620) b!22851))

(assert (= (and b!22851 res!19618) b!22854))

(assert (= (and b!22854 res!19619) b!22853))

(assert (=> b!22855 m!31133))

(declare-fun m!32117 () Bool)

(assert (=> b!22855 m!32117))

(declare-fun m!32119 () Bool)

(assert (=> b!22855 m!32119))

(declare-fun m!32121 () Bool)

(assert (=> b!22854 m!32121))

(declare-fun m!32123 () Bool)

(assert (=> b!22853 m!32123))

(assert (=> b!22853 m!31523))

(assert (=> b!22853 m!31133))

(declare-fun m!32125 () Bool)

(assert (=> b!22851 m!32125))

(declare-fun m!32127 () Bool)

(assert (=> d!7386 m!32127))

(declare-fun m!32129 () Bool)

(assert (=> d!7386 m!32129))

(assert (=> d!7386 m!31603))

(declare-fun m!32131 () Bool)

(assert (=> d!7386 m!32131))

(declare-fun m!32133 () Bool)

(assert (=> d!7386 m!32133))

(declare-fun m!32135 () Bool)

(assert (=> d!7386 m!32135))

(assert (=> d!7386 m!31217))

(assert (=> d!7386 m!31219))

(declare-fun m!32137 () Bool)

(assert (=> d!7386 m!32137))

(declare-fun m!32139 () Bool)

(assert (=> d!7386 m!32139))

(declare-fun m!32141 () Bool)

(assert (=> d!7386 m!32141))

(assert (=> b!22613 d!7386))

(declare-fun d!7388 () Bool)

(assert (=> d!7388 (validate_offset_bits!1 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!33196)))) ((_ sign_extend 32) (currentByte!2285 (_2!1386 lt!32403))) ((_ sign_extend 32) (currentBit!2280 (_2!1386 lt!32403))) lt!33194)))

(declare-fun lt!33541 () Unit!1930)

(assert (=> d!7388 (= lt!33541 (choose!9 (_2!1386 lt!32403) (buf!978 (_2!1386 lt!33196)) lt!33194 (BitStream!1155 (buf!978 (_2!1386 lt!33196)) (currentByte!2285 (_2!1386 lt!32403)) (currentBit!2280 (_2!1386 lt!32403)))))))

(assert (=> d!7388 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1386 lt!32403) (buf!978 (_2!1386 lt!33196)) lt!33194) lt!33541)))

(declare-fun bs!2109 () Bool)

(assert (= bs!2109 d!7388))

(assert (=> bs!2109 m!31533))

(declare-fun m!32143 () Bool)

(assert (=> bs!2109 m!32143))

(assert (=> b!22613 d!7388))

(declare-fun d!7390 () Bool)

(assert (=> d!7390 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!33196)))) ((_ sign_extend 32) (currentByte!2285 (_2!1386 lt!32403))) ((_ sign_extend 32) (currentBit!2280 (_2!1386 lt!32403))) lt!33194) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!33196)))) ((_ sign_extend 32) (currentByte!2285 (_2!1386 lt!32403))) ((_ sign_extend 32) (currentBit!2280 (_2!1386 lt!32403)))) lt!33194))))

(declare-fun bs!2110 () Bool)

(assert (= bs!2110 d!7390))

(declare-fun m!32145 () Bool)

(assert (=> bs!2110 m!32145))

(assert (=> b!22613 d!7390))

(declare-fun d!7392 () Bool)

(declare-fun e!15399 () Bool)

(assert (=> d!7392 e!15399))

(declare-fun res!19623 () Bool)

(assert (=> d!7392 (=> (not res!19623) (not e!15399))))

(declare-fun lt!33546 () BitStream!1154)

(declare-fun lt!33547 () (_ BitVec 64))

(assert (=> d!7392 (= res!19623 (= (bvadd lt!33547 (bvsub lt!32624 lt!32609)) (bitIndex!0 (size!660 (buf!978 lt!33546)) (currentByte!2285 lt!33546) (currentBit!2280 lt!33546))))))

(assert (=> d!7392 (or (not (= (bvand lt!33547 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!32624 lt!32609) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!33547 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!33547 (bvsub lt!32624 lt!32609)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!7392 (= lt!33547 (bitIndex!0 (size!660 (buf!978 (_2!1387 lt!32613))) (currentByte!2285 (_2!1387 lt!32613)) (currentBit!2280 (_2!1387 lt!32613))))))

(declare-fun moveBitIndex!0 (BitStream!1154 (_ BitVec 64)) tuple2!2602)

(assert (=> d!7392 (= lt!33546 (_2!1386 (moveBitIndex!0 (_2!1387 lt!32613) (bvsub lt!32624 lt!32609))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!1154 (_ BitVec 64)) Bool)

(assert (=> d!7392 (moveBitIndexPrecond!0 (_2!1387 lt!32613) (bvsub lt!32624 lt!32609))))

(assert (=> d!7392 (= (withMovedBitIndex!0 (_2!1387 lt!32613) (bvsub lt!32624 lt!32609)) lt!33546)))

(declare-fun b!22858 () Bool)

(assert (=> b!22858 (= e!15399 (= (size!660 (buf!978 (_2!1387 lt!32613))) (size!660 (buf!978 lt!33546))))))

(assert (= (and d!7392 res!19623) b!22858))

(declare-fun m!32147 () Bool)

(assert (=> d!7392 m!32147))

(assert (=> d!7392 m!31759))

(declare-fun m!32149 () Bool)

(assert (=> d!7392 m!32149))

(declare-fun m!32151 () Bool)

(assert (=> d!7392 m!32151))

(assert (=> b!22437 d!7392))

(assert (=> b!22437 d!7228))

(assert (=> b!22437 d!7132))

(assert (=> b!22390 d!7120))

(declare-fun d!7394 () Bool)

(declare-fun res!19626 () Bool)

(declare-fun e!15401 () Bool)

(assert (=> d!7394 (=> (not res!19626) (not e!15401))))

(assert (=> d!7394 (= res!19626 (= (size!660 (buf!978 thiss!1379)) (size!660 (buf!978 (_2!1386 lt!32540)))))))

(assert (=> d!7394 (= (isPrefixOf!0 thiss!1379 (_2!1386 lt!32540)) e!15401)))

(declare-fun b!22859 () Bool)

(declare-fun res!19624 () Bool)

(assert (=> b!22859 (=> (not res!19624) (not e!15401))))

(assert (=> b!22859 (= res!19624 (bvsle (bitIndex!0 (size!660 (buf!978 thiss!1379)) (currentByte!2285 thiss!1379) (currentBit!2280 thiss!1379)) (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!32540))) (currentByte!2285 (_2!1386 lt!32540)) (currentBit!2280 (_2!1386 lt!32540)))))))

(declare-fun b!22860 () Bool)

(declare-fun e!15400 () Bool)

(assert (=> b!22860 (= e!15401 e!15400)))

(declare-fun res!19625 () Bool)

(assert (=> b!22860 (=> res!19625 e!15400)))

(assert (=> b!22860 (= res!19625 (= (size!660 (buf!978 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!22861 () Bool)

(assert (=> b!22861 (= e!15400 (arrayBitRangesEq!0 (buf!978 thiss!1379) (buf!978 (_2!1386 lt!32540)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!660 (buf!978 thiss!1379)) (currentByte!2285 thiss!1379) (currentBit!2280 thiss!1379))))))

(assert (= (and d!7394 res!19626) b!22859))

(assert (= (and b!22859 res!19624) b!22860))

(assert (= (and b!22860 (not res!19625)) b!22861))

(assert (=> b!22859 m!31079))

(assert (=> b!22859 m!31187))

(assert (=> b!22861 m!31079))

(assert (=> b!22861 m!31079))

(declare-fun m!32153 () Bool)

(assert (=> b!22861 m!32153))

(assert (=> b!22415 d!7394))

(declare-fun d!7396 () Bool)

(declare-fun res!19629 () Bool)

(declare-fun e!15403 () Bool)

(assert (=> d!7396 (=> (not res!19629) (not e!15403))))

(assert (=> d!7396 (= res!19629 (= (size!660 (buf!978 (_2!1387 lt!32613))) (size!660 (buf!978 (_2!1386 lt!32403)))))))

(assert (=> d!7396 (= (isPrefixOf!0 (_2!1387 lt!32613) (_2!1386 lt!32403)) e!15403)))

(declare-fun b!22862 () Bool)

(declare-fun res!19627 () Bool)

(assert (=> b!22862 (=> (not res!19627) (not e!15403))))

(assert (=> b!22862 (= res!19627 (bvsle (bitIndex!0 (size!660 (buf!978 (_2!1387 lt!32613))) (currentByte!2285 (_2!1387 lt!32613)) (currentBit!2280 (_2!1387 lt!32613))) (bitIndex!0 (size!660 (buf!978 (_2!1386 lt!32403))) (currentByte!2285 (_2!1386 lt!32403)) (currentBit!2280 (_2!1386 lt!32403)))))))

(declare-fun b!22863 () Bool)

(declare-fun e!15402 () Bool)

(assert (=> b!22863 (= e!15403 e!15402)))

(declare-fun res!19628 () Bool)

(assert (=> b!22863 (=> res!19628 e!15402)))

(assert (=> b!22863 (= res!19628 (= (size!660 (buf!978 (_2!1387 lt!32613))) #b00000000000000000000000000000000))))

(declare-fun b!22864 () Bool)

(assert (=> b!22864 (= e!15402 (arrayBitRangesEq!0 (buf!978 (_2!1387 lt!32613)) (buf!978 (_2!1386 lt!32403)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!660 (buf!978 (_2!1387 lt!32613))) (currentByte!2285 (_2!1387 lt!32613)) (currentBit!2280 (_2!1387 lt!32613)))))))

(assert (= (and d!7396 res!19629) b!22862))

(assert (= (and b!22862 res!19627) b!22863))

(assert (= (and b!22863 (not res!19628)) b!22864))

(assert (=> b!22862 m!31759))

(assert (=> b!22862 m!31133))

(assert (=> b!22864 m!31759))

(assert (=> b!22864 m!31759))

(declare-fun m!32155 () Bool)

(assert (=> b!22864 m!32155))

(assert (=> b!22438 d!7396))

(declare-fun d!7398 () Bool)

(assert (=> d!7398 (= (remainingBits!0 ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!32399)))) ((_ sign_extend 32) (currentByte!2285 (_2!1386 lt!32399))) ((_ sign_extend 32) (currentBit!2280 (_2!1386 lt!32399)))) (bvsub (bvmul ((_ sign_extend 32) (size!660 (buf!978 (_2!1386 lt!32399)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!2285 (_2!1386 lt!32399))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2280 (_2!1386 lt!32399))))))))

(assert (=> d!7226 d!7398))

(assert (=> d!7226 d!7134))

(push 1)

(assert (not b!22768))

(assert (not b!22805))

(assert (not b!22842))

(assert (not d!7304))

(assert (not d!7236))

(assert (not b!22782))

(assert (not b!22766))

(assert (not b!22668))

(assert (not b!22844))

(assert (not bm!334))

(assert (not b!22813))

(assert (not d!7324))

(assert (not b!22792))

(assert (not b!22739))

(assert (not d!7280))

(assert (not b!22818))

(assert (not b!22744))

(assert (not b!22731))

(assert (not d!7362))

(assert (not b!22778))

(assert (not b!22713))

(assert (not b!22781))

(assert (not b!22734))

(assert (not d!7340))

(assert (not b!22663))

(assert (not d!7326))

(assert (not d!7300))

(assert (not b!22764))

(assert (not d!7238))

(assert (not b!22756))

(assert (not b!22771))

(assert (not b!22649))

(assert (not b!22850))

(assert (not b!22848))

(assert (not b!22791))

(assert (not d!7360))

(assert (not b!22745))

(assert (not d!7246))

(assert (not b!22843))

(assert (not bm!333))

(assert (not b!22862))

(assert (not b!22859))

(assert (not b!22730))

(assert (not b!22815))

(assert (not b!22795))

(assert (not b!22723))

(assert (not d!7352))

(assert (not b!22740))

(assert (not b!22855))

(assert (not d!7356))

(assert (not b!22861))

(assert (not b!22847))

(assert (not bm!332))

(assert (not b!22777))

(assert (not d!7336))

(assert (not b!22846))

(assert (not d!7244))

(assert (not d!7258))

(assert (not d!7390))

(assert (not d!7310))

(assert (not b!22765))

(assert (not bm!329))

(assert (not b!22762))

(assert (not b!22864))

(assert (not d!7328))

(assert (not b!22750))

(assert (not b!22749))

(assert (not d!7288))

(assert (not b!22821))

(assert (not b!22653))

(assert (not b!22853))

(assert (not b!22717))

(assert (not b!22727))

(assert (not d!7290))

(assert (not b!22807))

(assert (not b!22720))

(assert (not d!7228))

(assert (not b!22767))

(assert (not d!7376))

(assert (not b!22851))

(assert (not b!22790))

(assert (not b!22775))

(assert (not d!7256))

(assert (not b!22662))

(assert (not b!22788))

(assert (not b!22754))

(assert (not b!22830))

(assert (not b!22760))

(assert (not d!7346))

(assert (not d!7234))

(assert (not b!22769))

(assert (not b!22827))

(assert (not b!22800))

(assert (not b!22841))

(assert (not b!22670))

(assert (not bm!330))

(assert (not b!22761))

(assert (not d!7306))

(assert (not bm!331))

(assert (not b!22658))

(assert (not d!7392))

(assert (not b!22817))

(assert (not b!22743))

(assert (not b!22665))

(assert (not d!7366))

(assert (not b!22695))

(assert (not d!7380))

(assert (not b!22742))

(assert (not d!7386))

(assert (not b!22702))

(assert (not d!7318))

(assert (not b!22770))

(assert (not b!22661))

(assert (not b!22655))

(assert (not b!22659))

(assert (not d!7344))

(assert (not d!7348))

(assert (not b!22854))

(assert (not b!22654))

(assert (not d!7388))

(assert (not b!22692))

(assert (not b!22793))

(assert (not d!7282))

(assert (not b!22728))

(assert (not d!7374))

(assert (not d!7354))

(assert (not b!22751))

(assert (not b!22785))

(assert (not d!7364))

(assert (not b!22772))

(assert (not b!22779))

(assert (not b!22733))

(assert (not d!7270))

(assert (not b!22797))

(assert (not d!7308))

(assert (not b!22752))

(assert (not b!22808))

(assert (not d!7264))

(assert (not d!7250))

(assert (not b!22755))

(assert (not b!22826))

(assert (not d!7358))

(assert (not b!22738))

(assert (not b!22736))

(assert (not b!22783))

(assert (not b!22715))

(assert (not b!22675))

(assert (not b!22725))

(assert (not d!7332))

(assert (not b!22811))

(assert (not d!7338))

(assert (not d!7262))

(assert (not b!22651))

(assert (not b!22691))

(assert (not b!22673))

(assert (not b!22719))

(assert (not b!22747))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

