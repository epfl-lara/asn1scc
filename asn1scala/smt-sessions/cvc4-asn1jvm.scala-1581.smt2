; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44836 () Bool)

(assert start!44836)

(declare-fun b!215536 () Bool)

(declare-fun e!146650 () Bool)

(declare-fun e!146651 () Bool)

(assert (=> b!215536 (= e!146650 (not e!146651))))

(declare-fun res!181341 () Bool)

(assert (=> b!215536 (=> res!181341 e!146651)))

(declare-fun lt!340325 () (_ BitVec 64))

(declare-fun lt!340311 () (_ BitVec 64))

(assert (=> b!215536 (= res!181341 (not (= lt!340325 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!340311))))))

(declare-datatypes ((array!10599 0))(
  ( (array!10600 (arr!5586 (Array (_ BitVec 32) (_ BitVec 8))) (size!4656 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8420 0))(
  ( (BitStream!8421 (buf!5191 array!10599) (currentByte!9769 (_ BitVec 32)) (currentBit!9764 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!15296 0))(
  ( (Unit!15297) )
))
(declare-datatypes ((tuple2!18474 0))(
  ( (tuple2!18475 (_1!9892 Unit!15296) (_2!9892 BitStream!8420)) )
))
(declare-fun lt!340324 () tuple2!18474)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!215536 (= lt!340325 (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!340324))) (currentByte!9769 (_2!9892 lt!340324)) (currentBit!9764 (_2!9892 lt!340324))))))

(declare-fun thiss!1204 () BitStream!8420)

(assert (=> b!215536 (= lt!340311 (bitIndex!0 (size!4656 (buf!5191 thiss!1204)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204)))))

(declare-fun e!146645 () Bool)

(assert (=> b!215536 e!146645))

(declare-fun res!181332 () Bool)

(assert (=> b!215536 (=> (not res!181332) (not e!146645))))

(assert (=> b!215536 (= res!181332 (= (size!4656 (buf!5191 thiss!1204)) (size!4656 (buf!5191 (_2!9892 lt!340324)))))))

(declare-fun lt!340304 () Bool)

(declare-fun appendBit!0 (BitStream!8420 Bool) tuple2!18474)

(assert (=> b!215536 (= lt!340324 (appendBit!0 thiss!1204 lt!340304))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun lt!340300 () (_ BitVec 64))

(assert (=> b!215536 (= lt!340304 (not (= (bvand v!189 lt!340300) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!215536 (= lt!340300 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!215537 () Bool)

(declare-fun e!146644 () Bool)

(assert (=> b!215537 (= e!146645 e!146644)))

(declare-fun res!181335 () Bool)

(assert (=> b!215537 (=> (not res!181335) (not e!146644))))

(declare-fun lt!340305 () (_ BitVec 64))

(declare-fun lt!340313 () (_ BitVec 64))

(assert (=> b!215537 (= res!181335 (= lt!340305 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!340313)))))

(assert (=> b!215537 (= lt!340305 (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!340324))) (currentByte!9769 (_2!9892 lt!340324)) (currentBit!9764 (_2!9892 lt!340324))))))

(assert (=> b!215537 (= lt!340313 (bitIndex!0 (size!4656 (buf!5191 thiss!1204)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204)))))

(declare-fun b!215539 () Bool)

(declare-fun res!181340 () Bool)

(assert (=> b!215539 (=> (not res!181340) (not e!146644))))

(declare-fun isPrefixOf!0 (BitStream!8420 BitStream!8420) Bool)

(assert (=> b!215539 (= res!181340 (isPrefixOf!0 thiss!1204 (_2!9892 lt!340324)))))

(declare-fun b!215540 () Bool)

(declare-fun e!146658 () Bool)

(assert (=> b!215540 (= e!146644 e!146658)))

(declare-fun res!181337 () Bool)

(assert (=> b!215540 (=> (not res!181337) (not e!146658))))

(declare-datatypes ((tuple2!18476 0))(
  ( (tuple2!18477 (_1!9893 BitStream!8420) (_2!9893 Bool)) )
))
(declare-fun lt!340309 () tuple2!18476)

(assert (=> b!215540 (= res!181337 (and (= (_2!9893 lt!340309) lt!340304) (= (_1!9893 lt!340309) (_2!9892 lt!340324))))))

(declare-fun readBitPure!0 (BitStream!8420) tuple2!18476)

(declare-fun readerFrom!0 (BitStream!8420 (_ BitVec 32) (_ BitVec 32)) BitStream!8420)

(assert (=> b!215540 (= lt!340309 (readBitPure!0 (readerFrom!0 (_2!9892 lt!340324) (currentBit!9764 thiss!1204) (currentByte!9769 thiss!1204))))))

(declare-fun b!215541 () Bool)

(declare-fun e!146654 () Bool)

(declare-fun e!146657 () Bool)

(assert (=> b!215541 (= e!146654 e!146657)))

(declare-fun res!181325 () Bool)

(assert (=> b!215541 (=> res!181325 e!146657)))

(declare-datatypes ((tuple2!18478 0))(
  ( (tuple2!18479 (_1!9894 BitStream!8420) (_2!9894 (_ BitVec 64))) )
))
(declare-fun lt!340301 () tuple2!18478)

(declare-datatypes ((tuple2!18480 0))(
  ( (tuple2!18481 (_1!9895 BitStream!8420) (_2!9895 BitStream!8420)) )
))
(declare-fun lt!340310 () tuple2!18480)

(assert (=> b!215541 (= res!181325 (not (= (_1!9894 lt!340301) (_2!9895 lt!340310))))))

(declare-fun lt!340322 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8420 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18478)

(assert (=> b!215541 (= lt!340301 (readNBitsLSBFirstsLoopPure!0 (_1!9895 lt!340310) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!340322))))

(declare-fun lt!340308 () tuple2!18474)

(declare-fun lt!340315 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!215541 (validate_offset_bits!1 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!340308)))) ((_ sign_extend 32) (currentByte!9769 (_2!9892 lt!340324))) ((_ sign_extend 32) (currentBit!9764 (_2!9892 lt!340324))) lt!340315)))

(declare-fun lt!340319 () Unit!15296)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8420 array!10599 (_ BitVec 64)) Unit!15296)

(assert (=> b!215541 (= lt!340319 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9892 lt!340324) (buf!5191 (_2!9892 lt!340308)) lt!340315))))

(assert (=> b!215541 (= lt!340315 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!340307 () (_ BitVec 64))

(declare-fun lt!340306 () tuple2!18476)

(assert (=> b!215541 (= lt!340322 (bvor lt!340307 (ite (_2!9893 lt!340306) lt!340300 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!340318 () tuple2!18480)

(declare-fun lt!340314 () tuple2!18478)

(assert (=> b!215541 (= lt!340314 (readNBitsLSBFirstsLoopPure!0 (_1!9895 lt!340318) nBits!348 i!590 lt!340307))))

(declare-fun lt!340327 () (_ BitVec 64))

(assert (=> b!215541 (validate_offset_bits!1 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!340308)))) ((_ sign_extend 32) (currentByte!9769 thiss!1204)) ((_ sign_extend 32) (currentBit!9764 thiss!1204)) lt!340327)))

(declare-fun lt!340317 () Unit!15296)

(assert (=> b!215541 (= lt!340317 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5191 (_2!9892 lt!340308)) lt!340327))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!215541 (= lt!340307 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!215541 (= (_2!9893 lt!340306) lt!340304)))

(assert (=> b!215541 (= lt!340306 (readBitPure!0 (_1!9895 lt!340318)))))

(declare-fun reader!0 (BitStream!8420 BitStream!8420) tuple2!18480)

(assert (=> b!215541 (= lt!340310 (reader!0 (_2!9892 lt!340324) (_2!9892 lt!340308)))))

(assert (=> b!215541 (= lt!340318 (reader!0 thiss!1204 (_2!9892 lt!340308)))))

(declare-fun e!146648 () Bool)

(assert (=> b!215541 e!146648))

(declare-fun res!181345 () Bool)

(assert (=> b!215541 (=> (not res!181345) (not e!146648))))

(declare-fun lt!340303 () tuple2!18476)

(declare-fun lt!340328 () tuple2!18476)

(assert (=> b!215541 (= res!181345 (= (bitIndex!0 (size!4656 (buf!5191 (_1!9893 lt!340303))) (currentByte!9769 (_1!9893 lt!340303)) (currentBit!9764 (_1!9893 lt!340303))) (bitIndex!0 (size!4656 (buf!5191 (_1!9893 lt!340328))) (currentByte!9769 (_1!9893 lt!340328)) (currentBit!9764 (_1!9893 lt!340328)))))))

(declare-fun lt!340312 () Unit!15296)

(declare-fun lt!340323 () BitStream!8420)

(declare-fun readBitPrefixLemma!0 (BitStream!8420 BitStream!8420) Unit!15296)

(assert (=> b!215541 (= lt!340312 (readBitPrefixLemma!0 lt!340323 (_2!9892 lt!340308)))))

(assert (=> b!215541 (= lt!340328 (readBitPure!0 (BitStream!8421 (buf!5191 (_2!9892 lt!340308)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204))))))

(assert (=> b!215541 (= lt!340303 (readBitPure!0 lt!340323))))

(declare-fun e!146656 () Bool)

(assert (=> b!215541 e!146656))

(declare-fun res!181339 () Bool)

(assert (=> b!215541 (=> (not res!181339) (not e!146656))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!215541 (= res!181339 (invariant!0 (currentBit!9764 thiss!1204) (currentByte!9769 thiss!1204) (size!4656 (buf!5191 (_2!9892 lt!340324)))))))

(assert (=> b!215541 (= lt!340323 (BitStream!8421 (buf!5191 (_2!9892 lt!340324)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204)))))

(declare-fun b!215542 () Bool)

(assert (=> b!215542 (= e!146656 (invariant!0 (currentBit!9764 thiss!1204) (currentByte!9769 thiss!1204) (size!4656 (buf!5191 (_2!9892 lt!340308)))))))

(declare-fun b!215543 () Bool)

(declare-fun res!181333 () Bool)

(declare-fun e!146649 () Bool)

(assert (=> b!215543 (=> (not res!181333) (not e!146649))))

(declare-fun lt!340320 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!8420 (_ BitVec 64)) BitStream!8420)

(assert (=> b!215543 (= res!181333 (= (_1!9895 lt!340318) (withMovedBitIndex!0 (_2!9895 lt!340318) (bvsub lt!340311 lt!340320))))))

(declare-fun b!215544 () Bool)

(declare-fun e!146652 () Bool)

(assert (=> b!215544 (= e!146652 (= (_1!9894 lt!340314) (_2!9895 lt!340318)))))

(declare-fun b!215545 () Bool)

(declare-fun e!146647 () Bool)

(assert (=> b!215545 (= e!146647 e!146650)))

(declare-fun res!181328 () Bool)

(assert (=> b!215545 (=> (not res!181328) (not e!146650))))

(assert (=> b!215545 (= res!181328 (validate_offset_bits!1 ((_ sign_extend 32) (size!4656 (buf!5191 thiss!1204))) ((_ sign_extend 32) (currentByte!9769 thiss!1204)) ((_ sign_extend 32) (currentBit!9764 thiss!1204)) lt!340327))))

(assert (=> b!215545 (= lt!340327 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!215546 () Bool)

(declare-fun res!181334 () Bool)

(assert (=> b!215546 (=> res!181334 e!146654)))

(assert (=> b!215546 (= res!181334 (or (not (= (size!4656 (buf!5191 (_2!9892 lt!340308))) (size!4656 (buf!5191 thiss!1204)))) (not (= lt!340320 (bvsub (bvadd lt!340311 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!215547 () Bool)

(assert (=> b!215547 (= e!146648 (= (_2!9893 lt!340303) (_2!9893 lt!340328)))))

(declare-fun b!215548 () Bool)

(declare-fun res!181346 () Bool)

(assert (=> b!215548 (=> res!181346 e!146654)))

(assert (=> b!215548 (= res!181346 (not (invariant!0 (currentBit!9764 (_2!9892 lt!340308)) (currentByte!9769 (_2!9892 lt!340308)) (size!4656 (buf!5191 (_2!9892 lt!340308))))))))

(declare-fun b!215549 () Bool)

(declare-fun e!146655 () Bool)

(declare-fun array_inv!4397 (array!10599) Bool)

(assert (=> b!215549 (= e!146655 (array_inv!4397 (buf!5191 thiss!1204)))))

(declare-fun res!181344 () Bool)

(assert (=> start!44836 (=> (not res!181344) (not e!146647))))

(assert (=> start!44836 (= res!181344 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!44836 e!146647))

(assert (=> start!44836 true))

(declare-fun inv!12 (BitStream!8420) Bool)

(assert (=> start!44836 (and (inv!12 thiss!1204) e!146655)))

(declare-fun b!215538 () Bool)

(declare-fun res!181342 () Bool)

(declare-fun e!146653 () Bool)

(assert (=> b!215538 (=> res!181342 e!146653)))

(assert (=> b!215538 (= res!181342 (not (= (bitIndex!0 (size!4656 (buf!5191 (_1!9894 lt!340314))) (currentByte!9769 (_1!9894 lt!340314)) (currentBit!9764 (_1!9894 lt!340314))) (bitIndex!0 (size!4656 (buf!5191 (_2!9895 lt!340318))) (currentByte!9769 (_2!9895 lt!340318)) (currentBit!9764 (_2!9895 lt!340318))))))))

(declare-fun b!215550 () Bool)

(assert (=> b!215550 (= e!146658 (= (bitIndex!0 (size!4656 (buf!5191 (_1!9893 lt!340309))) (currentByte!9769 (_1!9893 lt!340309)) (currentBit!9764 (_1!9893 lt!340309))) lt!340305))))

(declare-fun b!215551 () Bool)

(declare-fun res!181331 () Bool)

(assert (=> b!215551 (=> res!181331 e!146654)))

(assert (=> b!215551 (= res!181331 (not (isPrefixOf!0 thiss!1204 (_2!9892 lt!340324))))))

(declare-fun b!215552 () Bool)

(declare-fun res!181326 () Bool)

(assert (=> b!215552 (=> res!181326 e!146654)))

(assert (=> b!215552 (= res!181326 (not (isPrefixOf!0 (_2!9892 lt!340324) (_2!9892 lt!340308))))))

(declare-fun b!215553 () Bool)

(declare-fun res!181327 () Bool)

(assert (=> b!215553 (=> (not res!181327) (not e!146650))))

(assert (=> b!215553 (= res!181327 (not (= i!590 nBits!348)))))

(declare-fun b!215554 () Bool)

(declare-fun res!181336 () Bool)

(assert (=> b!215554 (=> (not res!181336) (not e!146650))))

(assert (=> b!215554 (= res!181336 (invariant!0 (currentBit!9764 thiss!1204) (currentByte!9769 thiss!1204) (size!4656 (buf!5191 thiss!1204))))))

(declare-fun b!215555 () Bool)

(assert (=> b!215555 (= e!146651 e!146654)))

(declare-fun res!181338 () Bool)

(assert (=> b!215555 (=> res!181338 e!146654)))

(assert (=> b!215555 (= res!181338 (not (= lt!340320 (bvsub (bvsub (bvadd lt!340325 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!215555 (= lt!340320 (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!340308))) (currentByte!9769 (_2!9892 lt!340308)) (currentBit!9764 (_2!9892 lt!340308))))))

(assert (=> b!215555 (isPrefixOf!0 thiss!1204 (_2!9892 lt!340308))))

(declare-fun lt!340302 () Unit!15296)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8420 BitStream!8420 BitStream!8420) Unit!15296)

(assert (=> b!215555 (= lt!340302 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9892 lt!340324) (_2!9892 lt!340308)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8420 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!18474)

(assert (=> b!215555 (= lt!340308 (appendBitsLSBFirstLoopTR!0 (_2!9892 lt!340324) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!215556 () Bool)

(assert (=> b!215556 (= e!146657 e!146653)))

(declare-fun res!181324 () Bool)

(assert (=> b!215556 (=> res!181324 e!146653)))

(declare-fun lt!340326 () BitStream!8420)

(assert (=> b!215556 (= res!181324 (not (= (_1!9895 lt!340310) lt!340326)))))

(assert (=> b!215556 e!146649))

(declare-fun res!181329 () Bool)

(assert (=> b!215556 (=> (not res!181329) (not e!146649))))

(declare-fun lt!340321 () tuple2!18478)

(assert (=> b!215556 (= res!181329 (and (= (_2!9894 lt!340314) (_2!9894 lt!340321)) (= (_1!9894 lt!340314) (_1!9894 lt!340321))))))

(declare-fun lt!340316 () Unit!15296)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8420 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!15296)

(assert (=> b!215556 (= lt!340316 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9895 lt!340318) nBits!348 i!590 lt!340307))))

(assert (=> b!215556 (= lt!340321 (readNBitsLSBFirstsLoopPure!0 lt!340326 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!340322))))

(assert (=> b!215556 (= lt!340326 (withMovedBitIndex!0 (_1!9895 lt!340318) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!215557 () Bool)

(assert (=> b!215557 (= e!146649 (and (= lt!340311 (bvsub lt!340325 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!9895 lt!340310) lt!340326)) (= (_2!9894 lt!340314) (_2!9894 lt!340301)))))))

(declare-fun b!215558 () Bool)

(declare-fun res!181330 () Bool)

(assert (=> b!215558 (=> (not res!181330) (not e!146649))))

(assert (=> b!215558 (= res!181330 (= (_1!9895 lt!340310) (withMovedBitIndex!0 (_2!9895 lt!340310) (bvsub lt!340325 lt!340320))))))

(declare-fun b!215559 () Bool)

(assert (=> b!215559 (= e!146653 e!146652)))

(declare-fun res!181343 () Bool)

(assert (=> b!215559 (=> (not res!181343) (not e!146652))))

(assert (=> b!215559 (= res!181343 (= (_2!9894 lt!340314) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!215559 (= (size!4656 (buf!5191 thiss!1204)) (size!4656 (buf!5191 (_2!9892 lt!340308))))))

(assert (= (and start!44836 res!181344) b!215545))

(assert (= (and b!215545 res!181328) b!215554))

(assert (= (and b!215554 res!181336) b!215553))

(assert (= (and b!215553 res!181327) b!215536))

(assert (= (and b!215536 res!181332) b!215537))

(assert (= (and b!215537 res!181335) b!215539))

(assert (= (and b!215539 res!181340) b!215540))

(assert (= (and b!215540 res!181337) b!215550))

(assert (= (and b!215536 (not res!181341)) b!215555))

(assert (= (and b!215555 (not res!181338)) b!215548))

(assert (= (and b!215548 (not res!181346)) b!215546))

(assert (= (and b!215546 (not res!181334)) b!215552))

(assert (= (and b!215552 (not res!181326)) b!215551))

(assert (= (and b!215551 (not res!181331)) b!215541))

(assert (= (and b!215541 res!181339) b!215542))

(assert (= (and b!215541 res!181345) b!215547))

(assert (= (and b!215541 (not res!181325)) b!215556))

(assert (= (and b!215556 res!181329) b!215543))

(assert (= (and b!215543 res!181333) b!215558))

(assert (= (and b!215558 res!181330) b!215557))

(assert (= (and b!215556 (not res!181324)) b!215538))

(assert (= (and b!215538 (not res!181342)) b!215559))

(assert (= (and b!215559 res!181343) b!215544))

(assert (= start!44836 b!215549))

(declare-fun m!331791 () Bool)

(assert (=> b!215554 m!331791))

(declare-fun m!331793 () Bool)

(assert (=> b!215559 m!331793))

(declare-fun m!331795 () Bool)

(assert (=> b!215536 m!331795))

(declare-fun m!331797 () Bool)

(assert (=> b!215536 m!331797))

(declare-fun m!331799 () Bool)

(assert (=> b!215536 m!331799))

(declare-fun m!331801 () Bool)

(assert (=> b!215551 m!331801))

(assert (=> b!215539 m!331801))

(assert (=> b!215537 m!331795))

(assert (=> b!215537 m!331797))

(declare-fun m!331803 () Bool)

(assert (=> b!215555 m!331803))

(declare-fun m!331805 () Bool)

(assert (=> b!215555 m!331805))

(declare-fun m!331807 () Bool)

(assert (=> b!215555 m!331807))

(declare-fun m!331809 () Bool)

(assert (=> b!215555 m!331809))

(declare-fun m!331811 () Bool)

(assert (=> b!215545 m!331811))

(declare-fun m!331813 () Bool)

(assert (=> b!215540 m!331813))

(assert (=> b!215540 m!331813))

(declare-fun m!331815 () Bool)

(assert (=> b!215540 m!331815))

(declare-fun m!331817 () Bool)

(assert (=> b!215541 m!331817))

(declare-fun m!331819 () Bool)

(assert (=> b!215541 m!331819))

(declare-fun m!331821 () Bool)

(assert (=> b!215541 m!331821))

(declare-fun m!331823 () Bool)

(assert (=> b!215541 m!331823))

(declare-fun m!331825 () Bool)

(assert (=> b!215541 m!331825))

(declare-fun m!331827 () Bool)

(assert (=> b!215541 m!331827))

(declare-fun m!331829 () Bool)

(assert (=> b!215541 m!331829))

(declare-fun m!331831 () Bool)

(assert (=> b!215541 m!331831))

(declare-fun m!331833 () Bool)

(assert (=> b!215541 m!331833))

(declare-fun m!331835 () Bool)

(assert (=> b!215541 m!331835))

(declare-fun m!331837 () Bool)

(assert (=> b!215541 m!331837))

(declare-fun m!331839 () Bool)

(assert (=> b!215541 m!331839))

(declare-fun m!331841 () Bool)

(assert (=> b!215541 m!331841))

(declare-fun m!331843 () Bool)

(assert (=> b!215541 m!331843))

(declare-fun m!331845 () Bool)

(assert (=> b!215541 m!331845))

(declare-fun m!331847 () Bool)

(assert (=> b!215541 m!331847))

(declare-fun m!331849 () Bool)

(assert (=> b!215542 m!331849))

(declare-fun m!331851 () Bool)

(assert (=> b!215548 m!331851))

(declare-fun m!331853 () Bool)

(assert (=> b!215549 m!331853))

(declare-fun m!331855 () Bool)

(assert (=> b!215556 m!331855))

(declare-fun m!331857 () Bool)

(assert (=> b!215556 m!331857))

(declare-fun m!331859 () Bool)

(assert (=> b!215556 m!331859))

(declare-fun m!331861 () Bool)

(assert (=> b!215550 m!331861))

(declare-fun m!331863 () Bool)

(assert (=> b!215543 m!331863))

(declare-fun m!331865 () Bool)

(assert (=> b!215552 m!331865))

(declare-fun m!331867 () Bool)

(assert (=> b!215538 m!331867))

(declare-fun m!331869 () Bool)

(assert (=> b!215538 m!331869))

(declare-fun m!331871 () Bool)

(assert (=> b!215558 m!331871))

(declare-fun m!331873 () Bool)

(assert (=> start!44836 m!331873))

(push 1)

(assert (not b!215556))

(assert (not b!215550))

(assert (not b!215554))

(assert (not b!215536))

(assert (not b!215540))

(assert (not b!215559))

(assert (not b!215543))

(assert (not b!215551))

(assert (not b!215548))

(assert (not b!215545))

(assert (not b!215539))

(assert (not b!215558))

(assert (not b!215542))

(assert (not b!215537))

(assert (not b!215549))

(assert (not b!215555))

(assert (not b!215538))

(assert (not b!215552))

(assert (not start!44836))

(assert (not b!215541))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!72559 () Bool)

(assert (=> d!72559 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9764 thiss!1204) (currentByte!9769 thiss!1204) (size!4656 (buf!5191 thiss!1204))))))

(declare-fun bs!17803 () Bool)

(assert (= bs!17803 d!72559))

(assert (=> bs!17803 m!331791))

(assert (=> start!44836 d!72559))

(declare-fun d!72561 () Bool)

(declare-fun res!181408 () Bool)

(declare-fun e!146701 () Bool)

(assert (=> d!72561 (=> (not res!181408) (not e!146701))))

(assert (=> d!72561 (= res!181408 (= (size!4656 (buf!5191 (_2!9892 lt!340324))) (size!4656 (buf!5191 (_2!9892 lt!340308)))))))

(assert (=> d!72561 (= (isPrefixOf!0 (_2!9892 lt!340324) (_2!9892 lt!340308)) e!146701)))

(declare-fun b!215628 () Bool)

(declare-fun res!181409 () Bool)

(assert (=> b!215628 (=> (not res!181409) (not e!146701))))

(assert (=> b!215628 (= res!181409 (bvsle (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!340324))) (currentByte!9769 (_2!9892 lt!340324)) (currentBit!9764 (_2!9892 lt!340324))) (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!340308))) (currentByte!9769 (_2!9892 lt!340308)) (currentBit!9764 (_2!9892 lt!340308)))))))

(declare-fun b!215629 () Bool)

(declare-fun e!146700 () Bool)

(assert (=> b!215629 (= e!146701 e!146700)))

(declare-fun res!181410 () Bool)

(assert (=> b!215629 (=> res!181410 e!146700)))

(assert (=> b!215629 (= res!181410 (= (size!4656 (buf!5191 (_2!9892 lt!340324))) #b00000000000000000000000000000000))))

(declare-fun b!215630 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10599 array!10599 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!215630 (= e!146700 (arrayBitRangesEq!0 (buf!5191 (_2!9892 lt!340324)) (buf!5191 (_2!9892 lt!340308)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!340324))) (currentByte!9769 (_2!9892 lt!340324)) (currentBit!9764 (_2!9892 lt!340324)))))))

(assert (= (and d!72561 res!181408) b!215628))

(assert (= (and b!215628 res!181409) b!215629))

(assert (= (and b!215629 (not res!181410)) b!215630))

(assert (=> b!215628 m!331795))

(assert (=> b!215628 m!331803))

(assert (=> b!215630 m!331795))

(assert (=> b!215630 m!331795))

(declare-fun m!332023 () Bool)

(assert (=> b!215630 m!332023))

(assert (=> b!215552 d!72561))

(declare-fun b!215667 () Bool)

(declare-fun res!181445 () Bool)

(declare-fun e!146723 () Bool)

(assert (=> b!215667 (=> (not res!181445) (not e!146723))))

(declare-fun lt!340630 () tuple2!18480)

(assert (=> b!215667 (= res!181445 (isPrefixOf!0 (_2!9895 lt!340630) (_2!9892 lt!340308)))))

(declare-fun b!215668 () Bool)

(declare-fun e!146722 () Unit!15296)

(declare-fun lt!340633 () Unit!15296)

(assert (=> b!215668 (= e!146722 lt!340633)))

(declare-fun lt!340627 () (_ BitVec 64))

(assert (=> b!215668 (= lt!340627 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!340637 () (_ BitVec 64))

(assert (=> b!215668 (= lt!340637 (bitIndex!0 (size!4656 (buf!5191 thiss!1204)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!10599 array!10599 (_ BitVec 64) (_ BitVec 64)) Unit!15296)

(assert (=> b!215668 (= lt!340633 (arrayBitRangesEqSymmetric!0 (buf!5191 thiss!1204) (buf!5191 (_2!9892 lt!340308)) lt!340627 lt!340637))))

(assert (=> b!215668 (arrayBitRangesEq!0 (buf!5191 (_2!9892 lt!340308)) (buf!5191 thiss!1204) lt!340627 lt!340637)))

(declare-fun b!215669 () Bool)

(declare-fun Unit!15311 () Unit!15296)

(assert (=> b!215669 (= e!146722 Unit!15311)))

(declare-fun lt!340634 () (_ BitVec 64))

(declare-fun b!215670 () Bool)

(declare-fun lt!340640 () (_ BitVec 64))

(assert (=> b!215670 (= e!146723 (= (_1!9895 lt!340630) (withMovedBitIndex!0 (_2!9895 lt!340630) (bvsub lt!340640 lt!340634))))))

(assert (=> b!215670 (or (= (bvand lt!340640 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!340634 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!340640 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!340640 lt!340634) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!215670 (= lt!340634 (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!340308))) (currentByte!9769 (_2!9892 lt!340308)) (currentBit!9764 (_2!9892 lt!340308))))))

(assert (=> b!215670 (= lt!340640 (bitIndex!0 (size!4656 (buf!5191 thiss!1204)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204)))))

(declare-fun d!72563 () Bool)

(assert (=> d!72563 e!146723))

(declare-fun res!181444 () Bool)

(assert (=> d!72563 (=> (not res!181444) (not e!146723))))

(assert (=> d!72563 (= res!181444 (isPrefixOf!0 (_1!9895 lt!340630) (_2!9895 lt!340630)))))

(declare-fun lt!340643 () BitStream!8420)

(assert (=> d!72563 (= lt!340630 (tuple2!18481 lt!340643 (_2!9892 lt!340308)))))

(declare-fun lt!340636 () Unit!15296)

(declare-fun lt!340642 () Unit!15296)

(assert (=> d!72563 (= lt!340636 lt!340642)))

(assert (=> d!72563 (isPrefixOf!0 lt!340643 (_2!9892 lt!340308))))

(assert (=> d!72563 (= lt!340642 (lemmaIsPrefixTransitive!0 lt!340643 (_2!9892 lt!340308) (_2!9892 lt!340308)))))

(declare-fun lt!340631 () Unit!15296)

(declare-fun lt!340639 () Unit!15296)

(assert (=> d!72563 (= lt!340631 lt!340639)))

(assert (=> d!72563 (isPrefixOf!0 lt!340643 (_2!9892 lt!340308))))

(assert (=> d!72563 (= lt!340639 (lemmaIsPrefixTransitive!0 lt!340643 thiss!1204 (_2!9892 lt!340308)))))

(declare-fun lt!340641 () Unit!15296)

(assert (=> d!72563 (= lt!340641 e!146722)))

(declare-fun c!10515 () Bool)

(assert (=> d!72563 (= c!10515 (not (= (size!4656 (buf!5191 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!340626 () Unit!15296)

(declare-fun lt!340638 () Unit!15296)

(assert (=> d!72563 (= lt!340626 lt!340638)))

(assert (=> d!72563 (isPrefixOf!0 (_2!9892 lt!340308) (_2!9892 lt!340308))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8420) Unit!15296)

(assert (=> d!72563 (= lt!340638 (lemmaIsPrefixRefl!0 (_2!9892 lt!340308)))))

(declare-fun lt!340635 () Unit!15296)

(declare-fun lt!340625 () Unit!15296)

(assert (=> d!72563 (= lt!340635 lt!340625)))

(assert (=> d!72563 (= lt!340625 (lemmaIsPrefixRefl!0 (_2!9892 lt!340308)))))

(declare-fun lt!340628 () Unit!15296)

(declare-fun lt!340629 () Unit!15296)

(assert (=> d!72563 (= lt!340628 lt!340629)))

(assert (=> d!72563 (isPrefixOf!0 lt!340643 lt!340643)))

(assert (=> d!72563 (= lt!340629 (lemmaIsPrefixRefl!0 lt!340643))))

(declare-fun lt!340632 () Unit!15296)

(declare-fun lt!340624 () Unit!15296)

(assert (=> d!72563 (= lt!340632 lt!340624)))

(assert (=> d!72563 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!72563 (= lt!340624 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!72563 (= lt!340643 (BitStream!8421 (buf!5191 (_2!9892 lt!340308)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204)))))

(assert (=> d!72563 (isPrefixOf!0 thiss!1204 (_2!9892 lt!340308))))

(assert (=> d!72563 (= (reader!0 thiss!1204 (_2!9892 lt!340308)) lt!340630)))

(declare-fun b!215671 () Bool)

(declare-fun res!181443 () Bool)

(assert (=> b!215671 (=> (not res!181443) (not e!146723))))

(assert (=> b!215671 (= res!181443 (isPrefixOf!0 (_1!9895 lt!340630) thiss!1204))))

(assert (= (and d!72563 c!10515) b!215668))

(assert (= (and d!72563 (not c!10515)) b!215669))

(assert (= (and d!72563 res!181444) b!215671))

(assert (= (and b!215671 res!181443) b!215667))

(assert (= (and b!215667 res!181445) b!215670))

(declare-fun m!332053 () Bool)

(assert (=> b!215670 m!332053))

(assert (=> b!215670 m!331803))

(assert (=> b!215670 m!331797))

(declare-fun m!332055 () Bool)

(assert (=> b!215671 m!332055))

(declare-fun m!332057 () Bool)

(assert (=> b!215667 m!332057))

(assert (=> d!72563 m!331805))

(declare-fun m!332059 () Bool)

(assert (=> d!72563 m!332059))

(declare-fun m!332061 () Bool)

(assert (=> d!72563 m!332061))

(declare-fun m!332063 () Bool)

(assert (=> d!72563 m!332063))

(declare-fun m!332065 () Bool)

(assert (=> d!72563 m!332065))

(declare-fun m!332067 () Bool)

(assert (=> d!72563 m!332067))

(declare-fun m!332069 () Bool)

(assert (=> d!72563 m!332069))

(declare-fun m!332071 () Bool)

(assert (=> d!72563 m!332071))

(declare-fun m!332073 () Bool)

(assert (=> d!72563 m!332073))

(declare-fun m!332075 () Bool)

(assert (=> d!72563 m!332075))

(declare-fun m!332077 () Bool)

(assert (=> d!72563 m!332077))

(assert (=> b!215668 m!331797))

(declare-fun m!332079 () Bool)

(assert (=> b!215668 m!332079))

(declare-fun m!332081 () Bool)

(assert (=> b!215668 m!332081))

(assert (=> b!215541 d!72563))

(declare-fun d!72585 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!72585 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!340308)))) ((_ sign_extend 32) (currentByte!9769 thiss!1204)) ((_ sign_extend 32) (currentBit!9764 thiss!1204)) lt!340327) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!340308)))) ((_ sign_extend 32) (currentByte!9769 thiss!1204)) ((_ sign_extend 32) (currentBit!9764 thiss!1204))) lt!340327))))

(declare-fun bs!17804 () Bool)

(assert (= bs!17804 d!72585))

(declare-fun m!332083 () Bool)

(assert (=> bs!17804 m!332083))

(assert (=> b!215541 d!72585))

(declare-fun d!72587 () Bool)

(declare-datatypes ((tuple2!18486 0))(
  ( (tuple2!18487 (_1!9898 Bool) (_2!9898 BitStream!8420)) )
))
(declare-fun lt!340646 () tuple2!18486)

(declare-fun readBit!0 (BitStream!8420) tuple2!18486)

(assert (=> d!72587 (= lt!340646 (readBit!0 lt!340323))))

(assert (=> d!72587 (= (readBitPure!0 lt!340323) (tuple2!18477 (_2!9898 lt!340646) (_1!9898 lt!340646)))))

(declare-fun bs!17805 () Bool)

(assert (= bs!17805 d!72587))

(declare-fun m!332085 () Bool)

(assert (=> bs!17805 m!332085))

(assert (=> b!215541 d!72587))

(declare-fun d!72589 () Bool)

(declare-fun lt!340647 () tuple2!18486)

(assert (=> d!72589 (= lt!340647 (readBit!0 (BitStream!8421 (buf!5191 (_2!9892 lt!340308)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204))))))

(assert (=> d!72589 (= (readBitPure!0 (BitStream!8421 (buf!5191 (_2!9892 lt!340308)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204))) (tuple2!18477 (_2!9898 lt!340647) (_1!9898 lt!340647)))))

(declare-fun bs!17806 () Bool)

(assert (= bs!17806 d!72589))

(declare-fun m!332087 () Bool)

(assert (=> bs!17806 m!332087))

(assert (=> b!215541 d!72589))

(declare-datatypes ((tuple2!18488 0))(
  ( (tuple2!18489 (_1!9899 (_ BitVec 64)) (_2!9899 BitStream!8420)) )
))
(declare-fun lt!340650 () tuple2!18488)

(declare-fun d!72591 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8420 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18488)

(assert (=> d!72591 (= lt!340650 (readNBitsLSBFirstsLoop!0 (_1!9895 lt!340318) nBits!348 i!590 lt!340307))))

(assert (=> d!72591 (= (readNBitsLSBFirstsLoopPure!0 (_1!9895 lt!340318) nBits!348 i!590 lt!340307) (tuple2!18479 (_2!9899 lt!340650) (_1!9899 lt!340650)))))

(declare-fun bs!17807 () Bool)

(assert (= bs!17807 d!72591))

(declare-fun m!332089 () Bool)

(assert (=> bs!17807 m!332089))

(assert (=> b!215541 d!72591))

(declare-fun d!72593 () Bool)

(assert (=> d!72593 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!340308)))) ((_ sign_extend 32) (currentByte!9769 (_2!9892 lt!340324))) ((_ sign_extend 32) (currentBit!9764 (_2!9892 lt!340324))) lt!340315) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!340308)))) ((_ sign_extend 32) (currentByte!9769 (_2!9892 lt!340324))) ((_ sign_extend 32) (currentBit!9764 (_2!9892 lt!340324)))) lt!340315))))

(declare-fun bs!17808 () Bool)

(assert (= bs!17808 d!72593))

(declare-fun m!332091 () Bool)

(assert (=> bs!17808 m!332091))

(assert (=> b!215541 d!72593))

(declare-fun d!72595 () Bool)

(assert (=> d!72595 (validate_offset_bits!1 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!340308)))) ((_ sign_extend 32) (currentByte!9769 thiss!1204)) ((_ sign_extend 32) (currentBit!9764 thiss!1204)) lt!340327)))

(declare-fun lt!340653 () Unit!15296)

(declare-fun choose!9 (BitStream!8420 array!10599 (_ BitVec 64) BitStream!8420) Unit!15296)

(assert (=> d!72595 (= lt!340653 (choose!9 thiss!1204 (buf!5191 (_2!9892 lt!340308)) lt!340327 (BitStream!8421 (buf!5191 (_2!9892 lt!340308)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204))))))

(assert (=> d!72595 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5191 (_2!9892 lt!340308)) lt!340327) lt!340653)))

(declare-fun bs!17809 () Bool)

(assert (= bs!17809 d!72595))

(assert (=> bs!17809 m!331821))

(declare-fun m!332093 () Bool)

(assert (=> bs!17809 m!332093))

(assert (=> b!215541 d!72595))

(declare-fun d!72597 () Bool)

(declare-fun e!146732 () Bool)

(assert (=> d!72597 e!146732))

(declare-fun res!181462 () Bool)

(assert (=> d!72597 (=> (not res!181462) (not e!146732))))

(declare-fun lt!340681 () (_ BitVec 64))

(declare-fun lt!340682 () (_ BitVec 64))

(declare-fun lt!340679 () (_ BitVec 64))

(assert (=> d!72597 (= res!181462 (= lt!340681 (bvsub lt!340682 lt!340679)))))

(assert (=> d!72597 (or (= (bvand lt!340682 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!340679 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!340682 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!340682 lt!340679) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72597 (= lt!340679 (remainingBits!0 ((_ sign_extend 32) (size!4656 (buf!5191 (_1!9893 lt!340303)))) ((_ sign_extend 32) (currentByte!9769 (_1!9893 lt!340303))) ((_ sign_extend 32) (currentBit!9764 (_1!9893 lt!340303)))))))

(declare-fun lt!340680 () (_ BitVec 64))

(declare-fun lt!340678 () (_ BitVec 64))

(assert (=> d!72597 (= lt!340682 (bvmul lt!340680 lt!340678))))

(assert (=> d!72597 (or (= lt!340680 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!340678 (bvsdiv (bvmul lt!340680 lt!340678) lt!340680)))))

(assert (=> d!72597 (= lt!340678 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72597 (= lt!340680 ((_ sign_extend 32) (size!4656 (buf!5191 (_1!9893 lt!340303)))))))

(assert (=> d!72597 (= lt!340681 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9769 (_1!9893 lt!340303))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9764 (_1!9893 lt!340303)))))))

(assert (=> d!72597 (invariant!0 (currentBit!9764 (_1!9893 lt!340303)) (currentByte!9769 (_1!9893 lt!340303)) (size!4656 (buf!5191 (_1!9893 lt!340303))))))

(assert (=> d!72597 (= (bitIndex!0 (size!4656 (buf!5191 (_1!9893 lt!340303))) (currentByte!9769 (_1!9893 lt!340303)) (currentBit!9764 (_1!9893 lt!340303))) lt!340681)))

(declare-fun b!215689 () Bool)

(declare-fun res!181463 () Bool)

(assert (=> b!215689 (=> (not res!181463) (not e!146732))))

(assert (=> b!215689 (= res!181463 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!340681))))

(declare-fun b!215690 () Bool)

(declare-fun lt!340683 () (_ BitVec 64))

(assert (=> b!215690 (= e!146732 (bvsle lt!340681 (bvmul lt!340683 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!215690 (or (= lt!340683 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!340683 #b0000000000000000000000000000000000000000000000000000000000001000) lt!340683)))))

(assert (=> b!215690 (= lt!340683 ((_ sign_extend 32) (size!4656 (buf!5191 (_1!9893 lt!340303)))))))

(assert (= (and d!72597 res!181462) b!215689))

(assert (= (and b!215689 res!181463) b!215690))

(declare-fun m!332109 () Bool)

(assert (=> d!72597 m!332109))

(declare-fun m!332111 () Bool)

(assert (=> d!72597 m!332111))

(assert (=> b!215541 d!72597))

(declare-fun d!72603 () Bool)

(declare-fun lt!340684 () tuple2!18486)

(assert (=> d!72603 (= lt!340684 (readBit!0 (_1!9895 lt!340318)))))

(assert (=> d!72603 (= (readBitPure!0 (_1!9895 lt!340318)) (tuple2!18477 (_2!9898 lt!340684) (_1!9898 lt!340684)))))

(declare-fun bs!17810 () Bool)

(assert (= bs!17810 d!72603))

(declare-fun m!332113 () Bool)

(assert (=> bs!17810 m!332113))

(assert (=> b!215541 d!72603))

(declare-fun d!72605 () Bool)

(declare-fun e!146733 () Bool)

(assert (=> d!72605 e!146733))

(declare-fun res!181464 () Bool)

(assert (=> d!72605 (=> (not res!181464) (not e!146733))))

(declare-fun lt!340689 () (_ BitVec 64))

(declare-fun lt!340688 () (_ BitVec 64))

(declare-fun lt!340686 () (_ BitVec 64))

(assert (=> d!72605 (= res!181464 (= lt!340688 (bvsub lt!340689 lt!340686)))))

(assert (=> d!72605 (or (= (bvand lt!340689 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!340686 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!340689 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!340689 lt!340686) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72605 (= lt!340686 (remainingBits!0 ((_ sign_extend 32) (size!4656 (buf!5191 (_1!9893 lt!340328)))) ((_ sign_extend 32) (currentByte!9769 (_1!9893 lt!340328))) ((_ sign_extend 32) (currentBit!9764 (_1!9893 lt!340328)))))))

(declare-fun lt!340687 () (_ BitVec 64))

(declare-fun lt!340685 () (_ BitVec 64))

(assert (=> d!72605 (= lt!340689 (bvmul lt!340687 lt!340685))))

(assert (=> d!72605 (or (= lt!340687 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!340685 (bvsdiv (bvmul lt!340687 lt!340685) lt!340687)))))

(assert (=> d!72605 (= lt!340685 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72605 (= lt!340687 ((_ sign_extend 32) (size!4656 (buf!5191 (_1!9893 lt!340328)))))))

(assert (=> d!72605 (= lt!340688 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9769 (_1!9893 lt!340328))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9764 (_1!9893 lt!340328)))))))

(assert (=> d!72605 (invariant!0 (currentBit!9764 (_1!9893 lt!340328)) (currentByte!9769 (_1!9893 lt!340328)) (size!4656 (buf!5191 (_1!9893 lt!340328))))))

(assert (=> d!72605 (= (bitIndex!0 (size!4656 (buf!5191 (_1!9893 lt!340328))) (currentByte!9769 (_1!9893 lt!340328)) (currentBit!9764 (_1!9893 lt!340328))) lt!340688)))

(declare-fun b!215691 () Bool)

(declare-fun res!181465 () Bool)

(assert (=> b!215691 (=> (not res!181465) (not e!146733))))

(assert (=> b!215691 (= res!181465 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!340688))))

(declare-fun b!215692 () Bool)

(declare-fun lt!340690 () (_ BitVec 64))

(assert (=> b!215692 (= e!146733 (bvsle lt!340688 (bvmul lt!340690 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!215692 (or (= lt!340690 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!340690 #b0000000000000000000000000000000000000000000000000000000000001000) lt!340690)))))

(assert (=> b!215692 (= lt!340690 ((_ sign_extend 32) (size!4656 (buf!5191 (_1!9893 lt!340328)))))))

(assert (= (and d!72605 res!181464) b!215691))

(assert (= (and b!215691 res!181465) b!215692))

(declare-fun m!332115 () Bool)

(assert (=> d!72605 m!332115))

(declare-fun m!332117 () Bool)

(assert (=> d!72605 m!332117))

(assert (=> b!215541 d!72605))

(declare-fun d!72609 () Bool)

(assert (=> d!72609 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!215541 d!72609))

(declare-fun d!72613 () Bool)

(assert (=> d!72613 (validate_offset_bits!1 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!340308)))) ((_ sign_extend 32) (currentByte!9769 (_2!9892 lt!340324))) ((_ sign_extend 32) (currentBit!9764 (_2!9892 lt!340324))) lt!340315)))

(declare-fun lt!340693 () Unit!15296)

(assert (=> d!72613 (= lt!340693 (choose!9 (_2!9892 lt!340324) (buf!5191 (_2!9892 lt!340308)) lt!340315 (BitStream!8421 (buf!5191 (_2!9892 lt!340308)) (currentByte!9769 (_2!9892 lt!340324)) (currentBit!9764 (_2!9892 lt!340324)))))))

(assert (=> d!72613 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9892 lt!340324) (buf!5191 (_2!9892 lt!340308)) lt!340315) lt!340693)))

(declare-fun bs!17812 () Bool)

(assert (= bs!17812 d!72613))

(assert (=> bs!17812 m!331835))

(declare-fun m!332125 () Bool)

(assert (=> bs!17812 m!332125))

(assert (=> b!215541 d!72613))

(declare-fun d!72615 () Bool)

(declare-fun lt!340694 () tuple2!18488)

(assert (=> d!72615 (= lt!340694 (readNBitsLSBFirstsLoop!0 (_1!9895 lt!340310) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!340322))))

(assert (=> d!72615 (= (readNBitsLSBFirstsLoopPure!0 (_1!9895 lt!340310) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!340322) (tuple2!18479 (_2!9899 lt!340694) (_1!9899 lt!340694)))))

(declare-fun bs!17813 () Bool)

(assert (= bs!17813 d!72615))

(declare-fun m!332127 () Bool)

(assert (=> bs!17813 m!332127))

(assert (=> b!215541 d!72615))

(declare-fun d!72617 () Bool)

(declare-fun e!146742 () Bool)

(assert (=> d!72617 e!146742))

(declare-fun res!181476 () Bool)

(assert (=> d!72617 (=> (not res!181476) (not e!146742))))

(declare-fun lt!340708 () tuple2!18476)

(declare-fun lt!340709 () tuple2!18476)

(assert (=> d!72617 (= res!181476 (= (bitIndex!0 (size!4656 (buf!5191 (_1!9893 lt!340708))) (currentByte!9769 (_1!9893 lt!340708)) (currentBit!9764 (_1!9893 lt!340708))) (bitIndex!0 (size!4656 (buf!5191 (_1!9893 lt!340709))) (currentByte!9769 (_1!9893 lt!340709)) (currentBit!9764 (_1!9893 lt!340709)))))))

(declare-fun lt!340707 () BitStream!8420)

(declare-fun lt!340706 () Unit!15296)

(declare-fun choose!50 (BitStream!8420 BitStream!8420 BitStream!8420 tuple2!18476 tuple2!18476 BitStream!8420 Bool tuple2!18476 tuple2!18476 BitStream!8420 Bool) Unit!15296)

(assert (=> d!72617 (= lt!340706 (choose!50 lt!340323 (_2!9892 lt!340308) lt!340707 lt!340708 (tuple2!18477 (_1!9893 lt!340708) (_2!9893 lt!340708)) (_1!9893 lt!340708) (_2!9893 lt!340708) lt!340709 (tuple2!18477 (_1!9893 lt!340709) (_2!9893 lt!340709)) (_1!9893 lt!340709) (_2!9893 lt!340709)))))

(assert (=> d!72617 (= lt!340709 (readBitPure!0 lt!340707))))

(assert (=> d!72617 (= lt!340708 (readBitPure!0 lt!340323))))

(assert (=> d!72617 (= lt!340707 (BitStream!8421 (buf!5191 (_2!9892 lt!340308)) (currentByte!9769 lt!340323) (currentBit!9764 lt!340323)))))

(assert (=> d!72617 (invariant!0 (currentBit!9764 lt!340323) (currentByte!9769 lt!340323) (size!4656 (buf!5191 (_2!9892 lt!340308))))))

(assert (=> d!72617 (= (readBitPrefixLemma!0 lt!340323 (_2!9892 lt!340308)) lt!340706)))

(declare-fun b!215702 () Bool)

(assert (=> b!215702 (= e!146742 (= (_2!9893 lt!340708) (_2!9893 lt!340709)))))

(assert (= (and d!72617 res!181476) b!215702))

(declare-fun m!332133 () Bool)

(assert (=> d!72617 m!332133))

(assert (=> d!72617 m!331827))

(declare-fun m!332135 () Bool)

(assert (=> d!72617 m!332135))

(declare-fun m!332137 () Bool)

(assert (=> d!72617 m!332137))

(declare-fun m!332139 () Bool)

(assert (=> d!72617 m!332139))

(declare-fun m!332141 () Bool)

(assert (=> d!72617 m!332141))

(assert (=> b!215541 d!72617))

(declare-fun b!215703 () Bool)

(declare-fun res!181479 () Bool)

(declare-fun e!146744 () Bool)

(assert (=> b!215703 (=> (not res!181479) (not e!146744))))

(declare-fun lt!340716 () tuple2!18480)

(assert (=> b!215703 (= res!181479 (isPrefixOf!0 (_2!9895 lt!340716) (_2!9892 lt!340308)))))

(declare-fun b!215704 () Bool)

(declare-fun e!146743 () Unit!15296)

(declare-fun lt!340719 () Unit!15296)

(assert (=> b!215704 (= e!146743 lt!340719)))

(declare-fun lt!340713 () (_ BitVec 64))

(assert (=> b!215704 (= lt!340713 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!340723 () (_ BitVec 64))

(assert (=> b!215704 (= lt!340723 (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!340324))) (currentByte!9769 (_2!9892 lt!340324)) (currentBit!9764 (_2!9892 lt!340324))))))

(assert (=> b!215704 (= lt!340719 (arrayBitRangesEqSymmetric!0 (buf!5191 (_2!9892 lt!340324)) (buf!5191 (_2!9892 lt!340308)) lt!340713 lt!340723))))

(assert (=> b!215704 (arrayBitRangesEq!0 (buf!5191 (_2!9892 lt!340308)) (buf!5191 (_2!9892 lt!340324)) lt!340713 lt!340723)))

(declare-fun b!215705 () Bool)

(declare-fun Unit!15312 () Unit!15296)

(assert (=> b!215705 (= e!146743 Unit!15312)))

(declare-fun lt!340726 () (_ BitVec 64))

(declare-fun lt!340720 () (_ BitVec 64))

(declare-fun b!215706 () Bool)

(assert (=> b!215706 (= e!146744 (= (_1!9895 lt!340716) (withMovedBitIndex!0 (_2!9895 lt!340716) (bvsub lt!340726 lt!340720))))))

(assert (=> b!215706 (or (= (bvand lt!340726 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!340720 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!340726 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!340726 lt!340720) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!215706 (= lt!340720 (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!340308))) (currentByte!9769 (_2!9892 lt!340308)) (currentBit!9764 (_2!9892 lt!340308))))))

(assert (=> b!215706 (= lt!340726 (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!340324))) (currentByte!9769 (_2!9892 lt!340324)) (currentBit!9764 (_2!9892 lt!340324))))))

(declare-fun d!72625 () Bool)

(assert (=> d!72625 e!146744))

(declare-fun res!181478 () Bool)

(assert (=> d!72625 (=> (not res!181478) (not e!146744))))

(assert (=> d!72625 (= res!181478 (isPrefixOf!0 (_1!9895 lt!340716) (_2!9895 lt!340716)))))

(declare-fun lt!340729 () BitStream!8420)

(assert (=> d!72625 (= lt!340716 (tuple2!18481 lt!340729 (_2!9892 lt!340308)))))

(declare-fun lt!340722 () Unit!15296)

(declare-fun lt!340728 () Unit!15296)

(assert (=> d!72625 (= lt!340722 lt!340728)))

(assert (=> d!72625 (isPrefixOf!0 lt!340729 (_2!9892 lt!340308))))

(assert (=> d!72625 (= lt!340728 (lemmaIsPrefixTransitive!0 lt!340729 (_2!9892 lt!340308) (_2!9892 lt!340308)))))

(declare-fun lt!340717 () Unit!15296)

(declare-fun lt!340725 () Unit!15296)

(assert (=> d!72625 (= lt!340717 lt!340725)))

(assert (=> d!72625 (isPrefixOf!0 lt!340729 (_2!9892 lt!340308))))

(assert (=> d!72625 (= lt!340725 (lemmaIsPrefixTransitive!0 lt!340729 (_2!9892 lt!340324) (_2!9892 lt!340308)))))

(declare-fun lt!340727 () Unit!15296)

(assert (=> d!72625 (= lt!340727 e!146743)))

(declare-fun c!10516 () Bool)

(assert (=> d!72625 (= c!10516 (not (= (size!4656 (buf!5191 (_2!9892 lt!340324))) #b00000000000000000000000000000000)))))

(declare-fun lt!340712 () Unit!15296)

(declare-fun lt!340724 () Unit!15296)

(assert (=> d!72625 (= lt!340712 lt!340724)))

(assert (=> d!72625 (isPrefixOf!0 (_2!9892 lt!340308) (_2!9892 lt!340308))))

(assert (=> d!72625 (= lt!340724 (lemmaIsPrefixRefl!0 (_2!9892 lt!340308)))))

(declare-fun lt!340721 () Unit!15296)

(declare-fun lt!340711 () Unit!15296)

(assert (=> d!72625 (= lt!340721 lt!340711)))

(assert (=> d!72625 (= lt!340711 (lemmaIsPrefixRefl!0 (_2!9892 lt!340308)))))

(declare-fun lt!340714 () Unit!15296)

(declare-fun lt!340715 () Unit!15296)

(assert (=> d!72625 (= lt!340714 lt!340715)))

(assert (=> d!72625 (isPrefixOf!0 lt!340729 lt!340729)))

(assert (=> d!72625 (= lt!340715 (lemmaIsPrefixRefl!0 lt!340729))))

(declare-fun lt!340718 () Unit!15296)

(declare-fun lt!340710 () Unit!15296)

(assert (=> d!72625 (= lt!340718 lt!340710)))

(assert (=> d!72625 (isPrefixOf!0 (_2!9892 lt!340324) (_2!9892 lt!340324))))

(assert (=> d!72625 (= lt!340710 (lemmaIsPrefixRefl!0 (_2!9892 lt!340324)))))

(assert (=> d!72625 (= lt!340729 (BitStream!8421 (buf!5191 (_2!9892 lt!340308)) (currentByte!9769 (_2!9892 lt!340324)) (currentBit!9764 (_2!9892 lt!340324))))))

(assert (=> d!72625 (isPrefixOf!0 (_2!9892 lt!340324) (_2!9892 lt!340308))))

(assert (=> d!72625 (= (reader!0 (_2!9892 lt!340324) (_2!9892 lt!340308)) lt!340716)))

(declare-fun b!215707 () Bool)

(declare-fun res!181477 () Bool)

(assert (=> b!215707 (=> (not res!181477) (not e!146744))))

(assert (=> b!215707 (= res!181477 (isPrefixOf!0 (_1!9895 lt!340716) (_2!9892 lt!340324)))))

(assert (= (and d!72625 c!10516) b!215704))

(assert (= (and d!72625 (not c!10516)) b!215705))

(assert (= (and d!72625 res!181478) b!215707))

(assert (= (and b!215707 res!181477) b!215703))

(assert (= (and b!215703 res!181479) b!215706))

(declare-fun m!332143 () Bool)

(assert (=> b!215706 m!332143))

(assert (=> b!215706 m!331803))

(assert (=> b!215706 m!331795))

(declare-fun m!332145 () Bool)

(assert (=> b!215707 m!332145))

(declare-fun m!332147 () Bool)

(assert (=> b!215703 m!332147))

(assert (=> d!72625 m!331865))

(declare-fun m!332149 () Bool)

(assert (=> d!72625 m!332149))

(declare-fun m!332151 () Bool)

(assert (=> d!72625 m!332151))

(declare-fun m!332153 () Bool)

(assert (=> d!72625 m!332153))

(declare-fun m!332155 () Bool)

(assert (=> d!72625 m!332155))

(declare-fun m!332157 () Bool)

(assert (=> d!72625 m!332157))

(declare-fun m!332159 () Bool)

(assert (=> d!72625 m!332159))

(declare-fun m!332161 () Bool)

(assert (=> d!72625 m!332161))

(assert (=> d!72625 m!332073))

(declare-fun m!332163 () Bool)

(assert (=> d!72625 m!332163))

(assert (=> d!72625 m!332077))

(assert (=> b!215704 m!331795))

(declare-fun m!332165 () Bool)

(assert (=> b!215704 m!332165))

(declare-fun m!332167 () Bool)

(assert (=> b!215704 m!332167))

(assert (=> b!215541 d!72625))

(declare-fun d!72627 () Bool)

(assert (=> d!72627 (= (invariant!0 (currentBit!9764 thiss!1204) (currentByte!9769 thiss!1204) (size!4656 (buf!5191 (_2!9892 lt!340324)))) (and (bvsge (currentBit!9764 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9764 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9769 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9769 thiss!1204) (size!4656 (buf!5191 (_2!9892 lt!340324)))) (and (= (currentBit!9764 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9769 thiss!1204) (size!4656 (buf!5191 (_2!9892 lt!340324))))))))))

(assert (=> b!215541 d!72627))

(declare-fun d!72629 () Bool)

(declare-fun res!181480 () Bool)

(declare-fun e!146746 () Bool)

(assert (=> d!72629 (=> (not res!181480) (not e!146746))))

(assert (=> d!72629 (= res!181480 (= (size!4656 (buf!5191 thiss!1204)) (size!4656 (buf!5191 (_2!9892 lt!340324)))))))

(assert (=> d!72629 (= (isPrefixOf!0 thiss!1204 (_2!9892 lt!340324)) e!146746)))

(declare-fun b!215708 () Bool)

(declare-fun res!181481 () Bool)

(assert (=> b!215708 (=> (not res!181481) (not e!146746))))

(assert (=> b!215708 (= res!181481 (bvsle (bitIndex!0 (size!4656 (buf!5191 thiss!1204)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204)) (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!340324))) (currentByte!9769 (_2!9892 lt!340324)) (currentBit!9764 (_2!9892 lt!340324)))))))

(declare-fun b!215709 () Bool)

(declare-fun e!146745 () Bool)

(assert (=> b!215709 (= e!146746 e!146745)))

(declare-fun res!181482 () Bool)

(assert (=> b!215709 (=> res!181482 e!146745)))

(assert (=> b!215709 (= res!181482 (= (size!4656 (buf!5191 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!215710 () Bool)

(assert (=> b!215710 (= e!146745 (arrayBitRangesEq!0 (buf!5191 thiss!1204) (buf!5191 (_2!9892 lt!340324)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4656 (buf!5191 thiss!1204)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204))))))

(assert (= (and d!72629 res!181480) b!215708))

(assert (= (and b!215708 res!181481) b!215709))

(assert (= (and b!215709 (not res!181482)) b!215710))

(assert (=> b!215708 m!331797))

(assert (=> b!215708 m!331795))

(assert (=> b!215710 m!331797))

(assert (=> b!215710 m!331797))

(declare-fun m!332169 () Bool)

(assert (=> b!215710 m!332169))

(assert (=> b!215551 d!72629))

(declare-fun d!72631 () Bool)

(declare-fun lt!340730 () tuple2!18486)

(assert (=> d!72631 (= lt!340730 (readBit!0 (readerFrom!0 (_2!9892 lt!340324) (currentBit!9764 thiss!1204) (currentByte!9769 thiss!1204))))))

(assert (=> d!72631 (= (readBitPure!0 (readerFrom!0 (_2!9892 lt!340324) (currentBit!9764 thiss!1204) (currentByte!9769 thiss!1204))) (tuple2!18477 (_2!9898 lt!340730) (_1!9898 lt!340730)))))

(declare-fun bs!17815 () Bool)

(assert (= bs!17815 d!72631))

(assert (=> bs!17815 m!331813))

(declare-fun m!332171 () Bool)

(assert (=> bs!17815 m!332171))

(assert (=> b!215540 d!72631))

(declare-fun d!72633 () Bool)

(declare-fun e!146749 () Bool)

(assert (=> d!72633 e!146749))

(declare-fun res!181486 () Bool)

(assert (=> d!72633 (=> (not res!181486) (not e!146749))))

(assert (=> d!72633 (= res!181486 (invariant!0 (currentBit!9764 (_2!9892 lt!340324)) (currentByte!9769 (_2!9892 lt!340324)) (size!4656 (buf!5191 (_2!9892 lt!340324)))))))

(assert (=> d!72633 (= (readerFrom!0 (_2!9892 lt!340324) (currentBit!9764 thiss!1204) (currentByte!9769 thiss!1204)) (BitStream!8421 (buf!5191 (_2!9892 lt!340324)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204)))))

(declare-fun b!215713 () Bool)

(assert (=> b!215713 (= e!146749 (invariant!0 (currentBit!9764 thiss!1204) (currentByte!9769 thiss!1204) (size!4656 (buf!5191 (_2!9892 lt!340324)))))))

(assert (= (and d!72633 res!181486) b!215713))

(declare-fun m!332173 () Bool)

(assert (=> d!72633 m!332173))

(assert (=> b!215713 m!331845))

(assert (=> b!215540 d!72633))

(declare-fun d!72635 () Bool)

(declare-fun e!146750 () Bool)

(assert (=> d!72635 e!146750))

(declare-fun res!181487 () Bool)

(assert (=> d!72635 (=> (not res!181487) (not e!146750))))

(declare-fun lt!340732 () (_ BitVec 64))

(declare-fun lt!340735 () (_ BitVec 64))

(declare-fun lt!340734 () (_ BitVec 64))

(assert (=> d!72635 (= res!181487 (= lt!340734 (bvsub lt!340735 lt!340732)))))

(assert (=> d!72635 (or (= (bvand lt!340735 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!340732 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!340735 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!340735 lt!340732) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72635 (= lt!340732 (remainingBits!0 ((_ sign_extend 32) (size!4656 (buf!5191 (_1!9893 lt!340309)))) ((_ sign_extend 32) (currentByte!9769 (_1!9893 lt!340309))) ((_ sign_extend 32) (currentBit!9764 (_1!9893 lt!340309)))))))

(declare-fun lt!340733 () (_ BitVec 64))

(declare-fun lt!340731 () (_ BitVec 64))

(assert (=> d!72635 (= lt!340735 (bvmul lt!340733 lt!340731))))

(assert (=> d!72635 (or (= lt!340733 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!340731 (bvsdiv (bvmul lt!340733 lt!340731) lt!340733)))))

(assert (=> d!72635 (= lt!340731 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72635 (= lt!340733 ((_ sign_extend 32) (size!4656 (buf!5191 (_1!9893 lt!340309)))))))

(assert (=> d!72635 (= lt!340734 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9769 (_1!9893 lt!340309))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9764 (_1!9893 lt!340309)))))))

(assert (=> d!72635 (invariant!0 (currentBit!9764 (_1!9893 lt!340309)) (currentByte!9769 (_1!9893 lt!340309)) (size!4656 (buf!5191 (_1!9893 lt!340309))))))

(assert (=> d!72635 (= (bitIndex!0 (size!4656 (buf!5191 (_1!9893 lt!340309))) (currentByte!9769 (_1!9893 lt!340309)) (currentBit!9764 (_1!9893 lt!340309))) lt!340734)))

(declare-fun b!215714 () Bool)

(declare-fun res!181488 () Bool)

(assert (=> b!215714 (=> (not res!181488) (not e!146750))))

(assert (=> b!215714 (= res!181488 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!340734))))

(declare-fun b!215715 () Bool)

(declare-fun lt!340736 () (_ BitVec 64))

(assert (=> b!215715 (= e!146750 (bvsle lt!340734 (bvmul lt!340736 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!215715 (or (= lt!340736 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!340736 #b0000000000000000000000000000000000000000000000000000000000001000) lt!340736)))))

(assert (=> b!215715 (= lt!340736 ((_ sign_extend 32) (size!4656 (buf!5191 (_1!9893 lt!340309)))))))

(assert (= (and d!72635 res!181487) b!215714))

(assert (= (and b!215714 res!181488) b!215715))

(declare-fun m!332175 () Bool)

(assert (=> d!72635 m!332175))

(declare-fun m!332177 () Bool)

(assert (=> d!72635 m!332177))

(assert (=> b!215550 d!72635))

(assert (=> b!215539 d!72629))

(declare-fun d!72637 () Bool)

(assert (=> d!72637 (= (array_inv!4397 (buf!5191 thiss!1204)) (bvsge (size!4656 (buf!5191 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!215549 d!72637))

(declare-fun d!72639 () Bool)

(declare-fun e!146751 () Bool)

(assert (=> d!72639 e!146751))

(declare-fun res!181489 () Bool)

(assert (=> d!72639 (=> (not res!181489) (not e!146751))))

(declare-fun lt!340740 () (_ BitVec 64))

(declare-fun lt!340741 () (_ BitVec 64))

(declare-fun lt!340738 () (_ BitVec 64))

(assert (=> d!72639 (= res!181489 (= lt!340740 (bvsub lt!340741 lt!340738)))))

(assert (=> d!72639 (or (= (bvand lt!340741 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!340738 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!340741 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!340741 lt!340738) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72639 (= lt!340738 (remainingBits!0 ((_ sign_extend 32) (size!4656 (buf!5191 (_1!9894 lt!340314)))) ((_ sign_extend 32) (currentByte!9769 (_1!9894 lt!340314))) ((_ sign_extend 32) (currentBit!9764 (_1!9894 lt!340314)))))))

(declare-fun lt!340739 () (_ BitVec 64))

(declare-fun lt!340737 () (_ BitVec 64))

(assert (=> d!72639 (= lt!340741 (bvmul lt!340739 lt!340737))))

(assert (=> d!72639 (or (= lt!340739 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!340737 (bvsdiv (bvmul lt!340739 lt!340737) lt!340739)))))

(assert (=> d!72639 (= lt!340737 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72639 (= lt!340739 ((_ sign_extend 32) (size!4656 (buf!5191 (_1!9894 lt!340314)))))))

(assert (=> d!72639 (= lt!340740 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9769 (_1!9894 lt!340314))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9764 (_1!9894 lt!340314)))))))

(assert (=> d!72639 (invariant!0 (currentBit!9764 (_1!9894 lt!340314)) (currentByte!9769 (_1!9894 lt!340314)) (size!4656 (buf!5191 (_1!9894 lt!340314))))))

(assert (=> d!72639 (= (bitIndex!0 (size!4656 (buf!5191 (_1!9894 lt!340314))) (currentByte!9769 (_1!9894 lt!340314)) (currentBit!9764 (_1!9894 lt!340314))) lt!340740)))

(declare-fun b!215716 () Bool)

(declare-fun res!181490 () Bool)

(assert (=> b!215716 (=> (not res!181490) (not e!146751))))

(assert (=> b!215716 (= res!181490 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!340740))))

(declare-fun b!215717 () Bool)

(declare-fun lt!340742 () (_ BitVec 64))

(assert (=> b!215717 (= e!146751 (bvsle lt!340740 (bvmul lt!340742 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!215717 (or (= lt!340742 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!340742 #b0000000000000000000000000000000000000000000000000000000000001000) lt!340742)))))

(assert (=> b!215717 (= lt!340742 ((_ sign_extend 32) (size!4656 (buf!5191 (_1!9894 lt!340314)))))))

(assert (= (and d!72639 res!181489) b!215716))

(assert (= (and b!215716 res!181490) b!215717))

(declare-fun m!332179 () Bool)

(assert (=> d!72639 m!332179))

(declare-fun m!332181 () Bool)

(assert (=> d!72639 m!332181))

(assert (=> b!215538 d!72639))

(declare-fun d!72641 () Bool)

(declare-fun e!146752 () Bool)

(assert (=> d!72641 e!146752))

(declare-fun res!181491 () Bool)

(assert (=> d!72641 (=> (not res!181491) (not e!146752))))

(declare-fun lt!340746 () (_ BitVec 64))

(declare-fun lt!340744 () (_ BitVec 64))

(declare-fun lt!340747 () (_ BitVec 64))

(assert (=> d!72641 (= res!181491 (= lt!340746 (bvsub lt!340747 lt!340744)))))

(assert (=> d!72641 (or (= (bvand lt!340747 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!340744 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!340747 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!340747 lt!340744) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72641 (= lt!340744 (remainingBits!0 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9895 lt!340318)))) ((_ sign_extend 32) (currentByte!9769 (_2!9895 lt!340318))) ((_ sign_extend 32) (currentBit!9764 (_2!9895 lt!340318)))))))

(declare-fun lt!340745 () (_ BitVec 64))

(declare-fun lt!340743 () (_ BitVec 64))

(assert (=> d!72641 (= lt!340747 (bvmul lt!340745 lt!340743))))

(assert (=> d!72641 (or (= lt!340745 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!340743 (bvsdiv (bvmul lt!340745 lt!340743) lt!340745)))))

(assert (=> d!72641 (= lt!340743 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72641 (= lt!340745 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9895 lt!340318)))))))

(assert (=> d!72641 (= lt!340746 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9769 (_2!9895 lt!340318))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9764 (_2!9895 lt!340318)))))))

(assert (=> d!72641 (invariant!0 (currentBit!9764 (_2!9895 lt!340318)) (currentByte!9769 (_2!9895 lt!340318)) (size!4656 (buf!5191 (_2!9895 lt!340318))))))

(assert (=> d!72641 (= (bitIndex!0 (size!4656 (buf!5191 (_2!9895 lt!340318))) (currentByte!9769 (_2!9895 lt!340318)) (currentBit!9764 (_2!9895 lt!340318))) lt!340746)))

(declare-fun b!215718 () Bool)

(declare-fun res!181492 () Bool)

(assert (=> b!215718 (=> (not res!181492) (not e!146752))))

(assert (=> b!215718 (= res!181492 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!340746))))

(declare-fun b!215719 () Bool)

(declare-fun lt!340748 () (_ BitVec 64))

(assert (=> b!215719 (= e!146752 (bvsle lt!340746 (bvmul lt!340748 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!215719 (or (= lt!340748 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!340748 #b0000000000000000000000000000000000000000000000000000000000001000) lt!340748)))))

(assert (=> b!215719 (= lt!340748 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9895 lt!340318)))))))

(assert (= (and d!72641 res!181491) b!215718))

(assert (= (and b!215718 res!181492) b!215719))

(declare-fun m!332183 () Bool)

(assert (=> d!72641 m!332183))

(declare-fun m!332185 () Bool)

(assert (=> d!72641 m!332185))

(assert (=> b!215538 d!72641))

(declare-fun d!72643 () Bool)

(assert (=> d!72643 (= (onesLSBLong!0 nBits!348) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!348))))))

(assert (=> b!215559 d!72643))

(declare-fun d!72645 () Bool)

(assert (=> d!72645 (= (invariant!0 (currentBit!9764 (_2!9892 lt!340308)) (currentByte!9769 (_2!9892 lt!340308)) (size!4656 (buf!5191 (_2!9892 lt!340308)))) (and (bvsge (currentBit!9764 (_2!9892 lt!340308)) #b00000000000000000000000000000000) (bvslt (currentBit!9764 (_2!9892 lt!340308)) #b00000000000000000000000000001000) (bvsge (currentByte!9769 (_2!9892 lt!340308)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9769 (_2!9892 lt!340308)) (size!4656 (buf!5191 (_2!9892 lt!340308)))) (and (= (currentBit!9764 (_2!9892 lt!340308)) #b00000000000000000000000000000000) (= (currentByte!9769 (_2!9892 lt!340308)) (size!4656 (buf!5191 (_2!9892 lt!340308))))))))))

(assert (=> b!215548 d!72645))

(declare-fun d!72647 () Bool)

(declare-fun e!146753 () Bool)

(assert (=> d!72647 e!146753))

(declare-fun res!181493 () Bool)

(assert (=> d!72647 (=> (not res!181493) (not e!146753))))

(declare-fun lt!340753 () (_ BitVec 64))

(declare-fun lt!340750 () (_ BitVec 64))

(declare-fun lt!340752 () (_ BitVec 64))

(assert (=> d!72647 (= res!181493 (= lt!340752 (bvsub lt!340753 lt!340750)))))

(assert (=> d!72647 (or (= (bvand lt!340753 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!340750 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!340753 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!340753 lt!340750) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72647 (= lt!340750 (remainingBits!0 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!340324)))) ((_ sign_extend 32) (currentByte!9769 (_2!9892 lt!340324))) ((_ sign_extend 32) (currentBit!9764 (_2!9892 lt!340324)))))))

(declare-fun lt!340751 () (_ BitVec 64))

(declare-fun lt!340749 () (_ BitVec 64))

(assert (=> d!72647 (= lt!340753 (bvmul lt!340751 lt!340749))))

(assert (=> d!72647 (or (= lt!340751 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!340749 (bvsdiv (bvmul lt!340751 lt!340749) lt!340751)))))

(assert (=> d!72647 (= lt!340749 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72647 (= lt!340751 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!340324)))))))

(assert (=> d!72647 (= lt!340752 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9769 (_2!9892 lt!340324))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9764 (_2!9892 lt!340324)))))))

(assert (=> d!72647 (invariant!0 (currentBit!9764 (_2!9892 lt!340324)) (currentByte!9769 (_2!9892 lt!340324)) (size!4656 (buf!5191 (_2!9892 lt!340324))))))

(assert (=> d!72647 (= (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!340324))) (currentByte!9769 (_2!9892 lt!340324)) (currentBit!9764 (_2!9892 lt!340324))) lt!340752)))

(declare-fun b!215720 () Bool)

(declare-fun res!181494 () Bool)

(assert (=> b!215720 (=> (not res!181494) (not e!146753))))

(assert (=> b!215720 (= res!181494 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!340752))))

(declare-fun b!215721 () Bool)

(declare-fun lt!340754 () (_ BitVec 64))

(assert (=> b!215721 (= e!146753 (bvsle lt!340752 (bvmul lt!340754 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!215721 (or (= lt!340754 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!340754 #b0000000000000000000000000000000000000000000000000000000000001000) lt!340754)))))

(assert (=> b!215721 (= lt!340754 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!340324)))))))

(assert (= (and d!72647 res!181493) b!215720))

(assert (= (and b!215720 res!181494) b!215721))

(declare-fun m!332187 () Bool)

(assert (=> d!72647 m!332187))

(assert (=> d!72647 m!332173))

(assert (=> b!215537 d!72647))

(declare-fun d!72649 () Bool)

(declare-fun e!146754 () Bool)

(assert (=> d!72649 e!146754))

(declare-fun res!181495 () Bool)

(assert (=> d!72649 (=> (not res!181495) (not e!146754))))

(declare-fun lt!340758 () (_ BitVec 64))

(declare-fun lt!340756 () (_ BitVec 64))

(declare-fun lt!340759 () (_ BitVec 64))

(assert (=> d!72649 (= res!181495 (= lt!340758 (bvsub lt!340759 lt!340756)))))

(assert (=> d!72649 (or (= (bvand lt!340759 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!340756 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!340759 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!340759 lt!340756) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72649 (= lt!340756 (remainingBits!0 ((_ sign_extend 32) (size!4656 (buf!5191 thiss!1204))) ((_ sign_extend 32) (currentByte!9769 thiss!1204)) ((_ sign_extend 32) (currentBit!9764 thiss!1204))))))

(declare-fun lt!340757 () (_ BitVec 64))

(declare-fun lt!340755 () (_ BitVec 64))

(assert (=> d!72649 (= lt!340759 (bvmul lt!340757 lt!340755))))

(assert (=> d!72649 (or (= lt!340757 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!340755 (bvsdiv (bvmul lt!340757 lt!340755) lt!340757)))))

(assert (=> d!72649 (= lt!340755 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72649 (= lt!340757 ((_ sign_extend 32) (size!4656 (buf!5191 thiss!1204))))))

(assert (=> d!72649 (= lt!340758 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9769 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9764 thiss!1204))))))

(assert (=> d!72649 (invariant!0 (currentBit!9764 thiss!1204) (currentByte!9769 thiss!1204) (size!4656 (buf!5191 thiss!1204)))))

(assert (=> d!72649 (= (bitIndex!0 (size!4656 (buf!5191 thiss!1204)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204)) lt!340758)))

(declare-fun b!215722 () Bool)

(declare-fun res!181496 () Bool)

(assert (=> b!215722 (=> (not res!181496) (not e!146754))))

(assert (=> b!215722 (= res!181496 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!340758))))

(declare-fun b!215723 () Bool)

(declare-fun lt!340760 () (_ BitVec 64))

(assert (=> b!215723 (= e!146754 (bvsle lt!340758 (bvmul lt!340760 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!215723 (or (= lt!340760 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!340760 #b0000000000000000000000000000000000000000000000000000000000001000) lt!340760)))))

(assert (=> b!215723 (= lt!340760 ((_ sign_extend 32) (size!4656 (buf!5191 thiss!1204))))))

(assert (= (and d!72649 res!181495) b!215722))

(assert (= (and b!215722 res!181496) b!215723))

(declare-fun m!332189 () Bool)

(assert (=> d!72649 m!332189))

(assert (=> d!72649 m!331791))

(assert (=> b!215537 d!72649))

(declare-fun d!72651 () Bool)

(declare-fun e!146757 () Bool)

(assert (=> d!72651 e!146757))

(declare-fun res!181499 () Bool)

(assert (=> d!72651 (=> (not res!181499) (not e!146757))))

(declare-fun lt!340765 () BitStream!8420)

(declare-fun lt!340766 () (_ BitVec 64))

(assert (=> d!72651 (= res!181499 (= (bvadd lt!340766 (bvsub lt!340325 lt!340320)) (bitIndex!0 (size!4656 (buf!5191 lt!340765)) (currentByte!9769 lt!340765) (currentBit!9764 lt!340765))))))

(assert (=> d!72651 (or (not (= (bvand lt!340766 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!340325 lt!340320) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!340766 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!340766 (bvsub lt!340325 lt!340320)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72651 (= lt!340766 (bitIndex!0 (size!4656 (buf!5191 (_2!9895 lt!340310))) (currentByte!9769 (_2!9895 lt!340310)) (currentBit!9764 (_2!9895 lt!340310))))))

(declare-fun moveBitIndex!0 (BitStream!8420 (_ BitVec 64)) tuple2!18474)

(assert (=> d!72651 (= lt!340765 (_2!9892 (moveBitIndex!0 (_2!9895 lt!340310) (bvsub lt!340325 lt!340320))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!8420 (_ BitVec 64)) Bool)

(assert (=> d!72651 (moveBitIndexPrecond!0 (_2!9895 lt!340310) (bvsub lt!340325 lt!340320))))

(assert (=> d!72651 (= (withMovedBitIndex!0 (_2!9895 lt!340310) (bvsub lt!340325 lt!340320)) lt!340765)))

(declare-fun b!215726 () Bool)

(assert (=> b!215726 (= e!146757 (= (size!4656 (buf!5191 (_2!9895 lt!340310))) (size!4656 (buf!5191 lt!340765))))))

(assert (= (and d!72651 res!181499) b!215726))

(declare-fun m!332191 () Bool)

(assert (=> d!72651 m!332191))

(declare-fun m!332193 () Bool)

(assert (=> d!72651 m!332193))

(declare-fun m!332195 () Bool)

(assert (=> d!72651 m!332195))

(declare-fun m!332197 () Bool)

(assert (=> d!72651 m!332197))

(assert (=> b!215558 d!72651))

(assert (=> b!215536 d!72647))

(assert (=> b!215536 d!72649))

(declare-fun b!215748 () Bool)

(declare-fun e!146766 () Bool)

(declare-fun e!146767 () Bool)

(assert (=> b!215748 (= e!146766 e!146767)))

(declare-fun res!181516 () Bool)

(assert (=> b!215748 (=> (not res!181516) (not e!146767))))

(declare-fun lt!340815 () tuple2!18474)

(declare-fun lt!340818 () tuple2!18476)

(assert (=> b!215748 (= res!181516 (and (= (_2!9893 lt!340818) lt!340304) (= (_1!9893 lt!340818) (_2!9892 lt!340815))))))

(assert (=> b!215748 (= lt!340818 (readBitPure!0 (readerFrom!0 (_2!9892 lt!340815) (currentBit!9764 thiss!1204) (currentByte!9769 thiss!1204))))))

(declare-fun d!72653 () Bool)

(assert (=> d!72653 e!146766))

(declare-fun res!181517 () Bool)

(assert (=> d!72653 (=> (not res!181517) (not e!146766))))

(assert (=> d!72653 (= res!181517 (= (size!4656 (buf!5191 thiss!1204)) (size!4656 (buf!5191 (_2!9892 lt!340815)))))))

(declare-fun choose!16 (BitStream!8420 Bool) tuple2!18474)

(assert (=> d!72653 (= lt!340815 (choose!16 thiss!1204 lt!340304))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!72653 (validate_offset_bit!0 ((_ sign_extend 32) (size!4656 (buf!5191 thiss!1204))) ((_ sign_extend 32) (currentByte!9769 thiss!1204)) ((_ sign_extend 32) (currentBit!9764 thiss!1204)))))

(assert (=> d!72653 (= (appendBit!0 thiss!1204 lt!340304) lt!340815)))

(declare-fun b!215747 () Bool)

(declare-fun res!181514 () Bool)

(assert (=> b!215747 (=> (not res!181514) (not e!146766))))

(assert (=> b!215747 (= res!181514 (isPrefixOf!0 thiss!1204 (_2!9892 lt!340815)))))

(declare-fun b!215749 () Bool)

(assert (=> b!215749 (= e!146767 (= (bitIndex!0 (size!4656 (buf!5191 (_1!9893 lt!340818))) (currentByte!9769 (_1!9893 lt!340818)) (currentBit!9764 (_1!9893 lt!340818))) (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!340815))) (currentByte!9769 (_2!9892 lt!340815)) (currentBit!9764 (_2!9892 lt!340815)))))))

(declare-fun b!215746 () Bool)

(declare-fun res!181515 () Bool)

(assert (=> b!215746 (=> (not res!181515) (not e!146766))))

(declare-fun lt!340816 () (_ BitVec 64))

(declare-fun lt!340817 () (_ BitVec 64))

(assert (=> b!215746 (= res!181515 (= (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!340815))) (currentByte!9769 (_2!9892 lt!340815)) (currentBit!9764 (_2!9892 lt!340815))) (bvadd lt!340816 lt!340817)))))

(assert (=> b!215746 (or (not (= (bvand lt!340816 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!340817 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!340816 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!340816 lt!340817) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!215746 (= lt!340817 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!215746 (= lt!340816 (bitIndex!0 (size!4656 (buf!5191 thiss!1204)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204)))))

(assert (= (and d!72653 res!181517) b!215746))

(assert (= (and b!215746 res!181515) b!215747))

(assert (= (and b!215747 res!181514) b!215748))

(assert (= (and b!215748 res!181516) b!215749))

(declare-fun m!332199 () Bool)

(assert (=> b!215746 m!332199))

(assert (=> b!215746 m!331797))

(declare-fun m!332201 () Bool)

(assert (=> b!215749 m!332201))

(assert (=> b!215749 m!332199))

(declare-fun m!332203 () Bool)

(assert (=> b!215748 m!332203))

(assert (=> b!215748 m!332203))

(declare-fun m!332205 () Bool)

(assert (=> b!215748 m!332205))

(declare-fun m!332207 () Bool)

(assert (=> b!215747 m!332207))

(declare-fun m!332209 () Bool)

(assert (=> d!72653 m!332209))

(declare-fun m!332211 () Bool)

(assert (=> d!72653 m!332211))

(assert (=> b!215536 d!72653))

(declare-fun d!72655 () Bool)

(declare-fun lt!340860 () tuple2!18478)

(declare-fun lt!340859 () tuple2!18478)

(assert (=> d!72655 (and (= (_2!9894 lt!340860) (_2!9894 lt!340859)) (= (_1!9894 lt!340860) (_1!9894 lt!340859)))))

(declare-fun lt!340856 () BitStream!8420)

(declare-fun lt!340855 () Unit!15296)

(declare-fun lt!340858 () (_ BitVec 64))

(declare-fun lt!340857 () Bool)

(declare-fun choose!56 (BitStream!8420 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!18478 tuple2!18478 BitStream!8420 (_ BitVec 64) Bool BitStream!8420 (_ BitVec 64) tuple2!18478 tuple2!18478 BitStream!8420 (_ BitVec 64)) Unit!15296)

(assert (=> d!72655 (= lt!340855 (choose!56 (_1!9895 lt!340318) nBits!348 i!590 lt!340307 lt!340860 (tuple2!18479 (_1!9894 lt!340860) (_2!9894 lt!340860)) (_1!9894 lt!340860) (_2!9894 lt!340860) lt!340857 lt!340856 lt!340858 lt!340859 (tuple2!18479 (_1!9894 lt!340859) (_2!9894 lt!340859)) (_1!9894 lt!340859) (_2!9894 lt!340859)))))

(assert (=> d!72655 (= lt!340859 (readNBitsLSBFirstsLoopPure!0 lt!340856 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!340858))))

(assert (=> d!72655 (= lt!340858 (bvor lt!340307 (ite lt!340857 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72655 (= lt!340856 (withMovedBitIndex!0 (_1!9895 lt!340318) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!72655 (= lt!340857 (_2!9893 (readBitPure!0 (_1!9895 lt!340318))))))

(assert (=> d!72655 (= lt!340860 (readNBitsLSBFirstsLoopPure!0 (_1!9895 lt!340318) nBits!348 i!590 lt!340307))))

(assert (=> d!72655 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9895 lt!340318) nBits!348 i!590 lt!340307) lt!340855)))

(declare-fun bs!17820 () Bool)

(assert (= bs!17820 d!72655))

(assert (=> bs!17820 m!331859))

(assert (=> bs!17820 m!331819))

(assert (=> bs!17820 m!331833))

(declare-fun m!332249 () Bool)

(assert (=> bs!17820 m!332249))

(declare-fun m!332251 () Bool)

(assert (=> bs!17820 m!332251))

(assert (=> b!215556 d!72655))

(declare-fun lt!340861 () tuple2!18488)

(declare-fun d!72665 () Bool)

(assert (=> d!72665 (= lt!340861 (readNBitsLSBFirstsLoop!0 lt!340326 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!340322))))

(assert (=> d!72665 (= (readNBitsLSBFirstsLoopPure!0 lt!340326 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!340322) (tuple2!18479 (_2!9899 lt!340861) (_1!9899 lt!340861)))))

(declare-fun bs!17821 () Bool)

(assert (= bs!17821 d!72665))

(declare-fun m!332253 () Bool)

(assert (=> bs!17821 m!332253))

(assert (=> b!215556 d!72665))

(declare-fun d!72667 () Bool)

(declare-fun e!146770 () Bool)

(assert (=> d!72667 e!146770))

(declare-fun res!181521 () Bool)

(assert (=> d!72667 (=> (not res!181521) (not e!146770))))

(declare-fun lt!340863 () (_ BitVec 64))

(declare-fun lt!340862 () BitStream!8420)

(assert (=> d!72667 (= res!181521 (= (bvadd lt!340863 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4656 (buf!5191 lt!340862)) (currentByte!9769 lt!340862) (currentBit!9764 lt!340862))))))

(assert (=> d!72667 (or (not (= (bvand lt!340863 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!340863 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!340863 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72667 (= lt!340863 (bitIndex!0 (size!4656 (buf!5191 (_1!9895 lt!340318))) (currentByte!9769 (_1!9895 lt!340318)) (currentBit!9764 (_1!9895 lt!340318))))))

(assert (=> d!72667 (= lt!340862 (_2!9892 (moveBitIndex!0 (_1!9895 lt!340318) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!72667 (moveBitIndexPrecond!0 (_1!9895 lt!340318) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!72667 (= (withMovedBitIndex!0 (_1!9895 lt!340318) #b0000000000000000000000000000000000000000000000000000000000000001) lt!340862)))

(declare-fun b!215755 () Bool)

(assert (=> b!215755 (= e!146770 (= (size!4656 (buf!5191 (_1!9895 lt!340318))) (size!4656 (buf!5191 lt!340862))))))

(assert (= (and d!72667 res!181521) b!215755))

(declare-fun m!332255 () Bool)

(assert (=> d!72667 m!332255))

(declare-fun m!332257 () Bool)

(assert (=> d!72667 m!332257))

(declare-fun m!332259 () Bool)

(assert (=> d!72667 m!332259))

(declare-fun m!332261 () Bool)

(assert (=> d!72667 m!332261))

(assert (=> b!215556 d!72667))

(declare-fun d!72669 () Bool)

(assert (=> d!72669 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4656 (buf!5191 thiss!1204))) ((_ sign_extend 32) (currentByte!9769 thiss!1204)) ((_ sign_extend 32) (currentBit!9764 thiss!1204)) lt!340327) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4656 (buf!5191 thiss!1204))) ((_ sign_extend 32) (currentByte!9769 thiss!1204)) ((_ sign_extend 32) (currentBit!9764 thiss!1204))) lt!340327))))

(declare-fun bs!17822 () Bool)

(assert (= bs!17822 d!72669))

(assert (=> bs!17822 m!332189))

(assert (=> b!215545 d!72669))

(declare-fun d!72671 () Bool)

(declare-fun e!146771 () Bool)

(assert (=> d!72671 e!146771))

(declare-fun res!181522 () Bool)

(assert (=> d!72671 (=> (not res!181522) (not e!146771))))

(declare-fun lt!340867 () (_ BitVec 64))

(declare-fun lt!340865 () (_ BitVec 64))

(declare-fun lt!340868 () (_ BitVec 64))

(assert (=> d!72671 (= res!181522 (= lt!340867 (bvsub lt!340868 lt!340865)))))

(assert (=> d!72671 (or (= (bvand lt!340868 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!340865 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!340868 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!340868 lt!340865) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72671 (= lt!340865 (remainingBits!0 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!340308)))) ((_ sign_extend 32) (currentByte!9769 (_2!9892 lt!340308))) ((_ sign_extend 32) (currentBit!9764 (_2!9892 lt!340308)))))))

(declare-fun lt!340866 () (_ BitVec 64))

(declare-fun lt!340864 () (_ BitVec 64))

(assert (=> d!72671 (= lt!340868 (bvmul lt!340866 lt!340864))))

(assert (=> d!72671 (or (= lt!340866 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!340864 (bvsdiv (bvmul lt!340866 lt!340864) lt!340866)))))

(assert (=> d!72671 (= lt!340864 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72671 (= lt!340866 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!340308)))))))

(assert (=> d!72671 (= lt!340867 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9769 (_2!9892 lt!340308))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9764 (_2!9892 lt!340308)))))))

(assert (=> d!72671 (invariant!0 (currentBit!9764 (_2!9892 lt!340308)) (currentByte!9769 (_2!9892 lt!340308)) (size!4656 (buf!5191 (_2!9892 lt!340308))))))

(assert (=> d!72671 (= (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!340308))) (currentByte!9769 (_2!9892 lt!340308)) (currentBit!9764 (_2!9892 lt!340308))) lt!340867)))

(declare-fun b!215756 () Bool)

(declare-fun res!181523 () Bool)

(assert (=> b!215756 (=> (not res!181523) (not e!146771))))

(assert (=> b!215756 (= res!181523 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!340867))))

(declare-fun b!215757 () Bool)

(declare-fun lt!340869 () (_ BitVec 64))

(assert (=> b!215757 (= e!146771 (bvsle lt!340867 (bvmul lt!340869 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!215757 (or (= lt!340869 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!340869 #b0000000000000000000000000000000000000000000000000000000000001000) lt!340869)))))

(assert (=> b!215757 (= lt!340869 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!340308)))))))

(assert (= (and d!72671 res!181522) b!215756))

(assert (= (and b!215756 res!181523) b!215757))

(declare-fun m!332263 () Bool)

(assert (=> d!72671 m!332263))

(assert (=> d!72671 m!331851))

(assert (=> b!215555 d!72671))

(declare-fun d!72673 () Bool)

(declare-fun res!181524 () Bool)

(declare-fun e!146773 () Bool)

(assert (=> d!72673 (=> (not res!181524) (not e!146773))))

(assert (=> d!72673 (= res!181524 (= (size!4656 (buf!5191 thiss!1204)) (size!4656 (buf!5191 (_2!9892 lt!340308)))))))

(assert (=> d!72673 (= (isPrefixOf!0 thiss!1204 (_2!9892 lt!340308)) e!146773)))

(declare-fun b!215758 () Bool)

(declare-fun res!181525 () Bool)

(assert (=> b!215758 (=> (not res!181525) (not e!146773))))

(assert (=> b!215758 (= res!181525 (bvsle (bitIndex!0 (size!4656 (buf!5191 thiss!1204)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204)) (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!340308))) (currentByte!9769 (_2!9892 lt!340308)) (currentBit!9764 (_2!9892 lt!340308)))))))

(declare-fun b!215759 () Bool)

(declare-fun e!146772 () Bool)

(assert (=> b!215759 (= e!146773 e!146772)))

(declare-fun res!181526 () Bool)

(assert (=> b!215759 (=> res!181526 e!146772)))

(assert (=> b!215759 (= res!181526 (= (size!4656 (buf!5191 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!215760 () Bool)

(assert (=> b!215760 (= e!146772 (arrayBitRangesEq!0 (buf!5191 thiss!1204) (buf!5191 (_2!9892 lt!340308)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4656 (buf!5191 thiss!1204)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204))))))

(assert (= (and d!72673 res!181524) b!215758))

(assert (= (and b!215758 res!181525) b!215759))

(assert (= (and b!215759 (not res!181526)) b!215760))

(assert (=> b!215758 m!331797))

(assert (=> b!215758 m!331803))

(assert (=> b!215760 m!331797))

(assert (=> b!215760 m!331797))

(declare-fun m!332265 () Bool)

(assert (=> b!215760 m!332265))

(assert (=> b!215555 d!72673))

(declare-fun d!72675 () Bool)

(assert (=> d!72675 (isPrefixOf!0 thiss!1204 (_2!9892 lt!340308))))

(declare-fun lt!340872 () Unit!15296)

(declare-fun choose!30 (BitStream!8420 BitStream!8420 BitStream!8420) Unit!15296)

(assert (=> d!72675 (= lt!340872 (choose!30 thiss!1204 (_2!9892 lt!340324) (_2!9892 lt!340308)))))

(assert (=> d!72675 (isPrefixOf!0 thiss!1204 (_2!9892 lt!340324))))

(assert (=> d!72675 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9892 lt!340324) (_2!9892 lt!340308)) lt!340872)))

(declare-fun bs!17823 () Bool)

(assert (= bs!17823 d!72675))

(assert (=> bs!17823 m!331805))

(declare-fun m!332267 () Bool)

(assert (=> bs!17823 m!332267))

(assert (=> bs!17823 m!331801))

(assert (=> b!215555 d!72675))

(declare-fun b!215876 () Bool)

(declare-fun res!181622 () Bool)

(declare-fun e!146843 () Bool)

(assert (=> b!215876 (=> (not res!181622) (not e!146843))))

(declare-fun lt!341282 () tuple2!18474)

(assert (=> b!215876 (= res!181622 (= (size!4656 (buf!5191 (_2!9892 lt!340324))) (size!4656 (buf!5191 (_2!9892 lt!341282)))))))

(declare-fun b!215877 () Bool)

(declare-fun e!146841 () Bool)

(declare-fun lt!341264 () (_ BitVec 64))

(assert (=> b!215877 (= e!146841 (validate_offset_bits!1 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!340324)))) ((_ sign_extend 32) (currentByte!9769 (_2!9892 lt!340324))) ((_ sign_extend 32) (currentBit!9764 (_2!9892 lt!340324))) lt!341264))))

(declare-fun b!215878 () Bool)

(declare-fun e!146839 () Bool)

(declare-fun lt!341247 () tuple2!18476)

(declare-fun lt!341254 () tuple2!18476)

(assert (=> b!215878 (= e!146839 (= (_2!9893 lt!341247) (_2!9893 lt!341254)))))

(declare-fun b!215879 () Bool)

(declare-fun e!146838 () tuple2!18474)

(declare-fun lt!341237 () tuple2!18474)

(assert (=> b!215879 (= e!146838 (tuple2!18475 (_1!9892 lt!341237) (_2!9892 lt!341237)))))

(declare-fun lt!341238 () Bool)

(assert (=> b!215879 (= lt!341238 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!341287 () tuple2!18474)

(assert (=> b!215879 (= lt!341287 (appendBit!0 (_2!9892 lt!340324) lt!341238))))

(declare-fun res!181619 () Bool)

(assert (=> b!215879 (= res!181619 (= (size!4656 (buf!5191 (_2!9892 lt!340324))) (size!4656 (buf!5191 (_2!9892 lt!341287)))))))

(declare-fun e!146846 () Bool)

(assert (=> b!215879 (=> (not res!181619) (not e!146846))))

(assert (=> b!215879 e!146846))

(declare-fun lt!341240 () tuple2!18474)

(assert (=> b!215879 (= lt!341240 lt!341287)))

(assert (=> b!215879 (= lt!341237 (appendBitsLSBFirstLoopTR!0 (_2!9892 lt!341240) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!341277 () Unit!15296)

(assert (=> b!215879 (= lt!341277 (lemmaIsPrefixTransitive!0 (_2!9892 lt!340324) (_2!9892 lt!341240) (_2!9892 lt!341237)))))

(declare-fun call!3366 () Bool)

(assert (=> b!215879 call!3366))

(declare-fun lt!341243 () Unit!15296)

(assert (=> b!215879 (= lt!341243 lt!341277)))

(assert (=> b!215879 (invariant!0 (currentBit!9764 (_2!9892 lt!340324)) (currentByte!9769 (_2!9892 lt!340324)) (size!4656 (buf!5191 (_2!9892 lt!341240))))))

(declare-fun lt!341288 () BitStream!8420)

(assert (=> b!215879 (= lt!341288 (BitStream!8421 (buf!5191 (_2!9892 lt!341240)) (currentByte!9769 (_2!9892 lt!340324)) (currentBit!9764 (_2!9892 lt!340324))))))

(assert (=> b!215879 (invariant!0 (currentBit!9764 lt!341288) (currentByte!9769 lt!341288) (size!4656 (buf!5191 (_2!9892 lt!341237))))))

(declare-fun lt!341290 () BitStream!8420)

(assert (=> b!215879 (= lt!341290 (BitStream!8421 (buf!5191 (_2!9892 lt!341237)) (currentByte!9769 lt!341288) (currentBit!9764 lt!341288)))))

(assert (=> b!215879 (= lt!341247 (readBitPure!0 lt!341288))))

(assert (=> b!215879 (= lt!341254 (readBitPure!0 lt!341290))))

(declare-fun lt!341289 () Unit!15296)

(assert (=> b!215879 (= lt!341289 (readBitPrefixLemma!0 lt!341288 (_2!9892 lt!341237)))))

(declare-fun res!181624 () Bool)

(assert (=> b!215879 (= res!181624 (= (bitIndex!0 (size!4656 (buf!5191 (_1!9893 lt!341247))) (currentByte!9769 (_1!9893 lt!341247)) (currentBit!9764 (_1!9893 lt!341247))) (bitIndex!0 (size!4656 (buf!5191 (_1!9893 lt!341254))) (currentByte!9769 (_1!9893 lt!341254)) (currentBit!9764 (_1!9893 lt!341254)))))))

(assert (=> b!215879 (=> (not res!181624) (not e!146839))))

(assert (=> b!215879 e!146839))

(declare-fun lt!341241 () Unit!15296)

(assert (=> b!215879 (= lt!341241 lt!341289)))

(declare-fun lt!341270 () tuple2!18480)

(assert (=> b!215879 (= lt!341270 (reader!0 (_2!9892 lt!340324) (_2!9892 lt!341237)))))

(declare-fun lt!341258 () tuple2!18480)

(assert (=> b!215879 (= lt!341258 (reader!0 (_2!9892 lt!341240) (_2!9892 lt!341237)))))

(declare-fun lt!341291 () tuple2!18476)

(assert (=> b!215879 (= lt!341291 (readBitPure!0 (_1!9895 lt!341270)))))

(assert (=> b!215879 (= (_2!9893 lt!341291) lt!341238)))

(declare-fun lt!341274 () Unit!15296)

(declare-fun Unit!15314 () Unit!15296)

(assert (=> b!215879 (= lt!341274 Unit!15314)))

(declare-fun lt!341267 () (_ BitVec 64))

(assert (=> b!215879 (= lt!341267 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!341275 () (_ BitVec 64))

(assert (=> b!215879 (= lt!341275 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!341246 () Unit!15296)

(assert (=> b!215879 (= lt!341246 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9892 lt!340324) (buf!5191 (_2!9892 lt!341237)) lt!341275))))

(assert (=> b!215879 (validate_offset_bits!1 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!341237)))) ((_ sign_extend 32) (currentByte!9769 (_2!9892 lt!340324))) ((_ sign_extend 32) (currentBit!9764 (_2!9892 lt!340324))) lt!341275)))

(declare-fun lt!341262 () Unit!15296)

(assert (=> b!215879 (= lt!341262 lt!341246)))

(declare-fun lt!341280 () tuple2!18478)

(assert (=> b!215879 (= lt!341280 (readNBitsLSBFirstsLoopPure!0 (_1!9895 lt!341270) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!341267))))

(declare-fun lt!341239 () (_ BitVec 64))

(assert (=> b!215879 (= lt!341239 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!341251 () Unit!15296)

(assert (=> b!215879 (= lt!341251 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9892 lt!341240) (buf!5191 (_2!9892 lt!341237)) lt!341239))))

(assert (=> b!215879 (validate_offset_bits!1 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!341237)))) ((_ sign_extend 32) (currentByte!9769 (_2!9892 lt!341240))) ((_ sign_extend 32) (currentBit!9764 (_2!9892 lt!341240))) lt!341239)))

(declare-fun lt!341272 () Unit!15296)

(assert (=> b!215879 (= lt!341272 lt!341251)))

(declare-fun lt!341253 () tuple2!18478)

(assert (=> b!215879 (= lt!341253 (readNBitsLSBFirstsLoopPure!0 (_1!9895 lt!341258) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!341267 (ite (_2!9893 lt!341291) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!341261 () tuple2!18478)

(assert (=> b!215879 (= lt!341261 (readNBitsLSBFirstsLoopPure!0 (_1!9895 lt!341270) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!341267))))

(declare-fun c!10531 () Bool)

(assert (=> b!215879 (= c!10531 (_2!9893 (readBitPure!0 (_1!9895 lt!341270))))))

(declare-fun e!146845 () (_ BitVec 64))

(declare-fun lt!341273 () tuple2!18478)

(assert (=> b!215879 (= lt!341273 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9895 lt!341270) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!341267 e!146845)))))

(declare-fun lt!341244 () Unit!15296)

(assert (=> b!215879 (= lt!341244 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9895 lt!341270) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!341267))))

(assert (=> b!215879 (and (= (_2!9894 lt!341261) (_2!9894 lt!341273)) (= (_1!9894 lt!341261) (_1!9894 lt!341273)))))

(declare-fun lt!341276 () Unit!15296)

(assert (=> b!215879 (= lt!341276 lt!341244)))

(assert (=> b!215879 (= (_1!9895 lt!341270) (withMovedBitIndex!0 (_2!9895 lt!341270) (bvsub (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!340324))) (currentByte!9769 (_2!9892 lt!340324)) (currentBit!9764 (_2!9892 lt!340324))) (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!341237))) (currentByte!9769 (_2!9892 lt!341237)) (currentBit!9764 (_2!9892 lt!341237))))))))

(declare-fun lt!341278 () Unit!15296)

(declare-fun Unit!15316 () Unit!15296)

(assert (=> b!215879 (= lt!341278 Unit!15316)))

(assert (=> b!215879 (= (_1!9895 lt!341258) (withMovedBitIndex!0 (_2!9895 lt!341258) (bvsub (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!341240))) (currentByte!9769 (_2!9892 lt!341240)) (currentBit!9764 (_2!9892 lt!341240))) (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!341237))) (currentByte!9769 (_2!9892 lt!341237)) (currentBit!9764 (_2!9892 lt!341237))))))))

(declare-fun lt!341252 () Unit!15296)

(declare-fun Unit!15317 () Unit!15296)

(assert (=> b!215879 (= lt!341252 Unit!15317)))

(assert (=> b!215879 (= (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!340324))) (currentByte!9769 (_2!9892 lt!340324)) (currentBit!9764 (_2!9892 lt!340324))) (bvsub (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!341240))) (currentByte!9769 (_2!9892 lt!341240)) (currentBit!9764 (_2!9892 lt!341240))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!341259 () Unit!15296)

(declare-fun Unit!15318 () Unit!15296)

(assert (=> b!215879 (= lt!341259 Unit!15318)))

(assert (=> b!215879 (= (_2!9894 lt!341280) (_2!9894 lt!341253))))

(declare-fun lt!341249 () Unit!15296)

(declare-fun Unit!15319 () Unit!15296)

(assert (=> b!215879 (= lt!341249 Unit!15319)))

(assert (=> b!215879 (invariant!0 (currentBit!9764 (_2!9892 lt!341237)) (currentByte!9769 (_2!9892 lt!341237)) (size!4656 (buf!5191 (_2!9892 lt!341237))))))

(declare-fun lt!341255 () Unit!15296)

(declare-fun Unit!15320 () Unit!15296)

(assert (=> b!215879 (= lt!341255 Unit!15320)))

(assert (=> b!215879 (= (size!4656 (buf!5191 (_2!9892 lt!340324))) (size!4656 (buf!5191 (_2!9892 lt!341237))))))

(declare-fun lt!341266 () Unit!15296)

(declare-fun Unit!15321 () Unit!15296)

(assert (=> b!215879 (= lt!341266 Unit!15321)))

(assert (=> b!215879 (= (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!341237))) (currentByte!9769 (_2!9892 lt!341237)) (currentBit!9764 (_2!9892 lt!341237))) (bvsub (bvadd (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!340324))) (currentByte!9769 (_2!9892 lt!340324)) (currentBit!9764 (_2!9892 lt!340324))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!341271 () Unit!15296)

(declare-fun Unit!15322 () Unit!15296)

(assert (=> b!215879 (= lt!341271 Unit!15322)))

(declare-fun lt!341257 () Unit!15296)

(declare-fun Unit!15323 () Unit!15296)

(assert (=> b!215879 (= lt!341257 Unit!15323)))

(declare-fun lt!341269 () tuple2!18480)

(assert (=> b!215879 (= lt!341269 (reader!0 (_2!9892 lt!340324) (_2!9892 lt!341237)))))

(declare-fun lt!341250 () (_ BitVec 64))

(assert (=> b!215879 (= lt!341250 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!341260 () Unit!15296)

(assert (=> b!215879 (= lt!341260 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9892 lt!340324) (buf!5191 (_2!9892 lt!341237)) lt!341250))))

(assert (=> b!215879 (validate_offset_bits!1 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!341237)))) ((_ sign_extend 32) (currentByte!9769 (_2!9892 lt!340324))) ((_ sign_extend 32) (currentBit!9764 (_2!9892 lt!340324))) lt!341250)))

(declare-fun lt!341284 () Unit!15296)

(assert (=> b!215879 (= lt!341284 lt!341260)))

(declare-fun lt!341279 () tuple2!18478)

(assert (=> b!215879 (= lt!341279 (readNBitsLSBFirstsLoopPure!0 (_1!9895 lt!341269) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!181629 () Bool)

(assert (=> b!215879 (= res!181629 (= (_2!9894 lt!341279) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!146842 () Bool)

(assert (=> b!215879 (=> (not res!181629) (not e!146842))))

(assert (=> b!215879 e!146842))

(declare-fun lt!341292 () Unit!15296)

(declare-fun Unit!15324 () Unit!15296)

(assert (=> b!215879 (= lt!341292 Unit!15324)))

(declare-fun b!215880 () Bool)

(declare-fun res!181627 () Bool)

(assert (=> b!215880 (=> (not res!181627) (not e!146843))))

(assert (=> b!215880 (= res!181627 (isPrefixOf!0 (_2!9892 lt!340324) (_2!9892 lt!341282)))))

(declare-fun b!215881 () Bool)

(declare-fun res!181630 () Bool)

(assert (=> b!215881 (= res!181630 (isPrefixOf!0 (_2!9892 lt!340324) (_2!9892 lt!341287)))))

(assert (=> b!215881 (=> (not res!181630) (not e!146846))))

(declare-fun c!10532 () Bool)

(declare-fun bm!3363 () Bool)

(assert (=> bm!3363 (= call!3366 (isPrefixOf!0 (_2!9892 lt!340324) (ite c!10532 (_2!9892 lt!340324) (_2!9892 lt!341237))))))

(declare-fun d!72677 () Bool)

(assert (=> d!72677 e!146843))

(declare-fun res!181626 () Bool)

(assert (=> d!72677 (=> (not res!181626) (not e!146843))))

(assert (=> d!72677 (= res!181626 (invariant!0 (currentBit!9764 (_2!9892 lt!341282)) (currentByte!9769 (_2!9892 lt!341282)) (size!4656 (buf!5191 (_2!9892 lt!341282)))))))

(assert (=> d!72677 (= lt!341282 e!146838)))

(assert (=> d!72677 (= c!10532 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!72677 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!72677 (= (appendBitsLSBFirstLoopTR!0 (_2!9892 lt!340324) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!341282)))

(declare-fun b!215882 () Bool)

(declare-fun Unit!15325 () Unit!15296)

(assert (=> b!215882 (= e!146838 (tuple2!18475 Unit!15325 (_2!9892 lt!340324)))))

(declare-fun lt!341283 () Unit!15296)

(assert (=> b!215882 (= lt!341283 (lemmaIsPrefixRefl!0 (_2!9892 lt!340324)))))

(assert (=> b!215882 call!3366))

(declare-fun lt!341263 () Unit!15296)

(assert (=> b!215882 (= lt!341263 lt!341283)))

(declare-fun b!215883 () Bool)

(assert (=> b!215883 (= e!146842 (= (_1!9894 lt!341279) (_2!9895 lt!341269)))))

(declare-fun b!215884 () Bool)

(declare-fun e!146840 () Bool)

(declare-fun lt!341245 () tuple2!18476)

(assert (=> b!215884 (= e!146840 (= (bitIndex!0 (size!4656 (buf!5191 (_1!9893 lt!341245))) (currentByte!9769 (_1!9893 lt!341245)) (currentBit!9764 (_1!9893 lt!341245))) (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!341287))) (currentByte!9769 (_2!9892 lt!341287)) (currentBit!9764 (_2!9892 lt!341287)))))))

(declare-fun b!215885 () Bool)

(declare-fun e!146844 () Bool)

(assert (=> b!215885 (= e!146843 e!146844)))

(declare-fun res!181628 () Bool)

(assert (=> b!215885 (=> (not res!181628) (not e!146844))))

(declare-fun lt!341285 () tuple2!18478)

(assert (=> b!215885 (= res!181628 (= (_2!9894 lt!341285) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun lt!341286 () tuple2!18480)

(assert (=> b!215885 (= lt!341285 (readNBitsLSBFirstsLoopPure!0 (_1!9895 lt!341286) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!341268 () Unit!15296)

(declare-fun lt!341256 () Unit!15296)

(assert (=> b!215885 (= lt!341268 lt!341256)))

(assert (=> b!215885 (validate_offset_bits!1 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!341282)))) ((_ sign_extend 32) (currentByte!9769 (_2!9892 lt!340324))) ((_ sign_extend 32) (currentBit!9764 (_2!9892 lt!340324))) lt!341264)))

(assert (=> b!215885 (= lt!341256 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9892 lt!340324) (buf!5191 (_2!9892 lt!341282)) lt!341264))))

(assert (=> b!215885 e!146841))

(declare-fun res!181623 () Bool)

(assert (=> b!215885 (=> (not res!181623) (not e!146841))))

(assert (=> b!215885 (= res!181623 (and (= (size!4656 (buf!5191 (_2!9892 lt!340324))) (size!4656 (buf!5191 (_2!9892 lt!341282)))) (bvsge lt!341264 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!215885 (= lt!341264 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!215885 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!215885 (= lt!341286 (reader!0 (_2!9892 lt!340324) (_2!9892 lt!341282)))))

(declare-fun b!215886 () Bool)

(assert (=> b!215886 (= e!146845 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!215887 () Bool)

(assert (=> b!215887 (= e!146844 (= (_1!9894 lt!341285) (_2!9895 lt!341286)))))

(declare-fun b!215888 () Bool)

(declare-fun res!181625 () Bool)

(assert (=> b!215888 (=> (not res!181625) (not e!146843))))

(declare-fun lt!341265 () (_ BitVec 64))

(declare-fun lt!341281 () (_ BitVec 64))

(assert (=> b!215888 (= res!181625 (= (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!341282))) (currentByte!9769 (_2!9892 lt!341282)) (currentBit!9764 (_2!9892 lt!341282))) (bvsub lt!341281 lt!341265)))))

(assert (=> b!215888 (or (= (bvand lt!341281 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!341265 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!341281 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!341281 lt!341265) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!215888 (= lt!341265 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!341242 () (_ BitVec 64))

(declare-fun lt!341248 () (_ BitVec 64))

(assert (=> b!215888 (= lt!341281 (bvadd lt!341242 lt!341248))))

(assert (=> b!215888 (or (not (= (bvand lt!341242 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!341248 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!341242 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!341242 lt!341248) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!215888 (= lt!341248 ((_ sign_extend 32) nBits!348))))

(assert (=> b!215888 (= lt!341242 (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!340324))) (currentByte!9769 (_2!9892 lt!340324)) (currentBit!9764 (_2!9892 lt!340324))))))

(declare-fun b!215889 () Bool)

(assert (=> b!215889 (= e!146845 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!215890 () Bool)

(declare-fun res!181621 () Bool)

(assert (=> b!215890 (= res!181621 (= (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!341287))) (currentByte!9769 (_2!9892 lt!341287)) (currentBit!9764 (_2!9892 lt!341287))) (bvadd (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!340324))) (currentByte!9769 (_2!9892 lt!340324)) (currentBit!9764 (_2!9892 lt!340324))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!215890 (=> (not res!181621) (not e!146846))))

(declare-fun b!215891 () Bool)

(assert (=> b!215891 (= lt!341245 (readBitPure!0 (readerFrom!0 (_2!9892 lt!341287) (currentBit!9764 (_2!9892 lt!340324)) (currentByte!9769 (_2!9892 lt!340324)))))))

(declare-fun res!181620 () Bool)

(assert (=> b!215891 (= res!181620 (and (= (_2!9893 lt!341245) lt!341238) (= (_1!9893 lt!341245) (_2!9892 lt!341287))))))

(assert (=> b!215891 (=> (not res!181620) (not e!146840))))

(assert (=> b!215891 (= e!146846 e!146840)))

(assert (= (and d!72677 c!10532) b!215882))

(assert (= (and d!72677 (not c!10532)) b!215879))

(assert (= (and b!215879 res!181619) b!215890))

(assert (= (and b!215890 res!181621) b!215881))

(assert (= (and b!215881 res!181630) b!215891))

(assert (= (and b!215891 res!181620) b!215884))

(assert (= (and b!215879 res!181624) b!215878))

(assert (= (and b!215879 c!10531) b!215889))

(assert (= (and b!215879 (not c!10531)) b!215886))

(assert (= (and b!215879 res!181629) b!215883))

(assert (= (or b!215882 b!215879) bm!3363))

(assert (= (and d!72677 res!181626) b!215876))

(assert (= (and b!215876 res!181622) b!215888))

(assert (= (and b!215888 res!181625) b!215880))

(assert (= (and b!215880 res!181627) b!215885))

(assert (= (and b!215885 res!181623) b!215877))

(assert (= (and b!215885 res!181628) b!215887))

(declare-fun m!332451 () Bool)

(assert (=> bm!3363 m!332451))

(assert (=> b!215882 m!332153))

(declare-fun m!332453 () Bool)

(assert (=> b!215891 m!332453))

(assert (=> b!215891 m!332453))

(declare-fun m!332455 () Bool)

(assert (=> b!215891 m!332455))

(declare-fun m!332457 () Bool)

(assert (=> b!215879 m!332457))

(declare-fun m!332459 () Bool)

(assert (=> b!215879 m!332459))

(assert (=> b!215879 m!332457))

(declare-fun m!332461 () Bool)

(assert (=> b!215879 m!332461))

(declare-fun m!332463 () Bool)

(assert (=> b!215879 m!332463))

(declare-fun m!332465 () Bool)

(assert (=> b!215879 m!332465))

(declare-fun m!332467 () Bool)

(assert (=> b!215879 m!332467))

(declare-fun m!332469 () Bool)

(assert (=> b!215879 m!332469))

(declare-fun m!332471 () Bool)

(assert (=> b!215879 m!332471))

(declare-fun m!332473 () Bool)

(assert (=> b!215879 m!332473))

(declare-fun m!332475 () Bool)

(assert (=> b!215879 m!332475))

(assert (=> b!215879 m!331793))

(declare-fun m!332477 () Bool)

(assert (=> b!215879 m!332477))

(declare-fun m!332479 () Bool)

(assert (=> b!215879 m!332479))

(declare-fun m!332481 () Bool)

(assert (=> b!215879 m!332481))

(declare-fun m!332483 () Bool)

(assert (=> b!215879 m!332483))

(declare-fun m!332485 () Bool)

(assert (=> b!215879 m!332485))

(declare-fun m!332487 () Bool)

(assert (=> b!215879 m!332487))

(declare-fun m!332489 () Bool)

(assert (=> b!215879 m!332489))

(declare-fun m!332491 () Bool)

(assert (=> b!215879 m!332491))

(declare-fun m!332493 () Bool)

(assert (=> b!215879 m!332493))

(declare-fun m!332495 () Bool)

(assert (=> b!215879 m!332495))

(declare-fun m!332497 () Bool)

(assert (=> b!215879 m!332497))

(declare-fun m!332499 () Bool)

(assert (=> b!215879 m!332499))

(declare-fun m!332501 () Bool)

(assert (=> b!215879 m!332501))

(declare-fun m!332503 () Bool)

(assert (=> b!215879 m!332503))

(declare-fun m!332505 () Bool)

(assert (=> b!215879 m!332505))

(declare-fun m!332507 () Bool)

(assert (=> b!215879 m!332507))

(assert (=> b!215879 m!331795))

(declare-fun m!332509 () Bool)

(assert (=> b!215879 m!332509))

(declare-fun m!332511 () Bool)

(assert (=> b!215879 m!332511))

(declare-fun m!332513 () Bool)

(assert (=> b!215879 m!332513))

(declare-fun m!332515 () Bool)

(assert (=> b!215879 m!332515))

(declare-fun m!332517 () Bool)

(assert (=> b!215879 m!332517))

(declare-fun m!332519 () Bool)

(assert (=> b!215884 m!332519))

(declare-fun m!332521 () Bool)

(assert (=> b!215884 m!332521))

(declare-fun m!332523 () Bool)

(assert (=> b!215877 m!332523))

(declare-fun m!332525 () Bool)

(assert (=> b!215881 m!332525))

(declare-fun m!332527 () Bool)

(assert (=> d!72677 m!332527))

(assert (=> b!215890 m!332521))

(assert (=> b!215890 m!331795))

(declare-fun m!332529 () Bool)

(assert (=> b!215885 m!332529))

(declare-fun m!332531 () Bool)

(assert (=> b!215885 m!332531))

(declare-fun m!332533 () Bool)

(assert (=> b!215885 m!332533))

(assert (=> b!215885 m!331793))

(declare-fun m!332535 () Bool)

(assert (=> b!215885 m!332535))

(assert (=> b!215885 m!332479))

(declare-fun m!332537 () Bool)

(assert (=> b!215880 m!332537))

(declare-fun m!332539 () Bool)

(assert (=> b!215888 m!332539))

(assert (=> b!215888 m!331795))

(assert (=> b!215555 d!72677))

(declare-fun d!72721 () Bool)

(assert (=> d!72721 (= (invariant!0 (currentBit!9764 thiss!1204) (currentByte!9769 thiss!1204) (size!4656 (buf!5191 thiss!1204))) (and (bvsge (currentBit!9764 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9764 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9769 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9769 thiss!1204) (size!4656 (buf!5191 thiss!1204))) (and (= (currentBit!9764 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9769 thiss!1204) (size!4656 (buf!5191 thiss!1204)))))))))

(assert (=> b!215554 d!72721))

(declare-fun d!72723 () Bool)

(declare-fun e!146847 () Bool)

(assert (=> d!72723 e!146847))

(declare-fun res!181631 () Bool)

(assert (=> d!72723 (=> (not res!181631) (not e!146847))))

(declare-fun lt!341294 () (_ BitVec 64))

(declare-fun lt!341293 () BitStream!8420)

(assert (=> d!72723 (= res!181631 (= (bvadd lt!341294 (bvsub lt!340311 lt!340320)) (bitIndex!0 (size!4656 (buf!5191 lt!341293)) (currentByte!9769 lt!341293) (currentBit!9764 lt!341293))))))

(assert (=> d!72723 (or (not (= (bvand lt!341294 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!340311 lt!340320) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!341294 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!341294 (bvsub lt!340311 lt!340320)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72723 (= lt!341294 (bitIndex!0 (size!4656 (buf!5191 (_2!9895 lt!340318))) (currentByte!9769 (_2!9895 lt!340318)) (currentBit!9764 (_2!9895 lt!340318))))))

(assert (=> d!72723 (= lt!341293 (_2!9892 (moveBitIndex!0 (_2!9895 lt!340318) (bvsub lt!340311 lt!340320))))))

(assert (=> d!72723 (moveBitIndexPrecond!0 (_2!9895 lt!340318) (bvsub lt!340311 lt!340320))))

(assert (=> d!72723 (= (withMovedBitIndex!0 (_2!9895 lt!340318) (bvsub lt!340311 lt!340320)) lt!341293)))

(declare-fun b!215892 () Bool)

(assert (=> b!215892 (= e!146847 (= (size!4656 (buf!5191 (_2!9895 lt!340318))) (size!4656 (buf!5191 lt!341293))))))

(assert (= (and d!72723 res!181631) b!215892))

(declare-fun m!332541 () Bool)

(assert (=> d!72723 m!332541))

(assert (=> d!72723 m!331869))

(declare-fun m!332543 () Bool)

(assert (=> d!72723 m!332543))

(declare-fun m!332545 () Bool)

(assert (=> d!72723 m!332545))

(assert (=> b!215543 d!72723))

(declare-fun d!72725 () Bool)

(assert (=> d!72725 (= (invariant!0 (currentBit!9764 thiss!1204) (currentByte!9769 thiss!1204) (size!4656 (buf!5191 (_2!9892 lt!340308)))) (and (bvsge (currentBit!9764 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9764 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9769 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9769 thiss!1204) (size!4656 (buf!5191 (_2!9892 lt!340308)))) (and (= (currentBit!9764 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9769 thiss!1204) (size!4656 (buf!5191 (_2!9892 lt!340308))))))))))

(assert (=> b!215542 d!72725))

(push 1)

(assert (not b!215877))

(assert (not b!215748))

(assert (not b!215713))

(assert (not bm!3363))

(assert (not d!72597))

(assert (not b!215747))

(assert (not b!215628))

(assert (not d!72677))

(assert (not d!72669))

(assert (not b!215630))

(assert (not d!72633))

(assert (not b!215706))

(assert (not d!72593))

(assert (not d!72653))

(assert (not d!72591))

(assert (not b!215671))

(assert (not b!215746))

(assert (not b!215758))

(assert (not b!215880))

(assert (not b!215879))

(assert (not b!215890))

(assert (not b!215884))

(assert (not b!215885))

(assert (not d!72667))

(assert (not d!72647))

(assert (not d!72641))

(assert (not d!72585))

(assert (not b!215888))

(assert (not d!72559))

(assert (not b!215667))

(assert (not b!215703))

(assert (not d!72649))

(assert (not b!215749))

(assert (not b!215670))

(assert (not b!215704))

(assert (not d!72613))

(assert (not d!72675))

(assert (not d!72723))

(assert (not d!72625))

(assert (not d!72639))

(assert (not d!72671))

(assert (not b!215760))

(assert (not b!215881))

(assert (not b!215668))

(assert (not d!72587))

(assert (not d!72631))

(assert (not b!215710))

(assert (not d!72651))

(assert (not d!72589))

(assert (not d!72635))

(assert (not d!72595))

(assert (not d!72617))

(assert (not d!72605))

(assert (not b!215882))

(assert (not d!72603))

(assert (not b!215708))

(assert (not b!215707))

(assert (not d!72615))

(assert (not d!72665))

(assert (not d!72563))

(assert (not d!72655))

(assert (not b!215891))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!72983 () Bool)

(assert (=> d!72983 (= (remainingBits!0 ((_ sign_extend 32) (size!4656 (buf!5191 thiss!1204))) ((_ sign_extend 32) (currentByte!9769 thiss!1204)) ((_ sign_extend 32) (currentBit!9764 thiss!1204))) (bvsub (bvmul ((_ sign_extend 32) (size!4656 (buf!5191 thiss!1204))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9769 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9764 thiss!1204)))))))

(assert (=> d!72669 d!72983))

(declare-fun b!216212 () Bool)

(declare-fun res!181894 () Bool)

(declare-fun e!147056 () Bool)

(assert (=> b!216212 (=> (not res!181894) (not e!147056))))

(declare-fun lt!341891 () tuple2!18488)

(assert (=> b!216212 (= res!181894 (= (bvand (_1!9899 lt!341891) (onesLSBLong!0 nBits!348)) (_1!9899 lt!341891)))))

(declare-fun b!216213 () Bool)

(declare-fun e!147057 () Bool)

(assert (=> b!216213 (= e!147056 e!147057)))

(declare-fun res!181891 () Bool)

(assert (=> b!216213 (=> res!181891 e!147057)))

(assert (=> b!216213 (= res!181891 (not (bvslt (bvadd #b00000000000000000000000000000001 i!590) nBits!348)))))

(declare-fun b!216214 () Bool)

(declare-fun e!147058 () tuple2!18488)

(declare-fun lt!341889 () tuple2!18488)

(assert (=> b!216214 (= e!147058 (tuple2!18489 (_1!9899 lt!341889) (_2!9899 lt!341889)))))

(declare-fun lt!341890 () tuple2!18486)

(assert (=> b!216214 (= lt!341890 (readBit!0 lt!340326))))

(assert (=> b!216214 (= lt!341889 (readNBitsLSBFirstsLoop!0 (_2!9898 lt!341890) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!340322 (ite (_1!9898 lt!341890) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!216215 () Bool)

(assert (=> b!216215 (= e!147058 (tuple2!18489 lt!340322 lt!340326))))

(declare-fun lt!341894 () (_ BitVec 64))

(declare-fun b!216216 () Bool)

(assert (=> b!216216 (= e!147057 (= (= (bvand (bvlshr (_1!9899 lt!341891) lt!341894) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!9893 (readBitPure!0 lt!340326))))))

(assert (=> b!216216 (and (bvsge lt!341894 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!341894 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!216216 (= lt!341894 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun d!72985 () Bool)

(assert (=> d!72985 e!147056))

(declare-fun res!181890 () Bool)

(assert (=> d!72985 (=> (not res!181890) (not e!147056))))

(assert (=> d!72985 (= res!181890 (= (buf!5191 (_2!9899 lt!341891)) (buf!5191 lt!340326)))))

(assert (=> d!72985 (= lt!341891 e!147058)))

(declare-fun c!10561 () Bool)

(assert (=> d!72985 (= c!10561 (= nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(assert (=> d!72985 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!590)) (bvsle (bvadd #b00000000000000000000000000000001 i!590) nBits!348) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!72985 (= (readNBitsLSBFirstsLoop!0 lt!340326 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!340322) lt!341891)))

(declare-fun b!216217 () Bool)

(declare-fun res!181892 () Bool)

(assert (=> b!216217 (=> (not res!181892) (not e!147056))))

(declare-fun lt!341893 () (_ BitVec 64))

(declare-fun lt!341892 () (_ BitVec 64))

(assert (=> b!216217 (= res!181892 (= (bitIndex!0 (size!4656 (buf!5191 (_2!9899 lt!341891))) (currentByte!9769 (_2!9899 lt!341891)) (currentBit!9764 (_2!9899 lt!341891))) (bvadd lt!341893 lt!341892)))))

(assert (=> b!216217 (or (not (= (bvand lt!341893 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!341892 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!341893 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!341893 lt!341892) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216217 (= lt!341892 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!216217 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!216217 (= lt!341893 (bitIndex!0 (size!4656 (buf!5191 lt!340326)) (currentByte!9769 lt!340326) (currentBit!9764 lt!340326)))))

(declare-fun b!216218 () Bool)

(declare-fun res!181893 () Bool)

(assert (=> b!216218 (=> (not res!181893) (not e!147056))))

(assert (=> b!216218 (= res!181893 (= (bvand (_1!9899 lt!341891) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))) (bvand lt!340322 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(assert (= (and d!72985 c!10561) b!216215))

(assert (= (and d!72985 (not c!10561)) b!216214))

(assert (= (and d!72985 res!181890) b!216217))

(assert (= (and b!216217 res!181892) b!216218))

(assert (= (and b!216218 res!181893) b!216212))

(assert (= (and b!216212 res!181894) b!216213))

(assert (= (and b!216213 (not res!181891)) b!216216))

(declare-fun m!333227 () Bool)

(assert (=> b!216217 m!333227))

(declare-fun m!333229 () Bool)

(assert (=> b!216217 m!333229))

(assert (=> b!216212 m!331793))

(declare-fun m!333231 () Bool)

(assert (=> b!216214 m!333231))

(declare-fun m!333233 () Bool)

(assert (=> b!216214 m!333233))

(declare-fun m!333235 () Bool)

(assert (=> b!216216 m!333235))

(assert (=> b!216218 m!332479))

(assert (=> d!72665 d!72985))

(declare-fun d!72987 () Bool)

(declare-fun e!147059 () Bool)

(assert (=> d!72987 e!147059))

(declare-fun res!181895 () Bool)

(assert (=> d!72987 (=> (not res!181895) (not e!147059))))

(declare-fun lt!341896 () (_ BitVec 64))

(declare-fun lt!341899 () (_ BitVec 64))

(declare-fun lt!341898 () (_ BitVec 64))

(assert (=> d!72987 (= res!181895 (= lt!341898 (bvsub lt!341899 lt!341896)))))

(assert (=> d!72987 (or (= (bvand lt!341899 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!341896 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!341899 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!341899 lt!341896) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72987 (= lt!341896 (remainingBits!0 ((_ sign_extend 32) (size!4656 (buf!5191 (_1!9893 lt!341245)))) ((_ sign_extend 32) (currentByte!9769 (_1!9893 lt!341245))) ((_ sign_extend 32) (currentBit!9764 (_1!9893 lt!341245)))))))

(declare-fun lt!341897 () (_ BitVec 64))

(declare-fun lt!341895 () (_ BitVec 64))

(assert (=> d!72987 (= lt!341899 (bvmul lt!341897 lt!341895))))

(assert (=> d!72987 (or (= lt!341897 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!341895 (bvsdiv (bvmul lt!341897 lt!341895) lt!341897)))))

(assert (=> d!72987 (= lt!341895 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72987 (= lt!341897 ((_ sign_extend 32) (size!4656 (buf!5191 (_1!9893 lt!341245)))))))

(assert (=> d!72987 (= lt!341898 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9769 (_1!9893 lt!341245))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9764 (_1!9893 lt!341245)))))))

(assert (=> d!72987 (invariant!0 (currentBit!9764 (_1!9893 lt!341245)) (currentByte!9769 (_1!9893 lt!341245)) (size!4656 (buf!5191 (_1!9893 lt!341245))))))

(assert (=> d!72987 (= (bitIndex!0 (size!4656 (buf!5191 (_1!9893 lt!341245))) (currentByte!9769 (_1!9893 lt!341245)) (currentBit!9764 (_1!9893 lt!341245))) lt!341898)))

(declare-fun b!216219 () Bool)

(declare-fun res!181896 () Bool)

(assert (=> b!216219 (=> (not res!181896) (not e!147059))))

(assert (=> b!216219 (= res!181896 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!341898))))

(declare-fun b!216220 () Bool)

(declare-fun lt!341900 () (_ BitVec 64))

(assert (=> b!216220 (= e!147059 (bvsle lt!341898 (bvmul lt!341900 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216220 (or (= lt!341900 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!341900 #b0000000000000000000000000000000000000000000000000000000000001000) lt!341900)))))

(assert (=> b!216220 (= lt!341900 ((_ sign_extend 32) (size!4656 (buf!5191 (_1!9893 lt!341245)))))))

(assert (= (and d!72987 res!181895) b!216219))

(assert (= (and b!216219 res!181896) b!216220))

(declare-fun m!333237 () Bool)

(assert (=> d!72987 m!333237))

(declare-fun m!333239 () Bool)

(assert (=> d!72987 m!333239))

(assert (=> b!215884 d!72987))

(declare-fun d!72989 () Bool)

(declare-fun e!147060 () Bool)

(assert (=> d!72989 e!147060))

(declare-fun res!181897 () Bool)

(assert (=> d!72989 (=> (not res!181897) (not e!147060))))

(declare-fun lt!341905 () (_ BitVec 64))

(declare-fun lt!341902 () (_ BitVec 64))

(declare-fun lt!341904 () (_ BitVec 64))

(assert (=> d!72989 (= res!181897 (= lt!341904 (bvsub lt!341905 lt!341902)))))

(assert (=> d!72989 (or (= (bvand lt!341905 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!341902 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!341905 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!341905 lt!341902) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72989 (= lt!341902 (remainingBits!0 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!341287)))) ((_ sign_extend 32) (currentByte!9769 (_2!9892 lt!341287))) ((_ sign_extend 32) (currentBit!9764 (_2!9892 lt!341287)))))))

(declare-fun lt!341903 () (_ BitVec 64))

(declare-fun lt!341901 () (_ BitVec 64))

(assert (=> d!72989 (= lt!341905 (bvmul lt!341903 lt!341901))))

(assert (=> d!72989 (or (= lt!341903 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!341901 (bvsdiv (bvmul lt!341903 lt!341901) lt!341903)))))

(assert (=> d!72989 (= lt!341901 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72989 (= lt!341903 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!341287)))))))

(assert (=> d!72989 (= lt!341904 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9769 (_2!9892 lt!341287))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9764 (_2!9892 lt!341287)))))))

(assert (=> d!72989 (invariant!0 (currentBit!9764 (_2!9892 lt!341287)) (currentByte!9769 (_2!9892 lt!341287)) (size!4656 (buf!5191 (_2!9892 lt!341287))))))

(assert (=> d!72989 (= (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!341287))) (currentByte!9769 (_2!9892 lt!341287)) (currentBit!9764 (_2!9892 lt!341287))) lt!341904)))

(declare-fun b!216221 () Bool)

(declare-fun res!181898 () Bool)

(assert (=> b!216221 (=> (not res!181898) (not e!147060))))

(assert (=> b!216221 (= res!181898 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!341904))))

(declare-fun b!216222 () Bool)

(declare-fun lt!341906 () (_ BitVec 64))

(assert (=> b!216222 (= e!147060 (bvsle lt!341904 (bvmul lt!341906 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216222 (or (= lt!341906 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!341906 #b0000000000000000000000000000000000000000000000000000000000001000) lt!341906)))))

(assert (=> b!216222 (= lt!341906 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!341287)))))))

(assert (= (and d!72989 res!181897) b!216221))

(assert (= (and b!216221 res!181898) b!216222))

(declare-fun m!333241 () Bool)

(assert (=> d!72989 m!333241))

(declare-fun m!333243 () Bool)

(assert (=> d!72989 m!333243))

(assert (=> b!215884 d!72989))

(assert (=> d!72559 d!72721))

(declare-fun d!72991 () Bool)

(declare-fun e!147061 () Bool)

(assert (=> d!72991 e!147061))

(declare-fun res!181899 () Bool)

(assert (=> d!72991 (=> (not res!181899) (not e!147061))))

(declare-fun lt!341911 () (_ BitVec 64))

(declare-fun lt!341908 () (_ BitVec 64))

(declare-fun lt!341910 () (_ BitVec 64))

(assert (=> d!72991 (= res!181899 (= lt!341910 (bvsub lt!341911 lt!341908)))))

(assert (=> d!72991 (or (= (bvand lt!341911 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!341908 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!341911 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!341911 lt!341908) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72991 (= lt!341908 (remainingBits!0 ((_ sign_extend 32) (size!4656 (buf!5191 lt!340765))) ((_ sign_extend 32) (currentByte!9769 lt!340765)) ((_ sign_extend 32) (currentBit!9764 lt!340765))))))

(declare-fun lt!341909 () (_ BitVec 64))

(declare-fun lt!341907 () (_ BitVec 64))

(assert (=> d!72991 (= lt!341911 (bvmul lt!341909 lt!341907))))

(assert (=> d!72991 (or (= lt!341909 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!341907 (bvsdiv (bvmul lt!341909 lt!341907) lt!341909)))))

(assert (=> d!72991 (= lt!341907 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72991 (= lt!341909 ((_ sign_extend 32) (size!4656 (buf!5191 lt!340765))))))

(assert (=> d!72991 (= lt!341910 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9769 lt!340765)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9764 lt!340765))))))

(assert (=> d!72991 (invariant!0 (currentBit!9764 lt!340765) (currentByte!9769 lt!340765) (size!4656 (buf!5191 lt!340765)))))

(assert (=> d!72991 (= (bitIndex!0 (size!4656 (buf!5191 lt!340765)) (currentByte!9769 lt!340765) (currentBit!9764 lt!340765)) lt!341910)))

(declare-fun b!216223 () Bool)

(declare-fun res!181900 () Bool)

(assert (=> b!216223 (=> (not res!181900) (not e!147061))))

(assert (=> b!216223 (= res!181900 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!341910))))

(declare-fun b!216224 () Bool)

(declare-fun lt!341912 () (_ BitVec 64))

(assert (=> b!216224 (= e!147061 (bvsle lt!341910 (bvmul lt!341912 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216224 (or (= lt!341912 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!341912 #b0000000000000000000000000000000000000000000000000000000000001000) lt!341912)))))

(assert (=> b!216224 (= lt!341912 ((_ sign_extend 32) (size!4656 (buf!5191 lt!340765))))))

(assert (= (and d!72991 res!181899) b!216223))

(assert (= (and b!216223 res!181900) b!216224))

(declare-fun m!333245 () Bool)

(assert (=> d!72991 m!333245))

(declare-fun m!333247 () Bool)

(assert (=> d!72991 m!333247))

(assert (=> d!72651 d!72991))

(declare-fun d!72993 () Bool)

(declare-fun e!147062 () Bool)

(assert (=> d!72993 e!147062))

(declare-fun res!181901 () Bool)

(assert (=> d!72993 (=> (not res!181901) (not e!147062))))

(declare-fun lt!341916 () (_ BitVec 64))

(declare-fun lt!341914 () (_ BitVec 64))

(declare-fun lt!341917 () (_ BitVec 64))

(assert (=> d!72993 (= res!181901 (= lt!341916 (bvsub lt!341917 lt!341914)))))

(assert (=> d!72993 (or (= (bvand lt!341917 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!341914 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!341917 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!341917 lt!341914) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72993 (= lt!341914 (remainingBits!0 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9895 lt!340310)))) ((_ sign_extend 32) (currentByte!9769 (_2!9895 lt!340310))) ((_ sign_extend 32) (currentBit!9764 (_2!9895 lt!340310)))))))

(declare-fun lt!341915 () (_ BitVec 64))

(declare-fun lt!341913 () (_ BitVec 64))

(assert (=> d!72993 (= lt!341917 (bvmul lt!341915 lt!341913))))

(assert (=> d!72993 (or (= lt!341915 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!341913 (bvsdiv (bvmul lt!341915 lt!341913) lt!341915)))))

(assert (=> d!72993 (= lt!341913 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72993 (= lt!341915 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9895 lt!340310)))))))

(assert (=> d!72993 (= lt!341916 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9769 (_2!9895 lt!340310))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9764 (_2!9895 lt!340310)))))))

(assert (=> d!72993 (invariant!0 (currentBit!9764 (_2!9895 lt!340310)) (currentByte!9769 (_2!9895 lt!340310)) (size!4656 (buf!5191 (_2!9895 lt!340310))))))

(assert (=> d!72993 (= (bitIndex!0 (size!4656 (buf!5191 (_2!9895 lt!340310))) (currentByte!9769 (_2!9895 lt!340310)) (currentBit!9764 (_2!9895 lt!340310))) lt!341916)))

(declare-fun b!216225 () Bool)

(declare-fun res!181902 () Bool)

(assert (=> b!216225 (=> (not res!181902) (not e!147062))))

(assert (=> b!216225 (= res!181902 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!341916))))

(declare-fun b!216226 () Bool)

(declare-fun lt!341918 () (_ BitVec 64))

(assert (=> b!216226 (= e!147062 (bvsle lt!341916 (bvmul lt!341918 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216226 (or (= lt!341918 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!341918 #b0000000000000000000000000000000000000000000000000000000000001000) lt!341918)))))

(assert (=> b!216226 (= lt!341918 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9895 lt!340310)))))))

(assert (= (and d!72993 res!181901) b!216225))

(assert (= (and b!216225 res!181902) b!216226))

(declare-fun m!333249 () Bool)

(assert (=> d!72993 m!333249))

(declare-fun m!333251 () Bool)

(assert (=> d!72993 m!333251))

(assert (=> d!72651 d!72993))

(declare-fun d!72995 () Bool)

(declare-fun lt!341932 () (_ BitVec 32))

(assert (=> d!72995 (= lt!341932 ((_ extract 31 0) (bvsrem (bvsub lt!340325 lt!340320) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!341935 () (_ BitVec 32))

(assert (=> d!72995 (= lt!341935 ((_ extract 31 0) (bvsdiv (bvsub lt!340325 lt!340320) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!147067 () Bool)

(assert (=> d!72995 e!147067))

(declare-fun res!181907 () Bool)

(assert (=> d!72995 (=> (not res!181907) (not e!147067))))

(assert (=> d!72995 (= res!181907 (moveBitIndexPrecond!0 (_2!9895 lt!340310) (bvsub lt!340325 lt!340320)))))

(declare-fun Unit!15369 () Unit!15296)

(declare-fun Unit!15370 () Unit!15296)

(declare-fun Unit!15371 () Unit!15296)

(assert (=> d!72995 (= (moveBitIndex!0 (_2!9895 lt!340310) (bvsub lt!340325 lt!340320)) (ite (bvslt (bvadd (currentBit!9764 (_2!9895 lt!340310)) lt!341932) #b00000000000000000000000000000000) (tuple2!18475 Unit!15369 (BitStream!8421 (buf!5191 (_2!9895 lt!340310)) (bvsub (bvadd (currentByte!9769 (_2!9895 lt!340310)) lt!341935) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!341932 (currentBit!9764 (_2!9895 lt!340310))))) (ite (bvsge (bvadd (currentBit!9764 (_2!9895 lt!340310)) lt!341932) #b00000000000000000000000000001000) (tuple2!18475 Unit!15370 (BitStream!8421 (buf!5191 (_2!9895 lt!340310)) (bvadd (currentByte!9769 (_2!9895 lt!340310)) lt!341935 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!9764 (_2!9895 lt!340310)) lt!341932) #b00000000000000000000000000001000))) (tuple2!18475 Unit!15371 (BitStream!8421 (buf!5191 (_2!9895 lt!340310)) (bvadd (currentByte!9769 (_2!9895 lt!340310)) lt!341935) (bvadd (currentBit!9764 (_2!9895 lt!340310)) lt!341932))))))))

(declare-fun b!216231 () Bool)

(declare-fun e!147068 () Bool)

(assert (=> b!216231 (= e!147067 e!147068)))

(declare-fun res!181908 () Bool)

(assert (=> b!216231 (=> (not res!181908) (not e!147068))))

(declare-fun lt!341933 () (_ BitVec 64))

(declare-fun lt!341936 () tuple2!18474)

(assert (=> b!216231 (= res!181908 (= (bvadd lt!341933 (bvsub lt!340325 lt!340320)) (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!341936))) (currentByte!9769 (_2!9892 lt!341936)) (currentBit!9764 (_2!9892 lt!341936)))))))

(assert (=> b!216231 (or (not (= (bvand lt!341933 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!340325 lt!340320) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!341933 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!341933 (bvsub lt!340325 lt!340320)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216231 (= lt!341933 (bitIndex!0 (size!4656 (buf!5191 (_2!9895 lt!340310))) (currentByte!9769 (_2!9895 lt!340310)) (currentBit!9764 (_2!9895 lt!340310))))))

(declare-fun lt!341934 () (_ BitVec 32))

(declare-fun lt!341931 () (_ BitVec 32))

(declare-fun Unit!15372 () Unit!15296)

(declare-fun Unit!15373 () Unit!15296)

(declare-fun Unit!15374 () Unit!15296)

(assert (=> b!216231 (= lt!341936 (ite (bvslt (bvadd (currentBit!9764 (_2!9895 lt!340310)) lt!341934) #b00000000000000000000000000000000) (tuple2!18475 Unit!15372 (BitStream!8421 (buf!5191 (_2!9895 lt!340310)) (bvsub (bvadd (currentByte!9769 (_2!9895 lt!340310)) lt!341931) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!341934 (currentBit!9764 (_2!9895 lt!340310))))) (ite (bvsge (bvadd (currentBit!9764 (_2!9895 lt!340310)) lt!341934) #b00000000000000000000000000001000) (tuple2!18475 Unit!15373 (BitStream!8421 (buf!5191 (_2!9895 lt!340310)) (bvadd (currentByte!9769 (_2!9895 lt!340310)) lt!341931 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!9764 (_2!9895 lt!340310)) lt!341934) #b00000000000000000000000000001000))) (tuple2!18475 Unit!15374 (BitStream!8421 (buf!5191 (_2!9895 lt!340310)) (bvadd (currentByte!9769 (_2!9895 lt!340310)) lt!341931) (bvadd (currentBit!9764 (_2!9895 lt!340310)) lt!341934))))))))

(assert (=> b!216231 (= lt!341934 ((_ extract 31 0) (bvsrem (bvsub lt!340325 lt!340320) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216231 (= lt!341931 ((_ extract 31 0) (bvsdiv (bvsub lt!340325 lt!340320) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!216232 () Bool)

(assert (=> b!216232 (= e!147068 (and (= (size!4656 (buf!5191 (_2!9895 lt!340310))) (size!4656 (buf!5191 (_2!9892 lt!341936)))) (= (buf!5191 (_2!9895 lt!340310)) (buf!5191 (_2!9892 lt!341936)))))))

(assert (= (and d!72995 res!181907) b!216231))

(assert (= (and b!216231 res!181908) b!216232))

(assert (=> d!72995 m!332197))

(declare-fun m!333253 () Bool)

(assert (=> b!216231 m!333253))

(assert (=> b!216231 m!332193))

(assert (=> d!72651 d!72995))

(declare-fun d!72999 () Bool)

(declare-fun res!181911 () Bool)

(declare-fun e!147071 () Bool)

(assert (=> d!72999 (=> (not res!181911) (not e!147071))))

(assert (=> d!72999 (= res!181911 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9895 lt!340310))))) (bvsub lt!340325 lt!340320)) (bvsle (bvsub lt!340325 lt!340320) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9895 lt!340310))))))))))

(assert (=> d!72999 (= (moveBitIndexPrecond!0 (_2!9895 lt!340310) (bvsub lt!340325 lt!340320)) e!147071)))

(declare-fun b!216236 () Bool)

(declare-fun lt!341939 () (_ BitVec 64))

(assert (=> b!216236 (= e!147071 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!341939) (bvsle lt!341939 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9895 lt!340310))))))))))

(assert (=> b!216236 (= lt!341939 (bvadd (bitIndex!0 (size!4656 (buf!5191 (_2!9895 lt!340310))) (currentByte!9769 (_2!9895 lt!340310)) (currentBit!9764 (_2!9895 lt!340310))) (bvsub lt!340325 lt!340320)))))

(assert (= (and d!72999 res!181911) b!216236))

(assert (=> b!216236 m!332193))

(assert (=> d!72651 d!72999))

(declare-fun d!73001 () Bool)

(declare-fun res!181912 () Bool)

(declare-fun e!147073 () Bool)

(assert (=> d!73001 (=> (not res!181912) (not e!147073))))

(assert (=> d!73001 (= res!181912 (= (size!4656 (buf!5191 (_2!9895 lt!340630))) (size!4656 (buf!5191 (_2!9892 lt!340308)))))))

(assert (=> d!73001 (= (isPrefixOf!0 (_2!9895 lt!340630) (_2!9892 lt!340308)) e!147073)))

(declare-fun b!216237 () Bool)

(declare-fun res!181913 () Bool)

(assert (=> b!216237 (=> (not res!181913) (not e!147073))))

(assert (=> b!216237 (= res!181913 (bvsle (bitIndex!0 (size!4656 (buf!5191 (_2!9895 lt!340630))) (currentByte!9769 (_2!9895 lt!340630)) (currentBit!9764 (_2!9895 lt!340630))) (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!340308))) (currentByte!9769 (_2!9892 lt!340308)) (currentBit!9764 (_2!9892 lt!340308)))))))

(declare-fun b!216238 () Bool)

(declare-fun e!147072 () Bool)

(assert (=> b!216238 (= e!147073 e!147072)))

(declare-fun res!181914 () Bool)

(assert (=> b!216238 (=> res!181914 e!147072)))

(assert (=> b!216238 (= res!181914 (= (size!4656 (buf!5191 (_2!9895 lt!340630))) #b00000000000000000000000000000000))))

(declare-fun b!216239 () Bool)

(assert (=> b!216239 (= e!147072 (arrayBitRangesEq!0 (buf!5191 (_2!9895 lt!340630)) (buf!5191 (_2!9892 lt!340308)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4656 (buf!5191 (_2!9895 lt!340630))) (currentByte!9769 (_2!9895 lt!340630)) (currentBit!9764 (_2!9895 lt!340630)))))))

(assert (= (and d!73001 res!181912) b!216237))

(assert (= (and b!216237 res!181913) b!216238))

(assert (= (and b!216238 (not res!181914)) b!216239))

(declare-fun m!333255 () Bool)

(assert (=> b!216237 m!333255))

(assert (=> b!216237 m!331803))

(assert (=> b!216239 m!333255))

(assert (=> b!216239 m!333255))

(declare-fun m!333257 () Bool)

(assert (=> b!216239 m!333257))

(assert (=> b!215667 d!73001))

(declare-fun d!73003 () Bool)

(assert (=> d!73003 (isPrefixOf!0 (_2!9892 lt!340324) (_2!9892 lt!340324))))

(declare-fun lt!341942 () Unit!15296)

(declare-fun choose!11 (BitStream!8420) Unit!15296)

(assert (=> d!73003 (= lt!341942 (choose!11 (_2!9892 lt!340324)))))

(assert (=> d!73003 (= (lemmaIsPrefixRefl!0 (_2!9892 lt!340324)) lt!341942)))

(declare-fun bs!17873 () Bool)

(assert (= bs!17873 d!73003))

(assert (=> bs!17873 m!332163))

(declare-fun m!333259 () Bool)

(assert (=> bs!17873 m!333259))

(assert (=> b!215882 d!73003))

(declare-fun d!73005 () Bool)

(declare-fun res!181915 () Bool)

(declare-fun e!147075 () Bool)

(assert (=> d!73005 (=> (not res!181915) (not e!147075))))

(assert (=> d!73005 (= res!181915 (= (size!4656 (buf!5191 (_2!9892 lt!340324))) (size!4656 (buf!5191 (_2!9892 lt!341287)))))))

(assert (=> d!73005 (= (isPrefixOf!0 (_2!9892 lt!340324) (_2!9892 lt!341287)) e!147075)))

(declare-fun b!216240 () Bool)

(declare-fun res!181916 () Bool)

(assert (=> b!216240 (=> (not res!181916) (not e!147075))))

(assert (=> b!216240 (= res!181916 (bvsle (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!340324))) (currentByte!9769 (_2!9892 lt!340324)) (currentBit!9764 (_2!9892 lt!340324))) (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!341287))) (currentByte!9769 (_2!9892 lt!341287)) (currentBit!9764 (_2!9892 lt!341287)))))))

(declare-fun b!216241 () Bool)

(declare-fun e!147074 () Bool)

(assert (=> b!216241 (= e!147075 e!147074)))

(declare-fun res!181917 () Bool)

(assert (=> b!216241 (=> res!181917 e!147074)))

(assert (=> b!216241 (= res!181917 (= (size!4656 (buf!5191 (_2!9892 lt!340324))) #b00000000000000000000000000000000))))

(declare-fun b!216242 () Bool)

(assert (=> b!216242 (= e!147074 (arrayBitRangesEq!0 (buf!5191 (_2!9892 lt!340324)) (buf!5191 (_2!9892 lt!341287)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!340324))) (currentByte!9769 (_2!9892 lt!340324)) (currentBit!9764 (_2!9892 lt!340324)))))))

(assert (= (and d!73005 res!181915) b!216240))

(assert (= (and b!216240 res!181916) b!216241))

(assert (= (and b!216241 (not res!181917)) b!216242))

(assert (=> b!216240 m!331795))

(assert (=> b!216240 m!332521))

(assert (=> b!216242 m!331795))

(assert (=> b!216242 m!331795))

(declare-fun m!333261 () Bool)

(assert (=> b!216242 m!333261))

(assert (=> b!215881 d!73005))

(declare-fun d!73007 () Bool)

(declare-fun res!181918 () Bool)

(declare-fun e!147077 () Bool)

(assert (=> d!73007 (=> (not res!181918) (not e!147077))))

(assert (=> d!73007 (= res!181918 (= (size!4656 (buf!5191 lt!340729)) (size!4656 (buf!5191 lt!340729))))))

(assert (=> d!73007 (= (isPrefixOf!0 lt!340729 lt!340729) e!147077)))

(declare-fun b!216243 () Bool)

(declare-fun res!181919 () Bool)

(assert (=> b!216243 (=> (not res!181919) (not e!147077))))

(assert (=> b!216243 (= res!181919 (bvsle (bitIndex!0 (size!4656 (buf!5191 lt!340729)) (currentByte!9769 lt!340729) (currentBit!9764 lt!340729)) (bitIndex!0 (size!4656 (buf!5191 lt!340729)) (currentByte!9769 lt!340729) (currentBit!9764 lt!340729))))))

(declare-fun b!216244 () Bool)

(declare-fun e!147076 () Bool)

(assert (=> b!216244 (= e!147077 e!147076)))

(declare-fun res!181920 () Bool)

(assert (=> b!216244 (=> res!181920 e!147076)))

(assert (=> b!216244 (= res!181920 (= (size!4656 (buf!5191 lt!340729)) #b00000000000000000000000000000000))))

(declare-fun b!216245 () Bool)

(assert (=> b!216245 (= e!147076 (arrayBitRangesEq!0 (buf!5191 lt!340729) (buf!5191 lt!340729) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4656 (buf!5191 lt!340729)) (currentByte!9769 lt!340729) (currentBit!9764 lt!340729))))))

(assert (= (and d!73007 res!181918) b!216243))

(assert (= (and b!216243 res!181919) b!216244))

(assert (= (and b!216244 (not res!181920)) b!216245))

(declare-fun m!333263 () Bool)

(assert (=> b!216243 m!333263))

(assert (=> b!216243 m!333263))

(assert (=> b!216245 m!333263))

(assert (=> b!216245 m!333263))

(declare-fun m!333265 () Bool)

(assert (=> b!216245 m!333265))

(assert (=> d!72625 d!73007))

(declare-fun d!73009 () Bool)

(assert (=> d!73009 (isPrefixOf!0 lt!340729 lt!340729)))

(declare-fun lt!341943 () Unit!15296)

(assert (=> d!73009 (= lt!341943 (choose!11 lt!340729))))

(assert (=> d!73009 (= (lemmaIsPrefixRefl!0 lt!340729) lt!341943)))

(declare-fun bs!17874 () Bool)

(assert (= bs!17874 d!73009))

(assert (=> bs!17874 m!332159))

(declare-fun m!333267 () Bool)

(assert (=> bs!17874 m!333267))

(assert (=> d!72625 d!73009))

(declare-fun d!73011 () Bool)

(declare-fun res!181921 () Bool)

(declare-fun e!147079 () Bool)

(assert (=> d!73011 (=> (not res!181921) (not e!147079))))

(assert (=> d!73011 (= res!181921 (= (size!4656 (buf!5191 lt!340729)) (size!4656 (buf!5191 (_2!9892 lt!340308)))))))

(assert (=> d!73011 (= (isPrefixOf!0 lt!340729 (_2!9892 lt!340308)) e!147079)))

(declare-fun b!216246 () Bool)

(declare-fun res!181922 () Bool)

(assert (=> b!216246 (=> (not res!181922) (not e!147079))))

(assert (=> b!216246 (= res!181922 (bvsle (bitIndex!0 (size!4656 (buf!5191 lt!340729)) (currentByte!9769 lt!340729) (currentBit!9764 lt!340729)) (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!340308))) (currentByte!9769 (_2!9892 lt!340308)) (currentBit!9764 (_2!9892 lt!340308)))))))

(declare-fun b!216247 () Bool)

(declare-fun e!147078 () Bool)

(assert (=> b!216247 (= e!147079 e!147078)))

(declare-fun res!181923 () Bool)

(assert (=> b!216247 (=> res!181923 e!147078)))

(assert (=> b!216247 (= res!181923 (= (size!4656 (buf!5191 lt!340729)) #b00000000000000000000000000000000))))

(declare-fun b!216248 () Bool)

(assert (=> b!216248 (= e!147078 (arrayBitRangesEq!0 (buf!5191 lt!340729) (buf!5191 (_2!9892 lt!340308)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4656 (buf!5191 lt!340729)) (currentByte!9769 lt!340729) (currentBit!9764 lt!340729))))))

(assert (= (and d!73011 res!181921) b!216246))

(assert (= (and b!216246 res!181922) b!216247))

(assert (= (and b!216247 (not res!181923)) b!216248))

(assert (=> b!216246 m!333263))

(assert (=> b!216246 m!331803))

(assert (=> b!216248 m!333263))

(assert (=> b!216248 m!333263))

(declare-fun m!333269 () Bool)

(assert (=> b!216248 m!333269))

(assert (=> d!72625 d!73011))

(declare-fun d!73013 () Bool)

(assert (=> d!73013 (isPrefixOf!0 lt!340729 (_2!9892 lt!340308))))

(declare-fun lt!341944 () Unit!15296)

(assert (=> d!73013 (= lt!341944 (choose!30 lt!340729 (_2!9892 lt!340308) (_2!9892 lt!340308)))))

(assert (=> d!73013 (isPrefixOf!0 lt!340729 (_2!9892 lt!340308))))

(assert (=> d!73013 (= (lemmaIsPrefixTransitive!0 lt!340729 (_2!9892 lt!340308) (_2!9892 lt!340308)) lt!341944)))

(declare-fun bs!17875 () Bool)

(assert (= bs!17875 d!73013))

(assert (=> bs!17875 m!332157))

(declare-fun m!333271 () Bool)

(assert (=> bs!17875 m!333271))

(assert (=> bs!17875 m!332157))

(assert (=> d!72625 d!73013))

(assert (=> d!72625 d!72561))

(assert (=> d!72625 d!73003))

(declare-fun d!73015 () Bool)

(assert (=> d!73015 (isPrefixOf!0 lt!340729 (_2!9892 lt!340308))))

(declare-fun lt!341945 () Unit!15296)

(assert (=> d!73015 (= lt!341945 (choose!30 lt!340729 (_2!9892 lt!340324) (_2!9892 lt!340308)))))

(assert (=> d!73015 (isPrefixOf!0 lt!340729 (_2!9892 lt!340324))))

(assert (=> d!73015 (= (lemmaIsPrefixTransitive!0 lt!340729 (_2!9892 lt!340324) (_2!9892 lt!340308)) lt!341945)))

(declare-fun bs!17876 () Bool)

(assert (= bs!17876 d!73015))

(assert (=> bs!17876 m!332157))

(declare-fun m!333273 () Bool)

(assert (=> bs!17876 m!333273))

(declare-fun m!333275 () Bool)

(assert (=> bs!17876 m!333275))

(assert (=> d!72625 d!73015))

(declare-fun d!73017 () Bool)

(assert (=> d!73017 (isPrefixOf!0 (_2!9892 lt!340308) (_2!9892 lt!340308))))

(declare-fun lt!341946 () Unit!15296)

(assert (=> d!73017 (= lt!341946 (choose!11 (_2!9892 lt!340308)))))

(assert (=> d!73017 (= (lemmaIsPrefixRefl!0 (_2!9892 lt!340308)) lt!341946)))

(declare-fun bs!17877 () Bool)

(assert (= bs!17877 d!73017))

(assert (=> bs!17877 m!332073))

(declare-fun m!333277 () Bool)

(assert (=> bs!17877 m!333277))

(assert (=> d!72625 d!73017))

(declare-fun d!73019 () Bool)

(declare-fun res!181924 () Bool)

(declare-fun e!147081 () Bool)

(assert (=> d!73019 (=> (not res!181924) (not e!147081))))

(assert (=> d!73019 (= res!181924 (= (size!4656 (buf!5191 (_2!9892 lt!340324))) (size!4656 (buf!5191 (_2!9892 lt!340324)))))))

(assert (=> d!73019 (= (isPrefixOf!0 (_2!9892 lt!340324) (_2!9892 lt!340324)) e!147081)))

(declare-fun b!216249 () Bool)

(declare-fun res!181925 () Bool)

(assert (=> b!216249 (=> (not res!181925) (not e!147081))))

(assert (=> b!216249 (= res!181925 (bvsle (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!340324))) (currentByte!9769 (_2!9892 lt!340324)) (currentBit!9764 (_2!9892 lt!340324))) (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!340324))) (currentByte!9769 (_2!9892 lt!340324)) (currentBit!9764 (_2!9892 lt!340324)))))))

(declare-fun b!216250 () Bool)

(declare-fun e!147080 () Bool)

(assert (=> b!216250 (= e!147081 e!147080)))

(declare-fun res!181926 () Bool)

(assert (=> b!216250 (=> res!181926 e!147080)))

(assert (=> b!216250 (= res!181926 (= (size!4656 (buf!5191 (_2!9892 lt!340324))) #b00000000000000000000000000000000))))

(declare-fun b!216251 () Bool)

(assert (=> b!216251 (= e!147080 (arrayBitRangesEq!0 (buf!5191 (_2!9892 lt!340324)) (buf!5191 (_2!9892 lt!340324)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!340324))) (currentByte!9769 (_2!9892 lt!340324)) (currentBit!9764 (_2!9892 lt!340324)))))))

(assert (= (and d!73019 res!181924) b!216249))

(assert (= (and b!216249 res!181925) b!216250))

(assert (= (and b!216250 (not res!181926)) b!216251))

(assert (=> b!216249 m!331795))

(assert (=> b!216249 m!331795))

(assert (=> b!216251 m!331795))

(assert (=> b!216251 m!331795))

(declare-fun m!333279 () Bool)

(assert (=> b!216251 m!333279))

(assert (=> d!72625 d!73019))

(declare-fun d!73021 () Bool)

(declare-fun res!181927 () Bool)

(declare-fun e!147083 () Bool)

(assert (=> d!73021 (=> (not res!181927) (not e!147083))))

(assert (=> d!73021 (= res!181927 (= (size!4656 (buf!5191 (_2!9892 lt!340308))) (size!4656 (buf!5191 (_2!9892 lt!340308)))))))

(assert (=> d!73021 (= (isPrefixOf!0 (_2!9892 lt!340308) (_2!9892 lt!340308)) e!147083)))

(declare-fun b!216252 () Bool)

(declare-fun res!181928 () Bool)

(assert (=> b!216252 (=> (not res!181928) (not e!147083))))

(assert (=> b!216252 (= res!181928 (bvsle (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!340308))) (currentByte!9769 (_2!9892 lt!340308)) (currentBit!9764 (_2!9892 lt!340308))) (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!340308))) (currentByte!9769 (_2!9892 lt!340308)) (currentBit!9764 (_2!9892 lt!340308)))))))

(declare-fun b!216253 () Bool)

(declare-fun e!147082 () Bool)

(assert (=> b!216253 (= e!147083 e!147082)))

(declare-fun res!181929 () Bool)

(assert (=> b!216253 (=> res!181929 e!147082)))

(assert (=> b!216253 (= res!181929 (= (size!4656 (buf!5191 (_2!9892 lt!340308))) #b00000000000000000000000000000000))))

(declare-fun b!216254 () Bool)

(assert (=> b!216254 (= e!147082 (arrayBitRangesEq!0 (buf!5191 (_2!9892 lt!340308)) (buf!5191 (_2!9892 lt!340308)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!340308))) (currentByte!9769 (_2!9892 lt!340308)) (currentBit!9764 (_2!9892 lt!340308)))))))

(assert (= (and d!73021 res!181927) b!216252))

(assert (= (and b!216252 res!181928) b!216253))

(assert (= (and b!216253 (not res!181929)) b!216254))

(assert (=> b!216252 m!331803))

(assert (=> b!216252 m!331803))

(assert (=> b!216254 m!331803))

(assert (=> b!216254 m!331803))

(declare-fun m!333281 () Bool)

(assert (=> b!216254 m!333281))

(assert (=> d!72625 d!73021))

(declare-fun d!73023 () Bool)

(declare-fun res!181930 () Bool)

(declare-fun e!147085 () Bool)

(assert (=> d!73023 (=> (not res!181930) (not e!147085))))

(assert (=> d!73023 (= res!181930 (= (size!4656 (buf!5191 (_1!9895 lt!340716))) (size!4656 (buf!5191 (_2!9895 lt!340716)))))))

(assert (=> d!73023 (= (isPrefixOf!0 (_1!9895 lt!340716) (_2!9895 lt!340716)) e!147085)))

(declare-fun b!216255 () Bool)

(declare-fun res!181931 () Bool)

(assert (=> b!216255 (=> (not res!181931) (not e!147085))))

(assert (=> b!216255 (= res!181931 (bvsle (bitIndex!0 (size!4656 (buf!5191 (_1!9895 lt!340716))) (currentByte!9769 (_1!9895 lt!340716)) (currentBit!9764 (_1!9895 lt!340716))) (bitIndex!0 (size!4656 (buf!5191 (_2!9895 lt!340716))) (currentByte!9769 (_2!9895 lt!340716)) (currentBit!9764 (_2!9895 lt!340716)))))))

(declare-fun b!216256 () Bool)

(declare-fun e!147084 () Bool)

(assert (=> b!216256 (= e!147085 e!147084)))

(declare-fun res!181932 () Bool)

(assert (=> b!216256 (=> res!181932 e!147084)))

(assert (=> b!216256 (= res!181932 (= (size!4656 (buf!5191 (_1!9895 lt!340716))) #b00000000000000000000000000000000))))

(declare-fun b!216257 () Bool)

(assert (=> b!216257 (= e!147084 (arrayBitRangesEq!0 (buf!5191 (_1!9895 lt!340716)) (buf!5191 (_2!9895 lt!340716)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4656 (buf!5191 (_1!9895 lt!340716))) (currentByte!9769 (_1!9895 lt!340716)) (currentBit!9764 (_1!9895 lt!340716)))))))

(assert (= (and d!73023 res!181930) b!216255))

(assert (= (and b!216255 res!181931) b!216256))

(assert (= (and b!216256 (not res!181932)) b!216257))

(declare-fun m!333283 () Bool)

(assert (=> b!216255 m!333283))

(declare-fun m!333285 () Bool)

(assert (=> b!216255 m!333285))

(assert (=> b!216257 m!333283))

(assert (=> b!216257 m!333283))

(declare-fun m!333287 () Bool)

(assert (=> b!216257 m!333287))

(assert (=> d!72625 d!73023))

(declare-fun d!73025 () Bool)

(assert (=> d!73025 (= (invariant!0 (currentBit!9764 (_2!9892 lt!340324)) (currentByte!9769 (_2!9892 lt!340324)) (size!4656 (buf!5191 (_2!9892 lt!340324)))) (and (bvsge (currentBit!9764 (_2!9892 lt!340324)) #b00000000000000000000000000000000) (bvslt (currentBit!9764 (_2!9892 lt!340324)) #b00000000000000000000000000001000) (bvsge (currentByte!9769 (_2!9892 lt!340324)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9769 (_2!9892 lt!340324)) (size!4656 (buf!5191 (_2!9892 lt!340324)))) (and (= (currentBit!9764 (_2!9892 lt!340324)) #b00000000000000000000000000000000) (= (currentByte!9769 (_2!9892 lt!340324)) (size!4656 (buf!5191 (_2!9892 lt!340324))))))))))

(assert (=> d!72633 d!73025))

(declare-fun d!73027 () Bool)

(declare-fun e!147086 () Bool)

(assert (=> d!73027 e!147086))

(declare-fun res!181933 () Bool)

(assert (=> d!73027 (=> (not res!181933) (not e!147086))))

(declare-fun lt!341948 () (_ BitVec 64))

(declare-fun lt!341951 () (_ BitVec 64))

(declare-fun lt!341950 () (_ BitVec 64))

(assert (=> d!73027 (= res!181933 (= lt!341950 (bvsub lt!341951 lt!341948)))))

(assert (=> d!73027 (or (= (bvand lt!341951 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!341948 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!341951 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!341951 lt!341948) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73027 (= lt!341948 (remainingBits!0 ((_ sign_extend 32) (size!4656 (buf!5191 (_1!9893 lt!341254)))) ((_ sign_extend 32) (currentByte!9769 (_1!9893 lt!341254))) ((_ sign_extend 32) (currentBit!9764 (_1!9893 lt!341254)))))))

(declare-fun lt!341949 () (_ BitVec 64))

(declare-fun lt!341947 () (_ BitVec 64))

(assert (=> d!73027 (= lt!341951 (bvmul lt!341949 lt!341947))))

(assert (=> d!73027 (or (= lt!341949 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!341947 (bvsdiv (bvmul lt!341949 lt!341947) lt!341949)))))

(assert (=> d!73027 (= lt!341947 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73027 (= lt!341949 ((_ sign_extend 32) (size!4656 (buf!5191 (_1!9893 lt!341254)))))))

(assert (=> d!73027 (= lt!341950 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9769 (_1!9893 lt!341254))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9764 (_1!9893 lt!341254)))))))

(assert (=> d!73027 (invariant!0 (currentBit!9764 (_1!9893 lt!341254)) (currentByte!9769 (_1!9893 lt!341254)) (size!4656 (buf!5191 (_1!9893 lt!341254))))))

(assert (=> d!73027 (= (bitIndex!0 (size!4656 (buf!5191 (_1!9893 lt!341254))) (currentByte!9769 (_1!9893 lt!341254)) (currentBit!9764 (_1!9893 lt!341254))) lt!341950)))

(declare-fun b!216258 () Bool)

(declare-fun res!181934 () Bool)

(assert (=> b!216258 (=> (not res!181934) (not e!147086))))

(assert (=> b!216258 (= res!181934 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!341950))))

(declare-fun b!216259 () Bool)

(declare-fun lt!341952 () (_ BitVec 64))

(assert (=> b!216259 (= e!147086 (bvsle lt!341950 (bvmul lt!341952 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216259 (or (= lt!341952 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!341952 #b0000000000000000000000000000000000000000000000000000000000001000) lt!341952)))))

(assert (=> b!216259 (= lt!341952 ((_ sign_extend 32) (size!4656 (buf!5191 (_1!9893 lt!341254)))))))

(assert (= (and d!73027 res!181933) b!216258))

(assert (= (and b!216258 res!181934) b!216259))

(declare-fun m!333289 () Bool)

(assert (=> d!73027 m!333289))

(declare-fun m!333291 () Bool)

(assert (=> d!73027 m!333291))

(assert (=> b!215879 d!73027))

(declare-fun d!73029 () Bool)

(declare-fun lt!341953 () tuple2!18486)

(assert (=> d!73029 (= lt!341953 (readBit!0 lt!341288))))

(assert (=> d!73029 (= (readBitPure!0 lt!341288) (tuple2!18477 (_2!9898 lt!341953) (_1!9898 lt!341953)))))

(declare-fun bs!17878 () Bool)

(assert (= bs!17878 d!73029))

(declare-fun m!333293 () Bool)

(assert (=> bs!17878 m!333293))

(assert (=> b!215879 d!73029))

(declare-fun d!73031 () Bool)

(declare-fun lt!341954 () tuple2!18486)

(assert (=> d!73031 (= lt!341954 (readBit!0 lt!341290))))

(assert (=> d!73031 (= (readBitPure!0 lt!341290) (tuple2!18477 (_2!9898 lt!341954) (_1!9898 lt!341954)))))

(declare-fun bs!17879 () Bool)

(assert (= bs!17879 d!73031))

(declare-fun m!333295 () Bool)

(assert (=> bs!17879 m!333295))

(assert (=> b!215879 d!73031))

(declare-fun lt!341955 () tuple2!18488)

(declare-fun d!73033 () Bool)

(assert (=> d!73033 (= lt!341955 (readNBitsLSBFirstsLoop!0 (_1!9895 lt!341269) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(assert (=> d!73033 (= (readNBitsLSBFirstsLoopPure!0 (_1!9895 lt!341269) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))) (tuple2!18479 (_2!9899 lt!341955) (_1!9899 lt!341955)))))

(declare-fun bs!17880 () Bool)

(assert (= bs!17880 d!73033))

(declare-fun m!333297 () Bool)

(assert (=> bs!17880 m!333297))

(assert (=> b!215879 d!73033))

(declare-fun b!216262 () Bool)

(declare-fun e!147087 () Bool)

(declare-fun e!147088 () Bool)

(assert (=> b!216262 (= e!147087 e!147088)))

(declare-fun res!181937 () Bool)

(assert (=> b!216262 (=> (not res!181937) (not e!147088))))

(declare-fun lt!341959 () tuple2!18476)

(declare-fun lt!341956 () tuple2!18474)

(assert (=> b!216262 (= res!181937 (and (= (_2!9893 lt!341959) lt!341238) (= (_1!9893 lt!341959) (_2!9892 lt!341956))))))

(assert (=> b!216262 (= lt!341959 (readBitPure!0 (readerFrom!0 (_2!9892 lt!341956) (currentBit!9764 (_2!9892 lt!340324)) (currentByte!9769 (_2!9892 lt!340324)))))))

(declare-fun d!73035 () Bool)

(assert (=> d!73035 e!147087))

(declare-fun res!181938 () Bool)

(assert (=> d!73035 (=> (not res!181938) (not e!147087))))

(assert (=> d!73035 (= res!181938 (= (size!4656 (buf!5191 (_2!9892 lt!340324))) (size!4656 (buf!5191 (_2!9892 lt!341956)))))))

(assert (=> d!73035 (= lt!341956 (choose!16 (_2!9892 lt!340324) lt!341238))))

(assert (=> d!73035 (validate_offset_bit!0 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!340324)))) ((_ sign_extend 32) (currentByte!9769 (_2!9892 lt!340324))) ((_ sign_extend 32) (currentBit!9764 (_2!9892 lt!340324))))))

(assert (=> d!73035 (= (appendBit!0 (_2!9892 lt!340324) lt!341238) lt!341956)))

(declare-fun b!216261 () Bool)

(declare-fun res!181935 () Bool)

(assert (=> b!216261 (=> (not res!181935) (not e!147087))))

(assert (=> b!216261 (= res!181935 (isPrefixOf!0 (_2!9892 lt!340324) (_2!9892 lt!341956)))))

(declare-fun b!216263 () Bool)

(assert (=> b!216263 (= e!147088 (= (bitIndex!0 (size!4656 (buf!5191 (_1!9893 lt!341959))) (currentByte!9769 (_1!9893 lt!341959)) (currentBit!9764 (_1!9893 lt!341959))) (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!341956))) (currentByte!9769 (_2!9892 lt!341956)) (currentBit!9764 (_2!9892 lt!341956)))))))

(declare-fun b!216260 () Bool)

(declare-fun res!181936 () Bool)

(assert (=> b!216260 (=> (not res!181936) (not e!147087))))

(declare-fun lt!341957 () (_ BitVec 64))

(declare-fun lt!341958 () (_ BitVec 64))

(assert (=> b!216260 (= res!181936 (= (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!341956))) (currentByte!9769 (_2!9892 lt!341956)) (currentBit!9764 (_2!9892 lt!341956))) (bvadd lt!341957 lt!341958)))))

(assert (=> b!216260 (or (not (= (bvand lt!341957 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!341958 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!341957 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!341957 lt!341958) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216260 (= lt!341958 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!216260 (= lt!341957 (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!340324))) (currentByte!9769 (_2!9892 lt!340324)) (currentBit!9764 (_2!9892 lt!340324))))))

(assert (= (and d!73035 res!181938) b!216260))

(assert (= (and b!216260 res!181936) b!216261))

(assert (= (and b!216261 res!181935) b!216262))

(assert (= (and b!216262 res!181937) b!216263))

(declare-fun m!333299 () Bool)

(assert (=> b!216260 m!333299))

(assert (=> b!216260 m!331795))

(declare-fun m!333301 () Bool)

(assert (=> b!216263 m!333301))

(assert (=> b!216263 m!333299))

(declare-fun m!333303 () Bool)

(assert (=> b!216262 m!333303))

(assert (=> b!216262 m!333303))

(declare-fun m!333305 () Bool)

(assert (=> b!216262 m!333305))

(declare-fun m!333307 () Bool)

(assert (=> b!216261 m!333307))

(declare-fun m!333309 () Bool)

(assert (=> d!73035 m!333309))

(declare-fun m!333311 () Bool)

(assert (=> d!73035 m!333311))

(assert (=> b!215879 d!73035))

(declare-fun b!216264 () Bool)

(declare-fun res!181942 () Bool)

(declare-fun e!147094 () Bool)

(assert (=> b!216264 (=> (not res!181942) (not e!147094))))

(declare-fun lt!342005 () tuple2!18474)

(assert (=> b!216264 (= res!181942 (= (size!4656 (buf!5191 (_2!9892 lt!341240))) (size!4656 (buf!5191 (_2!9892 lt!342005)))))))

(declare-fun b!216265 () Bool)

(declare-fun e!147092 () Bool)

(declare-fun lt!341987 () (_ BitVec 64))

(assert (=> b!216265 (= e!147092 (validate_offset_bits!1 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!341240)))) ((_ sign_extend 32) (currentByte!9769 (_2!9892 lt!341240))) ((_ sign_extend 32) (currentBit!9764 (_2!9892 lt!341240))) lt!341987))))

(declare-fun b!216266 () Bool)

(declare-fun e!147090 () Bool)

(declare-fun lt!341970 () tuple2!18476)

(declare-fun lt!341977 () tuple2!18476)

(assert (=> b!216266 (= e!147090 (= (_2!9893 lt!341970) (_2!9893 lt!341977)))))

(declare-fun b!216267 () Bool)

(declare-fun e!147089 () tuple2!18474)

(declare-fun lt!341960 () tuple2!18474)

(assert (=> b!216267 (= e!147089 (tuple2!18475 (_1!9892 lt!341960) (_2!9892 lt!341960)))))

(declare-fun lt!341961 () Bool)

(assert (=> b!216267 (= lt!341961 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!342010 () tuple2!18474)

(assert (=> b!216267 (= lt!342010 (appendBit!0 (_2!9892 lt!341240) lt!341961))))

(declare-fun res!181939 () Bool)

(assert (=> b!216267 (= res!181939 (= (size!4656 (buf!5191 (_2!9892 lt!341240))) (size!4656 (buf!5191 (_2!9892 lt!342010)))))))

(declare-fun e!147097 () Bool)

(assert (=> b!216267 (=> (not res!181939) (not e!147097))))

(assert (=> b!216267 e!147097))

(declare-fun lt!341963 () tuple2!18474)

(assert (=> b!216267 (= lt!341963 lt!342010)))

(assert (=> b!216267 (= lt!341960 (appendBitsLSBFirstLoopTR!0 (_2!9892 lt!341963) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!342000 () Unit!15296)

(assert (=> b!216267 (= lt!342000 (lemmaIsPrefixTransitive!0 (_2!9892 lt!341240) (_2!9892 lt!341963) (_2!9892 lt!341960)))))

(declare-fun call!3378 () Bool)

(assert (=> b!216267 call!3378))

(declare-fun lt!341966 () Unit!15296)

(assert (=> b!216267 (= lt!341966 lt!342000)))

(assert (=> b!216267 (invariant!0 (currentBit!9764 (_2!9892 lt!341240)) (currentByte!9769 (_2!9892 lt!341240)) (size!4656 (buf!5191 (_2!9892 lt!341963))))))

(declare-fun lt!342011 () BitStream!8420)

(assert (=> b!216267 (= lt!342011 (BitStream!8421 (buf!5191 (_2!9892 lt!341963)) (currentByte!9769 (_2!9892 lt!341240)) (currentBit!9764 (_2!9892 lt!341240))))))

(assert (=> b!216267 (invariant!0 (currentBit!9764 lt!342011) (currentByte!9769 lt!342011) (size!4656 (buf!5191 (_2!9892 lt!341960))))))

(declare-fun lt!342013 () BitStream!8420)

(assert (=> b!216267 (= lt!342013 (BitStream!8421 (buf!5191 (_2!9892 lt!341960)) (currentByte!9769 lt!342011) (currentBit!9764 lt!342011)))))

(assert (=> b!216267 (= lt!341970 (readBitPure!0 lt!342011))))

(assert (=> b!216267 (= lt!341977 (readBitPure!0 lt!342013))))

(declare-fun lt!342012 () Unit!15296)

(assert (=> b!216267 (= lt!342012 (readBitPrefixLemma!0 lt!342011 (_2!9892 lt!341960)))))

(declare-fun res!181944 () Bool)

(assert (=> b!216267 (= res!181944 (= (bitIndex!0 (size!4656 (buf!5191 (_1!9893 lt!341970))) (currentByte!9769 (_1!9893 lt!341970)) (currentBit!9764 (_1!9893 lt!341970))) (bitIndex!0 (size!4656 (buf!5191 (_1!9893 lt!341977))) (currentByte!9769 (_1!9893 lt!341977)) (currentBit!9764 (_1!9893 lt!341977)))))))

(assert (=> b!216267 (=> (not res!181944) (not e!147090))))

(assert (=> b!216267 e!147090))

(declare-fun lt!341964 () Unit!15296)

(assert (=> b!216267 (= lt!341964 lt!342012)))

(declare-fun lt!341993 () tuple2!18480)

(assert (=> b!216267 (= lt!341993 (reader!0 (_2!9892 lt!341240) (_2!9892 lt!341960)))))

(declare-fun lt!341981 () tuple2!18480)

(assert (=> b!216267 (= lt!341981 (reader!0 (_2!9892 lt!341963) (_2!9892 lt!341960)))))

(declare-fun lt!342014 () tuple2!18476)

(assert (=> b!216267 (= lt!342014 (readBitPure!0 (_1!9895 lt!341993)))))

(assert (=> b!216267 (= (_2!9893 lt!342014) lt!341961)))

(declare-fun lt!341997 () Unit!15296)

(declare-fun Unit!15375 () Unit!15296)

(assert (=> b!216267 (= lt!341997 Unit!15375)))

(declare-fun lt!341990 () (_ BitVec 64))

(assert (=> b!216267 (= lt!341990 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))))))

(declare-fun lt!341998 () (_ BitVec 64))

(assert (=> b!216267 (= lt!341998 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))))))

(declare-fun lt!341969 () Unit!15296)

(assert (=> b!216267 (= lt!341969 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9892 lt!341240) (buf!5191 (_2!9892 lt!341960)) lt!341998))))

(assert (=> b!216267 (validate_offset_bits!1 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!341960)))) ((_ sign_extend 32) (currentByte!9769 (_2!9892 lt!341240))) ((_ sign_extend 32) (currentBit!9764 (_2!9892 lt!341240))) lt!341998)))

(declare-fun lt!341985 () Unit!15296)

(assert (=> b!216267 (= lt!341985 lt!341969)))

(declare-fun lt!342003 () tuple2!18478)

(assert (=> b!216267 (= lt!342003 (readNBitsLSBFirstsLoopPure!0 (_1!9895 lt!341993) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) lt!341990))))

(declare-fun lt!341962 () (_ BitVec 64))

(assert (=> b!216267 (= lt!341962 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))))

(declare-fun lt!341974 () Unit!15296)

(assert (=> b!216267 (= lt!341974 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9892 lt!341963) (buf!5191 (_2!9892 lt!341960)) lt!341962))))

(assert (=> b!216267 (validate_offset_bits!1 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!341960)))) ((_ sign_extend 32) (currentByte!9769 (_2!9892 lt!341963))) ((_ sign_extend 32) (currentBit!9764 (_2!9892 lt!341963))) lt!341962)))

(declare-fun lt!341995 () Unit!15296)

(assert (=> b!216267 (= lt!341995 lt!341974)))

(declare-fun lt!341976 () tuple2!18478)

(assert (=> b!216267 (= lt!341976 (readNBitsLSBFirstsLoopPure!0 (_1!9895 lt!341981) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor lt!341990 (ite (_2!9893 lt!342014) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!341984 () tuple2!18478)

(assert (=> b!216267 (= lt!341984 (readNBitsLSBFirstsLoopPure!0 (_1!9895 lt!341993) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) lt!341990))))

(declare-fun c!10562 () Bool)

(assert (=> b!216267 (= c!10562 (_2!9893 (readBitPure!0 (_1!9895 lt!341993))))))

(declare-fun lt!341996 () tuple2!18478)

(declare-fun e!147096 () (_ BitVec 64))

(assert (=> b!216267 (= lt!341996 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9895 lt!341993) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor lt!341990 e!147096)))))

(declare-fun lt!341967 () Unit!15296)

(assert (=> b!216267 (= lt!341967 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9895 lt!341993) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) lt!341990))))

(assert (=> b!216267 (and (= (_2!9894 lt!341984) (_2!9894 lt!341996)) (= (_1!9894 lt!341984) (_1!9894 lt!341996)))))

(declare-fun lt!341999 () Unit!15296)

(assert (=> b!216267 (= lt!341999 lt!341967)))

(assert (=> b!216267 (= (_1!9895 lt!341993) (withMovedBitIndex!0 (_2!9895 lt!341993) (bvsub (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!341240))) (currentByte!9769 (_2!9892 lt!341240)) (currentBit!9764 (_2!9892 lt!341240))) (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!341960))) (currentByte!9769 (_2!9892 lt!341960)) (currentBit!9764 (_2!9892 lt!341960))))))))

(declare-fun lt!342001 () Unit!15296)

(declare-fun Unit!15376 () Unit!15296)

(assert (=> b!216267 (= lt!342001 Unit!15376)))

(assert (=> b!216267 (= (_1!9895 lt!341981) (withMovedBitIndex!0 (_2!9895 lt!341981) (bvsub (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!341963))) (currentByte!9769 (_2!9892 lt!341963)) (currentBit!9764 (_2!9892 lt!341963))) (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!341960))) (currentByte!9769 (_2!9892 lt!341960)) (currentBit!9764 (_2!9892 lt!341960))))))))

(declare-fun lt!341975 () Unit!15296)

(declare-fun Unit!15377 () Unit!15296)

(assert (=> b!216267 (= lt!341975 Unit!15377)))

(assert (=> b!216267 (= (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!341240))) (currentByte!9769 (_2!9892 lt!341240)) (currentBit!9764 (_2!9892 lt!341240))) (bvsub (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!341963))) (currentByte!9769 (_2!9892 lt!341963)) (currentBit!9764 (_2!9892 lt!341963))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!341982 () Unit!15296)

(declare-fun Unit!15378 () Unit!15296)

(assert (=> b!216267 (= lt!341982 Unit!15378)))

(assert (=> b!216267 (= (_2!9894 lt!342003) (_2!9894 lt!341976))))

(declare-fun lt!341972 () Unit!15296)

(declare-fun Unit!15379 () Unit!15296)

(assert (=> b!216267 (= lt!341972 Unit!15379)))

(assert (=> b!216267 (invariant!0 (currentBit!9764 (_2!9892 lt!341960)) (currentByte!9769 (_2!9892 lt!341960)) (size!4656 (buf!5191 (_2!9892 lt!341960))))))

(declare-fun lt!341978 () Unit!15296)

(declare-fun Unit!15380 () Unit!15296)

(assert (=> b!216267 (= lt!341978 Unit!15380)))

(assert (=> b!216267 (= (size!4656 (buf!5191 (_2!9892 lt!341240))) (size!4656 (buf!5191 (_2!9892 lt!341960))))))

(declare-fun lt!341989 () Unit!15296)

(declare-fun Unit!15381 () Unit!15296)

(assert (=> b!216267 (= lt!341989 Unit!15381)))

(assert (=> b!216267 (= (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!341960))) (currentByte!9769 (_2!9892 lt!341960)) (currentBit!9764 (_2!9892 lt!341960))) (bvsub (bvadd (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!341240))) (currentByte!9769 (_2!9892 lt!341240)) (currentBit!9764 (_2!9892 lt!341240))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))))))

(declare-fun lt!341994 () Unit!15296)

(declare-fun Unit!15382 () Unit!15296)

(assert (=> b!216267 (= lt!341994 Unit!15382)))

(declare-fun lt!341980 () Unit!15296)

(declare-fun Unit!15383 () Unit!15296)

(assert (=> b!216267 (= lt!341980 Unit!15383)))

(declare-fun lt!341992 () tuple2!18480)

(assert (=> b!216267 (= lt!341992 (reader!0 (_2!9892 lt!341240) (_2!9892 lt!341960)))))

(declare-fun lt!341973 () (_ BitVec 64))

(assert (=> b!216267 (= lt!341973 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))))))

(declare-fun lt!341983 () Unit!15296)

(assert (=> b!216267 (= lt!341983 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9892 lt!341240) (buf!5191 (_2!9892 lt!341960)) lt!341973))))

(assert (=> b!216267 (validate_offset_bits!1 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!341960)))) ((_ sign_extend 32) (currentByte!9769 (_2!9892 lt!341240))) ((_ sign_extend 32) (currentBit!9764 (_2!9892 lt!341240))) lt!341973)))

(declare-fun lt!342007 () Unit!15296)

(assert (=> b!216267 (= lt!342007 lt!341983)))

(declare-fun lt!342002 () tuple2!18478)

(assert (=> b!216267 (= lt!342002 (readNBitsLSBFirstsLoopPure!0 (_1!9895 lt!341992) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))))

(declare-fun res!181949 () Bool)

(assert (=> b!216267 (= res!181949 (= (_2!9894 lt!342002) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!147093 () Bool)

(assert (=> b!216267 (=> (not res!181949) (not e!147093))))

(assert (=> b!216267 e!147093))

(declare-fun lt!342015 () Unit!15296)

(declare-fun Unit!15384 () Unit!15296)

(assert (=> b!216267 (= lt!342015 Unit!15384)))

(declare-fun b!216268 () Bool)

(declare-fun res!181947 () Bool)

(assert (=> b!216268 (=> (not res!181947) (not e!147094))))

(assert (=> b!216268 (= res!181947 (isPrefixOf!0 (_2!9892 lt!341240) (_2!9892 lt!342005)))))

(declare-fun b!216269 () Bool)

(declare-fun res!181950 () Bool)

(assert (=> b!216269 (= res!181950 (isPrefixOf!0 (_2!9892 lt!341240) (_2!9892 lt!342010)))))

(assert (=> b!216269 (=> (not res!181950) (not e!147097))))

(declare-fun c!10563 () Bool)

(declare-fun bm!3375 () Bool)

(assert (=> bm!3375 (= call!3378 (isPrefixOf!0 (_2!9892 lt!341240) (ite c!10563 (_2!9892 lt!341240) (_2!9892 lt!341960))))))

(declare-fun d!73037 () Bool)

(assert (=> d!73037 e!147094))

(declare-fun res!181946 () Bool)

(assert (=> d!73037 (=> (not res!181946) (not e!147094))))

(assert (=> d!73037 (= res!181946 (invariant!0 (currentBit!9764 (_2!9892 lt!342005)) (currentByte!9769 (_2!9892 lt!342005)) (size!4656 (buf!5191 (_2!9892 lt!342005)))))))

(assert (=> d!73037 (= lt!342005 e!147089)))

(assert (=> d!73037 (= c!10563 (= (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) nBits!348))))

(assert (=> d!73037 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!73037 (= (appendBitsLSBFirstLoopTR!0 (_2!9892 lt!341240) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)) lt!342005)))

(declare-fun b!216270 () Bool)

(declare-fun Unit!15385 () Unit!15296)

(assert (=> b!216270 (= e!147089 (tuple2!18475 Unit!15385 (_2!9892 lt!341240)))))

(declare-fun lt!342006 () Unit!15296)

(assert (=> b!216270 (= lt!342006 (lemmaIsPrefixRefl!0 (_2!9892 lt!341240)))))

(assert (=> b!216270 call!3378))

(declare-fun lt!341986 () Unit!15296)

(assert (=> b!216270 (= lt!341986 lt!342006)))

(declare-fun b!216271 () Bool)

(assert (=> b!216271 (= e!147093 (= (_1!9894 lt!342002) (_2!9895 lt!341992)))))

(declare-fun b!216272 () Bool)

(declare-fun e!147091 () Bool)

(declare-fun lt!341968 () tuple2!18476)

(assert (=> b!216272 (= e!147091 (= (bitIndex!0 (size!4656 (buf!5191 (_1!9893 lt!341968))) (currentByte!9769 (_1!9893 lt!341968)) (currentBit!9764 (_1!9893 lt!341968))) (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!342010))) (currentByte!9769 (_2!9892 lt!342010)) (currentBit!9764 (_2!9892 lt!342010)))))))

(declare-fun b!216273 () Bool)

(declare-fun e!147095 () Bool)

(assert (=> b!216273 (= e!147094 e!147095)))

(declare-fun res!181948 () Bool)

(assert (=> b!216273 (=> (not res!181948) (not e!147095))))

(declare-fun lt!342008 () tuple2!18478)

(assert (=> b!216273 (= res!181948 (= (_2!9894 lt!342008) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun lt!342009 () tuple2!18480)

(assert (=> b!216273 (= lt!342008 (readNBitsLSBFirstsLoopPure!0 (_1!9895 lt!342009) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))))

(declare-fun lt!341991 () Unit!15296)

(declare-fun lt!341979 () Unit!15296)

(assert (=> b!216273 (= lt!341991 lt!341979)))

(assert (=> b!216273 (validate_offset_bits!1 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!342005)))) ((_ sign_extend 32) (currentByte!9769 (_2!9892 lt!341240))) ((_ sign_extend 32) (currentBit!9764 (_2!9892 lt!341240))) lt!341987)))

(assert (=> b!216273 (= lt!341979 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9892 lt!341240) (buf!5191 (_2!9892 lt!342005)) lt!341987))))

(assert (=> b!216273 e!147092))

(declare-fun res!181943 () Bool)

(assert (=> b!216273 (=> (not res!181943) (not e!147092))))

(assert (=> b!216273 (= res!181943 (and (= (size!4656 (buf!5191 (_2!9892 lt!341240))) (size!4656 (buf!5191 (_2!9892 lt!342005)))) (bvsge lt!341987 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216273 (= lt!341987 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))))))

(assert (=> b!216273 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!216273 (= lt!342009 (reader!0 (_2!9892 lt!341240) (_2!9892 lt!342005)))))

(declare-fun b!216274 () Bool)

(assert (=> b!216274 (= e!147096 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!216275 () Bool)

(assert (=> b!216275 (= e!147095 (= (_1!9894 lt!342008) (_2!9895 lt!342009)))))

(declare-fun b!216276 () Bool)

(declare-fun res!181945 () Bool)

(assert (=> b!216276 (=> (not res!181945) (not e!147094))))

(declare-fun lt!341988 () (_ BitVec 64))

(declare-fun lt!342004 () (_ BitVec 64))

(assert (=> b!216276 (= res!181945 (= (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!342005))) (currentByte!9769 (_2!9892 lt!342005)) (currentBit!9764 (_2!9892 lt!342005))) (bvsub lt!342004 lt!341988)))))

(assert (=> b!216276 (or (= (bvand lt!342004 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!341988 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!342004 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!342004 lt!341988) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216276 (= lt!341988 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!341965 () (_ BitVec 64))

(declare-fun lt!341971 () (_ BitVec 64))

(assert (=> b!216276 (= lt!342004 (bvadd lt!341965 lt!341971))))

(assert (=> b!216276 (or (not (= (bvand lt!341965 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!341971 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!341965 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!341965 lt!341971) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216276 (= lt!341971 ((_ sign_extend 32) nBits!348))))

(assert (=> b!216276 (= lt!341965 (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!341240))) (currentByte!9769 (_2!9892 lt!341240)) (currentBit!9764 (_2!9892 lt!341240))))))

(declare-fun b!216277 () Bool)

(assert (=> b!216277 (= e!147096 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001))))))

(declare-fun b!216278 () Bool)

(declare-fun res!181941 () Bool)

(assert (=> b!216278 (= res!181941 (= (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!342010))) (currentByte!9769 (_2!9892 lt!342010)) (currentBit!9764 (_2!9892 lt!342010))) (bvadd (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!341240))) (currentByte!9769 (_2!9892 lt!341240)) (currentBit!9764 (_2!9892 lt!341240))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!216278 (=> (not res!181941) (not e!147097))))

(declare-fun b!216279 () Bool)

(assert (=> b!216279 (= lt!341968 (readBitPure!0 (readerFrom!0 (_2!9892 lt!342010) (currentBit!9764 (_2!9892 lt!341240)) (currentByte!9769 (_2!9892 lt!341240)))))))

(declare-fun res!181940 () Bool)

(assert (=> b!216279 (= res!181940 (and (= (_2!9893 lt!341968) lt!341961) (= (_1!9893 lt!341968) (_2!9892 lt!342010))))))

(assert (=> b!216279 (=> (not res!181940) (not e!147091))))

(assert (=> b!216279 (= e!147097 e!147091)))

(assert (= (and d!73037 c!10563) b!216270))

(assert (= (and d!73037 (not c!10563)) b!216267))

(assert (= (and b!216267 res!181939) b!216278))

(assert (= (and b!216278 res!181941) b!216269))

(assert (= (and b!216269 res!181950) b!216279))

(assert (= (and b!216279 res!181940) b!216272))

(assert (= (and b!216267 res!181944) b!216266))

(assert (= (and b!216267 c!10562) b!216277))

(assert (= (and b!216267 (not c!10562)) b!216274))

(assert (= (and b!216267 res!181949) b!216271))

(assert (= (or b!216270 b!216267) bm!3375))

(assert (= (and d!73037 res!181946) b!216264))

(assert (= (and b!216264 res!181942) b!216276))

(assert (= (and b!216276 res!181945) b!216268))

(assert (= (and b!216268 res!181947) b!216273))

(assert (= (and b!216273 res!181943) b!216265))

(assert (= (and b!216273 res!181948) b!216275))

(declare-fun m!333313 () Bool)

(assert (=> bm!3375 m!333313))

(declare-fun m!333315 () Bool)

(assert (=> b!216270 m!333315))

(declare-fun m!333317 () Bool)

(assert (=> b!216279 m!333317))

(assert (=> b!216279 m!333317))

(declare-fun m!333319 () Bool)

(assert (=> b!216279 m!333319))

(declare-fun m!333321 () Bool)

(assert (=> b!216267 m!333321))

(declare-fun m!333323 () Bool)

(assert (=> b!216267 m!333323))

(assert (=> b!216267 m!333321))

(declare-fun m!333325 () Bool)

(assert (=> b!216267 m!333325))

(declare-fun m!333327 () Bool)

(assert (=> b!216267 m!333327))

(declare-fun m!333329 () Bool)

(assert (=> b!216267 m!333329))

(declare-fun m!333331 () Bool)

(assert (=> b!216267 m!333331))

(declare-fun m!333333 () Bool)

(assert (=> b!216267 m!333333))

(declare-fun m!333335 () Bool)

(assert (=> b!216267 m!333335))

(declare-fun m!333337 () Bool)

(assert (=> b!216267 m!333337))

(declare-fun m!333339 () Bool)

(assert (=> b!216267 m!333339))

(assert (=> b!216267 m!331793))

(declare-fun m!333341 () Bool)

(assert (=> b!216267 m!333341))

(declare-fun m!333343 () Bool)

(assert (=> b!216267 m!333343))

(declare-fun m!333345 () Bool)

(assert (=> b!216267 m!333345))

(declare-fun m!333347 () Bool)

(assert (=> b!216267 m!333347))

(declare-fun m!333349 () Bool)

(assert (=> b!216267 m!333349))

(declare-fun m!333351 () Bool)

(assert (=> b!216267 m!333351))

(declare-fun m!333353 () Bool)

(assert (=> b!216267 m!333353))

(declare-fun m!333355 () Bool)

(assert (=> b!216267 m!333355))

(declare-fun m!333357 () Bool)

(assert (=> b!216267 m!333357))

(declare-fun m!333359 () Bool)

(assert (=> b!216267 m!333359))

(declare-fun m!333361 () Bool)

(assert (=> b!216267 m!333361))

(declare-fun m!333363 () Bool)

(assert (=> b!216267 m!333363))

(declare-fun m!333365 () Bool)

(assert (=> b!216267 m!333365))

(declare-fun m!333367 () Bool)

(assert (=> b!216267 m!333367))

(declare-fun m!333369 () Bool)

(assert (=> b!216267 m!333369))

(declare-fun m!333371 () Bool)

(assert (=> b!216267 m!333371))

(assert (=> b!216267 m!332517))

(declare-fun m!333373 () Bool)

(assert (=> b!216267 m!333373))

(declare-fun m!333375 () Bool)

(assert (=> b!216267 m!333375))

(declare-fun m!333377 () Bool)

(assert (=> b!216267 m!333377))

(declare-fun m!333379 () Bool)

(assert (=> b!216267 m!333379))

(declare-fun m!333381 () Bool)

(assert (=> b!216267 m!333381))

(declare-fun m!333383 () Bool)

(assert (=> b!216272 m!333383))

(declare-fun m!333385 () Bool)

(assert (=> b!216272 m!333385))

(declare-fun m!333387 () Bool)

(assert (=> b!216265 m!333387))

(declare-fun m!333389 () Bool)

(assert (=> b!216269 m!333389))

(declare-fun m!333391 () Bool)

(assert (=> d!73037 m!333391))

(assert (=> b!216278 m!333385))

(assert (=> b!216278 m!332517))

(declare-fun m!333393 () Bool)

(assert (=> b!216273 m!333393))

(declare-fun m!333395 () Bool)

(assert (=> b!216273 m!333395))

(declare-fun m!333397 () Bool)

(assert (=> b!216273 m!333397))

(assert (=> b!216273 m!331793))

(declare-fun m!333399 () Bool)

(assert (=> b!216273 m!333399))

(assert (=> b!216273 m!333343))

(declare-fun m!333401 () Bool)

(assert (=> b!216268 m!333401))

(declare-fun m!333403 () Bool)

(assert (=> b!216276 m!333403))

(assert (=> b!216276 m!332517))

(assert (=> b!215879 d!73037))

(declare-fun d!73039 () Bool)

(assert (=> d!73039 (= (invariant!0 (currentBit!9764 lt!341288) (currentByte!9769 lt!341288) (size!4656 (buf!5191 (_2!9892 lt!341237)))) (and (bvsge (currentBit!9764 lt!341288) #b00000000000000000000000000000000) (bvslt (currentBit!9764 lt!341288) #b00000000000000000000000000001000) (bvsge (currentByte!9769 lt!341288) #b00000000000000000000000000000000) (or (bvslt (currentByte!9769 lt!341288) (size!4656 (buf!5191 (_2!9892 lt!341237)))) (and (= (currentBit!9764 lt!341288) #b00000000000000000000000000000000) (= (currentByte!9769 lt!341288) (size!4656 (buf!5191 (_2!9892 lt!341237))))))))))

(assert (=> b!215879 d!73039))

(declare-fun b!216280 () Bool)

(declare-fun res!181953 () Bool)

(declare-fun e!147099 () Bool)

(assert (=> b!216280 (=> (not res!181953) (not e!147099))))

(declare-fun lt!342022 () tuple2!18480)

(assert (=> b!216280 (= res!181953 (isPrefixOf!0 (_2!9895 lt!342022) (_2!9892 lt!341237)))))

(declare-fun b!216281 () Bool)

(declare-fun e!147098 () Unit!15296)

(declare-fun lt!342025 () Unit!15296)

(assert (=> b!216281 (= e!147098 lt!342025)))

(declare-fun lt!342019 () (_ BitVec 64))

(assert (=> b!216281 (= lt!342019 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!342029 () (_ BitVec 64))

(assert (=> b!216281 (= lt!342029 (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!341240))) (currentByte!9769 (_2!9892 lt!341240)) (currentBit!9764 (_2!9892 lt!341240))))))

(assert (=> b!216281 (= lt!342025 (arrayBitRangesEqSymmetric!0 (buf!5191 (_2!9892 lt!341240)) (buf!5191 (_2!9892 lt!341237)) lt!342019 lt!342029))))

(assert (=> b!216281 (arrayBitRangesEq!0 (buf!5191 (_2!9892 lt!341237)) (buf!5191 (_2!9892 lt!341240)) lt!342019 lt!342029)))

(declare-fun b!216282 () Bool)

(declare-fun Unit!15386 () Unit!15296)

(assert (=> b!216282 (= e!147098 Unit!15386)))

(declare-fun lt!342032 () (_ BitVec 64))

(declare-fun lt!342026 () (_ BitVec 64))

(declare-fun b!216283 () Bool)

(assert (=> b!216283 (= e!147099 (= (_1!9895 lt!342022) (withMovedBitIndex!0 (_2!9895 lt!342022) (bvsub lt!342032 lt!342026))))))

(assert (=> b!216283 (or (= (bvand lt!342032 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!342026 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!342032 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!342032 lt!342026) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216283 (= lt!342026 (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!341237))) (currentByte!9769 (_2!9892 lt!341237)) (currentBit!9764 (_2!9892 lt!341237))))))

(assert (=> b!216283 (= lt!342032 (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!341240))) (currentByte!9769 (_2!9892 lt!341240)) (currentBit!9764 (_2!9892 lt!341240))))))

(declare-fun d!73041 () Bool)

(assert (=> d!73041 e!147099))

(declare-fun res!181952 () Bool)

(assert (=> d!73041 (=> (not res!181952) (not e!147099))))

(assert (=> d!73041 (= res!181952 (isPrefixOf!0 (_1!9895 lt!342022) (_2!9895 lt!342022)))))

(declare-fun lt!342035 () BitStream!8420)

(assert (=> d!73041 (= lt!342022 (tuple2!18481 lt!342035 (_2!9892 lt!341237)))))

(declare-fun lt!342028 () Unit!15296)

(declare-fun lt!342034 () Unit!15296)

(assert (=> d!73041 (= lt!342028 lt!342034)))

(assert (=> d!73041 (isPrefixOf!0 lt!342035 (_2!9892 lt!341237))))

(assert (=> d!73041 (= lt!342034 (lemmaIsPrefixTransitive!0 lt!342035 (_2!9892 lt!341237) (_2!9892 lt!341237)))))

(declare-fun lt!342023 () Unit!15296)

(declare-fun lt!342031 () Unit!15296)

(assert (=> d!73041 (= lt!342023 lt!342031)))

(assert (=> d!73041 (isPrefixOf!0 lt!342035 (_2!9892 lt!341237))))

(assert (=> d!73041 (= lt!342031 (lemmaIsPrefixTransitive!0 lt!342035 (_2!9892 lt!341240) (_2!9892 lt!341237)))))

(declare-fun lt!342033 () Unit!15296)

(assert (=> d!73041 (= lt!342033 e!147098)))

(declare-fun c!10564 () Bool)

(assert (=> d!73041 (= c!10564 (not (= (size!4656 (buf!5191 (_2!9892 lt!341240))) #b00000000000000000000000000000000)))))

(declare-fun lt!342018 () Unit!15296)

(declare-fun lt!342030 () Unit!15296)

(assert (=> d!73041 (= lt!342018 lt!342030)))

(assert (=> d!73041 (isPrefixOf!0 (_2!9892 lt!341237) (_2!9892 lt!341237))))

(assert (=> d!73041 (= lt!342030 (lemmaIsPrefixRefl!0 (_2!9892 lt!341237)))))

(declare-fun lt!342027 () Unit!15296)

(declare-fun lt!342017 () Unit!15296)

(assert (=> d!73041 (= lt!342027 lt!342017)))

(assert (=> d!73041 (= lt!342017 (lemmaIsPrefixRefl!0 (_2!9892 lt!341237)))))

(declare-fun lt!342020 () Unit!15296)

(declare-fun lt!342021 () Unit!15296)

(assert (=> d!73041 (= lt!342020 lt!342021)))

(assert (=> d!73041 (isPrefixOf!0 lt!342035 lt!342035)))

(assert (=> d!73041 (= lt!342021 (lemmaIsPrefixRefl!0 lt!342035))))

(declare-fun lt!342024 () Unit!15296)

(declare-fun lt!342016 () Unit!15296)

(assert (=> d!73041 (= lt!342024 lt!342016)))

(assert (=> d!73041 (isPrefixOf!0 (_2!9892 lt!341240) (_2!9892 lt!341240))))

(assert (=> d!73041 (= lt!342016 (lemmaIsPrefixRefl!0 (_2!9892 lt!341240)))))

(assert (=> d!73041 (= lt!342035 (BitStream!8421 (buf!5191 (_2!9892 lt!341237)) (currentByte!9769 (_2!9892 lt!341240)) (currentBit!9764 (_2!9892 lt!341240))))))

(assert (=> d!73041 (isPrefixOf!0 (_2!9892 lt!341240) (_2!9892 lt!341237))))

(assert (=> d!73041 (= (reader!0 (_2!9892 lt!341240) (_2!9892 lt!341237)) lt!342022)))

(declare-fun b!216284 () Bool)

(declare-fun res!181951 () Bool)

(assert (=> b!216284 (=> (not res!181951) (not e!147099))))

(assert (=> b!216284 (= res!181951 (isPrefixOf!0 (_1!9895 lt!342022) (_2!9892 lt!341240)))))

(assert (= (and d!73041 c!10564) b!216281))

(assert (= (and d!73041 (not c!10564)) b!216282))

(assert (= (and d!73041 res!181952) b!216284))

(assert (= (and b!216284 res!181951) b!216280))

(assert (= (and b!216280 res!181953) b!216283))

(declare-fun m!333405 () Bool)

(assert (=> b!216283 m!333405))

(assert (=> b!216283 m!332465))

(assert (=> b!216283 m!332517))

(declare-fun m!333407 () Bool)

(assert (=> b!216284 m!333407))

(declare-fun m!333409 () Bool)

(assert (=> b!216280 m!333409))

(declare-fun m!333411 () Bool)

(assert (=> d!73041 m!333411))

(declare-fun m!333413 () Bool)

(assert (=> d!73041 m!333413))

(declare-fun m!333415 () Bool)

(assert (=> d!73041 m!333415))

(assert (=> d!73041 m!333315))

(declare-fun m!333417 () Bool)

(assert (=> d!73041 m!333417))

(declare-fun m!333419 () Bool)

(assert (=> d!73041 m!333419))

(declare-fun m!333421 () Bool)

(assert (=> d!73041 m!333421))

(declare-fun m!333423 () Bool)

(assert (=> d!73041 m!333423))

(declare-fun m!333425 () Bool)

(assert (=> d!73041 m!333425))

(declare-fun m!333427 () Bool)

(assert (=> d!73041 m!333427))

(declare-fun m!333429 () Bool)

(assert (=> d!73041 m!333429))

(assert (=> b!216281 m!332517))

(declare-fun m!333431 () Bool)

(assert (=> b!216281 m!333431))

(declare-fun m!333433 () Bool)

(assert (=> b!216281 m!333433))

(assert (=> b!215879 d!73041))

(declare-fun d!73043 () Bool)

(assert (=> d!73043 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!341237)))) ((_ sign_extend 32) (currentByte!9769 (_2!9892 lt!341240))) ((_ sign_extend 32) (currentBit!9764 (_2!9892 lt!341240))) lt!341239) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!341237)))) ((_ sign_extend 32) (currentByte!9769 (_2!9892 lt!341240))) ((_ sign_extend 32) (currentBit!9764 (_2!9892 lt!341240)))) lt!341239))))

(declare-fun bs!17881 () Bool)

(assert (= bs!17881 d!73043))

(declare-fun m!333435 () Bool)

(assert (=> bs!17881 m!333435))

(assert (=> b!215879 d!73043))

(declare-fun d!73045 () Bool)

(declare-fun e!147100 () Bool)

(assert (=> d!73045 e!147100))

(declare-fun res!181954 () Bool)

(assert (=> d!73045 (=> (not res!181954) (not e!147100))))

(declare-fun lt!342040 () (_ BitVec 64))

(declare-fun lt!342039 () (_ BitVec 64))

(declare-fun lt!342037 () (_ BitVec 64))

(assert (=> d!73045 (= res!181954 (= lt!342039 (bvsub lt!342040 lt!342037)))))

(assert (=> d!73045 (or (= (bvand lt!342040 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!342037 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!342040 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!342040 lt!342037) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73045 (= lt!342037 (remainingBits!0 ((_ sign_extend 32) (size!4656 (buf!5191 (_1!9893 lt!341247)))) ((_ sign_extend 32) (currentByte!9769 (_1!9893 lt!341247))) ((_ sign_extend 32) (currentBit!9764 (_1!9893 lt!341247)))))))

(declare-fun lt!342038 () (_ BitVec 64))

(declare-fun lt!342036 () (_ BitVec 64))

(assert (=> d!73045 (= lt!342040 (bvmul lt!342038 lt!342036))))

(assert (=> d!73045 (or (= lt!342038 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!342036 (bvsdiv (bvmul lt!342038 lt!342036) lt!342038)))))

(assert (=> d!73045 (= lt!342036 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73045 (= lt!342038 ((_ sign_extend 32) (size!4656 (buf!5191 (_1!9893 lt!341247)))))))

(assert (=> d!73045 (= lt!342039 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9769 (_1!9893 lt!341247))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9764 (_1!9893 lt!341247)))))))

(assert (=> d!73045 (invariant!0 (currentBit!9764 (_1!9893 lt!341247)) (currentByte!9769 (_1!9893 lt!341247)) (size!4656 (buf!5191 (_1!9893 lt!341247))))))

(assert (=> d!73045 (= (bitIndex!0 (size!4656 (buf!5191 (_1!9893 lt!341247))) (currentByte!9769 (_1!9893 lt!341247)) (currentBit!9764 (_1!9893 lt!341247))) lt!342039)))

(declare-fun b!216285 () Bool)

(declare-fun res!181955 () Bool)

(assert (=> b!216285 (=> (not res!181955) (not e!147100))))

(assert (=> b!216285 (= res!181955 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!342039))))

(declare-fun b!216286 () Bool)

(declare-fun lt!342041 () (_ BitVec 64))

(assert (=> b!216286 (= e!147100 (bvsle lt!342039 (bvmul lt!342041 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216286 (or (= lt!342041 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!342041 #b0000000000000000000000000000000000000000000000000000000000001000) lt!342041)))))

(assert (=> b!216286 (= lt!342041 ((_ sign_extend 32) (size!4656 (buf!5191 (_1!9893 lt!341247)))))))

(assert (= (and d!73045 res!181954) b!216285))

(assert (= (and b!216285 res!181955) b!216286))

(declare-fun m!333437 () Bool)

(assert (=> d!73045 m!333437))

(declare-fun m!333439 () Bool)

(assert (=> d!73045 m!333439))

(assert (=> b!215879 d!73045))

(declare-fun d!73047 () Bool)

(declare-fun lt!342042 () tuple2!18488)

(assert (=> d!73047 (= lt!342042 (readNBitsLSBFirstsLoop!0 (_1!9895 lt!341258) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!341267 (ite (_2!9893 lt!341291) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!73047 (= (readNBitsLSBFirstsLoopPure!0 (_1!9895 lt!341258) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!341267 (ite (_2!9893 lt!341291) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!18479 (_2!9899 lt!342042) (_1!9899 lt!342042)))))

(declare-fun bs!17882 () Bool)

(assert (= bs!17882 d!73047))

(declare-fun m!333441 () Bool)

(assert (=> bs!17882 m!333441))

(assert (=> b!215879 d!73047))

(declare-fun d!73049 () Bool)

(assert (=> d!73049 (= (invariant!0 (currentBit!9764 (_2!9892 lt!341237)) (currentByte!9769 (_2!9892 lt!341237)) (size!4656 (buf!5191 (_2!9892 lt!341237)))) (and (bvsge (currentBit!9764 (_2!9892 lt!341237)) #b00000000000000000000000000000000) (bvslt (currentBit!9764 (_2!9892 lt!341237)) #b00000000000000000000000000001000) (bvsge (currentByte!9769 (_2!9892 lt!341237)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9769 (_2!9892 lt!341237)) (size!4656 (buf!5191 (_2!9892 lt!341237)))) (and (= (currentBit!9764 (_2!9892 lt!341237)) #b00000000000000000000000000000000) (= (currentByte!9769 (_2!9892 lt!341237)) (size!4656 (buf!5191 (_2!9892 lt!341237))))))))))

(assert (=> b!215879 d!73049))

(declare-fun d!73051 () Bool)

(assert (=> d!73051 (isPrefixOf!0 (_2!9892 lt!340324) (_2!9892 lt!341237))))

(declare-fun lt!342043 () Unit!15296)

(assert (=> d!73051 (= lt!342043 (choose!30 (_2!9892 lt!340324) (_2!9892 lt!341240) (_2!9892 lt!341237)))))

(assert (=> d!73051 (isPrefixOf!0 (_2!9892 lt!340324) (_2!9892 lt!341240))))

(assert (=> d!73051 (= (lemmaIsPrefixTransitive!0 (_2!9892 lt!340324) (_2!9892 lt!341240) (_2!9892 lt!341237)) lt!342043)))

(declare-fun bs!17883 () Bool)

(assert (= bs!17883 d!73051))

(declare-fun m!333443 () Bool)

(assert (=> bs!17883 m!333443))

(declare-fun m!333445 () Bool)

(assert (=> bs!17883 m!333445))

(declare-fun m!333447 () Bool)

(assert (=> bs!17883 m!333447))

(assert (=> b!215879 d!73051))

(declare-fun d!73053 () Bool)

(assert (=> d!73053 (= (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!590)))))))

(assert (=> b!215879 d!73053))

(declare-fun d!73055 () Bool)

(declare-fun e!147101 () Bool)

(assert (=> d!73055 e!147101))

(declare-fun res!181956 () Bool)

(assert (=> d!73055 (=> (not res!181956) (not e!147101))))

(declare-fun lt!342045 () (_ BitVec 64))

(declare-fun lt!342044 () BitStream!8420)

(assert (=> d!73055 (= res!181956 (= (bvadd lt!342045 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4656 (buf!5191 lt!342044)) (currentByte!9769 lt!342044) (currentBit!9764 lt!342044))))))

(assert (=> d!73055 (or (not (= (bvand lt!342045 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!342045 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!342045 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73055 (= lt!342045 (bitIndex!0 (size!4656 (buf!5191 (_1!9895 lt!341270))) (currentByte!9769 (_1!9895 lt!341270)) (currentBit!9764 (_1!9895 lt!341270))))))

(assert (=> d!73055 (= lt!342044 (_2!9892 (moveBitIndex!0 (_1!9895 lt!341270) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!73055 (moveBitIndexPrecond!0 (_1!9895 lt!341270) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!73055 (= (withMovedBitIndex!0 (_1!9895 lt!341270) #b0000000000000000000000000000000000000000000000000000000000000001) lt!342044)))

(declare-fun b!216287 () Bool)

(assert (=> b!216287 (= e!147101 (= (size!4656 (buf!5191 (_1!9895 lt!341270))) (size!4656 (buf!5191 lt!342044))))))

(assert (= (and d!73055 res!181956) b!216287))

(declare-fun m!333449 () Bool)

(assert (=> d!73055 m!333449))

(declare-fun m!333451 () Bool)

(assert (=> d!73055 m!333451))

(declare-fun m!333453 () Bool)

(assert (=> d!73055 m!333453))

(declare-fun m!333455 () Bool)

(assert (=> d!73055 m!333455))

(assert (=> b!215879 d!73055))

(declare-fun d!73057 () Bool)

(assert (=> d!73057 (validate_offset_bits!1 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!341237)))) ((_ sign_extend 32) (currentByte!9769 (_2!9892 lt!340324))) ((_ sign_extend 32) (currentBit!9764 (_2!9892 lt!340324))) lt!341275)))

(declare-fun lt!342046 () Unit!15296)

(assert (=> d!73057 (= lt!342046 (choose!9 (_2!9892 lt!340324) (buf!5191 (_2!9892 lt!341237)) lt!341275 (BitStream!8421 (buf!5191 (_2!9892 lt!341237)) (currentByte!9769 (_2!9892 lt!340324)) (currentBit!9764 (_2!9892 lt!340324)))))))

(assert (=> d!73057 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9892 lt!340324) (buf!5191 (_2!9892 lt!341237)) lt!341275) lt!342046)))

(declare-fun bs!17884 () Bool)

(assert (= bs!17884 d!73057))

(assert (=> bs!17884 m!332499))

(declare-fun m!333457 () Bool)

(assert (=> bs!17884 m!333457))

(assert (=> b!215879 d!73057))

(declare-fun d!73059 () Bool)

(declare-fun e!147102 () Bool)

(assert (=> d!73059 e!147102))

(declare-fun res!181957 () Bool)

(assert (=> d!73059 (=> (not res!181957) (not e!147102))))

(declare-fun lt!342049 () tuple2!18476)

(declare-fun lt!342050 () tuple2!18476)

(assert (=> d!73059 (= res!181957 (= (bitIndex!0 (size!4656 (buf!5191 (_1!9893 lt!342049))) (currentByte!9769 (_1!9893 lt!342049)) (currentBit!9764 (_1!9893 lt!342049))) (bitIndex!0 (size!4656 (buf!5191 (_1!9893 lt!342050))) (currentByte!9769 (_1!9893 lt!342050)) (currentBit!9764 (_1!9893 lt!342050)))))))

(declare-fun lt!342048 () BitStream!8420)

(declare-fun lt!342047 () Unit!15296)

(assert (=> d!73059 (= lt!342047 (choose!50 lt!341288 (_2!9892 lt!341237) lt!342048 lt!342049 (tuple2!18477 (_1!9893 lt!342049) (_2!9893 lt!342049)) (_1!9893 lt!342049) (_2!9893 lt!342049) lt!342050 (tuple2!18477 (_1!9893 lt!342050) (_2!9893 lt!342050)) (_1!9893 lt!342050) (_2!9893 lt!342050)))))

(assert (=> d!73059 (= lt!342050 (readBitPure!0 lt!342048))))

(assert (=> d!73059 (= lt!342049 (readBitPure!0 lt!341288))))

(assert (=> d!73059 (= lt!342048 (BitStream!8421 (buf!5191 (_2!9892 lt!341237)) (currentByte!9769 lt!341288) (currentBit!9764 lt!341288)))))

(assert (=> d!73059 (invariant!0 (currentBit!9764 lt!341288) (currentByte!9769 lt!341288) (size!4656 (buf!5191 (_2!9892 lt!341237))))))

(assert (=> d!73059 (= (readBitPrefixLemma!0 lt!341288 (_2!9892 lt!341237)) lt!342047)))

(declare-fun b!216288 () Bool)

(assert (=> b!216288 (= e!147102 (= (_2!9893 lt!342049) (_2!9893 lt!342050)))))

(assert (= (and d!73059 res!181957) b!216288))

(assert (=> d!73059 m!332467))

(assert (=> d!73059 m!332493))

(declare-fun m!333459 () Bool)

(assert (=> d!73059 m!333459))

(declare-fun m!333461 () Bool)

(assert (=> d!73059 m!333461))

(declare-fun m!333463 () Bool)

(assert (=> d!73059 m!333463))

(declare-fun m!333465 () Bool)

(assert (=> d!73059 m!333465))

(assert (=> b!215879 d!73059))

(declare-fun d!73061 () Bool)

(assert (=> d!73061 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!341237)))) ((_ sign_extend 32) (currentByte!9769 (_2!9892 lt!340324))) ((_ sign_extend 32) (currentBit!9764 (_2!9892 lt!340324))) lt!341250) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!341237)))) ((_ sign_extend 32) (currentByte!9769 (_2!9892 lt!340324))) ((_ sign_extend 32) (currentBit!9764 (_2!9892 lt!340324)))) lt!341250))))

(declare-fun bs!17885 () Bool)

(assert (= bs!17885 d!73061))

(declare-fun m!333467 () Bool)

(assert (=> bs!17885 m!333467))

(assert (=> b!215879 d!73061))

(assert (=> b!215879 d!72647))

(declare-fun d!73063 () Bool)

(declare-fun e!147103 () Bool)

(assert (=> d!73063 e!147103))

(declare-fun res!181958 () Bool)

(assert (=> d!73063 (=> (not res!181958) (not e!147103))))

(declare-fun lt!342051 () BitStream!8420)

(declare-fun lt!342052 () (_ BitVec 64))

(assert (=> d!73063 (= res!181958 (= (bvadd lt!342052 (bvsub (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!341240))) (currentByte!9769 (_2!9892 lt!341240)) (currentBit!9764 (_2!9892 lt!341240))) (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!341237))) (currentByte!9769 (_2!9892 lt!341237)) (currentBit!9764 (_2!9892 lt!341237))))) (bitIndex!0 (size!4656 (buf!5191 lt!342051)) (currentByte!9769 lt!342051) (currentBit!9764 lt!342051))))))

(assert (=> d!73063 (or (not (= (bvand lt!342052 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!341240))) (currentByte!9769 (_2!9892 lt!341240)) (currentBit!9764 (_2!9892 lt!341240))) (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!341237))) (currentByte!9769 (_2!9892 lt!341237)) (currentBit!9764 (_2!9892 lt!341237)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!342052 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!342052 (bvsub (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!341240))) (currentByte!9769 (_2!9892 lt!341240)) (currentBit!9764 (_2!9892 lt!341240))) (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!341237))) (currentByte!9769 (_2!9892 lt!341237)) (currentBit!9764 (_2!9892 lt!341237))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73063 (= lt!342052 (bitIndex!0 (size!4656 (buf!5191 (_2!9895 lt!341258))) (currentByte!9769 (_2!9895 lt!341258)) (currentBit!9764 (_2!9895 lt!341258))))))

(assert (=> d!73063 (= lt!342051 (_2!9892 (moveBitIndex!0 (_2!9895 lt!341258) (bvsub (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!341240))) (currentByte!9769 (_2!9892 lt!341240)) (currentBit!9764 (_2!9892 lt!341240))) (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!341237))) (currentByte!9769 (_2!9892 lt!341237)) (currentBit!9764 (_2!9892 lt!341237)))))))))

(assert (=> d!73063 (moveBitIndexPrecond!0 (_2!9895 lt!341258) (bvsub (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!341240))) (currentByte!9769 (_2!9892 lt!341240)) (currentBit!9764 (_2!9892 lt!341240))) (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!341237))) (currentByte!9769 (_2!9892 lt!341237)) (currentBit!9764 (_2!9892 lt!341237)))))))

(assert (=> d!73063 (= (withMovedBitIndex!0 (_2!9895 lt!341258) (bvsub (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!341240))) (currentByte!9769 (_2!9892 lt!341240)) (currentBit!9764 (_2!9892 lt!341240))) (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!341237))) (currentByte!9769 (_2!9892 lt!341237)) (currentBit!9764 (_2!9892 lt!341237))))) lt!342051)))

(declare-fun b!216289 () Bool)

(assert (=> b!216289 (= e!147103 (= (size!4656 (buf!5191 (_2!9895 lt!341258))) (size!4656 (buf!5191 lt!342051))))))

(assert (= (and d!73063 res!181958) b!216289))

(declare-fun m!333469 () Bool)

(assert (=> d!73063 m!333469))

(declare-fun m!333471 () Bool)

(assert (=> d!73063 m!333471))

(declare-fun m!333473 () Bool)

(assert (=> d!73063 m!333473))

(declare-fun m!333475 () Bool)

(assert (=> d!73063 m!333475))

(assert (=> b!215879 d!73063))

(declare-fun lt!342053 () tuple2!18488)

(declare-fun d!73065 () Bool)

(assert (=> d!73065 (= lt!342053 (readNBitsLSBFirstsLoop!0 (_1!9895 lt!341270) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!341267))))

(assert (=> d!73065 (= (readNBitsLSBFirstsLoopPure!0 (_1!9895 lt!341270) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!341267) (tuple2!18479 (_2!9899 lt!342053) (_1!9899 lt!342053)))))

(declare-fun bs!17886 () Bool)

(assert (= bs!17886 d!73065))

(declare-fun m!333477 () Bool)

(assert (=> bs!17886 m!333477))

(assert (=> b!215879 d!73065))

(declare-fun d!73067 () Bool)

(declare-fun lt!342059 () tuple2!18478)

(declare-fun lt!342058 () tuple2!18478)

(assert (=> d!73067 (and (= (_2!9894 lt!342059) (_2!9894 lt!342058)) (= (_1!9894 lt!342059) (_1!9894 lt!342058)))))

(declare-fun lt!342056 () Bool)

(declare-fun lt!342055 () BitStream!8420)

(declare-fun lt!342054 () Unit!15296)

(declare-fun lt!342057 () (_ BitVec 64))

(assert (=> d!73067 (= lt!342054 (choose!56 (_1!9895 lt!341270) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!341267 lt!342059 (tuple2!18479 (_1!9894 lt!342059) (_2!9894 lt!342059)) (_1!9894 lt!342059) (_2!9894 lt!342059) lt!342056 lt!342055 lt!342057 lt!342058 (tuple2!18479 (_1!9894 lt!342058) (_2!9894 lt!342058)) (_1!9894 lt!342058) (_2!9894 lt!342058)))))

(assert (=> d!73067 (= lt!342058 (readNBitsLSBFirstsLoopPure!0 lt!342055 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) lt!342057))))

(assert (=> d!73067 (= lt!342057 (bvor lt!341267 (ite lt!342056 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73067 (= lt!342055 (withMovedBitIndex!0 (_1!9895 lt!341270) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!73067 (= lt!342056 (_2!9893 (readBitPure!0 (_1!9895 lt!341270))))))

(assert (=> d!73067 (= lt!342059 (readNBitsLSBFirstsLoopPure!0 (_1!9895 lt!341270) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!341267))))

(assert (=> d!73067 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9895 lt!341270) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!341267) lt!342054)))

(declare-fun bs!17887 () Bool)

(assert (= bs!17887 d!73067))

(assert (=> bs!17887 m!332457))

(assert (=> bs!17887 m!332507))

(assert (=> bs!17887 m!332463))

(declare-fun m!333479 () Bool)

(assert (=> bs!17887 m!333479))

(declare-fun m!333481 () Bool)

(assert (=> bs!17887 m!333481))

(assert (=> b!215879 d!73067))

(declare-fun b!216290 () Bool)

(declare-fun res!181961 () Bool)

(declare-fun e!147105 () Bool)

(assert (=> b!216290 (=> (not res!181961) (not e!147105))))

(declare-fun lt!342066 () tuple2!18480)

(assert (=> b!216290 (= res!181961 (isPrefixOf!0 (_2!9895 lt!342066) (_2!9892 lt!341237)))))

(declare-fun b!216291 () Bool)

(declare-fun e!147104 () Unit!15296)

(declare-fun lt!342069 () Unit!15296)

(assert (=> b!216291 (= e!147104 lt!342069)))

(declare-fun lt!342063 () (_ BitVec 64))

(assert (=> b!216291 (= lt!342063 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!342073 () (_ BitVec 64))

(assert (=> b!216291 (= lt!342073 (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!340324))) (currentByte!9769 (_2!9892 lt!340324)) (currentBit!9764 (_2!9892 lt!340324))))))

(assert (=> b!216291 (= lt!342069 (arrayBitRangesEqSymmetric!0 (buf!5191 (_2!9892 lt!340324)) (buf!5191 (_2!9892 lt!341237)) lt!342063 lt!342073))))

(assert (=> b!216291 (arrayBitRangesEq!0 (buf!5191 (_2!9892 lt!341237)) (buf!5191 (_2!9892 lt!340324)) lt!342063 lt!342073)))

(declare-fun b!216292 () Bool)

(declare-fun Unit!15387 () Unit!15296)

(assert (=> b!216292 (= e!147104 Unit!15387)))

(declare-fun lt!342076 () (_ BitVec 64))

(declare-fun b!216293 () Bool)

(declare-fun lt!342070 () (_ BitVec 64))

(assert (=> b!216293 (= e!147105 (= (_1!9895 lt!342066) (withMovedBitIndex!0 (_2!9895 lt!342066) (bvsub lt!342076 lt!342070))))))

(assert (=> b!216293 (or (= (bvand lt!342076 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!342070 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!342076 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!342076 lt!342070) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216293 (= lt!342070 (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!341237))) (currentByte!9769 (_2!9892 lt!341237)) (currentBit!9764 (_2!9892 lt!341237))))))

(assert (=> b!216293 (= lt!342076 (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!340324))) (currentByte!9769 (_2!9892 lt!340324)) (currentBit!9764 (_2!9892 lt!340324))))))

(declare-fun d!73069 () Bool)

(assert (=> d!73069 e!147105))

(declare-fun res!181960 () Bool)

(assert (=> d!73069 (=> (not res!181960) (not e!147105))))

(assert (=> d!73069 (= res!181960 (isPrefixOf!0 (_1!9895 lt!342066) (_2!9895 lt!342066)))))

(declare-fun lt!342079 () BitStream!8420)

(assert (=> d!73069 (= lt!342066 (tuple2!18481 lt!342079 (_2!9892 lt!341237)))))

(declare-fun lt!342072 () Unit!15296)

(declare-fun lt!342078 () Unit!15296)

(assert (=> d!73069 (= lt!342072 lt!342078)))

(assert (=> d!73069 (isPrefixOf!0 lt!342079 (_2!9892 lt!341237))))

(assert (=> d!73069 (= lt!342078 (lemmaIsPrefixTransitive!0 lt!342079 (_2!9892 lt!341237) (_2!9892 lt!341237)))))

(declare-fun lt!342067 () Unit!15296)

(declare-fun lt!342075 () Unit!15296)

(assert (=> d!73069 (= lt!342067 lt!342075)))

(assert (=> d!73069 (isPrefixOf!0 lt!342079 (_2!9892 lt!341237))))

(assert (=> d!73069 (= lt!342075 (lemmaIsPrefixTransitive!0 lt!342079 (_2!9892 lt!340324) (_2!9892 lt!341237)))))

(declare-fun lt!342077 () Unit!15296)

(assert (=> d!73069 (= lt!342077 e!147104)))

(declare-fun c!10565 () Bool)

(assert (=> d!73069 (= c!10565 (not (= (size!4656 (buf!5191 (_2!9892 lt!340324))) #b00000000000000000000000000000000)))))

(declare-fun lt!342062 () Unit!15296)

(declare-fun lt!342074 () Unit!15296)

(assert (=> d!73069 (= lt!342062 lt!342074)))

(assert (=> d!73069 (isPrefixOf!0 (_2!9892 lt!341237) (_2!9892 lt!341237))))

(assert (=> d!73069 (= lt!342074 (lemmaIsPrefixRefl!0 (_2!9892 lt!341237)))))

(declare-fun lt!342071 () Unit!15296)

(declare-fun lt!342061 () Unit!15296)

(assert (=> d!73069 (= lt!342071 lt!342061)))

(assert (=> d!73069 (= lt!342061 (lemmaIsPrefixRefl!0 (_2!9892 lt!341237)))))

(declare-fun lt!342064 () Unit!15296)

(declare-fun lt!342065 () Unit!15296)

(assert (=> d!73069 (= lt!342064 lt!342065)))

(assert (=> d!73069 (isPrefixOf!0 lt!342079 lt!342079)))

(assert (=> d!73069 (= lt!342065 (lemmaIsPrefixRefl!0 lt!342079))))

(declare-fun lt!342068 () Unit!15296)

(declare-fun lt!342060 () Unit!15296)

(assert (=> d!73069 (= lt!342068 lt!342060)))

(assert (=> d!73069 (isPrefixOf!0 (_2!9892 lt!340324) (_2!9892 lt!340324))))

(assert (=> d!73069 (= lt!342060 (lemmaIsPrefixRefl!0 (_2!9892 lt!340324)))))

(assert (=> d!73069 (= lt!342079 (BitStream!8421 (buf!5191 (_2!9892 lt!341237)) (currentByte!9769 (_2!9892 lt!340324)) (currentBit!9764 (_2!9892 lt!340324))))))

(assert (=> d!73069 (isPrefixOf!0 (_2!9892 lt!340324) (_2!9892 lt!341237))))

(assert (=> d!73069 (= (reader!0 (_2!9892 lt!340324) (_2!9892 lt!341237)) lt!342066)))

(declare-fun b!216294 () Bool)

(declare-fun res!181959 () Bool)

(assert (=> b!216294 (=> (not res!181959) (not e!147105))))

(assert (=> b!216294 (= res!181959 (isPrefixOf!0 (_1!9895 lt!342066) (_2!9892 lt!340324)))))

(assert (= (and d!73069 c!10565) b!216291))

(assert (= (and d!73069 (not c!10565)) b!216292))

(assert (= (and d!73069 res!181960) b!216294))

(assert (= (and b!216294 res!181959) b!216290))

(assert (= (and b!216290 res!181961) b!216293))

(declare-fun m!333483 () Bool)

(assert (=> b!216293 m!333483))

(assert (=> b!216293 m!332465))

(assert (=> b!216293 m!331795))

(declare-fun m!333485 () Bool)

(assert (=> b!216294 m!333485))

(declare-fun m!333487 () Bool)

(assert (=> b!216290 m!333487))

(assert (=> d!73069 m!333443))

(declare-fun m!333489 () Bool)

(assert (=> d!73069 m!333489))

(declare-fun m!333491 () Bool)

(assert (=> d!73069 m!333491))

(assert (=> d!73069 m!332153))

(declare-fun m!333493 () Bool)

(assert (=> d!73069 m!333493))

(declare-fun m!333495 () Bool)

(assert (=> d!73069 m!333495))

(declare-fun m!333497 () Bool)

(assert (=> d!73069 m!333497))

(declare-fun m!333499 () Bool)

(assert (=> d!73069 m!333499))

(assert (=> d!73069 m!333425))

(assert (=> d!73069 m!332163))

(assert (=> d!73069 m!333429))

(assert (=> b!216291 m!331795))

(declare-fun m!333501 () Bool)

(assert (=> b!216291 m!333501))

(declare-fun m!333503 () Bool)

(assert (=> b!216291 m!333503))

(assert (=> b!215879 d!73069))

(declare-fun d!73071 () Bool)

(declare-fun e!147106 () Bool)

(assert (=> d!73071 e!147106))

(declare-fun res!181962 () Bool)

(assert (=> d!73071 (=> (not res!181962) (not e!147106))))

(declare-fun lt!342081 () (_ BitVec 64))

(declare-fun lt!342080 () BitStream!8420)

(assert (=> d!73071 (= res!181962 (= (bvadd lt!342081 (bvsub (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!340324))) (currentByte!9769 (_2!9892 lt!340324)) (currentBit!9764 (_2!9892 lt!340324))) (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!341237))) (currentByte!9769 (_2!9892 lt!341237)) (currentBit!9764 (_2!9892 lt!341237))))) (bitIndex!0 (size!4656 (buf!5191 lt!342080)) (currentByte!9769 lt!342080) (currentBit!9764 lt!342080))))))

(assert (=> d!73071 (or (not (= (bvand lt!342081 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!340324))) (currentByte!9769 (_2!9892 lt!340324)) (currentBit!9764 (_2!9892 lt!340324))) (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!341237))) (currentByte!9769 (_2!9892 lt!341237)) (currentBit!9764 (_2!9892 lt!341237)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!342081 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!342081 (bvsub (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!340324))) (currentByte!9769 (_2!9892 lt!340324)) (currentBit!9764 (_2!9892 lt!340324))) (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!341237))) (currentByte!9769 (_2!9892 lt!341237)) (currentBit!9764 (_2!9892 lt!341237))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73071 (= lt!342081 (bitIndex!0 (size!4656 (buf!5191 (_2!9895 lt!341270))) (currentByte!9769 (_2!9895 lt!341270)) (currentBit!9764 (_2!9895 lt!341270))))))

(assert (=> d!73071 (= lt!342080 (_2!9892 (moveBitIndex!0 (_2!9895 lt!341270) (bvsub (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!340324))) (currentByte!9769 (_2!9892 lt!340324)) (currentBit!9764 (_2!9892 lt!340324))) (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!341237))) (currentByte!9769 (_2!9892 lt!341237)) (currentBit!9764 (_2!9892 lt!341237)))))))))

(assert (=> d!73071 (moveBitIndexPrecond!0 (_2!9895 lt!341270) (bvsub (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!340324))) (currentByte!9769 (_2!9892 lt!340324)) (currentBit!9764 (_2!9892 lt!340324))) (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!341237))) (currentByte!9769 (_2!9892 lt!341237)) (currentBit!9764 (_2!9892 lt!341237)))))))

(assert (=> d!73071 (= (withMovedBitIndex!0 (_2!9895 lt!341270) (bvsub (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!340324))) (currentByte!9769 (_2!9892 lt!340324)) (currentBit!9764 (_2!9892 lt!340324))) (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!341237))) (currentByte!9769 (_2!9892 lt!341237)) (currentBit!9764 (_2!9892 lt!341237))))) lt!342080)))

(declare-fun b!216295 () Bool)

(assert (=> b!216295 (= e!147106 (= (size!4656 (buf!5191 (_2!9895 lt!341270))) (size!4656 (buf!5191 lt!342080))))))

(assert (= (and d!73071 res!181962) b!216295))

(declare-fun m!333505 () Bool)

(assert (=> d!73071 m!333505))

(declare-fun m!333507 () Bool)

(assert (=> d!73071 m!333507))

(declare-fun m!333509 () Bool)

(assert (=> d!73071 m!333509))

(declare-fun m!333511 () Bool)

(assert (=> d!73071 m!333511))

(assert (=> b!215879 d!73071))

(declare-fun d!73073 () Bool)

(declare-fun lt!342082 () tuple2!18488)

(assert (=> d!73073 (= lt!342082 (readNBitsLSBFirstsLoop!0 (withMovedBitIndex!0 (_1!9895 lt!341270) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!341267 e!146845)))))

(assert (=> d!73073 (= (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9895 lt!341270) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!341267 e!146845)) (tuple2!18479 (_2!9899 lt!342082) (_1!9899 lt!342082)))))

(declare-fun bs!17888 () Bool)

(assert (= bs!17888 d!73073))

(assert (=> bs!17888 m!332457))

(declare-fun m!333513 () Bool)

(assert (=> bs!17888 m!333513))

(assert (=> b!215879 d!73073))

(declare-fun d!73075 () Bool)

(declare-fun lt!342083 () tuple2!18486)

(assert (=> d!73075 (= lt!342083 (readBit!0 (_1!9895 lt!341270)))))

(assert (=> d!73075 (= (readBitPure!0 (_1!9895 lt!341270)) (tuple2!18477 (_2!9898 lt!342083) (_1!9898 lt!342083)))))

(declare-fun bs!17889 () Bool)

(assert (= bs!17889 d!73075))

(declare-fun m!333515 () Bool)

(assert (=> bs!17889 m!333515))

(assert (=> b!215879 d!73075))

(declare-fun d!73077 () Bool)

(assert (=> d!73077 (validate_offset_bits!1 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!341237)))) ((_ sign_extend 32) (currentByte!9769 (_2!9892 lt!341240))) ((_ sign_extend 32) (currentBit!9764 (_2!9892 lt!341240))) lt!341239)))

(declare-fun lt!342084 () Unit!15296)

(assert (=> d!73077 (= lt!342084 (choose!9 (_2!9892 lt!341240) (buf!5191 (_2!9892 lt!341237)) lt!341239 (BitStream!8421 (buf!5191 (_2!9892 lt!341237)) (currentByte!9769 (_2!9892 lt!341240)) (currentBit!9764 (_2!9892 lt!341240)))))))

(assert (=> d!73077 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9892 lt!341240) (buf!5191 (_2!9892 lt!341237)) lt!341239) lt!342084)))

(declare-fun bs!17890 () Bool)

(assert (= bs!17890 d!73077))

(assert (=> bs!17890 m!332501))

(declare-fun m!333517 () Bool)

(assert (=> bs!17890 m!333517))

(assert (=> b!215879 d!73077))

(declare-fun d!73079 () Bool)

(assert (=> d!73079 (= (invariant!0 (currentBit!9764 (_2!9892 lt!340324)) (currentByte!9769 (_2!9892 lt!340324)) (size!4656 (buf!5191 (_2!9892 lt!341240)))) (and (bvsge (currentBit!9764 (_2!9892 lt!340324)) #b00000000000000000000000000000000) (bvslt (currentBit!9764 (_2!9892 lt!340324)) #b00000000000000000000000000001000) (bvsge (currentByte!9769 (_2!9892 lt!340324)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9769 (_2!9892 lt!340324)) (size!4656 (buf!5191 (_2!9892 lt!341240)))) (and (= (currentBit!9764 (_2!9892 lt!340324)) #b00000000000000000000000000000000) (= (currentByte!9769 (_2!9892 lt!340324)) (size!4656 (buf!5191 (_2!9892 lt!341240))))))))))

(assert (=> b!215879 d!73079))

(declare-fun d!73081 () Bool)

(declare-fun e!147107 () Bool)

(assert (=> d!73081 e!147107))

(declare-fun res!181963 () Bool)

(assert (=> d!73081 (=> (not res!181963) (not e!147107))))

(declare-fun lt!342089 () (_ BitVec 64))

(declare-fun lt!342088 () (_ BitVec 64))

(declare-fun lt!342086 () (_ BitVec 64))

(assert (=> d!73081 (= res!181963 (= lt!342088 (bvsub lt!342089 lt!342086)))))

(assert (=> d!73081 (or (= (bvand lt!342089 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!342086 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!342089 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!342089 lt!342086) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73081 (= lt!342086 (remainingBits!0 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!341240)))) ((_ sign_extend 32) (currentByte!9769 (_2!9892 lt!341240))) ((_ sign_extend 32) (currentBit!9764 (_2!9892 lt!341240)))))))

(declare-fun lt!342087 () (_ BitVec 64))

(declare-fun lt!342085 () (_ BitVec 64))

(assert (=> d!73081 (= lt!342089 (bvmul lt!342087 lt!342085))))

(assert (=> d!73081 (or (= lt!342087 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!342085 (bvsdiv (bvmul lt!342087 lt!342085) lt!342087)))))

(assert (=> d!73081 (= lt!342085 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73081 (= lt!342087 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!341240)))))))

(assert (=> d!73081 (= lt!342088 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9769 (_2!9892 lt!341240))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9764 (_2!9892 lt!341240)))))))

(assert (=> d!73081 (invariant!0 (currentBit!9764 (_2!9892 lt!341240)) (currentByte!9769 (_2!9892 lt!341240)) (size!4656 (buf!5191 (_2!9892 lt!341240))))))

(assert (=> d!73081 (= (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!341240))) (currentByte!9769 (_2!9892 lt!341240)) (currentBit!9764 (_2!9892 lt!341240))) lt!342088)))

(declare-fun b!216296 () Bool)

(declare-fun res!181964 () Bool)

(assert (=> b!216296 (=> (not res!181964) (not e!147107))))

(assert (=> b!216296 (= res!181964 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!342088))))

(declare-fun b!216297 () Bool)

(declare-fun lt!342090 () (_ BitVec 64))

(assert (=> b!216297 (= e!147107 (bvsle lt!342088 (bvmul lt!342090 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216297 (or (= lt!342090 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!342090 #b0000000000000000000000000000000000000000000000000000000000001000) lt!342090)))))

(assert (=> b!216297 (= lt!342090 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!341240)))))))

(assert (= (and d!73081 res!181963) b!216296))

(assert (= (and b!216296 res!181964) b!216297))

(declare-fun m!333519 () Bool)

(assert (=> d!73081 m!333519))

(declare-fun m!333521 () Bool)

(assert (=> d!73081 m!333521))

(assert (=> b!215879 d!73081))

(declare-fun d!73083 () Bool)

(declare-fun e!147108 () Bool)

(assert (=> d!73083 e!147108))

(declare-fun res!181965 () Bool)

(assert (=> d!73083 (=> (not res!181965) (not e!147108))))

(declare-fun lt!342094 () (_ BitVec 64))

(declare-fun lt!342092 () (_ BitVec 64))

(declare-fun lt!342095 () (_ BitVec 64))

(assert (=> d!73083 (= res!181965 (= lt!342094 (bvsub lt!342095 lt!342092)))))

(assert (=> d!73083 (or (= (bvand lt!342095 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!342092 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!342095 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!342095 lt!342092) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73083 (= lt!342092 (remainingBits!0 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!341237)))) ((_ sign_extend 32) (currentByte!9769 (_2!9892 lt!341237))) ((_ sign_extend 32) (currentBit!9764 (_2!9892 lt!341237)))))))

(declare-fun lt!342093 () (_ BitVec 64))

(declare-fun lt!342091 () (_ BitVec 64))

(assert (=> d!73083 (= lt!342095 (bvmul lt!342093 lt!342091))))

(assert (=> d!73083 (or (= lt!342093 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!342091 (bvsdiv (bvmul lt!342093 lt!342091) lt!342093)))))

(assert (=> d!73083 (= lt!342091 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73083 (= lt!342093 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!341237)))))))

(assert (=> d!73083 (= lt!342094 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9769 (_2!9892 lt!341237))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9764 (_2!9892 lt!341237)))))))

(assert (=> d!73083 (invariant!0 (currentBit!9764 (_2!9892 lt!341237)) (currentByte!9769 (_2!9892 lt!341237)) (size!4656 (buf!5191 (_2!9892 lt!341237))))))

(assert (=> d!73083 (= (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!341237))) (currentByte!9769 (_2!9892 lt!341237)) (currentBit!9764 (_2!9892 lt!341237))) lt!342094)))

(declare-fun b!216298 () Bool)

(declare-fun res!181966 () Bool)

(assert (=> b!216298 (=> (not res!181966) (not e!147108))))

(assert (=> b!216298 (= res!181966 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!342094))))

(declare-fun b!216299 () Bool)

(declare-fun lt!342096 () (_ BitVec 64))

(assert (=> b!216299 (= e!147108 (bvsle lt!342094 (bvmul lt!342096 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216299 (or (= lt!342096 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!342096 #b0000000000000000000000000000000000000000000000000000000000001000) lt!342096)))))

(assert (=> b!216299 (= lt!342096 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!341237)))))))

(assert (= (and d!73083 res!181965) b!216298))

(assert (= (and b!216298 res!181966) b!216299))

(declare-fun m!333523 () Bool)

(assert (=> d!73083 m!333523))

(assert (=> d!73083 m!332487))

(assert (=> b!215879 d!73083))

(assert (=> b!215879 d!72643))

(declare-fun d!73085 () Bool)

(assert (=> d!73085 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!341237)))) ((_ sign_extend 32) (currentByte!9769 (_2!9892 lt!340324))) ((_ sign_extend 32) (currentBit!9764 (_2!9892 lt!340324))) lt!341275) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!341237)))) ((_ sign_extend 32) (currentByte!9769 (_2!9892 lt!340324))) ((_ sign_extend 32) (currentBit!9764 (_2!9892 lt!340324)))) lt!341275))))

(declare-fun bs!17891 () Bool)

(assert (= bs!17891 d!73085))

(assert (=> bs!17891 m!333467))

(assert (=> b!215879 d!73085))

(declare-fun d!73087 () Bool)

(assert (=> d!73087 (validate_offset_bits!1 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!341237)))) ((_ sign_extend 32) (currentByte!9769 (_2!9892 lt!340324))) ((_ sign_extend 32) (currentBit!9764 (_2!9892 lt!340324))) lt!341250)))

(declare-fun lt!342097 () Unit!15296)

(assert (=> d!73087 (= lt!342097 (choose!9 (_2!9892 lt!340324) (buf!5191 (_2!9892 lt!341237)) lt!341250 (BitStream!8421 (buf!5191 (_2!9892 lt!341237)) (currentByte!9769 (_2!9892 lt!340324)) (currentBit!9764 (_2!9892 lt!340324)))))))

(assert (=> d!73087 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9892 lt!340324) (buf!5191 (_2!9892 lt!341237)) lt!341250) lt!342097)))

(declare-fun bs!17892 () Bool)

(assert (= bs!17892 d!73087))

(assert (=> bs!17892 m!332515))

(declare-fun m!333525 () Bool)

(assert (=> bs!17892 m!333525))

(assert (=> b!215879 d!73087))

(declare-fun d!73089 () Bool)

(declare-fun e!147109 () Bool)

(assert (=> d!73089 e!147109))

(declare-fun res!181967 () Bool)

(assert (=> d!73089 (=> (not res!181967) (not e!147109))))

(declare-fun lt!342102 () (_ BitVec 64))

(declare-fun lt!342101 () (_ BitVec 64))

(declare-fun lt!342099 () (_ BitVec 64))

(assert (=> d!73089 (= res!181967 (= lt!342101 (bvsub lt!342102 lt!342099)))))

(assert (=> d!73089 (or (= (bvand lt!342102 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!342099 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!342102 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!342102 lt!342099) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73089 (= lt!342099 (remainingBits!0 ((_ sign_extend 32) (size!4656 (buf!5191 lt!341293))) ((_ sign_extend 32) (currentByte!9769 lt!341293)) ((_ sign_extend 32) (currentBit!9764 lt!341293))))))

(declare-fun lt!342100 () (_ BitVec 64))

(declare-fun lt!342098 () (_ BitVec 64))

(assert (=> d!73089 (= lt!342102 (bvmul lt!342100 lt!342098))))

(assert (=> d!73089 (or (= lt!342100 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!342098 (bvsdiv (bvmul lt!342100 lt!342098) lt!342100)))))

(assert (=> d!73089 (= lt!342098 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73089 (= lt!342100 ((_ sign_extend 32) (size!4656 (buf!5191 lt!341293))))))

(assert (=> d!73089 (= lt!342101 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9769 lt!341293)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9764 lt!341293))))))

(assert (=> d!73089 (invariant!0 (currentBit!9764 lt!341293) (currentByte!9769 lt!341293) (size!4656 (buf!5191 lt!341293)))))

(assert (=> d!73089 (= (bitIndex!0 (size!4656 (buf!5191 lt!341293)) (currentByte!9769 lt!341293) (currentBit!9764 lt!341293)) lt!342101)))

(declare-fun b!216300 () Bool)

(declare-fun res!181968 () Bool)

(assert (=> b!216300 (=> (not res!181968) (not e!147109))))

(assert (=> b!216300 (= res!181968 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!342101))))

(declare-fun b!216301 () Bool)

(declare-fun lt!342103 () (_ BitVec 64))

(assert (=> b!216301 (= e!147109 (bvsle lt!342101 (bvmul lt!342103 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216301 (or (= lt!342103 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!342103 #b0000000000000000000000000000000000000000000000000000000000001000) lt!342103)))))

(assert (=> b!216301 (= lt!342103 ((_ sign_extend 32) (size!4656 (buf!5191 lt!341293))))))

(assert (= (and d!73089 res!181967) b!216300))

(assert (= (and b!216300 res!181968) b!216301))

(declare-fun m!333527 () Bool)

(assert (=> d!73089 m!333527))

(declare-fun m!333529 () Bool)

(assert (=> d!73089 m!333529))

(assert (=> d!72723 d!73089))

(assert (=> d!72723 d!72641))

(declare-fun d!73091 () Bool)

(declare-fun lt!342105 () (_ BitVec 32))

(assert (=> d!73091 (= lt!342105 ((_ extract 31 0) (bvsrem (bvsub lt!340311 lt!340320) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!342108 () (_ BitVec 32))

(assert (=> d!73091 (= lt!342108 ((_ extract 31 0) (bvsdiv (bvsub lt!340311 lt!340320) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!147110 () Bool)

(assert (=> d!73091 e!147110))

(declare-fun res!181969 () Bool)

(assert (=> d!73091 (=> (not res!181969) (not e!147110))))

(assert (=> d!73091 (= res!181969 (moveBitIndexPrecond!0 (_2!9895 lt!340318) (bvsub lt!340311 lt!340320)))))

(declare-fun Unit!15388 () Unit!15296)

(declare-fun Unit!15389 () Unit!15296)

(declare-fun Unit!15390 () Unit!15296)

(assert (=> d!73091 (= (moveBitIndex!0 (_2!9895 lt!340318) (bvsub lt!340311 lt!340320)) (ite (bvslt (bvadd (currentBit!9764 (_2!9895 lt!340318)) lt!342105) #b00000000000000000000000000000000) (tuple2!18475 Unit!15388 (BitStream!8421 (buf!5191 (_2!9895 lt!340318)) (bvsub (bvadd (currentByte!9769 (_2!9895 lt!340318)) lt!342108) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!342105 (currentBit!9764 (_2!9895 lt!340318))))) (ite (bvsge (bvadd (currentBit!9764 (_2!9895 lt!340318)) lt!342105) #b00000000000000000000000000001000) (tuple2!18475 Unit!15389 (BitStream!8421 (buf!5191 (_2!9895 lt!340318)) (bvadd (currentByte!9769 (_2!9895 lt!340318)) lt!342108 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!9764 (_2!9895 lt!340318)) lt!342105) #b00000000000000000000000000001000))) (tuple2!18475 Unit!15390 (BitStream!8421 (buf!5191 (_2!9895 lt!340318)) (bvadd (currentByte!9769 (_2!9895 lt!340318)) lt!342108) (bvadd (currentBit!9764 (_2!9895 lt!340318)) lt!342105))))))))

(declare-fun b!216302 () Bool)

(declare-fun e!147111 () Bool)

(assert (=> b!216302 (= e!147110 e!147111)))

(declare-fun res!181970 () Bool)

(assert (=> b!216302 (=> (not res!181970) (not e!147111))))

(declare-fun lt!342109 () tuple2!18474)

(declare-fun lt!342106 () (_ BitVec 64))

(assert (=> b!216302 (= res!181970 (= (bvadd lt!342106 (bvsub lt!340311 lt!340320)) (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!342109))) (currentByte!9769 (_2!9892 lt!342109)) (currentBit!9764 (_2!9892 lt!342109)))))))

(assert (=> b!216302 (or (not (= (bvand lt!342106 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!340311 lt!340320) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!342106 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!342106 (bvsub lt!340311 lt!340320)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216302 (= lt!342106 (bitIndex!0 (size!4656 (buf!5191 (_2!9895 lt!340318))) (currentByte!9769 (_2!9895 lt!340318)) (currentBit!9764 (_2!9895 lt!340318))))))

(declare-fun lt!342107 () (_ BitVec 32))

(declare-fun lt!342104 () (_ BitVec 32))

(declare-fun Unit!15391 () Unit!15296)

(declare-fun Unit!15392 () Unit!15296)

(declare-fun Unit!15393 () Unit!15296)

(assert (=> b!216302 (= lt!342109 (ite (bvslt (bvadd (currentBit!9764 (_2!9895 lt!340318)) lt!342107) #b00000000000000000000000000000000) (tuple2!18475 Unit!15391 (BitStream!8421 (buf!5191 (_2!9895 lt!340318)) (bvsub (bvadd (currentByte!9769 (_2!9895 lt!340318)) lt!342104) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!342107 (currentBit!9764 (_2!9895 lt!340318))))) (ite (bvsge (bvadd (currentBit!9764 (_2!9895 lt!340318)) lt!342107) #b00000000000000000000000000001000) (tuple2!18475 Unit!15392 (BitStream!8421 (buf!5191 (_2!9895 lt!340318)) (bvadd (currentByte!9769 (_2!9895 lt!340318)) lt!342104 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!9764 (_2!9895 lt!340318)) lt!342107) #b00000000000000000000000000001000))) (tuple2!18475 Unit!15393 (BitStream!8421 (buf!5191 (_2!9895 lt!340318)) (bvadd (currentByte!9769 (_2!9895 lt!340318)) lt!342104) (bvadd (currentBit!9764 (_2!9895 lt!340318)) lt!342107))))))))

(assert (=> b!216302 (= lt!342107 ((_ extract 31 0) (bvsrem (bvsub lt!340311 lt!340320) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216302 (= lt!342104 ((_ extract 31 0) (bvsdiv (bvsub lt!340311 lt!340320) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!216303 () Bool)

(assert (=> b!216303 (= e!147111 (and (= (size!4656 (buf!5191 (_2!9895 lt!340318))) (size!4656 (buf!5191 (_2!9892 lt!342109)))) (= (buf!5191 (_2!9895 lt!340318)) (buf!5191 (_2!9892 lt!342109)))))))

(assert (= (and d!73091 res!181969) b!216302))

(assert (= (and b!216302 res!181970) b!216303))

(assert (=> d!73091 m!332545))

(declare-fun m!333531 () Bool)

(assert (=> b!216302 m!333531))

(assert (=> b!216302 m!331869))

(assert (=> d!72723 d!73091))

(declare-fun d!73093 () Bool)

(declare-fun res!181971 () Bool)

(declare-fun e!147112 () Bool)

(assert (=> d!73093 (=> (not res!181971) (not e!147112))))

(assert (=> d!73093 (= res!181971 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9895 lt!340318))))) (bvsub lt!340311 lt!340320)) (bvsle (bvsub lt!340311 lt!340320) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9895 lt!340318))))))))))

(assert (=> d!73093 (= (moveBitIndexPrecond!0 (_2!9895 lt!340318) (bvsub lt!340311 lt!340320)) e!147112)))

(declare-fun b!216304 () Bool)

(declare-fun lt!342110 () (_ BitVec 64))

(assert (=> b!216304 (= e!147112 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!342110) (bvsle lt!342110 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9895 lt!340318))))))))))

(assert (=> b!216304 (= lt!342110 (bvadd (bitIndex!0 (size!4656 (buf!5191 (_2!9895 lt!340318))) (currentByte!9769 (_2!9895 lt!340318)) (currentBit!9764 (_2!9895 lt!340318))) (bvsub lt!340311 lt!340320)))))

(assert (= (and d!73093 res!181971) b!216304))

(assert (=> b!216304 m!331869))

(assert (=> d!72723 d!73093))

(declare-fun d!73095 () Bool)

(assert (=> d!73095 (= (remainingBits!0 ((_ sign_extend 32) (size!4656 (buf!5191 (_1!9893 lt!340309)))) ((_ sign_extend 32) (currentByte!9769 (_1!9893 lt!340309))) ((_ sign_extend 32) (currentBit!9764 (_1!9893 lt!340309)))) (bvsub (bvmul ((_ sign_extend 32) (size!4656 (buf!5191 (_1!9893 lt!340309)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9769 (_1!9893 lt!340309))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9764 (_1!9893 lt!340309))))))))

(assert (=> d!72635 d!73095))

(declare-fun d!73097 () Bool)

(assert (=> d!73097 (= (invariant!0 (currentBit!9764 (_1!9893 lt!340309)) (currentByte!9769 (_1!9893 lt!340309)) (size!4656 (buf!5191 (_1!9893 lt!340309)))) (and (bvsge (currentBit!9764 (_1!9893 lt!340309)) #b00000000000000000000000000000000) (bvslt (currentBit!9764 (_1!9893 lt!340309)) #b00000000000000000000000000001000) (bvsge (currentByte!9769 (_1!9893 lt!340309)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9769 (_1!9893 lt!340309)) (size!4656 (buf!5191 (_1!9893 lt!340309)))) (and (= (currentBit!9764 (_1!9893 lt!340309)) #b00000000000000000000000000000000) (= (currentByte!9769 (_1!9893 lt!340309)) (size!4656 (buf!5191 (_1!9893 lt!340309))))))))))

(assert (=> d!72635 d!73097))

(declare-fun d!73099 () Bool)

(assert (=> d!73099 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!340324)))) ((_ sign_extend 32) (currentByte!9769 (_2!9892 lt!340324))) ((_ sign_extend 32) (currentBit!9764 (_2!9892 lt!340324))) lt!341264) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!340324)))) ((_ sign_extend 32) (currentByte!9769 (_2!9892 lt!340324))) ((_ sign_extend 32) (currentBit!9764 (_2!9892 lt!340324)))) lt!341264))))

(declare-fun bs!17893 () Bool)

(assert (= bs!17893 d!73099))

(assert (=> bs!17893 m!332187))

(assert (=> b!215877 d!73099))

(declare-fun d!73101 () Bool)

(assert (=> d!73101 (= (remainingBits!0 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!340308)))) ((_ sign_extend 32) (currentByte!9769 thiss!1204)) ((_ sign_extend 32) (currentBit!9764 thiss!1204))) (bvsub (bvmul ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!340308)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9769 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9764 thiss!1204)))))))

(assert (=> d!72585 d!73101))

(declare-fun bm!3378 () Bool)

(declare-datatypes ((tuple4!280 0))(
  ( (tuple4!281 (_1!9903 (_ BitVec 32)) (_2!9903 (_ BitVec 32)) (_3!656 (_ BitVec 32)) (_4!140 (_ BitVec 32))) )
))
(declare-fun lt!342119 () tuple4!280)

(declare-fun call!3381 () Bool)

(declare-fun lt!342118 () (_ BitVec 32))

(declare-fun lt!342117 () (_ BitVec 32))

(declare-fun c!10568 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!3378 (= call!3381 (byteRangesEq!0 (select (arr!5586 (buf!5191 (_2!9892 lt!340324))) (_3!656 lt!342119)) (select (arr!5586 (buf!5191 (_2!9892 lt!340308))) (_3!656 lt!342119)) lt!342118 (ite c!10568 lt!342117 #b00000000000000000000000000001000)))))

(declare-fun b!216319 () Bool)

(declare-fun e!147126 () Bool)

(declare-fun arrayRangesEq!702 (array!10599 array!10599 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!216319 (= e!147126 (arrayRangesEq!702 (buf!5191 (_2!9892 lt!340324)) (buf!5191 (_2!9892 lt!340308)) (_1!9903 lt!342119) (_2!9903 lt!342119)))))

(declare-fun b!216320 () Bool)

(declare-fun e!147125 () Bool)

(declare-fun e!147130 () Bool)

(assert (=> b!216320 (= e!147125 e!147130)))

(declare-fun res!181982 () Bool)

(assert (=> b!216320 (= res!181982 call!3381)))

(assert (=> b!216320 (=> (not res!181982) (not e!147130))))

(declare-fun b!216321 () Bool)

(declare-fun e!147127 () Bool)

(assert (=> b!216321 (= e!147127 e!147125)))

(assert (=> b!216321 (= c!10568 (= (_3!656 lt!342119) (_4!140 lt!342119)))))

(declare-fun b!216322 () Bool)

(declare-fun e!147128 () Bool)

(assert (=> b!216322 (= e!147128 e!147127)))

(declare-fun res!181983 () Bool)

(assert (=> b!216322 (=> (not res!181983) (not e!147127))))

(assert (=> b!216322 (= res!181983 e!147126)))

(declare-fun res!181984 () Bool)

(assert (=> b!216322 (=> res!181984 e!147126)))

(assert (=> b!216322 (= res!181984 (bvsge (_1!9903 lt!342119) (_2!9903 lt!342119)))))

(assert (=> b!216322 (= lt!342117 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!340324))) (currentByte!9769 (_2!9892 lt!340324)) (currentBit!9764 (_2!9892 lt!340324))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216322 (= lt!342118 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!280)

(assert (=> b!216322 (= lt!342119 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!340324))) (currentByte!9769 (_2!9892 lt!340324)) (currentBit!9764 (_2!9892 lt!340324)))))))

(declare-fun d!73103 () Bool)

(declare-fun res!181986 () Bool)

(assert (=> d!73103 (=> res!181986 e!147128)))

(assert (=> d!73103 (= res!181986 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!340324))) (currentByte!9769 (_2!9892 lt!340324)) (currentBit!9764 (_2!9892 lt!340324)))))))

(assert (=> d!73103 (= (arrayBitRangesEq!0 (buf!5191 (_2!9892 lt!340324)) (buf!5191 (_2!9892 lt!340308)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!340324))) (currentByte!9769 (_2!9892 lt!340324)) (currentBit!9764 (_2!9892 lt!340324)))) e!147128)))

(declare-fun b!216323 () Bool)

(assert (=> b!216323 (= e!147125 call!3381)))

(declare-fun e!147129 () Bool)

(declare-fun b!216324 () Bool)

(assert (=> b!216324 (= e!147129 (byteRangesEq!0 (select (arr!5586 (buf!5191 (_2!9892 lt!340324))) (_4!140 lt!342119)) (select (arr!5586 (buf!5191 (_2!9892 lt!340308))) (_4!140 lt!342119)) #b00000000000000000000000000000000 lt!342117))))

(declare-fun b!216325 () Bool)

(declare-fun res!181985 () Bool)

(assert (=> b!216325 (= res!181985 (= lt!342117 #b00000000000000000000000000000000))))

(assert (=> b!216325 (=> res!181985 e!147129)))

(assert (=> b!216325 (= e!147130 e!147129)))

(assert (= (and d!73103 (not res!181986)) b!216322))

(assert (= (and b!216322 (not res!181984)) b!216319))

(assert (= (and b!216322 res!181983) b!216321))

(assert (= (and b!216321 c!10568) b!216323))

(assert (= (and b!216321 (not c!10568)) b!216320))

(assert (= (and b!216320 res!181982) b!216325))

(assert (= (and b!216325 (not res!181985)) b!216324))

(assert (= (or b!216323 b!216320) bm!3378))

(declare-fun m!333533 () Bool)

(assert (=> bm!3378 m!333533))

(declare-fun m!333535 () Bool)

(assert (=> bm!3378 m!333535))

(assert (=> bm!3378 m!333533))

(assert (=> bm!3378 m!333535))

(declare-fun m!333537 () Bool)

(assert (=> bm!3378 m!333537))

(declare-fun m!333539 () Bool)

(assert (=> b!216319 m!333539))

(assert (=> b!216322 m!331795))

(declare-fun m!333541 () Bool)

(assert (=> b!216322 m!333541))

(declare-fun m!333543 () Bool)

(assert (=> b!216324 m!333543))

(declare-fun m!333545 () Bool)

(assert (=> b!216324 m!333545))

(assert (=> b!216324 m!333543))

(assert (=> b!216324 m!333545))

(declare-fun m!333547 () Bool)

(assert (=> b!216324 m!333547))

(assert (=> b!215630 d!73103))

(assert (=> b!215630 d!72647))

(declare-fun d!73105 () Bool)

(assert (=> d!73105 (= (remainingBits!0 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!340308)))) ((_ sign_extend 32) (currentByte!9769 (_2!9892 lt!340324))) ((_ sign_extend 32) (currentBit!9764 (_2!9892 lt!340324)))) (bvsub (bvmul ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!340308)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9769 (_2!9892 lt!340324))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9764 (_2!9892 lt!340324))))))))

(assert (=> d!72593 d!73105))

(assert (=> b!215713 d!72627))

(declare-fun d!73107 () Bool)

(declare-fun e!147131 () Bool)

(assert (=> d!73107 e!147131))

(declare-fun res!181987 () Bool)

(assert (=> d!73107 (=> (not res!181987) (not e!147131))))

(declare-fun lt!342121 () (_ BitVec 64))

(declare-fun lt!342124 () (_ BitVec 64))

(declare-fun lt!342123 () (_ BitVec 64))

(assert (=> d!73107 (= res!181987 (= lt!342123 (bvsub lt!342124 lt!342121)))))

(assert (=> d!73107 (or (= (bvand lt!342124 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!342121 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!342124 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!342124 lt!342121) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73107 (= lt!342121 (remainingBits!0 ((_ sign_extend 32) (size!4656 (buf!5191 (_1!9893 lt!340818)))) ((_ sign_extend 32) (currentByte!9769 (_1!9893 lt!340818))) ((_ sign_extend 32) (currentBit!9764 (_1!9893 lt!340818)))))))

(declare-fun lt!342122 () (_ BitVec 64))

(declare-fun lt!342120 () (_ BitVec 64))

(assert (=> d!73107 (= lt!342124 (bvmul lt!342122 lt!342120))))

(assert (=> d!73107 (or (= lt!342122 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!342120 (bvsdiv (bvmul lt!342122 lt!342120) lt!342122)))))

(assert (=> d!73107 (= lt!342120 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73107 (= lt!342122 ((_ sign_extend 32) (size!4656 (buf!5191 (_1!9893 lt!340818)))))))

(assert (=> d!73107 (= lt!342123 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9769 (_1!9893 lt!340818))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9764 (_1!9893 lt!340818)))))))

(assert (=> d!73107 (invariant!0 (currentBit!9764 (_1!9893 lt!340818)) (currentByte!9769 (_1!9893 lt!340818)) (size!4656 (buf!5191 (_1!9893 lt!340818))))))

(assert (=> d!73107 (= (bitIndex!0 (size!4656 (buf!5191 (_1!9893 lt!340818))) (currentByte!9769 (_1!9893 lt!340818)) (currentBit!9764 (_1!9893 lt!340818))) lt!342123)))

(declare-fun b!216326 () Bool)

(declare-fun res!181988 () Bool)

(assert (=> b!216326 (=> (not res!181988) (not e!147131))))

(assert (=> b!216326 (= res!181988 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!342123))))

(declare-fun b!216327 () Bool)

(declare-fun lt!342125 () (_ BitVec 64))

(assert (=> b!216327 (= e!147131 (bvsle lt!342123 (bvmul lt!342125 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216327 (or (= lt!342125 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!342125 #b0000000000000000000000000000000000000000000000000000000000001000) lt!342125)))))

(assert (=> b!216327 (= lt!342125 ((_ sign_extend 32) (size!4656 (buf!5191 (_1!9893 lt!340818)))))))

(assert (= (and d!73107 res!181987) b!216326))

(assert (= (and b!216326 res!181988) b!216327))

(declare-fun m!333549 () Bool)

(assert (=> d!73107 m!333549))

(declare-fun m!333551 () Bool)

(assert (=> d!73107 m!333551))

(assert (=> b!215749 d!73107))

(declare-fun d!73109 () Bool)

(declare-fun e!147132 () Bool)

(assert (=> d!73109 e!147132))

(declare-fun res!181989 () Bool)

(assert (=> d!73109 (=> (not res!181989) (not e!147132))))

(declare-fun lt!342130 () (_ BitVec 64))

(declare-fun lt!342127 () (_ BitVec 64))

(declare-fun lt!342129 () (_ BitVec 64))

(assert (=> d!73109 (= res!181989 (= lt!342129 (bvsub lt!342130 lt!342127)))))

(assert (=> d!73109 (or (= (bvand lt!342130 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!342127 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!342130 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!342130 lt!342127) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73109 (= lt!342127 (remainingBits!0 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!340815)))) ((_ sign_extend 32) (currentByte!9769 (_2!9892 lt!340815))) ((_ sign_extend 32) (currentBit!9764 (_2!9892 lt!340815)))))))

(declare-fun lt!342128 () (_ BitVec 64))

(declare-fun lt!342126 () (_ BitVec 64))

(assert (=> d!73109 (= lt!342130 (bvmul lt!342128 lt!342126))))

(assert (=> d!73109 (or (= lt!342128 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!342126 (bvsdiv (bvmul lt!342128 lt!342126) lt!342128)))))

(assert (=> d!73109 (= lt!342126 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73109 (= lt!342128 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!340815)))))))

(assert (=> d!73109 (= lt!342129 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9769 (_2!9892 lt!340815))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9764 (_2!9892 lt!340815)))))))

(assert (=> d!73109 (invariant!0 (currentBit!9764 (_2!9892 lt!340815)) (currentByte!9769 (_2!9892 lt!340815)) (size!4656 (buf!5191 (_2!9892 lt!340815))))))

(assert (=> d!73109 (= (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!340815))) (currentByte!9769 (_2!9892 lt!340815)) (currentBit!9764 (_2!9892 lt!340815))) lt!342129)))

(declare-fun b!216328 () Bool)

(declare-fun res!181990 () Bool)

(assert (=> b!216328 (=> (not res!181990) (not e!147132))))

(assert (=> b!216328 (= res!181990 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!342129))))

(declare-fun b!216329 () Bool)

(declare-fun lt!342131 () (_ BitVec 64))

(assert (=> b!216329 (= e!147132 (bvsle lt!342129 (bvmul lt!342131 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216329 (or (= lt!342131 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!342131 #b0000000000000000000000000000000000000000000000000000000000001000) lt!342131)))))

(assert (=> b!216329 (= lt!342131 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!340815)))))))

(assert (= (and d!73109 res!181989) b!216328))

(assert (= (and b!216328 res!181990) b!216329))

(declare-fun m!333553 () Bool)

(assert (=> d!73109 m!333553))

(declare-fun m!333555 () Bool)

(assert (=> d!73109 m!333555))

(assert (=> b!215749 d!73109))

(declare-fun d!73111 () Bool)

(declare-fun e!147139 () Bool)

(assert (=> d!73111 e!147139))

(declare-fun res!181993 () Bool)

(assert (=> d!73111 (=> (not res!181993) (not e!147139))))

(declare-fun increaseBitIndex!0 (BitStream!8420) tuple2!18474)

(assert (=> d!73111 (= res!181993 (= (buf!5191 (_2!9892 (increaseBitIndex!0 (readerFrom!0 (_2!9892 lt!340324) (currentBit!9764 thiss!1204) (currentByte!9769 thiss!1204))))) (buf!5191 (readerFrom!0 (_2!9892 lt!340324) (currentBit!9764 thiss!1204) (currentByte!9769 thiss!1204)))))))

(declare-fun lt!342146 () Bool)

(assert (=> d!73111 (= lt!342146 (not (= (bvand ((_ sign_extend 24) (select (arr!5586 (buf!5191 (readerFrom!0 (_2!9892 lt!340324) (currentBit!9764 thiss!1204) (currentByte!9769 thiss!1204)))) (currentByte!9769 (readerFrom!0 (_2!9892 lt!340324) (currentBit!9764 thiss!1204) (currentByte!9769 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9764 (readerFrom!0 (_2!9892 lt!340324) (currentBit!9764 thiss!1204) (currentByte!9769 thiss!1204)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!342148 () tuple2!18486)

(assert (=> d!73111 (= lt!342148 (tuple2!18487 (not (= (bvand ((_ sign_extend 24) (select (arr!5586 (buf!5191 (readerFrom!0 (_2!9892 lt!340324) (currentBit!9764 thiss!1204) (currentByte!9769 thiss!1204)))) (currentByte!9769 (readerFrom!0 (_2!9892 lt!340324) (currentBit!9764 thiss!1204) (currentByte!9769 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9764 (readerFrom!0 (_2!9892 lt!340324) (currentBit!9764 thiss!1204) (currentByte!9769 thiss!1204)))))) #b00000000000000000000000000000000)) (_2!9892 (increaseBitIndex!0 (readerFrom!0 (_2!9892 lt!340324) (currentBit!9764 thiss!1204) (currentByte!9769 thiss!1204))))))))

(assert (=> d!73111 (validate_offset_bit!0 ((_ sign_extend 32) (size!4656 (buf!5191 (readerFrom!0 (_2!9892 lt!340324) (currentBit!9764 thiss!1204) (currentByte!9769 thiss!1204))))) ((_ sign_extend 32) (currentByte!9769 (readerFrom!0 (_2!9892 lt!340324) (currentBit!9764 thiss!1204) (currentByte!9769 thiss!1204)))) ((_ sign_extend 32) (currentBit!9764 (readerFrom!0 (_2!9892 lt!340324) (currentBit!9764 thiss!1204) (currentByte!9769 thiss!1204)))))))

(assert (=> d!73111 (= (readBit!0 (readerFrom!0 (_2!9892 lt!340324) (currentBit!9764 thiss!1204) (currentByte!9769 thiss!1204))) lt!342148)))

(declare-fun lt!342150 () (_ BitVec 64))

(declare-fun b!216332 () Bool)

(declare-fun lt!342147 () (_ BitVec 64))

(assert (=> b!216332 (= e!147139 (= (bitIndex!0 (size!4656 (buf!5191 (_2!9892 (increaseBitIndex!0 (readerFrom!0 (_2!9892 lt!340324) (currentBit!9764 thiss!1204) (currentByte!9769 thiss!1204)))))) (currentByte!9769 (_2!9892 (increaseBitIndex!0 (readerFrom!0 (_2!9892 lt!340324) (currentBit!9764 thiss!1204) (currentByte!9769 thiss!1204))))) (currentBit!9764 (_2!9892 (increaseBitIndex!0 (readerFrom!0 (_2!9892 lt!340324) (currentBit!9764 thiss!1204) (currentByte!9769 thiss!1204)))))) (bvadd lt!342147 lt!342150)))))

(assert (=> b!216332 (or (not (= (bvand lt!342147 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!342150 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!342147 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!342147 lt!342150) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216332 (= lt!342150 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!216332 (= lt!342147 (bitIndex!0 (size!4656 (buf!5191 (readerFrom!0 (_2!9892 lt!340324) (currentBit!9764 thiss!1204) (currentByte!9769 thiss!1204)))) (currentByte!9769 (readerFrom!0 (_2!9892 lt!340324) (currentBit!9764 thiss!1204) (currentByte!9769 thiss!1204))) (currentBit!9764 (readerFrom!0 (_2!9892 lt!340324) (currentBit!9764 thiss!1204) (currentByte!9769 thiss!1204)))))))

(declare-fun lt!342151 () Bool)

(assert (=> b!216332 (= lt!342151 (not (= (bvand ((_ sign_extend 24) (select (arr!5586 (buf!5191 (readerFrom!0 (_2!9892 lt!340324) (currentBit!9764 thiss!1204) (currentByte!9769 thiss!1204)))) (currentByte!9769 (readerFrom!0 (_2!9892 lt!340324) (currentBit!9764 thiss!1204) (currentByte!9769 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9764 (readerFrom!0 (_2!9892 lt!340324) (currentBit!9764 thiss!1204) (currentByte!9769 thiss!1204)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!342149 () Bool)

(assert (=> b!216332 (= lt!342149 (not (= (bvand ((_ sign_extend 24) (select (arr!5586 (buf!5191 (readerFrom!0 (_2!9892 lt!340324) (currentBit!9764 thiss!1204) (currentByte!9769 thiss!1204)))) (currentByte!9769 (readerFrom!0 (_2!9892 lt!340324) (currentBit!9764 thiss!1204) (currentByte!9769 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9764 (readerFrom!0 (_2!9892 lt!340324) (currentBit!9764 thiss!1204) (currentByte!9769 thiss!1204)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!342152 () Bool)

(assert (=> b!216332 (= lt!342152 (not (= (bvand ((_ sign_extend 24) (select (arr!5586 (buf!5191 (readerFrom!0 (_2!9892 lt!340324) (currentBit!9764 thiss!1204) (currentByte!9769 thiss!1204)))) (currentByte!9769 (readerFrom!0 (_2!9892 lt!340324) (currentBit!9764 thiss!1204) (currentByte!9769 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9764 (readerFrom!0 (_2!9892 lt!340324) (currentBit!9764 thiss!1204) (currentByte!9769 thiss!1204)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!73111 res!181993) b!216332))

(assert (=> d!73111 m!331813))

(declare-fun m!333557 () Bool)

(assert (=> d!73111 m!333557))

(declare-fun m!333559 () Bool)

(assert (=> d!73111 m!333559))

(declare-fun m!333561 () Bool)

(assert (=> d!73111 m!333561))

(declare-fun m!333563 () Bool)

(assert (=> d!73111 m!333563))

(assert (=> b!216332 m!333561))

(assert (=> b!216332 m!333559))

(declare-fun m!333565 () Bool)

(assert (=> b!216332 m!333565))

(declare-fun m!333567 () Bool)

(assert (=> b!216332 m!333567))

(assert (=> b!216332 m!331813))

(assert (=> b!216332 m!333557))

(assert (=> d!72631 d!73111))

(assert (=> d!72675 d!72673))

(declare-fun d!73113 () Bool)

(assert (=> d!73113 (isPrefixOf!0 thiss!1204 (_2!9892 lt!340308))))

(assert (=> d!73113 true))

(declare-fun _$15!309 () Unit!15296)

(assert (=> d!73113 (= (choose!30 thiss!1204 (_2!9892 lt!340324) (_2!9892 lt!340308)) _$15!309)))

(declare-fun bs!17894 () Bool)

(assert (= bs!17894 d!73113))

(assert (=> bs!17894 m!331805))

(assert (=> d!72675 d!73113))

(assert (=> d!72675 d!72629))

(assert (=> b!215628 d!72647))

(assert (=> b!215628 d!72671))

(declare-fun d!73115 () Bool)

(declare-fun res!181994 () Bool)

(declare-fun e!147141 () Bool)

(assert (=> d!73115 (=> (not res!181994) (not e!147141))))

(assert (=> d!73115 (= res!181994 (= (size!4656 (buf!5191 thiss!1204)) (size!4656 (buf!5191 (_2!9892 lt!340815)))))))

(assert (=> d!73115 (= (isPrefixOf!0 thiss!1204 (_2!9892 lt!340815)) e!147141)))

(declare-fun b!216333 () Bool)

(declare-fun res!181995 () Bool)

(assert (=> b!216333 (=> (not res!181995) (not e!147141))))

(assert (=> b!216333 (= res!181995 (bvsle (bitIndex!0 (size!4656 (buf!5191 thiss!1204)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204)) (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!340815))) (currentByte!9769 (_2!9892 lt!340815)) (currentBit!9764 (_2!9892 lt!340815)))))))

(declare-fun b!216334 () Bool)

(declare-fun e!147140 () Bool)

(assert (=> b!216334 (= e!147141 e!147140)))

(declare-fun res!181996 () Bool)

(assert (=> b!216334 (=> res!181996 e!147140)))

(assert (=> b!216334 (= res!181996 (= (size!4656 (buf!5191 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!216335 () Bool)

(assert (=> b!216335 (= e!147140 (arrayBitRangesEq!0 (buf!5191 thiss!1204) (buf!5191 (_2!9892 lt!340815)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4656 (buf!5191 thiss!1204)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204))))))

(assert (= (and d!73115 res!181994) b!216333))

(assert (= (and b!216333 res!181995) b!216334))

(assert (= (and b!216334 (not res!181996)) b!216335))

(assert (=> b!216333 m!331797))

(assert (=> b!216333 m!332199))

(assert (=> b!216335 m!331797))

(assert (=> b!216335 m!331797))

(declare-fun m!333569 () Bool)

(assert (=> b!216335 m!333569))

(assert (=> b!215747 d!73115))

(declare-fun d!73117 () Bool)

(declare-fun lt!342153 () tuple2!18486)

(assert (=> d!73117 (= lt!342153 (readBit!0 (readerFrom!0 (_2!9892 lt!341287) (currentBit!9764 (_2!9892 lt!340324)) (currentByte!9769 (_2!9892 lt!340324)))))))

(assert (=> d!73117 (= (readBitPure!0 (readerFrom!0 (_2!9892 lt!341287) (currentBit!9764 (_2!9892 lt!340324)) (currentByte!9769 (_2!9892 lt!340324)))) (tuple2!18477 (_2!9898 lt!342153) (_1!9898 lt!342153)))))

(declare-fun bs!17895 () Bool)

(assert (= bs!17895 d!73117))

(assert (=> bs!17895 m!332453))

(declare-fun m!333571 () Bool)

(assert (=> bs!17895 m!333571))

(assert (=> b!215891 d!73117))

(declare-fun d!73119 () Bool)

(declare-fun e!147142 () Bool)

(assert (=> d!73119 e!147142))

(declare-fun res!181997 () Bool)

(assert (=> d!73119 (=> (not res!181997) (not e!147142))))

(assert (=> d!73119 (= res!181997 (invariant!0 (currentBit!9764 (_2!9892 lt!341287)) (currentByte!9769 (_2!9892 lt!341287)) (size!4656 (buf!5191 (_2!9892 lt!341287)))))))

(assert (=> d!73119 (= (readerFrom!0 (_2!9892 lt!341287) (currentBit!9764 (_2!9892 lt!340324)) (currentByte!9769 (_2!9892 lt!340324))) (BitStream!8421 (buf!5191 (_2!9892 lt!341287)) (currentByte!9769 (_2!9892 lt!340324)) (currentBit!9764 (_2!9892 lt!340324))))))

(declare-fun b!216336 () Bool)

(assert (=> b!216336 (= e!147142 (invariant!0 (currentBit!9764 (_2!9892 lt!340324)) (currentByte!9769 (_2!9892 lt!340324)) (size!4656 (buf!5191 (_2!9892 lt!341287)))))))

(assert (= (and d!73119 res!181997) b!216336))

(assert (=> d!73119 m!333243))

(declare-fun m!333573 () Bool)

(assert (=> b!216336 m!333573))

(assert (=> b!215891 d!73119))

(declare-fun c!10569 () Bool)

(declare-fun bm!3379 () Bool)

(declare-fun lt!342155 () (_ BitVec 32))

(declare-fun lt!342154 () (_ BitVec 32))

(declare-fun lt!342156 () tuple4!280)

(declare-fun call!3382 () Bool)

(assert (=> bm!3379 (= call!3382 (byteRangesEq!0 (select (arr!5586 (buf!5191 thiss!1204)) (_3!656 lt!342156)) (select (arr!5586 (buf!5191 (_2!9892 lt!340324))) (_3!656 lt!342156)) lt!342155 (ite c!10569 lt!342154 #b00000000000000000000000000001000)))))

(declare-fun b!216337 () Bool)

(declare-fun e!147144 () Bool)

(assert (=> b!216337 (= e!147144 (arrayRangesEq!702 (buf!5191 thiss!1204) (buf!5191 (_2!9892 lt!340324)) (_1!9903 lt!342156) (_2!9903 lt!342156)))))

(declare-fun b!216338 () Bool)

(declare-fun e!147143 () Bool)

(declare-fun e!147148 () Bool)

(assert (=> b!216338 (= e!147143 e!147148)))

(declare-fun res!181998 () Bool)

(assert (=> b!216338 (= res!181998 call!3382)))

(assert (=> b!216338 (=> (not res!181998) (not e!147148))))

(declare-fun b!216339 () Bool)

(declare-fun e!147145 () Bool)

(assert (=> b!216339 (= e!147145 e!147143)))

(assert (=> b!216339 (= c!10569 (= (_3!656 lt!342156) (_4!140 lt!342156)))))

(declare-fun b!216340 () Bool)

(declare-fun e!147146 () Bool)

(assert (=> b!216340 (= e!147146 e!147145)))

(declare-fun res!181999 () Bool)

(assert (=> b!216340 (=> (not res!181999) (not e!147145))))

(assert (=> b!216340 (= res!181999 e!147144)))

(declare-fun res!182000 () Bool)

(assert (=> b!216340 (=> res!182000 e!147144)))

(assert (=> b!216340 (= res!182000 (bvsge (_1!9903 lt!342156) (_2!9903 lt!342156)))))

(assert (=> b!216340 (= lt!342154 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!4656 (buf!5191 thiss!1204)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216340 (= lt!342155 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216340 (= lt!342156 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4656 (buf!5191 thiss!1204)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204))))))

(declare-fun d!73121 () Bool)

(declare-fun res!182002 () Bool)

(assert (=> d!73121 (=> res!182002 e!147146)))

(assert (=> d!73121 (= res!182002 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4656 (buf!5191 thiss!1204)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204))))))

(assert (=> d!73121 (= (arrayBitRangesEq!0 (buf!5191 thiss!1204) (buf!5191 (_2!9892 lt!340324)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4656 (buf!5191 thiss!1204)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204))) e!147146)))

(declare-fun b!216341 () Bool)

(assert (=> b!216341 (= e!147143 call!3382)))

(declare-fun e!147147 () Bool)

(declare-fun b!216342 () Bool)

(assert (=> b!216342 (= e!147147 (byteRangesEq!0 (select (arr!5586 (buf!5191 thiss!1204)) (_4!140 lt!342156)) (select (arr!5586 (buf!5191 (_2!9892 lt!340324))) (_4!140 lt!342156)) #b00000000000000000000000000000000 lt!342154))))

(declare-fun b!216343 () Bool)

(declare-fun res!182001 () Bool)

(assert (=> b!216343 (= res!182001 (= lt!342154 #b00000000000000000000000000000000))))

(assert (=> b!216343 (=> res!182001 e!147147)))

(assert (=> b!216343 (= e!147148 e!147147)))

(assert (= (and d!73121 (not res!182002)) b!216340))

(assert (= (and b!216340 (not res!182000)) b!216337))

(assert (= (and b!216340 res!181999) b!216339))

(assert (= (and b!216339 c!10569) b!216341))

(assert (= (and b!216339 (not c!10569)) b!216338))

(assert (= (and b!216338 res!181998) b!216343))

(assert (= (and b!216343 (not res!182001)) b!216342))

(assert (= (or b!216341 b!216338) bm!3379))

(declare-fun m!333575 () Bool)

(assert (=> bm!3379 m!333575))

(declare-fun m!333577 () Bool)

(assert (=> bm!3379 m!333577))

(assert (=> bm!3379 m!333575))

(assert (=> bm!3379 m!333577))

(declare-fun m!333579 () Bool)

(assert (=> bm!3379 m!333579))

(declare-fun m!333581 () Bool)

(assert (=> b!216337 m!333581))

(assert (=> b!216340 m!331797))

(declare-fun m!333583 () Bool)

(assert (=> b!216340 m!333583))

(declare-fun m!333585 () Bool)

(assert (=> b!216342 m!333585))

(declare-fun m!333587 () Bool)

(assert (=> b!216342 m!333587))

(assert (=> b!216342 m!333585))

(assert (=> b!216342 m!333587))

(declare-fun m!333589 () Bool)

(assert (=> b!216342 m!333589))

(assert (=> b!215710 d!73121))

(assert (=> b!215710 d!72649))

(declare-fun call!3383 () Bool)

(declare-fun lt!342158 () (_ BitVec 32))

(declare-fun c!10570 () Bool)

(declare-fun lt!342157 () (_ BitVec 32))

(declare-fun lt!342159 () tuple4!280)

(declare-fun bm!3380 () Bool)

(assert (=> bm!3380 (= call!3383 (byteRangesEq!0 (select (arr!5586 (buf!5191 thiss!1204)) (_3!656 lt!342159)) (select (arr!5586 (buf!5191 (_2!9892 lt!340308))) (_3!656 lt!342159)) lt!342158 (ite c!10570 lt!342157 #b00000000000000000000000000001000)))))

(declare-fun e!147150 () Bool)

(declare-fun b!216344 () Bool)

(assert (=> b!216344 (= e!147150 (arrayRangesEq!702 (buf!5191 thiss!1204) (buf!5191 (_2!9892 lt!340308)) (_1!9903 lt!342159) (_2!9903 lt!342159)))))

(declare-fun b!216345 () Bool)

(declare-fun e!147149 () Bool)

(declare-fun e!147154 () Bool)

(assert (=> b!216345 (= e!147149 e!147154)))

(declare-fun res!182003 () Bool)

(assert (=> b!216345 (= res!182003 call!3383)))

(assert (=> b!216345 (=> (not res!182003) (not e!147154))))

(declare-fun b!216346 () Bool)

(declare-fun e!147151 () Bool)

(assert (=> b!216346 (= e!147151 e!147149)))

(assert (=> b!216346 (= c!10570 (= (_3!656 lt!342159) (_4!140 lt!342159)))))

(declare-fun b!216347 () Bool)

(declare-fun e!147152 () Bool)

(assert (=> b!216347 (= e!147152 e!147151)))

(declare-fun res!182004 () Bool)

(assert (=> b!216347 (=> (not res!182004) (not e!147151))))

(assert (=> b!216347 (= res!182004 e!147150)))

(declare-fun res!182005 () Bool)

(assert (=> b!216347 (=> res!182005 e!147150)))

(assert (=> b!216347 (= res!182005 (bvsge (_1!9903 lt!342159) (_2!9903 lt!342159)))))

(assert (=> b!216347 (= lt!342157 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!4656 (buf!5191 thiss!1204)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216347 (= lt!342158 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216347 (= lt!342159 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4656 (buf!5191 thiss!1204)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204))))))

(declare-fun d!73123 () Bool)

(declare-fun res!182007 () Bool)

(assert (=> d!73123 (=> res!182007 e!147152)))

(assert (=> d!73123 (= res!182007 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4656 (buf!5191 thiss!1204)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204))))))

(assert (=> d!73123 (= (arrayBitRangesEq!0 (buf!5191 thiss!1204) (buf!5191 (_2!9892 lt!340308)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4656 (buf!5191 thiss!1204)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204))) e!147152)))

(declare-fun b!216348 () Bool)

(assert (=> b!216348 (= e!147149 call!3383)))

(declare-fun e!147153 () Bool)

(declare-fun b!216349 () Bool)

(assert (=> b!216349 (= e!147153 (byteRangesEq!0 (select (arr!5586 (buf!5191 thiss!1204)) (_4!140 lt!342159)) (select (arr!5586 (buf!5191 (_2!9892 lt!340308))) (_4!140 lt!342159)) #b00000000000000000000000000000000 lt!342157))))

(declare-fun b!216350 () Bool)

(declare-fun res!182006 () Bool)

(assert (=> b!216350 (= res!182006 (= lt!342157 #b00000000000000000000000000000000))))

(assert (=> b!216350 (=> res!182006 e!147153)))

(assert (=> b!216350 (= e!147154 e!147153)))

(assert (= (and d!73123 (not res!182007)) b!216347))

(assert (= (and b!216347 (not res!182005)) b!216344))

(assert (= (and b!216347 res!182004) b!216346))

(assert (= (and b!216346 c!10570) b!216348))

(assert (= (and b!216346 (not c!10570)) b!216345))

(assert (= (and b!216345 res!182003) b!216350))

(assert (= (and b!216350 (not res!182006)) b!216349))

(assert (= (or b!216348 b!216345) bm!3380))

(declare-fun m!333591 () Bool)

(assert (=> bm!3380 m!333591))

(declare-fun m!333593 () Bool)

(assert (=> bm!3380 m!333593))

(assert (=> bm!3380 m!333591))

(assert (=> bm!3380 m!333593))

(declare-fun m!333595 () Bool)

(assert (=> bm!3380 m!333595))

(declare-fun m!333597 () Bool)

(assert (=> b!216344 m!333597))

(assert (=> b!216347 m!331797))

(assert (=> b!216347 m!333583))

(declare-fun m!333599 () Bool)

(assert (=> b!216349 m!333599))

(declare-fun m!333601 () Bool)

(assert (=> b!216349 m!333601))

(assert (=> b!216349 m!333599))

(assert (=> b!216349 m!333601))

(declare-fun m!333603 () Bool)

(assert (=> b!216349 m!333603))

(assert (=> b!215760 d!73123))

(assert (=> b!215760 d!72649))

(declare-fun d!73125 () Bool)

(declare-fun e!147155 () Bool)

(assert (=> d!73125 e!147155))

(declare-fun res!182008 () Bool)

(assert (=> d!73125 (=> (not res!182008) (not e!147155))))

(declare-fun lt!342161 () (_ BitVec 64))

(declare-fun lt!342163 () (_ BitVec 64))

(declare-fun lt!342164 () (_ BitVec 64))

(assert (=> d!73125 (= res!182008 (= lt!342163 (bvsub lt!342164 lt!342161)))))

(assert (=> d!73125 (or (= (bvand lt!342164 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!342161 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!342164 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!342164 lt!342161) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73125 (= lt!342161 (remainingBits!0 ((_ sign_extend 32) (size!4656 (buf!5191 (_1!9893 lt!340708)))) ((_ sign_extend 32) (currentByte!9769 (_1!9893 lt!340708))) ((_ sign_extend 32) (currentBit!9764 (_1!9893 lt!340708)))))))

(declare-fun lt!342162 () (_ BitVec 64))

(declare-fun lt!342160 () (_ BitVec 64))

(assert (=> d!73125 (= lt!342164 (bvmul lt!342162 lt!342160))))

(assert (=> d!73125 (or (= lt!342162 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!342160 (bvsdiv (bvmul lt!342162 lt!342160) lt!342162)))))

(assert (=> d!73125 (= lt!342160 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73125 (= lt!342162 ((_ sign_extend 32) (size!4656 (buf!5191 (_1!9893 lt!340708)))))))

(assert (=> d!73125 (= lt!342163 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9769 (_1!9893 lt!340708))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9764 (_1!9893 lt!340708)))))))

(assert (=> d!73125 (invariant!0 (currentBit!9764 (_1!9893 lt!340708)) (currentByte!9769 (_1!9893 lt!340708)) (size!4656 (buf!5191 (_1!9893 lt!340708))))))

(assert (=> d!73125 (= (bitIndex!0 (size!4656 (buf!5191 (_1!9893 lt!340708))) (currentByte!9769 (_1!9893 lt!340708)) (currentBit!9764 (_1!9893 lt!340708))) lt!342163)))

(declare-fun b!216351 () Bool)

(declare-fun res!182009 () Bool)

(assert (=> b!216351 (=> (not res!182009) (not e!147155))))

(assert (=> b!216351 (= res!182009 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!342163))))

(declare-fun b!216352 () Bool)

(declare-fun lt!342165 () (_ BitVec 64))

(assert (=> b!216352 (= e!147155 (bvsle lt!342163 (bvmul lt!342165 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216352 (or (= lt!342165 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!342165 #b0000000000000000000000000000000000000000000000000000000000001000) lt!342165)))))

(assert (=> b!216352 (= lt!342165 ((_ sign_extend 32) (size!4656 (buf!5191 (_1!9893 lt!340708)))))))

(assert (= (and d!73125 res!182008) b!216351))

(assert (= (and b!216351 res!182009) b!216352))

(declare-fun m!333605 () Bool)

(assert (=> d!73125 m!333605))

(declare-fun m!333607 () Bool)

(assert (=> d!73125 m!333607))

(assert (=> d!72617 d!73125))

(declare-fun d!73127 () Bool)

(declare-fun lt!342166 () tuple2!18486)

(assert (=> d!73127 (= lt!342166 (readBit!0 lt!340707))))

(assert (=> d!73127 (= (readBitPure!0 lt!340707) (tuple2!18477 (_2!9898 lt!342166) (_1!9898 lt!342166)))))

(declare-fun bs!17896 () Bool)

(assert (= bs!17896 d!73127))

(declare-fun m!333609 () Bool)

(assert (=> bs!17896 m!333609))

(assert (=> d!72617 d!73127))

(declare-fun d!73129 () Bool)

(declare-fun e!147156 () Bool)

(assert (=> d!73129 e!147156))

(declare-fun res!182010 () Bool)

(assert (=> d!73129 (=> (not res!182010) (not e!147156))))

(declare-fun lt!342170 () (_ BitVec 64))

(declare-fun lt!342168 () (_ BitVec 64))

(declare-fun lt!342171 () (_ BitVec 64))

(assert (=> d!73129 (= res!182010 (= lt!342170 (bvsub lt!342171 lt!342168)))))

(assert (=> d!73129 (or (= (bvand lt!342171 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!342168 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!342171 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!342171 lt!342168) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73129 (= lt!342168 (remainingBits!0 ((_ sign_extend 32) (size!4656 (buf!5191 (_1!9893 lt!340709)))) ((_ sign_extend 32) (currentByte!9769 (_1!9893 lt!340709))) ((_ sign_extend 32) (currentBit!9764 (_1!9893 lt!340709)))))))

(declare-fun lt!342169 () (_ BitVec 64))

(declare-fun lt!342167 () (_ BitVec 64))

(assert (=> d!73129 (= lt!342171 (bvmul lt!342169 lt!342167))))

(assert (=> d!73129 (or (= lt!342169 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!342167 (bvsdiv (bvmul lt!342169 lt!342167) lt!342169)))))

(assert (=> d!73129 (= lt!342167 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73129 (= lt!342169 ((_ sign_extend 32) (size!4656 (buf!5191 (_1!9893 lt!340709)))))))

(assert (=> d!73129 (= lt!342170 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9769 (_1!9893 lt!340709))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9764 (_1!9893 lt!340709)))))))

(assert (=> d!73129 (invariant!0 (currentBit!9764 (_1!9893 lt!340709)) (currentByte!9769 (_1!9893 lt!340709)) (size!4656 (buf!5191 (_1!9893 lt!340709))))))

(assert (=> d!73129 (= (bitIndex!0 (size!4656 (buf!5191 (_1!9893 lt!340709))) (currentByte!9769 (_1!9893 lt!340709)) (currentBit!9764 (_1!9893 lt!340709))) lt!342170)))

(declare-fun b!216353 () Bool)

(declare-fun res!182011 () Bool)

(assert (=> b!216353 (=> (not res!182011) (not e!147156))))

(assert (=> b!216353 (= res!182011 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!342170))))

(declare-fun b!216354 () Bool)

(declare-fun lt!342172 () (_ BitVec 64))

(assert (=> b!216354 (= e!147156 (bvsle lt!342170 (bvmul lt!342172 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216354 (or (= lt!342172 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!342172 #b0000000000000000000000000000000000000000000000000000000000001000) lt!342172)))))

(assert (=> b!216354 (= lt!342172 ((_ sign_extend 32) (size!4656 (buf!5191 (_1!9893 lt!340709)))))))

(assert (= (and d!73129 res!182010) b!216353))

(assert (= (and b!216353 res!182011) b!216354))

(declare-fun m!333611 () Bool)

(assert (=> d!73129 m!333611))

(declare-fun m!333613 () Bool)

(assert (=> d!73129 m!333613))

(assert (=> d!72617 d!73129))

(declare-fun d!73131 () Bool)

(declare-fun e!147159 () Bool)

(assert (=> d!73131 e!147159))

(declare-fun res!182014 () Bool)

(assert (=> d!73131 (=> (not res!182014) (not e!147159))))

(declare-fun lt!342181 () tuple2!18476)

(declare-fun lt!342179 () tuple2!18476)

(assert (=> d!73131 (= res!182014 (= (bitIndex!0 (size!4656 (buf!5191 (_1!9893 lt!342181))) (currentByte!9769 (_1!9893 lt!342181)) (currentBit!9764 (_1!9893 lt!342181))) (bitIndex!0 (size!4656 (buf!5191 (_1!9893 lt!342179))) (currentByte!9769 (_1!9893 lt!342179)) (currentBit!9764 (_1!9893 lt!342179)))))))

(declare-fun lt!342180 () BitStream!8420)

(assert (=> d!73131 (= lt!342179 (readBitPure!0 lt!342180))))

(assert (=> d!73131 (= lt!342181 (readBitPure!0 lt!340323))))

(assert (=> d!73131 (= lt!342180 (BitStream!8421 (buf!5191 (_2!9892 lt!340308)) (currentByte!9769 lt!340323) (currentBit!9764 lt!340323)))))

(assert (=> d!73131 (invariant!0 (currentBit!9764 lt!340323) (currentByte!9769 lt!340323) (size!4656 (buf!5191 (_2!9892 lt!340308))))))

(assert (=> d!73131 true))

(declare-fun _$9!90 () Unit!15296)

(assert (=> d!73131 (= (choose!50 lt!340323 (_2!9892 lt!340308) lt!340707 lt!340708 (tuple2!18477 (_1!9893 lt!340708) (_2!9893 lt!340708)) (_1!9893 lt!340708) (_2!9893 lt!340708) lt!340709 (tuple2!18477 (_1!9893 lt!340709) (_2!9893 lt!340709)) (_1!9893 lt!340709) (_2!9893 lt!340709)) _$9!90)))

(declare-fun b!216357 () Bool)

(assert (=> b!216357 (= e!147159 (= (_2!9893 lt!342181) (_2!9893 lt!342179)))))

(assert (= (and d!73131 res!182014) b!216357))

(declare-fun m!333615 () Bool)

(assert (=> d!73131 m!333615))

(assert (=> d!73131 m!332133))

(assert (=> d!73131 m!331827))

(declare-fun m!333617 () Bool)

(assert (=> d!73131 m!333617))

(declare-fun m!333619 () Bool)

(assert (=> d!73131 m!333619))

(assert (=> d!72617 d!73131))

(declare-fun d!73133 () Bool)

(assert (=> d!73133 (= (invariant!0 (currentBit!9764 lt!340323) (currentByte!9769 lt!340323) (size!4656 (buf!5191 (_2!9892 lt!340308)))) (and (bvsge (currentBit!9764 lt!340323) #b00000000000000000000000000000000) (bvslt (currentBit!9764 lt!340323) #b00000000000000000000000000001000) (bvsge (currentByte!9769 lt!340323) #b00000000000000000000000000000000) (or (bvslt (currentByte!9769 lt!340323) (size!4656 (buf!5191 (_2!9892 lt!340308)))) (and (= (currentBit!9764 lt!340323) #b00000000000000000000000000000000) (= (currentByte!9769 lt!340323) (size!4656 (buf!5191 (_2!9892 lt!340308))))))))))

(assert (=> d!72617 d!73133))

(assert (=> d!72617 d!72587))

(declare-fun d!73135 () Bool)

(declare-fun e!147160 () Bool)

(assert (=> d!73135 e!147160))

(declare-fun res!182015 () Bool)

(assert (=> d!73135 (=> (not res!182015) (not e!147160))))

(declare-fun lt!342182 () BitStream!8420)

(declare-fun lt!342183 () (_ BitVec 64))

(assert (=> d!73135 (= res!182015 (= (bvadd lt!342183 (bvsub lt!340726 lt!340720)) (bitIndex!0 (size!4656 (buf!5191 lt!342182)) (currentByte!9769 lt!342182) (currentBit!9764 lt!342182))))))

(assert (=> d!73135 (or (not (= (bvand lt!342183 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!340726 lt!340720) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!342183 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!342183 (bvsub lt!340726 lt!340720)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73135 (= lt!342183 (bitIndex!0 (size!4656 (buf!5191 (_2!9895 lt!340716))) (currentByte!9769 (_2!9895 lt!340716)) (currentBit!9764 (_2!9895 lt!340716))))))

(assert (=> d!73135 (= lt!342182 (_2!9892 (moveBitIndex!0 (_2!9895 lt!340716) (bvsub lt!340726 lt!340720))))))

(assert (=> d!73135 (moveBitIndexPrecond!0 (_2!9895 lt!340716) (bvsub lt!340726 lt!340720))))

(assert (=> d!73135 (= (withMovedBitIndex!0 (_2!9895 lt!340716) (bvsub lt!340726 lt!340720)) lt!342182)))

(declare-fun b!216358 () Bool)

(assert (=> b!216358 (= e!147160 (= (size!4656 (buf!5191 (_2!9895 lt!340716))) (size!4656 (buf!5191 lt!342182))))))

(assert (= (and d!73135 res!182015) b!216358))

(declare-fun m!333621 () Bool)

(assert (=> d!73135 m!333621))

(assert (=> d!73135 m!333285))

(declare-fun m!333623 () Bool)

(assert (=> d!73135 m!333623))

(declare-fun m!333625 () Bool)

(assert (=> d!73135 m!333625))

(assert (=> b!215706 d!73135))

(assert (=> b!215706 d!72671))

(assert (=> b!215706 d!72647))

(assert (=> b!215708 d!72649))

(assert (=> b!215708 d!72647))

(assert (=> b!215758 d!72649))

(assert (=> b!215758 d!72671))

(declare-fun d!73137 () Bool)

(assert (=> d!73137 (= (remainingBits!0 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!340308)))) ((_ sign_extend 32) (currentByte!9769 (_2!9892 lt!340308))) ((_ sign_extend 32) (currentBit!9764 (_2!9892 lt!340308)))) (bvsub (bvmul ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!340308)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9769 (_2!9892 lt!340308))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9764 (_2!9892 lt!340308))))))))

(assert (=> d!72671 d!73137))

(assert (=> d!72671 d!72645))

(assert (=> b!215704 d!72647))

(declare-fun d!73139 () Bool)

(assert (=> d!73139 (arrayBitRangesEq!0 (buf!5191 (_2!9892 lt!340308)) (buf!5191 (_2!9892 lt!340324)) lt!340713 lt!340723)))

(declare-fun lt!342186 () Unit!15296)

(declare-fun choose!8 (array!10599 array!10599 (_ BitVec 64) (_ BitVec 64)) Unit!15296)

(assert (=> d!73139 (= lt!342186 (choose!8 (buf!5191 (_2!9892 lt!340324)) (buf!5191 (_2!9892 lt!340308)) lt!340713 lt!340723))))

(assert (=> d!73139 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!340713) (bvsle lt!340713 lt!340723))))

(assert (=> d!73139 (= (arrayBitRangesEqSymmetric!0 (buf!5191 (_2!9892 lt!340324)) (buf!5191 (_2!9892 lt!340308)) lt!340713 lt!340723) lt!342186)))

(declare-fun bs!17897 () Bool)

(assert (= bs!17897 d!73139))

(assert (=> bs!17897 m!332167))

(declare-fun m!333627 () Bool)

(assert (=> bs!17897 m!333627))

(assert (=> b!215704 d!73139))

(declare-fun bm!3381 () Bool)

(declare-fun lt!342188 () (_ BitVec 32))

(declare-fun lt!342189 () tuple4!280)

(declare-fun lt!342187 () (_ BitVec 32))

(declare-fun call!3384 () Bool)

(declare-fun c!10571 () Bool)

(assert (=> bm!3381 (= call!3384 (byteRangesEq!0 (select (arr!5586 (buf!5191 (_2!9892 lt!340308))) (_3!656 lt!342189)) (select (arr!5586 (buf!5191 (_2!9892 lt!340324))) (_3!656 lt!342189)) lt!342188 (ite c!10571 lt!342187 #b00000000000000000000000000001000)))))

(declare-fun e!147162 () Bool)

(declare-fun b!216359 () Bool)

(assert (=> b!216359 (= e!147162 (arrayRangesEq!702 (buf!5191 (_2!9892 lt!340308)) (buf!5191 (_2!9892 lt!340324)) (_1!9903 lt!342189) (_2!9903 lt!342189)))))

(declare-fun b!216360 () Bool)

(declare-fun e!147161 () Bool)

(declare-fun e!147166 () Bool)

(assert (=> b!216360 (= e!147161 e!147166)))

(declare-fun res!182016 () Bool)

(assert (=> b!216360 (= res!182016 call!3384)))

(assert (=> b!216360 (=> (not res!182016) (not e!147166))))

(declare-fun b!216361 () Bool)

(declare-fun e!147163 () Bool)

(assert (=> b!216361 (= e!147163 e!147161)))

(assert (=> b!216361 (= c!10571 (= (_3!656 lt!342189) (_4!140 lt!342189)))))

(declare-fun b!216362 () Bool)

(declare-fun e!147164 () Bool)

(assert (=> b!216362 (= e!147164 e!147163)))

(declare-fun res!182017 () Bool)

(assert (=> b!216362 (=> (not res!182017) (not e!147163))))

(assert (=> b!216362 (= res!182017 e!147162)))

(declare-fun res!182018 () Bool)

(assert (=> b!216362 (=> res!182018 e!147162)))

(assert (=> b!216362 (= res!182018 (bvsge (_1!9903 lt!342189) (_2!9903 lt!342189)))))

(assert (=> b!216362 (= lt!342187 ((_ extract 31 0) (bvsrem lt!340723 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216362 (= lt!342188 ((_ extract 31 0) (bvsrem lt!340713 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216362 (= lt!342189 (arrayBitIndices!0 lt!340713 lt!340723))))

(declare-fun d!73141 () Bool)

(declare-fun res!182020 () Bool)

(assert (=> d!73141 (=> res!182020 e!147164)))

(assert (=> d!73141 (= res!182020 (bvsge lt!340713 lt!340723))))

(assert (=> d!73141 (= (arrayBitRangesEq!0 (buf!5191 (_2!9892 lt!340308)) (buf!5191 (_2!9892 lt!340324)) lt!340713 lt!340723) e!147164)))

(declare-fun b!216363 () Bool)

(assert (=> b!216363 (= e!147161 call!3384)))

(declare-fun b!216364 () Bool)

(declare-fun e!147165 () Bool)

(assert (=> b!216364 (= e!147165 (byteRangesEq!0 (select (arr!5586 (buf!5191 (_2!9892 lt!340308))) (_4!140 lt!342189)) (select (arr!5586 (buf!5191 (_2!9892 lt!340324))) (_4!140 lt!342189)) #b00000000000000000000000000000000 lt!342187))))

(declare-fun b!216365 () Bool)

(declare-fun res!182019 () Bool)

(assert (=> b!216365 (= res!182019 (= lt!342187 #b00000000000000000000000000000000))))

(assert (=> b!216365 (=> res!182019 e!147165)))

(assert (=> b!216365 (= e!147166 e!147165)))

(assert (= (and d!73141 (not res!182020)) b!216362))

(assert (= (and b!216362 (not res!182018)) b!216359))

(assert (= (and b!216362 res!182017) b!216361))

(assert (= (and b!216361 c!10571) b!216363))

(assert (= (and b!216361 (not c!10571)) b!216360))

(assert (= (and b!216360 res!182016) b!216365))

(assert (= (and b!216365 (not res!182019)) b!216364))

(assert (= (or b!216363 b!216360) bm!3381))

(declare-fun m!333629 () Bool)

(assert (=> bm!3381 m!333629))

(declare-fun m!333631 () Bool)

(assert (=> bm!3381 m!333631))

(assert (=> bm!3381 m!333629))

(assert (=> bm!3381 m!333631))

(declare-fun m!333633 () Bool)

(assert (=> bm!3381 m!333633))

(declare-fun m!333635 () Bool)

(assert (=> b!216359 m!333635))

(declare-fun m!333637 () Bool)

(assert (=> b!216362 m!333637))

(declare-fun m!333639 () Bool)

(assert (=> b!216364 m!333639))

(declare-fun m!333641 () Bool)

(assert (=> b!216364 m!333641))

(assert (=> b!216364 m!333639))

(assert (=> b!216364 m!333641))

(declare-fun m!333643 () Bool)

(assert (=> b!216364 m!333643))

(assert (=> b!215704 d!73141))

(declare-fun d!73143 () Bool)

(declare-fun e!147167 () Bool)

(assert (=> d!73143 e!147167))

(declare-fun res!182021 () Bool)

(assert (=> d!73143 (=> (not res!182021) (not e!147167))))

(assert (=> d!73143 (= res!182021 (= (buf!5191 (_2!9892 (increaseBitIndex!0 lt!340323))) (buf!5191 lt!340323)))))

(declare-fun lt!342190 () Bool)

(assert (=> d!73143 (= lt!342190 (not (= (bvand ((_ sign_extend 24) (select (arr!5586 (buf!5191 lt!340323)) (currentByte!9769 lt!340323))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9764 lt!340323)))) #b00000000000000000000000000000000)))))

(declare-fun lt!342192 () tuple2!18486)

(assert (=> d!73143 (= lt!342192 (tuple2!18487 (not (= (bvand ((_ sign_extend 24) (select (arr!5586 (buf!5191 lt!340323)) (currentByte!9769 lt!340323))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9764 lt!340323)))) #b00000000000000000000000000000000)) (_2!9892 (increaseBitIndex!0 lt!340323))))))

(assert (=> d!73143 (validate_offset_bit!0 ((_ sign_extend 32) (size!4656 (buf!5191 lt!340323))) ((_ sign_extend 32) (currentByte!9769 lt!340323)) ((_ sign_extend 32) (currentBit!9764 lt!340323)))))

(assert (=> d!73143 (= (readBit!0 lt!340323) lt!342192)))

(declare-fun lt!342194 () (_ BitVec 64))

(declare-fun lt!342191 () (_ BitVec 64))

(declare-fun b!216366 () Bool)

(assert (=> b!216366 (= e!147167 (= (bitIndex!0 (size!4656 (buf!5191 (_2!9892 (increaseBitIndex!0 lt!340323)))) (currentByte!9769 (_2!9892 (increaseBitIndex!0 lt!340323))) (currentBit!9764 (_2!9892 (increaseBitIndex!0 lt!340323)))) (bvadd lt!342191 lt!342194)))))

(assert (=> b!216366 (or (not (= (bvand lt!342191 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!342194 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!342191 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!342191 lt!342194) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216366 (= lt!342194 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!216366 (= lt!342191 (bitIndex!0 (size!4656 (buf!5191 lt!340323)) (currentByte!9769 lt!340323) (currentBit!9764 lt!340323)))))

(declare-fun lt!342195 () Bool)

(assert (=> b!216366 (= lt!342195 (not (= (bvand ((_ sign_extend 24) (select (arr!5586 (buf!5191 lt!340323)) (currentByte!9769 lt!340323))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9764 lt!340323)))) #b00000000000000000000000000000000)))))

(declare-fun lt!342193 () Bool)

(assert (=> b!216366 (= lt!342193 (not (= (bvand ((_ sign_extend 24) (select (arr!5586 (buf!5191 lt!340323)) (currentByte!9769 lt!340323))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9764 lt!340323)))) #b00000000000000000000000000000000)))))

(declare-fun lt!342196 () Bool)

(assert (=> b!216366 (= lt!342196 (not (= (bvand ((_ sign_extend 24) (select (arr!5586 (buf!5191 lt!340323)) (currentByte!9769 lt!340323))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9764 lt!340323)))) #b00000000000000000000000000000000)))))

(assert (= (and d!73143 res!182021) b!216366))

(declare-fun m!333645 () Bool)

(assert (=> d!73143 m!333645))

(declare-fun m!333647 () Bool)

(assert (=> d!73143 m!333647))

(declare-fun m!333649 () Bool)

(assert (=> d!73143 m!333649))

(declare-fun m!333651 () Bool)

(assert (=> d!73143 m!333651))

(assert (=> b!216366 m!333649))

(assert (=> b!216366 m!333647))

(declare-fun m!333653 () Bool)

(assert (=> b!216366 m!333653))

(declare-fun m!333655 () Bool)

(assert (=> b!216366 m!333655))

(assert (=> b!216366 m!333645))

(assert (=> d!72587 d!73143))

(declare-fun d!73145 () Bool)

(declare-fun e!147168 () Bool)

(assert (=> d!73145 e!147168))

(declare-fun res!182022 () Bool)

(assert (=> d!73145 (=> (not res!182022) (not e!147168))))

(declare-fun lt!342197 () BitStream!8420)

(declare-fun lt!342198 () (_ BitVec 64))

(assert (=> d!73145 (= res!182022 (= (bvadd lt!342198 (bvsub lt!340640 lt!340634)) (bitIndex!0 (size!4656 (buf!5191 lt!342197)) (currentByte!9769 lt!342197) (currentBit!9764 lt!342197))))))

(assert (=> d!73145 (or (not (= (bvand lt!342198 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!340640 lt!340634) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!342198 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!342198 (bvsub lt!340640 lt!340634)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73145 (= lt!342198 (bitIndex!0 (size!4656 (buf!5191 (_2!9895 lt!340630))) (currentByte!9769 (_2!9895 lt!340630)) (currentBit!9764 (_2!9895 lt!340630))))))

(assert (=> d!73145 (= lt!342197 (_2!9892 (moveBitIndex!0 (_2!9895 lt!340630) (bvsub lt!340640 lt!340634))))))

(assert (=> d!73145 (moveBitIndexPrecond!0 (_2!9895 lt!340630) (bvsub lt!340640 lt!340634))))

(assert (=> d!73145 (= (withMovedBitIndex!0 (_2!9895 lt!340630) (bvsub lt!340640 lt!340634)) lt!342197)))

(declare-fun b!216367 () Bool)

(assert (=> b!216367 (= e!147168 (= (size!4656 (buf!5191 (_2!9895 lt!340630))) (size!4656 (buf!5191 lt!342197))))))

(assert (= (and d!73145 res!182022) b!216367))

(declare-fun m!333657 () Bool)

(assert (=> d!73145 m!333657))

(assert (=> d!73145 m!333255))

(declare-fun m!333659 () Bool)

(assert (=> d!73145 m!333659))

(declare-fun m!333661 () Bool)

(assert (=> d!73145 m!333661))

(assert (=> b!215670 d!73145))

(assert (=> b!215670 d!72671))

(assert (=> b!215670 d!72649))

(declare-fun d!73147 () Bool)

(assert (=> d!73147 (= (invariant!0 (currentBit!9764 (_2!9892 lt!341282)) (currentByte!9769 (_2!9892 lt!341282)) (size!4656 (buf!5191 (_2!9892 lt!341282)))) (and (bvsge (currentBit!9764 (_2!9892 lt!341282)) #b00000000000000000000000000000000) (bvslt (currentBit!9764 (_2!9892 lt!341282)) #b00000000000000000000000000001000) (bvsge (currentByte!9769 (_2!9892 lt!341282)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9769 (_2!9892 lt!341282)) (size!4656 (buf!5191 (_2!9892 lt!341282)))) (and (= (currentBit!9764 (_2!9892 lt!341282)) #b00000000000000000000000000000000) (= (currentByte!9769 (_2!9892 lt!341282)) (size!4656 (buf!5191 (_2!9892 lt!341282))))))))))

(assert (=> d!72677 d!73147))

(assert (=> b!215885 d!73053))

(declare-fun lt!342199 () tuple2!18488)

(declare-fun d!73149 () Bool)

(assert (=> d!73149 (= lt!342199 (readNBitsLSBFirstsLoop!0 (_1!9895 lt!341286) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(assert (=> d!73149 (= (readNBitsLSBFirstsLoopPure!0 (_1!9895 lt!341286) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))) (tuple2!18479 (_2!9899 lt!342199) (_1!9899 lt!342199)))))

(declare-fun bs!17898 () Bool)

(assert (= bs!17898 d!73149))

(declare-fun m!333663 () Bool)

(assert (=> bs!17898 m!333663))

(assert (=> b!215885 d!73149))

(declare-fun b!216368 () Bool)

(declare-fun res!182025 () Bool)

(declare-fun e!147170 () Bool)

(assert (=> b!216368 (=> (not res!182025) (not e!147170))))

(declare-fun lt!342206 () tuple2!18480)

(assert (=> b!216368 (= res!182025 (isPrefixOf!0 (_2!9895 lt!342206) (_2!9892 lt!341282)))))

(declare-fun b!216369 () Bool)

(declare-fun e!147169 () Unit!15296)

(declare-fun lt!342209 () Unit!15296)

(assert (=> b!216369 (= e!147169 lt!342209)))

(declare-fun lt!342203 () (_ BitVec 64))

(assert (=> b!216369 (= lt!342203 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!342213 () (_ BitVec 64))

(assert (=> b!216369 (= lt!342213 (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!340324))) (currentByte!9769 (_2!9892 lt!340324)) (currentBit!9764 (_2!9892 lt!340324))))))

(assert (=> b!216369 (= lt!342209 (arrayBitRangesEqSymmetric!0 (buf!5191 (_2!9892 lt!340324)) (buf!5191 (_2!9892 lt!341282)) lt!342203 lt!342213))))

(assert (=> b!216369 (arrayBitRangesEq!0 (buf!5191 (_2!9892 lt!341282)) (buf!5191 (_2!9892 lt!340324)) lt!342203 lt!342213)))

(declare-fun b!216370 () Bool)

(declare-fun Unit!15394 () Unit!15296)

(assert (=> b!216370 (= e!147169 Unit!15394)))

(declare-fun lt!342210 () (_ BitVec 64))

(declare-fun lt!342216 () (_ BitVec 64))

(declare-fun b!216371 () Bool)

(assert (=> b!216371 (= e!147170 (= (_1!9895 lt!342206) (withMovedBitIndex!0 (_2!9895 lt!342206) (bvsub lt!342216 lt!342210))))))

(assert (=> b!216371 (or (= (bvand lt!342216 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!342210 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!342216 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!342216 lt!342210) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216371 (= lt!342210 (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!341282))) (currentByte!9769 (_2!9892 lt!341282)) (currentBit!9764 (_2!9892 lt!341282))))))

(assert (=> b!216371 (= lt!342216 (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!340324))) (currentByte!9769 (_2!9892 lt!340324)) (currentBit!9764 (_2!9892 lt!340324))))))

(declare-fun d!73151 () Bool)

(assert (=> d!73151 e!147170))

(declare-fun res!182024 () Bool)

(assert (=> d!73151 (=> (not res!182024) (not e!147170))))

(assert (=> d!73151 (= res!182024 (isPrefixOf!0 (_1!9895 lt!342206) (_2!9895 lt!342206)))))

(declare-fun lt!342219 () BitStream!8420)

(assert (=> d!73151 (= lt!342206 (tuple2!18481 lt!342219 (_2!9892 lt!341282)))))

(declare-fun lt!342212 () Unit!15296)

(declare-fun lt!342218 () Unit!15296)

(assert (=> d!73151 (= lt!342212 lt!342218)))

(assert (=> d!73151 (isPrefixOf!0 lt!342219 (_2!9892 lt!341282))))

(assert (=> d!73151 (= lt!342218 (lemmaIsPrefixTransitive!0 lt!342219 (_2!9892 lt!341282) (_2!9892 lt!341282)))))

(declare-fun lt!342207 () Unit!15296)

(declare-fun lt!342215 () Unit!15296)

(assert (=> d!73151 (= lt!342207 lt!342215)))

(assert (=> d!73151 (isPrefixOf!0 lt!342219 (_2!9892 lt!341282))))

(assert (=> d!73151 (= lt!342215 (lemmaIsPrefixTransitive!0 lt!342219 (_2!9892 lt!340324) (_2!9892 lt!341282)))))

(declare-fun lt!342217 () Unit!15296)

(assert (=> d!73151 (= lt!342217 e!147169)))

(declare-fun c!10572 () Bool)

(assert (=> d!73151 (= c!10572 (not (= (size!4656 (buf!5191 (_2!9892 lt!340324))) #b00000000000000000000000000000000)))))

(declare-fun lt!342202 () Unit!15296)

(declare-fun lt!342214 () Unit!15296)

(assert (=> d!73151 (= lt!342202 lt!342214)))

(assert (=> d!73151 (isPrefixOf!0 (_2!9892 lt!341282) (_2!9892 lt!341282))))

(assert (=> d!73151 (= lt!342214 (lemmaIsPrefixRefl!0 (_2!9892 lt!341282)))))

(declare-fun lt!342211 () Unit!15296)

(declare-fun lt!342201 () Unit!15296)

(assert (=> d!73151 (= lt!342211 lt!342201)))

(assert (=> d!73151 (= lt!342201 (lemmaIsPrefixRefl!0 (_2!9892 lt!341282)))))

(declare-fun lt!342204 () Unit!15296)

(declare-fun lt!342205 () Unit!15296)

(assert (=> d!73151 (= lt!342204 lt!342205)))

(assert (=> d!73151 (isPrefixOf!0 lt!342219 lt!342219)))

(assert (=> d!73151 (= lt!342205 (lemmaIsPrefixRefl!0 lt!342219))))

(declare-fun lt!342208 () Unit!15296)

(declare-fun lt!342200 () Unit!15296)

(assert (=> d!73151 (= lt!342208 lt!342200)))

(assert (=> d!73151 (isPrefixOf!0 (_2!9892 lt!340324) (_2!9892 lt!340324))))

(assert (=> d!73151 (= lt!342200 (lemmaIsPrefixRefl!0 (_2!9892 lt!340324)))))

(assert (=> d!73151 (= lt!342219 (BitStream!8421 (buf!5191 (_2!9892 lt!341282)) (currentByte!9769 (_2!9892 lt!340324)) (currentBit!9764 (_2!9892 lt!340324))))))

(assert (=> d!73151 (isPrefixOf!0 (_2!9892 lt!340324) (_2!9892 lt!341282))))

(assert (=> d!73151 (= (reader!0 (_2!9892 lt!340324) (_2!9892 lt!341282)) lt!342206)))

(declare-fun b!216372 () Bool)

(declare-fun res!182023 () Bool)

(assert (=> b!216372 (=> (not res!182023) (not e!147170))))

(assert (=> b!216372 (= res!182023 (isPrefixOf!0 (_1!9895 lt!342206) (_2!9892 lt!340324)))))

(assert (= (and d!73151 c!10572) b!216369))

(assert (= (and d!73151 (not c!10572)) b!216370))

(assert (= (and d!73151 res!182024) b!216372))

(assert (= (and b!216372 res!182023) b!216368))

(assert (= (and b!216368 res!182025) b!216371))

(declare-fun m!333665 () Bool)

(assert (=> b!216371 m!333665))

(assert (=> b!216371 m!332539))

(assert (=> b!216371 m!331795))

(declare-fun m!333667 () Bool)

(assert (=> b!216372 m!333667))

(declare-fun m!333669 () Bool)

(assert (=> b!216368 m!333669))

(assert (=> d!73151 m!332537))

(declare-fun m!333671 () Bool)

(assert (=> d!73151 m!333671))

(declare-fun m!333673 () Bool)

(assert (=> d!73151 m!333673))

(assert (=> d!73151 m!332153))

(declare-fun m!333675 () Bool)

(assert (=> d!73151 m!333675))

(declare-fun m!333677 () Bool)

(assert (=> d!73151 m!333677))

(declare-fun m!333679 () Bool)

(assert (=> d!73151 m!333679))

(declare-fun m!333681 () Bool)

(assert (=> d!73151 m!333681))

(declare-fun m!333683 () Bool)

(assert (=> d!73151 m!333683))

(assert (=> d!73151 m!332163))

(declare-fun m!333685 () Bool)

(assert (=> d!73151 m!333685))

(assert (=> b!216369 m!331795))

(declare-fun m!333687 () Bool)

(assert (=> b!216369 m!333687))

(declare-fun m!333689 () Bool)

(assert (=> b!216369 m!333689))

(assert (=> b!215885 d!73151))

(assert (=> b!215885 d!72643))

(declare-fun d!73153 () Bool)

(assert (=> d!73153 (validate_offset_bits!1 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!341282)))) ((_ sign_extend 32) (currentByte!9769 (_2!9892 lt!340324))) ((_ sign_extend 32) (currentBit!9764 (_2!9892 lt!340324))) lt!341264)))

(declare-fun lt!342220 () Unit!15296)

(assert (=> d!73153 (= lt!342220 (choose!9 (_2!9892 lt!340324) (buf!5191 (_2!9892 lt!341282)) lt!341264 (BitStream!8421 (buf!5191 (_2!9892 lt!341282)) (currentByte!9769 (_2!9892 lt!340324)) (currentBit!9764 (_2!9892 lt!340324)))))))

(assert (=> d!73153 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9892 lt!340324) (buf!5191 (_2!9892 lt!341282)) lt!341264) lt!342220)))

(declare-fun bs!17899 () Bool)

(assert (= bs!17899 d!73153))

(assert (=> bs!17899 m!332529))

(declare-fun m!333691 () Bool)

(assert (=> bs!17899 m!333691))

(assert (=> b!215885 d!73153))

(declare-fun d!73155 () Bool)

(assert (=> d!73155 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!341282)))) ((_ sign_extend 32) (currentByte!9769 (_2!9892 lt!340324))) ((_ sign_extend 32) (currentBit!9764 (_2!9892 lt!340324))) lt!341264) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!341282)))) ((_ sign_extend 32) (currentByte!9769 (_2!9892 lt!340324))) ((_ sign_extend 32) (currentBit!9764 (_2!9892 lt!340324)))) lt!341264))))

(declare-fun bs!17900 () Bool)

(assert (= bs!17900 d!73155))

(declare-fun m!333693 () Bool)

(assert (=> bs!17900 m!333693))

(assert (=> b!215885 d!73155))

(declare-fun b!216373 () Bool)

(declare-fun res!182030 () Bool)

(declare-fun e!147171 () Bool)

(assert (=> b!216373 (=> (not res!182030) (not e!147171))))

(declare-fun lt!342223 () tuple2!18488)

(assert (=> b!216373 (= res!182030 (= (bvand (_1!9899 lt!342223) (onesLSBLong!0 nBits!348)) (_1!9899 lt!342223)))))

(declare-fun b!216374 () Bool)

(declare-fun e!147172 () Bool)

(assert (=> b!216374 (= e!147171 e!147172)))

(declare-fun res!182027 () Bool)

(assert (=> b!216374 (=> res!182027 e!147172)))

(assert (=> b!216374 (= res!182027 (not (bvslt (bvadd #b00000000000000000000000000000001 i!590) nBits!348)))))

(declare-fun b!216375 () Bool)

(declare-fun e!147173 () tuple2!18488)

(declare-fun lt!342221 () tuple2!18488)

(assert (=> b!216375 (= e!147173 (tuple2!18489 (_1!9899 lt!342221) (_2!9899 lt!342221)))))

(declare-fun lt!342222 () tuple2!18486)

(assert (=> b!216375 (= lt!342222 (readBit!0 (_1!9895 lt!340310)))))

(assert (=> b!216375 (= lt!342221 (readNBitsLSBFirstsLoop!0 (_2!9898 lt!342222) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!340322 (ite (_1!9898 lt!342222) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!216376 () Bool)

(assert (=> b!216376 (= e!147173 (tuple2!18489 lt!340322 (_1!9895 lt!340310)))))

(declare-fun b!216377 () Bool)

(declare-fun lt!342226 () (_ BitVec 64))

(assert (=> b!216377 (= e!147172 (= (= (bvand (bvlshr (_1!9899 lt!342223) lt!342226) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!9893 (readBitPure!0 (_1!9895 lt!340310)))))))

(assert (=> b!216377 (and (bvsge lt!342226 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!342226 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!216377 (= lt!342226 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun d!73157 () Bool)

(assert (=> d!73157 e!147171))

(declare-fun res!182026 () Bool)

(assert (=> d!73157 (=> (not res!182026) (not e!147171))))

(assert (=> d!73157 (= res!182026 (= (buf!5191 (_2!9899 lt!342223)) (buf!5191 (_1!9895 lt!340310))))))

(assert (=> d!73157 (= lt!342223 e!147173)))

(declare-fun c!10573 () Bool)

(assert (=> d!73157 (= c!10573 (= nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(assert (=> d!73157 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!590)) (bvsle (bvadd #b00000000000000000000000000000001 i!590) nBits!348) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!73157 (= (readNBitsLSBFirstsLoop!0 (_1!9895 lt!340310) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!340322) lt!342223)))

(declare-fun b!216378 () Bool)

(declare-fun res!182028 () Bool)

(assert (=> b!216378 (=> (not res!182028) (not e!147171))))

(declare-fun lt!342225 () (_ BitVec 64))

(declare-fun lt!342224 () (_ BitVec 64))

(assert (=> b!216378 (= res!182028 (= (bitIndex!0 (size!4656 (buf!5191 (_2!9899 lt!342223))) (currentByte!9769 (_2!9899 lt!342223)) (currentBit!9764 (_2!9899 lt!342223))) (bvadd lt!342225 lt!342224)))))

(assert (=> b!216378 (or (not (= (bvand lt!342225 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!342224 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!342225 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!342225 lt!342224) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216378 (= lt!342224 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!216378 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!216378 (= lt!342225 (bitIndex!0 (size!4656 (buf!5191 (_1!9895 lt!340310))) (currentByte!9769 (_1!9895 lt!340310)) (currentBit!9764 (_1!9895 lt!340310))))))

(declare-fun b!216379 () Bool)

(declare-fun res!182029 () Bool)

(assert (=> b!216379 (=> (not res!182029) (not e!147171))))

(assert (=> b!216379 (= res!182029 (= (bvand (_1!9899 lt!342223) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))) (bvand lt!340322 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(assert (= (and d!73157 c!10573) b!216376))

(assert (= (and d!73157 (not c!10573)) b!216375))

(assert (= (and d!73157 res!182026) b!216378))

(assert (= (and b!216378 res!182028) b!216379))

(assert (= (and b!216379 res!182029) b!216373))

(assert (= (and b!216373 res!182030) b!216374))

(assert (= (and b!216374 (not res!182027)) b!216377))

(declare-fun m!333695 () Bool)

(assert (=> b!216378 m!333695))

(declare-fun m!333697 () Bool)

(assert (=> b!216378 m!333697))

(assert (=> b!216373 m!331793))

(declare-fun m!333699 () Bool)

(assert (=> b!216375 m!333699))

(declare-fun m!333701 () Bool)

(assert (=> b!216375 m!333701))

(declare-fun m!333703 () Bool)

(assert (=> b!216377 m!333703))

(assert (=> b!216379 m!332479))

(assert (=> d!72615 d!73157))

(assert (=> b!215668 d!72649))

(declare-fun d!73159 () Bool)

(assert (=> d!73159 (arrayBitRangesEq!0 (buf!5191 (_2!9892 lt!340308)) (buf!5191 thiss!1204) lt!340627 lt!340637)))

(declare-fun lt!342227 () Unit!15296)

(assert (=> d!73159 (= lt!342227 (choose!8 (buf!5191 thiss!1204) (buf!5191 (_2!9892 lt!340308)) lt!340627 lt!340637))))

(assert (=> d!73159 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!340627) (bvsle lt!340627 lt!340637))))

(assert (=> d!73159 (= (arrayBitRangesEqSymmetric!0 (buf!5191 thiss!1204) (buf!5191 (_2!9892 lt!340308)) lt!340627 lt!340637) lt!342227)))

(declare-fun bs!17901 () Bool)

(assert (= bs!17901 d!73159))

(assert (=> bs!17901 m!332081))

(declare-fun m!333705 () Bool)

(assert (=> bs!17901 m!333705))

(assert (=> b!215668 d!73159))

(declare-fun c!10574 () Bool)

(declare-fun call!3385 () Bool)

(declare-fun lt!342228 () (_ BitVec 32))

(declare-fun bm!3382 () Bool)

(declare-fun lt!342229 () (_ BitVec 32))

(declare-fun lt!342230 () tuple4!280)

(assert (=> bm!3382 (= call!3385 (byteRangesEq!0 (select (arr!5586 (buf!5191 (_2!9892 lt!340308))) (_3!656 lt!342230)) (select (arr!5586 (buf!5191 thiss!1204)) (_3!656 lt!342230)) lt!342229 (ite c!10574 lt!342228 #b00000000000000000000000000001000)))))

(declare-fun b!216380 () Bool)

(declare-fun e!147175 () Bool)

(assert (=> b!216380 (= e!147175 (arrayRangesEq!702 (buf!5191 (_2!9892 lt!340308)) (buf!5191 thiss!1204) (_1!9903 lt!342230) (_2!9903 lt!342230)))))

(declare-fun b!216381 () Bool)

(declare-fun e!147174 () Bool)

(declare-fun e!147179 () Bool)

(assert (=> b!216381 (= e!147174 e!147179)))

(declare-fun res!182031 () Bool)

(assert (=> b!216381 (= res!182031 call!3385)))

(assert (=> b!216381 (=> (not res!182031) (not e!147179))))

(declare-fun b!216382 () Bool)

(declare-fun e!147176 () Bool)

(assert (=> b!216382 (= e!147176 e!147174)))

(assert (=> b!216382 (= c!10574 (= (_3!656 lt!342230) (_4!140 lt!342230)))))

(declare-fun b!216383 () Bool)

(declare-fun e!147177 () Bool)

(assert (=> b!216383 (= e!147177 e!147176)))

(declare-fun res!182032 () Bool)

(assert (=> b!216383 (=> (not res!182032) (not e!147176))))

(assert (=> b!216383 (= res!182032 e!147175)))

(declare-fun res!182033 () Bool)

(assert (=> b!216383 (=> res!182033 e!147175)))

(assert (=> b!216383 (= res!182033 (bvsge (_1!9903 lt!342230) (_2!9903 lt!342230)))))

(assert (=> b!216383 (= lt!342228 ((_ extract 31 0) (bvsrem lt!340637 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216383 (= lt!342229 ((_ extract 31 0) (bvsrem lt!340627 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216383 (= lt!342230 (arrayBitIndices!0 lt!340627 lt!340637))))

(declare-fun d!73161 () Bool)

(declare-fun res!182035 () Bool)

(assert (=> d!73161 (=> res!182035 e!147177)))

(assert (=> d!73161 (= res!182035 (bvsge lt!340627 lt!340637))))

(assert (=> d!73161 (= (arrayBitRangesEq!0 (buf!5191 (_2!9892 lt!340308)) (buf!5191 thiss!1204) lt!340627 lt!340637) e!147177)))

(declare-fun b!216384 () Bool)

(assert (=> b!216384 (= e!147174 call!3385)))

(declare-fun e!147178 () Bool)

(declare-fun b!216385 () Bool)

(assert (=> b!216385 (= e!147178 (byteRangesEq!0 (select (arr!5586 (buf!5191 (_2!9892 lt!340308))) (_4!140 lt!342230)) (select (arr!5586 (buf!5191 thiss!1204)) (_4!140 lt!342230)) #b00000000000000000000000000000000 lt!342228))))

(declare-fun b!216386 () Bool)

(declare-fun res!182034 () Bool)

(assert (=> b!216386 (= res!182034 (= lt!342228 #b00000000000000000000000000000000))))

(assert (=> b!216386 (=> res!182034 e!147178)))

(assert (=> b!216386 (= e!147179 e!147178)))

(assert (= (and d!73161 (not res!182035)) b!216383))

(assert (= (and b!216383 (not res!182033)) b!216380))

(assert (= (and b!216383 res!182032) b!216382))

(assert (= (and b!216382 c!10574) b!216384))

(assert (= (and b!216382 (not c!10574)) b!216381))

(assert (= (and b!216381 res!182031) b!216386))

(assert (= (and b!216386 (not res!182034)) b!216385))

(assert (= (or b!216384 b!216381) bm!3382))

(declare-fun m!333707 () Bool)

(assert (=> bm!3382 m!333707))

(declare-fun m!333709 () Bool)

(assert (=> bm!3382 m!333709))

(assert (=> bm!3382 m!333707))

(assert (=> bm!3382 m!333709))

(declare-fun m!333711 () Bool)

(assert (=> bm!3382 m!333711))

(declare-fun m!333713 () Bool)

(assert (=> b!216380 m!333713))

(declare-fun m!333715 () Bool)

(assert (=> b!216383 m!333715))

(declare-fun m!333717 () Bool)

(assert (=> b!216385 m!333717))

(declare-fun m!333719 () Bool)

(assert (=> b!216385 m!333719))

(assert (=> b!216385 m!333717))

(assert (=> b!216385 m!333719))

(declare-fun m!333721 () Bool)

(assert (=> b!216385 m!333721))

(assert (=> b!215668 d!73161))

(declare-fun d!73163 () Bool)

(assert (=> d!73163 (= (remainingBits!0 ((_ sign_extend 32) (size!4656 (buf!5191 (_1!9893 lt!340328)))) ((_ sign_extend 32) (currentByte!9769 (_1!9893 lt!340328))) ((_ sign_extend 32) (currentBit!9764 (_1!9893 lt!340328)))) (bvsub (bvmul ((_ sign_extend 32) (size!4656 (buf!5191 (_1!9893 lt!340328)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9769 (_1!9893 lt!340328))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9764 (_1!9893 lt!340328))))))))

(assert (=> d!72605 d!73163))

(declare-fun d!73165 () Bool)

(assert (=> d!73165 (= (invariant!0 (currentBit!9764 (_1!9893 lt!340328)) (currentByte!9769 (_1!9893 lt!340328)) (size!4656 (buf!5191 (_1!9893 lt!340328)))) (and (bvsge (currentBit!9764 (_1!9893 lt!340328)) #b00000000000000000000000000000000) (bvslt (currentBit!9764 (_1!9893 lt!340328)) #b00000000000000000000000000001000) (bvsge (currentByte!9769 (_1!9893 lt!340328)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9769 (_1!9893 lt!340328)) (size!4656 (buf!5191 (_1!9893 lt!340328)))) (and (= (currentBit!9764 (_1!9893 lt!340328)) #b00000000000000000000000000000000) (= (currentByte!9769 (_1!9893 lt!340328)) (size!4656 (buf!5191 (_1!9893 lt!340328))))))))))

(assert (=> d!72605 d!73165))

(declare-fun b!216387 () Bool)

(declare-fun res!182040 () Bool)

(declare-fun e!147180 () Bool)

(assert (=> b!216387 (=> (not res!182040) (not e!147180))))

(declare-fun lt!342233 () tuple2!18488)

(assert (=> b!216387 (= res!182040 (= (bvand (_1!9899 lt!342233) (onesLSBLong!0 nBits!348)) (_1!9899 lt!342233)))))

(declare-fun b!216388 () Bool)

(declare-fun e!147181 () Bool)

(assert (=> b!216388 (= e!147180 e!147181)))

(declare-fun res!182037 () Bool)

(assert (=> b!216388 (=> res!182037 e!147181)))

(assert (=> b!216388 (= res!182037 (not (bvslt i!590 nBits!348)))))

(declare-fun b!216389 () Bool)

(declare-fun e!147182 () tuple2!18488)

(declare-fun lt!342231 () tuple2!18488)

(assert (=> b!216389 (= e!147182 (tuple2!18489 (_1!9899 lt!342231) (_2!9899 lt!342231)))))

(declare-fun lt!342232 () tuple2!18486)

(assert (=> b!216389 (= lt!342232 (readBit!0 (_1!9895 lt!340318)))))

(assert (=> b!216389 (= lt!342231 (readNBitsLSBFirstsLoop!0 (_2!9898 lt!342232) nBits!348 (bvadd i!590 #b00000000000000000000000000000001) (bvor lt!340307 (ite (_1!9898 lt!342232) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!216390 () Bool)

(assert (=> b!216390 (= e!147182 (tuple2!18489 lt!340307 (_1!9895 lt!340318)))))

(declare-fun b!216391 () Bool)

(declare-fun lt!342236 () (_ BitVec 64))

(assert (=> b!216391 (= e!147181 (= (= (bvand (bvlshr (_1!9899 lt!342233) lt!342236) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!9893 (readBitPure!0 (_1!9895 lt!340318)))))))

(assert (=> b!216391 (and (bvsge lt!342236 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!342236 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!216391 (= lt!342236 ((_ sign_extend 32) i!590))))

(declare-fun d!73167 () Bool)

(assert (=> d!73167 e!147180))

(declare-fun res!182036 () Bool)

(assert (=> d!73167 (=> (not res!182036) (not e!147180))))

(assert (=> d!73167 (= res!182036 (= (buf!5191 (_2!9899 lt!342233)) (buf!5191 (_1!9895 lt!340318))))))

(assert (=> d!73167 (= lt!342233 e!147182)))

(declare-fun c!10575 () Bool)

(assert (=> d!73167 (= c!10575 (= nBits!348 i!590))))

(assert (=> d!73167 (and (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!73167 (= (readNBitsLSBFirstsLoop!0 (_1!9895 lt!340318) nBits!348 i!590 lt!340307) lt!342233)))

(declare-fun b!216392 () Bool)

(declare-fun res!182038 () Bool)

(assert (=> b!216392 (=> (not res!182038) (not e!147180))))

(declare-fun lt!342234 () (_ BitVec 64))

(declare-fun lt!342235 () (_ BitVec 64))

(assert (=> b!216392 (= res!182038 (= (bitIndex!0 (size!4656 (buf!5191 (_2!9899 lt!342233))) (currentByte!9769 (_2!9899 lt!342233)) (currentBit!9764 (_2!9899 lt!342233))) (bvadd lt!342235 lt!342234)))))

(assert (=> b!216392 (or (not (= (bvand lt!342235 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!342234 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!342235 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!342235 lt!342234) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216392 (= lt!342234 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(assert (=> b!216392 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand i!590 #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 i!590) #b10000000000000000000000000000000)))))

(assert (=> b!216392 (= lt!342235 (bitIndex!0 (size!4656 (buf!5191 (_1!9895 lt!340318))) (currentByte!9769 (_1!9895 lt!340318)) (currentBit!9764 (_1!9895 lt!340318))))))

(declare-fun b!216393 () Bool)

(declare-fun res!182039 () Bool)

(assert (=> b!216393 (=> (not res!182039) (not e!147180))))

(assert (=> b!216393 (= res!182039 (= (bvand (_1!9899 lt!342233) (onesLSBLong!0 i!590)) (bvand lt!340307 (onesLSBLong!0 i!590))))))

(assert (= (and d!73167 c!10575) b!216390))

(assert (= (and d!73167 (not c!10575)) b!216389))

(assert (= (and d!73167 res!182036) b!216392))

(assert (= (and b!216392 res!182038) b!216393))

(assert (= (and b!216393 res!182039) b!216387))

(assert (= (and b!216387 res!182040) b!216388))

(assert (= (and b!216388 (not res!182037)) b!216391))

(declare-fun m!333723 () Bool)

(assert (=> b!216392 m!333723))

(assert (=> b!216392 m!332257))

(assert (=> b!216387 m!331793))

(assert (=> b!216389 m!332113))

(declare-fun m!333725 () Bool)

(assert (=> b!216389 m!333725))

(assert (=> b!216391 m!331819))

(assert (=> b!216393 m!331843))

(assert (=> d!72591 d!73167))

(declare-fun d!73169 () Bool)

(declare-fun res!182041 () Bool)

(declare-fun e!147184 () Bool)

(assert (=> d!73169 (=> (not res!182041) (not e!147184))))

(assert (=> d!73169 (= res!182041 (= (size!4656 (buf!5191 (_2!9892 lt!340324))) (size!4656 (buf!5191 (ite c!10532 (_2!9892 lt!340324) (_2!9892 lt!341237))))))))

(assert (=> d!73169 (= (isPrefixOf!0 (_2!9892 lt!340324) (ite c!10532 (_2!9892 lt!340324) (_2!9892 lt!341237))) e!147184)))

(declare-fun b!216394 () Bool)

(declare-fun res!182042 () Bool)

(assert (=> b!216394 (=> (not res!182042) (not e!147184))))

(assert (=> b!216394 (= res!182042 (bvsle (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!340324))) (currentByte!9769 (_2!9892 lt!340324)) (currentBit!9764 (_2!9892 lt!340324))) (bitIndex!0 (size!4656 (buf!5191 (ite c!10532 (_2!9892 lt!340324) (_2!9892 lt!341237)))) (currentByte!9769 (ite c!10532 (_2!9892 lt!340324) (_2!9892 lt!341237))) (currentBit!9764 (ite c!10532 (_2!9892 lt!340324) (_2!9892 lt!341237))))))))

(declare-fun b!216395 () Bool)

(declare-fun e!147183 () Bool)

(assert (=> b!216395 (= e!147184 e!147183)))

(declare-fun res!182043 () Bool)

(assert (=> b!216395 (=> res!182043 e!147183)))

(assert (=> b!216395 (= res!182043 (= (size!4656 (buf!5191 (_2!9892 lt!340324))) #b00000000000000000000000000000000))))

(declare-fun b!216396 () Bool)

(assert (=> b!216396 (= e!147183 (arrayBitRangesEq!0 (buf!5191 (_2!9892 lt!340324)) (buf!5191 (ite c!10532 (_2!9892 lt!340324) (_2!9892 lt!341237))) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!340324))) (currentByte!9769 (_2!9892 lt!340324)) (currentBit!9764 (_2!9892 lt!340324)))))))

(assert (= (and d!73169 res!182041) b!216394))

(assert (= (and b!216394 res!182042) b!216395))

(assert (= (and b!216395 (not res!182043)) b!216396))

(assert (=> b!216394 m!331795))

(declare-fun m!333727 () Bool)

(assert (=> b!216394 m!333727))

(assert (=> b!216396 m!331795))

(assert (=> b!216396 m!331795))

(declare-fun m!333729 () Bool)

(assert (=> b!216396 m!333729))

(assert (=> bm!3363 d!73169))

(assert (=> d!72595 d!72585))

(declare-fun d!73171 () Bool)

(assert (=> d!73171 (validate_offset_bits!1 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!340308)))) ((_ sign_extend 32) (currentByte!9769 thiss!1204)) ((_ sign_extend 32) (currentBit!9764 thiss!1204)) lt!340327)))

(assert (=> d!73171 true))

(declare-fun _$6!394 () Unit!15296)

(assert (=> d!73171 (= (choose!9 thiss!1204 (buf!5191 (_2!9892 lt!340308)) lt!340327 (BitStream!8421 (buf!5191 (_2!9892 lt!340308)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204))) _$6!394)))

(declare-fun bs!17902 () Bool)

(assert (= bs!17902 d!73171))

(assert (=> bs!17902 m!331821))

(assert (=> d!72595 d!73171))

(declare-fun d!73173 () Bool)

(declare-fun res!182044 () Bool)

(declare-fun e!147186 () Bool)

(assert (=> d!73173 (=> (not res!182044) (not e!147186))))

(assert (=> d!73173 (= res!182044 (= (size!4656 (buf!5191 (_2!9892 lt!340324))) (size!4656 (buf!5191 (_2!9892 lt!341282)))))))

(assert (=> d!73173 (= (isPrefixOf!0 (_2!9892 lt!340324) (_2!9892 lt!341282)) e!147186)))

(declare-fun b!216397 () Bool)

(declare-fun res!182045 () Bool)

(assert (=> b!216397 (=> (not res!182045) (not e!147186))))

(assert (=> b!216397 (= res!182045 (bvsle (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!340324))) (currentByte!9769 (_2!9892 lt!340324)) (currentBit!9764 (_2!9892 lt!340324))) (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!341282))) (currentByte!9769 (_2!9892 lt!341282)) (currentBit!9764 (_2!9892 lt!341282)))))))

(declare-fun b!216398 () Bool)

(declare-fun e!147185 () Bool)

(assert (=> b!216398 (= e!147186 e!147185)))

(declare-fun res!182046 () Bool)

(assert (=> b!216398 (=> res!182046 e!147185)))

(assert (=> b!216398 (= res!182046 (= (size!4656 (buf!5191 (_2!9892 lt!340324))) #b00000000000000000000000000000000))))

(declare-fun b!216399 () Bool)

(assert (=> b!216399 (= e!147185 (arrayBitRangesEq!0 (buf!5191 (_2!9892 lt!340324)) (buf!5191 (_2!9892 lt!341282)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!340324))) (currentByte!9769 (_2!9892 lt!340324)) (currentBit!9764 (_2!9892 lt!340324)))))))

(assert (= (and d!73173 res!182044) b!216397))

(assert (= (and b!216397 res!182045) b!216398))

(assert (= (and b!216398 (not res!182046)) b!216399))

(assert (=> b!216397 m!331795))

(assert (=> b!216397 m!332539))

(assert (=> b!216399 m!331795))

(assert (=> b!216399 m!331795))

(declare-fun m!333731 () Bool)

(assert (=> b!216399 m!333731))

(assert (=> b!215880 d!73173))

(declare-fun d!73175 () Bool)

(assert (=> d!73175 (= (remainingBits!0 ((_ sign_extend 32) (size!4656 (buf!5191 (_1!9894 lt!340314)))) ((_ sign_extend 32) (currentByte!9769 (_1!9894 lt!340314))) ((_ sign_extend 32) (currentBit!9764 (_1!9894 lt!340314)))) (bvsub (bvmul ((_ sign_extend 32) (size!4656 (buf!5191 (_1!9894 lt!340314)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9769 (_1!9894 lt!340314))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9764 (_1!9894 lt!340314))))))))

(assert (=> d!72639 d!73175))

(declare-fun d!73177 () Bool)

(assert (=> d!73177 (= (invariant!0 (currentBit!9764 (_1!9894 lt!340314)) (currentByte!9769 (_1!9894 lt!340314)) (size!4656 (buf!5191 (_1!9894 lt!340314)))) (and (bvsge (currentBit!9764 (_1!9894 lt!340314)) #b00000000000000000000000000000000) (bvslt (currentBit!9764 (_1!9894 lt!340314)) #b00000000000000000000000000001000) (bvsge (currentByte!9769 (_1!9894 lt!340314)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9769 (_1!9894 lt!340314)) (size!4656 (buf!5191 (_1!9894 lt!340314)))) (and (= (currentBit!9764 (_1!9894 lt!340314)) #b00000000000000000000000000000000) (= (currentByte!9769 (_1!9894 lt!340314)) (size!4656 (buf!5191 (_1!9894 lt!340314))))))))))

(assert (=> d!72639 d!73177))

(assert (=> d!72613 d!72593))

(declare-fun d!73179 () Bool)

(assert (=> d!73179 (validate_offset_bits!1 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!340308)))) ((_ sign_extend 32) (currentByte!9769 (_2!9892 lt!340324))) ((_ sign_extend 32) (currentBit!9764 (_2!9892 lt!340324))) lt!340315)))

(assert (=> d!73179 true))

(declare-fun _$6!395 () Unit!15296)

(assert (=> d!73179 (= (choose!9 (_2!9892 lt!340324) (buf!5191 (_2!9892 lt!340308)) lt!340315 (BitStream!8421 (buf!5191 (_2!9892 lt!340308)) (currentByte!9769 (_2!9892 lt!340324)) (currentBit!9764 (_2!9892 lt!340324)))) _$6!395)))

(declare-fun bs!17903 () Bool)

(assert (= bs!17903 d!73179))

(assert (=> bs!17903 m!331835))

(assert (=> d!72613 d!73179))

(declare-fun d!73181 () Bool)

(declare-fun e!147187 () Bool)

(assert (=> d!73181 e!147187))

(declare-fun res!182047 () Bool)

(assert (=> d!73181 (=> (not res!182047) (not e!147187))))

(assert (=> d!73181 (= res!182047 (= (buf!5191 (_2!9892 (increaseBitIndex!0 (_1!9895 lt!340318)))) (buf!5191 (_1!9895 lt!340318))))))

(declare-fun lt!342237 () Bool)

(assert (=> d!73181 (= lt!342237 (not (= (bvand ((_ sign_extend 24) (select (arr!5586 (buf!5191 (_1!9895 lt!340318))) (currentByte!9769 (_1!9895 lt!340318)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9764 (_1!9895 lt!340318))))) #b00000000000000000000000000000000)))))

(declare-fun lt!342239 () tuple2!18486)

(assert (=> d!73181 (= lt!342239 (tuple2!18487 (not (= (bvand ((_ sign_extend 24) (select (arr!5586 (buf!5191 (_1!9895 lt!340318))) (currentByte!9769 (_1!9895 lt!340318)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9764 (_1!9895 lt!340318))))) #b00000000000000000000000000000000)) (_2!9892 (increaseBitIndex!0 (_1!9895 lt!340318)))))))

(assert (=> d!73181 (validate_offset_bit!0 ((_ sign_extend 32) (size!4656 (buf!5191 (_1!9895 lt!340318)))) ((_ sign_extend 32) (currentByte!9769 (_1!9895 lt!340318))) ((_ sign_extend 32) (currentBit!9764 (_1!9895 lt!340318))))))

(assert (=> d!73181 (= (readBit!0 (_1!9895 lt!340318)) lt!342239)))

(declare-fun lt!342238 () (_ BitVec 64))

(declare-fun lt!342241 () (_ BitVec 64))

(declare-fun b!216400 () Bool)

(assert (=> b!216400 (= e!147187 (= (bitIndex!0 (size!4656 (buf!5191 (_2!9892 (increaseBitIndex!0 (_1!9895 lt!340318))))) (currentByte!9769 (_2!9892 (increaseBitIndex!0 (_1!9895 lt!340318)))) (currentBit!9764 (_2!9892 (increaseBitIndex!0 (_1!9895 lt!340318))))) (bvadd lt!342238 lt!342241)))))

(assert (=> b!216400 (or (not (= (bvand lt!342238 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!342241 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!342238 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!342238 lt!342241) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216400 (= lt!342241 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!216400 (= lt!342238 (bitIndex!0 (size!4656 (buf!5191 (_1!9895 lt!340318))) (currentByte!9769 (_1!9895 lt!340318)) (currentBit!9764 (_1!9895 lt!340318))))))

(declare-fun lt!342242 () Bool)

(assert (=> b!216400 (= lt!342242 (not (= (bvand ((_ sign_extend 24) (select (arr!5586 (buf!5191 (_1!9895 lt!340318))) (currentByte!9769 (_1!9895 lt!340318)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9764 (_1!9895 lt!340318))))) #b00000000000000000000000000000000)))))

(declare-fun lt!342240 () Bool)

(assert (=> b!216400 (= lt!342240 (not (= (bvand ((_ sign_extend 24) (select (arr!5586 (buf!5191 (_1!9895 lt!340318))) (currentByte!9769 (_1!9895 lt!340318)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9764 (_1!9895 lt!340318))))) #b00000000000000000000000000000000)))))

(declare-fun lt!342243 () Bool)

(assert (=> b!216400 (= lt!342243 (not (= (bvand ((_ sign_extend 24) (select (arr!5586 (buf!5191 (_1!9895 lt!340318))) (currentByte!9769 (_1!9895 lt!340318)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9764 (_1!9895 lt!340318))))) #b00000000000000000000000000000000)))))

(assert (= (and d!73181 res!182047) b!216400))

(declare-fun m!333733 () Bool)

(assert (=> d!73181 m!333733))

(declare-fun m!333735 () Bool)

(assert (=> d!73181 m!333735))

(declare-fun m!333737 () Bool)

(assert (=> d!73181 m!333737))

(declare-fun m!333739 () Bool)

(assert (=> d!73181 m!333739))

(assert (=> b!216400 m!333737))

(assert (=> b!216400 m!333735))

(assert (=> b!216400 m!332257))

(declare-fun m!333741 () Bool)

(assert (=> b!216400 m!333741))

(assert (=> b!216400 m!333733))

(assert (=> d!72603 d!73181))

(declare-fun d!73183 () Bool)

(declare-fun e!147188 () Bool)

(assert (=> d!73183 e!147188))

(declare-fun res!182048 () Bool)

(assert (=> d!73183 (=> (not res!182048) (not e!147188))))

(assert (=> d!73183 (= res!182048 (= (buf!5191 (_2!9892 (increaseBitIndex!0 (BitStream!8421 (buf!5191 (_2!9892 lt!340308)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204))))) (buf!5191 (BitStream!8421 (buf!5191 (_2!9892 lt!340308)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204)))))))

(declare-fun lt!342244 () Bool)

(assert (=> d!73183 (= lt!342244 (not (= (bvand ((_ sign_extend 24) (select (arr!5586 (buf!5191 (BitStream!8421 (buf!5191 (_2!9892 lt!340308)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204)))) (currentByte!9769 (BitStream!8421 (buf!5191 (_2!9892 lt!340308)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9764 (BitStream!8421 (buf!5191 (_2!9892 lt!340308)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!342246 () tuple2!18486)

(assert (=> d!73183 (= lt!342246 (tuple2!18487 (not (= (bvand ((_ sign_extend 24) (select (arr!5586 (buf!5191 (BitStream!8421 (buf!5191 (_2!9892 lt!340308)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204)))) (currentByte!9769 (BitStream!8421 (buf!5191 (_2!9892 lt!340308)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9764 (BitStream!8421 (buf!5191 (_2!9892 lt!340308)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204)))))) #b00000000000000000000000000000000)) (_2!9892 (increaseBitIndex!0 (BitStream!8421 (buf!5191 (_2!9892 lt!340308)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204))))))))

(assert (=> d!73183 (validate_offset_bit!0 ((_ sign_extend 32) (size!4656 (buf!5191 (BitStream!8421 (buf!5191 (_2!9892 lt!340308)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204))))) ((_ sign_extend 32) (currentByte!9769 (BitStream!8421 (buf!5191 (_2!9892 lt!340308)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204)))) ((_ sign_extend 32) (currentBit!9764 (BitStream!8421 (buf!5191 (_2!9892 lt!340308)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204)))))))

(assert (=> d!73183 (= (readBit!0 (BitStream!8421 (buf!5191 (_2!9892 lt!340308)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204))) lt!342246)))

(declare-fun lt!342245 () (_ BitVec 64))

(declare-fun lt!342248 () (_ BitVec 64))

(declare-fun b!216401 () Bool)

(assert (=> b!216401 (= e!147188 (= (bitIndex!0 (size!4656 (buf!5191 (_2!9892 (increaseBitIndex!0 (BitStream!8421 (buf!5191 (_2!9892 lt!340308)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204)))))) (currentByte!9769 (_2!9892 (increaseBitIndex!0 (BitStream!8421 (buf!5191 (_2!9892 lt!340308)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204))))) (currentBit!9764 (_2!9892 (increaseBitIndex!0 (BitStream!8421 (buf!5191 (_2!9892 lt!340308)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204)))))) (bvadd lt!342245 lt!342248)))))

(assert (=> b!216401 (or (not (= (bvand lt!342245 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!342248 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!342245 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!342245 lt!342248) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216401 (= lt!342248 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!216401 (= lt!342245 (bitIndex!0 (size!4656 (buf!5191 (BitStream!8421 (buf!5191 (_2!9892 lt!340308)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204)))) (currentByte!9769 (BitStream!8421 (buf!5191 (_2!9892 lt!340308)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204))) (currentBit!9764 (BitStream!8421 (buf!5191 (_2!9892 lt!340308)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204)))))))

(declare-fun lt!342249 () Bool)

(assert (=> b!216401 (= lt!342249 (not (= (bvand ((_ sign_extend 24) (select (arr!5586 (buf!5191 (BitStream!8421 (buf!5191 (_2!9892 lt!340308)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204)))) (currentByte!9769 (BitStream!8421 (buf!5191 (_2!9892 lt!340308)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9764 (BitStream!8421 (buf!5191 (_2!9892 lt!340308)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!342247 () Bool)

(assert (=> b!216401 (= lt!342247 (not (= (bvand ((_ sign_extend 24) (select (arr!5586 (buf!5191 (BitStream!8421 (buf!5191 (_2!9892 lt!340308)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204)))) (currentByte!9769 (BitStream!8421 (buf!5191 (_2!9892 lt!340308)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9764 (BitStream!8421 (buf!5191 (_2!9892 lt!340308)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!342250 () Bool)

(assert (=> b!216401 (= lt!342250 (not (= (bvand ((_ sign_extend 24) (select (arr!5586 (buf!5191 (BitStream!8421 (buf!5191 (_2!9892 lt!340308)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204)))) (currentByte!9769 (BitStream!8421 (buf!5191 (_2!9892 lt!340308)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9764 (BitStream!8421 (buf!5191 (_2!9892 lt!340308)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!73183 res!182048) b!216401))

(declare-fun m!333743 () Bool)

(assert (=> d!73183 m!333743))

(declare-fun m!333745 () Bool)

(assert (=> d!73183 m!333745))

(declare-fun m!333747 () Bool)

(assert (=> d!73183 m!333747))

(declare-fun m!333749 () Bool)

(assert (=> d!73183 m!333749))

(assert (=> b!216401 m!333747))

(assert (=> b!216401 m!333745))

(declare-fun m!333751 () Bool)

(assert (=> b!216401 m!333751))

(declare-fun m!333753 () Bool)

(assert (=> b!216401 m!333753))

(assert (=> b!216401 m!333743))

(assert (=> d!72589 d!73183))

(declare-fun d!73185 () Bool)

(assert (=> d!73185 (= (remainingBits!0 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!340324)))) ((_ sign_extend 32) (currentByte!9769 (_2!9892 lt!340324))) ((_ sign_extend 32) (currentBit!9764 (_2!9892 lt!340324)))) (bvsub (bvmul ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!340324)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9769 (_2!9892 lt!340324))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9764 (_2!9892 lt!340324))))))))

(assert (=> d!72647 d!73185))

(assert (=> d!72647 d!73025))

(declare-fun d!73187 () Bool)

(assert (=> d!73187 (= (remainingBits!0 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9895 lt!340318)))) ((_ sign_extend 32) (currentByte!9769 (_2!9895 lt!340318))) ((_ sign_extend 32) (currentBit!9764 (_2!9895 lt!340318)))) (bvsub (bvmul ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9895 lt!340318)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9769 (_2!9895 lt!340318))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9764 (_2!9895 lt!340318))))))))

(assert (=> d!72641 d!73187))

(declare-fun d!73189 () Bool)

(assert (=> d!73189 (= (invariant!0 (currentBit!9764 (_2!9895 lt!340318)) (currentByte!9769 (_2!9895 lt!340318)) (size!4656 (buf!5191 (_2!9895 lt!340318)))) (and (bvsge (currentBit!9764 (_2!9895 lt!340318)) #b00000000000000000000000000000000) (bvslt (currentBit!9764 (_2!9895 lt!340318)) #b00000000000000000000000000001000) (bvsge (currentByte!9769 (_2!9895 lt!340318)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9769 (_2!9895 lt!340318)) (size!4656 (buf!5191 (_2!9895 lt!340318)))) (and (= (currentBit!9764 (_2!9895 lt!340318)) #b00000000000000000000000000000000) (= (currentByte!9769 (_2!9895 lt!340318)) (size!4656 (buf!5191 (_2!9895 lt!340318))))))))))

(assert (=> d!72641 d!73189))

(declare-fun d!73191 () Bool)

(declare-fun lt!342251 () tuple2!18486)

(assert (=> d!73191 (= lt!342251 (readBit!0 (readerFrom!0 (_2!9892 lt!340815) (currentBit!9764 thiss!1204) (currentByte!9769 thiss!1204))))))

(assert (=> d!73191 (= (readBitPure!0 (readerFrom!0 (_2!9892 lt!340815) (currentBit!9764 thiss!1204) (currentByte!9769 thiss!1204))) (tuple2!18477 (_2!9898 lt!342251) (_1!9898 lt!342251)))))

(declare-fun bs!17904 () Bool)

(assert (= bs!17904 d!73191))

(assert (=> bs!17904 m!332203))

(declare-fun m!333755 () Bool)

(assert (=> bs!17904 m!333755))

(assert (=> b!215748 d!73191))

(declare-fun d!73193 () Bool)

(declare-fun e!147189 () Bool)

(assert (=> d!73193 e!147189))

(declare-fun res!182049 () Bool)

(assert (=> d!73193 (=> (not res!182049) (not e!147189))))

(assert (=> d!73193 (= res!182049 (invariant!0 (currentBit!9764 (_2!9892 lt!340815)) (currentByte!9769 (_2!9892 lt!340815)) (size!4656 (buf!5191 (_2!9892 lt!340815)))))))

(assert (=> d!73193 (= (readerFrom!0 (_2!9892 lt!340815) (currentBit!9764 thiss!1204) (currentByte!9769 thiss!1204)) (BitStream!8421 (buf!5191 (_2!9892 lt!340815)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204)))))

(declare-fun b!216402 () Bool)

(assert (=> b!216402 (= e!147189 (invariant!0 (currentBit!9764 thiss!1204) (currentByte!9769 thiss!1204) (size!4656 (buf!5191 (_2!9892 lt!340815)))))))

(assert (= (and d!73193 res!182049) b!216402))

(assert (=> d!73193 m!333555))

(declare-fun m!333757 () Bool)

(assert (=> b!216402 m!333757))

(assert (=> b!215748 d!73193))

(declare-fun d!73195 () Bool)

(assert (=> d!73195 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-fun lt!342252 () Unit!15296)

(assert (=> d!73195 (= lt!342252 (choose!11 thiss!1204))))

(assert (=> d!73195 (= (lemmaIsPrefixRefl!0 thiss!1204) lt!342252)))

(declare-fun bs!17905 () Bool)

(assert (= bs!17905 d!73195))

(assert (=> bs!17905 m!332075))

(declare-fun m!333759 () Bool)

(assert (=> bs!17905 m!333759))

(assert (=> d!72563 d!73195))

(declare-fun d!73197 () Bool)

(declare-fun res!182050 () Bool)

(declare-fun e!147191 () Bool)

(assert (=> d!73197 (=> (not res!182050) (not e!147191))))

(assert (=> d!73197 (= res!182050 (= (size!4656 (buf!5191 lt!340643)) (size!4656 (buf!5191 lt!340643))))))

(assert (=> d!73197 (= (isPrefixOf!0 lt!340643 lt!340643) e!147191)))

(declare-fun b!216403 () Bool)

(declare-fun res!182051 () Bool)

(assert (=> b!216403 (=> (not res!182051) (not e!147191))))

(assert (=> b!216403 (= res!182051 (bvsle (bitIndex!0 (size!4656 (buf!5191 lt!340643)) (currentByte!9769 lt!340643) (currentBit!9764 lt!340643)) (bitIndex!0 (size!4656 (buf!5191 lt!340643)) (currentByte!9769 lt!340643) (currentBit!9764 lt!340643))))))

(declare-fun b!216404 () Bool)

(declare-fun e!147190 () Bool)

(assert (=> b!216404 (= e!147191 e!147190)))

(declare-fun res!182052 () Bool)

(assert (=> b!216404 (=> res!182052 e!147190)))

(assert (=> b!216404 (= res!182052 (= (size!4656 (buf!5191 lt!340643)) #b00000000000000000000000000000000))))

(declare-fun b!216405 () Bool)

(assert (=> b!216405 (= e!147190 (arrayBitRangesEq!0 (buf!5191 lt!340643) (buf!5191 lt!340643) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4656 (buf!5191 lt!340643)) (currentByte!9769 lt!340643) (currentBit!9764 lt!340643))))))

(assert (= (and d!73197 res!182050) b!216403))

(assert (= (and b!216403 res!182051) b!216404))

(assert (= (and b!216404 (not res!182052)) b!216405))

(declare-fun m!333761 () Bool)

(assert (=> b!216403 m!333761))

(assert (=> b!216403 m!333761))

(assert (=> b!216405 m!333761))

(assert (=> b!216405 m!333761))

(declare-fun m!333763 () Bool)

(assert (=> b!216405 m!333763))

(assert (=> d!72563 d!73197))

(assert (=> d!72563 d!72673))

(declare-fun d!73199 () Bool)

(declare-fun res!182053 () Bool)

(declare-fun e!147193 () Bool)

(assert (=> d!73199 (=> (not res!182053) (not e!147193))))

(assert (=> d!73199 (= res!182053 (= (size!4656 (buf!5191 lt!340643)) (size!4656 (buf!5191 (_2!9892 lt!340308)))))))

(assert (=> d!73199 (= (isPrefixOf!0 lt!340643 (_2!9892 lt!340308)) e!147193)))

(declare-fun b!216406 () Bool)

(declare-fun res!182054 () Bool)

(assert (=> b!216406 (=> (not res!182054) (not e!147193))))

(assert (=> b!216406 (= res!182054 (bvsle (bitIndex!0 (size!4656 (buf!5191 lt!340643)) (currentByte!9769 lt!340643) (currentBit!9764 lt!340643)) (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!340308))) (currentByte!9769 (_2!9892 lt!340308)) (currentBit!9764 (_2!9892 lt!340308)))))))

(declare-fun b!216407 () Bool)

(declare-fun e!147192 () Bool)

(assert (=> b!216407 (= e!147193 e!147192)))

(declare-fun res!182055 () Bool)

(assert (=> b!216407 (=> res!182055 e!147192)))

(assert (=> b!216407 (= res!182055 (= (size!4656 (buf!5191 lt!340643)) #b00000000000000000000000000000000))))

(declare-fun b!216408 () Bool)

(assert (=> b!216408 (= e!147192 (arrayBitRangesEq!0 (buf!5191 lt!340643) (buf!5191 (_2!9892 lt!340308)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4656 (buf!5191 lt!340643)) (currentByte!9769 lt!340643) (currentBit!9764 lt!340643))))))

(assert (= (and d!73199 res!182053) b!216406))

(assert (= (and b!216406 res!182054) b!216407))

(assert (= (and b!216407 (not res!182055)) b!216408))

(assert (=> b!216406 m!333761))

(assert (=> b!216406 m!331803))

(assert (=> b!216408 m!333761))

(assert (=> b!216408 m!333761))

(declare-fun m!333765 () Bool)

(assert (=> b!216408 m!333765))

(assert (=> d!72563 d!73199))

(declare-fun d!73201 () Bool)

(assert (=> d!73201 (isPrefixOf!0 lt!340643 lt!340643)))

(declare-fun lt!342253 () Unit!15296)

(assert (=> d!73201 (= lt!342253 (choose!11 lt!340643))))

(assert (=> d!73201 (= (lemmaIsPrefixRefl!0 lt!340643) lt!342253)))

(declare-fun bs!17906 () Bool)

(assert (= bs!17906 d!73201))

(assert (=> bs!17906 m!332069))

(declare-fun m!333767 () Bool)

(assert (=> bs!17906 m!333767))

(assert (=> d!72563 d!73201))

(assert (=> d!72563 d!73021))

(declare-fun d!73203 () Bool)

(declare-fun res!182056 () Bool)

(declare-fun e!147195 () Bool)

(assert (=> d!73203 (=> (not res!182056) (not e!147195))))

(assert (=> d!73203 (= res!182056 (= (size!4656 (buf!5191 (_1!9895 lt!340630))) (size!4656 (buf!5191 (_2!9895 lt!340630)))))))

(assert (=> d!73203 (= (isPrefixOf!0 (_1!9895 lt!340630) (_2!9895 lt!340630)) e!147195)))

(declare-fun b!216409 () Bool)

(declare-fun res!182057 () Bool)

(assert (=> b!216409 (=> (not res!182057) (not e!147195))))

(assert (=> b!216409 (= res!182057 (bvsle (bitIndex!0 (size!4656 (buf!5191 (_1!9895 lt!340630))) (currentByte!9769 (_1!9895 lt!340630)) (currentBit!9764 (_1!9895 lt!340630))) (bitIndex!0 (size!4656 (buf!5191 (_2!9895 lt!340630))) (currentByte!9769 (_2!9895 lt!340630)) (currentBit!9764 (_2!9895 lt!340630)))))))

(declare-fun b!216410 () Bool)

(declare-fun e!147194 () Bool)

(assert (=> b!216410 (= e!147195 e!147194)))

(declare-fun res!182058 () Bool)

(assert (=> b!216410 (=> res!182058 e!147194)))

(assert (=> b!216410 (= res!182058 (= (size!4656 (buf!5191 (_1!9895 lt!340630))) #b00000000000000000000000000000000))))

(declare-fun b!216411 () Bool)

(assert (=> b!216411 (= e!147194 (arrayBitRangesEq!0 (buf!5191 (_1!9895 lt!340630)) (buf!5191 (_2!9895 lt!340630)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4656 (buf!5191 (_1!9895 lt!340630))) (currentByte!9769 (_1!9895 lt!340630)) (currentBit!9764 (_1!9895 lt!340630)))))))

(assert (= (and d!73203 res!182056) b!216409))

(assert (= (and b!216409 res!182057) b!216410))

(assert (= (and b!216410 (not res!182058)) b!216411))

(declare-fun m!333769 () Bool)

(assert (=> b!216409 m!333769))

(assert (=> b!216409 m!333255))

(assert (=> b!216411 m!333769))

(assert (=> b!216411 m!333769))

(declare-fun m!333771 () Bool)

(assert (=> b!216411 m!333771))

(assert (=> d!72563 d!73203))

(declare-fun d!73205 () Bool)

(declare-fun res!182059 () Bool)

(declare-fun e!147197 () Bool)

(assert (=> d!73205 (=> (not res!182059) (not e!147197))))

(assert (=> d!73205 (= res!182059 (= (size!4656 (buf!5191 thiss!1204)) (size!4656 (buf!5191 thiss!1204))))))

(assert (=> d!73205 (= (isPrefixOf!0 thiss!1204 thiss!1204) e!147197)))

(declare-fun b!216412 () Bool)

(declare-fun res!182060 () Bool)

(assert (=> b!216412 (=> (not res!182060) (not e!147197))))

(assert (=> b!216412 (= res!182060 (bvsle (bitIndex!0 (size!4656 (buf!5191 thiss!1204)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204)) (bitIndex!0 (size!4656 (buf!5191 thiss!1204)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204))))))

(declare-fun b!216413 () Bool)

(declare-fun e!147196 () Bool)

(assert (=> b!216413 (= e!147197 e!147196)))

(declare-fun res!182061 () Bool)

(assert (=> b!216413 (=> res!182061 e!147196)))

(assert (=> b!216413 (= res!182061 (= (size!4656 (buf!5191 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!216414 () Bool)

(assert (=> b!216414 (= e!147196 (arrayBitRangesEq!0 (buf!5191 thiss!1204) (buf!5191 thiss!1204) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4656 (buf!5191 thiss!1204)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204))))))

(assert (= (and d!73205 res!182059) b!216412))

(assert (= (and b!216412 res!182060) b!216413))

(assert (= (and b!216413 (not res!182061)) b!216414))

(assert (=> b!216412 m!331797))

(assert (=> b!216412 m!331797))

(assert (=> b!216414 m!331797))

(assert (=> b!216414 m!331797))

(declare-fun m!333773 () Bool)

(assert (=> b!216414 m!333773))

(assert (=> d!72563 d!73205))

(declare-fun d!73207 () Bool)

(assert (=> d!73207 (isPrefixOf!0 lt!340643 (_2!9892 lt!340308))))

(declare-fun lt!342254 () Unit!15296)

(assert (=> d!73207 (= lt!342254 (choose!30 lt!340643 (_2!9892 lt!340308) (_2!9892 lt!340308)))))

(assert (=> d!73207 (isPrefixOf!0 lt!340643 (_2!9892 lt!340308))))

(assert (=> d!73207 (= (lemmaIsPrefixTransitive!0 lt!340643 (_2!9892 lt!340308) (_2!9892 lt!340308)) lt!342254)))

(declare-fun bs!17907 () Bool)

(assert (= bs!17907 d!73207))

(assert (=> bs!17907 m!332067))

(declare-fun m!333775 () Bool)

(assert (=> bs!17907 m!333775))

(assert (=> bs!17907 m!332067))

(assert (=> d!72563 d!73207))

(assert (=> d!72563 d!73017))

(declare-fun d!73209 () Bool)

(assert (=> d!73209 (isPrefixOf!0 lt!340643 (_2!9892 lt!340308))))

(declare-fun lt!342255 () Unit!15296)

(assert (=> d!73209 (= lt!342255 (choose!30 lt!340643 thiss!1204 (_2!9892 lt!340308)))))

(assert (=> d!73209 (isPrefixOf!0 lt!340643 thiss!1204)))

(assert (=> d!73209 (= (lemmaIsPrefixTransitive!0 lt!340643 thiss!1204 (_2!9892 lt!340308)) lt!342255)))

(declare-fun bs!17908 () Bool)

(assert (= bs!17908 d!73209))

(assert (=> bs!17908 m!332067))

(declare-fun m!333777 () Bool)

(assert (=> bs!17908 m!333777))

(declare-fun m!333779 () Bool)

(assert (=> bs!17908 m!333779))

(assert (=> d!72563 d!73209))

(declare-fun d!73211 () Bool)

(assert (=> d!73211 (= (remainingBits!0 ((_ sign_extend 32) (size!4656 (buf!5191 (_1!9893 lt!340303)))) ((_ sign_extend 32) (currentByte!9769 (_1!9893 lt!340303))) ((_ sign_extend 32) (currentBit!9764 (_1!9893 lt!340303)))) (bvsub (bvmul ((_ sign_extend 32) (size!4656 (buf!5191 (_1!9893 lt!340303)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9769 (_1!9893 lt!340303))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9764 (_1!9893 lt!340303))))))))

(assert (=> d!72597 d!73211))

(declare-fun d!73213 () Bool)

(assert (=> d!73213 (= (invariant!0 (currentBit!9764 (_1!9893 lt!340303)) (currentByte!9769 (_1!9893 lt!340303)) (size!4656 (buf!5191 (_1!9893 lt!340303)))) (and (bvsge (currentBit!9764 (_1!9893 lt!340303)) #b00000000000000000000000000000000) (bvslt (currentBit!9764 (_1!9893 lt!340303)) #b00000000000000000000000000001000) (bvsge (currentByte!9769 (_1!9893 lt!340303)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9769 (_1!9893 lt!340303)) (size!4656 (buf!5191 (_1!9893 lt!340303)))) (and (= (currentBit!9764 (_1!9893 lt!340303)) #b00000000000000000000000000000000) (= (currentByte!9769 (_1!9893 lt!340303)) (size!4656 (buf!5191 (_1!9893 lt!340303))))))))))

(assert (=> d!72597 d!73213))

(assert (=> b!215746 d!73109))

(assert (=> b!215746 d!72649))

(declare-fun d!73215 () Bool)

(declare-fun e!147198 () Bool)

(assert (=> d!73215 e!147198))

(declare-fun res!182062 () Bool)

(assert (=> d!73215 (=> (not res!182062) (not e!147198))))

(declare-fun lt!342257 () (_ BitVec 64))

(declare-fun lt!342260 () (_ BitVec 64))

(declare-fun lt!342259 () (_ BitVec 64))

(assert (=> d!73215 (= res!182062 (= lt!342259 (bvsub lt!342260 lt!342257)))))

(assert (=> d!73215 (or (= (bvand lt!342260 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!342257 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!342260 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!342260 lt!342257) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73215 (= lt!342257 (remainingBits!0 ((_ sign_extend 32) (size!4656 (buf!5191 lt!340862))) ((_ sign_extend 32) (currentByte!9769 lt!340862)) ((_ sign_extend 32) (currentBit!9764 lt!340862))))))

(declare-fun lt!342258 () (_ BitVec 64))

(declare-fun lt!342256 () (_ BitVec 64))

(assert (=> d!73215 (= lt!342260 (bvmul lt!342258 lt!342256))))

(assert (=> d!73215 (or (= lt!342258 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!342256 (bvsdiv (bvmul lt!342258 lt!342256) lt!342258)))))

(assert (=> d!73215 (= lt!342256 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73215 (= lt!342258 ((_ sign_extend 32) (size!4656 (buf!5191 lt!340862))))))

(assert (=> d!73215 (= lt!342259 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9769 lt!340862)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9764 lt!340862))))))

(assert (=> d!73215 (invariant!0 (currentBit!9764 lt!340862) (currentByte!9769 lt!340862) (size!4656 (buf!5191 lt!340862)))))

(assert (=> d!73215 (= (bitIndex!0 (size!4656 (buf!5191 lt!340862)) (currentByte!9769 lt!340862) (currentBit!9764 lt!340862)) lt!342259)))

(declare-fun b!216415 () Bool)

(declare-fun res!182063 () Bool)

(assert (=> b!216415 (=> (not res!182063) (not e!147198))))

(assert (=> b!216415 (= res!182063 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!342259))))

(declare-fun b!216416 () Bool)

(declare-fun lt!342261 () (_ BitVec 64))

(assert (=> b!216416 (= e!147198 (bvsle lt!342259 (bvmul lt!342261 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216416 (or (= lt!342261 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!342261 #b0000000000000000000000000000000000000000000000000000000000001000) lt!342261)))))

(assert (=> b!216416 (= lt!342261 ((_ sign_extend 32) (size!4656 (buf!5191 lt!340862))))))

(assert (= (and d!73215 res!182062) b!216415))

(assert (= (and b!216415 res!182063) b!216416))

(declare-fun m!333781 () Bool)

(assert (=> d!73215 m!333781))

(declare-fun m!333783 () Bool)

(assert (=> d!73215 m!333783))

(assert (=> d!72667 d!73215))

(declare-fun d!73217 () Bool)

(declare-fun e!147199 () Bool)

(assert (=> d!73217 e!147199))

(declare-fun res!182064 () Bool)

(assert (=> d!73217 (=> (not res!182064) (not e!147199))))

(declare-fun lt!342266 () (_ BitVec 64))

(declare-fun lt!342265 () (_ BitVec 64))

(declare-fun lt!342263 () (_ BitVec 64))

(assert (=> d!73217 (= res!182064 (= lt!342265 (bvsub lt!342266 lt!342263)))))

(assert (=> d!73217 (or (= (bvand lt!342266 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!342263 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!342266 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!342266 lt!342263) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73217 (= lt!342263 (remainingBits!0 ((_ sign_extend 32) (size!4656 (buf!5191 (_1!9895 lt!340318)))) ((_ sign_extend 32) (currentByte!9769 (_1!9895 lt!340318))) ((_ sign_extend 32) (currentBit!9764 (_1!9895 lt!340318)))))))

(declare-fun lt!342264 () (_ BitVec 64))

(declare-fun lt!342262 () (_ BitVec 64))

(assert (=> d!73217 (= lt!342266 (bvmul lt!342264 lt!342262))))

(assert (=> d!73217 (or (= lt!342264 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!342262 (bvsdiv (bvmul lt!342264 lt!342262) lt!342264)))))

(assert (=> d!73217 (= lt!342262 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73217 (= lt!342264 ((_ sign_extend 32) (size!4656 (buf!5191 (_1!9895 lt!340318)))))))

(assert (=> d!73217 (= lt!342265 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9769 (_1!9895 lt!340318))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9764 (_1!9895 lt!340318)))))))

(assert (=> d!73217 (invariant!0 (currentBit!9764 (_1!9895 lt!340318)) (currentByte!9769 (_1!9895 lt!340318)) (size!4656 (buf!5191 (_1!9895 lt!340318))))))

(assert (=> d!73217 (= (bitIndex!0 (size!4656 (buf!5191 (_1!9895 lt!340318))) (currentByte!9769 (_1!9895 lt!340318)) (currentBit!9764 (_1!9895 lt!340318))) lt!342265)))

(declare-fun b!216417 () Bool)

(declare-fun res!182065 () Bool)

(assert (=> b!216417 (=> (not res!182065) (not e!147199))))

(assert (=> b!216417 (= res!182065 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!342265))))

(declare-fun b!216418 () Bool)

(declare-fun lt!342267 () (_ BitVec 64))

(assert (=> b!216418 (= e!147199 (bvsle lt!342265 (bvmul lt!342267 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216418 (or (= lt!342267 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!342267 #b0000000000000000000000000000000000000000000000000000000000001000) lt!342267)))))

(assert (=> b!216418 (= lt!342267 ((_ sign_extend 32) (size!4656 (buf!5191 (_1!9895 lt!340318)))))))

(assert (= (and d!73217 res!182064) b!216417))

(assert (= (and b!216417 res!182065) b!216418))

(declare-fun m!333785 () Bool)

(assert (=> d!73217 m!333785))

(declare-fun m!333787 () Bool)

(assert (=> d!73217 m!333787))

(assert (=> d!72667 d!73217))

(declare-fun d!73219 () Bool)

(declare-fun lt!342269 () (_ BitVec 32))

(assert (=> d!73219 (= lt!342269 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!342272 () (_ BitVec 32))

(assert (=> d!73219 (= lt!342272 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!147200 () Bool)

(assert (=> d!73219 e!147200))

(declare-fun res!182066 () Bool)

(assert (=> d!73219 (=> (not res!182066) (not e!147200))))

(assert (=> d!73219 (= res!182066 (moveBitIndexPrecond!0 (_1!9895 lt!340318) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun Unit!15395 () Unit!15296)

(declare-fun Unit!15396 () Unit!15296)

(declare-fun Unit!15397 () Unit!15296)

(assert (=> d!73219 (= (moveBitIndex!0 (_1!9895 lt!340318) #b0000000000000000000000000000000000000000000000000000000000000001) (ite (bvslt (bvadd (currentBit!9764 (_1!9895 lt!340318)) lt!342269) #b00000000000000000000000000000000) (tuple2!18475 Unit!15395 (BitStream!8421 (buf!5191 (_1!9895 lt!340318)) (bvsub (bvadd (currentByte!9769 (_1!9895 lt!340318)) lt!342272) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!342269 (currentBit!9764 (_1!9895 lt!340318))))) (ite (bvsge (bvadd (currentBit!9764 (_1!9895 lt!340318)) lt!342269) #b00000000000000000000000000001000) (tuple2!18475 Unit!15396 (BitStream!8421 (buf!5191 (_1!9895 lt!340318)) (bvadd (currentByte!9769 (_1!9895 lt!340318)) lt!342272 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!9764 (_1!9895 lt!340318)) lt!342269) #b00000000000000000000000000001000))) (tuple2!18475 Unit!15397 (BitStream!8421 (buf!5191 (_1!9895 lt!340318)) (bvadd (currentByte!9769 (_1!9895 lt!340318)) lt!342272) (bvadd (currentBit!9764 (_1!9895 lt!340318)) lt!342269))))))))

(declare-fun b!216419 () Bool)

(declare-fun e!147201 () Bool)

(assert (=> b!216419 (= e!147200 e!147201)))

(declare-fun res!182067 () Bool)

(assert (=> b!216419 (=> (not res!182067) (not e!147201))))

(declare-fun lt!342270 () (_ BitVec 64))

(declare-fun lt!342273 () tuple2!18474)

(assert (=> b!216419 (= res!182067 (= (bvadd lt!342270 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!342273))) (currentByte!9769 (_2!9892 lt!342273)) (currentBit!9764 (_2!9892 lt!342273)))))))

(assert (=> b!216419 (or (not (= (bvand lt!342270 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!342270 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!342270 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!216419 (= lt!342270 (bitIndex!0 (size!4656 (buf!5191 (_1!9895 lt!340318))) (currentByte!9769 (_1!9895 lt!340318)) (currentBit!9764 (_1!9895 lt!340318))))))

(declare-fun lt!342268 () (_ BitVec 32))

(declare-fun lt!342271 () (_ BitVec 32))

(declare-fun Unit!15398 () Unit!15296)

(declare-fun Unit!15399 () Unit!15296)

(declare-fun Unit!15400 () Unit!15296)

(assert (=> b!216419 (= lt!342273 (ite (bvslt (bvadd (currentBit!9764 (_1!9895 lt!340318)) lt!342271) #b00000000000000000000000000000000) (tuple2!18475 Unit!15398 (BitStream!8421 (buf!5191 (_1!9895 lt!340318)) (bvsub (bvadd (currentByte!9769 (_1!9895 lt!340318)) lt!342268) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!342271 (currentBit!9764 (_1!9895 lt!340318))))) (ite (bvsge (bvadd (currentBit!9764 (_1!9895 lt!340318)) lt!342271) #b00000000000000000000000000001000) (tuple2!18475 Unit!15399 (BitStream!8421 (buf!5191 (_1!9895 lt!340318)) (bvadd (currentByte!9769 (_1!9895 lt!340318)) lt!342268 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!9764 (_1!9895 lt!340318)) lt!342271) #b00000000000000000000000000001000))) (tuple2!18475 Unit!15400 (BitStream!8421 (buf!5191 (_1!9895 lt!340318)) (bvadd (currentByte!9769 (_1!9895 lt!340318)) lt!342268) (bvadd (currentBit!9764 (_1!9895 lt!340318)) lt!342271))))))))

(assert (=> b!216419 (= lt!342271 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216419 (= lt!342268 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!216420 () Bool)

(assert (=> b!216420 (= e!147201 (and (= (size!4656 (buf!5191 (_1!9895 lt!340318))) (size!4656 (buf!5191 (_2!9892 lt!342273)))) (= (buf!5191 (_1!9895 lt!340318)) (buf!5191 (_2!9892 lt!342273)))))))

(assert (= (and d!73219 res!182066) b!216419))

(assert (= (and b!216419 res!182067) b!216420))

(assert (=> d!73219 m!332261))

(declare-fun m!333789 () Bool)

(assert (=> b!216419 m!333789))

(assert (=> b!216419 m!332257))

(assert (=> d!72667 d!73219))

(declare-fun d!73221 () Bool)

(declare-fun res!182068 () Bool)

(declare-fun e!147202 () Bool)

(assert (=> d!73221 (=> (not res!182068) (not e!147202))))

(assert (=> d!73221 (= res!182068 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!4656 (buf!5191 (_1!9895 lt!340318))))) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4656 (buf!5191 (_1!9895 lt!340318))))))))))

(assert (=> d!73221 (= (moveBitIndexPrecond!0 (_1!9895 lt!340318) #b0000000000000000000000000000000000000000000000000000000000000001) e!147202)))

(declare-fun b!216421 () Bool)

(declare-fun lt!342274 () (_ BitVec 64))

(assert (=> b!216421 (= e!147202 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!342274) (bvsle lt!342274 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4656 (buf!5191 (_1!9895 lt!340318))))))))))

(assert (=> b!216421 (= lt!342274 (bvadd (bitIndex!0 (size!4656 (buf!5191 (_1!9895 lt!340318))) (currentByte!9769 (_1!9895 lt!340318)) (currentBit!9764 (_1!9895 lt!340318))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and d!73221 res!182068) b!216421))

(assert (=> b!216421 m!332257))

(assert (=> d!72667 d!73221))

(declare-fun d!73223 () Bool)

(declare-fun res!182069 () Bool)

(declare-fun e!147204 () Bool)

(assert (=> d!73223 (=> (not res!182069) (not e!147204))))

(assert (=> d!73223 (= res!182069 (= (size!4656 (buf!5191 (_1!9895 lt!340716))) (size!4656 (buf!5191 (_2!9892 lt!340324)))))))

(assert (=> d!73223 (= (isPrefixOf!0 (_1!9895 lt!340716) (_2!9892 lt!340324)) e!147204)))

(declare-fun b!216422 () Bool)

(declare-fun res!182070 () Bool)

(assert (=> b!216422 (=> (not res!182070) (not e!147204))))

(assert (=> b!216422 (= res!182070 (bvsle (bitIndex!0 (size!4656 (buf!5191 (_1!9895 lt!340716))) (currentByte!9769 (_1!9895 lt!340716)) (currentBit!9764 (_1!9895 lt!340716))) (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!340324))) (currentByte!9769 (_2!9892 lt!340324)) (currentBit!9764 (_2!9892 lt!340324)))))))

(declare-fun b!216423 () Bool)

(declare-fun e!147203 () Bool)

(assert (=> b!216423 (= e!147204 e!147203)))

(declare-fun res!182071 () Bool)

(assert (=> b!216423 (=> res!182071 e!147203)))

(assert (=> b!216423 (= res!182071 (= (size!4656 (buf!5191 (_1!9895 lt!340716))) #b00000000000000000000000000000000))))

(declare-fun b!216424 () Bool)

(assert (=> b!216424 (= e!147203 (arrayBitRangesEq!0 (buf!5191 (_1!9895 lt!340716)) (buf!5191 (_2!9892 lt!340324)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4656 (buf!5191 (_1!9895 lt!340716))) (currentByte!9769 (_1!9895 lt!340716)) (currentBit!9764 (_1!9895 lt!340716)))))))

(assert (= (and d!73223 res!182069) b!216422))

(assert (= (and b!216422 res!182070) b!216423))

(assert (= (and b!216423 (not res!182071)) b!216424))

(assert (=> b!216422 m!333283))

(assert (=> b!216422 m!331795))

(assert (=> b!216424 m!333283))

(assert (=> b!216424 m!333283))

(declare-fun m!333791 () Bool)

(assert (=> b!216424 m!333791))

(assert (=> b!215707 d!73223))

(assert (=> b!215890 d!72989))

(assert (=> b!215890 d!72647))

(declare-fun d!73225 () Bool)

(declare-fun lt!342279 () tuple2!18478)

(declare-fun lt!342280 () tuple2!18478)

(assert (=> d!73225 (and (= (_2!9894 lt!342279) (_2!9894 lt!342280)) (= (_1!9894 lt!342279) (_1!9894 lt!342280)))))

(declare-fun e!147207 () (_ BitVec 64))

(assert (=> d!73225 (= lt!342280 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9895 lt!340318) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd i!590 #b00000000000000000000000000000001) (bvor lt!340307 e!147207)))))

(declare-fun c!10578 () Bool)

(assert (=> d!73225 (= c!10578 (_2!9893 (readBitPure!0 (_1!9895 lt!340318))))))

(assert (=> d!73225 (= lt!342279 (readNBitsLSBFirstsLoopPure!0 (_1!9895 lt!340318) nBits!348 i!590 lt!340307))))

(assert (=> d!73225 true))

(declare-fun _$10!40 () Unit!15296)

(assert (=> d!73225 (= (choose!56 (_1!9895 lt!340318) nBits!348 i!590 lt!340307 lt!340860 (tuple2!18479 (_1!9894 lt!340860) (_2!9894 lt!340860)) (_1!9894 lt!340860) (_2!9894 lt!340860) lt!340857 lt!340856 lt!340858 lt!340859 (tuple2!18479 (_1!9894 lt!340859) (_2!9894 lt!340859)) (_1!9894 lt!340859) (_2!9894 lt!340859)) _$10!40)))

(declare-fun b!216429 () Bool)

(assert (=> b!216429 (= e!147207 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!216430 () Bool)

(assert (=> b!216430 (= e!147207 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (= (and d!73225 c!10578) b!216429))

(assert (= (and d!73225 (not c!10578)) b!216430))

(assert (=> d!73225 m!331859))

(assert (=> d!73225 m!331859))

(declare-fun m!333793 () Bool)

(assert (=> d!73225 m!333793))

(assert (=> d!73225 m!331819))

(assert (=> d!73225 m!331833))

(assert (=> d!72655 d!73225))

(declare-fun d!73227 () Bool)

(declare-fun lt!342281 () tuple2!18488)

(assert (=> d!73227 (= lt!342281 (readNBitsLSBFirstsLoop!0 lt!340856 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!340858))))

(assert (=> d!73227 (= (readNBitsLSBFirstsLoopPure!0 lt!340856 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!340858) (tuple2!18479 (_2!9899 lt!342281) (_1!9899 lt!342281)))))

(declare-fun bs!17910 () Bool)

(assert (= bs!17910 d!73227))

(declare-fun m!333795 () Bool)

(assert (=> bs!17910 m!333795))

(assert (=> d!72655 d!73227))

(assert (=> d!72655 d!72667))

(assert (=> d!72655 d!72591))

(assert (=> d!72655 d!72603))

(declare-fun b!216442 () Bool)

(declare-fun res!182082 () Bool)

(declare-fun e!147216 () Bool)

(assert (=> b!216442 (=> (not res!182082) (not e!147216))))

(declare-fun _$19!174 () tuple2!18474)

(assert (=> b!216442 (= res!182082 (isPrefixOf!0 thiss!1204 (_2!9892 _$19!174)))))

(declare-fun b!216443 () Bool)

(declare-fun e!147217 () Bool)

(assert (=> b!216443 (= e!147216 e!147217)))

(declare-fun res!182083 () Bool)

(assert (=> b!216443 (=> (not res!182083) (not e!147217))))

(declare-fun lt!342284 () tuple2!18476)

(assert (=> b!216443 (= res!182083 (and (= (_2!9893 lt!342284) lt!340304) (= (_1!9893 lt!342284) (_2!9892 _$19!174))))))

(assert (=> b!216443 (= lt!342284 (readBitPure!0 (readerFrom!0 (_2!9892 _$19!174) (currentBit!9764 thiss!1204) (currentByte!9769 thiss!1204))))))

(declare-fun b!216444 () Bool)

(assert (=> b!216444 (= e!147217 (= (bitIndex!0 (size!4656 (buf!5191 (_1!9893 lt!342284))) (currentByte!9769 (_1!9893 lt!342284)) (currentBit!9764 (_1!9893 lt!342284))) (bitIndex!0 (size!4656 (buf!5191 (_2!9892 _$19!174))) (currentByte!9769 (_2!9892 _$19!174)) (currentBit!9764 (_2!9892 _$19!174)))))))

(declare-fun b!216445 () Bool)

(declare-fun e!147218 () Bool)

(assert (=> b!216445 (= e!147218 (array_inv!4397 (buf!5191 (_2!9892 _$19!174))))))

(declare-fun d!73229 () Bool)

(assert (=> d!73229 e!147216))

(declare-fun res!182081 () Bool)

(assert (=> d!73229 (=> (not res!182081) (not e!147216))))

(assert (=> d!73229 (= res!182081 (= (size!4656 (buf!5191 thiss!1204)) (size!4656 (buf!5191 (_2!9892 _$19!174)))))))

(assert (=> d!73229 (and (inv!12 (_2!9892 _$19!174)) e!147218)))

(assert (=> d!73229 (= (choose!16 thiss!1204 lt!340304) _$19!174)))

(declare-fun b!216446 () Bool)

(declare-fun res!182080 () Bool)

(assert (=> b!216446 (=> (not res!182080) (not e!147216))))

(assert (=> b!216446 (= res!182080 (= (bitIndex!0 (size!4656 (buf!5191 (_2!9892 _$19!174))) (currentByte!9769 (_2!9892 _$19!174)) (currentBit!9764 (_2!9892 _$19!174))) (bvadd (bitIndex!0 (size!4656 (buf!5191 thiss!1204)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= d!73229 b!216445))

(assert (= (and d!73229 res!182081) b!216446))

(assert (= (and b!216446 res!182080) b!216442))

(assert (= (and b!216442 res!182082) b!216443))

(assert (= (and b!216443 res!182083) b!216444))

(declare-fun m!333797 () Bool)

(assert (=> b!216443 m!333797))

(assert (=> b!216443 m!333797))

(declare-fun m!333799 () Bool)

(assert (=> b!216443 m!333799))

(declare-fun m!333801 () Bool)

(assert (=> b!216444 m!333801))

(declare-fun m!333803 () Bool)

(assert (=> b!216444 m!333803))

(declare-fun m!333805 () Bool)

(assert (=> b!216442 m!333805))

(assert (=> b!216446 m!333803))

(assert (=> b!216446 m!331797))

(declare-fun m!333807 () Bool)

(assert (=> d!73229 m!333807))

(declare-fun m!333809 () Bool)

(assert (=> b!216445 m!333809))

(assert (=> d!72653 d!73229))

(declare-fun d!73231 () Bool)

(assert (=> d!73231 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!4656 (buf!5191 thiss!1204))) ((_ sign_extend 32) (currentByte!9769 thiss!1204)) ((_ sign_extend 32) (currentBit!9764 thiss!1204))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4656 (buf!5191 thiss!1204))) ((_ sign_extend 32) (currentByte!9769 thiss!1204)) ((_ sign_extend 32) (currentBit!9764 thiss!1204))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!17911 () Bool)

(assert (= bs!17911 d!73231))

(assert (=> bs!17911 m!332189))

(assert (=> d!72653 d!73231))

(declare-fun d!73233 () Bool)

(declare-fun e!147220 () Bool)

(assert (=> d!73233 e!147220))

(declare-fun res!182084 () Bool)

(assert (=> d!73233 (=> (not res!182084) (not e!147220))))

(declare-fun lt!342286 () (_ BitVec 64))

(declare-fun lt!342289 () (_ BitVec 64))

(declare-fun lt!342288 () (_ BitVec 64))

(assert (=> d!73233 (= res!182084 (= lt!342288 (bvsub lt!342289 lt!342286)))))

(assert (=> d!73233 (or (= (bvand lt!342289 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!342286 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!342289 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!342289 lt!342286) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73233 (= lt!342286 (remainingBits!0 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!341282)))) ((_ sign_extend 32) (currentByte!9769 (_2!9892 lt!341282))) ((_ sign_extend 32) (currentBit!9764 (_2!9892 lt!341282)))))))

(declare-fun lt!342287 () (_ BitVec 64))

(declare-fun lt!342285 () (_ BitVec 64))

(assert (=> d!73233 (= lt!342289 (bvmul lt!342287 lt!342285))))

(assert (=> d!73233 (or (= lt!342287 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!342285 (bvsdiv (bvmul lt!342287 lt!342285) lt!342287)))))

(assert (=> d!73233 (= lt!342285 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!73233 (= lt!342287 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!341282)))))))

(assert (=> d!73233 (= lt!342288 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9769 (_2!9892 lt!341282))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9764 (_2!9892 lt!341282)))))))

(assert (=> d!73233 (invariant!0 (currentBit!9764 (_2!9892 lt!341282)) (currentByte!9769 (_2!9892 lt!341282)) (size!4656 (buf!5191 (_2!9892 lt!341282))))))

(assert (=> d!73233 (= (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!341282))) (currentByte!9769 (_2!9892 lt!341282)) (currentBit!9764 (_2!9892 lt!341282))) lt!342288)))

(declare-fun b!216447 () Bool)

(declare-fun res!182085 () Bool)

(assert (=> b!216447 (=> (not res!182085) (not e!147220))))

(assert (=> b!216447 (= res!182085 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!342288))))

(declare-fun b!216448 () Bool)

(declare-fun lt!342290 () (_ BitVec 64))

(assert (=> b!216448 (= e!147220 (bvsle lt!342288 (bvmul lt!342290 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!216448 (or (= lt!342290 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!342290 #b0000000000000000000000000000000000000000000000000000000000001000) lt!342290)))))

(assert (=> b!216448 (= lt!342290 ((_ sign_extend 32) (size!4656 (buf!5191 (_2!9892 lt!341282)))))))

(assert (= (and d!73233 res!182084) b!216447))

(assert (= (and b!216447 res!182085) b!216448))

(declare-fun m!333811 () Bool)

(assert (=> d!73233 m!333811))

(assert (=> d!73233 m!332527))

(assert (=> b!215888 d!73233))

(assert (=> b!215888 d!72647))

(assert (=> d!72649 d!72983))

(assert (=> d!72649 d!72721))

(declare-fun d!73235 () Bool)

(declare-fun res!182086 () Bool)

(declare-fun e!147222 () Bool)

(assert (=> d!73235 (=> (not res!182086) (not e!147222))))

(assert (=> d!73235 (= res!182086 (= (size!4656 (buf!5191 (_2!9895 lt!340716))) (size!4656 (buf!5191 (_2!9892 lt!340308)))))))

(assert (=> d!73235 (= (isPrefixOf!0 (_2!9895 lt!340716) (_2!9892 lt!340308)) e!147222)))

(declare-fun b!216449 () Bool)

(declare-fun res!182087 () Bool)

(assert (=> b!216449 (=> (not res!182087) (not e!147222))))

(assert (=> b!216449 (= res!182087 (bvsle (bitIndex!0 (size!4656 (buf!5191 (_2!9895 lt!340716))) (currentByte!9769 (_2!9895 lt!340716)) (currentBit!9764 (_2!9895 lt!340716))) (bitIndex!0 (size!4656 (buf!5191 (_2!9892 lt!340308))) (currentByte!9769 (_2!9892 lt!340308)) (currentBit!9764 (_2!9892 lt!340308)))))))

(declare-fun b!216450 () Bool)

(declare-fun e!147221 () Bool)

(assert (=> b!216450 (= e!147222 e!147221)))

(declare-fun res!182088 () Bool)

(assert (=> b!216450 (=> res!182088 e!147221)))

(assert (=> b!216450 (= res!182088 (= (size!4656 (buf!5191 (_2!9895 lt!340716))) #b00000000000000000000000000000000))))

(declare-fun b!216451 () Bool)

(assert (=> b!216451 (= e!147221 (arrayBitRangesEq!0 (buf!5191 (_2!9895 lt!340716)) (buf!5191 (_2!9892 lt!340308)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4656 (buf!5191 (_2!9895 lt!340716))) (currentByte!9769 (_2!9895 lt!340716)) (currentBit!9764 (_2!9895 lt!340716)))))))

(assert (= (and d!73235 res!182086) b!216449))

(assert (= (and b!216449 res!182087) b!216450))

(assert (= (and b!216450 (not res!182088)) b!216451))

(assert (=> b!216449 m!333285))

(assert (=> b!216449 m!331803))

(assert (=> b!216451 m!333285))

(assert (=> b!216451 m!333285))

(declare-fun m!333813 () Bool)

(assert (=> b!216451 m!333813))

(assert (=> b!215703 d!73235))

(declare-fun d!73237 () Bool)

(declare-fun res!182089 () Bool)

(declare-fun e!147224 () Bool)

(assert (=> d!73237 (=> (not res!182089) (not e!147224))))

(assert (=> d!73237 (= res!182089 (= (size!4656 (buf!5191 (_1!9895 lt!340630))) (size!4656 (buf!5191 thiss!1204))))))

(assert (=> d!73237 (= (isPrefixOf!0 (_1!9895 lt!340630) thiss!1204) e!147224)))

(declare-fun b!216452 () Bool)

(declare-fun res!182090 () Bool)

(assert (=> b!216452 (=> (not res!182090) (not e!147224))))

(assert (=> b!216452 (= res!182090 (bvsle (bitIndex!0 (size!4656 (buf!5191 (_1!9895 lt!340630))) (currentByte!9769 (_1!9895 lt!340630)) (currentBit!9764 (_1!9895 lt!340630))) (bitIndex!0 (size!4656 (buf!5191 thiss!1204)) (currentByte!9769 thiss!1204) (currentBit!9764 thiss!1204))))))

(declare-fun b!216453 () Bool)

(declare-fun e!147223 () Bool)

(assert (=> b!216453 (= e!147224 e!147223)))

(declare-fun res!182091 () Bool)

(assert (=> b!216453 (=> res!182091 e!147223)))

(assert (=> b!216453 (= res!182091 (= (size!4656 (buf!5191 (_1!9895 lt!340630))) #b00000000000000000000000000000000))))

(declare-fun b!216454 () Bool)

(assert (=> b!216454 (= e!147223 (arrayBitRangesEq!0 (buf!5191 (_1!9895 lt!340630)) (buf!5191 thiss!1204) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4656 (buf!5191 (_1!9895 lt!340630))) (currentByte!9769 (_1!9895 lt!340630)) (currentBit!9764 (_1!9895 lt!340630)))))))

(assert (= (and d!73237 res!182089) b!216452))

(assert (= (and b!216452 res!182090) b!216453))

(assert (= (and b!216453 (not res!182091)) b!216454))

(assert (=> b!216452 m!333769))

(assert (=> b!216452 m!331797))

(assert (=> b!216454 m!333769))

(assert (=> b!216454 m!333769))

(declare-fun m!333815 () Bool)

(assert (=> b!216454 m!333815))

(assert (=> b!215671 d!73237))

(push 1)

(assert (not d!73081))

(assert (not b!216394))

(assert (not b!216294))

(assert (not b!216262))

(assert (not d!73003))

(assert (not d!73043))

(assert (not d!73035))

(assert (not b!216322))

(assert (not d!73215))

(assert (not d!73013))

(assert (not d!73171))

(assert (not b!216373))

(assert (not b!216243))

(assert (not d!73061))

(assert (not b!216377))

(assert (not d!73145))

(assert (not b!216401))

(assert (not b!216399))

(assert (not d!73181))

(assert (not d!73089))

(assert (not d!73219))

(assert (not d!73191))

(assert (not b!216392))

(assert (not b!216333))

(assert (not d!73195))

(assert (not d!73083))

(assert (not b!216254))

(assert (not d!73063))

(assert (not b!216245))

(assert (not d!73217))

(assert (not d!73069))

(assert (not b!216371))

(assert (not b!216400))

(assert (not b!216446))

(assert (not d!73111))

(assert (not b!216402))

(assert (not b!216349))

(assert (not b!216302))

(assert (not b!216411))

(assert (not b!216368))

(assert (not d!73135))

(assert (not b!216342))

(assert (not d!73009))

(assert (not b!216379))

(assert (not b!216236))

(assert (not d!73229))

(assert (not b!216443))

(assert (not d!73113))

(assert (not d!73225))

(assert (not b!216257))

(assert (not d!73099))

(assert (not b!216242))

(assert (not b!216375))

(assert (not d!73227))

(assert (not b!216378))

(assert (not b!216263))

(assert (not d!73087))

(assert (not b!216412))

(assert (not d!73055))

(assert (not d!73075))

(assert (not b!216451))

(assert (not b!216454))

(assert (not b!216393))

(assert (not b!216409))

(assert (not b!216279))

(assert (not b!216419))

(assert (not d!73231))

(assert (not b!216383))

(assert (not d!73149))

(assert (not d!73139))

(assert (not bm!3381))

(assert (not d!73045))

(assert (not d!73037))

(assert (not b!216246))

(assert (not b!216304))

(assert (not d!73209))

(assert (not bm!3375))

(assert (not d!72993))

(assert (not d!73027))

(assert (not d!72989))

(assert (not d!72987))

(assert (not b!216240))

(assert (not b!216272))

(assert (not d!73127))

(assert (not b!216290))

(assert (not b!216216))

(assert (not d!73051))

(assert (not d!73183))

(assert (not d!73065))

(assert (not b!216281))

(assert (not b!216452))

(assert (not d!73125))

(assert (not b!216406))

(assert (not b!216344))

(assert (not b!216261))

(assert (not d!73131))

(assert (not b!216442))

(assert (not b!216369))

(assert (not d!73207))

(assert (not d!72991))

(assert (not d!73151))

(assert (not b!216324))

(assert (not b!216340))

(assert (not d!73119))

(assert (not b!216332))

(assert (not b!216387))

(assert (not b!216405))

(assert (not d!73015))

(assert (not d!73091))

(assert (not b!216403))

(assert (not b!216255))

(assert (not d!73071))

(assert (not b!216217))

(assert (not bm!3380))

(assert (not d!73029))

(assert (not b!216231))

(assert (not d!73085))

(assert (not b!216270))

(assert (not d!73041))

(assert (not d!73117))

(assert (not b!216385))

(assert (not b!216364))

(assert (not d!73193))

(assert (not b!216366))

(assert (not d!73107))

(assert (not b!216251))

(assert (not d!73031))

(assert (not d!73047))

(assert (not b!216249))

(assert (not b!216391))

(assert (not d!73109))

(assert (not b!216335))

(assert (not b!216397))

(assert (not d!73155))

(assert (not b!216284))

(assert (not d!73159))

(assert (not b!216396))

(assert (not b!216214))

(assert (not b!216422))

(assert (not b!216265))

(assert (not b!216380))

(assert (not b!216372))

(assert (not b!216362))

(assert (not d!73057))

(assert (not b!216278))

(assert (not bm!3382))

(assert (not d!72995))

(assert (not b!216347))

(assert (not b!216445))

(assert (not b!216276))

(assert (not b!216268))

(assert (not bm!3378))

(assert (not d!73033))

(assert (not b!216389))

(assert (not b!216280))

(assert (not d!73077))

(assert (not d!73233))

(assert (not d!73179))

(assert (not b!216414))

(assert (not b!216444))

(assert (not d!73153))

(assert (not d!73067))

(assert (not b!216252))

(assert (not b!216260))

(assert (not bm!3379))

(assert (not d!73129))

(assert (not b!216319))

(assert (not b!216408))

(assert (not b!216273))

(assert (not b!216449))

(assert (not d!73201))

(assert (not b!216267))

(assert (not b!216337))

(assert (not b!216283))

(assert (not b!216421))

(assert (not b!216293))

(assert (not b!216336))

(assert (not d!73073))

(assert (not b!216239))

(assert (not d!73017))

(assert (not b!216218))

(assert (not b!216237))

(assert (not b!216248))

(assert (not b!216212))

(assert (not b!216291))

(assert (not d!73059))

(assert (not d!73143))

(assert (not b!216359))

(assert (not b!216424))

(assert (not b!216269))

(check-sat)

(pop 1)

(push 1)

(check-sat)

