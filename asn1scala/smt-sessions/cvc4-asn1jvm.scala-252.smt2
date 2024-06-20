; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4874 () Bool)

(assert start!4874)

(declare-fun b!19369 () Bool)

(declare-fun e!12873 () Bool)

(declare-datatypes ((array!1398 0))(
  ( (array!1399 (arr!1035 (Array (_ BitVec 32) (_ BitVec 8))) (size!594 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1022 0))(
  ( (BitStream!1023 (buf!894 array!1398) (currentByte!2174 (_ BitVec 32)) (currentBit!2169 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1022)

(declare-fun array_inv!564 (array!1398) Bool)

(assert (=> b!19369 (= e!12873 (array_inv!564 (buf!894 thiss!1379)))))

(declare-fun b!19370 () Bool)

(declare-fun e!12874 () Bool)

(declare-datatypes ((tuple2!2224 0))(
  ( (tuple2!2225 (_1!1197 BitStream!1022) (_2!1197 BitStream!1022)) )
))
(declare-fun lt!27449 () tuple2!2224)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!19370 (= e!12874 (validate_offset_bits!1 ((_ sign_extend 32) (size!594 (buf!894 (_1!1197 lt!27449)))) ((_ sign_extend 32) (currentByte!2174 (_1!1197 lt!27449))) ((_ sign_extend 32) (currentBit!2169 (_1!1197 lt!27449))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!1732 0))(
  ( (Unit!1733) )
))
(declare-datatypes ((tuple2!2226 0))(
  ( (tuple2!2227 (_1!1198 Unit!1732) (_2!1198 BitStream!1022)) )
))
(declare-fun lt!27454 () tuple2!2226)

(assert (=> b!19370 (validate_offset_bits!1 ((_ sign_extend 32) (size!594 (buf!894 (_2!1198 lt!27454)))) ((_ sign_extend 32) (currentByte!2174 thiss!1379)) ((_ sign_extend 32) (currentBit!2169 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!27452 () Unit!1732)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1022 array!1398 (_ BitVec 64)) Unit!1732)

(assert (=> b!19370 (= lt!27452 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!894 (_2!1198 lt!27454)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1022 BitStream!1022) tuple2!2224)

(assert (=> b!19370 (= lt!27449 (reader!0 thiss!1379 (_2!1198 lt!27454)))))

(declare-fun b!19371 () Bool)

(declare-fun e!12876 () Bool)

(assert (=> b!19371 (= e!12876 e!12874)))

(declare-fun res!16917 () Bool)

(assert (=> b!19371 (=> res!16917 e!12874)))

(declare-fun isPrefixOf!0 (BitStream!1022 BitStream!1022) Bool)

(assert (=> b!19371 (= res!16917 (not (isPrefixOf!0 thiss!1379 (_2!1198 lt!27454))))))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!19371 (validate_offset_bits!1 ((_ sign_extend 32) (size!594 (buf!894 (_2!1198 lt!27454)))) ((_ sign_extend 32) (currentByte!2174 (_2!1198 lt!27454))) ((_ sign_extend 32) (currentBit!2169 (_2!1198 lt!27454))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!27451 () Unit!1732)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1022 BitStream!1022 (_ BitVec 64) (_ BitVec 64)) Unit!1732)

(assert (=> b!19371 (= lt!27451 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1198 lt!27454) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1398)

(declare-fun appendBitFromByte!0 (BitStream!1022 (_ BitVec 8) (_ BitVec 32)) tuple2!2226)

(assert (=> b!19371 (= lt!27454 (appendBitFromByte!0 thiss!1379 (select (arr!1035 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!19372 () Bool)

(declare-fun e!12871 () Bool)

(assert (=> b!19372 (= e!12871 (not e!12876))))

(declare-fun res!16916 () Bool)

(assert (=> b!19372 (=> res!16916 e!12876)))

(assert (=> b!19372 (= res!16916 (bvsge i!635 to!314))))

(assert (=> b!19372 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!27453 () Unit!1732)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1022) Unit!1732)

(assert (=> b!19372 (= lt!27453 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!27450 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!19372 (= lt!27450 (bitIndex!0 (size!594 (buf!894 thiss!1379)) (currentByte!2174 thiss!1379) (currentBit!2169 thiss!1379)))))

(declare-fun b!19373 () Bool)

(declare-fun res!16919 () Bool)

(assert (=> b!19373 (=> (not res!16919) (not e!12871))))

(assert (=> b!19373 (= res!16919 (validate_offset_bits!1 ((_ sign_extend 32) (size!594 (buf!894 thiss!1379))) ((_ sign_extend 32) (currentByte!2174 thiss!1379)) ((_ sign_extend 32) (currentBit!2169 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!16918 () Bool)

(assert (=> start!4874 (=> (not res!16918) (not e!12871))))

(assert (=> start!4874 (= res!16918 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!594 srcBuffer!2))))))))

(assert (=> start!4874 e!12871))

(assert (=> start!4874 true))

(assert (=> start!4874 (array_inv!564 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1022) Bool)

(assert (=> start!4874 (and (inv!12 thiss!1379) e!12873)))

(assert (= (and start!4874 res!16918) b!19373))

(assert (= (and b!19373 res!16919) b!19372))

(assert (= (and b!19372 (not res!16916)) b!19371))

(assert (= (and b!19371 (not res!16917)) b!19370))

(assert (= start!4874 b!19369))

(declare-fun m!26095 () Bool)

(assert (=> b!19373 m!26095))

(declare-fun m!26097 () Bool)

(assert (=> b!19371 m!26097))

(declare-fun m!26099 () Bool)

(assert (=> b!19371 m!26099))

(declare-fun m!26101 () Bool)

(assert (=> b!19371 m!26101))

(assert (=> b!19371 m!26101))

(declare-fun m!26103 () Bool)

(assert (=> b!19371 m!26103))

(declare-fun m!26105 () Bool)

(assert (=> b!19371 m!26105))

(declare-fun m!26107 () Bool)

(assert (=> b!19370 m!26107))

(declare-fun m!26109 () Bool)

(assert (=> b!19370 m!26109))

(declare-fun m!26111 () Bool)

(assert (=> b!19370 m!26111))

(declare-fun m!26113 () Bool)

(assert (=> b!19370 m!26113))

(declare-fun m!26115 () Bool)

(assert (=> b!19372 m!26115))

(declare-fun m!26117 () Bool)

(assert (=> b!19372 m!26117))

(declare-fun m!26119 () Bool)

(assert (=> b!19372 m!26119))

(declare-fun m!26121 () Bool)

(assert (=> start!4874 m!26121))

(declare-fun m!26123 () Bool)

(assert (=> start!4874 m!26123))

(declare-fun m!26125 () Bool)

(assert (=> b!19369 m!26125))

(push 1)

(assert (not b!19371))

(assert (not b!19369))

(assert (not b!19370))

(assert (not b!19373))

(assert (not start!4874))

(assert (not b!19372))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!6350 () Bool)

(declare-fun res!16938 () Bool)

(declare-fun e!12891 () Bool)

(assert (=> d!6350 (=> (not res!16938) (not e!12891))))

(assert (=> d!6350 (= res!16938 (= (size!594 (buf!894 thiss!1379)) (size!594 (buf!894 thiss!1379))))))

(assert (=> d!6350 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!12891)))

(declare-fun b!19392 () Bool)

(declare-fun res!16939 () Bool)

(assert (=> b!19392 (=> (not res!16939) (not e!12891))))

(assert (=> b!19392 (= res!16939 (bvsle (bitIndex!0 (size!594 (buf!894 thiss!1379)) (currentByte!2174 thiss!1379) (currentBit!2169 thiss!1379)) (bitIndex!0 (size!594 (buf!894 thiss!1379)) (currentByte!2174 thiss!1379) (currentBit!2169 thiss!1379))))))

(declare-fun b!19393 () Bool)

(declare-fun e!12890 () Bool)

(assert (=> b!19393 (= e!12891 e!12890)))

(declare-fun res!16940 () Bool)

(assert (=> b!19393 (=> res!16940 e!12890)))

(assert (=> b!19393 (= res!16940 (= (size!594 (buf!894 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!19394 () Bool)

(declare-fun arrayBitRangesEq!0 (array!1398 array!1398 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!19394 (= e!12890 (arrayBitRangesEq!0 (buf!894 thiss!1379) (buf!894 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!594 (buf!894 thiss!1379)) (currentByte!2174 thiss!1379) (currentBit!2169 thiss!1379))))))

(assert (= (and d!6350 res!16938) b!19392))

(assert (= (and b!19392 res!16939) b!19393))

(assert (= (and b!19393 (not res!16940)) b!19394))

(assert (=> b!19392 m!26119))

(assert (=> b!19392 m!26119))

(assert (=> b!19394 m!26119))

(assert (=> b!19394 m!26119))

(declare-fun m!26143 () Bool)

(assert (=> b!19394 m!26143))

(assert (=> b!19372 d!6350))

(declare-fun d!6352 () Bool)

(assert (=> d!6352 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!27463 () Unit!1732)

(declare-fun choose!11 (BitStream!1022) Unit!1732)

(assert (=> d!6352 (= lt!27463 (choose!11 thiss!1379))))

(assert (=> d!6352 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!27463)))

(declare-fun bs!1862 () Bool)

(assert (= bs!1862 d!6352))

(assert (=> bs!1862 m!26115))

(declare-fun m!26145 () Bool)

(assert (=> bs!1862 m!26145))

(assert (=> b!19372 d!6352))

(declare-fun d!6354 () Bool)

(declare-fun e!12894 () Bool)

(assert (=> d!6354 e!12894))

(declare-fun res!16945 () Bool)

(assert (=> d!6354 (=> (not res!16945) (not e!12894))))

(declare-fun lt!27481 () (_ BitVec 64))

(declare-fun lt!27480 () (_ BitVec 64))

(declare-fun lt!27479 () (_ BitVec 64))

(assert (=> d!6354 (= res!16945 (= lt!27480 (bvsub lt!27481 lt!27479)))))

(assert (=> d!6354 (or (= (bvand lt!27481 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!27479 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!27481 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!27481 lt!27479) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!6354 (= lt!27479 (remainingBits!0 ((_ sign_extend 32) (size!594 (buf!894 thiss!1379))) ((_ sign_extend 32) (currentByte!2174 thiss!1379)) ((_ sign_extend 32) (currentBit!2169 thiss!1379))))))

(declare-fun lt!27477 () (_ BitVec 64))

(declare-fun lt!27476 () (_ BitVec 64))

(assert (=> d!6354 (= lt!27481 (bvmul lt!27477 lt!27476))))

(assert (=> d!6354 (or (= lt!27477 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!27476 (bvsdiv (bvmul lt!27477 lt!27476) lt!27477)))))

(assert (=> d!6354 (= lt!27476 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!6354 (= lt!27477 ((_ sign_extend 32) (size!594 (buf!894 thiss!1379))))))

(assert (=> d!6354 (= lt!27480 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2174 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2169 thiss!1379))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!6354 (invariant!0 (currentBit!2169 thiss!1379) (currentByte!2174 thiss!1379) (size!594 (buf!894 thiss!1379)))))

(assert (=> d!6354 (= (bitIndex!0 (size!594 (buf!894 thiss!1379)) (currentByte!2174 thiss!1379) (currentBit!2169 thiss!1379)) lt!27480)))

(declare-fun b!19399 () Bool)

(declare-fun res!16946 () Bool)

(assert (=> b!19399 (=> (not res!16946) (not e!12894))))

(assert (=> b!19399 (= res!16946 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!27480))))

(declare-fun b!19400 () Bool)

(declare-fun lt!27478 () (_ BitVec 64))

(assert (=> b!19400 (= e!12894 (bvsle lt!27480 (bvmul lt!27478 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!19400 (or (= lt!27478 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!27478 #b0000000000000000000000000000000000000000000000000000000000001000) lt!27478)))))

(assert (=> b!19400 (= lt!27478 ((_ sign_extend 32) (size!594 (buf!894 thiss!1379))))))

(assert (= (and d!6354 res!16945) b!19399))

(assert (= (and b!19399 res!16946) b!19400))

(declare-fun m!26147 () Bool)

(assert (=> d!6354 m!26147))

(declare-fun m!26149 () Bool)

(assert (=> d!6354 m!26149))

(assert (=> b!19372 d!6354))

(declare-fun d!6356 () Bool)

(assert (=> d!6356 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!594 (buf!894 thiss!1379))) ((_ sign_extend 32) (currentByte!2174 thiss!1379)) ((_ sign_extend 32) (currentBit!2169 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!594 (buf!894 thiss!1379))) ((_ sign_extend 32) (currentByte!2174 thiss!1379)) ((_ sign_extend 32) (currentBit!2169 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!1863 () Bool)

(assert (= bs!1863 d!6356))

(assert (=> bs!1863 m!26147))

(assert (=> b!19373 d!6356))

(declare-fun d!6358 () Bool)

(assert (=> d!6358 (= (array_inv!564 srcBuffer!2) (bvsge (size!594 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!4874 d!6358))

(declare-fun d!6360 () Bool)

(assert (=> d!6360 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2169 thiss!1379) (currentByte!2174 thiss!1379) (size!594 (buf!894 thiss!1379))))))

(declare-fun bs!1864 () Bool)

(assert (= bs!1864 d!6360))

(assert (=> bs!1864 m!26149))

(assert (=> start!4874 d!6360))

(declare-fun d!6362 () Bool)

(assert (=> d!6362 (= (array_inv!564 (buf!894 thiss!1379)) (bvsge (size!594 (buf!894 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!19369 d!6362))

(declare-fun d!6364 () Bool)

(declare-fun res!16947 () Bool)

(declare-fun e!12896 () Bool)

(assert (=> d!6364 (=> (not res!16947) (not e!12896))))

(assert (=> d!6364 (= res!16947 (= (size!594 (buf!894 thiss!1379)) (size!594 (buf!894 (_2!1198 lt!27454)))))))

(assert (=> d!6364 (= (isPrefixOf!0 thiss!1379 (_2!1198 lt!27454)) e!12896)))

(declare-fun b!19401 () Bool)

(declare-fun res!16948 () Bool)

(assert (=> b!19401 (=> (not res!16948) (not e!12896))))

(assert (=> b!19401 (= res!16948 (bvsle (bitIndex!0 (size!594 (buf!894 thiss!1379)) (currentByte!2174 thiss!1379) (currentBit!2169 thiss!1379)) (bitIndex!0 (size!594 (buf!894 (_2!1198 lt!27454))) (currentByte!2174 (_2!1198 lt!27454)) (currentBit!2169 (_2!1198 lt!27454)))))))

(declare-fun b!19402 () Bool)

(declare-fun e!12895 () Bool)

(assert (=> b!19402 (= e!12896 e!12895)))

(declare-fun res!16949 () Bool)

(assert (=> b!19402 (=> res!16949 e!12895)))

(assert (=> b!19402 (= res!16949 (= (size!594 (buf!894 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!19403 () Bool)

(assert (=> b!19403 (= e!12895 (arrayBitRangesEq!0 (buf!894 thiss!1379) (buf!894 (_2!1198 lt!27454)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!594 (buf!894 thiss!1379)) (currentByte!2174 thiss!1379) (currentBit!2169 thiss!1379))))))

(assert (= (and d!6364 res!16947) b!19401))

(assert (= (and b!19401 res!16948) b!19402))

(assert (= (and b!19402 (not res!16949)) b!19403))

(assert (=> b!19401 m!26119))

(declare-fun m!26151 () Bool)

(assert (=> b!19401 m!26151))

(assert (=> b!19403 m!26119))

(assert (=> b!19403 m!26119))

(declare-fun m!26153 () Bool)

(assert (=> b!19403 m!26153))

(assert (=> b!19371 d!6364))

(declare-fun d!6366 () Bool)

(assert (=> d!6366 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!594 (buf!894 (_2!1198 lt!27454)))) ((_ sign_extend 32) (currentByte!2174 (_2!1198 lt!27454))) ((_ sign_extend 32) (currentBit!2169 (_2!1198 lt!27454))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!594 (buf!894 (_2!1198 lt!27454)))) ((_ sign_extend 32) (currentByte!2174 (_2!1198 lt!27454))) ((_ sign_extend 32) (currentBit!2169 (_2!1198 lt!27454)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!1865 () Bool)

(assert (= bs!1865 d!6366))

(declare-fun m!26155 () Bool)

(assert (=> bs!1865 m!26155))

(assert (=> b!19371 d!6366))

(declare-fun d!6368 () Bool)

(declare-fun e!12899 () Bool)

(assert (=> d!6368 e!12899))

(declare-fun res!16952 () Bool)

(assert (=> d!6368 (=> (not res!16952) (not e!12899))))

(assert (=> d!6368 (= res!16952 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!27484 () Unit!1732)

(declare-fun choose!27 (BitStream!1022 BitStream!1022 (_ BitVec 64) (_ BitVec 64)) Unit!1732)

(assert (=> d!6368 (= lt!27484 (choose!27 thiss!1379 (_2!1198 lt!27454) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!6368 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!6368 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1198 lt!27454) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!27484)))

(declare-fun b!19406 () Bool)

(assert (=> b!19406 (= e!12899 (validate_offset_bits!1 ((_ sign_extend 32) (size!594 (buf!894 (_2!1198 lt!27454)))) ((_ sign_extend 32) (currentByte!2174 (_2!1198 lt!27454))) ((_ sign_extend 32) (currentBit!2169 (_2!1198 lt!27454))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!6368 res!16952) b!19406))

(declare-fun m!26157 () Bool)

(assert (=> d!6368 m!26157))

(assert (=> b!19406 m!26105))

(assert (=> b!19371 d!6368))

(declare-fun b!19479 () Bool)

(declare-fun e!12940 () Bool)

(declare-datatypes ((tuple2!2232 0))(
  ( (tuple2!2233 (_1!1201 BitStream!1022) (_2!1201 Bool)) )
))
(declare-fun lt!27613 () tuple2!2232)

(declare-fun lt!27614 () tuple2!2226)

(assert (=> b!19479 (= e!12940 (= (bitIndex!0 (size!594 (buf!894 (_1!1201 lt!27613))) (currentByte!2174 (_1!1201 lt!27613)) (currentBit!2169 (_1!1201 lt!27613))) (bitIndex!0 (size!594 (buf!894 (_2!1198 lt!27614))) (currentByte!2174 (_2!1198 lt!27614)) (currentBit!2169 (_2!1198 lt!27614)))))))

(declare-fun b!19480 () Bool)

(declare-fun res!17018 () Bool)

(declare-fun e!12939 () Bool)

(assert (=> b!19480 (=> (not res!17018) (not e!12939))))

(declare-fun lt!27609 () tuple2!2226)

(assert (=> b!19480 (= res!17018 (= (bitIndex!0 (size!594 (buf!894 (_2!1198 lt!27609))) (currentByte!2174 (_2!1198 lt!27609)) (currentBit!2169 (_2!1198 lt!27609))) (bvadd (bitIndex!0 (size!594 (buf!894 thiss!1379)) (currentByte!2174 thiss!1379) (currentBit!2169 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!19481 () Bool)

(declare-fun res!17019 () Bool)

(declare-fun e!12937 () Bool)

(assert (=> b!19481 (=> (not res!17019) (not e!12937))))

(declare-fun lt!27616 () (_ BitVec 64))

(declare-fun lt!27612 () (_ BitVec 64))

(assert (=> b!19481 (= res!17019 (= (bitIndex!0 (size!594 (buf!894 (_2!1198 lt!27614))) (currentByte!2174 (_2!1198 lt!27614)) (currentBit!2169 (_2!1198 lt!27614))) (bvadd lt!27612 lt!27616)))))

(assert (=> b!19481 (or (not (= (bvand lt!27612 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!27616 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!27612 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!27612 lt!27616) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!19481 (= lt!27616 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!19481 (= lt!27612 (bitIndex!0 (size!594 (buf!894 thiss!1379)) (currentByte!2174 thiss!1379) (currentBit!2169 thiss!1379)))))

(declare-fun b!19482 () Bool)

(declare-fun e!12938 () Bool)

(declare-fun lt!27608 () tuple2!2232)

(assert (=> b!19482 (= e!12938 (= (bitIndex!0 (size!594 (buf!894 (_1!1201 lt!27608))) (currentByte!2174 (_1!1201 lt!27608)) (currentBit!2169 (_1!1201 lt!27608))) (bitIndex!0 (size!594 (buf!894 (_2!1198 lt!27609))) (currentByte!2174 (_2!1198 lt!27609)) (currentBit!2169 (_2!1198 lt!27609)))))))

(declare-fun b!19483 () Bool)

(declare-fun res!17020 () Bool)

(assert (=> b!19483 (=> (not res!17020) (not e!12937))))

(assert (=> b!19483 (= res!17020 (isPrefixOf!0 thiss!1379 (_2!1198 lt!27614)))))

(declare-fun b!19485 () Bool)

(assert (=> b!19485 (= e!12937 e!12940)))

(declare-fun res!17024 () Bool)

(assert (=> b!19485 (=> (not res!17024) (not e!12940))))

(declare-fun lt!27611 () (_ BitVec 8))

(assert (=> b!19485 (= res!17024 (and (= (_2!1201 lt!27613) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1035 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!27611)) #b00000000000000000000000000000000))) (= (_1!1201 lt!27613) (_2!1198 lt!27614))))))

(declare-datatypes ((tuple2!2234 0))(
  ( (tuple2!2235 (_1!1202 array!1398) (_2!1202 BitStream!1022)) )
))
(declare-fun lt!27618 () tuple2!2234)

(declare-fun lt!27615 () BitStream!1022)

(declare-fun readBits!0 (BitStream!1022 (_ BitVec 64)) tuple2!2234)

(assert (=> b!19485 (= lt!27618 (readBits!0 lt!27615 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!1022) tuple2!2232)

(assert (=> b!19485 (= lt!27613 (readBitPure!0 lt!27615))))

(declare-fun readerFrom!0 (BitStream!1022 (_ BitVec 32) (_ BitVec 32)) BitStream!1022)

(assert (=> b!19485 (= lt!27615 (readerFrom!0 (_2!1198 lt!27614) (currentBit!2169 thiss!1379) (currentByte!2174 thiss!1379)))))

(declare-fun b!19486 () Bool)

(declare-fun res!17017 () Bool)

(assert (=> b!19486 (=> (not res!17017) (not e!12939))))

(assert (=> b!19486 (= res!17017 (isPrefixOf!0 thiss!1379 (_2!1198 lt!27609)))))

(declare-fun b!19484 () Bool)

(assert (=> b!19484 (= e!12939 e!12938)))

(declare-fun res!17021 () Bool)

(assert (=> b!19484 (=> (not res!17021) (not e!12938))))

(declare-fun lt!27610 () Bool)

(assert (=> b!19484 (= res!17021 (and (= (_2!1201 lt!27608) lt!27610) (= (_1!1201 lt!27608) (_2!1198 lt!27609))))))

(assert (=> b!19484 (= lt!27608 (readBitPure!0 (readerFrom!0 (_2!1198 lt!27609) (currentBit!2169 thiss!1379) (currentByte!2174 thiss!1379))))))

(declare-fun d!6370 () Bool)

(assert (=> d!6370 e!12937))

(declare-fun res!17023 () Bool)

(assert (=> d!6370 (=> (not res!17023) (not e!12937))))

(assert (=> d!6370 (= res!17023 (= (size!594 (buf!894 (_2!1198 lt!27614))) (size!594 (buf!894 thiss!1379))))))

(declare-fun lt!27619 () array!1398)

(assert (=> d!6370 (= lt!27611 (select (arr!1035 lt!27619) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!6370 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!594 lt!27619)))))

(assert (=> d!6370 (= lt!27619 (array!1399 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!27617 () tuple2!2226)

(assert (=> d!6370 (= lt!27614 (tuple2!2227 (_1!1198 lt!27617) (_2!1198 lt!27617)))))

(assert (=> d!6370 (= lt!27617 lt!27609)))

(assert (=> d!6370 e!12939))

(declare-fun res!17022 () Bool)

(assert (=> d!6370 (=> (not res!17022) (not e!12939))))

(assert (=> d!6370 (= res!17022 (= (size!594 (buf!894 thiss!1379)) (size!594 (buf!894 (_2!1198 lt!27609)))))))

(declare-fun appendBit!0 (BitStream!1022 Bool) tuple2!2226)

(assert (=> d!6370 (= lt!27609 (appendBit!0 thiss!1379 lt!27610))))

(assert (=> d!6370 (= lt!27610 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1035 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!6370 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!6370 (= (appendBitFromByte!0 thiss!1379 (select (arr!1035 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!27614)))

(assert (= (and d!6370 res!17022) b!19480))

(assert (= (and b!19480 res!17018) b!19486))

(assert (= (and b!19486 res!17017) b!19484))

(assert (= (and b!19484 res!17021) b!19482))

(assert (= (and d!6370 res!17023) b!19481))

(assert (= (and b!19481 res!17019) b!19483))

(assert (= (and b!19483 res!17020) b!19485))

(assert (= (and b!19485 res!17024) b!19479))

(declare-fun m!26225 () Bool)

(assert (=> b!19479 m!26225))

(declare-fun m!26227 () Bool)

(assert (=> b!19479 m!26227))

(declare-fun m!26229 () Bool)

(assert (=> b!19486 m!26229))

(declare-fun m!26231 () Bool)

(assert (=> b!19480 m!26231))

(assert (=> b!19480 m!26119))

(assert (=> b!19481 m!26227))

(assert (=> b!19481 m!26119))

(declare-fun m!26233 () Bool)

(assert (=> b!19485 m!26233))

(declare-fun m!26235 () Bool)

(assert (=> b!19485 m!26235))

(declare-fun m!26237 () Bool)

(assert (=> b!19485 m!26237))

(declare-fun m!26239 () Bool)

(assert (=> b!19482 m!26239))

(assert (=> b!19482 m!26231))

(declare-fun m!26241 () Bool)

(assert (=> b!19483 m!26241))

(declare-fun m!26243 () Bool)

(assert (=> b!19484 m!26243))

(assert (=> b!19484 m!26243))

(declare-fun m!26245 () Bool)

(assert (=> b!19484 m!26245))

(declare-fun m!26247 () Bool)

(assert (=> d!6370 m!26247))

(declare-fun m!26249 () Bool)

(assert (=> d!6370 m!26249))

(declare-fun m!26251 () Bool)

(assert (=> d!6370 m!26251))

(assert (=> b!19371 d!6370))

(declare-fun d!6390 () Bool)

(assert (=> d!6390 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!594 (buf!894 (_1!1197 lt!27449)))) ((_ sign_extend 32) (currentByte!2174 (_1!1197 lt!27449))) ((_ sign_extend 32) (currentBit!2169 (_1!1197 lt!27449))) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!594 (buf!894 (_1!1197 lt!27449)))) ((_ sign_extend 32) (currentByte!2174 (_1!1197 lt!27449))) ((_ sign_extend 32) (currentBit!2169 (_1!1197 lt!27449)))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!1869 () Bool)

(assert (= bs!1869 d!6390))

(declare-fun m!26253 () Bool)

(assert (=> bs!1869 m!26253))

(assert (=> b!19370 d!6390))

(declare-fun d!6392 () Bool)

(assert (=> d!6392 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!594 (buf!894 (_2!1198 lt!27454)))) ((_ sign_extend 32) (currentByte!2174 thiss!1379)) ((_ sign_extend 32) (currentBit!2169 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!594 (buf!894 (_2!1198 lt!27454)))) ((_ sign_extend 32) (currentByte!2174 thiss!1379)) ((_ sign_extend 32) (currentBit!2169 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!1871 () Bool)

(assert (= bs!1871 d!6392))

(declare-fun m!26257 () Bool)

(assert (=> bs!1871 m!26257))

(assert (=> b!19370 d!6392))

(declare-fun d!6396 () Bool)

(assert (=> d!6396 (validate_offset_bits!1 ((_ sign_extend 32) (size!594 (buf!894 (_2!1198 lt!27454)))) ((_ sign_extend 32) (currentByte!2174 thiss!1379)) ((_ sign_extend 32) (currentBit!2169 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!27625 () Unit!1732)

(declare-fun choose!9 (BitStream!1022 array!1398 (_ BitVec 64) BitStream!1022) Unit!1732)

(assert (=> d!6396 (= lt!27625 (choose!9 thiss!1379 (buf!894 (_2!1198 lt!27454)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1023 (buf!894 (_2!1198 lt!27454)) (currentByte!2174 thiss!1379) (currentBit!2169 thiss!1379))))))

(assert (=> d!6396 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!894 (_2!1198 lt!27454)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!27625)))

(declare-fun bs!1872 () Bool)

(assert (= bs!1872 d!6396))

(assert (=> bs!1872 m!26109))

(declare-fun m!26259 () Bool)

(assert (=> bs!1872 m!26259))

(assert (=> b!19370 d!6396))

(declare-fun lt!27706 () tuple2!2224)

(declare-fun lt!27689 () (_ BitVec 64))

(declare-fun b!19503 () Bool)

(declare-fun e!12948 () Bool)

(declare-fun lt!27703 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1022 (_ BitVec 64)) BitStream!1022)

(assert (=> b!19503 (= e!12948 (= (_1!1197 lt!27706) (withMovedBitIndex!0 (_2!1197 lt!27706) (bvsub lt!27703 lt!27689))))))

(assert (=> b!19503 (or (= (bvand lt!27703 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!27689 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!27703 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!27703 lt!27689) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!19503 (= lt!27689 (bitIndex!0 (size!594 (buf!894 (_2!1198 lt!27454))) (currentByte!2174 (_2!1198 lt!27454)) (currentBit!2169 (_2!1198 lt!27454))))))

(assert (=> b!19503 (= lt!27703 (bitIndex!0 (size!594 (buf!894 thiss!1379)) (currentByte!2174 thiss!1379) (currentBit!2169 thiss!1379)))))

(declare-fun d!6398 () Bool)

(assert (=> d!6398 e!12948))

(declare-fun res!17038 () Bool)

(assert (=> d!6398 (=> (not res!17038) (not e!12948))))

(assert (=> d!6398 (= res!17038 (isPrefixOf!0 (_1!1197 lt!27706) (_2!1197 lt!27706)))))

(declare-fun lt!27695 () BitStream!1022)

(assert (=> d!6398 (= lt!27706 (tuple2!2225 lt!27695 (_2!1198 lt!27454)))))

(declare-fun lt!27704 () Unit!1732)

(declare-fun lt!27697 () Unit!1732)

(assert (=> d!6398 (= lt!27704 lt!27697)))

(assert (=> d!6398 (isPrefixOf!0 lt!27695 (_2!1198 lt!27454))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1022 BitStream!1022 BitStream!1022) Unit!1732)

(assert (=> d!6398 (= lt!27697 (lemmaIsPrefixTransitive!0 lt!27695 (_2!1198 lt!27454) (_2!1198 lt!27454)))))

(declare-fun lt!27693 () Unit!1732)

(declare-fun lt!27698 () Unit!1732)

(assert (=> d!6398 (= lt!27693 lt!27698)))

(assert (=> d!6398 (isPrefixOf!0 lt!27695 (_2!1198 lt!27454))))

(assert (=> d!6398 (= lt!27698 (lemmaIsPrefixTransitive!0 lt!27695 thiss!1379 (_2!1198 lt!27454)))))

(declare-fun lt!27694 () Unit!1732)

(declare-fun e!12949 () Unit!1732)

(assert (=> d!6398 (= lt!27694 e!12949)))

(declare-fun c!1393 () Bool)

(assert (=> d!6398 (= c!1393 (not (= (size!594 (buf!894 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!27692 () Unit!1732)

(declare-fun lt!27690 () Unit!1732)

(assert (=> d!6398 (= lt!27692 lt!27690)))

(assert (=> d!6398 (isPrefixOf!0 (_2!1198 lt!27454) (_2!1198 lt!27454))))

(assert (=> d!6398 (= lt!27690 (lemmaIsPrefixRefl!0 (_2!1198 lt!27454)))))

(declare-fun lt!27701 () Unit!1732)

(declare-fun lt!27687 () Unit!1732)

(assert (=> d!6398 (= lt!27701 lt!27687)))

(assert (=> d!6398 (= lt!27687 (lemmaIsPrefixRefl!0 (_2!1198 lt!27454)))))

(declare-fun lt!27691 () Unit!1732)

(declare-fun lt!27702 () Unit!1732)

(assert (=> d!6398 (= lt!27691 lt!27702)))

(assert (=> d!6398 (isPrefixOf!0 lt!27695 lt!27695)))

(assert (=> d!6398 (= lt!27702 (lemmaIsPrefixRefl!0 lt!27695))))

(declare-fun lt!27705 () Unit!1732)

(declare-fun lt!27688 () Unit!1732)

(assert (=> d!6398 (= lt!27705 lt!27688)))

(assert (=> d!6398 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!6398 (= lt!27688 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!6398 (= lt!27695 (BitStream!1023 (buf!894 (_2!1198 lt!27454)) (currentByte!2174 thiss!1379) (currentBit!2169 thiss!1379)))))

(assert (=> d!6398 (isPrefixOf!0 thiss!1379 (_2!1198 lt!27454))))

(assert (=> d!6398 (= (reader!0 thiss!1379 (_2!1198 lt!27454)) lt!27706)))

(declare-fun b!19504 () Bool)

(declare-fun Unit!1736 () Unit!1732)

(assert (=> b!19504 (= e!12949 Unit!1736)))

(declare-fun b!19505 () Bool)

(declare-fun lt!27696 () Unit!1732)

(assert (=> b!19505 (= e!12949 lt!27696)))

(declare-fun lt!27700 () (_ BitVec 64))

(assert (=> b!19505 (= lt!27700 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27699 () (_ BitVec 64))

(assert (=> b!19505 (= lt!27699 (bitIndex!0 (size!594 (buf!894 thiss!1379)) (currentByte!2174 thiss!1379) (currentBit!2169 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1398 array!1398 (_ BitVec 64) (_ BitVec 64)) Unit!1732)

(assert (=> b!19505 (= lt!27696 (arrayBitRangesEqSymmetric!0 (buf!894 thiss!1379) (buf!894 (_2!1198 lt!27454)) lt!27700 lt!27699))))

(assert (=> b!19505 (arrayBitRangesEq!0 (buf!894 (_2!1198 lt!27454)) (buf!894 thiss!1379) lt!27700 lt!27699)))

(declare-fun b!19506 () Bool)

(declare-fun res!17039 () Bool)

(assert (=> b!19506 (=> (not res!17039) (not e!12948))))

(assert (=> b!19506 (= res!17039 (isPrefixOf!0 (_1!1197 lt!27706) thiss!1379))))

(declare-fun b!19507 () Bool)

(declare-fun res!17037 () Bool)

(assert (=> b!19507 (=> (not res!17037) (not e!12948))))

(assert (=> b!19507 (= res!17037 (isPrefixOf!0 (_2!1197 lt!27706) (_2!1198 lt!27454)))))

(assert (= (and d!6398 c!1393) b!19505))

(assert (= (and d!6398 (not c!1393)) b!19504))

(assert (= (and d!6398 res!17038) b!19506))

(assert (= (and b!19506 res!17039) b!19507))

(assert (= (and b!19507 res!17037) b!19503))

(declare-fun m!26271 () Bool)

(assert (=> b!19506 m!26271))

(assert (=> b!19505 m!26119))

(declare-fun m!26273 () Bool)

(assert (=> b!19505 m!26273))

(declare-fun m!26275 () Bool)

(assert (=> b!19505 m!26275))

(declare-fun m!26277 () Bool)

(assert (=> d!6398 m!26277))

(assert (=> d!6398 m!26117))

(declare-fun m!26279 () Bool)

(assert (=> d!6398 m!26279))

(declare-fun m!26281 () Bool)

(assert (=> d!6398 m!26281))

(declare-fun m!26283 () Bool)

(assert (=> d!6398 m!26283))

(assert (=> d!6398 m!26115))

(declare-fun m!26285 () Bool)

(assert (=> d!6398 m!26285))

(assert (=> d!6398 m!26099))

(declare-fun m!26287 () Bool)

(assert (=> d!6398 m!26287))

(declare-fun m!26289 () Bool)

(assert (=> d!6398 m!26289))

(declare-fun m!26291 () Bool)

(assert (=> d!6398 m!26291))

(declare-fun m!26293 () Bool)

(assert (=> b!19507 m!26293))

(declare-fun m!26295 () Bool)

(assert (=> b!19503 m!26295))

(assert (=> b!19503 m!26151))

(assert (=> b!19503 m!26119))

(assert (=> b!19370 d!6398))

(push 1)

(assert (not d!6396))

(assert (not b!19503))

(assert (not d!6392))

(assert (not d!6356))

(assert (not b!19484))

(assert (not b!19481))

(assert (not b!19505))

(assert (not b!19485))

(assert (not b!19479))

(assert (not b!19480))

(assert (not b!19392))

(assert (not b!19482))

(assert (not d!6366))

(assert (not b!19506))

(assert (not d!6360))

(assert (not b!19507))

(assert (not b!19486))

(assert (not d!6352))

(assert (not d!6354))

(assert (not d!6368))

(assert (not b!19406))

(assert (not b!19483))

(assert (not b!19403))

(assert (not b!19394))

(assert (not b!19401))

(assert (not d!6390))

(assert (not d!6370))

(assert (not d!6398))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

