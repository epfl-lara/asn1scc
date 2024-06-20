; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20612 () Bool)

(assert start!20612)

(declare-fun b!104300 () Bool)

(declare-fun res!85888 () Bool)

(declare-fun e!68342 () Bool)

(assert (=> b!104300 (=> (not res!85888) (not e!68342))))

(declare-datatypes ((array!4870 0))(
  ( (array!4871 (arr!2816 (Array (_ BitVec 32) (_ BitVec 8))) (size!2223 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3920 0))(
  ( (BitStream!3921 (buf!2589 array!4870) (currentByte!5074 (_ BitVec 32)) (currentBit!5069 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3920)

(declare-datatypes ((Unit!6390 0))(
  ( (Unit!6391) )
))
(declare-datatypes ((tuple2!8630 0))(
  ( (tuple2!8631 (_1!4570 Unit!6390) (_2!4570 BitStream!3920)) )
))
(declare-fun lt!152884 () tuple2!8630)

(declare-fun isPrefixOf!0 (BitStream!3920 BitStream!3920) Bool)

(assert (=> b!104300 (= res!85888 (isPrefixOf!0 thiss!1305 (_2!4570 lt!152884)))))

(declare-fun b!104301 () Bool)

(declare-fun e!68341 () Bool)

(declare-fun lt!152888 () tuple2!8630)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!104301 (= e!68341 (invariant!0 (currentBit!5069 (_2!4570 lt!152888)) (currentByte!5074 (_2!4570 lt!152888)) (size!2223 (buf!2589 (_2!4570 lt!152888)))))))

(declare-fun lt!152902 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!104301 (= lt!152902 (bitIndex!0 (size!2223 (buf!2589 thiss!1305)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305)))))

(declare-datatypes ((tuple2!8632 0))(
  ( (tuple2!8633 (_1!4571 BitStream!3920) (_2!4571 (_ BitVec 64))) )
))
(declare-fun lt!152891 () tuple2!8632)

(declare-fun lt!152896 () tuple2!8632)

(assert (=> b!104301 (and (= (_2!4571 lt!152891) (_2!4571 lt!152896)) (= (_1!4571 lt!152891) (_1!4571 lt!152896)))))

(declare-fun lt!152893 () Unit!6390)

(declare-fun lt!152885 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-datatypes ((tuple2!8634 0))(
  ( (tuple2!8635 (_1!4572 BitStream!3920) (_2!4572 BitStream!3920)) )
))
(declare-fun lt!152882 () tuple2!8634)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3920 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6390)

(assert (=> b!104301 (= lt!152893 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4572 lt!152882) nBits!396 i!615 lt!152885))))

(declare-fun lt!152905 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3920 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8632)

(declare-fun withMovedBitIndex!0 (BitStream!3920 (_ BitVec 64)) BitStream!3920)

(assert (=> b!104301 (= lt!152896 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4572 lt!152882) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!152905))))

(declare-fun b!104302 () Bool)

(declare-fun res!85882 () Bool)

(declare-fun e!68340 () Bool)

(assert (=> b!104302 (=> (not res!85882) (not e!68340))))

(assert (=> b!104302 (= res!85882 (invariant!0 (currentBit!5069 thiss!1305) (currentByte!5074 thiss!1305) (size!2223 (buf!2589 (_2!4570 lt!152884)))))))

(declare-fun b!104303 () Bool)

(declare-fun e!68346 () Bool)

(assert (=> b!104303 (= e!68342 e!68346)))

(declare-fun res!85883 () Bool)

(assert (=> b!104303 (=> (not res!85883) (not e!68346))))

(declare-fun lt!152887 () Bool)

(declare-datatypes ((tuple2!8636 0))(
  ( (tuple2!8637 (_1!4573 BitStream!3920) (_2!4573 Bool)) )
))
(declare-fun lt!152881 () tuple2!8636)

(assert (=> b!104303 (= res!85883 (and (= (_2!4573 lt!152881) lt!152887) (= (_1!4573 lt!152881) (_2!4570 lt!152884))))))

(declare-fun readBitPure!0 (BitStream!3920) tuple2!8636)

(declare-fun readerFrom!0 (BitStream!3920 (_ BitVec 32) (_ BitVec 32)) BitStream!3920)

(assert (=> b!104303 (= lt!152881 (readBitPure!0 (readerFrom!0 (_2!4570 lt!152884) (currentBit!5069 thiss!1305) (currentByte!5074 thiss!1305))))))

(declare-fun b!104304 () Bool)

(declare-fun e!68345 () Bool)

(declare-fun lt!152890 () tuple2!8636)

(declare-fun lt!152892 () tuple2!8636)

(assert (=> b!104304 (= e!68345 (= (_2!4573 lt!152890) (_2!4573 lt!152892)))))

(declare-fun b!104305 () Bool)

(declare-fun e!68337 () Bool)

(assert (=> b!104305 (= e!68337 e!68342)))

(declare-fun res!85886 () Bool)

(assert (=> b!104305 (=> (not res!85886) (not e!68342))))

(declare-fun lt!152903 () (_ BitVec 64))

(declare-fun lt!152900 () (_ BitVec 64))

(assert (=> b!104305 (= res!85886 (= lt!152903 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!152900)))))

(assert (=> b!104305 (= lt!152903 (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!152884))) (currentByte!5074 (_2!4570 lt!152884)) (currentBit!5069 (_2!4570 lt!152884))))))

(assert (=> b!104305 (= lt!152900 (bitIndex!0 (size!2223 (buf!2589 thiss!1305)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305)))))

(declare-fun b!104306 () Bool)

(declare-fun res!85881 () Bool)

(declare-fun e!68338 () Bool)

(assert (=> b!104306 (=> (not res!85881) (not e!68338))))

(assert (=> b!104306 (= res!85881 (bvslt i!615 nBits!396))))

(declare-fun b!104307 () Bool)

(assert (=> b!104307 (= e!68338 (not e!68341))))

(declare-fun res!85892 () Bool)

(assert (=> b!104307 (=> res!85892 e!68341)))

(declare-fun lt!152886 () tuple2!8634)

(assert (=> b!104307 (= res!85892 (not (= (_1!4571 (readNLeastSignificantBitsLoopPure!0 (_1!4572 lt!152886) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!152905)) (_2!4572 lt!152886))))))

(declare-fun lt!152889 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!104307 (validate_offset_bits!1 ((_ sign_extend 32) (size!2223 (buf!2589 (_2!4570 lt!152888)))) ((_ sign_extend 32) (currentByte!5074 (_2!4570 lt!152884))) ((_ sign_extend 32) (currentBit!5069 (_2!4570 lt!152884))) lt!152889)))

(declare-fun lt!152898 () Unit!6390)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3920 array!4870 (_ BitVec 64)) Unit!6390)

(assert (=> b!104307 (= lt!152898 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4570 lt!152884) (buf!2589 (_2!4570 lt!152888)) lt!152889))))

(assert (=> b!104307 (= lt!152889 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!152901 () (_ BitVec 64))

(declare-fun lt!152883 () tuple2!8636)

(assert (=> b!104307 (= lt!152905 (bvor lt!152885 (ite (_2!4573 lt!152883) lt!152901 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!104307 (= lt!152891 (readNLeastSignificantBitsLoopPure!0 (_1!4572 lt!152882) nBits!396 i!615 lt!152885))))

(declare-fun lt!152894 () (_ BitVec 64))

(assert (=> b!104307 (validate_offset_bits!1 ((_ sign_extend 32) (size!2223 (buf!2589 (_2!4570 lt!152888)))) ((_ sign_extend 32) (currentByte!5074 thiss!1305)) ((_ sign_extend 32) (currentBit!5069 thiss!1305)) lt!152894)))

(declare-fun lt!152899 () Unit!6390)

(assert (=> b!104307 (= lt!152899 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2589 (_2!4570 lt!152888)) lt!152894))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!104307 (= lt!152885 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(assert (=> b!104307 (= (_2!4573 lt!152883) lt!152887)))

(assert (=> b!104307 (= lt!152883 (readBitPure!0 (_1!4572 lt!152882)))))

(declare-fun reader!0 (BitStream!3920 BitStream!3920) tuple2!8634)

(assert (=> b!104307 (= lt!152886 (reader!0 (_2!4570 lt!152884) (_2!4570 lt!152888)))))

(assert (=> b!104307 (= lt!152882 (reader!0 thiss!1305 (_2!4570 lt!152888)))))

(assert (=> b!104307 e!68345))

(declare-fun res!85887 () Bool)

(assert (=> b!104307 (=> (not res!85887) (not e!68345))))

(assert (=> b!104307 (= res!85887 (= (bitIndex!0 (size!2223 (buf!2589 (_1!4573 lt!152890))) (currentByte!5074 (_1!4573 lt!152890)) (currentBit!5069 (_1!4573 lt!152890))) (bitIndex!0 (size!2223 (buf!2589 (_1!4573 lt!152892))) (currentByte!5074 (_1!4573 lt!152892)) (currentBit!5069 (_1!4573 lt!152892)))))))

(declare-fun lt!152895 () Unit!6390)

(declare-fun lt!152897 () BitStream!3920)

(declare-fun readBitPrefixLemma!0 (BitStream!3920 BitStream!3920) Unit!6390)

(assert (=> b!104307 (= lt!152895 (readBitPrefixLemma!0 lt!152897 (_2!4570 lt!152888)))))

(assert (=> b!104307 (= lt!152892 (readBitPure!0 (BitStream!3921 (buf!2589 (_2!4570 lt!152888)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305))))))

(assert (=> b!104307 (= lt!152890 (readBitPure!0 lt!152897))))

(assert (=> b!104307 (= lt!152897 (BitStream!3921 (buf!2589 (_2!4570 lt!152884)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305)))))

(assert (=> b!104307 e!68340))

(declare-fun res!85889 () Bool)

(assert (=> b!104307 (=> (not res!85889) (not e!68340))))

(assert (=> b!104307 (= res!85889 (isPrefixOf!0 thiss!1305 (_2!4570 lt!152888)))))

(declare-fun lt!152904 () Unit!6390)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3920 BitStream!3920 BitStream!3920) Unit!6390)

(assert (=> b!104307 (= lt!152904 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4570 lt!152884) (_2!4570 lt!152888)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3920 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8630)

(assert (=> b!104307 (= lt!152888 (appendNLeastSignificantBitsLoop!0 (_2!4570 lt!152884) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!104307 e!68337))

(declare-fun res!85891 () Bool)

(assert (=> b!104307 (=> (not res!85891) (not e!68337))))

(assert (=> b!104307 (= res!85891 (= (size!2223 (buf!2589 thiss!1305)) (size!2223 (buf!2589 (_2!4570 lt!152884)))))))

(declare-fun appendBit!0 (BitStream!3920 Bool) tuple2!8630)

(assert (=> b!104307 (= lt!152884 (appendBit!0 thiss!1305 lt!152887))))

(assert (=> b!104307 (= lt!152887 (not (= (bvand v!199 lt!152901) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!104307 (= lt!152901 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!104308 () Bool)

(declare-fun e!68339 () Bool)

(assert (=> b!104308 (= e!68339 e!68338)))

(declare-fun res!85884 () Bool)

(assert (=> b!104308 (=> (not res!85884) (not e!68338))))

(assert (=> b!104308 (= res!85884 (validate_offset_bits!1 ((_ sign_extend 32) (size!2223 (buf!2589 thiss!1305))) ((_ sign_extend 32) (currentByte!5074 thiss!1305)) ((_ sign_extend 32) (currentBit!5069 thiss!1305)) lt!152894))))

(assert (=> b!104308 (= lt!152894 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun res!85890 () Bool)

(assert (=> start!20612 (=> (not res!85890) (not e!68339))))

(assert (=> start!20612 (= res!85890 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20612 e!68339))

(assert (=> start!20612 true))

(declare-fun e!68344 () Bool)

(declare-fun inv!12 (BitStream!3920) Bool)

(assert (=> start!20612 (and (inv!12 thiss!1305) e!68344)))

(declare-fun b!104309 () Bool)

(declare-fun res!85885 () Bool)

(assert (=> b!104309 (=> (not res!85885) (not e!68338))))

(assert (=> b!104309 (= res!85885 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!104310 () Bool)

(assert (=> b!104310 (= e!68346 (= (bitIndex!0 (size!2223 (buf!2589 (_1!4573 lt!152881))) (currentByte!5074 (_1!4573 lt!152881)) (currentBit!5069 (_1!4573 lt!152881))) lt!152903))))

(declare-fun b!104311 () Bool)

(assert (=> b!104311 (= e!68340 (invariant!0 (currentBit!5069 thiss!1305) (currentByte!5074 thiss!1305) (size!2223 (buf!2589 (_2!4570 lt!152888)))))))

(declare-fun b!104312 () Bool)

(declare-fun array_inv!2025 (array!4870) Bool)

(assert (=> b!104312 (= e!68344 (array_inv!2025 (buf!2589 thiss!1305)))))

(assert (= (and start!20612 res!85890) b!104308))

(assert (= (and b!104308 res!85884) b!104309))

(assert (= (and b!104309 res!85885) b!104306))

(assert (= (and b!104306 res!85881) b!104307))

(assert (= (and b!104307 res!85891) b!104305))

(assert (= (and b!104305 res!85886) b!104300))

(assert (= (and b!104300 res!85888) b!104303))

(assert (= (and b!104303 res!85883) b!104310))

(assert (= (and b!104307 res!85889) b!104302))

(assert (= (and b!104302 res!85882) b!104311))

(assert (= (and b!104307 res!85887) b!104304))

(assert (= (and b!104307 (not res!85892)) b!104301))

(assert (= start!20612 b!104312))

(declare-fun m!152463 () Bool)

(assert (=> b!104309 m!152463))

(declare-fun m!152465 () Bool)

(assert (=> start!20612 m!152465))

(declare-fun m!152467 () Bool)

(assert (=> b!104302 m!152467))

(declare-fun m!152469 () Bool)

(assert (=> b!104311 m!152469))

(declare-fun m!152471 () Bool)

(assert (=> b!104312 m!152471))

(declare-fun m!152473 () Bool)

(assert (=> b!104307 m!152473))

(declare-fun m!152475 () Bool)

(assert (=> b!104307 m!152475))

(declare-fun m!152477 () Bool)

(assert (=> b!104307 m!152477))

(declare-fun m!152479 () Bool)

(assert (=> b!104307 m!152479))

(declare-fun m!152481 () Bool)

(assert (=> b!104307 m!152481))

(declare-fun m!152483 () Bool)

(assert (=> b!104307 m!152483))

(declare-fun m!152485 () Bool)

(assert (=> b!104307 m!152485))

(declare-fun m!152487 () Bool)

(assert (=> b!104307 m!152487))

(declare-fun m!152489 () Bool)

(assert (=> b!104307 m!152489))

(declare-fun m!152491 () Bool)

(assert (=> b!104307 m!152491))

(declare-fun m!152493 () Bool)

(assert (=> b!104307 m!152493))

(declare-fun m!152495 () Bool)

(assert (=> b!104307 m!152495))

(declare-fun m!152497 () Bool)

(assert (=> b!104307 m!152497))

(declare-fun m!152499 () Bool)

(assert (=> b!104307 m!152499))

(declare-fun m!152501 () Bool)

(assert (=> b!104307 m!152501))

(declare-fun m!152503 () Bool)

(assert (=> b!104307 m!152503))

(declare-fun m!152505 () Bool)

(assert (=> b!104307 m!152505))

(declare-fun m!152507 () Bool)

(assert (=> b!104307 m!152507))

(declare-fun m!152509 () Bool)

(assert (=> b!104307 m!152509))

(declare-fun m!152511 () Bool)

(assert (=> b!104303 m!152511))

(assert (=> b!104303 m!152511))

(declare-fun m!152513 () Bool)

(assert (=> b!104303 m!152513))

(declare-fun m!152515 () Bool)

(assert (=> b!104310 m!152515))

(declare-fun m!152517 () Bool)

(assert (=> b!104301 m!152517))

(declare-fun m!152519 () Bool)

(assert (=> b!104301 m!152519))

(declare-fun m!152521 () Bool)

(assert (=> b!104301 m!152521))

(declare-fun m!152523 () Bool)

(assert (=> b!104301 m!152523))

(assert (=> b!104301 m!152523))

(declare-fun m!152525 () Bool)

(assert (=> b!104301 m!152525))

(declare-fun m!152527 () Bool)

(assert (=> b!104305 m!152527))

(assert (=> b!104305 m!152521))

(declare-fun m!152529 () Bool)

(assert (=> b!104308 m!152529))

(declare-fun m!152531 () Bool)

(assert (=> b!104300 m!152531))

(push 1)

(assert (not b!104309))

(assert (not start!20612))

(assert (not b!104312))

(assert (not b!104311))

(assert (not b!104303))

(assert (not b!104307))

(assert (not b!104301))

(assert (not b!104302))

(assert (not b!104310))

(assert (not b!104308))

(assert (not b!104300))

(assert (not b!104305))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!32270 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!32270 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2223 (buf!2589 thiss!1305))) ((_ sign_extend 32) (currentByte!5074 thiss!1305)) ((_ sign_extend 32) (currentBit!5069 thiss!1305)) lt!152894) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2223 (buf!2589 thiss!1305))) ((_ sign_extend 32) (currentByte!5074 thiss!1305)) ((_ sign_extend 32) (currentBit!5069 thiss!1305))) lt!152894))))

(declare-fun bs!7923 () Bool)

(assert (= bs!7923 d!32270))

(declare-fun m!152617 () Bool)

(assert (=> bs!7923 m!152617))

(assert (=> b!104308 d!32270))

(declare-fun d!32272 () Bool)

(assert (=> d!32272 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!104307 d!32272))

(declare-fun d!32274 () Bool)

(declare-datatypes ((tuple2!8638 0))(
  ( (tuple2!8639 (_1!4574 (_ BitVec 64)) (_2!4574 BitStream!3920)) )
))
(declare-fun lt!153028 () tuple2!8638)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!3920 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8638)

(assert (=> d!32274 (= lt!153028 (readNLeastSignificantBitsLoop!0 (_1!4572 lt!152886) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!152905))))

(assert (=> d!32274 (= (readNLeastSignificantBitsLoopPure!0 (_1!4572 lt!152886) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!152905) (tuple2!8633 (_2!4574 lt!153028) (_1!4574 lt!153028)))))

(declare-fun bs!7924 () Bool)

(assert (= bs!7924 d!32274))

(declare-fun m!152619 () Bool)

(assert (=> bs!7924 m!152619))

(assert (=> b!104307 d!32274))

(declare-fun d!32276 () Bool)

(assert (=> d!32276 (isPrefixOf!0 thiss!1305 (_2!4570 lt!152888))))

(declare-fun lt!153031 () Unit!6390)

(declare-fun choose!30 (BitStream!3920 BitStream!3920 BitStream!3920) Unit!6390)

(assert (=> d!32276 (= lt!153031 (choose!30 thiss!1305 (_2!4570 lt!152884) (_2!4570 lt!152888)))))

(assert (=> d!32276 (isPrefixOf!0 thiss!1305 (_2!4570 lt!152884))))

(assert (=> d!32276 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4570 lt!152884) (_2!4570 lt!152888)) lt!153031)))

(declare-fun bs!7925 () Bool)

(assert (= bs!7925 d!32276))

(assert (=> bs!7925 m!152491))

(declare-fun m!152621 () Bool)

(assert (=> bs!7925 m!152621))

(assert (=> bs!7925 m!152531))

(assert (=> b!104307 d!32276))

(declare-fun lt!153249 () tuple2!8634)

(declare-fun lt!153287 () tuple2!8632)

(declare-fun e!68403 () Bool)

(declare-fun b!104406 () Bool)

(assert (=> b!104406 (= e!68403 (and (= (_2!4571 lt!153287) v!199) (= (_1!4571 lt!153287) (_2!4572 lt!153249))))))

(declare-fun lt!153279 () (_ BitVec 64))

(assert (=> b!104406 (= lt!153287 (readNLeastSignificantBitsLoopPure!0 (_1!4572 lt!153249) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!153279))))

(declare-fun lt!153253 () Unit!6390)

(declare-fun lt!153288 () Unit!6390)

(assert (=> b!104406 (= lt!153253 lt!153288)))

(declare-fun lt!153272 () tuple2!8630)

(declare-fun lt!153271 () (_ BitVec 64))

(assert (=> b!104406 (validate_offset_bits!1 ((_ sign_extend 32) (size!2223 (buf!2589 (_2!4570 lt!153272)))) ((_ sign_extend 32) (currentByte!5074 (_2!4570 lt!152884))) ((_ sign_extend 32) (currentBit!5069 (_2!4570 lt!152884))) lt!153271)))

(assert (=> b!104406 (= lt!153288 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4570 lt!152884) (buf!2589 (_2!4570 lt!153272)) lt!153271))))

(declare-fun e!68399 () Bool)

(assert (=> b!104406 e!68399))

(declare-fun res!85970 () Bool)

(assert (=> b!104406 (=> (not res!85970) (not e!68399))))

(assert (=> b!104406 (= res!85970 (and (= (size!2223 (buf!2589 (_2!4570 lt!152884))) (size!2223 (buf!2589 (_2!4570 lt!153272)))) (bvsge lt!153271 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!104406 (= lt!153271 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!104406 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!104406 (= lt!153279 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!104406 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!104406 (= lt!153249 (reader!0 (_2!4570 lt!152884) (_2!4570 lt!153272)))))

(declare-fun d!32278 () Bool)

(assert (=> d!32278 e!68403))

(declare-fun res!85964 () Bool)

(assert (=> d!32278 (=> (not res!85964) (not e!68403))))

(assert (=> d!32278 (= res!85964 (= (size!2223 (buf!2589 (_2!4570 lt!152884))) (size!2223 (buf!2589 (_2!4570 lt!153272)))))))

(declare-fun e!68401 () tuple2!8630)

(assert (=> d!32278 (= lt!153272 e!68401)))

(declare-fun c!6428 () Bool)

(assert (=> d!32278 (= c!6428 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!32278 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!32278 (= (appendNLeastSignificantBitsLoop!0 (_2!4570 lt!152884) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!153272)))

(declare-fun b!104407 () Bool)

(declare-fun e!68402 () (_ BitVec 64))

(assert (=> b!104407 (= e!68402 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!104408 () Bool)

(assert (=> b!104408 (= e!68402 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!104409 () Bool)

(declare-fun lt!153257 () tuple2!8630)

(declare-fun Unit!6392 () Unit!6390)

(assert (=> b!104409 (= e!68401 (tuple2!8631 Unit!6392 (_2!4570 lt!153257)))))

(declare-fun lt!153281 () Bool)

(assert (=> b!104409 (= lt!153281 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!153280 () tuple2!8630)

(assert (=> b!104409 (= lt!153280 (appendBit!0 (_2!4570 lt!152884) lt!153281))))

(declare-fun res!85972 () Bool)

(assert (=> b!104409 (= res!85972 (= (size!2223 (buf!2589 (_2!4570 lt!152884))) (size!2223 (buf!2589 (_2!4570 lt!153280)))))))

(declare-fun e!68397 () Bool)

(assert (=> b!104409 (=> (not res!85972) (not e!68397))))

(assert (=> b!104409 e!68397))

(declare-fun lt!153261 () tuple2!8630)

(assert (=> b!104409 (= lt!153261 lt!153280)))

(assert (=> b!104409 (= lt!153257 (appendNLeastSignificantBitsLoop!0 (_2!4570 lt!153261) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!153266 () Unit!6390)

(assert (=> b!104409 (= lt!153266 (lemmaIsPrefixTransitive!0 (_2!4570 lt!152884) (_2!4570 lt!153261) (_2!4570 lt!153257)))))

(assert (=> b!104409 (isPrefixOf!0 (_2!4570 lt!152884) (_2!4570 lt!153257))))

(declare-fun lt!153262 () Unit!6390)

(assert (=> b!104409 (= lt!153262 lt!153266)))

(assert (=> b!104409 (invariant!0 (currentBit!5069 (_2!4570 lt!152884)) (currentByte!5074 (_2!4570 lt!152884)) (size!2223 (buf!2589 (_2!4570 lt!153261))))))

(declare-fun lt!153270 () BitStream!3920)

(assert (=> b!104409 (= lt!153270 (BitStream!3921 (buf!2589 (_2!4570 lt!153261)) (currentByte!5074 (_2!4570 lt!152884)) (currentBit!5069 (_2!4570 lt!152884))))))

(assert (=> b!104409 (invariant!0 (currentBit!5069 lt!153270) (currentByte!5074 lt!153270) (size!2223 (buf!2589 (_2!4570 lt!153257))))))

(declare-fun lt!153278 () BitStream!3920)

(assert (=> b!104409 (= lt!153278 (BitStream!3921 (buf!2589 (_2!4570 lt!153257)) (currentByte!5074 lt!153270) (currentBit!5069 lt!153270)))))

(declare-fun lt!153267 () tuple2!8636)

(assert (=> b!104409 (= lt!153267 (readBitPure!0 lt!153270))))

(declare-fun lt!153293 () tuple2!8636)

(assert (=> b!104409 (= lt!153293 (readBitPure!0 lt!153278))))

(declare-fun lt!153275 () Unit!6390)

(assert (=> b!104409 (= lt!153275 (readBitPrefixLemma!0 lt!153270 (_2!4570 lt!153257)))))

(declare-fun res!85969 () Bool)

(assert (=> b!104409 (= res!85969 (= (bitIndex!0 (size!2223 (buf!2589 (_1!4573 lt!153267))) (currentByte!5074 (_1!4573 lt!153267)) (currentBit!5069 (_1!4573 lt!153267))) (bitIndex!0 (size!2223 (buf!2589 (_1!4573 lt!153293))) (currentByte!5074 (_1!4573 lt!153293)) (currentBit!5069 (_1!4573 lt!153293)))))))

(declare-fun e!68398 () Bool)

(assert (=> b!104409 (=> (not res!85969) (not e!68398))))

(assert (=> b!104409 e!68398))

(declare-fun lt!153254 () Unit!6390)

(assert (=> b!104409 (= lt!153254 lt!153275)))

(declare-fun lt!153259 () tuple2!8634)

(assert (=> b!104409 (= lt!153259 (reader!0 (_2!4570 lt!152884) (_2!4570 lt!153257)))))

(declare-fun lt!153276 () tuple2!8634)

(assert (=> b!104409 (= lt!153276 (reader!0 (_2!4570 lt!153261) (_2!4570 lt!153257)))))

(declare-fun lt!153291 () tuple2!8636)

(assert (=> b!104409 (= lt!153291 (readBitPure!0 (_1!4572 lt!153259)))))

(assert (=> b!104409 (= (_2!4573 lt!153291) lt!153281)))

(declare-fun lt!153283 () Unit!6390)

(declare-fun Unit!6394 () Unit!6390)

(assert (=> b!104409 (= lt!153283 Unit!6394)))

(declare-fun lt!153282 () (_ BitVec 64))

(assert (=> b!104409 (= lt!153282 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!153277 () (_ BitVec 64))

(assert (=> b!104409 (= lt!153277 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!153290 () Unit!6390)

(assert (=> b!104409 (= lt!153290 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4570 lt!152884) (buf!2589 (_2!4570 lt!153257)) lt!153277))))

(assert (=> b!104409 (validate_offset_bits!1 ((_ sign_extend 32) (size!2223 (buf!2589 (_2!4570 lt!153257)))) ((_ sign_extend 32) (currentByte!5074 (_2!4570 lt!152884))) ((_ sign_extend 32) (currentBit!5069 (_2!4570 lt!152884))) lt!153277)))

(declare-fun lt!153289 () Unit!6390)

(assert (=> b!104409 (= lt!153289 lt!153290)))

(declare-fun lt!153269 () tuple2!8632)

(assert (=> b!104409 (= lt!153269 (readNLeastSignificantBitsLoopPure!0 (_1!4572 lt!153259) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!153282))))

(declare-fun lt!153250 () (_ BitVec 64))

(assert (=> b!104409 (= lt!153250 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!153284 () Unit!6390)

(assert (=> b!104409 (= lt!153284 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4570 lt!153261) (buf!2589 (_2!4570 lt!153257)) lt!153250))))

(assert (=> b!104409 (validate_offset_bits!1 ((_ sign_extend 32) (size!2223 (buf!2589 (_2!4570 lt!153257)))) ((_ sign_extend 32) (currentByte!5074 (_2!4570 lt!153261))) ((_ sign_extend 32) (currentBit!5069 (_2!4570 lt!153261))) lt!153250)))

(declare-fun lt!153251 () Unit!6390)

(assert (=> b!104409 (= lt!153251 lt!153284)))

(declare-fun lt!153264 () tuple2!8632)

(assert (=> b!104409 (= lt!153264 (readNLeastSignificantBitsLoopPure!0 (_1!4572 lt!153276) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!153282 (ite (_2!4573 lt!153291) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!153265 () tuple2!8632)

(assert (=> b!104409 (= lt!153265 (readNLeastSignificantBitsLoopPure!0 (_1!4572 lt!153259) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!153282))))

(declare-fun c!6429 () Bool)

(assert (=> b!104409 (= c!6429 (_2!4573 (readBitPure!0 (_1!4572 lt!153259))))))

(declare-fun lt!153286 () tuple2!8632)

(assert (=> b!104409 (= lt!153286 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4572 lt!153259) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!153282 e!68402)))))

(declare-fun lt!153263 () Unit!6390)

(assert (=> b!104409 (= lt!153263 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4572 lt!153259) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!153282))))

(assert (=> b!104409 (and (= (_2!4571 lt!153265) (_2!4571 lt!153286)) (= (_1!4571 lt!153265) (_1!4571 lt!153286)))))

(declare-fun lt!153256 () Unit!6390)

(assert (=> b!104409 (= lt!153256 lt!153263)))

(assert (=> b!104409 (= (_1!4572 lt!153259) (withMovedBitIndex!0 (_2!4572 lt!153259) (bvsub (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!152884))) (currentByte!5074 (_2!4570 lt!152884)) (currentBit!5069 (_2!4570 lt!152884))) (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!153257))) (currentByte!5074 (_2!4570 lt!153257)) (currentBit!5069 (_2!4570 lt!153257))))))))

(declare-fun lt!153260 () Unit!6390)

(declare-fun Unit!6395 () Unit!6390)

(assert (=> b!104409 (= lt!153260 Unit!6395)))

(assert (=> b!104409 (= (_1!4572 lt!153276) (withMovedBitIndex!0 (_2!4572 lt!153276) (bvsub (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!153261))) (currentByte!5074 (_2!4570 lt!153261)) (currentBit!5069 (_2!4570 lt!153261))) (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!153257))) (currentByte!5074 (_2!4570 lt!153257)) (currentBit!5069 (_2!4570 lt!153257))))))))

(declare-fun lt!153273 () Unit!6390)

(declare-fun Unit!6396 () Unit!6390)

(assert (=> b!104409 (= lt!153273 Unit!6396)))

(assert (=> b!104409 (= (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!152884))) (currentByte!5074 (_2!4570 lt!152884)) (currentBit!5069 (_2!4570 lt!152884))) (bvsub (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!153261))) (currentByte!5074 (_2!4570 lt!153261)) (currentBit!5069 (_2!4570 lt!153261))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!153268 () Unit!6390)

(declare-fun Unit!6397 () Unit!6390)

(assert (=> b!104409 (= lt!153268 Unit!6397)))

(assert (=> b!104409 (= (_2!4571 lt!153269) (_2!4571 lt!153264))))

(declare-fun lt!153255 () Unit!6390)

(declare-fun Unit!6398 () Unit!6390)

(assert (=> b!104409 (= lt!153255 Unit!6398)))

(assert (=> b!104409 (= (_1!4571 lt!153269) (_2!4572 lt!153259))))

(declare-fun lt!153292 () BitStream!3920)

(declare-fun bm!1291 () Bool)

(declare-fun call!1294 () Bool)

(assert (=> bm!1291 (= call!1294 (isPrefixOf!0 (ite c!6428 (_2!4570 lt!152884) lt!153292) (ite c!6428 (_2!4570 lt!153280) lt!153292)))))

(declare-fun b!104410 () Bool)

(declare-fun e!68400 () Bool)

(declare-fun lt!153274 () tuple2!8636)

(assert (=> b!104410 (= e!68400 (= (bitIndex!0 (size!2223 (buf!2589 (_1!4573 lt!153274))) (currentByte!5074 (_1!4573 lt!153274)) (currentBit!5069 (_1!4573 lt!153274))) (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!153280))) (currentByte!5074 (_2!4570 lt!153280)) (currentBit!5069 (_2!4570 lt!153280)))))))

(declare-fun b!104411 () Bool)

(declare-fun res!85968 () Bool)

(assert (=> b!104411 (= res!85968 call!1294)))

(assert (=> b!104411 (=> (not res!85968) (not e!68397))))

(declare-fun b!104412 () Bool)

(assert (=> b!104412 (= e!68399 (validate_offset_bits!1 ((_ sign_extend 32) (size!2223 (buf!2589 (_2!4570 lt!152884)))) ((_ sign_extend 32) (currentByte!5074 (_2!4570 lt!152884))) ((_ sign_extend 32) (currentBit!5069 (_2!4570 lt!152884))) lt!153271))))

(declare-fun b!104413 () Bool)

(declare-fun res!85966 () Bool)

(assert (=> b!104413 (=> (not res!85966) (not e!68403))))

(assert (=> b!104413 (= res!85966 (isPrefixOf!0 (_2!4570 lt!152884) (_2!4570 lt!153272)))))

(declare-fun b!104414 () Bool)

(assert (=> b!104414 (= e!68398 (= (_2!4573 lt!153267) (_2!4573 lt!153293)))))

(declare-fun b!104415 () Bool)

(declare-fun lt!153252 () Unit!6390)

(assert (=> b!104415 (= e!68401 (tuple2!8631 lt!153252 (_2!4570 lt!152884)))))

(assert (=> b!104415 (= lt!153292 (_2!4570 lt!152884))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!3920) Unit!6390)

(assert (=> b!104415 (= lt!153252 (lemmaIsPrefixRefl!0 lt!153292))))

(assert (=> b!104415 call!1294))

(declare-fun b!104416 () Bool)

(declare-fun res!85965 () Bool)

(assert (=> b!104416 (= res!85965 (= (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!153280))) (currentByte!5074 (_2!4570 lt!153280)) (currentBit!5069 (_2!4570 lt!153280))) (bvadd (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!152884))) (currentByte!5074 (_2!4570 lt!152884)) (currentBit!5069 (_2!4570 lt!152884))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!104416 (=> (not res!85965) (not e!68397))))

(declare-fun b!104417 () Bool)

(assert (=> b!104417 (= lt!153274 (readBitPure!0 (readerFrom!0 (_2!4570 lt!153280) (currentBit!5069 (_2!4570 lt!152884)) (currentByte!5074 (_2!4570 lt!152884)))))))

(declare-fun res!85971 () Bool)

(assert (=> b!104417 (= res!85971 (and (= (_2!4573 lt!153274) lt!153281) (= (_1!4573 lt!153274) (_2!4570 lt!153280))))))

(assert (=> b!104417 (=> (not res!85971) (not e!68400))))

(assert (=> b!104417 (= e!68397 e!68400)))

(declare-fun b!104418 () Bool)

(declare-fun res!85967 () Bool)

(assert (=> b!104418 (=> (not res!85967) (not e!68403))))

(declare-fun lt!153258 () (_ BitVec 64))

(declare-fun lt!153285 () (_ BitVec 64))

(assert (=> b!104418 (= res!85967 (= (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!153272))) (currentByte!5074 (_2!4570 lt!153272)) (currentBit!5069 (_2!4570 lt!153272))) (bvadd lt!153285 lt!153258)))))

(assert (=> b!104418 (or (not (= (bvand lt!153285 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!153258 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!153285 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!153285 lt!153258) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!104418 (= lt!153258 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!104418 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!104418 (= lt!153285 (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!152884))) (currentByte!5074 (_2!4570 lt!152884)) (currentBit!5069 (_2!4570 lt!152884))))))

(assert (= (and d!32278 c!6428) b!104409))

(assert (= (and d!32278 (not c!6428)) b!104415))

(assert (= (and b!104409 res!85972) b!104416))

(assert (= (and b!104416 res!85965) b!104411))

(assert (= (and b!104411 res!85968) b!104417))

(assert (= (and b!104417 res!85971) b!104410))

(assert (= (and b!104409 res!85969) b!104414))

(assert (= (and b!104409 c!6429) b!104408))

(assert (= (and b!104409 (not c!6429)) b!104407))

(assert (= (or b!104411 b!104415) bm!1291))

(assert (= (and d!32278 res!85964) b!104418))

(assert (= (and b!104418 res!85967) b!104413))

(assert (= (and b!104413 res!85966) b!104406))

(assert (= (and b!104406 res!85970) b!104412))

(declare-fun m!152699 () Bool)

(assert (=> b!104410 m!152699))

(declare-fun m!152701 () Bool)

(assert (=> b!104410 m!152701))

(declare-fun m!152703 () Bool)

(assert (=> b!104415 m!152703))

(declare-fun m!152705 () Bool)

(assert (=> b!104409 m!152705))

(declare-fun m!152707 () Bool)

(assert (=> b!104409 m!152707))

(declare-fun m!152709 () Bool)

(assert (=> b!104409 m!152709))

(declare-fun m!152711 () Bool)

(assert (=> b!104409 m!152711))

(declare-fun m!152713 () Bool)

(assert (=> b!104409 m!152713))

(declare-fun m!152715 () Bool)

(assert (=> b!104409 m!152715))

(declare-fun m!152717 () Bool)

(assert (=> b!104409 m!152717))

(declare-fun m!152719 () Bool)

(assert (=> b!104409 m!152719))

(declare-fun m!152721 () Bool)

(assert (=> b!104409 m!152721))

(declare-fun m!152723 () Bool)

(assert (=> b!104409 m!152723))

(declare-fun m!152725 () Bool)

(assert (=> b!104409 m!152725))

(declare-fun m!152727 () Bool)

(assert (=> b!104409 m!152727))

(declare-fun m!152729 () Bool)

(assert (=> b!104409 m!152729))

(assert (=> b!104409 m!152527))

(declare-fun m!152731 () Bool)

(assert (=> b!104409 m!152731))

(declare-fun m!152733 () Bool)

(assert (=> b!104409 m!152733))

(declare-fun m!152735 () Bool)

(assert (=> b!104409 m!152735))

(declare-fun m!152737 () Bool)

(assert (=> b!104409 m!152737))

(declare-fun m!152739 () Bool)

(assert (=> b!104409 m!152739))

(declare-fun m!152741 () Bool)

(assert (=> b!104409 m!152741))

(declare-fun m!152743 () Bool)

(assert (=> b!104409 m!152743))

(declare-fun m!152745 () Bool)

(assert (=> b!104409 m!152745))

(declare-fun m!152747 () Bool)

(assert (=> b!104409 m!152747))

(declare-fun m!152749 () Bool)

(assert (=> b!104409 m!152749))

(declare-fun m!152751 () Bool)

(assert (=> b!104409 m!152751))

(declare-fun m!152753 () Bool)

(assert (=> b!104409 m!152753))

(assert (=> b!104409 m!152737))

(declare-fun m!152755 () Bool)

(assert (=> b!104409 m!152755))

(declare-fun m!152757 () Bool)

(assert (=> b!104409 m!152757))

(declare-fun m!152759 () Bool)

(assert (=> b!104409 m!152759))

(declare-fun m!152761 () Bool)

(assert (=> b!104406 m!152761))

(declare-fun m!152763 () Bool)

(assert (=> b!104406 m!152763))

(declare-fun m!152765 () Bool)

(assert (=> b!104406 m!152765))

(assert (=> b!104406 m!152745))

(declare-fun m!152767 () Bool)

(assert (=> b!104406 m!152767))

(declare-fun m!152769 () Bool)

(assert (=> b!104413 m!152769))

(declare-fun m!152771 () Bool)

(assert (=> bm!1291 m!152771))

(declare-fun m!152773 () Bool)

(assert (=> b!104418 m!152773))

(assert (=> b!104418 m!152527))

(declare-fun m!152775 () Bool)

(assert (=> b!104412 m!152775))

(assert (=> b!104416 m!152701))

(assert (=> b!104416 m!152527))

(declare-fun m!152777 () Bool)

(assert (=> b!104417 m!152777))

(assert (=> b!104417 m!152777))

(declare-fun m!152779 () Bool)

(assert (=> b!104417 m!152779))

(assert (=> b!104307 d!32278))

(declare-fun d!32316 () Bool)

(declare-fun e!68412 () Bool)

(assert (=> d!32316 e!68412))

(declare-fun res!85986 () Bool)

(assert (=> d!32316 (=> (not res!85986) (not e!68412))))

(declare-fun lt!153323 () (_ BitVec 64))

(declare-fun lt!153327 () (_ BitVec 64))

(declare-fun lt!153322 () (_ BitVec 64))

(assert (=> d!32316 (= res!85986 (= lt!153323 (bvsub lt!153322 lt!153327)))))

(assert (=> d!32316 (or (= (bvand lt!153322 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!153327 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!153322 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!153322 lt!153327) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32316 (= lt!153327 (remainingBits!0 ((_ sign_extend 32) (size!2223 (buf!2589 (_1!4573 lt!152892)))) ((_ sign_extend 32) (currentByte!5074 (_1!4573 lt!152892))) ((_ sign_extend 32) (currentBit!5069 (_1!4573 lt!152892)))))))

(declare-fun lt!153324 () (_ BitVec 64))

(declare-fun lt!153326 () (_ BitVec 64))

(assert (=> d!32316 (= lt!153322 (bvmul lt!153324 lt!153326))))

(assert (=> d!32316 (or (= lt!153324 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!153326 (bvsdiv (bvmul lt!153324 lt!153326) lt!153324)))))

(assert (=> d!32316 (= lt!153326 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32316 (= lt!153324 ((_ sign_extend 32) (size!2223 (buf!2589 (_1!4573 lt!152892)))))))

(assert (=> d!32316 (= lt!153323 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5074 (_1!4573 lt!152892))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5069 (_1!4573 lt!152892)))))))

(assert (=> d!32316 (invariant!0 (currentBit!5069 (_1!4573 lt!152892)) (currentByte!5074 (_1!4573 lt!152892)) (size!2223 (buf!2589 (_1!4573 lt!152892))))))

(assert (=> d!32316 (= (bitIndex!0 (size!2223 (buf!2589 (_1!4573 lt!152892))) (currentByte!5074 (_1!4573 lt!152892)) (currentBit!5069 (_1!4573 lt!152892))) lt!153323)))

(declare-fun b!104435 () Bool)

(declare-fun res!85985 () Bool)

(assert (=> b!104435 (=> (not res!85985) (not e!68412))))

(assert (=> b!104435 (= res!85985 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!153323))))

(declare-fun b!104436 () Bool)

(declare-fun lt!153325 () (_ BitVec 64))

(assert (=> b!104436 (= e!68412 (bvsle lt!153323 (bvmul lt!153325 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!104436 (or (= lt!153325 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!153325 #b0000000000000000000000000000000000000000000000000000000000001000) lt!153325)))))

(assert (=> b!104436 (= lt!153325 ((_ sign_extend 32) (size!2223 (buf!2589 (_1!4573 lt!152892)))))))

(assert (= (and d!32316 res!85986) b!104435))

(assert (= (and b!104435 res!85985) b!104436))

(declare-fun m!152781 () Bool)

(assert (=> d!32316 m!152781))

(declare-fun m!152783 () Bool)

(assert (=> d!32316 m!152783))

(assert (=> b!104307 d!32316))

(declare-fun d!32318 () Bool)

(declare-datatypes ((tuple2!8648 0))(
  ( (tuple2!8649 (_1!4579 Bool) (_2!4579 BitStream!3920)) )
))
(declare-fun lt!153350 () tuple2!8648)

(declare-fun readBit!0 (BitStream!3920) tuple2!8648)

(assert (=> d!32318 (= lt!153350 (readBit!0 (_1!4572 lt!152882)))))

(assert (=> d!32318 (= (readBitPure!0 (_1!4572 lt!152882)) (tuple2!8637 (_2!4579 lt!153350) (_1!4579 lt!153350)))))

(declare-fun bs!7934 () Bool)

(assert (= bs!7934 d!32318))

(declare-fun m!152785 () Bool)

(assert (=> bs!7934 m!152785))

(assert (=> b!104307 d!32318))

(declare-fun b!104474 () Bool)

(declare-fun e!68432 () Unit!6390)

(declare-fun Unit!6413 () Unit!6390)

(assert (=> b!104474 (= e!68432 Unit!6413)))

(declare-fun b!104475 () Bool)

(declare-fun res!86012 () Bool)

(declare-fun e!68433 () Bool)

(assert (=> b!104475 (=> (not res!86012) (not e!68433))))

(declare-fun lt!153501 () tuple2!8634)

(assert (=> b!104475 (= res!86012 (isPrefixOf!0 (_2!4572 lt!153501) (_2!4570 lt!152888)))))

(declare-fun b!104476 () Bool)

(declare-fun lt!153498 () Unit!6390)

(assert (=> b!104476 (= e!68432 lt!153498)))

(declare-fun lt!153504 () (_ BitVec 64))

(assert (=> b!104476 (= lt!153504 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!153503 () (_ BitVec 64))

(assert (=> b!104476 (= lt!153503 (bitIndex!0 (size!2223 (buf!2589 thiss!1305)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!4870 array!4870 (_ BitVec 64) (_ BitVec 64)) Unit!6390)

(assert (=> b!104476 (= lt!153498 (arrayBitRangesEqSymmetric!0 (buf!2589 thiss!1305) (buf!2589 (_2!4570 lt!152888)) lt!153504 lt!153503))))

(declare-fun arrayBitRangesEq!0 (array!4870 array!4870 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!104476 (arrayBitRangesEq!0 (buf!2589 (_2!4570 lt!152888)) (buf!2589 thiss!1305) lt!153504 lt!153503)))

(declare-fun d!32320 () Bool)

(assert (=> d!32320 e!68433))

(declare-fun res!86013 () Bool)

(assert (=> d!32320 (=> (not res!86013) (not e!68433))))

(assert (=> d!32320 (= res!86013 (isPrefixOf!0 (_1!4572 lt!153501) (_2!4572 lt!153501)))))

(declare-fun lt!153500 () BitStream!3920)

(assert (=> d!32320 (= lt!153501 (tuple2!8635 lt!153500 (_2!4570 lt!152888)))))

(declare-fun lt!153492 () Unit!6390)

(declare-fun lt!153505 () Unit!6390)

(assert (=> d!32320 (= lt!153492 lt!153505)))

(assert (=> d!32320 (isPrefixOf!0 lt!153500 (_2!4570 lt!152888))))

(assert (=> d!32320 (= lt!153505 (lemmaIsPrefixTransitive!0 lt!153500 (_2!4570 lt!152888) (_2!4570 lt!152888)))))

(declare-fun lt!153502 () Unit!6390)

(declare-fun lt!153508 () Unit!6390)

(assert (=> d!32320 (= lt!153502 lt!153508)))

(assert (=> d!32320 (isPrefixOf!0 lt!153500 (_2!4570 lt!152888))))

(assert (=> d!32320 (= lt!153508 (lemmaIsPrefixTransitive!0 lt!153500 thiss!1305 (_2!4570 lt!152888)))))

(declare-fun lt!153509 () Unit!6390)

(assert (=> d!32320 (= lt!153509 e!68432)))

(declare-fun c!6438 () Bool)

(assert (=> d!32320 (= c!6438 (not (= (size!2223 (buf!2589 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!153506 () Unit!6390)

(declare-fun lt!153499 () Unit!6390)

(assert (=> d!32320 (= lt!153506 lt!153499)))

(assert (=> d!32320 (isPrefixOf!0 (_2!4570 lt!152888) (_2!4570 lt!152888))))

(assert (=> d!32320 (= lt!153499 (lemmaIsPrefixRefl!0 (_2!4570 lt!152888)))))

(declare-fun lt!153490 () Unit!6390)

(declare-fun lt!153507 () Unit!6390)

(assert (=> d!32320 (= lt!153490 lt!153507)))

(assert (=> d!32320 (= lt!153507 (lemmaIsPrefixRefl!0 (_2!4570 lt!152888)))))

(declare-fun lt!153497 () Unit!6390)

(declare-fun lt!153495 () Unit!6390)

(assert (=> d!32320 (= lt!153497 lt!153495)))

(assert (=> d!32320 (isPrefixOf!0 lt!153500 lt!153500)))

(assert (=> d!32320 (= lt!153495 (lemmaIsPrefixRefl!0 lt!153500))))

(declare-fun lt!153491 () Unit!6390)

(declare-fun lt!153496 () Unit!6390)

(assert (=> d!32320 (= lt!153491 lt!153496)))

(assert (=> d!32320 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!32320 (= lt!153496 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!32320 (= lt!153500 (BitStream!3921 (buf!2589 (_2!4570 lt!152888)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305)))))

(assert (=> d!32320 (isPrefixOf!0 thiss!1305 (_2!4570 lt!152888))))

(assert (=> d!32320 (= (reader!0 thiss!1305 (_2!4570 lt!152888)) lt!153501)))

(declare-fun lt!153493 () (_ BitVec 64))

(declare-fun lt!153494 () (_ BitVec 64))

(declare-fun b!104477 () Bool)

(assert (=> b!104477 (= e!68433 (= (_1!4572 lt!153501) (withMovedBitIndex!0 (_2!4572 lt!153501) (bvsub lt!153494 lt!153493))))))

(assert (=> b!104477 (or (= (bvand lt!153494 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!153493 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!153494 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!153494 lt!153493) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!104477 (= lt!153493 (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!152888))) (currentByte!5074 (_2!4570 lt!152888)) (currentBit!5069 (_2!4570 lt!152888))))))

(assert (=> b!104477 (= lt!153494 (bitIndex!0 (size!2223 (buf!2589 thiss!1305)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305)))))

(declare-fun b!104478 () Bool)

(declare-fun res!86014 () Bool)

(assert (=> b!104478 (=> (not res!86014) (not e!68433))))

(assert (=> b!104478 (= res!86014 (isPrefixOf!0 (_1!4572 lt!153501) thiss!1305))))

(assert (= (and d!32320 c!6438) b!104476))

(assert (= (and d!32320 (not c!6438)) b!104474))

(assert (= (and d!32320 res!86013) b!104478))

(assert (= (and b!104478 res!86014) b!104475))

(assert (= (and b!104475 res!86012) b!104477))

(declare-fun m!152839 () Bool)

(assert (=> d!32320 m!152839))

(declare-fun m!152843 () Bool)

(assert (=> d!32320 m!152843))

(declare-fun m!152847 () Bool)

(assert (=> d!32320 m!152847))

(declare-fun m!152849 () Bool)

(assert (=> d!32320 m!152849))

(declare-fun m!152851 () Bool)

(assert (=> d!32320 m!152851))

(declare-fun m!152853 () Bool)

(assert (=> d!32320 m!152853))

(declare-fun m!152855 () Bool)

(assert (=> d!32320 m!152855))

(declare-fun m!152857 () Bool)

(assert (=> d!32320 m!152857))

(assert (=> d!32320 m!152491))

(declare-fun m!152861 () Bool)

(assert (=> d!32320 m!152861))

(declare-fun m!152863 () Bool)

(assert (=> d!32320 m!152863))

(assert (=> b!104476 m!152521))

(declare-fun m!152865 () Bool)

(assert (=> b!104476 m!152865))

(declare-fun m!152867 () Bool)

(assert (=> b!104476 m!152867))

(declare-fun m!152869 () Bool)

(assert (=> b!104477 m!152869))

(declare-fun m!152873 () Bool)

(assert (=> b!104477 m!152873))

(assert (=> b!104477 m!152521))

(declare-fun m!152878 () Bool)

(assert (=> b!104478 m!152878))

(declare-fun m!152881 () Bool)

(assert (=> b!104475 m!152881))

(assert (=> b!104307 d!32320))

(declare-fun b!104479 () Bool)

(declare-fun e!68434 () Unit!6390)

(declare-fun Unit!6414 () Unit!6390)

(assert (=> b!104479 (= e!68434 Unit!6414)))

(declare-fun b!104480 () Bool)

(declare-fun res!86015 () Bool)

(declare-fun e!68435 () Bool)

(assert (=> b!104480 (=> (not res!86015) (not e!68435))))

(declare-fun lt!153521 () tuple2!8634)

(assert (=> b!104480 (= res!86015 (isPrefixOf!0 (_2!4572 lt!153521) (_2!4570 lt!152888)))))

(declare-fun b!104481 () Bool)

(declare-fun lt!153518 () Unit!6390)

(assert (=> b!104481 (= e!68434 lt!153518)))

(declare-fun lt!153524 () (_ BitVec 64))

(assert (=> b!104481 (= lt!153524 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!153523 () (_ BitVec 64))

(assert (=> b!104481 (= lt!153523 (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!152884))) (currentByte!5074 (_2!4570 lt!152884)) (currentBit!5069 (_2!4570 lt!152884))))))

(assert (=> b!104481 (= lt!153518 (arrayBitRangesEqSymmetric!0 (buf!2589 (_2!4570 lt!152884)) (buf!2589 (_2!4570 lt!152888)) lt!153524 lt!153523))))

(assert (=> b!104481 (arrayBitRangesEq!0 (buf!2589 (_2!4570 lt!152888)) (buf!2589 (_2!4570 lt!152884)) lt!153524 lt!153523)))

(declare-fun d!32322 () Bool)

(assert (=> d!32322 e!68435))

(declare-fun res!86016 () Bool)

(assert (=> d!32322 (=> (not res!86016) (not e!68435))))

(assert (=> d!32322 (= res!86016 (isPrefixOf!0 (_1!4572 lt!153521) (_2!4572 lt!153521)))))

(declare-fun lt!153520 () BitStream!3920)

(assert (=> d!32322 (= lt!153521 (tuple2!8635 lt!153520 (_2!4570 lt!152888)))))

(declare-fun lt!153512 () Unit!6390)

(declare-fun lt!153525 () Unit!6390)

(assert (=> d!32322 (= lt!153512 lt!153525)))

(assert (=> d!32322 (isPrefixOf!0 lt!153520 (_2!4570 lt!152888))))

(assert (=> d!32322 (= lt!153525 (lemmaIsPrefixTransitive!0 lt!153520 (_2!4570 lt!152888) (_2!4570 lt!152888)))))

(declare-fun lt!153522 () Unit!6390)

(declare-fun lt!153528 () Unit!6390)

(assert (=> d!32322 (= lt!153522 lt!153528)))

(assert (=> d!32322 (isPrefixOf!0 lt!153520 (_2!4570 lt!152888))))

(assert (=> d!32322 (= lt!153528 (lemmaIsPrefixTransitive!0 lt!153520 (_2!4570 lt!152884) (_2!4570 lt!152888)))))

(declare-fun lt!153529 () Unit!6390)

(assert (=> d!32322 (= lt!153529 e!68434)))

(declare-fun c!6439 () Bool)

(assert (=> d!32322 (= c!6439 (not (= (size!2223 (buf!2589 (_2!4570 lt!152884))) #b00000000000000000000000000000000)))))

(declare-fun lt!153526 () Unit!6390)

(declare-fun lt!153519 () Unit!6390)

(assert (=> d!32322 (= lt!153526 lt!153519)))

(assert (=> d!32322 (isPrefixOf!0 (_2!4570 lt!152888) (_2!4570 lt!152888))))

(assert (=> d!32322 (= lt!153519 (lemmaIsPrefixRefl!0 (_2!4570 lt!152888)))))

(declare-fun lt!153510 () Unit!6390)

(declare-fun lt!153527 () Unit!6390)

(assert (=> d!32322 (= lt!153510 lt!153527)))

(assert (=> d!32322 (= lt!153527 (lemmaIsPrefixRefl!0 (_2!4570 lt!152888)))))

(declare-fun lt!153517 () Unit!6390)

(declare-fun lt!153515 () Unit!6390)

(assert (=> d!32322 (= lt!153517 lt!153515)))

(assert (=> d!32322 (isPrefixOf!0 lt!153520 lt!153520)))

(assert (=> d!32322 (= lt!153515 (lemmaIsPrefixRefl!0 lt!153520))))

(declare-fun lt!153511 () Unit!6390)

(declare-fun lt!153516 () Unit!6390)

(assert (=> d!32322 (= lt!153511 lt!153516)))

(assert (=> d!32322 (isPrefixOf!0 (_2!4570 lt!152884) (_2!4570 lt!152884))))

(assert (=> d!32322 (= lt!153516 (lemmaIsPrefixRefl!0 (_2!4570 lt!152884)))))

(assert (=> d!32322 (= lt!153520 (BitStream!3921 (buf!2589 (_2!4570 lt!152888)) (currentByte!5074 (_2!4570 lt!152884)) (currentBit!5069 (_2!4570 lt!152884))))))

(assert (=> d!32322 (isPrefixOf!0 (_2!4570 lt!152884) (_2!4570 lt!152888))))

(assert (=> d!32322 (= (reader!0 (_2!4570 lt!152884) (_2!4570 lt!152888)) lt!153521)))

(declare-fun lt!153513 () (_ BitVec 64))

(declare-fun b!104482 () Bool)

(declare-fun lt!153514 () (_ BitVec 64))

(assert (=> b!104482 (= e!68435 (= (_1!4572 lt!153521) (withMovedBitIndex!0 (_2!4572 lt!153521) (bvsub lt!153514 lt!153513))))))

(assert (=> b!104482 (or (= (bvand lt!153514 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!153513 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!153514 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!153514 lt!153513) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!104482 (= lt!153513 (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!152888))) (currentByte!5074 (_2!4570 lt!152888)) (currentBit!5069 (_2!4570 lt!152888))))))

(assert (=> b!104482 (= lt!153514 (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!152884))) (currentByte!5074 (_2!4570 lt!152884)) (currentBit!5069 (_2!4570 lt!152884))))))

(declare-fun b!104483 () Bool)

(declare-fun res!86017 () Bool)

(assert (=> b!104483 (=> (not res!86017) (not e!68435))))

(assert (=> b!104483 (= res!86017 (isPrefixOf!0 (_1!4572 lt!153521) (_2!4570 lt!152884)))))

(assert (= (and d!32322 c!6439) b!104481))

(assert (= (and d!32322 (not c!6439)) b!104479))

(assert (= (and d!32322 res!86016) b!104483))

(assert (= (and b!104483 res!86017) b!104480))

(assert (= (and b!104480 res!86015) b!104482))

(declare-fun m!152901 () Bool)

(assert (=> d!32322 m!152901))

(declare-fun m!152903 () Bool)

(assert (=> d!32322 m!152903))

(declare-fun m!152905 () Bool)

(assert (=> d!32322 m!152905))

(assert (=> d!32322 m!152849))

(declare-fun m!152907 () Bool)

(assert (=> d!32322 m!152907))

(declare-fun m!152909 () Bool)

(assert (=> d!32322 m!152909))

(assert (=> d!32322 m!152855))

(declare-fun m!152911 () Bool)

(assert (=> d!32322 m!152911))

(declare-fun m!152913 () Bool)

(assert (=> d!32322 m!152913))

(declare-fun m!152915 () Bool)

(assert (=> d!32322 m!152915))

(declare-fun m!152917 () Bool)

(assert (=> d!32322 m!152917))

(assert (=> b!104481 m!152527))

(declare-fun m!152919 () Bool)

(assert (=> b!104481 m!152919))

(declare-fun m!152921 () Bool)

(assert (=> b!104481 m!152921))

(declare-fun m!152923 () Bool)

(assert (=> b!104482 m!152923))

(assert (=> b!104482 m!152873))

(assert (=> b!104482 m!152527))

(declare-fun m!152925 () Bool)

(assert (=> b!104483 m!152925))

(declare-fun m!152927 () Bool)

(assert (=> b!104480 m!152927))

(assert (=> b!104307 d!32322))

(declare-fun d!32326 () Bool)

(assert (=> d!32326 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2223 (buf!2589 (_2!4570 lt!152888)))) ((_ sign_extend 32) (currentByte!5074 thiss!1305)) ((_ sign_extend 32) (currentBit!5069 thiss!1305)) lt!152894) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2223 (buf!2589 (_2!4570 lt!152888)))) ((_ sign_extend 32) (currentByte!5074 thiss!1305)) ((_ sign_extend 32) (currentBit!5069 thiss!1305))) lt!152894))))

(declare-fun bs!7935 () Bool)

(assert (= bs!7935 d!32326))

(declare-fun m!152929 () Bool)

(assert (=> bs!7935 m!152929))

(assert (=> b!104307 d!32326))

(declare-fun d!32328 () Bool)

(declare-fun e!68452 () Bool)

(assert (=> d!32328 e!68452))

(declare-fun res!86039 () Bool)

(assert (=> d!32328 (=> (not res!86039) (not e!68452))))

(declare-fun lt!153585 () tuple2!8636)

(declare-fun lt!153586 () tuple2!8636)

(assert (=> d!32328 (= res!86039 (= (bitIndex!0 (size!2223 (buf!2589 (_1!4573 lt!153585))) (currentByte!5074 (_1!4573 lt!153585)) (currentBit!5069 (_1!4573 lt!153585))) (bitIndex!0 (size!2223 (buf!2589 (_1!4573 lt!153586))) (currentByte!5074 (_1!4573 lt!153586)) (currentBit!5069 (_1!4573 lt!153586)))))))

(declare-fun lt!153587 () BitStream!3920)

(declare-fun lt!153588 () Unit!6390)

(declare-fun choose!50 (BitStream!3920 BitStream!3920 BitStream!3920 tuple2!8636 tuple2!8636 BitStream!3920 Bool tuple2!8636 tuple2!8636 BitStream!3920 Bool) Unit!6390)

(assert (=> d!32328 (= lt!153588 (choose!50 lt!152897 (_2!4570 lt!152888) lt!153587 lt!153585 (tuple2!8637 (_1!4573 lt!153585) (_2!4573 lt!153585)) (_1!4573 lt!153585) (_2!4573 lt!153585) lt!153586 (tuple2!8637 (_1!4573 lt!153586) (_2!4573 lt!153586)) (_1!4573 lt!153586) (_2!4573 lt!153586)))))

(assert (=> d!32328 (= lt!153586 (readBitPure!0 lt!153587))))

(assert (=> d!32328 (= lt!153585 (readBitPure!0 lt!152897))))

(assert (=> d!32328 (= lt!153587 (BitStream!3921 (buf!2589 (_2!4570 lt!152888)) (currentByte!5074 lt!152897) (currentBit!5069 lt!152897)))))

(assert (=> d!32328 (invariant!0 (currentBit!5069 lt!152897) (currentByte!5074 lt!152897) (size!2223 (buf!2589 (_2!4570 lt!152888))))))

(assert (=> d!32328 (= (readBitPrefixLemma!0 lt!152897 (_2!4570 lt!152888)) lt!153588)))

(declare-fun b!104509 () Bool)

(assert (=> b!104509 (= e!68452 (= (_2!4573 lt!153585) (_2!4573 lt!153586)))))

(assert (= (and d!32328 res!86039) b!104509))

(declare-fun m!152937 () Bool)

(assert (=> d!32328 m!152937))

(assert (=> d!32328 m!152507))

(declare-fun m!152939 () Bool)

(assert (=> d!32328 m!152939))

(declare-fun m!152941 () Bool)

(assert (=> d!32328 m!152941))

(declare-fun m!152943 () Bool)

(assert (=> d!32328 m!152943))

(declare-fun m!152945 () Bool)

(assert (=> d!32328 m!152945))

(assert (=> b!104307 d!32328))

(declare-fun d!32336 () Bool)

(declare-fun lt!153601 () tuple2!8648)

(assert (=> d!32336 (= lt!153601 (readBit!0 (BitStream!3921 (buf!2589 (_2!4570 lt!152888)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305))))))

(assert (=> d!32336 (= (readBitPure!0 (BitStream!3921 (buf!2589 (_2!4570 lt!152888)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305))) (tuple2!8637 (_2!4579 lt!153601) (_1!4579 lt!153601)))))

(declare-fun bs!7938 () Bool)

(assert (= bs!7938 d!32336))

(declare-fun m!152947 () Bool)

(assert (=> bs!7938 m!152947))

(assert (=> b!104307 d!32336))

(declare-fun d!32338 () Bool)

(declare-fun e!68475 () Bool)

(assert (=> d!32338 e!68475))

(declare-fun res!86075 () Bool)

(assert (=> d!32338 (=> (not res!86075) (not e!68475))))

(declare-fun lt!153697 () tuple2!8630)

(assert (=> d!32338 (= res!86075 (= (size!2223 (buf!2589 thiss!1305)) (size!2223 (buf!2589 (_2!4570 lt!153697)))))))

(declare-fun choose!16 (BitStream!3920 Bool) tuple2!8630)

(assert (=> d!32338 (= lt!153697 (choose!16 thiss!1305 lt!152887))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!32338 (validate_offset_bit!0 ((_ sign_extend 32) (size!2223 (buf!2589 thiss!1305))) ((_ sign_extend 32) (currentByte!5074 thiss!1305)) ((_ sign_extend 32) (currentBit!5069 thiss!1305)))))

(assert (=> d!32338 (= (appendBit!0 thiss!1305 lt!152887) lt!153697)))

(declare-fun b!104555 () Bool)

(declare-fun e!68474 () Bool)

(assert (=> b!104555 (= e!68475 e!68474)))

(declare-fun res!86074 () Bool)

(assert (=> b!104555 (=> (not res!86074) (not e!68474))))

(declare-fun lt!153696 () tuple2!8636)

(assert (=> b!104555 (= res!86074 (and (= (_2!4573 lt!153696) lt!152887) (= (_1!4573 lt!153696) (_2!4570 lt!153697))))))

(assert (=> b!104555 (= lt!153696 (readBitPure!0 (readerFrom!0 (_2!4570 lt!153697) (currentBit!5069 thiss!1305) (currentByte!5074 thiss!1305))))))

(declare-fun b!104553 () Bool)

(declare-fun res!86076 () Bool)

(assert (=> b!104553 (=> (not res!86076) (not e!68475))))

(declare-fun lt!153698 () (_ BitVec 64))

(declare-fun lt!153695 () (_ BitVec 64))

(assert (=> b!104553 (= res!86076 (= (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!153697))) (currentByte!5074 (_2!4570 lt!153697)) (currentBit!5069 (_2!4570 lt!153697))) (bvadd lt!153695 lt!153698)))))

(assert (=> b!104553 (or (not (= (bvand lt!153695 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!153698 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!153695 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!153695 lt!153698) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!104553 (= lt!153698 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!104553 (= lt!153695 (bitIndex!0 (size!2223 (buf!2589 thiss!1305)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305)))))

(declare-fun b!104556 () Bool)

(assert (=> b!104556 (= e!68474 (= (bitIndex!0 (size!2223 (buf!2589 (_1!4573 lt!153696))) (currentByte!5074 (_1!4573 lt!153696)) (currentBit!5069 (_1!4573 lt!153696))) (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!153697))) (currentByte!5074 (_2!4570 lt!153697)) (currentBit!5069 (_2!4570 lt!153697)))))))

(declare-fun b!104554 () Bool)

(declare-fun res!86073 () Bool)

(assert (=> b!104554 (=> (not res!86073) (not e!68475))))

(assert (=> b!104554 (= res!86073 (isPrefixOf!0 thiss!1305 (_2!4570 lt!153697)))))

(assert (= (and d!32338 res!86075) b!104553))

(assert (= (and b!104553 res!86076) b!104554))

(assert (= (and b!104554 res!86073) b!104555))

(assert (= (and b!104555 res!86074) b!104556))

(declare-fun m!152949 () Bool)

(assert (=> b!104553 m!152949))

(assert (=> b!104553 m!152521))

(declare-fun m!152951 () Bool)

(assert (=> b!104554 m!152951))

(declare-fun m!152953 () Bool)

(assert (=> b!104555 m!152953))

(assert (=> b!104555 m!152953))

(declare-fun m!152955 () Bool)

(assert (=> b!104555 m!152955))

(declare-fun m!152957 () Bool)

(assert (=> d!32338 m!152957))

(declare-fun m!152959 () Bool)

(assert (=> d!32338 m!152959))

(declare-fun m!152961 () Bool)

(assert (=> b!104556 m!152961))

(assert (=> b!104556 m!152949))

(assert (=> b!104307 d!32338))

(declare-fun d!32340 () Bool)

(declare-fun lt!153703 () tuple2!8648)

(assert (=> d!32340 (= lt!153703 (readBit!0 lt!152897))))

(assert (=> d!32340 (= (readBitPure!0 lt!152897) (tuple2!8637 (_2!4579 lt!153703) (_1!4579 lt!153703)))))

(declare-fun bs!7939 () Bool)

(assert (= bs!7939 d!32340))

(declare-fun m!152963 () Bool)

(assert (=> bs!7939 m!152963))

(assert (=> b!104307 d!32340))

(declare-fun lt!153704 () tuple2!8638)

(declare-fun d!32342 () Bool)

(assert (=> d!32342 (= lt!153704 (readNLeastSignificantBitsLoop!0 (_1!4572 lt!152882) nBits!396 i!615 lt!152885))))

(assert (=> d!32342 (= (readNLeastSignificantBitsLoopPure!0 (_1!4572 lt!152882) nBits!396 i!615 lt!152885) (tuple2!8633 (_2!4574 lt!153704) (_1!4574 lt!153704)))))

(declare-fun bs!7940 () Bool)

(assert (= bs!7940 d!32342))

(declare-fun m!152965 () Bool)

(assert (=> bs!7940 m!152965))

(assert (=> b!104307 d!32342))

(declare-fun d!32344 () Bool)

(assert (=> d!32344 (validate_offset_bits!1 ((_ sign_extend 32) (size!2223 (buf!2589 (_2!4570 lt!152888)))) ((_ sign_extend 32) (currentByte!5074 (_2!4570 lt!152884))) ((_ sign_extend 32) (currentBit!5069 (_2!4570 lt!152884))) lt!152889)))

(declare-fun lt!153707 () Unit!6390)

(declare-fun choose!9 (BitStream!3920 array!4870 (_ BitVec 64) BitStream!3920) Unit!6390)

(assert (=> d!32344 (= lt!153707 (choose!9 (_2!4570 lt!152884) (buf!2589 (_2!4570 lt!152888)) lt!152889 (BitStream!3921 (buf!2589 (_2!4570 lt!152888)) (currentByte!5074 (_2!4570 lt!152884)) (currentBit!5069 (_2!4570 lt!152884)))))))

(assert (=> d!32344 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4570 lt!152884) (buf!2589 (_2!4570 lt!152888)) lt!152889) lt!153707)))

(declare-fun bs!7941 () Bool)

(assert (= bs!7941 d!32344))

(assert (=> bs!7941 m!152509))

(declare-fun m!153019 () Bool)

(assert (=> bs!7941 m!153019))

(assert (=> b!104307 d!32344))

(declare-fun d!32348 () Bool)

(declare-fun e!68478 () Bool)

(assert (=> d!32348 e!68478))

(declare-fun res!86082 () Bool)

(assert (=> d!32348 (=> (not res!86082) (not e!68478))))

(declare-fun lt!153709 () (_ BitVec 64))

(declare-fun lt!153713 () (_ BitVec 64))

(declare-fun lt!153708 () (_ BitVec 64))

(assert (=> d!32348 (= res!86082 (= lt!153709 (bvsub lt!153708 lt!153713)))))

(assert (=> d!32348 (or (= (bvand lt!153708 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!153713 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!153708 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!153708 lt!153713) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32348 (= lt!153713 (remainingBits!0 ((_ sign_extend 32) (size!2223 (buf!2589 (_1!4573 lt!152890)))) ((_ sign_extend 32) (currentByte!5074 (_1!4573 lt!152890))) ((_ sign_extend 32) (currentBit!5069 (_1!4573 lt!152890)))))))

(declare-fun lt!153710 () (_ BitVec 64))

(declare-fun lt!153712 () (_ BitVec 64))

(assert (=> d!32348 (= lt!153708 (bvmul lt!153710 lt!153712))))

(assert (=> d!32348 (or (= lt!153710 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!153712 (bvsdiv (bvmul lt!153710 lt!153712) lt!153710)))))

(assert (=> d!32348 (= lt!153712 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32348 (= lt!153710 ((_ sign_extend 32) (size!2223 (buf!2589 (_1!4573 lt!152890)))))))

(assert (=> d!32348 (= lt!153709 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5074 (_1!4573 lt!152890))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5069 (_1!4573 lt!152890)))))))

(assert (=> d!32348 (invariant!0 (currentBit!5069 (_1!4573 lt!152890)) (currentByte!5074 (_1!4573 lt!152890)) (size!2223 (buf!2589 (_1!4573 lt!152890))))))

(assert (=> d!32348 (= (bitIndex!0 (size!2223 (buf!2589 (_1!4573 lt!152890))) (currentByte!5074 (_1!4573 lt!152890)) (currentBit!5069 (_1!4573 lt!152890))) lt!153709)))

(declare-fun b!104561 () Bool)

(declare-fun res!86081 () Bool)

(assert (=> b!104561 (=> (not res!86081) (not e!68478))))

(assert (=> b!104561 (= res!86081 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!153709))))

(declare-fun b!104562 () Bool)

(declare-fun lt!153711 () (_ BitVec 64))

(assert (=> b!104562 (= e!68478 (bvsle lt!153709 (bvmul lt!153711 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!104562 (or (= lt!153711 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!153711 #b0000000000000000000000000000000000000000000000000000000000001000) lt!153711)))))

(assert (=> b!104562 (= lt!153711 ((_ sign_extend 32) (size!2223 (buf!2589 (_1!4573 lt!152890)))))))

(assert (= (and d!32348 res!86082) b!104561))

(assert (= (and b!104561 res!86081) b!104562))

(declare-fun m!153045 () Bool)

(assert (=> d!32348 m!153045))

(declare-fun m!153047 () Bool)

(assert (=> d!32348 m!153047))

(assert (=> b!104307 d!32348))

(declare-fun d!32350 () Bool)

(assert (=> d!32350 (validate_offset_bits!1 ((_ sign_extend 32) (size!2223 (buf!2589 (_2!4570 lt!152888)))) ((_ sign_extend 32) (currentByte!5074 thiss!1305)) ((_ sign_extend 32) (currentBit!5069 thiss!1305)) lt!152894)))

(declare-fun lt!153714 () Unit!6390)

(assert (=> d!32350 (= lt!153714 (choose!9 thiss!1305 (buf!2589 (_2!4570 lt!152888)) lt!152894 (BitStream!3921 (buf!2589 (_2!4570 lt!152888)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305))))))

(assert (=> d!32350 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2589 (_2!4570 lt!152888)) lt!152894) lt!153714)))

(declare-fun bs!7942 () Bool)

(assert (= bs!7942 d!32350))

(assert (=> bs!7942 m!152483))

(declare-fun m!153065 () Bool)

(assert (=> bs!7942 m!153065))

(assert (=> b!104307 d!32350))

(declare-fun d!32352 () Bool)

(declare-fun res!86092 () Bool)

(declare-fun e!68484 () Bool)

(assert (=> d!32352 (=> (not res!86092) (not e!68484))))

(assert (=> d!32352 (= res!86092 (= (size!2223 (buf!2589 thiss!1305)) (size!2223 (buf!2589 (_2!4570 lt!152888)))))))

(assert (=> d!32352 (= (isPrefixOf!0 thiss!1305 (_2!4570 lt!152888)) e!68484)))

(declare-fun b!104571 () Bool)

(declare-fun res!86093 () Bool)

(assert (=> b!104571 (=> (not res!86093) (not e!68484))))

(assert (=> b!104571 (= res!86093 (bvsle (bitIndex!0 (size!2223 (buf!2589 thiss!1305)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305)) (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!152888))) (currentByte!5074 (_2!4570 lt!152888)) (currentBit!5069 (_2!4570 lt!152888)))))))

(declare-fun b!104572 () Bool)

(declare-fun e!68485 () Bool)

(assert (=> b!104572 (= e!68484 e!68485)))

(declare-fun res!86094 () Bool)

(assert (=> b!104572 (=> res!86094 e!68485)))

(assert (=> b!104572 (= res!86094 (= (size!2223 (buf!2589 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!104573 () Bool)

(assert (=> b!104573 (= e!68485 (arrayBitRangesEq!0 (buf!2589 thiss!1305) (buf!2589 (_2!4570 lt!152888)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2223 (buf!2589 thiss!1305)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305))))))

(assert (= (and d!32352 res!86092) b!104571))

(assert (= (and b!104571 res!86093) b!104572))

(assert (= (and b!104572 (not res!86094)) b!104573))

(assert (=> b!104571 m!152521))

(assert (=> b!104571 m!152873))

(assert (=> b!104573 m!152521))

(assert (=> b!104573 m!152521))

(declare-fun m!153089 () Bool)

(assert (=> b!104573 m!153089))

(assert (=> b!104307 d!32352))

(declare-fun d!32374 () Bool)

(assert (=> d!32374 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2223 (buf!2589 (_2!4570 lt!152888)))) ((_ sign_extend 32) (currentByte!5074 (_2!4570 lt!152884))) ((_ sign_extend 32) (currentBit!5069 (_2!4570 lt!152884))) lt!152889) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2223 (buf!2589 (_2!4570 lt!152888)))) ((_ sign_extend 32) (currentByte!5074 (_2!4570 lt!152884))) ((_ sign_extend 32) (currentBit!5069 (_2!4570 lt!152884)))) lt!152889))))

(declare-fun bs!7950 () Bool)

(assert (= bs!7950 d!32374))

(declare-fun m!153091 () Bool)

(assert (=> bs!7950 m!153091))

(assert (=> b!104307 d!32374))

(declare-fun d!32376 () Bool)

(declare-fun e!68488 () Bool)

(assert (=> d!32376 e!68488))

(declare-fun res!86098 () Bool)

(assert (=> d!32376 (=> (not res!86098) (not e!68488))))

(declare-fun lt!153731 () (_ BitVec 64))

(declare-fun lt!153736 () (_ BitVec 64))

(declare-fun lt!153732 () (_ BitVec 64))

(assert (=> d!32376 (= res!86098 (= lt!153732 (bvsub lt!153731 lt!153736)))))

(assert (=> d!32376 (or (= (bvand lt!153731 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!153736 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!153731 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!153731 lt!153736) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32376 (= lt!153736 (remainingBits!0 ((_ sign_extend 32) (size!2223 (buf!2589 (_2!4570 lt!152884)))) ((_ sign_extend 32) (currentByte!5074 (_2!4570 lt!152884))) ((_ sign_extend 32) (currentBit!5069 (_2!4570 lt!152884)))))))

(declare-fun lt!153733 () (_ BitVec 64))

(declare-fun lt!153735 () (_ BitVec 64))

(assert (=> d!32376 (= lt!153731 (bvmul lt!153733 lt!153735))))

(assert (=> d!32376 (or (= lt!153733 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!153735 (bvsdiv (bvmul lt!153733 lt!153735) lt!153733)))))

(assert (=> d!32376 (= lt!153735 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32376 (= lt!153733 ((_ sign_extend 32) (size!2223 (buf!2589 (_2!4570 lt!152884)))))))

(assert (=> d!32376 (= lt!153732 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5074 (_2!4570 lt!152884))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5069 (_2!4570 lt!152884)))))))

(assert (=> d!32376 (invariant!0 (currentBit!5069 (_2!4570 lt!152884)) (currentByte!5074 (_2!4570 lt!152884)) (size!2223 (buf!2589 (_2!4570 lt!152884))))))

(assert (=> d!32376 (= (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!152884))) (currentByte!5074 (_2!4570 lt!152884)) (currentBit!5069 (_2!4570 lt!152884))) lt!153732)))

(declare-fun b!104576 () Bool)

(declare-fun res!86097 () Bool)

(assert (=> b!104576 (=> (not res!86097) (not e!68488))))

(assert (=> b!104576 (= res!86097 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!153732))))

(declare-fun b!104577 () Bool)

(declare-fun lt!153734 () (_ BitVec 64))

(assert (=> b!104577 (= e!68488 (bvsle lt!153732 (bvmul lt!153734 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!104577 (or (= lt!153734 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!153734 #b0000000000000000000000000000000000000000000000000000000000001000) lt!153734)))))

(assert (=> b!104577 (= lt!153734 ((_ sign_extend 32) (size!2223 (buf!2589 (_2!4570 lt!152884)))))))

(assert (= (and d!32376 res!86098) b!104576))

(assert (= (and b!104576 res!86097) b!104577))

(declare-fun m!153093 () Bool)

(assert (=> d!32376 m!153093))

(declare-fun m!153095 () Bool)

(assert (=> d!32376 m!153095))

(assert (=> b!104305 d!32376))

(declare-fun d!32378 () Bool)

(declare-fun e!68489 () Bool)

(assert (=> d!32378 e!68489))

(declare-fun res!86100 () Bool)

(assert (=> d!32378 (=> (not res!86100) (not e!68489))))

(declare-fun lt!153742 () (_ BitVec 64))

(declare-fun lt!153738 () (_ BitVec 64))

(declare-fun lt!153737 () (_ BitVec 64))

(assert (=> d!32378 (= res!86100 (= lt!153738 (bvsub lt!153737 lt!153742)))))

(assert (=> d!32378 (or (= (bvand lt!153737 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!153742 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!153737 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!153737 lt!153742) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32378 (= lt!153742 (remainingBits!0 ((_ sign_extend 32) (size!2223 (buf!2589 thiss!1305))) ((_ sign_extend 32) (currentByte!5074 thiss!1305)) ((_ sign_extend 32) (currentBit!5069 thiss!1305))))))

(declare-fun lt!153739 () (_ BitVec 64))

(declare-fun lt!153741 () (_ BitVec 64))

(assert (=> d!32378 (= lt!153737 (bvmul lt!153739 lt!153741))))

(assert (=> d!32378 (or (= lt!153739 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!153741 (bvsdiv (bvmul lt!153739 lt!153741) lt!153739)))))

(assert (=> d!32378 (= lt!153741 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32378 (= lt!153739 ((_ sign_extend 32) (size!2223 (buf!2589 thiss!1305))))))

(assert (=> d!32378 (= lt!153738 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5074 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5069 thiss!1305))))))

(assert (=> d!32378 (invariant!0 (currentBit!5069 thiss!1305) (currentByte!5074 thiss!1305) (size!2223 (buf!2589 thiss!1305)))))

(assert (=> d!32378 (= (bitIndex!0 (size!2223 (buf!2589 thiss!1305)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305)) lt!153738)))

(declare-fun b!104578 () Bool)

(declare-fun res!86099 () Bool)

(assert (=> b!104578 (=> (not res!86099) (not e!68489))))

(assert (=> b!104578 (= res!86099 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!153738))))

(declare-fun b!104579 () Bool)

(declare-fun lt!153740 () (_ BitVec 64))

(assert (=> b!104579 (= e!68489 (bvsle lt!153738 (bvmul lt!153740 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!104579 (or (= lt!153740 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!153740 #b0000000000000000000000000000000000000000000000000000000000001000) lt!153740)))))

(assert (=> b!104579 (= lt!153740 ((_ sign_extend 32) (size!2223 (buf!2589 thiss!1305))))))

(assert (= (and d!32378 res!86100) b!104578))

(assert (= (and b!104578 res!86099) b!104579))

(assert (=> d!32378 m!152617))

(declare-fun m!153097 () Bool)

(assert (=> d!32378 m!153097))

(assert (=> b!104305 d!32378))

(declare-fun d!32380 () Bool)

(declare-fun lt!153746 () tuple2!8648)

(assert (=> d!32380 (= lt!153746 (readBit!0 (readerFrom!0 (_2!4570 lt!152884) (currentBit!5069 thiss!1305) (currentByte!5074 thiss!1305))))))

(assert (=> d!32380 (= (readBitPure!0 (readerFrom!0 (_2!4570 lt!152884) (currentBit!5069 thiss!1305) (currentByte!5074 thiss!1305))) (tuple2!8637 (_2!4579 lt!153746) (_1!4579 lt!153746)))))

(declare-fun bs!7952 () Bool)

(assert (= bs!7952 d!32380))

(assert (=> bs!7952 m!152511))

(declare-fun m!153103 () Bool)

(assert (=> bs!7952 m!153103))

(assert (=> b!104303 d!32380))

(declare-fun d!32384 () Bool)

(declare-fun e!68495 () Bool)

(assert (=> d!32384 e!68495))

(declare-fun res!86108 () Bool)

(assert (=> d!32384 (=> (not res!86108) (not e!68495))))

(assert (=> d!32384 (= res!86108 (invariant!0 (currentBit!5069 (_2!4570 lt!152884)) (currentByte!5074 (_2!4570 lt!152884)) (size!2223 (buf!2589 (_2!4570 lt!152884)))))))

(assert (=> d!32384 (= (readerFrom!0 (_2!4570 lt!152884) (currentBit!5069 thiss!1305) (currentByte!5074 thiss!1305)) (BitStream!3921 (buf!2589 (_2!4570 lt!152884)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305)))))

(declare-fun b!104586 () Bool)

(assert (=> b!104586 (= e!68495 (invariant!0 (currentBit!5069 thiss!1305) (currentByte!5074 thiss!1305) (size!2223 (buf!2589 (_2!4570 lt!152884)))))))

(assert (= (and d!32384 res!86108) b!104586))

(assert (=> d!32384 m!153095))

(assert (=> b!104586 m!152467))

(assert (=> b!104303 d!32384))

(declare-fun d!32400 () Bool)

(assert (=> d!32400 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5069 thiss!1305) (currentByte!5074 thiss!1305) (size!2223 (buf!2589 thiss!1305))))))

(declare-fun bs!7955 () Bool)

(assert (= bs!7955 d!32400))

(assert (=> bs!7955 m!153097))

(assert (=> start!20612 d!32400))

(declare-fun d!32402 () Bool)

(assert (=> d!32402 (= (invariant!0 (currentBit!5069 thiss!1305) (currentByte!5074 thiss!1305) (size!2223 (buf!2589 (_2!4570 lt!152884)))) (and (bvsge (currentBit!5069 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5069 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5074 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5074 thiss!1305) (size!2223 (buf!2589 (_2!4570 lt!152884)))) (and (= (currentBit!5069 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5074 thiss!1305) (size!2223 (buf!2589 (_2!4570 lt!152884))))))))))

(assert (=> b!104302 d!32402))

(declare-fun d!32404 () Bool)

(declare-fun e!68498 () Bool)

(assert (=> d!32404 e!68498))

(declare-fun res!86111 () Bool)

(assert (=> d!32404 (=> (not res!86111) (not e!68498))))

(declare-fun lt!153754 () (_ BitVec 64))

(declare-fun lt!153753 () BitStream!3920)

(assert (=> d!32404 (= res!86111 (= (bvadd lt!153754 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2223 (buf!2589 lt!153753)) (currentByte!5074 lt!153753) (currentBit!5069 lt!153753))))))

(assert (=> d!32404 (or (not (= (bvand lt!153754 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!153754 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!153754 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32404 (= lt!153754 (bitIndex!0 (size!2223 (buf!2589 (_1!4572 lt!152882))) (currentByte!5074 (_1!4572 lt!152882)) (currentBit!5069 (_1!4572 lt!152882))))))

(declare-fun moveBitIndex!0 (BitStream!3920 (_ BitVec 64)) tuple2!8630)

(assert (=> d!32404 (= lt!153753 (_2!4570 (moveBitIndex!0 (_1!4572 lt!152882) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!3920 (_ BitVec 64)) Bool)

(assert (=> d!32404 (moveBitIndexPrecond!0 (_1!4572 lt!152882) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!32404 (= (withMovedBitIndex!0 (_1!4572 lt!152882) #b0000000000000000000000000000000000000000000000000000000000000001) lt!153753)))

(declare-fun b!104589 () Bool)

(assert (=> b!104589 (= e!68498 (= (size!2223 (buf!2589 (_1!4572 lt!152882))) (size!2223 (buf!2589 lt!153753))))))

(assert (= (and d!32404 res!86111) b!104589))

(declare-fun m!153111 () Bool)

(assert (=> d!32404 m!153111))

(declare-fun m!153113 () Bool)

(assert (=> d!32404 m!153113))

(declare-fun m!153115 () Bool)

(assert (=> d!32404 m!153115))

(declare-fun m!153117 () Bool)

(assert (=> d!32404 m!153117))

(assert (=> b!104301 d!32404))

(declare-fun d!32406 () Bool)

(assert (=> d!32406 (= (invariant!0 (currentBit!5069 (_2!4570 lt!152888)) (currentByte!5074 (_2!4570 lt!152888)) (size!2223 (buf!2589 (_2!4570 lt!152888)))) (and (bvsge (currentBit!5069 (_2!4570 lt!152888)) #b00000000000000000000000000000000) (bvslt (currentBit!5069 (_2!4570 lt!152888)) #b00000000000000000000000000001000) (bvsge (currentByte!5074 (_2!4570 lt!152888)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5074 (_2!4570 lt!152888)) (size!2223 (buf!2589 (_2!4570 lt!152888)))) (and (= (currentBit!5069 (_2!4570 lt!152888)) #b00000000000000000000000000000000) (= (currentByte!5074 (_2!4570 lt!152888)) (size!2223 (buf!2589 (_2!4570 lt!152888))))))))))

(assert (=> b!104301 d!32406))

(declare-fun lt!153755 () tuple2!8638)

(declare-fun d!32408 () Bool)

(assert (=> d!32408 (= lt!153755 (readNLeastSignificantBitsLoop!0 (withMovedBitIndex!0 (_1!4572 lt!152882) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!152905))))

(assert (=> d!32408 (= (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4572 lt!152882) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!152905) (tuple2!8633 (_2!4574 lt!153755) (_1!4574 lt!153755)))))

(declare-fun bs!7956 () Bool)

(assert (= bs!7956 d!32408))

(assert (=> bs!7956 m!152523))

(declare-fun m!153119 () Bool)

(assert (=> bs!7956 m!153119))

(assert (=> b!104301 d!32408))

(declare-fun d!32410 () Bool)

(declare-fun lt!153834 () tuple2!8632)

(declare-fun lt!153835 () tuple2!8632)

(assert (=> d!32410 (and (= (_2!4571 lt!153834) (_2!4571 lt!153835)) (= (_1!4571 lt!153834) (_1!4571 lt!153835)))))

(declare-fun lt!153836 () Unit!6390)

(declare-fun lt!153832 () Bool)

(declare-fun lt!153833 () (_ BitVec 64))

(declare-fun lt!153831 () BitStream!3920)

(declare-fun choose!45 (BitStream!3920 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!8632 tuple2!8632 BitStream!3920 (_ BitVec 64) Bool BitStream!3920 (_ BitVec 64) tuple2!8632 tuple2!8632 BitStream!3920 (_ BitVec 64)) Unit!6390)

(assert (=> d!32410 (= lt!153836 (choose!45 (_1!4572 lt!152882) nBits!396 i!615 lt!152885 lt!153834 (tuple2!8633 (_1!4571 lt!153834) (_2!4571 lt!153834)) (_1!4571 lt!153834) (_2!4571 lt!153834) lt!153832 lt!153831 lt!153833 lt!153835 (tuple2!8633 (_1!4571 lt!153835) (_2!4571 lt!153835)) (_1!4571 lt!153835) (_2!4571 lt!153835)))))

(assert (=> d!32410 (= lt!153835 (readNLeastSignificantBitsLoopPure!0 lt!153831 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!153833))))

(assert (=> d!32410 (= lt!153833 (bvor lt!152885 (ite lt!153832 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32410 (= lt!153831 (withMovedBitIndex!0 (_1!4572 lt!152882) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!32410 (= lt!153832 (_2!4573 (readBitPure!0 (_1!4572 lt!152882))))))

(assert (=> d!32410 (= lt!153834 (readNLeastSignificantBitsLoopPure!0 (_1!4572 lt!152882) nBits!396 i!615 lt!152885))))

(assert (=> d!32410 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4572 lt!152882) nBits!396 i!615 lt!152885) lt!153836)))

(declare-fun bs!7963 () Bool)

(assert (= bs!7963 d!32410))

(declare-fun m!153175 () Bool)

(assert (=> bs!7963 m!153175))

(assert (=> bs!7963 m!152485))

(declare-fun m!153177 () Bool)

(assert (=> bs!7963 m!153177))

(assert (=> bs!7963 m!152523))

(assert (=> bs!7963 m!152503))

(assert (=> b!104301 d!32410))

(assert (=> b!104301 d!32378))

(declare-fun d!32426 () Bool)

(assert (=> d!32426 (= (array_inv!2025 (buf!2589 thiss!1305)) (bvsge (size!2223 (buf!2589 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!104312 d!32426))

(declare-fun d!32428 () Bool)

(assert (=> d!32428 (= (invariant!0 (currentBit!5069 thiss!1305) (currentByte!5074 thiss!1305) (size!2223 (buf!2589 (_2!4570 lt!152888)))) (and (bvsge (currentBit!5069 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5069 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5074 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5074 thiss!1305) (size!2223 (buf!2589 (_2!4570 lt!152888)))) (and (= (currentBit!5069 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5074 thiss!1305) (size!2223 (buf!2589 (_2!4570 lt!152888))))))))))

(assert (=> b!104311 d!32428))

(declare-fun d!32430 () Bool)

(declare-fun res!86135 () Bool)

(declare-fun e!68513 () Bool)

(assert (=> d!32430 (=> (not res!86135) (not e!68513))))

(assert (=> d!32430 (= res!86135 (= (size!2223 (buf!2589 thiss!1305)) (size!2223 (buf!2589 (_2!4570 lt!152884)))))))

(assert (=> d!32430 (= (isPrefixOf!0 thiss!1305 (_2!4570 lt!152884)) e!68513)))

(declare-fun b!104615 () Bool)

(declare-fun res!86136 () Bool)

(assert (=> b!104615 (=> (not res!86136) (not e!68513))))

(assert (=> b!104615 (= res!86136 (bvsle (bitIndex!0 (size!2223 (buf!2589 thiss!1305)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305)) (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!152884))) (currentByte!5074 (_2!4570 lt!152884)) (currentBit!5069 (_2!4570 lt!152884)))))))

(declare-fun b!104616 () Bool)

(declare-fun e!68514 () Bool)

(assert (=> b!104616 (= e!68513 e!68514)))

(declare-fun res!86137 () Bool)

(assert (=> b!104616 (=> res!86137 e!68514)))

(assert (=> b!104616 (= res!86137 (= (size!2223 (buf!2589 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!104617 () Bool)

(assert (=> b!104617 (= e!68514 (arrayBitRangesEq!0 (buf!2589 thiss!1305) (buf!2589 (_2!4570 lt!152884)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2223 (buf!2589 thiss!1305)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305))))))

(assert (= (and d!32430 res!86135) b!104615))

(assert (= (and b!104615 res!86136) b!104616))

(assert (= (and b!104616 (not res!86137)) b!104617))

(assert (=> b!104615 m!152521))

(assert (=> b!104615 m!152527))

(assert (=> b!104617 m!152521))

(assert (=> b!104617 m!152521))

(declare-fun m!153181 () Bool)

(assert (=> b!104617 m!153181))

(assert (=> b!104300 d!32430))

(declare-fun d!32434 () Bool)

(declare-fun e!68518 () Bool)

(assert (=> d!32434 e!68518))

(declare-fun res!86143 () Bool)

(assert (=> d!32434 (=> (not res!86143) (not e!68518))))

(declare-fun lt!153839 () (_ BitVec 64))

(declare-fun lt!153844 () (_ BitVec 64))

(declare-fun lt!153840 () (_ BitVec 64))

(assert (=> d!32434 (= res!86143 (= lt!153840 (bvsub lt!153839 lt!153844)))))

(assert (=> d!32434 (or (= (bvand lt!153839 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!153844 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!153839 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!153839 lt!153844) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32434 (= lt!153844 (remainingBits!0 ((_ sign_extend 32) (size!2223 (buf!2589 (_1!4573 lt!152881)))) ((_ sign_extend 32) (currentByte!5074 (_1!4573 lt!152881))) ((_ sign_extend 32) (currentBit!5069 (_1!4573 lt!152881)))))))

(declare-fun lt!153841 () (_ BitVec 64))

(declare-fun lt!153843 () (_ BitVec 64))

(assert (=> d!32434 (= lt!153839 (bvmul lt!153841 lt!153843))))

(assert (=> d!32434 (or (= lt!153841 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!153843 (bvsdiv (bvmul lt!153841 lt!153843) lt!153841)))))

(assert (=> d!32434 (= lt!153843 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32434 (= lt!153841 ((_ sign_extend 32) (size!2223 (buf!2589 (_1!4573 lt!152881)))))))

(assert (=> d!32434 (= lt!153840 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5074 (_1!4573 lt!152881))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5069 (_1!4573 lt!152881)))))))

(assert (=> d!32434 (invariant!0 (currentBit!5069 (_1!4573 lt!152881)) (currentByte!5074 (_1!4573 lt!152881)) (size!2223 (buf!2589 (_1!4573 lt!152881))))))

(assert (=> d!32434 (= (bitIndex!0 (size!2223 (buf!2589 (_1!4573 lt!152881))) (currentByte!5074 (_1!4573 lt!152881)) (currentBit!5069 (_1!4573 lt!152881))) lt!153840)))

(declare-fun b!104622 () Bool)

(declare-fun res!86142 () Bool)

(assert (=> b!104622 (=> (not res!86142) (not e!68518))))

(assert (=> b!104622 (= res!86142 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!153840))))

(declare-fun b!104623 () Bool)

(declare-fun lt!153842 () (_ BitVec 64))

(assert (=> b!104623 (= e!68518 (bvsle lt!153840 (bvmul lt!153842 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!104623 (or (= lt!153842 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!153842 #b0000000000000000000000000000000000000000000000000000000000001000) lt!153842)))))

(assert (=> b!104623 (= lt!153842 ((_ sign_extend 32) (size!2223 (buf!2589 (_1!4573 lt!152881)))))))

(assert (= (and d!32434 res!86143) b!104622))

(assert (= (and b!104622 res!86142) b!104623))

(declare-fun m!153193 () Bool)

(assert (=> d!32434 m!153193))

(declare-fun m!153195 () Bool)

(assert (=> d!32434 m!153195))

(assert (=> b!104310 d!32434))

(declare-fun d!32442 () Bool)

(assert (=> d!32442 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!104309 d!32442))

(push 1)

(assert (not d!32374))

(assert (not b!104410))

(assert (not d!32316))

(assert (not b!104478))

(assert (not d!32350))

(assert (not d!32376))

(assert (not b!104555))

(assert (not d!32410))

(assert (not b!104416))

(assert (not d!32328))

(assert (not b!104415))

(assert (not b!104615))

(assert (not d!32404))

(assert (not b!104553))

(assert (not d!32326))

(assert (not b!104571))

(assert (not d!32342))

(assert (not d!32338))

(assert (not b!104409))

(assert (not b!104483))

(assert (not b!104586))

(assert (not d!32378))

(assert (not bm!1291))

(assert (not d!32384))

(assert (not b!104554))

(assert (not b!104417))

(assert (not d!32320))

(assert (not d!32348))

(assert (not b!104480))

(assert (not b!104412))

(assert (not d!32274))

(assert (not d!32276))

(assert (not d!32336))

(assert (not b!104617))

(assert (not b!104406))

(assert (not d!32344))

(assert (not b!104481))

(assert (not d!32408))

(assert (not b!104556))

(assert (not b!104475))

(assert (not b!104476))

(assert (not b!104418))

(assert (not b!104477))

(assert (not b!104482))

(assert (not d!32270))

(assert (not d!32318))

(assert (not d!32340))

(assert (not d!32322))

(assert (not d!32380))

(assert (not b!104413))

(assert (not d!32434))

(assert (not d!32400))

(assert (not b!104573))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!104888 () Bool)

(declare-fun lt!154285 () tuple2!8638)

(declare-fun e!68693 () Bool)

(declare-fun lt!154286 () (_ BitVec 64))

(assert (=> b!104888 (= e!68693 (= (= (bvand (bvlshr (_1!4574 lt!154285) lt!154286) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!4573 (readBitPure!0 (_1!4572 lt!152882)))))))

(assert (=> b!104888 (and (bvsge lt!154286 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!154286 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!154289 () (_ BitVec 32))

(assert (=> b!104888 (= lt!154286 ((_ sign_extend 32) (bvsub lt!154289 i!615)))))

(assert (=> b!104888 (or (= (bvand lt!154289 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand lt!154289 #b10000000000000000000000000000000) (bvand (bvsub lt!154289 i!615) #b10000000000000000000000000000000)))))

(assert (=> b!104888 (= lt!154289 (bvsub nBits!396 #b00000000000000000000000000000001))))

(assert (=> b!104888 (or (= (bvand nBits!396 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!104889 () Bool)

(declare-fun e!68692 () tuple2!8638)

(declare-fun lt!154284 () tuple2!8638)

(assert (=> b!104889 (= e!68692 (tuple2!8639 (_1!4574 lt!154284) (_2!4574 lt!154284)))))

(declare-fun lt!154283 () tuple2!8648)

(assert (=> b!104889 (= lt!154283 (readBit!0 (_1!4572 lt!152882)))))

(assert (=> b!104889 (= lt!154284 (readNLeastSignificantBitsLoop!0 (_2!4579 lt!154283) nBits!396 (bvadd i!615 #b00000000000000000000000000000001) (bvor lt!152885 (ite (_1!4579 lt!154283) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!104890 () Bool)

(assert (=> b!104890 (= e!68692 (tuple2!8639 lt!152885 (_1!4572 lt!152882)))))

(declare-fun d!32684 () Bool)

(declare-fun e!68691 () Bool)

(assert (=> d!32684 e!68691))

(declare-fun res!86361 () Bool)

(assert (=> d!32684 (=> (not res!86361) (not e!68691))))

(assert (=> d!32684 (= res!86361 (= (buf!2589 (_2!4574 lt!154285)) (buf!2589 (_1!4572 lt!152882))))))

(assert (=> d!32684 (= lt!154285 e!68692)))

(declare-fun c!6468 () Bool)

(assert (=> d!32684 (= c!6468 (= nBits!396 i!615))))

(assert (=> d!32684 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!32684 (= (readNLeastSignificantBitsLoop!0 (_1!4572 lt!152882) nBits!396 i!615 lt!152885) lt!154285)))

(declare-fun b!104891 () Bool)

(declare-fun res!86362 () Bool)

(assert (=> b!104891 (=> (not res!86362) (not e!68691))))

(declare-fun lt!154287 () (_ BitVec 64))

(declare-fun lt!154282 () (_ BitVec 64))

(assert (=> b!104891 (= res!86362 (= (bitIndex!0 (size!2223 (buf!2589 (_2!4574 lt!154285))) (currentByte!5074 (_2!4574 lt!154285)) (currentBit!5069 (_2!4574 lt!154285))) (bvadd lt!154282 lt!154287)))))

(assert (=> b!104891 (or (not (= (bvand lt!154282 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!154287 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!154282 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!154282 lt!154287) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!104891 (= lt!154287 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (=> b!104891 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000)))))

(assert (=> b!104891 (= lt!154282 (bitIndex!0 (size!2223 (buf!2589 (_1!4572 lt!152882))) (currentByte!5074 (_1!4572 lt!152882)) (currentBit!5069 (_1!4572 lt!152882))))))

(declare-fun b!104892 () Bool)

(declare-fun res!86364 () Bool)

(assert (=> b!104892 (=> (not res!86364) (not e!68691))))

(assert (=> b!104892 (= res!86364 (= (bvand (_1!4574 lt!154285) (onesLSBLong!0 nBits!396)) (_1!4574 lt!154285)))))

(declare-fun b!104893 () Bool)

(assert (=> b!104893 (= e!68691 e!68693)))

(declare-fun res!86365 () Bool)

(assert (=> b!104893 (=> res!86365 e!68693)))

(assert (=> b!104893 (= res!86365 (bvsge i!615 nBits!396))))

(declare-fun b!104894 () Bool)

(declare-fun res!86363 () Bool)

(assert (=> b!104894 (=> (not res!86363) (not e!68691))))

(declare-fun lt!154281 () (_ BitVec 64))

(declare-fun lt!154288 () (_ BitVec 64))

(assert (=> b!104894 (= res!86363 (= (bvlshr (_1!4574 lt!154285) lt!154281) (bvlshr lt!152885 lt!154288)))))

(assert (=> b!104894 (and (bvsge lt!154288 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!154288 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!104894 (= lt!154288 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (=> b!104894 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000)))))

(assert (=> b!104894 (and (bvsge lt!154281 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!154281 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!104894 (= lt!154281 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (=> b!104894 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000)))))

(assert (= (and d!32684 c!6468) b!104890))

(assert (= (and d!32684 (not c!6468)) b!104889))

(assert (= (and d!32684 res!86361) b!104891))

(assert (= (and b!104891 res!86362) b!104894))

(assert (= (and b!104894 res!86363) b!104892))

(assert (= (and b!104892 res!86364) b!104893))

(assert (= (and b!104893 (not res!86365)) b!104888))

(assert (=> b!104888 m!152485))

(assert (=> b!104889 m!152785))

(declare-fun m!153769 () Bool)

(assert (=> b!104889 m!153769))

(declare-fun m!153771 () Bool)

(assert (=> b!104891 m!153771))

(assert (=> b!104891 m!153113))

(assert (=> b!104892 m!152463))

(assert (=> d!32342 d!32684))

(assert (=> d!32410 d!32404))

(declare-fun d!32686 () Bool)

(declare-fun lt!154295 () tuple2!8632)

(declare-fun lt!154294 () tuple2!8632)

(assert (=> d!32686 (and (= (_2!4571 lt!154295) (_2!4571 lt!154294)) (= (_1!4571 lt!154295) (_1!4571 lt!154294)))))

(declare-fun e!68696 () (_ BitVec 64))

(assert (=> d!32686 (= lt!154294 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4572 lt!152882) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd i!615 #b00000000000000000000000000000001) (bvor lt!152885 e!68696)))))

(declare-fun c!6471 () Bool)

(assert (=> d!32686 (= c!6471 (_2!4573 (readBitPure!0 (_1!4572 lt!152882))))))

(assert (=> d!32686 (= lt!154295 (readNLeastSignificantBitsLoopPure!0 (_1!4572 lt!152882) nBits!396 i!615 lt!152885))))

(assert (=> d!32686 true))

(declare-fun _$11!38 () Unit!6390)

(assert (=> d!32686 (= (choose!45 (_1!4572 lt!152882) nBits!396 i!615 lt!152885 lt!153834 (tuple2!8633 (_1!4571 lt!153834) (_2!4571 lt!153834)) (_1!4571 lt!153834) (_2!4571 lt!153834) lt!153832 lt!153831 lt!153833 lt!153835 (tuple2!8633 (_1!4571 lt!153835) (_2!4571 lt!153835)) (_1!4571 lt!153835) (_2!4571 lt!153835)) _$11!38)))

(declare-fun b!104899 () Bool)

(assert (=> b!104899 (= e!68696 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!104900 () Bool)

(assert (=> b!104900 (= e!68696 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (= (and d!32686 c!6471) b!104899))

(assert (= (and d!32686 (not c!6471)) b!104900))

(assert (=> d!32686 m!152523))

(assert (=> d!32686 m!152523))

(declare-fun m!153773 () Bool)

(assert (=> d!32686 m!153773))

(assert (=> d!32686 m!152485))

(assert (=> d!32686 m!152503))

(assert (=> d!32410 d!32686))

(assert (=> d!32410 d!32318))

(declare-fun d!32688 () Bool)

(declare-fun lt!154296 () tuple2!8638)

(assert (=> d!32688 (= lt!154296 (readNLeastSignificantBitsLoop!0 lt!153831 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!153833))))

(assert (=> d!32688 (= (readNLeastSignificantBitsLoopPure!0 lt!153831 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!153833) (tuple2!8633 (_2!4574 lt!154296) (_1!4574 lt!154296)))))

(declare-fun bs!8005 () Bool)

(assert (= bs!8005 d!32688))

(declare-fun m!153775 () Bool)

(assert (=> bs!8005 m!153775))

(assert (=> d!32410 d!32688))

(assert (=> d!32410 d!32342))

(declare-fun d!32690 () Bool)

(assert (=> d!32690 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2223 (buf!2589 (_2!4570 lt!152884)))) ((_ sign_extend 32) (currentByte!5074 (_2!4570 lt!152884))) ((_ sign_extend 32) (currentBit!5069 (_2!4570 lt!152884))) lt!153271) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2223 (buf!2589 (_2!4570 lt!152884)))) ((_ sign_extend 32) (currentByte!5074 (_2!4570 lt!152884))) ((_ sign_extend 32) (currentBit!5069 (_2!4570 lt!152884)))) lt!153271))))

(declare-fun bs!8006 () Bool)

(assert (= bs!8006 d!32690))

(assert (=> bs!8006 m!153093))

(assert (=> b!104412 d!32690))

(declare-fun d!32692 () Bool)

(assert (=> d!32692 (= (remainingBits!0 ((_ sign_extend 32) (size!2223 (buf!2589 (_2!4570 lt!152888)))) ((_ sign_extend 32) (currentByte!5074 (_2!4570 lt!152884))) ((_ sign_extend 32) (currentBit!5069 (_2!4570 lt!152884)))) (bvsub (bvmul ((_ sign_extend 32) (size!2223 (buf!2589 (_2!4570 lt!152888)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5074 (_2!4570 lt!152884))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5069 (_2!4570 lt!152884))))))))

(assert (=> d!32374 d!32692))

(declare-datatypes ((tuple4!70 0))(
  ( (tuple4!71 (_1!4581 (_ BitVec 32)) (_2!4581 (_ BitVec 32)) (_3!256 (_ BitVec 32)) (_4!35 (_ BitVec 32))) )
))
(declare-fun lt!154303 () tuple4!70)

(declare-fun b!104915 () Bool)

(declare-fun e!68714 () Bool)

(declare-fun arrayRangesEq!36 (array!4870 array!4870 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!104915 (= e!68714 (arrayRangesEq!36 (buf!2589 thiss!1305) (buf!2589 (_2!4570 lt!152884)) (_1!4581 lt!154303) (_2!4581 lt!154303)))))

(declare-fun lt!154304 () (_ BitVec 32))

(declare-fun bm!1307 () Bool)

(declare-fun c!6474 () Bool)

(declare-fun call!1310 () Bool)

(declare-fun lt!154305 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!1307 (= call!1310 (byteRangesEq!0 (select (arr!2816 (buf!2589 thiss!1305)) (_3!256 lt!154303)) (select (arr!2816 (buf!2589 (_2!4570 lt!152884))) (_3!256 lt!154303)) lt!154305 (ite c!6474 lt!154304 #b00000000000000000000000000001000)))))

(declare-fun b!104916 () Bool)

(declare-fun e!68711 () Bool)

(declare-fun e!68709 () Bool)

(assert (=> b!104916 (= e!68711 e!68709)))

(assert (=> b!104916 (= c!6474 (= (_3!256 lt!154303) (_4!35 lt!154303)))))

(declare-fun b!104917 () Bool)

(declare-fun e!68713 () Bool)

(assert (=> b!104917 (= e!68713 (byteRangesEq!0 (select (arr!2816 (buf!2589 thiss!1305)) (_4!35 lt!154303)) (select (arr!2816 (buf!2589 (_2!4570 lt!152884))) (_4!35 lt!154303)) #b00000000000000000000000000000000 lt!154304))))

(declare-fun b!104918 () Bool)

(declare-fun e!68712 () Bool)

(assert (=> b!104918 (= e!68709 e!68712)))

(declare-fun res!86379 () Bool)

(assert (=> b!104918 (= res!86379 call!1310)))

(assert (=> b!104918 (=> (not res!86379) (not e!68712))))

(declare-fun b!104919 () Bool)

(declare-fun e!68710 () Bool)

(assert (=> b!104919 (= e!68710 e!68711)))

(declare-fun res!86378 () Bool)

(assert (=> b!104919 (=> (not res!86378) (not e!68711))))

(assert (=> b!104919 (= res!86378 e!68714)))

(declare-fun res!86376 () Bool)

(assert (=> b!104919 (=> res!86376 e!68714)))

(assert (=> b!104919 (= res!86376 (bvsge (_1!4581 lt!154303) (_2!4581 lt!154303)))))

(assert (=> b!104919 (= lt!154304 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2223 (buf!2589 thiss!1305)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!104919 (= lt!154305 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!70)

(assert (=> b!104919 (= lt!154303 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2223 (buf!2589 thiss!1305)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305))))))

(declare-fun b!104920 () Bool)

(declare-fun res!86377 () Bool)

(assert (=> b!104920 (= res!86377 (= lt!154304 #b00000000000000000000000000000000))))

(assert (=> b!104920 (=> res!86377 e!68713)))

(assert (=> b!104920 (= e!68712 e!68713)))

(declare-fun d!32694 () Bool)

(declare-fun res!86380 () Bool)

(assert (=> d!32694 (=> res!86380 e!68710)))

(assert (=> d!32694 (= res!86380 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2223 (buf!2589 thiss!1305)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305))))))

(assert (=> d!32694 (= (arrayBitRangesEq!0 (buf!2589 thiss!1305) (buf!2589 (_2!4570 lt!152884)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2223 (buf!2589 thiss!1305)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305))) e!68710)))

(declare-fun b!104921 () Bool)

(assert (=> b!104921 (= e!68709 call!1310)))

(assert (= (and d!32694 (not res!86380)) b!104919))

(assert (= (and b!104919 (not res!86376)) b!104915))

(assert (= (and b!104919 res!86378) b!104916))

(assert (= (and b!104916 c!6474) b!104921))

(assert (= (and b!104916 (not c!6474)) b!104918))

(assert (= (and b!104918 res!86379) b!104920))

(assert (= (and b!104920 (not res!86377)) b!104917))

(assert (= (or b!104921 b!104918) bm!1307))

(declare-fun m!153777 () Bool)

(assert (=> b!104915 m!153777))

(declare-fun m!153779 () Bool)

(assert (=> bm!1307 m!153779))

(declare-fun m!153781 () Bool)

(assert (=> bm!1307 m!153781))

(assert (=> bm!1307 m!153779))

(assert (=> bm!1307 m!153781))

(declare-fun m!153783 () Bool)

(assert (=> bm!1307 m!153783))

(declare-fun m!153785 () Bool)

(assert (=> b!104917 m!153785))

(declare-fun m!153787 () Bool)

(assert (=> b!104917 m!153787))

(assert (=> b!104917 m!153785))

(assert (=> b!104917 m!153787))

(declare-fun m!153789 () Bool)

(assert (=> b!104917 m!153789))

(assert (=> b!104919 m!152521))

(declare-fun m!153791 () Bool)

(assert (=> b!104919 m!153791))

(assert (=> b!104617 d!32694))

(assert (=> b!104617 d!32378))

(declare-fun d!32696 () Bool)

(declare-fun res!86381 () Bool)

(declare-fun e!68715 () Bool)

(assert (=> d!32696 (=> (not res!86381) (not e!68715))))

(assert (=> d!32696 (= res!86381 (= (size!2223 (buf!2589 (_2!4572 lt!153501))) (size!2223 (buf!2589 (_2!4570 lt!152888)))))))

(assert (=> d!32696 (= (isPrefixOf!0 (_2!4572 lt!153501) (_2!4570 lt!152888)) e!68715)))

(declare-fun b!104922 () Bool)

(declare-fun res!86382 () Bool)

(assert (=> b!104922 (=> (not res!86382) (not e!68715))))

(assert (=> b!104922 (= res!86382 (bvsle (bitIndex!0 (size!2223 (buf!2589 (_2!4572 lt!153501))) (currentByte!5074 (_2!4572 lt!153501)) (currentBit!5069 (_2!4572 lt!153501))) (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!152888))) (currentByte!5074 (_2!4570 lt!152888)) (currentBit!5069 (_2!4570 lt!152888)))))))

(declare-fun b!104923 () Bool)

(declare-fun e!68716 () Bool)

(assert (=> b!104923 (= e!68715 e!68716)))

(declare-fun res!86383 () Bool)

(assert (=> b!104923 (=> res!86383 e!68716)))

(assert (=> b!104923 (= res!86383 (= (size!2223 (buf!2589 (_2!4572 lt!153501))) #b00000000000000000000000000000000))))

(declare-fun b!104924 () Bool)

(assert (=> b!104924 (= e!68716 (arrayBitRangesEq!0 (buf!2589 (_2!4572 lt!153501)) (buf!2589 (_2!4570 lt!152888)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2223 (buf!2589 (_2!4572 lt!153501))) (currentByte!5074 (_2!4572 lt!153501)) (currentBit!5069 (_2!4572 lt!153501)))))))

(assert (= (and d!32696 res!86381) b!104922))

(assert (= (and b!104922 res!86382) b!104923))

(assert (= (and b!104923 (not res!86383)) b!104924))

(declare-fun m!153793 () Bool)

(assert (=> b!104922 m!153793))

(assert (=> b!104922 m!152873))

(assert (=> b!104924 m!153793))

(assert (=> b!104924 m!153793))

(declare-fun m!153795 () Bool)

(assert (=> b!104924 m!153795))

(assert (=> b!104475 d!32696))

(assert (=> d!32344 d!32374))

(declare-fun d!32698 () Bool)

(assert (=> d!32698 (validate_offset_bits!1 ((_ sign_extend 32) (size!2223 (buf!2589 (_2!4570 lt!152888)))) ((_ sign_extend 32) (currentByte!5074 (_2!4570 lt!152884))) ((_ sign_extend 32) (currentBit!5069 (_2!4570 lt!152884))) lt!152889)))

(assert (=> d!32698 true))

(declare-fun _$6!232 () Unit!6390)

(assert (=> d!32698 (= (choose!9 (_2!4570 lt!152884) (buf!2589 (_2!4570 lt!152888)) lt!152889 (BitStream!3921 (buf!2589 (_2!4570 lt!152888)) (currentByte!5074 (_2!4570 lt!152884)) (currentBit!5069 (_2!4570 lt!152884)))) _$6!232)))

(declare-fun bs!8007 () Bool)

(assert (= bs!8007 d!32698))

(assert (=> bs!8007 m!152509))

(assert (=> d!32344 d!32698))

(declare-fun lt!154310 () tuple2!8638)

(declare-fun b!104925 () Bool)

(declare-fun e!68719 () Bool)

(declare-fun lt!154311 () (_ BitVec 64))

(assert (=> b!104925 (= e!68719 (= (= (bvand (bvlshr (_1!4574 lt!154310) lt!154311) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!4573 (readBitPure!0 (_1!4572 lt!152886)))))))

(assert (=> b!104925 (and (bvsge lt!154311 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!154311 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!154314 () (_ BitVec 32))

(assert (=> b!104925 (= lt!154311 ((_ sign_extend 32) (bvsub lt!154314 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!104925 (or (= (bvand lt!154314 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand lt!154314 #b10000000000000000000000000000000) (bvand (bvsub lt!154314 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!104925 (= lt!154314 (bvsub nBits!396 #b00000000000000000000000000000001))))

(assert (=> b!104925 (or (= (bvand nBits!396 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!104926 () Bool)

(declare-fun e!68718 () tuple2!8638)

(declare-fun lt!154309 () tuple2!8638)

(assert (=> b!104926 (= e!68718 (tuple2!8639 (_1!4574 lt!154309) (_2!4574 lt!154309)))))

(declare-fun lt!154308 () tuple2!8648)

(assert (=> b!104926 (= lt!154308 (readBit!0 (_1!4572 lt!152886)))))

(assert (=> b!104926 (= lt!154309 (readNLeastSignificantBitsLoop!0 (_2!4579 lt!154308) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!152905 (ite (_1!4579 lt!154308) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!104927 () Bool)

(assert (=> b!104927 (= e!68718 (tuple2!8639 lt!152905 (_1!4572 lt!152886)))))

(declare-fun d!32700 () Bool)

(declare-fun e!68717 () Bool)

(assert (=> d!32700 e!68717))

(declare-fun res!86384 () Bool)

(assert (=> d!32700 (=> (not res!86384) (not e!68717))))

(assert (=> d!32700 (= res!86384 (= (buf!2589 (_2!4574 lt!154310)) (buf!2589 (_1!4572 lt!152886))))))

(assert (=> d!32700 (= lt!154310 e!68718)))

(declare-fun c!6475 () Bool)

(assert (=> d!32700 (= c!6475 (= nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> d!32700 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!32700 (= (readNLeastSignificantBitsLoop!0 (_1!4572 lt!152886) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!152905) lt!154310)))

(declare-fun b!104928 () Bool)

(declare-fun res!86385 () Bool)

(assert (=> b!104928 (=> (not res!86385) (not e!68717))))

(declare-fun lt!154312 () (_ BitVec 64))

(declare-fun lt!154307 () (_ BitVec 64))

(assert (=> b!104928 (= res!86385 (= (bitIndex!0 (size!2223 (buf!2589 (_2!4574 lt!154310))) (currentByte!5074 (_2!4574 lt!154310)) (currentBit!5069 (_2!4574 lt!154310))) (bvadd lt!154307 lt!154312)))))

(assert (=> b!104928 (or (not (= (bvand lt!154307 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!154312 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!154307 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!154307 lt!154312) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!104928 (= lt!154312 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!104928 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!104928 (= lt!154307 (bitIndex!0 (size!2223 (buf!2589 (_1!4572 lt!152886))) (currentByte!5074 (_1!4572 lt!152886)) (currentBit!5069 (_1!4572 lt!152886))))))

(declare-fun b!104929 () Bool)

(declare-fun res!86387 () Bool)

(assert (=> b!104929 (=> (not res!86387) (not e!68717))))

(assert (=> b!104929 (= res!86387 (= (bvand (_1!4574 lt!154310) (onesLSBLong!0 nBits!396)) (_1!4574 lt!154310)))))

(declare-fun b!104930 () Bool)

(assert (=> b!104930 (= e!68717 e!68719)))

(declare-fun res!86388 () Bool)

(assert (=> b!104930 (=> res!86388 e!68719)))

(assert (=> b!104930 (= res!86388 (bvsge (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(declare-fun b!104931 () Bool)

(declare-fun res!86386 () Bool)

(assert (=> b!104931 (=> (not res!86386) (not e!68717))))

(declare-fun lt!154313 () (_ BitVec 64))

(declare-fun lt!154306 () (_ BitVec 64))

(assert (=> b!104931 (= res!86386 (= (bvlshr (_1!4574 lt!154310) lt!154306) (bvlshr lt!152905 lt!154313)))))

(assert (=> b!104931 (and (bvsge lt!154313 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!154313 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!104931 (= lt!154313 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!104931 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!104931 (and (bvsge lt!154306 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!154306 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!104931 (= lt!154306 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!104931 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (= (and d!32700 c!6475) b!104927))

(assert (= (and d!32700 (not c!6475)) b!104926))

(assert (= (and d!32700 res!86384) b!104928))

(assert (= (and b!104928 res!86385) b!104931))

(assert (= (and b!104931 res!86386) b!104929))

(assert (= (and b!104929 res!86387) b!104930))

(assert (= (and b!104930 (not res!86388)) b!104925))

(declare-fun m!153797 () Bool)

(assert (=> b!104925 m!153797))

(declare-fun m!153799 () Bool)

(assert (=> b!104926 m!153799))

(declare-fun m!153801 () Bool)

(assert (=> b!104926 m!153801))

(declare-fun m!153803 () Bool)

(assert (=> b!104928 m!153803))

(declare-fun m!153805 () Bool)

(assert (=> b!104928 m!153805))

(assert (=> b!104929 m!152463))

(assert (=> d!32274 d!32700))

(declare-fun d!32702 () Bool)

(declare-fun res!86389 () Bool)

(declare-fun e!68720 () Bool)

(assert (=> d!32702 (=> (not res!86389) (not e!68720))))

(assert (=> d!32702 (= res!86389 (= (size!2223 (buf!2589 thiss!1305)) (size!2223 (buf!2589 (_2!4570 lt!153697)))))))

(assert (=> d!32702 (= (isPrefixOf!0 thiss!1305 (_2!4570 lt!153697)) e!68720)))

(declare-fun b!104932 () Bool)

(declare-fun res!86390 () Bool)

(assert (=> b!104932 (=> (not res!86390) (not e!68720))))

(assert (=> b!104932 (= res!86390 (bvsle (bitIndex!0 (size!2223 (buf!2589 thiss!1305)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305)) (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!153697))) (currentByte!5074 (_2!4570 lt!153697)) (currentBit!5069 (_2!4570 lt!153697)))))))

(declare-fun b!104933 () Bool)

(declare-fun e!68721 () Bool)

(assert (=> b!104933 (= e!68720 e!68721)))

(declare-fun res!86391 () Bool)

(assert (=> b!104933 (=> res!86391 e!68721)))

(assert (=> b!104933 (= res!86391 (= (size!2223 (buf!2589 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!104934 () Bool)

(assert (=> b!104934 (= e!68721 (arrayBitRangesEq!0 (buf!2589 thiss!1305) (buf!2589 (_2!4570 lt!153697)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2223 (buf!2589 thiss!1305)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305))))))

(assert (= (and d!32702 res!86389) b!104932))

(assert (= (and b!104932 res!86390) b!104933))

(assert (= (and b!104933 (not res!86391)) b!104934))

(assert (=> b!104932 m!152521))

(assert (=> b!104932 m!152949))

(assert (=> b!104934 m!152521))

(assert (=> b!104934 m!152521))

(declare-fun m!153807 () Bool)

(assert (=> b!104934 m!153807))

(assert (=> b!104554 d!32702))

(declare-fun d!32704 () Bool)

(assert (=> d!32704 (= (remainingBits!0 ((_ sign_extend 32) (size!2223 (buf!2589 (_1!4573 lt!152881)))) ((_ sign_extend 32) (currentByte!5074 (_1!4573 lt!152881))) ((_ sign_extend 32) (currentBit!5069 (_1!4573 lt!152881)))) (bvsub (bvmul ((_ sign_extend 32) (size!2223 (buf!2589 (_1!4573 lt!152881)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5074 (_1!4573 lt!152881))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5069 (_1!4573 lt!152881))))))))

(assert (=> d!32434 d!32704))

(declare-fun d!32706 () Bool)

(assert (=> d!32706 (= (invariant!0 (currentBit!5069 (_1!4573 lt!152881)) (currentByte!5074 (_1!4573 lt!152881)) (size!2223 (buf!2589 (_1!4573 lt!152881)))) (and (bvsge (currentBit!5069 (_1!4573 lt!152881)) #b00000000000000000000000000000000) (bvslt (currentBit!5069 (_1!4573 lt!152881)) #b00000000000000000000000000001000) (bvsge (currentByte!5074 (_1!4573 lt!152881)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5074 (_1!4573 lt!152881)) (size!2223 (buf!2589 (_1!4573 lt!152881)))) (and (= (currentBit!5069 (_1!4573 lt!152881)) #b00000000000000000000000000000000) (= (currentByte!5074 (_1!4573 lt!152881)) (size!2223 (buf!2589 (_1!4573 lt!152881))))))))))

(assert (=> d!32434 d!32706))

(declare-fun d!32708 () Bool)

(declare-fun e!68722 () Bool)

(assert (=> d!32708 e!68722))

(declare-fun res!86393 () Bool)

(assert (=> d!32708 (=> (not res!86393) (not e!68722))))

(declare-fun lt!154316 () (_ BitVec 64))

(declare-fun lt!154315 () (_ BitVec 64))

(declare-fun lt!154320 () (_ BitVec 64))

(assert (=> d!32708 (= res!86393 (= lt!154316 (bvsub lt!154315 lt!154320)))))

(assert (=> d!32708 (or (= (bvand lt!154315 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!154320 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!154315 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!154315 lt!154320) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32708 (= lt!154320 (remainingBits!0 ((_ sign_extend 32) (size!2223 (buf!2589 (_2!4570 lt!153272)))) ((_ sign_extend 32) (currentByte!5074 (_2!4570 lt!153272))) ((_ sign_extend 32) (currentBit!5069 (_2!4570 lt!153272)))))))

(declare-fun lt!154317 () (_ BitVec 64))

(declare-fun lt!154319 () (_ BitVec 64))

(assert (=> d!32708 (= lt!154315 (bvmul lt!154317 lt!154319))))

(assert (=> d!32708 (or (= lt!154317 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!154319 (bvsdiv (bvmul lt!154317 lt!154319) lt!154317)))))

(assert (=> d!32708 (= lt!154319 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32708 (= lt!154317 ((_ sign_extend 32) (size!2223 (buf!2589 (_2!4570 lt!153272)))))))

(assert (=> d!32708 (= lt!154316 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5074 (_2!4570 lt!153272))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5069 (_2!4570 lt!153272)))))))

(assert (=> d!32708 (invariant!0 (currentBit!5069 (_2!4570 lt!153272)) (currentByte!5074 (_2!4570 lt!153272)) (size!2223 (buf!2589 (_2!4570 lt!153272))))))

(assert (=> d!32708 (= (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!153272))) (currentByte!5074 (_2!4570 lt!153272)) (currentBit!5069 (_2!4570 lt!153272))) lt!154316)))

(declare-fun b!104935 () Bool)

(declare-fun res!86392 () Bool)

(assert (=> b!104935 (=> (not res!86392) (not e!68722))))

(assert (=> b!104935 (= res!86392 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!154316))))

(declare-fun b!104936 () Bool)

(declare-fun lt!154318 () (_ BitVec 64))

(assert (=> b!104936 (= e!68722 (bvsle lt!154316 (bvmul lt!154318 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!104936 (or (= lt!154318 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!154318 #b0000000000000000000000000000000000000000000000000000000000001000) lt!154318)))))

(assert (=> b!104936 (= lt!154318 ((_ sign_extend 32) (size!2223 (buf!2589 (_2!4570 lt!153272)))))))

(assert (= (and d!32708 res!86393) b!104935))

(assert (= (and b!104935 res!86392) b!104936))

(declare-fun m!153809 () Bool)

(assert (=> d!32708 m!153809))

(declare-fun m!153811 () Bool)

(assert (=> d!32708 m!153811))

(assert (=> b!104418 d!32708))

(assert (=> b!104418 d!32376))

(declare-fun d!32710 () Bool)

(assert (=> d!32710 (= (remainingBits!0 ((_ sign_extend 32) (size!2223 (buf!2589 (_2!4570 lt!152888)))) ((_ sign_extend 32) (currentByte!5074 thiss!1305)) ((_ sign_extend 32) (currentBit!5069 thiss!1305))) (bvsub (bvmul ((_ sign_extend 32) (size!2223 (buf!2589 (_2!4570 lt!152888)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5074 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5069 thiss!1305)))))))

(assert (=> d!32326 d!32710))

(assert (=> b!104615 d!32378))

(assert (=> b!104615 d!32376))

(declare-fun d!32712 () Bool)

(declare-fun e!68723 () Bool)

(assert (=> d!32712 e!68723))

(declare-fun res!86395 () Bool)

(assert (=> d!32712 (=> (not res!86395) (not e!68723))))

(declare-fun lt!154321 () (_ BitVec 64))

(declare-fun lt!154326 () (_ BitVec 64))

(declare-fun lt!154322 () (_ BitVec 64))

(assert (=> d!32712 (= res!86395 (= lt!154322 (bvsub lt!154321 lt!154326)))))

(assert (=> d!32712 (or (= (bvand lt!154321 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!154326 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!154321 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!154321 lt!154326) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32712 (= lt!154326 (remainingBits!0 ((_ sign_extend 32) (size!2223 (buf!2589 (_2!4570 lt!153280)))) ((_ sign_extend 32) (currentByte!5074 (_2!4570 lt!153280))) ((_ sign_extend 32) (currentBit!5069 (_2!4570 lt!153280)))))))

(declare-fun lt!154323 () (_ BitVec 64))

(declare-fun lt!154325 () (_ BitVec 64))

(assert (=> d!32712 (= lt!154321 (bvmul lt!154323 lt!154325))))

(assert (=> d!32712 (or (= lt!154323 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!154325 (bvsdiv (bvmul lt!154323 lt!154325) lt!154323)))))

(assert (=> d!32712 (= lt!154325 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32712 (= lt!154323 ((_ sign_extend 32) (size!2223 (buf!2589 (_2!4570 lt!153280)))))))

(assert (=> d!32712 (= lt!154322 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5074 (_2!4570 lt!153280))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5069 (_2!4570 lt!153280)))))))

(assert (=> d!32712 (invariant!0 (currentBit!5069 (_2!4570 lt!153280)) (currentByte!5074 (_2!4570 lt!153280)) (size!2223 (buf!2589 (_2!4570 lt!153280))))))

(assert (=> d!32712 (= (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!153280))) (currentByte!5074 (_2!4570 lt!153280)) (currentBit!5069 (_2!4570 lt!153280))) lt!154322)))

(declare-fun b!104937 () Bool)

(declare-fun res!86394 () Bool)

(assert (=> b!104937 (=> (not res!86394) (not e!68723))))

(assert (=> b!104937 (= res!86394 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!154322))))

(declare-fun b!104938 () Bool)

(declare-fun lt!154324 () (_ BitVec 64))

(assert (=> b!104938 (= e!68723 (bvsle lt!154322 (bvmul lt!154324 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!104938 (or (= lt!154324 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!154324 #b0000000000000000000000000000000000000000000000000000000000001000) lt!154324)))))

(assert (=> b!104938 (= lt!154324 ((_ sign_extend 32) (size!2223 (buf!2589 (_2!4570 lt!153280)))))))

(assert (= (and d!32712 res!86395) b!104937))

(assert (= (and b!104937 res!86394) b!104938))

(declare-fun m!153813 () Bool)

(assert (=> d!32712 m!153813))

(declare-fun m!153815 () Bool)

(assert (=> d!32712 m!153815))

(assert (=> b!104416 d!32712))

(assert (=> b!104416 d!32376))

(declare-fun d!32714 () Bool)

(assert (=> d!32714 (= (remainingBits!0 ((_ sign_extend 32) (size!2223 (buf!2589 (_1!4573 lt!152892)))) ((_ sign_extend 32) (currentByte!5074 (_1!4573 lt!152892))) ((_ sign_extend 32) (currentBit!5069 (_1!4573 lt!152892)))) (bvsub (bvmul ((_ sign_extend 32) (size!2223 (buf!2589 (_1!4573 lt!152892)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5074 (_1!4573 lt!152892))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5069 (_1!4573 lt!152892))))))))

(assert (=> d!32316 d!32714))

(declare-fun d!32716 () Bool)

(assert (=> d!32716 (= (invariant!0 (currentBit!5069 (_1!4573 lt!152892)) (currentByte!5074 (_1!4573 lt!152892)) (size!2223 (buf!2589 (_1!4573 lt!152892)))) (and (bvsge (currentBit!5069 (_1!4573 lt!152892)) #b00000000000000000000000000000000) (bvslt (currentBit!5069 (_1!4573 lt!152892)) #b00000000000000000000000000001000) (bvsge (currentByte!5074 (_1!4573 lt!152892)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5074 (_1!4573 lt!152892)) (size!2223 (buf!2589 (_1!4573 lt!152892)))) (and (= (currentBit!5069 (_1!4573 lt!152892)) #b00000000000000000000000000000000) (= (currentByte!5074 (_1!4573 lt!152892)) (size!2223 (buf!2589 (_1!4573 lt!152892))))))))))

(assert (=> d!32316 d!32716))

(assert (=> b!104481 d!32376))

(declare-fun d!32718 () Bool)

(assert (=> d!32718 (arrayBitRangesEq!0 (buf!2589 (_2!4570 lt!152888)) (buf!2589 (_2!4570 lt!152884)) lt!153524 lt!153523)))

(declare-fun lt!154329 () Unit!6390)

(declare-fun choose!8 (array!4870 array!4870 (_ BitVec 64) (_ BitVec 64)) Unit!6390)

(assert (=> d!32718 (= lt!154329 (choose!8 (buf!2589 (_2!4570 lt!152884)) (buf!2589 (_2!4570 lt!152888)) lt!153524 lt!153523))))

(assert (=> d!32718 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!153524) (bvsle lt!153524 lt!153523))))

(assert (=> d!32718 (= (arrayBitRangesEqSymmetric!0 (buf!2589 (_2!4570 lt!152884)) (buf!2589 (_2!4570 lt!152888)) lt!153524 lt!153523) lt!154329)))

(declare-fun bs!8008 () Bool)

(assert (= bs!8008 d!32718))

(assert (=> bs!8008 m!152921))

(declare-fun m!153817 () Bool)

(assert (=> bs!8008 m!153817))

(assert (=> b!104481 d!32718))

(declare-fun b!104939 () Bool)

(declare-fun e!68729 () Bool)

(declare-fun lt!154330 () tuple4!70)

(assert (=> b!104939 (= e!68729 (arrayRangesEq!36 (buf!2589 (_2!4570 lt!152888)) (buf!2589 (_2!4570 lt!152884)) (_1!4581 lt!154330) (_2!4581 lt!154330)))))

(declare-fun c!6476 () Bool)

(declare-fun lt!154332 () (_ BitVec 32))

(declare-fun bm!1308 () Bool)

(declare-fun call!1311 () Bool)

(declare-fun lt!154331 () (_ BitVec 32))

(assert (=> bm!1308 (= call!1311 (byteRangesEq!0 (select (arr!2816 (buf!2589 (_2!4570 lt!152888))) (_3!256 lt!154330)) (select (arr!2816 (buf!2589 (_2!4570 lt!152884))) (_3!256 lt!154330)) lt!154332 (ite c!6476 lt!154331 #b00000000000000000000000000001000)))))

(declare-fun b!104940 () Bool)

(declare-fun e!68726 () Bool)

(declare-fun e!68724 () Bool)

(assert (=> b!104940 (= e!68726 e!68724)))

(assert (=> b!104940 (= c!6476 (= (_3!256 lt!154330) (_4!35 lt!154330)))))

(declare-fun e!68728 () Bool)

(declare-fun b!104941 () Bool)

(assert (=> b!104941 (= e!68728 (byteRangesEq!0 (select (arr!2816 (buf!2589 (_2!4570 lt!152888))) (_4!35 lt!154330)) (select (arr!2816 (buf!2589 (_2!4570 lt!152884))) (_4!35 lt!154330)) #b00000000000000000000000000000000 lt!154331))))

(declare-fun b!104942 () Bool)

(declare-fun e!68727 () Bool)

(assert (=> b!104942 (= e!68724 e!68727)))

(declare-fun res!86399 () Bool)

(assert (=> b!104942 (= res!86399 call!1311)))

(assert (=> b!104942 (=> (not res!86399) (not e!68727))))

(declare-fun b!104943 () Bool)

(declare-fun e!68725 () Bool)

(assert (=> b!104943 (= e!68725 e!68726)))

(declare-fun res!86398 () Bool)

(assert (=> b!104943 (=> (not res!86398) (not e!68726))))

(assert (=> b!104943 (= res!86398 e!68729)))

(declare-fun res!86396 () Bool)

(assert (=> b!104943 (=> res!86396 e!68729)))

(assert (=> b!104943 (= res!86396 (bvsge (_1!4581 lt!154330) (_2!4581 lt!154330)))))

(assert (=> b!104943 (= lt!154331 ((_ extract 31 0) (bvsrem lt!153523 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!104943 (= lt!154332 ((_ extract 31 0) (bvsrem lt!153524 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!104943 (= lt!154330 (arrayBitIndices!0 lt!153524 lt!153523))))

(declare-fun b!104944 () Bool)

(declare-fun res!86397 () Bool)

(assert (=> b!104944 (= res!86397 (= lt!154331 #b00000000000000000000000000000000))))

(assert (=> b!104944 (=> res!86397 e!68728)))

(assert (=> b!104944 (= e!68727 e!68728)))

(declare-fun d!32720 () Bool)

(declare-fun res!86400 () Bool)

(assert (=> d!32720 (=> res!86400 e!68725)))

(assert (=> d!32720 (= res!86400 (bvsge lt!153524 lt!153523))))

(assert (=> d!32720 (= (arrayBitRangesEq!0 (buf!2589 (_2!4570 lt!152888)) (buf!2589 (_2!4570 lt!152884)) lt!153524 lt!153523) e!68725)))

(declare-fun b!104945 () Bool)

(assert (=> b!104945 (= e!68724 call!1311)))

(assert (= (and d!32720 (not res!86400)) b!104943))

(assert (= (and b!104943 (not res!86396)) b!104939))

(assert (= (and b!104943 res!86398) b!104940))

(assert (= (and b!104940 c!6476) b!104945))

(assert (= (and b!104940 (not c!6476)) b!104942))

(assert (= (and b!104942 res!86399) b!104944))

(assert (= (and b!104944 (not res!86397)) b!104941))

(assert (= (or b!104945 b!104942) bm!1308))

(declare-fun m!153819 () Bool)

(assert (=> b!104939 m!153819))

(declare-fun m!153821 () Bool)

(assert (=> bm!1308 m!153821))

(declare-fun m!153823 () Bool)

(assert (=> bm!1308 m!153823))

(assert (=> bm!1308 m!153821))

(assert (=> bm!1308 m!153823))

(declare-fun m!153825 () Bool)

(assert (=> bm!1308 m!153825))

(declare-fun m!153827 () Bool)

(assert (=> b!104941 m!153827))

(declare-fun m!153829 () Bool)

(assert (=> b!104941 m!153829))

(assert (=> b!104941 m!153827))

(assert (=> b!104941 m!153829))

(declare-fun m!153831 () Bool)

(assert (=> b!104941 m!153831))

(declare-fun m!153833 () Bool)

(assert (=> b!104943 m!153833))

(assert (=> b!104481 d!32720))

(assert (=> b!104586 d!32402))

(assert (=> b!104571 d!32378))

(declare-fun d!32722 () Bool)

(declare-fun e!68730 () Bool)

(assert (=> d!32722 e!68730))

(declare-fun res!86402 () Bool)

(assert (=> d!32722 (=> (not res!86402) (not e!68730))))

(declare-fun lt!154333 () (_ BitVec 64))

(declare-fun lt!154338 () (_ BitVec 64))

(declare-fun lt!154334 () (_ BitVec 64))

(assert (=> d!32722 (= res!86402 (= lt!154334 (bvsub lt!154333 lt!154338)))))

(assert (=> d!32722 (or (= (bvand lt!154333 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!154338 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!154333 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!154333 lt!154338) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32722 (= lt!154338 (remainingBits!0 ((_ sign_extend 32) (size!2223 (buf!2589 (_2!4570 lt!152888)))) ((_ sign_extend 32) (currentByte!5074 (_2!4570 lt!152888))) ((_ sign_extend 32) (currentBit!5069 (_2!4570 lt!152888)))))))

(declare-fun lt!154335 () (_ BitVec 64))

(declare-fun lt!154337 () (_ BitVec 64))

(assert (=> d!32722 (= lt!154333 (bvmul lt!154335 lt!154337))))

(assert (=> d!32722 (or (= lt!154335 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!154337 (bvsdiv (bvmul lt!154335 lt!154337) lt!154335)))))

(assert (=> d!32722 (= lt!154337 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32722 (= lt!154335 ((_ sign_extend 32) (size!2223 (buf!2589 (_2!4570 lt!152888)))))))

(assert (=> d!32722 (= lt!154334 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5074 (_2!4570 lt!152888))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5069 (_2!4570 lt!152888)))))))

(assert (=> d!32722 (invariant!0 (currentBit!5069 (_2!4570 lt!152888)) (currentByte!5074 (_2!4570 lt!152888)) (size!2223 (buf!2589 (_2!4570 lt!152888))))))

(assert (=> d!32722 (= (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!152888))) (currentByte!5074 (_2!4570 lt!152888)) (currentBit!5069 (_2!4570 lt!152888))) lt!154334)))

(declare-fun b!104946 () Bool)

(declare-fun res!86401 () Bool)

(assert (=> b!104946 (=> (not res!86401) (not e!68730))))

(assert (=> b!104946 (= res!86401 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!154334))))

(declare-fun b!104947 () Bool)

(declare-fun lt!154336 () (_ BitVec 64))

(assert (=> b!104947 (= e!68730 (bvsle lt!154334 (bvmul lt!154336 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!104947 (or (= lt!154336 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!154336 #b0000000000000000000000000000000000000000000000000000000000001000) lt!154336)))))

(assert (=> b!104947 (= lt!154336 ((_ sign_extend 32) (size!2223 (buf!2589 (_2!4570 lt!152888)))))))

(assert (= (and d!32722 res!86402) b!104946))

(assert (= (and b!104946 res!86401) b!104947))

(declare-fun m!153835 () Bool)

(assert (=> d!32722 m!153835))

(assert (=> d!32722 m!152519))

(assert (=> b!104571 d!32722))

(declare-fun d!32724 () Bool)

(declare-fun e!68737 () Bool)

(assert (=> d!32724 e!68737))

(declare-fun res!86405 () Bool)

(assert (=> d!32724 (=> (not res!86405) (not e!68737))))

(declare-fun increaseBitIndex!0 (BitStream!3920) tuple2!8630)

(assert (=> d!32724 (= res!86405 (= (buf!2589 (_2!4570 (increaseBitIndex!0 (BitStream!3921 (buf!2589 (_2!4570 lt!152888)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305))))) (buf!2589 (BitStream!3921 (buf!2589 (_2!4570 lt!152888)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305)))))))

(declare-fun lt!154355 () Bool)

(assert (=> d!32724 (= lt!154355 (not (= (bvand ((_ sign_extend 24) (select (arr!2816 (buf!2589 (BitStream!3921 (buf!2589 (_2!4570 lt!152888)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305)))) (currentByte!5074 (BitStream!3921 (buf!2589 (_2!4570 lt!152888)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5069 (BitStream!3921 (buf!2589 (_2!4570 lt!152888)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!154356 () tuple2!8648)

(assert (=> d!32724 (= lt!154356 (tuple2!8649 (not (= (bvand ((_ sign_extend 24) (select (arr!2816 (buf!2589 (BitStream!3921 (buf!2589 (_2!4570 lt!152888)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305)))) (currentByte!5074 (BitStream!3921 (buf!2589 (_2!4570 lt!152888)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5069 (BitStream!3921 (buf!2589 (_2!4570 lt!152888)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305)))))) #b00000000000000000000000000000000)) (_2!4570 (increaseBitIndex!0 (BitStream!3921 (buf!2589 (_2!4570 lt!152888)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305))))))))

(assert (=> d!32724 (validate_offset_bit!0 ((_ sign_extend 32) (size!2223 (buf!2589 (BitStream!3921 (buf!2589 (_2!4570 lt!152888)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305))))) ((_ sign_extend 32) (currentByte!5074 (BitStream!3921 (buf!2589 (_2!4570 lt!152888)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305)))) ((_ sign_extend 32) (currentBit!5069 (BitStream!3921 (buf!2589 (_2!4570 lt!152888)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305)))))))

(assert (=> d!32724 (= (readBit!0 (BitStream!3921 (buf!2589 (_2!4570 lt!152888)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305))) lt!154356)))

(declare-fun lt!154353 () (_ BitVec 64))

(declare-fun lt!154357 () (_ BitVec 64))

(declare-fun b!104950 () Bool)

(assert (=> b!104950 (= e!68737 (= (bitIndex!0 (size!2223 (buf!2589 (_2!4570 (increaseBitIndex!0 (BitStream!3921 (buf!2589 (_2!4570 lt!152888)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305)))))) (currentByte!5074 (_2!4570 (increaseBitIndex!0 (BitStream!3921 (buf!2589 (_2!4570 lt!152888)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305))))) (currentBit!5069 (_2!4570 (increaseBitIndex!0 (BitStream!3921 (buf!2589 (_2!4570 lt!152888)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305)))))) (bvadd lt!154353 lt!154357)))))

(assert (=> b!104950 (or (not (= (bvand lt!154353 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!154357 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!154353 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!154353 lt!154357) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!104950 (= lt!154357 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!104950 (= lt!154353 (bitIndex!0 (size!2223 (buf!2589 (BitStream!3921 (buf!2589 (_2!4570 lt!152888)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305)))) (currentByte!5074 (BitStream!3921 (buf!2589 (_2!4570 lt!152888)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305))) (currentBit!5069 (BitStream!3921 (buf!2589 (_2!4570 lt!152888)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305)))))))

(declare-fun lt!154359 () Bool)

(assert (=> b!104950 (= lt!154359 (not (= (bvand ((_ sign_extend 24) (select (arr!2816 (buf!2589 (BitStream!3921 (buf!2589 (_2!4570 lt!152888)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305)))) (currentByte!5074 (BitStream!3921 (buf!2589 (_2!4570 lt!152888)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5069 (BitStream!3921 (buf!2589 (_2!4570 lt!152888)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!154358 () Bool)

(assert (=> b!104950 (= lt!154358 (not (= (bvand ((_ sign_extend 24) (select (arr!2816 (buf!2589 (BitStream!3921 (buf!2589 (_2!4570 lt!152888)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305)))) (currentByte!5074 (BitStream!3921 (buf!2589 (_2!4570 lt!152888)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5069 (BitStream!3921 (buf!2589 (_2!4570 lt!152888)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!154354 () Bool)

(assert (=> b!104950 (= lt!154354 (not (= (bvand ((_ sign_extend 24) (select (arr!2816 (buf!2589 (BitStream!3921 (buf!2589 (_2!4570 lt!152888)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305)))) (currentByte!5074 (BitStream!3921 (buf!2589 (_2!4570 lt!152888)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5069 (BitStream!3921 (buf!2589 (_2!4570 lt!152888)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!32724 res!86405) b!104950))

(declare-fun m!153837 () Bool)

(assert (=> d!32724 m!153837))

(declare-fun m!153839 () Bool)

(assert (=> d!32724 m!153839))

(declare-fun m!153841 () Bool)

(assert (=> d!32724 m!153841))

(declare-fun m!153843 () Bool)

(assert (=> d!32724 m!153843))

(assert (=> b!104950 m!153841))

(declare-fun m!153845 () Bool)

(assert (=> b!104950 m!153845))

(assert (=> b!104950 m!153839))

(assert (=> b!104950 m!153837))

(declare-fun m!153847 () Bool)

(assert (=> b!104950 m!153847))

(assert (=> d!32336 d!32724))

(assert (=> d!32350 d!32326))

(declare-fun d!32726 () Bool)

(assert (=> d!32726 (validate_offset_bits!1 ((_ sign_extend 32) (size!2223 (buf!2589 (_2!4570 lt!152888)))) ((_ sign_extend 32) (currentByte!5074 thiss!1305)) ((_ sign_extend 32) (currentBit!5069 thiss!1305)) lt!152894)))

(assert (=> d!32726 true))

(declare-fun _$6!233 () Unit!6390)

(assert (=> d!32726 (= (choose!9 thiss!1305 (buf!2589 (_2!4570 lt!152888)) lt!152894 (BitStream!3921 (buf!2589 (_2!4570 lt!152888)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305))) _$6!233)))

(declare-fun bs!8009 () Bool)

(assert (= bs!8009 d!32726))

(assert (=> bs!8009 m!152483))

(assert (=> d!32350 d!32726))

(declare-fun d!32728 () Bool)

(assert (=> d!32728 (= (remainingBits!0 ((_ sign_extend 32) (size!2223 (buf!2589 thiss!1305))) ((_ sign_extend 32) (currentByte!5074 thiss!1305)) ((_ sign_extend 32) (currentBit!5069 thiss!1305))) (bvsub (bvmul ((_ sign_extend 32) (size!2223 (buf!2589 thiss!1305))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5074 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5069 thiss!1305)))))))

(assert (=> d!32270 d!32728))

(declare-fun d!32730 () Bool)

(declare-fun e!68740 () Bool)

(assert (=> d!32730 e!68740))

(declare-fun res!86408 () Bool)

(assert (=> d!32730 (=> (not res!86408) (not e!68740))))

(declare-fun lt!154367 () tuple2!8636)

(declare-fun lt!154366 () tuple2!8636)

(assert (=> d!32730 (= res!86408 (= (bitIndex!0 (size!2223 (buf!2589 (_1!4573 lt!154367))) (currentByte!5074 (_1!4573 lt!154367)) (currentBit!5069 (_1!4573 lt!154367))) (bitIndex!0 (size!2223 (buf!2589 (_1!4573 lt!154366))) (currentByte!5074 (_1!4573 lt!154366)) (currentBit!5069 (_1!4573 lt!154366)))))))

(declare-fun lt!154368 () BitStream!3920)

(assert (=> d!32730 (= lt!154366 (readBitPure!0 lt!154368))))

(assert (=> d!32730 (= lt!154367 (readBitPure!0 lt!152897))))

(assert (=> d!32730 (= lt!154368 (BitStream!3921 (buf!2589 (_2!4570 lt!152888)) (currentByte!5074 lt!152897) (currentBit!5069 lt!152897)))))

(assert (=> d!32730 (invariant!0 (currentBit!5069 lt!152897) (currentByte!5074 lt!152897) (size!2223 (buf!2589 (_2!4570 lt!152888))))))

(assert (=> d!32730 true))

(declare-fun _$9!42 () Unit!6390)

(assert (=> d!32730 (= (choose!50 lt!152897 (_2!4570 lt!152888) lt!153587 lt!153585 (tuple2!8637 (_1!4573 lt!153585) (_2!4573 lt!153585)) (_1!4573 lt!153585) (_2!4573 lt!153585) lt!153586 (tuple2!8637 (_1!4573 lt!153586) (_2!4573 lt!153586)) (_1!4573 lt!153586) (_2!4573 lt!153586)) _$9!42)))

(declare-fun b!104953 () Bool)

(assert (=> b!104953 (= e!68740 (= (_2!4573 lt!154367) (_2!4573 lt!154366)))))

(assert (= (and d!32730 res!86408) b!104953))

(declare-fun m!153849 () Bool)

(assert (=> d!32730 m!153849))

(declare-fun m!153851 () Bool)

(assert (=> d!32730 m!153851))

(assert (=> d!32730 m!152937))

(declare-fun m!153853 () Bool)

(assert (=> d!32730 m!153853))

(assert (=> d!32730 m!152507))

(assert (=> d!32328 d!32730))

(declare-fun d!32732 () Bool)

(declare-fun lt!154369 () tuple2!8648)

(assert (=> d!32732 (= lt!154369 (readBit!0 lt!153587))))

(assert (=> d!32732 (= (readBitPure!0 lt!153587) (tuple2!8637 (_2!4579 lt!154369) (_1!4579 lt!154369)))))

(declare-fun bs!8010 () Bool)

(assert (= bs!8010 d!32732))

(declare-fun m!153855 () Bool)

(assert (=> bs!8010 m!153855))

(assert (=> d!32328 d!32732))

(declare-fun d!32734 () Bool)

(declare-fun e!68741 () Bool)

(assert (=> d!32734 e!68741))

(declare-fun res!86410 () Bool)

(assert (=> d!32734 (=> (not res!86410) (not e!68741))))

(declare-fun lt!154370 () (_ BitVec 64))

(declare-fun lt!154371 () (_ BitVec 64))

(declare-fun lt!154375 () (_ BitVec 64))

(assert (=> d!32734 (= res!86410 (= lt!154371 (bvsub lt!154370 lt!154375)))))

(assert (=> d!32734 (or (= (bvand lt!154370 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!154375 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!154370 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!154370 lt!154375) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32734 (= lt!154375 (remainingBits!0 ((_ sign_extend 32) (size!2223 (buf!2589 (_1!4573 lt!153586)))) ((_ sign_extend 32) (currentByte!5074 (_1!4573 lt!153586))) ((_ sign_extend 32) (currentBit!5069 (_1!4573 lt!153586)))))))

(declare-fun lt!154372 () (_ BitVec 64))

(declare-fun lt!154374 () (_ BitVec 64))

(assert (=> d!32734 (= lt!154370 (bvmul lt!154372 lt!154374))))

(assert (=> d!32734 (or (= lt!154372 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!154374 (bvsdiv (bvmul lt!154372 lt!154374) lt!154372)))))

(assert (=> d!32734 (= lt!154374 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32734 (= lt!154372 ((_ sign_extend 32) (size!2223 (buf!2589 (_1!4573 lt!153586)))))))

(assert (=> d!32734 (= lt!154371 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5074 (_1!4573 lt!153586))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5069 (_1!4573 lt!153586)))))))

(assert (=> d!32734 (invariant!0 (currentBit!5069 (_1!4573 lt!153586)) (currentByte!5074 (_1!4573 lt!153586)) (size!2223 (buf!2589 (_1!4573 lt!153586))))))

(assert (=> d!32734 (= (bitIndex!0 (size!2223 (buf!2589 (_1!4573 lt!153586))) (currentByte!5074 (_1!4573 lt!153586)) (currentBit!5069 (_1!4573 lt!153586))) lt!154371)))

(declare-fun b!104954 () Bool)

(declare-fun res!86409 () Bool)

(assert (=> b!104954 (=> (not res!86409) (not e!68741))))

(assert (=> b!104954 (= res!86409 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!154371))))

(declare-fun b!104955 () Bool)

(declare-fun lt!154373 () (_ BitVec 64))

(assert (=> b!104955 (= e!68741 (bvsle lt!154371 (bvmul lt!154373 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!104955 (or (= lt!154373 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!154373 #b0000000000000000000000000000000000000000000000000000000000001000) lt!154373)))))

(assert (=> b!104955 (= lt!154373 ((_ sign_extend 32) (size!2223 (buf!2589 (_1!4573 lt!153586)))))))

(assert (= (and d!32734 res!86410) b!104954))

(assert (= (and b!104954 res!86409) b!104955))

(declare-fun m!153857 () Bool)

(assert (=> d!32734 m!153857))

(declare-fun m!153859 () Bool)

(assert (=> d!32734 m!153859))

(assert (=> d!32328 d!32734))

(declare-fun d!32736 () Bool)

(assert (=> d!32736 (= (invariant!0 (currentBit!5069 lt!152897) (currentByte!5074 lt!152897) (size!2223 (buf!2589 (_2!4570 lt!152888)))) (and (bvsge (currentBit!5069 lt!152897) #b00000000000000000000000000000000) (bvslt (currentBit!5069 lt!152897) #b00000000000000000000000000001000) (bvsge (currentByte!5074 lt!152897) #b00000000000000000000000000000000) (or (bvslt (currentByte!5074 lt!152897) (size!2223 (buf!2589 (_2!4570 lt!152888)))) (and (= (currentBit!5069 lt!152897) #b00000000000000000000000000000000) (= (currentByte!5074 lt!152897) (size!2223 (buf!2589 (_2!4570 lt!152888))))))))))

(assert (=> d!32328 d!32736))

(assert (=> d!32328 d!32340))

(declare-fun d!32738 () Bool)

(declare-fun e!68742 () Bool)

(assert (=> d!32738 e!68742))

(declare-fun res!86412 () Bool)

(assert (=> d!32738 (=> (not res!86412) (not e!68742))))

(declare-fun lt!154376 () (_ BitVec 64))

(declare-fun lt!154381 () (_ BitVec 64))

(declare-fun lt!154377 () (_ BitVec 64))

(assert (=> d!32738 (= res!86412 (= lt!154377 (bvsub lt!154376 lt!154381)))))

(assert (=> d!32738 (or (= (bvand lt!154376 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!154381 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!154376 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!154376 lt!154381) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32738 (= lt!154381 (remainingBits!0 ((_ sign_extend 32) (size!2223 (buf!2589 (_1!4573 lt!153585)))) ((_ sign_extend 32) (currentByte!5074 (_1!4573 lt!153585))) ((_ sign_extend 32) (currentBit!5069 (_1!4573 lt!153585)))))))

(declare-fun lt!154378 () (_ BitVec 64))

(declare-fun lt!154380 () (_ BitVec 64))

(assert (=> d!32738 (= lt!154376 (bvmul lt!154378 lt!154380))))

(assert (=> d!32738 (or (= lt!154378 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!154380 (bvsdiv (bvmul lt!154378 lt!154380) lt!154378)))))

(assert (=> d!32738 (= lt!154380 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32738 (= lt!154378 ((_ sign_extend 32) (size!2223 (buf!2589 (_1!4573 lt!153585)))))))

(assert (=> d!32738 (= lt!154377 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5074 (_1!4573 lt!153585))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5069 (_1!4573 lt!153585)))))))

(assert (=> d!32738 (invariant!0 (currentBit!5069 (_1!4573 lt!153585)) (currentByte!5074 (_1!4573 lt!153585)) (size!2223 (buf!2589 (_1!4573 lt!153585))))))

(assert (=> d!32738 (= (bitIndex!0 (size!2223 (buf!2589 (_1!4573 lt!153585))) (currentByte!5074 (_1!4573 lt!153585)) (currentBit!5069 (_1!4573 lt!153585))) lt!154377)))

(declare-fun b!104956 () Bool)

(declare-fun res!86411 () Bool)

(assert (=> b!104956 (=> (not res!86411) (not e!68742))))

(assert (=> b!104956 (= res!86411 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!154377))))

(declare-fun b!104957 () Bool)

(declare-fun lt!154379 () (_ BitVec 64))

(assert (=> b!104957 (= e!68742 (bvsle lt!154377 (bvmul lt!154379 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!104957 (or (= lt!154379 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!154379 #b0000000000000000000000000000000000000000000000000000000000001000) lt!154379)))))

(assert (=> b!104957 (= lt!154379 ((_ sign_extend 32) (size!2223 (buf!2589 (_1!4573 lt!153585)))))))

(assert (= (and d!32738 res!86412) b!104956))

(assert (= (and b!104956 res!86411) b!104957))

(declare-fun m!153861 () Bool)

(assert (=> d!32738 m!153861))

(declare-fun m!153863 () Bool)

(assert (=> d!32738 m!153863))

(assert (=> d!32328 d!32738))

(declare-fun d!32740 () Bool)

(declare-fun res!86413 () Bool)

(declare-fun e!68743 () Bool)

(assert (=> d!32740 (=> (not res!86413) (not e!68743))))

(assert (=> d!32740 (= res!86413 (= (size!2223 (buf!2589 (_1!4572 lt!153501))) (size!2223 (buf!2589 thiss!1305))))))

(assert (=> d!32740 (= (isPrefixOf!0 (_1!4572 lt!153501) thiss!1305) e!68743)))

(declare-fun b!104958 () Bool)

(declare-fun res!86414 () Bool)

(assert (=> b!104958 (=> (not res!86414) (not e!68743))))

(assert (=> b!104958 (= res!86414 (bvsle (bitIndex!0 (size!2223 (buf!2589 (_1!4572 lt!153501))) (currentByte!5074 (_1!4572 lt!153501)) (currentBit!5069 (_1!4572 lt!153501))) (bitIndex!0 (size!2223 (buf!2589 thiss!1305)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305))))))

(declare-fun b!104959 () Bool)

(declare-fun e!68744 () Bool)

(assert (=> b!104959 (= e!68743 e!68744)))

(declare-fun res!86415 () Bool)

(assert (=> b!104959 (=> res!86415 e!68744)))

(assert (=> b!104959 (= res!86415 (= (size!2223 (buf!2589 (_1!4572 lt!153501))) #b00000000000000000000000000000000))))

(declare-fun b!104960 () Bool)

(assert (=> b!104960 (= e!68744 (arrayBitRangesEq!0 (buf!2589 (_1!4572 lt!153501)) (buf!2589 thiss!1305) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2223 (buf!2589 (_1!4572 lt!153501))) (currentByte!5074 (_1!4572 lt!153501)) (currentBit!5069 (_1!4572 lt!153501)))))))

(assert (= (and d!32740 res!86413) b!104958))

(assert (= (and b!104958 res!86414) b!104959))

(assert (= (and b!104959 (not res!86415)) b!104960))

(declare-fun m!153865 () Bool)

(assert (=> b!104958 m!153865))

(assert (=> b!104958 m!152521))

(assert (=> b!104960 m!153865))

(assert (=> b!104960 m!153865))

(declare-fun m!153867 () Bool)

(assert (=> b!104960 m!153867))

(assert (=> b!104478 d!32740))

(assert (=> b!104476 d!32378))

(declare-fun d!32742 () Bool)

(assert (=> d!32742 (arrayBitRangesEq!0 (buf!2589 (_2!4570 lt!152888)) (buf!2589 thiss!1305) lt!153504 lt!153503)))

(declare-fun lt!154382 () Unit!6390)

(assert (=> d!32742 (= lt!154382 (choose!8 (buf!2589 thiss!1305) (buf!2589 (_2!4570 lt!152888)) lt!153504 lt!153503))))

(assert (=> d!32742 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!153504) (bvsle lt!153504 lt!153503))))

(assert (=> d!32742 (= (arrayBitRangesEqSymmetric!0 (buf!2589 thiss!1305) (buf!2589 (_2!4570 lt!152888)) lt!153504 lt!153503) lt!154382)))

(declare-fun bs!8011 () Bool)

(assert (= bs!8011 d!32742))

(assert (=> bs!8011 m!152867))

(declare-fun m!153869 () Bool)

(assert (=> bs!8011 m!153869))

(assert (=> b!104476 d!32742))

(declare-fun b!104961 () Bool)

(declare-fun lt!154383 () tuple4!70)

(declare-fun e!68750 () Bool)

(assert (=> b!104961 (= e!68750 (arrayRangesEq!36 (buf!2589 (_2!4570 lt!152888)) (buf!2589 thiss!1305) (_1!4581 lt!154383) (_2!4581 lt!154383)))))

(declare-fun lt!154385 () (_ BitVec 32))

(declare-fun lt!154384 () (_ BitVec 32))

(declare-fun c!6477 () Bool)

(declare-fun bm!1309 () Bool)

(declare-fun call!1312 () Bool)

(assert (=> bm!1309 (= call!1312 (byteRangesEq!0 (select (arr!2816 (buf!2589 (_2!4570 lt!152888))) (_3!256 lt!154383)) (select (arr!2816 (buf!2589 thiss!1305)) (_3!256 lt!154383)) lt!154385 (ite c!6477 lt!154384 #b00000000000000000000000000001000)))))

(declare-fun b!104962 () Bool)

(declare-fun e!68747 () Bool)

(declare-fun e!68745 () Bool)

(assert (=> b!104962 (= e!68747 e!68745)))

(assert (=> b!104962 (= c!6477 (= (_3!256 lt!154383) (_4!35 lt!154383)))))

(declare-fun e!68749 () Bool)

(declare-fun b!104963 () Bool)

(assert (=> b!104963 (= e!68749 (byteRangesEq!0 (select (arr!2816 (buf!2589 (_2!4570 lt!152888))) (_4!35 lt!154383)) (select (arr!2816 (buf!2589 thiss!1305)) (_4!35 lt!154383)) #b00000000000000000000000000000000 lt!154384))))

(declare-fun b!104964 () Bool)

(declare-fun e!68748 () Bool)

(assert (=> b!104964 (= e!68745 e!68748)))

(declare-fun res!86419 () Bool)

(assert (=> b!104964 (= res!86419 call!1312)))

(assert (=> b!104964 (=> (not res!86419) (not e!68748))))

(declare-fun b!104965 () Bool)

(declare-fun e!68746 () Bool)

(assert (=> b!104965 (= e!68746 e!68747)))

(declare-fun res!86418 () Bool)

(assert (=> b!104965 (=> (not res!86418) (not e!68747))))

(assert (=> b!104965 (= res!86418 e!68750)))

(declare-fun res!86416 () Bool)

(assert (=> b!104965 (=> res!86416 e!68750)))

(assert (=> b!104965 (= res!86416 (bvsge (_1!4581 lt!154383) (_2!4581 lt!154383)))))

(assert (=> b!104965 (= lt!154384 ((_ extract 31 0) (bvsrem lt!153503 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!104965 (= lt!154385 ((_ extract 31 0) (bvsrem lt!153504 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!104965 (= lt!154383 (arrayBitIndices!0 lt!153504 lt!153503))))

(declare-fun b!104966 () Bool)

(declare-fun res!86417 () Bool)

(assert (=> b!104966 (= res!86417 (= lt!154384 #b00000000000000000000000000000000))))

(assert (=> b!104966 (=> res!86417 e!68749)))

(assert (=> b!104966 (= e!68748 e!68749)))

(declare-fun d!32744 () Bool)

(declare-fun res!86420 () Bool)

(assert (=> d!32744 (=> res!86420 e!68746)))

(assert (=> d!32744 (= res!86420 (bvsge lt!153504 lt!153503))))

(assert (=> d!32744 (= (arrayBitRangesEq!0 (buf!2589 (_2!4570 lt!152888)) (buf!2589 thiss!1305) lt!153504 lt!153503) e!68746)))

(declare-fun b!104967 () Bool)

(assert (=> b!104967 (= e!68745 call!1312)))

(assert (= (and d!32744 (not res!86420)) b!104965))

(assert (= (and b!104965 (not res!86416)) b!104961))

(assert (= (and b!104965 res!86418) b!104962))

(assert (= (and b!104962 c!6477) b!104967))

(assert (= (and b!104962 (not c!6477)) b!104964))

(assert (= (and b!104964 res!86419) b!104966))

(assert (= (and b!104966 (not res!86417)) b!104963))

(assert (= (or b!104967 b!104964) bm!1309))

(declare-fun m!153871 () Bool)

(assert (=> b!104961 m!153871))

(declare-fun m!153873 () Bool)

(assert (=> bm!1309 m!153873))

(declare-fun m!153875 () Bool)

(assert (=> bm!1309 m!153875))

(assert (=> bm!1309 m!153873))

(assert (=> bm!1309 m!153875))

(declare-fun m!153877 () Bool)

(assert (=> bm!1309 m!153877))

(declare-fun m!153879 () Bool)

(assert (=> b!104963 m!153879))

(declare-fun m!153881 () Bool)

(assert (=> b!104963 m!153881))

(assert (=> b!104963 m!153879))

(assert (=> b!104963 m!153881))

(declare-fun m!153883 () Bool)

(assert (=> b!104963 m!153883))

(declare-fun m!153885 () Bool)

(assert (=> b!104965 m!153885))

(assert (=> b!104476 d!32744))

(declare-fun d!32746 () Bool)

(assert (=> d!32746 (isPrefixOf!0 lt!153500 lt!153500)))

(declare-fun lt!154388 () Unit!6390)

(declare-fun choose!11 (BitStream!3920) Unit!6390)

(assert (=> d!32746 (= lt!154388 (choose!11 lt!153500))))

(assert (=> d!32746 (= (lemmaIsPrefixRefl!0 lt!153500) lt!154388)))

(declare-fun bs!8013 () Bool)

(assert (= bs!8013 d!32746))

(assert (=> bs!8013 m!152839))

(declare-fun m!153887 () Bool)

(assert (=> bs!8013 m!153887))

(assert (=> d!32320 d!32746))

(declare-fun d!32748 () Bool)

(declare-fun res!86421 () Bool)

(declare-fun e!68751 () Bool)

(assert (=> d!32748 (=> (not res!86421) (not e!68751))))

(assert (=> d!32748 (= res!86421 (= (size!2223 (buf!2589 lt!153500)) (size!2223 (buf!2589 (_2!4570 lt!152888)))))))

(assert (=> d!32748 (= (isPrefixOf!0 lt!153500 (_2!4570 lt!152888)) e!68751)))

(declare-fun b!104968 () Bool)

(declare-fun res!86422 () Bool)

(assert (=> b!104968 (=> (not res!86422) (not e!68751))))

(assert (=> b!104968 (= res!86422 (bvsle (bitIndex!0 (size!2223 (buf!2589 lt!153500)) (currentByte!5074 lt!153500) (currentBit!5069 lt!153500)) (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!152888))) (currentByte!5074 (_2!4570 lt!152888)) (currentBit!5069 (_2!4570 lt!152888)))))))

(declare-fun b!104969 () Bool)

(declare-fun e!68752 () Bool)

(assert (=> b!104969 (= e!68751 e!68752)))

(declare-fun res!86423 () Bool)

(assert (=> b!104969 (=> res!86423 e!68752)))

(assert (=> b!104969 (= res!86423 (= (size!2223 (buf!2589 lt!153500)) #b00000000000000000000000000000000))))

(declare-fun b!104970 () Bool)

(assert (=> b!104970 (= e!68752 (arrayBitRangesEq!0 (buf!2589 lt!153500) (buf!2589 (_2!4570 lt!152888)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2223 (buf!2589 lt!153500)) (currentByte!5074 lt!153500) (currentBit!5069 lt!153500))))))

(assert (= (and d!32748 res!86421) b!104968))

(assert (= (and b!104968 res!86422) b!104969))

(assert (= (and b!104969 (not res!86423)) b!104970))

(declare-fun m!153889 () Bool)

(assert (=> b!104968 m!153889))

(assert (=> b!104968 m!152873))

(assert (=> b!104970 m!153889))

(assert (=> b!104970 m!153889))

(declare-fun m!153891 () Bool)

(assert (=> b!104970 m!153891))

(assert (=> d!32320 d!32748))

(declare-fun d!32750 () Bool)

(declare-fun res!86424 () Bool)

(declare-fun e!68753 () Bool)

(assert (=> d!32750 (=> (not res!86424) (not e!68753))))

(assert (=> d!32750 (= res!86424 (= (size!2223 (buf!2589 lt!153500)) (size!2223 (buf!2589 lt!153500))))))

(assert (=> d!32750 (= (isPrefixOf!0 lt!153500 lt!153500) e!68753)))

(declare-fun b!104971 () Bool)

(declare-fun res!86425 () Bool)

(assert (=> b!104971 (=> (not res!86425) (not e!68753))))

(assert (=> b!104971 (= res!86425 (bvsle (bitIndex!0 (size!2223 (buf!2589 lt!153500)) (currentByte!5074 lt!153500) (currentBit!5069 lt!153500)) (bitIndex!0 (size!2223 (buf!2589 lt!153500)) (currentByte!5074 lt!153500) (currentBit!5069 lt!153500))))))

(declare-fun b!104972 () Bool)

(declare-fun e!68754 () Bool)

(assert (=> b!104972 (= e!68753 e!68754)))

(declare-fun res!86426 () Bool)

(assert (=> b!104972 (=> res!86426 e!68754)))

(assert (=> b!104972 (= res!86426 (= (size!2223 (buf!2589 lt!153500)) #b00000000000000000000000000000000))))

(declare-fun b!104973 () Bool)

(assert (=> b!104973 (= e!68754 (arrayBitRangesEq!0 (buf!2589 lt!153500) (buf!2589 lt!153500) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2223 (buf!2589 lt!153500)) (currentByte!5074 lt!153500) (currentBit!5069 lt!153500))))))

(assert (= (and d!32750 res!86424) b!104971))

(assert (= (and b!104971 res!86425) b!104972))

(assert (= (and b!104972 (not res!86426)) b!104973))

(assert (=> b!104971 m!153889))

(assert (=> b!104971 m!153889))

(assert (=> b!104973 m!153889))

(assert (=> b!104973 m!153889))

(declare-fun m!153893 () Bool)

(assert (=> b!104973 m!153893))

(assert (=> d!32320 d!32750))

(declare-fun d!32752 () Bool)

(assert (=> d!32752 (isPrefixOf!0 lt!153500 (_2!4570 lt!152888))))

(declare-fun lt!154389 () Unit!6390)

(assert (=> d!32752 (= lt!154389 (choose!30 lt!153500 thiss!1305 (_2!4570 lt!152888)))))

(assert (=> d!32752 (isPrefixOf!0 lt!153500 thiss!1305)))

(assert (=> d!32752 (= (lemmaIsPrefixTransitive!0 lt!153500 thiss!1305 (_2!4570 lt!152888)) lt!154389)))

(declare-fun bs!8014 () Bool)

(assert (= bs!8014 d!32752))

(assert (=> bs!8014 m!152847))

(declare-fun m!153895 () Bool)

(assert (=> bs!8014 m!153895))

(declare-fun m!153897 () Bool)

(assert (=> bs!8014 m!153897))

(assert (=> d!32320 d!32752))

(declare-fun d!32754 () Bool)

(declare-fun res!86427 () Bool)

(declare-fun e!68755 () Bool)

(assert (=> d!32754 (=> (not res!86427) (not e!68755))))

(assert (=> d!32754 (= res!86427 (= (size!2223 (buf!2589 thiss!1305)) (size!2223 (buf!2589 thiss!1305))))))

(assert (=> d!32754 (= (isPrefixOf!0 thiss!1305 thiss!1305) e!68755)))

(declare-fun b!104974 () Bool)

(declare-fun res!86428 () Bool)

(assert (=> b!104974 (=> (not res!86428) (not e!68755))))

(assert (=> b!104974 (= res!86428 (bvsle (bitIndex!0 (size!2223 (buf!2589 thiss!1305)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305)) (bitIndex!0 (size!2223 (buf!2589 thiss!1305)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305))))))

(declare-fun b!104975 () Bool)

(declare-fun e!68756 () Bool)

(assert (=> b!104975 (= e!68755 e!68756)))

(declare-fun res!86429 () Bool)

(assert (=> b!104975 (=> res!86429 e!68756)))

(assert (=> b!104975 (= res!86429 (= (size!2223 (buf!2589 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!104976 () Bool)

(assert (=> b!104976 (= e!68756 (arrayBitRangesEq!0 (buf!2589 thiss!1305) (buf!2589 thiss!1305) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2223 (buf!2589 thiss!1305)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305))))))

(assert (= (and d!32754 res!86427) b!104974))

(assert (= (and b!104974 res!86428) b!104975))

(assert (= (and b!104975 (not res!86429)) b!104976))

(assert (=> b!104974 m!152521))

(assert (=> b!104974 m!152521))

(assert (=> b!104976 m!152521))

(assert (=> b!104976 m!152521))

(declare-fun m!153899 () Bool)

(assert (=> b!104976 m!153899))

(assert (=> d!32320 d!32754))

(declare-fun d!32756 () Bool)

(declare-fun res!86430 () Bool)

(declare-fun e!68757 () Bool)

(assert (=> d!32756 (=> (not res!86430) (not e!68757))))

(assert (=> d!32756 (= res!86430 (= (size!2223 (buf!2589 (_1!4572 lt!153501))) (size!2223 (buf!2589 (_2!4572 lt!153501)))))))

(assert (=> d!32756 (= (isPrefixOf!0 (_1!4572 lt!153501) (_2!4572 lt!153501)) e!68757)))

(declare-fun b!104977 () Bool)

(declare-fun res!86431 () Bool)

(assert (=> b!104977 (=> (not res!86431) (not e!68757))))

(assert (=> b!104977 (= res!86431 (bvsle (bitIndex!0 (size!2223 (buf!2589 (_1!4572 lt!153501))) (currentByte!5074 (_1!4572 lt!153501)) (currentBit!5069 (_1!4572 lt!153501))) (bitIndex!0 (size!2223 (buf!2589 (_2!4572 lt!153501))) (currentByte!5074 (_2!4572 lt!153501)) (currentBit!5069 (_2!4572 lt!153501)))))))

(declare-fun b!104978 () Bool)

(declare-fun e!68758 () Bool)

(assert (=> b!104978 (= e!68757 e!68758)))

(declare-fun res!86432 () Bool)

(assert (=> b!104978 (=> res!86432 e!68758)))

(assert (=> b!104978 (= res!86432 (= (size!2223 (buf!2589 (_1!4572 lt!153501))) #b00000000000000000000000000000000))))

(declare-fun b!104979 () Bool)

(assert (=> b!104979 (= e!68758 (arrayBitRangesEq!0 (buf!2589 (_1!4572 lt!153501)) (buf!2589 (_2!4572 lt!153501)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2223 (buf!2589 (_1!4572 lt!153501))) (currentByte!5074 (_1!4572 lt!153501)) (currentBit!5069 (_1!4572 lt!153501)))))))

(assert (= (and d!32756 res!86430) b!104977))

(assert (= (and b!104977 res!86431) b!104978))

(assert (= (and b!104978 (not res!86432)) b!104979))

(assert (=> b!104977 m!153865))

(assert (=> b!104977 m!153793))

(assert (=> b!104979 m!153865))

(assert (=> b!104979 m!153865))

(declare-fun m!153901 () Bool)

(assert (=> b!104979 m!153901))

(assert (=> d!32320 d!32756))

(declare-fun d!32758 () Bool)

(assert (=> d!32758 (isPrefixOf!0 (_2!4570 lt!152888) (_2!4570 lt!152888))))

(declare-fun lt!154390 () Unit!6390)

(assert (=> d!32758 (= lt!154390 (choose!11 (_2!4570 lt!152888)))))

(assert (=> d!32758 (= (lemmaIsPrefixRefl!0 (_2!4570 lt!152888)) lt!154390)))

(declare-fun bs!8015 () Bool)

(assert (= bs!8015 d!32758))

(assert (=> bs!8015 m!152849))

(declare-fun m!153903 () Bool)

(assert (=> bs!8015 m!153903))

(assert (=> d!32320 d!32758))

(declare-fun d!32760 () Bool)

(assert (=> d!32760 (isPrefixOf!0 lt!153500 (_2!4570 lt!152888))))

(declare-fun lt!154391 () Unit!6390)

(assert (=> d!32760 (= lt!154391 (choose!30 lt!153500 (_2!4570 lt!152888) (_2!4570 lt!152888)))))

(assert (=> d!32760 (isPrefixOf!0 lt!153500 (_2!4570 lt!152888))))

(assert (=> d!32760 (= (lemmaIsPrefixTransitive!0 lt!153500 (_2!4570 lt!152888) (_2!4570 lt!152888)) lt!154391)))

(declare-fun bs!8016 () Bool)

(assert (= bs!8016 d!32760))

(assert (=> bs!8016 m!152847))

(declare-fun m!153905 () Bool)

(assert (=> bs!8016 m!153905))

(assert (=> bs!8016 m!152847))

(assert (=> d!32320 d!32760))

(declare-fun d!32762 () Bool)

(declare-fun res!86433 () Bool)

(declare-fun e!68759 () Bool)

(assert (=> d!32762 (=> (not res!86433) (not e!68759))))

(assert (=> d!32762 (= res!86433 (= (size!2223 (buf!2589 (_2!4570 lt!152888))) (size!2223 (buf!2589 (_2!4570 lt!152888)))))))

(assert (=> d!32762 (= (isPrefixOf!0 (_2!4570 lt!152888) (_2!4570 lt!152888)) e!68759)))

(declare-fun b!104980 () Bool)

(declare-fun res!86434 () Bool)

(assert (=> b!104980 (=> (not res!86434) (not e!68759))))

(assert (=> b!104980 (= res!86434 (bvsle (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!152888))) (currentByte!5074 (_2!4570 lt!152888)) (currentBit!5069 (_2!4570 lt!152888))) (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!152888))) (currentByte!5074 (_2!4570 lt!152888)) (currentBit!5069 (_2!4570 lt!152888)))))))

(declare-fun b!104981 () Bool)

(declare-fun e!68760 () Bool)

(assert (=> b!104981 (= e!68759 e!68760)))

(declare-fun res!86435 () Bool)

(assert (=> b!104981 (=> res!86435 e!68760)))

(assert (=> b!104981 (= res!86435 (= (size!2223 (buf!2589 (_2!4570 lt!152888))) #b00000000000000000000000000000000))))

(declare-fun b!104982 () Bool)

(assert (=> b!104982 (= e!68760 (arrayBitRangesEq!0 (buf!2589 (_2!4570 lt!152888)) (buf!2589 (_2!4570 lt!152888)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!152888))) (currentByte!5074 (_2!4570 lt!152888)) (currentBit!5069 (_2!4570 lt!152888)))))))

(assert (= (and d!32762 res!86433) b!104980))

(assert (= (and b!104980 res!86434) b!104981))

(assert (= (and b!104981 (not res!86435)) b!104982))

(assert (=> b!104980 m!152873))

(assert (=> b!104980 m!152873))

(assert (=> b!104982 m!152873))

(assert (=> b!104982 m!152873))

(declare-fun m!153907 () Bool)

(assert (=> b!104982 m!153907))

(assert (=> d!32320 d!32762))

(assert (=> d!32320 d!32352))

(declare-fun d!32764 () Bool)

(assert (=> d!32764 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-fun lt!154392 () Unit!6390)

(assert (=> d!32764 (= lt!154392 (choose!11 thiss!1305))))

(assert (=> d!32764 (= (lemmaIsPrefixRefl!0 thiss!1305) lt!154392)))

(declare-fun bs!8017 () Bool)

(assert (= bs!8017 d!32764))

(assert (=> bs!8017 m!152861))

(declare-fun m!153909 () Bool)

(assert (=> bs!8017 m!153909))

(assert (=> d!32320 d!32764))

(declare-fun d!32766 () Bool)

(declare-fun e!68761 () Bool)

(assert (=> d!32766 e!68761))

(declare-fun res!86437 () Bool)

(assert (=> d!32766 (=> (not res!86437) (not e!68761))))

(declare-fun lt!154393 () (_ BitVec 64))

(declare-fun lt!154394 () (_ BitVec 64))

(declare-fun lt!154398 () (_ BitVec 64))

(assert (=> d!32766 (= res!86437 (= lt!154394 (bvsub lt!154393 lt!154398)))))

(assert (=> d!32766 (or (= (bvand lt!154393 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!154398 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!154393 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!154393 lt!154398) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32766 (= lt!154398 (remainingBits!0 ((_ sign_extend 32) (size!2223 (buf!2589 (_1!4573 lt!153274)))) ((_ sign_extend 32) (currentByte!5074 (_1!4573 lt!153274))) ((_ sign_extend 32) (currentBit!5069 (_1!4573 lt!153274)))))))

(declare-fun lt!154395 () (_ BitVec 64))

(declare-fun lt!154397 () (_ BitVec 64))

(assert (=> d!32766 (= lt!154393 (bvmul lt!154395 lt!154397))))

(assert (=> d!32766 (or (= lt!154395 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!154397 (bvsdiv (bvmul lt!154395 lt!154397) lt!154395)))))

(assert (=> d!32766 (= lt!154397 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32766 (= lt!154395 ((_ sign_extend 32) (size!2223 (buf!2589 (_1!4573 lt!153274)))))))

(assert (=> d!32766 (= lt!154394 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5074 (_1!4573 lt!153274))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5069 (_1!4573 lt!153274)))))))

(assert (=> d!32766 (invariant!0 (currentBit!5069 (_1!4573 lt!153274)) (currentByte!5074 (_1!4573 lt!153274)) (size!2223 (buf!2589 (_1!4573 lt!153274))))))

(assert (=> d!32766 (= (bitIndex!0 (size!2223 (buf!2589 (_1!4573 lt!153274))) (currentByte!5074 (_1!4573 lt!153274)) (currentBit!5069 (_1!4573 lt!153274))) lt!154394)))

(declare-fun b!104983 () Bool)

(declare-fun res!86436 () Bool)

(assert (=> b!104983 (=> (not res!86436) (not e!68761))))

(assert (=> b!104983 (= res!86436 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!154394))))

(declare-fun b!104984 () Bool)

(declare-fun lt!154396 () (_ BitVec 64))

(assert (=> b!104984 (= e!68761 (bvsle lt!154394 (bvmul lt!154396 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!104984 (or (= lt!154396 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!154396 #b0000000000000000000000000000000000000000000000000000000000001000) lt!154396)))))

(assert (=> b!104984 (= lt!154396 ((_ sign_extend 32) (size!2223 (buf!2589 (_1!4573 lt!153274)))))))

(assert (= (and d!32766 res!86437) b!104983))

(assert (= (and b!104983 res!86436) b!104984))

(declare-fun m!153911 () Bool)

(assert (=> d!32766 m!153911))

(declare-fun m!153913 () Bool)

(assert (=> d!32766 m!153913))

(assert (=> b!104410 d!32766))

(assert (=> b!104410 d!32712))

(declare-fun d!32768 () Bool)

(declare-fun res!86438 () Bool)

(declare-fun e!68762 () Bool)

(assert (=> d!32768 (=> (not res!86438) (not e!68762))))

(assert (=> d!32768 (= res!86438 (= (size!2223 (buf!2589 (_2!4570 lt!152884))) (size!2223 (buf!2589 (_2!4570 lt!153257)))))))

(assert (=> d!32768 (= (isPrefixOf!0 (_2!4570 lt!152884) (_2!4570 lt!153257)) e!68762)))

(declare-fun b!104985 () Bool)

(declare-fun res!86439 () Bool)

(assert (=> b!104985 (=> (not res!86439) (not e!68762))))

(assert (=> b!104985 (= res!86439 (bvsle (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!152884))) (currentByte!5074 (_2!4570 lt!152884)) (currentBit!5069 (_2!4570 lt!152884))) (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!153257))) (currentByte!5074 (_2!4570 lt!153257)) (currentBit!5069 (_2!4570 lt!153257)))))))

(declare-fun b!104986 () Bool)

(declare-fun e!68763 () Bool)

(assert (=> b!104986 (= e!68762 e!68763)))

(declare-fun res!86440 () Bool)

(assert (=> b!104986 (=> res!86440 e!68763)))

(assert (=> b!104986 (= res!86440 (= (size!2223 (buf!2589 (_2!4570 lt!152884))) #b00000000000000000000000000000000))))

(declare-fun b!104987 () Bool)

(assert (=> b!104987 (= e!68763 (arrayBitRangesEq!0 (buf!2589 (_2!4570 lt!152884)) (buf!2589 (_2!4570 lt!153257)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!152884))) (currentByte!5074 (_2!4570 lt!152884)) (currentBit!5069 (_2!4570 lt!152884)))))))

(assert (= (and d!32768 res!86438) b!104985))

(assert (= (and b!104985 res!86439) b!104986))

(assert (= (and b!104986 (not res!86440)) b!104987))

(assert (=> b!104985 m!152527))

(assert (=> b!104985 m!152757))

(assert (=> b!104987 m!152527))

(assert (=> b!104987 m!152527))

(declare-fun m!153915 () Bool)

(assert (=> b!104987 m!153915))

(assert (=> b!104409 d!32768))

(declare-fun d!32770 () Bool)

(assert (=> d!32770 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2223 (buf!2589 (_2!4570 lt!153257)))) ((_ sign_extend 32) (currentByte!5074 (_2!4570 lt!152884))) ((_ sign_extend 32) (currentBit!5069 (_2!4570 lt!152884))) lt!153277) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2223 (buf!2589 (_2!4570 lt!153257)))) ((_ sign_extend 32) (currentByte!5074 (_2!4570 lt!152884))) ((_ sign_extend 32) (currentBit!5069 (_2!4570 lt!152884)))) lt!153277))))

(declare-fun bs!8018 () Bool)

(assert (= bs!8018 d!32770))

(declare-fun m!153917 () Bool)

(assert (=> bs!8018 m!153917))

(assert (=> b!104409 d!32770))

(declare-fun d!32772 () Bool)

(assert (=> d!32772 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2223 (buf!2589 (_2!4570 lt!153257)))) ((_ sign_extend 32) (currentByte!5074 (_2!4570 lt!153261))) ((_ sign_extend 32) (currentBit!5069 (_2!4570 lt!153261))) lt!153250) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2223 (buf!2589 (_2!4570 lt!153257)))) ((_ sign_extend 32) (currentByte!5074 (_2!4570 lt!153261))) ((_ sign_extend 32) (currentBit!5069 (_2!4570 lt!153261)))) lt!153250))))

(declare-fun bs!8019 () Bool)

(assert (= bs!8019 d!32772))

(declare-fun m!153919 () Bool)

(assert (=> bs!8019 m!153919))

(assert (=> b!104409 d!32772))

(declare-fun d!32774 () Bool)

(assert (=> d!32774 (validate_offset_bits!1 ((_ sign_extend 32) (size!2223 (buf!2589 (_2!4570 lt!153257)))) ((_ sign_extend 32) (currentByte!5074 (_2!4570 lt!153261))) ((_ sign_extend 32) (currentBit!5069 (_2!4570 lt!153261))) lt!153250)))

(declare-fun lt!154399 () Unit!6390)

(assert (=> d!32774 (= lt!154399 (choose!9 (_2!4570 lt!153261) (buf!2589 (_2!4570 lt!153257)) lt!153250 (BitStream!3921 (buf!2589 (_2!4570 lt!153257)) (currentByte!5074 (_2!4570 lt!153261)) (currentBit!5069 (_2!4570 lt!153261)))))))

(assert (=> d!32774 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4570 lt!153261) (buf!2589 (_2!4570 lt!153257)) lt!153250) lt!154399)))

(declare-fun bs!8020 () Bool)

(assert (= bs!8020 d!32774))

(assert (=> bs!8020 m!152711))

(declare-fun m!153921 () Bool)

(assert (=> bs!8020 m!153921))

(assert (=> b!104409 d!32774))

(declare-fun lt!154400 () tuple2!8638)

(declare-fun d!32776 () Bool)

(assert (=> d!32776 (= lt!154400 (readNLeastSignificantBitsLoop!0 (_1!4572 lt!153276) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!153282 (ite (_2!4573 lt!153291) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!32776 (= (readNLeastSignificantBitsLoopPure!0 (_1!4572 lt!153276) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!153282 (ite (_2!4573 lt!153291) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!8633 (_2!4574 lt!154400) (_1!4574 lt!154400)))))

(declare-fun bs!8021 () Bool)

(assert (= bs!8021 d!32776))

(declare-fun m!153923 () Bool)

(assert (=> bs!8021 m!153923))

(assert (=> b!104409 d!32776))

(declare-fun d!32778 () Bool)

(declare-fun e!68765 () Bool)

(assert (=> d!32778 e!68765))

(declare-fun res!86443 () Bool)

(assert (=> d!32778 (=> (not res!86443) (not e!68765))))

(declare-fun lt!154403 () tuple2!8630)

(assert (=> d!32778 (= res!86443 (= (size!2223 (buf!2589 (_2!4570 lt!152884))) (size!2223 (buf!2589 (_2!4570 lt!154403)))))))

(assert (=> d!32778 (= lt!154403 (choose!16 (_2!4570 lt!152884) lt!153281))))

(assert (=> d!32778 (validate_offset_bit!0 ((_ sign_extend 32) (size!2223 (buf!2589 (_2!4570 lt!152884)))) ((_ sign_extend 32) (currentByte!5074 (_2!4570 lt!152884))) ((_ sign_extend 32) (currentBit!5069 (_2!4570 lt!152884))))))

(assert (=> d!32778 (= (appendBit!0 (_2!4570 lt!152884) lt!153281) lt!154403)))

(declare-fun b!104990 () Bool)

(declare-fun e!68764 () Bool)

(assert (=> b!104990 (= e!68765 e!68764)))

(declare-fun res!86442 () Bool)

(assert (=> b!104990 (=> (not res!86442) (not e!68764))))

(declare-fun lt!154402 () tuple2!8636)

(assert (=> b!104990 (= res!86442 (and (= (_2!4573 lt!154402) lt!153281) (= (_1!4573 lt!154402) (_2!4570 lt!154403))))))

(assert (=> b!104990 (= lt!154402 (readBitPure!0 (readerFrom!0 (_2!4570 lt!154403) (currentBit!5069 (_2!4570 lt!152884)) (currentByte!5074 (_2!4570 lt!152884)))))))

(declare-fun b!104988 () Bool)

(declare-fun res!86444 () Bool)

(assert (=> b!104988 (=> (not res!86444) (not e!68765))))

(declare-fun lt!154401 () (_ BitVec 64))

(declare-fun lt!154404 () (_ BitVec 64))

(assert (=> b!104988 (= res!86444 (= (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!154403))) (currentByte!5074 (_2!4570 lt!154403)) (currentBit!5069 (_2!4570 lt!154403))) (bvadd lt!154401 lt!154404)))))

(assert (=> b!104988 (or (not (= (bvand lt!154401 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!154404 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!154401 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!154401 lt!154404) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!104988 (= lt!154404 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!104988 (= lt!154401 (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!152884))) (currentByte!5074 (_2!4570 lt!152884)) (currentBit!5069 (_2!4570 lt!152884))))))

(declare-fun b!104991 () Bool)

(assert (=> b!104991 (= e!68764 (= (bitIndex!0 (size!2223 (buf!2589 (_1!4573 lt!154402))) (currentByte!5074 (_1!4573 lt!154402)) (currentBit!5069 (_1!4573 lt!154402))) (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!154403))) (currentByte!5074 (_2!4570 lt!154403)) (currentBit!5069 (_2!4570 lt!154403)))))))

(declare-fun b!104989 () Bool)

(declare-fun res!86441 () Bool)

(assert (=> b!104989 (=> (not res!86441) (not e!68765))))

(assert (=> b!104989 (= res!86441 (isPrefixOf!0 (_2!4570 lt!152884) (_2!4570 lt!154403)))))

(assert (= (and d!32778 res!86443) b!104988))

(assert (= (and b!104988 res!86444) b!104989))

(assert (= (and b!104989 res!86441) b!104990))

(assert (= (and b!104990 res!86442) b!104991))

(declare-fun m!153925 () Bool)

(assert (=> b!104988 m!153925))

(assert (=> b!104988 m!152527))

(declare-fun m!153927 () Bool)

(assert (=> b!104989 m!153927))

(declare-fun m!153929 () Bool)

(assert (=> b!104990 m!153929))

(assert (=> b!104990 m!153929))

(declare-fun m!153931 () Bool)

(assert (=> b!104990 m!153931))

(declare-fun m!153933 () Bool)

(assert (=> d!32778 m!153933))

(declare-fun m!153935 () Bool)

(assert (=> d!32778 m!153935))

(declare-fun m!153937 () Bool)

(assert (=> b!104991 m!153937))

(assert (=> b!104991 m!153925))

(assert (=> b!104409 d!32778))

(declare-fun d!32780 () Bool)

(declare-fun e!68766 () Bool)

(assert (=> d!32780 e!68766))

(declare-fun res!86446 () Bool)

(assert (=> d!32780 (=> (not res!86446) (not e!68766))))

(declare-fun lt!154406 () (_ BitVec 64))

(declare-fun lt!154410 () (_ BitVec 64))

(declare-fun lt!154405 () (_ BitVec 64))

(assert (=> d!32780 (= res!86446 (= lt!154406 (bvsub lt!154405 lt!154410)))))

(assert (=> d!32780 (or (= (bvand lt!154405 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!154410 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!154405 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!154405 lt!154410) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32780 (= lt!154410 (remainingBits!0 ((_ sign_extend 32) (size!2223 (buf!2589 (_2!4570 lt!153257)))) ((_ sign_extend 32) (currentByte!5074 (_2!4570 lt!153257))) ((_ sign_extend 32) (currentBit!5069 (_2!4570 lt!153257)))))))

(declare-fun lt!154407 () (_ BitVec 64))

(declare-fun lt!154409 () (_ BitVec 64))

(assert (=> d!32780 (= lt!154405 (bvmul lt!154407 lt!154409))))

(assert (=> d!32780 (or (= lt!154407 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!154409 (bvsdiv (bvmul lt!154407 lt!154409) lt!154407)))))

(assert (=> d!32780 (= lt!154409 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32780 (= lt!154407 ((_ sign_extend 32) (size!2223 (buf!2589 (_2!4570 lt!153257)))))))

(assert (=> d!32780 (= lt!154406 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5074 (_2!4570 lt!153257))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5069 (_2!4570 lt!153257)))))))

(assert (=> d!32780 (invariant!0 (currentBit!5069 (_2!4570 lt!153257)) (currentByte!5074 (_2!4570 lt!153257)) (size!2223 (buf!2589 (_2!4570 lt!153257))))))

(assert (=> d!32780 (= (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!153257))) (currentByte!5074 (_2!4570 lt!153257)) (currentBit!5069 (_2!4570 lt!153257))) lt!154406)))

(declare-fun b!104992 () Bool)

(declare-fun res!86445 () Bool)

(assert (=> b!104992 (=> (not res!86445) (not e!68766))))

(assert (=> b!104992 (= res!86445 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!154406))))

(declare-fun b!104993 () Bool)

(declare-fun lt!154408 () (_ BitVec 64))

(assert (=> b!104993 (= e!68766 (bvsle lt!154406 (bvmul lt!154408 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!104993 (or (= lt!154408 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!154408 #b0000000000000000000000000000000000000000000000000000000000001000) lt!154408)))))

(assert (=> b!104993 (= lt!154408 ((_ sign_extend 32) (size!2223 (buf!2589 (_2!4570 lt!153257)))))))

(assert (= (and d!32780 res!86446) b!104992))

(assert (= (and b!104992 res!86445) b!104993))

(declare-fun m!153939 () Bool)

(assert (=> d!32780 m!153939))

(declare-fun m!153941 () Bool)

(assert (=> d!32780 m!153941))

(assert (=> b!104409 d!32780))

(assert (=> b!104409 d!32376))

(declare-fun b!104994 () Bool)

(declare-fun lt!154411 () tuple2!8634)

(declare-fun e!68773 () Bool)

(declare-fun lt!154449 () tuple2!8632)

(assert (=> b!104994 (= e!68773 (and (= (_2!4571 lt!154449) v!199) (= (_1!4571 lt!154449) (_2!4572 lt!154411))))))

(declare-fun lt!154441 () (_ BitVec 64))

(assert (=> b!104994 (= lt!154449 (readNLeastSignificantBitsLoopPure!0 (_1!4572 lt!154411) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!154441))))

(declare-fun lt!154415 () Unit!6390)

(declare-fun lt!154450 () Unit!6390)

(assert (=> b!104994 (= lt!154415 lt!154450)))

(declare-fun lt!154434 () tuple2!8630)

(declare-fun lt!154433 () (_ BitVec 64))

(assert (=> b!104994 (validate_offset_bits!1 ((_ sign_extend 32) (size!2223 (buf!2589 (_2!4570 lt!154434)))) ((_ sign_extend 32) (currentByte!5074 (_2!4570 lt!153261))) ((_ sign_extend 32) (currentBit!5069 (_2!4570 lt!153261))) lt!154433)))

(assert (=> b!104994 (= lt!154450 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4570 lt!153261) (buf!2589 (_2!4570 lt!154434)) lt!154433))))

(declare-fun e!68769 () Bool)

(assert (=> b!104994 e!68769))

(declare-fun res!86453 () Bool)

(assert (=> b!104994 (=> (not res!86453) (not e!68769))))

(assert (=> b!104994 (= res!86453 (and (= (size!2223 (buf!2589 (_2!4570 lt!153261))) (size!2223 (buf!2589 (_2!4570 lt!154434)))) (bvsge lt!154433 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!104994 (= lt!154433 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))

(assert (=> b!104994 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!104994 (= lt!154441 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))))

(assert (=> b!104994 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!104994 (= lt!154411 (reader!0 (_2!4570 lt!153261) (_2!4570 lt!154434)))))

(declare-fun d!32782 () Bool)

(assert (=> d!32782 e!68773))

(declare-fun res!86447 () Bool)

(assert (=> d!32782 (=> (not res!86447) (not e!68773))))

(assert (=> d!32782 (= res!86447 (= (size!2223 (buf!2589 (_2!4570 lt!153261))) (size!2223 (buf!2589 (_2!4570 lt!154434)))))))

(declare-fun e!68771 () tuple2!8630)

(assert (=> d!32782 (= lt!154434 e!68771)))

(declare-fun c!6478 () Bool)

(assert (=> d!32782 (= c!6478 (bvslt (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) nBits!396))))

(assert (=> d!32782 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) (bvsle (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!32782 (= (appendNLeastSignificantBitsLoop!0 (_2!4570 lt!153261) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) lt!154434)))

(declare-fun b!104995 () Bool)

(declare-fun e!68772 () (_ BitVec 64))

(assert (=> b!104995 (= e!68772 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!104996 () Bool)

(assert (=> b!104996 (= e!68772 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))))

(declare-fun b!104997 () Bool)

(declare-fun lt!154419 () tuple2!8630)

(declare-fun Unit!6431 () Unit!6390)

(assert (=> b!104997 (= e!68771 (tuple2!8631 Unit!6431 (_2!4570 lt!154419)))))

(declare-fun lt!154443 () Bool)

(assert (=> b!104997 (= lt!154443 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!154442 () tuple2!8630)

(assert (=> b!104997 (= lt!154442 (appendBit!0 (_2!4570 lt!153261) lt!154443))))

(declare-fun res!86455 () Bool)

(assert (=> b!104997 (= res!86455 (= (size!2223 (buf!2589 (_2!4570 lt!153261))) (size!2223 (buf!2589 (_2!4570 lt!154442)))))))

(declare-fun e!68767 () Bool)

(assert (=> b!104997 (=> (not res!86455) (not e!68767))))

(assert (=> b!104997 e!68767))

(declare-fun lt!154423 () tuple2!8630)

(assert (=> b!104997 (= lt!154423 lt!154442)))

(assert (=> b!104997 (= lt!154419 (appendNLeastSignificantBitsLoop!0 (_2!4570 lt!154423) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!154428 () Unit!6390)

(assert (=> b!104997 (= lt!154428 (lemmaIsPrefixTransitive!0 (_2!4570 lt!153261) (_2!4570 lt!154423) (_2!4570 lt!154419)))))

(assert (=> b!104997 (isPrefixOf!0 (_2!4570 lt!153261) (_2!4570 lt!154419))))

(declare-fun lt!154424 () Unit!6390)

(assert (=> b!104997 (= lt!154424 lt!154428)))

(assert (=> b!104997 (invariant!0 (currentBit!5069 (_2!4570 lt!153261)) (currentByte!5074 (_2!4570 lt!153261)) (size!2223 (buf!2589 (_2!4570 lt!154423))))))

(declare-fun lt!154432 () BitStream!3920)

(assert (=> b!104997 (= lt!154432 (BitStream!3921 (buf!2589 (_2!4570 lt!154423)) (currentByte!5074 (_2!4570 lt!153261)) (currentBit!5069 (_2!4570 lt!153261))))))

(assert (=> b!104997 (invariant!0 (currentBit!5069 lt!154432) (currentByte!5074 lt!154432) (size!2223 (buf!2589 (_2!4570 lt!154419))))))

(declare-fun lt!154440 () BitStream!3920)

(assert (=> b!104997 (= lt!154440 (BitStream!3921 (buf!2589 (_2!4570 lt!154419)) (currentByte!5074 lt!154432) (currentBit!5069 lt!154432)))))

(declare-fun lt!154429 () tuple2!8636)

(assert (=> b!104997 (= lt!154429 (readBitPure!0 lt!154432))))

(declare-fun lt!154455 () tuple2!8636)

(assert (=> b!104997 (= lt!154455 (readBitPure!0 lt!154440))))

(declare-fun lt!154437 () Unit!6390)

(assert (=> b!104997 (= lt!154437 (readBitPrefixLemma!0 lt!154432 (_2!4570 lt!154419)))))

(declare-fun res!86452 () Bool)

(assert (=> b!104997 (= res!86452 (= (bitIndex!0 (size!2223 (buf!2589 (_1!4573 lt!154429))) (currentByte!5074 (_1!4573 lt!154429)) (currentBit!5069 (_1!4573 lt!154429))) (bitIndex!0 (size!2223 (buf!2589 (_1!4573 lt!154455))) (currentByte!5074 (_1!4573 lt!154455)) (currentBit!5069 (_1!4573 lt!154455)))))))

(declare-fun e!68768 () Bool)

(assert (=> b!104997 (=> (not res!86452) (not e!68768))))

(assert (=> b!104997 e!68768))

(declare-fun lt!154416 () Unit!6390)

(assert (=> b!104997 (= lt!154416 lt!154437)))

(declare-fun lt!154421 () tuple2!8634)

(assert (=> b!104997 (= lt!154421 (reader!0 (_2!4570 lt!153261) (_2!4570 lt!154419)))))

(declare-fun lt!154438 () tuple2!8634)

(assert (=> b!104997 (= lt!154438 (reader!0 (_2!4570 lt!154423) (_2!4570 lt!154419)))))

(declare-fun lt!154453 () tuple2!8636)

(assert (=> b!104997 (= lt!154453 (readBitPure!0 (_1!4572 lt!154421)))))

(assert (=> b!104997 (= (_2!4573 lt!154453) lt!154443)))

(declare-fun lt!154445 () Unit!6390)

(declare-fun Unit!6432 () Unit!6390)

(assert (=> b!104997 (= lt!154445 Unit!6432)))

(declare-fun lt!154444 () (_ BitVec 64))

(assert (=> b!104997 (= lt!154444 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))))

(declare-fun lt!154439 () (_ BitVec 64))

(assert (=> b!104997 (= lt!154439 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))

(declare-fun lt!154452 () Unit!6390)

(assert (=> b!104997 (= lt!154452 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4570 lt!153261) (buf!2589 (_2!4570 lt!154419)) lt!154439))))

(assert (=> b!104997 (validate_offset_bits!1 ((_ sign_extend 32) (size!2223 (buf!2589 (_2!4570 lt!154419)))) ((_ sign_extend 32) (currentByte!5074 (_2!4570 lt!153261))) ((_ sign_extend 32) (currentBit!5069 (_2!4570 lt!153261))) lt!154439)))

(declare-fun lt!154451 () Unit!6390)

(assert (=> b!104997 (= lt!154451 lt!154452)))

(declare-fun lt!154431 () tuple2!8632)

(assert (=> b!104997 (= lt!154431 (readNLeastSignificantBitsLoopPure!0 (_1!4572 lt!154421) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!154444))))

(declare-fun lt!154412 () (_ BitVec 64))

(assert (=> b!104997 (= lt!154412 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))))

(declare-fun lt!154446 () Unit!6390)

(assert (=> b!104997 (= lt!154446 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4570 lt!154423) (buf!2589 (_2!4570 lt!154419)) lt!154412))))

(assert (=> b!104997 (validate_offset_bits!1 ((_ sign_extend 32) (size!2223 (buf!2589 (_2!4570 lt!154419)))) ((_ sign_extend 32) (currentByte!5074 (_2!4570 lt!154423))) ((_ sign_extend 32) (currentBit!5069 (_2!4570 lt!154423))) lt!154412)))

(declare-fun lt!154413 () Unit!6390)

(assert (=> b!104997 (= lt!154413 lt!154446)))

(declare-fun lt!154426 () tuple2!8632)

(assert (=> b!104997 (= lt!154426 (readNLeastSignificantBitsLoopPure!0 (_1!4572 lt!154438) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor lt!154444 (ite (_2!4573 lt!154453) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!154427 () tuple2!8632)

(assert (=> b!104997 (= lt!154427 (readNLeastSignificantBitsLoopPure!0 (_1!4572 lt!154421) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!154444))))

(declare-fun c!6479 () Bool)

(assert (=> b!104997 (= c!6479 (_2!4573 (readBitPure!0 (_1!4572 lt!154421))))))

(declare-fun lt!154448 () tuple2!8632)

(assert (=> b!104997 (= lt!154448 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4572 lt!154421) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor lt!154444 e!68772)))))

(declare-fun lt!154425 () Unit!6390)

(assert (=> b!104997 (= lt!154425 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4572 lt!154421) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!154444))))

(assert (=> b!104997 (and (= (_2!4571 lt!154427) (_2!4571 lt!154448)) (= (_1!4571 lt!154427) (_1!4571 lt!154448)))))

(declare-fun lt!154418 () Unit!6390)

(assert (=> b!104997 (= lt!154418 lt!154425)))

(assert (=> b!104997 (= (_1!4572 lt!154421) (withMovedBitIndex!0 (_2!4572 lt!154421) (bvsub (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!153261))) (currentByte!5074 (_2!4570 lt!153261)) (currentBit!5069 (_2!4570 lt!153261))) (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!154419))) (currentByte!5074 (_2!4570 lt!154419)) (currentBit!5069 (_2!4570 lt!154419))))))))

(declare-fun lt!154422 () Unit!6390)

(declare-fun Unit!6433 () Unit!6390)

(assert (=> b!104997 (= lt!154422 Unit!6433)))

(assert (=> b!104997 (= (_1!4572 lt!154438) (withMovedBitIndex!0 (_2!4572 lt!154438) (bvsub (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!154423))) (currentByte!5074 (_2!4570 lt!154423)) (currentBit!5069 (_2!4570 lt!154423))) (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!154419))) (currentByte!5074 (_2!4570 lt!154419)) (currentBit!5069 (_2!4570 lt!154419))))))))

(declare-fun lt!154435 () Unit!6390)

(declare-fun Unit!6434 () Unit!6390)

(assert (=> b!104997 (= lt!154435 Unit!6434)))

(assert (=> b!104997 (= (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!153261))) (currentByte!5074 (_2!4570 lt!153261)) (currentBit!5069 (_2!4570 lt!153261))) (bvsub (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!154423))) (currentByte!5074 (_2!4570 lt!154423)) (currentBit!5069 (_2!4570 lt!154423))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!154430 () Unit!6390)

(declare-fun Unit!6435 () Unit!6390)

(assert (=> b!104997 (= lt!154430 Unit!6435)))

(assert (=> b!104997 (= (_2!4571 lt!154431) (_2!4571 lt!154426))))

(declare-fun lt!154417 () Unit!6390)

(declare-fun Unit!6436 () Unit!6390)

(assert (=> b!104997 (= lt!154417 Unit!6436)))

(assert (=> b!104997 (= (_1!4571 lt!154431) (_2!4572 lt!154421))))

(declare-fun call!1313 () Bool)

(declare-fun bm!1310 () Bool)

(declare-fun lt!154454 () BitStream!3920)

(assert (=> bm!1310 (= call!1313 (isPrefixOf!0 (ite c!6478 (_2!4570 lt!153261) lt!154454) (ite c!6478 (_2!4570 lt!154442) lt!154454)))))

(declare-fun b!104998 () Bool)

(declare-fun e!68770 () Bool)

(declare-fun lt!154436 () tuple2!8636)

(assert (=> b!104998 (= e!68770 (= (bitIndex!0 (size!2223 (buf!2589 (_1!4573 lt!154436))) (currentByte!5074 (_1!4573 lt!154436)) (currentBit!5069 (_1!4573 lt!154436))) (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!154442))) (currentByte!5074 (_2!4570 lt!154442)) (currentBit!5069 (_2!4570 lt!154442)))))))

(declare-fun b!104999 () Bool)

(declare-fun res!86451 () Bool)

(assert (=> b!104999 (= res!86451 call!1313)))

(assert (=> b!104999 (=> (not res!86451) (not e!68767))))

(declare-fun b!105000 () Bool)

(assert (=> b!105000 (= e!68769 (validate_offset_bits!1 ((_ sign_extend 32) (size!2223 (buf!2589 (_2!4570 lt!153261)))) ((_ sign_extend 32) (currentByte!5074 (_2!4570 lt!153261))) ((_ sign_extend 32) (currentBit!5069 (_2!4570 lt!153261))) lt!154433))))

(declare-fun b!105001 () Bool)

(declare-fun res!86449 () Bool)

(assert (=> b!105001 (=> (not res!86449) (not e!68773))))

(assert (=> b!105001 (= res!86449 (isPrefixOf!0 (_2!4570 lt!153261) (_2!4570 lt!154434)))))

(declare-fun b!105002 () Bool)

(assert (=> b!105002 (= e!68768 (= (_2!4573 lt!154429) (_2!4573 lt!154455)))))

(declare-fun b!105003 () Bool)

(declare-fun lt!154414 () Unit!6390)

(assert (=> b!105003 (= e!68771 (tuple2!8631 lt!154414 (_2!4570 lt!153261)))))

(assert (=> b!105003 (= lt!154454 (_2!4570 lt!153261))))

(assert (=> b!105003 (= lt!154414 (lemmaIsPrefixRefl!0 lt!154454))))

(assert (=> b!105003 call!1313))

(declare-fun b!105004 () Bool)

(declare-fun res!86448 () Bool)

(assert (=> b!105004 (= res!86448 (= (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!154442))) (currentByte!5074 (_2!4570 lt!154442)) (currentBit!5069 (_2!4570 lt!154442))) (bvadd (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!153261))) (currentByte!5074 (_2!4570 lt!153261)) (currentBit!5069 (_2!4570 lt!153261))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!105004 (=> (not res!86448) (not e!68767))))

(declare-fun b!105005 () Bool)

(assert (=> b!105005 (= lt!154436 (readBitPure!0 (readerFrom!0 (_2!4570 lt!154442) (currentBit!5069 (_2!4570 lt!153261)) (currentByte!5074 (_2!4570 lt!153261)))))))

(declare-fun res!86454 () Bool)

(assert (=> b!105005 (= res!86454 (and (= (_2!4573 lt!154436) lt!154443) (= (_1!4573 lt!154436) (_2!4570 lt!154442))))))

(assert (=> b!105005 (=> (not res!86454) (not e!68770))))

(assert (=> b!105005 (= e!68767 e!68770)))

(declare-fun b!105006 () Bool)

(declare-fun res!86450 () Bool)

(assert (=> b!105006 (=> (not res!86450) (not e!68773))))

(declare-fun lt!154420 () (_ BitVec 64))

(declare-fun lt!154447 () (_ BitVec 64))

(assert (=> b!105006 (= res!86450 (= (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!154434))) (currentByte!5074 (_2!4570 lt!154434)) (currentBit!5069 (_2!4570 lt!154434))) (bvadd lt!154447 lt!154420)))))

(assert (=> b!105006 (or (not (= (bvand lt!154447 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!154420 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!154447 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!154447 lt!154420) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!105006 (= lt!154420 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))

(assert (=> b!105006 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!105006 (= lt!154447 (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!153261))) (currentByte!5074 (_2!4570 lt!153261)) (currentBit!5069 (_2!4570 lt!153261))))))

(assert (= (and d!32782 c!6478) b!104997))

(assert (= (and d!32782 (not c!6478)) b!105003))

(assert (= (and b!104997 res!86455) b!105004))

(assert (= (and b!105004 res!86448) b!104999))

(assert (= (and b!104999 res!86451) b!105005))

(assert (= (and b!105005 res!86454) b!104998))

(assert (= (and b!104997 res!86452) b!105002))

(assert (= (and b!104997 c!6479) b!104996))

(assert (= (and b!104997 (not c!6479)) b!104995))

(assert (= (or b!104999 b!105003) bm!1310))

(assert (= (and d!32782 res!86447) b!105006))

(assert (= (and b!105006 res!86450) b!105001))

(assert (= (and b!105001 res!86449) b!104994))

(assert (= (and b!104994 res!86453) b!105000))

(declare-fun m!153943 () Bool)

(assert (=> b!104998 m!153943))

(declare-fun m!153945 () Bool)

(assert (=> b!104998 m!153945))

(declare-fun m!153947 () Bool)

(assert (=> b!105003 m!153947))

(declare-fun m!153949 () Bool)

(assert (=> b!104997 m!153949))

(declare-fun m!153951 () Bool)

(assert (=> b!104997 m!153951))

(declare-fun m!153953 () Bool)

(assert (=> b!104997 m!153953))

(declare-fun m!153955 () Bool)

(assert (=> b!104997 m!153955))

(declare-fun m!153957 () Bool)

(assert (=> b!104997 m!153957))

(declare-fun m!153959 () Bool)

(assert (=> b!104997 m!153959))

(declare-fun m!153961 () Bool)

(assert (=> b!104997 m!153961))

(declare-fun m!153963 () Bool)

(assert (=> b!104997 m!153963))

(declare-fun m!153965 () Bool)

(assert (=> b!104997 m!153965))

(declare-fun m!153967 () Bool)

(assert (=> b!104997 m!153967))

(declare-fun m!153969 () Bool)

(assert (=> b!104997 m!153969))

(declare-fun m!153971 () Bool)

(assert (=> b!104997 m!153971))

(declare-fun m!153973 () Bool)

(assert (=> b!104997 m!153973))

(assert (=> b!104997 m!152743))

(declare-fun m!153975 () Bool)

(assert (=> b!104997 m!153975))

(declare-fun m!153977 () Bool)

(assert (=> b!104997 m!153977))

(declare-fun m!153979 () Bool)

(assert (=> b!104997 m!153979))

(declare-fun m!153981 () Bool)

(assert (=> b!104997 m!153981))

(declare-fun m!153983 () Bool)

(assert (=> b!104997 m!153983))

(declare-fun m!153985 () Bool)

(assert (=> b!104997 m!153985))

(declare-fun m!153987 () Bool)

(assert (=> b!104997 m!153987))

(declare-fun m!153989 () Bool)

(assert (=> b!104997 m!153989))

(declare-fun m!153991 () Bool)

(assert (=> b!104997 m!153991))

(declare-fun m!153993 () Bool)

(assert (=> b!104997 m!153993))

(declare-fun m!153995 () Bool)

(assert (=> b!104997 m!153995))

(declare-fun m!153997 () Bool)

(assert (=> b!104997 m!153997))

(assert (=> b!104997 m!153981))

(declare-fun m!153999 () Bool)

(assert (=> b!104997 m!153999))

(declare-fun m!154001 () Bool)

(assert (=> b!104997 m!154001))

(declare-fun m!154003 () Bool)

(assert (=> b!104997 m!154003))

(declare-fun m!154005 () Bool)

(assert (=> b!104994 m!154005))

(declare-fun m!154007 () Bool)

(assert (=> b!104994 m!154007))

(declare-fun m!154009 () Bool)

(assert (=> b!104994 m!154009))

(assert (=> b!104994 m!153989))

(declare-fun m!154011 () Bool)

(assert (=> b!104994 m!154011))

(declare-fun m!154013 () Bool)

(assert (=> b!105001 m!154013))

(declare-fun m!154015 () Bool)

(assert (=> bm!1310 m!154015))

(declare-fun m!154017 () Bool)

(assert (=> b!105006 m!154017))

(assert (=> b!105006 m!152743))

(declare-fun m!154019 () Bool)

(assert (=> b!105000 m!154019))

(assert (=> b!105004 m!153945))

(assert (=> b!105004 m!152743))

(declare-fun m!154021 () Bool)

(assert (=> b!105005 m!154021))

(assert (=> b!105005 m!154021))

(declare-fun m!154023 () Bool)

(assert (=> b!105005 m!154023))

(assert (=> b!104409 d!32782))

(declare-fun d!32784 () Bool)

(declare-fun lt!154459 () tuple2!8632)

(declare-fun lt!154460 () tuple2!8632)

(assert (=> d!32784 (and (= (_2!4571 lt!154459) (_2!4571 lt!154460)) (= (_1!4571 lt!154459) (_1!4571 lt!154460)))))

(declare-fun lt!154461 () Unit!6390)

(declare-fun lt!154457 () Bool)

(declare-fun lt!154456 () BitStream!3920)

(declare-fun lt!154458 () (_ BitVec 64))

(assert (=> d!32784 (= lt!154461 (choose!45 (_1!4572 lt!153259) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!153282 lt!154459 (tuple2!8633 (_1!4571 lt!154459) (_2!4571 lt!154459)) (_1!4571 lt!154459) (_2!4571 lt!154459) lt!154457 lt!154456 lt!154458 lt!154460 (tuple2!8633 (_1!4571 lt!154460) (_2!4571 lt!154460)) (_1!4571 lt!154460) (_2!4571 lt!154460)))))

(assert (=> d!32784 (= lt!154460 (readNLeastSignificantBitsLoopPure!0 lt!154456 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!154458))))

(assert (=> d!32784 (= lt!154458 (bvor lt!153282 (ite lt!154457 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32784 (= lt!154456 (withMovedBitIndex!0 (_1!4572 lt!153259) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!32784 (= lt!154457 (_2!4573 (readBitPure!0 (_1!4572 lt!153259))))))

(assert (=> d!32784 (= lt!154459 (readNLeastSignificantBitsLoopPure!0 (_1!4572 lt!153259) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!153282))))

(assert (=> d!32784 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4572 lt!153259) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!153282) lt!154461)))

(declare-fun bs!8022 () Bool)

(assert (= bs!8022 d!32784))

(declare-fun m!154025 () Bool)

(assert (=> bs!8022 m!154025))

(assert (=> bs!8022 m!152747))

(declare-fun m!154027 () Bool)

(assert (=> bs!8022 m!154027))

(assert (=> bs!8022 m!152737))

(assert (=> bs!8022 m!152751))

(assert (=> b!104409 d!32784))

(declare-fun d!32786 () Bool)

(declare-fun e!68774 () Bool)

(assert (=> d!32786 e!68774))

(declare-fun res!86457 () Bool)

(assert (=> d!32786 (=> (not res!86457) (not e!68774))))

(declare-fun lt!154463 () (_ BitVec 64))

(declare-fun lt!154462 () (_ BitVec 64))

(declare-fun lt!154467 () (_ BitVec 64))

(assert (=> d!32786 (= res!86457 (= lt!154463 (bvsub lt!154462 lt!154467)))))

(assert (=> d!32786 (or (= (bvand lt!154462 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!154467 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!154462 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!154462 lt!154467) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32786 (= lt!154467 (remainingBits!0 ((_ sign_extend 32) (size!2223 (buf!2589 (_1!4573 lt!153267)))) ((_ sign_extend 32) (currentByte!5074 (_1!4573 lt!153267))) ((_ sign_extend 32) (currentBit!5069 (_1!4573 lt!153267)))))))

(declare-fun lt!154464 () (_ BitVec 64))

(declare-fun lt!154466 () (_ BitVec 64))

(assert (=> d!32786 (= lt!154462 (bvmul lt!154464 lt!154466))))

(assert (=> d!32786 (or (= lt!154464 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!154466 (bvsdiv (bvmul lt!154464 lt!154466) lt!154464)))))

(assert (=> d!32786 (= lt!154466 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32786 (= lt!154464 ((_ sign_extend 32) (size!2223 (buf!2589 (_1!4573 lt!153267)))))))

(assert (=> d!32786 (= lt!154463 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5074 (_1!4573 lt!153267))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5069 (_1!4573 lt!153267)))))))

(assert (=> d!32786 (invariant!0 (currentBit!5069 (_1!4573 lt!153267)) (currentByte!5074 (_1!4573 lt!153267)) (size!2223 (buf!2589 (_1!4573 lt!153267))))))

(assert (=> d!32786 (= (bitIndex!0 (size!2223 (buf!2589 (_1!4573 lt!153267))) (currentByte!5074 (_1!4573 lt!153267)) (currentBit!5069 (_1!4573 lt!153267))) lt!154463)))

(declare-fun b!105007 () Bool)

(declare-fun res!86456 () Bool)

(assert (=> b!105007 (=> (not res!86456) (not e!68774))))

(assert (=> b!105007 (= res!86456 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!154463))))

(declare-fun b!105008 () Bool)

(declare-fun lt!154465 () (_ BitVec 64))

(assert (=> b!105008 (= e!68774 (bvsle lt!154463 (bvmul lt!154465 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!105008 (or (= lt!154465 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!154465 #b0000000000000000000000000000000000000000000000000000000000001000) lt!154465)))))

(assert (=> b!105008 (= lt!154465 ((_ sign_extend 32) (size!2223 (buf!2589 (_1!4573 lt!153267)))))))

(assert (= (and d!32786 res!86457) b!105007))

(assert (= (and b!105007 res!86456) b!105008))

(declare-fun m!154029 () Bool)

(assert (=> d!32786 m!154029))

(declare-fun m!154031 () Bool)

(assert (=> d!32786 m!154031))

(assert (=> b!104409 d!32786))

(declare-fun d!32788 () Bool)

(declare-fun e!68775 () Bool)

(assert (=> d!32788 e!68775))

(declare-fun res!86458 () Bool)

(assert (=> d!32788 (=> (not res!86458) (not e!68775))))

(declare-fun lt!154468 () BitStream!3920)

(declare-fun lt!154469 () (_ BitVec 64))

(assert (=> d!32788 (= res!86458 (= (bvadd lt!154469 (bvsub (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!152884))) (currentByte!5074 (_2!4570 lt!152884)) (currentBit!5069 (_2!4570 lt!152884))) (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!153257))) (currentByte!5074 (_2!4570 lt!153257)) (currentBit!5069 (_2!4570 lt!153257))))) (bitIndex!0 (size!2223 (buf!2589 lt!154468)) (currentByte!5074 lt!154468) (currentBit!5069 lt!154468))))))

(assert (=> d!32788 (or (not (= (bvand lt!154469 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!152884))) (currentByte!5074 (_2!4570 lt!152884)) (currentBit!5069 (_2!4570 lt!152884))) (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!153257))) (currentByte!5074 (_2!4570 lt!153257)) (currentBit!5069 (_2!4570 lt!153257)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!154469 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!154469 (bvsub (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!152884))) (currentByte!5074 (_2!4570 lt!152884)) (currentBit!5069 (_2!4570 lt!152884))) (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!153257))) (currentByte!5074 (_2!4570 lt!153257)) (currentBit!5069 (_2!4570 lt!153257))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32788 (= lt!154469 (bitIndex!0 (size!2223 (buf!2589 (_2!4572 lt!153259))) (currentByte!5074 (_2!4572 lt!153259)) (currentBit!5069 (_2!4572 lt!153259))))))

(assert (=> d!32788 (= lt!154468 (_2!4570 (moveBitIndex!0 (_2!4572 lt!153259) (bvsub (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!152884))) (currentByte!5074 (_2!4570 lt!152884)) (currentBit!5069 (_2!4570 lt!152884))) (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!153257))) (currentByte!5074 (_2!4570 lt!153257)) (currentBit!5069 (_2!4570 lt!153257)))))))))

(assert (=> d!32788 (moveBitIndexPrecond!0 (_2!4572 lt!153259) (bvsub (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!152884))) (currentByte!5074 (_2!4570 lt!152884)) (currentBit!5069 (_2!4570 lt!152884))) (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!153257))) (currentByte!5074 (_2!4570 lt!153257)) (currentBit!5069 (_2!4570 lt!153257)))))))

(assert (=> d!32788 (= (withMovedBitIndex!0 (_2!4572 lt!153259) (bvsub (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!152884))) (currentByte!5074 (_2!4570 lt!152884)) (currentBit!5069 (_2!4570 lt!152884))) (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!153257))) (currentByte!5074 (_2!4570 lt!153257)) (currentBit!5069 (_2!4570 lt!153257))))) lt!154468)))

(declare-fun b!105009 () Bool)

(assert (=> b!105009 (= e!68775 (= (size!2223 (buf!2589 (_2!4572 lt!153259))) (size!2223 (buf!2589 lt!154468))))))

(assert (= (and d!32788 res!86458) b!105009))

(declare-fun m!154033 () Bool)

(assert (=> d!32788 m!154033))

(declare-fun m!154035 () Bool)

(assert (=> d!32788 m!154035))

(declare-fun m!154037 () Bool)

(assert (=> d!32788 m!154037))

(declare-fun m!154039 () Bool)

(assert (=> d!32788 m!154039))

(assert (=> b!104409 d!32788))

(declare-fun d!32790 () Bool)

(declare-fun e!68776 () Bool)

(assert (=> d!32790 e!68776))

(declare-fun res!86459 () Bool)

(assert (=> d!32790 (=> (not res!86459) (not e!68776))))

(declare-fun lt!154470 () BitStream!3920)

(declare-fun lt!154471 () (_ BitVec 64))

(assert (=> d!32790 (= res!86459 (= (bvadd lt!154471 (bvsub (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!153261))) (currentByte!5074 (_2!4570 lt!153261)) (currentBit!5069 (_2!4570 lt!153261))) (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!153257))) (currentByte!5074 (_2!4570 lt!153257)) (currentBit!5069 (_2!4570 lt!153257))))) (bitIndex!0 (size!2223 (buf!2589 lt!154470)) (currentByte!5074 lt!154470) (currentBit!5069 lt!154470))))))

(assert (=> d!32790 (or (not (= (bvand lt!154471 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!153261))) (currentByte!5074 (_2!4570 lt!153261)) (currentBit!5069 (_2!4570 lt!153261))) (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!153257))) (currentByte!5074 (_2!4570 lt!153257)) (currentBit!5069 (_2!4570 lt!153257)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!154471 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!154471 (bvsub (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!153261))) (currentByte!5074 (_2!4570 lt!153261)) (currentBit!5069 (_2!4570 lt!153261))) (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!153257))) (currentByte!5074 (_2!4570 lt!153257)) (currentBit!5069 (_2!4570 lt!153257))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32790 (= lt!154471 (bitIndex!0 (size!2223 (buf!2589 (_2!4572 lt!153276))) (currentByte!5074 (_2!4572 lt!153276)) (currentBit!5069 (_2!4572 lt!153276))))))

(assert (=> d!32790 (= lt!154470 (_2!4570 (moveBitIndex!0 (_2!4572 lt!153276) (bvsub (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!153261))) (currentByte!5074 (_2!4570 lt!153261)) (currentBit!5069 (_2!4570 lt!153261))) (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!153257))) (currentByte!5074 (_2!4570 lt!153257)) (currentBit!5069 (_2!4570 lt!153257)))))))))

(assert (=> d!32790 (moveBitIndexPrecond!0 (_2!4572 lt!153276) (bvsub (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!153261))) (currentByte!5074 (_2!4570 lt!153261)) (currentBit!5069 (_2!4570 lt!153261))) (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!153257))) (currentByte!5074 (_2!4570 lt!153257)) (currentBit!5069 (_2!4570 lt!153257)))))))

(assert (=> d!32790 (= (withMovedBitIndex!0 (_2!4572 lt!153276) (bvsub (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!153261))) (currentByte!5074 (_2!4570 lt!153261)) (currentBit!5069 (_2!4570 lt!153261))) (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!153257))) (currentByte!5074 (_2!4570 lt!153257)) (currentBit!5069 (_2!4570 lt!153257))))) lt!154470)))

(declare-fun b!105010 () Bool)

(assert (=> b!105010 (= e!68776 (= (size!2223 (buf!2589 (_2!4572 lt!153276))) (size!2223 (buf!2589 lt!154470))))))

(assert (= (and d!32790 res!86459) b!105010))

(declare-fun m!154041 () Bool)

(assert (=> d!32790 m!154041))

(declare-fun m!154043 () Bool)

(assert (=> d!32790 m!154043))

(declare-fun m!154045 () Bool)

(assert (=> d!32790 m!154045))

(declare-fun m!154047 () Bool)

(assert (=> d!32790 m!154047))

(assert (=> b!104409 d!32790))

(declare-fun d!32792 () Bool)

(declare-fun lt!154472 () tuple2!8648)

(assert (=> d!32792 (= lt!154472 (readBit!0 lt!153270))))

(assert (=> d!32792 (= (readBitPure!0 lt!153270) (tuple2!8637 (_2!4579 lt!154472) (_1!4579 lt!154472)))))

(declare-fun bs!8023 () Bool)

(assert (= bs!8023 d!32792))

(declare-fun m!154049 () Bool)

(assert (=> bs!8023 m!154049))

(assert (=> b!104409 d!32792))

(declare-fun b!105011 () Bool)

(declare-fun e!68777 () Unit!6390)

(declare-fun Unit!6437 () Unit!6390)

(assert (=> b!105011 (= e!68777 Unit!6437)))

(declare-fun b!105012 () Bool)

(declare-fun res!86460 () Bool)

(declare-fun e!68778 () Bool)

(assert (=> b!105012 (=> (not res!86460) (not e!68778))))

(declare-fun lt!154484 () tuple2!8634)

(assert (=> b!105012 (= res!86460 (isPrefixOf!0 (_2!4572 lt!154484) (_2!4570 lt!153257)))))

(declare-fun b!105013 () Bool)

(declare-fun lt!154481 () Unit!6390)

(assert (=> b!105013 (= e!68777 lt!154481)))

(declare-fun lt!154487 () (_ BitVec 64))

(assert (=> b!105013 (= lt!154487 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!154486 () (_ BitVec 64))

(assert (=> b!105013 (= lt!154486 (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!153261))) (currentByte!5074 (_2!4570 lt!153261)) (currentBit!5069 (_2!4570 lt!153261))))))

(assert (=> b!105013 (= lt!154481 (arrayBitRangesEqSymmetric!0 (buf!2589 (_2!4570 lt!153261)) (buf!2589 (_2!4570 lt!153257)) lt!154487 lt!154486))))

(assert (=> b!105013 (arrayBitRangesEq!0 (buf!2589 (_2!4570 lt!153257)) (buf!2589 (_2!4570 lt!153261)) lt!154487 lt!154486)))

(declare-fun d!32794 () Bool)

(assert (=> d!32794 e!68778))

(declare-fun res!86461 () Bool)

(assert (=> d!32794 (=> (not res!86461) (not e!68778))))

(assert (=> d!32794 (= res!86461 (isPrefixOf!0 (_1!4572 lt!154484) (_2!4572 lt!154484)))))

(declare-fun lt!154483 () BitStream!3920)

(assert (=> d!32794 (= lt!154484 (tuple2!8635 lt!154483 (_2!4570 lt!153257)))))

(declare-fun lt!154475 () Unit!6390)

(declare-fun lt!154488 () Unit!6390)

(assert (=> d!32794 (= lt!154475 lt!154488)))

(assert (=> d!32794 (isPrefixOf!0 lt!154483 (_2!4570 lt!153257))))

(assert (=> d!32794 (= lt!154488 (lemmaIsPrefixTransitive!0 lt!154483 (_2!4570 lt!153257) (_2!4570 lt!153257)))))

(declare-fun lt!154485 () Unit!6390)

(declare-fun lt!154491 () Unit!6390)

(assert (=> d!32794 (= lt!154485 lt!154491)))

(assert (=> d!32794 (isPrefixOf!0 lt!154483 (_2!4570 lt!153257))))

(assert (=> d!32794 (= lt!154491 (lemmaIsPrefixTransitive!0 lt!154483 (_2!4570 lt!153261) (_2!4570 lt!153257)))))

(declare-fun lt!154492 () Unit!6390)

(assert (=> d!32794 (= lt!154492 e!68777)))

(declare-fun c!6480 () Bool)

(assert (=> d!32794 (= c!6480 (not (= (size!2223 (buf!2589 (_2!4570 lt!153261))) #b00000000000000000000000000000000)))))

(declare-fun lt!154489 () Unit!6390)

(declare-fun lt!154482 () Unit!6390)

(assert (=> d!32794 (= lt!154489 lt!154482)))

(assert (=> d!32794 (isPrefixOf!0 (_2!4570 lt!153257) (_2!4570 lt!153257))))

(assert (=> d!32794 (= lt!154482 (lemmaIsPrefixRefl!0 (_2!4570 lt!153257)))))

(declare-fun lt!154473 () Unit!6390)

(declare-fun lt!154490 () Unit!6390)

(assert (=> d!32794 (= lt!154473 lt!154490)))

(assert (=> d!32794 (= lt!154490 (lemmaIsPrefixRefl!0 (_2!4570 lt!153257)))))

(declare-fun lt!154480 () Unit!6390)

(declare-fun lt!154478 () Unit!6390)

(assert (=> d!32794 (= lt!154480 lt!154478)))

(assert (=> d!32794 (isPrefixOf!0 lt!154483 lt!154483)))

(assert (=> d!32794 (= lt!154478 (lemmaIsPrefixRefl!0 lt!154483))))

(declare-fun lt!154474 () Unit!6390)

(declare-fun lt!154479 () Unit!6390)

(assert (=> d!32794 (= lt!154474 lt!154479)))

(assert (=> d!32794 (isPrefixOf!0 (_2!4570 lt!153261) (_2!4570 lt!153261))))

(assert (=> d!32794 (= lt!154479 (lemmaIsPrefixRefl!0 (_2!4570 lt!153261)))))

(assert (=> d!32794 (= lt!154483 (BitStream!3921 (buf!2589 (_2!4570 lt!153257)) (currentByte!5074 (_2!4570 lt!153261)) (currentBit!5069 (_2!4570 lt!153261))))))

(assert (=> d!32794 (isPrefixOf!0 (_2!4570 lt!153261) (_2!4570 lt!153257))))

(assert (=> d!32794 (= (reader!0 (_2!4570 lt!153261) (_2!4570 lt!153257)) lt!154484)))

(declare-fun lt!154476 () (_ BitVec 64))

(declare-fun b!105014 () Bool)

(declare-fun lt!154477 () (_ BitVec 64))

(assert (=> b!105014 (= e!68778 (= (_1!4572 lt!154484) (withMovedBitIndex!0 (_2!4572 lt!154484) (bvsub lt!154477 lt!154476))))))

(assert (=> b!105014 (or (= (bvand lt!154477 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!154476 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!154477 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!154477 lt!154476) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!105014 (= lt!154476 (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!153257))) (currentByte!5074 (_2!4570 lt!153257)) (currentBit!5069 (_2!4570 lt!153257))))))

(assert (=> b!105014 (= lt!154477 (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!153261))) (currentByte!5074 (_2!4570 lt!153261)) (currentBit!5069 (_2!4570 lt!153261))))))

(declare-fun b!105015 () Bool)

(declare-fun res!86462 () Bool)

(assert (=> b!105015 (=> (not res!86462) (not e!68778))))

(assert (=> b!105015 (= res!86462 (isPrefixOf!0 (_1!4572 lt!154484) (_2!4570 lt!153261)))))

(assert (= (and d!32794 c!6480) b!105013))

(assert (= (and d!32794 (not c!6480)) b!105011))

(assert (= (and d!32794 res!86461) b!105015))

(assert (= (and b!105015 res!86462) b!105012))

(assert (= (and b!105012 res!86460) b!105014))

(declare-fun m!154051 () Bool)

(assert (=> d!32794 m!154051))

(declare-fun m!154053 () Bool)

(assert (=> d!32794 m!154053))

(declare-fun m!154055 () Bool)

(assert (=> d!32794 m!154055))

(declare-fun m!154057 () Bool)

(assert (=> d!32794 m!154057))

(declare-fun m!154059 () Bool)

(assert (=> d!32794 m!154059))

(declare-fun m!154061 () Bool)

(assert (=> d!32794 m!154061))

(declare-fun m!154063 () Bool)

(assert (=> d!32794 m!154063))

(declare-fun m!154065 () Bool)

(assert (=> d!32794 m!154065))

(declare-fun m!154067 () Bool)

(assert (=> d!32794 m!154067))

(declare-fun m!154069 () Bool)

(assert (=> d!32794 m!154069))

(declare-fun m!154071 () Bool)

(assert (=> d!32794 m!154071))

(assert (=> b!105013 m!152743))

(declare-fun m!154073 () Bool)

(assert (=> b!105013 m!154073))

(declare-fun m!154075 () Bool)

(assert (=> b!105013 m!154075))

(declare-fun m!154077 () Bool)

(assert (=> b!105014 m!154077))

(assert (=> b!105014 m!152757))

(assert (=> b!105014 m!152743))

(declare-fun m!154079 () Bool)

(assert (=> b!105015 m!154079))

(declare-fun m!154081 () Bool)

(assert (=> b!105012 m!154081))

(assert (=> b!104409 d!32794))

(declare-fun d!32796 () Bool)

(assert (=> d!32796 (isPrefixOf!0 (_2!4570 lt!152884) (_2!4570 lt!153257))))

(declare-fun lt!154493 () Unit!6390)

(assert (=> d!32796 (= lt!154493 (choose!30 (_2!4570 lt!152884) (_2!4570 lt!153261) (_2!4570 lt!153257)))))

(assert (=> d!32796 (isPrefixOf!0 (_2!4570 lt!152884) (_2!4570 lt!153261))))

(assert (=> d!32796 (= (lemmaIsPrefixTransitive!0 (_2!4570 lt!152884) (_2!4570 lt!153261) (_2!4570 lt!153257)) lt!154493)))

(declare-fun bs!8024 () Bool)

(assert (= bs!8024 d!32796))

(assert (=> bs!8024 m!152707))

(declare-fun m!154083 () Bool)

(assert (=> bs!8024 m!154083))

(declare-fun m!154085 () Bool)

(assert (=> bs!8024 m!154085))

(assert (=> b!104409 d!32796))

(declare-fun d!32798 () Bool)

(declare-fun lt!154494 () tuple2!8638)

(assert (=> d!32798 (= lt!154494 (readNLeastSignificantBitsLoop!0 (withMovedBitIndex!0 (_1!4572 lt!153259) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!153282 e!68402)))))

(assert (=> d!32798 (= (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4572 lt!153259) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!153282 e!68402)) (tuple2!8633 (_2!4574 lt!154494) (_1!4574 lt!154494)))))

(declare-fun bs!8025 () Bool)

(assert (= bs!8025 d!32798))

(assert (=> bs!8025 m!152737))

(declare-fun m!154087 () Bool)

(assert (=> bs!8025 m!154087))

(assert (=> b!104409 d!32798))

(declare-fun b!105016 () Bool)

(declare-fun e!68779 () Unit!6390)

(declare-fun Unit!6438 () Unit!6390)

(assert (=> b!105016 (= e!68779 Unit!6438)))

(declare-fun b!105017 () Bool)

(declare-fun res!86463 () Bool)

(declare-fun e!68780 () Bool)

(assert (=> b!105017 (=> (not res!86463) (not e!68780))))

(declare-fun lt!154506 () tuple2!8634)

(assert (=> b!105017 (= res!86463 (isPrefixOf!0 (_2!4572 lt!154506) (_2!4570 lt!153257)))))

(declare-fun b!105018 () Bool)

(declare-fun lt!154503 () Unit!6390)

(assert (=> b!105018 (= e!68779 lt!154503)))

(declare-fun lt!154509 () (_ BitVec 64))

(assert (=> b!105018 (= lt!154509 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!154508 () (_ BitVec 64))

(assert (=> b!105018 (= lt!154508 (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!152884))) (currentByte!5074 (_2!4570 lt!152884)) (currentBit!5069 (_2!4570 lt!152884))))))

(assert (=> b!105018 (= lt!154503 (arrayBitRangesEqSymmetric!0 (buf!2589 (_2!4570 lt!152884)) (buf!2589 (_2!4570 lt!153257)) lt!154509 lt!154508))))

(assert (=> b!105018 (arrayBitRangesEq!0 (buf!2589 (_2!4570 lt!153257)) (buf!2589 (_2!4570 lt!152884)) lt!154509 lt!154508)))

(declare-fun d!32800 () Bool)

(assert (=> d!32800 e!68780))

(declare-fun res!86464 () Bool)

(assert (=> d!32800 (=> (not res!86464) (not e!68780))))

(assert (=> d!32800 (= res!86464 (isPrefixOf!0 (_1!4572 lt!154506) (_2!4572 lt!154506)))))

(declare-fun lt!154505 () BitStream!3920)

(assert (=> d!32800 (= lt!154506 (tuple2!8635 lt!154505 (_2!4570 lt!153257)))))

(declare-fun lt!154497 () Unit!6390)

(declare-fun lt!154510 () Unit!6390)

(assert (=> d!32800 (= lt!154497 lt!154510)))

(assert (=> d!32800 (isPrefixOf!0 lt!154505 (_2!4570 lt!153257))))

(assert (=> d!32800 (= lt!154510 (lemmaIsPrefixTransitive!0 lt!154505 (_2!4570 lt!153257) (_2!4570 lt!153257)))))

(declare-fun lt!154507 () Unit!6390)

(declare-fun lt!154513 () Unit!6390)

(assert (=> d!32800 (= lt!154507 lt!154513)))

(assert (=> d!32800 (isPrefixOf!0 lt!154505 (_2!4570 lt!153257))))

(assert (=> d!32800 (= lt!154513 (lemmaIsPrefixTransitive!0 lt!154505 (_2!4570 lt!152884) (_2!4570 lt!153257)))))

(declare-fun lt!154514 () Unit!6390)

(assert (=> d!32800 (= lt!154514 e!68779)))

(declare-fun c!6481 () Bool)

(assert (=> d!32800 (= c!6481 (not (= (size!2223 (buf!2589 (_2!4570 lt!152884))) #b00000000000000000000000000000000)))))

(declare-fun lt!154511 () Unit!6390)

(declare-fun lt!154504 () Unit!6390)

(assert (=> d!32800 (= lt!154511 lt!154504)))

(assert (=> d!32800 (isPrefixOf!0 (_2!4570 lt!153257) (_2!4570 lt!153257))))

(assert (=> d!32800 (= lt!154504 (lemmaIsPrefixRefl!0 (_2!4570 lt!153257)))))

(declare-fun lt!154495 () Unit!6390)

(declare-fun lt!154512 () Unit!6390)

(assert (=> d!32800 (= lt!154495 lt!154512)))

(assert (=> d!32800 (= lt!154512 (lemmaIsPrefixRefl!0 (_2!4570 lt!153257)))))

(declare-fun lt!154502 () Unit!6390)

(declare-fun lt!154500 () Unit!6390)

(assert (=> d!32800 (= lt!154502 lt!154500)))

(assert (=> d!32800 (isPrefixOf!0 lt!154505 lt!154505)))

(assert (=> d!32800 (= lt!154500 (lemmaIsPrefixRefl!0 lt!154505))))

(declare-fun lt!154496 () Unit!6390)

(declare-fun lt!154501 () Unit!6390)

(assert (=> d!32800 (= lt!154496 lt!154501)))

(assert (=> d!32800 (isPrefixOf!0 (_2!4570 lt!152884) (_2!4570 lt!152884))))

(assert (=> d!32800 (= lt!154501 (lemmaIsPrefixRefl!0 (_2!4570 lt!152884)))))

(assert (=> d!32800 (= lt!154505 (BitStream!3921 (buf!2589 (_2!4570 lt!153257)) (currentByte!5074 (_2!4570 lt!152884)) (currentBit!5069 (_2!4570 lt!152884))))))

(assert (=> d!32800 (isPrefixOf!0 (_2!4570 lt!152884) (_2!4570 lt!153257))))

(assert (=> d!32800 (= (reader!0 (_2!4570 lt!152884) (_2!4570 lt!153257)) lt!154506)))

(declare-fun b!105019 () Bool)

(declare-fun lt!154498 () (_ BitVec 64))

(declare-fun lt!154499 () (_ BitVec 64))

(assert (=> b!105019 (= e!68780 (= (_1!4572 lt!154506) (withMovedBitIndex!0 (_2!4572 lt!154506) (bvsub lt!154499 lt!154498))))))

(assert (=> b!105019 (or (= (bvand lt!154499 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!154498 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!154499 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!154499 lt!154498) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!105019 (= lt!154498 (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!153257))) (currentByte!5074 (_2!4570 lt!153257)) (currentBit!5069 (_2!4570 lt!153257))))))

(assert (=> b!105019 (= lt!154499 (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!152884))) (currentByte!5074 (_2!4570 lt!152884)) (currentBit!5069 (_2!4570 lt!152884))))))

(declare-fun b!105020 () Bool)

(declare-fun res!86465 () Bool)

(assert (=> b!105020 (=> (not res!86465) (not e!68780))))

(assert (=> b!105020 (= res!86465 (isPrefixOf!0 (_1!4572 lt!154506) (_2!4570 lt!152884)))))

(assert (= (and d!32800 c!6481) b!105018))

(assert (= (and d!32800 (not c!6481)) b!105016))

(assert (= (and d!32800 res!86464) b!105020))

(assert (= (and b!105020 res!86465) b!105017))

(assert (= (and b!105017 res!86463) b!105019))

(declare-fun m!154089 () Bool)

(assert (=> d!32800 m!154089))

(declare-fun m!154091 () Bool)

(assert (=> d!32800 m!154091))

(declare-fun m!154093 () Bool)

(assert (=> d!32800 m!154093))

(assert (=> d!32800 m!154057))

(declare-fun m!154095 () Bool)

(assert (=> d!32800 m!154095))

(declare-fun m!154097 () Bool)

(assert (=> d!32800 m!154097))

(assert (=> d!32800 m!154063))

(declare-fun m!154099 () Bool)

(assert (=> d!32800 m!154099))

(assert (=> d!32800 m!152707))

(assert (=> d!32800 m!152915))

(assert (=> d!32800 m!152917))

(assert (=> b!105018 m!152527))

(declare-fun m!154101 () Bool)

(assert (=> b!105018 m!154101))

(declare-fun m!154103 () Bool)

(assert (=> b!105018 m!154103))

(declare-fun m!154105 () Bool)

(assert (=> b!105019 m!154105))

(assert (=> b!105019 m!152757))

(assert (=> b!105019 m!152527))

(declare-fun m!154107 () Bool)

(assert (=> b!105020 m!154107))

(declare-fun m!154109 () Bool)

(assert (=> b!105017 m!154109))

(assert (=> b!104409 d!32800))

(declare-fun d!32802 () Bool)

(declare-fun lt!154515 () tuple2!8648)

(assert (=> d!32802 (= lt!154515 (readBit!0 (_1!4572 lt!153259)))))

(assert (=> d!32802 (= (readBitPure!0 (_1!4572 lt!153259)) (tuple2!8637 (_2!4579 lt!154515) (_1!4579 lt!154515)))))

(declare-fun bs!8026 () Bool)

(assert (= bs!8026 d!32802))

(declare-fun m!154111 () Bool)

(assert (=> bs!8026 m!154111))

(assert (=> b!104409 d!32802))

(declare-fun d!32804 () Bool)

(declare-fun e!68781 () Bool)

(assert (=> d!32804 e!68781))

(declare-fun res!86467 () Bool)

(assert (=> d!32804 (=> (not res!86467) (not e!68781))))

(declare-fun lt!154517 () (_ BitVec 64))

(declare-fun lt!154516 () (_ BitVec 64))

(declare-fun lt!154521 () (_ BitVec 64))

(assert (=> d!32804 (= res!86467 (= lt!154517 (bvsub lt!154516 lt!154521)))))

(assert (=> d!32804 (or (= (bvand lt!154516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!154521 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!154516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!154516 lt!154521) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32804 (= lt!154521 (remainingBits!0 ((_ sign_extend 32) (size!2223 (buf!2589 (_2!4570 lt!153261)))) ((_ sign_extend 32) (currentByte!5074 (_2!4570 lt!153261))) ((_ sign_extend 32) (currentBit!5069 (_2!4570 lt!153261)))))))

(declare-fun lt!154518 () (_ BitVec 64))

(declare-fun lt!154520 () (_ BitVec 64))

(assert (=> d!32804 (= lt!154516 (bvmul lt!154518 lt!154520))))

(assert (=> d!32804 (or (= lt!154518 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!154520 (bvsdiv (bvmul lt!154518 lt!154520) lt!154518)))))

(assert (=> d!32804 (= lt!154520 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32804 (= lt!154518 ((_ sign_extend 32) (size!2223 (buf!2589 (_2!4570 lt!153261)))))))

(assert (=> d!32804 (= lt!154517 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5074 (_2!4570 lt!153261))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5069 (_2!4570 lt!153261)))))))

(assert (=> d!32804 (invariant!0 (currentBit!5069 (_2!4570 lt!153261)) (currentByte!5074 (_2!4570 lt!153261)) (size!2223 (buf!2589 (_2!4570 lt!153261))))))

(assert (=> d!32804 (= (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!153261))) (currentByte!5074 (_2!4570 lt!153261)) (currentBit!5069 (_2!4570 lt!153261))) lt!154517)))

(declare-fun b!105021 () Bool)

(declare-fun res!86466 () Bool)

(assert (=> b!105021 (=> (not res!86466) (not e!68781))))

(assert (=> b!105021 (= res!86466 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!154517))))

(declare-fun b!105022 () Bool)

(declare-fun lt!154519 () (_ BitVec 64))

(assert (=> b!105022 (= e!68781 (bvsle lt!154517 (bvmul lt!154519 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!105022 (or (= lt!154519 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!154519 #b0000000000000000000000000000000000000000000000000000000000001000) lt!154519)))))

(assert (=> b!105022 (= lt!154519 ((_ sign_extend 32) (size!2223 (buf!2589 (_2!4570 lt!153261)))))))

(assert (= (and d!32804 res!86467) b!105021))

(assert (= (and b!105021 res!86466) b!105022))

(declare-fun m!154113 () Bool)

(assert (=> d!32804 m!154113))

(declare-fun m!154115 () Bool)

(assert (=> d!32804 m!154115))

(assert (=> b!104409 d!32804))

(declare-fun d!32806 () Bool)

(assert (=> d!32806 (= (invariant!0 (currentBit!5069 lt!153270) (currentByte!5074 lt!153270) (size!2223 (buf!2589 (_2!4570 lt!153257)))) (and (bvsge (currentBit!5069 lt!153270) #b00000000000000000000000000000000) (bvslt (currentBit!5069 lt!153270) #b00000000000000000000000000001000) (bvsge (currentByte!5074 lt!153270) #b00000000000000000000000000000000) (or (bvslt (currentByte!5074 lt!153270) (size!2223 (buf!2589 (_2!4570 lt!153257)))) (and (= (currentBit!5069 lt!153270) #b00000000000000000000000000000000) (= (currentByte!5074 lt!153270) (size!2223 (buf!2589 (_2!4570 lt!153257))))))))))

(assert (=> b!104409 d!32806))

(declare-fun lt!154522 () tuple2!8638)

(declare-fun d!32808 () Bool)

(assert (=> d!32808 (= lt!154522 (readNLeastSignificantBitsLoop!0 (_1!4572 lt!153259) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!153282))))

(assert (=> d!32808 (= (readNLeastSignificantBitsLoopPure!0 (_1!4572 lt!153259) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!153282) (tuple2!8633 (_2!4574 lt!154522) (_1!4574 lt!154522)))))

(declare-fun bs!8027 () Bool)

(assert (= bs!8027 d!32808))

(declare-fun m!154117 () Bool)

(assert (=> bs!8027 m!154117))

(assert (=> b!104409 d!32808))

(declare-fun d!32810 () Bool)

(declare-fun e!68782 () Bool)

(assert (=> d!32810 e!68782))

(declare-fun res!86469 () Bool)

(assert (=> d!32810 (=> (not res!86469) (not e!68782))))

(declare-fun lt!154524 () (_ BitVec 64))

(declare-fun lt!154528 () (_ BitVec 64))

(declare-fun lt!154523 () (_ BitVec 64))

(assert (=> d!32810 (= res!86469 (= lt!154524 (bvsub lt!154523 lt!154528)))))

(assert (=> d!32810 (or (= (bvand lt!154523 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!154528 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!154523 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!154523 lt!154528) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32810 (= lt!154528 (remainingBits!0 ((_ sign_extend 32) (size!2223 (buf!2589 (_1!4573 lt!153293)))) ((_ sign_extend 32) (currentByte!5074 (_1!4573 lt!153293))) ((_ sign_extend 32) (currentBit!5069 (_1!4573 lt!153293)))))))

(declare-fun lt!154525 () (_ BitVec 64))

(declare-fun lt!154527 () (_ BitVec 64))

(assert (=> d!32810 (= lt!154523 (bvmul lt!154525 lt!154527))))

(assert (=> d!32810 (or (= lt!154525 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!154527 (bvsdiv (bvmul lt!154525 lt!154527) lt!154525)))))

(assert (=> d!32810 (= lt!154527 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32810 (= lt!154525 ((_ sign_extend 32) (size!2223 (buf!2589 (_1!4573 lt!153293)))))))

(assert (=> d!32810 (= lt!154524 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5074 (_1!4573 lt!153293))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5069 (_1!4573 lt!153293)))))))

(assert (=> d!32810 (invariant!0 (currentBit!5069 (_1!4573 lt!153293)) (currentByte!5074 (_1!4573 lt!153293)) (size!2223 (buf!2589 (_1!4573 lt!153293))))))

(assert (=> d!32810 (= (bitIndex!0 (size!2223 (buf!2589 (_1!4573 lt!153293))) (currentByte!5074 (_1!4573 lt!153293)) (currentBit!5069 (_1!4573 lt!153293))) lt!154524)))

(declare-fun b!105023 () Bool)

(declare-fun res!86468 () Bool)

(assert (=> b!105023 (=> (not res!86468) (not e!68782))))

(assert (=> b!105023 (= res!86468 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!154524))))

(declare-fun b!105024 () Bool)

(declare-fun lt!154526 () (_ BitVec 64))

(assert (=> b!105024 (= e!68782 (bvsle lt!154524 (bvmul lt!154526 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!105024 (or (= lt!154526 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!154526 #b0000000000000000000000000000000000000000000000000000000000001000) lt!154526)))))

(assert (=> b!105024 (= lt!154526 ((_ sign_extend 32) (size!2223 (buf!2589 (_1!4573 lt!153293)))))))

(assert (= (and d!32810 res!86469) b!105023))

(assert (= (and b!105023 res!86468) b!105024))

(declare-fun m!154119 () Bool)

(assert (=> d!32810 m!154119))

(declare-fun m!154121 () Bool)

(assert (=> d!32810 m!154121))

(assert (=> b!104409 d!32810))

(declare-fun d!32812 () Bool)

(assert (=> d!32812 (= (invariant!0 (currentBit!5069 (_2!4570 lt!152884)) (currentByte!5074 (_2!4570 lt!152884)) (size!2223 (buf!2589 (_2!4570 lt!153261)))) (and (bvsge (currentBit!5069 (_2!4570 lt!152884)) #b00000000000000000000000000000000) (bvslt (currentBit!5069 (_2!4570 lt!152884)) #b00000000000000000000000000001000) (bvsge (currentByte!5074 (_2!4570 lt!152884)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5074 (_2!4570 lt!152884)) (size!2223 (buf!2589 (_2!4570 lt!153261)))) (and (= (currentBit!5069 (_2!4570 lt!152884)) #b00000000000000000000000000000000) (= (currentByte!5074 (_2!4570 lt!152884)) (size!2223 (buf!2589 (_2!4570 lt!153261))))))))))

(assert (=> b!104409 d!32812))

(declare-fun d!32814 () Bool)

(assert (=> d!32814 (validate_offset_bits!1 ((_ sign_extend 32) (size!2223 (buf!2589 (_2!4570 lt!153257)))) ((_ sign_extend 32) (currentByte!5074 (_2!4570 lt!152884))) ((_ sign_extend 32) (currentBit!5069 (_2!4570 lt!152884))) lt!153277)))

(declare-fun lt!154529 () Unit!6390)

(assert (=> d!32814 (= lt!154529 (choose!9 (_2!4570 lt!152884) (buf!2589 (_2!4570 lt!153257)) lt!153277 (BitStream!3921 (buf!2589 (_2!4570 lt!153257)) (currentByte!5074 (_2!4570 lt!152884)) (currentBit!5069 (_2!4570 lt!152884)))))))

(assert (=> d!32814 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4570 lt!152884) (buf!2589 (_2!4570 lt!153257)) lt!153277) lt!154529)))

(declare-fun bs!8028 () Bool)

(assert (= bs!8028 d!32814))

(assert (=> bs!8028 m!152713))

(declare-fun m!154123 () Bool)

(assert (=> bs!8028 m!154123))

(assert (=> b!104409 d!32814))

(declare-fun d!32816 () Bool)

(declare-fun lt!154530 () tuple2!8648)

(assert (=> d!32816 (= lt!154530 (readBit!0 lt!153278))))

(assert (=> d!32816 (= (readBitPure!0 lt!153278) (tuple2!8637 (_2!4579 lt!154530) (_1!4579 lt!154530)))))

(declare-fun bs!8029 () Bool)

(assert (= bs!8029 d!32816))

(declare-fun m!154125 () Bool)

(assert (=> bs!8029 m!154125))

(assert (=> b!104409 d!32816))

(declare-fun d!32818 () Bool)

(assert (=> d!32818 (= (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!104409 d!32818))

(declare-fun d!32820 () Bool)

(declare-fun e!68783 () Bool)

(assert (=> d!32820 e!68783))

(declare-fun res!86470 () Bool)

(assert (=> d!32820 (=> (not res!86470) (not e!68783))))

(declare-fun lt!154532 () (_ BitVec 64))

(declare-fun lt!154531 () BitStream!3920)

(assert (=> d!32820 (= res!86470 (= (bvadd lt!154532 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2223 (buf!2589 lt!154531)) (currentByte!5074 lt!154531) (currentBit!5069 lt!154531))))))

(assert (=> d!32820 (or (not (= (bvand lt!154532 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!154532 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!154532 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32820 (= lt!154532 (bitIndex!0 (size!2223 (buf!2589 (_1!4572 lt!153259))) (currentByte!5074 (_1!4572 lt!153259)) (currentBit!5069 (_1!4572 lt!153259))))))

(assert (=> d!32820 (= lt!154531 (_2!4570 (moveBitIndex!0 (_1!4572 lt!153259) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!32820 (moveBitIndexPrecond!0 (_1!4572 lt!153259) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!32820 (= (withMovedBitIndex!0 (_1!4572 lt!153259) #b0000000000000000000000000000000000000000000000000000000000000001) lt!154531)))

(declare-fun b!105025 () Bool)

(assert (=> b!105025 (= e!68783 (= (size!2223 (buf!2589 (_1!4572 lt!153259))) (size!2223 (buf!2589 lt!154531))))))

(assert (= (and d!32820 res!86470) b!105025))

(declare-fun m!154127 () Bool)

(assert (=> d!32820 m!154127))

(declare-fun m!154129 () Bool)

(assert (=> d!32820 m!154129))

(declare-fun m!154131 () Bool)

(assert (=> d!32820 m!154131))

(declare-fun m!154133 () Bool)

(assert (=> d!32820 m!154133))

(assert (=> b!104409 d!32820))

(declare-fun d!32822 () Bool)

(declare-fun e!68784 () Bool)

(assert (=> d!32822 e!68784))

(declare-fun res!86471 () Bool)

(assert (=> d!32822 (=> (not res!86471) (not e!68784))))

(declare-fun lt!154533 () tuple2!8636)

(declare-fun lt!154534 () tuple2!8636)

(assert (=> d!32822 (= res!86471 (= (bitIndex!0 (size!2223 (buf!2589 (_1!4573 lt!154533))) (currentByte!5074 (_1!4573 lt!154533)) (currentBit!5069 (_1!4573 lt!154533))) (bitIndex!0 (size!2223 (buf!2589 (_1!4573 lt!154534))) (currentByte!5074 (_1!4573 lt!154534)) (currentBit!5069 (_1!4573 lt!154534)))))))

(declare-fun lt!154535 () BitStream!3920)

(declare-fun lt!154536 () Unit!6390)

(assert (=> d!32822 (= lt!154536 (choose!50 lt!153270 (_2!4570 lt!153257) lt!154535 lt!154533 (tuple2!8637 (_1!4573 lt!154533) (_2!4573 lt!154533)) (_1!4573 lt!154533) (_2!4573 lt!154533) lt!154534 (tuple2!8637 (_1!4573 lt!154534) (_2!4573 lt!154534)) (_1!4573 lt!154534) (_2!4573 lt!154534)))))

(assert (=> d!32822 (= lt!154534 (readBitPure!0 lt!154535))))

(assert (=> d!32822 (= lt!154533 (readBitPure!0 lt!153270))))

(assert (=> d!32822 (= lt!154535 (BitStream!3921 (buf!2589 (_2!4570 lt!153257)) (currentByte!5074 lt!153270) (currentBit!5069 lt!153270)))))

(assert (=> d!32822 (invariant!0 (currentBit!5069 lt!153270) (currentByte!5074 lt!153270) (size!2223 (buf!2589 (_2!4570 lt!153257))))))

(assert (=> d!32822 (= (readBitPrefixLemma!0 lt!153270 (_2!4570 lt!153257)) lt!154536)))

(declare-fun b!105026 () Bool)

(assert (=> b!105026 (= e!68784 (= (_2!4573 lt!154533) (_2!4573 lt!154534)))))

(assert (= (and d!32822 res!86471) b!105026))

(assert (=> d!32822 m!152759))

(assert (=> d!32822 m!152735))

(declare-fun m!154135 () Bool)

(assert (=> d!32822 m!154135))

(declare-fun m!154137 () Bool)

(assert (=> d!32822 m!154137))

(declare-fun m!154139 () Bool)

(assert (=> d!32822 m!154139))

(declare-fun m!154141 () Bool)

(assert (=> d!32822 m!154141))

(assert (=> b!104409 d!32822))

(declare-fun lt!154542 () (_ BitVec 64))

(declare-fun lt!154541 () tuple2!8638)

(declare-fun e!68787 () Bool)

(declare-fun b!105027 () Bool)

(assert (=> b!105027 (= e!68787 (= (= (bvand (bvlshr (_1!4574 lt!154541) lt!154542) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!4573 (readBitPure!0 (withMovedBitIndex!0 (_1!4572 lt!152882) #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(assert (=> b!105027 (and (bvsge lt!154542 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!154542 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!154545 () (_ BitVec 32))

(assert (=> b!105027 (= lt!154542 ((_ sign_extend 32) (bvsub lt!154545 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!105027 (or (= (bvand lt!154545 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand lt!154545 #b10000000000000000000000000000000) (bvand (bvsub lt!154545 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!105027 (= lt!154545 (bvsub nBits!396 #b00000000000000000000000000000001))))

(assert (=> b!105027 (or (= (bvand nBits!396 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!105028 () Bool)

(declare-fun e!68786 () tuple2!8638)

(declare-fun lt!154540 () tuple2!8638)

(assert (=> b!105028 (= e!68786 (tuple2!8639 (_1!4574 lt!154540) (_2!4574 lt!154540)))))

(declare-fun lt!154539 () tuple2!8648)

(assert (=> b!105028 (= lt!154539 (readBit!0 (withMovedBitIndex!0 (_1!4572 lt!152882) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!105028 (= lt!154540 (readNLeastSignificantBitsLoop!0 (_2!4579 lt!154539) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!152905 (ite (_1!4579 lt!154539) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!105029 () Bool)

(assert (=> b!105029 (= e!68786 (tuple2!8639 lt!152905 (withMovedBitIndex!0 (_1!4572 lt!152882) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun d!32824 () Bool)

(declare-fun e!68785 () Bool)

(assert (=> d!32824 e!68785))

(declare-fun res!86472 () Bool)

(assert (=> d!32824 (=> (not res!86472) (not e!68785))))

(assert (=> d!32824 (= res!86472 (= (buf!2589 (_2!4574 lt!154541)) (buf!2589 (withMovedBitIndex!0 (_1!4572 lt!152882) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> d!32824 (= lt!154541 e!68786)))

(declare-fun c!6482 () Bool)

(assert (=> d!32824 (= c!6482 (= nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> d!32824 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!32824 (= (readNLeastSignificantBitsLoop!0 (withMovedBitIndex!0 (_1!4572 lt!152882) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!152905) lt!154541)))

(declare-fun b!105030 () Bool)

(declare-fun res!86473 () Bool)

(assert (=> b!105030 (=> (not res!86473) (not e!68785))))

(declare-fun lt!154543 () (_ BitVec 64))

(declare-fun lt!154538 () (_ BitVec 64))

(assert (=> b!105030 (= res!86473 (= (bitIndex!0 (size!2223 (buf!2589 (_2!4574 lt!154541))) (currentByte!5074 (_2!4574 lt!154541)) (currentBit!5069 (_2!4574 lt!154541))) (bvadd lt!154538 lt!154543)))))

(assert (=> b!105030 (or (not (= (bvand lt!154538 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!154543 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!154538 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!154538 lt!154543) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!105030 (= lt!154543 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!105030 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!105030 (= lt!154538 (bitIndex!0 (size!2223 (buf!2589 (withMovedBitIndex!0 (_1!4572 lt!152882) #b0000000000000000000000000000000000000000000000000000000000000001))) (currentByte!5074 (withMovedBitIndex!0 (_1!4572 lt!152882) #b0000000000000000000000000000000000000000000000000000000000000001)) (currentBit!5069 (withMovedBitIndex!0 (_1!4572 lt!152882) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!105031 () Bool)

(declare-fun res!86475 () Bool)

(assert (=> b!105031 (=> (not res!86475) (not e!68785))))

(assert (=> b!105031 (= res!86475 (= (bvand (_1!4574 lt!154541) (onesLSBLong!0 nBits!396)) (_1!4574 lt!154541)))))

(declare-fun b!105032 () Bool)

(assert (=> b!105032 (= e!68785 e!68787)))

(declare-fun res!86476 () Bool)

(assert (=> b!105032 (=> res!86476 e!68787)))

(assert (=> b!105032 (= res!86476 (bvsge (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(declare-fun b!105033 () Bool)

(declare-fun res!86474 () Bool)

(assert (=> b!105033 (=> (not res!86474) (not e!68785))))

(declare-fun lt!154537 () (_ BitVec 64))

(declare-fun lt!154544 () (_ BitVec 64))

(assert (=> b!105033 (= res!86474 (= (bvlshr (_1!4574 lt!154541) lt!154537) (bvlshr lt!152905 lt!154544)))))

(assert (=> b!105033 (and (bvsge lt!154544 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!154544 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!105033 (= lt!154544 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!105033 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!105033 (and (bvsge lt!154537 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!154537 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!105033 (= lt!154537 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!105033 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (= (and d!32824 c!6482) b!105029))

(assert (= (and d!32824 (not c!6482)) b!105028))

(assert (= (and d!32824 res!86472) b!105030))

(assert (= (and b!105030 res!86473) b!105033))

(assert (= (and b!105033 res!86474) b!105031))

(assert (= (and b!105031 res!86475) b!105032))

(assert (= (and b!105032 (not res!86476)) b!105027))

(assert (=> b!105027 m!152523))

(declare-fun m!154143 () Bool)

(assert (=> b!105027 m!154143))

(assert (=> b!105028 m!152523))

(declare-fun m!154145 () Bool)

(assert (=> b!105028 m!154145))

(declare-fun m!154147 () Bool)

(assert (=> b!105028 m!154147))

(declare-fun m!154149 () Bool)

(assert (=> b!105030 m!154149))

(declare-fun m!154151 () Bool)

(assert (=> b!105030 m!154151))

(assert (=> b!105031 m!152463))

(assert (=> d!32408 d!32824))

(declare-fun d!32826 () Bool)

(declare-fun e!68788 () Bool)

(assert (=> d!32826 e!68788))

(declare-fun res!86477 () Bool)

(assert (=> d!32826 (=> (not res!86477) (not e!68788))))

(assert (=> d!32826 (= res!86477 (= (buf!2589 (_2!4570 (increaseBitIndex!0 lt!152897))) (buf!2589 lt!152897)))))

(declare-fun lt!154548 () Bool)

(assert (=> d!32826 (= lt!154548 (not (= (bvand ((_ sign_extend 24) (select (arr!2816 (buf!2589 lt!152897)) (currentByte!5074 lt!152897))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5069 lt!152897)))) #b00000000000000000000000000000000)))))

(declare-fun lt!154549 () tuple2!8648)

(assert (=> d!32826 (= lt!154549 (tuple2!8649 (not (= (bvand ((_ sign_extend 24) (select (arr!2816 (buf!2589 lt!152897)) (currentByte!5074 lt!152897))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5069 lt!152897)))) #b00000000000000000000000000000000)) (_2!4570 (increaseBitIndex!0 lt!152897))))))

(assert (=> d!32826 (validate_offset_bit!0 ((_ sign_extend 32) (size!2223 (buf!2589 lt!152897))) ((_ sign_extend 32) (currentByte!5074 lt!152897)) ((_ sign_extend 32) (currentBit!5069 lt!152897)))))

(assert (=> d!32826 (= (readBit!0 lt!152897) lt!154549)))

(declare-fun lt!154550 () (_ BitVec 64))

(declare-fun b!105034 () Bool)

(declare-fun lt!154546 () (_ BitVec 64))

(assert (=> b!105034 (= e!68788 (= (bitIndex!0 (size!2223 (buf!2589 (_2!4570 (increaseBitIndex!0 lt!152897)))) (currentByte!5074 (_2!4570 (increaseBitIndex!0 lt!152897))) (currentBit!5069 (_2!4570 (increaseBitIndex!0 lt!152897)))) (bvadd lt!154546 lt!154550)))))

(assert (=> b!105034 (or (not (= (bvand lt!154546 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!154550 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!154546 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!154546 lt!154550) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!105034 (= lt!154550 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!105034 (= lt!154546 (bitIndex!0 (size!2223 (buf!2589 lt!152897)) (currentByte!5074 lt!152897) (currentBit!5069 lt!152897)))))

(declare-fun lt!154552 () Bool)

(assert (=> b!105034 (= lt!154552 (not (= (bvand ((_ sign_extend 24) (select (arr!2816 (buf!2589 lt!152897)) (currentByte!5074 lt!152897))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5069 lt!152897)))) #b00000000000000000000000000000000)))))

(declare-fun lt!154551 () Bool)

(assert (=> b!105034 (= lt!154551 (not (= (bvand ((_ sign_extend 24) (select (arr!2816 (buf!2589 lt!152897)) (currentByte!5074 lt!152897))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5069 lt!152897)))) #b00000000000000000000000000000000)))))

(declare-fun lt!154547 () Bool)

(assert (=> b!105034 (= lt!154547 (not (= (bvand ((_ sign_extend 24) (select (arr!2816 (buf!2589 lt!152897)) (currentByte!5074 lt!152897))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5069 lt!152897)))) #b00000000000000000000000000000000)))))

(assert (= (and d!32826 res!86477) b!105034))

(declare-fun m!154153 () Bool)

(assert (=> d!32826 m!154153))

(declare-fun m!154155 () Bool)

(assert (=> d!32826 m!154155))

(declare-fun m!154157 () Bool)

(assert (=> d!32826 m!154157))

(declare-fun m!154159 () Bool)

(assert (=> d!32826 m!154159))

(assert (=> b!105034 m!154157))

(declare-fun m!154161 () Bool)

(assert (=> b!105034 m!154161))

(assert (=> b!105034 m!154155))

(assert (=> b!105034 m!154153))

(declare-fun m!154163 () Bool)

(assert (=> b!105034 m!154163))

(assert (=> d!32340 d!32826))

(declare-fun d!32828 () Bool)

(declare-fun res!86478 () Bool)

(declare-fun e!68789 () Bool)

(assert (=> d!32828 (=> (not res!86478) (not e!68789))))

(assert (=> d!32828 (= res!86478 (= (size!2223 (buf!2589 (_1!4572 lt!153521))) (size!2223 (buf!2589 (_2!4570 lt!152884)))))))

(assert (=> d!32828 (= (isPrefixOf!0 (_1!4572 lt!153521) (_2!4570 lt!152884)) e!68789)))

(declare-fun b!105035 () Bool)

(declare-fun res!86479 () Bool)

(assert (=> b!105035 (=> (not res!86479) (not e!68789))))

(assert (=> b!105035 (= res!86479 (bvsle (bitIndex!0 (size!2223 (buf!2589 (_1!4572 lt!153521))) (currentByte!5074 (_1!4572 lt!153521)) (currentBit!5069 (_1!4572 lt!153521))) (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!152884))) (currentByte!5074 (_2!4570 lt!152884)) (currentBit!5069 (_2!4570 lt!152884)))))))

(declare-fun b!105036 () Bool)

(declare-fun e!68790 () Bool)

(assert (=> b!105036 (= e!68789 e!68790)))

(declare-fun res!86480 () Bool)

(assert (=> b!105036 (=> res!86480 e!68790)))

(assert (=> b!105036 (= res!86480 (= (size!2223 (buf!2589 (_1!4572 lt!153521))) #b00000000000000000000000000000000))))

(declare-fun b!105037 () Bool)

(assert (=> b!105037 (= e!68790 (arrayBitRangesEq!0 (buf!2589 (_1!4572 lt!153521)) (buf!2589 (_2!4570 lt!152884)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2223 (buf!2589 (_1!4572 lt!153521))) (currentByte!5074 (_1!4572 lt!153521)) (currentBit!5069 (_1!4572 lt!153521)))))))

(assert (= (and d!32828 res!86478) b!105035))

(assert (= (and b!105035 res!86479) b!105036))

(assert (= (and b!105036 (not res!86480)) b!105037))

(declare-fun m!154165 () Bool)

(assert (=> b!105035 m!154165))

(assert (=> b!105035 m!152527))

(assert (=> b!105037 m!154165))

(assert (=> b!105037 m!154165))

(declare-fun m!154167 () Bool)

(assert (=> b!105037 m!154167))

(assert (=> b!104483 d!32828))

(declare-fun d!32830 () Bool)

(assert (=> d!32830 (= (invariant!0 (currentBit!5069 thiss!1305) (currentByte!5074 thiss!1305) (size!2223 (buf!2589 thiss!1305))) (and (bvsge (currentBit!5069 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5069 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5074 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5074 thiss!1305) (size!2223 (buf!2589 thiss!1305))) (and (= (currentBit!5069 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5074 thiss!1305) (size!2223 (buf!2589 thiss!1305)))))))))

(assert (=> d!32400 d!32830))

(declare-fun e!68796 () Bool)

(declare-fun b!105038 () Bool)

(declare-fun lt!154553 () tuple4!70)

(assert (=> b!105038 (= e!68796 (arrayRangesEq!36 (buf!2589 thiss!1305) (buf!2589 (_2!4570 lt!152888)) (_1!4581 lt!154553) (_2!4581 lt!154553)))))

(declare-fun lt!154554 () (_ BitVec 32))

(declare-fun call!1314 () Bool)

(declare-fun lt!154555 () (_ BitVec 32))

(declare-fun bm!1311 () Bool)

(declare-fun c!6483 () Bool)

(assert (=> bm!1311 (= call!1314 (byteRangesEq!0 (select (arr!2816 (buf!2589 thiss!1305)) (_3!256 lt!154553)) (select (arr!2816 (buf!2589 (_2!4570 lt!152888))) (_3!256 lt!154553)) lt!154555 (ite c!6483 lt!154554 #b00000000000000000000000000001000)))))

(declare-fun b!105039 () Bool)

(declare-fun e!68793 () Bool)

(declare-fun e!68791 () Bool)

(assert (=> b!105039 (= e!68793 e!68791)))

(assert (=> b!105039 (= c!6483 (= (_3!256 lt!154553) (_4!35 lt!154553)))))

(declare-fun e!68795 () Bool)

(declare-fun b!105040 () Bool)

(assert (=> b!105040 (= e!68795 (byteRangesEq!0 (select (arr!2816 (buf!2589 thiss!1305)) (_4!35 lt!154553)) (select (arr!2816 (buf!2589 (_2!4570 lt!152888))) (_4!35 lt!154553)) #b00000000000000000000000000000000 lt!154554))))

(declare-fun b!105041 () Bool)

(declare-fun e!68794 () Bool)

(assert (=> b!105041 (= e!68791 e!68794)))

(declare-fun res!86484 () Bool)

(assert (=> b!105041 (= res!86484 call!1314)))

(assert (=> b!105041 (=> (not res!86484) (not e!68794))))

(declare-fun b!105042 () Bool)

(declare-fun e!68792 () Bool)

(assert (=> b!105042 (= e!68792 e!68793)))

(declare-fun res!86483 () Bool)

(assert (=> b!105042 (=> (not res!86483) (not e!68793))))

(assert (=> b!105042 (= res!86483 e!68796)))

(declare-fun res!86481 () Bool)

(assert (=> b!105042 (=> res!86481 e!68796)))

(assert (=> b!105042 (= res!86481 (bvsge (_1!4581 lt!154553) (_2!4581 lt!154553)))))

(assert (=> b!105042 (= lt!154554 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2223 (buf!2589 thiss!1305)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!105042 (= lt!154555 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!105042 (= lt!154553 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2223 (buf!2589 thiss!1305)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305))))))

(declare-fun b!105043 () Bool)

(declare-fun res!86482 () Bool)

(assert (=> b!105043 (= res!86482 (= lt!154554 #b00000000000000000000000000000000))))

(assert (=> b!105043 (=> res!86482 e!68795)))

(assert (=> b!105043 (= e!68794 e!68795)))

(declare-fun d!32832 () Bool)

(declare-fun res!86485 () Bool)

(assert (=> d!32832 (=> res!86485 e!68792)))

(assert (=> d!32832 (= res!86485 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2223 (buf!2589 thiss!1305)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305))))))

(assert (=> d!32832 (= (arrayBitRangesEq!0 (buf!2589 thiss!1305) (buf!2589 (_2!4570 lt!152888)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2223 (buf!2589 thiss!1305)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305))) e!68792)))

(declare-fun b!105044 () Bool)

(assert (=> b!105044 (= e!68791 call!1314)))

(assert (= (and d!32832 (not res!86485)) b!105042))

(assert (= (and b!105042 (not res!86481)) b!105038))

(assert (= (and b!105042 res!86483) b!105039))

(assert (= (and b!105039 c!6483) b!105044))

(assert (= (and b!105039 (not c!6483)) b!105041))

(assert (= (and b!105041 res!86484) b!105043))

(assert (= (and b!105043 (not res!86482)) b!105040))

(assert (= (or b!105044 b!105041) bm!1311))

(declare-fun m!154169 () Bool)

(assert (=> b!105038 m!154169))

(declare-fun m!154171 () Bool)

(assert (=> bm!1311 m!154171))

(declare-fun m!154173 () Bool)

(assert (=> bm!1311 m!154173))

(assert (=> bm!1311 m!154171))

(assert (=> bm!1311 m!154173))

(declare-fun m!154175 () Bool)

(assert (=> bm!1311 m!154175))

(declare-fun m!154177 () Bool)

(assert (=> b!105040 m!154177))

(declare-fun m!154179 () Bool)

(assert (=> b!105040 m!154179))

(assert (=> b!105040 m!154177))

(assert (=> b!105040 m!154179))

(declare-fun m!154181 () Bool)

(assert (=> b!105040 m!154181))

(assert (=> b!105042 m!152521))

(assert (=> b!105042 m!153791))

(assert (=> b!104573 d!32832))

(assert (=> b!104573 d!32378))

(declare-fun d!32834 () Bool)

(declare-fun e!68797 () Bool)

(assert (=> d!32834 e!68797))

(declare-fun res!86486 () Bool)

(assert (=> d!32834 (=> (not res!86486) (not e!68797))))

(assert (=> d!32834 (= res!86486 (= (buf!2589 (_2!4570 (increaseBitIndex!0 (readerFrom!0 (_2!4570 lt!152884) (currentBit!5069 thiss!1305) (currentByte!5074 thiss!1305))))) (buf!2589 (readerFrom!0 (_2!4570 lt!152884) (currentBit!5069 thiss!1305) (currentByte!5074 thiss!1305)))))))

(declare-fun lt!154558 () Bool)

(assert (=> d!32834 (= lt!154558 (not (= (bvand ((_ sign_extend 24) (select (arr!2816 (buf!2589 (readerFrom!0 (_2!4570 lt!152884) (currentBit!5069 thiss!1305) (currentByte!5074 thiss!1305)))) (currentByte!5074 (readerFrom!0 (_2!4570 lt!152884) (currentBit!5069 thiss!1305) (currentByte!5074 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5069 (readerFrom!0 (_2!4570 lt!152884) (currentBit!5069 thiss!1305) (currentByte!5074 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!154559 () tuple2!8648)

(assert (=> d!32834 (= lt!154559 (tuple2!8649 (not (= (bvand ((_ sign_extend 24) (select (arr!2816 (buf!2589 (readerFrom!0 (_2!4570 lt!152884) (currentBit!5069 thiss!1305) (currentByte!5074 thiss!1305)))) (currentByte!5074 (readerFrom!0 (_2!4570 lt!152884) (currentBit!5069 thiss!1305) (currentByte!5074 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5069 (readerFrom!0 (_2!4570 lt!152884) (currentBit!5069 thiss!1305) (currentByte!5074 thiss!1305)))))) #b00000000000000000000000000000000)) (_2!4570 (increaseBitIndex!0 (readerFrom!0 (_2!4570 lt!152884) (currentBit!5069 thiss!1305) (currentByte!5074 thiss!1305))))))))

(assert (=> d!32834 (validate_offset_bit!0 ((_ sign_extend 32) (size!2223 (buf!2589 (readerFrom!0 (_2!4570 lt!152884) (currentBit!5069 thiss!1305) (currentByte!5074 thiss!1305))))) ((_ sign_extend 32) (currentByte!5074 (readerFrom!0 (_2!4570 lt!152884) (currentBit!5069 thiss!1305) (currentByte!5074 thiss!1305)))) ((_ sign_extend 32) (currentBit!5069 (readerFrom!0 (_2!4570 lt!152884) (currentBit!5069 thiss!1305) (currentByte!5074 thiss!1305)))))))

(assert (=> d!32834 (= (readBit!0 (readerFrom!0 (_2!4570 lt!152884) (currentBit!5069 thiss!1305) (currentByte!5074 thiss!1305))) lt!154559)))

(declare-fun b!105045 () Bool)

(declare-fun lt!154556 () (_ BitVec 64))

(declare-fun lt!154560 () (_ BitVec 64))

(assert (=> b!105045 (= e!68797 (= (bitIndex!0 (size!2223 (buf!2589 (_2!4570 (increaseBitIndex!0 (readerFrom!0 (_2!4570 lt!152884) (currentBit!5069 thiss!1305) (currentByte!5074 thiss!1305)))))) (currentByte!5074 (_2!4570 (increaseBitIndex!0 (readerFrom!0 (_2!4570 lt!152884) (currentBit!5069 thiss!1305) (currentByte!5074 thiss!1305))))) (currentBit!5069 (_2!4570 (increaseBitIndex!0 (readerFrom!0 (_2!4570 lt!152884) (currentBit!5069 thiss!1305) (currentByte!5074 thiss!1305)))))) (bvadd lt!154556 lt!154560)))))

(assert (=> b!105045 (or (not (= (bvand lt!154556 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!154560 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!154556 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!154556 lt!154560) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!105045 (= lt!154560 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!105045 (= lt!154556 (bitIndex!0 (size!2223 (buf!2589 (readerFrom!0 (_2!4570 lt!152884) (currentBit!5069 thiss!1305) (currentByte!5074 thiss!1305)))) (currentByte!5074 (readerFrom!0 (_2!4570 lt!152884) (currentBit!5069 thiss!1305) (currentByte!5074 thiss!1305))) (currentBit!5069 (readerFrom!0 (_2!4570 lt!152884) (currentBit!5069 thiss!1305) (currentByte!5074 thiss!1305)))))))

(declare-fun lt!154562 () Bool)

(assert (=> b!105045 (= lt!154562 (not (= (bvand ((_ sign_extend 24) (select (arr!2816 (buf!2589 (readerFrom!0 (_2!4570 lt!152884) (currentBit!5069 thiss!1305) (currentByte!5074 thiss!1305)))) (currentByte!5074 (readerFrom!0 (_2!4570 lt!152884) (currentBit!5069 thiss!1305) (currentByte!5074 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5069 (readerFrom!0 (_2!4570 lt!152884) (currentBit!5069 thiss!1305) (currentByte!5074 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!154561 () Bool)

(assert (=> b!105045 (= lt!154561 (not (= (bvand ((_ sign_extend 24) (select (arr!2816 (buf!2589 (readerFrom!0 (_2!4570 lt!152884) (currentBit!5069 thiss!1305) (currentByte!5074 thiss!1305)))) (currentByte!5074 (readerFrom!0 (_2!4570 lt!152884) (currentBit!5069 thiss!1305) (currentByte!5074 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5069 (readerFrom!0 (_2!4570 lt!152884) (currentBit!5069 thiss!1305) (currentByte!5074 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!154557 () Bool)

(assert (=> b!105045 (= lt!154557 (not (= (bvand ((_ sign_extend 24) (select (arr!2816 (buf!2589 (readerFrom!0 (_2!4570 lt!152884) (currentBit!5069 thiss!1305) (currentByte!5074 thiss!1305)))) (currentByte!5074 (readerFrom!0 (_2!4570 lt!152884) (currentBit!5069 thiss!1305) (currentByte!5074 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5069 (readerFrom!0 (_2!4570 lt!152884) (currentBit!5069 thiss!1305) (currentByte!5074 thiss!1305)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!32834 res!86486) b!105045))

(assert (=> d!32834 m!152511))

(declare-fun m!154183 () Bool)

(assert (=> d!32834 m!154183))

(declare-fun m!154185 () Bool)

(assert (=> d!32834 m!154185))

(declare-fun m!154187 () Bool)

(assert (=> d!32834 m!154187))

(declare-fun m!154189 () Bool)

(assert (=> d!32834 m!154189))

(assert (=> b!105045 m!154187))

(declare-fun m!154191 () Bool)

(assert (=> b!105045 m!154191))

(assert (=> b!105045 m!154185))

(assert (=> b!105045 m!152511))

(assert (=> b!105045 m!154183))

(declare-fun m!154193 () Bool)

(assert (=> b!105045 m!154193))

(assert (=> d!32380 d!32834))

(declare-fun d!32836 () Bool)

(assert (=> d!32836 (isPrefixOf!0 lt!153292 lt!153292)))

(declare-fun lt!154563 () Unit!6390)

(assert (=> d!32836 (= lt!154563 (choose!11 lt!153292))))

(assert (=> d!32836 (= (lemmaIsPrefixRefl!0 lt!153292) lt!154563)))

(declare-fun bs!8030 () Bool)

(assert (= bs!8030 d!32836))

(declare-fun m!154195 () Bool)

(assert (=> bs!8030 m!154195))

(declare-fun m!154197 () Bool)

(assert (=> bs!8030 m!154197))

(assert (=> b!104415 d!32836))

(declare-fun d!32838 () Bool)

(declare-fun res!86487 () Bool)

(declare-fun e!68798 () Bool)

(assert (=> d!32838 (=> (not res!86487) (not e!68798))))

(assert (=> d!32838 (= res!86487 (= (size!2223 (buf!2589 (_2!4570 lt!152884))) (size!2223 (buf!2589 (_2!4570 lt!153272)))))))

(assert (=> d!32838 (= (isPrefixOf!0 (_2!4570 lt!152884) (_2!4570 lt!153272)) e!68798)))

(declare-fun b!105046 () Bool)

(declare-fun res!86488 () Bool)

(assert (=> b!105046 (=> (not res!86488) (not e!68798))))

(assert (=> b!105046 (= res!86488 (bvsle (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!152884))) (currentByte!5074 (_2!4570 lt!152884)) (currentBit!5069 (_2!4570 lt!152884))) (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!153272))) (currentByte!5074 (_2!4570 lt!153272)) (currentBit!5069 (_2!4570 lt!153272)))))))

(declare-fun b!105047 () Bool)

(declare-fun e!68799 () Bool)

(assert (=> b!105047 (= e!68798 e!68799)))

(declare-fun res!86489 () Bool)

(assert (=> b!105047 (=> res!86489 e!68799)))

(assert (=> b!105047 (= res!86489 (= (size!2223 (buf!2589 (_2!4570 lt!152884))) #b00000000000000000000000000000000))))

(declare-fun b!105048 () Bool)

(assert (=> b!105048 (= e!68799 (arrayBitRangesEq!0 (buf!2589 (_2!4570 lt!152884)) (buf!2589 (_2!4570 lt!153272)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!152884))) (currentByte!5074 (_2!4570 lt!152884)) (currentBit!5069 (_2!4570 lt!152884)))))))

(assert (= (and d!32838 res!86487) b!105046))

(assert (= (and b!105046 res!86488) b!105047))

(assert (= (and b!105047 (not res!86489)) b!105048))

(assert (=> b!105046 m!152527))

(assert (=> b!105046 m!152773))

(assert (=> b!105048 m!152527))

(assert (=> b!105048 m!152527))

(declare-fun m!154199 () Bool)

(assert (=> b!105048 m!154199))

(assert (=> b!104413 d!32838))

(assert (=> d!32276 d!32352))

(declare-fun d!32840 () Bool)

(assert (=> d!32840 (isPrefixOf!0 thiss!1305 (_2!4570 lt!152888))))

(assert (=> d!32840 true))

(declare-fun _$15!168 () Unit!6390)

(assert (=> d!32840 (= (choose!30 thiss!1305 (_2!4570 lt!152884) (_2!4570 lt!152888)) _$15!168)))

(declare-fun bs!8031 () Bool)

(assert (= bs!8031 d!32840))

(assert (=> bs!8031 m!152491))

(assert (=> d!32276 d!32840))

(assert (=> d!32276 d!32430))

(declare-fun d!32842 () Bool)

(declare-fun e!68800 () Bool)

(assert (=> d!32842 e!68800))

(declare-fun res!86491 () Bool)

(assert (=> d!32842 (=> (not res!86491) (not e!68800))))

(declare-fun lt!154569 () (_ BitVec 64))

(declare-fun lt!154564 () (_ BitVec 64))

(declare-fun lt!154565 () (_ BitVec 64))

(assert (=> d!32842 (= res!86491 (= lt!154565 (bvsub lt!154564 lt!154569)))))

(assert (=> d!32842 (or (= (bvand lt!154564 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!154569 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!154564 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!154564 lt!154569) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32842 (= lt!154569 (remainingBits!0 ((_ sign_extend 32) (size!2223 (buf!2589 lt!153753))) ((_ sign_extend 32) (currentByte!5074 lt!153753)) ((_ sign_extend 32) (currentBit!5069 lt!153753))))))

(declare-fun lt!154566 () (_ BitVec 64))

(declare-fun lt!154568 () (_ BitVec 64))

(assert (=> d!32842 (= lt!154564 (bvmul lt!154566 lt!154568))))

(assert (=> d!32842 (or (= lt!154566 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!154568 (bvsdiv (bvmul lt!154566 lt!154568) lt!154566)))))

(assert (=> d!32842 (= lt!154568 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32842 (= lt!154566 ((_ sign_extend 32) (size!2223 (buf!2589 lt!153753))))))

(assert (=> d!32842 (= lt!154565 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5074 lt!153753)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5069 lt!153753))))))

(assert (=> d!32842 (invariant!0 (currentBit!5069 lt!153753) (currentByte!5074 lt!153753) (size!2223 (buf!2589 lt!153753)))))

(assert (=> d!32842 (= (bitIndex!0 (size!2223 (buf!2589 lt!153753)) (currentByte!5074 lt!153753) (currentBit!5069 lt!153753)) lt!154565)))

(declare-fun b!105049 () Bool)

(declare-fun res!86490 () Bool)

(assert (=> b!105049 (=> (not res!86490) (not e!68800))))

(assert (=> b!105049 (= res!86490 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!154565))))

(declare-fun b!105050 () Bool)

(declare-fun lt!154567 () (_ BitVec 64))

(assert (=> b!105050 (= e!68800 (bvsle lt!154565 (bvmul lt!154567 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!105050 (or (= lt!154567 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!154567 #b0000000000000000000000000000000000000000000000000000000000001000) lt!154567)))))

(assert (=> b!105050 (= lt!154567 ((_ sign_extend 32) (size!2223 (buf!2589 lt!153753))))))

(assert (= (and d!32842 res!86491) b!105049))

(assert (= (and b!105049 res!86490) b!105050))

(declare-fun m!154201 () Bool)

(assert (=> d!32842 m!154201))

(declare-fun m!154203 () Bool)

(assert (=> d!32842 m!154203))

(assert (=> d!32404 d!32842))

(declare-fun d!32844 () Bool)

(declare-fun e!68801 () Bool)

(assert (=> d!32844 e!68801))

(declare-fun res!86493 () Bool)

(assert (=> d!32844 (=> (not res!86493) (not e!68801))))

(declare-fun lt!154575 () (_ BitVec 64))

(declare-fun lt!154570 () (_ BitVec 64))

(declare-fun lt!154571 () (_ BitVec 64))

(assert (=> d!32844 (= res!86493 (= lt!154571 (bvsub lt!154570 lt!154575)))))

(assert (=> d!32844 (or (= (bvand lt!154570 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!154575 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!154570 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!154570 lt!154575) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32844 (= lt!154575 (remainingBits!0 ((_ sign_extend 32) (size!2223 (buf!2589 (_1!4572 lt!152882)))) ((_ sign_extend 32) (currentByte!5074 (_1!4572 lt!152882))) ((_ sign_extend 32) (currentBit!5069 (_1!4572 lt!152882)))))))

(declare-fun lt!154572 () (_ BitVec 64))

(declare-fun lt!154574 () (_ BitVec 64))

(assert (=> d!32844 (= lt!154570 (bvmul lt!154572 lt!154574))))

(assert (=> d!32844 (or (= lt!154572 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!154574 (bvsdiv (bvmul lt!154572 lt!154574) lt!154572)))))

(assert (=> d!32844 (= lt!154574 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32844 (= lt!154572 ((_ sign_extend 32) (size!2223 (buf!2589 (_1!4572 lt!152882)))))))

(assert (=> d!32844 (= lt!154571 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5074 (_1!4572 lt!152882))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5069 (_1!4572 lt!152882)))))))

(assert (=> d!32844 (invariant!0 (currentBit!5069 (_1!4572 lt!152882)) (currentByte!5074 (_1!4572 lt!152882)) (size!2223 (buf!2589 (_1!4572 lt!152882))))))

(assert (=> d!32844 (= (bitIndex!0 (size!2223 (buf!2589 (_1!4572 lt!152882))) (currentByte!5074 (_1!4572 lt!152882)) (currentBit!5069 (_1!4572 lt!152882))) lt!154571)))

(declare-fun b!105051 () Bool)

(declare-fun res!86492 () Bool)

(assert (=> b!105051 (=> (not res!86492) (not e!68801))))

(assert (=> b!105051 (= res!86492 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!154571))))

(declare-fun b!105052 () Bool)

(declare-fun lt!154573 () (_ BitVec 64))

(assert (=> b!105052 (= e!68801 (bvsle lt!154571 (bvmul lt!154573 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!105052 (or (= lt!154573 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!154573 #b0000000000000000000000000000000000000000000000000000000000001000) lt!154573)))))

(assert (=> b!105052 (= lt!154573 ((_ sign_extend 32) (size!2223 (buf!2589 (_1!4572 lt!152882)))))))

(assert (= (and d!32844 res!86493) b!105051))

(assert (= (and b!105051 res!86492) b!105052))

(declare-fun m!154205 () Bool)

(assert (=> d!32844 m!154205))

(declare-fun m!154207 () Bool)

(assert (=> d!32844 m!154207))

(assert (=> d!32404 d!32844))

(declare-fun d!32846 () Bool)

(declare-fun lt!154590 () (_ BitVec 32))

(assert (=> d!32846 (= lt!154590 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!154588 () (_ BitVec 32))

(assert (=> d!32846 (= lt!154588 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!68807 () Bool)

(assert (=> d!32846 e!68807))

(declare-fun res!86498 () Bool)

(assert (=> d!32846 (=> (not res!86498) (not e!68807))))

(assert (=> d!32846 (= res!86498 (moveBitIndexPrecond!0 (_1!4572 lt!152882) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun Unit!6439 () Unit!6390)

(declare-fun Unit!6440 () Unit!6390)

(declare-fun Unit!6441 () Unit!6390)

(assert (=> d!32846 (= (moveBitIndex!0 (_1!4572 lt!152882) #b0000000000000000000000000000000000000000000000000000000000000001) (ite (bvslt (bvadd (currentBit!5069 (_1!4572 lt!152882)) lt!154590) #b00000000000000000000000000000000) (tuple2!8631 Unit!6439 (BitStream!3921 (buf!2589 (_1!4572 lt!152882)) (bvsub (bvadd (currentByte!5074 (_1!4572 lt!152882)) lt!154588) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!154590 (currentBit!5069 (_1!4572 lt!152882))))) (ite (bvsge (bvadd (currentBit!5069 (_1!4572 lt!152882)) lt!154590) #b00000000000000000000000000001000) (tuple2!8631 Unit!6440 (BitStream!3921 (buf!2589 (_1!4572 lt!152882)) (bvadd (currentByte!5074 (_1!4572 lt!152882)) lt!154588 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!5069 (_1!4572 lt!152882)) lt!154590) #b00000000000000000000000000001000))) (tuple2!8631 Unit!6441 (BitStream!3921 (buf!2589 (_1!4572 lt!152882)) (bvadd (currentByte!5074 (_1!4572 lt!152882)) lt!154588) (bvadd (currentBit!5069 (_1!4572 lt!152882)) lt!154590))))))))

(declare-fun b!105057 () Bool)

(declare-fun e!68806 () Bool)

(assert (=> b!105057 (= e!68807 e!68806)))

(declare-fun res!86499 () Bool)

(assert (=> b!105057 (=> (not res!86499) (not e!68806))))

(declare-fun lt!154593 () (_ BitVec 64))

(declare-fun lt!154589 () tuple2!8630)

(assert (=> b!105057 (= res!86499 (= (bvadd lt!154593 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!154589))) (currentByte!5074 (_2!4570 lt!154589)) (currentBit!5069 (_2!4570 lt!154589)))))))

(assert (=> b!105057 (or (not (= (bvand lt!154593 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!154593 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!154593 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!105057 (= lt!154593 (bitIndex!0 (size!2223 (buf!2589 (_1!4572 lt!152882))) (currentByte!5074 (_1!4572 lt!152882)) (currentBit!5069 (_1!4572 lt!152882))))))

(declare-fun lt!154591 () (_ BitVec 32))

(declare-fun lt!154592 () (_ BitVec 32))

(declare-fun Unit!6442 () Unit!6390)

(declare-fun Unit!6443 () Unit!6390)

(declare-fun Unit!6444 () Unit!6390)

(assert (=> b!105057 (= lt!154589 (ite (bvslt (bvadd (currentBit!5069 (_1!4572 lt!152882)) lt!154591) #b00000000000000000000000000000000) (tuple2!8631 Unit!6442 (BitStream!3921 (buf!2589 (_1!4572 lt!152882)) (bvsub (bvadd (currentByte!5074 (_1!4572 lt!152882)) lt!154592) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!154591 (currentBit!5069 (_1!4572 lt!152882))))) (ite (bvsge (bvadd (currentBit!5069 (_1!4572 lt!152882)) lt!154591) #b00000000000000000000000000001000) (tuple2!8631 Unit!6443 (BitStream!3921 (buf!2589 (_1!4572 lt!152882)) (bvadd (currentByte!5074 (_1!4572 lt!152882)) lt!154592 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!5069 (_1!4572 lt!152882)) lt!154591) #b00000000000000000000000000001000))) (tuple2!8631 Unit!6444 (BitStream!3921 (buf!2589 (_1!4572 lt!152882)) (bvadd (currentByte!5074 (_1!4572 lt!152882)) lt!154592) (bvadd (currentBit!5069 (_1!4572 lt!152882)) lt!154591))))))))

(assert (=> b!105057 (= lt!154591 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!105057 (= lt!154592 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!105058 () Bool)

(assert (=> b!105058 (= e!68806 (and (= (size!2223 (buf!2589 (_1!4572 lt!152882))) (size!2223 (buf!2589 (_2!4570 lt!154589)))) (= (buf!2589 (_1!4572 lt!152882)) (buf!2589 (_2!4570 lt!154589)))))))

(assert (= (and d!32846 res!86498) b!105057))

(assert (= (and b!105057 res!86499) b!105058))

(assert (=> d!32846 m!153117))

(declare-fun m!154209 () Bool)

(assert (=> b!105057 m!154209))

(assert (=> b!105057 m!153113))

(assert (=> d!32404 d!32846))

(declare-fun d!32850 () Bool)

(declare-fun res!86502 () Bool)

(declare-fun e!68810 () Bool)

(assert (=> d!32850 (=> (not res!86502) (not e!68810))))

(assert (=> d!32850 (= res!86502 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!2223 (buf!2589 (_1!4572 lt!152882))))) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2223 (buf!2589 (_1!4572 lt!152882))))))))))

(assert (=> d!32850 (= (moveBitIndexPrecond!0 (_1!4572 lt!152882) #b0000000000000000000000000000000000000000000000000000000000000001) e!68810)))

(declare-fun b!105062 () Bool)

(declare-fun lt!154596 () (_ BitVec 64))

(assert (=> b!105062 (= e!68810 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!154596) (bvsle lt!154596 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2223 (buf!2589 (_1!4572 lt!152882))))))))))

(assert (=> b!105062 (= lt!154596 (bvadd (bitIndex!0 (size!2223 (buf!2589 (_1!4572 lt!152882))) (currentByte!5074 (_1!4572 lt!152882)) (currentBit!5069 (_1!4572 lt!152882))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and d!32850 res!86502) b!105062))

(assert (=> b!105062 m!153113))

(assert (=> d!32404 d!32850))

(declare-fun d!32852 () Bool)

(declare-fun lt!154597 () tuple2!8648)

(assert (=> d!32852 (= lt!154597 (readBit!0 (readerFrom!0 (_2!4570 lt!153697) (currentBit!5069 thiss!1305) (currentByte!5074 thiss!1305))))))

(assert (=> d!32852 (= (readBitPure!0 (readerFrom!0 (_2!4570 lt!153697) (currentBit!5069 thiss!1305) (currentByte!5074 thiss!1305))) (tuple2!8637 (_2!4579 lt!154597) (_1!4579 lt!154597)))))

(declare-fun bs!8032 () Bool)

(assert (= bs!8032 d!32852))

(assert (=> bs!8032 m!152953))

(declare-fun m!154211 () Bool)

(assert (=> bs!8032 m!154211))

(assert (=> b!104555 d!32852))

(declare-fun d!32854 () Bool)

(declare-fun e!68811 () Bool)

(assert (=> d!32854 e!68811))

(declare-fun res!86503 () Bool)

(assert (=> d!32854 (=> (not res!86503) (not e!68811))))

(assert (=> d!32854 (= res!86503 (invariant!0 (currentBit!5069 (_2!4570 lt!153697)) (currentByte!5074 (_2!4570 lt!153697)) (size!2223 (buf!2589 (_2!4570 lt!153697)))))))

(assert (=> d!32854 (= (readerFrom!0 (_2!4570 lt!153697) (currentBit!5069 thiss!1305) (currentByte!5074 thiss!1305)) (BitStream!3921 (buf!2589 (_2!4570 lt!153697)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305)))))

(declare-fun b!105063 () Bool)

(assert (=> b!105063 (= e!68811 (invariant!0 (currentBit!5069 thiss!1305) (currentByte!5074 thiss!1305) (size!2223 (buf!2589 (_2!4570 lt!153697)))))))

(assert (= (and d!32854 res!86503) b!105063))

(declare-fun m!154213 () Bool)

(assert (=> d!32854 m!154213))

(declare-fun m!154215 () Bool)

(assert (=> b!105063 m!154215))

(assert (=> b!104555 d!32854))

(declare-fun d!32856 () Bool)

(declare-fun e!68812 () Bool)

(assert (=> d!32856 e!68812))

(declare-fun res!86505 () Bool)

(assert (=> d!32856 (=> (not res!86505) (not e!68812))))

(declare-fun lt!154598 () (_ BitVec 64))

(declare-fun lt!154599 () (_ BitVec 64))

(declare-fun lt!154603 () (_ BitVec 64))

(assert (=> d!32856 (= res!86505 (= lt!154599 (bvsub lt!154598 lt!154603)))))

(assert (=> d!32856 (or (= (bvand lt!154598 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!154603 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!154598 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!154598 lt!154603) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32856 (= lt!154603 (remainingBits!0 ((_ sign_extend 32) (size!2223 (buf!2589 (_2!4570 lt!153697)))) ((_ sign_extend 32) (currentByte!5074 (_2!4570 lt!153697))) ((_ sign_extend 32) (currentBit!5069 (_2!4570 lt!153697)))))))

(declare-fun lt!154600 () (_ BitVec 64))

(declare-fun lt!154602 () (_ BitVec 64))

(assert (=> d!32856 (= lt!154598 (bvmul lt!154600 lt!154602))))

(assert (=> d!32856 (or (= lt!154600 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!154602 (bvsdiv (bvmul lt!154600 lt!154602) lt!154600)))))

(assert (=> d!32856 (= lt!154602 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32856 (= lt!154600 ((_ sign_extend 32) (size!2223 (buf!2589 (_2!4570 lt!153697)))))))

(assert (=> d!32856 (= lt!154599 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5074 (_2!4570 lt!153697))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5069 (_2!4570 lt!153697)))))))

(assert (=> d!32856 (invariant!0 (currentBit!5069 (_2!4570 lt!153697)) (currentByte!5074 (_2!4570 lt!153697)) (size!2223 (buf!2589 (_2!4570 lt!153697))))))

(assert (=> d!32856 (= (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!153697))) (currentByte!5074 (_2!4570 lt!153697)) (currentBit!5069 (_2!4570 lt!153697))) lt!154599)))

(declare-fun b!105064 () Bool)

(declare-fun res!86504 () Bool)

(assert (=> b!105064 (=> (not res!86504) (not e!68812))))

(assert (=> b!105064 (= res!86504 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!154599))))

(declare-fun b!105065 () Bool)

(declare-fun lt!154601 () (_ BitVec 64))

(assert (=> b!105065 (= e!68812 (bvsle lt!154599 (bvmul lt!154601 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!105065 (or (= lt!154601 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!154601 #b0000000000000000000000000000000000000000000000000000000000001000) lt!154601)))))

(assert (=> b!105065 (= lt!154601 ((_ sign_extend 32) (size!2223 (buf!2589 (_2!4570 lt!153697)))))))

(assert (= (and d!32856 res!86505) b!105064))

(assert (= (and b!105064 res!86504) b!105065))

(declare-fun m!154217 () Bool)

(assert (=> d!32856 m!154217))

(assert (=> d!32856 m!154213))

(assert (=> b!104553 d!32856))

(assert (=> b!104553 d!32378))

(declare-fun d!32858 () Bool)

(assert (=> d!32858 (= (invariant!0 (currentBit!5069 (_2!4570 lt!152884)) (currentByte!5074 (_2!4570 lt!152884)) (size!2223 (buf!2589 (_2!4570 lt!152884)))) (and (bvsge (currentBit!5069 (_2!4570 lt!152884)) #b00000000000000000000000000000000) (bvslt (currentBit!5069 (_2!4570 lt!152884)) #b00000000000000000000000000001000) (bvsge (currentByte!5074 (_2!4570 lt!152884)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5074 (_2!4570 lt!152884)) (size!2223 (buf!2589 (_2!4570 lt!152884)))) (and (= (currentBit!5069 (_2!4570 lt!152884)) #b00000000000000000000000000000000) (= (currentByte!5074 (_2!4570 lt!152884)) (size!2223 (buf!2589 (_2!4570 lt!152884))))))))))

(assert (=> d!32384 d!32858))

(declare-fun d!32860 () Bool)

(declare-fun lt!154604 () tuple2!8648)

(assert (=> d!32860 (= lt!154604 (readBit!0 (readerFrom!0 (_2!4570 lt!153280) (currentBit!5069 (_2!4570 lt!152884)) (currentByte!5074 (_2!4570 lt!152884)))))))

(assert (=> d!32860 (= (readBitPure!0 (readerFrom!0 (_2!4570 lt!153280) (currentBit!5069 (_2!4570 lt!152884)) (currentByte!5074 (_2!4570 lt!152884)))) (tuple2!8637 (_2!4579 lt!154604) (_1!4579 lt!154604)))))

(declare-fun bs!8033 () Bool)

(assert (= bs!8033 d!32860))

(assert (=> bs!8033 m!152777))

(declare-fun m!154219 () Bool)

(assert (=> bs!8033 m!154219))

(assert (=> b!104417 d!32860))

(declare-fun d!32862 () Bool)

(declare-fun e!68813 () Bool)

(assert (=> d!32862 e!68813))

(declare-fun res!86506 () Bool)

(assert (=> d!32862 (=> (not res!86506) (not e!68813))))

(assert (=> d!32862 (= res!86506 (invariant!0 (currentBit!5069 (_2!4570 lt!153280)) (currentByte!5074 (_2!4570 lt!153280)) (size!2223 (buf!2589 (_2!4570 lt!153280)))))))

(assert (=> d!32862 (= (readerFrom!0 (_2!4570 lt!153280) (currentBit!5069 (_2!4570 lt!152884)) (currentByte!5074 (_2!4570 lt!152884))) (BitStream!3921 (buf!2589 (_2!4570 lt!153280)) (currentByte!5074 (_2!4570 lt!152884)) (currentBit!5069 (_2!4570 lt!152884))))))

(declare-fun b!105066 () Bool)

(assert (=> b!105066 (= e!68813 (invariant!0 (currentBit!5069 (_2!4570 lt!152884)) (currentByte!5074 (_2!4570 lt!152884)) (size!2223 (buf!2589 (_2!4570 lt!153280)))))))

(assert (= (and d!32862 res!86506) b!105066))

(assert (=> d!32862 m!153815))

(declare-fun m!154221 () Bool)

(assert (=> b!105066 m!154221))

(assert (=> b!104417 d!32862))

(declare-fun d!32864 () Bool)

(assert (=> d!32864 (isPrefixOf!0 (_2!4570 lt!152884) (_2!4570 lt!152884))))

(declare-fun lt!154605 () Unit!6390)

(assert (=> d!32864 (= lt!154605 (choose!11 (_2!4570 lt!152884)))))

(assert (=> d!32864 (= (lemmaIsPrefixRefl!0 (_2!4570 lt!152884)) lt!154605)))

(declare-fun bs!8034 () Bool)

(assert (= bs!8034 d!32864))

(assert (=> bs!8034 m!152915))

(declare-fun m!154223 () Bool)

(assert (=> bs!8034 m!154223))

(assert (=> d!32322 d!32864))

(declare-fun d!32866 () Bool)

(assert (=> d!32866 (isPrefixOf!0 lt!153520 (_2!4570 lt!152888))))

(declare-fun lt!154606 () Unit!6390)

(assert (=> d!32866 (= lt!154606 (choose!30 lt!153520 (_2!4570 lt!152888) (_2!4570 lt!152888)))))

(assert (=> d!32866 (isPrefixOf!0 lt!153520 (_2!4570 lt!152888))))

(assert (=> d!32866 (= (lemmaIsPrefixTransitive!0 lt!153520 (_2!4570 lt!152888) (_2!4570 lt!152888)) lt!154606)))

(declare-fun bs!8035 () Bool)

(assert (= bs!8035 d!32866))

(assert (=> bs!8035 m!152905))

(declare-fun m!154225 () Bool)

(assert (=> bs!8035 m!154225))

(assert (=> bs!8035 m!152905))

(assert (=> d!32322 d!32866))

(assert (=> d!32322 d!32758))

(assert (=> d!32322 d!32762))

(declare-fun d!32868 () Bool)

(declare-fun res!86507 () Bool)

(declare-fun e!68814 () Bool)

(assert (=> d!32868 (=> (not res!86507) (not e!68814))))

(assert (=> d!32868 (= res!86507 (= (size!2223 (buf!2589 (_2!4570 lt!152884))) (size!2223 (buf!2589 (_2!4570 lt!152884)))))))

(assert (=> d!32868 (= (isPrefixOf!0 (_2!4570 lt!152884) (_2!4570 lt!152884)) e!68814)))

(declare-fun b!105067 () Bool)

(declare-fun res!86508 () Bool)

(assert (=> b!105067 (=> (not res!86508) (not e!68814))))

(assert (=> b!105067 (= res!86508 (bvsle (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!152884))) (currentByte!5074 (_2!4570 lt!152884)) (currentBit!5069 (_2!4570 lt!152884))) (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!152884))) (currentByte!5074 (_2!4570 lt!152884)) (currentBit!5069 (_2!4570 lt!152884)))))))

(declare-fun b!105068 () Bool)

(declare-fun e!68815 () Bool)

(assert (=> b!105068 (= e!68814 e!68815)))

(declare-fun res!86509 () Bool)

(assert (=> b!105068 (=> res!86509 e!68815)))

(assert (=> b!105068 (= res!86509 (= (size!2223 (buf!2589 (_2!4570 lt!152884))) #b00000000000000000000000000000000))))

(declare-fun b!105069 () Bool)

(assert (=> b!105069 (= e!68815 (arrayBitRangesEq!0 (buf!2589 (_2!4570 lt!152884)) (buf!2589 (_2!4570 lt!152884)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!152884))) (currentByte!5074 (_2!4570 lt!152884)) (currentBit!5069 (_2!4570 lt!152884)))))))

(assert (= (and d!32868 res!86507) b!105067))

(assert (= (and b!105067 res!86508) b!105068))

(assert (= (and b!105068 (not res!86509)) b!105069))

(assert (=> b!105067 m!152527))

(assert (=> b!105067 m!152527))

(assert (=> b!105069 m!152527))

(assert (=> b!105069 m!152527))

(declare-fun m!154227 () Bool)

(assert (=> b!105069 m!154227))

(assert (=> d!32322 d!32868))

(declare-fun d!32870 () Bool)

(declare-fun res!86510 () Bool)

(declare-fun e!68816 () Bool)

(assert (=> d!32870 (=> (not res!86510) (not e!68816))))

(assert (=> d!32870 (= res!86510 (= (size!2223 (buf!2589 lt!153520)) (size!2223 (buf!2589 lt!153520))))))

(assert (=> d!32870 (= (isPrefixOf!0 lt!153520 lt!153520) e!68816)))

(declare-fun b!105070 () Bool)

(declare-fun res!86511 () Bool)

(assert (=> b!105070 (=> (not res!86511) (not e!68816))))

(assert (=> b!105070 (= res!86511 (bvsle (bitIndex!0 (size!2223 (buf!2589 lt!153520)) (currentByte!5074 lt!153520) (currentBit!5069 lt!153520)) (bitIndex!0 (size!2223 (buf!2589 lt!153520)) (currentByte!5074 lt!153520) (currentBit!5069 lt!153520))))))

(declare-fun b!105071 () Bool)

(declare-fun e!68817 () Bool)

(assert (=> b!105071 (= e!68816 e!68817)))

(declare-fun res!86512 () Bool)

(assert (=> b!105071 (=> res!86512 e!68817)))

(assert (=> b!105071 (= res!86512 (= (size!2223 (buf!2589 lt!153520)) #b00000000000000000000000000000000))))

(declare-fun b!105072 () Bool)

(assert (=> b!105072 (= e!68817 (arrayBitRangesEq!0 (buf!2589 lt!153520) (buf!2589 lt!153520) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2223 (buf!2589 lt!153520)) (currentByte!5074 lt!153520) (currentBit!5069 lt!153520))))))

(assert (= (and d!32870 res!86510) b!105070))

(assert (= (and b!105070 res!86511) b!105071))

(assert (= (and b!105071 (not res!86512)) b!105072))

(declare-fun m!154229 () Bool)

(assert (=> b!105070 m!154229))

(assert (=> b!105070 m!154229))

(assert (=> b!105072 m!154229))

(assert (=> b!105072 m!154229))

(declare-fun m!154231 () Bool)

(assert (=> b!105072 m!154231))

(assert (=> d!32322 d!32870))

(declare-fun d!32872 () Bool)

(declare-fun res!86513 () Bool)

(declare-fun e!68818 () Bool)

(assert (=> d!32872 (=> (not res!86513) (not e!68818))))

(assert (=> d!32872 (= res!86513 (= (size!2223 (buf!2589 (_1!4572 lt!153521))) (size!2223 (buf!2589 (_2!4572 lt!153521)))))))

(assert (=> d!32872 (= (isPrefixOf!0 (_1!4572 lt!153521) (_2!4572 lt!153521)) e!68818)))

(declare-fun b!105073 () Bool)

(declare-fun res!86514 () Bool)

(assert (=> b!105073 (=> (not res!86514) (not e!68818))))

(assert (=> b!105073 (= res!86514 (bvsle (bitIndex!0 (size!2223 (buf!2589 (_1!4572 lt!153521))) (currentByte!5074 (_1!4572 lt!153521)) (currentBit!5069 (_1!4572 lt!153521))) (bitIndex!0 (size!2223 (buf!2589 (_2!4572 lt!153521))) (currentByte!5074 (_2!4572 lt!153521)) (currentBit!5069 (_2!4572 lt!153521)))))))

(declare-fun b!105074 () Bool)

(declare-fun e!68819 () Bool)

(assert (=> b!105074 (= e!68818 e!68819)))

(declare-fun res!86515 () Bool)

(assert (=> b!105074 (=> res!86515 e!68819)))

(assert (=> b!105074 (= res!86515 (= (size!2223 (buf!2589 (_1!4572 lt!153521))) #b00000000000000000000000000000000))))

(declare-fun b!105075 () Bool)

(assert (=> b!105075 (= e!68819 (arrayBitRangesEq!0 (buf!2589 (_1!4572 lt!153521)) (buf!2589 (_2!4572 lt!153521)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2223 (buf!2589 (_1!4572 lt!153521))) (currentByte!5074 (_1!4572 lt!153521)) (currentBit!5069 (_1!4572 lt!153521)))))))

(assert (= (and d!32872 res!86513) b!105073))

(assert (= (and b!105073 res!86514) b!105074))

(assert (= (and b!105074 (not res!86515)) b!105075))

(assert (=> b!105073 m!154165))

(declare-fun m!154233 () Bool)

(assert (=> b!105073 m!154233))

(assert (=> b!105075 m!154165))

(assert (=> b!105075 m!154165))

(declare-fun m!154235 () Bool)

(assert (=> b!105075 m!154235))

(assert (=> d!32322 d!32872))

(declare-fun d!32874 () Bool)

(declare-fun res!86516 () Bool)

(declare-fun e!68820 () Bool)

(assert (=> d!32874 (=> (not res!86516) (not e!68820))))

(assert (=> d!32874 (= res!86516 (= (size!2223 (buf!2589 (_2!4570 lt!152884))) (size!2223 (buf!2589 (_2!4570 lt!152888)))))))

(assert (=> d!32874 (= (isPrefixOf!0 (_2!4570 lt!152884) (_2!4570 lt!152888)) e!68820)))

(declare-fun b!105076 () Bool)

(declare-fun res!86517 () Bool)

(assert (=> b!105076 (=> (not res!86517) (not e!68820))))

(assert (=> b!105076 (= res!86517 (bvsle (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!152884))) (currentByte!5074 (_2!4570 lt!152884)) (currentBit!5069 (_2!4570 lt!152884))) (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!152888))) (currentByte!5074 (_2!4570 lt!152888)) (currentBit!5069 (_2!4570 lt!152888)))))))

(declare-fun b!105077 () Bool)

(declare-fun e!68821 () Bool)

(assert (=> b!105077 (= e!68820 e!68821)))

(declare-fun res!86518 () Bool)

(assert (=> b!105077 (=> res!86518 e!68821)))

(assert (=> b!105077 (= res!86518 (= (size!2223 (buf!2589 (_2!4570 lt!152884))) #b00000000000000000000000000000000))))

(declare-fun b!105078 () Bool)

(assert (=> b!105078 (= e!68821 (arrayBitRangesEq!0 (buf!2589 (_2!4570 lt!152884)) (buf!2589 (_2!4570 lt!152888)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!152884))) (currentByte!5074 (_2!4570 lt!152884)) (currentBit!5069 (_2!4570 lt!152884)))))))

(assert (= (and d!32874 res!86516) b!105076))

(assert (= (and b!105076 res!86517) b!105077))

(assert (= (and b!105077 (not res!86518)) b!105078))

(assert (=> b!105076 m!152527))

(assert (=> b!105076 m!152873))

(assert (=> b!105078 m!152527))

(assert (=> b!105078 m!152527))

(declare-fun m!154237 () Bool)

(assert (=> b!105078 m!154237))

(assert (=> d!32322 d!32874))

(declare-fun d!32876 () Bool)

(assert (=> d!32876 (isPrefixOf!0 lt!153520 lt!153520)))

(declare-fun lt!154607 () Unit!6390)

(assert (=> d!32876 (= lt!154607 (choose!11 lt!153520))))

(assert (=> d!32876 (= (lemmaIsPrefixRefl!0 lt!153520) lt!154607)))

(declare-fun bs!8036 () Bool)

(assert (= bs!8036 d!32876))

(assert (=> bs!8036 m!152901))

(declare-fun m!154239 () Bool)

(assert (=> bs!8036 m!154239))

(assert (=> d!32322 d!32876))

(declare-fun d!32878 () Bool)

(declare-fun res!86519 () Bool)

(declare-fun e!68822 () Bool)

(assert (=> d!32878 (=> (not res!86519) (not e!68822))))

(assert (=> d!32878 (= res!86519 (= (size!2223 (buf!2589 lt!153520)) (size!2223 (buf!2589 (_2!4570 lt!152888)))))))

(assert (=> d!32878 (= (isPrefixOf!0 lt!153520 (_2!4570 lt!152888)) e!68822)))

(declare-fun b!105079 () Bool)

(declare-fun res!86520 () Bool)

(assert (=> b!105079 (=> (not res!86520) (not e!68822))))

(assert (=> b!105079 (= res!86520 (bvsle (bitIndex!0 (size!2223 (buf!2589 lt!153520)) (currentByte!5074 lt!153520) (currentBit!5069 lt!153520)) (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!152888))) (currentByte!5074 (_2!4570 lt!152888)) (currentBit!5069 (_2!4570 lt!152888)))))))

(declare-fun b!105080 () Bool)

(declare-fun e!68823 () Bool)

(assert (=> b!105080 (= e!68822 e!68823)))

(declare-fun res!86521 () Bool)

(assert (=> b!105080 (=> res!86521 e!68823)))

(assert (=> b!105080 (= res!86521 (= (size!2223 (buf!2589 lt!153520)) #b00000000000000000000000000000000))))

(declare-fun b!105081 () Bool)

(assert (=> b!105081 (= e!68823 (arrayBitRangesEq!0 (buf!2589 lt!153520) (buf!2589 (_2!4570 lt!152888)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2223 (buf!2589 lt!153520)) (currentByte!5074 lt!153520) (currentBit!5069 lt!153520))))))

(assert (= (and d!32878 res!86519) b!105079))

(assert (= (and b!105079 res!86520) b!105080))

(assert (= (and b!105080 (not res!86521)) b!105081))

(assert (=> b!105079 m!154229))

(assert (=> b!105079 m!152873))

(assert (=> b!105081 m!154229))

(assert (=> b!105081 m!154229))

(declare-fun m!154241 () Bool)

(assert (=> b!105081 m!154241))

(assert (=> d!32322 d!32878))

(declare-fun d!32880 () Bool)

(assert (=> d!32880 (isPrefixOf!0 lt!153520 (_2!4570 lt!152888))))

(declare-fun lt!154608 () Unit!6390)

(assert (=> d!32880 (= lt!154608 (choose!30 lt!153520 (_2!4570 lt!152884) (_2!4570 lt!152888)))))

(assert (=> d!32880 (isPrefixOf!0 lt!153520 (_2!4570 lt!152884))))

(assert (=> d!32880 (= (lemmaIsPrefixTransitive!0 lt!153520 (_2!4570 lt!152884) (_2!4570 lt!152888)) lt!154608)))

(declare-fun bs!8037 () Bool)

(assert (= bs!8037 d!32880))

(assert (=> bs!8037 m!152905))

(declare-fun m!154243 () Bool)

(assert (=> bs!8037 m!154243))

(declare-fun m!154245 () Bool)

(assert (=> bs!8037 m!154245))

(assert (=> d!32322 d!32880))

(declare-fun d!32882 () Bool)

(assert (=> d!32882 (= (remainingBits!0 ((_ sign_extend 32) (size!2223 (buf!2589 (_1!4573 lt!152890)))) ((_ sign_extend 32) (currentByte!5074 (_1!4573 lt!152890))) ((_ sign_extend 32) (currentBit!5069 (_1!4573 lt!152890)))) (bvsub (bvmul ((_ sign_extend 32) (size!2223 (buf!2589 (_1!4573 lt!152890)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5074 (_1!4573 lt!152890))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5069 (_1!4573 lt!152890))))))))

(assert (=> d!32348 d!32882))

(declare-fun d!32884 () Bool)

(assert (=> d!32884 (= (invariant!0 (currentBit!5069 (_1!4573 lt!152890)) (currentByte!5074 (_1!4573 lt!152890)) (size!2223 (buf!2589 (_1!4573 lt!152890)))) (and (bvsge (currentBit!5069 (_1!4573 lt!152890)) #b00000000000000000000000000000000) (bvslt (currentBit!5069 (_1!4573 lt!152890)) #b00000000000000000000000000001000) (bvsge (currentByte!5074 (_1!4573 lt!152890)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5074 (_1!4573 lt!152890)) (size!2223 (buf!2589 (_1!4573 lt!152890)))) (and (= (currentBit!5069 (_1!4573 lt!152890)) #b00000000000000000000000000000000) (= (currentByte!5074 (_1!4573 lt!152890)) (size!2223 (buf!2589 (_1!4573 lt!152890))))))))))

(assert (=> d!32348 d!32884))

(declare-fun d!32886 () Bool)

(declare-fun res!86522 () Bool)

(declare-fun e!68824 () Bool)

(assert (=> d!32886 (=> (not res!86522) (not e!68824))))

(assert (=> d!32886 (= res!86522 (= (size!2223 (buf!2589 (_2!4572 lt!153521))) (size!2223 (buf!2589 (_2!4570 lt!152888)))))))

(assert (=> d!32886 (= (isPrefixOf!0 (_2!4572 lt!153521) (_2!4570 lt!152888)) e!68824)))

(declare-fun b!105082 () Bool)

(declare-fun res!86523 () Bool)

(assert (=> b!105082 (=> (not res!86523) (not e!68824))))

(assert (=> b!105082 (= res!86523 (bvsle (bitIndex!0 (size!2223 (buf!2589 (_2!4572 lt!153521))) (currentByte!5074 (_2!4572 lt!153521)) (currentBit!5069 (_2!4572 lt!153521))) (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!152888))) (currentByte!5074 (_2!4570 lt!152888)) (currentBit!5069 (_2!4570 lt!152888)))))))

(declare-fun b!105083 () Bool)

(declare-fun e!68825 () Bool)

(assert (=> b!105083 (= e!68824 e!68825)))

(declare-fun res!86524 () Bool)

(assert (=> b!105083 (=> res!86524 e!68825)))

(assert (=> b!105083 (= res!86524 (= (size!2223 (buf!2589 (_2!4572 lt!153521))) #b00000000000000000000000000000000))))

(declare-fun b!105084 () Bool)

(assert (=> b!105084 (= e!68825 (arrayBitRangesEq!0 (buf!2589 (_2!4572 lt!153521)) (buf!2589 (_2!4570 lt!152888)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2223 (buf!2589 (_2!4572 lt!153521))) (currentByte!5074 (_2!4572 lt!153521)) (currentBit!5069 (_2!4572 lt!153521)))))))

(assert (= (and d!32886 res!86522) b!105082))

(assert (= (and b!105082 res!86523) b!105083))

(assert (= (and b!105083 (not res!86524)) b!105084))

(assert (=> b!105082 m!154233))

(assert (=> b!105082 m!152873))

(assert (=> b!105084 m!154233))

(assert (=> b!105084 m!154233))

(declare-fun m!154247 () Bool)

(assert (=> b!105084 m!154247))

(assert (=> b!104480 d!32886))

(declare-fun d!32888 () Bool)

(declare-fun e!68836 () Bool)

(assert (=> d!32888 e!68836))

(declare-fun res!86533 () Bool)

(assert (=> d!32888 (=> (not res!86533) (not e!68836))))

(declare-fun _$19!93 () tuple2!8630)

(assert (=> d!32888 (= res!86533 (= (size!2223 (buf!2589 thiss!1305)) (size!2223 (buf!2589 (_2!4570 _$19!93)))))))

(declare-fun e!68835 () Bool)

(assert (=> d!32888 (and (inv!12 (_2!4570 _$19!93)) e!68835)))

(assert (=> d!32888 (= (choose!16 thiss!1305 lt!152887) _$19!93)))

(declare-fun b!105096 () Bool)

(declare-fun res!86535 () Bool)

(assert (=> b!105096 (=> (not res!86535) (not e!68836))))

(assert (=> b!105096 (= res!86535 (isPrefixOf!0 thiss!1305 (_2!4570 _$19!93)))))

(declare-fun b!105097 () Bool)

(assert (=> b!105097 (= e!68835 (array_inv!2025 (buf!2589 (_2!4570 _$19!93))))))

(declare-fun b!105098 () Bool)

(declare-fun e!68834 () Bool)

(assert (=> b!105098 (= e!68836 e!68834)))

(declare-fun res!86536 () Bool)

(assert (=> b!105098 (=> (not res!86536) (not e!68834))))

(declare-fun lt!154611 () tuple2!8636)

(assert (=> b!105098 (= res!86536 (and (= (_2!4573 lt!154611) lt!152887) (= (_1!4573 lt!154611) (_2!4570 _$19!93))))))

(assert (=> b!105098 (= lt!154611 (readBitPure!0 (readerFrom!0 (_2!4570 _$19!93) (currentBit!5069 thiss!1305) (currentByte!5074 thiss!1305))))))

(declare-fun b!105099 () Bool)

(assert (=> b!105099 (= e!68834 (= (bitIndex!0 (size!2223 (buf!2589 (_1!4573 lt!154611))) (currentByte!5074 (_1!4573 lt!154611)) (currentBit!5069 (_1!4573 lt!154611))) (bitIndex!0 (size!2223 (buf!2589 (_2!4570 _$19!93))) (currentByte!5074 (_2!4570 _$19!93)) (currentBit!5069 (_2!4570 _$19!93)))))))

(declare-fun b!105100 () Bool)

(declare-fun res!86534 () Bool)

(assert (=> b!105100 (=> (not res!86534) (not e!68836))))

(assert (=> b!105100 (= res!86534 (= (bitIndex!0 (size!2223 (buf!2589 (_2!4570 _$19!93))) (currentByte!5074 (_2!4570 _$19!93)) (currentBit!5069 (_2!4570 _$19!93))) (bvadd (bitIndex!0 (size!2223 (buf!2589 thiss!1305)) (currentByte!5074 thiss!1305) (currentBit!5069 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= d!32888 b!105097))

(assert (= (and d!32888 res!86533) b!105100))

(assert (= (and b!105100 res!86534) b!105096))

(assert (= (and b!105096 res!86535) b!105098))

(assert (= (and b!105098 res!86536) b!105099))

(declare-fun m!154249 () Bool)

(assert (=> b!105098 m!154249))

(assert (=> b!105098 m!154249))

(declare-fun m!154251 () Bool)

(assert (=> b!105098 m!154251))

(declare-fun m!154253 () Bool)

(assert (=> b!105099 m!154253))

(declare-fun m!154255 () Bool)

(assert (=> b!105099 m!154255))

(declare-fun m!154257 () Bool)

(assert (=> b!105096 m!154257))

(declare-fun m!154259 () Bool)

(assert (=> b!105097 m!154259))

(declare-fun m!154261 () Bool)

(assert (=> d!32888 m!154261))

(assert (=> b!105100 m!154255))

(assert (=> b!105100 m!152521))

(assert (=> d!32338 d!32888))

(declare-fun d!32890 () Bool)

(assert (=> d!32890 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!2223 (buf!2589 thiss!1305))) ((_ sign_extend 32) (currentByte!5074 thiss!1305)) ((_ sign_extend 32) (currentBit!5069 thiss!1305))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2223 (buf!2589 thiss!1305))) ((_ sign_extend 32) (currentByte!5074 thiss!1305)) ((_ sign_extend 32) (currentBit!5069 thiss!1305))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!8038 () Bool)

(assert (= bs!8038 d!32890))

(assert (=> bs!8038 m!152617))

(assert (=> d!32338 d!32890))

(assert (=> d!32378 d!32728))

(assert (=> d!32378 d!32830))

(declare-fun d!32892 () Bool)

(declare-fun e!68838 () Bool)

(assert (=> d!32892 e!68838))

(declare-fun res!86537 () Bool)

(assert (=> d!32892 (=> (not res!86537) (not e!68838))))

(declare-fun lt!154613 () (_ BitVec 64))

(declare-fun lt!154612 () BitStream!3920)

(assert (=> d!32892 (= res!86537 (= (bvadd lt!154613 (bvsub lt!153494 lt!153493)) (bitIndex!0 (size!2223 (buf!2589 lt!154612)) (currentByte!5074 lt!154612) (currentBit!5069 lt!154612))))))

(assert (=> d!32892 (or (not (= (bvand lt!154613 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!153494 lt!153493) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!154613 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!154613 (bvsub lt!153494 lt!153493)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32892 (= lt!154613 (bitIndex!0 (size!2223 (buf!2589 (_2!4572 lt!153501))) (currentByte!5074 (_2!4572 lt!153501)) (currentBit!5069 (_2!4572 lt!153501))))))

(assert (=> d!32892 (= lt!154612 (_2!4570 (moveBitIndex!0 (_2!4572 lt!153501) (bvsub lt!153494 lt!153493))))))

(assert (=> d!32892 (moveBitIndexPrecond!0 (_2!4572 lt!153501) (bvsub lt!153494 lt!153493))))

(assert (=> d!32892 (= (withMovedBitIndex!0 (_2!4572 lt!153501) (bvsub lt!153494 lt!153493)) lt!154612)))

(declare-fun b!105101 () Bool)

(assert (=> b!105101 (= e!68838 (= (size!2223 (buf!2589 (_2!4572 lt!153501))) (size!2223 (buf!2589 lt!154612))))))

(assert (= (and d!32892 res!86537) b!105101))

(declare-fun m!154263 () Bool)

(assert (=> d!32892 m!154263))

(assert (=> d!32892 m!153793))

(declare-fun m!154265 () Bool)

(assert (=> d!32892 m!154265))

(declare-fun m!154267 () Bool)

(assert (=> d!32892 m!154267))

(assert (=> b!104477 d!32892))

(assert (=> b!104477 d!32722))

(assert (=> b!104477 d!32378))

(declare-fun d!32894 () Bool)

(declare-fun e!68839 () Bool)

(assert (=> d!32894 e!68839))

(declare-fun res!86539 () Bool)

(assert (=> d!32894 (=> (not res!86539) (not e!68839))))

(declare-fun lt!154614 () (_ BitVec 64))

(declare-fun lt!154615 () (_ BitVec 64))

(declare-fun lt!154619 () (_ BitVec 64))

(assert (=> d!32894 (= res!86539 (= lt!154615 (bvsub lt!154614 lt!154619)))))

(assert (=> d!32894 (or (= (bvand lt!154614 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!154619 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!154614 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!154614 lt!154619) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32894 (= lt!154619 (remainingBits!0 ((_ sign_extend 32) (size!2223 (buf!2589 (_1!4573 lt!153696)))) ((_ sign_extend 32) (currentByte!5074 (_1!4573 lt!153696))) ((_ sign_extend 32) (currentBit!5069 (_1!4573 lt!153696)))))))

(declare-fun lt!154616 () (_ BitVec 64))

(declare-fun lt!154618 () (_ BitVec 64))

(assert (=> d!32894 (= lt!154614 (bvmul lt!154616 lt!154618))))

(assert (=> d!32894 (or (= lt!154616 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!154618 (bvsdiv (bvmul lt!154616 lt!154618) lt!154616)))))

(assert (=> d!32894 (= lt!154618 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32894 (= lt!154616 ((_ sign_extend 32) (size!2223 (buf!2589 (_1!4573 lt!153696)))))))

(assert (=> d!32894 (= lt!154615 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5074 (_1!4573 lt!153696))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5069 (_1!4573 lt!153696)))))))

(assert (=> d!32894 (invariant!0 (currentBit!5069 (_1!4573 lt!153696)) (currentByte!5074 (_1!4573 lt!153696)) (size!2223 (buf!2589 (_1!4573 lt!153696))))))

(assert (=> d!32894 (= (bitIndex!0 (size!2223 (buf!2589 (_1!4573 lt!153696))) (currentByte!5074 (_1!4573 lt!153696)) (currentBit!5069 (_1!4573 lt!153696))) lt!154615)))

(declare-fun b!105102 () Bool)

(declare-fun res!86538 () Bool)

(assert (=> b!105102 (=> (not res!86538) (not e!68839))))

(assert (=> b!105102 (= res!86538 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!154615))))

(declare-fun b!105103 () Bool)

(declare-fun lt!154617 () (_ BitVec 64))

(assert (=> b!105103 (= e!68839 (bvsle lt!154615 (bvmul lt!154617 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!105103 (or (= lt!154617 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!154617 #b0000000000000000000000000000000000000000000000000000000000001000) lt!154617)))))

(assert (=> b!105103 (= lt!154617 ((_ sign_extend 32) (size!2223 (buf!2589 (_1!4573 lt!153696)))))))

(assert (= (and d!32894 res!86539) b!105102))

(assert (= (and b!105102 res!86538) b!105103))

(declare-fun m!154269 () Bool)

(assert (=> d!32894 m!154269))

(declare-fun m!154271 () Bool)

(assert (=> d!32894 m!154271))

(assert (=> b!104556 d!32894))

(assert (=> b!104556 d!32856))

(declare-fun d!32896 () Bool)

(declare-fun res!86540 () Bool)

(declare-fun e!68840 () Bool)

(assert (=> d!32896 (=> (not res!86540) (not e!68840))))

(assert (=> d!32896 (= res!86540 (= (size!2223 (buf!2589 (ite c!6428 (_2!4570 lt!152884) lt!153292))) (size!2223 (buf!2589 (ite c!6428 (_2!4570 lt!153280) lt!153292)))))))

(assert (=> d!32896 (= (isPrefixOf!0 (ite c!6428 (_2!4570 lt!152884) lt!153292) (ite c!6428 (_2!4570 lt!153280) lt!153292)) e!68840)))

(declare-fun b!105104 () Bool)

(declare-fun res!86541 () Bool)

(assert (=> b!105104 (=> (not res!86541) (not e!68840))))

(assert (=> b!105104 (= res!86541 (bvsle (bitIndex!0 (size!2223 (buf!2589 (ite c!6428 (_2!4570 lt!152884) lt!153292))) (currentByte!5074 (ite c!6428 (_2!4570 lt!152884) lt!153292)) (currentBit!5069 (ite c!6428 (_2!4570 lt!152884) lt!153292))) (bitIndex!0 (size!2223 (buf!2589 (ite c!6428 (_2!4570 lt!153280) lt!153292))) (currentByte!5074 (ite c!6428 (_2!4570 lt!153280) lt!153292)) (currentBit!5069 (ite c!6428 (_2!4570 lt!153280) lt!153292)))))))

(declare-fun b!105105 () Bool)

(declare-fun e!68841 () Bool)

(assert (=> b!105105 (= e!68840 e!68841)))

(declare-fun res!86542 () Bool)

(assert (=> b!105105 (=> res!86542 e!68841)))

(assert (=> b!105105 (= res!86542 (= (size!2223 (buf!2589 (ite c!6428 (_2!4570 lt!152884) lt!153292))) #b00000000000000000000000000000000))))

(declare-fun b!105106 () Bool)

(assert (=> b!105106 (= e!68841 (arrayBitRangesEq!0 (buf!2589 (ite c!6428 (_2!4570 lt!152884) lt!153292)) (buf!2589 (ite c!6428 (_2!4570 lt!153280) lt!153292)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2223 (buf!2589 (ite c!6428 (_2!4570 lt!152884) lt!153292))) (currentByte!5074 (ite c!6428 (_2!4570 lt!152884) lt!153292)) (currentBit!5069 (ite c!6428 (_2!4570 lt!152884) lt!153292)))))))

(assert (= (and d!32896 res!86540) b!105104))

(assert (= (and b!105104 res!86541) b!105105))

(assert (= (and b!105105 (not res!86542)) b!105106))

(declare-fun m!154273 () Bool)

(assert (=> b!105104 m!154273))

(declare-fun m!154275 () Bool)

(assert (=> b!105104 m!154275))

(assert (=> b!105106 m!154273))

(assert (=> b!105106 m!154273))

(declare-fun m!154277 () Bool)

(assert (=> b!105106 m!154277))

(assert (=> bm!1291 d!32896))

(declare-fun d!32898 () Bool)

(declare-fun e!68842 () Bool)

(assert (=> d!32898 e!68842))

(declare-fun res!86543 () Bool)

(assert (=> d!32898 (=> (not res!86543) (not e!68842))))

(assert (=> d!32898 (= res!86543 (= (buf!2589 (_2!4570 (increaseBitIndex!0 (_1!4572 lt!152882)))) (buf!2589 (_1!4572 lt!152882))))))

(declare-fun lt!154622 () Bool)

(assert (=> d!32898 (= lt!154622 (not (= (bvand ((_ sign_extend 24) (select (arr!2816 (buf!2589 (_1!4572 lt!152882))) (currentByte!5074 (_1!4572 lt!152882)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5069 (_1!4572 lt!152882))))) #b00000000000000000000000000000000)))))

(declare-fun lt!154623 () tuple2!8648)

(assert (=> d!32898 (= lt!154623 (tuple2!8649 (not (= (bvand ((_ sign_extend 24) (select (arr!2816 (buf!2589 (_1!4572 lt!152882))) (currentByte!5074 (_1!4572 lt!152882)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5069 (_1!4572 lt!152882))))) #b00000000000000000000000000000000)) (_2!4570 (increaseBitIndex!0 (_1!4572 lt!152882)))))))

(assert (=> d!32898 (validate_offset_bit!0 ((_ sign_extend 32) (size!2223 (buf!2589 (_1!4572 lt!152882)))) ((_ sign_extend 32) (currentByte!5074 (_1!4572 lt!152882))) ((_ sign_extend 32) (currentBit!5069 (_1!4572 lt!152882))))))

(assert (=> d!32898 (= (readBit!0 (_1!4572 lt!152882)) lt!154623)))

(declare-fun lt!154624 () (_ BitVec 64))

(declare-fun lt!154620 () (_ BitVec 64))

(declare-fun b!105107 () Bool)

(assert (=> b!105107 (= e!68842 (= (bitIndex!0 (size!2223 (buf!2589 (_2!4570 (increaseBitIndex!0 (_1!4572 lt!152882))))) (currentByte!5074 (_2!4570 (increaseBitIndex!0 (_1!4572 lt!152882)))) (currentBit!5069 (_2!4570 (increaseBitIndex!0 (_1!4572 lt!152882))))) (bvadd lt!154620 lt!154624)))))

(assert (=> b!105107 (or (not (= (bvand lt!154620 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!154624 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!154620 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!154620 lt!154624) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!105107 (= lt!154624 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!105107 (= lt!154620 (bitIndex!0 (size!2223 (buf!2589 (_1!4572 lt!152882))) (currentByte!5074 (_1!4572 lt!152882)) (currentBit!5069 (_1!4572 lt!152882))))))

(declare-fun lt!154626 () Bool)

(assert (=> b!105107 (= lt!154626 (not (= (bvand ((_ sign_extend 24) (select (arr!2816 (buf!2589 (_1!4572 lt!152882))) (currentByte!5074 (_1!4572 lt!152882)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5069 (_1!4572 lt!152882))))) #b00000000000000000000000000000000)))))

(declare-fun lt!154625 () Bool)

(assert (=> b!105107 (= lt!154625 (not (= (bvand ((_ sign_extend 24) (select (arr!2816 (buf!2589 (_1!4572 lt!152882))) (currentByte!5074 (_1!4572 lt!152882)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5069 (_1!4572 lt!152882))))) #b00000000000000000000000000000000)))))

(declare-fun lt!154621 () Bool)

(assert (=> b!105107 (= lt!154621 (not (= (bvand ((_ sign_extend 24) (select (arr!2816 (buf!2589 (_1!4572 lt!152882))) (currentByte!5074 (_1!4572 lt!152882)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5069 (_1!4572 lt!152882))))) #b00000000000000000000000000000000)))))

(assert (= (and d!32898 res!86543) b!105107))

(declare-fun m!154279 () Bool)

(assert (=> d!32898 m!154279))

(declare-fun m!154281 () Bool)

(assert (=> d!32898 m!154281))

(declare-fun m!154283 () Bool)

(assert (=> d!32898 m!154283))

(declare-fun m!154285 () Bool)

(assert (=> d!32898 m!154285))

(assert (=> b!105107 m!154283))

(declare-fun m!154287 () Bool)

(assert (=> b!105107 m!154287))

(assert (=> b!105107 m!154281))

(assert (=> b!105107 m!154279))

(assert (=> b!105107 m!153113))

(assert (=> d!32318 d!32898))

(declare-fun d!32900 () Bool)

(declare-fun e!68843 () Bool)

(assert (=> d!32900 e!68843))

(declare-fun res!86544 () Bool)

(assert (=> d!32900 (=> (not res!86544) (not e!68843))))

(declare-fun lt!154628 () (_ BitVec 64))

(declare-fun lt!154627 () BitStream!3920)

(assert (=> d!32900 (= res!86544 (= (bvadd lt!154628 (bvsub lt!153514 lt!153513)) (bitIndex!0 (size!2223 (buf!2589 lt!154627)) (currentByte!5074 lt!154627) (currentBit!5069 lt!154627))))))

(assert (=> d!32900 (or (not (= (bvand lt!154628 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!153514 lt!153513) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!154628 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!154628 (bvsub lt!153514 lt!153513)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32900 (= lt!154628 (bitIndex!0 (size!2223 (buf!2589 (_2!4572 lt!153521))) (currentByte!5074 (_2!4572 lt!153521)) (currentBit!5069 (_2!4572 lt!153521))))))

(assert (=> d!32900 (= lt!154627 (_2!4570 (moveBitIndex!0 (_2!4572 lt!153521) (bvsub lt!153514 lt!153513))))))

(assert (=> d!32900 (moveBitIndexPrecond!0 (_2!4572 lt!153521) (bvsub lt!153514 lt!153513))))

(assert (=> d!32900 (= (withMovedBitIndex!0 (_2!4572 lt!153521) (bvsub lt!153514 lt!153513)) lt!154627)))

(declare-fun b!105108 () Bool)

(assert (=> b!105108 (= e!68843 (= (size!2223 (buf!2589 (_2!4572 lt!153521))) (size!2223 (buf!2589 lt!154627))))))

(assert (= (and d!32900 res!86544) b!105108))

(declare-fun m!154289 () Bool)

(assert (=> d!32900 m!154289))

(assert (=> d!32900 m!154233))

(declare-fun m!154291 () Bool)

(assert (=> d!32900 m!154291))

(declare-fun m!154293 () Bool)

(assert (=> d!32900 m!154293))

(assert (=> b!104482 d!32900))

(assert (=> b!104482 d!32722))

(assert (=> b!104482 d!32376))

(declare-fun b!105109 () Bool)

(declare-fun e!68844 () Unit!6390)

(declare-fun Unit!6445 () Unit!6390)

(assert (=> b!105109 (= e!68844 Unit!6445)))

(declare-fun b!105110 () Bool)

(declare-fun res!86545 () Bool)

(declare-fun e!68845 () Bool)

(assert (=> b!105110 (=> (not res!86545) (not e!68845))))

(declare-fun lt!154640 () tuple2!8634)

(assert (=> b!105110 (= res!86545 (isPrefixOf!0 (_2!4572 lt!154640) (_2!4570 lt!153272)))))

(declare-fun b!105111 () Bool)

(declare-fun lt!154637 () Unit!6390)

(assert (=> b!105111 (= e!68844 lt!154637)))

(declare-fun lt!154643 () (_ BitVec 64))

(assert (=> b!105111 (= lt!154643 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!154642 () (_ BitVec 64))

(assert (=> b!105111 (= lt!154642 (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!152884))) (currentByte!5074 (_2!4570 lt!152884)) (currentBit!5069 (_2!4570 lt!152884))))))

(assert (=> b!105111 (= lt!154637 (arrayBitRangesEqSymmetric!0 (buf!2589 (_2!4570 lt!152884)) (buf!2589 (_2!4570 lt!153272)) lt!154643 lt!154642))))

(assert (=> b!105111 (arrayBitRangesEq!0 (buf!2589 (_2!4570 lt!153272)) (buf!2589 (_2!4570 lt!152884)) lt!154643 lt!154642)))

(declare-fun d!32902 () Bool)

(assert (=> d!32902 e!68845))

(declare-fun res!86546 () Bool)

(assert (=> d!32902 (=> (not res!86546) (not e!68845))))

(assert (=> d!32902 (= res!86546 (isPrefixOf!0 (_1!4572 lt!154640) (_2!4572 lt!154640)))))

(declare-fun lt!154639 () BitStream!3920)

(assert (=> d!32902 (= lt!154640 (tuple2!8635 lt!154639 (_2!4570 lt!153272)))))

(declare-fun lt!154631 () Unit!6390)

(declare-fun lt!154644 () Unit!6390)

(assert (=> d!32902 (= lt!154631 lt!154644)))

(assert (=> d!32902 (isPrefixOf!0 lt!154639 (_2!4570 lt!153272))))

(assert (=> d!32902 (= lt!154644 (lemmaIsPrefixTransitive!0 lt!154639 (_2!4570 lt!153272) (_2!4570 lt!153272)))))

(declare-fun lt!154641 () Unit!6390)

(declare-fun lt!154647 () Unit!6390)

(assert (=> d!32902 (= lt!154641 lt!154647)))

(assert (=> d!32902 (isPrefixOf!0 lt!154639 (_2!4570 lt!153272))))

(assert (=> d!32902 (= lt!154647 (lemmaIsPrefixTransitive!0 lt!154639 (_2!4570 lt!152884) (_2!4570 lt!153272)))))

(declare-fun lt!154648 () Unit!6390)

(assert (=> d!32902 (= lt!154648 e!68844)))

(declare-fun c!6484 () Bool)

(assert (=> d!32902 (= c!6484 (not (= (size!2223 (buf!2589 (_2!4570 lt!152884))) #b00000000000000000000000000000000)))))

(declare-fun lt!154645 () Unit!6390)

(declare-fun lt!154638 () Unit!6390)

(assert (=> d!32902 (= lt!154645 lt!154638)))

(assert (=> d!32902 (isPrefixOf!0 (_2!4570 lt!153272) (_2!4570 lt!153272))))

(assert (=> d!32902 (= lt!154638 (lemmaIsPrefixRefl!0 (_2!4570 lt!153272)))))

(declare-fun lt!154629 () Unit!6390)

(declare-fun lt!154646 () Unit!6390)

(assert (=> d!32902 (= lt!154629 lt!154646)))

(assert (=> d!32902 (= lt!154646 (lemmaIsPrefixRefl!0 (_2!4570 lt!153272)))))

(declare-fun lt!154636 () Unit!6390)

(declare-fun lt!154634 () Unit!6390)

(assert (=> d!32902 (= lt!154636 lt!154634)))

(assert (=> d!32902 (isPrefixOf!0 lt!154639 lt!154639)))

(assert (=> d!32902 (= lt!154634 (lemmaIsPrefixRefl!0 lt!154639))))

(declare-fun lt!154630 () Unit!6390)

(declare-fun lt!154635 () Unit!6390)

(assert (=> d!32902 (= lt!154630 lt!154635)))

(assert (=> d!32902 (isPrefixOf!0 (_2!4570 lt!152884) (_2!4570 lt!152884))))

(assert (=> d!32902 (= lt!154635 (lemmaIsPrefixRefl!0 (_2!4570 lt!152884)))))

(assert (=> d!32902 (= lt!154639 (BitStream!3921 (buf!2589 (_2!4570 lt!153272)) (currentByte!5074 (_2!4570 lt!152884)) (currentBit!5069 (_2!4570 lt!152884))))))

(assert (=> d!32902 (isPrefixOf!0 (_2!4570 lt!152884) (_2!4570 lt!153272))))

(assert (=> d!32902 (= (reader!0 (_2!4570 lt!152884) (_2!4570 lt!153272)) lt!154640)))

(declare-fun lt!154632 () (_ BitVec 64))

(declare-fun lt!154633 () (_ BitVec 64))

(declare-fun b!105112 () Bool)

(assert (=> b!105112 (= e!68845 (= (_1!4572 lt!154640) (withMovedBitIndex!0 (_2!4572 lt!154640) (bvsub lt!154633 lt!154632))))))

(assert (=> b!105112 (or (= (bvand lt!154633 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!154632 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!154633 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!154633 lt!154632) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!105112 (= lt!154632 (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!153272))) (currentByte!5074 (_2!4570 lt!153272)) (currentBit!5069 (_2!4570 lt!153272))))))

(assert (=> b!105112 (= lt!154633 (bitIndex!0 (size!2223 (buf!2589 (_2!4570 lt!152884))) (currentByte!5074 (_2!4570 lt!152884)) (currentBit!5069 (_2!4570 lt!152884))))))

(declare-fun b!105113 () Bool)

(declare-fun res!86547 () Bool)

(assert (=> b!105113 (=> (not res!86547) (not e!68845))))

(assert (=> b!105113 (= res!86547 (isPrefixOf!0 (_1!4572 lt!154640) (_2!4570 lt!152884)))))

(assert (= (and d!32902 c!6484) b!105111))

(assert (= (and d!32902 (not c!6484)) b!105109))

(assert (= (and d!32902 res!86546) b!105113))

(assert (= (and b!105113 res!86547) b!105110))

(assert (= (and b!105110 res!86545) b!105112))

(declare-fun m!154295 () Bool)

(assert (=> d!32902 m!154295))

(declare-fun m!154297 () Bool)

(assert (=> d!32902 m!154297))

(declare-fun m!154299 () Bool)

(assert (=> d!32902 m!154299))

(declare-fun m!154301 () Bool)

(assert (=> d!32902 m!154301))

(declare-fun m!154303 () Bool)

(assert (=> d!32902 m!154303))

(declare-fun m!154305 () Bool)

(assert (=> d!32902 m!154305))

(declare-fun m!154307 () Bool)

(assert (=> d!32902 m!154307))

(declare-fun m!154309 () Bool)

(assert (=> d!32902 m!154309))

(assert (=> d!32902 m!152769))

(assert (=> d!32902 m!152915))

(assert (=> d!32902 m!152917))

(assert (=> b!105111 m!152527))

(declare-fun m!154311 () Bool)

(assert (=> b!105111 m!154311))

(declare-fun m!154313 () Bool)

(assert (=> b!105111 m!154313))

(declare-fun m!154315 () Bool)

(assert (=> b!105112 m!154315))

(assert (=> b!105112 m!152773))

(assert (=> b!105112 m!152527))

(declare-fun m!154317 () Bool)

(assert (=> b!105113 m!154317))

(declare-fun m!154319 () Bool)

(assert (=> b!105110 m!154319))

(assert (=> b!104406 d!32902))

(declare-fun d!32904 () Bool)

(assert (=> d!32904 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2223 (buf!2589 (_2!4570 lt!153272)))) ((_ sign_extend 32) (currentByte!5074 (_2!4570 lt!152884))) ((_ sign_extend 32) (currentBit!5069 (_2!4570 lt!152884))) lt!153271) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2223 (buf!2589 (_2!4570 lt!153272)))) ((_ sign_extend 32) (currentByte!5074 (_2!4570 lt!152884))) ((_ sign_extend 32) (currentBit!5069 (_2!4570 lt!152884)))) lt!153271))))

(declare-fun bs!8039 () Bool)

(assert (= bs!8039 d!32904))

(declare-fun m!154321 () Bool)

(assert (=> bs!8039 m!154321))

(assert (=> b!104406 d!32904))

(declare-fun lt!154649 () tuple2!8638)

(declare-fun d!32906 () Bool)

(assert (=> d!32906 (= lt!154649 (readNLeastSignificantBitsLoop!0 (_1!4572 lt!153249) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!153279))))

(assert (=> d!32906 (= (readNLeastSignificantBitsLoopPure!0 (_1!4572 lt!153249) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!153279) (tuple2!8633 (_2!4574 lt!154649) (_1!4574 lt!154649)))))

(declare-fun bs!8040 () Bool)

(assert (= bs!8040 d!32906))

(declare-fun m!154323 () Bool)

(assert (=> bs!8040 m!154323))

(assert (=> b!104406 d!32906))

(assert (=> b!104406 d!32818))

(declare-fun d!32908 () Bool)

(assert (=> d!32908 (validate_offset_bits!1 ((_ sign_extend 32) (size!2223 (buf!2589 (_2!4570 lt!153272)))) ((_ sign_extend 32) (currentByte!5074 (_2!4570 lt!152884))) ((_ sign_extend 32) (currentBit!5069 (_2!4570 lt!152884))) lt!153271)))

(declare-fun lt!154650 () Unit!6390)

(assert (=> d!32908 (= lt!154650 (choose!9 (_2!4570 lt!152884) (buf!2589 (_2!4570 lt!153272)) lt!153271 (BitStream!3921 (buf!2589 (_2!4570 lt!153272)) (currentByte!5074 (_2!4570 lt!152884)) (currentBit!5069 (_2!4570 lt!152884)))))))

(assert (=> d!32908 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4570 lt!152884) (buf!2589 (_2!4570 lt!153272)) lt!153271) lt!154650)))

(declare-fun bs!8041 () Bool)

(assert (= bs!8041 d!32908))

(assert (=> bs!8041 m!152767))

(declare-fun m!154325 () Bool)

(assert (=> bs!8041 m!154325))

(assert (=> b!104406 d!32908))

(declare-fun d!32910 () Bool)

(assert (=> d!32910 (= (remainingBits!0 ((_ sign_extend 32) (size!2223 (buf!2589 (_2!4570 lt!152884)))) ((_ sign_extend 32) (currentByte!5074 (_2!4570 lt!152884))) ((_ sign_extend 32) (currentBit!5069 (_2!4570 lt!152884)))) (bvsub (bvmul ((_ sign_extend 32) (size!2223 (buf!2589 (_2!4570 lt!152884)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5074 (_2!4570 lt!152884))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5069 (_2!4570 lt!152884))))))))

(assert (=> d!32376 d!32910))

(assert (=> d!32376 d!32858))

(push 1)

(assert (not d!32752))

(assert (not d!32760))

(assert (not b!105113))

(assert (not b!104963))

(assert (not d!32718))

(assert (not b!105015))

(assert (not d!32890))

(assert (not d!32898))

(assert (not b!104922))

(assert (not b!105073))

(assert (not b!105035))

(assert (not b!105034))

(assert (not b!104934))

(assert (not b!105082))

(assert (not d!32862))

(assert (not b!104917))

(assert (not d!32712))

(assert (not d!32730))

(assert (not b!105040))

(assert (not bm!1309))

(assert (not b!105072))

(assert (not d!32790))

(assert (not d!32854))

(assert (not d!32844))

(assert (not b!105037))

(assert (not b!105098))

(assert (not d!32826))

(assert (not b!104891))

(assert (not b!105112))

(assert (not d!32722))

(assert (not b!104919))

(assert (not b!105069))

(assert (not b!104991))

(assert (not b!104932))

(assert (not b!105110))

(assert (not b!104989))

(assert (not b!105004))

(assert (not b!105027))

(assert (not b!105070))

(assert (not b!105107))

(assert (not b!105099))

(assert (not b!105012))

(assert (not b!104924))

(assert (not b!105013))

(assert (not d!32690))

(assert (not d!32726))

(assert (not d!32686))

(assert (not d!32864))

(assert (not d!32820))

(assert (not b!105100))

(assert (not b!104997))

(assert (not d!32770))

(assert (not b!105057))

(assert (not b!105104))

(assert (not d!32814))

(assert (not d!32804))

(assert (not d!32800))

(assert (not b!104974))

(assert (not b!104965))

(assert (not d!32792))

(assert (not b!105019))

(assert (not d!32852))

(assert (not d!32802))

(assert (not d!32842))

(assert (not b!105030))

(assert (not b!104973))

(assert (not b!104958))

(assert (not b!104968))

(assert (not d!32888))

(assert (not d!32834))

(assert (not b!105001))

(assert (not b!105000))

(assert (not bm!1311))

(assert (not b!104960))

(assert (not d!32794))

(assert (not d!32758))

(assert (not b!104977))

(assert (not d!32708))

(assert (not b!104915))

(assert (not d!32774))

(assert (not d!32816))

(assert (not d!32778))

(assert (not b!104950))

(assert (not b!105097))

(assert (not d!32734))

(assert (not bm!1310))

(assert (not b!105062))

(assert (not d!32772))

(assert (not b!105079))

(assert (not d!32764))

(assert (not b!105014))

(assert (not b!104985))

(assert (not b!105066))

(assert (not d!32742))

(assert (not b!104994))

(assert (not d!32776))

(assert (not d!32880))

(assert (not b!104941))

(assert (not b!105006))

(assert (not d!32786))

(assert (not d!32876))

(assert (not b!104929))

(assert (not b!105063))

(assert (not d!32836))

(assert (not b!105005))

(assert (not d!32784))

(assert (not b!104979))

(assert (not b!104980))

(assert (not b!104988))

(assert (not bm!1308))

(assert (not b!104971))

(assert (not b!105038))

(assert (not b!105045))

(assert (not d!32798))

(assert (not d!32796))

(assert (not d!32688))

(assert (not d!32788))

(assert (not b!105078))

(assert (not d!32900))

(assert (not d!32746))

(assert (not b!105017))

(assert (not d!32810))

(assert (not b!105031))

(assert (not b!104892))

(assert (not d!32902))

(assert (not b!105046))

(assert (not d!32822))

(assert (not b!104889))

(assert (not d!32866))

(assert (not b!104987))

(assert (not d!32780))

(assert (not b!104990))

(assert (not b!104928))

(assert (not b!105020))

(assert (not b!104943))

(assert (not d!32906))

(assert (not b!105076))

(assert (not b!105106))

(assert (not b!104961))

(assert (not d!32846))

(assert (not b!104976))

(assert (not d!32894))

(assert (not b!104998))

(assert (not b!105018))

(assert (not d!32738))

(assert (not b!104939))

(assert (not b!104925))

(assert (not b!104982))

(assert (not d!32904))

(assert (not b!105003))

(assert (not b!104888))

(assert (not b!105084))

(assert (not d!32808))

(assert (not b!105081))

(assert (not d!32698))

(assert (not d!32856))

(assert (not b!104970))

(assert (not b!105096))

(assert (not d!32840))

(assert (not d!32892))

(assert (not d!32732))

(assert (not d!32908))

(assert (not d!32724))

(assert (not d!32766))

(assert (not b!105075))

(assert (not b!105111))

(assert (not b!105028))

(assert (not d!32860))

(assert (not b!104926))

(assert (not b!105067))

(assert (not bm!1307))

(assert (not b!105042))

(assert (not b!105048))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

