; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40992 () Bool)

(assert start!40992)

(declare-fun b!189319 () Bool)

(declare-fun res!157832 () Bool)

(declare-fun e!130733 () Bool)

(assert (=> b!189319 (=> (not res!157832) (not e!130733))))

(declare-datatypes ((array!9882 0))(
  ( (array!9883 (arr!5286 (Array (_ BitVec 32) (_ BitVec 8))) (size!4356 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7820 0))(
  ( (BitStream!7821 (buf!4830 array!9882) (currentByte!9102 (_ BitVec 32)) (currentBit!9097 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!16356 0))(
  ( (tuple2!16357 (_1!8823 BitStream!7820) (_2!8823 BitStream!7820)) )
))
(declare-fun lt!294024 () tuple2!16356)

(declare-fun lt!294025 () (_ BitVec 64))

(declare-fun lt!294028 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!7820 (_ BitVec 64)) BitStream!7820)

(assert (=> b!189319 (= res!157832 (= (_1!8823 lt!294024) (withMovedBitIndex!0 (_2!8823 lt!294024) (bvsub lt!294028 lt!294025))))))

(declare-fun b!189320 () Bool)

(declare-fun e!130722 () Bool)

(declare-fun e!130727 () Bool)

(assert (=> b!189320 (= e!130722 e!130727)))

(declare-fun res!157821 () Bool)

(assert (=> b!189320 (=> res!157821 e!130727)))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!189320 (= res!157821 (not (= lt!294025 (bvsub (bvsub (bvadd lt!294028 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-datatypes ((Unit!13511 0))(
  ( (Unit!13512) )
))
(declare-datatypes ((tuple2!16358 0))(
  ( (tuple2!16359 (_1!8824 Unit!13511) (_2!8824 BitStream!7820)) )
))
(declare-fun lt!294026 () tuple2!16358)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!189320 (= lt!294025 (bitIndex!0 (size!4356 (buf!4830 (_2!8824 lt!294026))) (currentByte!9102 (_2!8824 lt!294026)) (currentBit!9097 (_2!8824 lt!294026))))))

(declare-fun thiss!1204 () BitStream!7820)

(declare-fun isPrefixOf!0 (BitStream!7820 BitStream!7820) Bool)

(assert (=> b!189320 (isPrefixOf!0 thiss!1204 (_2!8824 lt!294026))))

(declare-fun lt!294030 () tuple2!16358)

(declare-fun lt!294014 () Unit!13511)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7820 BitStream!7820 BitStream!7820) Unit!13511)

(assert (=> b!189320 (= lt!294014 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8824 lt!294030) (_2!8824 lt!294026)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7820 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16358)

(assert (=> b!189320 (= lt!294026 (appendBitsLSBFirstLoopTR!0 (_2!8824 lt!294030) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!189321 () Bool)

(declare-fun res!157825 () Bool)

(assert (=> b!189321 (=> res!157825 e!130727)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!189321 (= res!157825 (not (invariant!0 (currentBit!9097 (_2!8824 lt!294026)) (currentByte!9102 (_2!8824 lt!294026)) (size!4356 (buf!4830 (_2!8824 lt!294026))))))))

(declare-fun b!189322 () Bool)

(declare-fun res!157829 () Bool)

(assert (=> b!189322 (=> res!157829 e!130727)))

(assert (=> b!189322 (= res!157829 (not (isPrefixOf!0 (_2!8824 lt!294030) (_2!8824 lt!294026))))))

(declare-fun b!189323 () Bool)

(declare-fun res!157830 () Bool)

(declare-fun e!130731 () Bool)

(assert (=> b!189323 (=> (not res!157830) (not e!130731))))

(assert (=> b!189323 (= res!157830 (isPrefixOf!0 thiss!1204 (_2!8824 lt!294030)))))

(declare-fun b!189324 () Bool)

(declare-fun res!157817 () Bool)

(declare-fun e!130730 () Bool)

(assert (=> b!189324 (=> (not res!157817) (not e!130730))))

(assert (=> b!189324 (= res!157817 (not (= i!590 nBits!348)))))

(declare-fun b!189325 () Bool)

(declare-fun res!157820 () Bool)

(declare-fun e!130724 () Bool)

(assert (=> b!189325 (=> res!157820 e!130724)))

(declare-datatypes ((tuple2!16360 0))(
  ( (tuple2!16361 (_1!8825 BitStream!7820) (_2!8825 (_ BitVec 64))) )
))
(declare-fun lt!294033 () tuple2!16360)

(declare-fun lt!294006 () tuple2!16356)

(assert (=> b!189325 (= res!157820 (not (= (bitIndex!0 (size!4356 (buf!4830 (_1!8825 lt!294033))) (currentByte!9102 (_1!8825 lt!294033)) (currentBit!9097 (_1!8825 lt!294033))) (bitIndex!0 (size!4356 (buf!4830 (_2!8823 lt!294006))) (currentByte!9102 (_2!8823 lt!294006)) (currentBit!9097 (_2!8823 lt!294006))))))))

(declare-fun lt!294032 () tuple2!16360)

(declare-fun lt!294027 () (_ BitVec 64))

(declare-fun lt!294020 () BitStream!7820)

(declare-fun b!189327 () Bool)

(assert (=> b!189327 (= e!130733 (and (= lt!294027 (bvsub lt!294028 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!8823 lt!294024) lt!294020)) (= (_2!8825 lt!294033) (_2!8825 lt!294032)))))))

(declare-fun b!189328 () Bool)

(declare-fun e!130720 () Bool)

(declare-datatypes ((tuple2!16362 0))(
  ( (tuple2!16363 (_1!8826 BitStream!7820) (_2!8826 Bool)) )
))
(declare-fun lt!294008 () tuple2!16362)

(declare-fun lt!294007 () (_ BitVec 64))

(assert (=> b!189328 (= e!130720 (= (bitIndex!0 (size!4356 (buf!4830 (_1!8826 lt!294008))) (currentByte!9102 (_1!8826 lt!294008)) (currentBit!9097 (_1!8826 lt!294008))) lt!294007))))

(declare-fun b!189329 () Bool)

(declare-fun e!130721 () Bool)

(assert (=> b!189329 (= e!130721 (invariant!0 (currentBit!9097 thiss!1204) (currentByte!9102 thiss!1204) (size!4356 (buf!4830 (_2!8824 lt!294026)))))))

(declare-fun b!189330 () Bool)

(assert (=> b!189330 (= e!130724 (bvsle i!590 #b00000000000000000000000001000000))))

(assert (=> b!189330 (= (size!4356 (buf!4830 thiss!1204)) (size!4356 (buf!4830 (_2!8824 lt!294026))))))

(declare-fun b!189331 () Bool)

(declare-fun e!130728 () Bool)

(declare-fun lt!294019 () tuple2!16362)

(declare-fun lt!294010 () tuple2!16362)

(assert (=> b!189331 (= e!130728 (= (_2!8826 lt!294019) (_2!8826 lt!294010)))))

(declare-fun b!189332 () Bool)

(declare-fun e!130723 () Bool)

(assert (=> b!189332 (= e!130723 e!130731)))

(declare-fun res!157818 () Bool)

(assert (=> b!189332 (=> (not res!157818) (not e!130731))))

(declare-fun lt!294013 () (_ BitVec 64))

(assert (=> b!189332 (= res!157818 (= lt!294007 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!294013)))))

(assert (=> b!189332 (= lt!294007 (bitIndex!0 (size!4356 (buf!4830 (_2!8824 lt!294030))) (currentByte!9102 (_2!8824 lt!294030)) (currentBit!9097 (_2!8824 lt!294030))))))

(assert (=> b!189332 (= lt!294013 (bitIndex!0 (size!4356 (buf!4830 thiss!1204)) (currentByte!9102 thiss!1204) (currentBit!9097 thiss!1204)))))

(declare-fun b!189333 () Bool)

(declare-fun res!157833 () Bool)

(assert (=> b!189333 (=> res!157833 e!130727)))

(assert (=> b!189333 (= res!157833 (or (not (= (size!4356 (buf!4830 (_2!8824 lt!294026))) (size!4356 (buf!4830 thiss!1204)))) (not (= lt!294025 (bvsub (bvadd lt!294027 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!189334 () Bool)

(declare-fun e!130729 () Bool)

(assert (=> b!189334 (= e!130727 e!130729)))

(declare-fun res!157815 () Bool)

(assert (=> b!189334 (=> res!157815 e!130729)))

(assert (=> b!189334 (= res!157815 (not (= (_1!8825 lt!294032) (_2!8823 lt!294024))))))

(declare-fun lt!294009 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7820 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16360)

(assert (=> b!189334 (= lt!294032 (readNBitsLSBFirstsLoopPure!0 (_1!8823 lt!294024) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!294009))))

(declare-fun lt!294016 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!189334 (validate_offset_bits!1 ((_ sign_extend 32) (size!4356 (buf!4830 (_2!8824 lt!294026)))) ((_ sign_extend 32) (currentByte!9102 (_2!8824 lt!294030))) ((_ sign_extend 32) (currentBit!9097 (_2!8824 lt!294030))) lt!294016)))

(declare-fun lt!294017 () Unit!13511)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7820 array!9882 (_ BitVec 64)) Unit!13511)

(assert (=> b!189334 (= lt!294017 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8824 lt!294030) (buf!4830 (_2!8824 lt!294026)) lt!294016))))

(assert (=> b!189334 (= lt!294016 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!294031 () tuple2!16362)

(declare-fun lt!294022 () (_ BitVec 64))

(declare-fun lt!294018 () (_ BitVec 64))

(assert (=> b!189334 (= lt!294009 (bvor lt!294018 (ite (_2!8826 lt!294031) lt!294022 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!189334 (= lt!294033 (readNBitsLSBFirstsLoopPure!0 (_1!8823 lt!294006) nBits!348 i!590 lt!294018))))

(declare-fun lt!294023 () (_ BitVec 64))

(assert (=> b!189334 (validate_offset_bits!1 ((_ sign_extend 32) (size!4356 (buf!4830 (_2!8824 lt!294026)))) ((_ sign_extend 32) (currentByte!9102 thiss!1204)) ((_ sign_extend 32) (currentBit!9097 thiss!1204)) lt!294023)))

(declare-fun lt!294015 () Unit!13511)

(assert (=> b!189334 (= lt!294015 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4830 (_2!8824 lt!294026)) lt!294023))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!189334 (= lt!294018 (bvand v!189 (onesLSBLong!0 i!590)))))

(declare-fun lt!294021 () Bool)

(assert (=> b!189334 (= (_2!8826 lt!294031) lt!294021)))

(declare-fun readBitPure!0 (BitStream!7820) tuple2!16362)

(assert (=> b!189334 (= lt!294031 (readBitPure!0 (_1!8823 lt!294006)))))

(declare-fun reader!0 (BitStream!7820 BitStream!7820) tuple2!16356)

(assert (=> b!189334 (= lt!294024 (reader!0 (_2!8824 lt!294030) (_2!8824 lt!294026)))))

(assert (=> b!189334 (= lt!294006 (reader!0 thiss!1204 (_2!8824 lt!294026)))))

(assert (=> b!189334 e!130728))

(declare-fun res!157814 () Bool)

(assert (=> b!189334 (=> (not res!157814) (not e!130728))))

(assert (=> b!189334 (= res!157814 (= (bitIndex!0 (size!4356 (buf!4830 (_1!8826 lt!294019))) (currentByte!9102 (_1!8826 lt!294019)) (currentBit!9097 (_1!8826 lt!294019))) (bitIndex!0 (size!4356 (buf!4830 (_1!8826 lt!294010))) (currentByte!9102 (_1!8826 lt!294010)) (currentBit!9097 (_1!8826 lt!294010)))))))

(declare-fun lt!294012 () Unit!13511)

(declare-fun lt!294029 () BitStream!7820)

(declare-fun readBitPrefixLemma!0 (BitStream!7820 BitStream!7820) Unit!13511)

(assert (=> b!189334 (= lt!294012 (readBitPrefixLemma!0 lt!294029 (_2!8824 lt!294026)))))

(assert (=> b!189334 (= lt!294010 (readBitPure!0 (BitStream!7821 (buf!4830 (_2!8824 lt!294026)) (currentByte!9102 thiss!1204) (currentBit!9097 thiss!1204))))))

(assert (=> b!189334 (= lt!294019 (readBitPure!0 lt!294029))))

(assert (=> b!189334 e!130721))

(declare-fun res!157822 () Bool)

(assert (=> b!189334 (=> (not res!157822) (not e!130721))))

(assert (=> b!189334 (= res!157822 (invariant!0 (currentBit!9097 thiss!1204) (currentByte!9102 thiss!1204) (size!4356 (buf!4830 (_2!8824 lt!294030)))))))

(assert (=> b!189334 (= lt!294029 (BitStream!7821 (buf!4830 (_2!8824 lt!294030)) (currentByte!9102 thiss!1204) (currentBit!9097 thiss!1204)))))

(declare-fun b!189335 () Bool)

(declare-fun e!130732 () Bool)

(declare-fun array_inv!4097 (array!9882) Bool)

(assert (=> b!189335 (= e!130732 (array_inv!4097 (buf!4830 thiss!1204)))))

(declare-fun b!189336 () Bool)

(assert (=> b!189336 (= e!130729 e!130724)))

(declare-fun res!157813 () Bool)

(assert (=> b!189336 (=> res!157813 e!130724)))

(assert (=> b!189336 (= res!157813 (not (= (_1!8823 lt!294024) lt!294020)))))

(assert (=> b!189336 e!130733))

(declare-fun res!157823 () Bool)

(assert (=> b!189336 (=> (not res!157823) (not e!130733))))

(declare-fun lt!294011 () tuple2!16360)

(assert (=> b!189336 (= res!157823 (and (= (_2!8825 lt!294033) (_2!8825 lt!294011)) (= (_1!8825 lt!294033) (_1!8825 lt!294011))))))

(declare-fun lt!294034 () Unit!13511)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7820 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13511)

(assert (=> b!189336 (= lt!294034 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8823 lt!294006) nBits!348 i!590 lt!294018))))

(assert (=> b!189336 (= lt!294011 (readNBitsLSBFirstsLoopPure!0 lt!294020 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!294009))))

(assert (=> b!189336 (= lt!294020 (withMovedBitIndex!0 (_1!8823 lt!294006) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!189337 () Bool)

(declare-fun e!130726 () Bool)

(assert (=> b!189337 (= e!130726 e!130730)))

(declare-fun res!157819 () Bool)

(assert (=> b!189337 (=> (not res!157819) (not e!130730))))

(assert (=> b!189337 (= res!157819 (validate_offset_bits!1 ((_ sign_extend 32) (size!4356 (buf!4830 thiss!1204))) ((_ sign_extend 32) (currentByte!9102 thiss!1204)) ((_ sign_extend 32) (currentBit!9097 thiss!1204)) lt!294023))))

(assert (=> b!189337 (= lt!294023 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!189338 () Bool)

(assert (=> b!189338 (= e!130730 (not e!130722))))

(declare-fun res!157824 () Bool)

(assert (=> b!189338 (=> res!157824 e!130722)))

(assert (=> b!189338 (= res!157824 (not (= lt!294028 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!294027))))))

(assert (=> b!189338 (= lt!294028 (bitIndex!0 (size!4356 (buf!4830 (_2!8824 lt!294030))) (currentByte!9102 (_2!8824 lt!294030)) (currentBit!9097 (_2!8824 lt!294030))))))

(assert (=> b!189338 (= lt!294027 (bitIndex!0 (size!4356 (buf!4830 thiss!1204)) (currentByte!9102 thiss!1204) (currentBit!9097 thiss!1204)))))

(assert (=> b!189338 e!130723))

(declare-fun res!157831 () Bool)

(assert (=> b!189338 (=> (not res!157831) (not e!130723))))

(assert (=> b!189338 (= res!157831 (= (size!4356 (buf!4830 thiss!1204)) (size!4356 (buf!4830 (_2!8824 lt!294030)))))))

(declare-fun appendBit!0 (BitStream!7820 Bool) tuple2!16358)

(assert (=> b!189338 (= lt!294030 (appendBit!0 thiss!1204 lt!294021))))

(assert (=> b!189338 (= lt!294021 (not (= (bvand v!189 lt!294022) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!189338 (= lt!294022 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!189339 () Bool)

(declare-fun res!157812 () Bool)

(assert (=> b!189339 (=> (not res!157812) (not e!130733))))

(assert (=> b!189339 (= res!157812 (= (_1!8823 lt!294006) (withMovedBitIndex!0 (_2!8823 lt!294006) (bvsub lt!294027 lt!294025))))))

(declare-fun b!189326 () Bool)

(assert (=> b!189326 (= e!130731 e!130720)))

(declare-fun res!157826 () Bool)

(assert (=> b!189326 (=> (not res!157826) (not e!130720))))

(assert (=> b!189326 (= res!157826 (and (= (_2!8826 lt!294008) lt!294021) (= (_1!8826 lt!294008) (_2!8824 lt!294030))))))

(declare-fun readerFrom!0 (BitStream!7820 (_ BitVec 32) (_ BitVec 32)) BitStream!7820)

(assert (=> b!189326 (= lt!294008 (readBitPure!0 (readerFrom!0 (_2!8824 lt!294030) (currentBit!9097 thiss!1204) (currentByte!9102 thiss!1204))))))

(declare-fun res!157816 () Bool)

(assert (=> start!40992 (=> (not res!157816) (not e!130726))))

(assert (=> start!40992 (= res!157816 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!40992 e!130726))

(assert (=> start!40992 true))

(declare-fun inv!12 (BitStream!7820) Bool)

(assert (=> start!40992 (and (inv!12 thiss!1204) e!130732)))

(declare-fun b!189340 () Bool)

(declare-fun res!157828 () Bool)

(assert (=> b!189340 (=> (not res!157828) (not e!130730))))

(assert (=> b!189340 (= res!157828 (invariant!0 (currentBit!9097 thiss!1204) (currentByte!9102 thiss!1204) (size!4356 (buf!4830 thiss!1204))))))

(declare-fun b!189341 () Bool)

(declare-fun res!157827 () Bool)

(assert (=> b!189341 (=> res!157827 e!130727)))

(assert (=> b!189341 (= res!157827 (not (isPrefixOf!0 thiss!1204 (_2!8824 lt!294030))))))

(assert (= (and start!40992 res!157816) b!189337))

(assert (= (and b!189337 res!157819) b!189340))

(assert (= (and b!189340 res!157828) b!189324))

(assert (= (and b!189324 res!157817) b!189338))

(assert (= (and b!189338 res!157831) b!189332))

(assert (= (and b!189332 res!157818) b!189323))

(assert (= (and b!189323 res!157830) b!189326))

(assert (= (and b!189326 res!157826) b!189328))

(assert (= (and b!189338 (not res!157824)) b!189320))

(assert (= (and b!189320 (not res!157821)) b!189321))

(assert (= (and b!189321 (not res!157825)) b!189333))

(assert (= (and b!189333 (not res!157833)) b!189322))

(assert (= (and b!189322 (not res!157829)) b!189341))

(assert (= (and b!189341 (not res!157827)) b!189334))

(assert (= (and b!189334 res!157822) b!189329))

(assert (= (and b!189334 res!157814) b!189331))

(assert (= (and b!189334 (not res!157815)) b!189336))

(assert (= (and b!189336 res!157823) b!189339))

(assert (= (and b!189339 res!157812) b!189319))

(assert (= (and b!189319 res!157832) b!189327))

(assert (= (and b!189336 (not res!157813)) b!189325))

(assert (= (and b!189325 (not res!157820)) b!189330))

(assert (= start!40992 b!189335))

(declare-fun m!294307 () Bool)

(assert (=> b!189328 m!294307))

(declare-fun m!294309 () Bool)

(assert (=> b!189340 m!294309))

(declare-fun m!294311 () Bool)

(assert (=> b!189336 m!294311))

(declare-fun m!294313 () Bool)

(assert (=> b!189336 m!294313))

(declare-fun m!294315 () Bool)

(assert (=> b!189336 m!294315))

(declare-fun m!294317 () Bool)

(assert (=> b!189322 m!294317))

(declare-fun m!294319 () Bool)

(assert (=> b!189329 m!294319))

(declare-fun m!294321 () Bool)

(assert (=> start!40992 m!294321))

(declare-fun m!294323 () Bool)

(assert (=> b!189335 m!294323))

(declare-fun m!294325 () Bool)

(assert (=> b!189339 m!294325))

(declare-fun m!294327 () Bool)

(assert (=> b!189338 m!294327))

(declare-fun m!294329 () Bool)

(assert (=> b!189338 m!294329))

(declare-fun m!294331 () Bool)

(assert (=> b!189338 m!294331))

(declare-fun m!294333 () Bool)

(assert (=> b!189334 m!294333))

(declare-fun m!294335 () Bool)

(assert (=> b!189334 m!294335))

(declare-fun m!294337 () Bool)

(assert (=> b!189334 m!294337))

(declare-fun m!294339 () Bool)

(assert (=> b!189334 m!294339))

(declare-fun m!294341 () Bool)

(assert (=> b!189334 m!294341))

(declare-fun m!294343 () Bool)

(assert (=> b!189334 m!294343))

(declare-fun m!294345 () Bool)

(assert (=> b!189334 m!294345))

(declare-fun m!294347 () Bool)

(assert (=> b!189334 m!294347))

(declare-fun m!294349 () Bool)

(assert (=> b!189334 m!294349))

(declare-fun m!294351 () Bool)

(assert (=> b!189334 m!294351))

(declare-fun m!294353 () Bool)

(assert (=> b!189334 m!294353))

(declare-fun m!294355 () Bool)

(assert (=> b!189334 m!294355))

(declare-fun m!294357 () Bool)

(assert (=> b!189334 m!294357))

(declare-fun m!294359 () Bool)

(assert (=> b!189334 m!294359))

(declare-fun m!294361 () Bool)

(assert (=> b!189334 m!294361))

(declare-fun m!294363 () Bool)

(assert (=> b!189334 m!294363))

(declare-fun m!294365 () Bool)

(assert (=> b!189323 m!294365))

(declare-fun m!294367 () Bool)

(assert (=> b!189326 m!294367))

(assert (=> b!189326 m!294367))

(declare-fun m!294369 () Bool)

(assert (=> b!189326 m!294369))

(assert (=> b!189341 m!294365))

(assert (=> b!189332 m!294327))

(assert (=> b!189332 m!294329))

(declare-fun m!294371 () Bool)

(assert (=> b!189320 m!294371))

(declare-fun m!294373 () Bool)

(assert (=> b!189320 m!294373))

(declare-fun m!294375 () Bool)

(assert (=> b!189320 m!294375))

(declare-fun m!294377 () Bool)

(assert (=> b!189320 m!294377))

(declare-fun m!294379 () Bool)

(assert (=> b!189337 m!294379))

(declare-fun m!294381 () Bool)

(assert (=> b!189319 m!294381))

(declare-fun m!294383 () Bool)

(assert (=> b!189321 m!294383))

(declare-fun m!294385 () Bool)

(assert (=> b!189325 m!294385))

(declare-fun m!294387 () Bool)

(assert (=> b!189325 m!294387))

(push 1)

(assert (not b!189338))

(assert (not b!189329))

(assert (not b!189341))

(assert (not b!189337))

(assert (not b!189328))

(assert (not b!189319))

(assert (not b!189336))

(assert (not b!189321))

(assert (not b!189326))

(assert (not b!189325))

(assert (not b!189339))

(assert (not b!189320))

(assert (not b!189332))

(assert (not b!189323))

(assert (not b!189322))

(assert (not b!189335))

(assert (not start!40992))

(assert (not b!189340))

(assert (not b!189334))

(check-sat)

(pop 1)

(push 1)

(check-sat)

