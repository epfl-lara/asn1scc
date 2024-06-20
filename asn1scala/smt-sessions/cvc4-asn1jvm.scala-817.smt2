; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24168 () Bool)

(assert start!24168)

(declare-fun res!101469 () Bool)

(declare-fun e!80238 () Bool)

(assert (=> start!24168 (=> (not res!101469) (not e!80238))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!24168 (= res!101469 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!24168 e!80238))

(assert (=> start!24168 true))

(declare-datatypes ((array!5418 0))(
  ( (array!5419 (arr!3044 (Array (_ BitVec 32) (_ BitVec 8))) (size!2451 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4376 0))(
  ( (BitStream!4377 (buf!2891 array!5418) (currentByte!5588 (_ BitVec 32)) (currentBit!5583 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4376)

(declare-fun e!80239 () Bool)

(declare-fun inv!12 (BitStream!4376) Bool)

(assert (=> start!24168 (and (inv!12 thiss!1305) e!80239)))

(declare-fun b!122448 () Bool)

(declare-fun res!101477 () Bool)

(declare-fun e!80231 () Bool)

(assert (=> b!122448 (=> (not res!101477) (not e!80231))))

(declare-datatypes ((Unit!7541 0))(
  ( (Unit!7542) )
))
(declare-datatypes ((tuple2!10328 0))(
  ( (tuple2!10329 (_1!5429 Unit!7541) (_2!5429 BitStream!4376)) )
))
(declare-fun lt!192601 () tuple2!10328)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!122448 (= res!101477 (invariant!0 (currentBit!5583 thiss!1305) (currentByte!5588 thiss!1305) (size!2451 (buf!2891 (_2!5429 lt!192601)))))))

(declare-fun b!122449 () Bool)

(declare-fun e!80234 () Bool)

(declare-datatypes ((tuple2!10330 0))(
  ( (tuple2!10331 (_1!5430 BitStream!4376) (_2!5430 Bool)) )
))
(declare-fun lt!192624 () tuple2!10330)

(declare-fun lt!192627 () tuple2!10330)

(assert (=> b!122449 (= e!80234 (= (_2!5430 lt!192624) (_2!5430 lt!192627)))))

(declare-fun b!122450 () Bool)

(declare-fun e!80240 () Bool)

(assert (=> b!122450 (= e!80238 e!80240)))

(declare-fun res!101479 () Bool)

(assert (=> b!122450 (=> (not res!101479) (not e!80240))))

(declare-fun lt!192609 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!122450 (= res!101479 (validate_offset_bits!1 ((_ sign_extend 32) (size!2451 (buf!2891 thiss!1305))) ((_ sign_extend 32) (currentByte!5588 thiss!1305)) ((_ sign_extend 32) (currentBit!5583 thiss!1305)) lt!192609))))

(assert (=> b!122450 (= lt!192609 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!122451 () Bool)

(declare-fun lt!192619 () tuple2!10328)

(assert (=> b!122451 (= e!80231 (invariant!0 (currentBit!5583 thiss!1305) (currentByte!5588 thiss!1305) (size!2451 (buf!2891 (_2!5429 lt!192619)))))))

(declare-fun b!122452 () Bool)

(declare-fun array_inv!2253 (array!5418) Bool)

(assert (=> b!122452 (= e!80239 (array_inv!2253 (buf!2891 thiss!1305)))))

(declare-fun b!122453 () Bool)

(declare-fun res!101478 () Bool)

(declare-fun e!80235 () Bool)

(assert (=> b!122453 (=> (not res!101478) (not e!80235))))

(declare-fun isPrefixOf!0 (BitStream!4376 BitStream!4376) Bool)

(assert (=> b!122453 (= res!101478 (isPrefixOf!0 thiss!1305 (_2!5429 lt!192601)))))

(declare-fun b!122454 () Bool)

(declare-datatypes ((tuple2!10332 0))(
  ( (tuple2!10333 (_1!5431 BitStream!4376) (_2!5431 (_ BitVec 64))) )
))
(declare-fun lt!192607 () tuple2!10332)

(declare-fun e!80232 () Bool)

(declare-fun lt!192622 () BitStream!4376)

(declare-datatypes ((tuple2!10334 0))(
  ( (tuple2!10335 (_1!5432 BitStream!4376) (_2!5432 BitStream!4376)) )
))
(declare-fun lt!192608 () tuple2!10334)

(declare-fun lt!192615 () tuple2!10332)

(declare-fun lt!192614 () (_ BitVec 64))

(declare-fun lt!192602 () tuple2!10334)

(declare-fun lt!192613 () (_ BitVec 64))

(assert (=> b!122454 (= e!80232 (and (= lt!192613 (bvsub lt!192614 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!5432 lt!192608) lt!192622)) (and (= (_2!5431 lt!192607) (_2!5431 lt!192615)) (= (_1!5431 lt!192607) (_2!5432 lt!192602))))))))

(declare-fun b!122455 () Bool)

(declare-fun e!80241 () Bool)

(assert (=> b!122455 (= e!80241 e!80235)))

(declare-fun res!101480 () Bool)

(assert (=> b!122455 (=> (not res!101480) (not e!80235))))

(declare-fun lt!192623 () (_ BitVec 64))

(declare-fun lt!192618 () (_ BitVec 64))

(assert (=> b!122455 (= res!101480 (= lt!192623 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!192618)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!122455 (= lt!192623 (bitIndex!0 (size!2451 (buf!2891 (_2!5429 lt!192601))) (currentByte!5588 (_2!5429 lt!192601)) (currentBit!5583 (_2!5429 lt!192601))))))

(assert (=> b!122455 (= lt!192618 (bitIndex!0 (size!2451 (buf!2891 thiss!1305)) (currentByte!5588 thiss!1305) (currentBit!5583 thiss!1305)))))

(declare-fun b!122456 () Bool)

(declare-fun res!101481 () Bool)

(assert (=> b!122456 (=> (not res!101481) (not e!80240))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!122456 (= res!101481 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!122457 () Bool)

(declare-fun e!80237 () Bool)

(assert (=> b!122457 (= e!80240 (not e!80237))))

(declare-fun res!101472 () Bool)

(assert (=> b!122457 (=> res!101472 e!80237)))

(assert (=> b!122457 (= res!101472 (not (= (_1!5431 lt!192615) (_2!5432 lt!192608))))))

(declare-fun lt!192621 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4376 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10332)

(assert (=> b!122457 (= lt!192615 (readNLeastSignificantBitsLoopPure!0 (_1!5432 lt!192608) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!192621))))

(declare-fun lt!192605 () (_ BitVec 64))

(assert (=> b!122457 (validate_offset_bits!1 ((_ sign_extend 32) (size!2451 (buf!2891 (_2!5429 lt!192619)))) ((_ sign_extend 32) (currentByte!5588 (_2!5429 lt!192601))) ((_ sign_extend 32) (currentBit!5583 (_2!5429 lt!192601))) lt!192605)))

(declare-fun lt!192611 () Unit!7541)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4376 array!5418 (_ BitVec 64)) Unit!7541)

(assert (=> b!122457 (= lt!192611 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5429 lt!192601) (buf!2891 (_2!5429 lt!192619)) lt!192605))))

(assert (=> b!122457 (= lt!192605 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!192625 () tuple2!10330)

(declare-fun lt!192606 () (_ BitVec 64))

(declare-fun lt!192599 () (_ BitVec 64))

(assert (=> b!122457 (= lt!192621 (bvor lt!192599 (ite (_2!5430 lt!192625) lt!192606 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!122457 (= lt!192607 (readNLeastSignificantBitsLoopPure!0 (_1!5432 lt!192602) nBits!396 i!615 lt!192599))))

(assert (=> b!122457 (validate_offset_bits!1 ((_ sign_extend 32) (size!2451 (buf!2891 (_2!5429 lt!192619)))) ((_ sign_extend 32) (currentByte!5588 thiss!1305)) ((_ sign_extend 32) (currentBit!5583 thiss!1305)) lt!192609)))

(declare-fun lt!192616 () Unit!7541)

(assert (=> b!122457 (= lt!192616 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2891 (_2!5429 lt!192619)) lt!192609))))

(assert (=> b!122457 (= lt!192599 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!192604 () Bool)

(assert (=> b!122457 (= (_2!5430 lt!192625) lt!192604)))

(declare-fun readBitPure!0 (BitStream!4376) tuple2!10330)

(assert (=> b!122457 (= lt!192625 (readBitPure!0 (_1!5432 lt!192602)))))

(declare-fun reader!0 (BitStream!4376 BitStream!4376) tuple2!10334)

(assert (=> b!122457 (= lt!192608 (reader!0 (_2!5429 lt!192601) (_2!5429 lt!192619)))))

(assert (=> b!122457 (= lt!192602 (reader!0 thiss!1305 (_2!5429 lt!192619)))))

(assert (=> b!122457 e!80234))

(declare-fun res!101470 () Bool)

(assert (=> b!122457 (=> (not res!101470) (not e!80234))))

(assert (=> b!122457 (= res!101470 (= (bitIndex!0 (size!2451 (buf!2891 (_1!5430 lt!192624))) (currentByte!5588 (_1!5430 lt!192624)) (currentBit!5583 (_1!5430 lt!192624))) (bitIndex!0 (size!2451 (buf!2891 (_1!5430 lt!192627))) (currentByte!5588 (_1!5430 lt!192627)) (currentBit!5583 (_1!5430 lt!192627)))))))

(declare-fun lt!192626 () Unit!7541)

(declare-fun lt!192600 () BitStream!4376)

(declare-fun readBitPrefixLemma!0 (BitStream!4376 BitStream!4376) Unit!7541)

(assert (=> b!122457 (= lt!192626 (readBitPrefixLemma!0 lt!192600 (_2!5429 lt!192619)))))

(assert (=> b!122457 (= lt!192627 (readBitPure!0 (BitStream!4377 (buf!2891 (_2!5429 lt!192619)) (currentByte!5588 thiss!1305) (currentBit!5583 thiss!1305))))))

(assert (=> b!122457 (= lt!192624 (readBitPure!0 lt!192600))))

(assert (=> b!122457 (= lt!192600 (BitStream!4377 (buf!2891 (_2!5429 lt!192601)) (currentByte!5588 thiss!1305) (currentBit!5583 thiss!1305)))))

(assert (=> b!122457 e!80231))

(declare-fun res!101474 () Bool)

(assert (=> b!122457 (=> (not res!101474) (not e!80231))))

(assert (=> b!122457 (= res!101474 (isPrefixOf!0 thiss!1305 (_2!5429 lt!192619)))))

(declare-fun lt!192603 () Unit!7541)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4376 BitStream!4376 BitStream!4376) Unit!7541)

(assert (=> b!122457 (= lt!192603 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5429 lt!192601) (_2!5429 lt!192619)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4376 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!10328)

(assert (=> b!122457 (= lt!192619 (appendNLeastSignificantBitsLoop!0 (_2!5429 lt!192601) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!122457 e!80241))

(declare-fun res!101473 () Bool)

(assert (=> b!122457 (=> (not res!101473) (not e!80241))))

(assert (=> b!122457 (= res!101473 (= (size!2451 (buf!2891 thiss!1305)) (size!2451 (buf!2891 (_2!5429 lt!192601)))))))

(declare-fun appendBit!0 (BitStream!4376 Bool) tuple2!10328)

(assert (=> b!122457 (= lt!192601 (appendBit!0 thiss!1305 lt!192604))))

(assert (=> b!122457 (= lt!192604 (not (= (bvand v!199 lt!192606) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!122457 (= lt!192606 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!122458 () Bool)

(declare-fun res!101476 () Bool)

(assert (=> b!122458 (=> (not res!101476) (not e!80240))))

(assert (=> b!122458 (= res!101476 (bvslt i!615 nBits!396))))

(declare-fun b!122459 () Bool)

(declare-fun e!80233 () Bool)

(assert (=> b!122459 (= e!80235 e!80233)))

(declare-fun res!101475 () Bool)

(assert (=> b!122459 (=> (not res!101475) (not e!80233))))

(declare-fun lt!192612 () tuple2!10330)

(assert (=> b!122459 (= res!101475 (and (= (_2!5430 lt!192612) lt!192604) (= (_1!5430 lt!192612) (_2!5429 lt!192601))))))

(declare-fun readerFrom!0 (BitStream!4376 (_ BitVec 32) (_ BitVec 32)) BitStream!4376)

(assert (=> b!122459 (= lt!192612 (readBitPure!0 (readerFrom!0 (_2!5429 lt!192601) (currentBit!5583 thiss!1305) (currentByte!5588 thiss!1305))))))

(declare-fun b!122460 () Bool)

(assert (=> b!122460 (= e!80233 (= (bitIndex!0 (size!2451 (buf!2891 (_1!5430 lt!192612))) (currentByte!5588 (_1!5430 lt!192612)) (currentBit!5583 (_1!5430 lt!192612))) lt!192623))))

(declare-fun b!122461 () Bool)

(assert (=> b!122461 (= e!80237 true)))

(assert (=> b!122461 e!80232))

(declare-fun res!101471 () Bool)

(assert (=> b!122461 (=> (not res!101471) (not e!80232))))

(declare-fun lt!192617 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4376 (_ BitVec 64)) BitStream!4376)

(assert (=> b!122461 (= res!101471 (= (_1!5432 lt!192608) (withMovedBitIndex!0 (_2!5432 lt!192608) (bvsub lt!192614 lt!192617))))))

(assert (=> b!122461 (= lt!192614 (bitIndex!0 (size!2451 (buf!2891 (_2!5429 lt!192601))) (currentByte!5588 (_2!5429 lt!192601)) (currentBit!5583 (_2!5429 lt!192601))))))

(assert (=> b!122461 (= (_1!5432 lt!192602) (withMovedBitIndex!0 (_2!5432 lt!192602) (bvsub lt!192613 lt!192617)))))

(assert (=> b!122461 (= lt!192617 (bitIndex!0 (size!2451 (buf!2891 (_2!5429 lt!192619))) (currentByte!5588 (_2!5429 lt!192619)) (currentBit!5583 (_2!5429 lt!192619))))))

(assert (=> b!122461 (= lt!192613 (bitIndex!0 (size!2451 (buf!2891 thiss!1305)) (currentByte!5588 thiss!1305) (currentBit!5583 thiss!1305)))))

(declare-fun lt!192620 () tuple2!10332)

(assert (=> b!122461 (and (= (_2!5431 lt!192607) (_2!5431 lt!192620)) (= (_1!5431 lt!192607) (_1!5431 lt!192620)))))

(declare-fun lt!192610 () Unit!7541)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4376 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7541)

(assert (=> b!122461 (= lt!192610 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5432 lt!192602) nBits!396 i!615 lt!192599))))

(assert (=> b!122461 (= lt!192620 (readNLeastSignificantBitsLoopPure!0 lt!192622 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!192621))))

(assert (=> b!122461 (= lt!192622 (withMovedBitIndex!0 (_1!5432 lt!192602) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and start!24168 res!101469) b!122450))

(assert (= (and b!122450 res!101479) b!122456))

(assert (= (and b!122456 res!101481) b!122458))

(assert (= (and b!122458 res!101476) b!122457))

(assert (= (and b!122457 res!101473) b!122455))

(assert (= (and b!122455 res!101480) b!122453))

(assert (= (and b!122453 res!101478) b!122459))

(assert (= (and b!122459 res!101475) b!122460))

(assert (= (and b!122457 res!101474) b!122448))

(assert (= (and b!122448 res!101477) b!122451))

(assert (= (and b!122457 res!101470) b!122449))

(assert (= (and b!122457 (not res!101472)) b!122461))

(assert (= (and b!122461 res!101471) b!122454))

(assert (= start!24168 b!122452))

(declare-fun m!185973 () Bool)

(assert (=> b!122452 m!185973))

(declare-fun m!185975 () Bool)

(assert (=> b!122448 m!185975))

(declare-fun m!185977 () Bool)

(assert (=> b!122455 m!185977))

(declare-fun m!185979 () Bool)

(assert (=> b!122455 m!185979))

(declare-fun m!185981 () Bool)

(assert (=> b!122460 m!185981))

(declare-fun m!185983 () Bool)

(assert (=> start!24168 m!185983))

(declare-fun m!185985 () Bool)

(assert (=> b!122451 m!185985))

(declare-fun m!185987 () Bool)

(assert (=> b!122450 m!185987))

(declare-fun m!185989 () Bool)

(assert (=> b!122457 m!185989))

(declare-fun m!185991 () Bool)

(assert (=> b!122457 m!185991))

(declare-fun m!185993 () Bool)

(assert (=> b!122457 m!185993))

(declare-fun m!185995 () Bool)

(assert (=> b!122457 m!185995))

(declare-fun m!185997 () Bool)

(assert (=> b!122457 m!185997))

(declare-fun m!185999 () Bool)

(assert (=> b!122457 m!185999))

(declare-fun m!186001 () Bool)

(assert (=> b!122457 m!186001))

(declare-fun m!186003 () Bool)

(assert (=> b!122457 m!186003))

(declare-fun m!186005 () Bool)

(assert (=> b!122457 m!186005))

(declare-fun m!186007 () Bool)

(assert (=> b!122457 m!186007))

(declare-fun m!186009 () Bool)

(assert (=> b!122457 m!186009))

(declare-fun m!186011 () Bool)

(assert (=> b!122457 m!186011))

(declare-fun m!186013 () Bool)

(assert (=> b!122457 m!186013))

(declare-fun m!186015 () Bool)

(assert (=> b!122457 m!186015))

(declare-fun m!186017 () Bool)

(assert (=> b!122457 m!186017))

(declare-fun m!186019 () Bool)

(assert (=> b!122457 m!186019))

(declare-fun m!186021 () Bool)

(assert (=> b!122457 m!186021))

(declare-fun m!186023 () Bool)

(assert (=> b!122457 m!186023))

(declare-fun m!186025 () Bool)

(assert (=> b!122457 m!186025))

(declare-fun m!186027 () Bool)

(assert (=> b!122456 m!186027))

(assert (=> b!122461 m!185977))

(assert (=> b!122461 m!185979))

(declare-fun m!186029 () Bool)

(assert (=> b!122461 m!186029))

(declare-fun m!186031 () Bool)

(assert (=> b!122461 m!186031))

(declare-fun m!186033 () Bool)

(assert (=> b!122461 m!186033))

(declare-fun m!186035 () Bool)

(assert (=> b!122461 m!186035))

(declare-fun m!186037 () Bool)

(assert (=> b!122461 m!186037))

(declare-fun m!186039 () Bool)

(assert (=> b!122461 m!186039))

(declare-fun m!186041 () Bool)

(assert (=> b!122459 m!186041))

(assert (=> b!122459 m!186041))

(declare-fun m!186043 () Bool)

(assert (=> b!122459 m!186043))

(declare-fun m!186045 () Bool)

(assert (=> b!122453 m!186045))

(push 1)

