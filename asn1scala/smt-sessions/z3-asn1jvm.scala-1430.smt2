; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39292 () Bool)

(assert start!39292)

(declare-fun b!176643 () Bool)

(declare-fun e!123124 () Bool)

(declare-fun e!123123 () Bool)

(assert (=> b!176643 (= e!123124 (not e!123123))))

(declare-fun res!146364 () Bool)

(assert (=> b!176643 (=> res!146364 e!123123)))

(declare-datatypes ((array!9535 0))(
  ( (array!9536 (arr!5135 (Array (_ BitVec 32) (_ BitVec 8))) (size!4205 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7518 0))(
  ( (BitStream!7519 (buf!4648 array!9535) (currentByte!8810 (_ BitVec 32)) (currentBit!8805 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!12724 0))(
  ( (Unit!12725) )
))
(declare-datatypes ((tuple2!15204 0))(
  ( (tuple2!15205 (_1!8247 Unit!12724) (_2!8247 BitStream!7518)) )
))
(declare-fun lt!271851 () tuple2!15204)

(declare-fun thiss!1204 () BitStream!7518)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!176643 (= res!146364 (not (= (bitIndex!0 (size!4205 (buf!4648 (_2!8247 lt!271851))) (currentByte!8810 (_2!8247 lt!271851)) (currentBit!8805 (_2!8247 lt!271851))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4205 (buf!4648 thiss!1204)) (currentByte!8810 thiss!1204) (currentBit!8805 thiss!1204))))))))

(declare-fun e!123121 () Bool)

(assert (=> b!176643 e!123121))

(declare-fun res!146361 () Bool)

(assert (=> b!176643 (=> (not res!146361) (not e!123121))))

(assert (=> b!176643 (= res!146361 (= (size!4205 (buf!4648 thiss!1204)) (size!4205 (buf!4648 (_2!8247 lt!271851)))))))

(declare-fun lt!271849 () Bool)

(declare-fun appendBit!0 (BitStream!7518 Bool) tuple2!15204)

(assert (=> b!176643 (= lt!271851 (appendBit!0 thiss!1204 lt!271849))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!176643 (= lt!271849 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!176644 () Bool)

(declare-fun res!146360 () Bool)

(assert (=> b!176644 (=> (not res!146360) (not e!123124))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!176644 (= res!146360 (invariant!0 (currentBit!8805 thiss!1204) (currentByte!8810 thiss!1204) (size!4205 (buf!4648 thiss!1204))))))

(declare-fun b!176645 () Bool)

(assert (=> b!176645 (= e!123123 (invariant!0 (currentBit!8805 (_2!8247 lt!271851)) (currentByte!8810 (_2!8247 lt!271851)) (size!4205 (buf!4648 (_2!8247 lt!271851)))))))

(declare-fun b!176646 () Bool)

(declare-fun e!123127 () Bool)

(declare-fun e!123122 () Bool)

(assert (=> b!176646 (= e!123127 e!123122)))

(declare-fun res!146363 () Bool)

(assert (=> b!176646 (=> (not res!146363) (not e!123122))))

(declare-datatypes ((tuple2!15206 0))(
  ( (tuple2!15207 (_1!8248 BitStream!7518) (_2!8248 Bool)) )
))
(declare-fun lt!271850 () tuple2!15206)

(assert (=> b!176646 (= res!146363 (and (= (_2!8248 lt!271850) lt!271849) (= (_1!8248 lt!271850) (_2!8247 lt!271851))))))

(declare-fun readBitPure!0 (BitStream!7518) tuple2!15206)

(declare-fun readerFrom!0 (BitStream!7518 (_ BitVec 32) (_ BitVec 32)) BitStream!7518)

(assert (=> b!176646 (= lt!271850 (readBitPure!0 (readerFrom!0 (_2!8247 lt!271851) (currentBit!8805 thiss!1204) (currentByte!8810 thiss!1204))))))

(declare-fun b!176647 () Bool)

(declare-fun lt!271852 () (_ BitVec 64))

(assert (=> b!176647 (= e!123122 (= (bitIndex!0 (size!4205 (buf!4648 (_1!8248 lt!271850))) (currentByte!8810 (_1!8248 lt!271850)) (currentBit!8805 (_1!8248 lt!271850))) lt!271852))))

(declare-fun b!176648 () Bool)

(declare-fun res!146356 () Bool)

(assert (=> b!176648 (=> (not res!146356) (not e!123127))))

(declare-fun isPrefixOf!0 (BitStream!7518 BitStream!7518) Bool)

(assert (=> b!176648 (= res!146356 (isPrefixOf!0 thiss!1204 (_2!8247 lt!271851)))))

(declare-fun res!146359 () Bool)

(assert (=> start!39292 (=> (not res!146359) (not e!123124))))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> start!39292 (= res!146359 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39292 e!123124))

(assert (=> start!39292 true))

(declare-fun e!123125 () Bool)

(declare-fun inv!12 (BitStream!7518) Bool)

(assert (=> start!39292 (and (inv!12 thiss!1204) e!123125)))

(declare-fun b!176649 () Bool)

(assert (=> b!176649 (= e!123121 e!123127)))

(declare-fun res!146358 () Bool)

(assert (=> b!176649 (=> (not res!146358) (not e!123127))))

(declare-fun lt!271853 () (_ BitVec 64))

(assert (=> b!176649 (= res!146358 (= lt!271852 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!271853)))))

(assert (=> b!176649 (= lt!271852 (bitIndex!0 (size!4205 (buf!4648 (_2!8247 lt!271851))) (currentByte!8810 (_2!8247 lt!271851)) (currentBit!8805 (_2!8247 lt!271851))))))

(assert (=> b!176649 (= lt!271853 (bitIndex!0 (size!4205 (buf!4648 thiss!1204)) (currentByte!8810 thiss!1204) (currentBit!8805 thiss!1204)))))

(declare-fun b!176650 () Bool)

(declare-fun array_inv!3946 (array!9535) Bool)

(assert (=> b!176650 (= e!123125 (array_inv!3946 (buf!4648 thiss!1204)))))

(declare-fun b!176651 () Bool)

(declare-fun res!146362 () Bool)

(assert (=> b!176651 (=> (not res!146362) (not e!123124))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!176651 (= res!146362 (validate_offset_bits!1 ((_ sign_extend 32) (size!4205 (buf!4648 thiss!1204))) ((_ sign_extend 32) (currentByte!8810 thiss!1204)) ((_ sign_extend 32) (currentBit!8805 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!176652 () Bool)

(declare-fun res!146357 () Bool)

(assert (=> b!176652 (=> (not res!146357) (not e!123124))))

(assert (=> b!176652 (= res!146357 (not (= i!590 nBits!348)))))

(assert (= (and start!39292 res!146359) b!176651))

(assert (= (and b!176651 res!146362) b!176644))

(assert (= (and b!176644 res!146360) b!176652))

(assert (= (and b!176652 res!146357) b!176643))

(assert (= (and b!176643 res!146361) b!176649))

(assert (= (and b!176649 res!146358) b!176648))

(assert (= (and b!176648 res!146356) b!176646))

(assert (= (and b!176646 res!146363) b!176647))

(assert (= (and b!176643 (not res!146364)) b!176645))

(assert (= start!39292 b!176650))

(declare-fun m!276709 () Bool)

(assert (=> b!176643 m!276709))

(declare-fun m!276711 () Bool)

(assert (=> b!176643 m!276711))

(declare-fun m!276713 () Bool)

(assert (=> b!176643 m!276713))

(declare-fun m!276715 () Bool)

(assert (=> b!176647 m!276715))

(declare-fun m!276717 () Bool)

(assert (=> b!176648 m!276717))

(declare-fun m!276719 () Bool)

(assert (=> b!176650 m!276719))

(declare-fun m!276721 () Bool)

(assert (=> b!176651 m!276721))

(assert (=> b!176649 m!276709))

(assert (=> b!176649 m!276711))

(declare-fun m!276723 () Bool)

(assert (=> b!176644 m!276723))

(declare-fun m!276725 () Bool)

(assert (=> b!176645 m!276725))

(declare-fun m!276727 () Bool)

(assert (=> b!176646 m!276727))

(assert (=> b!176646 m!276727))

(declare-fun m!276729 () Bool)

(assert (=> b!176646 m!276729))

(declare-fun m!276731 () Bool)

(assert (=> start!39292 m!276731))

(check-sat (not b!176644) (not b!176649) (not b!176650) (not b!176646) (not start!39292) (not b!176651) (not b!176648) (not b!176647) (not b!176643) (not b!176645))
(check-sat)
(get-model)

(declare-fun d!62287 () Bool)

(assert (=> d!62287 (= (inv!12 thiss!1204) (invariant!0 (currentBit!8805 thiss!1204) (currentByte!8810 thiss!1204) (size!4205 (buf!4648 thiss!1204))))))

(declare-fun bs!15535 () Bool)

(assert (= bs!15535 d!62287))

(assert (=> bs!15535 m!276723))

(assert (=> start!39292 d!62287))

(declare-fun d!62289 () Bool)

(assert (=> d!62289 (= (array_inv!3946 (buf!4648 thiss!1204)) (bvsge (size!4205 (buf!4648 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!176650 d!62289))

(declare-fun d!62291 () Bool)

(assert (=> d!62291 (= (invariant!0 (currentBit!8805 (_2!8247 lt!271851)) (currentByte!8810 (_2!8247 lt!271851)) (size!4205 (buf!4648 (_2!8247 lt!271851)))) (and (bvsge (currentBit!8805 (_2!8247 lt!271851)) #b00000000000000000000000000000000) (bvslt (currentBit!8805 (_2!8247 lt!271851)) #b00000000000000000000000000001000) (bvsge (currentByte!8810 (_2!8247 lt!271851)) #b00000000000000000000000000000000) (or (bvslt (currentByte!8810 (_2!8247 lt!271851)) (size!4205 (buf!4648 (_2!8247 lt!271851)))) (and (= (currentBit!8805 (_2!8247 lt!271851)) #b00000000000000000000000000000000) (= (currentByte!8810 (_2!8247 lt!271851)) (size!4205 (buf!4648 (_2!8247 lt!271851))))))))))

(assert (=> b!176645 d!62291))

(declare-fun d!62293 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!62293 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4205 (buf!4648 thiss!1204))) ((_ sign_extend 32) (currentByte!8810 thiss!1204)) ((_ sign_extend 32) (currentBit!8805 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4205 (buf!4648 thiss!1204))) ((_ sign_extend 32) (currentByte!8810 thiss!1204)) ((_ sign_extend 32) (currentBit!8805 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!15536 () Bool)

(assert (= bs!15536 d!62293))

(declare-fun m!276757 () Bool)

(assert (=> bs!15536 m!276757))

(assert (=> b!176651 d!62293))

(declare-fun d!62295 () Bool)

(declare-datatypes ((tuple2!15212 0))(
  ( (tuple2!15213 (_1!8251 Bool) (_2!8251 BitStream!7518)) )
))
(declare-fun lt!271871 () tuple2!15212)

(declare-fun readBit!0 (BitStream!7518) tuple2!15212)

(assert (=> d!62295 (= lt!271871 (readBit!0 (readerFrom!0 (_2!8247 lt!271851) (currentBit!8805 thiss!1204) (currentByte!8810 thiss!1204))))))

(assert (=> d!62295 (= (readBitPure!0 (readerFrom!0 (_2!8247 lt!271851) (currentBit!8805 thiss!1204) (currentByte!8810 thiss!1204))) (tuple2!15207 (_2!8251 lt!271871) (_1!8251 lt!271871)))))

(declare-fun bs!15537 () Bool)

(assert (= bs!15537 d!62295))

(assert (=> bs!15537 m!276727))

(declare-fun m!276759 () Bool)

(assert (=> bs!15537 m!276759))

(assert (=> b!176646 d!62295))

(declare-fun d!62297 () Bool)

(declare-fun e!123151 () Bool)

(assert (=> d!62297 e!123151))

(declare-fun res!146395 () Bool)

(assert (=> d!62297 (=> (not res!146395) (not e!123151))))

(assert (=> d!62297 (= res!146395 (invariant!0 (currentBit!8805 (_2!8247 lt!271851)) (currentByte!8810 (_2!8247 lt!271851)) (size!4205 (buf!4648 (_2!8247 lt!271851)))))))

(assert (=> d!62297 (= (readerFrom!0 (_2!8247 lt!271851) (currentBit!8805 thiss!1204) (currentByte!8810 thiss!1204)) (BitStream!7519 (buf!4648 (_2!8247 lt!271851)) (currentByte!8810 thiss!1204) (currentBit!8805 thiss!1204)))))

(declare-fun b!176685 () Bool)

(assert (=> b!176685 (= e!123151 (invariant!0 (currentBit!8805 thiss!1204) (currentByte!8810 thiss!1204) (size!4205 (buf!4648 (_2!8247 lt!271851)))))))

(assert (= (and d!62297 res!146395) b!176685))

(assert (=> d!62297 m!276725))

(declare-fun m!276761 () Bool)

(assert (=> b!176685 m!276761))

(assert (=> b!176646 d!62297))

(declare-fun d!62299 () Bool)

(declare-fun e!123157 () Bool)

(assert (=> d!62299 e!123157))

(declare-fun res!146406 () Bool)

(assert (=> d!62299 (=> (not res!146406) (not e!123157))))

(declare-fun lt!271905 () (_ BitVec 64))

(declare-fun lt!271907 () (_ BitVec 64))

(declare-fun lt!271904 () (_ BitVec 64))

(assert (=> d!62299 (= res!146406 (= lt!271907 (bvsub lt!271904 lt!271905)))))

(assert (=> d!62299 (or (= (bvand lt!271904 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!271905 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!271904 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!271904 lt!271905) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62299 (= lt!271905 (remainingBits!0 ((_ sign_extend 32) (size!4205 (buf!4648 (_1!8248 lt!271850)))) ((_ sign_extend 32) (currentByte!8810 (_1!8248 lt!271850))) ((_ sign_extend 32) (currentBit!8805 (_1!8248 lt!271850)))))))

(declare-fun lt!271902 () (_ BitVec 64))

(declare-fun lt!271906 () (_ BitVec 64))

(assert (=> d!62299 (= lt!271904 (bvmul lt!271902 lt!271906))))

(assert (=> d!62299 (or (= lt!271902 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!271906 (bvsdiv (bvmul lt!271902 lt!271906) lt!271902)))))

(assert (=> d!62299 (= lt!271906 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62299 (= lt!271902 ((_ sign_extend 32) (size!4205 (buf!4648 (_1!8248 lt!271850)))))))

(assert (=> d!62299 (= lt!271907 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8810 (_1!8248 lt!271850))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8805 (_1!8248 lt!271850)))))))

(assert (=> d!62299 (invariant!0 (currentBit!8805 (_1!8248 lt!271850)) (currentByte!8810 (_1!8248 lt!271850)) (size!4205 (buf!4648 (_1!8248 lt!271850))))))

(assert (=> d!62299 (= (bitIndex!0 (size!4205 (buf!4648 (_1!8248 lt!271850))) (currentByte!8810 (_1!8248 lt!271850)) (currentBit!8805 (_1!8248 lt!271850))) lt!271907)))

(declare-fun b!176696 () Bool)

(declare-fun res!146407 () Bool)

(assert (=> b!176696 (=> (not res!146407) (not e!123157))))

(assert (=> b!176696 (= res!146407 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!271907))))

(declare-fun b!176697 () Bool)

(declare-fun lt!271903 () (_ BitVec 64))

(assert (=> b!176697 (= e!123157 (bvsle lt!271907 (bvmul lt!271903 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!176697 (or (= lt!271903 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!271903 #b0000000000000000000000000000000000000000000000000000000000001000) lt!271903)))))

(assert (=> b!176697 (= lt!271903 ((_ sign_extend 32) (size!4205 (buf!4648 (_1!8248 lt!271850)))))))

(assert (= (and d!62299 res!146406) b!176696))

(assert (= (and b!176696 res!146407) b!176697))

(declare-fun m!276769 () Bool)

(assert (=> d!62299 m!276769))

(declare-fun m!276771 () Bool)

(assert (=> d!62299 m!276771))

(assert (=> b!176647 d!62299))

(declare-fun d!62309 () Bool)

(declare-fun res!146425 () Bool)

(declare-fun e!123169 () Bool)

(assert (=> d!62309 (=> (not res!146425) (not e!123169))))

(assert (=> d!62309 (= res!146425 (= (size!4205 (buf!4648 thiss!1204)) (size!4205 (buf!4648 (_2!8247 lt!271851)))))))

(assert (=> d!62309 (= (isPrefixOf!0 thiss!1204 (_2!8247 lt!271851)) e!123169)))

(declare-fun b!176713 () Bool)

(declare-fun res!146426 () Bool)

(assert (=> b!176713 (=> (not res!146426) (not e!123169))))

(assert (=> b!176713 (= res!146426 (bvsle (bitIndex!0 (size!4205 (buf!4648 thiss!1204)) (currentByte!8810 thiss!1204) (currentBit!8805 thiss!1204)) (bitIndex!0 (size!4205 (buf!4648 (_2!8247 lt!271851))) (currentByte!8810 (_2!8247 lt!271851)) (currentBit!8805 (_2!8247 lt!271851)))))))

(declare-fun b!176714 () Bool)

(declare-fun e!123168 () Bool)

(assert (=> b!176714 (= e!123169 e!123168)))

(declare-fun res!146424 () Bool)

(assert (=> b!176714 (=> res!146424 e!123168)))

(assert (=> b!176714 (= res!146424 (= (size!4205 (buf!4648 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!176715 () Bool)

(declare-fun arrayBitRangesEq!0 (array!9535 array!9535 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!176715 (= e!123168 (arrayBitRangesEq!0 (buf!4648 thiss!1204) (buf!4648 (_2!8247 lt!271851)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4205 (buf!4648 thiss!1204)) (currentByte!8810 thiss!1204) (currentBit!8805 thiss!1204))))))

(assert (= (and d!62309 res!146425) b!176713))

(assert (= (and b!176713 res!146426) b!176714))

(assert (= (and b!176714 (not res!146424)) b!176715))

(assert (=> b!176713 m!276711))

(assert (=> b!176713 m!276709))

(assert (=> b!176715 m!276711))

(assert (=> b!176715 m!276711))

(declare-fun m!276777 () Bool)

(assert (=> b!176715 m!276777))

(assert (=> b!176648 d!62309))

(declare-fun d!62315 () Bool)

(declare-fun e!123170 () Bool)

(assert (=> d!62315 e!123170))

(declare-fun res!146427 () Bool)

(assert (=> d!62315 (=> (not res!146427) (not e!123170))))

(declare-fun lt!271916 () (_ BitVec 64))

(declare-fun lt!271913 () (_ BitVec 64))

(declare-fun lt!271914 () (_ BitVec 64))

(assert (=> d!62315 (= res!146427 (= lt!271916 (bvsub lt!271913 lt!271914)))))

(assert (=> d!62315 (or (= (bvand lt!271913 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!271914 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!271913 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!271913 lt!271914) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62315 (= lt!271914 (remainingBits!0 ((_ sign_extend 32) (size!4205 (buf!4648 (_2!8247 lt!271851)))) ((_ sign_extend 32) (currentByte!8810 (_2!8247 lt!271851))) ((_ sign_extend 32) (currentBit!8805 (_2!8247 lt!271851)))))))

(declare-fun lt!271911 () (_ BitVec 64))

(declare-fun lt!271915 () (_ BitVec 64))

(assert (=> d!62315 (= lt!271913 (bvmul lt!271911 lt!271915))))

(assert (=> d!62315 (or (= lt!271911 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!271915 (bvsdiv (bvmul lt!271911 lt!271915) lt!271911)))))

(assert (=> d!62315 (= lt!271915 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62315 (= lt!271911 ((_ sign_extend 32) (size!4205 (buf!4648 (_2!8247 lt!271851)))))))

(assert (=> d!62315 (= lt!271916 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8810 (_2!8247 lt!271851))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8805 (_2!8247 lt!271851)))))))

(assert (=> d!62315 (invariant!0 (currentBit!8805 (_2!8247 lt!271851)) (currentByte!8810 (_2!8247 lt!271851)) (size!4205 (buf!4648 (_2!8247 lt!271851))))))

(assert (=> d!62315 (= (bitIndex!0 (size!4205 (buf!4648 (_2!8247 lt!271851))) (currentByte!8810 (_2!8247 lt!271851)) (currentBit!8805 (_2!8247 lt!271851))) lt!271916)))

(declare-fun b!176716 () Bool)

(declare-fun res!146428 () Bool)

(assert (=> b!176716 (=> (not res!146428) (not e!123170))))

(assert (=> b!176716 (= res!146428 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!271916))))

(declare-fun b!176717 () Bool)

(declare-fun lt!271912 () (_ BitVec 64))

(assert (=> b!176717 (= e!123170 (bvsle lt!271916 (bvmul lt!271912 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!176717 (or (= lt!271912 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!271912 #b0000000000000000000000000000000000000000000000000000000000001000) lt!271912)))))

(assert (=> b!176717 (= lt!271912 ((_ sign_extend 32) (size!4205 (buf!4648 (_2!8247 lt!271851)))))))

(assert (= (and d!62315 res!146427) b!176716))

(assert (= (and b!176716 res!146428) b!176717))

(declare-fun m!276779 () Bool)

(assert (=> d!62315 m!276779))

(assert (=> d!62315 m!276725))

(assert (=> b!176643 d!62315))

(declare-fun d!62317 () Bool)

(declare-fun e!123174 () Bool)

(assert (=> d!62317 e!123174))

(declare-fun res!146432 () Bool)

(assert (=> d!62317 (=> (not res!146432) (not e!123174))))

(declare-fun lt!271922 () (_ BitVec 64))

(declare-fun lt!271919 () (_ BitVec 64))

(declare-fun lt!271920 () (_ BitVec 64))

(assert (=> d!62317 (= res!146432 (= lt!271922 (bvsub lt!271919 lt!271920)))))

(assert (=> d!62317 (or (= (bvand lt!271919 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!271920 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!271919 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!271919 lt!271920) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62317 (= lt!271920 (remainingBits!0 ((_ sign_extend 32) (size!4205 (buf!4648 thiss!1204))) ((_ sign_extend 32) (currentByte!8810 thiss!1204)) ((_ sign_extend 32) (currentBit!8805 thiss!1204))))))

(declare-fun lt!271917 () (_ BitVec 64))

(declare-fun lt!271921 () (_ BitVec 64))

(assert (=> d!62317 (= lt!271919 (bvmul lt!271917 lt!271921))))

(assert (=> d!62317 (or (= lt!271917 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!271921 (bvsdiv (bvmul lt!271917 lt!271921) lt!271917)))))

(assert (=> d!62317 (= lt!271921 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62317 (= lt!271917 ((_ sign_extend 32) (size!4205 (buf!4648 thiss!1204))))))

(assert (=> d!62317 (= lt!271922 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8810 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8805 thiss!1204))))))

(assert (=> d!62317 (invariant!0 (currentBit!8805 thiss!1204) (currentByte!8810 thiss!1204) (size!4205 (buf!4648 thiss!1204)))))

(assert (=> d!62317 (= (bitIndex!0 (size!4205 (buf!4648 thiss!1204)) (currentByte!8810 thiss!1204) (currentBit!8805 thiss!1204)) lt!271922)))

(declare-fun b!176721 () Bool)

(declare-fun res!146433 () Bool)

(assert (=> b!176721 (=> (not res!146433) (not e!123174))))

(assert (=> b!176721 (= res!146433 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!271922))))

(declare-fun b!176722 () Bool)

(declare-fun lt!271918 () (_ BitVec 64))

(assert (=> b!176722 (= e!123174 (bvsle lt!271922 (bvmul lt!271918 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!176722 (or (= lt!271918 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!271918 #b0000000000000000000000000000000000000000000000000000000000001000) lt!271918)))))

(assert (=> b!176722 (= lt!271918 ((_ sign_extend 32) (size!4205 (buf!4648 thiss!1204))))))

(assert (= (and d!62317 res!146432) b!176721))

(assert (= (and b!176721 res!146433) b!176722))

(assert (=> d!62317 m!276757))

(assert (=> d!62317 m!276723))

(assert (=> b!176643 d!62317))

(declare-fun b!176756 () Bool)

(declare-fun e!123189 () Bool)

(declare-fun lt!271978 () tuple2!15206)

(declare-fun lt!271981 () tuple2!15204)

(assert (=> b!176756 (= e!123189 (= (bitIndex!0 (size!4205 (buf!4648 (_1!8248 lt!271978))) (currentByte!8810 (_1!8248 lt!271978)) (currentBit!8805 (_1!8248 lt!271978))) (bitIndex!0 (size!4205 (buf!4648 (_2!8247 lt!271981))) (currentByte!8810 (_2!8247 lt!271981)) (currentBit!8805 (_2!8247 lt!271981)))))))

(declare-fun b!176754 () Bool)

(declare-fun res!146463 () Bool)

(declare-fun e!123190 () Bool)

(assert (=> b!176754 (=> (not res!146463) (not e!123190))))

(assert (=> b!176754 (= res!146463 (isPrefixOf!0 thiss!1204 (_2!8247 lt!271981)))))

(declare-fun b!176755 () Bool)

(assert (=> b!176755 (= e!123190 e!123189)))

(declare-fun res!146464 () Bool)

(assert (=> b!176755 (=> (not res!146464) (not e!123189))))

(assert (=> b!176755 (= res!146464 (and (= (_2!8248 lt!271978) lt!271849) (= (_1!8248 lt!271978) (_2!8247 lt!271981))))))

(assert (=> b!176755 (= lt!271978 (readBitPure!0 (readerFrom!0 (_2!8247 lt!271981) (currentBit!8805 thiss!1204) (currentByte!8810 thiss!1204))))))

(declare-fun d!62321 () Bool)

(assert (=> d!62321 e!123190))

(declare-fun res!146466 () Bool)

(assert (=> d!62321 (=> (not res!146466) (not e!123190))))

(assert (=> d!62321 (= res!146466 (= (size!4205 (buf!4648 thiss!1204)) (size!4205 (buf!4648 (_2!8247 lt!271981)))))))

(declare-fun choose!16 (BitStream!7518 Bool) tuple2!15204)

(assert (=> d!62321 (= lt!271981 (choose!16 thiss!1204 lt!271849))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!62321 (validate_offset_bit!0 ((_ sign_extend 32) (size!4205 (buf!4648 thiss!1204))) ((_ sign_extend 32) (currentByte!8810 thiss!1204)) ((_ sign_extend 32) (currentBit!8805 thiss!1204)))))

(assert (=> d!62321 (= (appendBit!0 thiss!1204 lt!271849) lt!271981)))

(declare-fun b!176753 () Bool)

(declare-fun res!146465 () Bool)

(assert (=> b!176753 (=> (not res!146465) (not e!123190))))

(declare-fun lt!271980 () (_ BitVec 64))

(declare-fun lt!271979 () (_ BitVec 64))

(assert (=> b!176753 (= res!146465 (= (bitIndex!0 (size!4205 (buf!4648 (_2!8247 lt!271981))) (currentByte!8810 (_2!8247 lt!271981)) (currentBit!8805 (_2!8247 lt!271981))) (bvadd lt!271979 lt!271980)))))

(assert (=> b!176753 (or (not (= (bvand lt!271979 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!271980 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!271979 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!271979 lt!271980) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!176753 (= lt!271980 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!176753 (= lt!271979 (bitIndex!0 (size!4205 (buf!4648 thiss!1204)) (currentByte!8810 thiss!1204) (currentBit!8805 thiss!1204)))))

(assert (= (and d!62321 res!146466) b!176753))

(assert (= (and b!176753 res!146465) b!176754))

(assert (= (and b!176754 res!146463) b!176755))

(assert (= (and b!176755 res!146464) b!176756))

(declare-fun m!276791 () Bool)

(assert (=> b!176755 m!276791))

(assert (=> b!176755 m!276791))

(declare-fun m!276793 () Bool)

(assert (=> b!176755 m!276793))

(declare-fun m!276795 () Bool)

(assert (=> b!176754 m!276795))

(declare-fun m!276797 () Bool)

(assert (=> b!176756 m!276797))

(declare-fun m!276799 () Bool)

(assert (=> b!176756 m!276799))

(declare-fun m!276801 () Bool)

(assert (=> d!62321 m!276801))

(declare-fun m!276803 () Bool)

(assert (=> d!62321 m!276803))

(assert (=> b!176753 m!276799))

(assert (=> b!176753 m!276711))

(assert (=> b!176643 d!62321))

(assert (=> b!176649 d!62315))

(assert (=> b!176649 d!62317))

(declare-fun d!62341 () Bool)

(assert (=> d!62341 (= (invariant!0 (currentBit!8805 thiss!1204) (currentByte!8810 thiss!1204) (size!4205 (buf!4648 thiss!1204))) (and (bvsge (currentBit!8805 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8805 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8810 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8810 thiss!1204) (size!4205 (buf!4648 thiss!1204))) (and (= (currentBit!8805 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8810 thiss!1204) (size!4205 (buf!4648 thiss!1204)))))))))

(assert (=> b!176644 d!62341))

(check-sat (not d!62297) (not b!176754) (not d!62321) (not b!176755) (not d!62293) (not b!176685) (not d!62317) (not b!176753) (not d!62295) (not b!176756) (not b!176715) (not b!176713) (not d!62287) (not d!62299) (not d!62315))
