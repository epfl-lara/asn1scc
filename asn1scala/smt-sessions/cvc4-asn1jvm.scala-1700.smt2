; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47160 () Bool)

(assert start!47160)

(declare-fun b!225350 () Bool)

(declare-fun res!189114 () Bool)

(declare-fun e!153784 () Bool)

(assert (=> b!225350 (=> (not res!189114) (not e!153784))))

(declare-datatypes ((array!11187 0))(
  ( (array!11188 (arr!5865 (Array (_ BitVec 32) (_ BitVec 8))) (size!4908 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8918 0))(
  ( (BitStream!8919 (buf!5452 array!11187) (currentByte!10227 (_ BitVec 32)) (currentBit!10222 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8918)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225350 (= res!189114 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4908 (buf!5452 thiss!1870))) ((_ sign_extend 32) (currentByte!10227 thiss!1870)) ((_ sign_extend 32) (currentBit!10222 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun res!189112 () Bool)

(assert (=> start!47160 (=> (not res!189112) (not e!153784))))

(declare-fun arr!308 () array!11187)

(assert (=> start!47160 (= res!189112 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4908 arr!308))))))

(assert (=> start!47160 e!153784))

(assert (=> start!47160 true))

(declare-fun array_inv!4649 (array!11187) Bool)

(assert (=> start!47160 (array_inv!4649 arr!308)))

(declare-fun e!153783 () Bool)

(declare-fun inv!12 (BitStream!8918) Bool)

(assert (=> start!47160 (and (inv!12 thiss!1870) e!153783)))

(declare-fun b!225353 () Bool)

(assert (=> b!225353 (= e!153783 (array_inv!4649 (buf!5452 thiss!1870)))))

(declare-fun b!225351 () Bool)

(declare-fun res!189113 () Bool)

(assert (=> b!225351 (=> (not res!189113) (not e!153784))))

(assert (=> b!225351 (= res!189113 (bvsge i!761 to!496))))

(declare-fun b!225352 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!225352 (= e!153784 (not (invariant!0 (currentBit!10222 thiss!1870) (currentByte!10227 thiss!1870) (size!4908 (buf!5452 thiss!1870)))))))

(declare-fun arrayRangesEq!798 (array!11187 array!11187 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!225352 (arrayRangesEq!798 arr!308 arr!308 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((Unit!16561 0))(
  ( (Unit!16562) )
))
(declare-fun lt!358508 () Unit!16561)

(declare-fun arrayRangesEqSlicedLemma!87 (array!11187 array!11187 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16561)

(assert (=> b!225352 (= lt!358508 (arrayRangesEqSlicedLemma!87 arr!308 arr!308 #b00000000000000000000000000000000 (size!4908 arr!308) #b00000000000000000000000000000000 i!761))))

(assert (=> b!225352 (arrayRangesEq!798 arr!308 arr!308 #b00000000000000000000000000000000 (size!4908 arr!308))))

(declare-fun lt!358509 () Unit!16561)

(declare-fun arrayRangesEqReflexiveLemma!102 (array!11187) Unit!16561)

(assert (=> b!225352 (= lt!358509 (arrayRangesEqReflexiveLemma!102 arr!308))))

(declare-fun lt!358507 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!225352 (= lt!358507 (bitIndex!0 (size!4908 (buf!5452 thiss!1870)) (currentByte!10227 thiss!1870) (currentBit!10222 thiss!1870)))))

(assert (= (and start!47160 res!189112) b!225350))

(assert (= (and b!225350 res!189114) b!225351))

(assert (= (and b!225351 res!189113) b!225352))

(assert (= start!47160 b!225353))

(declare-fun m!346315 () Bool)

(assert (=> b!225350 m!346315))

(declare-fun m!346317 () Bool)

(assert (=> start!47160 m!346317))

(declare-fun m!346319 () Bool)

(assert (=> start!47160 m!346319))

(declare-fun m!346321 () Bool)

(assert (=> b!225353 m!346321))

(declare-fun m!346323 () Bool)

(assert (=> b!225352 m!346323))

(declare-fun m!346325 () Bool)

(assert (=> b!225352 m!346325))

(declare-fun m!346327 () Bool)

(assert (=> b!225352 m!346327))

(declare-fun m!346329 () Bool)

(assert (=> b!225352 m!346329))

(declare-fun m!346331 () Bool)

(assert (=> b!225352 m!346331))

(declare-fun m!346333 () Bool)

(assert (=> b!225352 m!346333))

(push 1)

(assert (not start!47160))

(assert (not b!225350))

(assert (not b!225352))

(assert (not b!225353))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!76490 () Bool)

(assert (=> d!76490 (= (array_inv!4649 arr!308) (bvsge (size!4908 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!47160 d!76490))

(declare-fun d!76492 () Bool)

(assert (=> d!76492 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10222 thiss!1870) (currentByte!10227 thiss!1870) (size!4908 (buf!5452 thiss!1870))))))

(declare-fun bs!18672 () Bool)

(assert (= bs!18672 d!76492))

(assert (=> bs!18672 m!346333))

(assert (=> start!47160 d!76492))

(declare-fun d!76494 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!76494 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4908 (buf!5452 thiss!1870))) ((_ sign_extend 32) (currentByte!10227 thiss!1870)) ((_ sign_extend 32) (currentBit!10222 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4908 (buf!5452 thiss!1870))) ((_ sign_extend 32) (currentByte!10227 thiss!1870)) ((_ sign_extend 32) (currentBit!10222 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18673 () Bool)

(assert (= bs!18673 d!76494))

(declare-fun m!346341 () Bool)

(assert (=> bs!18673 m!346341))

(assert (=> b!225350 d!76494))

(declare-fun d!76500 () Bool)

(assert (=> d!76500 (arrayRangesEq!798 arr!308 arr!308 #b00000000000000000000000000000000 (size!4908 arr!308))))

(declare-fun lt!358517 () Unit!16561)

(declare-fun choose!312 (array!11187) Unit!16561)

(assert (=> d!76500 (= lt!358517 (choose!312 arr!308))))

(assert (=> d!76500 (= (arrayRangesEqReflexiveLemma!102 arr!308) lt!358517)))

(declare-fun bs!18674 () Bool)

(assert (= bs!18674 d!76500))

(assert (=> bs!18674 m!346325))

(declare-fun m!346343 () Bool)

(assert (=> bs!18674 m!346343))

(assert (=> b!225352 d!76500))

(declare-fun d!76502 () Bool)

(declare-fun res!189125 () Bool)

(declare-fun e!153796 () Bool)

(assert (=> d!76502 (=> res!189125 e!153796)))

(assert (=> d!76502 (= res!189125 (= #b00000000000000000000000000000000 (size!4908 arr!308)))))

(assert (=> d!76502 (= (arrayRangesEq!798 arr!308 arr!308 #b00000000000000000000000000000000 (size!4908 arr!308)) e!153796)))

(declare-fun b!225364 () Bool)

(declare-fun e!153797 () Bool)

(assert (=> b!225364 (= e!153796 e!153797)))

(declare-fun res!189126 () Bool)

(assert (=> b!225364 (=> (not res!189126) (not e!153797))))

(assert (=> b!225364 (= res!189126 (= (select (arr!5865 arr!308) #b00000000000000000000000000000000) (select (arr!5865 arr!308) #b00000000000000000000000000000000)))))

(declare-fun b!225365 () Bool)

(assert (=> b!225365 (= e!153797 (arrayRangesEq!798 arr!308 arr!308 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4908 arr!308)))))

(assert (= (and d!76502 (not res!189125)) b!225364))

(assert (= (and b!225364 res!189126) b!225365))

(declare-fun m!346347 () Bool)

(assert (=> b!225364 m!346347))

(assert (=> b!225364 m!346347))

(declare-fun m!346349 () Bool)

(assert (=> b!225365 m!346349))

(assert (=> b!225352 d!76502))

(declare-fun d!76514 () Bool)

(assert (=> d!76514 (arrayRangesEq!798 arr!308 arr!308 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!358521 () Unit!16561)

(declare-fun choose!313 (array!11187 array!11187 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16561)

(assert (=> d!76514 (= lt!358521 (choose!313 arr!308 arr!308 #b00000000000000000000000000000000 (size!4908 arr!308) #b00000000000000000000000000000000 i!761))))

(assert (=> d!76514 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!4908 arr!308)))))

(assert (=> d!76514 (= (arrayRangesEqSlicedLemma!87 arr!308 arr!308 #b00000000000000000000000000000000 (size!4908 arr!308) #b00000000000000000000000000000000 i!761) lt!358521)))

(declare-fun bs!18678 () Bool)

(assert (= bs!18678 d!76514))

(assert (=> bs!18678 m!346327))

(declare-fun m!346353 () Bool)

(assert (=> bs!18678 m!346353))

(assert (=> b!225352 d!76514))

(declare-fun d!76518 () Bool)

(assert (=> d!76518 (= (invariant!0 (currentBit!10222 thiss!1870) (currentByte!10227 thiss!1870) (size!4908 (buf!5452 thiss!1870))) (and (bvsge (currentBit!10222 thiss!1870) #b00000000000000000000000000000000) (bvslt (currentBit!10222 thiss!1870) #b00000000000000000000000000001000) (bvsge (currentByte!10227 thiss!1870) #b00000000000000000000000000000000) (or (bvslt (currentByte!10227 thiss!1870) (size!4908 (buf!5452 thiss!1870))) (and (= (currentBit!10222 thiss!1870) #b00000000000000000000000000000000) (= (currentByte!10227 thiss!1870) (size!4908 (buf!5452 thiss!1870)))))))))

(assert (=> b!225352 d!76518))

(declare-fun d!76520 () Bool)

(declare-fun e!153811 () Bool)

(assert (=> d!76520 e!153811))

(declare-fun res!189145 () Bool)

(assert (=> d!76520 (=> (not res!189145) (not e!153811))))

(declare-fun lt!358560 () (_ BitVec 64))

(declare-fun lt!358563 () (_ BitVec 64))

(declare-fun lt!358562 () (_ BitVec 64))

(assert (=> d!76520 (= res!189145 (= lt!358560 (bvsub lt!358563 lt!358562)))))

(assert (=> d!76520 (or (= (bvand lt!358563 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!358562 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!358563 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!358563 lt!358562) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!76520 (= lt!358562 (remainingBits!0 ((_ sign_extend 32) (size!4908 (buf!5452 thiss!1870))) ((_ sign_extend 32) (currentByte!10227 thiss!1870)) ((_ sign_extend 32) (currentBit!10222 thiss!1870))))))

(declare-fun lt!358558 () (_ BitVec 64))

(declare-fun lt!358561 () (_ BitVec 64))

(assert (=> d!76520 (= lt!358563 (bvmul lt!358558 lt!358561))))

(assert (=> d!76520 (or (= lt!358558 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!358561 (bvsdiv (bvmul lt!358558 lt!358561) lt!358558)))))

(assert (=> d!76520 (= lt!358561 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76520 (= lt!358558 ((_ sign_extend 32) (size!4908 (buf!5452 thiss!1870))))))

(assert (=> d!76520 (= lt!358560 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10227 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10222 thiss!1870))))))

(assert (=> d!76520 (invariant!0 (currentBit!10222 thiss!1870) (currentByte!10227 thiss!1870) (size!4908 (buf!5452 thiss!1870)))))

(assert (=> d!76520 (= (bitIndex!0 (size!4908 (buf!5452 thiss!1870)) (currentByte!10227 thiss!1870) (currentBit!10222 thiss!1870)) lt!358560)))

(declare-fun b!225384 () Bool)

(declare-fun res!189146 () Bool)

(assert (=> b!225384 (=> (not res!189146) (not e!153811))))

(assert (=> b!225384 (= res!189146 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!358560))))

(declare-fun b!225385 () Bool)

(declare-fun lt!358559 () (_ BitVec 64))

(assert (=> b!225385 (= e!153811 (bvsle lt!358560 (bvmul lt!358559 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!225385 (or (= lt!358559 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!358559 #b0000000000000000000000000000000000000000000000000000000000001000) lt!358559)))))

(assert (=> b!225385 (= lt!358559 ((_ sign_extend 32) (size!4908 (buf!5452 thiss!1870))))))

(assert (= (and d!76520 res!189145) b!225384))

(assert (= (and b!225384 res!189146) b!225385))

(assert (=> d!76520 m!346341))

(assert (=> d!76520 m!346333))

(assert (=> b!225352 d!76520))

(declare-fun d!76538 () Bool)

(declare-fun res!189147 () Bool)

(declare-fun e!153812 () Bool)

(assert (=> d!76538 (=> res!189147 e!153812)))

(assert (=> d!76538 (= res!189147 (= #b00000000000000000000000000000000 i!761))))

(assert (=> d!76538 (= (arrayRangesEq!798 arr!308 arr!308 #b00000000000000000000000000000000 i!761) e!153812)))

(declare-fun b!225386 () Bool)

(declare-fun e!153813 () Bool)

(assert (=> b!225386 (= e!153812 e!153813)))

(declare-fun res!189148 () Bool)

(assert (=> b!225386 (=> (not res!189148) (not e!153813))))

(assert (=> b!225386 (= res!189148 (= (select (arr!5865 arr!308) #b00000000000000000000000000000000) (select (arr!5865 arr!308) #b00000000000000000000000000000000)))))

(declare-fun b!225387 () Bool)

(assert (=> b!225387 (= e!153813 (arrayRangesEq!798 arr!308 arr!308 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) i!761))))

(assert (= (and d!76538 (not res!189147)) b!225386))

(assert (= (and b!225386 res!189148) b!225387))

(assert (=> b!225386 m!346347))

(assert (=> b!225386 m!346347))

(declare-fun m!346367 () Bool)

(assert (=> b!225387 m!346367))

(assert (=> b!225352 d!76538))

(declare-fun d!76540 () Bool)

(assert (=> d!76540 (= (array_inv!4649 (buf!5452 thiss!1870)) (bvsge (size!4908 (buf!5452 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!225353 d!76540))

(push 1)

