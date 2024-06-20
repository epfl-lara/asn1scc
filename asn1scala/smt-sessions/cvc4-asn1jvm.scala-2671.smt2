; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65420 () Bool)

(assert start!65420)

(declare-fun b!293495 () Bool)

(declare-fun res!242357 () Bool)

(declare-fun e!209644 () Bool)

(assert (=> b!293495 (=> (not res!242357) (not e!209644))))

(declare-datatypes ((array!17547 0))(
  ( (array!17548 (arr!8631 (Array (_ BitVec 32) (_ BitVec 8))) (size!7605 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13214 0))(
  ( (BitStream!13215 (buf!7668 array!17547) (currentByte!14135 (_ BitVec 32)) (currentBit!14130 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13214)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!293495 (= res!242357 (validate_offset_bits!1 ((_ sign_extend 32) (size!7605 (buf!7668 thiss!1728))) ((_ sign_extend 32) (currentByte!14135 thiss!1728)) ((_ sign_extend 32) (currentBit!14130 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!293496 () Bool)

(declare-fun res!242355 () Bool)

(assert (=> b!293496 (=> (not res!242355) (not e!209644))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!293496 (= res!242355 (bvslt from!505 to!474))))

(declare-fun b!293497 () Bool)

(declare-fun e!209645 () Bool)

(assert (=> b!293497 (= e!209644 e!209645)))

(declare-fun res!242354 () Bool)

(assert (=> b!293497 (=> (not res!242354) (not e!209645))))

(declare-datatypes ((tuple2!23042 0))(
  ( (tuple2!23043 (_1!12826 Bool) (_2!12826 BitStream!13214)) )
))
(declare-fun lt!425364 () tuple2!23042)

(assert (=> b!293497 (= res!242354 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!523 from!505)) (= (size!7605 (buf!7668 thiss!1728)) (size!7605 (buf!7668 (_2!12826 lt!425364))))))))

(declare-fun readBit!0 (BitStream!13214) tuple2!23042)

(assert (=> b!293497 (= lt!425364 (readBit!0 thiss!1728))))

(declare-fun b!293499 () Bool)

(declare-fun e!209642 () Bool)

(declare-fun array_inv!7217 (array!17547) Bool)

(assert (=> b!293499 (= e!209642 (array_inv!7217 (buf!7668 thiss!1728)))))

(declare-fun res!242356 () Bool)

(assert (=> start!65420 (=> (not res!242356) (not e!209644))))

(declare-fun arr!273 () array!17547)

(assert (=> start!65420 (= res!242356 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7605 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65420 e!209644))

(declare-fun inv!12 (BitStream!13214) Bool)

(assert (=> start!65420 (and (inv!12 thiss!1728) e!209642)))

(assert (=> start!65420 true))

(assert (=> start!65420 (array_inv!7217 arr!273)))

(declare-fun b!293498 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!293498 (= e!209645 (bvsgt (bitIndex!0 (size!7605 (buf!7668 (_2!12826 lt!425364))) (currentByte!14135 (_2!12826 lt!425364)) (currentBit!14130 (_2!12826 lt!425364))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!7605 (buf!7668 thiss!1728)) (currentByte!14135 thiss!1728) (currentBit!14130 thiss!1728)))))))

(assert (= (and start!65420 res!242356) b!293495))

(assert (= (and b!293495 res!242357) b!293496))

(assert (= (and b!293496 res!242355) b!293497))

(assert (= (and b!293497 res!242354) b!293498))

(assert (= start!65420 b!293499))

(declare-fun m!429017 () Bool)

(assert (=> b!293499 m!429017))

(declare-fun m!429019 () Bool)

(assert (=> start!65420 m!429019))

(declare-fun m!429021 () Bool)

(assert (=> start!65420 m!429021))

(declare-fun m!429023 () Bool)

(assert (=> b!293497 m!429023))

(declare-fun m!429025 () Bool)

(assert (=> b!293498 m!429025))

(declare-fun m!429027 () Bool)

(assert (=> b!293498 m!429027))

(declare-fun m!429029 () Bool)

(assert (=> b!293495 m!429029))

(push 1)

(assert (not b!293495))

(assert (not b!293499))

(assert (not start!65420))

(assert (not b!293498))

(assert (not b!293497))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!99114 () Bool)

(assert (=> d!99114 (= (array_inv!7217 (buf!7668 thiss!1728)) (bvsge (size!7605 (buf!7668 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!293499 d!99114))

(declare-fun d!99116 () Bool)

(declare-fun e!209675 () Bool)

(assert (=> d!99116 e!209675))

(declare-fun res!242382 () Bool)

(assert (=> d!99116 (=> (not res!242382) (not e!209675))))

(declare-datatypes ((Unit!20399 0))(
  ( (Unit!20400) )
))
(declare-datatypes ((tuple2!23048 0))(
  ( (tuple2!23049 (_1!12829 Unit!20399) (_2!12829 BitStream!13214)) )
))
(declare-fun increaseBitIndex!0 (BitStream!13214) tuple2!23048)

(assert (=> d!99116 (= res!242382 (= (buf!7668 (_2!12829 (increaseBitIndex!0 thiss!1728))) (buf!7668 thiss!1728)))))

(declare-fun lt!425469 () Bool)

(assert (=> d!99116 (= lt!425469 (not (= (bvand ((_ sign_extend 24) (select (arr!8631 (buf!7668 thiss!1728)) (currentByte!14135 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14130 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!425474 () tuple2!23042)

(assert (=> d!99116 (= lt!425474 (tuple2!23043 (not (= (bvand ((_ sign_extend 24) (select (arr!8631 (buf!7668 thiss!1728)) (currentByte!14135 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14130 thiss!1728)))) #b00000000000000000000000000000000)) (_2!12829 (increaseBitIndex!0 thiss!1728))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!99116 (validate_offset_bit!0 ((_ sign_extend 32) (size!7605 (buf!7668 thiss!1728))) ((_ sign_extend 32) (currentByte!14135 thiss!1728)) ((_ sign_extend 32) (currentBit!14130 thiss!1728)))))

(assert (=> d!99116 (= (readBit!0 thiss!1728) lt!425474)))

(declare-fun b!293524 () Bool)

(declare-fun lt!425470 () (_ BitVec 64))

(declare-fun lt!425471 () (_ BitVec 64))

(assert (=> b!293524 (= e!209675 (= (bitIndex!0 (size!7605 (buf!7668 (_2!12829 (increaseBitIndex!0 thiss!1728)))) (currentByte!14135 (_2!12829 (increaseBitIndex!0 thiss!1728))) (currentBit!14130 (_2!12829 (increaseBitIndex!0 thiss!1728)))) (bvadd lt!425471 lt!425470)))))

(assert (=> b!293524 (or (not (= (bvand lt!425471 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!425470 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!425471 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!425471 lt!425470) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!293524 (= lt!425470 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!293524 (= lt!425471 (bitIndex!0 (size!7605 (buf!7668 thiss!1728)) (currentByte!14135 thiss!1728) (currentBit!14130 thiss!1728)))))

(declare-fun lt!425472 () Bool)

(assert (=> b!293524 (= lt!425472 (not (= (bvand ((_ sign_extend 24) (select (arr!8631 (buf!7668 thiss!1728)) (currentByte!14135 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14130 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!425475 () Bool)

(assert (=> b!293524 (= lt!425475 (not (= (bvand ((_ sign_extend 24) (select (arr!8631 (buf!7668 thiss!1728)) (currentByte!14135 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14130 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!425473 () Bool)

(assert (=> b!293524 (= lt!425473 (not (= (bvand ((_ sign_extend 24) (select (arr!8631 (buf!7668 thiss!1728)) (currentByte!14135 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14130 thiss!1728)))) #b00000000000000000000000000000000)))))

(assert (= (and d!99116 res!242382) b!293524))

(declare-fun m!429067 () Bool)

(assert (=> d!99116 m!429067))

(declare-fun m!429069 () Bool)

(assert (=> d!99116 m!429069))

(declare-fun m!429071 () Bool)

(assert (=> d!99116 m!429071))

(declare-fun m!429073 () Bool)

(assert (=> d!99116 m!429073))

(assert (=> b!293524 m!429067))

(assert (=> b!293524 m!429069))

(declare-fun m!429075 () Bool)

(assert (=> b!293524 m!429075))

(assert (=> b!293524 m!429071))

(assert (=> b!293524 m!429027))

(assert (=> b!293497 d!99116))

(declare-fun d!99120 () Bool)

(declare-fun e!209678 () Bool)

(assert (=> d!99120 e!209678))

(declare-fun res!242387 () Bool)

(assert (=> d!99120 (=> (not res!242387) (not e!209678))))

(declare-fun lt!425493 () (_ BitVec 64))

(declare-fun lt!425492 () (_ BitVec 64))

(declare-fun lt!425488 () (_ BitVec 64))

(assert (=> d!99120 (= res!242387 (= lt!425488 (bvsub lt!425493 lt!425492)))))

(assert (=> d!99120 (or (= (bvand lt!425493 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!425492 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!425493 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!425493 lt!425492) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!99120 (= lt!425492 (remainingBits!0 ((_ sign_extend 32) (size!7605 (buf!7668 (_2!12826 lt!425364)))) ((_ sign_extend 32) (currentByte!14135 (_2!12826 lt!425364))) ((_ sign_extend 32) (currentBit!14130 (_2!12826 lt!425364)))))))

(declare-fun lt!425491 () (_ BitVec 64))

(declare-fun lt!425490 () (_ BitVec 64))

(assert (=> d!99120 (= lt!425493 (bvmul lt!425491 lt!425490))))

(assert (=> d!99120 (or (= lt!425491 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!425490 (bvsdiv (bvmul lt!425491 lt!425490) lt!425491)))))

(assert (=> d!99120 (= lt!425490 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!99120 (= lt!425491 ((_ sign_extend 32) (size!7605 (buf!7668 (_2!12826 lt!425364)))))))

(assert (=> d!99120 (= lt!425488 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14135 (_2!12826 lt!425364))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14130 (_2!12826 lt!425364)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!99120 (invariant!0 (currentBit!14130 (_2!12826 lt!425364)) (currentByte!14135 (_2!12826 lt!425364)) (size!7605 (buf!7668 (_2!12826 lt!425364))))))

(assert (=> d!99120 (= (bitIndex!0 (size!7605 (buf!7668 (_2!12826 lt!425364))) (currentByte!14135 (_2!12826 lt!425364)) (currentBit!14130 (_2!12826 lt!425364))) lt!425488)))

(declare-fun b!293529 () Bool)

(declare-fun res!242388 () Bool)

(assert (=> b!293529 (=> (not res!242388) (not e!209678))))

(assert (=> b!293529 (= res!242388 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!425488))))

(declare-fun b!293530 () Bool)

(declare-fun lt!425489 () (_ BitVec 64))

(assert (=> b!293530 (= e!209678 (bvsle lt!425488 (bvmul lt!425489 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!293530 (or (= lt!425489 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!425489 #b0000000000000000000000000000000000000000000000000000000000001000) lt!425489)))))

(assert (=> b!293530 (= lt!425489 ((_ sign_extend 32) (size!7605 (buf!7668 (_2!12826 lt!425364)))))))

(assert (= (and d!99120 res!242387) b!293529))

(assert (= (and b!293529 res!242388) b!293530))

(declare-fun m!429077 () Bool)

(assert (=> d!99120 m!429077))

(declare-fun m!429079 () Bool)

(assert (=> d!99120 m!429079))

(assert (=> b!293498 d!99120))

(declare-fun d!99122 () Bool)

(declare-fun e!209679 () Bool)

(assert (=> d!99122 e!209679))

(declare-fun res!242389 () Bool)

(assert (=> d!99122 (=> (not res!242389) (not e!209679))))

(declare-fun lt!425499 () (_ BitVec 64))

(declare-fun lt!425494 () (_ BitVec 64))

(declare-fun lt!425498 () (_ BitVec 64))

(assert (=> d!99122 (= res!242389 (= lt!425494 (bvsub lt!425499 lt!425498)))))

(assert (=> d!99122 (or (= (bvand lt!425499 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!425498 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!425499 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!425499 lt!425498) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!99122 (= lt!425498 (remainingBits!0 ((_ sign_extend 32) (size!7605 (buf!7668 thiss!1728))) ((_ sign_extend 32) (currentByte!14135 thiss!1728)) ((_ sign_extend 32) (currentBit!14130 thiss!1728))))))

(declare-fun lt!425497 () (_ BitVec 64))

(declare-fun lt!425496 () (_ BitVec 64))

(assert (=> d!99122 (= lt!425499 (bvmul lt!425497 lt!425496))))

(assert (=> d!99122 (or (= lt!425497 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!425496 (bvsdiv (bvmul lt!425497 lt!425496) lt!425497)))))

(assert (=> d!99122 (= lt!425496 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!99122 (= lt!425497 ((_ sign_extend 32) (size!7605 (buf!7668 thiss!1728))))))

(assert (=> d!99122 (= lt!425494 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14135 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14130 thiss!1728))))))

(assert (=> d!99122 (invariant!0 (currentBit!14130 thiss!1728) (currentByte!14135 thiss!1728) (size!7605 (buf!7668 thiss!1728)))))

(assert (=> d!99122 (= (bitIndex!0 (size!7605 (buf!7668 thiss!1728)) (currentByte!14135 thiss!1728) (currentBit!14130 thiss!1728)) lt!425494)))

(declare-fun b!293531 () Bool)

(declare-fun res!242390 () Bool)

(assert (=> b!293531 (=> (not res!242390) (not e!209679))))

(assert (=> b!293531 (= res!242390 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!425494))))

(declare-fun b!293532 () Bool)

(declare-fun lt!425495 () (_ BitVec 64))

(assert (=> b!293532 (= e!209679 (bvsle lt!425494 (bvmul lt!425495 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!293532 (or (= lt!425495 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!425495 #b0000000000000000000000000000000000000000000000000000000000001000) lt!425495)))))

(assert (=> b!293532 (= lt!425495 ((_ sign_extend 32) (size!7605 (buf!7668 thiss!1728))))))

(assert (= (and d!99122 res!242389) b!293531))

(assert (= (and b!293531 res!242390) b!293532))

(declare-fun m!429081 () Bool)

(assert (=> d!99122 m!429081))

(declare-fun m!429083 () Bool)

(assert (=> d!99122 m!429083))

(assert (=> b!293498 d!99122))

(declare-fun d!99124 () Bool)

(assert (=> d!99124 (= (inv!12 thiss!1728) (invariant!0 (currentBit!14130 thiss!1728) (currentByte!14135 thiss!1728) (size!7605 (buf!7668 thiss!1728))))))

(declare-fun bs!25339 () Bool)

(assert (= bs!25339 d!99124))

(assert (=> bs!25339 m!429083))

(assert (=> start!65420 d!99124))

(declare-fun d!99126 () Bool)

(assert (=> d!99126 (= (array_inv!7217 arr!273) (bvsge (size!7605 arr!273) #b00000000000000000000000000000000))))

(assert (=> start!65420 d!99126))

(declare-fun d!99128 () Bool)

(assert (=> d!99128 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7605 (buf!7668 thiss!1728))) ((_ sign_extend 32) (currentByte!14135 thiss!1728)) ((_ sign_extend 32) (currentBit!14130 thiss!1728)) (bvsub nBits!523 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7605 (buf!7668 thiss!1728))) ((_ sign_extend 32) (currentByte!14135 thiss!1728)) ((_ sign_extend 32) (currentBit!14130 thiss!1728))) (bvsub nBits!523 from!505)))))

(declare-fun bs!25340 () Bool)

(assert (= bs!25340 d!99128))

(assert (=> bs!25340 m!429081))

(assert (=> b!293495 d!99128))

(push 1)

(assert (not d!99122))

(assert (not d!99128))

(assert (not b!293524))

(assert (not d!99116))

(assert (not d!99124))

(assert (not d!99120))

(check-sat)

(pop 1)

(push 1)

(check-sat)

