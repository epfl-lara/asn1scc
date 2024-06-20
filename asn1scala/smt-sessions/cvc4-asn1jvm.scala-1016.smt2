; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28936 () Bool)

(assert start!28936)

(declare-fun b!150379 () Bool)

(declare-fun e!100420 () Bool)

(declare-fun e!100428 () Bool)

(assert (=> b!150379 (= e!100420 (not e!100428))))

(declare-fun res!126048 () Bool)

(assert (=> b!150379 (=> res!126048 e!100428)))

(declare-datatypes ((array!6729 0))(
  ( (array!6730 (arr!3838 (Array (_ BitVec 32) (_ BitVec 8))) (size!3045 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6729)

(declare-datatypes ((BitStream!5348 0))(
  ( (BitStream!5349 (buf!3526 array!6729) (currentByte!6446 (_ BitVec 32)) (currentBit!6441 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!13444 0))(
  ( (tuple2!13445 (_1!7089 BitStream!5348) (_2!7089 BitStream!5348)) )
))
(declare-fun lt!235018 () tuple2!13444)

(declare-datatypes ((tuple2!13446 0))(
  ( (tuple2!13447 (_1!7090 BitStream!5348) (_2!7090 array!6729)) )
))
(declare-fun lt!235012 () tuple2!13446)

(assert (=> b!150379 (= res!126048 (or (not (= (size!3045 (_2!7090 lt!235012)) (size!3045 arr!237))) (not (= (_1!7090 lt!235012) (_2!7089 lt!235018)))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun readByteArrayLoopPure!0 (BitStream!5348 array!6729 (_ BitVec 32) (_ BitVec 32)) tuple2!13446)

(assert (=> b!150379 (= lt!235012 (readByteArrayLoopPure!0 (_1!7089 lt!235018) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((Unit!9490 0))(
  ( (Unit!9491) )
))
(declare-datatypes ((tuple2!13448 0))(
  ( (tuple2!13449 (_1!7091 Unit!9490) (_2!7091 BitStream!5348)) )
))
(declare-fun lt!235026 () tuple2!13448)

(declare-fun lt!235031 () tuple2!13448)

(declare-fun lt!235019 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!150379 (validate_offset_bits!1 ((_ sign_extend 32) (size!3045 (buf!3526 (_2!7091 lt!235026)))) ((_ sign_extend 32) (currentByte!6446 (_2!7091 lt!235031))) ((_ sign_extend 32) (currentBit!6441 (_2!7091 lt!235031))) lt!235019)))

(declare-fun lt!235030 () Unit!9490)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5348 array!6729 (_ BitVec 64)) Unit!9490)

(assert (=> b!150379 (= lt!235030 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!7091 lt!235031) (buf!3526 (_2!7091 lt!235026)) lt!235019))))

(declare-fun reader!0 (BitStream!5348 BitStream!5348) tuple2!13444)

(assert (=> b!150379 (= lt!235018 (reader!0 (_2!7091 lt!235031) (_2!7091 lt!235026)))))

(declare-fun b!150380 () Bool)

(declare-fun e!100423 () Bool)

(declare-fun e!100422 () Bool)

(assert (=> b!150380 (= e!100423 (not e!100422))))

(declare-fun res!126044 () Bool)

(assert (=> b!150380 (=> res!126044 e!100422)))

(declare-fun lt!235032 () tuple2!13446)

(declare-fun lt!235011 () tuple2!13446)

(declare-fun arrayRangesEq!361 (array!6729 array!6729 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!150380 (= res!126044 (not (arrayRangesEq!361 (_2!7090 lt!235011) (_2!7090 lt!235032) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!235038 () tuple2!13446)

(assert (=> b!150380 (arrayRangesEq!361 (_2!7090 lt!235011) (_2!7090 lt!235038) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!235015 () tuple2!13444)

(declare-fun lt!235014 () Unit!9490)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!5348 array!6729 (_ BitVec 32) (_ BitVec 32)) Unit!9490)

(assert (=> b!150380 (= lt!235014 (readByteArrayLoopArrayPrefixLemma!0 (_1!7089 lt!235015) arr!237 from!447 to!404))))

(declare-fun lt!235028 () array!6729)

(declare-fun withMovedByteIndex!0 (BitStream!5348 (_ BitVec 32)) BitStream!5348)

(assert (=> b!150380 (= lt!235038 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!7089 lt!235015) #b00000000000000000000000000000001) lt!235028 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!235022 () tuple2!13444)

(assert (=> b!150380 (= lt!235032 (readByteArrayLoopPure!0 (_1!7089 lt!235022) lt!235028 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((tuple2!13450 0))(
  ( (tuple2!13451 (_1!7092 BitStream!5348) (_2!7092 (_ BitVec 8))) )
))
(declare-fun lt!235033 () tuple2!13450)

(assert (=> b!150380 (= lt!235028 (array!6730 (store (arr!3838 arr!237) from!447 (_2!7092 lt!235033)) (size!3045 arr!237)))))

(declare-fun lt!235021 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!150380 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3045 (buf!3526 (_2!7091 lt!235026)))) ((_ sign_extend 32) (currentByte!6446 (_2!7091 lt!235031))) ((_ sign_extend 32) (currentBit!6441 (_2!7091 lt!235031))) lt!235021)))

(declare-fun lt!235034 () Unit!9490)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5348 array!6729 (_ BitVec 32)) Unit!9490)

(assert (=> b!150380 (= lt!235034 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!7091 lt!235031) (buf!3526 (_2!7091 lt!235026)) lt!235021))))

(assert (=> b!150380 (= (_1!7090 lt!235011) (_2!7089 lt!235015))))

(assert (=> b!150380 (= lt!235011 (readByteArrayLoopPure!0 (_1!7089 lt!235015) arr!237 from!447 to!404))))

(declare-fun thiss!1634 () BitStream!5348)

(assert (=> b!150380 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3045 (buf!3526 (_2!7091 lt!235026)))) ((_ sign_extend 32) (currentByte!6446 thiss!1634)) ((_ sign_extend 32) (currentBit!6441 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!235013 () Unit!9490)

(assert (=> b!150380 (= lt!235013 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3526 (_2!7091 lt!235026)) (bvsub to!404 from!447)))))

(assert (=> b!150380 (= (_2!7092 lt!235033) (select (arr!3838 arr!237) from!447))))

(declare-fun readBytePure!0 (BitStream!5348) tuple2!13450)

(assert (=> b!150380 (= lt!235033 (readBytePure!0 (_1!7089 lt!235015)))))

(assert (=> b!150380 (= lt!235022 (reader!0 (_2!7091 lt!235031) (_2!7091 lt!235026)))))

(assert (=> b!150380 (= lt!235015 (reader!0 thiss!1634 (_2!7091 lt!235026)))))

(declare-fun e!100425 () Bool)

(assert (=> b!150380 e!100425))

(declare-fun res!126045 () Bool)

(assert (=> b!150380 (=> (not res!126045) (not e!100425))))

(declare-fun lt!235029 () tuple2!13450)

(declare-fun lt!235037 () tuple2!13450)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!150380 (= res!126045 (= (bitIndex!0 (size!3045 (buf!3526 (_1!7092 lt!235029))) (currentByte!6446 (_1!7092 lt!235029)) (currentBit!6441 (_1!7092 lt!235029))) (bitIndex!0 (size!3045 (buf!3526 (_1!7092 lt!235037))) (currentByte!6446 (_1!7092 lt!235037)) (currentBit!6441 (_1!7092 lt!235037)))))))

(declare-fun lt!235024 () Unit!9490)

(declare-fun lt!235025 () BitStream!5348)

(declare-fun readBytePrefixLemma!0 (BitStream!5348 BitStream!5348) Unit!9490)

(assert (=> b!150380 (= lt!235024 (readBytePrefixLemma!0 lt!235025 (_2!7091 lt!235026)))))

(assert (=> b!150380 (= lt!235037 (readBytePure!0 (BitStream!5349 (buf!3526 (_2!7091 lt!235026)) (currentByte!6446 thiss!1634) (currentBit!6441 thiss!1634))))))

(assert (=> b!150380 (= lt!235029 (readBytePure!0 lt!235025))))

(assert (=> b!150380 (= lt!235025 (BitStream!5349 (buf!3526 (_2!7091 lt!235031)) (currentByte!6446 thiss!1634) (currentBit!6441 thiss!1634)))))

(declare-fun e!100426 () Bool)

(assert (=> b!150380 e!100426))

(declare-fun res!126055 () Bool)

(assert (=> b!150380 (=> (not res!126055) (not e!100426))))

(declare-fun isPrefixOf!0 (BitStream!5348 BitStream!5348) Bool)

(assert (=> b!150380 (= res!126055 (isPrefixOf!0 thiss!1634 (_2!7091 lt!235026)))))

(declare-fun lt!235020 () Unit!9490)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5348 BitStream!5348 BitStream!5348) Unit!9490)

(assert (=> b!150380 (= lt!235020 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!7091 lt!235031) (_2!7091 lt!235026)))))

(declare-fun e!100430 () Bool)

(assert (=> b!150380 e!100430))

(declare-fun res!126056 () Bool)

(assert (=> b!150380 (=> (not res!126056) (not e!100430))))

(assert (=> b!150380 (= res!126056 (= (size!3045 (buf!3526 (_2!7091 lt!235031))) (size!3045 (buf!3526 (_2!7091 lt!235026)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5348 array!6729 (_ BitVec 32) (_ BitVec 32)) tuple2!13448)

(assert (=> b!150380 (= lt!235026 (appendByteArrayLoop!0 (_2!7091 lt!235031) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!150380 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3045 (buf!3526 (_2!7091 lt!235031)))) ((_ sign_extend 32) (currentByte!6446 (_2!7091 lt!235031))) ((_ sign_extend 32) (currentBit!6441 (_2!7091 lt!235031))) lt!235021)))

(assert (=> b!150380 (= lt!235021 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!235017 () Unit!9490)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5348 BitStream!5348 (_ BitVec 64) (_ BitVec 32)) Unit!9490)

(assert (=> b!150380 (= lt!235017 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!7091 lt!235031) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!100431 () Bool)

(assert (=> b!150380 e!100431))

(declare-fun res!126042 () Bool)

(assert (=> b!150380 (=> (not res!126042) (not e!100431))))

(assert (=> b!150380 (= res!126042 (= (size!3045 (buf!3526 thiss!1634)) (size!3045 (buf!3526 (_2!7091 lt!235031)))))))

(declare-fun appendByte!0 (BitStream!5348 (_ BitVec 8)) tuple2!13448)

(assert (=> b!150380 (= lt!235031 (appendByte!0 thiss!1634 (select (arr!3838 arr!237) from!447)))))

(declare-fun b!150382 () Bool)

(declare-fun res!126052 () Bool)

(assert (=> b!150382 (=> (not res!126052) (not e!100423))))

(assert (=> b!150382 (= res!126052 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3045 (buf!3526 thiss!1634))) ((_ sign_extend 32) (currentByte!6446 thiss!1634)) ((_ sign_extend 32) (currentBit!6441 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!150383 () Bool)

(declare-fun res!126051 () Bool)

(assert (=> b!150383 (=> (not res!126051) (not e!100420))))

(assert (=> b!150383 (= res!126051 (isPrefixOf!0 (_2!7091 lt!235031) (_2!7091 lt!235026)))))

(declare-fun b!150384 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!150384 (= e!100426 (invariant!0 (currentBit!6441 thiss!1634) (currentByte!6446 thiss!1634) (size!3045 (buf!3526 (_2!7091 lt!235031)))))))

(declare-fun b!150385 () Bool)

(declare-fun e!100421 () Bool)

(assert (=> b!150385 (= e!100422 e!100421)))

(declare-fun res!126050 () Bool)

(assert (=> b!150385 (=> res!126050 e!100421)))

(assert (=> b!150385 (= res!126050 (not (= (size!3045 (buf!3526 thiss!1634)) (size!3045 (buf!3526 (_2!7091 lt!235026))))))))

(assert (=> b!150385 (arrayRangesEq!361 arr!237 (_2!7090 lt!235011) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!235027 () Unit!9490)

(declare-fun arrayRangesEqTransitive!76 (array!6729 array!6729 array!6729 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9490)

(assert (=> b!150385 (= lt!235027 (arrayRangesEqTransitive!76 arr!237 (_2!7090 lt!235032) (_2!7090 lt!235011) #b00000000000000000000000000000000 to!404 to!404))))

(assert (=> b!150385 (arrayRangesEq!361 (_2!7090 lt!235032) (_2!7090 lt!235011) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!235035 () Unit!9490)

(declare-fun arrayRangesEqSymmetricLemma!93 (array!6729 array!6729 (_ BitVec 32) (_ BitVec 32)) Unit!9490)

(assert (=> b!150385 (= lt!235035 (arrayRangesEqSymmetricLemma!93 (_2!7090 lt!235011) (_2!7090 lt!235032) #b00000000000000000000000000000000 to!404))))

(declare-fun b!150386 () Bool)

(assert (=> b!150386 (= e!100425 (= (_2!7092 lt!235029) (_2!7092 lt!235037)))))

(declare-fun res!126053 () Bool)

(assert (=> start!28936 (=> (not res!126053) (not e!100423))))

(assert (=> start!28936 (= res!126053 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3045 arr!237))))))

(assert (=> start!28936 e!100423))

(assert (=> start!28936 true))

(declare-fun array_inv!2834 (array!6729) Bool)

(assert (=> start!28936 (array_inv!2834 arr!237)))

(declare-fun e!100432 () Bool)

(declare-fun inv!12 (BitStream!5348) Bool)

(assert (=> start!28936 (and (inv!12 thiss!1634) e!100432)))

(declare-fun b!150381 () Bool)

(declare-fun res!126041 () Bool)

(assert (=> b!150381 (=> (not res!126041) (not e!100423))))

(assert (=> b!150381 (= res!126041 (invariant!0 (currentBit!6441 thiss!1634) (currentByte!6446 thiss!1634) (size!3045 (buf!3526 thiss!1634))))))

(declare-fun lt!235023 () tuple2!13450)

(declare-fun lt!235036 () tuple2!13444)

(declare-fun b!150387 () Bool)

(assert (=> b!150387 (= e!100431 (and (= (_2!7092 lt!235023) (select (arr!3838 arr!237) from!447)) (= (_1!7092 lt!235023) (_2!7089 lt!235036))))))

(assert (=> b!150387 (= lt!235023 (readBytePure!0 (_1!7089 lt!235036)))))

(assert (=> b!150387 (= lt!235036 (reader!0 thiss!1634 (_2!7091 lt!235031)))))

(declare-fun b!150388 () Bool)

(declare-fun e!100424 () Bool)

(assert (=> b!150388 (= e!100421 e!100424)))

(declare-fun res!126054 () Bool)

(assert (=> b!150388 (=> res!126054 e!100424)))

(declare-fun lt!235016 () (_ BitVec 64))

(assert (=> b!150388 (= res!126054 (not (= (bitIndex!0 (size!3045 (buf!3526 (_2!7091 lt!235026))) (currentByte!6446 (_2!7091 lt!235026)) (currentBit!6441 (_2!7091 lt!235026))) (bvadd (bitIndex!0 (size!3045 (buf!3526 thiss!1634)) (currentByte!6446 thiss!1634) (currentBit!6441 thiss!1634)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!235016)))))))

(assert (=> b!150388 (= lt!235016 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(declare-fun b!150389 () Bool)

(assert (=> b!150389 (= e!100428 (not (arrayRangesEq!361 arr!237 (_2!7090 lt!235012) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!150390 () Bool)

(declare-fun res!126049 () Bool)

(assert (=> b!150390 (=> (not res!126049) (not e!100431))))

(assert (=> b!150390 (= res!126049 (isPrefixOf!0 thiss!1634 (_2!7091 lt!235031)))))

(declare-fun b!150391 () Bool)

(assert (=> b!150391 (= e!100430 e!100420)))

(declare-fun res!126046 () Bool)

(assert (=> b!150391 (=> (not res!126046) (not e!100420))))

(assert (=> b!150391 (= res!126046 (= (bitIndex!0 (size!3045 (buf!3526 (_2!7091 lt!235026))) (currentByte!6446 (_2!7091 lt!235026)) (currentBit!6441 (_2!7091 lt!235026))) (bvadd (bitIndex!0 (size!3045 (buf!3526 (_2!7091 lt!235031))) (currentByte!6446 (_2!7091 lt!235031)) (currentBit!6441 (_2!7091 lt!235031))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!235019))))))

(assert (=> b!150391 (= lt!235019 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!150392 () Bool)

(declare-fun res!126047 () Bool)

(assert (=> b!150392 (=> (not res!126047) (not e!100423))))

(assert (=> b!150392 (= res!126047 (bvslt from!447 to!404))))

(declare-fun b!150393 () Bool)

(assert (=> b!150393 (= e!100432 (array_inv!2834 (buf!3526 thiss!1634)))))

(declare-fun b!150394 () Bool)

(declare-fun res!126043 () Bool)

(assert (=> b!150394 (=> (not res!126043) (not e!100431))))

(assert (=> b!150394 (= res!126043 (= (bitIndex!0 (size!3045 (buf!3526 (_2!7091 lt!235031))) (currentByte!6446 (_2!7091 lt!235031)) (currentBit!6441 (_2!7091 lt!235031))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3045 (buf!3526 thiss!1634)) (currentByte!6446 thiss!1634) (currentBit!6441 thiss!1634)))))))

(declare-fun b!150395 () Bool)

(assert (=> b!150395 (= e!100424 (bvsge lt!235016 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!28936 res!126053) b!150382))

(assert (= (and b!150382 res!126052) b!150392))

(assert (= (and b!150392 res!126047) b!150381))

(assert (= (and b!150381 res!126041) b!150380))

(assert (= (and b!150380 res!126042) b!150394))

(assert (= (and b!150394 res!126043) b!150390))

(assert (= (and b!150390 res!126049) b!150387))

(assert (= (and b!150380 res!126056) b!150391))

(assert (= (and b!150391 res!126046) b!150383))

(assert (= (and b!150383 res!126051) b!150379))

(assert (= (and b!150379 (not res!126048)) b!150389))

(assert (= (and b!150380 res!126055) b!150384))

(assert (= (and b!150380 res!126045) b!150386))

(assert (= (and b!150380 (not res!126044)) b!150385))

(assert (= (and b!150385 (not res!126050)) b!150388))

(assert (= (and b!150388 (not res!126054)) b!150395))

(assert (= start!28936 b!150393))

(declare-fun m!234393 () Bool)

(assert (=> b!150380 m!234393))

(declare-fun m!234395 () Bool)

(assert (=> b!150380 m!234395))

(declare-fun m!234397 () Bool)

(assert (=> b!150380 m!234397))

(declare-fun m!234399 () Bool)

(assert (=> b!150380 m!234399))

(declare-fun m!234401 () Bool)

(assert (=> b!150380 m!234401))

(declare-fun m!234403 () Bool)

(assert (=> b!150380 m!234403))

(declare-fun m!234405 () Bool)

(assert (=> b!150380 m!234405))

(declare-fun m!234407 () Bool)

(assert (=> b!150380 m!234407))

(declare-fun m!234409 () Bool)

(assert (=> b!150380 m!234409))

(declare-fun m!234411 () Bool)

(assert (=> b!150380 m!234411))

(declare-fun m!234413 () Bool)

(assert (=> b!150380 m!234413))

(assert (=> b!150380 m!234411))

(declare-fun m!234415 () Bool)

(assert (=> b!150380 m!234415))

(declare-fun m!234417 () Bool)

(assert (=> b!150380 m!234417))

(declare-fun m!234419 () Bool)

(assert (=> b!150380 m!234419))

(declare-fun m!234421 () Bool)

(assert (=> b!150380 m!234421))

(declare-fun m!234423 () Bool)

(assert (=> b!150380 m!234423))

(declare-fun m!234425 () Bool)

(assert (=> b!150380 m!234425))

(declare-fun m!234427 () Bool)

(assert (=> b!150380 m!234427))

(declare-fun m!234429 () Bool)

(assert (=> b!150380 m!234429))

(declare-fun m!234431 () Bool)

(assert (=> b!150380 m!234431))

(declare-fun m!234433 () Bool)

(assert (=> b!150380 m!234433))

(declare-fun m!234435 () Bool)

(assert (=> b!150380 m!234435))

(declare-fun m!234437 () Bool)

(assert (=> b!150380 m!234437))

(declare-fun m!234439 () Bool)

(assert (=> b!150380 m!234439))

(declare-fun m!234441 () Bool)

(assert (=> b!150380 m!234441))

(declare-fun m!234443 () Bool)

(assert (=> b!150380 m!234443))

(assert (=> b!150380 m!234409))

(declare-fun m!234445 () Bool)

(assert (=> b!150380 m!234445))

(declare-fun m!234447 () Bool)

(assert (=> b!150394 m!234447))

(declare-fun m!234449 () Bool)

(assert (=> b!150394 m!234449))

(declare-fun m!234451 () Bool)

(assert (=> b!150382 m!234451))

(declare-fun m!234453 () Bool)

(assert (=> b!150384 m!234453))

(declare-fun m!234455 () Bool)

(assert (=> b!150379 m!234455))

(declare-fun m!234457 () Bool)

(assert (=> b!150379 m!234457))

(declare-fun m!234459 () Bool)

(assert (=> b!150379 m!234459))

(assert (=> b!150379 m!234403))

(declare-fun m!234461 () Bool)

(assert (=> b!150383 m!234461))

(declare-fun m!234463 () Bool)

(assert (=> b!150381 m!234463))

(declare-fun m!234465 () Bool)

(assert (=> b!150385 m!234465))

(declare-fun m!234467 () Bool)

(assert (=> b!150385 m!234467))

(declare-fun m!234469 () Bool)

(assert (=> b!150385 m!234469))

(declare-fun m!234471 () Bool)

(assert (=> b!150385 m!234471))

(declare-fun m!234473 () Bool)

(assert (=> b!150390 m!234473))

(declare-fun m!234475 () Bool)

(assert (=> b!150389 m!234475))

(declare-fun m!234477 () Bool)

(assert (=> b!150393 m!234477))

(declare-fun m!234479 () Bool)

(assert (=> b!150388 m!234479))

(assert (=> b!150388 m!234449))

(declare-fun m!234481 () Bool)

(assert (=> start!28936 m!234481))

(declare-fun m!234483 () Bool)

(assert (=> start!28936 m!234483))

(assert (=> b!150387 m!234411))

(declare-fun m!234485 () Bool)

(assert (=> b!150387 m!234485))

(declare-fun m!234487 () Bool)

(assert (=> b!150387 m!234487))

(assert (=> b!150391 m!234479))

(assert (=> b!150391 m!234447))

(push 1)

(assert (not b!150384))

(assert (not b!150385))

(assert (not b!150388))

(assert (not b!150382))

(assert (not b!150379))

(assert (not b!150391))

(assert (not b!150393))

(assert (not b!150380))

(assert (not start!28936))

(assert (not b!150390))

(assert (not b!150381))

(assert (not b!150383))

(assert (not b!150387))

(assert (not b!150389))

(assert (not b!150394))

(check-sat)

(pop 1)

(push 1)

(check-sat)

