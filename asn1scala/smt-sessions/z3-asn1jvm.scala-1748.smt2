; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48016 () Bool)

(assert start!48016)

(declare-fun b!228253 () Bool)

(declare-fun res!191469 () Bool)

(declare-fun e!156385 () Bool)

(assert (=> b!228253 (=> (not res!191469) (not e!156385))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!228253 (= res!191469 (bvslt i!761 to!496))))

(declare-datatypes ((array!11512 0))(
  ( (array!11513 (arr!6035 (Array (_ BitVec 32) (_ BitVec 8))) (size!5051 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9198 0))(
  ( (BitStream!9199 (buf!5592 array!11512) (currentByte!10448 (_ BitVec 32)) (currentBit!10443 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!17142 0))(
  ( (Unit!17143) )
))
(declare-datatypes ((tuple3!1484 0))(
  ( (tuple3!1485 (_1!10715 Unit!17142) (_2!10715 BitStream!9198) (_3!884 array!11512)) )
))
(declare-fun lt!366145 () tuple3!1484)

(declare-fun thiss!1870 () BitStream!9198)

(declare-fun b!228254 () Bool)

(declare-datatypes ((tuple2!19662 0))(
  ( (tuple2!19663 (_1!10716 BitStream!9198) (_2!10716 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!9198) tuple2!19662)

(assert (=> b!228254 (= e!156385 (not (= (select (arr!6035 (_3!884 lt!366145)) i!761) (_2!10716 (readBytePure!0 thiss!1870)))))))

(declare-datatypes ((tuple2!19664 0))(
  ( (tuple2!19665 (_1!10717 (_ BitVec 8)) (_2!10717 BitStream!9198)) )
))
(declare-fun lt!366139 () tuple2!19664)

(assert (=> b!228254 (and (= (_1!10717 lt!366139) (select (arr!6035 (_3!884 lt!366145)) i!761)) (= (select (arr!6035 (_3!884 lt!366145)) i!761) (_1!10717 lt!366139)))))

(declare-fun lt!366143 () array!11512)

(declare-fun lt!366137 () Unit!17142)

(declare-fun arrayRangesEqImpliesEq!143 (array!11512 array!11512 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17142)

(assert (=> b!228254 (= lt!366137 (arrayRangesEqImpliesEq!143 lt!366143 (_3!884 lt!366145) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun arr!308 () array!11512)

(declare-fun arrayRangesEq!887 (array!11512 array!11512 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!228254 (arrayRangesEq!887 arr!308 (_3!884 lt!366145) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!366142 () Unit!17142)

(declare-fun arrayRangesEqTransitive!310 (array!11512 array!11512 array!11512 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17142)

(assert (=> b!228254 (= lt!366142 (arrayRangesEqTransitive!310 arr!308 lt!366143 (_3!884 lt!366145) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!228254 (arrayRangesEq!887 arr!308 lt!366143 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!366147 () Unit!17142)

(declare-fun arrayUpdatedAtPrefixLemma!446 (array!11512 (_ BitVec 32) (_ BitVec 8)) Unit!17142)

(assert (=> b!228254 (= lt!366147 (arrayUpdatedAtPrefixLemma!446 arr!308 i!761 (_1!10717 lt!366139)))))

(declare-fun lt!366146 () (_ BitVec 64))

(declare-fun lt!366144 () (_ BitVec 64))

(declare-fun lt!366140 () (_ BitVec 32))

(declare-fun lt!366138 () (_ BitVec 64))

(assert (=> b!228254 (and (= (bvadd lt!366138 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!366140))) lt!366144) (= (bvadd lt!366146 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!366144) (= (buf!5592 thiss!1870) (buf!5592 (_2!10715 lt!366145))) (= (size!5051 arr!308) (size!5051 (_3!884 lt!366145))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!228254 (= lt!366144 (bitIndex!0 (size!5051 (buf!5592 (_2!10715 lt!366145))) (currentByte!10448 (_2!10715 lt!366145)) (currentBit!10443 (_2!10715 lt!366145))))))

(assert (=> b!228254 (= lt!366138 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!366146))))

(assert (=> b!228254 (= lt!366138 (bitIndex!0 (size!5051 (buf!5592 (_2!10717 lt!366139))) (currentByte!10448 (_2!10717 lt!366139)) (currentBit!10443 (_2!10717 lt!366139))))))

(assert (=> b!228254 (= lt!366146 (bitIndex!0 (size!5051 (buf!5592 thiss!1870)) (currentByte!10448 thiss!1870) (currentBit!10443 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9198 array!11512 (_ BitVec 32) (_ BitVec 32)) tuple3!1484)

(assert (=> b!228254 (= lt!366145 (readByteArrayLoop!0 (_2!10717 lt!366139) lt!366143 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!228254 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5051 (buf!5592 (_2!10717 lt!366139)))) ((_ sign_extend 32) (currentByte!10448 (_2!10717 lt!366139))) ((_ sign_extend 32) (currentBit!10443 (_2!10717 lt!366139))) lt!366140)))

(assert (=> b!228254 (= lt!366140 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!366141 () Unit!17142)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9198 BitStream!9198 (_ BitVec 64) (_ BitVec 32)) Unit!17142)

(assert (=> b!228254 (= lt!366141 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10717 lt!366139) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!228254 (= lt!366143 (array!11513 (store (arr!6035 arr!308) i!761 (_1!10717 lt!366139)) (size!5051 arr!308)))))

(declare-fun readByte!0 (BitStream!9198) tuple2!19664)

(assert (=> b!228254 (= lt!366139 (readByte!0 thiss!1870))))

(declare-fun b!228252 () Bool)

(declare-fun res!191470 () Bool)

(assert (=> b!228252 (=> (not res!191470) (not e!156385))))

(assert (=> b!228252 (= res!191470 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5051 (buf!5592 thiss!1870))) ((_ sign_extend 32) (currentByte!10448 thiss!1870)) ((_ sign_extend 32) (currentBit!10443 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun res!191468 () Bool)

(assert (=> start!48016 (=> (not res!191468) (not e!156385))))

(assert (=> start!48016 (= res!191468 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5051 arr!308))))))

(assert (=> start!48016 e!156385))

(assert (=> start!48016 true))

(declare-fun array_inv!4792 (array!11512) Bool)

(assert (=> start!48016 (array_inv!4792 arr!308)))

(declare-fun e!156388 () Bool)

(declare-fun inv!12 (BitStream!9198) Bool)

(assert (=> start!48016 (and (inv!12 thiss!1870) e!156388)))

(declare-fun b!228255 () Bool)

(assert (=> b!228255 (= e!156388 (array_inv!4792 (buf!5592 thiss!1870)))))

(assert (= (and start!48016 res!191468) b!228252))

(assert (= (and b!228252 res!191470) b!228253))

(assert (= (and b!228253 res!191469) b!228254))

(assert (= start!48016 b!228255))

(declare-fun m!351759 () Bool)

(assert (=> b!228254 m!351759))

(declare-fun m!351761 () Bool)

(assert (=> b!228254 m!351761))

(declare-fun m!351763 () Bool)

(assert (=> b!228254 m!351763))

(declare-fun m!351765 () Bool)

(assert (=> b!228254 m!351765))

(declare-fun m!351767 () Bool)

(assert (=> b!228254 m!351767))

(declare-fun m!351769 () Bool)

(assert (=> b!228254 m!351769))

(declare-fun m!351771 () Bool)

(assert (=> b!228254 m!351771))

(declare-fun m!351773 () Bool)

(assert (=> b!228254 m!351773))

(declare-fun m!351775 () Bool)

(assert (=> b!228254 m!351775))

(declare-fun m!351777 () Bool)

(assert (=> b!228254 m!351777))

(declare-fun m!351779 () Bool)

(assert (=> b!228254 m!351779))

(declare-fun m!351781 () Bool)

(assert (=> b!228254 m!351781))

(declare-fun m!351783 () Bool)

(assert (=> b!228254 m!351783))

(declare-fun m!351785 () Bool)

(assert (=> b!228254 m!351785))

(declare-fun m!351787 () Bool)

(assert (=> b!228254 m!351787))

(declare-fun m!351789 () Bool)

(assert (=> b!228252 m!351789))

(declare-fun m!351791 () Bool)

(assert (=> start!48016 m!351791))

(declare-fun m!351793 () Bool)

(assert (=> start!48016 m!351793))

(declare-fun m!351795 () Bool)

(assert (=> b!228255 m!351795))

(check-sat (not b!228254) (not b!228255) (not b!228252) (not start!48016))
(check-sat)
(get-model)

(declare-fun d!77439 () Bool)

(declare-fun e!156454 () Bool)

(assert (=> d!77439 e!156454))

(declare-fun res!191545 () Bool)

(assert (=> d!77439 (=> res!191545 e!156454)))

(assert (=> d!77439 (= res!191545 (bvsge (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!366427 () Bool)

(declare-fun e!156453 () Bool)

(assert (=> d!77439 (= lt!366427 e!156453)))

(declare-fun res!191546 () Bool)

(assert (=> d!77439 (=> (not res!191546) (not e!156453))))

(declare-fun lt!366414 () tuple3!1484)

(declare-fun lt!366416 () (_ BitVec 64))

(declare-fun lt!366400 () (_ BitVec 64))

(assert (=> d!77439 (= res!191546 (= (bvadd lt!366416 lt!366400) (bitIndex!0 (size!5051 (buf!5592 (_2!10715 lt!366414))) (currentByte!10448 (_2!10715 lt!366414)) (currentBit!10443 (_2!10715 lt!366414)))))))

(assert (=> d!77439 (or (not (= (bvand lt!366416 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!366400 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!366416 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!366416 lt!366400) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!366411 () (_ BitVec 64))

(assert (=> d!77439 (= lt!366400 (bvmul lt!366411 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!77439 (or (= lt!366411 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!366411 #b0000000000000000000000000000000000000000000000000000000000001000) lt!366411)))))

(assert (=> d!77439 (= lt!366411 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))))))

(assert (=> d!77439 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b10000000000000000000000000000000)))))

(assert (=> d!77439 (= lt!366416 (bitIndex!0 (size!5051 (buf!5592 (_2!10717 lt!366139))) (currentByte!10448 (_2!10717 lt!366139)) (currentBit!10443 (_2!10717 lt!366139))))))

(declare-fun e!156455 () tuple3!1484)

(assert (=> d!77439 (= lt!366414 e!156455)))

(declare-fun c!11233 () Bool)

(assert (=> d!77439 (= c!11233 (bvslt (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> d!77439 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) to!496) (bvsle to!496 (size!5051 lt!366143)))))

(assert (=> d!77439 (= (readByteArrayLoop!0 (_2!10717 lt!366139) lt!366143 (bvadd #b00000000000000000000000000000001 i!761) to!496) lt!366414)))

(declare-fun bm!3913 () Bool)

(declare-fun call!3918 () (_ BitVec 64))

(assert (=> bm!3913 (= call!3918 (bitIndex!0 (size!5051 (buf!5592 (_2!10717 lt!366139))) (currentByte!10448 (_2!10717 lt!366139)) (currentBit!10443 (_2!10717 lt!366139))))))

(declare-fun bm!3914 () Bool)

(declare-fun lt!366409 () tuple3!1484)

(declare-fun call!3916 () Bool)

(assert (=> bm!3914 (= call!3916 (arrayRangesEq!887 lt!366143 (ite c!11233 (_3!884 lt!366409) lt!366143) #b00000000000000000000000000000000 (ite c!11233 (bvadd #b00000000000000000000000000000001 i!761) (size!5051 lt!366143))))))

(declare-fun b!228334 () Bool)

(assert (=> b!228334 (= e!156454 (= (select (arr!6035 (_3!884 lt!366414)) (bvadd #b00000000000000000000000000000001 i!761)) (_2!10716 (readBytePure!0 (_2!10717 lt!366139)))))))

(assert (=> b!228334 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!5051 (_3!884 lt!366414))))))

(declare-fun call!3917 () Bool)

(declare-fun lt!366417 () (_ BitVec 32))

(declare-fun lt!366424 () array!11512)

(declare-fun lt!366410 () (_ BitVec 32))

(declare-fun bm!3915 () Bool)

(declare-fun lt!366415 () (_ BitVec 32))

(declare-fun lt!366397 () array!11512)

(assert (=> bm!3915 (= call!3917 (arrayRangesEq!887 (ite c!11233 lt!366143 lt!366424) (ite c!11233 (_3!884 lt!366409) lt!366397) (ite c!11233 lt!366415 lt!366410) (ite c!11233 (bvadd #b00000000000000000000000000000001 i!761) lt!366417)))))

(declare-fun b!228335 () Bool)

(declare-fun res!191544 () Bool)

(assert (=> b!228335 (=> (not res!191544) (not e!156453))))

(assert (=> b!228335 (= res!191544 (and (= (buf!5592 (_2!10717 lt!366139)) (buf!5592 (_2!10715 lt!366414))) (= (size!5051 lt!366143) (size!5051 (_3!884 lt!366414)))))))

(declare-fun lt!366426 () Unit!17142)

(declare-fun b!228336 () Bool)

(assert (=> b!228336 (= e!156455 (tuple3!1485 lt!366426 (_2!10717 lt!366139) lt!366143))))

(assert (=> b!228336 (= call!3918 call!3918)))

(declare-fun lt!366413 () Unit!17142)

(declare-fun Unit!17148 () Unit!17142)

(assert (=> b!228336 (= lt!366413 Unit!17148)))

(declare-fun lt!366423 () Unit!17142)

(declare-fun arrayRangesEqReflexiveLemma!142 (array!11512) Unit!17142)

(assert (=> b!228336 (= lt!366423 (arrayRangesEqReflexiveLemma!142 lt!366143))))

(assert (=> b!228336 call!3916))

(declare-fun lt!366421 () Unit!17142)

(assert (=> b!228336 (= lt!366421 lt!366423)))

(assert (=> b!228336 (= lt!366424 lt!366143)))

(assert (=> b!228336 (= lt!366397 lt!366143)))

(declare-fun lt!366402 () (_ BitVec 32))

(assert (=> b!228336 (= lt!366402 #b00000000000000000000000000000000)))

(declare-fun lt!366422 () (_ BitVec 32))

(assert (=> b!228336 (= lt!366422 (size!5051 lt!366143))))

(assert (=> b!228336 (= lt!366410 #b00000000000000000000000000000000)))

(assert (=> b!228336 (= lt!366417 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun arrayRangesEqSlicedLemma!127 (array!11512 array!11512 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17142)

(assert (=> b!228336 (= lt!366426 (arrayRangesEqSlicedLemma!127 lt!366424 lt!366397 lt!366402 lt!366422 lt!366410 lt!366417))))

(assert (=> b!228336 call!3917))

(declare-fun b!228337 () Bool)

(declare-fun lt!366407 () Unit!17142)

(assert (=> b!228337 (= e!156455 (tuple3!1485 lt!366407 (_2!10715 lt!366409) (_3!884 lt!366409)))))

(declare-fun lt!366431 () tuple2!19664)

(assert (=> b!228337 (= lt!366431 (readByte!0 (_2!10717 lt!366139)))))

(declare-fun lt!366405 () array!11512)

(assert (=> b!228337 (= lt!366405 (array!11513 (store (arr!6035 lt!366143) (bvadd #b00000000000000000000000000000001 i!761) (_1!10717 lt!366431)) (size!5051 lt!366143)))))

(declare-fun lt!366406 () (_ BitVec 64))

(assert (=> b!228337 (= lt!366406 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!366430 () (_ BitVec 32))

(assert (=> b!228337 (= lt!366430 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!366412 () Unit!17142)

(assert (=> b!228337 (= lt!366412 (validateOffsetBytesFromBitIndexLemma!0 (_2!10717 lt!366139) (_2!10717 lt!366431) lt!366406 lt!366430))))

(assert (=> b!228337 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5051 (buf!5592 (_2!10717 lt!366431)))) ((_ sign_extend 32) (currentByte!10448 (_2!10717 lt!366431))) ((_ sign_extend 32) (currentBit!10443 (_2!10717 lt!366431))) (bvsub lt!366430 ((_ extract 31 0) (bvsdiv (bvadd lt!366406 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!366420 () Unit!17142)

(assert (=> b!228337 (= lt!366420 lt!366412)))

(assert (=> b!228337 (= lt!366409 (readByteArrayLoop!0 (_2!10717 lt!366431) lt!366405 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(assert (=> b!228337 (= (bitIndex!0 (size!5051 (buf!5592 (_2!10717 lt!366431))) (currentByte!10448 (_2!10717 lt!366431)) (currentBit!10443 (_2!10717 lt!366431))) (bvadd call!3918 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!366425 () Unit!17142)

(declare-fun Unit!17151 () Unit!17142)

(assert (=> b!228337 (= lt!366425 Unit!17151)))

(assert (=> b!228337 (= (bvadd (bitIndex!0 (size!5051 (buf!5592 (_2!10717 lt!366431))) (currentByte!10448 (_2!10717 lt!366431)) (currentBit!10443 (_2!10717 lt!366431))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!5051 (buf!5592 (_2!10715 lt!366409))) (currentByte!10448 (_2!10715 lt!366409)) (currentBit!10443 (_2!10715 lt!366409))))))

(declare-fun lt!366398 () Unit!17142)

(declare-fun Unit!17152 () Unit!17142)

(assert (=> b!228337 (= lt!366398 Unit!17152)))

(assert (=> b!228337 (= (bvadd call!3918 (bvmul ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!5051 (buf!5592 (_2!10715 lt!366409))) (currentByte!10448 (_2!10715 lt!366409)) (currentBit!10443 (_2!10715 lt!366409))))))

(declare-fun lt!366429 () Unit!17142)

(declare-fun Unit!17153 () Unit!17142)

(assert (=> b!228337 (= lt!366429 Unit!17153)))

(assert (=> b!228337 (and (= (buf!5592 (_2!10717 lt!366139)) (buf!5592 (_2!10715 lt!366409))) (= (size!5051 lt!366143) (size!5051 (_3!884 lt!366409))))))

(declare-fun lt!366399 () Unit!17142)

(declare-fun Unit!17154 () Unit!17142)

(assert (=> b!228337 (= lt!366399 Unit!17154)))

(declare-fun lt!366418 () Unit!17142)

(assert (=> b!228337 (= lt!366418 (arrayUpdatedAtPrefixLemma!446 lt!366143 (bvadd #b00000000000000000000000000000001 i!761) (_1!10717 lt!366431)))))

(assert (=> b!228337 (arrayRangesEq!887 lt!366143 (array!11513 (store (arr!6035 lt!366143) (bvadd #b00000000000000000000000000000001 i!761) (_1!10717 lt!366431)) (size!5051 lt!366143)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun lt!366401 () Unit!17142)

(assert (=> b!228337 (= lt!366401 lt!366418)))

(assert (=> b!228337 (= lt!366415 #b00000000000000000000000000000000)))

(declare-fun lt!366432 () Unit!17142)

(assert (=> b!228337 (= lt!366432 (arrayRangesEqTransitive!310 lt!366143 lt!366405 (_3!884 lt!366409) lt!366415 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!228337 call!3917))

(declare-fun lt!366428 () Unit!17142)

(assert (=> b!228337 (= lt!366428 lt!366432)))

(assert (=> b!228337 call!3916))

(declare-fun lt!366403 () Unit!17142)

(declare-fun Unit!17155 () Unit!17142)

(assert (=> b!228337 (= lt!366403 Unit!17155)))

(declare-fun lt!366408 () Unit!17142)

(assert (=> b!228337 (= lt!366408 (arrayRangesEqImpliesEq!143 lt!366405 (_3!884 lt!366409) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!228337 (= (select (store (arr!6035 lt!366143) (bvadd #b00000000000000000000000000000001 i!761) (_1!10717 lt!366431)) (bvadd #b00000000000000000000000000000001 i!761)) (select (arr!6035 (_3!884 lt!366409)) (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!366404 () Unit!17142)

(assert (=> b!228337 (= lt!366404 lt!366408)))

(declare-fun lt!366419 () Bool)

(assert (=> b!228337 (= lt!366419 (= (select (arr!6035 (_3!884 lt!366409)) (bvadd #b00000000000000000000000000000001 i!761)) (_1!10717 lt!366431)))))

(declare-fun Unit!17156 () Unit!17142)

(assert (=> b!228337 (= lt!366407 Unit!17156)))

(assert (=> b!228337 lt!366419))

(declare-fun b!228338 () Bool)

(assert (=> b!228338 (= e!156453 (arrayRangesEq!887 lt!366143 (_3!884 lt!366414) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (= (and d!77439 c!11233) b!228337))

(assert (= (and d!77439 (not c!11233)) b!228336))

(assert (= (or b!228337 b!228336) bm!3914))

(assert (= (or b!228337 b!228336) bm!3915))

(assert (= (or b!228337 b!228336) bm!3913))

(assert (= (and d!77439 res!191546) b!228335))

(assert (= (and b!228335 res!191544) b!228338))

(assert (= (and d!77439 (not res!191545)) b!228334))

(declare-fun m!351915 () Bool)

(assert (=> bm!3914 m!351915))

(declare-fun m!351917 () Bool)

(assert (=> b!228334 m!351917))

(declare-fun m!351919 () Bool)

(assert (=> b!228334 m!351919))

(declare-fun m!351921 () Bool)

(assert (=> b!228338 m!351921))

(declare-fun m!351923 () Bool)

(assert (=> d!77439 m!351923))

(assert (=> d!77439 m!351779))

(declare-fun m!351925 () Bool)

(assert (=> bm!3915 m!351925))

(declare-fun m!351927 () Bool)

(assert (=> b!228336 m!351927))

(declare-fun m!351929 () Bool)

(assert (=> b!228336 m!351929))

(declare-fun m!351931 () Bool)

(assert (=> b!228337 m!351931))

(declare-fun m!351933 () Bool)

(assert (=> b!228337 m!351933))

(declare-fun m!351935 () Bool)

(assert (=> b!228337 m!351935))

(declare-fun m!351937 () Bool)

(assert (=> b!228337 m!351937))

(declare-fun m!351939 () Bool)

(assert (=> b!228337 m!351939))

(declare-fun m!351941 () Bool)

(assert (=> b!228337 m!351941))

(declare-fun m!351943 () Bool)

(assert (=> b!228337 m!351943))

(declare-fun m!351945 () Bool)

(assert (=> b!228337 m!351945))

(declare-fun m!351947 () Bool)

(assert (=> b!228337 m!351947))

(declare-fun m!351949 () Bool)

(assert (=> b!228337 m!351949))

(declare-fun m!351951 () Bool)

(assert (=> b!228337 m!351951))

(declare-fun m!351953 () Bool)

(assert (=> b!228337 m!351953))

(declare-fun m!351955 () Bool)

(assert (=> b!228337 m!351955))

(assert (=> bm!3913 m!351779))

(assert (=> b!228254 d!77439))

(declare-fun d!77505 () Bool)

(assert (=> d!77505 (arrayRangesEq!887 arr!308 (_3!884 lt!366145) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!366435 () Unit!17142)

(declare-fun choose!336 (array!11512 array!11512 array!11512 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17142)

(assert (=> d!77505 (= lt!366435 (choose!336 arr!308 lt!366143 (_3!884 lt!366145) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!77505 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!77505 (= (arrayRangesEqTransitive!310 arr!308 lt!366143 (_3!884 lt!366145) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)) lt!366435)))

(declare-fun bs!18951 () Bool)

(assert (= bs!18951 d!77505))

(assert (=> bs!18951 m!351787))

(declare-fun m!351957 () Bool)

(assert (=> bs!18951 m!351957))

(assert (=> b!228254 d!77505))

(declare-fun d!77507 () Bool)

(declare-fun lt!366455 () (_ BitVec 8))

(declare-fun lt!366454 () (_ BitVec 8))

(assert (=> d!77507 (= lt!366455 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!6035 (buf!5592 thiss!1870)) (currentByte!10448 thiss!1870))) ((_ sign_extend 24) lt!366454))))))

(assert (=> d!77507 (= lt!366454 ((_ extract 7 0) (currentBit!10443 thiss!1870)))))

(declare-fun e!156460 () Bool)

(assert (=> d!77507 e!156460))

(declare-fun res!191553 () Bool)

(assert (=> d!77507 (=> (not res!191553) (not e!156460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!77507 (= res!191553 (validate_offset_bits!1 ((_ sign_extend 32) (size!5051 (buf!5592 thiss!1870))) ((_ sign_extend 32) (currentByte!10448 thiss!1870)) ((_ sign_extend 32) (currentBit!10443 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!19674 0))(
  ( (tuple2!19675 (_1!10723 Unit!17142) (_2!10723 (_ BitVec 8))) )
))
(declare-fun Unit!17161 () Unit!17142)

(declare-fun Unit!17162 () Unit!17142)

(assert (=> d!77507 (= (readByte!0 thiss!1870) (tuple2!19665 (_2!10723 (ite (bvsgt ((_ sign_extend 24) lt!366454) #b00000000000000000000000000000000) (tuple2!19675 Unit!17161 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!366455) (bvlshr (bvand ((_ sign_extend 24) (select (arr!6035 (buf!5592 thiss!1870)) (bvadd (currentByte!10448 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!366454)))))))) (tuple2!19675 Unit!17162 lt!366455))) (BitStream!9199 (buf!5592 thiss!1870) (bvadd (currentByte!10448 thiss!1870) #b00000000000000000000000000000001) (currentBit!10443 thiss!1870))))))

(declare-fun b!228343 () Bool)

(declare-fun e!156461 () Bool)

(assert (=> b!228343 (= e!156460 e!156461)))

(declare-fun res!191552 () Bool)

(assert (=> b!228343 (=> (not res!191552) (not e!156461))))

(declare-fun lt!366452 () tuple2!19664)

(assert (=> b!228343 (= res!191552 (= (buf!5592 (_2!10717 lt!366452)) (buf!5592 thiss!1870)))))

(declare-fun lt!366450 () (_ BitVec 8))

(declare-fun lt!366456 () (_ BitVec 8))

(declare-fun Unit!17163 () Unit!17142)

(declare-fun Unit!17164 () Unit!17142)

(assert (=> b!228343 (= lt!366452 (tuple2!19665 (_2!10723 (ite (bvsgt ((_ sign_extend 24) lt!366456) #b00000000000000000000000000000000) (tuple2!19675 Unit!17163 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!366450) (bvlshr (bvand ((_ sign_extend 24) (select (arr!6035 (buf!5592 thiss!1870)) (bvadd (currentByte!10448 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!366456)))))))) (tuple2!19675 Unit!17164 lt!366450))) (BitStream!9199 (buf!5592 thiss!1870) (bvadd (currentByte!10448 thiss!1870) #b00000000000000000000000000000001) (currentBit!10443 thiss!1870))))))

(assert (=> b!228343 (= lt!366450 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!6035 (buf!5592 thiss!1870)) (currentByte!10448 thiss!1870))) ((_ sign_extend 24) lt!366456))))))

(assert (=> b!228343 (= lt!366456 ((_ extract 7 0) (currentBit!10443 thiss!1870)))))

(declare-fun lt!366453 () (_ BitVec 64))

(declare-fun b!228344 () Bool)

(declare-fun lt!366451 () (_ BitVec 64))

(assert (=> b!228344 (= e!156461 (= (bitIndex!0 (size!5051 (buf!5592 (_2!10717 lt!366452))) (currentByte!10448 (_2!10717 lt!366452)) (currentBit!10443 (_2!10717 lt!366452))) (bvadd lt!366453 lt!366451)))))

(assert (=> b!228344 (or (not (= (bvand lt!366453 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!366451 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!366453 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!366453 lt!366451) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!228344 (= lt!366451 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!228344 (= lt!366453 (bitIndex!0 (size!5051 (buf!5592 thiss!1870)) (currentByte!10448 thiss!1870) (currentBit!10443 thiss!1870)))))

(assert (= (and d!77507 res!191553) b!228343))

(assert (= (and b!228343 res!191552) b!228344))

(declare-fun m!351959 () Bool)

(assert (=> d!77507 m!351959))

(declare-fun m!351961 () Bool)

(assert (=> d!77507 m!351961))

(declare-fun m!351963 () Bool)

(assert (=> d!77507 m!351963))

(assert (=> b!228343 m!351963))

(assert (=> b!228343 m!351959))

(declare-fun m!351965 () Bool)

(assert (=> b!228344 m!351965))

(assert (=> b!228344 m!351781))

(assert (=> b!228254 d!77507))

(declare-fun d!77509 () Bool)

(declare-fun lt!366459 () tuple2!19664)

(assert (=> d!77509 (= lt!366459 (readByte!0 thiss!1870))))

(assert (=> d!77509 (= (readBytePure!0 thiss!1870) (tuple2!19663 (_2!10717 lt!366459) (_1!10717 lt!366459)))))

(declare-fun bs!18952 () Bool)

(assert (= bs!18952 d!77509))

(assert (=> bs!18952 m!351759))

(assert (=> b!228254 d!77509))

(declare-fun d!77511 () Bool)

(declare-fun e!156464 () Bool)

(assert (=> d!77511 e!156464))

(declare-fun res!191556 () Bool)

(assert (=> d!77511 (=> (not res!191556) (not e!156464))))

(assert (=> d!77511 (= res!191556 (and (or (let ((rhs!4034 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!4034 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!4034) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!77512 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!77512 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!77512 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!4033 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!4033 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!4033) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!366467 () Unit!17142)

(declare-fun choose!57 (BitStream!9198 BitStream!9198 (_ BitVec 64) (_ BitVec 32)) Unit!17142)

(assert (=> d!77511 (= lt!366467 (choose!57 thiss!1870 (_2!10717 lt!366139) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> d!77511 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10717 lt!366139) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)) lt!366467)))

(declare-fun b!228347 () Bool)

(declare-fun lt!366466 () (_ BitVec 32))

(assert (=> b!228347 (= e!156464 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5051 (buf!5592 (_2!10717 lt!366139)))) ((_ sign_extend 32) (currentByte!10448 (_2!10717 lt!366139))) ((_ sign_extend 32) (currentBit!10443 (_2!10717 lt!366139))) (bvsub (bvsub to!496 i!761) lt!366466)))))

(assert (=> b!228347 (or (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand lt!366466 #b10000000000000000000000000000000)) (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!496 i!761) lt!366466) #b10000000000000000000000000000000)))))

(declare-fun lt!366468 () (_ BitVec 64))

(assert (=> b!228347 (= lt!366466 ((_ extract 31 0) lt!366468))))

(assert (=> b!228347 (and (bvslt lt!366468 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!366468 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!228347 (= lt!366468 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!77511 res!191556) b!228347))

(declare-fun m!351967 () Bool)

(assert (=> d!77511 m!351967))

(declare-fun m!351969 () Bool)

(assert (=> b!228347 m!351969))

(assert (=> b!228254 d!77511))

(declare-fun d!77514 () Bool)

(declare-fun e!156469 () Bool)

(assert (=> d!77514 e!156469))

(declare-fun res!191562 () Bool)

(assert (=> d!77514 (=> (not res!191562) (not e!156469))))

(declare-fun lt!366549 () (_ BitVec 64))

(declare-fun lt!366548 () (_ BitVec 64))

(declare-fun lt!366550 () (_ BitVec 64))

(assert (=> d!77514 (= res!191562 (= lt!366549 (bvsub lt!366548 lt!366550)))))

(assert (=> d!77514 (or (= (bvand lt!366548 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!366550 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!366548 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!366548 lt!366550) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!77514 (= lt!366550 (remainingBits!0 ((_ sign_extend 32) (size!5051 (buf!5592 thiss!1870))) ((_ sign_extend 32) (currentByte!10448 thiss!1870)) ((_ sign_extend 32) (currentBit!10443 thiss!1870))))))

(declare-fun lt!366547 () (_ BitVec 64))

(declare-fun lt!366545 () (_ BitVec 64))

(assert (=> d!77514 (= lt!366548 (bvmul lt!366547 lt!366545))))

(assert (=> d!77514 (or (= lt!366547 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!366545 (bvsdiv (bvmul lt!366547 lt!366545) lt!366547)))))

(assert (=> d!77514 (= lt!366545 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77514 (= lt!366547 ((_ sign_extend 32) (size!5051 (buf!5592 thiss!1870))))))

(assert (=> d!77514 (= lt!366549 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10448 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10443 thiss!1870))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!77514 (invariant!0 (currentBit!10443 thiss!1870) (currentByte!10448 thiss!1870) (size!5051 (buf!5592 thiss!1870)))))

(assert (=> d!77514 (= (bitIndex!0 (size!5051 (buf!5592 thiss!1870)) (currentByte!10448 thiss!1870) (currentBit!10443 thiss!1870)) lt!366549)))

(declare-fun b!228356 () Bool)

(declare-fun res!191561 () Bool)

(assert (=> b!228356 (=> (not res!191561) (not e!156469))))

(assert (=> b!228356 (= res!191561 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!366549))))

(declare-fun b!228357 () Bool)

(declare-fun lt!366546 () (_ BitVec 64))

(assert (=> b!228357 (= e!156469 (bvsle lt!366549 (bvmul lt!366546 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!228357 (or (= lt!366546 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!366546 #b0000000000000000000000000000000000000000000000000000000000001000) lt!366546)))))

(assert (=> b!228357 (= lt!366546 ((_ sign_extend 32) (size!5051 (buf!5592 thiss!1870))))))

(assert (= (and d!77514 res!191562) b!228356))

(assert (= (and b!228356 res!191561) b!228357))

(declare-fun m!351971 () Bool)

(assert (=> d!77514 m!351971))

(declare-fun m!351973 () Bool)

(assert (=> d!77514 m!351973))

(assert (=> b!228254 d!77514))

(declare-fun d!77516 () Bool)

(declare-fun res!191567 () Bool)

(declare-fun e!156474 () Bool)

(assert (=> d!77516 (=> res!191567 e!156474)))

(assert (=> d!77516 (= res!191567 (= #b00000000000000000000000000000000 i!761))))

(assert (=> d!77516 (= (arrayRangesEq!887 arr!308 (_3!884 lt!366145) #b00000000000000000000000000000000 i!761) e!156474)))

(declare-fun b!228362 () Bool)

(declare-fun e!156475 () Bool)

(assert (=> b!228362 (= e!156474 e!156475)))

(declare-fun res!191568 () Bool)

(assert (=> b!228362 (=> (not res!191568) (not e!156475))))

(assert (=> b!228362 (= res!191568 (= (select (arr!6035 arr!308) #b00000000000000000000000000000000) (select (arr!6035 (_3!884 lt!366145)) #b00000000000000000000000000000000)))))

(declare-fun b!228363 () Bool)

(assert (=> b!228363 (= e!156475 (arrayRangesEq!887 arr!308 (_3!884 lt!366145) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) i!761))))

(assert (= (and d!77516 (not res!191567)) b!228362))

(assert (= (and b!228362 res!191568) b!228363))

(declare-fun m!351975 () Bool)

(assert (=> b!228362 m!351975))

(declare-fun m!351977 () Bool)

(assert (=> b!228362 m!351977))

(declare-fun m!351979 () Bool)

(assert (=> b!228363 m!351979))

(assert (=> b!228254 d!77516))

(declare-fun d!77518 () Bool)

(declare-fun e!156482 () Bool)

(assert (=> d!77518 e!156482))

(declare-fun res!191577 () Bool)

(assert (=> d!77518 (=> (not res!191577) (not e!156482))))

(assert (=> d!77518 (= res!191577 (and (bvsge i!761 #b00000000000000000000000000000000) (bvslt i!761 (size!5051 arr!308))))))

(declare-fun lt!366561 () Unit!17142)

(declare-fun choose!337 (array!11512 (_ BitVec 32) (_ BitVec 8)) Unit!17142)

(assert (=> d!77518 (= lt!366561 (choose!337 arr!308 i!761 (_1!10717 lt!366139)))))

(assert (=> d!77518 (and (bvsle #b00000000000000000000000000000000 i!761) (bvslt i!761 (size!5051 arr!308)))))

(assert (=> d!77518 (= (arrayUpdatedAtPrefixLemma!446 arr!308 i!761 (_1!10717 lt!366139)) lt!366561)))

(declare-fun b!228372 () Bool)

(assert (=> b!228372 (= e!156482 (arrayRangesEq!887 arr!308 (array!11513 (store (arr!6035 arr!308) i!761 (_1!10717 lt!366139)) (size!5051 arr!308)) #b00000000000000000000000000000000 i!761))))

(assert (= (and d!77518 res!191577) b!228372))

(declare-fun m!351981 () Bool)

(assert (=> d!77518 m!351981))

(assert (=> b!228372 m!351777))

(declare-fun m!351983 () Bool)

(assert (=> b!228372 m!351983))

(assert (=> b!228254 d!77518))

(declare-fun d!77520 () Bool)

(declare-fun e!156483 () Bool)

(assert (=> d!77520 e!156483))

(declare-fun res!191579 () Bool)

(assert (=> d!77520 (=> (not res!191579) (not e!156483))))

(declare-fun lt!366567 () (_ BitVec 64))

(declare-fun lt!366569 () (_ BitVec 64))

(declare-fun lt!366568 () (_ BitVec 64))

(assert (=> d!77520 (= res!191579 (= lt!366568 (bvsub lt!366567 lt!366569)))))

(assert (=> d!77520 (or (= (bvand lt!366567 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!366569 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!366567 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!366567 lt!366569) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77520 (= lt!366569 (remainingBits!0 ((_ sign_extend 32) (size!5051 (buf!5592 (_2!10717 lt!366139)))) ((_ sign_extend 32) (currentByte!10448 (_2!10717 lt!366139))) ((_ sign_extend 32) (currentBit!10443 (_2!10717 lt!366139)))))))

(declare-fun lt!366566 () (_ BitVec 64))

(declare-fun lt!366564 () (_ BitVec 64))

(assert (=> d!77520 (= lt!366567 (bvmul lt!366566 lt!366564))))

(assert (=> d!77520 (or (= lt!366566 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!366564 (bvsdiv (bvmul lt!366566 lt!366564) lt!366566)))))

(assert (=> d!77520 (= lt!366564 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77520 (= lt!366566 ((_ sign_extend 32) (size!5051 (buf!5592 (_2!10717 lt!366139)))))))

(assert (=> d!77520 (= lt!366568 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10448 (_2!10717 lt!366139))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10443 (_2!10717 lt!366139)))))))

(assert (=> d!77520 (invariant!0 (currentBit!10443 (_2!10717 lt!366139)) (currentByte!10448 (_2!10717 lt!366139)) (size!5051 (buf!5592 (_2!10717 lt!366139))))))

(assert (=> d!77520 (= (bitIndex!0 (size!5051 (buf!5592 (_2!10717 lt!366139))) (currentByte!10448 (_2!10717 lt!366139)) (currentBit!10443 (_2!10717 lt!366139))) lt!366568)))

(declare-fun b!228375 () Bool)

(declare-fun res!191578 () Bool)

(assert (=> b!228375 (=> (not res!191578) (not e!156483))))

(assert (=> b!228375 (= res!191578 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!366568))))

(declare-fun b!228376 () Bool)

(declare-fun lt!366565 () (_ BitVec 64))

(assert (=> b!228376 (= e!156483 (bvsle lt!366568 (bvmul lt!366565 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!228376 (or (= lt!366565 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!366565 #b0000000000000000000000000000000000000000000000000000000000001000) lt!366565)))))

(assert (=> b!228376 (= lt!366565 ((_ sign_extend 32) (size!5051 (buf!5592 (_2!10717 lt!366139)))))))

(assert (= (and d!77520 res!191579) b!228375))

(assert (= (and b!228375 res!191578) b!228376))

(declare-fun m!351985 () Bool)

(assert (=> d!77520 m!351985))

(declare-fun m!351987 () Bool)

(assert (=> d!77520 m!351987))

(assert (=> b!228254 d!77520))

(declare-fun d!77522 () Bool)

(assert (=> d!77522 (and (bvsge i!761 #b00000000000000000000000000000000) (bvslt i!761 (size!5051 lt!366143)) (bvslt i!761 (size!5051 (_3!884 lt!366145))) (= (select (arr!6035 lt!366143) i!761) (select (arr!6035 (_3!884 lt!366145)) i!761)))))

(declare-fun lt!366634 () Unit!17142)

(declare-fun choose!338 (array!11512 array!11512 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17142)

(assert (=> d!77522 (= lt!366634 (choose!338 lt!366143 (_3!884 lt!366145) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!77522 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!77522 (= (arrayRangesEqImpliesEq!143 lt!366143 (_3!884 lt!366145) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)) lt!366634)))

(declare-fun bs!18953 () Bool)

(assert (= bs!18953 d!77522))

(declare-fun m!351989 () Bool)

(assert (=> bs!18953 m!351989))

(assert (=> bs!18953 m!351775))

(declare-fun m!351991 () Bool)

(assert (=> bs!18953 m!351991))

(assert (=> b!228254 d!77522))

(declare-fun d!77524 () Bool)

(assert (=> d!77524 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5051 (buf!5592 (_2!10717 lt!366139)))) ((_ sign_extend 32) (currentByte!10448 (_2!10717 lt!366139))) ((_ sign_extend 32) (currentBit!10443 (_2!10717 lt!366139))) lt!366140) (bvsle ((_ sign_extend 32) lt!366140) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5051 (buf!5592 (_2!10717 lt!366139)))) ((_ sign_extend 32) (currentByte!10448 (_2!10717 lt!366139))) ((_ sign_extend 32) (currentBit!10443 (_2!10717 lt!366139)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18954 () Bool)

(assert (= bs!18954 d!77524))

(assert (=> bs!18954 m!351985))

(assert (=> b!228254 d!77524))

(declare-fun d!77526 () Bool)

(declare-fun e!156489 () Bool)

(assert (=> d!77526 e!156489))

(declare-fun res!191584 () Bool)

(assert (=> d!77526 (=> (not res!191584) (not e!156489))))

(declare-fun lt!366675 () (_ BitVec 64))

(declare-fun lt!366676 () (_ BitVec 64))

(declare-fun lt!366674 () (_ BitVec 64))

(assert (=> d!77526 (= res!191584 (= lt!366675 (bvsub lt!366674 lt!366676)))))

(assert (=> d!77526 (or (= (bvand lt!366674 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!366676 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!366674 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!366674 lt!366676) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77526 (= lt!366676 (remainingBits!0 ((_ sign_extend 32) (size!5051 (buf!5592 (_2!10715 lt!366145)))) ((_ sign_extend 32) (currentByte!10448 (_2!10715 lt!366145))) ((_ sign_extend 32) (currentBit!10443 (_2!10715 lt!366145)))))))

(declare-fun lt!366673 () (_ BitVec 64))

(declare-fun lt!366671 () (_ BitVec 64))

(assert (=> d!77526 (= lt!366674 (bvmul lt!366673 lt!366671))))

(assert (=> d!77526 (or (= lt!366673 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!366671 (bvsdiv (bvmul lt!366673 lt!366671) lt!366673)))))

(assert (=> d!77526 (= lt!366671 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77526 (= lt!366673 ((_ sign_extend 32) (size!5051 (buf!5592 (_2!10715 lt!366145)))))))

(assert (=> d!77526 (= lt!366675 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10448 (_2!10715 lt!366145))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10443 (_2!10715 lt!366145)))))))

(assert (=> d!77526 (invariant!0 (currentBit!10443 (_2!10715 lt!366145)) (currentByte!10448 (_2!10715 lt!366145)) (size!5051 (buf!5592 (_2!10715 lt!366145))))))

(assert (=> d!77526 (= (bitIndex!0 (size!5051 (buf!5592 (_2!10715 lt!366145))) (currentByte!10448 (_2!10715 lt!366145)) (currentBit!10443 (_2!10715 lt!366145))) lt!366675)))

(declare-fun b!228384 () Bool)

(declare-fun res!191583 () Bool)

(assert (=> b!228384 (=> (not res!191583) (not e!156489))))

(assert (=> b!228384 (= res!191583 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!366675))))

(declare-fun b!228385 () Bool)

(declare-fun lt!366672 () (_ BitVec 64))

(assert (=> b!228385 (= e!156489 (bvsle lt!366675 (bvmul lt!366672 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!228385 (or (= lt!366672 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!366672 #b0000000000000000000000000000000000000000000000000000000000001000) lt!366672)))))

(assert (=> b!228385 (= lt!366672 ((_ sign_extend 32) (size!5051 (buf!5592 (_2!10715 lt!366145)))))))

(assert (= (and d!77526 res!191584) b!228384))

(assert (= (and b!228384 res!191583) b!228385))

(declare-fun m!351993 () Bool)

(assert (=> d!77526 m!351993))

(declare-fun m!351995 () Bool)

(assert (=> d!77526 m!351995))

(assert (=> b!228254 d!77526))

(declare-fun d!77528 () Bool)

(declare-fun res!191585 () Bool)

(declare-fun e!156490 () Bool)

(assert (=> d!77528 (=> res!191585 e!156490)))

(assert (=> d!77528 (= res!191585 (= #b00000000000000000000000000000000 i!761))))

(assert (=> d!77528 (= (arrayRangesEq!887 arr!308 lt!366143 #b00000000000000000000000000000000 i!761) e!156490)))

(declare-fun b!228386 () Bool)

(declare-fun e!156491 () Bool)

(assert (=> b!228386 (= e!156490 e!156491)))

(declare-fun res!191586 () Bool)

(assert (=> b!228386 (=> (not res!191586) (not e!156491))))

(assert (=> b!228386 (= res!191586 (= (select (arr!6035 arr!308) #b00000000000000000000000000000000) (select (arr!6035 lt!366143) #b00000000000000000000000000000000)))))

(declare-fun b!228387 () Bool)

(assert (=> b!228387 (= e!156491 (arrayRangesEq!887 arr!308 lt!366143 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) i!761))))

(assert (= (and d!77528 (not res!191585)) b!228386))

(assert (= (and b!228386 res!191586) b!228387))

(assert (=> b!228386 m!351975))

(declare-fun m!351999 () Bool)

(assert (=> b!228386 m!351999))

(declare-fun m!352003 () Bool)

(assert (=> b!228387 m!352003))

(assert (=> b!228254 d!77528))

(declare-fun d!77530 () Bool)

(assert (=> d!77530 (= (array_inv!4792 (buf!5592 thiss!1870)) (bvsge (size!5051 (buf!5592 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!228255 d!77530))

(declare-fun d!77532 () Bool)

(assert (=> d!77532 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5051 (buf!5592 thiss!1870))) ((_ sign_extend 32) (currentByte!10448 thiss!1870)) ((_ sign_extend 32) (currentBit!10443 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5051 (buf!5592 thiss!1870))) ((_ sign_extend 32) (currentByte!10448 thiss!1870)) ((_ sign_extend 32) (currentBit!10443 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18955 () Bool)

(assert (= bs!18955 d!77532))

(assert (=> bs!18955 m!351971))

(assert (=> b!228252 d!77532))

(declare-fun d!77534 () Bool)

(assert (=> d!77534 (= (array_inv!4792 arr!308) (bvsge (size!5051 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!48016 d!77534))

(declare-fun d!77536 () Bool)

(assert (=> d!77536 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10443 thiss!1870) (currentByte!10448 thiss!1870) (size!5051 (buf!5592 thiss!1870))))))

(declare-fun bs!18956 () Bool)

(assert (= bs!18956 d!77536))

(assert (=> bs!18956 m!351973))

(assert (=> start!48016 d!77536))

(check-sat (not b!228387) (not d!77507) (not bm!3915) (not d!77439) (not d!77505) (not d!77532) (not b!228347) (not d!77511) (not b!228363) (not bm!3914) (not d!77514) (not d!77518) (not b!228344) (not d!77524) (not b!228334) (not b!228336) (not b!228337) (not bm!3913) (not d!77526) (not d!77522) (not d!77520) (not b!228372) (not d!77536) (not d!77509) (not b!228338))
