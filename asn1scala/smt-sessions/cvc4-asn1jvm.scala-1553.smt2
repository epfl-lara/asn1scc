; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43618 () Bool)

(assert start!43618)

(declare-fun b!206747 () Bool)

(declare-fun e!141354 () Bool)

(declare-datatypes ((array!10401 0))(
  ( (array!10402 (arr!5502 (Array (_ BitVec 32) (_ BitVec 8))) (size!4572 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8252 0))(
  ( (BitStream!8253 (buf!5077 array!10401) (currentByte!9595 (_ BitVec 32)) (currentBit!9590 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!17682 0))(
  ( (tuple2!17683 (_1!9496 BitStream!8252) (_2!9496 Bool)) )
))
(declare-fun lt!322946 () tuple2!17682)

(declare-fun lt!322951 () tuple2!17682)

(assert (=> b!206747 (= e!141354 (= (_2!9496 lt!322946) (_2!9496 lt!322951)))))

(declare-fun b!206748 () Bool)

(declare-fun e!141353 () Bool)

(declare-fun thiss!1204 () BitStream!8252)

(declare-fun array_inv!4313 (array!10401) Bool)

(assert (=> b!206748 (= e!141353 (array_inv!4313 (buf!5077 thiss!1204)))))

(declare-fun b!206749 () Bool)

(declare-fun res!173394 () Bool)

(declare-fun e!141347 () Bool)

(assert (=> b!206749 (=> (not res!173394) (not e!141347))))

(declare-datatypes ((Unit!14738 0))(
  ( (Unit!14739) )
))
(declare-datatypes ((tuple2!17684 0))(
  ( (tuple2!17685 (_1!9497 Unit!14738) (_2!9497 BitStream!8252)) )
))
(declare-fun lt!322961 () tuple2!17684)

(declare-fun isPrefixOf!0 (BitStream!8252 BitStream!8252) Bool)

(assert (=> b!206749 (= res!173394 (isPrefixOf!0 thiss!1204 (_2!9497 lt!322961)))))

(declare-fun res!173401 () Bool)

(declare-fun e!141344 () Bool)

(assert (=> start!43618 (=> (not res!173401) (not e!141344))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!43618 (= res!173401 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43618 e!141344))

(assert (=> start!43618 true))

(declare-fun inv!12 (BitStream!8252) Bool)

(assert (=> start!43618 (and (inv!12 thiss!1204) e!141353)))

(declare-fun b!206750 () Bool)

(declare-fun e!141349 () Bool)

(declare-fun lt!322955 () tuple2!17684)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!206750 (= e!141349 (invariant!0 (currentBit!9590 thiss!1204) (currentByte!9595 thiss!1204) (size!4572 (buf!5077 (_2!9497 lt!322955)))))))

(declare-fun b!206751 () Bool)

(declare-fun e!141348 () Bool)

(declare-fun lt!322948 () tuple2!17682)

(declare-fun lt!322945 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!206751 (= e!141348 (= (bitIndex!0 (size!4572 (buf!5077 (_1!9496 lt!322948))) (currentByte!9595 (_1!9496 lt!322948)) (currentBit!9590 (_1!9496 lt!322948))) lt!322945))))

(declare-fun b!206752 () Bool)

(declare-fun res!173398 () Bool)

(declare-fun e!141345 () Bool)

(assert (=> b!206752 (=> res!173398 e!141345)))

(assert (=> b!206752 (= res!173398 (not (invariant!0 (currentBit!9590 (_2!9497 lt!322955)) (currentByte!9595 (_2!9497 lt!322955)) (size!4572 (buf!5077 (_2!9497 lt!322955))))))))

(declare-fun b!206753 () Bool)

(declare-fun res!173392 () Bool)

(assert (=> b!206753 (=> res!173392 e!141345)))

(declare-fun lt!322944 () (_ BitVec 64))

(declare-fun lt!322957 () (_ BitVec 64))

(assert (=> b!206753 (= res!173392 (or (not (= (size!4572 (buf!5077 (_2!9497 lt!322955))) (size!4572 (buf!5077 thiss!1204)))) (not (= lt!322944 (bvsub (bvadd lt!322957 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!206754 () Bool)

(declare-fun res!173387 () Bool)

(declare-fun e!141346 () Bool)

(assert (=> b!206754 (=> (not res!173387) (not e!141346))))

(assert (=> b!206754 (= res!173387 (not (= i!590 nBits!348)))))

(declare-fun b!206755 () Bool)

(declare-fun lt!322956 () tuple2!17682)

(assert (=> b!206755 (= e!141345 (or (not (_2!9496 lt!322956)) (and (bvsge ((_ sign_extend 32) i!590) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle ((_ sign_extend 32) i!590) #b0000000000000000000000000000000000000000000000000000000001000000))))))

(declare-datatypes ((tuple2!17686 0))(
  ( (tuple2!17687 (_1!9498 BitStream!8252) (_2!9498 BitStream!8252)) )
))
(declare-fun lt!322953 () tuple2!17686)

(declare-datatypes ((tuple2!17688 0))(
  ( (tuple2!17689 (_1!9499 BitStream!8252) (_2!9499 (_ BitVec 64))) )
))
(declare-fun lt!322960 () tuple2!17688)

(declare-fun v!189 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8252 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17688)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!206755 (= lt!322960 (readNBitsLSBFirstsLoopPure!0 (_1!9498 lt!322953) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))))))

(declare-fun lt!322949 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!206755 (validate_offset_bits!1 ((_ sign_extend 32) (size!4572 (buf!5077 (_2!9497 lt!322955)))) ((_ sign_extend 32) (currentByte!9595 thiss!1204)) ((_ sign_extend 32) (currentBit!9590 thiss!1204)) lt!322949)))

(declare-fun lt!322952 () Unit!14738)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8252 array!10401 (_ BitVec 64)) Unit!14738)

(assert (=> b!206755 (= lt!322952 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5077 (_2!9497 lt!322955)) lt!322949))))

(declare-fun lt!322950 () Bool)

(assert (=> b!206755 (= (_2!9496 lt!322956) lt!322950)))

(declare-fun readBitPure!0 (BitStream!8252) tuple2!17682)

(assert (=> b!206755 (= lt!322956 (readBitPure!0 (_1!9498 lt!322953)))))

(declare-fun lt!322942 () tuple2!17686)

(declare-fun reader!0 (BitStream!8252 BitStream!8252) tuple2!17686)

(assert (=> b!206755 (= lt!322942 (reader!0 (_2!9497 lt!322961) (_2!9497 lt!322955)))))

(assert (=> b!206755 (= lt!322953 (reader!0 thiss!1204 (_2!9497 lt!322955)))))

(assert (=> b!206755 e!141354))

(declare-fun res!173400 () Bool)

(assert (=> b!206755 (=> (not res!173400) (not e!141354))))

(assert (=> b!206755 (= res!173400 (= (bitIndex!0 (size!4572 (buf!5077 (_1!9496 lt!322946))) (currentByte!9595 (_1!9496 lt!322946)) (currentBit!9590 (_1!9496 lt!322946))) (bitIndex!0 (size!4572 (buf!5077 (_1!9496 lt!322951))) (currentByte!9595 (_1!9496 lt!322951)) (currentBit!9590 (_1!9496 lt!322951)))))))

(declare-fun lt!322943 () Unit!14738)

(declare-fun lt!322954 () BitStream!8252)

(declare-fun readBitPrefixLemma!0 (BitStream!8252 BitStream!8252) Unit!14738)

(assert (=> b!206755 (= lt!322943 (readBitPrefixLemma!0 lt!322954 (_2!9497 lt!322955)))))

(assert (=> b!206755 (= lt!322951 (readBitPure!0 (BitStream!8253 (buf!5077 (_2!9497 lt!322955)) (currentByte!9595 thiss!1204) (currentBit!9590 thiss!1204))))))

(assert (=> b!206755 (= lt!322946 (readBitPure!0 lt!322954))))

(assert (=> b!206755 e!141349))

(declare-fun res!173389 () Bool)

(assert (=> b!206755 (=> (not res!173389) (not e!141349))))

(assert (=> b!206755 (= res!173389 (invariant!0 (currentBit!9590 thiss!1204) (currentByte!9595 thiss!1204) (size!4572 (buf!5077 (_2!9497 lt!322961)))))))

(assert (=> b!206755 (= lt!322954 (BitStream!8253 (buf!5077 (_2!9497 lt!322961)) (currentByte!9595 thiss!1204) (currentBit!9590 thiss!1204)))))

(declare-fun b!206756 () Bool)

(assert (=> b!206756 (= e!141347 e!141348)))

(declare-fun res!173399 () Bool)

(assert (=> b!206756 (=> (not res!173399) (not e!141348))))

(assert (=> b!206756 (= res!173399 (and (= (_2!9496 lt!322948) lt!322950) (= (_1!9496 lt!322948) (_2!9497 lt!322961))))))

(declare-fun readerFrom!0 (BitStream!8252 (_ BitVec 32) (_ BitVec 32)) BitStream!8252)

(assert (=> b!206756 (= lt!322948 (readBitPure!0 (readerFrom!0 (_2!9497 lt!322961) (currentBit!9590 thiss!1204) (currentByte!9595 thiss!1204))))))

(declare-fun b!206757 () Bool)

(declare-fun res!173393 () Bool)

(assert (=> b!206757 (=> (not res!173393) (not e!141346))))

(assert (=> b!206757 (= res!173393 (invariant!0 (currentBit!9590 thiss!1204) (currentByte!9595 thiss!1204) (size!4572 (buf!5077 thiss!1204))))))

(declare-fun b!206758 () Bool)

(assert (=> b!206758 (= e!141344 e!141346)))

(declare-fun res!173396 () Bool)

(assert (=> b!206758 (=> (not res!173396) (not e!141346))))

(assert (=> b!206758 (= res!173396 (validate_offset_bits!1 ((_ sign_extend 32) (size!4572 (buf!5077 thiss!1204))) ((_ sign_extend 32) (currentByte!9595 thiss!1204)) ((_ sign_extend 32) (currentBit!9590 thiss!1204)) lt!322949))))

(assert (=> b!206758 (= lt!322949 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!206759 () Bool)

(declare-fun e!141352 () Bool)

(assert (=> b!206759 (= e!141346 (not e!141352))))

(declare-fun res!173397 () Bool)

(assert (=> b!206759 (=> res!173397 e!141352)))

(declare-fun lt!322947 () (_ BitVec 64))

(assert (=> b!206759 (= res!173397 (not (= lt!322947 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!322957))))))

(assert (=> b!206759 (= lt!322947 (bitIndex!0 (size!4572 (buf!5077 (_2!9497 lt!322961))) (currentByte!9595 (_2!9497 lt!322961)) (currentBit!9590 (_2!9497 lt!322961))))))

(assert (=> b!206759 (= lt!322957 (bitIndex!0 (size!4572 (buf!5077 thiss!1204)) (currentByte!9595 thiss!1204) (currentBit!9590 thiss!1204)))))

(declare-fun e!141351 () Bool)

(assert (=> b!206759 e!141351))

(declare-fun res!173388 () Bool)

(assert (=> b!206759 (=> (not res!173388) (not e!141351))))

(assert (=> b!206759 (= res!173388 (= (size!4572 (buf!5077 thiss!1204)) (size!4572 (buf!5077 (_2!9497 lt!322961)))))))

(declare-fun appendBit!0 (BitStream!8252 Bool) tuple2!17684)

(assert (=> b!206759 (= lt!322961 (appendBit!0 thiss!1204 lt!322950))))

(assert (=> b!206759 (= lt!322950 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!206760 () Bool)

(declare-fun res!173391 () Bool)

(assert (=> b!206760 (=> res!173391 e!141345)))

(assert (=> b!206760 (= res!173391 (not (isPrefixOf!0 (_2!9497 lt!322961) (_2!9497 lt!322955))))))

(declare-fun b!206761 () Bool)

(assert (=> b!206761 (= e!141352 e!141345)))

(declare-fun res!173390 () Bool)

(assert (=> b!206761 (=> res!173390 e!141345)))

(assert (=> b!206761 (= res!173390 (not (= lt!322944 (bvsub (bvsub (bvadd lt!322947 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!206761 (= lt!322944 (bitIndex!0 (size!4572 (buf!5077 (_2!9497 lt!322955))) (currentByte!9595 (_2!9497 lt!322955)) (currentBit!9590 (_2!9497 lt!322955))))))

(assert (=> b!206761 (isPrefixOf!0 thiss!1204 (_2!9497 lt!322955))))

(declare-fun lt!322959 () Unit!14738)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8252 BitStream!8252 BitStream!8252) Unit!14738)

(assert (=> b!206761 (= lt!322959 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9497 lt!322961) (_2!9497 lt!322955)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8252 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17684)

(assert (=> b!206761 (= lt!322955 (appendBitsLSBFirstLoopTR!0 (_2!9497 lt!322961) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!206762 () Bool)

(assert (=> b!206762 (= e!141351 e!141347)))

(declare-fun res!173395 () Bool)

(assert (=> b!206762 (=> (not res!173395) (not e!141347))))

(declare-fun lt!322958 () (_ BitVec 64))

(assert (=> b!206762 (= res!173395 (= lt!322945 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!322958)))))

(assert (=> b!206762 (= lt!322945 (bitIndex!0 (size!4572 (buf!5077 (_2!9497 lt!322961))) (currentByte!9595 (_2!9497 lt!322961)) (currentBit!9590 (_2!9497 lt!322961))))))

(assert (=> b!206762 (= lt!322958 (bitIndex!0 (size!4572 (buf!5077 thiss!1204)) (currentByte!9595 thiss!1204) (currentBit!9590 thiss!1204)))))

(declare-fun b!206763 () Bool)

(declare-fun res!173402 () Bool)

(assert (=> b!206763 (=> res!173402 e!141345)))

(assert (=> b!206763 (= res!173402 (not (isPrefixOf!0 thiss!1204 (_2!9497 lt!322961))))))

(assert (= (and start!43618 res!173401) b!206758))

(assert (= (and b!206758 res!173396) b!206757))

(assert (= (and b!206757 res!173393) b!206754))

(assert (= (and b!206754 res!173387) b!206759))

(assert (= (and b!206759 res!173388) b!206762))

(assert (= (and b!206762 res!173395) b!206749))

(assert (= (and b!206749 res!173394) b!206756))

(assert (= (and b!206756 res!173399) b!206751))

(assert (= (and b!206759 (not res!173397)) b!206761))

(assert (= (and b!206761 (not res!173390)) b!206752))

(assert (= (and b!206752 (not res!173398)) b!206753))

(assert (= (and b!206753 (not res!173392)) b!206760))

(assert (= (and b!206760 (not res!173391)) b!206763))

(assert (= (and b!206763 (not res!173402)) b!206755))

(assert (= (and b!206755 res!173389) b!206750))

(assert (= (and b!206755 res!173400) b!206747))

(assert (= start!43618 b!206748))

(declare-fun m!318343 () Bool)

(assert (=> b!206755 m!318343))

(declare-fun m!318345 () Bool)

(assert (=> b!206755 m!318345))

(declare-fun m!318347 () Bool)

(assert (=> b!206755 m!318347))

(declare-fun m!318349 () Bool)

(assert (=> b!206755 m!318349))

(declare-fun m!318351 () Bool)

(assert (=> b!206755 m!318351))

(declare-fun m!318353 () Bool)

(assert (=> b!206755 m!318353))

(declare-fun m!318355 () Bool)

(assert (=> b!206755 m!318355))

(declare-fun m!318357 () Bool)

(assert (=> b!206755 m!318357))

(declare-fun m!318359 () Bool)

(assert (=> b!206755 m!318359))

(declare-fun m!318361 () Bool)

(assert (=> b!206755 m!318361))

(declare-fun m!318363 () Bool)

(assert (=> b!206755 m!318363))

(declare-fun m!318365 () Bool)

(assert (=> b!206755 m!318365))

(declare-fun m!318367 () Bool)

(assert (=> b!206755 m!318367))

(declare-fun m!318369 () Bool)

(assert (=> b!206756 m!318369))

(assert (=> b!206756 m!318369))

(declare-fun m!318371 () Bool)

(assert (=> b!206756 m!318371))

(declare-fun m!318373 () Bool)

(assert (=> b!206759 m!318373))

(declare-fun m!318375 () Bool)

(assert (=> b!206759 m!318375))

(declare-fun m!318377 () Bool)

(assert (=> b!206759 m!318377))

(declare-fun m!318379 () Bool)

(assert (=> b!206757 m!318379))

(declare-fun m!318381 () Bool)

(assert (=> b!206763 m!318381))

(assert (=> b!206762 m!318373))

(assert (=> b!206762 m!318375))

(declare-fun m!318383 () Bool)

(assert (=> b!206752 m!318383))

(assert (=> b!206749 m!318381))

(declare-fun m!318385 () Bool)

(assert (=> b!206760 m!318385))

(declare-fun m!318387 () Bool)

(assert (=> b!206751 m!318387))

(declare-fun m!318389 () Bool)

(assert (=> start!43618 m!318389))

(declare-fun m!318391 () Bool)

(assert (=> b!206761 m!318391))

(declare-fun m!318393 () Bool)

(assert (=> b!206761 m!318393))

(declare-fun m!318395 () Bool)

(assert (=> b!206761 m!318395))

(declare-fun m!318397 () Bool)

(assert (=> b!206761 m!318397))

(declare-fun m!318399 () Bool)

(assert (=> b!206750 m!318399))

(declare-fun m!318401 () Bool)

(assert (=> b!206748 m!318401))

(declare-fun m!318403 () Bool)

(assert (=> b!206758 m!318403))

(push 1)

(assert (not b!206758))

(assert (not b!206748))

(assert (not b!206757))

(assert (not b!206759))

(assert (not b!206750))

(assert (not b!206763))

(assert (not b!206749))

(assert (not b!206752))

(assert (not b!206755))

(assert (not b!206751))

(assert (not b!206760))

(assert (not b!206761))

(assert (not b!206762))

(assert (not b!206756))

(assert (not start!43618))

(check-sat)

(pop 1)

(push 1)

(check-sat)

