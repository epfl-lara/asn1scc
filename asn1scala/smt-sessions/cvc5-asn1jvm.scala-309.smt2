; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6254 () Bool)

(assert start!6254)

(declare-fun b!29392 () Bool)

(declare-fun e!19679 () Bool)

(declare-fun e!19680 () Bool)

(assert (=> b!29392 (= e!19679 e!19680)))

(declare-fun res!25372 () Bool)

(assert (=> b!29392 (=> res!25372 e!19680)))

(declare-datatypes ((array!1769 0))(
  ( (array!1770 (arr!1232 (Array (_ BitVec 32) (_ BitVec 8))) (size!769 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1360 0))(
  ( (BitStream!1361 (buf!1097 array!1769) (currentByte!2434 (_ BitVec 32)) (currentBit!2429 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2283 0))(
  ( (Unit!2284) )
))
(declare-datatypes ((tuple2!3134 0))(
  ( (tuple2!3135 (_1!1654 Unit!2283) (_2!1654 BitStream!1360)) )
))
(declare-fun lt!42082 () tuple2!3134)

(declare-fun lt!42094 () tuple2!3134)

(assert (=> b!29392 (= res!25372 (not (= (size!769 (buf!1097 (_2!1654 lt!42082))) (size!769 (buf!1097 (_2!1654 lt!42094))))))))

(declare-fun e!19681 () Bool)

(assert (=> b!29392 e!19681))

(declare-fun res!25370 () Bool)

(assert (=> b!29392 (=> (not res!25370) (not e!19681))))

(declare-fun thiss!1379 () BitStream!1360)

(assert (=> b!29392 (= res!25370 (= (size!769 (buf!1097 (_2!1654 lt!42094))) (size!769 (buf!1097 thiss!1379))))))

(declare-fun b!29393 () Bool)

(declare-fun res!25383 () Bool)

(assert (=> b!29393 (=> res!25383 e!19679)))

(assert (=> b!29393 (= res!25383 (not (= (size!769 (buf!1097 thiss!1379)) (size!769 (buf!1097 (_2!1654 lt!42094))))))))

(declare-fun srcBuffer!2 () array!1769)

(declare-fun i!635 () (_ BitVec 64))

(declare-datatypes ((tuple2!3136 0))(
  ( (tuple2!3137 (_1!1655 BitStream!1360) (_2!1655 BitStream!1360)) )
))
(declare-fun lt!42083 () tuple2!3136)

(declare-fun b!29395 () Bool)

(declare-fun e!19689 () Bool)

(declare-datatypes ((List!381 0))(
  ( (Nil!378) (Cons!377 (h!496 Bool) (t!1131 List!381)) )
))
(declare-fun head!218 (List!381) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1360 array!1769 (_ BitVec 64) (_ BitVec 64)) List!381)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1360 BitStream!1360 (_ BitVec 64)) List!381)

(assert (=> b!29395 (= e!19689 (= (head!218 (byteArrayBitContentToList!0 (_2!1654 lt!42082) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!218 (bitStreamReadBitsIntoList!0 (_2!1654 lt!42082) (_1!1655 lt!42083) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!29396 () Bool)

(declare-fun e!19686 () Bool)

(declare-fun e!19682 () Bool)

(assert (=> b!29396 (= e!19686 e!19682)))

(declare-fun res!25369 () Bool)

(assert (=> b!29396 (=> res!25369 e!19682)))

(declare-fun isPrefixOf!0 (BitStream!1360 BitStream!1360) Bool)

(assert (=> b!29396 (= res!25369 (not (isPrefixOf!0 thiss!1379 (_2!1654 lt!42082))))))

(declare-fun lt!42081 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!29396 (validate_offset_bits!1 ((_ sign_extend 32) (size!769 (buf!1097 (_2!1654 lt!42082)))) ((_ sign_extend 32) (currentByte!2434 (_2!1654 lt!42082))) ((_ sign_extend 32) (currentBit!2429 (_2!1654 lt!42082))) lt!42081)))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!29396 (= lt!42081 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!42089 () Unit!2283)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1360 BitStream!1360 (_ BitVec 64) (_ BitVec 64)) Unit!2283)

(assert (=> b!29396 (= lt!42089 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1654 lt!42082) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1360 (_ BitVec 8) (_ BitVec 32)) tuple2!3134)

(assert (=> b!29396 (= lt!42082 (appendBitFromByte!0 thiss!1379 (select (arr!1232 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!29397 () Bool)

(declare-fun e!19687 () Bool)

(declare-fun array_inv!733 (array!1769) Bool)

(assert (=> b!29397 (= e!19687 (array_inv!733 (buf!1097 thiss!1379)))))

(declare-fun b!29398 () Bool)

(declare-fun res!25377 () Bool)

(declare-fun e!19685 () Bool)

(assert (=> b!29398 (=> res!25377 e!19685)))

(declare-fun lt!42091 () List!381)

(declare-fun length!107 (List!381) Int)

(assert (=> b!29398 (= res!25377 (<= (length!107 lt!42091) 0))))

(declare-fun b!29399 () Bool)

(declare-fun res!25379 () Bool)

(assert (=> b!29399 (=> res!25379 e!19679)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!29399 (= res!25379 (not (invariant!0 (currentBit!2429 (_2!1654 lt!42094)) (currentByte!2434 (_2!1654 lt!42094)) (size!769 (buf!1097 (_2!1654 lt!42094))))))))

(declare-fun lt!42085 () (_ BitVec 64))

(declare-fun b!29400 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!29400 (= e!19681 (= lt!42085 (bvsub (bvsub (bvadd (bitIndex!0 (size!769 (buf!1097 (_2!1654 lt!42082))) (currentByte!2434 (_2!1654 lt!42082)) (currentBit!2429 (_2!1654 lt!42082))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!29401 () Bool)

(declare-fun res!25373 () Bool)

(assert (=> b!29401 (=> res!25373 e!19680)))

(assert (=> b!29401 (= res!25373 (not (invariant!0 (currentBit!2429 (_2!1654 lt!42082)) (currentByte!2434 (_2!1654 lt!42082)) (size!769 (buf!1097 (_2!1654 lt!42094))))))))

(declare-fun b!29402 () Bool)

(declare-fun res!25380 () Bool)

(declare-fun e!19684 () Bool)

(assert (=> b!29402 (=> (not res!25380) (not e!19684))))

(assert (=> b!29402 (= res!25380 (validate_offset_bits!1 ((_ sign_extend 32) (size!769 (buf!1097 thiss!1379))) ((_ sign_extend 32) (currentByte!2434 thiss!1379)) ((_ sign_extend 32) (currentBit!2429 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!29394 () Bool)

(assert (=> b!29394 (= e!19680 e!19685)))

(declare-fun res!25374 () Bool)

(assert (=> b!29394 (=> res!25374 e!19685)))

(assert (=> b!29394 (= res!25374 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!42096 () tuple2!3136)

(declare-fun lt!42090 () List!381)

(assert (=> b!29394 (= lt!42090 (bitStreamReadBitsIntoList!0 (_2!1654 lt!42094) (_1!1655 lt!42096) lt!42081))))

(declare-fun lt!42084 () tuple2!3136)

(assert (=> b!29394 (= lt!42091 (bitStreamReadBitsIntoList!0 (_2!1654 lt!42094) (_1!1655 lt!42084) (bvsub to!314 i!635)))))

(assert (=> b!29394 (validate_offset_bits!1 ((_ sign_extend 32) (size!769 (buf!1097 (_2!1654 lt!42094)))) ((_ sign_extend 32) (currentByte!2434 (_2!1654 lt!42082))) ((_ sign_extend 32) (currentBit!2429 (_2!1654 lt!42082))) lt!42081)))

(declare-fun lt!42097 () Unit!2283)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1360 array!1769 (_ BitVec 64)) Unit!2283)

(assert (=> b!29394 (= lt!42097 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1654 lt!42082) (buf!1097 (_2!1654 lt!42094)) lt!42081))))

(declare-fun reader!0 (BitStream!1360 BitStream!1360) tuple2!3136)

(assert (=> b!29394 (= lt!42096 (reader!0 (_2!1654 lt!42082) (_2!1654 lt!42094)))))

(assert (=> b!29394 (validate_offset_bits!1 ((_ sign_extend 32) (size!769 (buf!1097 (_2!1654 lt!42094)))) ((_ sign_extend 32) (currentByte!2434 thiss!1379)) ((_ sign_extend 32) (currentBit!2429 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!42095 () Unit!2283)

(assert (=> b!29394 (= lt!42095 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1097 (_2!1654 lt!42094)) (bvsub to!314 i!635)))))

(assert (=> b!29394 (= lt!42084 (reader!0 thiss!1379 (_2!1654 lt!42094)))))

(declare-fun res!25381 () Bool)

(assert (=> start!6254 (=> (not res!25381) (not e!19684))))

(assert (=> start!6254 (= res!25381 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!769 srcBuffer!2))))))))

(assert (=> start!6254 e!19684))

(assert (=> start!6254 true))

(assert (=> start!6254 (array_inv!733 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1360) Bool)

(assert (=> start!6254 (and (inv!12 thiss!1379) e!19687)))

(declare-fun b!29403 () Bool)

(declare-fun e!19688 () Bool)

(assert (=> b!29403 (= e!19688 e!19679)))

(declare-fun res!25382 () Bool)

(assert (=> b!29403 (=> res!25382 e!19679)))

(declare-fun lt!42093 () (_ BitVec 64))

(assert (=> b!29403 (= res!25382 (not (= lt!42085 (bvsub (bvadd lt!42093 to!314) i!635))))))

(assert (=> b!29403 (= lt!42085 (bitIndex!0 (size!769 (buf!1097 (_2!1654 lt!42094))) (currentByte!2434 (_2!1654 lt!42094)) (currentBit!2429 (_2!1654 lt!42094))))))

(declare-fun b!29404 () Bool)

(assert (=> b!29404 (= e!19682 e!19688)))

(declare-fun res!25376 () Bool)

(assert (=> b!29404 (=> res!25376 e!19688)))

(assert (=> b!29404 (= res!25376 (not (isPrefixOf!0 (_2!1654 lt!42082) (_2!1654 lt!42094))))))

(assert (=> b!29404 (isPrefixOf!0 thiss!1379 (_2!1654 lt!42094))))

(declare-fun lt!42092 () Unit!2283)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1360 BitStream!1360 BitStream!1360) Unit!2283)

(assert (=> b!29404 (= lt!42092 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1654 lt!42082) (_2!1654 lt!42094)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1360 array!1769 (_ BitVec 64) (_ BitVec 64)) tuple2!3134)

(assert (=> b!29404 (= lt!42094 (appendBitsMSBFirstLoop!0 (_2!1654 lt!42082) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!29404 e!19689))

(declare-fun res!25375 () Bool)

(assert (=> b!29404 (=> (not res!25375) (not e!19689))))

(assert (=> b!29404 (= res!25375 (validate_offset_bits!1 ((_ sign_extend 32) (size!769 (buf!1097 (_2!1654 lt!42082)))) ((_ sign_extend 32) (currentByte!2434 thiss!1379)) ((_ sign_extend 32) (currentBit!2429 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!42080 () Unit!2283)

(assert (=> b!29404 (= lt!42080 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1097 (_2!1654 lt!42082)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!29404 (= lt!42083 (reader!0 thiss!1379 (_2!1654 lt!42082)))))

(declare-fun b!29405 () Bool)

(assert (=> b!29405 (= e!19684 (not e!19686))))

(declare-fun res!25378 () Bool)

(assert (=> b!29405 (=> res!25378 e!19686)))

(assert (=> b!29405 (= res!25378 (bvsge i!635 to!314))))

(assert (=> b!29405 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!42088 () Unit!2283)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1360) Unit!2283)

(assert (=> b!29405 (= lt!42088 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!29405 (= lt!42093 (bitIndex!0 (size!769 (buf!1097 thiss!1379)) (currentByte!2434 thiss!1379) (currentBit!2429 thiss!1379)))))

(declare-fun b!29406 () Bool)

(declare-fun res!25371 () Bool)

(assert (=> b!29406 (=> res!25371 e!19680)))

(assert (=> b!29406 (= res!25371 (not (invariant!0 (currentBit!2429 (_2!1654 lt!42082)) (currentByte!2434 (_2!1654 lt!42082)) (size!769 (buf!1097 (_2!1654 lt!42082))))))))

(declare-fun b!29407 () Bool)

(declare-fun lt!42086 () List!381)

(assert (=> b!29407 (= e!19685 (or (not (= lt!42086 lt!42090)) (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!42093) (bvslt lt!42093 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!769 (buf!1097 (_1!1655 lt!42096)))))))))))

(assert (=> b!29407 (= lt!42090 lt!42086)))

(declare-fun tail!98 (List!381) List!381)

(assert (=> b!29407 (= lt!42086 (tail!98 lt!42091))))

(declare-fun lt!42087 () Unit!2283)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1360 BitStream!1360 BitStream!1360 BitStream!1360 (_ BitVec 64) List!381) Unit!2283)

(assert (=> b!29407 (= lt!42087 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1654 lt!42094) (_2!1654 lt!42094) (_1!1655 lt!42084) (_1!1655 lt!42096) (bvsub to!314 i!635) lt!42091))))

(assert (= (and start!6254 res!25381) b!29402))

(assert (= (and b!29402 res!25380) b!29405))

(assert (= (and b!29405 (not res!25378)) b!29396))

(assert (= (and b!29396 (not res!25369)) b!29404))

(assert (= (and b!29404 res!25375) b!29395))

(assert (= (and b!29404 (not res!25376)) b!29403))

(assert (= (and b!29403 (not res!25382)) b!29399))

(assert (= (and b!29399 (not res!25379)) b!29393))

(assert (= (and b!29393 (not res!25383)) b!29392))

(assert (= (and b!29392 res!25370) b!29400))

(assert (= (and b!29392 (not res!25372)) b!29406))

(assert (= (and b!29406 (not res!25371)) b!29401))

(assert (= (and b!29401 (not res!25373)) b!29394))

(assert (= (and b!29394 (not res!25374)) b!29398))

(assert (= (and b!29398 (not res!25377)) b!29407))

(assert (= start!6254 b!29397))

(declare-fun m!42537 () Bool)

(assert (=> b!29397 m!42537))

(declare-fun m!42539 () Bool)

(assert (=> b!29405 m!42539))

(declare-fun m!42541 () Bool)

(assert (=> b!29405 m!42541))

(declare-fun m!42543 () Bool)

(assert (=> b!29405 m!42543))

(declare-fun m!42545 () Bool)

(assert (=> b!29400 m!42545))

(declare-fun m!42547 () Bool)

(assert (=> start!6254 m!42547))

(declare-fun m!42549 () Bool)

(assert (=> start!6254 m!42549))

(declare-fun m!42551 () Bool)

(assert (=> b!29404 m!42551))

(declare-fun m!42553 () Bool)

(assert (=> b!29404 m!42553))

(declare-fun m!42555 () Bool)

(assert (=> b!29404 m!42555))

(declare-fun m!42557 () Bool)

(assert (=> b!29404 m!42557))

(declare-fun m!42559 () Bool)

(assert (=> b!29404 m!42559))

(declare-fun m!42561 () Bool)

(assert (=> b!29404 m!42561))

(declare-fun m!42563 () Bool)

(assert (=> b!29404 m!42563))

(declare-fun m!42565 () Bool)

(assert (=> b!29394 m!42565))

(declare-fun m!42567 () Bool)

(assert (=> b!29394 m!42567))

(declare-fun m!42569 () Bool)

(assert (=> b!29394 m!42569))

(declare-fun m!42571 () Bool)

(assert (=> b!29394 m!42571))

(declare-fun m!42573 () Bool)

(assert (=> b!29394 m!42573))

(declare-fun m!42575 () Bool)

(assert (=> b!29394 m!42575))

(declare-fun m!42577 () Bool)

(assert (=> b!29394 m!42577))

(declare-fun m!42579 () Bool)

(assert (=> b!29394 m!42579))

(declare-fun m!42581 () Bool)

(assert (=> b!29402 m!42581))

(declare-fun m!42583 () Bool)

(assert (=> b!29403 m!42583))

(declare-fun m!42585 () Bool)

(assert (=> b!29401 m!42585))

(declare-fun m!42587 () Bool)

(assert (=> b!29398 m!42587))

(declare-fun m!42589 () Bool)

(assert (=> b!29406 m!42589))

(declare-fun m!42591 () Bool)

(assert (=> b!29395 m!42591))

(assert (=> b!29395 m!42591))

(declare-fun m!42593 () Bool)

(assert (=> b!29395 m!42593))

(declare-fun m!42595 () Bool)

(assert (=> b!29395 m!42595))

(assert (=> b!29395 m!42595))

(declare-fun m!42597 () Bool)

(assert (=> b!29395 m!42597))

(declare-fun m!42599 () Bool)

(assert (=> b!29407 m!42599))

(declare-fun m!42601 () Bool)

(assert (=> b!29407 m!42601))

(declare-fun m!42603 () Bool)

(assert (=> b!29399 m!42603))

(declare-fun m!42605 () Bool)

(assert (=> b!29396 m!42605))

(declare-fun m!42607 () Bool)

(assert (=> b!29396 m!42607))

(declare-fun m!42609 () Bool)

(assert (=> b!29396 m!42609))

(declare-fun m!42611 () Bool)

(assert (=> b!29396 m!42611))

(assert (=> b!29396 m!42605))

(declare-fun m!42613 () Bool)

(assert (=> b!29396 m!42613))

(push 1)

(assert (not start!6254))

(assert (not b!29394))

(assert (not b!29403))

(assert (not b!29406))

(assert (not b!29400))

(assert (not b!29395))

(assert (not b!29402))

(assert (not b!29397))

(assert (not b!29396))

(assert (not b!29401))

(assert (not b!29404))

(assert (not b!29398))

(assert (not b!29407))

(assert (not b!29399))

(assert (not b!29405))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!8394 () Bool)

(assert (=> d!8394 (= (invariant!0 (currentBit!2429 (_2!1654 lt!42094)) (currentByte!2434 (_2!1654 lt!42094)) (size!769 (buf!1097 (_2!1654 lt!42094)))) (and (bvsge (currentBit!2429 (_2!1654 lt!42094)) #b00000000000000000000000000000000) (bvslt (currentBit!2429 (_2!1654 lt!42094)) #b00000000000000000000000000001000) (bvsge (currentByte!2434 (_2!1654 lt!42094)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2434 (_2!1654 lt!42094)) (size!769 (buf!1097 (_2!1654 lt!42094)))) (and (= (currentBit!2429 (_2!1654 lt!42094)) #b00000000000000000000000000000000) (= (currentByte!2434 (_2!1654 lt!42094)) (size!769 (buf!1097 (_2!1654 lt!42094))))))))))

(assert (=> b!29399 d!8394))

(declare-fun d!8396 () Bool)

(assert (=> d!8396 (= (invariant!0 (currentBit!2429 (_2!1654 lt!42082)) (currentByte!2434 (_2!1654 lt!42082)) (size!769 (buf!1097 (_2!1654 lt!42094)))) (and (bvsge (currentBit!2429 (_2!1654 lt!42082)) #b00000000000000000000000000000000) (bvslt (currentBit!2429 (_2!1654 lt!42082)) #b00000000000000000000000000001000) (bvsge (currentByte!2434 (_2!1654 lt!42082)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2434 (_2!1654 lt!42082)) (size!769 (buf!1097 (_2!1654 lt!42094)))) (and (= (currentBit!2429 (_2!1654 lt!42082)) #b00000000000000000000000000000000) (= (currentByte!2434 (_2!1654 lt!42082)) (size!769 (buf!1097 (_2!1654 lt!42094))))))))))

(assert (=> b!29401 d!8396))

(declare-fun d!8398 () Bool)

(declare-fun e!19819 () Bool)

(assert (=> d!8398 e!19819))

(declare-fun res!25541 () Bool)

(assert (=> d!8398 (=> (not res!25541) (not e!19819))))

(declare-fun lt!42402 () (_ BitVec 64))

(declare-fun lt!42398 () (_ BitVec 64))

(declare-fun lt!42401 () (_ BitVec 64))

(assert (=> d!8398 (= res!25541 (= lt!42398 (bvsub lt!42401 lt!42402)))))

(assert (=> d!8398 (or (= (bvand lt!42401 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!42402 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!42401 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!42401 lt!42402) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!8398 (= lt!42402 (remainingBits!0 ((_ sign_extend 32) (size!769 (buf!1097 (_2!1654 lt!42082)))) ((_ sign_extend 32) (currentByte!2434 (_2!1654 lt!42082))) ((_ sign_extend 32) (currentBit!2429 (_2!1654 lt!42082)))))))

(declare-fun lt!42399 () (_ BitVec 64))

(declare-fun lt!42400 () (_ BitVec 64))

(assert (=> d!8398 (= lt!42401 (bvmul lt!42399 lt!42400))))

(assert (=> d!8398 (or (= lt!42399 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!42400 (bvsdiv (bvmul lt!42399 lt!42400) lt!42399)))))

(assert (=> d!8398 (= lt!42400 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!8398 (= lt!42399 ((_ sign_extend 32) (size!769 (buf!1097 (_2!1654 lt!42082)))))))

(assert (=> d!8398 (= lt!42398 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2434 (_2!1654 lt!42082))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2429 (_2!1654 lt!42082)))))))

(assert (=> d!8398 (invariant!0 (currentBit!2429 (_2!1654 lt!42082)) (currentByte!2434 (_2!1654 lt!42082)) (size!769 (buf!1097 (_2!1654 lt!42082))))))

(assert (=> d!8398 (= (bitIndex!0 (size!769 (buf!1097 (_2!1654 lt!42082))) (currentByte!2434 (_2!1654 lt!42082)) (currentBit!2429 (_2!1654 lt!42082))) lt!42398)))

(declare-fun b!29612 () Bool)

(declare-fun res!25542 () Bool)

(assert (=> b!29612 (=> (not res!25542) (not e!19819))))

(assert (=> b!29612 (= res!25542 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!42398))))

(declare-fun b!29613 () Bool)

(declare-fun lt!42403 () (_ BitVec 64))

(assert (=> b!29613 (= e!19819 (bvsle lt!42398 (bvmul lt!42403 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!29613 (or (= lt!42403 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!42403 #b0000000000000000000000000000000000000000000000000000000000001000) lt!42403)))))

(assert (=> b!29613 (= lt!42403 ((_ sign_extend 32) (size!769 (buf!1097 (_2!1654 lt!42082)))))))

(assert (= (and d!8398 res!25541) b!29612))

(assert (= (and b!29612 res!25542) b!29613))

(declare-fun m!42907 () Bool)

(assert (=> d!8398 m!42907))

(assert (=> d!8398 m!42589))

(assert (=> b!29400 d!8398))

(declare-fun d!8410 () Bool)

(assert (=> d!8410 (= (array_inv!733 (buf!1097 thiss!1379)) (bvsge (size!769 (buf!1097 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!29397 d!8410))

(declare-fun d!8412 () Bool)

(assert (=> d!8412 (= (tail!98 lt!42091) (t!1131 lt!42091))))

(assert (=> b!29407 d!8412))

(declare-fun d!8414 () Bool)

(declare-fun e!19830 () Bool)

(assert (=> d!8414 e!19830))

(declare-fun res!25545 () Bool)

(assert (=> d!8414 (=> (not res!25545) (not e!19830))))

(declare-fun lt!42421 () (_ BitVec 64))

(assert (=> d!8414 (= res!25545 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!42421 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!42421) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!8414 (= lt!42421 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!42420 () Unit!2283)

(declare-fun choose!42 (BitStream!1360 BitStream!1360 BitStream!1360 BitStream!1360 (_ BitVec 64) List!381) Unit!2283)

(assert (=> d!8414 (= lt!42420 (choose!42 (_2!1654 lt!42094) (_2!1654 lt!42094) (_1!1655 lt!42084) (_1!1655 lt!42096) (bvsub to!314 i!635) lt!42091))))

(assert (=> d!8414 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!8414 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1654 lt!42094) (_2!1654 lt!42094) (_1!1655 lt!42084) (_1!1655 lt!42096) (bvsub to!314 i!635) lt!42091) lt!42420)))

(declare-fun b!29632 () Bool)

(assert (=> b!29632 (= e!19830 (= (bitStreamReadBitsIntoList!0 (_2!1654 lt!42094) (_1!1655 lt!42096) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!98 lt!42091)))))

(assert (= (and d!8414 res!25545) b!29632))

(declare-fun m!42929 () Bool)

(assert (=> d!8414 m!42929))

(declare-fun m!42931 () Bool)

(assert (=> b!29632 m!42931))

(assert (=> b!29632 m!42599))

(assert (=> b!29407 d!8414))

(declare-fun d!8428 () Bool)

(declare-fun res!25553 () Bool)

(declare-fun e!19835 () Bool)

(assert (=> d!8428 (=> (not res!25553) (not e!19835))))

(assert (=> d!8428 (= res!25553 (= (size!769 (buf!1097 thiss!1379)) (size!769 (buf!1097 (_2!1654 lt!42082)))))))

(assert (=> d!8428 (= (isPrefixOf!0 thiss!1379 (_2!1654 lt!42082)) e!19835)))

(declare-fun b!29639 () Bool)

(declare-fun res!25554 () Bool)

(assert (=> b!29639 (=> (not res!25554) (not e!19835))))

(assert (=> b!29639 (= res!25554 (bvsle (bitIndex!0 (size!769 (buf!1097 thiss!1379)) (currentByte!2434 thiss!1379) (currentBit!2429 thiss!1379)) (bitIndex!0 (size!769 (buf!1097 (_2!1654 lt!42082))) (currentByte!2434 (_2!1654 lt!42082)) (currentBit!2429 (_2!1654 lt!42082)))))))

(declare-fun b!29640 () Bool)

(declare-fun e!19836 () Bool)

(assert (=> b!29640 (= e!19835 e!19836)))

(declare-fun res!25552 () Bool)

(assert (=> b!29640 (=> res!25552 e!19836)))

(assert (=> b!29640 (= res!25552 (= (size!769 (buf!1097 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!29641 () Bool)

(declare-fun arrayBitRangesEq!0 (array!1769 array!1769 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!29641 (= e!19836 (arrayBitRangesEq!0 (buf!1097 thiss!1379) (buf!1097 (_2!1654 lt!42082)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!769 (buf!1097 thiss!1379)) (currentByte!2434 thiss!1379) (currentBit!2429 thiss!1379))))))

(assert (= (and d!8428 res!25553) b!29639))

(assert (= (and b!29639 res!25554) b!29640))

(assert (= (and b!29640 (not res!25552)) b!29641))

(assert (=> b!29639 m!42543))

(assert (=> b!29639 m!42545))

(assert (=> b!29641 m!42543))

(assert (=> b!29641 m!42543))

(declare-fun m!42933 () Bool)

(assert (=> b!29641 m!42933))

(assert (=> b!29396 d!8428))

(declare-fun d!8430 () Bool)

(assert (=> d!8430 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!769 (buf!1097 (_2!1654 lt!42082)))) ((_ sign_extend 32) (currentByte!2434 (_2!1654 lt!42082))) ((_ sign_extend 32) (currentBit!2429 (_2!1654 lt!42082))) lt!42081) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!769 (buf!1097 (_2!1654 lt!42082)))) ((_ sign_extend 32) (currentByte!2434 (_2!1654 lt!42082))) ((_ sign_extend 32) (currentBit!2429 (_2!1654 lt!42082)))) lt!42081))))

(declare-fun bs!2381 () Bool)

(assert (= bs!2381 d!8430))

(assert (=> bs!2381 m!42907))

(assert (=> b!29396 d!8430))

(declare-fun d!8432 () Bool)

(declare-fun e!19839 () Bool)

(assert (=> d!8432 e!19839))

(declare-fun res!25557 () Bool)

(assert (=> d!8432 (=> (not res!25557) (not e!19839))))

(assert (=> d!8432 (= res!25557 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!42424 () Unit!2283)

(declare-fun choose!27 (BitStream!1360 BitStream!1360 (_ BitVec 64) (_ BitVec 64)) Unit!2283)

(assert (=> d!8432 (= lt!42424 (choose!27 thiss!1379 (_2!1654 lt!42082) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!8432 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!8432 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1654 lt!42082) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!42424)))

(declare-fun b!29644 () Bool)

(assert (=> b!29644 (= e!19839 (validate_offset_bits!1 ((_ sign_extend 32) (size!769 (buf!1097 (_2!1654 lt!42082)))) ((_ sign_extend 32) (currentByte!2434 (_2!1654 lt!42082))) ((_ sign_extend 32) (currentBit!2429 (_2!1654 lt!42082))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!8432 res!25557) b!29644))

(declare-fun m!42935 () Bool)

(assert (=> d!8432 m!42935))

(declare-fun m!42937 () Bool)

(assert (=> b!29644 m!42937))

(assert (=> b!29396 d!8432))

(declare-fun b!29698 () Bool)

(declare-fun res!25601 () Bool)

(declare-fun e!19869 () Bool)

(assert (=> b!29698 (=> (not res!25601) (not e!19869))))

(declare-fun lt!42541 () tuple2!3134)

(assert (=> b!29698 (= res!25601 (= (bitIndex!0 (size!769 (buf!1097 (_2!1654 lt!42541))) (currentByte!2434 (_2!1654 lt!42541)) (currentBit!2429 (_2!1654 lt!42541))) (bvadd (bitIndex!0 (size!769 (buf!1097 thiss!1379)) (currentByte!2434 thiss!1379) (currentBit!2429 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!29699 () Bool)

(declare-fun res!25602 () Bool)

(assert (=> b!29699 (=> (not res!25602) (not e!19869))))

(assert (=> b!29699 (= res!25602 (isPrefixOf!0 thiss!1379 (_2!1654 lt!42541)))))

(declare-fun b!29700 () Bool)

(declare-fun e!19867 () Bool)

(declare-datatypes ((tuple2!3162 0))(
  ( (tuple2!3163 (_1!1668 BitStream!1360) (_2!1668 Bool)) )
))
(declare-fun lt!42550 () tuple2!3162)

(assert (=> b!29700 (= e!19867 (= (bitIndex!0 (size!769 (buf!1097 (_1!1668 lt!42550))) (currentByte!2434 (_1!1668 lt!42550)) (currentBit!2429 (_1!1668 lt!42550))) (bitIndex!0 (size!769 (buf!1097 (_2!1654 lt!42541))) (currentByte!2434 (_2!1654 lt!42541)) (currentBit!2429 (_2!1654 lt!42541)))))))

(declare-fun d!8434 () Bool)

(declare-fun e!19870 () Bool)

(assert (=> d!8434 e!19870))

(declare-fun res!25603 () Bool)

(assert (=> d!8434 (=> (not res!25603) (not e!19870))))

(declare-fun lt!42547 () tuple2!3134)

(assert (=> d!8434 (= res!25603 (= (size!769 (buf!1097 (_2!1654 lt!42547))) (size!769 (buf!1097 thiss!1379))))))

(declare-fun lt!42543 () (_ BitVec 8))

(declare-fun lt!42545 () array!1769)

(assert (=> d!8434 (= lt!42543 (select (arr!1232 lt!42545) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!8434 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!769 lt!42545)))))

(assert (=> d!8434 (= lt!42545 (array!1770 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!42539 () tuple2!3134)

(assert (=> d!8434 (= lt!42547 (tuple2!3135 (_1!1654 lt!42539) (_2!1654 lt!42539)))))

(assert (=> d!8434 (= lt!42539 lt!42541)))

(assert (=> d!8434 e!19869))

(declare-fun res!25600 () Bool)

(assert (=> d!8434 (=> (not res!25600) (not e!19869))))

(assert (=> d!8434 (= res!25600 (= (size!769 (buf!1097 thiss!1379)) (size!769 (buf!1097 (_2!1654 lt!42541)))))))

(declare-fun lt!42542 () Bool)

(declare-fun appendBit!0 (BitStream!1360 Bool) tuple2!3134)

(assert (=> d!8434 (= lt!42541 (appendBit!0 thiss!1379 lt!42542))))

(assert (=> d!8434 (= lt!42542 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1232 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!8434 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!8434 (= (appendBitFromByte!0 thiss!1379 (select (arr!1232 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!42547)))

(declare-fun b!29701 () Bool)

(declare-fun e!19868 () Bool)

(assert (=> b!29701 (= e!19870 e!19868)))

(declare-fun res!25599 () Bool)

(assert (=> b!29701 (=> (not res!25599) (not e!19868))))

(declare-fun lt!42540 () tuple2!3162)

(assert (=> b!29701 (= res!25599 (and (= (_2!1668 lt!42540) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1232 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!42543)) #b00000000000000000000000000000000))) (= (_1!1668 lt!42540) (_2!1654 lt!42547))))))

(declare-datatypes ((tuple2!3164 0))(
  ( (tuple2!3165 (_1!1669 array!1769) (_2!1669 BitStream!1360)) )
))
(declare-fun lt!42546 () tuple2!3164)

(declare-fun lt!42544 () BitStream!1360)

(declare-fun readBits!0 (BitStream!1360 (_ BitVec 64)) tuple2!3164)

(assert (=> b!29701 (= lt!42546 (readBits!0 lt!42544 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!1360) tuple2!3162)

(assert (=> b!29701 (= lt!42540 (readBitPure!0 lt!42544))))

(declare-fun readerFrom!0 (BitStream!1360 (_ BitVec 32) (_ BitVec 32)) BitStream!1360)

(assert (=> b!29701 (= lt!42544 (readerFrom!0 (_2!1654 lt!42547) (currentBit!2429 thiss!1379) (currentByte!2434 thiss!1379)))))

(declare-fun b!29702 () Bool)

(declare-fun res!25604 () Bool)

(assert (=> b!29702 (=> (not res!25604) (not e!19870))))

(assert (=> b!29702 (= res!25604 (isPrefixOf!0 thiss!1379 (_2!1654 lt!42547)))))

(declare-fun b!29703 () Bool)

(assert (=> b!29703 (= e!19868 (= (bitIndex!0 (size!769 (buf!1097 (_1!1668 lt!42540))) (currentByte!2434 (_1!1668 lt!42540)) (currentBit!2429 (_1!1668 lt!42540))) (bitIndex!0 (size!769 (buf!1097 (_2!1654 lt!42547))) (currentByte!2434 (_2!1654 lt!42547)) (currentBit!2429 (_2!1654 lt!42547)))))))

(declare-fun b!29704 () Bool)

(declare-fun res!25605 () Bool)

(assert (=> b!29704 (=> (not res!25605) (not e!19870))))

(declare-fun lt!42548 () (_ BitVec 64))

(declare-fun lt!42549 () (_ BitVec 64))

(assert (=> b!29704 (= res!25605 (= (bitIndex!0 (size!769 (buf!1097 (_2!1654 lt!42547))) (currentByte!2434 (_2!1654 lt!42547)) (currentBit!2429 (_2!1654 lt!42547))) (bvadd lt!42549 lt!42548)))))

(assert (=> b!29704 (or (not (= (bvand lt!42549 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!42548 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!42549 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!42549 lt!42548) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!29704 (= lt!42548 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!29704 (= lt!42549 (bitIndex!0 (size!769 (buf!1097 thiss!1379)) (currentByte!2434 thiss!1379) (currentBit!2429 thiss!1379)))))

(declare-fun b!29705 () Bool)

(assert (=> b!29705 (= e!19869 e!19867)))

(declare-fun res!25598 () Bool)

(assert (=> b!29705 (=> (not res!25598) (not e!19867))))

(assert (=> b!29705 (= res!25598 (and (= (_2!1668 lt!42550) lt!42542) (= (_1!1668 lt!42550) (_2!1654 lt!42541))))))

(assert (=> b!29705 (= lt!42550 (readBitPure!0 (readerFrom!0 (_2!1654 lt!42541) (currentBit!2429 thiss!1379) (currentByte!2434 thiss!1379))))))

(assert (= (and d!8434 res!25600) b!29698))

(assert (= (and b!29698 res!25601) b!29699))

(assert (= (and b!29699 res!25602) b!29705))

(assert (= (and b!29705 res!25598) b!29700))

(assert (= (and d!8434 res!25603) b!29704))

(assert (= (and b!29704 res!25605) b!29702))

(assert (= (and b!29702 res!25604) b!29701))

(assert (= (and b!29701 res!25599) b!29703))

(declare-fun m!43011 () Bool)

(assert (=> b!29698 m!43011))

(assert (=> b!29698 m!42543))

(declare-fun m!43013 () Bool)

(assert (=> b!29702 m!43013))

(declare-fun m!43015 () Bool)

(assert (=> b!29704 m!43015))

(assert (=> b!29704 m!42543))

(declare-fun m!43017 () Bool)

(assert (=> d!8434 m!43017))

(declare-fun m!43019 () Bool)

(assert (=> d!8434 m!43019))

(declare-fun m!43021 () Bool)

(assert (=> d!8434 m!43021))

(declare-fun m!43023 () Bool)

(assert (=> b!29701 m!43023))

(declare-fun m!43025 () Bool)

(assert (=> b!29701 m!43025))

(declare-fun m!43027 () Bool)

(assert (=> b!29701 m!43027))

(declare-fun m!43029 () Bool)

(assert (=> b!29705 m!43029))

(assert (=> b!29705 m!43029))

(declare-fun m!43031 () Bool)

(assert (=> b!29705 m!43031))

(declare-fun m!43033 () Bool)

(assert (=> b!29700 m!43033))

(assert (=> b!29700 m!43011))

(declare-fun m!43035 () Bool)

(assert (=> b!29699 m!43035))

(declare-fun m!43037 () Bool)

(assert (=> b!29703 m!43037))

(assert (=> b!29703 m!43015))

(assert (=> b!29396 d!8434))

(declare-fun d!8454 () Bool)

(declare-fun size!773 (List!381) Int)

(assert (=> d!8454 (= (length!107 lt!42091) (size!773 lt!42091))))

(declare-fun bs!2386 () Bool)

(assert (= bs!2386 d!8454))

(declare-fun m!43039 () Bool)

(assert (=> bs!2386 m!43039))

(assert (=> b!29398 d!8454))

(declare-fun d!8456 () Bool)

(declare-fun res!25615 () Bool)

(declare-fun e!19875 () Bool)

(assert (=> d!8456 (=> (not res!25615) (not e!19875))))

(assert (=> d!8456 (= res!25615 (= (size!769 (buf!1097 thiss!1379)) (size!769 (buf!1097 thiss!1379))))))

(assert (=> d!8456 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!19875)))

(declare-fun b!29715 () Bool)

(declare-fun res!25616 () Bool)

(assert (=> b!29715 (=> (not res!25616) (not e!19875))))

(assert (=> b!29715 (= res!25616 (bvsle (bitIndex!0 (size!769 (buf!1097 thiss!1379)) (currentByte!2434 thiss!1379) (currentBit!2429 thiss!1379)) (bitIndex!0 (size!769 (buf!1097 thiss!1379)) (currentByte!2434 thiss!1379) (currentBit!2429 thiss!1379))))))

(declare-fun b!29716 () Bool)

(declare-fun e!19876 () Bool)

(assert (=> b!29716 (= e!19875 e!19876)))

(declare-fun res!25614 () Bool)

(assert (=> b!29716 (=> res!25614 e!19876)))

(assert (=> b!29716 (= res!25614 (= (size!769 (buf!1097 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!29717 () Bool)

(assert (=> b!29717 (= e!19876 (arrayBitRangesEq!0 (buf!1097 thiss!1379) (buf!1097 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!769 (buf!1097 thiss!1379)) (currentByte!2434 thiss!1379) (currentBit!2429 thiss!1379))))))

(assert (= (and d!8456 res!25615) b!29715))

(assert (= (and b!29715 res!25616) b!29716))

(assert (= (and b!29716 (not res!25614)) b!29717))

(assert (=> b!29715 m!42543))

(assert (=> b!29715 m!42543))

(assert (=> b!29717 m!42543))

(assert (=> b!29717 m!42543))

(declare-fun m!43041 () Bool)

(assert (=> b!29717 m!43041))

(assert (=> b!29405 d!8456))

(declare-fun d!8458 () Bool)

(assert (=> d!8458 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!42577 () Unit!2283)

(declare-fun choose!11 (BitStream!1360) Unit!2283)

(assert (=> d!8458 (= lt!42577 (choose!11 thiss!1379))))

(assert (=> d!8458 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!42577)))

(declare-fun bs!2388 () Bool)

(assert (= bs!2388 d!8458))

(assert (=> bs!2388 m!42539))

(declare-fun m!43043 () Bool)

(assert (=> bs!2388 m!43043))

(assert (=> b!29405 d!8458))

(declare-fun d!8460 () Bool)

(declare-fun e!19881 () Bool)

(assert (=> d!8460 e!19881))

(declare-fun res!25625 () Bool)

(assert (=> d!8460 (=> (not res!25625) (not e!19881))))

(declare-fun lt!42582 () (_ BitVec 64))

(declare-fun lt!42578 () (_ BitVec 64))

(declare-fun lt!42581 () (_ BitVec 64))

(assert (=> d!8460 (= res!25625 (= lt!42578 (bvsub lt!42581 lt!42582)))))

(assert (=> d!8460 (or (= (bvand lt!42581 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!42582 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!42581 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!42581 lt!42582) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!8460 (= lt!42582 (remainingBits!0 ((_ sign_extend 32) (size!769 (buf!1097 thiss!1379))) ((_ sign_extend 32) (currentByte!2434 thiss!1379)) ((_ sign_extend 32) (currentBit!2429 thiss!1379))))))

(declare-fun lt!42579 () (_ BitVec 64))

(declare-fun lt!42580 () (_ BitVec 64))

(assert (=> d!8460 (= lt!42581 (bvmul lt!42579 lt!42580))))

(assert (=> d!8460 (or (= lt!42579 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!42580 (bvsdiv (bvmul lt!42579 lt!42580) lt!42579)))))

(assert (=> d!8460 (= lt!42580 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!8460 (= lt!42579 ((_ sign_extend 32) (size!769 (buf!1097 thiss!1379))))))

(assert (=> d!8460 (= lt!42578 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2434 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2429 thiss!1379))))))

(assert (=> d!8460 (invariant!0 (currentBit!2429 thiss!1379) (currentByte!2434 thiss!1379) (size!769 (buf!1097 thiss!1379)))))

(assert (=> d!8460 (= (bitIndex!0 (size!769 (buf!1097 thiss!1379)) (currentByte!2434 thiss!1379) (currentBit!2429 thiss!1379)) lt!42578)))

(declare-fun b!29726 () Bool)

(declare-fun res!25626 () Bool)

(assert (=> b!29726 (=> (not res!25626) (not e!19881))))

(assert (=> b!29726 (= res!25626 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!42578))))

(declare-fun b!29727 () Bool)

(declare-fun lt!42583 () (_ BitVec 64))

(assert (=> b!29727 (= e!19881 (bvsle lt!42578 (bvmul lt!42583 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!29727 (or (= lt!42583 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!42583 #b0000000000000000000000000000000000000000000000000000000000001000) lt!42583)))))

(assert (=> b!29727 (= lt!42583 ((_ sign_extend 32) (size!769 (buf!1097 thiss!1379))))))

(assert (= (and d!8460 res!25625) b!29726))

(assert (= (and b!29726 res!25626) b!29727))

(declare-fun m!43045 () Bool)

(assert (=> d!8460 m!43045))

(declare-fun m!43047 () Bool)

(assert (=> d!8460 m!43047))

(assert (=> b!29405 d!8460))

(declare-fun d!8462 () Bool)

(assert (=> d!8462 (validate_offset_bits!1 ((_ sign_extend 32) (size!769 (buf!1097 (_2!1654 lt!42094)))) ((_ sign_extend 32) (currentByte!2434 thiss!1379)) ((_ sign_extend 32) (currentBit!2429 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!42598 () Unit!2283)

(declare-fun choose!9 (BitStream!1360 array!1769 (_ BitVec 64) BitStream!1360) Unit!2283)

(assert (=> d!8462 (= lt!42598 (choose!9 thiss!1379 (buf!1097 (_2!1654 lt!42094)) (bvsub to!314 i!635) (BitStream!1361 (buf!1097 (_2!1654 lt!42094)) (currentByte!2434 thiss!1379) (currentBit!2429 thiss!1379))))))

(assert (=> d!8462 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1097 (_2!1654 lt!42094)) (bvsub to!314 i!635)) lt!42598)))

(declare-fun bs!2389 () Bool)

(assert (= bs!2389 d!8462))

(assert (=> bs!2389 m!42569))

(declare-fun m!43077 () Bool)

(assert (=> bs!2389 m!43077))

(assert (=> b!29394 d!8462))

(declare-fun d!8468 () Bool)

(declare-fun e!19894 () Bool)

(assert (=> d!8468 e!19894))

(declare-fun c!1941 () Bool)

(assert (=> d!8468 (= c!1941 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!42622 () List!381)

(declare-datatypes ((tuple2!3166 0))(
  ( (tuple2!3167 (_1!1670 List!381) (_2!1670 BitStream!1360)) )
))
(declare-fun e!19895 () tuple2!3166)

(assert (=> d!8468 (= lt!42622 (_1!1670 e!19895))))

(declare-fun c!1942 () Bool)

(assert (=> d!8468 (= c!1942 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8468 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!8468 (= (bitStreamReadBitsIntoList!0 (_2!1654 lt!42094) (_1!1655 lt!42084) (bvsub to!314 i!635)) lt!42622)))

(declare-fun b!29753 () Bool)

(declare-fun isEmpty!78 (List!381) Bool)

(assert (=> b!29753 (= e!19894 (isEmpty!78 lt!42622))))

(declare-fun b!29751 () Bool)

(assert (=> b!29751 (= e!19895 (tuple2!3167 Nil!378 (_1!1655 lt!42084)))))

(declare-fun b!29754 () Bool)

(assert (=> b!29754 (= e!19894 (> (length!107 lt!42622) 0))))

(declare-datatypes ((tuple2!3168 0))(
  ( (tuple2!3169 (_1!1671 Bool) (_2!1671 BitStream!1360)) )
))
(declare-fun lt!42620 () tuple2!3168)

(declare-fun lt!42621 () (_ BitVec 64))

(declare-fun b!29752 () Bool)

(assert (=> b!29752 (= e!19895 (tuple2!3167 (Cons!377 (_1!1671 lt!42620) (bitStreamReadBitsIntoList!0 (_2!1654 lt!42094) (_2!1671 lt!42620) (bvsub (bvsub to!314 i!635) lt!42621))) (_2!1671 lt!42620)))))

(declare-fun readBit!0 (BitStream!1360) tuple2!3168)

(assert (=> b!29752 (= lt!42620 (readBit!0 (_1!1655 lt!42084)))))

(assert (=> b!29752 (= lt!42621 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!8468 c!1942) b!29751))

(assert (= (and d!8468 (not c!1942)) b!29752))

(assert (= (and d!8468 c!1941) b!29753))

(assert (= (and d!8468 (not c!1941)) b!29754))

(declare-fun m!43085 () Bool)

(assert (=> b!29753 m!43085))

(declare-fun m!43087 () Bool)

(assert (=> b!29754 m!43087))

(declare-fun m!43089 () Bool)

(assert (=> b!29752 m!43089))

(declare-fun m!43091 () Bool)

(assert (=> b!29752 m!43091))

(assert (=> b!29394 d!8468))

(declare-fun d!8478 () Bool)

(assert (=> d!8478 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!769 (buf!1097 (_2!1654 lt!42094)))) ((_ sign_extend 32) (currentByte!2434 (_2!1654 lt!42082))) ((_ sign_extend 32) (currentBit!2429 (_2!1654 lt!42082))) lt!42081) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!769 (buf!1097 (_2!1654 lt!42094)))) ((_ sign_extend 32) (currentByte!2434 (_2!1654 lt!42082))) ((_ sign_extend 32) (currentBit!2429 (_2!1654 lt!42082)))) lt!42081))))

(declare-fun bs!2393 () Bool)

(assert (= bs!2393 d!8478))

(declare-fun m!43093 () Bool)

(assert (=> bs!2393 m!43093))

(assert (=> b!29394 d!8478))

(declare-fun d!8480 () Bool)

(declare-fun e!19896 () Bool)

(assert (=> d!8480 e!19896))

(declare-fun c!1943 () Bool)

(assert (=> d!8480 (= c!1943 (= lt!42081 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!42625 () List!381)

(declare-fun e!19897 () tuple2!3166)

(assert (=> d!8480 (= lt!42625 (_1!1670 e!19897))))

(declare-fun c!1944 () Bool)

(assert (=> d!8480 (= c!1944 (= lt!42081 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8480 (bvsge lt!42081 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!8480 (= (bitStreamReadBitsIntoList!0 (_2!1654 lt!42094) (_1!1655 lt!42096) lt!42081) lt!42625)))

(declare-fun b!29757 () Bool)

(assert (=> b!29757 (= e!19896 (isEmpty!78 lt!42625))))

(declare-fun b!29755 () Bool)

(assert (=> b!29755 (= e!19897 (tuple2!3167 Nil!378 (_1!1655 lt!42096)))))

(declare-fun b!29758 () Bool)

(assert (=> b!29758 (= e!19896 (> (length!107 lt!42625) 0))))

(declare-fun lt!42623 () tuple2!3168)

(declare-fun b!29756 () Bool)

(declare-fun lt!42624 () (_ BitVec 64))

(assert (=> b!29756 (= e!19897 (tuple2!3167 (Cons!377 (_1!1671 lt!42623) (bitStreamReadBitsIntoList!0 (_2!1654 lt!42094) (_2!1671 lt!42623) (bvsub lt!42081 lt!42624))) (_2!1671 lt!42623)))))

(assert (=> b!29756 (= lt!42623 (readBit!0 (_1!1655 lt!42096)))))

(assert (=> b!29756 (= lt!42624 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!8480 c!1944) b!29755))

(assert (= (and d!8480 (not c!1944)) b!29756))

(assert (= (and d!8480 c!1943) b!29757))

(assert (= (and d!8480 (not c!1943)) b!29758))

(declare-fun m!43095 () Bool)

(assert (=> b!29757 m!43095))

(declare-fun m!43097 () Bool)

(assert (=> b!29758 m!43097))

(declare-fun m!43099 () Bool)

(assert (=> b!29756 m!43099))

(declare-fun m!43101 () Bool)

(assert (=> b!29756 m!43101))

(assert (=> b!29394 d!8480))

(declare-fun b!29769 () Bool)

(declare-fun e!19903 () Unit!2283)

(declare-fun lt!42674 () Unit!2283)

(assert (=> b!29769 (= e!19903 lt!42674)))

(declare-fun lt!42677 () (_ BitVec 64))

(assert (=> b!29769 (= lt!42677 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42684 () (_ BitVec 64))

(assert (=> b!29769 (= lt!42684 (bitIndex!0 (size!769 (buf!1097 thiss!1379)) (currentByte!2434 thiss!1379) (currentBit!2429 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1769 array!1769 (_ BitVec 64) (_ BitVec 64)) Unit!2283)

(assert (=> b!29769 (= lt!42674 (arrayBitRangesEqSymmetric!0 (buf!1097 thiss!1379) (buf!1097 (_2!1654 lt!42094)) lt!42677 lt!42684))))

(assert (=> b!29769 (arrayBitRangesEq!0 (buf!1097 (_2!1654 lt!42094)) (buf!1097 thiss!1379) lt!42677 lt!42684)))

(declare-fun d!8482 () Bool)

(declare-fun e!19902 () Bool)

(assert (=> d!8482 e!19902))

(declare-fun res!25648 () Bool)

(assert (=> d!8482 (=> (not res!25648) (not e!19902))))

(declare-fun lt!42678 () tuple2!3136)

(assert (=> d!8482 (= res!25648 (isPrefixOf!0 (_1!1655 lt!42678) (_2!1655 lt!42678)))))

(declare-fun lt!42670 () BitStream!1360)

(assert (=> d!8482 (= lt!42678 (tuple2!3137 lt!42670 (_2!1654 lt!42094)))))

(declare-fun lt!42666 () Unit!2283)

(declare-fun lt!42671 () Unit!2283)

(assert (=> d!8482 (= lt!42666 lt!42671)))

(assert (=> d!8482 (isPrefixOf!0 lt!42670 (_2!1654 lt!42094))))

(assert (=> d!8482 (= lt!42671 (lemmaIsPrefixTransitive!0 lt!42670 (_2!1654 lt!42094) (_2!1654 lt!42094)))))

(declare-fun lt!42669 () Unit!2283)

(declare-fun lt!42676 () Unit!2283)

(assert (=> d!8482 (= lt!42669 lt!42676)))

(assert (=> d!8482 (isPrefixOf!0 lt!42670 (_2!1654 lt!42094))))

(assert (=> d!8482 (= lt!42676 (lemmaIsPrefixTransitive!0 lt!42670 thiss!1379 (_2!1654 lt!42094)))))

(declare-fun lt!42668 () Unit!2283)

(assert (=> d!8482 (= lt!42668 e!19903)))

(declare-fun c!1947 () Bool)

(assert (=> d!8482 (= c!1947 (not (= (size!769 (buf!1097 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!42679 () Unit!2283)

(declare-fun lt!42673 () Unit!2283)

(assert (=> d!8482 (= lt!42679 lt!42673)))

(assert (=> d!8482 (isPrefixOf!0 (_2!1654 lt!42094) (_2!1654 lt!42094))))

(assert (=> d!8482 (= lt!42673 (lemmaIsPrefixRefl!0 (_2!1654 lt!42094)))))

(declare-fun lt!42680 () Unit!2283)

(declare-fun lt!42682 () Unit!2283)

(assert (=> d!8482 (= lt!42680 lt!42682)))

(assert (=> d!8482 (= lt!42682 (lemmaIsPrefixRefl!0 (_2!1654 lt!42094)))))

(declare-fun lt!42667 () Unit!2283)

(declare-fun lt!42685 () Unit!2283)

(assert (=> d!8482 (= lt!42667 lt!42685)))

(assert (=> d!8482 (isPrefixOf!0 lt!42670 lt!42670)))

(assert (=> d!8482 (= lt!42685 (lemmaIsPrefixRefl!0 lt!42670))))

(declare-fun lt!42672 () Unit!2283)

(declare-fun lt!42681 () Unit!2283)

(assert (=> d!8482 (= lt!42672 lt!42681)))

(assert (=> d!8482 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!8482 (= lt!42681 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!8482 (= lt!42670 (BitStream!1361 (buf!1097 (_2!1654 lt!42094)) (currentByte!2434 thiss!1379) (currentBit!2429 thiss!1379)))))

(assert (=> d!8482 (isPrefixOf!0 thiss!1379 (_2!1654 lt!42094))))

(assert (=> d!8482 (= (reader!0 thiss!1379 (_2!1654 lt!42094)) lt!42678)))

(declare-fun b!29770 () Bool)

(declare-fun res!25649 () Bool)

(assert (=> b!29770 (=> (not res!25649) (not e!19902))))

(assert (=> b!29770 (= res!25649 (isPrefixOf!0 (_1!1655 lt!42678) thiss!1379))))

(declare-fun b!29771 () Bool)

(declare-fun Unit!2308 () Unit!2283)

(assert (=> b!29771 (= e!19903 Unit!2308)))

(declare-fun b!29772 () Bool)

(declare-fun lt!42683 () (_ BitVec 64))

(declare-fun lt!42675 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1360 (_ BitVec 64)) BitStream!1360)

(assert (=> b!29772 (= e!19902 (= (_1!1655 lt!42678) (withMovedBitIndex!0 (_2!1655 lt!42678) (bvsub lt!42683 lt!42675))))))

(assert (=> b!29772 (or (= (bvand lt!42683 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!42675 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!42683 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!42683 lt!42675) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!29772 (= lt!42675 (bitIndex!0 (size!769 (buf!1097 (_2!1654 lt!42094))) (currentByte!2434 (_2!1654 lt!42094)) (currentBit!2429 (_2!1654 lt!42094))))))

(assert (=> b!29772 (= lt!42683 (bitIndex!0 (size!769 (buf!1097 thiss!1379)) (currentByte!2434 thiss!1379) (currentBit!2429 thiss!1379)))))

(declare-fun b!29773 () Bool)

(declare-fun res!25650 () Bool)

(assert (=> b!29773 (=> (not res!25650) (not e!19902))))

(assert (=> b!29773 (= res!25650 (isPrefixOf!0 (_2!1655 lt!42678) (_2!1654 lt!42094)))))

(assert (= (and d!8482 c!1947) b!29769))

(assert (= (and d!8482 (not c!1947)) b!29771))

(assert (= (and d!8482 res!25648) b!29770))

(assert (= (and b!29770 res!25649) b!29773))

(assert (= (and b!29773 res!25650) b!29772))

(assert (=> d!8482 m!42539))

(declare-fun m!43103 () Bool)

(assert (=> d!8482 m!43103))

(declare-fun m!43105 () Bool)

(assert (=> d!8482 m!43105))

(assert (=> d!8482 m!42541))

(declare-fun m!43107 () Bool)

(assert (=> d!8482 m!43107))

(declare-fun m!43109 () Bool)

(assert (=> d!8482 m!43109))

(declare-fun m!43111 () Bool)

(assert (=> d!8482 m!43111))

(declare-fun m!43113 () Bool)

(assert (=> d!8482 m!43113))

(declare-fun m!43115 () Bool)

(assert (=> d!8482 m!43115))

(assert (=> d!8482 m!42563))

(declare-fun m!43117 () Bool)

(assert (=> d!8482 m!43117))

(declare-fun m!43119 () Bool)

(assert (=> b!29770 m!43119))

(assert (=> b!29769 m!42543))

(declare-fun m!43121 () Bool)

(assert (=> b!29769 m!43121))

(declare-fun m!43123 () Bool)

(assert (=> b!29769 m!43123))

(declare-fun m!43125 () Bool)

(assert (=> b!29772 m!43125))

(assert (=> b!29772 m!42583))

(assert (=> b!29772 m!42543))

(declare-fun m!43127 () Bool)

(assert (=> b!29773 m!43127))

(assert (=> b!29394 d!8482))

(declare-fun d!8484 () Bool)

(assert (=> d!8484 (validate_offset_bits!1 ((_ sign_extend 32) (size!769 (buf!1097 (_2!1654 lt!42094)))) ((_ sign_extend 32) (currentByte!2434 (_2!1654 lt!42082))) ((_ sign_extend 32) (currentBit!2429 (_2!1654 lt!42082))) lt!42081)))

(declare-fun lt!42686 () Unit!2283)

(assert (=> d!8484 (= lt!42686 (choose!9 (_2!1654 lt!42082) (buf!1097 (_2!1654 lt!42094)) lt!42081 (BitStream!1361 (buf!1097 (_2!1654 lt!42094)) (currentByte!2434 (_2!1654 lt!42082)) (currentBit!2429 (_2!1654 lt!42082)))))))

(assert (=> d!8484 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1654 lt!42082) (buf!1097 (_2!1654 lt!42094)) lt!42081) lt!42686)))

(declare-fun bs!2394 () Bool)

(assert (= bs!2394 d!8484))

(assert (=> bs!2394 m!42565))

(declare-fun m!43129 () Bool)

(assert (=> bs!2394 m!43129))

(assert (=> b!29394 d!8484))

(declare-fun d!8486 () Bool)

(assert (=> d!8486 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!769 (buf!1097 (_2!1654 lt!42094)))) ((_ sign_extend 32) (currentByte!2434 thiss!1379)) ((_ sign_extend 32) (currentBit!2429 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!769 (buf!1097 (_2!1654 lt!42094)))) ((_ sign_extend 32) (currentByte!2434 thiss!1379)) ((_ sign_extend 32) (currentBit!2429 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2395 () Bool)

(assert (= bs!2395 d!8486))

(declare-fun m!43131 () Bool)

(assert (=> bs!2395 m!43131))

(assert (=> b!29394 d!8486))

(declare-fun b!29774 () Bool)

(declare-fun e!19905 () Unit!2283)

(declare-fun lt!42695 () Unit!2283)

(assert (=> b!29774 (= e!19905 lt!42695)))

(declare-fun lt!42698 () (_ BitVec 64))

(assert (=> b!29774 (= lt!42698 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42705 () (_ BitVec 64))

(assert (=> b!29774 (= lt!42705 (bitIndex!0 (size!769 (buf!1097 (_2!1654 lt!42082))) (currentByte!2434 (_2!1654 lt!42082)) (currentBit!2429 (_2!1654 lt!42082))))))

(assert (=> b!29774 (= lt!42695 (arrayBitRangesEqSymmetric!0 (buf!1097 (_2!1654 lt!42082)) (buf!1097 (_2!1654 lt!42094)) lt!42698 lt!42705))))

(assert (=> b!29774 (arrayBitRangesEq!0 (buf!1097 (_2!1654 lt!42094)) (buf!1097 (_2!1654 lt!42082)) lt!42698 lt!42705)))

(declare-fun d!8488 () Bool)

(declare-fun e!19904 () Bool)

(assert (=> d!8488 e!19904))

(declare-fun res!25651 () Bool)

(assert (=> d!8488 (=> (not res!25651) (not e!19904))))

(declare-fun lt!42699 () tuple2!3136)

(assert (=> d!8488 (= res!25651 (isPrefixOf!0 (_1!1655 lt!42699) (_2!1655 lt!42699)))))

(declare-fun lt!42691 () BitStream!1360)

(assert (=> d!8488 (= lt!42699 (tuple2!3137 lt!42691 (_2!1654 lt!42094)))))

(declare-fun lt!42687 () Unit!2283)

(declare-fun lt!42692 () Unit!2283)

(assert (=> d!8488 (= lt!42687 lt!42692)))

(assert (=> d!8488 (isPrefixOf!0 lt!42691 (_2!1654 lt!42094))))

(assert (=> d!8488 (= lt!42692 (lemmaIsPrefixTransitive!0 lt!42691 (_2!1654 lt!42094) (_2!1654 lt!42094)))))

(declare-fun lt!42690 () Unit!2283)

(declare-fun lt!42697 () Unit!2283)

(assert (=> d!8488 (= lt!42690 lt!42697)))

(assert (=> d!8488 (isPrefixOf!0 lt!42691 (_2!1654 lt!42094))))

(assert (=> d!8488 (= lt!42697 (lemmaIsPrefixTransitive!0 lt!42691 (_2!1654 lt!42082) (_2!1654 lt!42094)))))

(declare-fun lt!42689 () Unit!2283)

(assert (=> d!8488 (= lt!42689 e!19905)))

(declare-fun c!1948 () Bool)

(assert (=> d!8488 (= c!1948 (not (= (size!769 (buf!1097 (_2!1654 lt!42082))) #b00000000000000000000000000000000)))))

(declare-fun lt!42700 () Unit!2283)

(declare-fun lt!42694 () Unit!2283)

(assert (=> d!8488 (= lt!42700 lt!42694)))

(assert (=> d!8488 (isPrefixOf!0 (_2!1654 lt!42094) (_2!1654 lt!42094))))

(assert (=> d!8488 (= lt!42694 (lemmaIsPrefixRefl!0 (_2!1654 lt!42094)))))

(declare-fun lt!42701 () Unit!2283)

(declare-fun lt!42703 () Unit!2283)

(assert (=> d!8488 (= lt!42701 lt!42703)))

(assert (=> d!8488 (= lt!42703 (lemmaIsPrefixRefl!0 (_2!1654 lt!42094)))))

(declare-fun lt!42688 () Unit!2283)

(declare-fun lt!42706 () Unit!2283)

(assert (=> d!8488 (= lt!42688 lt!42706)))

(assert (=> d!8488 (isPrefixOf!0 lt!42691 lt!42691)))

(assert (=> d!8488 (= lt!42706 (lemmaIsPrefixRefl!0 lt!42691))))

(declare-fun lt!42693 () Unit!2283)

(declare-fun lt!42702 () Unit!2283)

(assert (=> d!8488 (= lt!42693 lt!42702)))

(assert (=> d!8488 (isPrefixOf!0 (_2!1654 lt!42082) (_2!1654 lt!42082))))

(assert (=> d!8488 (= lt!42702 (lemmaIsPrefixRefl!0 (_2!1654 lt!42082)))))

(assert (=> d!8488 (= lt!42691 (BitStream!1361 (buf!1097 (_2!1654 lt!42094)) (currentByte!2434 (_2!1654 lt!42082)) (currentBit!2429 (_2!1654 lt!42082))))))

(assert (=> d!8488 (isPrefixOf!0 (_2!1654 lt!42082) (_2!1654 lt!42094))))

(assert (=> d!8488 (= (reader!0 (_2!1654 lt!42082) (_2!1654 lt!42094)) lt!42699)))

(declare-fun b!29775 () Bool)

(declare-fun res!25652 () Bool)

(assert (=> b!29775 (=> (not res!25652) (not e!19904))))

(assert (=> b!29775 (= res!25652 (isPrefixOf!0 (_1!1655 lt!42699) (_2!1654 lt!42082)))))

(declare-fun b!29776 () Bool)

(declare-fun Unit!2310 () Unit!2283)

(assert (=> b!29776 (= e!19905 Unit!2310)))

(declare-fun lt!42696 () (_ BitVec 64))

(declare-fun b!29777 () Bool)

(declare-fun lt!42704 () (_ BitVec 64))

(assert (=> b!29777 (= e!19904 (= (_1!1655 lt!42699) (withMovedBitIndex!0 (_2!1655 lt!42699) (bvsub lt!42704 lt!42696))))))

(assert (=> b!29777 (or (= (bvand lt!42704 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!42696 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!42704 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!42704 lt!42696) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!29777 (= lt!42696 (bitIndex!0 (size!769 (buf!1097 (_2!1654 lt!42094))) (currentByte!2434 (_2!1654 lt!42094)) (currentBit!2429 (_2!1654 lt!42094))))))

(assert (=> b!29777 (= lt!42704 (bitIndex!0 (size!769 (buf!1097 (_2!1654 lt!42082))) (currentByte!2434 (_2!1654 lt!42082)) (currentBit!2429 (_2!1654 lt!42082))))))

(declare-fun b!29778 () Bool)

(declare-fun res!25653 () Bool)

(assert (=> b!29778 (=> (not res!25653) (not e!19904))))

(assert (=> b!29778 (= res!25653 (isPrefixOf!0 (_2!1655 lt!42699) (_2!1654 lt!42094)))))

(assert (= (and d!8488 c!1948) b!29774))

(assert (= (and d!8488 (not c!1948)) b!29776))

(assert (= (and d!8488 res!25651) b!29775))

(assert (= (and b!29775 res!25652) b!29778))

(assert (= (and b!29778 res!25653) b!29777))

(declare-fun m!43133 () Bool)

(assert (=> d!8488 m!43133))

(declare-fun m!43135 () Bool)

(assert (=> d!8488 m!43135))

(assert (=> d!8488 m!43105))

(declare-fun m!43137 () Bool)

(assert (=> d!8488 m!43137))

(declare-fun m!43139 () Bool)

(assert (=> d!8488 m!43139))

(declare-fun m!43141 () Bool)

(assert (=> d!8488 m!43141))

(declare-fun m!43143 () Bool)

(assert (=> d!8488 m!43143))

(declare-fun m!43145 () Bool)

(assert (=> d!8488 m!43145))

(assert (=> d!8488 m!43115))

(assert (=> d!8488 m!42551))

(declare-fun m!43147 () Bool)

(assert (=> d!8488 m!43147))

(declare-fun m!43149 () Bool)

(assert (=> b!29775 m!43149))

(assert (=> b!29774 m!42545))

(declare-fun m!43151 () Bool)

(assert (=> b!29774 m!43151))

(declare-fun m!43153 () Bool)

(assert (=> b!29774 m!43153))

(declare-fun m!43155 () Bool)

(assert (=> b!29777 m!43155))

(assert (=> b!29777 m!42583))

(assert (=> b!29777 m!42545))

(declare-fun m!43157 () Bool)

(assert (=> b!29778 m!43157))

(assert (=> b!29394 d!8488))

(declare-fun b!29875 () Bool)

(declare-fun e!19949 () Bool)

(declare-fun lt!43170 () (_ BitVec 64))

(assert (=> b!29875 (= e!19949 (validate_offset_bits!1 ((_ sign_extend 32) (size!769 (buf!1097 (_2!1654 lt!42082)))) ((_ sign_extend 32) (currentByte!2434 (_2!1654 lt!42082))) ((_ sign_extend 32) (currentBit!2429 (_2!1654 lt!42082))) lt!43170))))

(declare-fun b!29876 () Bool)

(declare-fun res!25735 () Bool)

(declare-fun e!19951 () Bool)

(assert (=> b!29876 (=> (not res!25735) (not e!19951))))

(declare-fun lt!43153 () tuple2!3134)

(assert (=> b!29876 (= res!25735 (= (size!769 (buf!1097 (_2!1654 lt!43153))) (size!769 (buf!1097 (_2!1654 lt!42082)))))))

(declare-fun b!29877 () Bool)

(declare-fun res!25731 () Bool)

(assert (=> b!29877 (=> (not res!25731) (not e!19951))))

(assert (=> b!29877 (= res!25731 (= (size!769 (buf!1097 (_2!1654 lt!42082))) (size!769 (buf!1097 (_2!1654 lt!43153)))))))

(declare-fun lt!43147 () tuple2!3134)

(declare-fun call!382 () tuple2!3136)

(declare-fun bm!379 () Bool)

(declare-fun c!1959 () Bool)

(declare-fun lt!43161 () tuple2!3134)

(assert (=> bm!379 (= call!382 (reader!0 (ite c!1959 (_2!1654 lt!43147) (_2!1654 lt!42082)) (ite c!1959 (_2!1654 lt!43161) (_2!1654 lt!42082))))))

(declare-fun b!29878 () Bool)

(declare-fun e!19950 () tuple2!3134)

(declare-fun Unit!2311 () Unit!2283)

(assert (=> b!29878 (= e!19950 (tuple2!3135 Unit!2311 (_2!1654 lt!42082)))))

(assert (=> b!29878 (= (size!769 (buf!1097 (_2!1654 lt!42082))) (size!769 (buf!1097 (_2!1654 lt!42082))))))

(declare-fun lt!43142 () Unit!2283)

(declare-fun Unit!2312 () Unit!2283)

(assert (=> b!29878 (= lt!43142 Unit!2312)))

(declare-fun checkByteArrayBitContent!0 (BitStream!1360 array!1769 array!1769 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!29878 (checkByteArrayBitContent!0 (_2!1654 lt!42082) srcBuffer!2 (_1!1669 (readBits!0 (_1!1655 call!382) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!29879 () Bool)

(declare-fun res!25730 () Bool)

(assert (=> b!29879 (=> (not res!25730) (not e!19951))))

(assert (=> b!29879 (= res!25730 (invariant!0 (currentBit!2429 (_2!1654 lt!43153)) (currentByte!2434 (_2!1654 lt!43153)) (size!769 (buf!1097 (_2!1654 lt!43153)))))))

(declare-fun lt!43159 () tuple2!3136)

(declare-fun b!29880 () Bool)

(assert (=> b!29880 (= e!19951 (= (bitStreamReadBitsIntoList!0 (_2!1654 lt!43153) (_1!1655 lt!43159) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!1654 lt!43153) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!29880 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!29880 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!43156 () Unit!2283)

(declare-fun lt!43167 () Unit!2283)

(assert (=> b!29880 (= lt!43156 lt!43167)))

(assert (=> b!29880 (validate_offset_bits!1 ((_ sign_extend 32) (size!769 (buf!1097 (_2!1654 lt!43153)))) ((_ sign_extend 32) (currentByte!2434 (_2!1654 lt!42082))) ((_ sign_extend 32) (currentBit!2429 (_2!1654 lt!42082))) lt!43170)))

(assert (=> b!29880 (= lt!43167 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1654 lt!42082) (buf!1097 (_2!1654 lt!43153)) lt!43170))))

(assert (=> b!29880 e!19949))

(declare-fun res!25733 () Bool)

(assert (=> b!29880 (=> (not res!25733) (not e!19949))))

(assert (=> b!29880 (= res!25733 (and (= (size!769 (buf!1097 (_2!1654 lt!42082))) (size!769 (buf!1097 (_2!1654 lt!43153)))) (bvsge lt!43170 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!29880 (= lt!43170 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!29880 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!29880 (= lt!43159 (reader!0 (_2!1654 lt!42082) (_2!1654 lt!43153)))))

(declare-fun d!8490 () Bool)

(assert (=> d!8490 e!19951))

(declare-fun res!25734 () Bool)

(assert (=> d!8490 (=> (not res!25734) (not e!19951))))

(declare-fun lt!43139 () (_ BitVec 64))

(assert (=> d!8490 (= res!25734 (= (bitIndex!0 (size!769 (buf!1097 (_2!1654 lt!43153))) (currentByte!2434 (_2!1654 lt!43153)) (currentBit!2429 (_2!1654 lt!43153))) (bvsub lt!43139 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!8490 (or (= (bvand lt!43139 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!43139 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!43139 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!43137 () (_ BitVec 64))

(assert (=> d!8490 (= lt!43139 (bvadd lt!43137 to!314))))

(assert (=> d!8490 (or (not (= (bvand lt!43137 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!43137 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!43137 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!8490 (= lt!43137 (bitIndex!0 (size!769 (buf!1097 (_2!1654 lt!42082))) (currentByte!2434 (_2!1654 lt!42082)) (currentBit!2429 (_2!1654 lt!42082))))))

(assert (=> d!8490 (= lt!43153 e!19950)))

(assert (=> d!8490 (= c!1959 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!43144 () Unit!2283)

(declare-fun lt!43169 () Unit!2283)

(assert (=> d!8490 (= lt!43144 lt!43169)))

(assert (=> d!8490 (isPrefixOf!0 (_2!1654 lt!42082) (_2!1654 lt!42082))))

(assert (=> d!8490 (= lt!43169 (lemmaIsPrefixRefl!0 (_2!1654 lt!42082)))))

(declare-fun lt!43135 () (_ BitVec 64))

(assert (=> d!8490 (= lt!43135 (bitIndex!0 (size!769 (buf!1097 (_2!1654 lt!42082))) (currentByte!2434 (_2!1654 lt!42082)) (currentBit!2429 (_2!1654 lt!42082))))))

(assert (=> d!8490 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!8490 (= (appendBitsMSBFirstLoop!0 (_2!1654 lt!42082) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!43153)))

(declare-fun b!29881 () Bool)

(declare-fun res!25732 () Bool)

(assert (=> b!29881 (=> (not res!25732) (not e!19951))))

(assert (=> b!29881 (= res!25732 (isPrefixOf!0 (_2!1654 lt!42082) (_2!1654 lt!43153)))))

(declare-fun b!29882 () Bool)

(declare-fun Unit!2313 () Unit!2283)

(assert (=> b!29882 (= e!19950 (tuple2!3135 Unit!2313 (_2!1654 lt!43161)))))

(assert (=> b!29882 (= lt!43147 (appendBitFromByte!0 (_2!1654 lt!42082) (select (arr!1232 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!43148 () (_ BitVec 64))

(assert (=> b!29882 (= lt!43148 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!43162 () (_ BitVec 64))

(assert (=> b!29882 (= lt!43162 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!43132 () Unit!2283)

(assert (=> b!29882 (= lt!43132 (validateOffsetBitsIneqLemma!0 (_2!1654 lt!42082) (_2!1654 lt!43147) lt!43148 lt!43162))))

(assert (=> b!29882 (validate_offset_bits!1 ((_ sign_extend 32) (size!769 (buf!1097 (_2!1654 lt!43147)))) ((_ sign_extend 32) (currentByte!2434 (_2!1654 lt!43147))) ((_ sign_extend 32) (currentBit!2429 (_2!1654 lt!43147))) (bvsub lt!43148 lt!43162))))

(declare-fun lt!43166 () Unit!2283)

(assert (=> b!29882 (= lt!43166 lt!43132)))

(declare-fun lt!43149 () tuple2!3136)

(assert (=> b!29882 (= lt!43149 (reader!0 (_2!1654 lt!42082) (_2!1654 lt!43147)))))

(declare-fun lt!43154 () (_ BitVec 64))

(assert (=> b!29882 (= lt!43154 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!43141 () Unit!2283)

(assert (=> b!29882 (= lt!43141 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1654 lt!42082) (buf!1097 (_2!1654 lt!43147)) lt!43154))))

(assert (=> b!29882 (validate_offset_bits!1 ((_ sign_extend 32) (size!769 (buf!1097 (_2!1654 lt!43147)))) ((_ sign_extend 32) (currentByte!2434 (_2!1654 lt!42082))) ((_ sign_extend 32) (currentBit!2429 (_2!1654 lt!42082))) lt!43154)))

(declare-fun lt!43145 () Unit!2283)

(assert (=> b!29882 (= lt!43145 lt!43141)))

(assert (=> b!29882 (= (head!218 (byteArrayBitContentToList!0 (_2!1654 lt!43147) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!218 (bitStreamReadBitsIntoList!0 (_2!1654 lt!43147) (_1!1655 lt!43149) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!43136 () Unit!2283)

(declare-fun Unit!2314 () Unit!2283)

(assert (=> b!29882 (= lt!43136 Unit!2314)))

(assert (=> b!29882 (= lt!43161 (appendBitsMSBFirstLoop!0 (_2!1654 lt!43147) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!43150 () Unit!2283)

(assert (=> b!29882 (= lt!43150 (lemmaIsPrefixTransitive!0 (_2!1654 lt!42082) (_2!1654 lt!43147) (_2!1654 lt!43161)))))

(assert (=> b!29882 (isPrefixOf!0 (_2!1654 lt!42082) (_2!1654 lt!43161))))

(declare-fun lt!43138 () Unit!2283)

(assert (=> b!29882 (= lt!43138 lt!43150)))

(assert (=> b!29882 (= (size!769 (buf!1097 (_2!1654 lt!43161))) (size!769 (buf!1097 (_2!1654 lt!42082))))))

(declare-fun lt!43151 () Unit!2283)

(declare-fun Unit!2315 () Unit!2283)

(assert (=> b!29882 (= lt!43151 Unit!2315)))

(assert (=> b!29882 (= (bitIndex!0 (size!769 (buf!1097 (_2!1654 lt!43161))) (currentByte!2434 (_2!1654 lt!43161)) (currentBit!2429 (_2!1654 lt!43161))) (bvsub (bvadd (bitIndex!0 (size!769 (buf!1097 (_2!1654 lt!42082))) (currentByte!2434 (_2!1654 lt!42082)) (currentBit!2429 (_2!1654 lt!42082))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!43143 () Unit!2283)

(declare-fun Unit!2316 () Unit!2283)

(assert (=> b!29882 (= lt!43143 Unit!2316)))

(assert (=> b!29882 (= (bitIndex!0 (size!769 (buf!1097 (_2!1654 lt!43161))) (currentByte!2434 (_2!1654 lt!43161)) (currentBit!2429 (_2!1654 lt!43161))) (bvsub (bvsub (bvadd (bitIndex!0 (size!769 (buf!1097 (_2!1654 lt!43147))) (currentByte!2434 (_2!1654 lt!43147)) (currentBit!2429 (_2!1654 lt!43147))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!43168 () Unit!2283)

(declare-fun Unit!2317 () Unit!2283)

(assert (=> b!29882 (= lt!43168 Unit!2317)))

(declare-fun lt!43129 () tuple2!3136)

(assert (=> b!29882 (= lt!43129 (reader!0 (_2!1654 lt!42082) (_2!1654 lt!43161)))))

(declare-fun lt!43130 () (_ BitVec 64))

(assert (=> b!29882 (= lt!43130 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!43134 () Unit!2283)

(assert (=> b!29882 (= lt!43134 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1654 lt!42082) (buf!1097 (_2!1654 lt!43161)) lt!43130))))

(assert (=> b!29882 (validate_offset_bits!1 ((_ sign_extend 32) (size!769 (buf!1097 (_2!1654 lt!43161)))) ((_ sign_extend 32) (currentByte!2434 (_2!1654 lt!42082))) ((_ sign_extend 32) (currentBit!2429 (_2!1654 lt!42082))) lt!43130)))

(declare-fun lt!43131 () Unit!2283)

(assert (=> b!29882 (= lt!43131 lt!43134)))

(declare-fun lt!43164 () tuple2!3136)

(assert (=> b!29882 (= lt!43164 call!382)))

(declare-fun lt!43171 () (_ BitVec 64))

(assert (=> b!29882 (= lt!43171 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!43158 () Unit!2283)

(assert (=> b!29882 (= lt!43158 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1654 lt!43147) (buf!1097 (_2!1654 lt!43161)) lt!43171))))

(assert (=> b!29882 (validate_offset_bits!1 ((_ sign_extend 32) (size!769 (buf!1097 (_2!1654 lt!43161)))) ((_ sign_extend 32) (currentByte!2434 (_2!1654 lt!43147))) ((_ sign_extend 32) (currentBit!2429 (_2!1654 lt!43147))) lt!43171)))

(declare-fun lt!43155 () Unit!2283)

(assert (=> b!29882 (= lt!43155 lt!43158)))

(declare-fun lt!43146 () List!381)

(assert (=> b!29882 (= lt!43146 (byteArrayBitContentToList!0 (_2!1654 lt!43161) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!43128 () List!381)

(assert (=> b!29882 (= lt!43128 (byteArrayBitContentToList!0 (_2!1654 lt!43161) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!43140 () List!381)

(assert (=> b!29882 (= lt!43140 (bitStreamReadBitsIntoList!0 (_2!1654 lt!43161) (_1!1655 lt!43129) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!43160 () List!381)

(assert (=> b!29882 (= lt!43160 (bitStreamReadBitsIntoList!0 (_2!1654 lt!43161) (_1!1655 lt!43164) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!43165 () (_ BitVec 64))

(assert (=> b!29882 (= lt!43165 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!43163 () Unit!2283)

(assert (=> b!29882 (= lt!43163 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1654 lt!43161) (_2!1654 lt!43161) (_1!1655 lt!43129) (_1!1655 lt!43164) lt!43165 lt!43140))))

(assert (=> b!29882 (= (bitStreamReadBitsIntoList!0 (_2!1654 lt!43161) (_1!1655 lt!43164) (bvsub lt!43165 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!98 lt!43140))))

(declare-fun lt!43157 () Unit!2283)

(assert (=> b!29882 (= lt!43157 lt!43163)))

(declare-fun lt!43152 () Unit!2283)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1769 array!1769 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2283)

(assert (=> b!29882 (= lt!43152 (arrayBitRangesEqImpliesEq!0 (buf!1097 (_2!1654 lt!43147)) (buf!1097 (_2!1654 lt!43161)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!43135 (bitIndex!0 (size!769 (buf!1097 (_2!1654 lt!43147))) (currentByte!2434 (_2!1654 lt!43147)) (currentBit!2429 (_2!1654 lt!43147)))))))

(declare-fun bitAt!0 (array!1769 (_ BitVec 64)) Bool)

(assert (=> b!29882 (= (bitAt!0 (buf!1097 (_2!1654 lt!43147)) lt!43135) (bitAt!0 (buf!1097 (_2!1654 lt!43161)) lt!43135))))

(declare-fun lt!43133 () Unit!2283)

(assert (=> b!29882 (= lt!43133 lt!43152)))

(assert (= (and d!8490 c!1959) b!29882))

(assert (= (and d!8490 (not c!1959)) b!29878))

(assert (= (or b!29882 b!29878) bm!379))

(assert (= (and d!8490 res!25734) b!29879))

(assert (= (and b!29879 res!25730) b!29877))

(assert (= (and b!29877 res!25731) b!29881))

(assert (= (and b!29881 res!25732) b!29876))

(assert (= (and b!29876 res!25735) b!29880))

(assert (= (and b!29880 res!25733) b!29875))

(declare-fun m!43409 () Bool)

(assert (=> bm!379 m!43409))

(declare-fun m!43411 () Bool)

(assert (=> b!29878 m!43411))

(declare-fun m!43413 () Bool)

(assert (=> b!29878 m!43413))

(declare-fun m!43415 () Bool)

(assert (=> b!29880 m!43415))

(declare-fun m!43417 () Bool)

(assert (=> b!29880 m!43417))

(declare-fun m!43419 () Bool)

(assert (=> b!29880 m!43419))

(declare-fun m!43421 () Bool)

(assert (=> b!29880 m!43421))

(declare-fun m!43423 () Bool)

(assert (=> b!29880 m!43423))

(declare-fun m!43425 () Bool)

(assert (=> b!29882 m!43425))

(declare-fun m!43427 () Bool)

(assert (=> b!29882 m!43427))

(declare-fun m!43429 () Bool)

(assert (=> b!29882 m!43429))

(declare-fun m!43431 () Bool)

(assert (=> b!29882 m!43431))

(declare-fun m!43433 () Bool)

(assert (=> b!29882 m!43433))

(declare-fun m!43435 () Bool)

(assert (=> b!29882 m!43435))

(declare-fun m!43437 () Bool)

(assert (=> b!29882 m!43437))

(declare-fun m!43439 () Bool)

(assert (=> b!29882 m!43439))

(assert (=> b!29882 m!42545))

(declare-fun m!43441 () Bool)

(assert (=> b!29882 m!43441))

(assert (=> b!29882 m!43435))

(declare-fun m!43443 () Bool)

(assert (=> b!29882 m!43443))

(declare-fun m!43445 () Bool)

(assert (=> b!29882 m!43445))

(declare-fun m!43447 () Bool)

(assert (=> b!29882 m!43447))

(declare-fun m!43449 () Bool)

(assert (=> b!29882 m!43449))

(declare-fun m!43451 () Bool)

(assert (=> b!29882 m!43451))

(declare-fun m!43453 () Bool)

(assert (=> b!29882 m!43453))

(assert (=> b!29882 m!43445))

(declare-fun m!43455 () Bool)

(assert (=> b!29882 m!43455))

(declare-fun m!43457 () Bool)

(assert (=> b!29882 m!43457))

(assert (=> b!29882 m!43451))

(declare-fun m!43459 () Bool)

(assert (=> b!29882 m!43459))

(declare-fun m!43461 () Bool)

(assert (=> b!29882 m!43461))

(declare-fun m!43463 () Bool)

(assert (=> b!29882 m!43463))

(declare-fun m!43465 () Bool)

(assert (=> b!29882 m!43465))

(declare-fun m!43467 () Bool)

(assert (=> b!29882 m!43467))

(declare-fun m!43469 () Bool)

(assert (=> b!29882 m!43469))

(assert (=> b!29882 m!43463))

(declare-fun m!43471 () Bool)

(assert (=> b!29882 m!43471))

(declare-fun m!43473 () Bool)

(assert (=> b!29882 m!43473))

(declare-fun m!43475 () Bool)

(assert (=> b!29882 m!43475))

(declare-fun m!43477 () Bool)

(assert (=> b!29882 m!43477))

(declare-fun m!43479 () Bool)

(assert (=> b!29882 m!43479))

(declare-fun m!43481 () Bool)

(assert (=> b!29882 m!43481))

(declare-fun m!43483 () Bool)

(assert (=> b!29882 m!43483))

(declare-fun m!43485 () Bool)

(assert (=> b!29882 m!43485))

(declare-fun m!43487 () Bool)

(assert (=> b!29875 m!43487))

(declare-fun m!43489 () Bool)

(assert (=> d!8490 m!43489))

(assert (=> d!8490 m!42545))

(assert (=> d!8490 m!43133))

(assert (=> d!8490 m!43137))

(declare-fun m!43491 () Bool)

(assert (=> b!29881 m!43491))

(declare-fun m!43493 () Bool)

(assert (=> b!29879 m!43493))

(assert (=> b!29404 d!8490))

(declare-fun b!29883 () Bool)

(declare-fun e!19953 () Unit!2283)

(declare-fun lt!43180 () Unit!2283)

(assert (=> b!29883 (= e!19953 lt!43180)))

(declare-fun lt!43183 () (_ BitVec 64))

(assert (=> b!29883 (= lt!43183 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!43190 () (_ BitVec 64))

(assert (=> b!29883 (= lt!43190 (bitIndex!0 (size!769 (buf!1097 thiss!1379)) (currentByte!2434 thiss!1379) (currentBit!2429 thiss!1379)))))

(assert (=> b!29883 (= lt!43180 (arrayBitRangesEqSymmetric!0 (buf!1097 thiss!1379) (buf!1097 (_2!1654 lt!42082)) lt!43183 lt!43190))))

(assert (=> b!29883 (arrayBitRangesEq!0 (buf!1097 (_2!1654 lt!42082)) (buf!1097 thiss!1379) lt!43183 lt!43190)))

(declare-fun d!8538 () Bool)

(declare-fun e!19952 () Bool)

(assert (=> d!8538 e!19952))

(declare-fun res!25736 () Bool)

(assert (=> d!8538 (=> (not res!25736) (not e!19952))))

(declare-fun lt!43184 () tuple2!3136)

(assert (=> d!8538 (= res!25736 (isPrefixOf!0 (_1!1655 lt!43184) (_2!1655 lt!43184)))))

(declare-fun lt!43176 () BitStream!1360)

(assert (=> d!8538 (= lt!43184 (tuple2!3137 lt!43176 (_2!1654 lt!42082)))))

(declare-fun lt!43172 () Unit!2283)

(declare-fun lt!43177 () Unit!2283)

(assert (=> d!8538 (= lt!43172 lt!43177)))

(assert (=> d!8538 (isPrefixOf!0 lt!43176 (_2!1654 lt!42082))))

(assert (=> d!8538 (= lt!43177 (lemmaIsPrefixTransitive!0 lt!43176 (_2!1654 lt!42082) (_2!1654 lt!42082)))))

(declare-fun lt!43175 () Unit!2283)

(declare-fun lt!43182 () Unit!2283)

(assert (=> d!8538 (= lt!43175 lt!43182)))

(assert (=> d!8538 (isPrefixOf!0 lt!43176 (_2!1654 lt!42082))))

(assert (=> d!8538 (= lt!43182 (lemmaIsPrefixTransitive!0 lt!43176 thiss!1379 (_2!1654 lt!42082)))))

(declare-fun lt!43174 () Unit!2283)

(assert (=> d!8538 (= lt!43174 e!19953)))

(declare-fun c!1960 () Bool)

(assert (=> d!8538 (= c!1960 (not (= (size!769 (buf!1097 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!43185 () Unit!2283)

(declare-fun lt!43179 () Unit!2283)

(assert (=> d!8538 (= lt!43185 lt!43179)))

(assert (=> d!8538 (isPrefixOf!0 (_2!1654 lt!42082) (_2!1654 lt!42082))))

(assert (=> d!8538 (= lt!43179 (lemmaIsPrefixRefl!0 (_2!1654 lt!42082)))))

(declare-fun lt!43186 () Unit!2283)

(declare-fun lt!43188 () Unit!2283)

(assert (=> d!8538 (= lt!43186 lt!43188)))

(assert (=> d!8538 (= lt!43188 (lemmaIsPrefixRefl!0 (_2!1654 lt!42082)))))

(declare-fun lt!43173 () Unit!2283)

(declare-fun lt!43191 () Unit!2283)

(assert (=> d!8538 (= lt!43173 lt!43191)))

(assert (=> d!8538 (isPrefixOf!0 lt!43176 lt!43176)))

(assert (=> d!8538 (= lt!43191 (lemmaIsPrefixRefl!0 lt!43176))))

(declare-fun lt!43178 () Unit!2283)

(declare-fun lt!43187 () Unit!2283)

(assert (=> d!8538 (= lt!43178 lt!43187)))

(assert (=> d!8538 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!8538 (= lt!43187 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!8538 (= lt!43176 (BitStream!1361 (buf!1097 (_2!1654 lt!42082)) (currentByte!2434 thiss!1379) (currentBit!2429 thiss!1379)))))

(assert (=> d!8538 (isPrefixOf!0 thiss!1379 (_2!1654 lt!42082))))

(assert (=> d!8538 (= (reader!0 thiss!1379 (_2!1654 lt!42082)) lt!43184)))

(declare-fun b!29884 () Bool)

(declare-fun res!25737 () Bool)

(assert (=> b!29884 (=> (not res!25737) (not e!19952))))

(assert (=> b!29884 (= res!25737 (isPrefixOf!0 (_1!1655 lt!43184) thiss!1379))))

(declare-fun b!29885 () Bool)

(declare-fun Unit!2318 () Unit!2283)

(assert (=> b!29885 (= e!19953 Unit!2318)))

(declare-fun lt!43181 () (_ BitVec 64))

(declare-fun b!29886 () Bool)

(declare-fun lt!43189 () (_ BitVec 64))

(assert (=> b!29886 (= e!19952 (= (_1!1655 lt!43184) (withMovedBitIndex!0 (_2!1655 lt!43184) (bvsub lt!43189 lt!43181))))))

(assert (=> b!29886 (or (= (bvand lt!43189 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!43181 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!43189 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!43189 lt!43181) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!29886 (= lt!43181 (bitIndex!0 (size!769 (buf!1097 (_2!1654 lt!42082))) (currentByte!2434 (_2!1654 lt!42082)) (currentBit!2429 (_2!1654 lt!42082))))))

(assert (=> b!29886 (= lt!43189 (bitIndex!0 (size!769 (buf!1097 thiss!1379)) (currentByte!2434 thiss!1379) (currentBit!2429 thiss!1379)))))

(declare-fun b!29887 () Bool)

(declare-fun res!25738 () Bool)

(assert (=> b!29887 (=> (not res!25738) (not e!19952))))

(assert (=> b!29887 (= res!25738 (isPrefixOf!0 (_2!1655 lt!43184) (_2!1654 lt!42082)))))

(assert (= (and d!8538 c!1960) b!29883))

(assert (= (and d!8538 (not c!1960)) b!29885))

(assert (= (and d!8538 res!25736) b!29884))

(assert (= (and b!29884 res!25737) b!29887))

(assert (= (and b!29887 res!25738) b!29886))

(assert (=> d!8538 m!42539))

(declare-fun m!43495 () Bool)

(assert (=> d!8538 m!43495))

(assert (=> d!8538 m!43133))

(assert (=> d!8538 m!42541))

(declare-fun m!43497 () Bool)

(assert (=> d!8538 m!43497))

(declare-fun m!43499 () Bool)

(assert (=> d!8538 m!43499))

(declare-fun m!43501 () Bool)

(assert (=> d!8538 m!43501))

(declare-fun m!43503 () Bool)

(assert (=> d!8538 m!43503))

(assert (=> d!8538 m!43137))

(assert (=> d!8538 m!42611))

(declare-fun m!43505 () Bool)

(assert (=> d!8538 m!43505))

(declare-fun m!43507 () Bool)

(assert (=> b!29884 m!43507))

(assert (=> b!29883 m!42543))

(declare-fun m!43509 () Bool)

(assert (=> b!29883 m!43509))

(declare-fun m!43511 () Bool)

(assert (=> b!29883 m!43511))

(declare-fun m!43513 () Bool)

(assert (=> b!29886 m!43513))

(assert (=> b!29886 m!42545))

(assert (=> b!29886 m!42543))

(declare-fun m!43515 () Bool)

(assert (=> b!29887 m!43515))

(assert (=> b!29404 d!8538))

(declare-fun d!8540 () Bool)

(declare-fun res!25740 () Bool)

(declare-fun e!19954 () Bool)

(assert (=> d!8540 (=> (not res!25740) (not e!19954))))

(assert (=> d!8540 (= res!25740 (= (size!769 (buf!1097 thiss!1379)) (size!769 (buf!1097 (_2!1654 lt!42094)))))))

(assert (=> d!8540 (= (isPrefixOf!0 thiss!1379 (_2!1654 lt!42094)) e!19954)))

(declare-fun b!29888 () Bool)

(declare-fun res!25741 () Bool)

(assert (=> b!29888 (=> (not res!25741) (not e!19954))))

(assert (=> b!29888 (= res!25741 (bvsle (bitIndex!0 (size!769 (buf!1097 thiss!1379)) (currentByte!2434 thiss!1379) (currentBit!2429 thiss!1379)) (bitIndex!0 (size!769 (buf!1097 (_2!1654 lt!42094))) (currentByte!2434 (_2!1654 lt!42094)) (currentBit!2429 (_2!1654 lt!42094)))))))

(declare-fun b!29889 () Bool)

(declare-fun e!19955 () Bool)

(assert (=> b!29889 (= e!19954 e!19955)))

(declare-fun res!25739 () Bool)

(assert (=> b!29889 (=> res!25739 e!19955)))

(assert (=> b!29889 (= res!25739 (= (size!769 (buf!1097 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!29890 () Bool)

(assert (=> b!29890 (= e!19955 (arrayBitRangesEq!0 (buf!1097 thiss!1379) (buf!1097 (_2!1654 lt!42094)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!769 (buf!1097 thiss!1379)) (currentByte!2434 thiss!1379) (currentBit!2429 thiss!1379))))))

(assert (= (and d!8540 res!25740) b!29888))

(assert (= (and b!29888 res!25741) b!29889))

(assert (= (and b!29889 (not res!25739)) b!29890))

(assert (=> b!29888 m!42543))

(assert (=> b!29888 m!42583))

(assert (=> b!29890 m!42543))

(assert (=> b!29890 m!42543))

(declare-fun m!43517 () Bool)

(assert (=> b!29890 m!43517))

(assert (=> b!29404 d!8540))

(declare-fun d!8542 () Bool)

(declare-fun res!25743 () Bool)

(declare-fun e!19956 () Bool)

(assert (=> d!8542 (=> (not res!25743) (not e!19956))))

(assert (=> d!8542 (= res!25743 (= (size!769 (buf!1097 (_2!1654 lt!42082))) (size!769 (buf!1097 (_2!1654 lt!42094)))))))

(assert (=> d!8542 (= (isPrefixOf!0 (_2!1654 lt!42082) (_2!1654 lt!42094)) e!19956)))

(declare-fun b!29891 () Bool)

(declare-fun res!25744 () Bool)

(assert (=> b!29891 (=> (not res!25744) (not e!19956))))

(assert (=> b!29891 (= res!25744 (bvsle (bitIndex!0 (size!769 (buf!1097 (_2!1654 lt!42082))) (currentByte!2434 (_2!1654 lt!42082)) (currentBit!2429 (_2!1654 lt!42082))) (bitIndex!0 (size!769 (buf!1097 (_2!1654 lt!42094))) (currentByte!2434 (_2!1654 lt!42094)) (currentBit!2429 (_2!1654 lt!42094)))))))

(declare-fun b!29892 () Bool)

(declare-fun e!19957 () Bool)

(assert (=> b!29892 (= e!19956 e!19957)))

(declare-fun res!25742 () Bool)

(assert (=> b!29892 (=> res!25742 e!19957)))

(assert (=> b!29892 (= res!25742 (= (size!769 (buf!1097 (_2!1654 lt!42082))) #b00000000000000000000000000000000))))

(declare-fun b!29893 () Bool)

(assert (=> b!29893 (= e!19957 (arrayBitRangesEq!0 (buf!1097 (_2!1654 lt!42082)) (buf!1097 (_2!1654 lt!42094)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!769 (buf!1097 (_2!1654 lt!42082))) (currentByte!2434 (_2!1654 lt!42082)) (currentBit!2429 (_2!1654 lt!42082)))))))

(assert (= (and d!8542 res!25743) b!29891))

(assert (= (and b!29891 res!25744) b!29892))

(assert (= (and b!29892 (not res!25742)) b!29893))

(assert (=> b!29891 m!42545))

(assert (=> b!29891 m!42583))

(assert (=> b!29893 m!42545))

(assert (=> b!29893 m!42545))

(declare-fun m!43519 () Bool)

(assert (=> b!29893 m!43519))

(assert (=> b!29404 d!8542))

(declare-fun d!8544 () Bool)

(assert (=> d!8544 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!769 (buf!1097 (_2!1654 lt!42082)))) ((_ sign_extend 32) (currentByte!2434 thiss!1379)) ((_ sign_extend 32) (currentBit!2429 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!769 (buf!1097 (_2!1654 lt!42082)))) ((_ sign_extend 32) (currentByte!2434 thiss!1379)) ((_ sign_extend 32) (currentBit!2429 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!2406 () Bool)

(assert (= bs!2406 d!8544))

(declare-fun m!43521 () Bool)

(assert (=> bs!2406 m!43521))

(assert (=> b!29404 d!8544))

(declare-fun d!8546 () Bool)

(assert (=> d!8546 (isPrefixOf!0 thiss!1379 (_2!1654 lt!42094))))

(declare-fun lt!43194 () Unit!2283)

(declare-fun choose!30 (BitStream!1360 BitStream!1360 BitStream!1360) Unit!2283)

(assert (=> d!8546 (= lt!43194 (choose!30 thiss!1379 (_2!1654 lt!42082) (_2!1654 lt!42094)))))

(assert (=> d!8546 (isPrefixOf!0 thiss!1379 (_2!1654 lt!42082))))

(assert (=> d!8546 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1654 lt!42082) (_2!1654 lt!42094)) lt!43194)))

(declare-fun bs!2407 () Bool)

(assert (= bs!2407 d!8546))

(assert (=> bs!2407 m!42563))

(declare-fun m!43523 () Bool)

(assert (=> bs!2407 m!43523))

(assert (=> bs!2407 m!42611))

(assert (=> b!29404 d!8546))

(declare-fun d!8548 () Bool)

(assert (=> d!8548 (validate_offset_bits!1 ((_ sign_extend 32) (size!769 (buf!1097 (_2!1654 lt!42082)))) ((_ sign_extend 32) (currentByte!2434 thiss!1379)) ((_ sign_extend 32) (currentBit!2429 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!43195 () Unit!2283)

(assert (=> d!8548 (= lt!43195 (choose!9 thiss!1379 (buf!1097 (_2!1654 lt!42082)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1361 (buf!1097 (_2!1654 lt!42082)) (currentByte!2434 thiss!1379) (currentBit!2429 thiss!1379))))))

(assert (=> d!8548 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1097 (_2!1654 lt!42082)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!43195)))

(declare-fun bs!2408 () Bool)

(assert (= bs!2408 d!8548))

(assert (=> bs!2408 m!42561))

(declare-fun m!43525 () Bool)

(assert (=> bs!2408 m!43525))

(assert (=> b!29404 d!8548))

(declare-fun d!8550 () Bool)

(assert (=> d!8550 (= (invariant!0 (currentBit!2429 (_2!1654 lt!42082)) (currentByte!2434 (_2!1654 lt!42082)) (size!769 (buf!1097 (_2!1654 lt!42082)))) (and (bvsge (currentBit!2429 (_2!1654 lt!42082)) #b00000000000000000000000000000000) (bvslt (currentBit!2429 (_2!1654 lt!42082)) #b00000000000000000000000000001000) (bvsge (currentByte!2434 (_2!1654 lt!42082)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2434 (_2!1654 lt!42082)) (size!769 (buf!1097 (_2!1654 lt!42082)))) (and (= (currentBit!2429 (_2!1654 lt!42082)) #b00000000000000000000000000000000) (= (currentByte!2434 (_2!1654 lt!42082)) (size!769 (buf!1097 (_2!1654 lt!42082))))))))))

(assert (=> b!29406 d!8550))

(declare-fun d!8552 () Bool)

(assert (=> d!8552 (= (head!218 (byteArrayBitContentToList!0 (_2!1654 lt!42082) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!496 (byteArrayBitContentToList!0 (_2!1654 lt!42082) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!29395 d!8552))

(declare-fun d!8554 () Bool)

(declare-fun c!1963 () Bool)

(assert (=> d!8554 (= c!1963 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!19960 () List!381)

(assert (=> d!8554 (= (byteArrayBitContentToList!0 (_2!1654 lt!42082) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!19960)))

(declare-fun b!29898 () Bool)

(assert (=> b!29898 (= e!19960 Nil!378)))

(declare-fun b!29899 () Bool)

(assert (=> b!29899 (= e!19960 (Cons!377 (not (= (bvand ((_ sign_extend 24) (select (arr!1232 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1654 lt!42082) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!8554 c!1963) b!29898))

(assert (= (and d!8554 (not c!1963)) b!29899))

(assert (=> b!29899 m!42605))

(assert (=> b!29899 m!43021))

(declare-fun m!43527 () Bool)

(assert (=> b!29899 m!43527))

(assert (=> b!29395 d!8554))

(declare-fun d!8556 () Bool)

(assert (=> d!8556 (= (head!218 (bitStreamReadBitsIntoList!0 (_2!1654 lt!42082) (_1!1655 lt!42083) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!496 (bitStreamReadBitsIntoList!0 (_2!1654 lt!42082) (_1!1655 lt!42083) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!29395 d!8556))

(declare-fun d!8558 () Bool)

(declare-fun e!19961 () Bool)

(assert (=> d!8558 e!19961))

(declare-fun c!1964 () Bool)

(assert (=> d!8558 (= c!1964 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!43198 () List!381)

(declare-fun e!19962 () tuple2!3166)

(assert (=> d!8558 (= lt!43198 (_1!1670 e!19962))))

(declare-fun c!1965 () Bool)

(assert (=> d!8558 (= c!1965 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8558 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!8558 (= (bitStreamReadBitsIntoList!0 (_2!1654 lt!42082) (_1!1655 lt!42083) #b0000000000000000000000000000000000000000000000000000000000000001) lt!43198)))

(declare-fun b!29902 () Bool)

(assert (=> b!29902 (= e!19961 (isEmpty!78 lt!43198))))

(declare-fun b!29900 () Bool)

(assert (=> b!29900 (= e!19962 (tuple2!3167 Nil!378 (_1!1655 lt!42083)))))

(declare-fun b!29903 () Bool)

(assert (=> b!29903 (= e!19961 (> (length!107 lt!43198) 0))))

(declare-fun b!29901 () Bool)

(declare-fun lt!43196 () tuple2!3168)

(declare-fun lt!43197 () (_ BitVec 64))

(assert (=> b!29901 (= e!19962 (tuple2!3167 (Cons!377 (_1!1671 lt!43196) (bitStreamReadBitsIntoList!0 (_2!1654 lt!42082) (_2!1671 lt!43196) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!43197))) (_2!1671 lt!43196)))))

(assert (=> b!29901 (= lt!43196 (readBit!0 (_1!1655 lt!42083)))))

(assert (=> b!29901 (= lt!43197 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!8558 c!1965) b!29900))

(assert (= (and d!8558 (not c!1965)) b!29901))

(assert (= (and d!8558 c!1964) b!29902))

(assert (= (and d!8558 (not c!1964)) b!29903))

(declare-fun m!43529 () Bool)

(assert (=> b!29902 m!43529))

(declare-fun m!43531 () Bool)

(assert (=> b!29903 m!43531))

(declare-fun m!43533 () Bool)

(assert (=> b!29901 m!43533))

(declare-fun m!43535 () Bool)

(assert (=> b!29901 m!43535))

(assert (=> b!29395 d!8558))

(declare-fun d!8560 () Bool)

(assert (=> d!8560 (= (array_inv!733 srcBuffer!2) (bvsge (size!769 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!6254 d!8560))

(declare-fun d!8562 () Bool)

(assert (=> d!8562 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2429 thiss!1379) (currentByte!2434 thiss!1379) (size!769 (buf!1097 thiss!1379))))))

(declare-fun bs!2409 () Bool)

(assert (= bs!2409 d!8562))

(assert (=> bs!2409 m!43047))

(assert (=> start!6254 d!8562))

(declare-fun d!8564 () Bool)

(assert (=> d!8564 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!769 (buf!1097 thiss!1379))) ((_ sign_extend 32) (currentByte!2434 thiss!1379)) ((_ sign_extend 32) (currentBit!2429 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!769 (buf!1097 thiss!1379))) ((_ sign_extend 32) (currentByte!2434 thiss!1379)) ((_ sign_extend 32) (currentBit!2429 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2410 () Bool)

(assert (= bs!2410 d!8564))

(assert (=> bs!2410 m!43045))

(assert (=> b!29402 d!8564))

(declare-fun d!8566 () Bool)

(declare-fun e!19963 () Bool)

(assert (=> d!8566 e!19963))

(declare-fun res!25745 () Bool)

(assert (=> d!8566 (=> (not res!25745) (not e!19963))))

(declare-fun lt!43203 () (_ BitVec 64))

(declare-fun lt!43202 () (_ BitVec 64))

(declare-fun lt!43199 () (_ BitVec 64))

(assert (=> d!8566 (= res!25745 (= lt!43199 (bvsub lt!43202 lt!43203)))))

(assert (=> d!8566 (or (= (bvand lt!43202 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!43203 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!43202 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!43202 lt!43203) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!8566 (= lt!43203 (remainingBits!0 ((_ sign_extend 32) (size!769 (buf!1097 (_2!1654 lt!42094)))) ((_ sign_extend 32) (currentByte!2434 (_2!1654 lt!42094))) ((_ sign_extend 32) (currentBit!2429 (_2!1654 lt!42094)))))))

(declare-fun lt!43200 () (_ BitVec 64))

(declare-fun lt!43201 () (_ BitVec 64))

(assert (=> d!8566 (= lt!43202 (bvmul lt!43200 lt!43201))))

(assert (=> d!8566 (or (= lt!43200 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!43201 (bvsdiv (bvmul lt!43200 lt!43201) lt!43200)))))

(assert (=> d!8566 (= lt!43201 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!8566 (= lt!43200 ((_ sign_extend 32) (size!769 (buf!1097 (_2!1654 lt!42094)))))))

(assert (=> d!8566 (= lt!43199 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2434 (_2!1654 lt!42094))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2429 (_2!1654 lt!42094)))))))

(assert (=> d!8566 (invariant!0 (currentBit!2429 (_2!1654 lt!42094)) (currentByte!2434 (_2!1654 lt!42094)) (size!769 (buf!1097 (_2!1654 lt!42094))))))

(assert (=> d!8566 (= (bitIndex!0 (size!769 (buf!1097 (_2!1654 lt!42094))) (currentByte!2434 (_2!1654 lt!42094)) (currentBit!2429 (_2!1654 lt!42094))) lt!43199)))

(declare-fun b!29904 () Bool)

(declare-fun res!25746 () Bool)

(assert (=> b!29904 (=> (not res!25746) (not e!19963))))

(assert (=> b!29904 (= res!25746 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!43199))))

(declare-fun b!29905 () Bool)

(declare-fun lt!43204 () (_ BitVec 64))

(assert (=> b!29905 (= e!19963 (bvsle lt!43199 (bvmul lt!43204 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!29905 (or (= lt!43204 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!43204 #b0000000000000000000000000000000000000000000000000000000000001000) lt!43204)))))

(assert (=> b!29905 (= lt!43204 ((_ sign_extend 32) (size!769 (buf!1097 (_2!1654 lt!42094)))))))

(assert (= (and d!8566 res!25745) b!29904))

(assert (= (and b!29904 res!25746) b!29905))

(declare-fun m!43537 () Bool)

(assert (=> d!8566 m!43537))

(assert (=> d!8566 m!42603))

(assert (=> b!29403 d!8566))

(push 1)

(assert (not b!29888))

(assert (not d!8434))

(assert (not b!29902))

(assert (not d!8490))

(assert (not b!29882))

(assert (not b!29769))

(assert (not b!29700))

(assert (not b!29754))

(assert (not b!29777))

(assert (not d!8454))

(assert (not b!29903))

(assert (not b!29887))

(assert (not d!8548))

(assert (not b!29703))

(assert (not d!8486))

(assert (not b!29775))

(assert (not b!29879))

(assert (not b!29699))

(assert (not d!8484))

(assert (not b!29770))

(assert (not d!8538))

(assert (not b!29890))

(assert (not d!8564))

(assert (not b!29704))

(assert (not d!8482))

(assert (not d!8460))

(assert (not b!29756))

(assert (not b!29886))

(assert (not d!8398))

(assert (not b!29893))

(assert (not d!8566))

(assert (not b!29705))

(assert (not b!29717))

(assert (not d!8432))

(assert (not b!29702))

(assert (not b!29758))

(assert (not d!8458))

(assert (not b!29632))

(assert (not d!8488))

(assert (not d!8414))

(assert (not b!29772))

(assert (not b!29884))

(assert (not d!8546))

(assert (not b!29757))

(assert (not b!29901))

(assert (not b!29875))

(assert (not b!29774))

(assert (not b!29701))

(assert (not b!29883))

(assert (not d!8462))

(assert (not b!29878))

(assert (not d!8478))

(assert (not b!29641))

(assert (not b!29880))

(assert (not b!29899))

(assert (not b!29752))

(assert (not d!8562))

(assert (not b!29778))

(assert (not b!29639))

(assert (not b!29715))

(assert (not b!29773))

(assert (not d!8544))

(assert (not b!29644))

(assert (not b!29891))

(assert (not bm!379))

(assert (not b!29698))

(assert (not b!29753))

(assert (not b!29881))

(assert (not d!8430))

(check-sat)

(pop 1)

(push 1)

(check-sat)

