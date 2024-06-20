; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21952 () Bool)

(assert start!21952)

(declare-fun b!110759 () Bool)

(declare-fun res!91435 () Bool)

(declare-fun e!72685 () Bool)

(assert (=> b!110759 (=> (not res!91435) (not e!72685))))

(declare-datatypes ((array!5081 0))(
  ( (array!5082 (arr!2904 (Array (_ BitVec 32) (_ BitVec 8))) (size!2311 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4096 0))(
  ( (BitStream!4097 (buf!2708 array!5081) (currentByte!5265 (_ BitVec 32)) (currentBit!5260 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4096)

(declare-datatypes ((Unit!6790 0))(
  ( (Unit!6791) )
))
(declare-datatypes ((tuple2!9216 0))(
  ( (tuple2!9217 (_1!4865 Unit!6790) (_2!4865 BitStream!4096)) )
))
(declare-fun lt!167626 () tuple2!9216)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!110759 (= res!91435 (invariant!0 (currentBit!5260 thiss!1305) (currentByte!5265 thiss!1305) (size!2311 (buf!2708 (_2!4865 lt!167626)))))))

(declare-fun b!110760 () Bool)

(declare-fun e!72687 () Bool)

(declare-fun e!72692 () Bool)

(assert (=> b!110760 (= e!72687 e!72692)))

(declare-fun res!91437 () Bool)

(assert (=> b!110760 (=> (not res!91437) (not e!72692))))

(declare-fun lt!167632 () (_ BitVec 64))

(declare-fun lt!167627 () (_ BitVec 64))

(assert (=> b!110760 (= res!91437 (= lt!167632 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!167627)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110760 (= lt!167632 (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!167626))) (currentByte!5265 (_2!4865 lt!167626)) (currentBit!5260 (_2!4865 lt!167626))))))

(assert (=> b!110760 (= lt!167627 (bitIndex!0 (size!2311 (buf!2708 thiss!1305)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305)))))

(declare-fun b!110761 () Bool)

(declare-fun e!72684 () Bool)

(declare-datatypes ((tuple2!9218 0))(
  ( (tuple2!9219 (_1!4866 BitStream!4096) (_2!4866 Bool)) )
))
(declare-fun lt!167629 () tuple2!9218)

(declare-fun lt!167642 () tuple2!9218)

(assert (=> b!110761 (= e!72684 (= (_2!4866 lt!167629) (_2!4866 lt!167642)))))

(declare-fun e!72686 () Bool)

(declare-datatypes ((tuple2!9220 0))(
  ( (tuple2!9221 (_1!4867 BitStream!4096) (_2!4867 BitStream!4096)) )
))
(declare-fun lt!167640 () tuple2!9220)

(declare-fun lt!167637 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun lt!167639 () tuple2!9218)

(declare-fun b!110762 () Bool)

(declare-fun lt!167644 () (_ BitVec 64))

(declare-fun i!615 () (_ BitVec 32))

(declare-datatypes ((tuple2!9222 0))(
  ( (tuple2!9223 (_1!4868 BitStream!4096) (_2!4868 (_ BitVec 64))) )
))
(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4096 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9222)

(assert (=> b!110762 (= e!72686 (not (= (_1!4868 (readNLeastSignificantBitsLoopPure!0 (_1!4867 lt!167640) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) (bvor lt!167644 (ite (_2!4866 lt!167639) lt!167637 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!4867 lt!167640))))))

(declare-fun lt!167643 () tuple2!9216)

(declare-fun lt!167636 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!110762 (validate_offset_bits!1 ((_ sign_extend 32) (size!2311 (buf!2708 (_2!4865 lt!167643)))) ((_ sign_extend 32) (currentByte!5265 (_2!4865 lt!167626))) ((_ sign_extend 32) (currentBit!5260 (_2!4865 lt!167626))) lt!167636)))

(declare-fun lt!167631 () Unit!6790)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4096 array!5081 (_ BitVec 64)) Unit!6790)

(assert (=> b!110762 (= lt!167631 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4865 lt!167626) (buf!2708 (_2!4865 lt!167643)) lt!167636))))

(assert (=> b!110762 (= lt!167636 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!167645 () tuple2!9222)

(declare-fun lt!167630 () tuple2!9220)

(assert (=> b!110762 (= lt!167645 (readNLeastSignificantBitsLoopPure!0 (_1!4867 lt!167630) nBits!396 i!615 lt!167644))))

(declare-fun lt!167628 () (_ BitVec 64))

(assert (=> b!110762 (validate_offset_bits!1 ((_ sign_extend 32) (size!2311 (buf!2708 (_2!4865 lt!167643)))) ((_ sign_extend 32) (currentByte!5265 thiss!1305)) ((_ sign_extend 32) (currentBit!5260 thiss!1305)) lt!167628)))

(declare-fun lt!167638 () Unit!6790)

(assert (=> b!110762 (= lt!167638 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2708 (_2!4865 lt!167643)) lt!167628))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110762 (= lt!167644 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!167625 () Bool)

(assert (=> b!110762 (= (_2!4866 lt!167639) lt!167625)))

(declare-fun readBitPure!0 (BitStream!4096) tuple2!9218)

(assert (=> b!110762 (= lt!167639 (readBitPure!0 (_1!4867 lt!167630)))))

(declare-fun reader!0 (BitStream!4096 BitStream!4096) tuple2!9220)

(assert (=> b!110762 (= lt!167640 (reader!0 (_2!4865 lt!167626) (_2!4865 lt!167643)))))

(assert (=> b!110762 (= lt!167630 (reader!0 thiss!1305 (_2!4865 lt!167643)))))

(assert (=> b!110762 e!72684))

(declare-fun res!91436 () Bool)

(assert (=> b!110762 (=> (not res!91436) (not e!72684))))

(assert (=> b!110762 (= res!91436 (= (bitIndex!0 (size!2311 (buf!2708 (_1!4866 lt!167629))) (currentByte!5265 (_1!4866 lt!167629)) (currentBit!5260 (_1!4866 lt!167629))) (bitIndex!0 (size!2311 (buf!2708 (_1!4866 lt!167642))) (currentByte!5265 (_1!4866 lt!167642)) (currentBit!5260 (_1!4866 lt!167642)))))))

(declare-fun lt!167633 () Unit!6790)

(declare-fun lt!167635 () BitStream!4096)

(declare-fun readBitPrefixLemma!0 (BitStream!4096 BitStream!4096) Unit!6790)

(assert (=> b!110762 (= lt!167633 (readBitPrefixLemma!0 lt!167635 (_2!4865 lt!167643)))))

(assert (=> b!110762 (= lt!167642 (readBitPure!0 (BitStream!4097 (buf!2708 (_2!4865 lt!167643)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305))))))

(assert (=> b!110762 (= lt!167629 (readBitPure!0 lt!167635))))

(assert (=> b!110762 (= lt!167635 (BitStream!4097 (buf!2708 (_2!4865 lt!167626)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305)))))

(assert (=> b!110762 e!72685))

(declare-fun res!91438 () Bool)

(assert (=> b!110762 (=> (not res!91438) (not e!72685))))

(declare-fun isPrefixOf!0 (BitStream!4096 BitStream!4096) Bool)

(assert (=> b!110762 (= res!91438 (isPrefixOf!0 thiss!1305 (_2!4865 lt!167643)))))

(declare-fun lt!167634 () Unit!6790)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4096 BitStream!4096 BitStream!4096) Unit!6790)

(assert (=> b!110762 (= lt!167634 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4865 lt!167626) (_2!4865 lt!167643)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4096 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9216)

(assert (=> b!110762 (= lt!167643 (appendNLeastSignificantBitsLoop!0 (_2!4865 lt!167626) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!110762 e!72687))

(declare-fun res!91440 () Bool)

(assert (=> b!110762 (=> (not res!91440) (not e!72687))))

(assert (=> b!110762 (= res!91440 (= (size!2311 (buf!2708 thiss!1305)) (size!2311 (buf!2708 (_2!4865 lt!167626)))))))

(declare-fun appendBit!0 (BitStream!4096 Bool) tuple2!9216)

(assert (=> b!110762 (= lt!167626 (appendBit!0 thiss!1305 lt!167625))))

(assert (=> b!110762 (= lt!167625 (not (= (bvand v!199 lt!167637) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!110762 (= lt!167637 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!110764 () Bool)

(declare-fun res!91444 () Bool)

(assert (=> b!110764 (=> (not res!91444) (not e!72686))))

(assert (=> b!110764 (= res!91444 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!110765 () Bool)

(declare-fun res!91442 () Bool)

(assert (=> b!110765 (=> (not res!91442) (not e!72692))))

(assert (=> b!110765 (= res!91442 (isPrefixOf!0 thiss!1305 (_2!4865 lt!167626)))))

(declare-fun b!110766 () Bool)

(declare-fun e!72690 () Bool)

(assert (=> b!110766 (= e!72692 e!72690)))

(declare-fun res!91434 () Bool)

(assert (=> b!110766 (=> (not res!91434) (not e!72690))))

(declare-fun lt!167641 () tuple2!9218)

(assert (=> b!110766 (= res!91434 (and (= (_2!4866 lt!167641) lt!167625) (= (_1!4866 lt!167641) (_2!4865 lt!167626))))))

(declare-fun readerFrom!0 (BitStream!4096 (_ BitVec 32) (_ BitVec 32)) BitStream!4096)

(assert (=> b!110766 (= lt!167641 (readBitPure!0 (readerFrom!0 (_2!4865 lt!167626) (currentBit!5260 thiss!1305) (currentByte!5265 thiss!1305))))))

(declare-fun b!110767 () Bool)

(assert (=> b!110767 (= e!72685 (invariant!0 (currentBit!5260 thiss!1305) (currentByte!5265 thiss!1305) (size!2311 (buf!2708 (_2!4865 lt!167643)))))))

(declare-fun b!110768 () Bool)

(declare-fun e!72689 () Bool)

(assert (=> b!110768 (= e!72689 e!72686)))

(declare-fun res!91441 () Bool)

(assert (=> b!110768 (=> (not res!91441) (not e!72686))))

(assert (=> b!110768 (= res!91441 (validate_offset_bits!1 ((_ sign_extend 32) (size!2311 (buf!2708 thiss!1305))) ((_ sign_extend 32) (currentByte!5265 thiss!1305)) ((_ sign_extend 32) (currentBit!5260 thiss!1305)) lt!167628))))

(assert (=> b!110768 (= lt!167628 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!110769 () Bool)

(declare-fun e!72688 () Bool)

(declare-fun array_inv!2113 (array!5081) Bool)

(assert (=> b!110769 (= e!72688 (array_inv!2113 (buf!2708 thiss!1305)))))

(declare-fun b!110770 () Bool)

(declare-fun res!91439 () Bool)

(assert (=> b!110770 (=> (not res!91439) (not e!72686))))

(assert (=> b!110770 (= res!91439 (bvslt i!615 nBits!396))))

(declare-fun b!110763 () Bool)

(assert (=> b!110763 (= e!72690 (= (bitIndex!0 (size!2311 (buf!2708 (_1!4866 lt!167641))) (currentByte!5265 (_1!4866 lt!167641)) (currentBit!5260 (_1!4866 lt!167641))) lt!167632))))

(declare-fun res!91443 () Bool)

(assert (=> start!21952 (=> (not res!91443) (not e!72689))))

(assert (=> start!21952 (= res!91443 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21952 e!72689))

(assert (=> start!21952 true))

(declare-fun inv!12 (BitStream!4096) Bool)

(assert (=> start!21952 (and (inv!12 thiss!1305) e!72688)))

(assert (= (and start!21952 res!91443) b!110768))

(assert (= (and b!110768 res!91441) b!110764))

(assert (= (and b!110764 res!91444) b!110770))

(assert (= (and b!110770 res!91439) b!110762))

(assert (= (and b!110762 res!91440) b!110760))

(assert (= (and b!110760 res!91437) b!110765))

(assert (= (and b!110765 res!91442) b!110766))

(assert (= (and b!110766 res!91434) b!110763))

(assert (= (and b!110762 res!91438) b!110759))

(assert (= (and b!110759 res!91435) b!110767))

(assert (= (and b!110762 res!91436) b!110761))

(assert (= start!21952 b!110769))

(declare-fun m!164339 () Bool)

(assert (=> b!110765 m!164339))

(declare-fun m!164341 () Bool)

(assert (=> b!110767 m!164341))

(declare-fun m!164343 () Bool)

(assert (=> b!110764 m!164343))

(declare-fun m!164345 () Bool)

(assert (=> start!21952 m!164345))

(declare-fun m!164347 () Bool)

(assert (=> b!110768 m!164347))

(declare-fun m!164349 () Bool)

(assert (=> b!110760 m!164349))

(declare-fun m!164351 () Bool)

(assert (=> b!110760 m!164351))

(declare-fun m!164353 () Bool)

(assert (=> b!110763 m!164353))

(declare-fun m!164355 () Bool)

(assert (=> b!110766 m!164355))

(assert (=> b!110766 m!164355))

(declare-fun m!164357 () Bool)

(assert (=> b!110766 m!164357))

(declare-fun m!164359 () Bool)

(assert (=> b!110762 m!164359))

(declare-fun m!164361 () Bool)

(assert (=> b!110762 m!164361))

(declare-fun m!164363 () Bool)

(assert (=> b!110762 m!164363))

(declare-fun m!164365 () Bool)

(assert (=> b!110762 m!164365))

(declare-fun m!164367 () Bool)

(assert (=> b!110762 m!164367))

(declare-fun m!164369 () Bool)

(assert (=> b!110762 m!164369))

(declare-fun m!164371 () Bool)

(assert (=> b!110762 m!164371))

(declare-fun m!164373 () Bool)

(assert (=> b!110762 m!164373))

(declare-fun m!164375 () Bool)

(assert (=> b!110762 m!164375))

(declare-fun m!164377 () Bool)

(assert (=> b!110762 m!164377))

(declare-fun m!164379 () Bool)

(assert (=> b!110762 m!164379))

(declare-fun m!164381 () Bool)

(assert (=> b!110762 m!164381))

(declare-fun m!164383 () Bool)

(assert (=> b!110762 m!164383))

(declare-fun m!164385 () Bool)

(assert (=> b!110762 m!164385))

(declare-fun m!164387 () Bool)

(assert (=> b!110762 m!164387))

(declare-fun m!164389 () Bool)

(assert (=> b!110762 m!164389))

(declare-fun m!164391 () Bool)

(assert (=> b!110762 m!164391))

(declare-fun m!164393 () Bool)

(assert (=> b!110762 m!164393))

(declare-fun m!164395 () Bool)

(assert (=> b!110762 m!164395))

(declare-fun m!164397 () Bool)

(assert (=> b!110769 m!164397))

(declare-fun m!164399 () Bool)

(assert (=> b!110759 m!164399))

(push 1)

(assert (not b!110769))

(assert (not b!110767))

(assert (not b!110763))

(assert (not b!110765))

(assert (not start!21952))

(assert (not b!110760))

(assert (not b!110762))

(assert (not b!110759))

(assert (not b!110768))

(assert (not b!110766))

(assert (not b!110764))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!34850 () Bool)

(declare-datatypes ((tuple2!9240 0))(
  ( (tuple2!9241 (_1!4877 Bool) (_2!4877 BitStream!4096)) )
))
(declare-fun lt!167813 () tuple2!9240)

(declare-fun readBit!0 (BitStream!4096) tuple2!9240)

(assert (=> d!34850 (= lt!167813 (readBit!0 (readerFrom!0 (_2!4865 lt!167626) (currentBit!5260 thiss!1305) (currentByte!5265 thiss!1305))))))

(assert (=> d!34850 (= (readBitPure!0 (readerFrom!0 (_2!4865 lt!167626) (currentBit!5260 thiss!1305) (currentByte!5265 thiss!1305))) (tuple2!9219 (_2!4877 lt!167813) (_1!4877 lt!167813)))))

(declare-fun bs!8547 () Bool)

(assert (= bs!8547 d!34850))

(assert (=> bs!8547 m!164355))

(declare-fun m!164557 () Bool)

(assert (=> bs!8547 m!164557))

(assert (=> b!110766 d!34850))

(declare-fun d!34852 () Bool)

(declare-fun e!72764 () Bool)

(assert (=> d!34852 e!72764))

(declare-fun res!91536 () Bool)

(assert (=> d!34852 (=> (not res!91536) (not e!72764))))

(assert (=> d!34852 (= res!91536 (invariant!0 (currentBit!5260 (_2!4865 lt!167626)) (currentByte!5265 (_2!4865 lt!167626)) (size!2311 (buf!2708 (_2!4865 lt!167626)))))))

(assert (=> d!34852 (= (readerFrom!0 (_2!4865 lt!167626) (currentBit!5260 thiss!1305) (currentByte!5265 thiss!1305)) (BitStream!4097 (buf!2708 (_2!4865 lt!167626)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305)))))

(declare-fun b!110866 () Bool)

(assert (=> b!110866 (= e!72764 (invariant!0 (currentBit!5260 thiss!1305) (currentByte!5265 thiss!1305) (size!2311 (buf!2708 (_2!4865 lt!167626)))))))

(assert (= (and d!34852 res!91536) b!110866))

(declare-fun m!164559 () Bool)

(assert (=> d!34852 m!164559))

(assert (=> b!110866 m!164399))

(assert (=> b!110766 d!34852))

(declare-fun d!34854 () Bool)

(declare-fun res!91544 () Bool)

(declare-fun e!72770 () Bool)

(assert (=> d!34854 (=> (not res!91544) (not e!72770))))

(assert (=> d!34854 (= res!91544 (= (size!2311 (buf!2708 thiss!1305)) (size!2311 (buf!2708 (_2!4865 lt!167626)))))))

(assert (=> d!34854 (= (isPrefixOf!0 thiss!1305 (_2!4865 lt!167626)) e!72770)))

(declare-fun b!110873 () Bool)

(declare-fun res!91543 () Bool)

(assert (=> b!110873 (=> (not res!91543) (not e!72770))))

(assert (=> b!110873 (= res!91543 (bvsle (bitIndex!0 (size!2311 (buf!2708 thiss!1305)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305)) (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!167626))) (currentByte!5265 (_2!4865 lt!167626)) (currentBit!5260 (_2!4865 lt!167626)))))))

(declare-fun b!110874 () Bool)

(declare-fun e!72769 () Bool)

(assert (=> b!110874 (= e!72770 e!72769)))

(declare-fun res!91545 () Bool)

(assert (=> b!110874 (=> res!91545 e!72769)))

(assert (=> b!110874 (= res!91545 (= (size!2311 (buf!2708 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!110875 () Bool)

(declare-fun arrayBitRangesEq!0 (array!5081 array!5081 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!110875 (= e!72769 (arrayBitRangesEq!0 (buf!2708 thiss!1305) (buf!2708 (_2!4865 lt!167626)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2311 (buf!2708 thiss!1305)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305))))))

(assert (= (and d!34854 res!91544) b!110873))

(assert (= (and b!110873 res!91543) b!110874))

(assert (= (and b!110874 (not res!91545)) b!110875))

(assert (=> b!110873 m!164351))

(assert (=> b!110873 m!164349))

(assert (=> b!110875 m!164351))

(assert (=> b!110875 m!164351))

(declare-fun m!164561 () Bool)

(assert (=> b!110875 m!164561))

(assert (=> b!110765 d!34854))

(declare-fun d!34856 () Bool)

(declare-fun e!72777 () Bool)

(assert (=> d!34856 e!72777))

(declare-fun res!91556 () Bool)

(assert (=> d!34856 (=> (not res!91556) (not e!72777))))

(declare-fun lt!167870 () (_ BitVec 64))

(declare-fun lt!167871 () (_ BitVec 64))

(declare-fun lt!167868 () (_ BitVec 64))

(assert (=> d!34856 (= res!91556 (= lt!167871 (bvsub lt!167870 lt!167868)))))

(assert (=> d!34856 (or (= (bvand lt!167870 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!167868 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!167870 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!167870 lt!167868) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!34856 (= lt!167868 (remainingBits!0 ((_ sign_extend 32) (size!2311 (buf!2708 (_2!4865 lt!167626)))) ((_ sign_extend 32) (currentByte!5265 (_2!4865 lt!167626))) ((_ sign_extend 32) (currentBit!5260 (_2!4865 lt!167626)))))))

(declare-fun lt!167869 () (_ BitVec 64))

(declare-fun lt!167867 () (_ BitVec 64))

(assert (=> d!34856 (= lt!167870 (bvmul lt!167869 lt!167867))))

(assert (=> d!34856 (or (= lt!167869 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!167867 (bvsdiv (bvmul lt!167869 lt!167867) lt!167869)))))

(assert (=> d!34856 (= lt!167867 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!34856 (= lt!167869 ((_ sign_extend 32) (size!2311 (buf!2708 (_2!4865 lt!167626)))))))

(assert (=> d!34856 (= lt!167871 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5265 (_2!4865 lt!167626))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5260 (_2!4865 lt!167626)))))))

(assert (=> d!34856 (invariant!0 (currentBit!5260 (_2!4865 lt!167626)) (currentByte!5265 (_2!4865 lt!167626)) (size!2311 (buf!2708 (_2!4865 lt!167626))))))

(assert (=> d!34856 (= (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!167626))) (currentByte!5265 (_2!4865 lt!167626)) (currentBit!5260 (_2!4865 lt!167626))) lt!167871)))

(declare-fun b!110890 () Bool)

(declare-fun res!91557 () Bool)

(assert (=> b!110890 (=> (not res!91557) (not e!72777))))

(assert (=> b!110890 (= res!91557 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!167871))))

(declare-fun b!110891 () Bool)

(declare-fun lt!167866 () (_ BitVec 64))

(assert (=> b!110891 (= e!72777 (bvsle lt!167871 (bvmul lt!167866 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!110891 (or (= lt!167866 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!167866 #b0000000000000000000000000000000000000000000000000000000000001000) lt!167866)))))

(assert (=> b!110891 (= lt!167866 ((_ sign_extend 32) (size!2311 (buf!2708 (_2!4865 lt!167626)))))))

(assert (= (and d!34856 res!91556) b!110890))

(assert (= (and b!110890 res!91557) b!110891))

(declare-fun m!164563 () Bool)

(assert (=> d!34856 m!164563))

(assert (=> d!34856 m!164559))

(assert (=> b!110760 d!34856))

(declare-fun d!34858 () Bool)

(declare-fun e!72778 () Bool)

(assert (=> d!34858 e!72778))

(declare-fun res!91558 () Bool)

(assert (=> d!34858 (=> (not res!91558) (not e!72778))))

(declare-fun lt!167877 () (_ BitVec 64))

(declare-fun lt!167876 () (_ BitVec 64))

(declare-fun lt!167874 () (_ BitVec 64))

(assert (=> d!34858 (= res!91558 (= lt!167877 (bvsub lt!167876 lt!167874)))))

(assert (=> d!34858 (or (= (bvand lt!167876 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!167874 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!167876 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!167876 lt!167874) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34858 (= lt!167874 (remainingBits!0 ((_ sign_extend 32) (size!2311 (buf!2708 thiss!1305))) ((_ sign_extend 32) (currentByte!5265 thiss!1305)) ((_ sign_extend 32) (currentBit!5260 thiss!1305))))))

(declare-fun lt!167875 () (_ BitVec 64))

(declare-fun lt!167873 () (_ BitVec 64))

(assert (=> d!34858 (= lt!167876 (bvmul lt!167875 lt!167873))))

(assert (=> d!34858 (or (= lt!167875 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!167873 (bvsdiv (bvmul lt!167875 lt!167873) lt!167875)))))

(assert (=> d!34858 (= lt!167873 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!34858 (= lt!167875 ((_ sign_extend 32) (size!2311 (buf!2708 thiss!1305))))))

(assert (=> d!34858 (= lt!167877 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5265 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5260 thiss!1305))))))

(assert (=> d!34858 (invariant!0 (currentBit!5260 thiss!1305) (currentByte!5265 thiss!1305) (size!2311 (buf!2708 thiss!1305)))))

(assert (=> d!34858 (= (bitIndex!0 (size!2311 (buf!2708 thiss!1305)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305)) lt!167877)))

(declare-fun b!110892 () Bool)

(declare-fun res!91559 () Bool)

(assert (=> b!110892 (=> (not res!91559) (not e!72778))))

(assert (=> b!110892 (= res!91559 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!167877))))

(declare-fun b!110893 () Bool)

(declare-fun lt!167872 () (_ BitVec 64))

(assert (=> b!110893 (= e!72778 (bvsle lt!167877 (bvmul lt!167872 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!110893 (or (= lt!167872 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!167872 #b0000000000000000000000000000000000000000000000000000000000001000) lt!167872)))))

(assert (=> b!110893 (= lt!167872 ((_ sign_extend 32) (size!2311 (buf!2708 thiss!1305))))))

(assert (= (and d!34858 res!91558) b!110892))

(assert (= (and b!110892 res!91559) b!110893))

(declare-fun m!164565 () Bool)

(assert (=> d!34858 m!164565))

(declare-fun m!164567 () Bool)

(assert (=> d!34858 m!164567))

(assert (=> b!110760 d!34858))

(declare-fun d!34860 () Bool)

(assert (=> d!34860 (= (invariant!0 (currentBit!5260 thiss!1305) (currentByte!5265 thiss!1305) (size!2311 (buf!2708 (_2!4865 lt!167643)))) (and (bvsge (currentBit!5260 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5260 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5265 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5265 thiss!1305) (size!2311 (buf!2708 (_2!4865 lt!167643)))) (and (= (currentBit!5260 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5265 thiss!1305) (size!2311 (buf!2708 (_2!4865 lt!167643))))))))))

(assert (=> b!110767 d!34860))

(declare-fun d!34862 () Bool)

(assert (=> d!34862 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!110762 d!34862))

(declare-fun d!34864 () Bool)

(declare-datatypes ((tuple2!9244 0))(
  ( (tuple2!9245 (_1!4879 (_ BitVec 64)) (_2!4879 BitStream!4096)) )
))
(declare-fun lt!167880 () tuple2!9244)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!4096 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9244)

(assert (=> d!34864 (= lt!167880 (readNLeastSignificantBitsLoop!0 (_1!4867 lt!167640) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) (bvor lt!167644 (ite (_2!4866 lt!167639) lt!167637 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!34864 (= (readNLeastSignificantBitsLoopPure!0 (_1!4867 lt!167640) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) (bvor lt!167644 (ite (_2!4866 lt!167639) lt!167637 #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!9223 (_2!4879 lt!167880) (_1!4879 lt!167880)))))

(declare-fun bs!8548 () Bool)

(assert (= bs!8548 d!34864))

(declare-fun m!164569 () Bool)

(assert (=> bs!8548 m!164569))

(assert (=> b!110762 d!34864))

(declare-fun d!34866 () Bool)

(assert (=> d!34866 (isPrefixOf!0 thiss!1305 (_2!4865 lt!167643))))

(declare-fun lt!167883 () Unit!6790)

(declare-fun choose!30 (BitStream!4096 BitStream!4096 BitStream!4096) Unit!6790)

(assert (=> d!34866 (= lt!167883 (choose!30 thiss!1305 (_2!4865 lt!167626) (_2!4865 lt!167643)))))

(assert (=> d!34866 (isPrefixOf!0 thiss!1305 (_2!4865 lt!167626))))

(assert (=> d!34866 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4865 lt!167626) (_2!4865 lt!167643)) lt!167883)))

(declare-fun bs!8549 () Bool)

(assert (= bs!8549 d!34866))

(assert (=> bs!8549 m!164365))

(declare-fun m!164571 () Bool)

(assert (=> bs!8549 m!164571))

(assert (=> bs!8549 m!164339))

(assert (=> b!110762 d!34866))

(declare-fun d!34868 () Bool)

(assert (=> d!34868 (validate_offset_bits!1 ((_ sign_extend 32) (size!2311 (buf!2708 (_2!4865 lt!167643)))) ((_ sign_extend 32) (currentByte!5265 thiss!1305)) ((_ sign_extend 32) (currentBit!5260 thiss!1305)) lt!167628)))

(declare-fun lt!167906 () Unit!6790)

(declare-fun choose!9 (BitStream!4096 array!5081 (_ BitVec 64) BitStream!4096) Unit!6790)

(assert (=> d!34868 (= lt!167906 (choose!9 thiss!1305 (buf!2708 (_2!4865 lt!167643)) lt!167628 (BitStream!4097 (buf!2708 (_2!4865 lt!167643)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305))))))

(assert (=> d!34868 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2708 (_2!4865 lt!167643)) lt!167628) lt!167906)))

(declare-fun bs!8550 () Bool)

(assert (= bs!8550 d!34868))

(assert (=> bs!8550 m!164371))

(declare-fun m!164573 () Bool)

(assert (=> bs!8550 m!164573))

(assert (=> b!110762 d!34868))

(declare-fun d!34870 () Bool)

(declare-fun lt!167907 () tuple2!9240)

(assert (=> d!34870 (= lt!167907 (readBit!0 (BitStream!4097 (buf!2708 (_2!4865 lt!167643)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305))))))

(assert (=> d!34870 (= (readBitPure!0 (BitStream!4097 (buf!2708 (_2!4865 lt!167643)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305))) (tuple2!9219 (_2!4877 lt!167907) (_1!4877 lt!167907)))))

(declare-fun bs!8551 () Bool)

(assert (= bs!8551 d!34870))

(declare-fun m!164575 () Bool)

(assert (=> bs!8551 m!164575))

(assert (=> b!110762 d!34870))

(declare-fun d!34872 () Bool)

(declare-fun lt!167908 () tuple2!9240)

(assert (=> d!34872 (= lt!167908 (readBit!0 lt!167635))))

(assert (=> d!34872 (= (readBitPure!0 lt!167635) (tuple2!9219 (_2!4877 lt!167908) (_1!4877 lt!167908)))))

(declare-fun bs!8552 () Bool)

(assert (= bs!8552 d!34872))

(declare-fun m!164579 () Bool)

(assert (=> bs!8552 m!164579))

(assert (=> b!110762 d!34872))

(declare-fun d!34874 () Bool)

(assert (=> d!34874 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2311 (buf!2708 (_2!4865 lt!167643)))) ((_ sign_extend 32) (currentByte!5265 thiss!1305)) ((_ sign_extend 32) (currentBit!5260 thiss!1305)) lt!167628) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2311 (buf!2708 (_2!4865 lt!167643)))) ((_ sign_extend 32) (currentByte!5265 thiss!1305)) ((_ sign_extend 32) (currentBit!5260 thiss!1305))) lt!167628))))

(declare-fun bs!8553 () Bool)

(assert (= bs!8553 d!34874))

(declare-fun m!164613 () Bool)

(assert (=> bs!8553 m!164613))

(assert (=> b!110762 d!34874))

(declare-fun d!34878 () Bool)

(declare-fun lt!167910 () tuple2!9240)

(assert (=> d!34878 (= lt!167910 (readBit!0 (_1!4867 lt!167630)))))

(assert (=> d!34878 (= (readBitPure!0 (_1!4867 lt!167630)) (tuple2!9219 (_2!4877 lt!167910) (_1!4877 lt!167910)))))

(declare-fun bs!8555 () Bool)

(assert (= bs!8555 d!34878))

(declare-fun m!164617 () Bool)

(assert (=> bs!8555 m!164617))

(assert (=> b!110762 d!34878))

(declare-fun d!34882 () Bool)

(declare-fun e!72781 () Bool)

(assert (=> d!34882 e!72781))

(declare-fun res!91563 () Bool)

(assert (=> d!34882 (=> (not res!91563) (not e!72781))))

(declare-fun lt!167915 () (_ BitVec 64))

(declare-fun lt!167913 () (_ BitVec 64))

(declare-fun lt!167916 () (_ BitVec 64))

(assert (=> d!34882 (= res!91563 (= lt!167916 (bvsub lt!167915 lt!167913)))))

(assert (=> d!34882 (or (= (bvand lt!167915 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!167913 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!167915 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!167915 lt!167913) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34882 (= lt!167913 (remainingBits!0 ((_ sign_extend 32) (size!2311 (buf!2708 (_1!4866 lt!167629)))) ((_ sign_extend 32) (currentByte!5265 (_1!4866 lt!167629))) ((_ sign_extend 32) (currentBit!5260 (_1!4866 lt!167629)))))))

(declare-fun lt!167914 () (_ BitVec 64))

(declare-fun lt!167912 () (_ BitVec 64))

(assert (=> d!34882 (= lt!167915 (bvmul lt!167914 lt!167912))))

(assert (=> d!34882 (or (= lt!167914 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!167912 (bvsdiv (bvmul lt!167914 lt!167912) lt!167914)))))

(assert (=> d!34882 (= lt!167912 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!34882 (= lt!167914 ((_ sign_extend 32) (size!2311 (buf!2708 (_1!4866 lt!167629)))))))

(assert (=> d!34882 (= lt!167916 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5265 (_1!4866 lt!167629))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5260 (_1!4866 lt!167629)))))))

(assert (=> d!34882 (invariant!0 (currentBit!5260 (_1!4866 lt!167629)) (currentByte!5265 (_1!4866 lt!167629)) (size!2311 (buf!2708 (_1!4866 lt!167629))))))

(assert (=> d!34882 (= (bitIndex!0 (size!2311 (buf!2708 (_1!4866 lt!167629))) (currentByte!5265 (_1!4866 lt!167629)) (currentBit!5260 (_1!4866 lt!167629))) lt!167916)))

(declare-fun b!110899 () Bool)

(declare-fun res!91564 () Bool)

(assert (=> b!110899 (=> (not res!91564) (not e!72781))))

(assert (=> b!110899 (= res!91564 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!167916))))

(declare-fun b!110900 () Bool)

(declare-fun lt!167911 () (_ BitVec 64))

(assert (=> b!110900 (= e!72781 (bvsle lt!167916 (bvmul lt!167911 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!110900 (or (= lt!167911 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!167911 #b0000000000000000000000000000000000000000000000000000000000001000) lt!167911)))))

(assert (=> b!110900 (= lt!167911 ((_ sign_extend 32) (size!2311 (buf!2708 (_1!4866 lt!167629)))))))

(assert (= (and d!34882 res!91563) b!110899))

(assert (= (and b!110899 res!91564) b!110900))

(declare-fun m!164621 () Bool)

(assert (=> d!34882 m!164621))

(declare-fun m!164623 () Bool)

(assert (=> d!34882 m!164623))

(assert (=> b!110762 d!34882))

(declare-fun b!110923 () Bool)

(declare-fun res!91583 () Bool)

(declare-fun e!72792 () Bool)

(assert (=> b!110923 (=> (not res!91583) (not e!72792))))

(declare-fun lt!168013 () tuple2!9220)

(assert (=> b!110923 (= res!91583 (isPrefixOf!0 (_1!4867 lt!168013) thiss!1305))))

(declare-fun b!110924 () Bool)

(declare-fun e!72793 () Unit!6790)

(declare-fun Unit!6796 () Unit!6790)

(assert (=> b!110924 (= e!72793 Unit!6796)))

(declare-fun b!110925 () Bool)

(declare-fun lt!168003 () Unit!6790)

(assert (=> b!110925 (= e!72793 lt!168003)))

(declare-fun lt!168005 () (_ BitVec 64))

(assert (=> b!110925 (= lt!168005 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!168004 () (_ BitVec 64))

(assert (=> b!110925 (= lt!168004 (bitIndex!0 (size!2311 (buf!2708 thiss!1305)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5081 array!5081 (_ BitVec 64) (_ BitVec 64)) Unit!6790)

(assert (=> b!110925 (= lt!168003 (arrayBitRangesEqSymmetric!0 (buf!2708 thiss!1305) (buf!2708 (_2!4865 lt!167643)) lt!168005 lt!168004))))

(assert (=> b!110925 (arrayBitRangesEq!0 (buf!2708 (_2!4865 lt!167643)) (buf!2708 thiss!1305) lt!168005 lt!168004)))

(declare-fun b!110926 () Bool)

(declare-fun res!91582 () Bool)

(assert (=> b!110926 (=> (not res!91582) (not e!72792))))

(assert (=> b!110926 (= res!91582 (isPrefixOf!0 (_2!4867 lt!168013) (_2!4865 lt!167643)))))

(declare-fun d!34886 () Bool)

(assert (=> d!34886 e!72792))

(declare-fun res!91581 () Bool)

(assert (=> d!34886 (=> (not res!91581) (not e!72792))))

(assert (=> d!34886 (= res!91581 (isPrefixOf!0 (_1!4867 lt!168013) (_2!4867 lt!168013)))))

(declare-fun lt!168001 () BitStream!4096)

(assert (=> d!34886 (= lt!168013 (tuple2!9221 lt!168001 (_2!4865 lt!167643)))))

(declare-fun lt!168010 () Unit!6790)

(declare-fun lt!168006 () Unit!6790)

(assert (=> d!34886 (= lt!168010 lt!168006)))

(assert (=> d!34886 (isPrefixOf!0 lt!168001 (_2!4865 lt!167643))))

(assert (=> d!34886 (= lt!168006 (lemmaIsPrefixTransitive!0 lt!168001 (_2!4865 lt!167643) (_2!4865 lt!167643)))))

(declare-fun lt!167997 () Unit!6790)

(declare-fun lt!168002 () Unit!6790)

(assert (=> d!34886 (= lt!167997 lt!168002)))

(assert (=> d!34886 (isPrefixOf!0 lt!168001 (_2!4865 lt!167643))))

(assert (=> d!34886 (= lt!168002 (lemmaIsPrefixTransitive!0 lt!168001 thiss!1305 (_2!4865 lt!167643)))))

(declare-fun lt!168009 () Unit!6790)

(assert (=> d!34886 (= lt!168009 e!72793)))

(declare-fun c!6735 () Bool)

(assert (=> d!34886 (= c!6735 (not (= (size!2311 (buf!2708 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!168011 () Unit!6790)

(declare-fun lt!168008 () Unit!6790)

(assert (=> d!34886 (= lt!168011 lt!168008)))

(assert (=> d!34886 (isPrefixOf!0 (_2!4865 lt!167643) (_2!4865 lt!167643))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4096) Unit!6790)

(assert (=> d!34886 (= lt!168008 (lemmaIsPrefixRefl!0 (_2!4865 lt!167643)))))

(declare-fun lt!168014 () Unit!6790)

(declare-fun lt!167996 () Unit!6790)

(assert (=> d!34886 (= lt!168014 lt!167996)))

(assert (=> d!34886 (= lt!167996 (lemmaIsPrefixRefl!0 (_2!4865 lt!167643)))))

(declare-fun lt!168007 () Unit!6790)

(declare-fun lt!168012 () Unit!6790)

(assert (=> d!34886 (= lt!168007 lt!168012)))

(assert (=> d!34886 (isPrefixOf!0 lt!168001 lt!168001)))

(assert (=> d!34886 (= lt!168012 (lemmaIsPrefixRefl!0 lt!168001))))

(declare-fun lt!167998 () Unit!6790)

(declare-fun lt!167995 () Unit!6790)

(assert (=> d!34886 (= lt!167998 lt!167995)))

(assert (=> d!34886 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!34886 (= lt!167995 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!34886 (= lt!168001 (BitStream!4097 (buf!2708 (_2!4865 lt!167643)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305)))))

(assert (=> d!34886 (isPrefixOf!0 thiss!1305 (_2!4865 lt!167643))))

(assert (=> d!34886 (= (reader!0 thiss!1305 (_2!4865 lt!167643)) lt!168013)))

(declare-fun lt!168000 () (_ BitVec 64))

(declare-fun lt!167999 () (_ BitVec 64))

(declare-fun b!110927 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!4096 (_ BitVec 64)) BitStream!4096)

(assert (=> b!110927 (= e!72792 (= (_1!4867 lt!168013) (withMovedBitIndex!0 (_2!4867 lt!168013) (bvsub lt!168000 lt!167999))))))

(assert (=> b!110927 (or (= (bvand lt!168000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!167999 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!168000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!168000 lt!167999) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!110927 (= lt!167999 (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!167643))) (currentByte!5265 (_2!4865 lt!167643)) (currentBit!5260 (_2!4865 lt!167643))))))

(assert (=> b!110927 (= lt!168000 (bitIndex!0 (size!2311 (buf!2708 thiss!1305)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305)))))

(assert (= (and d!34886 c!6735) b!110925))

(assert (= (and d!34886 (not c!6735)) b!110924))

(assert (= (and d!34886 res!91581) b!110923))

(assert (= (and b!110923 res!91583) b!110926))

(assert (= (and b!110926 res!91582) b!110927))

(declare-fun m!164667 () Bool)

(assert (=> b!110926 m!164667))

(declare-fun m!164669 () Bool)

(assert (=> d!34886 m!164669))

(declare-fun m!164671 () Bool)

(assert (=> d!34886 m!164671))

(declare-fun m!164673 () Bool)

(assert (=> d!34886 m!164673))

(declare-fun m!164675 () Bool)

(assert (=> d!34886 m!164675))

(declare-fun m!164677 () Bool)

(assert (=> d!34886 m!164677))

(declare-fun m!164679 () Bool)

(assert (=> d!34886 m!164679))

(declare-fun m!164681 () Bool)

(assert (=> d!34886 m!164681))

(declare-fun m!164683 () Bool)

(assert (=> d!34886 m!164683))

(declare-fun m!164685 () Bool)

(assert (=> d!34886 m!164685))

(assert (=> d!34886 m!164365))

(declare-fun m!164687 () Bool)

(assert (=> d!34886 m!164687))

(declare-fun m!164689 () Bool)

(assert (=> b!110923 m!164689))

(declare-fun m!164691 () Bool)

(assert (=> b!110927 m!164691))

(declare-fun m!164693 () Bool)

(assert (=> b!110927 m!164693))

(assert (=> b!110927 m!164351))

(assert (=> b!110925 m!164351))

(declare-fun m!164695 () Bool)

(assert (=> b!110925 m!164695))

(declare-fun m!164697 () Bool)

(assert (=> b!110925 m!164697))

(assert (=> b!110762 d!34886))

(declare-fun d!34902 () Bool)

(assert (=> d!34902 (validate_offset_bits!1 ((_ sign_extend 32) (size!2311 (buf!2708 (_2!4865 lt!167643)))) ((_ sign_extend 32) (currentByte!5265 (_2!4865 lt!167626))) ((_ sign_extend 32) (currentBit!5260 (_2!4865 lt!167626))) lt!167636)))

(declare-fun lt!168015 () Unit!6790)

(assert (=> d!34902 (= lt!168015 (choose!9 (_2!4865 lt!167626) (buf!2708 (_2!4865 lt!167643)) lt!167636 (BitStream!4097 (buf!2708 (_2!4865 lt!167643)) (currentByte!5265 (_2!4865 lt!167626)) (currentBit!5260 (_2!4865 lt!167626)))))))

(assert (=> d!34902 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4865 lt!167626) (buf!2708 (_2!4865 lt!167643)) lt!167636) lt!168015)))

(declare-fun bs!8560 () Bool)

(assert (= bs!8560 d!34902))

(assert (=> bs!8560 m!164367))

(declare-fun m!164699 () Bool)

(assert (=> bs!8560 m!164699))

(assert (=> b!110762 d!34902))

(declare-fun d!34904 () Bool)

(declare-fun res!91585 () Bool)

(declare-fun e!72795 () Bool)

(assert (=> d!34904 (=> (not res!91585) (not e!72795))))

(assert (=> d!34904 (= res!91585 (= (size!2311 (buf!2708 thiss!1305)) (size!2311 (buf!2708 (_2!4865 lt!167643)))))))

(assert (=> d!34904 (= (isPrefixOf!0 thiss!1305 (_2!4865 lt!167643)) e!72795)))

(declare-fun b!110928 () Bool)

(declare-fun res!91584 () Bool)

(assert (=> b!110928 (=> (not res!91584) (not e!72795))))

(assert (=> b!110928 (= res!91584 (bvsle (bitIndex!0 (size!2311 (buf!2708 thiss!1305)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305)) (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!167643))) (currentByte!5265 (_2!4865 lt!167643)) (currentBit!5260 (_2!4865 lt!167643)))))))

(declare-fun b!110929 () Bool)

(declare-fun e!72794 () Bool)

(assert (=> b!110929 (= e!72795 e!72794)))

(declare-fun res!91586 () Bool)

(assert (=> b!110929 (=> res!91586 e!72794)))

(assert (=> b!110929 (= res!91586 (= (size!2311 (buf!2708 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!110930 () Bool)

(assert (=> b!110930 (= e!72794 (arrayBitRangesEq!0 (buf!2708 thiss!1305) (buf!2708 (_2!4865 lt!167643)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2311 (buf!2708 thiss!1305)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305))))))

(assert (= (and d!34904 res!91585) b!110928))

(assert (= (and b!110928 res!91584) b!110929))

(assert (= (and b!110929 (not res!91586)) b!110930))

(assert (=> b!110928 m!164351))

(assert (=> b!110928 m!164693))

(assert (=> b!110930 m!164351))

(assert (=> b!110930 m!164351))

(declare-fun m!164701 () Bool)

(assert (=> b!110930 m!164701))

(assert (=> b!110762 d!34904))

(declare-fun b!110940 () Bool)

(declare-fun res!91598 () Bool)

(declare-fun e!72801 () Bool)

(assert (=> b!110940 (=> (not res!91598) (not e!72801))))

(declare-fun lt!168026 () (_ BitVec 64))

(declare-fun lt!168027 () (_ BitVec 64))

(declare-fun lt!168024 () tuple2!9216)

(assert (=> b!110940 (= res!91598 (= (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!168024))) (currentByte!5265 (_2!4865 lt!168024)) (currentBit!5260 (_2!4865 lt!168024))) (bvadd lt!168026 lt!168027)))))

(assert (=> b!110940 (or (not (= (bvand lt!168026 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!168027 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!168026 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!168026 lt!168027) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!110940 (= lt!168027 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!110940 (= lt!168026 (bitIndex!0 (size!2311 (buf!2708 thiss!1305)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305)))))

(declare-fun b!110941 () Bool)

(declare-fun res!91597 () Bool)

(assert (=> b!110941 (=> (not res!91597) (not e!72801))))

(assert (=> b!110941 (= res!91597 (isPrefixOf!0 thiss!1305 (_2!4865 lt!168024)))))

(declare-fun d!34906 () Bool)

(assert (=> d!34906 e!72801))

(declare-fun res!91595 () Bool)

(assert (=> d!34906 (=> (not res!91595) (not e!72801))))

(assert (=> d!34906 (= res!91595 (= (size!2311 (buf!2708 thiss!1305)) (size!2311 (buf!2708 (_2!4865 lt!168024)))))))

(declare-fun choose!16 (BitStream!4096 Bool) tuple2!9216)

(assert (=> d!34906 (= lt!168024 (choose!16 thiss!1305 lt!167625))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!34906 (validate_offset_bit!0 ((_ sign_extend 32) (size!2311 (buf!2708 thiss!1305))) ((_ sign_extend 32) (currentByte!5265 thiss!1305)) ((_ sign_extend 32) (currentBit!5260 thiss!1305)))))

(assert (=> d!34906 (= (appendBit!0 thiss!1305 lt!167625) lt!168024)))

(declare-fun b!110943 () Bool)

(declare-fun e!72800 () Bool)

(declare-fun lt!168025 () tuple2!9218)

(assert (=> b!110943 (= e!72800 (= (bitIndex!0 (size!2311 (buf!2708 (_1!4866 lt!168025))) (currentByte!5265 (_1!4866 lt!168025)) (currentBit!5260 (_1!4866 lt!168025))) (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!168024))) (currentByte!5265 (_2!4865 lt!168024)) (currentBit!5260 (_2!4865 lt!168024)))))))

(declare-fun b!110942 () Bool)

(assert (=> b!110942 (= e!72801 e!72800)))

(declare-fun res!91596 () Bool)

(assert (=> b!110942 (=> (not res!91596) (not e!72800))))

(assert (=> b!110942 (= res!91596 (and (= (_2!4866 lt!168025) lt!167625) (= (_1!4866 lt!168025) (_2!4865 lt!168024))))))

(assert (=> b!110942 (= lt!168025 (readBitPure!0 (readerFrom!0 (_2!4865 lt!168024) (currentBit!5260 thiss!1305) (currentByte!5265 thiss!1305))))))

(assert (= (and d!34906 res!91595) b!110940))

(assert (= (and b!110940 res!91598) b!110941))

(assert (= (and b!110941 res!91597) b!110942))

(assert (= (and b!110942 res!91596) b!110943))

(declare-fun m!164703 () Bool)

(assert (=> d!34906 m!164703))

(declare-fun m!164705 () Bool)

(assert (=> d!34906 m!164705))

(declare-fun m!164707 () Bool)

(assert (=> b!110943 m!164707))

(declare-fun m!164709 () Bool)

(assert (=> b!110943 m!164709))

(declare-fun m!164711 () Bool)

(assert (=> b!110942 m!164711))

(assert (=> b!110942 m!164711))

(declare-fun m!164713 () Bool)

(assert (=> b!110942 m!164713))

(assert (=> b!110940 m!164709))

(assert (=> b!110940 m!164351))

(declare-fun m!164715 () Bool)

(assert (=> b!110941 m!164715))

(assert (=> b!110762 d!34906))

(declare-fun d!34908 () Bool)

(declare-fun e!72804 () Bool)

(assert (=> d!34908 e!72804))

(declare-fun res!91601 () Bool)

(assert (=> d!34908 (=> (not res!91601) (not e!72804))))

(declare-fun lt!168036 () tuple2!9218)

(declare-fun lt!168038 () tuple2!9218)

(assert (=> d!34908 (= res!91601 (= (bitIndex!0 (size!2311 (buf!2708 (_1!4866 lt!168036))) (currentByte!5265 (_1!4866 lt!168036)) (currentBit!5260 (_1!4866 lt!168036))) (bitIndex!0 (size!2311 (buf!2708 (_1!4866 lt!168038))) (currentByte!5265 (_1!4866 lt!168038)) (currentBit!5260 (_1!4866 lt!168038)))))))

(declare-fun lt!168037 () Unit!6790)

(declare-fun lt!168039 () BitStream!4096)

(declare-fun choose!50 (BitStream!4096 BitStream!4096 BitStream!4096 tuple2!9218 tuple2!9218 BitStream!4096 Bool tuple2!9218 tuple2!9218 BitStream!4096 Bool) Unit!6790)

(assert (=> d!34908 (= lt!168037 (choose!50 lt!167635 (_2!4865 lt!167643) lt!168039 lt!168036 (tuple2!9219 (_1!4866 lt!168036) (_2!4866 lt!168036)) (_1!4866 lt!168036) (_2!4866 lt!168036) lt!168038 (tuple2!9219 (_1!4866 lt!168038) (_2!4866 lt!168038)) (_1!4866 lt!168038) (_2!4866 lt!168038)))))

(assert (=> d!34908 (= lt!168038 (readBitPure!0 lt!168039))))

(assert (=> d!34908 (= lt!168036 (readBitPure!0 lt!167635))))

(assert (=> d!34908 (= lt!168039 (BitStream!4097 (buf!2708 (_2!4865 lt!167643)) (currentByte!5265 lt!167635) (currentBit!5260 lt!167635)))))

(assert (=> d!34908 (invariant!0 (currentBit!5260 lt!167635) (currentByte!5265 lt!167635) (size!2311 (buf!2708 (_2!4865 lt!167643))))))

(assert (=> d!34908 (= (readBitPrefixLemma!0 lt!167635 (_2!4865 lt!167643)) lt!168037)))

(declare-fun b!110946 () Bool)

(assert (=> b!110946 (= e!72804 (= (_2!4866 lt!168036) (_2!4866 lt!168038)))))

(assert (= (and d!34908 res!91601) b!110946))

(assert (=> d!34908 m!164383))

(declare-fun m!164717 () Bool)

(assert (=> d!34908 m!164717))

(declare-fun m!164719 () Bool)

(assert (=> d!34908 m!164719))

(declare-fun m!164721 () Bool)

(assert (=> d!34908 m!164721))

(declare-fun m!164723 () Bool)

(assert (=> d!34908 m!164723))

(declare-fun m!164725 () Bool)

(assert (=> d!34908 m!164725))

(assert (=> b!110762 d!34908))

(declare-fun d!34910 () Bool)

(declare-fun e!72805 () Bool)

(assert (=> d!34910 e!72805))

(declare-fun res!91602 () Bool)

(assert (=> d!34910 (=> (not res!91602) (not e!72805))))

(declare-fun lt!168042 () (_ BitVec 64))

(declare-fun lt!168044 () (_ BitVec 64))

(declare-fun lt!168045 () (_ BitVec 64))

(assert (=> d!34910 (= res!91602 (= lt!168045 (bvsub lt!168044 lt!168042)))))

(assert (=> d!34910 (or (= (bvand lt!168044 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!168042 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!168044 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!168044 lt!168042) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34910 (= lt!168042 (remainingBits!0 ((_ sign_extend 32) (size!2311 (buf!2708 (_1!4866 lt!167642)))) ((_ sign_extend 32) (currentByte!5265 (_1!4866 lt!167642))) ((_ sign_extend 32) (currentBit!5260 (_1!4866 lt!167642)))))))

(declare-fun lt!168043 () (_ BitVec 64))

(declare-fun lt!168041 () (_ BitVec 64))

(assert (=> d!34910 (= lt!168044 (bvmul lt!168043 lt!168041))))

(assert (=> d!34910 (or (= lt!168043 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!168041 (bvsdiv (bvmul lt!168043 lt!168041) lt!168043)))))

(assert (=> d!34910 (= lt!168041 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!34910 (= lt!168043 ((_ sign_extend 32) (size!2311 (buf!2708 (_1!4866 lt!167642)))))))

(assert (=> d!34910 (= lt!168045 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5265 (_1!4866 lt!167642))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5260 (_1!4866 lt!167642)))))))

(assert (=> d!34910 (invariant!0 (currentBit!5260 (_1!4866 lt!167642)) (currentByte!5265 (_1!4866 lt!167642)) (size!2311 (buf!2708 (_1!4866 lt!167642))))))

(assert (=> d!34910 (= (bitIndex!0 (size!2311 (buf!2708 (_1!4866 lt!167642))) (currentByte!5265 (_1!4866 lt!167642)) (currentBit!5260 (_1!4866 lt!167642))) lt!168045)))

(declare-fun b!110947 () Bool)

(declare-fun res!91603 () Bool)

(assert (=> b!110947 (=> (not res!91603) (not e!72805))))

(assert (=> b!110947 (= res!91603 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!168045))))

(declare-fun b!110948 () Bool)

(declare-fun lt!168040 () (_ BitVec 64))

(assert (=> b!110948 (= e!72805 (bvsle lt!168045 (bvmul lt!168040 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!110948 (or (= lt!168040 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!168040 #b0000000000000000000000000000000000000000000000000000000000001000) lt!168040)))))

(assert (=> b!110948 (= lt!168040 ((_ sign_extend 32) (size!2311 (buf!2708 (_1!4866 lt!167642)))))))

(assert (= (and d!34910 res!91602) b!110947))

(assert (= (and b!110947 res!91603) b!110948))

(declare-fun m!164727 () Bool)

(assert (=> d!34910 m!164727))

(declare-fun m!164729 () Bool)

(assert (=> d!34910 m!164729))

(assert (=> b!110762 d!34910))

(declare-fun b!111036 () Bool)

(declare-fun lt!168312 () tuple2!9218)

(declare-fun lt!168315 () tuple2!9216)

(assert (=> b!111036 (= lt!168312 (readBitPure!0 (readerFrom!0 (_2!4865 lt!168315) (currentBit!5260 (_2!4865 lt!167626)) (currentByte!5265 (_2!4865 lt!167626)))))))

(declare-fun lt!168308 () Bool)

(declare-fun res!91677 () Bool)

(assert (=> b!111036 (= res!91677 (and (= (_2!4866 lt!168312) lt!168308) (= (_1!4866 lt!168312) (_2!4865 lt!168315))))))

(declare-fun e!72857 () Bool)

(assert (=> b!111036 (=> (not res!91677) (not e!72857))))

(declare-fun e!72858 () Bool)

(assert (=> b!111036 (= e!72858 e!72857)))

(declare-fun b!111037 () Bool)

(declare-fun res!91679 () Bool)

(declare-fun e!72856 () Bool)

(assert (=> b!111037 (=> (not res!91679) (not e!72856))))

(declare-fun lt!168338 () tuple2!9216)

(assert (=> b!111037 (= res!91679 (isPrefixOf!0 (_2!4865 lt!167626) (_2!4865 lt!168338)))))

(declare-fun b!111038 () Bool)

(declare-fun e!72861 () (_ BitVec 64))

(assert (=> b!111038 (= e!72861 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun d!34912 () Bool)

(assert (=> d!34912 e!72856))

(declare-fun res!91672 () Bool)

(assert (=> d!34912 (=> (not res!91672) (not e!72856))))

(assert (=> d!34912 (= res!91672 (= (size!2311 (buf!2708 (_2!4865 lt!167626))) (size!2311 (buf!2708 (_2!4865 lt!168338)))))))

(declare-fun e!72860 () tuple2!9216)

(assert (=> d!34912 (= lt!168338 e!72860)))

(declare-fun c!6747 () Bool)

(assert (=> d!34912 (= c!6747 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!34912 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!34912 (= (appendNLeastSignificantBitsLoop!0 (_2!4865 lt!167626) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!168338)))

(declare-fun bm!1389 () Bool)

(declare-fun call!1392 () Bool)

(declare-fun lt!168334 () tuple2!9216)

(declare-fun lt!168346 () BitStream!4096)

(assert (=> bm!1389 (= call!1392 (isPrefixOf!0 (ite c!6747 (_2!4865 lt!167626) lt!168346) (ite c!6747 (_2!4865 lt!168334) lt!168346)))))

(declare-fun b!111039 () Bool)

(declare-fun e!72859 () Bool)

(declare-fun lt!168333 () (_ BitVec 64))

(assert (=> b!111039 (= e!72859 (validate_offset_bits!1 ((_ sign_extend 32) (size!2311 (buf!2708 (_2!4865 lt!167626)))) ((_ sign_extend 32) (currentByte!5265 (_2!4865 lt!167626))) ((_ sign_extend 32) (currentBit!5260 (_2!4865 lt!167626))) lt!168333))))

(declare-fun b!111040 () Bool)

(declare-fun e!72855 () Bool)

(declare-fun lt!168343 () tuple2!9218)

(declare-fun lt!168337 () tuple2!9218)

(assert (=> b!111040 (= e!72855 (= (_2!4866 lt!168343) (_2!4866 lt!168337)))))

(declare-fun b!111041 () Bool)

(assert (=> b!111041 (= e!72857 (= (bitIndex!0 (size!2311 (buf!2708 (_1!4866 lt!168312))) (currentByte!5265 (_1!4866 lt!168312)) (currentBit!5260 (_1!4866 lt!168312))) (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!168315))) (currentByte!5265 (_2!4865 lt!168315)) (currentBit!5260 (_2!4865 lt!168315)))))))

(declare-fun b!111042 () Bool)

(declare-fun res!91678 () Bool)

(assert (=> b!111042 (=> (not res!91678) (not e!72856))))

(declare-fun lt!168339 () (_ BitVec 64))

(declare-fun lt!168332 () (_ BitVec 64))

(assert (=> b!111042 (= res!91678 (= (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!168338))) (currentByte!5265 (_2!4865 lt!168338)) (currentBit!5260 (_2!4865 lt!168338))) (bvadd lt!168339 lt!168332)))))

(assert (=> b!111042 (or (not (= (bvand lt!168339 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!168332 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!168339 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!168339 lt!168332) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!111042 (= lt!168332 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!111042 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!111042 (= lt!168339 (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!167626))) (currentByte!5265 (_2!4865 lt!167626)) (currentBit!5260 (_2!4865 lt!167626))))))

(declare-fun b!111043 () Bool)

(assert (=> b!111043 (= e!72861 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!111044 () Bool)

(declare-fun Unit!6798 () Unit!6790)

(assert (=> b!111044 (= e!72860 (tuple2!9217 Unit!6798 (_2!4865 lt!168334)))))

(assert (=> b!111044 (= lt!168308 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!111044 (= lt!168315 (appendBit!0 (_2!4865 lt!167626) lt!168308))))

(declare-fun res!91674 () Bool)

(assert (=> b!111044 (= res!91674 (= (size!2311 (buf!2708 (_2!4865 lt!167626))) (size!2311 (buf!2708 (_2!4865 lt!168315)))))))

(assert (=> b!111044 (=> (not res!91674) (not e!72858))))

(assert (=> b!111044 e!72858))

(declare-fun lt!168326 () tuple2!9216)

(assert (=> b!111044 (= lt!168326 lt!168315)))

(assert (=> b!111044 (= lt!168334 (appendNLeastSignificantBitsLoop!0 (_2!4865 lt!168326) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!168329 () Unit!6790)

(assert (=> b!111044 (= lt!168329 (lemmaIsPrefixTransitive!0 (_2!4865 lt!167626) (_2!4865 lt!168326) (_2!4865 lt!168334)))))

(assert (=> b!111044 call!1392))

(declare-fun lt!168351 () Unit!6790)

(assert (=> b!111044 (= lt!168351 lt!168329)))

(assert (=> b!111044 (invariant!0 (currentBit!5260 (_2!4865 lt!167626)) (currentByte!5265 (_2!4865 lt!167626)) (size!2311 (buf!2708 (_2!4865 lt!168326))))))

(declare-fun lt!168336 () BitStream!4096)

(assert (=> b!111044 (= lt!168336 (BitStream!4097 (buf!2708 (_2!4865 lt!168326)) (currentByte!5265 (_2!4865 lt!167626)) (currentBit!5260 (_2!4865 lt!167626))))))

(assert (=> b!111044 (invariant!0 (currentBit!5260 lt!168336) (currentByte!5265 lt!168336) (size!2311 (buf!2708 (_2!4865 lt!168334))))))

(declare-fun lt!168319 () BitStream!4096)

(assert (=> b!111044 (= lt!168319 (BitStream!4097 (buf!2708 (_2!4865 lt!168334)) (currentByte!5265 lt!168336) (currentBit!5260 lt!168336)))))

(assert (=> b!111044 (= lt!168343 (readBitPure!0 lt!168336))))

(assert (=> b!111044 (= lt!168337 (readBitPure!0 lt!168319))))

(declare-fun lt!168348 () Unit!6790)

(assert (=> b!111044 (= lt!168348 (readBitPrefixLemma!0 lt!168336 (_2!4865 lt!168334)))))

(declare-fun res!91675 () Bool)

(assert (=> b!111044 (= res!91675 (= (bitIndex!0 (size!2311 (buf!2708 (_1!4866 lt!168343))) (currentByte!5265 (_1!4866 lt!168343)) (currentBit!5260 (_1!4866 lt!168343))) (bitIndex!0 (size!2311 (buf!2708 (_1!4866 lt!168337))) (currentByte!5265 (_1!4866 lt!168337)) (currentBit!5260 (_1!4866 lt!168337)))))))

(assert (=> b!111044 (=> (not res!91675) (not e!72855))))

(assert (=> b!111044 e!72855))

(declare-fun lt!168317 () Unit!6790)

(assert (=> b!111044 (= lt!168317 lt!168348)))

(declare-fun lt!168331 () tuple2!9220)

(assert (=> b!111044 (= lt!168331 (reader!0 (_2!4865 lt!167626) (_2!4865 lt!168334)))))

(declare-fun lt!168316 () tuple2!9220)

(assert (=> b!111044 (= lt!168316 (reader!0 (_2!4865 lt!168326) (_2!4865 lt!168334)))))

(declare-fun lt!168330 () tuple2!9218)

(assert (=> b!111044 (= lt!168330 (readBitPure!0 (_1!4867 lt!168331)))))

(assert (=> b!111044 (= (_2!4866 lt!168330) lt!168308)))

(declare-fun lt!168321 () Unit!6790)

(declare-fun Unit!6800 () Unit!6790)

(assert (=> b!111044 (= lt!168321 Unit!6800)))

(declare-fun lt!168310 () (_ BitVec 64))

(assert (=> b!111044 (= lt!168310 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!168335 () (_ BitVec 64))

(assert (=> b!111044 (= lt!168335 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!168350 () Unit!6790)

(assert (=> b!111044 (= lt!168350 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4865 lt!167626) (buf!2708 (_2!4865 lt!168334)) lt!168335))))

(assert (=> b!111044 (validate_offset_bits!1 ((_ sign_extend 32) (size!2311 (buf!2708 (_2!4865 lt!168334)))) ((_ sign_extend 32) (currentByte!5265 (_2!4865 lt!167626))) ((_ sign_extend 32) (currentBit!5260 (_2!4865 lt!167626))) lt!168335)))

(declare-fun lt!168347 () Unit!6790)

(assert (=> b!111044 (= lt!168347 lt!168350)))

(declare-fun lt!168344 () tuple2!9222)

(assert (=> b!111044 (= lt!168344 (readNLeastSignificantBitsLoopPure!0 (_1!4867 lt!168331) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!168310))))

(declare-fun lt!168341 () (_ BitVec 64))

(assert (=> b!111044 (= lt!168341 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!168324 () Unit!6790)

(assert (=> b!111044 (= lt!168324 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4865 lt!168326) (buf!2708 (_2!4865 lt!168334)) lt!168341))))

(assert (=> b!111044 (validate_offset_bits!1 ((_ sign_extend 32) (size!2311 (buf!2708 (_2!4865 lt!168334)))) ((_ sign_extend 32) (currentByte!5265 (_2!4865 lt!168326))) ((_ sign_extend 32) (currentBit!5260 (_2!4865 lt!168326))) lt!168341)))

(declare-fun lt!168309 () Unit!6790)

(assert (=> b!111044 (= lt!168309 lt!168324)))

(declare-fun lt!168313 () tuple2!9222)

(assert (=> b!111044 (= lt!168313 (readNLeastSignificantBitsLoopPure!0 (_1!4867 lt!168316) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!168310 (ite (_2!4866 lt!168330) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!168342 () tuple2!9222)

(assert (=> b!111044 (= lt!168342 (readNLeastSignificantBitsLoopPure!0 (_1!4867 lt!168331) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!168310))))

(declare-fun c!6746 () Bool)

(assert (=> b!111044 (= c!6746 (_2!4866 (readBitPure!0 (_1!4867 lt!168331))))))

(declare-fun lt!168325 () tuple2!9222)

(assert (=> b!111044 (= lt!168325 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4867 lt!168331) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!168310 e!72861)))))

(declare-fun lt!168320 () Unit!6790)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4096 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6790)

(assert (=> b!111044 (= lt!168320 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4867 lt!168331) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!168310))))

(assert (=> b!111044 (and (= (_2!4868 lt!168342) (_2!4868 lt!168325)) (= (_1!4868 lt!168342) (_1!4868 lt!168325)))))

(declare-fun lt!168318 () Unit!6790)

(assert (=> b!111044 (= lt!168318 lt!168320)))

(assert (=> b!111044 (= (_1!4867 lt!168331) (withMovedBitIndex!0 (_2!4867 lt!168331) (bvsub (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!167626))) (currentByte!5265 (_2!4865 lt!167626)) (currentBit!5260 (_2!4865 lt!167626))) (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!168334))) (currentByte!5265 (_2!4865 lt!168334)) (currentBit!5260 (_2!4865 lt!168334))))))))

(declare-fun lt!168328 () Unit!6790)

(declare-fun Unit!6801 () Unit!6790)

(assert (=> b!111044 (= lt!168328 Unit!6801)))

(assert (=> b!111044 (= (_1!4867 lt!168316) (withMovedBitIndex!0 (_2!4867 lt!168316) (bvsub (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!168326))) (currentByte!5265 (_2!4865 lt!168326)) (currentBit!5260 (_2!4865 lt!168326))) (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!168334))) (currentByte!5265 (_2!4865 lt!168334)) (currentBit!5260 (_2!4865 lt!168334))))))))

(declare-fun lt!168349 () Unit!6790)

(declare-fun Unit!6802 () Unit!6790)

(assert (=> b!111044 (= lt!168349 Unit!6802)))

(assert (=> b!111044 (= (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!167626))) (currentByte!5265 (_2!4865 lt!167626)) (currentBit!5260 (_2!4865 lt!167626))) (bvsub (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!168326))) (currentByte!5265 (_2!4865 lt!168326)) (currentBit!5260 (_2!4865 lt!168326))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!168323 () Unit!6790)

(declare-fun Unit!6803 () Unit!6790)

(assert (=> b!111044 (= lt!168323 Unit!6803)))

(assert (=> b!111044 (= (_2!4868 lt!168344) (_2!4868 lt!168313))))

(declare-fun lt!168322 () Unit!6790)

(declare-fun Unit!6804 () Unit!6790)

(assert (=> b!111044 (= lt!168322 Unit!6804)))

(assert (=> b!111044 (= (_1!4868 lt!168344) (_2!4867 lt!168331))))

(declare-fun b!111045 () Bool)

(declare-fun res!91673 () Bool)

(assert (=> b!111045 (= res!91673 (isPrefixOf!0 (_2!4865 lt!167626) (_2!4865 lt!168315)))))

(assert (=> b!111045 (=> (not res!91673) (not e!72858))))

(declare-fun b!111046 () Bool)

(declare-fun lt!168327 () Unit!6790)

(assert (=> b!111046 (= e!72860 (tuple2!9217 lt!168327 (_2!4865 lt!167626)))))

(assert (=> b!111046 (= lt!168346 (_2!4865 lt!167626))))

(assert (=> b!111046 (= lt!168327 (lemmaIsPrefixRefl!0 lt!168346))))

(assert (=> b!111046 call!1392))

(declare-fun lt!168352 () tuple2!9220)

(declare-fun b!111047 () Bool)

(declare-fun lt!168314 () tuple2!9222)

(assert (=> b!111047 (= e!72856 (and (= (_2!4868 lt!168314) v!199) (= (_1!4868 lt!168314) (_2!4867 lt!168352))))))

(declare-fun lt!168311 () (_ BitVec 64))

(assert (=> b!111047 (= lt!168314 (readNLeastSignificantBitsLoopPure!0 (_1!4867 lt!168352) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!168311))))

(declare-fun lt!168340 () Unit!6790)

(declare-fun lt!168345 () Unit!6790)

(assert (=> b!111047 (= lt!168340 lt!168345)))

(assert (=> b!111047 (validate_offset_bits!1 ((_ sign_extend 32) (size!2311 (buf!2708 (_2!4865 lt!168338)))) ((_ sign_extend 32) (currentByte!5265 (_2!4865 lt!167626))) ((_ sign_extend 32) (currentBit!5260 (_2!4865 lt!167626))) lt!168333)))

(assert (=> b!111047 (= lt!168345 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4865 lt!167626) (buf!2708 (_2!4865 lt!168338)) lt!168333))))

(assert (=> b!111047 e!72859))

(declare-fun res!91676 () Bool)

(assert (=> b!111047 (=> (not res!91676) (not e!72859))))

(assert (=> b!111047 (= res!91676 (and (= (size!2311 (buf!2708 (_2!4865 lt!167626))) (size!2311 (buf!2708 (_2!4865 lt!168338)))) (bvsge lt!168333 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!111047 (= lt!168333 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!111047 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!111047 (= lt!168311 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!111047 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!111047 (= lt!168352 (reader!0 (_2!4865 lt!167626) (_2!4865 lt!168338)))))

(declare-fun b!111048 () Bool)

(declare-fun res!91680 () Bool)

(assert (=> b!111048 (= res!91680 (= (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!168315))) (currentByte!5265 (_2!4865 lt!168315)) (currentBit!5260 (_2!4865 lt!168315))) (bvadd (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!167626))) (currentByte!5265 (_2!4865 lt!167626)) (currentBit!5260 (_2!4865 lt!167626))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!111048 (=> (not res!91680) (not e!72858))))

(assert (= (and d!34912 c!6747) b!111044))

(assert (= (and d!34912 (not c!6747)) b!111046))

(assert (= (and b!111044 res!91674) b!111048))

(assert (= (and b!111048 res!91680) b!111045))

(assert (= (and b!111045 res!91673) b!111036))

(assert (= (and b!111036 res!91677) b!111041))

(assert (= (and b!111044 res!91675) b!111040))

(assert (= (and b!111044 c!6746) b!111043))

(assert (= (and b!111044 (not c!6746)) b!111038))

(assert (= (or b!111044 b!111046) bm!1389))

(assert (= (and d!34912 res!91672) b!111042))

(assert (= (and b!111042 res!91678) b!111037))

(assert (= (and b!111037 res!91679) b!111047))

(assert (= (and b!111047 res!91676) b!111039))

(declare-fun m!164833 () Bool)

(assert (=> bm!1389 m!164833))

(declare-fun m!164835 () Bool)

(assert (=> b!111044 m!164835))

(declare-fun m!164837 () Bool)

(assert (=> b!111044 m!164837))

(declare-fun m!164839 () Bool)

(assert (=> b!111044 m!164839))

(declare-fun m!164841 () Bool)

(assert (=> b!111044 m!164841))

(declare-fun m!164843 () Bool)

(assert (=> b!111044 m!164843))

(declare-fun m!164845 () Bool)

(assert (=> b!111044 m!164845))

(assert (=> b!111044 m!164349))

(declare-fun m!164847 () Bool)

(assert (=> b!111044 m!164847))

(declare-fun m!164849 () Bool)

(assert (=> b!111044 m!164849))

(declare-fun m!164851 () Bool)

(assert (=> b!111044 m!164851))

(declare-fun m!164853 () Bool)

(assert (=> b!111044 m!164853))

(declare-fun m!164855 () Bool)

(assert (=> b!111044 m!164855))

(declare-fun m!164857 () Bool)

(assert (=> b!111044 m!164857))

(declare-fun m!164859 () Bool)

(assert (=> b!111044 m!164859))

(declare-fun m!164861 () Bool)

(assert (=> b!111044 m!164861))

(declare-fun m!164863 () Bool)

(assert (=> b!111044 m!164863))

(declare-fun m!164865 () Bool)

(assert (=> b!111044 m!164865))

(declare-fun m!164867 () Bool)

(assert (=> b!111044 m!164867))

(declare-fun m!164869 () Bool)

(assert (=> b!111044 m!164869))

(declare-fun m!164871 () Bool)

(assert (=> b!111044 m!164871))

(declare-fun m!164873 () Bool)

(assert (=> b!111044 m!164873))

(assert (=> b!111044 m!164871))

(declare-fun m!164875 () Bool)

(assert (=> b!111044 m!164875))

(declare-fun m!164877 () Bool)

(assert (=> b!111044 m!164877))

(declare-fun m!164879 () Bool)

(assert (=> b!111044 m!164879))

(declare-fun m!164881 () Bool)

(assert (=> b!111044 m!164881))

(declare-fun m!164883 () Bool)

(assert (=> b!111044 m!164883))

(declare-fun m!164885 () Bool)

(assert (=> b!111044 m!164885))

(declare-fun m!164887 () Bool)

(assert (=> b!111044 m!164887))

(declare-fun m!164889 () Bool)

(assert (=> b!111039 m!164889))

(declare-fun m!164891 () Bool)

(assert (=> b!111046 m!164891))

(declare-fun m!164893 () Bool)

(assert (=> b!111042 m!164893))

(assert (=> b!111042 m!164349))

(declare-fun m!164895 () Bool)

(assert (=> b!111041 m!164895))

(declare-fun m!164897 () Bool)

(assert (=> b!111041 m!164897))

(declare-fun m!164899 () Bool)

(assert (=> b!111037 m!164899))

(declare-fun m!164901 () Bool)

(assert (=> b!111047 m!164901))

(declare-fun m!164903 () Bool)

(assert (=> b!111047 m!164903))

(declare-fun m!164905 () Bool)

(assert (=> b!111047 m!164905))

(assert (=> b!111047 m!164877))

(declare-fun m!164907 () Bool)

(assert (=> b!111047 m!164907))

(declare-fun m!164909 () Bool)

(assert (=> b!111045 m!164909))

(declare-fun m!164911 () Bool)

(assert (=> b!111036 m!164911))

(assert (=> b!111036 m!164911))

(declare-fun m!164913 () Bool)

(assert (=> b!111036 m!164913))

(assert (=> b!111048 m!164897))

(assert (=> b!111048 m!164349))

(assert (=> b!110762 d!34912))

(declare-fun d!34946 () Bool)

(assert (=> d!34946 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2311 (buf!2708 (_2!4865 lt!167643)))) ((_ sign_extend 32) (currentByte!5265 (_2!4865 lt!167626))) ((_ sign_extend 32) (currentBit!5260 (_2!4865 lt!167626))) lt!167636) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2311 (buf!2708 (_2!4865 lt!167643)))) ((_ sign_extend 32) (currentByte!5265 (_2!4865 lt!167626))) ((_ sign_extend 32) (currentBit!5260 (_2!4865 lt!167626)))) lt!167636))))

(declare-fun bs!8566 () Bool)

(assert (= bs!8566 d!34946))

(declare-fun m!164915 () Bool)

(assert (=> bs!8566 m!164915))

(assert (=> b!110762 d!34946))

(declare-fun lt!168361 () tuple2!9244)

(declare-fun d!34948 () Bool)

(assert (=> d!34948 (= lt!168361 (readNLeastSignificantBitsLoop!0 (_1!4867 lt!167630) nBits!396 i!615 lt!167644))))

(assert (=> d!34948 (= (readNLeastSignificantBitsLoopPure!0 (_1!4867 lt!167630) nBits!396 i!615 lt!167644) (tuple2!9223 (_2!4879 lt!168361) (_1!4879 lt!168361)))))

(declare-fun bs!8567 () Bool)

(assert (= bs!8567 d!34948))

(declare-fun m!164917 () Bool)

(assert (=> bs!8567 m!164917))

(assert (=> b!110762 d!34948))

(declare-fun b!111058 () Bool)

(declare-fun res!91691 () Bool)

(declare-fun e!72866 () Bool)

(assert (=> b!111058 (=> (not res!91691) (not e!72866))))

(declare-fun lt!168380 () tuple2!9220)

(assert (=> b!111058 (= res!91691 (isPrefixOf!0 (_1!4867 lt!168380) (_2!4865 lt!167626)))))

(declare-fun b!111059 () Bool)

(declare-fun e!72867 () Unit!6790)

(declare-fun Unit!6806 () Unit!6790)

(assert (=> b!111059 (= e!72867 Unit!6806)))

(declare-fun b!111060 () Bool)

(declare-fun lt!168370 () Unit!6790)

(assert (=> b!111060 (= e!72867 lt!168370)))

(declare-fun lt!168372 () (_ BitVec 64))

(assert (=> b!111060 (= lt!168372 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!168371 () (_ BitVec 64))

(assert (=> b!111060 (= lt!168371 (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!167626))) (currentByte!5265 (_2!4865 lt!167626)) (currentBit!5260 (_2!4865 lt!167626))))))

(assert (=> b!111060 (= lt!168370 (arrayBitRangesEqSymmetric!0 (buf!2708 (_2!4865 lt!167626)) (buf!2708 (_2!4865 lt!167643)) lt!168372 lt!168371))))

(assert (=> b!111060 (arrayBitRangesEq!0 (buf!2708 (_2!4865 lt!167643)) (buf!2708 (_2!4865 lt!167626)) lt!168372 lt!168371)))

(declare-fun b!111061 () Bool)

(declare-fun res!91690 () Bool)

(assert (=> b!111061 (=> (not res!91690) (not e!72866))))

(assert (=> b!111061 (= res!91690 (isPrefixOf!0 (_2!4867 lt!168380) (_2!4865 lt!167643)))))

(declare-fun d!34950 () Bool)

(assert (=> d!34950 e!72866))

(declare-fun res!91689 () Bool)

(assert (=> d!34950 (=> (not res!91689) (not e!72866))))

(assert (=> d!34950 (= res!91689 (isPrefixOf!0 (_1!4867 lt!168380) (_2!4867 lt!168380)))))

(declare-fun lt!168368 () BitStream!4096)

(assert (=> d!34950 (= lt!168380 (tuple2!9221 lt!168368 (_2!4865 lt!167643)))))

(declare-fun lt!168377 () Unit!6790)

(declare-fun lt!168373 () Unit!6790)

(assert (=> d!34950 (= lt!168377 lt!168373)))

(assert (=> d!34950 (isPrefixOf!0 lt!168368 (_2!4865 lt!167643))))

(assert (=> d!34950 (= lt!168373 (lemmaIsPrefixTransitive!0 lt!168368 (_2!4865 lt!167643) (_2!4865 lt!167643)))))

(declare-fun lt!168364 () Unit!6790)

(declare-fun lt!168369 () Unit!6790)

(assert (=> d!34950 (= lt!168364 lt!168369)))

(assert (=> d!34950 (isPrefixOf!0 lt!168368 (_2!4865 lt!167643))))

(assert (=> d!34950 (= lt!168369 (lemmaIsPrefixTransitive!0 lt!168368 (_2!4865 lt!167626) (_2!4865 lt!167643)))))

(declare-fun lt!168376 () Unit!6790)

(assert (=> d!34950 (= lt!168376 e!72867)))

(declare-fun c!6748 () Bool)

(assert (=> d!34950 (= c!6748 (not (= (size!2311 (buf!2708 (_2!4865 lt!167626))) #b00000000000000000000000000000000)))))

(declare-fun lt!168378 () Unit!6790)

(declare-fun lt!168375 () Unit!6790)

(assert (=> d!34950 (= lt!168378 lt!168375)))

(assert (=> d!34950 (isPrefixOf!0 (_2!4865 lt!167643) (_2!4865 lt!167643))))

(assert (=> d!34950 (= lt!168375 (lemmaIsPrefixRefl!0 (_2!4865 lt!167643)))))

(declare-fun lt!168381 () Unit!6790)

(declare-fun lt!168363 () Unit!6790)

(assert (=> d!34950 (= lt!168381 lt!168363)))

(assert (=> d!34950 (= lt!168363 (lemmaIsPrefixRefl!0 (_2!4865 lt!167643)))))

(declare-fun lt!168374 () Unit!6790)

(declare-fun lt!168379 () Unit!6790)

(assert (=> d!34950 (= lt!168374 lt!168379)))

(assert (=> d!34950 (isPrefixOf!0 lt!168368 lt!168368)))

(assert (=> d!34950 (= lt!168379 (lemmaIsPrefixRefl!0 lt!168368))))

(declare-fun lt!168365 () Unit!6790)

(declare-fun lt!168362 () Unit!6790)

(assert (=> d!34950 (= lt!168365 lt!168362)))

(assert (=> d!34950 (isPrefixOf!0 (_2!4865 lt!167626) (_2!4865 lt!167626))))

(assert (=> d!34950 (= lt!168362 (lemmaIsPrefixRefl!0 (_2!4865 lt!167626)))))

(assert (=> d!34950 (= lt!168368 (BitStream!4097 (buf!2708 (_2!4865 lt!167643)) (currentByte!5265 (_2!4865 lt!167626)) (currentBit!5260 (_2!4865 lt!167626))))))

(assert (=> d!34950 (isPrefixOf!0 (_2!4865 lt!167626) (_2!4865 lt!167643))))

(assert (=> d!34950 (= (reader!0 (_2!4865 lt!167626) (_2!4865 lt!167643)) lt!168380)))

(declare-fun b!111062 () Bool)

(declare-fun lt!168367 () (_ BitVec 64))

(declare-fun lt!168366 () (_ BitVec 64))

(assert (=> b!111062 (= e!72866 (= (_1!4867 lt!168380) (withMovedBitIndex!0 (_2!4867 lt!168380) (bvsub lt!168367 lt!168366))))))

(assert (=> b!111062 (or (= (bvand lt!168367 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!168366 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!168367 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!168367 lt!168366) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!111062 (= lt!168366 (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!167643))) (currentByte!5265 (_2!4865 lt!167643)) (currentBit!5260 (_2!4865 lt!167643))))))

(assert (=> b!111062 (= lt!168367 (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!167626))) (currentByte!5265 (_2!4865 lt!167626)) (currentBit!5260 (_2!4865 lt!167626))))))

(assert (= (and d!34950 c!6748) b!111060))

(assert (= (and d!34950 (not c!6748)) b!111059))

(assert (= (and d!34950 res!91689) b!111058))

(assert (= (and b!111058 res!91691) b!111061))

(assert (= (and b!111061 res!91690) b!111062))

(declare-fun m!164919 () Bool)

(assert (=> b!111061 m!164919))

(declare-fun m!164921 () Bool)

(assert (=> d!34950 m!164921))

(declare-fun m!164923 () Bool)

(assert (=> d!34950 m!164923))

(declare-fun m!164925 () Bool)

(assert (=> d!34950 m!164925))

(assert (=> d!34950 m!164675))

(declare-fun m!164927 () Bool)

(assert (=> d!34950 m!164927))

(assert (=> d!34950 m!164679))

(declare-fun m!164929 () Bool)

(assert (=> d!34950 m!164929))

(declare-fun m!164931 () Bool)

(assert (=> d!34950 m!164931))

(declare-fun m!164933 () Bool)

(assert (=> d!34950 m!164933))

(declare-fun m!164935 () Bool)

(assert (=> d!34950 m!164935))

(declare-fun m!164937 () Bool)

(assert (=> d!34950 m!164937))

(declare-fun m!164939 () Bool)

(assert (=> b!111058 m!164939))

(declare-fun m!164941 () Bool)

(assert (=> b!111062 m!164941))

(assert (=> b!111062 m!164693))

(assert (=> b!111062 m!164349))

(assert (=> b!111060 m!164349))

(declare-fun m!164943 () Bool)

(assert (=> b!111060 m!164943))

(declare-fun m!164945 () Bool)

(assert (=> b!111060 m!164945))

(assert (=> b!110762 d!34950))

(declare-fun d!34952 () Bool)

(declare-fun e!72872 () Bool)

(assert (=> d!34952 e!72872))

(declare-fun res!91696 () Bool)

(assert (=> d!34952 (=> (not res!91696) (not e!72872))))

(declare-fun lt!168395 () (_ BitVec 64))

(declare-fun lt!168394 () (_ BitVec 64))

(declare-fun lt!168392 () (_ BitVec 64))

(assert (=> d!34952 (= res!91696 (= lt!168395 (bvsub lt!168394 lt!168392)))))

(assert (=> d!34952 (or (= (bvand lt!168394 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!168392 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!168394 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!168394 lt!168392) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34952 (= lt!168392 (remainingBits!0 ((_ sign_extend 32) (size!2311 (buf!2708 (_1!4866 lt!167641)))) ((_ sign_extend 32) (currentByte!5265 (_1!4866 lt!167641))) ((_ sign_extend 32) (currentBit!5260 (_1!4866 lt!167641)))))))

(declare-fun lt!168393 () (_ BitVec 64))

(declare-fun lt!168391 () (_ BitVec 64))

(assert (=> d!34952 (= lt!168394 (bvmul lt!168393 lt!168391))))

(assert (=> d!34952 (or (= lt!168393 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!168391 (bvsdiv (bvmul lt!168393 lt!168391) lt!168393)))))

(assert (=> d!34952 (= lt!168391 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!34952 (= lt!168393 ((_ sign_extend 32) (size!2311 (buf!2708 (_1!4866 lt!167641)))))))

(assert (=> d!34952 (= lt!168395 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5265 (_1!4866 lt!167641))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5260 (_1!4866 lt!167641)))))))

(assert (=> d!34952 (invariant!0 (currentBit!5260 (_1!4866 lt!167641)) (currentByte!5265 (_1!4866 lt!167641)) (size!2311 (buf!2708 (_1!4866 lt!167641))))))

(assert (=> d!34952 (= (bitIndex!0 (size!2311 (buf!2708 (_1!4866 lt!167641))) (currentByte!5265 (_1!4866 lt!167641)) (currentBit!5260 (_1!4866 lt!167641))) lt!168395)))

(declare-fun b!111071 () Bool)

(declare-fun res!91697 () Bool)

(assert (=> b!111071 (=> (not res!91697) (not e!72872))))

(assert (=> b!111071 (= res!91697 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!168395))))

(declare-fun b!111072 () Bool)

(declare-fun lt!168390 () (_ BitVec 64))

(assert (=> b!111072 (= e!72872 (bvsle lt!168395 (bvmul lt!168390 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!111072 (or (= lt!168390 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!168390 #b0000000000000000000000000000000000000000000000000000000000001000) lt!168390)))))

(assert (=> b!111072 (= lt!168390 ((_ sign_extend 32) (size!2311 (buf!2708 (_1!4866 lt!167641)))))))

(assert (= (and d!34952 res!91696) b!111071))

(assert (= (and b!111071 res!91697) b!111072))

(declare-fun m!164947 () Bool)

(assert (=> d!34952 m!164947))

(declare-fun m!164949 () Bool)

(assert (=> d!34952 m!164949))

(assert (=> b!110763 d!34952))

(declare-fun d!34954 () Bool)

(assert (=> d!34954 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2311 (buf!2708 thiss!1305))) ((_ sign_extend 32) (currentByte!5265 thiss!1305)) ((_ sign_extend 32) (currentBit!5260 thiss!1305)) lt!167628) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2311 (buf!2708 thiss!1305))) ((_ sign_extend 32) (currentByte!5265 thiss!1305)) ((_ sign_extend 32) (currentBit!5260 thiss!1305))) lt!167628))))

(declare-fun bs!8568 () Bool)

(assert (= bs!8568 d!34954))

(assert (=> bs!8568 m!164565))

(assert (=> b!110768 d!34954))

(declare-fun d!34956 () Bool)

(assert (=> d!34956 (= (invariant!0 (currentBit!5260 thiss!1305) (currentByte!5265 thiss!1305) (size!2311 (buf!2708 (_2!4865 lt!167626)))) (and (bvsge (currentBit!5260 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5260 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5265 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5265 thiss!1305) (size!2311 (buf!2708 (_2!4865 lt!167626)))) (and (= (currentBit!5260 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5265 thiss!1305) (size!2311 (buf!2708 (_2!4865 lt!167626))))))))))

(assert (=> b!110759 d!34956))

(declare-fun d!34958 () Bool)

(assert (=> d!34958 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5260 thiss!1305) (currentByte!5265 thiss!1305) (size!2311 (buf!2708 thiss!1305))))))

(declare-fun bs!8569 () Bool)

(assert (= bs!8569 d!34958))

(assert (=> bs!8569 m!164567))

(assert (=> start!21952 d!34958))

(declare-fun d!34964 () Bool)

(assert (=> d!34964 (= (array_inv!2113 (buf!2708 thiss!1305)) (bvsge (size!2311 (buf!2708 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!110769 d!34964))

(declare-fun d!34966 () Bool)

(assert (=> d!34966 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!110764 d!34966))

(push 1)

(assert (not d!34908))

(assert (not d!34874))

(assert (not b!111039))

(assert (not d!34864))

(assert (not b!111058))

(assert (not b!110941))

(assert (not b!111062))

(assert (not d!34958))

(assert (not b!110866))

(assert (not d!34886))

(assert (not b!110928))

(assert (not b!111036))

(assert (not d!34882))

(assert (not b!111061))

(assert (not d!34858))

(assert (not b!110926))

(assert (not b!110942))

(assert (not b!111048))

(assert (not d!34866))

(assert (not d!34870))

(assert (not b!110927))

(assert (not b!111046))

(assert (not d!34902))

(assert (not d!34950))

(assert (not b!110925))

(assert (not b!110873))

(assert (not b!111047))

(assert (not d!34872))

(assert (not d!34868))

(assert (not d!34852))

(assert (not b!110943))

(assert (not b!111041))

(assert (not d!34910))

(assert (not b!111060))

(assert (not b!111042))

(assert (not d!34954))

(assert (not d!34952))

(assert (not b!111044))

(assert (not b!110875))

(assert (not d!34946))

(assert (not bm!1389))

(assert (not d!34878))

(assert (not b!111037))

(assert (not b!110923))

(assert (not b!110930))

(assert (not d!34850))

(assert (not d!34948))

(assert (not b!110940))

(assert (not b!111045))

(assert (not d!34856))

(assert (not d!34906))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!35426 () Bool)

(declare-fun lt!169376 () tuple2!9240)

(assert (=> d!35426 (= lt!169376 (readBit!0 (readerFrom!0 (_2!4865 lt!168024) (currentBit!5260 thiss!1305) (currentByte!5265 thiss!1305))))))

(assert (=> d!35426 (= (readBitPure!0 (readerFrom!0 (_2!4865 lt!168024) (currentBit!5260 thiss!1305) (currentByte!5265 thiss!1305))) (tuple2!9219 (_2!4877 lt!169376) (_1!4877 lt!169376)))))

(declare-fun bs!8653 () Bool)

(assert (= bs!8653 d!35426))

(assert (=> bs!8653 m!164711))

(declare-fun m!166241 () Bool)

(assert (=> bs!8653 m!166241))

(assert (=> b!110942 d!35426))

(declare-fun d!35428 () Bool)

(declare-fun e!73207 () Bool)

(assert (=> d!35428 e!73207))

(declare-fun res!92125 () Bool)

(assert (=> d!35428 (=> (not res!92125) (not e!73207))))

(assert (=> d!35428 (= res!92125 (invariant!0 (currentBit!5260 (_2!4865 lt!168024)) (currentByte!5265 (_2!4865 lt!168024)) (size!2311 (buf!2708 (_2!4865 lt!168024)))))))

(assert (=> d!35428 (= (readerFrom!0 (_2!4865 lt!168024) (currentBit!5260 thiss!1305) (currentByte!5265 thiss!1305)) (BitStream!4097 (buf!2708 (_2!4865 lt!168024)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305)))))

(declare-fun b!111585 () Bool)

(assert (=> b!111585 (= e!73207 (invariant!0 (currentBit!5260 thiss!1305) (currentByte!5265 thiss!1305) (size!2311 (buf!2708 (_2!4865 lt!168024)))))))

(assert (= (and d!35428 res!92125) b!111585))

(declare-fun m!166243 () Bool)

(assert (=> d!35428 m!166243))

(declare-fun m!166245 () Bool)

(assert (=> b!111585 m!166245))

(assert (=> b!110942 d!35428))

(declare-fun d!35430 () Bool)

(declare-fun e!73208 () Bool)

(assert (=> d!35430 e!73208))

(declare-fun res!92126 () Bool)

(assert (=> d!35430 (=> (not res!92126) (not e!73208))))

(declare-fun lt!169382 () (_ BitVec 64))

(declare-fun lt!169379 () (_ BitVec 64))

(declare-fun lt!169381 () (_ BitVec 64))

(assert (=> d!35430 (= res!92126 (= lt!169382 (bvsub lt!169381 lt!169379)))))

(assert (=> d!35430 (or (= (bvand lt!169381 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!169379 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!169381 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!169381 lt!169379) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35430 (= lt!169379 (remainingBits!0 ((_ sign_extend 32) (size!2311 (buf!2708 (_1!4866 lt!168038)))) ((_ sign_extend 32) (currentByte!5265 (_1!4866 lt!168038))) ((_ sign_extend 32) (currentBit!5260 (_1!4866 lt!168038)))))))

(declare-fun lt!169380 () (_ BitVec 64))

(declare-fun lt!169378 () (_ BitVec 64))

(assert (=> d!35430 (= lt!169381 (bvmul lt!169380 lt!169378))))

(assert (=> d!35430 (or (= lt!169380 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!169378 (bvsdiv (bvmul lt!169380 lt!169378) lt!169380)))))

(assert (=> d!35430 (= lt!169378 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35430 (= lt!169380 ((_ sign_extend 32) (size!2311 (buf!2708 (_1!4866 lt!168038)))))))

(assert (=> d!35430 (= lt!169382 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5265 (_1!4866 lt!168038))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5260 (_1!4866 lt!168038)))))))

(assert (=> d!35430 (invariant!0 (currentBit!5260 (_1!4866 lt!168038)) (currentByte!5265 (_1!4866 lt!168038)) (size!2311 (buf!2708 (_1!4866 lt!168038))))))

(assert (=> d!35430 (= (bitIndex!0 (size!2311 (buf!2708 (_1!4866 lt!168038))) (currentByte!5265 (_1!4866 lt!168038)) (currentBit!5260 (_1!4866 lt!168038))) lt!169382)))

(declare-fun b!111586 () Bool)

(declare-fun res!92127 () Bool)

(assert (=> b!111586 (=> (not res!92127) (not e!73208))))

(assert (=> b!111586 (= res!92127 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!169382))))

(declare-fun b!111587 () Bool)

(declare-fun lt!169377 () (_ BitVec 64))

(assert (=> b!111587 (= e!73208 (bvsle lt!169382 (bvmul lt!169377 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!111587 (or (= lt!169377 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!169377 #b0000000000000000000000000000000000000000000000000000000000001000) lt!169377)))))

(assert (=> b!111587 (= lt!169377 ((_ sign_extend 32) (size!2311 (buf!2708 (_1!4866 lt!168038)))))))

(assert (= (and d!35430 res!92126) b!111586))

(assert (= (and b!111586 res!92127) b!111587))

(declare-fun m!166247 () Bool)

(assert (=> d!35430 m!166247))

(declare-fun m!166249 () Bool)

(assert (=> d!35430 m!166249))

(assert (=> d!34908 d!35430))

(declare-fun d!35432 () Bool)

(declare-fun lt!169383 () tuple2!9240)

(assert (=> d!35432 (= lt!169383 (readBit!0 lt!168039))))

(assert (=> d!35432 (= (readBitPure!0 lt!168039) (tuple2!9219 (_2!4877 lt!169383) (_1!4877 lt!169383)))))

(declare-fun bs!8654 () Bool)

(assert (= bs!8654 d!35432))

(declare-fun m!166251 () Bool)

(assert (=> bs!8654 m!166251))

(assert (=> d!34908 d!35432))

(assert (=> d!34908 d!34872))

(declare-fun d!35434 () Bool)

(declare-fun e!73209 () Bool)

(assert (=> d!35434 e!73209))

(declare-fun res!92128 () Bool)

(assert (=> d!35434 (=> (not res!92128) (not e!73209))))

(declare-fun lt!169388 () (_ BitVec 64))

(declare-fun lt!169386 () (_ BitVec 64))

(declare-fun lt!169389 () (_ BitVec 64))

(assert (=> d!35434 (= res!92128 (= lt!169389 (bvsub lt!169388 lt!169386)))))

(assert (=> d!35434 (or (= (bvand lt!169388 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!169386 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!169388 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!169388 lt!169386) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35434 (= lt!169386 (remainingBits!0 ((_ sign_extend 32) (size!2311 (buf!2708 (_1!4866 lt!168036)))) ((_ sign_extend 32) (currentByte!5265 (_1!4866 lt!168036))) ((_ sign_extend 32) (currentBit!5260 (_1!4866 lt!168036)))))))

(declare-fun lt!169387 () (_ BitVec 64))

(declare-fun lt!169385 () (_ BitVec 64))

(assert (=> d!35434 (= lt!169388 (bvmul lt!169387 lt!169385))))

(assert (=> d!35434 (or (= lt!169387 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!169385 (bvsdiv (bvmul lt!169387 lt!169385) lt!169387)))))

(assert (=> d!35434 (= lt!169385 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35434 (= lt!169387 ((_ sign_extend 32) (size!2311 (buf!2708 (_1!4866 lt!168036)))))))

(assert (=> d!35434 (= lt!169389 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5265 (_1!4866 lt!168036))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5260 (_1!4866 lt!168036)))))))

(assert (=> d!35434 (invariant!0 (currentBit!5260 (_1!4866 lt!168036)) (currentByte!5265 (_1!4866 lt!168036)) (size!2311 (buf!2708 (_1!4866 lt!168036))))))

(assert (=> d!35434 (= (bitIndex!0 (size!2311 (buf!2708 (_1!4866 lt!168036))) (currentByte!5265 (_1!4866 lt!168036)) (currentBit!5260 (_1!4866 lt!168036))) lt!169389)))

(declare-fun b!111588 () Bool)

(declare-fun res!92129 () Bool)

(assert (=> b!111588 (=> (not res!92129) (not e!73209))))

(assert (=> b!111588 (= res!92129 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!169389))))

(declare-fun b!111589 () Bool)

(declare-fun lt!169384 () (_ BitVec 64))

(assert (=> b!111589 (= e!73209 (bvsle lt!169389 (bvmul lt!169384 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!111589 (or (= lt!169384 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!169384 #b0000000000000000000000000000000000000000000000000000000000001000) lt!169384)))))

(assert (=> b!111589 (= lt!169384 ((_ sign_extend 32) (size!2311 (buf!2708 (_1!4866 lt!168036)))))))

(assert (= (and d!35434 res!92128) b!111588))

(assert (= (and b!111588 res!92129) b!111589))

(declare-fun m!166253 () Bool)

(assert (=> d!35434 m!166253))

(declare-fun m!166255 () Bool)

(assert (=> d!35434 m!166255))

(assert (=> d!34908 d!35434))

(declare-fun d!35436 () Bool)

(declare-fun e!73212 () Bool)

(assert (=> d!35436 e!73212))

(declare-fun res!92132 () Bool)

(assert (=> d!35436 (=> (not res!92132) (not e!73212))))

(declare-fun lt!169397 () tuple2!9218)

(declare-fun lt!169396 () tuple2!9218)

(assert (=> d!35436 (= res!92132 (= (bitIndex!0 (size!2311 (buf!2708 (_1!4866 lt!169397))) (currentByte!5265 (_1!4866 lt!169397)) (currentBit!5260 (_1!4866 lt!169397))) (bitIndex!0 (size!2311 (buf!2708 (_1!4866 lt!169396))) (currentByte!5265 (_1!4866 lt!169396)) (currentBit!5260 (_1!4866 lt!169396)))))))

(declare-fun lt!169398 () BitStream!4096)

(assert (=> d!35436 (= lt!169396 (readBitPure!0 lt!169398))))

(assert (=> d!35436 (= lt!169397 (readBitPure!0 lt!167635))))

(assert (=> d!35436 (= lt!169398 (BitStream!4097 (buf!2708 (_2!4865 lt!167643)) (currentByte!5265 lt!167635) (currentBit!5260 lt!167635)))))

(assert (=> d!35436 (invariant!0 (currentBit!5260 lt!167635) (currentByte!5265 lt!167635) (size!2311 (buf!2708 (_2!4865 lt!167643))))))

(assert (=> d!35436 true))

(declare-fun _$9!51 () Unit!6790)

(assert (=> d!35436 (= (choose!50 lt!167635 (_2!4865 lt!167643) lt!168039 lt!168036 (tuple2!9219 (_1!4866 lt!168036) (_2!4866 lt!168036)) (_1!4866 lt!168036) (_2!4866 lt!168036) lt!168038 (tuple2!9219 (_1!4866 lt!168038) (_2!4866 lt!168038)) (_1!4866 lt!168038) (_2!4866 lt!168038)) _$9!51)))

(declare-fun b!111592 () Bool)

(assert (=> b!111592 (= e!73212 (= (_2!4866 lt!169397) (_2!4866 lt!169396)))))

(assert (= (and d!35436 res!92132) b!111592))

(assert (=> d!35436 m!164717))

(declare-fun m!166257 () Bool)

(assert (=> d!35436 m!166257))

(declare-fun m!166259 () Bool)

(assert (=> d!35436 m!166259))

(assert (=> d!35436 m!164383))

(declare-fun m!166261 () Bool)

(assert (=> d!35436 m!166261))

(assert (=> d!34908 d!35436))

(declare-fun d!35438 () Bool)

(assert (=> d!35438 (= (invariant!0 (currentBit!5260 lt!167635) (currentByte!5265 lt!167635) (size!2311 (buf!2708 (_2!4865 lt!167643)))) (and (bvsge (currentBit!5260 lt!167635) #b00000000000000000000000000000000) (bvslt (currentBit!5260 lt!167635) #b00000000000000000000000000001000) (bvsge (currentByte!5265 lt!167635) #b00000000000000000000000000000000) (or (bvslt (currentByte!5265 lt!167635) (size!2311 (buf!2708 (_2!4865 lt!167643)))) (and (= (currentBit!5260 lt!167635) #b00000000000000000000000000000000) (= (currentByte!5265 lt!167635) (size!2311 (buf!2708 (_2!4865 lt!167643))))))))))

(assert (=> d!34908 d!35438))

(declare-fun d!35440 () Bool)

(declare-fun res!92134 () Bool)

(declare-fun e!73214 () Bool)

(assert (=> d!35440 (=> (not res!92134) (not e!73214))))

(assert (=> d!35440 (= res!92134 (= (size!2311 (buf!2708 (_1!4867 lt!168380))) (size!2311 (buf!2708 (_2!4865 lt!167626)))))))

(assert (=> d!35440 (= (isPrefixOf!0 (_1!4867 lt!168380) (_2!4865 lt!167626)) e!73214)))

(declare-fun b!111593 () Bool)

(declare-fun res!92133 () Bool)

(assert (=> b!111593 (=> (not res!92133) (not e!73214))))

(assert (=> b!111593 (= res!92133 (bvsle (bitIndex!0 (size!2311 (buf!2708 (_1!4867 lt!168380))) (currentByte!5265 (_1!4867 lt!168380)) (currentBit!5260 (_1!4867 lt!168380))) (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!167626))) (currentByte!5265 (_2!4865 lt!167626)) (currentBit!5260 (_2!4865 lt!167626)))))))

(declare-fun b!111594 () Bool)

(declare-fun e!73213 () Bool)

(assert (=> b!111594 (= e!73214 e!73213)))

(declare-fun res!92135 () Bool)

(assert (=> b!111594 (=> res!92135 e!73213)))

(assert (=> b!111594 (= res!92135 (= (size!2311 (buf!2708 (_1!4867 lt!168380))) #b00000000000000000000000000000000))))

(declare-fun b!111595 () Bool)

(assert (=> b!111595 (= e!73213 (arrayBitRangesEq!0 (buf!2708 (_1!4867 lt!168380)) (buf!2708 (_2!4865 lt!167626)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2311 (buf!2708 (_1!4867 lt!168380))) (currentByte!5265 (_1!4867 lt!168380)) (currentBit!5260 (_1!4867 lt!168380)))))))

(assert (= (and d!35440 res!92134) b!111593))

(assert (= (and b!111593 res!92133) b!111594))

(assert (= (and b!111594 (not res!92135)) b!111595))

(declare-fun m!166263 () Bool)

(assert (=> b!111593 m!166263))

(assert (=> b!111593 m!164349))

(assert (=> b!111595 m!166263))

(assert (=> b!111595 m!166263))

(declare-fun m!166265 () Bool)

(assert (=> b!111595 m!166265))

(assert (=> b!111058 d!35440))

(declare-fun d!35442 () Bool)

(declare-fun e!73215 () Bool)

(assert (=> d!35442 e!73215))

(declare-fun res!92136 () Bool)

(assert (=> d!35442 (=> (not res!92136) (not e!73215))))

(declare-fun lt!169403 () (_ BitVec 64))

(declare-fun lt!169404 () (_ BitVec 64))

(declare-fun lt!169401 () (_ BitVec 64))

(assert (=> d!35442 (= res!92136 (= lt!169404 (bvsub lt!169403 lt!169401)))))

(assert (=> d!35442 (or (= (bvand lt!169403 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!169401 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!169403 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!169403 lt!169401) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35442 (= lt!169401 (remainingBits!0 ((_ sign_extend 32) (size!2311 (buf!2708 (_2!4865 lt!168024)))) ((_ sign_extend 32) (currentByte!5265 (_2!4865 lt!168024))) ((_ sign_extend 32) (currentBit!5260 (_2!4865 lt!168024)))))))

(declare-fun lt!169402 () (_ BitVec 64))

(declare-fun lt!169400 () (_ BitVec 64))

(assert (=> d!35442 (= lt!169403 (bvmul lt!169402 lt!169400))))

(assert (=> d!35442 (or (= lt!169402 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!169400 (bvsdiv (bvmul lt!169402 lt!169400) lt!169402)))))

(assert (=> d!35442 (= lt!169400 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35442 (= lt!169402 ((_ sign_extend 32) (size!2311 (buf!2708 (_2!4865 lt!168024)))))))

(assert (=> d!35442 (= lt!169404 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5265 (_2!4865 lt!168024))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5260 (_2!4865 lt!168024)))))))

(assert (=> d!35442 (invariant!0 (currentBit!5260 (_2!4865 lt!168024)) (currentByte!5265 (_2!4865 lt!168024)) (size!2311 (buf!2708 (_2!4865 lt!168024))))))

(assert (=> d!35442 (= (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!168024))) (currentByte!5265 (_2!4865 lt!168024)) (currentBit!5260 (_2!4865 lt!168024))) lt!169404)))

(declare-fun b!111596 () Bool)

(declare-fun res!92137 () Bool)

(assert (=> b!111596 (=> (not res!92137) (not e!73215))))

(assert (=> b!111596 (= res!92137 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!169404))))

(declare-fun b!111597 () Bool)

(declare-fun lt!169399 () (_ BitVec 64))

(assert (=> b!111597 (= e!73215 (bvsle lt!169404 (bvmul lt!169399 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!111597 (or (= lt!169399 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!169399 #b0000000000000000000000000000000000000000000000000000000000001000) lt!169399)))))

(assert (=> b!111597 (= lt!169399 ((_ sign_extend 32) (size!2311 (buf!2708 (_2!4865 lt!168024)))))))

(assert (= (and d!35442 res!92136) b!111596))

(assert (= (and b!111596 res!92137) b!111597))

(declare-fun m!166267 () Bool)

(assert (=> d!35442 m!166267))

(assert (=> d!35442 m!166243))

(assert (=> b!110940 d!35442))

(assert (=> b!110940 d!34858))

(declare-fun d!35444 () Bool)

(assert (=> d!35444 (= (remainingBits!0 ((_ sign_extend 32) (size!2311 (buf!2708 thiss!1305))) ((_ sign_extend 32) (currentByte!5265 thiss!1305)) ((_ sign_extend 32) (currentBit!5260 thiss!1305))) (bvsub (bvmul ((_ sign_extend 32) (size!2311 (buf!2708 thiss!1305))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5265 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5260 thiss!1305)))))))

(assert (=> d!34858 d!35444))

(declare-fun d!35446 () Bool)

(assert (=> d!35446 (= (invariant!0 (currentBit!5260 thiss!1305) (currentByte!5265 thiss!1305) (size!2311 (buf!2708 thiss!1305))) (and (bvsge (currentBit!5260 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5260 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5265 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5265 thiss!1305) (size!2311 (buf!2708 thiss!1305))) (and (= (currentBit!5260 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5265 thiss!1305) (size!2311 (buf!2708 thiss!1305)))))))))

(assert (=> d!34858 d!35446))

(declare-fun d!35448 () Bool)

(declare-fun e!73222 () Bool)

(assert (=> d!35448 e!73222))

(declare-fun res!92140 () Bool)

(assert (=> d!35448 (=> (not res!92140) (not e!73222))))

(declare-fun increaseBitIndex!0 (BitStream!4096) tuple2!9216)

(assert (=> d!35448 (= res!92140 (= (buf!2708 (_2!4865 (increaseBitIndex!0 (readerFrom!0 (_2!4865 lt!167626) (currentBit!5260 thiss!1305) (currentByte!5265 thiss!1305))))) (buf!2708 (readerFrom!0 (_2!4865 lt!167626) (currentBit!5260 thiss!1305) (currentByte!5265 thiss!1305)))))))

(declare-fun lt!169425 () Bool)

(assert (=> d!35448 (= lt!169425 (not (= (bvand ((_ sign_extend 24) (select (arr!2904 (buf!2708 (readerFrom!0 (_2!4865 lt!167626) (currentBit!5260 thiss!1305) (currentByte!5265 thiss!1305)))) (currentByte!5265 (readerFrom!0 (_2!4865 lt!167626) (currentBit!5260 thiss!1305) (currentByte!5265 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5260 (readerFrom!0 (_2!4865 lt!167626) (currentBit!5260 thiss!1305) (currentByte!5265 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!169420 () tuple2!9240)

(assert (=> d!35448 (= lt!169420 (tuple2!9241 (not (= (bvand ((_ sign_extend 24) (select (arr!2904 (buf!2708 (readerFrom!0 (_2!4865 lt!167626) (currentBit!5260 thiss!1305) (currentByte!5265 thiss!1305)))) (currentByte!5265 (readerFrom!0 (_2!4865 lt!167626) (currentBit!5260 thiss!1305) (currentByte!5265 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5260 (readerFrom!0 (_2!4865 lt!167626) (currentBit!5260 thiss!1305) (currentByte!5265 thiss!1305)))))) #b00000000000000000000000000000000)) (_2!4865 (increaseBitIndex!0 (readerFrom!0 (_2!4865 lt!167626) (currentBit!5260 thiss!1305) (currentByte!5265 thiss!1305))))))))

(assert (=> d!35448 (validate_offset_bit!0 ((_ sign_extend 32) (size!2311 (buf!2708 (readerFrom!0 (_2!4865 lt!167626) (currentBit!5260 thiss!1305) (currentByte!5265 thiss!1305))))) ((_ sign_extend 32) (currentByte!5265 (readerFrom!0 (_2!4865 lt!167626) (currentBit!5260 thiss!1305) (currentByte!5265 thiss!1305)))) ((_ sign_extend 32) (currentBit!5260 (readerFrom!0 (_2!4865 lt!167626) (currentBit!5260 thiss!1305) (currentByte!5265 thiss!1305)))))))

(assert (=> d!35448 (= (readBit!0 (readerFrom!0 (_2!4865 lt!167626) (currentBit!5260 thiss!1305) (currentByte!5265 thiss!1305))) lt!169420)))

(declare-fun b!111600 () Bool)

(declare-fun lt!169423 () (_ BitVec 64))

(declare-fun lt!169419 () (_ BitVec 64))

(assert (=> b!111600 (= e!73222 (= (bitIndex!0 (size!2311 (buf!2708 (_2!4865 (increaseBitIndex!0 (readerFrom!0 (_2!4865 lt!167626) (currentBit!5260 thiss!1305) (currentByte!5265 thiss!1305)))))) (currentByte!5265 (_2!4865 (increaseBitIndex!0 (readerFrom!0 (_2!4865 lt!167626) (currentBit!5260 thiss!1305) (currentByte!5265 thiss!1305))))) (currentBit!5260 (_2!4865 (increaseBitIndex!0 (readerFrom!0 (_2!4865 lt!167626) (currentBit!5260 thiss!1305) (currentByte!5265 thiss!1305)))))) (bvadd lt!169419 lt!169423)))))

(assert (=> b!111600 (or (not (= (bvand lt!169419 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!169423 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!169419 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!169419 lt!169423) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!111600 (= lt!169423 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!111600 (= lt!169419 (bitIndex!0 (size!2311 (buf!2708 (readerFrom!0 (_2!4865 lt!167626) (currentBit!5260 thiss!1305) (currentByte!5265 thiss!1305)))) (currentByte!5265 (readerFrom!0 (_2!4865 lt!167626) (currentBit!5260 thiss!1305) (currentByte!5265 thiss!1305))) (currentBit!5260 (readerFrom!0 (_2!4865 lt!167626) (currentBit!5260 thiss!1305) (currentByte!5265 thiss!1305)))))))

(declare-fun lt!169421 () Bool)

(assert (=> b!111600 (= lt!169421 (not (= (bvand ((_ sign_extend 24) (select (arr!2904 (buf!2708 (readerFrom!0 (_2!4865 lt!167626) (currentBit!5260 thiss!1305) (currentByte!5265 thiss!1305)))) (currentByte!5265 (readerFrom!0 (_2!4865 lt!167626) (currentBit!5260 thiss!1305) (currentByte!5265 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5260 (readerFrom!0 (_2!4865 lt!167626) (currentBit!5260 thiss!1305) (currentByte!5265 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!169424 () Bool)

(assert (=> b!111600 (= lt!169424 (not (= (bvand ((_ sign_extend 24) (select (arr!2904 (buf!2708 (readerFrom!0 (_2!4865 lt!167626) (currentBit!5260 thiss!1305) (currentByte!5265 thiss!1305)))) (currentByte!5265 (readerFrom!0 (_2!4865 lt!167626) (currentBit!5260 thiss!1305) (currentByte!5265 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5260 (readerFrom!0 (_2!4865 lt!167626) (currentBit!5260 thiss!1305) (currentByte!5265 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!169422 () Bool)

(assert (=> b!111600 (= lt!169422 (not (= (bvand ((_ sign_extend 24) (select (arr!2904 (buf!2708 (readerFrom!0 (_2!4865 lt!167626) (currentBit!5260 thiss!1305) (currentByte!5265 thiss!1305)))) (currentByte!5265 (readerFrom!0 (_2!4865 lt!167626) (currentBit!5260 thiss!1305) (currentByte!5265 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5260 (readerFrom!0 (_2!4865 lt!167626) (currentBit!5260 thiss!1305) (currentByte!5265 thiss!1305)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!35448 res!92140) b!111600))

(assert (=> d!35448 m!164355))

(declare-fun m!166269 () Bool)

(assert (=> d!35448 m!166269))

(declare-fun m!166271 () Bool)

(assert (=> d!35448 m!166271))

(declare-fun m!166273 () Bool)

(assert (=> d!35448 m!166273))

(declare-fun m!166275 () Bool)

(assert (=> d!35448 m!166275))

(assert (=> b!111600 m!164355))

(assert (=> b!111600 m!166269))

(assert (=> b!111600 m!166273))

(declare-fun m!166277 () Bool)

(assert (=> b!111600 m!166277))

(declare-fun m!166279 () Bool)

(assert (=> b!111600 m!166279))

(assert (=> b!111600 m!166271))

(assert (=> d!34850 d!35448))

(declare-fun d!35450 () Bool)

(declare-fun res!92142 () Bool)

(declare-fun e!73224 () Bool)

(assert (=> d!35450 (=> (not res!92142) (not e!73224))))

(assert (=> d!35450 (= res!92142 (= (size!2311 (buf!2708 (_2!4865 lt!167626))) (size!2311 (buf!2708 (_2!4865 lt!167626)))))))

(assert (=> d!35450 (= (isPrefixOf!0 (_2!4865 lt!167626) (_2!4865 lt!167626)) e!73224)))

(declare-fun b!111601 () Bool)

(declare-fun res!92141 () Bool)

(assert (=> b!111601 (=> (not res!92141) (not e!73224))))

(assert (=> b!111601 (= res!92141 (bvsle (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!167626))) (currentByte!5265 (_2!4865 lt!167626)) (currentBit!5260 (_2!4865 lt!167626))) (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!167626))) (currentByte!5265 (_2!4865 lt!167626)) (currentBit!5260 (_2!4865 lt!167626)))))))

(declare-fun b!111602 () Bool)

(declare-fun e!73223 () Bool)

(assert (=> b!111602 (= e!73224 e!73223)))

(declare-fun res!92143 () Bool)

(assert (=> b!111602 (=> res!92143 e!73223)))

(assert (=> b!111602 (= res!92143 (= (size!2311 (buf!2708 (_2!4865 lt!167626))) #b00000000000000000000000000000000))))

(declare-fun b!111603 () Bool)

(assert (=> b!111603 (= e!73223 (arrayBitRangesEq!0 (buf!2708 (_2!4865 lt!167626)) (buf!2708 (_2!4865 lt!167626)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!167626))) (currentByte!5265 (_2!4865 lt!167626)) (currentBit!5260 (_2!4865 lt!167626)))))))

(assert (= (and d!35450 res!92142) b!111601))

(assert (= (and b!111601 res!92141) b!111602))

(assert (= (and b!111602 (not res!92143)) b!111603))

(assert (=> b!111601 m!164349))

(assert (=> b!111601 m!164349))

(assert (=> b!111603 m!164349))

(assert (=> b!111603 m!164349))

(declare-fun m!166281 () Bool)

(assert (=> b!111603 m!166281))

(assert (=> d!34950 d!35450))

(declare-fun d!35452 () Bool)

(declare-fun res!92145 () Bool)

(declare-fun e!73226 () Bool)

(assert (=> d!35452 (=> (not res!92145) (not e!73226))))

(assert (=> d!35452 (= res!92145 (= (size!2311 (buf!2708 (_2!4865 lt!167643))) (size!2311 (buf!2708 (_2!4865 lt!167643)))))))

(assert (=> d!35452 (= (isPrefixOf!0 (_2!4865 lt!167643) (_2!4865 lt!167643)) e!73226)))

(declare-fun b!111604 () Bool)

(declare-fun res!92144 () Bool)

(assert (=> b!111604 (=> (not res!92144) (not e!73226))))

(assert (=> b!111604 (= res!92144 (bvsle (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!167643))) (currentByte!5265 (_2!4865 lt!167643)) (currentBit!5260 (_2!4865 lt!167643))) (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!167643))) (currentByte!5265 (_2!4865 lt!167643)) (currentBit!5260 (_2!4865 lt!167643)))))))

(declare-fun b!111605 () Bool)

(declare-fun e!73225 () Bool)

(assert (=> b!111605 (= e!73226 e!73225)))

(declare-fun res!92146 () Bool)

(assert (=> b!111605 (=> res!92146 e!73225)))

(assert (=> b!111605 (= res!92146 (= (size!2311 (buf!2708 (_2!4865 lt!167643))) #b00000000000000000000000000000000))))

(declare-fun b!111606 () Bool)

(assert (=> b!111606 (= e!73225 (arrayBitRangesEq!0 (buf!2708 (_2!4865 lt!167643)) (buf!2708 (_2!4865 lt!167643)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!167643))) (currentByte!5265 (_2!4865 lt!167643)) (currentBit!5260 (_2!4865 lt!167643)))))))

(assert (= (and d!35452 res!92145) b!111604))

(assert (= (and b!111604 res!92144) b!111605))

(assert (= (and b!111605 (not res!92146)) b!111606))

(assert (=> b!111604 m!164693))

(assert (=> b!111604 m!164693))

(assert (=> b!111606 m!164693))

(assert (=> b!111606 m!164693))

(declare-fun m!166283 () Bool)

(assert (=> b!111606 m!166283))

(assert (=> d!34950 d!35452))

(declare-fun d!35454 () Bool)

(declare-fun res!92148 () Bool)

(declare-fun e!73228 () Bool)

(assert (=> d!35454 (=> (not res!92148) (not e!73228))))

(assert (=> d!35454 (= res!92148 (= (size!2311 (buf!2708 (_1!4867 lt!168380))) (size!2311 (buf!2708 (_2!4867 lt!168380)))))))

(assert (=> d!35454 (= (isPrefixOf!0 (_1!4867 lt!168380) (_2!4867 lt!168380)) e!73228)))

(declare-fun b!111607 () Bool)

(declare-fun res!92147 () Bool)

(assert (=> b!111607 (=> (not res!92147) (not e!73228))))

(assert (=> b!111607 (= res!92147 (bvsle (bitIndex!0 (size!2311 (buf!2708 (_1!4867 lt!168380))) (currentByte!5265 (_1!4867 lt!168380)) (currentBit!5260 (_1!4867 lt!168380))) (bitIndex!0 (size!2311 (buf!2708 (_2!4867 lt!168380))) (currentByte!5265 (_2!4867 lt!168380)) (currentBit!5260 (_2!4867 lt!168380)))))))

(declare-fun b!111608 () Bool)

(declare-fun e!73227 () Bool)

(assert (=> b!111608 (= e!73228 e!73227)))

(declare-fun res!92149 () Bool)

(assert (=> b!111608 (=> res!92149 e!73227)))

(assert (=> b!111608 (= res!92149 (= (size!2311 (buf!2708 (_1!4867 lt!168380))) #b00000000000000000000000000000000))))

(declare-fun b!111609 () Bool)

(assert (=> b!111609 (= e!73227 (arrayBitRangesEq!0 (buf!2708 (_1!4867 lt!168380)) (buf!2708 (_2!4867 lt!168380)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2311 (buf!2708 (_1!4867 lt!168380))) (currentByte!5265 (_1!4867 lt!168380)) (currentBit!5260 (_1!4867 lt!168380)))))))

(assert (= (and d!35454 res!92148) b!111607))

(assert (= (and b!111607 res!92147) b!111608))

(assert (= (and b!111608 (not res!92149)) b!111609))

(assert (=> b!111607 m!166263))

(declare-fun m!166285 () Bool)

(assert (=> b!111607 m!166285))

(assert (=> b!111609 m!166263))

(assert (=> b!111609 m!166263))

(declare-fun m!166287 () Bool)

(assert (=> b!111609 m!166287))

(assert (=> d!34950 d!35454))

(declare-fun d!35456 () Bool)

(assert (=> d!35456 (isPrefixOf!0 lt!168368 (_2!4865 lt!167643))))

(declare-fun lt!169426 () Unit!6790)

(assert (=> d!35456 (= lt!169426 (choose!30 lt!168368 (_2!4865 lt!167643) (_2!4865 lt!167643)))))

(assert (=> d!35456 (isPrefixOf!0 lt!168368 (_2!4865 lt!167643))))

(assert (=> d!35456 (= (lemmaIsPrefixTransitive!0 lt!168368 (_2!4865 lt!167643) (_2!4865 lt!167643)) lt!169426)))

(declare-fun bs!8655 () Bool)

(assert (= bs!8655 d!35456))

(assert (=> bs!8655 m!164929))

(declare-fun m!166289 () Bool)

(assert (=> bs!8655 m!166289))

(assert (=> bs!8655 m!164929))

(assert (=> d!34950 d!35456))

(declare-fun d!35458 () Bool)

(assert (=> d!35458 (isPrefixOf!0 (_2!4865 lt!167643) (_2!4865 lt!167643))))

(declare-fun lt!169429 () Unit!6790)

(declare-fun choose!11 (BitStream!4096) Unit!6790)

(assert (=> d!35458 (= lt!169429 (choose!11 (_2!4865 lt!167643)))))

(assert (=> d!35458 (= (lemmaIsPrefixRefl!0 (_2!4865 lt!167643)) lt!169429)))

(declare-fun bs!8657 () Bool)

(assert (= bs!8657 d!35458))

(assert (=> bs!8657 m!164679))

(declare-fun m!166291 () Bool)

(assert (=> bs!8657 m!166291))

(assert (=> d!34950 d!35458))

(declare-fun d!35460 () Bool)

(assert (=> d!35460 (isPrefixOf!0 (_2!4865 lt!167626) (_2!4865 lt!167626))))

(declare-fun lt!169430 () Unit!6790)

(assert (=> d!35460 (= lt!169430 (choose!11 (_2!4865 lt!167626)))))

(assert (=> d!35460 (= (lemmaIsPrefixRefl!0 (_2!4865 lt!167626)) lt!169430)))

(declare-fun bs!8658 () Bool)

(assert (= bs!8658 d!35460))

(assert (=> bs!8658 m!164937))

(declare-fun m!166293 () Bool)

(assert (=> bs!8658 m!166293))

(assert (=> d!34950 d!35460))

(declare-fun d!35462 () Bool)

(declare-fun res!92151 () Bool)

(declare-fun e!73230 () Bool)

(assert (=> d!35462 (=> (not res!92151) (not e!73230))))

(assert (=> d!35462 (= res!92151 (= (size!2311 (buf!2708 (_2!4865 lt!167626))) (size!2311 (buf!2708 (_2!4865 lt!167643)))))))

(assert (=> d!35462 (= (isPrefixOf!0 (_2!4865 lt!167626) (_2!4865 lt!167643)) e!73230)))

(declare-fun b!111610 () Bool)

(declare-fun res!92150 () Bool)

(assert (=> b!111610 (=> (not res!92150) (not e!73230))))

(assert (=> b!111610 (= res!92150 (bvsle (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!167626))) (currentByte!5265 (_2!4865 lt!167626)) (currentBit!5260 (_2!4865 lt!167626))) (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!167643))) (currentByte!5265 (_2!4865 lt!167643)) (currentBit!5260 (_2!4865 lt!167643)))))))

(declare-fun b!111611 () Bool)

(declare-fun e!73229 () Bool)

(assert (=> b!111611 (= e!73230 e!73229)))

(declare-fun res!92152 () Bool)

(assert (=> b!111611 (=> res!92152 e!73229)))

(assert (=> b!111611 (= res!92152 (= (size!2311 (buf!2708 (_2!4865 lt!167626))) #b00000000000000000000000000000000))))

(declare-fun b!111612 () Bool)

(assert (=> b!111612 (= e!73229 (arrayBitRangesEq!0 (buf!2708 (_2!4865 lt!167626)) (buf!2708 (_2!4865 lt!167643)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!167626))) (currentByte!5265 (_2!4865 lt!167626)) (currentBit!5260 (_2!4865 lt!167626)))))))

(assert (= (and d!35462 res!92151) b!111610))

(assert (= (and b!111610 res!92150) b!111611))

(assert (= (and b!111611 (not res!92152)) b!111612))

(assert (=> b!111610 m!164349))

(assert (=> b!111610 m!164693))

(assert (=> b!111612 m!164349))

(assert (=> b!111612 m!164349))

(declare-fun m!166295 () Bool)

(assert (=> b!111612 m!166295))

(assert (=> d!34950 d!35462))

(declare-fun d!35464 () Bool)

(declare-fun res!92154 () Bool)

(declare-fun e!73232 () Bool)

(assert (=> d!35464 (=> (not res!92154) (not e!73232))))

(assert (=> d!35464 (= res!92154 (= (size!2311 (buf!2708 lt!168368)) (size!2311 (buf!2708 lt!168368))))))

(assert (=> d!35464 (= (isPrefixOf!0 lt!168368 lt!168368) e!73232)))

(declare-fun b!111613 () Bool)

(declare-fun res!92153 () Bool)

(assert (=> b!111613 (=> (not res!92153) (not e!73232))))

(assert (=> b!111613 (= res!92153 (bvsle (bitIndex!0 (size!2311 (buf!2708 lt!168368)) (currentByte!5265 lt!168368) (currentBit!5260 lt!168368)) (bitIndex!0 (size!2311 (buf!2708 lt!168368)) (currentByte!5265 lt!168368) (currentBit!5260 lt!168368))))))

(declare-fun b!111614 () Bool)

(declare-fun e!73231 () Bool)

(assert (=> b!111614 (= e!73232 e!73231)))

(declare-fun res!92155 () Bool)

(assert (=> b!111614 (=> res!92155 e!73231)))

(assert (=> b!111614 (= res!92155 (= (size!2311 (buf!2708 lt!168368)) #b00000000000000000000000000000000))))

(declare-fun b!111615 () Bool)

(assert (=> b!111615 (= e!73231 (arrayBitRangesEq!0 (buf!2708 lt!168368) (buf!2708 lt!168368) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2311 (buf!2708 lt!168368)) (currentByte!5265 lt!168368) (currentBit!5260 lt!168368))))))

(assert (= (and d!35464 res!92154) b!111613))

(assert (= (and b!111613 res!92153) b!111614))

(assert (= (and b!111614 (not res!92155)) b!111615))

(declare-fun m!166297 () Bool)

(assert (=> b!111613 m!166297))

(assert (=> b!111613 m!166297))

(assert (=> b!111615 m!166297))

(assert (=> b!111615 m!166297))

(declare-fun m!166299 () Bool)

(assert (=> b!111615 m!166299))

(assert (=> d!34950 d!35464))

(declare-fun d!35466 () Bool)

(declare-fun res!92157 () Bool)

(declare-fun e!73234 () Bool)

(assert (=> d!35466 (=> (not res!92157) (not e!73234))))

(assert (=> d!35466 (= res!92157 (= (size!2311 (buf!2708 lt!168368)) (size!2311 (buf!2708 (_2!4865 lt!167643)))))))

(assert (=> d!35466 (= (isPrefixOf!0 lt!168368 (_2!4865 lt!167643)) e!73234)))

(declare-fun b!111616 () Bool)

(declare-fun res!92156 () Bool)

(assert (=> b!111616 (=> (not res!92156) (not e!73234))))

(assert (=> b!111616 (= res!92156 (bvsle (bitIndex!0 (size!2311 (buf!2708 lt!168368)) (currentByte!5265 lt!168368) (currentBit!5260 lt!168368)) (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!167643))) (currentByte!5265 (_2!4865 lt!167643)) (currentBit!5260 (_2!4865 lt!167643)))))))

(declare-fun b!111617 () Bool)

(declare-fun e!73233 () Bool)

(assert (=> b!111617 (= e!73234 e!73233)))

(declare-fun res!92158 () Bool)

(assert (=> b!111617 (=> res!92158 e!73233)))

(assert (=> b!111617 (= res!92158 (= (size!2311 (buf!2708 lt!168368)) #b00000000000000000000000000000000))))

(declare-fun b!111618 () Bool)

(assert (=> b!111618 (= e!73233 (arrayBitRangesEq!0 (buf!2708 lt!168368) (buf!2708 (_2!4865 lt!167643)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2311 (buf!2708 lt!168368)) (currentByte!5265 lt!168368) (currentBit!5260 lt!168368))))))

(assert (= (and d!35466 res!92157) b!111616))

(assert (= (and b!111616 res!92156) b!111617))

(assert (= (and b!111617 (not res!92158)) b!111618))

(assert (=> b!111616 m!166297))

(assert (=> b!111616 m!164693))

(assert (=> b!111618 m!166297))

(assert (=> b!111618 m!166297))

(declare-fun m!166301 () Bool)

(assert (=> b!111618 m!166301))

(assert (=> d!34950 d!35466))

(declare-fun d!35468 () Bool)

(assert (=> d!35468 (isPrefixOf!0 lt!168368 lt!168368)))

(declare-fun lt!169431 () Unit!6790)

(assert (=> d!35468 (= lt!169431 (choose!11 lt!168368))))

(assert (=> d!35468 (= (lemmaIsPrefixRefl!0 lt!168368) lt!169431)))

(declare-fun bs!8659 () Bool)

(assert (= bs!8659 d!35468))

(assert (=> bs!8659 m!164921))

(declare-fun m!166303 () Bool)

(assert (=> bs!8659 m!166303))

(assert (=> d!34950 d!35468))

(declare-fun d!35470 () Bool)

(assert (=> d!35470 (isPrefixOf!0 lt!168368 (_2!4865 lt!167643))))

(declare-fun lt!169432 () Unit!6790)

(assert (=> d!35470 (= lt!169432 (choose!30 lt!168368 (_2!4865 lt!167626) (_2!4865 lt!167643)))))

(assert (=> d!35470 (isPrefixOf!0 lt!168368 (_2!4865 lt!167626))))

(assert (=> d!35470 (= (lemmaIsPrefixTransitive!0 lt!168368 (_2!4865 lt!167626) (_2!4865 lt!167643)) lt!169432)))

(declare-fun bs!8660 () Bool)

(assert (= bs!8660 d!35470))

(assert (=> bs!8660 m!164929))

(declare-fun m!166305 () Bool)

(assert (=> bs!8660 m!166305))

(declare-fun m!166307 () Bool)

(assert (=> bs!8660 m!166307))

(assert (=> d!34950 d!35470))

(declare-fun lt!169433 () tuple2!9244)

(declare-fun d!35472 () Bool)

(assert (=> d!35472 (= lt!169433 (readNLeastSignificantBitsLoop!0 (_1!4867 lt!168352) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!168311))))

(assert (=> d!35472 (= (readNLeastSignificantBitsLoopPure!0 (_1!4867 lt!168352) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!168311) (tuple2!9223 (_2!4879 lt!169433) (_1!4879 lt!169433)))))

(declare-fun bs!8661 () Bool)

(assert (= bs!8661 d!35472))

(declare-fun m!166309 () Bool)

(assert (=> bs!8661 m!166309))

(assert (=> b!111047 d!35472))

(declare-fun d!35474 () Bool)

(assert (=> d!35474 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2311 (buf!2708 (_2!4865 lt!168338)))) ((_ sign_extend 32) (currentByte!5265 (_2!4865 lt!167626))) ((_ sign_extend 32) (currentBit!5260 (_2!4865 lt!167626))) lt!168333) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2311 (buf!2708 (_2!4865 lt!168338)))) ((_ sign_extend 32) (currentByte!5265 (_2!4865 lt!167626))) ((_ sign_extend 32) (currentBit!5260 (_2!4865 lt!167626)))) lt!168333))))

(declare-fun bs!8662 () Bool)

(assert (= bs!8662 d!35474))

(declare-fun m!166311 () Bool)

(assert (=> bs!8662 m!166311))

(assert (=> b!111047 d!35474))

(declare-fun d!35476 () Bool)

(assert (=> d!35476 (validate_offset_bits!1 ((_ sign_extend 32) (size!2311 (buf!2708 (_2!4865 lt!168338)))) ((_ sign_extend 32) (currentByte!5265 (_2!4865 lt!167626))) ((_ sign_extend 32) (currentBit!5260 (_2!4865 lt!167626))) lt!168333)))

(declare-fun lt!169434 () Unit!6790)

(assert (=> d!35476 (= lt!169434 (choose!9 (_2!4865 lt!167626) (buf!2708 (_2!4865 lt!168338)) lt!168333 (BitStream!4097 (buf!2708 (_2!4865 lt!168338)) (currentByte!5265 (_2!4865 lt!167626)) (currentBit!5260 (_2!4865 lt!167626)))))))

(assert (=> d!35476 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4865 lt!167626) (buf!2708 (_2!4865 lt!168338)) lt!168333) lt!169434)))

(declare-fun bs!8663 () Bool)

(assert (= bs!8663 d!35476))

(assert (=> bs!8663 m!164903))

(declare-fun m!166313 () Bool)

(assert (=> bs!8663 m!166313))

(assert (=> b!111047 d!35476))

(declare-fun d!35478 () Bool)

(assert (=> d!35478 (= (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!111047 d!35478))

(declare-fun b!111619 () Bool)

(declare-fun res!92161 () Bool)

(declare-fun e!73235 () Bool)

(assert (=> b!111619 (=> (not res!92161) (not e!73235))))

(declare-fun lt!169453 () tuple2!9220)

(assert (=> b!111619 (= res!92161 (isPrefixOf!0 (_1!4867 lt!169453) (_2!4865 lt!167626)))))

(declare-fun b!111620 () Bool)

(declare-fun e!73236 () Unit!6790)

(declare-fun Unit!6838 () Unit!6790)

(assert (=> b!111620 (= e!73236 Unit!6838)))

(declare-fun b!111621 () Bool)

(declare-fun lt!169443 () Unit!6790)

(assert (=> b!111621 (= e!73236 lt!169443)))

(declare-fun lt!169445 () (_ BitVec 64))

(assert (=> b!111621 (= lt!169445 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!169444 () (_ BitVec 64))

(assert (=> b!111621 (= lt!169444 (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!167626))) (currentByte!5265 (_2!4865 lt!167626)) (currentBit!5260 (_2!4865 lt!167626))))))

(assert (=> b!111621 (= lt!169443 (arrayBitRangesEqSymmetric!0 (buf!2708 (_2!4865 lt!167626)) (buf!2708 (_2!4865 lt!168338)) lt!169445 lt!169444))))

(assert (=> b!111621 (arrayBitRangesEq!0 (buf!2708 (_2!4865 lt!168338)) (buf!2708 (_2!4865 lt!167626)) lt!169445 lt!169444)))

(declare-fun b!111622 () Bool)

(declare-fun res!92160 () Bool)

(assert (=> b!111622 (=> (not res!92160) (not e!73235))))

(assert (=> b!111622 (= res!92160 (isPrefixOf!0 (_2!4867 lt!169453) (_2!4865 lt!168338)))))

(declare-fun d!35480 () Bool)

(assert (=> d!35480 e!73235))

(declare-fun res!92159 () Bool)

(assert (=> d!35480 (=> (not res!92159) (not e!73235))))

(assert (=> d!35480 (= res!92159 (isPrefixOf!0 (_1!4867 lt!169453) (_2!4867 lt!169453)))))

(declare-fun lt!169441 () BitStream!4096)

(assert (=> d!35480 (= lt!169453 (tuple2!9221 lt!169441 (_2!4865 lt!168338)))))

(declare-fun lt!169450 () Unit!6790)

(declare-fun lt!169446 () Unit!6790)

(assert (=> d!35480 (= lt!169450 lt!169446)))

(assert (=> d!35480 (isPrefixOf!0 lt!169441 (_2!4865 lt!168338))))

(assert (=> d!35480 (= lt!169446 (lemmaIsPrefixTransitive!0 lt!169441 (_2!4865 lt!168338) (_2!4865 lt!168338)))))

(declare-fun lt!169437 () Unit!6790)

(declare-fun lt!169442 () Unit!6790)

(assert (=> d!35480 (= lt!169437 lt!169442)))

(assert (=> d!35480 (isPrefixOf!0 lt!169441 (_2!4865 lt!168338))))

(assert (=> d!35480 (= lt!169442 (lemmaIsPrefixTransitive!0 lt!169441 (_2!4865 lt!167626) (_2!4865 lt!168338)))))

(declare-fun lt!169449 () Unit!6790)

(assert (=> d!35480 (= lt!169449 e!73236)))

(declare-fun c!6789 () Bool)

(assert (=> d!35480 (= c!6789 (not (= (size!2311 (buf!2708 (_2!4865 lt!167626))) #b00000000000000000000000000000000)))))

(declare-fun lt!169451 () Unit!6790)

(declare-fun lt!169448 () Unit!6790)

(assert (=> d!35480 (= lt!169451 lt!169448)))

(assert (=> d!35480 (isPrefixOf!0 (_2!4865 lt!168338) (_2!4865 lt!168338))))

(assert (=> d!35480 (= lt!169448 (lemmaIsPrefixRefl!0 (_2!4865 lt!168338)))))

(declare-fun lt!169454 () Unit!6790)

(declare-fun lt!169436 () Unit!6790)

(assert (=> d!35480 (= lt!169454 lt!169436)))

(assert (=> d!35480 (= lt!169436 (lemmaIsPrefixRefl!0 (_2!4865 lt!168338)))))

(declare-fun lt!169447 () Unit!6790)

(declare-fun lt!169452 () Unit!6790)

(assert (=> d!35480 (= lt!169447 lt!169452)))

(assert (=> d!35480 (isPrefixOf!0 lt!169441 lt!169441)))

(assert (=> d!35480 (= lt!169452 (lemmaIsPrefixRefl!0 lt!169441))))

(declare-fun lt!169438 () Unit!6790)

(declare-fun lt!169435 () Unit!6790)

(assert (=> d!35480 (= lt!169438 lt!169435)))

(assert (=> d!35480 (isPrefixOf!0 (_2!4865 lt!167626) (_2!4865 lt!167626))))

(assert (=> d!35480 (= lt!169435 (lemmaIsPrefixRefl!0 (_2!4865 lt!167626)))))

(assert (=> d!35480 (= lt!169441 (BitStream!4097 (buf!2708 (_2!4865 lt!168338)) (currentByte!5265 (_2!4865 lt!167626)) (currentBit!5260 (_2!4865 lt!167626))))))

(assert (=> d!35480 (isPrefixOf!0 (_2!4865 lt!167626) (_2!4865 lt!168338))))

(assert (=> d!35480 (= (reader!0 (_2!4865 lt!167626) (_2!4865 lt!168338)) lt!169453)))

(declare-fun lt!169440 () (_ BitVec 64))

(declare-fun lt!169439 () (_ BitVec 64))

(declare-fun b!111623 () Bool)

(assert (=> b!111623 (= e!73235 (= (_1!4867 lt!169453) (withMovedBitIndex!0 (_2!4867 lt!169453) (bvsub lt!169440 lt!169439))))))

(assert (=> b!111623 (or (= (bvand lt!169440 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!169439 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!169440 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!169440 lt!169439) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!111623 (= lt!169439 (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!168338))) (currentByte!5265 (_2!4865 lt!168338)) (currentBit!5260 (_2!4865 lt!168338))))))

(assert (=> b!111623 (= lt!169440 (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!167626))) (currentByte!5265 (_2!4865 lt!167626)) (currentBit!5260 (_2!4865 lt!167626))))))

(assert (= (and d!35480 c!6789) b!111621))

(assert (= (and d!35480 (not c!6789)) b!111620))

(assert (= (and d!35480 res!92159) b!111619))

(assert (= (and b!111619 res!92161) b!111622))

(assert (= (and b!111622 res!92160) b!111623))

(declare-fun m!166315 () Bool)

(assert (=> b!111622 m!166315))

(declare-fun m!166317 () Bool)

(assert (=> d!35480 m!166317))

(declare-fun m!166319 () Bool)

(assert (=> d!35480 m!166319))

(assert (=> d!35480 m!164925))

(declare-fun m!166321 () Bool)

(assert (=> d!35480 m!166321))

(declare-fun m!166323 () Bool)

(assert (=> d!35480 m!166323))

(declare-fun m!166325 () Bool)

(assert (=> d!35480 m!166325))

(declare-fun m!166327 () Bool)

(assert (=> d!35480 m!166327))

(declare-fun m!166329 () Bool)

(assert (=> d!35480 m!166329))

(declare-fun m!166331 () Bool)

(assert (=> d!35480 m!166331))

(assert (=> d!35480 m!164899))

(assert (=> d!35480 m!164937))

(declare-fun m!166333 () Bool)

(assert (=> b!111619 m!166333))

(declare-fun m!166335 () Bool)

(assert (=> b!111623 m!166335))

(assert (=> b!111623 m!164893))

(assert (=> b!111623 m!164349))

(assert (=> b!111621 m!164349))

(declare-fun m!166337 () Bool)

(assert (=> b!111621 m!166337))

(declare-fun m!166339 () Bool)

(assert (=> b!111621 m!166339))

(assert (=> b!111047 d!35480))

(declare-fun d!35482 () Bool)

(declare-fun res!92163 () Bool)

(declare-fun e!73238 () Bool)

(assert (=> d!35482 (=> (not res!92163) (not e!73238))))

(assert (=> d!35482 (= res!92163 (= (size!2311 (buf!2708 (_2!4865 lt!167626))) (size!2311 (buf!2708 (_2!4865 lt!168315)))))))

(assert (=> d!35482 (= (isPrefixOf!0 (_2!4865 lt!167626) (_2!4865 lt!168315)) e!73238)))

(declare-fun b!111624 () Bool)

(declare-fun res!92162 () Bool)

(assert (=> b!111624 (=> (not res!92162) (not e!73238))))

(assert (=> b!111624 (= res!92162 (bvsle (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!167626))) (currentByte!5265 (_2!4865 lt!167626)) (currentBit!5260 (_2!4865 lt!167626))) (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!168315))) (currentByte!5265 (_2!4865 lt!168315)) (currentBit!5260 (_2!4865 lt!168315)))))))

(declare-fun b!111625 () Bool)

(declare-fun e!73237 () Bool)

(assert (=> b!111625 (= e!73238 e!73237)))

(declare-fun res!92164 () Bool)

(assert (=> b!111625 (=> res!92164 e!73237)))

(assert (=> b!111625 (= res!92164 (= (size!2311 (buf!2708 (_2!4865 lt!167626))) #b00000000000000000000000000000000))))

(declare-fun b!111626 () Bool)

(assert (=> b!111626 (= e!73237 (arrayBitRangesEq!0 (buf!2708 (_2!4865 lt!167626)) (buf!2708 (_2!4865 lt!168315)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!167626))) (currentByte!5265 (_2!4865 lt!167626)) (currentBit!5260 (_2!4865 lt!167626)))))))

(assert (= (and d!35482 res!92163) b!111624))

(assert (= (and b!111624 res!92162) b!111625))

(assert (= (and b!111625 (not res!92164)) b!111626))

(assert (=> b!111624 m!164349))

(assert (=> b!111624 m!164897))

(assert (=> b!111626 m!164349))

(assert (=> b!111626 m!164349))

(declare-fun m!166341 () Bool)

(assert (=> b!111626 m!166341))

(assert (=> b!111045 d!35482))

(declare-fun d!35484 () Bool)

(assert (=> d!35484 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2311 (buf!2708 (_2!4865 lt!167626)))) ((_ sign_extend 32) (currentByte!5265 (_2!4865 lt!167626))) ((_ sign_extend 32) (currentBit!5260 (_2!4865 lt!167626))) lt!168333) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2311 (buf!2708 (_2!4865 lt!167626)))) ((_ sign_extend 32) (currentByte!5265 (_2!4865 lt!167626))) ((_ sign_extend 32) (currentBit!5260 (_2!4865 lt!167626)))) lt!168333))))

(declare-fun bs!8664 () Bool)

(assert (= bs!8664 d!35484))

(assert (=> bs!8664 m!164563))

(assert (=> b!111039 d!35484))

(declare-fun b!111641 () Bool)

(declare-fun res!92176 () Bool)

(declare-fun e!73246 () Bool)

(assert (=> b!111641 (=> (not res!92176) (not e!73246))))

(declare-fun lt!169476 () tuple2!9244)

(declare-fun lt!169479 () (_ BitVec 64))

(declare-fun lt!169475 () (_ BitVec 64))

(assert (=> b!111641 (= res!92176 (= (bvlshr (_1!4879 lt!169476) lt!169479) (bvlshr lt!167644 lt!169475)))))

(assert (=> b!111641 (and (bvsge lt!169475 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!169475 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!111641 (= lt!169475 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (=> b!111641 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000)))))

(assert (=> b!111641 (and (bvsge lt!169479 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!169479 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!111641 (= lt!169479 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (=> b!111641 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000)))))

(declare-fun b!111642 () Bool)

(declare-fun e!73245 () Bool)

(assert (=> b!111642 (= e!73246 e!73245)))

(declare-fun res!92178 () Bool)

(assert (=> b!111642 (=> res!92178 e!73245)))

(assert (=> b!111642 (= res!92178 (bvsge i!615 nBits!396))))

(declare-fun b!111643 () Bool)

(declare-fun e!73247 () tuple2!9244)

(assert (=> b!111643 (= e!73247 (tuple2!9245 lt!167644 (_1!4867 lt!167630)))))

(declare-fun d!35486 () Bool)

(assert (=> d!35486 e!73246))

(declare-fun res!92179 () Bool)

(assert (=> d!35486 (=> (not res!92179) (not e!73246))))

(assert (=> d!35486 (= res!92179 (= (buf!2708 (_2!4879 lt!169476)) (buf!2708 (_1!4867 lt!167630))))))

(assert (=> d!35486 (= lt!169476 e!73247)))

(declare-fun c!6792 () Bool)

(assert (=> d!35486 (= c!6792 (= nBits!396 i!615))))

(assert (=> d!35486 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!35486 (= (readNLeastSignificantBitsLoop!0 (_1!4867 lt!167630) nBits!396 i!615 lt!167644) lt!169476)))

(declare-fun b!111644 () Bool)

(declare-fun res!92175 () Bool)

(assert (=> b!111644 (=> (not res!92175) (not e!73246))))

(assert (=> b!111644 (= res!92175 (= (bvand (_1!4879 lt!169476) (onesLSBLong!0 nBits!396)) (_1!4879 lt!169476)))))

(declare-fun b!111645 () Bool)

(declare-fun lt!169480 () tuple2!9244)

(assert (=> b!111645 (= e!73247 (tuple2!9245 (_1!4879 lt!169480) (_2!4879 lt!169480)))))

(declare-fun lt!169481 () tuple2!9240)

(assert (=> b!111645 (= lt!169481 (readBit!0 (_1!4867 lt!167630)))))

(assert (=> b!111645 (= lt!169480 (readNLeastSignificantBitsLoop!0 (_2!4877 lt!169481) nBits!396 (bvadd i!615 #b00000000000000000000000000000001) (bvor lt!167644 (ite (_1!4877 lt!169481) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!111646 () Bool)

(declare-fun res!92177 () Bool)

(assert (=> b!111646 (=> (not res!92177) (not e!73246))))

(declare-fun lt!169473 () (_ BitVec 64))

(declare-fun lt!169477 () (_ BitVec 64))

(assert (=> b!111646 (= res!92177 (= (bitIndex!0 (size!2311 (buf!2708 (_2!4879 lt!169476))) (currentByte!5265 (_2!4879 lt!169476)) (currentBit!5260 (_2!4879 lt!169476))) (bvadd lt!169477 lt!169473)))))

(assert (=> b!111646 (or (not (= (bvand lt!169477 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!169473 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!169477 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!169477 lt!169473) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!111646 (= lt!169473 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (=> b!111646 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000)))))

(assert (=> b!111646 (= lt!169477 (bitIndex!0 (size!2311 (buf!2708 (_1!4867 lt!167630))) (currentByte!5265 (_1!4867 lt!167630)) (currentBit!5260 (_1!4867 lt!167630))))))

(declare-fun lt!169474 () (_ BitVec 64))

(declare-fun b!111647 () Bool)

(assert (=> b!111647 (= e!73245 (= (= (bvand (bvlshr (_1!4879 lt!169476) lt!169474) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!4866 (readBitPure!0 (_1!4867 lt!167630)))))))

(assert (=> b!111647 (and (bvsge lt!169474 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!169474 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!169478 () (_ BitVec 32))

(assert (=> b!111647 (= lt!169474 ((_ sign_extend 32) (bvsub lt!169478 i!615)))))

(assert (=> b!111647 (or (= (bvand lt!169478 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand lt!169478 #b10000000000000000000000000000000) (bvand (bvsub lt!169478 i!615) #b10000000000000000000000000000000)))))

(assert (=> b!111647 (= lt!169478 (bvsub nBits!396 #b00000000000000000000000000000001))))

(assert (=> b!111647 (or (= (bvand nBits!396 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(assert (= (and d!35486 c!6792) b!111643))

(assert (= (and d!35486 (not c!6792)) b!111645))

(assert (= (and d!35486 res!92179) b!111646))

(assert (= (and b!111646 res!92177) b!111641))

(assert (= (and b!111641 res!92176) b!111644))

(assert (= (and b!111644 res!92175) b!111642))

(assert (= (and b!111642 (not res!92178)) b!111647))

(assert (=> b!111644 m!164343))

(assert (=> b!111645 m!164617))

(declare-fun m!166343 () Bool)

(assert (=> b!111645 m!166343))

(declare-fun m!166345 () Bool)

(assert (=> b!111646 m!166345))

(declare-fun m!166347 () Bool)

(assert (=> b!111646 m!166347))

(assert (=> b!111647 m!164395))

(assert (=> d!34948 d!35486))

(declare-fun d!35488 () Bool)

(declare-fun e!73248 () Bool)

(assert (=> d!35488 e!73248))

(declare-fun res!92180 () Bool)

(assert (=> d!35488 (=> (not res!92180) (not e!73248))))

(declare-fun lt!169486 () (_ BitVec 64))

(declare-fun lt!169484 () (_ BitVec 64))

(declare-fun lt!169487 () (_ BitVec 64))

(assert (=> d!35488 (= res!92180 (= lt!169487 (bvsub lt!169486 lt!169484)))))

(assert (=> d!35488 (or (= (bvand lt!169486 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!169484 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!169486 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!169486 lt!169484) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35488 (= lt!169484 (remainingBits!0 ((_ sign_extend 32) (size!2311 (buf!2708 (_1!4866 lt!168312)))) ((_ sign_extend 32) (currentByte!5265 (_1!4866 lt!168312))) ((_ sign_extend 32) (currentBit!5260 (_1!4866 lt!168312)))))))

(declare-fun lt!169485 () (_ BitVec 64))

(declare-fun lt!169483 () (_ BitVec 64))

(assert (=> d!35488 (= lt!169486 (bvmul lt!169485 lt!169483))))

(assert (=> d!35488 (or (= lt!169485 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!169483 (bvsdiv (bvmul lt!169485 lt!169483) lt!169485)))))

(assert (=> d!35488 (= lt!169483 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35488 (= lt!169485 ((_ sign_extend 32) (size!2311 (buf!2708 (_1!4866 lt!168312)))))))

(assert (=> d!35488 (= lt!169487 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5265 (_1!4866 lt!168312))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5260 (_1!4866 lt!168312)))))))

(assert (=> d!35488 (invariant!0 (currentBit!5260 (_1!4866 lt!168312)) (currentByte!5265 (_1!4866 lt!168312)) (size!2311 (buf!2708 (_1!4866 lt!168312))))))

(assert (=> d!35488 (= (bitIndex!0 (size!2311 (buf!2708 (_1!4866 lt!168312))) (currentByte!5265 (_1!4866 lt!168312)) (currentBit!5260 (_1!4866 lt!168312))) lt!169487)))

(declare-fun b!111648 () Bool)

(declare-fun res!92181 () Bool)

(assert (=> b!111648 (=> (not res!92181) (not e!73248))))

(assert (=> b!111648 (= res!92181 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!169487))))

(declare-fun b!111649 () Bool)

(declare-fun lt!169482 () (_ BitVec 64))

(assert (=> b!111649 (= e!73248 (bvsle lt!169487 (bvmul lt!169482 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!111649 (or (= lt!169482 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!169482 #b0000000000000000000000000000000000000000000000000000000000001000) lt!169482)))))

(assert (=> b!111649 (= lt!169482 ((_ sign_extend 32) (size!2311 (buf!2708 (_1!4866 lt!168312)))))))

(assert (= (and d!35488 res!92180) b!111648))

(assert (= (and b!111648 res!92181) b!111649))

(declare-fun m!166349 () Bool)

(assert (=> d!35488 m!166349))

(declare-fun m!166351 () Bool)

(assert (=> d!35488 m!166351))

(assert (=> b!111041 d!35488))

(declare-fun d!35490 () Bool)

(declare-fun e!73249 () Bool)

(assert (=> d!35490 e!73249))

(declare-fun res!92182 () Bool)

(assert (=> d!35490 (=> (not res!92182) (not e!73249))))

(declare-fun lt!169490 () (_ BitVec 64))

(declare-fun lt!169492 () (_ BitVec 64))

(declare-fun lt!169493 () (_ BitVec 64))

(assert (=> d!35490 (= res!92182 (= lt!169493 (bvsub lt!169492 lt!169490)))))

(assert (=> d!35490 (or (= (bvand lt!169492 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!169490 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!169492 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!169492 lt!169490) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35490 (= lt!169490 (remainingBits!0 ((_ sign_extend 32) (size!2311 (buf!2708 (_2!4865 lt!168315)))) ((_ sign_extend 32) (currentByte!5265 (_2!4865 lt!168315))) ((_ sign_extend 32) (currentBit!5260 (_2!4865 lt!168315)))))))

(declare-fun lt!169491 () (_ BitVec 64))

(declare-fun lt!169489 () (_ BitVec 64))

(assert (=> d!35490 (= lt!169492 (bvmul lt!169491 lt!169489))))

(assert (=> d!35490 (or (= lt!169491 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!169489 (bvsdiv (bvmul lt!169491 lt!169489) lt!169491)))))

(assert (=> d!35490 (= lt!169489 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35490 (= lt!169491 ((_ sign_extend 32) (size!2311 (buf!2708 (_2!4865 lt!168315)))))))

(assert (=> d!35490 (= lt!169493 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5265 (_2!4865 lt!168315))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5260 (_2!4865 lt!168315)))))))

(assert (=> d!35490 (invariant!0 (currentBit!5260 (_2!4865 lt!168315)) (currentByte!5265 (_2!4865 lt!168315)) (size!2311 (buf!2708 (_2!4865 lt!168315))))))

(assert (=> d!35490 (= (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!168315))) (currentByte!5265 (_2!4865 lt!168315)) (currentBit!5260 (_2!4865 lt!168315))) lt!169493)))

(declare-fun b!111650 () Bool)

(declare-fun res!92183 () Bool)

(assert (=> b!111650 (=> (not res!92183) (not e!73249))))

(assert (=> b!111650 (= res!92183 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!169493))))

(declare-fun b!111651 () Bool)

(declare-fun lt!169488 () (_ BitVec 64))

(assert (=> b!111651 (= e!73249 (bvsle lt!169493 (bvmul lt!169488 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!111651 (or (= lt!169488 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!169488 #b0000000000000000000000000000000000000000000000000000000000001000) lt!169488)))))

(assert (=> b!111651 (= lt!169488 ((_ sign_extend 32) (size!2311 (buf!2708 (_2!4865 lt!168315)))))))

(assert (= (and d!35490 res!92182) b!111650))

(assert (= (and b!111650 res!92183) b!111651))

(declare-fun m!166353 () Bool)

(assert (=> d!35490 m!166353))

(declare-fun m!166355 () Bool)

(assert (=> d!35490 m!166355))

(assert (=> b!111041 d!35490))

(assert (=> d!34958 d!35446))

(declare-fun d!35492 () Bool)

(declare-fun res!92185 () Bool)

(declare-fun e!73251 () Bool)

(assert (=> d!35492 (=> (not res!92185) (not e!73251))))

(assert (=> d!35492 (= res!92185 (= (size!2311 (buf!2708 (_2!4867 lt!168013))) (size!2311 (buf!2708 (_2!4865 lt!167643)))))))

(assert (=> d!35492 (= (isPrefixOf!0 (_2!4867 lt!168013) (_2!4865 lt!167643)) e!73251)))

(declare-fun b!111652 () Bool)

(declare-fun res!92184 () Bool)

(assert (=> b!111652 (=> (not res!92184) (not e!73251))))

(assert (=> b!111652 (= res!92184 (bvsle (bitIndex!0 (size!2311 (buf!2708 (_2!4867 lt!168013))) (currentByte!5265 (_2!4867 lt!168013)) (currentBit!5260 (_2!4867 lt!168013))) (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!167643))) (currentByte!5265 (_2!4865 lt!167643)) (currentBit!5260 (_2!4865 lt!167643)))))))

(declare-fun b!111653 () Bool)

(declare-fun e!73250 () Bool)

(assert (=> b!111653 (= e!73251 e!73250)))

(declare-fun res!92186 () Bool)

(assert (=> b!111653 (=> res!92186 e!73250)))

(assert (=> b!111653 (= res!92186 (= (size!2311 (buf!2708 (_2!4867 lt!168013))) #b00000000000000000000000000000000))))

(declare-fun b!111654 () Bool)

(assert (=> b!111654 (= e!73250 (arrayBitRangesEq!0 (buf!2708 (_2!4867 lt!168013)) (buf!2708 (_2!4865 lt!167643)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2311 (buf!2708 (_2!4867 lt!168013))) (currentByte!5265 (_2!4867 lt!168013)) (currentBit!5260 (_2!4867 lt!168013)))))))

(assert (= (and d!35492 res!92185) b!111652))

(assert (= (and b!111652 res!92184) b!111653))

(assert (= (and b!111653 (not res!92186)) b!111654))

(declare-fun m!166357 () Bool)

(assert (=> b!111652 m!166357))

(assert (=> b!111652 m!164693))

(assert (=> b!111654 m!166357))

(assert (=> b!111654 m!166357))

(declare-fun m!166359 () Bool)

(assert (=> b!111654 m!166359))

(assert (=> b!110926 d!35492))

(declare-fun d!35494 () Bool)

(assert (=> d!35494 (= (remainingBits!0 ((_ sign_extend 32) (size!2311 (buf!2708 (_1!4866 lt!167641)))) ((_ sign_extend 32) (currentByte!5265 (_1!4866 lt!167641))) ((_ sign_extend 32) (currentBit!5260 (_1!4866 lt!167641)))) (bvsub (bvmul ((_ sign_extend 32) (size!2311 (buf!2708 (_1!4866 lt!167641)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5265 (_1!4866 lt!167641))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5260 (_1!4866 lt!167641))))))))

(assert (=> d!34952 d!35494))

(declare-fun d!35496 () Bool)

(assert (=> d!35496 (= (invariant!0 (currentBit!5260 (_1!4866 lt!167641)) (currentByte!5265 (_1!4866 lt!167641)) (size!2311 (buf!2708 (_1!4866 lt!167641)))) (and (bvsge (currentBit!5260 (_1!4866 lt!167641)) #b00000000000000000000000000000000) (bvslt (currentBit!5260 (_1!4866 lt!167641)) #b00000000000000000000000000001000) (bvsge (currentByte!5265 (_1!4866 lt!167641)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5265 (_1!4866 lt!167641)) (size!2311 (buf!2708 (_1!4866 lt!167641)))) (and (= (currentBit!5260 (_1!4866 lt!167641)) #b00000000000000000000000000000000) (= (currentByte!5265 (_1!4866 lt!167641)) (size!2311 (buf!2708 (_1!4866 lt!167641))))))))))

(assert (=> d!34952 d!35496))

(declare-fun d!35498 () Bool)

(declare-fun e!73252 () Bool)

(assert (=> d!35498 e!73252))

(declare-fun res!92187 () Bool)

(assert (=> d!35498 (=> (not res!92187) (not e!73252))))

(assert (=> d!35498 (= res!92187 (= (buf!2708 (_2!4865 (increaseBitIndex!0 (_1!4867 lt!167630)))) (buf!2708 (_1!4867 lt!167630))))))

(declare-fun lt!169500 () Bool)

(assert (=> d!35498 (= lt!169500 (not (= (bvand ((_ sign_extend 24) (select (arr!2904 (buf!2708 (_1!4867 lt!167630))) (currentByte!5265 (_1!4867 lt!167630)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5260 (_1!4867 lt!167630))))) #b00000000000000000000000000000000)))))

(declare-fun lt!169495 () tuple2!9240)

(assert (=> d!35498 (= lt!169495 (tuple2!9241 (not (= (bvand ((_ sign_extend 24) (select (arr!2904 (buf!2708 (_1!4867 lt!167630))) (currentByte!5265 (_1!4867 lt!167630)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5260 (_1!4867 lt!167630))))) #b00000000000000000000000000000000)) (_2!4865 (increaseBitIndex!0 (_1!4867 lt!167630)))))))

(assert (=> d!35498 (validate_offset_bit!0 ((_ sign_extend 32) (size!2311 (buf!2708 (_1!4867 lt!167630)))) ((_ sign_extend 32) (currentByte!5265 (_1!4867 lt!167630))) ((_ sign_extend 32) (currentBit!5260 (_1!4867 lt!167630))))))

(assert (=> d!35498 (= (readBit!0 (_1!4867 lt!167630)) lt!169495)))

(declare-fun lt!169498 () (_ BitVec 64))

(declare-fun b!111655 () Bool)

(declare-fun lt!169494 () (_ BitVec 64))

(assert (=> b!111655 (= e!73252 (= (bitIndex!0 (size!2311 (buf!2708 (_2!4865 (increaseBitIndex!0 (_1!4867 lt!167630))))) (currentByte!5265 (_2!4865 (increaseBitIndex!0 (_1!4867 lt!167630)))) (currentBit!5260 (_2!4865 (increaseBitIndex!0 (_1!4867 lt!167630))))) (bvadd lt!169494 lt!169498)))))

(assert (=> b!111655 (or (not (= (bvand lt!169494 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!169498 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!169494 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!169494 lt!169498) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!111655 (= lt!169498 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!111655 (= lt!169494 (bitIndex!0 (size!2311 (buf!2708 (_1!4867 lt!167630))) (currentByte!5265 (_1!4867 lt!167630)) (currentBit!5260 (_1!4867 lt!167630))))))

(declare-fun lt!169496 () Bool)

(assert (=> b!111655 (= lt!169496 (not (= (bvand ((_ sign_extend 24) (select (arr!2904 (buf!2708 (_1!4867 lt!167630))) (currentByte!5265 (_1!4867 lt!167630)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5260 (_1!4867 lt!167630))))) #b00000000000000000000000000000000)))))

(declare-fun lt!169499 () Bool)

(assert (=> b!111655 (= lt!169499 (not (= (bvand ((_ sign_extend 24) (select (arr!2904 (buf!2708 (_1!4867 lt!167630))) (currentByte!5265 (_1!4867 lt!167630)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5260 (_1!4867 lt!167630))))) #b00000000000000000000000000000000)))))

(declare-fun lt!169497 () Bool)

(assert (=> b!111655 (= lt!169497 (not (= (bvand ((_ sign_extend 24) (select (arr!2904 (buf!2708 (_1!4867 lt!167630))) (currentByte!5265 (_1!4867 lt!167630)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5260 (_1!4867 lt!167630))))) #b00000000000000000000000000000000)))))

(assert (= (and d!35498 res!92187) b!111655))

(declare-fun m!166361 () Bool)

(assert (=> d!35498 m!166361))

(declare-fun m!166363 () Bool)

(assert (=> d!35498 m!166363))

(declare-fun m!166365 () Bool)

(assert (=> d!35498 m!166365))

(declare-fun m!166367 () Bool)

(assert (=> d!35498 m!166367))

(assert (=> b!111655 m!166361))

(assert (=> b!111655 m!166365))

(assert (=> b!111655 m!166347))

(declare-fun m!166369 () Bool)

(assert (=> b!111655 m!166369))

(assert (=> b!111655 m!166363))

(assert (=> d!34878 d!35498))

(declare-fun d!35500 () Bool)

(assert (=> d!35500 (= (invariant!0 (currentBit!5260 (_2!4865 lt!167626)) (currentByte!5265 (_2!4865 lt!167626)) (size!2311 (buf!2708 (_2!4865 lt!167626)))) (and (bvsge (currentBit!5260 (_2!4865 lt!167626)) #b00000000000000000000000000000000) (bvslt (currentBit!5260 (_2!4865 lt!167626)) #b00000000000000000000000000001000) (bvsge (currentByte!5265 (_2!4865 lt!167626)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5265 (_2!4865 lt!167626)) (size!2311 (buf!2708 (_2!4865 lt!167626)))) (and (= (currentBit!5260 (_2!4865 lt!167626)) #b00000000000000000000000000000000) (= (currentByte!5265 (_2!4865 lt!167626)) (size!2311 (buf!2708 (_2!4865 lt!167626))))))))))

(assert (=> d!34852 d!35500))

(declare-fun d!35502 () Bool)

(declare-fun e!73253 () Bool)

(assert (=> d!35502 e!73253))

(declare-fun res!92188 () Bool)

(assert (=> d!35502 (=> (not res!92188) (not e!73253))))

(declare-fun lt!169503 () (_ BitVec 64))

(declare-fun lt!169505 () (_ BitVec 64))

(declare-fun lt!169506 () (_ BitVec 64))

(assert (=> d!35502 (= res!92188 (= lt!169506 (bvsub lt!169505 lt!169503)))))

(assert (=> d!35502 (or (= (bvand lt!169505 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!169503 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!169505 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!169505 lt!169503) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35502 (= lt!169503 (remainingBits!0 ((_ sign_extend 32) (size!2311 (buf!2708 (_1!4866 lt!168025)))) ((_ sign_extend 32) (currentByte!5265 (_1!4866 lt!168025))) ((_ sign_extend 32) (currentBit!5260 (_1!4866 lt!168025)))))))

(declare-fun lt!169504 () (_ BitVec 64))

(declare-fun lt!169502 () (_ BitVec 64))

(assert (=> d!35502 (= lt!169505 (bvmul lt!169504 lt!169502))))

(assert (=> d!35502 (or (= lt!169504 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!169502 (bvsdiv (bvmul lt!169504 lt!169502) lt!169504)))))

(assert (=> d!35502 (= lt!169502 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35502 (= lt!169504 ((_ sign_extend 32) (size!2311 (buf!2708 (_1!4866 lt!168025)))))))

(assert (=> d!35502 (= lt!169506 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5265 (_1!4866 lt!168025))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5260 (_1!4866 lt!168025)))))))

(assert (=> d!35502 (invariant!0 (currentBit!5260 (_1!4866 lt!168025)) (currentByte!5265 (_1!4866 lt!168025)) (size!2311 (buf!2708 (_1!4866 lt!168025))))))

(assert (=> d!35502 (= (bitIndex!0 (size!2311 (buf!2708 (_1!4866 lt!168025))) (currentByte!5265 (_1!4866 lt!168025)) (currentBit!5260 (_1!4866 lt!168025))) lt!169506)))

(declare-fun b!111656 () Bool)

(declare-fun res!92189 () Bool)

(assert (=> b!111656 (=> (not res!92189) (not e!73253))))

(assert (=> b!111656 (= res!92189 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!169506))))

(declare-fun b!111657 () Bool)

(declare-fun lt!169501 () (_ BitVec 64))

(assert (=> b!111657 (= e!73253 (bvsle lt!169506 (bvmul lt!169501 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!111657 (or (= lt!169501 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!169501 #b0000000000000000000000000000000000000000000000000000000000001000) lt!169501)))))

(assert (=> b!111657 (= lt!169501 ((_ sign_extend 32) (size!2311 (buf!2708 (_1!4866 lt!168025)))))))

(assert (= (and d!35502 res!92188) b!111656))

(assert (= (and b!111656 res!92189) b!111657))

(declare-fun m!166371 () Bool)

(assert (=> d!35502 m!166371))

(declare-fun m!166373 () Bool)

(assert (=> d!35502 m!166373))

(assert (=> b!110943 d!35502))

(assert (=> b!110943 d!35442))

(declare-fun d!35504 () Bool)

(assert (=> d!35504 (= (remainingBits!0 ((_ sign_extend 32) (size!2311 (buf!2708 (_2!4865 lt!167643)))) ((_ sign_extend 32) (currentByte!5265 thiss!1305)) ((_ sign_extend 32) (currentBit!5260 thiss!1305))) (bvsub (bvmul ((_ sign_extend 32) (size!2311 (buf!2708 (_2!4865 lt!167643)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5265 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5260 thiss!1305)))))))

(assert (=> d!34874 d!35504))

(declare-fun d!35506 () Bool)

(declare-fun lt!169507 () tuple2!9240)

(assert (=> d!35506 (= lt!169507 (readBit!0 (readerFrom!0 (_2!4865 lt!168315) (currentBit!5260 (_2!4865 lt!167626)) (currentByte!5265 (_2!4865 lt!167626)))))))

(assert (=> d!35506 (= (readBitPure!0 (readerFrom!0 (_2!4865 lt!168315) (currentBit!5260 (_2!4865 lt!167626)) (currentByte!5265 (_2!4865 lt!167626)))) (tuple2!9219 (_2!4877 lt!169507) (_1!4877 lt!169507)))))

(declare-fun bs!8665 () Bool)

(assert (= bs!8665 d!35506))

(assert (=> bs!8665 m!164911))

(declare-fun m!166375 () Bool)

(assert (=> bs!8665 m!166375))

(assert (=> b!111036 d!35506))

(declare-fun d!35508 () Bool)

(declare-fun e!73254 () Bool)

(assert (=> d!35508 e!73254))

(declare-fun res!92190 () Bool)

(assert (=> d!35508 (=> (not res!92190) (not e!73254))))

(assert (=> d!35508 (= res!92190 (invariant!0 (currentBit!5260 (_2!4865 lt!168315)) (currentByte!5265 (_2!4865 lt!168315)) (size!2311 (buf!2708 (_2!4865 lt!168315)))))))

(assert (=> d!35508 (= (readerFrom!0 (_2!4865 lt!168315) (currentBit!5260 (_2!4865 lt!167626)) (currentByte!5265 (_2!4865 lt!167626))) (BitStream!4097 (buf!2708 (_2!4865 lt!168315)) (currentByte!5265 (_2!4865 lt!167626)) (currentBit!5260 (_2!4865 lt!167626))))))

(declare-fun b!111658 () Bool)

(assert (=> b!111658 (= e!73254 (invariant!0 (currentBit!5260 (_2!4865 lt!167626)) (currentByte!5265 (_2!4865 lt!167626)) (size!2311 (buf!2708 (_2!4865 lt!168315)))))))

(assert (= (and d!35508 res!92190) b!111658))

(assert (=> d!35508 m!166355))

(declare-fun m!166377 () Bool)

(assert (=> b!111658 m!166377))

(assert (=> b!111036 d!35508))

(declare-fun d!35510 () Bool)

(declare-fun res!92192 () Bool)

(declare-fun e!73256 () Bool)

(assert (=> d!35510 (=> (not res!92192) (not e!73256))))

(assert (=> d!35510 (= res!92192 (= (size!2311 (buf!2708 (_2!4867 lt!168380))) (size!2311 (buf!2708 (_2!4865 lt!167643)))))))

(assert (=> d!35510 (= (isPrefixOf!0 (_2!4867 lt!168380) (_2!4865 lt!167643)) e!73256)))

(declare-fun b!111659 () Bool)

(declare-fun res!92191 () Bool)

(assert (=> b!111659 (=> (not res!92191) (not e!73256))))

(assert (=> b!111659 (= res!92191 (bvsle (bitIndex!0 (size!2311 (buf!2708 (_2!4867 lt!168380))) (currentByte!5265 (_2!4867 lt!168380)) (currentBit!5260 (_2!4867 lt!168380))) (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!167643))) (currentByte!5265 (_2!4865 lt!167643)) (currentBit!5260 (_2!4865 lt!167643)))))))

(declare-fun b!111660 () Bool)

(declare-fun e!73255 () Bool)

(assert (=> b!111660 (= e!73256 e!73255)))

(declare-fun res!92193 () Bool)

(assert (=> b!111660 (=> res!92193 e!73255)))

(assert (=> b!111660 (= res!92193 (= (size!2311 (buf!2708 (_2!4867 lt!168380))) #b00000000000000000000000000000000))))

(declare-fun b!111661 () Bool)

(assert (=> b!111661 (= e!73255 (arrayBitRangesEq!0 (buf!2708 (_2!4867 lt!168380)) (buf!2708 (_2!4865 lt!167643)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2311 (buf!2708 (_2!4867 lt!168380))) (currentByte!5265 (_2!4867 lt!168380)) (currentBit!5260 (_2!4867 lt!168380)))))))

(assert (= (and d!35510 res!92192) b!111659))

(assert (= (and b!111659 res!92191) b!111660))

(assert (= (and b!111660 (not res!92193)) b!111661))

(assert (=> b!111659 m!166285))

(assert (=> b!111659 m!164693))

(assert (=> b!111661 m!166285))

(assert (=> b!111661 m!166285))

(declare-fun m!166379 () Bool)

(assert (=> b!111661 m!166379))

(assert (=> b!111061 d!35510))

(assert (=> b!110866 d!34956))

(declare-fun d!35512 () Bool)

(declare-fun res!92195 () Bool)

(declare-fun e!73258 () Bool)

(assert (=> d!35512 (=> (not res!92195) (not e!73258))))

(assert (=> d!35512 (= res!92195 (= (size!2311 (buf!2708 thiss!1305)) (size!2311 (buf!2708 (_2!4865 lt!168024)))))))

(assert (=> d!35512 (= (isPrefixOf!0 thiss!1305 (_2!4865 lt!168024)) e!73258)))

(declare-fun b!111662 () Bool)

(declare-fun res!92194 () Bool)

(assert (=> b!111662 (=> (not res!92194) (not e!73258))))

(assert (=> b!111662 (= res!92194 (bvsle (bitIndex!0 (size!2311 (buf!2708 thiss!1305)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305)) (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!168024))) (currentByte!5265 (_2!4865 lt!168024)) (currentBit!5260 (_2!4865 lt!168024)))))))

(declare-fun b!111663 () Bool)

(declare-fun e!73257 () Bool)

(assert (=> b!111663 (= e!73258 e!73257)))

(declare-fun res!92196 () Bool)

(assert (=> b!111663 (=> res!92196 e!73257)))

(assert (=> b!111663 (= res!92196 (= (size!2311 (buf!2708 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!111664 () Bool)

(assert (=> b!111664 (= e!73257 (arrayBitRangesEq!0 (buf!2708 thiss!1305) (buf!2708 (_2!4865 lt!168024)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2311 (buf!2708 thiss!1305)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305))))))

(assert (= (and d!35512 res!92195) b!111662))

(assert (= (and b!111662 res!92194) b!111663))

(assert (= (and b!111663 (not res!92196)) b!111664))

(assert (=> b!111662 m!164351))

(assert (=> b!111662 m!164709))

(assert (=> b!111664 m!164351))

(assert (=> b!111664 m!164351))

(declare-fun m!166381 () Bool)

(assert (=> b!111664 m!166381))

(assert (=> b!110941 d!35512))

(assert (=> b!111048 d!35490))

(assert (=> b!111048 d!34856))

(declare-fun d!35514 () Bool)

(assert (=> d!35514 (isPrefixOf!0 lt!168001 lt!168001)))

(declare-fun lt!169508 () Unit!6790)

(assert (=> d!35514 (= lt!169508 (choose!11 lt!168001))))

(assert (=> d!35514 (= (lemmaIsPrefixRefl!0 lt!168001) lt!169508)))

(declare-fun bs!8666 () Bool)

(assert (= bs!8666 d!35514))

(assert (=> bs!8666 m!164669))

(declare-fun m!166383 () Bool)

(assert (=> bs!8666 m!166383))

(assert (=> d!34886 d!35514))

(declare-fun d!35516 () Bool)

(assert (=> d!35516 (isPrefixOf!0 lt!168001 (_2!4865 lt!167643))))

(declare-fun lt!169509 () Unit!6790)

(assert (=> d!35516 (= lt!169509 (choose!30 lt!168001 thiss!1305 (_2!4865 lt!167643)))))

(assert (=> d!35516 (isPrefixOf!0 lt!168001 thiss!1305)))

(assert (=> d!35516 (= (lemmaIsPrefixTransitive!0 lt!168001 thiss!1305 (_2!4865 lt!167643)) lt!169509)))

(declare-fun bs!8667 () Bool)

(assert (= bs!8667 d!35516))

(assert (=> bs!8667 m!164681))

(declare-fun m!166385 () Bool)

(assert (=> bs!8667 m!166385))

(declare-fun m!166387 () Bool)

(assert (=> bs!8667 m!166387))

(assert (=> d!34886 d!35516))

(declare-fun d!35518 () Bool)

(declare-fun res!92198 () Bool)

(declare-fun e!73260 () Bool)

(assert (=> d!35518 (=> (not res!92198) (not e!73260))))

(assert (=> d!35518 (= res!92198 (= (size!2311 (buf!2708 lt!168001)) (size!2311 (buf!2708 lt!168001))))))

(assert (=> d!35518 (= (isPrefixOf!0 lt!168001 lt!168001) e!73260)))

(declare-fun b!111665 () Bool)

(declare-fun res!92197 () Bool)

(assert (=> b!111665 (=> (not res!92197) (not e!73260))))

(assert (=> b!111665 (= res!92197 (bvsle (bitIndex!0 (size!2311 (buf!2708 lt!168001)) (currentByte!5265 lt!168001) (currentBit!5260 lt!168001)) (bitIndex!0 (size!2311 (buf!2708 lt!168001)) (currentByte!5265 lt!168001) (currentBit!5260 lt!168001))))))

(declare-fun b!111666 () Bool)

(declare-fun e!73259 () Bool)

(assert (=> b!111666 (= e!73260 e!73259)))

(declare-fun res!92199 () Bool)

(assert (=> b!111666 (=> res!92199 e!73259)))

(assert (=> b!111666 (= res!92199 (= (size!2311 (buf!2708 lt!168001)) #b00000000000000000000000000000000))))

(declare-fun b!111667 () Bool)

(assert (=> b!111667 (= e!73259 (arrayBitRangesEq!0 (buf!2708 lt!168001) (buf!2708 lt!168001) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2311 (buf!2708 lt!168001)) (currentByte!5265 lt!168001) (currentBit!5260 lt!168001))))))

(assert (= (and d!35518 res!92198) b!111665))

(assert (= (and b!111665 res!92197) b!111666))

(assert (= (and b!111666 (not res!92199)) b!111667))

(declare-fun m!166389 () Bool)

(assert (=> b!111665 m!166389))

(assert (=> b!111665 m!166389))

(assert (=> b!111667 m!166389))

(assert (=> b!111667 m!166389))

(declare-fun m!166391 () Bool)

(assert (=> b!111667 m!166391))

(assert (=> d!34886 d!35518))

(declare-fun d!35520 () Bool)

(declare-fun res!92201 () Bool)

(declare-fun e!73262 () Bool)

(assert (=> d!35520 (=> (not res!92201) (not e!73262))))

(assert (=> d!35520 (= res!92201 (= (size!2311 (buf!2708 (_1!4867 lt!168013))) (size!2311 (buf!2708 (_2!4867 lt!168013)))))))

(assert (=> d!35520 (= (isPrefixOf!0 (_1!4867 lt!168013) (_2!4867 lt!168013)) e!73262)))

(declare-fun b!111668 () Bool)

(declare-fun res!92200 () Bool)

(assert (=> b!111668 (=> (not res!92200) (not e!73262))))

(assert (=> b!111668 (= res!92200 (bvsle (bitIndex!0 (size!2311 (buf!2708 (_1!4867 lt!168013))) (currentByte!5265 (_1!4867 lt!168013)) (currentBit!5260 (_1!4867 lt!168013))) (bitIndex!0 (size!2311 (buf!2708 (_2!4867 lt!168013))) (currentByte!5265 (_2!4867 lt!168013)) (currentBit!5260 (_2!4867 lt!168013)))))))

(declare-fun b!111669 () Bool)

(declare-fun e!73261 () Bool)

(assert (=> b!111669 (= e!73262 e!73261)))

(declare-fun res!92202 () Bool)

(assert (=> b!111669 (=> res!92202 e!73261)))

(assert (=> b!111669 (= res!92202 (= (size!2311 (buf!2708 (_1!4867 lt!168013))) #b00000000000000000000000000000000))))

(declare-fun b!111670 () Bool)

(assert (=> b!111670 (= e!73261 (arrayBitRangesEq!0 (buf!2708 (_1!4867 lt!168013)) (buf!2708 (_2!4867 lt!168013)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2311 (buf!2708 (_1!4867 lt!168013))) (currentByte!5265 (_1!4867 lt!168013)) (currentBit!5260 (_1!4867 lt!168013)))))))

(assert (= (and d!35520 res!92201) b!111668))

(assert (= (and b!111668 res!92200) b!111669))

(assert (= (and b!111669 (not res!92202)) b!111670))

(declare-fun m!166393 () Bool)

(assert (=> b!111668 m!166393))

(assert (=> b!111668 m!166357))

(assert (=> b!111670 m!166393))

(assert (=> b!111670 m!166393))

(declare-fun m!166395 () Bool)

(assert (=> b!111670 m!166395))

(assert (=> d!34886 d!35520))

(declare-fun d!35522 () Bool)

(assert (=> d!35522 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-fun lt!169510 () Unit!6790)

(assert (=> d!35522 (= lt!169510 (choose!11 thiss!1305))))

(assert (=> d!35522 (= (lemmaIsPrefixRefl!0 thiss!1305) lt!169510)))

(declare-fun bs!8668 () Bool)

(assert (= bs!8668 d!35522))

(assert (=> bs!8668 m!164687))

(declare-fun m!166397 () Bool)

(assert (=> bs!8668 m!166397))

(assert (=> d!34886 d!35522))

(assert (=> d!34886 d!35452))

(declare-fun d!35524 () Bool)

(assert (=> d!35524 (isPrefixOf!0 lt!168001 (_2!4865 lt!167643))))

(declare-fun lt!169511 () Unit!6790)

(assert (=> d!35524 (= lt!169511 (choose!30 lt!168001 (_2!4865 lt!167643) (_2!4865 lt!167643)))))

(assert (=> d!35524 (isPrefixOf!0 lt!168001 (_2!4865 lt!167643))))

(assert (=> d!35524 (= (lemmaIsPrefixTransitive!0 lt!168001 (_2!4865 lt!167643) (_2!4865 lt!167643)) lt!169511)))

(declare-fun bs!8669 () Bool)

(assert (= bs!8669 d!35524))

(assert (=> bs!8669 m!164681))

(declare-fun m!166399 () Bool)

(assert (=> bs!8669 m!166399))

(assert (=> bs!8669 m!164681))

(assert (=> d!34886 d!35524))

(assert (=> d!34886 d!35458))

(declare-fun d!35526 () Bool)

(declare-fun res!92204 () Bool)

(declare-fun e!73264 () Bool)

(assert (=> d!35526 (=> (not res!92204) (not e!73264))))

(assert (=> d!35526 (= res!92204 (= (size!2311 (buf!2708 thiss!1305)) (size!2311 (buf!2708 thiss!1305))))))

(assert (=> d!35526 (= (isPrefixOf!0 thiss!1305 thiss!1305) e!73264)))

(declare-fun b!111671 () Bool)

(declare-fun res!92203 () Bool)

(assert (=> b!111671 (=> (not res!92203) (not e!73264))))

(assert (=> b!111671 (= res!92203 (bvsle (bitIndex!0 (size!2311 (buf!2708 thiss!1305)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305)) (bitIndex!0 (size!2311 (buf!2708 thiss!1305)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305))))))

(declare-fun b!111672 () Bool)

(declare-fun e!73263 () Bool)

(assert (=> b!111672 (= e!73264 e!73263)))

(declare-fun res!92205 () Bool)

(assert (=> b!111672 (=> res!92205 e!73263)))

(assert (=> b!111672 (= res!92205 (= (size!2311 (buf!2708 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!111673 () Bool)

(assert (=> b!111673 (= e!73263 (arrayBitRangesEq!0 (buf!2708 thiss!1305) (buf!2708 thiss!1305) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2311 (buf!2708 thiss!1305)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305))))))

(assert (= (and d!35526 res!92204) b!111671))

(assert (= (and b!111671 res!92203) b!111672))

(assert (= (and b!111672 (not res!92205)) b!111673))

(assert (=> b!111671 m!164351))

(assert (=> b!111671 m!164351))

(assert (=> b!111673 m!164351))

(assert (=> b!111673 m!164351))

(declare-fun m!166401 () Bool)

(assert (=> b!111673 m!166401))

(assert (=> d!34886 d!35526))

(declare-fun d!35528 () Bool)

(declare-fun res!92207 () Bool)

(declare-fun e!73266 () Bool)

(assert (=> d!35528 (=> (not res!92207) (not e!73266))))

(assert (=> d!35528 (= res!92207 (= (size!2311 (buf!2708 lt!168001)) (size!2311 (buf!2708 (_2!4865 lt!167643)))))))

(assert (=> d!35528 (= (isPrefixOf!0 lt!168001 (_2!4865 lt!167643)) e!73266)))

(declare-fun b!111674 () Bool)

(declare-fun res!92206 () Bool)

(assert (=> b!111674 (=> (not res!92206) (not e!73266))))

(assert (=> b!111674 (= res!92206 (bvsle (bitIndex!0 (size!2311 (buf!2708 lt!168001)) (currentByte!5265 lt!168001) (currentBit!5260 lt!168001)) (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!167643))) (currentByte!5265 (_2!4865 lt!167643)) (currentBit!5260 (_2!4865 lt!167643)))))))

(declare-fun b!111675 () Bool)

(declare-fun e!73265 () Bool)

(assert (=> b!111675 (= e!73266 e!73265)))

(declare-fun res!92208 () Bool)

(assert (=> b!111675 (=> res!92208 e!73265)))

(assert (=> b!111675 (= res!92208 (= (size!2311 (buf!2708 lt!168001)) #b00000000000000000000000000000000))))

(declare-fun b!111676 () Bool)

(assert (=> b!111676 (= e!73265 (arrayBitRangesEq!0 (buf!2708 lt!168001) (buf!2708 (_2!4865 lt!167643)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2311 (buf!2708 lt!168001)) (currentByte!5265 lt!168001) (currentBit!5260 lt!168001))))))

(assert (= (and d!35528 res!92207) b!111674))

(assert (= (and b!111674 res!92206) b!111675))

(assert (= (and b!111675 (not res!92208)) b!111676))

(assert (=> b!111674 m!166389))

(assert (=> b!111674 m!164693))

(assert (=> b!111676 m!166389))

(assert (=> b!111676 m!166389))

(declare-fun m!166403 () Bool)

(assert (=> b!111676 m!166403))

(assert (=> d!34886 d!35528))

(assert (=> d!34886 d!34904))

(assert (=> d!34954 d!35444))

(declare-fun b!111688 () Bool)

(declare-fun res!92220 () Bool)

(declare-fun e!73278 () Bool)

(assert (=> b!111688 (=> (not res!92220) (not e!73278))))

(declare-fun _$19!102 () tuple2!9216)

(assert (=> b!111688 (= res!92220 (= (bitIndex!0 (size!2311 (buf!2708 (_2!4865 _$19!102))) (currentByte!5265 (_2!4865 _$19!102)) (currentBit!5260 (_2!4865 _$19!102))) (bvadd (bitIndex!0 (size!2311 (buf!2708 thiss!1305)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun d!35530 () Bool)

(assert (=> d!35530 e!73278))

(declare-fun res!92217 () Bool)

(assert (=> d!35530 (=> (not res!92217) (not e!73278))))

(assert (=> d!35530 (= res!92217 (= (size!2311 (buf!2708 thiss!1305)) (size!2311 (buf!2708 (_2!4865 _$19!102)))))))

(declare-fun e!73276 () Bool)

(assert (=> d!35530 (and (inv!12 (_2!4865 _$19!102)) e!73276)))

(assert (=> d!35530 (= (choose!16 thiss!1305 lt!167625) _$19!102)))

(declare-fun b!111689 () Bool)

(assert (=> b!111689 (= e!73276 (array_inv!2113 (buf!2708 (_2!4865 _$19!102))))))

(declare-fun b!111690 () Bool)

(declare-fun res!92218 () Bool)

(assert (=> b!111690 (=> (not res!92218) (not e!73278))))

(assert (=> b!111690 (= res!92218 (isPrefixOf!0 thiss!1305 (_2!4865 _$19!102)))))

(declare-fun b!111691 () Bool)

(declare-fun e!73275 () Bool)

(assert (=> b!111691 (= e!73278 e!73275)))

(declare-fun res!92219 () Bool)

(assert (=> b!111691 (=> (not res!92219) (not e!73275))))

(declare-fun lt!169514 () tuple2!9218)

(assert (=> b!111691 (= res!92219 (and (= (_2!4866 lt!169514) lt!167625) (= (_1!4866 lt!169514) (_2!4865 _$19!102))))))

(assert (=> b!111691 (= lt!169514 (readBitPure!0 (readerFrom!0 (_2!4865 _$19!102) (currentBit!5260 thiss!1305) (currentByte!5265 thiss!1305))))))

(declare-fun b!111692 () Bool)

(assert (=> b!111692 (= e!73275 (= (bitIndex!0 (size!2311 (buf!2708 (_1!4866 lt!169514))) (currentByte!5265 (_1!4866 lt!169514)) (currentBit!5260 (_1!4866 lt!169514))) (bitIndex!0 (size!2311 (buf!2708 (_2!4865 _$19!102))) (currentByte!5265 (_2!4865 _$19!102)) (currentBit!5260 (_2!4865 _$19!102)))))))

(assert (= d!35530 b!111689))

(assert (= (and d!35530 res!92217) b!111688))

(assert (= (and b!111688 res!92220) b!111690))

(assert (= (and b!111690 res!92218) b!111691))

(assert (= (and b!111691 res!92219) b!111692))

(declare-fun m!166405 () Bool)

(assert (=> b!111688 m!166405))

(assert (=> b!111688 m!164351))

(declare-fun m!166407 () Bool)

(assert (=> b!111690 m!166407))

(declare-fun m!166409 () Bool)

(assert (=> b!111691 m!166409))

(assert (=> b!111691 m!166409))

(declare-fun m!166411 () Bool)

(assert (=> b!111691 m!166411))

(declare-fun m!166413 () Bool)

(assert (=> b!111689 m!166413))

(declare-fun m!166415 () Bool)

(assert (=> d!35530 m!166415))

(declare-fun m!166417 () Bool)

(assert (=> b!111692 m!166417))

(assert (=> b!111692 m!166405))

(assert (=> d!34906 d!35530))

(declare-fun d!35532 () Bool)

(assert (=> d!35532 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!2311 (buf!2708 thiss!1305))) ((_ sign_extend 32) (currentByte!5265 thiss!1305)) ((_ sign_extend 32) (currentBit!5260 thiss!1305))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2311 (buf!2708 thiss!1305))) ((_ sign_extend 32) (currentByte!5265 thiss!1305)) ((_ sign_extend 32) (currentBit!5260 thiss!1305))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!8670 () Bool)

(assert (= bs!8670 d!35532))

(assert (=> bs!8670 m!164565))

(assert (=> d!34906 d!35532))

(declare-fun d!35534 () Bool)

(declare-fun e!73279 () Bool)

(assert (=> d!35534 e!73279))

(declare-fun res!92221 () Bool)

(assert (=> d!35534 (=> (not res!92221) (not e!73279))))

(assert (=> d!35534 (= res!92221 (= (buf!2708 (_2!4865 (increaseBitIndex!0 lt!167635))) (buf!2708 lt!167635)))))

(declare-fun lt!169521 () Bool)

(assert (=> d!35534 (= lt!169521 (not (= (bvand ((_ sign_extend 24) (select (arr!2904 (buf!2708 lt!167635)) (currentByte!5265 lt!167635))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5260 lt!167635)))) #b00000000000000000000000000000000)))))

(declare-fun lt!169516 () tuple2!9240)

(assert (=> d!35534 (= lt!169516 (tuple2!9241 (not (= (bvand ((_ sign_extend 24) (select (arr!2904 (buf!2708 lt!167635)) (currentByte!5265 lt!167635))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5260 lt!167635)))) #b00000000000000000000000000000000)) (_2!4865 (increaseBitIndex!0 lt!167635))))))

(assert (=> d!35534 (validate_offset_bit!0 ((_ sign_extend 32) (size!2311 (buf!2708 lt!167635))) ((_ sign_extend 32) (currentByte!5265 lt!167635)) ((_ sign_extend 32) (currentBit!5260 lt!167635)))))

(assert (=> d!35534 (= (readBit!0 lt!167635) lt!169516)))

(declare-fun lt!169515 () (_ BitVec 64))

(declare-fun b!111693 () Bool)

(declare-fun lt!169519 () (_ BitVec 64))

(assert (=> b!111693 (= e!73279 (= (bitIndex!0 (size!2311 (buf!2708 (_2!4865 (increaseBitIndex!0 lt!167635)))) (currentByte!5265 (_2!4865 (increaseBitIndex!0 lt!167635))) (currentBit!5260 (_2!4865 (increaseBitIndex!0 lt!167635)))) (bvadd lt!169515 lt!169519)))))

(assert (=> b!111693 (or (not (= (bvand lt!169515 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!169519 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!169515 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!169515 lt!169519) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!111693 (= lt!169519 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!111693 (= lt!169515 (bitIndex!0 (size!2311 (buf!2708 lt!167635)) (currentByte!5265 lt!167635) (currentBit!5260 lt!167635)))))

(declare-fun lt!169517 () Bool)

(assert (=> b!111693 (= lt!169517 (not (= (bvand ((_ sign_extend 24) (select (arr!2904 (buf!2708 lt!167635)) (currentByte!5265 lt!167635))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5260 lt!167635)))) #b00000000000000000000000000000000)))))

(declare-fun lt!169520 () Bool)

(assert (=> b!111693 (= lt!169520 (not (= (bvand ((_ sign_extend 24) (select (arr!2904 (buf!2708 lt!167635)) (currentByte!5265 lt!167635))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5260 lt!167635)))) #b00000000000000000000000000000000)))))

(declare-fun lt!169518 () Bool)

(assert (=> b!111693 (= lt!169518 (not (= (bvand ((_ sign_extend 24) (select (arr!2904 (buf!2708 lt!167635)) (currentByte!5265 lt!167635))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5260 lt!167635)))) #b00000000000000000000000000000000)))))

(assert (= (and d!35534 res!92221) b!111693))

(declare-fun m!166419 () Bool)

(assert (=> d!35534 m!166419))

(declare-fun m!166421 () Bool)

(assert (=> d!35534 m!166421))

(declare-fun m!166423 () Bool)

(assert (=> d!35534 m!166423))

(declare-fun m!166425 () Bool)

(assert (=> d!35534 m!166425))

(assert (=> b!111693 m!166419))

(assert (=> b!111693 m!166423))

(declare-fun m!166427 () Bool)

(assert (=> b!111693 m!166427))

(declare-fun m!166429 () Bool)

(assert (=> b!111693 m!166429))

(assert (=> b!111693 m!166421))

(assert (=> d!34872 d!35534))

(declare-fun b!111708 () Bool)

(declare-fun e!73297 () Bool)

(declare-fun e!73295 () Bool)

(assert (=> b!111708 (= e!73297 e!73295)))

(declare-fun c!6795 () Bool)

(declare-datatypes ((tuple4!76 0))(
  ( (tuple4!77 (_1!4885 (_ BitVec 32)) (_2!4885 (_ BitVec 32)) (_3!259 (_ BitVec 32)) (_4!38 (_ BitVec 32))) )
))
(declare-fun lt!169530 () tuple4!76)

(assert (=> b!111708 (= c!6795 (= (_3!259 lt!169530) (_4!38 lt!169530)))))

(declare-fun e!73294 () Bool)

(declare-fun b!111709 () Bool)

(declare-fun arrayRangesEq!39 (array!5081 array!5081 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!111709 (= e!73294 (arrayRangesEq!39 (buf!2708 thiss!1305) (buf!2708 (_2!4865 lt!167643)) (_1!4885 lt!169530) (_2!4885 lt!169530)))))

(declare-fun b!111710 () Bool)

(declare-fun call!1412 () Bool)

(assert (=> b!111710 (= e!73295 call!1412)))

(declare-fun b!111711 () Bool)

(declare-fun e!73292 () Bool)

(assert (=> b!111711 (= e!73292 e!73297)))

(declare-fun res!92233 () Bool)

(assert (=> b!111711 (=> (not res!92233) (not e!73297))))

(assert (=> b!111711 (= res!92233 e!73294)))

(declare-fun res!92234 () Bool)

(assert (=> b!111711 (=> res!92234 e!73294)))

(assert (=> b!111711 (= res!92234 (bvsge (_1!4885 lt!169530) (_2!4885 lt!169530)))))

(declare-fun lt!169529 () (_ BitVec 32))

(assert (=> b!111711 (= lt!169529 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2311 (buf!2708 thiss!1305)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!169528 () (_ BitVec 32))

(assert (=> b!111711 (= lt!169528 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!76)

(assert (=> b!111711 (= lt!169530 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2311 (buf!2708 thiss!1305)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305))))))

(declare-fun b!111712 () Bool)

(declare-fun res!92232 () Bool)

(assert (=> b!111712 (= res!92232 (= lt!169529 #b00000000000000000000000000000000))))

(declare-fun e!73296 () Bool)

(assert (=> b!111712 (=> res!92232 e!73296)))

(declare-fun e!73293 () Bool)

(assert (=> b!111712 (= e!73293 e!73296)))

(declare-fun b!111713 () Bool)

(assert (=> b!111713 (= e!73295 e!73293)))

(declare-fun res!92236 () Bool)

(assert (=> b!111713 (= res!92236 call!1412)))

(assert (=> b!111713 (=> (not res!92236) (not e!73293))))

(declare-fun d!35536 () Bool)

(declare-fun res!92235 () Bool)

(assert (=> d!35536 (=> res!92235 e!73292)))

(assert (=> d!35536 (= res!92235 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2311 (buf!2708 thiss!1305)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305))))))

(assert (=> d!35536 (= (arrayBitRangesEq!0 (buf!2708 thiss!1305) (buf!2708 (_2!4865 lt!167643)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2311 (buf!2708 thiss!1305)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305))) e!73292)))

(declare-fun bm!1409 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!1409 (= call!1412 (byteRangesEq!0 (select (arr!2904 (buf!2708 thiss!1305)) (_3!259 lt!169530)) (select (arr!2904 (buf!2708 (_2!4865 lt!167643))) (_3!259 lt!169530)) lt!169528 (ite c!6795 lt!169529 #b00000000000000000000000000001000)))))

(declare-fun b!111714 () Bool)

(assert (=> b!111714 (= e!73296 (byteRangesEq!0 (select (arr!2904 (buf!2708 thiss!1305)) (_4!38 lt!169530)) (select (arr!2904 (buf!2708 (_2!4865 lt!167643))) (_4!38 lt!169530)) #b00000000000000000000000000000000 lt!169529))))

(assert (= (and d!35536 (not res!92235)) b!111711))

(assert (= (and b!111711 (not res!92234)) b!111709))

(assert (= (and b!111711 res!92233) b!111708))

(assert (= (and b!111708 c!6795) b!111710))

(assert (= (and b!111708 (not c!6795)) b!111713))

(assert (= (and b!111713 res!92236) b!111712))

(assert (= (and b!111712 (not res!92232)) b!111714))

(assert (= (or b!111710 b!111713) bm!1409))

(declare-fun m!166431 () Bool)

(assert (=> b!111709 m!166431))

(assert (=> b!111711 m!164351))

(declare-fun m!166433 () Bool)

(assert (=> b!111711 m!166433))

(declare-fun m!166435 () Bool)

(assert (=> bm!1409 m!166435))

(declare-fun m!166437 () Bool)

(assert (=> bm!1409 m!166437))

(assert (=> bm!1409 m!166435))

(assert (=> bm!1409 m!166437))

(declare-fun m!166439 () Bool)

(assert (=> bm!1409 m!166439))

(declare-fun m!166441 () Bool)

(assert (=> b!111714 m!166441))

(declare-fun m!166443 () Bool)

(assert (=> b!111714 m!166443))

(assert (=> b!111714 m!166441))

(assert (=> b!111714 m!166443))

(declare-fun m!166445 () Bool)

(assert (=> b!111714 m!166445))

(assert (=> b!110930 d!35536))

(assert (=> b!110930 d!34858))

(declare-fun b!111715 () Bool)

(declare-fun res!92239 () Bool)

(declare-fun e!73298 () Bool)

(assert (=> b!111715 (=> (not res!92239) (not e!73298))))

(declare-fun lt!169549 () tuple2!9220)

(assert (=> b!111715 (= res!92239 (isPrefixOf!0 (_1!4867 lt!169549) (_2!4865 lt!167626)))))

(declare-fun b!111716 () Bool)

(declare-fun e!73299 () Unit!6790)

(declare-fun Unit!6839 () Unit!6790)

(assert (=> b!111716 (= e!73299 Unit!6839)))

(declare-fun b!111717 () Bool)

(declare-fun lt!169539 () Unit!6790)

(assert (=> b!111717 (= e!73299 lt!169539)))

(declare-fun lt!169541 () (_ BitVec 64))

(assert (=> b!111717 (= lt!169541 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!169540 () (_ BitVec 64))

(assert (=> b!111717 (= lt!169540 (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!167626))) (currentByte!5265 (_2!4865 lt!167626)) (currentBit!5260 (_2!4865 lt!167626))))))

(assert (=> b!111717 (= lt!169539 (arrayBitRangesEqSymmetric!0 (buf!2708 (_2!4865 lt!167626)) (buf!2708 (_2!4865 lt!168334)) lt!169541 lt!169540))))

(assert (=> b!111717 (arrayBitRangesEq!0 (buf!2708 (_2!4865 lt!168334)) (buf!2708 (_2!4865 lt!167626)) lt!169541 lt!169540)))

(declare-fun b!111718 () Bool)

(declare-fun res!92238 () Bool)

(assert (=> b!111718 (=> (not res!92238) (not e!73298))))

(assert (=> b!111718 (= res!92238 (isPrefixOf!0 (_2!4867 lt!169549) (_2!4865 lt!168334)))))

(declare-fun d!35538 () Bool)

(assert (=> d!35538 e!73298))

(declare-fun res!92237 () Bool)

(assert (=> d!35538 (=> (not res!92237) (not e!73298))))

(assert (=> d!35538 (= res!92237 (isPrefixOf!0 (_1!4867 lt!169549) (_2!4867 lt!169549)))))

(declare-fun lt!169537 () BitStream!4096)

(assert (=> d!35538 (= lt!169549 (tuple2!9221 lt!169537 (_2!4865 lt!168334)))))

(declare-fun lt!169546 () Unit!6790)

(declare-fun lt!169542 () Unit!6790)

(assert (=> d!35538 (= lt!169546 lt!169542)))

(assert (=> d!35538 (isPrefixOf!0 lt!169537 (_2!4865 lt!168334))))

(assert (=> d!35538 (= lt!169542 (lemmaIsPrefixTransitive!0 lt!169537 (_2!4865 lt!168334) (_2!4865 lt!168334)))))

(declare-fun lt!169533 () Unit!6790)

(declare-fun lt!169538 () Unit!6790)

(assert (=> d!35538 (= lt!169533 lt!169538)))

(assert (=> d!35538 (isPrefixOf!0 lt!169537 (_2!4865 lt!168334))))

(assert (=> d!35538 (= lt!169538 (lemmaIsPrefixTransitive!0 lt!169537 (_2!4865 lt!167626) (_2!4865 lt!168334)))))

(declare-fun lt!169545 () Unit!6790)

(assert (=> d!35538 (= lt!169545 e!73299)))

(declare-fun c!6796 () Bool)

(assert (=> d!35538 (= c!6796 (not (= (size!2311 (buf!2708 (_2!4865 lt!167626))) #b00000000000000000000000000000000)))))

(declare-fun lt!169547 () Unit!6790)

(declare-fun lt!169544 () Unit!6790)

(assert (=> d!35538 (= lt!169547 lt!169544)))

(assert (=> d!35538 (isPrefixOf!0 (_2!4865 lt!168334) (_2!4865 lt!168334))))

(assert (=> d!35538 (= lt!169544 (lemmaIsPrefixRefl!0 (_2!4865 lt!168334)))))

(declare-fun lt!169550 () Unit!6790)

(declare-fun lt!169532 () Unit!6790)

(assert (=> d!35538 (= lt!169550 lt!169532)))

(assert (=> d!35538 (= lt!169532 (lemmaIsPrefixRefl!0 (_2!4865 lt!168334)))))

(declare-fun lt!169543 () Unit!6790)

(declare-fun lt!169548 () Unit!6790)

(assert (=> d!35538 (= lt!169543 lt!169548)))

(assert (=> d!35538 (isPrefixOf!0 lt!169537 lt!169537)))

(assert (=> d!35538 (= lt!169548 (lemmaIsPrefixRefl!0 lt!169537))))

(declare-fun lt!169534 () Unit!6790)

(declare-fun lt!169531 () Unit!6790)

(assert (=> d!35538 (= lt!169534 lt!169531)))

(assert (=> d!35538 (isPrefixOf!0 (_2!4865 lt!167626) (_2!4865 lt!167626))))

(assert (=> d!35538 (= lt!169531 (lemmaIsPrefixRefl!0 (_2!4865 lt!167626)))))

(assert (=> d!35538 (= lt!169537 (BitStream!4097 (buf!2708 (_2!4865 lt!168334)) (currentByte!5265 (_2!4865 lt!167626)) (currentBit!5260 (_2!4865 lt!167626))))))

(assert (=> d!35538 (isPrefixOf!0 (_2!4865 lt!167626) (_2!4865 lt!168334))))

(assert (=> d!35538 (= (reader!0 (_2!4865 lt!167626) (_2!4865 lt!168334)) lt!169549)))

(declare-fun b!111719 () Bool)

(declare-fun lt!169535 () (_ BitVec 64))

(declare-fun lt!169536 () (_ BitVec 64))

(assert (=> b!111719 (= e!73298 (= (_1!4867 lt!169549) (withMovedBitIndex!0 (_2!4867 lt!169549) (bvsub lt!169536 lt!169535))))))

(assert (=> b!111719 (or (= (bvand lt!169536 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!169535 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!169536 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!169536 lt!169535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!111719 (= lt!169535 (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!168334))) (currentByte!5265 (_2!4865 lt!168334)) (currentBit!5260 (_2!4865 lt!168334))))))

(assert (=> b!111719 (= lt!169536 (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!167626))) (currentByte!5265 (_2!4865 lt!167626)) (currentBit!5260 (_2!4865 lt!167626))))))

(assert (= (and d!35538 c!6796) b!111717))

(assert (= (and d!35538 (not c!6796)) b!111716))

(assert (= (and d!35538 res!92237) b!111715))

(assert (= (and b!111715 res!92239) b!111718))

(assert (= (and b!111718 res!92238) b!111719))

(declare-fun m!166447 () Bool)

(assert (=> b!111718 m!166447))

(declare-fun m!166449 () Bool)

(assert (=> d!35538 m!166449))

(declare-fun m!166451 () Bool)

(assert (=> d!35538 m!166451))

(assert (=> d!35538 m!164925))

(declare-fun m!166453 () Bool)

(assert (=> d!35538 m!166453))

(declare-fun m!166455 () Bool)

(assert (=> d!35538 m!166455))

(declare-fun m!166457 () Bool)

(assert (=> d!35538 m!166457))

(declare-fun m!166459 () Bool)

(assert (=> d!35538 m!166459))

(declare-fun m!166461 () Bool)

(assert (=> d!35538 m!166461))

(declare-fun m!166463 () Bool)

(assert (=> d!35538 m!166463))

(declare-fun m!166465 () Bool)

(assert (=> d!35538 m!166465))

(assert (=> d!35538 m!164937))

(declare-fun m!166467 () Bool)

(assert (=> b!111715 m!166467))

(declare-fun m!166469 () Bool)

(assert (=> b!111719 m!166469))

(assert (=> b!111719 m!164835))

(assert (=> b!111719 m!164349))

(assert (=> b!111717 m!164349))

(declare-fun m!166471 () Bool)

(assert (=> b!111717 m!166471))

(declare-fun m!166473 () Bool)

(assert (=> b!111717 m!166473))

(assert (=> b!111044 d!35538))

(declare-fun d!35540 () Bool)

(assert (=> d!35540 (validate_offset_bits!1 ((_ sign_extend 32) (size!2311 (buf!2708 (_2!4865 lt!168334)))) ((_ sign_extend 32) (currentByte!5265 (_2!4865 lt!167626))) ((_ sign_extend 32) (currentBit!5260 (_2!4865 lt!167626))) lt!168335)))

(declare-fun lt!169551 () Unit!6790)

(assert (=> d!35540 (= lt!169551 (choose!9 (_2!4865 lt!167626) (buf!2708 (_2!4865 lt!168334)) lt!168335 (BitStream!4097 (buf!2708 (_2!4865 lt!168334)) (currentByte!5265 (_2!4865 lt!167626)) (currentBit!5260 (_2!4865 lt!167626)))))))

(assert (=> d!35540 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4865 lt!167626) (buf!2708 (_2!4865 lt!168334)) lt!168335) lt!169551)))

(declare-fun bs!8671 () Bool)

(assert (= bs!8671 d!35540))

(assert (=> bs!8671 m!164863))

(declare-fun m!166475 () Bool)

(assert (=> bs!8671 m!166475))

(assert (=> b!111044 d!35540))

(declare-fun b!111720 () Bool)

(declare-fun res!92243 () Bool)

(declare-fun e!73301 () Bool)

(assert (=> b!111720 (=> (not res!92243) (not e!73301))))

(declare-fun lt!169554 () (_ BitVec 64))

(declare-fun lt!169555 () (_ BitVec 64))

(declare-fun lt!169552 () tuple2!9216)

(assert (=> b!111720 (= res!92243 (= (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!169552))) (currentByte!5265 (_2!4865 lt!169552)) (currentBit!5260 (_2!4865 lt!169552))) (bvadd lt!169554 lt!169555)))))

(assert (=> b!111720 (or (not (= (bvand lt!169554 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!169555 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!169554 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!169554 lt!169555) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!111720 (= lt!169555 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!111720 (= lt!169554 (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!167626))) (currentByte!5265 (_2!4865 lt!167626)) (currentBit!5260 (_2!4865 lt!167626))))))

(declare-fun b!111721 () Bool)

(declare-fun res!92242 () Bool)

(assert (=> b!111721 (=> (not res!92242) (not e!73301))))

(assert (=> b!111721 (= res!92242 (isPrefixOf!0 (_2!4865 lt!167626) (_2!4865 lt!169552)))))

(declare-fun d!35542 () Bool)

(assert (=> d!35542 e!73301))

(declare-fun res!92240 () Bool)

(assert (=> d!35542 (=> (not res!92240) (not e!73301))))

(assert (=> d!35542 (= res!92240 (= (size!2311 (buf!2708 (_2!4865 lt!167626))) (size!2311 (buf!2708 (_2!4865 lt!169552)))))))

(assert (=> d!35542 (= lt!169552 (choose!16 (_2!4865 lt!167626) lt!168308))))

(assert (=> d!35542 (validate_offset_bit!0 ((_ sign_extend 32) (size!2311 (buf!2708 (_2!4865 lt!167626)))) ((_ sign_extend 32) (currentByte!5265 (_2!4865 lt!167626))) ((_ sign_extend 32) (currentBit!5260 (_2!4865 lt!167626))))))

(assert (=> d!35542 (= (appendBit!0 (_2!4865 lt!167626) lt!168308) lt!169552)))

(declare-fun b!111723 () Bool)

(declare-fun e!73300 () Bool)

(declare-fun lt!169553 () tuple2!9218)

(assert (=> b!111723 (= e!73300 (= (bitIndex!0 (size!2311 (buf!2708 (_1!4866 lt!169553))) (currentByte!5265 (_1!4866 lt!169553)) (currentBit!5260 (_1!4866 lt!169553))) (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!169552))) (currentByte!5265 (_2!4865 lt!169552)) (currentBit!5260 (_2!4865 lt!169552)))))))

(declare-fun b!111722 () Bool)

(assert (=> b!111722 (= e!73301 e!73300)))

(declare-fun res!92241 () Bool)

(assert (=> b!111722 (=> (not res!92241) (not e!73300))))

(assert (=> b!111722 (= res!92241 (and (= (_2!4866 lt!169553) lt!168308) (= (_1!4866 lt!169553) (_2!4865 lt!169552))))))

(assert (=> b!111722 (= lt!169553 (readBitPure!0 (readerFrom!0 (_2!4865 lt!169552) (currentBit!5260 (_2!4865 lt!167626)) (currentByte!5265 (_2!4865 lt!167626)))))))

(assert (= (and d!35542 res!92240) b!111720))

(assert (= (and b!111720 res!92243) b!111721))

(assert (= (and b!111721 res!92242) b!111722))

(assert (= (and b!111722 res!92241) b!111723))

(declare-fun m!166477 () Bool)

(assert (=> d!35542 m!166477))

(declare-fun m!166479 () Bool)

(assert (=> d!35542 m!166479))

(declare-fun m!166481 () Bool)

(assert (=> b!111723 m!166481))

(declare-fun m!166483 () Bool)

(assert (=> b!111723 m!166483))

(declare-fun m!166485 () Bool)

(assert (=> b!111722 m!166485))

(assert (=> b!111722 m!166485))

(declare-fun m!166487 () Bool)

(assert (=> b!111722 m!166487))

(assert (=> b!111720 m!166483))

(assert (=> b!111720 m!164349))

(declare-fun m!166489 () Bool)

(assert (=> b!111721 m!166489))

(assert (=> b!111044 d!35542))

(declare-fun b!111724 () Bool)

(declare-fun res!92246 () Bool)

(declare-fun e!73302 () Bool)

(assert (=> b!111724 (=> (not res!92246) (not e!73302))))

(declare-fun lt!169574 () tuple2!9220)

(assert (=> b!111724 (= res!92246 (isPrefixOf!0 (_1!4867 lt!169574) (_2!4865 lt!168326)))))

(declare-fun b!111725 () Bool)

(declare-fun e!73303 () Unit!6790)

(declare-fun Unit!6840 () Unit!6790)

(assert (=> b!111725 (= e!73303 Unit!6840)))

(declare-fun b!111726 () Bool)

(declare-fun lt!169564 () Unit!6790)

(assert (=> b!111726 (= e!73303 lt!169564)))

(declare-fun lt!169566 () (_ BitVec 64))

(assert (=> b!111726 (= lt!169566 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!169565 () (_ BitVec 64))

(assert (=> b!111726 (= lt!169565 (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!168326))) (currentByte!5265 (_2!4865 lt!168326)) (currentBit!5260 (_2!4865 lt!168326))))))

(assert (=> b!111726 (= lt!169564 (arrayBitRangesEqSymmetric!0 (buf!2708 (_2!4865 lt!168326)) (buf!2708 (_2!4865 lt!168334)) lt!169566 lt!169565))))

(assert (=> b!111726 (arrayBitRangesEq!0 (buf!2708 (_2!4865 lt!168334)) (buf!2708 (_2!4865 lt!168326)) lt!169566 lt!169565)))

(declare-fun b!111727 () Bool)

(declare-fun res!92245 () Bool)

(assert (=> b!111727 (=> (not res!92245) (not e!73302))))

(assert (=> b!111727 (= res!92245 (isPrefixOf!0 (_2!4867 lt!169574) (_2!4865 lt!168334)))))

(declare-fun d!35544 () Bool)

(assert (=> d!35544 e!73302))

(declare-fun res!92244 () Bool)

(assert (=> d!35544 (=> (not res!92244) (not e!73302))))

(assert (=> d!35544 (= res!92244 (isPrefixOf!0 (_1!4867 lt!169574) (_2!4867 lt!169574)))))

(declare-fun lt!169562 () BitStream!4096)

(assert (=> d!35544 (= lt!169574 (tuple2!9221 lt!169562 (_2!4865 lt!168334)))))

(declare-fun lt!169571 () Unit!6790)

(declare-fun lt!169567 () Unit!6790)

(assert (=> d!35544 (= lt!169571 lt!169567)))

(assert (=> d!35544 (isPrefixOf!0 lt!169562 (_2!4865 lt!168334))))

(assert (=> d!35544 (= lt!169567 (lemmaIsPrefixTransitive!0 lt!169562 (_2!4865 lt!168334) (_2!4865 lt!168334)))))

(declare-fun lt!169558 () Unit!6790)

(declare-fun lt!169563 () Unit!6790)

(assert (=> d!35544 (= lt!169558 lt!169563)))

(assert (=> d!35544 (isPrefixOf!0 lt!169562 (_2!4865 lt!168334))))

(assert (=> d!35544 (= lt!169563 (lemmaIsPrefixTransitive!0 lt!169562 (_2!4865 lt!168326) (_2!4865 lt!168334)))))

(declare-fun lt!169570 () Unit!6790)

(assert (=> d!35544 (= lt!169570 e!73303)))

(declare-fun c!6797 () Bool)

(assert (=> d!35544 (= c!6797 (not (= (size!2311 (buf!2708 (_2!4865 lt!168326))) #b00000000000000000000000000000000)))))

(declare-fun lt!169572 () Unit!6790)

(declare-fun lt!169569 () Unit!6790)

(assert (=> d!35544 (= lt!169572 lt!169569)))

(assert (=> d!35544 (isPrefixOf!0 (_2!4865 lt!168334) (_2!4865 lt!168334))))

(assert (=> d!35544 (= lt!169569 (lemmaIsPrefixRefl!0 (_2!4865 lt!168334)))))

(declare-fun lt!169575 () Unit!6790)

(declare-fun lt!169557 () Unit!6790)

(assert (=> d!35544 (= lt!169575 lt!169557)))

(assert (=> d!35544 (= lt!169557 (lemmaIsPrefixRefl!0 (_2!4865 lt!168334)))))

(declare-fun lt!169568 () Unit!6790)

(declare-fun lt!169573 () Unit!6790)

(assert (=> d!35544 (= lt!169568 lt!169573)))

(assert (=> d!35544 (isPrefixOf!0 lt!169562 lt!169562)))

(assert (=> d!35544 (= lt!169573 (lemmaIsPrefixRefl!0 lt!169562))))

(declare-fun lt!169559 () Unit!6790)

(declare-fun lt!169556 () Unit!6790)

(assert (=> d!35544 (= lt!169559 lt!169556)))

(assert (=> d!35544 (isPrefixOf!0 (_2!4865 lt!168326) (_2!4865 lt!168326))))

(assert (=> d!35544 (= lt!169556 (lemmaIsPrefixRefl!0 (_2!4865 lt!168326)))))

(assert (=> d!35544 (= lt!169562 (BitStream!4097 (buf!2708 (_2!4865 lt!168334)) (currentByte!5265 (_2!4865 lt!168326)) (currentBit!5260 (_2!4865 lt!168326))))))

(assert (=> d!35544 (isPrefixOf!0 (_2!4865 lt!168326) (_2!4865 lt!168334))))

(assert (=> d!35544 (= (reader!0 (_2!4865 lt!168326) (_2!4865 lt!168334)) lt!169574)))

(declare-fun b!111728 () Bool)

(declare-fun lt!169560 () (_ BitVec 64))

(declare-fun lt!169561 () (_ BitVec 64))

(assert (=> b!111728 (= e!73302 (= (_1!4867 lt!169574) (withMovedBitIndex!0 (_2!4867 lt!169574) (bvsub lt!169561 lt!169560))))))

(assert (=> b!111728 (or (= (bvand lt!169561 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!169560 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!169561 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!169561 lt!169560) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!111728 (= lt!169560 (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!168334))) (currentByte!5265 (_2!4865 lt!168334)) (currentBit!5260 (_2!4865 lt!168334))))))

(assert (=> b!111728 (= lt!169561 (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!168326))) (currentByte!5265 (_2!4865 lt!168326)) (currentBit!5260 (_2!4865 lt!168326))))))

(assert (= (and d!35544 c!6797) b!111726))

(assert (= (and d!35544 (not c!6797)) b!111725))

(assert (= (and d!35544 res!92244) b!111724))

(assert (= (and b!111724 res!92246) b!111727))

(assert (= (and b!111727 res!92245) b!111728))

(declare-fun m!166491 () Bool)

(assert (=> b!111727 m!166491))

(declare-fun m!166493 () Bool)

(assert (=> d!35544 m!166493))

(declare-fun m!166495 () Bool)

(assert (=> d!35544 m!166495))

(declare-fun m!166497 () Bool)

(assert (=> d!35544 m!166497))

(assert (=> d!35544 m!166453))

(declare-fun m!166499 () Bool)

(assert (=> d!35544 m!166499))

(assert (=> d!35544 m!166457))

(declare-fun m!166501 () Bool)

(assert (=> d!35544 m!166501))

(declare-fun m!166503 () Bool)

(assert (=> d!35544 m!166503))

(declare-fun m!166505 () Bool)

(assert (=> d!35544 m!166505))

(declare-fun m!166507 () Bool)

(assert (=> d!35544 m!166507))

(declare-fun m!166509 () Bool)

(assert (=> d!35544 m!166509))

(declare-fun m!166511 () Bool)

(assert (=> b!111724 m!166511))

(declare-fun m!166513 () Bool)

(assert (=> b!111728 m!166513))

(assert (=> b!111728 m!164835))

(assert (=> b!111728 m!164847))

(assert (=> b!111726 m!164847))

(declare-fun m!166515 () Bool)

(assert (=> b!111726 m!166515))

(declare-fun m!166517 () Bool)

(assert (=> b!111726 m!166517))

(assert (=> b!111044 d!35544))

(declare-fun d!35546 () Bool)

(declare-fun lt!169576 () tuple2!9244)

(assert (=> d!35546 (= lt!169576 (readNLeastSignificantBitsLoop!0 (withMovedBitIndex!0 (_1!4867 lt!168331) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!168310 e!72861)))))

(assert (=> d!35546 (= (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4867 lt!168331) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!168310 e!72861)) (tuple2!9223 (_2!4879 lt!169576) (_1!4879 lt!169576)))))

(declare-fun bs!8672 () Bool)

(assert (= bs!8672 d!35546))

(assert (=> bs!8672 m!164871))

(declare-fun m!166519 () Bool)

(assert (=> bs!8672 m!166519))

(assert (=> b!111044 d!35546))

(declare-fun d!35548 () Bool)

(assert (=> d!35548 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2311 (buf!2708 (_2!4865 lt!168334)))) ((_ sign_extend 32) (currentByte!5265 (_2!4865 lt!167626))) ((_ sign_extend 32) (currentBit!5260 (_2!4865 lt!167626))) lt!168335) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2311 (buf!2708 (_2!4865 lt!168334)))) ((_ sign_extend 32) (currentByte!5265 (_2!4865 lt!167626))) ((_ sign_extend 32) (currentBit!5260 (_2!4865 lt!167626)))) lt!168335))))

(declare-fun bs!8673 () Bool)

(assert (= bs!8673 d!35548))

(declare-fun m!166521 () Bool)

(assert (=> bs!8673 m!166521))

(assert (=> b!111044 d!35548))

(declare-fun d!35550 () Bool)

(declare-fun lt!169577 () tuple2!9240)

(assert (=> d!35550 (= lt!169577 (readBit!0 lt!168319))))

(assert (=> d!35550 (= (readBitPure!0 lt!168319) (tuple2!9219 (_2!4877 lt!169577) (_1!4877 lt!169577)))))

(declare-fun bs!8674 () Bool)

(assert (= bs!8674 d!35550))

(declare-fun m!166523 () Bool)

(assert (=> bs!8674 m!166523))

(assert (=> b!111044 d!35550))

(assert (=> b!111044 d!35478))

(assert (=> b!111044 d!34856))

(declare-fun d!35552 () Bool)

(declare-fun e!73304 () Bool)

(assert (=> d!35552 e!73304))

(declare-fun res!92247 () Bool)

(assert (=> d!35552 (=> (not res!92247) (not e!73304))))

(declare-fun lt!169578 () tuple2!9218)

(declare-fun lt!169580 () tuple2!9218)

(assert (=> d!35552 (= res!92247 (= (bitIndex!0 (size!2311 (buf!2708 (_1!4866 lt!169578))) (currentByte!5265 (_1!4866 lt!169578)) (currentBit!5260 (_1!4866 lt!169578))) (bitIndex!0 (size!2311 (buf!2708 (_1!4866 lt!169580))) (currentByte!5265 (_1!4866 lt!169580)) (currentBit!5260 (_1!4866 lt!169580)))))))

(declare-fun lt!169581 () BitStream!4096)

(declare-fun lt!169579 () Unit!6790)

(assert (=> d!35552 (= lt!169579 (choose!50 lt!168336 (_2!4865 lt!168334) lt!169581 lt!169578 (tuple2!9219 (_1!4866 lt!169578) (_2!4866 lt!169578)) (_1!4866 lt!169578) (_2!4866 lt!169578) lt!169580 (tuple2!9219 (_1!4866 lt!169580) (_2!4866 lt!169580)) (_1!4866 lt!169580) (_2!4866 lt!169580)))))

(assert (=> d!35552 (= lt!169580 (readBitPure!0 lt!169581))))

(assert (=> d!35552 (= lt!169578 (readBitPure!0 lt!168336))))

(assert (=> d!35552 (= lt!169581 (BitStream!4097 (buf!2708 (_2!4865 lt!168334)) (currentByte!5265 lt!168336) (currentBit!5260 lt!168336)))))

(assert (=> d!35552 (invariant!0 (currentBit!5260 lt!168336) (currentByte!5265 lt!168336) (size!2311 (buf!2708 (_2!4865 lt!168334))))))

(assert (=> d!35552 (= (readBitPrefixLemma!0 lt!168336 (_2!4865 lt!168334)) lt!169579)))

(declare-fun b!111729 () Bool)

(assert (=> b!111729 (= e!73304 (= (_2!4866 lt!169578) (_2!4866 lt!169580)))))

(assert (= (and d!35552 res!92247) b!111729))

(assert (=> d!35552 m!164849))

(assert (=> d!35552 m!164883))

(declare-fun m!166525 () Bool)

(assert (=> d!35552 m!166525))

(declare-fun m!166527 () Bool)

(assert (=> d!35552 m!166527))

(declare-fun m!166529 () Bool)

(assert (=> d!35552 m!166529))

(declare-fun m!166531 () Bool)

(assert (=> d!35552 m!166531))

(assert (=> b!111044 d!35552))

(declare-fun d!35554 () Bool)

(assert (=> d!35554 (= (invariant!0 (currentBit!5260 (_2!4865 lt!167626)) (currentByte!5265 (_2!4865 lt!167626)) (size!2311 (buf!2708 (_2!4865 lt!168326)))) (and (bvsge (currentBit!5260 (_2!4865 lt!167626)) #b00000000000000000000000000000000) (bvslt (currentBit!5260 (_2!4865 lt!167626)) #b00000000000000000000000000001000) (bvsge (currentByte!5265 (_2!4865 lt!167626)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5265 (_2!4865 lt!167626)) (size!2311 (buf!2708 (_2!4865 lt!168326)))) (and (= (currentBit!5260 (_2!4865 lt!167626)) #b00000000000000000000000000000000) (= (currentByte!5265 (_2!4865 lt!167626)) (size!2311 (buf!2708 (_2!4865 lt!168326))))))))))

(assert (=> b!111044 d!35554))

(declare-fun d!35556 () Bool)

(assert (=> d!35556 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2311 (buf!2708 (_2!4865 lt!168334)))) ((_ sign_extend 32) (currentByte!5265 (_2!4865 lt!168326))) ((_ sign_extend 32) (currentBit!5260 (_2!4865 lt!168326))) lt!168341) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2311 (buf!2708 (_2!4865 lt!168334)))) ((_ sign_extend 32) (currentByte!5265 (_2!4865 lt!168326))) ((_ sign_extend 32) (currentBit!5260 (_2!4865 lt!168326)))) lt!168341))))

(declare-fun bs!8675 () Bool)

(assert (= bs!8675 d!35556))

(declare-fun m!166533 () Bool)

(assert (=> bs!8675 m!166533))

(assert (=> b!111044 d!35556))

(declare-fun d!35558 () Bool)

(declare-fun e!73305 () Bool)

(assert (=> d!35558 e!73305))

(declare-fun res!92248 () Bool)

(assert (=> d!35558 (=> (not res!92248) (not e!73305))))

(declare-fun lt!169586 () (_ BitVec 64))

(declare-fun lt!169587 () (_ BitVec 64))

(declare-fun lt!169584 () (_ BitVec 64))

(assert (=> d!35558 (= res!92248 (= lt!169587 (bvsub lt!169586 lt!169584)))))

(assert (=> d!35558 (or (= (bvand lt!169586 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!169584 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!169586 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!169586 lt!169584) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35558 (= lt!169584 (remainingBits!0 ((_ sign_extend 32) (size!2311 (buf!2708 (_1!4866 lt!168337)))) ((_ sign_extend 32) (currentByte!5265 (_1!4866 lt!168337))) ((_ sign_extend 32) (currentBit!5260 (_1!4866 lt!168337)))))))

(declare-fun lt!169585 () (_ BitVec 64))

(declare-fun lt!169583 () (_ BitVec 64))

(assert (=> d!35558 (= lt!169586 (bvmul lt!169585 lt!169583))))

(assert (=> d!35558 (or (= lt!169585 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!169583 (bvsdiv (bvmul lt!169585 lt!169583) lt!169585)))))

(assert (=> d!35558 (= lt!169583 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35558 (= lt!169585 ((_ sign_extend 32) (size!2311 (buf!2708 (_1!4866 lt!168337)))))))

(assert (=> d!35558 (= lt!169587 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5265 (_1!4866 lt!168337))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5260 (_1!4866 lt!168337)))))))

(assert (=> d!35558 (invariant!0 (currentBit!5260 (_1!4866 lt!168337)) (currentByte!5265 (_1!4866 lt!168337)) (size!2311 (buf!2708 (_1!4866 lt!168337))))))

(assert (=> d!35558 (= (bitIndex!0 (size!2311 (buf!2708 (_1!4866 lt!168337))) (currentByte!5265 (_1!4866 lt!168337)) (currentBit!5260 (_1!4866 lt!168337))) lt!169587)))

(declare-fun b!111730 () Bool)

(declare-fun res!92249 () Bool)

(assert (=> b!111730 (=> (not res!92249) (not e!73305))))

(assert (=> b!111730 (= res!92249 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!169587))))

(declare-fun b!111731 () Bool)

(declare-fun lt!169582 () (_ BitVec 64))

(assert (=> b!111731 (= e!73305 (bvsle lt!169587 (bvmul lt!169582 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!111731 (or (= lt!169582 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!169582 #b0000000000000000000000000000000000000000000000000000000000001000) lt!169582)))))

(assert (=> b!111731 (= lt!169582 ((_ sign_extend 32) (size!2311 (buf!2708 (_1!4866 lt!168337)))))))

(assert (= (and d!35558 res!92248) b!111730))

(assert (= (and b!111730 res!92249) b!111731))

(declare-fun m!166535 () Bool)

(assert (=> d!35558 m!166535))

(declare-fun m!166537 () Bool)

(assert (=> d!35558 m!166537))

(assert (=> b!111044 d!35558))

(declare-fun d!35560 () Bool)

(declare-fun lt!169588 () tuple2!9240)

(assert (=> d!35560 (= lt!169588 (readBit!0 lt!168336))))

(assert (=> d!35560 (= (readBitPure!0 lt!168336) (tuple2!9219 (_2!4877 lt!169588) (_1!4877 lt!169588)))))

(declare-fun bs!8676 () Bool)

(assert (= bs!8676 d!35560))

(declare-fun m!166539 () Bool)

(assert (=> bs!8676 m!166539))

(assert (=> b!111044 d!35560))

(declare-fun d!35562 () Bool)

(declare-fun e!73308 () Bool)

(assert (=> d!35562 e!73308))

(declare-fun res!92252 () Bool)

(assert (=> d!35562 (=> (not res!92252) (not e!73308))))

(declare-fun lt!169593 () BitStream!4096)

(declare-fun lt!169594 () (_ BitVec 64))

(assert (=> d!35562 (= res!92252 (= (bvadd lt!169594 (bvsub (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!167626))) (currentByte!5265 (_2!4865 lt!167626)) (currentBit!5260 (_2!4865 lt!167626))) (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!168334))) (currentByte!5265 (_2!4865 lt!168334)) (currentBit!5260 (_2!4865 lt!168334))))) (bitIndex!0 (size!2311 (buf!2708 lt!169593)) (currentByte!5265 lt!169593) (currentBit!5260 lt!169593))))))

(assert (=> d!35562 (or (not (= (bvand lt!169594 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!167626))) (currentByte!5265 (_2!4865 lt!167626)) (currentBit!5260 (_2!4865 lt!167626))) (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!168334))) (currentByte!5265 (_2!4865 lt!168334)) (currentBit!5260 (_2!4865 lt!168334)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!169594 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!169594 (bvsub (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!167626))) (currentByte!5265 (_2!4865 lt!167626)) (currentBit!5260 (_2!4865 lt!167626))) (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!168334))) (currentByte!5265 (_2!4865 lt!168334)) (currentBit!5260 (_2!4865 lt!168334))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35562 (= lt!169594 (bitIndex!0 (size!2311 (buf!2708 (_2!4867 lt!168331))) (currentByte!5265 (_2!4867 lt!168331)) (currentBit!5260 (_2!4867 lt!168331))))))

(declare-fun moveBitIndex!0 (BitStream!4096 (_ BitVec 64)) tuple2!9216)

(assert (=> d!35562 (= lt!169593 (_2!4865 (moveBitIndex!0 (_2!4867 lt!168331) (bvsub (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!167626))) (currentByte!5265 (_2!4865 lt!167626)) (currentBit!5260 (_2!4865 lt!167626))) (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!168334))) (currentByte!5265 (_2!4865 lt!168334)) (currentBit!5260 (_2!4865 lt!168334)))))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!4096 (_ BitVec 64)) Bool)

(assert (=> d!35562 (moveBitIndexPrecond!0 (_2!4867 lt!168331) (bvsub (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!167626))) (currentByte!5265 (_2!4865 lt!167626)) (currentBit!5260 (_2!4865 lt!167626))) (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!168334))) (currentByte!5265 (_2!4865 lt!168334)) (currentBit!5260 (_2!4865 lt!168334)))))))

(assert (=> d!35562 (= (withMovedBitIndex!0 (_2!4867 lt!168331) (bvsub (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!167626))) (currentByte!5265 (_2!4865 lt!167626)) (currentBit!5260 (_2!4865 lt!167626))) (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!168334))) (currentByte!5265 (_2!4865 lt!168334)) (currentBit!5260 (_2!4865 lt!168334))))) lt!169593)))

(declare-fun b!111734 () Bool)

(assert (=> b!111734 (= e!73308 (= (size!2311 (buf!2708 (_2!4867 lt!168331))) (size!2311 (buf!2708 lt!169593))))))

(assert (= (and d!35562 res!92252) b!111734))

(declare-fun m!166541 () Bool)

(assert (=> d!35562 m!166541))

(declare-fun m!166543 () Bool)

(assert (=> d!35562 m!166543))

(declare-fun m!166545 () Bool)

(assert (=> d!35562 m!166545))

(declare-fun m!166547 () Bool)

(assert (=> d!35562 m!166547))

(assert (=> b!111044 d!35562))

(declare-fun d!35564 () Bool)

(declare-fun e!73309 () Bool)

(assert (=> d!35564 e!73309))

(declare-fun res!92253 () Bool)

(assert (=> d!35564 (=> (not res!92253) (not e!73309))))

(declare-fun lt!169595 () BitStream!4096)

(declare-fun lt!169596 () (_ BitVec 64))

(assert (=> d!35564 (= res!92253 (= (bvadd lt!169596 (bvsub (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!168326))) (currentByte!5265 (_2!4865 lt!168326)) (currentBit!5260 (_2!4865 lt!168326))) (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!168334))) (currentByte!5265 (_2!4865 lt!168334)) (currentBit!5260 (_2!4865 lt!168334))))) (bitIndex!0 (size!2311 (buf!2708 lt!169595)) (currentByte!5265 lt!169595) (currentBit!5260 lt!169595))))))

(assert (=> d!35564 (or (not (= (bvand lt!169596 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!168326))) (currentByte!5265 (_2!4865 lt!168326)) (currentBit!5260 (_2!4865 lt!168326))) (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!168334))) (currentByte!5265 (_2!4865 lt!168334)) (currentBit!5260 (_2!4865 lt!168334)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!169596 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!169596 (bvsub (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!168326))) (currentByte!5265 (_2!4865 lt!168326)) (currentBit!5260 (_2!4865 lt!168326))) (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!168334))) (currentByte!5265 (_2!4865 lt!168334)) (currentBit!5260 (_2!4865 lt!168334))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35564 (= lt!169596 (bitIndex!0 (size!2311 (buf!2708 (_2!4867 lt!168316))) (currentByte!5265 (_2!4867 lt!168316)) (currentBit!5260 (_2!4867 lt!168316))))))

(assert (=> d!35564 (= lt!169595 (_2!4865 (moveBitIndex!0 (_2!4867 lt!168316) (bvsub (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!168326))) (currentByte!5265 (_2!4865 lt!168326)) (currentBit!5260 (_2!4865 lt!168326))) (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!168334))) (currentByte!5265 (_2!4865 lt!168334)) (currentBit!5260 (_2!4865 lt!168334)))))))))

(assert (=> d!35564 (moveBitIndexPrecond!0 (_2!4867 lt!168316) (bvsub (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!168326))) (currentByte!5265 (_2!4865 lt!168326)) (currentBit!5260 (_2!4865 lt!168326))) (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!168334))) (currentByte!5265 (_2!4865 lt!168334)) (currentBit!5260 (_2!4865 lt!168334)))))))

(assert (=> d!35564 (= (withMovedBitIndex!0 (_2!4867 lt!168316) (bvsub (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!168326))) (currentByte!5265 (_2!4865 lt!168326)) (currentBit!5260 (_2!4865 lt!168326))) (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!168334))) (currentByte!5265 (_2!4865 lt!168334)) (currentBit!5260 (_2!4865 lt!168334))))) lt!169595)))

(declare-fun b!111735 () Bool)

(assert (=> b!111735 (= e!73309 (= (size!2311 (buf!2708 (_2!4867 lt!168316))) (size!2311 (buf!2708 lt!169595))))))

(assert (= (and d!35564 res!92253) b!111735))

(declare-fun m!166549 () Bool)

(assert (=> d!35564 m!166549))

(declare-fun m!166551 () Bool)

(assert (=> d!35564 m!166551))

(declare-fun m!166553 () Bool)

(assert (=> d!35564 m!166553))

(declare-fun m!166555 () Bool)

(assert (=> d!35564 m!166555))

(assert (=> b!111044 d!35564))

(declare-fun d!35566 () Bool)

(assert (=> d!35566 (validate_offset_bits!1 ((_ sign_extend 32) (size!2311 (buf!2708 (_2!4865 lt!168334)))) ((_ sign_extend 32) (currentByte!5265 (_2!4865 lt!168326))) ((_ sign_extend 32) (currentBit!5260 (_2!4865 lt!168326))) lt!168341)))

(declare-fun lt!169597 () Unit!6790)

(assert (=> d!35566 (= lt!169597 (choose!9 (_2!4865 lt!168326) (buf!2708 (_2!4865 lt!168334)) lt!168341 (BitStream!4097 (buf!2708 (_2!4865 lt!168334)) (currentByte!5265 (_2!4865 lt!168326)) (currentBit!5260 (_2!4865 lt!168326)))))))

(assert (=> d!35566 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4865 lt!168326) (buf!2708 (_2!4865 lt!168334)) lt!168341) lt!169597)))

(declare-fun bs!8677 () Bool)

(assert (= bs!8677 d!35566))

(assert (=> bs!8677 m!164881))

(declare-fun m!166557 () Bool)

(assert (=> bs!8677 m!166557))

(assert (=> b!111044 d!35566))

(declare-fun d!35568 () Bool)

(assert (=> d!35568 (= (invariant!0 (currentBit!5260 lt!168336) (currentByte!5265 lt!168336) (size!2311 (buf!2708 (_2!4865 lt!168334)))) (and (bvsge (currentBit!5260 lt!168336) #b00000000000000000000000000000000) (bvslt (currentBit!5260 lt!168336) #b00000000000000000000000000001000) (bvsge (currentByte!5265 lt!168336) #b00000000000000000000000000000000) (or (bvslt (currentByte!5265 lt!168336) (size!2311 (buf!2708 (_2!4865 lt!168334)))) (and (= (currentBit!5260 lt!168336) #b00000000000000000000000000000000) (= (currentByte!5265 lt!168336) (size!2311 (buf!2708 (_2!4865 lt!168334))))))))))

(assert (=> b!111044 d!35568))

(declare-fun d!35570 () Bool)

(declare-fun lt!169598 () tuple2!9240)

(assert (=> d!35570 (= lt!169598 (readBit!0 (_1!4867 lt!168331)))))

(assert (=> d!35570 (= (readBitPure!0 (_1!4867 lt!168331)) (tuple2!9219 (_2!4877 lt!169598) (_1!4877 lt!169598)))))

(declare-fun bs!8678 () Bool)

(assert (= bs!8678 d!35570))

(declare-fun m!166559 () Bool)

(assert (=> bs!8678 m!166559))

(assert (=> b!111044 d!35570))

(declare-fun d!35572 () Bool)

(declare-fun e!73310 () Bool)

(assert (=> d!35572 e!73310))

(declare-fun res!92254 () Bool)

(assert (=> d!35572 (=> (not res!92254) (not e!73310))))

(declare-fun lt!169604 () (_ BitVec 64))

(declare-fun lt!169603 () (_ BitVec 64))

(declare-fun lt!169601 () (_ BitVec 64))

(assert (=> d!35572 (= res!92254 (= lt!169604 (bvsub lt!169603 lt!169601)))))

(assert (=> d!35572 (or (= (bvand lt!169603 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!169601 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!169603 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!169603 lt!169601) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35572 (= lt!169601 (remainingBits!0 ((_ sign_extend 32) (size!2311 (buf!2708 (_1!4866 lt!168343)))) ((_ sign_extend 32) (currentByte!5265 (_1!4866 lt!168343))) ((_ sign_extend 32) (currentBit!5260 (_1!4866 lt!168343)))))))

(declare-fun lt!169602 () (_ BitVec 64))

(declare-fun lt!169600 () (_ BitVec 64))

(assert (=> d!35572 (= lt!169603 (bvmul lt!169602 lt!169600))))

(assert (=> d!35572 (or (= lt!169602 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!169600 (bvsdiv (bvmul lt!169602 lt!169600) lt!169602)))))

(assert (=> d!35572 (= lt!169600 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35572 (= lt!169602 ((_ sign_extend 32) (size!2311 (buf!2708 (_1!4866 lt!168343)))))))

(assert (=> d!35572 (= lt!169604 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5265 (_1!4866 lt!168343))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5260 (_1!4866 lt!168343)))))))

(assert (=> d!35572 (invariant!0 (currentBit!5260 (_1!4866 lt!168343)) (currentByte!5265 (_1!4866 lt!168343)) (size!2311 (buf!2708 (_1!4866 lt!168343))))))

(assert (=> d!35572 (= (bitIndex!0 (size!2311 (buf!2708 (_1!4866 lt!168343))) (currentByte!5265 (_1!4866 lt!168343)) (currentBit!5260 (_1!4866 lt!168343))) lt!169604)))

(declare-fun b!111736 () Bool)

(declare-fun res!92255 () Bool)

(assert (=> b!111736 (=> (not res!92255) (not e!73310))))

(assert (=> b!111736 (= res!92255 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!169604))))

(declare-fun b!111737 () Bool)

(declare-fun lt!169599 () (_ BitVec 64))

(assert (=> b!111737 (= e!73310 (bvsle lt!169604 (bvmul lt!169599 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!111737 (or (= lt!169599 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!169599 #b0000000000000000000000000000000000000000000000000000000000001000) lt!169599)))))

(assert (=> b!111737 (= lt!169599 ((_ sign_extend 32) (size!2311 (buf!2708 (_1!4866 lt!168343)))))))

(assert (= (and d!35572 res!92254) b!111736))

(assert (= (and b!111736 res!92255) b!111737))

(declare-fun m!166561 () Bool)

(assert (=> d!35572 m!166561))

(declare-fun m!166563 () Bool)

(assert (=> d!35572 m!166563))

(assert (=> b!111044 d!35572))

(declare-fun d!35574 () Bool)

(declare-fun e!73311 () Bool)

(assert (=> d!35574 e!73311))

(declare-fun res!92256 () Bool)

(assert (=> d!35574 (=> (not res!92256) (not e!73311))))

(declare-fun lt!169606 () (_ BitVec 64))

(declare-fun lt!169605 () BitStream!4096)

(assert (=> d!35574 (= res!92256 (= (bvadd lt!169606 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2311 (buf!2708 lt!169605)) (currentByte!5265 lt!169605) (currentBit!5260 lt!169605))))))

(assert (=> d!35574 (or (not (= (bvand lt!169606 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!169606 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!169606 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35574 (= lt!169606 (bitIndex!0 (size!2311 (buf!2708 (_1!4867 lt!168331))) (currentByte!5265 (_1!4867 lt!168331)) (currentBit!5260 (_1!4867 lt!168331))))))

(assert (=> d!35574 (= lt!169605 (_2!4865 (moveBitIndex!0 (_1!4867 lt!168331) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!35574 (moveBitIndexPrecond!0 (_1!4867 lt!168331) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!35574 (= (withMovedBitIndex!0 (_1!4867 lt!168331) #b0000000000000000000000000000000000000000000000000000000000000001) lt!169605)))

(declare-fun b!111738 () Bool)

(assert (=> b!111738 (= e!73311 (= (size!2311 (buf!2708 (_1!4867 lt!168331))) (size!2311 (buf!2708 lt!169605))))))

(assert (= (and d!35574 res!92256) b!111738))

(declare-fun m!166565 () Bool)

(assert (=> d!35574 m!166565))

(declare-fun m!166567 () Bool)

(assert (=> d!35574 m!166567))

(declare-fun m!166569 () Bool)

(assert (=> d!35574 m!166569))

(declare-fun m!166571 () Bool)

(assert (=> d!35574 m!166571))

(assert (=> b!111044 d!35574))

(declare-fun d!35576 () Bool)

(declare-fun e!73312 () Bool)

(assert (=> d!35576 e!73312))

(declare-fun res!92257 () Bool)

(assert (=> d!35576 (=> (not res!92257) (not e!73312))))

(declare-fun lt!169612 () (_ BitVec 64))

(declare-fun lt!169611 () (_ BitVec 64))

(declare-fun lt!169609 () (_ BitVec 64))

(assert (=> d!35576 (= res!92257 (= lt!169612 (bvsub lt!169611 lt!169609)))))

(assert (=> d!35576 (or (= (bvand lt!169611 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!169609 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!169611 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!169611 lt!169609) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35576 (= lt!169609 (remainingBits!0 ((_ sign_extend 32) (size!2311 (buf!2708 (_2!4865 lt!168326)))) ((_ sign_extend 32) (currentByte!5265 (_2!4865 lt!168326))) ((_ sign_extend 32) (currentBit!5260 (_2!4865 lt!168326)))))))

(declare-fun lt!169610 () (_ BitVec 64))

(declare-fun lt!169608 () (_ BitVec 64))

(assert (=> d!35576 (= lt!169611 (bvmul lt!169610 lt!169608))))

(assert (=> d!35576 (or (= lt!169610 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!169608 (bvsdiv (bvmul lt!169610 lt!169608) lt!169610)))))

(assert (=> d!35576 (= lt!169608 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35576 (= lt!169610 ((_ sign_extend 32) (size!2311 (buf!2708 (_2!4865 lt!168326)))))))

(assert (=> d!35576 (= lt!169612 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5265 (_2!4865 lt!168326))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5260 (_2!4865 lt!168326)))))))

(assert (=> d!35576 (invariant!0 (currentBit!5260 (_2!4865 lt!168326)) (currentByte!5265 (_2!4865 lt!168326)) (size!2311 (buf!2708 (_2!4865 lt!168326))))))

(assert (=> d!35576 (= (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!168326))) (currentByte!5265 (_2!4865 lt!168326)) (currentBit!5260 (_2!4865 lt!168326))) lt!169612)))

(declare-fun b!111739 () Bool)

(declare-fun res!92258 () Bool)

(assert (=> b!111739 (=> (not res!92258) (not e!73312))))

(assert (=> b!111739 (= res!92258 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!169612))))

(declare-fun b!111740 () Bool)

(declare-fun lt!169607 () (_ BitVec 64))

(assert (=> b!111740 (= e!73312 (bvsle lt!169612 (bvmul lt!169607 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!111740 (or (= lt!169607 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!169607 #b0000000000000000000000000000000000000000000000000000000000001000) lt!169607)))))

(assert (=> b!111740 (= lt!169607 ((_ sign_extend 32) (size!2311 (buf!2708 (_2!4865 lt!168326)))))))

(assert (= (and d!35576 res!92257) b!111739))

(assert (= (and b!111739 res!92258) b!111740))

(declare-fun m!166573 () Bool)

(assert (=> d!35576 m!166573))

(declare-fun m!166575 () Bool)

(assert (=> d!35576 m!166575))

(assert (=> b!111044 d!35576))

(declare-fun b!111741 () Bool)

(declare-fun lt!169617 () tuple2!9218)

(declare-fun lt!169620 () tuple2!9216)

(assert (=> b!111741 (= lt!169617 (readBitPure!0 (readerFrom!0 (_2!4865 lt!169620) (currentBit!5260 (_2!4865 lt!168326)) (currentByte!5265 (_2!4865 lt!168326)))))))

(declare-fun res!92264 () Bool)

(declare-fun lt!169613 () Bool)

(assert (=> b!111741 (= res!92264 (and (= (_2!4866 lt!169617) lt!169613) (= (_1!4866 lt!169617) (_2!4865 lt!169620))))))

(declare-fun e!73315 () Bool)

(assert (=> b!111741 (=> (not res!92264) (not e!73315))))

(declare-fun e!73316 () Bool)

(assert (=> b!111741 (= e!73316 e!73315)))

(declare-fun b!111742 () Bool)

(declare-fun res!92266 () Bool)

(declare-fun e!73314 () Bool)

(assert (=> b!111742 (=> (not res!92266) (not e!73314))))

(declare-fun lt!169643 () tuple2!9216)

(assert (=> b!111742 (= res!92266 (isPrefixOf!0 (_2!4865 lt!168326) (_2!4865 lt!169643)))))

(declare-fun b!111743 () Bool)

(declare-fun e!73319 () (_ BitVec 64))

(assert (=> b!111743 (= e!73319 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun d!35578 () Bool)

(assert (=> d!35578 e!73314))

(declare-fun res!92259 () Bool)

(assert (=> d!35578 (=> (not res!92259) (not e!73314))))

(assert (=> d!35578 (= res!92259 (= (size!2311 (buf!2708 (_2!4865 lt!168326))) (size!2311 (buf!2708 (_2!4865 lt!169643)))))))

(declare-fun e!73318 () tuple2!9216)

(assert (=> d!35578 (= lt!169643 e!73318)))

(declare-fun c!6799 () Bool)

(assert (=> d!35578 (= c!6799 (bvslt (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) nBits!396))))

(assert (=> d!35578 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) (bvsle (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!35578 (= (appendNLeastSignificantBitsLoop!0 (_2!4865 lt!168326) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) lt!169643)))

(declare-fun lt!169639 () tuple2!9216)

(declare-fun call!1413 () Bool)

(declare-fun bm!1410 () Bool)

(declare-fun lt!169651 () BitStream!4096)

(assert (=> bm!1410 (= call!1413 (isPrefixOf!0 (ite c!6799 (_2!4865 lt!168326) lt!169651) (ite c!6799 (_2!4865 lt!169639) lt!169651)))))

(declare-fun b!111744 () Bool)

(declare-fun e!73317 () Bool)

(declare-fun lt!169638 () (_ BitVec 64))

(assert (=> b!111744 (= e!73317 (validate_offset_bits!1 ((_ sign_extend 32) (size!2311 (buf!2708 (_2!4865 lt!168326)))) ((_ sign_extend 32) (currentByte!5265 (_2!4865 lt!168326))) ((_ sign_extend 32) (currentBit!5260 (_2!4865 lt!168326))) lt!169638))))

(declare-fun b!111745 () Bool)

(declare-fun e!73313 () Bool)

(declare-fun lt!169648 () tuple2!9218)

(declare-fun lt!169642 () tuple2!9218)

(assert (=> b!111745 (= e!73313 (= (_2!4866 lt!169648) (_2!4866 lt!169642)))))

(declare-fun b!111746 () Bool)

(assert (=> b!111746 (= e!73315 (= (bitIndex!0 (size!2311 (buf!2708 (_1!4866 lt!169617))) (currentByte!5265 (_1!4866 lt!169617)) (currentBit!5260 (_1!4866 lt!169617))) (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!169620))) (currentByte!5265 (_2!4865 lt!169620)) (currentBit!5260 (_2!4865 lt!169620)))))))

(declare-fun b!111747 () Bool)

(declare-fun res!92265 () Bool)

(assert (=> b!111747 (=> (not res!92265) (not e!73314))))

(declare-fun lt!169637 () (_ BitVec 64))

(declare-fun lt!169644 () (_ BitVec 64))

(assert (=> b!111747 (= res!92265 (= (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!169643))) (currentByte!5265 (_2!4865 lt!169643)) (currentBit!5260 (_2!4865 lt!169643))) (bvadd lt!169644 lt!169637)))))

(assert (=> b!111747 (or (not (= (bvand lt!169644 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!169637 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!169644 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!169644 lt!169637) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!111747 (= lt!169637 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))

(assert (=> b!111747 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!111747 (= lt!169644 (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!168326))) (currentByte!5265 (_2!4865 lt!168326)) (currentBit!5260 (_2!4865 lt!168326))))))

(declare-fun b!111748 () Bool)

(assert (=> b!111748 (= e!73319 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))))

(declare-fun b!111749 () Bool)

(declare-fun Unit!6841 () Unit!6790)

(assert (=> b!111749 (= e!73318 (tuple2!9217 Unit!6841 (_2!4865 lt!169639)))))

(assert (=> b!111749 (= lt!169613 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!111749 (= lt!169620 (appendBit!0 (_2!4865 lt!168326) lt!169613))))

(declare-fun res!92261 () Bool)

(assert (=> b!111749 (= res!92261 (= (size!2311 (buf!2708 (_2!4865 lt!168326))) (size!2311 (buf!2708 (_2!4865 lt!169620)))))))

(assert (=> b!111749 (=> (not res!92261) (not e!73316))))

(assert (=> b!111749 e!73316))

(declare-fun lt!169631 () tuple2!9216)

(assert (=> b!111749 (= lt!169631 lt!169620)))

(assert (=> b!111749 (= lt!169639 (appendNLeastSignificantBitsLoop!0 (_2!4865 lt!169631) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!169634 () Unit!6790)

(assert (=> b!111749 (= lt!169634 (lemmaIsPrefixTransitive!0 (_2!4865 lt!168326) (_2!4865 lt!169631) (_2!4865 lt!169639)))))

(assert (=> b!111749 call!1413))

(declare-fun lt!169656 () Unit!6790)

(assert (=> b!111749 (= lt!169656 lt!169634)))

(assert (=> b!111749 (invariant!0 (currentBit!5260 (_2!4865 lt!168326)) (currentByte!5265 (_2!4865 lt!168326)) (size!2311 (buf!2708 (_2!4865 lt!169631))))))

(declare-fun lt!169641 () BitStream!4096)

(assert (=> b!111749 (= lt!169641 (BitStream!4097 (buf!2708 (_2!4865 lt!169631)) (currentByte!5265 (_2!4865 lt!168326)) (currentBit!5260 (_2!4865 lt!168326))))))

(assert (=> b!111749 (invariant!0 (currentBit!5260 lt!169641) (currentByte!5265 lt!169641) (size!2311 (buf!2708 (_2!4865 lt!169639))))))

(declare-fun lt!169624 () BitStream!4096)

(assert (=> b!111749 (= lt!169624 (BitStream!4097 (buf!2708 (_2!4865 lt!169639)) (currentByte!5265 lt!169641) (currentBit!5260 lt!169641)))))

(assert (=> b!111749 (= lt!169648 (readBitPure!0 lt!169641))))

(assert (=> b!111749 (= lt!169642 (readBitPure!0 lt!169624))))

(declare-fun lt!169653 () Unit!6790)

(assert (=> b!111749 (= lt!169653 (readBitPrefixLemma!0 lt!169641 (_2!4865 lt!169639)))))

(declare-fun res!92262 () Bool)

(assert (=> b!111749 (= res!92262 (= (bitIndex!0 (size!2311 (buf!2708 (_1!4866 lt!169648))) (currentByte!5265 (_1!4866 lt!169648)) (currentBit!5260 (_1!4866 lt!169648))) (bitIndex!0 (size!2311 (buf!2708 (_1!4866 lt!169642))) (currentByte!5265 (_1!4866 lt!169642)) (currentBit!5260 (_1!4866 lt!169642)))))))

(assert (=> b!111749 (=> (not res!92262) (not e!73313))))

(assert (=> b!111749 e!73313))

(declare-fun lt!169622 () Unit!6790)

(assert (=> b!111749 (= lt!169622 lt!169653)))

(declare-fun lt!169636 () tuple2!9220)

(assert (=> b!111749 (= lt!169636 (reader!0 (_2!4865 lt!168326) (_2!4865 lt!169639)))))

(declare-fun lt!169621 () tuple2!9220)

(assert (=> b!111749 (= lt!169621 (reader!0 (_2!4865 lt!169631) (_2!4865 lt!169639)))))

(declare-fun lt!169635 () tuple2!9218)

(assert (=> b!111749 (= lt!169635 (readBitPure!0 (_1!4867 lt!169636)))))

(assert (=> b!111749 (= (_2!4866 lt!169635) lt!169613)))

(declare-fun lt!169626 () Unit!6790)

(declare-fun Unit!6842 () Unit!6790)

(assert (=> b!111749 (= lt!169626 Unit!6842)))

(declare-fun lt!169615 () (_ BitVec 64))

(assert (=> b!111749 (= lt!169615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))))

(declare-fun lt!169640 () (_ BitVec 64))

(assert (=> b!111749 (= lt!169640 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))

(declare-fun lt!169655 () Unit!6790)

(assert (=> b!111749 (= lt!169655 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4865 lt!168326) (buf!2708 (_2!4865 lt!169639)) lt!169640))))

(assert (=> b!111749 (validate_offset_bits!1 ((_ sign_extend 32) (size!2311 (buf!2708 (_2!4865 lt!169639)))) ((_ sign_extend 32) (currentByte!5265 (_2!4865 lt!168326))) ((_ sign_extend 32) (currentBit!5260 (_2!4865 lt!168326))) lt!169640)))

(declare-fun lt!169652 () Unit!6790)

(assert (=> b!111749 (= lt!169652 lt!169655)))

(declare-fun lt!169649 () tuple2!9222)

(assert (=> b!111749 (= lt!169649 (readNLeastSignificantBitsLoopPure!0 (_1!4867 lt!169636) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!169615))))

(declare-fun lt!169646 () (_ BitVec 64))

(assert (=> b!111749 (= lt!169646 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))))

(declare-fun lt!169629 () Unit!6790)

(assert (=> b!111749 (= lt!169629 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4865 lt!169631) (buf!2708 (_2!4865 lt!169639)) lt!169646))))

(assert (=> b!111749 (validate_offset_bits!1 ((_ sign_extend 32) (size!2311 (buf!2708 (_2!4865 lt!169639)))) ((_ sign_extend 32) (currentByte!5265 (_2!4865 lt!169631))) ((_ sign_extend 32) (currentBit!5260 (_2!4865 lt!169631))) lt!169646)))

(declare-fun lt!169614 () Unit!6790)

(assert (=> b!111749 (= lt!169614 lt!169629)))

(declare-fun lt!169618 () tuple2!9222)

(assert (=> b!111749 (= lt!169618 (readNLeastSignificantBitsLoopPure!0 (_1!4867 lt!169621) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor lt!169615 (ite (_2!4866 lt!169635) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!169647 () tuple2!9222)

(assert (=> b!111749 (= lt!169647 (readNLeastSignificantBitsLoopPure!0 (_1!4867 lt!169636) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!169615))))

(declare-fun c!6798 () Bool)

(assert (=> b!111749 (= c!6798 (_2!4866 (readBitPure!0 (_1!4867 lt!169636))))))

(declare-fun lt!169630 () tuple2!9222)

(assert (=> b!111749 (= lt!169630 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4867 lt!169636) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor lt!169615 e!73319)))))

(declare-fun lt!169625 () Unit!6790)

(assert (=> b!111749 (= lt!169625 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4867 lt!169636) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!169615))))

(assert (=> b!111749 (and (= (_2!4868 lt!169647) (_2!4868 lt!169630)) (= (_1!4868 lt!169647) (_1!4868 lt!169630)))))

(declare-fun lt!169623 () Unit!6790)

(assert (=> b!111749 (= lt!169623 lt!169625)))

(assert (=> b!111749 (= (_1!4867 lt!169636) (withMovedBitIndex!0 (_2!4867 lt!169636) (bvsub (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!168326))) (currentByte!5265 (_2!4865 lt!168326)) (currentBit!5260 (_2!4865 lt!168326))) (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!169639))) (currentByte!5265 (_2!4865 lt!169639)) (currentBit!5260 (_2!4865 lt!169639))))))))

(declare-fun lt!169633 () Unit!6790)

(declare-fun Unit!6843 () Unit!6790)

(assert (=> b!111749 (= lt!169633 Unit!6843)))

(assert (=> b!111749 (= (_1!4867 lt!169621) (withMovedBitIndex!0 (_2!4867 lt!169621) (bvsub (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!169631))) (currentByte!5265 (_2!4865 lt!169631)) (currentBit!5260 (_2!4865 lt!169631))) (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!169639))) (currentByte!5265 (_2!4865 lt!169639)) (currentBit!5260 (_2!4865 lt!169639))))))))

(declare-fun lt!169654 () Unit!6790)

(declare-fun Unit!6844 () Unit!6790)

(assert (=> b!111749 (= lt!169654 Unit!6844)))

(assert (=> b!111749 (= (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!168326))) (currentByte!5265 (_2!4865 lt!168326)) (currentBit!5260 (_2!4865 lt!168326))) (bvsub (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!169631))) (currentByte!5265 (_2!4865 lt!169631)) (currentBit!5260 (_2!4865 lt!169631))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!169628 () Unit!6790)

(declare-fun Unit!6845 () Unit!6790)

(assert (=> b!111749 (= lt!169628 Unit!6845)))

(assert (=> b!111749 (= (_2!4868 lt!169649) (_2!4868 lt!169618))))

(declare-fun lt!169627 () Unit!6790)

(declare-fun Unit!6846 () Unit!6790)

(assert (=> b!111749 (= lt!169627 Unit!6846)))

(assert (=> b!111749 (= (_1!4868 lt!169649) (_2!4867 lt!169636))))

(declare-fun b!111750 () Bool)

(declare-fun res!92260 () Bool)

(assert (=> b!111750 (= res!92260 (isPrefixOf!0 (_2!4865 lt!168326) (_2!4865 lt!169620)))))

(assert (=> b!111750 (=> (not res!92260) (not e!73316))))

(declare-fun b!111751 () Bool)

(declare-fun lt!169632 () Unit!6790)

(assert (=> b!111751 (= e!73318 (tuple2!9217 lt!169632 (_2!4865 lt!168326)))))

(assert (=> b!111751 (= lt!169651 (_2!4865 lt!168326))))

(assert (=> b!111751 (= lt!169632 (lemmaIsPrefixRefl!0 lt!169651))))

(assert (=> b!111751 call!1413))

(declare-fun b!111752 () Bool)

(declare-fun lt!169619 () tuple2!9222)

(declare-fun lt!169657 () tuple2!9220)

(assert (=> b!111752 (= e!73314 (and (= (_2!4868 lt!169619) v!199) (= (_1!4868 lt!169619) (_2!4867 lt!169657))))))

(declare-fun lt!169616 () (_ BitVec 64))

(assert (=> b!111752 (= lt!169619 (readNLeastSignificantBitsLoopPure!0 (_1!4867 lt!169657) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!169616))))

(declare-fun lt!169645 () Unit!6790)

(declare-fun lt!169650 () Unit!6790)

(assert (=> b!111752 (= lt!169645 lt!169650)))

(assert (=> b!111752 (validate_offset_bits!1 ((_ sign_extend 32) (size!2311 (buf!2708 (_2!4865 lt!169643)))) ((_ sign_extend 32) (currentByte!5265 (_2!4865 lt!168326))) ((_ sign_extend 32) (currentBit!5260 (_2!4865 lt!168326))) lt!169638)))

(assert (=> b!111752 (= lt!169650 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4865 lt!168326) (buf!2708 (_2!4865 lt!169643)) lt!169638))))

(assert (=> b!111752 e!73317))

(declare-fun res!92263 () Bool)

(assert (=> b!111752 (=> (not res!92263) (not e!73317))))

(assert (=> b!111752 (= res!92263 (and (= (size!2311 (buf!2708 (_2!4865 lt!168326))) (size!2311 (buf!2708 (_2!4865 lt!169643)))) (bvsge lt!169638 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!111752 (= lt!169638 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))

(assert (=> b!111752 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!111752 (= lt!169616 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))))

(assert (=> b!111752 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!111752 (= lt!169657 (reader!0 (_2!4865 lt!168326) (_2!4865 lt!169643)))))

(declare-fun b!111753 () Bool)

(declare-fun res!92267 () Bool)

(assert (=> b!111753 (= res!92267 (= (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!169620))) (currentByte!5265 (_2!4865 lt!169620)) (currentBit!5260 (_2!4865 lt!169620))) (bvadd (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!168326))) (currentByte!5265 (_2!4865 lt!168326)) (currentBit!5260 (_2!4865 lt!168326))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!111753 (=> (not res!92267) (not e!73316))))

(assert (= (and d!35578 c!6799) b!111749))

(assert (= (and d!35578 (not c!6799)) b!111751))

(assert (= (and b!111749 res!92261) b!111753))

(assert (= (and b!111753 res!92267) b!111750))

(assert (= (and b!111750 res!92260) b!111741))

(assert (= (and b!111741 res!92264) b!111746))

(assert (= (and b!111749 res!92262) b!111745))

(assert (= (and b!111749 c!6798) b!111748))

(assert (= (and b!111749 (not c!6798)) b!111743))

(assert (= (or b!111749 b!111751) bm!1410))

(assert (= (and d!35578 res!92259) b!111747))

(assert (= (and b!111747 res!92265) b!111742))

(assert (= (and b!111742 res!92266) b!111752))

(assert (= (and b!111752 res!92263) b!111744))

(declare-fun m!166577 () Bool)

(assert (=> bm!1410 m!166577))

(declare-fun m!166579 () Bool)

(assert (=> b!111749 m!166579))

(declare-fun m!166581 () Bool)

(assert (=> b!111749 m!166581))

(declare-fun m!166583 () Bool)

(assert (=> b!111749 m!166583))

(declare-fun m!166585 () Bool)

(assert (=> b!111749 m!166585))

(declare-fun m!166587 () Bool)

(assert (=> b!111749 m!166587))

(declare-fun m!166589 () Bool)

(assert (=> b!111749 m!166589))

(assert (=> b!111749 m!164847))

(declare-fun m!166591 () Bool)

(assert (=> b!111749 m!166591))

(declare-fun m!166593 () Bool)

(assert (=> b!111749 m!166593))

(declare-fun m!166595 () Bool)

(assert (=> b!111749 m!166595))

(declare-fun m!166597 () Bool)

(assert (=> b!111749 m!166597))

(declare-fun m!166599 () Bool)

(assert (=> b!111749 m!166599))

(declare-fun m!166601 () Bool)

(assert (=> b!111749 m!166601))

(declare-fun m!166603 () Bool)

(assert (=> b!111749 m!166603))

(declare-fun m!166605 () Bool)

(assert (=> b!111749 m!166605))

(declare-fun m!166607 () Bool)

(assert (=> b!111749 m!166607))

(declare-fun m!166609 () Bool)

(assert (=> b!111749 m!166609))

(declare-fun m!166611 () Bool)

(assert (=> b!111749 m!166611))

(declare-fun m!166613 () Bool)

(assert (=> b!111749 m!166613))

(declare-fun m!166615 () Bool)

(assert (=> b!111749 m!166615))

(declare-fun m!166617 () Bool)

(assert (=> b!111749 m!166617))

(assert (=> b!111749 m!166615))

(declare-fun m!166619 () Bool)

(assert (=> b!111749 m!166619))

(declare-fun m!166621 () Bool)

(assert (=> b!111749 m!166621))

(declare-fun m!166623 () Bool)

(assert (=> b!111749 m!166623))

(declare-fun m!166625 () Bool)

(assert (=> b!111749 m!166625))

(declare-fun m!166627 () Bool)

(assert (=> b!111749 m!166627))

(declare-fun m!166629 () Bool)

(assert (=> b!111749 m!166629))

(declare-fun m!166631 () Bool)

(assert (=> b!111749 m!166631))

(declare-fun m!166633 () Bool)

(assert (=> b!111744 m!166633))

(declare-fun m!166635 () Bool)

(assert (=> b!111751 m!166635))

(declare-fun m!166637 () Bool)

(assert (=> b!111747 m!166637))

(assert (=> b!111747 m!164847))

(declare-fun m!166639 () Bool)

(assert (=> b!111746 m!166639))

(declare-fun m!166641 () Bool)

(assert (=> b!111746 m!166641))

(declare-fun m!166643 () Bool)

(assert (=> b!111742 m!166643))

(declare-fun m!166645 () Bool)

(assert (=> b!111752 m!166645))

(declare-fun m!166647 () Bool)

(assert (=> b!111752 m!166647))

(declare-fun m!166649 () Bool)

(assert (=> b!111752 m!166649))

(assert (=> b!111752 m!166621))

(declare-fun m!166651 () Bool)

(assert (=> b!111752 m!166651))

(declare-fun m!166653 () Bool)

(assert (=> b!111750 m!166653))

(declare-fun m!166655 () Bool)

(assert (=> b!111741 m!166655))

(assert (=> b!111741 m!166655))

(declare-fun m!166657 () Bool)

(assert (=> b!111741 m!166657))

(assert (=> b!111753 m!166641))

(assert (=> b!111753 m!164847))

(assert (=> b!111044 d!35578))

(declare-fun lt!169658 () tuple2!9244)

(declare-fun d!35580 () Bool)

(assert (=> d!35580 (= lt!169658 (readNLeastSignificantBitsLoop!0 (_1!4867 lt!168316) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!168310 (ite (_2!4866 lt!168330) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!35580 (= (readNLeastSignificantBitsLoopPure!0 (_1!4867 lt!168316) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!168310 (ite (_2!4866 lt!168330) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!9223 (_2!4879 lt!169658) (_1!4879 lt!169658)))))

(declare-fun bs!8679 () Bool)

(assert (= bs!8679 d!35580))

(declare-fun m!166659 () Bool)

(assert (=> bs!8679 m!166659))

(assert (=> b!111044 d!35580))

(declare-fun d!35582 () Bool)

(declare-fun lt!169674 () tuple2!9222)

(declare-fun lt!169672 () tuple2!9222)

(assert (=> d!35582 (and (= (_2!4868 lt!169674) (_2!4868 lt!169672)) (= (_1!4868 lt!169674) (_1!4868 lt!169672)))))

(declare-fun lt!169675 () (_ BitVec 64))

(declare-fun lt!169673 () Unit!6790)

(declare-fun lt!169671 () BitStream!4096)

(declare-fun lt!169676 () Bool)

(declare-fun choose!45 (BitStream!4096 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!9222 tuple2!9222 BitStream!4096 (_ BitVec 64) Bool BitStream!4096 (_ BitVec 64) tuple2!9222 tuple2!9222 BitStream!4096 (_ BitVec 64)) Unit!6790)

(assert (=> d!35582 (= lt!169673 (choose!45 (_1!4867 lt!168331) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!168310 lt!169674 (tuple2!9223 (_1!4868 lt!169674) (_2!4868 lt!169674)) (_1!4868 lt!169674) (_2!4868 lt!169674) lt!169676 lt!169671 lt!169675 lt!169672 (tuple2!9223 (_1!4868 lt!169672) (_2!4868 lt!169672)) (_1!4868 lt!169672) (_2!4868 lt!169672)))))

(assert (=> d!35582 (= lt!169672 (readNLeastSignificantBitsLoopPure!0 lt!169671 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!169675))))

(assert (=> d!35582 (= lt!169675 (bvor lt!168310 (ite lt!169676 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35582 (= lt!169671 (withMovedBitIndex!0 (_1!4867 lt!168331) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!35582 (= lt!169676 (_2!4866 (readBitPure!0 (_1!4867 lt!168331))))))

(assert (=> d!35582 (= lt!169674 (readNLeastSignificantBitsLoopPure!0 (_1!4867 lt!168331) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!168310))))

(assert (=> d!35582 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4867 lt!168331) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!168310) lt!169673)))

(declare-fun bs!8681 () Bool)

(assert (= bs!8681 d!35582))

(declare-fun m!166661 () Bool)

(assert (=> bs!8681 m!166661))

(assert (=> bs!8681 m!164871))

(assert (=> bs!8681 m!164843))

(declare-fun m!166663 () Bool)

(assert (=> bs!8681 m!166663))

(assert (=> bs!8681 m!164839))

(assert (=> b!111044 d!35582))

(declare-fun d!35584 () Bool)

(assert (=> d!35584 (isPrefixOf!0 (_2!4865 lt!167626) (_2!4865 lt!168334))))

(declare-fun lt!169677 () Unit!6790)

(assert (=> d!35584 (= lt!169677 (choose!30 (_2!4865 lt!167626) (_2!4865 lt!168326) (_2!4865 lt!168334)))))

(assert (=> d!35584 (isPrefixOf!0 (_2!4865 lt!167626) (_2!4865 lt!168326))))

(assert (=> d!35584 (= (lemmaIsPrefixTransitive!0 (_2!4865 lt!167626) (_2!4865 lt!168326) (_2!4865 lt!168334)) lt!169677)))

(declare-fun bs!8682 () Bool)

(assert (= bs!8682 d!35584))

(assert (=> bs!8682 m!166465))

(declare-fun m!166665 () Bool)

(assert (=> bs!8682 m!166665))

(declare-fun m!166667 () Bool)

(assert (=> bs!8682 m!166667))

(assert (=> b!111044 d!35584))

(declare-fun d!35586 () Bool)

(declare-fun e!73320 () Bool)

(assert (=> d!35586 e!73320))

(declare-fun res!92268 () Bool)

(assert (=> d!35586 (=> (not res!92268) (not e!73320))))

(declare-fun lt!169682 () (_ BitVec 64))

(declare-fun lt!169683 () (_ BitVec 64))

(declare-fun lt!169680 () (_ BitVec 64))

(assert (=> d!35586 (= res!92268 (= lt!169683 (bvsub lt!169682 lt!169680)))))

(assert (=> d!35586 (or (= (bvand lt!169682 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!169680 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!169682 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!169682 lt!169680) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35586 (= lt!169680 (remainingBits!0 ((_ sign_extend 32) (size!2311 (buf!2708 (_2!4865 lt!168334)))) ((_ sign_extend 32) (currentByte!5265 (_2!4865 lt!168334))) ((_ sign_extend 32) (currentBit!5260 (_2!4865 lt!168334)))))))

(declare-fun lt!169681 () (_ BitVec 64))

(declare-fun lt!169679 () (_ BitVec 64))

(assert (=> d!35586 (= lt!169682 (bvmul lt!169681 lt!169679))))

(assert (=> d!35586 (or (= lt!169681 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!169679 (bvsdiv (bvmul lt!169681 lt!169679) lt!169681)))))

(assert (=> d!35586 (= lt!169679 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35586 (= lt!169681 ((_ sign_extend 32) (size!2311 (buf!2708 (_2!4865 lt!168334)))))))

(assert (=> d!35586 (= lt!169683 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5265 (_2!4865 lt!168334))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5260 (_2!4865 lt!168334)))))))

(assert (=> d!35586 (invariant!0 (currentBit!5260 (_2!4865 lt!168334)) (currentByte!5265 (_2!4865 lt!168334)) (size!2311 (buf!2708 (_2!4865 lt!168334))))))

(assert (=> d!35586 (= (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!168334))) (currentByte!5265 (_2!4865 lt!168334)) (currentBit!5260 (_2!4865 lt!168334))) lt!169683)))

(declare-fun b!111754 () Bool)

(declare-fun res!92269 () Bool)

(assert (=> b!111754 (=> (not res!92269) (not e!73320))))

(assert (=> b!111754 (= res!92269 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!169683))))

(declare-fun b!111755 () Bool)

(declare-fun lt!169678 () (_ BitVec 64))

(assert (=> b!111755 (= e!73320 (bvsle lt!169683 (bvmul lt!169678 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!111755 (or (= lt!169678 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!169678 #b0000000000000000000000000000000000000000000000000000000000001000) lt!169678)))))

(assert (=> b!111755 (= lt!169678 ((_ sign_extend 32) (size!2311 (buf!2708 (_2!4865 lt!168334)))))))

(assert (= (and d!35586 res!92268) b!111754))

(assert (= (and b!111754 res!92269) b!111755))

(declare-fun m!166669 () Bool)

(assert (=> d!35586 m!166669))

(declare-fun m!166671 () Bool)

(assert (=> d!35586 m!166671))

(assert (=> b!111044 d!35586))

(declare-fun lt!169684 () tuple2!9244)

(declare-fun d!35588 () Bool)

(assert (=> d!35588 (= lt!169684 (readNLeastSignificantBitsLoop!0 (_1!4867 lt!168331) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!168310))))

(assert (=> d!35588 (= (readNLeastSignificantBitsLoopPure!0 (_1!4867 lt!168331) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!168310) (tuple2!9223 (_2!4879 lt!169684) (_1!4879 lt!169684)))))

(declare-fun bs!8683 () Bool)

(assert (= bs!8683 d!35588))

(declare-fun m!166673 () Bool)

(assert (=> bs!8683 m!166673))

(assert (=> b!111044 d!35588))

(declare-fun d!35590 () Bool)

(assert (=> d!35590 (= (remainingBits!0 ((_ sign_extend 32) (size!2311 (buf!2708 (_1!4866 lt!167629)))) ((_ sign_extend 32) (currentByte!5265 (_1!4866 lt!167629))) ((_ sign_extend 32) (currentBit!5260 (_1!4866 lt!167629)))) (bvsub (bvmul ((_ sign_extend 32) (size!2311 (buf!2708 (_1!4866 lt!167629)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5265 (_1!4866 lt!167629))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5260 (_1!4866 lt!167629))))))))

(assert (=> d!34882 d!35590))

(declare-fun d!35592 () Bool)

(assert (=> d!35592 (= (invariant!0 (currentBit!5260 (_1!4866 lt!167629)) (currentByte!5265 (_1!4866 lt!167629)) (size!2311 (buf!2708 (_1!4866 lt!167629)))) (and (bvsge (currentBit!5260 (_1!4866 lt!167629)) #b00000000000000000000000000000000) (bvslt (currentBit!5260 (_1!4866 lt!167629)) #b00000000000000000000000000001000) (bvsge (currentByte!5265 (_1!4866 lt!167629)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5265 (_1!4866 lt!167629)) (size!2311 (buf!2708 (_1!4866 lt!167629)))) (and (= (currentBit!5260 (_1!4866 lt!167629)) #b00000000000000000000000000000000) (= (currentByte!5265 (_1!4866 lt!167629)) (size!2311 (buf!2708 (_1!4866 lt!167629))))))))))

(assert (=> d!34882 d!35592))

(assert (=> d!34866 d!34904))

(declare-fun d!35594 () Bool)

(assert (=> d!35594 (isPrefixOf!0 thiss!1305 (_2!4865 lt!167643))))

(assert (=> d!35594 true))

(declare-fun _$15!177 () Unit!6790)

(assert (=> d!35594 (= (choose!30 thiss!1305 (_2!4865 lt!167626) (_2!4865 lt!167643)) _$15!177)))

(declare-fun bs!8684 () Bool)

(assert (= bs!8684 d!35594))

(assert (=> bs!8684 m!164365))

(assert (=> d!34866 d!35594))

(assert (=> d!34866 d!34854))

(assert (=> b!110928 d!34858))

(declare-fun d!35596 () Bool)

(declare-fun e!73321 () Bool)

(assert (=> d!35596 e!73321))

(declare-fun res!92270 () Bool)

(assert (=> d!35596 (=> (not res!92270) (not e!73321))))

(declare-fun lt!169690 () (_ BitVec 64))

(declare-fun lt!169687 () (_ BitVec 64))

(declare-fun lt!169689 () (_ BitVec 64))

(assert (=> d!35596 (= res!92270 (= lt!169690 (bvsub lt!169689 lt!169687)))))

(assert (=> d!35596 (or (= (bvand lt!169689 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!169687 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!169689 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!169689 lt!169687) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35596 (= lt!169687 (remainingBits!0 ((_ sign_extend 32) (size!2311 (buf!2708 (_2!4865 lt!167643)))) ((_ sign_extend 32) (currentByte!5265 (_2!4865 lt!167643))) ((_ sign_extend 32) (currentBit!5260 (_2!4865 lt!167643)))))))

(declare-fun lt!169688 () (_ BitVec 64))

(declare-fun lt!169686 () (_ BitVec 64))

(assert (=> d!35596 (= lt!169689 (bvmul lt!169688 lt!169686))))

(assert (=> d!35596 (or (= lt!169688 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!169686 (bvsdiv (bvmul lt!169688 lt!169686) lt!169688)))))

(assert (=> d!35596 (= lt!169686 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35596 (= lt!169688 ((_ sign_extend 32) (size!2311 (buf!2708 (_2!4865 lt!167643)))))))

(assert (=> d!35596 (= lt!169690 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5265 (_2!4865 lt!167643))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5260 (_2!4865 lt!167643)))))))

(assert (=> d!35596 (invariant!0 (currentBit!5260 (_2!4865 lt!167643)) (currentByte!5265 (_2!4865 lt!167643)) (size!2311 (buf!2708 (_2!4865 lt!167643))))))

(assert (=> d!35596 (= (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!167643))) (currentByte!5265 (_2!4865 lt!167643)) (currentBit!5260 (_2!4865 lt!167643))) lt!169690)))

(declare-fun b!111756 () Bool)

(declare-fun res!92271 () Bool)

(assert (=> b!111756 (=> (not res!92271) (not e!73321))))

(assert (=> b!111756 (= res!92271 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!169690))))

(declare-fun b!111757 () Bool)

(declare-fun lt!169685 () (_ BitVec 64))

(assert (=> b!111757 (= e!73321 (bvsle lt!169690 (bvmul lt!169685 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!111757 (or (= lt!169685 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!169685 #b0000000000000000000000000000000000000000000000000000000000001000) lt!169685)))))

(assert (=> b!111757 (= lt!169685 ((_ sign_extend 32) (size!2311 (buf!2708 (_2!4865 lt!167643)))))))

(assert (= (and d!35596 res!92270) b!111756))

(assert (= (and b!111756 res!92271) b!111757))

(declare-fun m!166675 () Bool)

(assert (=> d!35596 m!166675))

(declare-fun m!166677 () Bool)

(assert (=> d!35596 m!166677))

(assert (=> b!110928 d!35596))

(declare-fun d!35598 () Bool)

(assert (=> d!35598 (isPrefixOf!0 lt!168346 lt!168346)))

(declare-fun lt!169691 () Unit!6790)

(assert (=> d!35598 (= lt!169691 (choose!11 lt!168346))))

(assert (=> d!35598 (= (lemmaIsPrefixRefl!0 lt!168346) lt!169691)))

(declare-fun bs!8685 () Bool)

(assert (= bs!8685 d!35598))

(declare-fun m!166679 () Bool)

(assert (=> bs!8685 m!166679))

(declare-fun m!166681 () Bool)

(assert (=> bs!8685 m!166681))

(assert (=> b!111046 d!35598))

(declare-fun d!35600 () Bool)

(assert (=> d!35600 (= (remainingBits!0 ((_ sign_extend 32) (size!2311 (buf!2708 (_2!4865 lt!167626)))) ((_ sign_extend 32) (currentByte!5265 (_2!4865 lt!167626))) ((_ sign_extend 32) (currentBit!5260 (_2!4865 lt!167626)))) (bvsub (bvmul ((_ sign_extend 32) (size!2311 (buf!2708 (_2!4865 lt!167626)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5265 (_2!4865 lt!167626))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5260 (_2!4865 lt!167626))))))))

(assert (=> d!34856 d!35600))

(assert (=> d!34856 d!35500))

(declare-fun b!111758 () Bool)

(declare-fun e!73327 () Bool)

(declare-fun e!73325 () Bool)

(assert (=> b!111758 (= e!73327 e!73325)))

(declare-fun c!6800 () Bool)

(declare-fun lt!169694 () tuple4!76)

(assert (=> b!111758 (= c!6800 (= (_3!259 lt!169694) (_4!38 lt!169694)))))

(declare-fun b!111759 () Bool)

(declare-fun e!73324 () Bool)

(assert (=> b!111759 (= e!73324 (arrayRangesEq!39 (buf!2708 thiss!1305) (buf!2708 (_2!4865 lt!167626)) (_1!4885 lt!169694) (_2!4885 lt!169694)))))

(declare-fun b!111760 () Bool)

(declare-fun call!1414 () Bool)

(assert (=> b!111760 (= e!73325 call!1414)))

(declare-fun b!111761 () Bool)

(declare-fun e!73322 () Bool)

(assert (=> b!111761 (= e!73322 e!73327)))

(declare-fun res!92273 () Bool)

(assert (=> b!111761 (=> (not res!92273) (not e!73327))))

(assert (=> b!111761 (= res!92273 e!73324)))

(declare-fun res!92274 () Bool)

(assert (=> b!111761 (=> res!92274 e!73324)))

(assert (=> b!111761 (= res!92274 (bvsge (_1!4885 lt!169694) (_2!4885 lt!169694)))))

(declare-fun lt!169693 () (_ BitVec 32))

(assert (=> b!111761 (= lt!169693 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2311 (buf!2708 thiss!1305)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!169692 () (_ BitVec 32))

(assert (=> b!111761 (= lt!169692 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!111761 (= lt!169694 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2311 (buf!2708 thiss!1305)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305))))))

(declare-fun b!111762 () Bool)

(declare-fun res!92272 () Bool)

(assert (=> b!111762 (= res!92272 (= lt!169693 #b00000000000000000000000000000000))))

(declare-fun e!73326 () Bool)

(assert (=> b!111762 (=> res!92272 e!73326)))

(declare-fun e!73323 () Bool)

(assert (=> b!111762 (= e!73323 e!73326)))

(declare-fun b!111763 () Bool)

(assert (=> b!111763 (= e!73325 e!73323)))

(declare-fun res!92276 () Bool)

(assert (=> b!111763 (= res!92276 call!1414)))

(assert (=> b!111763 (=> (not res!92276) (not e!73323))))

(declare-fun d!35602 () Bool)

(declare-fun res!92275 () Bool)

(assert (=> d!35602 (=> res!92275 e!73322)))

(assert (=> d!35602 (= res!92275 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2311 (buf!2708 thiss!1305)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305))))))

(assert (=> d!35602 (= (arrayBitRangesEq!0 (buf!2708 thiss!1305) (buf!2708 (_2!4865 lt!167626)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2311 (buf!2708 thiss!1305)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305))) e!73322)))

(declare-fun bm!1411 () Bool)

(assert (=> bm!1411 (= call!1414 (byteRangesEq!0 (select (arr!2904 (buf!2708 thiss!1305)) (_3!259 lt!169694)) (select (arr!2904 (buf!2708 (_2!4865 lt!167626))) (_3!259 lt!169694)) lt!169692 (ite c!6800 lt!169693 #b00000000000000000000000000001000)))))

(declare-fun b!111764 () Bool)

(assert (=> b!111764 (= e!73326 (byteRangesEq!0 (select (arr!2904 (buf!2708 thiss!1305)) (_4!38 lt!169694)) (select (arr!2904 (buf!2708 (_2!4865 lt!167626))) (_4!38 lt!169694)) #b00000000000000000000000000000000 lt!169693))))

(assert (= (and d!35602 (not res!92275)) b!111761))

(assert (= (and b!111761 (not res!92274)) b!111759))

(assert (= (and b!111761 res!92273) b!111758))

(assert (= (and b!111758 c!6800) b!111760))

(assert (= (and b!111758 (not c!6800)) b!111763))

(assert (= (and b!111763 res!92276) b!111762))

(assert (= (and b!111762 (not res!92272)) b!111764))

(assert (= (or b!111760 b!111763) bm!1411))

(declare-fun m!166683 () Bool)

(assert (=> b!111759 m!166683))

(assert (=> b!111761 m!164351))

(assert (=> b!111761 m!166433))

(declare-fun m!166685 () Bool)

(assert (=> bm!1411 m!166685))

(declare-fun m!166687 () Bool)

(assert (=> bm!1411 m!166687))

(assert (=> bm!1411 m!166685))

(assert (=> bm!1411 m!166687))

(declare-fun m!166689 () Bool)

(assert (=> bm!1411 m!166689))

(declare-fun m!166691 () Bool)

(assert (=> b!111764 m!166691))

(declare-fun m!166693 () Bool)

(assert (=> b!111764 m!166693))

(assert (=> b!111764 m!166691))

(assert (=> b!111764 m!166693))

(declare-fun m!166695 () Bool)

(assert (=> b!111764 m!166695))

(assert (=> b!110875 d!35602))

(assert (=> b!110875 d!34858))

(declare-fun d!35604 () Bool)

(declare-fun e!73328 () Bool)

(assert (=> d!35604 e!73328))

(declare-fun res!92277 () Bool)

(assert (=> d!35604 (=> (not res!92277) (not e!73328))))

(declare-fun lt!169696 () (_ BitVec 64))

(declare-fun lt!169695 () BitStream!4096)

(assert (=> d!35604 (= res!92277 (= (bvadd lt!169696 (bvsub lt!168000 lt!167999)) (bitIndex!0 (size!2311 (buf!2708 lt!169695)) (currentByte!5265 lt!169695) (currentBit!5260 lt!169695))))))

(assert (=> d!35604 (or (not (= (bvand lt!169696 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!168000 lt!167999) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!169696 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!169696 (bvsub lt!168000 lt!167999)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35604 (= lt!169696 (bitIndex!0 (size!2311 (buf!2708 (_2!4867 lt!168013))) (currentByte!5265 (_2!4867 lt!168013)) (currentBit!5260 (_2!4867 lt!168013))))))

(assert (=> d!35604 (= lt!169695 (_2!4865 (moveBitIndex!0 (_2!4867 lt!168013) (bvsub lt!168000 lt!167999))))))

(assert (=> d!35604 (moveBitIndexPrecond!0 (_2!4867 lt!168013) (bvsub lt!168000 lt!167999))))

(assert (=> d!35604 (= (withMovedBitIndex!0 (_2!4867 lt!168013) (bvsub lt!168000 lt!167999)) lt!169695)))

(declare-fun b!111765 () Bool)

(assert (=> b!111765 (= e!73328 (= (size!2311 (buf!2708 (_2!4867 lt!168013))) (size!2311 (buf!2708 lt!169695))))))

(assert (= (and d!35604 res!92277) b!111765))

(declare-fun m!166697 () Bool)

(assert (=> d!35604 m!166697))

(assert (=> d!35604 m!166357))

(declare-fun m!166699 () Bool)

(assert (=> d!35604 m!166699))

(declare-fun m!166701 () Bool)

(assert (=> d!35604 m!166701))

(assert (=> b!110927 d!35604))

(assert (=> b!110927 d!35596))

(assert (=> b!110927 d!34858))

(declare-fun d!35606 () Bool)

(declare-fun res!92279 () Bool)

(declare-fun e!73330 () Bool)

(assert (=> d!35606 (=> (not res!92279) (not e!73330))))

(assert (=> d!35606 (= res!92279 (= (size!2311 (buf!2708 (ite c!6747 (_2!4865 lt!167626) lt!168346))) (size!2311 (buf!2708 (ite c!6747 (_2!4865 lt!168334) lt!168346)))))))

(assert (=> d!35606 (= (isPrefixOf!0 (ite c!6747 (_2!4865 lt!167626) lt!168346) (ite c!6747 (_2!4865 lt!168334) lt!168346)) e!73330)))

(declare-fun b!111766 () Bool)

(declare-fun res!92278 () Bool)

(assert (=> b!111766 (=> (not res!92278) (not e!73330))))

(assert (=> b!111766 (= res!92278 (bvsle (bitIndex!0 (size!2311 (buf!2708 (ite c!6747 (_2!4865 lt!167626) lt!168346))) (currentByte!5265 (ite c!6747 (_2!4865 lt!167626) lt!168346)) (currentBit!5260 (ite c!6747 (_2!4865 lt!167626) lt!168346))) (bitIndex!0 (size!2311 (buf!2708 (ite c!6747 (_2!4865 lt!168334) lt!168346))) (currentByte!5265 (ite c!6747 (_2!4865 lt!168334) lt!168346)) (currentBit!5260 (ite c!6747 (_2!4865 lt!168334) lt!168346)))))))

(declare-fun b!111767 () Bool)

(declare-fun e!73329 () Bool)

(assert (=> b!111767 (= e!73330 e!73329)))

(declare-fun res!92280 () Bool)

(assert (=> b!111767 (=> res!92280 e!73329)))

(assert (=> b!111767 (= res!92280 (= (size!2311 (buf!2708 (ite c!6747 (_2!4865 lt!167626) lt!168346))) #b00000000000000000000000000000000))))

(declare-fun b!111768 () Bool)

(assert (=> b!111768 (= e!73329 (arrayBitRangesEq!0 (buf!2708 (ite c!6747 (_2!4865 lt!167626) lt!168346)) (buf!2708 (ite c!6747 (_2!4865 lt!168334) lt!168346)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2311 (buf!2708 (ite c!6747 (_2!4865 lt!167626) lt!168346))) (currentByte!5265 (ite c!6747 (_2!4865 lt!167626) lt!168346)) (currentBit!5260 (ite c!6747 (_2!4865 lt!167626) lt!168346)))))))

(assert (= (and d!35606 res!92279) b!111766))

(assert (= (and b!111766 res!92278) b!111767))

(assert (= (and b!111767 (not res!92280)) b!111768))

(declare-fun m!166703 () Bool)

(assert (=> b!111766 m!166703))

(declare-fun m!166705 () Bool)

(assert (=> b!111766 m!166705))

(assert (=> b!111768 m!166703))

(assert (=> b!111768 m!166703))

(declare-fun m!166707 () Bool)

(assert (=> b!111768 m!166707))

(assert (=> bm!1389 d!35606))

(declare-fun d!35608 () Bool)

(assert (=> d!35608 (= (remainingBits!0 ((_ sign_extend 32) (size!2311 (buf!2708 (_1!4866 lt!167642)))) ((_ sign_extend 32) (currentByte!5265 (_1!4866 lt!167642))) ((_ sign_extend 32) (currentBit!5260 (_1!4866 lt!167642)))) (bvsub (bvmul ((_ sign_extend 32) (size!2311 (buf!2708 (_1!4866 lt!167642)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5265 (_1!4866 lt!167642))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5260 (_1!4866 lt!167642))))))))

(assert (=> d!34910 d!35608))

(declare-fun d!35610 () Bool)

(assert (=> d!35610 (= (invariant!0 (currentBit!5260 (_1!4866 lt!167642)) (currentByte!5265 (_1!4866 lt!167642)) (size!2311 (buf!2708 (_1!4866 lt!167642)))) (and (bvsge (currentBit!5260 (_1!4866 lt!167642)) #b00000000000000000000000000000000) (bvslt (currentBit!5260 (_1!4866 lt!167642)) #b00000000000000000000000000001000) (bvsge (currentByte!5265 (_1!4866 lt!167642)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5265 (_1!4866 lt!167642)) (size!2311 (buf!2708 (_1!4866 lt!167642)))) (and (= (currentBit!5260 (_1!4866 lt!167642)) #b00000000000000000000000000000000) (= (currentByte!5265 (_1!4866 lt!167642)) (size!2311 (buf!2708 (_1!4866 lt!167642))))))))))

(assert (=> d!34910 d!35610))

(declare-fun d!35612 () Bool)

(declare-fun e!73331 () Bool)

(assert (=> d!35612 e!73331))

(declare-fun res!92281 () Bool)

(assert (=> d!35612 (=> (not res!92281) (not e!73331))))

(declare-fun lt!169699 () (_ BitVec 64))

(declare-fun lt!169702 () (_ BitVec 64))

(declare-fun lt!169701 () (_ BitVec 64))

(assert (=> d!35612 (= res!92281 (= lt!169702 (bvsub lt!169701 lt!169699)))))

(assert (=> d!35612 (or (= (bvand lt!169701 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!169699 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!169701 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!169701 lt!169699) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35612 (= lt!169699 (remainingBits!0 ((_ sign_extend 32) (size!2311 (buf!2708 (_2!4865 lt!168338)))) ((_ sign_extend 32) (currentByte!5265 (_2!4865 lt!168338))) ((_ sign_extend 32) (currentBit!5260 (_2!4865 lt!168338)))))))

(declare-fun lt!169700 () (_ BitVec 64))

(declare-fun lt!169698 () (_ BitVec 64))

(assert (=> d!35612 (= lt!169701 (bvmul lt!169700 lt!169698))))

(assert (=> d!35612 (or (= lt!169700 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!169698 (bvsdiv (bvmul lt!169700 lt!169698) lt!169700)))))

(assert (=> d!35612 (= lt!169698 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35612 (= lt!169700 ((_ sign_extend 32) (size!2311 (buf!2708 (_2!4865 lt!168338)))))))

(assert (=> d!35612 (= lt!169702 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5265 (_2!4865 lt!168338))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5260 (_2!4865 lt!168338)))))))

(assert (=> d!35612 (invariant!0 (currentBit!5260 (_2!4865 lt!168338)) (currentByte!5265 (_2!4865 lt!168338)) (size!2311 (buf!2708 (_2!4865 lt!168338))))))

(assert (=> d!35612 (= (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!168338))) (currentByte!5265 (_2!4865 lt!168338)) (currentBit!5260 (_2!4865 lt!168338))) lt!169702)))

(declare-fun b!111769 () Bool)

(declare-fun res!92282 () Bool)

(assert (=> b!111769 (=> (not res!92282) (not e!73331))))

(assert (=> b!111769 (= res!92282 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!169702))))

(declare-fun b!111770 () Bool)

(declare-fun lt!169697 () (_ BitVec 64))

(assert (=> b!111770 (= e!73331 (bvsle lt!169702 (bvmul lt!169697 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!111770 (or (= lt!169697 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!169697 #b0000000000000000000000000000000000000000000000000000000000001000) lt!169697)))))

(assert (=> b!111770 (= lt!169697 ((_ sign_extend 32) (size!2311 (buf!2708 (_2!4865 lt!168338)))))))

(assert (= (and d!35612 res!92281) b!111769))

(assert (= (and b!111769 res!92282) b!111770))

(declare-fun m!166709 () Bool)

(assert (=> d!35612 m!166709))

(declare-fun m!166711 () Bool)

(assert (=> d!35612 m!166711))

(assert (=> b!111042 d!35612))

(assert (=> b!111042 d!34856))

(assert (=> d!34868 d!34874))

(declare-fun d!35614 () Bool)

(assert (=> d!35614 (validate_offset_bits!1 ((_ sign_extend 32) (size!2311 (buf!2708 (_2!4865 lt!167643)))) ((_ sign_extend 32) (currentByte!5265 thiss!1305)) ((_ sign_extend 32) (currentBit!5260 thiss!1305)) lt!167628)))

(assert (=> d!35614 true))

(declare-fun _$6!244 () Unit!6790)

(assert (=> d!35614 (= (choose!9 thiss!1305 (buf!2708 (_2!4865 lt!167643)) lt!167628 (BitStream!4097 (buf!2708 (_2!4865 lt!167643)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305))) _$6!244)))

(declare-fun bs!8686 () Bool)

(assert (= bs!8686 d!35614))

(assert (=> bs!8686 m!164371))

(assert (=> d!34868 d!35614))

(assert (=> b!110873 d!34858))

(assert (=> b!110873 d!34856))

(assert (=> b!110925 d!34858))

(declare-fun d!35616 () Bool)

(assert (=> d!35616 (arrayBitRangesEq!0 (buf!2708 (_2!4865 lt!167643)) (buf!2708 thiss!1305) lt!168005 lt!168004)))

(declare-fun lt!169705 () Unit!6790)

(declare-fun choose!8 (array!5081 array!5081 (_ BitVec 64) (_ BitVec 64)) Unit!6790)

(assert (=> d!35616 (= lt!169705 (choose!8 (buf!2708 thiss!1305) (buf!2708 (_2!4865 lt!167643)) lt!168005 lt!168004))))

(assert (=> d!35616 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!168005) (bvsle lt!168005 lt!168004))))

(assert (=> d!35616 (= (arrayBitRangesEqSymmetric!0 (buf!2708 thiss!1305) (buf!2708 (_2!4865 lt!167643)) lt!168005 lt!168004) lt!169705)))

(declare-fun bs!8687 () Bool)

(assert (= bs!8687 d!35616))

(assert (=> bs!8687 m!164697))

(declare-fun m!166713 () Bool)

(assert (=> bs!8687 m!166713))

(assert (=> b!110925 d!35616))

(declare-fun b!111771 () Bool)

(declare-fun e!73337 () Bool)

(declare-fun e!73335 () Bool)

(assert (=> b!111771 (= e!73337 e!73335)))

(declare-fun c!6801 () Bool)

(declare-fun lt!169708 () tuple4!76)

(assert (=> b!111771 (= c!6801 (= (_3!259 lt!169708) (_4!38 lt!169708)))))

(declare-fun e!73334 () Bool)

(declare-fun b!111772 () Bool)

(assert (=> b!111772 (= e!73334 (arrayRangesEq!39 (buf!2708 (_2!4865 lt!167643)) (buf!2708 thiss!1305) (_1!4885 lt!169708) (_2!4885 lt!169708)))))

(declare-fun b!111773 () Bool)

(declare-fun call!1415 () Bool)

(assert (=> b!111773 (= e!73335 call!1415)))

(declare-fun b!111774 () Bool)

(declare-fun e!73332 () Bool)

(assert (=> b!111774 (= e!73332 e!73337)))

(declare-fun res!92284 () Bool)

(assert (=> b!111774 (=> (not res!92284) (not e!73337))))

(assert (=> b!111774 (= res!92284 e!73334)))

(declare-fun res!92285 () Bool)

(assert (=> b!111774 (=> res!92285 e!73334)))

(assert (=> b!111774 (= res!92285 (bvsge (_1!4885 lt!169708) (_2!4885 lt!169708)))))

(declare-fun lt!169707 () (_ BitVec 32))

(assert (=> b!111774 (= lt!169707 ((_ extract 31 0) (bvsrem lt!168004 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!169706 () (_ BitVec 32))

(assert (=> b!111774 (= lt!169706 ((_ extract 31 0) (bvsrem lt!168005 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!111774 (= lt!169708 (arrayBitIndices!0 lt!168005 lt!168004))))

(declare-fun b!111775 () Bool)

(declare-fun res!92283 () Bool)

(assert (=> b!111775 (= res!92283 (= lt!169707 #b00000000000000000000000000000000))))

(declare-fun e!73336 () Bool)

(assert (=> b!111775 (=> res!92283 e!73336)))

(declare-fun e!73333 () Bool)

(assert (=> b!111775 (= e!73333 e!73336)))

(declare-fun b!111776 () Bool)

(assert (=> b!111776 (= e!73335 e!73333)))

(declare-fun res!92287 () Bool)

(assert (=> b!111776 (= res!92287 call!1415)))

(assert (=> b!111776 (=> (not res!92287) (not e!73333))))

(declare-fun d!35618 () Bool)

(declare-fun res!92286 () Bool)

(assert (=> d!35618 (=> res!92286 e!73332)))

(assert (=> d!35618 (= res!92286 (bvsge lt!168005 lt!168004))))

(assert (=> d!35618 (= (arrayBitRangesEq!0 (buf!2708 (_2!4865 lt!167643)) (buf!2708 thiss!1305) lt!168005 lt!168004) e!73332)))

(declare-fun bm!1412 () Bool)

(assert (=> bm!1412 (= call!1415 (byteRangesEq!0 (select (arr!2904 (buf!2708 (_2!4865 lt!167643))) (_3!259 lt!169708)) (select (arr!2904 (buf!2708 thiss!1305)) (_3!259 lt!169708)) lt!169706 (ite c!6801 lt!169707 #b00000000000000000000000000001000)))))

(declare-fun b!111777 () Bool)

(assert (=> b!111777 (= e!73336 (byteRangesEq!0 (select (arr!2904 (buf!2708 (_2!4865 lt!167643))) (_4!38 lt!169708)) (select (arr!2904 (buf!2708 thiss!1305)) (_4!38 lt!169708)) #b00000000000000000000000000000000 lt!169707))))

(assert (= (and d!35618 (not res!92286)) b!111774))

(assert (= (and b!111774 (not res!92285)) b!111772))

(assert (= (and b!111774 res!92284) b!111771))

(assert (= (and b!111771 c!6801) b!111773))

(assert (= (and b!111771 (not c!6801)) b!111776))

(assert (= (and b!111776 res!92287) b!111775))

(assert (= (and b!111775 (not res!92283)) b!111777))

(assert (= (or b!111773 b!111776) bm!1412))

(declare-fun m!166715 () Bool)

(assert (=> b!111772 m!166715))

(declare-fun m!166717 () Bool)

(assert (=> b!111774 m!166717))

(declare-fun m!166719 () Bool)

(assert (=> bm!1412 m!166719))

(declare-fun m!166721 () Bool)

(assert (=> bm!1412 m!166721))

(assert (=> bm!1412 m!166719))

(assert (=> bm!1412 m!166721))

(declare-fun m!166723 () Bool)

(assert (=> bm!1412 m!166723))

(declare-fun m!166725 () Bool)

(assert (=> b!111777 m!166725))

(declare-fun m!166727 () Bool)

(assert (=> b!111777 m!166727))

(assert (=> b!111777 m!166725))

(assert (=> b!111777 m!166727))

(declare-fun m!166729 () Bool)

(assert (=> b!111777 m!166729))

(assert (=> b!110925 d!35618))

(declare-fun d!35620 () Bool)

(declare-fun e!73338 () Bool)

(assert (=> d!35620 e!73338))

(declare-fun res!92288 () Bool)

(assert (=> d!35620 (=> (not res!92288) (not e!73338))))

(assert (=> d!35620 (= res!92288 (= (buf!2708 (_2!4865 (increaseBitIndex!0 (BitStream!4097 (buf!2708 (_2!4865 lt!167643)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305))))) (buf!2708 (BitStream!4097 (buf!2708 (_2!4865 lt!167643)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305)))))))

(declare-fun lt!169715 () Bool)

(assert (=> d!35620 (= lt!169715 (not (= (bvand ((_ sign_extend 24) (select (arr!2904 (buf!2708 (BitStream!4097 (buf!2708 (_2!4865 lt!167643)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305)))) (currentByte!5265 (BitStream!4097 (buf!2708 (_2!4865 lt!167643)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5260 (BitStream!4097 (buf!2708 (_2!4865 lt!167643)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!169710 () tuple2!9240)

(assert (=> d!35620 (= lt!169710 (tuple2!9241 (not (= (bvand ((_ sign_extend 24) (select (arr!2904 (buf!2708 (BitStream!4097 (buf!2708 (_2!4865 lt!167643)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305)))) (currentByte!5265 (BitStream!4097 (buf!2708 (_2!4865 lt!167643)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5260 (BitStream!4097 (buf!2708 (_2!4865 lt!167643)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305)))))) #b00000000000000000000000000000000)) (_2!4865 (increaseBitIndex!0 (BitStream!4097 (buf!2708 (_2!4865 lt!167643)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305))))))))

(assert (=> d!35620 (validate_offset_bit!0 ((_ sign_extend 32) (size!2311 (buf!2708 (BitStream!4097 (buf!2708 (_2!4865 lt!167643)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305))))) ((_ sign_extend 32) (currentByte!5265 (BitStream!4097 (buf!2708 (_2!4865 lt!167643)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305)))) ((_ sign_extend 32) (currentBit!5260 (BitStream!4097 (buf!2708 (_2!4865 lt!167643)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305)))))))

(assert (=> d!35620 (= (readBit!0 (BitStream!4097 (buf!2708 (_2!4865 lt!167643)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305))) lt!169710)))

(declare-fun b!111778 () Bool)

(declare-fun lt!169713 () (_ BitVec 64))

(declare-fun lt!169709 () (_ BitVec 64))

(assert (=> b!111778 (= e!73338 (= (bitIndex!0 (size!2311 (buf!2708 (_2!4865 (increaseBitIndex!0 (BitStream!4097 (buf!2708 (_2!4865 lt!167643)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305)))))) (currentByte!5265 (_2!4865 (increaseBitIndex!0 (BitStream!4097 (buf!2708 (_2!4865 lt!167643)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305))))) (currentBit!5260 (_2!4865 (increaseBitIndex!0 (BitStream!4097 (buf!2708 (_2!4865 lt!167643)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305)))))) (bvadd lt!169709 lt!169713)))))

(assert (=> b!111778 (or (not (= (bvand lt!169709 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!169713 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!169709 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!169709 lt!169713) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!111778 (= lt!169713 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!111778 (= lt!169709 (bitIndex!0 (size!2311 (buf!2708 (BitStream!4097 (buf!2708 (_2!4865 lt!167643)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305)))) (currentByte!5265 (BitStream!4097 (buf!2708 (_2!4865 lt!167643)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305))) (currentBit!5260 (BitStream!4097 (buf!2708 (_2!4865 lt!167643)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305)))))))

(declare-fun lt!169711 () Bool)

(assert (=> b!111778 (= lt!169711 (not (= (bvand ((_ sign_extend 24) (select (arr!2904 (buf!2708 (BitStream!4097 (buf!2708 (_2!4865 lt!167643)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305)))) (currentByte!5265 (BitStream!4097 (buf!2708 (_2!4865 lt!167643)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5260 (BitStream!4097 (buf!2708 (_2!4865 lt!167643)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!169714 () Bool)

(assert (=> b!111778 (= lt!169714 (not (= (bvand ((_ sign_extend 24) (select (arr!2904 (buf!2708 (BitStream!4097 (buf!2708 (_2!4865 lt!167643)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305)))) (currentByte!5265 (BitStream!4097 (buf!2708 (_2!4865 lt!167643)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5260 (BitStream!4097 (buf!2708 (_2!4865 lt!167643)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!169712 () Bool)

(assert (=> b!111778 (= lt!169712 (not (= (bvand ((_ sign_extend 24) (select (arr!2904 (buf!2708 (BitStream!4097 (buf!2708 (_2!4865 lt!167643)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305)))) (currentByte!5265 (BitStream!4097 (buf!2708 (_2!4865 lt!167643)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5260 (BitStream!4097 (buf!2708 (_2!4865 lt!167643)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!35620 res!92288) b!111778))

(declare-fun m!166731 () Bool)

(assert (=> d!35620 m!166731))

(declare-fun m!166733 () Bool)

(assert (=> d!35620 m!166733))

(declare-fun m!166735 () Bool)

(assert (=> d!35620 m!166735))

(declare-fun m!166737 () Bool)

(assert (=> d!35620 m!166737))

(assert (=> b!111778 m!166731))

(assert (=> b!111778 m!166735))

(declare-fun m!166739 () Bool)

(assert (=> b!111778 m!166739))

(declare-fun m!166741 () Bool)

(assert (=> b!111778 m!166741))

(assert (=> b!111778 m!166733))

(assert (=> d!34870 d!35620))

(assert (=> b!111060 d!34856))

(declare-fun d!35622 () Bool)

(assert (=> d!35622 (arrayBitRangesEq!0 (buf!2708 (_2!4865 lt!167643)) (buf!2708 (_2!4865 lt!167626)) lt!168372 lt!168371)))

(declare-fun lt!169716 () Unit!6790)

(assert (=> d!35622 (= lt!169716 (choose!8 (buf!2708 (_2!4865 lt!167626)) (buf!2708 (_2!4865 lt!167643)) lt!168372 lt!168371))))

(assert (=> d!35622 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!168372) (bvsle lt!168372 lt!168371))))

(assert (=> d!35622 (= (arrayBitRangesEqSymmetric!0 (buf!2708 (_2!4865 lt!167626)) (buf!2708 (_2!4865 lt!167643)) lt!168372 lt!168371) lt!169716)))

(declare-fun bs!8688 () Bool)

(assert (= bs!8688 d!35622))

(assert (=> bs!8688 m!164945))

(declare-fun m!166743 () Bool)

(assert (=> bs!8688 m!166743))

(assert (=> b!111060 d!35622))

(declare-fun b!111779 () Bool)

(declare-fun e!73344 () Bool)

(declare-fun e!73342 () Bool)

(assert (=> b!111779 (= e!73344 e!73342)))

(declare-fun c!6802 () Bool)

(declare-fun lt!169719 () tuple4!76)

(assert (=> b!111779 (= c!6802 (= (_3!259 lt!169719) (_4!38 lt!169719)))))

(declare-fun e!73341 () Bool)

(declare-fun b!111780 () Bool)

(assert (=> b!111780 (= e!73341 (arrayRangesEq!39 (buf!2708 (_2!4865 lt!167643)) (buf!2708 (_2!4865 lt!167626)) (_1!4885 lt!169719) (_2!4885 lt!169719)))))

(declare-fun b!111781 () Bool)

(declare-fun call!1416 () Bool)

(assert (=> b!111781 (= e!73342 call!1416)))

(declare-fun b!111782 () Bool)

(declare-fun e!73339 () Bool)

(assert (=> b!111782 (= e!73339 e!73344)))

(declare-fun res!92290 () Bool)

(assert (=> b!111782 (=> (not res!92290) (not e!73344))))

(assert (=> b!111782 (= res!92290 e!73341)))

(declare-fun res!92291 () Bool)

(assert (=> b!111782 (=> res!92291 e!73341)))

(assert (=> b!111782 (= res!92291 (bvsge (_1!4885 lt!169719) (_2!4885 lt!169719)))))

(declare-fun lt!169718 () (_ BitVec 32))

(assert (=> b!111782 (= lt!169718 ((_ extract 31 0) (bvsrem lt!168371 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!169717 () (_ BitVec 32))

(assert (=> b!111782 (= lt!169717 ((_ extract 31 0) (bvsrem lt!168372 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!111782 (= lt!169719 (arrayBitIndices!0 lt!168372 lt!168371))))

(declare-fun b!111783 () Bool)

(declare-fun res!92289 () Bool)

(assert (=> b!111783 (= res!92289 (= lt!169718 #b00000000000000000000000000000000))))

(declare-fun e!73343 () Bool)

(assert (=> b!111783 (=> res!92289 e!73343)))

(declare-fun e!73340 () Bool)

(assert (=> b!111783 (= e!73340 e!73343)))

(declare-fun b!111784 () Bool)

(assert (=> b!111784 (= e!73342 e!73340)))

(declare-fun res!92293 () Bool)

(assert (=> b!111784 (= res!92293 call!1416)))

(assert (=> b!111784 (=> (not res!92293) (not e!73340))))

(declare-fun d!35624 () Bool)

(declare-fun res!92292 () Bool)

(assert (=> d!35624 (=> res!92292 e!73339)))

(assert (=> d!35624 (= res!92292 (bvsge lt!168372 lt!168371))))

(assert (=> d!35624 (= (arrayBitRangesEq!0 (buf!2708 (_2!4865 lt!167643)) (buf!2708 (_2!4865 lt!167626)) lt!168372 lt!168371) e!73339)))

(declare-fun bm!1413 () Bool)

(assert (=> bm!1413 (= call!1416 (byteRangesEq!0 (select (arr!2904 (buf!2708 (_2!4865 lt!167643))) (_3!259 lt!169719)) (select (arr!2904 (buf!2708 (_2!4865 lt!167626))) (_3!259 lt!169719)) lt!169717 (ite c!6802 lt!169718 #b00000000000000000000000000001000)))))

(declare-fun b!111785 () Bool)

(assert (=> b!111785 (= e!73343 (byteRangesEq!0 (select (arr!2904 (buf!2708 (_2!4865 lt!167643))) (_4!38 lt!169719)) (select (arr!2904 (buf!2708 (_2!4865 lt!167626))) (_4!38 lt!169719)) #b00000000000000000000000000000000 lt!169718))))

(assert (= (and d!35624 (not res!92292)) b!111782))

(assert (= (and b!111782 (not res!92291)) b!111780))

(assert (= (and b!111782 res!92290) b!111779))

(assert (= (and b!111779 c!6802) b!111781))

(assert (= (and b!111779 (not c!6802)) b!111784))

(assert (= (and b!111784 res!92293) b!111783))

(assert (= (and b!111783 (not res!92289)) b!111785))

(assert (= (or b!111781 b!111784) bm!1413))

(declare-fun m!166745 () Bool)

(assert (=> b!111780 m!166745))

(declare-fun m!166747 () Bool)

(assert (=> b!111782 m!166747))

(declare-fun m!166749 () Bool)

(assert (=> bm!1413 m!166749))

(declare-fun m!166751 () Bool)

(assert (=> bm!1413 m!166751))

(assert (=> bm!1413 m!166749))

(assert (=> bm!1413 m!166751))

(declare-fun m!166753 () Bool)

(assert (=> bm!1413 m!166753))

(declare-fun m!166755 () Bool)

(assert (=> b!111785 m!166755))

(declare-fun m!166757 () Bool)

(assert (=> b!111785 m!166757))

(assert (=> b!111785 m!166755))

(assert (=> b!111785 m!166757))

(declare-fun m!166759 () Bool)

(assert (=> b!111785 m!166759))

(assert (=> b!111060 d!35624))

(declare-fun d!35626 () Bool)

(declare-fun res!92295 () Bool)

(declare-fun e!73346 () Bool)

(assert (=> d!35626 (=> (not res!92295) (not e!73346))))

(assert (=> d!35626 (= res!92295 (= (size!2311 (buf!2708 (_1!4867 lt!168013))) (size!2311 (buf!2708 thiss!1305))))))

(assert (=> d!35626 (= (isPrefixOf!0 (_1!4867 lt!168013) thiss!1305) e!73346)))

(declare-fun b!111786 () Bool)

(declare-fun res!92294 () Bool)

(assert (=> b!111786 (=> (not res!92294) (not e!73346))))

(assert (=> b!111786 (= res!92294 (bvsle (bitIndex!0 (size!2311 (buf!2708 (_1!4867 lt!168013))) (currentByte!5265 (_1!4867 lt!168013)) (currentBit!5260 (_1!4867 lt!168013))) (bitIndex!0 (size!2311 (buf!2708 thiss!1305)) (currentByte!5265 thiss!1305) (currentBit!5260 thiss!1305))))))

(declare-fun b!111787 () Bool)

(declare-fun e!73345 () Bool)

(assert (=> b!111787 (= e!73346 e!73345)))

(declare-fun res!92296 () Bool)

(assert (=> b!111787 (=> res!92296 e!73345)))

(assert (=> b!111787 (= res!92296 (= (size!2311 (buf!2708 (_1!4867 lt!168013))) #b00000000000000000000000000000000))))

(declare-fun b!111788 () Bool)

(assert (=> b!111788 (= e!73345 (arrayBitRangesEq!0 (buf!2708 (_1!4867 lt!168013)) (buf!2708 thiss!1305) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2311 (buf!2708 (_1!4867 lt!168013))) (currentByte!5265 (_1!4867 lt!168013)) (currentBit!5260 (_1!4867 lt!168013)))))))

(assert (= (and d!35626 res!92295) b!111786))

(assert (= (and b!111786 res!92294) b!111787))

(assert (= (and b!111787 (not res!92296)) b!111788))

(assert (=> b!111786 m!166393))

(assert (=> b!111786 m!164351))

(assert (=> b!111788 m!166393))

(assert (=> b!111788 m!166393))

(declare-fun m!166761 () Bool)

(assert (=> b!111788 m!166761))

(assert (=> b!110923 d!35626))

(assert (=> d!34902 d!34946))

(declare-fun d!35628 () Bool)

(assert (=> d!35628 (validate_offset_bits!1 ((_ sign_extend 32) (size!2311 (buf!2708 (_2!4865 lt!167643)))) ((_ sign_extend 32) (currentByte!5265 (_2!4865 lt!167626))) ((_ sign_extend 32) (currentBit!5260 (_2!4865 lt!167626))) lt!167636)))

(assert (=> d!35628 true))

(declare-fun _$6!245 () Unit!6790)

(assert (=> d!35628 (= (choose!9 (_2!4865 lt!167626) (buf!2708 (_2!4865 lt!167643)) lt!167636 (BitStream!4097 (buf!2708 (_2!4865 lt!167643)) (currentByte!5265 (_2!4865 lt!167626)) (currentBit!5260 (_2!4865 lt!167626)))) _$6!245)))

(declare-fun bs!8689 () Bool)

(assert (= bs!8689 d!35628))

(assert (=> bs!8689 m!164367))

(assert (=> d!34902 d!35628))

(declare-fun d!35630 () Bool)

(assert (=> d!35630 (= (remainingBits!0 ((_ sign_extend 32) (size!2311 (buf!2708 (_2!4865 lt!167643)))) ((_ sign_extend 32) (currentByte!5265 (_2!4865 lt!167626))) ((_ sign_extend 32) (currentBit!5260 (_2!4865 lt!167626)))) (bvsub (bvmul ((_ sign_extend 32) (size!2311 (buf!2708 (_2!4865 lt!167643)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5265 (_2!4865 lt!167626))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5260 (_2!4865 lt!167626))))))))

(assert (=> d!34946 d!35630))

(declare-fun d!35632 () Bool)

(declare-fun res!92298 () Bool)

(declare-fun e!73348 () Bool)

(assert (=> d!35632 (=> (not res!92298) (not e!73348))))

(assert (=> d!35632 (= res!92298 (= (size!2311 (buf!2708 (_2!4865 lt!167626))) (size!2311 (buf!2708 (_2!4865 lt!168338)))))))

(assert (=> d!35632 (= (isPrefixOf!0 (_2!4865 lt!167626) (_2!4865 lt!168338)) e!73348)))

(declare-fun b!111789 () Bool)

(declare-fun res!92297 () Bool)

(assert (=> b!111789 (=> (not res!92297) (not e!73348))))

(assert (=> b!111789 (= res!92297 (bvsle (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!167626))) (currentByte!5265 (_2!4865 lt!167626)) (currentBit!5260 (_2!4865 lt!167626))) (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!168338))) (currentByte!5265 (_2!4865 lt!168338)) (currentBit!5260 (_2!4865 lt!168338)))))))

(declare-fun b!111790 () Bool)

(declare-fun e!73347 () Bool)

(assert (=> b!111790 (= e!73348 e!73347)))

(declare-fun res!92299 () Bool)

(assert (=> b!111790 (=> res!92299 e!73347)))

(assert (=> b!111790 (= res!92299 (= (size!2311 (buf!2708 (_2!4865 lt!167626))) #b00000000000000000000000000000000))))

(declare-fun b!111791 () Bool)

(assert (=> b!111791 (= e!73347 (arrayBitRangesEq!0 (buf!2708 (_2!4865 lt!167626)) (buf!2708 (_2!4865 lt!168338)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2311 (buf!2708 (_2!4865 lt!167626))) (currentByte!5265 (_2!4865 lt!167626)) (currentBit!5260 (_2!4865 lt!167626)))))))

(assert (= (and d!35632 res!92298) b!111789))

(assert (= (and b!111789 res!92297) b!111790))

(assert (= (and b!111790 (not res!92299)) b!111791))

(assert (=> b!111789 m!164349))

(assert (=> b!111789 m!164893))

(assert (=> b!111791 m!164349))

(assert (=> b!111791 m!164349))

(declare-fun m!166763 () Bool)

(assert (=> b!111791 m!166763))

(assert (=> b!111037 d!35632))

(declare-fun b!111792 () Bool)

(declare-fun res!92301 () Bool)

(declare-fun e!73350 () Bool)

(assert (=> b!111792 (=> (not res!92301) (not e!73350))))

(declare-fun lt!169726 () (_ BitVec 64))

(declare-fun lt!169722 () (_ BitVec 64))

(declare-fun lt!169723 () tuple2!9244)

(assert (=> b!111792 (= res!92301 (= (bvlshr (_1!4879 lt!169723) lt!169726) (bvlshr (bvor lt!167644 (ite (_2!4866 lt!167639) lt!167637 #b0000000000000000000000000000000000000000000000000000000000000000)) lt!169722)))))

(assert (=> b!111792 (and (bvsge lt!169722 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!169722 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!111792 (= lt!169722 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!111792 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!111792 (and (bvsge lt!169726 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!169726 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!111792 (= lt!169726 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!111792 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(declare-fun b!111793 () Bool)

(declare-fun e!73349 () Bool)

(assert (=> b!111793 (= e!73350 e!73349)))

(declare-fun res!92303 () Bool)

(assert (=> b!111793 (=> res!92303 e!73349)))

(assert (=> b!111793 (= res!92303 (bvsge (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(declare-fun b!111794 () Bool)

(declare-fun e!73351 () tuple2!9244)

(assert (=> b!111794 (= e!73351 (tuple2!9245 (bvor lt!167644 (ite (_2!4866 lt!167639) lt!167637 #b0000000000000000000000000000000000000000000000000000000000000000)) (_1!4867 lt!167640)))))

(declare-fun d!35634 () Bool)

(assert (=> d!35634 e!73350))

(declare-fun res!92304 () Bool)

(assert (=> d!35634 (=> (not res!92304) (not e!73350))))

(assert (=> d!35634 (= res!92304 (= (buf!2708 (_2!4879 lt!169723)) (buf!2708 (_1!4867 lt!167640))))))

(assert (=> d!35634 (= lt!169723 e!73351)))

(declare-fun c!6803 () Bool)

(assert (=> d!35634 (= c!6803 (= nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> d!35634 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!35634 (= (readNLeastSignificantBitsLoop!0 (_1!4867 lt!167640) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) (bvor lt!167644 (ite (_2!4866 lt!167639) lt!167637 #b0000000000000000000000000000000000000000000000000000000000000000))) lt!169723)))

(declare-fun b!111795 () Bool)

(declare-fun res!92300 () Bool)

(assert (=> b!111795 (=> (not res!92300) (not e!73350))))

(assert (=> b!111795 (= res!92300 (= (bvand (_1!4879 lt!169723) (onesLSBLong!0 nBits!396)) (_1!4879 lt!169723)))))

(declare-fun b!111796 () Bool)

(declare-fun lt!169727 () tuple2!9244)

(assert (=> b!111796 (= e!73351 (tuple2!9245 (_1!4879 lt!169727) (_2!4879 lt!169727)))))

(declare-fun lt!169728 () tuple2!9240)

(assert (=> b!111796 (= lt!169728 (readBit!0 (_1!4867 lt!167640)))))

(assert (=> b!111796 (= lt!169727 (readNLeastSignificantBitsLoop!0 (_2!4877 lt!169728) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor (bvor lt!167644 (ite (_2!4866 lt!167639) lt!167637 #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!4877 lt!169728) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!111797 () Bool)

(declare-fun res!92302 () Bool)

(assert (=> b!111797 (=> (not res!92302) (not e!73350))))

(declare-fun lt!169724 () (_ BitVec 64))

(declare-fun lt!169720 () (_ BitVec 64))

(assert (=> b!111797 (= res!92302 (= (bitIndex!0 (size!2311 (buf!2708 (_2!4879 lt!169723))) (currentByte!5265 (_2!4879 lt!169723)) (currentBit!5260 (_2!4879 lt!169723))) (bvadd lt!169724 lt!169720)))))

(assert (=> b!111797 (or (not (= (bvand lt!169724 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!169720 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!169724 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!169724 lt!169720) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!111797 (= lt!169720 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!111797 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!111797 (= lt!169724 (bitIndex!0 (size!2311 (buf!2708 (_1!4867 lt!167640))) (currentByte!5265 (_1!4867 lt!167640)) (currentBit!5260 (_1!4867 lt!167640))))))

(declare-fun b!111798 () Bool)

(declare-fun lt!169721 () (_ BitVec 64))

(assert (=> b!111798 (= e!73349 (= (= (bvand (bvlshr (_1!4879 lt!169723) lt!169721) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!4866 (readBitPure!0 (_1!4867 lt!167640)))))))

(assert (=> b!111798 (and (bvsge lt!169721 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!169721 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!169725 () (_ BitVec 32))

(assert (=> b!111798 (= lt!169721 ((_ sign_extend 32) (bvsub lt!169725 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!111798 (or (= (bvand lt!169725 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand lt!169725 #b10000000000000000000000000000000) (bvand (bvsub lt!169725 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!111798 (= lt!169725 (bvsub nBits!396 #b00000000000000000000000000000001))))

(assert (=> b!111798 (or (= (bvand nBits!396 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(assert (= (and d!35634 c!6803) b!111794))

(assert (= (and d!35634 (not c!6803)) b!111796))

(assert (= (and d!35634 res!92304) b!111797))

(assert (= (and b!111797 res!92302) b!111792))

(assert (= (and b!111792 res!92301) b!111795))

(assert (= (and b!111795 res!92300) b!111793))

(assert (= (and b!111793 (not res!92303)) b!111798))

(assert (=> b!111795 m!164343))

(declare-fun m!166765 () Bool)

(assert (=> b!111796 m!166765))

(declare-fun m!166767 () Bool)

(assert (=> b!111796 m!166767))

(declare-fun m!166769 () Bool)

(assert (=> b!111797 m!166769))

(declare-fun m!166771 () Bool)

(assert (=> b!111797 m!166771))

(declare-fun m!166773 () Bool)

(assert (=> b!111798 m!166773))

(assert (=> d!34864 d!35634))

(declare-fun d!35636 () Bool)

(declare-fun e!73352 () Bool)

(assert (=> d!35636 e!73352))

(declare-fun res!92305 () Bool)

(assert (=> d!35636 (=> (not res!92305) (not e!73352))))

(declare-fun lt!169729 () BitStream!4096)

(declare-fun lt!169730 () (_ BitVec 64))

(assert (=> d!35636 (= res!92305 (= (bvadd lt!169730 (bvsub lt!168367 lt!168366)) (bitIndex!0 (size!2311 (buf!2708 lt!169729)) (currentByte!5265 lt!169729) (currentBit!5260 lt!169729))))))

(assert (=> d!35636 (or (not (= (bvand lt!169730 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!168367 lt!168366) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!169730 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!169730 (bvsub lt!168367 lt!168366)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35636 (= lt!169730 (bitIndex!0 (size!2311 (buf!2708 (_2!4867 lt!168380))) (currentByte!5265 (_2!4867 lt!168380)) (currentBit!5260 (_2!4867 lt!168380))))))

(assert (=> d!35636 (= lt!169729 (_2!4865 (moveBitIndex!0 (_2!4867 lt!168380) (bvsub lt!168367 lt!168366))))))

(assert (=> d!35636 (moveBitIndexPrecond!0 (_2!4867 lt!168380) (bvsub lt!168367 lt!168366))))

(assert (=> d!35636 (= (withMovedBitIndex!0 (_2!4867 lt!168380) (bvsub lt!168367 lt!168366)) lt!169729)))

(declare-fun b!111799 () Bool)

(assert (=> b!111799 (= e!73352 (= (size!2311 (buf!2708 (_2!4867 lt!168380))) (size!2311 (buf!2708 lt!169729))))))

(assert (= (and d!35636 res!92305) b!111799))

(declare-fun m!166775 () Bool)

(assert (=> d!35636 m!166775))

(assert (=> d!35636 m!166285))

(declare-fun m!166777 () Bool)

(assert (=> d!35636 m!166777))

(declare-fun m!166779 () Bool)

(assert (=> d!35636 m!166779))

(assert (=> b!111062 d!35636))

(assert (=> b!111062 d!35596))

(assert (=> b!111062 d!34856))

(push 1)

(assert (not b!111747))

(assert (not b!111711))

(assert (not b!111670))

(assert (not d!35582))

(assert (not d!35612))

(assert (not b!111624))

(assert (not b!111780))

(assert (not b!111719))

(assert (not d!35456))

(assert (not b!111667))

(assert (not d!35490))

(assert (not b!111585))

(assert (not b!111595))

(assert (not b!111786))

(assert (not b!111665))

(assert (not b!111727))

(assert (not b!111772))

(assert (not b!111791))

(assert (not d!35472))

(assert (not d!35458))

(assert (not d!35584))

(assert (not d!35428))

(assert (not b!111671))

(assert (not d!35586))

(assert (not d!35538))

(assert (not b!111795))

(assert (not d!35432))

(assert (not b!111644))

(assert (not b!111768))

(assert (not b!111764))

(assert (not b!111750))

(assert (not bm!1410))

(assert (not d!35580))

(assert (not b!111789))

(assert (not b!111718))

(assert (not b!111766))

(assert (not d!35572))

(assert (not d!35594))

(assert (not b!111623))

(assert (not b!111613))

(assert (not d!35542))

(assert (not b!111778))

(assert (not b!111659))

(assert (not b!111721))

(assert (not b!111609))

(assert (not d!35470))

(assert (not b!111618))

(assert (not b!111664))

(assert (not b!111622))

(assert (not b!111746))

(assert (not b!111626))

(assert (not d!35574))

(assert (not b!111709))

(assert (not b!111658))

(assert (not b!111668))

(assert (not d!35616))

(assert (not d!35598))

(assert (not d!35426))

(assert (not d!35628))

(assert (not b!111607))

(assert (not b!111796))

(assert (not b!111788))

(assert (not b!111601))

(assert (not b!111654))

(assert (not b!111593))

(assert (not b!111759))

(assert (not b!111615))

(assert (not d!35620))

(assert (not d!35506))

(assert (not d!35604))

(assert (not d!35576))

(assert (not d!35480))

(assert (not b!111717))

(assert (not b!111728))

(assert (not d!35596))

(assert (not d!35460))

(assert (not b!111785))

(assert (not b!111676))

(assert (not b!111612))

(assert (not d!35508))

(assert (not d!35566))

(assert (not b!111774))

(assert (not d!35556))

(assert (not d!35522))

(assert (not b!111610))

(assert (not b!111662))

(assert (not d!35430))

(assert (not bm!1413))

(assert (not b!111673))

(assert (not b!111691))

(assert (not d!35564))

(assert (not d!35552))

(assert (not b!111714))

(assert (not bm!1412))

(assert (not b!111722))

(assert (not d!35540))

(assert (not b!111777))

(assert (not b!111798))

(assert (not b!111621))

(assert (not d!35468))

(assert (not b!111753))

(assert (not d!35502))

(assert (not d!35484))

(assert (not b!111715))

(assert (not bm!1411))

(assert (not b!111693))

(assert (not d!35622))

(assert (not b!111724))

(assert (not d!35516))

(assert (not b!111726))

(assert (not d!35560))

(assert (not d!35448))

(assert (not d!35530))

(assert (not b!111674))

(assert (not b!111742))

(assert (not d!35562))

(assert (not b!111661))

(assert (not b!111761))

(assert (not d!35476))

(assert (not b!111689))

(assert (not b!111645))

(assert (not d!35442))

(assert (not b!111751))

(assert (not b!111646))

(assert (not bm!1409))

(assert (not b!111619))

(assert (not b!111616))

(assert (not b!111688))

(assert (not d!35544))

(assert (not d!35546))

(assert (not d!35636))

(assert (not d!35548))

(assert (not b!111723))

(assert (not b!111652))

(assert (not b!111749))

(assert (not b!111692))

(assert (not d!35532))

(assert (not b!111797))

(assert (not d!35550))

(assert (not b!111744))

(assert (not b!111720))

(assert (not d!35570))

(assert (not d!35498))

(assert (not b!111606))

(assert (not d!35524))

(assert (not b!111782))

(assert (not d!35434))

(assert (not d!35514))

(assert (not d!35534))

(assert (not b!111604))

(assert (not b!111647))

(assert (not d!35558))

(assert (not b!111603))

(assert (not b!111690))

(assert (not b!111741))

(assert (not d!35488))

(assert (not d!35436))

(assert (not b!111655))

(assert (not d!35588))

(assert (not d!35614))

(assert (not d!35474))

(assert (not b!111600))

(assert (not b!111752))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

