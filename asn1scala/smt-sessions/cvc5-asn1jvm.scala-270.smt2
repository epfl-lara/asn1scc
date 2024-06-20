; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5272 () Bool)

(assert start!5272)

(declare-fun b!21245 () Bool)

(declare-fun e!14434 () Bool)

(declare-datatypes ((array!1514 0))(
  ( (array!1515 (arr!1093 (Array (_ BitVec 32) (_ BitVec 8))) (size!646 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1126 0))(
  ( (BitStream!1127 (buf!958 array!1514) (currentByte!2253 (_ BitVec 32)) (currentBit!2248 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1126)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!21245 (= e!14434 (invariant!0 (currentBit!2248 thiss!1379) (currentByte!2253 thiss!1379) (size!646 (buf!958 thiss!1379))))))

(declare-fun b!21246 () Bool)

(declare-fun e!14438 () Bool)

(declare-fun e!14439 () Bool)

(assert (=> b!21246 (= e!14438 e!14439)))

(declare-fun res!18393 () Bool)

(assert (=> b!21246 (=> res!18393 e!14439)))

(declare-datatypes ((Unit!1862 0))(
  ( (Unit!1863) )
))
(declare-datatypes ((tuple2!2508 0))(
  ( (tuple2!2509 (_1!1339 Unit!1862) (_2!1339 BitStream!1126)) )
))
(declare-fun lt!30444 () tuple2!2508)

(declare-fun isPrefixOf!0 (BitStream!1126 BitStream!1126) Bool)

(assert (=> b!21246 (= res!18393 (not (isPrefixOf!0 thiss!1379 (_2!1339 lt!30444))))))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!21246 (validate_offset_bits!1 ((_ sign_extend 32) (size!646 (buf!958 (_2!1339 lt!30444)))) ((_ sign_extend 32) (currentByte!2253 (_2!1339 lt!30444))) ((_ sign_extend 32) (currentBit!2248 (_2!1339 lt!30444))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!30443 () Unit!1862)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1126 BitStream!1126 (_ BitVec 64) (_ BitVec 64)) Unit!1862)

(assert (=> b!21246 (= lt!30443 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1339 lt!30444) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1514)

(declare-fun appendBitFromByte!0 (BitStream!1126 (_ BitVec 8) (_ BitVec 32)) tuple2!2508)

(assert (=> b!21246 (= lt!30444 (appendBitFromByte!0 thiss!1379 (select (arr!1093 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-datatypes ((tuple2!2510 0))(
  ( (tuple2!2511 (_1!1340 BitStream!1126) (_2!1340 BitStream!1126)) )
))
(declare-fun lt!30448 () tuple2!2510)

(declare-fun b!21247 () Bool)

(declare-fun e!14435 () Bool)

(declare-datatypes ((List!264 0))(
  ( (Nil!261) (Cons!260 (h!379 Bool) (t!1014 List!264)) )
))
(declare-fun head!101 (List!264) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1126 array!1514 (_ BitVec 64) (_ BitVec 64)) List!264)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1126 BitStream!1126 (_ BitVec 64)) List!264)

(assert (=> b!21247 (= e!14435 (= (head!101 (byteArrayBitContentToList!0 (_2!1339 lt!30444) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!101 (bitStreamReadBitsIntoList!0 (_2!1339 lt!30444) (_1!1340 lt!30448) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!21248 () Bool)

(declare-fun e!14433 () Bool)

(assert (=> b!21248 (= e!14433 (not e!14438))))

(declare-fun res!18391 () Bool)

(assert (=> b!21248 (=> res!18391 e!14438)))

(assert (=> b!21248 (= res!18391 (bvsge i!635 to!314))))

(assert (=> b!21248 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!30442 () Unit!1862)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1126) Unit!1862)

(assert (=> b!21248 (= lt!30442 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!30441 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!21248 (= lt!30441 (bitIndex!0 (size!646 (buf!958 thiss!1379)) (currentByte!2253 thiss!1379) (currentBit!2248 thiss!1379)))))

(declare-fun b!21249 () Bool)

(declare-fun res!18392 () Bool)

(assert (=> b!21249 (=> (not res!18392) (not e!14433))))

(assert (=> b!21249 (= res!18392 (validate_offset_bits!1 ((_ sign_extend 32) (size!646 (buf!958 thiss!1379))) ((_ sign_extend 32) (currentByte!2253 thiss!1379)) ((_ sign_extend 32) (currentBit!2248 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!18394 () Bool)

(assert (=> start!5272 (=> (not res!18394) (not e!14433))))

(assert (=> start!5272 (= res!18394 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!646 srcBuffer!2))))))))

(assert (=> start!5272 e!14433))

(assert (=> start!5272 true))

(declare-fun array_inv!616 (array!1514) Bool)

(assert (=> start!5272 (array_inv!616 srcBuffer!2)))

(declare-fun e!14436 () Bool)

(declare-fun inv!12 (BitStream!1126) Bool)

(assert (=> start!5272 (and (inv!12 thiss!1379) e!14436)))

(declare-fun b!21250 () Bool)

(assert (=> b!21250 (= e!14439 e!14434)))

(declare-fun res!18395 () Bool)

(assert (=> b!21250 (=> res!18395 e!14434)))

(declare-fun lt!30446 () tuple2!2508)

(assert (=> b!21250 (= res!18395 (not (isPrefixOf!0 (_2!1339 lt!30444) (_2!1339 lt!30446))))))

(assert (=> b!21250 (isPrefixOf!0 thiss!1379 (_2!1339 lt!30446))))

(declare-fun lt!30445 () Unit!1862)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1126 BitStream!1126 BitStream!1126) Unit!1862)

(assert (=> b!21250 (= lt!30445 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1339 lt!30444) (_2!1339 lt!30446)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1126 array!1514 (_ BitVec 64) (_ BitVec 64)) tuple2!2508)

(assert (=> b!21250 (= lt!30446 (appendBitsMSBFirstLoop!0 (_2!1339 lt!30444) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!21250 e!14435))

(declare-fun res!18390 () Bool)

(assert (=> b!21250 (=> (not res!18390) (not e!14435))))

(assert (=> b!21250 (= res!18390 (validate_offset_bits!1 ((_ sign_extend 32) (size!646 (buf!958 (_2!1339 lt!30444)))) ((_ sign_extend 32) (currentByte!2253 thiss!1379)) ((_ sign_extend 32) (currentBit!2248 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!30447 () Unit!1862)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1126 array!1514 (_ BitVec 64)) Unit!1862)

(assert (=> b!21250 (= lt!30447 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!958 (_2!1339 lt!30444)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1126 BitStream!1126) tuple2!2510)

(assert (=> b!21250 (= lt!30448 (reader!0 thiss!1379 (_2!1339 lt!30444)))))

(declare-fun b!21251 () Bool)

(assert (=> b!21251 (= e!14436 (array_inv!616 (buf!958 thiss!1379)))))

(assert (= (and start!5272 res!18394) b!21249))

(assert (= (and b!21249 res!18392) b!21248))

(assert (= (and b!21248 (not res!18391)) b!21246))

(assert (= (and b!21246 (not res!18393)) b!21250))

(assert (= (and b!21250 res!18390) b!21247))

(assert (= (and b!21250 (not res!18395)) b!21245))

(assert (= start!5272 b!21251))

(declare-fun m!29283 () Bool)

(assert (=> b!21250 m!29283))

(declare-fun m!29285 () Bool)

(assert (=> b!21250 m!29285))

(declare-fun m!29287 () Bool)

(assert (=> b!21250 m!29287))

(declare-fun m!29289 () Bool)

(assert (=> b!21250 m!29289))

(declare-fun m!29291 () Bool)

(assert (=> b!21250 m!29291))

(declare-fun m!29293 () Bool)

(assert (=> b!21250 m!29293))

(declare-fun m!29295 () Bool)

(assert (=> b!21250 m!29295))

(declare-fun m!29297 () Bool)

(assert (=> start!5272 m!29297))

(declare-fun m!29299 () Bool)

(assert (=> start!5272 m!29299))

(declare-fun m!29301 () Bool)

(assert (=> b!21248 m!29301))

(declare-fun m!29303 () Bool)

(assert (=> b!21248 m!29303))

(declare-fun m!29305 () Bool)

(assert (=> b!21248 m!29305))

(declare-fun m!29307 () Bool)

(assert (=> b!21251 m!29307))

(declare-fun m!29309 () Bool)

(assert (=> b!21246 m!29309))

(declare-fun m!29311 () Bool)

(assert (=> b!21246 m!29311))

(declare-fun m!29313 () Bool)

(assert (=> b!21246 m!29313))

(assert (=> b!21246 m!29313))

(declare-fun m!29315 () Bool)

(assert (=> b!21246 m!29315))

(declare-fun m!29317 () Bool)

(assert (=> b!21246 m!29317))

(declare-fun m!29319 () Bool)

(assert (=> b!21245 m!29319))

(declare-fun m!29321 () Bool)

(assert (=> b!21249 m!29321))

(declare-fun m!29323 () Bool)

(assert (=> b!21247 m!29323))

(assert (=> b!21247 m!29323))

(declare-fun m!29325 () Bool)

(assert (=> b!21247 m!29325))

(declare-fun m!29327 () Bool)

(assert (=> b!21247 m!29327))

(assert (=> b!21247 m!29327))

(declare-fun m!29329 () Bool)

(assert (=> b!21247 m!29329))

(push 1)

(assert (not b!21251))

(assert (not start!5272))

(assert (not b!21249))

(assert (not b!21248))

(assert (not b!21250))

(assert (not b!21246))

(assert (not b!21247))

(assert (not b!21245))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!6804 () Bool)

(declare-fun res!18455 () Bool)

(declare-fun e!14511 () Bool)

(assert (=> d!6804 (=> (not res!18455) (not e!14511))))

(assert (=> d!6804 (= res!18455 (= (size!646 (buf!958 thiss!1379)) (size!646 (buf!958 thiss!1379))))))

(assert (=> d!6804 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!14511)))

(declare-fun b!21333 () Bool)

(declare-fun res!18453 () Bool)

(assert (=> b!21333 (=> (not res!18453) (not e!14511))))

(assert (=> b!21333 (= res!18453 (bvsle (bitIndex!0 (size!646 (buf!958 thiss!1379)) (currentByte!2253 thiss!1379) (currentBit!2248 thiss!1379)) (bitIndex!0 (size!646 (buf!958 thiss!1379)) (currentByte!2253 thiss!1379) (currentBit!2248 thiss!1379))))))

(declare-fun b!21334 () Bool)

(declare-fun e!14510 () Bool)

(assert (=> b!21334 (= e!14511 e!14510)))

(declare-fun res!18454 () Bool)

(assert (=> b!21334 (=> res!18454 e!14510)))

(assert (=> b!21334 (= res!18454 (= (size!646 (buf!958 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!21335 () Bool)

(declare-fun arrayBitRangesEq!0 (array!1514 array!1514 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!21335 (= e!14510 (arrayBitRangesEq!0 (buf!958 thiss!1379) (buf!958 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!646 (buf!958 thiss!1379)) (currentByte!2253 thiss!1379) (currentBit!2248 thiss!1379))))))

(assert (= (and d!6804 res!18455) b!21333))

(assert (= (and b!21333 res!18453) b!21334))

(assert (= (and b!21334 (not res!18454)) b!21335))

(assert (=> b!21333 m!29305))

(assert (=> b!21333 m!29305))

(assert (=> b!21335 m!29305))

(assert (=> b!21335 m!29305))

(declare-fun m!29445 () Bool)

(assert (=> b!21335 m!29445))

(assert (=> b!21248 d!6804))

(declare-fun d!6806 () Bool)

(assert (=> d!6806 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!30529 () Unit!1862)

(declare-fun choose!11 (BitStream!1126) Unit!1862)

(assert (=> d!6806 (= lt!30529 (choose!11 thiss!1379))))

(assert (=> d!6806 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!30529)))

(declare-fun bs!2004 () Bool)

(assert (= bs!2004 d!6806))

(assert (=> bs!2004 m!29301))

(declare-fun m!29447 () Bool)

(assert (=> bs!2004 m!29447))

(assert (=> b!21248 d!6806))

(declare-fun d!6810 () Bool)

(declare-fun e!14522 () Bool)

(assert (=> d!6810 e!14522))

(declare-fun res!18474 () Bool)

(assert (=> d!6810 (=> (not res!18474) (not e!14522))))

(declare-fun lt!30557 () (_ BitVec 64))

(declare-fun lt!30560 () (_ BitVec 64))

(declare-fun lt!30562 () (_ BitVec 64))

(assert (=> d!6810 (= res!18474 (= lt!30562 (bvsub lt!30560 lt!30557)))))

(assert (=> d!6810 (or (= (bvand lt!30560 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!30557 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!30560 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!30560 lt!30557) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!6810 (= lt!30557 (remainingBits!0 ((_ sign_extend 32) (size!646 (buf!958 thiss!1379))) ((_ sign_extend 32) (currentByte!2253 thiss!1379)) ((_ sign_extend 32) (currentBit!2248 thiss!1379))))))

(declare-fun lt!30561 () (_ BitVec 64))

(declare-fun lt!30558 () (_ BitVec 64))

(assert (=> d!6810 (= lt!30560 (bvmul lt!30561 lt!30558))))

(assert (=> d!6810 (or (= lt!30561 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!30558 (bvsdiv (bvmul lt!30561 lt!30558) lt!30561)))))

(assert (=> d!6810 (= lt!30558 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!6810 (= lt!30561 ((_ sign_extend 32) (size!646 (buf!958 thiss!1379))))))

(assert (=> d!6810 (= lt!30562 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2253 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2248 thiss!1379))))))

(assert (=> d!6810 (invariant!0 (currentBit!2248 thiss!1379) (currentByte!2253 thiss!1379) (size!646 (buf!958 thiss!1379)))))

(assert (=> d!6810 (= (bitIndex!0 (size!646 (buf!958 thiss!1379)) (currentByte!2253 thiss!1379) (currentBit!2248 thiss!1379)) lt!30562)))

(declare-fun b!21353 () Bool)

(declare-fun res!18473 () Bool)

(assert (=> b!21353 (=> (not res!18473) (not e!14522))))

(assert (=> b!21353 (= res!18473 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!30562))))

(declare-fun b!21354 () Bool)

(declare-fun lt!30559 () (_ BitVec 64))

(assert (=> b!21354 (= e!14522 (bvsle lt!30562 (bvmul lt!30559 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!21354 (or (= lt!30559 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!30559 #b0000000000000000000000000000000000000000000000000000000000001000) lt!30559)))))

(assert (=> b!21354 (= lt!30559 ((_ sign_extend 32) (size!646 (buf!958 thiss!1379))))))

(assert (= (and d!6810 res!18474) b!21353))

(assert (= (and b!21353 res!18473) b!21354))

(declare-fun m!29453 () Bool)

(assert (=> d!6810 m!29453))

(assert (=> d!6810 m!29319))

(assert (=> b!21248 d!6810))

(declare-fun d!6816 () Bool)

(assert (=> d!6816 (= (array_inv!616 srcBuffer!2) (bvsge (size!646 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!5272 d!6816))

(declare-fun d!6820 () Bool)

(assert (=> d!6820 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2248 thiss!1379) (currentByte!2253 thiss!1379) (size!646 (buf!958 thiss!1379))))))

(declare-fun bs!2008 () Bool)

(assert (= bs!2008 d!6820))

(assert (=> bs!2008 m!29319))

(assert (=> start!5272 d!6820))

(declare-fun d!6824 () Bool)

(assert (=> d!6824 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!646 (buf!958 thiss!1379))) ((_ sign_extend 32) (currentByte!2253 thiss!1379)) ((_ sign_extend 32) (currentBit!2248 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!646 (buf!958 thiss!1379))) ((_ sign_extend 32) (currentByte!2253 thiss!1379)) ((_ sign_extend 32) (currentBit!2248 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2009 () Bool)

(assert (= bs!2009 d!6824))

(assert (=> bs!2009 m!29453))

(assert (=> b!21249 d!6824))

(declare-fun d!6826 () Bool)

(assert (=> d!6826 (= (array_inv!616 (buf!958 thiss!1379)) (bvsge (size!646 (buf!958 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!21251 d!6826))

(declare-fun b!21385 () Bool)

(declare-fun e!14536 () Unit!1862)

(declare-fun Unit!1884 () Unit!1862)

(assert (=> b!21385 (= e!14536 Unit!1884)))

(declare-fun b!21386 () Bool)

(declare-fun lt!30693 () tuple2!2510)

(declare-fun e!14537 () Bool)

(declare-fun lt!30682 () (_ BitVec 64))

(declare-fun lt!30689 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1126 (_ BitVec 64)) BitStream!1126)

(assert (=> b!21386 (= e!14537 (= (_1!1340 lt!30693) (withMovedBitIndex!0 (_2!1340 lt!30693) (bvsub lt!30689 lt!30682))))))

(assert (=> b!21386 (or (= (bvand lt!30689 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!30682 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!30689 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!30689 lt!30682) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!21386 (= lt!30682 (bitIndex!0 (size!646 (buf!958 (_2!1339 lt!30444))) (currentByte!2253 (_2!1339 lt!30444)) (currentBit!2248 (_2!1339 lt!30444))))))

(assert (=> b!21386 (= lt!30689 (bitIndex!0 (size!646 (buf!958 thiss!1379)) (currentByte!2253 thiss!1379) (currentBit!2248 thiss!1379)))))

(declare-fun d!6828 () Bool)

(assert (=> d!6828 e!14537))

(declare-fun res!18497 () Bool)

(assert (=> d!6828 (=> (not res!18497) (not e!14537))))

(assert (=> d!6828 (= res!18497 (isPrefixOf!0 (_1!1340 lt!30693) (_2!1340 lt!30693)))))

(declare-fun lt!30683 () BitStream!1126)

(assert (=> d!6828 (= lt!30693 (tuple2!2511 lt!30683 (_2!1339 lt!30444)))))

(declare-fun lt!30681 () Unit!1862)

(declare-fun lt!30691 () Unit!1862)

(assert (=> d!6828 (= lt!30681 lt!30691)))

(assert (=> d!6828 (isPrefixOf!0 lt!30683 (_2!1339 lt!30444))))

(assert (=> d!6828 (= lt!30691 (lemmaIsPrefixTransitive!0 lt!30683 (_2!1339 lt!30444) (_2!1339 lt!30444)))))

(declare-fun lt!30679 () Unit!1862)

(declare-fun lt!30687 () Unit!1862)

(assert (=> d!6828 (= lt!30679 lt!30687)))

(assert (=> d!6828 (isPrefixOf!0 lt!30683 (_2!1339 lt!30444))))

(assert (=> d!6828 (= lt!30687 (lemmaIsPrefixTransitive!0 lt!30683 thiss!1379 (_2!1339 lt!30444)))))

(declare-fun lt!30685 () Unit!1862)

(assert (=> d!6828 (= lt!30685 e!14536)))

(declare-fun c!1519 () Bool)

(assert (=> d!6828 (= c!1519 (not (= (size!646 (buf!958 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!30690 () Unit!1862)

(declare-fun lt!30675 () Unit!1862)

(assert (=> d!6828 (= lt!30690 lt!30675)))

(assert (=> d!6828 (isPrefixOf!0 (_2!1339 lt!30444) (_2!1339 lt!30444))))

(assert (=> d!6828 (= lt!30675 (lemmaIsPrefixRefl!0 (_2!1339 lt!30444)))))

(declare-fun lt!30688 () Unit!1862)

(declare-fun lt!30680 () Unit!1862)

(assert (=> d!6828 (= lt!30688 lt!30680)))

(assert (=> d!6828 (= lt!30680 (lemmaIsPrefixRefl!0 (_2!1339 lt!30444)))))

(declare-fun lt!30694 () Unit!1862)

(declare-fun lt!30676 () Unit!1862)

(assert (=> d!6828 (= lt!30694 lt!30676)))

(assert (=> d!6828 (isPrefixOf!0 lt!30683 lt!30683)))

(assert (=> d!6828 (= lt!30676 (lemmaIsPrefixRefl!0 lt!30683))))

(declare-fun lt!30678 () Unit!1862)

(declare-fun lt!30684 () Unit!1862)

(assert (=> d!6828 (= lt!30678 lt!30684)))

(assert (=> d!6828 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!6828 (= lt!30684 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!6828 (= lt!30683 (BitStream!1127 (buf!958 (_2!1339 lt!30444)) (currentByte!2253 thiss!1379) (currentBit!2248 thiss!1379)))))

(assert (=> d!6828 (isPrefixOf!0 thiss!1379 (_2!1339 lt!30444))))

(assert (=> d!6828 (= (reader!0 thiss!1379 (_2!1339 lt!30444)) lt!30693)))

(declare-fun b!21387 () Bool)

(declare-fun lt!30677 () Unit!1862)

(assert (=> b!21387 (= e!14536 lt!30677)))

(declare-fun lt!30692 () (_ BitVec 64))

(assert (=> b!21387 (= lt!30692 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!30686 () (_ BitVec 64))

(assert (=> b!21387 (= lt!30686 (bitIndex!0 (size!646 (buf!958 thiss!1379)) (currentByte!2253 thiss!1379) (currentBit!2248 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1514 array!1514 (_ BitVec 64) (_ BitVec 64)) Unit!1862)

(assert (=> b!21387 (= lt!30677 (arrayBitRangesEqSymmetric!0 (buf!958 thiss!1379) (buf!958 (_2!1339 lt!30444)) lt!30692 lt!30686))))

(assert (=> b!21387 (arrayBitRangesEq!0 (buf!958 (_2!1339 lt!30444)) (buf!958 thiss!1379) lt!30692 lt!30686)))

(declare-fun b!21388 () Bool)

(declare-fun res!18495 () Bool)

(assert (=> b!21388 (=> (not res!18495) (not e!14537))))

(assert (=> b!21388 (= res!18495 (isPrefixOf!0 (_1!1340 lt!30693) thiss!1379))))

(declare-fun b!21389 () Bool)

(declare-fun res!18496 () Bool)

(assert (=> b!21389 (=> (not res!18496) (not e!14537))))

(assert (=> b!21389 (= res!18496 (isPrefixOf!0 (_2!1340 lt!30693) (_2!1339 lt!30444)))))

(assert (= (and d!6828 c!1519) b!21387))

(assert (= (and d!6828 (not c!1519)) b!21385))

(assert (= (and d!6828 res!18497) b!21388))

(assert (= (and b!21388 res!18495) b!21389))

(assert (= (and b!21389 res!18496) b!21386))

(declare-fun m!29495 () Bool)

(assert (=> b!21386 m!29495))

(declare-fun m!29497 () Bool)

(assert (=> b!21386 m!29497))

(assert (=> b!21386 m!29305))

(declare-fun m!29499 () Bool)

(assert (=> b!21388 m!29499))

(assert (=> b!21387 m!29305))

(declare-fun m!29501 () Bool)

(assert (=> b!21387 m!29501))

(declare-fun m!29503 () Bool)

(assert (=> b!21387 m!29503))

(declare-fun m!29505 () Bool)

(assert (=> b!21389 m!29505))

(declare-fun m!29507 () Bool)

(assert (=> d!6828 m!29507))

(declare-fun m!29509 () Bool)

(assert (=> d!6828 m!29509))

(assert (=> d!6828 m!29309))

(declare-fun m!29511 () Bool)

(assert (=> d!6828 m!29511))

(declare-fun m!29513 () Bool)

(assert (=> d!6828 m!29513))

(declare-fun m!29515 () Bool)

(assert (=> d!6828 m!29515))

(declare-fun m!29517 () Bool)

(assert (=> d!6828 m!29517))

(assert (=> d!6828 m!29303))

(assert (=> d!6828 m!29301))

(declare-fun m!29519 () Bool)

(assert (=> d!6828 m!29519))

(declare-fun m!29521 () Bool)

(assert (=> d!6828 m!29521))

(assert (=> b!21250 d!6828))

(declare-fun d!6840 () Bool)

(assert (=> d!6840 (isPrefixOf!0 thiss!1379 (_2!1339 lt!30446))))

(declare-fun lt!30697 () Unit!1862)

(declare-fun choose!30 (BitStream!1126 BitStream!1126 BitStream!1126) Unit!1862)

(assert (=> d!6840 (= lt!30697 (choose!30 thiss!1379 (_2!1339 lt!30444) (_2!1339 lt!30446)))))

(assert (=> d!6840 (isPrefixOf!0 thiss!1379 (_2!1339 lt!30444))))

(assert (=> d!6840 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1339 lt!30444) (_2!1339 lt!30446)) lt!30697)))

(declare-fun bs!2013 () Bool)

(assert (= bs!2013 d!6840))

(assert (=> bs!2013 m!29291))

(declare-fun m!29523 () Bool)

(assert (=> bs!2013 m!29523))

(assert (=> bs!2013 m!29309))

(assert (=> b!21250 d!6840))

(declare-fun d!6842 () Bool)

(assert (=> d!6842 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!646 (buf!958 (_2!1339 lt!30444)))) ((_ sign_extend 32) (currentByte!2253 thiss!1379)) ((_ sign_extend 32) (currentBit!2248 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!646 (buf!958 (_2!1339 lt!30444)))) ((_ sign_extend 32) (currentByte!2253 thiss!1379)) ((_ sign_extend 32) (currentBit!2248 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!2014 () Bool)

(assert (= bs!2014 d!6842))

(declare-fun m!29525 () Bool)

(assert (=> bs!2014 m!29525))

(assert (=> b!21250 d!6842))

(declare-fun lt!31213 () tuple2!2510)

(declare-fun lt!31226 () tuple2!2508)

(declare-fun b!21558 () Bool)

(declare-fun e!14617 () Bool)

(assert (=> b!21558 (= e!14617 (= (bitStreamReadBitsIntoList!0 (_2!1339 lt!31226) (_1!1340 lt!31213) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!1339 lt!31226) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!21558 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!21558 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!31238 () Unit!1862)

(declare-fun lt!31217 () Unit!1862)

(assert (=> b!21558 (= lt!31238 lt!31217)))

(declare-fun lt!31214 () (_ BitVec 64))

(assert (=> b!21558 (validate_offset_bits!1 ((_ sign_extend 32) (size!646 (buf!958 (_2!1339 lt!31226)))) ((_ sign_extend 32) (currentByte!2253 (_2!1339 lt!30444))) ((_ sign_extend 32) (currentBit!2248 (_2!1339 lt!30444))) lt!31214)))

(assert (=> b!21558 (= lt!31217 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1339 lt!30444) (buf!958 (_2!1339 lt!31226)) lt!31214))))

(declare-fun e!14618 () Bool)

(assert (=> b!21558 e!14618))

(declare-fun res!18625 () Bool)

(assert (=> b!21558 (=> (not res!18625) (not e!14618))))

(assert (=> b!21558 (= res!18625 (and (= (size!646 (buf!958 (_2!1339 lt!30444))) (size!646 (buf!958 (_2!1339 lt!31226)))) (bvsge lt!31214 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!21558 (= lt!31214 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!21558 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!21558 (= lt!31213 (reader!0 (_2!1339 lt!30444) (_2!1339 lt!31226)))))

(declare-fun b!21559 () Bool)

(declare-fun e!14619 () tuple2!2508)

(declare-fun Unit!1885 () Unit!1862)

(assert (=> b!21559 (= e!14619 (tuple2!2509 Unit!1885 (_2!1339 lt!30444)))))

(assert (=> b!21559 (= (size!646 (buf!958 (_2!1339 lt!30444))) (size!646 (buf!958 (_2!1339 lt!30444))))))

(declare-fun lt!31230 () Unit!1862)

(declare-fun Unit!1886 () Unit!1862)

(assert (=> b!21559 (= lt!31230 Unit!1886)))

(declare-fun call!311 () tuple2!2510)

(declare-fun checkByteArrayBitContent!0 (BitStream!1126 array!1514 array!1514 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!2536 0))(
  ( (tuple2!2537 (_1!1353 array!1514) (_2!1353 BitStream!1126)) )
))
(declare-fun readBits!0 (BitStream!1126 (_ BitVec 64)) tuple2!2536)

(assert (=> b!21559 (checkByteArrayBitContent!0 (_2!1339 lt!30444) srcBuffer!2 (_1!1353 (readBits!0 (_1!1340 call!311) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!21560 () Bool)

(declare-fun res!18629 () Bool)

(assert (=> b!21560 (=> (not res!18629) (not e!14617))))

(assert (=> b!21560 (= res!18629 (= (size!646 (buf!958 (_2!1339 lt!30444))) (size!646 (buf!958 (_2!1339 lt!31226)))))))

(declare-fun b!21561 () Bool)

(declare-fun res!18628 () Bool)

(assert (=> b!21561 (=> (not res!18628) (not e!14617))))

(assert (=> b!21561 (= res!18628 (invariant!0 (currentBit!2248 (_2!1339 lt!31226)) (currentByte!2253 (_2!1339 lt!31226)) (size!646 (buf!958 (_2!1339 lt!31226)))))))

(declare-fun lt!31224 () tuple2!2508)

(declare-fun c!1540 () Bool)

(declare-fun bm!308 () Bool)

(assert (=> bm!308 (= call!311 (reader!0 (_2!1339 lt!30444) (ite c!1540 (_2!1339 lt!31224) (_2!1339 lt!30444))))))

(declare-fun b!21562 () Bool)

(declare-fun Unit!1887 () Unit!1862)

(assert (=> b!21562 (= e!14619 (tuple2!2509 Unit!1887 (_2!1339 lt!31224)))))

(declare-fun lt!31242 () tuple2!2508)

(assert (=> b!21562 (= lt!31242 (appendBitFromByte!0 (_2!1339 lt!30444) (select (arr!1093 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!31216 () (_ BitVec 64))

(assert (=> b!21562 (= lt!31216 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!31215 () (_ BitVec 64))

(assert (=> b!21562 (= lt!31215 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!31203 () Unit!1862)

(assert (=> b!21562 (= lt!31203 (validateOffsetBitsIneqLemma!0 (_2!1339 lt!30444) (_2!1339 lt!31242) lt!31216 lt!31215))))

(assert (=> b!21562 (validate_offset_bits!1 ((_ sign_extend 32) (size!646 (buf!958 (_2!1339 lt!31242)))) ((_ sign_extend 32) (currentByte!2253 (_2!1339 lt!31242))) ((_ sign_extend 32) (currentBit!2248 (_2!1339 lt!31242))) (bvsub lt!31216 lt!31215))))

(declare-fun lt!31236 () Unit!1862)

(assert (=> b!21562 (= lt!31236 lt!31203)))

(declare-fun lt!31245 () tuple2!2510)

(assert (=> b!21562 (= lt!31245 (reader!0 (_2!1339 lt!30444) (_2!1339 lt!31242)))))

(declare-fun lt!31227 () (_ BitVec 64))

(assert (=> b!21562 (= lt!31227 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!31243 () Unit!1862)

(assert (=> b!21562 (= lt!31243 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1339 lt!30444) (buf!958 (_2!1339 lt!31242)) lt!31227))))

(assert (=> b!21562 (validate_offset_bits!1 ((_ sign_extend 32) (size!646 (buf!958 (_2!1339 lt!31242)))) ((_ sign_extend 32) (currentByte!2253 (_2!1339 lt!30444))) ((_ sign_extend 32) (currentBit!2248 (_2!1339 lt!30444))) lt!31227)))

(declare-fun lt!31206 () Unit!1862)

(assert (=> b!21562 (= lt!31206 lt!31243)))

(assert (=> b!21562 (= (head!101 (byteArrayBitContentToList!0 (_2!1339 lt!31242) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!101 (bitStreamReadBitsIntoList!0 (_2!1339 lt!31242) (_1!1340 lt!31245) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!31235 () Unit!1862)

(declare-fun Unit!1888 () Unit!1862)

(assert (=> b!21562 (= lt!31235 Unit!1888)))

(assert (=> b!21562 (= lt!31224 (appendBitsMSBFirstLoop!0 (_2!1339 lt!31242) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!31207 () Unit!1862)

(assert (=> b!21562 (= lt!31207 (lemmaIsPrefixTransitive!0 (_2!1339 lt!30444) (_2!1339 lt!31242) (_2!1339 lt!31224)))))

(assert (=> b!21562 (isPrefixOf!0 (_2!1339 lt!30444) (_2!1339 lt!31224))))

(declare-fun lt!31221 () Unit!1862)

(assert (=> b!21562 (= lt!31221 lt!31207)))

(assert (=> b!21562 (= (size!646 (buf!958 (_2!1339 lt!31224))) (size!646 (buf!958 (_2!1339 lt!30444))))))

(declare-fun lt!31223 () Unit!1862)

(declare-fun Unit!1889 () Unit!1862)

(assert (=> b!21562 (= lt!31223 Unit!1889)))

(assert (=> b!21562 (= (bitIndex!0 (size!646 (buf!958 (_2!1339 lt!31224))) (currentByte!2253 (_2!1339 lt!31224)) (currentBit!2248 (_2!1339 lt!31224))) (bvsub (bvadd (bitIndex!0 (size!646 (buf!958 (_2!1339 lt!30444))) (currentByte!2253 (_2!1339 lt!30444)) (currentBit!2248 (_2!1339 lt!30444))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!31234 () Unit!1862)

(declare-fun Unit!1890 () Unit!1862)

(assert (=> b!21562 (= lt!31234 Unit!1890)))

(assert (=> b!21562 (= (bitIndex!0 (size!646 (buf!958 (_2!1339 lt!31224))) (currentByte!2253 (_2!1339 lt!31224)) (currentBit!2248 (_2!1339 lt!31224))) (bvsub (bvsub (bvadd (bitIndex!0 (size!646 (buf!958 (_2!1339 lt!31242))) (currentByte!2253 (_2!1339 lt!31242)) (currentBit!2248 (_2!1339 lt!31242))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!31205 () Unit!1862)

(declare-fun Unit!1891 () Unit!1862)

(assert (=> b!21562 (= lt!31205 Unit!1891)))

(declare-fun lt!31218 () tuple2!2510)

(assert (=> b!21562 (= lt!31218 call!311)))

(declare-fun lt!31240 () (_ BitVec 64))

(assert (=> b!21562 (= lt!31240 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!31210 () Unit!1862)

(assert (=> b!21562 (= lt!31210 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1339 lt!30444) (buf!958 (_2!1339 lt!31224)) lt!31240))))

(assert (=> b!21562 (validate_offset_bits!1 ((_ sign_extend 32) (size!646 (buf!958 (_2!1339 lt!31224)))) ((_ sign_extend 32) (currentByte!2253 (_2!1339 lt!30444))) ((_ sign_extend 32) (currentBit!2248 (_2!1339 lt!30444))) lt!31240)))

(declare-fun lt!31211 () Unit!1862)

(assert (=> b!21562 (= lt!31211 lt!31210)))

(declare-fun lt!31222 () tuple2!2510)

(assert (=> b!21562 (= lt!31222 (reader!0 (_2!1339 lt!31242) (_2!1339 lt!31224)))))

(declare-fun lt!31241 () (_ BitVec 64))

(assert (=> b!21562 (= lt!31241 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!31225 () Unit!1862)

(assert (=> b!21562 (= lt!31225 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1339 lt!31242) (buf!958 (_2!1339 lt!31224)) lt!31241))))

(assert (=> b!21562 (validate_offset_bits!1 ((_ sign_extend 32) (size!646 (buf!958 (_2!1339 lt!31224)))) ((_ sign_extend 32) (currentByte!2253 (_2!1339 lt!31242))) ((_ sign_extend 32) (currentBit!2248 (_2!1339 lt!31242))) lt!31241)))

(declare-fun lt!31228 () Unit!1862)

(assert (=> b!21562 (= lt!31228 lt!31225)))

(declare-fun lt!31232 () List!264)

(assert (=> b!21562 (= lt!31232 (byteArrayBitContentToList!0 (_2!1339 lt!31224) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!31237 () List!264)

(assert (=> b!21562 (= lt!31237 (byteArrayBitContentToList!0 (_2!1339 lt!31224) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!31220 () List!264)

(assert (=> b!21562 (= lt!31220 (bitStreamReadBitsIntoList!0 (_2!1339 lt!31224) (_1!1340 lt!31218) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!31246 () List!264)

(assert (=> b!21562 (= lt!31246 (bitStreamReadBitsIntoList!0 (_2!1339 lt!31224) (_1!1340 lt!31222) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!31233 () (_ BitVec 64))

(assert (=> b!21562 (= lt!31233 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!31212 () Unit!1862)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1126 BitStream!1126 BitStream!1126 BitStream!1126 (_ BitVec 64) List!264) Unit!1862)

(assert (=> b!21562 (= lt!31212 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1339 lt!31224) (_2!1339 lt!31224) (_1!1340 lt!31218) (_1!1340 lt!31222) lt!31233 lt!31220))))

(declare-fun tail!80 (List!264) List!264)

(assert (=> b!21562 (= (bitStreamReadBitsIntoList!0 (_2!1339 lt!31224) (_1!1340 lt!31222) (bvsub lt!31233 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!80 lt!31220))))

(declare-fun lt!31219 () Unit!1862)

(assert (=> b!21562 (= lt!31219 lt!31212)))

(declare-fun lt!31231 () (_ BitVec 64))

(declare-fun lt!31208 () Unit!1862)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1514 array!1514 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!1862)

(assert (=> b!21562 (= lt!31208 (arrayBitRangesEqImpliesEq!0 (buf!958 (_2!1339 lt!31242)) (buf!958 (_2!1339 lt!31224)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!31231 (bitIndex!0 (size!646 (buf!958 (_2!1339 lt!31242))) (currentByte!2253 (_2!1339 lt!31242)) (currentBit!2248 (_2!1339 lt!31242)))))))

(declare-fun bitAt!0 (array!1514 (_ BitVec 64)) Bool)

(assert (=> b!21562 (= (bitAt!0 (buf!958 (_2!1339 lt!31242)) lt!31231) (bitAt!0 (buf!958 (_2!1339 lt!31224)) lt!31231))))

(declare-fun lt!31209 () Unit!1862)

(assert (=> b!21562 (= lt!31209 lt!31208)))

(declare-fun b!21563 () Bool)

(declare-fun res!18627 () Bool)

(assert (=> b!21563 (=> (not res!18627) (not e!14617))))

(assert (=> b!21563 (= res!18627 (isPrefixOf!0 (_2!1339 lt!30444) (_2!1339 lt!31226)))))

(declare-fun b!21564 () Bool)

(assert (=> b!21564 (= e!14618 (validate_offset_bits!1 ((_ sign_extend 32) (size!646 (buf!958 (_2!1339 lt!30444)))) ((_ sign_extend 32) (currentByte!2253 (_2!1339 lt!30444))) ((_ sign_extend 32) (currentBit!2248 (_2!1339 lt!30444))) lt!31214))))

(declare-fun d!6844 () Bool)

(assert (=> d!6844 e!14617))

(declare-fun res!18624 () Bool)

(assert (=> d!6844 (=> (not res!18624) (not e!14617))))

(declare-fun lt!31239 () (_ BitVec 64))

(assert (=> d!6844 (= res!18624 (= (bitIndex!0 (size!646 (buf!958 (_2!1339 lt!31226))) (currentByte!2253 (_2!1339 lt!31226)) (currentBit!2248 (_2!1339 lt!31226))) (bvsub lt!31239 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!6844 (or (= (bvand lt!31239 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!31239 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!31239 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!31229 () (_ BitVec 64))

(assert (=> d!6844 (= lt!31239 (bvadd lt!31229 to!314))))

(assert (=> d!6844 (or (not (= (bvand lt!31229 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!31229 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!31229 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!6844 (= lt!31229 (bitIndex!0 (size!646 (buf!958 (_2!1339 lt!30444))) (currentByte!2253 (_2!1339 lt!30444)) (currentBit!2248 (_2!1339 lt!30444))))))

(assert (=> d!6844 (= lt!31226 e!14619)))

(assert (=> d!6844 (= c!1540 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!31244 () Unit!1862)

(declare-fun lt!31204 () Unit!1862)

(assert (=> d!6844 (= lt!31244 lt!31204)))

(assert (=> d!6844 (isPrefixOf!0 (_2!1339 lt!30444) (_2!1339 lt!30444))))

(assert (=> d!6844 (= lt!31204 (lemmaIsPrefixRefl!0 (_2!1339 lt!30444)))))

(assert (=> d!6844 (= lt!31231 (bitIndex!0 (size!646 (buf!958 (_2!1339 lt!30444))) (currentByte!2253 (_2!1339 lt!30444)) (currentBit!2248 (_2!1339 lt!30444))))))

(assert (=> d!6844 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!6844 (= (appendBitsMSBFirstLoop!0 (_2!1339 lt!30444) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!31226)))

(declare-fun b!21565 () Bool)

(declare-fun res!18626 () Bool)

(assert (=> b!21565 (=> (not res!18626) (not e!14617))))

(assert (=> b!21565 (= res!18626 (= (size!646 (buf!958 (_2!1339 lt!31226))) (size!646 (buf!958 (_2!1339 lt!30444)))))))

(assert (= (and d!6844 c!1540) b!21562))

(assert (= (and d!6844 (not c!1540)) b!21559))

(assert (= (or b!21562 b!21559) bm!308))

(assert (= (and d!6844 res!18624) b!21561))

(assert (= (and b!21561 res!18628) b!21560))

(assert (= (and b!21560 res!18629) b!21563))

(assert (= (and b!21563 res!18627) b!21565))

(assert (= (and b!21565 res!18626) b!21558))

(assert (= (and b!21558 res!18625) b!21564))

(declare-fun m!29817 () Bool)

(assert (=> bm!308 m!29817))

(declare-fun m!29819 () Bool)

(assert (=> b!21559 m!29819))

(declare-fun m!29821 () Bool)

(assert (=> b!21559 m!29821))

(declare-fun m!29823 () Bool)

(assert (=> b!21558 m!29823))

(declare-fun m!29825 () Bool)

(assert (=> b!21558 m!29825))

(declare-fun m!29827 () Bool)

(assert (=> b!21558 m!29827))

(declare-fun m!29829 () Bool)

(assert (=> b!21558 m!29829))

(declare-fun m!29831 () Bool)

(assert (=> b!21558 m!29831))

(declare-fun m!29833 () Bool)

(assert (=> b!21562 m!29833))

(declare-fun m!29835 () Bool)

(assert (=> b!21562 m!29835))

(declare-fun m!29837 () Bool)

(assert (=> b!21562 m!29837))

(declare-fun m!29839 () Bool)

(assert (=> b!21562 m!29839))

(declare-fun m!29841 () Bool)

(assert (=> b!21562 m!29841))

(declare-fun m!29843 () Bool)

(assert (=> b!21562 m!29843))

(declare-fun m!29845 () Bool)

(assert (=> b!21562 m!29845))

(declare-fun m!29847 () Bool)

(assert (=> b!21562 m!29847))

(declare-fun m!29849 () Bool)

(assert (=> b!21562 m!29849))

(declare-fun m!29851 () Bool)

(assert (=> b!21562 m!29851))

(declare-fun m!29853 () Bool)

(assert (=> b!21562 m!29853))

(declare-fun m!29855 () Bool)

(assert (=> b!21562 m!29855))

(declare-fun m!29857 () Bool)

(assert (=> b!21562 m!29857))

(declare-fun m!29859 () Bool)

(assert (=> b!21562 m!29859))

(declare-fun m!29861 () Bool)

(assert (=> b!21562 m!29861))

(declare-fun m!29863 () Bool)

(assert (=> b!21562 m!29863))

(assert (=> b!21562 m!29849))

(declare-fun m!29865 () Bool)

(assert (=> b!21562 m!29865))

(declare-fun m!29867 () Bool)

(assert (=> b!21562 m!29867))

(declare-fun m!29869 () Bool)

(assert (=> b!21562 m!29869))

(assert (=> b!21562 m!29861))

(declare-fun m!29871 () Bool)

(assert (=> b!21562 m!29871))

(declare-fun m!29873 () Bool)

(assert (=> b!21562 m!29873))

(declare-fun m!29875 () Bool)

(assert (=> b!21562 m!29875))

(declare-fun m!29877 () Bool)

(assert (=> b!21562 m!29877))

(assert (=> b!21562 m!29497))

(assert (=> b!21562 m!29867))

(declare-fun m!29879 () Bool)

(assert (=> b!21562 m!29879))

(assert (=> b!21562 m!29839))

(declare-fun m!29881 () Bool)

(assert (=> b!21562 m!29881))

(declare-fun m!29883 () Bool)

(assert (=> b!21562 m!29883))

(declare-fun m!29885 () Bool)

(assert (=> b!21562 m!29885))

(declare-fun m!29887 () Bool)

(assert (=> b!21562 m!29887))

(declare-fun m!29889 () Bool)

(assert (=> b!21562 m!29889))

(declare-fun m!29891 () Bool)

(assert (=> b!21562 m!29891))

(declare-fun m!29893 () Bool)

(assert (=> b!21562 m!29893))

(declare-fun m!29895 () Bool)

(assert (=> d!6844 m!29895))

(assert (=> d!6844 m!29497))

(assert (=> d!6844 m!29513))

(assert (=> d!6844 m!29521))

(declare-fun m!29897 () Bool)

(assert (=> b!21563 m!29897))

(declare-fun m!29899 () Bool)

(assert (=> b!21564 m!29899))

(declare-fun m!29901 () Bool)

(assert (=> b!21561 m!29901))

(assert (=> b!21250 d!6844))

(declare-fun d!6896 () Bool)

(declare-fun res!18632 () Bool)

(declare-fun e!14621 () Bool)

(assert (=> d!6896 (=> (not res!18632) (not e!14621))))

(assert (=> d!6896 (= res!18632 (= (size!646 (buf!958 (_2!1339 lt!30444))) (size!646 (buf!958 (_2!1339 lt!30446)))))))

(assert (=> d!6896 (= (isPrefixOf!0 (_2!1339 lt!30444) (_2!1339 lt!30446)) e!14621)))

(declare-fun b!21566 () Bool)

(declare-fun res!18630 () Bool)

(assert (=> b!21566 (=> (not res!18630) (not e!14621))))

(assert (=> b!21566 (= res!18630 (bvsle (bitIndex!0 (size!646 (buf!958 (_2!1339 lt!30444))) (currentByte!2253 (_2!1339 lt!30444)) (currentBit!2248 (_2!1339 lt!30444))) (bitIndex!0 (size!646 (buf!958 (_2!1339 lt!30446))) (currentByte!2253 (_2!1339 lt!30446)) (currentBit!2248 (_2!1339 lt!30446)))))))

(declare-fun b!21567 () Bool)

(declare-fun e!14620 () Bool)

(assert (=> b!21567 (= e!14621 e!14620)))

(declare-fun res!18631 () Bool)

(assert (=> b!21567 (=> res!18631 e!14620)))

(assert (=> b!21567 (= res!18631 (= (size!646 (buf!958 (_2!1339 lt!30444))) #b00000000000000000000000000000000))))

(declare-fun b!21568 () Bool)

(assert (=> b!21568 (= e!14620 (arrayBitRangesEq!0 (buf!958 (_2!1339 lt!30444)) (buf!958 (_2!1339 lt!30446)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!646 (buf!958 (_2!1339 lt!30444))) (currentByte!2253 (_2!1339 lt!30444)) (currentBit!2248 (_2!1339 lt!30444)))))))

(assert (= (and d!6896 res!18632) b!21566))

