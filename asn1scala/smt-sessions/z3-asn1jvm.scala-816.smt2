; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24160 () Bool)

(assert start!24160)

(declare-fun b!122280 () Bool)

(declare-fun res!101320 () Bool)

(declare-fun e!80101 () Bool)

(assert (=> b!122280 (=> (not res!101320) (not e!80101))))

(declare-datatypes ((array!5410 0))(
  ( (array!5411 (arr!3040 (Array (_ BitVec 32) (_ BitVec 8))) (size!2447 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4368 0))(
  ( (BitStream!4369 (buf!2887 array!5410) (currentByte!5584 (_ BitVec 32)) (currentBit!5579 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4368)

(declare-datatypes ((Unit!7533 0))(
  ( (Unit!7534) )
))
(declare-datatypes ((tuple2!10296 0))(
  ( (tuple2!10297 (_1!5413 Unit!7533) (_2!5413 BitStream!4368)) )
))
(declare-fun lt!192261 () tuple2!10296)

(declare-fun isPrefixOf!0 (BitStream!4368 BitStream!4368) Bool)

(assert (=> b!122280 (= res!101320 (isPrefixOf!0 thiss!1305 (_2!5413 lt!192261)))))

(declare-fun b!122281 () Bool)

(declare-fun e!80099 () Bool)

(assert (=> b!122281 (= e!80099 e!80101)))

(declare-fun res!101324 () Bool)

(assert (=> b!122281 (=> (not res!101324) (not e!80101))))

(declare-fun lt!192266 () (_ BitVec 64))

(declare-fun lt!192254 () (_ BitVec 64))

(assert (=> b!122281 (= res!101324 (= lt!192266 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!192254)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!122281 (= lt!192266 (bitIndex!0 (size!2447 (buf!2887 (_2!5413 lt!192261))) (currentByte!5584 (_2!5413 lt!192261)) (currentBit!5579 (_2!5413 lt!192261))))))

(assert (=> b!122281 (= lt!192254 (bitIndex!0 (size!2447 (buf!2887 thiss!1305)) (currentByte!5584 thiss!1305) (currentBit!5579 thiss!1305)))))

(declare-fun b!122282 () Bool)

(declare-fun e!80106 () Bool)

(declare-fun e!80108 () Bool)

(assert (=> b!122282 (= e!80106 e!80108)))

(declare-fun res!101323 () Bool)

(assert (=> b!122282 (=> (not res!101323) (not e!80108))))

(declare-fun lt!192272 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!122282 (= res!101323 (validate_offset_bits!1 ((_ sign_extend 32) (size!2447 (buf!2887 thiss!1305))) ((_ sign_extend 32) (currentByte!5584 thiss!1305)) ((_ sign_extend 32) (currentBit!5579 thiss!1305)) lt!192272))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!122282 (= lt!192272 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!122284 () Bool)

(declare-fun e!80109 () Bool)

(declare-fun array_inv!2249 (array!5410) Bool)

(assert (=> b!122284 (= e!80109 (array_inv!2249 (buf!2887 thiss!1305)))))

(declare-fun b!122285 () Bool)

(declare-fun e!80103 () Bool)

(declare-datatypes ((tuple2!10298 0))(
  ( (tuple2!10299 (_1!5414 BitStream!4368) (_2!5414 Bool)) )
))
(declare-fun lt!192263 () tuple2!10298)

(assert (=> b!122285 (= e!80103 (= (bitIndex!0 (size!2447 (buf!2887 (_1!5414 lt!192263))) (currentByte!5584 (_1!5414 lt!192263)) (currentBit!5579 (_1!5414 lt!192263))) lt!192266))))

(declare-fun b!122286 () Bool)

(declare-fun e!80104 () Bool)

(declare-fun lt!192278 () tuple2!10296)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!122286 (= e!80104 (invariant!0 (currentBit!5579 thiss!1305) (currentByte!5584 thiss!1305) (size!2447 (buf!2887 (_2!5413 lt!192278)))))))

(declare-fun b!122287 () Bool)

(declare-fun res!101322 () Bool)

(assert (=> b!122287 (=> (not res!101322) (not e!80108))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!122287 (= res!101322 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!122288 () Bool)

(declare-fun res!101319 () Bool)

(assert (=> b!122288 (=> (not res!101319) (not e!80108))))

(assert (=> b!122288 (= res!101319 (bvslt i!615 nBits!396))))

(declare-fun b!122289 () Bool)

(declare-fun res!101316 () Bool)

(assert (=> b!122289 (=> (not res!101316) (not e!80104))))

(assert (=> b!122289 (= res!101316 (invariant!0 (currentBit!5579 thiss!1305) (currentByte!5584 thiss!1305) (size!2447 (buf!2887 (_2!5413 lt!192261)))))))

(declare-fun b!122283 () Bool)

(declare-fun e!80105 () Bool)

(declare-fun lt!192276 () tuple2!10298)

(declare-fun lt!192273 () tuple2!10298)

(assert (=> b!122283 (= e!80105 (= (_2!5414 lt!192276) (_2!5414 lt!192273)))))

(declare-fun res!101318 () Bool)

(assert (=> start!24160 (=> (not res!101318) (not e!80106))))

(assert (=> start!24160 (= res!101318 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!24160 e!80106))

(assert (=> start!24160 true))

(declare-fun inv!12 (BitStream!4368) Bool)

(assert (=> start!24160 (and (inv!12 thiss!1305) e!80109)))

(declare-fun lt!192275 () BitStream!4368)

(declare-fun b!122290 () Bool)

(declare-fun lt!192253 () (_ BitVec 64))

(declare-datatypes ((tuple2!10300 0))(
  ( (tuple2!10301 (_1!5415 BitStream!4368) (_2!5415 BitStream!4368)) )
))
(declare-fun lt!192264 () tuple2!10300)

(declare-fun lt!192255 () tuple2!10300)

(declare-datatypes ((tuple2!10302 0))(
  ( (tuple2!10303 (_1!5416 BitStream!4368) (_2!5416 (_ BitVec 64))) )
))
(declare-fun lt!192267 () tuple2!10302)

(declare-fun lt!192260 () (_ BitVec 64))

(declare-fun lt!192270 () tuple2!10302)

(declare-fun e!80102 () Bool)

(assert (=> b!122290 (= e!80102 (and (= lt!192260 (bvsub lt!192253 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!5415 lt!192255) lt!192275)) (and (= (_2!5416 lt!192270) (_2!5416 lt!192267)) (= (_1!5416 lt!192270) (_2!5415 lt!192264))))))))

(declare-fun e!80100 () Bool)

(declare-fun lt!192251 () (_ BitVec 64))

(declare-fun b!122291 () Bool)

(assert (=> b!122291 (= e!80100 (or (not (= (_1!5415 lt!192255) lt!192275)) (not (= (size!2447 (buf!2887 thiss!1305)) (size!2447 (buf!2887 (_2!5413 lt!192278))))) (not (= lt!192251 (bvadd lt!192260 lt!192272))) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000))))))

(assert (=> b!122291 e!80102))

(declare-fun res!101321 () Bool)

(assert (=> b!122291 (=> (not res!101321) (not e!80102))))

(declare-fun withMovedBitIndex!0 (BitStream!4368 (_ BitVec 64)) BitStream!4368)

(assert (=> b!122291 (= res!101321 (= (_1!5415 lt!192255) (withMovedBitIndex!0 (_2!5415 lt!192255) (bvsub lt!192253 lt!192251))))))

(assert (=> b!122291 (= lt!192253 (bitIndex!0 (size!2447 (buf!2887 (_2!5413 lt!192261))) (currentByte!5584 (_2!5413 lt!192261)) (currentBit!5579 (_2!5413 lt!192261))))))

(assert (=> b!122291 (= (_1!5415 lt!192264) (withMovedBitIndex!0 (_2!5415 lt!192264) (bvsub lt!192260 lt!192251)))))

(assert (=> b!122291 (= lt!192251 (bitIndex!0 (size!2447 (buf!2887 (_2!5413 lt!192278))) (currentByte!5584 (_2!5413 lt!192278)) (currentBit!5579 (_2!5413 lt!192278))))))

(assert (=> b!122291 (= lt!192260 (bitIndex!0 (size!2447 (buf!2887 thiss!1305)) (currentByte!5584 thiss!1305) (currentBit!5579 thiss!1305)))))

(declare-fun lt!192269 () tuple2!10302)

(assert (=> b!122291 (and (= (_2!5416 lt!192270) (_2!5416 lt!192269)) (= (_1!5416 lt!192270) (_1!5416 lt!192269)))))

(declare-fun lt!192256 () (_ BitVec 64))

(declare-fun lt!192274 () Unit!7533)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4368 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7533)

(assert (=> b!122291 (= lt!192274 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5415 lt!192264) nBits!396 i!615 lt!192256))))

(declare-fun lt!192265 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4368 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10302)

(assert (=> b!122291 (= lt!192269 (readNLeastSignificantBitsLoopPure!0 lt!192275 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!192265))))

(assert (=> b!122291 (= lt!192275 (withMovedBitIndex!0 (_1!5415 lt!192264) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!122292 () Bool)

(assert (=> b!122292 (= e!80108 (not e!80100))))

(declare-fun res!101313 () Bool)

(assert (=> b!122292 (=> res!101313 e!80100)))

(assert (=> b!122292 (= res!101313 (not (= (_1!5416 lt!192267) (_2!5415 lt!192255))))))

(assert (=> b!122292 (= lt!192267 (readNLeastSignificantBitsLoopPure!0 (_1!5415 lt!192255) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!192265))))

(declare-fun lt!192268 () (_ BitVec 64))

(assert (=> b!122292 (validate_offset_bits!1 ((_ sign_extend 32) (size!2447 (buf!2887 (_2!5413 lt!192278)))) ((_ sign_extend 32) (currentByte!5584 (_2!5413 lt!192261))) ((_ sign_extend 32) (currentBit!5579 (_2!5413 lt!192261))) lt!192268)))

(declare-fun lt!192259 () Unit!7533)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4368 array!5410 (_ BitVec 64)) Unit!7533)

(assert (=> b!122292 (= lt!192259 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5413 lt!192261) (buf!2887 (_2!5413 lt!192278)) lt!192268))))

(assert (=> b!122292 (= lt!192268 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!192279 () tuple2!10298)

(declare-fun lt!192271 () (_ BitVec 64))

(assert (=> b!122292 (= lt!192265 (bvor lt!192256 (ite (_2!5414 lt!192279) lt!192271 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!122292 (= lt!192270 (readNLeastSignificantBitsLoopPure!0 (_1!5415 lt!192264) nBits!396 i!615 lt!192256))))

(assert (=> b!122292 (validate_offset_bits!1 ((_ sign_extend 32) (size!2447 (buf!2887 (_2!5413 lt!192278)))) ((_ sign_extend 32) (currentByte!5584 thiss!1305)) ((_ sign_extend 32) (currentBit!5579 thiss!1305)) lt!192272)))

(declare-fun lt!192277 () Unit!7533)

(assert (=> b!122292 (= lt!192277 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2887 (_2!5413 lt!192278)) lt!192272))))

(assert (=> b!122292 (= lt!192256 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!192257 () Bool)

(assert (=> b!122292 (= (_2!5414 lt!192279) lt!192257)))

(declare-fun readBitPure!0 (BitStream!4368) tuple2!10298)

(assert (=> b!122292 (= lt!192279 (readBitPure!0 (_1!5415 lt!192264)))))

(declare-fun reader!0 (BitStream!4368 BitStream!4368) tuple2!10300)

(assert (=> b!122292 (= lt!192255 (reader!0 (_2!5413 lt!192261) (_2!5413 lt!192278)))))

(assert (=> b!122292 (= lt!192264 (reader!0 thiss!1305 (_2!5413 lt!192278)))))

(assert (=> b!122292 e!80105))

(declare-fun res!101317 () Bool)

(assert (=> b!122292 (=> (not res!101317) (not e!80105))))

(assert (=> b!122292 (= res!101317 (= (bitIndex!0 (size!2447 (buf!2887 (_1!5414 lt!192276))) (currentByte!5584 (_1!5414 lt!192276)) (currentBit!5579 (_1!5414 lt!192276))) (bitIndex!0 (size!2447 (buf!2887 (_1!5414 lt!192273))) (currentByte!5584 (_1!5414 lt!192273)) (currentBit!5579 (_1!5414 lt!192273)))))))

(declare-fun lt!192258 () Unit!7533)

(declare-fun lt!192252 () BitStream!4368)

(declare-fun readBitPrefixLemma!0 (BitStream!4368 BitStream!4368) Unit!7533)

(assert (=> b!122292 (= lt!192258 (readBitPrefixLemma!0 lt!192252 (_2!5413 lt!192278)))))

(assert (=> b!122292 (= lt!192273 (readBitPure!0 (BitStream!4369 (buf!2887 (_2!5413 lt!192278)) (currentByte!5584 thiss!1305) (currentBit!5579 thiss!1305))))))

(assert (=> b!122292 (= lt!192276 (readBitPure!0 lt!192252))))

(assert (=> b!122292 (= lt!192252 (BitStream!4369 (buf!2887 (_2!5413 lt!192261)) (currentByte!5584 thiss!1305) (currentBit!5579 thiss!1305)))))

(assert (=> b!122292 e!80104))

(declare-fun res!101314 () Bool)

(assert (=> b!122292 (=> (not res!101314) (not e!80104))))

(assert (=> b!122292 (= res!101314 (isPrefixOf!0 thiss!1305 (_2!5413 lt!192278)))))

(declare-fun lt!192262 () Unit!7533)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4368 BitStream!4368 BitStream!4368) Unit!7533)

(assert (=> b!122292 (= lt!192262 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5413 lt!192261) (_2!5413 lt!192278)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4368 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!10296)

(assert (=> b!122292 (= lt!192278 (appendNLeastSignificantBitsLoop!0 (_2!5413 lt!192261) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!122292 e!80099))

(declare-fun res!101325 () Bool)

(assert (=> b!122292 (=> (not res!101325) (not e!80099))))

(assert (=> b!122292 (= res!101325 (= (size!2447 (buf!2887 thiss!1305)) (size!2447 (buf!2887 (_2!5413 lt!192261)))))))

(declare-fun appendBit!0 (BitStream!4368 Bool) tuple2!10296)

(assert (=> b!122292 (= lt!192261 (appendBit!0 thiss!1305 lt!192257))))

(assert (=> b!122292 (= lt!192257 (not (= (bvand v!199 lt!192271) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!122292 (= lt!192271 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!122293 () Bool)

(assert (=> b!122293 (= e!80101 e!80103)))

(declare-fun res!101315 () Bool)

(assert (=> b!122293 (=> (not res!101315) (not e!80103))))

(assert (=> b!122293 (= res!101315 (and (= (_2!5414 lt!192263) lt!192257) (= (_1!5414 lt!192263) (_2!5413 lt!192261))))))

(declare-fun readerFrom!0 (BitStream!4368 (_ BitVec 32) (_ BitVec 32)) BitStream!4368)

(assert (=> b!122293 (= lt!192263 (readBitPure!0 (readerFrom!0 (_2!5413 lt!192261) (currentBit!5579 thiss!1305) (currentByte!5584 thiss!1305))))))

(assert (= (and start!24160 res!101318) b!122282))

(assert (= (and b!122282 res!101323) b!122287))

(assert (= (and b!122287 res!101322) b!122288))

(assert (= (and b!122288 res!101319) b!122292))

(assert (= (and b!122292 res!101325) b!122281))

(assert (= (and b!122281 res!101324) b!122280))

(assert (= (and b!122280 res!101320) b!122293))

(assert (= (and b!122293 res!101315) b!122285))

(assert (= (and b!122292 res!101314) b!122289))

(assert (= (and b!122289 res!101316) b!122286))

(assert (= (and b!122292 res!101317) b!122283))

(assert (= (and b!122292 (not res!101313)) b!122291))

(assert (= (and b!122291 res!101321) b!122290))

(assert (= start!24160 b!122284))

(declare-fun m!185677 () Bool)

(assert (=> b!122280 m!185677))

(declare-fun m!185679 () Bool)

(assert (=> b!122292 m!185679))

(declare-fun m!185681 () Bool)

(assert (=> b!122292 m!185681))

(declare-fun m!185683 () Bool)

(assert (=> b!122292 m!185683))

(declare-fun m!185685 () Bool)

(assert (=> b!122292 m!185685))

(declare-fun m!185687 () Bool)

(assert (=> b!122292 m!185687))

(declare-fun m!185689 () Bool)

(assert (=> b!122292 m!185689))

(declare-fun m!185691 () Bool)

(assert (=> b!122292 m!185691))

(declare-fun m!185693 () Bool)

(assert (=> b!122292 m!185693))

(declare-fun m!185695 () Bool)

(assert (=> b!122292 m!185695))

(declare-fun m!185697 () Bool)

(assert (=> b!122292 m!185697))

(declare-fun m!185699 () Bool)

(assert (=> b!122292 m!185699))

(declare-fun m!185701 () Bool)

(assert (=> b!122292 m!185701))

(declare-fun m!185703 () Bool)

(assert (=> b!122292 m!185703))

(declare-fun m!185705 () Bool)

(assert (=> b!122292 m!185705))

(declare-fun m!185707 () Bool)

(assert (=> b!122292 m!185707))

(declare-fun m!185709 () Bool)

(assert (=> b!122292 m!185709))

(declare-fun m!185711 () Bool)

(assert (=> b!122292 m!185711))

(declare-fun m!185713 () Bool)

(assert (=> b!122292 m!185713))

(declare-fun m!185715 () Bool)

(assert (=> b!122292 m!185715))

(declare-fun m!185717 () Bool)

(assert (=> b!122284 m!185717))

(declare-fun m!185719 () Bool)

(assert (=> b!122289 m!185719))

(declare-fun m!185721 () Bool)

(assert (=> b!122282 m!185721))

(declare-fun m!185723 () Bool)

(assert (=> b!122293 m!185723))

(assert (=> b!122293 m!185723))

(declare-fun m!185725 () Bool)

(assert (=> b!122293 m!185725))

(declare-fun m!185727 () Bool)

(assert (=> start!24160 m!185727))

(declare-fun m!185729 () Bool)

(assert (=> b!122281 m!185729))

(declare-fun m!185731 () Bool)

(assert (=> b!122281 m!185731))

(declare-fun m!185733 () Bool)

(assert (=> b!122291 m!185733))

(declare-fun m!185735 () Bool)

(assert (=> b!122291 m!185735))

(declare-fun m!185737 () Bool)

(assert (=> b!122291 m!185737))

(assert (=> b!122291 m!185729))

(assert (=> b!122291 m!185731))

(declare-fun m!185739 () Bool)

(assert (=> b!122291 m!185739))

(declare-fun m!185741 () Bool)

(assert (=> b!122291 m!185741))

(declare-fun m!185743 () Bool)

(assert (=> b!122291 m!185743))

(declare-fun m!185745 () Bool)

(assert (=> b!122285 m!185745))

(declare-fun m!185747 () Bool)

(assert (=> b!122287 m!185747))

(declare-fun m!185749 () Bool)

(assert (=> b!122286 m!185749))

(check-sat (not b!122281) (not b!122286) (not b!122293) (not b!122292) (not b!122289) (not b!122280) (not start!24160) (not b!122291) (not b!122282) (not b!122287) (not b!122285) (not b!122284))
(check-sat)
