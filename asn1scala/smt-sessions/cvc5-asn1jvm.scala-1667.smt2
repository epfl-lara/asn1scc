; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46378 () Bool)

(assert start!46378)

(declare-fun b!223145 () Bool)

(declare-fun e!151842 () Bool)

(declare-datatypes ((array!10953 0))(
  ( (array!10954 (arr!5740 (Array (_ BitVec 32) (_ BitVec 8))) (size!4807 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8716 0))(
  ( (BitStream!8717 (buf!5351 array!10953) (currentByte!10033 (_ BitVec 32)) (currentBit!10028 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8716)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!223145 (= e!151842 (not (invariant!0 (currentBit!10028 thiss!1870) (currentByte!10033 thiss!1870) (size!4807 (buf!5351 thiss!1870)))))))

(declare-fun arr!308 () array!10953)

(declare-datatypes ((Unit!16106 0))(
  ( (Unit!16107) )
))
(declare-datatypes ((tuple3!1140 0))(
  ( (tuple3!1141 (_1!10235 Unit!16106) (_2!10235 BitStream!8716) (_3!712 array!10953)) )
))
(declare-fun lt!352168 () tuple3!1140)

(declare-datatypes ((tuple2!19046 0))(
  ( (tuple2!19047 (_1!10236 (_ BitVec 8)) (_2!10236 BitStream!8716)) )
))
(declare-fun lt!352167 () tuple2!19046)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun readByteArrayLoop!0 (BitStream!8716 array!10953 (_ BitVec 32) (_ BitVec 32)) tuple3!1140)

(assert (=> b!223145 (= lt!352168 (readByteArrayLoop!0 (_2!10236 lt!352167) (array!10954 (store (arr!5740 arr!308) i!761 (_1!10236 lt!352167)) (size!4807 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!223145 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4807 (buf!5351 (_2!10236 lt!352167)))) ((_ sign_extend 32) (currentByte!10033 (_2!10236 lt!352167))) ((_ sign_extend 32) (currentBit!10028 (_2!10236 lt!352167))) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!352166 () Unit!16106)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8716 BitStream!8716 (_ BitVec 64) (_ BitVec 32)) Unit!16106)

(assert (=> b!223145 (= lt!352166 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10236 lt!352167) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!8716) tuple2!19046)

(assert (=> b!223145 (= lt!352167 (readByte!0 thiss!1870))))

(declare-fun b!223146 () Bool)

(declare-fun e!151841 () Bool)

(declare-fun array_inv!4548 (array!10953) Bool)

(assert (=> b!223146 (= e!151841 (array_inv!4548 (buf!5351 thiss!1870)))))

(declare-fun b!223143 () Bool)

(declare-fun res!187334 () Bool)

(assert (=> b!223143 (=> (not res!187334) (not e!151842))))

(assert (=> b!223143 (= res!187334 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4807 (buf!5351 thiss!1870))) ((_ sign_extend 32) (currentByte!10033 thiss!1870)) ((_ sign_extend 32) (currentBit!10028 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!223144 () Bool)

(declare-fun res!187332 () Bool)

(assert (=> b!223144 (=> (not res!187332) (not e!151842))))

(assert (=> b!223144 (= res!187332 (bvslt i!761 to!496))))

(declare-fun res!187333 () Bool)

(assert (=> start!46378 (=> (not res!187333) (not e!151842))))

(assert (=> start!46378 (= res!187333 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4807 arr!308))))))

(assert (=> start!46378 e!151842))

(assert (=> start!46378 true))

(assert (=> start!46378 (array_inv!4548 arr!308)))

(declare-fun inv!12 (BitStream!8716) Bool)

(assert (=> start!46378 (and (inv!12 thiss!1870) e!151841)))

(assert (= (and start!46378 res!187333) b!223143))

(assert (= (and b!223143 res!187334) b!223144))

(assert (= (and b!223144 res!187332) b!223145))

(assert (= start!46378 b!223146))

(declare-fun m!341693 () Bool)

(assert (=> b!223145 m!341693))

(declare-fun m!341695 () Bool)

(assert (=> b!223145 m!341695))

(declare-fun m!341697 () Bool)

(assert (=> b!223145 m!341697))

(declare-fun m!341699 () Bool)

(assert (=> b!223145 m!341699))

(declare-fun m!341701 () Bool)

(assert (=> b!223145 m!341701))

(declare-fun m!341703 () Bool)

(assert (=> b!223145 m!341703))

(declare-fun m!341705 () Bool)

(assert (=> b!223146 m!341705))

(declare-fun m!341707 () Bool)

(assert (=> b!223143 m!341707))

(declare-fun m!341709 () Bool)

(assert (=> start!46378 m!341709))

(declare-fun m!341711 () Bool)

(assert (=> start!46378 m!341711))

(push 1)

(assert (not b!223143))

(assert (not b!223146))

(assert (not start!46378))

(assert (not b!223145))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!75548 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!75548 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4807 (buf!5351 thiss!1870))) ((_ sign_extend 32) (currentByte!10033 thiss!1870)) ((_ sign_extend 32) (currentBit!10028 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4807 (buf!5351 thiss!1870))) ((_ sign_extend 32) (currentByte!10033 thiss!1870)) ((_ sign_extend 32) (currentBit!10028 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18439 () Bool)

(assert (= bs!18439 d!75548))

(declare-fun m!341753 () Bool)

(assert (=> bs!18439 m!341753))

(assert (=> b!223143 d!75548))

(declare-fun d!75550 () Bool)

(assert (=> d!75550 (= (array_inv!4548 (buf!5351 thiss!1870)) (bvsge (size!4807 (buf!5351 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!223146 d!75550))

(declare-fun d!75552 () Bool)

(assert (=> d!75552 (= (array_inv!4548 arr!308) (bvsge (size!4807 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!46378 d!75552))

(declare-fun d!75554 () Bool)

(assert (=> d!75554 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10028 thiss!1870) (currentByte!10033 thiss!1870) (size!4807 (buf!5351 thiss!1870))))))

(declare-fun bs!18440 () Bool)

(assert (= bs!18440 d!75554))

(assert (=> bs!18440 m!341699))

(assert (=> start!46378 d!75554))

(declare-fun d!75556 () Bool)

(assert (=> d!75556 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4807 (buf!5351 (_2!10236 lt!352167)))) ((_ sign_extend 32) (currentByte!10033 (_2!10236 lt!352167))) ((_ sign_extend 32) (currentBit!10028 (_2!10236 lt!352167))) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4807 (buf!5351 (_2!10236 lt!352167)))) ((_ sign_extend 32) (currentByte!10033 (_2!10236 lt!352167))) ((_ sign_extend 32) (currentBit!10028 (_2!10236 lt!352167)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18441 () Bool)

(assert (= bs!18441 d!75556))

(declare-fun m!341755 () Bool)

(assert (=> bs!18441 m!341755))

(assert (=> b!223145 d!75556))

(declare-fun d!75558 () Bool)

(declare-fun lt!352207 () (_ BitVec 8))

(declare-fun lt!352201 () (_ BitVec 8))

(assert (=> d!75558 (= lt!352207 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5740 (buf!5351 thiss!1870)) (currentByte!10033 thiss!1870))) ((_ sign_extend 24) lt!352201))))))

(assert (=> d!75558 (= lt!352201 ((_ extract 7 0) (currentBit!10028 thiss!1870)))))

(declare-fun e!151872 () Bool)

(assert (=> d!75558 e!151872))

(declare-fun res!187359 () Bool)

(assert (=> d!75558 (=> (not res!187359) (not e!151872))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!75558 (= res!187359 (validate_offset_bits!1 ((_ sign_extend 32) (size!4807 (buf!5351 thiss!1870))) ((_ sign_extend 32) (currentByte!10033 thiss!1870)) ((_ sign_extend 32) (currentBit!10028 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!19052 0))(
  ( (tuple2!19053 (_1!10241 Unit!16106) (_2!10241 (_ BitVec 8))) )
))
(declare-fun Unit!16112 () Unit!16106)

(declare-fun Unit!16113 () Unit!16106)

(assert (=> d!75558 (= (readByte!0 thiss!1870) (tuple2!19047 (_2!10241 (ite (bvsgt ((_ sign_extend 24) lt!352201) #b00000000000000000000000000000000) (tuple2!19053 Unit!16112 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!352207) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5740 (buf!5351 thiss!1870)) (bvadd (currentByte!10033 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!352201)))))))) (tuple2!19053 Unit!16113 lt!352207))) (BitStream!8717 (buf!5351 thiss!1870) (bvadd (currentByte!10033 thiss!1870) #b00000000000000000000000000000001) (currentBit!10028 thiss!1870))))))

(declare-fun b!223175 () Bool)

(declare-fun e!151871 () Bool)

(assert (=> b!223175 (= e!151872 e!151871)))

(declare-fun res!187358 () Bool)

(assert (=> b!223175 (=> (not res!187358) (not e!151871))))

(declare-fun lt!352206 () tuple2!19046)

(assert (=> b!223175 (= res!187358 (= (buf!5351 (_2!10236 lt!352206)) (buf!5351 thiss!1870)))))

(declare-fun lt!352205 () (_ BitVec 8))

(declare-fun lt!352203 () (_ BitVec 8))

(declare-fun Unit!16114 () Unit!16106)

(declare-fun Unit!16115 () Unit!16106)

(assert (=> b!223175 (= lt!352206 (tuple2!19047 (_2!10241 (ite (bvsgt ((_ sign_extend 24) lt!352203) #b00000000000000000000000000000000) (tuple2!19053 Unit!16114 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!352205) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5740 (buf!5351 thiss!1870)) (bvadd (currentByte!10033 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!352203)))))))) (tuple2!19053 Unit!16115 lt!352205))) (BitStream!8717 (buf!5351 thiss!1870) (bvadd (currentByte!10033 thiss!1870) #b00000000000000000000000000000001) (currentBit!10028 thiss!1870))))))

(assert (=> b!223175 (= lt!352205 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5740 (buf!5351 thiss!1870)) (currentByte!10033 thiss!1870))) ((_ sign_extend 24) lt!352203))))))

(assert (=> b!223175 (= lt!352203 ((_ extract 7 0) (currentBit!10028 thiss!1870)))))

(declare-fun b!223176 () Bool)

(declare-fun lt!352202 () (_ BitVec 64))

(declare-fun lt!352204 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!223176 (= e!151871 (= (bitIndex!0 (size!4807 (buf!5351 (_2!10236 lt!352206))) (currentByte!10033 (_2!10236 lt!352206)) (currentBit!10028 (_2!10236 lt!352206))) (bvadd lt!352204 lt!352202)))))

(assert (=> b!223176 (or (not (= (bvand lt!352204 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!352202 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!352204 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!352204 lt!352202) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!223176 (= lt!352202 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!223176 (= lt!352204 (bitIndex!0 (size!4807 (buf!5351 thiss!1870)) (currentByte!10033 thiss!1870) (currentBit!10028 thiss!1870)))))

(assert (= (and d!75558 res!187359) b!223175))

(assert (= (and b!223175 res!187358) b!223176))

(declare-fun m!341761 () Bool)

(assert (=> d!75558 m!341761))

(declare-fun m!341763 () Bool)

(assert (=> d!75558 m!341763))

(declare-fun m!341765 () Bool)

(assert (=> d!75558 m!341765))

(assert (=> b!223175 m!341765))

(assert (=> b!223175 m!341761))

(declare-fun m!341767 () Bool)

(assert (=> b!223176 m!341767))

(declare-fun m!341769 () Bool)

(assert (=> b!223176 m!341769))

(assert (=> b!223145 d!75558))

(declare-fun b!223208 () Bool)

(declare-fun res!187383 () Bool)

(declare-fun e!151895 () Bool)

(assert (=> b!223208 (=> (not res!187383) (not e!151895))))

(declare-fun lt!352434 () tuple3!1140)

(assert (=> b!223208 (= res!187383 (and (= (buf!5351 (_2!10236 lt!352167)) (buf!5351 (_2!10235 lt!352434))) (= (size!4807 (array!10954 (store (arr!5740 arr!308) i!761 (_1!10236 lt!352167)) (size!4807 arr!308))) (size!4807 (_3!712 lt!352434)))))))

(declare-fun b!223209 () Bool)

(declare-fun e!151894 () Bool)

(declare-datatypes ((tuple2!19054 0))(
  ( (tuple2!19055 (_1!10242 BitStream!8716) (_2!10242 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!8716) tuple2!19054)

(assert (=> b!223209 (= e!151894 (= (select (arr!5740 (_3!712 lt!352434)) (bvadd #b00000000000000000000000000000001 i!761)) (_2!10242 (readBytePure!0 (_2!10236 lt!352167)))))))

(assert (=> b!223209 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4807 (_3!712 lt!352434))))))

(declare-fun d!75570 () Bool)

(assert (=> d!75570 e!151894))

(declare-fun res!187382 () Bool)

(assert (=> d!75570 (=> res!187382 e!151894)))

(assert (=> d!75570 (= res!187382 (bvsge (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!352442 () Bool)

(assert (=> d!75570 (= lt!352442 e!151895)))

(declare-fun res!187384 () Bool)

(assert (=> d!75570 (=> (not res!187384) (not e!151895))))

(declare-fun lt!352425 () (_ BitVec 64))

(declare-fun lt!352439 () (_ BitVec 64))

(assert (=> d!75570 (= res!187384 (= (bvadd lt!352425 lt!352439) (bitIndex!0 (size!4807 (buf!5351 (_2!10235 lt!352434))) (currentByte!10033 (_2!10235 lt!352434)) (currentBit!10028 (_2!10235 lt!352434)))))))

(assert (=> d!75570 (or (not (= (bvand lt!352425 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!352439 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!352425 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!352425 lt!352439) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!352419 () (_ BitVec 64))

(assert (=> d!75570 (= lt!352439 (bvmul lt!352419 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!75570 (or (= lt!352419 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!352419 #b0000000000000000000000000000000000000000000000000000000000001000) lt!352419)))))

(assert (=> d!75570 (= lt!352419 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))))))

(assert (=> d!75570 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b10000000000000000000000000000000)))))

(assert (=> d!75570 (= lt!352425 (bitIndex!0 (size!4807 (buf!5351 (_2!10236 lt!352167))) (currentByte!10033 (_2!10236 lt!352167)) (currentBit!10028 (_2!10236 lt!352167))))))

(declare-fun e!151896 () tuple3!1140)

(assert (=> d!75570 (= lt!352434 e!151896)))

(declare-fun c!11081 () Bool)

(assert (=> d!75570 (= c!11081 (bvslt (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> d!75570 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) to!496) (bvsle to!496 (size!4807 (array!10954 (store (arr!5740 arr!308) i!761 (_1!10236 lt!352167)) (size!4807 arr!308)))))))

(assert (=> d!75570 (= (readByteArrayLoop!0 (_2!10236 lt!352167) (array!10954 (store (arr!5740 arr!308) i!761 (_1!10236 lt!352167)) (size!4807 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496) lt!352434)))

(declare-fun b!223210 () Bool)

(declare-fun arrayRangesEq!707 (array!10953 array!10953 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!223210 (= e!151895 (arrayRangesEq!707 (array!10954 (store (arr!5740 arr!308) i!761 (_1!10236 lt!352167)) (size!4807 arr!308)) (_3!712 lt!352434) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun bm!3457 () Bool)

(declare-fun call!3461 () Bool)

(declare-fun lt!352409 () tuple2!19046)

(assert (=> bm!3457 (= call!3461 (arrayRangesEq!707 (array!10954 (store (arr!5740 arr!308) i!761 (_1!10236 lt!352167)) (size!4807 arr!308)) (ite c!11081 (array!10954 (store (arr!5740 (array!10954 (store (arr!5740 arr!308) i!761 (_1!10236 lt!352167)) (size!4807 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10236 lt!352409)) (size!4807 (array!10954 (store (arr!5740 arr!308) i!761 (_1!10236 lt!352167)) (size!4807 arr!308)))) (array!10954 (store (arr!5740 arr!308) i!761 (_1!10236 lt!352167)) (size!4807 arr!308))) #b00000000000000000000000000000000 (ite c!11081 (bvadd #b00000000000000000000000000000001 i!761) (size!4807 (array!10954 (store (arr!5740 arr!308) i!761 (_1!10236 lt!352167)) (size!4807 arr!308))))))))

(declare-fun b!223211 () Bool)

(declare-fun lt!352426 () Unit!16106)

(declare-fun lt!352433 () tuple3!1140)

(assert (=> b!223211 (= e!151896 (tuple3!1141 lt!352426 (_2!10235 lt!352433) (_3!712 lt!352433)))))

(assert (=> b!223211 (= lt!352409 (readByte!0 (_2!10236 lt!352167)))))

(declare-fun lt!352415 () array!10953)

(assert (=> b!223211 (= lt!352415 (array!10954 (store (arr!5740 (array!10954 (store (arr!5740 arr!308) i!761 (_1!10236 lt!352167)) (size!4807 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10236 lt!352409)) (size!4807 (array!10954 (store (arr!5740 arr!308) i!761 (_1!10236 lt!352167)) (size!4807 arr!308)))))))

(declare-fun lt!352443 () (_ BitVec 64))

(assert (=> b!223211 (= lt!352443 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!352414 () (_ BitVec 32))

(assert (=> b!223211 (= lt!352414 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!352424 () Unit!16106)

(assert (=> b!223211 (= lt!352424 (validateOffsetBytesFromBitIndexLemma!0 (_2!10236 lt!352167) (_2!10236 lt!352409) lt!352443 lt!352414))))

(assert (=> b!223211 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4807 (buf!5351 (_2!10236 lt!352409)))) ((_ sign_extend 32) (currentByte!10033 (_2!10236 lt!352409))) ((_ sign_extend 32) (currentBit!10028 (_2!10236 lt!352409))) (bvsub lt!352414 ((_ extract 31 0) (bvsdiv (bvadd lt!352443 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!352440 () Unit!16106)

(assert (=> b!223211 (= lt!352440 lt!352424)))

(assert (=> b!223211 (= lt!352433 (readByteArrayLoop!0 (_2!10236 lt!352409) lt!352415 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(declare-fun call!3462 () (_ BitVec 64))

(assert (=> b!223211 (= (bitIndex!0 (size!4807 (buf!5351 (_2!10236 lt!352409))) (currentByte!10033 (_2!10236 lt!352409)) (currentBit!10028 (_2!10236 lt!352409))) (bvadd call!3462 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!352418 () Unit!16106)

(declare-fun Unit!16116 () Unit!16106)

(assert (=> b!223211 (= lt!352418 Unit!16116)))

(assert (=> b!223211 (= (bvadd (bitIndex!0 (size!4807 (buf!5351 (_2!10236 lt!352409))) (currentByte!10033 (_2!10236 lt!352409)) (currentBit!10028 (_2!10236 lt!352409))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4807 (buf!5351 (_2!10235 lt!352433))) (currentByte!10033 (_2!10235 lt!352433)) (currentBit!10028 (_2!10235 lt!352433))))))

(declare-fun lt!352437 () Unit!16106)

(declare-fun Unit!16117 () Unit!16106)

(assert (=> b!223211 (= lt!352437 Unit!16117)))

(assert (=> b!223211 (= (bvadd call!3462 (bvmul ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4807 (buf!5351 (_2!10235 lt!352433))) (currentByte!10033 (_2!10235 lt!352433)) (currentBit!10028 (_2!10235 lt!352433))))))

(declare-fun lt!352427 () Unit!16106)

(declare-fun Unit!16118 () Unit!16106)

(assert (=> b!223211 (= lt!352427 Unit!16118)))

(assert (=> b!223211 (and (= (buf!5351 (_2!10236 lt!352167)) (buf!5351 (_2!10235 lt!352433))) (= (size!4807 (array!10954 (store (arr!5740 arr!308) i!761 (_1!10236 lt!352167)) (size!4807 arr!308))) (size!4807 (_3!712 lt!352433))))))

(declare-fun lt!352429 () Unit!16106)

(declare-fun Unit!16119 () Unit!16106)

(assert (=> b!223211 (= lt!352429 Unit!16119)))

(declare-fun lt!352417 () Unit!16106)

(declare-fun arrayUpdatedAtPrefixLemma!299 (array!10953 (_ BitVec 32) (_ BitVec 8)) Unit!16106)

(assert (=> b!223211 (= lt!352417 (arrayUpdatedAtPrefixLemma!299 (array!10954 (store (arr!5740 arr!308) i!761 (_1!10236 lt!352167)) (size!4807 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) (_1!10236 lt!352409)))))

(assert (=> b!223211 call!3461))

(declare-fun lt!352441 () Unit!16106)

(assert (=> b!223211 (= lt!352441 lt!352417)))

(declare-fun lt!352428 () (_ BitVec 32))

(assert (=> b!223211 (= lt!352428 #b00000000000000000000000000000000)))

(declare-fun lt!352435 () Unit!16106)

(declare-fun arrayRangesEqTransitive!193 (array!10953 array!10953 array!10953 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16106)

(assert (=> b!223211 (= lt!352435 (arrayRangesEqTransitive!193 (array!10954 (store (arr!5740 arr!308) i!761 (_1!10236 lt!352167)) (size!4807 arr!308)) lt!352415 (_3!712 lt!352433) lt!352428 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(declare-fun call!3460 () Bool)

(assert (=> b!223211 call!3460))

(declare-fun lt!352410 () Unit!16106)

(assert (=> b!223211 (= lt!352410 lt!352435)))

(assert (=> b!223211 (arrayRangesEq!707 (array!10954 (store (arr!5740 arr!308) i!761 (_1!10236 lt!352167)) (size!4807 arr!308)) (_3!712 lt!352433) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun lt!352430 () Unit!16106)

(declare-fun Unit!16120 () Unit!16106)

(assert (=> b!223211 (= lt!352430 Unit!16120)))

(declare-fun lt!352422 () Unit!16106)

(declare-fun arrayRangesEqImpliesEq!68 (array!10953 array!10953 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16106)

(assert (=> b!223211 (= lt!352422 (arrayRangesEqImpliesEq!68 lt!352415 (_3!712 lt!352433) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!223211 (= (select (store (arr!5740 (array!10954 (store (arr!5740 arr!308) i!761 (_1!10236 lt!352167)) (size!4807 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10236 lt!352409)) (bvadd #b00000000000000000000000000000001 i!761)) (select (arr!5740 (_3!712 lt!352433)) (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!352436 () Unit!16106)

(assert (=> b!223211 (= lt!352436 lt!352422)))

(declare-fun lt!352432 () Bool)

(assert (=> b!223211 (= lt!352432 (= (select (arr!5740 (_3!712 lt!352433)) (bvadd #b00000000000000000000000000000001 i!761)) (_1!10236 lt!352409)))))

(declare-fun Unit!16121 () Unit!16106)

(assert (=> b!223211 (= lt!352426 Unit!16121)))

(assert (=> b!223211 lt!352432))

(declare-fun bm!3458 () Bool)

(declare-fun lt!352412 () (_ BitVec 32))

(declare-fun lt!352420 () array!10953)

(declare-fun lt!352411 () (_ BitVec 32))

(declare-fun lt!352416 () array!10953)

(assert (=> bm!3458 (= call!3460 (arrayRangesEq!707 (ite c!11081 (array!10954 (store (arr!5740 arr!308) i!761 (_1!10236 lt!352167)) (size!4807 arr!308)) lt!352416) (ite c!11081 (_3!712 lt!352433) lt!352420) (ite c!11081 lt!352428 lt!352411) (ite c!11081 (bvadd #b00000000000000000000000000000001 i!761) lt!352412)))))

(declare-fun bm!3459 () Bool)

(assert (=> bm!3459 (= call!3462 (bitIndex!0 (size!4807 (buf!5351 (_2!10236 lt!352167))) (currentByte!10033 (_2!10236 lt!352167)) (currentBit!10028 (_2!10236 lt!352167))))))

(declare-fun b!223212 () Bool)

(declare-fun lt!352423 () Unit!16106)

(assert (=> b!223212 (= e!151896 (tuple3!1141 lt!352423 (_2!10236 lt!352167) (array!10954 (store (arr!5740 arr!308) i!761 (_1!10236 lt!352167)) (size!4807 arr!308))))))

(assert (=> b!223212 (= call!3462 call!3462)))

(declare-fun lt!352444 () Unit!16106)

(declare-fun Unit!16123 () Unit!16106)

(assert (=> b!223212 (= lt!352444 Unit!16123)))

(declare-fun lt!352438 () Unit!16106)

(declare-fun arrayRangesEqReflexiveLemma!60 (array!10953) Unit!16106)

(assert (=> b!223212 (= lt!352438 (arrayRangesEqReflexiveLemma!60 (array!10954 (store (arr!5740 arr!308) i!761 (_1!10236 lt!352167)) (size!4807 arr!308))))))

(assert (=> b!223212 call!3461))

(declare-fun lt!352431 () Unit!16106)

(assert (=> b!223212 (= lt!352431 lt!352438)))

(assert (=> b!223212 (= lt!352416 (array!10954 (store (arr!5740 arr!308) i!761 (_1!10236 lt!352167)) (size!4807 arr!308)))))

(assert (=> b!223212 (= lt!352420 (array!10954 (store (arr!5740 arr!308) i!761 (_1!10236 lt!352167)) (size!4807 arr!308)))))

(declare-fun lt!352413 () (_ BitVec 32))

(assert (=> b!223212 (= lt!352413 #b00000000000000000000000000000000)))

(declare-fun lt!352421 () (_ BitVec 32))

(assert (=> b!223212 (= lt!352421 (size!4807 (array!10954 (store (arr!5740 arr!308) i!761 (_1!10236 lt!352167)) (size!4807 arr!308))))))

(assert (=> b!223212 (= lt!352411 #b00000000000000000000000000000000)))

(assert (=> b!223212 (= lt!352412 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun arrayRangesEqSlicedLemma!59 (array!10953 array!10953 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16106)

(assert (=> b!223212 (= lt!352423 (arrayRangesEqSlicedLemma!59 lt!352416 lt!352420 lt!352413 lt!352421 lt!352411 lt!352412))))

(assert (=> b!223212 call!3460))

(assert (= (and d!75570 c!11081) b!223211))

(assert (= (and d!75570 (not c!11081)) b!223212))

(assert (= (or b!223211 b!223212) bm!3458))

(assert (= (or b!223211 b!223212) bm!3457))

(assert (= (or b!223211 b!223212) bm!3459))

(assert (= (and d!75570 res!187384) b!223208))

(assert (= (and b!223208 res!187383) b!223210))

(assert (= (and d!75570 (not res!187382)) b!223209))

(declare-fun m!341827 () Bool)

(assert (=> bm!3457 m!341827))

(declare-fun m!341829 () Bool)

(assert (=> bm!3457 m!341829))

(declare-fun m!341831 () Bool)

(assert (=> b!223211 m!341831))

(declare-fun m!341833 () Bool)

(assert (=> b!223211 m!341833))

(assert (=> b!223211 m!341827))

(declare-fun m!341835 () Bool)

(assert (=> b!223211 m!341835))

(declare-fun m!341837 () Bool)

(assert (=> b!223211 m!341837))

(declare-fun m!341839 () Bool)

(assert (=> b!223211 m!341839))

(declare-fun m!341841 () Bool)

(assert (=> b!223211 m!341841))

(declare-fun m!341843 () Bool)

(assert (=> b!223211 m!341843))

(declare-fun m!341845 () Bool)

(assert (=> b!223211 m!341845))

(declare-fun m!341847 () Bool)

(assert (=> b!223211 m!341847))

(declare-fun m!341849 () Bool)

(assert (=> b!223211 m!341849))

(declare-fun m!341851 () Bool)

(assert (=> b!223211 m!341851))

(declare-fun m!341853 () Bool)

(assert (=> b!223211 m!341853))

(declare-fun m!341855 () Bool)

(assert (=> bm!3458 m!341855))

(declare-fun m!341857 () Bool)

(assert (=> b!223209 m!341857))

(declare-fun m!341859 () Bool)

(assert (=> b!223209 m!341859))

(declare-fun m!341861 () Bool)

(assert (=> d!75570 m!341861))

(declare-fun m!341863 () Bool)

(assert (=> d!75570 m!341863))

(declare-fun m!341865 () Bool)

(assert (=> b!223212 m!341865))

(declare-fun m!341867 () Bool)

(assert (=> b!223212 m!341867))

(assert (=> bm!3459 m!341863))

(declare-fun m!341869 () Bool)

(assert (=> b!223210 m!341869))

(assert (=> b!223145 d!75570))

(declare-fun d!75586 () Bool)

(assert (=> d!75586 (= (invariant!0 (currentBit!10028 thiss!1870) (currentByte!10033 thiss!1870) (size!4807 (buf!5351 thiss!1870))) (and (bvsge (currentBit!10028 thiss!1870) #b00000000000000000000000000000000) (bvslt (currentBit!10028 thiss!1870) #b00000000000000000000000000001000) (bvsge (currentByte!10033 thiss!1870) #b00000000000000000000000000000000) (or (bvslt (currentByte!10033 thiss!1870) (size!4807 (buf!5351 thiss!1870))) (and (= (currentBit!10028 thiss!1870) #b00000000000000000000000000000000) (= (currentByte!10033 thiss!1870) (size!4807 (buf!5351 thiss!1870)))))))))

(assert (=> b!223145 d!75586))

(declare-fun d!75588 () Bool)

(declare-fun e!151899 () Bool)

(assert (=> d!75588 e!151899))

(declare-fun res!187388 () Bool)

(assert (=> d!75588 (=> (not res!187388) (not e!151899))))

(assert (=> d!75588 (= res!187388 (and (or (let ((rhs!3635 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3635 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3635) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!75589 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!75589 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!75589 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3634 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3634 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3634) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!352453 () Unit!16106)

(declare-fun choose!57 (BitStream!8716 BitStream!8716 (_ BitVec 64) (_ BitVec 32)) Unit!16106)

(assert (=> d!75588 (= lt!352453 (choose!57 thiss!1870 (_2!10236 lt!352167) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> d!75588 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10236 lt!352167) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)) lt!352453)))

(declare-fun b!223215 () Bool)

(declare-fun lt!352452 () (_ BitVec 32))

(assert (=> b!223215 (= e!151899 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4807 (buf!5351 (_2!10236 lt!352167)))) ((_ sign_extend 32) (currentByte!10033 (_2!10236 lt!352167))) ((_ sign_extend 32) (currentBit!10028 (_2!10236 lt!352167))) (bvsub (bvsub to!496 i!761) lt!352452)))))

(assert (=> b!223215 (or (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand lt!352452 #b10000000000000000000000000000000)) (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!496 i!761) lt!352452) #b10000000000000000000000000000000)))))

(declare-fun lt!352451 () (_ BitVec 64))

(assert (=> b!223215 (= lt!352452 ((_ extract 31 0) lt!352451))))

(assert (=> b!223215 (and (bvslt lt!352451 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!352451 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!223215 (= lt!352451 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!75588 res!187388) b!223215))

(declare-fun m!341871 () Bool)

(assert (=> d!75588 m!341871))

(declare-fun m!341873 () Bool)

(assert (=> b!223215 m!341873))

(assert (=> b!223145 d!75588))

(push 1)

(assert (not b!223212))

(assert (not b!223211))

(assert (not b!223209))

(assert (not b!223215))

(assert (not b!223176))

(assert (not d!75588))

(assert (not bm!3457))

(assert (not b!223210))

(assert (not d!75554))

(assert (not d!75548))

(assert (not d!75556))

(assert (not d!75558))

(assert (not bm!3458))

(assert (not bm!3459))

(assert (not d!75570))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

