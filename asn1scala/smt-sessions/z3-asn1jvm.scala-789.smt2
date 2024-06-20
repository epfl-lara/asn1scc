; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22870 () Bool)

(assert start!22870)

(declare-fun b!115598 () Bool)

(declare-fun res!95537 () Bool)

(declare-fun e!75765 () Bool)

(assert (=> b!115598 (=> (not res!95537) (not e!75765))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!115598 (= res!95537 (bvslt i!615 nBits!396))))

(declare-fun b!115599 () Bool)

(declare-fun e!75771 () Bool)

(declare-datatypes ((array!5215 0))(
  ( (array!5216 (arr!2959 (Array (_ BitVec 32) (_ BitVec 8))) (size!2366 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4206 0))(
  ( (BitStream!4207 (buf!2776 array!5215) (currentByte!5404 (_ BitVec 32)) (currentBit!5399 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!9532 0))(
  ( (tuple2!9533 (_1!5031 BitStream!4206) (_2!5031 Bool)) )
))
(declare-fun lt!176400 () tuple2!9532)

(declare-fun lt!176396 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!115599 (= e!75771 (= (bitIndex!0 (size!2366 (buf!2776 (_1!5031 lt!176400))) (currentByte!5404 (_1!5031 lt!176400)) (currentBit!5399 (_1!5031 lt!176400))) lt!176396))))

(declare-fun res!95538 () Bool)

(assert (=> start!22870 (=> (not res!95538) (not e!75765))))

(assert (=> start!22870 (= res!95538 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22870 e!75765))

(assert (=> start!22870 true))

(declare-fun thiss!1305 () BitStream!4206)

(declare-fun e!75766 () Bool)

(declare-fun inv!12 (BitStream!4206) Bool)

(assert (=> start!22870 (and (inv!12 thiss!1305) e!75766)))

(declare-fun b!115600 () Bool)

(declare-fun res!95540 () Bool)

(declare-fun e!75770 () Bool)

(assert (=> b!115600 (=> (not res!95540) (not e!75770))))

(declare-datatypes ((Unit!7113 0))(
  ( (Unit!7114) )
))
(declare-datatypes ((tuple2!9534 0))(
  ( (tuple2!9535 (_1!5032 Unit!7113) (_2!5032 BitStream!4206)) )
))
(declare-fun lt!176397 () tuple2!9534)

(declare-fun isPrefixOf!0 (BitStream!4206 BitStream!4206) Bool)

(assert (=> b!115600 (= res!95540 (isPrefixOf!0 thiss!1305 (_2!5032 lt!176397)))))

(declare-fun b!115601 () Bool)

(declare-fun res!95535 () Bool)

(assert (=> b!115601 (=> (not res!95535) (not e!75765))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!115601 (= res!95535 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!115602 () Bool)

(declare-fun array_inv!2168 (array!5215) Bool)

(assert (=> b!115602 (= e!75766 (array_inv!2168 (buf!2776 thiss!1305)))))

(declare-fun b!115603 () Bool)

(declare-fun e!75767 () Bool)

(declare-fun lt!176399 () tuple2!9532)

(declare-fun lt!176395 () tuple2!9532)

(assert (=> b!115603 (= e!75767 (= (_2!5031 lt!176399) (_2!5031 lt!176395)))))

(declare-fun b!115604 () Bool)

(declare-fun res!95536 () Bool)

(assert (=> b!115604 (=> (not res!95536) (not e!75765))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!115604 (= res!95536 (validate_offset_bits!1 ((_ sign_extend 32) (size!2366 (buf!2776 thiss!1305))) ((_ sign_extend 32) (currentByte!5404 thiss!1305)) ((_ sign_extend 32) (currentBit!5399 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!115605 () Bool)

(declare-fun e!75764 () Bool)

(declare-fun lt!176392 () tuple2!9534)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!115605 (= e!75764 (invariant!0 (currentBit!5399 thiss!1305) (currentByte!5404 thiss!1305) (size!2366 (buf!2776 (_2!5032 lt!176392)))))))

(declare-fun b!115606 () Bool)

(assert (=> b!115606 (= e!75765 (not (= (size!2366 (buf!2776 thiss!1305)) (size!2366 (buf!2776 (_2!5032 lt!176392))))))))

(declare-datatypes ((tuple2!9536 0))(
  ( (tuple2!9537 (_1!5033 BitStream!4206) (_2!5033 BitStream!4206)) )
))
(declare-fun lt!176391 () tuple2!9536)

(declare-fun lt!176393 () Bool)

(declare-fun readBitPure!0 (BitStream!4206) tuple2!9532)

(assert (=> b!115606 (= (_2!5031 (readBitPure!0 (_1!5033 lt!176391))) lt!176393)))

(declare-fun lt!176388 () tuple2!9536)

(declare-fun reader!0 (BitStream!4206 BitStream!4206) tuple2!9536)

(assert (=> b!115606 (= lt!176388 (reader!0 (_2!5032 lt!176397) (_2!5032 lt!176392)))))

(assert (=> b!115606 (= lt!176391 (reader!0 thiss!1305 (_2!5032 lt!176392)))))

(assert (=> b!115606 e!75767))

(declare-fun res!95541 () Bool)

(assert (=> b!115606 (=> (not res!95541) (not e!75767))))

(assert (=> b!115606 (= res!95541 (= (bitIndex!0 (size!2366 (buf!2776 (_1!5031 lt!176399))) (currentByte!5404 (_1!5031 lt!176399)) (currentBit!5399 (_1!5031 lt!176399))) (bitIndex!0 (size!2366 (buf!2776 (_1!5031 lt!176395))) (currentByte!5404 (_1!5031 lt!176395)) (currentBit!5399 (_1!5031 lt!176395)))))))

(declare-fun lt!176398 () Unit!7113)

(declare-fun lt!176390 () BitStream!4206)

(declare-fun readBitPrefixLemma!0 (BitStream!4206 BitStream!4206) Unit!7113)

(assert (=> b!115606 (= lt!176398 (readBitPrefixLemma!0 lt!176390 (_2!5032 lt!176392)))))

(assert (=> b!115606 (= lt!176395 (readBitPure!0 (BitStream!4207 (buf!2776 (_2!5032 lt!176392)) (currentByte!5404 thiss!1305) (currentBit!5399 thiss!1305))))))

(assert (=> b!115606 (= lt!176399 (readBitPure!0 lt!176390))))

(assert (=> b!115606 (= lt!176390 (BitStream!4207 (buf!2776 (_2!5032 lt!176397)) (currentByte!5404 thiss!1305) (currentBit!5399 thiss!1305)))))

(assert (=> b!115606 e!75764))

(declare-fun res!95544 () Bool)

(assert (=> b!115606 (=> (not res!95544) (not e!75764))))

(assert (=> b!115606 (= res!95544 (isPrefixOf!0 thiss!1305 (_2!5032 lt!176392)))))

(declare-fun lt!176394 () Unit!7113)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4206 BitStream!4206 BitStream!4206) Unit!7113)

(assert (=> b!115606 (= lt!176394 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5032 lt!176397) (_2!5032 lt!176392)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4206 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9534)

(assert (=> b!115606 (= lt!176392 (appendNLeastSignificantBitsLoop!0 (_2!5032 lt!176397) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!75768 () Bool)

(assert (=> b!115606 e!75768))

(declare-fun res!95534 () Bool)

(assert (=> b!115606 (=> (not res!95534) (not e!75768))))

(assert (=> b!115606 (= res!95534 (= (size!2366 (buf!2776 thiss!1305)) (size!2366 (buf!2776 (_2!5032 lt!176397)))))))

(declare-fun appendBit!0 (BitStream!4206 Bool) tuple2!9534)

(assert (=> b!115606 (= lt!176397 (appendBit!0 thiss!1305 lt!176393))))

(assert (=> b!115606 (= lt!176393 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!115607 () Bool)

(assert (=> b!115607 (= e!75768 e!75770)))

(declare-fun res!95542 () Bool)

(assert (=> b!115607 (=> (not res!95542) (not e!75770))))

(declare-fun lt!176389 () (_ BitVec 64))

(assert (=> b!115607 (= res!95542 (= lt!176396 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!176389)))))

(assert (=> b!115607 (= lt!176396 (bitIndex!0 (size!2366 (buf!2776 (_2!5032 lt!176397))) (currentByte!5404 (_2!5032 lt!176397)) (currentBit!5399 (_2!5032 lt!176397))))))

(assert (=> b!115607 (= lt!176389 (bitIndex!0 (size!2366 (buf!2776 thiss!1305)) (currentByte!5404 thiss!1305) (currentBit!5399 thiss!1305)))))

(declare-fun b!115608 () Bool)

(assert (=> b!115608 (= e!75770 e!75771)))

(declare-fun res!95539 () Bool)

(assert (=> b!115608 (=> (not res!95539) (not e!75771))))

(assert (=> b!115608 (= res!95539 (and (= (_2!5031 lt!176400) lt!176393) (= (_1!5031 lt!176400) (_2!5032 lt!176397))))))

(declare-fun readerFrom!0 (BitStream!4206 (_ BitVec 32) (_ BitVec 32)) BitStream!4206)

(assert (=> b!115608 (= lt!176400 (readBitPure!0 (readerFrom!0 (_2!5032 lt!176397) (currentBit!5399 thiss!1305) (currentByte!5404 thiss!1305))))))

(declare-fun b!115609 () Bool)

(declare-fun res!95543 () Bool)

(assert (=> b!115609 (=> (not res!95543) (not e!75764))))

(assert (=> b!115609 (= res!95543 (invariant!0 (currentBit!5399 thiss!1305) (currentByte!5404 thiss!1305) (size!2366 (buf!2776 (_2!5032 lt!176397)))))))

(assert (= (and start!22870 res!95538) b!115604))

(assert (= (and b!115604 res!95536) b!115601))

(assert (= (and b!115601 res!95535) b!115598))

(assert (= (and b!115598 res!95537) b!115606))

(assert (= (and b!115606 res!95534) b!115607))

(assert (= (and b!115607 res!95542) b!115600))

(assert (= (and b!115600 res!95540) b!115608))

(assert (= (and b!115608 res!95539) b!115599))

(assert (= (and b!115606 res!95544) b!115609))

(assert (= (and b!115609 res!95543) b!115605))

(assert (= (and b!115606 res!95541) b!115603))

(assert (= start!22870 b!115602))

(declare-fun m!173003 () Bool)

(assert (=> start!22870 m!173003))

(declare-fun m!173005 () Bool)

(assert (=> b!115606 m!173005))

(declare-fun m!173007 () Bool)

(assert (=> b!115606 m!173007))

(declare-fun m!173009 () Bool)

(assert (=> b!115606 m!173009))

(declare-fun m!173011 () Bool)

(assert (=> b!115606 m!173011))

(declare-fun m!173013 () Bool)

(assert (=> b!115606 m!173013))

(declare-fun m!173015 () Bool)

(assert (=> b!115606 m!173015))

(declare-fun m!173017 () Bool)

(assert (=> b!115606 m!173017))

(declare-fun m!173019 () Bool)

(assert (=> b!115606 m!173019))

(declare-fun m!173021 () Bool)

(assert (=> b!115606 m!173021))

(declare-fun m!173023 () Bool)

(assert (=> b!115606 m!173023))

(declare-fun m!173025 () Bool)

(assert (=> b!115606 m!173025))

(declare-fun m!173027 () Bool)

(assert (=> b!115606 m!173027))

(declare-fun m!173029 () Bool)

(assert (=> b!115600 m!173029))

(declare-fun m!173031 () Bool)

(assert (=> b!115608 m!173031))

(assert (=> b!115608 m!173031))

(declare-fun m!173033 () Bool)

(assert (=> b!115608 m!173033))

(declare-fun m!173035 () Bool)

(assert (=> b!115604 m!173035))

(declare-fun m!173037 () Bool)

(assert (=> b!115599 m!173037))

(declare-fun m!173039 () Bool)

(assert (=> b!115602 m!173039))

(declare-fun m!173041 () Bool)

(assert (=> b!115607 m!173041))

(declare-fun m!173043 () Bool)

(assert (=> b!115607 m!173043))

(declare-fun m!173045 () Bool)

(assert (=> b!115601 m!173045))

(declare-fun m!173047 () Bool)

(assert (=> b!115605 m!173047))

(declare-fun m!173049 () Bool)

(assert (=> b!115609 m!173049))

(check-sat (not b!115605) (not b!115607) (not b!115609) (not b!115601) (not b!115604) (not b!115599) (not b!115608) (not b!115606) (not b!115600) (not b!115602) (not start!22870))
(check-sat)
(get-model)

(declare-fun d!37192 () Bool)

(declare-fun e!75798 () Bool)

(assert (=> d!37192 e!75798))

(declare-fun res!95583 () Bool)

(assert (=> d!37192 (=> (not res!95583) (not e!75798))))

(declare-fun lt!176457 () (_ BitVec 64))

(declare-fun lt!176456 () (_ BitVec 64))

(declare-fun lt!176455 () (_ BitVec 64))

(assert (=> d!37192 (= res!95583 (= lt!176456 (bvsub lt!176457 lt!176455)))))

(assert (=> d!37192 (or (= (bvand lt!176457 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!176455 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!176457 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!176457 lt!176455) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!37192 (= lt!176455 (remainingBits!0 ((_ sign_extend 32) (size!2366 (buf!2776 (_2!5032 lt!176397)))) ((_ sign_extend 32) (currentByte!5404 (_2!5032 lt!176397))) ((_ sign_extend 32) (currentBit!5399 (_2!5032 lt!176397)))))))

(declare-fun lt!176452 () (_ BitVec 64))

(declare-fun lt!176453 () (_ BitVec 64))

(assert (=> d!37192 (= lt!176457 (bvmul lt!176452 lt!176453))))

(assert (=> d!37192 (or (= lt!176452 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!176453 (bvsdiv (bvmul lt!176452 lt!176453) lt!176452)))))

(assert (=> d!37192 (= lt!176453 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37192 (= lt!176452 ((_ sign_extend 32) (size!2366 (buf!2776 (_2!5032 lt!176397)))))))

(assert (=> d!37192 (= lt!176456 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5404 (_2!5032 lt!176397))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5399 (_2!5032 lt!176397)))))))

(assert (=> d!37192 (invariant!0 (currentBit!5399 (_2!5032 lt!176397)) (currentByte!5404 (_2!5032 lt!176397)) (size!2366 (buf!2776 (_2!5032 lt!176397))))))

(assert (=> d!37192 (= (bitIndex!0 (size!2366 (buf!2776 (_2!5032 lt!176397))) (currentByte!5404 (_2!5032 lt!176397)) (currentBit!5399 (_2!5032 lt!176397))) lt!176456)))

(declare-fun b!115650 () Bool)

(declare-fun res!95582 () Bool)

(assert (=> b!115650 (=> (not res!95582) (not e!75798))))

(assert (=> b!115650 (= res!95582 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!176456))))

(declare-fun b!115651 () Bool)

(declare-fun lt!176454 () (_ BitVec 64))

(assert (=> b!115651 (= e!75798 (bvsle lt!176456 (bvmul lt!176454 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!115651 (or (= lt!176454 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!176454 #b0000000000000000000000000000000000000000000000000000000000001000) lt!176454)))))

(assert (=> b!115651 (= lt!176454 ((_ sign_extend 32) (size!2366 (buf!2776 (_2!5032 lt!176397)))))))

(assert (= (and d!37192 res!95583) b!115650))

(assert (= (and b!115650 res!95582) b!115651))

(declare-fun m!173099 () Bool)

(assert (=> d!37192 m!173099))

(declare-fun m!173101 () Bool)

(assert (=> d!37192 m!173101))

(assert (=> b!115607 d!37192))

(declare-fun d!37194 () Bool)

(declare-fun e!75799 () Bool)

(assert (=> d!37194 e!75799))

(declare-fun res!95585 () Bool)

(assert (=> d!37194 (=> (not res!95585) (not e!75799))))

(declare-fun lt!176463 () (_ BitVec 64))

(declare-fun lt!176462 () (_ BitVec 64))

(declare-fun lt!176461 () (_ BitVec 64))

(assert (=> d!37194 (= res!95585 (= lt!176462 (bvsub lt!176463 lt!176461)))))

(assert (=> d!37194 (or (= (bvand lt!176463 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!176461 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!176463 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!176463 lt!176461) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37194 (= lt!176461 (remainingBits!0 ((_ sign_extend 32) (size!2366 (buf!2776 thiss!1305))) ((_ sign_extend 32) (currentByte!5404 thiss!1305)) ((_ sign_extend 32) (currentBit!5399 thiss!1305))))))

(declare-fun lt!176458 () (_ BitVec 64))

(declare-fun lt!176459 () (_ BitVec 64))

(assert (=> d!37194 (= lt!176463 (bvmul lt!176458 lt!176459))))

(assert (=> d!37194 (or (= lt!176458 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!176459 (bvsdiv (bvmul lt!176458 lt!176459) lt!176458)))))

(assert (=> d!37194 (= lt!176459 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37194 (= lt!176458 ((_ sign_extend 32) (size!2366 (buf!2776 thiss!1305))))))

(assert (=> d!37194 (= lt!176462 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5404 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5399 thiss!1305))))))

(assert (=> d!37194 (invariant!0 (currentBit!5399 thiss!1305) (currentByte!5404 thiss!1305) (size!2366 (buf!2776 thiss!1305)))))

(assert (=> d!37194 (= (bitIndex!0 (size!2366 (buf!2776 thiss!1305)) (currentByte!5404 thiss!1305) (currentBit!5399 thiss!1305)) lt!176462)))

(declare-fun b!115652 () Bool)

(declare-fun res!95584 () Bool)

(assert (=> b!115652 (=> (not res!95584) (not e!75799))))

(assert (=> b!115652 (= res!95584 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!176462))))

(declare-fun b!115653 () Bool)

(declare-fun lt!176460 () (_ BitVec 64))

(assert (=> b!115653 (= e!75799 (bvsle lt!176462 (bvmul lt!176460 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!115653 (or (= lt!176460 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!176460 #b0000000000000000000000000000000000000000000000000000000000001000) lt!176460)))))

(assert (=> b!115653 (= lt!176460 ((_ sign_extend 32) (size!2366 (buf!2776 thiss!1305))))))

(assert (= (and d!37194 res!95585) b!115652))

(assert (= (and b!115652 res!95584) b!115653))

(declare-fun m!173103 () Bool)

(assert (=> d!37194 m!173103))

(declare-fun m!173105 () Bool)

(assert (=> d!37194 m!173105))

(assert (=> b!115607 d!37194))

(declare-fun d!37196 () Bool)

(assert (=> d!37196 (= (array_inv!2168 (buf!2776 thiss!1305)) (bvsge (size!2366 (buf!2776 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!115602 d!37196))

(declare-fun d!37198 () Bool)

(declare-fun res!95594 () Bool)

(declare-fun e!75804 () Bool)

(assert (=> d!37198 (=> (not res!95594) (not e!75804))))

(assert (=> d!37198 (= res!95594 (= (size!2366 (buf!2776 thiss!1305)) (size!2366 (buf!2776 (_2!5032 lt!176397)))))))

(assert (=> d!37198 (= (isPrefixOf!0 thiss!1305 (_2!5032 lt!176397)) e!75804)))

(declare-fun b!115660 () Bool)

(declare-fun res!95592 () Bool)

(assert (=> b!115660 (=> (not res!95592) (not e!75804))))

(assert (=> b!115660 (= res!95592 (bvsle (bitIndex!0 (size!2366 (buf!2776 thiss!1305)) (currentByte!5404 thiss!1305) (currentBit!5399 thiss!1305)) (bitIndex!0 (size!2366 (buf!2776 (_2!5032 lt!176397))) (currentByte!5404 (_2!5032 lt!176397)) (currentBit!5399 (_2!5032 lt!176397)))))))

(declare-fun b!115661 () Bool)

(declare-fun e!75805 () Bool)

(assert (=> b!115661 (= e!75804 e!75805)))

(declare-fun res!95593 () Bool)

(assert (=> b!115661 (=> res!95593 e!75805)))

(assert (=> b!115661 (= res!95593 (= (size!2366 (buf!2776 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!115662 () Bool)

(declare-fun arrayBitRangesEq!0 (array!5215 array!5215 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!115662 (= e!75805 (arrayBitRangesEq!0 (buf!2776 thiss!1305) (buf!2776 (_2!5032 lt!176397)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2366 (buf!2776 thiss!1305)) (currentByte!5404 thiss!1305) (currentBit!5399 thiss!1305))))))

(assert (= (and d!37198 res!95594) b!115660))

(assert (= (and b!115660 res!95592) b!115661))

(assert (= (and b!115661 (not res!95593)) b!115662))

(assert (=> b!115660 m!173043))

(assert (=> b!115660 m!173041))

(assert (=> b!115662 m!173043))

(assert (=> b!115662 m!173043))

(declare-fun m!173107 () Bool)

(assert (=> b!115662 m!173107))

(assert (=> b!115600 d!37198))

(declare-fun d!37200 () Bool)

(assert (=> d!37200 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!115601 d!37200))

(declare-fun d!37202 () Bool)

(declare-fun res!95597 () Bool)

(declare-fun e!75806 () Bool)

(assert (=> d!37202 (=> (not res!95597) (not e!75806))))

(assert (=> d!37202 (= res!95597 (= (size!2366 (buf!2776 thiss!1305)) (size!2366 (buf!2776 (_2!5032 lt!176392)))))))

(assert (=> d!37202 (= (isPrefixOf!0 thiss!1305 (_2!5032 lt!176392)) e!75806)))

(declare-fun b!115663 () Bool)

(declare-fun res!95595 () Bool)

(assert (=> b!115663 (=> (not res!95595) (not e!75806))))

(assert (=> b!115663 (= res!95595 (bvsle (bitIndex!0 (size!2366 (buf!2776 thiss!1305)) (currentByte!5404 thiss!1305) (currentBit!5399 thiss!1305)) (bitIndex!0 (size!2366 (buf!2776 (_2!5032 lt!176392))) (currentByte!5404 (_2!5032 lt!176392)) (currentBit!5399 (_2!5032 lt!176392)))))))

(declare-fun b!115664 () Bool)

(declare-fun e!75807 () Bool)

(assert (=> b!115664 (= e!75806 e!75807)))

(declare-fun res!95596 () Bool)

(assert (=> b!115664 (=> res!95596 e!75807)))

(assert (=> b!115664 (= res!95596 (= (size!2366 (buf!2776 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!115665 () Bool)

(assert (=> b!115665 (= e!75807 (arrayBitRangesEq!0 (buf!2776 thiss!1305) (buf!2776 (_2!5032 lt!176392)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2366 (buf!2776 thiss!1305)) (currentByte!5404 thiss!1305) (currentBit!5399 thiss!1305))))))

(assert (= (and d!37202 res!95597) b!115663))

(assert (= (and b!115663 res!95595) b!115664))

(assert (= (and b!115664 (not res!95596)) b!115665))

(assert (=> b!115663 m!173043))

(declare-fun m!173109 () Bool)

(assert (=> b!115663 m!173109))

(assert (=> b!115665 m!173043))

(assert (=> b!115665 m!173043))

(declare-fun m!173111 () Bool)

(assert (=> b!115665 m!173111))

(assert (=> b!115606 d!37202))

(declare-fun b!115676 () Bool)

(declare-fun res!95607 () Bool)

(declare-fun e!75812 () Bool)

(assert (=> b!115676 (=> (not res!95607) (not e!75812))))

(declare-fun lt!176472 () tuple2!9534)

(assert (=> b!115676 (= res!95607 (isPrefixOf!0 thiss!1305 (_2!5032 lt!176472)))))

(declare-fun b!115677 () Bool)

(declare-fun e!75813 () Bool)

(assert (=> b!115677 (= e!75812 e!75813)))

(declare-fun res!95609 () Bool)

(assert (=> b!115677 (=> (not res!95609) (not e!75813))))

(declare-fun lt!176475 () tuple2!9532)

(assert (=> b!115677 (= res!95609 (and (= (_2!5031 lt!176475) lt!176393) (= (_1!5031 lt!176475) (_2!5032 lt!176472))))))

(assert (=> b!115677 (= lt!176475 (readBitPure!0 (readerFrom!0 (_2!5032 lt!176472) (currentBit!5399 thiss!1305) (currentByte!5404 thiss!1305))))))

(declare-fun b!115675 () Bool)

(declare-fun res!95606 () Bool)

(assert (=> b!115675 (=> (not res!95606) (not e!75812))))

(declare-fun lt!176473 () (_ BitVec 64))

(declare-fun lt!176474 () (_ BitVec 64))

(assert (=> b!115675 (= res!95606 (= (bitIndex!0 (size!2366 (buf!2776 (_2!5032 lt!176472))) (currentByte!5404 (_2!5032 lt!176472)) (currentBit!5399 (_2!5032 lt!176472))) (bvadd lt!176474 lt!176473)))))

(assert (=> b!115675 (or (not (= (bvand lt!176474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!176473 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!176474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!176474 lt!176473) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!115675 (= lt!176473 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!115675 (= lt!176474 (bitIndex!0 (size!2366 (buf!2776 thiss!1305)) (currentByte!5404 thiss!1305) (currentBit!5399 thiss!1305)))))

(declare-fun b!115678 () Bool)

(assert (=> b!115678 (= e!75813 (= (bitIndex!0 (size!2366 (buf!2776 (_1!5031 lt!176475))) (currentByte!5404 (_1!5031 lt!176475)) (currentBit!5399 (_1!5031 lt!176475))) (bitIndex!0 (size!2366 (buf!2776 (_2!5032 lt!176472))) (currentByte!5404 (_2!5032 lt!176472)) (currentBit!5399 (_2!5032 lt!176472)))))))

(declare-fun d!37204 () Bool)

(assert (=> d!37204 e!75812))

(declare-fun res!95608 () Bool)

(assert (=> d!37204 (=> (not res!95608) (not e!75812))))

(assert (=> d!37204 (= res!95608 (= (size!2366 (buf!2776 thiss!1305)) (size!2366 (buf!2776 (_2!5032 lt!176472)))))))

(declare-fun choose!16 (BitStream!4206 Bool) tuple2!9534)

(assert (=> d!37204 (= lt!176472 (choose!16 thiss!1305 lt!176393))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!37204 (validate_offset_bit!0 ((_ sign_extend 32) (size!2366 (buf!2776 thiss!1305))) ((_ sign_extend 32) (currentByte!5404 thiss!1305)) ((_ sign_extend 32) (currentBit!5399 thiss!1305)))))

(assert (=> d!37204 (= (appendBit!0 thiss!1305 lt!176393) lt!176472)))

(assert (= (and d!37204 res!95608) b!115675))

(assert (= (and b!115675 res!95606) b!115676))

(assert (= (and b!115676 res!95607) b!115677))

(assert (= (and b!115677 res!95609) b!115678))

(declare-fun m!173113 () Bool)

(assert (=> b!115676 m!173113))

(declare-fun m!173115 () Bool)

(assert (=> d!37204 m!173115))

(declare-fun m!173117 () Bool)

(assert (=> d!37204 m!173117))

(declare-fun m!173119 () Bool)

(assert (=> b!115675 m!173119))

(assert (=> b!115675 m!173043))

(declare-fun m!173121 () Bool)

(assert (=> b!115677 m!173121))

(assert (=> b!115677 m!173121))

(declare-fun m!173123 () Bool)

(assert (=> b!115677 m!173123))

(declare-fun m!173125 () Bool)

(assert (=> b!115678 m!173125))

(assert (=> b!115678 m!173119))

(assert (=> b!115606 d!37204))

(declare-fun d!37206 () Bool)

(declare-fun e!75814 () Bool)

(assert (=> d!37206 e!75814))

(declare-fun res!95611 () Bool)

(assert (=> d!37206 (=> (not res!95611) (not e!75814))))

(declare-fun lt!176480 () (_ BitVec 64))

(declare-fun lt!176479 () (_ BitVec 64))

(declare-fun lt!176481 () (_ BitVec 64))

(assert (=> d!37206 (= res!95611 (= lt!176480 (bvsub lt!176481 lt!176479)))))

(assert (=> d!37206 (or (= (bvand lt!176481 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!176479 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!176481 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!176481 lt!176479) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37206 (= lt!176479 (remainingBits!0 ((_ sign_extend 32) (size!2366 (buf!2776 (_1!5031 lt!176395)))) ((_ sign_extend 32) (currentByte!5404 (_1!5031 lt!176395))) ((_ sign_extend 32) (currentBit!5399 (_1!5031 lt!176395)))))))

(declare-fun lt!176476 () (_ BitVec 64))

(declare-fun lt!176477 () (_ BitVec 64))

(assert (=> d!37206 (= lt!176481 (bvmul lt!176476 lt!176477))))

(assert (=> d!37206 (or (= lt!176476 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!176477 (bvsdiv (bvmul lt!176476 lt!176477) lt!176476)))))

(assert (=> d!37206 (= lt!176477 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37206 (= lt!176476 ((_ sign_extend 32) (size!2366 (buf!2776 (_1!5031 lt!176395)))))))

(assert (=> d!37206 (= lt!176480 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5404 (_1!5031 lt!176395))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5399 (_1!5031 lt!176395)))))))

(assert (=> d!37206 (invariant!0 (currentBit!5399 (_1!5031 lt!176395)) (currentByte!5404 (_1!5031 lt!176395)) (size!2366 (buf!2776 (_1!5031 lt!176395))))))

(assert (=> d!37206 (= (bitIndex!0 (size!2366 (buf!2776 (_1!5031 lt!176395))) (currentByte!5404 (_1!5031 lt!176395)) (currentBit!5399 (_1!5031 lt!176395))) lt!176480)))

(declare-fun b!115679 () Bool)

(declare-fun res!95610 () Bool)

(assert (=> b!115679 (=> (not res!95610) (not e!75814))))

(assert (=> b!115679 (= res!95610 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!176480))))

(declare-fun b!115680 () Bool)

(declare-fun lt!176478 () (_ BitVec 64))

(assert (=> b!115680 (= e!75814 (bvsle lt!176480 (bvmul lt!176478 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!115680 (or (= lt!176478 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!176478 #b0000000000000000000000000000000000000000000000000000000000001000) lt!176478)))))

(assert (=> b!115680 (= lt!176478 ((_ sign_extend 32) (size!2366 (buf!2776 (_1!5031 lt!176395)))))))

(assert (= (and d!37206 res!95611) b!115679))

(assert (= (and b!115679 res!95610) b!115680))

(declare-fun m!173127 () Bool)

(assert (=> d!37206 m!173127))

(declare-fun m!173129 () Bool)

(assert (=> d!37206 m!173129))

(assert (=> b!115606 d!37206))

(declare-fun b!115704 () Bool)

(declare-fun e!75827 () Unit!7113)

(declare-fun lt!176555 () Unit!7113)

(assert (=> b!115704 (= e!75827 lt!176555)))

(declare-fun lt!176557 () (_ BitVec 64))

(assert (=> b!115704 (= lt!176557 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!176564 () (_ BitVec 64))

(assert (=> b!115704 (= lt!176564 (bitIndex!0 (size!2366 (buf!2776 (_2!5032 lt!176397))) (currentByte!5404 (_2!5032 lt!176397)) (currentBit!5399 (_2!5032 lt!176397))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5215 array!5215 (_ BitVec 64) (_ BitVec 64)) Unit!7113)

(assert (=> b!115704 (= lt!176555 (arrayBitRangesEqSymmetric!0 (buf!2776 (_2!5032 lt!176397)) (buf!2776 (_2!5032 lt!176392)) lt!176557 lt!176564))))

(assert (=> b!115704 (arrayBitRangesEq!0 (buf!2776 (_2!5032 lt!176392)) (buf!2776 (_2!5032 lt!176397)) lt!176557 lt!176564)))

(declare-fun b!115705 () Bool)

(declare-fun res!95633 () Bool)

(declare-fun e!75828 () Bool)

(assert (=> b!115705 (=> (not res!95633) (not e!75828))))

(declare-fun lt!176567 () tuple2!9536)

(assert (=> b!115705 (= res!95633 (isPrefixOf!0 (_2!5033 lt!176567) (_2!5032 lt!176392)))))

(declare-fun lt!176562 () (_ BitVec 64))

(declare-fun b!115706 () Bool)

(declare-fun lt!176572 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4206 (_ BitVec 64)) BitStream!4206)

(assert (=> b!115706 (= e!75828 (= (_1!5033 lt!176567) (withMovedBitIndex!0 (_2!5033 lt!176567) (bvsub lt!176572 lt!176562))))))

(assert (=> b!115706 (or (= (bvand lt!176572 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!176562 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!176572 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!176572 lt!176562) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!115706 (= lt!176562 (bitIndex!0 (size!2366 (buf!2776 (_2!5032 lt!176392))) (currentByte!5404 (_2!5032 lt!176392)) (currentBit!5399 (_2!5032 lt!176392))))))

(assert (=> b!115706 (= lt!176572 (bitIndex!0 (size!2366 (buf!2776 (_2!5032 lt!176397))) (currentByte!5404 (_2!5032 lt!176397)) (currentBit!5399 (_2!5032 lt!176397))))))

(declare-fun d!37208 () Bool)

(assert (=> d!37208 e!75828))

(declare-fun res!95634 () Bool)

(assert (=> d!37208 (=> (not res!95634) (not e!75828))))

(assert (=> d!37208 (= res!95634 (isPrefixOf!0 (_1!5033 lt!176567) (_2!5033 lt!176567)))))

(declare-fun lt!176560 () BitStream!4206)

(assert (=> d!37208 (= lt!176567 (tuple2!9537 lt!176560 (_2!5032 lt!176392)))))

(declare-fun lt!176563 () Unit!7113)

(declare-fun lt!176568 () Unit!7113)

(assert (=> d!37208 (= lt!176563 lt!176568)))

(assert (=> d!37208 (isPrefixOf!0 lt!176560 (_2!5032 lt!176392))))

(assert (=> d!37208 (= lt!176568 (lemmaIsPrefixTransitive!0 lt!176560 (_2!5032 lt!176392) (_2!5032 lt!176392)))))

(declare-fun lt!176561 () Unit!7113)

(declare-fun lt!176573 () Unit!7113)

(assert (=> d!37208 (= lt!176561 lt!176573)))

(assert (=> d!37208 (isPrefixOf!0 lt!176560 (_2!5032 lt!176392))))

(assert (=> d!37208 (= lt!176573 (lemmaIsPrefixTransitive!0 lt!176560 (_2!5032 lt!176397) (_2!5032 lt!176392)))))

(declare-fun lt!176569 () Unit!7113)

(assert (=> d!37208 (= lt!176569 e!75827)))

(declare-fun c!7003 () Bool)

(assert (=> d!37208 (= c!7003 (not (= (size!2366 (buf!2776 (_2!5032 lt!176397))) #b00000000000000000000000000000000)))))

(declare-fun lt!176559 () Unit!7113)

(declare-fun lt!176558 () Unit!7113)

(assert (=> d!37208 (= lt!176559 lt!176558)))

(assert (=> d!37208 (isPrefixOf!0 (_2!5032 lt!176392) (_2!5032 lt!176392))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4206) Unit!7113)

(assert (=> d!37208 (= lt!176558 (lemmaIsPrefixRefl!0 (_2!5032 lt!176392)))))

(declare-fun lt!176571 () Unit!7113)

(declare-fun lt!176556 () Unit!7113)

(assert (=> d!37208 (= lt!176571 lt!176556)))

(assert (=> d!37208 (= lt!176556 (lemmaIsPrefixRefl!0 (_2!5032 lt!176392)))))

(declare-fun lt!176566 () Unit!7113)

(declare-fun lt!176565 () Unit!7113)

(assert (=> d!37208 (= lt!176566 lt!176565)))

(assert (=> d!37208 (isPrefixOf!0 lt!176560 lt!176560)))

(assert (=> d!37208 (= lt!176565 (lemmaIsPrefixRefl!0 lt!176560))))

(declare-fun lt!176574 () Unit!7113)

(declare-fun lt!176570 () Unit!7113)

(assert (=> d!37208 (= lt!176574 lt!176570)))

(assert (=> d!37208 (isPrefixOf!0 (_2!5032 lt!176397) (_2!5032 lt!176397))))

(assert (=> d!37208 (= lt!176570 (lemmaIsPrefixRefl!0 (_2!5032 lt!176397)))))

(assert (=> d!37208 (= lt!176560 (BitStream!4207 (buf!2776 (_2!5032 lt!176392)) (currentByte!5404 (_2!5032 lt!176397)) (currentBit!5399 (_2!5032 lt!176397))))))

(assert (=> d!37208 (isPrefixOf!0 (_2!5032 lt!176397) (_2!5032 lt!176392))))

(assert (=> d!37208 (= (reader!0 (_2!5032 lt!176397) (_2!5032 lt!176392)) lt!176567)))

(declare-fun b!115707 () Bool)

(declare-fun res!95632 () Bool)

(assert (=> b!115707 (=> (not res!95632) (not e!75828))))

(assert (=> b!115707 (= res!95632 (isPrefixOf!0 (_1!5033 lt!176567) (_2!5032 lt!176397)))))

(declare-fun b!115708 () Bool)

(declare-fun Unit!7117 () Unit!7113)

(assert (=> b!115708 (= e!75827 Unit!7117)))

(assert (= (and d!37208 c!7003) b!115704))

(assert (= (and d!37208 (not c!7003)) b!115708))

(assert (= (and d!37208 res!95634) b!115707))

(assert (= (and b!115707 res!95632) b!115705))

(assert (= (and b!115705 res!95633) b!115706))

(declare-fun m!173145 () Bool)

(assert (=> b!115707 m!173145))

(declare-fun m!173147 () Bool)

(assert (=> b!115705 m!173147))

(declare-fun m!173149 () Bool)

(assert (=> b!115706 m!173149))

(assert (=> b!115706 m!173109))

(assert (=> b!115706 m!173041))

(assert (=> b!115704 m!173041))

(declare-fun m!173151 () Bool)

(assert (=> b!115704 m!173151))

(declare-fun m!173153 () Bool)

(assert (=> b!115704 m!173153))

(declare-fun m!173155 () Bool)

(assert (=> d!37208 m!173155))

(declare-fun m!173157 () Bool)

(assert (=> d!37208 m!173157))

(declare-fun m!173159 () Bool)

(assert (=> d!37208 m!173159))

(declare-fun m!173161 () Bool)

(assert (=> d!37208 m!173161))

(declare-fun m!173163 () Bool)

(assert (=> d!37208 m!173163))

(declare-fun m!173165 () Bool)

(assert (=> d!37208 m!173165))

(declare-fun m!173167 () Bool)

(assert (=> d!37208 m!173167))

(declare-fun m!173169 () Bool)

(assert (=> d!37208 m!173169))

(declare-fun m!173171 () Bool)

(assert (=> d!37208 m!173171))

(declare-fun m!173173 () Bool)

(assert (=> d!37208 m!173173))

(declare-fun m!173175 () Bool)

(assert (=> d!37208 m!173175))

(assert (=> b!115606 d!37208))

(declare-fun d!37232 () Bool)

(declare-fun e!75831 () Bool)

(assert (=> d!37232 e!75831))

(declare-fun res!95637 () Bool)

(assert (=> d!37232 (=> (not res!95637) (not e!75831))))

(declare-fun lt!176584 () tuple2!9532)

(declare-fun lt!176586 () tuple2!9532)

(assert (=> d!37232 (= res!95637 (= (bitIndex!0 (size!2366 (buf!2776 (_1!5031 lt!176584))) (currentByte!5404 (_1!5031 lt!176584)) (currentBit!5399 (_1!5031 lt!176584))) (bitIndex!0 (size!2366 (buf!2776 (_1!5031 lt!176586))) (currentByte!5404 (_1!5031 lt!176586)) (currentBit!5399 (_1!5031 lt!176586)))))))

(declare-fun lt!176585 () Unit!7113)

(declare-fun lt!176583 () BitStream!4206)

(declare-fun choose!50 (BitStream!4206 BitStream!4206 BitStream!4206 tuple2!9532 tuple2!9532 BitStream!4206 Bool tuple2!9532 tuple2!9532 BitStream!4206 Bool) Unit!7113)

(assert (=> d!37232 (= lt!176585 (choose!50 lt!176390 (_2!5032 lt!176392) lt!176583 lt!176584 (tuple2!9533 (_1!5031 lt!176584) (_2!5031 lt!176584)) (_1!5031 lt!176584) (_2!5031 lt!176584) lt!176586 (tuple2!9533 (_1!5031 lt!176586) (_2!5031 lt!176586)) (_1!5031 lt!176586) (_2!5031 lt!176586)))))

(assert (=> d!37232 (= lt!176586 (readBitPure!0 lt!176583))))

(assert (=> d!37232 (= lt!176584 (readBitPure!0 lt!176390))))

(assert (=> d!37232 (= lt!176583 (BitStream!4207 (buf!2776 (_2!5032 lt!176392)) (currentByte!5404 lt!176390) (currentBit!5399 lt!176390)))))

(assert (=> d!37232 (invariant!0 (currentBit!5399 lt!176390) (currentByte!5404 lt!176390) (size!2366 (buf!2776 (_2!5032 lt!176392))))))

(assert (=> d!37232 (= (readBitPrefixLemma!0 lt!176390 (_2!5032 lt!176392)) lt!176585)))

(declare-fun b!115711 () Bool)

(assert (=> b!115711 (= e!75831 (= (_2!5031 lt!176584) (_2!5031 lt!176586)))))

(assert (= (and d!37232 res!95637) b!115711))

(assert (=> d!37232 m!173007))

(declare-fun m!173177 () Bool)

(assert (=> d!37232 m!173177))

(declare-fun m!173179 () Bool)

(assert (=> d!37232 m!173179))

(declare-fun m!173181 () Bool)

(assert (=> d!37232 m!173181))

(declare-fun m!173183 () Bool)

(assert (=> d!37232 m!173183))

(declare-fun m!173185 () Bool)

(assert (=> d!37232 m!173185))

(assert (=> b!115606 d!37232))

(declare-fun b!115835 () Bool)

(declare-fun e!75897 () Bool)

(declare-fun lt!176903 () tuple2!9532)

(declare-fun lt!176932 () tuple2!9532)

(assert (=> b!115835 (= e!75897 (= (_2!5031 lt!176903) (_2!5031 lt!176932)))))

(declare-fun b!115836 () Bool)

(declare-fun lt!176938 () tuple2!9532)

(declare-fun lt!176902 () tuple2!9534)

(assert (=> b!115836 (= lt!176938 (readBitPure!0 (readerFrom!0 (_2!5032 lt!176902) (currentBit!5399 (_2!5032 lt!176397)) (currentByte!5404 (_2!5032 lt!176397)))))))

(declare-fun res!95738 () Bool)

(declare-fun lt!176935 () Bool)

(assert (=> b!115836 (= res!95738 (and (= (_2!5031 lt!176938) lt!176935) (= (_1!5031 lt!176938) (_2!5032 lt!176902))))))

(declare-fun e!75902 () Bool)

(assert (=> b!115836 (=> (not res!95738) (not e!75902))))

(declare-fun e!75900 () Bool)

(assert (=> b!115836 (= e!75900 e!75902)))

(declare-fun b!115837 () Bool)

(declare-fun e!75899 () (_ BitVec 64))

(assert (=> b!115837 (= e!75899 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!115838 () Bool)

(assert (=> b!115838 (= e!75902 (= (bitIndex!0 (size!2366 (buf!2776 (_1!5031 lt!176938))) (currentByte!5404 (_1!5031 lt!176938)) (currentBit!5399 (_1!5031 lt!176938))) (bitIndex!0 (size!2366 (buf!2776 (_2!5032 lt!176902))) (currentByte!5404 (_2!5032 lt!176902)) (currentBit!5399 (_2!5032 lt!176902)))))))

(declare-fun b!115839 () Bool)

(declare-fun res!95745 () Bool)

(declare-fun e!75898 () Bool)

(assert (=> b!115839 (=> (not res!95745) (not e!75898))))

(declare-fun lt!176939 () (_ BitVec 64))

(declare-fun lt!176905 () (_ BitVec 64))

(declare-fun lt!176936 () tuple2!9534)

(assert (=> b!115839 (= res!95745 (= (bitIndex!0 (size!2366 (buf!2776 (_2!5032 lt!176936))) (currentByte!5404 (_2!5032 lt!176936)) (currentBit!5399 (_2!5032 lt!176936))) (bvadd lt!176905 lt!176939)))))

(assert (=> b!115839 (or (not (= (bvand lt!176905 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!176939 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!176905 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!176905 lt!176939) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!115839 (= lt!176939 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!115839 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!115839 (= lt!176905 (bitIndex!0 (size!2366 (buf!2776 (_2!5032 lt!176397))) (currentByte!5404 (_2!5032 lt!176397)) (currentBit!5399 (_2!5032 lt!176397))))))

(declare-fun b!115840 () Bool)

(declare-fun res!95742 () Bool)

(declare-fun call!1502 () Bool)

(assert (=> b!115840 (= res!95742 call!1502)))

(assert (=> b!115840 (=> (not res!95742) (not e!75900))))

(declare-fun b!115841 () Bool)

(declare-datatypes ((tuple2!9546 0))(
  ( (tuple2!9547 (_1!5038 BitStream!4206) (_2!5038 (_ BitVec 64))) )
))
(declare-fun lt!176915 () tuple2!9546)

(declare-fun lt!176910 () tuple2!9536)

(assert (=> b!115841 (= e!75898 (and (= (_2!5038 lt!176915) v!199) (= (_1!5038 lt!176915) (_2!5033 lt!176910))))))

(declare-fun lt!176929 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4206 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9546)

(assert (=> b!115841 (= lt!176915 (readNLeastSignificantBitsLoopPure!0 (_1!5033 lt!176910) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!176929))))

(declare-fun lt!176942 () Unit!7113)

(declare-fun lt!176909 () Unit!7113)

(assert (=> b!115841 (= lt!176942 lt!176909)))

(declare-fun lt!176920 () (_ BitVec 64))

(assert (=> b!115841 (validate_offset_bits!1 ((_ sign_extend 32) (size!2366 (buf!2776 (_2!5032 lt!176936)))) ((_ sign_extend 32) (currentByte!5404 (_2!5032 lt!176397))) ((_ sign_extend 32) (currentBit!5399 (_2!5032 lt!176397))) lt!176920)))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4206 array!5215 (_ BitVec 64)) Unit!7113)

(assert (=> b!115841 (= lt!176909 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5032 lt!176397) (buf!2776 (_2!5032 lt!176936)) lt!176920))))

(declare-fun e!75901 () Bool)

(assert (=> b!115841 e!75901))

(declare-fun res!95743 () Bool)

(assert (=> b!115841 (=> (not res!95743) (not e!75901))))

(assert (=> b!115841 (= res!95743 (and (= (size!2366 (buf!2776 (_2!5032 lt!176397))) (size!2366 (buf!2776 (_2!5032 lt!176936)))) (bvsge lt!176920 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!115841 (= lt!176920 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!115841 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!115841 (= lt!176929 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!115841 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!115841 (= lt!176910 (reader!0 (_2!5032 lt!176397) (_2!5032 lt!176936)))))

(declare-fun b!115843 () Bool)

(declare-fun e!75896 () tuple2!9534)

(declare-fun lt!176908 () Unit!7113)

(assert (=> b!115843 (= e!75896 (tuple2!9535 lt!176908 (_2!5032 lt!176397)))))

(declare-fun lt!176914 () BitStream!4206)

(assert (=> b!115843 (= lt!176914 (_2!5032 lt!176397))))

(assert (=> b!115843 (= lt!176908 (lemmaIsPrefixRefl!0 lt!176914))))

(assert (=> b!115843 call!1502))

(declare-fun b!115844 () Bool)

(declare-fun lt!176927 () tuple2!9534)

(declare-fun Unit!7118 () Unit!7113)

(assert (=> b!115844 (= e!75896 (tuple2!9535 Unit!7118 (_2!5032 lt!176927)))))

(assert (=> b!115844 (= lt!176935 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!115844 (= lt!176902 (appendBit!0 (_2!5032 lt!176397) lt!176935))))

(declare-fun res!95739 () Bool)

(assert (=> b!115844 (= res!95739 (= (size!2366 (buf!2776 (_2!5032 lt!176397))) (size!2366 (buf!2776 (_2!5032 lt!176902)))))))

(assert (=> b!115844 (=> (not res!95739) (not e!75900))))

(assert (=> b!115844 e!75900))

(declare-fun lt!176924 () tuple2!9534)

(assert (=> b!115844 (= lt!176924 lt!176902)))

(assert (=> b!115844 (= lt!176927 (appendNLeastSignificantBitsLoop!0 (_2!5032 lt!176924) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!176901 () Unit!7113)

(assert (=> b!115844 (= lt!176901 (lemmaIsPrefixTransitive!0 (_2!5032 lt!176397) (_2!5032 lt!176924) (_2!5032 lt!176927)))))

(assert (=> b!115844 (isPrefixOf!0 (_2!5032 lt!176397) (_2!5032 lt!176927))))

(declare-fun lt!176913 () Unit!7113)

(assert (=> b!115844 (= lt!176913 lt!176901)))

(assert (=> b!115844 (invariant!0 (currentBit!5399 (_2!5032 lt!176397)) (currentByte!5404 (_2!5032 lt!176397)) (size!2366 (buf!2776 (_2!5032 lt!176924))))))

(declare-fun lt!176940 () BitStream!4206)

(assert (=> b!115844 (= lt!176940 (BitStream!4207 (buf!2776 (_2!5032 lt!176924)) (currentByte!5404 (_2!5032 lt!176397)) (currentBit!5399 (_2!5032 lt!176397))))))

(assert (=> b!115844 (invariant!0 (currentBit!5399 lt!176940) (currentByte!5404 lt!176940) (size!2366 (buf!2776 (_2!5032 lt!176927))))))

(declare-fun lt!176941 () BitStream!4206)

(assert (=> b!115844 (= lt!176941 (BitStream!4207 (buf!2776 (_2!5032 lt!176927)) (currentByte!5404 lt!176940) (currentBit!5399 lt!176940)))))

(assert (=> b!115844 (= lt!176903 (readBitPure!0 lt!176940))))

(assert (=> b!115844 (= lt!176932 (readBitPure!0 lt!176941))))

(declare-fun lt!176928 () Unit!7113)

(assert (=> b!115844 (= lt!176928 (readBitPrefixLemma!0 lt!176940 (_2!5032 lt!176927)))))

(declare-fun res!95741 () Bool)

(assert (=> b!115844 (= res!95741 (= (bitIndex!0 (size!2366 (buf!2776 (_1!5031 lt!176903))) (currentByte!5404 (_1!5031 lt!176903)) (currentBit!5399 (_1!5031 lt!176903))) (bitIndex!0 (size!2366 (buf!2776 (_1!5031 lt!176932))) (currentByte!5404 (_1!5031 lt!176932)) (currentBit!5399 (_1!5031 lt!176932)))))))

(assert (=> b!115844 (=> (not res!95741) (not e!75897))))

(assert (=> b!115844 e!75897))

(declare-fun lt!176900 () Unit!7113)

(assert (=> b!115844 (= lt!176900 lt!176928)))

(declare-fun lt!176911 () tuple2!9536)

(assert (=> b!115844 (= lt!176911 (reader!0 (_2!5032 lt!176397) (_2!5032 lt!176927)))))

(declare-fun lt!176917 () tuple2!9536)

(assert (=> b!115844 (= lt!176917 (reader!0 (_2!5032 lt!176924) (_2!5032 lt!176927)))))

(declare-fun lt!176918 () tuple2!9532)

(assert (=> b!115844 (= lt!176918 (readBitPure!0 (_1!5033 lt!176911)))))

(assert (=> b!115844 (= (_2!5031 lt!176918) lt!176935)))

(declare-fun lt!176916 () Unit!7113)

(declare-fun Unit!7119 () Unit!7113)

(assert (=> b!115844 (= lt!176916 Unit!7119)))

(declare-fun lt!176926 () (_ BitVec 64))

(assert (=> b!115844 (= lt!176926 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!176907 () (_ BitVec 64))

(assert (=> b!115844 (= lt!176907 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!176922 () Unit!7113)

(assert (=> b!115844 (= lt!176922 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5032 lt!176397) (buf!2776 (_2!5032 lt!176927)) lt!176907))))

(assert (=> b!115844 (validate_offset_bits!1 ((_ sign_extend 32) (size!2366 (buf!2776 (_2!5032 lt!176927)))) ((_ sign_extend 32) (currentByte!5404 (_2!5032 lt!176397))) ((_ sign_extend 32) (currentBit!5399 (_2!5032 lt!176397))) lt!176907)))

(declare-fun lt!176904 () Unit!7113)

(assert (=> b!115844 (= lt!176904 lt!176922)))

(declare-fun lt!176923 () tuple2!9546)

(assert (=> b!115844 (= lt!176923 (readNLeastSignificantBitsLoopPure!0 (_1!5033 lt!176911) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!176926))))

(declare-fun lt!176933 () (_ BitVec 64))

(assert (=> b!115844 (= lt!176933 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!176921 () Unit!7113)

(assert (=> b!115844 (= lt!176921 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5032 lt!176924) (buf!2776 (_2!5032 lt!176927)) lt!176933))))

(assert (=> b!115844 (validate_offset_bits!1 ((_ sign_extend 32) (size!2366 (buf!2776 (_2!5032 lt!176927)))) ((_ sign_extend 32) (currentByte!5404 (_2!5032 lt!176924))) ((_ sign_extend 32) (currentBit!5399 (_2!5032 lt!176924))) lt!176933)))

(declare-fun lt!176912 () Unit!7113)

(assert (=> b!115844 (= lt!176912 lt!176921)))

(declare-fun lt!176934 () tuple2!9546)

(assert (=> b!115844 (= lt!176934 (readNLeastSignificantBitsLoopPure!0 (_1!5033 lt!176917) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!176926 (ite (_2!5031 lt!176918) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!176930 () tuple2!9546)

(assert (=> b!115844 (= lt!176930 (readNLeastSignificantBitsLoopPure!0 (_1!5033 lt!176911) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!176926))))

(declare-fun c!7015 () Bool)

(assert (=> b!115844 (= c!7015 (_2!5031 (readBitPure!0 (_1!5033 lt!176911))))))

(declare-fun lt!176944 () tuple2!9546)

(assert (=> b!115844 (= lt!176944 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5033 lt!176911) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!176926 e!75899)))))

(declare-fun lt!176925 () Unit!7113)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4206 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7113)

(assert (=> b!115844 (= lt!176925 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5033 lt!176911) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!176926))))

(assert (=> b!115844 (and (= (_2!5038 lt!176930) (_2!5038 lt!176944)) (= (_1!5038 lt!176930) (_1!5038 lt!176944)))))

(declare-fun lt!176919 () Unit!7113)

(assert (=> b!115844 (= lt!176919 lt!176925)))

(assert (=> b!115844 (= (_1!5033 lt!176911) (withMovedBitIndex!0 (_2!5033 lt!176911) (bvsub (bitIndex!0 (size!2366 (buf!2776 (_2!5032 lt!176397))) (currentByte!5404 (_2!5032 lt!176397)) (currentBit!5399 (_2!5032 lt!176397))) (bitIndex!0 (size!2366 (buf!2776 (_2!5032 lt!176927))) (currentByte!5404 (_2!5032 lt!176927)) (currentBit!5399 (_2!5032 lt!176927))))))))

(declare-fun lt!176937 () Unit!7113)

(declare-fun Unit!7120 () Unit!7113)

(assert (=> b!115844 (= lt!176937 Unit!7120)))

(assert (=> b!115844 (= (_1!5033 lt!176917) (withMovedBitIndex!0 (_2!5033 lt!176917) (bvsub (bitIndex!0 (size!2366 (buf!2776 (_2!5032 lt!176924))) (currentByte!5404 (_2!5032 lt!176924)) (currentBit!5399 (_2!5032 lt!176924))) (bitIndex!0 (size!2366 (buf!2776 (_2!5032 lt!176927))) (currentByte!5404 (_2!5032 lt!176927)) (currentBit!5399 (_2!5032 lt!176927))))))))

(declare-fun lt!176906 () Unit!7113)

(declare-fun Unit!7121 () Unit!7113)

(assert (=> b!115844 (= lt!176906 Unit!7121)))

(assert (=> b!115844 (= (bitIndex!0 (size!2366 (buf!2776 (_2!5032 lt!176397))) (currentByte!5404 (_2!5032 lt!176397)) (currentBit!5399 (_2!5032 lt!176397))) (bvsub (bitIndex!0 (size!2366 (buf!2776 (_2!5032 lt!176924))) (currentByte!5404 (_2!5032 lt!176924)) (currentBit!5399 (_2!5032 lt!176924))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!176931 () Unit!7113)

(declare-fun Unit!7122 () Unit!7113)

(assert (=> b!115844 (= lt!176931 Unit!7122)))

(assert (=> b!115844 (= (_2!5038 lt!176923) (_2!5038 lt!176934))))

(declare-fun lt!176943 () Unit!7113)

(declare-fun Unit!7123 () Unit!7113)

(assert (=> b!115844 (= lt!176943 Unit!7123)))

(assert (=> b!115844 (= (_1!5038 lt!176923) (_2!5033 lt!176911))))

(declare-fun b!115845 () Bool)

(assert (=> b!115845 (= e!75901 (validate_offset_bits!1 ((_ sign_extend 32) (size!2366 (buf!2776 (_2!5032 lt!176397)))) ((_ sign_extend 32) (currentByte!5404 (_2!5032 lt!176397))) ((_ sign_extend 32) (currentBit!5399 (_2!5032 lt!176397))) lt!176920))))

(declare-fun b!115846 () Bool)

(declare-fun res!95740 () Bool)

(assert (=> b!115846 (=> (not res!95740) (not e!75898))))

(assert (=> b!115846 (= res!95740 (isPrefixOf!0 (_2!5032 lt!176397) (_2!5032 lt!176936)))))

(declare-fun b!115847 () Bool)

(assert (=> b!115847 (= e!75899 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun bm!1499 () Bool)

(declare-fun c!7016 () Bool)

(assert (=> bm!1499 (= call!1502 (isPrefixOf!0 (ite c!7016 (_2!5032 lt!176397) lt!176914) (ite c!7016 (_2!5032 lt!176902) lt!176914)))))

(declare-fun b!115842 () Bool)

(declare-fun res!95744 () Bool)

(assert (=> b!115842 (= res!95744 (= (bitIndex!0 (size!2366 (buf!2776 (_2!5032 lt!176902))) (currentByte!5404 (_2!5032 lt!176902)) (currentBit!5399 (_2!5032 lt!176902))) (bvadd (bitIndex!0 (size!2366 (buf!2776 (_2!5032 lt!176397))) (currentByte!5404 (_2!5032 lt!176397)) (currentBit!5399 (_2!5032 lt!176397))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!115842 (=> (not res!95744) (not e!75900))))

(declare-fun d!37234 () Bool)

(assert (=> d!37234 e!75898))

(declare-fun res!95746 () Bool)

(assert (=> d!37234 (=> (not res!95746) (not e!75898))))

(assert (=> d!37234 (= res!95746 (= (size!2366 (buf!2776 (_2!5032 lt!176397))) (size!2366 (buf!2776 (_2!5032 lt!176936)))))))

(assert (=> d!37234 (= lt!176936 e!75896)))

(assert (=> d!37234 (= c!7016 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!37234 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!37234 (= (appendNLeastSignificantBitsLoop!0 (_2!5032 lt!176397) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!176936)))

(assert (= (and d!37234 c!7016) b!115844))

(assert (= (and d!37234 (not c!7016)) b!115843))

(assert (= (and b!115844 res!95739) b!115842))

(assert (= (and b!115842 res!95744) b!115840))

(assert (= (and b!115840 res!95742) b!115836))

(assert (= (and b!115836 res!95738) b!115838))

(assert (= (and b!115844 res!95741) b!115835))

(assert (= (and b!115844 c!7015) b!115837))

(assert (= (and b!115844 (not c!7015)) b!115847))

(assert (= (or b!115840 b!115843) bm!1499))

(assert (= (and d!37234 res!95746) b!115839))

(assert (= (and b!115839 res!95745) b!115846))

(assert (= (and b!115846 res!95740) b!115841))

(assert (= (and b!115841 res!95743) b!115845))

(declare-fun m!173351 () Bool)

(assert (=> b!115845 m!173351))

(declare-fun m!173353 () Bool)

(assert (=> b!115839 m!173353))

(assert (=> b!115839 m!173041))

(declare-fun m!173355 () Bool)

(assert (=> b!115841 m!173355))

(declare-fun m!173357 () Bool)

(assert (=> b!115841 m!173357))

(declare-fun m!173359 () Bool)

(assert (=> b!115841 m!173359))

(declare-fun m!173361 () Bool)

(assert (=> b!115841 m!173361))

(declare-fun m!173363 () Bool)

(assert (=> b!115841 m!173363))

(declare-fun m!173365 () Bool)

(assert (=> b!115842 m!173365))

(assert (=> b!115842 m!173041))

(declare-fun m!173367 () Bool)

(assert (=> bm!1499 m!173367))

(declare-fun m!173369 () Bool)

(assert (=> b!115846 m!173369))

(declare-fun m!173371 () Bool)

(assert (=> b!115843 m!173371))

(declare-fun m!173373 () Bool)

(assert (=> b!115836 m!173373))

(assert (=> b!115836 m!173373))

(declare-fun m!173375 () Bool)

(assert (=> b!115836 m!173375))

(declare-fun m!173377 () Bool)

(assert (=> b!115844 m!173377))

(declare-fun m!173379 () Bool)

(assert (=> b!115844 m!173379))

(declare-fun m!173381 () Bool)

(assert (=> b!115844 m!173381))

(declare-fun m!173383 () Bool)

(assert (=> b!115844 m!173383))

(declare-fun m!173385 () Bool)

(assert (=> b!115844 m!173385))

(declare-fun m!173387 () Bool)

(assert (=> b!115844 m!173387))

(declare-fun m!173389 () Bool)

(assert (=> b!115844 m!173389))

(declare-fun m!173391 () Bool)

(assert (=> b!115844 m!173391))

(declare-fun m!173393 () Bool)

(assert (=> b!115844 m!173393))

(declare-fun m!173395 () Bool)

(assert (=> b!115844 m!173395))

(declare-fun m!173397 () Bool)

(assert (=> b!115844 m!173397))

(declare-fun m!173399 () Bool)

(assert (=> b!115844 m!173399))

(declare-fun m!173401 () Bool)

(assert (=> b!115844 m!173401))

(declare-fun m!173403 () Bool)

(assert (=> b!115844 m!173403))

(declare-fun m!173405 () Bool)

(assert (=> b!115844 m!173405))

(declare-fun m!173407 () Bool)

(assert (=> b!115844 m!173407))

(declare-fun m!173409 () Bool)

(assert (=> b!115844 m!173409))

(declare-fun m!173411 () Bool)

(assert (=> b!115844 m!173411))

(declare-fun m!173413 () Bool)

(assert (=> b!115844 m!173413))

(declare-fun m!173415 () Bool)

(assert (=> b!115844 m!173415))

(declare-fun m!173417 () Bool)

(assert (=> b!115844 m!173417))

(declare-fun m!173419 () Bool)

(assert (=> b!115844 m!173419))

(assert (=> b!115844 m!173041))

(declare-fun m!173421 () Bool)

(assert (=> b!115844 m!173421))

(declare-fun m!173423 () Bool)

(assert (=> b!115844 m!173423))

(assert (=> b!115844 m!173413))

(declare-fun m!173425 () Bool)

(assert (=> b!115844 m!173425))

(assert (=> b!115844 m!173359))

(declare-fun m!173427 () Bool)

(assert (=> b!115844 m!173427))

(declare-fun m!173429 () Bool)

(assert (=> b!115844 m!173429))

(declare-fun m!173431 () Bool)

(assert (=> b!115838 m!173431))

(assert (=> b!115838 m!173365))

(assert (=> b!115606 d!37234))

(declare-fun b!115848 () Bool)

(declare-fun e!75903 () Unit!7113)

(declare-fun lt!176945 () Unit!7113)

(assert (=> b!115848 (= e!75903 lt!176945)))

(declare-fun lt!176947 () (_ BitVec 64))

(assert (=> b!115848 (= lt!176947 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!176954 () (_ BitVec 64))

(assert (=> b!115848 (= lt!176954 (bitIndex!0 (size!2366 (buf!2776 thiss!1305)) (currentByte!5404 thiss!1305) (currentBit!5399 thiss!1305)))))

(assert (=> b!115848 (= lt!176945 (arrayBitRangesEqSymmetric!0 (buf!2776 thiss!1305) (buf!2776 (_2!5032 lt!176392)) lt!176947 lt!176954))))

(assert (=> b!115848 (arrayBitRangesEq!0 (buf!2776 (_2!5032 lt!176392)) (buf!2776 thiss!1305) lt!176947 lt!176954)))

(declare-fun b!115849 () Bool)

(declare-fun res!95748 () Bool)

(declare-fun e!75904 () Bool)

(assert (=> b!115849 (=> (not res!95748) (not e!75904))))

(declare-fun lt!176957 () tuple2!9536)

(assert (=> b!115849 (= res!95748 (isPrefixOf!0 (_2!5033 lt!176957) (_2!5032 lt!176392)))))

(declare-fun lt!176962 () (_ BitVec 64))

(declare-fun lt!176952 () (_ BitVec 64))

(declare-fun b!115850 () Bool)

(assert (=> b!115850 (= e!75904 (= (_1!5033 lt!176957) (withMovedBitIndex!0 (_2!5033 lt!176957) (bvsub lt!176962 lt!176952))))))

(assert (=> b!115850 (or (= (bvand lt!176962 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!176952 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!176962 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!176962 lt!176952) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!115850 (= lt!176952 (bitIndex!0 (size!2366 (buf!2776 (_2!5032 lt!176392))) (currentByte!5404 (_2!5032 lt!176392)) (currentBit!5399 (_2!5032 lt!176392))))))

(assert (=> b!115850 (= lt!176962 (bitIndex!0 (size!2366 (buf!2776 thiss!1305)) (currentByte!5404 thiss!1305) (currentBit!5399 thiss!1305)))))

(declare-fun d!37288 () Bool)

(assert (=> d!37288 e!75904))

(declare-fun res!95749 () Bool)

(assert (=> d!37288 (=> (not res!95749) (not e!75904))))

(assert (=> d!37288 (= res!95749 (isPrefixOf!0 (_1!5033 lt!176957) (_2!5033 lt!176957)))))

(declare-fun lt!176950 () BitStream!4206)

(assert (=> d!37288 (= lt!176957 (tuple2!9537 lt!176950 (_2!5032 lt!176392)))))

(declare-fun lt!176953 () Unit!7113)

(declare-fun lt!176958 () Unit!7113)

(assert (=> d!37288 (= lt!176953 lt!176958)))

(assert (=> d!37288 (isPrefixOf!0 lt!176950 (_2!5032 lt!176392))))

(assert (=> d!37288 (= lt!176958 (lemmaIsPrefixTransitive!0 lt!176950 (_2!5032 lt!176392) (_2!5032 lt!176392)))))

(declare-fun lt!176951 () Unit!7113)

(declare-fun lt!176963 () Unit!7113)

(assert (=> d!37288 (= lt!176951 lt!176963)))

(assert (=> d!37288 (isPrefixOf!0 lt!176950 (_2!5032 lt!176392))))

(assert (=> d!37288 (= lt!176963 (lemmaIsPrefixTransitive!0 lt!176950 thiss!1305 (_2!5032 lt!176392)))))

(declare-fun lt!176959 () Unit!7113)

(assert (=> d!37288 (= lt!176959 e!75903)))

(declare-fun c!7017 () Bool)

(assert (=> d!37288 (= c!7017 (not (= (size!2366 (buf!2776 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!176949 () Unit!7113)

(declare-fun lt!176948 () Unit!7113)

(assert (=> d!37288 (= lt!176949 lt!176948)))

(assert (=> d!37288 (isPrefixOf!0 (_2!5032 lt!176392) (_2!5032 lt!176392))))

(assert (=> d!37288 (= lt!176948 (lemmaIsPrefixRefl!0 (_2!5032 lt!176392)))))

(declare-fun lt!176961 () Unit!7113)

(declare-fun lt!176946 () Unit!7113)

(assert (=> d!37288 (= lt!176961 lt!176946)))

(assert (=> d!37288 (= lt!176946 (lemmaIsPrefixRefl!0 (_2!5032 lt!176392)))))

(declare-fun lt!176956 () Unit!7113)

(declare-fun lt!176955 () Unit!7113)

(assert (=> d!37288 (= lt!176956 lt!176955)))

(assert (=> d!37288 (isPrefixOf!0 lt!176950 lt!176950)))

(assert (=> d!37288 (= lt!176955 (lemmaIsPrefixRefl!0 lt!176950))))

(declare-fun lt!176964 () Unit!7113)

(declare-fun lt!176960 () Unit!7113)

(assert (=> d!37288 (= lt!176964 lt!176960)))

(assert (=> d!37288 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!37288 (= lt!176960 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!37288 (= lt!176950 (BitStream!4207 (buf!2776 (_2!5032 lt!176392)) (currentByte!5404 thiss!1305) (currentBit!5399 thiss!1305)))))

(assert (=> d!37288 (isPrefixOf!0 thiss!1305 (_2!5032 lt!176392))))

(assert (=> d!37288 (= (reader!0 thiss!1305 (_2!5032 lt!176392)) lt!176957)))

(declare-fun b!115851 () Bool)

(declare-fun res!95747 () Bool)

(assert (=> b!115851 (=> (not res!95747) (not e!75904))))

(assert (=> b!115851 (= res!95747 (isPrefixOf!0 (_1!5033 lt!176957) thiss!1305))))

(declare-fun b!115852 () Bool)

(declare-fun Unit!7125 () Unit!7113)

(assert (=> b!115852 (= e!75903 Unit!7125)))

(assert (= (and d!37288 c!7017) b!115848))

(assert (= (and d!37288 (not c!7017)) b!115852))

(assert (= (and d!37288 res!95749) b!115851))

(assert (= (and b!115851 res!95747) b!115849))

(assert (= (and b!115849 res!95748) b!115850))

(declare-fun m!173433 () Bool)

(assert (=> b!115851 m!173433))

(declare-fun m!173435 () Bool)

(assert (=> b!115849 m!173435))

(declare-fun m!173437 () Bool)

(assert (=> b!115850 m!173437))

(assert (=> b!115850 m!173109))

(assert (=> b!115850 m!173043))

(assert (=> b!115848 m!173043))

(declare-fun m!173439 () Bool)

(assert (=> b!115848 m!173439))

(declare-fun m!173441 () Bool)

(assert (=> b!115848 m!173441))

(declare-fun m!173443 () Bool)

(assert (=> d!37288 m!173443))

(declare-fun m!173445 () Bool)

(assert (=> d!37288 m!173445))

(declare-fun m!173447 () Bool)

(assert (=> d!37288 m!173447))

(declare-fun m!173449 () Bool)

(assert (=> d!37288 m!173449))

(assert (=> d!37288 m!173163))

(declare-fun m!173451 () Bool)

(assert (=> d!37288 m!173451))

(declare-fun m!173453 () Bool)

(assert (=> d!37288 m!173453))

(declare-fun m!173455 () Bool)

(assert (=> d!37288 m!173455))

(assert (=> d!37288 m!173023))

(assert (=> d!37288 m!173173))

(declare-fun m!173457 () Bool)

(assert (=> d!37288 m!173457))

(assert (=> b!115606 d!37288))

(declare-fun d!37290 () Bool)

(assert (=> d!37290 (isPrefixOf!0 thiss!1305 (_2!5032 lt!176392))))

(declare-fun lt!176967 () Unit!7113)

(declare-fun choose!30 (BitStream!4206 BitStream!4206 BitStream!4206) Unit!7113)

(assert (=> d!37290 (= lt!176967 (choose!30 thiss!1305 (_2!5032 lt!176397) (_2!5032 lt!176392)))))

(assert (=> d!37290 (isPrefixOf!0 thiss!1305 (_2!5032 lt!176397))))

(assert (=> d!37290 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5032 lt!176397) (_2!5032 lt!176392)) lt!176967)))

(declare-fun bs!9012 () Bool)

(assert (= bs!9012 d!37290))

(assert (=> bs!9012 m!173023))

(declare-fun m!173459 () Bool)

(assert (=> bs!9012 m!173459))

(assert (=> bs!9012 m!173029))

(assert (=> b!115606 d!37290))

(declare-fun d!37292 () Bool)

(declare-datatypes ((tuple2!9550 0))(
  ( (tuple2!9551 (_1!5040 Bool) (_2!5040 BitStream!4206)) )
))
(declare-fun lt!176970 () tuple2!9550)

(declare-fun readBit!0 (BitStream!4206) tuple2!9550)

(assert (=> d!37292 (= lt!176970 (readBit!0 (BitStream!4207 (buf!2776 (_2!5032 lt!176392)) (currentByte!5404 thiss!1305) (currentBit!5399 thiss!1305))))))

(assert (=> d!37292 (= (readBitPure!0 (BitStream!4207 (buf!2776 (_2!5032 lt!176392)) (currentByte!5404 thiss!1305) (currentBit!5399 thiss!1305))) (tuple2!9533 (_2!5040 lt!176970) (_1!5040 lt!176970)))))

(declare-fun bs!9013 () Bool)

(assert (= bs!9013 d!37292))

(declare-fun m!173461 () Bool)

(assert (=> bs!9013 m!173461))

(assert (=> b!115606 d!37292))

(declare-fun d!37294 () Bool)

(declare-fun lt!176971 () tuple2!9550)

(assert (=> d!37294 (= lt!176971 (readBit!0 (_1!5033 lt!176391)))))

(assert (=> d!37294 (= (readBitPure!0 (_1!5033 lt!176391)) (tuple2!9533 (_2!5040 lt!176971) (_1!5040 lt!176971)))))

(declare-fun bs!9014 () Bool)

(assert (= bs!9014 d!37294))

(declare-fun m!173463 () Bool)

(assert (=> bs!9014 m!173463))

(assert (=> b!115606 d!37294))

(declare-fun d!37296 () Bool)

(declare-fun e!75905 () Bool)

(assert (=> d!37296 e!75905))

(declare-fun res!95751 () Bool)

(assert (=> d!37296 (=> (not res!95751) (not e!75905))))

(declare-fun lt!176975 () (_ BitVec 64))

(declare-fun lt!176976 () (_ BitVec 64))

(declare-fun lt!176977 () (_ BitVec 64))

(assert (=> d!37296 (= res!95751 (= lt!176976 (bvsub lt!176977 lt!176975)))))

(assert (=> d!37296 (or (= (bvand lt!176977 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!176975 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!176977 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!176977 lt!176975) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37296 (= lt!176975 (remainingBits!0 ((_ sign_extend 32) (size!2366 (buf!2776 (_1!5031 lt!176399)))) ((_ sign_extend 32) (currentByte!5404 (_1!5031 lt!176399))) ((_ sign_extend 32) (currentBit!5399 (_1!5031 lt!176399)))))))

(declare-fun lt!176972 () (_ BitVec 64))

(declare-fun lt!176973 () (_ BitVec 64))

(assert (=> d!37296 (= lt!176977 (bvmul lt!176972 lt!176973))))

(assert (=> d!37296 (or (= lt!176972 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!176973 (bvsdiv (bvmul lt!176972 lt!176973) lt!176972)))))

(assert (=> d!37296 (= lt!176973 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37296 (= lt!176972 ((_ sign_extend 32) (size!2366 (buf!2776 (_1!5031 lt!176399)))))))

(assert (=> d!37296 (= lt!176976 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5404 (_1!5031 lt!176399))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5399 (_1!5031 lt!176399)))))))

(assert (=> d!37296 (invariant!0 (currentBit!5399 (_1!5031 lt!176399)) (currentByte!5404 (_1!5031 lt!176399)) (size!2366 (buf!2776 (_1!5031 lt!176399))))))

(assert (=> d!37296 (= (bitIndex!0 (size!2366 (buf!2776 (_1!5031 lt!176399))) (currentByte!5404 (_1!5031 lt!176399)) (currentBit!5399 (_1!5031 lt!176399))) lt!176976)))

(declare-fun b!115853 () Bool)

(declare-fun res!95750 () Bool)

(assert (=> b!115853 (=> (not res!95750) (not e!75905))))

(assert (=> b!115853 (= res!95750 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!176976))))

(declare-fun b!115854 () Bool)

(declare-fun lt!176974 () (_ BitVec 64))

(assert (=> b!115854 (= e!75905 (bvsle lt!176976 (bvmul lt!176974 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!115854 (or (= lt!176974 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!176974 #b0000000000000000000000000000000000000000000000000000000000001000) lt!176974)))))

(assert (=> b!115854 (= lt!176974 ((_ sign_extend 32) (size!2366 (buf!2776 (_1!5031 lt!176399)))))))

(assert (= (and d!37296 res!95751) b!115853))

(assert (= (and b!115853 res!95750) b!115854))

(declare-fun m!173465 () Bool)

(assert (=> d!37296 m!173465))

(declare-fun m!173467 () Bool)

(assert (=> d!37296 m!173467))

(assert (=> b!115606 d!37296))

(declare-fun d!37298 () Bool)

(declare-fun lt!176978 () tuple2!9550)

(assert (=> d!37298 (= lt!176978 (readBit!0 lt!176390))))

(assert (=> d!37298 (= (readBitPure!0 lt!176390) (tuple2!9533 (_2!5040 lt!176978) (_1!5040 lt!176978)))))

(declare-fun bs!9015 () Bool)

(assert (= bs!9015 d!37298))

(declare-fun m!173469 () Bool)

(assert (=> bs!9015 m!173469))

(assert (=> b!115606 d!37298))

(declare-fun d!37300 () Bool)

(declare-fun e!75906 () Bool)

(assert (=> d!37300 e!75906))

(declare-fun res!95753 () Bool)

(assert (=> d!37300 (=> (not res!95753) (not e!75906))))

(declare-fun lt!176986 () (_ BitVec 64))

(declare-fun lt!176985 () (_ BitVec 64))

(declare-fun lt!176984 () (_ BitVec 64))

(assert (=> d!37300 (= res!95753 (= lt!176985 (bvsub lt!176986 lt!176984)))))

(assert (=> d!37300 (or (= (bvand lt!176986 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!176984 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!176986 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!176986 lt!176984) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37300 (= lt!176984 (remainingBits!0 ((_ sign_extend 32) (size!2366 (buf!2776 (_1!5031 lt!176400)))) ((_ sign_extend 32) (currentByte!5404 (_1!5031 lt!176400))) ((_ sign_extend 32) (currentBit!5399 (_1!5031 lt!176400)))))))

(declare-fun lt!176981 () (_ BitVec 64))

(declare-fun lt!176982 () (_ BitVec 64))

(assert (=> d!37300 (= lt!176986 (bvmul lt!176981 lt!176982))))

(assert (=> d!37300 (or (= lt!176981 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!176982 (bvsdiv (bvmul lt!176981 lt!176982) lt!176981)))))

(assert (=> d!37300 (= lt!176982 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37300 (= lt!176981 ((_ sign_extend 32) (size!2366 (buf!2776 (_1!5031 lt!176400)))))))

(assert (=> d!37300 (= lt!176985 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5404 (_1!5031 lt!176400))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5399 (_1!5031 lt!176400)))))))

(assert (=> d!37300 (invariant!0 (currentBit!5399 (_1!5031 lt!176400)) (currentByte!5404 (_1!5031 lt!176400)) (size!2366 (buf!2776 (_1!5031 lt!176400))))))

(assert (=> d!37300 (= (bitIndex!0 (size!2366 (buf!2776 (_1!5031 lt!176400))) (currentByte!5404 (_1!5031 lt!176400)) (currentBit!5399 (_1!5031 lt!176400))) lt!176985)))

(declare-fun b!115855 () Bool)

(declare-fun res!95752 () Bool)

(assert (=> b!115855 (=> (not res!95752) (not e!75906))))

(assert (=> b!115855 (= res!95752 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!176985))))

(declare-fun b!115856 () Bool)

(declare-fun lt!176983 () (_ BitVec 64))

(assert (=> b!115856 (= e!75906 (bvsle lt!176985 (bvmul lt!176983 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!115856 (or (= lt!176983 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!176983 #b0000000000000000000000000000000000000000000000000000000000001000) lt!176983)))))

(assert (=> b!115856 (= lt!176983 ((_ sign_extend 32) (size!2366 (buf!2776 (_1!5031 lt!176400)))))))

(assert (= (and d!37300 res!95753) b!115855))

(assert (= (and b!115855 res!95752) b!115856))

(declare-fun m!173471 () Bool)

(assert (=> d!37300 m!173471))

(declare-fun m!173473 () Bool)

(assert (=> d!37300 m!173473))

(assert (=> b!115599 d!37300))

(declare-fun d!37302 () Bool)

(assert (=> d!37302 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2366 (buf!2776 thiss!1305))) ((_ sign_extend 32) (currentByte!5404 thiss!1305)) ((_ sign_extend 32) (currentBit!5399 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2366 (buf!2776 thiss!1305))) ((_ sign_extend 32) (currentByte!5404 thiss!1305)) ((_ sign_extend 32) (currentBit!5399 thiss!1305))) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun bs!9016 () Bool)

(assert (= bs!9016 d!37302))

(assert (=> bs!9016 m!173103))

(assert (=> b!115604 d!37302))

(declare-fun d!37304 () Bool)

(assert (=> d!37304 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5399 thiss!1305) (currentByte!5404 thiss!1305) (size!2366 (buf!2776 thiss!1305))))))

(declare-fun bs!9017 () Bool)

(assert (= bs!9017 d!37304))

(assert (=> bs!9017 m!173105))

(assert (=> start!22870 d!37304))

(declare-fun d!37306 () Bool)

(assert (=> d!37306 (= (invariant!0 (currentBit!5399 thiss!1305) (currentByte!5404 thiss!1305) (size!2366 (buf!2776 (_2!5032 lt!176392)))) (and (bvsge (currentBit!5399 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5399 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5404 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5404 thiss!1305) (size!2366 (buf!2776 (_2!5032 lt!176392)))) (and (= (currentBit!5399 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5404 thiss!1305) (size!2366 (buf!2776 (_2!5032 lt!176392))))))))))

(assert (=> b!115605 d!37306))

(declare-fun d!37308 () Bool)

(declare-fun lt!177001 () tuple2!9550)

(assert (=> d!37308 (= lt!177001 (readBit!0 (readerFrom!0 (_2!5032 lt!176397) (currentBit!5399 thiss!1305) (currentByte!5404 thiss!1305))))))

(assert (=> d!37308 (= (readBitPure!0 (readerFrom!0 (_2!5032 lt!176397) (currentBit!5399 thiss!1305) (currentByte!5404 thiss!1305))) (tuple2!9533 (_2!5040 lt!177001) (_1!5040 lt!177001)))))

(declare-fun bs!9018 () Bool)

(assert (= bs!9018 d!37308))

(assert (=> bs!9018 m!173031))

(declare-fun m!173475 () Bool)

(assert (=> bs!9018 m!173475))

(assert (=> b!115608 d!37308))

(declare-fun d!37310 () Bool)

(declare-fun e!75917 () Bool)

(assert (=> d!37310 e!75917))

(declare-fun res!95767 () Bool)

(assert (=> d!37310 (=> (not res!95767) (not e!75917))))

(assert (=> d!37310 (= res!95767 (invariant!0 (currentBit!5399 (_2!5032 lt!176397)) (currentByte!5404 (_2!5032 lt!176397)) (size!2366 (buf!2776 (_2!5032 lt!176397)))))))

(assert (=> d!37310 (= (readerFrom!0 (_2!5032 lt!176397) (currentBit!5399 thiss!1305) (currentByte!5404 thiss!1305)) (BitStream!4207 (buf!2776 (_2!5032 lt!176397)) (currentByte!5404 thiss!1305) (currentBit!5399 thiss!1305)))))

(declare-fun b!115873 () Bool)

(assert (=> b!115873 (= e!75917 (invariant!0 (currentBit!5399 thiss!1305) (currentByte!5404 thiss!1305) (size!2366 (buf!2776 (_2!5032 lt!176397)))))))

(assert (= (and d!37310 res!95767) b!115873))

(assert (=> d!37310 m!173101))

(assert (=> b!115873 m!173049))

(assert (=> b!115608 d!37310))

(declare-fun d!37312 () Bool)

(assert (=> d!37312 (= (invariant!0 (currentBit!5399 thiss!1305) (currentByte!5404 thiss!1305) (size!2366 (buf!2776 (_2!5032 lt!176397)))) (and (bvsge (currentBit!5399 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5399 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5404 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5404 thiss!1305) (size!2366 (buf!2776 (_2!5032 lt!176397)))) (and (= (currentBit!5399 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5404 thiss!1305) (size!2366 (buf!2776 (_2!5032 lt!176397))))))))))

(assert (=> b!115609 d!37312))

(check-sat (not b!115873) (not b!115841) (not d!37308) (not bm!1499) (not d!37300) (not d!37296) (not d!37194) (not d!37290) (not b!115838) (not b!115675) (not b!115836) (not d!37232) (not d!37298) (not b!115842) (not b!115678) (not d!37304) (not b!115850) (not b!115843) (not d!37310) (not b!115845) (not b!115849) (not b!115851) (not b!115663) (not b!115844) (not d!37206) (not d!37292) (not b!115704) (not b!115839) (not b!115705) (not d!37192) (not b!115660) (not b!115846) (not b!115677) (not d!37208) (not d!37302) (not b!115665) (not b!115848) (not b!115706) (not b!115676) (not d!37294) (not d!37204) (not b!115707) (not d!37288) (not b!115662))
