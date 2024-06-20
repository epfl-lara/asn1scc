; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47614 () Bool)

(assert start!47614)

(declare-fun b!226787 () Bool)

(declare-fun res!190287 () Bool)

(declare-fun e!155085 () Bool)

(assert (=> b!226787 (=> (not res!190287) (not e!155085))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!226787 (= res!190287 (bvslt i!761 to!496))))

(declare-fun b!226788 () Bool)

(declare-fun res!190288 () Bool)

(assert (=> b!226788 (=> (not res!190288) (not e!155085))))

(declare-datatypes ((array!11359 0))(
  ( (array!11360 (arr!5951 (Array (_ BitVec 32) (_ BitVec 8))) (size!4982 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9060 0))(
  ( (BitStream!9061 (buf!5523 array!11359) (currentByte!10349 (_ BitVec 32)) (currentBit!10344 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9060)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!226788 (= res!190288 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4982 (buf!5523 thiss!1870))) ((_ sign_extend 32) (currentByte!10349 thiss!1870)) ((_ sign_extend 32) (currentBit!10344 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun lt!361554 () (_ BitVec 64))

(declare-fun lt!361552 () (_ BitVec 64))

(declare-fun lt!361557 () (_ BitVec 64))

(declare-fun b!226790 () Bool)

(assert (=> b!226790 (= e!155085 (not (or (not (= lt!361552 (bvand lt!361557 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!361552 (bvand (bvadd lt!361554 lt!361557) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!226790 (= lt!361552 (bvand lt!361554 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!226790 (= lt!361557 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761))))))

(declare-fun e!155086 () Bool)

(assert (=> b!226790 e!155086))

(declare-fun res!190285 () Bool)

(assert (=> b!226790 (=> (not res!190285) (not e!155086))))

(declare-fun lt!361555 () (_ BitVec 64))

(assert (=> b!226790 (= res!190285 (= lt!361555 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!361554)))))

(declare-datatypes ((tuple2!19462 0))(
  ( (tuple2!19463 (_1!10546 (_ BitVec 8)) (_2!10546 BitStream!9060)) )
))
(declare-fun lt!361550 () tuple2!19462)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!226790 (= lt!361555 (bitIndex!0 (size!4982 (buf!5523 (_2!10546 lt!361550))) (currentByte!10349 (_2!10546 lt!361550)) (currentBit!10344 (_2!10546 lt!361550))))))

(assert (=> b!226790 (= lt!361554 (bitIndex!0 (size!4982 (buf!5523 thiss!1870)) (currentByte!10349 thiss!1870) (currentBit!10344 thiss!1870)))))

(declare-fun arr!308 () array!11359)

(declare-datatypes ((Unit!16841 0))(
  ( (Unit!16842) )
))
(declare-datatypes ((tuple3!1346 0))(
  ( (tuple3!1347 (_1!10547 Unit!16841) (_2!10547 BitStream!9060) (_3!815 array!11359)) )
))
(declare-fun lt!361551 () tuple3!1346)

(declare-fun readByteArrayLoop!0 (BitStream!9060 array!11359 (_ BitVec 32) (_ BitVec 32)) tuple3!1346)

(assert (=> b!226790 (= lt!361551 (readByteArrayLoop!0 (_2!10546 lt!361550) (array!11360 (store (arr!5951 arr!308) i!761 (_1!10546 lt!361550)) (size!4982 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!361553 () (_ BitVec 32))

(assert (=> b!226790 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4982 (buf!5523 (_2!10546 lt!361550)))) ((_ sign_extend 32) (currentByte!10349 (_2!10546 lt!361550))) ((_ sign_extend 32) (currentBit!10344 (_2!10546 lt!361550))) lt!361553)))

(assert (=> b!226790 (= lt!361553 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!361556 () Unit!16841)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9060 BitStream!9060 (_ BitVec 64) (_ BitVec 32)) Unit!16841)

(assert (=> b!226790 (= lt!361556 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10546 lt!361550) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!9060) tuple2!19462)

(assert (=> b!226790 (= lt!361550 (readByte!0 thiss!1870))))

(declare-fun b!226791 () Bool)

(assert (=> b!226791 (= e!155086 (= (bvadd lt!361555 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!361553))) (bitIndex!0 (size!4982 (buf!5523 (_2!10547 lt!361551))) (currentByte!10349 (_2!10547 lt!361551)) (currentBit!10344 (_2!10547 lt!361551)))))))

(declare-fun b!226789 () Bool)

(declare-fun e!155089 () Bool)

(declare-fun array_inv!4723 (array!11359) Bool)

(assert (=> b!226789 (= e!155089 (array_inv!4723 (buf!5523 thiss!1870)))))

(declare-fun res!190286 () Bool)

(assert (=> start!47614 (=> (not res!190286) (not e!155085))))

(assert (=> start!47614 (= res!190286 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4982 arr!308))))))

(assert (=> start!47614 e!155085))

(assert (=> start!47614 true))

(assert (=> start!47614 (array_inv!4723 arr!308)))

(declare-fun inv!12 (BitStream!9060) Bool)

(assert (=> start!47614 (and (inv!12 thiss!1870) e!155089)))

(assert (= (and start!47614 res!190286) b!226788))

(assert (= (and b!226788 res!190288) b!226787))

(assert (= (and b!226787 res!190287) b!226790))

(assert (= (and b!226790 res!190285) b!226791))

(assert (= start!47614 b!226789))

(declare-fun m!348475 () Bool)

(assert (=> b!226788 m!348475))

(declare-fun m!348477 () Bool)

(assert (=> start!47614 m!348477))

(declare-fun m!348479 () Bool)

(assert (=> start!47614 m!348479))

(declare-fun m!348481 () Bool)

(assert (=> b!226790 m!348481))

(declare-fun m!348483 () Bool)

(assert (=> b!226790 m!348483))

(declare-fun m!348485 () Bool)

(assert (=> b!226790 m!348485))

(declare-fun m!348487 () Bool)

(assert (=> b!226790 m!348487))

(declare-fun m!348489 () Bool)

(assert (=> b!226790 m!348489))

(declare-fun m!348491 () Bool)

(assert (=> b!226790 m!348491))

(declare-fun m!348493 () Bool)

(assert (=> b!226790 m!348493))

(declare-fun m!348495 () Bool)

(assert (=> b!226789 m!348495))

(declare-fun m!348497 () Bool)

(assert (=> b!226791 m!348497))

(check-sat (not b!226790) (not b!226788) (not b!226791) (not start!47614) (not b!226789))
(check-sat)
(get-model)

(declare-fun d!76970 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!76970 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4982 (buf!5523 (_2!10546 lt!361550)))) ((_ sign_extend 32) (currentByte!10349 (_2!10546 lt!361550))) ((_ sign_extend 32) (currentBit!10344 (_2!10546 lt!361550))) lt!361553) (bvsle ((_ sign_extend 32) lt!361553) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4982 (buf!5523 (_2!10546 lt!361550)))) ((_ sign_extend 32) (currentByte!10349 (_2!10546 lt!361550))) ((_ sign_extend 32) (currentBit!10344 (_2!10546 lt!361550)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18816 () Bool)

(assert (= bs!18816 d!76970))

(declare-fun m!348523 () Bool)

(assert (=> bs!18816 m!348523))

(assert (=> b!226790 d!76970))

(declare-fun d!76972 () Bool)

(declare-fun lt!361597 () (_ BitVec 8))

(declare-fun lt!361602 () (_ BitVec 8))

(assert (=> d!76972 (= lt!361597 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5951 (buf!5523 thiss!1870)) (currentByte!10349 thiss!1870))) ((_ sign_extend 24) lt!361602))))))

(assert (=> d!76972 (= lt!361602 ((_ extract 7 0) (currentBit!10344 thiss!1870)))))

(declare-fun e!155110 () Bool)

(assert (=> d!76972 e!155110))

(declare-fun res!190307 () Bool)

(assert (=> d!76972 (=> (not res!190307) (not e!155110))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!76972 (= res!190307 (validate_offset_bits!1 ((_ sign_extend 32) (size!4982 (buf!5523 thiss!1870))) ((_ sign_extend 32) (currentByte!10349 thiss!1870)) ((_ sign_extend 32) (currentBit!10344 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!19466 0))(
  ( (tuple2!19467 (_1!10550 Unit!16841) (_2!10550 (_ BitVec 8))) )
))
(declare-fun Unit!16845 () Unit!16841)

(declare-fun Unit!16846 () Unit!16841)

(assert (=> d!76972 (= (readByte!0 thiss!1870) (tuple2!19463 (_2!10550 (ite (bvsgt ((_ sign_extend 24) lt!361602) #b00000000000000000000000000000000) (tuple2!19467 Unit!16845 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!361597) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5951 (buf!5523 thiss!1870)) (bvadd (currentByte!10349 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!361602)))))))) (tuple2!19467 Unit!16846 lt!361597))) (BitStream!9061 (buf!5523 thiss!1870) (bvadd (currentByte!10349 thiss!1870) #b00000000000000000000000000000001) (currentBit!10344 thiss!1870))))))

(declare-fun b!226811 () Bool)

(declare-fun e!155109 () Bool)

(assert (=> b!226811 (= e!155110 e!155109)))

(declare-fun res!190306 () Bool)

(assert (=> b!226811 (=> (not res!190306) (not e!155109))))

(declare-fun lt!361596 () tuple2!19462)

(assert (=> b!226811 (= res!190306 (= (buf!5523 (_2!10546 lt!361596)) (buf!5523 thiss!1870)))))

(declare-fun lt!361600 () (_ BitVec 8))

(declare-fun lt!361601 () (_ BitVec 8))

(declare-fun Unit!16847 () Unit!16841)

(declare-fun Unit!16848 () Unit!16841)

(assert (=> b!226811 (= lt!361596 (tuple2!19463 (_2!10550 (ite (bvsgt ((_ sign_extend 24) lt!361600) #b00000000000000000000000000000000) (tuple2!19467 Unit!16847 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!361601) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5951 (buf!5523 thiss!1870)) (bvadd (currentByte!10349 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!361600)))))))) (tuple2!19467 Unit!16848 lt!361601))) (BitStream!9061 (buf!5523 thiss!1870) (bvadd (currentByte!10349 thiss!1870) #b00000000000000000000000000000001) (currentBit!10344 thiss!1870))))))

(assert (=> b!226811 (= lt!361601 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5951 (buf!5523 thiss!1870)) (currentByte!10349 thiss!1870))) ((_ sign_extend 24) lt!361600))))))

(assert (=> b!226811 (= lt!361600 ((_ extract 7 0) (currentBit!10344 thiss!1870)))))

(declare-fun lt!361599 () (_ BitVec 64))

(declare-fun b!226812 () Bool)

(declare-fun lt!361598 () (_ BitVec 64))

(assert (=> b!226812 (= e!155109 (= (bitIndex!0 (size!4982 (buf!5523 (_2!10546 lt!361596))) (currentByte!10349 (_2!10546 lt!361596)) (currentBit!10344 (_2!10546 lt!361596))) (bvadd lt!361599 lt!361598)))))

(assert (=> b!226812 (or (not (= (bvand lt!361599 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!361598 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!361599 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!361599 lt!361598) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!226812 (= lt!361598 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!226812 (= lt!361599 (bitIndex!0 (size!4982 (buf!5523 thiss!1870)) (currentByte!10349 thiss!1870) (currentBit!10344 thiss!1870)))))

(assert (= (and d!76972 res!190307) b!226811))

(assert (= (and b!226811 res!190306) b!226812))

(declare-fun m!348525 () Bool)

(assert (=> d!76972 m!348525))

(declare-fun m!348527 () Bool)

(assert (=> d!76972 m!348527))

(declare-fun m!348529 () Bool)

(assert (=> d!76972 m!348529))

(assert (=> b!226811 m!348529))

(assert (=> b!226811 m!348525))

(declare-fun m!348531 () Bool)

(assert (=> b!226812 m!348531))

(assert (=> b!226812 m!348489))

(assert (=> b!226790 d!76972))

(declare-fun d!76974 () Bool)

(declare-fun e!155113 () Bool)

(assert (=> d!76974 e!155113))

(declare-fun res!190310 () Bool)

(assert (=> d!76974 (=> (not res!190310) (not e!155113))))

(assert (=> d!76974 (= res!190310 (and (or (let ((rhs!3915 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3915 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3915) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!76975 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!76975 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!76975 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3914 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3914 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3914) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!361611 () Unit!16841)

(declare-fun choose!57 (BitStream!9060 BitStream!9060 (_ BitVec 64) (_ BitVec 32)) Unit!16841)

(assert (=> d!76974 (= lt!361611 (choose!57 thiss!1870 (_2!10546 lt!361550) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> d!76974 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10546 lt!361550) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)) lt!361611)))

(declare-fun lt!361609 () (_ BitVec 32))

(declare-fun b!226815 () Bool)

(assert (=> b!226815 (= e!155113 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4982 (buf!5523 (_2!10546 lt!361550)))) ((_ sign_extend 32) (currentByte!10349 (_2!10546 lt!361550))) ((_ sign_extend 32) (currentBit!10344 (_2!10546 lt!361550))) (bvsub (bvsub to!496 i!761) lt!361609)))))

(assert (=> b!226815 (or (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand lt!361609 #b10000000000000000000000000000000)) (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!496 i!761) lt!361609) #b10000000000000000000000000000000)))))

(declare-fun lt!361610 () (_ BitVec 64))

(assert (=> b!226815 (= lt!361609 ((_ extract 31 0) lt!361610))))

(assert (=> b!226815 (and (bvslt lt!361610 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!361610 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!226815 (= lt!361610 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!76974 res!190310) b!226815))

(declare-fun m!348533 () Bool)

(assert (=> d!76974 m!348533))

(declare-fun m!348535 () Bool)

(assert (=> b!226815 m!348535))

(assert (=> b!226790 d!76974))

(declare-fun d!76977 () Bool)

(declare-fun e!155116 () Bool)

(assert (=> d!76977 e!155116))

(declare-fun res!190316 () Bool)

(assert (=> d!76977 (=> (not res!190316) (not e!155116))))

(declare-fun lt!361626 () (_ BitVec 64))

(declare-fun lt!361625 () (_ BitVec 64))

(declare-fun lt!361627 () (_ BitVec 64))

(assert (=> d!76977 (= res!190316 (= lt!361626 (bvsub lt!361625 lt!361627)))))

(assert (=> d!76977 (or (= (bvand lt!361625 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!361627 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!361625 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!361625 lt!361627) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!76977 (= lt!361627 (remainingBits!0 ((_ sign_extend 32) (size!4982 (buf!5523 thiss!1870))) ((_ sign_extend 32) (currentByte!10349 thiss!1870)) ((_ sign_extend 32) (currentBit!10344 thiss!1870))))))

(declare-fun lt!361628 () (_ BitVec 64))

(declare-fun lt!361624 () (_ BitVec 64))

(assert (=> d!76977 (= lt!361625 (bvmul lt!361628 lt!361624))))

(assert (=> d!76977 (or (= lt!361628 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!361624 (bvsdiv (bvmul lt!361628 lt!361624) lt!361628)))))

(assert (=> d!76977 (= lt!361624 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76977 (= lt!361628 ((_ sign_extend 32) (size!4982 (buf!5523 thiss!1870))))))

(assert (=> d!76977 (= lt!361626 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10349 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10344 thiss!1870))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!76977 (invariant!0 (currentBit!10344 thiss!1870) (currentByte!10349 thiss!1870) (size!4982 (buf!5523 thiss!1870)))))

(assert (=> d!76977 (= (bitIndex!0 (size!4982 (buf!5523 thiss!1870)) (currentByte!10349 thiss!1870) (currentBit!10344 thiss!1870)) lt!361626)))

(declare-fun b!226820 () Bool)

(declare-fun res!190315 () Bool)

(assert (=> b!226820 (=> (not res!190315) (not e!155116))))

(assert (=> b!226820 (= res!190315 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!361626))))

(declare-fun b!226821 () Bool)

(declare-fun lt!361629 () (_ BitVec 64))

(assert (=> b!226821 (= e!155116 (bvsle lt!361626 (bvmul lt!361629 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!226821 (or (= lt!361629 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!361629 #b0000000000000000000000000000000000000000000000000000000000001000) lt!361629)))))

(assert (=> b!226821 (= lt!361629 ((_ sign_extend 32) (size!4982 (buf!5523 thiss!1870))))))

(assert (= (and d!76977 res!190316) b!226820))

(assert (= (and b!226820 res!190315) b!226821))

(declare-fun m!348537 () Bool)

(assert (=> d!76977 m!348537))

(declare-fun m!348539 () Bool)

(assert (=> d!76977 m!348539))

(assert (=> b!226790 d!76977))

(declare-fun d!76979 () Bool)

(declare-fun e!155117 () Bool)

(assert (=> d!76979 e!155117))

(declare-fun res!190318 () Bool)

(assert (=> d!76979 (=> (not res!190318) (not e!155117))))

(declare-fun lt!361632 () (_ BitVec 64))

(declare-fun lt!361631 () (_ BitVec 64))

(declare-fun lt!361633 () (_ BitVec 64))

(assert (=> d!76979 (= res!190318 (= lt!361632 (bvsub lt!361631 lt!361633)))))

(assert (=> d!76979 (or (= (bvand lt!361631 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!361633 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!361631 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!361631 lt!361633) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!76979 (= lt!361633 (remainingBits!0 ((_ sign_extend 32) (size!4982 (buf!5523 (_2!10546 lt!361550)))) ((_ sign_extend 32) (currentByte!10349 (_2!10546 lt!361550))) ((_ sign_extend 32) (currentBit!10344 (_2!10546 lt!361550)))))))

(declare-fun lt!361634 () (_ BitVec 64))

(declare-fun lt!361630 () (_ BitVec 64))

(assert (=> d!76979 (= lt!361631 (bvmul lt!361634 lt!361630))))

(assert (=> d!76979 (or (= lt!361634 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!361630 (bvsdiv (bvmul lt!361634 lt!361630) lt!361634)))))

(assert (=> d!76979 (= lt!361630 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76979 (= lt!361634 ((_ sign_extend 32) (size!4982 (buf!5523 (_2!10546 lt!361550)))))))

(assert (=> d!76979 (= lt!361632 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10349 (_2!10546 lt!361550))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10344 (_2!10546 lt!361550)))))))

(assert (=> d!76979 (invariant!0 (currentBit!10344 (_2!10546 lt!361550)) (currentByte!10349 (_2!10546 lt!361550)) (size!4982 (buf!5523 (_2!10546 lt!361550))))))

(assert (=> d!76979 (= (bitIndex!0 (size!4982 (buf!5523 (_2!10546 lt!361550))) (currentByte!10349 (_2!10546 lt!361550)) (currentBit!10344 (_2!10546 lt!361550))) lt!361632)))

(declare-fun b!226822 () Bool)

(declare-fun res!190317 () Bool)

(assert (=> b!226822 (=> (not res!190317) (not e!155117))))

(assert (=> b!226822 (= res!190317 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!361632))))

(declare-fun b!226823 () Bool)

(declare-fun lt!361635 () (_ BitVec 64))

(assert (=> b!226823 (= e!155117 (bvsle lt!361632 (bvmul lt!361635 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!226823 (or (= lt!361635 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!361635 #b0000000000000000000000000000000000000000000000000000000000001000) lt!361635)))))

(assert (=> b!226823 (= lt!361635 ((_ sign_extend 32) (size!4982 (buf!5523 (_2!10546 lt!361550)))))))

(assert (= (and d!76979 res!190318) b!226822))

(assert (= (and b!226822 res!190317) b!226823))

(assert (=> d!76979 m!348523))

(declare-fun m!348541 () Bool)

(assert (=> d!76979 m!348541))

(assert (=> b!226790 d!76979))

(declare-fun b!226866 () Bool)

(declare-fun lt!361845 () tuple3!1346)

(declare-fun e!155149 () Bool)

(declare-fun arrayRangesEq!823 (array!11359 array!11359 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!226866 (= e!155149 (arrayRangesEq!823 (array!11360 (store (arr!5951 arr!308) i!761 (_1!10546 lt!361550)) (size!4982 arr!308)) (_3!815 lt!361845) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun b!226867 () Bool)

(declare-fun res!190359 () Bool)

(assert (=> b!226867 (=> (not res!190359) (not e!155149))))

(assert (=> b!226867 (= res!190359 (and (= (buf!5523 (_2!10546 lt!361550)) (buf!5523 (_2!10547 lt!361845))) (= (size!4982 (array!11360 (store (arr!5951 arr!308) i!761 (_1!10546 lt!361550)) (size!4982 arr!308))) (size!4982 (_3!815 lt!361845)))))))

(declare-fun lt!361833 () tuple2!19462)

(declare-fun lt!361825 () (_ BitVec 32))

(declare-fun lt!361822 () array!11359)

(declare-fun lt!361842 () (_ BitVec 32))

(declare-fun c!11188 () Bool)

(declare-fun bm!3778 () Bool)

(declare-fun lt!361836 () array!11359)

(declare-fun call!3783 () Bool)

(assert (=> bm!3778 (= call!3783 (arrayRangesEq!823 (ite c!11188 (array!11360 (store (arr!5951 arr!308) i!761 (_1!10546 lt!361550)) (size!4982 arr!308)) lt!361836) (ite c!11188 (array!11360 (store (arr!5951 (array!11360 (store (arr!5951 arr!308) i!761 (_1!10546 lt!361550)) (size!4982 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10546 lt!361833)) (size!4982 (array!11360 (store (arr!5951 arr!308) i!761 (_1!10546 lt!361550)) (size!4982 arr!308)))) lt!361822) (ite c!11188 #b00000000000000000000000000000000 lt!361842) (ite c!11188 (bvadd #b00000000000000000000000000000001 i!761) lt!361825)))))

(declare-fun b!226868 () Bool)

(declare-fun e!155151 () Bool)

(declare-datatypes ((tuple2!19468 0))(
  ( (tuple2!19469 (_1!10551 BitStream!9060) (_2!10551 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!9060) tuple2!19468)

(assert (=> b!226868 (= e!155151 (= (select (arr!5951 (_3!815 lt!361845)) (bvadd #b00000000000000000000000000000001 i!761)) (_2!10551 (readBytePure!0 (_2!10546 lt!361550)))))))

(assert (=> b!226868 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4982 (_3!815 lt!361845))))))

(declare-fun bm!3779 () Bool)

(declare-fun call!3782 () (_ BitVec 64))

(assert (=> bm!3779 (= call!3782 (bitIndex!0 (size!4982 (buf!5523 (_2!10546 lt!361550))) (currentByte!10349 (_2!10546 lt!361550)) (currentBit!10344 (_2!10546 lt!361550))))))

(declare-fun d!76981 () Bool)

(assert (=> d!76981 e!155151))

(declare-fun res!190360 () Bool)

(assert (=> d!76981 (=> res!190360 e!155151)))

(assert (=> d!76981 (= res!190360 (bvsge (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!361844 () Bool)

(assert (=> d!76981 (= lt!361844 e!155149)))

(declare-fun res!190361 () Bool)

(assert (=> d!76981 (=> (not res!190361) (not e!155149))))

(declare-fun lt!361814 () (_ BitVec 64))

(declare-fun lt!361824 () (_ BitVec 64))

(assert (=> d!76981 (= res!190361 (= (bvadd lt!361814 lt!361824) (bitIndex!0 (size!4982 (buf!5523 (_2!10547 lt!361845))) (currentByte!10349 (_2!10547 lt!361845)) (currentBit!10344 (_2!10547 lt!361845)))))))

(assert (=> d!76981 (or (not (= (bvand lt!361814 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!361824 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!361814 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!361814 lt!361824) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!361828 () (_ BitVec 64))

(assert (=> d!76981 (= lt!361824 (bvmul lt!361828 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!76981 (or (= lt!361828 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!361828 #b0000000000000000000000000000000000000000000000000000000000001000) lt!361828)))))

(assert (=> d!76981 (= lt!361828 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))))))

(assert (=> d!76981 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b10000000000000000000000000000000)))))

(assert (=> d!76981 (= lt!361814 (bitIndex!0 (size!4982 (buf!5523 (_2!10546 lt!361550))) (currentByte!10349 (_2!10546 lt!361550)) (currentBit!10344 (_2!10546 lt!361550))))))

(declare-fun e!155150 () tuple3!1346)

(assert (=> d!76981 (= lt!361845 e!155150)))

(assert (=> d!76981 (= c!11188 (bvslt (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> d!76981 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) to!496) (bvsle to!496 (size!4982 (array!11360 (store (arr!5951 arr!308) i!761 (_1!10546 lt!361550)) (size!4982 arr!308)))))))

(assert (=> d!76981 (= (readByteArrayLoop!0 (_2!10546 lt!361550) (array!11360 (store (arr!5951 arr!308) i!761 (_1!10546 lt!361550)) (size!4982 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496) lt!361845)))

(declare-fun call!3781 () Bool)

(declare-fun bm!3780 () Bool)

(declare-fun lt!361819 () tuple3!1346)

(declare-fun lt!361827 () (_ BitVec 32))

(assert (=> bm!3780 (= call!3781 (arrayRangesEq!823 (array!11360 (store (arr!5951 arr!308) i!761 (_1!10546 lt!361550)) (size!4982 arr!308)) (ite c!11188 (_3!815 lt!361819) (array!11360 (store (arr!5951 arr!308) i!761 (_1!10546 lt!361550)) (size!4982 arr!308))) (ite c!11188 lt!361827 #b00000000000000000000000000000000) (ite c!11188 (bvadd #b00000000000000000000000000000001 i!761) (size!4982 (array!11360 (store (arr!5951 arr!308) i!761 (_1!10546 lt!361550)) (size!4982 arr!308))))))))

(declare-fun b!226869 () Bool)

(declare-fun lt!361835 () Unit!16841)

(assert (=> b!226869 (= e!155150 (tuple3!1347 lt!361835 (_2!10546 lt!361550) (array!11360 (store (arr!5951 arr!308) i!761 (_1!10546 lt!361550)) (size!4982 arr!308))))))

(assert (=> b!226869 (= call!3782 call!3782)))

(declare-fun lt!361818 () Unit!16841)

(declare-fun Unit!16849 () Unit!16841)

(assert (=> b!226869 (= lt!361818 Unit!16849)))

(declare-fun lt!361823 () Unit!16841)

(declare-fun arrayRangesEqReflexiveLemma!127 (array!11359) Unit!16841)

(assert (=> b!226869 (= lt!361823 (arrayRangesEqReflexiveLemma!127 (array!11360 (store (arr!5951 arr!308) i!761 (_1!10546 lt!361550)) (size!4982 arr!308))))))

(assert (=> b!226869 call!3781))

(declare-fun lt!361838 () Unit!16841)

(assert (=> b!226869 (= lt!361838 lt!361823)))

(assert (=> b!226869 (= lt!361836 (array!11360 (store (arr!5951 arr!308) i!761 (_1!10546 lt!361550)) (size!4982 arr!308)))))

(assert (=> b!226869 (= lt!361822 (array!11360 (store (arr!5951 arr!308) i!761 (_1!10546 lt!361550)) (size!4982 arr!308)))))

(declare-fun lt!361832 () (_ BitVec 32))

(assert (=> b!226869 (= lt!361832 #b00000000000000000000000000000000)))

(declare-fun lt!361840 () (_ BitVec 32))

(assert (=> b!226869 (= lt!361840 (size!4982 (array!11360 (store (arr!5951 arr!308) i!761 (_1!10546 lt!361550)) (size!4982 arr!308))))))

(assert (=> b!226869 (= lt!361842 #b00000000000000000000000000000000)))

(assert (=> b!226869 (= lt!361825 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun arrayRangesEqSlicedLemma!112 (array!11359 array!11359 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16841)

(assert (=> b!226869 (= lt!361835 (arrayRangesEqSlicedLemma!112 lt!361836 lt!361822 lt!361832 lt!361840 lt!361842 lt!361825))))

(assert (=> b!226869 call!3783))

(declare-fun b!226870 () Bool)

(declare-fun lt!361811 () Unit!16841)

(assert (=> b!226870 (= e!155150 (tuple3!1347 lt!361811 (_2!10547 lt!361819) (_3!815 lt!361819)))))

(assert (=> b!226870 (= lt!361833 (readByte!0 (_2!10546 lt!361550)))))

(declare-fun lt!361810 () array!11359)

(assert (=> b!226870 (= lt!361810 (array!11360 (store (arr!5951 (array!11360 (store (arr!5951 arr!308) i!761 (_1!10546 lt!361550)) (size!4982 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10546 lt!361833)) (size!4982 (array!11360 (store (arr!5951 arr!308) i!761 (_1!10546 lt!361550)) (size!4982 arr!308)))))))

(declare-fun lt!361816 () (_ BitVec 64))

(assert (=> b!226870 (= lt!361816 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!361813 () (_ BitVec 32))

(assert (=> b!226870 (= lt!361813 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!361817 () Unit!16841)

(assert (=> b!226870 (= lt!361817 (validateOffsetBytesFromBitIndexLemma!0 (_2!10546 lt!361550) (_2!10546 lt!361833) lt!361816 lt!361813))))

(assert (=> b!226870 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4982 (buf!5523 (_2!10546 lt!361833)))) ((_ sign_extend 32) (currentByte!10349 (_2!10546 lt!361833))) ((_ sign_extend 32) (currentBit!10344 (_2!10546 lt!361833))) (bvsub lt!361813 ((_ extract 31 0) (bvsdiv (bvadd lt!361816 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!361821 () Unit!16841)

(assert (=> b!226870 (= lt!361821 lt!361817)))

(assert (=> b!226870 (= lt!361819 (readByteArrayLoop!0 (_2!10546 lt!361833) lt!361810 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(assert (=> b!226870 (= (bitIndex!0 (size!4982 (buf!5523 (_2!10546 lt!361833))) (currentByte!10349 (_2!10546 lt!361833)) (currentBit!10344 (_2!10546 lt!361833))) (bvadd call!3782 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!361812 () Unit!16841)

(declare-fun Unit!16850 () Unit!16841)

(assert (=> b!226870 (= lt!361812 Unit!16850)))

(assert (=> b!226870 (= (bvadd (bitIndex!0 (size!4982 (buf!5523 (_2!10546 lt!361833))) (currentByte!10349 (_2!10546 lt!361833)) (currentBit!10344 (_2!10546 lt!361833))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4982 (buf!5523 (_2!10547 lt!361819))) (currentByte!10349 (_2!10547 lt!361819)) (currentBit!10344 (_2!10547 lt!361819))))))

(declare-fun lt!361831 () Unit!16841)

(declare-fun Unit!16851 () Unit!16841)

(assert (=> b!226870 (= lt!361831 Unit!16851)))

(assert (=> b!226870 (= (bvadd call!3782 (bvmul ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4982 (buf!5523 (_2!10547 lt!361819))) (currentByte!10349 (_2!10547 lt!361819)) (currentBit!10344 (_2!10547 lt!361819))))))

(declare-fun lt!361837 () Unit!16841)

(declare-fun Unit!16852 () Unit!16841)

(assert (=> b!226870 (= lt!361837 Unit!16852)))

(assert (=> b!226870 (and (= (buf!5523 (_2!10546 lt!361550)) (buf!5523 (_2!10547 lt!361819))) (= (size!4982 (array!11360 (store (arr!5951 arr!308) i!761 (_1!10546 lt!361550)) (size!4982 arr!308))) (size!4982 (_3!815 lt!361819))))))

(declare-fun lt!361843 () Unit!16841)

(declare-fun Unit!16853 () Unit!16841)

(assert (=> b!226870 (= lt!361843 Unit!16853)))

(declare-fun lt!361829 () Unit!16841)

(declare-fun arrayUpdatedAtPrefixLemma!382 (array!11359 (_ BitVec 32) (_ BitVec 8)) Unit!16841)

(assert (=> b!226870 (= lt!361829 (arrayUpdatedAtPrefixLemma!382 (array!11360 (store (arr!5951 arr!308) i!761 (_1!10546 lt!361550)) (size!4982 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) (_1!10546 lt!361833)))))

(assert (=> b!226870 call!3783))

(declare-fun lt!361830 () Unit!16841)

(assert (=> b!226870 (= lt!361830 lt!361829)))

(assert (=> b!226870 (= lt!361827 #b00000000000000000000000000000000)))

(declare-fun lt!361834 () Unit!16841)

(declare-fun arrayRangesEqTransitive!261 (array!11359 array!11359 array!11359 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16841)

(assert (=> b!226870 (= lt!361834 (arrayRangesEqTransitive!261 (array!11360 (store (arr!5951 arr!308) i!761 (_1!10546 lt!361550)) (size!4982 arr!308)) lt!361810 (_3!815 lt!361819) lt!361827 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!226870 call!3781))

(declare-fun lt!361839 () Unit!16841)

(assert (=> b!226870 (= lt!361839 lt!361834)))

(assert (=> b!226870 (arrayRangesEq!823 (array!11360 (store (arr!5951 arr!308) i!761 (_1!10546 lt!361550)) (size!4982 arr!308)) (_3!815 lt!361819) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun lt!361815 () Unit!16841)

(declare-fun Unit!16854 () Unit!16841)

(assert (=> b!226870 (= lt!361815 Unit!16854)))

(declare-fun lt!361826 () Unit!16841)

(declare-fun arrayRangesEqImpliesEq!112 (array!11359 array!11359 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16841)

(assert (=> b!226870 (= lt!361826 (arrayRangesEqImpliesEq!112 lt!361810 (_3!815 lt!361819) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!226870 (= (select (store (arr!5951 (array!11360 (store (arr!5951 arr!308) i!761 (_1!10546 lt!361550)) (size!4982 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10546 lt!361833)) (bvadd #b00000000000000000000000000000001 i!761)) (select (arr!5951 (_3!815 lt!361819)) (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!361820 () Unit!16841)

(assert (=> b!226870 (= lt!361820 lt!361826)))

(declare-fun lt!361841 () Bool)

(assert (=> b!226870 (= lt!361841 (= (select (arr!5951 (_3!815 lt!361819)) (bvadd #b00000000000000000000000000000001 i!761)) (_1!10546 lt!361833)))))

(declare-fun Unit!16855 () Unit!16841)

(assert (=> b!226870 (= lt!361811 Unit!16855)))

(assert (=> b!226870 lt!361841))

(assert (= (and d!76981 c!11188) b!226870))

(assert (= (and d!76981 (not c!11188)) b!226869))

(assert (= (or b!226870 b!226869) bm!3778))

(assert (= (or b!226870 b!226869) bm!3780))

(assert (= (or b!226870 b!226869) bm!3779))

(assert (= (and d!76981 res!190361) b!226867))

(assert (= (and b!226867 res!190359) b!226866))

(assert (= (and d!76981 (not res!190360)) b!226868))

(declare-fun m!348581 () Bool)

(assert (=> b!226869 m!348581))

(declare-fun m!348583 () Bool)

(assert (=> b!226869 m!348583))

(declare-fun m!348585 () Bool)

(assert (=> b!226868 m!348585))

(declare-fun m!348587 () Bool)

(assert (=> b!226868 m!348587))

(assert (=> bm!3779 m!348491))

(declare-fun m!348589 () Bool)

(assert (=> d!76981 m!348589))

(assert (=> d!76981 m!348491))

(declare-fun m!348591 () Bool)

(assert (=> bm!3780 m!348591))

(declare-fun m!348593 () Bool)

(assert (=> bm!3778 m!348593))

(declare-fun m!348595 () Bool)

(assert (=> bm!3778 m!348595))

(declare-fun m!348597 () Bool)

(assert (=> b!226866 m!348597))

(declare-fun m!348599 () Bool)

(assert (=> b!226870 m!348599))

(declare-fun m!348601 () Bool)

(assert (=> b!226870 m!348601))

(declare-fun m!348603 () Bool)

(assert (=> b!226870 m!348603))

(declare-fun m!348605 () Bool)

(assert (=> b!226870 m!348605))

(declare-fun m!348607 () Bool)

(assert (=> b!226870 m!348607))

(assert (=> b!226870 m!348593))

(declare-fun m!348609 () Bool)

(assert (=> b!226870 m!348609))

(declare-fun m!348611 () Bool)

(assert (=> b!226870 m!348611))

(declare-fun m!348613 () Bool)

(assert (=> b!226870 m!348613))

(declare-fun m!348615 () Bool)

(assert (=> b!226870 m!348615))

(declare-fun m!348617 () Bool)

(assert (=> b!226870 m!348617))

(declare-fun m!348619 () Bool)

(assert (=> b!226870 m!348619))

(declare-fun m!348621 () Bool)

(assert (=> b!226870 m!348621))

(assert (=> b!226790 d!76981))

(declare-fun d!77009 () Bool)

(declare-fun e!155152 () Bool)

(assert (=> d!77009 e!155152))

(declare-fun res!190363 () Bool)

(assert (=> d!77009 (=> (not res!190363) (not e!155152))))

(declare-fun lt!361849 () (_ BitVec 64))

(declare-fun lt!361847 () (_ BitVec 64))

(declare-fun lt!361848 () (_ BitVec 64))

(assert (=> d!77009 (= res!190363 (= lt!361848 (bvsub lt!361847 lt!361849)))))

(assert (=> d!77009 (or (= (bvand lt!361847 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!361849 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!361847 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!361847 lt!361849) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77009 (= lt!361849 (remainingBits!0 ((_ sign_extend 32) (size!4982 (buf!5523 (_2!10547 lt!361551)))) ((_ sign_extend 32) (currentByte!10349 (_2!10547 lt!361551))) ((_ sign_extend 32) (currentBit!10344 (_2!10547 lt!361551)))))))

(declare-fun lt!361850 () (_ BitVec 64))

(declare-fun lt!361846 () (_ BitVec 64))

(assert (=> d!77009 (= lt!361847 (bvmul lt!361850 lt!361846))))

(assert (=> d!77009 (or (= lt!361850 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!361846 (bvsdiv (bvmul lt!361850 lt!361846) lt!361850)))))

(assert (=> d!77009 (= lt!361846 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77009 (= lt!361850 ((_ sign_extend 32) (size!4982 (buf!5523 (_2!10547 lt!361551)))))))

(assert (=> d!77009 (= lt!361848 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10349 (_2!10547 lt!361551))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10344 (_2!10547 lt!361551)))))))

(assert (=> d!77009 (invariant!0 (currentBit!10344 (_2!10547 lt!361551)) (currentByte!10349 (_2!10547 lt!361551)) (size!4982 (buf!5523 (_2!10547 lt!361551))))))

(assert (=> d!77009 (= (bitIndex!0 (size!4982 (buf!5523 (_2!10547 lt!361551))) (currentByte!10349 (_2!10547 lt!361551)) (currentBit!10344 (_2!10547 lt!361551))) lt!361848)))

(declare-fun b!226871 () Bool)

(declare-fun res!190362 () Bool)

(assert (=> b!226871 (=> (not res!190362) (not e!155152))))

(assert (=> b!226871 (= res!190362 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!361848))))

(declare-fun b!226872 () Bool)

(declare-fun lt!361851 () (_ BitVec 64))

(assert (=> b!226872 (= e!155152 (bvsle lt!361848 (bvmul lt!361851 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!226872 (or (= lt!361851 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!361851 #b0000000000000000000000000000000000000000000000000000000000001000) lt!361851)))))

(assert (=> b!226872 (= lt!361851 ((_ sign_extend 32) (size!4982 (buf!5523 (_2!10547 lt!361551)))))))

(assert (= (and d!77009 res!190363) b!226871))

(assert (= (and b!226871 res!190362) b!226872))

(declare-fun m!348623 () Bool)

(assert (=> d!77009 m!348623))

(declare-fun m!348625 () Bool)

(assert (=> d!77009 m!348625))

(assert (=> b!226791 d!77009))

(declare-fun d!77011 () Bool)

(assert (=> d!77011 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4982 (buf!5523 thiss!1870))) ((_ sign_extend 32) (currentByte!10349 thiss!1870)) ((_ sign_extend 32) (currentBit!10344 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4982 (buf!5523 thiss!1870))) ((_ sign_extend 32) (currentByte!10349 thiss!1870)) ((_ sign_extend 32) (currentBit!10344 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18819 () Bool)

(assert (= bs!18819 d!77011))

(assert (=> bs!18819 m!348537))

(assert (=> b!226788 d!77011))

(declare-fun d!77013 () Bool)

(assert (=> d!77013 (= (array_inv!4723 arr!308) (bvsge (size!4982 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!47614 d!77013))

(declare-fun d!77015 () Bool)

(assert (=> d!77015 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10344 thiss!1870) (currentByte!10349 thiss!1870) (size!4982 (buf!5523 thiss!1870))))))

(declare-fun bs!18820 () Bool)

(assert (= bs!18820 d!77015))

(assert (=> bs!18820 m!348539))

(assert (=> start!47614 d!77015))

(declare-fun d!77017 () Bool)

(assert (=> d!77017 (= (array_inv!4723 (buf!5523 thiss!1870)) (bvsge (size!4982 (buf!5523 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!226789 d!77017))

(check-sat (not d!76979) (not d!76981) (not b!226869) (not b!226815) (not d!76970) (not d!76972) (not d!77011) (not bm!3780) (not b!226870) (not bm!3778) (not bm!3779) (not d!77015) (not b!226866) (not b!226868) (not b!226812) (not d!77009) (not d!76977) (not d!76974))
