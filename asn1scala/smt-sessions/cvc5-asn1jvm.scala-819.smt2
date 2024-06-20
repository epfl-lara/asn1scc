; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24176 () Bool)

(assert start!24176)

(declare-fun b!122616 () Bool)

(declare-fun e!80366 () Bool)

(declare-datatypes ((array!5426 0))(
  ( (array!5427 (arr!3048 (Array (_ BitVec 32) (_ BitVec 8))) (size!2455 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4384 0))(
  ( (BitStream!4385 (buf!2895 array!5426) (currentByte!5592 (_ BitVec 32)) (currentBit!5587 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!10360 0))(
  ( (tuple2!10361 (_1!5445 BitStream!4384) (_2!5445 Bool)) )
))
(declare-fun lt!192970 () tuple2!10360)

(declare-fun lt!192975 () tuple2!10360)

(assert (=> b!122616 (= e!80366 (= (_2!5445 lt!192970) (_2!5445 lt!192975)))))

(declare-fun b!122617 () Bool)

(declare-fun e!80365 () Bool)

(assert (=> b!122617 (= e!80365 true)))

(declare-fun e!80373 () Bool)

(assert (=> b!122617 e!80373))

(declare-fun res!101632 () Bool)

(assert (=> b!122617 (=> (not res!101632) (not e!80373))))

(declare-datatypes ((tuple2!10362 0))(
  ( (tuple2!10363 (_1!5446 BitStream!4384) (_2!5446 BitStream!4384)) )
))
(declare-fun lt!192951 () tuple2!10362)

(declare-fun lt!192967 () (_ BitVec 64))

(declare-fun lt!192961 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4384 (_ BitVec 64)) BitStream!4384)

(assert (=> b!122617 (= res!101632 (= (_1!5446 lt!192951) (withMovedBitIndex!0 (_2!5446 lt!192951) (bvsub lt!192961 lt!192967))))))

(declare-datatypes ((Unit!7549 0))(
  ( (Unit!7550) )
))
(declare-datatypes ((tuple2!10364 0))(
  ( (tuple2!10365 (_1!5447 Unit!7549) (_2!5447 BitStream!4384)) )
))
(declare-fun lt!192958 () tuple2!10364)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!122617 (= lt!192961 (bitIndex!0 (size!2455 (buf!2895 (_2!5447 lt!192958))) (currentByte!5592 (_2!5447 lt!192958)) (currentBit!5587 (_2!5447 lt!192958))))))

(declare-fun lt!192963 () tuple2!10362)

(declare-fun lt!192962 () (_ BitVec 64))

(assert (=> b!122617 (= (_1!5446 lt!192963) (withMovedBitIndex!0 (_2!5446 lt!192963) (bvsub lt!192962 lt!192967)))))

(declare-fun lt!192953 () tuple2!10364)

(assert (=> b!122617 (= lt!192967 (bitIndex!0 (size!2455 (buf!2895 (_2!5447 lt!192953))) (currentByte!5592 (_2!5447 lt!192953)) (currentBit!5587 (_2!5447 lt!192953))))))

(declare-fun thiss!1305 () BitStream!4384)

(assert (=> b!122617 (= lt!192962 (bitIndex!0 (size!2455 (buf!2895 thiss!1305)) (currentByte!5592 thiss!1305) (currentBit!5587 thiss!1305)))))

(declare-datatypes ((tuple2!10366 0))(
  ( (tuple2!10367 (_1!5448 BitStream!4384) (_2!5448 (_ BitVec 64))) )
))
(declare-fun lt!192954 () tuple2!10366)

(declare-fun lt!192949 () tuple2!10366)

(assert (=> b!122617 (and (= (_2!5448 lt!192954) (_2!5448 lt!192949)) (= (_1!5448 lt!192954) (_1!5448 lt!192949)))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun lt!192965 () (_ BitVec 64))

(declare-fun lt!192966 () Unit!7549)

(declare-fun i!615 () (_ BitVec 32))

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4384 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7549)

(assert (=> b!122617 (= lt!192966 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5446 lt!192963) nBits!396 i!615 lt!192965))))

(declare-fun lt!192956 () BitStream!4384)

(declare-fun lt!192973 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4384 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10366)

(assert (=> b!122617 (= lt!192949 (readNLeastSignificantBitsLoopPure!0 lt!192956 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!192973))))

(assert (=> b!122617 (= lt!192956 (withMovedBitIndex!0 (_1!5446 lt!192963) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun res!101625 () Bool)

(declare-fun e!80364 () Bool)

(assert (=> start!24176 (=> (not res!101625) (not e!80364))))

(assert (=> start!24176 (= res!101625 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!24176 e!80364))

(assert (=> start!24176 true))

(declare-fun e!80372 () Bool)

(declare-fun inv!12 (BitStream!4384) Bool)

(assert (=> start!24176 (and (inv!12 thiss!1305) e!80372)))

(declare-fun b!122618 () Bool)

(declare-fun e!80367 () Bool)

(declare-fun e!80370 () Bool)

(assert (=> b!122618 (= e!80367 e!80370)))

(declare-fun res!101627 () Bool)

(assert (=> b!122618 (=> (not res!101627) (not e!80370))))

(declare-fun lt!192947 () tuple2!10360)

(declare-fun lt!192952 () Bool)

(assert (=> b!122618 (= res!101627 (and (= (_2!5445 lt!192947) lt!192952) (= (_1!5445 lt!192947) (_2!5447 lt!192958))))))

(declare-fun readBitPure!0 (BitStream!4384) tuple2!10360)

(declare-fun readerFrom!0 (BitStream!4384 (_ BitVec 32) (_ BitVec 32)) BitStream!4384)

(assert (=> b!122618 (= lt!192947 (readBitPure!0 (readerFrom!0 (_2!5447 lt!192958) (currentBit!5587 thiss!1305) (currentByte!5592 thiss!1305))))))

(declare-fun b!122619 () Bool)

(declare-fun lt!192955 () (_ BitVec 64))

(assert (=> b!122619 (= e!80370 (= (bitIndex!0 (size!2455 (buf!2895 (_1!5445 lt!192947))) (currentByte!5592 (_1!5445 lt!192947)) (currentBit!5587 (_1!5445 lt!192947))) lt!192955))))

(declare-fun b!122620 () Bool)

(declare-fun res!101630 () Bool)

(assert (=> b!122620 (=> (not res!101630) (not e!80367))))

(declare-fun isPrefixOf!0 (BitStream!4384 BitStream!4384) Bool)

(assert (=> b!122620 (= res!101630 (isPrefixOf!0 thiss!1305 (_2!5447 lt!192958)))))

(declare-fun b!122621 () Bool)

(declare-fun array_inv!2257 (array!5426) Bool)

(assert (=> b!122621 (= e!80372 (array_inv!2257 (buf!2895 thiss!1305)))))

(declare-fun b!122622 () Bool)

(declare-fun e!80369 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!122622 (= e!80369 (invariant!0 (currentBit!5587 thiss!1305) (currentByte!5592 thiss!1305) (size!2455 (buf!2895 (_2!5447 lt!192953)))))))

(declare-fun b!122623 () Bool)

(declare-fun res!101633 () Bool)

(declare-fun e!80368 () Bool)

(assert (=> b!122623 (=> (not res!101633) (not e!80368))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!122623 (= res!101633 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!122624 () Bool)

(declare-fun res!101629 () Bool)

(assert (=> b!122624 (=> (not res!101629) (not e!80368))))

(assert (=> b!122624 (= res!101629 (bvslt i!615 nBits!396))))

(declare-fun b!122625 () Bool)

(declare-fun lt!192969 () tuple2!10366)

(assert (=> b!122625 (= e!80373 (and (= lt!192962 (bvsub lt!192961 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!5446 lt!192951) lt!192956)) (and (= (_2!5448 lt!192954) (_2!5448 lt!192969)) (= (_1!5448 lt!192954) (_2!5446 lt!192963))))))))

(declare-fun b!122626 () Bool)

(declare-fun e!80363 () Bool)

(assert (=> b!122626 (= e!80363 e!80367)))

(declare-fun res!101626 () Bool)

(assert (=> b!122626 (=> (not res!101626) (not e!80367))))

(declare-fun lt!192950 () (_ BitVec 64))

(assert (=> b!122626 (= res!101626 (= lt!192955 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!192950)))))

(assert (=> b!122626 (= lt!192955 (bitIndex!0 (size!2455 (buf!2895 (_2!5447 lt!192958))) (currentByte!5592 (_2!5447 lt!192958)) (currentBit!5587 (_2!5447 lt!192958))))))

(assert (=> b!122626 (= lt!192950 (bitIndex!0 (size!2455 (buf!2895 thiss!1305)) (currentByte!5592 thiss!1305) (currentBit!5587 thiss!1305)))))

(declare-fun b!122627 () Bool)

(assert (=> b!122627 (= e!80364 e!80368)))

(declare-fun res!101628 () Bool)

(assert (=> b!122627 (=> (not res!101628) (not e!80368))))

(declare-fun lt!192972 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!122627 (= res!101628 (validate_offset_bits!1 ((_ sign_extend 32) (size!2455 (buf!2895 thiss!1305))) ((_ sign_extend 32) (currentByte!5592 thiss!1305)) ((_ sign_extend 32) (currentBit!5587 thiss!1305)) lt!192972))))

(assert (=> b!122627 (= lt!192972 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!122628 () Bool)

(assert (=> b!122628 (= e!80368 (not e!80365))))

(declare-fun res!101634 () Bool)

(assert (=> b!122628 (=> res!101634 e!80365)))

(assert (=> b!122628 (= res!101634 (not (= (_1!5448 lt!192969) (_2!5446 lt!192951))))))

(assert (=> b!122628 (= lt!192969 (readNLeastSignificantBitsLoopPure!0 (_1!5446 lt!192951) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!192973))))

(declare-fun lt!192957 () (_ BitVec 64))

(assert (=> b!122628 (validate_offset_bits!1 ((_ sign_extend 32) (size!2455 (buf!2895 (_2!5447 lt!192953)))) ((_ sign_extend 32) (currentByte!5592 (_2!5447 lt!192958))) ((_ sign_extend 32) (currentBit!5587 (_2!5447 lt!192958))) lt!192957)))

(declare-fun lt!192948 () Unit!7549)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4384 array!5426 (_ BitVec 64)) Unit!7549)

(assert (=> b!122628 (= lt!192948 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5447 lt!192958) (buf!2895 (_2!5447 lt!192953)) lt!192957))))

(assert (=> b!122628 (= lt!192957 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!192974 () (_ BitVec 64))

(declare-fun lt!192959 () tuple2!10360)

(assert (=> b!122628 (= lt!192973 (bvor lt!192965 (ite (_2!5445 lt!192959) lt!192974 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!122628 (= lt!192954 (readNLeastSignificantBitsLoopPure!0 (_1!5446 lt!192963) nBits!396 i!615 lt!192965))))

(assert (=> b!122628 (validate_offset_bits!1 ((_ sign_extend 32) (size!2455 (buf!2895 (_2!5447 lt!192953)))) ((_ sign_extend 32) (currentByte!5592 thiss!1305)) ((_ sign_extend 32) (currentBit!5587 thiss!1305)) lt!192972)))

(declare-fun lt!192960 () Unit!7549)

(assert (=> b!122628 (= lt!192960 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2895 (_2!5447 lt!192953)) lt!192972))))

(assert (=> b!122628 (= lt!192965 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(assert (=> b!122628 (= (_2!5445 lt!192959) lt!192952)))

(assert (=> b!122628 (= lt!192959 (readBitPure!0 (_1!5446 lt!192963)))))

(declare-fun reader!0 (BitStream!4384 BitStream!4384) tuple2!10362)

(assert (=> b!122628 (= lt!192951 (reader!0 (_2!5447 lt!192958) (_2!5447 lt!192953)))))

(assert (=> b!122628 (= lt!192963 (reader!0 thiss!1305 (_2!5447 lt!192953)))))

(assert (=> b!122628 e!80366))

(declare-fun res!101635 () Bool)

(assert (=> b!122628 (=> (not res!101635) (not e!80366))))

(assert (=> b!122628 (= res!101635 (= (bitIndex!0 (size!2455 (buf!2895 (_1!5445 lt!192970))) (currentByte!5592 (_1!5445 lt!192970)) (currentBit!5587 (_1!5445 lt!192970))) (bitIndex!0 (size!2455 (buf!2895 (_1!5445 lt!192975))) (currentByte!5592 (_1!5445 lt!192975)) (currentBit!5587 (_1!5445 lt!192975)))))))

(declare-fun lt!192968 () Unit!7549)

(declare-fun lt!192971 () BitStream!4384)

(declare-fun readBitPrefixLemma!0 (BitStream!4384 BitStream!4384) Unit!7549)

(assert (=> b!122628 (= lt!192968 (readBitPrefixLemma!0 lt!192971 (_2!5447 lt!192953)))))

(assert (=> b!122628 (= lt!192975 (readBitPure!0 (BitStream!4385 (buf!2895 (_2!5447 lt!192953)) (currentByte!5592 thiss!1305) (currentBit!5587 thiss!1305))))))

(assert (=> b!122628 (= lt!192970 (readBitPure!0 lt!192971))))

(assert (=> b!122628 (= lt!192971 (BitStream!4385 (buf!2895 (_2!5447 lt!192958)) (currentByte!5592 thiss!1305) (currentBit!5587 thiss!1305)))))

(assert (=> b!122628 e!80369))

(declare-fun res!101636 () Bool)

(assert (=> b!122628 (=> (not res!101636) (not e!80369))))

(assert (=> b!122628 (= res!101636 (isPrefixOf!0 thiss!1305 (_2!5447 lt!192953)))))

(declare-fun lt!192964 () Unit!7549)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4384 BitStream!4384 BitStream!4384) Unit!7549)

(assert (=> b!122628 (= lt!192964 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5447 lt!192958) (_2!5447 lt!192953)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4384 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!10364)

(assert (=> b!122628 (= lt!192953 (appendNLeastSignificantBitsLoop!0 (_2!5447 lt!192958) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!122628 e!80363))

(declare-fun res!101637 () Bool)

(assert (=> b!122628 (=> (not res!101637) (not e!80363))))

(assert (=> b!122628 (= res!101637 (= (size!2455 (buf!2895 thiss!1305)) (size!2455 (buf!2895 (_2!5447 lt!192958)))))))

(declare-fun appendBit!0 (BitStream!4384 Bool) tuple2!10364)

(assert (=> b!122628 (= lt!192958 (appendBit!0 thiss!1305 lt!192952))))

(assert (=> b!122628 (= lt!192952 (not (= (bvand v!199 lt!192974) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!122628 (= lt!192974 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!122629 () Bool)

(declare-fun res!101631 () Bool)

(assert (=> b!122629 (=> (not res!101631) (not e!80369))))

(assert (=> b!122629 (= res!101631 (invariant!0 (currentBit!5587 thiss!1305) (currentByte!5592 thiss!1305) (size!2455 (buf!2895 (_2!5447 lt!192958)))))))

(assert (= (and start!24176 res!101625) b!122627))

(assert (= (and b!122627 res!101628) b!122623))

(assert (= (and b!122623 res!101633) b!122624))

(assert (= (and b!122624 res!101629) b!122628))

(assert (= (and b!122628 res!101637) b!122626))

(assert (= (and b!122626 res!101626) b!122620))

(assert (= (and b!122620 res!101630) b!122618))

(assert (= (and b!122618 res!101627) b!122619))

(assert (= (and b!122628 res!101636) b!122629))

(assert (= (and b!122629 res!101631) b!122622))

(assert (= (and b!122628 res!101635) b!122616))

(assert (= (and b!122628 (not res!101634)) b!122617))

(assert (= (and b!122617 res!101632) b!122625))

(assert (= start!24176 b!122621))

(declare-fun m!186269 () Bool)

(assert (=> b!122617 m!186269))

(declare-fun m!186271 () Bool)

(assert (=> b!122617 m!186271))

(declare-fun m!186273 () Bool)

(assert (=> b!122617 m!186273))

(declare-fun m!186275 () Bool)

(assert (=> b!122617 m!186275))

(declare-fun m!186277 () Bool)

(assert (=> b!122617 m!186277))

(declare-fun m!186279 () Bool)

(assert (=> b!122617 m!186279))

(declare-fun m!186281 () Bool)

(assert (=> b!122617 m!186281))

(declare-fun m!186283 () Bool)

(assert (=> b!122617 m!186283))

(declare-fun m!186285 () Bool)

(assert (=> b!122621 m!186285))

(declare-fun m!186287 () Bool)

(assert (=> b!122619 m!186287))

(declare-fun m!186289 () Bool)

(assert (=> b!122623 m!186289))

(declare-fun m!186291 () Bool)

(assert (=> b!122622 m!186291))

(assert (=> b!122626 m!186273))

(assert (=> b!122626 m!186271))

(declare-fun m!186293 () Bool)

(assert (=> start!24176 m!186293))

(declare-fun m!186295 () Bool)

(assert (=> b!122627 m!186295))

(declare-fun m!186297 () Bool)

(assert (=> b!122628 m!186297))

(declare-fun m!186299 () Bool)

(assert (=> b!122628 m!186299))

(declare-fun m!186301 () Bool)

(assert (=> b!122628 m!186301))

(declare-fun m!186303 () Bool)

(assert (=> b!122628 m!186303))

(declare-fun m!186305 () Bool)

(assert (=> b!122628 m!186305))

(declare-fun m!186307 () Bool)

(assert (=> b!122628 m!186307))

(declare-fun m!186309 () Bool)

(assert (=> b!122628 m!186309))

(declare-fun m!186311 () Bool)

(assert (=> b!122628 m!186311))

(declare-fun m!186313 () Bool)

(assert (=> b!122628 m!186313))

(declare-fun m!186315 () Bool)

(assert (=> b!122628 m!186315))

(declare-fun m!186317 () Bool)

(assert (=> b!122628 m!186317))

(declare-fun m!186319 () Bool)

(assert (=> b!122628 m!186319))

(declare-fun m!186321 () Bool)

(assert (=> b!122628 m!186321))

(declare-fun m!186323 () Bool)

(assert (=> b!122628 m!186323))

(declare-fun m!186325 () Bool)

(assert (=> b!122628 m!186325))

(declare-fun m!186327 () Bool)

(assert (=> b!122628 m!186327))

(declare-fun m!186329 () Bool)

(assert (=> b!122628 m!186329))

(declare-fun m!186331 () Bool)

(assert (=> b!122628 m!186331))

(declare-fun m!186333 () Bool)

(assert (=> b!122628 m!186333))

(declare-fun m!186335 () Bool)

(assert (=> b!122629 m!186335))

(declare-fun m!186337 () Bool)

(assert (=> b!122620 m!186337))

(declare-fun m!186339 () Bool)

(assert (=> b!122618 m!186339))

(assert (=> b!122618 m!186339))

(declare-fun m!186341 () Bool)

(assert (=> b!122618 m!186341))

(push 1)

(assert (not start!24176))

(assert (not b!122623))

(assert (not b!122627))

(assert (not b!122629))

(assert (not b!122626))

(assert (not b!122620))

(assert (not b!122621))

(assert (not b!122622))

(assert (not b!122619))

(assert (not b!122617))

(assert (not b!122618))

(assert (not b!122628))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

