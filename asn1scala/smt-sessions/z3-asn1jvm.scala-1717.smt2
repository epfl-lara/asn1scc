; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47440 () Bool)

(assert start!47440)

(declare-fun b!226185 () Bool)

(declare-fun e!154576 () Bool)

(declare-datatypes ((array!11302 0))(
  ( (array!11303 (arr!5918 (Array (_ BitVec 32) (_ BitVec 8))) (size!4958 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9012 0))(
  ( (BitStream!9013 (buf!5499 array!11302) (currentByte!10307 (_ BitVec 32)) (currentBit!10302 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9012)

(declare-fun array_inv!4699 (array!11302) Bool)

(assert (=> b!226185 (= e!154576 (array_inv!4699 (buf!5499 thiss!1870)))))

(declare-fun b!226182 () Bool)

(declare-fun res!189799 () Bool)

(declare-fun e!154574 () Bool)

(assert (=> b!226182 (=> (not res!189799) (not e!154574))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!226182 (= res!189799 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4958 (buf!5499 thiss!1870))) ((_ sign_extend 32) (currentByte!10307 thiss!1870)) ((_ sign_extend 32) (currentBit!10302 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!226184 () Bool)

(declare-datatypes ((tuple2!19378 0))(
  ( (tuple2!19379 (_1!10480 (_ BitVec 8)) (_2!10480 BitStream!9012)) )
))
(declare-fun lt!359664 () tuple2!19378)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!226184 (= e!154574 (not (= (bitIndex!0 (size!4958 (buf!5499 (_2!10480 lt!359664))) (currentByte!10307 (_2!10480 lt!359664)) (currentBit!10302 (_2!10480 lt!359664))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!4958 (buf!5499 thiss!1870)) (currentByte!10307 thiss!1870) (currentBit!10302 thiss!1870))))))))

(declare-datatypes ((Unit!16694 0))(
  ( (Unit!16695) )
))
(declare-datatypes ((tuple3!1298 0))(
  ( (tuple3!1299 (_1!10481 Unit!16694) (_2!10481 BitStream!9012) (_3!791 array!11302)) )
))
(declare-fun lt!359662 () tuple3!1298)

(declare-fun arr!308 () array!11302)

(declare-fun readByteArrayLoop!0 (BitStream!9012 array!11302 (_ BitVec 32) (_ BitVec 32)) tuple3!1298)

(assert (=> b!226184 (= lt!359662 (readByteArrayLoop!0 (_2!10480 lt!359664) (array!11303 (store (arr!5918 arr!308) i!761 (_1!10480 lt!359664)) (size!4958 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!226184 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4958 (buf!5499 (_2!10480 lt!359664)))) ((_ sign_extend 32) (currentByte!10307 (_2!10480 lt!359664))) ((_ sign_extend 32) (currentBit!10302 (_2!10480 lt!359664))) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!359663 () Unit!16694)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9012 BitStream!9012 (_ BitVec 64) (_ BitVec 32)) Unit!16694)

(assert (=> b!226184 (= lt!359663 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10480 lt!359664) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!9012) tuple2!19378)

(assert (=> b!226184 (= lt!359664 (readByte!0 thiss!1870))))

(declare-fun res!189797 () Bool)

(assert (=> start!47440 (=> (not res!189797) (not e!154574))))

(assert (=> start!47440 (= res!189797 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4958 arr!308))))))

(assert (=> start!47440 e!154574))

(assert (=> start!47440 true))

(assert (=> start!47440 (array_inv!4699 arr!308)))

(declare-fun inv!12 (BitStream!9012) Bool)

(assert (=> start!47440 (and (inv!12 thiss!1870) e!154576)))

(declare-fun b!226183 () Bool)

(declare-fun res!189798 () Bool)

(assert (=> b!226183 (=> (not res!189798) (not e!154574))))

(assert (=> b!226183 (= res!189798 (bvslt i!761 to!496))))

(assert (= (and start!47440 res!189797) b!226182))

(assert (= (and b!226182 res!189799) b!226183))

(assert (= (and b!226183 res!189798) b!226184))

(assert (= start!47440 b!226185))

(declare-fun m!347357 () Bool)

(assert (=> b!226185 m!347357))

(declare-fun m!347359 () Bool)

(assert (=> b!226182 m!347359))

(declare-fun m!347361 () Bool)

(assert (=> b!226184 m!347361))

(declare-fun m!347363 () Bool)

(assert (=> b!226184 m!347363))

(declare-fun m!347365 () Bool)

(assert (=> b!226184 m!347365))

(declare-fun m!347367 () Bool)

(assert (=> b!226184 m!347367))

(declare-fun m!347369 () Bool)

(assert (=> b!226184 m!347369))

(declare-fun m!347371 () Bool)

(assert (=> b!226184 m!347371))

(declare-fun m!347373 () Bool)

(assert (=> b!226184 m!347373))

(declare-fun m!347375 () Bool)

(assert (=> start!47440 m!347375))

(declare-fun m!347377 () Bool)

(assert (=> start!47440 m!347377))

(check-sat (not b!226185) (not start!47440) (not b!226182) (not b!226184))
(check-sat)
(get-model)

(declare-fun d!76775 () Bool)

(assert (=> d!76775 (= (array_inv!4699 (buf!5499 thiss!1870)) (bvsge (size!4958 (buf!5499 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!226185 d!76775))

(declare-fun d!76778 () Bool)

(assert (=> d!76778 (= (array_inv!4699 arr!308) (bvsge (size!4958 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!47440 d!76778))

(declare-fun d!76780 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!76780 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10302 thiss!1870) (currentByte!10307 thiss!1870) (size!4958 (buf!5499 thiss!1870))))))

(declare-fun bs!18768 () Bool)

(assert (= bs!18768 d!76780))

(declare-fun m!347425 () Bool)

(assert (=> bs!18768 m!347425))

(assert (=> start!47440 d!76780))

(declare-fun d!76782 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!76782 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4958 (buf!5499 thiss!1870))) ((_ sign_extend 32) (currentByte!10307 thiss!1870)) ((_ sign_extend 32) (currentBit!10302 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4958 (buf!5499 thiss!1870))) ((_ sign_extend 32) (currentByte!10307 thiss!1870)) ((_ sign_extend 32) (currentBit!10302 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18769 () Bool)

(assert (= bs!18769 d!76782))

(declare-fun m!347427 () Bool)

(assert (=> bs!18769 m!347427))

(assert (=> b!226182 d!76782))

(declare-fun d!76784 () Bool)

(declare-fun e!154609 () Bool)

(assert (=> d!76784 e!154609))

(declare-fun res!189836 () Bool)

(assert (=> d!76784 (=> (not res!189836) (not e!154609))))

(declare-fun lt!359757 () (_ BitVec 64))

(declare-fun lt!359758 () (_ BitVec 64))

(declare-fun lt!359759 () (_ BitVec 64))

(assert (=> d!76784 (= res!189836 (= lt!359759 (bvsub lt!359758 lt!359757)))))

(assert (=> d!76784 (or (= (bvand lt!359758 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!359757 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!359758 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!359758 lt!359757) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!76784 (= lt!359757 (remainingBits!0 ((_ sign_extend 32) (size!4958 (buf!5499 (_2!10480 lt!359664)))) ((_ sign_extend 32) (currentByte!10307 (_2!10480 lt!359664))) ((_ sign_extend 32) (currentBit!10302 (_2!10480 lt!359664)))))))

(declare-fun lt!359760 () (_ BitVec 64))

(declare-fun lt!359756 () (_ BitVec 64))

(assert (=> d!76784 (= lt!359758 (bvmul lt!359760 lt!359756))))

(assert (=> d!76784 (or (= lt!359760 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!359756 (bvsdiv (bvmul lt!359760 lt!359756) lt!359760)))))

(assert (=> d!76784 (= lt!359756 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76784 (= lt!359760 ((_ sign_extend 32) (size!4958 (buf!5499 (_2!10480 lt!359664)))))))

(assert (=> d!76784 (= lt!359759 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10307 (_2!10480 lt!359664))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10302 (_2!10480 lt!359664)))))))

(assert (=> d!76784 (invariant!0 (currentBit!10302 (_2!10480 lt!359664)) (currentByte!10307 (_2!10480 lt!359664)) (size!4958 (buf!5499 (_2!10480 lt!359664))))))

(assert (=> d!76784 (= (bitIndex!0 (size!4958 (buf!5499 (_2!10480 lt!359664))) (currentByte!10307 (_2!10480 lt!359664)) (currentBit!10302 (_2!10480 lt!359664))) lt!359759)))

(declare-fun b!226223 () Bool)

(declare-fun res!189837 () Bool)

(assert (=> b!226223 (=> (not res!189837) (not e!154609))))

(assert (=> b!226223 (= res!189837 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!359759))))

(declare-fun b!226224 () Bool)

(declare-fun lt!359755 () (_ BitVec 64))

(assert (=> b!226224 (= e!154609 (bvsle lt!359759 (bvmul lt!359755 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!226224 (or (= lt!359755 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!359755 #b0000000000000000000000000000000000000000000000000000000000001000) lt!359755)))))

(assert (=> b!226224 (= lt!359755 ((_ sign_extend 32) (size!4958 (buf!5499 (_2!10480 lt!359664)))))))

(assert (= (and d!76784 res!189836) b!226223))

(assert (= (and b!226223 res!189837) b!226224))

(declare-fun m!347433 () Bool)

(assert (=> d!76784 m!347433))

(declare-fun m!347435 () Bool)

(assert (=> d!76784 m!347435))

(assert (=> b!226184 d!76784))

(declare-fun d!76788 () Bool)

(declare-fun lt!359779 () (_ BitVec 8))

(declare-fun lt!359781 () (_ BitVec 8))

(assert (=> d!76788 (= lt!359779 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5918 (buf!5499 thiss!1870)) (currentByte!10307 thiss!1870))) ((_ sign_extend 24) lt!359781))))))

(assert (=> d!76788 (= lt!359781 ((_ extract 7 0) (currentBit!10302 thiss!1870)))))

(declare-fun e!154614 () Bool)

(assert (=> d!76788 e!154614))

(declare-fun res!189844 () Bool)

(assert (=> d!76788 (=> (not res!189844) (not e!154614))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!76788 (= res!189844 (validate_offset_bits!1 ((_ sign_extend 32) (size!4958 (buf!5499 thiss!1870))) ((_ sign_extend 32) (currentByte!10307 thiss!1870)) ((_ sign_extend 32) (currentBit!10302 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!19390 0))(
  ( (tuple2!19391 (_1!10488 Unit!16694) (_2!10488 (_ BitVec 8))) )
))
(declare-fun Unit!16720 () Unit!16694)

(declare-fun Unit!16721 () Unit!16694)

(assert (=> d!76788 (= (readByte!0 thiss!1870) (tuple2!19379 (_2!10488 (ite (bvsgt ((_ sign_extend 24) lt!359781) #b00000000000000000000000000000000) (tuple2!19391 Unit!16720 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!359779) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5918 (buf!5499 thiss!1870)) (bvadd (currentByte!10307 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!359781)))))))) (tuple2!19391 Unit!16721 lt!359779))) (BitStream!9013 (buf!5499 thiss!1870) (bvadd (currentByte!10307 thiss!1870) #b00000000000000000000000000000001) (currentBit!10302 thiss!1870))))))

(declare-fun b!226229 () Bool)

(declare-fun e!154615 () Bool)

(assert (=> b!226229 (= e!154614 e!154615)))

(declare-fun res!189843 () Bool)

(assert (=> b!226229 (=> (not res!189843) (not e!154615))))

(declare-fun lt!359777 () tuple2!19378)

(assert (=> b!226229 (= res!189843 (= (buf!5499 (_2!10480 lt!359777)) (buf!5499 thiss!1870)))))

(declare-fun lt!359775 () (_ BitVec 8))

(declare-fun lt!359776 () (_ BitVec 8))

(declare-fun Unit!16722 () Unit!16694)

(declare-fun Unit!16723 () Unit!16694)

(assert (=> b!226229 (= lt!359777 (tuple2!19379 (_2!10488 (ite (bvsgt ((_ sign_extend 24) lt!359775) #b00000000000000000000000000000000) (tuple2!19391 Unit!16722 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!359776) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5918 (buf!5499 thiss!1870)) (bvadd (currentByte!10307 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!359775)))))))) (tuple2!19391 Unit!16723 lt!359776))) (BitStream!9013 (buf!5499 thiss!1870) (bvadd (currentByte!10307 thiss!1870) #b00000000000000000000000000000001) (currentBit!10302 thiss!1870))))))

(assert (=> b!226229 (= lt!359776 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5918 (buf!5499 thiss!1870)) (currentByte!10307 thiss!1870))) ((_ sign_extend 24) lt!359775))))))

(assert (=> b!226229 (= lt!359775 ((_ extract 7 0) (currentBit!10302 thiss!1870)))))

(declare-fun lt!359780 () (_ BitVec 64))

(declare-fun lt!359778 () (_ BitVec 64))

(declare-fun b!226230 () Bool)

(assert (=> b!226230 (= e!154615 (= (bitIndex!0 (size!4958 (buf!5499 (_2!10480 lt!359777))) (currentByte!10307 (_2!10480 lt!359777)) (currentBit!10302 (_2!10480 lt!359777))) (bvadd lt!359780 lt!359778)))))

(assert (=> b!226230 (or (not (= (bvand lt!359780 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!359778 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!359780 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!359780 lt!359778) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!226230 (= lt!359778 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!226230 (= lt!359780 (bitIndex!0 (size!4958 (buf!5499 thiss!1870)) (currentByte!10307 thiss!1870) (currentBit!10302 thiss!1870)))))

(assert (= (and d!76788 res!189844) b!226229))

(assert (= (and b!226229 res!189843) b!226230))

(declare-fun m!347437 () Bool)

(assert (=> d!76788 m!347437))

(declare-fun m!347439 () Bool)

(assert (=> d!76788 m!347439))

(declare-fun m!347441 () Bool)

(assert (=> d!76788 m!347441))

(assert (=> b!226229 m!347441))

(assert (=> b!226229 m!347437))

(declare-fun m!347443 () Bool)

(assert (=> b!226230 m!347443))

(assert (=> b!226230 m!347363))

(assert (=> b!226184 d!76788))

(declare-fun b!226284 () Bool)

(declare-fun e!154648 () Bool)

(declare-fun lt!360127 () tuple3!1298)

(declare-fun arrayRangesEq!816 (array!11302 array!11302 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!226284 (= e!154648 (arrayRangesEq!816 (array!11303 (store (arr!5918 arr!308) i!761 (_1!10480 lt!359664)) (size!4958 arr!308)) (_3!791 lt!360127) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun bm!3715 () Bool)

(declare-fun lt!360112 () tuple3!1298)

(declare-fun lt!360136 () (_ BitVec 32))

(declare-fun lt!360139 () array!11302)

(declare-fun call!3719 () Bool)

(declare-fun lt!360118 () (_ BitVec 32))

(declare-fun lt!360132 () (_ BitVec 32))

(declare-fun c!11167 () Bool)

(declare-fun lt!360110 () array!11302)

(assert (=> bm!3715 (= call!3719 (arrayRangesEq!816 (ite c!11167 (array!11303 (store (arr!5918 arr!308) i!761 (_1!10480 lt!359664)) (size!4958 arr!308)) lt!360110) (ite c!11167 (_3!791 lt!360112) lt!360139) (ite c!11167 lt!360118 lt!360132) (ite c!11167 (bvadd #b00000000000000000000000000000001 i!761) lt!360136)))))

(declare-fun b!226285 () Bool)

(declare-fun e!154650 () tuple3!1298)

(declare-fun lt!360143 () Unit!16694)

(assert (=> b!226285 (= e!154650 (tuple3!1299 lt!360143 (_2!10481 lt!360112) (_3!791 lt!360112)))))

(declare-fun lt!360122 () tuple2!19378)

(assert (=> b!226285 (= lt!360122 (readByte!0 (_2!10480 lt!359664)))))

(declare-fun lt!360144 () array!11302)

(assert (=> b!226285 (= lt!360144 (array!11303 (store (arr!5918 (array!11303 (store (arr!5918 arr!308) i!761 (_1!10480 lt!359664)) (size!4958 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10480 lt!360122)) (size!4958 (array!11303 (store (arr!5918 arr!308) i!761 (_1!10480 lt!359664)) (size!4958 arr!308)))))))

(declare-fun lt!360133 () (_ BitVec 64))

(assert (=> b!226285 (= lt!360133 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!360114 () (_ BitVec 32))

(assert (=> b!226285 (= lt!360114 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!360140 () Unit!16694)

(assert (=> b!226285 (= lt!360140 (validateOffsetBytesFromBitIndexLemma!0 (_2!10480 lt!359664) (_2!10480 lt!360122) lt!360133 lt!360114))))

(assert (=> b!226285 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4958 (buf!5499 (_2!10480 lt!360122)))) ((_ sign_extend 32) (currentByte!10307 (_2!10480 lt!360122))) ((_ sign_extend 32) (currentBit!10302 (_2!10480 lt!360122))) (bvsub lt!360114 ((_ extract 31 0) (bvsdiv (bvadd lt!360133 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!360129 () Unit!16694)

(assert (=> b!226285 (= lt!360129 lt!360140)))

(assert (=> b!226285 (= lt!360112 (readByteArrayLoop!0 (_2!10480 lt!360122) lt!360144 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(declare-fun call!3720 () (_ BitVec 64))

(assert (=> b!226285 (= (bitIndex!0 (size!4958 (buf!5499 (_2!10480 lt!360122))) (currentByte!10307 (_2!10480 lt!360122)) (currentBit!10302 (_2!10480 lt!360122))) (bvadd call!3720 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!360120 () Unit!16694)

(declare-fun Unit!16724 () Unit!16694)

(assert (=> b!226285 (= lt!360120 Unit!16724)))

(assert (=> b!226285 (= (bvadd (bitIndex!0 (size!4958 (buf!5499 (_2!10480 lt!360122))) (currentByte!10307 (_2!10480 lt!360122)) (currentBit!10302 (_2!10480 lt!360122))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4958 (buf!5499 (_2!10481 lt!360112))) (currentByte!10307 (_2!10481 lt!360112)) (currentBit!10302 (_2!10481 lt!360112))))))

(declare-fun lt!360128 () Unit!16694)

(declare-fun Unit!16725 () Unit!16694)

(assert (=> b!226285 (= lt!360128 Unit!16725)))

(assert (=> b!226285 (= (bvadd call!3720 (bvmul ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4958 (buf!5499 (_2!10481 lt!360112))) (currentByte!10307 (_2!10481 lt!360112)) (currentBit!10302 (_2!10481 lt!360112))))))

(declare-fun lt!360131 () Unit!16694)

(declare-fun Unit!16726 () Unit!16694)

(assert (=> b!226285 (= lt!360131 Unit!16726)))

(assert (=> b!226285 (and (= (buf!5499 (_2!10480 lt!359664)) (buf!5499 (_2!10481 lt!360112))) (= (size!4958 (array!11303 (store (arr!5918 arr!308) i!761 (_1!10480 lt!359664)) (size!4958 arr!308))) (size!4958 (_3!791 lt!360112))))))

(declare-fun lt!360142 () Unit!16694)

(declare-fun Unit!16727 () Unit!16694)

(assert (=> b!226285 (= lt!360142 Unit!16727)))

(declare-fun lt!360141 () Unit!16694)

(declare-fun arrayUpdatedAtPrefixLemma!375 (array!11302 (_ BitVec 32) (_ BitVec 8)) Unit!16694)

(assert (=> b!226285 (= lt!360141 (arrayUpdatedAtPrefixLemma!375 (array!11303 (store (arr!5918 arr!308) i!761 (_1!10480 lt!359664)) (size!4958 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) (_1!10480 lt!360122)))))

(declare-fun call!3718 () Bool)

(assert (=> b!226285 call!3718))

(declare-fun lt!360121 () Unit!16694)

(assert (=> b!226285 (= lt!360121 lt!360141)))

(assert (=> b!226285 (= lt!360118 #b00000000000000000000000000000000)))

(declare-fun lt!360116 () Unit!16694)

(declare-fun arrayRangesEqTransitive!254 (array!11302 array!11302 array!11302 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16694)

(assert (=> b!226285 (= lt!360116 (arrayRangesEqTransitive!254 (array!11303 (store (arr!5918 arr!308) i!761 (_1!10480 lt!359664)) (size!4958 arr!308)) lt!360144 (_3!791 lt!360112) lt!360118 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!226285 call!3719))

(declare-fun lt!360134 () Unit!16694)

(assert (=> b!226285 (= lt!360134 lt!360116)))

(assert (=> b!226285 (arrayRangesEq!816 (array!11303 (store (arr!5918 arr!308) i!761 (_1!10480 lt!359664)) (size!4958 arr!308)) (_3!791 lt!360112) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun lt!360138 () Unit!16694)

(declare-fun Unit!16728 () Unit!16694)

(assert (=> b!226285 (= lt!360138 Unit!16728)))

(declare-fun lt!360113 () Unit!16694)

(declare-fun arrayRangesEqImpliesEq!105 (array!11302 array!11302 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16694)

(assert (=> b!226285 (= lt!360113 (arrayRangesEqImpliesEq!105 lt!360144 (_3!791 lt!360112) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!226285 (= (select (store (arr!5918 (array!11303 (store (arr!5918 arr!308) i!761 (_1!10480 lt!359664)) (size!4958 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10480 lt!360122)) (bvadd #b00000000000000000000000000000001 i!761)) (select (arr!5918 (_3!791 lt!360112)) (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!360137 () Unit!16694)

(assert (=> b!226285 (= lt!360137 lt!360113)))

(declare-fun lt!360126 () Bool)

(assert (=> b!226285 (= lt!360126 (= (select (arr!5918 (_3!791 lt!360112)) (bvadd #b00000000000000000000000000000001 i!761)) (_1!10480 lt!360122)))))

(declare-fun Unit!16729 () Unit!16694)

(assert (=> b!226285 (= lt!360143 Unit!16729)))

(assert (=> b!226285 lt!360126))

(declare-fun b!226286 () Bool)

(declare-fun res!189882 () Bool)

(assert (=> b!226286 (=> (not res!189882) (not e!154648))))

(assert (=> b!226286 (= res!189882 (and (= (buf!5499 (_2!10480 lt!359664)) (buf!5499 (_2!10481 lt!360127))) (= (size!4958 (array!11303 (store (arr!5918 arr!308) i!761 (_1!10480 lt!359664)) (size!4958 arr!308))) (size!4958 (_3!791 lt!360127)))))))

(declare-fun bm!3716 () Bool)

(assert (=> bm!3716 (= call!3720 (bitIndex!0 (size!4958 (buf!5499 (_2!10480 lt!359664))) (currentByte!10307 (_2!10480 lt!359664)) (currentBit!10302 (_2!10480 lt!359664))))))

(declare-fun b!226287 () Bool)

(declare-fun lt!360119 () Unit!16694)

(assert (=> b!226287 (= e!154650 (tuple3!1299 lt!360119 (_2!10480 lt!359664) (array!11303 (store (arr!5918 arr!308) i!761 (_1!10480 lt!359664)) (size!4958 arr!308))))))

(assert (=> b!226287 (= call!3720 call!3720)))

(declare-fun lt!360130 () Unit!16694)

(declare-fun Unit!16730 () Unit!16694)

(assert (=> b!226287 (= lt!360130 Unit!16730)))

(declare-fun lt!360115 () Unit!16694)

(declare-fun arrayRangesEqReflexiveLemma!120 (array!11302) Unit!16694)

(assert (=> b!226287 (= lt!360115 (arrayRangesEqReflexiveLemma!120 (array!11303 (store (arr!5918 arr!308) i!761 (_1!10480 lt!359664)) (size!4958 arr!308))))))

(assert (=> b!226287 call!3718))

(declare-fun lt!360125 () Unit!16694)

(assert (=> b!226287 (= lt!360125 lt!360115)))

(assert (=> b!226287 (= lt!360110 (array!11303 (store (arr!5918 arr!308) i!761 (_1!10480 lt!359664)) (size!4958 arr!308)))))

(assert (=> b!226287 (= lt!360139 (array!11303 (store (arr!5918 arr!308) i!761 (_1!10480 lt!359664)) (size!4958 arr!308)))))

(declare-fun lt!360123 () (_ BitVec 32))

(assert (=> b!226287 (= lt!360123 #b00000000000000000000000000000000)))

(declare-fun lt!360111 () (_ BitVec 32))

(assert (=> b!226287 (= lt!360111 (size!4958 (array!11303 (store (arr!5918 arr!308) i!761 (_1!10480 lt!359664)) (size!4958 arr!308))))))

(assert (=> b!226287 (= lt!360132 #b00000000000000000000000000000000)))

(assert (=> b!226287 (= lt!360136 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun arrayRangesEqSlicedLemma!105 (array!11302 array!11302 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16694)

(assert (=> b!226287 (= lt!360119 (arrayRangesEqSlicedLemma!105 lt!360110 lt!360139 lt!360123 lt!360111 lt!360132 lt!360136))))

(assert (=> b!226287 call!3719))

(declare-fun d!76790 () Bool)

(declare-fun e!154649 () Bool)

(assert (=> d!76790 e!154649))

(declare-fun res!189884 () Bool)

(assert (=> d!76790 (=> res!189884 e!154649)))

(assert (=> d!76790 (= res!189884 (bvsge (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!360124 () Bool)

(assert (=> d!76790 (= lt!360124 e!154648)))

(declare-fun res!189883 () Bool)

(assert (=> d!76790 (=> (not res!189883) (not e!154648))))

(declare-fun lt!360135 () (_ BitVec 64))

(declare-fun lt!360117 () (_ BitVec 64))

(assert (=> d!76790 (= res!189883 (= (bvadd lt!360135 lt!360117) (bitIndex!0 (size!4958 (buf!5499 (_2!10481 lt!360127))) (currentByte!10307 (_2!10481 lt!360127)) (currentBit!10302 (_2!10481 lt!360127)))))))

(assert (=> d!76790 (or (not (= (bvand lt!360135 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!360117 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!360135 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!360135 lt!360117) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!360109 () (_ BitVec 64))

(assert (=> d!76790 (= lt!360117 (bvmul lt!360109 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!76790 (or (= lt!360109 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!360109 #b0000000000000000000000000000000000000000000000000000000000001000) lt!360109)))))

(assert (=> d!76790 (= lt!360109 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))))))

(assert (=> d!76790 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b10000000000000000000000000000000)))))

(assert (=> d!76790 (= lt!360135 (bitIndex!0 (size!4958 (buf!5499 (_2!10480 lt!359664))) (currentByte!10307 (_2!10480 lt!359664)) (currentBit!10302 (_2!10480 lt!359664))))))

(assert (=> d!76790 (= lt!360127 e!154650)))

(assert (=> d!76790 (= c!11167 (bvslt (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> d!76790 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) to!496) (bvsle to!496 (size!4958 (array!11303 (store (arr!5918 arr!308) i!761 (_1!10480 lt!359664)) (size!4958 arr!308)))))))

(assert (=> d!76790 (= (readByteArrayLoop!0 (_2!10480 lt!359664) (array!11303 (store (arr!5918 arr!308) i!761 (_1!10480 lt!359664)) (size!4958 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496) lt!360127)))

(declare-fun bm!3717 () Bool)

(assert (=> bm!3717 (= call!3718 (arrayRangesEq!816 (array!11303 (store (arr!5918 arr!308) i!761 (_1!10480 lt!359664)) (size!4958 arr!308)) (ite c!11167 (array!11303 (store (arr!5918 (array!11303 (store (arr!5918 arr!308) i!761 (_1!10480 lt!359664)) (size!4958 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10480 lt!360122)) (size!4958 (array!11303 (store (arr!5918 arr!308) i!761 (_1!10480 lt!359664)) (size!4958 arr!308)))) (array!11303 (store (arr!5918 arr!308) i!761 (_1!10480 lt!359664)) (size!4958 arr!308))) #b00000000000000000000000000000000 (ite c!11167 (bvadd #b00000000000000000000000000000001 i!761) (size!4958 (array!11303 (store (arr!5918 arr!308) i!761 (_1!10480 lt!359664)) (size!4958 arr!308))))))))

(declare-fun b!226288 () Bool)

(declare-datatypes ((tuple2!19392 0))(
  ( (tuple2!19393 (_1!10489 BitStream!9012) (_2!10489 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!9012) tuple2!19392)

(assert (=> b!226288 (= e!154649 (= (select (arr!5918 (_3!791 lt!360127)) (bvadd #b00000000000000000000000000000001 i!761)) (_2!10489 (readBytePure!0 (_2!10480 lt!359664)))))))

(assert (=> b!226288 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4958 (_3!791 lt!360127))))))

(assert (= (and d!76790 c!11167) b!226285))

(assert (= (and d!76790 (not c!11167)) b!226287))

(assert (= (or b!226285 b!226287) bm!3715))

(assert (= (or b!226285 b!226287) bm!3717))

(assert (= (or b!226285 b!226287) bm!3716))

(assert (= (and d!76790 res!189883) b!226286))

(assert (= (and b!226286 res!189882) b!226284))

(assert (= (and d!76790 (not res!189884)) b!226288))

(declare-fun m!347541 () Bool)

(assert (=> b!226288 m!347541))

(declare-fun m!347543 () Bool)

(assert (=> b!226288 m!347543))

(declare-fun m!347545 () Bool)

(assert (=> d!76790 m!347545))

(assert (=> d!76790 m!347367))

(assert (=> bm!3716 m!347367))

(declare-fun m!347547 () Bool)

(assert (=> b!226287 m!347547))

(declare-fun m!347549 () Bool)

(assert (=> b!226287 m!347549))

(declare-fun m!347551 () Bool)

(assert (=> bm!3715 m!347551))

(declare-fun m!347553 () Bool)

(assert (=> b!226285 m!347553))

(declare-fun m!347555 () Bool)

(assert (=> b!226285 m!347555))

(declare-fun m!347557 () Bool)

(assert (=> b!226285 m!347557))

(declare-fun m!347559 () Bool)

(assert (=> b!226285 m!347559))

(declare-fun m!347561 () Bool)

(assert (=> b!226285 m!347561))

(declare-fun m!347563 () Bool)

(assert (=> b!226285 m!347563))

(declare-fun m!347565 () Bool)

(assert (=> b!226285 m!347565))

(declare-fun m!347567 () Bool)

(assert (=> b!226285 m!347567))

(declare-fun m!347569 () Bool)

(assert (=> b!226285 m!347569))

(declare-fun m!347571 () Bool)

(assert (=> b!226285 m!347571))

(declare-fun m!347573 () Bool)

(assert (=> b!226285 m!347573))

(declare-fun m!347575 () Bool)

(assert (=> b!226285 m!347575))

(declare-fun m!347577 () Bool)

(assert (=> b!226285 m!347577))

(assert (=> bm!3717 m!347567))

(declare-fun m!347579 () Bool)

(assert (=> bm!3717 m!347579))

(declare-fun m!347581 () Bool)

(assert (=> b!226284 m!347581))

(assert (=> b!226184 d!76790))

(declare-fun d!76815 () Bool)

(declare-fun e!154651 () Bool)

(assert (=> d!76815 e!154651))

(declare-fun res!189885 () Bool)

(assert (=> d!76815 (=> (not res!189885) (not e!154651))))

(declare-fun lt!360148 () (_ BitVec 64))

(declare-fun lt!360147 () (_ BitVec 64))

(declare-fun lt!360149 () (_ BitVec 64))

(assert (=> d!76815 (= res!189885 (= lt!360149 (bvsub lt!360148 lt!360147)))))

(assert (=> d!76815 (or (= (bvand lt!360148 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!360147 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!360148 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!360148 lt!360147) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!76815 (= lt!360147 (remainingBits!0 ((_ sign_extend 32) (size!4958 (buf!5499 thiss!1870))) ((_ sign_extend 32) (currentByte!10307 thiss!1870)) ((_ sign_extend 32) (currentBit!10302 thiss!1870))))))

(declare-fun lt!360150 () (_ BitVec 64))

(declare-fun lt!360146 () (_ BitVec 64))

(assert (=> d!76815 (= lt!360148 (bvmul lt!360150 lt!360146))))

(assert (=> d!76815 (or (= lt!360150 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!360146 (bvsdiv (bvmul lt!360150 lt!360146) lt!360150)))))

(assert (=> d!76815 (= lt!360146 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76815 (= lt!360150 ((_ sign_extend 32) (size!4958 (buf!5499 thiss!1870))))))

(assert (=> d!76815 (= lt!360149 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10307 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10302 thiss!1870))))))

(assert (=> d!76815 (invariant!0 (currentBit!10302 thiss!1870) (currentByte!10307 thiss!1870) (size!4958 (buf!5499 thiss!1870)))))

(assert (=> d!76815 (= (bitIndex!0 (size!4958 (buf!5499 thiss!1870)) (currentByte!10307 thiss!1870) (currentBit!10302 thiss!1870)) lt!360149)))

(declare-fun b!226289 () Bool)

(declare-fun res!189886 () Bool)

(assert (=> b!226289 (=> (not res!189886) (not e!154651))))

(assert (=> b!226289 (= res!189886 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!360149))))

(declare-fun b!226290 () Bool)

(declare-fun lt!360145 () (_ BitVec 64))

(assert (=> b!226290 (= e!154651 (bvsle lt!360149 (bvmul lt!360145 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!226290 (or (= lt!360145 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!360145 #b0000000000000000000000000000000000000000000000000000000000001000) lt!360145)))))

(assert (=> b!226290 (= lt!360145 ((_ sign_extend 32) (size!4958 (buf!5499 thiss!1870))))))

(assert (= (and d!76815 res!189885) b!226289))

(assert (= (and b!226289 res!189886) b!226290))

(assert (=> d!76815 m!347427))

(assert (=> d!76815 m!347425))

(assert (=> b!226184 d!76815))

(declare-fun d!76817 () Bool)

(declare-fun e!154654 () Bool)

(assert (=> d!76817 e!154654))

(declare-fun res!189889 () Bool)

(assert (=> d!76817 (=> (not res!189889) (not e!154654))))

(assert (=> d!76817 (= res!189889 (and (or (let ((rhs!3866 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3866 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3866) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!76818 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!76818 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!76818 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3865 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3865 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3865) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!360158 () Unit!16694)

(declare-fun choose!57 (BitStream!9012 BitStream!9012 (_ BitVec 64) (_ BitVec 32)) Unit!16694)

(assert (=> d!76817 (= lt!360158 (choose!57 thiss!1870 (_2!10480 lt!359664) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> d!76817 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10480 lt!359664) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)) lt!360158)))

(declare-fun lt!360157 () (_ BitVec 32))

(declare-fun b!226293 () Bool)

(assert (=> b!226293 (= e!154654 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4958 (buf!5499 (_2!10480 lt!359664)))) ((_ sign_extend 32) (currentByte!10307 (_2!10480 lt!359664))) ((_ sign_extend 32) (currentBit!10302 (_2!10480 lt!359664))) (bvsub (bvsub to!496 i!761) lt!360157)))))

(assert (=> b!226293 (or (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand lt!360157 #b10000000000000000000000000000000)) (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!496 i!761) lt!360157) #b10000000000000000000000000000000)))))

(declare-fun lt!360159 () (_ BitVec 64))

(assert (=> b!226293 (= lt!360157 ((_ extract 31 0) lt!360159))))

(assert (=> b!226293 (and (bvslt lt!360159 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!360159 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!226293 (= lt!360159 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!76817 res!189889) b!226293))

(declare-fun m!347583 () Bool)

(assert (=> d!76817 m!347583))

(declare-fun m!347585 () Bool)

(assert (=> b!226293 m!347585))

(assert (=> b!226184 d!76817))

(declare-fun d!76820 () Bool)

(assert (=> d!76820 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4958 (buf!5499 (_2!10480 lt!359664)))) ((_ sign_extend 32) (currentByte!10307 (_2!10480 lt!359664))) ((_ sign_extend 32) (currentBit!10302 (_2!10480 lt!359664))) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4958 (buf!5499 (_2!10480 lt!359664)))) ((_ sign_extend 32) (currentByte!10307 (_2!10480 lt!359664))) ((_ sign_extend 32) (currentBit!10302 (_2!10480 lt!359664)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18773 () Bool)

(assert (= bs!18773 d!76820))

(assert (=> bs!18773 m!347433))

(assert (=> b!226184 d!76820))

(check-sat (not d!76780) (not b!226285) (not b!226284) (not bm!3715) (not b!226287) (not b!226288) (not d!76782) (not d!76788) (not bm!3716) (not d!76815) (not d!76790) (not b!226293) (not d!76817) (not b!226230) (not d!76820) (not d!76784) (not bm!3717))
(check-sat)
