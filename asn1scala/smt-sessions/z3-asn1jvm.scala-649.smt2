; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18114 () Bool)

(assert start!18114)

(declare-fun b!89383 () Bool)

(declare-fun res!73622 () Bool)

(declare-fun e!59068 () Bool)

(assert (=> b!89383 (=> (not res!73622) (not e!59068))))

(declare-fun i!576 () (_ BitVec 32))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> b!89383 (= res!73622 (bvslt i!576 nBits!336))))

(declare-fun b!89384 () Bool)

(declare-fun res!73624 () Bool)

(declare-fun e!59070 () Bool)

(assert (=> b!89384 (=> (not res!73624) (not e!59070))))

(declare-datatypes ((array!4220 0))(
  ( (array!4221 (arr!2542 (Array (_ BitVec 32) (_ BitVec 8))) (size!1905 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3372 0))(
  ( (BitStream!3373 (buf!2295 array!4220) (currentByte!4549 (_ BitVec 32)) (currentBit!4544 (_ BitVec 32))) )
))
(declare-fun thiss!1152 () BitStream!3372)

(declare-fun thiss!1151 () BitStream!3372)

(assert (=> b!89384 (= res!73624 (and (bvsle i!576 nBits!336) (= (size!1905 (buf!2295 thiss!1152)) (size!1905 (buf!2295 thiss!1151)))))))

(declare-fun b!89385 () Bool)

(declare-fun e!59060 () Bool)

(declare-fun array_inv!1751 (array!4220) Bool)

(assert (=> b!89385 (= e!59060 (array_inv!1751 (buf!2295 thiss!1151)))))

(declare-fun b!89386 () Bool)

(declare-fun res!73615 () Bool)

(assert (=> b!89386 (=> (not res!73615) (not e!59070))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!89386 (= res!73615 (validate_offset_bits!1 ((_ sign_extend 32) (size!1905 (buf!2295 thiss!1151))) ((_ sign_extend 32) (currentByte!4549 thiss!1151)) ((_ sign_extend 32) (currentBit!4544 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!89387 () Bool)

(declare-fun e!59069 () Bool)

(assert (=> b!89387 (= e!59069 (array_inv!1751 (buf!2295 thiss!1152)))))

(declare-fun b!89388 () Bool)

(declare-fun res!73621 () Bool)

(assert (=> b!89388 (=> (not res!73621) (not e!59070))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!89388 (= res!73621 (invariant!0 (currentBit!4544 thiss!1152) (currentByte!4549 thiss!1152) (size!1905 (buf!2295 thiss!1152))))))

(declare-fun res!73609 () Bool)

(assert (=> start!18114 (=> (not res!73609) (not e!59070))))

(assert (=> start!18114 (= res!73609 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!18114 e!59070))

(declare-fun inv!12 (BitStream!3372) Bool)

(assert (=> start!18114 (and (inv!12 thiss!1152) e!59069)))

(assert (=> start!18114 (and (inv!12 thiss!1151) e!59060)))

(assert (=> start!18114 true))

(declare-fun b!89389 () Bool)

(declare-fun res!73612 () Bool)

(declare-fun e!59064 () Bool)

(assert (=> b!89389 (=> res!73612 e!59064)))

(declare-datatypes ((Unit!5793 0))(
  ( (Unit!5794) )
))
(declare-datatypes ((tuple3!420 0))(
  ( (tuple3!421 (_1!3982 Unit!5793) (_2!3982 BitStream!3372) (_3!234 (_ BitVec 32))) )
))
(declare-fun lt!136506 () tuple3!420)

(assert (=> b!89389 (= res!73612 (not (invariant!0 (currentBit!4544 (_2!3982 lt!136506)) (currentByte!4549 (_2!3982 lt!136506)) (size!1905 (buf!2295 (_2!3982 lt!136506))))))))

(declare-fun b!89390 () Bool)

(declare-fun res!73619 () Bool)

(assert (=> b!89390 (=> (not res!73619) (not e!59070))))

(assert (=> b!89390 (= res!73619 (invariant!0 (currentBit!4544 thiss!1151) (currentByte!4549 thiss!1151) (size!1905 (buf!2295 thiss!1151))))))

(declare-fun b!89391 () Bool)

(declare-fun res!73608 () Bool)

(declare-fun e!59061 () Bool)

(assert (=> b!89391 (=> (not res!73608) (not e!59061))))

(declare-datatypes ((tuple2!7496 0))(
  ( (tuple2!7497 (_1!3983 Unit!5793) (_2!3983 BitStream!3372)) )
))
(declare-fun lt!136501 () tuple2!7496)

(declare-fun isPrefixOf!0 (BitStream!3372 BitStream!3372) Bool)

(assert (=> b!89391 (= res!73608 (isPrefixOf!0 thiss!1152 (_2!3983 lt!136501)))))

(declare-fun b!89392 () Bool)

(declare-fun e!59065 () Bool)

(assert (=> b!89392 (= e!59068 (not e!59065))))

(declare-fun res!73614 () Bool)

(assert (=> b!89392 (=> res!73614 e!59065)))

(assert (=> b!89392 (= res!73614 (not (invariant!0 (currentBit!4544 (_2!3983 lt!136501)) (currentByte!4549 (_2!3983 lt!136501)) (size!1905 (buf!2295 (_2!3983 lt!136501))))))))

(declare-fun e!59063 () Bool)

(assert (=> b!89392 e!59063))

(declare-fun res!73618 () Bool)

(assert (=> b!89392 (=> (not res!73618) (not e!59063))))

(assert (=> b!89392 (= res!73618 (= (size!1905 (buf!2295 thiss!1152)) (size!1905 (buf!2295 (_2!3983 lt!136501)))))))

(declare-fun lt!136502 () Bool)

(declare-fun appendBit!0 (BitStream!3372 Bool) tuple2!7496)

(assert (=> b!89392 (= lt!136501 (appendBit!0 thiss!1152 lt!136502))))

(declare-fun v!179 () (_ BitVec 64))

(assert (=> b!89392 (= lt!136502 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!89393 () Bool)

(declare-fun lt!136500 () (_ BitVec 64))

(assert (=> b!89393 (= e!59064 (or (bvsgt (_3!234 lt!136506) nBits!336) (not (= (size!1905 (buf!2295 (_2!3982 lt!136506))) (size!1905 (buf!2295 thiss!1151)))) (let ((bdg!4221 (bvand lt!136500 #b1000000000000000000000000000000000000000000000000000000000000000))) (or (not (= bdg!4221 (bvand ((_ sign_extend 32) (_3!234 lt!136506)) #b1000000000000000000000000000000000000000000000000000000000000000))) (= bdg!4221 (bvand (bvadd lt!136500 ((_ sign_extend 32) (_3!234 lt!136506))) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!89394 () Bool)

(declare-fun e!59062 () Bool)

(assert (=> b!89394 (= e!59061 e!59062)))

(declare-fun res!73623 () Bool)

(assert (=> b!89394 (=> (not res!73623) (not e!59062))))

(declare-datatypes ((tuple2!7498 0))(
  ( (tuple2!7499 (_1!3984 BitStream!3372) (_2!3984 Bool)) )
))
(declare-fun lt!136505 () tuple2!7498)

(assert (=> b!89394 (= res!73623 (and (= (_2!3984 lt!136505) lt!136502) (= (_1!3984 lt!136505) (_2!3983 lt!136501))))))

(declare-fun readBitPure!0 (BitStream!3372) tuple2!7498)

(declare-fun readerFrom!0 (BitStream!3372 (_ BitVec 32) (_ BitVec 32)) BitStream!3372)

(assert (=> b!89394 (= lt!136505 (readBitPure!0 (readerFrom!0 (_2!3983 lt!136501) (currentBit!4544 thiss!1152) (currentByte!4549 thiss!1152))))))

(declare-fun b!89395 () Bool)

(assert (=> b!89395 (= e!59063 e!59061)))

(declare-fun res!73613 () Bool)

(assert (=> b!89395 (=> (not res!73613) (not e!59061))))

(declare-fun lt!136503 () (_ BitVec 64))

(declare-fun lt!136504 () (_ BitVec 64))

(assert (=> b!89395 (= res!73613 (= lt!136503 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!136504)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!89395 (= lt!136503 (bitIndex!0 (size!1905 (buf!2295 (_2!3983 lt!136501))) (currentByte!4549 (_2!3983 lt!136501)) (currentBit!4544 (_2!3983 lt!136501))))))

(declare-fun b!89396 () Bool)

(declare-fun res!73620 () Bool)

(assert (=> b!89396 (=> (not res!73620) (not e!59068))))

(assert (=> b!89396 (= res!73620 (validate_offset_bits!1 ((_ sign_extend 32) (size!1905 (buf!2295 thiss!1152))) ((_ sign_extend 32) (currentByte!4549 thiss!1152)) ((_ sign_extend 32) (currentBit!4544 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!89397 () Bool)

(assert (=> b!89397 (= e!59065 e!59064)))

(declare-fun res!73616 () Bool)

(assert (=> b!89397 (=> res!73616 e!59064)))

(assert (=> b!89397 (= res!73616 (bvslt (_3!234 lt!136506) #b00000000000000000000000000000000))))

(declare-fun appendBitsLSBFirstWhileWhile!0 ((_ BitVec 32) BitStream!3372 (_ BitVec 64) BitStream!3372 (_ BitVec 32)) tuple3!420)

(assert (=> b!89397 (= lt!136506 (appendBitsLSBFirstWhileWhile!0 nBits!336 thiss!1151 v!179 (_2!3983 lt!136501) (bvadd #b00000000000000000000000000000001 i!576)))))

(declare-fun b!89398 () Bool)

(assert (=> b!89398 (= e!59062 (= (bitIndex!0 (size!1905 (buf!2295 (_1!3984 lt!136505))) (currentByte!4549 (_1!3984 lt!136505)) (currentBit!4544 (_1!3984 lt!136505))) lt!136503))))

(declare-fun b!89399 () Bool)

(declare-fun res!73610 () Bool)

(assert (=> b!89399 (=> res!73610 e!59065)))

(assert (=> b!89399 (= res!73610 (bvsge (bvadd #b00000000000000000000000000000001 i!576) nBits!336))))

(declare-fun b!89400 () Bool)

(declare-fun res!73617 () Bool)

(assert (=> b!89400 (=> (not res!73617) (not e!59070))))

(assert (=> b!89400 (= res!73617 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!89401 () Bool)

(assert (=> b!89401 (= e!59070 e!59068)))

(declare-fun res!73611 () Bool)

(assert (=> b!89401 (=> (not res!73611) (not e!59068))))

(assert (=> b!89401 (= res!73611 (= lt!136504 (bvadd lt!136500 ((_ sign_extend 32) i!576))))))

(assert (=> b!89401 (= lt!136504 (bitIndex!0 (size!1905 (buf!2295 thiss!1152)) (currentByte!4549 thiss!1152) (currentBit!4544 thiss!1152)))))

(assert (=> b!89401 (= lt!136500 (bitIndex!0 (size!1905 (buf!2295 thiss!1151)) (currentByte!4549 thiss!1151) (currentBit!4544 thiss!1151)))))

(assert (= (and start!18114 res!73609) b!89386))

(assert (= (and b!89386 res!73615) b!89390))

(assert (= (and b!89390 res!73619) b!89400))

(assert (= (and b!89400 res!73617) b!89388))

(assert (= (and b!89388 res!73621) b!89384))

(assert (= (and b!89384 res!73624) b!89401))

(assert (= (and b!89401 res!73611) b!89396))

(assert (= (and b!89396 res!73620) b!89383))

(assert (= (and b!89383 res!73622) b!89392))

(assert (= (and b!89392 res!73618) b!89395))

(assert (= (and b!89395 res!73613) b!89391))

(assert (= (and b!89391 res!73608) b!89394))

(assert (= (and b!89394 res!73623) b!89398))

(assert (= (and b!89392 (not res!73614)) b!89399))

(assert (= (and b!89399 (not res!73610)) b!89397))

(assert (= (and b!89397 (not res!73616)) b!89389))

(assert (= (and b!89389 (not res!73612)) b!89393))

(assert (= start!18114 b!89387))

(assert (= start!18114 b!89385))

(declare-fun m!134233 () Bool)

(assert (=> b!89389 m!134233))

(declare-fun m!134235 () Bool)

(assert (=> b!89398 m!134235))

(declare-fun m!134237 () Bool)

(assert (=> b!89396 m!134237))

(declare-fun m!134239 () Bool)

(assert (=> b!89397 m!134239))

(declare-fun m!134241 () Bool)

(assert (=> b!89394 m!134241))

(assert (=> b!89394 m!134241))

(declare-fun m!134243 () Bool)

(assert (=> b!89394 m!134243))

(declare-fun m!134245 () Bool)

(assert (=> b!89387 m!134245))

(declare-fun m!134247 () Bool)

(assert (=> b!89401 m!134247))

(declare-fun m!134249 () Bool)

(assert (=> b!89401 m!134249))

(declare-fun m!134251 () Bool)

(assert (=> b!89392 m!134251))

(declare-fun m!134253 () Bool)

(assert (=> b!89392 m!134253))

(declare-fun m!134255 () Bool)

(assert (=> b!89390 m!134255))

(declare-fun m!134257 () Bool)

(assert (=> b!89388 m!134257))

(declare-fun m!134259 () Bool)

(assert (=> b!89385 m!134259))

(declare-fun m!134261 () Bool)

(assert (=> b!89391 m!134261))

(declare-fun m!134263 () Bool)

(assert (=> b!89386 m!134263))

(declare-fun m!134265 () Bool)

(assert (=> start!18114 m!134265))

(declare-fun m!134267 () Bool)

(assert (=> start!18114 m!134267))

(declare-fun m!134269 () Bool)

(assert (=> b!89395 m!134269))

(check-sat (not b!89395) (not start!18114) (not b!89397) (not b!89391) (not b!89385) (not b!89386) (not b!89388) (not b!89389) (not b!89398) (not b!89390) (not b!89387) (not b!89401) (not b!89394) (not b!89392) (not b!89396))
(check-sat)
(get-model)

(declare-fun d!27908 () Bool)

(assert (=> d!27908 (= (invariant!0 (currentBit!4544 thiss!1151) (currentByte!4549 thiss!1151) (size!1905 (buf!2295 thiss!1151))) (and (bvsge (currentBit!4544 thiss!1151) #b00000000000000000000000000000000) (bvslt (currentBit!4544 thiss!1151) #b00000000000000000000000000001000) (bvsge (currentByte!4549 thiss!1151) #b00000000000000000000000000000000) (or (bvslt (currentByte!4549 thiss!1151) (size!1905 (buf!2295 thiss!1151))) (and (= (currentBit!4544 thiss!1151) #b00000000000000000000000000000000) (= (currentByte!4549 thiss!1151) (size!1905 (buf!2295 thiss!1151)))))))))

(assert (=> b!89390 d!27908))

(declare-fun d!27910 () Bool)

(declare-fun e!59106 () Bool)

(assert (=> d!27910 e!59106))

(declare-fun res!73680 () Bool)

(assert (=> d!27910 (=> (not res!73680) (not e!59106))))

(declare-fun lt!136543 () (_ BitVec 64))

(declare-fun lt!136540 () (_ BitVec 64))

(declare-fun lt!136544 () (_ BitVec 64))

(assert (=> d!27910 (= res!73680 (= lt!136543 (bvsub lt!136544 lt!136540)))))

(assert (=> d!27910 (or (= (bvand lt!136544 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!136540 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!136544 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!136544 lt!136540) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!27910 (= lt!136540 (remainingBits!0 ((_ sign_extend 32) (size!1905 (buf!2295 thiss!1152))) ((_ sign_extend 32) (currentByte!4549 thiss!1152)) ((_ sign_extend 32) (currentBit!4544 thiss!1152))))))

(declare-fun lt!136545 () (_ BitVec 64))

(declare-fun lt!136541 () (_ BitVec 64))

(assert (=> d!27910 (= lt!136544 (bvmul lt!136545 lt!136541))))

(assert (=> d!27910 (or (= lt!136545 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!136541 (bvsdiv (bvmul lt!136545 lt!136541) lt!136545)))))

(assert (=> d!27910 (= lt!136541 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27910 (= lt!136545 ((_ sign_extend 32) (size!1905 (buf!2295 thiss!1152))))))

(assert (=> d!27910 (= lt!136543 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4549 thiss!1152)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4544 thiss!1152))))))

(assert (=> d!27910 (invariant!0 (currentBit!4544 thiss!1152) (currentByte!4549 thiss!1152) (size!1905 (buf!2295 thiss!1152)))))

(assert (=> d!27910 (= (bitIndex!0 (size!1905 (buf!2295 thiss!1152)) (currentByte!4549 thiss!1152) (currentBit!4544 thiss!1152)) lt!136543)))

(declare-fun b!89463 () Bool)

(declare-fun res!73681 () Bool)

(assert (=> b!89463 (=> (not res!73681) (not e!59106))))

(assert (=> b!89463 (= res!73681 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!136543))))

(declare-fun b!89464 () Bool)

(declare-fun lt!136542 () (_ BitVec 64))

(assert (=> b!89464 (= e!59106 (bvsle lt!136543 (bvmul lt!136542 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!89464 (or (= lt!136542 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!136542 #b0000000000000000000000000000000000000000000000000000000000001000) lt!136542)))))

(assert (=> b!89464 (= lt!136542 ((_ sign_extend 32) (size!1905 (buf!2295 thiss!1152))))))

(assert (= (and d!27910 res!73680) b!89463))

(assert (= (and b!89463 res!73681) b!89464))

(declare-fun m!134309 () Bool)

(assert (=> d!27910 m!134309))

(assert (=> d!27910 m!134257))

(assert (=> b!89401 d!27910))

(declare-fun d!27912 () Bool)

(declare-fun e!59107 () Bool)

(assert (=> d!27912 e!59107))

(declare-fun res!73682 () Bool)

(assert (=> d!27912 (=> (not res!73682) (not e!59107))))

(declare-fun lt!136546 () (_ BitVec 64))

(declare-fun lt!136549 () (_ BitVec 64))

(declare-fun lt!136550 () (_ BitVec 64))

(assert (=> d!27912 (= res!73682 (= lt!136549 (bvsub lt!136550 lt!136546)))))

(assert (=> d!27912 (or (= (bvand lt!136550 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!136546 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!136550 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!136550 lt!136546) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27912 (= lt!136546 (remainingBits!0 ((_ sign_extend 32) (size!1905 (buf!2295 thiss!1151))) ((_ sign_extend 32) (currentByte!4549 thiss!1151)) ((_ sign_extend 32) (currentBit!4544 thiss!1151))))))

(declare-fun lt!136551 () (_ BitVec 64))

(declare-fun lt!136547 () (_ BitVec 64))

(assert (=> d!27912 (= lt!136550 (bvmul lt!136551 lt!136547))))

(assert (=> d!27912 (or (= lt!136551 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!136547 (bvsdiv (bvmul lt!136551 lt!136547) lt!136551)))))

(assert (=> d!27912 (= lt!136547 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27912 (= lt!136551 ((_ sign_extend 32) (size!1905 (buf!2295 thiss!1151))))))

(assert (=> d!27912 (= lt!136549 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4549 thiss!1151)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4544 thiss!1151))))))

(assert (=> d!27912 (invariant!0 (currentBit!4544 thiss!1151) (currentByte!4549 thiss!1151) (size!1905 (buf!2295 thiss!1151)))))

(assert (=> d!27912 (= (bitIndex!0 (size!1905 (buf!2295 thiss!1151)) (currentByte!4549 thiss!1151) (currentBit!4544 thiss!1151)) lt!136549)))

(declare-fun b!89465 () Bool)

(declare-fun res!73683 () Bool)

(assert (=> b!89465 (=> (not res!73683) (not e!59107))))

(assert (=> b!89465 (= res!73683 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!136549))))

(declare-fun b!89466 () Bool)

(declare-fun lt!136548 () (_ BitVec 64))

(assert (=> b!89466 (= e!59107 (bvsle lt!136549 (bvmul lt!136548 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!89466 (or (= lt!136548 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!136548 #b0000000000000000000000000000000000000000000000000000000000001000) lt!136548)))))

(assert (=> b!89466 (= lt!136548 ((_ sign_extend 32) (size!1905 (buf!2295 thiss!1151))))))

(assert (= (and d!27912 res!73682) b!89465))

(assert (= (and b!89465 res!73683) b!89466))

(declare-fun m!134311 () Bool)

(assert (=> d!27912 m!134311))

(assert (=> d!27912 m!134255))

(assert (=> b!89401 d!27912))

(declare-fun d!27914 () Bool)

(assert (=> d!27914 (= (invariant!0 (currentBit!4544 thiss!1152) (currentByte!4549 thiss!1152) (size!1905 (buf!2295 thiss!1152))) (and (bvsge (currentBit!4544 thiss!1152) #b00000000000000000000000000000000) (bvslt (currentBit!4544 thiss!1152) #b00000000000000000000000000001000) (bvsge (currentByte!4549 thiss!1152) #b00000000000000000000000000000000) (or (bvslt (currentByte!4549 thiss!1152) (size!1905 (buf!2295 thiss!1152))) (and (= (currentBit!4544 thiss!1152) #b00000000000000000000000000000000) (= (currentByte!4549 thiss!1152) (size!1905 (buf!2295 thiss!1152)))))))))

(assert (=> b!89388 d!27914))

(declare-fun d!27916 () Bool)

(assert (=> d!27916 (= (inv!12 thiss!1152) (invariant!0 (currentBit!4544 thiss!1152) (currentByte!4549 thiss!1152) (size!1905 (buf!2295 thiss!1152))))))

(declare-fun bs!6926 () Bool)

(assert (= bs!6926 d!27916))

(assert (=> bs!6926 m!134257))

(assert (=> start!18114 d!27916))

(declare-fun d!27918 () Bool)

(assert (=> d!27918 (= (inv!12 thiss!1151) (invariant!0 (currentBit!4544 thiss!1151) (currentByte!4549 thiss!1151) (size!1905 (buf!2295 thiss!1151))))))

(declare-fun bs!6927 () Bool)

(assert (= bs!6927 d!27918))

(assert (=> bs!6927 m!134255))

(assert (=> start!18114 d!27918))

(declare-fun d!27920 () Bool)

(assert (=> d!27920 (= (invariant!0 (currentBit!4544 (_2!3982 lt!136506)) (currentByte!4549 (_2!3982 lt!136506)) (size!1905 (buf!2295 (_2!3982 lt!136506)))) (and (bvsge (currentBit!4544 (_2!3982 lt!136506)) #b00000000000000000000000000000000) (bvslt (currentBit!4544 (_2!3982 lt!136506)) #b00000000000000000000000000001000) (bvsge (currentByte!4549 (_2!3982 lt!136506)) #b00000000000000000000000000000000) (or (bvslt (currentByte!4549 (_2!3982 lt!136506)) (size!1905 (buf!2295 (_2!3982 lt!136506)))) (and (= (currentBit!4544 (_2!3982 lt!136506)) #b00000000000000000000000000000000) (= (currentByte!4549 (_2!3982 lt!136506)) (size!1905 (buf!2295 (_2!3982 lt!136506))))))))))

(assert (=> b!89389 d!27920))

(declare-fun d!27922 () Bool)

(assert (=> d!27922 (= (array_inv!1751 (buf!2295 thiss!1152)) (bvsge (size!1905 (buf!2295 thiss!1152)) #b00000000000000000000000000000000))))

(assert (=> b!89387 d!27922))

(declare-fun d!27924 () Bool)

(declare-fun e!59108 () Bool)

(assert (=> d!27924 e!59108))

(declare-fun res!73684 () Bool)

(assert (=> d!27924 (=> (not res!73684) (not e!59108))))

(declare-fun lt!136555 () (_ BitVec 64))

(declare-fun lt!136556 () (_ BitVec 64))

(declare-fun lt!136552 () (_ BitVec 64))

(assert (=> d!27924 (= res!73684 (= lt!136555 (bvsub lt!136556 lt!136552)))))

(assert (=> d!27924 (or (= (bvand lt!136556 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!136552 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!136556 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!136556 lt!136552) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27924 (= lt!136552 (remainingBits!0 ((_ sign_extend 32) (size!1905 (buf!2295 (_1!3984 lt!136505)))) ((_ sign_extend 32) (currentByte!4549 (_1!3984 lt!136505))) ((_ sign_extend 32) (currentBit!4544 (_1!3984 lt!136505)))))))

(declare-fun lt!136557 () (_ BitVec 64))

(declare-fun lt!136553 () (_ BitVec 64))

(assert (=> d!27924 (= lt!136556 (bvmul lt!136557 lt!136553))))

(assert (=> d!27924 (or (= lt!136557 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!136553 (bvsdiv (bvmul lt!136557 lt!136553) lt!136557)))))

(assert (=> d!27924 (= lt!136553 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27924 (= lt!136557 ((_ sign_extend 32) (size!1905 (buf!2295 (_1!3984 lt!136505)))))))

(assert (=> d!27924 (= lt!136555 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4549 (_1!3984 lt!136505))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4544 (_1!3984 lt!136505)))))))

(assert (=> d!27924 (invariant!0 (currentBit!4544 (_1!3984 lt!136505)) (currentByte!4549 (_1!3984 lt!136505)) (size!1905 (buf!2295 (_1!3984 lt!136505))))))

(assert (=> d!27924 (= (bitIndex!0 (size!1905 (buf!2295 (_1!3984 lt!136505))) (currentByte!4549 (_1!3984 lt!136505)) (currentBit!4544 (_1!3984 lt!136505))) lt!136555)))

(declare-fun b!89467 () Bool)

(declare-fun res!73685 () Bool)

(assert (=> b!89467 (=> (not res!73685) (not e!59108))))

(assert (=> b!89467 (= res!73685 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!136555))))

(declare-fun b!89468 () Bool)

(declare-fun lt!136554 () (_ BitVec 64))

(assert (=> b!89468 (= e!59108 (bvsle lt!136555 (bvmul lt!136554 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!89468 (or (= lt!136554 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!136554 #b0000000000000000000000000000000000000000000000000000000000001000) lt!136554)))))

(assert (=> b!89468 (= lt!136554 ((_ sign_extend 32) (size!1905 (buf!2295 (_1!3984 lt!136505)))))))

(assert (= (and d!27924 res!73684) b!89467))

(assert (= (and b!89467 res!73685) b!89468))

(declare-fun m!134313 () Bool)

(assert (=> d!27924 m!134313))

(declare-fun m!134315 () Bool)

(assert (=> d!27924 m!134315))

(assert (=> b!89398 d!27924))

(declare-fun d!27926 () Bool)

(assert (=> d!27926 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1905 (buf!2295 thiss!1152))) ((_ sign_extend 32) (currentByte!4549 thiss!1152)) ((_ sign_extend 32) (currentBit!4544 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1905 (buf!2295 thiss!1152))) ((_ sign_extend 32) (currentByte!4549 thiss!1152)) ((_ sign_extend 32) (currentBit!4544 thiss!1152))) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun bs!6928 () Bool)

(assert (= bs!6928 d!27926))

(assert (=> bs!6928 m!134309))

(assert (=> b!89396 d!27926))

(declare-fun d!27928 () Bool)

(assert (=> d!27928 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1905 (buf!2295 thiss!1151))) ((_ sign_extend 32) (currentByte!4549 thiss!1151)) ((_ sign_extend 32) (currentBit!4544 thiss!1151)) ((_ sign_extend 32) nBits!336)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1905 (buf!2295 thiss!1151))) ((_ sign_extend 32) (currentByte!4549 thiss!1151)) ((_ sign_extend 32) (currentBit!4544 thiss!1151))) ((_ sign_extend 32) nBits!336)))))

(declare-fun bs!6929 () Bool)

(assert (= bs!6929 d!27928))

(assert (=> bs!6929 m!134311))

(assert (=> b!89386 d!27928))

(declare-fun b!89509 () Bool)

(declare-fun res!73725 () Bool)

(declare-fun e!59123 () Bool)

(assert (=> b!89509 (=> (not res!73725) (not e!59123))))

(declare-fun lt!136600 () tuple3!420)

(assert (=> b!89509 (= res!73725 (and (bvsle (_3!234 lt!136600) nBits!336) (= (size!1905 (buf!2295 (_2!3982 lt!136600))) (size!1905 (buf!2295 thiss!1151)))))))

(declare-fun b!89510 () Bool)

(declare-fun e!59125 () tuple3!420)

(declare-fun lt!136601 () tuple2!7496)

(declare-fun lt!136598 () (_ BitVec 32))

(declare-fun Unit!5797 () Unit!5793)

(assert (=> b!89510 (= e!59125 (tuple3!421 Unit!5797 (_2!3983 lt!136601) lt!136598))))

(declare-fun b!89511 () Bool)

(declare-fun res!73733 () Bool)

(declare-fun e!59124 () Bool)

(assert (=> b!89511 (=> (not res!73733) (not e!59124))))

(declare-fun lt!136605 () tuple2!7496)

(assert (=> b!89511 (= res!73733 (= (bitIndex!0 (size!1905 (buf!2295 (_2!3983 lt!136605))) (currentByte!4549 (_2!3983 lt!136605)) (currentBit!4544 (_2!3983 lt!136605))) (bvadd (bitIndex!0 (size!1905 (buf!2295 (_2!3983 lt!136501))) (currentByte!4549 (_2!3983 lt!136501)) (currentBit!4544 (_2!3983 lt!136501))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!89512 () Bool)

(declare-fun res!73734 () Bool)

(declare-fun e!59127 () Bool)

(assert (=> b!89512 (=> (not res!73734) (not e!59127))))

(assert (=> b!89512 (= res!73734 (validate_offset_bits!1 ((_ sign_extend 32) (size!1905 (buf!2295 (_2!3983 lt!136501)))) ((_ sign_extend 32) (currentByte!4549 (_2!3983 lt!136501))) ((_ sign_extend 32) (currentBit!4544 (_2!3983 lt!136501))) ((_ sign_extend 32) (bvsub nBits!336 (bvadd #b00000000000000000000000000000001 i!576)))))))

(declare-fun b!89513 () Bool)

(assert (=> b!89513 (= e!59125 (appendBitsLSBFirstWhileWhile!0 nBits!336 thiss!1151 v!179 (_2!3983 lt!136601) lt!136598))))

(declare-fun b!89514 () Bool)

(declare-fun res!73723 () Bool)

(assert (=> b!89514 (=> (not res!73723) (not e!59123))))

(assert (=> b!89514 (= res!73723 (invariant!0 (currentBit!4544 (_2!3982 lt!136600)) (currentByte!4549 (_2!3982 lt!136600)) (size!1905 (buf!2295 (_2!3982 lt!136600)))))))

(declare-fun d!27930 () Bool)

(assert (=> d!27930 e!59123))

(declare-fun res!73722 () Bool)

(assert (=> d!27930 (=> (not res!73722) (not e!59123))))

(assert (=> d!27930 (= res!73722 (bvsge (_3!234 lt!136600) #b00000000000000000000000000000000))))

(assert (=> d!27930 (= lt!136600 e!59125)))

(declare-fun c!5861 () Bool)

(assert (=> d!27930 (= c!5861 (bvslt lt!136598 nBits!336))))

(assert (=> d!27930 (= lt!136598 (bvadd #b00000000000000000000000000000001 i!576 #b00000000000000000000000000000001))))

(assert (=> d!27930 (= lt!136601 lt!136605)))

(assert (=> d!27930 e!59124))

(declare-fun res!73724 () Bool)

(assert (=> d!27930 (=> (not res!73724) (not e!59124))))

(assert (=> d!27930 (= res!73724 (= (size!1905 (buf!2295 (_2!3983 lt!136501))) (size!1905 (buf!2295 (_2!3983 lt!136605)))))))

(declare-fun lt!136603 () Bool)

(assert (=> d!27930 (= lt!136605 (appendBit!0 (_2!3983 lt!136501) lt!136603))))

(assert (=> d!27930 (= lt!136603 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!576)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27930 e!59127))

(declare-fun res!73726 () Bool)

(assert (=> d!27930 (=> (not res!73726) (not e!59127))))

(assert (=> d!27930 (= res!73726 (bvsge (bvadd #b00000000000000000000000000000001 i!576) #b00000000000000000000000000000000))))

(assert (=> d!27930 (= (appendBitsLSBFirstWhileWhile!0 nBits!336 thiss!1151 v!179 (_2!3983 lt!136501) (bvadd #b00000000000000000000000000000001 i!576)) lt!136600)))

(declare-fun b!89515 () Bool)

(declare-fun e!59126 () Bool)

(assert (=> b!89515 (= e!59124 e!59126)))

(declare-fun res!73735 () Bool)

(assert (=> b!89515 (=> (not res!73735) (not e!59126))))

(declare-fun lt!136602 () tuple2!7498)

(assert (=> b!89515 (= res!73735 (and (= (_2!3984 lt!136602) lt!136603) (= (_1!3984 lt!136602) (_2!3983 lt!136605))))))

(assert (=> b!89515 (= lt!136602 (readBitPure!0 (readerFrom!0 (_2!3983 lt!136605) (currentBit!4544 (_2!3983 lt!136501)) (currentByte!4549 (_2!3983 lt!136501)))))))

(declare-fun b!89516 () Bool)

(declare-fun res!73731 () Bool)

(assert (=> b!89516 (=> (not res!73731) (not e!59123))))

(declare-fun lt!136599 () (_ BitVec 64))

(declare-fun lt!136604 () (_ BitVec 64))

(assert (=> b!89516 (= res!73731 (= (bitIndex!0 (size!1905 (buf!2295 (_2!3982 lt!136600))) (currentByte!4549 (_2!3982 lt!136600)) (currentBit!4544 (_2!3982 lt!136600))) (bvadd lt!136604 lt!136599)))))

(assert (=> b!89516 (or (not (= (bvand lt!136604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!136599 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!136604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!136604 lt!136599) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!89516 (= lt!136599 ((_ sign_extend 32) (_3!234 lt!136600)))))

(assert (=> b!89516 (= lt!136604 (bitIndex!0 (size!1905 (buf!2295 thiss!1151)) (currentByte!4549 thiss!1151) (currentBit!4544 thiss!1151)))))

(declare-fun b!89517 () Bool)

(declare-fun res!73729 () Bool)

(assert (=> b!89517 (=> (not res!73729) (not e!59127))))

(assert (=> b!89517 (= res!73729 (= (bitIndex!0 (size!1905 (buf!2295 (_2!3983 lt!136501))) (currentByte!4549 (_2!3983 lt!136501)) (currentBit!4544 (_2!3983 lt!136501))) (bvadd (bitIndex!0 (size!1905 (buf!2295 thiss!1151)) (currentByte!4549 thiss!1151) (currentBit!4544 thiss!1151)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!576)))))))

(declare-fun b!89518 () Bool)

(assert (=> b!89518 (= e!59123 (bvsge (_3!234 lt!136600) nBits!336))))

(declare-fun b!89519 () Bool)

(assert (=> b!89519 (= e!59126 (= (bitIndex!0 (size!1905 (buf!2295 (_1!3984 lt!136602))) (currentByte!4549 (_1!3984 lt!136602)) (currentBit!4544 (_1!3984 lt!136602))) (bitIndex!0 (size!1905 (buf!2295 (_2!3983 lt!136605))) (currentByte!4549 (_2!3983 lt!136605)) (currentBit!4544 (_2!3983 lt!136605)))))))

(declare-fun b!89520 () Bool)

(declare-fun res!73730 () Bool)

(assert (=> b!89520 (=> (not res!73730) (not e!59127))))

(assert (=> b!89520 (= res!73730 (invariant!0 (currentBit!4544 (_2!3983 lt!136501)) (currentByte!4549 (_2!3983 lt!136501)) (size!1905 (buf!2295 (_2!3983 lt!136501)))))))

(declare-fun b!89521 () Bool)

(declare-fun res!73732 () Bool)

(assert (=> b!89521 (=> (not res!73732) (not e!59123))))

(assert (=> b!89521 (= res!73732 (validate_offset_bits!1 ((_ sign_extend 32) (size!1905 (buf!2295 (_2!3982 lt!136600)))) ((_ sign_extend 32) (currentByte!4549 (_2!3982 lt!136600))) ((_ sign_extend 32) (currentBit!4544 (_2!3982 lt!136600))) ((_ sign_extend 32) (bvsub nBits!336 (_3!234 lt!136600)))))))

(assert (=> b!89521 (or (= (bvand nBits!336 #b10000000000000000000000000000000) (bvand (_3!234 lt!136600) #b10000000000000000000000000000000)) (= (bvand nBits!336 #b10000000000000000000000000000000) (bvand (bvsub nBits!336 (_3!234 lt!136600)) #b10000000000000000000000000000000)))))

(declare-fun b!89522 () Bool)

(declare-fun res!73728 () Bool)

(assert (=> b!89522 (=> (not res!73728) (not e!59124))))

(assert (=> b!89522 (= res!73728 (isPrefixOf!0 (_2!3983 lt!136501) (_2!3983 lt!136605)))))

(declare-fun b!89523 () Bool)

(assert (=> b!89523 (= e!59127 (bvslt (bvadd #b00000000000000000000000000000001 i!576) nBits!336))))

(declare-fun b!89524 () Bool)

(declare-fun res!73727 () Bool)

(assert (=> b!89524 (=> (not res!73727) (not e!59127))))

(assert (=> b!89524 (= res!73727 (and (bvsle (bvadd #b00000000000000000000000000000001 i!576) nBits!336) (= (size!1905 (buf!2295 (_2!3983 lt!136501))) (size!1905 (buf!2295 thiss!1151)))))))

(assert (= (and d!27930 res!73726) b!89520))

(assert (= (and b!89520 res!73730) b!89524))

(assert (= (and b!89524 res!73727) b!89517))

(assert (= (and b!89517 res!73729) b!89512))

(assert (= (and b!89512 res!73734) b!89523))

(assert (= (and d!27930 res!73724) b!89511))

(assert (= (and b!89511 res!73733) b!89522))

(assert (= (and b!89522 res!73728) b!89515))

(assert (= (and b!89515 res!73735) b!89519))

(assert (= (and d!27930 c!5861) b!89513))

(assert (= (and d!27930 (not c!5861)) b!89510))

(assert (= (and d!27930 res!73722) b!89514))

(assert (= (and b!89514 res!73723) b!89509))

(assert (= (and b!89509 res!73725) b!89516))

(assert (= (and b!89516 res!73731) b!89521))

(assert (= (and b!89521 res!73732) b!89518))

(declare-fun m!134321 () Bool)

(assert (=> b!89516 m!134321))

(assert (=> b!89516 m!134249))

(declare-fun m!134323 () Bool)

(assert (=> d!27930 m!134323))

(declare-fun m!134325 () Bool)

(assert (=> b!89514 m!134325))

(assert (=> b!89520 m!134251))

(declare-fun m!134327 () Bool)

(assert (=> b!89512 m!134327))

(declare-fun m!134329 () Bool)

(assert (=> b!89515 m!134329))

(assert (=> b!89515 m!134329))

(declare-fun m!134331 () Bool)

(assert (=> b!89515 m!134331))

(assert (=> b!89517 m!134269))

(assert (=> b!89517 m!134249))

(declare-fun m!134333 () Bool)

(assert (=> b!89521 m!134333))

(declare-fun m!134335 () Bool)

(assert (=> b!89513 m!134335))

(declare-fun m!134337 () Bool)

(assert (=> b!89522 m!134337))

(declare-fun m!134339 () Bool)

(assert (=> b!89511 m!134339))

(assert (=> b!89511 m!134269))

(declare-fun m!134341 () Bool)

(assert (=> b!89519 m!134341))

(assert (=> b!89519 m!134339))

(assert (=> b!89397 d!27930))

(declare-fun d!27946 () Bool)

(declare-fun e!59128 () Bool)

(assert (=> d!27946 e!59128))

(declare-fun res!73736 () Bool)

(assert (=> d!27946 (=> (not res!73736) (not e!59128))))

(declare-fun lt!136609 () (_ BitVec 64))

(declare-fun lt!136610 () (_ BitVec 64))

(declare-fun lt!136606 () (_ BitVec 64))

(assert (=> d!27946 (= res!73736 (= lt!136609 (bvsub lt!136610 lt!136606)))))

(assert (=> d!27946 (or (= (bvand lt!136610 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!136606 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!136610 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!136610 lt!136606) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27946 (= lt!136606 (remainingBits!0 ((_ sign_extend 32) (size!1905 (buf!2295 (_2!3983 lt!136501)))) ((_ sign_extend 32) (currentByte!4549 (_2!3983 lt!136501))) ((_ sign_extend 32) (currentBit!4544 (_2!3983 lt!136501)))))))

(declare-fun lt!136611 () (_ BitVec 64))

(declare-fun lt!136607 () (_ BitVec 64))

(assert (=> d!27946 (= lt!136610 (bvmul lt!136611 lt!136607))))

(assert (=> d!27946 (or (= lt!136611 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!136607 (bvsdiv (bvmul lt!136611 lt!136607) lt!136611)))))

(assert (=> d!27946 (= lt!136607 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27946 (= lt!136611 ((_ sign_extend 32) (size!1905 (buf!2295 (_2!3983 lt!136501)))))))

(assert (=> d!27946 (= lt!136609 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4549 (_2!3983 lt!136501))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4544 (_2!3983 lt!136501)))))))

(assert (=> d!27946 (invariant!0 (currentBit!4544 (_2!3983 lt!136501)) (currentByte!4549 (_2!3983 lt!136501)) (size!1905 (buf!2295 (_2!3983 lt!136501))))))

(assert (=> d!27946 (= (bitIndex!0 (size!1905 (buf!2295 (_2!3983 lt!136501))) (currentByte!4549 (_2!3983 lt!136501)) (currentBit!4544 (_2!3983 lt!136501))) lt!136609)))

(declare-fun b!89525 () Bool)

(declare-fun res!73737 () Bool)

(assert (=> b!89525 (=> (not res!73737) (not e!59128))))

(assert (=> b!89525 (= res!73737 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!136609))))

(declare-fun b!89526 () Bool)

(declare-fun lt!136608 () (_ BitVec 64))

(assert (=> b!89526 (= e!59128 (bvsle lt!136609 (bvmul lt!136608 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!89526 (or (= lt!136608 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!136608 #b0000000000000000000000000000000000000000000000000000000000001000) lt!136608)))))

(assert (=> b!89526 (= lt!136608 ((_ sign_extend 32) (size!1905 (buf!2295 (_2!3983 lt!136501)))))))

(assert (= (and d!27946 res!73736) b!89525))

(assert (= (and b!89525 res!73737) b!89526))

(declare-fun m!134343 () Bool)

(assert (=> d!27946 m!134343))

(assert (=> d!27946 m!134251))

(assert (=> b!89395 d!27946))

(declare-fun d!27948 () Bool)

(assert (=> d!27948 (= (array_inv!1751 (buf!2295 thiss!1151)) (bvsge (size!1905 (buf!2295 thiss!1151)) #b00000000000000000000000000000000))))

(assert (=> b!89385 d!27948))

(declare-fun d!27950 () Bool)

(declare-datatypes ((tuple2!7504 0))(
  ( (tuple2!7505 (_1!3988 Bool) (_2!3988 BitStream!3372)) )
))
(declare-fun lt!136614 () tuple2!7504)

(declare-fun readBit!0 (BitStream!3372) tuple2!7504)

(assert (=> d!27950 (= lt!136614 (readBit!0 (readerFrom!0 (_2!3983 lt!136501) (currentBit!4544 thiss!1152) (currentByte!4549 thiss!1152))))))

(assert (=> d!27950 (= (readBitPure!0 (readerFrom!0 (_2!3983 lt!136501) (currentBit!4544 thiss!1152) (currentByte!4549 thiss!1152))) (tuple2!7499 (_2!3988 lt!136614) (_1!3988 lt!136614)))))

(declare-fun bs!6931 () Bool)

(assert (= bs!6931 d!27950))

(assert (=> bs!6931 m!134241))

(declare-fun m!134345 () Bool)

(assert (=> bs!6931 m!134345))

(assert (=> b!89394 d!27950))

(declare-fun d!27952 () Bool)

(declare-fun e!59131 () Bool)

(assert (=> d!27952 e!59131))

(declare-fun res!73741 () Bool)

(assert (=> d!27952 (=> (not res!73741) (not e!59131))))

(assert (=> d!27952 (= res!73741 (invariant!0 (currentBit!4544 (_2!3983 lt!136501)) (currentByte!4549 (_2!3983 lt!136501)) (size!1905 (buf!2295 (_2!3983 lt!136501)))))))

(assert (=> d!27952 (= (readerFrom!0 (_2!3983 lt!136501) (currentBit!4544 thiss!1152) (currentByte!4549 thiss!1152)) (BitStream!3373 (buf!2295 (_2!3983 lt!136501)) (currentByte!4549 thiss!1152) (currentBit!4544 thiss!1152)))))

(declare-fun b!89529 () Bool)

(assert (=> b!89529 (= e!59131 (invariant!0 (currentBit!4544 thiss!1152) (currentByte!4549 thiss!1152) (size!1905 (buf!2295 (_2!3983 lt!136501)))))))

(assert (= (and d!27952 res!73741) b!89529))

(assert (=> d!27952 m!134251))

(declare-fun m!134347 () Bool)

(assert (=> b!89529 m!134347))

(assert (=> b!89394 d!27952))

(declare-fun d!27954 () Bool)

(assert (=> d!27954 (= (invariant!0 (currentBit!4544 (_2!3983 lt!136501)) (currentByte!4549 (_2!3983 lt!136501)) (size!1905 (buf!2295 (_2!3983 lt!136501)))) (and (bvsge (currentBit!4544 (_2!3983 lt!136501)) #b00000000000000000000000000000000) (bvslt (currentBit!4544 (_2!3983 lt!136501)) #b00000000000000000000000000001000) (bvsge (currentByte!4549 (_2!3983 lt!136501)) #b00000000000000000000000000000000) (or (bvslt (currentByte!4549 (_2!3983 lt!136501)) (size!1905 (buf!2295 (_2!3983 lt!136501)))) (and (= (currentBit!4544 (_2!3983 lt!136501)) #b00000000000000000000000000000000) (= (currentByte!4549 (_2!3983 lt!136501)) (size!1905 (buf!2295 (_2!3983 lt!136501))))))))))

(assert (=> b!89392 d!27954))

(declare-fun d!27956 () Bool)

(declare-fun e!59140 () Bool)

(assert (=> d!27956 e!59140))

(declare-fun res!73757 () Bool)

(assert (=> d!27956 (=> (not res!73757) (not e!59140))))

(declare-fun lt!136644 () tuple2!7496)

(assert (=> d!27956 (= res!73757 (= (size!1905 (buf!2295 thiss!1152)) (size!1905 (buf!2295 (_2!3983 lt!136644)))))))

(declare-fun choose!16 (BitStream!3372 Bool) tuple2!7496)

(assert (=> d!27956 (= lt!136644 (choose!16 thiss!1152 lt!136502))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!27956 (validate_offset_bit!0 ((_ sign_extend 32) (size!1905 (buf!2295 thiss!1152))) ((_ sign_extend 32) (currentByte!4549 thiss!1152)) ((_ sign_extend 32) (currentBit!4544 thiss!1152)))))

(assert (=> d!27956 (= (appendBit!0 thiss!1152 lt!136502) lt!136644)))

(declare-fun b!89548 () Bool)

(declare-fun e!59139 () Bool)

(assert (=> b!89548 (= e!59140 e!59139)))

(declare-fun res!73756 () Bool)

(assert (=> b!89548 (=> (not res!73756) (not e!59139))))

(declare-fun lt!136643 () tuple2!7498)

(assert (=> b!89548 (= res!73756 (and (= (_2!3984 lt!136643) lt!136502) (= (_1!3984 lt!136643) (_2!3983 lt!136644))))))

(assert (=> b!89548 (= lt!136643 (readBitPure!0 (readerFrom!0 (_2!3983 lt!136644) (currentBit!4544 thiss!1152) (currentByte!4549 thiss!1152))))))

(declare-fun b!89546 () Bool)

(declare-fun res!73758 () Bool)

(assert (=> b!89546 (=> (not res!73758) (not e!59140))))

(declare-fun lt!136645 () (_ BitVec 64))

(declare-fun lt!136646 () (_ BitVec 64))

(assert (=> b!89546 (= res!73758 (= (bitIndex!0 (size!1905 (buf!2295 (_2!3983 lt!136644))) (currentByte!4549 (_2!3983 lt!136644)) (currentBit!4544 (_2!3983 lt!136644))) (bvadd lt!136646 lt!136645)))))

(assert (=> b!89546 (or (not (= (bvand lt!136646 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!136645 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!136646 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!136646 lt!136645) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!89546 (= lt!136645 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!89546 (= lt!136646 (bitIndex!0 (size!1905 (buf!2295 thiss!1152)) (currentByte!4549 thiss!1152) (currentBit!4544 thiss!1152)))))

(declare-fun b!89549 () Bool)

(assert (=> b!89549 (= e!59139 (= (bitIndex!0 (size!1905 (buf!2295 (_1!3984 lt!136643))) (currentByte!4549 (_1!3984 lt!136643)) (currentBit!4544 (_1!3984 lt!136643))) (bitIndex!0 (size!1905 (buf!2295 (_2!3983 lt!136644))) (currentByte!4549 (_2!3983 lt!136644)) (currentBit!4544 (_2!3983 lt!136644)))))))

(declare-fun b!89547 () Bool)

(declare-fun res!73759 () Bool)

(assert (=> b!89547 (=> (not res!73759) (not e!59140))))

(assert (=> b!89547 (= res!73759 (isPrefixOf!0 thiss!1152 (_2!3983 lt!136644)))))

(assert (= (and d!27956 res!73757) b!89546))

(assert (= (and b!89546 res!73758) b!89547))

(assert (= (and b!89547 res!73759) b!89548))

(assert (= (and b!89548 res!73756) b!89549))

(declare-fun m!134353 () Bool)

(assert (=> b!89547 m!134353))

(declare-fun m!134355 () Bool)

(assert (=> b!89548 m!134355))

(assert (=> b!89548 m!134355))

(declare-fun m!134357 () Bool)

(assert (=> b!89548 m!134357))

(declare-fun m!134359 () Bool)

(assert (=> b!89546 m!134359))

(assert (=> b!89546 m!134247))

(declare-fun m!134361 () Bool)

(assert (=> d!27956 m!134361))

(declare-fun m!134363 () Bool)

(assert (=> d!27956 m!134363))

(declare-fun m!134365 () Bool)

(assert (=> b!89549 m!134365))

(assert (=> b!89549 m!134359))

(assert (=> b!89392 d!27956))

(declare-fun d!27962 () Bool)

(declare-fun res!73792 () Bool)

(declare-fun e!59156 () Bool)

(assert (=> d!27962 (=> (not res!73792) (not e!59156))))

(assert (=> d!27962 (= res!73792 (= (size!1905 (buf!2295 thiss!1152)) (size!1905 (buf!2295 (_2!3983 lt!136501)))))))

(assert (=> d!27962 (= (isPrefixOf!0 thiss!1152 (_2!3983 lt!136501)) e!59156)))

(declare-fun b!89580 () Bool)

(declare-fun res!73794 () Bool)

(assert (=> b!89580 (=> (not res!73794) (not e!59156))))

(assert (=> b!89580 (= res!73794 (bvsle (bitIndex!0 (size!1905 (buf!2295 thiss!1152)) (currentByte!4549 thiss!1152) (currentBit!4544 thiss!1152)) (bitIndex!0 (size!1905 (buf!2295 (_2!3983 lt!136501))) (currentByte!4549 (_2!3983 lt!136501)) (currentBit!4544 (_2!3983 lt!136501)))))))

(declare-fun b!89581 () Bool)

(declare-fun e!59155 () Bool)

(assert (=> b!89581 (= e!59156 e!59155)))

(declare-fun res!73793 () Bool)

(assert (=> b!89581 (=> res!73793 e!59155)))

(assert (=> b!89581 (= res!73793 (= (size!1905 (buf!2295 thiss!1152)) #b00000000000000000000000000000000))))

(declare-fun b!89582 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4220 array!4220 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!89582 (= e!59155 (arrayBitRangesEq!0 (buf!2295 thiss!1152) (buf!2295 (_2!3983 lt!136501)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1905 (buf!2295 thiss!1152)) (currentByte!4549 thiss!1152) (currentBit!4544 thiss!1152))))))

(assert (= (and d!27962 res!73792) b!89580))

(assert (= (and b!89580 res!73794) b!89581))

(assert (= (and b!89581 (not res!73793)) b!89582))

(assert (=> b!89580 m!134247))

(assert (=> b!89580 m!134269))

(assert (=> b!89582 m!134247))

(assert (=> b!89582 m!134247))

(declare-fun m!134383 () Bool)

(assert (=> b!89582 m!134383))

(assert (=> b!89391 d!27962))

(check-sat (not b!89521) (not d!27926) (not d!27956) (not b!89520) (not b!89512) (not b!89522) (not b!89516) (not d!27910) (not d!27946) (not d!27928) (not b!89548) (not d!27930) (not b!89546) (not b!89511) (not d!27950) (not b!89515) (not b!89513) (not b!89549) (not b!89517) (not b!89547) (not d!27952) (not d!27912) (not d!27924) (not b!89514) (not b!89580) (not d!27916) (not b!89529) (not b!89519) (not d!27918) (not b!89582))
