; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31168 () Bool)

(assert start!31168)

(declare-fun b!157115 () Bool)

(declare-fun res!131310 () Bool)

(declare-fun e!106337 () Bool)

(assert (=> b!157115 (=> (not res!131310) (not e!106337))))

(declare-datatypes ((array!7233 0))(
  ( (array!7234 (arr!4147 (Array (_ BitVec 32) (_ BitVec 8))) (size!3270 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5746 0))(
  ( (BitStream!5747 (buf!3747 array!7233) (currentByte!6883 (_ BitVec 32)) (currentBit!6878 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5746)

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!157115 (= res!131310 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3270 (buf!3747 bs!65))) ((_ sign_extend 32) (currentByte!6883 bs!65)) ((_ sign_extend 32) (currentBit!6878 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!157116 () Bool)

(declare-fun e!106334 () Bool)

(declare-fun e!106335 () Bool)

(assert (=> b!157116 (= e!106334 (not e!106335))))

(declare-fun res!131309 () Bool)

(assert (=> b!157116 (=> res!131309 e!106335)))

(assert (=> b!157116 (= res!131309 (or (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)) (bvsge (bvadd #b00000000000000000000000000000001 from!240) to!236)))))

(declare-fun lt!246423 () (_ BitVec 64))

(declare-fun lt!246430 () BitStream!5746)

(declare-fun lt!246427 () (_ BitVec 64))

(assert (=> b!157116 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3270 (buf!3747 lt!246430))) lt!246427 lt!246423 (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001))))

(assert (=> b!157116 (= lt!246423 ((_ sign_extend 32) (currentBit!6878 lt!246430)))))

(assert (=> b!157116 (= lt!246427 ((_ sign_extend 32) (currentByte!6883 lt!246430)))))

(declare-datatypes ((Unit!10261 0))(
  ( (Unit!10262) )
))
(declare-fun lt!246429 () Unit!10261)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5746 BitStream!5746 (_ BitVec 64) (_ BitVec 32)) Unit!10261)

(assert (=> b!157116 (= lt!246429 (validateOffsetBytesFromBitIndexLemma!0 bs!65 lt!246430 #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!236 from!240)))))

(declare-datatypes ((tuple2!14134 0))(
  ( (tuple2!14135 (_1!7514 BitStream!5746) (_2!7514 (_ BitVec 8))) )
))
(declare-fun lt!246432 () tuple2!14134)

(declare-fun readBytePure!0 (BitStream!5746) tuple2!14134)

(assert (=> b!157116 (= lt!246432 (readBytePure!0 lt!246430))))

(declare-fun b!157117 () Bool)

(declare-fun e!106336 () Bool)

(declare-fun array_inv!3033 (array!7233) Bool)

(assert (=> b!157117 (= e!106336 (array_inv!3033 (buf!3747 bs!65)))))

(declare-fun res!131308 () Bool)

(assert (=> start!31168 (=> (not res!131308) (not e!106337))))

(declare-fun arr!153 () array!7233)

(assert (=> start!31168 (= res!131308 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3270 arr!153))))))

(assert (=> start!31168 e!106337))

(assert (=> start!31168 true))

(assert (=> start!31168 (array_inv!3033 arr!153)))

(declare-fun inv!12 (BitStream!5746) Bool)

(assert (=> start!31168 (and (inv!12 bs!65) e!106336)))

(declare-fun b!157118 () Bool)

(assert (=> b!157118 (= e!106337 e!106334)))

(declare-fun res!131311 () Bool)

(assert (=> b!157118 (=> (not res!131311) (not e!106334))))

(assert (=> b!157118 (= res!131311 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-fun lt!246431 () array!7233)

(declare-datatypes ((tuple2!14136 0))(
  ( (tuple2!14137 (_1!7515 BitStream!5746) (_2!7515 array!7233)) )
))
(declare-fun lt!246428 () tuple2!14136)

(declare-fun readByteArrayLoopPure!0 (BitStream!5746 array!7233 (_ BitVec 32) (_ BitVec 32)) tuple2!14136)

(assert (=> b!157118 (= lt!246428 (readByteArrayLoopPure!0 lt!246430 lt!246431 (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> b!157118 (= lt!246431 (array!7234 (store (arr!4147 arr!153) from!240 (_2!7514 (readBytePure!0 bs!65))) (size!3270 arr!153)))))

(declare-fun withMovedByteIndex!0 (BitStream!5746 (_ BitVec 32)) BitStream!5746)

(assert (=> b!157118 (= lt!246430 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!246424 () tuple2!14136)

(assert (=> b!157118 (= lt!246424 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!157119 () Bool)

(declare-fun res!131312 () Bool)

(assert (=> b!157119 (=> res!131312 e!106335)))

(assert (=> b!157119 (= res!131312 (not (validate_offset_bytes!0 ((_ sign_extend 32) (size!3270 (buf!3747 lt!246430))) lt!246427 lt!246423 (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)))))))

(declare-fun b!157120 () Bool)

(assert (=> b!157120 (= e!106335 (or (bvsgt #b00000000000000000000000000000000 to!236) (bvsgt (size!3270 (_2!7515 lt!246424)) (size!3270 (_2!7515 lt!246428))) (bvsle to!236 (size!3270 (_2!7515 lt!246424)))))))

(declare-fun lt!246433 () tuple2!14136)

(declare-fun arrayRangesEq!434 (array!7233 array!7233 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!157120 (arrayRangesEq!434 (_2!7515 lt!246428) (_2!7515 lt!246433) #b00000000000000000000000000000000 to!236)))

(declare-fun lt!246425 () Unit!10261)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!5746 array!7233 (_ BitVec 32) (_ BitVec 32)) Unit!10261)

(assert (=> b!157120 (= lt!246425 (readByteArrayLoopArrayPrefixLemma!0 lt!246430 lt!246431 (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> b!157120 (= lt!246433 (readByteArrayLoopPure!0 (withMovedByteIndex!0 lt!246430 #b00000000000000000000000000000001) (array!7234 (store (store (arr!4147 arr!153) from!240 (_2!7514 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7514 lt!246432)) (size!3270 arr!153)) (bvadd #b00000000000000000000000000000010 from!240) to!236))))

(declare-fun lt!246426 () (Array (_ BitVec 32) (_ BitVec 8)))

(assert (=> b!157120 (= lt!246426 (store (arr!4147 arr!153) from!240 (_2!7514 (readBytePure!0 bs!65))))))

(assert (= (and start!31168 res!131308) b!157115))

(assert (= (and b!157115 res!131310) b!157118))

(assert (= (and b!157118 res!131311) b!157116))

(assert (= (and b!157116 (not res!131309)) b!157119))

(assert (= (and b!157119 (not res!131312)) b!157120))

(assert (= start!31168 b!157117))

(declare-fun m!245397 () Bool)

(assert (=> b!157119 m!245397))

(declare-fun m!245399 () Bool)

(assert (=> start!31168 m!245399))

(declare-fun m!245401 () Bool)

(assert (=> start!31168 m!245401))

(declare-fun m!245403 () Bool)

(assert (=> b!157117 m!245403))

(declare-fun m!245405 () Bool)

(assert (=> b!157120 m!245405))

(declare-fun m!245407 () Bool)

(assert (=> b!157120 m!245407))

(declare-fun m!245409 () Bool)

(assert (=> b!157120 m!245409))

(declare-fun m!245411 () Bool)

(assert (=> b!157120 m!245411))

(assert (=> b!157120 m!245405))

(declare-fun m!245413 () Bool)

(assert (=> b!157120 m!245413))

(declare-fun m!245415 () Bool)

(assert (=> b!157120 m!245415))

(declare-fun m!245417 () Bool)

(assert (=> b!157120 m!245417))

(declare-fun m!245419 () Bool)

(assert (=> b!157115 m!245419))

(declare-fun m!245421 () Bool)

(assert (=> b!157116 m!245421))

(declare-fun m!245423 () Bool)

(assert (=> b!157116 m!245423))

(declare-fun m!245425 () Bool)

(assert (=> b!157116 m!245425))

(assert (=> b!157118 m!245409))

(declare-fun m!245427 () Bool)

(assert (=> b!157118 m!245427))

(assert (=> b!157118 m!245411))

(declare-fun m!245429 () Bool)

(assert (=> b!157118 m!245429))

(declare-fun m!245431 () Bool)

(assert (=> b!157118 m!245431))

(push 1)

(assert (not start!31168))

(assert (not b!157119))

(assert (not b!157117))

(assert (not b!157120))

(assert (not b!157115))

(assert (not b!157118))

(assert (not b!157116))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!52335 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!52335 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3270 (buf!3747 lt!246430))) lt!246427 lt!246423 (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3270 (buf!3747 lt!246430))) lt!246427 lt!246423) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12846 () Bool)

(assert (= bs!12846 d!52335))

(declare-fun m!245505 () Bool)

(assert (=> bs!12846 m!245505))

(assert (=> b!157116 d!52335))

(declare-fun d!52337 () Bool)

(declare-fun e!106376 () Bool)

(assert (=> d!52337 e!106376))

(declare-fun res!131345 () Bool)

(assert (=> d!52337 (=> (not res!131345) (not e!106376))))

(assert (=> d!52337 (= res!131345 (and (or (let ((rhs!3441 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3441 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3441) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!52338 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!52338 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!52338 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3440 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3440 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3440) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!246506 () Unit!10261)

(declare-fun choose!57 (BitStream!5746 BitStream!5746 (_ BitVec 64) (_ BitVec 32)) Unit!10261)

(assert (=> d!52337 (= lt!246506 (choose!57 bs!65 lt!246430 #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!236 from!240)))))

(assert (=> d!52337 (= (validateOffsetBytesFromBitIndexLemma!0 bs!65 lt!246430 #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!236 from!240)) lt!246506)))

(declare-fun b!157159 () Bool)

(declare-fun lt!246507 () (_ BitVec 32))

(assert (=> b!157159 (= e!106376 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3270 (buf!3747 lt!246430))) ((_ sign_extend 32) (currentByte!6883 lt!246430)) ((_ sign_extend 32) (currentBit!6878 lt!246430)) (bvsub (bvsub to!236 from!240) lt!246507)))))

(assert (=> b!157159 (or (= (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000) (bvand lt!246507 #b10000000000000000000000000000000)) (= (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!236 from!240) lt!246507) #b10000000000000000000000000000000)))))

(declare-fun lt!246508 () (_ BitVec 64))

(assert (=> b!157159 (= lt!246507 ((_ extract 31 0) lt!246508))))

(assert (=> b!157159 (and (bvslt lt!246508 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!246508 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!157159 (= lt!246508 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!52337 res!131345) b!157159))

(declare-fun m!245509 () Bool)

(assert (=> d!52337 m!245509))

(declare-fun m!245511 () Bool)

(assert (=> b!157159 m!245511))

(assert (=> b!157116 d!52337))

(declare-fun d!52347 () Bool)

(declare-datatypes ((tuple2!14146 0))(
  ( (tuple2!14147 (_1!7520 (_ BitVec 8)) (_2!7520 BitStream!5746)) )
))
(declare-fun lt!246511 () tuple2!14146)

(declare-fun readByte!0 (BitStream!5746) tuple2!14146)

(assert (=> d!52347 (= lt!246511 (readByte!0 lt!246430))))

(assert (=> d!52347 (= (readBytePure!0 lt!246430) (tuple2!14135 (_2!7520 lt!246511) (_1!7520 lt!246511)))))

(declare-fun bs!12849 () Bool)

(assert (= bs!12849 d!52347))

(declare-fun m!245513 () Bool)

(assert (=> bs!12849 m!245513))

(assert (=> b!157116 d!52347))

(declare-fun d!52349 () Bool)

(declare-fun lt!246512 () tuple2!14146)

(assert (=> d!52349 (= lt!246512 (readByte!0 bs!65))))

(assert (=> d!52349 (= (readBytePure!0 bs!65) (tuple2!14135 (_2!7520 lt!246512) (_1!7520 lt!246512)))))

(declare-fun bs!12850 () Bool)

(assert (= bs!12850 d!52349))

(declare-fun m!245515 () Bool)

(assert (=> bs!12850 m!245515))

(assert (=> b!157120 d!52349))

(declare-fun d!52351 () Bool)

(declare-fun res!131352 () Bool)

(declare-fun e!106383 () Bool)

(assert (=> d!52351 (=> res!131352 e!106383)))

(assert (=> d!52351 (= res!131352 (= #b00000000000000000000000000000000 to!236))))

(assert (=> d!52351 (= (arrayRangesEq!434 (_2!7515 lt!246428) (_2!7515 lt!246433) #b00000000000000000000000000000000 to!236) e!106383)))

(declare-fun b!157166 () Bool)

(declare-fun e!106384 () Bool)

(assert (=> b!157166 (= e!106383 e!106384)))

(declare-fun res!131353 () Bool)

(assert (=> b!157166 (=> (not res!131353) (not e!106384))))

(assert (=> b!157166 (= res!131353 (= (select (arr!4147 (_2!7515 lt!246428)) #b00000000000000000000000000000000) (select (arr!4147 (_2!7515 lt!246433)) #b00000000000000000000000000000000)))))

(declare-fun b!157167 () Bool)

(assert (=> b!157167 (= e!106384 (arrayRangesEq!434 (_2!7515 lt!246428) (_2!7515 lt!246433) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!236))))

(assert (= (and d!52351 (not res!131352)) b!157166))

(assert (= (and b!157166 res!131353) b!157167))

(declare-fun m!245517 () Bool)

(assert (=> b!157166 m!245517))

(declare-fun m!245519 () Bool)

(assert (=> b!157166 m!245519))

(declare-fun m!245521 () Bool)

(assert (=> b!157167 m!245521))

(assert (=> b!157120 d!52351))

(declare-fun d!52353 () Bool)

(declare-datatypes ((tuple2!14148 0))(
  ( (tuple2!14149 (_1!7521 Unit!10261) (_2!7521 BitStream!5746)) )
))
(declare-fun moveByteIndex!0 (BitStream!5746 (_ BitVec 32)) tuple2!14148)

(assert (=> d!52353 (= (withMovedByteIndex!0 lt!246430 #b00000000000000000000000000000001) (_2!7521 (moveByteIndex!0 lt!246430 #b00000000000000000000000000000001)))))

(declare-fun bs!12851 () Bool)

(assert (= bs!12851 d!52353))

(declare-fun m!245523 () Bool)

(assert (=> bs!12851 m!245523))

(assert (=> b!157120 d!52353))

(declare-datatypes ((tuple3!660 0))(
  ( (tuple3!661 (_1!7522 Unit!10261) (_2!7522 BitStream!5746) (_3!447 array!7233)) )
))
(declare-fun lt!246527 () tuple3!660)

(declare-fun d!52355 () Bool)

(declare-fun readByteArrayLoop!0 (BitStream!5746 array!7233 (_ BitVec 32) (_ BitVec 32)) tuple3!660)

(assert (=> d!52355 (= lt!246527 (readByteArrayLoop!0 (withMovedByteIndex!0 lt!246430 #b00000000000000000000000000000001) (array!7234 (store (store (arr!4147 arr!153) from!240 (_2!7514 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7514 lt!246432)) (size!3270 arr!153)) (bvadd #b00000000000000000000000000000010 from!240) to!236))))

(assert (=> d!52355 (= (readByteArrayLoopPure!0 (withMovedByteIndex!0 lt!246430 #b00000000000000000000000000000001) (array!7234 (store (store (arr!4147 arr!153) from!240 (_2!7514 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7514 lt!246432)) (size!3270 arr!153)) (bvadd #b00000000000000000000000000000010 from!240) to!236) (tuple2!14137 (_2!7522 lt!246527) (_3!447 lt!246527)))))

(declare-fun bs!12853 () Bool)

(assert (= bs!12853 d!52355))

(assert (=> bs!12853 m!245405))

(declare-fun m!245531 () Bool)

(assert (=> bs!12853 m!245531))

(assert (=> b!157120 d!52355))

(declare-fun d!52361 () Bool)

(declare-fun lt!246541 () tuple2!14136)

(declare-fun lt!246543 () tuple2!14136)

(assert (=> d!52361 (arrayRangesEq!434 (_2!7515 lt!246541) (_2!7515 lt!246543) #b00000000000000000000000000000000 to!236)))

(declare-fun lt!246542 () BitStream!5746)

(declare-fun lt!246544 () Unit!10261)

(declare-fun choose!35 (BitStream!5746 array!7233 (_ BitVec 32) (_ BitVec 32) tuple2!14136 array!7233 BitStream!5746 tuple2!14136 array!7233) Unit!10261)

(assert (=> d!52361 (= lt!246544 (choose!35 lt!246430 lt!246431 (bvadd #b00000000000000000000000000000001 from!240) to!236 lt!246541 (_2!7515 lt!246541) lt!246542 lt!246543 (_2!7515 lt!246543)))))

(assert (=> d!52361 (= lt!246543 (readByteArrayLoopPure!0 lt!246542 (array!7234 (store (arr!4147 lt!246431) (bvadd #b00000000000000000000000000000001 from!240) (_2!7514 (readBytePure!0 lt!246430))) (size!3270 lt!246431)) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> d!52361 (= lt!246542 (withMovedByteIndex!0 lt!246430 #b00000000000000000000000000000001))))

(assert (=> d!52361 (= lt!246541 (readByteArrayLoopPure!0 lt!246430 lt!246431 (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!52361 (= (readByteArrayLoopArrayPrefixLemma!0 lt!246430 lt!246431 (bvadd #b00000000000000000000000000000001 from!240) to!236) lt!246544)))

(declare-fun bs!12861 () Bool)

(assert (= bs!12861 d!52361))

(assert (=> bs!12861 m!245425))

(declare-fun m!245551 () Bool)

(assert (=> bs!12861 m!245551))

(declare-fun m!245553 () Bool)

(assert (=> bs!12861 m!245553))

(declare-fun m!245555 () Bool)

(assert (=> bs!12861 m!245555))

(assert (=> bs!12861 m!245405))

(declare-fun m!245557 () Bool)

(assert (=> bs!12861 m!245557))

(assert (=> bs!12861 m!245429))

(assert (=> b!157120 d!52361))

(declare-fun d!52381 () Bool)

(assert (=> d!52381 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3270 (buf!3747 bs!65))) ((_ sign_extend 32) (currentByte!6883 bs!65)) ((_ sign_extend 32) (currentBit!6878 bs!65)) (bvsub to!236 from!240)) (bvsle ((_ sign_extend 32) (bvsub to!236 from!240)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3270 (buf!3747 bs!65))) ((_ sign_extend 32) (currentByte!6883 bs!65)) ((_ sign_extend 32) (currentBit!6878 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12862 () Bool)

(assert (= bs!12862 d!52381))

(declare-fun m!245559 () Bool)

(assert (=> bs!12862 m!245559))

(assert (=> b!157115 d!52381))

(declare-fun d!52383 () Bool)

(assert (=> d!52383 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3270 (buf!3747 lt!246430))) lt!246427 lt!246423 (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))) (bvsle ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3270 (buf!3747 lt!246430))) lt!246427 lt!246423) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12863 () Bool)

(assert (= bs!12863 d!52383))

(assert (=> bs!12863 m!245505))

(assert (=> b!157119 d!52383))

(declare-fun d!52385 () Bool)

(declare-fun lt!246545 () tuple3!660)

(assert (=> d!52385 (= lt!246545 (readByteArrayLoop!0 lt!246430 lt!246431 (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!52385 (= (readByteArrayLoopPure!0 lt!246430 lt!246431 (bvadd #b00000000000000000000000000000001 from!240) to!236) (tuple2!14137 (_2!7522 lt!246545) (_3!447 lt!246545)))))

(declare-fun bs!12864 () Bool)

(assert (= bs!12864 d!52385))

(declare-fun m!245561 () Bool)

(assert (=> bs!12864 m!245561))

(assert (=> b!157118 d!52385))

(assert (=> b!157118 d!52349))

(declare-fun d!52387 () Bool)

(assert (=> d!52387 (= (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (_2!7521 (moveByteIndex!0 bs!65 #b00000000000000000000000000000001)))))

(declare-fun bs!12865 () Bool)

(assert (= bs!12865 d!52387))

(declare-fun m!245563 () Bool)

(assert (=> bs!12865 m!245563))

(assert (=> b!157118 d!52387))

(declare-fun lt!246546 () tuple3!660)

(declare-fun d!52389 () Bool)

(assert (=> d!52389 (= lt!246546 (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236))))

(assert (=> d!52389 (= (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236) (tuple2!14137 (_2!7522 lt!246546) (_3!447 lt!246546)))))

(declare-fun bs!12866 () Bool)

(assert (= bs!12866 d!52389))

(declare-fun m!245565 () Bool)

(assert (=> bs!12866 m!245565))

(assert (=> b!157118 d!52389))

(declare-fun d!52391 () Bool)

(assert (=> d!52391 (= (array_inv!3033 arr!153) (bvsge (size!3270 arr!153) #b00000000000000000000000000000000))))

(assert (=> start!31168 d!52391))

(declare-fun d!52393 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!52393 (= (inv!12 bs!65) (invariant!0 (currentBit!6878 bs!65) (currentByte!6883 bs!65) (size!3270 (buf!3747 bs!65))))))

(declare-fun bs!12867 () Bool)

(assert (= bs!12867 d!52393))

(declare-fun m!245567 () Bool)

(assert (=> bs!12867 m!245567))

(assert (=> start!31168 d!52393))

(declare-fun d!52395 () Bool)

(assert (=> d!52395 (= (array_inv!3033 (buf!3747 bs!65)) (bvsge (size!3270 (buf!3747 bs!65)) #b00000000000000000000000000000000))))

(assert (=> b!157117 d!52395))

(push 1)

(assert (not d!52383))

(assert (not d!52387))

(assert (not d!52361))

(assert (not b!157159))

(assert (not d!52385))

(assert (not d!52353))

(assert (not d!52349))

(assert (not d!52389))

(assert (not b!157167))

(assert (not d!52393))

(assert (not d!52335))

(assert (not d!52347))

(assert (not d!52337))

(assert (not d!52381))

(assert (not d!52355))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!52466 () Bool)

(assert (=> d!52466 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3270 (buf!3747 lt!246430))) ((_ sign_extend 32) (currentByte!6883 lt!246430)) ((_ sign_extend 32) (currentBit!6878 lt!246430)) (bvsub (bvsub to!236 from!240) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!52466 true))

(declare-fun _$7!109 () Unit!10261)

(assert (=> d!52466 (= (choose!57 bs!65 lt!246430 #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!236 from!240)) _$7!109)))

(declare-fun bs!12890 () Bool)

(assert (= bs!12890 d!52466))

(declare-fun m!245785 () Bool)

(assert (=> bs!12890 m!245785))

(assert (=> d!52337 d!52466))

(declare-fun d!52468 () Bool)

(declare-fun e!106434 () Bool)

(assert (=> d!52468 e!106434))

(declare-fun res!131404 () Bool)

(assert (=> d!52468 (=> (not res!131404) (not e!106434))))

(declare-fun moveByteIndexPrecond!0 (BitStream!5746 (_ BitVec 32)) Bool)

(assert (=> d!52468 (= res!131404 (moveByteIndexPrecond!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun Unit!10298 () Unit!10261)

(assert (=> d!52468 (= (moveByteIndex!0 bs!65 #b00000000000000000000000000000001) (tuple2!14149 Unit!10298 (BitStream!5747 (buf!3747 bs!65) (bvadd (currentByte!6883 bs!65) #b00000000000000000000000000000001) (currentBit!6878 bs!65))))))

(declare-fun b!157227 () Bool)

(assert (=> b!157227 (= e!106434 (and (or (not (= (bvand (currentByte!6883 bs!65) #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000001 #b10000000000000000000000000000000))) (= (bvand (currentByte!6883 bs!65) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!6883 bs!65) #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (= (bvadd (currentByte!6883 bs!65) #b00000000000000000000000000000001) (bvadd (currentByte!6883 bs!65) #b00000000000000000000000000000001))))))

(assert (= (and d!52468 res!131404) b!157227))

(declare-fun m!245787 () Bool)

(assert (=> d!52468 m!245787))

(assert (=> d!52387 d!52468))

(declare-fun b!157238 () Bool)

(declare-fun e!106441 () Bool)

(declare-fun lt!246873 () tuple3!660)

(assert (=> b!157238 (= e!106441 (arrayRangesEq!434 (array!7234 (store (store (arr!4147 arr!153) from!240 (_2!7514 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7514 lt!246432)) (size!3270 arr!153)) (_3!447 lt!246873) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000010 from!240)))))

(declare-fun lt!246899 () array!7233)

(declare-fun c!8363 () Bool)

(declare-fun bm!2520 () Bool)

(declare-fun lt!246884 () (_ BitVec 32))

(declare-fun lt!246886 () array!7233)

(declare-fun call!2525 () Bool)

(declare-fun lt!246893 () (_ BitVec 32))

(declare-fun lt!246890 () tuple3!660)

(assert (=> bm!2520 (= call!2525 (arrayRangesEq!434 (ite c!8363 (array!7234 (store (store (arr!4147 arr!153) from!240 (_2!7514 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7514 lt!246432)) (size!3270 arr!153)) lt!246886) (ite c!8363 (_3!447 lt!246890) lt!246899) (ite c!8363 #b00000000000000000000000000000000 lt!246884) (ite c!8363 (bvadd #b00000000000000000000000000000010 from!240) lt!246893)))))

(declare-fun b!157239 () Bool)

(declare-fun lt!246901 () Unit!10261)

(declare-fun e!106443 () tuple3!660)

(assert (=> b!157239 (= e!106443 (tuple3!661 lt!246901 (withMovedByteIndex!0 lt!246430 #b00000000000000000000000000000001) (array!7234 (store (store (arr!4147 arr!153) from!240 (_2!7514 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7514 lt!246432)) (size!3270 arr!153))))))

(declare-fun call!2524 () (_ BitVec 64))

(assert (=> b!157239 (= call!2524 call!2524)))

(declare-fun lt!246877 () Unit!10261)

(declare-fun Unit!10299 () Unit!10261)

(assert (=> b!157239 (= lt!246877 Unit!10299)))

(declare-fun lt!246898 () Unit!10261)

(declare-fun arrayRangesEqReflexiveLemma!43 (array!7233) Unit!10261)

(assert (=> b!157239 (= lt!246898 (arrayRangesEqReflexiveLemma!43 (array!7234 (store (store (arr!4147 arr!153) from!240 (_2!7514 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7514 lt!246432)) (size!3270 arr!153))))))

(declare-fun call!2523 () Bool)

(assert (=> b!157239 call!2523))

(declare-fun lt!246894 () Unit!10261)

(assert (=> b!157239 (= lt!246894 lt!246898)))

(assert (=> b!157239 (= lt!246886 (array!7234 (store (store (arr!4147 arr!153) from!240 (_2!7514 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7514 lt!246432)) (size!3270 arr!153)))))

(assert (=> b!157239 (= lt!246899 (array!7234 (store (store (arr!4147 arr!153) from!240 (_2!7514 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7514 lt!246432)) (size!3270 arr!153)))))

(declare-fun lt!246878 () (_ BitVec 32))

(assert (=> b!157239 (= lt!246878 #b00000000000000000000000000000000)))

(declare-fun lt!246885 () (_ BitVec 32))

(assert (=> b!157239 (= lt!246885 (size!3270 (array!7234 (store (store (arr!4147 arr!153) from!240 (_2!7514 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7514 lt!246432)) (size!3270 arr!153))))))

(assert (=> b!157239 (= lt!246884 #b00000000000000000000000000000000)))

(assert (=> b!157239 (= lt!246893 (bvadd #b00000000000000000000000000000010 from!240))))

(declare-fun arrayRangesEqSlicedLemma!43 (array!7233 array!7233 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10261)

(assert (=> b!157239 (= lt!246901 (arrayRangesEqSlicedLemma!43 lt!246886 lt!246899 lt!246878 lt!246885 lt!246884 lt!246893))))

(assert (=> b!157239 call!2525))

(declare-fun b!157240 () Bool)

(declare-fun lt!246906 () Unit!10261)

(assert (=> b!157240 (= e!106443 (tuple3!661 lt!246906 (_2!7522 lt!246890) (_3!447 lt!246890)))))

(declare-fun lt!246879 () tuple2!14146)

(assert (=> b!157240 (= lt!246879 (readByte!0 (withMovedByteIndex!0 lt!246430 #b00000000000000000000000000000001)))))

(declare-fun lt!246889 () array!7233)

(assert (=> b!157240 (= lt!246889 (array!7234 (store (arr!4147 (array!7234 (store (store (arr!4147 arr!153) from!240 (_2!7514 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7514 lt!246432)) (size!3270 arr!153))) (bvadd #b00000000000000000000000000000010 from!240) (_1!7520 lt!246879)) (size!3270 (array!7234 (store (store (arr!4147 arr!153) from!240 (_2!7514 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7514 lt!246432)) (size!3270 arr!153)))))))

(declare-fun lt!246876 () (_ BitVec 64))

(assert (=> b!157240 (= lt!246876 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!246882 () (_ BitVec 32))

(assert (=> b!157240 (= lt!246882 (bvsub to!236 (bvadd #b00000000000000000000000000000010 from!240)))))

(declare-fun lt!246900 () Unit!10261)

(assert (=> b!157240 (= lt!246900 (validateOffsetBytesFromBitIndexLemma!0 (withMovedByteIndex!0 lt!246430 #b00000000000000000000000000000001) (_2!7520 lt!246879) lt!246876 lt!246882))))

(assert (=> b!157240 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3270 (buf!3747 (_2!7520 lt!246879)))) ((_ sign_extend 32) (currentByte!6883 (_2!7520 lt!246879))) ((_ sign_extend 32) (currentBit!6878 (_2!7520 lt!246879))) (bvsub lt!246882 ((_ extract 31 0) (bvsdiv (bvadd lt!246876 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!246896 () Unit!10261)

(assert (=> b!157240 (= lt!246896 lt!246900)))

(assert (=> b!157240 (= lt!246890 (readByteArrayLoop!0 (_2!7520 lt!246879) lt!246889 (bvadd #b00000000000000000000000000000010 from!240 #b00000000000000000000000000000001) to!236))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!157240 (= call!2524 (bvadd (bitIndex!0 (size!3270 (buf!3747 (withMovedByteIndex!0 lt!246430 #b00000000000000000000000000000001))) (currentByte!6883 (withMovedByteIndex!0 lt!246430 #b00000000000000000000000000000001)) (currentBit!6878 (withMovedByteIndex!0 lt!246430 #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!246874 () Unit!10261)

(declare-fun Unit!10300 () Unit!10261)

(assert (=> b!157240 (= lt!246874 Unit!10300)))

(assert (=> b!157240 (= (bvadd call!2524 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 (bvadd #b00000000000000000000000000000010 from!240)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3270 (buf!3747 (_2!7522 lt!246890))) (currentByte!6883 (_2!7522 lt!246890)) (currentBit!6878 (_2!7522 lt!246890))))))

(declare-fun lt!246880 () Unit!10261)

(declare-fun Unit!10301 () Unit!10261)

(assert (=> b!157240 (= lt!246880 Unit!10301)))

(assert (=> b!157240 (= (bvadd (bitIndex!0 (size!3270 (buf!3747 (withMovedByteIndex!0 lt!246430 #b00000000000000000000000000000001))) (currentByte!6883 (withMovedByteIndex!0 lt!246430 #b00000000000000000000000000000001)) (currentBit!6878 (withMovedByteIndex!0 lt!246430 #b00000000000000000000000000000001))) (bvmul ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000010 from!240))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3270 (buf!3747 (_2!7522 lt!246890))) (currentByte!6883 (_2!7522 lt!246890)) (currentBit!6878 (_2!7522 lt!246890))))))

(declare-fun lt!246891 () Unit!10261)

(declare-fun Unit!10302 () Unit!10261)

(assert (=> b!157240 (= lt!246891 Unit!10302)))

(assert (=> b!157240 (and (= (buf!3747 (withMovedByteIndex!0 lt!246430 #b00000000000000000000000000000001)) (buf!3747 (_2!7522 lt!246890))) (= (size!3270 (array!7234 (store (store (arr!4147 arr!153) from!240 (_2!7514 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7514 lt!246432)) (size!3270 arr!153))) (size!3270 (_3!447 lt!246890))))))

(declare-fun lt!246905 () Unit!10261)

(declare-fun Unit!10303 () Unit!10261)

(assert (=> b!157240 (= lt!246905 Unit!10303)))

(declare-fun lt!246887 () Unit!10261)

(declare-fun arrayUpdatedAtPrefixLemma!43 (array!7233 (_ BitVec 32) (_ BitVec 8)) Unit!10261)

(assert (=> b!157240 (= lt!246887 (arrayUpdatedAtPrefixLemma!43 (array!7234 (store (store (arr!4147 arr!153) from!240 (_2!7514 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7514 lt!246432)) (size!3270 arr!153)) (bvadd #b00000000000000000000000000000010 from!240) (_1!7520 lt!246879)))))

(assert (=> b!157240 call!2523))

(declare-fun lt!246871 () Unit!10261)

(assert (=> b!157240 (= lt!246871 lt!246887)))

(declare-fun lt!246897 () (_ BitVec 32))

(assert (=> b!157240 (= lt!246897 #b00000000000000000000000000000000)))

(declare-fun lt!246872 () Unit!10261)

(declare-fun arrayRangesEqTransitive!108 (array!7233 array!7233 array!7233 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10261)

(assert (=> b!157240 (= lt!246872 (arrayRangesEqTransitive!108 (array!7234 (store (store (arr!4147 arr!153) from!240 (_2!7514 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7514 lt!246432)) (size!3270 arr!153)) lt!246889 (_3!447 lt!246890) lt!246897 (bvadd #b00000000000000000000000000000010 from!240) (bvadd #b00000000000000000000000000000010 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157240 (arrayRangesEq!434 (array!7234 (store (store (arr!4147 arr!153) from!240 (_2!7514 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7514 lt!246432)) (size!3270 arr!153)) (_3!447 lt!246890) lt!246897 (bvadd #b00000000000000000000000000000010 from!240))))

(declare-fun lt!246902 () Unit!10261)

(assert (=> b!157240 (= lt!246902 lt!246872)))

(assert (=> b!157240 call!2525))

(declare-fun lt!246903 () Unit!10261)

(declare-fun Unit!10304 () Unit!10261)

(assert (=> b!157240 (= lt!246903 Unit!10304)))

(declare-fun lt!246883 () Unit!10261)

(declare-fun arrayRangesEqImpliesEq!52 (array!7233 array!7233 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10261)

(assert (=> b!157240 (= lt!246883 (arrayRangesEqImpliesEq!52 lt!246889 (_3!447 lt!246890) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000010 from!240) (bvadd #b00000000000000000000000000000010 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157240 (= (select (store (arr!4147 (array!7234 (store (store (arr!4147 arr!153) from!240 (_2!7514 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7514 lt!246432)) (size!3270 arr!153))) (bvadd #b00000000000000000000000000000010 from!240) (_1!7520 lt!246879)) (bvadd #b00000000000000000000000000000010 from!240)) (select (arr!4147 (_3!447 lt!246890)) (bvadd #b00000000000000000000000000000010 from!240)))))

(declare-fun lt!246881 () Unit!10261)

(assert (=> b!157240 (= lt!246881 lt!246883)))

(declare-fun lt!246895 () Bool)

(assert (=> b!157240 (= lt!246895 (= (select (arr!4147 (_3!447 lt!246890)) (bvadd #b00000000000000000000000000000010 from!240)) (_1!7520 lt!246879)))))

(declare-fun Unit!10305 () Unit!10261)

(assert (=> b!157240 (= lt!246906 Unit!10305)))

(assert (=> b!157240 lt!246895))

(declare-fun e!106442 () Bool)

(declare-fun b!157241 () Bool)

(assert (=> b!157241 (= e!106442 (= (select (arr!4147 (_3!447 lt!246873)) (bvadd #b00000000000000000000000000000010 from!240)) (_2!7514 (readBytePure!0 (withMovedByteIndex!0 lt!246430 #b00000000000000000000000000000001)))))))

(assert (=> b!157241 (and (bvsge (bvadd #b00000000000000000000000000000010 from!240) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000010 from!240) (size!3270 (_3!447 lt!246873))))))

(declare-fun b!157242 () Bool)

(declare-fun res!131411 () Bool)

(assert (=> b!157242 (=> (not res!131411) (not e!106441))))

(assert (=> b!157242 (= res!131411 (and (= (buf!3747 (withMovedByteIndex!0 lt!246430 #b00000000000000000000000000000001)) (buf!3747 (_2!7522 lt!246873))) (= (size!3270 (array!7234 (store (store (arr!4147 arr!153) from!240 (_2!7514 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7514 lt!246432)) (size!3270 arr!153))) (size!3270 (_3!447 lt!246873)))))))

(declare-fun bm!2522 () Bool)

(assert (=> bm!2522 (= call!2524 (bitIndex!0 (ite c!8363 (size!3270 (buf!3747 (_2!7520 lt!246879))) (size!3270 (buf!3747 (withMovedByteIndex!0 lt!246430 #b00000000000000000000000000000001)))) (ite c!8363 (currentByte!6883 (_2!7520 lt!246879)) (currentByte!6883 (withMovedByteIndex!0 lt!246430 #b00000000000000000000000000000001))) (ite c!8363 (currentBit!6878 (_2!7520 lt!246879)) (currentBit!6878 (withMovedByteIndex!0 lt!246430 #b00000000000000000000000000000001)))))))

(declare-fun d!52470 () Bool)

(assert (=> d!52470 e!106442))

(declare-fun res!131413 () Bool)

(assert (=> d!52470 (=> res!131413 e!106442)))

(assert (=> d!52470 (= res!131413 (bvsge (bvadd #b00000000000000000000000000000010 from!240) to!236))))

(declare-fun lt!246875 () Bool)

(assert (=> d!52470 (= lt!246875 e!106441)))

(declare-fun res!131412 () Bool)

(assert (=> d!52470 (=> (not res!131412) (not e!106441))))

(declare-fun lt!246888 () (_ BitVec 64))

(declare-fun lt!246904 () (_ BitVec 64))

(assert (=> d!52470 (= res!131412 (= (bvadd lt!246904 lt!246888) (bitIndex!0 (size!3270 (buf!3747 (_2!7522 lt!246873))) (currentByte!6883 (_2!7522 lt!246873)) (currentBit!6878 (_2!7522 lt!246873)))))))

(assert (=> d!52470 (or (not (= (bvand lt!246904 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!246888 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!246904 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!246904 lt!246888) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!246892 () (_ BitVec 64))

(assert (=> d!52470 (= lt!246888 (bvmul lt!246892 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!52470 (or (= lt!246892 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!246892 #b0000000000000000000000000000000000000000000000000000000000001000) lt!246892)))))

(assert (=> d!52470 (= lt!246892 ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000010 from!240))))))

(assert (=> d!52470 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000010 from!240) #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 (bvadd #b00000000000000000000000000000010 from!240)) #b10000000000000000000000000000000)))))

(assert (=> d!52470 (= lt!246904 (bitIndex!0 (size!3270 (buf!3747 (withMovedByteIndex!0 lt!246430 #b00000000000000000000000000000001))) (currentByte!6883 (withMovedByteIndex!0 lt!246430 #b00000000000000000000000000000001)) (currentBit!6878 (withMovedByteIndex!0 lt!246430 #b00000000000000000000000000000001))))))

(assert (=> d!52470 (= lt!246873 e!106443)))

(assert (=> d!52470 (= c!8363 (bvslt (bvadd #b00000000000000000000000000000010 from!240) to!236))))

(assert (=> d!52470 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000010 from!240)) (bvsle (bvadd #b00000000000000000000000000000010 from!240) to!236) (bvsle to!236 (size!3270 (array!7234 (store (store (arr!4147 arr!153) from!240 (_2!7514 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7514 lt!246432)) (size!3270 arr!153)))))))

(assert (=> d!52470 (= (readByteArrayLoop!0 (withMovedByteIndex!0 lt!246430 #b00000000000000000000000000000001) (array!7234 (store (store (arr!4147 arr!153) from!240 (_2!7514 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7514 lt!246432)) (size!3270 arr!153)) (bvadd #b00000000000000000000000000000010 from!240) to!236) lt!246873)))

(declare-fun bm!2521 () Bool)

(assert (=> bm!2521 (= call!2523 (arrayRangesEq!434 (array!7234 (store (store (arr!4147 arr!153) from!240 (_2!7514 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7514 lt!246432)) (size!3270 arr!153)) (ite c!8363 (array!7234 (store (arr!4147 (array!7234 (store (store (arr!4147 arr!153) from!240 (_2!7514 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7514 lt!246432)) (size!3270 arr!153))) (bvadd #b00000000000000000000000000000010 from!240) (_1!7520 lt!246879)) (size!3270 (array!7234 (store (store (arr!4147 arr!153) from!240 (_2!7514 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7514 lt!246432)) (size!3270 arr!153)))) (array!7234 (store (store (arr!4147 arr!153) from!240 (_2!7514 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7514 lt!246432)) (size!3270 arr!153))) #b00000000000000000000000000000000 (ite c!8363 (bvadd #b00000000000000000000000000000010 from!240) (size!3270 (array!7234 (store (store (arr!4147 arr!153) from!240 (_2!7514 (readBytePure!0 bs!65))) (bvadd #b00000000000000000000000000000001 from!240) (_2!7514 lt!246432)) (size!3270 arr!153))))))))

(assert (= (and d!52470 c!8363) b!157240))

(assert (= (and d!52470 (not c!8363)) b!157239))

(assert (= (or b!157240 b!157239) bm!2520))

(assert (= (or b!157240 b!157239) bm!2521))

(assert (= (or b!157240 b!157239) bm!2522))

(assert (= (and d!52470 res!131412) b!157242))

(assert (= (and b!157242 res!131411) b!157238))

(assert (= (and d!52470 (not res!131413)) b!157241))

(declare-fun m!245789 () Bool)

(assert (=> bm!2521 m!245789))

(declare-fun m!245791 () Bool)

(assert (=> bm!2521 m!245791))

(declare-fun m!245793 () Bool)

(assert (=> b!157241 m!245793))

(assert (=> b!157241 m!245405))

(declare-fun m!245795 () Bool)

(assert (=> b!157241 m!245795))

(declare-fun m!245797 () Bool)

(assert (=> bm!2520 m!245797))

(declare-fun m!245799 () Bool)

(assert (=> bm!2522 m!245799))

(declare-fun m!245801 () Bool)

(assert (=> b!157240 m!245801))

(declare-fun m!245803 () Bool)

(assert (=> b!157240 m!245803))

(declare-fun m!245805 () Bool)

(assert (=> b!157240 m!245805))

(declare-fun m!245807 () Bool)

(assert (=> b!157240 m!245807))

(declare-fun m!245809 () Bool)

(assert (=> b!157240 m!245809))

(declare-fun m!245811 () Bool)

(assert (=> b!157240 m!245811))

(declare-fun m!245813 () Bool)

(assert (=> b!157240 m!245813))

(assert (=> b!157240 m!245405))

(declare-fun m!245815 () Bool)

(assert (=> b!157240 m!245815))

(declare-fun m!245817 () Bool)

(assert (=> b!157240 m!245817))

(assert (=> b!157240 m!245405))

(declare-fun m!245819 () Bool)

(assert (=> b!157240 m!245819))

(declare-fun m!245821 () Bool)

(assert (=> b!157240 m!245821))

(assert (=> b!157240 m!245789))

(declare-fun m!245823 () Bool)

(assert (=> b!157240 m!245823))

(declare-fun m!245825 () Bool)

(assert (=> b!157238 m!245825))

(declare-fun m!245827 () Bool)

(assert (=> b!157239 m!245827))

(declare-fun m!245829 () Bool)

(assert (=> b!157239 m!245829))

(declare-fun m!245831 () Bool)

(assert (=> d!52470 m!245831))

(assert (=> d!52470 m!245809))

(assert (=> d!52355 d!52470))

(declare-fun d!52472 () Bool)

(assert (=> d!52472 (= (remainingBits!0 ((_ sign_extend 32) (size!3270 (buf!3747 lt!246430))) lt!246427 lt!246423) (bvsub (bvmul ((_ sign_extend 32) (size!3270 (buf!3747 lt!246430))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul lt!246427 #b0000000000000000000000000000000000000000000000000000000000001000) lt!246423)))))

(assert (=> d!52335 d!52472))

(declare-fun lt!246907 () tuple3!660)

(declare-fun d!52474 () Bool)

(assert (=> d!52474 (= lt!246907 (readByteArrayLoop!0 lt!246542 (array!7234 (store (arr!4147 lt!246431) (bvadd #b00000000000000000000000000000001 from!240) (_2!7514 (readBytePure!0 lt!246430))) (size!3270 lt!246431)) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> d!52474 (= (readByteArrayLoopPure!0 lt!246542 (array!7234 (store (arr!4147 lt!246431) (bvadd #b00000000000000000000000000000001 from!240) (_2!7514 (readBytePure!0 lt!246430))) (size!3270 lt!246431)) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236) (tuple2!14137 (_2!7522 lt!246907) (_3!447 lt!246907)))))

(declare-fun bs!12891 () Bool)

(assert (= bs!12891 d!52474))

(declare-fun m!245833 () Bool)

(assert (=> bs!12891 m!245833))

(assert (=> d!52361 d!52474))

(assert (=> d!52361 d!52353))

(assert (=> d!52361 d!52347))

(declare-fun d!52476 () Bool)

(declare-fun res!131414 () Bool)

(declare-fun e!106444 () Bool)

(assert (=> d!52476 (=> res!131414 e!106444)))

(assert (=> d!52476 (= res!131414 (= #b00000000000000000000000000000000 to!236))))

(assert (=> d!52476 (= (arrayRangesEq!434 (_2!7515 lt!246541) (_2!7515 lt!246543) #b00000000000000000000000000000000 to!236) e!106444)))

(declare-fun b!157243 () Bool)

(declare-fun e!106445 () Bool)

(assert (=> b!157243 (= e!106444 e!106445)))

(declare-fun res!131415 () Bool)

(assert (=> b!157243 (=> (not res!131415) (not e!106445))))

(assert (=> b!157243 (= res!131415 (= (select (arr!4147 (_2!7515 lt!246541)) #b00000000000000000000000000000000) (select (arr!4147 (_2!7515 lt!246543)) #b00000000000000000000000000000000)))))

(declare-fun b!157244 () Bool)

(assert (=> b!157244 (= e!106445 (arrayRangesEq!434 (_2!7515 lt!246541) (_2!7515 lt!246543) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!236))))

(assert (= (and d!52476 (not res!131414)) b!157243))

(assert (= (and b!157243 res!131415) b!157244))

(declare-fun m!245835 () Bool)

(assert (=> b!157243 m!245835))

(declare-fun m!245837 () Bool)

(assert (=> b!157243 m!245837))

(declare-fun m!245839 () Bool)

(assert (=> b!157244 m!245839))

(assert (=> d!52361 d!52476))

(assert (=> d!52361 d!52385))

(declare-fun d!52478 () Bool)

(assert (=> d!52478 (arrayRangesEq!434 (_2!7515 (readByteArrayLoopPure!0 lt!246430 lt!246431 (bvadd #b00000000000000000000000000000001 from!240) to!236)) (_2!7515 (readByteArrayLoopPure!0 (withMovedByteIndex!0 lt!246430 #b00000000000000000000000000000001) (array!7234 (store (arr!4147 lt!246431) (bvadd #b00000000000000000000000000000001 from!240) (_2!7514 (readBytePure!0 lt!246430))) (size!3270 lt!246431)) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236)) #b00000000000000000000000000000000 to!236)))

(assert (=> d!52478 true))

(declare-fun _$13!91 () Unit!10261)

(assert (=> d!52478 (= (choose!35 lt!246430 lt!246431 (bvadd #b00000000000000000000000000000001 from!240) to!236 lt!246541 (_2!7515 lt!246541) lt!246542 lt!246543 (_2!7515 lt!246543)) _$13!91)))

(declare-fun bs!12893 () Bool)

(assert (= bs!12893 d!52478))

(assert (=> bs!12893 m!245405))

(assert (=> bs!12893 m!245429))

(assert (=> bs!12893 m!245405))

(declare-fun m!245841 () Bool)

(assert (=> bs!12893 m!245841))

(assert (=> bs!12893 m!245555))

(declare-fun m!245843 () Bool)

(assert (=> bs!12893 m!245843))

(assert (=> bs!12893 m!245425))

(assert (=> d!52361 d!52478))

(declare-fun d!52480 () Bool)

(declare-fun lt!246925 () (_ BitVec 8))

(declare-fun lt!246923 () (_ BitVec 8))

(assert (=> d!52480 (= lt!246925 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4147 (buf!3747 lt!246430)) (currentByte!6883 lt!246430))) ((_ sign_extend 24) lt!246923))))))

(assert (=> d!52480 (= lt!246923 ((_ extract 7 0) (currentBit!6878 lt!246430)))))

(declare-fun e!106450 () Bool)

(assert (=> d!52480 e!106450))

(declare-fun res!131422 () Bool)

(assert (=> d!52480 (=> (not res!131422) (not e!106450))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!52480 (= res!131422 (validate_offset_bits!1 ((_ sign_extend 32) (size!3270 (buf!3747 lt!246430))) ((_ sign_extend 32) (currentByte!6883 lt!246430)) ((_ sign_extend 32) (currentBit!6878 lt!246430)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!14160 0))(
  ( (tuple2!14161 (_1!7530 Unit!10261) (_2!7530 (_ BitVec 8))) )
))
(declare-fun Unit!10306 () Unit!10261)

(declare-fun Unit!10307 () Unit!10261)

(assert (=> d!52480 (= (readByte!0 lt!246430) (tuple2!14147 (_2!7530 (ite (bvsgt ((_ sign_extend 24) lt!246923) #b00000000000000000000000000000000) (tuple2!14161 Unit!10306 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!246925) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4147 (buf!3747 lt!246430)) (bvadd (currentByte!6883 lt!246430) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!246923)))))))) (tuple2!14161 Unit!10307 lt!246925))) (BitStream!5747 (buf!3747 lt!246430) (bvadd (currentByte!6883 lt!246430) #b00000000000000000000000000000001) (currentBit!6878 lt!246430))))))

(declare-fun b!157249 () Bool)

(declare-fun e!106451 () Bool)

(assert (=> b!157249 (= e!106450 e!106451)))

(declare-fun res!131421 () Bool)

(assert (=> b!157249 (=> (not res!131421) (not e!106451))))

(declare-fun lt!246922 () tuple2!14146)

(assert (=> b!157249 (= res!131421 (= (buf!3747 (_2!7520 lt!246922)) (buf!3747 lt!246430)))))

(declare-fun lt!246926 () (_ BitVec 8))

(declare-fun lt!246928 () (_ BitVec 8))

(declare-fun Unit!10308 () Unit!10261)

(declare-fun Unit!10309 () Unit!10261)

(assert (=> b!157249 (= lt!246922 (tuple2!14147 (_2!7530 (ite (bvsgt ((_ sign_extend 24) lt!246928) #b00000000000000000000000000000000) (tuple2!14161 Unit!10308 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!246926) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4147 (buf!3747 lt!246430)) (bvadd (currentByte!6883 lt!246430) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!246928)))))))) (tuple2!14161 Unit!10309 lt!246926))) (BitStream!5747 (buf!3747 lt!246430) (bvadd (currentByte!6883 lt!246430) #b00000000000000000000000000000001) (currentBit!6878 lt!246430))))))

(assert (=> b!157249 (= lt!246926 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4147 (buf!3747 lt!246430)) (currentByte!6883 lt!246430))) ((_ sign_extend 24) lt!246928))))))

(assert (=> b!157249 (= lt!246928 ((_ extract 7 0) (currentBit!6878 lt!246430)))))

(declare-fun lt!246924 () (_ BitVec 64))

(declare-fun lt!246927 () (_ BitVec 64))

(declare-fun b!157250 () Bool)

(assert (=> b!157250 (= e!106451 (= (bitIndex!0 (size!3270 (buf!3747 (_2!7520 lt!246922))) (currentByte!6883 (_2!7520 lt!246922)) (currentBit!6878 (_2!7520 lt!246922))) (bvadd lt!246924 lt!246927)))))

(assert (=> b!157250 (or (not (= (bvand lt!246924 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!246927 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!246924 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!246924 lt!246927) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!157250 (= lt!246927 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!157250 (= lt!246924 (bitIndex!0 (size!3270 (buf!3747 lt!246430)) (currentByte!6883 lt!246430) (currentBit!6878 lt!246430)))))

(assert (= (and d!52480 res!131422) b!157249))

(assert (= (and b!157249 res!131421) b!157250))

(declare-fun m!245845 () Bool)

(assert (=> d!52480 m!245845))

(declare-fun m!245847 () Bool)

(assert (=> d!52480 m!245847))

(declare-fun m!245849 () Bool)

(assert (=> d!52480 m!245849))

(assert (=> b!157249 m!245849))

(assert (=> b!157249 m!245845))

(declare-fun m!245851 () Bool)

(assert (=> b!157250 m!245851))

(declare-fun m!245853 () Bool)

(assert (=> b!157250 m!245853))

(assert (=> d!52347 d!52480))

(declare-fun d!52482 () Bool)

(declare-fun lt!246932 () (_ BitVec 8))

(declare-fun lt!246930 () (_ BitVec 8))

(assert (=> d!52482 (= lt!246932 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4147 (buf!3747 bs!65)) (currentByte!6883 bs!65))) ((_ sign_extend 24) lt!246930))))))

(assert (=> d!52482 (= lt!246930 ((_ extract 7 0) (currentBit!6878 bs!65)))))

(declare-fun e!106452 () Bool)

(assert (=> d!52482 e!106452))

(declare-fun res!131424 () Bool)

(assert (=> d!52482 (=> (not res!131424) (not e!106452))))

(assert (=> d!52482 (= res!131424 (validate_offset_bits!1 ((_ sign_extend 32) (size!3270 (buf!3747 bs!65))) ((_ sign_extend 32) (currentByte!6883 bs!65)) ((_ sign_extend 32) (currentBit!6878 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!10310 () Unit!10261)

(declare-fun Unit!10311 () Unit!10261)

(assert (=> d!52482 (= (readByte!0 bs!65) (tuple2!14147 (_2!7530 (ite (bvsgt ((_ sign_extend 24) lt!246930) #b00000000000000000000000000000000) (tuple2!14161 Unit!10310 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!246932) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4147 (buf!3747 bs!65)) (bvadd (currentByte!6883 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!246930)))))))) (tuple2!14161 Unit!10311 lt!246932))) (BitStream!5747 (buf!3747 bs!65) (bvadd (currentByte!6883 bs!65) #b00000000000000000000000000000001) (currentBit!6878 bs!65))))))

(declare-fun b!157251 () Bool)

(declare-fun e!106453 () Bool)

(assert (=> b!157251 (= e!106452 e!106453)))

(declare-fun res!131423 () Bool)

(assert (=> b!157251 (=> (not res!131423) (not e!106453))))

(declare-fun lt!246929 () tuple2!14146)

(assert (=> b!157251 (= res!131423 (= (buf!3747 (_2!7520 lt!246929)) (buf!3747 bs!65)))))

(declare-fun lt!246935 () (_ BitVec 8))

(declare-fun lt!246933 () (_ BitVec 8))

(declare-fun Unit!10312 () Unit!10261)

(declare-fun Unit!10313 () Unit!10261)

(assert (=> b!157251 (= lt!246929 (tuple2!14147 (_2!7530 (ite (bvsgt ((_ sign_extend 24) lt!246935) #b00000000000000000000000000000000) (tuple2!14161 Unit!10312 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!246933) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4147 (buf!3747 bs!65)) (bvadd (currentByte!6883 bs!65) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!246935)))))))) (tuple2!14161 Unit!10313 lt!246933))) (BitStream!5747 (buf!3747 bs!65) (bvadd (currentByte!6883 bs!65) #b00000000000000000000000000000001) (currentBit!6878 bs!65))))))

(assert (=> b!157251 (= lt!246933 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4147 (buf!3747 bs!65)) (currentByte!6883 bs!65))) ((_ sign_extend 24) lt!246935))))))

(assert (=> b!157251 (= lt!246935 ((_ extract 7 0) (currentBit!6878 bs!65)))))

(declare-fun lt!246934 () (_ BitVec 64))

(declare-fun b!157252 () Bool)

(declare-fun lt!246931 () (_ BitVec 64))

(assert (=> b!157252 (= e!106453 (= (bitIndex!0 (size!3270 (buf!3747 (_2!7520 lt!246929))) (currentByte!6883 (_2!7520 lt!246929)) (currentBit!6878 (_2!7520 lt!246929))) (bvadd lt!246931 lt!246934)))))

(assert (=> b!157252 (or (not (= (bvand lt!246931 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!246934 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!246931 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!246931 lt!246934) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!157252 (= lt!246934 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!157252 (= lt!246931 (bitIndex!0 (size!3270 (buf!3747 bs!65)) (currentByte!6883 bs!65) (currentBit!6878 bs!65)))))

(assert (= (and d!52482 res!131424) b!157251))

(assert (= (and b!157251 res!131423) b!157252))

(declare-fun m!245855 () Bool)

(assert (=> d!52482 m!245855))

(declare-fun m!245857 () Bool)

(assert (=> d!52482 m!245857))

(declare-fun m!245859 () Bool)

(assert (=> d!52482 m!245859))

(assert (=> b!157251 m!245859))

(assert (=> b!157251 m!245855))

(declare-fun m!245861 () Bool)

(assert (=> b!157252 m!245861))

(declare-fun m!245863 () Bool)

(assert (=> b!157252 m!245863))

(assert (=> d!52349 d!52482))

(assert (=> d!52383 d!52472))

(declare-fun e!106454 () Bool)

(declare-fun b!157253 () Bool)

(declare-fun lt!246938 () tuple3!660)

(assert (=> b!157253 (= e!106454 (arrayRangesEq!434 arr!153 (_3!447 lt!246938) #b00000000000000000000000000000000 from!240))))

(declare-fun lt!246951 () array!7233)

(declare-fun call!2528 () Bool)

(declare-fun c!8364 () Bool)

(declare-fun bm!2523 () Bool)

(declare-fun lt!246955 () tuple3!660)

(declare-fun lt!246949 () (_ BitVec 32))

(declare-fun lt!246964 () array!7233)

(declare-fun lt!246958 () (_ BitVec 32))

(assert (=> bm!2523 (= call!2528 (arrayRangesEq!434 (ite c!8364 arr!153 lt!246951) (ite c!8364 (_3!447 lt!246955) lt!246964) (ite c!8364 #b00000000000000000000000000000000 lt!246949) (ite c!8364 from!240 lt!246958)))))

(declare-fun lt!246966 () Unit!10261)

(declare-fun b!157254 () Bool)

(declare-fun e!106456 () tuple3!660)

(assert (=> b!157254 (= e!106456 (tuple3!661 lt!246966 bs!65 arr!153))))

(declare-fun call!2527 () (_ BitVec 64))

(assert (=> b!157254 (= call!2527 call!2527)))

(declare-fun lt!246942 () Unit!10261)

(declare-fun Unit!10314 () Unit!10261)

(assert (=> b!157254 (= lt!246942 Unit!10314)))

(declare-fun lt!246963 () Unit!10261)

(assert (=> b!157254 (= lt!246963 (arrayRangesEqReflexiveLemma!43 arr!153))))

(declare-fun call!2526 () Bool)

(assert (=> b!157254 call!2526))

(declare-fun lt!246959 () Unit!10261)

(assert (=> b!157254 (= lt!246959 lt!246963)))

(assert (=> b!157254 (= lt!246951 arr!153)))

(assert (=> b!157254 (= lt!246964 arr!153)))

(declare-fun lt!246943 () (_ BitVec 32))

(assert (=> b!157254 (= lt!246943 #b00000000000000000000000000000000)))

(declare-fun lt!246950 () (_ BitVec 32))

(assert (=> b!157254 (= lt!246950 (size!3270 arr!153))))

(assert (=> b!157254 (= lt!246949 #b00000000000000000000000000000000)))

(assert (=> b!157254 (= lt!246958 from!240)))

(assert (=> b!157254 (= lt!246966 (arrayRangesEqSlicedLemma!43 lt!246951 lt!246964 lt!246943 lt!246950 lt!246949 lt!246958))))

(assert (=> b!157254 call!2528))

(declare-fun b!157255 () Bool)

(declare-fun lt!246971 () Unit!10261)

(assert (=> b!157255 (= e!106456 (tuple3!661 lt!246971 (_2!7522 lt!246955) (_3!447 lt!246955)))))

(declare-fun lt!246944 () tuple2!14146)

(assert (=> b!157255 (= lt!246944 (readByte!0 bs!65))))

(declare-fun lt!246954 () array!7233)

(assert (=> b!157255 (= lt!246954 (array!7234 (store (arr!4147 arr!153) from!240 (_1!7520 lt!246944)) (size!3270 arr!153)))))

(declare-fun lt!246941 () (_ BitVec 64))

(assert (=> b!157255 (= lt!246941 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!246947 () (_ BitVec 32))

(assert (=> b!157255 (= lt!246947 (bvsub to!236 from!240))))

(declare-fun lt!246965 () Unit!10261)

(assert (=> b!157255 (= lt!246965 (validateOffsetBytesFromBitIndexLemma!0 bs!65 (_2!7520 lt!246944) lt!246941 lt!246947))))

(assert (=> b!157255 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3270 (buf!3747 (_2!7520 lt!246944)))) ((_ sign_extend 32) (currentByte!6883 (_2!7520 lt!246944))) ((_ sign_extend 32) (currentBit!6878 (_2!7520 lt!246944))) (bvsub lt!246947 ((_ extract 31 0) (bvsdiv (bvadd lt!246941 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!246961 () Unit!10261)

(assert (=> b!157255 (= lt!246961 lt!246965)))

(assert (=> b!157255 (= lt!246955 (readByteArrayLoop!0 (_2!7520 lt!246944) lt!246954 (bvadd from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> b!157255 (= call!2527 (bvadd (bitIndex!0 (size!3270 (buf!3747 bs!65)) (currentByte!6883 bs!65) (currentBit!6878 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!246939 () Unit!10261)

(declare-fun Unit!10315 () Unit!10261)

(assert (=> b!157255 (= lt!246939 Unit!10315)))

(assert (=> b!157255 (= (bvadd call!2527 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 from!240) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3270 (buf!3747 (_2!7522 lt!246955))) (currentByte!6883 (_2!7522 lt!246955)) (currentBit!6878 (_2!7522 lt!246955))))))

(declare-fun lt!246945 () Unit!10261)

(declare-fun Unit!10316 () Unit!10261)

(assert (=> b!157255 (= lt!246945 Unit!10316)))

(assert (=> b!157255 (= (bvadd (bitIndex!0 (size!3270 (buf!3747 bs!65)) (currentByte!6883 bs!65) (currentBit!6878 bs!65)) (bvmul ((_ sign_extend 32) (bvsub to!236 from!240)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3270 (buf!3747 (_2!7522 lt!246955))) (currentByte!6883 (_2!7522 lt!246955)) (currentBit!6878 (_2!7522 lt!246955))))))

(declare-fun lt!246956 () Unit!10261)

(declare-fun Unit!10317 () Unit!10261)

(assert (=> b!157255 (= lt!246956 Unit!10317)))

(assert (=> b!157255 (and (= (buf!3747 bs!65) (buf!3747 (_2!7522 lt!246955))) (= (size!3270 arr!153) (size!3270 (_3!447 lt!246955))))))

(declare-fun lt!246970 () Unit!10261)

(declare-fun Unit!10318 () Unit!10261)

(assert (=> b!157255 (= lt!246970 Unit!10318)))

(declare-fun lt!246952 () Unit!10261)

(assert (=> b!157255 (= lt!246952 (arrayUpdatedAtPrefixLemma!43 arr!153 from!240 (_1!7520 lt!246944)))))

(assert (=> b!157255 call!2526))

(declare-fun lt!246936 () Unit!10261)

(assert (=> b!157255 (= lt!246936 lt!246952)))

(declare-fun lt!246962 () (_ BitVec 32))

(assert (=> b!157255 (= lt!246962 #b00000000000000000000000000000000)))

(declare-fun lt!246937 () Unit!10261)

(assert (=> b!157255 (= lt!246937 (arrayRangesEqTransitive!108 arr!153 lt!246954 (_3!447 lt!246955) lt!246962 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157255 (arrayRangesEq!434 arr!153 (_3!447 lt!246955) lt!246962 from!240)))

(declare-fun lt!246967 () Unit!10261)

(assert (=> b!157255 (= lt!246967 lt!246937)))

(assert (=> b!157255 call!2528))

(declare-fun lt!246968 () Unit!10261)

(declare-fun Unit!10319 () Unit!10261)

(assert (=> b!157255 (= lt!246968 Unit!10319)))

(declare-fun lt!246948 () Unit!10261)

(assert (=> b!157255 (= lt!246948 (arrayRangesEqImpliesEq!52 lt!246954 (_3!447 lt!246955) #b00000000000000000000000000000000 from!240 (bvadd from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157255 (= (select (store (arr!4147 arr!153) from!240 (_1!7520 lt!246944)) from!240) (select (arr!4147 (_3!447 lt!246955)) from!240))))

(declare-fun lt!246946 () Unit!10261)

(assert (=> b!157255 (= lt!246946 lt!246948)))

(declare-fun lt!246960 () Bool)

(assert (=> b!157255 (= lt!246960 (= (select (arr!4147 (_3!447 lt!246955)) from!240) (_1!7520 lt!246944)))))

(declare-fun Unit!10320 () Unit!10261)

(assert (=> b!157255 (= lt!246971 Unit!10320)))

(assert (=> b!157255 lt!246960))

(declare-fun b!157256 () Bool)

(declare-fun e!106455 () Bool)

(assert (=> b!157256 (= e!106455 (= (select (arr!4147 (_3!447 lt!246938)) from!240) (_2!7514 (readBytePure!0 bs!65))))))

(assert (=> b!157256 (and (bvsge from!240 #b00000000000000000000000000000000) (bvslt from!240 (size!3270 (_3!447 lt!246938))))))

(declare-fun b!157257 () Bool)

(declare-fun res!131425 () Bool)

(assert (=> b!157257 (=> (not res!131425) (not e!106454))))

(assert (=> b!157257 (= res!131425 (and (= (buf!3747 bs!65) (buf!3747 (_2!7522 lt!246938))) (= (size!3270 arr!153) (size!3270 (_3!447 lt!246938)))))))

(declare-fun bm!2525 () Bool)

(assert (=> bm!2525 (= call!2527 (bitIndex!0 (ite c!8364 (size!3270 (buf!3747 (_2!7520 lt!246944))) (size!3270 (buf!3747 bs!65))) (ite c!8364 (currentByte!6883 (_2!7520 lt!246944)) (currentByte!6883 bs!65)) (ite c!8364 (currentBit!6878 (_2!7520 lt!246944)) (currentBit!6878 bs!65))))))

(declare-fun d!52484 () Bool)

(assert (=> d!52484 e!106455))

(declare-fun res!131427 () Bool)

(assert (=> d!52484 (=> res!131427 e!106455)))

(assert (=> d!52484 (= res!131427 (bvsge from!240 to!236))))

(declare-fun lt!246940 () Bool)

(assert (=> d!52484 (= lt!246940 e!106454)))

(declare-fun res!131426 () Bool)

(assert (=> d!52484 (=> (not res!131426) (not e!106454))))

(declare-fun lt!246953 () (_ BitVec 64))

(declare-fun lt!246969 () (_ BitVec 64))

(assert (=> d!52484 (= res!131426 (= (bvadd lt!246969 lt!246953) (bitIndex!0 (size!3270 (buf!3747 (_2!7522 lt!246938))) (currentByte!6883 (_2!7522 lt!246938)) (currentBit!6878 (_2!7522 lt!246938)))))))

(assert (=> d!52484 (or (not (= (bvand lt!246969 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!246953 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!246969 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!246969 lt!246953) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!246957 () (_ BitVec 64))

(assert (=> d!52484 (= lt!246953 (bvmul lt!246957 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!52484 (or (= lt!246957 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!246957 #b0000000000000000000000000000000000000000000000000000000000001000) lt!246957)))))

(assert (=> d!52484 (= lt!246957 ((_ sign_extend 32) (bvsub to!236 from!240)))))

(assert (=> d!52484 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand from!240 #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000)))))

(assert (=> d!52484 (= lt!246969 (bitIndex!0 (size!3270 (buf!3747 bs!65)) (currentByte!6883 bs!65) (currentBit!6878 bs!65)))))

(assert (=> d!52484 (= lt!246938 e!106456)))

(assert (=> d!52484 (= c!8364 (bvslt from!240 to!236))))

(assert (=> d!52484 (and (bvsle #b00000000000000000000000000000000 from!240) (bvsle from!240 to!236) (bvsle to!236 (size!3270 arr!153)))))

(assert (=> d!52484 (= (readByteArrayLoop!0 bs!65 arr!153 from!240 to!236) lt!246938)))

(declare-fun bm!2524 () Bool)

(assert (=> bm!2524 (= call!2526 (arrayRangesEq!434 arr!153 (ite c!8364 (array!7234 (store (arr!4147 arr!153) from!240 (_1!7520 lt!246944)) (size!3270 arr!153)) arr!153) #b00000000000000000000000000000000 (ite c!8364 from!240 (size!3270 arr!153))))))

(assert (= (and d!52484 c!8364) b!157255))

(assert (= (and d!52484 (not c!8364)) b!157254))

(assert (= (or b!157255 b!157254) bm!2523))

(assert (= (or b!157255 b!157254) bm!2524))

(assert (= (or b!157255 b!157254) bm!2525))

(assert (= (and d!52484 res!131426) b!157257))

(assert (= (and b!157257 res!131425) b!157253))

(assert (= (and d!52484 (not res!131427)) b!157256))

(declare-fun m!245865 () Bool)

(assert (=> bm!2524 m!245865))

(declare-fun m!245867 () Bool)

(assert (=> bm!2524 m!245867))

(declare-fun m!245869 () Bool)

(assert (=> b!157256 m!245869))

(assert (=> b!157256 m!245409))

(declare-fun m!245871 () Bool)

(assert (=> bm!2523 m!245871))

(declare-fun m!245873 () Bool)

(assert (=> bm!2525 m!245873))

(declare-fun m!245875 () Bool)

(assert (=> b!157255 m!245875))

(declare-fun m!245877 () Bool)

(assert (=> b!157255 m!245877))

(declare-fun m!245879 () Bool)

(assert (=> b!157255 m!245879))

(declare-fun m!245881 () Bool)

(assert (=> b!157255 m!245881))

(assert (=> b!157255 m!245863))

(declare-fun m!245883 () Bool)

(assert (=> b!157255 m!245883))

(declare-fun m!245885 () Bool)

(assert (=> b!157255 m!245885))

(declare-fun m!245887 () Bool)

(assert (=> b!157255 m!245887))

(declare-fun m!245889 () Bool)

(assert (=> b!157255 m!245889))

(assert (=> b!157255 m!245515))

(declare-fun m!245891 () Bool)

(assert (=> b!157255 m!245891))

(assert (=> b!157255 m!245865))

(declare-fun m!245893 () Bool)

(assert (=> b!157255 m!245893))

(declare-fun m!245895 () Bool)

(assert (=> b!157253 m!245895))

(declare-fun m!245897 () Bool)

(assert (=> b!157254 m!245897))

(declare-fun m!245899 () Bool)

(assert (=> b!157254 m!245899))

(declare-fun m!245901 () Bool)

(assert (=> d!52484 m!245901))

(assert (=> d!52484 m!245863))

(assert (=> d!52389 d!52484))

(declare-fun d!52486 () Bool)

(assert (=> d!52486 (= (invariant!0 (currentBit!6878 bs!65) (currentByte!6883 bs!65) (size!3270 (buf!3747 bs!65))) (and (bvsge (currentBit!6878 bs!65) #b00000000000000000000000000000000) (bvslt (currentBit!6878 bs!65) #b00000000000000000000000000001000) (bvsge (currentByte!6883 bs!65) #b00000000000000000000000000000000) (or (bvslt (currentByte!6883 bs!65) (size!3270 (buf!3747 bs!65))) (and (= (currentBit!6878 bs!65) #b00000000000000000000000000000000) (= (currentByte!6883 bs!65) (size!3270 (buf!3747 bs!65)))))))))

(assert (=> d!52393 d!52486))

(declare-fun d!52488 () Bool)

(declare-fun e!106457 () Bool)

(assert (=> d!52488 e!106457))

(declare-fun res!131428 () Bool)

(assert (=> d!52488 (=> (not res!131428) (not e!106457))))

(assert (=> d!52488 (= res!131428 (moveByteIndexPrecond!0 lt!246430 #b00000000000000000000000000000001))))

(declare-fun Unit!10321 () Unit!10261)

(assert (=> d!52488 (= (moveByteIndex!0 lt!246430 #b00000000000000000000000000000001) (tuple2!14149 Unit!10321 (BitStream!5747 (buf!3747 lt!246430) (bvadd (currentByte!6883 lt!246430) #b00000000000000000000000000000001) (currentBit!6878 lt!246430))))))

(declare-fun b!157258 () Bool)

(assert (=> b!157258 (= e!106457 (and (or (not (= (bvand (currentByte!6883 lt!246430) #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000001 #b10000000000000000000000000000000))) (= (bvand (currentByte!6883 lt!246430) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!6883 lt!246430) #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (= (bvadd (currentByte!6883 lt!246430) #b00000000000000000000000000000001) (bvadd (currentByte!6883 lt!246430) #b00000000000000000000000000000001))))))

(assert (= (and d!52488 res!131428) b!157258))

(declare-fun m!245903 () Bool)

(assert (=> d!52488 m!245903))

(assert (=> d!52353 d!52488))

(declare-fun e!106458 () Bool)

(declare-fun lt!246974 () tuple3!660)

(declare-fun b!157259 () Bool)

(assert (=> b!157259 (= e!106458 (arrayRangesEq!434 lt!246431 (_3!447 lt!246974) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!246985 () (_ BitVec 32))

(declare-fun lt!246987 () array!7233)

(declare-fun call!2531 () Bool)

(declare-fun lt!246991 () tuple3!660)

(declare-fun lt!247000 () array!7233)

(declare-fun c!8365 () Bool)

(declare-fun bm!2526 () Bool)

(declare-fun lt!246994 () (_ BitVec 32))

(assert (=> bm!2526 (= call!2531 (arrayRangesEq!434 (ite c!8365 lt!246431 lt!246987) (ite c!8365 (_3!447 lt!246991) lt!247000) (ite c!8365 #b00000000000000000000000000000000 lt!246985) (ite c!8365 (bvadd #b00000000000000000000000000000001 from!240) lt!246994)))))

(declare-fun b!157260 () Bool)

(declare-fun lt!247002 () Unit!10261)

(declare-fun e!106460 () tuple3!660)

(assert (=> b!157260 (= e!106460 (tuple3!661 lt!247002 lt!246430 lt!246431))))

(declare-fun call!2530 () (_ BitVec 64))

(assert (=> b!157260 (= call!2530 call!2530)))

(declare-fun lt!246978 () Unit!10261)

(declare-fun Unit!10322 () Unit!10261)

(assert (=> b!157260 (= lt!246978 Unit!10322)))

(declare-fun lt!246999 () Unit!10261)

(assert (=> b!157260 (= lt!246999 (arrayRangesEqReflexiveLemma!43 lt!246431))))

(declare-fun call!2529 () Bool)

(assert (=> b!157260 call!2529))

(declare-fun lt!246995 () Unit!10261)

(assert (=> b!157260 (= lt!246995 lt!246999)))

(assert (=> b!157260 (= lt!246987 lt!246431)))

(assert (=> b!157260 (= lt!247000 lt!246431)))

(declare-fun lt!246979 () (_ BitVec 32))

(assert (=> b!157260 (= lt!246979 #b00000000000000000000000000000000)))

(declare-fun lt!246986 () (_ BitVec 32))

(assert (=> b!157260 (= lt!246986 (size!3270 lt!246431))))

(assert (=> b!157260 (= lt!246985 #b00000000000000000000000000000000)))

(assert (=> b!157260 (= lt!246994 (bvadd #b00000000000000000000000000000001 from!240))))

(assert (=> b!157260 (= lt!247002 (arrayRangesEqSlicedLemma!43 lt!246987 lt!247000 lt!246979 lt!246986 lt!246985 lt!246994))))

(assert (=> b!157260 call!2531))

(declare-fun b!157261 () Bool)

(declare-fun lt!247007 () Unit!10261)

(assert (=> b!157261 (= e!106460 (tuple3!661 lt!247007 (_2!7522 lt!246991) (_3!447 lt!246991)))))

(declare-fun lt!246980 () tuple2!14146)

(assert (=> b!157261 (= lt!246980 (readByte!0 lt!246430))))

(declare-fun lt!246990 () array!7233)

(assert (=> b!157261 (= lt!246990 (array!7234 (store (arr!4147 lt!246431) (bvadd #b00000000000000000000000000000001 from!240) (_1!7520 lt!246980)) (size!3270 lt!246431)))))

(declare-fun lt!246977 () (_ BitVec 64))

(assert (=> b!157261 (= lt!246977 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!246983 () (_ BitVec 32))

(assert (=> b!157261 (= lt!246983 (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!247001 () Unit!10261)

(assert (=> b!157261 (= lt!247001 (validateOffsetBytesFromBitIndexLemma!0 lt!246430 (_2!7520 lt!246980) lt!246977 lt!246983))))

(assert (=> b!157261 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3270 (buf!3747 (_2!7520 lt!246980)))) ((_ sign_extend 32) (currentByte!6883 (_2!7520 lt!246980))) ((_ sign_extend 32) (currentBit!6878 (_2!7520 lt!246980))) (bvsub lt!246983 ((_ extract 31 0) (bvsdiv (bvadd lt!246977 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!246997 () Unit!10261)

(assert (=> b!157261 (= lt!246997 lt!247001)))

(assert (=> b!157261 (= lt!246991 (readByteArrayLoop!0 (_2!7520 lt!246980) lt!246990 (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001) to!236))))

(assert (=> b!157261 (= call!2530 (bvadd (bitIndex!0 (size!3270 (buf!3747 lt!246430)) (currentByte!6883 lt!246430) (currentBit!6878 lt!246430)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!246975 () Unit!10261)

(declare-fun Unit!10323 () Unit!10261)

(assert (=> b!157261 (= lt!246975 Unit!10323)))

(assert (=> b!157261 (= (bvadd call!2530 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3270 (buf!3747 (_2!7522 lt!246991))) (currentByte!6883 (_2!7522 lt!246991)) (currentBit!6878 (_2!7522 lt!246991))))))

(declare-fun lt!246981 () Unit!10261)

(declare-fun Unit!10324 () Unit!10261)

(assert (=> b!157261 (= lt!246981 Unit!10324)))

(assert (=> b!157261 (= (bvadd (bitIndex!0 (size!3270 (buf!3747 lt!246430)) (currentByte!6883 lt!246430) (currentBit!6878 lt!246430)) (bvmul ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3270 (buf!3747 (_2!7522 lt!246991))) (currentByte!6883 (_2!7522 lt!246991)) (currentBit!6878 (_2!7522 lt!246991))))))

(declare-fun lt!246992 () Unit!10261)

(declare-fun Unit!10325 () Unit!10261)

(assert (=> b!157261 (= lt!246992 Unit!10325)))

(assert (=> b!157261 (and (= (buf!3747 lt!246430) (buf!3747 (_2!7522 lt!246991))) (= (size!3270 lt!246431) (size!3270 (_3!447 lt!246991))))))

(declare-fun lt!247006 () Unit!10261)

(declare-fun Unit!10326 () Unit!10261)

(assert (=> b!157261 (= lt!247006 Unit!10326)))

(declare-fun lt!246988 () Unit!10261)

(assert (=> b!157261 (= lt!246988 (arrayUpdatedAtPrefixLemma!43 lt!246431 (bvadd #b00000000000000000000000000000001 from!240) (_1!7520 lt!246980)))))

(assert (=> b!157261 call!2529))

(declare-fun lt!246972 () Unit!10261)

(assert (=> b!157261 (= lt!246972 lt!246988)))

(declare-fun lt!246998 () (_ BitVec 32))

(assert (=> b!157261 (= lt!246998 #b00000000000000000000000000000000)))

(declare-fun lt!246973 () Unit!10261)

(assert (=> b!157261 (= lt!246973 (arrayRangesEqTransitive!108 lt!246431 lt!246990 (_3!447 lt!246991) lt!246998 (bvadd #b00000000000000000000000000000001 from!240) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157261 (arrayRangesEq!434 lt!246431 (_3!447 lt!246991) lt!246998 (bvadd #b00000000000000000000000000000001 from!240))))

(declare-fun lt!247003 () Unit!10261)

(assert (=> b!157261 (= lt!247003 lt!246973)))

(assert (=> b!157261 call!2531))

(declare-fun lt!247004 () Unit!10261)

(declare-fun Unit!10327 () Unit!10261)

(assert (=> b!157261 (= lt!247004 Unit!10327)))

(declare-fun lt!246984 () Unit!10261)

(assert (=> b!157261 (= lt!246984 (arrayRangesEqImpliesEq!52 lt!246990 (_3!447 lt!246991) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240) (bvadd #b00000000000000000000000000000001 from!240 #b00000000000000000000000000000001)))))

(assert (=> b!157261 (= (select (store (arr!4147 lt!246431) (bvadd #b00000000000000000000000000000001 from!240) (_1!7520 lt!246980)) (bvadd #b00000000000000000000000000000001 from!240)) (select (arr!4147 (_3!447 lt!246991)) (bvadd #b00000000000000000000000000000001 from!240)))))

(declare-fun lt!246982 () Unit!10261)

(assert (=> b!157261 (= lt!246982 lt!246984)))

(declare-fun lt!246996 () Bool)

(assert (=> b!157261 (= lt!246996 (= (select (arr!4147 (_3!447 lt!246991)) (bvadd #b00000000000000000000000000000001 from!240)) (_1!7520 lt!246980)))))

(declare-fun Unit!10328 () Unit!10261)

(assert (=> b!157261 (= lt!247007 Unit!10328)))

(assert (=> b!157261 lt!246996))

(declare-fun e!106459 () Bool)

(declare-fun b!157262 () Bool)

(assert (=> b!157262 (= e!106459 (= (select (arr!4147 (_3!447 lt!246974)) (bvadd #b00000000000000000000000000000001 from!240)) (_2!7514 (readBytePure!0 lt!246430))))))

(assert (=> b!157262 (and (bvsge (bvadd #b00000000000000000000000000000001 from!240) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!240) (size!3270 (_3!447 lt!246974))))))

(declare-fun b!157263 () Bool)

(declare-fun res!131429 () Bool)

(assert (=> b!157263 (=> (not res!131429) (not e!106458))))

(assert (=> b!157263 (= res!131429 (and (= (buf!3747 lt!246430) (buf!3747 (_2!7522 lt!246974))) (= (size!3270 lt!246431) (size!3270 (_3!447 lt!246974)))))))

(declare-fun bm!2528 () Bool)

(assert (=> bm!2528 (= call!2530 (bitIndex!0 (ite c!8365 (size!3270 (buf!3747 (_2!7520 lt!246980))) (size!3270 (buf!3747 lt!246430))) (ite c!8365 (currentByte!6883 (_2!7520 lt!246980)) (currentByte!6883 lt!246430)) (ite c!8365 (currentBit!6878 (_2!7520 lt!246980)) (currentBit!6878 lt!246430))))))

(declare-fun d!52490 () Bool)

(assert (=> d!52490 e!106459))

(declare-fun res!131431 () Bool)

(assert (=> d!52490 (=> res!131431 e!106459)))

(assert (=> d!52490 (= res!131431 (bvsge (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun lt!246976 () Bool)

(assert (=> d!52490 (= lt!246976 e!106458)))

(declare-fun res!131430 () Bool)

(assert (=> d!52490 (=> (not res!131430) (not e!106458))))

(declare-fun lt!246989 () (_ BitVec 64))

(declare-fun lt!247005 () (_ BitVec 64))

(assert (=> d!52490 (= res!131430 (= (bvadd lt!247005 lt!246989) (bitIndex!0 (size!3270 (buf!3747 (_2!7522 lt!246974))) (currentByte!6883 (_2!7522 lt!246974)) (currentBit!6878 (_2!7522 lt!246974)))))))

(assert (=> d!52490 (or (not (= (bvand lt!247005 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!246989 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!247005 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!247005 lt!246989) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!246993 () (_ BitVec 64))

(assert (=> d!52490 (= lt!246989 (bvmul lt!246993 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!52490 (or (= lt!246993 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!246993 #b0000000000000000000000000000000000000000000000000000000000001000) lt!246993)))))

(assert (=> d!52490 (= lt!246993 ((_ sign_extend 32) (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240))))))

(assert (=> d!52490 (or (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!240) #b10000000000000000000000000000000)) (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 (bvadd #b00000000000000000000000000000001 from!240)) #b10000000000000000000000000000000)))))

(assert (=> d!52490 (= lt!247005 (bitIndex!0 (size!3270 (buf!3747 lt!246430)) (currentByte!6883 lt!246430) (currentBit!6878 lt!246430)))))

(assert (=> d!52490 (= lt!246974 e!106460)))

(assert (=> d!52490 (= c!8365 (bvslt (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(assert (=> d!52490 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!240)) (bvsle (bvadd #b00000000000000000000000000000001 from!240) to!236) (bvsle to!236 (size!3270 lt!246431)))))

(assert (=> d!52490 (= (readByteArrayLoop!0 lt!246430 lt!246431 (bvadd #b00000000000000000000000000000001 from!240) to!236) lt!246974)))

(declare-fun bm!2527 () Bool)

(assert (=> bm!2527 (= call!2529 (arrayRangesEq!434 lt!246431 (ite c!8365 (array!7234 (store (arr!4147 lt!246431) (bvadd #b00000000000000000000000000000001 from!240) (_1!7520 lt!246980)) (size!3270 lt!246431)) lt!246431) #b00000000000000000000000000000000 (ite c!8365 (bvadd #b00000000000000000000000000000001 from!240) (size!3270 lt!246431))))))

(assert (= (and d!52490 c!8365) b!157261))

(assert (= (and d!52490 (not c!8365)) b!157260))

(assert (= (or b!157261 b!157260) bm!2526))

(assert (= (or b!157261 b!157260) bm!2527))

(assert (= (or b!157261 b!157260) bm!2528))

(assert (= (and d!52490 res!131430) b!157263))

(assert (= (and b!157263 res!131429) b!157259))

(assert (= (and d!52490 (not res!131431)) b!157262))

(declare-fun m!245905 () Bool)

(assert (=> bm!2527 m!245905))

(declare-fun m!245907 () Bool)

(assert (=> bm!2527 m!245907))

(declare-fun m!245909 () Bool)

(assert (=> b!157262 m!245909))

(assert (=> b!157262 m!245425))

(declare-fun m!245911 () Bool)

(assert (=> bm!2526 m!245911))

(declare-fun m!245913 () Bool)

(assert (=> bm!2528 m!245913))

(declare-fun m!245915 () Bool)

(assert (=> b!157261 m!245915))

(declare-fun m!245917 () Bool)

(assert (=> b!157261 m!245917))

(declare-fun m!245919 () Bool)

(assert (=> b!157261 m!245919))

(declare-fun m!245921 () Bool)

(assert (=> b!157261 m!245921))

(assert (=> b!157261 m!245853))

(declare-fun m!245923 () Bool)

(assert (=> b!157261 m!245923))

(declare-fun m!245925 () Bool)

(assert (=> b!157261 m!245925))

(declare-fun m!245927 () Bool)

(assert (=> b!157261 m!245927))

(declare-fun m!245929 () Bool)

(assert (=> b!157261 m!245929))

(assert (=> b!157261 m!245513))

(declare-fun m!245931 () Bool)

(assert (=> b!157261 m!245931))

(assert (=> b!157261 m!245905))

(declare-fun m!245933 () Bool)

(assert (=> b!157261 m!245933))

(declare-fun m!245935 () Bool)

(assert (=> b!157259 m!245935))

(declare-fun m!245937 () Bool)

(assert (=> b!157260 m!245937))

(declare-fun m!245939 () Bool)

(assert (=> b!157260 m!245939))

(declare-fun m!245941 () Bool)

(assert (=> d!52490 m!245941))

(assert (=> d!52490 m!245853))

(assert (=> d!52385 d!52490))

(declare-fun d!52492 () Bool)

(declare-fun res!131432 () Bool)

(declare-fun e!106461 () Bool)

(assert (=> d!52492 (=> res!131432 e!106461)))

(assert (=> d!52492 (= res!131432 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!236))))

(assert (=> d!52492 (= (arrayRangesEq!434 (_2!7515 lt!246428) (_2!7515 lt!246433) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!236) e!106461)))

(declare-fun b!157264 () Bool)

(declare-fun e!106462 () Bool)

(assert (=> b!157264 (= e!106461 e!106462)))

(declare-fun res!131433 () Bool)

(assert (=> b!157264 (=> (not res!131433) (not e!106462))))

(assert (=> b!157264 (= res!131433 (= (select (arr!4147 (_2!7515 lt!246428)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4147 (_2!7515 lt!246433)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!157265 () Bool)

(assert (=> b!157265 (= e!106462 (arrayRangesEq!434 (_2!7515 lt!246428) (_2!7515 lt!246433) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!236))))

(assert (= (and d!52492 (not res!131432)) b!157264))

(assert (= (and b!157264 res!131433) b!157265))

(declare-fun m!245943 () Bool)

(assert (=> b!157264 m!245943))

(declare-fun m!245945 () Bool)

(assert (=> b!157264 m!245945))

(declare-fun m!245947 () Bool)

(assert (=> b!157265 m!245947))

(assert (=> b!157167 d!52492))

(declare-fun d!52494 () Bool)

(assert (=> d!52494 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3270 (buf!3747 lt!246430))) ((_ sign_extend 32) (currentByte!6883 lt!246430)) ((_ sign_extend 32) (currentBit!6878 lt!246430)) (bvsub (bvsub to!236 from!240) lt!246507)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!236 from!240) lt!246507)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3270 (buf!3747 lt!246430))) ((_ sign_extend 32) (currentByte!6883 lt!246430)) ((_ sign_extend 32) (currentBit!6878 lt!246430))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12894 () Bool)

(assert (= bs!12894 d!52494))

(declare-fun m!245949 () Bool)

(assert (=> bs!12894 m!245949))

(assert (=> b!157159 d!52494))

(declare-fun d!52496 () Bool)

(assert (=> d!52496 (= (remainingBits!0 ((_ sign_extend 32) (size!3270 (buf!3747 bs!65))) ((_ sign_extend 32) (currentByte!6883 bs!65)) ((_ sign_extend 32) (currentBit!6878 bs!65))) (bvsub (bvmul ((_ sign_extend 32) (size!3270 (buf!3747 bs!65))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6883 bs!65)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6878 bs!65)))))))

(assert (=> d!52381 d!52496))

(push 1)

(assert (not d!52470))

(assert (not bm!2526))

(assert (not b!157238))

(assert (not bm!2524))

(assert (not bm!2527))

(assert (not d!52466))

(assert (not d!52488))

(assert (not bm!2521))

(assert (not b!157254))

(assert (not b!157241))

(assert (not b!157259))

(assert (not d!52468))

(assert (not b!157250))

(assert (not d!52494))

(assert (not b!157244))

(assert (not d!52490))

(assert (not b!157265))

(assert (not b!157239))

(assert (not b!157255))

(assert (not b!157240))

(assert (not d!52484))

(assert (not bm!2523))

(assert (not d!52480))

(assert (not bm!2525))

(assert (not b!157260))

(assert (not bm!2522))

(assert (not b!157261))

(assert (not b!157262))

(assert (not d!52482))

(assert (not bm!2520))

(assert (not d!52478))

(assert (not bm!2528))

(assert (not b!157252))

(assert (not b!157253))

(assert (not b!157256))

(assert (not d!52474))

(check-sat)

(pop 1)

(push 1)

(check-sat)

