; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28942 () Bool)

(assert start!28942)

(declare-fun b!150540 () Bool)

(declare-fun e!100547 () Bool)

(declare-datatypes ((array!6735 0))(
  ( (array!6736 (arr!3841 (Array (_ BitVec 32) (_ BitVec 8))) (size!3048 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5354 0))(
  ( (BitStream!5355 (buf!3529 array!6735) (currentByte!6449 (_ BitVec 32)) (currentBit!6444 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5354)

(declare-fun array_inv!2837 (array!6735) Bool)

(assert (=> b!150540 (= e!100547 (array_inv!2837 (buf!3529 thiss!1634)))))

(declare-fun b!150541 () Bool)

(declare-fun res!126193 () Bool)

(declare-fun e!100541 () Bool)

(assert (=> b!150541 (=> (not res!126193) (not e!100541))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!150541 (= res!126193 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3048 (buf!3529 thiss!1634))) ((_ sign_extend 32) (currentByte!6449 thiss!1634)) ((_ sign_extend 32) (currentBit!6444 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!150542 () Bool)

(declare-fun e!100538 () Bool)

(declare-fun e!100544 () Bool)

(assert (=> b!150542 (= e!100538 e!100544)))

(declare-fun res!126199 () Bool)

(assert (=> b!150542 (=> res!126199 e!100544)))

(declare-datatypes ((Unit!9496 0))(
  ( (Unit!9497) )
))
(declare-datatypes ((tuple2!13468 0))(
  ( (tuple2!13469 (_1!7101 Unit!9496) (_2!7101 BitStream!5354)) )
))
(declare-fun lt!235270 () tuple2!13468)

(declare-fun lt!235275 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!150542 (= res!126199 (not (= (bitIndex!0 (size!3048 (buf!3529 (_2!7101 lt!235270))) (currentByte!6449 (_2!7101 lt!235270)) (currentBit!6444 (_2!7101 lt!235270))) (bvadd (bitIndex!0 (size!3048 (buf!3529 thiss!1634)) (currentByte!6449 thiss!1634) (currentBit!6444 thiss!1634)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!235275)))))))

(assert (=> b!150542 (= lt!235275 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(declare-fun b!150543 () Bool)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!150543 (= e!100544 (validate_offset_bits!1 ((_ sign_extend 32) (size!3048 (buf!3529 thiss!1634))) ((_ sign_extend 32) (currentByte!6449 thiss!1634)) ((_ sign_extend 32) (currentBit!6444 thiss!1634)) lt!235275))))

(declare-fun b!150544 () Bool)

(declare-fun e!100546 () Bool)

(declare-fun e!100537 () Bool)

(assert (=> b!150544 (= e!100546 (not e!100537))))

(declare-fun res!126201 () Bool)

(assert (=> b!150544 (=> res!126201 e!100537)))

(declare-datatypes ((tuple2!13470 0))(
  ( (tuple2!13471 (_1!7102 BitStream!5354) (_2!7102 array!6735)) )
))
(declare-fun lt!235285 () tuple2!13470)

(declare-datatypes ((tuple2!13472 0))(
  ( (tuple2!13473 (_1!7103 BitStream!5354) (_2!7103 BitStream!5354)) )
))
(declare-fun lt!235272 () tuple2!13472)

(declare-fun arr!237 () array!6735)

(assert (=> b!150544 (= res!126201 (or (not (= (size!3048 (_2!7102 lt!235285)) (size!3048 arr!237))) (not (= (_1!7102 lt!235285) (_2!7103 lt!235272)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5354 array!6735 (_ BitVec 32) (_ BitVec 32)) tuple2!13470)

(assert (=> b!150544 (= lt!235285 (readByteArrayLoopPure!0 (_1!7103 lt!235272) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!235287 () tuple2!13468)

(declare-fun lt!235281 () (_ BitVec 64))

(assert (=> b!150544 (validate_offset_bits!1 ((_ sign_extend 32) (size!3048 (buf!3529 (_2!7101 lt!235270)))) ((_ sign_extend 32) (currentByte!6449 (_2!7101 lt!235287))) ((_ sign_extend 32) (currentBit!6444 (_2!7101 lt!235287))) lt!235281)))

(declare-fun lt!235271 () Unit!9496)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5354 array!6735 (_ BitVec 64)) Unit!9496)

(assert (=> b!150544 (= lt!235271 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!7101 lt!235287) (buf!3529 (_2!7101 lt!235270)) lt!235281))))

(declare-fun reader!0 (BitStream!5354 BitStream!5354) tuple2!13472)

(assert (=> b!150544 (= lt!235272 (reader!0 (_2!7101 lt!235287) (_2!7101 lt!235270)))))

(declare-fun e!100543 () Bool)

(declare-datatypes ((tuple2!13474 0))(
  ( (tuple2!13475 (_1!7104 BitStream!5354) (_2!7104 (_ BitVec 8))) )
))
(declare-fun lt!235266 () tuple2!13474)

(declare-fun b!150545 () Bool)

(declare-fun lt!235267 () tuple2!13472)

(assert (=> b!150545 (= e!100543 (and (= (_2!7104 lt!235266) (select (arr!3841 arr!237) from!447)) (= (_1!7104 lt!235266) (_2!7103 lt!235267))))))

(declare-fun readBytePure!0 (BitStream!5354) tuple2!13474)

(assert (=> b!150545 (= lt!235266 (readBytePure!0 (_1!7103 lt!235267)))))

(assert (=> b!150545 (= lt!235267 (reader!0 thiss!1634 (_2!7101 lt!235287)))))

(declare-fun b!150546 () Bool)

(declare-fun res!126198 () Bool)

(assert (=> b!150546 (=> (not res!126198) (not e!100546))))

(declare-fun isPrefixOf!0 (BitStream!5354 BitStream!5354) Bool)

(assert (=> b!150546 (= res!126198 (isPrefixOf!0 (_2!7101 lt!235287) (_2!7101 lt!235270)))))

(declare-fun b!150547 () Bool)

(declare-fun e!100540 () Bool)

(assert (=> b!150547 (= e!100541 (not e!100540))))

(declare-fun res!126206 () Bool)

(assert (=> b!150547 (=> res!126206 e!100540)))

(declare-fun lt!235286 () tuple2!13470)

(declare-fun lt!235290 () tuple2!13470)

(declare-fun arrayRangesEq!364 (array!6735 array!6735 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!150547 (= res!126206 (not (arrayRangesEq!364 (_2!7102 lt!235290) (_2!7102 lt!235286) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!235280 () tuple2!13470)

(assert (=> b!150547 (arrayRangesEq!364 (_2!7102 lt!235290) (_2!7102 lt!235280) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!235268 () tuple2!13472)

(declare-fun lt!235274 () Unit!9496)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!5354 array!6735 (_ BitVec 32) (_ BitVec 32)) Unit!9496)

(assert (=> b!150547 (= lt!235274 (readByteArrayLoopArrayPrefixLemma!0 (_1!7103 lt!235268) arr!237 from!447 to!404))))

(declare-fun lt!235273 () array!6735)

(declare-fun withMovedByteIndex!0 (BitStream!5354 (_ BitVec 32)) BitStream!5354)

(assert (=> b!150547 (= lt!235280 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!7103 lt!235268) #b00000000000000000000000000000001) lt!235273 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!235277 () tuple2!13472)

(assert (=> b!150547 (= lt!235286 (readByteArrayLoopPure!0 (_1!7103 lt!235277) lt!235273 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!235289 () tuple2!13474)

(assert (=> b!150547 (= lt!235273 (array!6736 (store (arr!3841 arr!237) from!447 (_2!7104 lt!235289)) (size!3048 arr!237)))))

(declare-fun lt!235263 () (_ BitVec 32))

(assert (=> b!150547 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3048 (buf!3529 (_2!7101 lt!235270)))) ((_ sign_extend 32) (currentByte!6449 (_2!7101 lt!235287))) ((_ sign_extend 32) (currentBit!6444 (_2!7101 lt!235287))) lt!235263)))

(declare-fun lt!235288 () Unit!9496)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5354 array!6735 (_ BitVec 32)) Unit!9496)

(assert (=> b!150547 (= lt!235288 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!7101 lt!235287) (buf!3529 (_2!7101 lt!235270)) lt!235263))))

(assert (=> b!150547 (= (_1!7102 lt!235290) (_2!7103 lt!235268))))

(assert (=> b!150547 (= lt!235290 (readByteArrayLoopPure!0 (_1!7103 lt!235268) arr!237 from!447 to!404))))

(assert (=> b!150547 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3048 (buf!3529 (_2!7101 lt!235270)))) ((_ sign_extend 32) (currentByte!6449 thiss!1634)) ((_ sign_extend 32) (currentBit!6444 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!235284 () Unit!9496)

(assert (=> b!150547 (= lt!235284 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3529 (_2!7101 lt!235270)) (bvsub to!404 from!447)))))

(assert (=> b!150547 (= (_2!7104 lt!235289) (select (arr!3841 arr!237) from!447))))

(assert (=> b!150547 (= lt!235289 (readBytePure!0 (_1!7103 lt!235268)))))

(assert (=> b!150547 (= lt!235277 (reader!0 (_2!7101 lt!235287) (_2!7101 lt!235270)))))

(assert (=> b!150547 (= lt!235268 (reader!0 thiss!1634 (_2!7101 lt!235270)))))

(declare-fun e!100542 () Bool)

(assert (=> b!150547 e!100542))

(declare-fun res!126202 () Bool)

(assert (=> b!150547 (=> (not res!126202) (not e!100542))))

(declare-fun lt!235276 () tuple2!13474)

(declare-fun lt!235269 () tuple2!13474)

(assert (=> b!150547 (= res!126202 (= (bitIndex!0 (size!3048 (buf!3529 (_1!7104 lt!235276))) (currentByte!6449 (_1!7104 lt!235276)) (currentBit!6444 (_1!7104 lt!235276))) (bitIndex!0 (size!3048 (buf!3529 (_1!7104 lt!235269))) (currentByte!6449 (_1!7104 lt!235269)) (currentBit!6444 (_1!7104 lt!235269)))))))

(declare-fun lt!235278 () Unit!9496)

(declare-fun lt!235282 () BitStream!5354)

(declare-fun readBytePrefixLemma!0 (BitStream!5354 BitStream!5354) Unit!9496)

(assert (=> b!150547 (= lt!235278 (readBytePrefixLemma!0 lt!235282 (_2!7101 lt!235270)))))

(assert (=> b!150547 (= lt!235269 (readBytePure!0 (BitStream!5355 (buf!3529 (_2!7101 lt!235270)) (currentByte!6449 thiss!1634) (currentBit!6444 thiss!1634))))))

(assert (=> b!150547 (= lt!235276 (readBytePure!0 lt!235282))))

(assert (=> b!150547 (= lt!235282 (BitStream!5355 (buf!3529 (_2!7101 lt!235287)) (currentByte!6449 thiss!1634) (currentBit!6444 thiss!1634)))))

(declare-fun e!100545 () Bool)

(assert (=> b!150547 e!100545))

(declare-fun res!126197 () Bool)

(assert (=> b!150547 (=> (not res!126197) (not e!100545))))

(assert (=> b!150547 (= res!126197 (isPrefixOf!0 thiss!1634 (_2!7101 lt!235270)))))

(declare-fun lt!235264 () Unit!9496)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5354 BitStream!5354 BitStream!5354) Unit!9496)

(assert (=> b!150547 (= lt!235264 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!7101 lt!235287) (_2!7101 lt!235270)))))

(declare-fun e!100539 () Bool)

(assert (=> b!150547 e!100539))

(declare-fun res!126205 () Bool)

(assert (=> b!150547 (=> (not res!126205) (not e!100539))))

(assert (=> b!150547 (= res!126205 (= (size!3048 (buf!3529 (_2!7101 lt!235287))) (size!3048 (buf!3529 (_2!7101 lt!235270)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5354 array!6735 (_ BitVec 32) (_ BitVec 32)) tuple2!13468)

(assert (=> b!150547 (= lt!235270 (appendByteArrayLoop!0 (_2!7101 lt!235287) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!150547 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3048 (buf!3529 (_2!7101 lt!235287)))) ((_ sign_extend 32) (currentByte!6449 (_2!7101 lt!235287))) ((_ sign_extend 32) (currentBit!6444 (_2!7101 lt!235287))) lt!235263)))

(assert (=> b!150547 (= lt!235263 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!235279 () Unit!9496)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5354 BitStream!5354 (_ BitVec 64) (_ BitVec 32)) Unit!9496)

(assert (=> b!150547 (= lt!235279 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!7101 lt!235287) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!150547 e!100543))

(declare-fun res!126194 () Bool)

(assert (=> b!150547 (=> (not res!126194) (not e!100543))))

(assert (=> b!150547 (= res!126194 (= (size!3048 (buf!3529 thiss!1634)) (size!3048 (buf!3529 (_2!7101 lt!235287)))))))

(declare-fun appendByte!0 (BitStream!5354 (_ BitVec 8)) tuple2!13468)

(assert (=> b!150547 (= lt!235287 (appendByte!0 thiss!1634 (select (arr!3841 arr!237) from!447)))))

(declare-fun res!126200 () Bool)

(assert (=> start!28942 (=> (not res!126200) (not e!100541))))

(assert (=> start!28942 (= res!126200 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3048 arr!237))))))

(assert (=> start!28942 e!100541))

(assert (=> start!28942 true))

(assert (=> start!28942 (array_inv!2837 arr!237)))

(declare-fun inv!12 (BitStream!5354) Bool)

(assert (=> start!28942 (and (inv!12 thiss!1634) e!100547)))

(declare-fun b!150548 () Bool)

(assert (=> b!150548 (= e!100540 e!100538)))

(declare-fun res!126195 () Bool)

(assert (=> b!150548 (=> res!126195 e!100538)))

(assert (=> b!150548 (= res!126195 (not (= (size!3048 (buf!3529 thiss!1634)) (size!3048 (buf!3529 (_2!7101 lt!235270))))))))

(assert (=> b!150548 (arrayRangesEq!364 arr!237 (_2!7102 lt!235290) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!235265 () Unit!9496)

(declare-fun arrayRangesEqTransitive!79 (array!6735 array!6735 array!6735 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9496)

(assert (=> b!150548 (= lt!235265 (arrayRangesEqTransitive!79 arr!237 (_2!7102 lt!235286) (_2!7102 lt!235290) #b00000000000000000000000000000000 to!404 to!404))))

(assert (=> b!150548 (arrayRangesEq!364 (_2!7102 lt!235286) (_2!7102 lt!235290) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!235283 () Unit!9496)

(declare-fun arrayRangesEqSymmetricLemma!96 (array!6735 array!6735 (_ BitVec 32) (_ BitVec 32)) Unit!9496)

(assert (=> b!150548 (= lt!235283 (arrayRangesEqSymmetricLemma!96 (_2!7102 lt!235290) (_2!7102 lt!235286) #b00000000000000000000000000000000 to!404))))

(declare-fun b!150549 () Bool)

(declare-fun res!126208 () Bool)

(assert (=> b!150549 (=> (not res!126208) (not e!100541))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!150549 (= res!126208 (invariant!0 (currentBit!6444 thiss!1634) (currentByte!6449 thiss!1634) (size!3048 (buf!3529 thiss!1634))))))

(declare-fun b!150550 () Bool)

(declare-fun res!126209 () Bool)

(assert (=> b!150550 (=> (not res!126209) (not e!100543))))

(assert (=> b!150550 (= res!126209 (isPrefixOf!0 thiss!1634 (_2!7101 lt!235287)))))

(declare-fun b!150551 () Bool)

(assert (=> b!150551 (= e!100545 (invariant!0 (currentBit!6444 thiss!1634) (currentByte!6449 thiss!1634) (size!3048 (buf!3529 (_2!7101 lt!235287)))))))

(declare-fun b!150552 () Bool)

(assert (=> b!150552 (= e!100537 (not (arrayRangesEq!364 arr!237 (_2!7102 lt!235285) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!150553 () Bool)

(declare-fun res!126207 () Bool)

(assert (=> b!150553 (=> (not res!126207) (not e!100541))))

(assert (=> b!150553 (= res!126207 (bvslt from!447 to!404))))

(declare-fun b!150554 () Bool)

(assert (=> b!150554 (= e!100542 (= (_2!7104 lt!235276) (_2!7104 lt!235269)))))

(declare-fun b!150555 () Bool)

(declare-fun res!126203 () Bool)

(assert (=> b!150555 (=> (not res!126203) (not e!100543))))

(assert (=> b!150555 (= res!126203 (= (bitIndex!0 (size!3048 (buf!3529 (_2!7101 lt!235287))) (currentByte!6449 (_2!7101 lt!235287)) (currentBit!6444 (_2!7101 lt!235287))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3048 (buf!3529 thiss!1634)) (currentByte!6449 thiss!1634) (currentBit!6444 thiss!1634)))))))

(declare-fun b!150556 () Bool)

(declare-fun res!126196 () Bool)

(assert (=> b!150556 (=> res!126196 e!100544)))

(assert (=> b!150556 (= res!126196 (bvslt lt!235275 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!150557 () Bool)

(assert (=> b!150557 (= e!100539 e!100546)))

(declare-fun res!126204 () Bool)

(assert (=> b!150557 (=> (not res!126204) (not e!100546))))

(assert (=> b!150557 (= res!126204 (= (bitIndex!0 (size!3048 (buf!3529 (_2!7101 lt!235270))) (currentByte!6449 (_2!7101 lt!235270)) (currentBit!6444 (_2!7101 lt!235270))) (bvadd (bitIndex!0 (size!3048 (buf!3529 (_2!7101 lt!235287))) (currentByte!6449 (_2!7101 lt!235287)) (currentBit!6444 (_2!7101 lt!235287))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!235281))))))

(assert (=> b!150557 (= lt!235281 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (= (and start!28942 res!126200) b!150541))

(assert (= (and b!150541 res!126193) b!150553))

(assert (= (and b!150553 res!126207) b!150549))

(assert (= (and b!150549 res!126208) b!150547))

(assert (= (and b!150547 res!126194) b!150555))

(assert (= (and b!150555 res!126203) b!150550))

(assert (= (and b!150550 res!126209) b!150545))

(assert (= (and b!150547 res!126205) b!150557))

(assert (= (and b!150557 res!126204) b!150546))

(assert (= (and b!150546 res!126198) b!150544))

(assert (= (and b!150544 (not res!126201)) b!150552))

(assert (= (and b!150547 res!126197) b!150551))

(assert (= (and b!150547 res!126202) b!150554))

(assert (= (and b!150547 (not res!126206)) b!150548))

(assert (= (and b!150548 (not res!126195)) b!150542))

(assert (= (and b!150542 (not res!126199)) b!150556))

(assert (= (and b!150556 (not res!126196)) b!150543))

(assert (= start!28942 b!150540))

(declare-fun m!234685 () Bool)

(assert (=> b!150541 m!234685))

(declare-fun m!234687 () Bool)

(assert (=> b!150551 m!234687))

(declare-fun m!234689 () Bool)

(assert (=> b!150549 m!234689))

(declare-fun m!234691 () Bool)

(assert (=> b!150550 m!234691))

(declare-fun m!234693 () Bool)

(assert (=> b!150548 m!234693))

(declare-fun m!234695 () Bool)

(assert (=> b!150548 m!234695))

(declare-fun m!234697 () Bool)

(assert (=> b!150548 m!234697))

(declare-fun m!234699 () Bool)

(assert (=> b!150548 m!234699))

(declare-fun m!234701 () Bool)

(assert (=> start!28942 m!234701))

(declare-fun m!234703 () Bool)

(assert (=> start!28942 m!234703))

(declare-fun m!234705 () Bool)

(assert (=> b!150547 m!234705))

(declare-fun m!234707 () Bool)

(assert (=> b!150547 m!234707))

(declare-fun m!234709 () Bool)

(assert (=> b!150547 m!234709))

(declare-fun m!234711 () Bool)

(assert (=> b!150547 m!234711))

(declare-fun m!234713 () Bool)

(assert (=> b!150547 m!234713))

(declare-fun m!234715 () Bool)

(assert (=> b!150547 m!234715))

(declare-fun m!234717 () Bool)

(assert (=> b!150547 m!234717))

(declare-fun m!234719 () Bool)

(assert (=> b!150547 m!234719))

(declare-fun m!234721 () Bool)

(assert (=> b!150547 m!234721))

(declare-fun m!234723 () Bool)

(assert (=> b!150547 m!234723))

(declare-fun m!234725 () Bool)

(assert (=> b!150547 m!234725))

(declare-fun m!234727 () Bool)

(assert (=> b!150547 m!234727))

(declare-fun m!234729 () Bool)

(assert (=> b!150547 m!234729))

(declare-fun m!234731 () Bool)

(assert (=> b!150547 m!234731))

(declare-fun m!234733 () Bool)

(assert (=> b!150547 m!234733))

(declare-fun m!234735 () Bool)

(assert (=> b!150547 m!234735))

(declare-fun m!234737 () Bool)

(assert (=> b!150547 m!234737))

(declare-fun m!234739 () Bool)

(assert (=> b!150547 m!234739))

(declare-fun m!234741 () Bool)

(assert (=> b!150547 m!234741))

(declare-fun m!234743 () Bool)

(assert (=> b!150547 m!234743))

(declare-fun m!234745 () Bool)

(assert (=> b!150547 m!234745))

(assert (=> b!150547 m!234715))

(declare-fun m!234747 () Bool)

(assert (=> b!150547 m!234747))

(declare-fun m!234749 () Bool)

(assert (=> b!150547 m!234749))

(declare-fun m!234751 () Bool)

(assert (=> b!150547 m!234751))

(declare-fun m!234753 () Bool)

(assert (=> b!150547 m!234753))

(assert (=> b!150547 m!234729))

(declare-fun m!234755 () Bool)

(assert (=> b!150547 m!234755))

(declare-fun m!234757 () Bool)

(assert (=> b!150547 m!234757))

(declare-fun m!234759 () Bool)

(assert (=> b!150546 m!234759))

(declare-fun m!234761 () Bool)

(assert (=> b!150555 m!234761))

(declare-fun m!234763 () Bool)

(assert (=> b!150555 m!234763))

(declare-fun m!234765 () Bool)

(assert (=> b!150544 m!234765))

(declare-fun m!234767 () Bool)

(assert (=> b!150544 m!234767))

(declare-fun m!234769 () Bool)

(assert (=> b!150544 m!234769))

(assert (=> b!150544 m!234707))

(declare-fun m!234771 () Bool)

(assert (=> b!150543 m!234771))

(assert (=> b!150545 m!234729))

(declare-fun m!234773 () Bool)

(assert (=> b!150545 m!234773))

(declare-fun m!234775 () Bool)

(assert (=> b!150545 m!234775))

(declare-fun m!234777 () Bool)

(assert (=> b!150540 m!234777))

(declare-fun m!234779 () Bool)

(assert (=> b!150542 m!234779))

(assert (=> b!150542 m!234763))

(assert (=> b!150557 m!234779))

(assert (=> b!150557 m!234761))

(declare-fun m!234781 () Bool)

(assert (=> b!150552 m!234781))

(push 1)

(assert (not b!150549))

(assert (not b!150540))

(assert (not b!150551))

(assert (not b!150552))

(assert (not b!150548))

(assert (not b!150557))

(assert (not b!150547))

(assert (not b!150543))

(assert (not start!28942))

(assert (not b!150555))

(assert (not b!150550))

(assert (not b!150541))

(assert (not b!150542))

(assert (not b!150546))

(assert (not b!150544))

(assert (not b!150545))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!48882 () Bool)

(declare-fun res!126236 () Bool)

(declare-fun e!100572 () Bool)

(assert (=> d!48882 (=> res!126236 e!100572)))

(assert (=> d!48882 (= res!126236 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!48882 (= (arrayRangesEq!364 arr!237 (_2!7102 lt!235290) #b00000000000000000000000000000000 to!404) e!100572)))

(declare-fun b!150592 () Bool)

(declare-fun e!100573 () Bool)

(assert (=> b!150592 (= e!100572 e!100573)))

(declare-fun res!126237 () Bool)

(assert (=> b!150592 (=> (not res!126237) (not e!100573))))

(assert (=> b!150592 (= res!126237 (= (select (arr!3841 arr!237) #b00000000000000000000000000000000) (select (arr!3841 (_2!7102 lt!235290)) #b00000000000000000000000000000000)))))

(declare-fun b!150593 () Bool)

(assert (=> b!150593 (= e!100573 (arrayRangesEq!364 arr!237 (_2!7102 lt!235290) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!48882 (not res!126236)) b!150592))

(assert (= (and b!150592 res!126237) b!150593))

(declare-fun m!234867 () Bool)

(assert (=> b!150592 m!234867))

(declare-fun m!234869 () Bool)

(assert (=> b!150592 m!234869))

(declare-fun m!234871 () Bool)

(assert (=> b!150593 m!234871))

(assert (=> b!150548 d!48882))

(declare-fun d!48884 () Bool)

(assert (=> d!48884 (arrayRangesEq!364 arr!237 (_2!7102 lt!235290) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!235400 () Unit!9496)

(declare-fun choose!94 (array!6735 array!6735 array!6735 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9496)

(assert (=> d!48884 (= lt!235400 (choose!94 arr!237 (_2!7102 lt!235286) (_2!7102 lt!235290) #b00000000000000000000000000000000 to!404 to!404))))

(assert (=> d!48884 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 to!404) (bvsle to!404 to!404))))

(assert (=> d!48884 (= (arrayRangesEqTransitive!79 arr!237 (_2!7102 lt!235286) (_2!7102 lt!235290) #b00000000000000000000000000000000 to!404 to!404) lt!235400)))

(declare-fun bs!11948 () Bool)

(assert (= bs!11948 d!48884))

(assert (=> bs!11948 m!234693))

(declare-fun m!234873 () Bool)

(assert (=> bs!11948 m!234873))

(assert (=> b!150548 d!48884))

(declare-fun d!48886 () Bool)

(declare-fun res!126242 () Bool)

(declare-fun e!100576 () Bool)

(assert (=> d!48886 (=> res!126242 e!100576)))

(assert (=> d!48886 (= res!126242 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!48886 (= (arrayRangesEq!364 (_2!7102 lt!235286) (_2!7102 lt!235290) #b00000000000000000000000000000000 to!404) e!100576)))

(declare-fun b!150598 () Bool)

(declare-fun e!100577 () Bool)

(assert (=> b!150598 (= e!100576 e!100577)))

(declare-fun res!126243 () Bool)

(assert (=> b!150598 (=> (not res!126243) (not e!100577))))

(assert (=> b!150598 (= res!126243 (= (select (arr!3841 (_2!7102 lt!235286)) #b00000000000000000000000000000000) (select (arr!3841 (_2!7102 lt!235290)) #b00000000000000000000000000000000)))))

(declare-fun b!150599 () Bool)

(assert (=> b!150599 (= e!100577 (arrayRangesEq!364 (_2!7102 lt!235286) (_2!7102 lt!235290) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!48886 (not res!126242)) b!150598))

(assert (= (and b!150598 res!126243) b!150599))

(declare-fun m!234875 () Bool)

(assert (=> b!150598 m!234875))

(assert (=> b!150598 m!234869))

(declare-fun m!234877 () Bool)

(assert (=> b!150599 m!234877))

(assert (=> b!150548 d!48886))

(declare-fun d!48888 () Bool)

(assert (=> d!48888 (arrayRangesEq!364 (_2!7102 lt!235286) (_2!7102 lt!235290) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!235416 () Unit!9496)

(declare-fun choose!95 (array!6735 array!6735 (_ BitVec 32) (_ BitVec 32)) Unit!9496)

(assert (=> d!48888 (= lt!235416 (choose!95 (_2!7102 lt!235290) (_2!7102 lt!235286) #b00000000000000000000000000000000 to!404))))

(assert (=> d!48888 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 to!404) (bvsle to!404 (size!3048 (_2!7102 lt!235290))))))

(assert (=> d!48888 (= (arrayRangesEqSymmetricLemma!96 (_2!7102 lt!235290) (_2!7102 lt!235286) #b00000000000000000000000000000000 to!404) lt!235416)))

(declare-fun bs!11950 () Bool)

(assert (= bs!11950 d!48888))

(assert (=> bs!11950 m!234697))

(declare-fun m!234889 () Bool)

(assert (=> bs!11950 m!234889))

(assert (=> b!150548 d!48888))

(declare-fun d!48898 () Bool)

(assert (=> d!48898 (= (invariant!0 (currentBit!6444 thiss!1634) (currentByte!6449 thiss!1634) (size!3048 (buf!3529 thiss!1634))) (and (bvsge (currentBit!6444 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6444 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6449 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6449 thiss!1634) (size!3048 (buf!3529 thiss!1634))) (and (= (currentBit!6444 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6449 thiss!1634) (size!3048 (buf!3529 thiss!1634)))))))))

(assert (=> b!150549 d!48898))

(declare-fun d!48902 () Bool)

(assert (=> d!48902 (= (array_inv!2837 (buf!3529 thiss!1634)) (bvsge (size!3048 (buf!3529 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!150540 d!48902))

(declare-fun d!48904 () Bool)

(assert (=> d!48904 (= (invariant!0 (currentBit!6444 thiss!1634) (currentByte!6449 thiss!1634) (size!3048 (buf!3529 (_2!7101 lt!235287)))) (and (bvsge (currentBit!6444 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6444 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6449 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6449 thiss!1634) (size!3048 (buf!3529 (_2!7101 lt!235287)))) (and (= (currentBit!6444 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6449 thiss!1634) (size!3048 (buf!3529 (_2!7101 lt!235287))))))))))

(assert (=> b!150551 d!48904))

(declare-fun d!48906 () Bool)

(declare-fun res!126266 () Bool)

(declare-fun e!100591 () Bool)

(assert (=> d!48906 (=> (not res!126266) (not e!100591))))

(assert (=> d!48906 (= res!126266 (= (size!3048 (buf!3529 thiss!1634)) (size!3048 (buf!3529 (_2!7101 lt!235287)))))))

(assert (=> d!48906 (= (isPrefixOf!0 thiss!1634 (_2!7101 lt!235287)) e!100591)))

(declare-fun b!150621 () Bool)

(declare-fun res!126267 () Bool)

(assert (=> b!150621 (=> (not res!126267) (not e!100591))))

(assert (=> b!150621 (= res!126267 (bvsle (bitIndex!0 (size!3048 (buf!3529 thiss!1634)) (currentByte!6449 thiss!1634) (currentBit!6444 thiss!1634)) (bitIndex!0 (size!3048 (buf!3529 (_2!7101 lt!235287))) (currentByte!6449 (_2!7101 lt!235287)) (currentBit!6444 (_2!7101 lt!235287)))))))

(declare-fun b!150622 () Bool)

(declare-fun e!100592 () Bool)

(assert (=> b!150622 (= e!100591 e!100592)))

(declare-fun res!126265 () Bool)

(assert (=> b!150622 (=> res!126265 e!100592)))

(assert (=> b!150622 (= res!126265 (= (size!3048 (buf!3529 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!150623 () Bool)

(declare-fun arrayBitRangesEq!0 (array!6735 array!6735 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!150623 (= e!100592 (arrayBitRangesEq!0 (buf!3529 thiss!1634) (buf!3529 (_2!7101 lt!235287)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3048 (buf!3529 thiss!1634)) (currentByte!6449 thiss!1634) (currentBit!6444 thiss!1634))))))

(assert (= (and d!48906 res!126266) b!150621))

(assert (= (and b!150621 res!126267) b!150622))

(assert (= (and b!150622 (not res!126265)) b!150623))

(assert (=> b!150621 m!234763))

(assert (=> b!150621 m!234761))

(assert (=> b!150623 m!234763))

(assert (=> b!150623 m!234763))

(declare-fun m!234909 () Bool)

(assert (=> b!150623 m!234909))

(assert (=> b!150550 d!48906))

(declare-fun d!48924 () Bool)

(declare-fun res!126268 () Bool)

(declare-fun e!100593 () Bool)

(assert (=> d!48924 (=> res!126268 e!100593)))

(assert (=> d!48924 (= res!126268 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!48924 (= (arrayRangesEq!364 arr!237 (_2!7102 lt!235285) #b00000000000000000000000000000000 to!404) e!100593)))

(declare-fun b!150624 () Bool)

(declare-fun e!100594 () Bool)

(assert (=> b!150624 (= e!100593 e!100594)))

(declare-fun res!126269 () Bool)

(assert (=> b!150624 (=> (not res!126269) (not e!100594))))

(assert (=> b!150624 (= res!126269 (= (select (arr!3841 arr!237) #b00000000000000000000000000000000) (select (arr!3841 (_2!7102 lt!235285)) #b00000000000000000000000000000000)))))

(declare-fun b!150625 () Bool)

(assert (=> b!150625 (= e!100594 (arrayRangesEq!364 arr!237 (_2!7102 lt!235285) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!48924 (not res!126268)) b!150624))

(assert (= (and b!150624 res!126269) b!150625))

(assert (=> b!150624 m!234867))

(declare-fun m!234911 () Bool)

(assert (=> b!150624 m!234911))

(declare-fun m!234913 () Bool)

(assert (=> b!150625 m!234913))

(assert (=> b!150552 d!48924))

(declare-fun d!48926 () Bool)

(assert (=> d!48926 (= (array_inv!2837 arr!237) (bvsge (size!3048 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!28942 d!48926))

(declare-fun d!48928 () Bool)

(assert (=> d!48928 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6444 thiss!1634) (currentByte!6449 thiss!1634) (size!3048 (buf!3529 thiss!1634))))))

(declare-fun bs!11958 () Bool)

(assert (= bs!11958 d!48928))

(assert (=> bs!11958 m!234689))

(assert (=> start!28942 d!48928))

(declare-fun d!48931 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!48931 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3048 (buf!3529 thiss!1634))) ((_ sign_extend 32) (currentByte!6449 thiss!1634)) ((_ sign_extend 32) (currentBit!6444 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3048 (buf!3529 thiss!1634))) ((_ sign_extend 32) (currentByte!6449 thiss!1634)) ((_ sign_extend 32) (currentBit!6444 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11959 () Bool)

(assert (= bs!11959 d!48931))

(declare-fun m!234915 () Bool)

(assert (=> bs!11959 m!234915))

(assert (=> b!150541 d!48931))

(declare-fun d!48933 () Bool)

(assert (=> d!48933 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3048 (buf!3529 thiss!1634))) ((_ sign_extend 32) (currentByte!6449 thiss!1634)) ((_ sign_extend 32) (currentBit!6444 thiss!1634)) lt!235275) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3048 (buf!3529 thiss!1634))) ((_ sign_extend 32) (currentByte!6449 thiss!1634)) ((_ sign_extend 32) (currentBit!6444 thiss!1634))) lt!235275))))

(declare-fun bs!11960 () Bool)

(assert (= bs!11960 d!48933))

(assert (=> bs!11960 m!234915))

(assert (=> b!150543 d!48933))

(declare-fun d!48935 () Bool)

(declare-fun e!100606 () Bool)

(assert (=> d!48935 e!100606))

(declare-fun res!126284 () Bool)

(assert (=> d!48935 (=> (not res!126284) (not e!100606))))

(declare-fun lt!235475 () (_ BitVec 64))

(declare-fun lt!235474 () (_ BitVec 64))

(declare-fun lt!235477 () (_ BitVec 64))

(assert (=> d!48935 (= res!126284 (= lt!235474 (bvsub lt!235475 lt!235477)))))

(assert (=> d!48935 (or (= (bvand lt!235475 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!235477 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!235475 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!235475 lt!235477) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!48935 (= lt!235477 (remainingBits!0 ((_ sign_extend 32) (size!3048 (buf!3529 (_2!7101 lt!235270)))) ((_ sign_extend 32) (currentByte!6449 (_2!7101 lt!235270))) ((_ sign_extend 32) (currentBit!6444 (_2!7101 lt!235270)))))))

(declare-fun lt!235473 () (_ BitVec 64))

(declare-fun lt!235476 () (_ BitVec 64))

(assert (=> d!48935 (= lt!235475 (bvmul lt!235473 lt!235476))))

(assert (=> d!48935 (or (= lt!235473 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!235476 (bvsdiv (bvmul lt!235473 lt!235476) lt!235473)))))

(assert (=> d!48935 (= lt!235476 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!48935 (= lt!235473 ((_ sign_extend 32) (size!3048 (buf!3529 (_2!7101 lt!235270)))))))

(assert (=> d!48935 (= lt!235474 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6449 (_2!7101 lt!235270))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6444 (_2!7101 lt!235270)))))))

(assert (=> d!48935 (invariant!0 (currentBit!6444 (_2!7101 lt!235270)) (currentByte!6449 (_2!7101 lt!235270)) (size!3048 (buf!3529 (_2!7101 lt!235270))))))

(assert (=> d!48935 (= (bitIndex!0 (size!3048 (buf!3529 (_2!7101 lt!235270))) (currentByte!6449 (_2!7101 lt!235270)) (currentBit!6444 (_2!7101 lt!235270))) lt!235474)))

(declare-fun b!150642 () Bool)

(declare-fun res!126285 () Bool)

(assert (=> b!150642 (=> (not res!126285) (not e!100606))))

(assert (=> b!150642 (= res!126285 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!235474))))

(declare-fun b!150643 () Bool)

(declare-fun lt!235478 () (_ BitVec 64))

(assert (=> b!150643 (= e!100606 (bvsle lt!235474 (bvmul lt!235478 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!150643 (or (= lt!235478 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!235478 #b0000000000000000000000000000000000000000000000000000000000001000) lt!235478)))))

(assert (=> b!150643 (= lt!235478 ((_ sign_extend 32) (size!3048 (buf!3529 (_2!7101 lt!235270)))))))

(assert (= (and d!48935 res!126284) b!150642))

(assert (= (and b!150642 res!126285) b!150643))

(declare-fun m!234949 () Bool)

(assert (=> d!48935 m!234949))

(declare-fun m!234951 () Bool)

(assert (=> d!48935 m!234951))

(assert (=> b!150542 d!48935))

(declare-fun d!48945 () Bool)

(declare-fun e!100607 () Bool)

(assert (=> d!48945 e!100607))

(declare-fun res!126286 () Bool)

(assert (=> d!48945 (=> (not res!126286) (not e!100607))))

(declare-fun lt!235481 () (_ BitVec 64))

(declare-fun lt!235483 () (_ BitVec 64))

(declare-fun lt!235480 () (_ BitVec 64))

(assert (=> d!48945 (= res!126286 (= lt!235480 (bvsub lt!235481 lt!235483)))))

(assert (=> d!48945 (or (= (bvand lt!235481 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!235483 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!235481 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!235481 lt!235483) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!48945 (= lt!235483 (remainingBits!0 ((_ sign_extend 32) (size!3048 (buf!3529 thiss!1634))) ((_ sign_extend 32) (currentByte!6449 thiss!1634)) ((_ sign_extend 32) (currentBit!6444 thiss!1634))))))

(declare-fun lt!235479 () (_ BitVec 64))

(declare-fun lt!235482 () (_ BitVec 64))

(assert (=> d!48945 (= lt!235481 (bvmul lt!235479 lt!235482))))

(assert (=> d!48945 (or (= lt!235479 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!235482 (bvsdiv (bvmul lt!235479 lt!235482) lt!235479)))))

(assert (=> d!48945 (= lt!235482 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!48945 (= lt!235479 ((_ sign_extend 32) (size!3048 (buf!3529 thiss!1634))))))

(assert (=> d!48945 (= lt!235480 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6449 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6444 thiss!1634))))))

(assert (=> d!48945 (invariant!0 (currentBit!6444 thiss!1634) (currentByte!6449 thiss!1634) (size!3048 (buf!3529 thiss!1634)))))

(assert (=> d!48945 (= (bitIndex!0 (size!3048 (buf!3529 thiss!1634)) (currentByte!6449 thiss!1634) (currentBit!6444 thiss!1634)) lt!235480)))

(declare-fun b!150644 () Bool)

(declare-fun res!126287 () Bool)

(assert (=> b!150644 (=> (not res!126287) (not e!100607))))

(assert (=> b!150644 (= res!126287 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!235480))))

(declare-fun b!150645 () Bool)

(declare-fun lt!235484 () (_ BitVec 64))

(assert (=> b!150645 (= e!100607 (bvsle lt!235480 (bvmul lt!235484 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!150645 (or (= lt!235484 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!235484 #b0000000000000000000000000000000000000000000000000000000000001000) lt!235484)))))

(assert (=> b!150645 (= lt!235484 ((_ sign_extend 32) (size!3048 (buf!3529 thiss!1634))))))

(assert (= (and d!48945 res!126286) b!150644))

(assert (= (and b!150644 res!126287) b!150645))

(assert (=> d!48945 m!234915))

(assert (=> d!48945 m!234689))

(assert (=> b!150542 d!48945))

(declare-datatypes ((tuple3!590 0))(
  ( (tuple3!591 (_1!7107 Unit!9496) (_2!7107 BitStream!5354) (_3!368 array!6735)) )
))
(declare-fun lt!235508 () tuple3!590)

(declare-fun d!48947 () Bool)

(declare-fun readByteArrayLoop!0 (BitStream!5354 array!6735 (_ BitVec 32) (_ BitVec 32)) tuple3!590)

(assert (=> d!48947 (= lt!235508 (readByteArrayLoop!0 (_1!7103 lt!235272) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!48947 (= (readByteArrayLoopPure!0 (_1!7103 lt!235272) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13471 (_2!7107 lt!235508) (_3!368 lt!235508)))))

(declare-fun bs!11965 () Bool)

(assert (= bs!11965 d!48947))

(declare-fun m!234971 () Bool)

(assert (=> bs!11965 m!234971))

(assert (=> b!150544 d!48947))

(declare-fun d!48961 () Bool)

(assert (=> d!48961 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3048 (buf!3529 (_2!7101 lt!235270)))) ((_ sign_extend 32) (currentByte!6449 (_2!7101 lt!235287))) ((_ sign_extend 32) (currentBit!6444 (_2!7101 lt!235287))) lt!235281) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3048 (buf!3529 (_2!7101 lt!235270)))) ((_ sign_extend 32) (currentByte!6449 (_2!7101 lt!235287))) ((_ sign_extend 32) (currentBit!6444 (_2!7101 lt!235287)))) lt!235281))))

(declare-fun bs!11966 () Bool)

(assert (= bs!11966 d!48961))

(declare-fun m!234973 () Bool)

(assert (=> bs!11966 m!234973))

(assert (=> b!150544 d!48961))

(declare-fun d!48963 () Bool)

(assert (=> d!48963 (validate_offset_bits!1 ((_ sign_extend 32) (size!3048 (buf!3529 (_2!7101 lt!235270)))) ((_ sign_extend 32) (currentByte!6449 (_2!7101 lt!235287))) ((_ sign_extend 32) (currentBit!6444 (_2!7101 lt!235287))) lt!235281)))

(declare-fun lt!235511 () Unit!9496)

(declare-fun choose!9 (BitStream!5354 array!6735 (_ BitVec 64) BitStream!5354) Unit!9496)

(assert (=> d!48963 (= lt!235511 (choose!9 (_2!7101 lt!235287) (buf!3529 (_2!7101 lt!235270)) lt!235281 (BitStream!5355 (buf!3529 (_2!7101 lt!235270)) (currentByte!6449 (_2!7101 lt!235287)) (currentBit!6444 (_2!7101 lt!235287)))))))

(assert (=> d!48963 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!7101 lt!235287) (buf!3529 (_2!7101 lt!235270)) lt!235281) lt!235511)))

(declare-fun bs!11967 () Bool)

(assert (= bs!11967 d!48963))

(assert (=> bs!11967 m!234767))

(declare-fun m!234975 () Bool)

(assert (=> bs!11967 m!234975))

(assert (=> b!150544 d!48963))

(declare-fun b!150670 () Bool)

(declare-fun e!100619 () Unit!9496)

(declare-fun Unit!9501 () Unit!9496)

(assert (=> b!150670 (= e!100619 Unit!9501)))

(declare-fun b!150671 () Bool)

(declare-fun res!126310 () Bool)

(declare-fun e!100620 () Bool)

(assert (=> b!150671 (=> (not res!126310) (not e!100620))))

(declare-fun lt!235592 () tuple2!13472)

(assert (=> b!150671 (= res!126310 (isPrefixOf!0 (_1!7103 lt!235592) (_2!7101 lt!235287)))))

(declare-fun d!48965 () Bool)

(assert (=> d!48965 e!100620))

(declare-fun res!126308 () Bool)

(assert (=> d!48965 (=> (not res!126308) (not e!100620))))

(assert (=> d!48965 (= res!126308 (isPrefixOf!0 (_1!7103 lt!235592) (_2!7103 lt!235592)))))

(declare-fun lt!235590 () BitStream!5354)

(assert (=> d!48965 (= lt!235592 (tuple2!13473 lt!235590 (_2!7101 lt!235270)))))

(declare-fun lt!235580 () Unit!9496)

(declare-fun lt!235595 () Unit!9496)

(assert (=> d!48965 (= lt!235580 lt!235595)))

(assert (=> d!48965 (isPrefixOf!0 lt!235590 (_2!7101 lt!235270))))

(assert (=> d!48965 (= lt!235595 (lemmaIsPrefixTransitive!0 lt!235590 (_2!7101 lt!235270) (_2!7101 lt!235270)))))

(declare-fun lt!235593 () Unit!9496)

(declare-fun lt!235584 () Unit!9496)

(assert (=> d!48965 (= lt!235593 lt!235584)))

(assert (=> d!48965 (isPrefixOf!0 lt!235590 (_2!7101 lt!235270))))

(assert (=> d!48965 (= lt!235584 (lemmaIsPrefixTransitive!0 lt!235590 (_2!7101 lt!235287) (_2!7101 lt!235270)))))

(declare-fun lt!235597 () Unit!9496)

(assert (=> d!48965 (= lt!235597 e!100619)))

(declare-fun c!8064 () Bool)

(assert (=> d!48965 (= c!8064 (not (= (size!3048 (buf!3529 (_2!7101 lt!235287))) #b00000000000000000000000000000000)))))

(declare-fun lt!235588 () Unit!9496)

(declare-fun lt!235598 () Unit!9496)

(assert (=> d!48965 (= lt!235588 lt!235598)))

(assert (=> d!48965 (isPrefixOf!0 (_2!7101 lt!235270) (_2!7101 lt!235270))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5354) Unit!9496)

(assert (=> d!48965 (= lt!235598 (lemmaIsPrefixRefl!0 (_2!7101 lt!235270)))))

(declare-fun lt!235594 () Unit!9496)

(declare-fun lt!235582 () Unit!9496)

(assert (=> d!48965 (= lt!235594 lt!235582)))

(assert (=> d!48965 (= lt!235582 (lemmaIsPrefixRefl!0 (_2!7101 lt!235270)))))

(declare-fun lt!235591 () Unit!9496)

(declare-fun lt!235581 () Unit!9496)

(assert (=> d!48965 (= lt!235591 lt!235581)))

(assert (=> d!48965 (isPrefixOf!0 lt!235590 lt!235590)))

(assert (=> d!48965 (= lt!235581 (lemmaIsPrefixRefl!0 lt!235590))))

(declare-fun lt!235596 () Unit!9496)

(declare-fun lt!235579 () Unit!9496)

(assert (=> d!48965 (= lt!235596 lt!235579)))

(assert (=> d!48965 (isPrefixOf!0 (_2!7101 lt!235287) (_2!7101 lt!235287))))

(assert (=> d!48965 (= lt!235579 (lemmaIsPrefixRefl!0 (_2!7101 lt!235287)))))

(assert (=> d!48965 (= lt!235590 (BitStream!5355 (buf!3529 (_2!7101 lt!235270)) (currentByte!6449 (_2!7101 lt!235287)) (currentBit!6444 (_2!7101 lt!235287))))))

(assert (=> d!48965 (isPrefixOf!0 (_2!7101 lt!235287) (_2!7101 lt!235270))))

(assert (=> d!48965 (= (reader!0 (_2!7101 lt!235287) (_2!7101 lt!235270)) lt!235592)))

(declare-fun b!150672 () Bool)

(declare-fun lt!235585 () (_ BitVec 64))

(declare-fun lt!235589 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!5354 (_ BitVec 64)) BitStream!5354)

(assert (=> b!150672 (= e!100620 (= (_1!7103 lt!235592) (withMovedBitIndex!0 (_2!7103 lt!235592) (bvsub lt!235585 lt!235589))))))

(assert (=> b!150672 (or (= (bvand lt!235585 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!235589 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!235585 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!235585 lt!235589) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!150672 (= lt!235589 (bitIndex!0 (size!3048 (buf!3529 (_2!7101 lt!235270))) (currentByte!6449 (_2!7101 lt!235270)) (currentBit!6444 (_2!7101 lt!235270))))))

(assert (=> b!150672 (= lt!235585 (bitIndex!0 (size!3048 (buf!3529 (_2!7101 lt!235287))) (currentByte!6449 (_2!7101 lt!235287)) (currentBit!6444 (_2!7101 lt!235287))))))

(declare-fun b!150673 () Bool)

(declare-fun res!126309 () Bool)

(assert (=> b!150673 (=> (not res!126309) (not e!100620))))

(assert (=> b!150673 (= res!126309 (isPrefixOf!0 (_2!7103 lt!235592) (_2!7101 lt!235270)))))

(declare-fun b!150674 () Bool)

(declare-fun lt!235587 () Unit!9496)

(assert (=> b!150674 (= e!100619 lt!235587)))

(declare-fun lt!235586 () (_ BitVec 64))

(assert (=> b!150674 (= lt!235586 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!235583 () (_ BitVec 64))

(assert (=> b!150674 (= lt!235583 (bitIndex!0 (size!3048 (buf!3529 (_2!7101 lt!235287))) (currentByte!6449 (_2!7101 lt!235287)) (currentBit!6444 (_2!7101 lt!235287))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6735 array!6735 (_ BitVec 64) (_ BitVec 64)) Unit!9496)

(assert (=> b!150674 (= lt!235587 (arrayBitRangesEqSymmetric!0 (buf!3529 (_2!7101 lt!235287)) (buf!3529 (_2!7101 lt!235270)) lt!235586 lt!235583))))

(assert (=> b!150674 (arrayBitRangesEq!0 (buf!3529 (_2!7101 lt!235270)) (buf!3529 (_2!7101 lt!235287)) lt!235586 lt!235583)))

(assert (= (and d!48965 c!8064) b!150674))

(assert (= (and d!48965 (not c!8064)) b!150670))

(assert (= (and d!48965 res!126308) b!150671))

(assert (= (and b!150671 res!126310) b!150673))

(assert (= (and b!150673 res!126309) b!150672))

(declare-fun m!234997 () Bool)

(assert (=> b!150672 m!234997))

(assert (=> b!150672 m!234779))

(assert (=> b!150672 m!234761))

(declare-fun m!234999 () Bool)

(assert (=> b!150671 m!234999))

(assert (=> b!150674 m!234761))

(declare-fun m!235001 () Bool)

(assert (=> b!150674 m!235001))

(declare-fun m!235003 () Bool)

(assert (=> b!150674 m!235003))

(declare-fun m!235005 () Bool)

(assert (=> d!48965 m!235005))

(declare-fun m!235007 () Bool)

(assert (=> d!48965 m!235007))

(declare-fun m!235009 () Bool)

(assert (=> d!48965 m!235009))

(declare-fun m!235011 () Bool)

(assert (=> d!48965 m!235011))

(declare-fun m!235013 () Bool)

(assert (=> d!48965 m!235013))

(declare-fun m!235015 () Bool)

(assert (=> d!48965 m!235015))

(declare-fun m!235017 () Bool)

(assert (=> d!48965 m!235017))

(declare-fun m!235019 () Bool)

(assert (=> d!48965 m!235019))

(declare-fun m!235021 () Bool)

(assert (=> d!48965 m!235021))

(declare-fun m!235023 () Bool)

(assert (=> d!48965 m!235023))

(assert (=> d!48965 m!234759))

(declare-fun m!235025 () Bool)

(assert (=> b!150673 m!235025))

(assert (=> b!150544 d!48965))

(declare-fun d!48971 () Bool)

(declare-fun e!100621 () Bool)

(assert (=> d!48971 e!100621))

(declare-fun res!126311 () Bool)

(assert (=> d!48971 (=> (not res!126311) (not e!100621))))

(declare-fun lt!235601 () (_ BitVec 64))

(declare-fun lt!235600 () (_ BitVec 64))

(declare-fun lt!235603 () (_ BitVec 64))

(assert (=> d!48971 (= res!126311 (= lt!235600 (bvsub lt!235601 lt!235603)))))

(assert (=> d!48971 (or (= (bvand lt!235601 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!235603 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!235601 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!235601 lt!235603) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!48971 (= lt!235603 (remainingBits!0 ((_ sign_extend 32) (size!3048 (buf!3529 (_2!7101 lt!235287)))) ((_ sign_extend 32) (currentByte!6449 (_2!7101 lt!235287))) ((_ sign_extend 32) (currentBit!6444 (_2!7101 lt!235287)))))))

(declare-fun lt!235599 () (_ BitVec 64))

(declare-fun lt!235602 () (_ BitVec 64))

(assert (=> d!48971 (= lt!235601 (bvmul lt!235599 lt!235602))))

(assert (=> d!48971 (or (= lt!235599 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!235602 (bvsdiv (bvmul lt!235599 lt!235602) lt!235599)))))

(assert (=> d!48971 (= lt!235602 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!48971 (= lt!235599 ((_ sign_extend 32) (size!3048 (buf!3529 (_2!7101 lt!235287)))))))

(assert (=> d!48971 (= lt!235600 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6449 (_2!7101 lt!235287))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6444 (_2!7101 lt!235287)))))))

(assert (=> d!48971 (invariant!0 (currentBit!6444 (_2!7101 lt!235287)) (currentByte!6449 (_2!7101 lt!235287)) (size!3048 (buf!3529 (_2!7101 lt!235287))))))

(assert (=> d!48971 (= (bitIndex!0 (size!3048 (buf!3529 (_2!7101 lt!235287))) (currentByte!6449 (_2!7101 lt!235287)) (currentBit!6444 (_2!7101 lt!235287))) lt!235600)))

(declare-fun b!150675 () Bool)

(declare-fun res!126312 () Bool)

(assert (=> b!150675 (=> (not res!126312) (not e!100621))))

(assert (=> b!150675 (= res!126312 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!235600))))

(declare-fun b!150676 () Bool)

(declare-fun lt!235604 () (_ BitVec 64))

(assert (=> b!150676 (= e!100621 (bvsle lt!235600 (bvmul lt!235604 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!150676 (or (= lt!235604 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!235604 #b0000000000000000000000000000000000000000000000000000000000001000) lt!235604)))))

(assert (=> b!150676 (= lt!235604 ((_ sign_extend 32) (size!3048 (buf!3529 (_2!7101 lt!235287)))))))

(assert (= (and d!48971 res!126311) b!150675))

(assert (= (and b!150675 res!126312) b!150676))

(declare-fun m!235027 () Bool)

(assert (=> d!48971 m!235027))

(declare-fun m!235029 () Bool)

(assert (=> d!48971 m!235029))

(assert (=> b!150555 d!48971))

(assert (=> b!150555 d!48945))

(declare-fun d!48973 () Bool)

(declare-datatypes ((tuple2!13478 0))(
  ( (tuple2!13479 (_1!7108 (_ BitVec 8)) (_2!7108 BitStream!5354)) )
))
(declare-fun lt!235607 () tuple2!13478)

(declare-fun readByte!0 (BitStream!5354) tuple2!13478)

(assert (=> d!48973 (= lt!235607 (readByte!0 (_1!7103 lt!235267)))))

(assert (=> d!48973 (= (readBytePure!0 (_1!7103 lt!235267)) (tuple2!13475 (_2!7108 lt!235607) (_1!7108 lt!235607)))))

(declare-fun bs!11970 () Bool)

(assert (= bs!11970 d!48973))

(declare-fun m!235031 () Bool)

(assert (=> bs!11970 m!235031))

(assert (=> b!150545 d!48973))

(declare-fun b!150677 () Bool)

(declare-fun e!100622 () Unit!9496)

(declare-fun Unit!9502 () Unit!9496)

(assert (=> b!150677 (= e!100622 Unit!9502)))

(declare-fun b!150678 () Bool)

(declare-fun res!126315 () Bool)

(declare-fun e!100623 () Bool)

(assert (=> b!150678 (=> (not res!126315) (not e!100623))))

(declare-fun lt!235621 () tuple2!13472)

(assert (=> b!150678 (= res!126315 (isPrefixOf!0 (_1!7103 lt!235621) thiss!1634))))

(declare-fun d!48975 () Bool)

(assert (=> d!48975 e!100623))

(declare-fun res!126313 () Bool)

(assert (=> d!48975 (=> (not res!126313) (not e!100623))))

(assert (=> d!48975 (= res!126313 (isPrefixOf!0 (_1!7103 lt!235621) (_2!7103 lt!235621)))))

(declare-fun lt!235619 () BitStream!5354)

(assert (=> d!48975 (= lt!235621 (tuple2!13473 lt!235619 (_2!7101 lt!235287)))))

(declare-fun lt!235609 () Unit!9496)

(declare-fun lt!235624 () Unit!9496)

(assert (=> d!48975 (= lt!235609 lt!235624)))

(assert (=> d!48975 (isPrefixOf!0 lt!235619 (_2!7101 lt!235287))))

(assert (=> d!48975 (= lt!235624 (lemmaIsPrefixTransitive!0 lt!235619 (_2!7101 lt!235287) (_2!7101 lt!235287)))))

(declare-fun lt!235622 () Unit!9496)

(declare-fun lt!235613 () Unit!9496)

(assert (=> d!48975 (= lt!235622 lt!235613)))

(assert (=> d!48975 (isPrefixOf!0 lt!235619 (_2!7101 lt!235287))))

(assert (=> d!48975 (= lt!235613 (lemmaIsPrefixTransitive!0 lt!235619 thiss!1634 (_2!7101 lt!235287)))))

(declare-fun lt!235626 () Unit!9496)

(assert (=> d!48975 (= lt!235626 e!100622)))

(declare-fun c!8065 () Bool)

(assert (=> d!48975 (= c!8065 (not (= (size!3048 (buf!3529 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!235617 () Unit!9496)

(declare-fun lt!235627 () Unit!9496)

(assert (=> d!48975 (= lt!235617 lt!235627)))

(assert (=> d!48975 (isPrefixOf!0 (_2!7101 lt!235287) (_2!7101 lt!235287))))

(assert (=> d!48975 (= lt!235627 (lemmaIsPrefixRefl!0 (_2!7101 lt!235287)))))

(declare-fun lt!235623 () Unit!9496)

(declare-fun lt!235611 () Unit!9496)

(assert (=> d!48975 (= lt!235623 lt!235611)))

(assert (=> d!48975 (= lt!235611 (lemmaIsPrefixRefl!0 (_2!7101 lt!235287)))))

(declare-fun lt!235620 () Unit!9496)

(declare-fun lt!235610 () Unit!9496)

(assert (=> d!48975 (= lt!235620 lt!235610)))

(assert (=> d!48975 (isPrefixOf!0 lt!235619 lt!235619)))

(assert (=> d!48975 (= lt!235610 (lemmaIsPrefixRefl!0 lt!235619))))

(declare-fun lt!235625 () Unit!9496)

(declare-fun lt!235608 () Unit!9496)

(assert (=> d!48975 (= lt!235625 lt!235608)))

(assert (=> d!48975 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!48975 (= lt!235608 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!48975 (= lt!235619 (BitStream!5355 (buf!3529 (_2!7101 lt!235287)) (currentByte!6449 thiss!1634) (currentBit!6444 thiss!1634)))))

(assert (=> d!48975 (isPrefixOf!0 thiss!1634 (_2!7101 lt!235287))))

(assert (=> d!48975 (= (reader!0 thiss!1634 (_2!7101 lt!235287)) lt!235621)))

(declare-fun lt!235614 () (_ BitVec 64))

(declare-fun lt!235618 () (_ BitVec 64))

(declare-fun b!150679 () Bool)

(assert (=> b!150679 (= e!100623 (= (_1!7103 lt!235621) (withMovedBitIndex!0 (_2!7103 lt!235621) (bvsub lt!235614 lt!235618))))))

(assert (=> b!150679 (or (= (bvand lt!235614 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!235618 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!235614 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!235614 lt!235618) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!150679 (= lt!235618 (bitIndex!0 (size!3048 (buf!3529 (_2!7101 lt!235287))) (currentByte!6449 (_2!7101 lt!235287)) (currentBit!6444 (_2!7101 lt!235287))))))

(assert (=> b!150679 (= lt!235614 (bitIndex!0 (size!3048 (buf!3529 thiss!1634)) (currentByte!6449 thiss!1634) (currentBit!6444 thiss!1634)))))

(declare-fun b!150680 () Bool)

(declare-fun res!126314 () Bool)

(assert (=> b!150680 (=> (not res!126314) (not e!100623))))

(assert (=> b!150680 (= res!126314 (isPrefixOf!0 (_2!7103 lt!235621) (_2!7101 lt!235287)))))

(declare-fun b!150681 () Bool)

(declare-fun lt!235616 () Unit!9496)

(assert (=> b!150681 (= e!100622 lt!235616)))

(declare-fun lt!235615 () (_ BitVec 64))

(assert (=> b!150681 (= lt!235615 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!235612 () (_ BitVec 64))

(assert (=> b!150681 (= lt!235612 (bitIndex!0 (size!3048 (buf!3529 thiss!1634)) (currentByte!6449 thiss!1634) (currentBit!6444 thiss!1634)))))

(assert (=> b!150681 (= lt!235616 (arrayBitRangesEqSymmetric!0 (buf!3529 thiss!1634) (buf!3529 (_2!7101 lt!235287)) lt!235615 lt!235612))))

(assert (=> b!150681 (arrayBitRangesEq!0 (buf!3529 (_2!7101 lt!235287)) (buf!3529 thiss!1634) lt!235615 lt!235612)))

(assert (= (and d!48975 c!8065) b!150681))

(assert (= (and d!48975 (not c!8065)) b!150677))

(assert (= (and d!48975 res!126313) b!150678))

(assert (= (and b!150678 res!126315) b!150680))

(assert (= (and b!150680 res!126314) b!150679))

(declare-fun m!235033 () Bool)

(assert (=> b!150679 m!235033))

(assert (=> b!150679 m!234761))

(assert (=> b!150679 m!234763))

(declare-fun m!235035 () Bool)

(assert (=> b!150678 m!235035))

(assert (=> b!150681 m!234763))

(declare-fun m!235037 () Bool)

(assert (=> b!150681 m!235037))

(declare-fun m!235039 () Bool)

(assert (=> b!150681 m!235039))

(assert (=> d!48975 m!235019))

(assert (=> d!48975 m!235017))

(declare-fun m!235041 () Bool)

(assert (=> d!48975 m!235041))

(declare-fun m!235043 () Bool)

(assert (=> d!48975 m!235043))

(declare-fun m!235045 () Bool)

(assert (=> d!48975 m!235045))

(declare-fun m!235047 () Bool)

(assert (=> d!48975 m!235047))

(declare-fun m!235049 () Bool)

(assert (=> d!48975 m!235049))

(declare-fun m!235051 () Bool)

(assert (=> d!48975 m!235051))

(declare-fun m!235053 () Bool)

(assert (=> d!48975 m!235053))

(declare-fun m!235055 () Bool)

(assert (=> d!48975 m!235055))

(assert (=> d!48975 m!234691))

(declare-fun m!235057 () Bool)

(assert (=> b!150680 m!235057))

(assert (=> b!150545 d!48975))

(declare-fun d!48977 () Bool)

(declare-fun e!100624 () Bool)

(assert (=> d!48977 e!100624))

(declare-fun res!126316 () Bool)

(assert (=> d!48977 (=> (not res!126316) (not e!100624))))

(declare-fun lt!235630 () (_ BitVec 64))

(declare-fun lt!235629 () (_ BitVec 64))

(declare-fun lt!235632 () (_ BitVec 64))

(assert (=> d!48977 (= res!126316 (= lt!235629 (bvsub lt!235630 lt!235632)))))

(assert (=> d!48977 (or (= (bvand lt!235630 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!235632 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!235630 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!235630 lt!235632) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!48977 (= lt!235632 (remainingBits!0 ((_ sign_extend 32) (size!3048 (buf!3529 (_1!7104 lt!235276)))) ((_ sign_extend 32) (currentByte!6449 (_1!7104 lt!235276))) ((_ sign_extend 32) (currentBit!6444 (_1!7104 lt!235276)))))))

(declare-fun lt!235628 () (_ BitVec 64))

(declare-fun lt!235631 () (_ BitVec 64))

(assert (=> d!48977 (= lt!235630 (bvmul lt!235628 lt!235631))))

(assert (=> d!48977 (or (= lt!235628 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!235631 (bvsdiv (bvmul lt!235628 lt!235631) lt!235628)))))

(assert (=> d!48977 (= lt!235631 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!48977 (= lt!235628 ((_ sign_extend 32) (size!3048 (buf!3529 (_1!7104 lt!235276)))))))

(assert (=> d!48977 (= lt!235629 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6449 (_1!7104 lt!235276))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6444 (_1!7104 lt!235276)))))))

(assert (=> d!48977 (invariant!0 (currentBit!6444 (_1!7104 lt!235276)) (currentByte!6449 (_1!7104 lt!235276)) (size!3048 (buf!3529 (_1!7104 lt!235276))))))

(assert (=> d!48977 (= (bitIndex!0 (size!3048 (buf!3529 (_1!7104 lt!235276))) (currentByte!6449 (_1!7104 lt!235276)) (currentBit!6444 (_1!7104 lt!235276))) lt!235629)))

(declare-fun b!150682 () Bool)

(declare-fun res!126317 () Bool)

(assert (=> b!150682 (=> (not res!126317) (not e!100624))))

(assert (=> b!150682 (= res!126317 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!235629))))

(declare-fun b!150683 () Bool)

(declare-fun lt!235633 () (_ BitVec 64))

(assert (=> b!150683 (= e!100624 (bvsle lt!235629 (bvmul lt!235633 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!150683 (or (= lt!235633 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!235633 #b0000000000000000000000000000000000000000000000000000000000001000) lt!235633)))))

(assert (=> b!150683 (= lt!235633 ((_ sign_extend 32) (size!3048 (buf!3529 (_1!7104 lt!235276)))))))

(assert (= (and d!48977 res!126316) b!150682))

(assert (= (and b!150682 res!126317) b!150683))

(declare-fun m!235059 () Bool)

(assert (=> d!48977 m!235059))

(declare-fun m!235061 () Bool)

(assert (=> d!48977 m!235061))

(assert (=> b!150547 d!48977))

(declare-fun d!48979 () Bool)

(declare-fun res!126318 () Bool)

(declare-fun e!100625 () Bool)

(assert (=> d!48979 (=> res!126318 e!100625)))

(assert (=> d!48979 (= res!126318 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!48979 (= (arrayRangesEq!364 (_2!7102 lt!235290) (_2!7102 lt!235280) #b00000000000000000000000000000000 to!404) e!100625)))

(declare-fun b!150684 () Bool)

(declare-fun e!100626 () Bool)

(assert (=> b!150684 (= e!100625 e!100626)))

(declare-fun res!126319 () Bool)

(assert (=> b!150684 (=> (not res!126319) (not e!100626))))

(assert (=> b!150684 (= res!126319 (= (select (arr!3841 (_2!7102 lt!235290)) #b00000000000000000000000000000000) (select (arr!3841 (_2!7102 lt!235280)) #b00000000000000000000000000000000)))))

(declare-fun b!150685 () Bool)

(assert (=> b!150685 (= e!100626 (arrayRangesEq!364 (_2!7102 lt!235290) (_2!7102 lt!235280) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!48979 (not res!126318)) b!150684))

(assert (= (and b!150684 res!126319) b!150685))

(assert (=> b!150684 m!234869))

(declare-fun m!235063 () Bool)

(assert (=> b!150684 m!235063))

(declare-fun m!235065 () Bool)

(assert (=> b!150685 m!235065))

(assert (=> b!150547 d!48979))

(declare-fun d!48981 () Bool)

(declare-fun e!100627 () Bool)

(assert (=> d!48981 e!100627))

(declare-fun res!126320 () Bool)

(assert (=> d!48981 (=> (not res!126320) (not e!100627))))

(declare-fun lt!235638 () (_ BitVec 64))

(declare-fun lt!235636 () (_ BitVec 64))

(declare-fun lt!235635 () (_ BitVec 64))

(assert (=> d!48981 (= res!126320 (= lt!235635 (bvsub lt!235636 lt!235638)))))

(assert (=> d!48981 (or (= (bvand lt!235636 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!235638 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!235636 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!235636 lt!235638) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!48981 (= lt!235638 (remainingBits!0 ((_ sign_extend 32) (size!3048 (buf!3529 (_1!7104 lt!235269)))) ((_ sign_extend 32) (currentByte!6449 (_1!7104 lt!235269))) ((_ sign_extend 32) (currentBit!6444 (_1!7104 lt!235269)))))))

(declare-fun lt!235634 () (_ BitVec 64))

(declare-fun lt!235637 () (_ BitVec 64))

(assert (=> d!48981 (= lt!235636 (bvmul lt!235634 lt!235637))))

(assert (=> d!48981 (or (= lt!235634 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!235637 (bvsdiv (bvmul lt!235634 lt!235637) lt!235634)))))

(assert (=> d!48981 (= lt!235637 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!48981 (= lt!235634 ((_ sign_extend 32) (size!3048 (buf!3529 (_1!7104 lt!235269)))))))

(assert (=> d!48981 (= lt!235635 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6449 (_1!7104 lt!235269))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6444 (_1!7104 lt!235269)))))))

(assert (=> d!48981 (invariant!0 (currentBit!6444 (_1!7104 lt!235269)) (currentByte!6449 (_1!7104 lt!235269)) (size!3048 (buf!3529 (_1!7104 lt!235269))))))

(assert (=> d!48981 (= (bitIndex!0 (size!3048 (buf!3529 (_1!7104 lt!235269))) (currentByte!6449 (_1!7104 lt!235269)) (currentBit!6444 (_1!7104 lt!235269))) lt!235635)))

(declare-fun b!150686 () Bool)

(declare-fun res!126321 () Bool)

(assert (=> b!150686 (=> (not res!126321) (not e!100627))))

(assert (=> b!150686 (= res!126321 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!235635))))

(declare-fun b!150687 () Bool)

(declare-fun lt!235639 () (_ BitVec 64))

(assert (=> b!150687 (= e!100627 (bvsle lt!235635 (bvmul lt!235639 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!150687 (or (= lt!235639 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!235639 #b0000000000000000000000000000000000000000000000000000000000001000) lt!235639)))))

(assert (=> b!150687 (= lt!235639 ((_ sign_extend 32) (size!3048 (buf!3529 (_1!7104 lt!235269)))))))

(assert (= (and d!48981 res!126320) b!150686))

(assert (= (and b!150686 res!126321) b!150687))

(declare-fun m!235067 () Bool)

(assert (=> d!48981 m!235067))

(declare-fun m!235069 () Bool)

(assert (=> d!48981 m!235069))

(assert (=> b!150547 d!48981))

(declare-fun d!48983 () Bool)

(declare-fun res!126323 () Bool)

(declare-fun e!100628 () Bool)

(assert (=> d!48983 (=> (not res!126323) (not e!100628))))

(assert (=> d!48983 (= res!126323 (= (size!3048 (buf!3529 thiss!1634)) (size!3048 (buf!3529 (_2!7101 lt!235270)))))))

(assert (=> d!48983 (= (isPrefixOf!0 thiss!1634 (_2!7101 lt!235270)) e!100628)))

(declare-fun b!150688 () Bool)

(declare-fun res!126324 () Bool)

(assert (=> b!150688 (=> (not res!126324) (not e!100628))))

(assert (=> b!150688 (= res!126324 (bvsle (bitIndex!0 (size!3048 (buf!3529 thiss!1634)) (currentByte!6449 thiss!1634) (currentBit!6444 thiss!1634)) (bitIndex!0 (size!3048 (buf!3529 (_2!7101 lt!235270))) (currentByte!6449 (_2!7101 lt!235270)) (currentBit!6444 (_2!7101 lt!235270)))))))

(declare-fun b!150689 () Bool)

(declare-fun e!100629 () Bool)

(assert (=> b!150689 (= e!100628 e!100629)))

(declare-fun res!126322 () Bool)

(assert (=> b!150689 (=> res!126322 e!100629)))

(assert (=> b!150689 (= res!126322 (= (size!3048 (buf!3529 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!150690 () Bool)

(assert (=> b!150690 (= e!100629 (arrayBitRangesEq!0 (buf!3529 thiss!1634) (buf!3529 (_2!7101 lt!235270)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3048 (buf!3529 thiss!1634)) (currentByte!6449 thiss!1634) (currentBit!6444 thiss!1634))))))

(assert (= (and d!48983 res!126323) b!150688))

(assert (= (and b!150688 res!126324) b!150689))

(assert (= (and b!150689 (not res!126322)) b!150690))

(assert (=> b!150688 m!234763))

(assert (=> b!150688 m!234779))

(assert (=> b!150690 m!234763))

(assert (=> b!150690 m!234763))

(declare-fun m!235071 () Bool)

(assert (=> b!150690 m!235071))

(assert (=> b!150547 d!48983))

(declare-fun d!48985 () Bool)

(assert (=> d!48985 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3048 (buf!3529 (_2!7101 lt!235287)))) ((_ sign_extend 32) (currentByte!6449 (_2!7101 lt!235287))) ((_ sign_extend 32) (currentBit!6444 (_2!7101 lt!235287))) lt!235263) (bvsle ((_ sign_extend 32) lt!235263) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3048 (buf!3529 (_2!7101 lt!235287)))) ((_ sign_extend 32) (currentByte!6449 (_2!7101 lt!235287))) ((_ sign_extend 32) (currentBit!6444 (_2!7101 lt!235287)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11971 () Bool)

(assert (= bs!11971 d!48985))

(assert (=> bs!11971 m!235027))

(assert (=> b!150547 d!48985))

(declare-fun d!48987 () Bool)

(declare-fun moveByteIndex!0 (BitStream!5354 (_ BitVec 32)) tuple2!13468)

(assert (=> d!48987 (= (withMovedByteIndex!0 (_1!7103 lt!235268) #b00000000000000000000000000000001) (_2!7101 (moveByteIndex!0 (_1!7103 lt!235268) #b00000000000000000000000000000001)))))

(declare-fun bs!11972 () Bool)

(assert (= bs!11972 d!48987))

(declare-fun m!235073 () Bool)

(assert (=> bs!11972 m!235073))

(assert (=> b!150547 d!48987))

(declare-fun d!48989 () Bool)

(declare-fun res!126325 () Bool)

(declare-fun e!100630 () Bool)

(assert (=> d!48989 (=> res!126325 e!100630)))

(assert (=> d!48989 (= res!126325 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!48989 (= (arrayRangesEq!364 (_2!7102 lt!235290) (_2!7102 lt!235286) #b00000000000000000000000000000000 to!404) e!100630)))

(declare-fun b!150691 () Bool)

(declare-fun e!100631 () Bool)

(assert (=> b!150691 (= e!100630 e!100631)))

(declare-fun res!126326 () Bool)

(assert (=> b!150691 (=> (not res!126326) (not e!100631))))

(assert (=> b!150691 (= res!126326 (= (select (arr!3841 (_2!7102 lt!235290)) #b00000000000000000000000000000000) (select (arr!3841 (_2!7102 lt!235286)) #b00000000000000000000000000000000)))))

(declare-fun b!150692 () Bool)

(assert (=> b!150692 (= e!100631 (arrayRangesEq!364 (_2!7102 lt!235290) (_2!7102 lt!235286) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!48989 (not res!126325)) b!150691))

(assert (= (and b!150691 res!126326) b!150692))

(assert (=> b!150691 m!234869))

(assert (=> b!150691 m!234875))

(declare-fun m!235075 () Bool)

(assert (=> b!150692 m!235075))

(assert (=> b!150547 d!48989))

(declare-fun d!48991 () Bool)

(assert (=> d!48991 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3048 (buf!3529 (_2!7101 lt!235270)))) ((_ sign_extend 32) (currentByte!6449 (_2!7101 lt!235287))) ((_ sign_extend 32) (currentBit!6444 (_2!7101 lt!235287))) lt!235263)))

(declare-fun lt!235642 () Unit!9496)

(declare-fun choose!26 (BitStream!5354 array!6735 (_ BitVec 32) BitStream!5354) Unit!9496)

(assert (=> d!48991 (= lt!235642 (choose!26 (_2!7101 lt!235287) (buf!3529 (_2!7101 lt!235270)) lt!235263 (BitStream!5355 (buf!3529 (_2!7101 lt!235270)) (currentByte!6449 (_2!7101 lt!235287)) (currentBit!6444 (_2!7101 lt!235287)))))))

(assert (=> d!48991 (= (validateOffsetBytesContentIrrelevancyLemma!0 (_2!7101 lt!235287) (buf!3529 (_2!7101 lt!235270)) lt!235263) lt!235642)))

(declare-fun bs!11973 () Bool)

(assert (= bs!11973 d!48991))

(assert (=> bs!11973 m!234741))

(declare-fun m!235077 () Bool)

(assert (=> bs!11973 m!235077))

(assert (=> b!150547 d!48991))

(declare-fun d!48993 () Bool)

(declare-fun e!100634 () Bool)

(assert (=> d!48993 e!100634))

(declare-fun res!126329 () Bool)

(assert (=> d!48993 (=> (not res!126329) (not e!100634))))

(declare-fun lt!235653 () tuple2!13474)

(declare-fun lt!235652 () tuple2!13474)

(assert (=> d!48993 (= res!126329 (= (bitIndex!0 (size!3048 (buf!3529 (_1!7104 lt!235653))) (currentByte!6449 (_1!7104 lt!235653)) (currentBit!6444 (_1!7104 lt!235653))) (bitIndex!0 (size!3048 (buf!3529 (_1!7104 lt!235652))) (currentByte!6449 (_1!7104 lt!235652)) (currentBit!6444 (_1!7104 lt!235652)))))))

(declare-fun lt!235651 () Unit!9496)

(declare-fun lt!235654 () BitStream!5354)

(declare-fun choose!14 (BitStream!5354 BitStream!5354 BitStream!5354 tuple2!13474 tuple2!13474 BitStream!5354 (_ BitVec 8) tuple2!13474 tuple2!13474 BitStream!5354 (_ BitVec 8)) Unit!9496)

(assert (=> d!48993 (= lt!235651 (choose!14 lt!235282 (_2!7101 lt!235270) lt!235654 lt!235653 (tuple2!13475 (_1!7104 lt!235653) (_2!7104 lt!235653)) (_1!7104 lt!235653) (_2!7104 lt!235653) lt!235652 (tuple2!13475 (_1!7104 lt!235652) (_2!7104 lt!235652)) (_1!7104 lt!235652) (_2!7104 lt!235652)))))

(assert (=> d!48993 (= lt!235652 (readBytePure!0 lt!235654))))

(assert (=> d!48993 (= lt!235653 (readBytePure!0 lt!235282))))

(assert (=> d!48993 (= lt!235654 (BitStream!5355 (buf!3529 (_2!7101 lt!235270)) (currentByte!6449 lt!235282) (currentBit!6444 lt!235282)))))

(assert (=> d!48993 (= (readBytePrefixLemma!0 lt!235282 (_2!7101 lt!235270)) lt!235651)))

(declare-fun b!150695 () Bool)

(assert (=> b!150695 (= e!100634 (= (_2!7104 lt!235653) (_2!7104 lt!235652)))))

(assert (= (and d!48993 res!126329) b!150695))

(declare-fun m!235079 () Bool)

(assert (=> d!48993 m!235079))

(assert (=> d!48993 m!234725))

(declare-fun m!235081 () Bool)

(assert (=> d!48993 m!235081))

(declare-fun m!235083 () Bool)

(assert (=> d!48993 m!235083))

(declare-fun m!235085 () Bool)

(assert (=> d!48993 m!235085))

(assert (=> b!150547 d!48993))

(declare-fun d!48995 () Bool)

(assert (=> d!48995 (isPrefixOf!0 thiss!1634 (_2!7101 lt!235270))))

(declare-fun lt!235657 () Unit!9496)

(declare-fun choose!30 (BitStream!5354 BitStream!5354 BitStream!5354) Unit!9496)

(assert (=> d!48995 (= lt!235657 (choose!30 thiss!1634 (_2!7101 lt!235287) (_2!7101 lt!235270)))))

(assert (=> d!48995 (isPrefixOf!0 thiss!1634 (_2!7101 lt!235287))))

(assert (=> d!48995 (= (lemmaIsPrefixTransitive!0 thiss!1634 (_2!7101 lt!235287) (_2!7101 lt!235270)) lt!235657)))

(declare-fun bs!11974 () Bool)

(assert (= bs!11974 d!48995))

(assert (=> bs!11974 m!234751))

(declare-fun m!235087 () Bool)

(assert (=> bs!11974 m!235087))

(assert (=> bs!11974 m!234691))

(assert (=> b!150547 d!48995))

(assert (=> b!150547 d!48965))

(declare-fun d!48997 () Bool)

(declare-fun lt!235658 () tuple2!13478)

(assert (=> d!48997 (= lt!235658 (readByte!0 (BitStream!5355 (buf!3529 (_2!7101 lt!235270)) (currentByte!6449 thiss!1634) (currentBit!6444 thiss!1634))))))

(assert (=> d!48997 (= (readBytePure!0 (BitStream!5355 (buf!3529 (_2!7101 lt!235270)) (currentByte!6449 thiss!1634) (currentBit!6444 thiss!1634))) (tuple2!13475 (_2!7108 lt!235658) (_1!7108 lt!235658)))))

(declare-fun bs!11975 () Bool)

(assert (= bs!11975 d!48997))

(declare-fun m!235089 () Bool)

(assert (=> bs!11975 m!235089))

(assert (=> b!150547 d!48997))

(declare-fun d!48999 () Bool)

(assert (=> d!48999 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3048 (buf!3529 (_2!7101 lt!235270)))) ((_ sign_extend 32) (currentByte!6449 thiss!1634)) ((_ sign_extend 32) (currentBit!6444 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!235659 () Unit!9496)

(assert (=> d!48999 (= lt!235659 (choose!26 thiss!1634 (buf!3529 (_2!7101 lt!235270)) (bvsub to!404 from!447) (BitStream!5355 (buf!3529 (_2!7101 lt!235270)) (currentByte!6449 thiss!1634) (currentBit!6444 thiss!1634))))))

(assert (=> d!48999 (= (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3529 (_2!7101 lt!235270)) (bvsub to!404 from!447)) lt!235659)))

(declare-fun bs!11976 () Bool)

(assert (= bs!11976 d!48999))

(assert (=> bs!11976 m!234753))

(declare-fun m!235091 () Bool)

(assert (=> bs!11976 m!235091))

(assert (=> b!150547 d!48999))

(declare-fun d!49001 () Bool)

(declare-fun lt!235695 () tuple2!13470)

(declare-fun lt!235697 () tuple2!13470)

(assert (=> d!49001 (arrayRangesEq!364 (_2!7102 lt!235695) (_2!7102 lt!235697) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!235696 () BitStream!5354)

(declare-fun lt!235698 () Unit!9496)

(declare-fun choose!35 (BitStream!5354 array!6735 (_ BitVec 32) (_ BitVec 32) tuple2!13470 array!6735 BitStream!5354 tuple2!13470 array!6735) Unit!9496)

(assert (=> d!49001 (= lt!235698 (choose!35 (_1!7103 lt!235268) arr!237 from!447 to!404 lt!235695 (_2!7102 lt!235695) lt!235696 lt!235697 (_2!7102 lt!235697)))))

(assert (=> d!49001 (= lt!235697 (readByteArrayLoopPure!0 lt!235696 (array!6736 (store (arr!3841 arr!237) from!447 (_2!7104 (readBytePure!0 (_1!7103 lt!235268)))) (size!3048 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> d!49001 (= lt!235696 (withMovedByteIndex!0 (_1!7103 lt!235268) #b00000000000000000000000000000001))))

(assert (=> d!49001 (= lt!235695 (readByteArrayLoopPure!0 (_1!7103 lt!235268) arr!237 from!447 to!404))))

(assert (=> d!49001 (= (readByteArrayLoopArrayPrefixLemma!0 (_1!7103 lt!235268) arr!237 from!447 to!404) lt!235698)))

(declare-fun bs!11978 () Bool)

(assert (= bs!11978 d!49001))

(declare-fun m!235093 () Bool)

(assert (=> bs!11978 m!235093))

(assert (=> bs!11978 m!234715))

(declare-fun m!235095 () Bool)

(assert (=> bs!11978 m!235095))

(assert (=> bs!11978 m!234719))

(assert (=> bs!11978 m!234723))

(declare-fun m!235097 () Bool)

(assert (=> bs!11978 m!235097))

(declare-fun m!235103 () Bool)

(assert (=> bs!11978 m!235103))

(assert (=> b!150547 d!49001))

(declare-fun d!49003 () Bool)

(declare-fun lt!235699 () tuple2!13478)

(assert (=> d!49003 (= lt!235699 (readByte!0 (_1!7103 lt!235268)))))

(assert (=> d!49003 (= (readBytePure!0 (_1!7103 lt!235268)) (tuple2!13475 (_2!7108 lt!235699) (_1!7108 lt!235699)))))

(declare-fun bs!11979 () Bool)

(assert (= bs!11979 d!49003))

(declare-fun m!235111 () Bool)

(assert (=> bs!11979 m!235111))

(assert (=> b!150547 d!49003))

(declare-fun b!150711 () Bool)

(declare-fun e!100644 () Unit!9496)

(declare-fun Unit!9503 () Unit!9496)

(assert (=> b!150711 (= e!100644 Unit!9503)))

(declare-fun b!150712 () Bool)

(declare-fun res!126347 () Bool)

(declare-fun e!100645 () Bool)

(assert (=> b!150712 (=> (not res!126347) (not e!100645))))

(declare-fun lt!235713 () tuple2!13472)

(assert (=> b!150712 (= res!126347 (isPrefixOf!0 (_1!7103 lt!235713) thiss!1634))))

(declare-fun d!49005 () Bool)

(assert (=> d!49005 e!100645))

(declare-fun res!126345 () Bool)

(assert (=> d!49005 (=> (not res!126345) (not e!100645))))

(assert (=> d!49005 (= res!126345 (isPrefixOf!0 (_1!7103 lt!235713) (_2!7103 lt!235713)))))

(declare-fun lt!235711 () BitStream!5354)

(assert (=> d!49005 (= lt!235713 (tuple2!13473 lt!235711 (_2!7101 lt!235270)))))

(declare-fun lt!235701 () Unit!9496)

(declare-fun lt!235716 () Unit!9496)

(assert (=> d!49005 (= lt!235701 lt!235716)))

(assert (=> d!49005 (isPrefixOf!0 lt!235711 (_2!7101 lt!235270))))

(assert (=> d!49005 (= lt!235716 (lemmaIsPrefixTransitive!0 lt!235711 (_2!7101 lt!235270) (_2!7101 lt!235270)))))

(declare-fun lt!235714 () Unit!9496)

(declare-fun lt!235705 () Unit!9496)

(assert (=> d!49005 (= lt!235714 lt!235705)))

(assert (=> d!49005 (isPrefixOf!0 lt!235711 (_2!7101 lt!235270))))

(assert (=> d!49005 (= lt!235705 (lemmaIsPrefixTransitive!0 lt!235711 thiss!1634 (_2!7101 lt!235270)))))

(declare-fun lt!235718 () Unit!9496)

(assert (=> d!49005 (= lt!235718 e!100644)))

(declare-fun c!8066 () Bool)

(assert (=> d!49005 (= c!8066 (not (= (size!3048 (buf!3529 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!235709 () Unit!9496)

(declare-fun lt!235719 () Unit!9496)

(assert (=> d!49005 (= lt!235709 lt!235719)))

(assert (=> d!49005 (isPrefixOf!0 (_2!7101 lt!235270) (_2!7101 lt!235270))))

(assert (=> d!49005 (= lt!235719 (lemmaIsPrefixRefl!0 (_2!7101 lt!235270)))))

(declare-fun lt!235715 () Unit!9496)

(declare-fun lt!235703 () Unit!9496)

(assert (=> d!49005 (= lt!235715 lt!235703)))

(assert (=> d!49005 (= lt!235703 (lemmaIsPrefixRefl!0 (_2!7101 lt!235270)))))

(declare-fun lt!235712 () Unit!9496)

(declare-fun lt!235702 () Unit!9496)

(assert (=> d!49005 (= lt!235712 lt!235702)))

(assert (=> d!49005 (isPrefixOf!0 lt!235711 lt!235711)))

(assert (=> d!49005 (= lt!235702 (lemmaIsPrefixRefl!0 lt!235711))))

(declare-fun lt!235717 () Unit!9496)

(declare-fun lt!235700 () Unit!9496)

(assert (=> d!49005 (= lt!235717 lt!235700)))

(assert (=> d!49005 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!49005 (= lt!235700 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!49005 (= lt!235711 (BitStream!5355 (buf!3529 (_2!7101 lt!235270)) (currentByte!6449 thiss!1634) (currentBit!6444 thiss!1634)))))

(assert (=> d!49005 (isPrefixOf!0 thiss!1634 (_2!7101 lt!235270))))

(assert (=> d!49005 (= (reader!0 thiss!1634 (_2!7101 lt!235270)) lt!235713)))

(declare-fun lt!235706 () (_ BitVec 64))

(declare-fun lt!235710 () (_ BitVec 64))

(declare-fun b!150713 () Bool)

(assert (=> b!150713 (= e!100645 (= (_1!7103 lt!235713) (withMovedBitIndex!0 (_2!7103 lt!235713) (bvsub lt!235706 lt!235710))))))

(assert (=> b!150713 (or (= (bvand lt!235706 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!235710 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!235706 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!235706 lt!235710) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!150713 (= lt!235710 (bitIndex!0 (size!3048 (buf!3529 (_2!7101 lt!235270))) (currentByte!6449 (_2!7101 lt!235270)) (currentBit!6444 (_2!7101 lt!235270))))))

(assert (=> b!150713 (= lt!235706 (bitIndex!0 (size!3048 (buf!3529 thiss!1634)) (currentByte!6449 thiss!1634) (currentBit!6444 thiss!1634)))))

(declare-fun b!150714 () Bool)

(declare-fun res!126346 () Bool)

(assert (=> b!150714 (=> (not res!126346) (not e!100645))))

(assert (=> b!150714 (= res!126346 (isPrefixOf!0 (_2!7103 lt!235713) (_2!7101 lt!235270)))))

(declare-fun b!150715 () Bool)

(declare-fun lt!235708 () Unit!9496)

(assert (=> b!150715 (= e!100644 lt!235708)))

(declare-fun lt!235707 () (_ BitVec 64))

(assert (=> b!150715 (= lt!235707 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!235704 () (_ BitVec 64))

(assert (=> b!150715 (= lt!235704 (bitIndex!0 (size!3048 (buf!3529 thiss!1634)) (currentByte!6449 thiss!1634) (currentBit!6444 thiss!1634)))))

(assert (=> b!150715 (= lt!235708 (arrayBitRangesEqSymmetric!0 (buf!3529 thiss!1634) (buf!3529 (_2!7101 lt!235270)) lt!235707 lt!235704))))

(assert (=> b!150715 (arrayBitRangesEq!0 (buf!3529 (_2!7101 lt!235270)) (buf!3529 thiss!1634) lt!235707 lt!235704)))

(assert (= (and d!49005 c!8066) b!150715))

(assert (= (and d!49005 (not c!8066)) b!150711))

(assert (= (and d!49005 res!126345) b!150712))

(assert (= (and b!150712 res!126347) b!150714))

(assert (= (and b!150714 res!126346) b!150713))

(declare-fun m!235121 () Bool)

(assert (=> b!150713 m!235121))

(assert (=> b!150713 m!234779))

(assert (=> b!150713 m!234763))

(declare-fun m!235123 () Bool)

(assert (=> b!150712 m!235123))

(assert (=> b!150715 m!234763))

(declare-fun m!235125 () Bool)

(assert (=> b!150715 m!235125))

(declare-fun m!235127 () Bool)

(assert (=> b!150715 m!235127))

(assert (=> d!49005 m!235005))

(assert (=> d!49005 m!235007))

(declare-fun m!235131 () Bool)

(assert (=> d!49005 m!235131))

(declare-fun m!235133 () Bool)

(assert (=> d!49005 m!235133))

(declare-fun m!235135 () Bool)

(assert (=> d!49005 m!235135))

(declare-fun m!235137 () Bool)

(assert (=> d!49005 m!235137))

(assert (=> d!49005 m!235049))

(assert (=> d!49005 m!235051))

(declare-fun m!235139 () Bool)

(assert (=> d!49005 m!235139))

(declare-fun m!235141 () Bool)

(assert (=> d!49005 m!235141))

(assert (=> d!49005 m!234751))

(declare-fun m!235143 () Bool)

(assert (=> b!150714 m!235143))

(assert (=> b!150547 d!49005))

(declare-fun d!49011 () Bool)

(assert (=> d!49011 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3048 (buf!3529 (_2!7101 lt!235270)))) ((_ sign_extend 32) (currentByte!6449 (_2!7101 lt!235287))) ((_ sign_extend 32) (currentBit!6444 (_2!7101 lt!235287))) lt!235263) (bvsle ((_ sign_extend 32) lt!235263) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3048 (buf!3529 (_2!7101 lt!235270)))) ((_ sign_extend 32) (currentByte!6449 (_2!7101 lt!235287))) ((_ sign_extend 32) (currentBit!6444 (_2!7101 lt!235287)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11981 () Bool)

(assert (= bs!11981 d!49011))

(assert (=> bs!11981 m!234973))

(assert (=> b!150547 d!49011))

(declare-fun d!49015 () Bool)

(assert (=> d!49015 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3048 (buf!3529 (_2!7101 lt!235270)))) ((_ sign_extend 32) (currentByte!6449 thiss!1634)) ((_ sign_extend 32) (currentBit!6444 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3048 (buf!3529 (_2!7101 lt!235270)))) ((_ sign_extend 32) (currentByte!6449 thiss!1634)) ((_ sign_extend 32) (currentBit!6444 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11983 () Bool)

(assert (= bs!11983 d!49015))

(declare-fun m!235145 () Bool)

(assert (=> bs!11983 m!235145))

(assert (=> b!150547 d!49015))

(declare-fun lt!235726 () tuple3!590)

(declare-fun d!49019 () Bool)

(assert (=> d!49019 (= lt!235726 (readByteArrayLoop!0 (withMovedByteIndex!0 (_1!7103 lt!235268) #b00000000000000000000000000000001) lt!235273 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!49019 (= (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!7103 lt!235268) #b00000000000000000000000000000001) lt!235273 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13471 (_2!7107 lt!235726) (_3!368 lt!235726)))))

(declare-fun bs!11984 () Bool)

(assert (= bs!11984 d!49019))

(assert (=> bs!11984 m!234715))

(declare-fun m!235147 () Bool)

(assert (=> bs!11984 m!235147))

(assert (=> b!150547 d!49019))

(declare-fun lt!235727 () tuple3!590)

(declare-fun d!49021 () Bool)

(assert (=> d!49021 (= lt!235727 (readByteArrayLoop!0 (_1!7103 lt!235277) lt!235273 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!49021 (= (readByteArrayLoopPure!0 (_1!7103 lt!235277) lt!235273 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13471 (_2!7107 lt!235727) (_3!368 lt!235727)))))

(declare-fun bs!11985 () Bool)

(assert (= bs!11985 d!49021))

(declare-fun m!235151 () Bool)

(assert (=> bs!11985 m!235151))

(assert (=> b!150547 d!49021))

(declare-fun d!49027 () Bool)

(declare-fun lt!235728 () tuple2!13478)

(assert (=> d!49027 (= lt!235728 (readByte!0 lt!235282))))

(assert (=> d!49027 (= (readBytePure!0 lt!235282) (tuple2!13475 (_2!7108 lt!235728) (_1!7108 lt!235728)))))

(declare-fun bs!11986 () Bool)

(assert (= bs!11986 d!49027))

(declare-fun m!235153 () Bool)

(assert (=> bs!11986 m!235153))

(assert (=> b!150547 d!49027))

(declare-fun d!49029 () Bool)

(declare-fun lt!235729 () tuple3!590)

(assert (=> d!49029 (= lt!235729 (readByteArrayLoop!0 (_1!7103 lt!235268) arr!237 from!447 to!404))))

(assert (=> d!49029 (= (readByteArrayLoopPure!0 (_1!7103 lt!235268) arr!237 from!447 to!404) (tuple2!13471 (_2!7107 lt!235729) (_3!368 lt!235729)))))

(declare-fun bs!11987 () Bool)

(assert (= bs!11987 d!49029))

(declare-fun m!235155 () Bool)

(assert (=> bs!11987 m!235155))

(assert (=> b!150547 d!49029))

(declare-fun d!49031 () Bool)

(declare-fun e!100653 () Bool)

(assert (=> d!49031 e!100653))

(declare-fun res!126358 () Bool)

(assert (=> d!49031 (=> (not res!126358) (not e!100653))))

(assert (=> d!49031 (= res!126358 (and (or (let ((rhs!3289 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3289 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3289) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!49034 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!49034 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!49034 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3288 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3288 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3288) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!235737 () Unit!9496)

(declare-fun choose!57 (BitStream!5354 BitStream!5354 (_ BitVec 64) (_ BitVec 32)) Unit!9496)

(assert (=> d!49031 (= lt!235737 (choose!57 thiss!1634 (_2!7101 lt!235287) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> d!49031 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!7101 lt!235287) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) lt!235737)))

(declare-fun lt!235736 () (_ BitVec 32))

(declare-fun b!150726 () Bool)

(assert (=> b!150726 (= e!100653 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3048 (buf!3529 (_2!7101 lt!235287)))) ((_ sign_extend 32) (currentByte!6449 (_2!7101 lt!235287))) ((_ sign_extend 32) (currentBit!6444 (_2!7101 lt!235287))) (bvsub (bvsub to!404 from!447) lt!235736)))))

(assert (=> b!150726 (or (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand lt!235736 #b10000000000000000000000000000000)) (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!404 from!447) lt!235736) #b10000000000000000000000000000000)))))

(declare-fun lt!235738 () (_ BitVec 64))

(assert (=> b!150726 (= lt!235736 ((_ extract 31 0) lt!235738))))

(assert (=> b!150726 (and (bvslt lt!235738 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!235738 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!150726 (= lt!235738 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!49031 res!126358) b!150726))

(declare-fun m!235159 () Bool)

(assert (=> d!49031 m!235159))

(declare-fun m!235161 () Bool)

(assert (=> b!150726 m!235161))

(assert (=> b!150547 d!49031))

(declare-fun d!49036 () Bool)

(declare-fun e!100656 () Bool)

(assert (=> d!49036 e!100656))

(declare-fun res!126366 () Bool)

(assert (=> d!49036 (=> (not res!126366) (not e!100656))))

(declare-fun lt!235751 () tuple2!13468)

(assert (=> d!49036 (= res!126366 (= (size!3048 (buf!3529 thiss!1634)) (size!3048 (buf!3529 (_2!7101 lt!235751)))))))

(declare-fun choose!6 (BitStream!5354 (_ BitVec 8)) tuple2!13468)

(assert (=> d!49036 (= lt!235751 (choose!6 thiss!1634 (select (arr!3841 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!49036 (validate_offset_byte!0 ((_ sign_extend 32) (size!3048 (buf!3529 thiss!1634))) ((_ sign_extend 32) (currentByte!6449 thiss!1634)) ((_ sign_extend 32) (currentBit!6444 thiss!1634)))))

(assert (=> d!49036 (= (appendByte!0 thiss!1634 (select (arr!3841 arr!237) from!447)) lt!235751)))

(declare-fun b!150733 () Bool)

(declare-fun res!126365 () Bool)

(assert (=> b!150733 (=> (not res!126365) (not e!100656))))

(declare-fun lt!235752 () (_ BitVec 64))

(declare-fun lt!235750 () (_ BitVec 64))

(assert (=> b!150733 (= res!126365 (= (bitIndex!0 (size!3048 (buf!3529 (_2!7101 lt!235751))) (currentByte!6449 (_2!7101 lt!235751)) (currentBit!6444 (_2!7101 lt!235751))) (bvadd lt!235750 lt!235752)))))

(assert (=> b!150733 (or (not (= (bvand lt!235750 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!235752 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!235750 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!235750 lt!235752) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!150733 (= lt!235752 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!150733 (= lt!235750 (bitIndex!0 (size!3048 (buf!3529 thiss!1634)) (currentByte!6449 thiss!1634) (currentBit!6444 thiss!1634)))))

(declare-fun b!150734 () Bool)

(declare-fun res!126367 () Bool)

(assert (=> b!150734 (=> (not res!126367) (not e!100656))))

(assert (=> b!150734 (= res!126367 (isPrefixOf!0 thiss!1634 (_2!7101 lt!235751)))))

(declare-fun b!150735 () Bool)

(declare-fun lt!235749 () tuple2!13472)

(declare-fun lt!235753 () tuple2!13474)

(assert (=> b!150735 (= e!100656 (and (= (_2!7104 lt!235753) (select (arr!3841 arr!237) from!447)) (= (_1!7104 lt!235753) (_2!7103 lt!235749))))))

(assert (=> b!150735 (= lt!235753 (readBytePure!0 (_1!7103 lt!235749)))))

(assert (=> b!150735 (= lt!235749 (reader!0 thiss!1634 (_2!7101 lt!235751)))))

(assert (= (and d!49036 res!126366) b!150733))

(assert (= (and b!150733 res!126365) b!150734))

(assert (= (and b!150734 res!126367) b!150735))

(assert (=> d!49036 m!234729))

(declare-fun m!235163 () Bool)

(assert (=> d!49036 m!235163))

(declare-fun m!235165 () Bool)

(assert (=> d!49036 m!235165))

(declare-fun m!235167 () Bool)

(assert (=> b!150733 m!235167))

(assert (=> b!150733 m!234763))

(declare-fun m!235169 () Bool)

(assert (=> b!150734 m!235169))

(declare-fun m!235171 () Bool)

(assert (=> b!150735 m!235171))

(declare-fun m!235173 () Bool)

(assert (=> b!150735 m!235173))

(assert (=> b!150547 d!49036))

(declare-fun b!150746 () Bool)

(declare-fun e!100665 () Bool)

(declare-fun lt!235773 () (_ BitVec 64))

(assert (=> b!150746 (= e!100665 (validate_offset_bits!1 ((_ sign_extend 32) (size!3048 (buf!3529 (_2!7101 lt!235287)))) ((_ sign_extend 32) (currentByte!6449 (_2!7101 lt!235287))) ((_ sign_extend 32) (currentBit!6444 (_2!7101 lt!235287))) lt!235773))))

(declare-fun d!49038 () Bool)

(declare-fun e!100664 () Bool)

(assert (=> d!49038 e!100664))

(declare-fun res!126382 () Bool)

(assert (=> d!49038 (=> (not res!126382) (not e!100664))))

(declare-fun lt!235780 () tuple2!13468)

(assert (=> d!49038 (= res!126382 (= (size!3048 (buf!3529 (_2!7101 lt!235287))) (size!3048 (buf!3529 (_2!7101 lt!235780)))))))

(declare-fun choose!64 (BitStream!5354 array!6735 (_ BitVec 32) (_ BitVec 32)) tuple2!13468)

(assert (=> d!49038 (= lt!235780 (choose!64 (_2!7101 lt!235287) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!49038 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!3048 arr!237)))))

(assert (=> d!49038 (= (appendByteArrayLoop!0 (_2!7101 lt!235287) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!235780)))

(declare-fun lt!235777 () tuple2!13470)

(declare-fun b!150747 () Bool)

(declare-fun e!100663 () Bool)

(assert (=> b!150747 (= e!100663 (arrayRangesEq!364 arr!237 (_2!7102 lt!235777) #b00000000000000000000000000000000 to!404))))

(declare-fun b!150748 () Bool)

(declare-fun res!126380 () Bool)

(assert (=> b!150748 (=> (not res!126380) (not e!100664))))

(declare-fun lt!235778 () (_ BitVec 64))

(declare-fun lt!235776 () (_ BitVec 64))

(assert (=> b!150748 (= res!126380 (= (bitIndex!0 (size!3048 (buf!3529 (_2!7101 lt!235780))) (currentByte!6449 (_2!7101 lt!235780)) (currentBit!6444 (_2!7101 lt!235780))) (bvadd lt!235776 lt!235778)))))

(assert (=> b!150748 (or (not (= (bvand lt!235776 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!235778 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!235776 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!235776 lt!235778) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!235779 () (_ BitVec 64))

(assert (=> b!150748 (= lt!235778 (bvmul lt!235779 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!150748 (or (= lt!235779 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!235779 #b0000000000000000000000000000000000000000000000000000000000001000) lt!235779)))))

(assert (=> b!150748 (= lt!235779 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!150748 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!150748 (= lt!235776 (bitIndex!0 (size!3048 (buf!3529 (_2!7101 lt!235287))) (currentByte!6449 (_2!7101 lt!235287)) (currentBit!6444 (_2!7101 lt!235287))))))

(declare-fun b!150749 () Bool)

(assert (=> b!150749 (= e!100664 e!100663)))

(declare-fun res!126378 () Bool)

(assert (=> b!150749 (=> (not res!126378) (not e!100663))))

(declare-fun lt!235775 () tuple2!13472)

(assert (=> b!150749 (= res!126378 (and (= (size!3048 (_2!7102 lt!235777)) (size!3048 arr!237)) (= (_1!7102 lt!235777) (_2!7103 lt!235775))))))

(assert (=> b!150749 (= lt!235777 (readByteArrayLoopPure!0 (_1!7103 lt!235775) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!235772 () Unit!9496)

(declare-fun lt!235774 () Unit!9496)

(assert (=> b!150749 (= lt!235772 lt!235774)))

(assert (=> b!150749 (validate_offset_bits!1 ((_ sign_extend 32) (size!3048 (buf!3529 (_2!7101 lt!235780)))) ((_ sign_extend 32) (currentByte!6449 (_2!7101 lt!235287))) ((_ sign_extend 32) (currentBit!6444 (_2!7101 lt!235287))) lt!235773)))

(assert (=> b!150749 (= lt!235774 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!7101 lt!235287) (buf!3529 (_2!7101 lt!235780)) lt!235773))))

(assert (=> b!150749 e!100665))

(declare-fun res!126381 () Bool)

(assert (=> b!150749 (=> (not res!126381) (not e!100665))))

(assert (=> b!150749 (= res!126381 (and (= (size!3048 (buf!3529 (_2!7101 lt!235287))) (size!3048 (buf!3529 (_2!7101 lt!235780)))) (bvsge lt!235773 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!150749 (= lt!235773 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!150749 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!150749 (= lt!235775 (reader!0 (_2!7101 lt!235287) (_2!7101 lt!235780)))))

(declare-fun b!150750 () Bool)

(declare-fun res!126379 () Bool)

(assert (=> b!150750 (=> (not res!126379) (not e!100664))))

(assert (=> b!150750 (= res!126379 (isPrefixOf!0 (_2!7101 lt!235287) (_2!7101 lt!235780)))))

(assert (= (and d!49038 res!126382) b!150748))

(assert (= (and b!150748 res!126380) b!150750))

(assert (= (and b!150750 res!126379) b!150749))

(assert (= (and b!150749 res!126381) b!150746))

(assert (= (and b!150749 res!126378) b!150747))

(declare-fun m!235175 () Bool)

(assert (=> b!150746 m!235175))

(declare-fun m!235177 () Bool)

(assert (=> d!49038 m!235177))

(declare-fun m!235179 () Bool)

(assert (=> b!150750 m!235179))

(declare-fun m!235181 () Bool)

(assert (=> b!150749 m!235181))

(declare-fun m!235183 () Bool)

(assert (=> b!150749 m!235183))

(declare-fun m!235185 () Bool)

(assert (=> b!150749 m!235185))

(declare-fun m!235187 () Bool)

(assert (=> b!150749 m!235187))

(declare-fun m!235189 () Bool)

(assert (=> b!150747 m!235189))

(declare-fun m!235191 () Bool)

(assert (=> b!150748 m!235191))

(assert (=> b!150748 m!234761))

(assert (=> b!150547 d!49038))

(declare-fun d!49040 () Bool)

(declare-fun res!126384 () Bool)

(declare-fun e!100666 () Bool)

(assert (=> d!49040 (=> (not res!126384) (not e!100666))))

(assert (=> d!49040 (= res!126384 (= (size!3048 (buf!3529 (_2!7101 lt!235287))) (size!3048 (buf!3529 (_2!7101 lt!235270)))))))

(assert (=> d!49040 (= (isPrefixOf!0 (_2!7101 lt!235287) (_2!7101 lt!235270)) e!100666)))

(declare-fun b!150751 () Bool)

(declare-fun res!126385 () Bool)

(assert (=> b!150751 (=> (not res!126385) (not e!100666))))

(assert (=> b!150751 (= res!126385 (bvsle (bitIndex!0 (size!3048 (buf!3529 (_2!7101 lt!235287))) (currentByte!6449 (_2!7101 lt!235287)) (currentBit!6444 (_2!7101 lt!235287))) (bitIndex!0 (size!3048 (buf!3529 (_2!7101 lt!235270))) (currentByte!6449 (_2!7101 lt!235270)) (currentBit!6444 (_2!7101 lt!235270)))))))

(declare-fun b!150752 () Bool)

(declare-fun e!100667 () Bool)

(assert (=> b!150752 (= e!100666 e!100667)))

(declare-fun res!126383 () Bool)

(assert (=> b!150752 (=> res!126383 e!100667)))

(assert (=> b!150752 (= res!126383 (= (size!3048 (buf!3529 (_2!7101 lt!235287))) #b00000000000000000000000000000000))))

(declare-fun b!150753 () Bool)

(assert (=> b!150753 (= e!100667 (arrayBitRangesEq!0 (buf!3529 (_2!7101 lt!235287)) (buf!3529 (_2!7101 lt!235270)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3048 (buf!3529 (_2!7101 lt!235287))) (currentByte!6449 (_2!7101 lt!235287)) (currentBit!6444 (_2!7101 lt!235287)))))))

(assert (= (and d!49040 res!126384) b!150751))

(assert (= (and b!150751 res!126385) b!150752))

(assert (= (and b!150752 (not res!126383)) b!150753))

(assert (=> b!150751 m!234761))

(assert (=> b!150751 m!234779))

(assert (=> b!150753 m!234761))

(assert (=> b!150753 m!234761))

(declare-fun m!235193 () Bool)

(assert (=> b!150753 m!235193))

(assert (=> b!150546 d!49040))

(assert (=> b!150557 d!48935))

(assert (=> b!150557 d!48971))

(push 1)

(assert (not b!150593))

(assert (not d!49019))

(assert (not d!48995))

(assert (not d!48987))

(assert (not b!150733))

(assert (not b!150690))

(assert (not b!150678))

(assert (not b!150674))

(assert (not b!150735))

(assert (not b!150672))

(assert (not b!150621))

(assert (not b!150712))

(assert (not d!49003))

(assert (not b!150714))

(assert (not d!48935))

(assert (not d!49001))

(assert (not d!48933))

(assert (not d!48884))

(assert (not d!48997))

(assert (not b!150726))

(assert (not d!49036))

(assert (not b!150623))

(assert (not d!48971))

(assert (not d!48931))

(assert (not b!150749))

(assert (not d!49021))

(assert (not b!150685))

(assert (not d!48999))

(assert (not b!150751))

(assert (not d!49038))

(assert (not b!150734))

(assert (not b!150715))

(assert (not d!49027))

(assert (not d!48981))

(assert (not b!150679))

(assert (not d!48947))

(assert (not b!150671))

(assert (not d!48945))

(assert (not b!150680))

(assert (not d!48991))

(assert (not d!48977))

(assert (not b!150599))

(assert (not b!150747))

(assert (not b!150746))

(assert (not b!150713))

(assert (not b!150748))

(assert (not b!150625))

(assert (not d!49029))

(assert (not d!49031))

(assert (not d!48961))

(assert (not d!49005))

(assert (not d!49011))

(assert (not d!48985))

(assert (not b!150688))

(assert (not d!48965))

(assert (not b!150692))

(assert (not d!49015))

(assert (not b!150750))

(assert (not d!48973))

(assert (not b!150681))

(assert (not b!150673))

(assert (not d!48888))

(assert (not d!48928))

(assert (not d!48975))

(assert (not d!48963))

(assert (not b!150753))

(assert (not d!48993))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

