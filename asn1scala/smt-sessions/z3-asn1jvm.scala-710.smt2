; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19920 () Bool)

(assert start!19920)

(declare-fun b!99266 () Bool)

(declare-fun res!81422 () Bool)

(declare-fun e!64975 () Bool)

(assert (=> b!99266 (=> (not res!81422) (not e!64975))))

(declare-datatypes ((array!4670 0))(
  ( (array!4671 (arr!2725 (Array (_ BitVec 32) (_ BitVec 8))) (size!2132 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3738 0))(
  ( (BitStream!3739 (buf!2489 array!4670) (currentByte!4929 (_ BitVec 32)) (currentBit!4924 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3738)

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!99266 (= res!81422 (validate_offset_bits!1 ((_ sign_extend 32) (size!2132 (buf!2489 thiss!1305))) ((_ sign_extend 32) (currentByte!4929 thiss!1305)) ((_ sign_extend 32) (currentBit!4924 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!99267 () Bool)

(declare-fun res!81416 () Bool)

(assert (=> b!99267 (=> (not res!81416) (not e!64975))))

(assert (=> b!99267 (= res!81416 (bvslt i!615 nBits!396))))

(declare-fun b!99268 () Bool)

(declare-fun res!81414 () Bool)

(declare-fun e!64972 () Bool)

(assert (=> b!99268 (=> (not res!81414) (not e!64972))))

(declare-datatypes ((Unit!6091 0))(
  ( (Unit!6092) )
))
(declare-datatypes ((tuple2!7988 0))(
  ( (tuple2!7989 (_1!4249 Unit!6091) (_2!4249 BitStream!3738)) )
))
(declare-fun lt!144124 () tuple2!7988)

(declare-fun isPrefixOf!0 (BitStream!3738 BitStream!3738) Bool)

(assert (=> b!99268 (= res!81414 (isPrefixOf!0 thiss!1305 (_2!4249 lt!144124)))))

(declare-fun b!99269 () Bool)

(declare-fun e!64976 () Bool)

(assert (=> b!99269 (= e!64972 e!64976)))

(declare-fun res!81415 () Bool)

(assert (=> b!99269 (=> (not res!81415) (not e!64976))))

(declare-fun lt!144125 () Bool)

(declare-datatypes ((tuple2!7990 0))(
  ( (tuple2!7991 (_1!4250 BitStream!3738) (_2!4250 Bool)) )
))
(declare-fun lt!144127 () tuple2!7990)

(assert (=> b!99269 (= res!81415 (and (= (_2!4250 lt!144127) lt!144125) (= (_1!4250 lt!144127) (_2!4249 lt!144124))))))

(declare-fun readBitPure!0 (BitStream!3738) tuple2!7990)

(declare-fun readerFrom!0 (BitStream!3738 (_ BitVec 32) (_ BitVec 32)) BitStream!3738)

(assert (=> b!99269 (= lt!144127 (readBitPure!0 (readerFrom!0 (_2!4249 lt!144124) (currentBit!4924 thiss!1305) (currentByte!4929 thiss!1305))))))

(declare-fun b!99270 () Bool)

(declare-fun e!64973 () Bool)

(declare-fun array_inv!1934 (array!4670) Bool)

(assert (=> b!99270 (= e!64973 (array_inv!1934 (buf!2489 thiss!1305)))))

(declare-fun b!99271 () Bool)

(declare-fun res!81419 () Bool)

(assert (=> b!99271 (=> (not res!81419) (not e!64975))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!99271 (= res!81419 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!99272 () Bool)

(declare-fun lt!144126 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!99272 (= e!64976 (= (bitIndex!0 (size!2132 (buf!2489 (_1!4250 lt!144127))) (currentByte!4929 (_1!4250 lt!144127)) (currentBit!4924 (_1!4250 lt!144127))) lt!144126))))

(declare-fun b!99273 () Bool)

(declare-fun e!64977 () Bool)

(assert (=> b!99273 (= e!64977 e!64972)))

(declare-fun res!81418 () Bool)

(assert (=> b!99273 (=> (not res!81418) (not e!64972))))

(declare-fun lt!144123 () (_ BitVec 64))

(assert (=> b!99273 (= res!81418 (= lt!144126 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!144123)))))

(assert (=> b!99273 (= lt!144126 (bitIndex!0 (size!2132 (buf!2489 (_2!4249 lt!144124))) (currentByte!4929 (_2!4249 lt!144124)) (currentBit!4924 (_2!4249 lt!144124))))))

(assert (=> b!99273 (= lt!144123 (bitIndex!0 (size!2132 (buf!2489 thiss!1305)) (currentByte!4929 thiss!1305) (currentBit!4924 thiss!1305)))))

(declare-fun res!81417 () Bool)

(assert (=> start!19920 (=> (not res!81417) (not e!64975))))

(assert (=> start!19920 (= res!81417 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!19920 e!64975))

(assert (=> start!19920 true))

(declare-fun inv!12 (BitStream!3738) Bool)

(assert (=> start!19920 (and (inv!12 thiss!1305) e!64973)))

(declare-fun b!99274 () Bool)

(declare-fun e!64974 () Bool)

(assert (=> b!99274 (= e!64975 (not e!64974))))

(declare-fun res!81420 () Bool)

(assert (=> b!99274 (=> res!81420 e!64974)))

(assert (=> b!99274 (= res!81420 (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!99274 e!64977))

(declare-fun res!81421 () Bool)

(assert (=> b!99274 (=> (not res!81421) (not e!64977))))

(assert (=> b!99274 (= res!81421 (= (size!2132 (buf!2489 thiss!1305)) (size!2132 (buf!2489 (_2!4249 lt!144124)))))))

(declare-fun appendBit!0 (BitStream!3738 Bool) tuple2!7988)

(assert (=> b!99274 (= lt!144124 (appendBit!0 thiss!1305 lt!144125))))

(assert (=> b!99274 (= lt!144125 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!99275 () Bool)

(assert (=> b!99275 (= e!64974 (validate_offset_bits!1 ((_ sign_extend 32) (size!2132 (buf!2489 (_2!4249 lt!144124)))) ((_ sign_extend 32) (currentByte!4929 (_2!4249 lt!144124))) ((_ sign_extend 32) (currentBit!4924 (_2!4249 lt!144124))) ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))))

(assert (= (and start!19920 res!81417) b!99266))

(assert (= (and b!99266 res!81422) b!99271))

(assert (= (and b!99271 res!81419) b!99267))

(assert (= (and b!99267 res!81416) b!99274))

(assert (= (and b!99274 res!81421) b!99273))

(assert (= (and b!99273 res!81418) b!99268))

(assert (= (and b!99268 res!81414) b!99269))

(assert (= (and b!99269 res!81415) b!99272))

(assert (= (and b!99274 (not res!81420)) b!99275))

(assert (= start!19920 b!99270))

(declare-fun m!144655 () Bool)

(assert (=> b!99270 m!144655))

(declare-fun m!144657 () Bool)

(assert (=> b!99271 m!144657))

(declare-fun m!144659 () Bool)

(assert (=> b!99275 m!144659))

(declare-fun m!144661 () Bool)

(assert (=> b!99273 m!144661))

(declare-fun m!144663 () Bool)

(assert (=> b!99273 m!144663))

(declare-fun m!144665 () Bool)

(assert (=> b!99268 m!144665))

(declare-fun m!144667 () Bool)

(assert (=> start!19920 m!144667))

(declare-fun m!144669 () Bool)

(assert (=> b!99274 m!144669))

(declare-fun m!144671 () Bool)

(assert (=> b!99266 m!144671))

(declare-fun m!144673 () Bool)

(assert (=> b!99269 m!144673))

(assert (=> b!99269 m!144673))

(declare-fun m!144675 () Bool)

(assert (=> b!99269 m!144675))

(declare-fun m!144677 () Bool)

(assert (=> b!99272 m!144677))

(check-sat (not b!99270) (not b!99275) (not b!99272) (not start!19920) (not b!99266) (not b!99271) (not b!99268) (not b!99269) (not b!99274) (not b!99273))
(check-sat)
(get-model)

(declare-fun d!31292 () Bool)

(declare-fun e!65004 () Bool)

(assert (=> d!31292 e!65004))

(declare-fun res!81459 () Bool)

(assert (=> d!31292 (=> (not res!81459) (not e!65004))))

(declare-fun lt!144152 () tuple2!7988)

(assert (=> d!31292 (= res!81459 (= (size!2132 (buf!2489 thiss!1305)) (size!2132 (buf!2489 (_2!4249 lt!144152)))))))

(declare-fun choose!16 (BitStream!3738 Bool) tuple2!7988)

(assert (=> d!31292 (= lt!144152 (choose!16 thiss!1305 lt!144125))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!31292 (validate_offset_bit!0 ((_ sign_extend 32) (size!2132 (buf!2489 thiss!1305))) ((_ sign_extend 32) (currentByte!4929 thiss!1305)) ((_ sign_extend 32) (currentBit!4924 thiss!1305)))))

(assert (=> d!31292 (= (appendBit!0 thiss!1305 lt!144125) lt!144152)))

(declare-fun b!99317 () Bool)

(declare-fun e!65003 () Bool)

(assert (=> b!99317 (= e!65004 e!65003)))

(declare-fun res!81458 () Bool)

(assert (=> b!99317 (=> (not res!81458) (not e!65003))))

(declare-fun lt!144151 () tuple2!7990)

(assert (=> b!99317 (= res!81458 (and (= (_2!4250 lt!144151) lt!144125) (= (_1!4250 lt!144151) (_2!4249 lt!144152))))))

(assert (=> b!99317 (= lt!144151 (readBitPure!0 (readerFrom!0 (_2!4249 lt!144152) (currentBit!4924 thiss!1305) (currentByte!4929 thiss!1305))))))

(declare-fun b!99316 () Bool)

(declare-fun res!81460 () Bool)

(assert (=> b!99316 (=> (not res!81460) (not e!65004))))

(assert (=> b!99316 (= res!81460 (isPrefixOf!0 thiss!1305 (_2!4249 lt!144152)))))

(declare-fun b!99315 () Bool)

(declare-fun res!81461 () Bool)

(assert (=> b!99315 (=> (not res!81461) (not e!65004))))

(declare-fun lt!144154 () (_ BitVec 64))

(declare-fun lt!144153 () (_ BitVec 64))

(assert (=> b!99315 (= res!81461 (= (bitIndex!0 (size!2132 (buf!2489 (_2!4249 lt!144152))) (currentByte!4929 (_2!4249 lt!144152)) (currentBit!4924 (_2!4249 lt!144152))) (bvadd lt!144154 lt!144153)))))

(assert (=> b!99315 (or (not (= (bvand lt!144154 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!144153 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!144154 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!144154 lt!144153) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!99315 (= lt!144153 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!99315 (= lt!144154 (bitIndex!0 (size!2132 (buf!2489 thiss!1305)) (currentByte!4929 thiss!1305) (currentBit!4924 thiss!1305)))))

(declare-fun b!99318 () Bool)

(assert (=> b!99318 (= e!65003 (= (bitIndex!0 (size!2132 (buf!2489 (_1!4250 lt!144151))) (currentByte!4929 (_1!4250 lt!144151)) (currentBit!4924 (_1!4250 lt!144151))) (bitIndex!0 (size!2132 (buf!2489 (_2!4249 lt!144152))) (currentByte!4929 (_2!4249 lt!144152)) (currentBit!4924 (_2!4249 lt!144152)))))))

(assert (= (and d!31292 res!81459) b!99315))

(assert (= (and b!99315 res!81461) b!99316))

(assert (= (and b!99316 res!81460) b!99317))

(assert (= (and b!99317 res!81458) b!99318))

(declare-fun m!144703 () Bool)

(assert (=> b!99315 m!144703))

(assert (=> b!99315 m!144663))

(declare-fun m!144705 () Bool)

(assert (=> b!99316 m!144705))

(declare-fun m!144707 () Bool)

(assert (=> d!31292 m!144707))

(declare-fun m!144709 () Bool)

(assert (=> d!31292 m!144709))

(declare-fun m!144711 () Bool)

(assert (=> b!99317 m!144711))

(assert (=> b!99317 m!144711))

(declare-fun m!144713 () Bool)

(assert (=> b!99317 m!144713))

(declare-fun m!144715 () Bool)

(assert (=> b!99318 m!144715))

(assert (=> b!99318 m!144703))

(assert (=> b!99274 d!31292))

(declare-fun d!31294 () Bool)

(declare-fun res!81469 () Bool)

(declare-fun e!65009 () Bool)

(assert (=> d!31294 (=> (not res!81469) (not e!65009))))

(assert (=> d!31294 (= res!81469 (= (size!2132 (buf!2489 thiss!1305)) (size!2132 (buf!2489 (_2!4249 lt!144124)))))))

(assert (=> d!31294 (= (isPrefixOf!0 thiss!1305 (_2!4249 lt!144124)) e!65009)))

(declare-fun b!99325 () Bool)

(declare-fun res!81468 () Bool)

(assert (=> b!99325 (=> (not res!81468) (not e!65009))))

(assert (=> b!99325 (= res!81468 (bvsle (bitIndex!0 (size!2132 (buf!2489 thiss!1305)) (currentByte!4929 thiss!1305) (currentBit!4924 thiss!1305)) (bitIndex!0 (size!2132 (buf!2489 (_2!4249 lt!144124))) (currentByte!4929 (_2!4249 lt!144124)) (currentBit!4924 (_2!4249 lt!144124)))))))

(declare-fun b!99326 () Bool)

(declare-fun e!65010 () Bool)

(assert (=> b!99326 (= e!65009 e!65010)))

(declare-fun res!81470 () Bool)

(assert (=> b!99326 (=> res!81470 e!65010)))

(assert (=> b!99326 (= res!81470 (= (size!2132 (buf!2489 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!99327 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4670 array!4670 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!99327 (= e!65010 (arrayBitRangesEq!0 (buf!2489 thiss!1305) (buf!2489 (_2!4249 lt!144124)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2132 (buf!2489 thiss!1305)) (currentByte!4929 thiss!1305) (currentBit!4924 thiss!1305))))))

(assert (= (and d!31294 res!81469) b!99325))

(assert (= (and b!99325 res!81468) b!99326))

(assert (= (and b!99326 (not res!81470)) b!99327))

(assert (=> b!99325 m!144663))

(assert (=> b!99325 m!144661))

(assert (=> b!99327 m!144663))

(assert (=> b!99327 m!144663))

(declare-fun m!144717 () Bool)

(assert (=> b!99327 m!144717))

(assert (=> b!99268 d!31294))

(declare-fun d!31298 () Bool)

(declare-fun e!65019 () Bool)

(assert (=> d!31298 e!65019))

(declare-fun res!81485 () Bool)

(assert (=> d!31298 (=> (not res!81485) (not e!65019))))

(declare-fun lt!144168 () (_ BitVec 64))

(declare-fun lt!144172 () (_ BitVec 64))

(declare-fun lt!144169 () (_ BitVec 64))

(assert (=> d!31298 (= res!81485 (= lt!144169 (bvsub lt!144172 lt!144168)))))

(assert (=> d!31298 (or (= (bvand lt!144172 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!144168 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!144172 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!144172 lt!144168) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!31298 (= lt!144168 (remainingBits!0 ((_ sign_extend 32) (size!2132 (buf!2489 (_2!4249 lt!144124)))) ((_ sign_extend 32) (currentByte!4929 (_2!4249 lt!144124))) ((_ sign_extend 32) (currentBit!4924 (_2!4249 lt!144124)))))))

(declare-fun lt!144171 () (_ BitVec 64))

(declare-fun lt!144167 () (_ BitVec 64))

(assert (=> d!31298 (= lt!144172 (bvmul lt!144171 lt!144167))))

(assert (=> d!31298 (or (= lt!144171 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!144167 (bvsdiv (bvmul lt!144171 lt!144167) lt!144171)))))

(assert (=> d!31298 (= lt!144167 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31298 (= lt!144171 ((_ sign_extend 32) (size!2132 (buf!2489 (_2!4249 lt!144124)))))))

(assert (=> d!31298 (= lt!144169 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4929 (_2!4249 lt!144124))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4924 (_2!4249 lt!144124)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!31298 (invariant!0 (currentBit!4924 (_2!4249 lt!144124)) (currentByte!4929 (_2!4249 lt!144124)) (size!2132 (buf!2489 (_2!4249 lt!144124))))))

(assert (=> d!31298 (= (bitIndex!0 (size!2132 (buf!2489 (_2!4249 lt!144124))) (currentByte!4929 (_2!4249 lt!144124)) (currentBit!4924 (_2!4249 lt!144124))) lt!144169)))

(declare-fun b!99341 () Bool)

(declare-fun res!81484 () Bool)

(assert (=> b!99341 (=> (not res!81484) (not e!65019))))

(assert (=> b!99341 (= res!81484 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!144169))))

(declare-fun b!99342 () Bool)

(declare-fun lt!144170 () (_ BitVec 64))

(assert (=> b!99342 (= e!65019 (bvsle lt!144169 (bvmul lt!144170 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!99342 (or (= lt!144170 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!144170 #b0000000000000000000000000000000000000000000000000000000000001000) lt!144170)))))

(assert (=> b!99342 (= lt!144170 ((_ sign_extend 32) (size!2132 (buf!2489 (_2!4249 lt!144124)))))))

(assert (= (and d!31298 res!81485) b!99341))

(assert (= (and b!99341 res!81484) b!99342))

(declare-fun m!144723 () Bool)

(assert (=> d!31298 m!144723))

(declare-fun m!144725 () Bool)

(assert (=> d!31298 m!144725))

(assert (=> b!99273 d!31298))

(declare-fun d!31304 () Bool)

(declare-fun e!65020 () Bool)

(assert (=> d!31304 e!65020))

(declare-fun res!81487 () Bool)

(assert (=> d!31304 (=> (not res!81487) (not e!65020))))

(declare-fun lt!144178 () (_ BitVec 64))

(declare-fun lt!144174 () (_ BitVec 64))

(declare-fun lt!144175 () (_ BitVec 64))

(assert (=> d!31304 (= res!81487 (= lt!144175 (bvsub lt!144178 lt!144174)))))

(assert (=> d!31304 (or (= (bvand lt!144178 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!144174 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!144178 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!144178 lt!144174) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31304 (= lt!144174 (remainingBits!0 ((_ sign_extend 32) (size!2132 (buf!2489 thiss!1305))) ((_ sign_extend 32) (currentByte!4929 thiss!1305)) ((_ sign_extend 32) (currentBit!4924 thiss!1305))))))

(declare-fun lt!144177 () (_ BitVec 64))

(declare-fun lt!144173 () (_ BitVec 64))

(assert (=> d!31304 (= lt!144178 (bvmul lt!144177 lt!144173))))

(assert (=> d!31304 (or (= lt!144177 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!144173 (bvsdiv (bvmul lt!144177 lt!144173) lt!144177)))))

(assert (=> d!31304 (= lt!144173 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31304 (= lt!144177 ((_ sign_extend 32) (size!2132 (buf!2489 thiss!1305))))))

(assert (=> d!31304 (= lt!144175 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4929 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4924 thiss!1305))))))

(assert (=> d!31304 (invariant!0 (currentBit!4924 thiss!1305) (currentByte!4929 thiss!1305) (size!2132 (buf!2489 thiss!1305)))))

(assert (=> d!31304 (= (bitIndex!0 (size!2132 (buf!2489 thiss!1305)) (currentByte!4929 thiss!1305) (currentBit!4924 thiss!1305)) lt!144175)))

(declare-fun b!99343 () Bool)

(declare-fun res!81486 () Bool)

(assert (=> b!99343 (=> (not res!81486) (not e!65020))))

(assert (=> b!99343 (= res!81486 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!144175))))

(declare-fun b!99344 () Bool)

(declare-fun lt!144176 () (_ BitVec 64))

(assert (=> b!99344 (= e!65020 (bvsle lt!144175 (bvmul lt!144176 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!99344 (or (= lt!144176 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!144176 #b0000000000000000000000000000000000000000000000000000000000001000) lt!144176)))))

(assert (=> b!99344 (= lt!144176 ((_ sign_extend 32) (size!2132 (buf!2489 thiss!1305))))))

(assert (= (and d!31304 res!81487) b!99343))

(assert (= (and b!99343 res!81486) b!99344))

(declare-fun m!144727 () Bool)

(assert (=> d!31304 m!144727))

(declare-fun m!144729 () Bool)

(assert (=> d!31304 m!144729))

(assert (=> b!99273 d!31304))

(declare-fun d!31306 () Bool)

(assert (=> d!31306 (= (array_inv!1934 (buf!2489 thiss!1305)) (bvsge (size!2132 (buf!2489 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!99270 d!31306))

(declare-fun d!31308 () Bool)

(assert (=> d!31308 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2132 (buf!2489 (_2!4249 lt!144124)))) ((_ sign_extend 32) (currentByte!4929 (_2!4249 lt!144124))) ((_ sign_extend 32) (currentBit!4924 (_2!4249 lt!144124))) ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2132 (buf!2489 (_2!4249 lt!144124)))) ((_ sign_extend 32) (currentByte!4929 (_2!4249 lt!144124))) ((_ sign_extend 32) (currentBit!4924 (_2!4249 lt!144124)))) ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun bs!7670 () Bool)

(assert (= bs!7670 d!31308))

(assert (=> bs!7670 m!144723))

(assert (=> b!99275 d!31308))

(declare-fun d!31310 () Bool)

(declare-datatypes ((tuple2!7996 0))(
  ( (tuple2!7997 (_1!4253 Bool) (_2!4253 BitStream!3738)) )
))
(declare-fun lt!144193 () tuple2!7996)

(declare-fun readBit!0 (BitStream!3738) tuple2!7996)

(assert (=> d!31310 (= lt!144193 (readBit!0 (readerFrom!0 (_2!4249 lt!144124) (currentBit!4924 thiss!1305) (currentByte!4929 thiss!1305))))))

(assert (=> d!31310 (= (readBitPure!0 (readerFrom!0 (_2!4249 lt!144124) (currentBit!4924 thiss!1305) (currentByte!4929 thiss!1305))) (tuple2!7991 (_2!4253 lt!144193) (_1!4253 lt!144193)))))

(declare-fun bs!7671 () Bool)

(assert (= bs!7671 d!31310))

(assert (=> bs!7671 m!144673))

(declare-fun m!144731 () Bool)

(assert (=> bs!7671 m!144731))

(assert (=> b!99269 d!31310))

(declare-fun d!31312 () Bool)

(declare-fun e!65027 () Bool)

(assert (=> d!31312 e!65027))

(declare-fun res!81499 () Bool)

(assert (=> d!31312 (=> (not res!81499) (not e!65027))))

(assert (=> d!31312 (= res!81499 (invariant!0 (currentBit!4924 (_2!4249 lt!144124)) (currentByte!4929 (_2!4249 lt!144124)) (size!2132 (buf!2489 (_2!4249 lt!144124)))))))

(assert (=> d!31312 (= (readerFrom!0 (_2!4249 lt!144124) (currentBit!4924 thiss!1305) (currentByte!4929 thiss!1305)) (BitStream!3739 (buf!2489 (_2!4249 lt!144124)) (currentByte!4929 thiss!1305) (currentBit!4924 thiss!1305)))))

(declare-fun b!99355 () Bool)

(assert (=> b!99355 (= e!65027 (invariant!0 (currentBit!4924 thiss!1305) (currentByte!4929 thiss!1305) (size!2132 (buf!2489 (_2!4249 lt!144124)))))))

(assert (= (and d!31312 res!81499) b!99355))

(assert (=> d!31312 m!144725))

(declare-fun m!144739 () Bool)

(assert (=> b!99355 m!144739))

(assert (=> b!99269 d!31312))

(declare-fun d!31318 () Bool)

(assert (=> d!31318 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2132 (buf!2489 thiss!1305))) ((_ sign_extend 32) (currentByte!4929 thiss!1305)) ((_ sign_extend 32) (currentBit!4924 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2132 (buf!2489 thiss!1305))) ((_ sign_extend 32) (currentByte!4929 thiss!1305)) ((_ sign_extend 32) (currentBit!4924 thiss!1305))) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun bs!7672 () Bool)

(assert (= bs!7672 d!31318))

(assert (=> bs!7672 m!144727))

(assert (=> b!99266 d!31318))

(declare-fun d!31320 () Bool)

(assert (=> d!31320 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!99271 d!31320))

(declare-fun d!31322 () Bool)

(assert (=> d!31322 (= (inv!12 thiss!1305) (invariant!0 (currentBit!4924 thiss!1305) (currentByte!4929 thiss!1305) (size!2132 (buf!2489 thiss!1305))))))

(declare-fun bs!7674 () Bool)

(assert (= bs!7674 d!31322))

(assert (=> bs!7674 m!144729))

(assert (=> start!19920 d!31322))

(declare-fun d!31328 () Bool)

(declare-fun e!65028 () Bool)

(assert (=> d!31328 e!65028))

(declare-fun res!81502 () Bool)

(assert (=> d!31328 (=> (not res!81502) (not e!65028))))

(declare-fun lt!144214 () (_ BitVec 64))

(declare-fun lt!144211 () (_ BitVec 64))

(declare-fun lt!144210 () (_ BitVec 64))

(assert (=> d!31328 (= res!81502 (= lt!144211 (bvsub lt!144214 lt!144210)))))

(assert (=> d!31328 (or (= (bvand lt!144214 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!144210 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!144214 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!144214 lt!144210) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31328 (= lt!144210 (remainingBits!0 ((_ sign_extend 32) (size!2132 (buf!2489 (_1!4250 lt!144127)))) ((_ sign_extend 32) (currentByte!4929 (_1!4250 lt!144127))) ((_ sign_extend 32) (currentBit!4924 (_1!4250 lt!144127)))))))

(declare-fun lt!144213 () (_ BitVec 64))

(declare-fun lt!144209 () (_ BitVec 64))

(assert (=> d!31328 (= lt!144214 (bvmul lt!144213 lt!144209))))

(assert (=> d!31328 (or (= lt!144213 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!144209 (bvsdiv (bvmul lt!144213 lt!144209) lt!144213)))))

(assert (=> d!31328 (= lt!144209 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31328 (= lt!144213 ((_ sign_extend 32) (size!2132 (buf!2489 (_1!4250 lt!144127)))))))

(assert (=> d!31328 (= lt!144211 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4929 (_1!4250 lt!144127))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4924 (_1!4250 lt!144127)))))))

(assert (=> d!31328 (invariant!0 (currentBit!4924 (_1!4250 lt!144127)) (currentByte!4929 (_1!4250 lt!144127)) (size!2132 (buf!2489 (_1!4250 lt!144127))))))

(assert (=> d!31328 (= (bitIndex!0 (size!2132 (buf!2489 (_1!4250 lt!144127))) (currentByte!4929 (_1!4250 lt!144127)) (currentBit!4924 (_1!4250 lt!144127))) lt!144211)))

(declare-fun b!99356 () Bool)

(declare-fun res!81501 () Bool)

(assert (=> b!99356 (=> (not res!81501) (not e!65028))))

(assert (=> b!99356 (= res!81501 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!144211))))

(declare-fun b!99357 () Bool)

(declare-fun lt!144212 () (_ BitVec 64))

(assert (=> b!99357 (= e!65028 (bvsle lt!144211 (bvmul lt!144212 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!99357 (or (= lt!144212 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!144212 #b0000000000000000000000000000000000000000000000000000000000001000) lt!144212)))))

(assert (=> b!99357 (= lt!144212 ((_ sign_extend 32) (size!2132 (buf!2489 (_1!4250 lt!144127)))))))

(assert (= (and d!31328 res!81502) b!99356))

(assert (= (and b!99356 res!81501) b!99357))

(declare-fun m!144743 () Bool)

(assert (=> d!31328 m!144743))

(declare-fun m!144745 () Bool)

(assert (=> d!31328 m!144745))

(assert (=> b!99272 d!31328))

(check-sat (not d!31292) (not b!99327) (not d!31322) (not d!31310) (not b!99315) (not b!99318) (not d!31298) (not b!99316) (not d!31328) (not d!31318) (not d!31312) (not d!31304) (not b!99355) (not d!31308) (not b!99317) (not b!99325))
(check-sat)
