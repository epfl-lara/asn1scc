; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25074 () Bool)

(assert start!25074)

(declare-fun b!127073 () Bool)

(declare-fun e!83863 () Bool)

(declare-fun e!83867 () Bool)

(assert (=> b!127073 (= e!83863 e!83867)))

(declare-fun res!105328 () Bool)

(assert (=> b!127073 (=> (not res!105328) (not e!83867))))

(declare-datatypes ((array!5762 0))(
  ( (array!5763 (arr!3219 (Array (_ BitVec 32) (_ BitVec 8))) (size!2608 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4540 0))(
  ( (BitStream!4541 (buf!2993 array!5762) (currentByte!5732 (_ BitVec 32)) (currentBit!5727 (_ BitVec 32))) )
))
(declare-fun thiss!1614 () BitStream!4540)

(declare-datatypes ((Unit!7816 0))(
  ( (Unit!7817) )
))
(declare-datatypes ((tuple2!10696 0))(
  ( (tuple2!10697 (_1!5633 Unit!7816) (_2!5633 BitStream!4540)) )
))
(declare-fun lt!198313 () tuple2!10696)

(declare-fun lt!198316 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!127073 (= res!105328 (= (bitIndex!0 (size!2608 (buf!2993 (_2!5633 lt!198313))) (currentByte!5732 (_2!5633 lt!198313)) (currentBit!5727 (_2!5633 lt!198313))) (bvadd (bitIndex!0 (size!2608 (buf!2993 thiss!1614)) (currentByte!5732 thiss!1614) (currentBit!5727 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!198316))))))

(declare-fun noOfBytes!1 () (_ BitVec 32))

(assert (=> b!127073 (= lt!198316 ((_ sign_extend 32) noOfBytes!1))))

(declare-fun b!127074 () Bool)

(declare-fun res!105330 () Bool)

(assert (=> b!127074 (=> (not res!105330) (not e!83867))))

(declare-fun isPrefixOf!0 (BitStream!4540 BitStream!4540) Bool)

(assert (=> b!127074 (= res!105330 (isPrefixOf!0 thiss!1614 (_2!5633 lt!198313)))))

(declare-fun e!83865 () Bool)

(declare-datatypes ((tuple2!10698 0))(
  ( (tuple2!10699 (_1!5634 BitStream!4540) (_2!5634 array!5762)) )
))
(declare-fun lt!198320 () tuple2!10698)

(declare-fun arr!227 () array!5762)

(declare-fun b!127075 () Bool)

(declare-fun arrayRangesEq!92 (array!5762 array!5762 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!127075 (= e!83865 (not (arrayRangesEq!92 arr!227 (_2!5634 lt!198320) #b00000000000000000000000000000000 noOfBytes!1)))))

(declare-fun res!105326 () Bool)

(declare-fun e!83862 () Bool)

(assert (=> start!25074 (=> (not res!105326) (not e!83862))))

(assert (=> start!25074 (= res!105326 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2608 arr!227))))))

(assert (=> start!25074 e!83862))

(assert (=> start!25074 true))

(declare-fun array_inv!2397 (array!5762) Bool)

(assert (=> start!25074 (array_inv!2397 arr!227)))

(declare-fun e!83866 () Bool)

(declare-fun inv!12 (BitStream!4540) Bool)

(assert (=> start!25074 (and (inv!12 thiss!1614) e!83866)))

(declare-fun b!127076 () Bool)

(declare-fun res!105331 () Bool)

(assert (=> b!127076 (=> (not res!105331) (not e!83862))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!127076 (= res!105331 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2608 (buf!2993 thiss!1614))) ((_ sign_extend 32) (currentByte!5732 thiss!1614)) ((_ sign_extend 32) (currentBit!5727 thiss!1614)) noOfBytes!1))))

(declare-fun b!127077 () Bool)

(assert (=> b!127077 (= e!83867 (not e!83865))))

(declare-fun res!105329 () Bool)

(assert (=> b!127077 (=> res!105329 e!83865)))

(declare-datatypes ((tuple2!10700 0))(
  ( (tuple2!10701 (_1!5635 BitStream!4540) (_2!5635 BitStream!4540)) )
))
(declare-fun lt!198315 () tuple2!10700)

(assert (=> b!127077 (= res!105329 (or (not (= (size!2608 (_2!5634 lt!198320)) (size!2608 arr!227))) (not (= (_1!5634 lt!198320) (_2!5635 lt!198315)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4540 array!5762 (_ BitVec 32) (_ BitVec 32)) tuple2!10698)

(assert (=> b!127077 (= lt!198320 (readByteArrayLoopPure!0 (_1!5635 lt!198315) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!127077 (validate_offset_bits!1 ((_ sign_extend 32) (size!2608 (buf!2993 (_2!5633 lt!198313)))) ((_ sign_extend 32) (currentByte!5732 thiss!1614)) ((_ sign_extend 32) (currentBit!5727 thiss!1614)) lt!198316)))

(declare-fun lt!198318 () Unit!7816)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4540 array!5762 (_ BitVec 64)) Unit!7816)

(assert (=> b!127077 (= lt!198318 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2993 (_2!5633 lt!198313)) lt!198316))))

(declare-fun reader!0 (BitStream!4540 BitStream!4540) tuple2!10700)

(assert (=> b!127077 (= lt!198315 (reader!0 thiss!1614 (_2!5633 lt!198313)))))

(declare-fun b!127078 () Bool)

(assert (=> b!127078 (= e!83866 (array_inv!2397 (buf!2993 thiss!1614)))))

(declare-fun lt!198314 () (_ BitVec 64))

(declare-fun lt!198317 () (_ BitVec 64))

(declare-fun lt!198319 () (_ BitVec 64))

(declare-fun b!127079 () Bool)

(assert (=> b!127079 (= e!83862 (not (or (not (= lt!198319 (bvand lt!198314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!198319 (bvand (bvadd lt!198317 lt!198314) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!127079 (= lt!198319 (bvand lt!198317 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!127079 (= lt!198314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) noOfBytes!1)))))

(assert (=> b!127079 (= lt!198317 (bitIndex!0 (size!2608 (buf!2993 thiss!1614)) (currentByte!5732 thiss!1614) (currentBit!5727 thiss!1614)))))

(assert (=> b!127079 e!83863))

(declare-fun res!105327 () Bool)

(assert (=> b!127079 (=> (not res!105327) (not e!83863))))

(assert (=> b!127079 (= res!105327 (= (size!2608 (buf!2993 thiss!1614)) (size!2608 (buf!2993 (_2!5633 lt!198313)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4540 array!5762 (_ BitVec 32) (_ BitVec 32)) tuple2!10696)

(assert (=> b!127079 (= lt!198313 (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(assert (= (and start!25074 res!105326) b!127076))

(assert (= (and b!127076 res!105331) b!127079))

(assert (= (and b!127079 res!105327) b!127073))

(assert (= (and b!127073 res!105328) b!127074))

(assert (= (and b!127074 res!105330) b!127077))

(assert (= (and b!127077 (not res!105329)) b!127075))

(assert (= start!25074 b!127078))

(declare-fun m!192711 () Bool)

(assert (=> b!127073 m!192711))

(declare-fun m!192713 () Bool)

(assert (=> b!127073 m!192713))

(assert (=> b!127079 m!192713))

(declare-fun m!192715 () Bool)

(assert (=> b!127079 m!192715))

(declare-fun m!192717 () Bool)

(assert (=> start!25074 m!192717))

(declare-fun m!192719 () Bool)

(assert (=> start!25074 m!192719))

(declare-fun m!192721 () Bool)

(assert (=> b!127074 m!192721))

(declare-fun m!192723 () Bool)

(assert (=> b!127075 m!192723))

(declare-fun m!192725 () Bool)

(assert (=> b!127076 m!192725))

(declare-fun m!192727 () Bool)

(assert (=> b!127078 m!192727))

(declare-fun m!192729 () Bool)

(assert (=> b!127077 m!192729))

(declare-fun m!192731 () Bool)

(assert (=> b!127077 m!192731))

(declare-fun m!192733 () Bool)

(assert (=> b!127077 m!192733))

(declare-fun m!192735 () Bool)

(assert (=> b!127077 m!192735))

(push 1)

(assert (not b!127078))

(assert (not b!127074))

(assert (not b!127073))

(assert (not b!127077))

(assert (not b!127076))

(assert (not start!25074))

(assert (not b!127075))

(assert (not b!127079))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!41138 () Bool)

(declare-datatypes ((tuple3!460 0))(
  ( (tuple3!461 (_1!5642 Unit!7816) (_2!5642 BitStream!4540) (_3!285 array!5762)) )
))
(declare-fun lt!198371 () tuple3!460)

(declare-fun readByteArrayLoop!0 (BitStream!4540 array!5762 (_ BitVec 32) (_ BitVec 32)) tuple3!460)

(assert (=> d!41138 (= lt!198371 (readByteArrayLoop!0 (_1!5635 lt!198315) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(assert (=> d!41138 (= (readByteArrayLoopPure!0 (_1!5635 lt!198315) arr!227 #b00000000000000000000000000000000 noOfBytes!1) (tuple2!10699 (_2!5642 lt!198371) (_3!285 lt!198371)))))

(declare-fun bs!9986 () Bool)

(assert (= bs!9986 d!41138))

(declare-fun m!192789 () Bool)

(assert (=> bs!9986 m!192789))

(assert (=> b!127077 d!41138))

(declare-fun d!41142 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!41142 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2608 (buf!2993 (_2!5633 lt!198313)))) ((_ sign_extend 32) (currentByte!5732 thiss!1614)) ((_ sign_extend 32) (currentBit!5727 thiss!1614)) lt!198316) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2608 (buf!2993 (_2!5633 lt!198313)))) ((_ sign_extend 32) (currentByte!5732 thiss!1614)) ((_ sign_extend 32) (currentBit!5727 thiss!1614))) lt!198316))))

(declare-fun bs!9987 () Bool)

(assert (= bs!9987 d!41142))

(declare-fun m!192791 () Bool)

(assert (=> bs!9987 m!192791))

(assert (=> b!127077 d!41142))

(declare-fun d!41144 () Bool)

(assert (=> d!41144 (validate_offset_bits!1 ((_ sign_extend 32) (size!2608 (buf!2993 (_2!5633 lt!198313)))) ((_ sign_extend 32) (currentByte!5732 thiss!1614)) ((_ sign_extend 32) (currentBit!5727 thiss!1614)) lt!198316)))

(declare-fun lt!198374 () Unit!7816)

(declare-fun choose!9 (BitStream!4540 array!5762 (_ BitVec 64) BitStream!4540) Unit!7816)

(assert (=> d!41144 (= lt!198374 (choose!9 thiss!1614 (buf!2993 (_2!5633 lt!198313)) lt!198316 (BitStream!4541 (buf!2993 (_2!5633 lt!198313)) (currentByte!5732 thiss!1614) (currentBit!5727 thiss!1614))))))

(assert (=> d!41144 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2993 (_2!5633 lt!198313)) lt!198316) lt!198374)))

(declare-fun bs!9988 () Bool)

(assert (= bs!9988 d!41144))

(assert (=> bs!9988 m!192731))

(declare-fun m!192793 () Bool)

(assert (=> bs!9988 m!192793))

(assert (=> b!127077 d!41144))

(declare-fun b!127144 () Bool)

(declare-fun res!105387 () Bool)

(declare-fun e!83921 () Bool)

(assert (=> b!127144 (=> (not res!105387) (not e!83921))))

(declare-fun lt!198467 () tuple2!10700)

(assert (=> b!127144 (= res!105387 (isPrefixOf!0 (_2!5635 lt!198467) (_2!5633 lt!198313)))))

(declare-fun b!127145 () Bool)

(declare-fun e!83920 () Unit!7816)

(declare-fun lt!198461 () Unit!7816)

(assert (=> b!127145 (= e!83920 lt!198461)))

(declare-fun lt!198457 () (_ BitVec 64))

(assert (=> b!127145 (= lt!198457 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!198451 () (_ BitVec 64))

(assert (=> b!127145 (= lt!198451 (bitIndex!0 (size!2608 (buf!2993 thiss!1614)) (currentByte!5732 thiss!1614) (currentBit!5727 thiss!1614)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5762 array!5762 (_ BitVec 64) (_ BitVec 64)) Unit!7816)

(assert (=> b!127145 (= lt!198461 (arrayBitRangesEqSymmetric!0 (buf!2993 thiss!1614) (buf!2993 (_2!5633 lt!198313)) lt!198457 lt!198451))))

(declare-fun arrayBitRangesEq!0 (array!5762 array!5762 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!127145 (arrayBitRangesEq!0 (buf!2993 (_2!5633 lt!198313)) (buf!2993 thiss!1614) lt!198457 lt!198451)))

(declare-fun lt!198470 () (_ BitVec 64))

(declare-fun b!127146 () Bool)

(declare-fun lt!198468 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4540 (_ BitVec 64)) BitStream!4540)

(assert (=> b!127146 (= e!83921 (= (_1!5635 lt!198467) (withMovedBitIndex!0 (_2!5635 lt!198467) (bvsub lt!198468 lt!198470))))))

(assert (=> b!127146 (or (= (bvand lt!198468 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!198470 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!198468 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!198468 lt!198470) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!127146 (= lt!198470 (bitIndex!0 (size!2608 (buf!2993 (_2!5633 lt!198313))) (currentByte!5732 (_2!5633 lt!198313)) (currentBit!5727 (_2!5633 lt!198313))))))

(assert (=> b!127146 (= lt!198468 (bitIndex!0 (size!2608 (buf!2993 thiss!1614)) (currentByte!5732 thiss!1614) (currentBit!5727 thiss!1614)))))

(declare-fun d!41146 () Bool)

(assert (=> d!41146 e!83921))

(declare-fun res!105386 () Bool)

(assert (=> d!41146 (=> (not res!105386) (not e!83921))))

(assert (=> d!41146 (= res!105386 (isPrefixOf!0 (_1!5635 lt!198467) (_2!5635 lt!198467)))))

(declare-fun lt!198465 () BitStream!4540)

(assert (=> d!41146 (= lt!198467 (tuple2!10701 lt!198465 (_2!5633 lt!198313)))))

(declare-fun lt!198463 () Unit!7816)

(declare-fun lt!198454 () Unit!7816)

(assert (=> d!41146 (= lt!198463 lt!198454)))

(assert (=> d!41146 (isPrefixOf!0 lt!198465 (_2!5633 lt!198313))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4540 BitStream!4540 BitStream!4540) Unit!7816)

(assert (=> d!41146 (= lt!198454 (lemmaIsPrefixTransitive!0 lt!198465 (_2!5633 lt!198313) (_2!5633 lt!198313)))))

(declare-fun lt!198456 () Unit!7816)

(declare-fun lt!198466 () Unit!7816)

(assert (=> d!41146 (= lt!198456 lt!198466)))

(assert (=> d!41146 (isPrefixOf!0 lt!198465 (_2!5633 lt!198313))))

(assert (=> d!41146 (= lt!198466 (lemmaIsPrefixTransitive!0 lt!198465 thiss!1614 (_2!5633 lt!198313)))))

(declare-fun lt!198462 () Unit!7816)

(assert (=> d!41146 (= lt!198462 e!83920)))

(declare-fun c!7497 () Bool)

(assert (=> d!41146 (= c!7497 (not (= (size!2608 (buf!2993 thiss!1614)) #b00000000000000000000000000000000)))))

(declare-fun lt!198453 () Unit!7816)

(declare-fun lt!198469 () Unit!7816)

(assert (=> d!41146 (= lt!198453 lt!198469)))

(assert (=> d!41146 (isPrefixOf!0 (_2!5633 lt!198313) (_2!5633 lt!198313))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4540) Unit!7816)

(assert (=> d!41146 (= lt!198469 (lemmaIsPrefixRefl!0 (_2!5633 lt!198313)))))

(declare-fun lt!198458 () Unit!7816)

(declare-fun lt!198452 () Unit!7816)

(assert (=> d!41146 (= lt!198458 lt!198452)))

(assert (=> d!41146 (= lt!198452 (lemmaIsPrefixRefl!0 (_2!5633 lt!198313)))))

(declare-fun lt!198464 () Unit!7816)

(declare-fun lt!198459 () Unit!7816)

(assert (=> d!41146 (= lt!198464 lt!198459)))

(assert (=> d!41146 (isPrefixOf!0 lt!198465 lt!198465)))

(assert (=> d!41146 (= lt!198459 (lemmaIsPrefixRefl!0 lt!198465))))

(declare-fun lt!198455 () Unit!7816)

(declare-fun lt!198460 () Unit!7816)

(assert (=> d!41146 (= lt!198455 lt!198460)))

(assert (=> d!41146 (isPrefixOf!0 thiss!1614 thiss!1614)))

(assert (=> d!41146 (= lt!198460 (lemmaIsPrefixRefl!0 thiss!1614))))

(assert (=> d!41146 (= lt!198465 (BitStream!4541 (buf!2993 (_2!5633 lt!198313)) (currentByte!5732 thiss!1614) (currentBit!5727 thiss!1614)))))

(assert (=> d!41146 (isPrefixOf!0 thiss!1614 (_2!5633 lt!198313))))

(assert (=> d!41146 (= (reader!0 thiss!1614 (_2!5633 lt!198313)) lt!198467)))

(declare-fun b!127147 () Bool)

(declare-fun Unit!7822 () Unit!7816)

(assert (=> b!127147 (= e!83920 Unit!7822)))

(declare-fun b!127148 () Bool)

(declare-fun res!105388 () Bool)

(assert (=> b!127148 (=> (not res!105388) (not e!83921))))

(assert (=> b!127148 (= res!105388 (isPrefixOf!0 (_1!5635 lt!198467) thiss!1614))))

(assert (= (and d!41146 c!7497) b!127145))

(assert (= (and d!41146 (not c!7497)) b!127147))

(assert (= (and d!41146 res!105386) b!127148))

(assert (= (and b!127148 res!105388) b!127144))

(assert (= (and b!127144 res!105387) b!127146))

(assert (=> b!127145 m!192713))

(declare-fun m!192803 () Bool)

(assert (=> b!127145 m!192803))

(declare-fun m!192805 () Bool)

(assert (=> b!127145 m!192805))

(declare-fun m!192807 () Bool)

(assert (=> b!127148 m!192807))

(declare-fun m!192809 () Bool)

(assert (=> d!41146 m!192809))

(declare-fun m!192811 () Bool)

(assert (=> d!41146 m!192811))

(declare-fun m!192813 () Bool)

(assert (=> d!41146 m!192813))

(assert (=> d!41146 m!192721))

(declare-fun m!192815 () Bool)

(assert (=> d!41146 m!192815))

(declare-fun m!192817 () Bool)

(assert (=> d!41146 m!192817))

(declare-fun m!192819 () Bool)

(assert (=> d!41146 m!192819))

(declare-fun m!192821 () Bool)

(assert (=> d!41146 m!192821))

(declare-fun m!192823 () Bool)

(assert (=> d!41146 m!192823))

(declare-fun m!192825 () Bool)

(assert (=> d!41146 m!192825))

(declare-fun m!192827 () Bool)

(assert (=> d!41146 m!192827))

(declare-fun m!192829 () Bool)

(assert (=> b!127144 m!192829))

(declare-fun m!192831 () Bool)

(assert (=> b!127146 m!192831))

(assert (=> b!127146 m!192711))

(assert (=> b!127146 m!192713))

(assert (=> b!127077 d!41146))

(declare-fun d!41154 () Bool)

(assert (=> d!41154 (= (array_inv!2397 (buf!2993 thiss!1614)) (bvsge (size!2608 (buf!2993 thiss!1614)) #b00000000000000000000000000000000))))

(assert (=> b!127078 d!41154))

(declare-fun d!41156 () Bool)

(declare-fun e!83924 () Bool)

(assert (=> d!41156 e!83924))

(declare-fun res!105394 () Bool)

(assert (=> d!41156 (=> (not res!105394) (not e!83924))))

(declare-fun lt!198487 () (_ BitVec 64))

(declare-fun lt!198484 () (_ BitVec 64))

(declare-fun lt!198486 () (_ BitVec 64))

(assert (=> d!41156 (= res!105394 (= lt!198484 (bvsub lt!198486 lt!198487)))))

(assert (=> d!41156 (or (= (bvand lt!198486 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!198487 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!198486 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!198486 lt!198487) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!41156 (= lt!198487 (remainingBits!0 ((_ sign_extend 32) (size!2608 (buf!2993 (_2!5633 lt!198313)))) ((_ sign_extend 32) (currentByte!5732 (_2!5633 lt!198313))) ((_ sign_extend 32) (currentBit!5727 (_2!5633 lt!198313)))))))

(declare-fun lt!198488 () (_ BitVec 64))

(declare-fun lt!198483 () (_ BitVec 64))

(assert (=> d!41156 (= lt!198486 (bvmul lt!198488 lt!198483))))

(assert (=> d!41156 (or (= lt!198488 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!198483 (bvsdiv (bvmul lt!198488 lt!198483) lt!198488)))))

(assert (=> d!41156 (= lt!198483 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!41156 (= lt!198488 ((_ sign_extend 32) (size!2608 (buf!2993 (_2!5633 lt!198313)))))))

(assert (=> d!41156 (= lt!198484 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5732 (_2!5633 lt!198313))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5727 (_2!5633 lt!198313)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!41156 (invariant!0 (currentBit!5727 (_2!5633 lt!198313)) (currentByte!5732 (_2!5633 lt!198313)) (size!2608 (buf!2993 (_2!5633 lt!198313))))))

(assert (=> d!41156 (= (bitIndex!0 (size!2608 (buf!2993 (_2!5633 lt!198313))) (currentByte!5732 (_2!5633 lt!198313)) (currentBit!5727 (_2!5633 lt!198313))) lt!198484)))

(declare-fun b!127153 () Bool)

(declare-fun res!105393 () Bool)

(assert (=> b!127153 (=> (not res!105393) (not e!83924))))

(assert (=> b!127153 (= res!105393 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!198484))))

(declare-fun b!127154 () Bool)

(declare-fun lt!198485 () (_ BitVec 64))

(assert (=> b!127154 (= e!83924 (bvsle lt!198484 (bvmul lt!198485 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!127154 (or (= lt!198485 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!198485 #b0000000000000000000000000000000000000000000000000000000000001000) lt!198485)))))

(assert (=> b!127154 (= lt!198485 ((_ sign_extend 32) (size!2608 (buf!2993 (_2!5633 lt!198313)))))))

(assert (= (and d!41156 res!105394) b!127153))

(assert (= (and b!127153 res!105393) b!127154))

(declare-fun m!192833 () Bool)

(assert (=> d!41156 m!192833))

(declare-fun m!192835 () Bool)

(assert (=> d!41156 m!192835))

(assert (=> b!127073 d!41156))

(declare-fun d!41158 () Bool)

(declare-fun e!83925 () Bool)

(assert (=> d!41158 e!83925))

(declare-fun res!105396 () Bool)

(assert (=> d!41158 (=> (not res!105396) (not e!83925))))

(declare-fun lt!198492 () (_ BitVec 64))

(declare-fun lt!198490 () (_ BitVec 64))

(declare-fun lt!198493 () (_ BitVec 64))

(assert (=> d!41158 (= res!105396 (= lt!198490 (bvsub lt!198492 lt!198493)))))

(assert (=> d!41158 (or (= (bvand lt!198492 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!198493 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!198492 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!198492 lt!198493) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!41158 (= lt!198493 (remainingBits!0 ((_ sign_extend 32) (size!2608 (buf!2993 thiss!1614))) ((_ sign_extend 32) (currentByte!5732 thiss!1614)) ((_ sign_extend 32) (currentBit!5727 thiss!1614))))))

(declare-fun lt!198494 () (_ BitVec 64))

(declare-fun lt!198489 () (_ BitVec 64))

(assert (=> d!41158 (= lt!198492 (bvmul lt!198494 lt!198489))))

(assert (=> d!41158 (or (= lt!198494 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!198489 (bvsdiv (bvmul lt!198494 lt!198489) lt!198494)))))

(assert (=> d!41158 (= lt!198489 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!41158 (= lt!198494 ((_ sign_extend 32) (size!2608 (buf!2993 thiss!1614))))))

(assert (=> d!41158 (= lt!198490 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5732 thiss!1614)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5727 thiss!1614))))))

(assert (=> d!41158 (invariant!0 (currentBit!5727 thiss!1614) (currentByte!5732 thiss!1614) (size!2608 (buf!2993 thiss!1614)))))

(assert (=> d!41158 (= (bitIndex!0 (size!2608 (buf!2993 thiss!1614)) (currentByte!5732 thiss!1614) (currentBit!5727 thiss!1614)) lt!198490)))

(declare-fun b!127155 () Bool)

(declare-fun res!105395 () Bool)

(assert (=> b!127155 (=> (not res!105395) (not e!83925))))

(assert (=> b!127155 (= res!105395 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!198490))))

(declare-fun b!127156 () Bool)

(declare-fun lt!198491 () (_ BitVec 64))

(assert (=> b!127156 (= e!83925 (bvsle lt!198490 (bvmul lt!198491 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!127156 (or (= lt!198491 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!198491 #b0000000000000000000000000000000000000000000000000000000000001000) lt!198491)))))

(assert (=> b!127156 (= lt!198491 ((_ sign_extend 32) (size!2608 (buf!2993 thiss!1614))))))

(assert (= (and d!41158 res!105396) b!127155))

(assert (= (and b!127155 res!105395) b!127156))

(declare-fun m!192837 () Bool)

(assert (=> d!41158 m!192837))

(declare-fun m!192839 () Bool)

(assert (=> d!41158 m!192839))

(assert (=> b!127073 d!41158))

(assert (=> b!127079 d!41158))

(declare-fun b!127223 () Bool)

(declare-fun res!105465 () Bool)

(declare-fun e!83971 () Bool)

(assert (=> b!127223 (=> (not res!105465) (not e!83971))))

(declare-fun lt!198586 () (_ BitVec 64))

(declare-fun lt!198591 () tuple2!10696)

(declare-fun lt!198592 () (_ BitVec 64))

(assert (=> b!127223 (= res!105465 (= (bitIndex!0 (size!2608 (buf!2993 (_2!5633 lt!198591))) (currentByte!5732 (_2!5633 lt!198591)) (currentBit!5727 (_2!5633 lt!198591))) (bvadd lt!198586 lt!198592)))))

(assert (=> b!127223 (or (not (= (bvand lt!198586 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!198592 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!198586 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!198586 lt!198592) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!198588 () (_ BitVec 64))

(assert (=> b!127223 (= lt!198592 (bvmul lt!198588 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!127223 (or (= lt!198588 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!198588 #b0000000000000000000000000000000000000000000000000000000000001000) lt!198588)))))

(assert (=> b!127223 (= lt!198588 ((_ sign_extend 32) (bvsub noOfBytes!1 #b00000000000000000000000000000000)))))

(assert (=> b!127223 (or (= (bvand noOfBytes!1 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand noOfBytes!1 #b10000000000000000000000000000000) (bvand (bvsub noOfBytes!1 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!127223 (= lt!198586 (bitIndex!0 (size!2608 (buf!2993 thiss!1614)) (currentByte!5732 thiss!1614) (currentBit!5727 thiss!1614)))))

(declare-fun b!127224 () Bool)

(declare-fun res!105467 () Bool)

(assert (=> b!127224 (=> (not res!105467) (not e!83971))))

(assert (=> b!127224 (= res!105467 (isPrefixOf!0 thiss!1614 (_2!5633 lt!198591)))))

(declare-fun b!127225 () Bool)

(declare-fun e!83969 () Bool)

(assert (=> b!127225 (= e!83971 e!83969)))

(declare-fun res!105463 () Bool)

(assert (=> b!127225 (=> (not res!105463) (not e!83969))))

(declare-fun lt!198589 () tuple2!10700)

(declare-fun lt!198587 () tuple2!10698)

(assert (=> b!127225 (= res!105463 (and (= (size!2608 (_2!5634 lt!198587)) (size!2608 arr!227)) (= (_1!5634 lt!198587) (_2!5635 lt!198589))))))

(assert (=> b!127225 (= lt!198587 (readByteArrayLoopPure!0 (_1!5635 lt!198589) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun lt!198585 () Unit!7816)

(declare-fun lt!198593 () Unit!7816)

(assert (=> b!127225 (= lt!198585 lt!198593)))

(declare-fun lt!198590 () (_ BitVec 64))

(assert (=> b!127225 (validate_offset_bits!1 ((_ sign_extend 32) (size!2608 (buf!2993 (_2!5633 lt!198591)))) ((_ sign_extend 32) (currentByte!5732 thiss!1614)) ((_ sign_extend 32) (currentBit!5727 thiss!1614)) lt!198590)))

(assert (=> b!127225 (= lt!198593 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2993 (_2!5633 lt!198591)) lt!198590))))

(declare-fun e!83970 () Bool)

(assert (=> b!127225 e!83970))

(declare-fun res!105466 () Bool)

(assert (=> b!127225 (=> (not res!105466) (not e!83970))))

(assert (=> b!127225 (= res!105466 (and (= (size!2608 (buf!2993 thiss!1614)) (size!2608 (buf!2993 (_2!5633 lt!198591)))) (bvsge lt!198590 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!127225 (= lt!198590 ((_ sign_extend 32) (bvsub noOfBytes!1 #b00000000000000000000000000000000)))))

(assert (=> b!127225 (or (= (bvand noOfBytes!1 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand noOfBytes!1 #b10000000000000000000000000000000) (bvand (bvsub noOfBytes!1 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!127225 (= lt!198589 (reader!0 thiss!1614 (_2!5633 lt!198591)))))

(declare-fun b!127226 () Bool)

(assert (=> b!127226 (= e!83969 (arrayRangesEq!92 arr!227 (_2!5634 lt!198587) #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun d!41160 () Bool)

(assert (=> d!41160 e!83971))

(declare-fun res!105464 () Bool)

(assert (=> d!41160 (=> (not res!105464) (not e!83971))))

(assert (=> d!41160 (= res!105464 (= (size!2608 (buf!2993 thiss!1614)) (size!2608 (buf!2993 (_2!5633 lt!198591)))))))

(declare-fun choose!64 (BitStream!4540 array!5762 (_ BitVec 32) (_ BitVec 32)) tuple2!10696)

(assert (=> d!41160 (= lt!198591 (choose!64 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(assert (=> d!41160 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2608 arr!227)))))

(assert (=> d!41160 (= (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1) lt!198591)))

(declare-fun b!127227 () Bool)

(assert (=> b!127227 (= e!83970 (validate_offset_bits!1 ((_ sign_extend 32) (size!2608 (buf!2993 thiss!1614))) ((_ sign_extend 32) (currentByte!5732 thiss!1614)) ((_ sign_extend 32) (currentBit!5727 thiss!1614)) lt!198590))))

(assert (= (and d!41160 res!105464) b!127223))

(assert (= (and b!127223 res!105465) b!127224))

(assert (= (and b!127224 res!105467) b!127225))

(assert (= (and b!127225 res!105466) b!127227))

(assert (= (and b!127225 res!105463) b!127226))

(declare-fun m!192903 () Bool)

(assert (=> b!127224 m!192903))

(declare-fun m!192905 () Bool)

(assert (=> b!127223 m!192905))

(assert (=> b!127223 m!192713))

(declare-fun m!192907 () Bool)

(assert (=> d!41160 m!192907))

(declare-fun m!192909 () Bool)

(assert (=> b!127226 m!192909))

(declare-fun m!192911 () Bool)

(assert (=> b!127225 m!192911))

(declare-fun m!192913 () Bool)

(assert (=> b!127225 m!192913))

(declare-fun m!192915 () Bool)

(assert (=> b!127225 m!192915))

(declare-fun m!192917 () Bool)

(assert (=> b!127225 m!192917))

(declare-fun m!192919 () Bool)

(assert (=> b!127227 m!192919))

(assert (=> b!127079 d!41160))

(declare-fun d!41200 () Bool)

(declare-fun res!105475 () Bool)

(declare-fun e!83976 () Bool)

(assert (=> d!41200 (=> (not res!105475) (not e!83976))))

(assert (=> d!41200 (= res!105475 (= (size!2608 (buf!2993 thiss!1614)) (size!2608 (buf!2993 (_2!5633 lt!198313)))))))

(assert (=> d!41200 (= (isPrefixOf!0 thiss!1614 (_2!5633 lt!198313)) e!83976)))

(declare-fun b!127234 () Bool)

(declare-fun res!105476 () Bool)

(assert (=> b!127234 (=> (not res!105476) (not e!83976))))

(assert (=> b!127234 (= res!105476 (bvsle (bitIndex!0 (size!2608 (buf!2993 thiss!1614)) (currentByte!5732 thiss!1614) (currentBit!5727 thiss!1614)) (bitIndex!0 (size!2608 (buf!2993 (_2!5633 lt!198313))) (currentByte!5732 (_2!5633 lt!198313)) (currentBit!5727 (_2!5633 lt!198313)))))))

(declare-fun b!127235 () Bool)

(declare-fun e!83977 () Bool)

(assert (=> b!127235 (= e!83976 e!83977)))

(declare-fun res!105474 () Bool)

(assert (=> b!127235 (=> res!105474 e!83977)))

(assert (=> b!127235 (= res!105474 (= (size!2608 (buf!2993 thiss!1614)) #b00000000000000000000000000000000))))

(declare-fun b!127236 () Bool)

(assert (=> b!127236 (= e!83977 (arrayBitRangesEq!0 (buf!2993 thiss!1614) (buf!2993 (_2!5633 lt!198313)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2608 (buf!2993 thiss!1614)) (currentByte!5732 thiss!1614) (currentBit!5727 thiss!1614))))))

(assert (= (and d!41200 res!105475) b!127234))

(assert (= (and b!127234 res!105476) b!127235))

(assert (= (and b!127235 (not res!105474)) b!127236))

(assert (=> b!127234 m!192713))

(assert (=> b!127234 m!192711))

(assert (=> b!127236 m!192713))

(assert (=> b!127236 m!192713))

(declare-fun m!192921 () Bool)

(assert (=> b!127236 m!192921))

(assert (=> b!127074 d!41200))

(declare-fun d!41202 () Bool)

(declare-fun res!105481 () Bool)

(declare-fun e!83984 () Bool)

(assert (=> d!41202 (=> res!105481 e!83984)))

(assert (=> d!41202 (= res!105481 (= #b00000000000000000000000000000000 noOfBytes!1))))

(assert (=> d!41202 (= (arrayRangesEq!92 arr!227 (_2!5634 lt!198320) #b00000000000000000000000000000000 noOfBytes!1) e!83984)))

(declare-fun b!127245 () Bool)

(declare-fun e!83985 () Bool)

(assert (=> b!127245 (= e!83984 e!83985)))

(declare-fun res!105482 () Bool)

(assert (=> b!127245 (=> (not res!105482) (not e!83985))))

(assert (=> b!127245 (= res!105482 (= (select (arr!3219 arr!227) #b00000000000000000000000000000000) (select (arr!3219 (_2!5634 lt!198320)) #b00000000000000000000000000000000)))))

(declare-fun b!127246 () Bool)

(assert (=> b!127246 (= e!83985 (arrayRangesEq!92 arr!227 (_2!5634 lt!198320) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) noOfBytes!1))))

(assert (= (and d!41202 (not res!105481)) b!127245))

(assert (= (and b!127245 res!105482) b!127246))

(declare-fun m!192923 () Bool)

(assert (=> b!127245 m!192923))

(declare-fun m!192925 () Bool)

(assert (=> b!127245 m!192925))

(declare-fun m!192927 () Bool)

(assert (=> b!127246 m!192927))

(assert (=> b!127075 d!41202))

(declare-fun d!41204 () Bool)

(assert (=> d!41204 (= (array_inv!2397 arr!227) (bvsge (size!2608 arr!227) #b00000000000000000000000000000000))))

(assert (=> start!25074 d!41204))

(declare-fun d!41206 () Bool)

(assert (=> d!41206 (= (inv!12 thiss!1614) (invariant!0 (currentBit!5727 thiss!1614) (currentByte!5732 thiss!1614) (size!2608 (buf!2993 thiss!1614))))))

(declare-fun bs!9998 () Bool)

(assert (= bs!9998 d!41206))

(assert (=> bs!9998 m!192839))

(assert (=> start!25074 d!41206))

(declare-fun d!41208 () Bool)

(assert (=> d!41208 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2608 (buf!2993 thiss!1614))) ((_ sign_extend 32) (currentByte!5732 thiss!1614)) ((_ sign_extend 32) (currentBit!5727 thiss!1614)) noOfBytes!1) (bvsle ((_ sign_extend 32) noOfBytes!1) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2608 (buf!2993 thiss!1614))) ((_ sign_extend 32) (currentByte!5732 thiss!1614)) ((_ sign_extend 32) (currentBit!5727 thiss!1614))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!9999 () Bool)

(assert (= bs!9999 d!41208))

(assert (=> bs!9999 m!192837))

(assert (=> b!127076 d!41208))

(push 1)

(assert (not b!127148))

(assert (not b!127236))

(assert (not b!127145))

(assert (not d!41158))

(assert (not b!127223))

(assert (not d!41208))

(assert (not b!127246))

(assert (not b!127224))

(assert (not d!41138))

(assert (not d!41160))

(assert (not d!41146))

(assert (not d!41142))

(assert (not b!127226))

(assert (not d!41206))

(assert (not d!41144))

(assert (not b!127146))

(assert (not d!41156))

(assert (not b!127225))

(assert (not b!127144))

(assert (not b!127234))

(assert (not b!127227))

(check-sat)

(pop 1)

(push 1)

(check-sat)

