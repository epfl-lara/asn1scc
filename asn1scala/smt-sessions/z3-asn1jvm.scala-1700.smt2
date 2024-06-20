; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47158 () Bool)

(assert start!47158)

(declare-fun b!225338 () Bool)

(declare-fun res!189103 () Bool)

(declare-fun e!153773 () Bool)

(assert (=> b!225338 (=> (not res!189103) (not e!153773))))

(declare-datatypes ((array!11185 0))(
  ( (array!11186 (arr!5864 (Array (_ BitVec 32) (_ BitVec 8))) (size!4907 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8916 0))(
  ( (BitStream!8917 (buf!5451 array!11185) (currentByte!10226 (_ BitVec 32)) (currentBit!10221 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8916)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225338 (= res!189103 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4907 (buf!5451 thiss!1870))) ((_ sign_extend 32) (currentByte!10226 thiss!1870)) ((_ sign_extend 32) (currentBit!10221 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!225339 () Bool)

(declare-fun res!189105 () Bool)

(assert (=> b!225339 (=> (not res!189105) (not e!153773))))

(assert (=> b!225339 (= res!189105 (bvsge i!761 to!496))))

(declare-fun b!225340 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!225340 (= e!153773 (not (invariant!0 (currentBit!10221 thiss!1870) (currentByte!10226 thiss!1870) (size!4907 (buf!5451 thiss!1870)))))))

(declare-fun arr!308 () array!11185)

(declare-fun arrayRangesEq!797 (array!11185 array!11185 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!225340 (arrayRangesEq!797 arr!308 arr!308 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((Unit!16559 0))(
  ( (Unit!16560) )
))
(declare-fun lt!358500 () Unit!16559)

(declare-fun arrayRangesEqSlicedLemma!86 (array!11185 array!11185 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16559)

(assert (=> b!225340 (= lt!358500 (arrayRangesEqSlicedLemma!86 arr!308 arr!308 #b00000000000000000000000000000000 (size!4907 arr!308) #b00000000000000000000000000000000 i!761))))

(assert (=> b!225340 (arrayRangesEq!797 arr!308 arr!308 #b00000000000000000000000000000000 (size!4907 arr!308))))

(declare-fun lt!358498 () Unit!16559)

(declare-fun arrayRangesEqReflexiveLemma!101 (array!11185) Unit!16559)

(assert (=> b!225340 (= lt!358498 (arrayRangesEqReflexiveLemma!101 arr!308))))

(declare-fun lt!358499 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!225340 (= lt!358499 (bitIndex!0 (size!4907 (buf!5451 thiss!1870)) (currentByte!10226 thiss!1870) (currentBit!10221 thiss!1870)))))

(declare-fun res!189104 () Bool)

(assert (=> start!47158 (=> (not res!189104) (not e!153773))))

(assert (=> start!47158 (= res!189104 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4907 arr!308))))))

(assert (=> start!47158 e!153773))

(assert (=> start!47158 true))

(declare-fun array_inv!4648 (array!11185) Bool)

(assert (=> start!47158 (array_inv!4648 arr!308)))

(declare-fun e!153770 () Bool)

(declare-fun inv!12 (BitStream!8916) Bool)

(assert (=> start!47158 (and (inv!12 thiss!1870) e!153770)))

(declare-fun b!225341 () Bool)

(assert (=> b!225341 (= e!153770 (array_inv!4648 (buf!5451 thiss!1870)))))

(assert (= (and start!47158 res!189104) b!225338))

(assert (= (and b!225338 res!189103) b!225339))

(assert (= (and b!225339 res!189105) b!225340))

(assert (= start!47158 b!225341))

(declare-fun m!346295 () Bool)

(assert (=> b!225338 m!346295))

(declare-fun m!346297 () Bool)

(assert (=> b!225340 m!346297))

(declare-fun m!346299 () Bool)

(assert (=> b!225340 m!346299))

(declare-fun m!346301 () Bool)

(assert (=> b!225340 m!346301))

(declare-fun m!346303 () Bool)

(assert (=> b!225340 m!346303))

(declare-fun m!346305 () Bool)

(assert (=> b!225340 m!346305))

(declare-fun m!346307 () Bool)

(assert (=> b!225340 m!346307))

(declare-fun m!346309 () Bool)

(assert (=> start!47158 m!346309))

(declare-fun m!346311 () Bool)

(assert (=> start!47158 m!346311))

(declare-fun m!346313 () Bool)

(assert (=> b!225341 m!346313))

(check-sat (not start!47158) (not b!225341) (not b!225338) (not b!225340))
(check-sat)
(get-model)

(declare-fun d!76498 () Bool)

(assert (=> d!76498 (= (array_inv!4648 arr!308) (bvsge (size!4907 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!47158 d!76498))

(declare-fun d!76504 () Bool)

(assert (=> d!76504 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10221 thiss!1870) (currentByte!10226 thiss!1870) (size!4907 (buf!5451 thiss!1870))))))

(declare-fun bs!18676 () Bool)

(assert (= bs!18676 d!76504))

(assert (=> bs!18676 m!346307))

(assert (=> start!47158 d!76504))

(declare-fun d!76510 () Bool)

(assert (=> d!76510 (= (array_inv!4648 (buf!5451 thiss!1870)) (bvsge (size!4907 (buf!5451 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!225341 d!76510))

(declare-fun d!76512 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!76512 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4907 (buf!5451 thiss!1870))) ((_ sign_extend 32) (currentByte!10226 thiss!1870)) ((_ sign_extend 32) (currentBit!10221 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4907 (buf!5451 thiss!1870))) ((_ sign_extend 32) (currentByte!10226 thiss!1870)) ((_ sign_extend 32) (currentBit!10221 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18677 () Bool)

(assert (= bs!18677 d!76512))

(declare-fun m!346351 () Bool)

(assert (=> bs!18677 m!346351))

(assert (=> b!225338 d!76512))

(declare-fun d!76516 () Bool)

(assert (=> d!76516 (arrayRangesEq!797 arr!308 arr!308 #b00000000000000000000000000000000 (size!4907 arr!308))))

(declare-fun lt!358524 () Unit!16559)

(declare-fun choose!314 (array!11185) Unit!16559)

(assert (=> d!76516 (= lt!358524 (choose!314 arr!308))))

(assert (=> d!76516 (= (arrayRangesEqReflexiveLemma!101 arr!308) lt!358524)))

(declare-fun bs!18679 () Bool)

(assert (= bs!18679 d!76516))

(assert (=> bs!18679 m!346299))

(declare-fun m!346355 () Bool)

(assert (=> bs!18679 m!346355))

(assert (=> b!225340 d!76516))

(declare-fun d!76522 () Bool)

(declare-fun res!189133 () Bool)

(declare-fun e!153804 () Bool)

(assert (=> d!76522 (=> res!189133 e!153804)))

(assert (=> d!76522 (= res!189133 (= #b00000000000000000000000000000000 (size!4907 arr!308)))))

(assert (=> d!76522 (= (arrayRangesEq!797 arr!308 arr!308 #b00000000000000000000000000000000 (size!4907 arr!308)) e!153804)))

(declare-fun b!225370 () Bool)

(declare-fun e!153805 () Bool)

(assert (=> b!225370 (= e!153804 e!153805)))

(declare-fun res!189134 () Bool)

(assert (=> b!225370 (=> (not res!189134) (not e!153805))))

(assert (=> b!225370 (= res!189134 (= (select (arr!5864 arr!308) #b00000000000000000000000000000000) (select (arr!5864 arr!308) #b00000000000000000000000000000000)))))

(declare-fun b!225371 () Bool)

(assert (=> b!225371 (= e!153805 (arrayRangesEq!797 arr!308 arr!308 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4907 arr!308)))))

(assert (= (and d!76522 (not res!189133)) b!225370))

(assert (= (and b!225370 res!189134) b!225371))

(declare-fun m!346357 () Bool)

(assert (=> b!225370 m!346357))

(assert (=> b!225370 m!346357))

(declare-fun m!346359 () Bool)

(assert (=> b!225371 m!346359))

(assert (=> b!225340 d!76522))

(declare-fun d!76524 () Bool)

(assert (=> d!76524 (arrayRangesEq!797 arr!308 arr!308 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!358557 () Unit!16559)

(declare-fun choose!315 (array!11185 array!11185 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16559)

(assert (=> d!76524 (= lt!358557 (choose!315 arr!308 arr!308 #b00000000000000000000000000000000 (size!4907 arr!308) #b00000000000000000000000000000000 i!761))))

(assert (=> d!76524 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!4907 arr!308)))))

(assert (=> d!76524 (= (arrayRangesEqSlicedLemma!86 arr!308 arr!308 #b00000000000000000000000000000000 (size!4907 arr!308) #b00000000000000000000000000000000 i!761) lt!358557)))

(declare-fun bs!18682 () Bool)

(assert (= bs!18682 d!76524))

(assert (=> bs!18682 m!346301))

(declare-fun m!346365 () Bool)

(assert (=> bs!18682 m!346365))

(assert (=> b!225340 d!76524))

(declare-fun d!76536 () Bool)

(assert (=> d!76536 (= (invariant!0 (currentBit!10221 thiss!1870) (currentByte!10226 thiss!1870) (size!4907 (buf!5451 thiss!1870))) (and (bvsge (currentBit!10221 thiss!1870) #b00000000000000000000000000000000) (bvslt (currentBit!10221 thiss!1870) #b00000000000000000000000000001000) (bvsge (currentByte!10226 thiss!1870) #b00000000000000000000000000000000) (or (bvslt (currentByte!10226 thiss!1870) (size!4907 (buf!5451 thiss!1870))) (and (= (currentBit!10221 thiss!1870) #b00000000000000000000000000000000) (= (currentByte!10226 thiss!1870) (size!4907 (buf!5451 thiss!1870)))))))))

(assert (=> b!225340 d!76536))

(declare-fun d!76542 () Bool)

(declare-fun e!153816 () Bool)

(assert (=> d!76542 e!153816))

(declare-fun res!189153 () Bool)

(assert (=> d!76542 (=> (not res!189153) (not e!153816))))

(declare-fun lt!358578 () (_ BitVec 64))

(declare-fun lt!358577 () (_ BitVec 64))

(declare-fun lt!358576 () (_ BitVec 64))

(assert (=> d!76542 (= res!189153 (= lt!358577 (bvsub lt!358578 lt!358576)))))

(assert (=> d!76542 (or (= (bvand lt!358578 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!358576 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!358578 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!358578 lt!358576) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!76542 (= lt!358576 (remainingBits!0 ((_ sign_extend 32) (size!4907 (buf!5451 thiss!1870))) ((_ sign_extend 32) (currentByte!10226 thiss!1870)) ((_ sign_extend 32) (currentBit!10221 thiss!1870))))))

(declare-fun lt!358579 () (_ BitVec 64))

(declare-fun lt!358581 () (_ BitVec 64))

(assert (=> d!76542 (= lt!358578 (bvmul lt!358579 lt!358581))))

(assert (=> d!76542 (or (= lt!358579 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!358581 (bvsdiv (bvmul lt!358579 lt!358581) lt!358579)))))

