; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!9272 () Bool)

(assert start!9272)

(declare-fun b!46024 () Bool)

(declare-fun e!30596 () Bool)

(declare-fun e!30601 () Bool)

(assert (=> b!46024 (= e!30596 e!30601)))

(declare-fun res!38883 () Bool)

(assert (=> b!46024 (=> res!38883 e!30601)))

(declare-datatypes ((array!2278 0))(
  ( (array!2279 (arr!1544 (Array (_ BitVec 32) (_ BitVec 8))) (size!1027 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1792 0))(
  ( (BitStream!1793 (buf!1376 array!2278) (currentByte!2875 (_ BitVec 32)) (currentBit!2870 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!3267 0))(
  ( (Unit!3268) )
))
(declare-datatypes ((tuple2!4476 0))(
  ( (tuple2!4477 (_1!2331 Unit!3267) (_2!2331 BitStream!1792)) )
))
(declare-fun lt!70953 () tuple2!4476)

(declare-fun lt!70956 () tuple2!4476)

(assert (=> b!46024 (= res!38883 (not (= (size!1027 (buf!1376 (_2!2331 lt!70953))) (size!1027 (buf!1376 (_2!2331 lt!70956))))))))

(declare-fun e!30593 () Bool)

(assert (=> b!46024 e!30593))

(declare-fun res!38882 () Bool)

(assert (=> b!46024 (=> (not res!38882) (not e!30593))))

(declare-fun thiss!1379 () BitStream!1792)

(assert (=> b!46024 (= res!38882 (= (size!1027 (buf!1376 (_2!2331 lt!70956))) (size!1027 (buf!1376 thiss!1379))))))

(declare-fun b!46025 () Bool)

(declare-fun res!38872 () Bool)

(declare-fun e!30594 () Bool)

(assert (=> b!46025 (=> res!38872 e!30594)))

(declare-datatypes ((List!537 0))(
  ( (Nil!534) (Cons!533 (h!652 Bool) (t!1287 List!537)) )
))
(declare-fun lt!70944 () List!537)

(declare-fun length!232 (List!537) Int)

(assert (=> b!46025 (= res!38872 (<= (length!232 lt!70944) 0))))

(declare-fun b!46026 () Bool)

(declare-fun res!38873 () Bool)

(assert (=> b!46026 (=> res!38873 e!30596)))

(assert (=> b!46026 (= res!38873 (not (= (size!1027 (buf!1376 thiss!1379)) (size!1027 (buf!1376 (_2!2331 lt!70956))))))))

(declare-fun b!46027 () Bool)

(declare-fun res!38878 () Bool)

(assert (=> b!46027 (=> res!38878 e!30601)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!46027 (= res!38878 (not (invariant!0 (currentBit!2870 (_2!2331 lt!70953)) (currentByte!2875 (_2!2331 lt!70953)) (size!1027 (buf!1376 (_2!2331 lt!70956))))))))

(declare-fun srcBuffer!2 () array!2278)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun e!30591 () Bool)

(declare-datatypes ((tuple2!4478 0))(
  ( (tuple2!4479 (_1!2332 BitStream!1792) (_2!2332 BitStream!1792)) )
))
(declare-fun lt!70941 () tuple2!4478)

(declare-fun b!46028 () Bool)

(declare-fun head!356 (List!537) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1792 array!2278 (_ BitVec 64) (_ BitVec 64)) List!537)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1792 BitStream!1792 (_ BitVec 64)) List!537)

(assert (=> b!46028 (= e!30591 (= (head!356 (byteArrayBitContentToList!0 (_2!2331 lt!70953) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!356 (bitStreamReadBitsIntoList!0 (_2!2331 lt!70953) (_1!2332 lt!70941) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!46029 () Bool)

(declare-fun e!30602 () Bool)

(declare-fun e!30595 () Bool)

(assert (=> b!46029 (= e!30602 (not e!30595))))

(declare-fun res!38875 () Bool)

(assert (=> b!46029 (=> res!38875 e!30595)))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!46029 (= res!38875 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1792 BitStream!1792) Bool)

(assert (=> b!46029 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!70945 () Unit!3267)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1792) Unit!3267)

(assert (=> b!46029 (= lt!70945 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!70942 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!46029 (= lt!70942 (bitIndex!0 (size!1027 (buf!1376 thiss!1379)) (currentByte!2875 thiss!1379) (currentBit!2870 thiss!1379)))))

(declare-fun b!46030 () Bool)

(declare-fun lt!70957 () List!537)

(declare-fun lt!70954 () List!537)

(assert (=> b!46030 (= e!30594 (= lt!70957 lt!70954))))

(assert (=> b!46030 (= lt!70954 lt!70957)))

(declare-fun tail!223 (List!537) List!537)

(assert (=> b!46030 (= lt!70957 (tail!223 lt!70944))))

(declare-fun lt!70947 () Unit!3267)

(declare-fun lt!70955 () tuple2!4478)

(declare-fun lt!70943 () tuple2!4478)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1792 BitStream!1792 BitStream!1792 BitStream!1792 (_ BitVec 64) List!537) Unit!3267)

(assert (=> b!46030 (= lt!70947 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2331 lt!70956) (_2!2331 lt!70956) (_1!2332 lt!70955) (_1!2332 lt!70943) (bvsub to!314 i!635) lt!70944))))

(declare-fun b!46031 () Bool)

(declare-fun res!38879 () Bool)

(assert (=> b!46031 (=> res!38879 e!30596)))

(assert (=> b!46031 (= res!38879 (not (invariant!0 (currentBit!2870 (_2!2331 lt!70956)) (currentByte!2875 (_2!2331 lt!70956)) (size!1027 (buf!1376 (_2!2331 lt!70956))))))))

(declare-fun res!38877 () Bool)

(assert (=> start!9272 (=> (not res!38877) (not e!30602))))

(assert (=> start!9272 (= res!38877 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1027 srcBuffer!2))))))))

(assert (=> start!9272 e!30602))

(assert (=> start!9272 true))

(declare-fun array_inv!949 (array!2278) Bool)

(assert (=> start!9272 (array_inv!949 srcBuffer!2)))

(declare-fun e!30600 () Bool)

(declare-fun inv!12 (BitStream!1792) Bool)

(assert (=> start!9272 (and (inv!12 thiss!1379) e!30600)))

(declare-fun b!46032 () Bool)

(declare-fun e!30599 () Bool)

(assert (=> b!46032 (= e!30595 e!30599)))

(declare-fun res!38881 () Bool)

(assert (=> b!46032 (=> res!38881 e!30599)))

(assert (=> b!46032 (= res!38881 (not (isPrefixOf!0 thiss!1379 (_2!2331 lt!70953))))))

(declare-fun lt!70951 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!46032 (validate_offset_bits!1 ((_ sign_extend 32) (size!1027 (buf!1376 (_2!2331 lt!70953)))) ((_ sign_extend 32) (currentByte!2875 (_2!2331 lt!70953))) ((_ sign_extend 32) (currentBit!2870 (_2!2331 lt!70953))) lt!70951)))

(assert (=> b!46032 (= lt!70951 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!70952 () Unit!3267)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1792 BitStream!1792 (_ BitVec 64) (_ BitVec 64)) Unit!3267)

(assert (=> b!46032 (= lt!70952 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2331 lt!70953) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1792 (_ BitVec 8) (_ BitVec 32)) tuple2!4476)

(assert (=> b!46032 (= lt!70953 (appendBitFromByte!0 thiss!1379 (select (arr!1544 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!46033 () Bool)

(declare-fun e!30592 () Bool)

(assert (=> b!46033 (= e!30592 e!30596)))

(declare-fun res!38880 () Bool)

(assert (=> b!46033 (=> res!38880 e!30596)))

(declare-fun lt!70946 () (_ BitVec 64))

(assert (=> b!46033 (= res!38880 (not (= lt!70946 (bvsub (bvadd lt!70942 to!314) i!635))))))

(assert (=> b!46033 (= lt!70946 (bitIndex!0 (size!1027 (buf!1376 (_2!2331 lt!70956))) (currentByte!2875 (_2!2331 lt!70956)) (currentBit!2870 (_2!2331 lt!70956))))))

(declare-fun b!46034 () Bool)

(assert (=> b!46034 (= e!30601 e!30594)))

(declare-fun res!38884 () Bool)

(assert (=> b!46034 (=> res!38884 e!30594)))

(assert (=> b!46034 (= res!38884 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!46034 (= lt!70954 (bitStreamReadBitsIntoList!0 (_2!2331 lt!70956) (_1!2332 lt!70943) lt!70951))))

(assert (=> b!46034 (= lt!70944 (bitStreamReadBitsIntoList!0 (_2!2331 lt!70956) (_1!2332 lt!70955) (bvsub to!314 i!635)))))

(assert (=> b!46034 (validate_offset_bits!1 ((_ sign_extend 32) (size!1027 (buf!1376 (_2!2331 lt!70956)))) ((_ sign_extend 32) (currentByte!2875 (_2!2331 lt!70953))) ((_ sign_extend 32) (currentBit!2870 (_2!2331 lt!70953))) lt!70951)))

(declare-fun lt!70950 () Unit!3267)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1792 array!2278 (_ BitVec 64)) Unit!3267)

(assert (=> b!46034 (= lt!70950 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2331 lt!70953) (buf!1376 (_2!2331 lt!70956)) lt!70951))))

(declare-fun reader!0 (BitStream!1792 BitStream!1792) tuple2!4478)

(assert (=> b!46034 (= lt!70943 (reader!0 (_2!2331 lt!70953) (_2!2331 lt!70956)))))

(assert (=> b!46034 (validate_offset_bits!1 ((_ sign_extend 32) (size!1027 (buf!1376 (_2!2331 lt!70956)))) ((_ sign_extend 32) (currentByte!2875 thiss!1379)) ((_ sign_extend 32) (currentBit!2870 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!70948 () Unit!3267)

(assert (=> b!46034 (= lt!70948 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1376 (_2!2331 lt!70956)) (bvsub to!314 i!635)))))

(assert (=> b!46034 (= lt!70955 (reader!0 thiss!1379 (_2!2331 lt!70956)))))

(declare-fun b!46035 () Bool)

(assert (=> b!46035 (= e!30593 (= lt!70946 (bvsub (bvsub (bvadd (bitIndex!0 (size!1027 (buf!1376 (_2!2331 lt!70953))) (currentByte!2875 (_2!2331 lt!70953)) (currentBit!2870 (_2!2331 lt!70953))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!46036 () Bool)

(declare-fun res!38885 () Bool)

(assert (=> b!46036 (=> res!38885 e!30601)))

(assert (=> b!46036 (= res!38885 (not (invariant!0 (currentBit!2870 (_2!2331 lt!70953)) (currentByte!2875 (_2!2331 lt!70953)) (size!1027 (buf!1376 (_2!2331 lt!70953))))))))

(declare-fun b!46037 () Bool)

(assert (=> b!46037 (= e!30600 (array_inv!949 (buf!1376 thiss!1379)))))

(declare-fun b!46038 () Bool)

(assert (=> b!46038 (= e!30599 e!30592)))

(declare-fun res!38874 () Bool)

(assert (=> b!46038 (=> res!38874 e!30592)))

(assert (=> b!46038 (= res!38874 (not (isPrefixOf!0 (_2!2331 lt!70953) (_2!2331 lt!70956))))))

(assert (=> b!46038 (isPrefixOf!0 thiss!1379 (_2!2331 lt!70956))))

(declare-fun lt!70940 () Unit!3267)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1792 BitStream!1792 BitStream!1792) Unit!3267)

(assert (=> b!46038 (= lt!70940 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2331 lt!70953) (_2!2331 lt!70956)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1792 array!2278 (_ BitVec 64) (_ BitVec 64)) tuple2!4476)

(assert (=> b!46038 (= lt!70956 (appendBitsMSBFirstLoop!0 (_2!2331 lt!70953) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!46038 e!30591))

(declare-fun res!38876 () Bool)

(assert (=> b!46038 (=> (not res!38876) (not e!30591))))

(assert (=> b!46038 (= res!38876 (validate_offset_bits!1 ((_ sign_extend 32) (size!1027 (buf!1376 (_2!2331 lt!70953)))) ((_ sign_extend 32) (currentByte!2875 thiss!1379)) ((_ sign_extend 32) (currentBit!2870 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!70949 () Unit!3267)

(assert (=> b!46038 (= lt!70949 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1376 (_2!2331 lt!70953)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!46038 (= lt!70941 (reader!0 thiss!1379 (_2!2331 lt!70953)))))

(declare-fun b!46039 () Bool)

(declare-fun res!38886 () Bool)

(assert (=> b!46039 (=> (not res!38886) (not e!30602))))

(assert (=> b!46039 (= res!38886 (validate_offset_bits!1 ((_ sign_extend 32) (size!1027 (buf!1376 thiss!1379))) ((_ sign_extend 32) (currentByte!2875 thiss!1379)) ((_ sign_extend 32) (currentBit!2870 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!9272 res!38877) b!46039))

(assert (= (and b!46039 res!38886) b!46029))

(assert (= (and b!46029 (not res!38875)) b!46032))

(assert (= (and b!46032 (not res!38881)) b!46038))

(assert (= (and b!46038 res!38876) b!46028))

(assert (= (and b!46038 (not res!38874)) b!46033))

(assert (= (and b!46033 (not res!38880)) b!46031))

(assert (= (and b!46031 (not res!38879)) b!46026))

(assert (= (and b!46026 (not res!38873)) b!46024))

(assert (= (and b!46024 res!38882) b!46035))

(assert (= (and b!46024 (not res!38883)) b!46036))

(assert (= (and b!46036 (not res!38885)) b!46027))

(assert (= (and b!46027 (not res!38878)) b!46034))

(assert (= (and b!46034 (not res!38884)) b!46025))

(assert (= (and b!46025 (not res!38872)) b!46030))

(assert (= start!9272 b!46037))

(declare-fun m!70393 () Bool)

(assert (=> b!46030 m!70393))

(declare-fun m!70395 () Bool)

(assert (=> b!46030 m!70395))

(declare-fun m!70397 () Bool)

(assert (=> b!46033 m!70397))

(declare-fun m!70399 () Bool)

(assert (=> b!46025 m!70399))

(declare-fun m!70401 () Bool)

(assert (=> b!46027 m!70401))

(declare-fun m!70403 () Bool)

(assert (=> b!46037 m!70403))

(declare-fun m!70405 () Bool)

(assert (=> start!9272 m!70405))

(declare-fun m!70407 () Bool)

(assert (=> start!9272 m!70407))

(declare-fun m!70409 () Bool)

(assert (=> b!46032 m!70409))

(declare-fun m!70411 () Bool)

(assert (=> b!46032 m!70411))

(declare-fun m!70413 () Bool)

(assert (=> b!46032 m!70413))

(declare-fun m!70415 () Bool)

(assert (=> b!46032 m!70415))

(assert (=> b!46032 m!70409))

(declare-fun m!70417 () Bool)

(assert (=> b!46032 m!70417))

(declare-fun m!70419 () Bool)

(assert (=> b!46031 m!70419))

(declare-fun m!70421 () Bool)

(assert (=> b!46029 m!70421))

(declare-fun m!70423 () Bool)

(assert (=> b!46029 m!70423))

(declare-fun m!70425 () Bool)

(assert (=> b!46029 m!70425))

(declare-fun m!70427 () Bool)

(assert (=> b!46039 m!70427))

(declare-fun m!70429 () Bool)

(assert (=> b!46034 m!70429))

(declare-fun m!70431 () Bool)

(assert (=> b!46034 m!70431))

(declare-fun m!70433 () Bool)

(assert (=> b!46034 m!70433))

(declare-fun m!70435 () Bool)

(assert (=> b!46034 m!70435))

(declare-fun m!70437 () Bool)

(assert (=> b!46034 m!70437))

(declare-fun m!70439 () Bool)

(assert (=> b!46034 m!70439))

(declare-fun m!70441 () Bool)

(assert (=> b!46034 m!70441))

(declare-fun m!70443 () Bool)

(assert (=> b!46034 m!70443))

(declare-fun m!70445 () Bool)

(assert (=> b!46038 m!70445))

(declare-fun m!70447 () Bool)

(assert (=> b!46038 m!70447))

(declare-fun m!70449 () Bool)

(assert (=> b!46038 m!70449))

(declare-fun m!70451 () Bool)

(assert (=> b!46038 m!70451))

(declare-fun m!70453 () Bool)

(assert (=> b!46038 m!70453))

(declare-fun m!70455 () Bool)

(assert (=> b!46038 m!70455))

(declare-fun m!70457 () Bool)

(assert (=> b!46038 m!70457))

(declare-fun m!70459 () Bool)

(assert (=> b!46036 m!70459))

(declare-fun m!70461 () Bool)

(assert (=> b!46028 m!70461))

(assert (=> b!46028 m!70461))

(declare-fun m!70463 () Bool)

(assert (=> b!46028 m!70463))

(declare-fun m!70465 () Bool)

(assert (=> b!46028 m!70465))

(assert (=> b!46028 m!70465))

(declare-fun m!70467 () Bool)

(assert (=> b!46028 m!70467))

(declare-fun m!70469 () Bool)

(assert (=> b!46035 m!70469))

(push 1)

