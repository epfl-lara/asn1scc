; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5488 () Bool)

(assert start!5488)

(declare-fun b!22244 () Bool)

(declare-fun res!19167 () Bool)

(declare-fun e!15054 () Bool)

(assert (=> b!22244 (=> res!19167 e!15054)))

(declare-datatypes ((array!1544 0))(
  ( (array!1545 (arr!1111 (Array (_ BitVec 32) (_ BitVec 8))) (size!658 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1150 0))(
  ( (BitStream!1151 (buf!976 array!1544) (currentByte!2283 (_ BitVec 32)) (currentBit!2278 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!1926 0))(
  ( (Unit!1927) )
))
(declare-datatypes ((tuple2!2594 0))(
  ( (tuple2!2595 (_1!1382 Unit!1926) (_2!1382 BitStream!1150)) )
))
(declare-fun lt!32352 () tuple2!2594)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!22244 (= res!19167 (not (invariant!0 (currentBit!2278 (_2!1382 lt!32352)) (currentByte!2283 (_2!1382 lt!32352)) (size!658 (buf!976 (_2!1382 lt!32352))))))))

(declare-fun b!22245 () Bool)

(declare-fun res!19174 () Bool)

(assert (=> b!22245 (=> res!19174 e!15054)))

(declare-fun thiss!1379 () BitStream!1150)

(assert (=> b!22245 (= res!19174 (not (= (size!658 (buf!976 thiss!1379)) (size!658 (buf!976 (_2!1382 lt!32352))))))))

(declare-fun srcBuffer!2 () array!1544)

(declare-datatypes ((tuple2!2596 0))(
  ( (tuple2!2597 (_1!1383 BitStream!1150) (_2!1383 BitStream!1150)) )
))
(declare-fun lt!32355 () tuple2!2596)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun b!22246 () Bool)

(declare-fun e!15052 () Bool)

(declare-fun lt!32356 () tuple2!2594)

(declare-datatypes ((List!276 0))(
  ( (Nil!273) (Cons!272 (h!391 Bool) (t!1026 List!276)) )
))
(declare-fun head!113 (List!276) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1150 array!1544 (_ BitVec 64) (_ BitVec 64)) List!276)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1150 BitStream!1150 (_ BitVec 64)) List!276)

(assert (=> b!22246 (= e!15052 (= (head!113 (byteArrayBitContentToList!0 (_2!1382 lt!32356) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!113 (bitStreamReadBitsIntoList!0 (_2!1382 lt!32356) (_1!1383 lt!32355) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!22247 () Bool)

(declare-fun e!15053 () Bool)

(declare-fun e!15047 () Bool)

(assert (=> b!22247 (= e!15053 (not e!15047))))

(declare-fun res!19173 () Bool)

(assert (=> b!22247 (=> res!19173 e!15047)))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!22247 (= res!19173 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1150 BitStream!1150) Bool)

(assert (=> b!22247 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!32350 () Unit!1926)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1150) Unit!1926)

(assert (=> b!22247 (= lt!32350 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!32349 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!22247 (= lt!32349 (bitIndex!0 (size!658 (buf!976 thiss!1379)) (currentByte!2283 thiss!1379) (currentBit!2278 thiss!1379)))))

(declare-fun b!22248 () Bool)

(declare-fun e!15050 () Bool)

(assert (=> b!22248 (= e!15050 e!15054)))

(declare-fun res!19172 () Bool)

(assert (=> b!22248 (=> res!19172 e!15054)))

(assert (=> b!22248 (= res!19172 (not (isPrefixOf!0 (_2!1382 lt!32356) (_2!1382 lt!32352))))))

(assert (=> b!22248 (isPrefixOf!0 thiss!1379 (_2!1382 lt!32352))))

(declare-fun lt!32351 () Unit!1926)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1150 BitStream!1150 BitStream!1150) Unit!1926)

(assert (=> b!22248 (= lt!32351 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1382 lt!32356) (_2!1382 lt!32352)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1150 array!1544 (_ BitVec 64) (_ BitVec 64)) tuple2!2594)

(assert (=> b!22248 (= lt!32352 (appendBitsMSBFirstLoop!0 (_2!1382 lt!32356) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!22248 e!15052))

(declare-fun res!19169 () Bool)

(assert (=> b!22248 (=> (not res!19169) (not e!15052))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!22248 (= res!19169 (validate_offset_bits!1 ((_ sign_extend 32) (size!658 (buf!976 (_2!1382 lt!32356)))) ((_ sign_extend 32) (currentByte!2283 thiss!1379)) ((_ sign_extend 32) (currentBit!2278 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!32353 () Unit!1926)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1150 array!1544 (_ BitVec 64)) Unit!1926)

(assert (=> b!22248 (= lt!32353 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!976 (_2!1382 lt!32356)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1150 BitStream!1150) tuple2!2596)

(assert (=> b!22248 (= lt!32355 (reader!0 thiss!1379 (_2!1382 lt!32356)))))

(declare-fun b!22249 () Bool)

(declare-fun e!15049 () Bool)

(declare-fun array_inv!628 (array!1544) Bool)

(assert (=> b!22249 (= e!15049 (array_inv!628 (buf!976 thiss!1379)))))

(declare-fun b!22250 () Bool)

(declare-fun res!19168 () Bool)

(assert (=> b!22250 (=> (not res!19168) (not e!15053))))

(assert (=> b!22250 (= res!19168 (validate_offset_bits!1 ((_ sign_extend 32) (size!658 (buf!976 thiss!1379))) ((_ sign_extend 32) (currentByte!2283 thiss!1379)) ((_ sign_extend 32) (currentBit!2278 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!22251 () Bool)

(declare-fun res!19171 () Bool)

(assert (=> b!22251 (=> res!19171 e!15054)))

(assert (=> b!22251 (= res!19171 (not (= (bitIndex!0 (size!658 (buf!976 (_2!1382 lt!32352))) (currentByte!2283 (_2!1382 lt!32352)) (currentBit!2278 (_2!1382 lt!32352))) (bvsub (bvadd lt!32349 to!314) i!635))))))

(declare-fun res!19175 () Bool)

(assert (=> start!5488 (=> (not res!19175) (not e!15053))))

(assert (=> start!5488 (= res!19175 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!658 srcBuffer!2))))))))

(assert (=> start!5488 e!15053))

(assert (=> start!5488 true))

(assert (=> start!5488 (array_inv!628 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1150) Bool)

(assert (=> start!5488 (and (inv!12 thiss!1379) e!15049)))

(declare-fun b!22252 () Bool)

(assert (=> b!22252 (= e!15054 (invariant!0 (currentBit!2278 (_2!1382 lt!32356)) (currentByte!2283 (_2!1382 lt!32356)) (size!658 (buf!976 (_2!1382 lt!32356)))))))

(assert (=> b!22252 (= (size!658 (buf!976 (_2!1382 lt!32352))) (size!658 (buf!976 thiss!1379)))))

(declare-fun b!22253 () Bool)

(assert (=> b!22253 (= e!15047 e!15050)))

(declare-fun res!19170 () Bool)

(assert (=> b!22253 (=> res!19170 e!15050)))

(assert (=> b!22253 (= res!19170 (not (isPrefixOf!0 thiss!1379 (_2!1382 lt!32356))))))

(assert (=> b!22253 (validate_offset_bits!1 ((_ sign_extend 32) (size!658 (buf!976 (_2!1382 lt!32356)))) ((_ sign_extend 32) (currentByte!2283 (_2!1382 lt!32356))) ((_ sign_extend 32) (currentBit!2278 (_2!1382 lt!32356))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!32354 () Unit!1926)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1150 BitStream!1150 (_ BitVec 64) (_ BitVec 64)) Unit!1926)

(assert (=> b!22253 (= lt!32354 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1382 lt!32356) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1150 (_ BitVec 8) (_ BitVec 32)) tuple2!2594)

(assert (=> b!22253 (= lt!32356 (appendBitFromByte!0 thiss!1379 (select (arr!1111 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (= (and start!5488 res!19175) b!22250))

(assert (= (and b!22250 res!19168) b!22247))

(assert (= (and b!22247 (not res!19173)) b!22253))

(assert (= (and b!22253 (not res!19170)) b!22248))

(assert (= (and b!22248 res!19169) b!22246))

(assert (= (and b!22248 (not res!19172)) b!22251))

(assert (= (and b!22251 (not res!19171)) b!22244))

(assert (= (and b!22244 (not res!19167)) b!22245))

(assert (= (and b!22245 (not res!19174)) b!22252))

(assert (= start!5488 b!22249))

(declare-fun m!30939 () Bool)

(assert (=> b!22244 m!30939))

(declare-fun m!30941 () Bool)

(assert (=> b!22251 m!30941))

(declare-fun m!30943 () Bool)

(assert (=> b!22247 m!30943))

(declare-fun m!30945 () Bool)

(assert (=> b!22247 m!30945))

(declare-fun m!30947 () Bool)

(assert (=> b!22247 m!30947))

(declare-fun m!30949 () Bool)

(assert (=> b!22249 m!30949))

(declare-fun m!30951 () Bool)

(assert (=> start!5488 m!30951))

(declare-fun m!30953 () Bool)

(assert (=> start!5488 m!30953))

(declare-fun m!30955 () Bool)

(assert (=> b!22248 m!30955))

(declare-fun m!30957 () Bool)

(assert (=> b!22248 m!30957))

(declare-fun m!30959 () Bool)

(assert (=> b!22248 m!30959))

(declare-fun m!30961 () Bool)

(assert (=> b!22248 m!30961))

(declare-fun m!30963 () Bool)

(assert (=> b!22248 m!30963))

(declare-fun m!30965 () Bool)

(assert (=> b!22248 m!30965))

(declare-fun m!30967 () Bool)

(assert (=> b!22248 m!30967))

(declare-fun m!30969 () Bool)

(assert (=> b!22250 m!30969))

(declare-fun m!30971 () Bool)

(assert (=> b!22253 m!30971))

(declare-fun m!30973 () Bool)

(assert (=> b!22253 m!30973))

(declare-fun m!30975 () Bool)

(assert (=> b!22253 m!30975))

(declare-fun m!30977 () Bool)

(assert (=> b!22253 m!30977))

(assert (=> b!22253 m!30971))

(declare-fun m!30979 () Bool)

(assert (=> b!22253 m!30979))

(declare-fun m!30981 () Bool)

(assert (=> b!22252 m!30981))

(declare-fun m!30983 () Bool)

(assert (=> b!22246 m!30983))

(assert (=> b!22246 m!30983))

(declare-fun m!30985 () Bool)

(assert (=> b!22246 m!30985))

(declare-fun m!30987 () Bool)

(assert (=> b!22246 m!30987))

(assert (=> b!22246 m!30987))

(declare-fun m!30989 () Bool)

(assert (=> b!22246 m!30989))

(push 1)

(assert (not b!22246))

(assert (not b!22250))

(assert (not start!5488))

(assert (not b!22244))

(assert (not b!22252))

(assert (not b!22251))

(assert (not b!22249))

(assert (not b!22247))

(assert (not b!22253))

(assert (not b!22248))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!7094 () Bool)

(declare-fun e!15113 () Bool)

(assert (=> d!7094 e!15113))

(declare-fun res!19247 () Bool)

(assert (=> d!7094 (=> (not res!19247) (not e!15113))))

(declare-fun lt!32423 () (_ BitVec 64))

(declare-fun lt!32424 () (_ BitVec 64))

(declare-fun lt!32428 () (_ BitVec 64))

(assert (=> d!7094 (= res!19247 (= lt!32424 (bvsub lt!32423 lt!32428)))))

(assert (=> d!7094 (or (= (bvand lt!32423 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!32428 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!32423 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!32423 lt!32428) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!7094 (= lt!32428 (remainingBits!0 ((_ sign_extend 32) (size!658 (buf!976 (_2!1382 lt!32352)))) ((_ sign_extend 32) (currentByte!2283 (_2!1382 lt!32352))) ((_ sign_extend 32) (currentBit!2278 (_2!1382 lt!32352)))))))

(declare-fun lt!32426 () (_ BitVec 64))

(declare-fun lt!32427 () (_ BitVec 64))

(assert (=> d!7094 (= lt!32423 (bvmul lt!32426 lt!32427))))

(assert (=> d!7094 (or (= lt!32426 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!32427 (bvsdiv (bvmul lt!32426 lt!32427) lt!32426)))))

(assert (=> d!7094 (= lt!32427 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!7094 (= lt!32426 ((_ sign_extend 32) (size!658 (buf!976 (_2!1382 lt!32352)))))))

(assert (=> d!7094 (= lt!32424 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2283 (_2!1382 lt!32352))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2278 (_2!1382 lt!32352)))))))

(assert (=> d!7094 (invariant!0 (currentBit!2278 (_2!1382 lt!32352)) (currentByte!2283 (_2!1382 lt!32352)) (size!658 (buf!976 (_2!1382 lt!32352))))))

(assert (=> d!7094 (= (bitIndex!0 (size!658 (buf!976 (_2!1382 lt!32352))) (currentByte!2283 (_2!1382 lt!32352)) (currentBit!2278 (_2!1382 lt!32352))) lt!32424)))

(declare-fun b!22330 () Bool)

(declare-fun res!19246 () Bool)

(assert (=> b!22330 (=> (not res!19246) (not e!15113))))

(assert (=> b!22330 (= res!19246 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!32424))))

(declare-fun b!22331 () Bool)

(declare-fun lt!32425 () (_ BitVec 64))

(assert (=> b!22331 (= e!15113 (bvsle lt!32424 (bvmul lt!32425 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!22331 (or (= lt!32425 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!32425 #b0000000000000000000000000000000000000000000000000000000000001000) lt!32425)))))

(assert (=> b!22331 (= lt!32425 ((_ sign_extend 32) (size!658 (buf!976 (_2!1382 lt!32352)))))))

(assert (= (and d!7094 res!19247) b!22330))

(assert (= (and b!22330 res!19246) b!22331))

(declare-fun m!31107 () Bool)

(assert (=> d!7094 m!31107))

(assert (=> d!7094 m!30939))

(assert (=> b!22251 d!7094))

(declare-fun d!7096 () Bool)

(assert (=> d!7096 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!658 (buf!976 thiss!1379))) ((_ sign_extend 32) (currentByte!2283 thiss!1379)) ((_ sign_extend 32) (currentBit!2278 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!658 (buf!976 thiss!1379))) ((_ sign_extend 32) (currentByte!2283 thiss!1379)) ((_ sign_extend 32) (currentBit!2278 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2063 () Bool)

(assert (= bs!2063 d!7096))

(declare-fun m!31109 () Bool)

(assert (=> bs!2063 m!31109))

(assert (=> b!22250 d!7096))

(declare-fun d!7098 () Bool)

(declare-fun res!19255 () Bool)

(declare-fun e!15118 () Bool)

(assert (=> d!7098 (=> (not res!19255) (not e!15118))))

(assert (=> d!7098 (= res!19255 (= (size!658 (buf!976 thiss!1379)) (size!658 (buf!976 thiss!1379))))))

(assert (=> d!7098 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!15118)))

(declare-fun b!22338 () Bool)

(declare-fun res!19256 () Bool)

(assert (=> b!22338 (=> (not res!19256) (not e!15118))))

(assert (=> b!22338 (= res!19256 (bvsle (bitIndex!0 (size!658 (buf!976 thiss!1379)) (currentByte!2283 thiss!1379) (currentBit!2278 thiss!1379)) (bitIndex!0 (size!658 (buf!976 thiss!1379)) (currentByte!2283 thiss!1379) (currentBit!2278 thiss!1379))))))

(declare-fun b!22339 () Bool)

(declare-fun e!15119 () Bool)

(assert (=> b!22339 (= e!15118 e!15119)))

(declare-fun res!19254 () Bool)

(assert (=> b!22339 (=> res!19254 e!15119)))

(assert (=> b!22339 (= res!19254 (= (size!658 (buf!976 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!22340 () Bool)

(declare-fun arrayBitRangesEq!0 (array!1544 array!1544 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!22340 (= e!15119 (arrayBitRangesEq!0 (buf!976 thiss!1379) (buf!976 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!658 (buf!976 thiss!1379)) (currentByte!2283 thiss!1379) (currentBit!2278 thiss!1379))))))

(assert (= (and d!7098 res!19255) b!22338))

(assert (= (and b!22338 res!19256) b!22339))

(assert (= (and b!22339 (not res!19254)) b!22340))

(assert (=> b!22338 m!30947))

(assert (=> b!22338 m!30947))

(assert (=> b!22340 m!30947))

(assert (=> b!22340 m!30947))

(declare-fun m!31111 () Bool)

(assert (=> b!22340 m!31111))

(assert (=> b!22247 d!7098))

(declare-fun d!7100 () Bool)

(assert (=> d!7100 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!32431 () Unit!1926)

(declare-fun choose!11 (BitStream!1150) Unit!1926)

(assert (=> d!7100 (= lt!32431 (choose!11 thiss!1379))))

(assert (=> d!7100 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!32431)))

(declare-fun bs!2065 () Bool)

(assert (= bs!2065 d!7100))

(assert (=> bs!2065 m!30943))

(declare-fun m!31113 () Bool)

(assert (=> bs!2065 m!31113))

(assert (=> b!22247 d!7100))

(declare-fun d!7102 () Bool)

(declare-fun e!15120 () Bool)

(assert (=> d!7102 e!15120))

(declare-fun res!19258 () Bool)

(assert (=> d!7102 (=> (not res!19258) (not e!15120))))

(declare-fun lt!32432 () (_ BitVec 64))

(declare-fun lt!32437 () (_ BitVec 64))

(declare-fun lt!32433 () (_ BitVec 64))

(assert (=> d!7102 (= res!19258 (= lt!32433 (bvsub lt!32432 lt!32437)))))

(assert (=> d!7102 (or (= (bvand lt!32432 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!32437 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!32432 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!32432 lt!32437) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!7102 (= lt!32437 (remainingBits!0 ((_ sign_extend 32) (size!658 (buf!976 thiss!1379))) ((_ sign_extend 32) (currentByte!2283 thiss!1379)) ((_ sign_extend 32) (currentBit!2278 thiss!1379))))))

(declare-fun lt!32435 () (_ BitVec 64))

(declare-fun lt!32436 () (_ BitVec 64))

(assert (=> d!7102 (= lt!32432 (bvmul lt!32435 lt!32436))))

(assert (=> d!7102 (or (= lt!32435 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!32436 (bvsdiv (bvmul lt!32435 lt!32436) lt!32435)))))

(assert (=> d!7102 (= lt!32436 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!7102 (= lt!32435 ((_ sign_extend 32) (size!658 (buf!976 thiss!1379))))))

(assert (=> d!7102 (= lt!32433 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2283 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2278 thiss!1379))))))

(assert (=> d!7102 (invariant!0 (currentBit!2278 thiss!1379) (currentByte!2283 thiss!1379) (size!658 (buf!976 thiss!1379)))))

(assert (=> d!7102 (= (bitIndex!0 (size!658 (buf!976 thiss!1379)) (currentByte!2283 thiss!1379) (currentBit!2278 thiss!1379)) lt!32433)))

(declare-fun b!22341 () Bool)

(declare-fun res!19257 () Bool)

(assert (=> b!22341 (=> (not res!19257) (not e!15120))))

(assert (=> b!22341 (= res!19257 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!32433))))

(declare-fun b!22342 () Bool)

(declare-fun lt!32434 () (_ BitVec 64))

(assert (=> b!22342 (= e!15120 (bvsle lt!32433 (bvmul lt!32434 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!22342 (or (= lt!32434 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!32434 #b0000000000000000000000000000000000000000000000000000000000001000) lt!32434)))))

(assert (=> b!22342 (= lt!32434 ((_ sign_extend 32) (size!658 (buf!976 thiss!1379))))))

(assert (= (and d!7102 res!19258) b!22341))

(assert (= (and b!22341 res!19257) b!22342))

(assert (=> d!7102 m!31109))

(declare-fun m!31115 () Bool)

(assert (=> d!7102 m!31115))

(assert (=> b!22247 d!7102))

(declare-fun d!7104 () Bool)

(assert (=> d!7104 (= (invariant!0 (currentBit!2278 (_2!1382 lt!32356)) (currentByte!2283 (_2!1382 lt!32356)) (size!658 (buf!976 (_2!1382 lt!32356)))) (and (bvsge (currentBit!2278 (_2!1382 lt!32356)) #b00000000000000000000000000000000) (bvslt (currentBit!2278 (_2!1382 lt!32356)) #b00000000000000000000000000001000) (bvsge (currentByte!2283 (_2!1382 lt!32356)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2283 (_2!1382 lt!32356)) (size!658 (buf!976 (_2!1382 lt!32356)))) (and (= (currentBit!2278 (_2!1382 lt!32356)) #b00000000000000000000000000000000) (= (currentByte!2283 (_2!1382 lt!32356)) (size!658 (buf!976 (_2!1382 lt!32356))))))))))

(assert (=> b!22252 d!7104))

(declare-fun d!7106 () Bool)

(assert (=> d!7106 (= (head!113 (byteArrayBitContentToList!0 (_2!1382 lt!32356) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!391 (byteArrayBitContentToList!0 (_2!1382 lt!32356) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!22246 d!7106))

(declare-fun d!7108 () Bool)

(declare-fun c!1597 () Bool)

(assert (=> d!7108 (= c!1597 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!15123 () List!276)

(assert (=> d!7108 (= (byteArrayBitContentToList!0 (_2!1382 lt!32356) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!15123)))

(declare-fun b!22347 () Bool)

(assert (=> b!22347 (= e!15123 Nil!273)))

(declare-fun b!22348 () Bool)

(assert (=> b!22348 (= e!15123 (Cons!272 (not (= (bvand ((_ sign_extend 24) (select (arr!1111 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1382 lt!32356) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!7108 c!1597) b!22347))

(assert (= (and d!7108 (not c!1597)) b!22348))

(assert (=> b!22348 m!30971))

(declare-fun m!31117 () Bool)

(assert (=> b!22348 m!31117))

(declare-fun m!31119 () Bool)

(assert (=> b!22348 m!31119))

(assert (=> b!22246 d!7108))

(declare-fun d!7110 () Bool)

(assert (=> d!7110 (= (head!113 (bitStreamReadBitsIntoList!0 (_2!1382 lt!32356) (_1!1383 lt!32355) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!391 (bitStreamReadBitsIntoList!0 (_2!1382 lt!32356) (_1!1383 lt!32355) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!22246 d!7110))

(declare-fun d!7112 () Bool)

(declare-fun e!15129 () Bool)

(assert (=> d!7112 e!15129))

(declare-fun c!1602 () Bool)

(assert (=> d!7112 (= c!1602 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!32446 () List!276)

(declare-datatypes ((tuple2!2614 0))(
  ( (tuple2!2615 (_1!1392 List!276) (_2!1392 BitStream!1150)) )
))
(declare-fun e!15128 () tuple2!2614)

(assert (=> d!7112 (= lt!32446 (_1!1392 e!15128))))

(declare-fun c!1603 () Bool)

(assert (=> d!7112 (= c!1603 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!7112 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!7112 (= (bitStreamReadBitsIntoList!0 (_2!1382 lt!32356) (_1!1383 lt!32355) #b0000000000000000000000000000000000000000000000000000000000000001) lt!32446)))

(declare-fun b!22357 () Bool)

(assert (=> b!22357 (= e!15128 (tuple2!2615 Nil!273 (_1!1383 lt!32355)))))

(declare-fun b!22360 () Bool)

(declare-fun length!57 (List!276) Int)

(assert (=> b!22360 (= e!15129 (> (length!57 lt!32446) 0))))

(declare-datatypes ((tuple2!2616 0))(
  ( (tuple2!2617 (_1!1393 Bool) (_2!1393 BitStream!1150)) )
))
(declare-fun lt!32445 () tuple2!2616)

(declare-fun lt!32444 () (_ BitVec 64))

(declare-fun b!22358 () Bool)

(assert (=> b!22358 (= e!15128 (tuple2!2615 (Cons!272 (_1!1393 lt!32445) (bitStreamReadBitsIntoList!0 (_2!1382 lt!32356) (_2!1393 lt!32445) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!32444))) (_2!1393 lt!32445)))))

(declare-fun readBit!0 (BitStream!1150) tuple2!2616)

(assert (=> b!22358 (= lt!32445 (readBit!0 (_1!1383 lt!32355)))))

(assert (=> b!22358 (= lt!32444 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!22359 () Bool)

(declare-fun isEmpty!62 (List!276) Bool)

(assert (=> b!22359 (= e!15129 (isEmpty!62 lt!32446))))

(assert (= (and d!7112 c!1603) b!22357))

(assert (= (and d!7112 (not c!1603)) b!22358))

(assert (= (and d!7112 c!1602) b!22359))

(assert (= (and d!7112 (not c!1602)) b!22360))

(declare-fun m!31121 () Bool)

(assert (=> b!22360 m!31121))

(declare-fun m!31123 () Bool)

(assert (=> b!22358 m!31123))

(declare-fun m!31125 () Bool)

(assert (=> b!22358 m!31125))

(declare-fun m!31127 () Bool)

(assert (=> b!22359 m!31127))

(assert (=> b!22246 d!7112))

(declare-fun d!7114 () Bool)

(declare-fun res!19260 () Bool)

(declare-fun e!15130 () Bool)

(assert (=> d!7114 (=> (not res!19260) (not e!15130))))

(assert (=> d!7114 (= res!19260 (= (size!658 (buf!976 (_2!1382 lt!32356))) (size!658 (buf!976 (_2!1382 lt!32352)))))))

(assert (=> d!7114 (= (isPrefixOf!0 (_2!1382 lt!32356) (_2!1382 lt!32352)) e!15130)))

(declare-fun b!22361 () Bool)

(declare-fun res!19261 () Bool)

(assert (=> b!22361 (=> (not res!19261) (not e!15130))))

(assert (=> b!22361 (= res!19261 (bvsle (bitIndex!0 (size!658 (buf!976 (_2!1382 lt!32356))) (currentByte!2283 (_2!1382 lt!32356)) (currentBit!2278 (_2!1382 lt!32356))) (bitIndex!0 (size!658 (buf!976 (_2!1382 lt!32352))) (currentByte!2283 (_2!1382 lt!32352)) (currentBit!2278 (_2!1382 lt!32352)))))))

(declare-fun b!22362 () Bool)

(declare-fun e!15131 () Bool)

(assert (=> b!22362 (= e!15130 e!15131)))

(declare-fun res!19259 () Bool)

(assert (=> b!22362 (=> res!19259 e!15131)))

(assert (=> b!22362 (= res!19259 (= (size!658 (buf!976 (_2!1382 lt!32356))) #b00000000000000000000000000000000))))

(declare-fun b!22363 () Bool)

(assert (=> b!22363 (= e!15131 (arrayBitRangesEq!0 (buf!976 (_2!1382 lt!32356)) (buf!976 (_2!1382 lt!32352)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!658 (buf!976 (_2!1382 lt!32356))) (currentByte!2283 (_2!1382 lt!32356)) (currentBit!2278 (_2!1382 lt!32356)))))))

(assert (= (and d!7114 res!19260) b!22361))

(assert (= (and b!22361 res!19261) b!22362))

(assert (= (and b!22362 (not res!19259)) b!22363))

(declare-fun m!31129 () Bool)

(assert (=> b!22361 m!31129))

(assert (=> b!22361 m!30941))

(assert (=> b!22363 m!31129))

(assert (=> b!22363 m!31129))

(declare-fun m!31131 () Bool)

(assert (=> b!22363 m!31131))

(assert (=> b!22248 d!7114))

(declare-fun e!15142 () Bool)

(declare-fun lt!32502 () (_ BitVec 64))

(declare-fun lt!32487 () tuple2!2596)

(declare-fun b!22383 () Bool)

(declare-fun lt!32501 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1150 (_ BitVec 64)) BitStream!1150)

(assert (=> b!22383 (= e!15142 (= (_1!1383 lt!32487) (withMovedBitIndex!0 (_2!1383 lt!32487) (bvsub lt!32501 lt!32502))))))

(assert (=> b!22383 (or (= (bvand lt!32501 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!32502 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!32501 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!32501 lt!32502) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!22383 (= lt!32502 (bitIndex!0 (size!658 (buf!976 (_2!1382 lt!32356))) (currentByte!2283 (_2!1382 lt!32356)) (currentBit!2278 (_2!1382 lt!32356))))))

(assert (=> b!22383 (= lt!32501 (bitIndex!0 (size!658 (buf!976 thiss!1379)) (currentByte!2283 thiss!1379) (currentBit!2278 thiss!1379)))))

(declare-fun d!7116 () Bool)

(assert (=> d!7116 e!15142))

(declare-fun res!19279 () Bool)

(assert (=> d!7116 (=> (not res!19279) (not e!15142))))

(assert (=> d!7116 (= res!19279 (isPrefixOf!0 (_1!1383 lt!32487) (_2!1383 lt!32487)))))

(declare-fun lt!32500 () BitStream!1150)

(assert (=> d!7116 (= lt!32487 (tuple2!2597 lt!32500 (_2!1382 lt!32356)))))

(declare-fun lt!32490 () Unit!1926)

(declare-fun lt!32492 () Unit!1926)

(assert (=> d!7116 (= lt!32490 lt!32492)))

(assert (=> d!7116 (isPrefixOf!0 lt!32500 (_2!1382 lt!32356))))

(assert (=> d!7116 (= lt!32492 (lemmaIsPrefixTransitive!0 lt!32500 (_2!1382 lt!32356) (_2!1382 lt!32356)))))

(declare-fun lt!32493 () Unit!1926)

(declare-fun lt!32497 () Unit!1926)

(assert (=> d!7116 (= lt!32493 lt!32497)))

(assert (=> d!7116 (isPrefixOf!0 lt!32500 (_2!1382 lt!32356))))

(assert (=> d!7116 (= lt!32497 (lemmaIsPrefixTransitive!0 lt!32500 thiss!1379 (_2!1382 lt!32356)))))

(declare-fun lt!32491 () Unit!1926)

(declare-fun e!15143 () Unit!1926)

(assert (=> d!7116 (= lt!32491 e!15143)))

(declare-fun c!1606 () Bool)

(assert (=> d!7116 (= c!1606 (not (= (size!658 (buf!976 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!32494 () Unit!1926)

(declare-fun lt!32505 () Unit!1926)

(assert (=> d!7116 (= lt!32494 lt!32505)))

(assert (=> d!7116 (isPrefixOf!0 (_2!1382 lt!32356) (_2!1382 lt!32356))))

(assert (=> d!7116 (= lt!32505 (lemmaIsPrefixRefl!0 (_2!1382 lt!32356)))))

(declare-fun lt!32496 () Unit!1926)

(declare-fun lt!32489 () Unit!1926)

(assert (=> d!7116 (= lt!32496 lt!32489)))

(assert (=> d!7116 (= lt!32489 (lemmaIsPrefixRefl!0 (_2!1382 lt!32356)))))

(declare-fun lt!32503 () Unit!1926)

(declare-fun lt!32504 () Unit!1926)

(assert (=> d!7116 (= lt!32503 lt!32504)))

(assert (=> d!7116 (isPrefixOf!0 lt!32500 lt!32500)))

(assert (=> d!7116 (= lt!32504 (lemmaIsPrefixRefl!0 lt!32500))))

(declare-fun lt!32498 () Unit!1926)

(declare-fun lt!32488 () Unit!1926)

(assert (=> d!7116 (= lt!32498 lt!32488)))

(assert (=> d!7116 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!7116 (= lt!32488 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!7116 (= lt!32500 (BitStream!1151 (buf!976 (_2!1382 lt!32356)) (currentByte!2283 thiss!1379) (currentBit!2278 thiss!1379)))))

(assert (=> d!7116 (isPrefixOf!0 thiss!1379 (_2!1382 lt!32356))))

(assert (=> d!7116 (= (reader!0 thiss!1379 (_2!1382 lt!32356)) lt!32487)))

(declare-fun b!22384 () Bool)

(declare-fun lt!32506 () Unit!1926)

(assert (=> b!22384 (= e!15143 lt!32506)))

(declare-fun lt!32495 () (_ BitVec 64))

(assert (=> b!22384 (= lt!32495 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!32499 () (_ BitVec 64))

(assert (=> b!22384 (= lt!32499 (bitIndex!0 (size!658 (buf!976 thiss!1379)) (currentByte!2283 thiss!1379) (currentBit!2278 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1544 array!1544 (_ BitVec 64) (_ BitVec 64)) Unit!1926)

(assert (=> b!22384 (= lt!32506 (arrayBitRangesEqSymmetric!0 (buf!976 thiss!1379) (buf!976 (_2!1382 lt!32356)) lt!32495 lt!32499))))

(assert (=> b!22384 (arrayBitRangesEq!0 (buf!976 (_2!1382 lt!32356)) (buf!976 thiss!1379) lt!32495 lt!32499)))

(declare-fun b!22385 () Bool)

(declare-fun Unit!1940 () Unit!1926)

(assert (=> b!22385 (= e!15143 Unit!1940)))

(declare-fun b!22386 () Bool)

(declare-fun res!19278 () Bool)

(assert (=> b!22386 (=> (not res!19278) (not e!15142))))

(assert (=> b!22386 (= res!19278 (isPrefixOf!0 (_2!1383 lt!32487) (_2!1382 lt!32356)))))

(declare-fun b!22387 () Bool)

(declare-fun res!19277 () Bool)

(assert (=> b!22387 (=> (not res!19277) (not e!15142))))

(assert (=> b!22387 (= res!19277 (isPrefixOf!0 (_1!1383 lt!32487) thiss!1379))))

(assert (= (and d!7116 c!1606) b!22384))

(assert (= (and d!7116 (not c!1606)) b!22385))

(assert (= (and d!7116 res!19279) b!22387))

(assert (= (and b!22387 res!19277) b!22386))

(assert (= (and b!22386 res!19278) b!22383))

(declare-fun m!31139 () Bool)

(assert (=> b!22383 m!31139))

(assert (=> b!22383 m!31129))

(assert (=> b!22383 m!30947))

(declare-fun m!31141 () Bool)

(assert (=> d!7116 m!31141))

(declare-fun m!31143 () Bool)

(assert (=> d!7116 m!31143))

(assert (=> d!7116 m!30945))

(declare-fun m!31145 () Bool)

(assert (=> d!7116 m!31145))

(declare-fun m!31147 () Bool)

(assert (=> d!7116 m!31147))

(assert (=> d!7116 m!30973))

(declare-fun m!31149 () Bool)

(assert (=> d!7116 m!31149))

(declare-fun m!31151 () Bool)

(assert (=> d!7116 m!31151))

(assert (=> d!7116 m!30943))

(declare-fun m!31153 () Bool)

(assert (=> d!7116 m!31153))

(declare-fun m!31155 () Bool)

(assert (=> d!7116 m!31155))

(declare-fun m!31157 () Bool)

(assert (=> b!22387 m!31157))

(declare-fun m!31159 () Bool)

(assert (=> b!22386 m!31159))

(assert (=> b!22384 m!30947))

(declare-fun m!31161 () Bool)

(assert (=> b!22384 m!31161))

(declare-fun m!31163 () Bool)

(assert (=> b!22384 m!31163))

(assert (=> b!22248 d!7116))

(declare-fun b!22538 () Bool)

(declare-fun res!19403 () Bool)

(declare-fun e!15215 () Bool)

(assert (=> b!22538 (=> (not res!19403) (not e!15215))))

(declare-fun lt!32999 () tuple2!2594)

(assert (=> b!22538 (= res!19403 (= (size!658 (buf!976 (_2!1382 lt!32356))) (size!658 (buf!976 (_2!1382 lt!32999)))))))

(declare-fun b!22539 () Bool)

(declare-fun e!15216 () tuple2!2594)

(declare-fun lt!32983 () tuple2!2594)

(declare-fun Unit!1941 () Unit!1926)

(assert (=> b!22539 (= e!15216 (tuple2!2595 Unit!1941 (_2!1382 lt!32983)))))

(declare-fun lt!32976 () tuple2!2594)

(assert (=> b!22539 (= lt!32976 (appendBitFromByte!0 (_2!1382 lt!32356) (select (arr!1111 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!32992 () (_ BitVec 64))

(assert (=> b!22539 (= lt!32992 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!33001 () (_ BitVec 64))

(assert (=> b!22539 (= lt!33001 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!32984 () Unit!1926)

(assert (=> b!22539 (= lt!32984 (validateOffsetBitsIneqLemma!0 (_2!1382 lt!32356) (_2!1382 lt!32976) lt!32992 lt!33001))))

(assert (=> b!22539 (validate_offset_bits!1 ((_ sign_extend 32) (size!658 (buf!976 (_2!1382 lt!32976)))) ((_ sign_extend 32) (currentByte!2283 (_2!1382 lt!32976))) ((_ sign_extend 32) (currentBit!2278 (_2!1382 lt!32976))) (bvsub lt!32992 lt!33001))))

(declare-fun lt!32974 () Unit!1926)

(assert (=> b!22539 (= lt!32974 lt!32984)))

(declare-fun lt!32986 () tuple2!2596)

(assert (=> b!22539 (= lt!32986 (reader!0 (_2!1382 lt!32356) (_2!1382 lt!32976)))))

(declare-fun lt!32968 () (_ BitVec 64))

(assert (=> b!22539 (= lt!32968 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!32981 () Unit!1926)

(assert (=> b!22539 (= lt!32981 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1382 lt!32356) (buf!976 (_2!1382 lt!32976)) lt!32968))))

(assert (=> b!22539 (validate_offset_bits!1 ((_ sign_extend 32) (size!658 (buf!976 (_2!1382 lt!32976)))) ((_ sign_extend 32) (currentByte!2283 (_2!1382 lt!32356))) ((_ sign_extend 32) (currentBit!2278 (_2!1382 lt!32356))) lt!32968)))

(declare-fun lt!32982 () Unit!1926)

(assert (=> b!22539 (= lt!32982 lt!32981)))

(assert (=> b!22539 (= (head!113 (byteArrayBitContentToList!0 (_2!1382 lt!32976) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!113 (bitStreamReadBitsIntoList!0 (_2!1382 lt!32976) (_1!1383 lt!32986) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!32989 () Unit!1926)

(declare-fun Unit!1942 () Unit!1926)

(assert (=> b!22539 (= lt!32989 Unit!1942)))

(assert (=> b!22539 (= lt!32983 (appendBitsMSBFirstLoop!0 (_2!1382 lt!32976) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!32985 () Unit!1926)

(assert (=> b!22539 (= lt!32985 (lemmaIsPrefixTransitive!0 (_2!1382 lt!32356) (_2!1382 lt!32976) (_2!1382 lt!32983)))))

(assert (=> b!22539 (isPrefixOf!0 (_2!1382 lt!32356) (_2!1382 lt!32983))))

(declare-fun lt!32975 () Unit!1926)

(assert (=> b!22539 (= lt!32975 lt!32985)))

(assert (=> b!22539 (= (size!658 (buf!976 (_2!1382 lt!32983))) (size!658 (buf!976 (_2!1382 lt!32356))))))

(declare-fun lt!32990 () Unit!1926)

(declare-fun Unit!1943 () Unit!1926)

(assert (=> b!22539 (= lt!32990 Unit!1943)))

(assert (=> b!22539 (= (bitIndex!0 (size!658 (buf!976 (_2!1382 lt!32983))) (currentByte!2283 (_2!1382 lt!32983)) (currentBit!2278 (_2!1382 lt!32983))) (bvsub (bvadd (bitIndex!0 (size!658 (buf!976 (_2!1382 lt!32356))) (currentByte!2283 (_2!1382 lt!32356)) (currentBit!2278 (_2!1382 lt!32356))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!33006 () Unit!1926)

(declare-fun Unit!1944 () Unit!1926)

(assert (=> b!22539 (= lt!33006 Unit!1944)))

(assert (=> b!22539 (= (bitIndex!0 (size!658 (buf!976 (_2!1382 lt!32983))) (currentByte!2283 (_2!1382 lt!32983)) (currentBit!2278 (_2!1382 lt!32983))) (bvsub (bvsub (bvadd (bitIndex!0 (size!658 (buf!976 (_2!1382 lt!32976))) (currentByte!2283 (_2!1382 lt!32976)) (currentBit!2278 (_2!1382 lt!32976))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!32979 () Unit!1926)

(declare-fun Unit!1945 () Unit!1926)

(assert (=> b!22539 (= lt!32979 Unit!1945)))

(declare-fun lt!33002 () tuple2!2596)

(declare-fun call!326 () tuple2!2596)

(assert (=> b!22539 (= lt!33002 call!326)))

(declare-fun lt!32994 () (_ BitVec 64))

(assert (=> b!22539 (= lt!32994 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!32995 () Unit!1926)

(assert (=> b!22539 (= lt!32995 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1382 lt!32356) (buf!976 (_2!1382 lt!32983)) lt!32994))))

(assert (=> b!22539 (validate_offset_bits!1 ((_ sign_extend 32) (size!658 (buf!976 (_2!1382 lt!32983)))) ((_ sign_extend 32) (currentByte!2283 (_2!1382 lt!32356))) ((_ sign_extend 32) (currentBit!2278 (_2!1382 lt!32356))) lt!32994)))

(declare-fun lt!32980 () Unit!1926)

(assert (=> b!22539 (= lt!32980 lt!32995)))

(declare-fun lt!32977 () tuple2!2596)

(assert (=> b!22539 (= lt!32977 (reader!0 (_2!1382 lt!32976) (_2!1382 lt!32983)))))

(declare-fun lt!32972 () (_ BitVec 64))

(assert (=> b!22539 (= lt!32972 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!32988 () Unit!1926)

(assert (=> b!22539 (= lt!32988 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1382 lt!32976) (buf!976 (_2!1382 lt!32983)) lt!32972))))

(assert (=> b!22539 (validate_offset_bits!1 ((_ sign_extend 32) (size!658 (buf!976 (_2!1382 lt!32983)))) ((_ sign_extend 32) (currentByte!2283 (_2!1382 lt!32976))) ((_ sign_extend 32) (currentBit!2278 (_2!1382 lt!32976))) lt!32972)))

(declare-fun lt!32965 () Unit!1926)

(assert (=> b!22539 (= lt!32965 lt!32988)))

(declare-fun lt!32971 () List!276)

(assert (=> b!22539 (= lt!32971 (byteArrayBitContentToList!0 (_2!1382 lt!32983) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!32966 () List!276)

(assert (=> b!22539 (= lt!32966 (byteArrayBitContentToList!0 (_2!1382 lt!32983) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!32978 () List!276)

(assert (=> b!22539 (= lt!32978 (bitStreamReadBitsIntoList!0 (_2!1382 lt!32983) (_1!1383 lt!33002) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!32993 () List!276)

(assert (=> b!22539 (= lt!32993 (bitStreamReadBitsIntoList!0 (_2!1382 lt!32983) (_1!1383 lt!32977) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!33004 () (_ BitVec 64))

(assert (=> b!22539 (= lt!33004 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!33003 () Unit!1926)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1150 BitStream!1150 BitStream!1150 BitStream!1150 (_ BitVec 64) List!276) Unit!1926)

(assert (=> b!22539 (= lt!33003 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1382 lt!32983) (_2!1382 lt!32983) (_1!1383 lt!33002) (_1!1383 lt!32977) lt!33004 lt!32978))))

(declare-fun tail!84 (List!276) List!276)

(assert (=> b!22539 (= (bitStreamReadBitsIntoList!0 (_2!1382 lt!32983) (_1!1383 lt!32977) (bvsub lt!33004 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!84 lt!32978))))

(declare-fun lt!32964 () Unit!1926)

(assert (=> b!22539 (= lt!32964 lt!33003)))

(declare-fun lt!32967 () (_ BitVec 64))

(declare-fun lt!32987 () Unit!1926)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1544 array!1544 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!1926)

(assert (=> b!22539 (= lt!32987 (arrayBitRangesEqImpliesEq!0 (buf!976 (_2!1382 lt!32976)) (buf!976 (_2!1382 lt!32983)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!32967 (bitIndex!0 (size!658 (buf!976 (_2!1382 lt!32976))) (currentByte!2283 (_2!1382 lt!32976)) (currentBit!2278 (_2!1382 lt!32976)))))))

(declare-fun bitAt!0 (array!1544 (_ BitVec 64)) Bool)

(assert (=> b!22539 (= (bitAt!0 (buf!976 (_2!1382 lt!32976)) lt!32967) (bitAt!0 (buf!976 (_2!1382 lt!32983)) lt!32967))))

(declare-fun lt!32991 () Unit!1926)

(assert (=> b!22539 (= lt!32991 lt!32987)))

(declare-fun b!22540 () Bool)

(declare-fun lt!32997 () tuple2!2596)

(assert (=> b!22540 (= e!15215 (= (bitStreamReadBitsIntoList!0 (_2!1382 lt!32999) (_1!1383 lt!32997) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!1382 lt!32999) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!22540 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!22540 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!33007 () Unit!1926)

(declare-fun lt!32969 () Unit!1926)

(assert (=> b!22540 (= lt!33007 lt!32969)))

(declare-fun lt!32970 () (_ BitVec 64))

(assert (=> b!22540 (validate_offset_bits!1 ((_ sign_extend 32) (size!658 (buf!976 (_2!1382 lt!32999)))) ((_ sign_extend 32) (currentByte!2283 (_2!1382 lt!32356))) ((_ sign_extend 32) (currentBit!2278 (_2!1382 lt!32356))) lt!32970)))

(assert (=> b!22540 (= lt!32969 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1382 lt!32356) (buf!976 (_2!1382 lt!32999)) lt!32970))))

(declare-fun e!15214 () Bool)

(assert (=> b!22540 e!15214))

(declare-fun res!19400 () Bool)

(assert (=> b!22540 (=> (not res!19400) (not e!15214))))

(assert (=> b!22540 (= res!19400 (and (= (size!658 (buf!976 (_2!1382 lt!32356))) (size!658 (buf!976 (_2!1382 lt!32999)))) (bvsge lt!32970 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!22540 (= lt!32970 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!22540 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!22540 (= lt!32997 (reader!0 (_2!1382 lt!32356) (_2!1382 lt!32999)))))

(declare-fun d!7124 () Bool)

(assert (=> d!7124 e!15215))

(declare-fun res!19402 () Bool)

(assert (=> d!7124 (=> (not res!19402) (not e!15215))))

(declare-fun lt!32973 () (_ BitVec 64))

(assert (=> d!7124 (= res!19402 (= (bitIndex!0 (size!658 (buf!976 (_2!1382 lt!32999))) (currentByte!2283 (_2!1382 lt!32999)) (currentBit!2278 (_2!1382 lt!32999))) (bvsub lt!32973 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!7124 (or (= (bvand lt!32973 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!32973 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!32973 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!32998 () (_ BitVec 64))

(assert (=> d!7124 (= lt!32973 (bvadd lt!32998 to!314))))

(assert (=> d!7124 (or (not (= (bvand lt!32998 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!32998 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!32998 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!7124 (= lt!32998 (bitIndex!0 (size!658 (buf!976 (_2!1382 lt!32356))) (currentByte!2283 (_2!1382 lt!32356)) (currentBit!2278 (_2!1382 lt!32356))))))

(assert (=> d!7124 (= lt!32999 e!15216)))

(declare-fun c!1621 () Bool)

(assert (=> d!7124 (= c!1621 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!32996 () Unit!1926)

(declare-fun lt!33000 () Unit!1926)

(assert (=> d!7124 (= lt!32996 lt!33000)))

(assert (=> d!7124 (isPrefixOf!0 (_2!1382 lt!32356) (_2!1382 lt!32356))))

(assert (=> d!7124 (= lt!33000 (lemmaIsPrefixRefl!0 (_2!1382 lt!32356)))))

(assert (=> d!7124 (= lt!32967 (bitIndex!0 (size!658 (buf!976 (_2!1382 lt!32356))) (currentByte!2283 (_2!1382 lt!32356)) (currentBit!2278 (_2!1382 lt!32356))))))

(assert (=> d!7124 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!7124 (= (appendBitsMSBFirstLoop!0 (_2!1382 lt!32356) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!32999)))

(declare-fun bm!323 () Bool)

(assert (=> bm!323 (= call!326 (reader!0 (_2!1382 lt!32356) (ite c!1621 (_2!1382 lt!32983) (_2!1382 lt!32356))))))

(declare-fun b!22541 () Bool)

(declare-fun Unit!1946 () Unit!1926)

(assert (=> b!22541 (= e!15216 (tuple2!2595 Unit!1946 (_2!1382 lt!32356)))))

(assert (=> b!22541 (= (size!658 (buf!976 (_2!1382 lt!32356))) (size!658 (buf!976 (_2!1382 lt!32356))))))

(declare-fun lt!33005 () Unit!1926)

(declare-fun Unit!1947 () Unit!1926)

(assert (=> b!22541 (= lt!33005 Unit!1947)))

(declare-fun checkByteArrayBitContent!0 (BitStream!1150 array!1544 array!1544 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!2618 0))(
  ( (tuple2!2619 (_1!1394 array!1544) (_2!1394 BitStream!1150)) )
))
(declare-fun readBits!0 (BitStream!1150 (_ BitVec 64)) tuple2!2618)

(assert (=> b!22541 (checkByteArrayBitContent!0 (_2!1382 lt!32356) srcBuffer!2 (_1!1394 (readBits!0 (_1!1383 call!326) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!22542 () Bool)

(declare-fun res!19404 () Bool)

(assert (=> b!22542 (=> (not res!19404) (not e!15215))))

(assert (=> b!22542 (= res!19404 (invariant!0 (currentBit!2278 (_2!1382 lt!32999)) (currentByte!2283 (_2!1382 lt!32999)) (size!658 (buf!976 (_2!1382 lt!32999)))))))

(declare-fun b!22543 () Bool)

(declare-fun res!19405 () Bool)

(assert (=> b!22543 (=> (not res!19405) (not e!15215))))

(assert (=> b!22543 (= res!19405 (= (size!658 (buf!976 (_2!1382 lt!32999))) (size!658 (buf!976 (_2!1382 lt!32356)))))))

(declare-fun b!22544 () Bool)

(assert (=> b!22544 (= e!15214 (validate_offset_bits!1 ((_ sign_extend 32) (size!658 (buf!976 (_2!1382 lt!32356)))) ((_ sign_extend 32) (currentByte!2283 (_2!1382 lt!32356))) ((_ sign_extend 32) (currentBit!2278 (_2!1382 lt!32356))) lt!32970))))

(declare-fun b!22545 () Bool)

(declare-fun res!19401 () Bool)

(assert (=> b!22545 (=> (not res!19401) (not e!15215))))

(assert (=> b!22545 (= res!19401 (isPrefixOf!0 (_2!1382 lt!32356) (_2!1382 lt!32999)))))

(assert (= (and d!7124 c!1621) b!22539))

(assert (= (and d!7124 (not c!1621)) b!22541))

(assert (= (or b!22539 b!22541) bm!323))

(assert (= (and d!7124 res!19402) b!22542))

(assert (= (and b!22542 res!19404) b!22538))

(assert (= (and b!22538 res!19403) b!22545))

(assert (= (and b!22545 res!19401) b!22543))

(assert (= (and b!22543 res!19405) b!22540))

(assert (= (and b!22540 res!19400) b!22544))

(declare-fun m!31383 () Bool)

(assert (=> b!22539 m!31383))

(declare-fun m!31385 () Bool)

(assert (=> b!22539 m!31385))

(assert (=> b!22539 m!31129))

(declare-fun m!31387 () Bool)

(assert (=> b!22539 m!31387))

(declare-fun m!31389 () Bool)

(assert (=> b!22539 m!31389))

(declare-fun m!31391 () Bool)

(assert (=> b!22539 m!31391))

(declare-fun m!31393 () Bool)

(assert (=> b!22539 m!31393))

(declare-fun m!31395 () Bool)

(assert (=> b!22539 m!31395))

(declare-fun m!31397 () Bool)

(assert (=> b!22539 m!31397))

(declare-fun m!31399 () Bool)

(assert (=> b!22539 m!31399))

(declare-fun m!31401 () Bool)

(assert (=> b!22539 m!31401))

(declare-fun m!31403 () Bool)

(assert (=> b!22539 m!31403))

(declare-fun m!31405 () Bool)

(assert (=> b!22539 m!31405))

(declare-fun m!31407 () Bool)

(assert (=> b!22539 m!31407))

(declare-fun m!31409 () Bool)

(assert (=> b!22539 m!31409))

(declare-fun m!31411 () Bool)

(assert (=> b!22539 m!31411))

(assert (=> b!22539 m!31403))

(declare-fun m!31413 () Bool)

(assert (=> b!22539 m!31413))

(assert (=> b!22539 m!31391))

(declare-fun m!31415 () Bool)

(assert (=> b!22539 m!31415))

(declare-fun m!31417 () Bool)

(assert (=> b!22539 m!31417))

(declare-fun m!31419 () Bool)

(assert (=> b!22539 m!31419))

(assert (=> b!22539 m!31415))

(declare-fun m!31421 () Bool)

(assert (=> b!22539 m!31421))

(declare-fun m!31423 () Bool)

(assert (=> b!22539 m!31423))

(declare-fun m!31425 () Bool)

(assert (=> b!22539 m!31425))

(declare-fun m!31427 () Bool)

(assert (=> b!22539 m!31427))

(declare-fun m!31429 () Bool)

(assert (=> b!22539 m!31429))

(declare-fun m!31431 () Bool)

(assert (=> b!22539 m!31431))

(declare-fun m!31433 () Bool)

(assert (=> b!22539 m!31433))

(declare-fun m!31435 () Bool)

(assert (=> b!22539 m!31435))

(declare-fun m!31437 () Bool)

(assert (=> b!22539 m!31437))

(declare-fun m!31439 () Bool)

(assert (=> b!22539 m!31439))

(assert (=> b!22539 m!31411))

(declare-fun m!31441 () Bool)

(assert (=> b!22539 m!31441))

(declare-fun m!31443 () Bool)

(assert (=> b!22539 m!31443))

(declare-fun m!31445 () Bool)

(assert (=> d!7124 m!31445))

(assert (=> d!7124 m!31129))

(assert (=> d!7124 m!31143))

(assert (=> d!7124 m!31149))

(declare-fun m!31447 () Bool)

(assert (=> b!22542 m!31447))

(declare-fun m!31449 () Bool)

(assert (=> b!22540 m!31449))

(declare-fun m!31451 () Bool)

(assert (=> b!22540 m!31451))

(declare-fun m!31453 () Bool)

(assert (=> b!22540 m!31453))

(declare-fun m!31455 () Bool)

(assert (=> b!22540 m!31455))

(declare-fun m!31457 () Bool)

(assert (=> b!22540 m!31457))

(declare-fun m!31459 () Bool)

(assert (=> b!22545 m!31459))

(declare-fun m!31461 () Bool)

(assert (=> b!22544 m!31461))

(declare-fun m!31463 () Bool)

(assert (=> bm!323 m!31463))

(declare-fun m!31465 () Bool)

(assert (=> b!22541 m!31465))

(declare-fun m!31467 () Bool)

(assert (=> b!22541 m!31467))

(assert (=> b!22248 d!7124))

(declare-fun d!7174 () Bool)

(declare-fun res!19407 () Bool)

(declare-fun e!15223 () Bool)

(assert (=> d!7174 (=> (not res!19407) (not e!15223))))

(assert (=> d!7174 (= res!19407 (= (size!658 (buf!976 thiss!1379)) (size!658 (buf!976 (_2!1382 lt!32352)))))))

(assert (=> d!7174 (= (isPrefixOf!0 thiss!1379 (_2!1382 lt!32352)) e!15223)))

(declare-fun b!22558 () Bool)

(declare-fun res!19408 () Bool)

(assert (=> b!22558 (=> (not res!19408) (not e!15223))))

(assert (=> b!22558 (= res!19408 (bvsle (bitIndex!0 (size!658 (buf!976 thiss!1379)) (currentByte!2283 thiss!1379) (currentBit!2278 thiss!1379)) (bitIndex!0 (size!658 (buf!976 (_2!1382 lt!32352))) (currentByte!2283 (_2!1382 lt!32352)) (currentBit!2278 (_2!1382 lt!32352)))))))

(declare-fun b!22559 () Bool)

(declare-fun e!15224 () Bool)

(assert (=> b!22559 (= e!15223 e!15224)))

(declare-fun res!19406 () Bool)

(assert (=> b!22559 (=> res!19406 e!15224)))

(assert (=> b!22559 (= res!19406 (= (size!658 (buf!976 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!22560 () Bool)

(assert (=> b!22560 (= e!15224 (arrayBitRangesEq!0 (buf!976 thiss!1379) (buf!976 (_2!1382 lt!32352)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!658 (buf!976 thiss!1379)) (currentByte!2283 thiss!1379) (currentBit!2278 thiss!1379))))))

(assert (= (and d!7174 res!19407) b!22558))

(assert (= (and b!22558 res!19408) b!22559))

(assert (= (and b!22559 (not res!19406)) b!22560))

(assert (=> b!22558 m!30947))

(assert (=> b!22558 m!30941))

(assert (=> b!22560 m!30947))

(assert (=> b!22560 m!30947))

(declare-fun m!31477 () Bool)

(assert (=> b!22560 m!31477))

(assert (=> b!22248 d!7174))

(declare-fun d!7180 () Bool)

(assert (=> d!7180 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!658 (buf!976 (_2!1382 lt!32356)))) ((_ sign_extend 32) (currentByte!2283 thiss!1379)) ((_ sign_extend 32) (currentBit!2278 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!658 (buf!976 (_2!1382 lt!32356)))) ((_ sign_extend 32) (currentByte!2283 thiss!1379)) ((_ sign_extend 32) (currentBit!2278 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!2073 () Bool)

(assert (= bs!2073 d!7180))

(declare-fun m!31481 () Bool)

(assert (=> bs!2073 m!31481))

(assert (=> b!22248 d!7180))

(declare-fun d!7184 () Bool)

(assert (=> d!7184 (isPrefixOf!0 thiss!1379 (_2!1382 lt!32352))))

(declare-fun lt!33028 () Unit!1926)

(declare-fun choose!30 (BitStream!1150 BitStream!1150 BitStream!1150) Unit!1926)

(assert (=> d!7184 (= lt!33028 (choose!30 thiss!1379 (_2!1382 lt!32356) (_2!1382 lt!32352)))))

(assert (=> d!7184 (isPrefixOf!0 thiss!1379 (_2!1382 lt!32356))))

(assert (=> d!7184 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1382 lt!32356) (_2!1382 lt!32352)) lt!33028)))

(declare-fun bs!2076 () Bool)

(assert (= bs!2076 d!7184))

(assert (=> bs!2076 m!30955))

(declare-fun m!31485 () Bool)

(assert (=> bs!2076 m!31485))

(assert (=> bs!2076 m!30973))

(assert (=> b!22248 d!7184))

(declare-fun d!7188 () Bool)

(assert (=> d!7188 (validate_offset_bits!1 ((_ sign_extend 32) (size!658 (buf!976 (_2!1382 lt!32356)))) ((_ sign_extend 32) (currentByte!2283 thiss!1379)) ((_ sign_extend 32) (currentBit!2278 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!33031 () Unit!1926)

(declare-fun choose!9 (BitStream!1150 array!1544 (_ BitVec 64) BitStream!1150) Unit!1926)

(assert (=> d!7188 (= lt!33031 (choose!9 thiss!1379 (buf!976 (_2!1382 lt!32356)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1151 (buf!976 (_2!1382 lt!32356)) (currentByte!2283 thiss!1379) (currentBit!2278 thiss!1379))))))

(assert (=> d!7188 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!976 (_2!1382 lt!32356)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!33031)))

(declare-fun bs!2077 () Bool)

(assert (= bs!2077 d!7188))

(assert (=> bs!2077 m!30965))

(declare-fun m!31487 () Bool)

(assert (=> bs!2077 m!31487))

(assert (=> b!22248 d!7188))

(declare-fun d!7190 () Bool)

(declare-fun res!19415 () Bool)

(declare-fun e!15228 () Bool)

(assert (=> d!7190 (=> (not res!19415) (not e!15228))))

(assert (=> d!7190 (= res!19415 (= (size!658 (buf!976 thiss!1379)) (size!658 (buf!976 (_2!1382 lt!32356)))))))

(assert (=> d!7190 (= (isPrefixOf!0 thiss!1379 (_2!1382 lt!32356)) e!15228)))

(declare-fun b!22566 () Bool)

(declare-fun res!19416 () Bool)

(assert (=> b!22566 (=> (not res!19416) (not e!15228))))

(assert (=> b!22566 (= res!19416 (bvsle (bitIndex!0 (size!658 (buf!976 thiss!1379)) (currentByte!2283 thiss!1379) (currentBit!2278 thiss!1379)) (bitIndex!0 (size!658 (buf!976 (_2!1382 lt!32356))) (currentByte!2283 (_2!1382 lt!32356)) (currentBit!2278 (_2!1382 lt!32356)))))))

(declare-fun b!22567 () Bool)

(declare-fun e!15229 () Bool)

(assert (=> b!22567 (= e!15228 e!15229)))

(declare-fun res!19414 () Bool)

(assert (=> b!22567 (=> res!19414 e!15229)))

(assert (=> b!22567 (= res!19414 (= (size!658 (buf!976 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!22568 () Bool)

(assert (=> b!22568 (= e!15229 (arrayBitRangesEq!0 (buf!976 thiss!1379) (buf!976 (_2!1382 lt!32356)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!658 (buf!976 thiss!1379)) (currentByte!2283 thiss!1379) (currentBit!2278 thiss!1379))))))

(assert (= (and d!7190 res!19415) b!22566))

(assert (= (and b!22566 res!19416) b!22567))

(assert (= (and b!22567 (not res!19414)) b!22568))

(assert (=> b!22566 m!30947))

(assert (=> b!22566 m!31129))

(assert (=> b!22568 m!30947))

(assert (=> b!22568 m!30947))

(declare-fun m!31489 () Bool)

(assert (=> b!22568 m!31489))

(assert (=> b!22253 d!7190))

(declare-fun d!7192 () Bool)

(assert (=> d!7192 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!658 (buf!976 (_2!1382 lt!32356)))) ((_ sign_extend 32) (currentByte!2283 (_2!1382 lt!32356))) ((_ sign_extend 32) (currentBit!2278 (_2!1382 lt!32356))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!658 (buf!976 (_2!1382 lt!32356)))) ((_ sign_extend 32) (currentByte!2283 (_2!1382 lt!32356))) ((_ sign_extend 32) (currentBit!2278 (_2!1382 lt!32356)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!2078 () Bool)

(assert (= bs!2078 d!7192))

(declare-fun m!31491 () Bool)

(assert (=> bs!2078 m!31491))

(assert (=> b!22253 d!7192))

(declare-fun d!7194 () Bool)

(declare-fun e!15232 () Bool)

(assert (=> d!7194 e!15232))

(declare-fun res!19419 () Bool)

(assert (=> d!7194 (=> (not res!19419) (not e!15232))))

(assert (=> d!7194 (= res!19419 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!33034 () Unit!1926)

(declare-fun choose!27 (BitStream!1150 BitStream!1150 (_ BitVec 64) (_ BitVec 64)) Unit!1926)

(assert (=> d!7194 (= lt!33034 (choose!27 thiss!1379 (_2!1382 lt!32356) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!7194 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!7194 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1382 lt!32356) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!33034)))

(declare-fun b!22571 () Bool)

(assert (=> b!22571 (= e!15232 (validate_offset_bits!1 ((_ sign_extend 32) (size!658 (buf!976 (_2!1382 lt!32356)))) ((_ sign_extend 32) (currentByte!2283 (_2!1382 lt!32356))) ((_ sign_extend 32) (currentBit!2278 (_2!1382 lt!32356))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!7194 res!19419) b!22571))

(declare-fun m!31493 () Bool)

(assert (=> d!7194 m!31493))

(assert (=> b!22571 m!30975))

(assert (=> b!22253 d!7194))

(declare-fun d!7196 () Bool)

(declare-fun e!15242 () Bool)

(assert (=> d!7196 e!15242))

(declare-fun res!19440 () Bool)

(assert (=> d!7196 (=> (not res!19440) (not e!15242))))

(declare-fun lt!33060 () tuple2!2594)

(assert (=> d!7196 (= res!19440 (= (size!658 (buf!976 (_2!1382 lt!33060))) (size!658 (buf!976 thiss!1379))))))

(declare-fun lt!33068 () (_ BitVec 8))

(declare-fun lt!33063 () array!1544)

(assert (=> d!7196 (= lt!33068 (select (arr!1111 lt!33063) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!7196 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!658 lt!33063)))))

(assert (=> d!7196 (= lt!33063 (array!1545 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!33062 () tuple2!2594)

(assert (=> d!7196 (= lt!33060 (tuple2!2595 (_1!1382 lt!33062) (_2!1382 lt!33062)))))

(declare-fun lt!33069 () tuple2!2594)

(assert (=> d!7196 (= lt!33062 lt!33069)))

(declare-fun e!15243 () Bool)

(assert (=> d!7196 e!15243))

(declare-fun res!19437 () Bool)

(assert (=> d!7196 (=> (not res!19437) (not e!15243))))

(assert (=> d!7196 (= res!19437 (= (size!658 (buf!976 thiss!1379)) (size!658 (buf!976 (_2!1382 lt!33069)))))))

(declare-fun lt!33061 () Bool)

(declare-fun appendBit!0 (BitStream!1150 Bool) tuple2!2594)

(assert (=> d!7196 (= lt!33069 (appendBit!0 thiss!1379 lt!33061))))

(assert (=> d!7196 (= lt!33061 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1111 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!7196 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!7196 (= (appendBitFromByte!0 thiss!1379 (select (arr!1111 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!33060)))

(declare-fun b!22589 () Bool)

(declare-fun res!19439 () Bool)

(assert (=> b!22589 (=> (not res!19439) (not e!15243))))

(assert (=> b!22589 (= res!19439 (= (bitIndex!0 (size!658 (buf!976 (_2!1382 lt!33069))) (currentByte!2283 (_2!1382 lt!33069)) (currentBit!2278 (_2!1382 lt!33069))) (bvadd (bitIndex!0 (size!658 (buf!976 thiss!1379)) (currentByte!2283 thiss!1379) (currentBit!2278 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!22590 () Bool)

(declare-fun res!19438 () Bool)

(assert (=> b!22590 (=> (not res!19438) (not e!15242))))

(declare-fun lt!33066 () (_ BitVec 64))

(declare-fun lt!33065 () (_ BitVec 64))

(assert (=> b!22590 (= res!19438 (= (bitIndex!0 (size!658 (buf!976 (_2!1382 lt!33060))) (currentByte!2283 (_2!1382 lt!33060)) (currentBit!2278 (_2!1382 lt!33060))) (bvadd lt!33066 lt!33065)))))

(assert (=> b!22590 (or (not (= (bvand lt!33066 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!33065 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!33066 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!33066 lt!33065) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!22590 (= lt!33065 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!22590 (= lt!33066 (bitIndex!0 (size!658 (buf!976 thiss!1379)) (currentByte!2283 thiss!1379) (currentBit!2278 thiss!1379)))))

(declare-fun b!22591 () Bool)

(declare-fun res!19443 () Bool)

(assert (=> b!22591 (=> (not res!19443) (not e!15243))))

(assert (=> b!22591 (= res!19443 (isPrefixOf!0 thiss!1379 (_2!1382 lt!33069)))))

(declare-fun b!22592 () Bool)

(declare-fun res!19441 () Bool)

(assert (=> b!22592 (=> (not res!19441) (not e!15242))))

(assert (=> b!22592 (= res!19441 (isPrefixOf!0 thiss!1379 (_2!1382 lt!33060)))))

(declare-fun b!22593 () Bool)

(declare-fun e!15241 () Bool)

(declare-datatypes ((tuple2!2620 0))(
  ( (tuple2!2621 (_1!1395 BitStream!1150) (_2!1395 Bool)) )
))
(declare-fun lt!33070 () tuple2!2620)

(assert (=> b!22593 (= e!15241 (= (bitIndex!0 (size!658 (buf!976 (_1!1395 lt!33070))) (currentByte!2283 (_1!1395 lt!33070)) (currentBit!2278 (_1!1395 lt!33070))) (bitIndex!0 (size!658 (buf!976 (_2!1382 lt!33069))) (currentByte!2283 (_2!1382 lt!33069)) (currentBit!2278 (_2!1382 lt!33069)))))))

(declare-fun b!22594 () Bool)

(assert (=> b!22594 (= e!15243 e!15241)))

(declare-fun res!19442 () Bool)

(assert (=> b!22594 (=> (not res!19442) (not e!15241))))

(assert (=> b!22594 (= res!19442 (and (= (_2!1395 lt!33070) lt!33061) (= (_1!1395 lt!33070) (_2!1382 lt!33069))))))

(declare-fun readBitPure!0 (BitStream!1150) tuple2!2620)

(declare-fun readerFrom!0 (BitStream!1150 (_ BitVec 32) (_ BitVec 32)) BitStream!1150)

(assert (=> b!22594 (= lt!33070 (readBitPure!0 (readerFrom!0 (_2!1382 lt!33069) (currentBit!2278 thiss!1379) (currentByte!2283 thiss!1379))))))

(declare-fun b!22595 () Bool)

(declare-fun e!15244 () Bool)

(assert (=> b!22595 (= e!15242 e!15244)))

(declare-fun res!19436 () Bool)

(assert (=> b!22595 (=> (not res!19436) (not e!15244))))

(declare-fun lt!33059 () tuple2!2620)

(assert (=> b!22595 (= res!19436 (and (= (_2!1395 lt!33059) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1111 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!33068)) #b00000000000000000000000000000000))) (= (_1!1395 lt!33059) (_2!1382 lt!33060))))))

(declare-fun lt!33064 () tuple2!2618)

(declare-fun lt!33067 () BitStream!1150)

(assert (=> b!22595 (= lt!33064 (readBits!0 lt!33067 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!22595 (= lt!33059 (readBitPure!0 lt!33067))))

(assert (=> b!22595 (= lt!33067 (readerFrom!0 (_2!1382 lt!33060) (currentBit!2278 thiss!1379) (currentByte!2283 thiss!1379)))))

(declare-fun b!22596 () Bool)

(assert (=> b!22596 (= e!15244 (= (bitIndex!0 (size!658 (buf!976 (_1!1395 lt!33059))) (currentByte!2283 (_1!1395 lt!33059)) (currentBit!2278 (_1!1395 lt!33059))) (bitIndex!0 (size!658 (buf!976 (_2!1382 lt!33060))) (currentByte!2283 (_2!1382 lt!33060)) (currentBit!2278 (_2!1382 lt!33060)))))))

(assert (= (and d!7196 res!19437) b!22589))

(assert (= (and b!22589 res!19439) b!22591))

(assert (= (and b!22591 res!19443) b!22594))

(assert (= (and b!22594 res!19442) b!22593))

(assert (= (and d!7196 res!19440) b!22590))

(assert (= (and b!22590 res!19438) b!22592))

(assert (= (and b!22592 res!19441) b!22595))

(assert (= (and b!22595 res!19436) b!22596))

(declare-fun m!31495 () Bool)

(assert (=> b!22594 m!31495))

(assert (=> b!22594 m!31495))

(declare-fun m!31497 () Bool)

(assert (=> b!22594 m!31497))

(declare-fun m!31499 () Bool)

(assert (=> b!22595 m!31499))

(declare-fun m!31501 () Bool)

(assert (=> b!22595 m!31501))

(declare-fun m!31503 () Bool)

(assert (=> b!22595 m!31503))

(declare-fun m!31505 () Bool)

(assert (=> b!22596 m!31505))

(declare-fun m!31507 () Bool)

(assert (=> b!22596 m!31507))

(declare-fun m!31509 () Bool)

(assert (=> b!22591 m!31509))

(declare-fun m!31511 () Bool)

(assert (=> b!22592 m!31511))

(declare-fun m!31513 () Bool)

(assert (=> b!22593 m!31513))

(declare-fun m!31515 () Bool)

(assert (=> b!22593 m!31515))

(assert (=> b!22589 m!31515))

(assert (=> b!22589 m!30947))

(declare-fun m!31517 () Bool)

(assert (=> d!7196 m!31517))

(declare-fun m!31519 () Bool)

(assert (=> d!7196 m!31519))

(assert (=> d!7196 m!31117))

(assert (=> b!22590 m!31507))

(assert (=> b!22590 m!30947))

(assert (=> b!22253 d!7196))

(declare-fun d!7198 () Bool)

(assert (=> d!7198 (= (invariant!0 (currentBit!2278 (_2!1382 lt!32352)) (currentByte!2283 (_2!1382 lt!32352)) (size!658 (buf!976 (_2!1382 lt!32352)))) (and (bvsge (currentBit!2278 (_2!1382 lt!32352)) #b00000000000000000000000000000000) (bvslt (currentBit!2278 (_2!1382 lt!32352)) #b00000000000000000000000000001000) (bvsge (currentByte!2283 (_2!1382 lt!32352)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2283 (_2!1382 lt!32352)) (size!658 (buf!976 (_2!1382 lt!32352)))) (and (= (currentBit!2278 (_2!1382 lt!32352)) #b00000000000000000000000000000000) (= (currentByte!2283 (_2!1382 lt!32352)) (size!658 (buf!976 (_2!1382 lt!32352))))))))))

(assert (=> b!22244 d!7198))

(declare-fun d!7200 () Bool)

(assert (=> d!7200 (= (array_inv!628 srcBuffer!2) (bvsge (size!658 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!5488 d!7200))

(declare-fun d!7202 () Bool)

(assert (=> d!7202 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2278 thiss!1379) (currentByte!2283 thiss!1379) (size!658 (buf!976 thiss!1379))))))

(declare-fun bs!2079 () Bool)

(assert (= bs!2079 d!7202))

(assert (=> bs!2079 m!31115))

(assert (=> start!5488 d!7202))

(declare-fun d!7204 () Bool)

(assert (=> d!7204 (= (array_inv!628 (buf!976 thiss!1379)) (bvsge (size!658 (buf!976 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!22249 d!7204))

(push 1)

(assert (not b!22383))

(assert (not b!22589))

(assert (not b!22558))

(assert (not b!22594))

(assert (not b!22540))

(assert (not d!7184))

(assert (not d!7094))

(assert (not b!22566))

(assert (not b!22363))

(assert (not b!22361))

(assert (not d!7196))

(assert (not b!22340))

(assert (not b!22358))

(assert (not b!22541))

(assert (not d!7194))

(assert (not d!7188))

(assert (not b!22348))

(assert (not b!22386))

(assert (not d!7096))

(assert (not b!22595))

(assert (not d!7102))

(assert (not d!7116))

(assert (not b!22596))

(assert (not b!22360))

(assert (not d!7202))

(assert (not b!22542))

(assert (not b!22539))

(assert (not d!7124))

(assert (not b!22359))

(assert (not b!22592))

(assert (not b!22568))

(assert (not b!22560))

(assert (not b!22338))

(assert (not b!22593))

(assert (not b!22590))

(assert (not b!22571))

(assert (not d!7100))

(assert (not b!22387))

(assert (not bm!323))

(assert (not d!7180))

(assert (not d!7192))

(assert (not b!22544))

(assert (not b!22384))

(assert (not b!22545))

(assert (not b!22591))

(check-sat)

(pop 1)

(push 1)

(check-sat)

