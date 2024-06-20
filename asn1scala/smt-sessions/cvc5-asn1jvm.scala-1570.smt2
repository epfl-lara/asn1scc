; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44550 () Bool)

(assert start!44550)

(declare-fun b!212356 () Bool)

(declare-fun res!178369 () Bool)

(declare-fun e!144723 () Bool)

(assert (=> b!212356 (=> res!178369 e!144723)))

(declare-datatypes ((array!10523 0))(
  ( (array!10524 (arr!5551 (Array (_ BitVec 32) (_ BitVec 8))) (size!4621 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8350 0))(
  ( (BitStream!8351 (buf!5150 array!10523) (currentByte!9716 (_ BitVec 32)) (currentBit!9711 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8350)

(declare-datatypes ((Unit!15148 0))(
  ( (Unit!15149) )
))
(declare-datatypes ((tuple2!18170 0))(
  ( (tuple2!18171 (_1!9740 Unit!15148) (_2!9740 BitStream!8350)) )
))
(declare-fun lt!334946 () tuple2!18170)

(declare-fun isPrefixOf!0 (BitStream!8350 BitStream!8350) Bool)

(assert (=> b!212356 (= res!178369 (not (isPrefixOf!0 thiss!1204 (_2!9740 lt!334946))))))

(declare-fun b!212358 () Bool)

(declare-fun e!144724 () Bool)

(declare-fun array_inv!4362 (array!10523) Bool)

(assert (=> b!212358 (= e!144724 (array_inv!4362 (buf!5150 thiss!1204)))))

(declare-fun b!212359 () Bool)

(declare-fun e!144731 () Bool)

(declare-fun lt!334934 () (_ BitVec 64))

(declare-fun lt!334947 () (_ BitVec 64))

(assert (=> b!212359 (= e!144731 (= lt!334934 (bvsub lt!334947 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!212360 () Bool)

(declare-fun res!178387 () Bool)

(assert (=> b!212360 (=> (not res!178387) (not e!144731))))

(declare-datatypes ((tuple2!18172 0))(
  ( (tuple2!18173 (_1!9741 BitStream!8350) (_2!9741 BitStream!8350)) )
))
(declare-fun lt!334931 () tuple2!18172)

(declare-fun lt!334945 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!8350 (_ BitVec 64)) BitStream!8350)

(assert (=> b!212360 (= res!178387 (= (_1!9741 lt!334931) (withMovedBitIndex!0 (_2!9741 lt!334931) (bvsub lt!334947 lt!334945))))))

(declare-fun b!212361 () Bool)

(declare-fun e!144734 () Bool)

(assert (=> b!212361 (= e!144723 e!144734)))

(declare-fun res!178374 () Bool)

(assert (=> b!212361 (=> res!178374 e!144734)))

(declare-datatypes ((tuple2!18174 0))(
  ( (tuple2!18175 (_1!9742 BitStream!8350) (_2!9742 (_ BitVec 64))) )
))
(declare-fun lt!334949 () tuple2!18174)

(assert (=> b!212361 (= res!178374 (not (= (_1!9742 lt!334949) (_2!9741 lt!334931))))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lt!334943 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8350 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18174)

(assert (=> b!212361 (= lt!334949 (readNBitsLSBFirstsLoopPure!0 (_1!9741 lt!334931) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!334943))))

(declare-fun lt!334948 () tuple2!18170)

(declare-fun lt!334930 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!212361 (validate_offset_bits!1 ((_ sign_extend 32) (size!4621 (buf!5150 (_2!9740 lt!334948)))) ((_ sign_extend 32) (currentByte!9716 (_2!9740 lt!334946))) ((_ sign_extend 32) (currentBit!9711 (_2!9740 lt!334946))) lt!334930)))

(declare-fun lt!334926 () Unit!15148)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8350 array!10523 (_ BitVec 64)) Unit!15148)

(assert (=> b!212361 (= lt!334926 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9740 lt!334946) (buf!5150 (_2!9740 lt!334948)) lt!334930))))

(assert (=> b!212361 (= lt!334930 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!334952 () (_ BitVec 64))

(declare-fun lt!334938 () (_ BitVec 64))

(declare-datatypes ((tuple2!18176 0))(
  ( (tuple2!18177 (_1!9743 BitStream!8350) (_2!9743 Bool)) )
))
(declare-fun lt!334933 () tuple2!18176)

(assert (=> b!212361 (= lt!334943 (bvor lt!334952 (ite (_2!9743 lt!334933) lt!334938 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!334928 () tuple2!18172)

(declare-fun lt!334941 () tuple2!18174)

(assert (=> b!212361 (= lt!334941 (readNBitsLSBFirstsLoopPure!0 (_1!9741 lt!334928) nBits!348 i!590 lt!334952))))

(declare-fun lt!334929 () (_ BitVec 64))

(assert (=> b!212361 (validate_offset_bits!1 ((_ sign_extend 32) (size!4621 (buf!5150 (_2!9740 lt!334948)))) ((_ sign_extend 32) (currentByte!9716 thiss!1204)) ((_ sign_extend 32) (currentBit!9711 thiss!1204)) lt!334929)))

(declare-fun lt!334950 () Unit!15148)

(assert (=> b!212361 (= lt!334950 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5150 (_2!9740 lt!334948)) lt!334929))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!212361 (= lt!334952 (bvand v!189 (onesLSBLong!0 i!590)))))

(declare-fun lt!334935 () Bool)

(assert (=> b!212361 (= (_2!9743 lt!334933) lt!334935)))

(declare-fun readBitPure!0 (BitStream!8350) tuple2!18176)

(assert (=> b!212361 (= lt!334933 (readBitPure!0 (_1!9741 lt!334928)))))

(declare-fun reader!0 (BitStream!8350 BitStream!8350) tuple2!18172)

(assert (=> b!212361 (= lt!334931 (reader!0 (_2!9740 lt!334946) (_2!9740 lt!334948)))))

(assert (=> b!212361 (= lt!334928 (reader!0 thiss!1204 (_2!9740 lt!334948)))))

(declare-fun e!144729 () Bool)

(assert (=> b!212361 e!144729))

(declare-fun res!178384 () Bool)

(assert (=> b!212361 (=> (not res!178384) (not e!144729))))

(declare-fun lt!334924 () tuple2!18176)

(declare-fun lt!334944 () tuple2!18176)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!212361 (= res!178384 (= (bitIndex!0 (size!4621 (buf!5150 (_1!9743 lt!334924))) (currentByte!9716 (_1!9743 lt!334924)) (currentBit!9711 (_1!9743 lt!334924))) (bitIndex!0 (size!4621 (buf!5150 (_1!9743 lt!334944))) (currentByte!9716 (_1!9743 lt!334944)) (currentBit!9711 (_1!9743 lt!334944)))))))

(declare-fun lt!334925 () Unit!15148)

(declare-fun lt!334927 () BitStream!8350)

(declare-fun readBitPrefixLemma!0 (BitStream!8350 BitStream!8350) Unit!15148)

(assert (=> b!212361 (= lt!334925 (readBitPrefixLemma!0 lt!334927 (_2!9740 lt!334948)))))

(assert (=> b!212361 (= lt!334944 (readBitPure!0 (BitStream!8351 (buf!5150 (_2!9740 lt!334948)) (currentByte!9716 thiss!1204) (currentBit!9711 thiss!1204))))))

(assert (=> b!212361 (= lt!334924 (readBitPure!0 lt!334927))))

(declare-fun e!144728 () Bool)

(assert (=> b!212361 e!144728))

(declare-fun res!178376 () Bool)

(assert (=> b!212361 (=> (not res!178376) (not e!144728))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!212361 (= res!178376 (invariant!0 (currentBit!9711 thiss!1204) (currentByte!9716 thiss!1204) (size!4621 (buf!5150 (_2!9740 lt!334946)))))))

(assert (=> b!212361 (= lt!334927 (BitStream!8351 (buf!5150 (_2!9740 lt!334946)) (currentByte!9716 thiss!1204) (currentBit!9711 thiss!1204)))))

(declare-fun b!212362 () Bool)

(declare-fun e!144727 () Bool)

(assert (=> b!212362 (= e!144727 e!144723)))

(declare-fun res!178375 () Bool)

(assert (=> b!212362 (=> res!178375 e!144723)))

(assert (=> b!212362 (= res!178375 (not (= lt!334945 (bvsub (bvsub (bvadd lt!334947 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!212362 (= lt!334945 (bitIndex!0 (size!4621 (buf!5150 (_2!9740 lt!334948))) (currentByte!9716 (_2!9740 lt!334948)) (currentBit!9711 (_2!9740 lt!334948))))))

(assert (=> b!212362 (isPrefixOf!0 thiss!1204 (_2!9740 lt!334948))))

(declare-fun lt!334940 () Unit!15148)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8350 BitStream!8350 BitStream!8350) Unit!15148)

(assert (=> b!212362 (= lt!334940 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9740 lt!334946) (_2!9740 lt!334948)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8350 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!18170)

(assert (=> b!212362 (= lt!334948 (appendBitsLSBFirstLoopTR!0 (_2!9740 lt!334946) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!212363 () Bool)

(declare-fun res!178371 () Bool)

(assert (=> b!212363 (=> (not res!178371) (not e!144731))))

(assert (=> b!212363 (= res!178371 (= (_1!9741 lt!334928) (withMovedBitIndex!0 (_2!9741 lt!334928) (bvsub lt!334934 lt!334945))))))

(declare-fun b!212364 () Bool)

(declare-fun e!144735 () Bool)

(assert (=> b!212364 (= e!144735 (not e!144727))))

(declare-fun res!178386 () Bool)

(assert (=> b!212364 (=> res!178386 e!144727)))

(assert (=> b!212364 (= res!178386 (not (= lt!334947 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!334934))))))

(assert (=> b!212364 (= lt!334947 (bitIndex!0 (size!4621 (buf!5150 (_2!9740 lt!334946))) (currentByte!9716 (_2!9740 lt!334946)) (currentBit!9711 (_2!9740 lt!334946))))))

(assert (=> b!212364 (= lt!334934 (bitIndex!0 (size!4621 (buf!5150 thiss!1204)) (currentByte!9716 thiss!1204) (currentBit!9711 thiss!1204)))))

(declare-fun e!144733 () Bool)

(assert (=> b!212364 e!144733))

(declare-fun res!178380 () Bool)

(assert (=> b!212364 (=> (not res!178380) (not e!144733))))

(assert (=> b!212364 (= res!178380 (= (size!4621 (buf!5150 thiss!1204)) (size!4621 (buf!5150 (_2!9740 lt!334946)))))))

(declare-fun appendBit!0 (BitStream!8350 Bool) tuple2!18170)

(assert (=> b!212364 (= lt!334946 (appendBit!0 thiss!1204 lt!334935))))

(assert (=> b!212364 (= lt!334935 (not (= (bvand v!189 lt!334938) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!212364 (= lt!334938 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!212365 () Bool)

(declare-fun res!178377 () Bool)

(assert (=> b!212365 (=> (not res!178377) (not e!144735))))

(assert (=> b!212365 (= res!178377 (invariant!0 (currentBit!9711 thiss!1204) (currentByte!9716 thiss!1204) (size!4621 (buf!5150 thiss!1204))))))

(declare-fun b!212366 () Bool)

(declare-fun e!144732 () Bool)

(declare-fun e!144725 () Bool)

(assert (=> b!212366 (= e!144732 e!144725)))

(declare-fun res!178372 () Bool)

(assert (=> b!212366 (=> (not res!178372) (not e!144725))))

(declare-fun lt!334951 () tuple2!18176)

(assert (=> b!212366 (= res!178372 (and (= (_2!9743 lt!334951) lt!334935) (= (_1!9743 lt!334951) (_2!9740 lt!334946))))))

(declare-fun readerFrom!0 (BitStream!8350 (_ BitVec 32) (_ BitVec 32)) BitStream!8350)

(assert (=> b!212366 (= lt!334951 (readBitPure!0 (readerFrom!0 (_2!9740 lt!334946) (currentBit!9711 thiss!1204) (currentByte!9716 thiss!1204))))))

(declare-fun b!212367 () Bool)

(declare-fun lt!334936 () (_ BitVec 64))

(assert (=> b!212367 (= e!144725 (= (bitIndex!0 (size!4621 (buf!5150 (_1!9743 lt!334951))) (currentByte!9716 (_1!9743 lt!334951)) (currentBit!9711 (_1!9743 lt!334951))) lt!334936))))

(declare-fun b!212368 () Bool)

(declare-fun res!178382 () Bool)

(assert (=> b!212368 (=> res!178382 e!144723)))

(assert (=> b!212368 (= res!178382 (not (isPrefixOf!0 (_2!9740 lt!334946) (_2!9740 lt!334948))))))

(declare-fun res!178378 () Bool)

(declare-fun e!144730 () Bool)

(assert (=> start!44550 (=> (not res!178378) (not e!144730))))

(assert (=> start!44550 (= res!178378 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!44550 e!144730))

(assert (=> start!44550 true))

(declare-fun inv!12 (BitStream!8350) Bool)

(assert (=> start!44550 (and (inv!12 thiss!1204) e!144724)))

(declare-fun b!212357 () Bool)

(declare-fun res!178385 () Bool)

(assert (=> b!212357 (=> (not res!178385) (not e!144735))))

(assert (=> b!212357 (= res!178385 (not (= i!590 nBits!348)))))

(declare-fun b!212369 () Bool)

(assert (=> b!212369 (= e!144728 (invariant!0 (currentBit!9711 thiss!1204) (currentByte!9716 thiss!1204) (size!4621 (buf!5150 (_2!9740 lt!334948)))))))

(declare-fun b!212370 () Bool)

(declare-fun res!178381 () Bool)

(assert (=> b!212370 (=> (not res!178381) (not e!144732))))

(assert (=> b!212370 (= res!178381 (isPrefixOf!0 thiss!1204 (_2!9740 lt!334946)))))

(declare-fun b!212371 () Bool)

(declare-fun res!178370 () Bool)

(assert (=> b!212371 (=> res!178370 e!144723)))

(assert (=> b!212371 (= res!178370 (not (invariant!0 (currentBit!9711 (_2!9740 lt!334948)) (currentByte!9716 (_2!9740 lt!334948)) (size!4621 (buf!5150 (_2!9740 lt!334948))))))))

(declare-fun b!212372 () Bool)

(declare-fun lt!334937 () BitStream!8350)

(assert (=> b!212372 (= e!144734 (or (not (= (_1!9741 lt!334931) lt!334937)) (= (_2!9742 lt!334941) (_2!9742 lt!334949))))))

(assert (=> b!212372 e!144731))

(declare-fun res!178379 () Bool)

(assert (=> b!212372 (=> (not res!178379) (not e!144731))))

(declare-fun lt!334939 () tuple2!18174)

(assert (=> b!212372 (= res!178379 (and (= (_2!9742 lt!334941) (_2!9742 lt!334939)) (= (_1!9742 lt!334941) (_1!9742 lt!334939))))))

(declare-fun lt!334942 () Unit!15148)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8350 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!15148)

(assert (=> b!212372 (= lt!334942 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9741 lt!334928) nBits!348 i!590 lt!334952))))

(assert (=> b!212372 (= lt!334939 (readNBitsLSBFirstsLoopPure!0 lt!334937 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!334943))))

(assert (=> b!212372 (= lt!334937 (withMovedBitIndex!0 (_1!9741 lt!334928) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!212373 () Bool)

(assert (=> b!212373 (= e!144729 (= (_2!9743 lt!334924) (_2!9743 lt!334944)))))

(declare-fun b!212374 () Bool)

(assert (=> b!212374 (= e!144730 e!144735)))

(declare-fun res!178383 () Bool)

(assert (=> b!212374 (=> (not res!178383) (not e!144735))))

(assert (=> b!212374 (= res!178383 (validate_offset_bits!1 ((_ sign_extend 32) (size!4621 (buf!5150 thiss!1204))) ((_ sign_extend 32) (currentByte!9716 thiss!1204)) ((_ sign_extend 32) (currentBit!9711 thiss!1204)) lt!334929))))

(assert (=> b!212374 (= lt!334929 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!212375 () Bool)

(declare-fun res!178373 () Bool)

(assert (=> b!212375 (=> res!178373 e!144723)))

(assert (=> b!212375 (= res!178373 (or (not (= (size!4621 (buf!5150 (_2!9740 lt!334948))) (size!4621 (buf!5150 thiss!1204)))) (not (= lt!334945 (bvsub (bvadd lt!334934 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!212376 () Bool)

(assert (=> b!212376 (= e!144733 e!144732)))

(declare-fun res!178388 () Bool)

(assert (=> b!212376 (=> (not res!178388) (not e!144732))))

(declare-fun lt!334932 () (_ BitVec 64))

(assert (=> b!212376 (= res!178388 (= lt!334936 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!334932)))))

(assert (=> b!212376 (= lt!334936 (bitIndex!0 (size!4621 (buf!5150 (_2!9740 lt!334946))) (currentByte!9716 (_2!9740 lt!334946)) (currentBit!9711 (_2!9740 lt!334946))))))

(assert (=> b!212376 (= lt!334932 (bitIndex!0 (size!4621 (buf!5150 thiss!1204)) (currentByte!9716 thiss!1204) (currentBit!9711 thiss!1204)))))

(assert (= (and start!44550 res!178378) b!212374))

(assert (= (and b!212374 res!178383) b!212365))

(assert (= (and b!212365 res!178377) b!212357))

(assert (= (and b!212357 res!178385) b!212364))

(assert (= (and b!212364 res!178380) b!212376))

(assert (= (and b!212376 res!178388) b!212370))

(assert (= (and b!212370 res!178381) b!212366))

(assert (= (and b!212366 res!178372) b!212367))

(assert (= (and b!212364 (not res!178386)) b!212362))

(assert (= (and b!212362 (not res!178375)) b!212371))

(assert (= (and b!212371 (not res!178370)) b!212375))

(assert (= (and b!212375 (not res!178373)) b!212368))

(assert (= (and b!212368 (not res!178382)) b!212356))

(assert (= (and b!212356 (not res!178369)) b!212361))

(assert (= (and b!212361 res!178376) b!212369))

(assert (= (and b!212361 res!178384) b!212373))

(assert (= (and b!212361 (not res!178374)) b!212372))

(assert (= (and b!212372 res!178379) b!212363))

(assert (= (and b!212363 res!178371) b!212360))

(assert (= (and b!212360 res!178387) b!212359))

(assert (= start!44550 b!212358))

(declare-fun m!327393 () Bool)

(assert (=> b!212358 m!327393))

(declare-fun m!327395 () Bool)

(assert (=> b!212368 m!327395))

(declare-fun m!327397 () Bool)

(assert (=> b!212360 m!327397))

(declare-fun m!327399 () Bool)

(assert (=> b!212365 m!327399))

(declare-fun m!327401 () Bool)

(assert (=> b!212362 m!327401))

(declare-fun m!327403 () Bool)

(assert (=> b!212362 m!327403))

(declare-fun m!327405 () Bool)

(assert (=> b!212362 m!327405))

(declare-fun m!327407 () Bool)

(assert (=> b!212362 m!327407))

(declare-fun m!327409 () Bool)

(assert (=> b!212363 m!327409))

(declare-fun m!327411 () Bool)

(assert (=> b!212356 m!327411))

(declare-fun m!327413 () Bool)

(assert (=> b!212376 m!327413))

(declare-fun m!327415 () Bool)

(assert (=> b!212376 m!327415))

(declare-fun m!327417 () Bool)

(assert (=> b!212366 m!327417))

(assert (=> b!212366 m!327417))

(declare-fun m!327419 () Bool)

(assert (=> b!212366 m!327419))

(assert (=> b!212364 m!327413))

(assert (=> b!212364 m!327415))

(declare-fun m!327421 () Bool)

(assert (=> b!212364 m!327421))

(declare-fun m!327423 () Bool)

(assert (=> b!212371 m!327423))

(declare-fun m!327425 () Bool)

(assert (=> b!212367 m!327425))

(declare-fun m!327427 () Bool)

(assert (=> b!212372 m!327427))

(declare-fun m!327429 () Bool)

(assert (=> b!212372 m!327429))

(declare-fun m!327431 () Bool)

(assert (=> b!212372 m!327431))

(declare-fun m!327433 () Bool)

(assert (=> b!212374 m!327433))

(declare-fun m!327435 () Bool)

(assert (=> b!212361 m!327435))

(declare-fun m!327437 () Bool)

(assert (=> b!212361 m!327437))

(declare-fun m!327439 () Bool)

(assert (=> b!212361 m!327439))

(declare-fun m!327441 () Bool)

(assert (=> b!212361 m!327441))

(declare-fun m!327443 () Bool)

(assert (=> b!212361 m!327443))

(declare-fun m!327445 () Bool)

(assert (=> b!212361 m!327445))

(declare-fun m!327447 () Bool)

(assert (=> b!212361 m!327447))

(declare-fun m!327449 () Bool)

(assert (=> b!212361 m!327449))

(declare-fun m!327451 () Bool)

(assert (=> b!212361 m!327451))

(declare-fun m!327453 () Bool)

(assert (=> b!212361 m!327453))

(declare-fun m!327455 () Bool)

(assert (=> b!212361 m!327455))

(declare-fun m!327457 () Bool)

(assert (=> b!212361 m!327457))

(declare-fun m!327459 () Bool)

(assert (=> b!212361 m!327459))

(declare-fun m!327461 () Bool)

(assert (=> b!212361 m!327461))

(declare-fun m!327463 () Bool)

(assert (=> b!212361 m!327463))

(declare-fun m!327465 () Bool)

(assert (=> b!212361 m!327465))

(assert (=> b!212370 m!327411))

(declare-fun m!327467 () Bool)

(assert (=> b!212369 m!327467))

(declare-fun m!327469 () Bool)

(assert (=> start!44550 m!327469))

(push 1)

(assert (not b!212370))

(assert (not b!212363))

(assert (not b!212365))

(assert (not b!212367))

(assert (not b!212368))

(assert (not b!212372))

(assert (not b!212369))

(assert (not b!212366))

(assert (not b!212364))

(assert (not b!212376))

(assert (not b!212356))

(assert (not b!212358))

(assert (not b!212374))

(assert (not b!212361))

(assert (not b!212362))

(assert (not b!212360))

(assert (not b!212371))

(assert (not start!44550))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

