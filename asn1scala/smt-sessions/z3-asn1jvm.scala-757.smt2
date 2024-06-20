; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21738 () Bool)

(assert start!21738)

(declare-fun b!109816 () Bool)

(declare-fun e!71963 () Bool)

(declare-fun e!71957 () Bool)

(assert (=> b!109816 (= e!71963 (not e!71957))))

(declare-fun res!90623 () Bool)

(assert (=> b!109816 (=> res!90623 e!71957)))

(declare-datatypes ((array!4996 0))(
  ( (array!4997 (arr!2866 (Array (_ BitVec 32) (_ BitVec 8))) (size!2273 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4020 0))(
  ( (BitStream!4021 (buf!2667 array!4996) (currentByte!5209 (_ BitVec 32)) (currentBit!5204 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!9128 0))(
  ( (tuple2!9129 (_1!4821 BitStream!4020) (_2!4821 (_ BitVec 64))) )
))
(declare-fun lt!166538 () tuple2!9128)

(declare-datatypes ((tuple2!9130 0))(
  ( (tuple2!9131 (_1!4822 BitStream!4020) (_2!4822 BitStream!4020)) )
))
(declare-fun lt!166542 () tuple2!9130)

(assert (=> b!109816 (= res!90623 (not (= (_1!4821 lt!166538) (_2!4822 lt!166542))))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun lt!166544 () (_ BitVec 64))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4020 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9128)

(assert (=> b!109816 (= lt!166538 (readNLeastSignificantBitsLoopPure!0 (_1!4822 lt!166542) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!166544))))

(declare-datatypes ((Unit!6711 0))(
  ( (Unit!6712) )
))
(declare-datatypes ((tuple2!9132 0))(
  ( (tuple2!9133 (_1!4823 Unit!6711) (_2!4823 BitStream!4020)) )
))
(declare-fun lt!166525 () tuple2!9132)

(declare-fun lt!166519 () tuple2!9132)

(declare-fun lt!166522 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!109816 (validate_offset_bits!1 ((_ sign_extend 32) (size!2273 (buf!2667 (_2!4823 lt!166525)))) ((_ sign_extend 32) (currentByte!5209 (_2!4823 lt!166519))) ((_ sign_extend 32) (currentBit!5204 (_2!4823 lt!166519))) lt!166522)))

(declare-fun lt!166518 () Unit!6711)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4020 array!4996 (_ BitVec 64)) Unit!6711)

(assert (=> b!109816 (= lt!166518 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4823 lt!166519) (buf!2667 (_2!4823 lt!166525)) lt!166522))))

(assert (=> b!109816 (= lt!166522 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!166541 () (_ BitVec 64))

(declare-datatypes ((tuple2!9134 0))(
  ( (tuple2!9135 (_1!4824 BitStream!4020) (_2!4824 Bool)) )
))
(declare-fun lt!166546 () tuple2!9134)

(declare-fun lt!166524 () (_ BitVec 64))

(assert (=> b!109816 (= lt!166544 (bvor lt!166541 (ite (_2!4824 lt!166546) lt!166524 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!166532 () tuple2!9128)

(declare-fun lt!166537 () tuple2!9130)

(assert (=> b!109816 (= lt!166532 (readNLeastSignificantBitsLoopPure!0 (_1!4822 lt!166537) nBits!396 i!615 lt!166541))))

(declare-fun thiss!1305 () BitStream!4020)

(declare-fun lt!166529 () (_ BitVec 64))

(assert (=> b!109816 (validate_offset_bits!1 ((_ sign_extend 32) (size!2273 (buf!2667 (_2!4823 lt!166525)))) ((_ sign_extend 32) (currentByte!5209 thiss!1305)) ((_ sign_extend 32) (currentBit!5204 thiss!1305)) lt!166529)))

(declare-fun lt!166533 () Unit!6711)

(assert (=> b!109816 (= lt!166533 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2667 (_2!4823 lt!166525)) lt!166529))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun lt!166540 () (_ BitVec 64))

(assert (=> b!109816 (= lt!166541 (bvand v!199 (bvnot lt!166540)))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!109816 (= lt!166540 (onesLSBLong!0 (bvsub nBits!396 i!615)))))

(declare-fun lt!166530 () Bool)

(assert (=> b!109816 (= (_2!4824 lt!166546) lt!166530)))

(declare-fun readBitPure!0 (BitStream!4020) tuple2!9134)

(assert (=> b!109816 (= lt!166546 (readBitPure!0 (_1!4822 lt!166537)))))

(declare-fun reader!0 (BitStream!4020 BitStream!4020) tuple2!9130)

(assert (=> b!109816 (= lt!166542 (reader!0 (_2!4823 lt!166519) (_2!4823 lt!166525)))))

(assert (=> b!109816 (= lt!166537 (reader!0 thiss!1305 (_2!4823 lt!166525)))))

(declare-fun e!71959 () Bool)

(assert (=> b!109816 e!71959))

(declare-fun res!90627 () Bool)

(assert (=> b!109816 (=> (not res!90627) (not e!71959))))

(declare-fun lt!166521 () tuple2!9134)

(declare-fun lt!166534 () tuple2!9134)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!109816 (= res!90627 (= (bitIndex!0 (size!2273 (buf!2667 (_1!4824 lt!166521))) (currentByte!5209 (_1!4824 lt!166521)) (currentBit!5204 (_1!4824 lt!166521))) (bitIndex!0 (size!2273 (buf!2667 (_1!4824 lt!166534))) (currentByte!5209 (_1!4824 lt!166534)) (currentBit!5204 (_1!4824 lt!166534)))))))

(declare-fun lt!166520 () Unit!6711)

(declare-fun lt!166543 () BitStream!4020)

(declare-fun readBitPrefixLemma!0 (BitStream!4020 BitStream!4020) Unit!6711)

(assert (=> b!109816 (= lt!166520 (readBitPrefixLemma!0 lt!166543 (_2!4823 lt!166525)))))

(assert (=> b!109816 (= lt!166534 (readBitPure!0 (BitStream!4021 (buf!2667 (_2!4823 lt!166525)) (currentByte!5209 thiss!1305) (currentBit!5204 thiss!1305))))))

(assert (=> b!109816 (= lt!166521 (readBitPure!0 lt!166543))))

(assert (=> b!109816 (= lt!166543 (BitStream!4021 (buf!2667 (_2!4823 lt!166519)) (currentByte!5209 thiss!1305) (currentBit!5204 thiss!1305)))))

(declare-fun e!71953 () Bool)

(assert (=> b!109816 e!71953))

(declare-fun res!90630 () Bool)

(assert (=> b!109816 (=> (not res!90630) (not e!71953))))

(declare-fun isPrefixOf!0 (BitStream!4020 BitStream!4020) Bool)

(assert (=> b!109816 (= res!90630 (isPrefixOf!0 thiss!1305 (_2!4823 lt!166525)))))

(declare-fun lt!166527 () Unit!6711)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4020 BitStream!4020 BitStream!4020) Unit!6711)

(assert (=> b!109816 (= lt!166527 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4823 lt!166519) (_2!4823 lt!166525)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4020 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9132)

(assert (=> b!109816 (= lt!166525 (appendNLeastSignificantBitsLoop!0 (_2!4823 lt!166519) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!71960 () Bool)

(assert (=> b!109816 e!71960))

(declare-fun res!90628 () Bool)

(assert (=> b!109816 (=> (not res!90628) (not e!71960))))

(assert (=> b!109816 (= res!90628 (= (size!2273 (buf!2667 thiss!1305)) (size!2273 (buf!2667 (_2!4823 lt!166519)))))))

(declare-fun appendBit!0 (BitStream!4020 Bool) tuple2!9132)

(assert (=> b!109816 (= lt!166519 (appendBit!0 thiss!1305 lt!166530))))

(assert (=> b!109816 (= lt!166530 (not (= (bvand v!199 lt!166524) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!109816 (= lt!166524 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!109817 () Bool)

(declare-fun e!71956 () Bool)

(assert (=> b!109817 (= e!71956 e!71963)))

(declare-fun res!90625 () Bool)

(assert (=> b!109817 (=> (not res!90625) (not e!71963))))

(assert (=> b!109817 (= res!90625 (validate_offset_bits!1 ((_ sign_extend 32) (size!2273 (buf!2667 thiss!1305))) ((_ sign_extend 32) (currentByte!5209 thiss!1305)) ((_ sign_extend 32) (currentBit!5204 thiss!1305)) lt!166529))))

(assert (=> b!109817 (= lt!166529 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun res!90631 () Bool)

(assert (=> start!21738 (=> (not res!90631) (not e!71956))))

(assert (=> start!21738 (= res!90631 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21738 e!71956))

(assert (=> start!21738 true))

(declare-fun e!71954 () Bool)

(declare-fun inv!12 (BitStream!4020) Bool)

(assert (=> start!21738 (and (inv!12 thiss!1305) e!71954)))

(declare-fun b!109818 () Bool)

(assert (=> b!109818 (= e!71959 (= (_2!4824 lt!166521) (_2!4824 lt!166534)))))

(declare-fun b!109819 () Bool)

(declare-fun res!90626 () Bool)

(assert (=> b!109819 (=> (not res!90626) (not e!71963))))

(assert (=> b!109819 (= res!90626 (bvslt i!615 nBits!396))))

(declare-fun b!109820 () Bool)

(declare-fun res!90633 () Bool)

(declare-fun e!71962 () Bool)

(assert (=> b!109820 (=> res!90633 e!71962)))

(assert (=> b!109820 (= res!90633 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!2273 (buf!2667 (_1!4822 lt!166537)))) ((_ sign_extend 32) (currentByte!5209 (_1!4822 lt!166537))) ((_ sign_extend 32) (currentBit!5204 (_1!4822 lt!166537))) lt!166529)))))

(declare-fun b!109821 () Bool)

(declare-fun res!90632 () Bool)

(declare-fun e!71958 () Bool)

(assert (=> b!109821 (=> (not res!90632) (not e!71958))))

(assert (=> b!109821 (= res!90632 (isPrefixOf!0 thiss!1305 (_2!4823 lt!166519)))))

(declare-fun b!109822 () Bool)

(assert (=> b!109822 (= e!71957 e!71962)))

(declare-fun res!90635 () Bool)

(assert (=> b!109822 (=> res!90635 e!71962)))

(declare-fun lt!166528 () (_ BitVec 64))

(declare-fun lt!166531 () (_ BitVec 64))

(declare-fun lt!166526 () BitStream!4020)

(assert (=> b!109822 (= res!90635 (or (not (= (_1!4822 lt!166542) lt!166526)) (not (= (size!2273 (buf!2667 thiss!1305)) (size!2273 (buf!2667 (_2!4823 lt!166525))))) (not (= lt!166531 (bvadd lt!166528 lt!166529)))))))

(declare-fun e!71961 () Bool)

(assert (=> b!109822 e!71961))

(declare-fun res!90634 () Bool)

(assert (=> b!109822 (=> (not res!90634) (not e!71961))))

(declare-fun lt!166545 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4020 (_ BitVec 64)) BitStream!4020)

(assert (=> b!109822 (= res!90634 (= (_1!4822 lt!166542) (withMovedBitIndex!0 (_2!4822 lt!166542) (bvsub lt!166545 lt!166531))))))

(assert (=> b!109822 (= lt!166545 (bitIndex!0 (size!2273 (buf!2667 (_2!4823 lt!166519))) (currentByte!5209 (_2!4823 lt!166519)) (currentBit!5204 (_2!4823 lt!166519))))))

(assert (=> b!109822 (= (_1!4822 lt!166537) (withMovedBitIndex!0 (_2!4822 lt!166537) (bvsub lt!166528 lt!166531)))))

(assert (=> b!109822 (= lt!166531 (bitIndex!0 (size!2273 (buf!2667 (_2!4823 lt!166525))) (currentByte!5209 (_2!4823 lt!166525)) (currentBit!5204 (_2!4823 lt!166525))))))

(assert (=> b!109822 (= lt!166528 (bitIndex!0 (size!2273 (buf!2667 thiss!1305)) (currentByte!5209 thiss!1305) (currentBit!5204 thiss!1305)))))

(declare-fun lt!166535 () tuple2!9128)

(assert (=> b!109822 (and (= (_2!4821 lt!166532) (_2!4821 lt!166535)) (= (_1!4821 lt!166532) (_1!4821 lt!166535)))))

(declare-fun lt!166536 () Unit!6711)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4020 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6711)

(assert (=> b!109822 (= lt!166536 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4822 lt!166537) nBits!396 i!615 lt!166541))))

(assert (=> b!109822 (= lt!166535 (readNLeastSignificantBitsLoopPure!0 lt!166526 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!166544))))

(assert (=> b!109822 (= lt!166526 (withMovedBitIndex!0 (_1!4822 lt!166537) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!109823 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!109823 (= e!71953 (invariant!0 (currentBit!5204 thiss!1305) (currentByte!5209 thiss!1305) (size!2273 (buf!2667 (_2!4823 lt!166525)))))))

(declare-fun b!109824 () Bool)

(assert (=> b!109824 (= e!71961 (and (= lt!166528 (bvsub lt!166545 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!4822 lt!166542) lt!166526)) (and (= (_2!4821 lt!166532) (_2!4821 lt!166538)) (= (_1!4821 lt!166532) (_2!4822 lt!166537))))))))

(declare-fun b!109825 () Bool)

(declare-fun res!90629 () Bool)

(assert (=> b!109825 (=> (not res!90629) (not e!71953))))

(assert (=> b!109825 (= res!90629 (invariant!0 (currentBit!5204 thiss!1305) (currentByte!5209 thiss!1305) (size!2273 (buf!2667 (_2!4823 lt!166519)))))))

(declare-fun b!109826 () Bool)

(declare-fun res!90636 () Bool)

(assert (=> b!109826 (=> (not res!90636) (not e!71963))))

(assert (=> b!109826 (= res!90636 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!109827 () Bool)

(declare-fun e!71955 () Bool)

(assert (=> b!109827 (= e!71958 e!71955)))

(declare-fun res!90624 () Bool)

(assert (=> b!109827 (=> (not res!90624) (not e!71955))))

(declare-fun lt!166523 () tuple2!9134)

(assert (=> b!109827 (= res!90624 (and (= (_2!4824 lt!166523) lt!166530) (= (_1!4824 lt!166523) (_2!4823 lt!166519))))))

(declare-fun readerFrom!0 (BitStream!4020 (_ BitVec 32) (_ BitVec 32)) BitStream!4020)

(assert (=> b!109827 (= lt!166523 (readBitPure!0 (readerFrom!0 (_2!4823 lt!166519) (currentBit!5204 thiss!1305) (currentByte!5209 thiss!1305))))))

(declare-fun b!109828 () Bool)

(assert (=> b!109828 (= e!71962 (= (bvand lt!166541 lt!166540) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!109829 () Bool)

(declare-fun lt!166547 () (_ BitVec 64))

(assert (=> b!109829 (= e!71955 (= (bitIndex!0 (size!2273 (buf!2667 (_1!4824 lt!166523))) (currentByte!5209 (_1!4824 lt!166523)) (currentBit!5204 (_1!4824 lt!166523))) lt!166547))))

(declare-fun b!109830 () Bool)

(declare-fun array_inv!2075 (array!4996) Bool)

(assert (=> b!109830 (= e!71954 (array_inv!2075 (buf!2667 thiss!1305)))))

(declare-fun b!109831 () Bool)

(assert (=> b!109831 (= e!71960 e!71958)))

(declare-fun res!90637 () Bool)

(assert (=> b!109831 (=> (not res!90637) (not e!71958))))

(declare-fun lt!166539 () (_ BitVec 64))

(assert (=> b!109831 (= res!90637 (= lt!166547 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!166539)))))

(assert (=> b!109831 (= lt!166547 (bitIndex!0 (size!2273 (buf!2667 (_2!4823 lt!166519))) (currentByte!5209 (_2!4823 lt!166519)) (currentBit!5204 (_2!4823 lt!166519))))))

(assert (=> b!109831 (= lt!166539 (bitIndex!0 (size!2273 (buf!2667 thiss!1305)) (currentByte!5209 thiss!1305) (currentBit!5204 thiss!1305)))))

(assert (= (and start!21738 res!90631) b!109817))

(assert (= (and b!109817 res!90625) b!109826))

(assert (= (and b!109826 res!90636) b!109819))

(assert (= (and b!109819 res!90626) b!109816))

(assert (= (and b!109816 res!90628) b!109831))

(assert (= (and b!109831 res!90637) b!109821))

(assert (= (and b!109821 res!90632) b!109827))

(assert (= (and b!109827 res!90624) b!109829))

(assert (= (and b!109816 res!90630) b!109825))

(assert (= (and b!109825 res!90629) b!109823))

(assert (= (and b!109816 res!90627) b!109818))

(assert (= (and b!109816 (not res!90623)) b!109822))

(assert (= (and b!109822 res!90634) b!109824))

(assert (= (and b!109822 (not res!90635)) b!109820))

(assert (= (and b!109820 (not res!90633)) b!109828))

(assert (= start!21738 b!109830))

(declare-fun m!163251 () Bool)

(assert (=> b!109831 m!163251))

(declare-fun m!163253 () Bool)

(assert (=> b!109831 m!163253))

(declare-fun m!163255 () Bool)

(assert (=> b!109830 m!163255))

(declare-fun m!163257 () Bool)

(assert (=> b!109823 m!163257))

(declare-fun m!163259 () Bool)

(assert (=> b!109826 m!163259))

(declare-fun m!163261 () Bool)

(assert (=> b!109829 m!163261))

(declare-fun m!163263 () Bool)

(assert (=> b!109825 m!163263))

(declare-fun m!163265 () Bool)

(assert (=> b!109827 m!163265))

(assert (=> b!109827 m!163265))

(declare-fun m!163267 () Bool)

(assert (=> b!109827 m!163267))

(declare-fun m!163269 () Bool)

(assert (=> b!109820 m!163269))

(declare-fun m!163271 () Bool)

(assert (=> b!109822 m!163271))

(declare-fun m!163273 () Bool)

(assert (=> b!109822 m!163273))

(declare-fun m!163275 () Bool)

(assert (=> b!109822 m!163275))

(assert (=> b!109822 m!163253))

(declare-fun m!163277 () Bool)

(assert (=> b!109822 m!163277))

(declare-fun m!163279 () Bool)

(assert (=> b!109822 m!163279))

(declare-fun m!163281 () Bool)

(assert (=> b!109822 m!163281))

(assert (=> b!109822 m!163251))

(declare-fun m!163283 () Bool)

(assert (=> b!109821 m!163283))

(declare-fun m!163285 () Bool)

(assert (=> start!21738 m!163285))

(declare-fun m!163287 () Bool)

(assert (=> b!109817 m!163287))

(declare-fun m!163289 () Bool)

(assert (=> b!109816 m!163289))

(declare-fun m!163291 () Bool)

(assert (=> b!109816 m!163291))

(declare-fun m!163293 () Bool)

(assert (=> b!109816 m!163293))

(declare-fun m!163295 () Bool)

(assert (=> b!109816 m!163295))

(declare-fun m!163297 () Bool)

(assert (=> b!109816 m!163297))

(declare-fun m!163299 () Bool)

(assert (=> b!109816 m!163299))

(declare-fun m!163301 () Bool)

(assert (=> b!109816 m!163301))

(declare-fun m!163303 () Bool)

(assert (=> b!109816 m!163303))

(declare-fun m!163305 () Bool)

(assert (=> b!109816 m!163305))

(declare-fun m!163307 () Bool)

(assert (=> b!109816 m!163307))

(declare-fun m!163309 () Bool)

(assert (=> b!109816 m!163309))

(declare-fun m!163311 () Bool)

(assert (=> b!109816 m!163311))

(declare-fun m!163313 () Bool)

(assert (=> b!109816 m!163313))

(declare-fun m!163315 () Bool)

(assert (=> b!109816 m!163315))

(declare-fun m!163317 () Bool)

(assert (=> b!109816 m!163317))

(declare-fun m!163319 () Bool)

(assert (=> b!109816 m!163319))

(declare-fun m!163321 () Bool)

(assert (=> b!109816 m!163321))

(declare-fun m!163323 () Bool)

(assert (=> b!109816 m!163323))

(declare-fun m!163325 () Bool)

(assert (=> b!109816 m!163325))

(check-sat (not b!109817) (not b!109822) (not b!109827) (not b!109820) (not b!109825) (not b!109823) (not b!109821) (not b!109829) (not b!109826) (not b!109830) (not b!109831) (not start!21738) (not b!109816))
(check-sat)
