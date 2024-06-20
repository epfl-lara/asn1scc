; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44548 () Bool)

(assert start!44548)

(declare-fun b!212294 () Bool)

(declare-fun e!144689 () Bool)

(declare-fun e!144691 () Bool)

(assert (=> b!212294 (= e!144689 (not e!144691))))

(declare-fun res!178325 () Bool)

(assert (=> b!212294 (=> res!178325 e!144691)))

(declare-fun lt!334847 () (_ BitVec 64))

(declare-fun lt!334855 () (_ BitVec 64))

(assert (=> b!212294 (= res!178325 (not (= lt!334847 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!334855))))))

(declare-datatypes ((array!10521 0))(
  ( (array!10522 (arr!5550 (Array (_ BitVec 32) (_ BitVec 8))) (size!4620 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8348 0))(
  ( (BitStream!8349 (buf!5149 array!10521) (currentByte!9715 (_ BitVec 32)) (currentBit!9710 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!15146 0))(
  ( (Unit!15147) )
))
(declare-datatypes ((tuple2!18162 0))(
  ( (tuple2!18163 (_1!9736 Unit!15146) (_2!9736 BitStream!8348)) )
))
(declare-fun lt!334840 () tuple2!18162)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!212294 (= lt!334847 (bitIndex!0 (size!4620 (buf!5149 (_2!9736 lt!334840))) (currentByte!9715 (_2!9736 lt!334840)) (currentBit!9710 (_2!9736 lt!334840))))))

(declare-fun thiss!1204 () BitStream!8348)

(assert (=> b!212294 (= lt!334855 (bitIndex!0 (size!4620 (buf!5149 thiss!1204)) (currentByte!9715 thiss!1204) (currentBit!9710 thiss!1204)))))

(declare-fun e!144686 () Bool)

(assert (=> b!212294 e!144686))

(declare-fun res!178320 () Bool)

(assert (=> b!212294 (=> (not res!178320) (not e!144686))))

(assert (=> b!212294 (= res!178320 (= (size!4620 (buf!5149 thiss!1204)) (size!4620 (buf!5149 (_2!9736 lt!334840)))))))

(declare-fun lt!334846 () Bool)

(declare-fun appendBit!0 (BitStream!8348 Bool) tuple2!18162)

(assert (=> b!212294 (= lt!334840 (appendBit!0 thiss!1204 lt!334846))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun lt!334851 () (_ BitVec 64))

(assert (=> b!212294 (= lt!334846 (not (= (bvand v!189 lt!334851) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!212294 (= lt!334851 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!212295 () Bool)

(declare-fun e!144696 () Bool)

(declare-datatypes ((tuple2!18164 0))(
  ( (tuple2!18165 (_1!9737 BitStream!8348) (_2!9737 Bool)) )
))
(declare-fun lt!334849 () tuple2!18164)

(declare-fun lt!334842 () (_ BitVec 64))

(assert (=> b!212295 (= e!144696 (= (bitIndex!0 (size!4620 (buf!5149 (_1!9737 lt!334849))) (currentByte!9715 (_1!9737 lt!334849)) (currentBit!9710 (_1!9737 lt!334849))) lt!334842))))

(declare-fun b!212296 () Bool)

(declare-fun res!178317 () Bool)

(assert (=> b!212296 (=> (not res!178317) (not e!144689))))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!212296 (= res!178317 (not (= i!590 nBits!348)))))

(declare-fun b!212297 () Bool)

(declare-fun e!144687 () Bool)

(declare-fun lt!334845 () tuple2!18162)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!212297 (= e!144687 (invariant!0 (currentBit!9710 thiss!1204) (currentByte!9715 thiss!1204) (size!4620 (buf!5149 (_2!9736 lt!334845)))))))

(declare-fun b!212298 () Bool)

(declare-fun res!178311 () Bool)

(declare-fun e!144685 () Bool)

(assert (=> b!212298 (=> res!178311 e!144685)))

(assert (=> b!212298 (= res!178311 (not (invariant!0 (currentBit!9710 (_2!9736 lt!334845)) (currentByte!9715 (_2!9736 lt!334845)) (size!4620 (buf!5149 (_2!9736 lt!334845))))))))

(declare-fun b!212299 () Bool)

(declare-fun e!144684 () Bool)

(assert (=> b!212299 (= e!144684 e!144696)))

(declare-fun res!178321 () Bool)

(assert (=> b!212299 (=> (not res!178321) (not e!144696))))

(assert (=> b!212299 (= res!178321 (and (= (_2!9737 lt!334849) lt!334846) (= (_1!9737 lt!334849) (_2!9736 lt!334840))))))

(declare-fun readBitPure!0 (BitStream!8348) tuple2!18164)

(declare-fun readerFrom!0 (BitStream!8348 (_ BitVec 32) (_ BitVec 32)) BitStream!8348)

(assert (=> b!212299 (= lt!334849 (readBitPure!0 (readerFrom!0 (_2!9736 lt!334840) (currentBit!9710 thiss!1204) (currentByte!9715 thiss!1204))))))

(declare-fun res!178323 () Bool)

(declare-fun e!144690 () Bool)

(assert (=> start!44548 (=> (not res!178323) (not e!144690))))

(assert (=> start!44548 (= res!178323 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!44548 e!144690))

(assert (=> start!44548 true))

(declare-fun e!144688 () Bool)

(declare-fun inv!12 (BitStream!8348) Bool)

(assert (=> start!44548 (and (inv!12 thiss!1204) e!144688)))

(declare-fun b!212300 () Bool)

(assert (=> b!212300 (= e!144690 e!144689)))

(declare-fun res!178326 () Bool)

(assert (=> b!212300 (=> (not res!178326) (not e!144689))))

(declare-fun lt!334865 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!212300 (= res!178326 (validate_offset_bits!1 ((_ sign_extend 32) (size!4620 (buf!5149 thiss!1204))) ((_ sign_extend 32) (currentByte!9715 thiss!1204)) ((_ sign_extend 32) (currentBit!9710 thiss!1204)) lt!334865))))

(assert (=> b!212300 (= lt!334865 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!212301 () Bool)

(declare-fun res!178316 () Bool)

(assert (=> b!212301 (=> (not res!178316) (not e!144684))))

(declare-fun isPrefixOf!0 (BitStream!8348 BitStream!8348) Bool)

(assert (=> b!212301 (= res!178316 (isPrefixOf!0 thiss!1204 (_2!9736 lt!334840)))))

(declare-fun b!212302 () Bool)

(declare-fun res!178324 () Bool)

(assert (=> b!212302 (=> res!178324 e!144685)))

(declare-fun lt!334841 () (_ BitVec 64))

(assert (=> b!212302 (= res!178324 (or (not (= (size!4620 (buf!5149 (_2!9736 lt!334845))) (size!4620 (buf!5149 thiss!1204)))) (not (= lt!334841 (bvsub (bvadd lt!334855 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!212303 () Bool)

(declare-datatypes ((tuple2!18166 0))(
  ( (tuple2!18167 (_1!9738 BitStream!8348) (_2!9738 BitStream!8348)) )
))
(declare-fun lt!334864 () tuple2!18166)

(declare-fun e!144695 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!8348 (_ BitVec 64)) BitStream!8348)

(assert (=> b!212303 (= e!144695 (= (_1!9738 lt!334864) (withMovedBitIndex!0 (_2!9738 lt!334864) (bvsub lt!334847 lt!334841))))))

(declare-fun b!212304 () Bool)

(declare-fun array_inv!4361 (array!10521) Bool)

(assert (=> b!212304 (= e!144688 (array_inv!4361 (buf!5149 thiss!1204)))))

(declare-fun b!212305 () Bool)

(assert (=> b!212305 (= e!144691 e!144685)))

(declare-fun res!178327 () Bool)

(assert (=> b!212305 (=> res!178327 e!144685)))

(assert (=> b!212305 (= res!178327 (not (= lt!334841 (bvsub (bvsub (bvadd lt!334847 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!212305 (= lt!334841 (bitIndex!0 (size!4620 (buf!5149 (_2!9736 lt!334845))) (currentByte!9715 (_2!9736 lt!334845)) (currentBit!9710 (_2!9736 lt!334845))))))

(assert (=> b!212305 (isPrefixOf!0 thiss!1204 (_2!9736 lt!334845))))

(declare-fun lt!334856 () Unit!15146)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8348 BitStream!8348 BitStream!8348) Unit!15146)

(assert (=> b!212305 (= lt!334856 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9736 lt!334840) (_2!9736 lt!334845)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8348 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!18162)

(assert (=> b!212305 (= lt!334845 (appendBitsLSBFirstLoopTR!0 (_2!9736 lt!334840) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!212306 () Bool)

(declare-fun e!144694 () Bool)

(assert (=> b!212306 (= e!144685 e!144694)))

(declare-fun res!178328 () Bool)

(assert (=> b!212306 (=> res!178328 e!144694)))

(declare-fun lt!334860 () (_ BitVec 64))

(declare-datatypes ((tuple2!18168 0))(
  ( (tuple2!18169 (_1!9739 BitStream!8348) (_2!9739 (_ BitVec 64))) )
))
(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8348 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18168)

(assert (=> b!212306 (= res!178328 (not (= (_1!9739 (readNBitsLSBFirstsLoopPure!0 (_1!9738 lt!334864) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!334860)) (_2!9738 lt!334864))))))

(declare-fun lt!334862 () (_ BitVec 64))

(assert (=> b!212306 (validate_offset_bits!1 ((_ sign_extend 32) (size!4620 (buf!5149 (_2!9736 lt!334845)))) ((_ sign_extend 32) (currentByte!9715 (_2!9736 lt!334840))) ((_ sign_extend 32) (currentBit!9710 (_2!9736 lt!334840))) lt!334862)))

(declare-fun lt!334858 () Unit!15146)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8348 array!10521 (_ BitVec 64)) Unit!15146)

(assert (=> b!212306 (= lt!334858 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9736 lt!334840) (buf!5149 (_2!9736 lt!334845)) lt!334862))))

(assert (=> b!212306 (= lt!334862 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!334852 () tuple2!18164)

(declare-fun lt!334848 () (_ BitVec 64))

(assert (=> b!212306 (= lt!334860 (bvor lt!334848 (ite (_2!9737 lt!334852) lt!334851 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!334839 () tuple2!18166)

(declare-fun lt!334850 () tuple2!18168)

(assert (=> b!212306 (= lt!334850 (readNBitsLSBFirstsLoopPure!0 (_1!9738 lt!334839) nBits!348 i!590 lt!334848))))

(assert (=> b!212306 (validate_offset_bits!1 ((_ sign_extend 32) (size!4620 (buf!5149 (_2!9736 lt!334845)))) ((_ sign_extend 32) (currentByte!9715 thiss!1204)) ((_ sign_extend 32) (currentBit!9710 thiss!1204)) lt!334865)))

(declare-fun lt!334861 () Unit!15146)

(assert (=> b!212306 (= lt!334861 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5149 (_2!9736 lt!334845)) lt!334865))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!212306 (= lt!334848 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!212306 (= (_2!9737 lt!334852) lt!334846)))

(assert (=> b!212306 (= lt!334852 (readBitPure!0 (_1!9738 lt!334839)))))

(declare-fun reader!0 (BitStream!8348 BitStream!8348) tuple2!18166)

(assert (=> b!212306 (= lt!334864 (reader!0 (_2!9736 lt!334840) (_2!9736 lt!334845)))))

(assert (=> b!212306 (= lt!334839 (reader!0 thiss!1204 (_2!9736 lt!334845)))))

(declare-fun e!144692 () Bool)

(assert (=> b!212306 e!144692))

(declare-fun res!178314 () Bool)

(assert (=> b!212306 (=> (not res!178314) (not e!144692))))

(declare-fun lt!334859 () tuple2!18164)

(declare-fun lt!334863 () tuple2!18164)

(assert (=> b!212306 (= res!178314 (= (bitIndex!0 (size!4620 (buf!5149 (_1!9737 lt!334859))) (currentByte!9715 (_1!9737 lt!334859)) (currentBit!9710 (_1!9737 lt!334859))) (bitIndex!0 (size!4620 (buf!5149 (_1!9737 lt!334863))) (currentByte!9715 (_1!9737 lt!334863)) (currentBit!9710 (_1!9737 lt!334863)))))))

(declare-fun lt!334854 () Unit!15146)

(declare-fun lt!334843 () BitStream!8348)

(declare-fun readBitPrefixLemma!0 (BitStream!8348 BitStream!8348) Unit!15146)

(assert (=> b!212306 (= lt!334854 (readBitPrefixLemma!0 lt!334843 (_2!9736 lt!334845)))))

(assert (=> b!212306 (= lt!334863 (readBitPure!0 (BitStream!8349 (buf!5149 (_2!9736 lt!334845)) (currentByte!9715 thiss!1204) (currentBit!9710 thiss!1204))))))

(assert (=> b!212306 (= lt!334859 (readBitPure!0 lt!334843))))

(assert (=> b!212306 e!144687))

(declare-fun res!178319 () Bool)

(assert (=> b!212306 (=> (not res!178319) (not e!144687))))

(assert (=> b!212306 (= res!178319 (invariant!0 (currentBit!9710 thiss!1204) (currentByte!9715 thiss!1204) (size!4620 (buf!5149 (_2!9736 lt!334840)))))))

(assert (=> b!212306 (= lt!334843 (BitStream!8349 (buf!5149 (_2!9736 lt!334840)) (currentByte!9715 thiss!1204) (currentBit!9710 thiss!1204)))))

(declare-fun b!212307 () Bool)

(assert (=> b!212307 (= e!144694 (= lt!334855 (bvsub lt!334847 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!212307 e!144695))

(declare-fun res!178315 () Bool)

(assert (=> b!212307 (=> (not res!178315) (not e!144695))))

(declare-fun lt!334857 () tuple2!18168)

(assert (=> b!212307 (= res!178315 (and (= (_2!9739 lt!334850) (_2!9739 lt!334857)) (= (_1!9739 lt!334850) (_1!9739 lt!334857))))))

(declare-fun lt!334853 () Unit!15146)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8348 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!15146)

(assert (=> b!212307 (= lt!334853 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9738 lt!334839) nBits!348 i!590 lt!334848))))

(assert (=> b!212307 (= lt!334857 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9738 lt!334839) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!334860))))

(declare-fun b!212308 () Bool)

(declare-fun res!178312 () Bool)

(assert (=> b!212308 (=> (not res!178312) (not e!144695))))

(assert (=> b!212308 (= res!178312 (= (_1!9738 lt!334839) (withMovedBitIndex!0 (_2!9738 lt!334839) (bvsub lt!334855 lt!334841))))))

(declare-fun b!212309 () Bool)

(declare-fun res!178318 () Bool)

(assert (=> b!212309 (=> res!178318 e!144685)))

(assert (=> b!212309 (= res!178318 (not (isPrefixOf!0 thiss!1204 (_2!9736 lt!334840))))))

(declare-fun b!212310 () Bool)

(assert (=> b!212310 (= e!144692 (= (_2!9737 lt!334859) (_2!9737 lt!334863)))))

(declare-fun b!212311 () Bool)

(declare-fun res!178313 () Bool)

(assert (=> b!212311 (=> (not res!178313) (not e!144689))))

(assert (=> b!212311 (= res!178313 (invariant!0 (currentBit!9710 thiss!1204) (currentByte!9715 thiss!1204) (size!4620 (buf!5149 thiss!1204))))))

(declare-fun b!212312 () Bool)

(assert (=> b!212312 (= e!144686 e!144684)))

(declare-fun res!178322 () Bool)

(assert (=> b!212312 (=> (not res!178322) (not e!144684))))

(declare-fun lt!334844 () (_ BitVec 64))

(assert (=> b!212312 (= res!178322 (= lt!334842 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!334844)))))

(assert (=> b!212312 (= lt!334842 (bitIndex!0 (size!4620 (buf!5149 (_2!9736 lt!334840))) (currentByte!9715 (_2!9736 lt!334840)) (currentBit!9710 (_2!9736 lt!334840))))))

(assert (=> b!212312 (= lt!334844 (bitIndex!0 (size!4620 (buf!5149 thiss!1204)) (currentByte!9715 thiss!1204) (currentBit!9710 thiss!1204)))))

(declare-fun b!212313 () Bool)

(declare-fun res!178310 () Bool)

(assert (=> b!212313 (=> res!178310 e!144685)))

(assert (=> b!212313 (= res!178310 (not (isPrefixOf!0 (_2!9736 lt!334840) (_2!9736 lt!334845))))))

(assert (= (and start!44548 res!178323) b!212300))

(assert (= (and b!212300 res!178326) b!212311))

(assert (= (and b!212311 res!178313) b!212296))

(assert (= (and b!212296 res!178317) b!212294))

(assert (= (and b!212294 res!178320) b!212312))

(assert (= (and b!212312 res!178322) b!212301))

(assert (= (and b!212301 res!178316) b!212299))

(assert (= (and b!212299 res!178321) b!212295))

(assert (= (and b!212294 (not res!178325)) b!212305))

(assert (= (and b!212305 (not res!178327)) b!212298))

(assert (= (and b!212298 (not res!178311)) b!212302))

(assert (= (and b!212302 (not res!178324)) b!212313))

(assert (= (and b!212313 (not res!178310)) b!212309))

(assert (= (and b!212309 (not res!178318)) b!212306))

(assert (= (and b!212306 res!178319) b!212297))

(assert (= (and b!212306 res!178314) b!212310))

(assert (= (and b!212306 (not res!178328)) b!212307))

(assert (= (and b!212307 res!178315) b!212308))

(assert (= (and b!212308 res!178312) b!212303))

(assert (= start!44548 b!212304))

(declare-fun m!327315 () Bool)

(assert (=> b!212306 m!327315))

(declare-fun m!327317 () Bool)

(assert (=> b!212306 m!327317))

(declare-fun m!327319 () Bool)

(assert (=> b!212306 m!327319))

(declare-fun m!327321 () Bool)

(assert (=> b!212306 m!327321))

(declare-fun m!327323 () Bool)

(assert (=> b!212306 m!327323))

(declare-fun m!327325 () Bool)

(assert (=> b!212306 m!327325))

(declare-fun m!327327 () Bool)

(assert (=> b!212306 m!327327))

(declare-fun m!327329 () Bool)

(assert (=> b!212306 m!327329))

(declare-fun m!327331 () Bool)

(assert (=> b!212306 m!327331))

(declare-fun m!327333 () Bool)

(assert (=> b!212306 m!327333))

(declare-fun m!327335 () Bool)

(assert (=> b!212306 m!327335))

(declare-fun m!327337 () Bool)

(assert (=> b!212306 m!327337))

(declare-fun m!327339 () Bool)

(assert (=> b!212306 m!327339))

(declare-fun m!327341 () Bool)

(assert (=> b!212306 m!327341))

(declare-fun m!327343 () Bool)

(assert (=> b!212306 m!327343))

(declare-fun m!327345 () Bool)

(assert (=> b!212306 m!327345))

(declare-fun m!327347 () Bool)

(assert (=> b!212303 m!327347))

(declare-fun m!327349 () Bool)

(assert (=> b!212301 m!327349))

(declare-fun m!327351 () Bool)

(assert (=> b!212307 m!327351))

(declare-fun m!327353 () Bool)

(assert (=> b!212307 m!327353))

(assert (=> b!212307 m!327353))

(declare-fun m!327355 () Bool)

(assert (=> b!212307 m!327355))

(assert (=> b!212309 m!327349))

(declare-fun m!327357 () Bool)

(assert (=> b!212312 m!327357))

(declare-fun m!327359 () Bool)

(assert (=> b!212312 m!327359))

(declare-fun m!327361 () Bool)

(assert (=> b!212300 m!327361))

(declare-fun m!327363 () Bool)

(assert (=> b!212297 m!327363))

(assert (=> b!212294 m!327357))

(assert (=> b!212294 m!327359))

(declare-fun m!327365 () Bool)

(assert (=> b!212294 m!327365))

(declare-fun m!327367 () Bool)

(assert (=> b!212313 m!327367))

(declare-fun m!327369 () Bool)

(assert (=> b!212311 m!327369))

(declare-fun m!327371 () Bool)

(assert (=> b!212304 m!327371))

(declare-fun m!327373 () Bool)

(assert (=> b!212298 m!327373))

(declare-fun m!327375 () Bool)

(assert (=> b!212308 m!327375))

(declare-fun m!327377 () Bool)

(assert (=> b!212305 m!327377))

(declare-fun m!327379 () Bool)

(assert (=> b!212305 m!327379))

(declare-fun m!327381 () Bool)

(assert (=> b!212305 m!327381))

(declare-fun m!327383 () Bool)

(assert (=> b!212305 m!327383))

(declare-fun m!327385 () Bool)

(assert (=> start!44548 m!327385))

(declare-fun m!327387 () Bool)

(assert (=> b!212295 m!327387))

(declare-fun m!327389 () Bool)

(assert (=> b!212299 m!327389))

(assert (=> b!212299 m!327389))

(declare-fun m!327391 () Bool)

(assert (=> b!212299 m!327391))

(push 1)

(assert (not b!212307))

(assert (not b!212305))

(assert (not b!212297))

(assert (not b!212303))

(assert (not b!212306))

(assert (not b!212294))

(assert (not b!212300))

(assert (not b!212304))

(assert (not b!212298))

(assert (not b!212301))

(assert (not b!212313))

(assert (not b!212309))

(assert (not b!212311))

(assert (not b!212312))

(assert (not start!44548))

(assert (not b!212295))

(assert (not b!212299))

(assert (not b!212308))

(check-sat)

(pop 1)

(push 1)

(check-sat)

