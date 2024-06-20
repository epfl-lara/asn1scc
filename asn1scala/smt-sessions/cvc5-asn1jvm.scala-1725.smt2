; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47612 () Bool)

(assert start!47612)

(declare-fun b!226772 () Bool)

(declare-fun e!155073 () Bool)

(declare-datatypes ((array!11357 0))(
  ( (array!11358 (arr!5950 (Array (_ BitVec 32) (_ BitVec 8))) (size!4981 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9058 0))(
  ( (BitStream!9059 (buf!5522 array!11357) (currentByte!10348 (_ BitVec 32)) (currentBit!10343 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9058)

(declare-fun array_inv!4722 (array!11357) Bool)

(assert (=> b!226772 (= e!155073 (array_inv!4722 (buf!5522 thiss!1870)))))

(declare-fun b!226773 () Bool)

(declare-fun res!190276 () Bool)

(declare-fun e!155071 () Bool)

(assert (=> b!226773 (=> (not res!190276) (not e!155071))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!226773 (= res!190276 (bvslt i!761 to!496))))

(declare-fun lt!361527 () (_ BitVec 64))

(declare-datatypes ((Unit!16839 0))(
  ( (Unit!16840) )
))
(declare-datatypes ((tuple3!1344 0))(
  ( (tuple3!1345 (_1!10544 Unit!16839) (_2!10544 BitStream!9058) (_3!814 array!11357)) )
))
(declare-fun lt!361533 () tuple3!1344)

(declare-fun b!226774 () Bool)

(declare-fun lt!361531 () (_ BitVec 32))

(declare-fun e!155074 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!226774 (= e!155074 (= (bvadd lt!361527 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!361531))) (bitIndex!0 (size!4981 (buf!5522 (_2!10544 lt!361533))) (currentByte!10348 (_2!10544 lt!361533)) (currentBit!10343 (_2!10544 lt!361533)))))))

(declare-fun b!226775 () Bool)

(declare-fun res!190273 () Bool)

(assert (=> b!226775 (=> (not res!190273) (not e!155071))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!226775 (= res!190273 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4981 (buf!5522 thiss!1870))) ((_ sign_extend 32) (currentByte!10348 thiss!1870)) ((_ sign_extend 32) (currentBit!10343 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun res!190274 () Bool)

(assert (=> start!47612 (=> (not res!190274) (not e!155071))))

(declare-fun arr!308 () array!11357)

(assert (=> start!47612 (= res!190274 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4981 arr!308))))))

(assert (=> start!47612 e!155071))

(assert (=> start!47612 true))

(assert (=> start!47612 (array_inv!4722 arr!308)))

(declare-fun inv!12 (BitStream!9058) Bool)

(assert (=> start!47612 (and (inv!12 thiss!1870) e!155073)))

(declare-fun b!226776 () Bool)

(declare-fun lt!361529 () (_ BitVec 64))

(declare-fun lt!361530 () (_ BitVec 64))

(declare-fun lt!361528 () (_ BitVec 64))

(assert (=> b!226776 (= e!155071 (not (or (not (= lt!361530 (bvand lt!361529 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!361530 (bvand (bvadd lt!361528 lt!361529) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!226776 (= lt!361530 (bvand lt!361528 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!226776 (= lt!361529 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761))))))

(assert (=> b!226776 e!155074))

(declare-fun res!190275 () Bool)

(assert (=> b!226776 (=> (not res!190275) (not e!155074))))

(assert (=> b!226776 (= res!190275 (= lt!361527 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!361528)))))

(declare-datatypes ((tuple2!19460 0))(
  ( (tuple2!19461 (_1!10545 (_ BitVec 8)) (_2!10545 BitStream!9058)) )
))
(declare-fun lt!361532 () tuple2!19460)

(assert (=> b!226776 (= lt!361527 (bitIndex!0 (size!4981 (buf!5522 (_2!10545 lt!361532))) (currentByte!10348 (_2!10545 lt!361532)) (currentBit!10343 (_2!10545 lt!361532))))))

(assert (=> b!226776 (= lt!361528 (bitIndex!0 (size!4981 (buf!5522 thiss!1870)) (currentByte!10348 thiss!1870) (currentBit!10343 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9058 array!11357 (_ BitVec 32) (_ BitVec 32)) tuple3!1344)

(assert (=> b!226776 (= lt!361533 (readByteArrayLoop!0 (_2!10545 lt!361532) (array!11358 (store (arr!5950 arr!308) i!761 (_1!10545 lt!361532)) (size!4981 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!226776 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4981 (buf!5522 (_2!10545 lt!361532)))) ((_ sign_extend 32) (currentByte!10348 (_2!10545 lt!361532))) ((_ sign_extend 32) (currentBit!10343 (_2!10545 lt!361532))) lt!361531)))

(assert (=> b!226776 (= lt!361531 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!361526 () Unit!16839)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9058 BitStream!9058 (_ BitVec 64) (_ BitVec 32)) Unit!16839)

(assert (=> b!226776 (= lt!361526 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10545 lt!361532) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!9058) tuple2!19460)

(assert (=> b!226776 (= lt!361532 (readByte!0 thiss!1870))))

(assert (= (and start!47612 res!190274) b!226775))

(assert (= (and b!226775 res!190273) b!226773))

(assert (= (and b!226773 res!190276) b!226776))

(assert (= (and b!226776 res!190275) b!226774))

(assert (= start!47612 b!226772))

(declare-fun m!348451 () Bool)

(assert (=> start!47612 m!348451))

(declare-fun m!348453 () Bool)

(assert (=> start!47612 m!348453))

(declare-fun m!348455 () Bool)

(assert (=> b!226775 m!348455))

(declare-fun m!348457 () Bool)

(assert (=> b!226772 m!348457))

(declare-fun m!348459 () Bool)

(assert (=> b!226774 m!348459))

(declare-fun m!348461 () Bool)

(assert (=> b!226776 m!348461))

(declare-fun m!348463 () Bool)

(assert (=> b!226776 m!348463))

(declare-fun m!348465 () Bool)

(assert (=> b!226776 m!348465))

(declare-fun m!348467 () Bool)

(assert (=> b!226776 m!348467))

(declare-fun m!348469 () Bool)

(assert (=> b!226776 m!348469))

(declare-fun m!348471 () Bool)

(assert (=> b!226776 m!348471))

(declare-fun m!348473 () Bool)

(assert (=> b!226776 m!348473))

(push 1)

(assert (not b!226776))

(assert (not b!226772))

(assert (not start!47612))

(assert (not b!226774))

(assert (not b!226775))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!77000 () Bool)

(declare-fun e!155133 () Bool)

(assert (=> d!77000 e!155133))

(declare-fun res!190339 () Bool)

(assert (=> d!77000 (=> (not res!190339) (not e!155133))))

(assert (=> d!77000 (= res!190339 (and (or (let ((rhs!3925 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3925 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3925) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!77001 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!77001 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!77001 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3924 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3924 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3924) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!361696 () Unit!16839)

(declare-fun choose!57 (BitStream!9058 BitStream!9058 (_ BitVec 64) (_ BitVec 32)) Unit!16839)

(assert (=> d!77000 (= lt!361696 (choose!57 thiss!1870 (_2!10545 lt!361532) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> d!77000 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10545 lt!361532) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)) lt!361696)))

(declare-fun b!226843 () Bool)

(declare-fun lt!361698 () (_ BitVec 32))

(assert (=> b!226843 (= e!155133 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4981 (buf!5522 (_2!10545 lt!361532)))) ((_ sign_extend 32) (currentByte!10348 (_2!10545 lt!361532))) ((_ sign_extend 32) (currentBit!10343 (_2!10545 lt!361532))) (bvsub (bvsub to!496 i!761) lt!361698)))))

(assert (=> b!226843 (or (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand lt!361698 #b10000000000000000000000000000000)) (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!496 i!761) lt!361698) #b10000000000000000000000000000000)))))

(declare-fun lt!361697 () (_ BitVec 64))

(assert (=> b!226843 (= lt!361698 ((_ extract 31 0) lt!361697))))

(assert (=> b!226843 (and (bvslt lt!361697 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!361697 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!226843 (= lt!361697 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!77000 res!190339) b!226843))

(declare-fun m!348565 () Bool)

(assert (=> d!77000 m!348565))

(declare-fun m!348567 () Bool)

(assert (=> b!226843 m!348567))

(assert (=> b!226776 d!77000))

(declare-fun d!77003 () Bool)

(declare-fun lt!361716 () (_ BitVec 8))

(declare-fun lt!361719 () (_ BitVec 8))

(assert (=> d!77003 (= lt!361716 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5950 (buf!5522 thiss!1870)) (currentByte!10348 thiss!1870))) ((_ sign_extend 24) lt!361719))))))

(assert (=> d!77003 (= lt!361719 ((_ extract 7 0) (currentBit!10343 thiss!1870)))))

(declare-fun e!155139 () Bool)

(assert (=> d!77003 e!155139))

(declare-fun res!190345 () Bool)

(assert (=> d!77003 (=> (not res!190345) (not e!155139))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!77003 (= res!190345 (validate_offset_bits!1 ((_ sign_extend 32) (size!4981 (buf!5522 thiss!1870))) ((_ sign_extend 32) (currentByte!10348 thiss!1870)) ((_ sign_extend 32) (currentBit!10343 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!19474 0))(
  ( (tuple2!19475 (_1!10554 Unit!16839) (_2!10554 (_ BitVec 8))) )
))
(declare-fun Unit!16860 () Unit!16839)

(declare-fun Unit!16861 () Unit!16839)

(assert (=> d!77003 (= (readByte!0 thiss!1870) (tuple2!19461 (_2!10554 (ite (bvsgt ((_ sign_extend 24) lt!361719) #b00000000000000000000000000000000) (tuple2!19475 Unit!16860 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!361716) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5950 (buf!5522 thiss!1870)) (bvadd (currentByte!10348 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!361719)))))))) (tuple2!19475 Unit!16861 lt!361716))) (BitStream!9059 (buf!5522 thiss!1870) (bvadd (currentByte!10348 thiss!1870) #b00000000000000000000000000000001) (currentBit!10343 thiss!1870))))))

(declare-fun b!226848 () Bool)

(declare-fun e!155138 () Bool)

(assert (=> b!226848 (= e!155139 e!155138)))

(declare-fun res!190346 () Bool)

(assert (=> b!226848 (=> (not res!190346) (not e!155138))))

(declare-fun lt!361714 () tuple2!19460)

(assert (=> b!226848 (= res!190346 (= (buf!5522 (_2!10545 lt!361714)) (buf!5522 thiss!1870)))))

(declare-fun lt!361717 () (_ BitVec 8))

(declare-fun lt!361715 () (_ BitVec 8))

(declare-fun Unit!16863 () Unit!16839)

(declare-fun Unit!16865 () Unit!16839)

(assert (=> b!226848 (= lt!361714 (tuple2!19461 (_2!10554 (ite (bvsgt ((_ sign_extend 24) lt!361717) #b00000000000000000000000000000000) (tuple2!19475 Unit!16863 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!361715) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5950 (buf!5522 thiss!1870)) (bvadd (currentByte!10348 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!361717)))))))) (tuple2!19475 Unit!16865 lt!361715))) (BitStream!9059 (buf!5522 thiss!1870) (bvadd (currentByte!10348 thiss!1870) #b00000000000000000000000000000001) (currentBit!10343 thiss!1870))))))

(assert (=> b!226848 (= lt!361715 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5950 (buf!5522 thiss!1870)) (currentByte!10348 thiss!1870))) ((_ sign_extend 24) lt!361717))))))

(assert (=> b!226848 (= lt!361717 ((_ extract 7 0) (currentBit!10343 thiss!1870)))))

(declare-fun lt!361713 () (_ BitVec 64))

(declare-fun lt!361718 () (_ BitVec 64))

(declare-fun b!226849 () Bool)

(assert (=> b!226849 (= e!155138 (= (bitIndex!0 (size!4981 (buf!5522 (_2!10545 lt!361714))) (currentByte!10348 (_2!10545 lt!361714)) (currentBit!10343 (_2!10545 lt!361714))) (bvadd lt!361718 lt!361713)))))

(assert (=> b!226849 (or (not (= (bvand lt!361718 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!361713 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!361718 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!361718 lt!361713) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!226849 (= lt!361713 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!226849 (= lt!361718 (bitIndex!0 (size!4981 (buf!5522 thiss!1870)) (currentByte!10348 thiss!1870) (currentBit!10343 thiss!1870)))))

(assert (= (and d!77003 res!190345) b!226848))

(assert (= (and b!226848 res!190346) b!226849))

(declare-fun m!348569 () Bool)

(assert (=> d!77003 m!348569))

(declare-fun m!348571 () Bool)

(assert (=> d!77003 m!348571))

(declare-fun m!348573 () Bool)

(assert (=> d!77003 m!348573))

(assert (=> b!226848 m!348573))

(assert (=> b!226848 m!348569))

(declare-fun m!348575 () Bool)

(assert (=> b!226849 m!348575))

(assert (=> b!226849 m!348471))

(assert (=> b!226776 d!77003))

(declare-fun d!77005 () Bool)

(declare-fun e!155142 () Bool)

(assert (=> d!77005 e!155142))

(declare-fun res!190352 () Bool)

(assert (=> d!77005 (=> (not res!190352) (not e!155142))))

(declare-fun lt!361737 () (_ BitVec 64))

(declare-fun lt!361732 () (_ BitVec 64))

(declare-fun lt!361736 () (_ BitVec 64))

(assert (=> d!77005 (= res!190352 (= lt!361736 (bvsub lt!361737 lt!361732)))))

(assert (=> d!77005 (or (= (bvand lt!361737 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!361732 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!361737 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!361737 lt!361732) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!77005 (= lt!361732 (remainingBits!0 ((_ sign_extend 32) (size!4981 (buf!5522 thiss!1870))) ((_ sign_extend 32) (currentByte!10348 thiss!1870)) ((_ sign_extend 32) (currentBit!10343 thiss!1870))))))

(declare-fun lt!361735 () (_ BitVec 64))

(declare-fun lt!361734 () (_ BitVec 64))

(assert (=> d!77005 (= lt!361737 (bvmul lt!361735 lt!361734))))

(assert (=> d!77005 (or (= lt!361735 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!361734 (bvsdiv (bvmul lt!361735 lt!361734) lt!361735)))))

(assert (=> d!77005 (= lt!361734 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77005 (= lt!361735 ((_ sign_extend 32) (size!4981 (buf!5522 thiss!1870))))))

(assert (=> d!77005 (= lt!361736 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10348 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10343 thiss!1870))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!77005 (invariant!0 (currentBit!10343 thiss!1870) (currentByte!10348 thiss!1870) (size!4981 (buf!5522 thiss!1870)))))

(assert (=> d!77005 (= (bitIndex!0 (size!4981 (buf!5522 thiss!1870)) (currentByte!10348 thiss!1870) (currentBit!10343 thiss!1870)) lt!361736)))

(declare-fun b!226854 () Bool)

(declare-fun res!190351 () Bool)

(assert (=> b!226854 (=> (not res!190351) (not e!155142))))

(assert (=> b!226854 (= res!190351 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!361736))))

(declare-fun b!226855 () Bool)

(declare-fun lt!361733 () (_ BitVec 64))

(assert (=> b!226855 (= e!155142 (bvsle lt!361736 (bvmul lt!361733 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!226855 (or (= lt!361733 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!361733 #b0000000000000000000000000000000000000000000000000000000000001000) lt!361733)))))

(assert (=> b!226855 (= lt!361733 ((_ sign_extend 32) (size!4981 (buf!5522 thiss!1870))))))

(assert (= (and d!77005 res!190352) b!226854))

(assert (= (and b!226854 res!190351) b!226855))

(declare-fun m!348577 () Bool)

(assert (=> d!77005 m!348577))

(declare-fun m!348579 () Bool)

(assert (=> d!77005 m!348579))

(assert (=> b!226776 d!77005))

(declare-fun d!77007 () Bool)

(declare-fun e!155169 () Bool)

(assert (=> d!77007 e!155169))

(declare-fun res!190382 () Bool)

(assert (=> d!77007 (=> res!190382 e!155169)))

(assert (=> d!77007 (= res!190382 (bvsge (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!362061 () Bool)

(declare-fun e!155171 () Bool)

(assert (=> d!77007 (= lt!362061 e!155171)))

(declare-fun res!190383 () Bool)

(assert (=> d!77007 (=> (not res!190383) (not e!155171))))

(declare-fun lt!362060 () (_ BitVec 64))

(declare-fun lt!362064 () tuple3!1344)

(declare-fun lt!362049 () (_ BitVec 64))

(assert (=> d!77007 (= res!190383 (= (bvadd lt!362049 lt!362060) (bitIndex!0 (size!4981 (buf!5522 (_2!10544 lt!362064))) (currentByte!10348 (_2!10544 lt!362064)) (currentBit!10343 (_2!10544 lt!362064)))))))

(assert (=> d!77007 (or (not (= (bvand lt!362049 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!362060 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!362049 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!362049 lt!362060) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!362068 () (_ BitVec 64))

(assert (=> d!77007 (= lt!362060 (bvmul lt!362068 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!77007 (or (= lt!362068 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!362068 #b0000000000000000000000000000000000000000000000000000000000001000) lt!362068)))))

(assert (=> d!77007 (= lt!362068 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))))))

(assert (=> d!77007 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b10000000000000000000000000000000)))))

(assert (=> d!77007 (= lt!362049 (bitIndex!0 (size!4981 (buf!5522 (_2!10545 lt!361532))) (currentByte!10348 (_2!10545 lt!361532)) (currentBit!10343 (_2!10545 lt!361532))))))

(declare-fun e!155170 () tuple3!1344)

(assert (=> d!77007 (= lt!362064 e!155170)))

(declare-fun c!11194 () Bool)

(assert (=> d!77007 (= c!11194 (bvslt (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> d!77007 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) to!496) (bvsle to!496 (size!4981 (array!11358 (store (arr!5950 arr!308) i!761 (_1!10545 lt!361532)) (size!4981 arr!308)))))))

(assert (=> d!77007 (= (readByteArrayLoop!0 (_2!10545 lt!361532) (array!11358 (store (arr!5950 arr!308) i!761 (_1!10545 lt!361532)) (size!4981 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496) lt!362064)))

(declare-fun b!226900 () Bool)

(declare-fun res!190381 () Bool)

(assert (=> b!226900 (=> (not res!190381) (not e!155171))))

(assert (=> b!226900 (= res!190381 (and (= (buf!5522 (_2!10545 lt!361532)) (buf!5522 (_2!10544 lt!362064))) (= (size!4981 (array!11358 (store (arr!5950 arr!308) i!761 (_1!10545 lt!361532)) (size!4981 arr!308))) (size!4981 (_3!814 lt!362064)))))))

(declare-fun b!226901 () Bool)

(declare-fun arrayRangesEq!825 (array!11357 array!11357 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!226901 (= e!155171 (arrayRangesEq!825 (array!11358 (store (arr!5950 arr!308) i!761 (_1!10545 lt!361532)) (size!4981 arr!308)) (_3!814 lt!362064) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!362054 () tuple3!1344)

(declare-fun lt!362071 () (_ BitVec 32))

(declare-fun lt!362073 () array!11357)

(declare-fun call!3800 () Bool)

(declare-fun bm!3796 () Bool)

(declare-fun lt!362051 () array!11357)

(declare-fun lt!362044 () (_ BitVec 32))

(assert (=> bm!3796 (= call!3800 (arrayRangesEq!825 (ite c!11194 (array!11358 (store (arr!5950 arr!308) i!761 (_1!10545 lt!361532)) (size!4981 arr!308)) lt!362051) (ite c!11194 (_3!814 lt!362054) lt!362073) (ite c!11194 #b00000000000000000000000000000000 lt!362071) (ite c!11194 (bvadd #b00000000000000000000000000000001 i!761) lt!362044)))))

(declare-fun b!226902 () Bool)

(declare-fun lt!362069 () Unit!16839)

(assert (=> b!226902 (= e!155170 (tuple3!1345 lt!362069 (_2!10544 lt!362054) (_3!814 lt!362054)))))

(declare-fun lt!362055 () tuple2!19460)

(assert (=> b!226902 (= lt!362055 (readByte!0 (_2!10545 lt!361532)))))

(declare-fun lt!362066 () array!11357)

(assert (=> b!226902 (= lt!362066 (array!11358 (store (arr!5950 (array!11358 (store (arr!5950 arr!308) i!761 (_1!10545 lt!361532)) (size!4981 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10545 lt!362055)) (size!4981 (array!11358 (store (arr!5950 arr!308) i!761 (_1!10545 lt!361532)) (size!4981 arr!308)))))))

(declare-fun lt!362050 () (_ BitVec 64))

(assert (=> b!226902 (= lt!362050 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!362052 () (_ BitVec 32))

(assert (=> b!226902 (= lt!362052 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!362057 () Unit!16839)

(assert (=> b!226902 (= lt!362057 (validateOffsetBytesFromBitIndexLemma!0 (_2!10545 lt!361532) (_2!10545 lt!362055) lt!362050 lt!362052))))

(assert (=> b!226902 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4981 (buf!5522 (_2!10545 lt!362055)))) ((_ sign_extend 32) (currentByte!10348 (_2!10545 lt!362055))) ((_ sign_extend 32) (currentBit!10343 (_2!10545 lt!362055))) (bvsub lt!362052 ((_ extract 31 0) (bvsdiv (bvadd lt!362050 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!362067 () Unit!16839)

(assert (=> b!226902 (= lt!362067 lt!362057)))

(assert (=> b!226902 (= lt!362054 (readByteArrayLoop!0 (_2!10545 lt!362055) lt!362066 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(declare-fun call!3801 () (_ BitVec 64))

(assert (=> b!226902 (= call!3801 (bvadd (bitIndex!0 (size!4981 (buf!5522 (_2!10545 lt!361532))) (currentByte!10348 (_2!10545 lt!361532)) (currentBit!10343 (_2!10545 lt!361532))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!362043 () Unit!16839)

(declare-fun Unit!16871 () Unit!16839)

(assert (=> b!226902 (= lt!362043 Unit!16871)))

(assert (=> b!226902 (= (bvadd call!3801 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4981 (buf!5522 (_2!10544 lt!362054))) (currentByte!10348 (_2!10544 lt!362054)) (currentBit!10343 (_2!10544 lt!362054))))))

(declare-fun lt!362058 () Unit!16839)

(declare-fun Unit!16872 () Unit!16839)

(assert (=> b!226902 (= lt!362058 Unit!16872)))

(assert (=> b!226902 (= (bvadd (bitIndex!0 (size!4981 (buf!5522 (_2!10545 lt!361532))) (currentByte!10348 (_2!10545 lt!361532)) (currentBit!10343 (_2!10545 lt!361532))) (bvmul ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4981 (buf!5522 (_2!10544 lt!362054))) (currentByte!10348 (_2!10544 lt!362054)) (currentBit!10343 (_2!10544 lt!362054))))))

(declare-fun lt!362048 () Unit!16839)

(declare-fun Unit!16873 () Unit!16839)

(assert (=> b!226902 (= lt!362048 Unit!16873)))

(assert (=> b!226902 (and (= (buf!5522 (_2!10545 lt!361532)) (buf!5522 (_2!10544 lt!362054))) (= (size!4981 (array!11358 (store (arr!5950 arr!308) i!761 (_1!10545 lt!361532)) (size!4981 arr!308))) (size!4981 (_3!814 lt!362054))))))

(declare-fun lt!362059 () Unit!16839)

(declare-fun Unit!16874 () Unit!16839)

(assert (=> b!226902 (= lt!362059 Unit!16874)))

(declare-fun lt!362062 () Unit!16839)

(declare-fun arrayUpdatedAtPrefixLemma!384 (array!11357 (_ BitVec 32) (_ BitVec 8)) Unit!16839)

(assert (=> b!226902 (= lt!362062 (arrayUpdatedAtPrefixLemma!384 (array!11358 (store (arr!5950 arr!308) i!761 (_1!10545 lt!361532)) (size!4981 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) (_1!10545 lt!362055)))))

(assert (=> b!226902 (arrayRangesEq!825 (array!11358 (store (arr!5950 arr!308) i!761 (_1!10545 lt!361532)) (size!4981 arr!308)) (array!11358 (store (arr!5950 (array!11358 (store (arr!5950 arr!308) i!761 (_1!10545 lt!361532)) (size!4981 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10545 lt!362055)) (size!4981 (array!11358 (store (arr!5950 arr!308) i!761 (_1!10545 lt!361532)) (size!4981 arr!308)))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun lt!362039 () Unit!16839)

(assert (=> b!226902 (= lt!362039 lt!362062)))

(declare-fun lt!362038 () (_ BitVec 32))

(assert (=> b!226902 (= lt!362038 #b00000000000000000000000000000000)))

(declare-fun lt!362047 () Unit!16839)

(declare-fun arrayRangesEqTransitive!263 (array!11357 array!11357 array!11357 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16839)

(assert (=> b!226902 (= lt!362047 (arrayRangesEqTransitive!263 (array!11358 (store (arr!5950 arr!308) i!761 (_1!10545 lt!361532)) (size!4981 arr!308)) lt!362066 (_3!814 lt!362054) lt!362038 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(declare-fun call!3799 () Bool)

(assert (=> b!226902 call!3799))

(declare-fun lt!362056 () Unit!16839)

(assert (=> b!226902 (= lt!362056 lt!362047)))

(assert (=> b!226902 call!3800))

(declare-fun lt!362041 () Unit!16839)

(declare-fun Unit!16875 () Unit!16839)

(assert (=> b!226902 (= lt!362041 Unit!16875)))

(declare-fun lt!362065 () Unit!16839)

(declare-fun arrayRangesEqImpliesEq!114 (array!11357 array!11357 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16839)

(assert (=> b!226902 (= lt!362065 (arrayRangesEqImpliesEq!114 lt!362066 (_3!814 lt!362054) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!226902 (= (select (store (arr!5950 (array!11358 (store (arr!5950 arr!308) i!761 (_1!10545 lt!361532)) (size!4981 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10545 lt!362055)) (bvadd #b00000000000000000000000000000001 i!761)) (select (arr!5950 (_3!814 lt!362054)) (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!362042 () Unit!16839)

(assert (=> b!226902 (= lt!362042 lt!362065)))

(declare-fun lt!362045 () Bool)

(assert (=> b!226902 (= lt!362045 (= (select (arr!5950 (_3!814 lt!362054)) (bvadd #b00000000000000000000000000000001 i!761)) (_1!10545 lt!362055)))))

(declare-fun Unit!16876 () Unit!16839)

(assert (=> b!226902 (= lt!362069 Unit!16876)))

(assert (=> b!226902 lt!362045))

(declare-fun bm!3797 () Bool)

(assert (=> bm!3797 (= call!3801 (bitIndex!0 (ite c!11194 (size!4981 (buf!5522 (_2!10545 lt!362055))) (size!4981 (buf!5522 (_2!10545 lt!361532)))) (ite c!11194 (currentByte!10348 (_2!10545 lt!362055)) (currentByte!10348 (_2!10545 lt!361532))) (ite c!11194 (currentBit!10343 (_2!10545 lt!362055)) (currentBit!10343 (_2!10545 lt!361532)))))))

(declare-fun lt!362053 () Unit!16839)

(declare-fun b!226903 () Bool)

(assert (=> b!226903 (= e!155170 (tuple3!1345 lt!362053 (_2!10545 lt!361532) (array!11358 (store (arr!5950 arr!308) i!761 (_1!10545 lt!361532)) (size!4981 arr!308))))))

(assert (=> b!226903 (= call!3801 call!3801)))

(declare-fun lt!362063 () Unit!16839)

(declare-fun Unit!16877 () Unit!16839)

(assert (=> b!226903 (= lt!362063 Unit!16877)))

(declare-fun lt!362046 () Unit!16839)

(declare-fun arrayRangesEqReflexiveLemma!129 (array!11357) Unit!16839)

(assert (=> b!226903 (= lt!362046 (arrayRangesEqReflexiveLemma!129 (array!11358 (store (arr!5950 arr!308) i!761 (_1!10545 lt!361532)) (size!4981 arr!308))))))

(assert (=> b!226903 call!3799))

(declare-fun lt!362070 () Unit!16839)

(assert (=> b!226903 (= lt!362070 lt!362046)))

(assert (=> b!226903 (= lt!362051 (array!11358 (store (arr!5950 arr!308) i!761 (_1!10545 lt!361532)) (size!4981 arr!308)))))

(assert (=> b!226903 (= lt!362073 (array!11358 (store (arr!5950 arr!308) i!761 (_1!10545 lt!361532)) (size!4981 arr!308)))))

(declare-fun lt!362072 () (_ BitVec 32))

(assert (=> b!226903 (= lt!362072 #b00000000000000000000000000000000)))

(declare-fun lt!362040 () (_ BitVec 32))

(assert (=> b!226903 (= lt!362040 (size!4981 (array!11358 (store (arr!5950 arr!308) i!761 (_1!10545 lt!361532)) (size!4981 arr!308))))))

(assert (=> b!226903 (= lt!362071 #b00000000000000000000000000000000)))

(assert (=> b!226903 (= lt!362044 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun arrayRangesEqSlicedLemma!114 (array!11357 array!11357 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16839)

(assert (=> b!226903 (= lt!362053 (arrayRangesEqSlicedLemma!114 lt!362051 lt!362073 lt!362072 lt!362040 lt!362071 lt!362044))))

(assert (=> b!226903 call!3800))

(declare-fun bm!3798 () Bool)

(assert (=> bm!3798 (= call!3799 (arrayRangesEq!825 (array!11358 (store (arr!5950 arr!308) i!761 (_1!10545 lt!361532)) (size!4981 arr!308)) (ite c!11194 (_3!814 lt!362054) (array!11358 (store (arr!5950 arr!308) i!761 (_1!10545 lt!361532)) (size!4981 arr!308))) (ite c!11194 lt!362038 #b00000000000000000000000000000000) (ite c!11194 (bvadd #b00000000000000000000000000000001 i!761) (size!4981 (array!11358 (store (arr!5950 arr!308) i!761 (_1!10545 lt!361532)) (size!4981 arr!308))))))))

(declare-fun b!226904 () Bool)

(declare-datatypes ((tuple2!19476 0))(
  ( (tuple2!19477 (_1!10555 BitStream!9058) (_2!10555 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!9058) tuple2!19476)

(assert (=> b!226904 (= e!155169 (= (select (arr!5950 (_3!814 lt!362064)) (bvadd #b00000000000000000000000000000001 i!761)) (_2!10555 (readBytePure!0 (_2!10545 lt!361532)))))))

(assert (=> b!226904 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4981 (_3!814 lt!362064))))))

(assert (= (and d!77007 c!11194) b!226902))

(assert (= (and d!77007 (not c!11194)) b!226903))

(assert (= (or b!226902 b!226903) bm!3796))

(assert (= (or b!226902 b!226903) bm!3798))

(assert (= (or b!226902 b!226903) bm!3797))

(assert (= (and d!77007 res!190383) b!226900))

(assert (= (and b!226900 res!190381) b!226901))

(assert (= (and d!77007 (not res!190382)) b!226904))

(declare-fun m!348671 () Bool)

(assert (=> b!226904 m!348671))

(declare-fun m!348673 () Bool)

(assert (=> b!226904 m!348673))

(declare-fun m!348675 () Bool)

(assert (=> b!226902 m!348675))

(assert (=> b!226902 m!348465))

(declare-fun m!348677 () Bool)

(assert (=> b!226902 m!348677))

(declare-fun m!348679 () Bool)

(assert (=> b!226902 m!348679))

(declare-fun m!348681 () Bool)

(assert (=> b!226902 m!348681))

(declare-fun m!348683 () Bool)

(assert (=> b!226902 m!348683))

(declare-fun m!348685 () Bool)

(assert (=> b!226902 m!348685))

(declare-fun m!348687 () Bool)

(assert (=> b!226902 m!348687))

(declare-fun m!348689 () Bool)

(assert (=> b!226902 m!348689))

(declare-fun m!348691 () Bool)

(assert (=> b!226902 m!348691))

(declare-fun m!348693 () Bool)

(assert (=> b!226902 m!348693))

(declare-fun m!348695 () Bool)

(assert (=> b!226902 m!348695))

(declare-fun m!348697 () Bool)

(assert (=> b!226902 m!348697))

(declare-fun m!348699 () Bool)

(assert (=> bm!3796 m!348699))

(declare-fun m!348701 () Bool)

(assert (=> b!226901 m!348701))

(declare-fun m!348703 () Bool)

(assert (=> d!77007 m!348703))

(assert (=> d!77007 m!348465))

(declare-fun m!348705 () Bool)

(assert (=> bm!3797 m!348705))

(declare-fun m!348707 () Bool)

(assert (=> b!226903 m!348707))

(declare-fun m!348709 () Bool)

(assert (=> b!226903 m!348709))

(declare-fun m!348711 () Bool)

(assert (=> bm!3798 m!348711))

(assert (=> b!226776 d!77007))

(declare-fun d!77025 () Bool)

(declare-fun e!155172 () Bool)

(assert (=> d!77025 e!155172))

(declare-fun res!190385 () Bool)

(assert (=> d!77025 (=> (not res!190385) (not e!155172))))

(declare-fun lt!362079 () (_ BitVec 64))

(declare-fun lt!362074 () (_ BitVec 64))

(declare-fun lt!362078 () (_ BitVec 64))

(assert (=> d!77025 (= res!190385 (= lt!362078 (bvsub lt!362079 lt!362074)))))

(assert (=> d!77025 (or (= (bvand lt!362079 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!362074 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!362079 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!362079 lt!362074) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77025 (= lt!362074 (remainingBits!0 ((_ sign_extend 32) (size!4981 (buf!5522 (_2!10545 lt!361532)))) ((_ sign_extend 32) (currentByte!10348 (_2!10545 lt!361532))) ((_ sign_extend 32) (currentBit!10343 (_2!10545 lt!361532)))))))

(declare-fun lt!362077 () (_ BitVec 64))

(declare-fun lt!362076 () (_ BitVec 64))

(assert (=> d!77025 (= lt!362079 (bvmul lt!362077 lt!362076))))

(assert (=> d!77025 (or (= lt!362077 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!362076 (bvsdiv (bvmul lt!362077 lt!362076) lt!362077)))))

(assert (=> d!77025 (= lt!362076 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77025 (= lt!362077 ((_ sign_extend 32) (size!4981 (buf!5522 (_2!10545 lt!361532)))))))

(assert (=> d!77025 (= lt!362078 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10348 (_2!10545 lt!361532))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10343 (_2!10545 lt!361532)))))))

(assert (=> d!77025 (invariant!0 (currentBit!10343 (_2!10545 lt!361532)) (currentByte!10348 (_2!10545 lt!361532)) (size!4981 (buf!5522 (_2!10545 lt!361532))))))

(assert (=> d!77025 (= (bitIndex!0 (size!4981 (buf!5522 (_2!10545 lt!361532))) (currentByte!10348 (_2!10545 lt!361532)) (currentBit!10343 (_2!10545 lt!361532))) lt!362078)))

(declare-fun b!226905 () Bool)

(declare-fun res!190384 () Bool)

(assert (=> b!226905 (=> (not res!190384) (not e!155172))))

(assert (=> b!226905 (= res!190384 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!362078))))

(declare-fun b!226906 () Bool)

(declare-fun lt!362075 () (_ BitVec 64))

(assert (=> b!226906 (= e!155172 (bvsle lt!362078 (bvmul lt!362075 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!226906 (or (= lt!362075 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!362075 #b0000000000000000000000000000000000000000000000000000000000001000) lt!362075)))))

(assert (=> b!226906 (= lt!362075 ((_ sign_extend 32) (size!4981 (buf!5522 (_2!10545 lt!361532)))))))

(assert (= (and d!77025 res!190385) b!226905))

(assert (= (and b!226905 res!190384) b!226906))

(declare-fun m!348713 () Bool)

(assert (=> d!77025 m!348713))

(declare-fun m!348715 () Bool)

(assert (=> d!77025 m!348715))

(assert (=> b!226776 d!77025))

(declare-fun d!77027 () Bool)

(assert (=> d!77027 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4981 (buf!5522 (_2!10545 lt!361532)))) ((_ sign_extend 32) (currentByte!10348 (_2!10545 lt!361532))) ((_ sign_extend 32) (currentBit!10343 (_2!10545 lt!361532))) lt!361531) (bvsle ((_ sign_extend 32) lt!361531) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4981 (buf!5522 (_2!10545 lt!361532)))) ((_ sign_extend 32) (currentByte!10348 (_2!10545 lt!361532))) ((_ sign_extend 32) (currentBit!10343 (_2!10545 lt!361532)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18822 () Bool)

(assert (= bs!18822 d!77027))

(assert (=> bs!18822 m!348713))

(assert (=> b!226776 d!77027))

(declare-fun d!77029 () Bool)

(assert (=> d!77029 (= (array_inv!4722 (buf!5522 thiss!1870)) (bvsge (size!4981 (buf!5522 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!226772 d!77029))

(declare-fun d!77031 () Bool)

(assert (=> d!77031 (= (array_inv!4722 arr!308) (bvsge (size!4981 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!47612 d!77031))

(declare-fun d!77033 () Bool)

(assert (=> d!77033 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10343 thiss!1870) (currentByte!10348 thiss!1870) (size!4981 (buf!5522 thiss!1870))))))

(declare-fun bs!18823 () Bool)

(assert (= bs!18823 d!77033))

(assert (=> bs!18823 m!348579))

(assert (=> start!47612 d!77033))

(declare-fun d!77035 () Bool)

(declare-fun e!155173 () Bool)

(assert (=> d!77035 e!155173))

(declare-fun res!190387 () Bool)

(assert (=> d!77035 (=> (not res!190387) (not e!155173))))

(declare-fun lt!362085 () (_ BitVec 64))

(declare-fun lt!362084 () (_ BitVec 64))

(declare-fun lt!362080 () (_ BitVec 64))

(assert (=> d!77035 (= res!190387 (= lt!362084 (bvsub lt!362085 lt!362080)))))

(assert (=> d!77035 (or (= (bvand lt!362085 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!362080 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!362085 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!362085 lt!362080) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77035 (= lt!362080 (remainingBits!0 ((_ sign_extend 32) (size!4981 (buf!5522 (_2!10544 lt!361533)))) ((_ sign_extend 32) (currentByte!10348 (_2!10544 lt!361533))) ((_ sign_extend 32) (currentBit!10343 (_2!10544 lt!361533)))))))

(declare-fun lt!362083 () (_ BitVec 64))

(declare-fun lt!362082 () (_ BitVec 64))

(assert (=> d!77035 (= lt!362085 (bvmul lt!362083 lt!362082))))

(assert (=> d!77035 (or (= lt!362083 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!362082 (bvsdiv (bvmul lt!362083 lt!362082) lt!362083)))))

(assert (=> d!77035 (= lt!362082 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77035 (= lt!362083 ((_ sign_extend 32) (size!4981 (buf!5522 (_2!10544 lt!361533)))))))

(assert (=> d!77035 (= lt!362084 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10348 (_2!10544 lt!361533))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10343 (_2!10544 lt!361533)))))))

(assert (=> d!77035 (invariant!0 (currentBit!10343 (_2!10544 lt!361533)) (currentByte!10348 (_2!10544 lt!361533)) (size!4981 (buf!5522 (_2!10544 lt!361533))))))

(assert (=> d!77035 (= (bitIndex!0 (size!4981 (buf!5522 (_2!10544 lt!361533))) (currentByte!10348 (_2!10544 lt!361533)) (currentBit!10343 (_2!10544 lt!361533))) lt!362084)))

(declare-fun b!226907 () Bool)

(declare-fun res!190386 () Bool)

(assert (=> b!226907 (=> (not res!190386) (not e!155173))))

(assert (=> b!226907 (= res!190386 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!362084))))

(declare-fun b!226908 () Bool)

(declare-fun lt!362081 () (_ BitVec 64))

(assert (=> b!226908 (= e!155173 (bvsle lt!362084 (bvmul lt!362081 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!226908 (or (= lt!362081 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!362081 #b0000000000000000000000000000000000000000000000000000000000001000) lt!362081)))))

(assert (=> b!226908 (= lt!362081 ((_ sign_extend 32) (size!4981 (buf!5522 (_2!10544 lt!361533)))))))

(assert (= (and d!77035 res!190387) b!226907))

(assert (= (and b!226907 res!190386) b!226908))

(declare-fun m!348717 () Bool)

(assert (=> d!77035 m!348717))

(declare-fun m!348719 () Bool)

(assert (=> d!77035 m!348719))

(assert (=> b!226774 d!77035))

(declare-fun d!77037 () Bool)

(assert (=> d!77037 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4981 (buf!5522 thiss!1870))) ((_ sign_extend 32) (currentByte!10348 thiss!1870)) ((_ sign_extend 32) (currentBit!10343 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4981 (buf!5522 thiss!1870))) ((_ sign_extend 32) (currentByte!10348 thiss!1870)) ((_ sign_extend 32) (currentBit!10343 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18824 () Bool)

(assert (= bs!18824 d!77037))

(assert (=> bs!18824 m!348577))

(assert (=> b!226775 d!77037))

(push 1)

(assert (not bm!3798))

(assert (not d!77000))

(assert (not b!226904))

(assert (not d!77033))

(assert (not d!77037))

(assert (not d!77025))

(assert (not d!77027))

(assert (not d!77035))

(assert (not b!226901))

(assert (not b!226903))

(assert (not bm!3796))

(assert (not d!77007))

(assert (not b!226843))

(assert (not d!77003))

(assert (not b!226902))

(assert (not d!77005))

(assert (not b!226849))

(assert (not bm!3797))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

