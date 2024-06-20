; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8294 () Bool)

(assert start!8294)

(declare-fun b!41481 () Bool)

(declare-fun e!27532 () Bool)

(declare-datatypes ((array!2097 0))(
  ( (array!2098 (arr!1447 (Array (_ BitVec 32) (_ BitVec 8))) (size!948 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1640 0))(
  ( (BitStream!1641 (buf!1276 array!2097) (currentByte!2719 (_ BitVec 32)) (currentBit!2714 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1640)

(declare-fun array_inv!873 (array!2097) Bool)

(assert (=> b!41481 (= e!27532 (array_inv!873 (buf!1276 thiss!1379)))))

(declare-fun b!41482 () Bool)

(declare-fun e!27531 () Bool)

(declare-fun e!27534 () Bool)

(assert (=> b!41482 (= e!27531 (not e!27534))))

(declare-fun res!35285 () Bool)

(assert (=> b!41482 (=> res!35285 e!27534)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!62653 () (_ BitVec 64))

(assert (=> b!41482 (= res!35285 (or (bvslt i!635 to!314) (not (= lt!62653 (bvsub (bvadd lt!62653 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!1640 BitStream!1640) Bool)

(assert (=> b!41482 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2944 0))(
  ( (Unit!2945) )
))
(declare-fun lt!62651 () Unit!2944)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1640) Unit!2944)

(assert (=> b!41482 (= lt!62651 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!41482 (= lt!62653 (bitIndex!0 (size!948 (buf!1276 thiss!1379)) (currentByte!2719 thiss!1379) (currentBit!2714 thiss!1379)))))

(declare-fun b!41484 () Bool)

(declare-fun res!35283 () Bool)

(assert (=> b!41484 (=> res!35283 e!27534)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!41484 (= res!35283 (not (invariant!0 (currentBit!2714 thiss!1379) (currentByte!2719 thiss!1379) (size!948 (buf!1276 thiss!1379)))))))

(declare-fun b!41485 () Bool)

(declare-fun res!35286 () Bool)

(assert (=> b!41485 (=> (not res!35286) (not e!27531))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41485 (= res!35286 (validate_offset_bits!1 ((_ sign_extend 32) (size!948 (buf!1276 thiss!1379))) ((_ sign_extend 32) (currentByte!2719 thiss!1379)) ((_ sign_extend 32) (currentBit!2714 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!35284 () Bool)

(assert (=> start!8294 (=> (not res!35284) (not e!27531))))

(declare-fun srcBuffer!2 () array!2097)

(assert (=> start!8294 (= res!35284 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!948 srcBuffer!2))))))))

(assert (=> start!8294 e!27531))

(assert (=> start!8294 true))

(assert (=> start!8294 (array_inv!873 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1640) Bool)

(assert (=> start!8294 (and (inv!12 thiss!1379) e!27532)))

(declare-fun b!41483 () Bool)

(declare-datatypes ((tuple2!4014 0))(
  ( (tuple2!4015 (_1!2094 array!2097) (_2!2094 BitStream!1640)) )
))
(declare-fun lt!62652 () tuple2!4014)

(assert (=> b!41483 (= e!27534 (or (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!314 i!635))) (bvsle (bvsub to!314 i!635) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!948 (_1!2094 lt!62652)))))))))

(declare-fun readBits!0 (BitStream!1640 (_ BitVec 64)) tuple2!4014)

(declare-datatypes ((tuple2!4016 0))(
  ( (tuple2!4017 (_1!2095 BitStream!1640) (_2!2095 BitStream!1640)) )
))
(declare-fun reader!0 (BitStream!1640 BitStream!1640) tuple2!4016)

(assert (=> b!41483 (= lt!62652 (readBits!0 (_1!2095 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!8294 res!35284) b!41485))

(assert (= (and b!41485 res!35286) b!41482))

(assert (= (and b!41482 (not res!35285)) b!41484))

(assert (= (and b!41484 (not res!35283)) b!41483))

(assert (= start!8294 b!41481))

(declare-fun m!63227 () Bool)

(assert (=> b!41484 m!63227))

(declare-fun m!63229 () Bool)

(assert (=> b!41483 m!63229))

(declare-fun m!63231 () Bool)

(assert (=> b!41483 m!63231))

(declare-fun m!63233 () Bool)

(assert (=> start!8294 m!63233))

(declare-fun m!63235 () Bool)

(assert (=> start!8294 m!63235))

(declare-fun m!63237 () Bool)

(assert (=> b!41481 m!63237))

(declare-fun m!63239 () Bool)

(assert (=> b!41485 m!63239))

(declare-fun m!63241 () Bool)

(assert (=> b!41482 m!63241))

(declare-fun m!63243 () Bool)

(assert (=> b!41482 m!63243))

(declare-fun m!63245 () Bool)

(assert (=> b!41482 m!63245))

(push 1)

(assert (not b!41485))

(assert (not b!41483))

(assert (not b!41482))

(assert (not b!41484))

(assert (not start!8294))

(assert (not b!41481))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!12112 () Bool)

(assert (=> d!12112 (= (array_inv!873 (buf!1276 thiss!1379)) (bvsge (size!948 (buf!1276 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!41481 d!12112))

(declare-fun d!12114 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!12114 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!948 (buf!1276 thiss!1379))) ((_ sign_extend 32) (currentByte!2719 thiss!1379)) ((_ sign_extend 32) (currentBit!2714 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!948 (buf!1276 thiss!1379))) ((_ sign_extend 32) (currentByte!2719 thiss!1379)) ((_ sign_extend 32) (currentBit!2714 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3244 () Bool)

(assert (= bs!3244 d!12114))

(declare-fun m!63247 () Bool)

(assert (=> bs!3244 m!63247))

(assert (=> b!41485 d!12114))

(declare-fun b!41526 () Bool)

(declare-fun res!35327 () Bool)

(declare-fun e!27550 () Bool)

(assert (=> b!41526 (=> (not res!35327) (not e!27550))))

(declare-fun lt!62725 () tuple2!4014)

(declare-fun lt!62727 () (_ BitVec 64))

(assert (=> b!41526 (= res!35327 (= (size!948 (_1!2094 lt!62725)) ((_ extract 31 0) lt!62727)))))

(assert (=> b!41526 (and (bvslt lt!62727 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!62727 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!62724 () (_ BitVec 64))

(declare-fun lt!62721 () (_ BitVec 64))

(assert (=> b!41526 (= lt!62727 (bvsdiv lt!62724 lt!62721))))

(assert (=> b!41526 (and (not (= lt!62721 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!62724 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!62721 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!41526 (= lt!62721 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!62723 () (_ BitVec 64))

(declare-fun lt!62726 () (_ BitVec 64))

(assert (=> b!41526 (= lt!62724 (bvsub lt!62723 lt!62726))))

(assert (=> b!41526 (or (= (bvand lt!62723 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!62726 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!62723 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!62723 lt!62726) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!41526 (= lt!62726 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!62722 () (_ BitVec 64))

(assert (=> b!41526 (= lt!62723 (bvadd (bvsub to!314 i!635) lt!62722))))

(assert (=> b!41526 (or (not (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!62722 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd (bvsub to!314 i!635) lt!62722) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!41526 (= lt!62722 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!41527 () Bool)

(declare-fun res!35331 () Bool)

(assert (=> b!41527 (=> (not res!35331) (not e!27550))))

(declare-fun lt!62728 () (_ BitVec 64))

(assert (=> b!41527 (= res!35331 (= (bvadd lt!62728 (bvsub to!314 i!635)) (bitIndex!0 (size!948 (buf!1276 (_2!2094 lt!62725))) (currentByte!2719 (_2!2094 lt!62725)) (currentBit!2714 (_2!2094 lt!62725)))))))

(assert (=> b!41527 (or (not (= (bvand lt!62728 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!62728 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!62728 (bvsub to!314 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!41527 (= lt!62728 (bitIndex!0 (size!948 (buf!1276 (_1!2095 (reader!0 thiss!1379 thiss!1379)))) (currentByte!2719 (_1!2095 (reader!0 thiss!1379 thiss!1379))) (currentBit!2714 (_1!2095 (reader!0 thiss!1379 thiss!1379)))))))

(declare-fun d!12116 () Bool)

(assert (=> d!12116 e!27550))

(declare-fun res!35330 () Bool)

(assert (=> d!12116 (=> (not res!35330) (not e!27550))))

(assert (=> d!12116 (= res!35330 (= (buf!1276 (_2!2094 lt!62725)) (buf!1276 (_1!2095 (reader!0 thiss!1379 thiss!1379)))))))

(declare-datatypes ((tuple3!162 0))(
  ( (tuple3!163 (_1!2097 Unit!2944) (_2!2097 BitStream!1640) (_3!88 array!2097)) )
))
(declare-fun lt!62720 () tuple3!162)

(assert (=> d!12116 (= lt!62725 (tuple2!4015 (_3!88 lt!62720) (_2!2097 lt!62720)))))

(declare-fun readBitsLoop!0 (BitStream!1640 (_ BitVec 64) array!2097 (_ BitVec 64) (_ BitVec 64)) tuple3!162)

(assert (=> d!12116 (= lt!62720 (readBitsLoop!0 (_1!2095 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635) (array!2098 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)))))

(assert (=> d!12116 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) (bvsle (bvsub to!314 i!635) #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!12116 (= (readBits!0 (_1!2095 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)) lt!62725)))

(declare-fun b!41528 () Bool)

(declare-fun res!35329 () Bool)

(assert (=> b!41528 (=> (not res!35329) (not e!27550))))

(assert (=> b!41528 (= res!35329 (bvsle (currentByte!2719 (_1!2095 (reader!0 thiss!1379 thiss!1379))) (currentByte!2719 (_2!2094 lt!62725))))))

(declare-fun b!41529 () Bool)

(declare-datatypes ((List!487 0))(
  ( (Nil!484) (Cons!483 (h!602 Bool) (t!1237 List!487)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!1640 array!2097 (_ BitVec 64) (_ BitVec 64)) List!487)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1640 BitStream!1640 (_ BitVec 64)) List!487)

(assert (=> b!41529 (= e!27550 (= (byteArrayBitContentToList!0 (_2!2094 lt!62725) (_1!2094 lt!62725) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) (bitStreamReadBitsIntoList!0 (_2!2094 lt!62725) (_1!2095 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635))))))

(declare-fun b!41530 () Bool)

(declare-fun res!35328 () Bool)

(assert (=> b!41530 (=> (not res!35328) (not e!27550))))

(assert (=> b!41530 (= res!35328 (invariant!0 (currentBit!2714 (_2!2094 lt!62725)) (currentByte!2719 (_2!2094 lt!62725)) (size!948 (buf!1276 (_2!2094 lt!62725)))))))

(assert (= (and d!12116 res!35330) b!41527))

(assert (= (and b!41527 res!35331) b!41530))

(assert (= (and b!41530 res!35328) b!41526))

(assert (= (and b!41526 res!35327) b!41528))

(assert (= (and b!41528 res!35329) b!41529))

(declare-fun m!63267 () Bool)

(assert (=> b!41527 m!63267))

(declare-fun m!63269 () Bool)

(assert (=> b!41527 m!63269))

(declare-fun m!63271 () Bool)

(assert (=> d!12116 m!63271))

(declare-fun m!63273 () Bool)

(assert (=> b!41529 m!63273))

(declare-fun m!63275 () Bool)

(assert (=> b!41529 m!63275))

(declare-fun m!63277 () Bool)

(assert (=> b!41530 m!63277))

(assert (=> b!41483 d!12116))

(declare-fun b!41580 () Bool)

(declare-fun e!27570 () Unit!2944)

(declare-fun lt!62872 () Unit!2944)

(assert (=> b!41580 (= e!27570 lt!62872)))

(declare-fun lt!62866 () (_ BitVec 64))

(assert (=> b!41580 (= lt!62866 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!62877 () (_ BitVec 64))

(assert (=> b!41580 (= lt!62877 (bitIndex!0 (size!948 (buf!1276 thiss!1379)) (currentByte!2719 thiss!1379) (currentBit!2714 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2097 array!2097 (_ BitVec 64) (_ BitVec 64)) Unit!2944)

(assert (=> b!41580 (= lt!62872 (arrayBitRangesEqSymmetric!0 (buf!1276 thiss!1379) (buf!1276 thiss!1379) lt!62866 lt!62877))))

(declare-fun arrayBitRangesEq!0 (array!2097 array!2097 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41580 (arrayBitRangesEq!0 (buf!1276 thiss!1379) (buf!1276 thiss!1379) lt!62866 lt!62877)))

(declare-fun b!41581 () Bool)

(declare-fun res!35373 () Bool)

(declare-fun e!27571 () Bool)

(assert (=> b!41581 (=> (not res!35373) (not e!27571))))

(declare-fun lt!62878 () tuple2!4016)

(assert (=> b!41581 (= res!35373 (isPrefixOf!0 (_1!2095 lt!62878) thiss!1379))))

(declare-fun d!12130 () Bool)

(assert (=> d!12130 e!27571))

(declare-fun res!35371 () Bool)

(assert (=> d!12130 (=> (not res!35371) (not e!27571))))

(assert (=> d!12130 (= res!35371 (isPrefixOf!0 (_1!2095 lt!62878) (_2!2095 lt!62878)))))

(declare-fun lt!62865 () BitStream!1640)

(assert (=> d!12130 (= lt!62878 (tuple2!4017 lt!62865 thiss!1379))))

(declare-fun lt!62873 () Unit!2944)

(declare-fun lt!62860 () Unit!2944)

(assert (=> d!12130 (= lt!62873 lt!62860)))

(assert (=> d!12130 (isPrefixOf!0 lt!62865 thiss!1379)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1640 BitStream!1640 BitStream!1640) Unit!2944)

(assert (=> d!12130 (= lt!62860 (lemmaIsPrefixTransitive!0 lt!62865 thiss!1379 thiss!1379))))

(declare-fun lt!62864 () Unit!2944)

(declare-fun lt!62859 () Unit!2944)

(assert (=> d!12130 (= lt!62864 lt!62859)))

(assert (=> d!12130 (isPrefixOf!0 lt!62865 thiss!1379)))

(assert (=> d!12130 (= lt!62859 (lemmaIsPrefixTransitive!0 lt!62865 thiss!1379 thiss!1379))))

(declare-fun lt!62869 () Unit!2944)

(assert (=> d!12130 (= lt!62869 e!27570)))

(declare-fun c!2766 () Bool)

(assert (=> d!12130 (= c!2766 (not (= (size!948 (buf!1276 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!62871 () Unit!2944)

(declare-fun lt!62875 () Unit!2944)

(assert (=> d!12130 (= lt!62871 lt!62875)))

(assert (=> d!12130 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!12130 (= lt!62875 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!62861 () Unit!2944)

(declare-fun lt!62876 () Unit!2944)

(assert (=> d!12130 (= lt!62861 lt!62876)))

(assert (=> d!12130 (= lt!62876 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!62863 () Unit!2944)

(declare-fun lt!62868 () Unit!2944)

(assert (=> d!12130 (= lt!62863 lt!62868)))

(assert (=> d!12130 (isPrefixOf!0 lt!62865 lt!62865)))

(assert (=> d!12130 (= lt!62868 (lemmaIsPrefixRefl!0 lt!62865))))

(declare-fun lt!62862 () Unit!2944)

(declare-fun lt!62874 () Unit!2944)

(assert (=> d!12130 (= lt!62862 lt!62874)))

(assert (=> d!12130 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!12130 (= lt!62874 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!12130 (= lt!62865 (BitStream!1641 (buf!1276 thiss!1379) (currentByte!2719 thiss!1379) (currentBit!2714 thiss!1379)))))

(assert (=> d!12130 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!12130 (= (reader!0 thiss!1379 thiss!1379) lt!62878)))

(declare-fun b!41582 () Bool)

(declare-fun Unit!2947 () Unit!2944)

(assert (=> b!41582 (= e!27570 Unit!2947)))

(declare-fun b!41583 () Bool)

(declare-fun res!35372 () Bool)

(assert (=> b!41583 (=> (not res!35372) (not e!27571))))

(assert (=> b!41583 (= res!35372 (isPrefixOf!0 (_2!2095 lt!62878) thiss!1379))))

(declare-fun lt!62870 () (_ BitVec 64))

(declare-fun b!41584 () Bool)

(declare-fun lt!62867 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1640 (_ BitVec 64)) BitStream!1640)

(assert (=> b!41584 (= e!27571 (= (_1!2095 lt!62878) (withMovedBitIndex!0 (_2!2095 lt!62878) (bvsub lt!62870 lt!62867))))))

(assert (=> b!41584 (or (= (bvand lt!62870 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!62867 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!62870 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!62870 lt!62867) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!41584 (= lt!62867 (bitIndex!0 (size!948 (buf!1276 thiss!1379)) (currentByte!2719 thiss!1379) (currentBit!2714 thiss!1379)))))

(assert (=> b!41584 (= lt!62870 (bitIndex!0 (size!948 (buf!1276 thiss!1379)) (currentByte!2719 thiss!1379) (currentBit!2714 thiss!1379)))))

(assert (= (and d!12130 c!2766) b!41580))

(assert (= (and d!12130 (not c!2766)) b!41582))

(assert (= (and d!12130 res!35371) b!41581))

(assert (= (and b!41581 res!35373) b!41583))

(assert (= (and b!41583 res!35372) b!41584))

(declare-fun m!63315 () Bool)

(assert (=> b!41583 m!63315))

(declare-fun m!63317 () Bool)

(assert (=> b!41581 m!63317))

(declare-fun m!63319 () Bool)

(assert (=> b!41584 m!63319))

(assert (=> b!41584 m!63245))

(assert (=> b!41584 m!63245))

(declare-fun m!63321 () Bool)

(assert (=> d!12130 m!63321))

(assert (=> d!12130 m!63243))

(declare-fun m!63323 () Bool)

(assert (=> d!12130 m!63323))

(declare-fun m!63325 () Bool)

(assert (=> d!12130 m!63325))

(assert (=> d!12130 m!63243))

(assert (=> d!12130 m!63241))

(declare-fun m!63327 () Bool)

(assert (=> d!12130 m!63327))

(declare-fun m!63329 () Bool)

(assert (=> d!12130 m!63329))

(assert (=> d!12130 m!63241))

(assert (=> d!12130 m!63241))

(assert (=> d!12130 m!63329))

(assert (=> b!41580 m!63245))

(declare-fun m!63331 () Bool)

(assert (=> b!41580 m!63331))

(declare-fun m!63333 () Bool)

(assert (=> b!41580 m!63333))

(assert (=> b!41483 d!12130))

(declare-fun d!12146 () Bool)

(assert (=> d!12146 (= (invariant!0 (currentBit!2714 thiss!1379) (currentByte!2719 thiss!1379) (size!948 (buf!1276 thiss!1379))) (and (bvsge (currentBit!2714 thiss!1379) #b00000000000000000000000000000000) (bvslt (currentBit!2714 thiss!1379) #b00000000000000000000000000001000) (bvsge (currentByte!2719 thiss!1379) #b00000000000000000000000000000000) (or (bvslt (currentByte!2719 thiss!1379) (size!948 (buf!1276 thiss!1379))) (and (= (currentBit!2714 thiss!1379) #b00000000000000000000000000000000) (= (currentByte!2719 thiss!1379) (size!948 (buf!1276 thiss!1379)))))))))

(assert (=> b!41484 d!12146))

(declare-fun d!12148 () Bool)

(assert (=> d!12148 (= (array_inv!873 srcBuffer!2) (bvsge (size!948 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!8294 d!12148))

(declare-fun d!12152 () Bool)

(assert (=> d!12152 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2714 thiss!1379) (currentByte!2719 thiss!1379) (size!948 (buf!1276 thiss!1379))))))

(declare-fun bs!3252 () Bool)

(assert (= bs!3252 d!12152))

(assert (=> bs!3252 m!63227))

(assert (=> start!8294 d!12152))

(declare-fun d!12156 () Bool)

(declare-fun res!35386 () Bool)

(declare-fun e!27580 () Bool)

(assert (=> d!12156 (=> (not res!35386) (not e!27580))))

(assert (=> d!12156 (= res!35386 (= (size!948 (buf!1276 thiss!1379)) (size!948 (buf!1276 thiss!1379))))))

(assert (=> d!12156 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!27580)))

(declare-fun b!41597 () Bool)

(declare-fun res!35388 () Bool)

(assert (=> b!41597 (=> (not res!35388) (not e!27580))))

(assert (=> b!41597 (= res!35388 (bvsle (bitIndex!0 (size!948 (buf!1276 thiss!1379)) (currentByte!2719 thiss!1379) (currentBit!2714 thiss!1379)) (bitIndex!0 (size!948 (buf!1276 thiss!1379)) (currentByte!2719 thiss!1379) (currentBit!2714 thiss!1379))))))

(declare-fun b!41598 () Bool)

(declare-fun e!27579 () Bool)

(assert (=> b!41598 (= e!27580 e!27579)))

(declare-fun res!35387 () Bool)

(assert (=> b!41598 (=> res!35387 e!27579)))

(assert (=> b!41598 (= res!35387 (= (size!948 (buf!1276 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!41599 () Bool)

(assert (=> b!41599 (= e!27579 (arrayBitRangesEq!0 (buf!1276 thiss!1379) (buf!1276 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!948 (buf!1276 thiss!1379)) (currentByte!2719 thiss!1379) (currentBit!2714 thiss!1379))))))

(assert (= (and d!12156 res!35386) b!41597))

(assert (= (and b!41597 res!35388) b!41598))

(assert (= (and b!41598 (not res!35387)) b!41599))

(assert (=> b!41597 m!63245))

(assert (=> b!41597 m!63245))

(assert (=> b!41599 m!63245))

(assert (=> b!41599 m!63245))

(declare-fun m!63337 () Bool)

(assert (=> b!41599 m!63337))

(assert (=> b!41482 d!12156))

(declare-fun d!12158 () Bool)

(assert (=> d!12158 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!62899 () Unit!2944)

(declare-fun choose!11 (BitStream!1640) Unit!2944)

(assert (=> d!12158 (= lt!62899 (choose!11 thiss!1379))))

(assert (=> d!12158 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!62899)))

(declare-fun bs!3254 () Bool)

(assert (= bs!3254 d!12158))

(assert (=> bs!3254 m!63241))

(declare-fun m!63339 () Bool)

(assert (=> bs!3254 m!63339))

(assert (=> b!41482 d!12158))

(declare-fun d!12160 () Bool)

(declare-fun e!27583 () Bool)

(assert (=> d!12160 e!27583))

(declare-fun res!35394 () Bool)

(assert (=> d!12160 (=> (not res!35394) (not e!27583))))

(declare-fun lt!62917 () (_ BitVec 64))

(declare-fun lt!62915 () (_ BitVec 64))

(declare-fun lt!62913 () (_ BitVec 64))

(assert (=> d!12160 (= res!35394 (= lt!62917 (bvsub lt!62915 lt!62913)))))

(assert (=> d!12160 (or (= (bvand lt!62915 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!62913 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!62915 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!62915 lt!62913) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!12160 (= lt!62913 (remainingBits!0 ((_ sign_extend 32) (size!948 (buf!1276 thiss!1379))) ((_ sign_extend 32) (currentByte!2719 thiss!1379)) ((_ sign_extend 32) (currentBit!2714 thiss!1379))))))

(declare-fun lt!62914 () (_ BitVec 64))

(declare-fun lt!62912 () (_ BitVec 64))

(assert (=> d!12160 (= lt!62915 (bvmul lt!62914 lt!62912))))

(assert (=> d!12160 (or (= lt!62914 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!62912 (bvsdiv (bvmul lt!62914 lt!62912) lt!62914)))))

(assert (=> d!12160 (= lt!62912 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!12160 (= lt!62914 ((_ sign_extend 32) (size!948 (buf!1276 thiss!1379))))))

(assert (=> d!12160 (= lt!62917 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2719 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2714 thiss!1379))))))

(assert (=> d!12160 (invariant!0 (currentBit!2714 thiss!1379) (currentByte!2719 thiss!1379) (size!948 (buf!1276 thiss!1379)))))

(assert (=> d!12160 (= (bitIndex!0 (size!948 (buf!1276 thiss!1379)) (currentByte!2719 thiss!1379) (currentBit!2714 thiss!1379)) lt!62917)))

(declare-fun b!41604 () Bool)

(declare-fun res!35393 () Bool)

(assert (=> b!41604 (=> (not res!35393) (not e!27583))))

(assert (=> b!41604 (= res!35393 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!62917))))

(declare-fun b!41605 () Bool)

(declare-fun lt!62916 () (_ BitVec 64))

(assert (=> b!41605 (= e!27583 (bvsle lt!62917 (bvmul lt!62916 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!41605 (or (= lt!62916 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!62916 #b0000000000000000000000000000000000000000000000000000000000001000) lt!62916)))))

(assert (=> b!41605 (= lt!62916 ((_ sign_extend 32) (size!948 (buf!1276 thiss!1379))))))

(assert (= (and d!12160 res!35394) b!41604))

(assert (= (and b!41604 res!35393) b!41605))

(assert (=> d!12160 m!63247))

(assert (=> d!12160 m!63227))

(assert (=> b!41482 d!12160))

(push 1)

(assert (not b!41530))

(assert (not b!41583))

(assert (not b!41529))

(assert (not d!12130))

(assert (not b!41527))

(assert (not b!41580))

(assert (not d!12114))

(assert (not d!12160))

(assert (not b!41599))

(assert (not b!41597))

(assert (not d!12116))

(assert (not d!12152))

(assert (not d!12158))

(assert (not b!41581))

(assert (not b!41584))

(check-sat)

(pop 1)

(push 1)

(check-sat)

