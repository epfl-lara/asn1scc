; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47106 () Bool)

(assert start!47106)

(declare-fun b!225275 () Bool)

(declare-fun e!153716 () Bool)

(declare-datatypes ((array!11178 0))(
  ( (array!11179 (arr!5862 (Array (_ BitVec 32) (_ BitVec 8))) (size!4905 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8912 0))(
  ( (BitStream!8913 (buf!5449 array!11178) (currentByte!10215 (_ BitVec 32)) (currentBit!10210 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8912)

(declare-fun array_inv!4646 (array!11178) Bool)

(assert (=> b!225275 (= e!153716 (array_inv!4646 (buf!5449 thiss!1870)))))

(declare-fun b!225274 () Bool)

(declare-fun e!153715 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!225274 (= e!153715 (not (invariant!0 (currentBit!10210 thiss!1870) (currentByte!10215 thiss!1870) (size!4905 (buf!5449 thiss!1870)))))))

(declare-fun arr!308 () array!11178)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun arrayRangesEq!795 (array!11178 array!11178 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!225274 (arrayRangesEq!795 arr!308 arr!308 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((Unit!16555 0))(
  ( (Unit!16556) )
))
(declare-fun lt!358410 () Unit!16555)

(declare-fun arrayRangesEqSlicedLemma!84 (array!11178 array!11178 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16555)

(assert (=> b!225274 (= lt!358410 (arrayRangesEqSlicedLemma!84 arr!308 arr!308 #b00000000000000000000000000000000 (size!4905 arr!308) #b00000000000000000000000000000000 i!761))))

(assert (=> b!225274 (arrayRangesEq!795 arr!308 arr!308 #b00000000000000000000000000000000 (size!4905 arr!308))))

(declare-fun lt!358408 () Unit!16555)

(declare-fun arrayRangesEqReflexiveLemma!99 (array!11178) Unit!16555)

(assert (=> b!225274 (= lt!358408 (arrayRangesEqReflexiveLemma!99 arr!308))))

(declare-fun lt!358409 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!225274 (= lt!358409 (bitIndex!0 (size!4905 (buf!5449 thiss!1870)) (currentByte!10215 thiss!1870) (currentBit!10210 thiss!1870)))))

(declare-fun b!225273 () Bool)

(declare-fun res!189044 () Bool)

(assert (=> b!225273 (=> (not res!189044) (not e!153715))))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!225273 (= res!189044 (bvsge i!761 to!496))))

(declare-fun res!189045 () Bool)

(assert (=> start!47106 (=> (not res!189045) (not e!153715))))

(assert (=> start!47106 (= res!189045 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4905 arr!308))))))

(assert (=> start!47106 e!153715))

(assert (=> start!47106 true))

(assert (=> start!47106 (array_inv!4646 arr!308)))

(declare-fun inv!12 (BitStream!8912) Bool)

(assert (=> start!47106 (and (inv!12 thiss!1870) e!153716)))

(declare-fun b!225272 () Bool)

(declare-fun res!189043 () Bool)

(assert (=> b!225272 (=> (not res!189043) (not e!153715))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225272 (= res!189043 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4905 (buf!5449 thiss!1870))) ((_ sign_extend 32) (currentByte!10215 thiss!1870)) ((_ sign_extend 32) (currentBit!10210 thiss!1870)) (bvsub to!496 i!761)))))

(assert (= (and start!47106 res!189045) b!225272))

(assert (= (and b!225272 res!189043) b!225273))

(assert (= (and b!225273 res!189044) b!225274))

(assert (= start!47106 b!225275))

(declare-fun m!346219 () Bool)

(assert (=> b!225275 m!346219))

(declare-fun m!346221 () Bool)

(assert (=> b!225274 m!346221))

(declare-fun m!346223 () Bool)

(assert (=> b!225274 m!346223))

(declare-fun m!346225 () Bool)

(assert (=> b!225274 m!346225))

(declare-fun m!346227 () Bool)

(assert (=> b!225274 m!346227))

(declare-fun m!346229 () Bool)

(assert (=> b!225274 m!346229))

(declare-fun m!346231 () Bool)

(assert (=> b!225274 m!346231))

(declare-fun m!346233 () Bool)

(assert (=> start!47106 m!346233))

(declare-fun m!346235 () Bool)

(assert (=> start!47106 m!346235))

(declare-fun m!346237 () Bool)

(assert (=> b!225272 m!346237))

(push 1)

(assert (not b!225274))

(assert (not start!47106))

(assert (not b!225275))

(assert (not b!225272))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!76438 () Bool)

(assert (=> d!76438 (arrayRangesEq!795 arr!308 arr!308 #b00000000000000000000000000000000 (size!4905 arr!308))))

(declare-fun lt!358422 () Unit!16555)

(declare-fun choose!308 (array!11178) Unit!16555)

(assert (=> d!76438 (= lt!358422 (choose!308 arr!308))))

(assert (=> d!76438 (= (arrayRangesEqReflexiveLemma!99 arr!308) lt!358422)))

(declare-fun bs!18660 () Bool)

(assert (= bs!18660 d!76438))

(assert (=> bs!18660 m!346223))

(declare-fun m!346255 () Bool)

(assert (=> bs!18660 m!346255))

(assert (=> b!225274 d!76438))

(declare-fun d!76444 () Bool)

(declare-fun res!189062 () Bool)

(declare-fun e!153733 () Bool)

(assert (=> d!76444 (=> res!189062 e!153733)))

(assert (=> d!76444 (= res!189062 (= #b00000000000000000000000000000000 (size!4905 arr!308)))))

(assert (=> d!76444 (= (arrayRangesEq!795 arr!308 arr!308 #b00000000000000000000000000000000 (size!4905 arr!308)) e!153733)))

(declare-fun b!225292 () Bool)

(declare-fun e!153734 () Bool)

(assert (=> b!225292 (= e!153733 e!153734)))

(declare-fun res!189063 () Bool)

(assert (=> b!225292 (=> (not res!189063) (not e!153734))))

(assert (=> b!225292 (= res!189063 (= (select (arr!5862 arr!308) #b00000000000000000000000000000000) (select (arr!5862 arr!308) #b00000000000000000000000000000000)))))

(declare-fun b!225293 () Bool)

(assert (=> b!225293 (= e!153734 (arrayRangesEq!795 arr!308 arr!308 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4905 arr!308)))))

(assert (= (and d!76444 (not res!189062)) b!225292))

(assert (= (and b!225292 res!189063) b!225293))

(declare-fun m!346259 () Bool)

(assert (=> b!225292 m!346259))

(assert (=> b!225292 m!346259))

(declare-fun m!346261 () Bool)

(assert (=> b!225293 m!346261))

(assert (=> b!225274 d!76444))

(declare-fun d!76452 () Bool)

(assert (=> d!76452 (arrayRangesEq!795 arr!308 arr!308 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!358428 () Unit!16555)

(declare-fun choose!309 (array!11178 array!11178 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16555)

(assert (=> d!76452 (= lt!358428 (choose!309 arr!308 arr!308 #b00000000000000000000000000000000 (size!4905 arr!308) #b00000000000000000000000000000000 i!761))))

(assert (=> d!76452 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!4905 arr!308)))))

(assert (=> d!76452 (= (arrayRangesEqSlicedLemma!84 arr!308 arr!308 #b00000000000000000000000000000000 (size!4905 arr!308) #b00000000000000000000000000000000 i!761) lt!358428)))

(declare-fun bs!18662 () Bool)

(assert (= bs!18662 d!76452))

(assert (=> bs!18662 m!346225))

(declare-fun m!346263 () Bool)

(assert (=> bs!18662 m!346263))

(assert (=> b!225274 d!76452))

(declare-fun d!76454 () Bool)

(assert (=> d!76454 (= (invariant!0 (currentBit!10210 thiss!1870) (currentByte!10215 thiss!1870) (size!4905 (buf!5449 thiss!1870))) (and (bvsge (currentBit!10210 thiss!1870) #b00000000000000000000000000000000) (bvslt (currentBit!10210 thiss!1870) #b00000000000000000000000000001000) (bvsge (currentByte!10215 thiss!1870) #b00000000000000000000000000000000) (or (bvslt (currentByte!10215 thiss!1870) (size!4905 (buf!5449 thiss!1870))) (and (= (currentBit!10210 thiss!1870) #b00000000000000000000000000000000) (= (currentByte!10215 thiss!1870) (size!4905 (buf!5449 thiss!1870)))))))))

(assert (=> b!225274 d!76454))

(declare-fun d!76456 () Bool)

(declare-fun e!153747 () Bool)

(assert (=> d!76456 e!153747))

(declare-fun res!189084 () Bool)

(assert (=> d!76456 (=> (not res!189084) (not e!153747))))

(declare-fun lt!358482 () (_ BitVec 64))

(declare-fun lt!358480 () (_ BitVec 64))

(declare-fun lt!358479 () (_ BitVec 64))

(assert (=> d!76456 (= res!189084 (= lt!358479 (bvsub lt!358480 lt!358482)))))

(assert (=> d!76456 (or (= (bvand lt!358480 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!358482 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!358480 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!358480 lt!358482) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!76456 (= lt!358482 (remainingBits!0 ((_ sign_extend 32) (size!4905 (buf!5449 thiss!1870))) ((_ sign_extend 32) (currentByte!10215 thiss!1870)) ((_ sign_extend 32) (currentBit!10210 thiss!1870))))))

(declare-fun lt!358477 () (_ BitVec 64))

(declare-fun lt!358478 () (_ BitVec 64))

(assert (=> d!76456 (= lt!358480 (bvmul lt!358477 lt!358478))))

(assert (=> d!76456 (or (= lt!358477 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!358478 (bvsdiv (bvmul lt!358477 lt!358478) lt!358477)))))

(assert (=> d!76456 (= lt!358478 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76456 (= lt!358477 ((_ sign_extend 32) (size!4905 (buf!5449 thiss!1870))))))

(assert (=> d!76456 (= lt!358479 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10215 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10210 thiss!1870))))))

(assert (=> d!76456 (invariant!0 (currentBit!10210 thiss!1870) (currentByte!10215 thiss!1870) (size!4905 (buf!5449 thiss!1870)))))

(assert (=> d!76456 (= (bitIndex!0 (size!4905 (buf!5449 thiss!1870)) (currentByte!10215 thiss!1870) (currentBit!10210 thiss!1870)) lt!358479)))

(declare-fun b!225314 () Bool)

(declare-fun res!189085 () Bool)

(assert (=> b!225314 (=> (not res!189085) (not e!153747))))

(assert (=> b!225314 (= res!189085 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!358479))))

(declare-fun b!225315 () Bool)

(declare-fun lt!358481 () (_ BitVec 64))

(assert (=> b!225315 (= e!153747 (bvsle lt!358479 (bvmul lt!358481 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!225315 (or (= lt!358481 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!358481 #b0000000000000000000000000000000000000000000000000000000000001000) lt!358481)))))

(assert (=> b!225315 (= lt!358481 ((_ sign_extend 32) (size!4905 (buf!5449 thiss!1870))))))

(assert (= (and d!76456 res!189084) b!225314))

(assert (= (and b!225314 res!189085) b!225315))

(declare-fun m!346271 () Bool)

(assert (=> d!76456 m!346271))

(assert (=> d!76456 m!346231))

(assert (=> b!225274 d!76456))

(declare-fun d!76474 () Bool)

(declare-fun res!189086 () Bool)

(declare-fun e!153748 () Bool)

(assert (=> d!76474 (=> res!189086 e!153748)))

(assert (=> d!76474 (= res!189086 (= #b00000000000000000000000000000000 i!761))))

(assert (=> d!76474 (= (arrayRangesEq!795 arr!308 arr!308 #b00000000000000000000000000000000 i!761) e!153748)))

(declare-fun b!225316 () Bool)

(declare-fun e!153749 () Bool)

(assert (=> b!225316 (= e!153748 e!153749)))

(declare-fun res!189087 () Bool)

(assert (=> b!225316 (=> (not res!189087) (not e!153749))))

(assert (=> b!225316 (= res!189087 (= (select (arr!5862 arr!308) #b00000000000000000000000000000000) (select (arr!5862 arr!308) #b00000000000000000000000000000000)))))

(declare-fun b!225317 () Bool)

(assert (=> b!225317 (= e!153749 (arrayRangesEq!795 arr!308 arr!308 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) i!761))))

(assert (= (and d!76474 (not res!189086)) b!225316))

(assert (= (and b!225316 res!189087) b!225317))

(assert (=> b!225316 m!346259))

