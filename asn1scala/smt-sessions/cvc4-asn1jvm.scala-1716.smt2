; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47394 () Bool)

(assert start!47394)

(declare-fun b!226070 () Bool)

(declare-fun e!154487 () Bool)

(declare-fun lt!359174 () (_ BitVec 64))

(declare-fun lt!359177 () (_ BitVec 64))

(assert (=> b!226070 (= e!154487 (not (or (not (= lt!359174 #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!359174 (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!359177) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!226070 (= lt!359174 (bvand lt!359177 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((array!11295 0))(
  ( (array!11296 (arr!5913 (Array (_ BitVec 32) (_ BitVec 8))) (size!4956 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9008 0))(
  ( (BitStream!9009 (buf!5497 array!11295) (currentByte!10299 (_ BitVec 32)) (currentBit!10294 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9008)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!226070 (= lt!359177 (bitIndex!0 (size!4956 (buf!5497 thiss!1870)) (currentByte!10299 thiss!1870) (currentBit!10294 thiss!1870)))))

(declare-fun arr!308 () array!11295)

(declare-datatypes ((Unit!16657 0))(
  ( (Unit!16658) )
))
(declare-datatypes ((tuple3!1294 0))(
  ( (tuple3!1295 (_1!10470 Unit!16657) (_2!10470 BitStream!9008) (_3!789 array!11295)) )
))
(declare-fun lt!359178 () tuple3!1294)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!19362 0))(
  ( (tuple2!19363 (_1!10471 (_ BitVec 8)) (_2!10471 BitStream!9008)) )
))
(declare-fun lt!359176 () tuple2!19362)

(declare-fun readByteArrayLoop!0 (BitStream!9008 array!11295 (_ BitVec 32) (_ BitVec 32)) tuple3!1294)

(assert (=> b!226070 (= lt!359178 (readByteArrayLoop!0 (_2!10471 lt!359176) (array!11296 (store (arr!5913 arr!308) i!761 (_1!10471 lt!359176)) (size!4956 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!226070 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4956 (buf!5497 (_2!10471 lt!359176)))) ((_ sign_extend 32) (currentByte!10299 (_2!10471 lt!359176))) ((_ sign_extend 32) (currentBit!10294 (_2!10471 lt!359176))) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!359175 () Unit!16657)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9008 BitStream!9008 (_ BitVec 64) (_ BitVec 32)) Unit!16657)

(assert (=> b!226070 (= lt!359175 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10471 lt!359176) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!9008) tuple2!19362)

(assert (=> b!226070 (= lt!359176 (readByte!0 thiss!1870))))

(declare-fun b!226071 () Bool)

(declare-fun e!154489 () Bool)

(declare-fun array_inv!4697 (array!11295) Bool)

(assert (=> b!226071 (= e!154489 (array_inv!4697 (buf!5497 thiss!1870)))))

(declare-fun b!226069 () Bool)

(declare-fun res!189705 () Bool)

(assert (=> b!226069 (=> (not res!189705) (not e!154487))))

(assert (=> b!226069 (= res!189705 (bvslt i!761 to!496))))

(declare-fun res!189706 () Bool)

(assert (=> start!47394 (=> (not res!189706) (not e!154487))))

(assert (=> start!47394 (= res!189706 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4956 arr!308))))))

(assert (=> start!47394 e!154487))

(assert (=> start!47394 true))

(assert (=> start!47394 (array_inv!4697 arr!308)))

(declare-fun inv!12 (BitStream!9008) Bool)

(assert (=> start!47394 (and (inv!12 thiss!1870) e!154489)))

(declare-fun b!226068 () Bool)

(declare-fun res!189704 () Bool)

(assert (=> b!226068 (=> (not res!189704) (not e!154487))))

(assert (=> b!226068 (= res!189704 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4956 (buf!5497 thiss!1870))) ((_ sign_extend 32) (currentByte!10299 thiss!1870)) ((_ sign_extend 32) (currentBit!10294 thiss!1870)) (bvsub to!496 i!761)))))

(assert (= (and start!47394 res!189706) b!226068))

(assert (= (and b!226068 res!189704) b!226069))

(assert (= (and b!226069 res!189705) b!226070))

(assert (= start!47394 b!226071))

(declare-fun m!347129 () Bool)

(assert (=> b!226070 m!347129))

(declare-fun m!347131 () Bool)

(assert (=> b!226070 m!347131))

(declare-fun m!347133 () Bool)

(assert (=> b!226070 m!347133))

(declare-fun m!347135 () Bool)

(assert (=> b!226070 m!347135))

(declare-fun m!347137 () Bool)

(assert (=> b!226070 m!347137))

(declare-fun m!347139 () Bool)

(assert (=> b!226070 m!347139))

(declare-fun m!347141 () Bool)

(assert (=> b!226071 m!347141))

(declare-fun m!347143 () Bool)

(assert (=> start!47394 m!347143))

(declare-fun m!347145 () Bool)

(assert (=> start!47394 m!347145))

(declare-fun m!347147 () Bool)

(assert (=> b!226068 m!347147))

(push 1)

(assert (not b!226071))

(assert (not start!47394))

(assert (not b!226068))

(assert (not b!226070))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!76704 () Bool)

(assert (=> d!76704 (= (array_inv!4697 (buf!5497 thiss!1870)) (bvsge (size!4956 (buf!5497 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!226071 d!76704))

(declare-fun d!76706 () Bool)

(assert (=> d!76706 (= (array_inv!4697 arr!308) (bvsge (size!4956 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!47394 d!76706))

(declare-fun d!76708 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!76708 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10294 thiss!1870) (currentByte!10299 thiss!1870) (size!4956 (buf!5497 thiss!1870))))))

(declare-fun bs!18754 () Bool)

(assert (= bs!18754 d!76708))

(declare-fun m!347151 () Bool)

(assert (=> bs!18754 m!347151))

(assert (=> start!47394 d!76708))

(declare-fun d!76710 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!76710 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4956 (buf!5497 thiss!1870))) ((_ sign_extend 32) (currentByte!10299 thiss!1870)) ((_ sign_extend 32) (currentBit!10294 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4956 (buf!5497 thiss!1870))) ((_ sign_extend 32) (currentByte!10299 thiss!1870)) ((_ sign_extend 32) (currentBit!10294 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18755 () Bool)

(assert (= bs!18755 d!76710))

(declare-fun m!347153 () Bool)

(assert (=> bs!18755 m!347153))

(assert (=> b!226068 d!76710))

(declare-fun d!76712 () Bool)

(declare-fun lt!359214 () (_ BitVec 8))

(declare-fun lt!359220 () (_ BitVec 8))

(assert (=> d!76712 (= lt!359214 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5913 (buf!5497 thiss!1870)) (currentByte!10299 thiss!1870))) ((_ sign_extend 24) lt!359220))))))

(assert (=> d!76712 (= lt!359220 ((_ extract 7 0) (currentBit!10294 thiss!1870)))))

(declare-fun e!154500 () Bool)

(assert (=> d!76712 e!154500))

(declare-fun res!189720 () Bool)

(assert (=> d!76712 (=> (not res!189720) (not e!154500))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!76712 (= res!189720 (validate_offset_bits!1 ((_ sign_extend 32) (size!4956 (buf!5497 thiss!1870))) ((_ sign_extend 32) (currentByte!10299 thiss!1870)) ((_ sign_extend 32) (currentBit!10294 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!19366 0))(
  ( (tuple2!19367 (_1!10473 Unit!16657) (_2!10473 (_ BitVec 8))) )
))
(declare-fun Unit!16663 () Unit!16657)

(declare-fun Unit!16664 () Unit!16657)

(assert (=> d!76712 (= (readByte!0 thiss!1870) (tuple2!19363 (_2!10473 (ite (bvsgt ((_ sign_extend 24) lt!359220) #b00000000000000000000000000000000) (tuple2!19367 Unit!16663 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!359214) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5913 (buf!5497 thiss!1870)) (bvadd (currentByte!10299 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!359220)))))))) (tuple2!19367 Unit!16664 lt!359214))) (BitStream!9009 (buf!5497 thiss!1870) (bvadd (currentByte!10299 thiss!1870) #b00000000000000000000000000000001) (currentBit!10294 thiss!1870))))))

(declare-fun b!226082 () Bool)

(declare-fun e!154501 () Bool)

(assert (=> b!226082 (= e!154500 e!154501)))

(declare-fun res!189719 () Bool)

(assert (=> b!226082 (=> (not res!189719) (not e!154501))))

(declare-fun lt!359215 () tuple2!19362)

(assert (=> b!226082 (= res!189719 (= (buf!5497 (_2!10471 lt!359215)) (buf!5497 thiss!1870)))))

(declare-fun lt!359217 () (_ BitVec 8))

(declare-fun lt!359219 () (_ BitVec 8))

(declare-fun Unit!16665 () Unit!16657)

(declare-fun Unit!16666 () Unit!16657)

(assert (=> b!226082 (= lt!359215 (tuple2!19363 (_2!10473 (ite (bvsgt ((_ sign_extend 24) lt!359217) #b00000000000000000000000000000000) (tuple2!19367 Unit!16665 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!359219) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5913 (buf!5497 thiss!1870)) (bvadd (currentByte!10299 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!359217)))))))) (tuple2!19367 Unit!16666 lt!359219))) (BitStream!9009 (buf!5497 thiss!1870) (bvadd (currentByte!10299 thiss!1870) #b00000000000000000000000000000001) (currentBit!10294 thiss!1870))))))

(assert (=> b!226082 (= lt!359219 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5913 (buf!5497 thiss!1870)) (currentByte!10299 thiss!1870))) ((_ sign_extend 24) lt!359217))))))

(assert (=> b!226082 (= lt!359217 ((_ extract 7 0) (currentBit!10294 thiss!1870)))))

(declare-fun lt!359218 () (_ BitVec 64))

(declare-fun b!226083 () Bool)

(declare-fun lt!359216 () (_ BitVec 64))

(assert (=> b!226083 (= e!154501 (= (bitIndex!0 (size!4956 (buf!5497 (_2!10471 lt!359215))) (currentByte!10299 (_2!10471 lt!359215)) (currentBit!10294 (_2!10471 lt!359215))) (bvadd lt!359216 lt!359218)))))

(assert (=> b!226083 (or (not (= (bvand lt!359216 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!359218 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!359216 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!359216 lt!359218) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!226083 (= lt!359218 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!226083 (= lt!359216 (bitIndex!0 (size!4956 (buf!5497 thiss!1870)) (currentByte!10299 thiss!1870) (currentBit!10294 thiss!1870)))))

(assert (= (and d!76712 res!189720) b!226082))

(assert (= (and b!226082 res!189719) b!226083))

(declare-fun m!347163 () Bool)

(assert (=> d!76712 m!347163))

(declare-fun m!347165 () Bool)

(assert (=> d!76712 m!347165))

(declare-fun m!347167 () Bool)

(assert (=> d!76712 m!347167))

(assert (=> b!226082 m!347167))

(assert (=> b!226082 m!347163))

(declare-fun m!347169 () Bool)

(assert (=> b!226083 m!347169))

(assert (=> b!226083 m!347137))

(assert (=> b!226070 d!76712))

(declare-fun lt!359426 () tuple3!1294)

(declare-fun b!226115 () Bool)

(declare-fun e!154524 () Bool)

(declare-datatypes ((tuple2!19370 0))(
  ( (tuple2!19371 (_1!10475 BitStream!9008) (_2!10475 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!9008) tuple2!19370)

(assert (=> b!226115 (= e!154524 (= (select (arr!5913 (_3!789 lt!359426)) (bvadd #b00000000000000000000000000000001 i!761)) (_2!10475 (readBytePure!0 (_2!10471 lt!359176)))))))

(assert (=> b!226115 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4956 (_3!789 lt!359426))))))

(declare-fun e!154523 () tuple3!1294)

(declare-fun b!226116 () Bool)

(declare-fun lt!359433 () Unit!16657)

(assert (=> b!226116 (= e!154523 (tuple3!1295 lt!359433 (_2!10471 lt!359176) (array!11296 (store (arr!5913 arr!308) i!761 (_1!10471 lt!359176)) (size!4956 arr!308))))))

(declare-fun call!3683 () (_ BitVec 64))

(assert (=> b!226116 (= call!3683 call!3683)))

(declare-fun lt!359436 () Unit!16657)

(declare-fun Unit!16668 () Unit!16657)

(assert (=> b!226116 (= lt!359436 Unit!16668)))

(declare-fun lt!359424 () Unit!16657)

(declare-fun arrayRangesEqReflexiveLemma!116 (array!11295) Unit!16657)

(assert (=> b!226116 (= lt!359424 (arrayRangesEqReflexiveLemma!116 (array!11296 (store (arr!5913 arr!308) i!761 (_1!10471 lt!359176)) (size!4956 arr!308))))))

(declare-fun call!3682 () Bool)

(assert (=> b!226116 call!3682))

(declare-fun lt!359447 () Unit!16657)

(assert (=> b!226116 (= lt!359447 lt!359424)))

(declare-fun lt!359434 () array!11295)

(assert (=> b!226116 (= lt!359434 (array!11296 (store (arr!5913 arr!308) i!761 (_1!10471 lt!359176)) (size!4956 arr!308)))))

(declare-fun lt!359455 () array!11295)

(assert (=> b!226116 (= lt!359455 (array!11296 (store (arr!5913 arr!308) i!761 (_1!10471 lt!359176)) (size!4956 arr!308)))))

(declare-fun lt!359429 () (_ BitVec 32))

(assert (=> b!226116 (= lt!359429 #b00000000000000000000000000000000)))

(declare-fun lt!359441 () (_ BitVec 32))

(assert (=> b!226116 (= lt!359441 (size!4956 (array!11296 (store (arr!5913 arr!308) i!761 (_1!10471 lt!359176)) (size!4956 arr!308))))))

(declare-fun lt!359422 () (_ BitVec 32))

(assert (=> b!226116 (= lt!359422 #b00000000000000000000000000000000)))

(declare-fun lt!359432 () (_ BitVec 32))

(assert (=> b!226116 (= lt!359432 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun arrayRangesEqSlicedLemma!101 (array!11295 array!11295 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16657)

(assert (=> b!226116 (= lt!359433 (arrayRangesEqSlicedLemma!101 lt!359434 lt!359455 lt!359429 lt!359441 lt!359422 lt!359432))))

(declare-fun call!3684 () Bool)

(assert (=> b!226116 call!3684))

(declare-fun lt!359452 () tuple3!1294)

(declare-fun bm!3679 () Bool)

(declare-fun c!11155 () Bool)

(assert (=> bm!3679 (= call!3683 (bitIndex!0 (ite c!11155 (size!4956 (buf!5497 (_2!10470 lt!359452))) (size!4956 (buf!5497 (_2!10471 lt!359176)))) (ite c!11155 (currentByte!10299 (_2!10470 lt!359452)) (currentByte!10299 (_2!10471 lt!359176))) (ite c!11155 (currentBit!10294 (_2!10470 lt!359452)) (currentBit!10294 (_2!10471 lt!359176)))))))

(declare-fun bm!3680 () Bool)

(declare-fun arrayRangesEq!812 (array!11295 array!11295 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!3680 (= call!3682 (arrayRangesEq!812 (array!11296 (store (arr!5913 arr!308) i!761 (_1!10471 lt!359176)) (size!4956 arr!308)) (ite c!11155 (_3!789 lt!359452) (array!11296 (store (arr!5913 arr!308) i!761 (_1!10471 lt!359176)) (size!4956 arr!308))) #b00000000000000000000000000000000 (ite c!11155 (bvadd #b00000000000000000000000000000001 i!761) (size!4956 (array!11296 (store (arr!5913 arr!308) i!761 (_1!10471 lt!359176)) (size!4956 arr!308))))))))

(declare-fun b!226117 () Bool)

(declare-fun lt!359435 () Unit!16657)

(assert (=> b!226117 (= e!154523 (tuple3!1295 lt!359435 (_2!10470 lt!359452) (_3!789 lt!359452)))))

(declare-fun lt!359437 () tuple2!19362)

(assert (=> b!226117 (= lt!359437 (readByte!0 (_2!10471 lt!359176)))))

(declare-fun lt!359457 () array!11295)

(assert (=> b!226117 (= lt!359457 (array!11296 (store (arr!5913 (array!11296 (store (arr!5913 arr!308) i!761 (_1!10471 lt!359176)) (size!4956 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10471 lt!359437)) (size!4956 (array!11296 (store (arr!5913 arr!308) i!761 (_1!10471 lt!359176)) (size!4956 arr!308)))))))

(declare-fun lt!359444 () (_ BitVec 64))

(assert (=> b!226117 (= lt!359444 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!359445 () (_ BitVec 32))

(assert (=> b!226117 (= lt!359445 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!359443 () Unit!16657)

(assert (=> b!226117 (= lt!359443 (validateOffsetBytesFromBitIndexLemma!0 (_2!10471 lt!359176) (_2!10471 lt!359437) lt!359444 lt!359445))))

(assert (=> b!226117 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4956 (buf!5497 (_2!10471 lt!359437)))) ((_ sign_extend 32) (currentByte!10299 (_2!10471 lt!359437))) ((_ sign_extend 32) (currentBit!10294 (_2!10471 lt!359437))) (bvsub lt!359445 ((_ extract 31 0) (bvsdiv (bvadd lt!359444 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!359456 () Unit!16657)

(assert (=> b!226117 (= lt!359456 lt!359443)))

(assert (=> b!226117 (= lt!359452 (readByteArrayLoop!0 (_2!10471 lt!359437) lt!359457 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(assert (=> b!226117 (= (bitIndex!0 (size!4956 (buf!5497 (_2!10471 lt!359437))) (currentByte!10299 (_2!10471 lt!359437)) (currentBit!10294 (_2!10471 lt!359437))) (bvadd (bitIndex!0 (size!4956 (buf!5497 (_2!10471 lt!359176))) (currentByte!10299 (_2!10471 lt!359176)) (currentBit!10294 (_2!10471 lt!359176))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!359430 () Unit!16657)

(declare-fun Unit!16675 () Unit!16657)

(assert (=> b!226117 (= lt!359430 Unit!16675)))

(assert (=> b!226117 (= (bvadd (bitIndex!0 (size!4956 (buf!5497 (_2!10471 lt!359437))) (currentByte!10299 (_2!10471 lt!359437)) (currentBit!10294 (_2!10471 lt!359437))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!3683)))

(declare-fun lt!359423 () Unit!16657)

(declare-fun Unit!16676 () Unit!16657)

(assert (=> b!226117 (= lt!359423 Unit!16676)))

(assert (=> b!226117 (= (bvadd (bitIndex!0 (size!4956 (buf!5497 (_2!10471 lt!359176))) (currentByte!10299 (_2!10471 lt!359176)) (currentBit!10294 (_2!10471 lt!359176))) (bvmul ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))) #b0000000000000000000000000000000000000000000000000000000000001000)) call!3683)))

(declare-fun lt!359454 () Unit!16657)

(declare-fun Unit!16677 () Unit!16657)

(assert (=> b!226117 (= lt!359454 Unit!16677)))

(assert (=> b!226117 (and (= (buf!5497 (_2!10471 lt!359176)) (buf!5497 (_2!10470 lt!359452))) (= (size!4956 (array!11296 (store (arr!5913 arr!308) i!761 (_1!10471 lt!359176)) (size!4956 arr!308))) (size!4956 (_3!789 lt!359452))))))

(declare-fun lt!359442 () Unit!16657)

(declare-fun Unit!16678 () Unit!16657)

(assert (=> b!226117 (= lt!359442 Unit!16678)))

(declare-fun lt!359438 () Unit!16657)

(declare-fun arrayUpdatedAtPrefixLemma!371 (array!11295 (_ BitVec 32) (_ BitVec 8)) Unit!16657)

(assert (=> b!226117 (= lt!359438 (arrayUpdatedAtPrefixLemma!371 (array!11296 (store (arr!5913 arr!308) i!761 (_1!10471 lt!359176)) (size!4956 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) (_1!10471 lt!359437)))))

(assert (=> b!226117 (arrayRangesEq!812 (array!11296 (store (arr!5913 arr!308) i!761 (_1!10471 lt!359176)) (size!4956 arr!308)) (array!11296 (store (arr!5913 (array!11296 (store (arr!5913 arr!308) i!761 (_1!10471 lt!359176)) (size!4956 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10471 lt!359437)) (size!4956 (array!11296 (store (arr!5913 arr!308) i!761 (_1!10471 lt!359176)) (size!4956 arr!308)))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun lt!359451 () Unit!16657)

(assert (=> b!226117 (= lt!359451 lt!359438)))

(declare-fun lt!359425 () (_ BitVec 32))

(assert (=> b!226117 (= lt!359425 #b00000000000000000000000000000000)))

(declare-fun lt!359450 () Unit!16657)

(declare-fun arrayRangesEqTransitive!250 (array!11295 array!11295 array!11295 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16657)

(assert (=> b!226117 (= lt!359450 (arrayRangesEqTransitive!250 (array!11296 (store (arr!5913 arr!308) i!761 (_1!10471 lt!359176)) (size!4956 arr!308)) lt!359457 (_3!789 lt!359452) lt!359425 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!226117 call!3684))

(declare-fun lt!359431 () Unit!16657)

(assert (=> b!226117 (= lt!359431 lt!359450)))

(assert (=> b!226117 call!3682))

(declare-fun lt!359427 () Unit!16657)

(declare-fun Unit!16679 () Unit!16657)

(assert (=> b!226117 (= lt!359427 Unit!16679)))

(declare-fun lt!359439 () Unit!16657)

(declare-fun arrayRangesEqImpliesEq!101 (array!11295 array!11295 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16657)

(assert (=> b!226117 (= lt!359439 (arrayRangesEqImpliesEq!101 lt!359457 (_3!789 lt!359452) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!226117 (= (select (store (arr!5913 (array!11296 (store (arr!5913 arr!308) i!761 (_1!10471 lt!359176)) (size!4956 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10471 lt!359437)) (bvadd #b00000000000000000000000000000001 i!761)) (select (arr!5913 (_3!789 lt!359452)) (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!359448 () Unit!16657)

(assert (=> b!226117 (= lt!359448 lt!359439)))

(declare-fun lt!359428 () Bool)

(assert (=> b!226117 (= lt!359428 (= (select (arr!5913 (_3!789 lt!359452)) (bvadd #b00000000000000000000000000000001 i!761)) (_1!10471 lt!359437)))))

(declare-fun Unit!16680 () Unit!16657)

(assert (=> b!226117 (= lt!359435 Unit!16680)))

(assert (=> b!226117 lt!359428))

(declare-fun b!226118 () Bool)

(declare-fun res!189744 () Bool)

(declare-fun e!154525 () Bool)

(assert (=> b!226118 (=> (not res!189744) (not e!154525))))

(assert (=> b!226118 (= res!189744 (and (= (buf!5497 (_2!10471 lt!359176)) (buf!5497 (_2!10470 lt!359426))) (= (size!4956 (array!11296 (store (arr!5913 arr!308) i!761 (_1!10471 lt!359176)) (size!4956 arr!308))) (size!4956 (_3!789 lt!359426)))))))

(declare-fun d!76718 () Bool)

(assert (=> d!76718 e!154524))

(declare-fun res!189743 () Bool)

(assert (=> d!76718 (=> res!189743 e!154524)))

(assert (=> d!76718 (= res!189743 (bvsge (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!359440 () Bool)

(assert (=> d!76718 (= lt!359440 e!154525)))

(declare-fun res!189745 () Bool)

(assert (=> d!76718 (=> (not res!189745) (not e!154525))))

(declare-fun lt!359446 () (_ BitVec 64))

(declare-fun lt!359453 () (_ BitVec 64))

(assert (=> d!76718 (= res!189745 (= (bvadd lt!359446 lt!359453) (bitIndex!0 (size!4956 (buf!5497 (_2!10470 lt!359426))) (currentByte!10299 (_2!10470 lt!359426)) (currentBit!10294 (_2!10470 lt!359426)))))))

(assert (=> d!76718 (or (not (= (bvand lt!359446 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!359453 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!359446 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!359446 lt!359453) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!359449 () (_ BitVec 64))

(assert (=> d!76718 (= lt!359453 (bvmul lt!359449 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!76718 (or (= lt!359449 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!359449 #b0000000000000000000000000000000000000000000000000000000000001000) lt!359449)))))

(assert (=> d!76718 (= lt!359449 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))))))

(assert (=> d!76718 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b10000000000000000000000000000000)))))

(assert (=> d!76718 (= lt!359446 (bitIndex!0 (size!4956 (buf!5497 (_2!10471 lt!359176))) (currentByte!10299 (_2!10471 lt!359176)) (currentBit!10294 (_2!10471 lt!359176))))))

(assert (=> d!76718 (= lt!359426 e!154523)))

(assert (=> d!76718 (= c!11155 (bvslt (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> d!76718 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) to!496) (bvsle to!496 (size!4956 (array!11296 (store (arr!5913 arr!308) i!761 (_1!10471 lt!359176)) (size!4956 arr!308)))))))

(assert (=> d!76718 (= (readByteArrayLoop!0 (_2!10471 lt!359176) (array!11296 (store (arr!5913 arr!308) i!761 (_1!10471 lt!359176)) (size!4956 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496) lt!359426)))

(declare-fun b!226119 () Bool)

(assert (=> b!226119 (= e!154525 (arrayRangesEq!812 (array!11296 (store (arr!5913 arr!308) i!761 (_1!10471 lt!359176)) (size!4956 arr!308)) (_3!789 lt!359426) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun bm!3681 () Bool)

(assert (=> bm!3681 (= call!3684 (arrayRangesEq!812 (ite c!11155 (array!11296 (store (arr!5913 arr!308) i!761 (_1!10471 lt!359176)) (size!4956 arr!308)) lt!359434) (ite c!11155 (_3!789 lt!359452) lt!359455) (ite c!11155 lt!359425 lt!359422) (ite c!11155 (bvadd #b00000000000000000000000000000001 i!761) lt!359432)))))

(assert (= (and d!76718 c!11155) b!226117))

(assert (= (and d!76718 (not c!11155)) b!226116))

(assert (= (or b!226117 b!226116) bm!3680))

(assert (= (or b!226117 b!226116) bm!3681))

(assert (= (or b!226117 b!226116) bm!3679))

(assert (= (and d!76718 res!189745) b!226118))

(assert (= (and b!226118 res!189744) b!226119))

(assert (= (and d!76718 (not res!189743)) b!226115))

(declare-fun m!347227 () Bool)

(assert (=> bm!3680 m!347227))

(declare-fun m!347229 () Bool)

(assert (=> b!226119 m!347229))

(declare-fun m!347231 () Bool)

(assert (=> bm!3679 m!347231))

(declare-fun m!347233 () Bool)

(assert (=> b!226117 m!347233))

(declare-fun m!347235 () Bool)

(assert (=> b!226117 m!347235))

(declare-fun m!347237 () Bool)

(assert (=> b!226117 m!347237))

(declare-fun m!347239 () Bool)

(assert (=> b!226117 m!347239))

(declare-fun m!347241 () Bool)

(assert (=> b!226117 m!347241))

(declare-fun m!347243 () Bool)

(assert (=> b!226117 m!347243))

(declare-fun m!347245 () Bool)

(assert (=> b!226117 m!347245))

(declare-fun m!347247 () Bool)

(assert (=> b!226117 m!347247))

(declare-fun m!347249 () Bool)

(assert (=> b!226117 m!347249))

(declare-fun m!347251 () Bool)

(assert (=> b!226117 m!347251))

(declare-fun m!347253 () Bool)

(assert (=> b!226117 m!347253))

(declare-fun m!347255 () Bool)

(assert (=> b!226117 m!347255))

(declare-fun m!347257 () Bool)

(assert (=> b!226117 m!347257))

(declare-fun m!347259 () Bool)

(assert (=> b!226116 m!347259))

(declare-fun m!347261 () Bool)

(assert (=> b!226116 m!347261))

(declare-fun m!347263 () Bool)

(assert (=> d!76718 m!347263))

(assert (=> d!76718 m!347251))

(declare-fun m!347265 () Bool)

(assert (=> b!226115 m!347265))

(declare-fun m!347267 () Bool)

(assert (=> b!226115 m!347267))

(declare-fun m!347269 () Bool)

(assert (=> bm!3681 m!347269))

(assert (=> b!226070 d!76718))

(declare-fun d!76732 () Bool)

(declare-fun e!154531 () Bool)

(assert (=> d!76732 e!154531))

(declare-fun res!189757 () Bool)

(assert (=> d!76732 (=> (not res!189757) (not e!154531))))

(declare-fun lt!359493 () (_ BitVec 64))

(declare-fun lt!359491 () (_ BitVec 64))

(declare-fun lt!359492 () (_ BitVec 64))

(assert (=> d!76732 (= res!189757 (= lt!359492 (bvsub lt!359491 lt!359493)))))

(assert (=> d!76732 (or (= (bvand lt!359491 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!359493 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!359491 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!359491 lt!359493) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!76732 (= lt!359493 (remainingBits!0 ((_ sign_extend 32) (size!4956 (buf!5497 thiss!1870))) ((_ sign_extend 32) (currentByte!10299 thiss!1870)) ((_ sign_extend 32) (currentBit!10294 thiss!1870))))))

(declare-fun lt!359489 () (_ BitVec 64))

(declare-fun lt!359488 () (_ BitVec 64))

(assert (=> d!76732 (= lt!359491 (bvmul lt!359489 lt!359488))))

(assert (=> d!76732 (or (= lt!359489 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!359488 (bvsdiv (bvmul lt!359489 lt!359488) lt!359489)))))

(assert (=> d!76732 (= lt!359488 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76732 (= lt!359489 ((_ sign_extend 32) (size!4956 (buf!5497 thiss!1870))))))

(assert (=> d!76732 (= lt!359492 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10299 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10294 thiss!1870))))))

(assert (=> d!76732 (invariant!0 (currentBit!10294 thiss!1870) (currentByte!10299 thiss!1870) (size!4956 (buf!5497 thiss!1870)))))

(assert (=> d!76732 (= (bitIndex!0 (size!4956 (buf!5497 thiss!1870)) (currentByte!10299 thiss!1870) (currentBit!10294 thiss!1870)) lt!359492)))

(declare-fun b!226130 () Bool)

(declare-fun res!189756 () Bool)

(assert (=> b!226130 (=> (not res!189756) (not e!154531))))

(assert (=> b!226130 (= res!189756 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!359492))))

(declare-fun b!226131 () Bool)

(declare-fun lt!359490 () (_ BitVec 64))

(assert (=> b!226131 (= e!154531 (bvsle lt!359492 (bvmul lt!359490 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!226131 (or (= lt!359490 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!359490 #b0000000000000000000000000000000000000000000000000000000000001000) lt!359490)))))

(assert (=> b!226131 (= lt!359490 ((_ sign_extend 32) (size!4956 (buf!5497 thiss!1870))))))

(assert (= (and d!76732 res!189757) b!226130))

(assert (= (and b!226130 res!189756) b!226131))

(assert (=> d!76732 m!347153))

(assert (=> d!76732 m!347151))

(assert (=> b!226070 d!76732))

(declare-fun d!76738 () Bool)

(declare-fun e!154537 () Bool)

(assert (=> d!76738 e!154537))

(declare-fun res!189763 () Bool)

(assert (=> d!76738 (=> (not res!189763) (not e!154537))))

(assert (=> d!76738 (= res!189763 (and (or (let ((rhs!3842 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3842 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3842) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!76740 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!76740 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!76740 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3839 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3839 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3839) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!359511 () Unit!16657)

(declare-fun choose!57 (BitStream!9008 BitStream!9008 (_ BitVec 64) (_ BitVec 32)) Unit!16657)

(assert (=> d!76738 (= lt!359511 (choose!57 thiss!1870 (_2!10471 lt!359176) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> d!76738 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10471 lt!359176) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)) lt!359511)))

(declare-fun lt!359510 () (_ BitVec 32))

(declare-fun b!226137 () Bool)

(assert (=> b!226137 (= e!154537 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4956 (buf!5497 (_2!10471 lt!359176)))) ((_ sign_extend 32) (currentByte!10299 (_2!10471 lt!359176))) ((_ sign_extend 32) (currentBit!10294 (_2!10471 lt!359176))) (bvsub (bvsub to!496 i!761) lt!359510)))))

(assert (=> b!226137 (or (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand lt!359510 #b10000000000000000000000000000000)) (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!496 i!761) lt!359510) #b10000000000000000000000000000000)))))

(declare-fun lt!359509 () (_ BitVec 64))

(assert (=> b!226137 (= lt!359510 ((_ extract 31 0) lt!359509))))

(assert (=> b!226137 (and (bvslt lt!359509 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!359509 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!226137 (= lt!359509 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!76738 res!189763) b!226137))

(declare-fun m!347279 () Bool)

(assert (=> d!76738 m!347279))

(declare-fun m!347281 () Bool)

(assert (=> b!226137 m!347281))

(assert (=> b!226070 d!76738))

(declare-fun d!76748 () Bool)

(assert (=> d!76748 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4956 (buf!5497 (_2!10471 lt!359176)))) ((_ sign_extend 32) (currentByte!10299 (_2!10471 lt!359176))) ((_ sign_extend 32) (currentBit!10294 (_2!10471 lt!359176))) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4956 (buf!5497 (_2!10471 lt!359176)))) ((_ sign_extend 32) (currentByte!10299 (_2!10471 lt!359176))) ((_ sign_extend 32) (currentBit!10294 (_2!10471 lt!359176)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18759 () Bool)

(assert (= bs!18759 d!76748))

(declare-fun m!347283 () Bool)

(assert (=> bs!18759 m!347283))

(assert (=> b!226070 d!76748))

(push 1)

(assert (not bm!3679))

(assert (not d!76710))

(assert (not bm!3680))

(assert (not bm!3681))

(assert (not b!226119))

(assert (not b!226083))

(assert (not d!76748))

(assert (not d!76718))

(assert (not d!76708))

(assert (not b!226116))

(assert (not d!76738))

(assert (not b!226137))

(assert (not d!76732))

(assert (not b!226115))

(assert (not d!76712))

(assert (not b!226117))

(check-sat)

(pop 1)

(push 1)

(check-sat)

