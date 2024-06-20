; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47104 () Bool)

(assert start!47104)

(declare-fun res!189036 () Bool)

(declare-fun e!153701 () Bool)

(assert (=> start!47104 (=> (not res!189036) (not e!153701))))

(declare-datatypes ((array!11176 0))(
  ( (array!11177 (arr!5861 (Array (_ BitVec 32) (_ BitVec 8))) (size!4904 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11176)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!47104 (= res!189036 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4904 arr!308))))))

(assert (=> start!47104 e!153701))

(assert (=> start!47104 true))

(declare-fun array_inv!4645 (array!11176) Bool)

(assert (=> start!47104 (array_inv!4645 arr!308)))

(declare-datatypes ((BitStream!8910 0))(
  ( (BitStream!8911 (buf!5448 array!11176) (currentByte!10214 (_ BitVec 32)) (currentBit!10209 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8910)

(declare-fun e!153703 () Bool)

(declare-fun inv!12 (BitStream!8910) Bool)

(assert (=> start!47104 (and (inv!12 thiss!1870) e!153703)))

(declare-fun b!225263 () Bool)

(assert (=> b!225263 (= e!153703 (array_inv!4645 (buf!5448 thiss!1870)))))

(declare-fun b!225261 () Bool)

(declare-fun res!189034 () Bool)

(assert (=> b!225261 (=> (not res!189034) (not e!153701))))

(assert (=> b!225261 (= res!189034 (bvsge i!761 to!496))))

(declare-fun b!225260 () Bool)

(declare-fun res!189035 () Bool)

(assert (=> b!225260 (=> (not res!189035) (not e!153701))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225260 (= res!189035 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4904 (buf!5448 thiss!1870))) ((_ sign_extend 32) (currentByte!10214 thiss!1870)) ((_ sign_extend 32) (currentBit!10209 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!225262 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!225262 (= e!153701 (not (invariant!0 (currentBit!10209 thiss!1870) (currentByte!10214 thiss!1870) (size!4904 (buf!5448 thiss!1870)))))))

(declare-fun arrayRangesEq!794 (array!11176 array!11176 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!225262 (arrayRangesEq!794 arr!308 arr!308 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((Unit!16553 0))(
  ( (Unit!16554) )
))
(declare-fun lt!358401 () Unit!16553)

(declare-fun arrayRangesEqSlicedLemma!83 (array!11176 array!11176 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16553)

(assert (=> b!225262 (= lt!358401 (arrayRangesEqSlicedLemma!83 arr!308 arr!308 #b00000000000000000000000000000000 (size!4904 arr!308) #b00000000000000000000000000000000 i!761))))

(assert (=> b!225262 (arrayRangesEq!794 arr!308 arr!308 #b00000000000000000000000000000000 (size!4904 arr!308))))

(declare-fun lt!358399 () Unit!16553)

(declare-fun arrayRangesEqReflexiveLemma!98 (array!11176) Unit!16553)

(assert (=> b!225262 (= lt!358399 (arrayRangesEqReflexiveLemma!98 arr!308))))

(declare-fun lt!358400 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!225262 (= lt!358400 (bitIndex!0 (size!4904 (buf!5448 thiss!1870)) (currentByte!10214 thiss!1870) (currentBit!10209 thiss!1870)))))

(assert (= (and start!47104 res!189036) b!225260))

(assert (= (and b!225260 res!189035) b!225261))

(assert (= (and b!225261 res!189034) b!225262))

(assert (= start!47104 b!225263))

(declare-fun m!346199 () Bool)

(assert (=> start!47104 m!346199))

(declare-fun m!346201 () Bool)

(assert (=> start!47104 m!346201))

(declare-fun m!346203 () Bool)

(assert (=> b!225263 m!346203))

(declare-fun m!346205 () Bool)

(assert (=> b!225260 m!346205))

(declare-fun m!346207 () Bool)

(assert (=> b!225262 m!346207))

(declare-fun m!346209 () Bool)

(assert (=> b!225262 m!346209))

(declare-fun m!346211 () Bool)

(assert (=> b!225262 m!346211))

(declare-fun m!346213 () Bool)

(assert (=> b!225262 m!346213))

(declare-fun m!346215 () Bool)

(assert (=> b!225262 m!346215))

(declare-fun m!346217 () Bool)

(assert (=> b!225262 m!346217))

(check-sat (not b!225263) (not b!225262) (not start!47104) (not b!225260))
(check-sat)
(get-model)

(declare-fun d!76424 () Bool)

(assert (=> d!76424 (= (array_inv!4645 (buf!5448 thiss!1870)) (bvsge (size!4904 (buf!5448 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!225263 d!76424))

(declare-fun d!76426 () Bool)

(assert (=> d!76426 (arrayRangesEq!794 arr!308 arr!308 #b00000000000000000000000000000000 (size!4904 arr!308))))

(declare-fun lt!358413 () Unit!16553)

(declare-fun choose!304 (array!11176) Unit!16553)

(assert (=> d!76426 (= lt!358413 (choose!304 arr!308))))

(assert (=> d!76426 (= (arrayRangesEqReflexiveLemma!98 arr!308) lt!358413)))

(declare-fun bs!18656 () Bool)

(assert (= bs!18656 d!76426))

(assert (=> bs!18656 m!346209))

(declare-fun m!346239 () Bool)

(assert (=> bs!18656 m!346239))

(assert (=> b!225262 d!76426))

(declare-fun d!76430 () Bool)

(declare-fun res!189050 () Bool)

(declare-fun e!153721 () Bool)

(assert (=> d!76430 (=> res!189050 e!153721)))

(assert (=> d!76430 (= res!189050 (= #b00000000000000000000000000000000 (size!4904 arr!308)))))

(assert (=> d!76430 (= (arrayRangesEq!794 arr!308 arr!308 #b00000000000000000000000000000000 (size!4904 arr!308)) e!153721)))

(declare-fun b!225280 () Bool)

(declare-fun e!153722 () Bool)

(assert (=> b!225280 (= e!153721 e!153722)))

(declare-fun res!189051 () Bool)

(assert (=> b!225280 (=> (not res!189051) (not e!153722))))

(assert (=> b!225280 (= res!189051 (= (select (arr!5861 arr!308) #b00000000000000000000000000000000) (select (arr!5861 arr!308) #b00000000000000000000000000000000)))))

(declare-fun b!225281 () Bool)

(assert (=> b!225281 (= e!153722 (arrayRangesEq!794 arr!308 arr!308 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4904 arr!308)))))

(assert (= (and d!76430 (not res!189050)) b!225280))

(assert (= (and b!225280 res!189051) b!225281))

(declare-fun m!346243 () Bool)

(assert (=> b!225280 m!346243))

(assert (=> b!225280 m!346243))

(declare-fun m!346245 () Bool)

(assert (=> b!225281 m!346245))

(assert (=> b!225262 d!76430))

(declare-fun d!76434 () Bool)

(assert (=> d!76434 (arrayRangesEq!794 arr!308 arr!308 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!358419 () Unit!16553)

(declare-fun choose!306 (array!11176 array!11176 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16553)

(assert (=> d!76434 (= lt!358419 (choose!306 arr!308 arr!308 #b00000000000000000000000000000000 (size!4904 arr!308) #b00000000000000000000000000000000 i!761))))

(assert (=> d!76434 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!4904 arr!308)))))

(assert (=> d!76434 (= (arrayRangesEqSlicedLemma!83 arr!308 arr!308 #b00000000000000000000000000000000 (size!4904 arr!308) #b00000000000000000000000000000000 i!761) lt!358419)))

(declare-fun bs!18659 () Bool)

(assert (= bs!18659 d!76434))

(assert (=> bs!18659 m!346211))

(declare-fun m!346249 () Bool)

(assert (=> bs!18659 m!346249))

(assert (=> b!225262 d!76434))

(declare-fun d!76440 () Bool)

(assert (=> d!76440 (= (invariant!0 (currentBit!10209 thiss!1870) (currentByte!10214 thiss!1870) (size!4904 (buf!5448 thiss!1870))) (and (bvsge (currentBit!10209 thiss!1870) #b00000000000000000000000000000000) (bvslt (currentBit!10209 thiss!1870) #b00000000000000000000000000001000) (bvsge (currentByte!10214 thiss!1870) #b00000000000000000000000000000000) (or (bvslt (currentByte!10214 thiss!1870) (size!4904 (buf!5448 thiss!1870))) (and (= (currentBit!10209 thiss!1870) #b00000000000000000000000000000000) (= (currentByte!10214 thiss!1870) (size!4904 (buf!5448 thiss!1870)))))))))

(assert (=> b!225262 d!76440))

(declare-fun d!76446 () Bool)

(declare-fun e!153737 () Bool)

(assert (=> d!76446 e!153737))

(declare-fun res!189068 () Bool)

(assert (=> d!76446 (=> (not res!189068) (not e!153737))))

(declare-fun lt!358445 () (_ BitVec 64))

(declare-fun lt!358441 () (_ BitVec 64))

(declare-fun lt!358442 () (_ BitVec 64))

(assert (=> d!76446 (= res!189068 (= lt!358445 (bvsub lt!358441 lt!358442)))))

(assert (=> d!76446 (or (= (bvand lt!358441 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!358442 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!358441 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!358441 lt!358442) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!76446 (= lt!358442 (remainingBits!0 ((_ sign_extend 32) (size!4904 (buf!5448 thiss!1870))) ((_ sign_extend 32) (currentByte!10214 thiss!1870)) ((_ sign_extend 32) (currentBit!10209 thiss!1870))))))

(declare-fun lt!358446 () (_ BitVec 64))

(declare-fun lt!358443 () (_ BitVec 64))

(assert (=> d!76446 (= lt!358441 (bvmul lt!358446 lt!358443))))

(assert (=> d!76446 (or (= lt!358446 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!358443 (bvsdiv (bvmul lt!358446 lt!358443) lt!358446)))))

(assert (=> d!76446 (= lt!358443 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76446 (= lt!358446 ((_ sign_extend 32) (size!4904 (buf!5448 thiss!1870))))))

(assert (=> d!76446 (= lt!358445 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10214 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10209 thiss!1870))))))

(assert (=> d!76446 (invariant!0 (currentBit!10209 thiss!1870) (currentByte!10214 thiss!1870) (size!4904 (buf!5448 thiss!1870)))))

(assert (=> d!76446 (= (bitIndex!0 (size!4904 (buf!5448 thiss!1870)) (currentByte!10214 thiss!1870) (currentBit!10209 thiss!1870)) lt!358445)))

(declare-fun b!225298 () Bool)

(declare-fun res!189069 () Bool)

(assert (=> b!225298 (=> (not res!189069) (not e!153737))))

(assert (=> b!225298 (= res!189069 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!358445))))

(declare-fun b!225299 () Bool)

(declare-fun lt!358444 () (_ BitVec 64))

(assert (=> b!225299 (= e!153737 (bvsle lt!358445 (bvmul lt!358444 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!225299 (or (= lt!358444 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!358444 #b0000000000000000000000000000000000000000000000000000000000001000) lt!358444)))))

(assert (=> b!225299 (= lt!358444 ((_ sign_extend 32) (size!4904 (buf!5448 thiss!1870))))))

(assert (= (and d!76446 res!189068) b!225298))

(assert (= (and b!225298 res!189069) b!225299))

(declare-fun m!346265 () Bool)

(assert (=> d!76446 m!346265))

(assert (=> d!76446 m!346217))

(assert (=> b!225262 d!76446))

(declare-fun d!76458 () Bool)

(declare-fun res!189072 () Bool)

(declare-fun e!153740 () Bool)

(assert (=> d!76458 (=> res!189072 e!153740)))

(assert (=> d!76458 (= res!189072 (= #b00000000000000000000000000000000 i!761))))

(assert (=> d!76458 (= (arrayRangesEq!794 arr!308 arr!308 #b00000000000000000000000000000000 i!761) e!153740)))

(declare-fun b!225300 () Bool)

(declare-fun e!153741 () Bool)

(assert (=> b!225300 (= e!153740 e!153741)))

(declare-fun res!189073 () Bool)

(assert (=> b!225300 (=> (not res!189073) (not e!153741))))

(assert (=> b!225300 (= res!189073 (= (select (arr!5861 arr!308) #b00000000000000000000000000000000) (select (arr!5861 arr!308) #b00000000000000000000000000000000)))))

(declare-fun b!225301 () Bool)

(assert (=> b!225301 (= e!153741 (arrayRangesEq!794 arr!308 arr!308 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) i!761))))

(assert (= (and d!76458 (not res!189072)) b!225300))

(assert (= (and b!225300 res!189073) b!225301))

(assert (=> b!225300 m!346243))

(assert (=> b!225300 m!346243))

(declare-fun m!346267 () Bool)

(assert (=> b!225301 m!346267))

(assert (=> b!225262 d!76458))

(declare-fun d!76460 () Bool)

(assert (=> d!76460 (= (array_inv!4645 arr!308) (bvsge (size!4904 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!47104 d!76460))

(declare-fun d!76462 () Bool)

(assert (=> d!76462 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10209 thiss!1870) (currentByte!10214 thiss!1870) (size!4904 (buf!5448 thiss!1870))))))

(declare-fun bs!18663 () Bool)

(assert (= bs!18663 d!76462))

(assert (=> bs!18663 m!346217))

(assert (=> start!47104 d!76462))

(declare-fun d!76464 () Bool)

(assert (=> d!76464 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4904 (buf!5448 thiss!1870))) ((_ sign_extend 32) (currentByte!10214 thiss!1870)) ((_ sign_extend 32) (currentBit!10209 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4904 (buf!5448 thiss!1870))) ((_ sign_extend 32) (currentByte!10214 thiss!1870)) ((_ sign_extend 32) (currentBit!10209 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18664 () Bool)

(assert (= bs!18664 d!76464))

(assert (=> bs!18664 m!346265))

(assert (=> b!225260 d!76464))

(check-sat (not d!76434) (not d!76464) (not b!225281) (not d!76446) (not d!76462) (not d!76426) (not b!225301))
