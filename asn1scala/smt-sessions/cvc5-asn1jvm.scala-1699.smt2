; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47102 () Bool)

(assert start!47102)

(declare-fun b!225249 () Bool)

(declare-fun res!189027 () Bool)

(declare-fun e!153690 () Bool)

(assert (=> b!225249 (=> (not res!189027) (not e!153690))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!225249 (= res!189027 (bvsge i!761 to!496))))

(declare-fun b!225248 () Bool)

(declare-fun res!189026 () Bool)

(assert (=> b!225248 (=> (not res!189026) (not e!153690))))

(declare-datatypes ((array!11174 0))(
  ( (array!11175 (arr!5860 (Array (_ BitVec 32) (_ BitVec 8))) (size!4903 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8908 0))(
  ( (BitStream!8909 (buf!5447 array!11174) (currentByte!10213 (_ BitVec 32)) (currentBit!10208 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8908)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225248 (= res!189026 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4903 (buf!5447 thiss!1870))) ((_ sign_extend 32) (currentByte!10213 thiss!1870)) ((_ sign_extend 32) (currentBit!10208 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!225251 () Bool)

(declare-fun e!153691 () Bool)

(declare-fun array_inv!4644 (array!11174) Bool)

(assert (=> b!225251 (= e!153691 (array_inv!4644 (buf!5447 thiss!1870)))))

(declare-fun b!225250 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!225250 (= e!153690 (not (invariant!0 (currentBit!10208 thiss!1870) (currentByte!10213 thiss!1870) (size!4903 (buf!5447 thiss!1870)))))))

(declare-fun arr!308 () array!11174)

(declare-fun arrayRangesEq!793 (array!11174 array!11174 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!225250 (arrayRangesEq!793 arr!308 arr!308 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((Unit!16551 0))(
  ( (Unit!16552) )
))
(declare-fun lt!358391 () Unit!16551)

(declare-fun arrayRangesEqSlicedLemma!82 (array!11174 array!11174 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16551)

(assert (=> b!225250 (= lt!358391 (arrayRangesEqSlicedLemma!82 arr!308 arr!308 #b00000000000000000000000000000000 (size!4903 arr!308) #b00000000000000000000000000000000 i!761))))

(assert (=> b!225250 (arrayRangesEq!793 arr!308 arr!308 #b00000000000000000000000000000000 (size!4903 arr!308))))

(declare-fun lt!358390 () Unit!16551)

(declare-fun arrayRangesEqReflexiveLemma!97 (array!11174) Unit!16551)

(assert (=> b!225250 (= lt!358390 (arrayRangesEqReflexiveLemma!97 arr!308))))

(declare-fun lt!358392 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!225250 (= lt!358392 (bitIndex!0 (size!4903 (buf!5447 thiss!1870)) (currentByte!10213 thiss!1870) (currentBit!10208 thiss!1870)))))

(declare-fun res!189025 () Bool)

(assert (=> start!47102 (=> (not res!189025) (not e!153690))))

(assert (=> start!47102 (= res!189025 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4903 arr!308))))))

(assert (=> start!47102 e!153690))

(assert (=> start!47102 true))

(assert (=> start!47102 (array_inv!4644 arr!308)))

(declare-fun inv!12 (BitStream!8908) Bool)

(assert (=> start!47102 (and (inv!12 thiss!1870) e!153691)))

(assert (= (and start!47102 res!189025) b!225248))

(assert (= (and b!225248 res!189026) b!225249))

(assert (= (and b!225249 res!189027) b!225250))

(assert (= start!47102 b!225251))

(declare-fun m!346179 () Bool)

(assert (=> b!225248 m!346179))

(declare-fun m!346181 () Bool)

(assert (=> b!225251 m!346181))

(declare-fun m!346183 () Bool)

(assert (=> b!225250 m!346183))

(declare-fun m!346185 () Bool)

(assert (=> b!225250 m!346185))

(declare-fun m!346187 () Bool)

(assert (=> b!225250 m!346187))

(declare-fun m!346189 () Bool)

(assert (=> b!225250 m!346189))

(declare-fun m!346191 () Bool)

(assert (=> b!225250 m!346191))

(declare-fun m!346193 () Bool)

(assert (=> b!225250 m!346193))

(declare-fun m!346195 () Bool)

(assert (=> start!47102 m!346195))

(declare-fun m!346197 () Bool)

(assert (=> start!47102 m!346197))

(push 1)

(assert (not b!225248))

(assert (not b!225250))

(assert (not b!225251))

(assert (not start!47102))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!76428 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!76428 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4903 (buf!5447 thiss!1870))) ((_ sign_extend 32) (currentByte!10213 thiss!1870)) ((_ sign_extend 32) (currentBit!10208 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4903 (buf!5447 thiss!1870))) ((_ sign_extend 32) (currentByte!10213 thiss!1870)) ((_ sign_extend 32) (currentBit!10208 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18657 () Bool)

(assert (= bs!18657 d!76428))

(declare-fun m!346241 () Bool)

(assert (=> bs!18657 m!346241))

(assert (=> b!225248 d!76428))

(declare-fun d!76432 () Bool)

(assert (=> d!76432 (arrayRangesEq!793 arr!308 arr!308 #b00000000000000000000000000000000 (size!4903 arr!308))))

(declare-fun lt!358416 () Unit!16551)

(declare-fun choose!305 (array!11174) Unit!16551)

(assert (=> d!76432 (= lt!358416 (choose!305 arr!308))))

(assert (=> d!76432 (= (arrayRangesEqReflexiveLemma!97 arr!308) lt!358416)))

(declare-fun bs!18658 () Bool)

(assert (= bs!18658 d!76432))

(assert (=> bs!18658 m!346185))

(declare-fun m!346247 () Bool)

(assert (=> bs!18658 m!346247))

(assert (=> b!225250 d!76432))

(declare-fun d!76436 () Bool)

(declare-fun res!189056 () Bool)

(declare-fun e!153727 () Bool)

(assert (=> d!76436 (=> res!189056 e!153727)))

(assert (=> d!76436 (= res!189056 (= #b00000000000000000000000000000000 (size!4903 arr!308)))))

(assert (=> d!76436 (= (arrayRangesEq!793 arr!308 arr!308 #b00000000000000000000000000000000 (size!4903 arr!308)) e!153727)))

(declare-fun b!225286 () Bool)

(declare-fun e!153728 () Bool)

(assert (=> b!225286 (= e!153727 e!153728)))

(declare-fun res!189057 () Bool)

(assert (=> b!225286 (=> (not res!189057) (not e!153728))))

(assert (=> b!225286 (= res!189057 (= (select (arr!5860 arr!308) #b00000000000000000000000000000000) (select (arr!5860 arr!308) #b00000000000000000000000000000000)))))

(declare-fun b!225287 () Bool)

(assert (=> b!225287 (= e!153728 (arrayRangesEq!793 arr!308 arr!308 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4903 arr!308)))))

(assert (= (and d!76436 (not res!189056)) b!225286))

(assert (= (and b!225286 res!189057) b!225287))

(declare-fun m!346251 () Bool)

(assert (=> b!225286 m!346251))

(assert (=> b!225286 m!346251))

(declare-fun m!346253 () Bool)

(assert (=> b!225287 m!346253))

(assert (=> b!225250 d!76436))

(declare-fun d!76442 () Bool)

(assert (=> d!76442 (arrayRangesEq!793 arr!308 arr!308 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!358425 () Unit!16551)

(declare-fun choose!307 (array!11174 array!11174 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16551)

(assert (=> d!76442 (= lt!358425 (choose!307 arr!308 arr!308 #b00000000000000000000000000000000 (size!4903 arr!308) #b00000000000000000000000000000000 i!761))))

(assert (=> d!76442 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!4903 arr!308)))))

(assert (=> d!76442 (= (arrayRangesEqSlicedLemma!82 arr!308 arr!308 #b00000000000000000000000000000000 (size!4903 arr!308) #b00000000000000000000000000000000 i!761) lt!358425)))

(declare-fun bs!18661 () Bool)

(assert (= bs!18661 d!76442))

(assert (=> bs!18661 m!346187))

(declare-fun m!346257 () Bool)

(assert (=> bs!18661 m!346257))

(assert (=> b!225250 d!76442))

(declare-fun d!76448 () Bool)

(assert (=> d!76448 (= (invariant!0 (currentBit!10208 thiss!1870) (currentByte!10213 thiss!1870) (size!4903 (buf!5447 thiss!1870))) (and (bvsge (currentBit!10208 thiss!1870) #b00000000000000000000000000000000) (bvslt (currentBit!10208 thiss!1870) #b00000000000000000000000000001000) (bvsge (currentByte!10213 thiss!1870) #b00000000000000000000000000000000) (or (bvslt (currentByte!10213 thiss!1870) (size!4903 (buf!5447 thiss!1870))) (and (= (currentBit!10208 thiss!1870) #b00000000000000000000000000000000) (= (currentByte!10213 thiss!1870) (size!4903 (buf!5447 thiss!1870)))))))))

(assert (=> b!225250 d!76448))

(declare-fun d!76450 () Bool)

(declare-fun e!153742 () Bool)

(assert (=> d!76450 e!153742))

(declare-fun res!189077 () Bool)

(assert (=> d!76450 (=> (not res!189077) (not e!153742))))

(declare-fun lt!358459 () (_ BitVec 64))

(declare-fun lt!358463 () (_ BitVec 64))

(declare-fun lt!358461 () (_ BitVec 64))

(assert (=> d!76450 (= res!189077 (= lt!358463 (bvsub lt!358461 lt!358459)))))

(assert (=> d!76450 (or (= (bvand lt!358461 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!358459 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!358461 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!358461 lt!358459) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!76450 (= lt!358459 (remainingBits!0 ((_ sign_extend 32) (size!4903 (buf!5447 thiss!1870))) ((_ sign_extend 32) (currentByte!10213 thiss!1870)) ((_ sign_extend 32) (currentBit!10208 thiss!1870))))))

(declare-fun lt!358464 () (_ BitVec 64))

(declare-fun lt!358462 () (_ BitVec 64))

(assert (=> d!76450 (= lt!358461 (bvmul lt!358464 lt!358462))))

(assert (=> d!76450 (or (= lt!358464 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!358462 (bvsdiv (bvmul lt!358464 lt!358462) lt!358464)))))

(assert (=> d!76450 (= lt!358462 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76450 (= lt!358464 ((_ sign_extend 32) (size!4903 (buf!5447 thiss!1870))))))

(assert (=> d!76450 (= lt!358463 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10213 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10208 thiss!1870))))))

(assert (=> d!76450 (invariant!0 (currentBit!10208 thiss!1870) (currentByte!10213 thiss!1870) (size!4903 (buf!5447 thiss!1870)))))

(assert (=> d!76450 (= (bitIndex!0 (size!4903 (buf!5447 thiss!1870)) (currentByte!10213 thiss!1870) (currentBit!10208 thiss!1870)) lt!358463)))

(declare-fun b!225306 () Bool)

(declare-fun res!189076 () Bool)

(assert (=> b!225306 (=> (not res!189076) (not e!153742))))

(assert (=> b!225306 (= res!189076 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!358463))))

(declare-fun b!225307 () Bool)

(declare-fun lt!358460 () (_ BitVec 64))

(assert (=> b!225307 (= e!153742 (bvsle lt!358463 (bvmul lt!358460 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!225307 (or (= lt!358460 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!358460 #b0000000000000000000000000000000000000000000000000000000000001000) lt!358460)))))

(assert (=> b!225307 (= lt!358460 ((_ sign_extend 32) (size!4903 (buf!5447 thiss!1870))))))

(assert (= (and d!76450 res!189077) b!225306))

(assert (= (and b!225306 res!189076) b!225307))

(assert (=> d!76450 m!346241))

(assert (=> d!76450 m!346193))

(assert (=> b!225250 d!76450))

(declare-fun d!76466 () Bool)

(declare-fun res!189078 () Bool)

(declare-fun e!153743 () Bool)

(assert (=> d!76466 (=> res!189078 e!153743)))

(assert (=> d!76466 (= res!189078 (= #b00000000000000000000000000000000 i!761))))

(assert (=> d!76466 (= (arrayRangesEq!793 arr!308 arr!308 #b00000000000000000000000000000000 i!761) e!153743)))

(declare-fun b!225308 () Bool)

(declare-fun e!153744 () Bool)

(assert (=> b!225308 (= e!153743 e!153744)))

(declare-fun res!189079 () Bool)

(assert (=> b!225308 (=> (not res!189079) (not e!153744))))

(assert (=> b!225308 (= res!189079 (= (select (arr!5860 arr!308) #b00000000000000000000000000000000) (select (arr!5860 arr!308) #b00000000000000000000000000000000)))))

(declare-fun b!225309 () Bool)

(assert (=> b!225309 (= e!153744 (arrayRangesEq!793 arr!308 arr!308 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) i!761))))

(assert (= (and d!76466 (not res!189078)) b!225308))

(assert (= (and b!225308 res!189079) b!225309))

(assert (=> b!225308 m!346251))

(assert (=> b!225308 m!346251))

(declare-fun m!346269 () Bool)

(assert (=> b!225309 m!346269))

(assert (=> b!225250 d!76466))

(declare-fun d!76468 () Bool)

(assert (=> d!76468 (= (array_inv!4644 (buf!5447 thiss!1870)) (bvsge (size!4903 (buf!5447 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!225251 d!76468))

(declare-fun d!76470 () Bool)

(assert (=> d!76470 (= (array_inv!4644 arr!308) (bvsge (size!4903 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!47102 d!76470))

(declare-fun d!76472 () Bool)

(assert (=> d!76472 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10208 thiss!1870) (currentByte!10213 thiss!1870) (size!4903 (buf!5447 thiss!1870))))))

(declare-fun bs!18665 () Bool)

(assert (= bs!18665 d!76472))

(assert (=> bs!18665 m!346193))

(assert (=> start!47102 d!76472))

(push 1)

(assert (not b!225287))

(assert (not d!76428))

(assert (not b!225309))

(assert (not d!76442))

(assert (not d!76472))

(assert (not d!76432))

(assert (not d!76450))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

