; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18384 () Bool)

(assert start!18384)

(declare-fun b!91273 () Bool)

(declare-fun e!60019 () Bool)

(declare-fun e!60020 () Bool)

(assert (=> b!91273 (= e!60019 e!60020)))

(declare-fun res!75350 () Bool)

(assert (=> b!91273 (=> (not res!75350) (not e!60020))))

(declare-datatypes ((array!4268 0))(
  ( (array!4269 (arr!2560 (Array (_ BitVec 32) (_ BitVec 8))) (size!1923 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3408 0))(
  ( (BitStream!3409 (buf!2313 array!4268) (currentByte!4603 (_ BitVec 32)) (currentBit!4598 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!5838 0))(
  ( (Unit!5839) )
))
(declare-datatypes ((tuple2!7592 0))(
  ( (tuple2!7593 (_1!4041 Unit!5838) (_2!4041 BitStream!3408)) )
))
(declare-fun lt!137692 () tuple2!7592)

(declare-fun lt!137693 () Bool)

(declare-datatypes ((tuple2!7594 0))(
  ( (tuple2!7595 (_1!4042 BitStream!3408) (_2!4042 Bool)) )
))
(declare-fun lt!137696 () tuple2!7594)

(assert (=> b!91273 (= res!75350 (and (= (_2!4042 lt!137696) lt!137693) (= (_1!4042 lt!137696) (_2!4041 lt!137692))))))

(declare-fun thiss!1152 () BitStream!3408)

(declare-fun readBitPure!0 (BitStream!3408) tuple2!7594)

(declare-fun readerFrom!0 (BitStream!3408 (_ BitVec 32) (_ BitVec 32)) BitStream!3408)

(assert (=> b!91273 (= lt!137696 (readBitPure!0 (readerFrom!0 (_2!4041 lt!137692) (currentBit!4598 thiss!1152) (currentByte!4603 thiss!1152))))))

(declare-fun b!91274 () Bool)

(declare-fun e!60025 () Bool)

(declare-fun e!60021 () Bool)

(assert (=> b!91274 (= e!60025 (not e!60021))))

(declare-fun res!75342 () Bool)

(assert (=> b!91274 (=> res!75342 e!60021)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!91274 (= res!75342 (not (invariant!0 (currentBit!4598 (_2!4041 lt!137692)) (currentByte!4603 (_2!4041 lt!137692)) (size!1923 (buf!2313 (_2!4041 lt!137692))))))))

(declare-fun e!60017 () Bool)

(assert (=> b!91274 e!60017))

(declare-fun res!75337 () Bool)

(assert (=> b!91274 (=> (not res!75337) (not e!60017))))

(assert (=> b!91274 (= res!75337 (= (size!1923 (buf!2313 thiss!1152)) (size!1923 (buf!2313 (_2!4041 lt!137692)))))))

(declare-fun appendBit!0 (BitStream!3408 Bool) tuple2!7592)

(assert (=> b!91274 (= lt!137692 (appendBit!0 thiss!1152 lt!137693))))

(declare-fun v!179 () (_ BitVec 64))

(declare-fun i!576 () (_ BitVec 32))

(assert (=> b!91274 (= lt!137693 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!91275 () Bool)

(declare-fun res!75348 () Bool)

(assert (=> b!91275 (=> res!75348 e!60021)))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> b!91275 (= res!75348 (bvslt (bvadd #b00000000000000000000000000000001 i!576) nBits!336))))

(declare-fun b!91276 () Bool)

(declare-fun res!75351 () Bool)

(assert (=> b!91276 (=> (not res!75351) (not e!60025))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!91276 (= res!75351 (validate_offset_bits!1 ((_ sign_extend 32) (size!1923 (buf!2313 thiss!1152))) ((_ sign_extend 32) (currentByte!4603 thiss!1152)) ((_ sign_extend 32) (currentBit!4598 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!91277 () Bool)

(declare-fun res!75343 () Bool)

(declare-fun e!60023 () Bool)

(assert (=> b!91277 (=> (not res!75343) (not e!60023))))

(declare-fun thiss!1151 () BitStream!3408)

(assert (=> b!91277 (= res!75343 (and (bvsle i!576 nBits!336) (= (size!1923 (buf!2313 thiss!1152)) (size!1923 (buf!2313 thiss!1151)))))))

(declare-fun b!91278 () Bool)

(declare-fun e!60026 () Bool)

(assert (=> b!91278 (= e!60021 e!60026)))

(declare-fun res!75349 () Bool)

(assert (=> b!91278 (=> (not res!75349) (not e!60026))))

(assert (=> b!91278 (= res!75349 (and (bvsge (bvadd #b00000000000000000000000000000001 i!576) #b00000000000000000000000000000000) (= (size!1923 (buf!2313 (_2!4041 lt!137692))) (size!1923 (buf!2313 thiss!1151)))))))

(declare-fun b!91279 () Bool)

(assert (=> b!91279 (= e!60026 (validate_offset_bits!1 ((_ sign_extend 32) (size!1923 (buf!2313 (_2!4041 lt!137692)))) ((_ sign_extend 32) (currentByte!4603 (_2!4041 lt!137692))) ((_ sign_extend 32) (currentBit!4598 (_2!4041 lt!137692))) ((_ sign_extend 32) (bvsub nBits!336 (bvadd #b00000000000000000000000000000001 i!576)))))))

(declare-fun b!91280 () Bool)

(declare-fun res!75340 () Bool)

(assert (=> b!91280 (=> (not res!75340) (not e!60023))))

(assert (=> b!91280 (= res!75340 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!91281 () Bool)

(declare-fun lt!137694 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!91281 (= e!60020 (= (bitIndex!0 (size!1923 (buf!2313 (_1!4042 lt!137696))) (currentByte!4603 (_1!4042 lt!137696)) (currentBit!4598 (_1!4042 lt!137696))) lt!137694))))

(declare-fun b!91282 () Bool)

(declare-fun res!75352 () Bool)

(assert (=> b!91282 (=> (not res!75352) (not e!60019))))

(declare-fun isPrefixOf!0 (BitStream!3408 BitStream!3408) Bool)

(assert (=> b!91282 (= res!75352 (isPrefixOf!0 thiss!1152 (_2!4041 lt!137692)))))

(declare-fun b!91283 () Bool)

(assert (=> b!91283 (= e!60023 e!60025)))

(declare-fun res!75347 () Bool)

(assert (=> b!91283 (=> (not res!75347) (not e!60025))))

(declare-fun lt!137697 () (_ BitVec 64))

(declare-fun lt!137695 () (_ BitVec 64))

(assert (=> b!91283 (= res!75347 (= lt!137697 (bvadd lt!137695 ((_ sign_extend 32) i!576))))))

(assert (=> b!91283 (= lt!137697 (bitIndex!0 (size!1923 (buf!2313 thiss!1152)) (currentByte!4603 thiss!1152) (currentBit!4598 thiss!1152)))))

(assert (=> b!91283 (= lt!137695 (bitIndex!0 (size!1923 (buf!2313 thiss!1151)) (currentByte!4603 thiss!1151) (currentBit!4598 thiss!1151)))))

(declare-fun b!91285 () Bool)

(declare-fun res!75338 () Bool)

(assert (=> b!91285 (=> (not res!75338) (not e!60025))))

(assert (=> b!91285 (= res!75338 (bvslt i!576 nBits!336))))

(declare-fun b!91286 () Bool)

(assert (=> b!91286 (= e!60017 e!60019)))

(declare-fun res!75336 () Bool)

(assert (=> b!91286 (=> (not res!75336) (not e!60019))))

(assert (=> b!91286 (= res!75336 (= lt!137694 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!137697)))))

(assert (=> b!91286 (= lt!137694 (bitIndex!0 (size!1923 (buf!2313 (_2!4041 lt!137692))) (currentByte!4603 (_2!4041 lt!137692)) (currentBit!4598 (_2!4041 lt!137692))))))

(declare-fun b!91287 () Bool)

(declare-fun res!75346 () Bool)

(assert (=> b!91287 (=> (not res!75346) (not e!60023))))

(assert (=> b!91287 (= res!75346 (validate_offset_bits!1 ((_ sign_extend 32) (size!1923 (buf!2313 thiss!1151))) ((_ sign_extend 32) (currentByte!4603 thiss!1151)) ((_ sign_extend 32) (currentBit!4598 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!91288 () Bool)

(declare-fun res!75341 () Bool)

(assert (=> b!91288 (=> (not res!75341) (not e!60023))))

(assert (=> b!91288 (= res!75341 (invariant!0 (currentBit!4598 thiss!1151) (currentByte!4603 thiss!1151) (size!1923 (buf!2313 thiss!1151))))))

(declare-fun b!91289 () Bool)

(declare-fun e!60027 () Bool)

(declare-fun array_inv!1769 (array!4268) Bool)

(assert (=> b!91289 (= e!60027 (array_inv!1769 (buf!2313 thiss!1152)))))

(declare-fun b!91290 () Bool)

(declare-fun e!60024 () Bool)

(assert (=> b!91290 (= e!60024 (array_inv!1769 (buf!2313 thiss!1151)))))

(declare-fun b!91291 () Bool)

(declare-fun res!75339 () Bool)

(assert (=> b!91291 (=> (not res!75339) (not e!60026))))

(assert (=> b!91291 (= res!75339 (= (bitIndex!0 (size!1923 (buf!2313 (_2!4041 lt!137692))) (currentByte!4603 (_2!4041 lt!137692)) (currentBit!4598 (_2!4041 lt!137692))) (bvadd lt!137695 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!576)))))))

(declare-fun b!91284 () Bool)

(declare-fun res!75344 () Bool)

(assert (=> b!91284 (=> (not res!75344) (not e!60023))))

(assert (=> b!91284 (= res!75344 (invariant!0 (currentBit!4598 thiss!1152) (currentByte!4603 thiss!1152) (size!1923 (buf!2313 thiss!1152))))))

(declare-fun res!75345 () Bool)

(assert (=> start!18384 (=> (not res!75345) (not e!60023))))

(assert (=> start!18384 (= res!75345 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!18384 e!60023))

(declare-fun inv!12 (BitStream!3408) Bool)

(assert (=> start!18384 (and (inv!12 thiss!1152) e!60027)))

(assert (=> start!18384 (and (inv!12 thiss!1151) e!60024)))

(assert (=> start!18384 true))

(assert (= (and start!18384 res!75345) b!91287))

(assert (= (and b!91287 res!75346) b!91288))

(assert (= (and b!91288 res!75341) b!91280))

(assert (= (and b!91280 res!75340) b!91284))

(assert (= (and b!91284 res!75344) b!91277))

(assert (= (and b!91277 res!75343) b!91283))

(assert (= (and b!91283 res!75347) b!91276))

(assert (= (and b!91276 res!75351) b!91285))

(assert (= (and b!91285 res!75338) b!91274))

(assert (= (and b!91274 res!75337) b!91286))

(assert (= (and b!91286 res!75336) b!91282))

(assert (= (and b!91282 res!75352) b!91273))

(assert (= (and b!91273 res!75350) b!91281))

(assert (= (and b!91274 (not res!75342)) b!91275))

(assert (= (and b!91275 (not res!75348)) b!91278))

(assert (= (and b!91278 res!75349) b!91291))

(assert (= (and b!91291 res!75339) b!91279))

(assert (= start!18384 b!91289))

(assert (= start!18384 b!91290))

(declare-fun m!135467 () Bool)

(assert (=> b!91276 m!135467))

(declare-fun m!135469 () Bool)

(assert (=> b!91291 m!135469))

(declare-fun m!135471 () Bool)

(assert (=> b!91288 m!135471))

(declare-fun m!135473 () Bool)

(assert (=> b!91290 m!135473))

(declare-fun m!135475 () Bool)

(assert (=> b!91273 m!135475))

(assert (=> b!91273 m!135475))

(declare-fun m!135477 () Bool)

(assert (=> b!91273 m!135477))

(declare-fun m!135479 () Bool)

(assert (=> b!91289 m!135479))

(declare-fun m!135481 () Bool)

(assert (=> b!91274 m!135481))

(declare-fun m!135483 () Bool)

(assert (=> b!91274 m!135483))

(declare-fun m!135485 () Bool)

(assert (=> b!91284 m!135485))

(declare-fun m!135487 () Bool)

(assert (=> b!91283 m!135487))

(declare-fun m!135489 () Bool)

(assert (=> b!91283 m!135489))

(declare-fun m!135491 () Bool)

(assert (=> b!91287 m!135491))

(declare-fun m!135493 () Bool)

(assert (=> b!91281 m!135493))

(declare-fun m!135495 () Bool)

(assert (=> start!18384 m!135495))

(declare-fun m!135497 () Bool)

(assert (=> start!18384 m!135497))

(assert (=> b!91286 m!135469))

(declare-fun m!135499 () Bool)

(assert (=> b!91279 m!135499))

(declare-fun m!135501 () Bool)

(assert (=> b!91282 m!135501))

(check-sat (not b!91274) (not b!91279) (not b!91284) (not b!91290) (not b!91281) (not b!91288) (not b!91276) (not b!91282) (not b!91273) (not b!91286) (not start!18384) (not b!91287) (not b!91291) (not b!91289) (not b!91283))
(check-sat)
(get-model)

(declare-fun d!28380 () Bool)

(assert (=> d!28380 (= (invariant!0 (currentBit!4598 (_2!4041 lt!137692)) (currentByte!4603 (_2!4041 lt!137692)) (size!1923 (buf!2313 (_2!4041 lt!137692)))) (and (bvsge (currentBit!4598 (_2!4041 lt!137692)) #b00000000000000000000000000000000) (bvslt (currentBit!4598 (_2!4041 lt!137692)) #b00000000000000000000000000001000) (bvsge (currentByte!4603 (_2!4041 lt!137692)) #b00000000000000000000000000000000) (or (bvslt (currentByte!4603 (_2!4041 lt!137692)) (size!1923 (buf!2313 (_2!4041 lt!137692)))) (and (= (currentBit!4598 (_2!4041 lt!137692)) #b00000000000000000000000000000000) (= (currentByte!4603 (_2!4041 lt!137692)) (size!1923 (buf!2313 (_2!4041 lt!137692))))))))))

(assert (=> b!91274 d!28380))

(declare-fun b!91385 () Bool)

(declare-fun e!60080 () Bool)

(declare-fun lt!137763 () tuple2!7594)

(declare-fun lt!137765 () tuple2!7592)

(assert (=> b!91385 (= e!60080 (= (bitIndex!0 (size!1923 (buf!2313 (_1!4042 lt!137763))) (currentByte!4603 (_1!4042 lt!137763)) (currentBit!4598 (_1!4042 lt!137763))) (bitIndex!0 (size!1923 (buf!2313 (_2!4041 lt!137765))) (currentByte!4603 (_2!4041 lt!137765)) (currentBit!4598 (_2!4041 lt!137765)))))))

(declare-fun b!91384 () Bool)

(declare-fun e!60081 () Bool)

(assert (=> b!91384 (= e!60081 e!60080)))

(declare-fun res!75438 () Bool)

(assert (=> b!91384 (=> (not res!75438) (not e!60080))))

(assert (=> b!91384 (= res!75438 (and (= (_2!4042 lt!137763) lt!137693) (= (_1!4042 lt!137763) (_2!4041 lt!137765))))))

(assert (=> b!91384 (= lt!137763 (readBitPure!0 (readerFrom!0 (_2!4041 lt!137765) (currentBit!4598 thiss!1152) (currentByte!4603 thiss!1152))))))

(declare-fun b!91382 () Bool)

(declare-fun res!75440 () Bool)

(assert (=> b!91382 (=> (not res!75440) (not e!60081))))

(declare-fun lt!137764 () (_ BitVec 64))

(declare-fun lt!137766 () (_ BitVec 64))

(assert (=> b!91382 (= res!75440 (= (bitIndex!0 (size!1923 (buf!2313 (_2!4041 lt!137765))) (currentByte!4603 (_2!4041 lt!137765)) (currentBit!4598 (_2!4041 lt!137765))) (bvadd lt!137764 lt!137766)))))

(assert (=> b!91382 (or (not (= (bvand lt!137764 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137766 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!137764 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!137764 lt!137766) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!91382 (= lt!137766 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!91382 (= lt!137764 (bitIndex!0 (size!1923 (buf!2313 thiss!1152)) (currentByte!4603 thiss!1152) (currentBit!4598 thiss!1152)))))

(declare-fun b!91383 () Bool)

(declare-fun res!75439 () Bool)

(assert (=> b!91383 (=> (not res!75439) (not e!60081))))

(assert (=> b!91383 (= res!75439 (isPrefixOf!0 thiss!1152 (_2!4041 lt!137765)))))

(declare-fun d!28382 () Bool)

(assert (=> d!28382 e!60081))

(declare-fun res!75437 () Bool)

(assert (=> d!28382 (=> (not res!75437) (not e!60081))))

(assert (=> d!28382 (= res!75437 (= (size!1923 (buf!2313 thiss!1152)) (size!1923 (buf!2313 (_2!4041 lt!137765)))))))

(declare-fun choose!16 (BitStream!3408 Bool) tuple2!7592)

(assert (=> d!28382 (= lt!137765 (choose!16 thiss!1152 lt!137693))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!28382 (validate_offset_bit!0 ((_ sign_extend 32) (size!1923 (buf!2313 thiss!1152))) ((_ sign_extend 32) (currentByte!4603 thiss!1152)) ((_ sign_extend 32) (currentBit!4598 thiss!1152)))))

(assert (=> d!28382 (= (appendBit!0 thiss!1152 lt!137693) lt!137765)))

(assert (= (and d!28382 res!75437) b!91382))

(assert (= (and b!91382 res!75440) b!91383))

(assert (= (and b!91383 res!75439) b!91384))

(assert (= (and b!91384 res!75438) b!91385))

(declare-fun m!135555 () Bool)

(assert (=> b!91384 m!135555))

(assert (=> b!91384 m!135555))

(declare-fun m!135557 () Bool)

(assert (=> b!91384 m!135557))

(declare-fun m!135559 () Bool)

(assert (=> d!28382 m!135559))

(declare-fun m!135561 () Bool)

(assert (=> d!28382 m!135561))

(declare-fun m!135563 () Bool)

(assert (=> b!91383 m!135563))

(declare-fun m!135565 () Bool)

(assert (=> b!91385 m!135565))

(declare-fun m!135567 () Bool)

(assert (=> b!91385 m!135567))

(assert (=> b!91382 m!135567))

(assert (=> b!91382 m!135487))

(assert (=> b!91274 d!28382))

(declare-fun d!28410 () Bool)

(declare-datatypes ((tuple2!7600 0))(
  ( (tuple2!7601 (_1!4045 Bool) (_2!4045 BitStream!3408)) )
))
(declare-fun lt!137769 () tuple2!7600)

(declare-fun readBit!0 (BitStream!3408) tuple2!7600)

(assert (=> d!28410 (= lt!137769 (readBit!0 (readerFrom!0 (_2!4041 lt!137692) (currentBit!4598 thiss!1152) (currentByte!4603 thiss!1152))))))

(assert (=> d!28410 (= (readBitPure!0 (readerFrom!0 (_2!4041 lt!137692) (currentBit!4598 thiss!1152) (currentByte!4603 thiss!1152))) (tuple2!7595 (_2!4045 lt!137769) (_1!4045 lt!137769)))))

(declare-fun bs!7013 () Bool)

(assert (= bs!7013 d!28410))

(assert (=> bs!7013 m!135475))

(declare-fun m!135569 () Bool)

(assert (=> bs!7013 m!135569))

(assert (=> b!91273 d!28410))

(declare-fun d!28412 () Bool)

(declare-fun e!60084 () Bool)

(assert (=> d!28412 e!60084))

(declare-fun res!75444 () Bool)

(assert (=> d!28412 (=> (not res!75444) (not e!60084))))

(assert (=> d!28412 (= res!75444 (invariant!0 (currentBit!4598 (_2!4041 lt!137692)) (currentByte!4603 (_2!4041 lt!137692)) (size!1923 (buf!2313 (_2!4041 lt!137692)))))))

(assert (=> d!28412 (= (readerFrom!0 (_2!4041 lt!137692) (currentBit!4598 thiss!1152) (currentByte!4603 thiss!1152)) (BitStream!3409 (buf!2313 (_2!4041 lt!137692)) (currentByte!4603 thiss!1152) (currentBit!4598 thiss!1152)))))

(declare-fun b!91388 () Bool)

(assert (=> b!91388 (= e!60084 (invariant!0 (currentBit!4598 thiss!1152) (currentByte!4603 thiss!1152) (size!1923 (buf!2313 (_2!4041 lt!137692)))))))

(assert (= (and d!28412 res!75444) b!91388))

(assert (=> d!28412 m!135481))

(declare-fun m!135571 () Bool)

(assert (=> b!91388 m!135571))

(assert (=> b!91273 d!28412))

(declare-fun d!28418 () Bool)

(assert (=> d!28418 (= (invariant!0 (currentBit!4598 thiss!1152) (currentByte!4603 thiss!1152) (size!1923 (buf!2313 thiss!1152))) (and (bvsge (currentBit!4598 thiss!1152) #b00000000000000000000000000000000) (bvslt (currentBit!4598 thiss!1152) #b00000000000000000000000000001000) (bvsge (currentByte!4603 thiss!1152) #b00000000000000000000000000000000) (or (bvslt (currentByte!4603 thiss!1152) (size!1923 (buf!2313 thiss!1152))) (and (= (currentBit!4598 thiss!1152) #b00000000000000000000000000000000) (= (currentByte!4603 thiss!1152) (size!1923 (buf!2313 thiss!1152)))))))))

(assert (=> b!91284 d!28418))

(declare-fun d!28420 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!28420 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1923 (buf!2313 thiss!1151))) ((_ sign_extend 32) (currentByte!4603 thiss!1151)) ((_ sign_extend 32) (currentBit!4598 thiss!1151)) ((_ sign_extend 32) nBits!336)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1923 (buf!2313 thiss!1151))) ((_ sign_extend 32) (currentByte!4603 thiss!1151)) ((_ sign_extend 32) (currentBit!4598 thiss!1151))) ((_ sign_extend 32) nBits!336)))))

(declare-fun bs!7014 () Bool)

(assert (= bs!7014 d!28420))

(declare-fun m!135573 () Bool)

(assert (=> bs!7014 m!135573))

(assert (=> b!91287 d!28420))

(declare-fun d!28422 () Bool)

(declare-fun e!60094 () Bool)

(assert (=> d!28422 e!60094))

(declare-fun res!75462 () Bool)

(assert (=> d!28422 (=> (not res!75462) (not e!60094))))

(declare-fun lt!137794 () (_ BitVec 64))

(declare-fun lt!137796 () (_ BitVec 64))

(declare-fun lt!137793 () (_ BitVec 64))

(assert (=> d!28422 (= res!75462 (= lt!137793 (bvsub lt!137796 lt!137794)))))

(assert (=> d!28422 (or (= (bvand lt!137796 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137794 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!137796 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!137796 lt!137794) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28422 (= lt!137794 (remainingBits!0 ((_ sign_extend 32) (size!1923 (buf!2313 (_2!4041 lt!137692)))) ((_ sign_extend 32) (currentByte!4603 (_2!4041 lt!137692))) ((_ sign_extend 32) (currentBit!4598 (_2!4041 lt!137692)))))))

(declare-fun lt!137797 () (_ BitVec 64))

(declare-fun lt!137795 () (_ BitVec 64))

(assert (=> d!28422 (= lt!137796 (bvmul lt!137797 lt!137795))))

(assert (=> d!28422 (or (= lt!137797 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!137795 (bvsdiv (bvmul lt!137797 lt!137795) lt!137797)))))

(assert (=> d!28422 (= lt!137795 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28422 (= lt!137797 ((_ sign_extend 32) (size!1923 (buf!2313 (_2!4041 lt!137692)))))))

(assert (=> d!28422 (= lt!137793 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4603 (_2!4041 lt!137692))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4598 (_2!4041 lt!137692)))))))

(assert (=> d!28422 (invariant!0 (currentBit!4598 (_2!4041 lt!137692)) (currentByte!4603 (_2!4041 lt!137692)) (size!1923 (buf!2313 (_2!4041 lt!137692))))))

(assert (=> d!28422 (= (bitIndex!0 (size!1923 (buf!2313 (_2!4041 lt!137692))) (currentByte!4603 (_2!4041 lt!137692)) (currentBit!4598 (_2!4041 lt!137692))) lt!137793)))

(declare-fun b!91405 () Bool)

(declare-fun res!75461 () Bool)

(assert (=> b!91405 (=> (not res!75461) (not e!60094))))

(assert (=> b!91405 (= res!75461 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!137793))))

(declare-fun b!91406 () Bool)

(declare-fun lt!137798 () (_ BitVec 64))

(assert (=> b!91406 (= e!60094 (bvsle lt!137793 (bvmul lt!137798 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!91406 (or (= lt!137798 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!137798 #b0000000000000000000000000000000000000000000000000000000000001000) lt!137798)))))

(assert (=> b!91406 (= lt!137798 ((_ sign_extend 32) (size!1923 (buf!2313 (_2!4041 lt!137692)))))))

(assert (= (and d!28422 res!75462) b!91405))

(assert (= (and b!91405 res!75461) b!91406))

(declare-fun m!135579 () Bool)

(assert (=> d!28422 m!135579))

(assert (=> d!28422 m!135481))

(assert (=> b!91286 d!28422))

(declare-fun d!28428 () Bool)

(assert (=> d!28428 (= (invariant!0 (currentBit!4598 thiss!1151) (currentByte!4603 thiss!1151) (size!1923 (buf!2313 thiss!1151))) (and (bvsge (currentBit!4598 thiss!1151) #b00000000000000000000000000000000) (bvslt (currentBit!4598 thiss!1151) #b00000000000000000000000000001000) (bvsge (currentByte!4603 thiss!1151) #b00000000000000000000000000000000) (or (bvslt (currentByte!4603 thiss!1151) (size!1923 (buf!2313 thiss!1151))) (and (= (currentBit!4598 thiss!1151) #b00000000000000000000000000000000) (= (currentByte!4603 thiss!1151) (size!1923 (buf!2313 thiss!1151)))))))))

(assert (=> b!91288 d!28428))

(declare-fun d!28430 () Bool)

(assert (=> d!28430 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1923 (buf!2313 thiss!1152))) ((_ sign_extend 32) (currentByte!4603 thiss!1152)) ((_ sign_extend 32) (currentBit!4598 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1923 (buf!2313 thiss!1152))) ((_ sign_extend 32) (currentByte!4603 thiss!1152)) ((_ sign_extend 32) (currentBit!4598 thiss!1152))) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun bs!7016 () Bool)

(assert (= bs!7016 d!28430))

(declare-fun m!135581 () Bool)

(assert (=> bs!7016 m!135581))

(assert (=> b!91276 d!28430))

(declare-fun d!28432 () Bool)

(assert (=> d!28432 (= (array_inv!1769 (buf!2313 thiss!1152)) (bvsge (size!1923 (buf!2313 thiss!1152)) #b00000000000000000000000000000000))))

(assert (=> b!91289 d!28432))

(assert (=> b!91291 d!28422))

(declare-fun d!28434 () Bool)

(assert (=> d!28434 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1923 (buf!2313 (_2!4041 lt!137692)))) ((_ sign_extend 32) (currentByte!4603 (_2!4041 lt!137692))) ((_ sign_extend 32) (currentBit!4598 (_2!4041 lt!137692))) ((_ sign_extend 32) (bvsub nBits!336 (bvadd #b00000000000000000000000000000001 i!576)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1923 (buf!2313 (_2!4041 lt!137692)))) ((_ sign_extend 32) (currentByte!4603 (_2!4041 lt!137692))) ((_ sign_extend 32) (currentBit!4598 (_2!4041 lt!137692)))) ((_ sign_extend 32) (bvsub nBits!336 (bvadd #b00000000000000000000000000000001 i!576)))))))

(declare-fun bs!7017 () Bool)

(assert (= bs!7017 d!28434))

(assert (=> bs!7017 m!135579))

(assert (=> b!91279 d!28434))

(declare-fun d!28436 () Bool)

(assert (=> d!28436 (= (array_inv!1769 (buf!2313 thiss!1151)) (bvsge (size!1923 (buf!2313 thiss!1151)) #b00000000000000000000000000000000))))

(assert (=> b!91290 d!28436))

(declare-fun d!28438 () Bool)

(declare-fun res!75483 () Bool)

(declare-fun e!60106 () Bool)

(assert (=> d!28438 (=> (not res!75483) (not e!60106))))

(assert (=> d!28438 (= res!75483 (= (size!1923 (buf!2313 thiss!1152)) (size!1923 (buf!2313 (_2!4041 lt!137692)))))))

(assert (=> d!28438 (= (isPrefixOf!0 thiss!1152 (_2!4041 lt!137692)) e!60106)))

(declare-fun b!91427 () Bool)

(declare-fun res!75484 () Bool)

(assert (=> b!91427 (=> (not res!75484) (not e!60106))))

(assert (=> b!91427 (= res!75484 (bvsle (bitIndex!0 (size!1923 (buf!2313 thiss!1152)) (currentByte!4603 thiss!1152) (currentBit!4598 thiss!1152)) (bitIndex!0 (size!1923 (buf!2313 (_2!4041 lt!137692))) (currentByte!4603 (_2!4041 lt!137692)) (currentBit!4598 (_2!4041 lt!137692)))))))

(declare-fun b!91428 () Bool)

(declare-fun e!60107 () Bool)

(assert (=> b!91428 (= e!60106 e!60107)))

(declare-fun res!75485 () Bool)

(assert (=> b!91428 (=> res!75485 e!60107)))

(assert (=> b!91428 (= res!75485 (= (size!1923 (buf!2313 thiss!1152)) #b00000000000000000000000000000000))))

(declare-fun b!91429 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4268 array!4268 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!91429 (= e!60107 (arrayBitRangesEq!0 (buf!2313 thiss!1152) (buf!2313 (_2!4041 lt!137692)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1923 (buf!2313 thiss!1152)) (currentByte!4603 thiss!1152) (currentBit!4598 thiss!1152))))))

(assert (= (and d!28438 res!75483) b!91427))

(assert (= (and b!91427 res!75484) b!91428))

(assert (= (and b!91428 (not res!75485)) b!91429))

(assert (=> b!91427 m!135487))

(assert (=> b!91427 m!135469))

(assert (=> b!91429 m!135487))

(assert (=> b!91429 m!135487))

(declare-fun m!135603 () Bool)

(assert (=> b!91429 m!135603))

(assert (=> b!91282 d!28438))

(declare-fun d!28446 () Bool)

(declare-fun e!60108 () Bool)

(assert (=> d!28446 e!60108))

(declare-fun res!75487 () Bool)

(assert (=> d!28446 (=> (not res!75487) (not e!60108))))

(declare-fun lt!137834 () (_ BitVec 64))

(declare-fun lt!137833 () (_ BitVec 64))

(declare-fun lt!137836 () (_ BitVec 64))

(assert (=> d!28446 (= res!75487 (= lt!137833 (bvsub lt!137836 lt!137834)))))

(assert (=> d!28446 (or (= (bvand lt!137836 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137834 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!137836 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!137836 lt!137834) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28446 (= lt!137834 (remainingBits!0 ((_ sign_extend 32) (size!1923 (buf!2313 thiss!1152))) ((_ sign_extend 32) (currentByte!4603 thiss!1152)) ((_ sign_extend 32) (currentBit!4598 thiss!1152))))))

(declare-fun lt!137837 () (_ BitVec 64))

(declare-fun lt!137835 () (_ BitVec 64))

(assert (=> d!28446 (= lt!137836 (bvmul lt!137837 lt!137835))))

(assert (=> d!28446 (or (= lt!137837 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!137835 (bvsdiv (bvmul lt!137837 lt!137835) lt!137837)))))

(assert (=> d!28446 (= lt!137835 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28446 (= lt!137837 ((_ sign_extend 32) (size!1923 (buf!2313 thiss!1152))))))

(assert (=> d!28446 (= lt!137833 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4603 thiss!1152)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4598 thiss!1152))))))

(assert (=> d!28446 (invariant!0 (currentBit!4598 thiss!1152) (currentByte!4603 thiss!1152) (size!1923 (buf!2313 thiss!1152)))))

(assert (=> d!28446 (= (bitIndex!0 (size!1923 (buf!2313 thiss!1152)) (currentByte!4603 thiss!1152) (currentBit!4598 thiss!1152)) lt!137833)))

(declare-fun b!91430 () Bool)

(declare-fun res!75486 () Bool)

(assert (=> b!91430 (=> (not res!75486) (not e!60108))))

(assert (=> b!91430 (= res!75486 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!137833))))

(declare-fun b!91431 () Bool)

(declare-fun lt!137838 () (_ BitVec 64))

(assert (=> b!91431 (= e!60108 (bvsle lt!137833 (bvmul lt!137838 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!91431 (or (= lt!137838 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!137838 #b0000000000000000000000000000000000000000000000000000000000001000) lt!137838)))))

(assert (=> b!91431 (= lt!137838 ((_ sign_extend 32) (size!1923 (buf!2313 thiss!1152))))))

(assert (= (and d!28446 res!75487) b!91430))

(assert (= (and b!91430 res!75486) b!91431))

(assert (=> d!28446 m!135581))

(assert (=> d!28446 m!135485))

(assert (=> b!91283 d!28446))

(declare-fun d!28448 () Bool)

(declare-fun e!60109 () Bool)

(assert (=> d!28448 e!60109))

(declare-fun res!75489 () Bool)

(assert (=> d!28448 (=> (not res!75489) (not e!60109))))

(declare-fun lt!137842 () (_ BitVec 64))

(declare-fun lt!137839 () (_ BitVec 64))

(declare-fun lt!137840 () (_ BitVec 64))

(assert (=> d!28448 (= res!75489 (= lt!137839 (bvsub lt!137842 lt!137840)))))

(assert (=> d!28448 (or (= (bvand lt!137842 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137840 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!137842 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!137842 lt!137840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28448 (= lt!137840 (remainingBits!0 ((_ sign_extend 32) (size!1923 (buf!2313 thiss!1151))) ((_ sign_extend 32) (currentByte!4603 thiss!1151)) ((_ sign_extend 32) (currentBit!4598 thiss!1151))))))

(declare-fun lt!137843 () (_ BitVec 64))

(declare-fun lt!137841 () (_ BitVec 64))

(assert (=> d!28448 (= lt!137842 (bvmul lt!137843 lt!137841))))

(assert (=> d!28448 (or (= lt!137843 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!137841 (bvsdiv (bvmul lt!137843 lt!137841) lt!137843)))))

(assert (=> d!28448 (= lt!137841 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28448 (= lt!137843 ((_ sign_extend 32) (size!1923 (buf!2313 thiss!1151))))))

(assert (=> d!28448 (= lt!137839 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4603 thiss!1151)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4598 thiss!1151))))))

(assert (=> d!28448 (invariant!0 (currentBit!4598 thiss!1151) (currentByte!4603 thiss!1151) (size!1923 (buf!2313 thiss!1151)))))

(assert (=> d!28448 (= (bitIndex!0 (size!1923 (buf!2313 thiss!1151)) (currentByte!4603 thiss!1151) (currentBit!4598 thiss!1151)) lt!137839)))

(declare-fun b!91432 () Bool)

(declare-fun res!75488 () Bool)

(assert (=> b!91432 (=> (not res!75488) (not e!60109))))

(assert (=> b!91432 (= res!75488 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!137839))))

(declare-fun b!91433 () Bool)

(declare-fun lt!137844 () (_ BitVec 64))

(assert (=> b!91433 (= e!60109 (bvsle lt!137839 (bvmul lt!137844 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!91433 (or (= lt!137844 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!137844 #b0000000000000000000000000000000000000000000000000000000000001000) lt!137844)))))

(assert (=> b!91433 (= lt!137844 ((_ sign_extend 32) (size!1923 (buf!2313 thiss!1151))))))

(assert (= (and d!28448 res!75489) b!91432))

(assert (= (and b!91432 res!75488) b!91433))

(assert (=> d!28448 m!135573))

(assert (=> d!28448 m!135471))

(assert (=> b!91283 d!28448))

(declare-fun d!28452 () Bool)

(declare-fun e!60110 () Bool)

(assert (=> d!28452 e!60110))

(declare-fun res!75491 () Bool)

(assert (=> d!28452 (=> (not res!75491) (not e!60110))))

(declare-fun lt!137845 () (_ BitVec 64))

(declare-fun lt!137848 () (_ BitVec 64))

(declare-fun lt!137846 () (_ BitVec 64))

(assert (=> d!28452 (= res!75491 (= lt!137845 (bvsub lt!137848 lt!137846)))))

(assert (=> d!28452 (or (= (bvand lt!137848 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137846 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!137848 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!137848 lt!137846) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28452 (= lt!137846 (remainingBits!0 ((_ sign_extend 32) (size!1923 (buf!2313 (_1!4042 lt!137696)))) ((_ sign_extend 32) (currentByte!4603 (_1!4042 lt!137696))) ((_ sign_extend 32) (currentBit!4598 (_1!4042 lt!137696)))))))

(declare-fun lt!137849 () (_ BitVec 64))

(declare-fun lt!137847 () (_ BitVec 64))

(assert (=> d!28452 (= lt!137848 (bvmul lt!137849 lt!137847))))

(assert (=> d!28452 (or (= lt!137849 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!137847 (bvsdiv (bvmul lt!137849 lt!137847) lt!137849)))))

(assert (=> d!28452 (= lt!137847 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28452 (= lt!137849 ((_ sign_extend 32) (size!1923 (buf!2313 (_1!4042 lt!137696)))))))

(assert (=> d!28452 (= lt!137845 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4603 (_1!4042 lt!137696))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4598 (_1!4042 lt!137696)))))))

(assert (=> d!28452 (invariant!0 (currentBit!4598 (_1!4042 lt!137696)) (currentByte!4603 (_1!4042 lt!137696)) (size!1923 (buf!2313 (_1!4042 lt!137696))))))

(assert (=> d!28452 (= (bitIndex!0 (size!1923 (buf!2313 (_1!4042 lt!137696))) (currentByte!4603 (_1!4042 lt!137696)) (currentBit!4598 (_1!4042 lt!137696))) lt!137845)))

(declare-fun b!91434 () Bool)

(declare-fun res!75490 () Bool)

(assert (=> b!91434 (=> (not res!75490) (not e!60110))))

(assert (=> b!91434 (= res!75490 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!137845))))

(declare-fun b!91435 () Bool)

(declare-fun lt!137850 () (_ BitVec 64))

(assert (=> b!91435 (= e!60110 (bvsle lt!137845 (bvmul lt!137850 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!91435 (or (= lt!137850 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!137850 #b0000000000000000000000000000000000000000000000000000000000001000) lt!137850)))))

(assert (=> b!91435 (= lt!137850 ((_ sign_extend 32) (size!1923 (buf!2313 (_1!4042 lt!137696)))))))

(assert (= (and d!28452 res!75491) b!91434))

(assert (= (and b!91434 res!75490) b!91435))

(declare-fun m!135605 () Bool)

(assert (=> d!28452 m!135605))

(declare-fun m!135607 () Bool)

(assert (=> d!28452 m!135607))

(assert (=> b!91281 d!28452))

(declare-fun d!28454 () Bool)

(assert (=> d!28454 (= (inv!12 thiss!1152) (invariant!0 (currentBit!4598 thiss!1152) (currentByte!4603 thiss!1152) (size!1923 (buf!2313 thiss!1152))))))

(declare-fun bs!7018 () Bool)

(assert (= bs!7018 d!28454))

(assert (=> bs!7018 m!135485))

(assert (=> start!18384 d!28454))

(declare-fun d!28456 () Bool)

(assert (=> d!28456 (= (inv!12 thiss!1151) (invariant!0 (currentBit!4598 thiss!1151) (currentByte!4603 thiss!1151) (size!1923 (buf!2313 thiss!1151))))))

(declare-fun bs!7019 () Bool)

(assert (= bs!7019 d!28456))

(assert (=> bs!7019 m!135471))

(assert (=> start!18384 d!28456))

(check-sat (not d!28454) (not d!28434) (not b!91385) (not b!91383) (not d!28410) (not d!28412) (not b!91429) (not d!28456) (not d!28422) (not b!91388) (not d!28446) (not d!28430) (not b!91427) (not d!28420) (not b!91384) (not d!28452) (not d!28448) (not d!28382) (not b!91382))
(check-sat)
