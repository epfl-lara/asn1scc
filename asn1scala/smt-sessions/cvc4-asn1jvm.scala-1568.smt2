; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44434 () Bool)

(assert start!44434)

(declare-fun b!211745 () Bool)

(declare-fun e!144369 () Bool)

(declare-datatypes ((array!10512 0))(
  ( (array!10513 (arr!5547 (Array (_ BitVec 32) (_ BitVec 8))) (size!4617 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8342 0))(
  ( (BitStream!8343 (buf!5143 array!10512) (currentByte!9703 (_ BitVec 32)) (currentBit!9698 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!18126 0))(
  ( (tuple2!18127 (_1!9718 BitStream!8342) (_2!9718 Bool)) )
))
(declare-fun lt!333520 () tuple2!18126)

(declare-fun lt!333518 () tuple2!18126)

(assert (=> b!211745 (= e!144369 (= (_2!9718 lt!333520) (_2!9718 lt!333518)))))

(declare-fun b!211746 () Bool)

(declare-fun e!144367 () Bool)

(declare-fun e!144362 () Bool)

(assert (=> b!211746 (= e!144367 (not e!144362))))

(declare-fun res!177841 () Bool)

(assert (=> b!211746 (=> res!177841 e!144362)))

(declare-fun lt!333505 () (_ BitVec 64))

(declare-fun lt!333516 () (_ BitVec 64))

(assert (=> b!211746 (= res!177841 (not (= lt!333505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!333516))))))

(declare-datatypes ((Unit!15101 0))(
  ( (Unit!15102) )
))
(declare-datatypes ((tuple2!18128 0))(
  ( (tuple2!18129 (_1!9719 Unit!15101) (_2!9719 BitStream!8342)) )
))
(declare-fun lt!333522 () tuple2!18128)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!211746 (= lt!333505 (bitIndex!0 (size!4617 (buf!5143 (_2!9719 lt!333522))) (currentByte!9703 (_2!9719 lt!333522)) (currentBit!9698 (_2!9719 lt!333522))))))

(declare-fun thiss!1204 () BitStream!8342)

(assert (=> b!211746 (= lt!333516 (bitIndex!0 (size!4617 (buf!5143 thiss!1204)) (currentByte!9703 thiss!1204) (currentBit!9698 thiss!1204)))))

(declare-fun e!144357 () Bool)

(assert (=> b!211746 e!144357))

(declare-fun res!177842 () Bool)

(assert (=> b!211746 (=> (not res!177842) (not e!144357))))

(assert (=> b!211746 (= res!177842 (= (size!4617 (buf!5143 thiss!1204)) (size!4617 (buf!5143 (_2!9719 lt!333522)))))))

(declare-fun lt!333504 () Bool)

(declare-fun appendBit!0 (BitStream!8342 Bool) tuple2!18128)

(assert (=> b!211746 (= lt!333522 (appendBit!0 thiss!1204 lt!333504))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun lt!333517 () (_ BitVec 64))

(assert (=> b!211746 (= lt!333504 (not (= (bvand v!189 lt!333517) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!211746 (= lt!333517 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!211747 () Bool)

(declare-fun e!144366 () Bool)

(declare-fun e!144368 () Bool)

(assert (=> b!211747 (= e!144366 e!144368)))

(declare-fun res!177844 () Bool)

(assert (=> b!211747 (=> res!177844 e!144368)))

(declare-fun lt!333507 () (_ BitVec 64))

(declare-datatypes ((tuple2!18130 0))(
  ( (tuple2!18131 (_1!9720 BitStream!8342) (_2!9720 BitStream!8342)) )
))
(declare-fun lt!333524 () tuple2!18130)

(declare-fun nBits!348 () (_ BitVec 32))

(declare-datatypes ((tuple2!18132 0))(
  ( (tuple2!18133 (_1!9721 BitStream!8342) (_2!9721 (_ BitVec 64))) )
))
(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8342 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18132)

(assert (=> b!211747 (= res!177844 (not (= (_1!9721 (readNBitsLSBFirstsLoopPure!0 (_1!9720 lt!333524) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!333507)) (_2!9720 lt!333524))))))

(declare-fun lt!333521 () tuple2!18128)

(declare-fun lt!333503 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!211747 (validate_offset_bits!1 ((_ sign_extend 32) (size!4617 (buf!5143 (_2!9719 lt!333521)))) ((_ sign_extend 32) (currentByte!9703 (_2!9719 lt!333522))) ((_ sign_extend 32) (currentBit!9698 (_2!9719 lt!333522))) lt!333503)))

(declare-fun lt!333511 () Unit!15101)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8342 array!10512 (_ BitVec 64)) Unit!15101)

(assert (=> b!211747 (= lt!333511 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9719 lt!333522) (buf!5143 (_2!9719 lt!333521)) lt!333503))))

(assert (=> b!211747 (= lt!333503 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!333515 () tuple2!18126)

(declare-fun lt!333519 () (_ BitVec 64))

(assert (=> b!211747 (= lt!333507 (bvor lt!333519 (ite (_2!9718 lt!333515) lt!333517 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!333500 () tuple2!18132)

(declare-fun lt!333514 () tuple2!18130)

(assert (=> b!211747 (= lt!333500 (readNBitsLSBFirstsLoopPure!0 (_1!9720 lt!333514) nBits!348 i!590 lt!333519))))

(declare-fun lt!333512 () (_ BitVec 64))

(assert (=> b!211747 (validate_offset_bits!1 ((_ sign_extend 32) (size!4617 (buf!5143 (_2!9719 lt!333521)))) ((_ sign_extend 32) (currentByte!9703 thiss!1204)) ((_ sign_extend 32) (currentBit!9698 thiss!1204)) lt!333512)))

(declare-fun lt!333499 () Unit!15101)

(assert (=> b!211747 (= lt!333499 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5143 (_2!9719 lt!333521)) lt!333512))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!211747 (= lt!333519 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!211747 (= (_2!9718 lt!333515) lt!333504)))

(declare-fun readBitPure!0 (BitStream!8342) tuple2!18126)

(assert (=> b!211747 (= lt!333515 (readBitPure!0 (_1!9720 lt!333514)))))

(declare-fun reader!0 (BitStream!8342 BitStream!8342) tuple2!18130)

(assert (=> b!211747 (= lt!333524 (reader!0 (_2!9719 lt!333522) (_2!9719 lt!333521)))))

(assert (=> b!211747 (= lt!333514 (reader!0 thiss!1204 (_2!9719 lt!333521)))))

(assert (=> b!211747 e!144369))

(declare-fun res!177832 () Bool)

(assert (=> b!211747 (=> (not res!177832) (not e!144369))))

(assert (=> b!211747 (= res!177832 (= (bitIndex!0 (size!4617 (buf!5143 (_1!9718 lt!333520))) (currentByte!9703 (_1!9718 lt!333520)) (currentBit!9698 (_1!9718 lt!333520))) (bitIndex!0 (size!4617 (buf!5143 (_1!9718 lt!333518))) (currentByte!9703 (_1!9718 lt!333518)) (currentBit!9698 (_1!9718 lt!333518)))))))

(declare-fun lt!333513 () Unit!15101)

(declare-fun lt!333508 () BitStream!8342)

(declare-fun readBitPrefixLemma!0 (BitStream!8342 BitStream!8342) Unit!15101)

(assert (=> b!211747 (= lt!333513 (readBitPrefixLemma!0 lt!333508 (_2!9719 lt!333521)))))

(assert (=> b!211747 (= lt!333518 (readBitPure!0 (BitStream!8343 (buf!5143 (_2!9719 lt!333521)) (currentByte!9703 thiss!1204) (currentBit!9698 thiss!1204))))))

(assert (=> b!211747 (= lt!333520 (readBitPure!0 lt!333508))))

(declare-fun e!144365 () Bool)

(assert (=> b!211747 e!144365))

(declare-fun res!177839 () Bool)

(assert (=> b!211747 (=> (not res!177839) (not e!144365))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!211747 (= res!177839 (invariant!0 (currentBit!9698 thiss!1204) (currentByte!9703 thiss!1204) (size!4617 (buf!5143 (_2!9719 lt!333522)))))))

(assert (=> b!211747 (= lt!333508 (BitStream!8343 (buf!5143 (_2!9719 lt!333522)) (currentByte!9703 thiss!1204) (currentBit!9698 thiss!1204)))))

(declare-fun b!211749 () Bool)

(assert (=> b!211749 (= e!144362 e!144366)))

(declare-fun res!177836 () Bool)

(assert (=> b!211749 (=> res!177836 e!144366)))

(declare-fun lt!333498 () (_ BitVec 64))

(assert (=> b!211749 (= res!177836 (not (= lt!333498 (bvsub (bvsub (bvadd lt!333505 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!211749 (= lt!333498 (bitIndex!0 (size!4617 (buf!5143 (_2!9719 lt!333521))) (currentByte!9703 (_2!9719 lt!333521)) (currentBit!9698 (_2!9719 lt!333521))))))

(declare-fun isPrefixOf!0 (BitStream!8342 BitStream!8342) Bool)

(assert (=> b!211749 (isPrefixOf!0 thiss!1204 (_2!9719 lt!333521))))

(declare-fun lt!333523 () Unit!15101)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8342 BitStream!8342 BitStream!8342) Unit!15101)

(assert (=> b!211749 (= lt!333523 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9719 lt!333522) (_2!9719 lt!333521)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8342 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!18128)

(assert (=> b!211749 (= lt!333521 (appendBitsLSBFirstLoopTR!0 (_2!9719 lt!333522) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!211750 () Bool)

(declare-fun e!144359 () Bool)

(assert (=> b!211750 (= e!144357 e!144359)))

(declare-fun res!177834 () Bool)

(assert (=> b!211750 (=> (not res!177834) (not e!144359))))

(declare-fun lt!333497 () (_ BitVec 64))

(declare-fun lt!333501 () (_ BitVec 64))

(assert (=> b!211750 (= res!177834 (= lt!333497 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!333501)))))

(assert (=> b!211750 (= lt!333497 (bitIndex!0 (size!4617 (buf!5143 (_2!9719 lt!333522))) (currentByte!9703 (_2!9719 lt!333522)) (currentBit!9698 (_2!9719 lt!333522))))))

(assert (=> b!211750 (= lt!333501 (bitIndex!0 (size!4617 (buf!5143 thiss!1204)) (currentByte!9703 thiss!1204) (currentBit!9698 thiss!1204)))))

(declare-fun b!211751 () Bool)

(declare-fun res!177840 () Bool)

(assert (=> b!211751 (=> res!177840 e!144366)))

(assert (=> b!211751 (= res!177840 (not (invariant!0 (currentBit!9698 (_2!9719 lt!333521)) (currentByte!9703 (_2!9719 lt!333521)) (size!4617 (buf!5143 (_2!9719 lt!333521))))))))

(declare-fun b!211752 () Bool)

(declare-fun res!177831 () Bool)

(assert (=> b!211752 (=> res!177831 e!144366)))

(assert (=> b!211752 (= res!177831 (not (isPrefixOf!0 (_2!9719 lt!333522) (_2!9719 lt!333521))))))

(declare-fun b!211753 () Bool)

(declare-fun e!144358 () Bool)

(declare-fun array_inv!4358 (array!10512) Bool)

(assert (=> b!211753 (= e!144358 (array_inv!4358 (buf!5143 thiss!1204)))))

(declare-fun b!211754 () Bool)

(declare-fun e!144363 () Bool)

(declare-fun lt!333509 () tuple2!18126)

(assert (=> b!211754 (= e!144363 (= (bitIndex!0 (size!4617 (buf!5143 (_1!9718 lt!333509))) (currentByte!9703 (_1!9718 lt!333509)) (currentBit!9698 (_1!9718 lt!333509))) lt!333497))))

(declare-fun b!211755 () Bool)

(declare-fun res!177830 () Bool)

(assert (=> b!211755 (=> (not res!177830) (not e!144367))))

(assert (=> b!211755 (= res!177830 (not (= i!590 nBits!348)))))

(declare-fun b!211756 () Bool)

(declare-fun res!177845 () Bool)

(declare-fun e!144360 () Bool)

(assert (=> b!211756 (=> (not res!177845) (not e!144360))))

(declare-fun withMovedBitIndex!0 (BitStream!8342 (_ BitVec 64)) BitStream!8342)

(assert (=> b!211756 (= res!177845 (= (_1!9720 lt!333514) (withMovedBitIndex!0 (_2!9720 lt!333514) (bvsub lt!333516 lt!333498))))))

(declare-fun b!211757 () Bool)

(declare-fun lt!333506 () (_ BitVec 64))

(assert (=> b!211757 (= e!144368 (or (= lt!333506 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!333506 (bvand (bvsub lt!333505 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!211757 (= lt!333506 (bvand lt!333505 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!211757 e!144360))

(declare-fun res!177837 () Bool)

(assert (=> b!211757 (=> (not res!177837) (not e!144360))))

(declare-fun lt!333510 () tuple2!18132)

(assert (=> b!211757 (= res!177837 (and (= (_2!9721 lt!333500) (_2!9721 lt!333510)) (= (_1!9721 lt!333500) (_1!9721 lt!333510))))))

(declare-fun lt!333502 () Unit!15101)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8342 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!15101)

(assert (=> b!211757 (= lt!333502 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9720 lt!333514) nBits!348 i!590 lt!333519))))

(assert (=> b!211757 (= lt!333510 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9720 lt!333514) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!333507))))

(declare-fun b!211758 () Bool)

(declare-fun res!177846 () Bool)

(assert (=> b!211758 (=> (not res!177846) (not e!144367))))

(assert (=> b!211758 (= res!177846 (invariant!0 (currentBit!9698 thiss!1204) (currentByte!9703 thiss!1204) (size!4617 (buf!5143 thiss!1204))))))

(declare-fun b!211759 () Bool)

(declare-fun e!144361 () Bool)

(assert (=> b!211759 (= e!144361 e!144367)))

(declare-fun res!177833 () Bool)

(assert (=> b!211759 (=> (not res!177833) (not e!144367))))

(assert (=> b!211759 (= res!177833 (validate_offset_bits!1 ((_ sign_extend 32) (size!4617 (buf!5143 thiss!1204))) ((_ sign_extend 32) (currentByte!9703 thiss!1204)) ((_ sign_extend 32) (currentBit!9698 thiss!1204)) lt!333512))))

(assert (=> b!211759 (= lt!333512 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!211760 () Bool)

(assert (=> b!211760 (= e!144365 (invariant!0 (currentBit!9698 thiss!1204) (currentByte!9703 thiss!1204) (size!4617 (buf!5143 (_2!9719 lt!333521)))))))

(declare-fun b!211748 () Bool)

(assert (=> b!211748 (= e!144360 (= (_1!9720 lt!333524) (withMovedBitIndex!0 (_2!9720 lt!333524) (bvsub lt!333505 lt!333498))))))

(declare-fun res!177835 () Bool)

(assert (=> start!44434 (=> (not res!177835) (not e!144361))))

(assert (=> start!44434 (= res!177835 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!44434 e!144361))

(assert (=> start!44434 true))

(declare-fun inv!12 (BitStream!8342) Bool)

(assert (=> start!44434 (and (inv!12 thiss!1204) e!144358)))

(declare-fun b!211761 () Bool)

(assert (=> b!211761 (= e!144359 e!144363)))

(declare-fun res!177847 () Bool)

(assert (=> b!211761 (=> (not res!177847) (not e!144363))))

(assert (=> b!211761 (= res!177847 (and (= (_2!9718 lt!333509) lt!333504) (= (_1!9718 lt!333509) (_2!9719 lt!333522))))))

(declare-fun readerFrom!0 (BitStream!8342 (_ BitVec 32) (_ BitVec 32)) BitStream!8342)

(assert (=> b!211761 (= lt!333509 (readBitPure!0 (readerFrom!0 (_2!9719 lt!333522) (currentBit!9698 thiss!1204) (currentByte!9703 thiss!1204))))))

(declare-fun b!211762 () Bool)

(declare-fun res!177843 () Bool)

(assert (=> b!211762 (=> res!177843 e!144366)))

(assert (=> b!211762 (= res!177843 (not (isPrefixOf!0 thiss!1204 (_2!9719 lt!333522))))))

(declare-fun b!211763 () Bool)

(declare-fun res!177838 () Bool)

(assert (=> b!211763 (=> res!177838 e!144366)))

(assert (=> b!211763 (= res!177838 (or (not (= (size!4617 (buf!5143 (_2!9719 lt!333521))) (size!4617 (buf!5143 thiss!1204)))) (not (= lt!333498 (bvsub (bvadd lt!333516 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!211764 () Bool)

(declare-fun res!177848 () Bool)

(assert (=> b!211764 (=> (not res!177848) (not e!144359))))

(assert (=> b!211764 (= res!177848 (isPrefixOf!0 thiss!1204 (_2!9719 lt!333522)))))

(assert (= (and start!44434 res!177835) b!211759))

(assert (= (and b!211759 res!177833) b!211758))

(assert (= (and b!211758 res!177846) b!211755))

(assert (= (and b!211755 res!177830) b!211746))

(assert (= (and b!211746 res!177842) b!211750))

(assert (= (and b!211750 res!177834) b!211764))

(assert (= (and b!211764 res!177848) b!211761))

(assert (= (and b!211761 res!177847) b!211754))

(assert (= (and b!211746 (not res!177841)) b!211749))

(assert (= (and b!211749 (not res!177836)) b!211751))

(assert (= (and b!211751 (not res!177840)) b!211763))

(assert (= (and b!211763 (not res!177838)) b!211752))

(assert (= (and b!211752 (not res!177831)) b!211762))

(assert (= (and b!211762 (not res!177843)) b!211747))

(assert (= (and b!211747 res!177839) b!211760))

(assert (= (and b!211747 res!177832) b!211745))

(assert (= (and b!211747 (not res!177844)) b!211757))

(assert (= (and b!211757 res!177837) b!211756))

(assert (= (and b!211756 res!177845) b!211748))

(assert (= start!44434 b!211753))

(declare-fun m!326331 () Bool)

(assert (=> b!211747 m!326331))

(declare-fun m!326333 () Bool)

(assert (=> b!211747 m!326333))

(declare-fun m!326335 () Bool)

(assert (=> b!211747 m!326335))

(declare-fun m!326337 () Bool)

(assert (=> b!211747 m!326337))

(declare-fun m!326339 () Bool)

(assert (=> b!211747 m!326339))

(declare-fun m!326341 () Bool)

(assert (=> b!211747 m!326341))

(declare-fun m!326343 () Bool)

(assert (=> b!211747 m!326343))

(declare-fun m!326345 () Bool)

(assert (=> b!211747 m!326345))

(declare-fun m!326347 () Bool)

(assert (=> b!211747 m!326347))

(declare-fun m!326349 () Bool)

(assert (=> b!211747 m!326349))

(declare-fun m!326351 () Bool)

(assert (=> b!211747 m!326351))

(declare-fun m!326353 () Bool)

(assert (=> b!211747 m!326353))

(declare-fun m!326355 () Bool)

(assert (=> b!211747 m!326355))

(declare-fun m!326357 () Bool)

(assert (=> b!211747 m!326357))

(declare-fun m!326359 () Bool)

(assert (=> b!211747 m!326359))

(declare-fun m!326361 () Bool)

(assert (=> b!211747 m!326361))

(declare-fun m!326363 () Bool)

(assert (=> b!211754 m!326363))

(declare-fun m!326365 () Bool)

(assert (=> b!211756 m!326365))

(declare-fun m!326367 () Bool)

(assert (=> b!211750 m!326367))

(declare-fun m!326369 () Bool)

(assert (=> b!211750 m!326369))

(declare-fun m!326371 () Bool)

(assert (=> b!211752 m!326371))

(declare-fun m!326373 () Bool)

(assert (=> b!211751 m!326373))

(declare-fun m!326375 () Bool)

(assert (=> b!211749 m!326375))

(declare-fun m!326377 () Bool)

(assert (=> b!211749 m!326377))

(declare-fun m!326379 () Bool)

(assert (=> b!211749 m!326379))

(declare-fun m!326381 () Bool)

(assert (=> b!211749 m!326381))

(declare-fun m!326383 () Bool)

(assert (=> b!211757 m!326383))

(declare-fun m!326385 () Bool)

(assert (=> b!211757 m!326385))

(assert (=> b!211757 m!326385))

(declare-fun m!326387 () Bool)

(assert (=> b!211757 m!326387))

(declare-fun m!326389 () Bool)

(assert (=> b!211758 m!326389))

(declare-fun m!326391 () Bool)

(assert (=> b!211761 m!326391))

(assert (=> b!211761 m!326391))

(declare-fun m!326393 () Bool)

(assert (=> b!211761 m!326393))

(declare-fun m!326395 () Bool)

(assert (=> b!211753 m!326395))

(declare-fun m!326397 () Bool)

(assert (=> b!211760 m!326397))

(declare-fun m!326399 () Bool)

(assert (=> b!211748 m!326399))

(declare-fun m!326401 () Bool)

(assert (=> b!211764 m!326401))

(assert (=> b!211762 m!326401))

(declare-fun m!326403 () Bool)

(assert (=> b!211759 m!326403))

(assert (=> b!211746 m!326367))

(assert (=> b!211746 m!326369))

(declare-fun m!326405 () Bool)

(assert (=> b!211746 m!326405))

(declare-fun m!326407 () Bool)

(assert (=> start!44434 m!326407))

(push 1)

(assert (not b!211761))

(assert (not b!211760))

(assert (not b!211747))

(assert (not b!211762))

(assert (not b!211752))

(assert (not b!211746))

(assert (not b!211759))

(assert (not b!211753))

(assert (not b!211750))

(assert (not start!44434))

(assert (not b!211756))

(assert (not b!211764))

(assert (not b!211751))

(assert (not b!211754))

(assert (not b!211748))

(assert (not b!211758))

(assert (not b!211749))

(assert (not b!211757))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!71733 () Bool)

(declare-fun res!177870 () Bool)

(declare-fun e!144384 () Bool)

(assert (=> d!71733 (=> (not res!177870) (not e!144384))))

(assert (=> d!71733 (= res!177870 (= (size!4617 (buf!5143 thiss!1204)) (size!4617 (buf!5143 (_2!9719 lt!333522)))))))

(assert (=> d!71733 (= (isPrefixOf!0 thiss!1204 (_2!9719 lt!333522)) e!144384)))

(declare-fun b!211786 () Bool)

(declare-fun res!177871 () Bool)

(assert (=> b!211786 (=> (not res!177871) (not e!144384))))

(assert (=> b!211786 (= res!177871 (bvsle (bitIndex!0 (size!4617 (buf!5143 thiss!1204)) (currentByte!9703 thiss!1204) (currentBit!9698 thiss!1204)) (bitIndex!0 (size!4617 (buf!5143 (_2!9719 lt!333522))) (currentByte!9703 (_2!9719 lt!333522)) (currentBit!9698 (_2!9719 lt!333522)))))))

(declare-fun b!211787 () Bool)

(declare-fun e!144383 () Bool)

(assert (=> b!211787 (= e!144384 e!144383)))

(declare-fun res!177872 () Bool)

(assert (=> b!211787 (=> res!177872 e!144383)))

(assert (=> b!211787 (= res!177872 (= (size!4617 (buf!5143 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!211788 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10512 array!10512 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!211788 (= e!144383 (arrayBitRangesEq!0 (buf!5143 thiss!1204) (buf!5143 (_2!9719 lt!333522)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4617 (buf!5143 thiss!1204)) (currentByte!9703 thiss!1204) (currentBit!9698 thiss!1204))))))

(assert (= (and d!71733 res!177870) b!211786))

(assert (= (and b!211786 res!177871) b!211787))

(assert (= (and b!211787 (not res!177872)) b!211788))

(assert (=> b!211786 m!326369))

(assert (=> b!211786 m!326367))

(assert (=> b!211788 m!326369))

(assert (=> b!211788 m!326369))

(declare-fun m!326415 () Bool)

(assert (=> b!211788 m!326415))

(assert (=> b!211762 d!71733))

(declare-fun d!71735 () Bool)

(assert (=> d!71735 (= (invariant!0 (currentBit!9698 (_2!9719 lt!333521)) (currentByte!9703 (_2!9719 lt!333521)) (size!4617 (buf!5143 (_2!9719 lt!333521)))) (and (bvsge (currentBit!9698 (_2!9719 lt!333521)) #b00000000000000000000000000000000) (bvslt (currentBit!9698 (_2!9719 lt!333521)) #b00000000000000000000000000001000) (bvsge (currentByte!9703 (_2!9719 lt!333521)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9703 (_2!9719 lt!333521)) (size!4617 (buf!5143 (_2!9719 lt!333521)))) (and (= (currentBit!9698 (_2!9719 lt!333521)) #b00000000000000000000000000000000) (= (currentByte!9703 (_2!9719 lt!333521)) (size!4617 (buf!5143 (_2!9719 lt!333521))))))))))

(assert (=> b!211751 d!71735))

(declare-fun d!71737 () Bool)

(declare-fun res!177873 () Bool)

(declare-fun e!144386 () Bool)

(assert (=> d!71737 (=> (not res!177873) (not e!144386))))

(assert (=> d!71737 (= res!177873 (= (size!4617 (buf!5143 (_2!9719 lt!333522))) (size!4617 (buf!5143 (_2!9719 lt!333521)))))))

(assert (=> d!71737 (= (isPrefixOf!0 (_2!9719 lt!333522) (_2!9719 lt!333521)) e!144386)))

(declare-fun b!211789 () Bool)

(declare-fun res!177874 () Bool)

(assert (=> b!211789 (=> (not res!177874) (not e!144386))))

(assert (=> b!211789 (= res!177874 (bvsle (bitIndex!0 (size!4617 (buf!5143 (_2!9719 lt!333522))) (currentByte!9703 (_2!9719 lt!333522)) (currentBit!9698 (_2!9719 lt!333522))) (bitIndex!0 (size!4617 (buf!5143 (_2!9719 lt!333521))) (currentByte!9703 (_2!9719 lt!333521)) (currentBit!9698 (_2!9719 lt!333521)))))))

(declare-fun b!211790 () Bool)

(declare-fun e!144385 () Bool)

(assert (=> b!211790 (= e!144386 e!144385)))

(declare-fun res!177875 () Bool)

(assert (=> b!211790 (=> res!177875 e!144385)))

(assert (=> b!211790 (= res!177875 (= (size!4617 (buf!5143 (_2!9719 lt!333522))) #b00000000000000000000000000000000))))

(declare-fun b!211791 () Bool)

(assert (=> b!211791 (= e!144385 (arrayBitRangesEq!0 (buf!5143 (_2!9719 lt!333522)) (buf!5143 (_2!9719 lt!333521)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4617 (buf!5143 (_2!9719 lt!333522))) (currentByte!9703 (_2!9719 lt!333522)) (currentBit!9698 (_2!9719 lt!333522)))))))

(assert (= (and d!71737 res!177873) b!211789))

(assert (= (and b!211789 res!177874) b!211790))

(assert (= (and b!211790 (not res!177875)) b!211791))

(assert (=> b!211789 m!326367))

(assert (=> b!211789 m!326375))

(assert (=> b!211791 m!326367))

(assert (=> b!211791 m!326367))

(declare-fun m!326417 () Bool)

(assert (=> b!211791 m!326417))

(assert (=> b!211752 d!71737))

(assert (=> b!211764 d!71733))

(declare-fun d!71739 () Bool)

(assert (=> d!71739 (= (array_inv!4358 (buf!5143 thiss!1204)) (bvsge (size!4617 (buf!5143 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!211753 d!71739))

(declare-fun d!71741 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!71741 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4617 (buf!5143 thiss!1204))) ((_ sign_extend 32) (currentByte!9703 thiss!1204)) ((_ sign_extend 32) (currentBit!9698 thiss!1204)) lt!333512) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4617 (buf!5143 thiss!1204))) ((_ sign_extend 32) (currentByte!9703 thiss!1204)) ((_ sign_extend 32) (currentBit!9698 thiss!1204))) lt!333512))))

(declare-fun bs!17602 () Bool)

(assert (= bs!17602 d!71741))

(declare-fun m!326419 () Bool)

(assert (=> bs!17602 m!326419))

(assert (=> b!211759 d!71741))

(declare-fun d!71743 () Bool)

(assert (=> d!71743 (= (invariant!0 (currentBit!9698 thiss!1204) (currentByte!9703 thiss!1204) (size!4617 (buf!5143 (_2!9719 lt!333521)))) (and (bvsge (currentBit!9698 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9698 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9703 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9703 thiss!1204) (size!4617 (buf!5143 (_2!9719 lt!333521)))) (and (= (currentBit!9698 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9703 thiss!1204) (size!4617 (buf!5143 (_2!9719 lt!333521))))))))))

(assert (=> b!211760 d!71743))

(declare-fun d!71745 () Bool)

(declare-fun e!144389 () Bool)

(assert (=> d!71745 e!144389))

(declare-fun res!177880 () Bool)

(assert (=> d!71745 (=> (not res!177880) (not e!144389))))

(declare-fun lt!333559 () (_ BitVec 64))

(declare-fun lt!333563 () (_ BitVec 64))

(declare-fun lt!333561 () (_ BitVec 64))

(assert (=> d!71745 (= res!177880 (= lt!333559 (bvsub lt!333561 lt!333563)))))

(assert (=> d!71745 (or (= (bvand lt!333561 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!333563 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!333561 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!333561 lt!333563) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71745 (= lt!333563 (remainingBits!0 ((_ sign_extend 32) (size!4617 (buf!5143 (_2!9719 lt!333521)))) ((_ sign_extend 32) (currentByte!9703 (_2!9719 lt!333521))) ((_ sign_extend 32) (currentBit!9698 (_2!9719 lt!333521)))))))

(declare-fun lt!333562 () (_ BitVec 64))

(declare-fun lt!333558 () (_ BitVec 64))

(assert (=> d!71745 (= lt!333561 (bvmul lt!333562 lt!333558))))

(assert (=> d!71745 (or (= lt!333562 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!333558 (bvsdiv (bvmul lt!333562 lt!333558) lt!333562)))))

(assert (=> d!71745 (= lt!333558 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71745 (= lt!333562 ((_ sign_extend 32) (size!4617 (buf!5143 (_2!9719 lt!333521)))))))

(assert (=> d!71745 (= lt!333559 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9703 (_2!9719 lt!333521))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9698 (_2!9719 lt!333521)))))))

(assert (=> d!71745 (invariant!0 (currentBit!9698 (_2!9719 lt!333521)) (currentByte!9703 (_2!9719 lt!333521)) (size!4617 (buf!5143 (_2!9719 lt!333521))))))

(assert (=> d!71745 (= (bitIndex!0 (size!4617 (buf!5143 (_2!9719 lt!333521))) (currentByte!9703 (_2!9719 lt!333521)) (currentBit!9698 (_2!9719 lt!333521))) lt!333559)))

(declare-fun b!211796 () Bool)

(declare-fun res!177881 () Bool)

(assert (=> b!211796 (=> (not res!177881) (not e!144389))))

(assert (=> b!211796 (= res!177881 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!333559))))

(declare-fun b!211797 () Bool)

(declare-fun lt!333560 () (_ BitVec 64))

(assert (=> b!211797 (= e!144389 (bvsle lt!333559 (bvmul lt!333560 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!211797 (or (= lt!333560 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!333560 #b0000000000000000000000000000000000000000000000000000000000001000) lt!333560)))))

(assert (=> b!211797 (= lt!333560 ((_ sign_extend 32) (size!4617 (buf!5143 (_2!9719 lt!333521)))))))

(assert (= (and d!71745 res!177880) b!211796))

(assert (= (and b!211796 res!177881) b!211797))

(declare-fun m!326421 () Bool)

(assert (=> d!71745 m!326421))

(assert (=> d!71745 m!326373))

(assert (=> b!211749 d!71745))

(declare-fun d!71747 () Bool)

(declare-fun res!177882 () Bool)

(declare-fun e!144391 () Bool)

(assert (=> d!71747 (=> (not res!177882) (not e!144391))))

(assert (=> d!71747 (= res!177882 (= (size!4617 (buf!5143 thiss!1204)) (size!4617 (buf!5143 (_2!9719 lt!333521)))))))

(assert (=> d!71747 (= (isPrefixOf!0 thiss!1204 (_2!9719 lt!333521)) e!144391)))

(declare-fun b!211798 () Bool)

(declare-fun res!177883 () Bool)

(assert (=> b!211798 (=> (not res!177883) (not e!144391))))

(assert (=> b!211798 (= res!177883 (bvsle (bitIndex!0 (size!4617 (buf!5143 thiss!1204)) (currentByte!9703 thiss!1204) (currentBit!9698 thiss!1204)) (bitIndex!0 (size!4617 (buf!5143 (_2!9719 lt!333521))) (currentByte!9703 (_2!9719 lt!333521)) (currentBit!9698 (_2!9719 lt!333521)))))))

(declare-fun b!211799 () Bool)

(declare-fun e!144390 () Bool)

(assert (=> b!211799 (= e!144391 e!144390)))

(declare-fun res!177884 () Bool)

(assert (=> b!211799 (=> res!177884 e!144390)))

(assert (=> b!211799 (= res!177884 (= (size!4617 (buf!5143 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!211800 () Bool)

(assert (=> b!211800 (= e!144390 (arrayBitRangesEq!0 (buf!5143 thiss!1204) (buf!5143 (_2!9719 lt!333521)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4617 (buf!5143 thiss!1204)) (currentByte!9703 thiss!1204) (currentBit!9698 thiss!1204))))))

(assert (= (and d!71747 res!177882) b!211798))

(assert (= (and b!211798 res!177883) b!211799))

(assert (= (and b!211799 (not res!177884)) b!211800))

(assert (=> b!211798 m!326369))

(assert (=> b!211798 m!326375))

(assert (=> b!211800 m!326369))

(assert (=> b!211800 m!326369))

(declare-fun m!326423 () Bool)

(assert (=> b!211800 m!326423))

(assert (=> b!211749 d!71747))

(declare-fun d!71749 () Bool)

(assert (=> d!71749 (isPrefixOf!0 thiss!1204 (_2!9719 lt!333521))))

(declare-fun lt!333566 () Unit!15101)

(declare-fun choose!30 (BitStream!8342 BitStream!8342 BitStream!8342) Unit!15101)

(assert (=> d!71749 (= lt!333566 (choose!30 thiss!1204 (_2!9719 lt!333522) (_2!9719 lt!333521)))))

(assert (=> d!71749 (isPrefixOf!0 thiss!1204 (_2!9719 lt!333522))))

(assert (=> d!71749 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9719 lt!333522) (_2!9719 lt!333521)) lt!333566)))

(declare-fun bs!17603 () Bool)

(assert (= bs!17603 d!71749))

(assert (=> bs!17603 m!326377))

(declare-fun m!326425 () Bool)

(assert (=> bs!17603 m!326425))

(assert (=> bs!17603 m!326401))

(assert (=> b!211749 d!71749))

(declare-fun b!211917 () Bool)

(declare-fun e!144456 () Bool)

(declare-fun lt!333953 () (_ BitVec 64))

(assert (=> b!211917 (= e!144456 (validate_offset_bits!1 ((_ sign_extend 32) (size!4617 (buf!5143 (_2!9719 lt!333522)))) ((_ sign_extend 32) (currentByte!9703 (_2!9719 lt!333522))) ((_ sign_extend 32) (currentBit!9698 (_2!9719 lt!333522))) lt!333953))))

(declare-fun c!10431 () Bool)

(declare-fun call!3339 () Bool)

(declare-fun bm!3336 () Bool)

(declare-fun lt!333954 () tuple2!18128)

(assert (=> bm!3336 (= call!3339 (isPrefixOf!0 (_2!9719 lt!333522) (ite c!10431 (_2!9719 lt!333522) (_2!9719 lt!333954))))))

(declare-fun d!71751 () Bool)

(declare-fun e!144457 () Bool)

(assert (=> d!71751 e!144457))

(declare-fun res!177976 () Bool)

(assert (=> d!71751 (=> (not res!177976) (not e!144457))))

(declare-fun lt!333947 () tuple2!18128)

(assert (=> d!71751 (= res!177976 (invariant!0 (currentBit!9698 (_2!9719 lt!333947)) (currentByte!9703 (_2!9719 lt!333947)) (size!4617 (buf!5143 (_2!9719 lt!333947)))))))

(declare-fun e!144464 () tuple2!18128)

(assert (=> d!71751 (= lt!333947 e!144464)))

(assert (=> d!71751 (= c!10431 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!71751 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!71751 (= (appendBitsLSBFirstLoopTR!0 (_2!9719 lt!333522) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!333947)))

(declare-fun b!211918 () Bool)

(declare-fun res!177983 () Bool)

(assert (=> b!211918 (=> (not res!177983) (not e!144457))))

(assert (=> b!211918 (= res!177983 (= (size!4617 (buf!5143 (_2!9719 lt!333522))) (size!4617 (buf!5143 (_2!9719 lt!333947)))))))

(declare-fun b!211919 () Bool)

(declare-fun e!144463 () Bool)

(declare-fun lt!333932 () tuple2!18132)

(declare-fun lt!333940 () tuple2!18130)

(assert (=> b!211919 (= e!144463 (= (_1!9721 lt!333932) (_2!9720 lt!333940)))))

(declare-fun b!211920 () Bool)

(declare-fun e!144458 () Bool)

(declare-fun lt!333949 () tuple2!18126)

(declare-fun lt!333959 () tuple2!18126)

(assert (=> b!211920 (= e!144458 (= (_2!9718 lt!333949) (_2!9718 lt!333959)))))

(declare-fun b!211921 () Bool)

(declare-fun res!177984 () Bool)

(assert (=> b!211921 (=> (not res!177984) (not e!144457))))

(declare-fun lt!333956 () (_ BitVec 64))

(declare-fun lt!333972 () (_ BitVec 64))

(assert (=> b!211921 (= res!177984 (= (bitIndex!0 (size!4617 (buf!5143 (_2!9719 lt!333947))) (currentByte!9703 (_2!9719 lt!333947)) (currentBit!9698 (_2!9719 lt!333947))) (bvsub lt!333972 lt!333956)))))

(assert (=> b!211921 (or (= (bvand lt!333972 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!333956 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!333972 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!333972 lt!333956) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211921 (= lt!333956 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!333955 () (_ BitVec 64))

(declare-fun lt!333944 () (_ BitVec 64))

(assert (=> b!211921 (= lt!333972 (bvadd lt!333955 lt!333944))))

(assert (=> b!211921 (or (not (= (bvand lt!333955 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!333944 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!333955 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!333955 lt!333944) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211921 (= lt!333944 ((_ sign_extend 32) nBits!348))))

(assert (=> b!211921 (= lt!333955 (bitIndex!0 (size!4617 (buf!5143 (_2!9719 lt!333522))) (currentByte!9703 (_2!9719 lt!333522)) (currentBit!9698 (_2!9719 lt!333522))))))

(declare-fun b!211922 () Bool)

(declare-fun res!177985 () Bool)

(assert (=> b!211922 (=> (not res!177985) (not e!144457))))

(assert (=> b!211922 (= res!177985 (isPrefixOf!0 (_2!9719 lt!333522) (_2!9719 lt!333947)))))

(declare-fun b!211923 () Bool)

(declare-fun e!144461 () (_ BitVec 64))

(assert (=> b!211923 (= e!144461 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!211924 () Bool)

(declare-fun e!144459 () Bool)

(declare-fun lt!333934 () tuple2!18126)

(declare-fun lt!333966 () tuple2!18128)

(assert (=> b!211924 (= e!144459 (= (bitIndex!0 (size!4617 (buf!5143 (_1!9718 lt!333934))) (currentByte!9703 (_1!9718 lt!333934)) (currentBit!9698 (_1!9718 lt!333934))) (bitIndex!0 (size!4617 (buf!5143 (_2!9719 lt!333966))) (currentByte!9703 (_2!9719 lt!333966)) (currentBit!9698 (_2!9719 lt!333966)))))))

(declare-fun b!211925 () Bool)

(declare-fun Unit!15116 () Unit!15101)

(assert (=> b!211925 (= e!144464 (tuple2!18129 Unit!15116 (_2!9719 lt!333522)))))

(declare-fun lt!333929 () Unit!15101)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8342) Unit!15101)

(assert (=> b!211925 (= lt!333929 (lemmaIsPrefixRefl!0 (_2!9719 lt!333522)))))

(assert (=> b!211925 call!3339))

(declare-fun lt!333964 () Unit!15101)

(assert (=> b!211925 (= lt!333964 lt!333929)))

(declare-fun b!211926 () Bool)

(assert (=> b!211926 (= e!144464 (tuple2!18129 (_1!9719 lt!333954) (_2!9719 lt!333954)))))

(declare-fun lt!333933 () Bool)

(assert (=> b!211926 (= lt!333933 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211926 (= lt!333966 (appendBit!0 (_2!9719 lt!333522) lt!333933))))

(declare-fun res!177979 () Bool)

(assert (=> b!211926 (= res!177979 (= (size!4617 (buf!5143 (_2!9719 lt!333522))) (size!4617 (buf!5143 (_2!9719 lt!333966)))))))

(declare-fun e!144462 () Bool)

(assert (=> b!211926 (=> (not res!177979) (not e!144462))))

(assert (=> b!211926 e!144462))

(declare-fun lt!333937 () tuple2!18128)

(assert (=> b!211926 (= lt!333937 lt!333966)))

(assert (=> b!211926 (= lt!333954 (appendBitsLSBFirstLoopTR!0 (_2!9719 lt!333937) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!333945 () Unit!15101)

(assert (=> b!211926 (= lt!333945 (lemmaIsPrefixTransitive!0 (_2!9719 lt!333522) (_2!9719 lt!333937) (_2!9719 lt!333954)))))

(assert (=> b!211926 call!3339))

(declare-fun lt!333975 () Unit!15101)

(assert (=> b!211926 (= lt!333975 lt!333945)))

(assert (=> b!211926 (invariant!0 (currentBit!9698 (_2!9719 lt!333522)) (currentByte!9703 (_2!9719 lt!333522)) (size!4617 (buf!5143 (_2!9719 lt!333937))))))

(declare-fun lt!333923 () BitStream!8342)

(assert (=> b!211926 (= lt!333923 (BitStream!8343 (buf!5143 (_2!9719 lt!333937)) (currentByte!9703 (_2!9719 lt!333522)) (currentBit!9698 (_2!9719 lt!333522))))))

(assert (=> b!211926 (invariant!0 (currentBit!9698 lt!333923) (currentByte!9703 lt!333923) (size!4617 (buf!5143 (_2!9719 lt!333954))))))

(declare-fun lt!333971 () BitStream!8342)

(assert (=> b!211926 (= lt!333971 (BitStream!8343 (buf!5143 (_2!9719 lt!333954)) (currentByte!9703 lt!333923) (currentBit!9698 lt!333923)))))

(assert (=> b!211926 (= lt!333949 (readBitPure!0 lt!333923))))

(assert (=> b!211926 (= lt!333959 (readBitPure!0 lt!333971))))

(declare-fun lt!333962 () Unit!15101)

(assert (=> b!211926 (= lt!333962 (readBitPrefixLemma!0 lt!333923 (_2!9719 lt!333954)))))

(declare-fun res!177978 () Bool)

(assert (=> b!211926 (= res!177978 (= (bitIndex!0 (size!4617 (buf!5143 (_1!9718 lt!333949))) (currentByte!9703 (_1!9718 lt!333949)) (currentBit!9698 (_1!9718 lt!333949))) (bitIndex!0 (size!4617 (buf!5143 (_1!9718 lt!333959))) (currentByte!9703 (_1!9718 lt!333959)) (currentBit!9698 (_1!9718 lt!333959)))))))

(assert (=> b!211926 (=> (not res!177978) (not e!144458))))

(assert (=> b!211926 e!144458))

(declare-fun lt!333928 () Unit!15101)

(assert (=> b!211926 (= lt!333928 lt!333962)))

(declare-fun lt!333939 () tuple2!18130)

(assert (=> b!211926 (= lt!333939 (reader!0 (_2!9719 lt!333522) (_2!9719 lt!333954)))))

(declare-fun lt!333960 () tuple2!18130)

(assert (=> b!211926 (= lt!333960 (reader!0 (_2!9719 lt!333937) (_2!9719 lt!333954)))))

(declare-fun lt!333965 () tuple2!18126)

(assert (=> b!211926 (= lt!333965 (readBitPure!0 (_1!9720 lt!333939)))))

(assert (=> b!211926 (= (_2!9718 lt!333965) lt!333933)))

(declare-fun lt!333948 () Unit!15101)

(declare-fun Unit!15117 () Unit!15101)

(assert (=> b!211926 (= lt!333948 Unit!15117)))

(declare-fun lt!333950 () (_ BitVec 64))

(assert (=> b!211926 (= lt!333950 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!333969 () (_ BitVec 64))

(assert (=> b!211926 (= lt!333969 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!333967 () Unit!15101)

(assert (=> b!211926 (= lt!333967 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9719 lt!333522) (buf!5143 (_2!9719 lt!333954)) lt!333969))))

(assert (=> b!211926 (validate_offset_bits!1 ((_ sign_extend 32) (size!4617 (buf!5143 (_2!9719 lt!333954)))) ((_ sign_extend 32) (currentByte!9703 (_2!9719 lt!333522))) ((_ sign_extend 32) (currentBit!9698 (_2!9719 lt!333522))) lt!333969)))

(declare-fun lt!333935 () Unit!15101)

(assert (=> b!211926 (= lt!333935 lt!333967)))

(declare-fun lt!333952 () tuple2!18132)

(assert (=> b!211926 (= lt!333952 (readNBitsLSBFirstsLoopPure!0 (_1!9720 lt!333939) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!333950))))

(declare-fun lt!333936 () (_ BitVec 64))

(assert (=> b!211926 (= lt!333936 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!333924 () Unit!15101)

(assert (=> b!211926 (= lt!333924 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9719 lt!333937) (buf!5143 (_2!9719 lt!333954)) lt!333936))))

(assert (=> b!211926 (validate_offset_bits!1 ((_ sign_extend 32) (size!4617 (buf!5143 (_2!9719 lt!333954)))) ((_ sign_extend 32) (currentByte!9703 (_2!9719 lt!333937))) ((_ sign_extend 32) (currentBit!9698 (_2!9719 lt!333937))) lt!333936)))

(declare-fun lt!333927 () Unit!15101)

(assert (=> b!211926 (= lt!333927 lt!333924)))

(declare-fun lt!333941 () tuple2!18132)

(assert (=> b!211926 (= lt!333941 (readNBitsLSBFirstsLoopPure!0 (_1!9720 lt!333960) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!333950 (ite (_2!9718 lt!333965) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!333968 () tuple2!18132)

(assert (=> b!211926 (= lt!333968 (readNBitsLSBFirstsLoopPure!0 (_1!9720 lt!333939) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!333950))))

(declare-fun c!10432 () Bool)

(assert (=> b!211926 (= c!10432 (_2!9718 (readBitPure!0 (_1!9720 lt!333939))))))

(declare-fun lt!333974 () tuple2!18132)

(assert (=> b!211926 (= lt!333974 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9720 lt!333939) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!333950 e!144461)))))

(declare-fun lt!333957 () Unit!15101)

(assert (=> b!211926 (= lt!333957 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9720 lt!333939) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!333950))))

(assert (=> b!211926 (and (= (_2!9721 lt!333968) (_2!9721 lt!333974)) (= (_1!9721 lt!333968) (_1!9721 lt!333974)))))

(declare-fun lt!333963 () Unit!15101)

(assert (=> b!211926 (= lt!333963 lt!333957)))

(assert (=> b!211926 (= (_1!9720 lt!333939) (withMovedBitIndex!0 (_2!9720 lt!333939) (bvsub (bitIndex!0 (size!4617 (buf!5143 (_2!9719 lt!333522))) (currentByte!9703 (_2!9719 lt!333522)) (currentBit!9698 (_2!9719 lt!333522))) (bitIndex!0 (size!4617 (buf!5143 (_2!9719 lt!333954))) (currentByte!9703 (_2!9719 lt!333954)) (currentBit!9698 (_2!9719 lt!333954))))))))

(declare-fun lt!333920 () Unit!15101)

(declare-fun Unit!15118 () Unit!15101)

(assert (=> b!211926 (= lt!333920 Unit!15118)))

(assert (=> b!211926 (= (_1!9720 lt!333960) (withMovedBitIndex!0 (_2!9720 lt!333960) (bvsub (bitIndex!0 (size!4617 (buf!5143 (_2!9719 lt!333937))) (currentByte!9703 (_2!9719 lt!333937)) (currentBit!9698 (_2!9719 lt!333937))) (bitIndex!0 (size!4617 (buf!5143 (_2!9719 lt!333954))) (currentByte!9703 (_2!9719 lt!333954)) (currentBit!9698 (_2!9719 lt!333954))))))))

(declare-fun lt!333946 () Unit!15101)

(declare-fun Unit!15119 () Unit!15101)

(assert (=> b!211926 (= lt!333946 Unit!15119)))

(assert (=> b!211926 (= (bitIndex!0 (size!4617 (buf!5143 (_2!9719 lt!333522))) (currentByte!9703 (_2!9719 lt!333522)) (currentBit!9698 (_2!9719 lt!333522))) (bvsub (bitIndex!0 (size!4617 (buf!5143 (_2!9719 lt!333937))) (currentByte!9703 (_2!9719 lt!333937)) (currentBit!9698 (_2!9719 lt!333937))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!333973 () Unit!15101)

(declare-fun Unit!15120 () Unit!15101)

(assert (=> b!211926 (= lt!333973 Unit!15120)))

(assert (=> b!211926 (= (_2!9721 lt!333952) (_2!9721 lt!333941))))

(declare-fun lt!333926 () Unit!15101)

(declare-fun Unit!15121 () Unit!15101)

(assert (=> b!211926 (= lt!333926 Unit!15121)))

(assert (=> b!211926 (invariant!0 (currentBit!9698 (_2!9719 lt!333954)) (currentByte!9703 (_2!9719 lt!333954)) (size!4617 (buf!5143 (_2!9719 lt!333954))))))

(declare-fun lt!333921 () Unit!15101)

(declare-fun Unit!15122 () Unit!15101)

(assert (=> b!211926 (= lt!333921 Unit!15122)))

(assert (=> b!211926 (= (size!4617 (buf!5143 (_2!9719 lt!333522))) (size!4617 (buf!5143 (_2!9719 lt!333954))))))

(declare-fun lt!333930 () Unit!15101)

(declare-fun Unit!15123 () Unit!15101)

(assert (=> b!211926 (= lt!333930 Unit!15123)))

(assert (=> b!211926 (= (bitIndex!0 (size!4617 (buf!5143 (_2!9719 lt!333954))) (currentByte!9703 (_2!9719 lt!333954)) (currentBit!9698 (_2!9719 lt!333954))) (bvsub (bvadd (bitIndex!0 (size!4617 (buf!5143 (_2!9719 lt!333522))) (currentByte!9703 (_2!9719 lt!333522)) (currentBit!9698 (_2!9719 lt!333522))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!333943 () Unit!15101)

(declare-fun Unit!15124 () Unit!15101)

(assert (=> b!211926 (= lt!333943 Unit!15124)))

(declare-fun lt!333942 () Unit!15101)

(declare-fun Unit!15125 () Unit!15101)

(assert (=> b!211926 (= lt!333942 Unit!15125)))

(assert (=> b!211926 (= lt!333940 (reader!0 (_2!9719 lt!333522) (_2!9719 lt!333954)))))

(declare-fun lt!333958 () (_ BitVec 64))

(assert (=> b!211926 (= lt!333958 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!333961 () Unit!15101)

(assert (=> b!211926 (= lt!333961 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9719 lt!333522) (buf!5143 (_2!9719 lt!333954)) lt!333958))))

(assert (=> b!211926 (validate_offset_bits!1 ((_ sign_extend 32) (size!4617 (buf!5143 (_2!9719 lt!333954)))) ((_ sign_extend 32) (currentByte!9703 (_2!9719 lt!333522))) ((_ sign_extend 32) (currentBit!9698 (_2!9719 lt!333522))) lt!333958)))

(declare-fun lt!333922 () Unit!15101)

(assert (=> b!211926 (= lt!333922 lt!333961)))

(assert (=> b!211926 (= lt!333932 (readNBitsLSBFirstsLoopPure!0 (_1!9720 lt!333940) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!177980 () Bool)

(assert (=> b!211926 (= res!177980 (= (_2!9721 lt!333932) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!211926 (=> (not res!177980) (not e!144463))))

(assert (=> b!211926 e!144463))

(declare-fun lt!333925 () Unit!15101)

(declare-fun Unit!15126 () Unit!15101)

(assert (=> b!211926 (= lt!333925 Unit!15126)))

(declare-fun b!211927 () Bool)

(assert (=> b!211927 (= e!144461 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!211928 () Bool)

(assert (=> b!211928 (= lt!333934 (readBitPure!0 (readerFrom!0 (_2!9719 lt!333966) (currentBit!9698 (_2!9719 lt!333522)) (currentByte!9703 (_2!9719 lt!333522)))))))

(declare-fun res!177977 () Bool)

(assert (=> b!211928 (= res!177977 (and (= (_2!9718 lt!333934) lt!333933) (= (_1!9718 lt!333934) (_2!9719 lt!333966))))))

(assert (=> b!211928 (=> (not res!177977) (not e!144459))))

(assert (=> b!211928 (= e!144462 e!144459)))

(declare-fun b!211929 () Bool)

(declare-fun e!144460 () Bool)

(assert (=> b!211929 (= e!144457 e!144460)))

(declare-fun res!177981 () Bool)

(assert (=> b!211929 (=> (not res!177981) (not e!144460))))

(declare-fun lt!333931 () tuple2!18132)

(assert (=> b!211929 (= res!177981 (= (_2!9721 lt!333931) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun lt!333951 () tuple2!18130)

(assert (=> b!211929 (= lt!333931 (readNBitsLSBFirstsLoopPure!0 (_1!9720 lt!333951) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!333970 () Unit!15101)

(declare-fun lt!333938 () Unit!15101)

(assert (=> b!211929 (= lt!333970 lt!333938)))

(assert (=> b!211929 (validate_offset_bits!1 ((_ sign_extend 32) (size!4617 (buf!5143 (_2!9719 lt!333947)))) ((_ sign_extend 32) (currentByte!9703 (_2!9719 lt!333522))) ((_ sign_extend 32) (currentBit!9698 (_2!9719 lt!333522))) lt!333953)))

(assert (=> b!211929 (= lt!333938 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9719 lt!333522) (buf!5143 (_2!9719 lt!333947)) lt!333953))))

(assert (=> b!211929 e!144456))

(declare-fun res!177987 () Bool)

(assert (=> b!211929 (=> (not res!177987) (not e!144456))))

(assert (=> b!211929 (= res!177987 (and (= (size!4617 (buf!5143 (_2!9719 lt!333522))) (size!4617 (buf!5143 (_2!9719 lt!333947)))) (bvsge lt!333953 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211929 (= lt!333953 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!211929 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!211929 (= lt!333951 (reader!0 (_2!9719 lt!333522) (_2!9719 lt!333947)))))

(declare-fun b!211930 () Bool)

(declare-fun res!177986 () Bool)

(assert (=> b!211930 (= res!177986 (isPrefixOf!0 (_2!9719 lt!333522) (_2!9719 lt!333966)))))

(assert (=> b!211930 (=> (not res!177986) (not e!144462))))

(declare-fun b!211931 () Bool)

(assert (=> b!211931 (= e!144460 (= (_1!9721 lt!333931) (_2!9720 lt!333951)))))

(declare-fun b!211932 () Bool)

(declare-fun res!177982 () Bool)

(assert (=> b!211932 (= res!177982 (= (bitIndex!0 (size!4617 (buf!5143 (_2!9719 lt!333966))) (currentByte!9703 (_2!9719 lt!333966)) (currentBit!9698 (_2!9719 lt!333966))) (bvadd (bitIndex!0 (size!4617 (buf!5143 (_2!9719 lt!333522))) (currentByte!9703 (_2!9719 lt!333522)) (currentBit!9698 (_2!9719 lt!333522))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!211932 (=> (not res!177982) (not e!144462))))

(assert (= (and d!71751 c!10431) b!211925))

(assert (= (and d!71751 (not c!10431)) b!211926))

(assert (= (and b!211926 res!177979) b!211932))

(assert (= (and b!211932 res!177982) b!211930))

(assert (= (and b!211930 res!177986) b!211928))

(assert (= (and b!211928 res!177977) b!211924))

(assert (= (and b!211926 res!177978) b!211920))

(assert (= (and b!211926 c!10432) b!211923))

(assert (= (and b!211926 (not c!10432)) b!211927))

(assert (= (and b!211926 res!177980) b!211919))

(assert (= (or b!211925 b!211926) bm!3336))

(assert (= (and d!71751 res!177976) b!211918))

(assert (= (and b!211918 res!177983) b!211921))

(assert (= (and b!211921 res!177984) b!211922))

(assert (= (and b!211922 res!177985) b!211929))

(assert (= (and b!211929 res!177987) b!211917))

(assert (= (and b!211929 res!177981) b!211931))

(declare-fun m!326585 () Bool)

(assert (=> b!211925 m!326585))

(declare-fun m!326587 () Bool)

(assert (=> b!211921 m!326587))

(assert (=> b!211921 m!326367))

(declare-fun m!326589 () Bool)

(assert (=> b!211932 m!326589))

(assert (=> b!211932 m!326367))

(declare-fun m!326591 () Bool)

(assert (=> b!211928 m!326591))

(assert (=> b!211928 m!326591))

(declare-fun m!326593 () Bool)

(assert (=> b!211928 m!326593))

(declare-fun m!326595 () Bool)

(assert (=> b!211926 m!326595))

(declare-fun m!326597 () Bool)

(assert (=> b!211926 m!326597))

(declare-fun m!326599 () Bool)

(assert (=> b!211926 m!326599))

(declare-fun m!326601 () Bool)

(assert (=> b!211926 m!326601))

(declare-fun m!326603 () Bool)

(assert (=> b!211926 m!326603))

(declare-fun m!326605 () Bool)

(assert (=> b!211926 m!326605))

(declare-fun m!326607 () Bool)

(assert (=> b!211926 m!326607))

(declare-fun m!326609 () Bool)

(assert (=> b!211926 m!326609))

(declare-fun m!326611 () Bool)

(assert (=> b!211926 m!326611))

(declare-fun m!326613 () Bool)

(assert (=> b!211926 m!326613))

(declare-fun m!326615 () Bool)

(assert (=> b!211926 m!326615))

(declare-fun m!326617 () Bool)

(assert (=> b!211926 m!326617))

(declare-fun m!326619 () Bool)

(assert (=> b!211926 m!326619))

(declare-fun m!326621 () Bool)

(assert (=> b!211926 m!326621))

(declare-fun m!326623 () Bool)

(assert (=> b!211926 m!326623))

(declare-fun m!326625 () Bool)

(assert (=> b!211926 m!326625))

(declare-fun m!326627 () Bool)

(assert (=> b!211926 m!326627))

(declare-fun m!326629 () Bool)

(assert (=> b!211926 m!326629))

(declare-fun m!326631 () Bool)

(assert (=> b!211926 m!326631))

(declare-fun m!326633 () Bool)

(assert (=> b!211926 m!326633))

(declare-fun m!326635 () Bool)

(assert (=> b!211926 m!326635))

(declare-fun m!326637 () Bool)

(assert (=> b!211926 m!326637))

(declare-fun m!326641 () Bool)

(assert (=> b!211926 m!326641))

(declare-fun m!326643 () Bool)

(assert (=> b!211926 m!326643))

(declare-fun m!326645 () Bool)

(assert (=> b!211926 m!326645))

(declare-fun m!326647 () Bool)

(assert (=> b!211926 m!326647))

(assert (=> b!211926 m!326623))

(declare-fun m!326649 () Bool)

(assert (=> b!211926 m!326649))

(assert (=> b!211926 m!326367))

(declare-fun m!326651 () Bool)

(assert (=> b!211926 m!326651))

(declare-fun m!326653 () Bool)

(assert (=> b!211926 m!326653))

(declare-fun m!326655 () Bool)

(assert (=> b!211926 m!326655))

(declare-fun m!326657 () Bool)

(assert (=> b!211926 m!326657))

(declare-fun m!326659 () Bool)

(assert (=> b!211926 m!326659))

(declare-fun m!326661 () Bool)

(assert (=> b!211924 m!326661))

(assert (=> b!211924 m!326589))

(declare-fun m!326663 () Bool)

(assert (=> bm!3336 m!326663))

(declare-fun m!326665 () Bool)

(assert (=> b!211917 m!326665))

(assert (=> b!211929 m!326635))

(declare-fun m!326667 () Bool)

(assert (=> b!211929 m!326667))

(assert (=> b!211929 m!326645))

(declare-fun m!326669 () Bool)

(assert (=> b!211929 m!326669))

(declare-fun m!326671 () Bool)

(assert (=> b!211929 m!326671))

(declare-fun m!326673 () Bool)

(assert (=> b!211929 m!326673))

(declare-fun m!326675 () Bool)

(assert (=> d!71751 m!326675))

(declare-fun m!326677 () Bool)

(assert (=> b!211922 m!326677))

(declare-fun m!326679 () Bool)

(assert (=> b!211930 m!326679))

(assert (=> b!211749 d!71751))

(declare-fun d!71781 () Bool)

(declare-fun e!144469 () Bool)

(assert (=> d!71781 e!144469))

(declare-fun res!177994 () Bool)

(assert (=> d!71781 (=> (not res!177994) (not e!144469))))

(declare-fun lt!334022 () (_ BitVec 64))

(declare-fun lt!334024 () (_ BitVec 64))

(declare-fun lt!334020 () (_ BitVec 64))

(assert (=> d!71781 (= res!177994 (= lt!334020 (bvsub lt!334022 lt!334024)))))

(assert (=> d!71781 (or (= (bvand lt!334022 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!334024 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!334022 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!334022 lt!334024) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71781 (= lt!334024 (remainingBits!0 ((_ sign_extend 32) (size!4617 (buf!5143 (_2!9719 lt!333522)))) ((_ sign_extend 32) (currentByte!9703 (_2!9719 lt!333522))) ((_ sign_extend 32) (currentBit!9698 (_2!9719 lt!333522)))))))

(declare-fun lt!334023 () (_ BitVec 64))

(declare-fun lt!334019 () (_ BitVec 64))

(assert (=> d!71781 (= lt!334022 (bvmul lt!334023 lt!334019))))

(assert (=> d!71781 (or (= lt!334023 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!334019 (bvsdiv (bvmul lt!334023 lt!334019) lt!334023)))))

(assert (=> d!71781 (= lt!334019 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71781 (= lt!334023 ((_ sign_extend 32) (size!4617 (buf!5143 (_2!9719 lt!333522)))))))

(assert (=> d!71781 (= lt!334020 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9703 (_2!9719 lt!333522))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9698 (_2!9719 lt!333522)))))))

(assert (=> d!71781 (invariant!0 (currentBit!9698 (_2!9719 lt!333522)) (currentByte!9703 (_2!9719 lt!333522)) (size!4617 (buf!5143 (_2!9719 lt!333522))))))

(assert (=> d!71781 (= (bitIndex!0 (size!4617 (buf!5143 (_2!9719 lt!333522))) (currentByte!9703 (_2!9719 lt!333522)) (currentBit!9698 (_2!9719 lt!333522))) lt!334020)))

(declare-fun b!211943 () Bool)

(declare-fun res!177995 () Bool)

(assert (=> b!211943 (=> (not res!177995) (not e!144469))))

(assert (=> b!211943 (= res!177995 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!334020))))

(declare-fun b!211944 () Bool)

(declare-fun lt!334021 () (_ BitVec 64))

(assert (=> b!211944 (= e!144469 (bvsle lt!334020 (bvmul lt!334021 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!211944 (or (= lt!334021 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!334021 #b0000000000000000000000000000000000000000000000000000000000001000) lt!334021)))))

(assert (=> b!211944 (= lt!334021 ((_ sign_extend 32) (size!4617 (buf!5143 (_2!9719 lt!333522)))))))

(assert (= (and d!71781 res!177994) b!211943))

(assert (= (and b!211943 res!177995) b!211944))

(declare-fun m!326703 () Bool)

(assert (=> d!71781 m!326703))

(declare-fun m!326707 () Bool)

(assert (=> d!71781 m!326707))

(assert (=> b!211750 d!71781))

(declare-fun d!71785 () Bool)

(declare-fun e!144470 () Bool)

(assert (=> d!71785 e!144470))

(declare-fun res!177996 () Bool)

(assert (=> d!71785 (=> (not res!177996) (not e!144470))))

(declare-fun lt!334026 () (_ BitVec 64))

(declare-fun lt!334028 () (_ BitVec 64))

(declare-fun lt!334030 () (_ BitVec 64))

(assert (=> d!71785 (= res!177996 (= lt!334026 (bvsub lt!334028 lt!334030)))))

(assert (=> d!71785 (or (= (bvand lt!334028 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!334030 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!334028 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!334028 lt!334030) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71785 (= lt!334030 (remainingBits!0 ((_ sign_extend 32) (size!4617 (buf!5143 thiss!1204))) ((_ sign_extend 32) (currentByte!9703 thiss!1204)) ((_ sign_extend 32) (currentBit!9698 thiss!1204))))))

(declare-fun lt!334029 () (_ BitVec 64))

(declare-fun lt!334025 () (_ BitVec 64))

(assert (=> d!71785 (= lt!334028 (bvmul lt!334029 lt!334025))))

(assert (=> d!71785 (or (= lt!334029 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!334025 (bvsdiv (bvmul lt!334029 lt!334025) lt!334029)))))

(assert (=> d!71785 (= lt!334025 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71785 (= lt!334029 ((_ sign_extend 32) (size!4617 (buf!5143 thiss!1204))))))

(assert (=> d!71785 (= lt!334026 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9703 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9698 thiss!1204))))))

(assert (=> d!71785 (invariant!0 (currentBit!9698 thiss!1204) (currentByte!9703 thiss!1204) (size!4617 (buf!5143 thiss!1204)))))

(assert (=> d!71785 (= (bitIndex!0 (size!4617 (buf!5143 thiss!1204)) (currentByte!9703 thiss!1204) (currentBit!9698 thiss!1204)) lt!334026)))

(declare-fun b!211945 () Bool)

(declare-fun res!177997 () Bool)

(assert (=> b!211945 (=> (not res!177997) (not e!144470))))

(assert (=> b!211945 (= res!177997 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!334026))))

(declare-fun b!211946 () Bool)

(declare-fun lt!334027 () (_ BitVec 64))

(assert (=> b!211946 (= e!144470 (bvsle lt!334026 (bvmul lt!334027 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!211946 (or (= lt!334027 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!334027 #b0000000000000000000000000000000000000000000000000000000000001000) lt!334027)))))

(assert (=> b!211946 (= lt!334027 ((_ sign_extend 32) (size!4617 (buf!5143 thiss!1204))))))

(assert (= (and d!71785 res!177996) b!211945))

(assert (= (and b!211945 res!177997) b!211946))

(assert (=> d!71785 m!326419))

(assert (=> d!71785 m!326389))

(assert (=> b!211750 d!71785))

(declare-fun d!71787 () Bool)

(declare-datatypes ((tuple2!18138 0))(
  ( (tuple2!18139 (_1!9724 Bool) (_2!9724 BitStream!8342)) )
))
(declare-fun lt!334037 () tuple2!18138)

(declare-fun readBit!0 (BitStream!8342) tuple2!18138)

(assert (=> d!71787 (= lt!334037 (readBit!0 (readerFrom!0 (_2!9719 lt!333522) (currentBit!9698 thiss!1204) (currentByte!9703 thiss!1204))))))

(assert (=> d!71787 (= (readBitPure!0 (readerFrom!0 (_2!9719 lt!333522) (currentBit!9698 thiss!1204) (currentByte!9703 thiss!1204))) (tuple2!18127 (_2!9724 lt!334037) (_1!9724 lt!334037)))))

(declare-fun bs!17608 () Bool)

(assert (= bs!17608 d!71787))

(assert (=> bs!17608 m!326391))

(declare-fun m!326713 () Bool)

(assert (=> bs!17608 m!326713))

(assert (=> b!211761 d!71787))

(declare-fun d!71793 () Bool)

(declare-fun e!144475 () Bool)

(assert (=> d!71793 e!144475))

(declare-fun res!178005 () Bool)

(assert (=> d!71793 (=> (not res!178005) (not e!144475))))

(assert (=> d!71793 (= res!178005 (invariant!0 (currentBit!9698 (_2!9719 lt!333522)) (currentByte!9703 (_2!9719 lt!333522)) (size!4617 (buf!5143 (_2!9719 lt!333522)))))))

(assert (=> d!71793 (= (readerFrom!0 (_2!9719 lt!333522) (currentBit!9698 thiss!1204) (currentByte!9703 thiss!1204)) (BitStream!8343 (buf!5143 (_2!9719 lt!333522)) (currentByte!9703 thiss!1204) (currentBit!9698 thiss!1204)))))

(declare-fun b!211953 () Bool)

(assert (=> b!211953 (= e!144475 (invariant!0 (currentBit!9698 thiss!1204) (currentByte!9703 thiss!1204) (size!4617 (buf!5143 (_2!9719 lt!333522)))))))

(assert (= (and d!71793 res!178005) b!211953))

(assert (=> d!71793 m!326707))

(assert (=> b!211953 m!326347))

(assert (=> b!211761 d!71793))

(assert (=> b!211746 d!71781))

(assert (=> b!211746 d!71785))

(declare-fun d!71807 () Bool)

(declare-fun e!144485 () Bool)

(assert (=> d!71807 e!144485))

(declare-fun res!178021 () Bool)

(assert (=> d!71807 (=> (not res!178021) (not e!144485))))

(declare-fun lt!334094 () tuple2!18128)

(assert (=> d!71807 (= res!178021 (= (size!4617 (buf!5143 thiss!1204)) (size!4617 (buf!5143 (_2!9719 lt!334094)))))))

(declare-fun choose!16 (BitStream!8342 Bool) tuple2!18128)

(assert (=> d!71807 (= lt!334094 (choose!16 thiss!1204 lt!333504))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!71807 (validate_offset_bit!0 ((_ sign_extend 32) (size!4617 (buf!5143 thiss!1204))) ((_ sign_extend 32) (currentByte!9703 thiss!1204)) ((_ sign_extend 32) (currentBit!9698 thiss!1204)))))

(assert (=> d!71807 (= (appendBit!0 thiss!1204 lt!333504) lt!334094)))

(declare-fun b!211972 () Bool)

(declare-fun e!144486 () Bool)

(declare-fun lt!334095 () tuple2!18126)

(assert (=> b!211972 (= e!144486 (= (bitIndex!0 (size!4617 (buf!5143 (_1!9718 lt!334095))) (currentByte!9703 (_1!9718 lt!334095)) (currentBit!9698 (_1!9718 lt!334095))) (bitIndex!0 (size!4617 (buf!5143 (_2!9719 lt!334094))) (currentByte!9703 (_2!9719 lt!334094)) (currentBit!9698 (_2!9719 lt!334094)))))))

(declare-fun b!211969 () Bool)

(declare-fun res!178022 () Bool)

(assert (=> b!211969 (=> (not res!178022) (not e!144485))))

(declare-fun lt!334093 () (_ BitVec 64))

(declare-fun lt!334096 () (_ BitVec 64))

(assert (=> b!211969 (= res!178022 (= (bitIndex!0 (size!4617 (buf!5143 (_2!9719 lt!334094))) (currentByte!9703 (_2!9719 lt!334094)) (currentBit!9698 (_2!9719 lt!334094))) (bvadd lt!334093 lt!334096)))))

(assert (=> b!211969 (or (not (= (bvand lt!334093 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!334096 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!334093 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!334093 lt!334096) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211969 (= lt!334096 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!211969 (= lt!334093 (bitIndex!0 (size!4617 (buf!5143 thiss!1204)) (currentByte!9703 thiss!1204) (currentBit!9698 thiss!1204)))))

(declare-fun b!211970 () Bool)

(declare-fun res!178020 () Bool)

(assert (=> b!211970 (=> (not res!178020) (not e!144485))))

(assert (=> b!211970 (= res!178020 (isPrefixOf!0 thiss!1204 (_2!9719 lt!334094)))))

(declare-fun b!211971 () Bool)

(assert (=> b!211971 (= e!144485 e!144486)))

(declare-fun res!178023 () Bool)

(assert (=> b!211971 (=> (not res!178023) (not e!144486))))

(assert (=> b!211971 (= res!178023 (and (= (_2!9718 lt!334095) lt!333504) (= (_1!9718 lt!334095) (_2!9719 lt!334094))))))

(assert (=> b!211971 (= lt!334095 (readBitPure!0 (readerFrom!0 (_2!9719 lt!334094) (currentBit!9698 thiss!1204) (currentByte!9703 thiss!1204))))))

(assert (= (and d!71807 res!178021) b!211969))

(assert (= (and b!211969 res!178022) b!211970))

(assert (= (and b!211970 res!178020) b!211971))

(assert (= (and b!211971 res!178023) b!211972))

(declare-fun m!326755 () Bool)

(assert (=> b!211970 m!326755))

(declare-fun m!326757 () Bool)

(assert (=> b!211969 m!326757))

(assert (=> b!211969 m!326369))

(declare-fun m!326759 () Bool)

(assert (=> b!211972 m!326759))

(assert (=> b!211972 m!326757))

(declare-fun m!326761 () Bool)

(assert (=> b!211971 m!326761))

(assert (=> b!211971 m!326761))

(declare-fun m!326763 () Bool)

(assert (=> b!211971 m!326763))

(declare-fun m!326765 () Bool)

(assert (=> d!71807 m!326765))

(declare-fun m!326767 () Bool)

(assert (=> d!71807 m!326767))

(assert (=> b!211746 d!71807))

(declare-fun d!71819 () Bool)

(declare-fun lt!334124 () tuple2!18132)

(declare-fun lt!334122 () tuple2!18132)

(assert (=> d!71819 (and (= (_2!9721 lt!334124) (_2!9721 lt!334122)) (= (_1!9721 lt!334124) (_1!9721 lt!334122)))))

(declare-fun lt!334121 () BitStream!8342)

(declare-fun lt!334123 () Bool)

(declare-fun lt!334119 () Unit!15101)

(declare-fun lt!334120 () (_ BitVec 64))

(declare-fun choose!56 (BitStream!8342 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!18132 tuple2!18132 BitStream!8342 (_ BitVec 64) Bool BitStream!8342 (_ BitVec 64) tuple2!18132 tuple2!18132 BitStream!8342 (_ BitVec 64)) Unit!15101)

(assert (=> d!71819 (= lt!334119 (choose!56 (_1!9720 lt!333514) nBits!348 i!590 lt!333519 lt!334124 (tuple2!18133 (_1!9721 lt!334124) (_2!9721 lt!334124)) (_1!9721 lt!334124) (_2!9721 lt!334124) lt!334123 lt!334121 lt!334120 lt!334122 (tuple2!18133 (_1!9721 lt!334122) (_2!9721 lt!334122)) (_1!9721 lt!334122) (_2!9721 lt!334122)))))

(assert (=> d!71819 (= lt!334122 (readNBitsLSBFirstsLoopPure!0 lt!334121 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!334120))))

(assert (=> d!71819 (= lt!334120 (bvor lt!333519 (ite lt!334123 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71819 (= lt!334121 (withMovedBitIndex!0 (_1!9720 lt!333514) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!71819 (= lt!334123 (_2!9718 (readBitPure!0 (_1!9720 lt!333514))))))

(assert (=> d!71819 (= lt!334124 (readNBitsLSBFirstsLoopPure!0 (_1!9720 lt!333514) nBits!348 i!590 lt!333519))))

(assert (=> d!71819 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9720 lt!333514) nBits!348 i!590 lt!333519) lt!334119)))

(declare-fun bs!17621 () Bool)

(assert (= bs!17621 d!71819))

(declare-fun m!326785 () Bool)

(assert (=> bs!17621 m!326785))

(declare-fun m!326787 () Bool)

(assert (=> bs!17621 m!326787))

(assert (=> bs!17621 m!326355))

(assert (=> bs!17621 m!326349))

(assert (=> bs!17621 m!326385))

(assert (=> b!211757 d!71819))

(declare-fun d!71833 () Bool)

(declare-datatypes ((tuple2!18140 0))(
  ( (tuple2!18141 (_1!9725 (_ BitVec 64)) (_2!9725 BitStream!8342)) )
))
(declare-fun lt!334127 () tuple2!18140)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8342 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18140)

(assert (=> d!71833 (= lt!334127 (readNBitsLSBFirstsLoop!0 (withMovedBitIndex!0 (_1!9720 lt!333514) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!333507))))

(assert (=> d!71833 (= (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9720 lt!333514) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!333507) (tuple2!18133 (_2!9725 lt!334127) (_1!9725 lt!334127)))))

(declare-fun bs!17622 () Bool)

(assert (= bs!17622 d!71833))

(assert (=> bs!17622 m!326385))

(declare-fun m!326789 () Bool)

(assert (=> bs!17622 m!326789))

(assert (=> b!211757 d!71833))

(declare-fun d!71835 () Bool)

(declare-fun e!144493 () Bool)

(assert (=> d!71835 e!144493))

(declare-fun res!178031 () Bool)

(assert (=> d!71835 (=> (not res!178031) (not e!144493))))

(declare-fun lt!334133 () (_ BitVec 64))

(declare-fun lt!334132 () BitStream!8342)

(assert (=> d!71835 (= res!178031 (= (bvadd lt!334133 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4617 (buf!5143 lt!334132)) (currentByte!9703 lt!334132) (currentBit!9698 lt!334132))))))

(assert (=> d!71835 (or (not (= (bvand lt!334133 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!334133 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!334133 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71835 (= lt!334133 (bitIndex!0 (size!4617 (buf!5143 (_1!9720 lt!333514))) (currentByte!9703 (_1!9720 lt!333514)) (currentBit!9698 (_1!9720 lt!333514))))))

(declare-fun moveBitIndex!0 (BitStream!8342 (_ BitVec 64)) tuple2!18128)

(assert (=> d!71835 (= lt!334132 (_2!9719 (moveBitIndex!0 (_1!9720 lt!333514) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!8342 (_ BitVec 64)) Bool)

(assert (=> d!71835 (moveBitIndexPrecond!0 (_1!9720 lt!333514) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!71835 (= (withMovedBitIndex!0 (_1!9720 lt!333514) #b0000000000000000000000000000000000000000000000000000000000000001) lt!334132)))

(declare-fun b!211979 () Bool)

(assert (=> b!211979 (= e!144493 (= (size!4617 (buf!5143 (_1!9720 lt!333514))) (size!4617 (buf!5143 lt!334132))))))

(assert (= (and d!71835 res!178031) b!211979))

(declare-fun m!326791 () Bool)

(assert (=> d!71835 m!326791))

(declare-fun m!326793 () Bool)

(assert (=> d!71835 m!326793))

(declare-fun m!326795 () Bool)

(assert (=> d!71835 m!326795))

(declare-fun m!326797 () Bool)

(assert (=> d!71835 m!326797))

(assert (=> b!211757 d!71835))

(declare-fun d!71837 () Bool)

(assert (=> d!71837 (= (invariant!0 (currentBit!9698 thiss!1204) (currentByte!9703 thiss!1204) (size!4617 (buf!5143 thiss!1204))) (and (bvsge (currentBit!9698 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9698 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9703 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9703 thiss!1204) (size!4617 (buf!5143 thiss!1204))) (and (= (currentBit!9698 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9703 thiss!1204) (size!4617 (buf!5143 thiss!1204)))))))))

(assert (=> b!211758 d!71837))

(declare-fun d!71839 () Bool)

(assert (=> d!71839 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!211747 d!71839))

(declare-fun d!71841 () Bool)

(declare-fun lt!334134 () tuple2!18140)

(assert (=> d!71841 (= lt!334134 (readNBitsLSBFirstsLoop!0 (_1!9720 lt!333514) nBits!348 i!590 lt!333519))))

(assert (=> d!71841 (= (readNBitsLSBFirstsLoopPure!0 (_1!9720 lt!333514) nBits!348 i!590 lt!333519) (tuple2!18133 (_2!9725 lt!334134) (_1!9725 lt!334134)))))

(declare-fun bs!17623 () Bool)

(assert (= bs!17623 d!71841))

(declare-fun m!326799 () Bool)

(assert (=> bs!17623 m!326799))

(assert (=> b!211747 d!71841))

(declare-fun e!144502 () Bool)

(declare-fun b!211993 () Bool)

(declare-fun lt!334192 () (_ BitVec 64))

(declare-fun lt!334207 () tuple2!18130)

(declare-fun lt!334208 () (_ BitVec 64))

(assert (=> b!211993 (= e!144502 (= (_1!9720 lt!334207) (withMovedBitIndex!0 (_2!9720 lt!334207) (bvsub lt!334192 lt!334208))))))

(assert (=> b!211993 (or (= (bvand lt!334192 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!334208 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!334192 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!334192 lt!334208) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!211993 (= lt!334208 (bitIndex!0 (size!4617 (buf!5143 (_2!9719 lt!333521))) (currentByte!9703 (_2!9719 lt!333521)) (currentBit!9698 (_2!9719 lt!333521))))))

(assert (=> b!211993 (= lt!334192 (bitIndex!0 (size!4617 (buf!5143 (_2!9719 lt!333522))) (currentByte!9703 (_2!9719 lt!333522)) (currentBit!9698 (_2!9719 lt!333522))))))

(declare-fun b!211994 () Bool)

(declare-fun e!144501 () Unit!15101)

(declare-fun Unit!15127 () Unit!15101)

(assert (=> b!211994 (= e!144501 Unit!15127)))

(declare-fun b!211995 () Bool)

(declare-fun res!178042 () Bool)

(assert (=> b!211995 (=> (not res!178042) (not e!144502))))

(assert (=> b!211995 (= res!178042 (isPrefixOf!0 (_1!9720 lt!334207) (_2!9719 lt!333522)))))

(declare-fun b!211996 () Bool)

(declare-fun lt!334197 () Unit!15101)

(assert (=> b!211996 (= e!144501 lt!334197)))

(declare-fun lt!334190 () (_ BitVec 64))

(assert (=> b!211996 (= lt!334190 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!334201 () (_ BitVec 64))

(assert (=> b!211996 (= lt!334201 (bitIndex!0 (size!4617 (buf!5143 (_2!9719 lt!333522))) (currentByte!9703 (_2!9719 lt!333522)) (currentBit!9698 (_2!9719 lt!333522))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!10512 array!10512 (_ BitVec 64) (_ BitVec 64)) Unit!15101)

(assert (=> b!211996 (= lt!334197 (arrayBitRangesEqSymmetric!0 (buf!5143 (_2!9719 lt!333522)) (buf!5143 (_2!9719 lt!333521)) lt!334190 lt!334201))))

(assert (=> b!211996 (arrayBitRangesEq!0 (buf!5143 (_2!9719 lt!333521)) (buf!5143 (_2!9719 lt!333522)) lt!334190 lt!334201)))

(declare-fun d!71843 () Bool)

(assert (=> d!71843 e!144502))

(declare-fun res!178041 () Bool)

(assert (=> d!71843 (=> (not res!178041) (not e!144502))))

(assert (=> d!71843 (= res!178041 (isPrefixOf!0 (_1!9720 lt!334207) (_2!9720 lt!334207)))))

(declare-fun lt!334191 () BitStream!8342)

(assert (=> d!71843 (= lt!334207 (tuple2!18131 lt!334191 (_2!9719 lt!333521)))))

(declare-fun lt!334195 () Unit!15101)

(declare-fun lt!334204 () Unit!15101)

(assert (=> d!71843 (= lt!334195 lt!334204)))

(assert (=> d!71843 (isPrefixOf!0 lt!334191 (_2!9719 lt!333521))))

(assert (=> d!71843 (= lt!334204 (lemmaIsPrefixTransitive!0 lt!334191 (_2!9719 lt!333521) (_2!9719 lt!333521)))))

(declare-fun lt!334202 () Unit!15101)

(declare-fun lt!334205 () Unit!15101)

(assert (=> d!71843 (= lt!334202 lt!334205)))

(assert (=> d!71843 (isPrefixOf!0 lt!334191 (_2!9719 lt!333521))))

(assert (=> d!71843 (= lt!334205 (lemmaIsPrefixTransitive!0 lt!334191 (_2!9719 lt!333522) (_2!9719 lt!333521)))))

(declare-fun lt!334203 () Unit!15101)

(assert (=> d!71843 (= lt!334203 e!144501)))

(declare-fun c!10437 () Bool)

(assert (=> d!71843 (= c!10437 (not (= (size!4617 (buf!5143 (_2!9719 lt!333522))) #b00000000000000000000000000000000)))))

(declare-fun lt!334194 () Unit!15101)

(declare-fun lt!334200 () Unit!15101)

(assert (=> d!71843 (= lt!334194 lt!334200)))

(assert (=> d!71843 (isPrefixOf!0 (_2!9719 lt!333521) (_2!9719 lt!333521))))

(assert (=> d!71843 (= lt!334200 (lemmaIsPrefixRefl!0 (_2!9719 lt!333521)))))

(declare-fun lt!334196 () Unit!15101)

(declare-fun lt!334209 () Unit!15101)

(assert (=> d!71843 (= lt!334196 lt!334209)))

(assert (=> d!71843 (= lt!334209 (lemmaIsPrefixRefl!0 (_2!9719 lt!333521)))))

(declare-fun lt!334199 () Unit!15101)

(declare-fun lt!334206 () Unit!15101)

(assert (=> d!71843 (= lt!334199 lt!334206)))

(assert (=> d!71843 (isPrefixOf!0 lt!334191 lt!334191)))

(assert (=> d!71843 (= lt!334206 (lemmaIsPrefixRefl!0 lt!334191))))

(declare-fun lt!334198 () Unit!15101)

(declare-fun lt!334193 () Unit!15101)

(assert (=> d!71843 (= lt!334198 lt!334193)))

(assert (=> d!71843 (isPrefixOf!0 (_2!9719 lt!333522) (_2!9719 lt!333522))))

(assert (=> d!71843 (= lt!334193 (lemmaIsPrefixRefl!0 (_2!9719 lt!333522)))))

(assert (=> d!71843 (= lt!334191 (BitStream!8343 (buf!5143 (_2!9719 lt!333521)) (currentByte!9703 (_2!9719 lt!333522)) (currentBit!9698 (_2!9719 lt!333522))))))

(assert (=> d!71843 (isPrefixOf!0 (_2!9719 lt!333522) (_2!9719 lt!333521))))

(assert (=> d!71843 (= (reader!0 (_2!9719 lt!333522) (_2!9719 lt!333521)) lt!334207)))

(declare-fun b!211997 () Bool)

(declare-fun res!178043 () Bool)

(assert (=> b!211997 (=> (not res!178043) (not e!144502))))

(assert (=> b!211997 (= res!178043 (isPrefixOf!0 (_2!9720 lt!334207) (_2!9719 lt!333521)))))

(assert (= (and d!71843 c!10437) b!211996))

(assert (= (and d!71843 (not c!10437)) b!211994))

(assert (= (and d!71843 res!178041) b!211995))

(assert (= (and b!211995 res!178042) b!211997))

(assert (= (and b!211997 res!178043) b!211993))

(declare-fun m!326821 () Bool)

(assert (=> b!211993 m!326821))

(assert (=> b!211993 m!326375))

(assert (=> b!211993 m!326367))

(assert (=> d!71843 m!326371))

(assert (=> d!71843 m!326585))

(declare-fun m!326823 () Bool)

(assert (=> d!71843 m!326823))

(declare-fun m!326825 () Bool)

(assert (=> d!71843 m!326825))

(declare-fun m!326827 () Bool)

(assert (=> d!71843 m!326827))

(declare-fun m!326829 () Bool)

(assert (=> d!71843 m!326829))

(declare-fun m!326831 () Bool)

(assert (=> d!71843 m!326831))

(declare-fun m!326833 () Bool)

(assert (=> d!71843 m!326833))

(declare-fun m!326835 () Bool)

(assert (=> d!71843 m!326835))

(declare-fun m!326837 () Bool)

(assert (=> d!71843 m!326837))

(declare-fun m!326839 () Bool)

(assert (=> d!71843 m!326839))

(assert (=> b!211996 m!326367))

(declare-fun m!326841 () Bool)

(assert (=> b!211996 m!326841))

(declare-fun m!326843 () Bool)

(assert (=> b!211996 m!326843))

(declare-fun m!326845 () Bool)

(assert (=> b!211995 m!326845))

(declare-fun m!326847 () Bool)

(assert (=> b!211997 m!326847))

(assert (=> b!211747 d!71843))

(declare-fun d!71871 () Bool)

(assert (=> d!71871 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4617 (buf!5143 (_2!9719 lt!333521)))) ((_ sign_extend 32) (currentByte!9703 thiss!1204)) ((_ sign_extend 32) (currentBit!9698 thiss!1204)) lt!333512) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4617 (buf!5143 (_2!9719 lt!333521)))) ((_ sign_extend 32) (currentByte!9703 thiss!1204)) ((_ sign_extend 32) (currentBit!9698 thiss!1204))) lt!333512))))

(declare-fun bs!17631 () Bool)

(assert (= bs!17631 d!71871))

(declare-fun m!326849 () Bool)

(assert (=> bs!17631 m!326849))

(assert (=> b!211747 d!71871))

(declare-fun d!71873 () Bool)

(assert (=> d!71873 (validate_offset_bits!1 ((_ sign_extend 32) (size!4617 (buf!5143 (_2!9719 lt!333521)))) ((_ sign_extend 32) (currentByte!9703 thiss!1204)) ((_ sign_extend 32) (currentBit!9698 thiss!1204)) lt!333512)))

(declare-fun lt!334212 () Unit!15101)

(declare-fun choose!9 (BitStream!8342 array!10512 (_ BitVec 64) BitStream!8342) Unit!15101)

(assert (=> d!71873 (= lt!334212 (choose!9 thiss!1204 (buf!5143 (_2!9719 lt!333521)) lt!333512 (BitStream!8343 (buf!5143 (_2!9719 lt!333521)) (currentByte!9703 thiss!1204) (currentBit!9698 thiss!1204))))))

(assert (=> d!71873 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5143 (_2!9719 lt!333521)) lt!333512) lt!334212)))

(declare-fun bs!17632 () Bool)

(assert (= bs!17632 d!71873))

(assert (=> bs!17632 m!326341))

(declare-fun m!326851 () Bool)

(assert (=> bs!17632 m!326851))

(assert (=> b!211747 d!71873))

(declare-fun d!71875 () Bool)

(assert (=> d!71875 (validate_offset_bits!1 ((_ sign_extend 32) (size!4617 (buf!5143 (_2!9719 lt!333521)))) ((_ sign_extend 32) (currentByte!9703 (_2!9719 lt!333522))) ((_ sign_extend 32) (currentBit!9698 (_2!9719 lt!333522))) lt!333503)))

(declare-fun lt!334213 () Unit!15101)

(assert (=> d!71875 (= lt!334213 (choose!9 (_2!9719 lt!333522) (buf!5143 (_2!9719 lt!333521)) lt!333503 (BitStream!8343 (buf!5143 (_2!9719 lt!333521)) (currentByte!9703 (_2!9719 lt!333522)) (currentBit!9698 (_2!9719 lt!333522)))))))

(assert (=> d!71875 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9719 lt!333522) (buf!5143 (_2!9719 lt!333521)) lt!333503) lt!334213)))

(declare-fun bs!17633 () Bool)

(assert (= bs!17633 d!71875))

(assert (=> bs!17633 m!326353))

(declare-fun m!326853 () Bool)

(assert (=> bs!17633 m!326853))

(assert (=> b!211747 d!71875))

(declare-fun d!71877 () Bool)

(assert (=> d!71877 (= (invariant!0 (currentBit!9698 thiss!1204) (currentByte!9703 thiss!1204) (size!4617 (buf!5143 (_2!9719 lt!333522)))) (and (bvsge (currentBit!9698 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9698 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9703 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9703 thiss!1204) (size!4617 (buf!5143 (_2!9719 lt!333522)))) (and (= (currentBit!9698 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9703 thiss!1204) (size!4617 (buf!5143 (_2!9719 lt!333522))))))))))

(assert (=> b!211747 d!71877))

(declare-fun d!71879 () Bool)

(declare-fun lt!334214 () tuple2!18138)

(assert (=> d!71879 (= lt!334214 (readBit!0 (BitStream!8343 (buf!5143 (_2!9719 lt!333521)) (currentByte!9703 thiss!1204) (currentBit!9698 thiss!1204))))))

(assert (=> d!71879 (= (readBitPure!0 (BitStream!8343 (buf!5143 (_2!9719 lt!333521)) (currentByte!9703 thiss!1204) (currentBit!9698 thiss!1204))) (tuple2!18127 (_2!9724 lt!334214) (_1!9724 lt!334214)))))

(declare-fun bs!17634 () Bool)

(assert (= bs!17634 d!71879))

(declare-fun m!326855 () Bool)

(assert (=> bs!17634 m!326855))

(assert (=> b!211747 d!71879))

(declare-fun d!71881 () Bool)

(declare-fun e!144505 () Bool)

(assert (=> d!71881 e!144505))

(declare-fun res!178046 () Bool)

(assert (=> d!71881 (=> (not res!178046) (not e!144505))))

(declare-fun lt!334224 () tuple2!18126)

(declare-fun lt!334223 () tuple2!18126)

(assert (=> d!71881 (= res!178046 (= (bitIndex!0 (size!4617 (buf!5143 (_1!9718 lt!334224))) (currentByte!9703 (_1!9718 lt!334224)) (currentBit!9698 (_1!9718 lt!334224))) (bitIndex!0 (size!4617 (buf!5143 (_1!9718 lt!334223))) (currentByte!9703 (_1!9718 lt!334223)) (currentBit!9698 (_1!9718 lt!334223)))))))

(declare-fun lt!334226 () BitStream!8342)

(declare-fun lt!334225 () Unit!15101)

(declare-fun choose!50 (BitStream!8342 BitStream!8342 BitStream!8342 tuple2!18126 tuple2!18126 BitStream!8342 Bool tuple2!18126 tuple2!18126 BitStream!8342 Bool) Unit!15101)

(assert (=> d!71881 (= lt!334225 (choose!50 lt!333508 (_2!9719 lt!333521) lt!334226 lt!334224 (tuple2!18127 (_1!9718 lt!334224) (_2!9718 lt!334224)) (_1!9718 lt!334224) (_2!9718 lt!334224) lt!334223 (tuple2!18127 (_1!9718 lt!334223) (_2!9718 lt!334223)) (_1!9718 lt!334223) (_2!9718 lt!334223)))))

(assert (=> d!71881 (= lt!334223 (readBitPure!0 lt!334226))))

(assert (=> d!71881 (= lt!334224 (readBitPure!0 lt!333508))))

(assert (=> d!71881 (= lt!334226 (BitStream!8343 (buf!5143 (_2!9719 lt!333521)) (currentByte!9703 lt!333508) (currentBit!9698 lt!333508)))))

(assert (=> d!71881 (invariant!0 (currentBit!9698 lt!333508) (currentByte!9703 lt!333508) (size!4617 (buf!5143 (_2!9719 lt!333521))))))

(assert (=> d!71881 (= (readBitPrefixLemma!0 lt!333508 (_2!9719 lt!333521)) lt!334225)))

(declare-fun b!212000 () Bool)

(assert (=> b!212000 (= e!144505 (= (_2!9718 lt!334224) (_2!9718 lt!334223)))))

(assert (= (and d!71881 res!178046) b!212000))

(declare-fun m!326857 () Bool)

(assert (=> d!71881 m!326857))

(declare-fun m!326859 () Bool)

(assert (=> d!71881 m!326859))

(declare-fun m!326861 () Bool)

(assert (=> d!71881 m!326861))

(declare-fun m!326863 () Bool)

(assert (=> d!71881 m!326863))

(declare-fun m!326865 () Bool)

(assert (=> d!71881 m!326865))

(assert (=> d!71881 m!326333))

(assert (=> b!211747 d!71881))

(declare-fun d!71883 () Bool)

(assert (=> d!71883 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4617 (buf!5143 (_2!9719 lt!333521)))) ((_ sign_extend 32) (currentByte!9703 (_2!9719 lt!333522))) ((_ sign_extend 32) (currentBit!9698 (_2!9719 lt!333522))) lt!333503) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4617 (buf!5143 (_2!9719 lt!333521)))) ((_ sign_extend 32) (currentByte!9703 (_2!9719 lt!333522))) ((_ sign_extend 32) (currentBit!9698 (_2!9719 lt!333522)))) lt!333503))))

(declare-fun bs!17635 () Bool)

(assert (= bs!17635 d!71883))

(declare-fun m!326867 () Bool)

(assert (=> bs!17635 m!326867))

(assert (=> b!211747 d!71883))

(declare-fun d!71885 () Bool)

(declare-fun e!144506 () Bool)

(assert (=> d!71885 e!144506))

(declare-fun res!178047 () Bool)

(assert (=> d!71885 (=> (not res!178047) (not e!144506))))

(declare-fun lt!334232 () (_ BitVec 64))

(declare-fun lt!334228 () (_ BitVec 64))

(declare-fun lt!334230 () (_ BitVec 64))

(assert (=> d!71885 (= res!178047 (= lt!334228 (bvsub lt!334230 lt!334232)))))

(assert (=> d!71885 (or (= (bvand lt!334230 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!334232 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!334230 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!334230 lt!334232) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71885 (= lt!334232 (remainingBits!0 ((_ sign_extend 32) (size!4617 (buf!5143 (_1!9718 lt!333520)))) ((_ sign_extend 32) (currentByte!9703 (_1!9718 lt!333520))) ((_ sign_extend 32) (currentBit!9698 (_1!9718 lt!333520)))))))

(declare-fun lt!334231 () (_ BitVec 64))

(declare-fun lt!334227 () (_ BitVec 64))

(assert (=> d!71885 (= lt!334230 (bvmul lt!334231 lt!334227))))

(assert (=> d!71885 (or (= lt!334231 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!334227 (bvsdiv (bvmul lt!334231 lt!334227) lt!334231)))))

(assert (=> d!71885 (= lt!334227 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71885 (= lt!334231 ((_ sign_extend 32) (size!4617 (buf!5143 (_1!9718 lt!333520)))))))

(assert (=> d!71885 (= lt!334228 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9703 (_1!9718 lt!333520))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9698 (_1!9718 lt!333520)))))))

(assert (=> d!71885 (invariant!0 (currentBit!9698 (_1!9718 lt!333520)) (currentByte!9703 (_1!9718 lt!333520)) (size!4617 (buf!5143 (_1!9718 lt!333520))))))

(assert (=> d!71885 (= (bitIndex!0 (size!4617 (buf!5143 (_1!9718 lt!333520))) (currentByte!9703 (_1!9718 lt!333520)) (currentBit!9698 (_1!9718 lt!333520))) lt!334228)))

(declare-fun b!212001 () Bool)

(declare-fun res!178048 () Bool)

(assert (=> b!212001 (=> (not res!178048) (not e!144506))))

(assert (=> b!212001 (= res!178048 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!334228))))

(declare-fun b!212002 () Bool)

(declare-fun lt!334229 () (_ BitVec 64))

(assert (=> b!212002 (= e!144506 (bvsle lt!334228 (bvmul lt!334229 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!212002 (or (= lt!334229 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!334229 #b0000000000000000000000000000000000000000000000000000000000001000) lt!334229)))))

(assert (=> b!212002 (= lt!334229 ((_ sign_extend 32) (size!4617 (buf!5143 (_1!9718 lt!333520)))))))

(assert (= (and d!71885 res!178047) b!212001))

(assert (= (and b!212001 res!178048) b!212002))

(declare-fun m!326869 () Bool)

(assert (=> d!71885 m!326869))

(declare-fun m!326871 () Bool)

(assert (=> d!71885 m!326871))

(assert (=> b!211747 d!71885))

(declare-fun d!71887 () Bool)

(declare-fun lt!334233 () tuple2!18140)

(assert (=> d!71887 (= lt!334233 (readNBitsLSBFirstsLoop!0 (_1!9720 lt!333524) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!333507))))

(assert (=> d!71887 (= (readNBitsLSBFirstsLoopPure!0 (_1!9720 lt!333524) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!333507) (tuple2!18133 (_2!9725 lt!334233) (_1!9725 lt!334233)))))

(declare-fun bs!17636 () Bool)

(assert (= bs!17636 d!71887))

(declare-fun m!326873 () Bool)

(assert (=> bs!17636 m!326873))

(assert (=> b!211747 d!71887))

(declare-fun d!71889 () Bool)

(declare-fun lt!334234 () tuple2!18138)

(assert (=> d!71889 (= lt!334234 (readBit!0 lt!333508))))

(assert (=> d!71889 (= (readBitPure!0 lt!333508) (tuple2!18127 (_2!9724 lt!334234) (_1!9724 lt!334234)))))

(declare-fun bs!17637 () Bool)

(assert (= bs!17637 d!71889))

(declare-fun m!326875 () Bool)

(assert (=> bs!17637 m!326875))

(assert (=> b!211747 d!71889))

(declare-fun e!144508 () Bool)

(declare-fun lt!334257 () (_ BitVec 64))

(declare-fun b!212003 () Bool)

(declare-fun lt!334241 () (_ BitVec 64))

(declare-fun lt!334256 () tuple2!18130)

(assert (=> b!212003 (= e!144508 (= (_1!9720 lt!334256) (withMovedBitIndex!0 (_2!9720 lt!334256) (bvsub lt!334241 lt!334257))))))

(assert (=> b!212003 (or (= (bvand lt!334241 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!334257 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!334241 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!334241 lt!334257) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!212003 (= lt!334257 (bitIndex!0 (size!4617 (buf!5143 (_2!9719 lt!333521))) (currentByte!9703 (_2!9719 lt!333521)) (currentBit!9698 (_2!9719 lt!333521))))))

(assert (=> b!212003 (= lt!334241 (bitIndex!0 (size!4617 (buf!5143 thiss!1204)) (currentByte!9703 thiss!1204) (currentBit!9698 thiss!1204)))))

(declare-fun b!212004 () Bool)

(declare-fun e!144507 () Unit!15101)

(declare-fun Unit!15128 () Unit!15101)

(assert (=> b!212004 (= e!144507 Unit!15128)))

(declare-fun b!212005 () Bool)

(declare-fun res!178050 () Bool)

(assert (=> b!212005 (=> (not res!178050) (not e!144508))))

(assert (=> b!212005 (= res!178050 (isPrefixOf!0 (_1!9720 lt!334256) thiss!1204))))

(declare-fun b!212006 () Bool)

(declare-fun lt!334246 () Unit!15101)

(assert (=> b!212006 (= e!144507 lt!334246)))

(declare-fun lt!334239 () (_ BitVec 64))

(assert (=> b!212006 (= lt!334239 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!334250 () (_ BitVec 64))

(assert (=> b!212006 (= lt!334250 (bitIndex!0 (size!4617 (buf!5143 thiss!1204)) (currentByte!9703 thiss!1204) (currentBit!9698 thiss!1204)))))

(assert (=> b!212006 (= lt!334246 (arrayBitRangesEqSymmetric!0 (buf!5143 thiss!1204) (buf!5143 (_2!9719 lt!333521)) lt!334239 lt!334250))))

(assert (=> b!212006 (arrayBitRangesEq!0 (buf!5143 (_2!9719 lt!333521)) (buf!5143 thiss!1204) lt!334239 lt!334250)))

(declare-fun d!71891 () Bool)

(assert (=> d!71891 e!144508))

(declare-fun res!178049 () Bool)

(assert (=> d!71891 (=> (not res!178049) (not e!144508))))

(assert (=> d!71891 (= res!178049 (isPrefixOf!0 (_1!9720 lt!334256) (_2!9720 lt!334256)))))

(declare-fun lt!334240 () BitStream!8342)

(assert (=> d!71891 (= lt!334256 (tuple2!18131 lt!334240 (_2!9719 lt!333521)))))

(declare-fun lt!334244 () Unit!15101)

(declare-fun lt!334253 () Unit!15101)

(assert (=> d!71891 (= lt!334244 lt!334253)))

(assert (=> d!71891 (isPrefixOf!0 lt!334240 (_2!9719 lt!333521))))

(assert (=> d!71891 (= lt!334253 (lemmaIsPrefixTransitive!0 lt!334240 (_2!9719 lt!333521) (_2!9719 lt!333521)))))

(declare-fun lt!334251 () Unit!15101)

(declare-fun lt!334254 () Unit!15101)

(assert (=> d!71891 (= lt!334251 lt!334254)))

(assert (=> d!71891 (isPrefixOf!0 lt!334240 (_2!9719 lt!333521))))

(assert (=> d!71891 (= lt!334254 (lemmaIsPrefixTransitive!0 lt!334240 thiss!1204 (_2!9719 lt!333521)))))

(declare-fun lt!334252 () Unit!15101)

(assert (=> d!71891 (= lt!334252 e!144507)))

(declare-fun c!10438 () Bool)

(assert (=> d!71891 (= c!10438 (not (= (size!4617 (buf!5143 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!334243 () Unit!15101)

(declare-fun lt!334249 () Unit!15101)

(assert (=> d!71891 (= lt!334243 lt!334249)))

(assert (=> d!71891 (isPrefixOf!0 (_2!9719 lt!333521) (_2!9719 lt!333521))))

(assert (=> d!71891 (= lt!334249 (lemmaIsPrefixRefl!0 (_2!9719 lt!333521)))))

(declare-fun lt!334245 () Unit!15101)

(declare-fun lt!334258 () Unit!15101)

(assert (=> d!71891 (= lt!334245 lt!334258)))

(assert (=> d!71891 (= lt!334258 (lemmaIsPrefixRefl!0 (_2!9719 lt!333521)))))

(declare-fun lt!334248 () Unit!15101)

(declare-fun lt!334255 () Unit!15101)

(assert (=> d!71891 (= lt!334248 lt!334255)))

(assert (=> d!71891 (isPrefixOf!0 lt!334240 lt!334240)))

(assert (=> d!71891 (= lt!334255 (lemmaIsPrefixRefl!0 lt!334240))))

(declare-fun lt!334247 () Unit!15101)

(declare-fun lt!334242 () Unit!15101)

(assert (=> d!71891 (= lt!334247 lt!334242)))

(assert (=> d!71891 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!71891 (= lt!334242 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!71891 (= lt!334240 (BitStream!8343 (buf!5143 (_2!9719 lt!333521)) (currentByte!9703 thiss!1204) (currentBit!9698 thiss!1204)))))

(assert (=> d!71891 (isPrefixOf!0 thiss!1204 (_2!9719 lt!333521))))

(assert (=> d!71891 (= (reader!0 thiss!1204 (_2!9719 lt!333521)) lt!334256)))

(declare-fun b!212007 () Bool)

(declare-fun res!178051 () Bool)

(assert (=> b!212007 (=> (not res!178051) (not e!144508))))

(assert (=> b!212007 (= res!178051 (isPrefixOf!0 (_2!9720 lt!334256) (_2!9719 lt!333521)))))

(assert (= (and d!71891 c!10438) b!212006))

(assert (= (and d!71891 (not c!10438)) b!212004))

(assert (= (and d!71891 res!178049) b!212005))

(assert (= (and b!212005 res!178050) b!212007))

(assert (= (and b!212007 res!178051) b!212003))

(declare-fun m!326877 () Bool)

(assert (=> b!212003 m!326877))

(assert (=> b!212003 m!326375))

(assert (=> b!212003 m!326369))

(assert (=> d!71891 m!326377))

(declare-fun m!326879 () Bool)

(assert (=> d!71891 m!326879))

(declare-fun m!326881 () Bool)

(assert (=> d!71891 m!326881))

(declare-fun m!326883 () Bool)

(assert (=> d!71891 m!326883))

(declare-fun m!326885 () Bool)

(assert (=> d!71891 m!326885))

(declare-fun m!326887 () Bool)

(assert (=> d!71891 m!326887))

(declare-fun m!326889 () Bool)

(assert (=> d!71891 m!326889))

(assert (=> d!71891 m!326833))

(declare-fun m!326891 () Bool)

(assert (=> d!71891 m!326891))

(declare-fun m!326893 () Bool)

(assert (=> d!71891 m!326893))

(assert (=> d!71891 m!326839))

(assert (=> b!212006 m!326369))

(declare-fun m!326895 () Bool)

(assert (=> b!212006 m!326895))

(declare-fun m!326897 () Bool)

(assert (=> b!212006 m!326897))

(declare-fun m!326899 () Bool)

(assert (=> b!212005 m!326899))

(declare-fun m!326901 () Bool)

(assert (=> b!212007 m!326901))

(assert (=> b!211747 d!71891))

(declare-fun d!71893 () Bool)

(declare-fun lt!334293 () tuple2!18138)

(assert (=> d!71893 (= lt!334293 (readBit!0 (_1!9720 lt!333514)))))

(assert (=> d!71893 (= (readBitPure!0 (_1!9720 lt!333514)) (tuple2!18127 (_2!9724 lt!334293) (_1!9724 lt!334293)))))

(declare-fun bs!17638 () Bool)

(assert (= bs!17638 d!71893))

(declare-fun m!326903 () Bool)

(assert (=> bs!17638 m!326903))

(assert (=> b!211747 d!71893))

(declare-fun d!71895 () Bool)

(declare-fun e!144513 () Bool)

(assert (=> d!71895 e!144513))

(declare-fun res!178058 () Bool)

(assert (=> d!71895 (=> (not res!178058) (not e!144513))))

(declare-fun lt!334301 () (_ BitVec 64))

(declare-fun lt!334297 () (_ BitVec 64))

(declare-fun lt!334299 () (_ BitVec 64))

(assert (=> d!71895 (= res!178058 (= lt!334297 (bvsub lt!334299 lt!334301)))))

(assert (=> d!71895 (or (= (bvand lt!334299 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!334301 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!334299 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!334299 lt!334301) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71895 (= lt!334301 (remainingBits!0 ((_ sign_extend 32) (size!4617 (buf!5143 (_1!9718 lt!333518)))) ((_ sign_extend 32) (currentByte!9703 (_1!9718 lt!333518))) ((_ sign_extend 32) (currentBit!9698 (_1!9718 lt!333518)))))))

(declare-fun lt!334300 () (_ BitVec 64))

(declare-fun lt!334296 () (_ BitVec 64))

(assert (=> d!71895 (= lt!334299 (bvmul lt!334300 lt!334296))))

(assert (=> d!71895 (or (= lt!334300 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!334296 (bvsdiv (bvmul lt!334300 lt!334296) lt!334300)))))

(assert (=> d!71895 (= lt!334296 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71895 (= lt!334300 ((_ sign_extend 32) (size!4617 (buf!5143 (_1!9718 lt!333518)))))))

(assert (=> d!71895 (= lt!334297 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9703 (_1!9718 lt!333518))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9698 (_1!9718 lt!333518)))))))

(assert (=> d!71895 (invariant!0 (currentBit!9698 (_1!9718 lt!333518)) (currentByte!9703 (_1!9718 lt!333518)) (size!4617 (buf!5143 (_1!9718 lt!333518))))))

(assert (=> d!71895 (= (bitIndex!0 (size!4617 (buf!5143 (_1!9718 lt!333518))) (currentByte!9703 (_1!9718 lt!333518)) (currentBit!9698 (_1!9718 lt!333518))) lt!334297)))

(declare-fun b!212018 () Bool)

(declare-fun res!178059 () Bool)

(assert (=> b!212018 (=> (not res!178059) (not e!144513))))

(assert (=> b!212018 (= res!178059 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!334297))))

(declare-fun b!212019 () Bool)

(declare-fun lt!334298 () (_ BitVec 64))

(assert (=> b!212019 (= e!144513 (bvsle lt!334297 (bvmul lt!334298 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!212019 (or (= lt!334298 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!334298 #b0000000000000000000000000000000000000000000000000000000000001000) lt!334298)))))

(assert (=> b!212019 (= lt!334298 ((_ sign_extend 32) (size!4617 (buf!5143 (_1!9718 lt!333518)))))))

(assert (= (and d!71895 res!178058) b!212018))

(assert (= (and b!212018 res!178059) b!212019))

(declare-fun m!326905 () Bool)

(assert (=> d!71895 m!326905))

(declare-fun m!326907 () Bool)

(assert (=> d!71895 m!326907))

(assert (=> b!211747 d!71895))

(declare-fun d!71897 () Bool)

(declare-fun e!144514 () Bool)

(assert (=> d!71897 e!144514))

(declare-fun res!178060 () Bool)

(assert (=> d!71897 (=> (not res!178060) (not e!144514))))

(declare-fun lt!334303 () (_ BitVec 64))

(declare-fun lt!334302 () BitStream!8342)

(assert (=> d!71897 (= res!178060 (= (bvadd lt!334303 (bvsub lt!333505 lt!333498)) (bitIndex!0 (size!4617 (buf!5143 lt!334302)) (currentByte!9703 lt!334302) (currentBit!9698 lt!334302))))))

(assert (=> d!71897 (or (not (= (bvand lt!334303 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!333505 lt!333498) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!334303 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!334303 (bvsub lt!333505 lt!333498)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71897 (= lt!334303 (bitIndex!0 (size!4617 (buf!5143 (_2!9720 lt!333524))) (currentByte!9703 (_2!9720 lt!333524)) (currentBit!9698 (_2!9720 lt!333524))))))

(assert (=> d!71897 (= lt!334302 (_2!9719 (moveBitIndex!0 (_2!9720 lt!333524) (bvsub lt!333505 lt!333498))))))

(assert (=> d!71897 (moveBitIndexPrecond!0 (_2!9720 lt!333524) (bvsub lt!333505 lt!333498))))

(assert (=> d!71897 (= (withMovedBitIndex!0 (_2!9720 lt!333524) (bvsub lt!333505 lt!333498)) lt!334302)))

(declare-fun b!212020 () Bool)

(assert (=> b!212020 (= e!144514 (= (size!4617 (buf!5143 (_2!9720 lt!333524))) (size!4617 (buf!5143 lt!334302))))))

(assert (= (and d!71897 res!178060) b!212020))

(declare-fun m!326909 () Bool)

(assert (=> d!71897 m!326909))

(declare-fun m!326911 () Bool)

(assert (=> d!71897 m!326911))

(declare-fun m!326913 () Bool)

(assert (=> d!71897 m!326913))

(declare-fun m!326915 () Bool)

(assert (=> d!71897 m!326915))

(assert (=> b!211748 d!71897))

(declare-fun d!71899 () Bool)

(assert (=> d!71899 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9698 thiss!1204) (currentByte!9703 thiss!1204) (size!4617 (buf!5143 thiss!1204))))))

(declare-fun bs!17639 () Bool)

(assert (= bs!17639 d!71899))

(assert (=> bs!17639 m!326389))

(assert (=> start!44434 d!71899))

(declare-fun d!71901 () Bool)

(declare-fun e!144515 () Bool)

(assert (=> d!71901 e!144515))

(declare-fun res!178061 () Bool)

(assert (=> d!71901 (=> (not res!178061) (not e!144515))))

(declare-fun lt!334307 () (_ BitVec 64))

(declare-fun lt!334309 () (_ BitVec 64))

(declare-fun lt!334305 () (_ BitVec 64))

(assert (=> d!71901 (= res!178061 (= lt!334305 (bvsub lt!334307 lt!334309)))))

(assert (=> d!71901 (or (= (bvand lt!334307 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!334309 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!334307 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!334307 lt!334309) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71901 (= lt!334309 (remainingBits!0 ((_ sign_extend 32) (size!4617 (buf!5143 (_1!9718 lt!333509)))) ((_ sign_extend 32) (currentByte!9703 (_1!9718 lt!333509))) ((_ sign_extend 32) (currentBit!9698 (_1!9718 lt!333509)))))))

(declare-fun lt!334308 () (_ BitVec 64))

(declare-fun lt!334304 () (_ BitVec 64))

(assert (=> d!71901 (= lt!334307 (bvmul lt!334308 lt!334304))))

(assert (=> d!71901 (or (= lt!334308 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!334304 (bvsdiv (bvmul lt!334308 lt!334304) lt!334308)))))

(assert (=> d!71901 (= lt!334304 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71901 (= lt!334308 ((_ sign_extend 32) (size!4617 (buf!5143 (_1!9718 lt!333509)))))))

(assert (=> d!71901 (= lt!334305 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9703 (_1!9718 lt!333509))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9698 (_1!9718 lt!333509)))))))

(assert (=> d!71901 (invariant!0 (currentBit!9698 (_1!9718 lt!333509)) (currentByte!9703 (_1!9718 lt!333509)) (size!4617 (buf!5143 (_1!9718 lt!333509))))))

(assert (=> d!71901 (= (bitIndex!0 (size!4617 (buf!5143 (_1!9718 lt!333509))) (currentByte!9703 (_1!9718 lt!333509)) (currentBit!9698 (_1!9718 lt!333509))) lt!334305)))

(declare-fun b!212021 () Bool)

(declare-fun res!178062 () Bool)

(assert (=> b!212021 (=> (not res!178062) (not e!144515))))

(assert (=> b!212021 (= res!178062 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!334305))))

(declare-fun b!212022 () Bool)

(declare-fun lt!334306 () (_ BitVec 64))

(assert (=> b!212022 (= e!144515 (bvsle lt!334305 (bvmul lt!334306 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!212022 (or (= lt!334306 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!334306 #b0000000000000000000000000000000000000000000000000000000000001000) lt!334306)))))

(assert (=> b!212022 (= lt!334306 ((_ sign_extend 32) (size!4617 (buf!5143 (_1!9718 lt!333509)))))))

(assert (= (and d!71901 res!178061) b!212021))

(assert (= (and b!212021 res!178062) b!212022))

(declare-fun m!326917 () Bool)

(assert (=> d!71901 m!326917))

(declare-fun m!326919 () Bool)

(assert (=> d!71901 m!326919))

(assert (=> b!211754 d!71901))

(declare-fun d!71903 () Bool)

(declare-fun e!144516 () Bool)

(assert (=> d!71903 e!144516))

(declare-fun res!178063 () Bool)

(assert (=> d!71903 (=> (not res!178063) (not e!144516))))

(declare-fun lt!334311 () (_ BitVec 64))

(declare-fun lt!334310 () BitStream!8342)

(assert (=> d!71903 (= res!178063 (= (bvadd lt!334311 (bvsub lt!333516 lt!333498)) (bitIndex!0 (size!4617 (buf!5143 lt!334310)) (currentByte!9703 lt!334310) (currentBit!9698 lt!334310))))))

(assert (=> d!71903 (or (not (= (bvand lt!334311 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!333516 lt!333498) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!334311 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!334311 (bvsub lt!333516 lt!333498)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71903 (= lt!334311 (bitIndex!0 (size!4617 (buf!5143 (_2!9720 lt!333514))) (currentByte!9703 (_2!9720 lt!333514)) (currentBit!9698 (_2!9720 lt!333514))))))

(assert (=> d!71903 (= lt!334310 (_2!9719 (moveBitIndex!0 (_2!9720 lt!333514) (bvsub lt!333516 lt!333498))))))

(assert (=> d!71903 (moveBitIndexPrecond!0 (_2!9720 lt!333514) (bvsub lt!333516 lt!333498))))

(assert (=> d!71903 (= (withMovedBitIndex!0 (_2!9720 lt!333514) (bvsub lt!333516 lt!333498)) lt!334310)))

(declare-fun b!212023 () Bool)

(assert (=> b!212023 (= e!144516 (= (size!4617 (buf!5143 (_2!9720 lt!333514))) (size!4617 (buf!5143 lt!334310))))))

(assert (= (and d!71903 res!178063) b!212023))

(declare-fun m!326921 () Bool)

(assert (=> d!71903 m!326921))

(declare-fun m!326923 () Bool)

(assert (=> d!71903 m!326923))

(declare-fun m!326925 () Bool)

(assert (=> d!71903 m!326925))

(declare-fun m!326927 () Bool)

(assert (=> d!71903 m!326927))

(assert (=> b!211756 d!71903))

(push 1)

(assert (not b!211921))

(assert (not d!71887))

(assert (not d!71749))

(assert (not d!71833))

(assert (not d!71843))

(assert (not d!71751))

(assert (not b!211995))

(assert (not b!212005))

(assert (not b!211926))

(assert (not d!71897))

(assert (not b!211971))

(assert (not d!71885))

(assert (not b!211922))

(assert (not b!211932))

(assert (not b!211993))

(assert (not d!71807))

(assert (not b!211996))

(assert (not d!71741))

(assert (not b!211969))

(assert (not b!211925))

(assert (not d!71889))

(assert (not d!71879))

(assert (not d!71781))

(assert (not d!71901))

(assert (not b!211791))

(assert (not d!71891))

(assert (not d!71819))

(assert (not b!211788))

(assert (not d!71841))

(assert (not d!71873))

(assert (not b!212006))

(assert (not d!71835))

(assert (not b!211917))

(assert (not b!211997))

(assert (not b!212007))

(assert (not b!211786))

(assert (not d!71785))

(assert (not b!211798))

(assert (not bm!3336))

(assert (not d!71895))

(assert (not d!71893))

(assert (not d!71793))

(assert (not d!71883))

(assert (not d!71903))

(assert (not d!71745))

(assert (not b!211924))

(assert (not b!211800))

(assert (not d!71787))

(assert (not d!71875))

(assert (not b!211929))

(assert (not d!71871))

(assert (not b!211972))

(assert (not d!71881))

(assert (not b!211953))

(assert (not b!211928))

(assert (not d!71899))

(assert (not b!212003))

(assert (not b!211970))

(assert (not b!211930))

(assert (not b!211789))

(check-sat)

(pop 1)

(push 1)

(check-sat)

