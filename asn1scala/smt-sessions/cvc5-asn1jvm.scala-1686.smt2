; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46766 () Bool)

(assert start!46766)

(declare-fun res!188316 () Bool)

(declare-fun e!152916 () Bool)

(assert (=> start!46766 (=> (not res!188316) (not e!152916))))

(declare-datatypes ((array!11082 0))(
  ( (array!11083 (arr!5812 (Array (_ BitVec 32) (_ BitVec 8))) (size!4864 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11082)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!46766 (= res!188316 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4864 arr!308))))))

(assert (=> start!46766 e!152916))

(assert (=> start!46766 true))

(declare-fun array_inv!4605 (array!11082) Bool)

(assert (=> start!46766 (array_inv!4605 arr!308)))

(declare-datatypes ((BitStream!8830 0))(
  ( (BitStream!8831 (buf!5408 array!11082) (currentByte!10136 (_ BitVec 32)) (currentBit!10131 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8830)

(declare-fun e!152918 () Bool)

(declare-fun inv!12 (BitStream!8830) Bool)

(assert (=> start!46766 (and (inv!12 thiss!1870) e!152918)))

(declare-fun b!224375 () Bool)

(declare-fun res!188315 () Bool)

(assert (=> b!224375 (=> (not res!188315) (not e!152916))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!224375 (= res!188315 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4864 (buf!5408 thiss!1870))) ((_ sign_extend 32) (currentByte!10136 thiss!1870)) ((_ sign_extend 32) (currentBit!10131 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!224377 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224377 (= e!152916 (not (invariant!0 (currentBit!10131 thiss!1870) (currentByte!10136 thiss!1870) (size!4864 (buf!5408 thiss!1870)))))))

(declare-datatypes ((tuple2!19216 0))(
  ( (tuple2!19217 (_1!10377 (_ BitVec 8)) (_2!10377 BitStream!8830)) )
))
(declare-fun lt!356130 () tuple2!19216)

(declare-datatypes ((Unit!16397 0))(
  ( (Unit!16398) )
))
(declare-datatypes ((tuple3!1254 0))(
  ( (tuple3!1255 (_1!10378 Unit!16397) (_2!10378 BitStream!8830) (_3!769 array!11082)) )
))
(declare-fun lt!356136 () tuple3!1254)

(assert (=> b!224377 (and (= (_1!10377 lt!356130) (select (arr!5812 (_3!769 lt!356136)) i!761)) (= (select (arr!5812 (_3!769 lt!356136)) i!761) (_1!10377 lt!356130)))))

(declare-fun lt!356137 () array!11082)

(declare-fun lt!356131 () Unit!16397)

(declare-fun arrayRangesEqImpliesEq!82 (array!11082 array!11082 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16397)

(assert (=> b!224377 (= lt!356131 (arrayRangesEqImpliesEq!82 lt!356137 (_3!769 lt!356136) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun arrayRangesEq!760 (array!11082 array!11082 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224377 (arrayRangesEq!760 arr!308 (_3!769 lt!356136) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!356134 () Unit!16397)

(declare-fun arrayRangesEqTransitive!231 (array!11082 array!11082 array!11082 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16397)

(assert (=> b!224377 (= lt!356134 (arrayRangesEqTransitive!231 arr!308 lt!356137 (_3!769 lt!356136) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!224377 (arrayRangesEq!760 arr!308 lt!356137 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!356138 () Unit!16397)

(declare-fun arrayUpdatedAtPrefixLemma!352 (array!11082 (_ BitVec 32) (_ BitVec 8)) Unit!16397)

(assert (=> b!224377 (= lt!356138 (arrayUpdatedAtPrefixLemma!352 arr!308 i!761 (_1!10377 lt!356130)))))

(declare-fun lt!356133 () (_ BitVec 64))

(declare-fun lt!356132 () (_ BitVec 64))

(declare-fun lt!356129 () (_ BitVec 64))

(declare-fun lt!356135 () (_ BitVec 32))

(assert (=> b!224377 (and (= (bvadd lt!356133 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!356135))) lt!356132) (= (bvadd lt!356129 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!356132) (= (buf!5408 thiss!1870) (buf!5408 (_2!10378 lt!356136))) (= (size!4864 arr!308) (size!4864 (_3!769 lt!356136))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!224377 (= lt!356132 (bitIndex!0 (size!4864 (buf!5408 (_2!10378 lt!356136))) (currentByte!10136 (_2!10378 lt!356136)) (currentBit!10131 (_2!10378 lt!356136))))))

(assert (=> b!224377 (= lt!356133 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!356129))))

(assert (=> b!224377 (= lt!356133 (bitIndex!0 (size!4864 (buf!5408 (_2!10377 lt!356130))) (currentByte!10136 (_2!10377 lt!356130)) (currentBit!10131 (_2!10377 lt!356130))))))

(assert (=> b!224377 (= lt!356129 (bitIndex!0 (size!4864 (buf!5408 thiss!1870)) (currentByte!10136 thiss!1870) (currentBit!10131 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8830 array!11082 (_ BitVec 32) (_ BitVec 32)) tuple3!1254)

(assert (=> b!224377 (= lt!356136 (readByteArrayLoop!0 (_2!10377 lt!356130) lt!356137 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!224377 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4864 (buf!5408 (_2!10377 lt!356130)))) ((_ sign_extend 32) (currentByte!10136 (_2!10377 lt!356130))) ((_ sign_extend 32) (currentBit!10131 (_2!10377 lt!356130))) lt!356135)))

(assert (=> b!224377 (= lt!356135 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!356139 () Unit!16397)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8830 BitStream!8830 (_ BitVec 64) (_ BitVec 32)) Unit!16397)

(assert (=> b!224377 (= lt!356139 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10377 lt!356130) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!224377 (= lt!356137 (array!11083 (store (arr!5812 arr!308) i!761 (_1!10377 lt!356130)) (size!4864 arr!308)))))

(declare-fun readByte!0 (BitStream!8830) tuple2!19216)

(assert (=> b!224377 (= lt!356130 (readByte!0 thiss!1870))))

(declare-fun b!224376 () Bool)

(declare-fun res!188314 () Bool)

(assert (=> b!224376 (=> (not res!188314) (not e!152916))))

(assert (=> b!224376 (= res!188314 (bvslt i!761 to!496))))

(declare-fun b!224378 () Bool)

(assert (=> b!224378 (= e!152918 (array_inv!4605 (buf!5408 thiss!1870)))))

(assert (= (and start!46766 res!188316) b!224375))

(assert (= (and b!224375 res!188315) b!224376))

(assert (= (and b!224376 res!188314) b!224377))

(assert (= start!46766 b!224378))

(declare-fun m!344471 () Bool)

(assert (=> start!46766 m!344471))

(declare-fun m!344473 () Bool)

(assert (=> start!46766 m!344473))

(declare-fun m!344475 () Bool)

(assert (=> b!224375 m!344475))

(declare-fun m!344477 () Bool)

(assert (=> b!224377 m!344477))

(declare-fun m!344479 () Bool)

(assert (=> b!224377 m!344479))

(declare-fun m!344481 () Bool)

(assert (=> b!224377 m!344481))

(declare-fun m!344483 () Bool)

(assert (=> b!224377 m!344483))

(declare-fun m!344485 () Bool)

(assert (=> b!224377 m!344485))

(declare-fun m!344487 () Bool)

(assert (=> b!224377 m!344487))

(declare-fun m!344489 () Bool)

(assert (=> b!224377 m!344489))

(declare-fun m!344491 () Bool)

(assert (=> b!224377 m!344491))

(declare-fun m!344493 () Bool)

(assert (=> b!224377 m!344493))

(declare-fun m!344495 () Bool)

(assert (=> b!224377 m!344495))

(declare-fun m!344497 () Bool)

(assert (=> b!224377 m!344497))

(declare-fun m!344499 () Bool)

(assert (=> b!224377 m!344499))

(declare-fun m!344501 () Bool)

(assert (=> b!224377 m!344501))

(declare-fun m!344503 () Bool)

(assert (=> b!224377 m!344503))

(declare-fun m!344505 () Bool)

(assert (=> b!224377 m!344505))

(declare-fun m!344507 () Bool)

(assert (=> b!224378 m!344507))

(push 1)

(assert (not b!224378))

(assert (not start!46766))

(assert (not b!224377))

(assert (not b!224375))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!76039 () Bool)

(assert (=> d!76039 (= (array_inv!4605 (buf!5408 thiss!1870)) (bvsge (size!4864 (buf!5408 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!224378 d!76039))

(declare-fun d!76041 () Bool)

(assert (=> d!76041 (= (array_inv!4605 arr!308) (bvsge (size!4864 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!46766 d!76041))

(declare-fun d!76043 () Bool)

(assert (=> d!76043 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10131 thiss!1870) (currentByte!10136 thiss!1870) (size!4864 (buf!5408 thiss!1870))))))

(declare-fun bs!18561 () Bool)

(assert (= bs!18561 d!76043))

(assert (=> bs!18561 m!344497))

(assert (=> start!46766 d!76043))

(declare-fun d!76045 () Bool)

(declare-fun e!152945 () Bool)

(assert (=> d!76045 e!152945))

(declare-fun res!188340 () Bool)

(assert (=> d!76045 (=> (not res!188340) (not e!152945))))

(declare-fun lt!356220 () (_ BitVec 64))

(declare-fun lt!356222 () (_ BitVec 64))

(declare-fun lt!356221 () (_ BitVec 64))

(assert (=> d!76045 (= res!188340 (= lt!356222 (bvsub lt!356220 lt!356221)))))

(assert (=> d!76045 (or (= (bvand lt!356220 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!356221 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!356220 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!356220 lt!356221) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!76045 (= lt!356221 (remainingBits!0 ((_ sign_extend 32) (size!4864 (buf!5408 (_2!10377 lt!356130)))) ((_ sign_extend 32) (currentByte!10136 (_2!10377 lt!356130))) ((_ sign_extend 32) (currentBit!10131 (_2!10377 lt!356130)))))))

(declare-fun lt!356223 () (_ BitVec 64))

(declare-fun lt!356219 () (_ BitVec 64))

(assert (=> d!76045 (= lt!356220 (bvmul lt!356223 lt!356219))))

(assert (=> d!76045 (or (= lt!356223 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!356219 (bvsdiv (bvmul lt!356223 lt!356219) lt!356223)))))

(assert (=> d!76045 (= lt!356219 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76045 (= lt!356223 ((_ sign_extend 32) (size!4864 (buf!5408 (_2!10377 lt!356130)))))))

(assert (=> d!76045 (= lt!356222 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10136 (_2!10377 lt!356130))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10131 (_2!10377 lt!356130)))))))

(assert (=> d!76045 (invariant!0 (currentBit!10131 (_2!10377 lt!356130)) (currentByte!10136 (_2!10377 lt!356130)) (size!4864 (buf!5408 (_2!10377 lt!356130))))))

(assert (=> d!76045 (= (bitIndex!0 (size!4864 (buf!5408 (_2!10377 lt!356130))) (currentByte!10136 (_2!10377 lt!356130)) (currentBit!10131 (_2!10377 lt!356130))) lt!356222)))

(declare-fun b!224407 () Bool)

(declare-fun res!188339 () Bool)

(assert (=> b!224407 (=> (not res!188339) (not e!152945))))

(assert (=> b!224407 (= res!188339 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!356222))))

(declare-fun b!224408 () Bool)

(declare-fun lt!356218 () (_ BitVec 64))

(assert (=> b!224408 (= e!152945 (bvsle lt!356222 (bvmul lt!356218 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!224408 (or (= lt!356218 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!356218 #b0000000000000000000000000000000000000000000000000000000000001000) lt!356218)))))

(assert (=> b!224408 (= lt!356218 ((_ sign_extend 32) (size!4864 (buf!5408 (_2!10377 lt!356130)))))))

(assert (= (and d!76045 res!188340) b!224407))

(assert (= (and b!224407 res!188339) b!224408))

(declare-fun m!344587 () Bool)

(assert (=> d!76045 m!344587))

(declare-fun m!344589 () Bool)

(assert (=> d!76045 m!344589))

(assert (=> b!224377 d!76045))

(declare-fun d!76047 () Bool)

(declare-fun lt!356245 () (_ BitVec 8))

(declare-fun lt!356243 () (_ BitVec 8))

(assert (=> d!76047 (= lt!356245 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5812 (buf!5408 thiss!1870)) (currentByte!10136 thiss!1870))) ((_ sign_extend 24) lt!356243))))))

(assert (=> d!76047 (= lt!356243 ((_ extract 7 0) (currentBit!10131 thiss!1870)))))

(declare-fun e!152954 () Bool)

(assert (=> d!76047 e!152954))

(declare-fun res!188349 () Bool)

(assert (=> d!76047 (=> (not res!188349) (not e!152954))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!76047 (= res!188349 (validate_offset_bits!1 ((_ sign_extend 32) (size!4864 (buf!5408 thiss!1870))) ((_ sign_extend 32) (currentByte!10136 thiss!1870)) ((_ sign_extend 32) (currentBit!10131 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!19224 0))(
  ( (tuple2!19225 (_1!10384 Unit!16397) (_2!10384 (_ BitVec 8))) )
))
(declare-fun Unit!16410 () Unit!16397)

(declare-fun Unit!16411 () Unit!16397)

(assert (=> d!76047 (= (readByte!0 thiss!1870) (tuple2!19217 (_2!10384 (ite (bvsgt ((_ sign_extend 24) lt!356243) #b00000000000000000000000000000000) (tuple2!19225 Unit!16410 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!356245) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5812 (buf!5408 thiss!1870)) (bvadd (currentByte!10136 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!356243)))))))) (tuple2!19225 Unit!16411 lt!356245))) (BitStream!8831 (buf!5408 thiss!1870) (bvadd (currentByte!10136 thiss!1870) #b00000000000000000000000000000001) (currentBit!10131 thiss!1870))))))

(declare-fun b!224416 () Bool)

(declare-fun e!152953 () Bool)

(assert (=> b!224416 (= e!152954 e!152953)))

(declare-fun res!188350 () Bool)

(assert (=> b!224416 (=> (not res!188350) (not e!152953))))

(declare-fun lt!356244 () tuple2!19216)

(assert (=> b!224416 (= res!188350 (= (buf!5408 (_2!10377 lt!356244)) (buf!5408 thiss!1870)))))

(declare-fun lt!356242 () (_ BitVec 8))

(declare-fun lt!356241 () (_ BitVec 8))

(declare-fun Unit!16412 () Unit!16397)

(declare-fun Unit!16413 () Unit!16397)

(assert (=> b!224416 (= lt!356244 (tuple2!19217 (_2!10384 (ite (bvsgt ((_ sign_extend 24) lt!356241) #b00000000000000000000000000000000) (tuple2!19225 Unit!16412 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!356242) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5812 (buf!5408 thiss!1870)) (bvadd (currentByte!10136 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!356241)))))))) (tuple2!19225 Unit!16413 lt!356242))) (BitStream!8831 (buf!5408 thiss!1870) (bvadd (currentByte!10136 thiss!1870) #b00000000000000000000000000000001) (currentBit!10131 thiss!1870))))))

(assert (=> b!224416 (= lt!356242 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5812 (buf!5408 thiss!1870)) (currentByte!10136 thiss!1870))) ((_ sign_extend 24) lt!356241))))))

(assert (=> b!224416 (= lt!356241 ((_ extract 7 0) (currentBit!10131 thiss!1870)))))

(declare-fun lt!356246 () (_ BitVec 64))

(declare-fun b!224417 () Bool)

(declare-fun lt!356247 () (_ BitVec 64))

(assert (=> b!224417 (= e!152953 (= (bitIndex!0 (size!4864 (buf!5408 (_2!10377 lt!356244))) (currentByte!10136 (_2!10377 lt!356244)) (currentBit!10131 (_2!10377 lt!356244))) (bvadd lt!356246 lt!356247)))))

(assert (=> b!224417 (or (not (= (bvand lt!356246 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!356247 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!356246 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!356246 lt!356247) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!224417 (= lt!356247 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!224417 (= lt!356246 (bitIndex!0 (size!4864 (buf!5408 thiss!1870)) (currentByte!10136 thiss!1870) (currentBit!10131 thiss!1870)))))

(assert (= (and d!76047 res!188349) b!224416))

(assert (= (and b!224416 res!188350) b!224417))

(declare-fun m!344595 () Bool)

(assert (=> d!76047 m!344595))

(declare-fun m!344597 () Bool)

(assert (=> d!76047 m!344597))

(declare-fun m!344599 () Bool)

(assert (=> d!76047 m!344599))

(assert (=> b!224416 m!344599))

(assert (=> b!224416 m!344595))

(declare-fun m!344601 () Bool)

(assert (=> b!224417 m!344601))

(assert (=> b!224417 m!344493))

(assert (=> b!224377 d!76047))

(declare-fun d!76055 () Bool)

(declare-fun res!188355 () Bool)

(declare-fun e!152959 () Bool)

(assert (=> d!76055 (=> res!188355 e!152959)))

(assert (=> d!76055 (= res!188355 (= #b00000000000000000000000000000000 i!761))))

(assert (=> d!76055 (= (arrayRangesEq!760 arr!308 (_3!769 lt!356136) #b00000000000000000000000000000000 i!761) e!152959)))

(declare-fun b!224422 () Bool)

(declare-fun e!152960 () Bool)

(assert (=> b!224422 (= e!152959 e!152960)))

(declare-fun res!188356 () Bool)

(assert (=> b!224422 (=> (not res!188356) (not e!152960))))

(assert (=> b!224422 (= res!188356 (= (select (arr!5812 arr!308) #b00000000000000000000000000000000) (select (arr!5812 (_3!769 lt!356136)) #b00000000000000000000000000000000)))))

(declare-fun b!224423 () Bool)

(assert (=> b!224423 (= e!152960 (arrayRangesEq!760 arr!308 (_3!769 lt!356136) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) i!761))))

(assert (= (and d!76055 (not res!188355)) b!224422))

(assert (= (and b!224422 res!188356) b!224423))

(declare-fun m!344603 () Bool)

(assert (=> b!224422 m!344603))

(declare-fun m!344605 () Bool)

(assert (=> b!224422 m!344605))

(declare-fun m!344607 () Bool)

(assert (=> b!224423 m!344607))

(assert (=> b!224377 d!76055))

(declare-fun d!76057 () Bool)

(assert (=> d!76057 (arrayRangesEq!760 arr!308 (_3!769 lt!356136) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!356250 () Unit!16397)

(declare-fun choose!282 (array!11082 array!11082 array!11082 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16397)

(assert (=> d!76057 (= lt!356250 (choose!282 arr!308 lt!356137 (_3!769 lt!356136) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!76057 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!76057 (= (arrayRangesEqTransitive!231 arr!308 lt!356137 (_3!769 lt!356136) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)) lt!356250)))

(declare-fun bs!18562 () Bool)

(assert (= bs!18562 d!76057))

(assert (=> bs!18562 m!344489))

(declare-fun m!344609 () Bool)

(assert (=> bs!18562 m!344609))

(assert (=> b!224377 d!76057))

(declare-fun d!76059 () Bool)

(declare-fun res!188357 () Bool)

(declare-fun e!152961 () Bool)

(assert (=> d!76059 (=> res!188357 e!152961)))

(assert (=> d!76059 (= res!188357 (= #b00000000000000000000000000000000 i!761))))

(assert (=> d!76059 (= (arrayRangesEq!760 arr!308 lt!356137 #b00000000000000000000000000000000 i!761) e!152961)))

(declare-fun b!224424 () Bool)

(declare-fun e!152962 () Bool)

(assert (=> b!224424 (= e!152961 e!152962)))

(declare-fun res!188358 () Bool)

(assert (=> b!224424 (=> (not res!188358) (not e!152962))))

(assert (=> b!224424 (= res!188358 (= (select (arr!5812 arr!308) #b00000000000000000000000000000000) (select (arr!5812 lt!356137) #b00000000000000000000000000000000)))))

(declare-fun b!224425 () Bool)

(assert (=> b!224425 (= e!152962 (arrayRangesEq!760 arr!308 lt!356137 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) i!761))))

(assert (= (and d!76059 (not res!188357)) b!224424))

(assert (= (and b!224424 res!188358) b!224425))

(assert (=> b!224424 m!344603))

(declare-fun m!344611 () Bool)

(assert (=> b!224424 m!344611))

(declare-fun m!344613 () Bool)

(assert (=> b!224425 m!344613))

(assert (=> b!224377 d!76059))

(declare-fun d!76061 () Bool)

(assert (=> d!76061 (and (bvsge i!761 #b00000000000000000000000000000000) (bvslt i!761 (size!4864 lt!356137)) (bvslt i!761 (size!4864 (_3!769 lt!356136))) (= (select (arr!5812 lt!356137) i!761) (select (arr!5812 (_3!769 lt!356136)) i!761)))))

(declare-fun lt!356253 () Unit!16397)

(declare-fun choose!283 (array!11082 array!11082 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16397)

(assert (=> d!76061 (= lt!356253 (choose!283 lt!356137 (_3!769 lt!356136) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!76061 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!76061 (= (arrayRangesEqImpliesEq!82 lt!356137 (_3!769 lt!356136) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)) lt!356253)))

(declare-fun bs!18563 () Bool)

(assert (= bs!18563 d!76061))

(declare-fun m!344615 () Bool)

(assert (=> bs!18563 m!344615))

(assert (=> bs!18563 m!344501))

(declare-fun m!344617 () Bool)

(assert (=> bs!18563 m!344617))

(assert (=> b!224377 d!76061))

(declare-fun d!76063 () Bool)

(assert (=> d!76063 (= (invariant!0 (currentBit!10131 thiss!1870) (currentByte!10136 thiss!1870) (size!4864 (buf!5408 thiss!1870))) (and (bvsge (currentBit!10131 thiss!1870) #b00000000000000000000000000000000) (bvslt (currentBit!10131 thiss!1870) #b00000000000000000000000000001000) (bvsge (currentByte!10136 thiss!1870) #b00000000000000000000000000000000) (or (bvslt (currentByte!10136 thiss!1870) (size!4864 (buf!5408 thiss!1870))) (and (= (currentBit!10131 thiss!1870) #b00000000000000000000000000000000) (= (currentByte!10136 thiss!1870) (size!4864 (buf!5408 thiss!1870)))))))))

(assert (=> b!224377 d!76063))

(declare-fun d!76065 () Bool)

(declare-fun e!152963 () Bool)

(assert (=> d!76065 e!152963))

(declare-fun res!188360 () Bool)

(assert (=> d!76065 (=> (not res!188360) (not e!152963))))

(declare-fun lt!356256 () (_ BitVec 64))

(declare-fun lt!356257 () (_ BitVec 64))

(declare-fun lt!356258 () (_ BitVec 64))

(assert (=> d!76065 (= res!188360 (= lt!356258 (bvsub lt!356256 lt!356257)))))

(assert (=> d!76065 (or (= (bvand lt!356256 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!356257 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!356256 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!356256 lt!356257) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!76065 (= lt!356257 (remainingBits!0 ((_ sign_extend 32) (size!4864 (buf!5408 (_2!10378 lt!356136)))) ((_ sign_extend 32) (currentByte!10136 (_2!10378 lt!356136))) ((_ sign_extend 32) (currentBit!10131 (_2!10378 lt!356136)))))))

(declare-fun lt!356259 () (_ BitVec 64))

(declare-fun lt!356255 () (_ BitVec 64))

(assert (=> d!76065 (= lt!356256 (bvmul lt!356259 lt!356255))))

(assert (=> d!76065 (or (= lt!356259 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!356255 (bvsdiv (bvmul lt!356259 lt!356255) lt!356259)))))

(assert (=> d!76065 (= lt!356255 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76065 (= lt!356259 ((_ sign_extend 32) (size!4864 (buf!5408 (_2!10378 lt!356136)))))))

(assert (=> d!76065 (= lt!356258 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10136 (_2!10378 lt!356136))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10131 (_2!10378 lt!356136)))))))

(assert (=> d!76065 (invariant!0 (currentBit!10131 (_2!10378 lt!356136)) (currentByte!10136 (_2!10378 lt!356136)) (size!4864 (buf!5408 (_2!10378 lt!356136))))))

(assert (=> d!76065 (= (bitIndex!0 (size!4864 (buf!5408 (_2!10378 lt!356136))) (currentByte!10136 (_2!10378 lt!356136)) (currentBit!10131 (_2!10378 lt!356136))) lt!356258)))

(declare-fun b!224426 () Bool)

(declare-fun res!188359 () Bool)

(assert (=> b!224426 (=> (not res!188359) (not e!152963))))

(assert (=> b!224426 (= res!188359 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!356258))))

(declare-fun b!224427 () Bool)

(declare-fun lt!356254 () (_ BitVec 64))

(assert (=> b!224427 (= e!152963 (bvsle lt!356258 (bvmul lt!356254 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!224427 (or (= lt!356254 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!356254 #b0000000000000000000000000000000000000000000000000000000000001000) lt!356254)))))

(assert (=> b!224427 (= lt!356254 ((_ sign_extend 32) (size!4864 (buf!5408 (_2!10378 lt!356136)))))))

(assert (= (and d!76065 res!188360) b!224426))

(assert (= (and b!224426 res!188359) b!224427))

(declare-fun m!344619 () Bool)

(assert (=> d!76065 m!344619))

(declare-fun m!344621 () Bool)

(assert (=> d!76065 m!344621))

(assert (=> b!224377 d!76065))

(declare-fun d!76067 () Bool)

(assert (=> d!76067 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4864 (buf!5408 (_2!10377 lt!356130)))) ((_ sign_extend 32) (currentByte!10136 (_2!10377 lt!356130))) ((_ sign_extend 32) (currentBit!10131 (_2!10377 lt!356130))) lt!356135) (bvsle ((_ sign_extend 32) lt!356135) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4864 (buf!5408 (_2!10377 lt!356130)))) ((_ sign_extend 32) (currentByte!10136 (_2!10377 lt!356130))) ((_ sign_extend 32) (currentBit!10131 (_2!10377 lt!356130)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18564 () Bool)

(assert (= bs!18564 d!76067))

(assert (=> bs!18564 m!344587))

(assert (=> b!224377 d!76067))

(declare-fun d!76069 () Bool)

(declare-fun e!152964 () Bool)

(assert (=> d!76069 e!152964))

(declare-fun res!188362 () Bool)

(assert (=> d!76069 (=> (not res!188362) (not e!152964))))

(declare-fun lt!356264 () (_ BitVec 64))

(declare-fun lt!356262 () (_ BitVec 64))

(declare-fun lt!356263 () (_ BitVec 64))

(assert (=> d!76069 (= res!188362 (= lt!356264 (bvsub lt!356262 lt!356263)))))

(assert (=> d!76069 (or (= (bvand lt!356262 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!356263 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!356262 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!356262 lt!356263) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!76069 (= lt!356263 (remainingBits!0 ((_ sign_extend 32) (size!4864 (buf!5408 thiss!1870))) ((_ sign_extend 32) (currentByte!10136 thiss!1870)) ((_ sign_extend 32) (currentBit!10131 thiss!1870))))))

(declare-fun lt!356265 () (_ BitVec 64))

(declare-fun lt!356261 () (_ BitVec 64))

(assert (=> d!76069 (= lt!356262 (bvmul lt!356265 lt!356261))))

(assert (=> d!76069 (or (= lt!356265 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!356261 (bvsdiv (bvmul lt!356265 lt!356261) lt!356265)))))

(assert (=> d!76069 (= lt!356261 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76069 (= lt!356265 ((_ sign_extend 32) (size!4864 (buf!5408 thiss!1870))))))

(assert (=> d!76069 (= lt!356264 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10136 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10131 thiss!1870))))))

(assert (=> d!76069 (invariant!0 (currentBit!10131 thiss!1870) (currentByte!10136 thiss!1870) (size!4864 (buf!5408 thiss!1870)))))

(assert (=> d!76069 (= (bitIndex!0 (size!4864 (buf!5408 thiss!1870)) (currentByte!10136 thiss!1870) (currentBit!10131 thiss!1870)) lt!356264)))

(declare-fun b!224428 () Bool)

(declare-fun res!188361 () Bool)

(assert (=> b!224428 (=> (not res!188361) (not e!152964))))

(assert (=> b!224428 (= res!188361 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!356264))))

(declare-fun b!224429 () Bool)

(declare-fun lt!356260 () (_ BitVec 64))

(assert (=> b!224429 (= e!152964 (bvsle lt!356264 (bvmul lt!356260 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!224429 (or (= lt!356260 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!356260 #b0000000000000000000000000000000000000000000000000000000000001000) lt!356260)))))

(assert (=> b!224429 (= lt!356260 ((_ sign_extend 32) (size!4864 (buf!5408 thiss!1870))))))

(assert (= (and d!76069 res!188362) b!224428))

(assert (= (and b!224428 res!188361) b!224429))

(declare-fun m!344623 () Bool)

(assert (=> d!76069 m!344623))

(assert (=> d!76069 m!344497))

(assert (=> b!224377 d!76069))

(declare-fun d!76071 () Bool)

(declare-fun e!152967 () Bool)

(assert (=> d!76071 e!152967))

(declare-fun res!188365 () Bool)

(assert (=> d!76071 (=> (not res!188365) (not e!152967))))

(assert (=> d!76071 (= res!188365 (and (or (let ((rhs!3732 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3732 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3732) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!76072 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!76072 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!76072 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3731 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3731 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3731) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!356273 () Unit!16397)

(declare-fun choose!57 (BitStream!8830 BitStream!8830 (_ BitVec 64) (_ BitVec 32)) Unit!16397)

(assert (=> d!76071 (= lt!356273 (choose!57 thiss!1870 (_2!10377 lt!356130) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> d!76071 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10377 lt!356130) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)) lt!356273)))

(declare-fun lt!356274 () (_ BitVec 32))

(declare-fun b!224432 () Bool)

(assert (=> b!224432 (= e!152967 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4864 (buf!5408 (_2!10377 lt!356130)))) ((_ sign_extend 32) (currentByte!10136 (_2!10377 lt!356130))) ((_ sign_extend 32) (currentBit!10131 (_2!10377 lt!356130))) (bvsub (bvsub to!496 i!761) lt!356274)))))

(assert (=> b!224432 (or (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand lt!356274 #b10000000000000000000000000000000)) (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!496 i!761) lt!356274) #b10000000000000000000000000000000)))))

(declare-fun lt!356272 () (_ BitVec 64))

(assert (=> b!224432 (= lt!356274 ((_ extract 31 0) lt!356272))))

(assert (=> b!224432 (and (bvslt lt!356272 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!356272 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!224432 (= lt!356272 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!76071 res!188365) b!224432))

(declare-fun m!344625 () Bool)

(assert (=> d!76071 m!344625))

(declare-fun m!344627 () Bool)

(assert (=> b!224432 m!344627))

(assert (=> b!224377 d!76071))

(declare-fun d!76074 () Bool)

(declare-fun e!152970 () Bool)

(assert (=> d!76074 e!152970))

(declare-fun res!188368 () Bool)

(assert (=> d!76074 (=> (not res!188368) (not e!152970))))

(assert (=> d!76074 (= res!188368 (and (bvsge i!761 #b00000000000000000000000000000000) (bvslt i!761 (size!4864 arr!308))))))

(declare-fun lt!356277 () Unit!16397)

(declare-fun choose!287 (array!11082 (_ BitVec 32) (_ BitVec 8)) Unit!16397)

(assert (=> d!76074 (= lt!356277 (choose!287 arr!308 i!761 (_1!10377 lt!356130)))))

(assert (=> d!76074 (and (bvsle #b00000000000000000000000000000000 i!761) (bvslt i!761 (size!4864 arr!308)))))

(assert (=> d!76074 (= (arrayUpdatedAtPrefixLemma!352 arr!308 i!761 (_1!10377 lt!356130)) lt!356277)))

(declare-fun b!224435 () Bool)

(assert (=> b!224435 (= e!152970 (arrayRangesEq!760 arr!308 (array!11083 (store (arr!5812 arr!308) i!761 (_1!10377 lt!356130)) (size!4864 arr!308)) #b00000000000000000000000000000000 i!761))))

(assert (= (and d!76074 res!188368) b!224435))

(declare-fun m!344629 () Bool)

(assert (=> d!76074 m!344629))

(assert (=> b!224435 m!344485))

(declare-fun m!344631 () Bool)

(assert (=> b!224435 m!344631))

(assert (=> b!224377 d!76074))

(declare-fun bm!3607 () Bool)

(declare-fun c!11131 () Bool)

(declare-fun lt!356679 () array!11082)

(declare-fun call!3610 () Bool)

(declare-fun lt!356693 () tuple2!19216)

(declare-fun lt!356681 () (_ BitVec 32))

(declare-fun lt!356672 () array!11082)

(declare-fun lt!356674 () (_ BitVec 32))

(assert (=> bm!3607 (= call!3610 (arrayRangesEq!760 (ite c!11131 lt!356137 lt!356672) (ite c!11131 (array!11083 (store (arr!5812 lt!356137) (bvadd #b00000000000000000000000000000001 i!761) (_1!10377 lt!356693)) (size!4864 lt!356137)) lt!356679) (ite c!11131 #b00000000000000000000000000000000 lt!356681) (ite c!11131 (bvadd #b00000000000000000000000000000001 i!761) lt!356674)))))

(declare-fun b!224518 () Bool)

(declare-fun lt!356690 () tuple3!1254)

(declare-fun e!153032 () Bool)

(declare-datatypes ((tuple2!19228 0))(
  ( (tuple2!19229 (_1!10386 BitStream!8830) (_2!10386 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!8830) tuple2!19228)

(assert (=> b!224518 (= e!153032 (= (select (arr!5812 (_3!769 lt!356690)) (bvadd #b00000000000000000000000000000001 i!761)) (_2!10386 (readBytePure!0 (_2!10377 lt!356130)))))))

(assert (=> b!224518 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4864 (_3!769 lt!356690))))))

(declare-fun b!224519 () Bool)

(declare-fun res!188438 () Bool)

(declare-fun e!153034 () Bool)

(assert (=> b!224519 (=> (not res!188438) (not e!153034))))

(assert (=> b!224519 (= res!188438 (and (= (buf!5408 (_2!10377 lt!356130)) (buf!5408 (_2!10378 lt!356690))) (= (size!4864 lt!356137) (size!4864 (_3!769 lt!356690)))))))

(declare-fun bm!3608 () Bool)

(declare-fun call!3612 () (_ BitVec 64))

(assert (=> bm!3608 (= call!3612 (bitIndex!0 (size!4864 (buf!5408 (_2!10377 lt!356130))) (currentByte!10136 (_2!10377 lt!356130)) (currentBit!10131 (_2!10377 lt!356130))))))

(declare-fun b!224521 () Bool)

(assert (=> b!224521 (= e!153034 (arrayRangesEq!760 lt!356137 (_3!769 lt!356690) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun call!3611 () Bool)

(declare-fun lt!356675 () tuple3!1254)

(declare-fun bm!3609 () Bool)

(assert (=> bm!3609 (= call!3611 (arrayRangesEq!760 lt!356137 (ite c!11131 (_3!769 lt!356675) lt!356137) #b00000000000000000000000000000000 (ite c!11131 (bvadd #b00000000000000000000000000000001 i!761) (size!4864 lt!356137))))))

(declare-fun b!224522 () Bool)

(declare-fun e!153033 () tuple3!1254)

(declare-fun lt!356662 () Unit!16397)

(assert (=> b!224522 (= e!153033 (tuple3!1255 lt!356662 (_2!10378 lt!356675) (_3!769 lt!356675)))))

(assert (=> b!224522 (= lt!356693 (readByte!0 (_2!10377 lt!356130)))))

(declare-fun lt!356689 () array!11082)

(assert (=> b!224522 (= lt!356689 (array!11083 (store (arr!5812 lt!356137) (bvadd #b00000000000000000000000000000001 i!761) (_1!10377 lt!356693)) (size!4864 lt!356137)))))

(declare-fun lt!356676 () (_ BitVec 64))

(assert (=> b!224522 (= lt!356676 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!356692 () (_ BitVec 32))

(assert (=> b!224522 (= lt!356692 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!356680 () Unit!16397)

(assert (=> b!224522 (= lt!356680 (validateOffsetBytesFromBitIndexLemma!0 (_2!10377 lt!356130) (_2!10377 lt!356693) lt!356676 lt!356692))))

(assert (=> b!224522 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4864 (buf!5408 (_2!10377 lt!356693)))) ((_ sign_extend 32) (currentByte!10136 (_2!10377 lt!356693))) ((_ sign_extend 32) (currentBit!10131 (_2!10377 lt!356693))) (bvsub lt!356692 ((_ extract 31 0) (bvsdiv (bvadd lt!356676 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!356683 () Unit!16397)

(assert (=> b!224522 (= lt!356683 lt!356680)))

(assert (=> b!224522 (= lt!356675 (readByteArrayLoop!0 (_2!10377 lt!356693) lt!356689 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(assert (=> b!224522 (= (bitIndex!0 (size!4864 (buf!5408 (_2!10377 lt!356693))) (currentByte!10136 (_2!10377 lt!356693)) (currentBit!10131 (_2!10377 lt!356693))) (bvadd call!3612 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!356665 () Unit!16397)

(declare-fun Unit!16425 () Unit!16397)

(assert (=> b!224522 (= lt!356665 Unit!16425)))

(assert (=> b!224522 (= (bvadd (bitIndex!0 (size!4864 (buf!5408 (_2!10377 lt!356693))) (currentByte!10136 (_2!10377 lt!356693)) (currentBit!10131 (_2!10377 lt!356693))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4864 (buf!5408 (_2!10378 lt!356675))) (currentByte!10136 (_2!10378 lt!356675)) (currentBit!10131 (_2!10378 lt!356675))))))

(declare-fun lt!356671 () Unit!16397)

(declare-fun Unit!16426 () Unit!16397)

(assert (=> b!224522 (= lt!356671 Unit!16426)))

(assert (=> b!224522 (= (bvadd call!3612 (bvmul ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4864 (buf!5408 (_2!10378 lt!356675))) (currentByte!10136 (_2!10378 lt!356675)) (currentBit!10131 (_2!10378 lt!356675))))))

(declare-fun lt!356668 () Unit!16397)

(declare-fun Unit!16427 () Unit!16397)

(assert (=> b!224522 (= lt!356668 Unit!16427)))

(assert (=> b!224522 (and (= (buf!5408 (_2!10377 lt!356130)) (buf!5408 (_2!10378 lt!356675))) (= (size!4864 lt!356137) (size!4864 (_3!769 lt!356675))))))

(declare-fun lt!356677 () Unit!16397)

(declare-fun Unit!16428 () Unit!16397)

(assert (=> b!224522 (= lt!356677 Unit!16428)))

(declare-fun lt!356664 () Unit!16397)

(assert (=> b!224522 (= lt!356664 (arrayUpdatedAtPrefixLemma!352 lt!356137 (bvadd #b00000000000000000000000000000001 i!761) (_1!10377 lt!356693)))))

(assert (=> b!224522 call!3610))

(declare-fun lt!356694 () Unit!16397)

(assert (=> b!224522 (= lt!356694 lt!356664)))

(declare-fun lt!356670 () (_ BitVec 32))

(assert (=> b!224522 (= lt!356670 #b00000000000000000000000000000000)))

(declare-fun lt!356663 () Unit!16397)

(assert (=> b!224522 (= lt!356663 (arrayRangesEqTransitive!231 lt!356137 lt!356689 (_3!769 lt!356675) lt!356670 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!224522 (arrayRangesEq!760 lt!356137 (_3!769 lt!356675) lt!356670 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun lt!356688 () Unit!16397)

(assert (=> b!224522 (= lt!356688 lt!356663)))

(assert (=> b!224522 call!3611))

(declare-fun lt!356661 () Unit!16397)

(declare-fun Unit!16429 () Unit!16397)

(assert (=> b!224522 (= lt!356661 Unit!16429)))

(declare-fun lt!356673 () Unit!16397)

(assert (=> b!224522 (= lt!356673 (arrayRangesEqImpliesEq!82 lt!356689 (_3!769 lt!356675) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!224522 (= (select (store (arr!5812 lt!356137) (bvadd #b00000000000000000000000000000001 i!761) (_1!10377 lt!356693)) (bvadd #b00000000000000000000000000000001 i!761)) (select (arr!5812 (_3!769 lt!356675)) (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!356660 () Unit!16397)

(assert (=> b!224522 (= lt!356660 lt!356673)))

(declare-fun lt!356666 () Bool)

(assert (=> b!224522 (= lt!356666 (= (select (arr!5812 (_3!769 lt!356675)) (bvadd #b00000000000000000000000000000001 i!761)) (_1!10377 lt!356693)))))

(declare-fun Unit!16430 () Unit!16397)

(assert (=> b!224522 (= lt!356662 Unit!16430)))

(assert (=> b!224522 lt!356666))

(declare-fun b!224520 () Bool)

(declare-fun lt!356685 () Unit!16397)

(assert (=> b!224520 (= e!153033 (tuple3!1255 lt!356685 (_2!10377 lt!356130) lt!356137))))

(assert (=> b!224520 (= call!3612 call!3612)))

(declare-fun lt!356678 () Unit!16397)

(declare-fun Unit!16431 () Unit!16397)

(assert (=> b!224520 (= lt!356678 Unit!16431)))

(declare-fun lt!356687 () Unit!16397)

(declare-fun arrayRangesEqReflexiveLemma!76 (array!11082) Unit!16397)

(assert (=> b!224520 (= lt!356687 (arrayRangesEqReflexiveLemma!76 lt!356137))))

(assert (=> b!224520 call!3611))

(declare-fun lt!356669 () Unit!16397)

(assert (=> b!224520 (= lt!356669 lt!356687)))

(assert (=> b!224520 (= lt!356672 lt!356137)))

(assert (=> b!224520 (= lt!356679 lt!356137)))

(declare-fun lt!356682 () (_ BitVec 32))

(assert (=> b!224520 (= lt!356682 #b00000000000000000000000000000000)))

(declare-fun lt!356686 () (_ BitVec 32))

(assert (=> b!224520 (= lt!356686 (size!4864 lt!356137))))

(assert (=> b!224520 (= lt!356681 #b00000000000000000000000000000000)))

(assert (=> b!224520 (= lt!356674 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun arrayRangesEqSlicedLemma!76 (array!11082 array!11082 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16397)

(assert (=> b!224520 (= lt!356685 (arrayRangesEqSlicedLemma!76 lt!356672 lt!356679 lt!356682 lt!356686 lt!356681 lt!356674))))

(assert (=> b!224520 call!3610))

(declare-fun d!76076 () Bool)

(assert (=> d!76076 e!153032))

(declare-fun res!188437 () Bool)

(assert (=> d!76076 (=> res!188437 e!153032)))

(assert (=> d!76076 (= res!188437 (bvsge (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!356691 () Bool)

(assert (=> d!76076 (= lt!356691 e!153034)))

(declare-fun res!188439 () Bool)

(assert (=> d!76076 (=> (not res!188439) (not e!153034))))

(declare-fun lt!356684 () (_ BitVec 64))

(declare-fun lt!356667 () (_ BitVec 64))

(assert (=> d!76076 (= res!188439 (= (bvadd lt!356667 lt!356684) (bitIndex!0 (size!4864 (buf!5408 (_2!10378 lt!356690))) (currentByte!10136 (_2!10378 lt!356690)) (currentBit!10131 (_2!10378 lt!356690)))))))

(assert (=> d!76076 (or (not (= (bvand lt!356667 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!356684 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!356667 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!356667 lt!356684) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!356659 () (_ BitVec 64))

(assert (=> d!76076 (= lt!356684 (bvmul lt!356659 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!76076 (or (= lt!356659 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!356659 #b0000000000000000000000000000000000000000000000000000000000001000) lt!356659)))))

(assert (=> d!76076 (= lt!356659 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))))))

(assert (=> d!76076 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b10000000000000000000000000000000)))))

(assert (=> d!76076 (= lt!356667 (bitIndex!0 (size!4864 (buf!5408 (_2!10377 lt!356130))) (currentByte!10136 (_2!10377 lt!356130)) (currentBit!10131 (_2!10377 lt!356130))))))

(assert (=> d!76076 (= lt!356690 e!153033)))

(assert (=> d!76076 (= c!11131 (bvslt (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> d!76076 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) to!496) (bvsle to!496 (size!4864 lt!356137)))))

(assert (=> d!76076 (= (readByteArrayLoop!0 (_2!10377 lt!356130) lt!356137 (bvadd #b00000000000000000000000000000001 i!761) to!496) lt!356690)))

(assert (= (and d!76076 c!11131) b!224522))

(assert (= (and d!76076 (not c!11131)) b!224520))

(assert (= (or b!224522 b!224520) bm!3607))

(assert (= (or b!224522 b!224520) bm!3609))

(assert (= (or b!224522 b!224520) bm!3608))

(assert (= (and d!76076 res!188439) b!224519))

(assert (= (and b!224519 res!188438) b!224521))

(assert (= (and d!76076 (not res!188437)) b!224518))

(declare-fun m!344773 () Bool)

(assert (=> b!224521 m!344773))

(declare-fun m!344775 () Bool)

(assert (=> d!76076 m!344775))

(assert (=> d!76076 m!344479))

(assert (=> bm!3608 m!344479))

(declare-fun m!344777 () Bool)

(assert (=> b!224520 m!344777))

(declare-fun m!344779 () Bool)

(assert (=> b!224520 m!344779))

(declare-fun m!344781 () Bool)

(assert (=> b!224522 m!344781))

(declare-fun m!344783 () Bool)

(assert (=> b!224522 m!344783))

(declare-fun m!344785 () Bool)

(assert (=> b!224522 m!344785))

(declare-fun m!344787 () Bool)

(assert (=> b!224522 m!344787))

(declare-fun m!344789 () Bool)

(assert (=> b!224522 m!344789))

(declare-fun m!344791 () Bool)

(assert (=> b!224522 m!344791))

(declare-fun m!344793 () Bool)

(assert (=> b!224522 m!344793))

(declare-fun m!344795 () Bool)

(assert (=> b!224522 m!344795))

(declare-fun m!344797 () Bool)

(assert (=> b!224522 m!344797))

(declare-fun m!344799 () Bool)

(assert (=> b!224522 m!344799))

(declare-fun m!344801 () Bool)

(assert (=> b!224522 m!344801))

(declare-fun m!344803 () Bool)

(assert (=> b!224522 m!344803))

(declare-fun m!344805 () Bool)

(assert (=> b!224522 m!344805))

(assert (=> bm!3607 m!344805))

(declare-fun m!344807 () Bool)

(assert (=> bm!3607 m!344807))

(declare-fun m!344809 () Bool)

(assert (=> bm!3609 m!344809))

(declare-fun m!344811 () Bool)

(assert (=> b!224518 m!344811))

(declare-fun m!344813 () Bool)

(assert (=> b!224518 m!344813))

(assert (=> b!224377 d!76076))

(declare-fun d!76115 () Bool)

(assert (=> d!76115 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4864 (buf!5408 thiss!1870))) ((_ sign_extend 32) (currentByte!10136 thiss!1870)) ((_ sign_extend 32) (currentBit!10131 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4864 (buf!5408 thiss!1870))) ((_ sign_extend 32) (currentByte!10136 thiss!1870)) ((_ sign_extend 32) (currentBit!10131 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18569 () Bool)

(assert (= bs!18569 d!76115))

(assert (=> bs!18569 m!344623))

(assert (=> b!224375 d!76115))

(push 1)

(assert (not b!224521))

(assert (not b!224423))

(assert (not d!76065))

(assert (not b!224522))

(assert (not d!76071))

(assert (not d!76061))

(assert (not b!224520))

(assert (not b!224435))

(assert (not d!76057))

(assert (not d!76047))

(assert (not bm!3609))

(assert (not d!76115))

(assert (not d!76069))

(assert (not b!224425))

(assert (not b!224432))

(assert (not d!76076))

(assert (not d!76074))

(assert (not bm!3607))

(assert (not d!76043))

(assert (not b!224518))

(assert (not d!76045))

(assert (not b!224417))

(assert (not bm!3608))

(assert (not d!76067))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

