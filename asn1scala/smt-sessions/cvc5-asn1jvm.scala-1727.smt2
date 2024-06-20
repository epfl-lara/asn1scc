; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47666 () Bool)

(assert start!47666)

(declare-fun b!226956 () Bool)

(declare-fun e!155221 () Bool)

(declare-datatypes ((array!11372 0))(
  ( (array!11373 (arr!5959 (Array (_ BitVec 32) (_ BitVec 8))) (size!4987 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9070 0))(
  ( (BitStream!9071 (buf!5528 array!11372) (currentByte!10360 (_ BitVec 32)) (currentBit!10355 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9070)

(declare-fun array_inv!4728 (array!11372) Bool)

(assert (=> b!226956 (= e!155221 (array_inv!4728 (buf!5528 thiss!1870)))))

(declare-fun res!190422 () Bool)

(declare-fun e!155219 () Bool)

(assert (=> start!47666 (=> (not res!190422) (not e!155219))))

(declare-fun arr!308 () array!11372)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!47666 (= res!190422 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4987 arr!308))))))

(assert (=> start!47666 e!155219))

(assert (=> start!47666 true))

(assert (=> start!47666 (array_inv!4728 arr!308)))

(declare-fun inv!12 (BitStream!9070) Bool)

(assert (=> start!47666 (and (inv!12 thiss!1870) e!155221)))

(declare-fun b!226953 () Bool)

(declare-fun res!190423 () Bool)

(assert (=> b!226953 (=> (not res!190423) (not e!155219))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!226953 (= res!190423 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4987 (buf!5528 thiss!1870))) ((_ sign_extend 32) (currentByte!10360 thiss!1870)) ((_ sign_extend 32) (currentBit!10355 thiss!1870)) (bvsub to!496 i!761)))))

(declare-datatypes ((Unit!16884 0))(
  ( (Unit!16885) )
))
(declare-datatypes ((tuple3!1356 0))(
  ( (tuple3!1357 (_1!10562 Unit!16884) (_2!10562 BitStream!9070) (_3!820 array!11372)) )
))
(declare-fun lt!362166 () tuple3!1356)

(declare-fun b!226955 () Bool)

(assert (=> b!226955 (= e!155219 (not (and (= (buf!5528 thiss!1870) (buf!5528 (_2!10562 lt!362166))) (= (size!4987 arr!308) (size!4987 (_3!820 lt!362166))))))))

(declare-fun lt!362169 () (_ BitVec 32))

(declare-fun lt!362165 () (_ BitVec 64))

(declare-fun lt!362168 () (_ BitVec 64))

(declare-fun lt!362167 () (_ BitVec 64))

(assert (=> b!226955 (and (= (bvadd lt!362167 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!362169))) lt!362165) (= (bvadd lt!362168 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!362165))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!226955 (= lt!362165 (bitIndex!0 (size!4987 (buf!5528 (_2!10562 lt!362166))) (currentByte!10360 (_2!10562 lt!362166)) (currentBit!10355 (_2!10562 lt!362166))))))

(assert (=> b!226955 (= lt!362167 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!362168))))

(declare-datatypes ((tuple2!19484 0))(
  ( (tuple2!19485 (_1!10563 (_ BitVec 8)) (_2!10563 BitStream!9070)) )
))
(declare-fun lt!362164 () tuple2!19484)

(assert (=> b!226955 (= lt!362167 (bitIndex!0 (size!4987 (buf!5528 (_2!10563 lt!362164))) (currentByte!10360 (_2!10563 lt!362164)) (currentBit!10355 (_2!10563 lt!362164))))))

(assert (=> b!226955 (= lt!362168 (bitIndex!0 (size!4987 (buf!5528 thiss!1870)) (currentByte!10360 thiss!1870) (currentBit!10355 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9070 array!11372 (_ BitVec 32) (_ BitVec 32)) tuple3!1356)

(assert (=> b!226955 (= lt!362166 (readByteArrayLoop!0 (_2!10563 lt!362164) (array!11373 (store (arr!5959 arr!308) i!761 (_1!10563 lt!362164)) (size!4987 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!226955 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4987 (buf!5528 (_2!10563 lt!362164)))) ((_ sign_extend 32) (currentByte!10360 (_2!10563 lt!362164))) ((_ sign_extend 32) (currentBit!10355 (_2!10563 lt!362164))) lt!362169)))

(assert (=> b!226955 (= lt!362169 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!362163 () Unit!16884)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9070 BitStream!9070 (_ BitVec 64) (_ BitVec 32)) Unit!16884)

(assert (=> b!226955 (= lt!362163 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10563 lt!362164) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!9070) tuple2!19484)

(assert (=> b!226955 (= lt!362164 (readByte!0 thiss!1870))))

(declare-fun b!226954 () Bool)

(declare-fun res!190421 () Bool)

(assert (=> b!226954 (=> (not res!190421) (not e!155219))))

(assert (=> b!226954 (= res!190421 (bvslt i!761 to!496))))

(assert (= (and start!47666 res!190422) b!226953))

(assert (= (and b!226953 res!190423) b!226954))

(assert (= (and b!226954 res!190421) b!226955))

(assert (= start!47666 b!226956))

(declare-fun m!348793 () Bool)

(assert (=> b!226956 m!348793))

(declare-fun m!348795 () Bool)

(assert (=> start!47666 m!348795))

(declare-fun m!348797 () Bool)

(assert (=> start!47666 m!348797))

(declare-fun m!348799 () Bool)

(assert (=> b!226953 m!348799))

(declare-fun m!348801 () Bool)

(assert (=> b!226955 m!348801))

(declare-fun m!348803 () Bool)

(assert (=> b!226955 m!348803))

(declare-fun m!348805 () Bool)

(assert (=> b!226955 m!348805))

(declare-fun m!348807 () Bool)

(assert (=> b!226955 m!348807))

(declare-fun m!348809 () Bool)

(assert (=> b!226955 m!348809))

(declare-fun m!348811 () Bool)

(assert (=> b!226955 m!348811))

(declare-fun m!348813 () Bool)

(assert (=> b!226955 m!348813))

(declare-fun m!348815 () Bool)

(assert (=> b!226955 m!348815))

(push 1)

(assert (not b!226953))

(assert (not b!226955))

(assert (not start!47666))

(assert (not b!226956))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!77050 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!77050 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4987 (buf!5528 thiss!1870))) ((_ sign_extend 32) (currentByte!10360 thiss!1870)) ((_ sign_extend 32) (currentBit!10355 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4987 (buf!5528 thiss!1870))) ((_ sign_extend 32) (currentByte!10360 thiss!1870)) ((_ sign_extend 32) (currentBit!10355 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18832 () Bool)

(assert (= bs!18832 d!77050))

(declare-fun m!348871 () Bool)

(assert (=> bs!18832 m!348871))

(assert (=> b!226953 d!77050))

(declare-fun b!227042 () Bool)

(declare-fun e!155288 () tuple3!1356)

(declare-fun lt!362515 () Unit!16884)

(declare-fun lt!362534 () tuple3!1356)

(assert (=> b!227042 (= e!155288 (tuple3!1357 lt!362515 (_2!10562 lt!362534) (_3!820 lt!362534)))))

(declare-fun lt!362533 () tuple2!19484)

(assert (=> b!227042 (= lt!362533 (readByte!0 (_2!10563 lt!362164)))))

(declare-fun lt!362525 () array!11372)

(assert (=> b!227042 (= lt!362525 (array!11373 (store (arr!5959 (array!11373 (store (arr!5959 arr!308) i!761 (_1!10563 lt!362164)) (size!4987 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10563 lt!362533)) (size!4987 (array!11373 (store (arr!5959 arr!308) i!761 (_1!10563 lt!362164)) (size!4987 arr!308)))))))

(declare-fun lt!362506 () (_ BitVec 64))

(assert (=> b!227042 (= lt!362506 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!362531 () (_ BitVec 32))

(assert (=> b!227042 (= lt!362531 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!362516 () Unit!16884)

(assert (=> b!227042 (= lt!362516 (validateOffsetBytesFromBitIndexLemma!0 (_2!10563 lt!362164) (_2!10563 lt!362533) lt!362506 lt!362531))))

(assert (=> b!227042 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4987 (buf!5528 (_2!10563 lt!362533)))) ((_ sign_extend 32) (currentByte!10360 (_2!10563 lt!362533))) ((_ sign_extend 32) (currentBit!10355 (_2!10563 lt!362533))) (bvsub lt!362531 ((_ extract 31 0) (bvsdiv (bvadd lt!362506 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!362521 () Unit!16884)

(assert (=> b!227042 (= lt!362521 lt!362516)))

(assert (=> b!227042 (= lt!362534 (readByteArrayLoop!0 (_2!10563 lt!362533) lt!362525 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(declare-fun call!3819 () (_ BitVec 64))

(assert (=> b!227042 (= call!3819 (bvadd (bitIndex!0 (size!4987 (buf!5528 (_2!10563 lt!362164))) (currentByte!10360 (_2!10563 lt!362164)) (currentBit!10355 (_2!10563 lt!362164))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!362510 () Unit!16884)

(declare-fun Unit!16901 () Unit!16884)

(assert (=> b!227042 (= lt!362510 Unit!16901)))

(assert (=> b!227042 (= (bvadd call!3819 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4987 (buf!5528 (_2!10562 lt!362534))) (currentByte!10360 (_2!10562 lt!362534)) (currentBit!10355 (_2!10562 lt!362534))))))

(declare-fun lt!362520 () Unit!16884)

(declare-fun Unit!16902 () Unit!16884)

(assert (=> b!227042 (= lt!362520 Unit!16902)))

(assert (=> b!227042 (= (bvadd (bitIndex!0 (size!4987 (buf!5528 (_2!10563 lt!362164))) (currentByte!10360 (_2!10563 lt!362164)) (currentBit!10355 (_2!10563 lt!362164))) (bvmul ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4987 (buf!5528 (_2!10562 lt!362534))) (currentByte!10360 (_2!10562 lt!362534)) (currentBit!10355 (_2!10562 lt!362534))))))

(declare-fun lt!362512 () Unit!16884)

(declare-fun Unit!16903 () Unit!16884)

(assert (=> b!227042 (= lt!362512 Unit!16903)))

(assert (=> b!227042 (and (= (buf!5528 (_2!10563 lt!362164)) (buf!5528 (_2!10562 lt!362534))) (= (size!4987 (array!11373 (store (arr!5959 arr!308) i!761 (_1!10563 lt!362164)) (size!4987 arr!308))) (size!4987 (_3!820 lt!362534))))))

(declare-fun lt!362517 () Unit!16884)

(declare-fun Unit!16904 () Unit!16884)

(assert (=> b!227042 (= lt!362517 Unit!16904)))

(declare-fun lt!362539 () Unit!16884)

(declare-fun arrayUpdatedAtPrefixLemma!386 (array!11372 (_ BitVec 32) (_ BitVec 8)) Unit!16884)

(assert (=> b!227042 (= lt!362539 (arrayUpdatedAtPrefixLemma!386 (array!11373 (store (arr!5959 arr!308) i!761 (_1!10563 lt!362164)) (size!4987 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) (_1!10563 lt!362533)))))

(declare-fun arrayRangesEq!827 (array!11372 array!11372 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227042 (arrayRangesEq!827 (array!11373 (store (arr!5959 arr!308) i!761 (_1!10563 lt!362164)) (size!4987 arr!308)) (array!11373 (store (arr!5959 (array!11373 (store (arr!5959 arr!308) i!761 (_1!10563 lt!362164)) (size!4987 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10563 lt!362533)) (size!4987 (array!11373 (store (arr!5959 arr!308) i!761 (_1!10563 lt!362164)) (size!4987 arr!308)))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun lt!362535 () Unit!16884)

(assert (=> b!227042 (= lt!362535 lt!362539)))

(declare-fun lt!362514 () (_ BitVec 32))

(assert (=> b!227042 (= lt!362514 #b00000000000000000000000000000000)))

(declare-fun lt!362513 () Unit!16884)

(declare-fun arrayRangesEqTransitive!265 (array!11372 array!11372 array!11372 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16884)

(assert (=> b!227042 (= lt!362513 (arrayRangesEqTransitive!265 (array!11373 (store (arr!5959 arr!308) i!761 (_1!10563 lt!362164)) (size!4987 arr!308)) lt!362525 (_3!820 lt!362534) lt!362514 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(declare-fun call!3817 () Bool)

(assert (=> b!227042 call!3817))

(declare-fun lt!362530 () Unit!16884)

(assert (=> b!227042 (= lt!362530 lt!362513)))

(declare-fun call!3818 () Bool)

(assert (=> b!227042 call!3818))

(declare-fun lt!362524 () Unit!16884)

(declare-fun Unit!16905 () Unit!16884)

(assert (=> b!227042 (= lt!362524 Unit!16905)))

(declare-fun lt!362541 () Unit!16884)

(declare-fun arrayRangesEqImpliesEq!116 (array!11372 array!11372 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16884)

(assert (=> b!227042 (= lt!362541 (arrayRangesEqImpliesEq!116 lt!362525 (_3!820 lt!362534) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!227042 (= (select (store (arr!5959 (array!11373 (store (arr!5959 arr!308) i!761 (_1!10563 lt!362164)) (size!4987 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10563 lt!362533)) (bvadd #b00000000000000000000000000000001 i!761)) (select (arr!5959 (_3!820 lt!362534)) (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!362518 () Unit!16884)

(assert (=> b!227042 (= lt!362518 lt!362541)))

(declare-fun lt!362538 () Bool)

(assert (=> b!227042 (= lt!362538 (= (select (arr!5959 (_3!820 lt!362534)) (bvadd #b00000000000000000000000000000001 i!761)) (_1!10563 lt!362533)))))

(declare-fun Unit!16906 () Unit!16884)

(assert (=> b!227042 (= lt!362515 Unit!16906)))

(assert (=> b!227042 lt!362538))

(declare-fun e!155289 () Bool)

(declare-fun lt!362507 () tuple3!1356)

(declare-fun b!227043 () Bool)

(declare-datatypes ((tuple2!19494 0))(
  ( (tuple2!19495 (_1!10570 BitStream!9070) (_2!10570 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!9070) tuple2!19494)

(assert (=> b!227043 (= e!155289 (= (select (arr!5959 (_3!820 lt!362507)) (bvadd #b00000000000000000000000000000001 i!761)) (_2!10570 (readBytePure!0 (_2!10563 lt!362164)))))))

(assert (=> b!227043 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4987 (_3!820 lt!362507))))))

(declare-fun d!77052 () Bool)

(assert (=> d!77052 e!155289))

(declare-fun res!190497 () Bool)

(assert (=> d!77052 (=> res!190497 e!155289)))

(assert (=> d!77052 (= res!190497 (bvsge (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!362509 () Bool)

(declare-fun e!155290 () Bool)

(assert (=> d!77052 (= lt!362509 e!155290)))

(declare-fun res!190496 () Bool)

(assert (=> d!77052 (=> (not res!190496) (not e!155290))))

(declare-fun lt!362522 () (_ BitVec 64))

(declare-fun lt!362527 () (_ BitVec 64))

(assert (=> d!77052 (= res!190496 (= (bvadd lt!362527 lt!362522) (bitIndex!0 (size!4987 (buf!5528 (_2!10562 lt!362507))) (currentByte!10360 (_2!10562 lt!362507)) (currentBit!10355 (_2!10562 lt!362507)))))))

(assert (=> d!77052 (or (not (= (bvand lt!362527 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!362522 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!362527 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!362527 lt!362522) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!362536 () (_ BitVec 64))

(assert (=> d!77052 (= lt!362522 (bvmul lt!362536 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!77052 (or (= lt!362536 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!362536 #b0000000000000000000000000000000000000000000000000000000000001000) lt!362536)))))

(assert (=> d!77052 (= lt!362536 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))))))

(assert (=> d!77052 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b10000000000000000000000000000000)))))

(assert (=> d!77052 (= lt!362527 (bitIndex!0 (size!4987 (buf!5528 (_2!10563 lt!362164))) (currentByte!10360 (_2!10563 lt!362164)) (currentBit!10355 (_2!10563 lt!362164))))))

(assert (=> d!77052 (= lt!362507 e!155288)))

(declare-fun c!11200 () Bool)

(assert (=> d!77052 (= c!11200 (bvslt (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> d!77052 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) to!496) (bvsle to!496 (size!4987 (array!11373 (store (arr!5959 arr!308) i!761 (_1!10563 lt!362164)) (size!4987 arr!308)))))))

(assert (=> d!77052 (= (readByteArrayLoop!0 (_2!10563 lt!362164) (array!11373 (store (arr!5959 arr!308) i!761 (_1!10563 lt!362164)) (size!4987 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496) lt!362507)))

(declare-fun bm!3814 () Bool)

(assert (=> bm!3814 (= call!3819 (bitIndex!0 (ite c!11200 (size!4987 (buf!5528 (_2!10563 lt!362533))) (size!4987 (buf!5528 (_2!10563 lt!362164)))) (ite c!11200 (currentByte!10360 (_2!10563 lt!362533)) (currentByte!10360 (_2!10563 lt!362164))) (ite c!11200 (currentBit!10355 (_2!10563 lt!362533)) (currentBit!10355 (_2!10563 lt!362164)))))))

(declare-fun lt!362537 () (_ BitVec 32))

(declare-fun bm!3815 () Bool)

(declare-fun lt!362508 () (_ BitVec 32))

(declare-fun lt!362528 () array!11372)

(declare-fun lt!362523 () array!11372)

(assert (=> bm!3815 (= call!3818 (arrayRangesEq!827 (ite c!11200 (array!11373 (store (arr!5959 arr!308) i!761 (_1!10563 lt!362164)) (size!4987 arr!308)) lt!362528) (ite c!11200 (_3!820 lt!362534) lt!362523) (ite c!11200 #b00000000000000000000000000000000 lt!362537) (ite c!11200 (bvadd #b00000000000000000000000000000001 i!761) lt!362508)))))

(declare-fun lt!362529 () Unit!16884)

(declare-fun b!227044 () Bool)

(assert (=> b!227044 (= e!155288 (tuple3!1357 lt!362529 (_2!10563 lt!362164) (array!11373 (store (arr!5959 arr!308) i!761 (_1!10563 lt!362164)) (size!4987 arr!308))))))

(assert (=> b!227044 (= call!3819 call!3819)))

(declare-fun lt!362540 () Unit!16884)

(declare-fun Unit!16907 () Unit!16884)

(assert (=> b!227044 (= lt!362540 Unit!16907)))

(declare-fun lt!362519 () Unit!16884)

(declare-fun arrayRangesEqReflexiveLemma!131 (array!11372) Unit!16884)

(assert (=> b!227044 (= lt!362519 (arrayRangesEqReflexiveLemma!131 (array!11373 (store (arr!5959 arr!308) i!761 (_1!10563 lt!362164)) (size!4987 arr!308))))))

(assert (=> b!227044 call!3817))

(declare-fun lt!362511 () Unit!16884)

(assert (=> b!227044 (= lt!362511 lt!362519)))

(assert (=> b!227044 (= lt!362528 (array!11373 (store (arr!5959 arr!308) i!761 (_1!10563 lt!362164)) (size!4987 arr!308)))))

(assert (=> b!227044 (= lt!362523 (array!11373 (store (arr!5959 arr!308) i!761 (_1!10563 lt!362164)) (size!4987 arr!308)))))

(declare-fun lt!362532 () (_ BitVec 32))

(assert (=> b!227044 (= lt!362532 #b00000000000000000000000000000000)))

(declare-fun lt!362526 () (_ BitVec 32))

(assert (=> b!227044 (= lt!362526 (size!4987 (array!11373 (store (arr!5959 arr!308) i!761 (_1!10563 lt!362164)) (size!4987 arr!308))))))

(assert (=> b!227044 (= lt!362537 #b00000000000000000000000000000000)))

(assert (=> b!227044 (= lt!362508 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun arrayRangesEqSlicedLemma!116 (array!11372 array!11372 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16884)

(assert (=> b!227044 (= lt!362529 (arrayRangesEqSlicedLemma!116 lt!362528 lt!362523 lt!362532 lt!362526 lt!362537 lt!362508))))

(assert (=> b!227044 call!3818))

(declare-fun bm!3816 () Bool)

(assert (=> bm!3816 (= call!3817 (arrayRangesEq!827 (array!11373 (store (arr!5959 arr!308) i!761 (_1!10563 lt!362164)) (size!4987 arr!308)) (ite c!11200 (_3!820 lt!362534) (array!11373 (store (arr!5959 arr!308) i!761 (_1!10563 lt!362164)) (size!4987 arr!308))) (ite c!11200 lt!362514 #b00000000000000000000000000000000) (ite c!11200 (bvadd #b00000000000000000000000000000001 i!761) (size!4987 (array!11373 (store (arr!5959 arr!308) i!761 (_1!10563 lt!362164)) (size!4987 arr!308))))))))

(declare-fun b!227045 () Bool)

(declare-fun res!190495 () Bool)

(assert (=> b!227045 (=> (not res!190495) (not e!155290))))

(assert (=> b!227045 (= res!190495 (and (= (buf!5528 (_2!10563 lt!362164)) (buf!5528 (_2!10562 lt!362507))) (= (size!4987 (array!11373 (store (arr!5959 arr!308) i!761 (_1!10563 lt!362164)) (size!4987 arr!308))) (size!4987 (_3!820 lt!362507)))))))

(declare-fun b!227046 () Bool)

(assert (=> b!227046 (= e!155290 (arrayRangesEq!827 (array!11373 (store (arr!5959 arr!308) i!761 (_1!10563 lt!362164)) (size!4987 arr!308)) (_3!820 lt!362507) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (= (and d!77052 c!11200) b!227042))

(assert (= (and d!77052 (not c!11200)) b!227044))

(assert (= (or b!227042 b!227044) bm!3815))

(assert (= (or b!227042 b!227044) bm!3816))

(assert (= (or b!227042 b!227044) bm!3814))

(assert (= (and d!77052 res!190496) b!227045))

(assert (= (and b!227045 res!190495) b!227046))

(assert (= (and d!77052 (not res!190497)) b!227043))

(declare-fun m!348957 () Bool)

(assert (=> bm!3814 m!348957))

(declare-fun m!348959 () Bool)

(assert (=> d!77052 m!348959))

(assert (=> d!77052 m!348801))

(declare-fun m!348961 () Bool)

(assert (=> b!227042 m!348961))

(declare-fun m!348963 () Bool)

(assert (=> b!227042 m!348963))

(assert (=> b!227042 m!348801))

(declare-fun m!348965 () Bool)

(assert (=> b!227042 m!348965))

(declare-fun m!348967 () Bool)

(assert (=> b!227042 m!348967))

(declare-fun m!348969 () Bool)

(assert (=> b!227042 m!348969))

(declare-fun m!348971 () Bool)

(assert (=> b!227042 m!348971))

(declare-fun m!348973 () Bool)

(assert (=> b!227042 m!348973))

(declare-fun m!348975 () Bool)

(assert (=> b!227042 m!348975))

(declare-fun m!348977 () Bool)

(assert (=> b!227042 m!348977))

(declare-fun m!348979 () Bool)

(assert (=> b!227042 m!348979))

(declare-fun m!348981 () Bool)

(assert (=> b!227042 m!348981))

(declare-fun m!348983 () Bool)

(assert (=> b!227042 m!348983))

(declare-fun m!348985 () Bool)

(assert (=> b!227046 m!348985))

(declare-fun m!348987 () Bool)

(assert (=> bm!3815 m!348987))

(declare-fun m!348989 () Bool)

(assert (=> bm!3816 m!348989))

(declare-fun m!348991 () Bool)

(assert (=> b!227044 m!348991))

(declare-fun m!348993 () Bool)

(assert (=> b!227044 m!348993))

(declare-fun m!348995 () Bool)

(assert (=> b!227043 m!348995))

(declare-fun m!348997 () Bool)

(assert (=> b!227043 m!348997))

(assert (=> b!226955 d!77052))

(declare-fun d!77083 () Bool)

(declare-fun e!155294 () Bool)

(assert (=> d!77083 e!155294))

(declare-fun res!190505 () Bool)

(assert (=> d!77083 (=> (not res!190505) (not e!155294))))

(declare-fun lt!362562 () (_ BitVec 64))

(declare-fun lt!362565 () (_ BitVec 64))

(declare-fun lt!362564 () (_ BitVec 64))

(assert (=> d!77083 (= res!190505 (= lt!362565 (bvsub lt!362564 lt!362562)))))

(assert (=> d!77083 (or (= (bvand lt!362564 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!362562 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!362564 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!362564 lt!362562) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77083 (= lt!362562 (remainingBits!0 ((_ sign_extend 32) (size!4987 (buf!5528 (_2!10562 lt!362166)))) ((_ sign_extend 32) (currentByte!10360 (_2!10562 lt!362166))) ((_ sign_extend 32) (currentBit!10355 (_2!10562 lt!362166)))))))

(declare-fun lt!362561 () (_ BitVec 64))

(declare-fun lt!362563 () (_ BitVec 64))

(assert (=> d!77083 (= lt!362564 (bvmul lt!362561 lt!362563))))

(assert (=> d!77083 (or (= lt!362561 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!362563 (bvsdiv (bvmul lt!362561 lt!362563) lt!362561)))))

(assert (=> d!77083 (= lt!362563 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77083 (= lt!362561 ((_ sign_extend 32) (size!4987 (buf!5528 (_2!10562 lt!362166)))))))

(assert (=> d!77083 (= lt!362565 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10360 (_2!10562 lt!362166))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10355 (_2!10562 lt!362166)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!77083 (invariant!0 (currentBit!10355 (_2!10562 lt!362166)) (currentByte!10360 (_2!10562 lt!362166)) (size!4987 (buf!5528 (_2!10562 lt!362166))))))

(assert (=> d!77083 (= (bitIndex!0 (size!4987 (buf!5528 (_2!10562 lt!362166))) (currentByte!10360 (_2!10562 lt!362166)) (currentBit!10355 (_2!10562 lt!362166))) lt!362565)))

(declare-fun b!227053 () Bool)

(declare-fun res!190504 () Bool)

(assert (=> b!227053 (=> (not res!190504) (not e!155294))))

(assert (=> b!227053 (= res!190504 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!362565))))

(declare-fun b!227054 () Bool)

(declare-fun lt!362560 () (_ BitVec 64))

(assert (=> b!227054 (= e!155294 (bvsle lt!362565 (bvmul lt!362560 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!227054 (or (= lt!362560 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!362560 #b0000000000000000000000000000000000000000000000000000000000001000) lt!362560)))))

(assert (=> b!227054 (= lt!362560 ((_ sign_extend 32) (size!4987 (buf!5528 (_2!10562 lt!362166)))))))

(assert (= (and d!77083 res!190505) b!227053))

(assert (= (and b!227053 res!190504) b!227054))

(declare-fun m!348999 () Bool)

(assert (=> d!77083 m!348999))

(declare-fun m!349001 () Bool)

(assert (=> d!77083 m!349001))

(assert (=> b!226955 d!77083))

(declare-fun d!77085 () Bool)

(declare-fun e!155295 () Bool)

(assert (=> d!77085 e!155295))

(declare-fun res!190507 () Bool)

(assert (=> d!77085 (=> (not res!190507) (not e!155295))))

(declare-fun lt!362570 () (_ BitVec 64))

(declare-fun lt!362571 () (_ BitVec 64))

(declare-fun lt!362568 () (_ BitVec 64))

(assert (=> d!77085 (= res!190507 (= lt!362571 (bvsub lt!362570 lt!362568)))))

(assert (=> d!77085 (or (= (bvand lt!362570 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!362568 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!362570 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!362570 lt!362568) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77085 (= lt!362568 (remainingBits!0 ((_ sign_extend 32) (size!4987 (buf!5528 thiss!1870))) ((_ sign_extend 32) (currentByte!10360 thiss!1870)) ((_ sign_extend 32) (currentBit!10355 thiss!1870))))))

(declare-fun lt!362567 () (_ BitVec 64))

(declare-fun lt!362569 () (_ BitVec 64))

(assert (=> d!77085 (= lt!362570 (bvmul lt!362567 lt!362569))))

(assert (=> d!77085 (or (= lt!362567 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!362569 (bvsdiv (bvmul lt!362567 lt!362569) lt!362567)))))

(assert (=> d!77085 (= lt!362569 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77085 (= lt!362567 ((_ sign_extend 32) (size!4987 (buf!5528 thiss!1870))))))

(assert (=> d!77085 (= lt!362571 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10360 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10355 thiss!1870))))))

(assert (=> d!77085 (invariant!0 (currentBit!10355 thiss!1870) (currentByte!10360 thiss!1870) (size!4987 (buf!5528 thiss!1870)))))

(assert (=> d!77085 (= (bitIndex!0 (size!4987 (buf!5528 thiss!1870)) (currentByte!10360 thiss!1870) (currentBit!10355 thiss!1870)) lt!362571)))

(declare-fun b!227055 () Bool)

(declare-fun res!190506 () Bool)

(assert (=> b!227055 (=> (not res!190506) (not e!155295))))

(assert (=> b!227055 (= res!190506 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!362571))))

(declare-fun b!227056 () Bool)

(declare-fun lt!362566 () (_ BitVec 64))

(assert (=> b!227056 (= e!155295 (bvsle lt!362571 (bvmul lt!362566 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!227056 (or (= lt!362566 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!362566 #b0000000000000000000000000000000000000000000000000000000000001000) lt!362566)))))

(assert (=> b!227056 (= lt!362566 ((_ sign_extend 32) (size!4987 (buf!5528 thiss!1870))))))

(assert (= (and d!77085 res!190507) b!227055))

(assert (= (and b!227055 res!190506) b!227056))

(assert (=> d!77085 m!348871))

(declare-fun m!349003 () Bool)

(assert (=> d!77085 m!349003))

(assert (=> b!226955 d!77085))

(declare-fun d!77087 () Bool)

(declare-fun e!155298 () Bool)

(assert (=> d!77087 e!155298))

(declare-fun res!190510 () Bool)

(assert (=> d!77087 (=> (not res!190510) (not e!155298))))

(assert (=> d!77087 (= res!190510 (and (or (let ((rhs!3946 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3946 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3946) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!77088 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!77088 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!77088 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3945 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3945 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3945) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!362578 () Unit!16884)

(declare-fun choose!57 (BitStream!9070 BitStream!9070 (_ BitVec 64) (_ BitVec 32)) Unit!16884)

(assert (=> d!77087 (= lt!362578 (choose!57 thiss!1870 (_2!10563 lt!362164) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> d!77087 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10563 lt!362164) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)) lt!362578)))

(declare-fun lt!362580 () (_ BitVec 32))

(declare-fun b!227059 () Bool)

(assert (=> b!227059 (= e!155298 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4987 (buf!5528 (_2!10563 lt!362164)))) ((_ sign_extend 32) (currentByte!10360 (_2!10563 lt!362164))) ((_ sign_extend 32) (currentBit!10355 (_2!10563 lt!362164))) (bvsub (bvsub to!496 i!761) lt!362580)))))

(assert (=> b!227059 (or (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand lt!362580 #b10000000000000000000000000000000)) (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!496 i!761) lt!362580) #b10000000000000000000000000000000)))))

(declare-fun lt!362579 () (_ BitVec 64))

(assert (=> b!227059 (= lt!362580 ((_ extract 31 0) lt!362579))))

(assert (=> b!227059 (and (bvslt lt!362579 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!362579 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!227059 (= lt!362579 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!77087 res!190510) b!227059))

(declare-fun m!349005 () Bool)

(assert (=> d!77087 m!349005))

(declare-fun m!349007 () Bool)

(assert (=> b!227059 m!349007))

(assert (=> b!226955 d!77087))

(declare-fun d!77090 () Bool)

(declare-fun e!155299 () Bool)

(assert (=> d!77090 e!155299))

(declare-fun res!190512 () Bool)

(assert (=> d!77090 (=> (not res!190512) (not e!155299))))

(declare-fun lt!362585 () (_ BitVec 64))

(declare-fun lt!362586 () (_ BitVec 64))

(declare-fun lt!362583 () (_ BitVec 64))

(assert (=> d!77090 (= res!190512 (= lt!362586 (bvsub lt!362585 lt!362583)))))

(assert (=> d!77090 (or (= (bvand lt!362585 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!362583 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!362585 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!362585 lt!362583) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77090 (= lt!362583 (remainingBits!0 ((_ sign_extend 32) (size!4987 (buf!5528 (_2!10563 lt!362164)))) ((_ sign_extend 32) (currentByte!10360 (_2!10563 lt!362164))) ((_ sign_extend 32) (currentBit!10355 (_2!10563 lt!362164)))))))

(declare-fun lt!362582 () (_ BitVec 64))

(declare-fun lt!362584 () (_ BitVec 64))

(assert (=> d!77090 (= lt!362585 (bvmul lt!362582 lt!362584))))

(assert (=> d!77090 (or (= lt!362582 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!362584 (bvsdiv (bvmul lt!362582 lt!362584) lt!362582)))))

(assert (=> d!77090 (= lt!362584 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77090 (= lt!362582 ((_ sign_extend 32) (size!4987 (buf!5528 (_2!10563 lt!362164)))))))

(assert (=> d!77090 (= lt!362586 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10360 (_2!10563 lt!362164))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10355 (_2!10563 lt!362164)))))))

(assert (=> d!77090 (invariant!0 (currentBit!10355 (_2!10563 lt!362164)) (currentByte!10360 (_2!10563 lt!362164)) (size!4987 (buf!5528 (_2!10563 lt!362164))))))

(assert (=> d!77090 (= (bitIndex!0 (size!4987 (buf!5528 (_2!10563 lt!362164))) (currentByte!10360 (_2!10563 lt!362164)) (currentBit!10355 (_2!10563 lt!362164))) lt!362586)))

(declare-fun b!227060 () Bool)

(declare-fun res!190511 () Bool)

(assert (=> b!227060 (=> (not res!190511) (not e!155299))))

(assert (=> b!227060 (= res!190511 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!362586))))

(declare-fun b!227061 () Bool)

(declare-fun lt!362581 () (_ BitVec 64))

(assert (=> b!227061 (= e!155299 (bvsle lt!362586 (bvmul lt!362581 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!227061 (or (= lt!362581 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!362581 #b0000000000000000000000000000000000000000000000000000000000001000) lt!362581)))))

(assert (=> b!227061 (= lt!362581 ((_ sign_extend 32) (size!4987 (buf!5528 (_2!10563 lt!362164)))))))

(assert (= (and d!77090 res!190512) b!227060))

(assert (= (and b!227060 res!190511) b!227061))

(declare-fun m!349009 () Bool)

(assert (=> d!77090 m!349009))

(declare-fun m!349011 () Bool)

(assert (=> d!77090 m!349011))

(assert (=> b!226955 d!77090))

(declare-fun d!77092 () Bool)

(assert (=> d!77092 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4987 (buf!5528 (_2!10563 lt!362164)))) ((_ sign_extend 32) (currentByte!10360 (_2!10563 lt!362164))) ((_ sign_extend 32) (currentBit!10355 (_2!10563 lt!362164))) lt!362169) (bvsle ((_ sign_extend 32) lt!362169) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4987 (buf!5528 (_2!10563 lt!362164)))) ((_ sign_extend 32) (currentByte!10360 (_2!10563 lt!362164))) ((_ sign_extend 32) (currentBit!10355 (_2!10563 lt!362164)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18835 () Bool)

(assert (= bs!18835 d!77092))

(assert (=> bs!18835 m!349009))

(assert (=> b!226955 d!77092))

(declare-fun d!77094 () Bool)

(declare-fun lt!362607 () (_ BitVec 8))

(declare-fun lt!362610 () (_ BitVec 8))

(assert (=> d!77094 (= lt!362607 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5959 (buf!5528 thiss!1870)) (currentByte!10360 thiss!1870))) ((_ sign_extend 24) lt!362610))))))

(assert (=> d!77094 (= lt!362610 ((_ extract 7 0) (currentBit!10355 thiss!1870)))))

(declare-fun e!155306 () Bool)

(assert (=> d!77094 e!155306))

(declare-fun res!190519 () Bool)

(assert (=> d!77094 (=> (not res!190519) (not e!155306))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!77094 (= res!190519 (validate_offset_bits!1 ((_ sign_extend 32) (size!4987 (buf!5528 thiss!1870))) ((_ sign_extend 32) (currentByte!10360 thiss!1870)) ((_ sign_extend 32) (currentBit!10355 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!19498 0))(
  ( (tuple2!19499 (_1!10572 Unit!16884) (_2!10572 (_ BitVec 8))) )
))
(declare-fun Unit!16912 () Unit!16884)

(declare-fun Unit!16913 () Unit!16884)

(assert (=> d!77094 (= (readByte!0 thiss!1870) (tuple2!19485 (_2!10572 (ite (bvsgt ((_ sign_extend 24) lt!362610) #b00000000000000000000000000000000) (tuple2!19499 Unit!16912 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!362607) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5959 (buf!5528 thiss!1870)) (bvadd (currentByte!10360 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!362610)))))))) (tuple2!19499 Unit!16913 lt!362607))) (BitStream!9071 (buf!5528 thiss!1870) (bvadd (currentByte!10360 thiss!1870) #b00000000000000000000000000000001) (currentBit!10355 thiss!1870))))))

(declare-fun b!227070 () Bool)

(declare-fun e!155307 () Bool)

(assert (=> b!227070 (= e!155306 e!155307)))

(declare-fun res!190518 () Bool)

(assert (=> b!227070 (=> (not res!190518) (not e!155307))))

(declare-fun lt!362605 () tuple2!19484)

(assert (=> b!227070 (= res!190518 (= (buf!5528 (_2!10563 lt!362605)) (buf!5528 thiss!1870)))))

(declare-fun lt!362609 () (_ BitVec 8))

(declare-fun lt!362608 () (_ BitVec 8))

(declare-fun Unit!16914 () Unit!16884)

(declare-fun Unit!16915 () Unit!16884)

(assert (=> b!227070 (= lt!362605 (tuple2!19485 (_2!10572 (ite (bvsgt ((_ sign_extend 24) lt!362609) #b00000000000000000000000000000000) (tuple2!19499 Unit!16914 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!362608) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5959 (buf!5528 thiss!1870)) (bvadd (currentByte!10360 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!362609)))))))) (tuple2!19499 Unit!16915 lt!362608))) (BitStream!9071 (buf!5528 thiss!1870) (bvadd (currentByte!10360 thiss!1870) #b00000000000000000000000000000001) (currentBit!10355 thiss!1870))))))

(assert (=> b!227070 (= lt!362608 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5959 (buf!5528 thiss!1870)) (currentByte!10360 thiss!1870))) ((_ sign_extend 24) lt!362609))))))

(assert (=> b!227070 (= lt!362609 ((_ extract 7 0) (currentBit!10355 thiss!1870)))))

(declare-fun b!227071 () Bool)

(declare-fun lt!362611 () (_ BitVec 64))

(declare-fun lt!362606 () (_ BitVec 64))

(assert (=> b!227071 (= e!155307 (= (bitIndex!0 (size!4987 (buf!5528 (_2!10563 lt!362605))) (currentByte!10360 (_2!10563 lt!362605)) (currentBit!10355 (_2!10563 lt!362605))) (bvadd lt!362606 lt!362611)))))

(assert (=> b!227071 (or (not (= (bvand lt!362606 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!362611 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!362606 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!362606 lt!362611) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!227071 (= lt!362611 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!227071 (= lt!362606 (bitIndex!0 (size!4987 (buf!5528 thiss!1870)) (currentByte!10360 thiss!1870) (currentBit!10355 thiss!1870)))))

(assert (= (and d!77094 res!190519) b!227070))

(assert (= (and b!227070 res!190518) b!227071))

(declare-fun m!349013 () Bool)

(assert (=> d!77094 m!349013))

(declare-fun m!349015 () Bool)

(assert (=> d!77094 m!349015))

(declare-fun m!349017 () Bool)

(assert (=> d!77094 m!349017))

(assert (=> b!227070 m!349017))

(assert (=> b!227070 m!349013))

(declare-fun m!349019 () Bool)

(assert (=> b!227071 m!349019))

(assert (=> b!227071 m!348811))

(assert (=> b!226955 d!77094))

(declare-fun d!77096 () Bool)

(assert (=> d!77096 (= (array_inv!4728 arr!308) (bvsge (size!4987 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!47666 d!77096))

(declare-fun d!77098 () Bool)

(assert (=> d!77098 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10355 thiss!1870) (currentByte!10360 thiss!1870) (size!4987 (buf!5528 thiss!1870))))))

(declare-fun bs!18836 () Bool)

(assert (= bs!18836 d!77098))

(assert (=> bs!18836 m!349003))

(assert (=> start!47666 d!77098))

(declare-fun d!77100 () Bool)

(assert (=> d!77100 (= (array_inv!4728 (buf!5528 thiss!1870)) (bvsge (size!4987 (buf!5528 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!226956 d!77100))

(push 1)

(assert (not bm!3814))

(assert (not d!77083))

(assert (not b!227059))

(assert (not d!77087))

(assert (not bm!3816))

(assert (not d!77050))

(assert (not d!77085))

(assert (not b!227044))

(assert (not d!77098))

(assert (not b!227042))

(assert (not d!77052))

(assert (not bm!3815))

(assert (not d!77092))

(assert (not d!77094))

(assert (not d!77090))

(assert (not b!227043))

(assert (not b!227046))

(assert (not b!227071))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

