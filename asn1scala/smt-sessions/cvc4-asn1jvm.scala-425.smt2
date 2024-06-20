; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11170 () Bool)

(assert start!11170)

(declare-fun b!55468 () Bool)

(declare-fun e!36988 () Bool)

(declare-fun e!36987 () Bool)

(assert (=> b!55468 (= e!36988 e!36987)))

(declare-fun res!46207 () Bool)

(assert (=> b!55468 (=> res!46207 e!36987)))

(declare-datatypes ((array!2585 0))(
  ( (array!2586 (arr!1723 (Array (_ BitVec 32) (_ BitVec 8))) (size!1177 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2042 0))(
  ( (BitStream!2043 (buf!1540 array!2585) (currentByte!3122 (_ BitVec 32)) (currentBit!3117 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!3833 0))(
  ( (Unit!3834) )
))
(declare-datatypes ((tuple2!5062 0))(
  ( (tuple2!5063 (_1!2642 Unit!3833) (_2!2642 BitStream!2042)) )
))
(declare-fun lt!86537 () tuple2!5062)

(declare-fun lt!86533 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!55468 (= res!46207 (not (= (bitIndex!0 (size!1177 (buf!1540 (_2!2642 lt!86537))) (currentByte!3122 (_2!2642 lt!86537)) (currentBit!3117 (_2!2642 lt!86537))) (bvsub lt!86533 i!635))))))

(declare-fun lt!86540 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!55468 (= lt!86533 (bvadd lt!86540 to!314))))

(declare-fun res!46211 () Bool)

(declare-fun e!36991 () Bool)

(assert (=> start!11170 (=> (not res!46211) (not e!36991))))

(declare-fun srcBuffer!2 () array!2585)

(assert (=> start!11170 (= res!46211 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1177 srcBuffer!2))))))))

(assert (=> start!11170 e!36991))

(assert (=> start!11170 true))

(declare-fun array_inv!1080 (array!2585) Bool)

(assert (=> start!11170 (array_inv!1080 srcBuffer!2)))

(declare-fun thiss!1379 () BitStream!2042)

(declare-fun e!36990 () Bool)

(declare-fun inv!12 (BitStream!2042) Bool)

(assert (=> start!11170 (and (inv!12 thiss!1379) e!36990)))

(declare-fun b!55469 () Bool)

(declare-fun res!46209 () Bool)

(assert (=> b!55469 (=> res!46209 e!36987)))

(assert (=> b!55469 (= res!46209 (not (= (size!1177 (buf!1540 thiss!1379)) (size!1177 (buf!1540 (_2!2642 lt!86537))))))))

(declare-fun b!55470 () Bool)

(declare-fun e!36984 () Bool)

(assert (=> b!55470 (= e!36984 e!36988)))

(declare-fun res!46214 () Bool)

(assert (=> b!55470 (=> res!46214 e!36988)))

(declare-fun lt!86541 () tuple2!5062)

(declare-fun isPrefixOf!0 (BitStream!2042 BitStream!2042) Bool)

(assert (=> b!55470 (= res!46214 (not (isPrefixOf!0 (_2!2642 lt!86541) (_2!2642 lt!86537))))))

(assert (=> b!55470 (isPrefixOf!0 thiss!1379 (_2!2642 lt!86537))))

(declare-fun lt!86536 () Unit!3833)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2042 BitStream!2042 BitStream!2042) Unit!3833)

(assert (=> b!55470 (= lt!86536 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2642 lt!86541) (_2!2642 lt!86537)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2042 array!2585 (_ BitVec 64) (_ BitVec 64)) tuple2!5062)

(assert (=> b!55470 (= lt!86537 (appendBitsMSBFirstLoop!0 (_2!2642 lt!86541) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!36992 () Bool)

(assert (=> b!55470 e!36992))

(declare-fun res!46212 () Bool)

(assert (=> b!55470 (=> (not res!46212) (not e!36992))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!55470 (= res!46212 (validate_offset_bits!1 ((_ sign_extend 32) (size!1177 (buf!1540 (_2!2642 lt!86541)))) ((_ sign_extend 32) (currentByte!3122 thiss!1379)) ((_ sign_extend 32) (currentBit!3117 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!86535 () Unit!3833)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2042 array!2585 (_ BitVec 64)) Unit!3833)

(assert (=> b!55470 (= lt!86535 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1540 (_2!2642 lt!86541)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!5064 0))(
  ( (tuple2!5065 (_1!2643 BitStream!2042) (_2!2643 BitStream!2042)) )
))
(declare-fun lt!86539 () tuple2!5064)

(declare-fun reader!0 (BitStream!2042 BitStream!2042) tuple2!5064)

(assert (=> b!55470 (= lt!86539 (reader!0 thiss!1379 (_2!2642 lt!86541)))))

(declare-fun b!55471 () Bool)

(declare-fun res!46215 () Bool)

(assert (=> b!55471 (=> (not res!46215) (not e!36991))))

(assert (=> b!55471 (= res!46215 (validate_offset_bits!1 ((_ sign_extend 32) (size!1177 (buf!1540 thiss!1379))) ((_ sign_extend 32) (currentByte!3122 thiss!1379)) ((_ sign_extend 32) (currentBit!3117 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!55472 () Bool)

(assert (=> b!55472 (= e!36990 (array_inv!1080 (buf!1540 thiss!1379)))))

(declare-fun b!55473 () Bool)

(declare-fun e!36985 () Bool)

(assert (=> b!55473 (= e!36991 (not e!36985))))

(declare-fun res!46210 () Bool)

(assert (=> b!55473 (=> res!46210 e!36985)))

(assert (=> b!55473 (= res!46210 (bvsge i!635 to!314))))

(assert (=> b!55473 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!86542 () Unit!3833)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2042) Unit!3833)

(assert (=> b!55473 (= lt!86542 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!55473 (= lt!86540 (bitIndex!0 (size!1177 (buf!1540 thiss!1379)) (currentByte!3122 thiss!1379) (currentBit!3117 thiss!1379)))))

(declare-fun b!55474 () Bool)

(declare-fun res!46213 () Bool)

(assert (=> b!55474 (=> res!46213 e!36987)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!55474 (= res!46213 (not (invariant!0 (currentBit!3117 (_2!2642 lt!86537)) (currentByte!3122 (_2!2642 lt!86537)) (size!1177 (buf!1540 (_2!2642 lt!86537))))))))

(declare-fun b!55475 () Bool)

(declare-fun lt!86538 () (_ BitVec 64))

(assert (=> b!55475 (= e!36987 (or (not (= lt!86538 (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!86538 (bvand lt!86533 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!55475 (= lt!86538 (bvand lt!86540 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!55475 (= (size!1177 (buf!1540 (_2!2642 lt!86537))) (size!1177 (buf!1540 thiss!1379)))))

(declare-fun b!55476 () Bool)

(declare-datatypes ((List!596 0))(
  ( (Nil!593) (Cons!592 (h!711 Bool) (t!1346 List!596)) )
))
(declare-fun head!415 (List!596) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2042 array!2585 (_ BitVec 64) (_ BitVec 64)) List!596)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2042 BitStream!2042 (_ BitVec 64)) List!596)

(assert (=> b!55476 (= e!36992 (= (head!415 (byteArrayBitContentToList!0 (_2!2642 lt!86541) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!415 (bitStreamReadBitsIntoList!0 (_2!2642 lt!86541) (_1!2643 lt!86539) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!55477 () Bool)

(assert (=> b!55477 (= e!36985 e!36984)))

(declare-fun res!46208 () Bool)

(assert (=> b!55477 (=> res!46208 e!36984)))

(assert (=> b!55477 (= res!46208 (not (isPrefixOf!0 thiss!1379 (_2!2642 lt!86541))))))

(assert (=> b!55477 (validate_offset_bits!1 ((_ sign_extend 32) (size!1177 (buf!1540 (_2!2642 lt!86541)))) ((_ sign_extend 32) (currentByte!3122 (_2!2642 lt!86541))) ((_ sign_extend 32) (currentBit!3117 (_2!2642 lt!86541))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!86534 () Unit!3833)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2042 BitStream!2042 (_ BitVec 64) (_ BitVec 64)) Unit!3833)

(assert (=> b!55477 (= lt!86534 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2642 lt!86541) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2042 (_ BitVec 8) (_ BitVec 32)) tuple2!5062)

(assert (=> b!55477 (= lt!86541 (appendBitFromByte!0 thiss!1379 (select (arr!1723 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (= (and start!11170 res!46211) b!55471))

(assert (= (and b!55471 res!46215) b!55473))

(assert (= (and b!55473 (not res!46210)) b!55477))

(assert (= (and b!55477 (not res!46208)) b!55470))

(assert (= (and b!55470 res!46212) b!55476))

(assert (= (and b!55470 (not res!46214)) b!55468))

(assert (= (and b!55468 (not res!46207)) b!55474))

(assert (= (and b!55474 (not res!46213)) b!55469))

(assert (= (and b!55469 (not res!46209)) b!55475))

(assert (= start!11170 b!55472))

(declare-fun m!87383 () Bool)

(assert (=> b!55471 m!87383))

(declare-fun m!87385 () Bool)

(assert (=> b!55474 m!87385))

(declare-fun m!87387 () Bool)

(assert (=> b!55477 m!87387))

(declare-fun m!87389 () Bool)

(assert (=> b!55477 m!87389))

(declare-fun m!87391 () Bool)

(assert (=> b!55477 m!87391))

(declare-fun m!87393 () Bool)

(assert (=> b!55477 m!87393))

(assert (=> b!55477 m!87387))

(declare-fun m!87395 () Bool)

(assert (=> b!55477 m!87395))

(declare-fun m!87397 () Bool)

(assert (=> b!55476 m!87397))

(assert (=> b!55476 m!87397))

(declare-fun m!87399 () Bool)

(assert (=> b!55476 m!87399))

(declare-fun m!87401 () Bool)

(assert (=> b!55476 m!87401))

(assert (=> b!55476 m!87401))

(declare-fun m!87403 () Bool)

(assert (=> b!55476 m!87403))

(declare-fun m!87405 () Bool)

(assert (=> b!55468 m!87405))

(declare-fun m!87407 () Bool)

(assert (=> start!11170 m!87407))

(declare-fun m!87409 () Bool)

(assert (=> start!11170 m!87409))

(declare-fun m!87411 () Bool)

(assert (=> b!55473 m!87411))

(declare-fun m!87413 () Bool)

(assert (=> b!55473 m!87413))

(declare-fun m!87415 () Bool)

(assert (=> b!55473 m!87415))

(declare-fun m!87417 () Bool)

(assert (=> b!55470 m!87417))

(declare-fun m!87419 () Bool)

(assert (=> b!55470 m!87419))

(declare-fun m!87421 () Bool)

(assert (=> b!55470 m!87421))

(declare-fun m!87423 () Bool)

(assert (=> b!55470 m!87423))

(declare-fun m!87425 () Bool)

(assert (=> b!55470 m!87425))

(declare-fun m!87427 () Bool)

(assert (=> b!55470 m!87427))

(declare-fun m!87429 () Bool)

(assert (=> b!55470 m!87429))

(declare-fun m!87431 () Bool)

(assert (=> b!55472 m!87431))

(push 1)

(assert (not b!55468))

(assert (not b!55477))

(assert (not b!55472))

(assert (not b!55476))

(assert (not b!55470))

(assert (not start!11170))

(assert (not b!55473))

(assert (not b!55474))

(assert (not b!55471))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!17664 () Bool)

(declare-fun res!46243 () Bool)

(declare-fun e!37011 () Bool)

(assert (=> d!17664 (=> (not res!46243) (not e!37011))))

(assert (=> d!17664 (= res!46243 (= (size!1177 (buf!1540 thiss!1379)) (size!1177 (buf!1540 thiss!1379))))))

(assert (=> d!17664 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!37011)))

(declare-fun b!55505 () Bool)

(declare-fun res!46245 () Bool)

(assert (=> b!55505 (=> (not res!46245) (not e!37011))))

(assert (=> b!55505 (= res!46245 (bvsle (bitIndex!0 (size!1177 (buf!1540 thiss!1379)) (currentByte!3122 thiss!1379) (currentBit!3117 thiss!1379)) (bitIndex!0 (size!1177 (buf!1540 thiss!1379)) (currentByte!3122 thiss!1379) (currentBit!3117 thiss!1379))))))

(declare-fun b!55506 () Bool)

(declare-fun e!37010 () Bool)

(assert (=> b!55506 (= e!37011 e!37010)))

(declare-fun res!46244 () Bool)

(assert (=> b!55506 (=> res!46244 e!37010)))

(assert (=> b!55506 (= res!46244 (= (size!1177 (buf!1540 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!55507 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2585 array!2585 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!55507 (= e!37010 (arrayBitRangesEq!0 (buf!1540 thiss!1379) (buf!1540 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1177 (buf!1540 thiss!1379)) (currentByte!3122 thiss!1379) (currentBit!3117 thiss!1379))))))

(assert (= (and d!17664 res!46243) b!55505))

(assert (= (and b!55505 res!46245) b!55506))

(assert (= (and b!55506 (not res!46244)) b!55507))

(assert (=> b!55505 m!87415))

(assert (=> b!55505 m!87415))

(assert (=> b!55507 m!87415))

(assert (=> b!55507 m!87415))

(declare-fun m!87449 () Bool)

(assert (=> b!55507 m!87449))

(assert (=> b!55473 d!17664))

(declare-fun d!17666 () Bool)

(assert (=> d!17666 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!86569 () Unit!3833)

(declare-fun choose!11 (BitStream!2042) Unit!3833)

(assert (=> d!17666 (= lt!86569 (choose!11 thiss!1379))))

(assert (=> d!17666 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!86569)))

(declare-fun bs!4444 () Bool)

(assert (= bs!4444 d!17666))

(assert (=> bs!4444 m!87411))

(declare-fun m!87451 () Bool)

(assert (=> bs!4444 m!87451))

(assert (=> b!55473 d!17666))

(declare-fun d!17668 () Bool)

(declare-fun e!37014 () Bool)

(assert (=> d!17668 e!37014))

(declare-fun res!46251 () Bool)

(assert (=> d!17668 (=> (not res!46251) (not e!37014))))

(declare-fun lt!86587 () (_ BitVec 64))

(declare-fun lt!86584 () (_ BitVec 64))

(declare-fun lt!86582 () (_ BitVec 64))

(assert (=> d!17668 (= res!46251 (= lt!86584 (bvsub lt!86587 lt!86582)))))

(assert (=> d!17668 (or (= (bvand lt!86587 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!86582 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!86587 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!86587 lt!86582) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!17668 (= lt!86582 (remainingBits!0 ((_ sign_extend 32) (size!1177 (buf!1540 thiss!1379))) ((_ sign_extend 32) (currentByte!3122 thiss!1379)) ((_ sign_extend 32) (currentBit!3117 thiss!1379))))))

(declare-fun lt!86585 () (_ BitVec 64))

(declare-fun lt!86583 () (_ BitVec 64))

(assert (=> d!17668 (= lt!86587 (bvmul lt!86585 lt!86583))))

(assert (=> d!17668 (or (= lt!86585 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!86583 (bvsdiv (bvmul lt!86585 lt!86583) lt!86585)))))

(assert (=> d!17668 (= lt!86583 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!17668 (= lt!86585 ((_ sign_extend 32) (size!1177 (buf!1540 thiss!1379))))))

(assert (=> d!17668 (= lt!86584 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3122 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3117 thiss!1379))))))

(assert (=> d!17668 (invariant!0 (currentBit!3117 thiss!1379) (currentByte!3122 thiss!1379) (size!1177 (buf!1540 thiss!1379)))))

(assert (=> d!17668 (= (bitIndex!0 (size!1177 (buf!1540 thiss!1379)) (currentByte!3122 thiss!1379) (currentBit!3117 thiss!1379)) lt!86584)))

(declare-fun b!55512 () Bool)

(declare-fun res!46250 () Bool)

(assert (=> b!55512 (=> (not res!46250) (not e!37014))))

(assert (=> b!55512 (= res!46250 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!86584))))

(declare-fun b!55513 () Bool)

(declare-fun lt!86586 () (_ BitVec 64))

(assert (=> b!55513 (= e!37014 (bvsle lt!86584 (bvmul lt!86586 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!55513 (or (= lt!86586 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!86586 #b0000000000000000000000000000000000000000000000000000000000001000) lt!86586)))))

(assert (=> b!55513 (= lt!86586 ((_ sign_extend 32) (size!1177 (buf!1540 thiss!1379))))))

(assert (= (and d!17668 res!46251) b!55512))

(assert (= (and b!55512 res!46250) b!55513))

(declare-fun m!87453 () Bool)

(assert (=> d!17668 m!87453))

(declare-fun m!87455 () Bool)

(assert (=> d!17668 m!87455))

(assert (=> b!55473 d!17668))

(declare-fun d!17670 () Bool)

(declare-fun e!37015 () Bool)

(assert (=> d!17670 e!37015))

(declare-fun res!46253 () Bool)

(assert (=> d!17670 (=> (not res!46253) (not e!37015))))

(declare-fun lt!86590 () (_ BitVec 64))

(declare-fun lt!86593 () (_ BitVec 64))

(declare-fun lt!86588 () (_ BitVec 64))

(assert (=> d!17670 (= res!46253 (= lt!86590 (bvsub lt!86593 lt!86588)))))

(assert (=> d!17670 (or (= (bvand lt!86593 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!86588 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!86593 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!86593 lt!86588) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!17670 (= lt!86588 (remainingBits!0 ((_ sign_extend 32) (size!1177 (buf!1540 (_2!2642 lt!86537)))) ((_ sign_extend 32) (currentByte!3122 (_2!2642 lt!86537))) ((_ sign_extend 32) (currentBit!3117 (_2!2642 lt!86537)))))))

(declare-fun lt!86591 () (_ BitVec 64))

(declare-fun lt!86589 () (_ BitVec 64))

(assert (=> d!17670 (= lt!86593 (bvmul lt!86591 lt!86589))))

(assert (=> d!17670 (or (= lt!86591 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!86589 (bvsdiv (bvmul lt!86591 lt!86589) lt!86591)))))

(assert (=> d!17670 (= lt!86589 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!17670 (= lt!86591 ((_ sign_extend 32) (size!1177 (buf!1540 (_2!2642 lt!86537)))))))

(assert (=> d!17670 (= lt!86590 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3122 (_2!2642 lt!86537))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3117 (_2!2642 lt!86537)))))))

(assert (=> d!17670 (invariant!0 (currentBit!3117 (_2!2642 lt!86537)) (currentByte!3122 (_2!2642 lt!86537)) (size!1177 (buf!1540 (_2!2642 lt!86537))))))

(assert (=> d!17670 (= (bitIndex!0 (size!1177 (buf!1540 (_2!2642 lt!86537))) (currentByte!3122 (_2!2642 lt!86537)) (currentBit!3117 (_2!2642 lt!86537))) lt!86590)))

(declare-fun b!55514 () Bool)

(declare-fun res!46252 () Bool)

(assert (=> b!55514 (=> (not res!46252) (not e!37015))))

(assert (=> b!55514 (= res!46252 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!86590))))

(declare-fun b!55515 () Bool)

(declare-fun lt!86592 () (_ BitVec 64))

(assert (=> b!55515 (= e!37015 (bvsle lt!86590 (bvmul lt!86592 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!55515 (or (= lt!86592 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!86592 #b0000000000000000000000000000000000000000000000000000000000001000) lt!86592)))))

(assert (=> b!55515 (= lt!86592 ((_ sign_extend 32) (size!1177 (buf!1540 (_2!2642 lt!86537)))))))

(assert (= (and d!17670 res!46253) b!55514))

(assert (= (and b!55514 res!46252) b!55515))

(declare-fun m!87457 () Bool)

(assert (=> d!17670 m!87457))

(assert (=> d!17670 m!87385))

(assert (=> b!55468 d!17670))

(declare-fun d!17672 () Bool)

(assert (=> d!17672 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1177 (buf!1540 thiss!1379))) ((_ sign_extend 32) (currentByte!3122 thiss!1379)) ((_ sign_extend 32) (currentBit!3117 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1177 (buf!1540 thiss!1379))) ((_ sign_extend 32) (currentByte!3122 thiss!1379)) ((_ sign_extend 32) (currentBit!3117 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4445 () Bool)

(assert (= bs!4445 d!17672))

(assert (=> bs!4445 m!87453))

(assert (=> b!55471 d!17672))

(declare-fun d!17674 () Bool)

(declare-fun res!46254 () Bool)

(declare-fun e!37017 () Bool)

(assert (=> d!17674 (=> (not res!46254) (not e!37017))))

(assert (=> d!17674 (= res!46254 (= (size!1177 (buf!1540 thiss!1379)) (size!1177 (buf!1540 (_2!2642 lt!86541)))))))

(assert (=> d!17674 (= (isPrefixOf!0 thiss!1379 (_2!2642 lt!86541)) e!37017)))

(declare-fun b!55516 () Bool)

(declare-fun res!46256 () Bool)

(assert (=> b!55516 (=> (not res!46256) (not e!37017))))

(assert (=> b!55516 (= res!46256 (bvsle (bitIndex!0 (size!1177 (buf!1540 thiss!1379)) (currentByte!3122 thiss!1379) (currentBit!3117 thiss!1379)) (bitIndex!0 (size!1177 (buf!1540 (_2!2642 lt!86541))) (currentByte!3122 (_2!2642 lt!86541)) (currentBit!3117 (_2!2642 lt!86541)))))))

(declare-fun b!55517 () Bool)

(declare-fun e!37016 () Bool)

(assert (=> b!55517 (= e!37017 e!37016)))

(declare-fun res!46255 () Bool)

(assert (=> b!55517 (=> res!46255 e!37016)))

(assert (=> b!55517 (= res!46255 (= (size!1177 (buf!1540 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!55518 () Bool)

(assert (=> b!55518 (= e!37016 (arrayBitRangesEq!0 (buf!1540 thiss!1379) (buf!1540 (_2!2642 lt!86541)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1177 (buf!1540 thiss!1379)) (currentByte!3122 thiss!1379) (currentBit!3117 thiss!1379))))))

(assert (= (and d!17674 res!46254) b!55516))

(assert (= (and b!55516 res!46256) b!55517))

(assert (= (and b!55517 (not res!46255)) b!55518))

(assert (=> b!55516 m!87415))

(declare-fun m!87459 () Bool)

(assert (=> b!55516 m!87459))

(assert (=> b!55518 m!87415))

(assert (=> b!55518 m!87415))

(declare-fun m!87461 () Bool)

(assert (=> b!55518 m!87461))

(assert (=> b!55477 d!17674))

(declare-fun d!17676 () Bool)

(assert (=> d!17676 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1177 (buf!1540 (_2!2642 lt!86541)))) ((_ sign_extend 32) (currentByte!3122 (_2!2642 lt!86541))) ((_ sign_extend 32) (currentBit!3117 (_2!2642 lt!86541))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1177 (buf!1540 (_2!2642 lt!86541)))) ((_ sign_extend 32) (currentByte!3122 (_2!2642 lt!86541))) ((_ sign_extend 32) (currentBit!3117 (_2!2642 lt!86541)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!4446 () Bool)

(assert (= bs!4446 d!17676))

(declare-fun m!87463 () Bool)

(assert (=> bs!4446 m!87463))

(assert (=> b!55477 d!17676))

(declare-fun d!17678 () Bool)

(declare-fun e!37020 () Bool)

(assert (=> d!17678 e!37020))

(declare-fun res!46259 () Bool)

(assert (=> d!17678 (=> (not res!46259) (not e!37020))))

(assert (=> d!17678 (= res!46259 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!86596 () Unit!3833)

(declare-fun choose!27 (BitStream!2042 BitStream!2042 (_ BitVec 64) (_ BitVec 64)) Unit!3833)

(assert (=> d!17678 (= lt!86596 (choose!27 thiss!1379 (_2!2642 lt!86541) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!17678 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!17678 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2642 lt!86541) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!86596)))

(declare-fun b!55521 () Bool)

(assert (=> b!55521 (= e!37020 (validate_offset_bits!1 ((_ sign_extend 32) (size!1177 (buf!1540 (_2!2642 lt!86541)))) ((_ sign_extend 32) (currentByte!3122 (_2!2642 lt!86541))) ((_ sign_extend 32) (currentBit!3117 (_2!2642 lt!86541))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!17678 res!46259) b!55521))

(declare-fun m!87465 () Bool)

(assert (=> d!17678 m!87465))

(assert (=> b!55521 m!87393))

(assert (=> b!55477 d!17678))

(declare-fun b!55560 () Bool)

(declare-fun res!46298 () Bool)

(declare-fun e!37041 () Bool)

(assert (=> b!55560 (=> (not res!46298) (not e!37041))))

(declare-fun lt!86710 () (_ BitVec 64))

(declare-fun lt!86704 () tuple2!5062)

(declare-fun lt!86709 () (_ BitVec 64))

(assert (=> b!55560 (= res!46298 (= (bitIndex!0 (size!1177 (buf!1540 (_2!2642 lt!86704))) (currentByte!3122 (_2!2642 lt!86704)) (currentBit!3117 (_2!2642 lt!86704))) (bvadd lt!86710 lt!86709)))))

(assert (=> b!55560 (or (not (= (bvand lt!86710 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!86709 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!86710 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!86710 lt!86709) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!55560 (= lt!86709 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!55560 (= lt!86710 (bitIndex!0 (size!1177 (buf!1540 thiss!1379)) (currentByte!3122 thiss!1379) (currentBit!3117 thiss!1379)))))

(declare-fun b!55562 () Bool)

(declare-fun res!46295 () Bool)

(declare-fun e!37038 () Bool)

(assert (=> b!55562 (=> (not res!46295) (not e!37038))))

(declare-fun lt!86701 () tuple2!5062)

(assert (=> b!55562 (= res!46295 (isPrefixOf!0 thiss!1379 (_2!2642 lt!86701)))))

(declare-fun b!55563 () Bool)

(declare-fun e!37040 () Bool)

(declare-datatypes ((tuple2!5074 0))(
  ( (tuple2!5075 (_1!2648 BitStream!2042) (_2!2648 Bool)) )
))
(declare-fun lt!86705 () tuple2!5074)

(assert (=> b!55563 (= e!37040 (= (bitIndex!0 (size!1177 (buf!1540 (_1!2648 lt!86705))) (currentByte!3122 (_1!2648 lt!86705)) (currentBit!3117 (_1!2648 lt!86705))) (bitIndex!0 (size!1177 (buf!1540 (_2!2642 lt!86704))) (currentByte!3122 (_2!2642 lt!86704)) (currentBit!3117 (_2!2642 lt!86704)))))))

(declare-fun b!55564 () Bool)

(declare-fun res!46297 () Bool)

(assert (=> b!55564 (=> (not res!46297) (not e!37038))))

(assert (=> b!55564 (= res!46297 (= (bitIndex!0 (size!1177 (buf!1540 (_2!2642 lt!86701))) (currentByte!3122 (_2!2642 lt!86701)) (currentBit!3117 (_2!2642 lt!86701))) (bvadd (bitIndex!0 (size!1177 (buf!1540 thiss!1379)) (currentByte!3122 thiss!1379) (currentBit!3117 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!55565 () Bool)

(declare-fun res!46294 () Bool)

(assert (=> b!55565 (=> (not res!46294) (not e!37041))))

(assert (=> b!55565 (= res!46294 (isPrefixOf!0 thiss!1379 (_2!2642 lt!86704)))))

(declare-fun b!55566 () Bool)

(declare-fun e!37039 () Bool)

(assert (=> b!55566 (= e!37038 e!37039)))

(declare-fun res!46296 () Bool)

(assert (=> b!55566 (=> (not res!46296) (not e!37039))))

(declare-fun lt!86708 () Bool)

(declare-fun lt!86706 () tuple2!5074)

(assert (=> b!55566 (= res!46296 (and (= (_2!2648 lt!86706) lt!86708) (= (_1!2648 lt!86706) (_2!2642 lt!86701))))))

(declare-fun readBitPure!0 (BitStream!2042) tuple2!5074)

(declare-fun readerFrom!0 (BitStream!2042 (_ BitVec 32) (_ BitVec 32)) BitStream!2042)

(assert (=> b!55566 (= lt!86706 (readBitPure!0 (readerFrom!0 (_2!2642 lt!86701) (currentBit!3117 thiss!1379) (currentByte!3122 thiss!1379))))))

(declare-fun b!55567 () Bool)

(assert (=> b!55567 (= e!37041 e!37040)))

(declare-fun res!46291 () Bool)

(assert (=> b!55567 (=> (not res!46291) (not e!37040))))

(declare-fun lt!86702 () (_ BitVec 8))

(assert (=> b!55567 (= res!46291 (and (= (_2!2648 lt!86705) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1723 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!86702)) #b00000000000000000000000000000000))) (= (_1!2648 lt!86705) (_2!2642 lt!86704))))))

(declare-datatypes ((tuple2!5076 0))(
  ( (tuple2!5077 (_1!2649 array!2585) (_2!2649 BitStream!2042)) )
))
(declare-fun lt!86700 () tuple2!5076)

(declare-fun lt!86703 () BitStream!2042)

(declare-fun readBits!0 (BitStream!2042 (_ BitVec 64)) tuple2!5076)

(assert (=> b!55567 (= lt!86700 (readBits!0 lt!86703 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!55567 (= lt!86705 (readBitPure!0 lt!86703))))

(assert (=> b!55567 (= lt!86703 (readerFrom!0 (_2!2642 lt!86704) (currentBit!3117 thiss!1379) (currentByte!3122 thiss!1379)))))

(declare-fun d!17680 () Bool)

(assert (=> d!17680 e!37041))

(declare-fun res!46293 () Bool)

(assert (=> d!17680 (=> (not res!46293) (not e!37041))))

(assert (=> d!17680 (= res!46293 (= (size!1177 (buf!1540 (_2!2642 lt!86704))) (size!1177 (buf!1540 thiss!1379))))))

(declare-fun lt!86707 () array!2585)

(assert (=> d!17680 (= lt!86702 (select (arr!1723 lt!86707) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!17680 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1177 lt!86707)))))

(assert (=> d!17680 (= lt!86707 (array!2586 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!86699 () tuple2!5062)

(assert (=> d!17680 (= lt!86704 (tuple2!5063 (_1!2642 lt!86699) (_2!2642 lt!86699)))))

(assert (=> d!17680 (= lt!86699 lt!86701)))

(assert (=> d!17680 e!37038))

(declare-fun res!46292 () Bool)

(assert (=> d!17680 (=> (not res!46292) (not e!37038))))

(assert (=> d!17680 (= res!46292 (= (size!1177 (buf!1540 thiss!1379)) (size!1177 (buf!1540 (_2!2642 lt!86701)))))))

(declare-fun appendBit!0 (BitStream!2042 Bool) tuple2!5062)

(assert (=> d!17680 (= lt!86701 (appendBit!0 thiss!1379 lt!86708))))

(assert (=> d!17680 (= lt!86708 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1723 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!17680 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!17680 (= (appendBitFromByte!0 thiss!1379 (select (arr!1723 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!86704)))

(declare-fun b!55561 () Bool)

(assert (=> b!55561 (= e!37039 (= (bitIndex!0 (size!1177 (buf!1540 (_1!2648 lt!86706))) (currentByte!3122 (_1!2648 lt!86706)) (currentBit!3117 (_1!2648 lt!86706))) (bitIndex!0 (size!1177 (buf!1540 (_2!2642 lt!86701))) (currentByte!3122 (_2!2642 lt!86701)) (currentBit!3117 (_2!2642 lt!86701)))))))

(assert (= (and d!17680 res!46292) b!55564))

(assert (= (and b!55564 res!46297) b!55562))

(assert (= (and b!55562 res!46295) b!55566))

(assert (= (and b!55566 res!46296) b!55561))

(assert (= (and d!17680 res!46293) b!55560))

(assert (= (and b!55560 res!46298) b!55565))

(assert (= (and b!55565 res!46294) b!55567))

(assert (= (and b!55567 res!46291) b!55563))

(declare-fun m!87497 () Bool)

(assert (=> d!17680 m!87497))

(declare-fun m!87499 () Bool)

(assert (=> d!17680 m!87499))

(declare-fun m!87501 () Bool)

(assert (=> d!17680 m!87501))

(declare-fun m!87503 () Bool)

(assert (=> b!55565 m!87503))

(declare-fun m!87505 () Bool)

(assert (=> b!55561 m!87505))

(declare-fun m!87507 () Bool)

(assert (=> b!55561 m!87507))

(declare-fun m!87509 () Bool)

(assert (=> b!55566 m!87509))

(assert (=> b!55566 m!87509))

(declare-fun m!87511 () Bool)

(assert (=> b!55566 m!87511))

(declare-fun m!87513 () Bool)

(assert (=> b!55562 m!87513))

(assert (=> b!55564 m!87507))

(assert (=> b!55564 m!87415))

(declare-fun m!87515 () Bool)

(assert (=> b!55563 m!87515))

(declare-fun m!87517 () Bool)

(assert (=> b!55563 m!87517))

(assert (=> b!55560 m!87517))

(assert (=> b!55560 m!87415))

(declare-fun m!87519 () Bool)

(assert (=> b!55567 m!87519))

(declare-fun m!87521 () Bool)

(assert (=> b!55567 m!87521))

(declare-fun m!87523 () Bool)

(assert (=> b!55567 m!87523))

(assert (=> b!55477 d!17680))

(declare-fun d!17690 () Bool)

(assert (=> d!17690 (= (array_inv!1080 (buf!1540 thiss!1379)) (bvsge (size!1177 (buf!1540 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!55472 d!17690))

(declare-fun d!17692 () Bool)

(assert (=> d!17692 (= (array_inv!1080 srcBuffer!2) (bvsge (size!1177 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!11170 d!17692))

(declare-fun d!17694 () Bool)

(assert (=> d!17694 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3117 thiss!1379) (currentByte!3122 thiss!1379) (size!1177 (buf!1540 thiss!1379))))))

(declare-fun bs!4447 () Bool)

(assert (= bs!4447 d!17694))

(assert (=> bs!4447 m!87455))

(assert (=> start!11170 d!17694))

(declare-fun d!17696 () Bool)

(declare-fun e!37112 () Bool)

(assert (=> d!17696 e!37112))

(declare-fun res!46413 () Bool)

(assert (=> d!17696 (=> (not res!46413) (not e!37112))))

(declare-fun lt!87216 () tuple2!5062)

(declare-fun lt!87208 () (_ BitVec 64))

(assert (=> d!17696 (= res!46413 (= (bitIndex!0 (size!1177 (buf!1540 (_2!2642 lt!87216))) (currentByte!3122 (_2!2642 lt!87216)) (currentBit!3117 (_2!2642 lt!87216))) (bvsub lt!87208 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!17696 (or (= (bvand lt!87208 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!87208 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!87208 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!87230 () (_ BitVec 64))

(assert (=> d!17696 (= lt!87208 (bvadd lt!87230 to!314))))

(assert (=> d!17696 (or (not (= (bvand lt!87230 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!87230 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!87230 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!17696 (= lt!87230 (bitIndex!0 (size!1177 (buf!1540 (_2!2642 lt!86541))) (currentByte!3122 (_2!2642 lt!86541)) (currentBit!3117 (_2!2642 lt!86541))))))

(declare-fun e!37113 () tuple2!5062)

(assert (=> d!17696 (= lt!87216 e!37113)))

(declare-fun c!3981 () Bool)

(assert (=> d!17696 (= c!3981 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!87211 () Unit!3833)

(declare-fun lt!87213 () Unit!3833)

(assert (=> d!17696 (= lt!87211 lt!87213)))

(assert (=> d!17696 (isPrefixOf!0 (_2!2642 lt!86541) (_2!2642 lt!86541))))

(assert (=> d!17696 (= lt!87213 (lemmaIsPrefixRefl!0 (_2!2642 lt!86541)))))

(declare-fun lt!87235 () (_ BitVec 64))

(assert (=> d!17696 (= lt!87235 (bitIndex!0 (size!1177 (buf!1540 (_2!2642 lt!86541))) (currentByte!3122 (_2!2642 lt!86541)) (currentBit!3117 (_2!2642 lt!86541))))))

(assert (=> d!17696 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!17696 (= (appendBitsMSBFirstLoop!0 (_2!2642 lt!86541) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!87216)))

(declare-fun b!55718 () Bool)

(declare-fun res!46410 () Bool)

(assert (=> b!55718 (=> (not res!46410) (not e!37112))))

(assert (=> b!55718 (= res!46410 (isPrefixOf!0 (_2!2642 lt!86541) (_2!2642 lt!87216)))))

(declare-fun lt!87206 () tuple2!5062)

(declare-fun bm!715 () Bool)

(declare-fun call!718 () tuple2!5064)

(assert (=> bm!715 (= call!718 (reader!0 (_2!2642 lt!86541) (ite c!3981 (_2!2642 lt!87206) (_2!2642 lt!86541))))))

(declare-fun b!55719 () Bool)

(declare-fun res!46408 () Bool)

(assert (=> b!55719 (=> (not res!46408) (not e!37112))))

(assert (=> b!55719 (= res!46408 (= (size!1177 (buf!1540 (_2!2642 lt!86541))) (size!1177 (buf!1540 (_2!2642 lt!87216)))))))

(declare-fun b!55720 () Bool)

(declare-fun res!46412 () Bool)

(assert (=> b!55720 (=> (not res!46412) (not e!37112))))

(assert (=> b!55720 (= res!46412 (= (size!1177 (buf!1540 (_2!2642 lt!87216))) (size!1177 (buf!1540 (_2!2642 lt!86541)))))))

(declare-fun b!55721 () Bool)

(declare-fun e!37114 () Bool)

(declare-fun lt!87220 () (_ BitVec 64))

(assert (=> b!55721 (= e!37114 (validate_offset_bits!1 ((_ sign_extend 32) (size!1177 (buf!1540 (_2!2642 lt!86541)))) ((_ sign_extend 32) (currentByte!3122 (_2!2642 lt!86541))) ((_ sign_extend 32) (currentBit!3117 (_2!2642 lt!86541))) lt!87220))))

(declare-fun b!55722 () Bool)

(declare-fun lt!87236 () tuple2!5062)

(declare-fun Unit!3849 () Unit!3833)

(assert (=> b!55722 (= e!37113 (tuple2!5063 Unit!3849 (_2!2642 lt!87236)))))

(assert (=> b!55722 (= lt!87206 (appendBitFromByte!0 (_2!2642 lt!86541) (select (arr!1723 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!87199 () (_ BitVec 64))

(assert (=> b!55722 (= lt!87199 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!87229 () (_ BitVec 64))

(assert (=> b!55722 (= lt!87229 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!87203 () Unit!3833)

(assert (=> b!55722 (= lt!87203 (validateOffsetBitsIneqLemma!0 (_2!2642 lt!86541) (_2!2642 lt!87206) lt!87199 lt!87229))))

(assert (=> b!55722 (validate_offset_bits!1 ((_ sign_extend 32) (size!1177 (buf!1540 (_2!2642 lt!87206)))) ((_ sign_extend 32) (currentByte!3122 (_2!2642 lt!87206))) ((_ sign_extend 32) (currentBit!3117 (_2!2642 lt!87206))) (bvsub lt!87199 lt!87229))))

(declare-fun lt!87210 () Unit!3833)

(assert (=> b!55722 (= lt!87210 lt!87203)))

(declare-fun lt!87215 () tuple2!5064)

(assert (=> b!55722 (= lt!87215 call!718)))

(declare-fun lt!87238 () (_ BitVec 64))

(assert (=> b!55722 (= lt!87238 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!87205 () Unit!3833)

(assert (=> b!55722 (= lt!87205 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2642 lt!86541) (buf!1540 (_2!2642 lt!87206)) lt!87238))))

(assert (=> b!55722 (validate_offset_bits!1 ((_ sign_extend 32) (size!1177 (buf!1540 (_2!2642 lt!87206)))) ((_ sign_extend 32) (currentByte!3122 (_2!2642 lt!86541))) ((_ sign_extend 32) (currentBit!3117 (_2!2642 lt!86541))) lt!87238)))

(declare-fun lt!87200 () Unit!3833)

(assert (=> b!55722 (= lt!87200 lt!87205)))

(assert (=> b!55722 (= (head!415 (byteArrayBitContentToList!0 (_2!2642 lt!87206) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!415 (bitStreamReadBitsIntoList!0 (_2!2642 lt!87206) (_1!2643 lt!87215) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!87237 () Unit!3833)

(declare-fun Unit!3850 () Unit!3833)

(assert (=> b!55722 (= lt!87237 Unit!3850)))

(assert (=> b!55722 (= lt!87236 (appendBitsMSBFirstLoop!0 (_2!2642 lt!87206) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!87196 () Unit!3833)

(assert (=> b!55722 (= lt!87196 (lemmaIsPrefixTransitive!0 (_2!2642 lt!86541) (_2!2642 lt!87206) (_2!2642 lt!87236)))))

(assert (=> b!55722 (isPrefixOf!0 (_2!2642 lt!86541) (_2!2642 lt!87236))))

(declare-fun lt!87232 () Unit!3833)

(assert (=> b!55722 (= lt!87232 lt!87196)))

(assert (=> b!55722 (= (size!1177 (buf!1540 (_2!2642 lt!87236))) (size!1177 (buf!1540 (_2!2642 lt!86541))))))

(declare-fun lt!87227 () Unit!3833)

(declare-fun Unit!3853 () Unit!3833)

(assert (=> b!55722 (= lt!87227 Unit!3853)))

(assert (=> b!55722 (= (bitIndex!0 (size!1177 (buf!1540 (_2!2642 lt!87236))) (currentByte!3122 (_2!2642 lt!87236)) (currentBit!3117 (_2!2642 lt!87236))) (bvsub (bvadd (bitIndex!0 (size!1177 (buf!1540 (_2!2642 lt!86541))) (currentByte!3122 (_2!2642 lt!86541)) (currentBit!3117 (_2!2642 lt!86541))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!87221 () Unit!3833)

(declare-fun Unit!3854 () Unit!3833)

(assert (=> b!55722 (= lt!87221 Unit!3854)))

(assert (=> b!55722 (= (bitIndex!0 (size!1177 (buf!1540 (_2!2642 lt!87236))) (currentByte!3122 (_2!2642 lt!87236)) (currentBit!3117 (_2!2642 lt!87236))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1177 (buf!1540 (_2!2642 lt!87206))) (currentByte!3122 (_2!2642 lt!87206)) (currentBit!3117 (_2!2642 lt!87206))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!87217 () Unit!3833)

(declare-fun Unit!3855 () Unit!3833)

(assert (=> b!55722 (= lt!87217 Unit!3855)))

(declare-fun lt!87224 () tuple2!5064)

(assert (=> b!55722 (= lt!87224 (reader!0 (_2!2642 lt!86541) (_2!2642 lt!87236)))))

(declare-fun lt!87201 () (_ BitVec 64))

(assert (=> b!55722 (= lt!87201 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!87234 () Unit!3833)

(assert (=> b!55722 (= lt!87234 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2642 lt!86541) (buf!1540 (_2!2642 lt!87236)) lt!87201))))

(assert (=> b!55722 (validate_offset_bits!1 ((_ sign_extend 32) (size!1177 (buf!1540 (_2!2642 lt!87236)))) ((_ sign_extend 32) (currentByte!3122 (_2!2642 lt!86541))) ((_ sign_extend 32) (currentBit!3117 (_2!2642 lt!86541))) lt!87201)))

(declare-fun lt!87231 () Unit!3833)

(assert (=> b!55722 (= lt!87231 lt!87234)))

(declare-fun lt!87226 () tuple2!5064)

(assert (=> b!55722 (= lt!87226 (reader!0 (_2!2642 lt!87206) (_2!2642 lt!87236)))))

(declare-fun lt!87209 () (_ BitVec 64))

(assert (=> b!55722 (= lt!87209 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!87204 () Unit!3833)

(assert (=> b!55722 (= lt!87204 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2642 lt!87206) (buf!1540 (_2!2642 lt!87236)) lt!87209))))

(assert (=> b!55722 (validate_offset_bits!1 ((_ sign_extend 32) (size!1177 (buf!1540 (_2!2642 lt!87236)))) ((_ sign_extend 32) (currentByte!3122 (_2!2642 lt!87206))) ((_ sign_extend 32) (currentBit!3117 (_2!2642 lt!87206))) lt!87209)))

(declare-fun lt!87218 () Unit!3833)

(assert (=> b!55722 (= lt!87218 lt!87204)))

(declare-fun lt!87197 () List!596)

(assert (=> b!55722 (= lt!87197 (byteArrayBitContentToList!0 (_2!2642 lt!87236) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!87212 () List!596)

(assert (=> b!55722 (= lt!87212 (byteArrayBitContentToList!0 (_2!2642 lt!87236) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!87214 () List!596)

(assert (=> b!55722 (= lt!87214 (bitStreamReadBitsIntoList!0 (_2!2642 lt!87236) (_1!2643 lt!87224) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!87228 () List!596)

(assert (=> b!55722 (= lt!87228 (bitStreamReadBitsIntoList!0 (_2!2642 lt!87236) (_1!2643 lt!87226) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!87233 () (_ BitVec 64))

(assert (=> b!55722 (= lt!87233 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!87222 () Unit!3833)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2042 BitStream!2042 BitStream!2042 BitStream!2042 (_ BitVec 64) List!596) Unit!3833)

(assert (=> b!55722 (= lt!87222 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2642 lt!87236) (_2!2642 lt!87236) (_1!2643 lt!87224) (_1!2643 lt!87226) lt!87233 lt!87214))))

(declare-fun tail!266 (List!596) List!596)

(assert (=> b!55722 (= (bitStreamReadBitsIntoList!0 (_2!2642 lt!87236) (_1!2643 lt!87226) (bvsub lt!87233 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!266 lt!87214))))

(declare-fun lt!87195 () Unit!3833)

(assert (=> b!55722 (= lt!87195 lt!87222)))

(declare-fun lt!87202 () Unit!3833)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2585 array!2585 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3833)

(assert (=> b!55722 (= lt!87202 (arrayBitRangesEqImpliesEq!0 (buf!1540 (_2!2642 lt!87206)) (buf!1540 (_2!2642 lt!87236)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!87235 (bitIndex!0 (size!1177 (buf!1540 (_2!2642 lt!87206))) (currentByte!3122 (_2!2642 lt!87206)) (currentBit!3117 (_2!2642 lt!87206)))))))

(declare-fun bitAt!0 (array!2585 (_ BitVec 64)) Bool)

(assert (=> b!55722 (= (bitAt!0 (buf!1540 (_2!2642 lt!87206)) lt!87235) (bitAt!0 (buf!1540 (_2!2642 lt!87236)) lt!87235))))

(declare-fun lt!87219 () Unit!3833)

(assert (=> b!55722 (= lt!87219 lt!87202)))

(declare-fun b!55723 () Bool)

(declare-fun res!46411 () Bool)

(assert (=> b!55723 (=> (not res!46411) (not e!37112))))

(assert (=> b!55723 (= res!46411 (invariant!0 (currentBit!3117 (_2!2642 lt!87216)) (currentByte!3122 (_2!2642 lt!87216)) (size!1177 (buf!1540 (_2!2642 lt!87216)))))))

(declare-fun b!55724 () Bool)

(declare-fun lt!87207 () tuple2!5064)

(assert (=> b!55724 (= e!37112 (= (bitStreamReadBitsIntoList!0 (_2!2642 lt!87216) (_1!2643 lt!87207) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2642 lt!87216) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!55724 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!55724 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!87225 () Unit!3833)

(declare-fun lt!87223 () Unit!3833)

(assert (=> b!55724 (= lt!87225 lt!87223)))

(assert (=> b!55724 (validate_offset_bits!1 ((_ sign_extend 32) (size!1177 (buf!1540 (_2!2642 lt!87216)))) ((_ sign_extend 32) (currentByte!3122 (_2!2642 lt!86541))) ((_ sign_extend 32) (currentBit!3117 (_2!2642 lt!86541))) lt!87220)))

(assert (=> b!55724 (= lt!87223 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2642 lt!86541) (buf!1540 (_2!2642 lt!87216)) lt!87220))))

(assert (=> b!55724 e!37114))

(declare-fun res!46409 () Bool)

(assert (=> b!55724 (=> (not res!46409) (not e!37114))))

(assert (=> b!55724 (= res!46409 (and (= (size!1177 (buf!1540 (_2!2642 lt!86541))) (size!1177 (buf!1540 (_2!2642 lt!87216)))) (bvsge lt!87220 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!55724 (= lt!87220 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!55724 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!55724 (= lt!87207 (reader!0 (_2!2642 lt!86541) (_2!2642 lt!87216)))))

(declare-fun b!55725 () Bool)

(declare-fun Unit!3856 () Unit!3833)

(assert (=> b!55725 (= e!37113 (tuple2!5063 Unit!3856 (_2!2642 lt!86541)))))

(assert (=> b!55725 (= (size!1177 (buf!1540 (_2!2642 lt!86541))) (size!1177 (buf!1540 (_2!2642 lt!86541))))))

(declare-fun lt!87198 () Unit!3833)

(declare-fun Unit!3857 () Unit!3833)

(assert (=> b!55725 (= lt!87198 Unit!3857)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2042 array!2585 array!2585 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!55725 (checkByteArrayBitContent!0 (_2!2642 lt!86541) srcBuffer!2 (_1!2649 (readBits!0 (_1!2643 call!718) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (= (and d!17696 c!3981) b!55722))

(assert (= (and d!17696 (not c!3981)) b!55725))

(assert (= (or b!55722 b!55725) bm!715))

(assert (= (and d!17696 res!46413) b!55723))

(assert (= (and b!55723 res!46411) b!55719))

(assert (= (and b!55719 res!46408) b!55718))

(assert (= (and b!55718 res!46410) b!55720))

(assert (= (and b!55720 res!46412) b!55724))

(assert (= (and b!55724 res!46409) b!55721))

(declare-fun m!87795 () Bool)

(assert (=> b!55718 m!87795))

(declare-fun m!87797 () Bool)

(assert (=> bm!715 m!87797))

(declare-fun m!87799 () Bool)

(assert (=> b!55724 m!87799))

(declare-fun m!87801 () Bool)

(assert (=> b!55724 m!87801))

(declare-fun m!87803 () Bool)

(assert (=> b!55724 m!87803))

(declare-fun m!87805 () Bool)

(assert (=> b!55724 m!87805))

(declare-fun m!87807 () Bool)

(assert (=> b!55724 m!87807))

(declare-fun m!87809 () Bool)

(assert (=> d!17696 m!87809))

(assert (=> d!17696 m!87459))

(declare-fun m!87811 () Bool)

(assert (=> d!17696 m!87811))

(declare-fun m!87813 () Bool)

(assert (=> d!17696 m!87813))

(declare-fun m!87815 () Bool)

(assert (=> b!55723 m!87815))

(declare-fun m!87817 () Bool)

(assert (=> b!55722 m!87817))

(declare-fun m!87819 () Bool)

(assert (=> b!55722 m!87819))

(declare-fun m!87821 () Bool)

(assert (=> b!55722 m!87821))

(declare-fun m!87823 () Bool)

(assert (=> b!55722 m!87823))

(declare-fun m!87825 () Bool)

(assert (=> b!55722 m!87825))

(declare-fun m!87827 () Bool)

(assert (=> b!55722 m!87827))

(declare-fun m!87829 () Bool)

(assert (=> b!55722 m!87829))

(declare-fun m!87831 () Bool)

(assert (=> b!55722 m!87831))

(declare-fun m!87833 () Bool)

(assert (=> b!55722 m!87833))

(declare-fun m!87835 () Bool)

(assert (=> b!55722 m!87835))

(declare-fun m!87837 () Bool)

(assert (=> b!55722 m!87837))

(declare-fun m!87839 () Bool)

(assert (=> b!55722 m!87839))

(assert (=> b!55722 m!87817))

(declare-fun m!87841 () Bool)

(assert (=> b!55722 m!87841))

(declare-fun m!87843 () Bool)

(assert (=> b!55722 m!87843))

(declare-fun m!87845 () Bool)

(assert (=> b!55722 m!87845))

(declare-fun m!87847 () Bool)

(assert (=> b!55722 m!87847))

(assert (=> b!55722 m!87819))

(declare-fun m!87849 () Bool)

(assert (=> b!55722 m!87849))

(declare-fun m!87851 () Bool)

(assert (=> b!55722 m!87851))

(declare-fun m!87853 () Bool)

(assert (=> b!55722 m!87853))

(declare-fun m!87855 () Bool)

(assert (=> b!55722 m!87855))

(declare-fun m!87857 () Bool)

(assert (=> b!55722 m!87857))

(declare-fun m!87859 () Bool)

(assert (=> b!55722 m!87859))

(declare-fun m!87861 () Bool)

(assert (=> b!55722 m!87861))

(declare-fun m!87865 () Bool)

(assert (=> b!55722 m!87865))

(declare-fun m!87867 () Bool)

(assert (=> b!55722 m!87867))

(declare-fun m!87869 () Bool)

(assert (=> b!55722 m!87869))

(declare-fun m!87871 () Bool)

(assert (=> b!55722 m!87871))

(assert (=> b!55722 m!87867))

(declare-fun m!87873 () Bool)

(assert (=> b!55722 m!87873))

(declare-fun m!87875 () Bool)

(assert (=> b!55722 m!87875))

(assert (=> b!55722 m!87459))

(declare-fun m!87877 () Bool)

(assert (=> b!55722 m!87877))

(assert (=> b!55722 m!87857))

(declare-fun m!87879 () Bool)

(assert (=> b!55722 m!87879))

(declare-fun m!87881 () Bool)

(assert (=> b!55721 m!87881))

(declare-fun m!87883 () Bool)

(assert (=> b!55725 m!87883))

(declare-fun m!87885 () Bool)

(assert (=> b!55725 m!87885))

(assert (=> b!55470 d!17696))

(declare-fun d!17762 () Bool)

(assert (=> d!17762 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1177 (buf!1540 (_2!2642 lt!86541)))) ((_ sign_extend 32) (currentByte!3122 thiss!1379)) ((_ sign_extend 32) (currentBit!3117 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1177 (buf!1540 (_2!2642 lt!86541)))) ((_ sign_extend 32) (currentByte!3122 thiss!1379)) ((_ sign_extend 32) (currentBit!3117 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4461 () Bool)

(assert (= bs!4461 d!17762))

(declare-fun m!87887 () Bool)

(assert (=> bs!4461 m!87887))

(assert (=> b!55470 d!17762))

(declare-fun d!17764 () Bool)

(declare-fun res!46417 () Bool)

(declare-fun e!37119 () Bool)

(assert (=> d!17764 (=> (not res!46417) (not e!37119))))

(assert (=> d!17764 (= res!46417 (= (size!1177 (buf!1540 thiss!1379)) (size!1177 (buf!1540 (_2!2642 lt!86537)))))))

(assert (=> d!17764 (= (isPrefixOf!0 thiss!1379 (_2!2642 lt!86537)) e!37119)))

(declare-fun b!55729 () Bool)

(declare-fun res!46419 () Bool)

(assert (=> b!55729 (=> (not res!46419) (not e!37119))))

(assert (=> b!55729 (= res!46419 (bvsle (bitIndex!0 (size!1177 (buf!1540 thiss!1379)) (currentByte!3122 thiss!1379) (currentBit!3117 thiss!1379)) (bitIndex!0 (size!1177 (buf!1540 (_2!2642 lt!86537))) (currentByte!3122 (_2!2642 lt!86537)) (currentBit!3117 (_2!2642 lt!86537)))))))

(declare-fun b!55730 () Bool)

(declare-fun e!37118 () Bool)

(assert (=> b!55730 (= e!37119 e!37118)))

(declare-fun res!46418 () Bool)

(assert (=> b!55730 (=> res!46418 e!37118)))

(assert (=> b!55730 (= res!46418 (= (size!1177 (buf!1540 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!55731 () Bool)

(assert (=> b!55731 (= e!37118 (arrayBitRangesEq!0 (buf!1540 thiss!1379) (buf!1540 (_2!2642 lt!86537)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1177 (buf!1540 thiss!1379)) (currentByte!3122 thiss!1379) (currentBit!3117 thiss!1379))))))

(assert (= (and d!17764 res!46417) b!55729))

(assert (= (and b!55729 res!46419) b!55730))

(assert (= (and b!55730 (not res!46418)) b!55731))

(assert (=> b!55729 m!87415))

(assert (=> b!55729 m!87405))

(assert (=> b!55731 m!87415))

(assert (=> b!55731 m!87415))

(declare-fun m!87889 () Bool)

(assert (=> b!55731 m!87889))

(assert (=> b!55470 d!17764))

(declare-fun d!17766 () Bool)

(assert (=> d!17766 (isPrefixOf!0 thiss!1379 (_2!2642 lt!86537))))

(declare-fun lt!87244 () Unit!3833)

(declare-fun choose!30 (BitStream!2042 BitStream!2042 BitStream!2042) Unit!3833)

(assert (=> d!17766 (= lt!87244 (choose!30 thiss!1379 (_2!2642 lt!86541) (_2!2642 lt!86537)))))

(assert (=> d!17766 (isPrefixOf!0 thiss!1379 (_2!2642 lt!86541))))

(assert (=> d!17766 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2642 lt!86541) (_2!2642 lt!86537)) lt!87244)))

(declare-fun bs!4462 () Bool)

(assert (= bs!4462 d!17766))

(assert (=> bs!4462 m!87425))

(declare-fun m!87891 () Bool)

(assert (=> bs!4462 m!87891))

(assert (=> bs!4462 m!87391))

(assert (=> b!55470 d!17766))

(declare-fun d!17768 () Bool)

(declare-fun res!46420 () Bool)

(declare-fun e!37121 () Bool)

(assert (=> d!17768 (=> (not res!46420) (not e!37121))))

(assert (=> d!17768 (= res!46420 (= (size!1177 (buf!1540 (_2!2642 lt!86541))) (size!1177 (buf!1540 (_2!2642 lt!86537)))))))

(assert (=> d!17768 (= (isPrefixOf!0 (_2!2642 lt!86541) (_2!2642 lt!86537)) e!37121)))

(declare-fun b!55732 () Bool)

(declare-fun res!46422 () Bool)

(assert (=> b!55732 (=> (not res!46422) (not e!37121))))

(assert (=> b!55732 (= res!46422 (bvsle (bitIndex!0 (size!1177 (buf!1540 (_2!2642 lt!86541))) (currentByte!3122 (_2!2642 lt!86541)) (currentBit!3117 (_2!2642 lt!86541))) (bitIndex!0 (size!1177 (buf!1540 (_2!2642 lt!86537))) (currentByte!3122 (_2!2642 lt!86537)) (currentBit!3117 (_2!2642 lt!86537)))))))

(declare-fun b!55733 () Bool)

(declare-fun e!37120 () Bool)

(assert (=> b!55733 (= e!37121 e!37120)))

(declare-fun res!46421 () Bool)

(assert (=> b!55733 (=> res!46421 e!37120)))

(assert (=> b!55733 (= res!46421 (= (size!1177 (buf!1540 (_2!2642 lt!86541))) #b00000000000000000000000000000000))))

(declare-fun b!55734 () Bool)

(assert (=> b!55734 (= e!37120 (arrayBitRangesEq!0 (buf!1540 (_2!2642 lt!86541)) (buf!1540 (_2!2642 lt!86537)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1177 (buf!1540 (_2!2642 lt!86541))) (currentByte!3122 (_2!2642 lt!86541)) (currentBit!3117 (_2!2642 lt!86541)))))))

(assert (= (and d!17768 res!46420) b!55732))

(assert (= (and b!55732 res!46422) b!55733))

(assert (= (and b!55733 (not res!46421)) b!55734))

(assert (=> b!55732 m!87459))

(assert (=> b!55732 m!87405))

(assert (=> b!55734 m!87459))

(assert (=> b!55734 m!87459))

(declare-fun m!87893 () Bool)

(assert (=> b!55734 m!87893))

(assert (=> b!55470 d!17768))

(declare-fun b!55745 () Bool)

(declare-fun e!37126 () Unit!3833)

(declare-fun lt!87293 () Unit!3833)

(assert (=> b!55745 (= e!37126 lt!87293)))

(declare-fun lt!87292 () (_ BitVec 64))

(assert (=> b!55745 (= lt!87292 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87287 () (_ BitVec 64))

(assert (=> b!55745 (= lt!87287 (bitIndex!0 (size!1177 (buf!1540 thiss!1379)) (currentByte!3122 thiss!1379) (currentBit!3117 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2585 array!2585 (_ BitVec 64) (_ BitVec 64)) Unit!3833)

(assert (=> b!55745 (= lt!87293 (arrayBitRangesEqSymmetric!0 (buf!1540 thiss!1379) (buf!1540 (_2!2642 lt!86541)) lt!87292 lt!87287))))

(assert (=> b!55745 (arrayBitRangesEq!0 (buf!1540 (_2!2642 lt!86541)) (buf!1540 thiss!1379) lt!87292 lt!87287)))

(declare-fun b!55746 () Bool)

(declare-fun res!46429 () Bool)

(declare-fun e!37127 () Bool)

(assert (=> b!55746 (=> (not res!46429) (not e!37127))))

(declare-fun lt!87302 () tuple2!5064)

(assert (=> b!55746 (= res!46429 (isPrefixOf!0 (_2!2643 lt!87302) (_2!2642 lt!86541)))))

(declare-fun b!55747 () Bool)

(declare-fun lt!87295 () (_ BitVec 64))

(declare-fun lt!87294 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2042 (_ BitVec 64)) BitStream!2042)

(assert (=> b!55747 (= e!37127 (= (_1!2643 lt!87302) (withMovedBitIndex!0 (_2!2643 lt!87302) (bvsub lt!87295 lt!87294))))))

(assert (=> b!55747 (or (= (bvand lt!87295 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!87294 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!87295 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!87295 lt!87294) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!55747 (= lt!87294 (bitIndex!0 (size!1177 (buf!1540 (_2!2642 lt!86541))) (currentByte!3122 (_2!2642 lt!86541)) (currentBit!3117 (_2!2642 lt!86541))))))

(assert (=> b!55747 (= lt!87295 (bitIndex!0 (size!1177 (buf!1540 thiss!1379)) (currentByte!3122 thiss!1379) (currentBit!3117 thiss!1379)))))

(declare-fun b!55748 () Bool)

(declare-fun Unit!3858 () Unit!3833)

(assert (=> b!55748 (= e!37126 Unit!3858)))

(declare-fun d!17770 () Bool)

(assert (=> d!17770 e!37127))

(declare-fun res!46430 () Bool)

(assert (=> d!17770 (=> (not res!46430) (not e!37127))))

(assert (=> d!17770 (= res!46430 (isPrefixOf!0 (_1!2643 lt!87302) (_2!2643 lt!87302)))))

(declare-fun lt!87299 () BitStream!2042)

(assert (=> d!17770 (= lt!87302 (tuple2!5065 lt!87299 (_2!2642 lt!86541)))))

(declare-fun lt!87291 () Unit!3833)

(declare-fun lt!87300 () Unit!3833)

(assert (=> d!17770 (= lt!87291 lt!87300)))

(assert (=> d!17770 (isPrefixOf!0 lt!87299 (_2!2642 lt!86541))))

(assert (=> d!17770 (= lt!87300 (lemmaIsPrefixTransitive!0 lt!87299 (_2!2642 lt!86541) (_2!2642 lt!86541)))))

(declare-fun lt!87288 () Unit!3833)

(declare-fun lt!87290 () Unit!3833)

(assert (=> d!17770 (= lt!87288 lt!87290)))

(assert (=> d!17770 (isPrefixOf!0 lt!87299 (_2!2642 lt!86541))))

(assert (=> d!17770 (= lt!87290 (lemmaIsPrefixTransitive!0 lt!87299 thiss!1379 (_2!2642 lt!86541)))))

(declare-fun lt!87285 () Unit!3833)

(assert (=> d!17770 (= lt!87285 e!37126)))

(declare-fun c!3984 () Bool)

(assert (=> d!17770 (= c!3984 (not (= (size!1177 (buf!1540 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!87303 () Unit!3833)

(declare-fun lt!87304 () Unit!3833)

(assert (=> d!17770 (= lt!87303 lt!87304)))

(assert (=> d!17770 (isPrefixOf!0 (_2!2642 lt!86541) (_2!2642 lt!86541))))

(assert (=> d!17770 (= lt!87304 (lemmaIsPrefixRefl!0 (_2!2642 lt!86541)))))

(declare-fun lt!87297 () Unit!3833)

(declare-fun lt!87289 () Unit!3833)

(assert (=> d!17770 (= lt!87297 lt!87289)))

(assert (=> d!17770 (= lt!87289 (lemmaIsPrefixRefl!0 (_2!2642 lt!86541)))))

(declare-fun lt!87296 () Unit!3833)

(declare-fun lt!87286 () Unit!3833)

(assert (=> d!17770 (= lt!87296 lt!87286)))

(assert (=> d!17770 (isPrefixOf!0 lt!87299 lt!87299)))

(assert (=> d!17770 (= lt!87286 (lemmaIsPrefixRefl!0 lt!87299))))

(declare-fun lt!87298 () Unit!3833)

(declare-fun lt!87301 () Unit!3833)

(assert (=> d!17770 (= lt!87298 lt!87301)))

(assert (=> d!17770 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!17770 (= lt!87301 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!17770 (= lt!87299 (BitStream!2043 (buf!1540 (_2!2642 lt!86541)) (currentByte!3122 thiss!1379) (currentBit!3117 thiss!1379)))))

(assert (=> d!17770 (isPrefixOf!0 thiss!1379 (_2!2642 lt!86541))))

(assert (=> d!17770 (= (reader!0 thiss!1379 (_2!2642 lt!86541)) lt!87302)))

(declare-fun b!55749 () Bool)

(declare-fun res!46431 () Bool)

(assert (=> b!55749 (=> (not res!46431) (not e!37127))))

(assert (=> b!55749 (= res!46431 (isPrefixOf!0 (_1!2643 lt!87302) thiss!1379))))

(assert (= (and d!17770 c!3984) b!55745))

(assert (= (and d!17770 (not c!3984)) b!55748))

(assert (= (and d!17770 res!46430) b!55749))

(assert (= (and b!55749 res!46431) b!55746))

(assert (= (and b!55746 res!46429) b!55747))

(assert (=> b!55745 m!87415))

(declare-fun m!87895 () Bool)

(assert (=> b!55745 m!87895))

(declare-fun m!87897 () Bool)

(assert (=> b!55745 m!87897))

(declare-fun m!87899 () Bool)

(assert (=> b!55749 m!87899))

(declare-fun m!87901 () Bool)

(assert (=> b!55747 m!87901))

(assert (=> b!55747 m!87459))

(assert (=> b!55747 m!87415))

(declare-fun m!87903 () Bool)

(assert (=> b!55746 m!87903))

(declare-fun m!87905 () Bool)

(assert (=> d!17770 m!87905))

(assert (=> d!17770 m!87391))

(declare-fun m!87907 () Bool)

(assert (=> d!17770 m!87907))

(declare-fun m!87909 () Bool)

(assert (=> d!17770 m!87909))

(declare-fun m!87911 () Bool)

(assert (=> d!17770 m!87911))

(assert (=> d!17770 m!87813))

(assert (=> d!17770 m!87811))

(assert (=> d!17770 m!87411))

(declare-fun m!87913 () Bool)

(assert (=> d!17770 m!87913))

(assert (=> d!17770 m!87413))

(declare-fun m!87915 () Bool)

(assert (=> d!17770 m!87915))

(assert (=> b!55470 d!17770))

(declare-fun d!17772 () Bool)

(assert (=> d!17772 (validate_offset_bits!1 ((_ sign_extend 32) (size!1177 (buf!1540 (_2!2642 lt!86541)))) ((_ sign_extend 32) (currentByte!3122 thiss!1379)) ((_ sign_extend 32) (currentBit!3117 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!87307 () Unit!3833)

(declare-fun choose!9 (BitStream!2042 array!2585 (_ BitVec 64) BitStream!2042) Unit!3833)

(assert (=> d!17772 (= lt!87307 (choose!9 thiss!1379 (buf!1540 (_2!2642 lt!86541)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2043 (buf!1540 (_2!2642 lt!86541)) (currentByte!3122 thiss!1379) (currentBit!3117 thiss!1379))))))

(assert (=> d!17772 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1540 (_2!2642 lt!86541)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!87307)))

(declare-fun bs!4463 () Bool)

(assert (= bs!4463 d!17772))

(assert (=> bs!4463 m!87427))

(declare-fun m!87917 () Bool)

(assert (=> bs!4463 m!87917))

(assert (=> b!55470 d!17772))

(declare-fun d!17774 () Bool)

(assert (=> d!17774 (= (head!415 (byteArrayBitContentToList!0 (_2!2642 lt!86541) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!711 (byteArrayBitContentToList!0 (_2!2642 lt!86541) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!55476 d!17774))

(declare-fun d!17776 () Bool)

(declare-fun c!3987 () Bool)

(assert (=> d!17776 (= c!3987 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!37130 () List!596)

(assert (=> d!17776 (= (byteArrayBitContentToList!0 (_2!2642 lt!86541) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!37130)))

(declare-fun b!55754 () Bool)

(assert (=> b!55754 (= e!37130 Nil!593)))

(declare-fun b!55755 () Bool)

(assert (=> b!55755 (= e!37130 (Cons!592 (not (= (bvand ((_ sign_extend 24) (select (arr!1723 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2642 lt!86541) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!17776 c!3987) b!55754))

(assert (= (and d!17776 (not c!3987)) b!55755))

(assert (=> b!55755 m!87387))

(assert (=> b!55755 m!87501))

(declare-fun m!87919 () Bool)

(assert (=> b!55755 m!87919))

(assert (=> b!55476 d!17776))

(declare-fun d!17778 () Bool)

(assert (=> d!17778 (= (head!415 (bitStreamReadBitsIntoList!0 (_2!2642 lt!86541) (_1!2643 lt!86539) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!711 (bitStreamReadBitsIntoList!0 (_2!2642 lt!86541) (_1!2643 lt!86539) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!55476 d!17778))

(declare-fun b!55765 () Bool)

(declare-datatypes ((tuple2!5086 0))(
  ( (tuple2!5087 (_1!2654 Bool) (_2!2654 BitStream!2042)) )
))
(declare-fun lt!87316 () tuple2!5086)

(declare-fun lt!87315 () (_ BitVec 64))

(declare-datatypes ((tuple2!5088 0))(
  ( (tuple2!5089 (_1!2655 List!596) (_2!2655 BitStream!2042)) )
))
(declare-fun e!37135 () tuple2!5088)

(assert (=> b!55765 (= e!37135 (tuple2!5089 (Cons!592 (_1!2654 lt!87316) (bitStreamReadBitsIntoList!0 (_2!2642 lt!86541) (_2!2654 lt!87316) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!87315))) (_2!2654 lt!87316)))))

(declare-fun readBit!0 (BitStream!2042) tuple2!5086)

(assert (=> b!55765 (= lt!87316 (readBit!0 (_1!2643 lt!86539)))))

(assert (=> b!55765 (= lt!87315 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!55766 () Bool)

(declare-fun e!37136 () Bool)

(declare-fun lt!87314 () List!596)

(declare-fun isEmpty!164 (List!596) Bool)

(assert (=> b!55766 (= e!37136 (isEmpty!164 lt!87314))))

(declare-fun b!55764 () Bool)

(assert (=> b!55764 (= e!37135 (tuple2!5089 Nil!593 (_1!2643 lt!86539)))))

(declare-fun b!55767 () Bool)

(declare-fun length!278 (List!596) Int)

(assert (=> b!55767 (= e!37136 (> (length!278 lt!87314) 0))))

(declare-fun d!17780 () Bool)

(assert (=> d!17780 e!37136))

(declare-fun c!3993 () Bool)

(assert (=> d!17780 (= c!3993 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!17780 (= lt!87314 (_1!2655 e!37135))))

(declare-fun c!3992 () Bool)

(assert (=> d!17780 (= c!3992 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!17780 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!17780 (= (bitStreamReadBitsIntoList!0 (_2!2642 lt!86541) (_1!2643 lt!86539) #b0000000000000000000000000000000000000000000000000000000000000001) lt!87314)))

(assert (= (and d!17780 c!3992) b!55764))

(assert (= (and d!17780 (not c!3992)) b!55765))

(assert (= (and d!17780 c!3993) b!55766))

(assert (= (and d!17780 (not c!3993)) b!55767))

(declare-fun m!87921 () Bool)

(assert (=> b!55765 m!87921))

(declare-fun m!87923 () Bool)

(assert (=> b!55765 m!87923))

(declare-fun m!87925 () Bool)

(assert (=> b!55766 m!87925))

(declare-fun m!87927 () Bool)

(assert (=> b!55767 m!87927))

(assert (=> b!55476 d!17780))

(declare-fun d!17782 () Bool)

(assert (=> d!17782 (= (invariant!0 (currentBit!3117 (_2!2642 lt!86537)) (currentByte!3122 (_2!2642 lt!86537)) (size!1177 (buf!1540 (_2!2642 lt!86537)))) (and (bvsge (currentBit!3117 (_2!2642 lt!86537)) #b00000000000000000000000000000000) (bvslt (currentBit!3117 (_2!2642 lt!86537)) #b00000000000000000000000000001000) (bvsge (currentByte!3122 (_2!2642 lt!86537)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3122 (_2!2642 lt!86537)) (size!1177 (buf!1540 (_2!2642 lt!86537)))) (and (= (currentBit!3117 (_2!2642 lt!86537)) #b00000000000000000000000000000000) (= (currentByte!3122 (_2!2642 lt!86537)) (size!1177 (buf!1540 (_2!2642 lt!86537))))))))))

(assert (=> b!55474 d!17782))

(push 1)

(assert (not b!55565))

(assert (not b!55746))

(assert (not b!55766))

(assert (not bm!715))

(assert (not d!17680))

(assert (not d!17678))

(assert (not d!17672))

(assert (not b!55724))

(assert (not b!55721))

(assert (not b!55561))

(assert (not b!55729))

(assert (not b!55505))

(assert (not b!55767))

(assert (not d!17670))

(assert (not d!17666))

(assert (not b!55566))

(assert (not b!55723))

(assert (not d!17694))

(assert (not d!17668))

(assert (not d!17696))

(assert (not b!55564))

(assert (not b!55755))

(assert (not b!55562))

(assert (not b!55563))

(assert (not b!55731))

(assert (not b!55725))

(assert (not d!17766))

(assert (not b!55560))

(assert (not b!55722))

(assert (not d!17770))

(assert (not d!17772))

(assert (not b!55745))

(assert (not b!55732))

(assert (not b!55516))

(assert (not b!55734))

(assert (not b!55718))

(assert (not b!55747))

(assert (not d!17762))

(assert (not b!55521))

(assert (not b!55765))

(assert (not b!55518))

(assert (not b!55749))

(assert (not b!55567))

(assert (not b!55507))

(assert (not d!17676))

(check-sat)

(pop 1)

(push 1)

(check-sat)

