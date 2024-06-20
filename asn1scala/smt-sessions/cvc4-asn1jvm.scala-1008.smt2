; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28756 () Bool)

(assert start!28756)

(declare-fun to!404 () (_ BitVec 32))

(declare-fun b!148934 () Bool)

(declare-datatypes ((array!6678 0))(
  ( (array!6679 (arr!3805 (Array (_ BitVec 32) (_ BitVec 8))) (size!3021 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6678)

(declare-datatypes ((BitStream!5300 0))(
  ( (BitStream!5301 (buf!3496 array!6678) (currentByte!6410 (_ BitVec 32)) (currentBit!6405 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!13246 0))(
  ( (tuple2!13247 (_1!6987 BitStream!5300) (_2!6987 array!6678)) )
))
(declare-fun lt!232265 () tuple2!13246)

(declare-fun e!99396 () Bool)

(declare-fun arrayRangesEq!337 (array!6678 array!6678 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!148934 (= e!99396 (not (arrayRangesEq!337 arr!237 (_2!6987 lt!232265) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!148935 () Bool)

(declare-fun e!99389 () Bool)

(declare-datatypes ((tuple2!13248 0))(
  ( (tuple2!13249 (_1!6988 BitStream!5300) (_2!6988 (_ BitVec 8))) )
))
(declare-fun lt!232269 () tuple2!13248)

(declare-fun lt!232274 () tuple2!13248)

(assert (=> b!148935 (= e!99389 (= (_2!6988 lt!232269) (_2!6988 lt!232274)))))

(declare-fun b!148936 () Bool)

(declare-fun res!124704 () Bool)

(declare-fun e!99395 () Bool)

(assert (=> b!148936 (=> (not res!124704) (not e!99395))))

(declare-datatypes ((Unit!9433 0))(
  ( (Unit!9434) )
))
(declare-datatypes ((tuple2!13250 0))(
  ( (tuple2!13251 (_1!6989 Unit!9433) (_2!6989 BitStream!5300)) )
))
(declare-fun lt!232272 () tuple2!13250)

(declare-fun lt!232280 () tuple2!13250)

(declare-fun isPrefixOf!0 (BitStream!5300 BitStream!5300) Bool)

(assert (=> b!148936 (= res!124704 (isPrefixOf!0 (_2!6989 lt!232272) (_2!6989 lt!232280)))))

(declare-fun b!148937 () Bool)

(declare-fun res!124712 () Bool)

(declare-fun e!99400 () Bool)

(assert (=> b!148937 (=> (not res!124712) (not e!99400))))

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!148937 (= res!124712 (bvslt from!447 to!404))))

(declare-fun e!99394 () Bool)

(declare-datatypes ((tuple2!13252 0))(
  ( (tuple2!13253 (_1!6990 BitStream!5300) (_2!6990 BitStream!5300)) )
))
(declare-fun lt!232279 () tuple2!13252)

(declare-fun lt!232267 () tuple2!13248)

(declare-fun b!148938 () Bool)

(assert (=> b!148938 (= e!99394 (and (= (_2!6988 lt!232267) (select (arr!3805 arr!237) from!447)) (= (_1!6988 lt!232267) (_2!6990 lt!232279))))))

(declare-fun readBytePure!0 (BitStream!5300) tuple2!13248)

(assert (=> b!148938 (= lt!232267 (readBytePure!0 (_1!6990 lt!232279)))))

(declare-fun thiss!1634 () BitStream!5300)

(declare-fun reader!0 (BitStream!5300 BitStream!5300) tuple2!13252)

(assert (=> b!148938 (= lt!232279 (reader!0 thiss!1634 (_2!6989 lt!232272)))))

(declare-fun b!148939 () Bool)

(declare-fun res!124707 () Bool)

(assert (=> b!148939 (=> (not res!124707) (not e!99394))))

(assert (=> b!148939 (= res!124707 (isPrefixOf!0 thiss!1634 (_2!6989 lt!232272)))))

(declare-fun b!148941 () Bool)

(declare-fun res!124711 () Bool)

(assert (=> b!148941 (=> (not res!124711) (not e!99400))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!148941 (= res!124711 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3021 (buf!3496 thiss!1634))) ((_ sign_extend 32) (currentByte!6410 thiss!1634)) ((_ sign_extend 32) (currentBit!6405 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!148942 () Bool)

(declare-fun e!99397 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!148942 (= e!99397 (invariant!0 (currentBit!6405 thiss!1634) (currentByte!6410 thiss!1634) (size!3021 (buf!3496 (_2!6989 lt!232272)))))))

(declare-fun b!148943 () Bool)

(declare-fun res!124702 () Bool)

(assert (=> b!148943 (=> (not res!124702) (not e!99400))))

(assert (=> b!148943 (= res!124702 (invariant!0 (currentBit!6405 thiss!1634) (currentByte!6410 thiss!1634) (size!3021 (buf!3496 thiss!1634))))))

(declare-fun b!148944 () Bool)

(declare-fun e!99390 () Bool)

(declare-fun array_inv!2810 (array!6678) Bool)

(assert (=> b!148944 (= e!99390 (array_inv!2810 (buf!3496 thiss!1634)))))

(declare-fun b!148945 () Bool)

(declare-fun e!99392 () Bool)

(assert (=> b!148945 (= e!99400 (not e!99392))))

(declare-fun res!124710 () Bool)

(assert (=> b!148945 (=> res!124710 e!99392)))

(declare-fun lt!232277 () tuple2!13246)

(declare-fun lt!232262 () tuple2!13246)

(assert (=> b!148945 (= res!124710 (not (arrayRangesEq!337 (_2!6987 lt!232277) (_2!6987 lt!232262) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!232282 () tuple2!13246)

(assert (=> b!148945 (arrayRangesEq!337 (_2!6987 lt!232277) (_2!6987 lt!232282) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!232263 () tuple2!13252)

(declare-fun lt!232276 () Unit!9433)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!5300 array!6678 (_ BitVec 32) (_ BitVec 32)) Unit!9433)

(assert (=> b!148945 (= lt!232276 (readByteArrayLoopArrayPrefixLemma!0 (_1!6990 lt!232263) arr!237 from!447 to!404))))

(declare-fun lt!232266 () array!6678)

(declare-fun readByteArrayLoopPure!0 (BitStream!5300 array!6678 (_ BitVec 32) (_ BitVec 32)) tuple2!13246)

(declare-fun withMovedByteIndex!0 (BitStream!5300 (_ BitVec 32)) BitStream!5300)

(assert (=> b!148945 (= lt!232282 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6990 lt!232263) #b00000000000000000000000000000001) lt!232266 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!232271 () tuple2!13252)

(assert (=> b!148945 (= lt!232262 (readByteArrayLoopPure!0 (_1!6990 lt!232271) lt!232266 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!232275 () tuple2!13248)

(assert (=> b!148945 (= lt!232266 (array!6679 (store (arr!3805 arr!237) from!447 (_2!6988 lt!232275)) (size!3021 arr!237)))))

(declare-fun lt!232283 () (_ BitVec 32))

(assert (=> b!148945 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3021 (buf!3496 (_2!6989 lt!232280)))) ((_ sign_extend 32) (currentByte!6410 (_2!6989 lt!232272))) ((_ sign_extend 32) (currentBit!6405 (_2!6989 lt!232272))) lt!232283)))

(declare-fun lt!232286 () Unit!9433)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5300 array!6678 (_ BitVec 32)) Unit!9433)

(assert (=> b!148945 (= lt!232286 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6989 lt!232272) (buf!3496 (_2!6989 lt!232280)) lt!232283))))

(assert (=> b!148945 (= (_1!6987 lt!232277) (_2!6990 lt!232263))))

(assert (=> b!148945 (= lt!232277 (readByteArrayLoopPure!0 (_1!6990 lt!232263) arr!237 from!447 to!404))))

(assert (=> b!148945 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3021 (buf!3496 (_2!6989 lt!232280)))) ((_ sign_extend 32) (currentByte!6410 thiss!1634)) ((_ sign_extend 32) (currentBit!6405 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!232287 () Unit!9433)

(assert (=> b!148945 (= lt!232287 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3496 (_2!6989 lt!232280)) (bvsub to!404 from!447)))))

(assert (=> b!148945 (= (_2!6988 lt!232275) (select (arr!3805 arr!237) from!447))))

(assert (=> b!148945 (= lt!232275 (readBytePure!0 (_1!6990 lt!232263)))))

(assert (=> b!148945 (= lt!232271 (reader!0 (_2!6989 lt!232272) (_2!6989 lt!232280)))))

(assert (=> b!148945 (= lt!232263 (reader!0 thiss!1634 (_2!6989 lt!232280)))))

(assert (=> b!148945 e!99389))

(declare-fun res!124698 () Bool)

(assert (=> b!148945 (=> (not res!124698) (not e!99389))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!148945 (= res!124698 (= (bitIndex!0 (size!3021 (buf!3496 (_1!6988 lt!232269))) (currentByte!6410 (_1!6988 lt!232269)) (currentBit!6405 (_1!6988 lt!232269))) (bitIndex!0 (size!3021 (buf!3496 (_1!6988 lt!232274))) (currentByte!6410 (_1!6988 lt!232274)) (currentBit!6405 (_1!6988 lt!232274)))))))

(declare-fun lt!232285 () Unit!9433)

(declare-fun lt!232264 () BitStream!5300)

(declare-fun readBytePrefixLemma!0 (BitStream!5300 BitStream!5300) Unit!9433)

(assert (=> b!148945 (= lt!232285 (readBytePrefixLemma!0 lt!232264 (_2!6989 lt!232280)))))

(assert (=> b!148945 (= lt!232274 (readBytePure!0 (BitStream!5301 (buf!3496 (_2!6989 lt!232280)) (currentByte!6410 thiss!1634) (currentBit!6405 thiss!1634))))))

(assert (=> b!148945 (= lt!232269 (readBytePure!0 lt!232264))))

(assert (=> b!148945 (= lt!232264 (BitStream!5301 (buf!3496 (_2!6989 lt!232272)) (currentByte!6410 thiss!1634) (currentBit!6405 thiss!1634)))))

(assert (=> b!148945 e!99397))

(declare-fun res!124699 () Bool)

(assert (=> b!148945 (=> (not res!124699) (not e!99397))))

(assert (=> b!148945 (= res!124699 (isPrefixOf!0 thiss!1634 (_2!6989 lt!232280)))))

(declare-fun lt!232281 () Unit!9433)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5300 BitStream!5300 BitStream!5300) Unit!9433)

(assert (=> b!148945 (= lt!232281 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6989 lt!232272) (_2!6989 lt!232280)))))

(declare-fun e!99399 () Bool)

(assert (=> b!148945 e!99399))

(declare-fun res!124709 () Bool)

(assert (=> b!148945 (=> (not res!124709) (not e!99399))))

(assert (=> b!148945 (= res!124709 (= (size!3021 (buf!3496 (_2!6989 lt!232272))) (size!3021 (buf!3496 (_2!6989 lt!232280)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5300 array!6678 (_ BitVec 32) (_ BitVec 32)) tuple2!13250)

(assert (=> b!148945 (= lt!232280 (appendByteArrayLoop!0 (_2!6989 lt!232272) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!148945 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3021 (buf!3496 (_2!6989 lt!232272)))) ((_ sign_extend 32) (currentByte!6410 (_2!6989 lt!232272))) ((_ sign_extend 32) (currentBit!6405 (_2!6989 lt!232272))) lt!232283)))

(assert (=> b!148945 (= lt!232283 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!232278 () Unit!9433)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5300 BitStream!5300 (_ BitVec 64) (_ BitVec 32)) Unit!9433)

(assert (=> b!148945 (= lt!232278 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6989 lt!232272) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!148945 e!99394))

(declare-fun res!124703 () Bool)

(assert (=> b!148945 (=> (not res!124703) (not e!99394))))

(assert (=> b!148945 (= res!124703 (= (size!3021 (buf!3496 thiss!1634)) (size!3021 (buf!3496 (_2!6989 lt!232272)))))))

(declare-fun appendByte!0 (BitStream!5300 (_ BitVec 8)) tuple2!13250)

(assert (=> b!148945 (= lt!232272 (appendByte!0 thiss!1634 (select (arr!3805 arr!237) from!447)))))

(declare-fun b!148946 () Bool)

(declare-fun e!99391 () Bool)

(assert (=> b!148946 (= e!99391 (arrayRangesEq!337 arr!237 (_2!6987 lt!232262) #b00000000000000000000000000000000 to!404))))

(declare-fun b!148947 () Bool)

(declare-fun res!124700 () Bool)

(assert (=> b!148947 (=> (not res!124700) (not e!99394))))

(assert (=> b!148947 (= res!124700 (= (bitIndex!0 (size!3021 (buf!3496 (_2!6989 lt!232272))) (currentByte!6410 (_2!6989 lt!232272)) (currentBit!6405 (_2!6989 lt!232272))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3021 (buf!3496 thiss!1634)) (currentByte!6410 thiss!1634) (currentBit!6405 thiss!1634)))))))

(declare-fun b!148948 () Bool)

(assert (=> b!148948 (= e!99392 e!99391)))

(declare-fun res!124701 () Bool)

(assert (=> b!148948 (=> res!124701 e!99391)))

(assert (=> b!148948 (= res!124701 (or (bvsgt #b00000000000000000000000000000000 to!404) (bvsgt (size!3021 arr!237) (size!3021 (_2!6987 lt!232262))) (bvsgt (size!3021 (_2!6987 lt!232262)) (size!3021 (_2!6987 lt!232277))) (bvsgt to!404 (size!3021 (_2!6987 lt!232262)))))))

(assert (=> b!148948 (arrayRangesEq!337 (_2!6987 lt!232262) (_2!6987 lt!232277) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!232270 () Unit!9433)

(declare-fun arrayRangesEqSymmetricLemma!69 (array!6678 array!6678 (_ BitVec 32) (_ BitVec 32)) Unit!9433)

(assert (=> b!148948 (= lt!232270 (arrayRangesEqSymmetricLemma!69 (_2!6987 lt!232277) (_2!6987 lt!232262) #b00000000000000000000000000000000 to!404))))

(declare-fun b!148949 () Bool)

(assert (=> b!148949 (= e!99395 (not e!99396))))

(declare-fun res!124706 () Bool)

(assert (=> b!148949 (=> res!124706 e!99396)))

(declare-fun lt!232273 () tuple2!13252)

(assert (=> b!148949 (= res!124706 (or (not (= (size!3021 (_2!6987 lt!232265)) (size!3021 arr!237))) (not (= (_1!6987 lt!232265) (_2!6990 lt!232273)))))))

(assert (=> b!148949 (= lt!232265 (readByteArrayLoopPure!0 (_1!6990 lt!232273) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!232284 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!148949 (validate_offset_bits!1 ((_ sign_extend 32) (size!3021 (buf!3496 (_2!6989 lt!232280)))) ((_ sign_extend 32) (currentByte!6410 (_2!6989 lt!232272))) ((_ sign_extend 32) (currentBit!6405 (_2!6989 lt!232272))) lt!232284)))

(declare-fun lt!232268 () Unit!9433)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5300 array!6678 (_ BitVec 64)) Unit!9433)

(assert (=> b!148949 (= lt!232268 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6989 lt!232272) (buf!3496 (_2!6989 lt!232280)) lt!232284))))

(assert (=> b!148949 (= lt!232273 (reader!0 (_2!6989 lt!232272) (_2!6989 lt!232280)))))

(declare-fun b!148940 () Bool)

(assert (=> b!148940 (= e!99399 e!99395)))

(declare-fun res!124705 () Bool)

(assert (=> b!148940 (=> (not res!124705) (not e!99395))))

(assert (=> b!148940 (= res!124705 (= (bitIndex!0 (size!3021 (buf!3496 (_2!6989 lt!232280))) (currentByte!6410 (_2!6989 lt!232280)) (currentBit!6405 (_2!6989 lt!232280))) (bvadd (bitIndex!0 (size!3021 (buf!3496 (_2!6989 lt!232272))) (currentByte!6410 (_2!6989 lt!232272)) (currentBit!6405 (_2!6989 lt!232272))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!232284))))))

(assert (=> b!148940 (= lt!232284 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun res!124708 () Bool)

(assert (=> start!28756 (=> (not res!124708) (not e!99400))))

(assert (=> start!28756 (= res!124708 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3021 arr!237))))))

(assert (=> start!28756 e!99400))

(assert (=> start!28756 true))

(assert (=> start!28756 (array_inv!2810 arr!237)))

(declare-fun inv!12 (BitStream!5300) Bool)

(assert (=> start!28756 (and (inv!12 thiss!1634) e!99390)))

(assert (= (and start!28756 res!124708) b!148941))

(assert (= (and b!148941 res!124711) b!148937))

(assert (= (and b!148937 res!124712) b!148943))

(assert (= (and b!148943 res!124702) b!148945))

(assert (= (and b!148945 res!124703) b!148947))

(assert (= (and b!148947 res!124700) b!148939))

(assert (= (and b!148939 res!124707) b!148938))

(assert (= (and b!148945 res!124709) b!148940))

(assert (= (and b!148940 res!124705) b!148936))

(assert (= (and b!148936 res!124704) b!148949))

(assert (= (and b!148949 (not res!124706)) b!148934))

(assert (= (and b!148945 res!124699) b!148942))

(assert (= (and b!148945 res!124698) b!148935))

(assert (= (and b!148945 (not res!124710)) b!148948))

(assert (= (and b!148948 (not res!124701)) b!148946))

(assert (= start!28756 b!148944))

(declare-fun m!231485 () Bool)

(assert (=> b!148947 m!231485))

(declare-fun m!231487 () Bool)

(assert (=> b!148947 m!231487))

(declare-fun m!231489 () Bool)

(assert (=> b!148940 m!231489))

(assert (=> b!148940 m!231485))

(declare-fun m!231491 () Bool)

(assert (=> b!148939 m!231491))

(declare-fun m!231493 () Bool)

(assert (=> b!148936 m!231493))

(declare-fun m!231495 () Bool)

(assert (=> b!148941 m!231495))

(declare-fun m!231497 () Bool)

(assert (=> start!28756 m!231497))

(declare-fun m!231499 () Bool)

(assert (=> start!28756 m!231499))

(declare-fun m!231501 () Bool)

(assert (=> b!148944 m!231501))

(declare-fun m!231503 () Bool)

(assert (=> b!148934 m!231503))

(declare-fun m!231505 () Bool)

(assert (=> b!148938 m!231505))

(declare-fun m!231507 () Bool)

(assert (=> b!148938 m!231507))

(declare-fun m!231509 () Bool)

(assert (=> b!148938 m!231509))

(declare-fun m!231511 () Bool)

(assert (=> b!148945 m!231511))

(declare-fun m!231513 () Bool)

(assert (=> b!148945 m!231513))

(declare-fun m!231515 () Bool)

(assert (=> b!148945 m!231515))

(declare-fun m!231517 () Bool)

(assert (=> b!148945 m!231517))

(declare-fun m!231519 () Bool)

(assert (=> b!148945 m!231519))

(declare-fun m!231521 () Bool)

(assert (=> b!148945 m!231521))

(declare-fun m!231523 () Bool)

(assert (=> b!148945 m!231523))

(declare-fun m!231525 () Bool)

(assert (=> b!148945 m!231525))

(declare-fun m!231527 () Bool)

(assert (=> b!148945 m!231527))

(assert (=> b!148945 m!231505))

(declare-fun m!231529 () Bool)

(assert (=> b!148945 m!231529))

(assert (=> b!148945 m!231521))

(declare-fun m!231531 () Bool)

(assert (=> b!148945 m!231531))

(declare-fun m!231533 () Bool)

(assert (=> b!148945 m!231533))

(declare-fun m!231535 () Bool)

(assert (=> b!148945 m!231535))

(declare-fun m!231537 () Bool)

(assert (=> b!148945 m!231537))

(declare-fun m!231539 () Bool)

(assert (=> b!148945 m!231539))

(declare-fun m!231541 () Bool)

(assert (=> b!148945 m!231541))

(declare-fun m!231543 () Bool)

(assert (=> b!148945 m!231543))

(declare-fun m!231545 () Bool)

(assert (=> b!148945 m!231545))

(declare-fun m!231547 () Bool)

(assert (=> b!148945 m!231547))

(declare-fun m!231549 () Bool)

(assert (=> b!148945 m!231549))

(assert (=> b!148945 m!231505))

(declare-fun m!231551 () Bool)

(assert (=> b!148945 m!231551))

(declare-fun m!231553 () Bool)

(assert (=> b!148945 m!231553))

(declare-fun m!231555 () Bool)

(assert (=> b!148945 m!231555))

(declare-fun m!231557 () Bool)

(assert (=> b!148945 m!231557))

(declare-fun m!231559 () Bool)

(assert (=> b!148945 m!231559))

(declare-fun m!231561 () Bool)

(assert (=> b!148945 m!231561))

(declare-fun m!231563 () Bool)

(assert (=> b!148943 m!231563))

(declare-fun m!231565 () Bool)

(assert (=> b!148946 m!231565))

(declare-fun m!231567 () Bool)

(assert (=> b!148949 m!231567))

(declare-fun m!231569 () Bool)

(assert (=> b!148949 m!231569))

(declare-fun m!231571 () Bool)

(assert (=> b!148949 m!231571))

(assert (=> b!148949 m!231517))

(declare-fun m!231573 () Bool)

(assert (=> b!148942 m!231573))

(declare-fun m!231575 () Bool)

(assert (=> b!148948 m!231575))

(declare-fun m!231577 () Bool)

(assert (=> b!148948 m!231577))

(push 1)

(assert (not b!148936))

(assert (not b!148941))

(assert (not b!148944))

(assert (not start!28756))

(assert (not b!148949))

(assert (not b!148946))

(assert (not b!148943))

(assert (not b!148940))

(assert (not b!148934))

(assert (not b!148948))

(assert (not b!148947))

(assert (not b!148942))

(assert (not b!148945))

(assert (not b!148938))

(assert (not b!148939))

(check-sat)

(pop 1)

(push 1)

(check-sat)

