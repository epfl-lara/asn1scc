; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44686 () Bool)

(assert start!44686)

(declare-fun b!213697 () Bool)

(declare-fun e!145540 () Bool)

(declare-datatypes ((array!10554 0))(
  ( (array!10555 (arr!5565 (Array (_ BitVec 32) (_ BitVec 8))) (size!4635 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8378 0))(
  ( (BitStream!8379 (buf!5167 array!10554) (currentByte!9739 (_ BitVec 32)) (currentBit!9734 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8378)

(declare-fun array_inv!4376 (array!10554) Bool)

(assert (=> b!213697 (= e!145540 (array_inv!4376 (buf!5167 thiss!1204)))))

(declare-fun b!213698 () Bool)

(declare-fun res!179628 () Bool)

(declare-fun e!145537 () Bool)

(assert (=> b!213698 (=> (not res!179628) (not e!145537))))

(declare-datatypes ((tuple2!18294 0))(
  ( (tuple2!18295 (_1!9802 BitStream!8378) (_2!9802 BitStream!8378)) )
))
(declare-fun lt!337356 () tuple2!18294)

(declare-fun lt!337361 () (_ BitVec 64))

(declare-fun lt!337346 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!8378 (_ BitVec 64)) BitStream!8378)

(assert (=> b!213698 (= res!179628 (= (_1!9802 lt!337356) (withMovedBitIndex!0 (_2!9802 lt!337356) (bvsub lt!337361 lt!337346))))))

(declare-fun b!213699 () Bool)

(declare-fun e!145550 () Bool)

(declare-datatypes ((tuple2!18296 0))(
  ( (tuple2!18297 (_1!9803 BitStream!8378) (_2!9803 Bool)) )
))
(declare-fun lt!337364 () tuple2!18296)

(declare-fun lt!337344 () tuple2!18296)

(assert (=> b!213699 (= e!145550 (= (_2!9803 lt!337364) (_2!9803 lt!337344)))))

(declare-fun b!213700 () Bool)

(declare-fun res!179630 () Bool)

(declare-fun e!145544 () Bool)

(assert (=> b!213700 (=> (not res!179630) (not e!145544))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!213700 (= res!179630 (invariant!0 (currentBit!9734 thiss!1204) (currentByte!9739 thiss!1204) (size!4635 (buf!5167 thiss!1204))))))

(declare-fun b!213701 () Bool)

(declare-fun res!179618 () Bool)

(declare-fun e!145546 () Bool)

(assert (=> b!213701 (=> res!179618 e!145546)))

(declare-datatypes ((Unit!15215 0))(
  ( (Unit!15216) )
))
(declare-datatypes ((tuple2!18298 0))(
  ( (tuple2!18299 (_1!9804 Unit!15215) (_2!9804 BitStream!8378)) )
))
(declare-fun lt!337349 () tuple2!18298)

(declare-fun lt!337367 () tuple2!18298)

(declare-fun isPrefixOf!0 (BitStream!8378 BitStream!8378) Bool)

(assert (=> b!213701 (= res!179618 (not (isPrefixOf!0 (_2!9804 lt!337349) (_2!9804 lt!337367))))))

(declare-fun b!213702 () Bool)

(declare-fun res!179626 () Bool)

(declare-fun e!145539 () Bool)

(assert (=> b!213702 (=> res!179626 e!145539)))

(declare-datatypes ((tuple2!18300 0))(
  ( (tuple2!18301 (_1!9805 BitStream!8378) (_2!9805 (_ BitVec 64))) )
))
(declare-fun lt!337365 () tuple2!18300)

(declare-fun lt!337366 () tuple2!18294)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!213702 (= res!179626 (not (= (bitIndex!0 (size!4635 (buf!5167 (_1!9805 lt!337365))) (currentByte!9739 (_1!9805 lt!337365)) (currentBit!9734 (_1!9805 lt!337365))) (bitIndex!0 (size!4635 (buf!5167 (_2!9802 lt!337366))) (currentByte!9739 (_2!9802 lt!337366)) (currentBit!9734 (_2!9802 lt!337366))))))))

(declare-fun b!213703 () Bool)

(declare-fun res!179616 () Bool)

(declare-fun e!145542 () Bool)

(assert (=> b!213703 (=> res!179616 e!145542)))

(assert (=> b!213703 (= res!179616 (not (= (size!4635 (buf!5167 (_2!9804 lt!337367))) (size!4635 (buf!5167 thiss!1204)))))))

(declare-fun b!213704 () Bool)

(declare-fun res!179608 () Bool)

(assert (=> b!213704 (=> res!179608 e!145542)))

(assert (=> b!213704 (= res!179608 (not (invariant!0 (currentBit!9734 (_2!9804 lt!337367)) (currentByte!9739 (_2!9804 lt!337367)) (size!4635 (buf!5167 (_2!9804 lt!337367))))))))

(declare-fun b!213705 () Bool)

(declare-fun e!145541 () Bool)

(declare-fun e!145549 () Bool)

(assert (=> b!213705 (= e!145541 e!145549)))

(declare-fun res!179613 () Bool)

(assert (=> b!213705 (=> (not res!179613) (not e!145549))))

(declare-fun lt!337342 () (_ BitVec 64))

(declare-fun lt!337359 () (_ BitVec 64))

(assert (=> b!213705 (= res!179613 (= lt!337342 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!337359)))))

(assert (=> b!213705 (= lt!337342 (bitIndex!0 (size!4635 (buf!5167 (_2!9804 lt!337349))) (currentByte!9739 (_2!9804 lt!337349)) (currentBit!9734 (_2!9804 lt!337349))))))

(assert (=> b!213705 (= lt!337359 (bitIndex!0 (size!4635 (buf!5167 thiss!1204)) (currentByte!9739 thiss!1204) (currentBit!9734 thiss!1204)))))

(declare-fun b!213706 () Bool)

(declare-fun e!145551 () Bool)

(assert (=> b!213706 (= e!145551 e!145544)))

(declare-fun res!179612 () Bool)

(assert (=> b!213706 (=> (not res!179612) (not e!145544))))

(declare-fun lt!337341 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!213706 (= res!179612 (validate_offset_bits!1 ((_ sign_extend 32) (size!4635 (buf!5167 thiss!1204))) ((_ sign_extend 32) (currentByte!9739 thiss!1204)) ((_ sign_extend 32) (currentBit!9734 thiss!1204)) lt!337341))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!213706 (= lt!337341 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!213707 () Bool)

(declare-fun e!145547 () Bool)

(assert (=> b!213707 (= e!145549 e!145547)))

(declare-fun res!179621 () Bool)

(assert (=> b!213707 (=> (not res!179621) (not e!145547))))

(declare-fun lt!337347 () Bool)

(declare-fun lt!337354 () tuple2!18296)

(assert (=> b!213707 (= res!179621 (and (= (_2!9803 lt!337354) lt!337347) (= (_1!9803 lt!337354) (_2!9804 lt!337349))))))

(declare-fun readBitPure!0 (BitStream!8378) tuple2!18296)

(declare-fun readerFrom!0 (BitStream!8378 (_ BitVec 32) (_ BitVec 32)) BitStream!8378)

(assert (=> b!213707 (= lt!337354 (readBitPure!0 (readerFrom!0 (_2!9804 lt!337349) (currentBit!9734 thiss!1204) (currentByte!9739 thiss!1204))))))

(declare-fun b!213708 () Bool)

(declare-fun e!145548 () Bool)

(assert (=> b!213708 (= e!145544 (not e!145548))))

(declare-fun res!179614 () Bool)

(assert (=> b!213708 (=> res!179614 e!145548)))

(declare-fun lt!337339 () (_ BitVec 64))

(assert (=> b!213708 (= res!179614 (not (= lt!337361 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!337339))))))

(assert (=> b!213708 (= lt!337361 (bitIndex!0 (size!4635 (buf!5167 (_2!9804 lt!337349))) (currentByte!9739 (_2!9804 lt!337349)) (currentBit!9734 (_2!9804 lt!337349))))))

(assert (=> b!213708 (= lt!337339 (bitIndex!0 (size!4635 (buf!5167 thiss!1204)) (currentByte!9739 thiss!1204) (currentBit!9734 thiss!1204)))))

(assert (=> b!213708 e!145541))

(declare-fun res!179624 () Bool)

(assert (=> b!213708 (=> (not res!179624) (not e!145541))))

(assert (=> b!213708 (= res!179624 (= (size!4635 (buf!5167 thiss!1204)) (size!4635 (buf!5167 (_2!9804 lt!337349)))))))

(declare-fun appendBit!0 (BitStream!8378 Bool) tuple2!18298)

(assert (=> b!213708 (= lt!337349 (appendBit!0 thiss!1204 lt!337347))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun lt!337350 () (_ BitVec 64))

(assert (=> b!213708 (= lt!337347 (not (= (bvand v!189 lt!337350) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!213708 (= lt!337350 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun lt!337340 () (_ BitVec 64))

(declare-fun lt!337362 () (_ BitVec 64))

(declare-fun b!213709 () Bool)

(assert (=> b!213709 (= e!145539 (or (= lt!337362 (bvand ((_ sign_extend 32) i!590) #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!337362 (bvand lt!337340 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!337338 () (_ BitVec 64))

(assert (=> b!213709 (= lt!337362 (bvand lt!337338 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!213709 (= (size!4635 (buf!5167 thiss!1204)) (size!4635 (buf!5167 (_2!9804 lt!337367))))))

(declare-fun b!213710 () Bool)

(assert (=> b!213710 (= e!145548 e!145542)))

(declare-fun res!179622 () Bool)

(assert (=> b!213710 (=> res!179622 e!145542)))

(assert (=> b!213710 (= res!179622 (not (= lt!337346 (bvsub (bvsub (bvadd lt!337361 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!213710 (= lt!337346 (bitIndex!0 (size!4635 (buf!5167 (_2!9804 lt!337367))) (currentByte!9739 (_2!9804 lt!337367)) (currentBit!9734 (_2!9804 lt!337367))))))

(assert (=> b!213710 (isPrefixOf!0 thiss!1204 (_2!9804 lt!337367))))

(declare-fun lt!337353 () Unit!15215)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8378 BitStream!8378 BitStream!8378) Unit!15215)

(assert (=> b!213710 (= lt!337353 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9804 lt!337349) (_2!9804 lt!337367)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8378 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!18298)

(assert (=> b!213710 (= lt!337367 (appendBitsLSBFirstLoopTR!0 (_2!9804 lt!337349) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun res!179615 () Bool)

(assert (=> start!44686 (=> (not res!179615) (not e!145551))))

(assert (=> start!44686 (= res!179615 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!44686 e!145551))

(assert (=> start!44686 true))

(declare-fun inv!12 (BitStream!8378) Bool)

(assert (=> start!44686 (and (inv!12 thiss!1204) e!145540)))

(declare-fun b!213711 () Bool)

(assert (=> b!213711 (= e!145542 e!145546)))

(declare-fun res!179629 () Bool)

(assert (=> b!213711 (=> res!179629 e!145546)))

(assert (=> b!213711 (= res!179629 (not (= lt!337346 lt!337340)))))

(assert (=> b!213711 (= lt!337340 (bvsub lt!337338 ((_ sign_extend 32) i!590)))))

(assert (=> b!213711 (= lt!337338 (bvadd lt!337339 ((_ sign_extend 32) nBits!348)))))

(declare-fun b!213712 () Bool)

(declare-fun e!145545 () Bool)

(assert (=> b!213712 (= e!145545 e!145539)))

(declare-fun res!179627 () Bool)

(assert (=> b!213712 (=> res!179627 e!145539)))

(declare-fun lt!337357 () BitStream!8378)

(assert (=> b!213712 (= res!179627 (not (= (_1!9802 lt!337356) lt!337357)))))

(assert (=> b!213712 e!145537))

(declare-fun res!179617 () Bool)

(assert (=> b!213712 (=> (not res!179617) (not e!145537))))

(declare-fun lt!337351 () tuple2!18300)

(assert (=> b!213712 (= res!179617 (and (= (_2!9805 lt!337365) (_2!9805 lt!337351)) (= (_1!9805 lt!337365) (_1!9805 lt!337351))))))

(declare-fun lt!337360 () (_ BitVec 64))

(declare-fun lt!337358 () Unit!15215)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8378 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!15215)

(assert (=> b!213712 (= lt!337358 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9802 lt!337366) nBits!348 i!590 lt!337360))))

(declare-fun lt!337337 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8378 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18300)

(assert (=> b!213712 (= lt!337351 (readNBitsLSBFirstsLoopPure!0 lt!337357 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!337337))))

(assert (=> b!213712 (= lt!337357 (withMovedBitIndex!0 (_1!9802 lt!337366) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!213713 () Bool)

(assert (=> b!213713 (= e!145547 (= (bitIndex!0 (size!4635 (buf!5167 (_1!9803 lt!337354))) (currentByte!9739 (_1!9803 lt!337354)) (currentBit!9734 (_1!9803 lt!337354))) lt!337342))))

(declare-fun b!213714 () Bool)

(declare-fun res!179611 () Bool)

(assert (=> b!213714 (=> (not res!179611) (not e!145537))))

(assert (=> b!213714 (= res!179611 (= (_1!9802 lt!337366) (withMovedBitIndex!0 (_2!9802 lt!337366) (bvsub lt!337339 lt!337346))))))

(declare-fun b!213715 () Bool)

(assert (=> b!213715 (= e!145546 e!145545)))

(declare-fun res!179610 () Bool)

(assert (=> b!213715 (=> res!179610 e!145545)))

(declare-fun lt!337355 () tuple2!18300)

(assert (=> b!213715 (= res!179610 (not (= (_1!9805 lt!337355) (_2!9802 lt!337356))))))

(assert (=> b!213715 (= lt!337355 (readNBitsLSBFirstsLoopPure!0 (_1!9802 lt!337356) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!337337))))

(declare-fun lt!337363 () (_ BitVec 64))

(assert (=> b!213715 (validate_offset_bits!1 ((_ sign_extend 32) (size!4635 (buf!5167 (_2!9804 lt!337367)))) ((_ sign_extend 32) (currentByte!9739 (_2!9804 lt!337349))) ((_ sign_extend 32) (currentBit!9734 (_2!9804 lt!337349))) lt!337363)))

(declare-fun lt!337348 () Unit!15215)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8378 array!10554 (_ BitVec 64)) Unit!15215)

(assert (=> b!213715 (= lt!337348 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9804 lt!337349) (buf!5167 (_2!9804 lt!337367)) lt!337363))))

(assert (=> b!213715 (= lt!337363 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!337352 () tuple2!18296)

(assert (=> b!213715 (= lt!337337 (bvor lt!337360 (ite (_2!9803 lt!337352) lt!337350 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!213715 (= lt!337365 (readNBitsLSBFirstsLoopPure!0 (_1!9802 lt!337366) nBits!348 i!590 lt!337360))))

(assert (=> b!213715 (validate_offset_bits!1 ((_ sign_extend 32) (size!4635 (buf!5167 (_2!9804 lt!337367)))) ((_ sign_extend 32) (currentByte!9739 thiss!1204)) ((_ sign_extend 32) (currentBit!9734 thiss!1204)) lt!337341)))

(declare-fun lt!337343 () Unit!15215)

(assert (=> b!213715 (= lt!337343 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5167 (_2!9804 lt!337367)) lt!337341))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!213715 (= lt!337360 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!213715 (= (_2!9803 lt!337352) lt!337347)))

(assert (=> b!213715 (= lt!337352 (readBitPure!0 (_1!9802 lt!337366)))))

(declare-fun reader!0 (BitStream!8378 BitStream!8378) tuple2!18294)

(assert (=> b!213715 (= lt!337356 (reader!0 (_2!9804 lt!337349) (_2!9804 lt!337367)))))

(assert (=> b!213715 (= lt!337366 (reader!0 thiss!1204 (_2!9804 lt!337367)))))

(assert (=> b!213715 e!145550))

(declare-fun res!179623 () Bool)

(assert (=> b!213715 (=> (not res!179623) (not e!145550))))

(assert (=> b!213715 (= res!179623 (= (bitIndex!0 (size!4635 (buf!5167 (_1!9803 lt!337364))) (currentByte!9739 (_1!9803 lt!337364)) (currentBit!9734 (_1!9803 lt!337364))) (bitIndex!0 (size!4635 (buf!5167 (_1!9803 lt!337344))) (currentByte!9739 (_1!9803 lt!337344)) (currentBit!9734 (_1!9803 lt!337344)))))))

(declare-fun lt!337336 () Unit!15215)

(declare-fun lt!337345 () BitStream!8378)

(declare-fun readBitPrefixLemma!0 (BitStream!8378 BitStream!8378) Unit!15215)

(assert (=> b!213715 (= lt!337336 (readBitPrefixLemma!0 lt!337345 (_2!9804 lt!337367)))))

(assert (=> b!213715 (= lt!337344 (readBitPure!0 (BitStream!8379 (buf!5167 (_2!9804 lt!337367)) (currentByte!9739 thiss!1204) (currentBit!9734 thiss!1204))))))

(assert (=> b!213715 (= lt!337364 (readBitPure!0 lt!337345))))

(declare-fun e!145538 () Bool)

(assert (=> b!213715 e!145538))

(declare-fun res!179619 () Bool)

(assert (=> b!213715 (=> (not res!179619) (not e!145538))))

(assert (=> b!213715 (= res!179619 (invariant!0 (currentBit!9734 thiss!1204) (currentByte!9739 thiss!1204) (size!4635 (buf!5167 (_2!9804 lt!337349)))))))

(assert (=> b!213715 (= lt!337345 (BitStream!8379 (buf!5167 (_2!9804 lt!337349)) (currentByte!9739 thiss!1204) (currentBit!9734 thiss!1204)))))

(declare-fun b!213716 () Bool)

(assert (=> b!213716 (= e!145537 (and (= lt!337339 (bvsub lt!337361 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!9802 lt!337356) lt!337357)) (= (_2!9805 lt!337365) (_2!9805 lt!337355)))))))

(declare-fun b!213717 () Bool)

(assert (=> b!213717 (= e!145538 (invariant!0 (currentBit!9734 thiss!1204) (currentByte!9739 thiss!1204) (size!4635 (buf!5167 (_2!9804 lt!337367)))))))

(declare-fun b!213718 () Bool)

(declare-fun res!179609 () Bool)

(assert (=> b!213718 (=> res!179609 e!145546)))

(assert (=> b!213718 (= res!179609 (not (isPrefixOf!0 thiss!1204 (_2!9804 lt!337349))))))

(declare-fun b!213719 () Bool)

(declare-fun res!179625 () Bool)

(assert (=> b!213719 (=> (not res!179625) (not e!145544))))

(assert (=> b!213719 (= res!179625 (not (= i!590 nBits!348)))))

(declare-fun b!213720 () Bool)

(declare-fun res!179620 () Bool)

(assert (=> b!213720 (=> (not res!179620) (not e!145549))))

(assert (=> b!213720 (= res!179620 (isPrefixOf!0 thiss!1204 (_2!9804 lt!337349)))))

(assert (= (and start!44686 res!179615) b!213706))

(assert (= (and b!213706 res!179612) b!213700))

(assert (= (and b!213700 res!179630) b!213719))

(assert (= (and b!213719 res!179625) b!213708))

(assert (= (and b!213708 res!179624) b!213705))

(assert (= (and b!213705 res!179613) b!213720))

(assert (= (and b!213720 res!179620) b!213707))

(assert (= (and b!213707 res!179621) b!213713))

(assert (= (and b!213708 (not res!179614)) b!213710))

(assert (= (and b!213710 (not res!179622)) b!213704))

(assert (= (and b!213704 (not res!179608)) b!213703))

(assert (= (and b!213703 (not res!179616)) b!213711))

(assert (= (and b!213711 (not res!179629)) b!213701))

(assert (= (and b!213701 (not res!179618)) b!213718))

(assert (= (and b!213718 (not res!179609)) b!213715))

(assert (= (and b!213715 res!179619) b!213717))

(assert (= (and b!213715 res!179623) b!213699))

(assert (= (and b!213715 (not res!179610)) b!213712))

(assert (= (and b!213712 res!179617) b!213714))

(assert (= (and b!213714 res!179611) b!213698))

(assert (= (and b!213698 res!179628) b!213716))

(assert (= (and b!213712 (not res!179627)) b!213702))

(assert (= (and b!213702 (not res!179626)) b!213709))

(assert (= start!44686 b!213697))

(declare-fun m!329297 () Bool)

(assert (=> b!213720 m!329297))

(declare-fun m!329299 () Bool)

(assert (=> b!213714 m!329299))

(declare-fun m!329301 () Bool)

(assert (=> start!44686 m!329301))

(declare-fun m!329303 () Bool)

(assert (=> b!213707 m!329303))

(assert (=> b!213707 m!329303))

(declare-fun m!329305 () Bool)

(assert (=> b!213707 m!329305))

(declare-fun m!329307 () Bool)

(assert (=> b!213701 m!329307))

(declare-fun m!329309 () Bool)

(assert (=> b!213717 m!329309))

(declare-fun m!329311 () Bool)

(assert (=> b!213712 m!329311))

(declare-fun m!329313 () Bool)

(assert (=> b!213712 m!329313))

(declare-fun m!329315 () Bool)

(assert (=> b!213712 m!329315))

(declare-fun m!329317 () Bool)

(assert (=> b!213700 m!329317))

(declare-fun m!329319 () Bool)

(assert (=> b!213710 m!329319))

(declare-fun m!329321 () Bool)

(assert (=> b!213710 m!329321))

(declare-fun m!329323 () Bool)

(assert (=> b!213710 m!329323))

(declare-fun m!329325 () Bool)

(assert (=> b!213710 m!329325))

(declare-fun m!329327 () Bool)

(assert (=> b!213704 m!329327))

(declare-fun m!329329 () Bool)

(assert (=> b!213705 m!329329))

(declare-fun m!329331 () Bool)

(assert (=> b!213705 m!329331))

(declare-fun m!329333 () Bool)

(assert (=> b!213698 m!329333))

(assert (=> b!213718 m!329297))

(declare-fun m!329335 () Bool)

(assert (=> b!213697 m!329335))

(declare-fun m!329337 () Bool)

(assert (=> b!213713 m!329337))

(assert (=> b!213708 m!329329))

(assert (=> b!213708 m!329331))

(declare-fun m!329339 () Bool)

(assert (=> b!213708 m!329339))

(declare-fun m!329341 () Bool)

(assert (=> b!213706 m!329341))

(declare-fun m!329343 () Bool)

(assert (=> b!213715 m!329343))

(declare-fun m!329345 () Bool)

(assert (=> b!213715 m!329345))

(declare-fun m!329347 () Bool)

(assert (=> b!213715 m!329347))

(declare-fun m!329349 () Bool)

(assert (=> b!213715 m!329349))

(declare-fun m!329351 () Bool)

(assert (=> b!213715 m!329351))

(declare-fun m!329353 () Bool)

(assert (=> b!213715 m!329353))

(declare-fun m!329355 () Bool)

(assert (=> b!213715 m!329355))

(declare-fun m!329357 () Bool)

(assert (=> b!213715 m!329357))

(declare-fun m!329359 () Bool)

(assert (=> b!213715 m!329359))

(declare-fun m!329361 () Bool)

(assert (=> b!213715 m!329361))

(declare-fun m!329363 () Bool)

(assert (=> b!213715 m!329363))

(declare-fun m!329365 () Bool)

(assert (=> b!213715 m!329365))

(declare-fun m!329367 () Bool)

(assert (=> b!213715 m!329367))

(declare-fun m!329369 () Bool)

(assert (=> b!213715 m!329369))

(declare-fun m!329371 () Bool)

(assert (=> b!213715 m!329371))

(declare-fun m!329373 () Bool)

(assert (=> b!213715 m!329373))

(declare-fun m!329375 () Bool)

(assert (=> b!213702 m!329375))

(declare-fun m!329377 () Bool)

(assert (=> b!213702 m!329377))

(push 1)

(assert (not b!213704))

(assert (not b!213715))

(assert (not b!213720))

(assert (not start!44686))

(assert (not b!213712))

(assert (not b!213717))

(assert (not b!213698))

(assert (not b!213705))

(assert (not b!213713))

(assert (not b!213718))

(assert (not b!213706))

(assert (not b!213700))

(assert (not b!213714))

(assert (not b!213697))

(assert (not b!213707))

(assert (not b!213710))

(assert (not b!213708))

(assert (not b!213702))

(assert (not b!213701))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!72283 () Bool)

(declare-fun e!145591 () Bool)

(assert (=> d!72283 e!145591))

(declare-fun res!179689 () Bool)

(assert (=> d!72283 (=> (not res!179689) (not e!145591))))

(declare-fun lt!337560 () BitStream!8378)

(declare-fun lt!337561 () (_ BitVec 64))

(assert (=> d!72283 (= res!179689 (= (bvadd lt!337561 (bvsub lt!337361 lt!337346)) (bitIndex!0 (size!4635 (buf!5167 lt!337560)) (currentByte!9739 lt!337560) (currentBit!9734 lt!337560))))))

(assert (=> d!72283 (or (not (= (bvand lt!337561 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!337361 lt!337346) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!337561 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!337561 (bvsub lt!337361 lt!337346)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72283 (= lt!337561 (bitIndex!0 (size!4635 (buf!5167 (_2!9802 lt!337356))) (currentByte!9739 (_2!9802 lt!337356)) (currentBit!9734 (_2!9802 lt!337356))))))

(declare-fun moveBitIndex!0 (BitStream!8378 (_ BitVec 64)) tuple2!18298)

(assert (=> d!72283 (= lt!337560 (_2!9804 (moveBitIndex!0 (_2!9802 lt!337356) (bvsub lt!337361 lt!337346))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!8378 (_ BitVec 64)) Bool)

(assert (=> d!72283 (moveBitIndexPrecond!0 (_2!9802 lt!337356) (bvsub lt!337361 lt!337346))))

(assert (=> d!72283 (= (withMovedBitIndex!0 (_2!9802 lt!337356) (bvsub lt!337361 lt!337346)) lt!337560)))

(declare-fun b!213787 () Bool)

(assert (=> b!213787 (= e!145591 (= (size!4635 (buf!5167 (_2!9802 lt!337356))) (size!4635 (buf!5167 lt!337560))))))

(assert (= (and d!72283 res!179689) b!213787))

(declare-fun m!329515 () Bool)

(assert (=> d!72283 m!329515))

(declare-fun m!329517 () Bool)

(assert (=> d!72283 m!329517))

(declare-fun m!329519 () Bool)

(assert (=> d!72283 m!329519))

(declare-fun m!329521 () Bool)

(assert (=> d!72283 m!329521))

(assert (=> b!213698 d!72283))

(declare-fun d!72285 () Bool)

(declare-fun e!145594 () Bool)

(assert (=> d!72285 e!145594))

(declare-fun res!179695 () Bool)

(assert (=> d!72285 (=> (not res!179695) (not e!145594))))

(declare-fun lt!337578 () (_ BitVec 64))

(declare-fun lt!337579 () (_ BitVec 64))

(declare-fun lt!337575 () (_ BitVec 64))

(assert (=> d!72285 (= res!179695 (= lt!337579 (bvsub lt!337575 lt!337578)))))

(assert (=> d!72285 (or (= (bvand lt!337575 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!337578 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!337575 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!337575 lt!337578) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!72285 (= lt!337578 (remainingBits!0 ((_ sign_extend 32) (size!4635 (buf!5167 (_2!9804 lt!337349)))) ((_ sign_extend 32) (currentByte!9739 (_2!9804 lt!337349))) ((_ sign_extend 32) (currentBit!9734 (_2!9804 lt!337349)))))))

(declare-fun lt!337577 () (_ BitVec 64))

(declare-fun lt!337576 () (_ BitVec 64))

(assert (=> d!72285 (= lt!337575 (bvmul lt!337577 lt!337576))))

(assert (=> d!72285 (or (= lt!337577 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!337576 (bvsdiv (bvmul lt!337577 lt!337576) lt!337577)))))

(assert (=> d!72285 (= lt!337576 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72285 (= lt!337577 ((_ sign_extend 32) (size!4635 (buf!5167 (_2!9804 lt!337349)))))))

(assert (=> d!72285 (= lt!337579 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9739 (_2!9804 lt!337349))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9734 (_2!9804 lt!337349)))))))

(assert (=> d!72285 (invariant!0 (currentBit!9734 (_2!9804 lt!337349)) (currentByte!9739 (_2!9804 lt!337349)) (size!4635 (buf!5167 (_2!9804 lt!337349))))))

(assert (=> d!72285 (= (bitIndex!0 (size!4635 (buf!5167 (_2!9804 lt!337349))) (currentByte!9739 (_2!9804 lt!337349)) (currentBit!9734 (_2!9804 lt!337349))) lt!337579)))

(declare-fun b!213792 () Bool)

(declare-fun res!179694 () Bool)

(assert (=> b!213792 (=> (not res!179694) (not e!145594))))

(assert (=> b!213792 (= res!179694 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!337579))))

(declare-fun b!213793 () Bool)

(declare-fun lt!337574 () (_ BitVec 64))

(assert (=> b!213793 (= e!145594 (bvsle lt!337579 (bvmul lt!337574 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!213793 (or (= lt!337574 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!337574 #b0000000000000000000000000000000000000000000000000000000000001000) lt!337574)))))

(assert (=> b!213793 (= lt!337574 ((_ sign_extend 32) (size!4635 (buf!5167 (_2!9804 lt!337349)))))))

(assert (= (and d!72285 res!179695) b!213792))

(assert (= (and b!213792 res!179694) b!213793))

(declare-fun m!329523 () Bool)

(assert (=> d!72285 m!329523))

(declare-fun m!329525 () Bool)

(assert (=> d!72285 m!329525))

(assert (=> b!213708 d!72285))

(declare-fun d!72287 () Bool)

(declare-fun e!145595 () Bool)

(assert (=> d!72287 e!145595))

(declare-fun res!179697 () Bool)

(assert (=> d!72287 (=> (not res!179697) (not e!145595))))

(declare-fun lt!337593 () (_ BitVec 64))

(declare-fun lt!337592 () (_ BitVec 64))

(declare-fun lt!337589 () (_ BitVec 64))

(assert (=> d!72287 (= res!179697 (= lt!337593 (bvsub lt!337589 lt!337592)))))

(assert (=> d!72287 (or (= (bvand lt!337589 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!337592 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!337589 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!337589 lt!337592) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72287 (= lt!337592 (remainingBits!0 ((_ sign_extend 32) (size!4635 (buf!5167 thiss!1204))) ((_ sign_extend 32) (currentByte!9739 thiss!1204)) ((_ sign_extend 32) (currentBit!9734 thiss!1204))))))

(declare-fun lt!337591 () (_ BitVec 64))

(declare-fun lt!337590 () (_ BitVec 64))

(assert (=> d!72287 (= lt!337589 (bvmul lt!337591 lt!337590))))

(assert (=> d!72287 (or (= lt!337591 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!337590 (bvsdiv (bvmul lt!337591 lt!337590) lt!337591)))))

(assert (=> d!72287 (= lt!337590 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72287 (= lt!337591 ((_ sign_extend 32) (size!4635 (buf!5167 thiss!1204))))))

(assert (=> d!72287 (= lt!337593 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9739 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9734 thiss!1204))))))

(assert (=> d!72287 (invariant!0 (currentBit!9734 thiss!1204) (currentByte!9739 thiss!1204) (size!4635 (buf!5167 thiss!1204)))))

(assert (=> d!72287 (= (bitIndex!0 (size!4635 (buf!5167 thiss!1204)) (currentByte!9739 thiss!1204) (currentBit!9734 thiss!1204)) lt!337593)))

(declare-fun b!213794 () Bool)

(declare-fun res!179696 () Bool)

(assert (=> b!213794 (=> (not res!179696) (not e!145595))))

(assert (=> b!213794 (= res!179696 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!337593))))

(declare-fun b!213795 () Bool)

(declare-fun lt!337588 () (_ BitVec 64))

(assert (=> b!213795 (= e!145595 (bvsle lt!337593 (bvmul lt!337588 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!213795 (or (= lt!337588 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!337588 #b0000000000000000000000000000000000000000000000000000000000001000) lt!337588)))))

(assert (=> b!213795 (= lt!337588 ((_ sign_extend 32) (size!4635 (buf!5167 thiss!1204))))))

(assert (= (and d!72287 res!179697) b!213794))

(assert (= (and b!213794 res!179696) b!213795))

(declare-fun m!329527 () Bool)

(assert (=> d!72287 m!329527))

(assert (=> d!72287 m!329317))

(assert (=> b!213708 d!72287))

(declare-fun b!213824 () Bool)

(declare-fun res!179719 () Bool)

(declare-fun e!145610 () Bool)

(assert (=> b!213824 (=> (not res!179719) (not e!145610))))

(declare-fun lt!337672 () tuple2!18298)

(assert (=> b!213824 (= res!179719 (isPrefixOf!0 thiss!1204 (_2!9804 lt!337672)))))

(declare-fun d!72289 () Bool)

(assert (=> d!72289 e!145610))

(declare-fun res!179720 () Bool)

(assert (=> d!72289 (=> (not res!179720) (not e!145610))))

(assert (=> d!72289 (= res!179720 (= (size!4635 (buf!5167 thiss!1204)) (size!4635 (buf!5167 (_2!9804 lt!337672)))))))

(declare-fun choose!16 (BitStream!8378 Bool) tuple2!18298)

(assert (=> d!72289 (= lt!337672 (choose!16 thiss!1204 lt!337347))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!72289 (validate_offset_bit!0 ((_ sign_extend 32) (size!4635 (buf!5167 thiss!1204))) ((_ sign_extend 32) (currentByte!9739 thiss!1204)) ((_ sign_extend 32) (currentBit!9734 thiss!1204)))))

(assert (=> d!72289 (= (appendBit!0 thiss!1204 lt!337347) lt!337672)))

(declare-fun b!213825 () Bool)

(declare-fun e!145609 () Bool)

(assert (=> b!213825 (= e!145610 e!145609)))

(declare-fun res!179721 () Bool)

(assert (=> b!213825 (=> (not res!179721) (not e!145609))))

(declare-fun lt!337669 () tuple2!18296)

(assert (=> b!213825 (= res!179721 (and (= (_2!9803 lt!337669) lt!337347) (= (_1!9803 lt!337669) (_2!9804 lt!337672))))))

(assert (=> b!213825 (= lt!337669 (readBitPure!0 (readerFrom!0 (_2!9804 lt!337672) (currentBit!9734 thiss!1204) (currentByte!9739 thiss!1204))))))

(declare-fun b!213826 () Bool)

(assert (=> b!213826 (= e!145609 (= (bitIndex!0 (size!4635 (buf!5167 (_1!9803 lt!337669))) (currentByte!9739 (_1!9803 lt!337669)) (currentBit!9734 (_1!9803 lt!337669))) (bitIndex!0 (size!4635 (buf!5167 (_2!9804 lt!337672))) (currentByte!9739 (_2!9804 lt!337672)) (currentBit!9734 (_2!9804 lt!337672)))))))

(declare-fun b!213823 () Bool)

(declare-fun res!179718 () Bool)

(assert (=> b!213823 (=> (not res!179718) (not e!145610))))

(declare-fun lt!337671 () (_ BitVec 64))

(declare-fun lt!337670 () (_ BitVec 64))

(assert (=> b!213823 (= res!179718 (= (bitIndex!0 (size!4635 (buf!5167 (_2!9804 lt!337672))) (currentByte!9739 (_2!9804 lt!337672)) (currentBit!9734 (_2!9804 lt!337672))) (bvadd lt!337671 lt!337670)))))

(assert (=> b!213823 (or (not (= (bvand lt!337671 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!337670 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!337671 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!337671 lt!337670) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!213823 (= lt!337670 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!213823 (= lt!337671 (bitIndex!0 (size!4635 (buf!5167 thiss!1204)) (currentByte!9739 thiss!1204) (currentBit!9734 thiss!1204)))))

(assert (= (and d!72289 res!179720) b!213823))

(assert (= (and b!213823 res!179718) b!213824))

(assert (= (and b!213824 res!179719) b!213825))

(assert (= (and b!213825 res!179721) b!213826))

(declare-fun m!329571 () Bool)

(assert (=> b!213823 m!329571))

(assert (=> b!213823 m!329331))

(declare-fun m!329573 () Bool)

(assert (=> d!72289 m!329573))

(declare-fun m!329575 () Bool)

(assert (=> d!72289 m!329575))

(declare-fun m!329577 () Bool)

(assert (=> b!213826 m!329577))

(assert (=> b!213826 m!329571))

(declare-fun m!329579 () Bool)

(assert (=> b!213825 m!329579))

(assert (=> b!213825 m!329579))

(declare-fun m!329581 () Bool)

(assert (=> b!213825 m!329581))

(declare-fun m!329583 () Bool)

(assert (=> b!213824 m!329583))

(assert (=> b!213708 d!72289))

(declare-fun d!72297 () Bool)

(declare-fun e!145611 () Bool)

(assert (=> d!72297 e!145611))

(declare-fun res!179723 () Bool)

(assert (=> d!72297 (=> (not res!179723) (not e!145611))))

(declare-fun lt!337679 () (_ BitVec 64))

(declare-fun lt!337680 () (_ BitVec 64))

(declare-fun lt!337676 () (_ BitVec 64))

(assert (=> d!72297 (= res!179723 (= lt!337680 (bvsub lt!337676 lt!337679)))))

(assert (=> d!72297 (or (= (bvand lt!337676 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!337679 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!337676 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!337676 lt!337679) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72297 (= lt!337679 (remainingBits!0 ((_ sign_extend 32) (size!4635 (buf!5167 (_2!9804 lt!337367)))) ((_ sign_extend 32) (currentByte!9739 (_2!9804 lt!337367))) ((_ sign_extend 32) (currentBit!9734 (_2!9804 lt!337367)))))))

(declare-fun lt!337678 () (_ BitVec 64))

(declare-fun lt!337677 () (_ BitVec 64))

(assert (=> d!72297 (= lt!337676 (bvmul lt!337678 lt!337677))))

(assert (=> d!72297 (or (= lt!337678 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!337677 (bvsdiv (bvmul lt!337678 lt!337677) lt!337678)))))

(assert (=> d!72297 (= lt!337677 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72297 (= lt!337678 ((_ sign_extend 32) (size!4635 (buf!5167 (_2!9804 lt!337367)))))))

(assert (=> d!72297 (= lt!337680 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9739 (_2!9804 lt!337367))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9734 (_2!9804 lt!337367)))))))

(assert (=> d!72297 (invariant!0 (currentBit!9734 (_2!9804 lt!337367)) (currentByte!9739 (_2!9804 lt!337367)) (size!4635 (buf!5167 (_2!9804 lt!337367))))))

(assert (=> d!72297 (= (bitIndex!0 (size!4635 (buf!5167 (_2!9804 lt!337367))) (currentByte!9739 (_2!9804 lt!337367)) (currentBit!9734 (_2!9804 lt!337367))) lt!337680)))

(declare-fun b!213827 () Bool)

(declare-fun res!179722 () Bool)

(assert (=> b!213827 (=> (not res!179722) (not e!145611))))

(assert (=> b!213827 (= res!179722 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!337680))))

(declare-fun b!213828 () Bool)

(declare-fun lt!337675 () (_ BitVec 64))

(assert (=> b!213828 (= e!145611 (bvsle lt!337680 (bvmul lt!337675 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!213828 (or (= lt!337675 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!337675 #b0000000000000000000000000000000000000000000000000000000000001000) lt!337675)))))

(assert (=> b!213828 (= lt!337675 ((_ sign_extend 32) (size!4635 (buf!5167 (_2!9804 lt!337367)))))))

(assert (= (and d!72297 res!179723) b!213827))

(assert (= (and b!213827 res!179722) b!213828))

(declare-fun m!329587 () Bool)

(assert (=> d!72297 m!329587))

(assert (=> d!72297 m!329327))

(assert (=> b!213710 d!72297))

(declare-fun d!72301 () Bool)

(declare-fun res!179735 () Bool)

(declare-fun e!145620 () Bool)

(assert (=> d!72301 (=> (not res!179735) (not e!145620))))

(assert (=> d!72301 (= res!179735 (= (size!4635 (buf!5167 thiss!1204)) (size!4635 (buf!5167 (_2!9804 lt!337367)))))))

(assert (=> d!72301 (= (isPrefixOf!0 thiss!1204 (_2!9804 lt!337367)) e!145620)))

(declare-fun b!213842 () Bool)

(declare-fun res!179736 () Bool)

(assert (=> b!213842 (=> (not res!179736) (not e!145620))))

(assert (=> b!213842 (= res!179736 (bvsle (bitIndex!0 (size!4635 (buf!5167 thiss!1204)) (currentByte!9739 thiss!1204) (currentBit!9734 thiss!1204)) (bitIndex!0 (size!4635 (buf!5167 (_2!9804 lt!337367))) (currentByte!9739 (_2!9804 lt!337367)) (currentBit!9734 (_2!9804 lt!337367)))))))

(declare-fun b!213843 () Bool)

(declare-fun e!145619 () Bool)

(assert (=> b!213843 (= e!145620 e!145619)))

(declare-fun res!179737 () Bool)

(assert (=> b!213843 (=> res!179737 e!145619)))

(assert (=> b!213843 (= res!179737 (= (size!4635 (buf!5167 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!213844 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10554 array!10554 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!213844 (= e!145619 (arrayBitRangesEq!0 (buf!5167 thiss!1204) (buf!5167 (_2!9804 lt!337367)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4635 (buf!5167 thiss!1204)) (currentByte!9739 thiss!1204) (currentBit!9734 thiss!1204))))))

(assert (= (and d!72301 res!179735) b!213842))

(assert (= (and b!213842 res!179736) b!213843))

(assert (= (and b!213843 (not res!179737)) b!213844))

(assert (=> b!213842 m!329331))

(assert (=> b!213842 m!329319))

(assert (=> b!213844 m!329331))

(assert (=> b!213844 m!329331))

(declare-fun m!329601 () Bool)

(assert (=> b!213844 m!329601))

(assert (=> b!213710 d!72301))

(declare-fun d!72313 () Bool)

(assert (=> d!72313 (isPrefixOf!0 thiss!1204 (_2!9804 lt!337367))))

(declare-fun lt!337729 () Unit!15215)

(declare-fun choose!30 (BitStream!8378 BitStream!8378 BitStream!8378) Unit!15215)

(assert (=> d!72313 (= lt!337729 (choose!30 thiss!1204 (_2!9804 lt!337349) (_2!9804 lt!337367)))))

(assert (=> d!72313 (isPrefixOf!0 thiss!1204 (_2!9804 lt!337349))))

(assert (=> d!72313 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9804 lt!337349) (_2!9804 lt!337367)) lt!337729)))

(declare-fun bs!17735 () Bool)

(assert (= bs!17735 d!72313))

(assert (=> bs!17735 m!329321))

(declare-fun m!329643 () Bool)

(assert (=> bs!17735 m!329643))

(assert (=> bs!17735 m!329297))

(assert (=> b!213710 d!72313))

(declare-fun b!214021 () Bool)

(declare-fun lt!338316 () tuple2!18296)

(declare-fun lt!338313 () tuple2!18298)

(assert (=> b!214021 (= lt!338316 (readBitPure!0 (readerFrom!0 (_2!9804 lt!338313) (currentBit!9734 (_2!9804 lt!337349)) (currentByte!9739 (_2!9804 lt!337349)))))))

(declare-fun lt!338299 () Bool)

(declare-fun res!179887 () Bool)

(assert (=> b!214021 (= res!179887 (and (= (_2!9803 lt!338316) lt!338299) (= (_1!9803 lt!338316) (_2!9804 lt!338313))))))

(declare-fun e!145726 () Bool)

(assert (=> b!214021 (=> (not res!179887) (not e!145726))))

(declare-fun e!145723 () Bool)

(assert (=> b!214021 (= e!145723 e!145726)))

(declare-fun b!214022 () Bool)

(declare-fun res!179885 () Bool)

(declare-fun call!3360 () Bool)

(assert (=> b!214022 (= res!179885 call!3360)))

(assert (=> b!214022 (=> (not res!179885) (not e!145723))))

(declare-fun b!214023 () Bool)

(declare-fun res!179886 () Bool)

(declare-fun e!145729 () Bool)

(assert (=> b!214023 (=> (not res!179886) (not e!145729))))

(declare-fun lt!338271 () tuple2!18298)

(assert (=> b!214023 (= res!179886 (isPrefixOf!0 (_2!9804 lt!337349) (_2!9804 lt!338271)))))

(declare-fun b!214024 () Bool)

(declare-fun e!145724 () Bool)

(declare-fun lt!338298 () (_ BitVec 64))

(assert (=> b!214024 (= e!145724 (validate_offset_bits!1 ((_ sign_extend 32) (size!4635 (buf!5167 (_2!9804 lt!337349)))) ((_ sign_extend 32) (currentByte!9739 (_2!9804 lt!337349))) ((_ sign_extend 32) (currentBit!9734 (_2!9804 lt!337349))) lt!338298))))

(declare-fun b!214025 () Bool)

(declare-fun e!145731 () Bool)

(assert (=> b!214025 (= e!145729 e!145731)))

(declare-fun res!179891 () Bool)

(assert (=> b!214025 (=> (not res!179891) (not e!145731))))

(declare-fun lt!338285 () tuple2!18300)

(assert (=> b!214025 (= res!179891 (= (_2!9805 lt!338285) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun lt!338295 () tuple2!18294)

(assert (=> b!214025 (= lt!338285 (readNBitsLSBFirstsLoopPure!0 (_1!9802 lt!338295) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!338291 () Unit!15215)

(declare-fun lt!338278 () Unit!15215)

(assert (=> b!214025 (= lt!338291 lt!338278)))

(assert (=> b!214025 (validate_offset_bits!1 ((_ sign_extend 32) (size!4635 (buf!5167 (_2!9804 lt!338271)))) ((_ sign_extend 32) (currentByte!9739 (_2!9804 lt!337349))) ((_ sign_extend 32) (currentBit!9734 (_2!9804 lt!337349))) lt!338298)))

(assert (=> b!214025 (= lt!338278 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9804 lt!337349) (buf!5167 (_2!9804 lt!338271)) lt!338298))))

(assert (=> b!214025 e!145724))

(declare-fun res!179884 () Bool)

(assert (=> b!214025 (=> (not res!179884) (not e!145724))))

(assert (=> b!214025 (= res!179884 (and (= (size!4635 (buf!5167 (_2!9804 lt!337349))) (size!4635 (buf!5167 (_2!9804 lt!338271)))) (bvsge lt!338298 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!214025 (= lt!338298 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!214025 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!214025 (= lt!338295 (reader!0 (_2!9804 lt!337349) (_2!9804 lt!338271)))))

(declare-fun d!72329 () Bool)

(assert (=> d!72329 e!145729))

(declare-fun res!179890 () Bool)

(assert (=> d!72329 (=> (not res!179890) (not e!145729))))

(assert (=> d!72329 (= res!179890 (invariant!0 (currentBit!9734 (_2!9804 lt!338271)) (currentByte!9739 (_2!9804 lt!338271)) (size!4635 (buf!5167 (_2!9804 lt!338271)))))))

(declare-fun e!145727 () tuple2!18298)

(assert (=> d!72329 (= lt!338271 e!145727)))

(declare-fun c!10504 () Bool)

(assert (=> d!72329 (= c!10504 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!72329 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!72329 (= (appendBitsLSBFirstLoopTR!0 (_2!9804 lt!337349) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!338271)))

(declare-fun b!214026 () Bool)

(declare-fun res!179892 () Bool)

(assert (=> b!214026 (=> (not res!179892) (not e!145729))))

(assert (=> b!214026 (= res!179892 (= (size!4635 (buf!5167 (_2!9804 lt!337349))) (size!4635 (buf!5167 (_2!9804 lt!338271)))))))

(declare-fun b!214027 () Bool)

(declare-fun lt!338262 () tuple2!18298)

(assert (=> b!214027 (= e!145727 (tuple2!18299 (_1!9804 lt!338262) (_2!9804 lt!338262)))))

(assert (=> b!214027 (= lt!338299 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!214027 (= lt!338313 (appendBit!0 (_2!9804 lt!337349) lt!338299))))

(declare-fun res!179883 () Bool)

(assert (=> b!214027 (= res!179883 (= (size!4635 (buf!5167 (_2!9804 lt!337349))) (size!4635 (buf!5167 (_2!9804 lt!338313)))))))

(assert (=> b!214027 (=> (not res!179883) (not e!145723))))

(assert (=> b!214027 e!145723))

(declare-fun lt!338279 () tuple2!18298)

(assert (=> b!214027 (= lt!338279 lt!338313)))

(assert (=> b!214027 (= lt!338262 (appendBitsLSBFirstLoopTR!0 (_2!9804 lt!338279) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!338286 () Unit!15215)

(assert (=> b!214027 (= lt!338286 (lemmaIsPrefixTransitive!0 (_2!9804 lt!337349) (_2!9804 lt!338279) (_2!9804 lt!338262)))))

(assert (=> b!214027 (isPrefixOf!0 (_2!9804 lt!337349) (_2!9804 lt!338262))))

(declare-fun lt!338263 () Unit!15215)

(assert (=> b!214027 (= lt!338263 lt!338286)))

(assert (=> b!214027 (invariant!0 (currentBit!9734 (_2!9804 lt!337349)) (currentByte!9739 (_2!9804 lt!337349)) (size!4635 (buf!5167 (_2!9804 lt!338279))))))

(declare-fun lt!338274 () BitStream!8378)

(assert (=> b!214027 (= lt!338274 (BitStream!8379 (buf!5167 (_2!9804 lt!338279)) (currentByte!9739 (_2!9804 lt!337349)) (currentBit!9734 (_2!9804 lt!337349))))))

(assert (=> b!214027 (invariant!0 (currentBit!9734 lt!338274) (currentByte!9739 lt!338274) (size!4635 (buf!5167 (_2!9804 lt!338262))))))

(declare-fun lt!338281 () BitStream!8378)

(assert (=> b!214027 (= lt!338281 (BitStream!8379 (buf!5167 (_2!9804 lt!338262)) (currentByte!9739 lt!338274) (currentBit!9734 lt!338274)))))

(declare-fun lt!338301 () tuple2!18296)

(assert (=> b!214027 (= lt!338301 (readBitPure!0 lt!338274))))

(declare-fun lt!338282 () tuple2!18296)

(assert (=> b!214027 (= lt!338282 (readBitPure!0 lt!338281))))

(declare-fun lt!338269 () Unit!15215)

(assert (=> b!214027 (= lt!338269 (readBitPrefixLemma!0 lt!338274 (_2!9804 lt!338262)))))

(declare-fun res!179894 () Bool)

(assert (=> b!214027 (= res!179894 (= (bitIndex!0 (size!4635 (buf!5167 (_1!9803 lt!338301))) (currentByte!9739 (_1!9803 lt!338301)) (currentBit!9734 (_1!9803 lt!338301))) (bitIndex!0 (size!4635 (buf!5167 (_1!9803 lt!338282))) (currentByte!9739 (_1!9803 lt!338282)) (currentBit!9734 (_1!9803 lt!338282)))))))

(declare-fun e!145725 () Bool)

(assert (=> b!214027 (=> (not res!179894) (not e!145725))))

(assert (=> b!214027 e!145725))

(declare-fun lt!338266 () Unit!15215)

(assert (=> b!214027 (= lt!338266 lt!338269)))

(declare-fun lt!338306 () tuple2!18294)

(assert (=> b!214027 (= lt!338306 (reader!0 (_2!9804 lt!337349) (_2!9804 lt!338262)))))

(declare-fun lt!338314 () tuple2!18294)

(assert (=> b!214027 (= lt!338314 (reader!0 (_2!9804 lt!338279) (_2!9804 lt!338262)))))

(declare-fun lt!338308 () tuple2!18296)

(assert (=> b!214027 (= lt!338308 (readBitPure!0 (_1!9802 lt!338306)))))

(assert (=> b!214027 (= (_2!9803 lt!338308) lt!338299)))

(declare-fun lt!338273 () Unit!15215)

(declare-fun Unit!15243 () Unit!15215)

(assert (=> b!214027 (= lt!338273 Unit!15243)))

(declare-fun lt!338275 () (_ BitVec 64))

(assert (=> b!214027 (= lt!338275 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!338261 () (_ BitVec 64))

(assert (=> b!214027 (= lt!338261 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!338267 () Unit!15215)

(assert (=> b!214027 (= lt!338267 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9804 lt!337349) (buf!5167 (_2!9804 lt!338262)) lt!338261))))

(assert (=> b!214027 (validate_offset_bits!1 ((_ sign_extend 32) (size!4635 (buf!5167 (_2!9804 lt!338262)))) ((_ sign_extend 32) (currentByte!9739 (_2!9804 lt!337349))) ((_ sign_extend 32) (currentBit!9734 (_2!9804 lt!337349))) lt!338261)))

(declare-fun lt!338270 () Unit!15215)

(assert (=> b!214027 (= lt!338270 lt!338267)))

(declare-fun lt!338302 () tuple2!18300)

(assert (=> b!214027 (= lt!338302 (readNBitsLSBFirstsLoopPure!0 (_1!9802 lt!338306) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!338275))))

(declare-fun lt!338284 () (_ BitVec 64))

(assert (=> b!214027 (= lt!338284 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!338264 () Unit!15215)

(assert (=> b!214027 (= lt!338264 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9804 lt!338279) (buf!5167 (_2!9804 lt!338262)) lt!338284))))

(assert (=> b!214027 (validate_offset_bits!1 ((_ sign_extend 32) (size!4635 (buf!5167 (_2!9804 lt!338262)))) ((_ sign_extend 32) (currentByte!9739 (_2!9804 lt!338279))) ((_ sign_extend 32) (currentBit!9734 (_2!9804 lt!338279))) lt!338284)))

(declare-fun lt!338296 () Unit!15215)

(assert (=> b!214027 (= lt!338296 lt!338264)))

(declare-fun lt!338307 () tuple2!18300)

(assert (=> b!214027 (= lt!338307 (readNBitsLSBFirstsLoopPure!0 (_1!9802 lt!338314) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!338275 (ite (_2!9803 lt!338308) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!338290 () tuple2!18300)

(assert (=> b!214027 (= lt!338290 (readNBitsLSBFirstsLoopPure!0 (_1!9802 lt!338306) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!338275))))

(declare-fun c!10503 () Bool)

(assert (=> b!214027 (= c!10503 (_2!9803 (readBitPure!0 (_1!9802 lt!338306))))))

(declare-fun lt!338268 () tuple2!18300)

(declare-fun e!145730 () (_ BitVec 64))

(assert (=> b!214027 (= lt!338268 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9802 lt!338306) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!338275 e!145730)))))

(declare-fun lt!338283 () Unit!15215)

(assert (=> b!214027 (= lt!338283 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9802 lt!338306) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!338275))))

(assert (=> b!214027 (and (= (_2!9805 lt!338290) (_2!9805 lt!338268)) (= (_1!9805 lt!338290) (_1!9805 lt!338268)))))

(declare-fun lt!338297 () Unit!15215)

(assert (=> b!214027 (= lt!338297 lt!338283)))

(assert (=> b!214027 (= (_1!9802 lt!338306) (withMovedBitIndex!0 (_2!9802 lt!338306) (bvsub (bitIndex!0 (size!4635 (buf!5167 (_2!9804 lt!337349))) (currentByte!9739 (_2!9804 lt!337349)) (currentBit!9734 (_2!9804 lt!337349))) (bitIndex!0 (size!4635 (buf!5167 (_2!9804 lt!338262))) (currentByte!9739 (_2!9804 lt!338262)) (currentBit!9734 (_2!9804 lt!338262))))))))

(declare-fun lt!338310 () Unit!15215)

(declare-fun Unit!15244 () Unit!15215)

(assert (=> b!214027 (= lt!338310 Unit!15244)))

(assert (=> b!214027 (= (_1!9802 lt!338314) (withMovedBitIndex!0 (_2!9802 lt!338314) (bvsub (bitIndex!0 (size!4635 (buf!5167 (_2!9804 lt!338279))) (currentByte!9739 (_2!9804 lt!338279)) (currentBit!9734 (_2!9804 lt!338279))) (bitIndex!0 (size!4635 (buf!5167 (_2!9804 lt!338262))) (currentByte!9739 (_2!9804 lt!338262)) (currentBit!9734 (_2!9804 lt!338262))))))))

(declare-fun lt!338289 () Unit!15215)

(declare-fun Unit!15245 () Unit!15215)

(assert (=> b!214027 (= lt!338289 Unit!15245)))

(assert (=> b!214027 (= (bitIndex!0 (size!4635 (buf!5167 (_2!9804 lt!337349))) (currentByte!9739 (_2!9804 lt!337349)) (currentBit!9734 (_2!9804 lt!337349))) (bvsub (bitIndex!0 (size!4635 (buf!5167 (_2!9804 lt!338279))) (currentByte!9739 (_2!9804 lt!338279)) (currentBit!9734 (_2!9804 lt!338279))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!338280 () Unit!15215)

(declare-fun Unit!15246 () Unit!15215)

(assert (=> b!214027 (= lt!338280 Unit!15246)))

(assert (=> b!214027 (= (_2!9805 lt!338302) (_2!9805 lt!338307))))

(declare-fun lt!338288 () Unit!15215)

(declare-fun Unit!15247 () Unit!15215)

(assert (=> b!214027 (= lt!338288 Unit!15247)))

(assert (=> b!214027 (invariant!0 (currentBit!9734 (_2!9804 lt!338262)) (currentByte!9739 (_2!9804 lt!338262)) (size!4635 (buf!5167 (_2!9804 lt!338262))))))

(declare-fun lt!338272 () Unit!15215)

(declare-fun Unit!15248 () Unit!15215)

(assert (=> b!214027 (= lt!338272 Unit!15248)))

(assert (=> b!214027 (= (size!4635 (buf!5167 (_2!9804 lt!337349))) (size!4635 (buf!5167 (_2!9804 lt!338262))))))

(declare-fun lt!338276 () Unit!15215)

(declare-fun Unit!15249 () Unit!15215)

(assert (=> b!214027 (= lt!338276 Unit!15249)))

(assert (=> b!214027 (= (bitIndex!0 (size!4635 (buf!5167 (_2!9804 lt!338262))) (currentByte!9739 (_2!9804 lt!338262)) (currentBit!9734 (_2!9804 lt!338262))) (bvsub (bvadd (bitIndex!0 (size!4635 (buf!5167 (_2!9804 lt!337349))) (currentByte!9739 (_2!9804 lt!337349)) (currentBit!9734 (_2!9804 lt!337349))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!338265 () Unit!15215)

(declare-fun Unit!15250 () Unit!15215)

(assert (=> b!214027 (= lt!338265 Unit!15250)))

(declare-fun lt!338311 () Unit!15215)

(declare-fun Unit!15251 () Unit!15215)

(assert (=> b!214027 (= lt!338311 Unit!15251)))

(declare-fun lt!338315 () tuple2!18294)

(assert (=> b!214027 (= lt!338315 (reader!0 (_2!9804 lt!337349) (_2!9804 lt!338262)))))

(declare-fun lt!338303 () (_ BitVec 64))

(assert (=> b!214027 (= lt!338303 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!338305 () Unit!15215)

(assert (=> b!214027 (= lt!338305 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9804 lt!337349) (buf!5167 (_2!9804 lt!338262)) lt!338303))))

(assert (=> b!214027 (validate_offset_bits!1 ((_ sign_extend 32) (size!4635 (buf!5167 (_2!9804 lt!338262)))) ((_ sign_extend 32) (currentByte!9739 (_2!9804 lt!337349))) ((_ sign_extend 32) (currentBit!9734 (_2!9804 lt!337349))) lt!338303)))

(declare-fun lt!338309 () Unit!15215)

(assert (=> b!214027 (= lt!338309 lt!338305)))

(declare-fun lt!338294 () tuple2!18300)

(assert (=> b!214027 (= lt!338294 (readNBitsLSBFirstsLoopPure!0 (_1!9802 lt!338315) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!179893 () Bool)

(assert (=> b!214027 (= res!179893 (= (_2!9805 lt!338294) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!145728 () Bool)

(assert (=> b!214027 (=> (not res!179893) (not e!145728))))

(assert (=> b!214027 e!145728))

(declare-fun lt!338312 () Unit!15215)

(declare-fun Unit!15252 () Unit!15215)

(assert (=> b!214027 (= lt!338312 Unit!15252)))

(declare-fun b!214028 () Bool)

(assert (=> b!214028 (= e!145726 (= (bitIndex!0 (size!4635 (buf!5167 (_1!9803 lt!338316))) (currentByte!9739 (_1!9803 lt!338316)) (currentBit!9734 (_1!9803 lt!338316))) (bitIndex!0 (size!4635 (buf!5167 (_2!9804 lt!338313))) (currentByte!9739 (_2!9804 lt!338313)) (currentBit!9734 (_2!9804 lt!338313)))))))

(declare-fun b!214029 () Bool)

(assert (=> b!214029 (= e!145725 (= (_2!9803 lt!338301) (_2!9803 lt!338282)))))

(declare-fun b!214030 () Bool)

(assert (=> b!214030 (= e!145730 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!214031 () Bool)

(assert (=> b!214031 (= e!145728 (= (_1!9805 lt!338294) (_2!9802 lt!338315)))))

(declare-fun bm!3357 () Bool)

(assert (=> bm!3357 (= call!3360 (isPrefixOf!0 (_2!9804 lt!337349) (ite c!10504 (_2!9804 lt!337349) (_2!9804 lt!338313))))))

(declare-fun b!214032 () Bool)

(assert (=> b!214032 (= e!145730 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!214033 () Bool)

(declare-fun res!179889 () Bool)

(assert (=> b!214033 (=> (not res!179889) (not e!145729))))

(declare-fun lt!338277 () (_ BitVec 64))

(declare-fun lt!338293 () (_ BitVec 64))

(assert (=> b!214033 (= res!179889 (= (bitIndex!0 (size!4635 (buf!5167 (_2!9804 lt!338271))) (currentByte!9739 (_2!9804 lt!338271)) (currentBit!9734 (_2!9804 lt!338271))) (bvsub lt!338293 lt!338277)))))

(assert (=> b!214033 (or (= (bvand lt!338293 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!338277 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!338293 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!338293 lt!338277) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!214033 (= lt!338277 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!338300 () (_ BitVec 64))

(declare-fun lt!338292 () (_ BitVec 64))

(assert (=> b!214033 (= lt!338293 (bvadd lt!338300 lt!338292))))

(assert (=> b!214033 (or (not (= (bvand lt!338300 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!338292 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!338300 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!338300 lt!338292) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!214033 (= lt!338292 ((_ sign_extend 32) nBits!348))))

(assert (=> b!214033 (= lt!338300 (bitIndex!0 (size!4635 (buf!5167 (_2!9804 lt!337349))) (currentByte!9739 (_2!9804 lt!337349)) (currentBit!9734 (_2!9804 lt!337349))))))

(declare-fun b!214034 () Bool)

(declare-fun res!179888 () Bool)

(assert (=> b!214034 (= res!179888 (= (bitIndex!0 (size!4635 (buf!5167 (_2!9804 lt!338313))) (currentByte!9739 (_2!9804 lt!338313)) (currentBit!9734 (_2!9804 lt!338313))) (bvadd (bitIndex!0 (size!4635 (buf!5167 (_2!9804 lt!337349))) (currentByte!9739 (_2!9804 lt!337349)) (currentBit!9734 (_2!9804 lt!337349))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!214034 (=> (not res!179888) (not e!145723))))

(declare-fun b!214035 () Bool)

(declare-fun Unit!15253 () Unit!15215)

(assert (=> b!214035 (= e!145727 (tuple2!18299 Unit!15253 (_2!9804 lt!337349)))))

(declare-fun lt!338287 () Unit!15215)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8378) Unit!15215)

(assert (=> b!214035 (= lt!338287 (lemmaIsPrefixRefl!0 (_2!9804 lt!337349)))))

(assert (=> b!214035 call!3360))

(declare-fun lt!338304 () Unit!15215)

(assert (=> b!214035 (= lt!338304 lt!338287)))

(declare-fun b!214036 () Bool)

(assert (=> b!214036 (= e!145731 (= (_1!9805 lt!338285) (_2!9802 lt!338295)))))

(assert (= (and d!72329 c!10504) b!214035))

(assert (= (and d!72329 (not c!10504)) b!214027))

(assert (= (and b!214027 res!179883) b!214034))

(assert (= (and b!214034 res!179888) b!214022))

(assert (= (and b!214022 res!179885) b!214021))

(assert (= (and b!214021 res!179887) b!214028))

(assert (= (and b!214027 res!179894) b!214029))

(assert (= (and b!214027 c!10503) b!214032))

(assert (= (and b!214027 (not c!10503)) b!214030))

(assert (= (and b!214027 res!179893) b!214031))

(assert (= (or b!214035 b!214022) bm!3357))

(assert (= (and d!72329 res!179890) b!214026))

(assert (= (and b!214026 res!179892) b!214033))

(assert (= (and b!214033 res!179889) b!214023))

(assert (= (and b!214023 res!179886) b!214025))

(assert (= (and b!214025 res!179884) b!214024))

(assert (= (and b!214025 res!179891) b!214036))

(declare-fun m!329893 () Bool)

(assert (=> d!72329 m!329893))

(declare-fun m!329895 () Bool)

(assert (=> b!214035 m!329895))

(declare-fun m!329897 () Bool)

(assert (=> b!214025 m!329897))

(declare-fun m!329899 () Bool)

(assert (=> b!214025 m!329899))

(declare-fun m!329901 () Bool)

(assert (=> b!214025 m!329901))

(declare-fun m!329903 () Bool)

(assert (=> b!214025 m!329903))

(declare-fun m!329905 () Bool)

(assert (=> b!214025 m!329905))

(declare-fun m!329907 () Bool)

(assert (=> b!214025 m!329907))

(declare-fun m!329909 () Bool)

(assert (=> b!214023 m!329909))

(declare-fun m!329911 () Bool)

(assert (=> b!214024 m!329911))

(declare-fun m!329913 () Bool)

(assert (=> b!214034 m!329913))

(assert (=> b!214034 m!329329))

(declare-fun m!329915 () Bool)

(assert (=> b!214028 m!329915))

(assert (=> b!214028 m!329913))

(declare-fun m!329917 () Bool)

(assert (=> b!214021 m!329917))

(assert (=> b!214021 m!329917))

(declare-fun m!329919 () Bool)

(assert (=> b!214021 m!329919))

(declare-fun m!329921 () Bool)

(assert (=> b!214027 m!329921))

(declare-fun m!329923 () Bool)

(assert (=> b!214027 m!329923))

(declare-fun m!329925 () Bool)

(assert (=> b!214027 m!329925))

(declare-fun m!329927 () Bool)

(assert (=> b!214027 m!329927))

(declare-fun m!329929 () Bool)

(assert (=> b!214027 m!329929))

(declare-fun m!329931 () Bool)

(assert (=> b!214027 m!329931))

(declare-fun m!329933 () Bool)

(assert (=> b!214027 m!329933))

(declare-fun m!329935 () Bool)

(assert (=> b!214027 m!329935))

(declare-fun m!329937 () Bool)

(assert (=> b!214027 m!329937))

(declare-fun m!329939 () Bool)

(assert (=> b!214027 m!329939))

(declare-fun m!329941 () Bool)

(assert (=> b!214027 m!329941))

(declare-fun m!329943 () Bool)

(assert (=> b!214027 m!329943))

(declare-fun m!329945 () Bool)

(assert (=> b!214027 m!329945))

(declare-fun m!329947 () Bool)

(assert (=> b!214027 m!329947))

(assert (=> b!214027 m!329329))

(declare-fun m!329949 () Bool)

(assert (=> b!214027 m!329949))

(declare-fun m!329951 () Bool)

(assert (=> b!214027 m!329951))

(declare-fun m!329953 () Bool)

(assert (=> b!214027 m!329953))

(declare-fun m!329955 () Bool)

(assert (=> b!214027 m!329955))

(assert (=> b!214027 m!329903))

(declare-fun m!329957 () Bool)

(assert (=> b!214027 m!329957))

(declare-fun m!329959 () Bool)

(assert (=> b!214027 m!329959))

(declare-fun m!329961 () Bool)

(assert (=> b!214027 m!329961))

(declare-fun m!329963 () Bool)

(assert (=> b!214027 m!329963))

(assert (=> b!214027 m!329905))

(declare-fun m!329965 () Bool)

(assert (=> b!214027 m!329965))

(declare-fun m!329967 () Bool)

(assert (=> b!214027 m!329967))

(declare-fun m!329969 () Bool)

(assert (=> b!214027 m!329969))

(declare-fun m!329971 () Bool)

(assert (=> b!214027 m!329971))

(declare-fun m!329973 () Bool)

(assert (=> b!214027 m!329973))

(declare-fun m!329975 () Bool)

(assert (=> b!214027 m!329975))

(assert (=> b!214027 m!329969))

(declare-fun m!329977 () Bool)

(assert (=> b!214027 m!329977))

(declare-fun m!329979 () Bool)

(assert (=> b!214027 m!329979))

(declare-fun m!329981 () Bool)

(assert (=> b!214027 m!329981))

(declare-fun m!329983 () Bool)

(assert (=> b!214033 m!329983))

(assert (=> b!214033 m!329329))

(declare-fun m!329985 () Bool)

(assert (=> bm!3357 m!329985))

(assert (=> b!213710 d!72329))

(declare-fun d!72385 () Bool)

(declare-fun res!179895 () Bool)

(declare-fun e!145733 () Bool)

(assert (=> d!72385 (=> (not res!179895) (not e!145733))))

(assert (=> d!72385 (= res!179895 (= (size!4635 (buf!5167 thiss!1204)) (size!4635 (buf!5167 (_2!9804 lt!337349)))))))

(assert (=> d!72385 (= (isPrefixOf!0 thiss!1204 (_2!9804 lt!337349)) e!145733)))

(declare-fun b!214037 () Bool)

(declare-fun res!179896 () Bool)

(assert (=> b!214037 (=> (not res!179896) (not e!145733))))

(assert (=> b!214037 (= res!179896 (bvsle (bitIndex!0 (size!4635 (buf!5167 thiss!1204)) (currentByte!9739 thiss!1204) (currentBit!9734 thiss!1204)) (bitIndex!0 (size!4635 (buf!5167 (_2!9804 lt!337349))) (currentByte!9739 (_2!9804 lt!337349)) (currentBit!9734 (_2!9804 lt!337349)))))))

(declare-fun b!214038 () Bool)

(declare-fun e!145732 () Bool)

(assert (=> b!214038 (= e!145733 e!145732)))

(declare-fun res!179897 () Bool)

(assert (=> b!214038 (=> res!179897 e!145732)))

(assert (=> b!214038 (= res!179897 (= (size!4635 (buf!5167 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!214039 () Bool)

(assert (=> b!214039 (= e!145732 (arrayBitRangesEq!0 (buf!5167 thiss!1204) (buf!5167 (_2!9804 lt!337349)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4635 (buf!5167 thiss!1204)) (currentByte!9739 thiss!1204) (currentBit!9734 thiss!1204))))))

(assert (= (and d!72385 res!179895) b!214037))

(assert (= (and b!214037 res!179896) b!214038))

(assert (= (and b!214038 (not res!179897)) b!214039))

(assert (=> b!214037 m!329331))

(assert (=> b!214037 m!329329))

(assert (=> b!214039 m!329331))

(assert (=> b!214039 m!329331))

(declare-fun m!329987 () Bool)

(assert (=> b!214039 m!329987))

(assert (=> b!213720 d!72385))

(declare-fun d!72387 () Bool)

(assert (=> d!72387 (= (invariant!0 (currentBit!9734 thiss!1204) (currentByte!9739 thiss!1204) (size!4635 (buf!5167 (_2!9804 lt!337367)))) (and (bvsge (currentBit!9734 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9734 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9739 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9739 thiss!1204) (size!4635 (buf!5167 (_2!9804 lt!337367)))) (and (= (currentBit!9734 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9739 thiss!1204) (size!4635 (buf!5167 (_2!9804 lt!337367))))))))))

(assert (=> b!213717 d!72387))

(declare-fun d!72389 () Bool)

(assert (=> d!72389 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4635 (buf!5167 thiss!1204))) ((_ sign_extend 32) (currentByte!9739 thiss!1204)) ((_ sign_extend 32) (currentBit!9734 thiss!1204)) lt!337341) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4635 (buf!5167 thiss!1204))) ((_ sign_extend 32) (currentByte!9739 thiss!1204)) ((_ sign_extend 32) (currentBit!9734 thiss!1204))) lt!337341))))

(declare-fun bs!17748 () Bool)

(assert (= bs!17748 d!72389))

(assert (=> bs!17748 m!329527))

(assert (=> b!213706 d!72389))

(declare-fun d!72391 () Bool)

(assert (=> d!72391 (= (array_inv!4376 (buf!5167 thiss!1204)) (bvsge (size!4635 (buf!5167 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!213697 d!72391))

(assert (=> b!213718 d!72385))

(declare-fun d!72393 () Bool)

(declare-datatypes ((tuple2!18310 0))(
  ( (tuple2!18311 (_1!9810 Bool) (_2!9810 BitStream!8378)) )
))
(declare-fun lt!338331 () tuple2!18310)

(declare-fun readBit!0 (BitStream!8378) tuple2!18310)

(assert (=> d!72393 (= lt!338331 (readBit!0 (readerFrom!0 (_2!9804 lt!337349) (currentBit!9734 thiss!1204) (currentByte!9739 thiss!1204))))))

(assert (=> d!72393 (= (readBitPure!0 (readerFrom!0 (_2!9804 lt!337349) (currentBit!9734 thiss!1204) (currentByte!9739 thiss!1204))) (tuple2!18297 (_2!9810 lt!338331) (_1!9810 lt!338331)))))

(declare-fun bs!17749 () Bool)

(assert (= bs!17749 d!72393))

(assert (=> bs!17749 m!329303))

(declare-fun m!330003 () Bool)

(assert (=> bs!17749 m!330003))

(assert (=> b!213707 d!72393))

(declare-fun d!72397 () Bool)

(declare-fun e!145747 () Bool)

(assert (=> d!72397 e!145747))

(declare-fun res!179921 () Bool)

(assert (=> d!72397 (=> (not res!179921) (not e!145747))))

(assert (=> d!72397 (= res!179921 (invariant!0 (currentBit!9734 (_2!9804 lt!337349)) (currentByte!9739 (_2!9804 lt!337349)) (size!4635 (buf!5167 (_2!9804 lt!337349)))))))

(assert (=> d!72397 (= (readerFrom!0 (_2!9804 lt!337349) (currentBit!9734 thiss!1204) (currentByte!9739 thiss!1204)) (BitStream!8379 (buf!5167 (_2!9804 lt!337349)) (currentByte!9739 thiss!1204) (currentBit!9734 thiss!1204)))))

(declare-fun b!214063 () Bool)

(assert (=> b!214063 (= e!145747 (invariant!0 (currentBit!9734 thiss!1204) (currentByte!9739 thiss!1204) (size!4635 (buf!5167 (_2!9804 lt!337349)))))))

(assert (= (and d!72397 res!179921) b!214063))

(assert (=> d!72397 m!329525))

(assert (=> b!214063 m!329369))

(assert (=> b!213707 d!72397))

(declare-fun d!72407 () Bool)

(declare-fun e!145748 () Bool)

(assert (=> d!72407 e!145748))

(declare-fun res!179922 () Bool)

(assert (=> d!72407 (=> (not res!179922) (not e!145748))))

(declare-fun lt!338347 () (_ BitVec 64))

(declare-fun lt!338346 () BitStream!8378)

(assert (=> d!72407 (= res!179922 (= (bvadd lt!338347 (bvsub lt!337339 lt!337346)) (bitIndex!0 (size!4635 (buf!5167 lt!338346)) (currentByte!9739 lt!338346) (currentBit!9734 lt!338346))))))

(assert (=> d!72407 (or (not (= (bvand lt!338347 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!337339 lt!337346) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!338347 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!338347 (bvsub lt!337339 lt!337346)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72407 (= lt!338347 (bitIndex!0 (size!4635 (buf!5167 (_2!9802 lt!337366))) (currentByte!9739 (_2!9802 lt!337366)) (currentBit!9734 (_2!9802 lt!337366))))))

(assert (=> d!72407 (= lt!338346 (_2!9804 (moveBitIndex!0 (_2!9802 lt!337366) (bvsub lt!337339 lt!337346))))))

(assert (=> d!72407 (moveBitIndexPrecond!0 (_2!9802 lt!337366) (bvsub lt!337339 lt!337346))))

(assert (=> d!72407 (= (withMovedBitIndex!0 (_2!9802 lt!337366) (bvsub lt!337339 lt!337346)) lt!338346)))

(declare-fun b!214064 () Bool)

(assert (=> b!214064 (= e!145748 (= (size!4635 (buf!5167 (_2!9802 lt!337366))) (size!4635 (buf!5167 lt!338346))))))

(assert (= (and d!72407 res!179922) b!214064))

(declare-fun m!330023 () Bool)

(assert (=> d!72407 m!330023))

(assert (=> d!72407 m!329377))

(declare-fun m!330025 () Bool)

(assert (=> d!72407 m!330025))

(declare-fun m!330027 () Bool)

(assert (=> d!72407 m!330027))

(assert (=> b!213714 d!72407))

(assert (=> b!213705 d!72285))

(assert (=> b!213705 d!72287))

(declare-fun d!72409 () Bool)

(assert (=> d!72409 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9734 thiss!1204) (currentByte!9739 thiss!1204) (size!4635 (buf!5167 thiss!1204))))))

(declare-fun bs!17750 () Bool)

(assert (= bs!17750 d!72409))

(assert (=> bs!17750 m!329317))

(assert (=> start!44686 d!72409))

(declare-fun b!214075 () Bool)

(declare-fun e!145753 () Unit!15215)

(declare-fun lt!338392 () Unit!15215)

(assert (=> b!214075 (= e!145753 lt!338392)))

(declare-fun lt!338400 () (_ BitVec 64))

(assert (=> b!214075 (= lt!338400 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!338402 () (_ BitVec 64))

(assert (=> b!214075 (= lt!338402 (bitIndex!0 (size!4635 (buf!5167 thiss!1204)) (currentByte!9739 thiss!1204) (currentBit!9734 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!10554 array!10554 (_ BitVec 64) (_ BitVec 64)) Unit!15215)

(assert (=> b!214075 (= lt!338392 (arrayBitRangesEqSymmetric!0 (buf!5167 thiss!1204) (buf!5167 (_2!9804 lt!337367)) lt!338400 lt!338402))))

(assert (=> b!214075 (arrayBitRangesEq!0 (buf!5167 (_2!9804 lt!337367)) (buf!5167 thiss!1204) lt!338400 lt!338402)))

(declare-fun b!214076 () Bool)

(declare-fun res!179929 () Bool)

(declare-fun e!145754 () Bool)

(assert (=> b!214076 (=> (not res!179929) (not e!145754))))

(declare-fun lt!338388 () tuple2!18294)

(assert (=> b!214076 (= res!179929 (isPrefixOf!0 (_1!9802 lt!338388) thiss!1204))))

(declare-fun d!72411 () Bool)

(assert (=> d!72411 e!145754))

(declare-fun res!179930 () Bool)

(assert (=> d!72411 (=> (not res!179930) (not e!145754))))

(assert (=> d!72411 (= res!179930 (isPrefixOf!0 (_1!9802 lt!338388) (_2!9802 lt!338388)))))

(declare-fun lt!338395 () BitStream!8378)

(assert (=> d!72411 (= lt!338388 (tuple2!18295 lt!338395 (_2!9804 lt!337367)))))

(declare-fun lt!338398 () Unit!15215)

(declare-fun lt!338404 () Unit!15215)

(assert (=> d!72411 (= lt!338398 lt!338404)))

(assert (=> d!72411 (isPrefixOf!0 lt!338395 (_2!9804 lt!337367))))

(assert (=> d!72411 (= lt!338404 (lemmaIsPrefixTransitive!0 lt!338395 (_2!9804 lt!337367) (_2!9804 lt!337367)))))

(declare-fun lt!338393 () Unit!15215)

(declare-fun lt!338399 () Unit!15215)

(assert (=> d!72411 (= lt!338393 lt!338399)))

(assert (=> d!72411 (isPrefixOf!0 lt!338395 (_2!9804 lt!337367))))

(assert (=> d!72411 (= lt!338399 (lemmaIsPrefixTransitive!0 lt!338395 thiss!1204 (_2!9804 lt!337367)))))

(declare-fun lt!338391 () Unit!15215)

(assert (=> d!72411 (= lt!338391 e!145753)))

(declare-fun c!10507 () Bool)

(assert (=> d!72411 (= c!10507 (not (= (size!4635 (buf!5167 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!338405 () Unit!15215)

(declare-fun lt!338406 () Unit!15215)

(assert (=> d!72411 (= lt!338405 lt!338406)))

(assert (=> d!72411 (isPrefixOf!0 (_2!9804 lt!337367) (_2!9804 lt!337367))))

(assert (=> d!72411 (= lt!338406 (lemmaIsPrefixRefl!0 (_2!9804 lt!337367)))))

(declare-fun lt!338397 () Unit!15215)

(declare-fun lt!338403 () Unit!15215)

(assert (=> d!72411 (= lt!338397 lt!338403)))

(assert (=> d!72411 (= lt!338403 (lemmaIsPrefixRefl!0 (_2!9804 lt!337367)))))

(declare-fun lt!338407 () Unit!15215)

(declare-fun lt!338401 () Unit!15215)

(assert (=> d!72411 (= lt!338407 lt!338401)))

(assert (=> d!72411 (isPrefixOf!0 lt!338395 lt!338395)))

(assert (=> d!72411 (= lt!338401 (lemmaIsPrefixRefl!0 lt!338395))))

(declare-fun lt!338394 () Unit!15215)

(declare-fun lt!338390 () Unit!15215)

(assert (=> d!72411 (= lt!338394 lt!338390)))

(assert (=> d!72411 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!72411 (= lt!338390 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!72411 (= lt!338395 (BitStream!8379 (buf!5167 (_2!9804 lt!337367)) (currentByte!9739 thiss!1204) (currentBit!9734 thiss!1204)))))

(assert (=> d!72411 (isPrefixOf!0 thiss!1204 (_2!9804 lt!337367))))

(assert (=> d!72411 (= (reader!0 thiss!1204 (_2!9804 lt!337367)) lt!338388)))

(declare-fun lt!338396 () (_ BitVec 64))

(declare-fun lt!338389 () (_ BitVec 64))

(declare-fun b!214077 () Bool)

(assert (=> b!214077 (= e!145754 (= (_1!9802 lt!338388) (withMovedBitIndex!0 (_2!9802 lt!338388) (bvsub lt!338389 lt!338396))))))

(assert (=> b!214077 (or (= (bvand lt!338389 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!338396 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!338389 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!338389 lt!338396) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!214077 (= lt!338396 (bitIndex!0 (size!4635 (buf!5167 (_2!9804 lt!337367))) (currentByte!9739 (_2!9804 lt!337367)) (currentBit!9734 (_2!9804 lt!337367))))))

(assert (=> b!214077 (= lt!338389 (bitIndex!0 (size!4635 (buf!5167 thiss!1204)) (currentByte!9739 thiss!1204) (currentBit!9734 thiss!1204)))))

(declare-fun b!214078 () Bool)

(declare-fun Unit!15254 () Unit!15215)

(assert (=> b!214078 (= e!145753 Unit!15254)))

(declare-fun b!214079 () Bool)

(declare-fun res!179931 () Bool)

(assert (=> b!214079 (=> (not res!179931) (not e!145754))))

(assert (=> b!214079 (= res!179931 (isPrefixOf!0 (_2!9802 lt!338388) (_2!9804 lt!337367)))))

(assert (= (and d!72411 c!10507) b!214075))

(assert (= (and d!72411 (not c!10507)) b!214078))

(assert (= (and d!72411 res!179930) b!214076))

(assert (= (and b!214076 res!179929) b!214079))

(assert (= (and b!214079 res!179931) b!214077))

(declare-fun m!330029 () Bool)

(assert (=> d!72411 m!330029))

(declare-fun m!330031 () Bool)

(assert (=> d!72411 m!330031))

(declare-fun m!330033 () Bool)

(assert (=> d!72411 m!330033))

(declare-fun m!330035 () Bool)

(assert (=> d!72411 m!330035))

(declare-fun m!330037 () Bool)

(assert (=> d!72411 m!330037))

(declare-fun m!330039 () Bool)

(assert (=> d!72411 m!330039))

(declare-fun m!330041 () Bool)

(assert (=> d!72411 m!330041))

(declare-fun m!330043 () Bool)

(assert (=> d!72411 m!330043))

(assert (=> d!72411 m!329321))

(declare-fun m!330045 () Bool)

(assert (=> d!72411 m!330045))

(declare-fun m!330047 () Bool)

(assert (=> d!72411 m!330047))

(declare-fun m!330049 () Bool)

(assert (=> b!214076 m!330049))

(declare-fun m!330051 () Bool)

(assert (=> b!214079 m!330051))

(declare-fun m!330053 () Bool)

(assert (=> b!214077 m!330053))

(assert (=> b!214077 m!329319))

(assert (=> b!214077 m!329331))

(assert (=> b!214075 m!329331))

(declare-fun m!330055 () Bool)

(assert (=> b!214075 m!330055))

(declare-fun m!330057 () Bool)

(assert (=> b!214075 m!330057))

(assert (=> b!213715 d!72411))

(declare-fun d!72413 () Bool)

(declare-fun e!145755 () Bool)

(assert (=> d!72413 e!145755))

(declare-fun res!179933 () Bool)

(assert (=> d!72413 (=> (not res!179933) (not e!145755))))

(declare-fun lt!338409 () (_ BitVec 64))

(declare-fun lt!338413 () (_ BitVec 64))

(declare-fun lt!338412 () (_ BitVec 64))

(assert (=> d!72413 (= res!179933 (= lt!338413 (bvsub lt!338409 lt!338412)))))

(assert (=> d!72413 (or (= (bvand lt!338409 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!338412 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!338409 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!338409 lt!338412) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72413 (= lt!338412 (remainingBits!0 ((_ sign_extend 32) (size!4635 (buf!5167 (_1!9803 lt!337364)))) ((_ sign_extend 32) (currentByte!9739 (_1!9803 lt!337364))) ((_ sign_extend 32) (currentBit!9734 (_1!9803 lt!337364)))))))

(declare-fun lt!338411 () (_ BitVec 64))

(declare-fun lt!338410 () (_ BitVec 64))

(assert (=> d!72413 (= lt!338409 (bvmul lt!338411 lt!338410))))

(assert (=> d!72413 (or (= lt!338411 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!338410 (bvsdiv (bvmul lt!338411 lt!338410) lt!338411)))))

(assert (=> d!72413 (= lt!338410 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72413 (= lt!338411 ((_ sign_extend 32) (size!4635 (buf!5167 (_1!9803 lt!337364)))))))

(assert (=> d!72413 (= lt!338413 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9739 (_1!9803 lt!337364))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9734 (_1!9803 lt!337364)))))))

(assert (=> d!72413 (invariant!0 (currentBit!9734 (_1!9803 lt!337364)) (currentByte!9739 (_1!9803 lt!337364)) (size!4635 (buf!5167 (_1!9803 lt!337364))))))

(assert (=> d!72413 (= (bitIndex!0 (size!4635 (buf!5167 (_1!9803 lt!337364))) (currentByte!9739 (_1!9803 lt!337364)) (currentBit!9734 (_1!9803 lt!337364))) lt!338413)))

(declare-fun b!214080 () Bool)

(declare-fun res!179932 () Bool)

(assert (=> b!214080 (=> (not res!179932) (not e!145755))))

(assert (=> b!214080 (= res!179932 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!338413))))

(declare-fun b!214081 () Bool)

(declare-fun lt!338408 () (_ BitVec 64))

(assert (=> b!214081 (= e!145755 (bvsle lt!338413 (bvmul lt!338408 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!214081 (or (= lt!338408 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!338408 #b0000000000000000000000000000000000000000000000000000000000001000) lt!338408)))))

(assert (=> b!214081 (= lt!338408 ((_ sign_extend 32) (size!4635 (buf!5167 (_1!9803 lt!337364)))))))

(assert (= (and d!72413 res!179933) b!214080))

(assert (= (and b!214080 res!179932) b!214081))

(declare-fun m!330059 () Bool)

(assert (=> d!72413 m!330059))

(declare-fun m!330061 () Bool)

(assert (=> d!72413 m!330061))

(assert (=> b!213715 d!72413))

(declare-fun d!72415 () Bool)

(assert (=> d!72415 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!213715 d!72415))

(declare-fun d!72417 () Bool)

(assert (=> d!72417 (validate_offset_bits!1 ((_ sign_extend 32) (size!4635 (buf!5167 (_2!9804 lt!337367)))) ((_ sign_extend 32) (currentByte!9739 thiss!1204)) ((_ sign_extend 32) (currentBit!9734 thiss!1204)) lt!337341)))

(declare-fun lt!338416 () Unit!15215)

(declare-fun choose!9 (BitStream!8378 array!10554 (_ BitVec 64) BitStream!8378) Unit!15215)

(assert (=> d!72417 (= lt!338416 (choose!9 thiss!1204 (buf!5167 (_2!9804 lt!337367)) lt!337341 (BitStream!8379 (buf!5167 (_2!9804 lt!337367)) (currentByte!9739 thiss!1204) (currentBit!9734 thiss!1204))))))

(assert (=> d!72417 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5167 (_2!9804 lt!337367)) lt!337341) lt!338416)))

(declare-fun bs!17751 () Bool)

(assert (= bs!17751 d!72417))

(assert (=> bs!17751 m!329345))

(declare-fun m!330063 () Bool)

(assert (=> bs!17751 m!330063))

(assert (=> b!213715 d!72417))

(declare-fun b!214082 () Bool)

(declare-fun e!145756 () Unit!15215)

(declare-fun lt!338421 () Unit!15215)

(assert (=> b!214082 (= e!145756 lt!338421)))

(declare-fun lt!338429 () (_ BitVec 64))

(assert (=> b!214082 (= lt!338429 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!338431 () (_ BitVec 64))

(assert (=> b!214082 (= lt!338431 (bitIndex!0 (size!4635 (buf!5167 (_2!9804 lt!337349))) (currentByte!9739 (_2!9804 lt!337349)) (currentBit!9734 (_2!9804 lt!337349))))))

(assert (=> b!214082 (= lt!338421 (arrayBitRangesEqSymmetric!0 (buf!5167 (_2!9804 lt!337349)) (buf!5167 (_2!9804 lt!337367)) lt!338429 lt!338431))))

(assert (=> b!214082 (arrayBitRangesEq!0 (buf!5167 (_2!9804 lt!337367)) (buf!5167 (_2!9804 lt!337349)) lt!338429 lt!338431)))

(declare-fun b!214083 () Bool)

(declare-fun res!179934 () Bool)

(declare-fun e!145757 () Bool)

(assert (=> b!214083 (=> (not res!179934) (not e!145757))))

(declare-fun lt!338417 () tuple2!18294)

(assert (=> b!214083 (= res!179934 (isPrefixOf!0 (_1!9802 lt!338417) (_2!9804 lt!337349)))))

(declare-fun d!72419 () Bool)

(assert (=> d!72419 e!145757))

(declare-fun res!179935 () Bool)

(assert (=> d!72419 (=> (not res!179935) (not e!145757))))

(assert (=> d!72419 (= res!179935 (isPrefixOf!0 (_1!9802 lt!338417) (_2!9802 lt!338417)))))

(declare-fun lt!338424 () BitStream!8378)

(assert (=> d!72419 (= lt!338417 (tuple2!18295 lt!338424 (_2!9804 lt!337367)))))

(declare-fun lt!338427 () Unit!15215)

(declare-fun lt!338433 () Unit!15215)

(assert (=> d!72419 (= lt!338427 lt!338433)))

(assert (=> d!72419 (isPrefixOf!0 lt!338424 (_2!9804 lt!337367))))

(assert (=> d!72419 (= lt!338433 (lemmaIsPrefixTransitive!0 lt!338424 (_2!9804 lt!337367) (_2!9804 lt!337367)))))

(declare-fun lt!338422 () Unit!15215)

(declare-fun lt!338428 () Unit!15215)

(assert (=> d!72419 (= lt!338422 lt!338428)))

(assert (=> d!72419 (isPrefixOf!0 lt!338424 (_2!9804 lt!337367))))

(assert (=> d!72419 (= lt!338428 (lemmaIsPrefixTransitive!0 lt!338424 (_2!9804 lt!337349) (_2!9804 lt!337367)))))

(declare-fun lt!338420 () Unit!15215)

(assert (=> d!72419 (= lt!338420 e!145756)))

(declare-fun c!10508 () Bool)

(assert (=> d!72419 (= c!10508 (not (= (size!4635 (buf!5167 (_2!9804 lt!337349))) #b00000000000000000000000000000000)))))

(declare-fun lt!338434 () Unit!15215)

(declare-fun lt!338435 () Unit!15215)

(assert (=> d!72419 (= lt!338434 lt!338435)))

(assert (=> d!72419 (isPrefixOf!0 (_2!9804 lt!337367) (_2!9804 lt!337367))))

(assert (=> d!72419 (= lt!338435 (lemmaIsPrefixRefl!0 (_2!9804 lt!337367)))))

(declare-fun lt!338426 () Unit!15215)

(declare-fun lt!338432 () Unit!15215)

(assert (=> d!72419 (= lt!338426 lt!338432)))

(assert (=> d!72419 (= lt!338432 (lemmaIsPrefixRefl!0 (_2!9804 lt!337367)))))

(declare-fun lt!338436 () Unit!15215)

(declare-fun lt!338430 () Unit!15215)

(assert (=> d!72419 (= lt!338436 lt!338430)))

(assert (=> d!72419 (isPrefixOf!0 lt!338424 lt!338424)))

(assert (=> d!72419 (= lt!338430 (lemmaIsPrefixRefl!0 lt!338424))))

(declare-fun lt!338423 () Unit!15215)

(declare-fun lt!338419 () Unit!15215)

(assert (=> d!72419 (= lt!338423 lt!338419)))

(assert (=> d!72419 (isPrefixOf!0 (_2!9804 lt!337349) (_2!9804 lt!337349))))

(assert (=> d!72419 (= lt!338419 (lemmaIsPrefixRefl!0 (_2!9804 lt!337349)))))

(assert (=> d!72419 (= lt!338424 (BitStream!8379 (buf!5167 (_2!9804 lt!337367)) (currentByte!9739 (_2!9804 lt!337349)) (currentBit!9734 (_2!9804 lt!337349))))))

(assert (=> d!72419 (isPrefixOf!0 (_2!9804 lt!337349) (_2!9804 lt!337367))))

(assert (=> d!72419 (= (reader!0 (_2!9804 lt!337349) (_2!9804 lt!337367)) lt!338417)))

(declare-fun lt!338418 () (_ BitVec 64))

(declare-fun b!214084 () Bool)

(declare-fun lt!338425 () (_ BitVec 64))

(assert (=> b!214084 (= e!145757 (= (_1!9802 lt!338417) (withMovedBitIndex!0 (_2!9802 lt!338417) (bvsub lt!338418 lt!338425))))))

(assert (=> b!214084 (or (= (bvand lt!338418 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!338425 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!338418 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!338418 lt!338425) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!214084 (= lt!338425 (bitIndex!0 (size!4635 (buf!5167 (_2!9804 lt!337367))) (currentByte!9739 (_2!9804 lt!337367)) (currentBit!9734 (_2!9804 lt!337367))))))

(assert (=> b!214084 (= lt!338418 (bitIndex!0 (size!4635 (buf!5167 (_2!9804 lt!337349))) (currentByte!9739 (_2!9804 lt!337349)) (currentBit!9734 (_2!9804 lt!337349))))))

(declare-fun b!214085 () Bool)

(declare-fun Unit!15255 () Unit!15215)

(assert (=> b!214085 (= e!145756 Unit!15255)))

(declare-fun b!214086 () Bool)

(declare-fun res!179936 () Bool)

(assert (=> b!214086 (=> (not res!179936) (not e!145757))))

(assert (=> b!214086 (= res!179936 (isPrefixOf!0 (_2!9802 lt!338417) (_2!9804 lt!337367)))))

(assert (= (and d!72419 c!10508) b!214082))

(assert (= (and d!72419 (not c!10508)) b!214085))

(assert (= (and d!72419 res!179935) b!214083))

(assert (= (and b!214083 res!179934) b!214086))

(assert (= (and b!214086 res!179936) b!214084))

(declare-fun m!330065 () Bool)

(assert (=> d!72419 m!330065))

(declare-fun m!330067 () Bool)

(assert (=> d!72419 m!330067))

(assert (=> d!72419 m!330033))

(declare-fun m!330069 () Bool)

(assert (=> d!72419 m!330069))

(assert (=> d!72419 m!330037))

(declare-fun m!330071 () Bool)

(assert (=> d!72419 m!330071))

(assert (=> d!72419 m!329895))

(declare-fun m!330073 () Bool)

(assert (=> d!72419 m!330073))

(assert (=> d!72419 m!329307))

(declare-fun m!330075 () Bool)

(assert (=> d!72419 m!330075))

(declare-fun m!330077 () Bool)

(assert (=> d!72419 m!330077))

(declare-fun m!330079 () Bool)

(assert (=> b!214083 m!330079))

(declare-fun m!330081 () Bool)

(assert (=> b!214086 m!330081))

(declare-fun m!330083 () Bool)

(assert (=> b!214084 m!330083))

(assert (=> b!214084 m!329319))

(assert (=> b!214084 m!329329))

(assert (=> b!214082 m!329329))

(declare-fun m!330085 () Bool)

(assert (=> b!214082 m!330085))

(declare-fun m!330087 () Bool)

(assert (=> b!214082 m!330087))

(assert (=> b!213715 d!72419))

(declare-fun d!72421 () Bool)

(assert (=> d!72421 (= (invariant!0 (currentBit!9734 thiss!1204) (currentByte!9739 thiss!1204) (size!4635 (buf!5167 (_2!9804 lt!337349)))) (and (bvsge (currentBit!9734 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9734 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9739 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9739 thiss!1204) (size!4635 (buf!5167 (_2!9804 lt!337349)))) (and (= (currentBit!9734 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9739 thiss!1204) (size!4635 (buf!5167 (_2!9804 lt!337349))))))))))

(assert (=> b!213715 d!72421))

(declare-fun d!72423 () Bool)

(declare-fun lt!338437 () tuple2!18310)

(assert (=> d!72423 (= lt!338437 (readBit!0 lt!337345))))

(assert (=> d!72423 (= (readBitPure!0 lt!337345) (tuple2!18297 (_2!9810 lt!338437) (_1!9810 lt!338437)))))

(declare-fun bs!17752 () Bool)

(assert (= bs!17752 d!72423))

(declare-fun m!330089 () Bool)

(assert (=> bs!17752 m!330089))

(assert (=> b!213715 d!72423))

(declare-datatypes ((tuple2!18312 0))(
  ( (tuple2!18313 (_1!9811 (_ BitVec 64)) (_2!9811 BitStream!8378)) )
))
(declare-fun lt!338440 () tuple2!18312)

(declare-fun d!72425 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8378 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18312)

(assert (=> d!72425 (= lt!338440 (readNBitsLSBFirstsLoop!0 (_1!9802 lt!337356) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!337337))))

(assert (=> d!72425 (= (readNBitsLSBFirstsLoopPure!0 (_1!9802 lt!337356) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!337337) (tuple2!18301 (_2!9811 lt!338440) (_1!9811 lt!338440)))))

(declare-fun bs!17753 () Bool)

(assert (= bs!17753 d!72425))

(declare-fun m!330091 () Bool)

(assert (=> bs!17753 m!330091))

(assert (=> b!213715 d!72425))

(declare-fun d!72427 () Bool)

(declare-fun lt!338441 () tuple2!18310)

(assert (=> d!72427 (= lt!338441 (readBit!0 (_1!9802 lt!337366)))))

(assert (=> d!72427 (= (readBitPure!0 (_1!9802 lt!337366)) (tuple2!18297 (_2!9810 lt!338441) (_1!9810 lt!338441)))))

(declare-fun bs!17754 () Bool)

(assert (= bs!17754 d!72427))

(declare-fun m!330093 () Bool)

(assert (=> bs!17754 m!330093))

(assert (=> b!213715 d!72427))

(declare-fun d!72429 () Bool)

(declare-fun lt!338442 () tuple2!18310)

(assert (=> d!72429 (= lt!338442 (readBit!0 (BitStream!8379 (buf!5167 (_2!9804 lt!337367)) (currentByte!9739 thiss!1204) (currentBit!9734 thiss!1204))))))

(assert (=> d!72429 (= (readBitPure!0 (BitStream!8379 (buf!5167 (_2!9804 lt!337367)) (currentByte!9739 thiss!1204) (currentBit!9734 thiss!1204))) (tuple2!18297 (_2!9810 lt!338442) (_1!9810 lt!338442)))))

(declare-fun bs!17755 () Bool)

(assert (= bs!17755 d!72429))

(declare-fun m!330095 () Bool)

(assert (=> bs!17755 m!330095))

(assert (=> b!213715 d!72429))

(declare-fun d!72431 () Bool)

(declare-fun e!145760 () Bool)

(assert (=> d!72431 e!145760))

(declare-fun res!179939 () Bool)

(assert (=> d!72431 (=> (not res!179939) (not e!145760))))

(declare-fun lt!338451 () tuple2!18296)

(declare-fun lt!338454 () tuple2!18296)

(assert (=> d!72431 (= res!179939 (= (bitIndex!0 (size!4635 (buf!5167 (_1!9803 lt!338451))) (currentByte!9739 (_1!9803 lt!338451)) (currentBit!9734 (_1!9803 lt!338451))) (bitIndex!0 (size!4635 (buf!5167 (_1!9803 lt!338454))) (currentByte!9739 (_1!9803 lt!338454)) (currentBit!9734 (_1!9803 lt!338454)))))))

(declare-fun lt!338453 () BitStream!8378)

(declare-fun lt!338452 () Unit!15215)

(declare-fun choose!50 (BitStream!8378 BitStream!8378 BitStream!8378 tuple2!18296 tuple2!18296 BitStream!8378 Bool tuple2!18296 tuple2!18296 BitStream!8378 Bool) Unit!15215)

(assert (=> d!72431 (= lt!338452 (choose!50 lt!337345 (_2!9804 lt!337367) lt!338453 lt!338451 (tuple2!18297 (_1!9803 lt!338451) (_2!9803 lt!338451)) (_1!9803 lt!338451) (_2!9803 lt!338451) lt!338454 (tuple2!18297 (_1!9803 lt!338454) (_2!9803 lt!338454)) (_1!9803 lt!338454) (_2!9803 lt!338454)))))

(assert (=> d!72431 (= lt!338454 (readBitPure!0 lt!338453))))

(assert (=> d!72431 (= lt!338451 (readBitPure!0 lt!337345))))

(assert (=> d!72431 (= lt!338453 (BitStream!8379 (buf!5167 (_2!9804 lt!337367)) (currentByte!9739 lt!337345) (currentBit!9734 lt!337345)))))

(assert (=> d!72431 (invariant!0 (currentBit!9734 lt!337345) (currentByte!9739 lt!337345) (size!4635 (buf!5167 (_2!9804 lt!337367))))))

(assert (=> d!72431 (= (readBitPrefixLemma!0 lt!337345 (_2!9804 lt!337367)) lt!338452)))

(declare-fun b!214089 () Bool)

(assert (=> b!214089 (= e!145760 (= (_2!9803 lt!338451) (_2!9803 lt!338454)))))

(assert (= (and d!72431 res!179939) b!214089))

(assert (=> d!72431 m!329351))

(declare-fun m!330097 () Bool)

(assert (=> d!72431 m!330097))

(declare-fun m!330099 () Bool)

(assert (=> d!72431 m!330099))

(declare-fun m!330101 () Bool)

(assert (=> d!72431 m!330101))

(declare-fun m!330103 () Bool)

(assert (=> d!72431 m!330103))

(declare-fun m!330105 () Bool)

(assert (=> d!72431 m!330105))

(assert (=> b!213715 d!72431))

(declare-fun d!72433 () Bool)

(assert (=> d!72433 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4635 (buf!5167 (_2!9804 lt!337367)))) ((_ sign_extend 32) (currentByte!9739 thiss!1204)) ((_ sign_extend 32) (currentBit!9734 thiss!1204)) lt!337341) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4635 (buf!5167 (_2!9804 lt!337367)))) ((_ sign_extend 32) (currentByte!9739 thiss!1204)) ((_ sign_extend 32) (currentBit!9734 thiss!1204))) lt!337341))))

(declare-fun bs!17756 () Bool)

(assert (= bs!17756 d!72433))

(declare-fun m!330107 () Bool)

(assert (=> bs!17756 m!330107))

(assert (=> b!213715 d!72433))

(declare-fun d!72435 () Bool)

(assert (=> d!72435 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4635 (buf!5167 (_2!9804 lt!337367)))) ((_ sign_extend 32) (currentByte!9739 (_2!9804 lt!337349))) ((_ sign_extend 32) (currentBit!9734 (_2!9804 lt!337349))) lt!337363) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4635 (buf!5167 (_2!9804 lt!337367)))) ((_ sign_extend 32) (currentByte!9739 (_2!9804 lt!337349))) ((_ sign_extend 32) (currentBit!9734 (_2!9804 lt!337349)))) lt!337363))))

(declare-fun bs!17757 () Bool)

(assert (= bs!17757 d!72435))

(declare-fun m!330109 () Bool)

(assert (=> bs!17757 m!330109))

(assert (=> b!213715 d!72435))

(declare-fun d!72437 () Bool)

(assert (=> d!72437 (validate_offset_bits!1 ((_ sign_extend 32) (size!4635 (buf!5167 (_2!9804 lt!337367)))) ((_ sign_extend 32) (currentByte!9739 (_2!9804 lt!337349))) ((_ sign_extend 32) (currentBit!9734 (_2!9804 lt!337349))) lt!337363)))

(declare-fun lt!338455 () Unit!15215)

(assert (=> d!72437 (= lt!338455 (choose!9 (_2!9804 lt!337349) (buf!5167 (_2!9804 lt!337367)) lt!337363 (BitStream!8379 (buf!5167 (_2!9804 lt!337367)) (currentByte!9739 (_2!9804 lt!337349)) (currentBit!9734 (_2!9804 lt!337349)))))))

(assert (=> d!72437 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9804 lt!337349) (buf!5167 (_2!9804 lt!337367)) lt!337363) lt!338455)))

(declare-fun bs!17758 () Bool)

(assert (= bs!17758 d!72437))

(assert (=> bs!17758 m!329371))

(declare-fun m!330111 () Bool)

(assert (=> bs!17758 m!330111))

(assert (=> b!213715 d!72437))

(declare-fun d!72439 () Bool)

(declare-fun lt!338456 () tuple2!18312)

(assert (=> d!72439 (= lt!338456 (readNBitsLSBFirstsLoop!0 (_1!9802 lt!337366) nBits!348 i!590 lt!337360))))

(assert (=> d!72439 (= (readNBitsLSBFirstsLoopPure!0 (_1!9802 lt!337366) nBits!348 i!590 lt!337360) (tuple2!18301 (_2!9811 lt!338456) (_1!9811 lt!338456)))))

(declare-fun bs!17759 () Bool)

(assert (= bs!17759 d!72439))

(declare-fun m!330113 () Bool)

(assert (=> bs!17759 m!330113))

(assert (=> b!213715 d!72439))

(declare-fun d!72441 () Bool)

(declare-fun e!145761 () Bool)

(assert (=> d!72441 e!145761))

(declare-fun res!179941 () Bool)

(assert (=> d!72441 (=> (not res!179941) (not e!145761))))

(declare-fun lt!338458 () (_ BitVec 64))

(declare-fun lt!338462 () (_ BitVec 64))

(declare-fun lt!338461 () (_ BitVec 64))

(assert (=> d!72441 (= res!179941 (= lt!338462 (bvsub lt!338458 lt!338461)))))

(assert (=> d!72441 (or (= (bvand lt!338458 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!338461 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!338458 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!338458 lt!338461) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72441 (= lt!338461 (remainingBits!0 ((_ sign_extend 32) (size!4635 (buf!5167 (_1!9803 lt!337344)))) ((_ sign_extend 32) (currentByte!9739 (_1!9803 lt!337344))) ((_ sign_extend 32) (currentBit!9734 (_1!9803 lt!337344)))))))

(declare-fun lt!338460 () (_ BitVec 64))

(declare-fun lt!338459 () (_ BitVec 64))

(assert (=> d!72441 (= lt!338458 (bvmul lt!338460 lt!338459))))

(assert (=> d!72441 (or (= lt!338460 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!338459 (bvsdiv (bvmul lt!338460 lt!338459) lt!338460)))))

(assert (=> d!72441 (= lt!338459 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72441 (= lt!338460 ((_ sign_extend 32) (size!4635 (buf!5167 (_1!9803 lt!337344)))))))

(assert (=> d!72441 (= lt!338462 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9739 (_1!9803 lt!337344))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9734 (_1!9803 lt!337344)))))))

(assert (=> d!72441 (invariant!0 (currentBit!9734 (_1!9803 lt!337344)) (currentByte!9739 (_1!9803 lt!337344)) (size!4635 (buf!5167 (_1!9803 lt!337344))))))

(assert (=> d!72441 (= (bitIndex!0 (size!4635 (buf!5167 (_1!9803 lt!337344))) (currentByte!9739 (_1!9803 lt!337344)) (currentBit!9734 (_1!9803 lt!337344))) lt!338462)))

(declare-fun b!214090 () Bool)

(declare-fun res!179940 () Bool)

(assert (=> b!214090 (=> (not res!179940) (not e!145761))))

(assert (=> b!214090 (= res!179940 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!338462))))

(declare-fun b!214091 () Bool)

(declare-fun lt!338457 () (_ BitVec 64))

(assert (=> b!214091 (= e!145761 (bvsle lt!338462 (bvmul lt!338457 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!214091 (or (= lt!338457 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!338457 #b0000000000000000000000000000000000000000000000000000000000001000) lt!338457)))))

(assert (=> b!214091 (= lt!338457 ((_ sign_extend 32) (size!4635 (buf!5167 (_1!9803 lt!337344)))))))

(assert (= (and d!72441 res!179941) b!214090))

(assert (= (and b!214090 res!179940) b!214091))

(declare-fun m!330115 () Bool)

(assert (=> d!72441 m!330115))

(declare-fun m!330117 () Bool)

(assert (=> d!72441 m!330117))

(assert (=> b!213715 d!72441))

(declare-fun d!72443 () Bool)

(assert (=> d!72443 (= (invariant!0 (currentBit!9734 (_2!9804 lt!337367)) (currentByte!9739 (_2!9804 lt!337367)) (size!4635 (buf!5167 (_2!9804 lt!337367)))) (and (bvsge (currentBit!9734 (_2!9804 lt!337367)) #b00000000000000000000000000000000) (bvslt (currentBit!9734 (_2!9804 lt!337367)) #b00000000000000000000000000001000) (bvsge (currentByte!9739 (_2!9804 lt!337367)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9739 (_2!9804 lt!337367)) (size!4635 (buf!5167 (_2!9804 lt!337367)))) (and (= (currentBit!9734 (_2!9804 lt!337367)) #b00000000000000000000000000000000) (= (currentByte!9739 (_2!9804 lt!337367)) (size!4635 (buf!5167 (_2!9804 lt!337367))))))))))

(assert (=> b!213704 d!72443))

(declare-fun d!72445 () Bool)

(declare-fun res!179942 () Bool)

(declare-fun e!145763 () Bool)

(assert (=> d!72445 (=> (not res!179942) (not e!145763))))

(assert (=> d!72445 (= res!179942 (= (size!4635 (buf!5167 (_2!9804 lt!337349))) (size!4635 (buf!5167 (_2!9804 lt!337367)))))))

(assert (=> d!72445 (= (isPrefixOf!0 (_2!9804 lt!337349) (_2!9804 lt!337367)) e!145763)))

(declare-fun b!214092 () Bool)

(declare-fun res!179943 () Bool)

(assert (=> b!214092 (=> (not res!179943) (not e!145763))))

(assert (=> b!214092 (= res!179943 (bvsle (bitIndex!0 (size!4635 (buf!5167 (_2!9804 lt!337349))) (currentByte!9739 (_2!9804 lt!337349)) (currentBit!9734 (_2!9804 lt!337349))) (bitIndex!0 (size!4635 (buf!5167 (_2!9804 lt!337367))) (currentByte!9739 (_2!9804 lt!337367)) (currentBit!9734 (_2!9804 lt!337367)))))))

(declare-fun b!214093 () Bool)

(declare-fun e!145762 () Bool)

(assert (=> b!214093 (= e!145763 e!145762)))

(declare-fun res!179944 () Bool)

(assert (=> b!214093 (=> res!179944 e!145762)))

(assert (=> b!214093 (= res!179944 (= (size!4635 (buf!5167 (_2!9804 lt!337349))) #b00000000000000000000000000000000))))

(declare-fun b!214094 () Bool)

(assert (=> b!214094 (= e!145762 (arrayBitRangesEq!0 (buf!5167 (_2!9804 lt!337349)) (buf!5167 (_2!9804 lt!337367)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4635 (buf!5167 (_2!9804 lt!337349))) (currentByte!9739 (_2!9804 lt!337349)) (currentBit!9734 (_2!9804 lt!337349)))))))

(assert (= (and d!72445 res!179942) b!214092))

(assert (= (and b!214092 res!179943) b!214093))

(assert (= (and b!214093 (not res!179944)) b!214094))

(assert (=> b!214092 m!329329))

(assert (=> b!214092 m!329319))

(assert (=> b!214094 m!329329))

(assert (=> b!214094 m!329329))

(declare-fun m!330119 () Bool)

(assert (=> b!214094 m!330119))

(assert (=> b!213701 d!72445))

(declare-fun d!72447 () Bool)

(assert (=> d!72447 (= (invariant!0 (currentBit!9734 thiss!1204) (currentByte!9739 thiss!1204) (size!4635 (buf!5167 thiss!1204))) (and (bvsge (currentBit!9734 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9734 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9739 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9739 thiss!1204) (size!4635 (buf!5167 thiss!1204))) (and (= (currentBit!9734 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9739 thiss!1204) (size!4635 (buf!5167 thiss!1204)))))))))

(assert (=> b!213700 d!72447))

(declare-fun d!72449 () Bool)

(declare-fun e!145764 () Bool)

(assert (=> d!72449 e!145764))

(declare-fun res!179946 () Bool)

(assert (=> d!72449 (=> (not res!179946) (not e!145764))))

(declare-fun lt!338464 () (_ BitVec 64))

(declare-fun lt!338467 () (_ BitVec 64))

(declare-fun lt!338468 () (_ BitVec 64))

(assert (=> d!72449 (= res!179946 (= lt!338468 (bvsub lt!338464 lt!338467)))))

(assert (=> d!72449 (or (= (bvand lt!338464 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!338467 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!338464 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!338464 lt!338467) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72449 (= lt!338467 (remainingBits!0 ((_ sign_extend 32) (size!4635 (buf!5167 (_1!9803 lt!337354)))) ((_ sign_extend 32) (currentByte!9739 (_1!9803 lt!337354))) ((_ sign_extend 32) (currentBit!9734 (_1!9803 lt!337354)))))))

(declare-fun lt!338466 () (_ BitVec 64))

(declare-fun lt!338465 () (_ BitVec 64))

(assert (=> d!72449 (= lt!338464 (bvmul lt!338466 lt!338465))))

(assert (=> d!72449 (or (= lt!338466 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!338465 (bvsdiv (bvmul lt!338466 lt!338465) lt!338466)))))

(assert (=> d!72449 (= lt!338465 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72449 (= lt!338466 ((_ sign_extend 32) (size!4635 (buf!5167 (_1!9803 lt!337354)))))))

(assert (=> d!72449 (= lt!338468 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9739 (_1!9803 lt!337354))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9734 (_1!9803 lt!337354)))))))

(assert (=> d!72449 (invariant!0 (currentBit!9734 (_1!9803 lt!337354)) (currentByte!9739 (_1!9803 lt!337354)) (size!4635 (buf!5167 (_1!9803 lt!337354))))))

(assert (=> d!72449 (= (bitIndex!0 (size!4635 (buf!5167 (_1!9803 lt!337354))) (currentByte!9739 (_1!9803 lt!337354)) (currentBit!9734 (_1!9803 lt!337354))) lt!338468)))

(declare-fun b!214095 () Bool)

(declare-fun res!179945 () Bool)

(assert (=> b!214095 (=> (not res!179945) (not e!145764))))

(assert (=> b!214095 (= res!179945 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!338468))))

(declare-fun b!214096 () Bool)

(declare-fun lt!338463 () (_ BitVec 64))

(assert (=> b!214096 (= e!145764 (bvsle lt!338468 (bvmul lt!338463 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!214096 (or (= lt!338463 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!338463 #b0000000000000000000000000000000000000000000000000000000000001000) lt!338463)))))

(assert (=> b!214096 (= lt!338463 ((_ sign_extend 32) (size!4635 (buf!5167 (_1!9803 lt!337354)))))))

(assert (= (and d!72449 res!179946) b!214095))

(assert (= (and b!214095 res!179945) b!214096))

(declare-fun m!330121 () Bool)

(assert (=> d!72449 m!330121))

(declare-fun m!330123 () Bool)

(assert (=> d!72449 m!330123))

(assert (=> b!213713 d!72449))

(declare-fun d!72451 () Bool)

(declare-fun e!145765 () Bool)

(assert (=> d!72451 e!145765))

(declare-fun res!179948 () Bool)

(assert (=> d!72451 (=> (not res!179948) (not e!145765))))

(declare-fun lt!338470 () (_ BitVec 64))

(declare-fun lt!338473 () (_ BitVec 64))

(declare-fun lt!338474 () (_ BitVec 64))

(assert (=> d!72451 (= res!179948 (= lt!338474 (bvsub lt!338470 lt!338473)))))

(assert (=> d!72451 (or (= (bvand lt!338470 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!338473 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!338470 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!338470 lt!338473) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72451 (= lt!338473 (remainingBits!0 ((_ sign_extend 32) (size!4635 (buf!5167 (_1!9805 lt!337365)))) ((_ sign_extend 32) (currentByte!9739 (_1!9805 lt!337365))) ((_ sign_extend 32) (currentBit!9734 (_1!9805 lt!337365)))))))

(declare-fun lt!338472 () (_ BitVec 64))

(declare-fun lt!338471 () (_ BitVec 64))

(assert (=> d!72451 (= lt!338470 (bvmul lt!338472 lt!338471))))

(assert (=> d!72451 (or (= lt!338472 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!338471 (bvsdiv (bvmul lt!338472 lt!338471) lt!338472)))))

(assert (=> d!72451 (= lt!338471 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72451 (= lt!338472 ((_ sign_extend 32) (size!4635 (buf!5167 (_1!9805 lt!337365)))))))

(assert (=> d!72451 (= lt!338474 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9739 (_1!9805 lt!337365))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9734 (_1!9805 lt!337365)))))))

(assert (=> d!72451 (invariant!0 (currentBit!9734 (_1!9805 lt!337365)) (currentByte!9739 (_1!9805 lt!337365)) (size!4635 (buf!5167 (_1!9805 lt!337365))))))

(assert (=> d!72451 (= (bitIndex!0 (size!4635 (buf!5167 (_1!9805 lt!337365))) (currentByte!9739 (_1!9805 lt!337365)) (currentBit!9734 (_1!9805 lt!337365))) lt!338474)))

(declare-fun b!214097 () Bool)

(declare-fun res!179947 () Bool)

(assert (=> b!214097 (=> (not res!179947) (not e!145765))))

(assert (=> b!214097 (= res!179947 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!338474))))

(declare-fun b!214098 () Bool)

(declare-fun lt!338469 () (_ BitVec 64))

(assert (=> b!214098 (= e!145765 (bvsle lt!338474 (bvmul lt!338469 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!214098 (or (= lt!338469 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!338469 #b0000000000000000000000000000000000000000000000000000000000001000) lt!338469)))))

(assert (=> b!214098 (= lt!338469 ((_ sign_extend 32) (size!4635 (buf!5167 (_1!9805 lt!337365)))))))

(assert (= (and d!72451 res!179948) b!214097))

(assert (= (and b!214097 res!179947) b!214098))

(declare-fun m!330125 () Bool)

(assert (=> d!72451 m!330125))

(declare-fun m!330127 () Bool)

(assert (=> d!72451 m!330127))

(assert (=> b!213702 d!72451))

(declare-fun d!72453 () Bool)

(declare-fun e!145766 () Bool)

(assert (=> d!72453 e!145766))

(declare-fun res!179950 () Bool)

(assert (=> d!72453 (=> (not res!179950) (not e!145766))))

(declare-fun lt!338479 () (_ BitVec 64))

(declare-fun lt!338480 () (_ BitVec 64))

(declare-fun lt!338476 () (_ BitVec 64))

(assert (=> d!72453 (= res!179950 (= lt!338480 (bvsub lt!338476 lt!338479)))))

(assert (=> d!72453 (or (= (bvand lt!338476 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!338479 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!338476 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!338476 lt!338479) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72453 (= lt!338479 (remainingBits!0 ((_ sign_extend 32) (size!4635 (buf!5167 (_2!9802 lt!337366)))) ((_ sign_extend 32) (currentByte!9739 (_2!9802 lt!337366))) ((_ sign_extend 32) (currentBit!9734 (_2!9802 lt!337366)))))))

(declare-fun lt!338478 () (_ BitVec 64))

(declare-fun lt!338477 () (_ BitVec 64))

(assert (=> d!72453 (= lt!338476 (bvmul lt!338478 lt!338477))))

(assert (=> d!72453 (or (= lt!338478 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!338477 (bvsdiv (bvmul lt!338478 lt!338477) lt!338478)))))

(assert (=> d!72453 (= lt!338477 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72453 (= lt!338478 ((_ sign_extend 32) (size!4635 (buf!5167 (_2!9802 lt!337366)))))))

(assert (=> d!72453 (= lt!338480 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9739 (_2!9802 lt!337366))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9734 (_2!9802 lt!337366)))))))

(assert (=> d!72453 (invariant!0 (currentBit!9734 (_2!9802 lt!337366)) (currentByte!9739 (_2!9802 lt!337366)) (size!4635 (buf!5167 (_2!9802 lt!337366))))))

(assert (=> d!72453 (= (bitIndex!0 (size!4635 (buf!5167 (_2!9802 lt!337366))) (currentByte!9739 (_2!9802 lt!337366)) (currentBit!9734 (_2!9802 lt!337366))) lt!338480)))

(declare-fun b!214099 () Bool)

(declare-fun res!179949 () Bool)

(assert (=> b!214099 (=> (not res!179949) (not e!145766))))

(assert (=> b!214099 (= res!179949 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!338480))))

(declare-fun b!214100 () Bool)

(declare-fun lt!338475 () (_ BitVec 64))

(assert (=> b!214100 (= e!145766 (bvsle lt!338480 (bvmul lt!338475 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!214100 (or (= lt!338475 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!338475 #b0000000000000000000000000000000000000000000000000000000000001000) lt!338475)))))

(assert (=> b!214100 (= lt!338475 ((_ sign_extend 32) (size!4635 (buf!5167 (_2!9802 lt!337366)))))))

(assert (= (and d!72453 res!179950) b!214099))

(assert (= (and b!214099 res!179949) b!214100))

(declare-fun m!330129 () Bool)

(assert (=> d!72453 m!330129))

(declare-fun m!330131 () Bool)

(assert (=> d!72453 m!330131))

(assert (=> b!213702 d!72453))

(declare-fun d!72455 () Bool)

(declare-fun lt!338493 () tuple2!18300)

(declare-fun lt!338497 () tuple2!18300)

(assert (=> d!72455 (and (= (_2!9805 lt!338493) (_2!9805 lt!338497)) (= (_1!9805 lt!338493) (_1!9805 lt!338497)))))

(declare-fun lt!338498 () BitStream!8378)

(declare-fun lt!338496 () Unit!15215)

(declare-fun lt!338494 () Bool)

(declare-fun lt!338495 () (_ BitVec 64))

(declare-fun choose!56 (BitStream!8378 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!18300 tuple2!18300 BitStream!8378 (_ BitVec 64) Bool BitStream!8378 (_ BitVec 64) tuple2!18300 tuple2!18300 BitStream!8378 (_ BitVec 64)) Unit!15215)

(assert (=> d!72455 (= lt!338496 (choose!56 (_1!9802 lt!337366) nBits!348 i!590 lt!337360 lt!338493 (tuple2!18301 (_1!9805 lt!338493) (_2!9805 lt!338493)) (_1!9805 lt!338493) (_2!9805 lt!338493) lt!338494 lt!338498 lt!338495 lt!338497 (tuple2!18301 (_1!9805 lt!338497) (_2!9805 lt!338497)) (_1!9805 lt!338497) (_2!9805 lt!338497)))))

(assert (=> d!72455 (= lt!338497 (readNBitsLSBFirstsLoopPure!0 lt!338498 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!338495))))

(assert (=> d!72455 (= lt!338495 (bvor lt!337360 (ite lt!338494 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72455 (= lt!338498 (withMovedBitIndex!0 (_1!9802 lt!337366) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!72455 (= lt!338494 (_2!9803 (readBitPure!0 (_1!9802 lt!337366))))))

(assert (=> d!72455 (= lt!338493 (readNBitsLSBFirstsLoopPure!0 (_1!9802 lt!337366) nBits!348 i!590 lt!337360))))

(assert (=> d!72455 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9802 lt!337366) nBits!348 i!590 lt!337360) lt!338496)))

(declare-fun bs!17761 () Bool)

(assert (= bs!17761 d!72455))

(assert (=> bs!17761 m!329353))

(assert (=> bs!17761 m!329343))

(declare-fun m!330133 () Bool)

(assert (=> bs!17761 m!330133))

(declare-fun m!330135 () Bool)

(assert (=> bs!17761 m!330135))

(assert (=> bs!17761 m!329315))

(assert (=> b!213712 d!72455))

(declare-fun lt!338499 () tuple2!18312)

(declare-fun d!72457 () Bool)

(assert (=> d!72457 (= lt!338499 (readNBitsLSBFirstsLoop!0 lt!337357 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!337337))))

(assert (=> d!72457 (= (readNBitsLSBFirstsLoopPure!0 lt!337357 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!337337) (tuple2!18301 (_2!9811 lt!338499) (_1!9811 lt!338499)))))

(declare-fun bs!17762 () Bool)

(assert (= bs!17762 d!72457))

(declare-fun m!330137 () Bool)

(assert (=> bs!17762 m!330137))

(assert (=> b!213712 d!72457))

(declare-fun d!72459 () Bool)

(declare-fun e!145767 () Bool)

(assert (=> d!72459 e!145767))

(declare-fun res!179951 () Bool)

(assert (=> d!72459 (=> (not res!179951) (not e!145767))))

(declare-fun lt!338501 () (_ BitVec 64))

(declare-fun lt!338500 () BitStream!8378)

(assert (=> d!72459 (= res!179951 (= (bvadd lt!338501 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4635 (buf!5167 lt!338500)) (currentByte!9739 lt!338500) (currentBit!9734 lt!338500))))))

(assert (=> d!72459 (or (not (= (bvand lt!338501 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!338501 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!338501 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72459 (= lt!338501 (bitIndex!0 (size!4635 (buf!5167 (_1!9802 lt!337366))) (currentByte!9739 (_1!9802 lt!337366)) (currentBit!9734 (_1!9802 lt!337366))))))

(assert (=> d!72459 (= lt!338500 (_2!9804 (moveBitIndex!0 (_1!9802 lt!337366) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!72459 (moveBitIndexPrecond!0 (_1!9802 lt!337366) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!72459 (= (withMovedBitIndex!0 (_1!9802 lt!337366) #b0000000000000000000000000000000000000000000000000000000000000001) lt!338500)))

(declare-fun b!214101 () Bool)

(assert (=> b!214101 (= e!145767 (= (size!4635 (buf!5167 (_1!9802 lt!337366))) (size!4635 (buf!5167 lt!338500))))))

(assert (= (and d!72459 res!179951) b!214101))

(declare-fun m!330139 () Bool)

(assert (=> d!72459 m!330139))

(declare-fun m!330141 () Bool)

(assert (=> d!72459 m!330141))

(declare-fun m!330143 () Bool)

(assert (=> d!72459 m!330143))

(declare-fun m!330145 () Bool)

(assert (=> d!72459 m!330145))

(assert (=> b!213712 d!72459))

(push 1)

(assert (not b!214075))

(assert (not d!72435))

(assert (not d!72397))

(assert (not d!72285))

(assert (not d!72393))

(assert (not b!213824))

(assert (not d!72429))

(assert (not b!214037))

(assert (not b!214084))

(assert (not b!213825))

(assert (not b!214021))

(assert (not b!214086))

(assert (not d!72449))

(assert (not d!72451))

(assert (not d!72437))

(assert (not b!213844))

(assert (not b!214082))

(assert (not b!214024))

(assert (not d!72287))

(assert (not b!214079))

(assert (not d!72455))

(assert (not b!214094))

(assert (not b!214028))

(assert (not b!213823))

(assert (not d!72423))

(assert (not d!72433))

(assert (not b!214076))

(assert (not d!72425))

(assert (not d!72283))

(assert (not d!72457))

(assert (not b!214077))

(assert (not b!214035))

(assert (not d!72431))

(assert (not b!214033))

(assert (not b!214083))

(assert (not b!214063))

(assert (not d!72441))

(assert (not b!214023))

(assert (not b!214034))

(assert (not d!72329))

(assert (not d!72413))

(assert (not b!214092))

(assert (not d!72417))

(assert (not d!72459))

(assert (not d!72419))

(assert (not d!72389))

(assert (not d!72453))

(assert (not d!72297))

(assert (not b!214039))

(assert (not d!72427))

(assert (not d!72313))

(assert (not d!72407))

(assert (not b!214027))

(assert (not d!72411))

(assert (not b!213842))

(assert (not b!214025))

(assert (not b!213826))

(assert (not d!72289))

(assert (not bm!3357))

(assert (not d!72409))

(assert (not d!72439))

(check-sat)

(pop 1)

(push 1)

(check-sat)

