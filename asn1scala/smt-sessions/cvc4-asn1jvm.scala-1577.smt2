; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44812 () Bool)

(assert start!44812)

(declare-fun b!214700 () Bool)

(declare-fun e!146143 () Bool)

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!214700 (= e!146143 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand i!590 #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 i!590) #b10000000000000000000000000000000))))))

(declare-datatypes ((array!10575 0))(
  ( (array!10576 (arr!5574 (Array (_ BitVec 32) (_ BitVec 8))) (size!4644 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8396 0))(
  ( (BitStream!8397 (buf!5179 array!10575) (currentByte!9757 (_ BitVec 32)) (currentBit!9752 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8396)

(declare-datatypes ((Unit!15272 0))(
  ( (Unit!15273) )
))
(declare-datatypes ((tuple2!18378 0))(
  ( (tuple2!18379 (_1!9844 Unit!15272) (_2!9844 BitStream!8396)) )
))
(declare-fun lt!339263 () tuple2!18378)

(assert (=> b!214700 (= (size!4644 (buf!5179 thiss!1204)) (size!4644 (buf!5179 (_2!9844 lt!339263))))))

(declare-fun b!214701 () Bool)

(declare-fun e!146145 () Bool)

(declare-fun e!146136 () Bool)

(assert (=> b!214701 (= e!146145 e!146136)))

(declare-fun res!180525 () Bool)

(assert (=> b!214701 (=> (not res!180525) (not e!146136))))

(declare-fun lt!339265 () (_ BitVec 64))

(declare-fun lt!339256 () (_ BitVec 64))

(assert (=> b!214701 (= res!180525 (= lt!339265 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!339256)))))

(declare-fun lt!339264 () tuple2!18378)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!214701 (= lt!339265 (bitIndex!0 (size!4644 (buf!5179 (_2!9844 lt!339264))) (currentByte!9757 (_2!9844 lt!339264)) (currentBit!9752 (_2!9844 lt!339264))))))

(assert (=> b!214701 (= lt!339256 (bitIndex!0 (size!4644 (buf!5179 thiss!1204)) (currentByte!9757 thiss!1204) (currentBit!9752 thiss!1204)))))

(declare-fun b!214702 () Bool)

(declare-fun res!180540 () Bool)

(assert (=> b!214702 (=> res!180540 e!146143)))

(declare-datatypes ((tuple2!18380 0))(
  ( (tuple2!18381 (_1!9845 BitStream!8396) (_2!9845 (_ BitVec 64))) )
))
(declare-fun lt!339274 () tuple2!18380)

(declare-datatypes ((tuple2!18382 0))(
  ( (tuple2!18383 (_1!9846 BitStream!8396) (_2!9846 BitStream!8396)) )
))
(declare-fun lt!339260 () tuple2!18382)

(assert (=> b!214702 (= res!180540 (not (= (bitIndex!0 (size!4644 (buf!5179 (_1!9845 lt!339274))) (currentByte!9757 (_1!9845 lt!339274)) (currentBit!9752 (_1!9845 lt!339274))) (bitIndex!0 (size!4644 (buf!5179 (_2!9846 lt!339260))) (currentByte!9757 (_2!9846 lt!339260)) (currentBit!9752 (_2!9846 lt!339260))))))))

(declare-fun b!214703 () Bool)

(declare-fun res!180538 () Bool)

(assert (=> b!214703 (=> (not res!180538) (not e!146136))))

(declare-fun isPrefixOf!0 (BitStream!8396 BitStream!8396) Bool)

(assert (=> b!214703 (= res!180538 (isPrefixOf!0 thiss!1204 (_2!9844 lt!339264)))))

(declare-fun e!146137 () Bool)

(declare-fun lt!339266 () tuple2!18382)

(declare-fun lt!339267 () (_ BitVec 64))

(declare-fun b!214704 () Bool)

(declare-fun lt!339272 () tuple2!18380)

(declare-fun lt!339268 () (_ BitVec 64))

(declare-fun lt!339279 () BitStream!8396)

(assert (=> b!214704 (= e!146137 (and (= lt!339267 (bvsub lt!339268 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!9846 lt!339266) lt!339279)) (= (_2!9845 lt!339274) (_2!9845 lt!339272)))))))

(declare-fun b!214705 () Bool)

(declare-fun res!180529 () Bool)

(declare-fun e!146133 () Bool)

(assert (=> b!214705 (=> res!180529 e!146133)))

(assert (=> b!214705 (= res!180529 (not (isPrefixOf!0 thiss!1204 (_2!9844 lt!339264))))))

(declare-fun b!214706 () Bool)

(declare-fun e!146140 () Bool)

(declare-fun array_inv!4385 (array!10575) Bool)

(assert (=> b!214706 (= e!146140 (array_inv!4385 (buf!5179 thiss!1204)))))

(declare-fun b!214707 () Bool)

(declare-fun res!180542 () Bool)

(assert (=> b!214707 (=> res!180542 e!146133)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!214707 (= res!180542 (not (invariant!0 (currentBit!9752 (_2!9844 lt!339263)) (currentByte!9757 (_2!9844 lt!339263)) (size!4644 (buf!5179 (_2!9844 lt!339263))))))))

(declare-fun b!214709 () Bool)

(declare-fun e!146141 () Bool)

(declare-fun e!146139 () Bool)

(assert (=> b!214709 (= e!146141 e!146139)))

(declare-fun res!180543 () Bool)

(assert (=> b!214709 (=> (not res!180543) (not e!146139))))

(declare-fun lt!339283 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!214709 (= res!180543 (validate_offset_bits!1 ((_ sign_extend 32) (size!4644 (buf!5179 thiss!1204))) ((_ sign_extend 32) (currentByte!9757 thiss!1204)) ((_ sign_extend 32) (currentBit!9752 thiss!1204)) lt!339283))))

(assert (=> b!214709 (= lt!339283 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!214710 () Bool)

(declare-fun e!146135 () Bool)

(assert (=> b!214710 (= e!146133 e!146135)))

(declare-fun res!180528 () Bool)

(assert (=> b!214710 (=> res!180528 e!146135)))

(assert (=> b!214710 (= res!180528 (not (= (_1!9845 lt!339272) (_2!9846 lt!339266))))))

(declare-fun lt!339281 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8396 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18380)

(assert (=> b!214710 (= lt!339272 (readNBitsLSBFirstsLoopPure!0 (_1!9846 lt!339266) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!339281))))

(declare-fun lt!339277 () (_ BitVec 64))

(assert (=> b!214710 (validate_offset_bits!1 ((_ sign_extend 32) (size!4644 (buf!5179 (_2!9844 lt!339263)))) ((_ sign_extend 32) (currentByte!9757 (_2!9844 lt!339264))) ((_ sign_extend 32) (currentBit!9752 (_2!9844 lt!339264))) lt!339277)))

(declare-fun lt!339270 () Unit!15272)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8396 array!10575 (_ BitVec 64)) Unit!15272)

(assert (=> b!214710 (= lt!339270 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9844 lt!339264) (buf!5179 (_2!9844 lt!339263)) lt!339277))))

(assert (=> b!214710 (= lt!339277 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!339271 () (_ BitVec 64))

(declare-fun lt!339261 () (_ BitVec 64))

(declare-datatypes ((tuple2!18384 0))(
  ( (tuple2!18385 (_1!9847 BitStream!8396) (_2!9847 Bool)) )
))
(declare-fun lt!339284 () tuple2!18384)

(assert (=> b!214710 (= lt!339281 (bvor lt!339261 (ite (_2!9847 lt!339284) lt!339271 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!214710 (= lt!339274 (readNBitsLSBFirstsLoopPure!0 (_1!9846 lt!339260) nBits!348 i!590 lt!339261))))

(assert (=> b!214710 (validate_offset_bits!1 ((_ sign_extend 32) (size!4644 (buf!5179 (_2!9844 lt!339263)))) ((_ sign_extend 32) (currentByte!9757 thiss!1204)) ((_ sign_extend 32) (currentBit!9752 thiss!1204)) lt!339283)))

(declare-fun lt!339282 () Unit!15272)

(assert (=> b!214710 (= lt!339282 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5179 (_2!9844 lt!339263)) lt!339283))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!214710 (= lt!339261 (bvand v!189 (onesLSBLong!0 i!590)))))

(declare-fun lt!339273 () Bool)

(assert (=> b!214710 (= (_2!9847 lt!339284) lt!339273)))

(declare-fun readBitPure!0 (BitStream!8396) tuple2!18384)

(assert (=> b!214710 (= lt!339284 (readBitPure!0 (_1!9846 lt!339260)))))

(declare-fun reader!0 (BitStream!8396 BitStream!8396) tuple2!18382)

(assert (=> b!214710 (= lt!339266 (reader!0 (_2!9844 lt!339264) (_2!9844 lt!339263)))))

(assert (=> b!214710 (= lt!339260 (reader!0 thiss!1204 (_2!9844 lt!339263)))))

(declare-fun e!146144 () Bool)

(assert (=> b!214710 e!146144))

(declare-fun res!180537 () Bool)

(assert (=> b!214710 (=> (not res!180537) (not e!146144))))

(declare-fun lt!339262 () tuple2!18384)

(declare-fun lt!339280 () tuple2!18384)

(assert (=> b!214710 (= res!180537 (= (bitIndex!0 (size!4644 (buf!5179 (_1!9847 lt!339262))) (currentByte!9757 (_1!9847 lt!339262)) (currentBit!9752 (_1!9847 lt!339262))) (bitIndex!0 (size!4644 (buf!5179 (_1!9847 lt!339280))) (currentByte!9757 (_1!9847 lt!339280)) (currentBit!9752 (_1!9847 lt!339280)))))))

(declare-fun lt!339269 () Unit!15272)

(declare-fun lt!339278 () BitStream!8396)

(declare-fun readBitPrefixLemma!0 (BitStream!8396 BitStream!8396) Unit!15272)

(assert (=> b!214710 (= lt!339269 (readBitPrefixLemma!0 lt!339278 (_2!9844 lt!339263)))))

(assert (=> b!214710 (= lt!339280 (readBitPure!0 (BitStream!8397 (buf!5179 (_2!9844 lt!339263)) (currentByte!9757 thiss!1204) (currentBit!9752 thiss!1204))))))

(assert (=> b!214710 (= lt!339262 (readBitPure!0 lt!339278))))

(declare-fun e!146142 () Bool)

(assert (=> b!214710 e!146142))

(declare-fun res!180531 () Bool)

(assert (=> b!214710 (=> (not res!180531) (not e!146142))))

(assert (=> b!214710 (= res!180531 (invariant!0 (currentBit!9752 thiss!1204) (currentByte!9757 thiss!1204) (size!4644 (buf!5179 (_2!9844 lt!339264)))))))

(assert (=> b!214710 (= lt!339278 (BitStream!8397 (buf!5179 (_2!9844 lt!339264)) (currentByte!9757 thiss!1204) (currentBit!9752 thiss!1204)))))

(declare-fun b!214711 () Bool)

(declare-fun res!180526 () Bool)

(assert (=> b!214711 (=> res!180526 e!146133)))

(declare-fun lt!339276 () (_ BitVec 64))

(assert (=> b!214711 (= res!180526 (or (not (= (size!4644 (buf!5179 (_2!9844 lt!339263))) (size!4644 (buf!5179 thiss!1204)))) (not (= lt!339276 (bvsub (bvadd lt!339267 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!214712 () Bool)

(assert (=> b!214712 (= e!146135 e!146143)))

(declare-fun res!180534 () Bool)

(assert (=> b!214712 (=> res!180534 e!146143)))

(assert (=> b!214712 (= res!180534 (not (= (_1!9846 lt!339266) lt!339279)))))

(assert (=> b!214712 e!146137))

(declare-fun res!180539 () Bool)

(assert (=> b!214712 (=> (not res!180539) (not e!146137))))

(declare-fun lt!339257 () tuple2!18380)

(assert (=> b!214712 (= res!180539 (and (= (_2!9845 lt!339274) (_2!9845 lt!339257)) (= (_1!9845 lt!339274) (_1!9845 lt!339257))))))

(declare-fun lt!339259 () Unit!15272)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8396 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!15272)

(assert (=> b!214712 (= lt!339259 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9846 lt!339260) nBits!348 i!590 lt!339261))))

(assert (=> b!214712 (= lt!339257 (readNBitsLSBFirstsLoopPure!0 lt!339279 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!339281))))

(declare-fun withMovedBitIndex!0 (BitStream!8396 (_ BitVec 64)) BitStream!8396)

(assert (=> b!214712 (= lt!339279 (withMovedBitIndex!0 (_1!9846 lt!339260) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!214713 () Bool)

(assert (=> b!214713 (= e!146144 (= (_2!9847 lt!339262) (_2!9847 lt!339280)))))

(declare-fun b!214714 () Bool)

(declare-fun e!146132 () Bool)

(assert (=> b!214714 (= e!146139 (not e!146132))))

(declare-fun res!180544 () Bool)

(assert (=> b!214714 (=> res!180544 e!146132)))

(assert (=> b!214714 (= res!180544 (not (= lt!339268 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!339267))))))

(assert (=> b!214714 (= lt!339268 (bitIndex!0 (size!4644 (buf!5179 (_2!9844 lt!339264))) (currentByte!9757 (_2!9844 lt!339264)) (currentBit!9752 (_2!9844 lt!339264))))))

(assert (=> b!214714 (= lt!339267 (bitIndex!0 (size!4644 (buf!5179 thiss!1204)) (currentByte!9757 thiss!1204) (currentBit!9752 thiss!1204)))))

(assert (=> b!214714 e!146145))

(declare-fun res!180545 () Bool)

(assert (=> b!214714 (=> (not res!180545) (not e!146145))))

(assert (=> b!214714 (= res!180545 (= (size!4644 (buf!5179 thiss!1204)) (size!4644 (buf!5179 (_2!9844 lt!339264)))))))

(declare-fun appendBit!0 (BitStream!8396 Bool) tuple2!18378)

(assert (=> b!214714 (= lt!339264 (appendBit!0 thiss!1204 lt!339273))))

(assert (=> b!214714 (= lt!339273 (not (= (bvand v!189 lt!339271) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!214714 (= lt!339271 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!214715 () Bool)

(declare-fun e!146134 () Bool)

(assert (=> b!214715 (= e!146136 e!146134)))

(declare-fun res!180535 () Bool)

(assert (=> b!214715 (=> (not res!180535) (not e!146134))))

(declare-fun lt!339258 () tuple2!18384)

(assert (=> b!214715 (= res!180535 (and (= (_2!9847 lt!339258) lt!339273) (= (_1!9847 lt!339258) (_2!9844 lt!339264))))))

(declare-fun readerFrom!0 (BitStream!8396 (_ BitVec 32) (_ BitVec 32)) BitStream!8396)

(assert (=> b!214715 (= lt!339258 (readBitPure!0 (readerFrom!0 (_2!9844 lt!339264) (currentBit!9752 thiss!1204) (currentByte!9757 thiss!1204))))))

(declare-fun b!214716 () Bool)

(assert (=> b!214716 (= e!146134 (= (bitIndex!0 (size!4644 (buf!5179 (_1!9847 lt!339258))) (currentByte!9757 (_1!9847 lt!339258)) (currentBit!9752 (_1!9847 lt!339258))) lt!339265))))

(declare-fun b!214717 () Bool)

(declare-fun res!180533 () Bool)

(assert (=> b!214717 (=> (not res!180533) (not e!146139))))

(assert (=> b!214717 (= res!180533 (not (= i!590 nBits!348)))))

(declare-fun b!214718 () Bool)

(declare-fun res!180536 () Bool)

(assert (=> b!214718 (=> res!180536 e!146133)))

(assert (=> b!214718 (= res!180536 (not (isPrefixOf!0 (_2!9844 lt!339264) (_2!9844 lt!339263))))))

(declare-fun b!214719 () Bool)

(declare-fun res!180532 () Bool)

(assert (=> b!214719 (=> (not res!180532) (not e!146137))))

(assert (=> b!214719 (= res!180532 (= (_1!9846 lt!339260) (withMovedBitIndex!0 (_2!9846 lt!339260) (bvsub lt!339267 lt!339276))))))

(declare-fun b!214720 () Bool)

(declare-fun res!180530 () Bool)

(assert (=> b!214720 (=> (not res!180530) (not e!146137))))

(assert (=> b!214720 (= res!180530 (= (_1!9846 lt!339266) (withMovedBitIndex!0 (_2!9846 lt!339266) (bvsub lt!339268 lt!339276))))))

(declare-fun b!214721 () Bool)

(declare-fun res!180541 () Bool)

(assert (=> b!214721 (=> (not res!180541) (not e!146139))))

(assert (=> b!214721 (= res!180541 (invariant!0 (currentBit!9752 thiss!1204) (currentByte!9757 thiss!1204) (size!4644 (buf!5179 thiss!1204))))))

(declare-fun b!214722 () Bool)

(assert (=> b!214722 (= e!146142 (invariant!0 (currentBit!9752 thiss!1204) (currentByte!9757 thiss!1204) (size!4644 (buf!5179 (_2!9844 lt!339263)))))))

(declare-fun res!180524 () Bool)

(assert (=> start!44812 (=> (not res!180524) (not e!146141))))

(assert (=> start!44812 (= res!180524 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!44812 e!146141))

(assert (=> start!44812 true))

(declare-fun inv!12 (BitStream!8396) Bool)

(assert (=> start!44812 (and (inv!12 thiss!1204) e!146140)))

(declare-fun b!214708 () Bool)

(assert (=> b!214708 (= e!146132 e!146133)))

(declare-fun res!180527 () Bool)

(assert (=> b!214708 (=> res!180527 e!146133)))

(assert (=> b!214708 (= res!180527 (not (= lt!339276 (bvsub (bvsub (bvadd lt!339268 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!214708 (= lt!339276 (bitIndex!0 (size!4644 (buf!5179 (_2!9844 lt!339263))) (currentByte!9757 (_2!9844 lt!339263)) (currentBit!9752 (_2!9844 lt!339263))))))

(assert (=> b!214708 (isPrefixOf!0 thiss!1204 (_2!9844 lt!339263))))

(declare-fun lt!339275 () Unit!15272)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8396 BitStream!8396 BitStream!8396) Unit!15272)

(assert (=> b!214708 (= lt!339275 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9844 lt!339264) (_2!9844 lt!339263)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8396 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!18378)

(assert (=> b!214708 (= lt!339263 (appendBitsLSBFirstLoopTR!0 (_2!9844 lt!339264) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(assert (= (and start!44812 res!180524) b!214709))

(assert (= (and b!214709 res!180543) b!214721))

(assert (= (and b!214721 res!180541) b!214717))

(assert (= (and b!214717 res!180533) b!214714))

(assert (= (and b!214714 res!180545) b!214701))

(assert (= (and b!214701 res!180525) b!214703))

(assert (= (and b!214703 res!180538) b!214715))

(assert (= (and b!214715 res!180535) b!214716))

(assert (= (and b!214714 (not res!180544)) b!214708))

(assert (= (and b!214708 (not res!180527)) b!214707))

(assert (= (and b!214707 (not res!180542)) b!214711))

(assert (= (and b!214711 (not res!180526)) b!214718))

(assert (= (and b!214718 (not res!180536)) b!214705))

(assert (= (and b!214705 (not res!180529)) b!214710))

(assert (= (and b!214710 res!180531) b!214722))

(assert (= (and b!214710 res!180537) b!214713))

(assert (= (and b!214710 (not res!180528)) b!214712))

(assert (= (and b!214712 res!180539) b!214719))

(assert (= (and b!214719 res!180532) b!214720))

(assert (= (and b!214720 res!180530) b!214704))

(assert (= (and b!214712 (not res!180534)) b!214702))

(assert (= (and b!214702 (not res!180540)) b!214700))

(assert (= start!44812 b!214706))

(declare-fun m!330803 () Bool)

(assert (=> b!214706 m!330803))

(declare-fun m!330805 () Bool)

(assert (=> b!214719 m!330805))

(declare-fun m!330807 () Bool)

(assert (=> b!214710 m!330807))

(declare-fun m!330809 () Bool)

(assert (=> b!214710 m!330809))

(declare-fun m!330811 () Bool)

(assert (=> b!214710 m!330811))

(declare-fun m!330813 () Bool)

(assert (=> b!214710 m!330813))

(declare-fun m!330815 () Bool)

(assert (=> b!214710 m!330815))

(declare-fun m!330817 () Bool)

(assert (=> b!214710 m!330817))

(declare-fun m!330819 () Bool)

(assert (=> b!214710 m!330819))

(declare-fun m!330821 () Bool)

(assert (=> b!214710 m!330821))

(declare-fun m!330823 () Bool)

(assert (=> b!214710 m!330823))

(declare-fun m!330825 () Bool)

(assert (=> b!214710 m!330825))

(declare-fun m!330827 () Bool)

(assert (=> b!214710 m!330827))

(declare-fun m!330829 () Bool)

(assert (=> b!214710 m!330829))

(declare-fun m!330831 () Bool)

(assert (=> b!214710 m!330831))

(declare-fun m!330833 () Bool)

(assert (=> b!214710 m!330833))

(declare-fun m!330835 () Bool)

(assert (=> b!214710 m!330835))

(declare-fun m!330837 () Bool)

(assert (=> b!214710 m!330837))

(declare-fun m!330839 () Bool)

(assert (=> b!214714 m!330839))

(declare-fun m!330841 () Bool)

(assert (=> b!214714 m!330841))

(declare-fun m!330843 () Bool)

(assert (=> b!214714 m!330843))

(declare-fun m!330845 () Bool)

(assert (=> b!214718 m!330845))

(declare-fun m!330847 () Bool)

(assert (=> b!214708 m!330847))

(declare-fun m!330849 () Bool)

(assert (=> b!214708 m!330849))

(declare-fun m!330851 () Bool)

(assert (=> b!214708 m!330851))

(declare-fun m!330853 () Bool)

(assert (=> b!214708 m!330853))

(declare-fun m!330855 () Bool)

(assert (=> b!214702 m!330855))

(declare-fun m!330857 () Bool)

(assert (=> b!214702 m!330857))

(declare-fun m!330859 () Bool)

(assert (=> b!214720 m!330859))

(assert (=> b!214701 m!330839))

(assert (=> b!214701 m!330841))

(declare-fun m!330861 () Bool)

(assert (=> b!214712 m!330861))

(declare-fun m!330863 () Bool)

(assert (=> b!214712 m!330863))

(declare-fun m!330865 () Bool)

(assert (=> b!214712 m!330865))

(declare-fun m!330867 () Bool)

(assert (=> b!214721 m!330867))

(declare-fun m!330869 () Bool)

(assert (=> b!214716 m!330869))

(declare-fun m!330871 () Bool)

(assert (=> b!214722 m!330871))

(declare-fun m!330873 () Bool)

(assert (=> b!214707 m!330873))

(declare-fun m!330875 () Bool)

(assert (=> b!214709 m!330875))

(declare-fun m!330877 () Bool)

(assert (=> start!44812 m!330877))

(declare-fun m!330879 () Bool)

(assert (=> b!214705 m!330879))

(declare-fun m!330881 () Bool)

(assert (=> b!214715 m!330881))

(assert (=> b!214715 m!330881))

(declare-fun m!330883 () Bool)

(assert (=> b!214715 m!330883))

(assert (=> b!214703 m!330879))

(push 1)

(assert (not b!214721))

(assert (not b!214708))

(assert (not b!214710))

(assert (not b!214712))

(assert (not b!214705))

(assert (not b!214709))

(assert (not b!214702))

(assert (not b!214701))

(assert (not b!214718))

(assert (not b!214722))

(assert (not b!214719))

(assert (not b!214715))

(assert (not start!44812))

(assert (not b!214716))

(assert (not b!214714))

(assert (not b!214703))

(assert (not b!214707))

(assert (not b!214720))

(assert (not b!214706))

(check-sat)

(pop 1)

(push 1)

(check-sat)

