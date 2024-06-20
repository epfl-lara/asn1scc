; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47616 () Bool)

(assert start!47616)

(declare-fun b!226802 () Bool)

(declare-fun res!190299 () Bool)

(declare-fun e!155100 () Bool)

(assert (=> b!226802 (=> (not res!190299) (not e!155100))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!226802 (= res!190299 (bvslt i!761 to!496))))

(declare-fun b!226803 () Bool)

(declare-fun res!190298 () Bool)

(assert (=> b!226803 (=> (not res!190298) (not e!155100))))

(declare-datatypes ((array!11361 0))(
  ( (array!11362 (arr!5952 (Array (_ BitVec 32) (_ BitVec 8))) (size!4983 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9062 0))(
  ( (BitStream!9063 (buf!5524 array!11361) (currentByte!10350 (_ BitVec 32)) (currentBit!10345 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9062)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!226803 (= res!190298 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4983 (buf!5524 thiss!1870))) ((_ sign_extend 32) (currentByte!10350 thiss!1870)) ((_ sign_extend 32) (currentBit!10345 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun lt!361581 () (_ BitVec 64))

(declare-fun b!226804 () Bool)

(declare-fun lt!361580 () (_ BitVec 32))

(declare-fun e!155101 () Bool)

(declare-datatypes ((Unit!16843 0))(
  ( (Unit!16844) )
))
(declare-datatypes ((tuple3!1348 0))(
  ( (tuple3!1349 (_1!10548 Unit!16843) (_2!10548 BitStream!9062) (_3!816 array!11361)) )
))
(declare-fun lt!361579 () tuple3!1348)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!226804 (= e!155101 (= (bvadd lt!361581 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!361580))) (bitIndex!0 (size!4983 (buf!5524 (_2!10548 lt!361579))) (currentByte!10350 (_2!10548 lt!361579)) (currentBit!10345 (_2!10548 lt!361579)))))))

(declare-fun b!226805 () Bool)

(declare-fun e!155103 () Bool)

(declare-fun array_inv!4724 (array!11361) Bool)

(assert (=> b!226805 (= e!155103 (array_inv!4724 (buf!5524 thiss!1870)))))

(declare-fun lt!361574 () (_ BitVec 64))

(declare-fun lt!361578 () (_ BitVec 64))

(declare-fun lt!361576 () (_ BitVec 64))

(declare-fun b!226806 () Bool)

(assert (=> b!226806 (= e!155100 (not (or (not (= lt!361578 (bvand lt!361574 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!361578 (bvand (bvadd lt!361576 lt!361574) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!226806 (= lt!361578 (bvand lt!361576 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!226806 (= lt!361574 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761))))))

(assert (=> b!226806 e!155101))

(declare-fun res!190300 () Bool)

(assert (=> b!226806 (=> (not res!190300) (not e!155101))))

(assert (=> b!226806 (= res!190300 (= lt!361581 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!361576)))))

(declare-datatypes ((tuple2!19464 0))(
  ( (tuple2!19465 (_1!10549 (_ BitVec 8)) (_2!10549 BitStream!9062)) )
))
(declare-fun lt!361575 () tuple2!19464)

(assert (=> b!226806 (= lt!361581 (bitIndex!0 (size!4983 (buf!5524 (_2!10549 lt!361575))) (currentByte!10350 (_2!10549 lt!361575)) (currentBit!10345 (_2!10549 lt!361575))))))

(assert (=> b!226806 (= lt!361576 (bitIndex!0 (size!4983 (buf!5524 thiss!1870)) (currentByte!10350 thiss!1870) (currentBit!10345 thiss!1870)))))

(declare-fun arr!308 () array!11361)

(declare-fun readByteArrayLoop!0 (BitStream!9062 array!11361 (_ BitVec 32) (_ BitVec 32)) tuple3!1348)

(assert (=> b!226806 (= lt!361579 (readByteArrayLoop!0 (_2!10549 lt!361575) (array!11362 (store (arr!5952 arr!308) i!761 (_1!10549 lt!361575)) (size!4983 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!226806 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4983 (buf!5524 (_2!10549 lt!361575)))) ((_ sign_extend 32) (currentByte!10350 (_2!10549 lt!361575))) ((_ sign_extend 32) (currentBit!10345 (_2!10549 lt!361575))) lt!361580)))

(assert (=> b!226806 (= lt!361580 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!361577 () Unit!16843)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9062 BitStream!9062 (_ BitVec 64) (_ BitVec 32)) Unit!16843)

(assert (=> b!226806 (= lt!361577 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10549 lt!361575) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!9062) tuple2!19464)

(assert (=> b!226806 (= lt!361575 (readByte!0 thiss!1870))))

(declare-fun res!190297 () Bool)

(assert (=> start!47616 (=> (not res!190297) (not e!155100))))

(assert (=> start!47616 (= res!190297 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4983 arr!308))))))

(assert (=> start!47616 e!155100))

(assert (=> start!47616 true))

(assert (=> start!47616 (array_inv!4724 arr!308)))

(declare-fun inv!12 (BitStream!9062) Bool)

(assert (=> start!47616 (and (inv!12 thiss!1870) e!155103)))

(assert (= (and start!47616 res!190297) b!226803))

(assert (= (and b!226803 res!190298) b!226802))

(assert (= (and b!226802 res!190299) b!226806))

(assert (= (and b!226806 res!190300) b!226804))

(assert (= start!47616 b!226805))

(declare-fun m!348499 () Bool)

(assert (=> b!226806 m!348499))

(declare-fun m!348501 () Bool)

(assert (=> b!226806 m!348501))

(declare-fun m!348503 () Bool)

(assert (=> b!226806 m!348503))

(declare-fun m!348505 () Bool)

(assert (=> b!226806 m!348505))

(declare-fun m!348507 () Bool)

(assert (=> b!226806 m!348507))

(declare-fun m!348509 () Bool)

(assert (=> b!226806 m!348509))

(declare-fun m!348511 () Bool)

(assert (=> b!226806 m!348511))

(declare-fun m!348513 () Bool)

(assert (=> b!226805 m!348513))

(declare-fun m!348515 () Bool)

(assert (=> b!226804 m!348515))

(declare-fun m!348517 () Bool)

(assert (=> start!47616 m!348517))

(declare-fun m!348519 () Bool)

(assert (=> start!47616 m!348519))

(declare-fun m!348521 () Bool)

(assert (=> b!226803 m!348521))

(push 1)

(assert (not b!226806))

(assert (not b!226804))

(assert (not b!226805))

(assert (not b!226803))

(assert (not start!47616))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!76983 () Bool)

(declare-fun e!155120 () Bool)

(assert (=> d!76983 e!155120))

(declare-fun res!190323 () Bool)

(assert (=> d!76983 (=> (not res!190323) (not e!155120))))

(declare-fun lt!361653 () (_ BitVec 64))

(declare-fun lt!361650 () (_ BitVec 64))

(declare-fun lt!361648 () (_ BitVec 64))

(assert (=> d!76983 (= res!190323 (= lt!361650 (bvsub lt!361653 lt!361648)))))

(assert (=> d!76983 (or (= (bvand lt!361653 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!361648 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!361653 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!361653 lt!361648) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!76983 (= lt!361648 (remainingBits!0 ((_ sign_extend 32) (size!4983 (buf!5524 (_2!10548 lt!361579)))) ((_ sign_extend 32) (currentByte!10350 (_2!10548 lt!361579))) ((_ sign_extend 32) (currentBit!10345 (_2!10548 lt!361579)))))))

(declare-fun lt!361651 () (_ BitVec 64))

(declare-fun lt!361649 () (_ BitVec 64))

(assert (=> d!76983 (= lt!361653 (bvmul lt!361651 lt!361649))))

(assert (=> d!76983 (or (= lt!361651 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!361649 (bvsdiv (bvmul lt!361651 lt!361649) lt!361651)))))

(assert (=> d!76983 (= lt!361649 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76983 (= lt!361651 ((_ sign_extend 32) (size!4983 (buf!5524 (_2!10548 lt!361579)))))))

(assert (=> d!76983 (= lt!361650 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10350 (_2!10548 lt!361579))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10345 (_2!10548 lt!361579)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!76983 (invariant!0 (currentBit!10345 (_2!10548 lt!361579)) (currentByte!10350 (_2!10548 lt!361579)) (size!4983 (buf!5524 (_2!10548 lt!361579))))))

(assert (=> d!76983 (= (bitIndex!0 (size!4983 (buf!5524 (_2!10548 lt!361579))) (currentByte!10350 (_2!10548 lt!361579)) (currentBit!10345 (_2!10548 lt!361579))) lt!361650)))

(declare-fun b!226828 () Bool)

(declare-fun res!190324 () Bool)

(assert (=> b!226828 (=> (not res!190324) (not e!155120))))

(assert (=> b!226828 (= res!190324 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!361650))))

(declare-fun b!226829 () Bool)

(declare-fun lt!361652 () (_ BitVec 64))

(assert (=> b!226829 (= e!155120 (bvsle lt!361650 (bvmul lt!361652 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!226829 (or (= lt!361652 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!361652 #b0000000000000000000000000000000000000000000000000000000000001000) lt!361652)))))

(assert (=> b!226829 (= lt!361652 ((_ sign_extend 32) (size!4983 (buf!5524 (_2!10548 lt!361579)))))))

(assert (= (and d!76983 res!190323) b!226828))

(assert (= (and b!226828 res!190324) b!226829))

(declare-fun m!348543 () Bool)

(assert (=> d!76983 m!348543))

(declare-fun m!348545 () Bool)

(assert (=> d!76983 m!348545))

(assert (=> b!226804 d!76983))

(declare-fun d!76985 () Bool)

(assert (=> d!76985 (= (array_inv!4724 arr!308) (bvsge (size!4983 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!47616 d!76985))

(declare-fun d!76987 () Bool)

(assert (=> d!76987 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10345 thiss!1870) (currentByte!10350 thiss!1870) (size!4983 (buf!5524 thiss!1870))))))

(declare-fun bs!18817 () Bool)

(assert (= bs!18817 d!76987))

(declare-fun m!348547 () Bool)

(assert (=> bs!18817 m!348547))

(assert (=> start!47616 d!76987))

(declare-fun d!76989 () Bool)

(declare-fun lt!361668 () (_ BitVec 8))

(declare-fun lt!361674 () (_ BitVec 8))

(assert (=> d!76989 (= lt!361668 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5952 (buf!5524 thiss!1870)) (currentByte!10350 thiss!1870))) ((_ sign_extend 24) lt!361674))))))

(assert (=> d!76989 (= lt!361674 ((_ extract 7 0) (currentBit!10345 thiss!1870)))))

(declare-fun e!155126 () Bool)

(assert (=> d!76989 e!155126))

(declare-fun res!190330 () Bool)

(assert (=> d!76989 (=> (not res!190330) (not e!155126))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!76989 (= res!190330 (validate_offset_bits!1 ((_ sign_extend 32) (size!4983 (buf!5524 thiss!1870))) ((_ sign_extend 32) (currentByte!10350 thiss!1870)) ((_ sign_extend 32) (currentBit!10345 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!19470 0))(
  ( (tuple2!19471 (_1!10552 Unit!16843) (_2!10552 (_ BitVec 8))) )
))
(declare-fun Unit!16856 () Unit!16843)

(declare-fun Unit!16857 () Unit!16843)

(assert (=> d!76989 (= (readByte!0 thiss!1870) (tuple2!19465 (_2!10552 (ite (bvsgt ((_ sign_extend 24) lt!361674) #b00000000000000000000000000000000) (tuple2!19471 Unit!16856 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!361668) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5952 (buf!5524 thiss!1870)) (bvadd (currentByte!10350 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!361674)))))))) (tuple2!19471 Unit!16857 lt!361668))) (BitStream!9063 (buf!5524 thiss!1870) (bvadd (currentByte!10350 thiss!1870) #b00000000000000000000000000000001) (currentBit!10345 thiss!1870))))))

(declare-fun b!226834 () Bool)

(declare-fun e!155125 () Bool)

(assert (=> b!226834 (= e!155126 e!155125)))

(declare-fun res!190331 () Bool)

(assert (=> b!226834 (=> (not res!190331) (not e!155125))))

(declare-fun lt!361671 () tuple2!19464)

(assert (=> b!226834 (= res!190331 (= (buf!5524 (_2!10549 lt!361671)) (buf!5524 thiss!1870)))))

(declare-fun lt!361672 () (_ BitVec 8))

(declare-fun lt!361673 () (_ BitVec 8))

(declare-fun Unit!16858 () Unit!16843)

(declare-fun Unit!16859 () Unit!16843)

(assert (=> b!226834 (= lt!361671 (tuple2!19465 (_2!10552 (ite (bvsgt ((_ sign_extend 24) lt!361673) #b00000000000000000000000000000000) (tuple2!19471 Unit!16858 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!361672) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5952 (buf!5524 thiss!1870)) (bvadd (currentByte!10350 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!361673)))))))) (tuple2!19471 Unit!16859 lt!361672))) (BitStream!9063 (buf!5524 thiss!1870) (bvadd (currentByte!10350 thiss!1870) #b00000000000000000000000000000001) (currentBit!10345 thiss!1870))))))

(assert (=> b!226834 (= lt!361672 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5952 (buf!5524 thiss!1870)) (currentByte!10350 thiss!1870))) ((_ sign_extend 24) lt!361673))))))

(assert (=> b!226834 (= lt!361673 ((_ extract 7 0) (currentBit!10345 thiss!1870)))))

(declare-fun lt!361669 () (_ BitVec 64))

(declare-fun b!226835 () Bool)

(declare-fun lt!361670 () (_ BitVec 64))

(assert (=> b!226835 (= e!155125 (= (bitIndex!0 (size!4983 (buf!5524 (_2!10549 lt!361671))) (currentByte!10350 (_2!10549 lt!361671)) (currentBit!10345 (_2!10549 lt!361671))) (bvadd lt!361669 lt!361670)))))

(assert (=> b!226835 (or (not (= (bvand lt!361669 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!361670 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!361669 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!361669 lt!361670) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!226835 (= lt!361670 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!226835 (= lt!361669 (bitIndex!0 (size!4983 (buf!5524 thiss!1870)) (currentByte!10350 thiss!1870) (currentBit!10345 thiss!1870)))))

(assert (= (and d!76989 res!190330) b!226834))

(assert (= (and b!226834 res!190331) b!226835))

(declare-fun m!348549 () Bool)

(assert (=> d!76989 m!348549))

(declare-fun m!348551 () Bool)

(assert (=> d!76989 m!348551))

(declare-fun m!348553 () Bool)

(assert (=> d!76989 m!348553))

(assert (=> b!226834 m!348553))

(assert (=> b!226834 m!348549))

(declare-fun m!348555 () Bool)

(assert (=> b!226835 m!348555))

(assert (=> b!226835 m!348507))

(assert (=> b!226806 d!76989))

(declare-fun d!76991 () Bool)

(assert (=> d!76991 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4983 (buf!5524 (_2!10549 lt!361575)))) ((_ sign_extend 32) (currentByte!10350 (_2!10549 lt!361575))) ((_ sign_extend 32) (currentBit!10345 (_2!10549 lt!361575))) lt!361580) (bvsle ((_ sign_extend 32) lt!361580) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4983 (buf!5524 (_2!10549 lt!361575)))) ((_ sign_extend 32) (currentByte!10350 (_2!10549 lt!361575))) ((_ sign_extend 32) (currentBit!10345 (_2!10549 lt!361575)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18818 () Bool)

(assert (= bs!18818 d!76991))

(declare-fun m!348557 () Bool)

(assert (=> bs!18818 m!348557))

(assert (=> b!226806 d!76991))

(declare-fun d!76993 () Bool)

(declare-fun e!155127 () Bool)

(assert (=> d!76993 e!155127))

(declare-fun res!190332 () Bool)

(assert (=> d!76993 (=> (not res!190332) (not e!155127))))

(declare-fun lt!361675 () (_ BitVec 64))

(declare-fun lt!361677 () (_ BitVec 64))

(declare-fun lt!361680 () (_ BitVec 64))

(assert (=> d!76993 (= res!190332 (= lt!361677 (bvsub lt!361680 lt!361675)))))

(assert (=> d!76993 (or (= (bvand lt!361680 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!361675 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!361680 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!361680 lt!361675) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!76993 (= lt!361675 (remainingBits!0 ((_ sign_extend 32) (size!4983 (buf!5524 thiss!1870))) ((_ sign_extend 32) (currentByte!10350 thiss!1870)) ((_ sign_extend 32) (currentBit!10345 thiss!1870))))))

(declare-fun lt!361678 () (_ BitVec 64))

(declare-fun lt!361676 () (_ BitVec 64))

(assert (=> d!76993 (= lt!361680 (bvmul lt!361678 lt!361676))))

(assert (=> d!76993 (or (= lt!361678 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!361676 (bvsdiv (bvmul lt!361678 lt!361676) lt!361678)))))

(assert (=> d!76993 (= lt!361676 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76993 (= lt!361678 ((_ sign_extend 32) (size!4983 (buf!5524 thiss!1870))))))

(assert (=> d!76993 (= lt!361677 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10350 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10345 thiss!1870))))))

(assert (=> d!76993 (invariant!0 (currentBit!10345 thiss!1870) (currentByte!10350 thiss!1870) (size!4983 (buf!5524 thiss!1870)))))

(assert (=> d!76993 (= (bitIndex!0 (size!4983 (buf!5524 thiss!1870)) (currentByte!10350 thiss!1870) (currentBit!10345 thiss!1870)) lt!361677)))

(declare-fun b!226836 () Bool)

(declare-fun res!190333 () Bool)

(assert (=> b!226836 (=> (not res!190333) (not e!155127))))

(assert (=> b!226836 (= res!190333 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!361677))))

(declare-fun b!226837 () Bool)

(declare-fun lt!361679 () (_ BitVec 64))

(assert (=> b!226837 (= e!155127 (bvsle lt!361677 (bvmul lt!361679 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!226837 (or (= lt!361679 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!361679 #b0000000000000000000000000000000000000000000000000000000000001000) lt!361679)))))

(assert (=> b!226837 (= lt!361679 ((_ sign_extend 32) (size!4983 (buf!5524 thiss!1870))))))

(assert (= (and d!76993 res!190332) b!226836))

(assert (= (and b!226836 res!190333) b!226837))

(declare-fun m!348559 () Bool)

(assert (=> d!76993 m!348559))

(assert (=> d!76993 m!348547))

(assert (=> b!226806 d!76993))

(declare-fun d!76995 () Bool)

(declare-fun e!155130 () Bool)

(assert (=> d!76995 e!155130))

(declare-fun res!190336 () Bool)

(assert (=> d!76995 (=> (not res!190336) (not e!155130))))

(assert (=> d!76995 (= res!190336 (and (or (let ((rhs!3922 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3922 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3922) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!76996 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!76996 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!76996 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3921 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3921 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3921) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!361688 () Unit!16843)

(declare-fun choose!57 (BitStream!9062 BitStream!9062 (_ BitVec 64) (_ BitVec 32)) Unit!16843)

(assert (=> d!76995 (= lt!361688 (choose!57 thiss!1870 (_2!10549 lt!361575) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> d!76995 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10549 lt!361575) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)) lt!361688)))

(declare-fun lt!361687 () (_ BitVec 32))

(declare-fun b!226840 () Bool)

(assert (=> b!226840 (= e!155130 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4983 (buf!5524 (_2!10549 lt!361575)))) ((_ sign_extend 32) (currentByte!10350 (_2!10549 lt!361575))) ((_ sign_extend 32) (currentBit!10345 (_2!10549 lt!361575))) (bvsub (bvsub to!496 i!761) lt!361687)))))

(assert (=> b!226840 (or (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand lt!361687 #b10000000000000000000000000000000)) (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!496 i!761) lt!361687) #b10000000000000000000000000000000)))))

(declare-fun lt!361689 () (_ BitVec 64))

(assert (=> b!226840 (= lt!361687 ((_ extract 31 0) lt!361689))))

(assert (=> b!226840 (and (bvslt lt!361689 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!361689 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!226840 (= lt!361689 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!76995 res!190336) b!226840))

(declare-fun m!348561 () Bool)

(assert (=> d!76995 m!348561))

(declare-fun m!348563 () Bool)

(assert (=> b!226840 m!348563))

(assert (=> b!226806 d!76995))

(declare-fun e!155161 () Bool)

(declare-fun b!226883 () Bool)

(declare-fun lt!361947 () tuple3!1348)

(declare-datatypes ((tuple2!19472 0))(
  ( (tuple2!19473 (_1!10553 BitStream!9062) (_2!10553 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!9062) tuple2!19472)

(assert (=> b!226883 (= e!155161 (= (select (arr!5952 (_3!816 lt!361947)) (bvadd #b00000000000000000000000000000001 i!761)) (_2!10553 (readBytePure!0 (_2!10549 lt!361575)))))))

(assert (=> b!226883 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4983 (_3!816 lt!361947))))))

(declare-fun e!155160 () Bool)

(declare-fun b!226884 () Bool)

(declare-fun arrayRangesEq!824 (array!11361 array!11361 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!226884 (= e!155160 (arrayRangesEq!824 (array!11362 (store (arr!5952 arr!308) i!761 (_1!10549 lt!361575)) (size!4983 arr!308)) (_3!816 lt!361947) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun c!11191 () Bool)

(declare-fun lt!361928 () array!11361)

(declare-fun lt!361959 () tuple3!1348)

(declare-fun bm!3787 () Bool)

(declare-fun lt!361930 () array!11361)

(declare-fun lt!361948 () (_ BitVec 32))

(declare-fun lt!361954 () (_ BitVec 32))

(declare-fun lt!361953 () (_ BitVec 32))

(declare-fun call!3790 () Bool)

(assert (=> bm!3787 (= call!3790 (arrayRangesEq!824 (ite c!11191 (array!11362 (store (arr!5952 arr!308) i!761 (_1!10549 lt!361575)) (size!4983 arr!308)) lt!361930) (ite c!11191 (_3!816 lt!361959) lt!361928) (ite c!11191 lt!361953 lt!361948) (ite c!11191 (bvadd #b00000000000000000000000000000001 i!761) lt!361954)))))

(declare-fun d!76998 () Bool)

(assert (=> d!76998 e!155161))

(declare-fun res!190370 () Bool)

(assert (=> d!76998 (=> res!190370 e!155161)))

(assert (=> d!76998 (= res!190370 (bvsge (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!361929 () Bool)

(assert (=> d!76998 (= lt!361929 e!155160)))

(declare-fun res!190372 () Bool)

(assert (=> d!76998 (=> (not res!190372) (not e!155160))))

(declare-fun lt!361943 () (_ BitVec 64))

(declare-fun lt!361944 () (_ BitVec 64))

(assert (=> d!76998 (= res!190372 (= (bvadd lt!361944 lt!361943) (bitIndex!0 (size!4983 (buf!5524 (_2!10548 lt!361947))) (currentByte!10350 (_2!10548 lt!361947)) (currentBit!10345 (_2!10548 lt!361947)))))))

(assert (=> d!76998 (or (not (= (bvand lt!361944 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!361943 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!361944 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!361944 lt!361943) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!361925 () (_ BitVec 64))

(assert (=> d!76998 (= lt!361943 (bvmul lt!361925 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!76998 (or (= lt!361925 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!361925 #b0000000000000000000000000000000000000000000000000000000000001000) lt!361925)))))

(assert (=> d!76998 (= lt!361925 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))))))

(assert (=> d!76998 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b10000000000000000000000000000000)))))

(assert (=> d!76998 (= lt!361944 (bitIndex!0 (size!4983 (buf!5524 (_2!10549 lt!361575))) (currentByte!10350 (_2!10549 lt!361575)) (currentBit!10345 (_2!10549 lt!361575))))))

(declare-fun e!155159 () tuple3!1348)

(assert (=> d!76998 (= lt!361947 e!155159)))

(assert (=> d!76998 (= c!11191 (bvslt (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> d!76998 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) to!496) (bvsle to!496 (size!4983 (array!11362 (store (arr!5952 arr!308) i!761 (_1!10549 lt!361575)) (size!4983 arr!308)))))))

(assert (=> d!76998 (= (readByteArrayLoop!0 (_2!10549 lt!361575) (array!11362 (store (arr!5952 arr!308) i!761 (_1!10549 lt!361575)) (size!4983 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496) lt!361947)))

(declare-fun call!3791 () (_ BitVec 64))

(declare-fun bm!3788 () Bool)

(assert (=> bm!3788 (= call!3791 (bitIndex!0 (ite c!11191 (size!4983 (buf!5524 (_2!10548 lt!361959))) (size!4983 (buf!5524 (_2!10549 lt!361575)))) (ite c!11191 (currentByte!10350 (_2!10548 lt!361959)) (currentByte!10350 (_2!10549 lt!361575))) (ite c!11191 (currentBit!10345 (_2!10548 lt!361959)) (currentBit!10345 (_2!10549 lt!361575)))))))

(declare-fun b!226885 () Bool)

(declare-fun lt!361938 () Unit!16843)

(assert (=> b!226885 (= e!155159 (tuple3!1349 lt!361938 (_2!10548 lt!361959) (_3!816 lt!361959)))))

(declare-fun lt!361942 () tuple2!19464)

(assert (=> b!226885 (= lt!361942 (readByte!0 (_2!10549 lt!361575)))))

(declare-fun lt!361940 () array!11361)

(assert (=> b!226885 (= lt!361940 (array!11362 (store (arr!5952 (array!11362 (store (arr!5952 arr!308) i!761 (_1!10549 lt!361575)) (size!4983 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10549 lt!361942)) (size!4983 (array!11362 (store (arr!5952 arr!308) i!761 (_1!10549 lt!361575)) (size!4983 arr!308)))))))

(declare-fun lt!361941 () (_ BitVec 64))

(assert (=> b!226885 (= lt!361941 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!361958 () (_ BitVec 32))

(assert (=> b!226885 (= lt!361958 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!361936 () Unit!16843)

(assert (=> b!226885 (= lt!361936 (validateOffsetBytesFromBitIndexLemma!0 (_2!10549 lt!361575) (_2!10549 lt!361942) lt!361941 lt!361958))))

(assert (=> b!226885 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4983 (buf!5524 (_2!10549 lt!361942)))) ((_ sign_extend 32) (currentByte!10350 (_2!10549 lt!361942))) ((_ sign_extend 32) (currentBit!10345 (_2!10549 lt!361942))) (bvsub lt!361958 ((_ extract 31 0) (bvsdiv (bvadd lt!361941 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!361955 () Unit!16843)

(assert (=> b!226885 (= lt!361955 lt!361936)))

(assert (=> b!226885 (= lt!361959 (readByteArrayLoop!0 (_2!10549 lt!361942) lt!361940 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(assert (=> b!226885 (= (bitIndex!0 (size!4983 (buf!5524 (_2!10549 lt!361942))) (currentByte!10350 (_2!10549 lt!361942)) (currentBit!10345 (_2!10549 lt!361942))) (bvadd (bitIndex!0 (size!4983 (buf!5524 (_2!10549 lt!361575))) (currentByte!10350 (_2!10549 lt!361575)) (currentBit!10345 (_2!10549 lt!361575))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!361935 () Unit!16843)

(declare-fun Unit!16862 () Unit!16843)

(assert (=> b!226885 (= lt!361935 Unit!16862)))

(assert (=> b!226885 (= (bvadd (bitIndex!0 (size!4983 (buf!5524 (_2!10549 lt!361942))) (currentByte!10350 (_2!10549 lt!361942)) (currentBit!10345 (_2!10549 lt!361942))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!3791)))

(declare-fun lt!361927 () Unit!16843)

(declare-fun Unit!16864 () Unit!16843)

(assert (=> b!226885 (= lt!361927 Unit!16864)))

(assert (=> b!226885 (= (bvadd (bitIndex!0 (size!4983 (buf!5524 (_2!10549 lt!361575))) (currentByte!10350 (_2!10549 lt!361575)) (currentBit!10345 (_2!10549 lt!361575))) (bvmul ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))) #b0000000000000000000000000000000000000000000000000000000000001000)) call!3791)))

(declare-fun lt!361949 () Unit!16843)

(declare-fun Unit!16866 () Unit!16843)

(assert (=> b!226885 (= lt!361949 Unit!16866)))

(assert (=> b!226885 (and (= (buf!5524 (_2!10549 lt!361575)) (buf!5524 (_2!10548 lt!361959))) (= (size!4983 (array!11362 (store (arr!5952 arr!308) i!761 (_1!10549 lt!361575)) (size!4983 arr!308))) (size!4983 (_3!816 lt!361959))))))

(declare-fun lt!361946 () Unit!16843)

(declare-fun Unit!16867 () Unit!16843)

(assert (=> b!226885 (= lt!361946 Unit!16867)))

(declare-fun lt!361952 () Unit!16843)

(declare-fun arrayUpdatedAtPrefixLemma!383 (array!11361 (_ BitVec 32) (_ BitVec 8)) Unit!16843)

(assert (=> b!226885 (= lt!361952 (arrayUpdatedAtPrefixLemma!383 (array!11362 (store (arr!5952 arr!308) i!761 (_1!10549 lt!361575)) (size!4983 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) (_1!10549 lt!361942)))))

(assert (=> b!226885 (arrayRangesEq!824 (array!11362 (store (arr!5952 arr!308) i!761 (_1!10549 lt!361575)) (size!4983 arr!308)) (array!11362 (store (arr!5952 (array!11362 (store (arr!5952 arr!308) i!761 (_1!10549 lt!361575)) (size!4983 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10549 lt!361942)) (size!4983 (array!11362 (store (arr!5952 arr!308) i!761 (_1!10549 lt!361575)) (size!4983 arr!308)))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun lt!361945 () Unit!16843)

(assert (=> b!226885 (= lt!361945 lt!361952)))

(assert (=> b!226885 (= lt!361953 #b00000000000000000000000000000000)))

(declare-fun lt!361956 () Unit!16843)

(declare-fun arrayRangesEqTransitive!262 (array!11361 array!11361 array!11361 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16843)

(assert (=> b!226885 (= lt!361956 (arrayRangesEqTransitive!262 (array!11362 (store (arr!5952 arr!308) i!761 (_1!10549 lt!361575)) (size!4983 arr!308)) lt!361940 (_3!816 lt!361959) lt!361953 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!226885 call!3790))

(declare-fun lt!361939 () Unit!16843)

(assert (=> b!226885 (= lt!361939 lt!361956)))

(declare-fun call!3792 () Bool)

(assert (=> b!226885 call!3792))

(declare-fun lt!361926 () Unit!16843)

(declare-fun Unit!16868 () Unit!16843)

(assert (=> b!226885 (= lt!361926 Unit!16868)))

(declare-fun lt!361937 () Unit!16843)

(declare-fun arrayRangesEqImpliesEq!113 (array!11361 array!11361 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16843)

(assert (=> b!226885 (= lt!361937 (arrayRangesEqImpliesEq!113 lt!361940 (_3!816 lt!361959) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!226885 (= (select (store (arr!5952 (array!11362 (store (arr!5952 arr!308) i!761 (_1!10549 lt!361575)) (size!4983 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10549 lt!361942)) (bvadd #b00000000000000000000000000000001 i!761)) (select (arr!5952 (_3!816 lt!361959)) (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!361934 () Unit!16843)

(assert (=> b!226885 (= lt!361934 lt!361937)))

(declare-fun lt!361950 () Bool)

(assert (=> b!226885 (= lt!361950 (= (select (arr!5952 (_3!816 lt!361959)) (bvadd #b00000000000000000000000000000001 i!761)) (_1!10549 lt!361942)))))

(declare-fun Unit!16869 () Unit!16843)

(assert (=> b!226885 (= lt!361938 Unit!16869)))

(assert (=> b!226885 lt!361950))

(declare-fun bm!3789 () Bool)

(assert (=> bm!3789 (= call!3792 (arrayRangesEq!824 (array!11362 (store (arr!5952 arr!308) i!761 (_1!10549 lt!361575)) (size!4983 arr!308)) (ite c!11191 (_3!816 lt!361959) (array!11362 (store (arr!5952 arr!308) i!761 (_1!10549 lt!361575)) (size!4983 arr!308))) #b00000000000000000000000000000000 (ite c!11191 (bvadd #b00000000000000000000000000000001 i!761) (size!4983 (array!11362 (store (arr!5952 arr!308) i!761 (_1!10549 lt!361575)) (size!4983 arr!308))))))))

(declare-fun b!226886 () Bool)

(declare-fun lt!361957 () Unit!16843)

(assert (=> b!226886 (= e!155159 (tuple3!1349 lt!361957 (_2!10549 lt!361575) (array!11362 (store (arr!5952 arr!308) i!761 (_1!10549 lt!361575)) (size!4983 arr!308))))))

(assert (=> b!226886 (= call!3791 call!3791)))

(declare-fun lt!361932 () Unit!16843)

(declare-fun Unit!16870 () Unit!16843)

(assert (=> b!226886 (= lt!361932 Unit!16870)))

(declare-fun lt!361931 () Unit!16843)

(declare-fun arrayRangesEqReflexiveLemma!128 (array!11361) Unit!16843)

(assert (=> b!226886 (= lt!361931 (arrayRangesEqReflexiveLemma!128 (array!11362 (store (arr!5952 arr!308) i!761 (_1!10549 lt!361575)) (size!4983 arr!308))))))

(assert (=> b!226886 call!3792))

(declare-fun lt!361924 () Unit!16843)

(assert (=> b!226886 (= lt!361924 lt!361931)))

(assert (=> b!226886 (= lt!361930 (array!11362 (store (arr!5952 arr!308) i!761 (_1!10549 lt!361575)) (size!4983 arr!308)))))

(assert (=> b!226886 (= lt!361928 (array!11362 (store (arr!5952 arr!308) i!761 (_1!10549 lt!361575)) (size!4983 arr!308)))))

(declare-fun lt!361933 () (_ BitVec 32))

(assert (=> b!226886 (= lt!361933 #b00000000000000000000000000000000)))

(declare-fun lt!361951 () (_ BitVec 32))

(assert (=> b!226886 (= lt!361951 (size!4983 (array!11362 (store (arr!5952 arr!308) i!761 (_1!10549 lt!361575)) (size!4983 arr!308))))))

(assert (=> b!226886 (= lt!361948 #b00000000000000000000000000000000)))

(assert (=> b!226886 (= lt!361954 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun arrayRangesEqSlicedLemma!113 (array!11361 array!11361 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16843)

(assert (=> b!226886 (= lt!361957 (arrayRangesEqSlicedLemma!113 lt!361930 lt!361928 lt!361933 lt!361951 lt!361948 lt!361954))))

(assert (=> b!226886 call!3790))

(declare-fun b!226887 () Bool)

(declare-fun res!190371 () Bool)

(assert (=> b!226887 (=> (not res!190371) (not e!155160))))

(assert (=> b!226887 (= res!190371 (and (= (buf!5524 (_2!10549 lt!361575)) (buf!5524 (_2!10548 lt!361947))) (= (size!4983 (array!11362 (store (arr!5952 arr!308) i!761 (_1!10549 lt!361575)) (size!4983 arr!308))) (size!4983 (_3!816 lt!361947)))))))

(assert (= (and d!76998 c!11191) b!226885))

(assert (= (and d!76998 (not c!11191)) b!226886))

(assert (= (or b!226885 b!226886) bm!3787))

(assert (= (or b!226885 b!226886) bm!3789))

(assert (= (or b!226885 b!226886) bm!3788))

(assert (= (and d!76998 res!190372) b!226887))

(assert (= (and b!226887 res!190371) b!226884))

(assert (= (and d!76998 (not res!190370)) b!226883))

(declare-fun m!348627 () Bool)

(assert (=> b!226883 m!348627))

(declare-fun m!348629 () Bool)

(assert (=> b!226883 m!348629))

(declare-fun m!348631 () Bool)

(assert (=> bm!3789 m!348631))

(declare-fun m!348633 () Bool)

(assert (=> bm!3788 m!348633))

(declare-fun m!348635 () Bool)

(assert (=> b!226886 m!348635))

(declare-fun m!348637 () Bool)

(assert (=> b!226886 m!348637))

(declare-fun m!348639 () Bool)

(assert (=> bm!3787 m!348639))

(declare-fun m!348641 () Bool)

(assert (=> b!226885 m!348641))

(declare-fun m!348643 () Bool)

(assert (=> b!226885 m!348643))

(declare-fun m!348645 () Bool)

(assert (=> b!226885 m!348645))

(declare-fun m!348647 () Bool)

(assert (=> b!226885 m!348647))

(declare-fun m!348649 () Bool)

(assert (=> b!226885 m!348649))

(declare-fun m!348651 () Bool)

(assert (=> b!226885 m!348651))

(assert (=> b!226885 m!348505))

(declare-fun m!348653 () Bool)

(assert (=> b!226885 m!348653))

(declare-fun m!348655 () Bool)

(assert (=> b!226885 m!348655))

(declare-fun m!348657 () Bool)

(assert (=> b!226885 m!348657))

(declare-fun m!348659 () Bool)

(assert (=> b!226885 m!348659))

(declare-fun m!348661 () Bool)

(assert (=> b!226885 m!348661))

(declare-fun m!348663 () Bool)

(assert (=> b!226885 m!348663))

(declare-fun m!348665 () Bool)

(assert (=> d!76998 m!348665))

(assert (=> d!76998 m!348505))

(declare-fun m!348667 () Bool)

(assert (=> b!226884 m!348667))

(assert (=> b!226806 d!76998))

(declare-fun d!77019 () Bool)

(declare-fun e!155162 () Bool)

(assert (=> d!77019 e!155162))

(declare-fun res!190373 () Bool)

(assert (=> d!77019 (=> (not res!190373) (not e!155162))))

(declare-fun lt!361962 () (_ BitVec 64))

(declare-fun lt!361965 () (_ BitVec 64))

(declare-fun lt!361960 () (_ BitVec 64))

(assert (=> d!77019 (= res!190373 (= lt!361962 (bvsub lt!361965 lt!361960)))))

(assert (=> d!77019 (or (= (bvand lt!361965 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!361960 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!361965 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!361965 lt!361960) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77019 (= lt!361960 (remainingBits!0 ((_ sign_extend 32) (size!4983 (buf!5524 (_2!10549 lt!361575)))) ((_ sign_extend 32) (currentByte!10350 (_2!10549 lt!361575))) ((_ sign_extend 32) (currentBit!10345 (_2!10549 lt!361575)))))))

(declare-fun lt!361963 () (_ BitVec 64))

(declare-fun lt!361961 () (_ BitVec 64))

(assert (=> d!77019 (= lt!361965 (bvmul lt!361963 lt!361961))))

(assert (=> d!77019 (or (= lt!361963 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!361961 (bvsdiv (bvmul lt!361963 lt!361961) lt!361963)))))

(assert (=> d!77019 (= lt!361961 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77019 (= lt!361963 ((_ sign_extend 32) (size!4983 (buf!5524 (_2!10549 lt!361575)))))))

(assert (=> d!77019 (= lt!361962 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10350 (_2!10549 lt!361575))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10345 (_2!10549 lt!361575)))))))

(assert (=> d!77019 (invariant!0 (currentBit!10345 (_2!10549 lt!361575)) (currentByte!10350 (_2!10549 lt!361575)) (size!4983 (buf!5524 (_2!10549 lt!361575))))))

(assert (=> d!77019 (= (bitIndex!0 (size!4983 (buf!5524 (_2!10549 lt!361575))) (currentByte!10350 (_2!10549 lt!361575)) (currentBit!10345 (_2!10549 lt!361575))) lt!361962)))

(declare-fun b!226888 () Bool)

(declare-fun res!190374 () Bool)

(assert (=> b!226888 (=> (not res!190374) (not e!155162))))

(assert (=> b!226888 (= res!190374 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!361962))))

(declare-fun b!226889 () Bool)

(declare-fun lt!361964 () (_ BitVec 64))

(assert (=> b!226889 (= e!155162 (bvsle lt!361962 (bvmul lt!361964 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!226889 (or (= lt!361964 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!361964 #b0000000000000000000000000000000000000000000000000000000000001000) lt!361964)))))

(assert (=> b!226889 (= lt!361964 ((_ sign_extend 32) (size!4983 (buf!5524 (_2!10549 lt!361575)))))))

(assert (= (and d!77019 res!190373) b!226888))

(assert (= (and b!226888 res!190374) b!226889))

(assert (=> d!77019 m!348557))

(declare-fun m!348669 () Bool)

(assert (=> d!77019 m!348669))

(assert (=> b!226806 d!77019))

(declare-fun d!77021 () Bool)

(assert (=> d!77021 (= (array_inv!4724 (buf!5524 thiss!1870)) (bvsge (size!4983 (buf!5524 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!226805 d!77021))

(declare-fun d!77023 () Bool)

(assert (=> d!77023 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4983 (buf!5524 thiss!1870))) ((_ sign_extend 32) (currentByte!10350 thiss!1870)) ((_ sign_extend 32) (currentBit!10345 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4983 (buf!5524 thiss!1870))) ((_ sign_extend 32) (currentByte!10350 thiss!1870)) ((_ sign_extend 32) (currentBit!10345 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18821 () Bool)

(assert (= bs!18821 d!77023))

(assert (=> bs!18821 m!348559))

(assert (=> b!226803 d!77023))

(push 1)

(assert (not bm!3787))

(assert (not bm!3789))

(assert (not d!76991))

(assert (not b!226885))

(assert (not b!226884))

(assert (not b!226840))

(assert (not d!76998))

(assert (not d!76987))

(assert (not d!77019))

(assert (not d!77023))

(assert (not b!226886))

(assert (not b!226835))

(assert (not bm!3788))

(assert (not d!76995))

(assert (not d!76993))

(assert (not d!76983))

(assert (not b!226883))

(assert (not d!76989))

(check-sat)

(pop 1)

(push 1)

(check-sat)

