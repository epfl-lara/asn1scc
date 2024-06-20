; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17772 () Bool)

(assert start!17772)

(declare-fun b!86402 () Bool)

(declare-fun e!57456 () Bool)

(declare-datatypes ((array!4097 0))(
  ( (array!4098 (arr!2488 (Array (_ BitVec 32) (_ BitVec 8))) (size!1851 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3264 0))(
  ( (BitStream!3265 (buf!2241 array!4097) (currentByte!4447 (_ BitVec 32)) (currentBit!4442 (_ BitVec 32))) )
))
(declare-fun thiss!1152 () BitStream!3264)

(declare-fun array_inv!1697 (array!4097) Bool)

(assert (=> b!86402 (= e!57456 (array_inv!1697 (buf!2241 thiss!1152)))))

(declare-fun b!86403 () Bool)

(declare-fun res!70971 () Bool)

(declare-fun e!57452 () Bool)

(assert (=> b!86403 (=> (not res!70971) (not e!57452))))

(declare-fun thiss!1151 () BitStream!3264)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!86403 (= res!70971 (invariant!0 (currentBit!4442 thiss!1151) (currentByte!4447 thiss!1151) (size!1851 (buf!2241 thiss!1151))))))

(declare-fun b!86404 () Bool)

(declare-fun e!57459 () Bool)

(declare-fun e!57462 () Bool)

(assert (=> b!86404 (= e!57459 e!57462)))

(declare-fun res!70979 () Bool)

(assert (=> b!86404 (=> (not res!70979) (not e!57462))))

(declare-datatypes ((Unit!5718 0))(
  ( (Unit!5719) )
))
(declare-datatypes ((tuple2!7334 0))(
  ( (tuple2!7335 (_1!3892 Unit!5718) (_2!3892 BitStream!3264)) )
))
(declare-fun lt!135129 () tuple2!7334)

(declare-datatypes ((tuple2!7336 0))(
  ( (tuple2!7337 (_1!3893 BitStream!3264) (_2!3893 Bool)) )
))
(declare-fun lt!135124 () tuple2!7336)

(declare-fun lt!135125 () Bool)

(assert (=> b!86404 (= res!70979 (and (= (_2!3893 lt!135124) lt!135125) (= (_1!3893 lt!135124) (_2!3892 lt!135129))))))

(declare-fun readBitPure!0 (BitStream!3264) tuple2!7336)

(declare-fun readerFrom!0 (BitStream!3264 (_ BitVec 32) (_ BitVec 32)) BitStream!3264)

(assert (=> b!86404 (= lt!135124 (readBitPure!0 (readerFrom!0 (_2!3892 lt!135129) (currentBit!4442 thiss!1152) (currentByte!4447 thiss!1152))))))

(declare-fun b!86405 () Bool)

(declare-fun res!70976 () Bool)

(assert (=> b!86405 (=> (not res!70976) (not e!57452))))

(assert (=> b!86405 (= res!70976 (invariant!0 (currentBit!4442 thiss!1152) (currentByte!4447 thiss!1152) (size!1851 (buf!2241 thiss!1152))))))

(declare-fun b!86406 () Bool)

(declare-fun res!70987 () Bool)

(declare-fun e!57453 () Bool)

(assert (=> b!86406 (=> res!70987 e!57453)))

(declare-datatypes ((tuple3!402 0))(
  ( (tuple3!403 (_1!3894 Unit!5718) (_2!3894 BitStream!3264) (_3!225 (_ BitVec 32))) )
))
(declare-fun lt!135127 () tuple3!402)

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> b!86406 (= res!70987 (or (bvsgt (_3!225 lt!135127) nBits!336) (not (= (size!1851 (buf!2241 (_2!3894 lt!135127))) (size!1851 (buf!2241 thiss!1151))))))))

(declare-fun b!86407 () Bool)

(declare-fun lt!135128 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!86407 (= e!57462 (= (bitIndex!0 (size!1851 (buf!2241 (_1!3893 lt!135124))) (currentByte!4447 (_1!3893 lt!135124)) (currentBit!4442 (_1!3893 lt!135124))) lt!135128))))

(declare-fun b!86408 () Bool)

(declare-fun res!70982 () Bool)

(assert (=> b!86408 (=> res!70982 e!57453)))

(assert (=> b!86408 (= res!70982 (not (invariant!0 (currentBit!4442 (_2!3894 lt!135127)) (currentByte!4447 (_2!3894 lt!135127)) (size!1851 (buf!2241 (_2!3894 lt!135127))))))))

(declare-fun b!86409 () Bool)

(declare-fun e!57457 () Bool)

(assert (=> b!86409 (= e!57457 e!57459)))

(declare-fun res!70973 () Bool)

(assert (=> b!86409 (=> (not res!70973) (not e!57459))))

(declare-fun lt!135123 () (_ BitVec 64))

(assert (=> b!86409 (= res!70973 (= lt!135128 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!135123)))))

(assert (=> b!86409 (= lt!135128 (bitIndex!0 (size!1851 (buf!2241 (_2!3892 lt!135129))) (currentByte!4447 (_2!3892 lt!135129)) (currentBit!4442 (_2!3892 lt!135129))))))

(declare-fun res!70972 () Bool)

(assert (=> start!17772 (=> (not res!70972) (not e!57452))))

(assert (=> start!17772 (= res!70972 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17772 e!57452))

(declare-fun inv!12 (BitStream!3264) Bool)

(assert (=> start!17772 (and (inv!12 thiss!1152) e!57456)))

(declare-fun e!57460 () Bool)

(assert (=> start!17772 (and (inv!12 thiss!1151) e!57460)))

(assert (=> start!17772 true))

(declare-fun b!86410 () Bool)

(assert (=> b!86410 (= e!57453 (or (bvsgt ((_ sign_extend 32) (size!1851 (buf!2241 (_2!3894 lt!135127)))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4447 (_2!3894 lt!135127))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4442 (_2!3894 lt!135127))) #b0000000000000000000000000000000001111111111111111111111111111111) (and (bvsge ((_ sign_extend 32) (size!1851 (buf!2241 (_2!3894 lt!135127)))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!4447 (_2!3894 lt!135127))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!4442 (_2!3894 lt!135127))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!86411 () Bool)

(declare-fun res!70983 () Bool)

(assert (=> b!86411 (=> (not res!70983) (not e!57452))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!86411 (= res!70983 (validate_offset_bits!1 ((_ sign_extend 32) (size!1851 (buf!2241 thiss!1151))) ((_ sign_extend 32) (currentByte!4447 thiss!1151)) ((_ sign_extend 32) (currentBit!4442 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!86412 () Bool)

(declare-fun res!70981 () Bool)

(declare-fun e!57454 () Bool)

(assert (=> b!86412 (=> (not res!70981) (not e!57454))))

(declare-fun i!576 () (_ BitVec 32))

(assert (=> b!86412 (= res!70981 (validate_offset_bits!1 ((_ sign_extend 32) (size!1851 (buf!2241 thiss!1152))) ((_ sign_extend 32) (currentByte!4447 thiss!1152)) ((_ sign_extend 32) (currentBit!4442 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!86413 () Bool)

(assert (=> b!86413 (= e!57460 (array_inv!1697 (buf!2241 thiss!1151)))))

(declare-fun b!86414 () Bool)

(assert (=> b!86414 (= e!57452 e!57454)))

(declare-fun res!70969 () Bool)

(assert (=> b!86414 (=> (not res!70969) (not e!57454))))

(declare-fun lt!135126 () (_ BitVec 64))

(assert (=> b!86414 (= res!70969 (= lt!135123 (bvadd lt!135126 ((_ sign_extend 32) i!576))))))

(assert (=> b!86414 (= lt!135123 (bitIndex!0 (size!1851 (buf!2241 thiss!1152)) (currentByte!4447 thiss!1152) (currentBit!4442 thiss!1152)))))

(assert (=> b!86414 (= lt!135126 (bitIndex!0 (size!1851 (buf!2241 thiss!1151)) (currentByte!4447 thiss!1151) (currentBit!4442 thiss!1151)))))

(declare-fun b!86415 () Bool)

(declare-fun res!70975 () Bool)

(assert (=> b!86415 (=> (not res!70975) (not e!57454))))

(assert (=> b!86415 (= res!70975 (bvslt i!576 nBits!336))))

(declare-fun b!86416 () Bool)

(declare-fun res!70974 () Bool)

(assert (=> b!86416 (=> (not res!70974) (not e!57452))))

(assert (=> b!86416 (= res!70974 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!86417 () Bool)

(declare-fun e!57461 () Bool)

(assert (=> b!86417 (= e!57454 (not e!57461))))

(declare-fun res!70977 () Bool)

(assert (=> b!86417 (=> res!70977 e!57461)))

(assert (=> b!86417 (= res!70977 (not (invariant!0 (currentBit!4442 (_2!3892 lt!135129)) (currentByte!4447 (_2!3892 lt!135129)) (size!1851 (buf!2241 (_2!3892 lt!135129))))))))

(assert (=> b!86417 e!57457))

(declare-fun res!70970 () Bool)

(assert (=> b!86417 (=> (not res!70970) (not e!57457))))

(assert (=> b!86417 (= res!70970 (= (size!1851 (buf!2241 thiss!1152)) (size!1851 (buf!2241 (_2!3892 lt!135129)))))))

(declare-fun appendBit!0 (BitStream!3264 Bool) tuple2!7334)

(assert (=> b!86417 (= lt!135129 (appendBit!0 thiss!1152 lt!135125))))

(declare-fun v!179 () (_ BitVec 64))

(assert (=> b!86417 (= lt!135125 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!86418 () Bool)

(declare-fun res!70980 () Bool)

(assert (=> b!86418 (=> res!70980 e!57461)))

(assert (=> b!86418 (= res!70980 (bvsge (bvadd #b00000000000000000000000000000001 i!576) nBits!336))))

(declare-fun b!86419 () Bool)

(assert (=> b!86419 (= e!57461 e!57453)))

(declare-fun res!70984 () Bool)

(assert (=> b!86419 (=> res!70984 e!57453)))

(assert (=> b!86419 (= res!70984 (bvslt (_3!225 lt!135127) #b00000000000000000000000000000000))))

(declare-fun appendBitsLSBFirstWhileWhile!0 ((_ BitVec 32) BitStream!3264 (_ BitVec 64) BitStream!3264 (_ BitVec 32)) tuple3!402)

(assert (=> b!86419 (= lt!135127 (appendBitsLSBFirstWhileWhile!0 nBits!336 thiss!1151 v!179 (_2!3892 lt!135129) (bvadd #b00000000000000000000000000000001 i!576)))))

(declare-fun b!86420 () Bool)

(declare-fun res!70978 () Bool)

(assert (=> b!86420 (=> (not res!70978) (not e!57459))))

(declare-fun isPrefixOf!0 (BitStream!3264 BitStream!3264) Bool)

(assert (=> b!86420 (= res!70978 (isPrefixOf!0 thiss!1152 (_2!3892 lt!135129)))))

(declare-fun b!86421 () Bool)

(declare-fun res!70985 () Bool)

(assert (=> b!86421 (=> res!70985 e!57453)))

(assert (=> b!86421 (= res!70985 (not (= (bitIndex!0 (size!1851 (buf!2241 (_2!3894 lt!135127))) (currentByte!4447 (_2!3894 lt!135127)) (currentBit!4442 (_2!3894 lt!135127))) (bvadd lt!135126 ((_ sign_extend 32) (_3!225 lt!135127))))))))

(declare-fun b!86422 () Bool)

(declare-fun res!70986 () Bool)

(assert (=> b!86422 (=> (not res!70986) (not e!57452))))

(assert (=> b!86422 (= res!70986 (and (bvsle i!576 nBits!336) (= (size!1851 (buf!2241 thiss!1152)) (size!1851 (buf!2241 thiss!1151)))))))

(assert (= (and start!17772 res!70972) b!86411))

(assert (= (and b!86411 res!70983) b!86403))

(assert (= (and b!86403 res!70971) b!86416))

(assert (= (and b!86416 res!70974) b!86405))

(assert (= (and b!86405 res!70976) b!86422))

(assert (= (and b!86422 res!70986) b!86414))

(assert (= (and b!86414 res!70969) b!86412))

(assert (= (and b!86412 res!70981) b!86415))

(assert (= (and b!86415 res!70975) b!86417))

(assert (= (and b!86417 res!70970) b!86409))

(assert (= (and b!86409 res!70973) b!86420))

(assert (= (and b!86420 res!70978) b!86404))

(assert (= (and b!86404 res!70979) b!86407))

(assert (= (and b!86417 (not res!70977)) b!86418))

(assert (= (and b!86418 (not res!70980)) b!86419))

(assert (= (and b!86419 (not res!70984)) b!86408))

(assert (= (and b!86408 (not res!70982)) b!86406))

(assert (= (and b!86406 (not res!70987)) b!86421))

(assert (= (and b!86421 (not res!70985)) b!86410))

(assert (= start!17772 b!86402))

(assert (= start!17772 b!86413))

(declare-fun m!132249 () Bool)

(assert (=> b!86417 m!132249))

(declare-fun m!132251 () Bool)

(assert (=> b!86417 m!132251))

(declare-fun m!132253 () Bool)

(assert (=> b!86421 m!132253))

(declare-fun m!132255 () Bool)

(assert (=> b!86414 m!132255))

(declare-fun m!132257 () Bool)

(assert (=> b!86414 m!132257))

(declare-fun m!132259 () Bool)

(assert (=> b!86411 m!132259))

(declare-fun m!132261 () Bool)

(assert (=> b!86405 m!132261))

(declare-fun m!132263 () Bool)

(assert (=> b!86407 m!132263))

(declare-fun m!132265 () Bool)

(assert (=> b!86420 m!132265))

(declare-fun m!132267 () Bool)

(assert (=> b!86409 m!132267))

(declare-fun m!132269 () Bool)

(assert (=> start!17772 m!132269))

(declare-fun m!132271 () Bool)

(assert (=> start!17772 m!132271))

(declare-fun m!132273 () Bool)

(assert (=> b!86413 m!132273))

(declare-fun m!132275 () Bool)

(assert (=> b!86412 m!132275))

(declare-fun m!132277 () Bool)

(assert (=> b!86408 m!132277))

(declare-fun m!132279 () Bool)

(assert (=> b!86403 m!132279))

(declare-fun m!132281 () Bool)

(assert (=> b!86419 m!132281))

(declare-fun m!132283 () Bool)

(assert (=> b!86402 m!132283))

(declare-fun m!132285 () Bool)

(assert (=> b!86404 m!132285))

(assert (=> b!86404 m!132285))

(declare-fun m!132287 () Bool)

(assert (=> b!86404 m!132287))

(check-sat (not b!86402) (not start!17772) (not b!86405) (not b!86404) (not b!86420) (not b!86413) (not b!86414) (not b!86403) (not b!86409) (not b!86421) (not b!86419) (not b!86417) (not b!86412) (not b!86408) (not b!86411) (not b!86407))
(check-sat)
(get-model)

(declare-fun d!27434 () Bool)

(assert (=> d!27434 (= (invariant!0 (currentBit!4442 thiss!1151) (currentByte!4447 thiss!1151) (size!1851 (buf!2241 thiss!1151))) (and (bvsge (currentBit!4442 thiss!1151) #b00000000000000000000000000000000) (bvslt (currentBit!4442 thiss!1151) #b00000000000000000000000000001000) (bvsge (currentByte!4447 thiss!1151) #b00000000000000000000000000000000) (or (bvslt (currentByte!4447 thiss!1151) (size!1851 (buf!2241 thiss!1151))) (and (= (currentBit!4442 thiss!1151) #b00000000000000000000000000000000) (= (currentByte!4447 thiss!1151) (size!1851 (buf!2241 thiss!1151)))))))))

(assert (=> b!86403 d!27434))

(declare-fun d!27436 () Bool)

(assert (=> d!27436 (= (array_inv!1697 (buf!2241 thiss!1152)) (bvsge (size!1851 (buf!2241 thiss!1152)) #b00000000000000000000000000000000))))

(assert (=> b!86402 d!27436))

(declare-fun d!27438 () Bool)

(assert (=> d!27438 (= (array_inv!1697 (buf!2241 thiss!1151)) (bvsge (size!1851 (buf!2241 thiss!1151)) #b00000000000000000000000000000000))))

(assert (=> b!86413 d!27438))

(declare-fun d!27440 () Bool)

(declare-datatypes ((tuple2!7342 0))(
  ( (tuple2!7343 (_1!3898 Bool) (_2!3898 BitStream!3264)) )
))
(declare-fun lt!135153 () tuple2!7342)

(declare-fun readBit!0 (BitStream!3264) tuple2!7342)

(assert (=> d!27440 (= lt!135153 (readBit!0 (readerFrom!0 (_2!3892 lt!135129) (currentBit!4442 thiss!1152) (currentByte!4447 thiss!1152))))))

(assert (=> d!27440 (= (readBitPure!0 (readerFrom!0 (_2!3892 lt!135129) (currentBit!4442 thiss!1152) (currentByte!4447 thiss!1152))) (tuple2!7337 (_2!3898 lt!135153) (_1!3898 lt!135153)))))

(declare-fun bs!6803 () Bool)

(assert (= bs!6803 d!27440))

(assert (=> bs!6803 m!132285))

(declare-fun m!132329 () Bool)

(assert (=> bs!6803 m!132329))

(assert (=> b!86404 d!27440))

(declare-fun d!27442 () Bool)

(declare-fun e!57498 () Bool)

(assert (=> d!27442 e!57498))

(declare-fun res!71048 () Bool)

(assert (=> d!27442 (=> (not res!71048) (not e!57498))))

(assert (=> d!27442 (= res!71048 (invariant!0 (currentBit!4442 (_2!3892 lt!135129)) (currentByte!4447 (_2!3892 lt!135129)) (size!1851 (buf!2241 (_2!3892 lt!135129)))))))

(assert (=> d!27442 (= (readerFrom!0 (_2!3892 lt!135129) (currentBit!4442 thiss!1152) (currentByte!4447 thiss!1152)) (BitStream!3265 (buf!2241 (_2!3892 lt!135129)) (currentByte!4447 thiss!1152) (currentBit!4442 thiss!1152)))))

(declare-fun b!86488 () Bool)

(assert (=> b!86488 (= e!57498 (invariant!0 (currentBit!4442 thiss!1152) (currentByte!4447 thiss!1152) (size!1851 (buf!2241 (_2!3892 lt!135129)))))))

(assert (= (and d!27442 res!71048) b!86488))

(assert (=> d!27442 m!132249))

(declare-fun m!132331 () Bool)

(assert (=> b!86488 m!132331))

(assert (=> b!86404 d!27442))

(declare-fun d!27444 () Bool)

(declare-fun e!57501 () Bool)

(assert (=> d!27444 e!57501))

(declare-fun res!71053 () Bool)

(assert (=> d!27444 (=> (not res!71053) (not e!57501))))

(declare-fun lt!135169 () (_ BitVec 64))

(declare-fun lt!135170 () (_ BitVec 64))

(declare-fun lt!135171 () (_ BitVec 64))

(assert (=> d!27444 (= res!71053 (= lt!135169 (bvsub lt!135171 lt!135170)))))

(assert (=> d!27444 (or (= (bvand lt!135171 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!135170 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!135171 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!135171 lt!135170) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!27444 (= lt!135170 (remainingBits!0 ((_ sign_extend 32) (size!1851 (buf!2241 thiss!1152))) ((_ sign_extend 32) (currentByte!4447 thiss!1152)) ((_ sign_extend 32) (currentBit!4442 thiss!1152))))))

(declare-fun lt!135167 () (_ BitVec 64))

(declare-fun lt!135168 () (_ BitVec 64))

(assert (=> d!27444 (= lt!135171 (bvmul lt!135167 lt!135168))))

(assert (=> d!27444 (or (= lt!135167 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!135168 (bvsdiv (bvmul lt!135167 lt!135168) lt!135167)))))

(assert (=> d!27444 (= lt!135168 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27444 (= lt!135167 ((_ sign_extend 32) (size!1851 (buf!2241 thiss!1152))))))

(assert (=> d!27444 (= lt!135169 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4447 thiss!1152)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4442 thiss!1152))))))

(assert (=> d!27444 (invariant!0 (currentBit!4442 thiss!1152) (currentByte!4447 thiss!1152) (size!1851 (buf!2241 thiss!1152)))))

(assert (=> d!27444 (= (bitIndex!0 (size!1851 (buf!2241 thiss!1152)) (currentByte!4447 thiss!1152) (currentBit!4442 thiss!1152)) lt!135169)))

(declare-fun b!86493 () Bool)

(declare-fun res!71054 () Bool)

(assert (=> b!86493 (=> (not res!71054) (not e!57501))))

(assert (=> b!86493 (= res!71054 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!135169))))

(declare-fun b!86494 () Bool)

(declare-fun lt!135166 () (_ BitVec 64))

(assert (=> b!86494 (= e!57501 (bvsle lt!135169 (bvmul lt!135166 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!86494 (or (= lt!135166 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!135166 #b0000000000000000000000000000000000000000000000000000000000001000) lt!135166)))))

(assert (=> b!86494 (= lt!135166 ((_ sign_extend 32) (size!1851 (buf!2241 thiss!1152))))))

(assert (= (and d!27444 res!71053) b!86493))

(assert (= (and b!86493 res!71054) b!86494))

(declare-fun m!132333 () Bool)

(assert (=> d!27444 m!132333))

(assert (=> d!27444 m!132261))

(assert (=> b!86414 d!27444))

(declare-fun d!27446 () Bool)

(declare-fun e!57502 () Bool)

(assert (=> d!27446 e!57502))

(declare-fun res!71055 () Bool)

(assert (=> d!27446 (=> (not res!71055) (not e!57502))))

(declare-fun lt!135176 () (_ BitVec 64))

(declare-fun lt!135175 () (_ BitVec 64))

(declare-fun lt!135177 () (_ BitVec 64))

(assert (=> d!27446 (= res!71055 (= lt!135175 (bvsub lt!135177 lt!135176)))))

(assert (=> d!27446 (or (= (bvand lt!135177 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!135176 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!135177 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!135177 lt!135176) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27446 (= lt!135176 (remainingBits!0 ((_ sign_extend 32) (size!1851 (buf!2241 thiss!1151))) ((_ sign_extend 32) (currentByte!4447 thiss!1151)) ((_ sign_extend 32) (currentBit!4442 thiss!1151))))))

(declare-fun lt!135173 () (_ BitVec 64))

(declare-fun lt!135174 () (_ BitVec 64))

(assert (=> d!27446 (= lt!135177 (bvmul lt!135173 lt!135174))))

(assert (=> d!27446 (or (= lt!135173 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!135174 (bvsdiv (bvmul lt!135173 lt!135174) lt!135173)))))

(assert (=> d!27446 (= lt!135174 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27446 (= lt!135173 ((_ sign_extend 32) (size!1851 (buf!2241 thiss!1151))))))

(assert (=> d!27446 (= lt!135175 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4447 thiss!1151)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4442 thiss!1151))))))

(assert (=> d!27446 (invariant!0 (currentBit!4442 thiss!1151) (currentByte!4447 thiss!1151) (size!1851 (buf!2241 thiss!1151)))))

(assert (=> d!27446 (= (bitIndex!0 (size!1851 (buf!2241 thiss!1151)) (currentByte!4447 thiss!1151) (currentBit!4442 thiss!1151)) lt!135175)))

(declare-fun b!86495 () Bool)

(declare-fun res!71056 () Bool)

(assert (=> b!86495 (=> (not res!71056) (not e!57502))))

(assert (=> b!86495 (= res!71056 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!135175))))

(declare-fun b!86496 () Bool)

(declare-fun lt!135172 () (_ BitVec 64))

(assert (=> b!86496 (= e!57502 (bvsle lt!135175 (bvmul lt!135172 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!86496 (or (= lt!135172 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!135172 #b0000000000000000000000000000000000000000000000000000000000001000) lt!135172)))))

(assert (=> b!86496 (= lt!135172 ((_ sign_extend 32) (size!1851 (buf!2241 thiss!1151))))))

(assert (= (and d!27446 res!71055) b!86495))

(assert (= (and b!86495 res!71056) b!86496))

(declare-fun m!132335 () Bool)

(assert (=> d!27446 m!132335))

(assert (=> d!27446 m!132279))

(assert (=> b!86414 d!27446))

(declare-fun d!27448 () Bool)

(assert (=> d!27448 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1851 (buf!2241 thiss!1151))) ((_ sign_extend 32) (currentByte!4447 thiss!1151)) ((_ sign_extend 32) (currentBit!4442 thiss!1151)) ((_ sign_extend 32) nBits!336)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1851 (buf!2241 thiss!1151))) ((_ sign_extend 32) (currentByte!4447 thiss!1151)) ((_ sign_extend 32) (currentBit!4442 thiss!1151))) ((_ sign_extend 32) nBits!336)))))

(declare-fun bs!6804 () Bool)

(assert (= bs!6804 d!27448))

(assert (=> bs!6804 m!132335))

(assert (=> b!86411 d!27448))

(declare-fun d!27450 () Bool)

(declare-fun e!57503 () Bool)

(assert (=> d!27450 e!57503))

(declare-fun res!71057 () Bool)

(assert (=> d!27450 (=> (not res!71057) (not e!57503))))

(declare-fun lt!135182 () (_ BitVec 64))

(declare-fun lt!135183 () (_ BitVec 64))

(declare-fun lt!135181 () (_ BitVec 64))

(assert (=> d!27450 (= res!71057 (= lt!135181 (bvsub lt!135183 lt!135182)))))

(assert (=> d!27450 (or (= (bvand lt!135183 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!135182 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!135183 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!135183 lt!135182) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27450 (= lt!135182 (remainingBits!0 ((_ sign_extend 32) (size!1851 (buf!2241 (_2!3894 lt!135127)))) ((_ sign_extend 32) (currentByte!4447 (_2!3894 lt!135127))) ((_ sign_extend 32) (currentBit!4442 (_2!3894 lt!135127)))))))

(declare-fun lt!135179 () (_ BitVec 64))

(declare-fun lt!135180 () (_ BitVec 64))

(assert (=> d!27450 (= lt!135183 (bvmul lt!135179 lt!135180))))

(assert (=> d!27450 (or (= lt!135179 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!135180 (bvsdiv (bvmul lt!135179 lt!135180) lt!135179)))))

(assert (=> d!27450 (= lt!135180 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27450 (= lt!135179 ((_ sign_extend 32) (size!1851 (buf!2241 (_2!3894 lt!135127)))))))

(assert (=> d!27450 (= lt!135181 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4447 (_2!3894 lt!135127))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4442 (_2!3894 lt!135127)))))))

(assert (=> d!27450 (invariant!0 (currentBit!4442 (_2!3894 lt!135127)) (currentByte!4447 (_2!3894 lt!135127)) (size!1851 (buf!2241 (_2!3894 lt!135127))))))

(assert (=> d!27450 (= (bitIndex!0 (size!1851 (buf!2241 (_2!3894 lt!135127))) (currentByte!4447 (_2!3894 lt!135127)) (currentBit!4442 (_2!3894 lt!135127))) lt!135181)))

(declare-fun b!86497 () Bool)

(declare-fun res!71058 () Bool)

(assert (=> b!86497 (=> (not res!71058) (not e!57503))))

(assert (=> b!86497 (= res!71058 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!135181))))

(declare-fun b!86498 () Bool)

(declare-fun lt!135178 () (_ BitVec 64))

(assert (=> b!86498 (= e!57503 (bvsle lt!135181 (bvmul lt!135178 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!86498 (or (= lt!135178 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!135178 #b0000000000000000000000000000000000000000000000000000000000001000) lt!135178)))))

(assert (=> b!86498 (= lt!135178 ((_ sign_extend 32) (size!1851 (buf!2241 (_2!3894 lt!135127)))))))

(assert (= (and d!27450 res!71057) b!86497))

(assert (= (and b!86497 res!71058) b!86498))

(declare-fun m!132337 () Bool)

(assert (=> d!27450 m!132337))

(assert (=> d!27450 m!132277))

(assert (=> b!86421 d!27450))

(declare-fun d!27452 () Bool)

(assert (=> d!27452 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1851 (buf!2241 thiss!1152))) ((_ sign_extend 32) (currentByte!4447 thiss!1152)) ((_ sign_extend 32) (currentBit!4442 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1851 (buf!2241 thiss!1152))) ((_ sign_extend 32) (currentByte!4447 thiss!1152)) ((_ sign_extend 32) (currentBit!4442 thiss!1152))) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun bs!6805 () Bool)

(assert (= bs!6805 d!27452))

(assert (=> bs!6805 m!132333))

(assert (=> b!86412 d!27452))

(declare-fun d!27454 () Bool)

(assert (=> d!27454 (= (invariant!0 (currentBit!4442 (_2!3894 lt!135127)) (currentByte!4447 (_2!3894 lt!135127)) (size!1851 (buf!2241 (_2!3894 lt!135127)))) (and (bvsge (currentBit!4442 (_2!3894 lt!135127)) #b00000000000000000000000000000000) (bvslt (currentBit!4442 (_2!3894 lt!135127)) #b00000000000000000000000000001000) (bvsge (currentByte!4447 (_2!3894 lt!135127)) #b00000000000000000000000000000000) (or (bvslt (currentByte!4447 (_2!3894 lt!135127)) (size!1851 (buf!2241 (_2!3894 lt!135127)))) (and (= (currentBit!4442 (_2!3894 lt!135127)) #b00000000000000000000000000000000) (= (currentByte!4447 (_2!3894 lt!135127)) (size!1851 (buf!2241 (_2!3894 lt!135127))))))))))

(assert (=> b!86408 d!27454))

(declare-fun d!27456 () Bool)

(assert (=> d!27456 (= (inv!12 thiss!1152) (invariant!0 (currentBit!4442 thiss!1152) (currentByte!4447 thiss!1152) (size!1851 (buf!2241 thiss!1152))))))

(declare-fun bs!6806 () Bool)

(assert (= bs!6806 d!27456))

(assert (=> bs!6806 m!132261))

(assert (=> start!17772 d!27456))

(declare-fun d!27458 () Bool)

(assert (=> d!27458 (= (inv!12 thiss!1151) (invariant!0 (currentBit!4442 thiss!1151) (currentByte!4447 thiss!1151) (size!1851 (buf!2241 thiss!1151))))))

(declare-fun bs!6807 () Bool)

(assert (= bs!6807 d!27458))

(assert (=> bs!6807 m!132279))

(assert (=> start!17772 d!27458))

(declare-fun b!86531 () Bool)

(declare-fun e!57514 () Bool)

(declare-fun lt!135210 () tuple2!7336)

(declare-fun lt!135208 () tuple2!7334)

(assert (=> b!86531 (= e!57514 (= (bitIndex!0 (size!1851 (buf!2241 (_1!3893 lt!135210))) (currentByte!4447 (_1!3893 lt!135210)) (currentBit!4442 (_1!3893 lt!135210))) (bitIndex!0 (size!1851 (buf!2241 (_2!3892 lt!135208))) (currentByte!4447 (_2!3892 lt!135208)) (currentBit!4442 (_2!3892 lt!135208)))))))

(declare-fun b!86532 () Bool)

(declare-fun res!71090 () Bool)

(declare-fun e!57518 () Bool)

(assert (=> b!86532 (=> (not res!71090) (not e!57518))))

(assert (=> b!86532 (= res!71090 (and (bvsle (bvadd #b00000000000000000000000000000001 i!576) nBits!336) (= (size!1851 (buf!2241 (_2!3892 lt!135129))) (size!1851 (buf!2241 thiss!1151)))))))

(declare-fun b!86533 () Bool)

(declare-fun res!71091 () Bool)

(assert (=> b!86533 (=> (not res!71091) (not e!57518))))

(assert (=> b!86533 (= res!71091 (= (bitIndex!0 (size!1851 (buf!2241 (_2!3892 lt!135129))) (currentByte!4447 (_2!3892 lt!135129)) (currentBit!4442 (_2!3892 lt!135129))) (bvadd (bitIndex!0 (size!1851 (buf!2241 thiss!1151)) (currentByte!4447 thiss!1151) (currentBit!4442 thiss!1151)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!576)))))))

(declare-fun b!86534 () Bool)

(declare-fun e!57515 () Bool)

(assert (=> b!86534 (= e!57515 e!57514)))

(declare-fun res!71089 () Bool)

(assert (=> b!86534 (=> (not res!71089) (not e!57514))))

(declare-fun lt!135207 () Bool)

(assert (=> b!86534 (= res!71089 (and (= (_2!3893 lt!135210) lt!135207) (= (_1!3893 lt!135210) (_2!3892 lt!135208))))))

(assert (=> b!86534 (= lt!135210 (readBitPure!0 (readerFrom!0 (_2!3892 lt!135208) (currentBit!4442 (_2!3892 lt!135129)) (currentByte!4447 (_2!3892 lt!135129)))))))

(declare-fun b!86535 () Bool)

(declare-fun res!71097 () Bool)

(declare-fun e!57517 () Bool)

(assert (=> b!86535 (=> (not res!71097) (not e!57517))))

(declare-fun lt!135206 () (_ BitVec 64))

(declare-fun lt!135204 () (_ BitVec 64))

(declare-fun lt!135209 () tuple3!402)

(assert (=> b!86535 (= res!71097 (= (bitIndex!0 (size!1851 (buf!2241 (_2!3894 lt!135209))) (currentByte!4447 (_2!3894 lt!135209)) (currentBit!4442 (_2!3894 lt!135209))) (bvadd lt!135204 lt!135206)))))

(assert (=> b!86535 (or (not (= (bvand lt!135204 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!135206 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!135204 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!135204 lt!135206) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!86535 (= lt!135206 ((_ sign_extend 32) (_3!225 lt!135209)))))

(assert (=> b!86535 (= lt!135204 (bitIndex!0 (size!1851 (buf!2241 thiss!1151)) (currentByte!4447 thiss!1151) (currentBit!4442 thiss!1151)))))

(declare-fun b!86536 () Bool)

(declare-fun res!71098 () Bool)

(assert (=> b!86536 (=> (not res!71098) (not e!57515))))

(assert (=> b!86536 (= res!71098 (= (bitIndex!0 (size!1851 (buf!2241 (_2!3892 lt!135208))) (currentByte!4447 (_2!3892 lt!135208)) (currentBit!4442 (_2!3892 lt!135208))) (bvadd (bitIndex!0 (size!1851 (buf!2241 (_2!3892 lt!135129))) (currentByte!4447 (_2!3892 lt!135129)) (currentBit!4442 (_2!3892 lt!135129))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!86537 () Bool)

(assert (=> b!86537 (= e!57518 (bvslt (bvadd #b00000000000000000000000000000001 i!576) nBits!336))))

(declare-fun b!86538 () Bool)

(declare-fun res!71092 () Bool)

(assert (=> b!86538 (=> (not res!71092) (not e!57518))))

(assert (=> b!86538 (= res!71092 (validate_offset_bits!1 ((_ sign_extend 32) (size!1851 (buf!2241 (_2!3892 lt!135129)))) ((_ sign_extend 32) (currentByte!4447 (_2!3892 lt!135129))) ((_ sign_extend 32) (currentBit!4442 (_2!3892 lt!135129))) ((_ sign_extend 32) (bvsub nBits!336 (bvadd #b00000000000000000000000000000001 i!576)))))))

(declare-fun e!57516 () tuple3!402)

(declare-fun lt!135205 () tuple2!7334)

(declare-fun b!86539 () Bool)

(declare-fun lt!135203 () (_ BitVec 32))

(assert (=> b!86539 (= e!57516 (appendBitsLSBFirstWhileWhile!0 nBits!336 thiss!1151 v!179 (_2!3892 lt!135205) lt!135203))))

(declare-fun b!86540 () Bool)

(declare-fun res!71087 () Bool)

(assert (=> b!86540 (=> (not res!71087) (not e!57518))))

(assert (=> b!86540 (= res!71087 (invariant!0 (currentBit!4442 (_2!3892 lt!135129)) (currentByte!4447 (_2!3892 lt!135129)) (size!1851 (buf!2241 (_2!3892 lt!135129)))))))

(declare-fun b!86541 () Bool)

(declare-fun res!71094 () Bool)

(assert (=> b!86541 (=> (not res!71094) (not e!57517))))

(assert (=> b!86541 (= res!71094 (and (bvsle (_3!225 lt!135209) nBits!336) (= (size!1851 (buf!2241 (_2!3894 lt!135209))) (size!1851 (buf!2241 thiss!1151)))))))

(declare-fun b!86542 () Bool)

(declare-fun res!71096 () Bool)

(assert (=> b!86542 (=> (not res!71096) (not e!57515))))

(assert (=> b!86542 (= res!71096 (isPrefixOf!0 (_2!3892 lt!135129) (_2!3892 lt!135208)))))

(declare-fun d!27460 () Bool)

(assert (=> d!27460 e!57517))

(declare-fun res!71088 () Bool)

(assert (=> d!27460 (=> (not res!71088) (not e!57517))))

(assert (=> d!27460 (= res!71088 (bvsge (_3!225 lt!135209) #b00000000000000000000000000000000))))

(assert (=> d!27460 (= lt!135209 e!57516)))

(declare-fun c!5852 () Bool)

(assert (=> d!27460 (= c!5852 (bvslt lt!135203 nBits!336))))

(assert (=> d!27460 (= lt!135203 (bvadd #b00000000000000000000000000000001 i!576 #b00000000000000000000000000000001))))

(assert (=> d!27460 (= lt!135205 lt!135208)))

(assert (=> d!27460 e!57515))

(declare-fun res!71100 () Bool)

(assert (=> d!27460 (=> (not res!71100) (not e!57515))))

(assert (=> d!27460 (= res!71100 (= (size!1851 (buf!2241 (_2!3892 lt!135129))) (size!1851 (buf!2241 (_2!3892 lt!135208)))))))

(assert (=> d!27460 (= lt!135208 (appendBit!0 (_2!3892 lt!135129) lt!135207))))

(assert (=> d!27460 (= lt!135207 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!576)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27460 e!57518))

(declare-fun res!71095 () Bool)

(assert (=> d!27460 (=> (not res!71095) (not e!57518))))

(assert (=> d!27460 (= res!71095 (bvsge (bvadd #b00000000000000000000000000000001 i!576) #b00000000000000000000000000000000))))

(assert (=> d!27460 (= (appendBitsLSBFirstWhileWhile!0 nBits!336 thiss!1151 v!179 (_2!3892 lt!135129) (bvadd #b00000000000000000000000000000001 i!576)) lt!135209)))

(declare-fun b!86543 () Bool)

(assert (=> b!86543 (= e!57517 (bvsge (_3!225 lt!135209) nBits!336))))

(declare-fun b!86544 () Bool)

(declare-fun Unit!5722 () Unit!5718)

(assert (=> b!86544 (= e!57516 (tuple3!403 Unit!5722 (_2!3892 lt!135205) lt!135203))))

(declare-fun b!86545 () Bool)

(declare-fun res!71093 () Bool)

(assert (=> b!86545 (=> (not res!71093) (not e!57517))))

(assert (=> b!86545 (= res!71093 (validate_offset_bits!1 ((_ sign_extend 32) (size!1851 (buf!2241 (_2!3894 lt!135209)))) ((_ sign_extend 32) (currentByte!4447 (_2!3894 lt!135209))) ((_ sign_extend 32) (currentBit!4442 (_2!3894 lt!135209))) ((_ sign_extend 32) (bvsub nBits!336 (_3!225 lt!135209)))))))

(assert (=> b!86545 (or (= (bvand nBits!336 #b10000000000000000000000000000000) (bvand (_3!225 lt!135209) #b10000000000000000000000000000000)) (= (bvand nBits!336 #b10000000000000000000000000000000) (bvand (bvsub nBits!336 (_3!225 lt!135209)) #b10000000000000000000000000000000)))))

(declare-fun b!86546 () Bool)

(declare-fun res!71099 () Bool)

(assert (=> b!86546 (=> (not res!71099) (not e!57517))))

(assert (=> b!86546 (= res!71099 (invariant!0 (currentBit!4442 (_2!3894 lt!135209)) (currentByte!4447 (_2!3894 lt!135209)) (size!1851 (buf!2241 (_2!3894 lt!135209)))))))

(assert (= (and d!27460 res!71095) b!86540))

(assert (= (and b!86540 res!71087) b!86532))

(assert (= (and b!86532 res!71090) b!86533))

(assert (= (and b!86533 res!71091) b!86538))

(assert (= (and b!86538 res!71092) b!86537))

(assert (= (and d!27460 res!71100) b!86536))

(assert (= (and b!86536 res!71098) b!86542))

(assert (= (and b!86542 res!71096) b!86534))

(assert (= (and b!86534 res!71089) b!86531))

(assert (= (and d!27460 c!5852) b!86539))

(assert (= (and d!27460 (not c!5852)) b!86544))

(assert (= (and d!27460 res!71088) b!86546))

(assert (= (and b!86546 res!71099) b!86541))

(assert (= (and b!86541 res!71094) b!86535))

(assert (= (and b!86535 res!71097) b!86545))

(assert (= (and b!86545 res!71093) b!86543))

(declare-fun m!132341 () Bool)

(assert (=> b!86542 m!132341))

(declare-fun m!132343 () Bool)

(assert (=> b!86531 m!132343))

(declare-fun m!132345 () Bool)

(assert (=> b!86531 m!132345))

(assert (=> b!86533 m!132267))

(assert (=> b!86533 m!132257))

(declare-fun m!132347 () Bool)

(assert (=> b!86539 m!132347))

(declare-fun m!132349 () Bool)

(assert (=> b!86534 m!132349))

(assert (=> b!86534 m!132349))

(declare-fun m!132351 () Bool)

(assert (=> b!86534 m!132351))

(assert (=> b!86536 m!132345))

(assert (=> b!86536 m!132267))

(assert (=> b!86540 m!132249))

(declare-fun m!132353 () Bool)

(assert (=> d!27460 m!132353))

(declare-fun m!132355 () Bool)

(assert (=> b!86538 m!132355))

(declare-fun m!132357 () Bool)

(assert (=> b!86546 m!132357))

(declare-fun m!132359 () Bool)

(assert (=> b!86535 m!132359))

(assert (=> b!86535 m!132257))

(declare-fun m!132361 () Bool)

(assert (=> b!86545 m!132361))

(assert (=> b!86419 d!27460))

(declare-fun d!27466 () Bool)

(declare-fun res!71111 () Bool)

(declare-fun e!57527 () Bool)

(assert (=> d!27466 (=> (not res!71111) (not e!57527))))

(assert (=> d!27466 (= res!71111 (= (size!1851 (buf!2241 thiss!1152)) (size!1851 (buf!2241 (_2!3892 lt!135129)))))))

(assert (=> d!27466 (= (isPrefixOf!0 thiss!1152 (_2!3892 lt!135129)) e!57527)))

(declare-fun b!86556 () Bool)

(declare-fun res!71112 () Bool)

(assert (=> b!86556 (=> (not res!71112) (not e!57527))))

(assert (=> b!86556 (= res!71112 (bvsle (bitIndex!0 (size!1851 (buf!2241 thiss!1152)) (currentByte!4447 thiss!1152) (currentBit!4442 thiss!1152)) (bitIndex!0 (size!1851 (buf!2241 (_2!3892 lt!135129))) (currentByte!4447 (_2!3892 lt!135129)) (currentBit!4442 (_2!3892 lt!135129)))))))

(declare-fun b!86557 () Bool)

(declare-fun e!57526 () Bool)

(assert (=> b!86557 (= e!57527 e!57526)))

(declare-fun res!71113 () Bool)

(assert (=> b!86557 (=> res!71113 e!57526)))

(assert (=> b!86557 (= res!71113 (= (size!1851 (buf!2241 thiss!1152)) #b00000000000000000000000000000000))))

(declare-fun b!86558 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4097 array!4097 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!86558 (= e!57526 (arrayBitRangesEq!0 (buf!2241 thiss!1152) (buf!2241 (_2!3892 lt!135129)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1851 (buf!2241 thiss!1152)) (currentByte!4447 thiss!1152) (currentBit!4442 thiss!1152))))))

(assert (= (and d!27466 res!71111) b!86556))

(assert (= (and b!86556 res!71112) b!86557))

(assert (= (and b!86557 (not res!71113)) b!86558))

(assert (=> b!86556 m!132255))

(assert (=> b!86556 m!132267))

(assert (=> b!86558 m!132255))

(assert (=> b!86558 m!132255))

(declare-fun m!132365 () Bool)

(assert (=> b!86558 m!132365))

(assert (=> b!86420 d!27466))

(declare-fun d!27470 () Bool)

(declare-fun e!57528 () Bool)

(assert (=> d!27470 e!57528))

(declare-fun res!71114 () Bool)

(assert (=> d!27470 (=> (not res!71114) (not e!57528))))

(declare-fun lt!135215 () (_ BitVec 64))

(declare-fun lt!135216 () (_ BitVec 64))

(declare-fun lt!135214 () (_ BitVec 64))

(assert (=> d!27470 (= res!71114 (= lt!135214 (bvsub lt!135216 lt!135215)))))

(assert (=> d!27470 (or (= (bvand lt!135216 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!135215 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!135216 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!135216 lt!135215) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27470 (= lt!135215 (remainingBits!0 ((_ sign_extend 32) (size!1851 (buf!2241 (_2!3892 lt!135129)))) ((_ sign_extend 32) (currentByte!4447 (_2!3892 lt!135129))) ((_ sign_extend 32) (currentBit!4442 (_2!3892 lt!135129)))))))

(declare-fun lt!135212 () (_ BitVec 64))

(declare-fun lt!135213 () (_ BitVec 64))

(assert (=> d!27470 (= lt!135216 (bvmul lt!135212 lt!135213))))

(assert (=> d!27470 (or (= lt!135212 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!135213 (bvsdiv (bvmul lt!135212 lt!135213) lt!135212)))))

(assert (=> d!27470 (= lt!135213 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27470 (= lt!135212 ((_ sign_extend 32) (size!1851 (buf!2241 (_2!3892 lt!135129)))))))

(assert (=> d!27470 (= lt!135214 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4447 (_2!3892 lt!135129))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4442 (_2!3892 lt!135129)))))))

(assert (=> d!27470 (invariant!0 (currentBit!4442 (_2!3892 lt!135129)) (currentByte!4447 (_2!3892 lt!135129)) (size!1851 (buf!2241 (_2!3892 lt!135129))))))

(assert (=> d!27470 (= (bitIndex!0 (size!1851 (buf!2241 (_2!3892 lt!135129))) (currentByte!4447 (_2!3892 lt!135129)) (currentBit!4442 (_2!3892 lt!135129))) lt!135214)))

(declare-fun b!86559 () Bool)

(declare-fun res!71115 () Bool)

(assert (=> b!86559 (=> (not res!71115) (not e!57528))))

(assert (=> b!86559 (= res!71115 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!135214))))

(declare-fun b!86560 () Bool)

(declare-fun lt!135211 () (_ BitVec 64))

(assert (=> b!86560 (= e!57528 (bvsle lt!135214 (bvmul lt!135211 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!86560 (or (= lt!135211 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!135211 #b0000000000000000000000000000000000000000000000000000000000001000) lt!135211)))))

(assert (=> b!86560 (= lt!135211 ((_ sign_extend 32) (size!1851 (buf!2241 (_2!3892 lt!135129)))))))

(assert (= (and d!27470 res!71114) b!86559))

(assert (= (and b!86559 res!71115) b!86560))

(declare-fun m!132367 () Bool)

(assert (=> d!27470 m!132367))

(assert (=> d!27470 m!132249))

(assert (=> b!86409 d!27470))

(declare-fun d!27472 () Bool)

(assert (=> d!27472 (= (invariant!0 (currentBit!4442 thiss!1152) (currentByte!4447 thiss!1152) (size!1851 (buf!2241 thiss!1152))) (and (bvsge (currentBit!4442 thiss!1152) #b00000000000000000000000000000000) (bvslt (currentBit!4442 thiss!1152) #b00000000000000000000000000001000) (bvsge (currentByte!4447 thiss!1152) #b00000000000000000000000000000000) (or (bvslt (currentByte!4447 thiss!1152) (size!1851 (buf!2241 thiss!1152))) (and (= (currentBit!4442 thiss!1152) #b00000000000000000000000000000000) (= (currentByte!4447 thiss!1152) (size!1851 (buf!2241 thiss!1152)))))))))

(assert (=> b!86405 d!27472))

(declare-fun d!27474 () Bool)

(declare-fun e!57529 () Bool)

(assert (=> d!27474 e!57529))

(declare-fun res!71116 () Bool)

(assert (=> d!27474 (=> (not res!71116) (not e!57529))))

(declare-fun lt!135222 () (_ BitVec 64))

(declare-fun lt!135220 () (_ BitVec 64))

(declare-fun lt!135221 () (_ BitVec 64))

(assert (=> d!27474 (= res!71116 (= lt!135220 (bvsub lt!135222 lt!135221)))))

(assert (=> d!27474 (or (= (bvand lt!135222 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!135221 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!135222 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!135222 lt!135221) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27474 (= lt!135221 (remainingBits!0 ((_ sign_extend 32) (size!1851 (buf!2241 (_1!3893 lt!135124)))) ((_ sign_extend 32) (currentByte!4447 (_1!3893 lt!135124))) ((_ sign_extend 32) (currentBit!4442 (_1!3893 lt!135124)))))))

(declare-fun lt!135218 () (_ BitVec 64))

(declare-fun lt!135219 () (_ BitVec 64))

(assert (=> d!27474 (= lt!135222 (bvmul lt!135218 lt!135219))))

(assert (=> d!27474 (or (= lt!135218 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!135219 (bvsdiv (bvmul lt!135218 lt!135219) lt!135218)))))

(assert (=> d!27474 (= lt!135219 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27474 (= lt!135218 ((_ sign_extend 32) (size!1851 (buf!2241 (_1!3893 lt!135124)))))))

(assert (=> d!27474 (= lt!135220 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4447 (_1!3893 lt!135124))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4442 (_1!3893 lt!135124)))))))

(assert (=> d!27474 (invariant!0 (currentBit!4442 (_1!3893 lt!135124)) (currentByte!4447 (_1!3893 lt!135124)) (size!1851 (buf!2241 (_1!3893 lt!135124))))))

(assert (=> d!27474 (= (bitIndex!0 (size!1851 (buf!2241 (_1!3893 lt!135124))) (currentByte!4447 (_1!3893 lt!135124)) (currentBit!4442 (_1!3893 lt!135124))) lt!135220)))

(declare-fun b!86561 () Bool)

(declare-fun res!71117 () Bool)

(assert (=> b!86561 (=> (not res!71117) (not e!57529))))

(assert (=> b!86561 (= res!71117 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!135220))))

(declare-fun b!86562 () Bool)

(declare-fun lt!135217 () (_ BitVec 64))

(assert (=> b!86562 (= e!57529 (bvsle lt!135220 (bvmul lt!135217 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!86562 (or (= lt!135217 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!135217 #b0000000000000000000000000000000000000000000000000000000000001000) lt!135217)))))

(assert (=> b!86562 (= lt!135217 ((_ sign_extend 32) (size!1851 (buf!2241 (_1!3893 lt!135124)))))))

(assert (= (and d!27474 res!71116) b!86561))

(assert (= (and b!86561 res!71117) b!86562))

(declare-fun m!132369 () Bool)

(assert (=> d!27474 m!132369))

(declare-fun m!132371 () Bool)

(assert (=> d!27474 m!132371))

(assert (=> b!86407 d!27474))

(declare-fun d!27476 () Bool)

(assert (=> d!27476 (= (invariant!0 (currentBit!4442 (_2!3892 lt!135129)) (currentByte!4447 (_2!3892 lt!135129)) (size!1851 (buf!2241 (_2!3892 lt!135129)))) (and (bvsge (currentBit!4442 (_2!3892 lt!135129)) #b00000000000000000000000000000000) (bvslt (currentBit!4442 (_2!3892 lt!135129)) #b00000000000000000000000000001000) (bvsge (currentByte!4447 (_2!3892 lt!135129)) #b00000000000000000000000000000000) (or (bvslt (currentByte!4447 (_2!3892 lt!135129)) (size!1851 (buf!2241 (_2!3892 lt!135129)))) (and (= (currentBit!4442 (_2!3892 lt!135129)) #b00000000000000000000000000000000) (= (currentByte!4447 (_2!3892 lt!135129)) (size!1851 (buf!2241 (_2!3892 lt!135129))))))))))

(assert (=> b!86417 d!27476))

(declare-fun b!86577 () Bool)

(declare-fun res!71130 () Bool)

(declare-fun e!57536 () Bool)

(assert (=> b!86577 (=> (not res!71130) (not e!57536))))

(declare-fun lt!135246 () tuple2!7334)

(assert (=> b!86577 (= res!71130 (isPrefixOf!0 thiss!1152 (_2!3892 lt!135246)))))

(declare-fun b!86576 () Bool)

(declare-fun res!71132 () Bool)

(assert (=> b!86576 (=> (not res!71132) (not e!57536))))

(declare-fun lt!135244 () (_ BitVec 64))

(declare-fun lt!135245 () (_ BitVec 64))

(assert (=> b!86576 (= res!71132 (= (bitIndex!0 (size!1851 (buf!2241 (_2!3892 lt!135246))) (currentByte!4447 (_2!3892 lt!135246)) (currentBit!4442 (_2!3892 lt!135246))) (bvadd lt!135245 lt!135244)))))

(assert (=> b!86576 (or (not (= (bvand lt!135245 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!135244 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!135245 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!135245 lt!135244) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!86576 (= lt!135244 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!86576 (= lt!135245 (bitIndex!0 (size!1851 (buf!2241 thiss!1152)) (currentByte!4447 thiss!1152) (currentBit!4442 thiss!1152)))))

(declare-fun b!86578 () Bool)

(declare-fun e!57537 () Bool)

(assert (=> b!86578 (= e!57536 e!57537)))

(declare-fun res!71131 () Bool)

(assert (=> b!86578 (=> (not res!71131) (not e!57537))))

(declare-fun lt!135243 () tuple2!7336)

(assert (=> b!86578 (= res!71131 (and (= (_2!3893 lt!135243) lt!135125) (= (_1!3893 lt!135243) (_2!3892 lt!135246))))))

(assert (=> b!86578 (= lt!135243 (readBitPure!0 (readerFrom!0 (_2!3892 lt!135246) (currentBit!4442 thiss!1152) (currentByte!4447 thiss!1152))))))

(declare-fun b!86579 () Bool)

(assert (=> b!86579 (= e!57537 (= (bitIndex!0 (size!1851 (buf!2241 (_1!3893 lt!135243))) (currentByte!4447 (_1!3893 lt!135243)) (currentBit!4442 (_1!3893 lt!135243))) (bitIndex!0 (size!1851 (buf!2241 (_2!3892 lt!135246))) (currentByte!4447 (_2!3892 lt!135246)) (currentBit!4442 (_2!3892 lt!135246)))))))

(declare-fun d!27478 () Bool)

(assert (=> d!27478 e!57536))

(declare-fun res!71133 () Bool)

(assert (=> d!27478 (=> (not res!71133) (not e!57536))))

(assert (=> d!27478 (= res!71133 (= (size!1851 (buf!2241 thiss!1152)) (size!1851 (buf!2241 (_2!3892 lt!135246)))))))

(declare-fun choose!16 (BitStream!3264 Bool) tuple2!7334)

(assert (=> d!27478 (= lt!135246 (choose!16 thiss!1152 lt!135125))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!27478 (validate_offset_bit!0 ((_ sign_extend 32) (size!1851 (buf!2241 thiss!1152))) ((_ sign_extend 32) (currentByte!4447 thiss!1152)) ((_ sign_extend 32) (currentBit!4442 thiss!1152)))))

(assert (=> d!27478 (= (appendBit!0 thiss!1152 lt!135125) lt!135246)))

(assert (= (and d!27478 res!71133) b!86576))

(assert (= (and b!86576 res!71132) b!86577))

(assert (= (and b!86577 res!71130) b!86578))

(assert (= (and b!86578 res!71131) b!86579))

(declare-fun m!132377 () Bool)

(assert (=> b!86576 m!132377))

(assert (=> b!86576 m!132255))

(declare-fun m!132379 () Bool)

(assert (=> b!86579 m!132379))

(assert (=> b!86579 m!132377))

(declare-fun m!132381 () Bool)

(assert (=> b!86578 m!132381))

(assert (=> b!86578 m!132381))

(declare-fun m!132383 () Bool)

(assert (=> b!86578 m!132383))

(declare-fun m!132385 () Bool)

(assert (=> b!86577 m!132385))

(declare-fun m!132387 () Bool)

(assert (=> d!27478 m!132387))

(declare-fun m!132389 () Bool)

(assert (=> d!27478 m!132389))

(assert (=> b!86417 d!27478))

(check-sat (not b!86540) (not b!86546) (not b!86545) (not d!27458) (not d!27456) (not b!86534) (not b!86531) (not b!86533) (not b!86542) (not b!86577) (not d!27440) (not b!86578) (not b!86538) (not d!27470) (not d!27444) (not b!86556) (not b!86488) (not d!27448) (not d!27442) (not b!86579) (not b!86576) (not d!27450) (not b!86536) (not d!27452) (not b!86539) (not b!86558) (not b!86535) (not d!27474) (not d!27478) (not d!27460) (not d!27446))
