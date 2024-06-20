; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20470 () Bool)

(assert start!20470)

(declare-fun b!103039 () Bool)

(declare-fun e!67426 () Bool)

(declare-datatypes ((array!4821 0))(
  ( (array!4822 (arr!2793 (Array (_ BitVec 32) (_ BitVec 8))) (size!2200 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3874 0))(
  ( (BitStream!3875 (buf!2563 array!4821) (currentByte!5042 (_ BitVec 32)) (currentBit!5037 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!8434 0))(
  ( (tuple2!8435 (_1!4472 BitStream!3874) (_2!4472 Bool)) )
))
(declare-fun lt!150306 () tuple2!8434)

(declare-fun lt!150312 () tuple2!8434)

(assert (=> b!103039 (= e!67426 (= (_2!4472 lt!150306) (_2!4472 lt!150312)))))

(declare-fun res!84761 () Bool)

(declare-fun e!67425 () Bool)

(assert (=> start!20470 (=> (not res!84761) (not e!67425))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!20470 (= res!84761 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20470 e!67425))

(assert (=> start!20470 true))

(declare-fun thiss!1305 () BitStream!3874)

(declare-fun e!67423 () Bool)

(declare-fun inv!12 (BitStream!3874) Bool)

(assert (=> start!20470 (and (inv!12 thiss!1305) e!67423)))

(declare-fun b!103040 () Bool)

(declare-fun e!67422 () Bool)

(declare-fun e!67424 () Bool)

(assert (=> b!103040 (= e!67422 e!67424)))

(declare-fun res!84756 () Bool)

(assert (=> b!103040 (=> (not res!84756) (not e!67424))))

(declare-fun lt!150307 () tuple2!8434)

(declare-fun lt!150319 () Bool)

(declare-datatypes ((Unit!6320 0))(
  ( (Unit!6321) )
))
(declare-datatypes ((tuple2!8436 0))(
  ( (tuple2!8437 (_1!4473 Unit!6320) (_2!4473 BitStream!3874)) )
))
(declare-fun lt!150309 () tuple2!8436)

(assert (=> b!103040 (= res!84756 (and (= (_2!4472 lt!150307) lt!150319) (= (_1!4472 lt!150307) (_2!4473 lt!150309))))))

(declare-fun readBitPure!0 (BitStream!3874) tuple2!8434)

(declare-fun readerFrom!0 (BitStream!3874 (_ BitVec 32) (_ BitVec 32)) BitStream!3874)

(assert (=> b!103040 (= lt!150307 (readBitPure!0 (readerFrom!0 (_2!4473 lt!150309) (currentBit!5037 thiss!1305) (currentByte!5042 thiss!1305))))))

(declare-fun b!103041 () Bool)

(declare-fun array_inv!2002 (array!4821) Bool)

(assert (=> b!103041 (= e!67423 (array_inv!2002 (buf!2563 thiss!1305)))))

(declare-fun b!103042 () Bool)

(declare-fun lt!150321 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!103042 (= e!67424 (= (bitIndex!0 (size!2200 (buf!2563 (_1!4472 lt!150307))) (currentByte!5042 (_1!4472 lt!150307)) (currentBit!5037 (_1!4472 lt!150307))) lt!150321))))

(declare-fun b!103043 () Bool)

(declare-fun res!84760 () Bool)

(declare-fun e!67420 () Bool)

(assert (=> b!103043 (=> (not res!84760) (not e!67420))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!103043 (= res!84760 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!103044 () Bool)

(declare-fun res!84759 () Bool)

(declare-fun e!67421 () Bool)

(assert (=> b!103044 (=> (not res!84759) (not e!67421))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!103044 (= res!84759 (invariant!0 (currentBit!5037 thiss!1305) (currentByte!5042 thiss!1305) (size!2200 (buf!2563 (_2!4473 lt!150309)))))))

(declare-fun b!103045 () Bool)

(declare-fun e!67428 () Bool)

(declare-fun e!67419 () Bool)

(assert (=> b!103045 (= e!67428 e!67419)))

(declare-fun res!84751 () Bool)

(assert (=> b!103045 (=> res!84751 e!67419)))

(declare-datatypes ((tuple2!8438 0))(
  ( (tuple2!8439 (_1!4474 BitStream!3874) (_2!4474 BitStream!3874)) )
))
(declare-fun lt!150304 () tuple2!8438)

(declare-fun lt!150308 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!103045 (= res!84751 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!2200 (buf!2563 (_1!4474 lt!150304)))) ((_ sign_extend 32) (currentByte!5042 (_1!4474 lt!150304))) ((_ sign_extend 32) (currentBit!5037 (_1!4474 lt!150304))) ((_ sign_extend 32) lt!150308))))))

(assert (=> b!103045 (= lt!150308 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun b!103046 () Bool)

(declare-fun res!84750 () Bool)

(assert (=> b!103046 (=> (not res!84750) (not e!67422))))

(declare-fun isPrefixOf!0 (BitStream!3874 BitStream!3874) Bool)

(assert (=> b!103046 (= res!84750 (isPrefixOf!0 thiss!1305 (_2!4473 lt!150309)))))

(declare-fun b!103047 () Bool)

(declare-fun lt!150315 () tuple2!8436)

(assert (=> b!103047 (= e!67421 (invariant!0 (currentBit!5037 thiss!1305) (currentByte!5042 thiss!1305) (size!2200 (buf!2563 (_2!4473 lt!150315)))))))

(declare-fun b!103048 () Bool)

(assert (=> b!103048 (= e!67425 e!67420)))

(declare-fun res!84758 () Bool)

(assert (=> b!103048 (=> (not res!84758) (not e!67420))))

(declare-fun lt!150313 () (_ BitVec 64))

(assert (=> b!103048 (= res!84758 (validate_offset_bits!1 ((_ sign_extend 32) (size!2200 (buf!2563 thiss!1305))) ((_ sign_extend 32) (currentByte!5042 thiss!1305)) ((_ sign_extend 32) (currentBit!5037 thiss!1305)) lt!150313))))

(assert (=> b!103048 (= lt!150313 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!103049 () Bool)

(declare-fun e!67418 () Bool)

(assert (=> b!103049 (= e!67418 e!67422)))

(declare-fun res!84752 () Bool)

(assert (=> b!103049 (=> (not res!84752) (not e!67422))))

(declare-fun lt!150325 () (_ BitVec 64))

(assert (=> b!103049 (= res!84752 (= lt!150321 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!150325)))))

(assert (=> b!103049 (= lt!150321 (bitIndex!0 (size!2200 (buf!2563 (_2!4473 lt!150309))) (currentByte!5042 (_2!4473 lt!150309)) (currentBit!5037 (_2!4473 lt!150309))))))

(assert (=> b!103049 (= lt!150325 (bitIndex!0 (size!2200 (buf!2563 thiss!1305)) (currentByte!5042 thiss!1305) (currentBit!5037 thiss!1305)))))

(declare-fun b!103050 () Bool)

(declare-fun res!84749 () Bool)

(assert (=> b!103050 (=> (not res!84749) (not e!67420))))

(assert (=> b!103050 (= res!84749 (bvslt i!615 nBits!396))))

(declare-fun b!103051 () Bool)

(assert (=> b!103051 (= e!67420 (not e!67428))))

(declare-fun res!84757 () Bool)

(assert (=> b!103051 (=> res!84757 e!67428)))

(assert (=> b!103051 (= res!84757 (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun lt!150323 () (_ BitVec 64))

(assert (=> b!103051 (validate_offset_bits!1 ((_ sign_extend 32) (size!2200 (buf!2563 (_2!4473 lt!150315)))) ((_ sign_extend 32) (currentByte!5042 (_2!4473 lt!150309))) ((_ sign_extend 32) (currentBit!5037 (_2!4473 lt!150309))) lt!150323)))

(declare-fun lt!150318 () Unit!6320)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3874 array!4821 (_ BitVec 64)) Unit!6320)

(assert (=> b!103051 (= lt!150318 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4473 lt!150309) (buf!2563 (_2!4473 lt!150315)) lt!150323))))

(assert (=> b!103051 (= lt!150323 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!150314 () tuple2!8438)

(declare-datatypes ((tuple2!8440 0))(
  ( (tuple2!8441 (_1!4475 BitStream!3874) (_2!4475 (_ BitVec 64))) )
))
(declare-fun lt!150322 () tuple2!8440)

(declare-fun lt!150311 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3874 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8440)

(assert (=> b!103051 (= lt!150322 (readNLeastSignificantBitsLoopPure!0 (_1!4474 lt!150314) nBits!396 i!615 lt!150311))))

(assert (=> b!103051 (validate_offset_bits!1 ((_ sign_extend 32) (size!2200 (buf!2563 (_2!4473 lt!150315)))) ((_ sign_extend 32) (currentByte!5042 thiss!1305)) ((_ sign_extend 32) (currentBit!5037 thiss!1305)) lt!150313)))

(declare-fun lt!150305 () Unit!6320)

(assert (=> b!103051 (= lt!150305 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2563 (_2!4473 lt!150315)) lt!150313))))

(assert (=> b!103051 (= lt!150311 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!150316 () tuple2!8434)

(assert (=> b!103051 (= (_2!4472 lt!150316) lt!150319)))

(assert (=> b!103051 (= lt!150316 (readBitPure!0 (_1!4474 lt!150314)))))

(declare-fun reader!0 (BitStream!3874 BitStream!3874) tuple2!8438)

(assert (=> b!103051 (= lt!150304 (reader!0 (_2!4473 lt!150309) (_2!4473 lt!150315)))))

(assert (=> b!103051 (= lt!150314 (reader!0 thiss!1305 (_2!4473 lt!150315)))))

(assert (=> b!103051 e!67426))

(declare-fun res!84754 () Bool)

(assert (=> b!103051 (=> (not res!84754) (not e!67426))))

(assert (=> b!103051 (= res!84754 (= (bitIndex!0 (size!2200 (buf!2563 (_1!4472 lt!150306))) (currentByte!5042 (_1!4472 lt!150306)) (currentBit!5037 (_1!4472 lt!150306))) (bitIndex!0 (size!2200 (buf!2563 (_1!4472 lt!150312))) (currentByte!5042 (_1!4472 lt!150312)) (currentBit!5037 (_1!4472 lt!150312)))))))

(declare-fun lt!150310 () Unit!6320)

(declare-fun lt!150317 () BitStream!3874)

(declare-fun readBitPrefixLemma!0 (BitStream!3874 BitStream!3874) Unit!6320)

(assert (=> b!103051 (= lt!150310 (readBitPrefixLemma!0 lt!150317 (_2!4473 lt!150315)))))

(assert (=> b!103051 (= lt!150312 (readBitPure!0 (BitStream!3875 (buf!2563 (_2!4473 lt!150315)) (currentByte!5042 thiss!1305) (currentBit!5037 thiss!1305))))))

(assert (=> b!103051 (= lt!150306 (readBitPure!0 lt!150317))))

(assert (=> b!103051 (= lt!150317 (BitStream!3875 (buf!2563 (_2!4473 lt!150309)) (currentByte!5042 thiss!1305) (currentBit!5037 thiss!1305)))))

(assert (=> b!103051 e!67421))

(declare-fun res!84753 () Bool)

(assert (=> b!103051 (=> (not res!84753) (not e!67421))))

(assert (=> b!103051 (= res!84753 (isPrefixOf!0 thiss!1305 (_2!4473 lt!150315)))))

(declare-fun lt!150324 () Unit!6320)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3874 BitStream!3874 BitStream!3874) Unit!6320)

(assert (=> b!103051 (= lt!150324 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4473 lt!150309) (_2!4473 lt!150315)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3874 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8436)

(assert (=> b!103051 (= lt!150315 (appendNLeastSignificantBitsLoop!0 (_2!4473 lt!150309) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!103051 e!67418))

(declare-fun res!84755 () Bool)

(assert (=> b!103051 (=> (not res!84755) (not e!67418))))

(assert (=> b!103051 (= res!84755 (= (size!2200 (buf!2563 thiss!1305)) (size!2200 (buf!2563 (_2!4473 lt!150309)))))))

(declare-fun appendBit!0 (BitStream!3874 Bool) tuple2!8436)

(assert (=> b!103051 (= lt!150309 (appendBit!0 thiss!1305 lt!150319))))

(declare-fun lt!150320 () (_ BitVec 64))

(assert (=> b!103051 (= lt!150319 (not (= (bvand v!199 lt!150320) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!103051 (= lt!150320 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!103052 () Bool)

(assert (=> b!103052 (= e!67419 (= (bvand (bvor lt!150311 (ite (_2!4472 lt!150316) lt!150320 #b0000000000000000000000000000000000000000000000000000000000000000)) (onesLSBLong!0 lt!150308)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!20470 res!84761) b!103048))

(assert (= (and b!103048 res!84758) b!103043))

(assert (= (and b!103043 res!84760) b!103050))

(assert (= (and b!103050 res!84749) b!103051))

(assert (= (and b!103051 res!84755) b!103049))

(assert (= (and b!103049 res!84752) b!103046))

(assert (= (and b!103046 res!84750) b!103040))

(assert (= (and b!103040 res!84756) b!103042))

(assert (= (and b!103051 res!84753) b!103044))

(assert (= (and b!103044 res!84759) b!103047))

(assert (= (and b!103051 res!84754) b!103039))

(assert (= (and b!103051 (not res!84757)) b!103045))

(assert (= (and b!103045 (not res!84751)) b!103052))

(assert (= start!20470 b!103041))

(declare-fun m!150277 () Bool)

(assert (=> b!103048 m!150277))

(declare-fun m!150279 () Bool)

(assert (=> b!103041 m!150279))

(declare-fun m!150281 () Bool)

(assert (=> b!103052 m!150281))

(declare-fun m!150283 () Bool)

(assert (=> b!103049 m!150283))

(declare-fun m!150285 () Bool)

(assert (=> b!103049 m!150285))

(declare-fun m!150287 () Bool)

(assert (=> start!20470 m!150287))

(declare-fun m!150289 () Bool)

(assert (=> b!103044 m!150289))

(declare-fun m!150291 () Bool)

(assert (=> b!103043 m!150291))

(declare-fun m!150293 () Bool)

(assert (=> b!103040 m!150293))

(assert (=> b!103040 m!150293))

(declare-fun m!150295 () Bool)

(assert (=> b!103040 m!150295))

(declare-fun m!150297 () Bool)

(assert (=> b!103045 m!150297))

(declare-fun m!150299 () Bool)

(assert (=> b!103051 m!150299))

(declare-fun m!150301 () Bool)

(assert (=> b!103051 m!150301))

(declare-fun m!150303 () Bool)

(assert (=> b!103051 m!150303))

(declare-fun m!150305 () Bool)

(assert (=> b!103051 m!150305))

(declare-fun m!150307 () Bool)

(assert (=> b!103051 m!150307))

(declare-fun m!150309 () Bool)

(assert (=> b!103051 m!150309))

(declare-fun m!150311 () Bool)

(assert (=> b!103051 m!150311))

(declare-fun m!150313 () Bool)

(assert (=> b!103051 m!150313))

(declare-fun m!150315 () Bool)

(assert (=> b!103051 m!150315))

(declare-fun m!150317 () Bool)

(assert (=> b!103051 m!150317))

(declare-fun m!150319 () Bool)

(assert (=> b!103051 m!150319))

(declare-fun m!150321 () Bool)

(assert (=> b!103051 m!150321))

(declare-fun m!150323 () Bool)

(assert (=> b!103051 m!150323))

(declare-fun m!150325 () Bool)

(assert (=> b!103051 m!150325))

(declare-fun m!150327 () Bool)

(assert (=> b!103051 m!150327))

(declare-fun m!150329 () Bool)

(assert (=> b!103051 m!150329))

(declare-fun m!150331 () Bool)

(assert (=> b!103051 m!150331))

(declare-fun m!150333 () Bool)

(assert (=> b!103051 m!150333))

(declare-fun m!150335 () Bool)

(assert (=> b!103042 m!150335))

(declare-fun m!150337 () Bool)

(assert (=> b!103046 m!150337))

(declare-fun m!150339 () Bool)

(assert (=> b!103047 m!150339))

(push 1)

(assert (not b!103051))

(assert (not b!103045))

(assert (not b!103048))

(assert (not b!103040))

(assert (not b!103049))

(assert (not b!103047))

(assert (not b!103046))

(assert (not start!20470))

(assert (not b!103042))

(assert (not b!103052))

(assert (not b!103041))

(assert (not b!103044))

(assert (not b!103043))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!32098 () Bool)

(assert (=> d!32098 (= (onesLSBLong!0 lt!150308) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 lt!150308))))))

(assert (=> b!103052 d!32098))

(declare-fun d!32100 () Bool)

(assert (=> d!32100 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5037 thiss!1305) (currentByte!5042 thiss!1305) (size!2200 (buf!2563 thiss!1305))))))

(declare-fun bs!7870 () Bool)

(assert (= bs!7870 d!32100))

(declare-fun m!150595 () Bool)

(assert (=> bs!7870 m!150595))

(assert (=> start!20470 d!32100))

(declare-fun d!32102 () Bool)

(declare-fun e!67530 () Bool)

(assert (=> d!32102 e!67530))

(declare-fun res!84897 () Bool)

(assert (=> d!32102 (=> (not res!84897) (not e!67530))))

(declare-fun lt!150620 () (_ BitVec 64))

(declare-fun lt!150621 () (_ BitVec 64))

(declare-fun lt!150622 () (_ BitVec 64))

(assert (=> d!32102 (= res!84897 (= lt!150620 (bvsub lt!150622 lt!150621)))))

(assert (=> d!32102 (or (= (bvand lt!150622 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!150621 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!150622 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!150622 lt!150621) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!32102 (= lt!150621 (remainingBits!0 ((_ sign_extend 32) (size!2200 (buf!2563 (_1!4472 lt!150307)))) ((_ sign_extend 32) (currentByte!5042 (_1!4472 lt!150307))) ((_ sign_extend 32) (currentBit!5037 (_1!4472 lt!150307)))))))

(declare-fun lt!150618 () (_ BitVec 64))

(declare-fun lt!150619 () (_ BitVec 64))

(assert (=> d!32102 (= lt!150622 (bvmul lt!150618 lt!150619))))

(assert (=> d!32102 (or (= lt!150618 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!150619 (bvsdiv (bvmul lt!150618 lt!150619) lt!150618)))))

(assert (=> d!32102 (= lt!150619 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32102 (= lt!150618 ((_ sign_extend 32) (size!2200 (buf!2563 (_1!4472 lt!150307)))))))

(assert (=> d!32102 (= lt!150620 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5042 (_1!4472 lt!150307))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5037 (_1!4472 lt!150307)))))))

(assert (=> d!32102 (invariant!0 (currentBit!5037 (_1!4472 lt!150307)) (currentByte!5042 (_1!4472 lt!150307)) (size!2200 (buf!2563 (_1!4472 lt!150307))))))

(assert (=> d!32102 (= (bitIndex!0 (size!2200 (buf!2563 (_1!4472 lt!150307))) (currentByte!5042 (_1!4472 lt!150307)) (currentBit!5037 (_1!4472 lt!150307))) lt!150620)))

(declare-fun b!103202 () Bool)

(declare-fun res!84898 () Bool)

(assert (=> b!103202 (=> (not res!84898) (not e!67530))))

(assert (=> b!103202 (= res!84898 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!150620))))

(declare-fun b!103203 () Bool)

(declare-fun lt!150617 () (_ BitVec 64))

(assert (=> b!103203 (= e!67530 (bvsle lt!150620 (bvmul lt!150617 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!103203 (or (= lt!150617 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!150617 #b0000000000000000000000000000000000000000000000000000000000001000) lt!150617)))))

(assert (=> b!103203 (= lt!150617 ((_ sign_extend 32) (size!2200 (buf!2563 (_1!4472 lt!150307)))))))

(assert (= (and d!32102 res!84897) b!103202))

(assert (= (and b!103202 res!84898) b!103203))

(declare-fun m!150597 () Bool)

(assert (=> d!32102 m!150597))

(declare-fun m!150599 () Bool)

(assert (=> d!32102 m!150599))

(assert (=> b!103042 d!32102))

(declare-fun d!32104 () Bool)

(assert (=> d!32104 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!103043 d!32104))

(declare-fun d!32106 () Bool)

(declare-datatypes ((tuple2!8462 0))(
  ( (tuple2!8463 (_1!4486 Bool) (_2!4486 BitStream!3874)) )
))
(declare-fun lt!150625 () tuple2!8462)

(declare-fun readBit!0 (BitStream!3874) tuple2!8462)

(assert (=> d!32106 (= lt!150625 (readBit!0 (readerFrom!0 (_2!4473 lt!150309) (currentBit!5037 thiss!1305) (currentByte!5042 thiss!1305))))))

(assert (=> d!32106 (= (readBitPure!0 (readerFrom!0 (_2!4473 lt!150309) (currentBit!5037 thiss!1305) (currentByte!5042 thiss!1305))) (tuple2!8435 (_2!4486 lt!150625) (_1!4486 lt!150625)))))

(declare-fun bs!7871 () Bool)

(assert (= bs!7871 d!32106))

(assert (=> bs!7871 m!150293))

(declare-fun m!150601 () Bool)

(assert (=> bs!7871 m!150601))

(assert (=> b!103040 d!32106))

(declare-fun d!32108 () Bool)

(declare-fun e!67533 () Bool)

(assert (=> d!32108 e!67533))

(declare-fun res!84902 () Bool)

(assert (=> d!32108 (=> (not res!84902) (not e!67533))))

(assert (=> d!32108 (= res!84902 (invariant!0 (currentBit!5037 (_2!4473 lt!150309)) (currentByte!5042 (_2!4473 lt!150309)) (size!2200 (buf!2563 (_2!4473 lt!150309)))))))

(assert (=> d!32108 (= (readerFrom!0 (_2!4473 lt!150309) (currentBit!5037 thiss!1305) (currentByte!5042 thiss!1305)) (BitStream!3875 (buf!2563 (_2!4473 lt!150309)) (currentByte!5042 thiss!1305) (currentBit!5037 thiss!1305)))))

(declare-fun b!103206 () Bool)

(assert (=> b!103206 (= e!67533 (invariant!0 (currentBit!5037 thiss!1305) (currentByte!5042 thiss!1305) (size!2200 (buf!2563 (_2!4473 lt!150309)))))))

(assert (= (and d!32108 res!84902) b!103206))

(declare-fun m!150603 () Bool)

(assert (=> d!32108 m!150603))

(assert (=> b!103206 m!150289))

(assert (=> b!103040 d!32108))

(declare-fun d!32110 () Bool)

(assert (=> d!32110 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!103051 d!32110))

(declare-fun d!32112 () Bool)

(declare-fun res!84911 () Bool)

(declare-fun e!67538 () Bool)

(assert (=> d!32112 (=> (not res!84911) (not e!67538))))

(assert (=> d!32112 (= res!84911 (= (size!2200 (buf!2563 thiss!1305)) (size!2200 (buf!2563 (_2!4473 lt!150315)))))))

(assert (=> d!32112 (= (isPrefixOf!0 thiss!1305 (_2!4473 lt!150315)) e!67538)))

(declare-fun b!103213 () Bool)

(declare-fun res!84909 () Bool)

(assert (=> b!103213 (=> (not res!84909) (not e!67538))))

(assert (=> b!103213 (= res!84909 (bvsle (bitIndex!0 (size!2200 (buf!2563 thiss!1305)) (currentByte!5042 thiss!1305) (currentBit!5037 thiss!1305)) (bitIndex!0 (size!2200 (buf!2563 (_2!4473 lt!150315))) (currentByte!5042 (_2!4473 lt!150315)) (currentBit!5037 (_2!4473 lt!150315)))))))

(declare-fun b!103214 () Bool)

(declare-fun e!67539 () Bool)

(assert (=> b!103214 (= e!67538 e!67539)))

(declare-fun res!84910 () Bool)

(assert (=> b!103214 (=> res!84910 e!67539)))

(assert (=> b!103214 (= res!84910 (= (size!2200 (buf!2563 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!103215 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4821 array!4821 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!103215 (= e!67539 (arrayBitRangesEq!0 (buf!2563 thiss!1305) (buf!2563 (_2!4473 lt!150315)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2200 (buf!2563 thiss!1305)) (currentByte!5042 thiss!1305) (currentBit!5037 thiss!1305))))))

(assert (= (and d!32112 res!84911) b!103213))

(assert (= (and b!103213 res!84909) b!103214))

(assert (= (and b!103214 (not res!84910)) b!103215))

(assert (=> b!103213 m!150285))

(declare-fun m!150605 () Bool)

(assert (=> b!103213 m!150605))

(assert (=> b!103215 m!150285))

(assert (=> b!103215 m!150285))

(declare-fun m!150607 () Bool)

(assert (=> b!103215 m!150607))

(assert (=> b!103051 d!32112))

(declare-fun b!103333 () Bool)

(declare-fun e!67602 () Bool)

(declare-fun lt!151008 () tuple2!8434)

(declare-fun lt!151026 () tuple2!8436)

(assert (=> b!103333 (= e!67602 (= (bitIndex!0 (size!2200 (buf!2563 (_1!4472 lt!151008))) (currentByte!5042 (_1!4472 lt!151008)) (currentBit!5037 (_1!4472 lt!151008))) (bitIndex!0 (size!2200 (buf!2563 (_2!4473 lt!151026))) (currentByte!5042 (_2!4473 lt!151026)) (currentBit!5037 (_2!4473 lt!151026)))))))

(declare-fun b!103334 () Bool)

(declare-fun res!85006 () Bool)

(assert (=> b!103334 (= res!85006 (= (bitIndex!0 (size!2200 (buf!2563 (_2!4473 lt!151026))) (currentByte!5042 (_2!4473 lt!151026)) (currentBit!5037 (_2!4473 lt!151026))) (bvadd (bitIndex!0 (size!2200 (buf!2563 (_2!4473 lt!150309))) (currentByte!5042 (_2!4473 lt!150309)) (currentBit!5037 (_2!4473 lt!150309))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!67606 () Bool)

(assert (=> b!103334 (=> (not res!85006) (not e!67606))))

(declare-fun b!103335 () Bool)

(declare-fun res!85005 () Bool)

(declare-fun e!67604 () Bool)

(assert (=> b!103335 (=> (not res!85005) (not e!67604))))

(declare-fun lt!151016 () tuple2!8436)

(assert (=> b!103335 (= res!85005 (isPrefixOf!0 (_2!4473 lt!150309) (_2!4473 lt!151016)))))

(declare-fun b!103336 () Bool)

(assert (=> b!103336 (= lt!151008 (readBitPure!0 (readerFrom!0 (_2!4473 lt!151026) (currentBit!5037 (_2!4473 lt!150309)) (currentByte!5042 (_2!4473 lt!150309)))))))

(declare-fun lt!151035 () Bool)

(declare-fun res!85007 () Bool)

(assert (=> b!103336 (= res!85007 (and (= (_2!4472 lt!151008) lt!151035) (= (_1!4472 lt!151008) (_2!4473 lt!151026))))))

(assert (=> b!103336 (=> (not res!85007) (not e!67602))))

(assert (=> b!103336 (= e!67606 e!67602)))

(declare-fun b!103338 () Bool)

(declare-fun e!67601 () tuple2!8436)

(declare-fun lt!151023 () Unit!6320)

(assert (=> b!103338 (= e!67601 (tuple2!8437 lt!151023 (_2!4473 lt!150309)))))

(declare-fun lt!151034 () BitStream!3874)

(assert (=> b!103338 (= lt!151034 (_2!4473 lt!150309))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!3874) Unit!6320)

(assert (=> b!103338 (= lt!151023 (lemmaIsPrefixRefl!0 lt!151034))))

(declare-fun call!1288 () Bool)

(assert (=> b!103338 call!1288))

(declare-fun b!103339 () Bool)

(declare-fun lt!151036 () tuple2!8436)

(declare-fun Unit!6334 () Unit!6320)

(assert (=> b!103339 (= e!67601 (tuple2!8437 Unit!6334 (_2!4473 lt!151036)))))

(assert (=> b!103339 (= lt!151035 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!103339 (= lt!151026 (appendBit!0 (_2!4473 lt!150309) lt!151035))))

(declare-fun res!85004 () Bool)

(assert (=> b!103339 (= res!85004 (= (size!2200 (buf!2563 (_2!4473 lt!150309))) (size!2200 (buf!2563 (_2!4473 lt!151026)))))))

(assert (=> b!103339 (=> (not res!85004) (not e!67606))))

(assert (=> b!103339 e!67606))

(declare-fun lt!151020 () tuple2!8436)

(assert (=> b!103339 (= lt!151020 lt!151026)))

(assert (=> b!103339 (= lt!151036 (appendNLeastSignificantBitsLoop!0 (_2!4473 lt!151020) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!151013 () Unit!6320)

(assert (=> b!103339 (= lt!151013 (lemmaIsPrefixTransitive!0 (_2!4473 lt!150309) (_2!4473 lt!151020) (_2!4473 lt!151036)))))

(assert (=> b!103339 (isPrefixOf!0 (_2!4473 lt!150309) (_2!4473 lt!151036))))

(declare-fun lt!151032 () Unit!6320)

(assert (=> b!103339 (= lt!151032 lt!151013)))

(assert (=> b!103339 (invariant!0 (currentBit!5037 (_2!4473 lt!150309)) (currentByte!5042 (_2!4473 lt!150309)) (size!2200 (buf!2563 (_2!4473 lt!151020))))))

(declare-fun lt!151021 () BitStream!3874)

(assert (=> b!103339 (= lt!151021 (BitStream!3875 (buf!2563 (_2!4473 lt!151020)) (currentByte!5042 (_2!4473 lt!150309)) (currentBit!5037 (_2!4473 lt!150309))))))

(assert (=> b!103339 (invariant!0 (currentBit!5037 lt!151021) (currentByte!5042 lt!151021) (size!2200 (buf!2563 (_2!4473 lt!151036))))))

(declare-fun lt!151012 () BitStream!3874)

(assert (=> b!103339 (= lt!151012 (BitStream!3875 (buf!2563 (_2!4473 lt!151036)) (currentByte!5042 lt!151021) (currentBit!5037 lt!151021)))))

(declare-fun lt!151003 () tuple2!8434)

(assert (=> b!103339 (= lt!151003 (readBitPure!0 lt!151021))))

(declare-fun lt!151047 () tuple2!8434)

(assert (=> b!103339 (= lt!151047 (readBitPure!0 lt!151012))))

(declare-fun lt!151043 () Unit!6320)

(assert (=> b!103339 (= lt!151043 (readBitPrefixLemma!0 lt!151021 (_2!4473 lt!151036)))))

(declare-fun res!85003 () Bool)

(assert (=> b!103339 (= res!85003 (= (bitIndex!0 (size!2200 (buf!2563 (_1!4472 lt!151003))) (currentByte!5042 (_1!4472 lt!151003)) (currentBit!5037 (_1!4472 lt!151003))) (bitIndex!0 (size!2200 (buf!2563 (_1!4472 lt!151047))) (currentByte!5042 (_1!4472 lt!151047)) (currentBit!5037 (_1!4472 lt!151047)))))))

(declare-fun e!67605 () Bool)

(assert (=> b!103339 (=> (not res!85003) (not e!67605))))

(assert (=> b!103339 e!67605))

(declare-fun lt!151025 () Unit!6320)

(assert (=> b!103339 (= lt!151025 lt!151043)))

(declare-fun lt!151019 () tuple2!8438)

(assert (=> b!103339 (= lt!151019 (reader!0 (_2!4473 lt!150309) (_2!4473 lt!151036)))))

(declare-fun lt!151005 () tuple2!8438)

(assert (=> b!103339 (= lt!151005 (reader!0 (_2!4473 lt!151020) (_2!4473 lt!151036)))))

(declare-fun lt!151007 () tuple2!8434)

(assert (=> b!103339 (= lt!151007 (readBitPure!0 (_1!4474 lt!151019)))))

(assert (=> b!103339 (= (_2!4472 lt!151007) lt!151035)))

(declare-fun lt!151015 () Unit!6320)

(declare-fun Unit!6335 () Unit!6320)

(assert (=> b!103339 (= lt!151015 Unit!6335)))

(declare-fun lt!151010 () (_ BitVec 64))

(assert (=> b!103339 (= lt!151010 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!151041 () (_ BitVec 64))

(assert (=> b!103339 (= lt!151041 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!151031 () Unit!6320)

(assert (=> b!103339 (= lt!151031 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4473 lt!150309) (buf!2563 (_2!4473 lt!151036)) lt!151041))))

(assert (=> b!103339 (validate_offset_bits!1 ((_ sign_extend 32) (size!2200 (buf!2563 (_2!4473 lt!151036)))) ((_ sign_extend 32) (currentByte!5042 (_2!4473 lt!150309))) ((_ sign_extend 32) (currentBit!5037 (_2!4473 lt!150309))) lt!151041)))

(declare-fun lt!151004 () Unit!6320)

(assert (=> b!103339 (= lt!151004 lt!151031)))

(declare-fun lt!151024 () tuple2!8440)

(assert (=> b!103339 (= lt!151024 (readNLeastSignificantBitsLoopPure!0 (_1!4474 lt!151019) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!151010))))

(declare-fun lt!151045 () (_ BitVec 64))

(assert (=> b!103339 (= lt!151045 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!151044 () Unit!6320)

(assert (=> b!103339 (= lt!151044 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4473 lt!151020) (buf!2563 (_2!4473 lt!151036)) lt!151045))))

(assert (=> b!103339 (validate_offset_bits!1 ((_ sign_extend 32) (size!2200 (buf!2563 (_2!4473 lt!151036)))) ((_ sign_extend 32) (currentByte!5042 (_2!4473 lt!151020))) ((_ sign_extend 32) (currentBit!5037 (_2!4473 lt!151020))) lt!151045)))

(declare-fun lt!151006 () Unit!6320)

(assert (=> b!103339 (= lt!151006 lt!151044)))

(declare-fun lt!151046 () tuple2!8440)

(assert (=> b!103339 (= lt!151046 (readNLeastSignificantBitsLoopPure!0 (_1!4474 lt!151005) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!151010 (ite (_2!4472 lt!151007) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!151030 () tuple2!8440)

(assert (=> b!103339 (= lt!151030 (readNLeastSignificantBitsLoopPure!0 (_1!4474 lt!151019) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!151010))))

(declare-fun c!6405 () Bool)

(assert (=> b!103339 (= c!6405 (_2!4472 (readBitPure!0 (_1!4474 lt!151019))))))

(declare-fun e!67603 () (_ BitVec 64))

(declare-fun lt!151039 () tuple2!8440)

(declare-fun withMovedBitIndex!0 (BitStream!3874 (_ BitVec 64)) BitStream!3874)

(assert (=> b!103339 (= lt!151039 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4474 lt!151019) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!151010 e!67603)))))

(declare-fun lt!151033 () Unit!6320)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3874 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6320)

(assert (=> b!103339 (= lt!151033 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4474 lt!151019) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!151010))))

(assert (=> b!103339 (and (= (_2!4475 lt!151030) (_2!4475 lt!151039)) (= (_1!4475 lt!151030) (_1!4475 lt!151039)))))

(declare-fun lt!151028 () Unit!6320)

(assert (=> b!103339 (= lt!151028 lt!151033)))

(assert (=> b!103339 (= (_1!4474 lt!151019) (withMovedBitIndex!0 (_2!4474 lt!151019) (bvsub (bitIndex!0 (size!2200 (buf!2563 (_2!4473 lt!150309))) (currentByte!5042 (_2!4473 lt!150309)) (currentBit!5037 (_2!4473 lt!150309))) (bitIndex!0 (size!2200 (buf!2563 (_2!4473 lt!151036))) (currentByte!5042 (_2!4473 lt!151036)) (currentBit!5037 (_2!4473 lt!151036))))))))

(declare-fun lt!151011 () Unit!6320)

(declare-fun Unit!6336 () Unit!6320)

(assert (=> b!103339 (= lt!151011 Unit!6336)))

(assert (=> b!103339 (= (_1!4474 lt!151005) (withMovedBitIndex!0 (_2!4474 lt!151005) (bvsub (bitIndex!0 (size!2200 (buf!2563 (_2!4473 lt!151020))) (currentByte!5042 (_2!4473 lt!151020)) (currentBit!5037 (_2!4473 lt!151020))) (bitIndex!0 (size!2200 (buf!2563 (_2!4473 lt!151036))) (currentByte!5042 (_2!4473 lt!151036)) (currentBit!5037 (_2!4473 lt!151036))))))))

(declare-fun lt!151029 () Unit!6320)

(declare-fun Unit!6337 () Unit!6320)

(assert (=> b!103339 (= lt!151029 Unit!6337)))

(assert (=> b!103339 (= (bitIndex!0 (size!2200 (buf!2563 (_2!4473 lt!150309))) (currentByte!5042 (_2!4473 lt!150309)) (currentBit!5037 (_2!4473 lt!150309))) (bvsub (bitIndex!0 (size!2200 (buf!2563 (_2!4473 lt!151020))) (currentByte!5042 (_2!4473 lt!151020)) (currentBit!5037 (_2!4473 lt!151020))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!151014 () Unit!6320)

(declare-fun Unit!6338 () Unit!6320)

(assert (=> b!103339 (= lt!151014 Unit!6338)))

(assert (=> b!103339 (= (_2!4475 lt!151024) (_2!4475 lt!151046))))

(declare-fun lt!151009 () Unit!6320)

(declare-fun Unit!6339 () Unit!6320)

(assert (=> b!103339 (= lt!151009 Unit!6339)))

(assert (=> b!103339 (= (_1!4475 lt!151024) (_2!4474 lt!151019))))

(declare-fun b!103340 () Bool)

(declare-fun e!67600 () Bool)

(declare-fun lt!151038 () (_ BitVec 64))

(assert (=> b!103340 (= e!67600 (validate_offset_bits!1 ((_ sign_extend 32) (size!2200 (buf!2563 (_2!4473 lt!150309)))) ((_ sign_extend 32) (currentByte!5042 (_2!4473 lt!150309))) ((_ sign_extend 32) (currentBit!5037 (_2!4473 lt!150309))) lt!151038))))

(declare-fun lt!151040 () tuple2!8440)

(declare-fun lt!151042 () tuple2!8438)

(declare-fun b!103341 () Bool)

(assert (=> b!103341 (= e!67604 (and (= (_2!4475 lt!151040) v!199) (= (_1!4475 lt!151040) (_2!4474 lt!151042))))))

(declare-fun lt!151027 () (_ BitVec 64))

(assert (=> b!103341 (= lt!151040 (readNLeastSignificantBitsLoopPure!0 (_1!4474 lt!151042) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!151027))))

(declare-fun lt!151018 () Unit!6320)

(declare-fun lt!151022 () Unit!6320)

(assert (=> b!103341 (= lt!151018 lt!151022)))

(assert (=> b!103341 (validate_offset_bits!1 ((_ sign_extend 32) (size!2200 (buf!2563 (_2!4473 lt!151016)))) ((_ sign_extend 32) (currentByte!5042 (_2!4473 lt!150309))) ((_ sign_extend 32) (currentBit!5037 (_2!4473 lt!150309))) lt!151038)))

(assert (=> b!103341 (= lt!151022 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4473 lt!150309) (buf!2563 (_2!4473 lt!151016)) lt!151038))))

(assert (=> b!103341 e!67600))

(declare-fun res!85009 () Bool)

(assert (=> b!103341 (=> (not res!85009) (not e!67600))))

(assert (=> b!103341 (= res!85009 (and (= (size!2200 (buf!2563 (_2!4473 lt!150309))) (size!2200 (buf!2563 (_2!4473 lt!151016)))) (bvsge lt!151038 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!103341 (= lt!151038 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!103341 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!103341 (= lt!151027 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!103341 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!103341 (= lt!151042 (reader!0 (_2!4473 lt!150309) (_2!4473 lt!151016)))))

(declare-fun b!103342 () Bool)

(assert (=> b!103342 (= e!67603 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun bm!1285 () Bool)

(declare-fun c!6406 () Bool)

(assert (=> bm!1285 (= call!1288 (isPrefixOf!0 (ite c!6406 (_2!4473 lt!150309) lt!151034) (ite c!6406 (_2!4473 lt!151026) lt!151034)))))

(declare-fun b!103343 () Bool)

(assert (=> b!103343 (= e!67605 (= (_2!4472 lt!151003) (_2!4472 lt!151047)))))

(declare-fun b!103344 () Bool)

(assert (=> b!103344 (= e!67603 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!103345 () Bool)

(declare-fun res!85002 () Bool)

(assert (=> b!103345 (=> (not res!85002) (not e!67604))))

(declare-fun lt!151037 () (_ BitVec 64))

(declare-fun lt!151017 () (_ BitVec 64))

(assert (=> b!103345 (= res!85002 (= (bitIndex!0 (size!2200 (buf!2563 (_2!4473 lt!151016))) (currentByte!5042 (_2!4473 lt!151016)) (currentBit!5037 (_2!4473 lt!151016))) (bvadd lt!151017 lt!151037)))))

(assert (=> b!103345 (or (not (= (bvand lt!151017 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!151037 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!151017 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!151017 lt!151037) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!103345 (= lt!151037 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!103345 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!103345 (= lt!151017 (bitIndex!0 (size!2200 (buf!2563 (_2!4473 lt!150309))) (currentByte!5042 (_2!4473 lt!150309)) (currentBit!5037 (_2!4473 lt!150309))))))

(declare-fun b!103337 () Bool)

(declare-fun res!85008 () Bool)

(assert (=> b!103337 (= res!85008 call!1288)))

(assert (=> b!103337 (=> (not res!85008) (not e!67606))))

(declare-fun d!32114 () Bool)

(assert (=> d!32114 e!67604))

(declare-fun res!85001 () Bool)

(assert (=> d!32114 (=> (not res!85001) (not e!67604))))

(assert (=> d!32114 (= res!85001 (= (size!2200 (buf!2563 (_2!4473 lt!150309))) (size!2200 (buf!2563 (_2!4473 lt!151016)))))))

(assert (=> d!32114 (= lt!151016 e!67601)))

(assert (=> d!32114 (= c!6406 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!32114 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!32114 (= (appendNLeastSignificantBitsLoop!0 (_2!4473 lt!150309) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!151016)))

(assert (= (and d!32114 c!6406) b!103339))

(assert (= (and d!32114 (not c!6406)) b!103338))

(assert (= (and b!103339 res!85004) b!103334))

(assert (= (and b!103334 res!85006) b!103337))

(assert (= (and b!103337 res!85008) b!103336))

(assert (= (and b!103336 res!85007) b!103333))

(assert (= (and b!103339 res!85003) b!103343))

(assert (= (and b!103339 c!6405) b!103342))

(assert (= (and b!103339 (not c!6405)) b!103344))

(assert (= (or b!103337 b!103338) bm!1285))

(assert (= (and d!32114 res!85001) b!103345))

(assert (= (and b!103345 res!85002) b!103335))

(assert (= (and b!103335 res!85005) b!103341))

(assert (= (and b!103341 res!85009) b!103340))

(declare-fun m!150799 () Bool)

(assert (=> b!103333 m!150799))

(declare-fun m!150801 () Bool)

(assert (=> b!103333 m!150801))

(declare-fun m!150803 () Bool)

(assert (=> bm!1285 m!150803))

(declare-fun m!150805 () Bool)

(assert (=> b!103339 m!150805))

(declare-fun m!150807 () Bool)

(assert (=> b!103339 m!150807))

(assert (=> b!103339 m!150283))

(declare-fun m!150809 () Bool)

(assert (=> b!103339 m!150809))

(declare-fun m!150811 () Bool)

(assert (=> b!103339 m!150811))

(declare-fun m!150813 () Bool)

(assert (=> b!103339 m!150813))

(declare-fun m!150815 () Bool)

(assert (=> b!103339 m!150815))

(declare-fun m!150817 () Bool)

(assert (=> b!103339 m!150817))

(declare-fun m!150819 () Bool)

(assert (=> b!103339 m!150819))

(declare-fun m!150821 () Bool)

(assert (=> b!103339 m!150821))

(declare-fun m!150823 () Bool)

(assert (=> b!103339 m!150823))

(declare-fun m!150825 () Bool)

(assert (=> b!103339 m!150825))

(declare-fun m!150827 () Bool)

(assert (=> b!103339 m!150827))

(declare-fun m!150829 () Bool)

(assert (=> b!103339 m!150829))

(declare-fun m!150831 () Bool)

(assert (=> b!103339 m!150831))

(declare-fun m!150833 () Bool)

(assert (=> b!103339 m!150833))

(declare-fun m!150835 () Bool)

(assert (=> b!103339 m!150835))

(declare-fun m!150837 () Bool)

(assert (=> b!103339 m!150837))

(declare-fun m!150839 () Bool)

(assert (=> b!103339 m!150839))

(declare-fun m!150841 () Bool)

(assert (=> b!103339 m!150841))

(assert (=> b!103339 m!150823))

(declare-fun m!150843 () Bool)

(assert (=> b!103339 m!150843))

(declare-fun m!150845 () Bool)

(assert (=> b!103339 m!150845))

(declare-fun m!150847 () Bool)

(assert (=> b!103339 m!150847))

(declare-fun m!150849 () Bool)

(assert (=> b!103339 m!150849))

(declare-fun m!150851 () Bool)

(assert (=> b!103339 m!150851))

(declare-fun m!150853 () Bool)

(assert (=> b!103339 m!150853))

(declare-fun m!150855 () Bool)

(assert (=> b!103339 m!150855))

(declare-fun m!150857 () Bool)

(assert (=> b!103339 m!150857))

(declare-fun m!150859 () Bool)

(assert (=> b!103339 m!150859))

(declare-fun m!150861 () Bool)

(assert (=> b!103340 m!150861))

(declare-fun m!150863 () Bool)

(assert (=> b!103341 m!150863))

(declare-fun m!150865 () Bool)

(assert (=> b!103341 m!150865))

(declare-fun m!150867 () Bool)

(assert (=> b!103341 m!150867))

(declare-fun m!150869 () Bool)

(assert (=> b!103341 m!150869))

(assert (=> b!103341 m!150839))

(assert (=> b!103334 m!150801))

(assert (=> b!103334 m!150283))

(declare-fun m!150871 () Bool)

(assert (=> b!103335 m!150871))

(declare-fun m!150873 () Bool)

(assert (=> b!103338 m!150873))

(declare-fun m!150875 () Bool)

(assert (=> b!103336 m!150875))

(assert (=> b!103336 m!150875))

(declare-fun m!150877 () Bool)

(assert (=> b!103336 m!150877))

(declare-fun m!150879 () Bool)

(assert (=> b!103345 m!150879))

(assert (=> b!103345 m!150283))

(assert (=> b!103051 d!32114))

(declare-fun d!32168 () Bool)

(assert (=> d!32168 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2200 (buf!2563 (_2!4473 lt!150315)))) ((_ sign_extend 32) (currentByte!5042 (_2!4473 lt!150309))) ((_ sign_extend 32) (currentBit!5037 (_2!4473 lt!150309))) lt!150323) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2200 (buf!2563 (_2!4473 lt!150315)))) ((_ sign_extend 32) (currentByte!5042 (_2!4473 lt!150309))) ((_ sign_extend 32) (currentBit!5037 (_2!4473 lt!150309)))) lt!150323))))

(declare-fun bs!7882 () Bool)

(assert (= bs!7882 d!32168))

(declare-fun m!150881 () Bool)

(assert (=> bs!7882 m!150881))

(assert (=> b!103051 d!32168))

(declare-fun d!32170 () Bool)

(assert (=> d!32170 (validate_offset_bits!1 ((_ sign_extend 32) (size!2200 (buf!2563 (_2!4473 lt!150315)))) ((_ sign_extend 32) (currentByte!5042 thiss!1305)) ((_ sign_extend 32) (currentBit!5037 thiss!1305)) lt!150313)))

(declare-fun lt!151050 () Unit!6320)

(declare-fun choose!9 (BitStream!3874 array!4821 (_ BitVec 64) BitStream!3874) Unit!6320)

(assert (=> d!32170 (= lt!151050 (choose!9 thiss!1305 (buf!2563 (_2!4473 lt!150315)) lt!150313 (BitStream!3875 (buf!2563 (_2!4473 lt!150315)) (currentByte!5042 thiss!1305) (currentBit!5037 thiss!1305))))))

(assert (=> d!32170 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2563 (_2!4473 lt!150315)) lt!150313) lt!151050)))

(declare-fun bs!7883 () Bool)

(assert (= bs!7883 d!32170))

(assert (=> bs!7883 m!150315))

(declare-fun m!150883 () Bool)

(assert (=> bs!7883 m!150883))

(assert (=> b!103051 d!32170))

(declare-fun d!32172 () Bool)

(declare-fun e!67611 () Bool)

(assert (=> d!32172 e!67611))

(declare-fun res!85019 () Bool)

(assert (=> d!32172 (=> (not res!85019) (not e!67611))))

(declare-fun lt!151062 () tuple2!8436)

(assert (=> d!32172 (= res!85019 (= (size!2200 (buf!2563 thiss!1305)) (size!2200 (buf!2563 (_2!4473 lt!151062)))))))

(declare-fun choose!16 (BitStream!3874 Bool) tuple2!8436)

(assert (=> d!32172 (= lt!151062 (choose!16 thiss!1305 lt!150319))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!32172 (validate_offset_bit!0 ((_ sign_extend 32) (size!2200 (buf!2563 thiss!1305))) ((_ sign_extend 32) (currentByte!5042 thiss!1305)) ((_ sign_extend 32) (currentBit!5037 thiss!1305)))))

(assert (=> d!32172 (= (appendBit!0 thiss!1305 lt!150319) lt!151062)))

(declare-fun b!103356 () Bool)

(declare-fun res!85018 () Bool)

(assert (=> b!103356 (=> (not res!85018) (not e!67611))))

(assert (=> b!103356 (= res!85018 (isPrefixOf!0 thiss!1305 (_2!4473 lt!151062)))))

(declare-fun b!103355 () Bool)

(declare-fun res!85020 () Bool)

(assert (=> b!103355 (=> (not res!85020) (not e!67611))))

(declare-fun lt!151060 () (_ BitVec 64))

(declare-fun lt!151061 () (_ BitVec 64))

(assert (=> b!103355 (= res!85020 (= (bitIndex!0 (size!2200 (buf!2563 (_2!4473 lt!151062))) (currentByte!5042 (_2!4473 lt!151062)) (currentBit!5037 (_2!4473 lt!151062))) (bvadd lt!151061 lt!151060)))))

(assert (=> b!103355 (or (not (= (bvand lt!151061 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!151060 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!151061 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!151061 lt!151060) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!103355 (= lt!151060 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!103355 (= lt!151061 (bitIndex!0 (size!2200 (buf!2563 thiss!1305)) (currentByte!5042 thiss!1305) (currentBit!5037 thiss!1305)))))

(declare-fun b!103358 () Bool)

(declare-fun e!67612 () Bool)

(declare-fun lt!151059 () tuple2!8434)

(assert (=> b!103358 (= e!67612 (= (bitIndex!0 (size!2200 (buf!2563 (_1!4472 lt!151059))) (currentByte!5042 (_1!4472 lt!151059)) (currentBit!5037 (_1!4472 lt!151059))) (bitIndex!0 (size!2200 (buf!2563 (_2!4473 lt!151062))) (currentByte!5042 (_2!4473 lt!151062)) (currentBit!5037 (_2!4473 lt!151062)))))))

(declare-fun b!103357 () Bool)

(assert (=> b!103357 (= e!67611 e!67612)))

(declare-fun res!85021 () Bool)

(assert (=> b!103357 (=> (not res!85021) (not e!67612))))

(assert (=> b!103357 (= res!85021 (and (= (_2!4472 lt!151059) lt!150319) (= (_1!4472 lt!151059) (_2!4473 lt!151062))))))

(assert (=> b!103357 (= lt!151059 (readBitPure!0 (readerFrom!0 (_2!4473 lt!151062) (currentBit!5037 thiss!1305) (currentByte!5042 thiss!1305))))))

(assert (= (and d!32172 res!85019) b!103355))

(assert (= (and b!103355 res!85020) b!103356))

(assert (= (and b!103356 res!85018) b!103357))

(assert (= (and b!103357 res!85021) b!103358))

(declare-fun m!150885 () Bool)

(assert (=> b!103358 m!150885))

(declare-fun m!150887 () Bool)

(assert (=> b!103358 m!150887))

(declare-fun m!150889 () Bool)

(assert (=> d!32172 m!150889))

(declare-fun m!150891 () Bool)

(assert (=> d!32172 m!150891))

(assert (=> b!103355 m!150887))

(assert (=> b!103355 m!150285))

(declare-fun m!150893 () Bool)

(assert (=> b!103357 m!150893))

(assert (=> b!103357 m!150893))

(declare-fun m!150895 () Bool)

(assert (=> b!103357 m!150895))

(declare-fun m!150897 () Bool)

(assert (=> b!103356 m!150897))

(assert (=> b!103051 d!32172))

(declare-fun d!32174 () Bool)

(declare-datatypes ((tuple2!8464 0))(
  ( (tuple2!8465 (_1!4487 (_ BitVec 64)) (_2!4487 BitStream!3874)) )
))
(declare-fun lt!151065 () tuple2!8464)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!3874 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8464)

(assert (=> d!32174 (= lt!151065 (readNLeastSignificantBitsLoop!0 (_1!4474 lt!150314) nBits!396 i!615 lt!150311))))

(assert (=> d!32174 (= (readNLeastSignificantBitsLoopPure!0 (_1!4474 lt!150314) nBits!396 i!615 lt!150311) (tuple2!8441 (_2!4487 lt!151065) (_1!4487 lt!151065)))))

(declare-fun bs!7884 () Bool)

(assert (= bs!7884 d!32174))

(declare-fun m!150899 () Bool)

(assert (=> bs!7884 m!150899))

(assert (=> b!103051 d!32174))

(declare-fun d!32176 () Bool)

(declare-fun lt!151066 () tuple2!8462)

(assert (=> d!32176 (= lt!151066 (readBit!0 lt!150317))))

(assert (=> d!32176 (= (readBitPure!0 lt!150317) (tuple2!8435 (_2!4486 lt!151066) (_1!4486 lt!151066)))))

(declare-fun bs!7885 () Bool)

(assert (= bs!7885 d!32176))

(declare-fun m!150901 () Bool)

(assert (=> bs!7885 m!150901))

(assert (=> b!103051 d!32176))

(declare-fun d!32178 () Bool)

(assert (=> d!32178 (isPrefixOf!0 thiss!1305 (_2!4473 lt!150315))))

(declare-fun lt!151069 () Unit!6320)

(declare-fun choose!30 (BitStream!3874 BitStream!3874 BitStream!3874) Unit!6320)

(assert (=> d!32178 (= lt!151069 (choose!30 thiss!1305 (_2!4473 lt!150309) (_2!4473 lt!150315)))))

(assert (=> d!32178 (isPrefixOf!0 thiss!1305 (_2!4473 lt!150309))))

(assert (=> d!32178 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4473 lt!150309) (_2!4473 lt!150315)) lt!151069)))

(declare-fun bs!7886 () Bool)

(assert (= bs!7886 d!32178))

(assert (=> bs!7886 m!150299))

(declare-fun m!150903 () Bool)

(assert (=> bs!7886 m!150903))

(assert (=> bs!7886 m!150337))

(assert (=> b!103051 d!32178))

(declare-fun b!103369 () Bool)

(declare-fun e!67617 () Unit!6320)

(declare-fun Unit!6340 () Unit!6320)

(assert (=> b!103369 (= e!67617 Unit!6340)))

(declare-fun b!103370 () Bool)

(declare-fun res!85028 () Bool)

(declare-fun e!67618 () Bool)

(assert (=> b!103370 (=> (not res!85028) (not e!67618))))

(declare-fun lt!151119 () tuple2!8438)

(assert (=> b!103370 (= res!85028 (isPrefixOf!0 (_2!4474 lt!151119) (_2!4473 lt!150315)))))

(declare-fun b!103371 () Bool)

(declare-fun lt!151113 () Unit!6320)

(assert (=> b!103371 (= e!67617 lt!151113)))

(declare-fun lt!151128 () (_ BitVec 64))

(assert (=> b!103371 (= lt!151128 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!151118 () (_ BitVec 64))

(assert (=> b!103371 (= lt!151118 (bitIndex!0 (size!2200 (buf!2563 (_2!4473 lt!150309))) (currentByte!5042 (_2!4473 lt!150309)) (currentBit!5037 (_2!4473 lt!150309))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!4821 array!4821 (_ BitVec 64) (_ BitVec 64)) Unit!6320)

(assert (=> b!103371 (= lt!151113 (arrayBitRangesEqSymmetric!0 (buf!2563 (_2!4473 lt!150309)) (buf!2563 (_2!4473 lt!150315)) lt!151128 lt!151118))))

(assert (=> b!103371 (arrayBitRangesEq!0 (buf!2563 (_2!4473 lt!150315)) (buf!2563 (_2!4473 lt!150309)) lt!151128 lt!151118)))

(declare-fun d!32180 () Bool)

(assert (=> d!32180 e!67618))

(declare-fun res!85030 () Bool)

(assert (=> d!32180 (=> (not res!85030) (not e!67618))))

(assert (=> d!32180 (= res!85030 (isPrefixOf!0 (_1!4474 lt!151119) (_2!4474 lt!151119)))))

(declare-fun lt!151115 () BitStream!3874)

(assert (=> d!32180 (= lt!151119 (tuple2!8439 lt!151115 (_2!4473 lt!150315)))))

(declare-fun lt!151129 () Unit!6320)

(declare-fun lt!151123 () Unit!6320)

(assert (=> d!32180 (= lt!151129 lt!151123)))

(assert (=> d!32180 (isPrefixOf!0 lt!151115 (_2!4473 lt!150315))))

(assert (=> d!32180 (= lt!151123 (lemmaIsPrefixTransitive!0 lt!151115 (_2!4473 lt!150315) (_2!4473 lt!150315)))))

(declare-fun lt!151116 () Unit!6320)

(declare-fun lt!151124 () Unit!6320)

(assert (=> d!32180 (= lt!151116 lt!151124)))

(assert (=> d!32180 (isPrefixOf!0 lt!151115 (_2!4473 lt!150315))))

(assert (=> d!32180 (= lt!151124 (lemmaIsPrefixTransitive!0 lt!151115 (_2!4473 lt!150309) (_2!4473 lt!150315)))))

(declare-fun lt!151120 () Unit!6320)

(assert (=> d!32180 (= lt!151120 e!67617)))

(declare-fun c!6409 () Bool)

(assert (=> d!32180 (= c!6409 (not (= (size!2200 (buf!2563 (_2!4473 lt!150309))) #b00000000000000000000000000000000)))))

(declare-fun lt!151126 () Unit!6320)

(declare-fun lt!151122 () Unit!6320)

(assert (=> d!32180 (= lt!151126 lt!151122)))

(assert (=> d!32180 (isPrefixOf!0 (_2!4473 lt!150315) (_2!4473 lt!150315))))

(assert (=> d!32180 (= lt!151122 (lemmaIsPrefixRefl!0 (_2!4473 lt!150315)))))

(declare-fun lt!151112 () Unit!6320)

(declare-fun lt!151127 () Unit!6320)

(assert (=> d!32180 (= lt!151112 lt!151127)))

(assert (=> d!32180 (= lt!151127 (lemmaIsPrefixRefl!0 (_2!4473 lt!150315)))))

(declare-fun lt!151125 () Unit!6320)

(declare-fun lt!151114 () Unit!6320)

(assert (=> d!32180 (= lt!151125 lt!151114)))

(assert (=> d!32180 (isPrefixOf!0 lt!151115 lt!151115)))

(assert (=> d!32180 (= lt!151114 (lemmaIsPrefixRefl!0 lt!151115))))

(declare-fun lt!151111 () Unit!6320)

(declare-fun lt!151117 () Unit!6320)

(assert (=> d!32180 (= lt!151111 lt!151117)))

(assert (=> d!32180 (isPrefixOf!0 (_2!4473 lt!150309) (_2!4473 lt!150309))))

(assert (=> d!32180 (= lt!151117 (lemmaIsPrefixRefl!0 (_2!4473 lt!150309)))))

(assert (=> d!32180 (= lt!151115 (BitStream!3875 (buf!2563 (_2!4473 lt!150315)) (currentByte!5042 (_2!4473 lt!150309)) (currentBit!5037 (_2!4473 lt!150309))))))

(assert (=> d!32180 (isPrefixOf!0 (_2!4473 lt!150309) (_2!4473 lt!150315))))

(assert (=> d!32180 (= (reader!0 (_2!4473 lt!150309) (_2!4473 lt!150315)) lt!151119)))

(declare-fun b!103372 () Bool)

(declare-fun res!85029 () Bool)

(assert (=> b!103372 (=> (not res!85029) (not e!67618))))

(assert (=> b!103372 (= res!85029 (isPrefixOf!0 (_1!4474 lt!151119) (_2!4473 lt!150309)))))

(declare-fun b!103373 () Bool)

(declare-fun lt!151110 () (_ BitVec 64))

(declare-fun lt!151121 () (_ BitVec 64))

(assert (=> b!103373 (= e!67618 (= (_1!4474 lt!151119) (withMovedBitIndex!0 (_2!4474 lt!151119) (bvsub lt!151121 lt!151110))))))

(assert (=> b!103373 (or (= (bvand lt!151121 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!151110 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!151121 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!151121 lt!151110) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!103373 (= lt!151110 (bitIndex!0 (size!2200 (buf!2563 (_2!4473 lt!150315))) (currentByte!5042 (_2!4473 lt!150315)) (currentBit!5037 (_2!4473 lt!150315))))))

(assert (=> b!103373 (= lt!151121 (bitIndex!0 (size!2200 (buf!2563 (_2!4473 lt!150309))) (currentByte!5042 (_2!4473 lt!150309)) (currentBit!5037 (_2!4473 lt!150309))))))

(assert (= (and d!32180 c!6409) b!103371))

(assert (= (and d!32180 (not c!6409)) b!103369))

(assert (= (and d!32180 res!85030) b!103372))

(assert (= (and b!103372 res!85029) b!103370))

(assert (= (and b!103370 res!85028) b!103373))

(declare-fun m!150905 () Bool)

(assert (=> b!103373 m!150905))

(assert (=> b!103373 m!150605))

(assert (=> b!103373 m!150283))

(assert (=> b!103371 m!150283))

(declare-fun m!150907 () Bool)

(assert (=> b!103371 m!150907))

(declare-fun m!150909 () Bool)

(assert (=> b!103371 m!150909))

(declare-fun m!150911 () Bool)

(assert (=> d!32180 m!150911))

(declare-fun m!150913 () Bool)

(assert (=> d!32180 m!150913))

(declare-fun m!150915 () Bool)

(assert (=> d!32180 m!150915))

(declare-fun m!150917 () Bool)

(assert (=> d!32180 m!150917))

(declare-fun m!150919 () Bool)

(assert (=> d!32180 m!150919))

(declare-fun m!150921 () Bool)

(assert (=> d!32180 m!150921))

(declare-fun m!150923 () Bool)

(assert (=> d!32180 m!150923))

(declare-fun m!150925 () Bool)

(assert (=> d!32180 m!150925))

(declare-fun m!150927 () Bool)

(assert (=> d!32180 m!150927))

(declare-fun m!150929 () Bool)

(assert (=> d!32180 m!150929))

(declare-fun m!150931 () Bool)

(assert (=> d!32180 m!150931))

(declare-fun m!150933 () Bool)

(assert (=> b!103370 m!150933))

(declare-fun m!150935 () Bool)

(assert (=> b!103372 m!150935))

(assert (=> b!103051 d!32180))

(declare-fun b!103374 () Bool)

(declare-fun e!67619 () Unit!6320)

(declare-fun Unit!6341 () Unit!6320)

(assert (=> b!103374 (= e!67619 Unit!6341)))

(declare-fun b!103375 () Bool)

(declare-fun res!85031 () Bool)

(declare-fun e!67620 () Bool)

(assert (=> b!103375 (=> (not res!85031) (not e!67620))))

(declare-fun lt!151139 () tuple2!8438)

(assert (=> b!103375 (= res!85031 (isPrefixOf!0 (_2!4474 lt!151139) (_2!4473 lt!150315)))))

(declare-fun b!103376 () Bool)

(declare-fun lt!151133 () Unit!6320)

(assert (=> b!103376 (= e!67619 lt!151133)))

(declare-fun lt!151148 () (_ BitVec 64))

(assert (=> b!103376 (= lt!151148 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!151138 () (_ BitVec 64))

(assert (=> b!103376 (= lt!151138 (bitIndex!0 (size!2200 (buf!2563 thiss!1305)) (currentByte!5042 thiss!1305) (currentBit!5037 thiss!1305)))))

(assert (=> b!103376 (= lt!151133 (arrayBitRangesEqSymmetric!0 (buf!2563 thiss!1305) (buf!2563 (_2!4473 lt!150315)) lt!151148 lt!151138))))

(assert (=> b!103376 (arrayBitRangesEq!0 (buf!2563 (_2!4473 lt!150315)) (buf!2563 thiss!1305) lt!151148 lt!151138)))

(declare-fun d!32182 () Bool)

(assert (=> d!32182 e!67620))

(declare-fun res!85033 () Bool)

(assert (=> d!32182 (=> (not res!85033) (not e!67620))))

(assert (=> d!32182 (= res!85033 (isPrefixOf!0 (_1!4474 lt!151139) (_2!4474 lt!151139)))))

(declare-fun lt!151135 () BitStream!3874)

(assert (=> d!32182 (= lt!151139 (tuple2!8439 lt!151135 (_2!4473 lt!150315)))))

(declare-fun lt!151149 () Unit!6320)

(declare-fun lt!151143 () Unit!6320)

(assert (=> d!32182 (= lt!151149 lt!151143)))

(assert (=> d!32182 (isPrefixOf!0 lt!151135 (_2!4473 lt!150315))))

(assert (=> d!32182 (= lt!151143 (lemmaIsPrefixTransitive!0 lt!151135 (_2!4473 lt!150315) (_2!4473 lt!150315)))))

(declare-fun lt!151136 () Unit!6320)

(declare-fun lt!151144 () Unit!6320)

(assert (=> d!32182 (= lt!151136 lt!151144)))

(assert (=> d!32182 (isPrefixOf!0 lt!151135 (_2!4473 lt!150315))))

(assert (=> d!32182 (= lt!151144 (lemmaIsPrefixTransitive!0 lt!151135 thiss!1305 (_2!4473 lt!150315)))))

(declare-fun lt!151140 () Unit!6320)

(assert (=> d!32182 (= lt!151140 e!67619)))

(declare-fun c!6410 () Bool)

(assert (=> d!32182 (= c!6410 (not (= (size!2200 (buf!2563 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!151146 () Unit!6320)

(declare-fun lt!151142 () Unit!6320)

(assert (=> d!32182 (= lt!151146 lt!151142)))

(assert (=> d!32182 (isPrefixOf!0 (_2!4473 lt!150315) (_2!4473 lt!150315))))

(assert (=> d!32182 (= lt!151142 (lemmaIsPrefixRefl!0 (_2!4473 lt!150315)))))

(declare-fun lt!151132 () Unit!6320)

(declare-fun lt!151147 () Unit!6320)

(assert (=> d!32182 (= lt!151132 lt!151147)))

(assert (=> d!32182 (= lt!151147 (lemmaIsPrefixRefl!0 (_2!4473 lt!150315)))))

(declare-fun lt!151145 () Unit!6320)

(declare-fun lt!151134 () Unit!6320)

(assert (=> d!32182 (= lt!151145 lt!151134)))

(assert (=> d!32182 (isPrefixOf!0 lt!151135 lt!151135)))

(assert (=> d!32182 (= lt!151134 (lemmaIsPrefixRefl!0 lt!151135))))

(declare-fun lt!151131 () Unit!6320)

(declare-fun lt!151137 () Unit!6320)

(assert (=> d!32182 (= lt!151131 lt!151137)))

(assert (=> d!32182 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!32182 (= lt!151137 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!32182 (= lt!151135 (BitStream!3875 (buf!2563 (_2!4473 lt!150315)) (currentByte!5042 thiss!1305) (currentBit!5037 thiss!1305)))))

(assert (=> d!32182 (isPrefixOf!0 thiss!1305 (_2!4473 lt!150315))))

(assert (=> d!32182 (= (reader!0 thiss!1305 (_2!4473 lt!150315)) lt!151139)))

(declare-fun b!103377 () Bool)

(declare-fun res!85032 () Bool)

(assert (=> b!103377 (=> (not res!85032) (not e!67620))))

(assert (=> b!103377 (= res!85032 (isPrefixOf!0 (_1!4474 lt!151139) thiss!1305))))

(declare-fun lt!151130 () (_ BitVec 64))

(declare-fun b!103378 () Bool)

(declare-fun lt!151141 () (_ BitVec 64))

(assert (=> b!103378 (= e!67620 (= (_1!4474 lt!151139) (withMovedBitIndex!0 (_2!4474 lt!151139) (bvsub lt!151141 lt!151130))))))

(assert (=> b!103378 (or (= (bvand lt!151141 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!151130 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!151141 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!151141 lt!151130) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!103378 (= lt!151130 (bitIndex!0 (size!2200 (buf!2563 (_2!4473 lt!150315))) (currentByte!5042 (_2!4473 lt!150315)) (currentBit!5037 (_2!4473 lt!150315))))))

(assert (=> b!103378 (= lt!151141 (bitIndex!0 (size!2200 (buf!2563 thiss!1305)) (currentByte!5042 thiss!1305) (currentBit!5037 thiss!1305)))))

(assert (= (and d!32182 c!6410) b!103376))

(assert (= (and d!32182 (not c!6410)) b!103374))

(assert (= (and d!32182 res!85033) b!103377))

(assert (= (and b!103377 res!85032) b!103375))

(assert (= (and b!103375 res!85031) b!103378))

(declare-fun m!150937 () Bool)

(assert (=> b!103378 m!150937))

(assert (=> b!103378 m!150605))

(assert (=> b!103378 m!150285))

(assert (=> b!103376 m!150285))

(declare-fun m!150939 () Bool)

(assert (=> b!103376 m!150939))

(declare-fun m!150941 () Bool)

(assert (=> b!103376 m!150941))

(declare-fun m!150943 () Bool)

(assert (=> d!32182 m!150943))

(declare-fun m!150945 () Bool)

(assert (=> d!32182 m!150945))

(declare-fun m!150947 () Bool)

(assert (=> d!32182 m!150947))

(declare-fun m!150949 () Bool)

(assert (=> d!32182 m!150949))

(declare-fun m!150951 () Bool)

(assert (=> d!32182 m!150951))

(declare-fun m!150953 () Bool)

(assert (=> d!32182 m!150953))

(assert (=> d!32182 m!150923))

(declare-fun m!150955 () Bool)

(assert (=> d!32182 m!150955))

(assert (=> d!32182 m!150927))

(assert (=> d!32182 m!150299))

(declare-fun m!150957 () Bool)

(assert (=> d!32182 m!150957))

(declare-fun m!150959 () Bool)

(assert (=> b!103375 m!150959))

(declare-fun m!150961 () Bool)

(assert (=> b!103377 m!150961))

(assert (=> b!103051 d!32182))

(declare-fun d!32184 () Bool)

(declare-fun e!67621 () Bool)

(assert (=> d!32184 e!67621))

(declare-fun res!85034 () Bool)

(assert (=> d!32184 (=> (not res!85034) (not e!67621))))

(declare-fun lt!151154 () (_ BitVec 64))

(declare-fun lt!151153 () (_ BitVec 64))

(declare-fun lt!151155 () (_ BitVec 64))

(assert (=> d!32184 (= res!85034 (= lt!151153 (bvsub lt!151155 lt!151154)))))

(assert (=> d!32184 (or (= (bvand lt!151155 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!151154 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!151155 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!151155 lt!151154) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32184 (= lt!151154 (remainingBits!0 ((_ sign_extend 32) (size!2200 (buf!2563 (_1!4472 lt!150306)))) ((_ sign_extend 32) (currentByte!5042 (_1!4472 lt!150306))) ((_ sign_extend 32) (currentBit!5037 (_1!4472 lt!150306)))))))

(declare-fun lt!151151 () (_ BitVec 64))

(declare-fun lt!151152 () (_ BitVec 64))

(assert (=> d!32184 (= lt!151155 (bvmul lt!151151 lt!151152))))

(assert (=> d!32184 (or (= lt!151151 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!151152 (bvsdiv (bvmul lt!151151 lt!151152) lt!151151)))))

(assert (=> d!32184 (= lt!151152 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32184 (= lt!151151 ((_ sign_extend 32) (size!2200 (buf!2563 (_1!4472 lt!150306)))))))

(assert (=> d!32184 (= lt!151153 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5042 (_1!4472 lt!150306))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5037 (_1!4472 lt!150306)))))))

(assert (=> d!32184 (invariant!0 (currentBit!5037 (_1!4472 lt!150306)) (currentByte!5042 (_1!4472 lt!150306)) (size!2200 (buf!2563 (_1!4472 lt!150306))))))

(assert (=> d!32184 (= (bitIndex!0 (size!2200 (buf!2563 (_1!4472 lt!150306))) (currentByte!5042 (_1!4472 lt!150306)) (currentBit!5037 (_1!4472 lt!150306))) lt!151153)))

(declare-fun b!103379 () Bool)

(declare-fun res!85035 () Bool)

(assert (=> b!103379 (=> (not res!85035) (not e!67621))))

(assert (=> b!103379 (= res!85035 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!151153))))

(declare-fun b!103380 () Bool)

(declare-fun lt!151150 () (_ BitVec 64))

(assert (=> b!103380 (= e!67621 (bvsle lt!151153 (bvmul lt!151150 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!103380 (or (= lt!151150 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!151150 #b0000000000000000000000000000000000000000000000000000000000001000) lt!151150)))))

(assert (=> b!103380 (= lt!151150 ((_ sign_extend 32) (size!2200 (buf!2563 (_1!4472 lt!150306)))))))

(assert (= (and d!32184 res!85034) b!103379))

(assert (= (and b!103379 res!85035) b!103380))

(declare-fun m!150963 () Bool)

(assert (=> d!32184 m!150963))

(declare-fun m!150965 () Bool)

(assert (=> d!32184 m!150965))

(assert (=> b!103051 d!32184))

(declare-fun d!32186 () Bool)

(declare-fun e!67622 () Bool)

(assert (=> d!32186 e!67622))

(declare-fun res!85036 () Bool)

(assert (=> d!32186 (=> (not res!85036) (not e!67622))))

(declare-fun lt!151160 () (_ BitVec 64))

(declare-fun lt!151161 () (_ BitVec 64))

(declare-fun lt!151159 () (_ BitVec 64))

(assert (=> d!32186 (= res!85036 (= lt!151159 (bvsub lt!151161 lt!151160)))))

(assert (=> d!32186 (or (= (bvand lt!151161 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!151160 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!151161 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!151161 lt!151160) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32186 (= lt!151160 (remainingBits!0 ((_ sign_extend 32) (size!2200 (buf!2563 (_1!4472 lt!150312)))) ((_ sign_extend 32) (currentByte!5042 (_1!4472 lt!150312))) ((_ sign_extend 32) (currentBit!5037 (_1!4472 lt!150312)))))))

(declare-fun lt!151157 () (_ BitVec 64))

(declare-fun lt!151158 () (_ BitVec 64))

(assert (=> d!32186 (= lt!151161 (bvmul lt!151157 lt!151158))))

(assert (=> d!32186 (or (= lt!151157 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!151158 (bvsdiv (bvmul lt!151157 lt!151158) lt!151157)))))

(assert (=> d!32186 (= lt!151158 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32186 (= lt!151157 ((_ sign_extend 32) (size!2200 (buf!2563 (_1!4472 lt!150312)))))))

(assert (=> d!32186 (= lt!151159 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5042 (_1!4472 lt!150312))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5037 (_1!4472 lt!150312)))))))

(assert (=> d!32186 (invariant!0 (currentBit!5037 (_1!4472 lt!150312)) (currentByte!5042 (_1!4472 lt!150312)) (size!2200 (buf!2563 (_1!4472 lt!150312))))))

(assert (=> d!32186 (= (bitIndex!0 (size!2200 (buf!2563 (_1!4472 lt!150312))) (currentByte!5042 (_1!4472 lt!150312)) (currentBit!5037 (_1!4472 lt!150312))) lt!151159)))

(declare-fun b!103381 () Bool)

(declare-fun res!85037 () Bool)

(assert (=> b!103381 (=> (not res!85037) (not e!67622))))

(assert (=> b!103381 (= res!85037 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!151159))))

(declare-fun b!103382 () Bool)

(declare-fun lt!151156 () (_ BitVec 64))

(assert (=> b!103382 (= e!67622 (bvsle lt!151159 (bvmul lt!151156 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!103382 (or (= lt!151156 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!151156 #b0000000000000000000000000000000000000000000000000000000000001000) lt!151156)))))

(assert (=> b!103382 (= lt!151156 ((_ sign_extend 32) (size!2200 (buf!2563 (_1!4472 lt!150312)))))))

(assert (= (and d!32186 res!85036) b!103381))

(assert (= (and b!103381 res!85037) b!103382))

(declare-fun m!150967 () Bool)

(assert (=> d!32186 m!150967))

(declare-fun m!150969 () Bool)

(assert (=> d!32186 m!150969))

(assert (=> b!103051 d!32186))

(declare-fun d!32188 () Bool)

(declare-fun lt!151162 () tuple2!8462)

(assert (=> d!32188 (= lt!151162 (readBit!0 (BitStream!3875 (buf!2563 (_2!4473 lt!150315)) (currentByte!5042 thiss!1305) (currentBit!5037 thiss!1305))))))

(assert (=> d!32188 (= (readBitPure!0 (BitStream!3875 (buf!2563 (_2!4473 lt!150315)) (currentByte!5042 thiss!1305) (currentBit!5037 thiss!1305))) (tuple2!8435 (_2!4486 lt!151162) (_1!4486 lt!151162)))))

(declare-fun bs!7887 () Bool)

(assert (= bs!7887 d!32188))

(declare-fun m!150971 () Bool)

(assert (=> bs!7887 m!150971))

(assert (=> b!103051 d!32188))

(declare-fun d!32190 () Bool)

(declare-fun e!67625 () Bool)

(assert (=> d!32190 e!67625))

(declare-fun res!85040 () Bool)

(assert (=> d!32190 (=> (not res!85040) (not e!67625))))

(declare-fun lt!151173 () tuple2!8434)

(declare-fun lt!151174 () tuple2!8434)

(assert (=> d!32190 (= res!85040 (= (bitIndex!0 (size!2200 (buf!2563 (_1!4472 lt!151173))) (currentByte!5042 (_1!4472 lt!151173)) (currentBit!5037 (_1!4472 lt!151173))) (bitIndex!0 (size!2200 (buf!2563 (_1!4472 lt!151174))) (currentByte!5042 (_1!4472 lt!151174)) (currentBit!5037 (_1!4472 lt!151174)))))))

(declare-fun lt!151171 () Unit!6320)

(declare-fun lt!151172 () BitStream!3874)

(declare-fun choose!50 (BitStream!3874 BitStream!3874 BitStream!3874 tuple2!8434 tuple2!8434 BitStream!3874 Bool tuple2!8434 tuple2!8434 BitStream!3874 Bool) Unit!6320)

(assert (=> d!32190 (= lt!151171 (choose!50 lt!150317 (_2!4473 lt!150315) lt!151172 lt!151173 (tuple2!8435 (_1!4472 lt!151173) (_2!4472 lt!151173)) (_1!4472 lt!151173) (_2!4472 lt!151173) lt!151174 (tuple2!8435 (_1!4472 lt!151174) (_2!4472 lt!151174)) (_1!4472 lt!151174) (_2!4472 lt!151174)))))

(assert (=> d!32190 (= lt!151174 (readBitPure!0 lt!151172))))

(assert (=> d!32190 (= lt!151173 (readBitPure!0 lt!150317))))

(assert (=> d!32190 (= lt!151172 (BitStream!3875 (buf!2563 (_2!4473 lt!150315)) (currentByte!5042 lt!150317) (currentBit!5037 lt!150317)))))

(assert (=> d!32190 (invariant!0 (currentBit!5037 lt!150317) (currentByte!5042 lt!150317) (size!2200 (buf!2563 (_2!4473 lt!150315))))))

(assert (=> d!32190 (= (readBitPrefixLemma!0 lt!150317 (_2!4473 lt!150315)) lt!151171)))

(declare-fun b!103385 () Bool)

(assert (=> b!103385 (= e!67625 (= (_2!4472 lt!151173) (_2!4472 lt!151174)))))

(assert (= (and d!32190 res!85040) b!103385))

(declare-fun m!150973 () Bool)

(assert (=> d!32190 m!150973))

(declare-fun m!150975 () Bool)

(assert (=> d!32190 m!150975))

(declare-fun m!150977 () Bool)

(assert (=> d!32190 m!150977))

(declare-fun m!150979 () Bool)

(assert (=> d!32190 m!150979))

(assert (=> d!32190 m!150317))

(declare-fun m!150981 () Bool)

(assert (=> d!32190 m!150981))

(assert (=> b!103051 d!32190))

(declare-fun d!32192 () Bool)

(declare-fun lt!151175 () tuple2!8462)

(assert (=> d!32192 (= lt!151175 (readBit!0 (_1!4474 lt!150314)))))

(assert (=> d!32192 (= (readBitPure!0 (_1!4474 lt!150314)) (tuple2!8435 (_2!4486 lt!151175) (_1!4486 lt!151175)))))

(declare-fun bs!7888 () Bool)

(assert (= bs!7888 d!32192))

(declare-fun m!150983 () Bool)

(assert (=> bs!7888 m!150983))

(assert (=> b!103051 d!32192))

(declare-fun d!32194 () Bool)

(assert (=> d!32194 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2200 (buf!2563 (_2!4473 lt!150315)))) ((_ sign_extend 32) (currentByte!5042 thiss!1305)) ((_ sign_extend 32) (currentBit!5037 thiss!1305)) lt!150313) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2200 (buf!2563 (_2!4473 lt!150315)))) ((_ sign_extend 32) (currentByte!5042 thiss!1305)) ((_ sign_extend 32) (currentBit!5037 thiss!1305))) lt!150313))))

(declare-fun bs!7889 () Bool)

(assert (= bs!7889 d!32194))

(declare-fun m!150985 () Bool)

(assert (=> bs!7889 m!150985))

(assert (=> b!103051 d!32194))

(declare-fun d!32196 () Bool)

(assert (=> d!32196 (validate_offset_bits!1 ((_ sign_extend 32) (size!2200 (buf!2563 (_2!4473 lt!150315)))) ((_ sign_extend 32) (currentByte!5042 (_2!4473 lt!150309))) ((_ sign_extend 32) (currentBit!5037 (_2!4473 lt!150309))) lt!150323)))

(declare-fun lt!151176 () Unit!6320)

(assert (=> d!32196 (= lt!151176 (choose!9 (_2!4473 lt!150309) (buf!2563 (_2!4473 lt!150315)) lt!150323 (BitStream!3875 (buf!2563 (_2!4473 lt!150315)) (currentByte!5042 (_2!4473 lt!150309)) (currentBit!5037 (_2!4473 lt!150309)))))))

(assert (=> d!32196 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4473 lt!150309) (buf!2563 (_2!4473 lt!150315)) lt!150323) lt!151176)))

(declare-fun bs!7890 () Bool)

(assert (= bs!7890 d!32196))

(assert (=> bs!7890 m!150305))

(declare-fun m!150987 () Bool)

(assert (=> bs!7890 m!150987))

(assert (=> b!103051 d!32196))

(declare-fun d!32198 () Bool)

(assert (=> d!32198 (= (array_inv!2002 (buf!2563 thiss!1305)) (bvsge (size!2200 (buf!2563 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!103041 d!32198))

(declare-fun d!32200 () Bool)

(assert (=> d!32200 (= (invariant!0 (currentBit!5037 thiss!1305) (currentByte!5042 thiss!1305) (size!2200 (buf!2563 (_2!4473 lt!150315)))) (and (bvsge (currentBit!5037 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5037 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5042 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5042 thiss!1305) (size!2200 (buf!2563 (_2!4473 lt!150315)))) (and (= (currentBit!5037 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5042 thiss!1305) (size!2200 (buf!2563 (_2!4473 lt!150315))))))))))

(assert (=> b!103047 d!32200))

(declare-fun d!32202 () Bool)

(assert (=> d!32202 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2200 (buf!2563 thiss!1305))) ((_ sign_extend 32) (currentByte!5042 thiss!1305)) ((_ sign_extend 32) (currentBit!5037 thiss!1305)) lt!150313) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2200 (buf!2563 thiss!1305))) ((_ sign_extend 32) (currentByte!5042 thiss!1305)) ((_ sign_extend 32) (currentBit!5037 thiss!1305))) lt!150313))))

(declare-fun bs!7891 () Bool)

(assert (= bs!7891 d!32202))

(declare-fun m!150989 () Bool)

(assert (=> bs!7891 m!150989))

(assert (=> b!103048 d!32202))

(declare-fun d!32204 () Bool)

(declare-fun e!67626 () Bool)

(assert (=> d!32204 e!67626))

(declare-fun res!85041 () Bool)

(assert (=> d!32204 (=> (not res!85041) (not e!67626))))

(declare-fun lt!151181 () (_ BitVec 64))

(declare-fun lt!151182 () (_ BitVec 64))

(declare-fun lt!151180 () (_ BitVec 64))

(assert (=> d!32204 (= res!85041 (= lt!151180 (bvsub lt!151182 lt!151181)))))

(assert (=> d!32204 (or (= (bvand lt!151182 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!151181 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!151182 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!151182 lt!151181) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32204 (= lt!151181 (remainingBits!0 ((_ sign_extend 32) (size!2200 (buf!2563 (_2!4473 lt!150309)))) ((_ sign_extend 32) (currentByte!5042 (_2!4473 lt!150309))) ((_ sign_extend 32) (currentBit!5037 (_2!4473 lt!150309)))))))

(declare-fun lt!151178 () (_ BitVec 64))

(declare-fun lt!151179 () (_ BitVec 64))

(assert (=> d!32204 (= lt!151182 (bvmul lt!151178 lt!151179))))

(assert (=> d!32204 (or (= lt!151178 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!151179 (bvsdiv (bvmul lt!151178 lt!151179) lt!151178)))))

(assert (=> d!32204 (= lt!151179 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32204 (= lt!151178 ((_ sign_extend 32) (size!2200 (buf!2563 (_2!4473 lt!150309)))))))

(assert (=> d!32204 (= lt!151180 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5042 (_2!4473 lt!150309))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5037 (_2!4473 lt!150309)))))))

(assert (=> d!32204 (invariant!0 (currentBit!5037 (_2!4473 lt!150309)) (currentByte!5042 (_2!4473 lt!150309)) (size!2200 (buf!2563 (_2!4473 lt!150309))))))

(assert (=> d!32204 (= (bitIndex!0 (size!2200 (buf!2563 (_2!4473 lt!150309))) (currentByte!5042 (_2!4473 lt!150309)) (currentBit!5037 (_2!4473 lt!150309))) lt!151180)))

(declare-fun b!103386 () Bool)

(declare-fun res!85042 () Bool)

(assert (=> b!103386 (=> (not res!85042) (not e!67626))))

(assert (=> b!103386 (= res!85042 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!151180))))

(declare-fun b!103387 () Bool)

(declare-fun lt!151177 () (_ BitVec 64))

(assert (=> b!103387 (= e!67626 (bvsle lt!151180 (bvmul lt!151177 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!103387 (or (= lt!151177 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!151177 #b0000000000000000000000000000000000000000000000000000000000001000) lt!151177)))))

(assert (=> b!103387 (= lt!151177 ((_ sign_extend 32) (size!2200 (buf!2563 (_2!4473 lt!150309)))))))

(assert (= (and d!32204 res!85041) b!103386))

(assert (= (and b!103386 res!85042) b!103387))

(declare-fun m!150991 () Bool)

(assert (=> d!32204 m!150991))

(assert (=> d!32204 m!150603))

(assert (=> b!103049 d!32204))

(declare-fun d!32206 () Bool)

(declare-fun e!67627 () Bool)

(assert (=> d!32206 e!67627))

(declare-fun res!85043 () Bool)

(assert (=> d!32206 (=> (not res!85043) (not e!67627))))

(declare-fun lt!151188 () (_ BitVec 64))

(declare-fun lt!151187 () (_ BitVec 64))

(declare-fun lt!151186 () (_ BitVec 64))

(assert (=> d!32206 (= res!85043 (= lt!151186 (bvsub lt!151188 lt!151187)))))

(assert (=> d!32206 (or (= (bvand lt!151188 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!151187 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!151188 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!151188 lt!151187) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32206 (= lt!151187 (remainingBits!0 ((_ sign_extend 32) (size!2200 (buf!2563 thiss!1305))) ((_ sign_extend 32) (currentByte!5042 thiss!1305)) ((_ sign_extend 32) (currentBit!5037 thiss!1305))))))

(declare-fun lt!151184 () (_ BitVec 64))

(declare-fun lt!151185 () (_ BitVec 64))

(assert (=> d!32206 (= lt!151188 (bvmul lt!151184 lt!151185))))

(assert (=> d!32206 (or (= lt!151184 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!151185 (bvsdiv (bvmul lt!151184 lt!151185) lt!151184)))))

(assert (=> d!32206 (= lt!151185 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!32206 (= lt!151184 ((_ sign_extend 32) (size!2200 (buf!2563 thiss!1305))))))

(assert (=> d!32206 (= lt!151186 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5042 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5037 thiss!1305))))))

(assert (=> d!32206 (invariant!0 (currentBit!5037 thiss!1305) (currentByte!5042 thiss!1305) (size!2200 (buf!2563 thiss!1305)))))

(assert (=> d!32206 (= (bitIndex!0 (size!2200 (buf!2563 thiss!1305)) (currentByte!5042 thiss!1305) (currentBit!5037 thiss!1305)) lt!151186)))

(declare-fun b!103388 () Bool)

(declare-fun res!85044 () Bool)

(assert (=> b!103388 (=> (not res!85044) (not e!67627))))

(assert (=> b!103388 (= res!85044 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!151186))))

(declare-fun b!103389 () Bool)

(declare-fun lt!151183 () (_ BitVec 64))

(assert (=> b!103389 (= e!67627 (bvsle lt!151186 (bvmul lt!151183 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!103389 (or (= lt!151183 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!151183 #b0000000000000000000000000000000000000000000000000000000000001000) lt!151183)))))

(assert (=> b!103389 (= lt!151183 ((_ sign_extend 32) (size!2200 (buf!2563 thiss!1305))))))

(assert (= (and d!32206 res!85043) b!103388))

(assert (= (and b!103388 res!85044) b!103389))

(assert (=> d!32206 m!150989))

(assert (=> d!32206 m!150595))

(assert (=> b!103049 d!32206))

(declare-fun d!32208 () Bool)

(assert (=> d!32208 (= (invariant!0 (currentBit!5037 thiss!1305) (currentByte!5042 thiss!1305) (size!2200 (buf!2563 (_2!4473 lt!150309)))) (and (bvsge (currentBit!5037 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5037 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5042 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5042 thiss!1305) (size!2200 (buf!2563 (_2!4473 lt!150309)))) (and (= (currentBit!5037 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5042 thiss!1305) (size!2200 (buf!2563 (_2!4473 lt!150309))))))))))

(assert (=> b!103044 d!32208))

(declare-fun d!32210 () Bool)

(assert (=> d!32210 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2200 (buf!2563 (_1!4474 lt!150304)))) ((_ sign_extend 32) (currentByte!5042 (_1!4474 lt!150304))) ((_ sign_extend 32) (currentBit!5037 (_1!4474 lt!150304))) ((_ sign_extend 32) lt!150308)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2200 (buf!2563 (_1!4474 lt!150304)))) ((_ sign_extend 32) (currentByte!5042 (_1!4474 lt!150304))) ((_ sign_extend 32) (currentBit!5037 (_1!4474 lt!150304)))) ((_ sign_extend 32) lt!150308)))))

(declare-fun bs!7892 () Bool)

(assert (= bs!7892 d!32210))

(declare-fun m!150993 () Bool)

(assert (=> bs!7892 m!150993))

(assert (=> b!103045 d!32210))

(declare-fun d!32212 () Bool)

(declare-fun res!85047 () Bool)

(declare-fun e!67628 () Bool)

(assert (=> d!32212 (=> (not res!85047) (not e!67628))))

(assert (=> d!32212 (= res!85047 (= (size!2200 (buf!2563 thiss!1305)) (size!2200 (buf!2563 (_2!4473 lt!150309)))))))

(assert (=> d!32212 (= (isPrefixOf!0 thiss!1305 (_2!4473 lt!150309)) e!67628)))

(declare-fun b!103390 () Bool)

(declare-fun res!85045 () Bool)

(assert (=> b!103390 (=> (not res!85045) (not e!67628))))

(assert (=> b!103390 (= res!85045 (bvsle (bitIndex!0 (size!2200 (buf!2563 thiss!1305)) (currentByte!5042 thiss!1305) (currentBit!5037 thiss!1305)) (bitIndex!0 (size!2200 (buf!2563 (_2!4473 lt!150309))) (currentByte!5042 (_2!4473 lt!150309)) (currentBit!5037 (_2!4473 lt!150309)))))))

(declare-fun b!103391 () Bool)

(declare-fun e!67629 () Bool)

(assert (=> b!103391 (= e!67628 e!67629)))

(declare-fun res!85046 () Bool)

(assert (=> b!103391 (=> res!85046 e!67629)))

(assert (=> b!103391 (= res!85046 (= (size!2200 (buf!2563 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!103392 () Bool)

(assert (=> b!103392 (= e!67629 (arrayBitRangesEq!0 (buf!2563 thiss!1305) (buf!2563 (_2!4473 lt!150309)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2200 (buf!2563 thiss!1305)) (currentByte!5042 thiss!1305) (currentBit!5037 thiss!1305))))))

(assert (= (and d!32212 res!85047) b!103390))

(assert (= (and b!103390 res!85045) b!103391))

(assert (= (and b!103391 (not res!85046)) b!103392))

(assert (=> b!103390 m!150285))

(assert (=> b!103390 m!150283))

(assert (=> b!103392 m!150285))

(assert (=> b!103392 m!150285))

(declare-fun m!150995 () Bool)

(assert (=> b!103392 m!150995))

(assert (=> b!103046 d!32212))

(push 1)

(assert (not d!32194))

(assert (not b!103336))

(assert (not bm!1285))

(assert (not d!32100))

(assert (not d!32168))

(assert (not b!103377))

(assert (not d!32188))

(assert (not b!103357))

(assert (not b!103373))

(assert (not d!32174))

(assert (not b!103372))

(assert (not d!32190))

(assert (not b!103392))

(assert (not d!32106))

(assert (not b!103355))

(assert (not b!103341))

(assert (not d!32202))

(assert (not b!103390))

(assert (not b!103371))

(assert (not b!103376))

(assert (not b!103375))

(assert (not b!103215))

(assert (not d!32176))

(assert (not d!32210))

(assert (not b!103378))

(assert (not d!32186))

(assert (not b!103206))

(assert (not d!32102))

(assert (not b!103345))

(assert (not d!32170))

(assert (not b!103334))

(assert (not d!32206))

(assert (not b!103333))

(assert (not b!103339))

(assert (not d!32204))

(assert (not b!103338))

(assert (not b!103335))

(assert (not d!32178))

(assert (not d!32182))

(assert (not d!32196))

(assert (not b!103340))

(assert (not b!103370))

(assert (not b!103358))

(assert (not b!103356))

(assert (not d!32192))

(assert (not d!32172))

(assert (not d!32108))

(assert (not d!32184))

(assert (not b!103213))

(assert (not d!32180))

(check-sat)

(pop 1)

(push 1)

(check-sat)

