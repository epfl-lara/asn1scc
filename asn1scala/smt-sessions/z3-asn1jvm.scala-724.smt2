; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20232 () Bool)

(assert start!20232)

(declare-fun b!101457 () Bool)

(declare-fun res!83374 () Bool)

(declare-fun e!66344 () Bool)

(assert (=> b!101457 (=> (not res!83374) (not e!66344))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!101457 (= res!83374 (bvslt i!615 nBits!396))))

(declare-fun res!83372 () Bool)

(declare-fun e!66340 () Bool)

(assert (=> start!20232 (=> (not res!83372) (not e!66340))))

(assert (=> start!20232 (= res!83372 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20232 e!66340))

(assert (=> start!20232 true))

(declare-datatypes ((array!4763 0))(
  ( (array!4764 (arr!2767 (Array (_ BitVec 32) (_ BitVec 8))) (size!2174 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3822 0))(
  ( (BitStream!3823 (buf!2531 array!4763) (currentByte!4998 (_ BitVec 32)) (currentBit!4993 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3822)

(declare-fun e!66348 () Bool)

(declare-fun inv!12 (BitStream!3822) Bool)

(assert (=> start!20232 (and (inv!12 thiss!1305) e!66348)))

(declare-fun b!101458 () Bool)

(declare-fun res!83375 () Bool)

(declare-fun e!66341 () Bool)

(assert (=> b!101458 (=> (not res!83375) (not e!66341))))

(declare-datatypes ((Unit!6220 0))(
  ( (Unit!6221) )
))
(declare-datatypes ((tuple2!8224 0))(
  ( (tuple2!8225 (_1!4367 Unit!6220) (_2!4367 BitStream!3822)) )
))
(declare-fun lt!147244 () tuple2!8224)

(declare-fun isPrefixOf!0 (BitStream!3822 BitStream!3822) Bool)

(assert (=> b!101458 (= res!83375 (isPrefixOf!0 thiss!1305 (_2!4367 lt!147244)))))

(declare-fun b!101459 () Bool)

(declare-fun e!66345 () Bool)

(declare-datatypes ((tuple2!8226 0))(
  ( (tuple2!8227 (_1!4368 BitStream!3822) (_2!4368 Bool)) )
))
(declare-fun lt!147247 () tuple2!8226)

(declare-fun lt!147243 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!101459 (= e!66345 (= (bitIndex!0 (size!2174 (buf!2531 (_1!4368 lt!147247))) (currentByte!4998 (_1!4368 lt!147247)) (currentBit!4993 (_1!4368 lt!147247))) lt!147243))))

(declare-fun b!101460 () Bool)

(assert (=> b!101460 (= e!66340 e!66344)))

(declare-fun res!83365 () Bool)

(assert (=> b!101460 (=> (not res!83365) (not e!66344))))

(declare-fun lt!147237 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!101460 (= res!83365 (validate_offset_bits!1 ((_ sign_extend 32) (size!2174 (buf!2531 thiss!1305))) ((_ sign_extend 32) (currentByte!4998 thiss!1305)) ((_ sign_extend 32) (currentBit!4993 thiss!1305)) lt!147237))))

(assert (=> b!101460 (= lt!147237 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!101461 () Bool)

(declare-fun e!66347 () Bool)

(assert (=> b!101461 (= e!66347 e!66341)))

(declare-fun res!83371 () Bool)

(assert (=> b!101461 (=> (not res!83371) (not e!66341))))

(declare-fun lt!147245 () (_ BitVec 64))

(assert (=> b!101461 (= res!83371 (= lt!147243 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!147245)))))

(assert (=> b!101461 (= lt!147243 (bitIndex!0 (size!2174 (buf!2531 (_2!4367 lt!147244))) (currentByte!4998 (_2!4367 lt!147244)) (currentBit!4993 (_2!4367 lt!147244))))))

(assert (=> b!101461 (= lt!147245 (bitIndex!0 (size!2174 (buf!2531 thiss!1305)) (currentByte!4998 thiss!1305) (currentBit!4993 thiss!1305)))))

(declare-fun b!101462 () Bool)

(declare-fun res!83373 () Bool)

(assert (=> b!101462 (=> (not res!83373) (not e!66344))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!101462 (= res!83373 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!101463 () Bool)

(assert (=> b!101463 (= e!66341 e!66345)))

(declare-fun res!83368 () Bool)

(assert (=> b!101463 (=> (not res!83368) (not e!66345))))

(declare-fun lt!147238 () Bool)

(assert (=> b!101463 (= res!83368 (and (= (_2!4368 lt!147247) lt!147238) (= (_1!4368 lt!147247) (_2!4367 lt!147244))))))

(declare-fun readBitPure!0 (BitStream!3822) tuple2!8226)

(declare-fun readerFrom!0 (BitStream!3822 (_ BitVec 32) (_ BitVec 32)) BitStream!3822)

(assert (=> b!101463 (= lt!147247 (readBitPure!0 (readerFrom!0 (_2!4367 lt!147244) (currentBit!4993 thiss!1305) (currentByte!4998 thiss!1305))))))

(declare-fun b!101464 () Bool)

(assert (=> b!101464 (= e!66344 (not true))))

(declare-fun lt!147241 () tuple2!8224)

(assert (=> b!101464 (validate_offset_bits!1 ((_ sign_extend 32) (size!2174 (buf!2531 (_2!4367 lt!147241)))) ((_ sign_extend 32) (currentByte!4998 thiss!1305)) ((_ sign_extend 32) (currentBit!4993 thiss!1305)) lt!147237)))

(declare-fun lt!147240 () Unit!6220)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3822 array!4763 (_ BitVec 64)) Unit!6220)

(assert (=> b!101464 (= lt!147240 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2531 (_2!4367 lt!147241)) lt!147237))))

(declare-datatypes ((tuple2!8228 0))(
  ( (tuple2!8229 (_1!4369 BitStream!3822) (_2!4369 BitStream!3822)) )
))
(declare-fun lt!147239 () tuple2!8228)

(assert (=> b!101464 (= (_2!4368 (readBitPure!0 (_1!4369 lt!147239))) lt!147238)))

(declare-fun lt!147235 () tuple2!8228)

(declare-fun reader!0 (BitStream!3822 BitStream!3822) tuple2!8228)

(assert (=> b!101464 (= lt!147235 (reader!0 (_2!4367 lt!147244) (_2!4367 lt!147241)))))

(assert (=> b!101464 (= lt!147239 (reader!0 thiss!1305 (_2!4367 lt!147241)))))

(declare-fun e!66346 () Bool)

(assert (=> b!101464 e!66346))

(declare-fun res!83366 () Bool)

(assert (=> b!101464 (=> (not res!83366) (not e!66346))))

(declare-fun lt!147242 () tuple2!8226)

(declare-fun lt!147236 () tuple2!8226)

(assert (=> b!101464 (= res!83366 (= (bitIndex!0 (size!2174 (buf!2531 (_1!4368 lt!147242))) (currentByte!4998 (_1!4368 lt!147242)) (currentBit!4993 (_1!4368 lt!147242))) (bitIndex!0 (size!2174 (buf!2531 (_1!4368 lt!147236))) (currentByte!4998 (_1!4368 lt!147236)) (currentBit!4993 (_1!4368 lt!147236)))))))

(declare-fun lt!147246 () Unit!6220)

(declare-fun lt!147233 () BitStream!3822)

(declare-fun readBitPrefixLemma!0 (BitStream!3822 BitStream!3822) Unit!6220)

(assert (=> b!101464 (= lt!147246 (readBitPrefixLemma!0 lt!147233 (_2!4367 lt!147241)))))

(assert (=> b!101464 (= lt!147236 (readBitPure!0 (BitStream!3823 (buf!2531 (_2!4367 lt!147241)) (currentByte!4998 thiss!1305) (currentBit!4993 thiss!1305))))))

(assert (=> b!101464 (= lt!147242 (readBitPure!0 lt!147233))))

(assert (=> b!101464 (= lt!147233 (BitStream!3823 (buf!2531 (_2!4367 lt!147244)) (currentByte!4998 thiss!1305) (currentBit!4993 thiss!1305)))))

(declare-fun e!66343 () Bool)

(assert (=> b!101464 e!66343))

(declare-fun res!83370 () Bool)

(assert (=> b!101464 (=> (not res!83370) (not e!66343))))

(assert (=> b!101464 (= res!83370 (isPrefixOf!0 thiss!1305 (_2!4367 lt!147241)))))

(declare-fun lt!147234 () Unit!6220)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3822 BitStream!3822 BitStream!3822) Unit!6220)

(assert (=> b!101464 (= lt!147234 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4367 lt!147244) (_2!4367 lt!147241)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3822 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8224)

(assert (=> b!101464 (= lt!147241 (appendNLeastSignificantBitsLoop!0 (_2!4367 lt!147244) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!101464 e!66347))

(declare-fun res!83367 () Bool)

(assert (=> b!101464 (=> (not res!83367) (not e!66347))))

(assert (=> b!101464 (= res!83367 (= (size!2174 (buf!2531 thiss!1305)) (size!2174 (buf!2531 (_2!4367 lt!147244)))))))

(declare-fun appendBit!0 (BitStream!3822 Bool) tuple2!8224)

(assert (=> b!101464 (= lt!147244 (appendBit!0 thiss!1305 lt!147238))))

(assert (=> b!101464 (= lt!147238 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!101465 () Bool)

(declare-fun array_inv!1976 (array!4763) Bool)

(assert (=> b!101465 (= e!66348 (array_inv!1976 (buf!2531 thiss!1305)))))

(declare-fun b!101466 () Bool)

(assert (=> b!101466 (= e!66346 (= (_2!4368 lt!147242) (_2!4368 lt!147236)))))

(declare-fun b!101467 () Bool)

(declare-fun res!83369 () Bool)

(assert (=> b!101467 (=> (not res!83369) (not e!66343))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!101467 (= res!83369 (invariant!0 (currentBit!4993 thiss!1305) (currentByte!4998 thiss!1305) (size!2174 (buf!2531 (_2!4367 lt!147244)))))))

(declare-fun b!101468 () Bool)

(assert (=> b!101468 (= e!66343 (invariant!0 (currentBit!4993 thiss!1305) (currentByte!4998 thiss!1305) (size!2174 (buf!2531 (_2!4367 lt!147241)))))))

(assert (= (and start!20232 res!83372) b!101460))

(assert (= (and b!101460 res!83365) b!101462))

(assert (= (and b!101462 res!83373) b!101457))

(assert (= (and b!101457 res!83374) b!101464))

(assert (= (and b!101464 res!83367) b!101461))

(assert (= (and b!101461 res!83371) b!101458))

(assert (= (and b!101458 res!83375) b!101463))

(assert (= (and b!101463 res!83368) b!101459))

(assert (= (and b!101464 res!83370) b!101467))

(assert (= (and b!101467 res!83369) b!101468))

(assert (= (and b!101464 res!83366) b!101466))

(assert (= start!20232 b!101465))

(declare-fun m!147551 () Bool)

(assert (=> b!101468 m!147551))

(declare-fun m!147553 () Bool)

(assert (=> start!20232 m!147553))

(declare-fun m!147555 () Bool)

(assert (=> b!101460 m!147555))

(declare-fun m!147557 () Bool)

(assert (=> b!101464 m!147557))

(declare-fun m!147559 () Bool)

(assert (=> b!101464 m!147559))

(declare-fun m!147561 () Bool)

(assert (=> b!101464 m!147561))

(declare-fun m!147563 () Bool)

(assert (=> b!101464 m!147563))

(declare-fun m!147565 () Bool)

(assert (=> b!101464 m!147565))

(declare-fun m!147567 () Bool)

(assert (=> b!101464 m!147567))

(declare-fun m!147569 () Bool)

(assert (=> b!101464 m!147569))

(declare-fun m!147571 () Bool)

(assert (=> b!101464 m!147571))

(declare-fun m!147573 () Bool)

(assert (=> b!101464 m!147573))

(declare-fun m!147575 () Bool)

(assert (=> b!101464 m!147575))

(declare-fun m!147577 () Bool)

(assert (=> b!101464 m!147577))

(declare-fun m!147579 () Bool)

(assert (=> b!101464 m!147579))

(declare-fun m!147581 () Bool)

(assert (=> b!101464 m!147581))

(declare-fun m!147583 () Bool)

(assert (=> b!101464 m!147583))

(declare-fun m!147585 () Bool)

(assert (=> b!101459 m!147585))

(declare-fun m!147587 () Bool)

(assert (=> b!101463 m!147587))

(assert (=> b!101463 m!147587))

(declare-fun m!147589 () Bool)

(assert (=> b!101463 m!147589))

(declare-fun m!147591 () Bool)

(assert (=> b!101467 m!147591))

(declare-fun m!147593 () Bool)

(assert (=> b!101462 m!147593))

(declare-fun m!147595 () Bool)

(assert (=> b!101461 m!147595))

(declare-fun m!147597 () Bool)

(assert (=> b!101461 m!147597))

(declare-fun m!147599 () Bool)

(assert (=> b!101458 m!147599))

(declare-fun m!147601 () Bool)

(assert (=> b!101465 m!147601))

(check-sat (not b!101464) (not b!101463) (not start!20232) (not b!101467) (not b!101465) (not b!101458) (not b!101460) (not b!101461) (not b!101459) (not b!101468) (not b!101462))
