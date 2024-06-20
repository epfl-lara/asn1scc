; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46428 () Bool)

(assert start!46428)

(declare-fun b!223265 () Bool)

(declare-fun e!151944 () Bool)

(declare-datatypes ((array!10964 0))(
  ( (array!10965 (arr!5747 (Array (_ BitVec 32) (_ BitVec 8))) (size!4811 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8724 0))(
  ( (BitStream!8725 (buf!5355 array!10964) (currentByte!10043 (_ BitVec 32)) (currentBit!10038 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!19064 0))(
  ( (tuple2!19065 (_1!10248 (_ BitVec 8)) (_2!10248 BitStream!8724)) )
))
(declare-fun lt!352618 () tuple2!19064)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!223265 (= e!151944 (not (invariant!0 (currentBit!10038 (_2!10248 lt!352618)) (currentByte!10043 (_2!10248 lt!352618)) (size!4811 (buf!5355 (_2!10248 lt!352618))))))))

(declare-fun thiss!1870 () BitStream!8724)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!223265 (= (bitIndex!0 (size!4811 (buf!5355 (_2!10248 lt!352618))) (currentByte!10043 (_2!10248 lt!352618)) (currentBit!10038 (_2!10248 lt!352618))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!4811 (buf!5355 thiss!1870)) (currentByte!10043 thiss!1870) (currentBit!10038 thiss!1870))))))

(declare-datatypes ((Unit!16143 0))(
  ( (Unit!16144) )
))
(declare-datatypes ((tuple3!1148 0))(
  ( (tuple3!1149 (_1!10249 Unit!16143) (_2!10249 BitStream!8724) (_3!716 array!10964)) )
))
(declare-fun lt!352616 () tuple3!1148)

(declare-fun arr!308 () array!10964)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun readByteArrayLoop!0 (BitStream!8724 array!10964 (_ BitVec 32) (_ BitVec 32)) tuple3!1148)

(assert (=> b!223265 (= lt!352616 (readByteArrayLoop!0 (_2!10248 lt!352618) (array!10965 (store (arr!5747 arr!308) i!761 (_1!10248 lt!352618)) (size!4811 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!223265 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4811 (buf!5355 (_2!10248 lt!352618)))) ((_ sign_extend 32) (currentByte!10043 (_2!10248 lt!352618))) ((_ sign_extend 32) (currentBit!10038 (_2!10248 lt!352618))) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!352617 () Unit!16143)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8724 BitStream!8724 (_ BitVec 64) (_ BitVec 32)) Unit!16143)

(assert (=> b!223265 (= lt!352617 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10248 lt!352618) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!8724) tuple2!19064)

(assert (=> b!223265 (= lt!352618 (readByte!0 thiss!1870))))

(declare-fun b!223263 () Bool)

(declare-fun res!187427 () Bool)

(assert (=> b!223263 (=> (not res!187427) (not e!151944))))

(assert (=> b!223263 (= res!187427 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4811 (buf!5355 thiss!1870))) ((_ sign_extend 32) (currentByte!10043 thiss!1870)) ((_ sign_extend 32) (currentBit!10038 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!223266 () Bool)

(declare-fun e!151943 () Bool)

(declare-fun array_inv!4552 (array!10964) Bool)

(assert (=> b!223266 (= e!151943 (array_inv!4552 (buf!5355 thiss!1870)))))

(declare-fun res!187426 () Bool)

(assert (=> start!46428 (=> (not res!187426) (not e!151944))))

(assert (=> start!46428 (= res!187426 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4811 arr!308))))))

(assert (=> start!46428 e!151944))

(assert (=> start!46428 true))

(assert (=> start!46428 (array_inv!4552 arr!308)))

(declare-fun inv!12 (BitStream!8724) Bool)

(assert (=> start!46428 (and (inv!12 thiss!1870) e!151943)))

(declare-fun b!223264 () Bool)

(declare-fun res!187425 () Bool)

(assert (=> b!223264 (=> (not res!187425) (not e!151944))))

(assert (=> b!223264 (= res!187425 (bvslt i!761 to!496))))

(assert (= (and start!46428 res!187426) b!223263))

(assert (= (and b!223263 res!187427) b!223264))

(assert (= (and b!223264 res!187425) b!223265))

(assert (= start!46428 b!223266))

(declare-fun m!341963 () Bool)

(assert (=> b!223265 m!341963))

(declare-fun m!341965 () Bool)

(assert (=> b!223265 m!341965))

(declare-fun m!341967 () Bool)

(assert (=> b!223265 m!341967))

(declare-fun m!341969 () Bool)

(assert (=> b!223265 m!341969))

(declare-fun m!341971 () Bool)

(assert (=> b!223265 m!341971))

(declare-fun m!341973 () Bool)

(assert (=> b!223265 m!341973))

(declare-fun m!341975 () Bool)

(assert (=> b!223265 m!341975))

(declare-fun m!341977 () Bool)

(assert (=> b!223265 m!341977))

(declare-fun m!341979 () Bool)

(assert (=> b!223263 m!341979))

(declare-fun m!341981 () Bool)

(assert (=> b!223266 m!341981))

(declare-fun m!341983 () Bool)

(assert (=> start!46428 m!341983))

(declare-fun m!341985 () Bool)

(assert (=> start!46428 m!341985))

(check-sat (not start!46428) (not b!223266) (not b!223263) (not b!223265))
(check-sat)
(get-model)

(declare-fun d!75621 () Bool)

(assert (=> d!75621 (= (array_inv!4552 arr!308) (bvsge (size!4811 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!46428 d!75621))

(declare-fun d!75623 () Bool)

(assert (=> d!75623 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10038 thiss!1870) (currentByte!10043 thiss!1870) (size!4811 (buf!5355 thiss!1870))))))

(declare-fun bs!18453 () Bool)

(assert (= bs!18453 d!75623))

(declare-fun m!342017 () Bool)

(assert (=> bs!18453 m!342017))

(assert (=> start!46428 d!75623))

(declare-fun d!75625 () Bool)

(assert (=> d!75625 (= (array_inv!4552 (buf!5355 thiss!1870)) (bvsge (size!4811 (buf!5355 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!223266 d!75625))

(declare-fun d!75627 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!75627 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4811 (buf!5355 thiss!1870))) ((_ sign_extend 32) (currentByte!10043 thiss!1870)) ((_ sign_extend 32) (currentBit!10038 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4811 (buf!5355 thiss!1870))) ((_ sign_extend 32) (currentByte!10043 thiss!1870)) ((_ sign_extend 32) (currentBit!10038 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18454 () Bool)

(assert (= bs!18454 d!75627))

(declare-fun m!342019 () Bool)

(assert (=> bs!18454 m!342019))

(assert (=> b!223263 d!75627))

(declare-fun d!75629 () Bool)

(declare-fun lt!352713 () (_ BitVec 8))

(declare-fun lt!352709 () (_ BitVec 8))

(assert (=> d!75629 (= lt!352713 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5747 (buf!5355 thiss!1870)) (currentByte!10043 thiss!1870))) ((_ sign_extend 24) lt!352709))))))

(assert (=> d!75629 (= lt!352709 ((_ extract 7 0) (currentBit!10038 thiss!1870)))))

(declare-fun e!151978 () Bool)

(assert (=> d!75629 e!151978))

(declare-fun res!187465 () Bool)

(assert (=> d!75629 (=> (not res!187465) (not e!151978))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!75629 (= res!187465 (validate_offset_bits!1 ((_ sign_extend 32) (size!4811 (buf!5355 thiss!1870))) ((_ sign_extend 32) (currentByte!10043 thiss!1870)) ((_ sign_extend 32) (currentBit!10038 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!19072 0))(
  ( (tuple2!19073 (_1!10254 Unit!16143) (_2!10254 (_ BitVec 8))) )
))
(declare-fun Unit!16157 () Unit!16143)

(declare-fun Unit!16158 () Unit!16143)

(assert (=> d!75629 (= (readByte!0 thiss!1870) (tuple2!19065 (_2!10254 (ite (bvsgt ((_ sign_extend 24) lt!352709) #b00000000000000000000000000000000) (tuple2!19073 Unit!16157 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!352713) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5747 (buf!5355 thiss!1870)) (bvadd (currentByte!10043 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!352709)))))))) (tuple2!19073 Unit!16158 lt!352713))) (BitStream!8725 (buf!5355 thiss!1870) (bvadd (currentByte!10043 thiss!1870) #b00000000000000000000000000000001) (currentBit!10038 thiss!1870))))))

(declare-fun b!223303 () Bool)

(declare-fun e!151977 () Bool)

(assert (=> b!223303 (= e!151978 e!151977)))

(declare-fun res!187464 () Bool)

(assert (=> b!223303 (=> (not res!187464) (not e!151977))))

(declare-fun lt!352712 () tuple2!19064)

(assert (=> b!223303 (= res!187464 (= (buf!5355 (_2!10248 lt!352712)) (buf!5355 thiss!1870)))))

(declare-fun lt!352711 () (_ BitVec 8))

(declare-fun lt!352708 () (_ BitVec 8))

(declare-fun Unit!16160 () Unit!16143)

(declare-fun Unit!16161 () Unit!16143)

(assert (=> b!223303 (= lt!352712 (tuple2!19065 (_2!10254 (ite (bvsgt ((_ sign_extend 24) lt!352708) #b00000000000000000000000000000000) (tuple2!19073 Unit!16160 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!352711) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5747 (buf!5355 thiss!1870)) (bvadd (currentByte!10043 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!352708)))))))) (tuple2!19073 Unit!16161 lt!352711))) (BitStream!8725 (buf!5355 thiss!1870) (bvadd (currentByte!10043 thiss!1870) #b00000000000000000000000000000001) (currentBit!10038 thiss!1870))))))

(assert (=> b!223303 (= lt!352711 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5747 (buf!5355 thiss!1870)) (currentByte!10043 thiss!1870))) ((_ sign_extend 24) lt!352708))))))

(assert (=> b!223303 (= lt!352708 ((_ extract 7 0) (currentBit!10038 thiss!1870)))))

(declare-fun lt!352710 () (_ BitVec 64))

(declare-fun b!223304 () Bool)

(declare-fun lt!352714 () (_ BitVec 64))

(assert (=> b!223304 (= e!151977 (= (bitIndex!0 (size!4811 (buf!5355 (_2!10248 lt!352712))) (currentByte!10043 (_2!10248 lt!352712)) (currentBit!10038 (_2!10248 lt!352712))) (bvadd lt!352714 lt!352710)))))

(assert (=> b!223304 (or (not (= (bvand lt!352714 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!352710 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!352714 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!352714 lt!352710) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!223304 (= lt!352710 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!223304 (= lt!352714 (bitIndex!0 (size!4811 (buf!5355 thiss!1870)) (currentByte!10043 thiss!1870) (currentBit!10038 thiss!1870)))))

(assert (= (and d!75629 res!187465) b!223303))

(assert (= (and b!223303 res!187464) b!223304))

(declare-fun m!342041 () Bool)

(assert (=> d!75629 m!342041))

(declare-fun m!342043 () Bool)

(assert (=> d!75629 m!342043))

(declare-fun m!342045 () Bool)

(assert (=> d!75629 m!342045))

(assert (=> b!223303 m!342045))

(assert (=> b!223303 m!342041))

(declare-fun m!342047 () Bool)

(assert (=> b!223304 m!342047))

(assert (=> b!223304 m!341975))

(assert (=> b!223265 d!75629))

(declare-fun d!75637 () Bool)

(declare-fun e!151983 () Bool)

(assert (=> d!75637 e!151983))

(declare-fun res!187474 () Bool)

(assert (=> d!75637 (=> (not res!187474) (not e!151983))))

(declare-fun lt!352744 () (_ BitVec 64))

(declare-fun lt!352740 () (_ BitVec 64))

(declare-fun lt!352739 () (_ BitVec 64))

(assert (=> d!75637 (= res!187474 (= lt!352744 (bvsub lt!352740 lt!352739)))))

(assert (=> d!75637 (or (= (bvand lt!352740 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!352739 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!352740 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!352740 lt!352739) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75637 (= lt!352739 (remainingBits!0 ((_ sign_extend 32) (size!4811 (buf!5355 (_2!10248 lt!352618)))) ((_ sign_extend 32) (currentByte!10043 (_2!10248 lt!352618))) ((_ sign_extend 32) (currentBit!10038 (_2!10248 lt!352618)))))))

(declare-fun lt!352742 () (_ BitVec 64))

(declare-fun lt!352741 () (_ BitVec 64))

(assert (=> d!75637 (= lt!352740 (bvmul lt!352742 lt!352741))))

(assert (=> d!75637 (or (= lt!352742 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!352741 (bvsdiv (bvmul lt!352742 lt!352741) lt!352742)))))

(assert (=> d!75637 (= lt!352741 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!75637 (= lt!352742 ((_ sign_extend 32) (size!4811 (buf!5355 (_2!10248 lt!352618)))))))

(assert (=> d!75637 (= lt!352744 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10043 (_2!10248 lt!352618))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10038 (_2!10248 lt!352618)))))))

(assert (=> d!75637 (invariant!0 (currentBit!10038 (_2!10248 lt!352618)) (currentByte!10043 (_2!10248 lt!352618)) (size!4811 (buf!5355 (_2!10248 lt!352618))))))

(assert (=> d!75637 (= (bitIndex!0 (size!4811 (buf!5355 (_2!10248 lt!352618))) (currentByte!10043 (_2!10248 lt!352618)) (currentBit!10038 (_2!10248 lt!352618))) lt!352744)))

(declare-fun b!223313 () Bool)

(declare-fun res!187475 () Bool)

(assert (=> b!223313 (=> (not res!187475) (not e!151983))))

(assert (=> b!223313 (= res!187475 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!352744))))

(declare-fun b!223314 () Bool)

(declare-fun lt!352743 () (_ BitVec 64))

(assert (=> b!223314 (= e!151983 (bvsle lt!352744 (bvmul lt!352743 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!223314 (or (= lt!352743 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!352743 #b0000000000000000000000000000000000000000000000000000000000001000) lt!352743)))))

(assert (=> b!223314 (= lt!352743 ((_ sign_extend 32) (size!4811 (buf!5355 (_2!10248 lt!352618)))))))

(assert (= (and d!75637 res!187474) b!223313))

(assert (= (and b!223313 res!187475) b!223314))

(declare-fun m!342049 () Bool)

(assert (=> d!75637 m!342049))

(assert (=> d!75637 m!341969))

(assert (=> b!223265 d!75637))

(declare-fun d!75639 () Bool)

(declare-fun e!151984 () Bool)

(assert (=> d!75639 e!151984))

(declare-fun res!187476 () Bool)

(assert (=> d!75639 (=> (not res!187476) (not e!151984))))

(declare-fun lt!352750 () (_ BitVec 64))

(declare-fun lt!352746 () (_ BitVec 64))

(declare-fun lt!352745 () (_ BitVec 64))

(assert (=> d!75639 (= res!187476 (= lt!352750 (bvsub lt!352746 lt!352745)))))

(assert (=> d!75639 (or (= (bvand lt!352746 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!352745 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!352746 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!352746 lt!352745) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75639 (= lt!352745 (remainingBits!0 ((_ sign_extend 32) (size!4811 (buf!5355 thiss!1870))) ((_ sign_extend 32) (currentByte!10043 thiss!1870)) ((_ sign_extend 32) (currentBit!10038 thiss!1870))))))

(declare-fun lt!352748 () (_ BitVec 64))

(declare-fun lt!352747 () (_ BitVec 64))

(assert (=> d!75639 (= lt!352746 (bvmul lt!352748 lt!352747))))

(assert (=> d!75639 (or (= lt!352748 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!352747 (bvsdiv (bvmul lt!352748 lt!352747) lt!352748)))))

(assert (=> d!75639 (= lt!352747 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!75639 (= lt!352748 ((_ sign_extend 32) (size!4811 (buf!5355 thiss!1870))))))

(assert (=> d!75639 (= lt!352750 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10043 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10038 thiss!1870))))))

(assert (=> d!75639 (invariant!0 (currentBit!10038 thiss!1870) (currentByte!10043 thiss!1870) (size!4811 (buf!5355 thiss!1870)))))

(assert (=> d!75639 (= (bitIndex!0 (size!4811 (buf!5355 thiss!1870)) (currentByte!10043 thiss!1870) (currentBit!10038 thiss!1870)) lt!352750)))

(declare-fun b!223315 () Bool)

(declare-fun res!187477 () Bool)

(assert (=> b!223315 (=> (not res!187477) (not e!151984))))

(assert (=> b!223315 (= res!187477 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!352750))))

(declare-fun b!223316 () Bool)

(declare-fun lt!352749 () (_ BitVec 64))

(assert (=> b!223316 (= e!151984 (bvsle lt!352750 (bvmul lt!352749 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!223316 (or (= lt!352749 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!352749 #b0000000000000000000000000000000000000000000000000000000000001000) lt!352749)))))

(assert (=> b!223316 (= lt!352749 ((_ sign_extend 32) (size!4811 (buf!5355 thiss!1870))))))

(assert (= (and d!75639 res!187476) b!223315))

(assert (= (and b!223315 res!187477) b!223316))

(assert (=> d!75639 m!342019))

(assert (=> d!75639 m!342017))

(assert (=> b!223265 d!75639))

(declare-fun d!75641 () Bool)

(declare-fun e!151989 () Bool)

(assert (=> d!75641 e!151989))

(declare-fun res!187484 () Bool)

(assert (=> d!75641 (=> (not res!187484) (not e!151989))))

(assert (=> d!75641 (= res!187484 (and (or (let ((rhs!3656 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3656 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3656) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!75646 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!75646 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!75646 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3655 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3655 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3655) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!352769 () Unit!16143)

(declare-fun choose!57 (BitStream!8724 BitStream!8724 (_ BitVec 64) (_ BitVec 32)) Unit!16143)

(assert (=> d!75641 (= lt!352769 (choose!57 thiss!1870 (_2!10248 lt!352618) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> d!75641 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10248 lt!352618) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)) lt!352769)))

(declare-fun b!223323 () Bool)

(declare-fun lt!352771 () (_ BitVec 32))

(assert (=> b!223323 (= e!151989 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4811 (buf!5355 (_2!10248 lt!352618)))) ((_ sign_extend 32) (currentByte!10043 (_2!10248 lt!352618))) ((_ sign_extend 32) (currentBit!10038 (_2!10248 lt!352618))) (bvsub (bvsub to!496 i!761) lt!352771)))))

(assert (=> b!223323 (or (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand lt!352771 #b10000000000000000000000000000000)) (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!496 i!761) lt!352771) #b10000000000000000000000000000000)))))

(declare-fun lt!352770 () (_ BitVec 64))

(assert (=> b!223323 (= lt!352771 ((_ extract 31 0) lt!352770))))

(assert (=> b!223323 (and (bvslt lt!352770 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!352770 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!223323 (= lt!352770 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!75641 res!187484) b!223323))

(declare-fun m!342053 () Bool)

(assert (=> d!75641 m!342053))

(declare-fun m!342055 () Bool)

(assert (=> b!223323 m!342055))

(assert (=> b!223265 d!75641))

(declare-fun d!75648 () Bool)

(assert (=> d!75648 (= (invariant!0 (currentBit!10038 (_2!10248 lt!352618)) (currentByte!10043 (_2!10248 lt!352618)) (size!4811 (buf!5355 (_2!10248 lt!352618)))) (and (bvsge (currentBit!10038 (_2!10248 lt!352618)) #b00000000000000000000000000000000) (bvslt (currentBit!10038 (_2!10248 lt!352618)) #b00000000000000000000000000001000) (bvsge (currentByte!10043 (_2!10248 lt!352618)) #b00000000000000000000000000000000) (or (bvslt (currentByte!10043 (_2!10248 lt!352618)) (size!4811 (buf!5355 (_2!10248 lt!352618)))) (and (= (currentBit!10038 (_2!10248 lt!352618)) #b00000000000000000000000000000000) (= (currentByte!10043 (_2!10248 lt!352618)) (size!4811 (buf!5355 (_2!10248 lt!352618))))))))))

(assert (=> b!223265 d!75648))

(declare-fun b!223367 () Bool)

(declare-fun lt!353075 () tuple3!1148)

(declare-fun e!152017 () Bool)

(declare-datatypes ((tuple2!19076 0))(
  ( (tuple2!19077 (_1!10256 BitStream!8724) (_2!10256 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!8724) tuple2!19076)

(assert (=> b!223367 (= e!152017 (= (select (arr!5747 (_3!716 lt!353075)) (bvadd #b00000000000000000000000000000001 i!761)) (_2!10256 (readBytePure!0 (_2!10248 lt!352618)))))))

(assert (=> b!223367 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4811 (_3!716 lt!353075))))))

(declare-fun e!152018 () Bool)

(declare-fun b!223368 () Bool)

(declare-fun arrayRangesEq!711 (array!10964 array!10964 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!223368 (= e!152018 (arrayRangesEq!711 (array!10965 (store (arr!5747 arr!308) i!761 (_1!10248 lt!352618)) (size!4811 arr!308)) (_3!716 lt!353075) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun b!223369 () Bool)

(declare-fun e!152019 () tuple3!1148)

(declare-fun lt!353083 () Unit!16143)

(declare-fun lt!353104 () tuple3!1148)

(assert (=> b!223369 (= e!152019 (tuple3!1149 lt!353083 (_2!10249 lt!353104) (_3!716 lt!353104)))))

(declare-fun lt!353096 () tuple2!19064)

(assert (=> b!223369 (= lt!353096 (readByte!0 (_2!10248 lt!352618)))))

(declare-fun lt!353088 () array!10964)

(assert (=> b!223369 (= lt!353088 (array!10965 (store (arr!5747 (array!10965 (store (arr!5747 arr!308) i!761 (_1!10248 lt!352618)) (size!4811 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10248 lt!353096)) (size!4811 (array!10965 (store (arr!5747 arr!308) i!761 (_1!10248 lt!352618)) (size!4811 arr!308)))))))

(declare-fun lt!353101 () (_ BitVec 64))

(assert (=> b!223369 (= lt!353101 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!353094 () (_ BitVec 32))

(assert (=> b!223369 (= lt!353094 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!353082 () Unit!16143)

(assert (=> b!223369 (= lt!353082 (validateOffsetBytesFromBitIndexLemma!0 (_2!10248 lt!352618) (_2!10248 lt!353096) lt!353101 lt!353094))))

(assert (=> b!223369 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4811 (buf!5355 (_2!10248 lt!353096)))) ((_ sign_extend 32) (currentByte!10043 (_2!10248 lt!353096))) ((_ sign_extend 32) (currentBit!10038 (_2!10248 lt!353096))) (bvsub lt!353094 ((_ extract 31 0) (bvsdiv (bvadd lt!353101 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!353093 () Unit!16143)

(assert (=> b!223369 (= lt!353093 lt!353082)))

(assert (=> b!223369 (= lt!353104 (readByteArrayLoop!0 (_2!10248 lt!353096) lt!353088 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(declare-fun call!3497 () (_ BitVec 64))

(assert (=> b!223369 (= call!3497 (bvadd (bitIndex!0 (size!4811 (buf!5355 (_2!10248 lt!352618))) (currentByte!10043 (_2!10248 lt!352618)) (currentBit!10038 (_2!10248 lt!352618))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!353087 () Unit!16143)

(declare-fun Unit!16166 () Unit!16143)

(assert (=> b!223369 (= lt!353087 Unit!16166)))

(assert (=> b!223369 (= (bvadd call!3497 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4811 (buf!5355 (_2!10249 lt!353104))) (currentByte!10043 (_2!10249 lt!353104)) (currentBit!10038 (_2!10249 lt!353104))))))

(declare-fun lt!353103 () Unit!16143)

(declare-fun Unit!16167 () Unit!16143)

(assert (=> b!223369 (= lt!353103 Unit!16167)))

(assert (=> b!223369 (= (bvadd (bitIndex!0 (size!4811 (buf!5355 (_2!10248 lt!352618))) (currentByte!10043 (_2!10248 lt!352618)) (currentBit!10038 (_2!10248 lt!352618))) (bvmul ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4811 (buf!5355 (_2!10249 lt!353104))) (currentByte!10043 (_2!10249 lt!353104)) (currentBit!10038 (_2!10249 lt!353104))))))

(declare-fun lt!353079 () Unit!16143)

(declare-fun Unit!16168 () Unit!16143)

(assert (=> b!223369 (= lt!353079 Unit!16168)))

(assert (=> b!223369 (and (= (buf!5355 (_2!10248 lt!352618)) (buf!5355 (_2!10249 lt!353104))) (= (size!4811 (array!10965 (store (arr!5747 arr!308) i!761 (_1!10248 lt!352618)) (size!4811 arr!308))) (size!4811 (_3!716 lt!353104))))))

(declare-fun lt!353098 () Unit!16143)

(declare-fun Unit!16169 () Unit!16143)

(assert (=> b!223369 (= lt!353098 Unit!16169)))

(declare-fun lt!353072 () Unit!16143)

(declare-fun arrayUpdatedAtPrefixLemma!303 (array!10964 (_ BitVec 32) (_ BitVec 8)) Unit!16143)

(assert (=> b!223369 (= lt!353072 (arrayUpdatedAtPrefixLemma!303 (array!10965 (store (arr!5747 arr!308) i!761 (_1!10248 lt!352618)) (size!4811 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) (_1!10248 lt!353096)))))

(declare-fun call!3498 () Bool)

(assert (=> b!223369 call!3498))

(declare-fun lt!353070 () Unit!16143)

(assert (=> b!223369 (= lt!353070 lt!353072)))

(declare-fun lt!353097 () (_ BitVec 32))

(assert (=> b!223369 (= lt!353097 #b00000000000000000000000000000000)))

(declare-fun lt!353077 () Unit!16143)

(declare-fun arrayRangesEqTransitive!197 (array!10964 array!10964 array!10964 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16143)

(assert (=> b!223369 (= lt!353077 (arrayRangesEqTransitive!197 (array!10965 (store (arr!5747 arr!308) i!761 (_1!10248 lt!352618)) (size!4811 arr!308)) lt!353088 (_3!716 lt!353104) lt!353097 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(declare-fun call!3496 () Bool)

(assert (=> b!223369 call!3496))

(declare-fun lt!353091 () Unit!16143)

(assert (=> b!223369 (= lt!353091 lt!353077)))

(assert (=> b!223369 (arrayRangesEq!711 (array!10965 (store (arr!5747 arr!308) i!761 (_1!10248 lt!352618)) (size!4811 arr!308)) (_3!716 lt!353104) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun lt!353078 () Unit!16143)

(declare-fun Unit!16170 () Unit!16143)

(assert (=> b!223369 (= lt!353078 Unit!16170)))

(declare-fun lt!353100 () Unit!16143)

(declare-fun arrayRangesEqImpliesEq!72 (array!10964 array!10964 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16143)

(assert (=> b!223369 (= lt!353100 (arrayRangesEqImpliesEq!72 lt!353088 (_3!716 lt!353104) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!223369 (= (select (store (arr!5747 (array!10965 (store (arr!5747 arr!308) i!761 (_1!10248 lt!352618)) (size!4811 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10248 lt!353096)) (bvadd #b00000000000000000000000000000001 i!761)) (select (arr!5747 (_3!716 lt!353104)) (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!353073 () Unit!16143)

(assert (=> b!223369 (= lt!353073 lt!353100)))

(declare-fun lt!353099 () Bool)

(assert (=> b!223369 (= lt!353099 (= (select (arr!5747 (_3!716 lt!353104)) (bvadd #b00000000000000000000000000000001 i!761)) (_1!10248 lt!353096)))))

(declare-fun Unit!16171 () Unit!16143)

(assert (=> b!223369 (= lt!353083 Unit!16171)))

(assert (=> b!223369 lt!353099))

(declare-fun d!75650 () Bool)

(assert (=> d!75650 e!152017))

(declare-fun res!187514 () Bool)

(assert (=> d!75650 (=> res!187514 e!152017)))

(assert (=> d!75650 (= res!187514 (bvsge (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!353089 () Bool)

(assert (=> d!75650 (= lt!353089 e!152018)))

(declare-fun res!187512 () Bool)

(assert (=> d!75650 (=> (not res!187512) (not e!152018))))

(declare-fun lt!353085 () (_ BitVec 64))

(declare-fun lt!353090 () (_ BitVec 64))

(assert (=> d!75650 (= res!187512 (= (bvadd lt!353090 lt!353085) (bitIndex!0 (size!4811 (buf!5355 (_2!10249 lt!353075))) (currentByte!10043 (_2!10249 lt!353075)) (currentBit!10038 (_2!10249 lt!353075)))))))

(assert (=> d!75650 (or (not (= (bvand lt!353090 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!353085 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!353090 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!353090 lt!353085) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!353102 () (_ BitVec 64))

(assert (=> d!75650 (= lt!353085 (bvmul lt!353102 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!75650 (or (= lt!353102 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!353102 #b0000000000000000000000000000000000000000000000000000000000001000) lt!353102)))))

(assert (=> d!75650 (= lt!353102 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))))))

(assert (=> d!75650 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b10000000000000000000000000000000)))))

(assert (=> d!75650 (= lt!353090 (bitIndex!0 (size!4811 (buf!5355 (_2!10248 lt!352618))) (currentByte!10043 (_2!10248 lt!352618)) (currentBit!10038 (_2!10248 lt!352618))))))

(assert (=> d!75650 (= lt!353075 e!152019)))

(declare-fun c!11093 () Bool)

(assert (=> d!75650 (= c!11093 (bvslt (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> d!75650 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) to!496) (bvsle to!496 (size!4811 (array!10965 (store (arr!5747 arr!308) i!761 (_1!10248 lt!352618)) (size!4811 arr!308)))))))

(assert (=> d!75650 (= (readByteArrayLoop!0 (_2!10248 lt!352618) (array!10965 (store (arr!5747 arr!308) i!761 (_1!10248 lt!352618)) (size!4811 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496) lt!353075)))

(declare-fun bm!3493 () Bool)

(assert (=> bm!3493 (= call!3496 (arrayRangesEq!711 (array!10965 (store (arr!5747 arr!308) i!761 (_1!10248 lt!352618)) (size!4811 arr!308)) (ite c!11093 (_3!716 lt!353104) (array!10965 (store (arr!5747 arr!308) i!761 (_1!10248 lt!352618)) (size!4811 arr!308))) (ite c!11093 lt!353097 #b00000000000000000000000000000000) (ite c!11093 (bvadd #b00000000000000000000000000000001 i!761) (size!4811 (array!10965 (store (arr!5747 arr!308) i!761 (_1!10248 lt!352618)) (size!4811 arr!308))))))))

(declare-fun lt!353084 () (_ BitVec 32))

(declare-fun lt!353074 () (_ BitVec 32))

(declare-fun lt!353081 () array!10964)

(declare-fun lt!353071 () array!10964)

(declare-fun bm!3494 () Bool)

(assert (=> bm!3494 (= call!3498 (arrayRangesEq!711 (ite c!11093 (array!10965 (store (arr!5747 arr!308) i!761 (_1!10248 lt!352618)) (size!4811 arr!308)) lt!353081) (ite c!11093 (array!10965 (store (arr!5747 (array!10965 (store (arr!5747 arr!308) i!761 (_1!10248 lt!352618)) (size!4811 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10248 lt!353096)) (size!4811 (array!10965 (store (arr!5747 arr!308) i!761 (_1!10248 lt!352618)) (size!4811 arr!308)))) lt!353071) (ite c!11093 #b00000000000000000000000000000000 lt!353074) (ite c!11093 (bvadd #b00000000000000000000000000000001 i!761) lt!353084)))))

(declare-fun b!223370 () Bool)

(declare-fun res!187513 () Bool)

(assert (=> b!223370 (=> (not res!187513) (not e!152018))))

(assert (=> b!223370 (= res!187513 (and (= (buf!5355 (_2!10248 lt!352618)) (buf!5355 (_2!10249 lt!353075))) (= (size!4811 (array!10965 (store (arr!5747 arr!308) i!761 (_1!10248 lt!352618)) (size!4811 arr!308))) (size!4811 (_3!716 lt!353075)))))))

(declare-fun bm!3495 () Bool)

(assert (=> bm!3495 (= call!3497 (bitIndex!0 (ite c!11093 (size!4811 (buf!5355 (_2!10248 lt!353096))) (size!4811 (buf!5355 (_2!10248 lt!352618)))) (ite c!11093 (currentByte!10043 (_2!10248 lt!353096)) (currentByte!10043 (_2!10248 lt!352618))) (ite c!11093 (currentBit!10038 (_2!10248 lt!353096)) (currentBit!10038 (_2!10248 lt!352618)))))))

(declare-fun lt!353080 () Unit!16143)

(declare-fun b!223371 () Bool)

(assert (=> b!223371 (= e!152019 (tuple3!1149 lt!353080 (_2!10248 lt!352618) (array!10965 (store (arr!5747 arr!308) i!761 (_1!10248 lt!352618)) (size!4811 arr!308))))))

(assert (=> b!223371 (= call!3497 call!3497)))

(declare-fun lt!353076 () Unit!16143)

(declare-fun Unit!16172 () Unit!16143)

(assert (=> b!223371 (= lt!353076 Unit!16172)))

(declare-fun lt!353069 () Unit!16143)

(declare-fun arrayRangesEqReflexiveLemma!63 (array!10964) Unit!16143)

(assert (=> b!223371 (= lt!353069 (arrayRangesEqReflexiveLemma!63 (array!10965 (store (arr!5747 arr!308) i!761 (_1!10248 lt!352618)) (size!4811 arr!308))))))

(assert (=> b!223371 call!3496))

(declare-fun lt!353092 () Unit!16143)

(assert (=> b!223371 (= lt!353092 lt!353069)))

(assert (=> b!223371 (= lt!353081 (array!10965 (store (arr!5747 arr!308) i!761 (_1!10248 lt!352618)) (size!4811 arr!308)))))

(assert (=> b!223371 (= lt!353071 (array!10965 (store (arr!5747 arr!308) i!761 (_1!10248 lt!352618)) (size!4811 arr!308)))))

(declare-fun lt!353095 () (_ BitVec 32))

(assert (=> b!223371 (= lt!353095 #b00000000000000000000000000000000)))

(declare-fun lt!353086 () (_ BitVec 32))

(assert (=> b!223371 (= lt!353086 (size!4811 (array!10965 (store (arr!5747 arr!308) i!761 (_1!10248 lt!352618)) (size!4811 arr!308))))))

(assert (=> b!223371 (= lt!353074 #b00000000000000000000000000000000)))

(assert (=> b!223371 (= lt!353084 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun arrayRangesEqSlicedLemma!63 (array!10964 array!10964 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16143)

(assert (=> b!223371 (= lt!353080 (arrayRangesEqSlicedLemma!63 lt!353081 lt!353071 lt!353095 lt!353086 lt!353074 lt!353084))))

(assert (=> b!223371 call!3498))

(assert (= (and d!75650 c!11093) b!223369))

(assert (= (and d!75650 (not c!11093)) b!223371))

(assert (= (or b!223369 b!223371) bm!3494))

(assert (= (or b!223369 b!223371) bm!3493))

(assert (= (or b!223369 b!223371) bm!3495))

(assert (= (and d!75650 res!187512) b!223370))

(assert (= (and b!223370 res!187513) b!223368))

(assert (= (and d!75650 (not res!187514)) b!223367))

(declare-fun m!342145 () Bool)

(assert (=> b!223368 m!342145))

(declare-fun m!342147 () Bool)

(assert (=> b!223369 m!342147))

(declare-fun m!342149 () Bool)

(assert (=> b!223369 m!342149))

(declare-fun m!342151 () Bool)

(assert (=> b!223369 m!342151))

(declare-fun m!342153 () Bool)

(assert (=> b!223369 m!342153))

(declare-fun m!342155 () Bool)

(assert (=> b!223369 m!342155))

(assert (=> b!223369 m!341967))

(declare-fun m!342157 () Bool)

(assert (=> b!223369 m!342157))

(declare-fun m!342159 () Bool)

(assert (=> b!223369 m!342159))

(declare-fun m!342161 () Bool)

(assert (=> b!223369 m!342161))

(declare-fun m!342163 () Bool)

(assert (=> b!223369 m!342163))

(declare-fun m!342165 () Bool)

(assert (=> b!223369 m!342165))

(declare-fun m!342167 () Bool)

(assert (=> b!223369 m!342167))

(declare-fun m!342169 () Bool)

(assert (=> b!223369 m!342169))

(assert (=> bm!3494 m!342165))

(declare-fun m!342171 () Bool)

(assert (=> bm!3494 m!342171))

(declare-fun m!342173 () Bool)

(assert (=> d!75650 m!342173))

(assert (=> d!75650 m!341967))

(declare-fun m!342175 () Bool)

(assert (=> bm!3493 m!342175))

(declare-fun m!342177 () Bool)

(assert (=> b!223371 m!342177))

(declare-fun m!342179 () Bool)

(assert (=> b!223371 m!342179))

(declare-fun m!342181 () Bool)

(assert (=> bm!3495 m!342181))

(declare-fun m!342183 () Bool)

(assert (=> b!223367 m!342183))

(declare-fun m!342185 () Bool)

(assert (=> b!223367 m!342185))

(assert (=> b!223265 d!75650))

(declare-fun d!75667 () Bool)

(assert (=> d!75667 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4811 (buf!5355 (_2!10248 lt!352618)))) ((_ sign_extend 32) (currentByte!10043 (_2!10248 lt!352618))) ((_ sign_extend 32) (currentBit!10038 (_2!10248 lt!352618))) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4811 (buf!5355 (_2!10248 lt!352618)))) ((_ sign_extend 32) (currentByte!10043 (_2!10248 lt!352618))) ((_ sign_extend 32) (currentBit!10038 (_2!10248 lt!352618)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18458 () Bool)

(assert (= bs!18458 d!75667))

(assert (=> bs!18458 m!342049))

(assert (=> b!223265 d!75667))

(check-sat (not b!223367) (not d!75641) (not d!75639) (not b!223304) (not d!75650) (not b!223323) (not d!75627) (not bm!3495) (not d!75629) (not d!75623) (not b!223369) (not d!75637) (not bm!3494) (not b!223371) (not b!223368) (not d!75667) (not bm!3493))
