; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39174 () Bool)

(assert start!39174)

(declare-fun b!176283 () Bool)

(declare-fun res!146015 () Bool)

(declare-fun e!122896 () Bool)

(assert (=> b!176283 (=> (not res!146015) (not e!122896))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-datatypes ((array!9519 0))(
  ( (array!9520 (arr!5130 (Array (_ BitVec 32) (_ BitVec 8))) (size!4200 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7508 0))(
  ( (BitStream!7509 (buf!4643 array!9519) (currentByte!8787 (_ BitVec 32)) (currentBit!8782 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7508)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!176283 (= res!146015 (validate_offset_bits!1 ((_ sign_extend 32) (size!4200 (buf!4643 thiss!1204))) ((_ sign_extend 32) (currentByte!8787 thiss!1204)) ((_ sign_extend 32) (currentBit!8782 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!176284 () Bool)

(declare-fun e!122902 () Bool)

(declare-fun e!122899 () Bool)

(assert (=> b!176284 (= e!122902 e!122899)))

(declare-fun res!146017 () Bool)

(assert (=> b!176284 (=> (not res!146017) (not e!122899))))

(declare-fun lt!271504 () Bool)

(declare-datatypes ((tuple2!15174 0))(
  ( (tuple2!15175 (_1!8232 BitStream!7508) (_2!8232 Bool)) )
))
(declare-fun lt!271505 () tuple2!15174)

(declare-datatypes ((Unit!12714 0))(
  ( (Unit!12715) )
))
(declare-datatypes ((tuple2!15176 0))(
  ( (tuple2!15177 (_1!8233 Unit!12714) (_2!8233 BitStream!7508)) )
))
(declare-fun lt!271506 () tuple2!15176)

(assert (=> b!176284 (= res!146017 (and (= (_2!8232 lt!271505) lt!271504) (= (_1!8232 lt!271505) (_2!8233 lt!271506))))))

(declare-fun readBitPure!0 (BitStream!7508) tuple2!15174)

(declare-fun readerFrom!0 (BitStream!7508 (_ BitVec 32) (_ BitVec 32)) BitStream!7508)

(assert (=> b!176284 (= lt!271505 (readBitPure!0 (readerFrom!0 (_2!8233 lt!271506) (currentBit!8782 thiss!1204) (currentByte!8787 thiss!1204))))))

(declare-fun res!146019 () Bool)

(assert (=> start!39174 (=> (not res!146019) (not e!122896))))

(assert (=> start!39174 (= res!146019 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39174 e!122896))

(assert (=> start!39174 true))

(declare-fun e!122900 () Bool)

(declare-fun inv!12 (BitStream!7508) Bool)

(assert (=> start!39174 (and (inv!12 thiss!1204) e!122900)))

(declare-fun b!176285 () Bool)

(declare-fun e!122897 () Bool)

(assert (=> b!176285 (= e!122896 (not e!122897))))

(declare-fun res!146014 () Bool)

(assert (=> b!176285 (=> res!146014 e!122897)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!176285 (= res!146014 (not (= (bitIndex!0 (size!4200 (buf!4643 (_2!8233 lt!271506))) (currentByte!8787 (_2!8233 lt!271506)) (currentBit!8782 (_2!8233 lt!271506))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4200 (buf!4643 thiss!1204)) (currentByte!8787 thiss!1204) (currentBit!8782 thiss!1204))))))))

(declare-fun e!122898 () Bool)

(assert (=> b!176285 e!122898))

(declare-fun res!146012 () Bool)

(assert (=> b!176285 (=> (not res!146012) (not e!122898))))

(assert (=> b!176285 (= res!146012 (= (size!4200 (buf!4643 thiss!1204)) (size!4200 (buf!4643 (_2!8233 lt!271506)))))))

(declare-fun appendBit!0 (BitStream!7508 Bool) tuple2!15176)

(assert (=> b!176285 (= lt!271506 (appendBit!0 thiss!1204 lt!271504))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!176285 (= lt!271504 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!176286 () Bool)

(declare-fun res!146018 () Bool)

(assert (=> b!176286 (=> (not res!146018) (not e!122896))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!176286 (= res!146018 (invariant!0 (currentBit!8782 thiss!1204) (currentByte!8787 thiss!1204) (size!4200 (buf!4643 thiss!1204))))))

(declare-fun b!176287 () Bool)

(assert (=> b!176287 (= e!122898 e!122902)))

(declare-fun res!146011 () Bool)

(assert (=> b!176287 (=> (not res!146011) (not e!122902))))

(declare-fun lt!271508 () (_ BitVec 64))

(declare-fun lt!271507 () (_ BitVec 64))

(assert (=> b!176287 (= res!146011 (= lt!271508 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!271507)))))

(assert (=> b!176287 (= lt!271508 (bitIndex!0 (size!4200 (buf!4643 (_2!8233 lt!271506))) (currentByte!8787 (_2!8233 lt!271506)) (currentBit!8782 (_2!8233 lt!271506))))))

(assert (=> b!176287 (= lt!271507 (bitIndex!0 (size!4200 (buf!4643 thiss!1204)) (currentByte!8787 thiss!1204) (currentBit!8782 thiss!1204)))))

(declare-fun b!176288 () Bool)

(declare-fun res!146013 () Bool)

(assert (=> b!176288 (=> (not res!146013) (not e!122896))))

(assert (=> b!176288 (= res!146013 (not (= i!590 nBits!348)))))

(declare-fun b!176289 () Bool)

(declare-fun array_inv!3941 (array!9519) Bool)

(assert (=> b!176289 (= e!122900 (array_inv!3941 (buf!4643 thiss!1204)))))

(declare-fun b!176290 () Bool)

(assert (=> b!176290 (= e!122897 (invariant!0 (currentBit!8782 (_2!8233 lt!271506)) (currentByte!8787 (_2!8233 lt!271506)) (size!4200 (buf!4643 (_2!8233 lt!271506)))))))

(declare-fun b!176291 () Bool)

(assert (=> b!176291 (= e!122899 (= (bitIndex!0 (size!4200 (buf!4643 (_1!8232 lt!271505))) (currentByte!8787 (_1!8232 lt!271505)) (currentBit!8782 (_1!8232 lt!271505))) lt!271508))))

(declare-fun b!176292 () Bool)

(declare-fun res!146016 () Bool)

(assert (=> b!176292 (=> (not res!146016) (not e!122902))))

(declare-fun isPrefixOf!0 (BitStream!7508 BitStream!7508) Bool)

(assert (=> b!176292 (= res!146016 (isPrefixOf!0 thiss!1204 (_2!8233 lt!271506)))))

(assert (= (and start!39174 res!146019) b!176283))

(assert (= (and b!176283 res!146015) b!176286))

(assert (= (and b!176286 res!146018) b!176288))

(assert (= (and b!176288 res!146013) b!176285))

(assert (= (and b!176285 res!146012) b!176287))

(assert (= (and b!176287 res!146011) b!176292))

(assert (= (and b!176292 res!146016) b!176284))

(assert (= (and b!176284 res!146017) b!176291))

(assert (= (and b!176285 (not res!146014)) b!176290))

(assert (= start!39174 b!176289))

(declare-fun m!276421 () Bool)

(assert (=> b!176289 m!276421))

(declare-fun m!276423 () Bool)

(assert (=> b!176284 m!276423))

(assert (=> b!176284 m!276423))

(declare-fun m!276425 () Bool)

(assert (=> b!176284 m!276425))

(declare-fun m!276427 () Bool)

(assert (=> b!176285 m!276427))

(declare-fun m!276429 () Bool)

(assert (=> b!176285 m!276429))

(declare-fun m!276431 () Bool)

(assert (=> b!176285 m!276431))

(declare-fun m!276433 () Bool)

(assert (=> b!176283 m!276433))

(declare-fun m!276435 () Bool)

(assert (=> b!176292 m!276435))

(declare-fun m!276437 () Bool)

(assert (=> b!176291 m!276437))

(declare-fun m!276439 () Bool)

(assert (=> b!176290 m!276439))

(declare-fun m!276441 () Bool)

(assert (=> start!39174 m!276441))

(declare-fun m!276443 () Bool)

(assert (=> b!176286 m!276443))

(assert (=> b!176287 m!276427))

(assert (=> b!176287 m!276429))

(push 1)

(assert (not start!39174))

(assert (not b!176287))

(assert (not b!176289))

(assert (not b!176284))

(assert (not b!176290))

(assert (not b!176291))

(assert (not b!176292))

(assert (not b!176283))

(assert (not b!176286))

(assert (not b!176285))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!62161 () Bool)

(declare-fun e!122931 () Bool)

(assert (=> d!62161 e!122931))

(declare-fun res!146073 () Bool)

(assert (=> d!62161 (=> (not res!146073) (not e!122931))))

(declare-fun lt!271604 () (_ BitVec 64))

(declare-fun lt!271601 () (_ BitVec 64))

(declare-fun lt!271600 () (_ BitVec 64))

(assert (=> d!62161 (= res!146073 (= lt!271601 (bvsub lt!271604 lt!271600)))))

(assert (=> d!62161 (or (= (bvand lt!271604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!271600 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!271604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!271604 lt!271600) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!62161 (= lt!271600 (remainingBits!0 ((_ sign_extend 32) (size!4200 (buf!4643 (_1!8232 lt!271505)))) ((_ sign_extend 32) (currentByte!8787 (_1!8232 lt!271505))) ((_ sign_extend 32) (currentBit!8782 (_1!8232 lt!271505)))))))

(declare-fun lt!271599 () (_ BitVec 64))

(declare-fun lt!271603 () (_ BitVec 64))

(assert (=> d!62161 (= lt!271604 (bvmul lt!271599 lt!271603))))

(assert (=> d!62161 (or (= lt!271599 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!271603 (bvsdiv (bvmul lt!271599 lt!271603) lt!271599)))))

(assert (=> d!62161 (= lt!271603 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62161 (= lt!271599 ((_ sign_extend 32) (size!4200 (buf!4643 (_1!8232 lt!271505)))))))

(assert (=> d!62161 (= lt!271601 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8787 (_1!8232 lt!271505))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8782 (_1!8232 lt!271505)))))))

(assert (=> d!62161 (invariant!0 (currentBit!8782 (_1!8232 lt!271505)) (currentByte!8787 (_1!8232 lt!271505)) (size!4200 (buf!4643 (_1!8232 lt!271505))))))

(assert (=> d!62161 (= (bitIndex!0 (size!4200 (buf!4643 (_1!8232 lt!271505))) (currentByte!8787 (_1!8232 lt!271505)) (currentBit!8782 (_1!8232 lt!271505))) lt!271601)))

(declare-fun b!176343 () Bool)

(declare-fun res!146072 () Bool)

(assert (=> b!176343 (=> (not res!146072) (not e!122931))))

(assert (=> b!176343 (= res!146072 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!271601))))

(declare-fun b!176344 () Bool)

(declare-fun lt!271602 () (_ BitVec 64))

(assert (=> b!176344 (= e!122931 (bvsle lt!271601 (bvmul lt!271602 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!176344 (or (= lt!271602 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!271602 #b0000000000000000000000000000000000000000000000000000000000001000) lt!271602)))))

(assert (=> b!176344 (= lt!271602 ((_ sign_extend 32) (size!4200 (buf!4643 (_1!8232 lt!271505)))))))

(assert (= (and d!62161 res!146073) b!176343))

(assert (= (and b!176343 res!146072) b!176344))

(declare-fun m!276479 () Bool)

(assert (=> d!62161 m!276479))

(declare-fun m!276481 () Bool)

(assert (=> d!62161 m!276481))

(assert (=> b!176291 d!62161))

(declare-fun d!62179 () Bool)

(assert (=> d!62179 (= (invariant!0 (currentBit!8782 (_2!8233 lt!271506)) (currentByte!8787 (_2!8233 lt!271506)) (size!4200 (buf!4643 (_2!8233 lt!271506)))) (and (bvsge (currentBit!8782 (_2!8233 lt!271506)) #b00000000000000000000000000000000) (bvslt (currentBit!8782 (_2!8233 lt!271506)) #b00000000000000000000000000001000) (bvsge (currentByte!8787 (_2!8233 lt!271506)) #b00000000000000000000000000000000) (or (bvslt (currentByte!8787 (_2!8233 lt!271506)) (size!4200 (buf!4643 (_2!8233 lt!271506)))) (and (= (currentBit!8782 (_2!8233 lt!271506)) #b00000000000000000000000000000000) (= (currentByte!8787 (_2!8233 lt!271506)) (size!4200 (buf!4643 (_2!8233 lt!271506))))))))))

(assert (=> b!176290 d!62179))

(declare-fun d!62181 () Bool)

(declare-fun e!122937 () Bool)

(assert (=> d!62181 e!122937))

(declare-fun res!146082 () Bool)

(assert (=> d!62181 (=> (not res!146082) (not e!122937))))

(declare-fun lt!271608 () (_ BitVec 64))

(declare-fun lt!271609 () (_ BitVec 64))

(declare-fun lt!271612 () (_ BitVec 64))

(assert (=> d!62181 (= res!146082 (= lt!271609 (bvsub lt!271612 lt!271608)))))

(assert (=> d!62181 (or (= (bvand lt!271612 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!271608 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!271612 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!271612 lt!271608) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62181 (= lt!271608 (remainingBits!0 ((_ sign_extend 32) (size!4200 (buf!4643 (_2!8233 lt!271506)))) ((_ sign_extend 32) (currentByte!8787 (_2!8233 lt!271506))) ((_ sign_extend 32) (currentBit!8782 (_2!8233 lt!271506)))))))

(declare-fun lt!271607 () (_ BitVec 64))

(declare-fun lt!271611 () (_ BitVec 64))

(assert (=> d!62181 (= lt!271612 (bvmul lt!271607 lt!271611))))

(assert (=> d!62181 (or (= lt!271607 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!271611 (bvsdiv (bvmul lt!271607 lt!271611) lt!271607)))))

(assert (=> d!62181 (= lt!271611 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62181 (= lt!271607 ((_ sign_extend 32) (size!4200 (buf!4643 (_2!8233 lt!271506)))))))

(assert (=> d!62181 (= lt!271609 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8787 (_2!8233 lt!271506))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8782 (_2!8233 lt!271506)))))))

(assert (=> d!62181 (invariant!0 (currentBit!8782 (_2!8233 lt!271506)) (currentByte!8787 (_2!8233 lt!271506)) (size!4200 (buf!4643 (_2!8233 lt!271506))))))

(assert (=> d!62181 (= (bitIndex!0 (size!4200 (buf!4643 (_2!8233 lt!271506))) (currentByte!8787 (_2!8233 lt!271506)) (currentBit!8782 (_2!8233 lt!271506))) lt!271609)))

(declare-fun b!176354 () Bool)

(declare-fun res!146080 () Bool)

(assert (=> b!176354 (=> (not res!146080) (not e!122937))))

(assert (=> b!176354 (= res!146080 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!271609))))

(declare-fun b!176355 () Bool)

(declare-fun lt!271610 () (_ BitVec 64))

(assert (=> b!176355 (= e!122937 (bvsle lt!271609 (bvmul lt!271610 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!176355 (or (= lt!271610 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!271610 #b0000000000000000000000000000000000000000000000000000000000001000) lt!271610)))))

(assert (=> b!176355 (= lt!271610 ((_ sign_extend 32) (size!4200 (buf!4643 (_2!8233 lt!271506)))))))

(assert (= (and d!62181 res!146082) b!176354))

(assert (= (and b!176354 res!146080) b!176355))

(declare-fun m!276485 () Bool)

(assert (=> d!62181 m!276485))

(assert (=> d!62181 m!276439))

(assert (=> b!176285 d!62181))

(declare-fun d!62185 () Bool)

(declare-fun e!122938 () Bool)

(assert (=> d!62185 e!122938))

(declare-fun res!146084 () Bool)

(assert (=> d!62185 (=> (not res!146084) (not e!122938))))

(declare-fun lt!271615 () (_ BitVec 64))

(declare-fun lt!271618 () (_ BitVec 64))

(declare-fun lt!271614 () (_ BitVec 64))

(assert (=> d!62185 (= res!146084 (= lt!271615 (bvsub lt!271618 lt!271614)))))

(assert (=> d!62185 (or (= (bvand lt!271618 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!271614 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!271618 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!271618 lt!271614) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62185 (= lt!271614 (remainingBits!0 ((_ sign_extend 32) (size!4200 (buf!4643 thiss!1204))) ((_ sign_extend 32) (currentByte!8787 thiss!1204)) ((_ sign_extend 32) (currentBit!8782 thiss!1204))))))

(declare-fun lt!271613 () (_ BitVec 64))

(declare-fun lt!271617 () (_ BitVec 64))

(assert (=> d!62185 (= lt!271618 (bvmul lt!271613 lt!271617))))

(assert (=> d!62185 (or (= lt!271613 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!271617 (bvsdiv (bvmul lt!271613 lt!271617) lt!271613)))))

(assert (=> d!62185 (= lt!271617 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62185 (= lt!271613 ((_ sign_extend 32) (size!4200 (buf!4643 thiss!1204))))))

(assert (=> d!62185 (= lt!271615 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8787 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8782 thiss!1204))))))

(assert (=> d!62185 (invariant!0 (currentBit!8782 thiss!1204) (currentByte!8787 thiss!1204) (size!4200 (buf!4643 thiss!1204)))))

(assert (=> d!62185 (= (bitIndex!0 (size!4200 (buf!4643 thiss!1204)) (currentByte!8787 thiss!1204) (currentBit!8782 thiss!1204)) lt!271615)))

(declare-fun b!176356 () Bool)

(declare-fun res!146083 () Bool)

(assert (=> b!176356 (=> (not res!146083) (not e!122938))))

(assert (=> b!176356 (= res!146083 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!271615))))

(declare-fun b!176357 () Bool)

(declare-fun lt!271616 () (_ BitVec 64))

(assert (=> b!176357 (= e!122938 (bvsle lt!271615 (bvmul lt!271616 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!176357 (or (= lt!271616 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!271616 #b0000000000000000000000000000000000000000000000000000000000001000) lt!271616)))))

(assert (=> b!176357 (= lt!271616 ((_ sign_extend 32) (size!4200 (buf!4643 thiss!1204))))))

(assert (= (and d!62185 res!146084) b!176356))

(assert (= (and b!176356 res!146083) b!176357))

(declare-fun m!276487 () Bool)

(assert (=> d!62185 m!276487))

(assert (=> d!62185 m!276443))

(assert (=> b!176285 d!62185))

(declare-fun b!176385 () Bool)

(declare-fun e!122953 () Bool)

(declare-fun lt!271637 () tuple2!15174)

(declare-fun lt!271639 () tuple2!15176)

(assert (=> b!176385 (= e!122953 (= (bitIndex!0 (size!4200 (buf!4643 (_1!8232 lt!271637))) (currentByte!8787 (_1!8232 lt!271637)) (currentBit!8782 (_1!8232 lt!271637))) (bitIndex!0 (size!4200 (buf!4643 (_2!8233 lt!271639))) (currentByte!8787 (_2!8233 lt!271639)) (currentBit!8782 (_2!8233 lt!271639)))))))

(declare-fun b!176382 () Bool)

(declare-fun res!146109 () Bool)

(declare-fun e!122952 () Bool)

(assert (=> b!176382 (=> (not res!146109) (not e!122952))))

(declare-fun lt!271640 () (_ BitVec 64))

