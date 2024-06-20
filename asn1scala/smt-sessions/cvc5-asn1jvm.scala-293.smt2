; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5834 () Bool)

(assert start!5834)

(declare-fun b!25503 () Bool)

(declare-fun res!22005 () Bool)

(declare-fun e!17383 () Bool)

(assert (=> b!25503 (=> res!22005 e!17383)))

(declare-datatypes ((array!1664 0))(
  ( (array!1665 (arr!1175 (Array (_ BitVec 32) (_ BitVec 8))) (size!716 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1264 0))(
  ( (BitStream!1265 (buf!1040 array!1664) (currentByte!2359 (_ BitVec 32)) (currentBit!2354 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2105 0))(
  ( (Unit!2106) )
))
(declare-datatypes ((tuple2!2870 0))(
  ( (tuple2!2871 (_1!1522 Unit!2105) (_2!1522 BitStream!1264)) )
))
(declare-fun lt!36586 () tuple2!2870)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!25503 (= res!22005 (not (invariant!0 (currentBit!2354 (_2!1522 lt!36586)) (currentByte!2359 (_2!1522 lt!36586)) (size!716 (buf!1040 (_2!1522 lt!36586))))))))

(declare-fun srcBuffer!2 () array!1664)

(declare-fun e!17386 () Bool)

(declare-fun lt!36575 () tuple2!2870)

(declare-fun i!635 () (_ BitVec 64))

(declare-datatypes ((tuple2!2872 0))(
  ( (tuple2!2873 (_1!1523 BitStream!1264) (_2!1523 BitStream!1264)) )
))
(declare-fun lt!36580 () tuple2!2872)

(declare-fun b!25504 () Bool)

(declare-datatypes ((List!333 0))(
  ( (Nil!330) (Cons!329 (h!448 Bool) (t!1083 List!333)) )
))
(declare-fun head!170 (List!333) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1264 array!1664 (_ BitVec 64) (_ BitVec 64)) List!333)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1264 BitStream!1264 (_ BitVec 64)) List!333)

(assert (=> b!25504 (= e!17386 (= (head!170 (byteArrayBitContentToList!0 (_2!1522 lt!36575) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!170 (bitStreamReadBitsIntoList!0 (_2!1522 lt!36575) (_1!1523 lt!36580) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!25505 () Bool)

(declare-fun e!17388 () Bool)

(assert (=> b!25505 (= e!17388 e!17383)))

(declare-fun res!22009 () Bool)

(assert (=> b!25505 (=> res!22009 e!17383)))

(declare-fun lt!36587 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!36579 () (_ BitVec 64))

(assert (=> b!25505 (= res!22009 (not (= lt!36587 (bvsub (bvadd lt!36579 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!25505 (= lt!36587 (bitIndex!0 (size!716 (buf!1040 (_2!1522 lt!36586))) (currentByte!2359 (_2!1522 lt!36586)) (currentBit!2354 (_2!1522 lt!36586))))))

(declare-fun b!25506 () Bool)

(declare-fun res!22001 () Bool)

(declare-fun e!17379 () Bool)

(assert (=> b!25506 (=> res!22001 e!17379)))

(assert (=> b!25506 (= res!22001 (not (invariant!0 (currentBit!2354 (_2!1522 lt!36575)) (currentByte!2359 (_2!1522 lt!36575)) (size!716 (buf!1040 (_2!1522 lt!36586))))))))

(declare-fun b!25507 () Bool)

(declare-fun e!17384 () Bool)

(declare-fun e!17385 () Bool)

(assert (=> b!25507 (= e!17384 e!17385)))

(declare-fun res!22004 () Bool)

(assert (=> b!25507 (=> res!22004 e!17385)))

(declare-fun thiss!1379 () BitStream!1264)

(declare-fun isPrefixOf!0 (BitStream!1264 BitStream!1264) Bool)

(assert (=> b!25507 (= res!22004 (not (isPrefixOf!0 thiss!1379 (_2!1522 lt!36575))))))

(declare-fun lt!36584 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!25507 (validate_offset_bits!1 ((_ sign_extend 32) (size!716 (buf!1040 (_2!1522 lt!36575)))) ((_ sign_extend 32) (currentByte!2359 (_2!1522 lt!36575))) ((_ sign_extend 32) (currentBit!2354 (_2!1522 lt!36575))) lt!36584)))

(assert (=> b!25507 (= lt!36584 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!36581 () Unit!2105)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1264 BitStream!1264 (_ BitVec 64) (_ BitVec 64)) Unit!2105)

(assert (=> b!25507 (= lt!36581 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1522 lt!36575) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1264 (_ BitVec 8) (_ BitVec 32)) tuple2!2870)

(assert (=> b!25507 (= lt!36575 (appendBitFromByte!0 thiss!1379 (select (arr!1175 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!25508 () Bool)

(declare-fun res!21999 () Bool)

(assert (=> b!25508 (=> res!21999 e!17379)))

(assert (=> b!25508 (= res!21999 (not (invariant!0 (currentBit!2354 (_2!1522 lt!36575)) (currentByte!2359 (_2!1522 lt!36575)) (size!716 (buf!1040 (_2!1522 lt!36575))))))))

(declare-fun b!25509 () Bool)

(assert (=> b!25509 (= e!17383 e!17379)))

(declare-fun res!22011 () Bool)

(assert (=> b!25509 (=> res!22011 e!17379)))

(assert (=> b!25509 (= res!22011 (not (= (size!716 (buf!1040 (_2!1522 lt!36575))) (size!716 (buf!1040 (_2!1522 lt!36586))))))))

(declare-fun e!17381 () Bool)

(assert (=> b!25509 e!17381))

(declare-fun res!22003 () Bool)

(assert (=> b!25509 (=> (not res!22003) (not e!17381))))

(assert (=> b!25509 (= res!22003 (= (size!716 (buf!1040 (_2!1522 lt!36586))) (size!716 (buf!1040 thiss!1379))))))

(declare-fun b!25510 () Bool)

(assert (=> b!25510 (= e!17385 e!17388)))

(declare-fun res!22002 () Bool)

(assert (=> b!25510 (=> res!22002 e!17388)))

(assert (=> b!25510 (= res!22002 (not (isPrefixOf!0 (_2!1522 lt!36575) (_2!1522 lt!36586))))))

(assert (=> b!25510 (isPrefixOf!0 thiss!1379 (_2!1522 lt!36586))))

(declare-fun lt!36578 () Unit!2105)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1264 BitStream!1264 BitStream!1264) Unit!2105)

(assert (=> b!25510 (= lt!36578 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1522 lt!36575) (_2!1522 lt!36586)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1264 array!1664 (_ BitVec 64) (_ BitVec 64)) tuple2!2870)

(assert (=> b!25510 (= lt!36586 (appendBitsMSBFirstLoop!0 (_2!1522 lt!36575) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!25510 e!17386))

(declare-fun res!22000 () Bool)

(assert (=> b!25510 (=> (not res!22000) (not e!17386))))

(assert (=> b!25510 (= res!22000 (validate_offset_bits!1 ((_ sign_extend 32) (size!716 (buf!1040 (_2!1522 lt!36575)))) ((_ sign_extend 32) (currentByte!2359 thiss!1379)) ((_ sign_extend 32) (currentBit!2354 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!36577 () Unit!2105)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1264 array!1664 (_ BitVec 64)) Unit!2105)

(assert (=> b!25510 (= lt!36577 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1040 (_2!1522 lt!36575)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1264 BitStream!1264) tuple2!2872)

(assert (=> b!25510 (= lt!36580 (reader!0 thiss!1379 (_2!1522 lt!36575)))))

(declare-fun b!25511 () Bool)

(declare-fun e!17387 () Bool)

(assert (=> b!25511 (= e!17387 (not e!17384))))

(declare-fun res!22007 () Bool)

(assert (=> b!25511 (=> res!22007 e!17384)))

(assert (=> b!25511 (= res!22007 (bvsge i!635 to!314))))

(assert (=> b!25511 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!36585 () Unit!2105)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1264) Unit!2105)

(assert (=> b!25511 (= lt!36585 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!25511 (= lt!36579 (bitIndex!0 (size!716 (buf!1040 thiss!1379)) (currentByte!2359 thiss!1379) (currentBit!2354 thiss!1379)))))

(declare-fun b!25512 () Bool)

(declare-fun res!22008 () Bool)

(assert (=> b!25512 (=> (not res!22008) (not e!17387))))

(assert (=> b!25512 (= res!22008 (validate_offset_bits!1 ((_ sign_extend 32) (size!716 (buf!1040 thiss!1379))) ((_ sign_extend 32) (currentByte!2359 thiss!1379)) ((_ sign_extend 32) (currentBit!2354 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!25513 () Bool)

(assert (=> b!25513 (= e!17381 (= lt!36587 (bvsub (bvsub (bvadd (bitIndex!0 (size!716 (buf!1040 (_2!1522 lt!36575))) (currentByte!2359 (_2!1522 lt!36575)) (currentBit!2354 (_2!1522 lt!36575))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!25514 () Bool)

(assert (=> b!25514 (= e!17379 true)))

(declare-fun lt!36588 () List!333)

(declare-fun lt!36583 () tuple2!2872)

(assert (=> b!25514 (= lt!36588 (bitStreamReadBitsIntoList!0 (_2!1522 lt!36586) (_1!1523 lt!36583) (bvsub to!314 i!635)))))

(assert (=> b!25514 (validate_offset_bits!1 ((_ sign_extend 32) (size!716 (buf!1040 (_2!1522 lt!36586)))) ((_ sign_extend 32) (currentByte!2359 (_2!1522 lt!36575))) ((_ sign_extend 32) (currentBit!2354 (_2!1522 lt!36575))) lt!36584)))

(declare-fun lt!36589 () Unit!2105)

(assert (=> b!25514 (= lt!36589 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1522 lt!36575) (buf!1040 (_2!1522 lt!36586)) lt!36584))))

(declare-fun lt!36582 () tuple2!2872)

(assert (=> b!25514 (= lt!36582 (reader!0 (_2!1522 lt!36575) (_2!1522 lt!36586)))))

(assert (=> b!25514 (validate_offset_bits!1 ((_ sign_extend 32) (size!716 (buf!1040 (_2!1522 lt!36586)))) ((_ sign_extend 32) (currentByte!2359 thiss!1379)) ((_ sign_extend 32) (currentBit!2354 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!36576 () Unit!2105)

(assert (=> b!25514 (= lt!36576 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1040 (_2!1522 lt!36586)) (bvsub to!314 i!635)))))

(assert (=> b!25514 (= lt!36583 (reader!0 thiss!1379 (_2!1522 lt!36586)))))

(declare-fun res!22010 () Bool)

(assert (=> start!5834 (=> (not res!22010) (not e!17387))))

(assert (=> start!5834 (= res!22010 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!716 srcBuffer!2))))))))

(assert (=> start!5834 e!17387))

(assert (=> start!5834 true))

(declare-fun array_inv!685 (array!1664) Bool)

(assert (=> start!5834 (array_inv!685 srcBuffer!2)))

(declare-fun e!17389 () Bool)

(declare-fun inv!12 (BitStream!1264) Bool)

(assert (=> start!5834 (and (inv!12 thiss!1379) e!17389)))

(declare-fun b!25515 () Bool)

(declare-fun res!22006 () Bool)

(assert (=> b!25515 (=> res!22006 e!17383)))

(assert (=> b!25515 (= res!22006 (not (= (size!716 (buf!1040 thiss!1379)) (size!716 (buf!1040 (_2!1522 lt!36586))))))))

(declare-fun b!25516 () Bool)

(assert (=> b!25516 (= e!17389 (array_inv!685 (buf!1040 thiss!1379)))))

(assert (= (and start!5834 res!22010) b!25512))

(assert (= (and b!25512 res!22008) b!25511))

(assert (= (and b!25511 (not res!22007)) b!25507))

(assert (= (and b!25507 (not res!22004)) b!25510))

(assert (= (and b!25510 res!22000) b!25504))

(assert (= (and b!25510 (not res!22002)) b!25505))

(assert (= (and b!25505 (not res!22009)) b!25503))

(assert (= (and b!25503 (not res!22005)) b!25515))

(assert (= (and b!25515 (not res!22006)) b!25509))

(assert (= (and b!25509 res!22003) b!25513))

(assert (= (and b!25509 (not res!22011)) b!25508))

(assert (= (and b!25508 (not res!21999)) b!25506))

(assert (= (and b!25506 (not res!22001)) b!25514))

(assert (= start!5834 b!25516))

(declare-fun m!36351 () Bool)

(assert (=> b!25504 m!36351))

(assert (=> b!25504 m!36351))

(declare-fun m!36353 () Bool)

(assert (=> b!25504 m!36353))

(declare-fun m!36355 () Bool)

(assert (=> b!25504 m!36355))

(assert (=> b!25504 m!36355))

(declare-fun m!36357 () Bool)

(assert (=> b!25504 m!36357))

(declare-fun m!36359 () Bool)

(assert (=> b!25505 m!36359))

(declare-fun m!36361 () Bool)

(assert (=> b!25506 m!36361))

(declare-fun m!36363 () Bool)

(assert (=> b!25514 m!36363))

(declare-fun m!36365 () Bool)

(assert (=> b!25514 m!36365))

(declare-fun m!36367 () Bool)

(assert (=> b!25514 m!36367))

(declare-fun m!36369 () Bool)

(assert (=> b!25514 m!36369))

(declare-fun m!36371 () Bool)

(assert (=> b!25514 m!36371))

(declare-fun m!36373 () Bool)

(assert (=> b!25514 m!36373))

(declare-fun m!36375 () Bool)

(assert (=> b!25514 m!36375))

(declare-fun m!36377 () Bool)

(assert (=> b!25503 m!36377))

(declare-fun m!36379 () Bool)

(assert (=> b!25510 m!36379))

(declare-fun m!36381 () Bool)

(assert (=> b!25510 m!36381))

(declare-fun m!36383 () Bool)

(assert (=> b!25510 m!36383))

(declare-fun m!36385 () Bool)

(assert (=> b!25510 m!36385))

(declare-fun m!36387 () Bool)

(assert (=> b!25510 m!36387))

(declare-fun m!36389 () Bool)

(assert (=> b!25510 m!36389))

(declare-fun m!36391 () Bool)

(assert (=> b!25510 m!36391))

(declare-fun m!36393 () Bool)

(assert (=> b!25507 m!36393))

(declare-fun m!36395 () Bool)

(assert (=> b!25507 m!36395))

(assert (=> b!25507 m!36395))

(declare-fun m!36397 () Bool)

(assert (=> b!25507 m!36397))

(declare-fun m!36399 () Bool)

(assert (=> b!25507 m!36399))

(declare-fun m!36401 () Bool)

(assert (=> b!25507 m!36401))

(declare-fun m!36403 () Bool)

(assert (=> start!5834 m!36403))

(declare-fun m!36405 () Bool)

(assert (=> start!5834 m!36405))

(declare-fun m!36407 () Bool)

(assert (=> b!25513 m!36407))

(declare-fun m!36409 () Bool)

(assert (=> b!25508 m!36409))

(declare-fun m!36411 () Bool)

(assert (=> b!25516 m!36411))

(declare-fun m!36413 () Bool)

(assert (=> b!25511 m!36413))

(declare-fun m!36415 () Bool)

(assert (=> b!25511 m!36415))

(declare-fun m!36417 () Bool)

(assert (=> b!25511 m!36417))

(declare-fun m!36419 () Bool)

(assert (=> b!25512 m!36419))

(push 1)

(assert (not b!25508))

(assert (not b!25513))

(assert (not b!25512))

(assert (not b!25506))

(assert (not b!25511))

(assert (not start!5834))

(assert (not b!25514))

(assert (not b!25516))

(assert (not b!25505))

(assert (not b!25507))

(assert (not b!25510))

(assert (not b!25503))

(assert (not b!25504))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

