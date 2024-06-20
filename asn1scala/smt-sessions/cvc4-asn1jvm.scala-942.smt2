; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26726 () Bool)

(assert start!26726)

(declare-fun b!137532 () Bool)

(declare-fun e!91403 () Bool)

(declare-datatypes ((array!6235 0))(
  ( (array!6236 (arr!3509 (Array (_ BitVec 32) (_ BitVec 8))) (size!2823 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4910 0))(
  ( (BitStream!4911 (buf!3230 array!6235) (currentByte!6037 (_ BitVec 32)) (currentBit!6032 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4910)

(declare-fun array_inv!2612 (array!6235) Bool)

(assert (=> b!137532 (= e!91403 (array_inv!2612 (buf!3230 thiss!1634)))))

(declare-fun arr!237 () array!6235)

(declare-datatypes ((tuple2!11994 0))(
  ( (tuple2!11995 (_1!6320 BitStream!4910) (_2!6320 BitStream!4910)) )
))
(declare-fun lt!214331 () tuple2!11994)

(declare-datatypes ((tuple2!11996 0))(
  ( (tuple2!11997 (_1!6321 BitStream!4910) (_2!6321 (_ BitVec 8))) )
))
(declare-fun lt!214333 () tuple2!11996)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun e!91411 () Bool)

(declare-fun b!137533 () Bool)

(assert (=> b!137533 (= e!91411 (and (= (_2!6321 lt!214333) (select (arr!3509 arr!237) from!447)) (= (_1!6321 lt!214333) (_2!6320 lt!214331))))))

(declare-fun readBytePure!0 (BitStream!4910) tuple2!11996)

(assert (=> b!137533 (= lt!214333 (readBytePure!0 (_1!6320 lt!214331)))))

(declare-datatypes ((Unit!8593 0))(
  ( (Unit!8594) )
))
(declare-datatypes ((tuple2!11998 0))(
  ( (tuple2!11999 (_1!6322 Unit!8593) (_2!6322 BitStream!4910)) )
))
(declare-fun lt!214334 () tuple2!11998)

(declare-fun reader!0 (BitStream!4910 BitStream!4910) tuple2!11994)

(assert (=> b!137533 (= lt!214331 (reader!0 thiss!1634 (_2!6322 lt!214334)))))

(declare-fun res!114539 () Bool)

(declare-fun e!91404 () Bool)

(assert (=> start!26726 (=> (not res!114539) (not e!91404))))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> start!26726 (= res!114539 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2823 arr!237))))))

(assert (=> start!26726 e!91404))

(assert (=> start!26726 true))

(assert (=> start!26726 (array_inv!2612 arr!237)))

(declare-fun inv!12 (BitStream!4910) Bool)

(assert (=> start!26726 (and (inv!12 thiss!1634) e!91403)))

(declare-fun b!137534 () Bool)

(declare-fun e!91402 () Bool)

(assert (=> b!137534 (= e!91402 true)))

(declare-fun lt!214344 () (_ BitVec 64))

(declare-fun lt!214336 () tuple2!11998)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!137534 (= lt!214344 (bitIndex!0 (size!2823 (buf!3230 (_2!6322 lt!214336))) (currentByte!6037 (_2!6322 lt!214336)) (currentBit!6032 (_2!6322 lt!214336))))))

(declare-fun lt!214343 () (_ BitVec 64))

(assert (=> b!137534 (= lt!214343 (bitIndex!0 (size!2823 (buf!3230 thiss!1634)) (currentByte!6037 thiss!1634) (currentBit!6032 thiss!1634)))))

(declare-fun b!137535 () Bool)

(declare-fun res!114547 () Bool)

(assert (=> b!137535 (=> (not res!114547) (not e!91411))))

(declare-fun isPrefixOf!0 (BitStream!4910 BitStream!4910) Bool)

(assert (=> b!137535 (= res!114547 (isPrefixOf!0 thiss!1634 (_2!6322 lt!214334)))))

(declare-fun b!137536 () Bool)

(declare-fun e!91409 () Bool)

(assert (=> b!137536 (= e!91409 e!91402)))

(declare-fun res!114545 () Bool)

(assert (=> b!137536 (=> res!114545 e!91402)))

(assert (=> b!137536 (= res!114545 (not (= (size!2823 (buf!3230 thiss!1634)) (size!2823 (buf!3230 (_2!6322 lt!214336))))))))

(declare-datatypes ((tuple2!12000 0))(
  ( (tuple2!12001 (_1!6323 BitStream!4910) (_2!6323 array!6235)) )
))
(declare-fun lt!214337 () tuple2!12000)

(declare-fun arrayRangesEq!226 (array!6235 array!6235 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!137536 (arrayRangesEq!226 arr!237 (_2!6323 lt!214337) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!214340 () tuple2!12000)

(declare-fun lt!214338 () Unit!8593)

(declare-fun arrayRangesEqTransitive!28 (array!6235 array!6235 array!6235 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8593)

(assert (=> b!137536 (= lt!214338 (arrayRangesEqTransitive!28 arr!237 (_2!6323 lt!214340) (_2!6323 lt!214337) #b00000000000000000000000000000000 to!404 to!404))))

(assert (=> b!137536 (arrayRangesEq!226 (_2!6323 lt!214340) (_2!6323 lt!214337) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!214316 () Unit!8593)

(declare-fun arrayRangesEqSymmetricLemma!39 (array!6235 array!6235 (_ BitVec 32) (_ BitVec 32)) Unit!8593)

(assert (=> b!137536 (= lt!214316 (arrayRangesEqSymmetricLemma!39 (_2!6323 lt!214337) (_2!6323 lt!214340) #b00000000000000000000000000000000 to!404))))

(declare-fun b!137537 () Bool)

(declare-fun res!114550 () Bool)

(assert (=> b!137537 (=> (not res!114550) (not e!91404))))

(assert (=> b!137537 (= res!114550 (bvslt from!447 to!404))))

(declare-fun b!137538 () Bool)

(declare-fun e!91406 () Bool)

(declare-fun lt!214341 () tuple2!11996)

(declare-fun lt!214322 () tuple2!11996)

(assert (=> b!137538 (= e!91406 (= (_2!6321 lt!214341) (_2!6321 lt!214322)))))

(declare-fun b!137539 () Bool)

(declare-fun e!91405 () Bool)

(declare-fun e!91413 () Bool)

(assert (=> b!137539 (= e!91405 e!91413)))

(declare-fun res!114540 () Bool)

(assert (=> b!137539 (=> (not res!114540) (not e!91413))))

(declare-fun lt!214330 () (_ BitVec 64))

(assert (=> b!137539 (= res!114540 (= (bitIndex!0 (size!2823 (buf!3230 (_2!6322 lt!214336))) (currentByte!6037 (_2!6322 lt!214336)) (currentBit!6032 (_2!6322 lt!214336))) (bvadd (bitIndex!0 (size!2823 (buf!3230 (_2!6322 lt!214334))) (currentByte!6037 (_2!6322 lt!214334)) (currentBit!6032 (_2!6322 lt!214334))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!214330))))))

(assert (=> b!137539 (= lt!214330 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!137540 () Bool)

(declare-fun res!114542 () Bool)

(assert (=> b!137540 (=> (not res!114542) (not e!91404))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!137540 (= res!114542 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2823 (buf!3230 thiss!1634))) ((_ sign_extend 32) (currentByte!6037 thiss!1634)) ((_ sign_extend 32) (currentBit!6032 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!137541 () Bool)

(declare-fun e!91407 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!137541 (= e!91407 (invariant!0 (currentBit!6032 thiss!1634) (currentByte!6037 thiss!1634) (size!2823 (buf!3230 (_2!6322 lt!214334)))))))

(declare-fun b!137542 () Bool)

(declare-fun res!114552 () Bool)

(assert (=> b!137542 (=> (not res!114552) (not e!91411))))

(assert (=> b!137542 (= res!114552 (= (bitIndex!0 (size!2823 (buf!3230 (_2!6322 lt!214334))) (currentByte!6037 (_2!6322 lt!214334)) (currentBit!6032 (_2!6322 lt!214334))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2823 (buf!3230 thiss!1634)) (currentByte!6037 thiss!1634) (currentBit!6032 thiss!1634)))))))

(declare-fun b!137543 () Bool)

(declare-fun res!114543 () Bool)

(assert (=> b!137543 (=> (not res!114543) (not e!91404))))

(assert (=> b!137543 (= res!114543 (invariant!0 (currentBit!6032 thiss!1634) (currentByte!6037 thiss!1634) (size!2823 (buf!3230 thiss!1634))))))

(declare-fun b!137544 () Bool)

(assert (=> b!137544 (= e!91404 (not e!91409))))

(declare-fun res!114541 () Bool)

(assert (=> b!137544 (=> res!114541 e!91409)))

(assert (=> b!137544 (= res!114541 (not (arrayRangesEq!226 (_2!6323 lt!214337) (_2!6323 lt!214340) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!214323 () tuple2!12000)

(assert (=> b!137544 (arrayRangesEq!226 (_2!6323 lt!214337) (_2!6323 lt!214323) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!214318 () tuple2!11994)

(declare-fun lt!214335 () Unit!8593)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!4910 array!6235 (_ BitVec 32) (_ BitVec 32)) Unit!8593)

(assert (=> b!137544 (= lt!214335 (readByteArrayLoopArrayPrefixLemma!0 (_1!6320 lt!214318) arr!237 from!447 to!404))))

(declare-fun lt!214328 () array!6235)

(declare-fun readByteArrayLoopPure!0 (BitStream!4910 array!6235 (_ BitVec 32) (_ BitVec 32)) tuple2!12000)

(declare-fun withMovedByteIndex!0 (BitStream!4910 (_ BitVec 32)) BitStream!4910)

(assert (=> b!137544 (= lt!214323 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6320 lt!214318) #b00000000000000000000000000000001) lt!214328 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!214319 () tuple2!11994)

(assert (=> b!137544 (= lt!214340 (readByteArrayLoopPure!0 (_1!6320 lt!214319) lt!214328 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!214327 () tuple2!11996)

(assert (=> b!137544 (= lt!214328 (array!6236 (store (arr!3509 arr!237) from!447 (_2!6321 lt!214327)) (size!2823 arr!237)))))

(declare-fun lt!214325 () (_ BitVec 32))

(assert (=> b!137544 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2823 (buf!3230 (_2!6322 lt!214336)))) ((_ sign_extend 32) (currentByte!6037 (_2!6322 lt!214334))) ((_ sign_extend 32) (currentBit!6032 (_2!6322 lt!214334))) lt!214325)))

(declare-fun lt!214326 () Unit!8593)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4910 array!6235 (_ BitVec 32)) Unit!8593)

(assert (=> b!137544 (= lt!214326 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6322 lt!214334) (buf!3230 (_2!6322 lt!214336)) lt!214325))))

(assert (=> b!137544 (= (_1!6323 lt!214337) (_2!6320 lt!214318))))

(assert (=> b!137544 (= lt!214337 (readByteArrayLoopPure!0 (_1!6320 lt!214318) arr!237 from!447 to!404))))

(assert (=> b!137544 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2823 (buf!3230 (_2!6322 lt!214336)))) ((_ sign_extend 32) (currentByte!6037 thiss!1634)) ((_ sign_extend 32) (currentBit!6032 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!214320 () Unit!8593)

(assert (=> b!137544 (= lt!214320 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3230 (_2!6322 lt!214336)) (bvsub to!404 from!447)))))

(assert (=> b!137544 (= (_2!6321 lt!214327) (select (arr!3509 arr!237) from!447))))

(assert (=> b!137544 (= lt!214327 (readBytePure!0 (_1!6320 lt!214318)))))

(assert (=> b!137544 (= lt!214319 (reader!0 (_2!6322 lt!214334) (_2!6322 lt!214336)))))

(assert (=> b!137544 (= lt!214318 (reader!0 thiss!1634 (_2!6322 lt!214336)))))

(assert (=> b!137544 e!91406))

(declare-fun res!114544 () Bool)

(assert (=> b!137544 (=> (not res!114544) (not e!91406))))

(assert (=> b!137544 (= res!114544 (= (bitIndex!0 (size!2823 (buf!3230 (_1!6321 lt!214341))) (currentByte!6037 (_1!6321 lt!214341)) (currentBit!6032 (_1!6321 lt!214341))) (bitIndex!0 (size!2823 (buf!3230 (_1!6321 lt!214322))) (currentByte!6037 (_1!6321 lt!214322)) (currentBit!6032 (_1!6321 lt!214322)))))))

(declare-fun lt!214339 () Unit!8593)

(declare-fun lt!214342 () BitStream!4910)

(declare-fun readBytePrefixLemma!0 (BitStream!4910 BitStream!4910) Unit!8593)

(assert (=> b!137544 (= lt!214339 (readBytePrefixLemma!0 lt!214342 (_2!6322 lt!214336)))))

(assert (=> b!137544 (= lt!214322 (readBytePure!0 (BitStream!4911 (buf!3230 (_2!6322 lt!214336)) (currentByte!6037 thiss!1634) (currentBit!6032 thiss!1634))))))

(assert (=> b!137544 (= lt!214341 (readBytePure!0 lt!214342))))

(assert (=> b!137544 (= lt!214342 (BitStream!4911 (buf!3230 (_2!6322 lt!214334)) (currentByte!6037 thiss!1634) (currentBit!6032 thiss!1634)))))

(assert (=> b!137544 e!91407))

(declare-fun res!114551 () Bool)

(assert (=> b!137544 (=> (not res!114551) (not e!91407))))

(assert (=> b!137544 (= res!114551 (isPrefixOf!0 thiss!1634 (_2!6322 lt!214336)))))

(declare-fun lt!214321 () Unit!8593)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4910 BitStream!4910 BitStream!4910) Unit!8593)

(assert (=> b!137544 (= lt!214321 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6322 lt!214334) (_2!6322 lt!214336)))))

(assert (=> b!137544 e!91405))

(declare-fun res!114549 () Bool)

(assert (=> b!137544 (=> (not res!114549) (not e!91405))))

(assert (=> b!137544 (= res!114549 (= (size!2823 (buf!3230 (_2!6322 lt!214334))) (size!2823 (buf!3230 (_2!6322 lt!214336)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4910 array!6235 (_ BitVec 32) (_ BitVec 32)) tuple2!11998)

(assert (=> b!137544 (= lt!214336 (appendByteArrayLoop!0 (_2!6322 lt!214334) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!137544 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2823 (buf!3230 (_2!6322 lt!214334)))) ((_ sign_extend 32) (currentByte!6037 (_2!6322 lt!214334))) ((_ sign_extend 32) (currentBit!6032 (_2!6322 lt!214334))) lt!214325)))

(assert (=> b!137544 (= lt!214325 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!214329 () Unit!8593)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4910 BitStream!4910 (_ BitVec 64) (_ BitVec 32)) Unit!8593)

(assert (=> b!137544 (= lt!214329 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6322 lt!214334) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!137544 e!91411))

(declare-fun res!114538 () Bool)

(assert (=> b!137544 (=> (not res!114538) (not e!91411))))

(assert (=> b!137544 (= res!114538 (= (size!2823 (buf!3230 thiss!1634)) (size!2823 (buf!3230 (_2!6322 lt!214334)))))))

(declare-fun appendByte!0 (BitStream!4910 (_ BitVec 8)) tuple2!11998)

(assert (=> b!137544 (= lt!214334 (appendByte!0 thiss!1634 (select (arr!3509 arr!237) from!447)))))

(declare-fun b!137545 () Bool)

(declare-fun e!91412 () Bool)

(assert (=> b!137545 (= e!91413 (not e!91412))))

(declare-fun res!114548 () Bool)

(assert (=> b!137545 (=> res!114548 e!91412)))

(declare-fun lt!214332 () tuple2!11994)

(declare-fun lt!214324 () tuple2!12000)

(assert (=> b!137545 (= res!114548 (or (not (= (size!2823 (_2!6323 lt!214324)) (size!2823 arr!237))) (not (= (_1!6323 lt!214324) (_2!6320 lt!214332)))))))

(assert (=> b!137545 (= lt!214324 (readByteArrayLoopPure!0 (_1!6320 lt!214332) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!137545 (validate_offset_bits!1 ((_ sign_extend 32) (size!2823 (buf!3230 (_2!6322 lt!214336)))) ((_ sign_extend 32) (currentByte!6037 (_2!6322 lt!214334))) ((_ sign_extend 32) (currentBit!6032 (_2!6322 lt!214334))) lt!214330)))

(declare-fun lt!214317 () Unit!8593)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4910 array!6235 (_ BitVec 64)) Unit!8593)

(assert (=> b!137545 (= lt!214317 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6322 lt!214334) (buf!3230 (_2!6322 lt!214336)) lt!214330))))

(assert (=> b!137545 (= lt!214332 (reader!0 (_2!6322 lt!214334) (_2!6322 lt!214336)))))

(declare-fun b!137546 () Bool)

(declare-fun res!114546 () Bool)

(assert (=> b!137546 (=> (not res!114546) (not e!91413))))

(assert (=> b!137546 (= res!114546 (isPrefixOf!0 (_2!6322 lt!214334) (_2!6322 lt!214336)))))

(declare-fun b!137547 () Bool)

(assert (=> b!137547 (= e!91412 (not (arrayRangesEq!226 arr!237 (_2!6323 lt!214324) #b00000000000000000000000000000000 to!404)))))

(assert (= (and start!26726 res!114539) b!137540))

(assert (= (and b!137540 res!114542) b!137537))

(assert (= (and b!137537 res!114550) b!137543))

(assert (= (and b!137543 res!114543) b!137544))

(assert (= (and b!137544 res!114538) b!137542))

(assert (= (and b!137542 res!114552) b!137535))

(assert (= (and b!137535 res!114547) b!137533))

(assert (= (and b!137544 res!114549) b!137539))

(assert (= (and b!137539 res!114540) b!137546))

(assert (= (and b!137546 res!114546) b!137545))

(assert (= (and b!137545 (not res!114548)) b!137547))

(assert (= (and b!137544 res!114551) b!137541))

(assert (= (and b!137544 res!114544) b!137538))

(assert (= (and b!137544 (not res!114541)) b!137536))

(assert (= (and b!137536 (not res!114545)) b!137534))

(assert (= start!26726 b!137532))

(declare-fun m!211151 () Bool)

(assert (=> b!137539 m!211151))

(declare-fun m!211153 () Bool)

(assert (=> b!137539 m!211153))

(assert (=> b!137542 m!211153))

(declare-fun m!211155 () Bool)

(assert (=> b!137542 m!211155))

(declare-fun m!211157 () Bool)

(assert (=> b!137541 m!211157))

(declare-fun m!211159 () Bool)

(assert (=> b!137544 m!211159))

(declare-fun m!211161 () Bool)

(assert (=> b!137544 m!211161))

(declare-fun m!211163 () Bool)

(assert (=> b!137544 m!211163))

(declare-fun m!211165 () Bool)

(assert (=> b!137544 m!211165))

(declare-fun m!211167 () Bool)

(assert (=> b!137544 m!211167))

(declare-fun m!211169 () Bool)

(assert (=> b!137544 m!211169))

(declare-fun m!211171 () Bool)

(assert (=> b!137544 m!211171))

(declare-fun m!211173 () Bool)

(assert (=> b!137544 m!211173))

(declare-fun m!211175 () Bool)

(assert (=> b!137544 m!211175))

(declare-fun m!211177 () Bool)

(assert (=> b!137544 m!211177))

(declare-fun m!211179 () Bool)

(assert (=> b!137544 m!211179))

(declare-fun m!211181 () Bool)

(assert (=> b!137544 m!211181))

(declare-fun m!211183 () Bool)

(assert (=> b!137544 m!211183))

(declare-fun m!211185 () Bool)

(assert (=> b!137544 m!211185))

(declare-fun m!211187 () Bool)

(assert (=> b!137544 m!211187))

(declare-fun m!211189 () Bool)

(assert (=> b!137544 m!211189))

(declare-fun m!211191 () Bool)

(assert (=> b!137544 m!211191))

(declare-fun m!211193 () Bool)

(assert (=> b!137544 m!211193))

(declare-fun m!211195 () Bool)

(assert (=> b!137544 m!211195))

(declare-fun m!211197 () Bool)

(assert (=> b!137544 m!211197))

(declare-fun m!211199 () Bool)

(assert (=> b!137544 m!211199))

(assert (=> b!137544 m!211159))

(declare-fun m!211201 () Bool)

(assert (=> b!137544 m!211201))

(declare-fun m!211203 () Bool)

(assert (=> b!137544 m!211203))

(declare-fun m!211205 () Bool)

(assert (=> b!137544 m!211205))

(declare-fun m!211207 () Bool)

(assert (=> b!137544 m!211207))

(assert (=> b!137544 m!211177))

(declare-fun m!211209 () Bool)

(assert (=> b!137544 m!211209))

(declare-fun m!211211 () Bool)

(assert (=> b!137544 m!211211))

(declare-fun m!211213 () Bool)

(assert (=> b!137546 m!211213))

(declare-fun m!211215 () Bool)

(assert (=> start!26726 m!211215))

(declare-fun m!211217 () Bool)

(assert (=> start!26726 m!211217))

(declare-fun m!211219 () Bool)

(assert (=> b!137540 m!211219))

(assert (=> b!137533 m!211177))

(declare-fun m!211221 () Bool)

(assert (=> b!137533 m!211221))

(declare-fun m!211223 () Bool)

(assert (=> b!137533 m!211223))

(assert (=> b!137534 m!211151))

(assert (=> b!137534 m!211155))

(declare-fun m!211225 () Bool)

(assert (=> b!137535 m!211225))

(declare-fun m!211227 () Bool)

(assert (=> b!137532 m!211227))

(declare-fun m!211229 () Bool)

(assert (=> b!137543 m!211229))

(declare-fun m!211231 () Bool)

(assert (=> b!137536 m!211231))

(declare-fun m!211233 () Bool)

(assert (=> b!137536 m!211233))

(declare-fun m!211235 () Bool)

(assert (=> b!137536 m!211235))

(declare-fun m!211237 () Bool)

(assert (=> b!137536 m!211237))

(declare-fun m!211239 () Bool)

(assert (=> b!137545 m!211239))

(declare-fun m!211241 () Bool)

(assert (=> b!137545 m!211241))

(declare-fun m!211243 () Bool)

(assert (=> b!137545 m!211243))

(assert (=> b!137545 m!211161))

(declare-fun m!211245 () Bool)

(assert (=> b!137547 m!211245))

(push 1)

(assert (not b!137532))

(assert (not b!137547))

(assert (not b!137544))

(assert (not b!137539))

(assert (not b!137545))

(assert (not b!137535))

(assert (not b!137534))

(assert (not b!137546))

(assert (not b!137543))

(assert (not b!137536))

(assert (not b!137541))

(assert (not start!26726))

(assert (not b!137542))

(assert (not b!137533))

(assert (not b!137540))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

