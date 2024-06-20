; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26890 () Bool)

(assert start!26890)

(declare-fun b!138632 () Bool)

(declare-fun res!115575 () Bool)

(declare-fun e!92204 () Bool)

(assert (=> b!138632 (=> (not res!115575) (not e!92204))))

(declare-datatypes ((array!6270 0))(
  ( (array!6271 (arr!3534 (Array (_ BitVec 32) (_ BitVec 8))) (size!2839 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4942 0))(
  ( (BitStream!4943 (buf!3252 array!6270) (currentByte!6065 (_ BitVec 32)) (currentBit!6060 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!8634 0))(
  ( (Unit!8635) )
))
(declare-datatypes ((tuple2!12128 0))(
  ( (tuple2!12129 (_1!6390 Unit!8634) (_2!6390 BitStream!4942)) )
))
(declare-fun lt!216452 () tuple2!12128)

(declare-fun lt!216473 () tuple2!12128)

(declare-fun isPrefixOf!0 (BitStream!4942 BitStream!4942) Bool)

(assert (=> b!138632 (= res!115575 (isPrefixOf!0 (_2!6390 lt!216452) (_2!6390 lt!216473)))))

(declare-fun b!138633 () Bool)

(declare-fun res!115573 () Bool)

(declare-fun e!92195 () Bool)

(assert (=> b!138633 (=> (not res!115573) (not e!92195))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun thiss!1634 () BitStream!4942)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!138633 (= res!115573 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2839 (buf!3252 thiss!1634))) ((_ sign_extend 32) (currentByte!6065 thiss!1634)) ((_ sign_extend 32) (currentBit!6060 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!138634 () Bool)

(declare-fun res!115565 () Bool)

(assert (=> b!138634 (=> (not res!115565) (not e!92195))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!138634 (= res!115565 (invariant!0 (currentBit!6060 thiss!1634) (currentByte!6065 thiss!1634) (size!2839 (buf!3252 thiss!1634))))))

(declare-datatypes ((tuple2!12130 0))(
  ( (tuple2!12131 (_1!6391 BitStream!4942) (_2!6391 array!6270)) )
))
(declare-fun lt!216455 () tuple2!12130)

(declare-fun b!138635 () Bool)

(declare-fun arr!237 () array!6270)

(declare-fun e!92200 () Bool)

(declare-fun arrayRangesEq!242 (array!6270 array!6270 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!138635 (= e!92200 (not (arrayRangesEq!242 arr!237 (_2!6391 lt!216455) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!138636 () Bool)

(assert (=> b!138636 (= e!92204 (not e!92200))))

(declare-fun res!115560 () Bool)

(assert (=> b!138636 (=> res!115560 e!92200)))

(declare-datatypes ((tuple2!12132 0))(
  ( (tuple2!12133 (_1!6392 BitStream!4942) (_2!6392 BitStream!4942)) )
))
(declare-fun lt!216465 () tuple2!12132)

(assert (=> b!138636 (= res!115560 (or (not (= (size!2839 (_2!6391 lt!216455)) (size!2839 arr!237))) (not (= (_1!6391 lt!216455) (_2!6392 lt!216465)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4942 array!6270 (_ BitVec 32) (_ BitVec 32)) tuple2!12130)

(assert (=> b!138636 (= lt!216455 (readByteArrayLoopPure!0 (_1!6392 lt!216465) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!216459 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!138636 (validate_offset_bits!1 ((_ sign_extend 32) (size!2839 (buf!3252 (_2!6390 lt!216473)))) ((_ sign_extend 32) (currentByte!6065 (_2!6390 lt!216452))) ((_ sign_extend 32) (currentBit!6060 (_2!6390 lt!216452))) lt!216459)))

(declare-fun lt!216449 () Unit!8634)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4942 array!6270 (_ BitVec 64)) Unit!8634)

(assert (=> b!138636 (= lt!216449 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6390 lt!216452) (buf!3252 (_2!6390 lt!216473)) lt!216459))))

(declare-fun reader!0 (BitStream!4942 BitStream!4942) tuple2!12132)

(assert (=> b!138636 (= lt!216465 (reader!0 (_2!6390 lt!216452) (_2!6390 lt!216473)))))

(declare-fun res!115566 () Bool)

(assert (=> start!26890 (=> (not res!115566) (not e!92195))))

(assert (=> start!26890 (= res!115566 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2839 arr!237))))))

(assert (=> start!26890 e!92195))

(assert (=> start!26890 true))

(declare-fun array_inv!2628 (array!6270) Bool)

(assert (=> start!26890 (array_inv!2628 arr!237)))

(declare-fun e!92196 () Bool)

(declare-fun inv!12 (BitStream!4942) Bool)

(assert (=> start!26890 (and (inv!12 thiss!1634) e!92196)))

(declare-fun b!138637 () Bool)

(declare-fun e!92202 () Bool)

(assert (=> b!138637 (= e!92202 (invariant!0 (currentBit!6060 thiss!1634) (currentByte!6065 thiss!1634) (size!2839 (buf!3252 (_2!6390 lt!216452)))))))

(declare-fun b!138638 () Bool)

(declare-fun res!115574 () Bool)

(declare-fun e!92203 () Bool)

(assert (=> b!138638 (=> (not res!115574) (not e!92203))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!138638 (= res!115574 (= (bitIndex!0 (size!2839 (buf!3252 (_2!6390 lt!216452))) (currentByte!6065 (_2!6390 lt!216452)) (currentBit!6060 (_2!6390 lt!216452))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2839 (buf!3252 thiss!1634)) (currentByte!6065 thiss!1634) (currentBit!6060 thiss!1634)))))))

(declare-datatypes ((tuple2!12134 0))(
  ( (tuple2!12135 (_1!6393 BitStream!4942) (_2!6393 (_ BitVec 8))) )
))
(declare-fun lt!216463 () tuple2!12134)

(declare-fun lt!216464 () tuple2!12132)

(declare-fun b!138639 () Bool)

(assert (=> b!138639 (= e!92203 (and (= (_2!6393 lt!216463) (select (arr!3534 arr!237) from!447)) (= (_1!6393 lt!216463) (_2!6392 lt!216464))))))

(declare-fun readBytePure!0 (BitStream!4942) tuple2!12134)

(assert (=> b!138639 (= lt!216463 (readBytePure!0 (_1!6392 lt!216464)))))

(assert (=> b!138639 (= lt!216464 (reader!0 thiss!1634 (_2!6390 lt!216452)))))

(declare-fun b!138640 () Bool)

(declare-fun e!92198 () Bool)

(declare-fun e!92201 () Bool)

(assert (=> b!138640 (= e!92198 e!92201)))

(declare-fun res!115570 () Bool)

(assert (=> b!138640 (=> res!115570 e!92201)))

(declare-fun lt!216470 () (_ BitVec 64))

(assert (=> b!138640 (= res!115570 (not (= (bitIndex!0 (size!2839 (buf!3252 (_2!6390 lt!216473))) (currentByte!6065 (_2!6390 lt!216473)) (currentBit!6060 (_2!6390 lt!216473))) (bvadd (bitIndex!0 (size!2839 (buf!3252 thiss!1634)) (currentByte!6065 thiss!1634) (currentBit!6060 thiss!1634)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!216470)))))))

(assert (=> b!138640 (= lt!216470 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(declare-fun b!138641 () Bool)

(declare-fun res!115563 () Bool)

(assert (=> b!138641 (=> (not res!115563) (not e!92203))))

(assert (=> b!138641 (= res!115563 (isPrefixOf!0 thiss!1634 (_2!6390 lt!216452)))))

(declare-fun b!138642 () Bool)

(assert (=> b!138642 (= e!92196 (array_inv!2628 (buf!3252 thiss!1634)))))

(declare-fun b!138643 () Bool)

(declare-fun res!115571 () Bool)

(assert (=> b!138643 (=> (not res!115571) (not e!92195))))

(assert (=> b!138643 (= res!115571 (bvslt from!447 to!404))))

(declare-fun b!138644 () Bool)

(declare-fun e!92194 () Bool)

(assert (=> b!138644 (= e!92195 (not e!92194))))

(declare-fun res!115567 () Bool)

(assert (=> b!138644 (=> res!115567 e!92194)))

(declare-fun lt!216458 () tuple2!12130)

(declare-fun lt!216466 () tuple2!12130)

(assert (=> b!138644 (= res!115567 (not (arrayRangesEq!242 (_2!6391 lt!216458) (_2!6391 lt!216466) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!216467 () tuple2!12130)

(assert (=> b!138644 (arrayRangesEq!242 (_2!6391 lt!216458) (_2!6391 lt!216467) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!216450 () tuple2!12132)

(declare-fun lt!216472 () Unit!8634)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!4942 array!6270 (_ BitVec 32) (_ BitVec 32)) Unit!8634)

(assert (=> b!138644 (= lt!216472 (readByteArrayLoopArrayPrefixLemma!0 (_1!6392 lt!216450) arr!237 from!447 to!404))))

(declare-fun lt!216451 () array!6270)

(declare-fun withMovedByteIndex!0 (BitStream!4942 (_ BitVec 32)) BitStream!4942)

(assert (=> b!138644 (= lt!216467 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6392 lt!216450) #b00000000000000000000000000000001) lt!216451 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!216471 () tuple2!12132)

(assert (=> b!138644 (= lt!216466 (readByteArrayLoopPure!0 (_1!6392 lt!216471) lt!216451 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!216462 () tuple2!12134)

(assert (=> b!138644 (= lt!216451 (array!6271 (store (arr!3534 arr!237) from!447 (_2!6393 lt!216462)) (size!2839 arr!237)))))

(declare-fun lt!216448 () (_ BitVec 32))

(assert (=> b!138644 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2839 (buf!3252 (_2!6390 lt!216473)))) ((_ sign_extend 32) (currentByte!6065 (_2!6390 lt!216452))) ((_ sign_extend 32) (currentBit!6060 (_2!6390 lt!216452))) lt!216448)))

(declare-fun lt!216454 () Unit!8634)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4942 array!6270 (_ BitVec 32)) Unit!8634)

(assert (=> b!138644 (= lt!216454 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6390 lt!216452) (buf!3252 (_2!6390 lt!216473)) lt!216448))))

(assert (=> b!138644 (= (_1!6391 lt!216458) (_2!6392 lt!216450))))

(assert (=> b!138644 (= lt!216458 (readByteArrayLoopPure!0 (_1!6392 lt!216450) arr!237 from!447 to!404))))

(assert (=> b!138644 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2839 (buf!3252 (_2!6390 lt!216473)))) ((_ sign_extend 32) (currentByte!6065 thiss!1634)) ((_ sign_extend 32) (currentBit!6060 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!216456 () Unit!8634)

(assert (=> b!138644 (= lt!216456 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3252 (_2!6390 lt!216473)) (bvsub to!404 from!447)))))

(assert (=> b!138644 (= (_2!6393 lt!216462) (select (arr!3534 arr!237) from!447))))

(assert (=> b!138644 (= lt!216462 (readBytePure!0 (_1!6392 lt!216450)))))

(assert (=> b!138644 (= lt!216471 (reader!0 (_2!6390 lt!216452) (_2!6390 lt!216473)))))

(assert (=> b!138644 (= lt!216450 (reader!0 thiss!1634 (_2!6390 lt!216473)))))

(declare-fun e!92197 () Bool)

(assert (=> b!138644 e!92197))

(declare-fun res!115569 () Bool)

(assert (=> b!138644 (=> (not res!115569) (not e!92197))))

(declare-fun lt!216461 () tuple2!12134)

(declare-fun lt!216453 () tuple2!12134)

(assert (=> b!138644 (= res!115569 (= (bitIndex!0 (size!2839 (buf!3252 (_1!6393 lt!216461))) (currentByte!6065 (_1!6393 lt!216461)) (currentBit!6060 (_1!6393 lt!216461))) (bitIndex!0 (size!2839 (buf!3252 (_1!6393 lt!216453))) (currentByte!6065 (_1!6393 lt!216453)) (currentBit!6060 (_1!6393 lt!216453)))))))

(declare-fun lt!216460 () Unit!8634)

(declare-fun lt!216468 () BitStream!4942)

(declare-fun readBytePrefixLemma!0 (BitStream!4942 BitStream!4942) Unit!8634)

(assert (=> b!138644 (= lt!216460 (readBytePrefixLemma!0 lt!216468 (_2!6390 lt!216473)))))

(assert (=> b!138644 (= lt!216453 (readBytePure!0 (BitStream!4943 (buf!3252 (_2!6390 lt!216473)) (currentByte!6065 thiss!1634) (currentBit!6060 thiss!1634))))))

(assert (=> b!138644 (= lt!216461 (readBytePure!0 lt!216468))))

(assert (=> b!138644 (= lt!216468 (BitStream!4943 (buf!3252 (_2!6390 lt!216452)) (currentByte!6065 thiss!1634) (currentBit!6060 thiss!1634)))))

(assert (=> b!138644 e!92202))

(declare-fun res!115568 () Bool)

(assert (=> b!138644 (=> (not res!115568) (not e!92202))))

(assert (=> b!138644 (= res!115568 (isPrefixOf!0 thiss!1634 (_2!6390 lt!216473)))))

(declare-fun lt!216457 () Unit!8634)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4942 BitStream!4942 BitStream!4942) Unit!8634)

(assert (=> b!138644 (= lt!216457 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6390 lt!216452) (_2!6390 lt!216473)))))

(declare-fun e!92193 () Bool)

(assert (=> b!138644 e!92193))

(declare-fun res!115564 () Bool)

(assert (=> b!138644 (=> (not res!115564) (not e!92193))))

(assert (=> b!138644 (= res!115564 (= (size!2839 (buf!3252 (_2!6390 lt!216452))) (size!2839 (buf!3252 (_2!6390 lt!216473)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4942 array!6270 (_ BitVec 32) (_ BitVec 32)) tuple2!12128)

(assert (=> b!138644 (= lt!216473 (appendByteArrayLoop!0 (_2!6390 lt!216452) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!138644 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2839 (buf!3252 (_2!6390 lt!216452)))) ((_ sign_extend 32) (currentByte!6065 (_2!6390 lt!216452))) ((_ sign_extend 32) (currentBit!6060 (_2!6390 lt!216452))) lt!216448)))

(assert (=> b!138644 (= lt!216448 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!216446 () Unit!8634)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4942 BitStream!4942 (_ BitVec 64) (_ BitVec 32)) Unit!8634)

(assert (=> b!138644 (= lt!216446 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6390 lt!216452) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!138644 e!92203))

(declare-fun res!115562 () Bool)

(assert (=> b!138644 (=> (not res!115562) (not e!92203))))

(assert (=> b!138644 (= res!115562 (= (size!2839 (buf!3252 thiss!1634)) (size!2839 (buf!3252 (_2!6390 lt!216452)))))))

(declare-fun appendByte!0 (BitStream!4942 (_ BitVec 8)) tuple2!12128)

(assert (=> b!138644 (= lt!216452 (appendByte!0 thiss!1634 (select (arr!3534 arr!237) from!447)))))

(declare-fun b!138645 () Bool)

(assert (=> b!138645 (= e!92197 (= (_2!6393 lt!216461) (_2!6393 lt!216453)))))

(declare-fun b!138646 () Bool)

(assert (=> b!138646 (= e!92194 e!92198)))

(declare-fun res!115572 () Bool)

(assert (=> b!138646 (=> res!115572 e!92198)))

(assert (=> b!138646 (= res!115572 (not (= (size!2839 (buf!3252 thiss!1634)) (size!2839 (buf!3252 (_2!6390 lt!216473))))))))

(assert (=> b!138646 (arrayRangesEq!242 arr!237 (_2!6391 lt!216458) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!216447 () Unit!8634)

(declare-fun arrayRangesEqTransitive!44 (array!6270 array!6270 array!6270 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8634)

(assert (=> b!138646 (= lt!216447 (arrayRangesEqTransitive!44 arr!237 (_2!6391 lt!216466) (_2!6391 lt!216458) #b00000000000000000000000000000000 to!404 to!404))))

(assert (=> b!138646 (arrayRangesEq!242 (_2!6391 lt!216466) (_2!6391 lt!216458) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!216469 () Unit!8634)

(declare-fun arrayRangesEqSymmetricLemma!55 (array!6270 array!6270 (_ BitVec 32) (_ BitVec 32)) Unit!8634)

(assert (=> b!138646 (= lt!216469 (arrayRangesEqSymmetricLemma!55 (_2!6391 lt!216458) (_2!6391 lt!216466) #b00000000000000000000000000000000 to!404))))

(declare-fun b!138647 () Bool)

(assert (=> b!138647 (= e!92201 true)))

(assert (=> b!138647 (validate_offset_bits!1 ((_ sign_extend 32) (size!2839 (buf!3252 (_2!6390 lt!216473)))) ((_ sign_extend 32) (currentByte!6065 thiss!1634)) ((_ sign_extend 32) (currentBit!6060 thiss!1634)) lt!216470)))

(declare-fun lt!216474 () Unit!8634)

(assert (=> b!138647 (= lt!216474 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1634 (buf!3252 (_2!6390 lt!216473)) lt!216470))))

(declare-fun b!138648 () Bool)

(assert (=> b!138648 (= e!92193 e!92204)))

(declare-fun res!115561 () Bool)

(assert (=> b!138648 (=> (not res!115561) (not e!92204))))

(assert (=> b!138648 (= res!115561 (= (bitIndex!0 (size!2839 (buf!3252 (_2!6390 lt!216473))) (currentByte!6065 (_2!6390 lt!216473)) (currentBit!6060 (_2!6390 lt!216473))) (bvadd (bitIndex!0 (size!2839 (buf!3252 (_2!6390 lt!216452))) (currentByte!6065 (_2!6390 lt!216452)) (currentBit!6060 (_2!6390 lt!216452))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!216459))))))

(assert (=> b!138648 (= lt!216459 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (= (and start!26890 res!115566) b!138633))

(assert (= (and b!138633 res!115573) b!138643))

(assert (= (and b!138643 res!115571) b!138634))

(assert (= (and b!138634 res!115565) b!138644))

(assert (= (and b!138644 res!115562) b!138638))

(assert (= (and b!138638 res!115574) b!138641))

(assert (= (and b!138641 res!115563) b!138639))

(assert (= (and b!138644 res!115564) b!138648))

(assert (= (and b!138648 res!115561) b!138632))

(assert (= (and b!138632 res!115575) b!138636))

(assert (= (and b!138636 (not res!115560)) b!138635))

(assert (= (and b!138644 res!115568) b!138637))

(assert (= (and b!138644 res!115569) b!138645))

(assert (= (and b!138644 (not res!115567)) b!138646))

(assert (= (and b!138646 (not res!115572)) b!138640))

(assert (= (and b!138640 (not res!115570)) b!138647))

(assert (= start!26890 b!138642))

(declare-fun m!213371 () Bool)

(assert (=> b!138638 m!213371))

(declare-fun m!213373 () Bool)

(assert (=> b!138638 m!213373))

(declare-fun m!213375 () Bool)

(assert (=> b!138648 m!213375))

(assert (=> b!138648 m!213371))

(assert (=> b!138640 m!213375))

(assert (=> b!138640 m!213373))

(declare-fun m!213377 () Bool)

(assert (=> b!138644 m!213377))

(declare-fun m!213379 () Bool)

(assert (=> b!138644 m!213379))

(declare-fun m!213381 () Bool)

(assert (=> b!138644 m!213381))

(declare-fun m!213383 () Bool)

(assert (=> b!138644 m!213383))

(declare-fun m!213385 () Bool)

(assert (=> b!138644 m!213385))

(declare-fun m!213387 () Bool)

(assert (=> b!138644 m!213387))

(declare-fun m!213389 () Bool)

(assert (=> b!138644 m!213389))

(declare-fun m!213391 () Bool)

(assert (=> b!138644 m!213391))

(declare-fun m!213393 () Bool)

(assert (=> b!138644 m!213393))

(declare-fun m!213395 () Bool)

(assert (=> b!138644 m!213395))

(declare-fun m!213397 () Bool)

(assert (=> b!138644 m!213397))

(declare-fun m!213399 () Bool)

(assert (=> b!138644 m!213399))

(declare-fun m!213401 () Bool)

(assert (=> b!138644 m!213401))

(declare-fun m!213403 () Bool)

(assert (=> b!138644 m!213403))

(declare-fun m!213405 () Bool)

(assert (=> b!138644 m!213405))

(declare-fun m!213407 () Bool)

(assert (=> b!138644 m!213407))

(declare-fun m!213409 () Bool)

(assert (=> b!138644 m!213409))

(declare-fun m!213411 () Bool)

(assert (=> b!138644 m!213411))

(assert (=> b!138644 m!213403))

(declare-fun m!213413 () Bool)

(assert (=> b!138644 m!213413))

(declare-fun m!213415 () Bool)

(assert (=> b!138644 m!213415))

(declare-fun m!213417 () Bool)

(assert (=> b!138644 m!213417))

(declare-fun m!213419 () Bool)

(assert (=> b!138644 m!213419))

(declare-fun m!213421 () Bool)

(assert (=> b!138644 m!213421))

(declare-fun m!213423 () Bool)

(assert (=> b!138644 m!213423))

(assert (=> b!138644 m!213389))

(declare-fun m!213425 () Bool)

(assert (=> b!138644 m!213425))

(declare-fun m!213427 () Bool)

(assert (=> b!138644 m!213427))

(declare-fun m!213429 () Bool)

(assert (=> b!138644 m!213429))

(declare-fun m!213431 () Bool)

(assert (=> b!138635 m!213431))

(declare-fun m!213433 () Bool)

(assert (=> b!138634 m!213433))

(declare-fun m!213435 () Bool)

(assert (=> start!26890 m!213435))

(declare-fun m!213437 () Bool)

(assert (=> start!26890 m!213437))

(declare-fun m!213439 () Bool)

(assert (=> b!138642 m!213439))

(assert (=> b!138639 m!213389))

(declare-fun m!213441 () Bool)

(assert (=> b!138639 m!213441))

(declare-fun m!213443 () Bool)

(assert (=> b!138639 m!213443))

(declare-fun m!213445 () Bool)

(assert (=> b!138633 m!213445))

(declare-fun m!213447 () Bool)

(assert (=> b!138641 m!213447))

(declare-fun m!213449 () Bool)

(assert (=> b!138632 m!213449))

(declare-fun m!213451 () Bool)

(assert (=> b!138647 m!213451))

(declare-fun m!213453 () Bool)

(assert (=> b!138647 m!213453))

(declare-fun m!213455 () Bool)

(assert (=> b!138637 m!213455))

(declare-fun m!213457 () Bool)

(assert (=> b!138636 m!213457))

(declare-fun m!213459 () Bool)

(assert (=> b!138636 m!213459))

(declare-fun m!213461 () Bool)

(assert (=> b!138636 m!213461))

(assert (=> b!138636 m!213405))

(declare-fun m!213463 () Bool)

(assert (=> b!138646 m!213463))

(declare-fun m!213465 () Bool)

(assert (=> b!138646 m!213465))

(declare-fun m!213467 () Bool)

(assert (=> b!138646 m!213467))

(declare-fun m!213469 () Bool)

(assert (=> b!138646 m!213469))

(push 1)

(assert (not b!138633))

(assert (not b!138638))

(assert (not b!138635))

(assert (not start!26890))

(assert (not b!138644))

(assert (not b!138634))

(assert (not b!138637))

(assert (not b!138640))

(assert (not b!138648))

(assert (not b!138639))

(assert (not b!138646))

(assert (not b!138632))

(assert (not b!138647))

(assert (not b!138636))

(assert (not b!138641))

(assert (not b!138642))

(check-sat)

(pop 1)

