; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47754 () Bool)

(assert start!47754)

(declare-datatypes ((array!11421 0))(
  ( (array!11422 (arr!5985 (Array (_ BitVec 32) (_ BitVec 8))) (size!5010 (_ BitVec 32))) )
))
(declare-fun lt!363258 () array!11421)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun e!155575 () Bool)

(declare-fun b!227339 () Bool)

(declare-datatypes ((BitStream!9116 0))(
  ( (BitStream!9117 (buf!5551 array!11421) (currentByte!10389 (_ BitVec 32)) (currentBit!10384 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!16963 0))(
  ( (Unit!16964) )
))
(declare-datatypes ((tuple3!1402 0))(
  ( (tuple3!1403 (_1!10614 Unit!16963) (_2!10614 BitStream!9116) (_3!843 array!11421)) )
))
(declare-fun lt!363257 () tuple3!1402)

(declare-fun arrayRangesEq!846 (array!11421 array!11421 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227339 (= e!155575 (arrayRangesEq!846 lt!363258 (_3!843 lt!363257) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun b!227340 () Bool)

(declare-fun res!190726 () Bool)

(declare-fun e!155571 () Bool)

(assert (=> b!227340 (=> (not res!190726) (not e!155571))))

(declare-fun thiss!1870 () BitStream!9116)

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227340 (= res!190726 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5010 (buf!5551 thiss!1870))) ((_ sign_extend 32) (currentByte!10389 thiss!1870)) ((_ sign_extend 32) (currentBit!10384 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!227341 () Bool)

(assert (=> b!227341 (= e!155571 (not e!155575))))

(declare-fun res!190724 () Bool)

(assert (=> b!227341 (=> res!190724 e!155575)))

(declare-fun arr!308 () array!11421)

(assert (=> b!227341 (= res!190724 (or (bvsgt i!761 (bvadd #b00000000000000000000000000000001 i!761)) (bvsgt i!761 (size!5010 arr!308)) (bvsgt (bvadd #b00000000000000000000000000000001 i!761) (size!5010 arr!308))))))

(assert (=> b!227341 (arrayRangesEq!846 arr!308 lt!363258 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!363256 () Unit!16963)

(declare-datatypes ((tuple2!19542 0))(
  ( (tuple2!19543 (_1!10615 (_ BitVec 8)) (_2!10615 BitStream!9116)) )
))
(declare-fun lt!363262 () tuple2!19542)

(declare-fun arrayUpdatedAtPrefixLemma!405 (array!11421 (_ BitVec 32) (_ BitVec 8)) Unit!16963)

(assert (=> b!227341 (= lt!363256 (arrayUpdatedAtPrefixLemma!405 arr!308 i!761 (_1!10615 lt!363262)))))

(declare-fun lt!363264 () (_ BitVec 64))

(declare-fun lt!363261 () (_ BitVec 64))

(declare-fun lt!363259 () (_ BitVec 64))

(declare-fun lt!363263 () (_ BitVec 32))

(assert (=> b!227341 (and (= (bvadd lt!363261 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!363263))) lt!363264) (= (bvadd lt!363259 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!363264) (= (buf!5551 thiss!1870) (buf!5551 (_2!10614 lt!363257))) (= (size!5010 arr!308) (size!5010 (_3!843 lt!363257))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!227341 (= lt!363264 (bitIndex!0 (size!5010 (buf!5551 (_2!10614 lt!363257))) (currentByte!10389 (_2!10614 lt!363257)) (currentBit!10384 (_2!10614 lt!363257))))))

(assert (=> b!227341 (= lt!363261 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!363259))))

(assert (=> b!227341 (= lt!363261 (bitIndex!0 (size!5010 (buf!5551 (_2!10615 lt!363262))) (currentByte!10389 (_2!10615 lt!363262)) (currentBit!10384 (_2!10615 lt!363262))))))

(assert (=> b!227341 (= lt!363259 (bitIndex!0 (size!5010 (buf!5551 thiss!1870)) (currentByte!10389 thiss!1870) (currentBit!10384 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9116 array!11421 (_ BitVec 32) (_ BitVec 32)) tuple3!1402)

(assert (=> b!227341 (= lt!363257 (readByteArrayLoop!0 (_2!10615 lt!363262) lt!363258 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!227341 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5010 (buf!5551 (_2!10615 lt!363262)))) ((_ sign_extend 32) (currentByte!10389 (_2!10615 lt!363262))) ((_ sign_extend 32) (currentBit!10384 (_2!10615 lt!363262))) lt!363263)))

(assert (=> b!227341 (= lt!363263 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!363260 () Unit!16963)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9116 BitStream!9116 (_ BitVec 64) (_ BitVec 32)) Unit!16963)

(assert (=> b!227341 (= lt!363260 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10615 lt!363262) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!227341 (= lt!363258 (array!11422 (store (arr!5985 arr!308) i!761 (_1!10615 lt!363262)) (size!5010 arr!308)))))

(declare-fun readByte!0 (BitStream!9116) tuple2!19542)

(assert (=> b!227341 (= lt!363262 (readByte!0 thiss!1870))))

(declare-fun b!227342 () Bool)

(declare-fun res!190725 () Bool)

(assert (=> b!227342 (=> (not res!190725) (not e!155571))))

(assert (=> b!227342 (= res!190725 (bvslt i!761 to!496))))

(declare-fun res!190723 () Bool)

(assert (=> start!47754 (=> (not res!190723) (not e!155571))))

(assert (=> start!47754 (= res!190723 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5010 arr!308))))))

(assert (=> start!47754 e!155571))

(assert (=> start!47754 true))

(declare-fun array_inv!4751 (array!11421) Bool)

(assert (=> start!47754 (array_inv!4751 arr!308)))

(declare-fun e!155573 () Bool)

(declare-fun inv!12 (BitStream!9116) Bool)

(assert (=> start!47754 (and (inv!12 thiss!1870) e!155573)))

(declare-fun b!227343 () Bool)

(assert (=> b!227343 (= e!155573 (array_inv!4751 (buf!5551 thiss!1870)))))

(assert (= (and start!47754 res!190723) b!227340))

(assert (= (and b!227340 res!190726) b!227342))

(assert (= (and b!227342 res!190725) b!227341))

(assert (= (and b!227341 (not res!190724)) b!227339))

(assert (= start!47754 b!227343))

(declare-fun m!349615 () Bool)

(assert (=> b!227343 m!349615))

(declare-fun m!349617 () Bool)

(assert (=> start!47754 m!349617))

(declare-fun m!349619 () Bool)

(assert (=> start!47754 m!349619))

(declare-fun m!349621 () Bool)

(assert (=> b!227339 m!349621))

(declare-fun m!349623 () Bool)

(assert (=> b!227341 m!349623))

(declare-fun m!349625 () Bool)

(assert (=> b!227341 m!349625))

(declare-fun m!349627 () Bool)

(assert (=> b!227341 m!349627))

(declare-fun m!349629 () Bool)

(assert (=> b!227341 m!349629))

(declare-fun m!349631 () Bool)

(assert (=> b!227341 m!349631))

(declare-fun m!349633 () Bool)

(assert (=> b!227341 m!349633))

(declare-fun m!349635 () Bool)

(assert (=> b!227341 m!349635))

(declare-fun m!349637 () Bool)

(assert (=> b!227341 m!349637))

(declare-fun m!349639 () Bool)

(assert (=> b!227341 m!349639))

(declare-fun m!349641 () Bool)

(assert (=> b!227341 m!349641))

(declare-fun m!349643 () Bool)

(assert (=> b!227340 m!349643))

(push 1)

(assert (not b!227341))

(assert (not b!227339))

(assert (not start!47754))

(assert (not b!227343))

(assert (not b!227340))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!77144 () Bool)

(assert (=> d!77144 (= (array_inv!4751 arr!308) (bvsge (size!5010 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!47754 d!77144))

(declare-fun d!77146 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!77146 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10384 thiss!1870) (currentByte!10389 thiss!1870) (size!5010 (buf!5551 thiss!1870))))))

(declare-fun bs!18863 () Bool)

(assert (= bs!18863 d!77146))

(declare-fun m!349661 () Bool)

(assert (=> bs!18863 m!349661))

(assert (=> start!47754 d!77146))

(declare-fun d!77148 () Bool)

(assert (=> d!77148 (= (array_inv!4751 (buf!5551 thiss!1870)) (bvsge (size!5010 (buf!5551 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!227343 d!77148))

(declare-fun d!77150 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!77150 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5010 (buf!5551 thiss!1870))) ((_ sign_extend 32) (currentByte!10389 thiss!1870)) ((_ sign_extend 32) (currentBit!10384 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5010 (buf!5551 thiss!1870))) ((_ sign_extend 32) (currentByte!10389 thiss!1870)) ((_ sign_extend 32) (currentBit!10384 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18864 () Bool)

(assert (= bs!18864 d!77150))

(declare-fun m!349663 () Bool)

(assert (=> bs!18864 m!349663))

(assert (=> b!227340 d!77150))

(declare-fun d!77152 () Bool)

(declare-fun res!190754 () Bool)

(declare-fun e!155595 () Bool)

(assert (=> d!77152 (=> res!190754 e!155595)))

(assert (=> d!77152 (= res!190754 (= #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!77152 (= (arrayRangesEq!846 lt!363258 (_3!843 lt!363257) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) e!155595)))

(declare-fun b!227371 () Bool)

(declare-fun e!155596 () Bool)

(assert (=> b!227371 (= e!155595 e!155596)))

(declare-fun res!190755 () Bool)

(assert (=> b!227371 (=> (not res!190755) (not e!155596))))

(assert (=> b!227371 (= res!190755 (= (select (arr!5985 lt!363258) #b00000000000000000000000000000000) (select (arr!5985 (_3!843 lt!363257)) #b00000000000000000000000000000000)))))

(declare-fun b!227372 () Bool)

(assert (=> b!227372 (= e!155596 (arrayRangesEq!846 lt!363258 (_3!843 lt!363257) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (= (and d!77152 (not res!190754)) b!227371))

(assert (= (and b!227371 res!190755) b!227372))

(declare-fun m!349669 () Bool)

(assert (=> b!227371 m!349669))

(declare-fun m!349671 () Bool)

(assert (=> b!227371 m!349671))

(declare-fun m!349673 () Bool)

(assert (=> b!227372 m!349673))

(assert (=> b!227339 d!77152))

(declare-fun d!77156 () Bool)

(declare-fun e!155601 () Bool)

(assert (=> d!77156 e!155601))

(declare-fun res!190764 () Bool)

(assert (=> d!77156 (=> (not res!190764) (not e!155601))))

(declare-fun lt!363329 () (_ BitVec 64))

(declare-fun lt!363332 () (_ BitVec 64))

(declare-fun lt!363330 () (_ BitVec 64))

(assert (=> d!77156 (= res!190764 (= lt!363330 (bvsub lt!363332 lt!363329)))))

(assert (=> d!77156 (or (= (bvand lt!363332 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!363329 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!363332 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!363332 lt!363329) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77156 (= lt!363329 (remainingBits!0 ((_ sign_extend 32) (size!5010 (buf!5551 (_2!10614 lt!363257)))) ((_ sign_extend 32) (currentByte!10389 (_2!10614 lt!363257))) ((_ sign_extend 32) (currentBit!10384 (_2!10614 lt!363257)))))))

(declare-fun lt!363333 () (_ BitVec 64))

(declare-fun lt!363328 () (_ BitVec 64))

(assert (=> d!77156 (= lt!363332 (bvmul lt!363333 lt!363328))))

(assert (=> d!77156 (or (= lt!363333 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!363328 (bvsdiv (bvmul lt!363333 lt!363328) lt!363333)))))

(assert (=> d!77156 (= lt!363328 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77156 (= lt!363333 ((_ sign_extend 32) (size!5010 (buf!5551 (_2!10614 lt!363257)))))))

(assert (=> d!77156 (= lt!363330 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10389 (_2!10614 lt!363257))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10384 (_2!10614 lt!363257)))))))

(assert (=> d!77156 (invariant!0 (currentBit!10384 (_2!10614 lt!363257)) (currentByte!10389 (_2!10614 lt!363257)) (size!5010 (buf!5551 (_2!10614 lt!363257))))))

(assert (=> d!77156 (= (bitIndex!0 (size!5010 (buf!5551 (_2!10614 lt!363257))) (currentByte!10389 (_2!10614 lt!363257)) (currentBit!10384 (_2!10614 lt!363257))) lt!363330)))

(declare-fun b!227379 () Bool)

(declare-fun res!190763 () Bool)

(assert (=> b!227379 (=> (not res!190763) (not e!155601))))

(assert (=> b!227379 (= res!190763 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!363330))))

(declare-fun b!227380 () Bool)

(declare-fun lt!363331 () (_ BitVec 64))

(assert (=> b!227380 (= e!155601 (bvsle lt!363330 (bvmul lt!363331 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!227380 (or (= lt!363331 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!363331 #b0000000000000000000000000000000000000000000000000000000000001000) lt!363331)))))

(assert (=> b!227380 (= lt!363331 ((_ sign_extend 32) (size!5010 (buf!5551 (_2!10614 lt!363257)))))))

(assert (= (and d!77156 res!190764) b!227379))

(assert (= (and b!227379 res!190763) b!227380))

(declare-fun m!349681 () Bool)

(assert (=> d!77156 m!349681))

(declare-fun m!349683 () Bool)

(assert (=> d!77156 m!349683))

(assert (=> b!227341 d!77156))

(declare-fun d!77160 () Bool)

(declare-fun lt!363373 () (_ BitVec 8))

(declare-fun lt!363375 () (_ BitVec 8))

(assert (=> d!77160 (= lt!363373 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5985 (buf!5551 thiss!1870)) (currentByte!10389 thiss!1870))) ((_ sign_extend 24) lt!363375))))))

(assert (=> d!77160 (= lt!363375 ((_ extract 7 0) (currentBit!10384 thiss!1870)))))

(declare-fun e!155613 () Bool)

(assert (=> d!77160 e!155613))

(declare-fun res!190776 () Bool)

(assert (=> d!77160 (=> (not res!190776) (not e!155613))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!77160 (= res!190776 (validate_offset_bits!1 ((_ sign_extend 32) (size!5010 (buf!5551 thiss!1870))) ((_ sign_extend 32) (currentByte!10389 thiss!1870)) ((_ sign_extend 32) (currentBit!10384 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!19546 0))(
  ( (tuple2!19547 (_1!10617 Unit!16963) (_2!10617 (_ BitVec 8))) )
))
(declare-fun Unit!16969 () Unit!16963)

(declare-fun Unit!16970 () Unit!16963)

(assert (=> d!77160 (= (readByte!0 thiss!1870) (tuple2!19543 (_2!10617 (ite (bvsgt ((_ sign_extend 24) lt!363375) #b00000000000000000000000000000000) (tuple2!19547 Unit!16969 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!363373) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5985 (buf!5551 thiss!1870)) (bvadd (currentByte!10389 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!363375)))))))) (tuple2!19547 Unit!16970 lt!363373))) (BitStream!9117 (buf!5551 thiss!1870) (bvadd (currentByte!10389 thiss!1870) #b00000000000000000000000000000001) (currentBit!10384 thiss!1870))))))

(declare-fun b!227391 () Bool)

(declare-fun e!155612 () Bool)

(assert (=> b!227391 (= e!155613 e!155612)))

(declare-fun res!190777 () Bool)

(assert (=> b!227391 (=> (not res!190777) (not e!155612))))

(declare-fun lt!363374 () tuple2!19542)

(assert (=> b!227391 (= res!190777 (= (buf!5551 (_2!10615 lt!363374)) (buf!5551 thiss!1870)))))

(declare-fun lt!363369 () (_ BitVec 8))

(declare-fun lt!363371 () (_ BitVec 8))

(declare-fun Unit!16971 () Unit!16963)

(declare-fun Unit!16972 () Unit!16963)

(assert (=> b!227391 (= lt!363374 (tuple2!19543 (_2!10617 (ite (bvsgt ((_ sign_extend 24) lt!363371) #b00000000000000000000000000000000) (tuple2!19547 Unit!16971 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!363369) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5985 (buf!5551 thiss!1870)) (bvadd (currentByte!10389 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!363371)))))))) (tuple2!19547 Unit!16972 lt!363369))) (BitStream!9117 (buf!5551 thiss!1870) (bvadd (currentByte!10389 thiss!1870) #b00000000000000000000000000000001) (currentBit!10384 thiss!1870))))))

(assert (=> b!227391 (= lt!363369 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5985 (buf!5551 thiss!1870)) (currentByte!10389 thiss!1870))) ((_ sign_extend 24) lt!363371))))))

(assert (=> b!227391 (= lt!363371 ((_ extract 7 0) (currentBit!10384 thiss!1870)))))

(declare-fun lt!363370 () (_ BitVec 64))

(declare-fun lt!363372 () (_ BitVec 64))

(declare-fun b!227392 () Bool)

(assert (=> b!227392 (= e!155612 (= (bitIndex!0 (size!5010 (buf!5551 (_2!10615 lt!363374))) (currentByte!10389 (_2!10615 lt!363374)) (currentBit!10384 (_2!10615 lt!363374))) (bvadd lt!363372 lt!363370)))))

(assert (=> b!227392 (or (not (= (bvand lt!363372 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!363370 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!363372 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!363372 lt!363370) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!227392 (= lt!363370 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!227392 (= lt!363372 (bitIndex!0 (size!5010 (buf!5551 thiss!1870)) (currentByte!10389 thiss!1870) (currentBit!10384 thiss!1870)))))

(assert (= (and d!77160 res!190776) b!227391))

(assert (= (and b!227391 res!190777) b!227392))

(declare-fun m!349693 () Bool)

(assert (=> d!77160 m!349693))

(declare-fun m!349695 () Bool)

(assert (=> d!77160 m!349695))

(declare-fun m!349697 () Bool)

(assert (=> d!77160 m!349697))

(assert (=> b!227391 m!349697))

(assert (=> b!227391 m!349693))

(declare-fun m!349699 () Bool)

(assert (=> b!227392 m!349699))

(assert (=> b!227392 m!349637))

(assert (=> b!227341 d!77160))

(declare-fun b!227422 () Bool)

(declare-fun e!155633 () Bool)

(declare-fun lt!363622 () tuple3!1402)

(declare-datatypes ((tuple2!19548 0))(
  ( (tuple2!19549 (_1!10618 BitStream!9116) (_2!10618 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!9116) tuple2!19548)

(assert (=> b!227422 (= e!155633 (= (select (arr!5985 (_3!843 lt!363622)) (bvadd #b00000000000000000000000000000001 i!761)) (_2!10618 (readBytePure!0 (_2!10615 lt!363262)))))))

(assert (=> b!227422 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!5010 (_3!843 lt!363622))))))

(declare-fun d!77164 () Bool)

(assert (=> d!77164 e!155633))

(declare-fun res!190795 () Bool)

(assert (=> d!77164 (=> res!190795 e!155633)))

(assert (=> d!77164 (= res!190795 (bvsge (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!363625 () Bool)

(declare-fun e!155632 () Bool)

(assert (=> d!77164 (= lt!363625 e!155632)))

(declare-fun res!190794 () Bool)

(assert (=> d!77164 (=> (not res!190794) (not e!155632))))

(declare-fun lt!363637 () (_ BitVec 64))

(declare-fun lt!363650 () (_ BitVec 64))

(assert (=> d!77164 (= res!190794 (= (bvadd lt!363650 lt!363637) (bitIndex!0 (size!5010 (buf!5551 (_2!10614 lt!363622))) (currentByte!10389 (_2!10614 lt!363622)) (currentBit!10384 (_2!10614 lt!363622)))))))

(assert (=> d!77164 (or (not (= (bvand lt!363650 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!363637 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!363650 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!363650 lt!363637) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!363655 () (_ BitVec 64))

(assert (=> d!77164 (= lt!363637 (bvmul lt!363655 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!77164 (or (= lt!363655 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!363655 #b0000000000000000000000000000000000000000000000000000000000001000) lt!363655)))))

(assert (=> d!77164 (= lt!363655 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))))))

(assert (=> d!77164 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b10000000000000000000000000000000)))))

(assert (=> d!77164 (= lt!363650 (bitIndex!0 (size!5010 (buf!5551 (_2!10615 lt!363262))) (currentByte!10389 (_2!10615 lt!363262)) (currentBit!10384 (_2!10615 lt!363262))))))

(declare-fun e!155631 () tuple3!1402)

(assert (=> d!77164 (= lt!363622 e!155631)))

(declare-fun c!11211 () Bool)

(assert (=> d!77164 (= c!11211 (bvslt (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> d!77164 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) to!496) (bvsle to!496 (size!5010 lt!363258)))))

(assert (=> d!77164 (= (readByteArrayLoop!0 (_2!10615 lt!363262) lt!363258 (bvadd #b00000000000000000000000000000001 i!761) to!496) lt!363622)))

(declare-fun bm!3845 () Bool)

(declare-fun call!3852 () (_ BitVec 64))

(assert (=> bm!3845 (= call!3852 (bitIndex!0 (size!5010 (buf!5551 (_2!10615 lt!363262))) (currentByte!10389 (_2!10615 lt!363262)) (currentBit!10384 (_2!10615 lt!363262))))))

(declare-fun bm!3846 () Bool)

(declare-fun call!3851 () Bool)

(declare-fun lt!363621 () tuple2!19542)

(declare-fun lt!363631 () (_ BitVec 32))

(declare-fun lt!363644 () array!11421)

(declare-fun lt!363639 () array!11421)

(declare-fun lt!363629 () (_ BitVec 32))

(assert (=> bm!3846 (= call!3851 (arrayRangesEq!846 (ite c!11211 lt!363258 lt!363644) (ite c!11211 (array!11422 (store (arr!5985 lt!363258) (bvadd #b00000000000000000000000000000001 i!761) (_1!10615 lt!363621)) (size!5010 lt!363258)) lt!363639) (ite c!11211 #b00000000000000000000000000000000 lt!363629) (ite c!11211 (bvadd #b00000000000000000000000000000001 i!761) lt!363631)))))

(declare-fun b!227423 () Bool)

(declare-fun lt!363623 () Unit!16963)

(declare-fun lt!363642 () tuple3!1402)

(assert (=> b!227423 (= e!155631 (tuple3!1403 lt!363623 (_2!10614 lt!363642) (_3!843 lt!363642)))))

(assert (=> b!227423 (= lt!363621 (readByte!0 (_2!10615 lt!363262)))))

(declare-fun lt!363651 () array!11421)

(assert (=> b!227423 (= lt!363651 (array!11422 (store (arr!5985 lt!363258) (bvadd #b00000000000000000000000000000001 i!761) (_1!10615 lt!363621)) (size!5010 lt!363258)))))

(declare-fun lt!363638 () (_ BitVec 64))

(assert (=> b!227423 (= lt!363638 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!363652 () (_ BitVec 32))

(assert (=> b!227423 (= lt!363652 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!363624 () Unit!16963)

(assert (=> b!227423 (= lt!363624 (validateOffsetBytesFromBitIndexLemma!0 (_2!10615 lt!363262) (_2!10615 lt!363621) lt!363638 lt!363652))))

(assert (=> b!227423 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5010 (buf!5551 (_2!10615 lt!363621)))) ((_ sign_extend 32) (currentByte!10389 (_2!10615 lt!363621))) ((_ sign_extend 32) (currentBit!10384 (_2!10615 lt!363621))) (bvsub lt!363652 ((_ extract 31 0) (bvsdiv (bvadd lt!363638 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!363627 () Unit!16963)

(assert (=> b!227423 (= lt!363627 lt!363624)))

(assert (=> b!227423 (= lt!363642 (readByteArrayLoop!0 (_2!10615 lt!363621) lt!363651 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(assert (=> b!227423 (= (bitIndex!0 (size!5010 (buf!5551 (_2!10615 lt!363621))) (currentByte!10389 (_2!10615 lt!363621)) (currentBit!10384 (_2!10615 lt!363621))) (bvadd call!3852 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!363646 () Unit!16963)

(declare-fun Unit!16980 () Unit!16963)

(assert (=> b!227423 (= lt!363646 Unit!16980)))

(assert (=> b!227423 (= (bvadd (bitIndex!0 (size!5010 (buf!5551 (_2!10615 lt!363621))) (currentByte!10389 (_2!10615 lt!363621)) (currentBit!10384 (_2!10615 lt!363621))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!5010 (buf!5551 (_2!10614 lt!363642))) (currentByte!10389 (_2!10614 lt!363642)) (currentBit!10384 (_2!10614 lt!363642))))))

(declare-fun lt!363628 () Unit!16963)

(declare-fun Unit!16981 () Unit!16963)

(assert (=> b!227423 (= lt!363628 Unit!16981)))

(assert (=> b!227423 (= (bvadd call!3852 (bvmul ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!5010 (buf!5551 (_2!10614 lt!363642))) (currentByte!10389 (_2!10614 lt!363642)) (currentBit!10384 (_2!10614 lt!363642))))))

(declare-fun lt!363632 () Unit!16963)

(declare-fun Unit!16982 () Unit!16963)

(assert (=> b!227423 (= lt!363632 Unit!16982)))

(assert (=> b!227423 (and (= (buf!5551 (_2!10615 lt!363262)) (buf!5551 (_2!10614 lt!363642))) (= (size!5010 lt!363258) (size!5010 (_3!843 lt!363642))))))

(declare-fun lt!363647 () Unit!16963)

(declare-fun Unit!16983 () Unit!16963)

(assert (=> b!227423 (= lt!363647 Unit!16983)))

(declare-fun lt!363634 () Unit!16963)

(assert (=> b!227423 (= lt!363634 (arrayUpdatedAtPrefixLemma!405 lt!363258 (bvadd #b00000000000000000000000000000001 i!761) (_1!10615 lt!363621)))))

(assert (=> b!227423 call!3851))

(declare-fun lt!363643 () Unit!16963)

(assert (=> b!227423 (= lt!363643 lt!363634)))

(declare-fun lt!363630 () (_ BitVec 32))

(assert (=> b!227423 (= lt!363630 #b00000000000000000000000000000000)))

(declare-fun lt!363626 () Unit!16963)

(declare-fun arrayRangesEqTransitive!268 (array!11421 array!11421 array!11421 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16963)

(assert (=> b!227423 (= lt!363626 (arrayRangesEqTransitive!268 lt!363258 lt!363651 (_3!843 lt!363642) lt!363630 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!227423 (arrayRangesEq!846 lt!363258 (_3!843 lt!363642) lt!363630 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun lt!363641 () Unit!16963)

(assert (=> b!227423 (= lt!363641 lt!363626)))

(declare-fun call!3850 () Bool)

(assert (=> b!227423 call!3850))

(declare-fun lt!363649 () Unit!16963)

(declare-fun Unit!16984 () Unit!16963)

(assert (=> b!227423 (= lt!363649 Unit!16984)))

(declare-fun lt!363653 () Unit!16963)

(declare-fun arrayRangesEqImpliesEq!119 (array!11421 array!11421 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16963)

(assert (=> b!227423 (= lt!363653 (arrayRangesEqImpliesEq!119 lt!363651 (_3!843 lt!363642) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!227423 (= (select (store (arr!5985 lt!363258) (bvadd #b00000000000000000000000000000001 i!761) (_1!10615 lt!363621)) (bvadd #b00000000000000000000000000000001 i!761)) (select (arr!5985 (_3!843 lt!363642)) (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!363645 () Unit!16963)

(assert (=> b!227423 (= lt!363645 lt!363653)))

(declare-fun lt!363635 () Bool)

(assert (=> b!227423 (= lt!363635 (= (select (arr!5985 (_3!843 lt!363642)) (bvadd #b00000000000000000000000000000001 i!761)) (_1!10615 lt!363621)))))

(declare-fun Unit!16985 () Unit!16963)

(assert (=> b!227423 (= lt!363623 Unit!16985)))

(assert (=> b!227423 lt!363635))

(declare-fun bm!3847 () Bool)

(assert (=> bm!3847 (= call!3850 (arrayRangesEq!846 lt!363258 (ite c!11211 (_3!843 lt!363642) lt!363258) #b00000000000000000000000000000000 (ite c!11211 (bvadd #b00000000000000000000000000000001 i!761) (size!5010 lt!363258))))))

(declare-fun b!227424 () Bool)

(declare-fun res!190793 () Bool)

(assert (=> b!227424 (=> (not res!190793) (not e!155632))))

(assert (=> b!227424 (= res!190793 (and (= (buf!5551 (_2!10615 lt!363262)) (buf!5551 (_2!10614 lt!363622))) (= (size!5010 lt!363258) (size!5010 (_3!843 lt!363622)))))))

(declare-fun b!227425 () Bool)

(assert (=> b!227425 (= e!155632 (arrayRangesEq!846 lt!363258 (_3!843 lt!363622) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun b!227426 () Bool)

(declare-fun lt!363654 () Unit!16963)

(assert (=> b!227426 (= e!155631 (tuple3!1403 lt!363654 (_2!10615 lt!363262) lt!363258))))

(assert (=> b!227426 (= call!3852 call!3852)))

(declare-fun lt!363648 () Unit!16963)

(declare-fun Unit!16986 () Unit!16963)

(assert (=> b!227426 (= lt!363648 Unit!16986)))

(declare-fun lt!363620 () Unit!16963)

(declare-fun arrayRangesEqReflexiveLemma!134 (array!11421) Unit!16963)

(assert (=> b!227426 (= lt!363620 (arrayRangesEqReflexiveLemma!134 lt!363258))))

(assert (=> b!227426 call!3850))

(declare-fun lt!363636 () Unit!16963)

(assert (=> b!227426 (= lt!363636 lt!363620)))

(assert (=> b!227426 (= lt!363644 lt!363258)))

(assert (=> b!227426 (= lt!363639 lt!363258)))

(declare-fun lt!363633 () (_ BitVec 32))

(assert (=> b!227426 (= lt!363633 #b00000000000000000000000000000000)))

(declare-fun lt!363640 () (_ BitVec 32))

(assert (=> b!227426 (= lt!363640 (size!5010 lt!363258))))

(assert (=> b!227426 (= lt!363629 #b00000000000000000000000000000000)))

(assert (=> b!227426 (= lt!363631 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun arrayRangesEqSlicedLemma!119 (array!11421 array!11421 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16963)

(assert (=> b!227426 (= lt!363654 (arrayRangesEqSlicedLemma!119 lt!363644 lt!363639 lt!363633 lt!363640 lt!363629 lt!363631))))

(assert (=> b!227426 call!3851))

(assert (= (and d!77164 c!11211) b!227423))

(assert (= (and d!77164 (not c!11211)) b!227426))

(assert (= (or b!227423 b!227426) bm!3846))

(assert (= (or b!227423 b!227426) bm!3847))

(assert (= (or b!227423 b!227426) bm!3845))

(assert (= (and d!77164 res!190794) b!227424))

(assert (= (and b!227424 res!190793) b!227425))

(assert (= (and d!77164 (not res!190795)) b!227422))

(declare-fun m!349743 () Bool)

(assert (=> bm!3847 m!349743))

(declare-fun m!349745 () Bool)

(assert (=> b!227425 m!349745))

(declare-fun m!349747 () Bool)

(assert (=> bm!3846 m!349747))

(declare-fun m!349749 () Bool)

(assert (=> bm!3846 m!349749))

(assert (=> bm!3845 m!349641))

(declare-fun m!349751 () Bool)

(assert (=> b!227423 m!349751))

(assert (=> b!227423 m!349747))

(declare-fun m!349753 () Bool)

(assert (=> b!227423 m!349753))

(declare-fun m!349755 () Bool)

(assert (=> b!227423 m!349755))

(declare-fun m!349757 () Bool)

(assert (=> b!227423 m!349757))

(declare-fun m!349759 () Bool)

(assert (=> b!227423 m!349759))

(declare-fun m!349761 () Bool)

(assert (=> b!227423 m!349761))

(declare-fun m!349763 () Bool)

(assert (=> b!227423 m!349763))

(declare-fun m!349765 () Bool)

(assert (=> b!227423 m!349765))

(declare-fun m!349767 () Bool)

(assert (=> b!227423 m!349767))

(declare-fun m!349769 () Bool)

(assert (=> b!227423 m!349769))

(declare-fun m!349771 () Bool)

(assert (=> b!227423 m!349771))

(declare-fun m!349773 () Bool)

(assert (=> b!227423 m!349773))

(declare-fun m!349775 () Bool)

(assert (=> b!227422 m!349775))

(declare-fun m!349777 () Bool)

(assert (=> b!227422 m!349777))

(declare-fun m!349779 () Bool)

(assert (=> b!227426 m!349779))

(declare-fun m!349781 () Bool)

(assert (=> b!227426 m!349781))

(declare-fun m!349783 () Bool)

(assert (=> d!77164 m!349783))

(assert (=> d!77164 m!349641))

(assert (=> b!227341 d!77164))

(declare-fun d!77169 () Bool)

(declare-fun res!190802 () Bool)

(declare-fun e!155638 () Bool)

(assert (=> d!77169 (=> res!190802 e!155638)))

(assert (=> d!77169 (= res!190802 (= #b00000000000000000000000000000000 i!761))))

(assert (=> d!77169 (= (arrayRangesEq!846 arr!308 lt!363258 #b00000000000000000000000000000000 i!761) e!155638)))

(declare-fun b!227433 () Bool)

(declare-fun e!155639 () Bool)

(assert (=> b!227433 (= e!155638 e!155639)))

(declare-fun res!190803 () Bool)

(assert (=> b!227433 (=> (not res!190803) (not e!155639))))

(assert (=> b!227433 (= res!190803 (= (select (arr!5985 arr!308) #b00000000000000000000000000000000) (select (arr!5985 lt!363258) #b00000000000000000000000000000000)))))

(declare-fun b!227434 () Bool)

(assert (=> b!227434 (= e!155639 (arrayRangesEq!846 arr!308 lt!363258 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) i!761))))

(assert (= (and d!77169 (not res!190802)) b!227433))

(assert (= (and b!227433 res!190803) b!227434))

(declare-fun m!349785 () Bool)

(assert (=> b!227433 m!349785))

(assert (=> b!227433 m!349669))

(declare-fun m!349787 () Bool)

(assert (=> b!227434 m!349787))

(assert (=> b!227341 d!77169))

(declare-fun d!77171 () Bool)

(declare-fun e!155647 () Bool)

(assert (=> d!77171 e!155647))

(declare-fun res!190811 () Bool)

(assert (=> d!77171 (=> (not res!190811) (not e!155647))))

(assert (=> d!77171 (= res!190811 (and (bvsge i!761 #b00000000000000000000000000000000) (bvslt i!761 (size!5010 arr!308))))))

(declare-fun lt!363675 () Unit!16963)

(declare-fun choose!317 (array!11421 (_ BitVec 32) (_ BitVec 8)) Unit!16963)

(assert (=> d!77171 (= lt!363675 (choose!317 arr!308 i!761 (_1!10615 lt!363262)))))

(assert (=> d!77171 (and (bvsle #b00000000000000000000000000000000 i!761) (bvslt i!761 (size!5010 arr!308)))))

(assert (=> d!77171 (= (arrayUpdatedAtPrefixLemma!405 arr!308 i!761 (_1!10615 lt!363262)) lt!363675)))

(declare-fun b!227442 () Bool)

(assert (=> b!227442 (= e!155647 (arrayRangesEq!846 arr!308 (array!11422 (store (arr!5985 arr!308) i!761 (_1!10615 lt!363262)) (size!5010 arr!308)) #b00000000000000000000000000000000 i!761))))

(assert (= (and d!77171 res!190811) b!227442))

(declare-fun m!349797 () Bool)

(assert (=> d!77171 m!349797))

(assert (=> b!227442 m!349633))

(declare-fun m!349799 () Bool)

(assert (=> b!227442 m!349799))

(assert (=> b!227341 d!77171))

(declare-fun d!77181 () Bool)

(declare-fun e!155648 () Bool)

(assert (=> d!77181 e!155648))

(declare-fun res!190813 () Bool)

(assert (=> d!77181 (=> (not res!190813) (not e!155648))))

(declare-fun lt!363678 () (_ BitVec 64))

(declare-fun lt!363680 () (_ BitVec 64))

(declare-fun lt!363677 () (_ BitVec 64))

(assert (=> d!77181 (= res!190813 (= lt!363678 (bvsub lt!363680 lt!363677)))))

(assert (=> d!77181 (or (= (bvand lt!363680 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!363677 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!363680 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!363680 lt!363677) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77181 (= lt!363677 (remainingBits!0 ((_ sign_extend 32) (size!5010 (buf!5551 (_2!10615 lt!363262)))) ((_ sign_extend 32) (currentByte!10389 (_2!10615 lt!363262))) ((_ sign_extend 32) (currentBit!10384 (_2!10615 lt!363262)))))))

(declare-fun lt!363681 () (_ BitVec 64))

(declare-fun lt!363676 () (_ BitVec 64))

(assert (=> d!77181 (= lt!363680 (bvmul lt!363681 lt!363676))))

(assert (=> d!77181 (or (= lt!363681 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!363676 (bvsdiv (bvmul lt!363681 lt!363676) lt!363681)))))

(assert (=> d!77181 (= lt!363676 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77181 (= lt!363681 ((_ sign_extend 32) (size!5010 (buf!5551 (_2!10615 lt!363262)))))))

(assert (=> d!77181 (= lt!363678 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10389 (_2!10615 lt!363262))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10384 (_2!10615 lt!363262)))))))

(assert (=> d!77181 (invariant!0 (currentBit!10384 (_2!10615 lt!363262)) (currentByte!10389 (_2!10615 lt!363262)) (size!5010 (buf!5551 (_2!10615 lt!363262))))))

(assert (=> d!77181 (= (bitIndex!0 (size!5010 (buf!5551 (_2!10615 lt!363262))) (currentByte!10389 (_2!10615 lt!363262)) (currentBit!10384 (_2!10615 lt!363262))) lt!363678)))

(declare-fun b!227443 () Bool)

(declare-fun res!190812 () Bool)

(assert (=> b!227443 (=> (not res!190812) (not e!155648))))

(assert (=> b!227443 (= res!190812 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!363678))))

(declare-fun b!227444 () Bool)

(declare-fun lt!363679 () (_ BitVec 64))

(assert (=> b!227444 (= e!155648 (bvsle lt!363678 (bvmul lt!363679 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!227444 (or (= lt!363679 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!363679 #b0000000000000000000000000000000000000000000000000000000000001000) lt!363679)))))

(assert (=> b!227444 (= lt!363679 ((_ sign_extend 32) (size!5010 (buf!5551 (_2!10615 lt!363262)))))))

(assert (= (and d!77181 res!190813) b!227443))

(assert (= (and b!227443 res!190812) b!227444))

(declare-fun m!349801 () Bool)

(assert (=> d!77181 m!349801))

(declare-fun m!349803 () Bool)

(assert (=> d!77181 m!349803))

(assert (=> b!227341 d!77181))

(declare-fun d!77183 () Bool)

(declare-fun e!155649 () Bool)

(assert (=> d!77183 e!155649))

(declare-fun res!190815 () Bool)

(assert (=> d!77183 (=> (not res!190815) (not e!155649))))

(declare-fun lt!363684 () (_ BitVec 64))

(declare-fun lt!363683 () (_ BitVec 64))

(declare-fun lt!363686 () (_ BitVec 64))

(assert (=> d!77183 (= res!190815 (= lt!363684 (bvsub lt!363686 lt!363683)))))

(assert (=> d!77183 (or (= (bvand lt!363686 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!363683 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!363686 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!363686 lt!363683) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77183 (= lt!363683 (remainingBits!0 ((_ sign_extend 32) (size!5010 (buf!5551 thiss!1870))) ((_ sign_extend 32) (currentByte!10389 thiss!1870)) ((_ sign_extend 32) (currentBit!10384 thiss!1870))))))

(declare-fun lt!363687 () (_ BitVec 64))

(declare-fun lt!363682 () (_ BitVec 64))

(assert (=> d!77183 (= lt!363686 (bvmul lt!363687 lt!363682))))

(assert (=> d!77183 (or (= lt!363687 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!363682 (bvsdiv (bvmul lt!363687 lt!363682) lt!363687)))))

(assert (=> d!77183 (= lt!363682 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77183 (= lt!363687 ((_ sign_extend 32) (size!5010 (buf!5551 thiss!1870))))))

(assert (=> d!77183 (= lt!363684 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10389 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10384 thiss!1870))))))

(assert (=> d!77183 (invariant!0 (currentBit!10384 thiss!1870) (currentByte!10389 thiss!1870) (size!5010 (buf!5551 thiss!1870)))))

(assert (=> d!77183 (= (bitIndex!0 (size!5010 (buf!5551 thiss!1870)) (currentByte!10389 thiss!1870) (currentBit!10384 thiss!1870)) lt!363684)))

(declare-fun b!227445 () Bool)

(declare-fun res!190814 () Bool)

(assert (=> b!227445 (=> (not res!190814) (not e!155649))))

(assert (=> b!227445 (= res!190814 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!363684))))

(declare-fun b!227446 () Bool)

(declare-fun lt!363685 () (_ BitVec 64))

(assert (=> b!227446 (= e!155649 (bvsle lt!363684 (bvmul lt!363685 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!227446 (or (= lt!363685 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!363685 #b0000000000000000000000000000000000000000000000000000000000001000) lt!363685)))))

(assert (=> b!227446 (= lt!363685 ((_ sign_extend 32) (size!5010 (buf!5551 thiss!1870))))))

(assert (= (and d!77183 res!190815) b!227445))

(assert (= (and b!227445 res!190814) b!227446))

(assert (=> d!77183 m!349663))

(assert (=> d!77183 m!349661))

(assert (=> b!227341 d!77183))

(declare-fun d!77185 () Bool)

(assert (=> d!77185 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5010 (buf!5551 (_2!10615 lt!363262)))) ((_ sign_extend 32) (currentByte!10389 (_2!10615 lt!363262))) ((_ sign_extend 32) (currentBit!10384 (_2!10615 lt!363262))) lt!363263) (bvsle ((_ sign_extend 32) lt!363263) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5010 (buf!5551 (_2!10615 lt!363262)))) ((_ sign_extend 32) (currentByte!10389 (_2!10615 lt!363262))) ((_ sign_extend 32) (currentBit!10384 (_2!10615 lt!363262)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18866 () Bool)

(assert (= bs!18866 d!77185))

(assert (=> bs!18866 m!349801))

(assert (=> b!227341 d!77185))

(declare-fun d!77187 () Bool)

(declare-fun e!155657 () Bool)

(assert (=> d!77187 e!155657))

(declare-fun res!190825 () Bool)

(assert (=> d!77187 (=> (not res!190825) (not e!155657))))

(assert (=> d!77187 (= res!190825 (and (or (let ((rhs!3964 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3964 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3964) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!77188 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!77188 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!77188 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3963 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3963 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3963) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!363742 () Unit!16963)

(declare-fun choose!57 (BitStream!9116 BitStream!9116 (_ BitVec 64) (_ BitVec 32)) Unit!16963)

(assert (=> d!77187 (= lt!363742 (choose!57 thiss!1870 (_2!10615 lt!363262) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> d!77187 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10615 lt!363262) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)) lt!363742)))

(declare-fun b!227458 () Bool)

(declare-fun lt!363743 () (_ BitVec 32))

(assert (=> b!227458 (= e!155657 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5010 (buf!5551 (_2!10615 lt!363262)))) ((_ sign_extend 32) (currentByte!10389 (_2!10615 lt!363262))) ((_ sign_extend 32) (currentBit!10384 (_2!10615 lt!363262))) (bvsub (bvsub to!496 i!761) lt!363743)))))

(assert (=> b!227458 (or (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand lt!363743 #b10000000000000000000000000000000)) (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!496 i!761) lt!363743) #b10000000000000000000000000000000)))))

(declare-fun lt!363744 () (_ BitVec 64))

(assert (=> b!227458 (= lt!363743 ((_ extract 31 0) lt!363744))))

(assert (=> b!227458 (and (bvslt lt!363744 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!363744 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!227458 (= lt!363744 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!77187 res!190825) b!227458))

(declare-fun m!349855 () Bool)

(assert (=> d!77187 m!349855))

(declare-fun m!349857 () Bool)

(assert (=> b!227458 m!349857))

(assert (=> b!227341 d!77187))

(push 1)

