; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47846 () Bool)

(assert start!47846)

(declare-fun b!227705 () Bool)

(declare-fun res!191018 () Bool)

(declare-fun e!155906 () Bool)

(assert (=> b!227705 (=> (not res!191018) (not e!155906))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!227705 (= res!191018 (bvslt i!761 to!496))))

(declare-fun b!227706 () Bool)

(declare-fun res!191019 () Bool)

(assert (=> b!227706 (=> (not res!191019) (not e!155906))))

(declare-datatypes ((array!11462 0))(
  ( (array!11463 (arr!6007 (Array (_ BitVec 32) (_ BitVec 8))) (size!5029 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9154 0))(
  ( (BitStream!9155 (buf!5570 array!11462) (currentByte!10414 (_ BitVec 32)) (currentBit!10409 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9154)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227706 (= res!191019 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5029 (buf!5570 thiss!1870))) ((_ sign_extend 32) (currentByte!10414 thiss!1870)) ((_ sign_extend 32) (currentBit!10409 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun res!191020 () Bool)

(assert (=> start!47846 (=> (not res!191020) (not e!155906))))

(declare-fun arr!308 () array!11462)

(assert (=> start!47846 (= res!191020 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5029 arr!308))))))

(assert (=> start!47846 e!155906))

(assert (=> start!47846 true))

(declare-fun array_inv!4770 (array!11462) Bool)

(assert (=> start!47846 (array_inv!4770 arr!308)))

(declare-fun e!155908 () Bool)

(declare-fun inv!12 (BitStream!9154) Bool)

(assert (=> start!47846 (and (inv!12 thiss!1870) e!155908)))

(declare-fun b!227707 () Bool)

(declare-fun e!155907 () Bool)

(assert (=> b!227707 (= e!155906 (not e!155907))))

(declare-fun res!191017 () Bool)

(assert (=> b!227707 (=> res!191017 e!155907)))

(assert (=> b!227707 (= res!191017 (or (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsgt (bvadd #b00000000000000000000000000000001 i!761) (size!5029 arr!308)) (bvsge i!761 (bvadd #b00000000000000000000000000000001 i!761))))))

(declare-datatypes ((Unit!17032 0))(
  ( (Unit!17033) )
))
(declare-datatypes ((tuple3!1440 0))(
  ( (tuple3!1441 (_1!10658 Unit!17032) (_2!10658 BitStream!9154) (_3!862 array!11462)) )
))
(declare-fun lt!364339 () tuple3!1440)

(declare-fun arrayRangesEq!865 (array!11462 array!11462 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227707 (arrayRangesEq!865 arr!308 (_3!862 lt!364339) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!364346 () Unit!17032)

(declare-fun lt!364345 () array!11462)

(declare-fun arrayRangesEqTransitive!288 (array!11462 array!11462 array!11462 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17032)

(assert (=> b!227707 (= lt!364346 (arrayRangesEqTransitive!288 arr!308 lt!364345 (_3!862 lt!364339) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!227707 (arrayRangesEq!865 arr!308 lt!364345 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!364342 () Unit!17032)

(declare-datatypes ((tuple2!19592 0))(
  ( (tuple2!19593 (_1!10659 (_ BitVec 8)) (_2!10659 BitStream!9154)) )
))
(declare-fun lt!364344 () tuple2!19592)

(declare-fun arrayUpdatedAtPrefixLemma!424 (array!11462 (_ BitVec 32) (_ BitVec 8)) Unit!17032)

(assert (=> b!227707 (= lt!364342 (arrayUpdatedAtPrefixLemma!424 arr!308 i!761 (_1!10659 lt!364344)))))

(declare-fun lt!364340 () (_ BitVec 64))

(declare-fun lt!364341 () (_ BitVec 64))

(declare-fun lt!364347 () (_ BitVec 64))

(declare-fun lt!364343 () (_ BitVec 32))

(assert (=> b!227707 (and (= (bvadd lt!364341 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!364343))) lt!364347) (= (bvadd lt!364340 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!364347) (= (buf!5570 thiss!1870) (buf!5570 (_2!10658 lt!364339))) (= (size!5029 arr!308) (size!5029 (_3!862 lt!364339))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!227707 (= lt!364347 (bitIndex!0 (size!5029 (buf!5570 (_2!10658 lt!364339))) (currentByte!10414 (_2!10658 lt!364339)) (currentBit!10409 (_2!10658 lt!364339))))))

(assert (=> b!227707 (= lt!364341 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!364340))))

(assert (=> b!227707 (= lt!364341 (bitIndex!0 (size!5029 (buf!5570 (_2!10659 lt!364344))) (currentByte!10414 (_2!10659 lt!364344)) (currentBit!10409 (_2!10659 lt!364344))))))

(assert (=> b!227707 (= lt!364340 (bitIndex!0 (size!5029 (buf!5570 thiss!1870)) (currentByte!10414 thiss!1870) (currentBit!10409 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9154 array!11462 (_ BitVec 32) (_ BitVec 32)) tuple3!1440)

(assert (=> b!227707 (= lt!364339 (readByteArrayLoop!0 (_2!10659 lt!364344) lt!364345 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!227707 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5029 (buf!5570 (_2!10659 lt!364344)))) ((_ sign_extend 32) (currentByte!10414 (_2!10659 lt!364344))) ((_ sign_extend 32) (currentBit!10409 (_2!10659 lt!364344))) lt!364343)))

(assert (=> b!227707 (= lt!364343 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!364338 () Unit!17032)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9154 BitStream!9154 (_ BitVec 64) (_ BitVec 32)) Unit!17032)

(assert (=> b!227707 (= lt!364338 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10659 lt!364344) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!227707 (= lt!364345 (array!11463 (store (arr!6007 arr!308) i!761 (_1!10659 lt!364344)) (size!5029 arr!308)))))

(declare-fun readByte!0 (BitStream!9154) tuple2!19592)

(assert (=> b!227707 (= lt!364344 (readByte!0 thiss!1870))))

(declare-fun b!227708 () Bool)

(assert (=> b!227708 (= e!155907 (arrayRangesEq!865 lt!364345 (_3!862 lt!364339) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun b!227709 () Bool)

(assert (=> b!227709 (= e!155908 (array_inv!4770 (buf!5570 thiss!1870)))))

(assert (= (and start!47846 res!191020) b!227706))

(assert (= (and b!227706 res!191019) b!227705))

(assert (= (and b!227705 res!191018) b!227707))

(assert (= (and b!227707 (not res!191017)) b!227708))

(assert (= start!47846 b!227709))

(declare-fun m!350461 () Bool)

(assert (=> b!227707 m!350461))

(declare-fun m!350463 () Bool)

(assert (=> b!227707 m!350463))

(declare-fun m!350465 () Bool)

(assert (=> b!227707 m!350465))

(declare-fun m!350467 () Bool)

(assert (=> b!227707 m!350467))

(declare-fun m!350469 () Bool)

(assert (=> b!227707 m!350469))

(declare-fun m!350471 () Bool)

(assert (=> b!227707 m!350471))

(declare-fun m!350473 () Bool)

(assert (=> b!227707 m!350473))

(declare-fun m!350475 () Bool)

(assert (=> b!227707 m!350475))

(declare-fun m!350477 () Bool)

(assert (=> b!227707 m!350477))

(declare-fun m!350479 () Bool)

(assert (=> b!227707 m!350479))

(declare-fun m!350481 () Bool)

(assert (=> b!227707 m!350481))

(declare-fun m!350483 () Bool)

(assert (=> b!227707 m!350483))

(declare-fun m!350485 () Bool)

(assert (=> b!227706 m!350485))

(declare-fun m!350487 () Bool)

(assert (=> b!227708 m!350487))

(declare-fun m!350489 () Bool)

(assert (=> b!227709 m!350489))

(declare-fun m!350491 () Bool)

(assert (=> start!47846 m!350491))

(declare-fun m!350493 () Bool)

(assert (=> start!47846 m!350493))

(push 1)

(assert (not b!227707))

(assert (not b!227706))

(assert (not b!227708))

(assert (not b!227709))

(assert (not start!47846))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!77229 () Bool)

(assert (=> d!77229 (= (array_inv!4770 (buf!5570 thiss!1870)) (bvsge (size!5029 (buf!5570 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!227709 d!77229))

(declare-fun d!77235 () Bool)

(declare-fun res!191053 () Bool)

(declare-fun e!155947 () Bool)

(assert (=> d!77235 (=> res!191053 e!155947)))

(assert (=> d!77235 (= res!191053 (= #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!77235 (= (arrayRangesEq!865 lt!364345 (_3!862 lt!364339) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) e!155947)))

(declare-fun b!227748 () Bool)

(declare-fun e!155948 () Bool)

(assert (=> b!227748 (= e!155947 e!155948)))

(declare-fun res!191054 () Bool)

(assert (=> b!227748 (=> (not res!191054) (not e!155948))))

(assert (=> b!227748 (= res!191054 (= (select (arr!6007 lt!364345) #b00000000000000000000000000000000) (select (arr!6007 (_3!862 lt!364339)) #b00000000000000000000000000000000)))))

(declare-fun b!227749 () Bool)

(assert (=> b!227749 (= e!155948 (arrayRangesEq!865 lt!364345 (_3!862 lt!364339) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (= (and d!77235 (not res!191053)) b!227748))

(assert (= (and b!227748 res!191054) b!227749))

(declare-fun m!350565 () Bool)

(assert (=> b!227748 m!350565))

(declare-fun m!350567 () Bool)

(assert (=> b!227748 m!350567))

(declare-fun m!350569 () Bool)

(assert (=> b!227749 m!350569))

(assert (=> b!227708 d!77235))

(declare-fun d!77239 () Bool)

(declare-fun res!191055 () Bool)

(declare-fun e!155949 () Bool)

(assert (=> d!77239 (=> res!191055 e!155949)))

(assert (=> d!77239 (= res!191055 (= #b00000000000000000000000000000000 i!761))))

(assert (=> d!77239 (= (arrayRangesEq!865 arr!308 (_3!862 lt!364339) #b00000000000000000000000000000000 i!761) e!155949)))

(declare-fun b!227750 () Bool)

(declare-fun e!155950 () Bool)

(assert (=> b!227750 (= e!155949 e!155950)))

(declare-fun res!191056 () Bool)

(assert (=> b!227750 (=> (not res!191056) (not e!155950))))

(assert (=> b!227750 (= res!191056 (= (select (arr!6007 arr!308) #b00000000000000000000000000000000) (select (arr!6007 (_3!862 lt!364339)) #b00000000000000000000000000000000)))))

(declare-fun b!227751 () Bool)

(assert (=> b!227751 (= e!155950 (arrayRangesEq!865 arr!308 (_3!862 lt!364339) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) i!761))))

(assert (= (and d!77239 (not res!191055)) b!227750))

(assert (= (and b!227750 res!191056) b!227751))

(declare-fun m!350571 () Bool)

(assert (=> b!227750 m!350571))

(assert (=> b!227750 m!350567))

(declare-fun m!350573 () Bool)

(assert (=> b!227751 m!350573))

(assert (=> b!227707 d!77239))

(declare-fun b!227804 () Bool)

(declare-fun e!155994 () tuple3!1440)

(declare-fun lt!364602 () Unit!17032)

(declare-fun lt!364583 () tuple3!1440)

(assert (=> b!227804 (= e!155994 (tuple3!1441 lt!364602 (_2!10658 lt!364583) (_3!862 lt!364583)))))

(declare-fun lt!364600 () tuple2!19592)

(assert (=> b!227804 (= lt!364600 (readByte!0 (_2!10659 lt!364344)))))

(declare-fun lt!364582 () array!11462)

(assert (=> b!227804 (= lt!364582 (array!11463 (store (arr!6007 lt!364345) (bvadd #b00000000000000000000000000000001 i!761) (_1!10659 lt!364600)) (size!5029 lt!364345)))))

(declare-fun lt!364584 () (_ BitVec 64))

(assert (=> b!227804 (= lt!364584 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!364606 () (_ BitVec 32))

(assert (=> b!227804 (= lt!364606 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!364603 () Unit!17032)

(assert (=> b!227804 (= lt!364603 (validateOffsetBytesFromBitIndexLemma!0 (_2!10659 lt!364344) (_2!10659 lt!364600) lt!364584 lt!364606))))

(assert (=> b!227804 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5029 (buf!5570 (_2!10659 lt!364600)))) ((_ sign_extend 32) (currentByte!10414 (_2!10659 lt!364600))) ((_ sign_extend 32) (currentBit!10409 (_2!10659 lt!364600))) (bvsub lt!364606 ((_ extract 31 0) (bvsdiv (bvadd lt!364584 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!364604 () Unit!17032)

(assert (=> b!227804 (= lt!364604 lt!364603)))

(assert (=> b!227804 (= lt!364583 (readByteArrayLoop!0 (_2!10659 lt!364600) lt!364582 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(assert (=> b!227804 (= (bitIndex!0 (size!5029 (buf!5570 (_2!10659 lt!364600))) (currentByte!10414 (_2!10659 lt!364600)) (currentBit!10409 (_2!10659 lt!364600))) (bvadd (bitIndex!0 (size!5029 (buf!5570 (_2!10659 lt!364344))) (currentByte!10414 (_2!10659 lt!364344)) (currentBit!10409 (_2!10659 lt!364344))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!364605 () Unit!17032)

(declare-fun Unit!17038 () Unit!17032)

(assert (=> b!227804 (= lt!364605 Unit!17038)))

(declare-fun call!3863 () (_ BitVec 64))

(assert (=> b!227804 (= (bvadd (bitIndex!0 (size!5029 (buf!5570 (_2!10659 lt!364600))) (currentByte!10414 (_2!10659 lt!364600)) (currentBit!10409 (_2!10659 lt!364600))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!3863)))

(declare-fun lt!364612 () Unit!17032)

(declare-fun Unit!17039 () Unit!17032)

(assert (=> b!227804 (= lt!364612 Unit!17039)))

(assert (=> b!227804 (= (bvadd (bitIndex!0 (size!5029 (buf!5570 (_2!10659 lt!364344))) (currentByte!10414 (_2!10659 lt!364344)) (currentBit!10409 (_2!10659 lt!364344))) (bvmul ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))) #b0000000000000000000000000000000000000000000000000000000000001000)) call!3863)))

(declare-fun lt!364608 () Unit!17032)

(declare-fun Unit!17040 () Unit!17032)

(assert (=> b!227804 (= lt!364608 Unit!17040)))

(assert (=> b!227804 (and (= (buf!5570 (_2!10659 lt!364344)) (buf!5570 (_2!10658 lt!364583))) (= (size!5029 lt!364345) (size!5029 (_3!862 lt!364583))))))

(declare-fun lt!364613 () Unit!17032)

(declare-fun Unit!17041 () Unit!17032)

(assert (=> b!227804 (= lt!364613 Unit!17041)))

(declare-fun lt!364589 () Unit!17032)

(assert (=> b!227804 (= lt!364589 (arrayUpdatedAtPrefixLemma!424 lt!364345 (bvadd #b00000000000000000000000000000001 i!761) (_1!10659 lt!364600)))))

(assert (=> b!227804 (arrayRangesEq!865 lt!364345 (array!11463 (store (arr!6007 lt!364345) (bvadd #b00000000000000000000000000000001 i!761) (_1!10659 lt!364600)) (size!5029 lt!364345)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun lt!364586 () Unit!17032)

(assert (=> b!227804 (= lt!364586 lt!364589)))

(declare-fun lt!364593 () (_ BitVec 32))

(assert (=> b!227804 (= lt!364593 #b00000000000000000000000000000000)))

(declare-fun lt!364594 () Unit!17032)

(assert (=> b!227804 (= lt!364594 (arrayRangesEqTransitive!288 lt!364345 lt!364582 (_3!862 lt!364583) lt!364593 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(declare-fun call!3864 () Bool)

(assert (=> b!227804 call!3864))

(declare-fun lt!364587 () Unit!17032)

(assert (=> b!227804 (= lt!364587 lt!364594)))

(declare-fun call!3862 () Bool)

(assert (=> b!227804 call!3862))

(declare-fun lt!364579 () Unit!17032)

(declare-fun Unit!17042 () Unit!17032)

(assert (=> b!227804 (= lt!364579 Unit!17042)))

(declare-fun lt!364597 () Unit!17032)

(declare-fun arrayRangesEqImpliesEq!121 (array!11462 array!11462 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17032)

(assert (=> b!227804 (= lt!364597 (arrayRangesEqImpliesEq!121 lt!364582 (_3!862 lt!364583) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!227804 (= (select (store (arr!6007 lt!364345) (bvadd #b00000000000000000000000000000001 i!761) (_1!10659 lt!364600)) (bvadd #b00000000000000000000000000000001 i!761)) (select (arr!6007 (_3!862 lt!364583)) (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!364580 () Unit!17032)

(assert (=> b!227804 (= lt!364580 lt!364597)))

(declare-fun lt!364610 () Bool)

(assert (=> b!227804 (= lt!364610 (= (select (arr!6007 (_3!862 lt!364583)) (bvadd #b00000000000000000000000000000001 i!761)) (_1!10659 lt!364600)))))

(declare-fun Unit!17045 () Unit!17032)

(assert (=> b!227804 (= lt!364602 Unit!17045)))

(assert (=> b!227804 lt!364610))

(declare-fun b!227805 () Bool)

(declare-fun e!155993 () Bool)

(declare-fun lt!364607 () tuple3!1440)

(assert (=> b!227805 (= e!155993 (arrayRangesEq!865 lt!364345 (_3!862 lt!364607) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun d!77241 () Bool)

(declare-fun e!155995 () Bool)

(assert (=> d!77241 e!155995))

(declare-fun res!191109 () Bool)

(assert (=> d!77241 (=> res!191109 e!155995)))

(assert (=> d!77241 (= res!191109 (bvsge (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!364588 () Bool)

(assert (=> d!77241 (= lt!364588 e!155993)))

(declare-fun res!191107 () Bool)

(assert (=> d!77241 (=> (not res!191107) (not e!155993))))

(declare-fun lt!364592 () (_ BitVec 64))

(declare-fun lt!364599 () (_ BitVec 64))

(assert (=> d!77241 (= res!191107 (= (bvadd lt!364592 lt!364599) (bitIndex!0 (size!5029 (buf!5570 (_2!10658 lt!364607))) (currentByte!10414 (_2!10658 lt!364607)) (currentBit!10409 (_2!10658 lt!364607)))))))

(assert (=> d!77241 (or (not (= (bvand lt!364592 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!364599 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!364592 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!364592 lt!364599) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!364601 () (_ BitVec 64))

(assert (=> d!77241 (= lt!364599 (bvmul lt!364601 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!77241 (or (= lt!364601 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!364601 #b0000000000000000000000000000000000000000000000000000000000001000) lt!364601)))))

(assert (=> d!77241 (= lt!364601 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))))))

(assert (=> d!77241 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b10000000000000000000000000000000)))))

(assert (=> d!77241 (= lt!364592 (bitIndex!0 (size!5029 (buf!5570 (_2!10659 lt!364344))) (currentByte!10414 (_2!10659 lt!364344)) (currentBit!10409 (_2!10659 lt!364344))))))

(assert (=> d!77241 (= lt!364607 e!155994)))

(declare-fun c!11215 () Bool)

(assert (=> d!77241 (= c!11215 (bvslt (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> d!77241 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) to!496) (bvsle to!496 (size!5029 lt!364345)))))

(assert (=> d!77241 (= (readByteArrayLoop!0 (_2!10659 lt!364344) lt!364345 (bvadd #b00000000000000000000000000000001 i!761) to!496) lt!364607)))

(declare-fun lt!364596 () (_ BitVec 32))

(declare-fun bm!3859 () Bool)

(declare-fun lt!364591 () array!11462)

(declare-fun lt!364581 () array!11462)

(declare-fun lt!364611 () (_ BitVec 32))

(assert (=> bm!3859 (= call!3864 (arrayRangesEq!865 (ite c!11215 lt!364345 lt!364581) (ite c!11215 (_3!862 lt!364583) lt!364591) (ite c!11215 lt!364593 lt!364611) (ite c!11215 (bvadd #b00000000000000000000000000000001 i!761) lt!364596)))))

(declare-fun b!227806 () Bool)

(declare-fun res!191108 () Bool)

(assert (=> b!227806 (=> (not res!191108) (not e!155993))))

(assert (=> b!227806 (= res!191108 (and (= (buf!5570 (_2!10659 lt!364344)) (buf!5570 (_2!10658 lt!364607))) (= (size!5029 lt!364345) (size!5029 (_3!862 lt!364607)))))))

(declare-fun bm!3860 () Bool)

(assert (=> bm!3860 (= call!3862 (arrayRangesEq!865 lt!364345 (ite c!11215 (_3!862 lt!364583) lt!364345) #b00000000000000000000000000000000 (ite c!11215 (bvadd #b00000000000000000000000000000001 i!761) (size!5029 lt!364345))))))

(declare-fun bm!3861 () Bool)

(assert (=> bm!3861 (= call!3863 (bitIndex!0 (ite c!11215 (size!5029 (buf!5570 (_2!10658 lt!364583))) (size!5029 (buf!5570 (_2!10659 lt!364344)))) (ite c!11215 (currentByte!10414 (_2!10658 lt!364583)) (currentByte!10414 (_2!10659 lt!364344))) (ite c!11215 (currentBit!10409 (_2!10658 lt!364583)) (currentBit!10409 (_2!10659 lt!364344)))))))

(declare-fun lt!364609 () Unit!17032)

(declare-fun b!227807 () Bool)

(assert (=> b!227807 (= e!155994 (tuple3!1441 lt!364609 (_2!10659 lt!364344) lt!364345))))

(assert (=> b!227807 (= call!3863 call!3863)))

(declare-fun lt!364614 () Unit!17032)

(declare-fun Unit!17048 () Unit!17032)

(assert (=> b!227807 (= lt!364614 Unit!17048)))

(declare-fun lt!364595 () Unit!17032)

(declare-fun arrayRangesEqReflexiveLemma!136 (array!11462) Unit!17032)

(assert (=> b!227807 (= lt!364595 (arrayRangesEqReflexiveLemma!136 lt!364345))))

(assert (=> b!227807 call!3862))

(declare-fun lt!364590 () Unit!17032)

(assert (=> b!227807 (= lt!364590 lt!364595)))

(assert (=> b!227807 (= lt!364581 lt!364345)))

(assert (=> b!227807 (= lt!364591 lt!364345)))

(declare-fun lt!364598 () (_ BitVec 32))

(assert (=> b!227807 (= lt!364598 #b00000000000000000000000000000000)))

(declare-fun lt!364585 () (_ BitVec 32))

(assert (=> b!227807 (= lt!364585 (size!5029 lt!364345))))

(assert (=> b!227807 (= lt!364611 #b00000000000000000000000000000000)))

(assert (=> b!227807 (= lt!364596 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun arrayRangesEqSlicedLemma!121 (array!11462 array!11462 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17032)

(assert (=> b!227807 (= lt!364609 (arrayRangesEqSlicedLemma!121 lt!364581 lt!364591 lt!364598 lt!364585 lt!364611 lt!364596))))

(assert (=> b!227807 call!3864))

(declare-fun b!227808 () Bool)

(declare-datatypes ((tuple2!19600 0))(
  ( (tuple2!19601 (_1!10665 BitStream!9154) (_2!10665 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!9154) tuple2!19600)

(assert (=> b!227808 (= e!155995 (= (select (arr!6007 (_3!862 lt!364607)) (bvadd #b00000000000000000000000000000001 i!761)) (_2!10665 (readBytePure!0 (_2!10659 lt!364344)))))))

(assert (=> b!227808 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!5029 (_3!862 lt!364607))))))

(assert (= (and d!77241 c!11215) b!227804))

(assert (= (and d!77241 (not c!11215)) b!227807))

(assert (= (or b!227804 b!227807) bm!3859))

(assert (= (or b!227804 b!227807) bm!3860))

(assert (= (or b!227804 b!227807) bm!3861))

(assert (= (and d!77241 res!191107) b!227806))

(assert (= (and b!227806 res!191108) b!227805))

(assert (= (and d!77241 (not res!191109)) b!227808))

(declare-fun m!350631 () Bool)

(assert (=> b!227805 m!350631))

(declare-fun m!350633 () Bool)

(assert (=> b!227808 m!350633))

(declare-fun m!350635 () Bool)

(assert (=> b!227808 m!350635))

(declare-fun m!350637 () Bool)

(assert (=> d!77241 m!350637))

(assert (=> d!77241 m!350467))

(declare-fun m!350639 () Bool)

(assert (=> bm!3860 m!350639))

(declare-fun m!350641 () Bool)

(assert (=> bm!3861 m!350641))

(declare-fun m!350643 () Bool)

(assert (=> b!227804 m!350643))

(declare-fun m!350645 () Bool)

(assert (=> b!227804 m!350645))

(declare-fun m!350647 () Bool)

(assert (=> b!227804 m!350647))

(declare-fun m!350649 () Bool)

(assert (=> b!227804 m!350649))

(declare-fun m!350651 () Bool)

(assert (=> b!227804 m!350651))

(declare-fun m!350653 () Bool)

(assert (=> b!227804 m!350653))

(declare-fun m!350655 () Bool)

(assert (=> b!227804 m!350655))

(declare-fun m!350657 () Bool)

(assert (=> b!227804 m!350657))

(assert (=> b!227804 m!350467))

(declare-fun m!350659 () Bool)

(assert (=> b!227804 m!350659))

(declare-fun m!350661 () Bool)

(assert (=> b!227804 m!350661))

(declare-fun m!350663 () Bool)

(assert (=> b!227804 m!350663))

(declare-fun m!350665 () Bool)

(assert (=> b!227804 m!350665))

(declare-fun m!350667 () Bool)

(assert (=> b!227807 m!350667))

(declare-fun m!350669 () Bool)

(assert (=> b!227807 m!350669))

(declare-fun m!350671 () Bool)

(assert (=> bm!3859 m!350671))

(assert (=> b!227707 d!77241))

(declare-fun d!77281 () Bool)

(declare-fun e!155998 () Bool)

(assert (=> d!77281 e!155998))

(declare-fun res!191115 () Bool)

(assert (=> d!77281 (=> (not res!191115) (not e!155998))))

(declare-fun lt!364632 () (_ BitVec 64))

(declare-fun lt!364630 () (_ BitVec 64))

(declare-fun lt!364629 () (_ BitVec 64))

(assert (=> d!77281 (= res!191115 (= lt!364629 (bvsub lt!364630 lt!364632)))))

(assert (=> d!77281 (or (= (bvand lt!364630 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!364632 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!364630 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!364630 lt!364632) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!77281 (= lt!364632 (remainingBits!0 ((_ sign_extend 32) (size!5029 (buf!5570 (_2!10659 lt!364344)))) ((_ sign_extend 32) (currentByte!10414 (_2!10659 lt!364344))) ((_ sign_extend 32) (currentBit!10409 (_2!10659 lt!364344)))))))

(declare-fun lt!364631 () (_ BitVec 64))

(declare-fun lt!364628 () (_ BitVec 64))

(assert (=> d!77281 (= lt!364630 (bvmul lt!364631 lt!364628))))

(assert (=> d!77281 (or (= lt!364631 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!364628 (bvsdiv (bvmul lt!364631 lt!364628) lt!364631)))))

(assert (=> d!77281 (= lt!364628 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77281 (= lt!364631 ((_ sign_extend 32) (size!5029 (buf!5570 (_2!10659 lt!364344)))))))

(assert (=> d!77281 (= lt!364629 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10414 (_2!10659 lt!364344))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10409 (_2!10659 lt!364344)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!77281 (invariant!0 (currentBit!10409 (_2!10659 lt!364344)) (currentByte!10414 (_2!10659 lt!364344)) (size!5029 (buf!5570 (_2!10659 lt!364344))))))

(assert (=> d!77281 (= (bitIndex!0 (size!5029 (buf!5570 (_2!10659 lt!364344))) (currentByte!10414 (_2!10659 lt!364344)) (currentBit!10409 (_2!10659 lt!364344))) lt!364629)))

(declare-fun b!227813 () Bool)

(declare-fun res!191114 () Bool)

(assert (=> b!227813 (=> (not res!191114) (not e!155998))))

(assert (=> b!227813 (= res!191114 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!364629))))

(declare-fun b!227814 () Bool)

(declare-fun lt!364627 () (_ BitVec 64))

(assert (=> b!227814 (= e!155998 (bvsle lt!364629 (bvmul lt!364627 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!227814 (or (= lt!364627 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!364627 #b0000000000000000000000000000000000000000000000000000000000001000) lt!364627)))))

(assert (=> b!227814 (= lt!364627 ((_ sign_extend 32) (size!5029 (buf!5570 (_2!10659 lt!364344)))))))

(assert (= (and d!77281 res!191115) b!227813))

(assert (= (and b!227813 res!191114) b!227814))

(declare-fun m!350673 () Bool)

(assert (=> d!77281 m!350673))

(declare-fun m!350675 () Bool)

(assert (=> d!77281 m!350675))

(assert (=> b!227707 d!77281))

(declare-fun d!77283 () Bool)

(declare-fun lt!364679 () (_ BitVec 8))

(declare-fun lt!364681 () (_ BitVec 8))

(assert (=> d!77283 (= lt!364679 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!6007 (buf!5570 thiss!1870)) (currentByte!10414 thiss!1870))) ((_ sign_extend 24) lt!364681))))))

(assert (=> d!77283 (= lt!364681 ((_ extract 7 0) (currentBit!10409 thiss!1870)))))

(declare-fun e!156006 () Bool)

(assert (=> d!77283 e!156006))

(declare-fun res!191122 () Bool)

(assert (=> d!77283 (=> (not res!191122) (not e!156006))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!77283 (= res!191122 (validate_offset_bits!1 ((_ sign_extend 32) (size!5029 (buf!5570 thiss!1870))) ((_ sign_extend 32) (currentByte!10414 thiss!1870)) ((_ sign_extend 32) (currentBit!10409 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!19604 0))(
  ( (tuple2!19605 (_1!10667 Unit!17032) (_2!10667 (_ BitVec 8))) )
))
(declare-fun Unit!17057 () Unit!17032)

(declare-fun Unit!17058 () Unit!17032)

(assert (=> d!77283 (= (readByte!0 thiss!1870) (tuple2!19593 (_2!10667 (ite (bvsgt ((_ sign_extend 24) lt!364681) #b00000000000000000000000000000000) (tuple2!19605 Unit!17057 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!364679) (bvlshr (bvand ((_ sign_extend 24) (select (arr!6007 (buf!5570 thiss!1870)) (bvadd (currentByte!10414 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!364681)))))))) (tuple2!19605 Unit!17058 lt!364679))) (BitStream!9155 (buf!5570 thiss!1870) (bvadd (currentByte!10414 thiss!1870) #b00000000000000000000000000000001) (currentBit!10409 thiss!1870))))))

(declare-fun b!227823 () Bool)

(declare-fun e!156005 () Bool)

(assert (=> b!227823 (= e!156006 e!156005)))

(declare-fun res!191121 () Bool)

(assert (=> b!227823 (=> (not res!191121) (not e!156005))))

(declare-fun lt!364680 () tuple2!19592)

(assert (=> b!227823 (= res!191121 (= (buf!5570 (_2!10659 lt!364680)) (buf!5570 thiss!1870)))))

(declare-fun lt!364676 () (_ BitVec 8))

(declare-fun lt!364675 () (_ BitVec 8))

(declare-fun Unit!17059 () Unit!17032)

(declare-fun Unit!17061 () Unit!17032)

(assert (=> b!227823 (= lt!364680 (tuple2!19593 (_2!10667 (ite (bvsgt ((_ sign_extend 24) lt!364675) #b00000000000000000000000000000000) (tuple2!19605 Unit!17059 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!364676) (bvlshr (bvand ((_ sign_extend 24) (select (arr!6007 (buf!5570 thiss!1870)) (bvadd (currentByte!10414 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!364675)))))))) (tuple2!19605 Unit!17061 lt!364676))) (BitStream!9155 (buf!5570 thiss!1870) (bvadd (currentByte!10414 thiss!1870) #b00000000000000000000000000000001) (currentBit!10409 thiss!1870))))))

(assert (=> b!227823 (= lt!364676 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!6007 (buf!5570 thiss!1870)) (currentByte!10414 thiss!1870))) ((_ sign_extend 24) lt!364675))))))

(assert (=> b!227823 (= lt!364675 ((_ extract 7 0) (currentBit!10409 thiss!1870)))))

(declare-fun b!227824 () Bool)

(declare-fun lt!364677 () (_ BitVec 64))

(declare-fun lt!364678 () (_ BitVec 64))

(assert (=> b!227824 (= e!156005 (= (bitIndex!0 (size!5029 (buf!5570 (_2!10659 lt!364680))) (currentByte!10414 (_2!10659 lt!364680)) (currentBit!10409 (_2!10659 lt!364680))) (bvadd lt!364677 lt!364678)))))

(assert (=> b!227824 (or (not (= (bvand lt!364677 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!364678 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!364677 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!364677 lt!364678) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!227824 (= lt!364678 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!227824 (= lt!364677 (bitIndex!0 (size!5029 (buf!5570 thiss!1870)) (currentByte!10414 thiss!1870) (currentBit!10409 thiss!1870)))))

(assert (= (and d!77283 res!191122) b!227823))

(assert (= (and b!227823 res!191121) b!227824))

(declare-fun m!350677 () Bool)

(assert (=> d!77283 m!350677))

(declare-fun m!350679 () Bool)

(assert (=> d!77283 m!350679))

(declare-fun m!350681 () Bool)

(assert (=> d!77283 m!350681))

(assert (=> b!227823 m!350681))

(assert (=> b!227823 m!350677))

(declare-fun m!350683 () Bool)

(assert (=> b!227824 m!350683))

(assert (=> b!227824 m!350481))

(assert (=> b!227707 d!77283))

(declare-fun d!77285 () Bool)

(declare-fun e!156007 () Bool)

(assert (=> d!77285 e!156007))

(declare-fun res!191124 () Bool)

(assert (=> d!77285 (=> (not res!191124) (not e!156007))))

(declare-fun lt!364723 () (_ BitVec 64))

(declare-fun lt!364721 () (_ BitVec 64))

(declare-fun lt!364720 () (_ BitVec 64))

(assert (=> d!77285 (= res!191124 (= lt!364720 (bvsub lt!364721 lt!364723)))))

(assert (=> d!77285 (or (= (bvand lt!364721 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!364723 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!364721 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!364721 lt!364723) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77285 (= lt!364723 (remainingBits!0 ((_ sign_extend 32) (size!5029 (buf!5570 (_2!10658 lt!364339)))) ((_ sign_extend 32) (currentByte!10414 (_2!10658 lt!364339))) ((_ sign_extend 32) (currentBit!10409 (_2!10658 lt!364339)))))))

(declare-fun lt!364722 () (_ BitVec 64))

(declare-fun lt!364719 () (_ BitVec 64))

(assert (=> d!77285 (= lt!364721 (bvmul lt!364722 lt!364719))))

(assert (=> d!77285 (or (= lt!364722 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!364719 (bvsdiv (bvmul lt!364722 lt!364719) lt!364722)))))

(assert (=> d!77285 (= lt!364719 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77285 (= lt!364722 ((_ sign_extend 32) (size!5029 (buf!5570 (_2!10658 lt!364339)))))))

(assert (=> d!77285 (= lt!364720 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10414 (_2!10658 lt!364339))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10409 (_2!10658 lt!364339)))))))

(assert (=> d!77285 (invariant!0 (currentBit!10409 (_2!10658 lt!364339)) (currentByte!10414 (_2!10658 lt!364339)) (size!5029 (buf!5570 (_2!10658 lt!364339))))))

(assert (=> d!77285 (= (bitIndex!0 (size!5029 (buf!5570 (_2!10658 lt!364339))) (currentByte!10414 (_2!10658 lt!364339)) (currentBit!10409 (_2!10658 lt!364339))) lt!364720)))

(declare-fun b!227825 () Bool)

(declare-fun res!191123 () Bool)

(assert (=> b!227825 (=> (not res!191123) (not e!156007))))

(assert (=> b!227825 (= res!191123 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!364720))))

(declare-fun b!227826 () Bool)

(declare-fun lt!364718 () (_ BitVec 64))

(assert (=> b!227826 (= e!156007 (bvsle lt!364720 (bvmul lt!364718 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!227826 (or (= lt!364718 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!364718 #b0000000000000000000000000000000000000000000000000000000000001000) lt!364718)))))

(assert (=> b!227826 (= lt!364718 ((_ sign_extend 32) (size!5029 (buf!5570 (_2!10658 lt!364339)))))))

(assert (= (and d!77285 res!191124) b!227825))

(assert (= (and b!227825 res!191123) b!227826))

(declare-fun m!350685 () Bool)

(assert (=> d!77285 m!350685))

(declare-fun m!350687 () Bool)

(assert (=> d!77285 m!350687))

(assert (=> b!227707 d!77285))

(declare-fun d!77287 () Bool)

(declare-fun e!156016 () Bool)

(assert (=> d!77287 e!156016))

(declare-fun res!191133 () Bool)

(assert (=> d!77287 (=> (not res!191133) (not e!156016))))

(assert (=> d!77287 (= res!191133 (and (or (let ((rhs!3992 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3992 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3992) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!77288 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!77288 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!77288 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3991 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3991 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3991) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!364762 () Unit!17032)

(declare-fun choose!57 (BitStream!9154 BitStream!9154 (_ BitVec 64) (_ BitVec 32)) Unit!17032)

(assert (=> d!77287 (= lt!364762 (choose!57 thiss!1870 (_2!10659 lt!364344) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> d!77287 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10659 lt!364344) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)) lt!364762)))

(declare-fun b!227839 () Bool)

(declare-fun lt!364758 () (_ BitVec 32))

(assert (=> b!227839 (= e!156016 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5029 (buf!5570 (_2!10659 lt!364344)))) ((_ sign_extend 32) (currentByte!10414 (_2!10659 lt!364344))) ((_ sign_extend 32) (currentBit!10409 (_2!10659 lt!364344))) (bvsub (bvsub to!496 i!761) lt!364758)))))

(assert (=> b!227839 (or (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand lt!364758 #b10000000000000000000000000000000)) (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!496 i!761) lt!364758) #b10000000000000000000000000000000)))))

(declare-fun lt!364759 () (_ BitVec 64))

(assert (=> b!227839 (= lt!364758 ((_ extract 31 0) lt!364759))))

(assert (=> b!227839 (and (bvslt lt!364759 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!364759 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!227839 (= lt!364759 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!77287 res!191133) b!227839))

(declare-fun m!350689 () Bool)

(assert (=> d!77287 m!350689))

(declare-fun m!350691 () Bool)

(assert (=> b!227839 m!350691))

(assert (=> b!227707 d!77287))

(declare-fun d!77290 () Bool)

(assert (=> d!77290 (arrayRangesEq!865 arr!308 (_3!862 lt!364339) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!364843 () Unit!17032)

(declare-fun choose!319 (array!11462 array!11462 array!11462 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17032)

(assert (=> d!77290 (= lt!364843 (choose!319 arr!308 lt!364345 (_3!862 lt!364339) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!77290 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!77290 (= (arrayRangesEqTransitive!288 arr!308 lt!364345 (_3!862 lt!364339) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)) lt!364843)))

(declare-fun bs!18897 () Bool)

(assert (= bs!18897 d!77290))

(assert (=> bs!18897 m!350471))

(declare-fun m!350693 () Bool)

(assert (=> bs!18897 m!350693))

(assert (=> b!227707 d!77290))

(declare-fun d!77292 () Bool)

(declare-fun e!156028 () Bool)

(assert (=> d!77292 e!156028))

(declare-fun res!191147 () Bool)

(assert (=> d!77292 (=> (not res!191147) (not e!156028))))

(assert (=> d!77292 (= res!191147 (and (bvsge i!761 #b00000000000000000000000000000000) (bvslt i!761 (size!5029 arr!308))))))

(declare-fun lt!364854 () Unit!17032)

(declare-fun choose!320 (array!11462 (_ BitVec 32) (_ BitVec 8)) Unit!17032)

(assert (=> d!77292 (= lt!364854 (choose!320 arr!308 i!761 (_1!10659 lt!364344)))))

(assert (=> d!77292 (and (bvsle #b00000000000000000000000000000000 i!761) (bvslt i!761 (size!5029 arr!308)))))

(assert (=> d!77292 (= (arrayUpdatedAtPrefixLemma!424 arr!308 i!761 (_1!10659 lt!364344)) lt!364854)))

(declare-fun b!227855 () Bool)

(assert (=> b!227855 (= e!156028 (arrayRangesEq!865 arr!308 (array!11463 (store (arr!6007 arr!308) i!761 (_1!10659 lt!364344)) (size!5029 arr!308)) #b00000000000000000000000000000000 i!761))))

(assert (= (and d!77292 res!191147) b!227855))

(declare-fun m!350739 () Bool)

(assert (=> d!77292 m!350739))

(assert (=> b!227855 m!350473))

(declare-fun m!350741 () Bool)

(assert (=> b!227855 m!350741))

(assert (=> b!227707 d!77292))

(declare-fun d!77298 () Bool)

(assert (=> d!77298 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5029 (buf!5570 (_2!10659 lt!364344)))) ((_ sign_extend 32) (currentByte!10414 (_2!10659 lt!364344))) ((_ sign_extend 32) (currentBit!10409 (_2!10659 lt!364344))) lt!364343) (bvsle ((_ sign_extend 32) lt!364343) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5029 (buf!5570 (_2!10659 lt!364344)))) ((_ sign_extend 32) (currentByte!10414 (_2!10659 lt!364344))) ((_ sign_extend 32) (currentBit!10409 (_2!10659 lt!364344)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18898 () Bool)

(assert (= bs!18898 d!77298))

(assert (=> bs!18898 m!350673))

(assert (=> b!227707 d!77298))

(declare-fun d!77300 () Bool)

(declare-fun e!156032 () Bool)

(assert (=> d!77300 e!156032))

(declare-fun res!191152 () Bool)

(assert (=> d!77300 (=> (not res!191152) (not e!156032))))

(declare-fun lt!364861 () (_ BitVec 64))

(declare-fun lt!364860 () (_ BitVec 64))

(declare-fun lt!364863 () (_ BitVec 64))

(assert (=> d!77300 (= res!191152 (= lt!364860 (bvsub lt!364861 lt!364863)))))

(assert (=> d!77300 (or (= (bvand lt!364861 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!364863 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!364861 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!364861 lt!364863) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77300 (= lt!364863 (remainingBits!0 ((_ sign_extend 32) (size!5029 (buf!5570 thiss!1870))) ((_ sign_extend 32) (currentByte!10414 thiss!1870)) ((_ sign_extend 32) (currentBit!10409 thiss!1870))))))

(declare-fun lt!364862 () (_ BitVec 64))

(declare-fun lt!364859 () (_ BitVec 64))

(assert (=> d!77300 (= lt!364861 (bvmul lt!364862 lt!364859))))

(assert (=> d!77300 (or (= lt!364862 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!364859 (bvsdiv (bvmul lt!364862 lt!364859) lt!364862)))))

(assert (=> d!77300 (= lt!364859 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77300 (= lt!364862 ((_ sign_extend 32) (size!5029 (buf!5570 thiss!1870))))))

(assert (=> d!77300 (= lt!364860 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10414 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10409 thiss!1870))))))

(assert (=> d!77300 (invariant!0 (currentBit!10409 thiss!1870) (currentByte!10414 thiss!1870) (size!5029 (buf!5570 thiss!1870)))))

(assert (=> d!77300 (= (bitIndex!0 (size!5029 (buf!5570 thiss!1870)) (currentByte!10414 thiss!1870) (currentBit!10409 thiss!1870)) lt!364860)))

(declare-fun b!227859 () Bool)

(declare-fun res!191151 () Bool)

(assert (=> b!227859 (=> (not res!191151) (not e!156032))))

(assert (=> b!227859 (= res!191151 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!364860))))

(declare-fun b!227860 () Bool)

(declare-fun lt!364858 () (_ BitVec 64))

(assert (=> b!227860 (= e!156032 (bvsle lt!364860 (bvmul lt!364858 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!227860 (or (= lt!364858 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!364858 #b0000000000000000000000000000000000000000000000000000000000001000) lt!364858)))))

(assert (=> b!227860 (= lt!364858 ((_ sign_extend 32) (size!5029 (buf!5570 thiss!1870))))))

(assert (= (and d!77300 res!191152) b!227859))

(assert (= (and b!227859 res!191151) b!227860))

(declare-fun m!350747 () Bool)

(assert (=> d!77300 m!350747))

(declare-fun m!350749 () Bool)

(assert (=> d!77300 m!350749))

(assert (=> b!227707 d!77300))

(declare-fun d!77304 () Bool)

(declare-fun res!191155 () Bool)

(declare-fun e!156034 () Bool)

(assert (=> d!77304 (=> res!191155 e!156034)))

(assert (=> d!77304 (= res!191155 (= #b00000000000000000000000000000000 i!761))))

(assert (=> d!77304 (= (arrayRangesEq!865 arr!308 lt!364345 #b00000000000000000000000000000000 i!761) e!156034)))

(declare-fun b!227863 () Bool)

(declare-fun e!156035 () Bool)

(assert (=> b!227863 (= e!156034 e!156035)))

(declare-fun res!191156 () Bool)

(assert (=> b!227863 (=> (not res!191156) (not e!156035))))

(assert (=> b!227863 (= res!191156 (= (select (arr!6007 arr!308) #b00000000000000000000000000000000) (select (arr!6007 lt!364345) #b00000000000000000000000000000000)))))

(declare-fun b!227864 () Bool)

(assert (=> b!227864 (= e!156035 (arrayRangesEq!865 arr!308 lt!364345 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) i!761))))

(assert (= (and d!77304 (not res!191155)) b!227863))

(assert (= (and b!227863 res!191156) b!227864))

(assert (=> b!227863 m!350571))

(assert (=> b!227863 m!350565))

(declare-fun m!350751 () Bool)

(assert (=> b!227864 m!350751))

(assert (=> b!227707 d!77304))

(declare-fun d!77306 () Bool)

(assert (=> d!77306 (= (array_inv!4770 arr!308) (bvsge (size!5029 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!47846 d!77306))

(declare-fun d!77308 () Bool)

(assert (=> d!77308 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10409 thiss!1870) (currentByte!10414 thiss!1870) (size!5029 (buf!5570 thiss!1870))))))

(declare-fun bs!18900 () Bool)

(assert (= bs!18900 d!77308))

(assert (=> bs!18900 m!350749))

(assert (=> start!47846 d!77308))

(declare-fun d!77314 () Bool)

(assert (=> d!77314 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5029 (buf!5570 thiss!1870))) ((_ sign_extend 32) (currentByte!10414 thiss!1870)) ((_ sign_extend 32) (currentBit!10409 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5029 (buf!5570 thiss!1870))) ((_ sign_extend 32) (currentByte!10414 thiss!1870)) ((_ sign_extend 32) (currentBit!10409 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18901 () Bool)

(assert (= bs!18901 d!77314))

(assert (=> bs!18901 m!350747))

(assert (=> b!227706 d!77314))

(push 1)

(assert (not b!227807))

(assert (not d!77283))

(assert (not bm!3860))

(assert (not b!227805))

(assert (not d!77314))

(assert (not d!77287))

(assert (not d!77298))

(assert (not d!77290))

(assert (not b!227808))

(assert (not d!77241))

(assert (not d!77292))

(assert (not bm!3861))

(assert (not bm!3859))

(assert (not d!77308))

(assert (not d!77285))

(assert (not d!77300))

(assert (not d!77281))

(assert (not b!227855))

(assert (not b!227839))

(assert (not b!227824))

(assert (not b!227864))

(assert (not b!227751))

(assert (not b!227804))

(assert (not b!227749))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

