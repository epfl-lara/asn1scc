; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20576 () Bool)

(assert start!20576)

(declare-fun res!85200 () Bool)

(declare-fun e!67763 () Bool)

(assert (=> start!20576 (=> (not res!85200) (not e!67763))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!20576 (= res!85200 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20576 e!67763))

(assert (=> start!20576 true))

(declare-datatypes ((array!4834 0))(
  ( (array!4835 (arr!2798 (Array (_ BitVec 32) (_ BitVec 8))) (size!2205 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3884 0))(
  ( (BitStream!3885 (buf!2571 array!4834) (currentByte!5056 (_ BitVec 32)) (currentBit!5051 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3884)

(declare-fun e!67769 () Bool)

(declare-fun inv!12 (BitStream!3884) Bool)

(assert (=> start!20576 (and (inv!12 thiss!1305) e!67769)))

(declare-fun b!103561 () Bool)

(declare-fun e!67764 () Bool)

(declare-fun e!67760 () Bool)

(assert (=> b!103561 (= e!67764 e!67760)))

(declare-fun res!85204 () Bool)

(assert (=> b!103561 (=> res!85204 e!67760)))

(declare-datatypes ((tuple2!8486 0))(
  ( (tuple2!8487 (_1!4498 BitStream!3884) (_2!4498 BitStream!3884)) )
))
(declare-fun lt!151553 () tuple2!8486)

(declare-fun lt!151543 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!103561 (= res!85204 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!2205 (buf!2571 (_1!4498 lt!151553)))) ((_ sign_extend 32) (currentByte!5056 (_1!4498 lt!151553))) ((_ sign_extend 32) (currentBit!5051 (_1!4498 lt!151553))) ((_ sign_extend 32) lt!151543))))))

(assert (=> b!103561 (= lt!151543 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun b!103562 () Bool)

(declare-fun lt!151541 () (_ BitVec 64))

(declare-fun lt!151558 () (_ BitVec 64))

(assert (=> b!103562 (= e!67760 (= (bvand lt!151541 lt!151558) lt!151541))))

(declare-fun b!103563 () Bool)

(declare-fun e!67761 () Bool)

(declare-datatypes ((tuple2!8488 0))(
  ( (tuple2!8489 (_1!4499 BitStream!3884) (_2!4499 Bool)) )
))
(declare-fun lt!151547 () tuple2!8488)

(declare-fun lt!151554 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!103563 (= e!67761 (= (bitIndex!0 (size!2205 (buf!2571 (_1!4499 lt!151547))) (currentByte!5056 (_1!4499 lt!151547)) (currentBit!5051 (_1!4499 lt!151547))) lt!151554))))

(declare-fun b!103564 () Bool)

(declare-fun e!67767 () Bool)

(assert (=> b!103564 (= e!67763 e!67767)))

(declare-fun res!85198 () Bool)

(assert (=> b!103564 (=> (not res!85198) (not e!67767))))

(declare-fun lt!151564 () (_ BitVec 64))

(assert (=> b!103564 (= res!85198 (validate_offset_bits!1 ((_ sign_extend 32) (size!2205 (buf!2571 thiss!1305))) ((_ sign_extend 32) (currentByte!5056 thiss!1305)) ((_ sign_extend 32) (currentBit!5051 thiss!1305)) lt!151564))))

(assert (=> b!103564 (= lt!151564 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!103565 () Bool)

(declare-fun res!85196 () Bool)

(assert (=> b!103565 (=> res!85196 e!67760)))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!103565 (= res!85196 (not (= (bvand lt!151541 (onesLSBLong!0 lt!151543)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!103566 () Bool)

(declare-fun res!85205 () Bool)

(declare-fun e!67759 () Bool)

(assert (=> b!103566 (=> (not res!85205) (not e!67759))))

(declare-datatypes ((Unit!6354 0))(
  ( (Unit!6355) )
))
(declare-datatypes ((tuple2!8490 0))(
  ( (tuple2!8491 (_1!4500 Unit!6354) (_2!4500 BitStream!3884)) )
))
(declare-fun lt!151556 () tuple2!8490)

(declare-fun isPrefixOf!0 (BitStream!3884 BitStream!3884) Bool)

(assert (=> b!103566 (= res!85205 (isPrefixOf!0 thiss!1305 (_2!4500 lt!151556)))))

(declare-fun b!103567 () Bool)

(declare-fun e!67762 () Bool)

(assert (=> b!103567 (= e!67767 e!67762)))

(declare-fun res!85206 () Bool)

(assert (=> b!103567 (=> (not res!85206) (not e!67762))))

(declare-fun v!199 () (_ BitVec 64))

(assert (=> b!103567 (= res!85206 (and (= (bvand v!199 lt!151558) v!199) (bvslt i!615 nBits!396)))))

(assert (=> b!103567 (= lt!151558 (onesLSBLong!0 nBits!396))))

(declare-fun b!103568 () Bool)

(declare-fun e!67765 () Bool)

(declare-fun lt!151542 () tuple2!8488)

(declare-fun lt!151551 () tuple2!8488)

(assert (=> b!103568 (= e!67765 (= (_2!4499 lt!151542) (_2!4499 lt!151551)))))

(declare-fun b!103569 () Bool)

(declare-fun e!67768 () Bool)

(declare-fun lt!151544 () tuple2!8490)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!103569 (= e!67768 (invariant!0 (currentBit!5051 thiss!1305) (currentByte!5056 thiss!1305) (size!2205 (buf!2571 (_2!4500 lt!151544)))))))

(declare-fun b!103570 () Bool)

(declare-fun array_inv!2007 (array!4834) Bool)

(assert (=> b!103570 (= e!67769 (array_inv!2007 (buf!2571 thiss!1305)))))

(declare-fun b!103571 () Bool)

(declare-fun e!67766 () Bool)

(assert (=> b!103571 (= e!67766 e!67759)))

(declare-fun res!85207 () Bool)

(assert (=> b!103571 (=> (not res!85207) (not e!67759))))

(declare-fun lt!151545 () (_ BitVec 64))

(assert (=> b!103571 (= res!85207 (= lt!151554 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!151545)))))

(assert (=> b!103571 (= lt!151554 (bitIndex!0 (size!2205 (buf!2571 (_2!4500 lt!151556))) (currentByte!5056 (_2!4500 lt!151556)) (currentBit!5051 (_2!4500 lt!151556))))))

(assert (=> b!103571 (= lt!151545 (bitIndex!0 (size!2205 (buf!2571 thiss!1305)) (currentByte!5056 thiss!1305) (currentBit!5051 thiss!1305)))))

(declare-fun b!103572 () Bool)

(assert (=> b!103572 (= e!67759 e!67761)))

(declare-fun res!85202 () Bool)

(assert (=> b!103572 (=> (not res!85202) (not e!67761))))

(declare-fun lt!151548 () Bool)

(assert (=> b!103572 (= res!85202 (and (= (_2!4499 lt!151547) lt!151548) (= (_1!4499 lt!151547) (_2!4500 lt!151556))))))

(declare-fun readBitPure!0 (BitStream!3884) tuple2!8488)

(declare-fun readerFrom!0 (BitStream!3884 (_ BitVec 32) (_ BitVec 32)) BitStream!3884)

(assert (=> b!103572 (= lt!151547 (readBitPure!0 (readerFrom!0 (_2!4500 lt!151556) (currentBit!5051 thiss!1305) (currentByte!5056 thiss!1305))))))

(declare-fun b!103573 () Bool)

(assert (=> b!103573 (= e!67762 (not e!67764))))

(declare-fun res!85208 () Bool)

(assert (=> b!103573 (=> res!85208 e!67764)))

(assert (=> b!103573 (= res!85208 (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun lt!151552 () (_ BitVec 64))

(assert (=> b!103573 (validate_offset_bits!1 ((_ sign_extend 32) (size!2205 (buf!2571 (_2!4500 lt!151544)))) ((_ sign_extend 32) (currentByte!5056 (_2!4500 lt!151556))) ((_ sign_extend 32) (currentBit!5051 (_2!4500 lt!151556))) lt!151552)))

(declare-fun lt!151562 () Unit!6354)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3884 array!4834 (_ BitVec 64)) Unit!6354)

(assert (=> b!103573 (= lt!151562 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4500 lt!151556) (buf!2571 (_2!4500 lt!151544)) lt!151552))))

(assert (=> b!103573 (= lt!151552 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!151560 () (_ BitVec 64))

(declare-fun lt!151550 () tuple2!8488)

(declare-fun lt!151559 () (_ BitVec 64))

(assert (=> b!103573 (= lt!151541 (bvor lt!151559 (ite (_2!4499 lt!151550) lt!151560 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!151549 () tuple2!8486)

(declare-datatypes ((tuple2!8492 0))(
  ( (tuple2!8493 (_1!4501 BitStream!3884) (_2!4501 (_ BitVec 64))) )
))
(declare-fun lt!151561 () tuple2!8492)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3884 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8492)

(assert (=> b!103573 (= lt!151561 (readNLeastSignificantBitsLoopPure!0 (_1!4498 lt!151549) nBits!396 i!615 lt!151559))))

(assert (=> b!103573 (validate_offset_bits!1 ((_ sign_extend 32) (size!2205 (buf!2571 (_2!4500 lt!151544)))) ((_ sign_extend 32) (currentByte!5056 thiss!1305)) ((_ sign_extend 32) (currentBit!5051 thiss!1305)) lt!151564)))

(declare-fun lt!151563 () Unit!6354)

(assert (=> b!103573 (= lt!151563 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2571 (_2!4500 lt!151544)) lt!151564))))

(assert (=> b!103573 (= lt!151559 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(assert (=> b!103573 (= (_2!4499 lt!151550) lt!151548)))

(assert (=> b!103573 (= lt!151550 (readBitPure!0 (_1!4498 lt!151549)))))

(declare-fun reader!0 (BitStream!3884 BitStream!3884) tuple2!8486)

(assert (=> b!103573 (= lt!151553 (reader!0 (_2!4500 lt!151556) (_2!4500 lt!151544)))))

(assert (=> b!103573 (= lt!151549 (reader!0 thiss!1305 (_2!4500 lt!151544)))))

(assert (=> b!103573 e!67765))

(declare-fun res!85203 () Bool)

(assert (=> b!103573 (=> (not res!85203) (not e!67765))))

(assert (=> b!103573 (= res!85203 (= (bitIndex!0 (size!2205 (buf!2571 (_1!4499 lt!151542))) (currentByte!5056 (_1!4499 lt!151542)) (currentBit!5051 (_1!4499 lt!151542))) (bitIndex!0 (size!2205 (buf!2571 (_1!4499 lt!151551))) (currentByte!5056 (_1!4499 lt!151551)) (currentBit!5051 (_1!4499 lt!151551)))))))

(declare-fun lt!151546 () Unit!6354)

(declare-fun lt!151557 () BitStream!3884)

(declare-fun readBitPrefixLemma!0 (BitStream!3884 BitStream!3884) Unit!6354)

(assert (=> b!103573 (= lt!151546 (readBitPrefixLemma!0 lt!151557 (_2!4500 lt!151544)))))

(assert (=> b!103573 (= lt!151551 (readBitPure!0 (BitStream!3885 (buf!2571 (_2!4500 lt!151544)) (currentByte!5056 thiss!1305) (currentBit!5051 thiss!1305))))))

(assert (=> b!103573 (= lt!151542 (readBitPure!0 lt!151557))))

(assert (=> b!103573 (= lt!151557 (BitStream!3885 (buf!2571 (_2!4500 lt!151556)) (currentByte!5056 thiss!1305) (currentBit!5051 thiss!1305)))))

(assert (=> b!103573 e!67768))

(declare-fun res!85201 () Bool)

(assert (=> b!103573 (=> (not res!85201) (not e!67768))))

(assert (=> b!103573 (= res!85201 (isPrefixOf!0 thiss!1305 (_2!4500 lt!151544)))))

(declare-fun lt!151555 () Unit!6354)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3884 BitStream!3884 BitStream!3884) Unit!6354)

(assert (=> b!103573 (= lt!151555 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4500 lt!151556) (_2!4500 lt!151544)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3884 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8490)

(assert (=> b!103573 (= lt!151544 (appendNLeastSignificantBitsLoop!0 (_2!4500 lt!151556) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!103573 e!67766))

(declare-fun res!85197 () Bool)

(assert (=> b!103573 (=> (not res!85197) (not e!67766))))

(assert (=> b!103573 (= res!85197 (= (size!2205 (buf!2571 thiss!1305)) (size!2205 (buf!2571 (_2!4500 lt!151556)))))))

(declare-fun appendBit!0 (BitStream!3884 Bool) tuple2!8490)

(assert (=> b!103573 (= lt!151556 (appendBit!0 thiss!1305 lt!151548))))

(assert (=> b!103573 (= lt!151548 (not (= (bvand v!199 lt!151560) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!103573 (= lt!151560 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!103574 () Bool)

(declare-fun res!85199 () Bool)

(assert (=> b!103574 (=> (not res!85199) (not e!67768))))

(assert (=> b!103574 (= res!85199 (invariant!0 (currentBit!5051 thiss!1305) (currentByte!5056 thiss!1305) (size!2205 (buf!2571 (_2!4500 lt!151556)))))))

(assert (= (and start!20576 res!85200) b!103564))

(assert (= (and b!103564 res!85198) b!103567))

(assert (= (and b!103567 res!85206) b!103573))

(assert (= (and b!103573 res!85197) b!103571))

(assert (= (and b!103571 res!85207) b!103566))

(assert (= (and b!103566 res!85205) b!103572))

(assert (= (and b!103572 res!85202) b!103563))

(assert (= (and b!103573 res!85201) b!103574))

(assert (= (and b!103574 res!85199) b!103569))

(assert (= (and b!103573 res!85203) b!103568))

(assert (= (and b!103573 (not res!85208)) b!103561))

(assert (= (and b!103561 (not res!85204)) b!103565))

(assert (= (and b!103565 (not res!85196)) b!103562))

(assert (= start!20576 b!103570))

(declare-fun m!151233 () Bool)

(assert (=> b!103572 m!151233))

(assert (=> b!103572 m!151233))

(declare-fun m!151235 () Bool)

(assert (=> b!103572 m!151235))

(declare-fun m!151237 () Bool)

(assert (=> b!103573 m!151237))

(declare-fun m!151239 () Bool)

(assert (=> b!103573 m!151239))

(declare-fun m!151241 () Bool)

(assert (=> b!103573 m!151241))

(declare-fun m!151243 () Bool)

(assert (=> b!103573 m!151243))

(declare-fun m!151245 () Bool)

(assert (=> b!103573 m!151245))

(declare-fun m!151247 () Bool)

(assert (=> b!103573 m!151247))

(declare-fun m!151249 () Bool)

(assert (=> b!103573 m!151249))

(declare-fun m!151251 () Bool)

(assert (=> b!103573 m!151251))

(declare-fun m!151253 () Bool)

(assert (=> b!103573 m!151253))

(declare-fun m!151255 () Bool)

(assert (=> b!103573 m!151255))

(declare-fun m!151257 () Bool)

(assert (=> b!103573 m!151257))

(declare-fun m!151259 () Bool)

(assert (=> b!103573 m!151259))

(declare-fun m!151261 () Bool)

(assert (=> b!103573 m!151261))

(declare-fun m!151263 () Bool)

(assert (=> b!103573 m!151263))

(declare-fun m!151265 () Bool)

(assert (=> b!103573 m!151265))

(declare-fun m!151267 () Bool)

(assert (=> b!103573 m!151267))

(declare-fun m!151269 () Bool)

(assert (=> b!103573 m!151269))

(declare-fun m!151271 () Bool)

(assert (=> b!103573 m!151271))

(declare-fun m!151273 () Bool)

(assert (=> b!103565 m!151273))

(declare-fun m!151275 () Bool)

(assert (=> b!103569 m!151275))

(declare-fun m!151277 () Bool)

(assert (=> b!103574 m!151277))

(declare-fun m!151279 () Bool)

(assert (=> b!103570 m!151279))

(declare-fun m!151281 () Bool)

(assert (=> start!20576 m!151281))

(declare-fun m!151283 () Bool)

(assert (=> b!103566 m!151283))

(declare-fun m!151285 () Bool)

(assert (=> b!103571 m!151285))

(declare-fun m!151287 () Bool)

(assert (=> b!103571 m!151287))

(declare-fun m!151289 () Bool)

(assert (=> b!103567 m!151289))

(declare-fun m!151291 () Bool)

(assert (=> b!103561 m!151291))

(declare-fun m!151293 () Bool)

(assert (=> b!103563 m!151293))

(declare-fun m!151295 () Bool)

(assert (=> b!103564 m!151295))

(push 1)

(assert (not b!103566))

(assert (not start!20576))

(assert (not b!103570))

(assert (not b!103569))

(assert (not b!103572))

(assert (not b!103564))

(assert (not b!103561))

(assert (not b!103567))

(assert (not b!103563))

(assert (not b!103574))

(assert (not b!103565))

(assert (not b!103571))

(assert (not b!103573))

(check-sat)

(pop 1)

(push 1)

(check-sat)

