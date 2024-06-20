; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44088 () Bool)

(assert start!44088)

(declare-fun b!210016 () Bool)

(declare-fun e!143321 () Bool)

(declare-fun e!143311 () Bool)

(assert (=> b!210016 (= e!143321 e!143311)))

(declare-fun res!176324 () Bool)

(assert (=> b!210016 (=> (not res!176324) (not e!143311))))

(declare-datatypes ((array!10481 0))(
  ( (array!10482 (arr!5536 (Array (_ BitVec 32) (_ BitVec 8))) (size!4606 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8320 0))(
  ( (BitStream!8321 (buf!5123 array!10481) (currentByte!9665 (_ BitVec 32)) (currentBit!9660 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!14962 0))(
  ( (Unit!14963) )
))
(declare-datatypes ((tuple2!18002 0))(
  ( (tuple2!18003 (_1!9656 Unit!14962) (_2!9656 BitStream!8320)) )
))
(declare-fun lt!329330 () tuple2!18002)

(declare-datatypes ((tuple2!18004 0))(
  ( (tuple2!18005 (_1!9657 BitStream!8320) (_2!9657 Bool)) )
))
(declare-fun lt!329320 () tuple2!18004)

(declare-fun lt!329328 () Bool)

(assert (=> b!210016 (= res!176324 (and (= (_2!9657 lt!329320) lt!329328) (= (_1!9657 lt!329320) (_2!9656 lt!329330))))))

(declare-fun thiss!1204 () BitStream!8320)

(declare-fun readBitPure!0 (BitStream!8320) tuple2!18004)

(declare-fun readerFrom!0 (BitStream!8320 (_ BitVec 32) (_ BitVec 32)) BitStream!8320)

(assert (=> b!210016 (= lt!329320 (readBitPure!0 (readerFrom!0 (_2!9656 lt!329330) (currentBit!9660 thiss!1204) (currentByte!9665 thiss!1204))))))

(declare-fun b!210017 () Bool)

(declare-fun e!143313 () Bool)

(declare-fun e!143320 () Bool)

(assert (=> b!210017 (= e!143313 (not e!143320))))

(declare-fun res!176321 () Bool)

(assert (=> b!210017 (=> res!176321 e!143320)))

(declare-fun lt!329316 () (_ BitVec 64))

(declare-fun lt!329326 () (_ BitVec 64))

(assert (=> b!210017 (= res!176321 (not (= lt!329316 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!329326))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!210017 (= lt!329316 (bitIndex!0 (size!4606 (buf!5123 (_2!9656 lt!329330))) (currentByte!9665 (_2!9656 lt!329330)) (currentBit!9660 (_2!9656 lt!329330))))))

(assert (=> b!210017 (= lt!329326 (bitIndex!0 (size!4606 (buf!5123 thiss!1204)) (currentByte!9665 thiss!1204) (currentBit!9660 thiss!1204)))))

(declare-fun e!143315 () Bool)

(assert (=> b!210017 e!143315))

(declare-fun res!176322 () Bool)

(assert (=> b!210017 (=> (not res!176322) (not e!143315))))

(assert (=> b!210017 (= res!176322 (= (size!4606 (buf!5123 thiss!1204)) (size!4606 (buf!5123 (_2!9656 lt!329330)))))))

(declare-fun appendBit!0 (BitStream!8320 Bool) tuple2!18002)

(assert (=> b!210017 (= lt!329330 (appendBit!0 thiss!1204 lt!329328))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun lt!329324 () (_ BitVec 64))

(assert (=> b!210017 (= lt!329328 (not (= (bvand v!189 lt!329324) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!210017 (= lt!329324 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!210018 () Bool)

(declare-fun res!176316 () Bool)

(declare-fun e!143322 () Bool)

(assert (=> b!210018 (=> res!176316 e!143322)))

(declare-fun lt!329319 () tuple2!18002)

(declare-fun isPrefixOf!0 (BitStream!8320 BitStream!8320) Bool)

(assert (=> b!210018 (= res!176316 (not (isPrefixOf!0 (_2!9656 lt!329330) (_2!9656 lt!329319))))))

(declare-fun b!210019 () Bool)

(declare-fun e!143314 () Bool)

(declare-fun lt!329317 () tuple2!18004)

(declare-fun lt!329309 () tuple2!18004)

(assert (=> b!210019 (= e!143314 (= (_2!9657 lt!329317) (_2!9657 lt!329309)))))

(declare-fun b!210020 () Bool)

(declare-fun res!176320 () Bool)

(assert (=> b!210020 (=> (not res!176320) (not e!143313))))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!210020 (= res!176320 (not (= i!590 nBits!348)))))

(declare-fun b!210021 () Bool)

(declare-fun res!176317 () Bool)

(assert (=> b!210021 (=> res!176317 e!143322)))

(assert (=> b!210021 (= res!176317 (not (isPrefixOf!0 thiss!1204 (_2!9656 lt!329330))))))

(declare-fun b!210022 () Bool)

(assert (=> b!210022 (= e!143315 e!143321)))

(declare-fun res!176323 () Bool)

(assert (=> b!210022 (=> (not res!176323) (not e!143321))))

(declare-fun lt!329308 () (_ BitVec 64))

(declare-fun lt!329315 () (_ BitVec 64))

(assert (=> b!210022 (= res!176323 (= lt!329308 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!329315)))))

(assert (=> b!210022 (= lt!329308 (bitIndex!0 (size!4606 (buf!5123 (_2!9656 lt!329330))) (currentByte!9665 (_2!9656 lt!329330)) (currentBit!9660 (_2!9656 lt!329330))))))

(assert (=> b!210022 (= lt!329315 (bitIndex!0 (size!4606 (buf!5123 thiss!1204)) (currentByte!9665 thiss!1204) (currentBit!9660 thiss!1204)))))

(declare-fun b!210023 () Bool)

(declare-fun res!176319 () Bool)

(assert (=> b!210023 (=> (not res!176319) (not e!143321))))

(assert (=> b!210023 (= res!176319 (isPrefixOf!0 thiss!1204 (_2!9656 lt!329330)))))

(declare-datatypes ((tuple2!18006 0))(
  ( (tuple2!18007 (_1!9658 BitStream!8320) (_2!9658 BitStream!8320)) )
))
(declare-fun lt!329322 () tuple2!18006)

(declare-fun b!210024 () Bool)

(declare-fun e!143317 () Bool)

(declare-fun lt!329318 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!8320 (_ BitVec 64)) BitStream!8320)

(assert (=> b!210024 (= e!143317 (= (_1!9658 lt!329322) (withMovedBitIndex!0 (_2!9658 lt!329322) (bvsub lt!329326 lt!329318))))))

(declare-datatypes ((tuple2!18008 0))(
  ( (tuple2!18009 (_1!9659 BitStream!8320) (_2!9659 (_ BitVec 64))) )
))
(declare-fun lt!329323 () tuple2!18008)

(declare-fun lt!329332 () tuple2!18008)

(assert (=> b!210024 (and (= (_2!9659 lt!329323) (_2!9659 lt!329332)) (= (_1!9659 lt!329323) (_1!9659 lt!329332)))))

(declare-fun lt!329307 () (_ BitVec 64))

(declare-fun lt!329310 () Unit!14962)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8320 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!14962)

(assert (=> b!210024 (= lt!329310 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9658 lt!329322) nBits!348 i!590 lt!329307))))

(declare-fun lt!329325 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8320 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18008)

(assert (=> b!210024 (= lt!329332 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9658 lt!329322) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!329325))))

(declare-fun b!210025 () Bool)

(assert (=> b!210025 (= e!143320 e!143322)))

(declare-fun res!176327 () Bool)

(assert (=> b!210025 (=> res!176327 e!143322)))

(assert (=> b!210025 (= res!176327 (not (= lt!329318 (bvsub (bvsub (bvadd lt!329316 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!210025 (= lt!329318 (bitIndex!0 (size!4606 (buf!5123 (_2!9656 lt!329319))) (currentByte!9665 (_2!9656 lt!329319)) (currentBit!9660 (_2!9656 lt!329319))))))

(assert (=> b!210025 (isPrefixOf!0 thiss!1204 (_2!9656 lt!329319))))

(declare-fun lt!329329 () Unit!14962)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8320 BitStream!8320 BitStream!8320) Unit!14962)

(assert (=> b!210025 (= lt!329329 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9656 lt!329330) (_2!9656 lt!329319)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8320 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!18002)

(assert (=> b!210025 (= lt!329319 (appendBitsLSBFirstLoopTR!0 (_2!9656 lt!329330) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!210026 () Bool)

(declare-fun e!143318 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!210026 (= e!143318 (invariant!0 (currentBit!9660 thiss!1204) (currentByte!9665 thiss!1204) (size!4606 (buf!5123 (_2!9656 lt!329319)))))))

(declare-fun b!210028 () Bool)

(declare-fun res!176314 () Bool)

(assert (=> b!210028 (=> (not res!176314) (not e!143313))))

(assert (=> b!210028 (= res!176314 (invariant!0 (currentBit!9660 thiss!1204) (currentByte!9665 thiss!1204) (size!4606 (buf!5123 thiss!1204))))))

(declare-fun b!210029 () Bool)

(declare-fun e!143319 () Bool)

(assert (=> b!210029 (= e!143319 e!143313)))

(declare-fun res!176329 () Bool)

(assert (=> b!210029 (=> (not res!176329) (not e!143313))))

(declare-fun lt!329312 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!210029 (= res!176329 (validate_offset_bits!1 ((_ sign_extend 32) (size!4606 (buf!5123 thiss!1204))) ((_ sign_extend 32) (currentByte!9665 thiss!1204)) ((_ sign_extend 32) (currentBit!9660 thiss!1204)) lt!329312))))

(assert (=> b!210029 (= lt!329312 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!210030 () Bool)

(declare-fun res!176328 () Bool)

(assert (=> b!210030 (=> res!176328 e!143322)))

(assert (=> b!210030 (= res!176328 (not (invariant!0 (currentBit!9660 (_2!9656 lt!329319)) (currentByte!9665 (_2!9656 lt!329319)) (size!4606 (buf!5123 (_2!9656 lt!329319))))))))

(declare-fun b!210031 () Bool)

(declare-fun e!143316 () Bool)

(declare-fun array_inv!4347 (array!10481) Bool)

(assert (=> b!210031 (= e!143316 (array_inv!4347 (buf!5123 thiss!1204)))))

(declare-fun b!210032 () Bool)

(declare-fun res!176318 () Bool)

(assert (=> b!210032 (=> res!176318 e!143322)))

(assert (=> b!210032 (= res!176318 (or (not (= (size!4606 (buf!5123 (_2!9656 lt!329319))) (size!4606 (buf!5123 thiss!1204)))) (not (= lt!329318 (bvsub (bvadd lt!329326 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!210033 () Bool)

(assert (=> b!210033 (= e!143322 e!143317)))

(declare-fun res!176315 () Bool)

(assert (=> b!210033 (=> res!176315 e!143317)))

(declare-fun lt!329321 () tuple2!18006)

(assert (=> b!210033 (= res!176315 (not (= (_1!9659 (readNBitsLSBFirstsLoopPure!0 (_1!9658 lt!329321) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!329325)) (_2!9658 lt!329321))))))

(declare-fun lt!329331 () (_ BitVec 64))

(assert (=> b!210033 (validate_offset_bits!1 ((_ sign_extend 32) (size!4606 (buf!5123 (_2!9656 lt!329319)))) ((_ sign_extend 32) (currentByte!9665 (_2!9656 lt!329330))) ((_ sign_extend 32) (currentBit!9660 (_2!9656 lt!329330))) lt!329331)))

(declare-fun lt!329314 () Unit!14962)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8320 array!10481 (_ BitVec 64)) Unit!14962)

(assert (=> b!210033 (= lt!329314 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9656 lt!329330) (buf!5123 (_2!9656 lt!329319)) lt!329331))))

(assert (=> b!210033 (= lt!329331 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!329333 () tuple2!18004)

(assert (=> b!210033 (= lt!329325 (bvor lt!329307 (ite (_2!9657 lt!329333) lt!329324 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210033 (= lt!329323 (readNBitsLSBFirstsLoopPure!0 (_1!9658 lt!329322) nBits!348 i!590 lt!329307))))

(assert (=> b!210033 (validate_offset_bits!1 ((_ sign_extend 32) (size!4606 (buf!5123 (_2!9656 lt!329319)))) ((_ sign_extend 32) (currentByte!9665 thiss!1204)) ((_ sign_extend 32) (currentBit!9660 thiss!1204)) lt!329312)))

(declare-fun lt!329313 () Unit!14962)

(assert (=> b!210033 (= lt!329313 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5123 (_2!9656 lt!329319)) lt!329312))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!210033 (= lt!329307 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!210033 (= (_2!9657 lt!329333) lt!329328)))

(assert (=> b!210033 (= lt!329333 (readBitPure!0 (_1!9658 lt!329322)))))

(declare-fun reader!0 (BitStream!8320 BitStream!8320) tuple2!18006)

(assert (=> b!210033 (= lt!329321 (reader!0 (_2!9656 lt!329330) (_2!9656 lt!329319)))))

(assert (=> b!210033 (= lt!329322 (reader!0 thiss!1204 (_2!9656 lt!329319)))))

(assert (=> b!210033 e!143314))

(declare-fun res!176326 () Bool)

(assert (=> b!210033 (=> (not res!176326) (not e!143314))))

(assert (=> b!210033 (= res!176326 (= (bitIndex!0 (size!4606 (buf!5123 (_1!9657 lt!329317))) (currentByte!9665 (_1!9657 lt!329317)) (currentBit!9660 (_1!9657 lt!329317))) (bitIndex!0 (size!4606 (buf!5123 (_1!9657 lt!329309))) (currentByte!9665 (_1!9657 lt!329309)) (currentBit!9660 (_1!9657 lt!329309)))))))

(declare-fun lt!329327 () Unit!14962)

(declare-fun lt!329311 () BitStream!8320)

(declare-fun readBitPrefixLemma!0 (BitStream!8320 BitStream!8320) Unit!14962)

(assert (=> b!210033 (= lt!329327 (readBitPrefixLemma!0 lt!329311 (_2!9656 lt!329319)))))

(assert (=> b!210033 (= lt!329309 (readBitPure!0 (BitStream!8321 (buf!5123 (_2!9656 lt!329319)) (currentByte!9665 thiss!1204) (currentBit!9660 thiss!1204))))))

(assert (=> b!210033 (= lt!329317 (readBitPure!0 lt!329311))))

(assert (=> b!210033 e!143318))

(declare-fun res!176325 () Bool)

(assert (=> b!210033 (=> (not res!176325) (not e!143318))))

(assert (=> b!210033 (= res!176325 (invariant!0 (currentBit!9660 thiss!1204) (currentByte!9665 thiss!1204) (size!4606 (buf!5123 (_2!9656 lt!329330)))))))

(assert (=> b!210033 (= lt!329311 (BitStream!8321 (buf!5123 (_2!9656 lt!329330)) (currentByte!9665 thiss!1204) (currentBit!9660 thiss!1204)))))

(declare-fun res!176330 () Bool)

(assert (=> start!44088 (=> (not res!176330) (not e!143319))))

(assert (=> start!44088 (= res!176330 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!44088 e!143319))

(assert (=> start!44088 true))

(declare-fun inv!12 (BitStream!8320) Bool)

(assert (=> start!44088 (and (inv!12 thiss!1204) e!143316)))

(declare-fun b!210027 () Bool)

(assert (=> b!210027 (= e!143311 (= (bitIndex!0 (size!4606 (buf!5123 (_1!9657 lt!329320))) (currentByte!9665 (_1!9657 lt!329320)) (currentBit!9660 (_1!9657 lt!329320))) lt!329308))))

(assert (= (and start!44088 res!176330) b!210029))

(assert (= (and b!210029 res!176329) b!210028))

(assert (= (and b!210028 res!176314) b!210020))

(assert (= (and b!210020 res!176320) b!210017))

(assert (= (and b!210017 res!176322) b!210022))

(assert (= (and b!210022 res!176323) b!210023))

(assert (= (and b!210023 res!176319) b!210016))

(assert (= (and b!210016 res!176324) b!210027))

(assert (= (and b!210017 (not res!176321)) b!210025))

(assert (= (and b!210025 (not res!176327)) b!210030))

(assert (= (and b!210030 (not res!176328)) b!210032))

(assert (= (and b!210032 (not res!176318)) b!210018))

(assert (= (and b!210018 (not res!176316)) b!210021))

(assert (= (and b!210021 (not res!176317)) b!210033))

(assert (= (and b!210033 res!176325) b!210026))

(assert (= (and b!210033 res!176326) b!210019))

(assert (= (and b!210033 (not res!176315)) b!210024))

(assert (= start!44088 b!210031))

(declare-fun m!323283 () Bool)

(assert (=> start!44088 m!323283))

(declare-fun m!323285 () Bool)

(assert (=> b!210029 m!323285))

(declare-fun m!323287 () Bool)

(assert (=> b!210026 m!323287))

(declare-fun m!323289 () Bool)

(assert (=> b!210031 m!323289))

(declare-fun m!323291 () Bool)

(assert (=> b!210028 m!323291))

(declare-fun m!323293 () Bool)

(assert (=> b!210022 m!323293))

(declare-fun m!323295 () Bool)

(assert (=> b!210022 m!323295))

(declare-fun m!323297 () Bool)

(assert (=> b!210023 m!323297))

(declare-fun m!323299 () Bool)

(assert (=> b!210025 m!323299))

(declare-fun m!323301 () Bool)

(assert (=> b!210025 m!323301))

(declare-fun m!323303 () Bool)

(assert (=> b!210025 m!323303))

(declare-fun m!323305 () Bool)

(assert (=> b!210025 m!323305))

(declare-fun m!323307 () Bool)

(assert (=> b!210016 m!323307))

(assert (=> b!210016 m!323307))

(declare-fun m!323309 () Bool)

(assert (=> b!210016 m!323309))

(declare-fun m!323311 () Bool)

(assert (=> b!210027 m!323311))

(assert (=> b!210017 m!323293))

(assert (=> b!210017 m!323295))

(declare-fun m!323313 () Bool)

(assert (=> b!210017 m!323313))

(declare-fun m!323315 () Bool)

(assert (=> b!210018 m!323315))

(declare-fun m!323317 () Bool)

(assert (=> b!210024 m!323317))

(declare-fun m!323319 () Bool)

(assert (=> b!210024 m!323319))

(declare-fun m!323321 () Bool)

(assert (=> b!210024 m!323321))

(assert (=> b!210024 m!323321))

(declare-fun m!323323 () Bool)

(assert (=> b!210024 m!323323))

(assert (=> b!210021 m!323297))

(declare-fun m!323325 () Bool)

(assert (=> b!210033 m!323325))

(declare-fun m!323327 () Bool)

(assert (=> b!210033 m!323327))

(declare-fun m!323329 () Bool)

(assert (=> b!210033 m!323329))

(declare-fun m!323331 () Bool)

(assert (=> b!210033 m!323331))

(declare-fun m!323333 () Bool)

(assert (=> b!210033 m!323333))

(declare-fun m!323335 () Bool)

(assert (=> b!210033 m!323335))

(declare-fun m!323337 () Bool)

(assert (=> b!210033 m!323337))

(declare-fun m!323339 () Bool)

(assert (=> b!210033 m!323339))

(declare-fun m!323341 () Bool)

(assert (=> b!210033 m!323341))

(declare-fun m!323343 () Bool)

(assert (=> b!210033 m!323343))

(declare-fun m!323345 () Bool)

(assert (=> b!210033 m!323345))

(declare-fun m!323347 () Bool)

(assert (=> b!210033 m!323347))

(declare-fun m!323349 () Bool)

(assert (=> b!210033 m!323349))

(declare-fun m!323351 () Bool)

(assert (=> b!210033 m!323351))

(declare-fun m!323353 () Bool)

(assert (=> b!210033 m!323353))

(declare-fun m!323355 () Bool)

(assert (=> b!210033 m!323355))

(declare-fun m!323357 () Bool)

(assert (=> b!210030 m!323357))

(push 1)

(assert (not b!210022))

(assert (not b!210033))

(assert (not b!210024))

(assert (not b!210021))

(assert (not b!210030))

(assert (not b!210023))

(assert (not b!210025))

(assert (not b!210031))

(assert (not b!210029))

(assert (not b!210026))

(assert (not b!210018))

(assert (not b!210027))

(assert (not b!210017))

(assert (not start!44088))

(assert (not b!210016))

(assert (not b!210028))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!71069 () Bool)

(declare-datatypes ((tuple2!18030 0))(
  ( (tuple2!18031 (_1!9670 Bool) (_2!9670 BitStream!8320)) )
))
(declare-fun lt!329576 () tuple2!18030)

(declare-fun readBit!0 (BitStream!8320) tuple2!18030)

(assert (=> d!71069 (= lt!329576 (readBit!0 (readerFrom!0 (_2!9656 lt!329330) (currentBit!9660 thiss!1204) (currentByte!9665 thiss!1204))))))

(assert (=> d!71069 (= (readBitPure!0 (readerFrom!0 (_2!9656 lt!329330) (currentBit!9660 thiss!1204) (currentByte!9665 thiss!1204))) (tuple2!18005 (_2!9670 lt!329576) (_1!9670 lt!329576)))))

(declare-fun bs!17457 () Bool)

(assert (= bs!17457 d!71069))

(assert (=> bs!17457 m!323307))

(declare-fun m!323567 () Bool)

(assert (=> bs!17457 m!323567))

(assert (=> b!210016 d!71069))

(declare-fun d!71071 () Bool)

(declare-fun e!143423 () Bool)

(assert (=> d!71071 e!143423))

(declare-fun res!176477 () Bool)

(assert (=> d!71071 (=> (not res!176477) (not e!143423))))

(assert (=> d!71071 (= res!176477 (invariant!0 (currentBit!9660 (_2!9656 lt!329330)) (currentByte!9665 (_2!9656 lt!329330)) (size!4606 (buf!5123 (_2!9656 lt!329330)))))))

(assert (=> d!71071 (= (readerFrom!0 (_2!9656 lt!329330) (currentBit!9660 thiss!1204) (currentByte!9665 thiss!1204)) (BitStream!8321 (buf!5123 (_2!9656 lt!329330)) (currentByte!9665 thiss!1204) (currentBit!9660 thiss!1204)))))

(declare-fun b!210185 () Bool)

(assert (=> b!210185 (= e!143423 (invariant!0 (currentBit!9660 thiss!1204) (currentByte!9665 thiss!1204) (size!4606 (buf!5123 (_2!9656 lt!329330)))))))

(assert (= (and d!71071 res!176477) b!210185))

(declare-fun m!323569 () Bool)

(assert (=> d!71071 m!323569))

(assert (=> b!210185 m!323333))

(assert (=> b!210016 d!71071))

(declare-fun d!71073 () Bool)

(declare-fun e!143427 () Bool)

(assert (=> d!71073 e!143427))

(declare-fun res!176483 () Bool)

(assert (=> d!71073 (=> (not res!176483) (not e!143427))))

(declare-fun lt!329606 () (_ BitVec 64))

(declare-fun lt!329604 () (_ BitVec 64))

(declare-fun lt!329603 () (_ BitVec 64))

(assert (=> d!71073 (= res!176483 (= lt!329604 (bvsub lt!329606 lt!329603)))))

(assert (=> d!71073 (or (= (bvand lt!329606 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!329603 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!329606 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!329606 lt!329603) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!71073 (= lt!329603 (remainingBits!0 ((_ sign_extend 32) (size!4606 (buf!5123 (_1!9657 lt!329320)))) ((_ sign_extend 32) (currentByte!9665 (_1!9657 lt!329320))) ((_ sign_extend 32) (currentBit!9660 (_1!9657 lt!329320)))))))

(declare-fun lt!329605 () (_ BitVec 64))

(declare-fun lt!329607 () (_ BitVec 64))

(assert (=> d!71073 (= lt!329606 (bvmul lt!329605 lt!329607))))

(assert (=> d!71073 (or (= lt!329605 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!329607 (bvsdiv (bvmul lt!329605 lt!329607) lt!329605)))))

(assert (=> d!71073 (= lt!329607 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71073 (= lt!329605 ((_ sign_extend 32) (size!4606 (buf!5123 (_1!9657 lt!329320)))))))

(assert (=> d!71073 (= lt!329604 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9665 (_1!9657 lt!329320))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9660 (_1!9657 lt!329320)))))))

(assert (=> d!71073 (invariant!0 (currentBit!9660 (_1!9657 lt!329320)) (currentByte!9665 (_1!9657 lt!329320)) (size!4606 (buf!5123 (_1!9657 lt!329320))))))

(assert (=> d!71073 (= (bitIndex!0 (size!4606 (buf!5123 (_1!9657 lt!329320))) (currentByte!9665 (_1!9657 lt!329320)) (currentBit!9660 (_1!9657 lt!329320))) lt!329604)))

(declare-fun b!210191 () Bool)

(declare-fun res!176484 () Bool)

(assert (=> b!210191 (=> (not res!176484) (not e!143427))))

(assert (=> b!210191 (= res!176484 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!329604))))

(declare-fun b!210192 () Bool)

(declare-fun lt!329608 () (_ BitVec 64))

(assert (=> b!210192 (= e!143427 (bvsle lt!329604 (bvmul lt!329608 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!210192 (or (= lt!329608 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!329608 #b0000000000000000000000000000000000000000000000000000000000001000) lt!329608)))))

(assert (=> b!210192 (= lt!329608 ((_ sign_extend 32) (size!4606 (buf!5123 (_1!9657 lt!329320)))))))

(assert (= (and d!71073 res!176483) b!210191))

(assert (= (and b!210191 res!176484) b!210192))

(declare-fun m!323585 () Bool)

(assert (=> d!71073 m!323585))

(declare-fun m!323587 () Bool)

(assert (=> d!71073 m!323587))

(assert (=> b!210027 d!71073))

(declare-fun d!71081 () Bool)

(assert (=> d!71081 (= (invariant!0 (currentBit!9660 thiss!1204) (currentByte!9665 thiss!1204) (size!4606 (buf!5123 (_2!9656 lt!329319)))) (and (bvsge (currentBit!9660 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9660 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9665 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9665 thiss!1204) (size!4606 (buf!5123 (_2!9656 lt!329319)))) (and (= (currentBit!9660 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9665 thiss!1204) (size!4606 (buf!5123 (_2!9656 lt!329319))))))))))

(assert (=> b!210026 d!71081))

(declare-fun d!71083 () Bool)

(declare-fun e!143428 () Bool)

(assert (=> d!71083 e!143428))

(declare-fun res!176485 () Bool)

(assert (=> d!71083 (=> (not res!176485) (not e!143428))))

(declare-fun lt!329609 () (_ BitVec 64))

(declare-fun lt!329610 () (_ BitVec 64))

(declare-fun lt!329612 () (_ BitVec 64))

(assert (=> d!71083 (= res!176485 (= lt!329610 (bvsub lt!329612 lt!329609)))))

(assert (=> d!71083 (or (= (bvand lt!329612 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!329609 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!329612 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!329612 lt!329609) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71083 (= lt!329609 (remainingBits!0 ((_ sign_extend 32) (size!4606 (buf!5123 (_2!9656 lt!329319)))) ((_ sign_extend 32) (currentByte!9665 (_2!9656 lt!329319))) ((_ sign_extend 32) (currentBit!9660 (_2!9656 lt!329319)))))))

(declare-fun lt!329611 () (_ BitVec 64))

(declare-fun lt!329613 () (_ BitVec 64))

(assert (=> d!71083 (= lt!329612 (bvmul lt!329611 lt!329613))))

(assert (=> d!71083 (or (= lt!329611 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!329613 (bvsdiv (bvmul lt!329611 lt!329613) lt!329611)))))

(assert (=> d!71083 (= lt!329613 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71083 (= lt!329611 ((_ sign_extend 32) (size!4606 (buf!5123 (_2!9656 lt!329319)))))))

(assert (=> d!71083 (= lt!329610 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9665 (_2!9656 lt!329319))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9660 (_2!9656 lt!329319)))))))

(assert (=> d!71083 (invariant!0 (currentBit!9660 (_2!9656 lt!329319)) (currentByte!9665 (_2!9656 lt!329319)) (size!4606 (buf!5123 (_2!9656 lt!329319))))))

(assert (=> d!71083 (= (bitIndex!0 (size!4606 (buf!5123 (_2!9656 lt!329319))) (currentByte!9665 (_2!9656 lt!329319)) (currentBit!9660 (_2!9656 lt!329319))) lt!329610)))

(declare-fun b!210193 () Bool)

(declare-fun res!176486 () Bool)

(assert (=> b!210193 (=> (not res!176486) (not e!143428))))

(assert (=> b!210193 (= res!176486 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!329610))))

(declare-fun b!210194 () Bool)

(declare-fun lt!329614 () (_ BitVec 64))

(assert (=> b!210194 (= e!143428 (bvsle lt!329610 (bvmul lt!329614 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!210194 (or (= lt!329614 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!329614 #b0000000000000000000000000000000000000000000000000000000000001000) lt!329614)))))

(assert (=> b!210194 (= lt!329614 ((_ sign_extend 32) (size!4606 (buf!5123 (_2!9656 lt!329319)))))))

(assert (= (and d!71083 res!176485) b!210193))

(assert (= (and b!210193 res!176486) b!210194))

(declare-fun m!323589 () Bool)

(assert (=> d!71083 m!323589))

(assert (=> d!71083 m!323357))

(assert (=> b!210025 d!71083))

(declare-fun d!71085 () Bool)

(declare-fun res!176493 () Bool)

(declare-fun e!143434 () Bool)

(assert (=> d!71085 (=> (not res!176493) (not e!143434))))

(assert (=> d!71085 (= res!176493 (= (size!4606 (buf!5123 thiss!1204)) (size!4606 (buf!5123 (_2!9656 lt!329319)))))))

(assert (=> d!71085 (= (isPrefixOf!0 thiss!1204 (_2!9656 lt!329319)) e!143434)))

(declare-fun b!210201 () Bool)

(declare-fun res!176494 () Bool)

(assert (=> b!210201 (=> (not res!176494) (not e!143434))))

(assert (=> b!210201 (= res!176494 (bvsle (bitIndex!0 (size!4606 (buf!5123 thiss!1204)) (currentByte!9665 thiss!1204) (currentBit!9660 thiss!1204)) (bitIndex!0 (size!4606 (buf!5123 (_2!9656 lt!329319))) (currentByte!9665 (_2!9656 lt!329319)) (currentBit!9660 (_2!9656 lt!329319)))))))

(declare-fun b!210202 () Bool)

(declare-fun e!143433 () Bool)

(assert (=> b!210202 (= e!143434 e!143433)))

(declare-fun res!176495 () Bool)

(assert (=> b!210202 (=> res!176495 e!143433)))

(assert (=> b!210202 (= res!176495 (= (size!4606 (buf!5123 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!210203 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10481 array!10481 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!210203 (= e!143433 (arrayBitRangesEq!0 (buf!5123 thiss!1204) (buf!5123 (_2!9656 lt!329319)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4606 (buf!5123 thiss!1204)) (currentByte!9665 thiss!1204) (currentBit!9660 thiss!1204))))))

(assert (= (and d!71085 res!176493) b!210201))

(assert (= (and b!210201 res!176494) b!210202))

(assert (= (and b!210202 (not res!176495)) b!210203))

(assert (=> b!210201 m!323295))

(assert (=> b!210201 m!323299))

(assert (=> b!210203 m!323295))

(assert (=> b!210203 m!323295))

(declare-fun m!323591 () Bool)

(assert (=> b!210203 m!323591))

(assert (=> b!210025 d!71085))

(declare-fun d!71087 () Bool)

(assert (=> d!71087 (isPrefixOf!0 thiss!1204 (_2!9656 lt!329319))))

(declare-fun lt!329617 () Unit!14962)

(declare-fun choose!30 (BitStream!8320 BitStream!8320 BitStream!8320) Unit!14962)

(assert (=> d!71087 (= lt!329617 (choose!30 thiss!1204 (_2!9656 lt!329330) (_2!9656 lt!329319)))))

(assert (=> d!71087 (isPrefixOf!0 thiss!1204 (_2!9656 lt!329330))))

(assert (=> d!71087 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9656 lt!329330) (_2!9656 lt!329319)) lt!329617)))

(declare-fun bs!17460 () Bool)

(assert (= bs!17460 d!71087))

(assert (=> bs!17460 m!323301))

(declare-fun m!323593 () Bool)

(assert (=> bs!17460 m!323593))

(assert (=> bs!17460 m!323297))

(assert (=> b!210025 d!71087))

(declare-fun d!71089 () Bool)

(declare-fun e!143487 () Bool)

(assert (=> d!71089 e!143487))

(declare-fun res!176575 () Bool)

(assert (=> d!71089 (=> (not res!176575) (not e!143487))))

(declare-fun lt!329943 () tuple2!18002)

(assert (=> d!71089 (= res!176575 (invariant!0 (currentBit!9660 (_2!9656 lt!329943)) (currentByte!9665 (_2!9656 lt!329943)) (size!4606 (buf!5123 (_2!9656 lt!329943)))))))

(declare-fun e!143489 () tuple2!18002)

(assert (=> d!71089 (= lt!329943 e!143489)))

(declare-fun c!10339 () Bool)

(assert (=> d!71089 (= c!10339 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!71089 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!71089 (= (appendBitsLSBFirstLoopTR!0 (_2!9656 lt!329330) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!329943)))

(declare-fun b!210301 () Bool)

(declare-fun res!176577 () Bool)

(assert (=> b!210301 (=> (not res!176577) (not e!143487))))

(assert (=> b!210301 (= res!176577 (isPrefixOf!0 (_2!9656 lt!329330) (_2!9656 lt!329943)))))

(declare-fun b!210302 () Bool)

(declare-fun e!143493 () Bool)

(declare-fun lt!329934 () tuple2!18004)

(declare-fun lt!329960 () tuple2!18004)

(assert (=> b!210302 (= e!143493 (= (_2!9657 lt!329934) (_2!9657 lt!329960)))))

(declare-fun b!210303 () Bool)

(declare-fun res!176584 () Bool)

(assert (=> b!210303 (=> (not res!176584) (not e!143487))))

(declare-fun lt!329924 () (_ BitVec 64))

(declare-fun lt!329946 () (_ BitVec 64))

(assert (=> b!210303 (= res!176584 (= (bitIndex!0 (size!4606 (buf!5123 (_2!9656 lt!329943))) (currentByte!9665 (_2!9656 lt!329943)) (currentBit!9660 (_2!9656 lt!329943))) (bvsub lt!329946 lt!329924)))))

(assert (=> b!210303 (or (= (bvand lt!329946 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!329924 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!329946 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!329946 lt!329924) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210303 (= lt!329924 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!329940 () (_ BitVec 64))

(declare-fun lt!329941 () (_ BitVec 64))

(assert (=> b!210303 (= lt!329946 (bvadd lt!329940 lt!329941))))

(assert (=> b!210303 (or (not (= (bvand lt!329940 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!329941 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!329940 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!329940 lt!329941) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210303 (= lt!329941 ((_ sign_extend 32) nBits!348))))

(assert (=> b!210303 (= lt!329940 (bitIndex!0 (size!4606 (buf!5123 (_2!9656 lt!329330))) (currentByte!9665 (_2!9656 lt!329330)) (currentBit!9660 (_2!9656 lt!329330))))))

(declare-fun b!210304 () Bool)

(declare-fun res!176576 () Bool)

(declare-fun lt!329936 () tuple2!18002)

(assert (=> b!210304 (= res!176576 (= (bitIndex!0 (size!4606 (buf!5123 (_2!9656 lt!329936))) (currentByte!9665 (_2!9656 lt!329936)) (currentBit!9660 (_2!9656 lt!329936))) (bvadd (bitIndex!0 (size!4606 (buf!5123 (_2!9656 lt!329330))) (currentByte!9665 (_2!9656 lt!329330)) (currentBit!9660 (_2!9656 lt!329330))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!143491 () Bool)

(assert (=> b!210304 (=> (not res!176576) (not e!143491))))

(declare-fun b!210305 () Bool)

(declare-fun e!143488 () Bool)

(declare-fun lt!329915 () tuple2!18008)

(declare-fun lt!329969 () tuple2!18006)

(assert (=> b!210305 (= e!143488 (= (_1!9659 lt!329915) (_2!9658 lt!329969)))))

(declare-fun b!210306 () Bool)

(declare-fun e!143492 () Bool)

(declare-fun lt!329955 () tuple2!18008)

(declare-fun lt!329930 () tuple2!18006)

(assert (=> b!210306 (= e!143492 (= (_1!9659 lt!329955) (_2!9658 lt!329930)))))

(declare-fun b!210307 () Bool)

(declare-fun res!176573 () Bool)

(assert (=> b!210307 (=> (not res!176573) (not e!143487))))

(assert (=> b!210307 (= res!176573 (= (size!4606 (buf!5123 (_2!9656 lt!329330))) (size!4606 (buf!5123 (_2!9656 lt!329943)))))))

(declare-fun call!3309 () Bool)

(declare-fun lt!329923 () tuple2!18002)

(declare-fun bm!3306 () Bool)

(assert (=> bm!3306 (= call!3309 (isPrefixOf!0 (_2!9656 lt!329330) (ite c!10339 (_2!9656 lt!329330) (_2!9656 lt!329923))))))

(declare-fun b!210308 () Bool)

(declare-fun e!143494 () Bool)

(declare-fun lt!329944 () tuple2!18004)

(assert (=> b!210308 (= e!143494 (= (bitIndex!0 (size!4606 (buf!5123 (_1!9657 lt!329944))) (currentByte!9665 (_1!9657 lt!329944)) (currentBit!9660 (_1!9657 lt!329944))) (bitIndex!0 (size!4606 (buf!5123 (_2!9656 lt!329936))) (currentByte!9665 (_2!9656 lt!329936)) (currentBit!9660 (_2!9656 lt!329936)))))))

(declare-fun b!210309 () Bool)

(declare-fun res!176581 () Bool)

(assert (=> b!210309 (= res!176581 (isPrefixOf!0 (_2!9656 lt!329330) (_2!9656 lt!329936)))))

(assert (=> b!210309 (=> (not res!176581) (not e!143491))))

(declare-fun b!210310 () Bool)

(declare-fun Unit!14969 () Unit!14962)

(assert (=> b!210310 (= e!143489 (tuple2!18003 Unit!14969 (_2!9656 lt!329330)))))

(declare-fun lt!329958 () Unit!14962)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8320) Unit!14962)

(assert (=> b!210310 (= lt!329958 (lemmaIsPrefixRefl!0 (_2!9656 lt!329330)))))

(assert (=> b!210310 call!3309))

(declare-fun lt!329935 () Unit!14962)

(assert (=> b!210310 (= lt!329935 lt!329958)))

(declare-fun b!210311 () Bool)

(declare-fun e!143490 () Bool)

(declare-fun lt!329928 () (_ BitVec 64))

(assert (=> b!210311 (= e!143490 (validate_offset_bits!1 ((_ sign_extend 32) (size!4606 (buf!5123 (_2!9656 lt!329330)))) ((_ sign_extend 32) (currentByte!9665 (_2!9656 lt!329330))) ((_ sign_extend 32) (currentBit!9660 (_2!9656 lt!329330))) lt!329928))))

(declare-fun b!210312 () Bool)

(assert (=> b!210312 (= e!143489 (tuple2!18003 (_1!9656 lt!329923) (_2!9656 lt!329923)))))

(declare-fun lt!329956 () Bool)

(assert (=> b!210312 (= lt!329956 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210312 (= lt!329936 (appendBit!0 (_2!9656 lt!329330) lt!329956))))

(declare-fun res!176582 () Bool)

(assert (=> b!210312 (= res!176582 (= (size!4606 (buf!5123 (_2!9656 lt!329330))) (size!4606 (buf!5123 (_2!9656 lt!329936)))))))

(assert (=> b!210312 (=> (not res!176582) (not e!143491))))

(assert (=> b!210312 e!143491))

(declare-fun lt!329951 () tuple2!18002)

(assert (=> b!210312 (= lt!329951 lt!329936)))

(assert (=> b!210312 (= lt!329923 (appendBitsLSBFirstLoopTR!0 (_2!9656 lt!329951) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!329968 () Unit!14962)

(assert (=> b!210312 (= lt!329968 (lemmaIsPrefixTransitive!0 (_2!9656 lt!329330) (_2!9656 lt!329951) (_2!9656 lt!329923)))))

(assert (=> b!210312 call!3309))

(declare-fun lt!329949 () Unit!14962)

(assert (=> b!210312 (= lt!329949 lt!329968)))

(assert (=> b!210312 (invariant!0 (currentBit!9660 (_2!9656 lt!329330)) (currentByte!9665 (_2!9656 lt!329330)) (size!4606 (buf!5123 (_2!9656 lt!329951))))))

(declare-fun lt!329931 () BitStream!8320)

(assert (=> b!210312 (= lt!329931 (BitStream!8321 (buf!5123 (_2!9656 lt!329951)) (currentByte!9665 (_2!9656 lt!329330)) (currentBit!9660 (_2!9656 lt!329330))))))

(assert (=> b!210312 (invariant!0 (currentBit!9660 lt!329931) (currentByte!9665 lt!329931) (size!4606 (buf!5123 (_2!9656 lt!329923))))))

(declare-fun lt!329939 () BitStream!8320)

(assert (=> b!210312 (= lt!329939 (BitStream!8321 (buf!5123 (_2!9656 lt!329923)) (currentByte!9665 lt!329931) (currentBit!9660 lt!329931)))))

(assert (=> b!210312 (= lt!329934 (readBitPure!0 lt!329931))))

(assert (=> b!210312 (= lt!329960 (readBitPure!0 lt!329939))))

(declare-fun lt!329922 () Unit!14962)

(assert (=> b!210312 (= lt!329922 (readBitPrefixLemma!0 lt!329931 (_2!9656 lt!329923)))))

(declare-fun res!176580 () Bool)

(assert (=> b!210312 (= res!176580 (= (bitIndex!0 (size!4606 (buf!5123 (_1!9657 lt!329934))) (currentByte!9665 (_1!9657 lt!329934)) (currentBit!9660 (_1!9657 lt!329934))) (bitIndex!0 (size!4606 (buf!5123 (_1!9657 lt!329960))) (currentByte!9665 (_1!9657 lt!329960)) (currentBit!9660 (_1!9657 lt!329960)))))))

(assert (=> b!210312 (=> (not res!176580) (not e!143493))))

(assert (=> b!210312 e!143493))

(declare-fun lt!329957 () Unit!14962)

(assert (=> b!210312 (= lt!329957 lt!329922)))

(declare-fun lt!329959 () tuple2!18006)

(assert (=> b!210312 (= lt!329959 (reader!0 (_2!9656 lt!329330) (_2!9656 lt!329923)))))

(declare-fun lt!329972 () tuple2!18006)

(assert (=> b!210312 (= lt!329972 (reader!0 (_2!9656 lt!329951) (_2!9656 lt!329923)))))

(declare-fun lt!329965 () tuple2!18004)

(assert (=> b!210312 (= lt!329965 (readBitPure!0 (_1!9658 lt!329959)))))

(assert (=> b!210312 (= (_2!9657 lt!329965) lt!329956)))

(declare-fun lt!329948 () Unit!14962)

(declare-fun Unit!14971 () Unit!14962)

(assert (=> b!210312 (= lt!329948 Unit!14971)))

(declare-fun lt!329921 () (_ BitVec 64))

(assert (=> b!210312 (= lt!329921 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!329966 () (_ BitVec 64))

(assert (=> b!210312 (= lt!329966 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!329917 () Unit!14962)

(assert (=> b!210312 (= lt!329917 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9656 lt!329330) (buf!5123 (_2!9656 lt!329923)) lt!329966))))

(assert (=> b!210312 (validate_offset_bits!1 ((_ sign_extend 32) (size!4606 (buf!5123 (_2!9656 lt!329923)))) ((_ sign_extend 32) (currentByte!9665 (_2!9656 lt!329330))) ((_ sign_extend 32) (currentBit!9660 (_2!9656 lt!329330))) lt!329966)))

(declare-fun lt!329971 () Unit!14962)

(assert (=> b!210312 (= lt!329971 lt!329917)))

(declare-fun lt!329953 () tuple2!18008)

(assert (=> b!210312 (= lt!329953 (readNBitsLSBFirstsLoopPure!0 (_1!9658 lt!329959) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!329921))))

(declare-fun lt!329962 () (_ BitVec 64))

(assert (=> b!210312 (= lt!329962 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!329952 () Unit!14962)

(assert (=> b!210312 (= lt!329952 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9656 lt!329951) (buf!5123 (_2!9656 lt!329923)) lt!329962))))

(assert (=> b!210312 (validate_offset_bits!1 ((_ sign_extend 32) (size!4606 (buf!5123 (_2!9656 lt!329923)))) ((_ sign_extend 32) (currentByte!9665 (_2!9656 lt!329951))) ((_ sign_extend 32) (currentBit!9660 (_2!9656 lt!329951))) lt!329962)))

(declare-fun lt!329947 () Unit!14962)

(assert (=> b!210312 (= lt!329947 lt!329952)))

(declare-fun lt!329964 () tuple2!18008)

(assert (=> b!210312 (= lt!329964 (readNBitsLSBFirstsLoopPure!0 (_1!9658 lt!329972) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!329921 (ite (_2!9657 lt!329965) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!329926 () tuple2!18008)

(assert (=> b!210312 (= lt!329926 (readNBitsLSBFirstsLoopPure!0 (_1!9658 lt!329959) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!329921))))

(declare-fun c!10340 () Bool)

(assert (=> b!210312 (= c!10340 (_2!9657 (readBitPure!0 (_1!9658 lt!329959))))))

(declare-fun e!143495 () (_ BitVec 64))

(declare-fun lt!329950 () tuple2!18008)

(assert (=> b!210312 (= lt!329950 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9658 lt!329959) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!329921 e!143495)))))

(declare-fun lt!329954 () Unit!14962)

(assert (=> b!210312 (= lt!329954 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9658 lt!329959) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!329921))))

(assert (=> b!210312 (and (= (_2!9659 lt!329926) (_2!9659 lt!329950)) (= (_1!9659 lt!329926) (_1!9659 lt!329950)))))

(declare-fun lt!329938 () Unit!14962)

(assert (=> b!210312 (= lt!329938 lt!329954)))

(assert (=> b!210312 (= (_1!9658 lt!329959) (withMovedBitIndex!0 (_2!9658 lt!329959) (bvsub (bitIndex!0 (size!4606 (buf!5123 (_2!9656 lt!329330))) (currentByte!9665 (_2!9656 lt!329330)) (currentBit!9660 (_2!9656 lt!329330))) (bitIndex!0 (size!4606 (buf!5123 (_2!9656 lt!329923))) (currentByte!9665 (_2!9656 lt!329923)) (currentBit!9660 (_2!9656 lt!329923))))))))

(declare-fun lt!329925 () Unit!14962)

(declare-fun Unit!14972 () Unit!14962)

(assert (=> b!210312 (= lt!329925 Unit!14972)))

(assert (=> b!210312 (= (_1!9658 lt!329972) (withMovedBitIndex!0 (_2!9658 lt!329972) (bvsub (bitIndex!0 (size!4606 (buf!5123 (_2!9656 lt!329951))) (currentByte!9665 (_2!9656 lt!329951)) (currentBit!9660 (_2!9656 lt!329951))) (bitIndex!0 (size!4606 (buf!5123 (_2!9656 lt!329923))) (currentByte!9665 (_2!9656 lt!329923)) (currentBit!9660 (_2!9656 lt!329923))))))))

(declare-fun lt!329967 () Unit!14962)

(declare-fun Unit!14973 () Unit!14962)

(assert (=> b!210312 (= lt!329967 Unit!14973)))

(assert (=> b!210312 (= (bitIndex!0 (size!4606 (buf!5123 (_2!9656 lt!329330))) (currentByte!9665 (_2!9656 lt!329330)) (currentBit!9660 (_2!9656 lt!329330))) (bvsub (bitIndex!0 (size!4606 (buf!5123 (_2!9656 lt!329951))) (currentByte!9665 (_2!9656 lt!329951)) (currentBit!9660 (_2!9656 lt!329951))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!329970 () Unit!14962)

(declare-fun Unit!14974 () Unit!14962)

(assert (=> b!210312 (= lt!329970 Unit!14974)))

(assert (=> b!210312 (= (_2!9659 lt!329953) (_2!9659 lt!329964))))

(declare-fun lt!329927 () Unit!14962)

(declare-fun Unit!14975 () Unit!14962)

(assert (=> b!210312 (= lt!329927 Unit!14975)))

(assert (=> b!210312 (invariant!0 (currentBit!9660 (_2!9656 lt!329923)) (currentByte!9665 (_2!9656 lt!329923)) (size!4606 (buf!5123 (_2!9656 lt!329923))))))

(declare-fun lt!329942 () Unit!14962)

(declare-fun Unit!14976 () Unit!14962)

(assert (=> b!210312 (= lt!329942 Unit!14976)))

(assert (=> b!210312 (= (size!4606 (buf!5123 (_2!9656 lt!329330))) (size!4606 (buf!5123 (_2!9656 lt!329923))))))

(declare-fun lt!329916 () Unit!14962)

(declare-fun Unit!14977 () Unit!14962)

(assert (=> b!210312 (= lt!329916 Unit!14977)))

(assert (=> b!210312 (= (bitIndex!0 (size!4606 (buf!5123 (_2!9656 lt!329923))) (currentByte!9665 (_2!9656 lt!329923)) (currentBit!9660 (_2!9656 lt!329923))) (bvsub (bvadd (bitIndex!0 (size!4606 (buf!5123 (_2!9656 lt!329330))) (currentByte!9665 (_2!9656 lt!329330)) (currentBit!9660 (_2!9656 lt!329330))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!329929 () Unit!14962)

(declare-fun Unit!14978 () Unit!14962)

(assert (=> b!210312 (= lt!329929 Unit!14978)))

(declare-fun lt!329961 () Unit!14962)

(declare-fun Unit!14979 () Unit!14962)

(assert (=> b!210312 (= lt!329961 Unit!14979)))

(assert (=> b!210312 (= lt!329969 (reader!0 (_2!9656 lt!329330) (_2!9656 lt!329923)))))

(declare-fun lt!329937 () (_ BitVec 64))

(assert (=> b!210312 (= lt!329937 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!329919 () Unit!14962)

(assert (=> b!210312 (= lt!329919 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9656 lt!329330) (buf!5123 (_2!9656 lt!329923)) lt!329937))))

(assert (=> b!210312 (validate_offset_bits!1 ((_ sign_extend 32) (size!4606 (buf!5123 (_2!9656 lt!329923)))) ((_ sign_extend 32) (currentByte!9665 (_2!9656 lt!329330))) ((_ sign_extend 32) (currentBit!9660 (_2!9656 lt!329330))) lt!329937)))

(declare-fun lt!329920 () Unit!14962)

(assert (=> b!210312 (= lt!329920 lt!329919)))

(assert (=> b!210312 (= lt!329915 (readNBitsLSBFirstsLoopPure!0 (_1!9658 lt!329969) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!176578 () Bool)

(assert (=> b!210312 (= res!176578 (= (_2!9659 lt!329915) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!210312 (=> (not res!176578) (not e!143488))))

(assert (=> b!210312 e!143488))

(declare-fun lt!329945 () Unit!14962)

(declare-fun Unit!14980 () Unit!14962)

(assert (=> b!210312 (= lt!329945 Unit!14980)))

(declare-fun b!210313 () Bool)

(assert (=> b!210313 (= e!143495 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!210314 () Bool)

(assert (=> b!210314 (= e!143487 e!143492)))

(declare-fun res!176579 () Bool)

(assert (=> b!210314 (=> (not res!176579) (not e!143492))))

(assert (=> b!210314 (= res!176579 (= (_2!9659 lt!329955) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!210314 (= lt!329955 (readNBitsLSBFirstsLoopPure!0 (_1!9658 lt!329930) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!329963 () Unit!14962)

(declare-fun lt!329918 () Unit!14962)

(assert (=> b!210314 (= lt!329963 lt!329918)))

(assert (=> b!210314 (validate_offset_bits!1 ((_ sign_extend 32) (size!4606 (buf!5123 (_2!9656 lt!329943)))) ((_ sign_extend 32) (currentByte!9665 (_2!9656 lt!329330))) ((_ sign_extend 32) (currentBit!9660 (_2!9656 lt!329330))) lt!329928)))

(assert (=> b!210314 (= lt!329918 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9656 lt!329330) (buf!5123 (_2!9656 lt!329943)) lt!329928))))

(assert (=> b!210314 e!143490))

(declare-fun res!176574 () Bool)

(assert (=> b!210314 (=> (not res!176574) (not e!143490))))

(assert (=> b!210314 (= res!176574 (and (= (size!4606 (buf!5123 (_2!9656 lt!329330))) (size!4606 (buf!5123 (_2!9656 lt!329943)))) (bvsge lt!329928 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210314 (= lt!329928 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!210314 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!210314 (= lt!329930 (reader!0 (_2!9656 lt!329330) (_2!9656 lt!329943)))))

(declare-fun b!210315 () Bool)

(assert (=> b!210315 (= lt!329944 (readBitPure!0 (readerFrom!0 (_2!9656 lt!329936) (currentBit!9660 (_2!9656 lt!329330)) (currentByte!9665 (_2!9656 lt!329330)))))))

(declare-fun res!176583 () Bool)

(assert (=> b!210315 (= res!176583 (and (= (_2!9657 lt!329944) lt!329956) (= (_1!9657 lt!329944) (_2!9656 lt!329936))))))

(assert (=> b!210315 (=> (not res!176583) (not e!143494))))

(assert (=> b!210315 (= e!143491 e!143494)))

(declare-fun b!210316 () Bool)

(assert (=> b!210316 (= e!143495 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (= (and d!71089 c!10339) b!210310))

(assert (= (and d!71089 (not c!10339)) b!210312))

(assert (= (and b!210312 res!176582) b!210304))

(assert (= (and b!210304 res!176576) b!210309))

(assert (= (and b!210309 res!176581) b!210315))

(assert (= (and b!210315 res!176583) b!210308))

(assert (= (and b!210312 res!176580) b!210302))

(assert (= (and b!210312 c!10340) b!210313))

(assert (= (and b!210312 (not c!10340)) b!210316))

(assert (= (and b!210312 res!176578) b!210305))

(assert (= (or b!210310 b!210312) bm!3306))

(assert (= (and d!71089 res!176575) b!210307))

(assert (= (and b!210307 res!176573) b!210303))

(assert (= (and b!210303 res!176584) b!210301))

(assert (= (and b!210301 res!176577) b!210314))

(assert (= (and b!210314 res!176574) b!210311))

(assert (= (and b!210314 res!176579) b!210306))

(declare-fun m!323687 () Bool)

(assert (=> b!210309 m!323687))

(declare-fun m!323689 () Bool)

(assert (=> b!210301 m!323689))

(declare-fun m!323691 () Bool)

(assert (=> b!210311 m!323691))

(declare-fun m!323693 () Bool)

(assert (=> b!210308 m!323693))

(declare-fun m!323695 () Bool)

(assert (=> b!210308 m!323695))

(declare-fun m!323697 () Bool)

(assert (=> bm!3306 m!323697))

(assert (=> b!210304 m!323695))

(assert (=> b!210304 m!323293))

(declare-fun m!323699 () Bool)

(assert (=> d!71089 m!323699))

(declare-fun m!323701 () Bool)

(assert (=> b!210303 m!323701))

(assert (=> b!210303 m!323293))

(declare-fun m!323703 () Bool)

(assert (=> b!210310 m!323703))

(declare-fun m!323705 () Bool)

(assert (=> b!210314 m!323705))

(declare-fun m!323707 () Bool)

(assert (=> b!210314 m!323707))

(declare-fun m!323709 () Bool)

(assert (=> b!210314 m!323709))

(declare-fun m!323711 () Bool)

(assert (=> b!210314 m!323711))

(declare-fun m!323713 () Bool)

(assert (=> b!210314 m!323713))

(declare-fun m!323715 () Bool)

(assert (=> b!210314 m!323715))

(declare-fun m!323717 () Bool)

(assert (=> b!210312 m!323717))

(declare-fun m!323719 () Bool)

(assert (=> b!210312 m!323719))

(assert (=> b!210312 m!323707))

(declare-fun m!323721 () Bool)

(assert (=> b!210312 m!323721))

(declare-fun m!323723 () Bool)

(assert (=> b!210312 m!323723))

(declare-fun m!323725 () Bool)

(assert (=> b!210312 m!323725))

(declare-fun m!323727 () Bool)

(assert (=> b!210312 m!323727))

(assert (=> b!210312 m!323293))

(declare-fun m!323729 () Bool)

(assert (=> b!210312 m!323729))

(assert (=> b!210312 m!323729))

(declare-fun m!323731 () Bool)

(assert (=> b!210312 m!323731))

(declare-fun m!323733 () Bool)

(assert (=> b!210312 m!323733))

(declare-fun m!323735 () Bool)

(assert (=> b!210312 m!323735))

(declare-fun m!323737 () Bool)

(assert (=> b!210312 m!323737))

(declare-fun m!323739 () Bool)

(assert (=> b!210312 m!323739))

(declare-fun m!323741 () Bool)

(assert (=> b!210312 m!323741))

(declare-fun m!323743 () Bool)

(assert (=> b!210312 m!323743))

(declare-fun m!323745 () Bool)

(assert (=> b!210312 m!323745))

(declare-fun m!323747 () Bool)

(assert (=> b!210312 m!323747))

(declare-fun m!323749 () Bool)

(assert (=> b!210312 m!323749))

(assert (=> b!210312 m!323713))

(declare-fun m!323751 () Bool)

(assert (=> b!210312 m!323751))

(declare-fun m!323753 () Bool)

(assert (=> b!210312 m!323753))

(declare-fun m!323755 () Bool)

(assert (=> b!210312 m!323755))

(declare-fun m!323757 () Bool)

(assert (=> b!210312 m!323757))

(declare-fun m!323759 () Bool)

(assert (=> b!210312 m!323759))

(declare-fun m!323761 () Bool)

(assert (=> b!210312 m!323761))

(declare-fun m!323763 () Bool)

(assert (=> b!210312 m!323763))

(declare-fun m!323765 () Bool)

(assert (=> b!210312 m!323765))

(declare-fun m!323767 () Bool)

(assert (=> b!210312 m!323767))

(declare-fun m!323769 () Bool)

(assert (=> b!210312 m!323769))

(declare-fun m!323771 () Bool)

(assert (=> b!210312 m!323771))

(declare-fun m!323773 () Bool)

(assert (=> b!210312 m!323773))

(declare-fun m!323775 () Bool)

(assert (=> b!210312 m!323775))

(declare-fun m!323777 () Bool)

(assert (=> b!210315 m!323777))

(assert (=> b!210315 m!323777))

(declare-fun m!323779 () Bool)

(assert (=> b!210315 m!323779))

(assert (=> b!210025 d!71089))

(declare-fun d!71129 () Bool)

(declare-fun res!176587 () Bool)

(declare-fun e!143501 () Bool)

(assert (=> d!71129 (=> (not res!176587) (not e!143501))))

(assert (=> d!71129 (= res!176587 (= (size!4606 (buf!5123 (_2!9656 lt!329330))) (size!4606 (buf!5123 (_2!9656 lt!329319)))))))

(assert (=> d!71129 (= (isPrefixOf!0 (_2!9656 lt!329330) (_2!9656 lt!329319)) e!143501)))

(declare-fun b!210323 () Bool)

(declare-fun res!176588 () Bool)

(assert (=> b!210323 (=> (not res!176588) (not e!143501))))

(assert (=> b!210323 (= res!176588 (bvsle (bitIndex!0 (size!4606 (buf!5123 (_2!9656 lt!329330))) (currentByte!9665 (_2!9656 lt!329330)) (currentBit!9660 (_2!9656 lt!329330))) (bitIndex!0 (size!4606 (buf!5123 (_2!9656 lt!329319))) (currentByte!9665 (_2!9656 lt!329319)) (currentBit!9660 (_2!9656 lt!329319)))))))

(declare-fun b!210324 () Bool)

(declare-fun e!143500 () Bool)

(assert (=> b!210324 (= e!143501 e!143500)))

(declare-fun res!176589 () Bool)

(assert (=> b!210324 (=> res!176589 e!143500)))

(assert (=> b!210324 (= res!176589 (= (size!4606 (buf!5123 (_2!9656 lt!329330))) #b00000000000000000000000000000000))))

(declare-fun b!210325 () Bool)

(assert (=> b!210325 (= e!143500 (arrayBitRangesEq!0 (buf!5123 (_2!9656 lt!329330)) (buf!5123 (_2!9656 lt!329319)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4606 (buf!5123 (_2!9656 lt!329330))) (currentByte!9665 (_2!9656 lt!329330)) (currentBit!9660 (_2!9656 lt!329330)))))))

(assert (= (and d!71129 res!176587) b!210323))

(assert (= (and b!210323 res!176588) b!210324))

(assert (= (and b!210324 (not res!176589)) b!210325))

(assert (=> b!210323 m!323293))

(assert (=> b!210323 m!323299))

(assert (=> b!210325 m!323293))

(assert (=> b!210325 m!323293))

(declare-fun m!323781 () Bool)

(assert (=> b!210325 m!323781))

(assert (=> b!210018 d!71129))

(declare-fun d!71131 () Bool)

(assert (=> d!71131 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4606 (buf!5123 thiss!1204))) ((_ sign_extend 32) (currentByte!9665 thiss!1204)) ((_ sign_extend 32) (currentBit!9660 thiss!1204)) lt!329312) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4606 (buf!5123 thiss!1204))) ((_ sign_extend 32) (currentByte!9665 thiss!1204)) ((_ sign_extend 32) (currentBit!9660 thiss!1204))) lt!329312))))

(declare-fun bs!17467 () Bool)

(assert (= bs!17467 d!71131))

(declare-fun m!323783 () Bool)

(assert (=> bs!17467 m!323783))

(assert (=> b!210029 d!71131))

(declare-fun d!71133 () Bool)

(assert (=> d!71133 (= (invariant!0 (currentBit!9660 thiss!1204) (currentByte!9665 thiss!1204) (size!4606 (buf!5123 thiss!1204))) (and (bvsge (currentBit!9660 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9660 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9665 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9665 thiss!1204) (size!4606 (buf!5123 thiss!1204))) (and (= (currentBit!9660 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9665 thiss!1204) (size!4606 (buf!5123 thiss!1204)))))))))

(assert (=> b!210028 d!71133))

(declare-fun d!71135 () Bool)

(declare-fun e!143504 () Bool)

(assert (=> d!71135 e!143504))

(declare-fun res!176596 () Bool)

(assert (=> d!71135 (=> (not res!176596) (not e!143504))))

(declare-fun lt!330025 () (_ BitVec 64))

(declare-fun lt!330026 () (_ BitVec 64))

(declare-fun lt!330028 () (_ BitVec 64))

(assert (=> d!71135 (= res!176596 (= lt!330026 (bvsub lt!330028 lt!330025)))))

(assert (=> d!71135 (or (= (bvand lt!330028 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!330025 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!330028 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!330028 lt!330025) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71135 (= lt!330025 (remainingBits!0 ((_ sign_extend 32) (size!4606 (buf!5123 (_2!9656 lt!329330)))) ((_ sign_extend 32) (currentByte!9665 (_2!9656 lt!329330))) ((_ sign_extend 32) (currentBit!9660 (_2!9656 lt!329330)))))))

(declare-fun lt!330027 () (_ BitVec 64))

(declare-fun lt!330029 () (_ BitVec 64))

(assert (=> d!71135 (= lt!330028 (bvmul lt!330027 lt!330029))))

(assert (=> d!71135 (or (= lt!330027 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!330029 (bvsdiv (bvmul lt!330027 lt!330029) lt!330027)))))

(assert (=> d!71135 (= lt!330029 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71135 (= lt!330027 ((_ sign_extend 32) (size!4606 (buf!5123 (_2!9656 lt!329330)))))))

(assert (=> d!71135 (= lt!330026 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9665 (_2!9656 lt!329330))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9660 (_2!9656 lt!329330)))))))

(assert (=> d!71135 (invariant!0 (currentBit!9660 (_2!9656 lt!329330)) (currentByte!9665 (_2!9656 lt!329330)) (size!4606 (buf!5123 (_2!9656 lt!329330))))))

(assert (=> d!71135 (= (bitIndex!0 (size!4606 (buf!5123 (_2!9656 lt!329330))) (currentByte!9665 (_2!9656 lt!329330)) (currentBit!9660 (_2!9656 lt!329330))) lt!330026)))

(declare-fun b!210330 () Bool)

(declare-fun res!176597 () Bool)

(assert (=> b!210330 (=> (not res!176597) (not e!143504))))

(assert (=> b!210330 (= res!176597 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!330026))))

(declare-fun b!210331 () Bool)

(declare-fun lt!330030 () (_ BitVec 64))

(assert (=> b!210331 (= e!143504 (bvsle lt!330026 (bvmul lt!330030 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!210331 (or (= lt!330030 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!330030 #b0000000000000000000000000000000000000000000000000000000000001000) lt!330030)))))

(assert (=> b!210331 (= lt!330030 ((_ sign_extend 32) (size!4606 (buf!5123 (_2!9656 lt!329330)))))))

(assert (= (and d!71135 res!176596) b!210330))

(assert (= (and b!210330 res!176597) b!210331))

(declare-fun m!323785 () Bool)

(assert (=> d!71135 m!323785))

(assert (=> d!71135 m!323569))

(assert (=> b!210017 d!71135))

(declare-fun d!71137 () Bool)

(declare-fun e!143507 () Bool)

(assert (=> d!71137 e!143507))

(declare-fun res!176602 () Bool)

(assert (=> d!71137 (=> (not res!176602) (not e!143507))))

(declare-fun lt!330040 () (_ BitVec 64))

(declare-fun lt!330038 () (_ BitVec 64))

(declare-fun lt!330037 () (_ BitVec 64))

(assert (=> d!71137 (= res!176602 (= lt!330038 (bvsub lt!330040 lt!330037)))))

(assert (=> d!71137 (or (= (bvand lt!330040 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!330037 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!330040 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!330040 lt!330037) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71137 (= lt!330037 (remainingBits!0 ((_ sign_extend 32) (size!4606 (buf!5123 thiss!1204))) ((_ sign_extend 32) (currentByte!9665 thiss!1204)) ((_ sign_extend 32) (currentBit!9660 thiss!1204))))))

(declare-fun lt!330039 () (_ BitVec 64))

(declare-fun lt!330041 () (_ BitVec 64))

(assert (=> d!71137 (= lt!330040 (bvmul lt!330039 lt!330041))))

(assert (=> d!71137 (or (= lt!330039 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!330041 (bvsdiv (bvmul lt!330039 lt!330041) lt!330039)))))

(assert (=> d!71137 (= lt!330041 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71137 (= lt!330039 ((_ sign_extend 32) (size!4606 (buf!5123 thiss!1204))))))

(assert (=> d!71137 (= lt!330038 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9665 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9660 thiss!1204))))))

(assert (=> d!71137 (invariant!0 (currentBit!9660 thiss!1204) (currentByte!9665 thiss!1204) (size!4606 (buf!5123 thiss!1204)))))

(assert (=> d!71137 (= (bitIndex!0 (size!4606 (buf!5123 thiss!1204)) (currentByte!9665 thiss!1204) (currentBit!9660 thiss!1204)) lt!330038)))

(declare-fun b!210338 () Bool)

(declare-fun res!176603 () Bool)

(assert (=> b!210338 (=> (not res!176603) (not e!143507))))

(assert (=> b!210338 (= res!176603 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!330038))))

(declare-fun b!210339 () Bool)

(declare-fun lt!330042 () (_ BitVec 64))

(assert (=> b!210339 (= e!143507 (bvsle lt!330038 (bvmul lt!330042 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!210339 (or (= lt!330042 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!330042 #b0000000000000000000000000000000000000000000000000000000000001000) lt!330042)))))

(assert (=> b!210339 (= lt!330042 ((_ sign_extend 32) (size!4606 (buf!5123 thiss!1204))))))

(assert (= (and d!71137 res!176602) b!210338))

(assert (= (and b!210338 res!176603) b!210339))

(assert (=> d!71137 m!323783))

(assert (=> d!71137 m!323291))

(assert (=> b!210017 d!71137))

(declare-fun d!71139 () Bool)

(declare-fun e!143523 () Bool)

(assert (=> d!71139 e!143523))

(declare-fun res!176626 () Bool)

(assert (=> d!71139 (=> (not res!176626) (not e!143523))))

(declare-fun lt!330111 () tuple2!18002)

(assert (=> d!71139 (= res!176626 (= (size!4606 (buf!5123 thiss!1204)) (size!4606 (buf!5123 (_2!9656 lt!330111)))))))

(declare-fun choose!16 (BitStream!8320 Bool) tuple2!18002)

(assert (=> d!71139 (= lt!330111 (choose!16 thiss!1204 lt!329328))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!71139 (validate_offset_bit!0 ((_ sign_extend 32) (size!4606 (buf!5123 thiss!1204))) ((_ sign_extend 32) (currentByte!9665 thiss!1204)) ((_ sign_extend 32) (currentBit!9660 thiss!1204)))))

(assert (=> d!71139 (= (appendBit!0 thiss!1204 lt!329328) lt!330111)))

(declare-fun b!210367 () Bool)

(declare-fun res!176629 () Bool)

(assert (=> b!210367 (=> (not res!176629) (not e!143523))))

(declare-fun lt!330112 () (_ BitVec 64))

(declare-fun lt!330114 () (_ BitVec 64))

(assert (=> b!210367 (= res!176629 (= (bitIndex!0 (size!4606 (buf!5123 (_2!9656 lt!330111))) (currentByte!9665 (_2!9656 lt!330111)) (currentBit!9660 (_2!9656 lt!330111))) (bvadd lt!330112 lt!330114)))))

(assert (=> b!210367 (or (not (= (bvand lt!330112 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!330114 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!330112 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!330112 lt!330114) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210367 (= lt!330114 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!210367 (= lt!330112 (bitIndex!0 (size!4606 (buf!5123 thiss!1204)) (currentByte!9665 thiss!1204) (currentBit!9660 thiss!1204)))))

(declare-fun b!210370 () Bool)

(declare-fun e!143524 () Bool)

(declare-fun lt!330113 () tuple2!18004)

(assert (=> b!210370 (= e!143524 (= (bitIndex!0 (size!4606 (buf!5123 (_1!9657 lt!330113))) (currentByte!9665 (_1!9657 lt!330113)) (currentBit!9660 (_1!9657 lt!330113))) (bitIndex!0 (size!4606 (buf!5123 (_2!9656 lt!330111))) (currentByte!9665 (_2!9656 lt!330111)) (currentBit!9660 (_2!9656 lt!330111)))))))

(declare-fun b!210368 () Bool)

(declare-fun res!176628 () Bool)

(assert (=> b!210368 (=> (not res!176628) (not e!143523))))

(assert (=> b!210368 (= res!176628 (isPrefixOf!0 thiss!1204 (_2!9656 lt!330111)))))

(declare-fun b!210369 () Bool)

(assert (=> b!210369 (= e!143523 e!143524)))

(declare-fun res!176627 () Bool)

(assert (=> b!210369 (=> (not res!176627) (not e!143524))))

(assert (=> b!210369 (= res!176627 (and (= (_2!9657 lt!330113) lt!329328) (= (_1!9657 lt!330113) (_2!9656 lt!330111))))))

(assert (=> b!210369 (= lt!330113 (readBitPure!0 (readerFrom!0 (_2!9656 lt!330111) (currentBit!9660 thiss!1204) (currentByte!9665 thiss!1204))))))

(assert (= (and d!71139 res!176626) b!210367))

(assert (= (and b!210367 res!176629) b!210368))

(assert (= (and b!210368 res!176628) b!210369))

(assert (= (and b!210369 res!176627) b!210370))

(declare-fun m!323809 () Bool)

(assert (=> d!71139 m!323809))

(declare-fun m!323813 () Bool)

(assert (=> d!71139 m!323813))

(declare-fun m!323819 () Bool)

(assert (=> b!210370 m!323819))

(declare-fun m!323823 () Bool)

(assert (=> b!210370 m!323823))

(declare-fun m!323825 () Bool)

(assert (=> b!210369 m!323825))

(assert (=> b!210369 m!323825))

(declare-fun m!323829 () Bool)

(assert (=> b!210369 m!323829))

(assert (=> b!210367 m!323823))

(assert (=> b!210367 m!323295))

(declare-fun m!323839 () Bool)

(assert (=> b!210368 m!323839))

(assert (=> b!210017 d!71139))

(declare-fun d!71141 () Bool)

(declare-fun res!176630 () Bool)

(declare-fun e!143526 () Bool)

(assert (=> d!71141 (=> (not res!176630) (not e!143526))))

(assert (=> d!71141 (= res!176630 (= (size!4606 (buf!5123 thiss!1204)) (size!4606 (buf!5123 (_2!9656 lt!329330)))))))

(assert (=> d!71141 (= (isPrefixOf!0 thiss!1204 (_2!9656 lt!329330)) e!143526)))

(declare-fun b!210371 () Bool)

(declare-fun res!176631 () Bool)

(assert (=> b!210371 (=> (not res!176631) (not e!143526))))

(assert (=> b!210371 (= res!176631 (bvsle (bitIndex!0 (size!4606 (buf!5123 thiss!1204)) (currentByte!9665 thiss!1204) (currentBit!9660 thiss!1204)) (bitIndex!0 (size!4606 (buf!5123 (_2!9656 lt!329330))) (currentByte!9665 (_2!9656 lt!329330)) (currentBit!9660 (_2!9656 lt!329330)))))))

(declare-fun b!210372 () Bool)

(declare-fun e!143525 () Bool)

(assert (=> b!210372 (= e!143526 e!143525)))

(declare-fun res!176632 () Bool)

(assert (=> b!210372 (=> res!176632 e!143525)))

(assert (=> b!210372 (= res!176632 (= (size!4606 (buf!5123 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!210373 () Bool)

(assert (=> b!210373 (= e!143525 (arrayBitRangesEq!0 (buf!5123 thiss!1204) (buf!5123 (_2!9656 lt!329330)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4606 (buf!5123 thiss!1204)) (currentByte!9665 thiss!1204) (currentBit!9660 thiss!1204))))))

(assert (= (and d!71141 res!176630) b!210371))

(assert (= (and b!210371 res!176631) b!210372))

(assert (= (and b!210372 (not res!176632)) b!210373))

(assert (=> b!210371 m!323295))

(assert (=> b!210371 m!323293))

(assert (=> b!210373 m!323295))

(assert (=> b!210373 m!323295))

(declare-fun m!323865 () Bool)

(assert (=> b!210373 m!323865))

(assert (=> b!210021 d!71141))

(declare-fun d!71143 () Bool)

(assert (=> d!71143 (= (array_inv!4347 (buf!5123 thiss!1204)) (bvsge (size!4606 (buf!5123 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!210031 d!71143))

(declare-fun d!71145 () Bool)

(assert (=> d!71145 (= (invariant!0 (currentBit!9660 (_2!9656 lt!329319)) (currentByte!9665 (_2!9656 lt!329319)) (size!4606 (buf!5123 (_2!9656 lt!329319)))) (and (bvsge (currentBit!9660 (_2!9656 lt!329319)) #b00000000000000000000000000000000) (bvslt (currentBit!9660 (_2!9656 lt!329319)) #b00000000000000000000000000001000) (bvsge (currentByte!9665 (_2!9656 lt!329319)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9665 (_2!9656 lt!329319)) (size!4606 (buf!5123 (_2!9656 lt!329319)))) (and (= (currentBit!9660 (_2!9656 lt!329319)) #b00000000000000000000000000000000) (= (currentByte!9665 (_2!9656 lt!329319)) (size!4606 (buf!5123 (_2!9656 lt!329319))))))))))

(assert (=> b!210030 d!71145))

(declare-fun d!71147 () Bool)

(declare-fun e!143531 () Bool)

(assert (=> d!71147 e!143531))

(declare-fun res!176638 () Bool)

(assert (=> d!71147 (=> (not res!176638) (not e!143531))))

(declare-fun lt!330120 () (_ BitVec 64))

(declare-fun lt!330119 () BitStream!8320)

(assert (=> d!71147 (= res!176638 (= (bvadd lt!330120 (bvsub lt!329326 lt!329318)) (bitIndex!0 (size!4606 (buf!5123 lt!330119)) (currentByte!9665 lt!330119) (currentBit!9660 lt!330119))))))

(assert (=> d!71147 (or (not (= (bvand lt!330120 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!329326 lt!329318) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!330120 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!330120 (bvsub lt!329326 lt!329318)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71147 (= lt!330120 (bitIndex!0 (size!4606 (buf!5123 (_2!9658 lt!329322))) (currentByte!9665 (_2!9658 lt!329322)) (currentBit!9660 (_2!9658 lt!329322))))))

(declare-fun moveBitIndex!0 (BitStream!8320 (_ BitVec 64)) tuple2!18002)

(assert (=> d!71147 (= lt!330119 (_2!9656 (moveBitIndex!0 (_2!9658 lt!329322) (bvsub lt!329326 lt!329318))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!8320 (_ BitVec 64)) Bool)

(assert (=> d!71147 (moveBitIndexPrecond!0 (_2!9658 lt!329322) (bvsub lt!329326 lt!329318))))

(assert (=> d!71147 (= (withMovedBitIndex!0 (_2!9658 lt!329322) (bvsub lt!329326 lt!329318)) lt!330119)))

(declare-fun b!210379 () Bool)

(assert (=> b!210379 (= e!143531 (= (size!4606 (buf!5123 (_2!9658 lt!329322))) (size!4606 (buf!5123 lt!330119))))))

(assert (= (and d!71147 res!176638) b!210379))

(declare-fun m!323897 () Bool)

(assert (=> d!71147 m!323897))

(declare-fun m!323899 () Bool)

(assert (=> d!71147 m!323899))

(declare-fun m!323901 () Bool)

(assert (=> d!71147 m!323901))

(declare-fun m!323903 () Bool)

(assert (=> d!71147 m!323903))

(assert (=> b!210024 d!71147))

(declare-fun d!71155 () Bool)

(declare-fun lt!330137 () tuple2!18008)

(declare-fun lt!330135 () tuple2!18008)

(assert (=> d!71155 (and (= (_2!9659 lt!330137) (_2!9659 lt!330135)) (= (_1!9659 lt!330137) (_1!9659 lt!330135)))))

(declare-fun lt!330138 () BitStream!8320)

(declare-fun lt!330134 () Unit!14962)

(declare-fun lt!330133 () (_ BitVec 64))

(declare-fun lt!330136 () Bool)

(declare-fun choose!56 (BitStream!8320 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!18008 tuple2!18008 BitStream!8320 (_ BitVec 64) Bool BitStream!8320 (_ BitVec 64) tuple2!18008 tuple2!18008 BitStream!8320 (_ BitVec 64)) Unit!14962)

(assert (=> d!71155 (= lt!330134 (choose!56 (_1!9658 lt!329322) nBits!348 i!590 lt!329307 lt!330137 (tuple2!18009 (_1!9659 lt!330137) (_2!9659 lt!330137)) (_1!9659 lt!330137) (_2!9659 lt!330137) lt!330136 lt!330138 lt!330133 lt!330135 (tuple2!18009 (_1!9659 lt!330135) (_2!9659 lt!330135)) (_1!9659 lt!330135) (_2!9659 lt!330135)))))

(assert (=> d!71155 (= lt!330135 (readNBitsLSBFirstsLoopPure!0 lt!330138 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!330133))))

(assert (=> d!71155 (= lt!330133 (bvor lt!329307 (ite lt!330136 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71155 (= lt!330138 (withMovedBitIndex!0 (_1!9658 lt!329322) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!71155 (= lt!330136 (_2!9657 (readBitPure!0 (_1!9658 lt!329322))))))

(assert (=> d!71155 (= lt!330137 (readNBitsLSBFirstsLoopPure!0 (_1!9658 lt!329322) nBits!348 i!590 lt!329307))))

(assert (=> d!71155 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9658 lt!329322) nBits!348 i!590 lt!329307) lt!330134)))

(declare-fun bs!17469 () Bool)

(assert (= bs!17469 d!71155))

(declare-fun m!323905 () Bool)

(assert (=> bs!17469 m!323905))

(assert (=> bs!17469 m!323351))

(assert (=> bs!17469 m!323321))

(assert (=> bs!17469 m!323339))

(declare-fun m!323907 () Bool)

(assert (=> bs!17469 m!323907))

(assert (=> b!210024 d!71155))

(declare-datatypes ((tuple2!18032 0))(
  ( (tuple2!18033 (_1!9671 (_ BitVec 64)) (_2!9671 BitStream!8320)) )
))
(declare-fun lt!330141 () tuple2!18032)

(declare-fun d!71157 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8320 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18032)

(assert (=> d!71157 (= lt!330141 (readNBitsLSBFirstsLoop!0 (withMovedBitIndex!0 (_1!9658 lt!329322) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!329325))))

(assert (=> d!71157 (= (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9658 lt!329322) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!329325) (tuple2!18009 (_2!9671 lt!330141) (_1!9671 lt!330141)))))

(declare-fun bs!17470 () Bool)

(assert (= bs!17470 d!71157))

(assert (=> bs!17470 m!323321))

(declare-fun m!323909 () Bool)

(assert (=> bs!17470 m!323909))

(assert (=> b!210024 d!71157))

(declare-fun d!71159 () Bool)

(declare-fun e!143532 () Bool)

(assert (=> d!71159 e!143532))

(declare-fun res!176639 () Bool)

(assert (=> d!71159 (=> (not res!176639) (not e!143532))))

(declare-fun lt!330143 () (_ BitVec 64))

(declare-fun lt!330142 () BitStream!8320)

(assert (=> d!71159 (= res!176639 (= (bvadd lt!330143 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4606 (buf!5123 lt!330142)) (currentByte!9665 lt!330142) (currentBit!9660 lt!330142))))))

(assert (=> d!71159 (or (not (= (bvand lt!330143 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!330143 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!330143 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71159 (= lt!330143 (bitIndex!0 (size!4606 (buf!5123 (_1!9658 lt!329322))) (currentByte!9665 (_1!9658 lt!329322)) (currentBit!9660 (_1!9658 lt!329322))))))

(assert (=> d!71159 (= lt!330142 (_2!9656 (moveBitIndex!0 (_1!9658 lt!329322) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!71159 (moveBitIndexPrecond!0 (_1!9658 lt!329322) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!71159 (= (withMovedBitIndex!0 (_1!9658 lt!329322) #b0000000000000000000000000000000000000000000000000000000000000001) lt!330142)))

(declare-fun b!210380 () Bool)

(assert (=> b!210380 (= e!143532 (= (size!4606 (buf!5123 (_1!9658 lt!329322))) (size!4606 (buf!5123 lt!330142))))))

(assert (= (and d!71159 res!176639) b!210380))

(declare-fun m!323911 () Bool)

(assert (=> d!71159 m!323911))

(declare-fun m!323913 () Bool)

(assert (=> d!71159 m!323913))

(declare-fun m!323915 () Bool)

(assert (=> d!71159 m!323915))

(declare-fun m!323917 () Bool)

(assert (=> d!71159 m!323917))

(assert (=> b!210024 d!71159))

(declare-fun d!71161 () Bool)

(assert (=> d!71161 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9660 thiss!1204) (currentByte!9665 thiss!1204) (size!4606 (buf!5123 thiss!1204))))))

(declare-fun bs!17471 () Bool)

(assert (= bs!17471 d!71161))

(assert (=> bs!17471 m!323291))

(assert (=> start!44088 d!71161))

(assert (=> b!210023 d!71141))

(assert (=> b!210022 d!71135))

(assert (=> b!210022 d!71137))

(declare-fun b!210391 () Bool)

(declare-fun e!143537 () Unit!14962)

(declare-fun Unit!14991 () Unit!14962)

(assert (=> b!210391 (= e!143537 Unit!14991)))

(declare-fun lt!330186 () (_ BitVec 64))

(declare-fun b!210392 () Bool)

(declare-fun lt!330199 () (_ BitVec 64))

(declare-fun e!143538 () Bool)

(declare-fun lt!330191 () tuple2!18006)

(assert (=> b!210392 (= e!143538 (= (_1!9658 lt!330191) (withMovedBitIndex!0 (_2!9658 lt!330191) (bvsub lt!330199 lt!330186))))))

(assert (=> b!210392 (or (= (bvand lt!330199 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!330186 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!330199 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!330199 lt!330186) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210392 (= lt!330186 (bitIndex!0 (size!4606 (buf!5123 (_2!9656 lt!329319))) (currentByte!9665 (_2!9656 lt!329319)) (currentBit!9660 (_2!9656 lt!329319))))))

(assert (=> b!210392 (= lt!330199 (bitIndex!0 (size!4606 (buf!5123 thiss!1204)) (currentByte!9665 thiss!1204) (currentBit!9660 thiss!1204)))))

(declare-fun b!210393 () Bool)

(declare-fun res!176647 () Bool)

(assert (=> b!210393 (=> (not res!176647) (not e!143538))))

(assert (=> b!210393 (= res!176647 (isPrefixOf!0 (_2!9658 lt!330191) (_2!9656 lt!329319)))))

(declare-fun d!71163 () Bool)

(assert (=> d!71163 e!143538))

(declare-fun res!176648 () Bool)

(assert (=> d!71163 (=> (not res!176648) (not e!143538))))

(assert (=> d!71163 (= res!176648 (isPrefixOf!0 (_1!9658 lt!330191) (_2!9658 lt!330191)))))

(declare-fun lt!330194 () BitStream!8320)

(assert (=> d!71163 (= lt!330191 (tuple2!18007 lt!330194 (_2!9656 lt!329319)))))

(declare-fun lt!330184 () Unit!14962)

(declare-fun lt!330185 () Unit!14962)

(assert (=> d!71163 (= lt!330184 lt!330185)))

(assert (=> d!71163 (isPrefixOf!0 lt!330194 (_2!9656 lt!329319))))

(assert (=> d!71163 (= lt!330185 (lemmaIsPrefixTransitive!0 lt!330194 (_2!9656 lt!329319) (_2!9656 lt!329319)))))

(declare-fun lt!330197 () Unit!14962)

(declare-fun lt!330189 () Unit!14962)

(assert (=> d!71163 (= lt!330197 lt!330189)))

(assert (=> d!71163 (isPrefixOf!0 lt!330194 (_2!9656 lt!329319))))

(assert (=> d!71163 (= lt!330189 (lemmaIsPrefixTransitive!0 lt!330194 thiss!1204 (_2!9656 lt!329319)))))

(declare-fun lt!330192 () Unit!14962)

(assert (=> d!71163 (= lt!330192 e!143537)))

(declare-fun c!10347 () Bool)

(assert (=> d!71163 (= c!10347 (not (= (size!4606 (buf!5123 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!330198 () Unit!14962)

(declare-fun lt!330202 () Unit!14962)

(assert (=> d!71163 (= lt!330198 lt!330202)))

(assert (=> d!71163 (isPrefixOf!0 (_2!9656 lt!329319) (_2!9656 lt!329319))))

(assert (=> d!71163 (= lt!330202 (lemmaIsPrefixRefl!0 (_2!9656 lt!329319)))))

(declare-fun lt!330193 () Unit!14962)

(declare-fun lt!330195 () Unit!14962)

(assert (=> d!71163 (= lt!330193 lt!330195)))

(assert (=> d!71163 (= lt!330195 (lemmaIsPrefixRefl!0 (_2!9656 lt!329319)))))

(declare-fun lt!330200 () Unit!14962)

(declare-fun lt!330203 () Unit!14962)

(assert (=> d!71163 (= lt!330200 lt!330203)))

(assert (=> d!71163 (isPrefixOf!0 lt!330194 lt!330194)))

(assert (=> d!71163 (= lt!330203 (lemmaIsPrefixRefl!0 lt!330194))))

(declare-fun lt!330196 () Unit!14962)

(declare-fun lt!330190 () Unit!14962)

(assert (=> d!71163 (= lt!330196 lt!330190)))

(assert (=> d!71163 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!71163 (= lt!330190 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!71163 (= lt!330194 (BitStream!8321 (buf!5123 (_2!9656 lt!329319)) (currentByte!9665 thiss!1204) (currentBit!9660 thiss!1204)))))

(assert (=> d!71163 (isPrefixOf!0 thiss!1204 (_2!9656 lt!329319))))

(assert (=> d!71163 (= (reader!0 thiss!1204 (_2!9656 lt!329319)) lt!330191)))

(declare-fun b!210394 () Bool)

(declare-fun res!176646 () Bool)

(assert (=> b!210394 (=> (not res!176646) (not e!143538))))

(assert (=> b!210394 (= res!176646 (isPrefixOf!0 (_1!9658 lt!330191) thiss!1204))))

(declare-fun b!210395 () Bool)

(declare-fun lt!330188 () Unit!14962)

(assert (=> b!210395 (= e!143537 lt!330188)))

(declare-fun lt!330187 () (_ BitVec 64))

(assert (=> b!210395 (= lt!330187 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!330201 () (_ BitVec 64))

(assert (=> b!210395 (= lt!330201 (bitIndex!0 (size!4606 (buf!5123 thiss!1204)) (currentByte!9665 thiss!1204) (currentBit!9660 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!10481 array!10481 (_ BitVec 64) (_ BitVec 64)) Unit!14962)

(assert (=> b!210395 (= lt!330188 (arrayBitRangesEqSymmetric!0 (buf!5123 thiss!1204) (buf!5123 (_2!9656 lt!329319)) lt!330187 lt!330201))))

(assert (=> b!210395 (arrayBitRangesEq!0 (buf!5123 (_2!9656 lt!329319)) (buf!5123 thiss!1204) lt!330187 lt!330201)))

(assert (= (and d!71163 c!10347) b!210395))

(assert (= (and d!71163 (not c!10347)) b!210391))

(assert (= (and d!71163 res!176648) b!210394))

(assert (= (and b!210394 res!176646) b!210393))

(assert (= (and b!210393 res!176647) b!210392))

(declare-fun m!323919 () Bool)

(assert (=> b!210394 m!323919))

(assert (=> b!210395 m!323295))

(declare-fun m!323921 () Bool)

(assert (=> b!210395 m!323921))

(declare-fun m!323923 () Bool)

(assert (=> b!210395 m!323923))

(declare-fun m!323925 () Bool)

(assert (=> d!71163 m!323925))

(declare-fun m!323927 () Bool)

(assert (=> d!71163 m!323927))

(declare-fun m!323929 () Bool)

(assert (=> d!71163 m!323929))

(declare-fun m!323931 () Bool)

(assert (=> d!71163 m!323931))

(declare-fun m!323933 () Bool)

(assert (=> d!71163 m!323933))

(assert (=> d!71163 m!323301))

(declare-fun m!323935 () Bool)

(assert (=> d!71163 m!323935))

(declare-fun m!323937 () Bool)

(assert (=> d!71163 m!323937))

(declare-fun m!323939 () Bool)

(assert (=> d!71163 m!323939))

(declare-fun m!323941 () Bool)

(assert (=> d!71163 m!323941))

(declare-fun m!323943 () Bool)

(assert (=> d!71163 m!323943))

(declare-fun m!323945 () Bool)

(assert (=> b!210392 m!323945))

(assert (=> b!210392 m!323299))

(assert (=> b!210392 m!323295))

(declare-fun m!323947 () Bool)

(assert (=> b!210393 m!323947))

(assert (=> b!210033 d!71163))

(declare-fun d!71165 () Bool)

(assert (=> d!71165 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!210033 d!71165))

(declare-fun d!71167 () Bool)

(declare-fun lt!330204 () tuple2!18030)

(assert (=> d!71167 (= lt!330204 (readBit!0 (BitStream!8321 (buf!5123 (_2!9656 lt!329319)) (currentByte!9665 thiss!1204) (currentBit!9660 thiss!1204))))))

(assert (=> d!71167 (= (readBitPure!0 (BitStream!8321 (buf!5123 (_2!9656 lt!329319)) (currentByte!9665 thiss!1204) (currentBit!9660 thiss!1204))) (tuple2!18005 (_2!9670 lt!330204) (_1!9670 lt!330204)))))

(declare-fun bs!17472 () Bool)

(assert (= bs!17472 d!71167))

(declare-fun m!323949 () Bool)

(assert (=> bs!17472 m!323949))

(assert (=> b!210033 d!71167))

(declare-fun d!71169 () Bool)

(assert (=> d!71169 (validate_offset_bits!1 ((_ sign_extend 32) (size!4606 (buf!5123 (_2!9656 lt!329319)))) ((_ sign_extend 32) (currentByte!9665 thiss!1204)) ((_ sign_extend 32) (currentBit!9660 thiss!1204)) lt!329312)))

(declare-fun lt!330207 () Unit!14962)

(declare-fun choose!9 (BitStream!8320 array!10481 (_ BitVec 64) BitStream!8320) Unit!14962)

(assert (=> d!71169 (= lt!330207 (choose!9 thiss!1204 (buf!5123 (_2!9656 lt!329319)) lt!329312 (BitStream!8321 (buf!5123 (_2!9656 lt!329319)) (currentByte!9665 thiss!1204) (currentBit!9660 thiss!1204))))))

(assert (=> d!71169 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5123 (_2!9656 lt!329319)) lt!329312) lt!330207)))

(declare-fun bs!17473 () Bool)

(assert (= bs!17473 d!71169))

(assert (=> bs!17473 m!323343))

(declare-fun m!323951 () Bool)

(assert (=> bs!17473 m!323951))

(assert (=> b!210033 d!71169))

(declare-fun b!210396 () Bool)

(declare-fun e!143539 () Unit!14962)

(declare-fun Unit!14993 () Unit!14962)

(assert (=> b!210396 (= e!143539 Unit!14993)))

(declare-fun lt!330210 () (_ BitVec 64))

(declare-fun lt!330223 () (_ BitVec 64))

(declare-fun e!143540 () Bool)

(declare-fun lt!330215 () tuple2!18006)

(declare-fun b!210397 () Bool)

(assert (=> b!210397 (= e!143540 (= (_1!9658 lt!330215) (withMovedBitIndex!0 (_2!9658 lt!330215) (bvsub lt!330223 lt!330210))))))

(assert (=> b!210397 (or (= (bvand lt!330223 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!330210 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!330223 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!330223 lt!330210) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210397 (= lt!330210 (bitIndex!0 (size!4606 (buf!5123 (_2!9656 lt!329319))) (currentByte!9665 (_2!9656 lt!329319)) (currentBit!9660 (_2!9656 lt!329319))))))

(assert (=> b!210397 (= lt!330223 (bitIndex!0 (size!4606 (buf!5123 (_2!9656 lt!329330))) (currentByte!9665 (_2!9656 lt!329330)) (currentBit!9660 (_2!9656 lt!329330))))))

(declare-fun b!210398 () Bool)

(declare-fun res!176650 () Bool)

(assert (=> b!210398 (=> (not res!176650) (not e!143540))))

(assert (=> b!210398 (= res!176650 (isPrefixOf!0 (_2!9658 lt!330215) (_2!9656 lt!329319)))))

(declare-fun d!71171 () Bool)

(assert (=> d!71171 e!143540))

(declare-fun res!176651 () Bool)

(assert (=> d!71171 (=> (not res!176651) (not e!143540))))

(assert (=> d!71171 (= res!176651 (isPrefixOf!0 (_1!9658 lt!330215) (_2!9658 lt!330215)))))

(declare-fun lt!330218 () BitStream!8320)

(assert (=> d!71171 (= lt!330215 (tuple2!18007 lt!330218 (_2!9656 lt!329319)))))

(declare-fun lt!330208 () Unit!14962)

(declare-fun lt!330209 () Unit!14962)

(assert (=> d!71171 (= lt!330208 lt!330209)))

(assert (=> d!71171 (isPrefixOf!0 lt!330218 (_2!9656 lt!329319))))

(assert (=> d!71171 (= lt!330209 (lemmaIsPrefixTransitive!0 lt!330218 (_2!9656 lt!329319) (_2!9656 lt!329319)))))

(declare-fun lt!330221 () Unit!14962)

(declare-fun lt!330213 () Unit!14962)

(assert (=> d!71171 (= lt!330221 lt!330213)))

(assert (=> d!71171 (isPrefixOf!0 lt!330218 (_2!9656 lt!329319))))

(assert (=> d!71171 (= lt!330213 (lemmaIsPrefixTransitive!0 lt!330218 (_2!9656 lt!329330) (_2!9656 lt!329319)))))

(declare-fun lt!330216 () Unit!14962)

(assert (=> d!71171 (= lt!330216 e!143539)))

(declare-fun c!10348 () Bool)

(assert (=> d!71171 (= c!10348 (not (= (size!4606 (buf!5123 (_2!9656 lt!329330))) #b00000000000000000000000000000000)))))

(declare-fun lt!330222 () Unit!14962)

(declare-fun lt!330226 () Unit!14962)

(assert (=> d!71171 (= lt!330222 lt!330226)))

(assert (=> d!71171 (isPrefixOf!0 (_2!9656 lt!329319) (_2!9656 lt!329319))))

(assert (=> d!71171 (= lt!330226 (lemmaIsPrefixRefl!0 (_2!9656 lt!329319)))))

(declare-fun lt!330217 () Unit!14962)

(declare-fun lt!330219 () Unit!14962)

(assert (=> d!71171 (= lt!330217 lt!330219)))

(assert (=> d!71171 (= lt!330219 (lemmaIsPrefixRefl!0 (_2!9656 lt!329319)))))

(declare-fun lt!330224 () Unit!14962)

(declare-fun lt!330227 () Unit!14962)

(assert (=> d!71171 (= lt!330224 lt!330227)))

(assert (=> d!71171 (isPrefixOf!0 lt!330218 lt!330218)))

(assert (=> d!71171 (= lt!330227 (lemmaIsPrefixRefl!0 lt!330218))))

(declare-fun lt!330220 () Unit!14962)

(declare-fun lt!330214 () Unit!14962)

(assert (=> d!71171 (= lt!330220 lt!330214)))

(assert (=> d!71171 (isPrefixOf!0 (_2!9656 lt!329330) (_2!9656 lt!329330))))

(assert (=> d!71171 (= lt!330214 (lemmaIsPrefixRefl!0 (_2!9656 lt!329330)))))

(assert (=> d!71171 (= lt!330218 (BitStream!8321 (buf!5123 (_2!9656 lt!329319)) (currentByte!9665 (_2!9656 lt!329330)) (currentBit!9660 (_2!9656 lt!329330))))))

(assert (=> d!71171 (isPrefixOf!0 (_2!9656 lt!329330) (_2!9656 lt!329319))))

(assert (=> d!71171 (= (reader!0 (_2!9656 lt!329330) (_2!9656 lt!329319)) lt!330215)))

(declare-fun b!210399 () Bool)

(declare-fun res!176649 () Bool)

(assert (=> b!210399 (=> (not res!176649) (not e!143540))))

(assert (=> b!210399 (= res!176649 (isPrefixOf!0 (_1!9658 lt!330215) (_2!9656 lt!329330)))))

(declare-fun b!210400 () Bool)

(declare-fun lt!330212 () Unit!14962)

(assert (=> b!210400 (= e!143539 lt!330212)))

(declare-fun lt!330211 () (_ BitVec 64))

(assert (=> b!210400 (= lt!330211 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!330225 () (_ BitVec 64))

(assert (=> b!210400 (= lt!330225 (bitIndex!0 (size!4606 (buf!5123 (_2!9656 lt!329330))) (currentByte!9665 (_2!9656 lt!329330)) (currentBit!9660 (_2!9656 lt!329330))))))

(assert (=> b!210400 (= lt!330212 (arrayBitRangesEqSymmetric!0 (buf!5123 (_2!9656 lt!329330)) (buf!5123 (_2!9656 lt!329319)) lt!330211 lt!330225))))

(assert (=> b!210400 (arrayBitRangesEq!0 (buf!5123 (_2!9656 lt!329319)) (buf!5123 (_2!9656 lt!329330)) lt!330211 lt!330225)))

(assert (= (and d!71171 c!10348) b!210400))

(assert (= (and d!71171 (not c!10348)) b!210396))

(assert (= (and d!71171 res!176651) b!210399))

(assert (= (and b!210399 res!176649) b!210398))

(assert (= (and b!210398 res!176650) b!210397))

(declare-fun m!323953 () Bool)

(assert (=> b!210399 m!323953))

(assert (=> b!210400 m!323293))

(declare-fun m!323955 () Bool)

(assert (=> b!210400 m!323955))

(declare-fun m!323957 () Bool)

(assert (=> b!210400 m!323957))

(declare-fun m!323959 () Bool)

(assert (=> d!71171 m!323959))

(declare-fun m!323961 () Bool)

(assert (=> d!71171 m!323961))

(declare-fun m!323963 () Bool)

(assert (=> d!71171 m!323963))

(declare-fun m!323965 () Bool)

(assert (=> d!71171 m!323965))

(declare-fun m!323967 () Bool)

(assert (=> d!71171 m!323967))

(assert (=> d!71171 m!323315))

(declare-fun m!323969 () Bool)

(assert (=> d!71171 m!323969))

(assert (=> d!71171 m!323937))

(assert (=> d!71171 m!323703))

(assert (=> d!71171 m!323941))

(declare-fun m!323971 () Bool)

(assert (=> d!71171 m!323971))

(declare-fun m!323973 () Bool)

(assert (=> b!210397 m!323973))

(assert (=> b!210397 m!323299))

(assert (=> b!210397 m!323293))

(declare-fun m!323975 () Bool)

(assert (=> b!210398 m!323975))

(assert (=> b!210033 d!71171))

(declare-fun d!71173 () Bool)

(declare-fun lt!330228 () tuple2!18030)

(assert (=> d!71173 (= lt!330228 (readBit!0 lt!329311))))

(assert (=> d!71173 (= (readBitPure!0 lt!329311) (tuple2!18005 (_2!9670 lt!330228) (_1!9670 lt!330228)))))

(declare-fun bs!17474 () Bool)

(assert (= bs!17474 d!71173))

(declare-fun m!323977 () Bool)

(assert (=> bs!17474 m!323977))

(assert (=> b!210033 d!71173))

(declare-fun d!71175 () Bool)

(declare-fun e!143543 () Bool)

(assert (=> d!71175 e!143543))

(declare-fun res!176654 () Bool)

(assert (=> d!71175 (=> (not res!176654) (not e!143543))))

(declare-fun lt!330240 () tuple2!18004)

(declare-fun lt!330237 () tuple2!18004)

(assert (=> d!71175 (= res!176654 (= (bitIndex!0 (size!4606 (buf!5123 (_1!9657 lt!330240))) (currentByte!9665 (_1!9657 lt!330240)) (currentBit!9660 (_1!9657 lt!330240))) (bitIndex!0 (size!4606 (buf!5123 (_1!9657 lt!330237))) (currentByte!9665 (_1!9657 lt!330237)) (currentBit!9660 (_1!9657 lt!330237)))))))

(declare-fun lt!330239 () Unit!14962)

(declare-fun lt!330238 () BitStream!8320)

(declare-fun choose!50 (BitStream!8320 BitStream!8320 BitStream!8320 tuple2!18004 tuple2!18004 BitStream!8320 Bool tuple2!18004 tuple2!18004 BitStream!8320 Bool) Unit!14962)

(assert (=> d!71175 (= lt!330239 (choose!50 lt!329311 (_2!9656 lt!329319) lt!330238 lt!330240 (tuple2!18005 (_1!9657 lt!330240) (_2!9657 lt!330240)) (_1!9657 lt!330240) (_2!9657 lt!330240) lt!330237 (tuple2!18005 (_1!9657 lt!330237) (_2!9657 lt!330237)) (_1!9657 lt!330237) (_2!9657 lt!330237)))))

(assert (=> d!71175 (= lt!330237 (readBitPure!0 lt!330238))))

(assert (=> d!71175 (= lt!330240 (readBitPure!0 lt!329311))))

(assert (=> d!71175 (= lt!330238 (BitStream!8321 (buf!5123 (_2!9656 lt!329319)) (currentByte!9665 lt!329311) (currentBit!9660 lt!329311)))))

(assert (=> d!71175 (invariant!0 (currentBit!9660 lt!329311) (currentByte!9665 lt!329311) (size!4606 (buf!5123 (_2!9656 lt!329319))))))

(assert (=> d!71175 (= (readBitPrefixLemma!0 lt!329311 (_2!9656 lt!329319)) lt!330239)))

(declare-fun b!210403 () Bool)

(assert (=> b!210403 (= e!143543 (= (_2!9657 lt!330240) (_2!9657 lt!330237)))))

(assert (= (and d!71175 res!176654) b!210403))

(declare-fun m!323979 () Bool)

(assert (=> d!71175 m!323979))

(declare-fun m!323981 () Bool)

(assert (=> d!71175 m!323981))

(assert (=> d!71175 m!323341))

(declare-fun m!323983 () Bool)

(assert (=> d!71175 m!323983))

(declare-fun m!323985 () Bool)

(assert (=> d!71175 m!323985))

(declare-fun m!323987 () Bool)

(assert (=> d!71175 m!323987))

(assert (=> b!210033 d!71175))

(declare-fun d!71177 () Bool)

(declare-fun lt!330241 () tuple2!18032)

(assert (=> d!71177 (= lt!330241 (readNBitsLSBFirstsLoop!0 (_1!9658 lt!329321) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!329325))))

(assert (=> d!71177 (= (readNBitsLSBFirstsLoopPure!0 (_1!9658 lt!329321) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!329325) (tuple2!18009 (_2!9671 lt!330241) (_1!9671 lt!330241)))))

(declare-fun bs!17475 () Bool)

(assert (= bs!17475 d!71177))

(declare-fun m!323989 () Bool)

(assert (=> bs!17475 m!323989))

(assert (=> b!210033 d!71177))

(declare-fun d!71179 () Bool)

(assert (=> d!71179 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4606 (buf!5123 (_2!9656 lt!329319)))) ((_ sign_extend 32) (currentByte!9665 thiss!1204)) ((_ sign_extend 32) (currentBit!9660 thiss!1204)) lt!329312) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4606 (buf!5123 (_2!9656 lt!329319)))) ((_ sign_extend 32) (currentByte!9665 thiss!1204)) ((_ sign_extend 32) (currentBit!9660 thiss!1204))) lt!329312))))

(declare-fun bs!17476 () Bool)

(assert (= bs!17476 d!71179))

(declare-fun m!323991 () Bool)

(assert (=> bs!17476 m!323991))

(assert (=> b!210033 d!71179))

(declare-fun d!71181 () Bool)

(declare-fun e!143544 () Bool)

(assert (=> d!71181 e!143544))

(declare-fun res!176655 () Bool)

(assert (=> d!71181 (=> (not res!176655) (not e!143544))))

(declare-fun lt!330243 () (_ BitVec 64))

(declare-fun lt!330242 () (_ BitVec 64))

(declare-fun lt!330245 () (_ BitVec 64))

(assert (=> d!71181 (= res!176655 (= lt!330243 (bvsub lt!330245 lt!330242)))))

(assert (=> d!71181 (or (= (bvand lt!330245 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!330242 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!330245 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!330245 lt!330242) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71181 (= lt!330242 (remainingBits!0 ((_ sign_extend 32) (size!4606 (buf!5123 (_1!9657 lt!329309)))) ((_ sign_extend 32) (currentByte!9665 (_1!9657 lt!329309))) ((_ sign_extend 32) (currentBit!9660 (_1!9657 lt!329309)))))))

(declare-fun lt!330244 () (_ BitVec 64))

(declare-fun lt!330246 () (_ BitVec 64))

(assert (=> d!71181 (= lt!330245 (bvmul lt!330244 lt!330246))))

(assert (=> d!71181 (or (= lt!330244 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!330246 (bvsdiv (bvmul lt!330244 lt!330246) lt!330244)))))

(assert (=> d!71181 (= lt!330246 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71181 (= lt!330244 ((_ sign_extend 32) (size!4606 (buf!5123 (_1!9657 lt!329309)))))))

(assert (=> d!71181 (= lt!330243 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9665 (_1!9657 lt!329309))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9660 (_1!9657 lt!329309)))))))

(assert (=> d!71181 (invariant!0 (currentBit!9660 (_1!9657 lt!329309)) (currentByte!9665 (_1!9657 lt!329309)) (size!4606 (buf!5123 (_1!9657 lt!329309))))))

(assert (=> d!71181 (= (bitIndex!0 (size!4606 (buf!5123 (_1!9657 lt!329309))) (currentByte!9665 (_1!9657 lt!329309)) (currentBit!9660 (_1!9657 lt!329309))) lt!330243)))

(declare-fun b!210404 () Bool)

(declare-fun res!176656 () Bool)

(assert (=> b!210404 (=> (not res!176656) (not e!143544))))

(assert (=> b!210404 (= res!176656 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!330243))))

(declare-fun b!210405 () Bool)

(declare-fun lt!330247 () (_ BitVec 64))

(assert (=> b!210405 (= e!143544 (bvsle lt!330243 (bvmul lt!330247 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!210405 (or (= lt!330247 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!330247 #b0000000000000000000000000000000000000000000000000000000000001000) lt!330247)))))

(assert (=> b!210405 (= lt!330247 ((_ sign_extend 32) (size!4606 (buf!5123 (_1!9657 lt!329309)))))))

(assert (= (and d!71181 res!176655) b!210404))

(assert (= (and b!210404 res!176656) b!210405))

(declare-fun m!323993 () Bool)

(assert (=> d!71181 m!323993))

(declare-fun m!323995 () Bool)

(assert (=> d!71181 m!323995))

(assert (=> b!210033 d!71181))

(declare-fun d!71183 () Bool)

(assert (=> d!71183 (= (invariant!0 (currentBit!9660 thiss!1204) (currentByte!9665 thiss!1204) (size!4606 (buf!5123 (_2!9656 lt!329330)))) (and (bvsge (currentBit!9660 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9660 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9665 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9665 thiss!1204) (size!4606 (buf!5123 (_2!9656 lt!329330)))) (and (= (currentBit!9660 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9665 thiss!1204) (size!4606 (buf!5123 (_2!9656 lt!329330))))))))))

(assert (=> b!210033 d!71183))

(declare-fun d!71185 () Bool)

(assert (=> d!71185 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4606 (buf!5123 (_2!9656 lt!329319)))) ((_ sign_extend 32) (currentByte!9665 (_2!9656 lt!329330))) ((_ sign_extend 32) (currentBit!9660 (_2!9656 lt!329330))) lt!329331) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4606 (buf!5123 (_2!9656 lt!329319)))) ((_ sign_extend 32) (currentByte!9665 (_2!9656 lt!329330))) ((_ sign_extend 32) (currentBit!9660 (_2!9656 lt!329330)))) lt!329331))))

(declare-fun bs!17477 () Bool)

(assert (= bs!17477 d!71185))

(declare-fun m!323997 () Bool)

(assert (=> bs!17477 m!323997))

(assert (=> b!210033 d!71185))

(declare-fun d!71187 () Bool)

(assert (=> d!71187 (validate_offset_bits!1 ((_ sign_extend 32) (size!4606 (buf!5123 (_2!9656 lt!329319)))) ((_ sign_extend 32) (currentByte!9665 (_2!9656 lt!329330))) ((_ sign_extend 32) (currentBit!9660 (_2!9656 lt!329330))) lt!329331)))

(declare-fun lt!330248 () Unit!14962)

(assert (=> d!71187 (= lt!330248 (choose!9 (_2!9656 lt!329330) (buf!5123 (_2!9656 lt!329319)) lt!329331 (BitStream!8321 (buf!5123 (_2!9656 lt!329319)) (currentByte!9665 (_2!9656 lt!329330)) (currentBit!9660 (_2!9656 lt!329330)))))))

(assert (=> d!71187 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9656 lt!329330) (buf!5123 (_2!9656 lt!329319)) lt!329331) lt!330248)))

(declare-fun bs!17478 () Bool)

(assert (= bs!17478 d!71187))

(assert (=> bs!17478 m!323337))

(declare-fun m!323999 () Bool)

(assert (=> bs!17478 m!323999))

(assert (=> b!210033 d!71187))

(declare-fun d!71189 () Bool)

(declare-fun e!143545 () Bool)

(assert (=> d!71189 e!143545))

(declare-fun res!176657 () Bool)

(assert (=> d!71189 (=> (not res!176657) (not e!143545))))

(declare-fun lt!330252 () (_ BitVec 64))

(declare-fun lt!330249 () (_ BitVec 64))

(declare-fun lt!330250 () (_ BitVec 64))

(assert (=> d!71189 (= res!176657 (= lt!330250 (bvsub lt!330252 lt!330249)))))

(assert (=> d!71189 (or (= (bvand lt!330252 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!330249 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!330252 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!330252 lt!330249) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71189 (= lt!330249 (remainingBits!0 ((_ sign_extend 32) (size!4606 (buf!5123 (_1!9657 lt!329317)))) ((_ sign_extend 32) (currentByte!9665 (_1!9657 lt!329317))) ((_ sign_extend 32) (currentBit!9660 (_1!9657 lt!329317)))))))

(declare-fun lt!330251 () (_ BitVec 64))

(declare-fun lt!330253 () (_ BitVec 64))

(assert (=> d!71189 (= lt!330252 (bvmul lt!330251 lt!330253))))

(assert (=> d!71189 (or (= lt!330251 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!330253 (bvsdiv (bvmul lt!330251 lt!330253) lt!330251)))))

(assert (=> d!71189 (= lt!330253 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71189 (= lt!330251 ((_ sign_extend 32) (size!4606 (buf!5123 (_1!9657 lt!329317)))))))

(assert (=> d!71189 (= lt!330250 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9665 (_1!9657 lt!329317))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9660 (_1!9657 lt!329317)))))))

(assert (=> d!71189 (invariant!0 (currentBit!9660 (_1!9657 lt!329317)) (currentByte!9665 (_1!9657 lt!329317)) (size!4606 (buf!5123 (_1!9657 lt!329317))))))

(assert (=> d!71189 (= (bitIndex!0 (size!4606 (buf!5123 (_1!9657 lt!329317))) (currentByte!9665 (_1!9657 lt!329317)) (currentBit!9660 (_1!9657 lt!329317))) lt!330250)))

(declare-fun b!210406 () Bool)

(declare-fun res!176658 () Bool)

(assert (=> b!210406 (=> (not res!176658) (not e!143545))))

(assert (=> b!210406 (= res!176658 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!330250))))

(declare-fun b!210407 () Bool)

(declare-fun lt!330254 () (_ BitVec 64))

(assert (=> b!210407 (= e!143545 (bvsle lt!330250 (bvmul lt!330254 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!210407 (or (= lt!330254 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!330254 #b0000000000000000000000000000000000000000000000000000000000001000) lt!330254)))))

(assert (=> b!210407 (= lt!330254 ((_ sign_extend 32) (size!4606 (buf!5123 (_1!9657 lt!329317)))))))

(assert (= (and d!71189 res!176657) b!210406))

(assert (= (and b!210406 res!176658) b!210407))

(declare-fun m!324001 () Bool)

(assert (=> d!71189 m!324001))

(declare-fun m!324003 () Bool)

(assert (=> d!71189 m!324003))

(assert (=> b!210033 d!71189))

(declare-fun d!71191 () Bool)

(declare-fun lt!330255 () tuple2!18030)

(assert (=> d!71191 (= lt!330255 (readBit!0 (_1!9658 lt!329322)))))

(assert (=> d!71191 (= (readBitPure!0 (_1!9658 lt!329322)) (tuple2!18005 (_2!9670 lt!330255) (_1!9670 lt!330255)))))

(declare-fun bs!17479 () Bool)

(assert (= bs!17479 d!71191))

(declare-fun m!324005 () Bool)

(assert (=> bs!17479 m!324005))

(assert (=> b!210033 d!71191))

(declare-fun lt!330256 () tuple2!18032)

(declare-fun d!71193 () Bool)

(assert (=> d!71193 (= lt!330256 (readNBitsLSBFirstsLoop!0 (_1!9658 lt!329322) nBits!348 i!590 lt!329307))))

(assert (=> d!71193 (= (readNBitsLSBFirstsLoopPure!0 (_1!9658 lt!329322) nBits!348 i!590 lt!329307) (tuple2!18009 (_2!9671 lt!330256) (_1!9671 lt!330256)))))

(declare-fun bs!17480 () Bool)

(assert (= bs!17480 d!71193))

(declare-fun m!324007 () Bool)

(assert (=> bs!17480 m!324007))

(assert (=> b!210033 d!71193))

(push 1)

(assert (not d!71177))

(assert (not d!71073))

(assert (not d!71159))

(assert (not b!210369))

(assert (not d!71069))

(assert (not b!210397))

(assert (not b!210398))

(assert (not d!71163))

(assert (not d!71087))

(assert (not b!210185))

(assert (not d!71193))

(assert (not b!210370))

(assert (not b!210311))

(assert (not d!71189))

(assert (not d!71179))

(assert (not d!71147))

(assert (not b!210368))

(assert (not b!210392))

(assert (not b!210301))

(assert (not d!71157))

(assert (not b!210393))

(assert (not b!210400))

(assert (not b!210314))

(assert (not d!71155))

(assert (not b!210373))

(assert (not d!71171))

(assert (not d!71173))

(assert (not b!210308))

(assert (not bm!3306))

(assert (not b!210303))

(assert (not d!71187))

(assert (not b!210310))

(assert (not b!210325))

(assert (not b!210367))

(assert (not d!71191))

(assert (not d!71175))

(assert (not d!71131))

(assert (not d!71139))

(assert (not d!71161))

(assert (not d!71135))

(assert (not d!71089))

(assert (not b!210315))

(assert (not d!71137))

(assert (not b!210394))

(assert (not b!210201))

(assert (not d!71181))

(assert (not d!71167))

(assert (not b!210312))

(assert (not b!210399))

(assert (not b!210304))

(assert (not b!210203))

(assert (not b!210371))

(assert (not b!210323))

(assert (not d!71185))

(assert (not d!71083))

(assert (not b!210309))

(assert (not d!71071))

(assert (not b!210395))

(assert (not d!71169))

(check-sat)

(pop 1)

(push 1)

(check-sat)

