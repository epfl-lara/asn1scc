; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46628 () Bool)

(assert start!46628)

(declare-fun b!223726 () Bool)

(declare-fun res!187816 () Bool)

(declare-fun e!152301 () Bool)

(assert (=> b!223726 (=> (not res!187816) (not e!152301))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!223726 (= res!187816 (bvslt i!761 to!496))))

(declare-fun b!223727 () Bool)

(declare-datatypes ((array!10989 0))(
  ( (array!10990 (arr!5764 (Array (_ BitVec 32) (_ BitVec 8))) (size!4819 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8740 0))(
  ( (BitStream!8741 (buf!5363 array!10989) (currentByte!10082 (_ BitVec 32)) (currentBit!10077 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!16274 0))(
  ( (Unit!16275) )
))
(declare-datatypes ((tuple3!1164 0))(
  ( (tuple3!1165 (_1!10281 Unit!16274) (_2!10281 BitStream!8740) (_3!724 array!10989)) )
))
(declare-fun lt!354373 () tuple3!1164)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!223727 (= e!152301 (not (invariant!0 (currentBit!10077 (_2!10281 lt!354373)) (currentByte!10082 (_2!10281 lt!354373)) (size!4819 (buf!5363 (_2!10281 lt!354373))))))))

(declare-fun e!152303 () Bool)

(assert (=> b!223727 e!152303))

(declare-fun res!187815 () Bool)

(assert (=> b!223727 (=> (not res!187815) (not e!152303))))

(declare-fun lt!354376 () (_ BitVec 64))

(declare-fun lt!354378 () (_ BitVec 64))

(assert (=> b!223727 (= res!187815 (= lt!354376 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!354378)))))

(declare-datatypes ((tuple2!19114 0))(
  ( (tuple2!19115 (_1!10282 (_ BitVec 8)) (_2!10282 BitStream!8740)) )
))
(declare-fun lt!354375 () tuple2!19114)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!223727 (= lt!354376 (bitIndex!0 (size!4819 (buf!5363 (_2!10282 lt!354375))) (currentByte!10082 (_2!10282 lt!354375)) (currentBit!10077 (_2!10282 lt!354375))))))

(declare-fun thiss!1870 () BitStream!8740)

(assert (=> b!223727 (= lt!354378 (bitIndex!0 (size!4819 (buf!5363 thiss!1870)) (currentByte!10082 thiss!1870) (currentBit!10077 thiss!1870)))))

(declare-fun arr!308 () array!10989)

(declare-fun readByteArrayLoop!0 (BitStream!8740 array!10989 (_ BitVec 32) (_ BitVec 32)) tuple3!1164)

(assert (=> b!223727 (= lt!354373 (readByteArrayLoop!0 (_2!10282 lt!354375) (array!10990 (store (arr!5764 arr!308) i!761 (_1!10282 lt!354375)) (size!4819 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!354377 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!223727 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4819 (buf!5363 (_2!10282 lt!354375)))) ((_ sign_extend 32) (currentByte!10082 (_2!10282 lt!354375))) ((_ sign_extend 32) (currentBit!10077 (_2!10282 lt!354375))) lt!354377)))

(assert (=> b!223727 (= lt!354377 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!354374 () Unit!16274)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8740 BitStream!8740 (_ BitVec 64) (_ BitVec 32)) Unit!16274)

(assert (=> b!223727 (= lt!354374 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10282 lt!354375) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!8740) tuple2!19114)

(assert (=> b!223727 (= lt!354375 (readByte!0 thiss!1870))))

(declare-fun b!223728 () Bool)

(assert (=> b!223728 (= e!152303 (= (bvadd lt!354376 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!354377))) (bitIndex!0 (size!4819 (buf!5363 (_2!10281 lt!354373))) (currentByte!10082 (_2!10281 lt!354373)) (currentBit!10077 (_2!10281 lt!354373)))))))

(declare-fun b!223729 () Bool)

(declare-fun res!187817 () Bool)

(assert (=> b!223729 (=> (not res!187817) (not e!152301))))

(assert (=> b!223729 (= res!187817 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4819 (buf!5363 thiss!1870))) ((_ sign_extend 32) (currentByte!10082 thiss!1870)) ((_ sign_extend 32) (currentBit!10077 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun res!187818 () Bool)

(assert (=> start!46628 (=> (not res!187818) (not e!152301))))

(assert (=> start!46628 (= res!187818 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4819 arr!308))))))

(assert (=> start!46628 e!152301))

(assert (=> start!46628 true))

(declare-fun array_inv!4560 (array!10989) Bool)

(assert (=> start!46628 (array_inv!4560 arr!308)))

(declare-fun e!152300 () Bool)

(declare-fun inv!12 (BitStream!8740) Bool)

(assert (=> start!46628 (and (inv!12 thiss!1870) e!152300)))

(declare-fun b!223730 () Bool)

(assert (=> b!223730 (= e!152300 (array_inv!4560 (buf!5363 thiss!1870)))))

(assert (= (and start!46628 res!187818) b!223729))

(assert (= (and b!223729 res!187817) b!223726))

(assert (= (and b!223726 res!187816) b!223727))

(assert (= (and b!223727 res!187815) b!223728))

(assert (= start!46628 b!223730))

(declare-fun m!342941 () Bool)

(assert (=> start!46628 m!342941))

(declare-fun m!342943 () Bool)

(assert (=> start!46628 m!342943))

(declare-fun m!342945 () Bool)

(assert (=> b!223730 m!342945))

(declare-fun m!342947 () Bool)

(assert (=> b!223727 m!342947))

(declare-fun m!342949 () Bool)

(assert (=> b!223727 m!342949))

(declare-fun m!342951 () Bool)

(assert (=> b!223727 m!342951))

(declare-fun m!342953 () Bool)

(assert (=> b!223727 m!342953))

(declare-fun m!342955 () Bool)

(assert (=> b!223727 m!342955))

(declare-fun m!342957 () Bool)

(assert (=> b!223727 m!342957))

(declare-fun m!342959 () Bool)

(assert (=> b!223727 m!342959))

(declare-fun m!342961 () Bool)

(assert (=> b!223727 m!342961))

(declare-fun m!342963 () Bool)

(assert (=> b!223728 m!342963))

(declare-fun m!342965 () Bool)

(assert (=> b!223729 m!342965))

(push 1)

(assert (not b!223730))

(assert (not b!223728))

(assert (not start!46628))

(assert (not b!223727))

(assert (not b!223729))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!75941 () Bool)

(assert (=> d!75941 (= (array_inv!4560 (buf!5363 thiss!1870)) (bvsge (size!4819 (buf!5363 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!223730 d!75941))

(declare-fun d!75943 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!75943 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4819 (buf!5363 thiss!1870))) ((_ sign_extend 32) (currentByte!10082 thiss!1870)) ((_ sign_extend 32) (currentBit!10077 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4819 (buf!5363 thiss!1870))) ((_ sign_extend 32) (currentByte!10082 thiss!1870)) ((_ sign_extend 32) (currentBit!10077 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18506 () Bool)

(assert (= bs!18506 d!75943))

(declare-fun m!343035 () Bool)

(assert (=> bs!18506 m!343035))

(assert (=> b!223729 d!75943))

(declare-fun d!75945 () Bool)

(assert (=> d!75945 (= (array_inv!4560 arr!308) (bvsge (size!4819 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!46628 d!75945))

(declare-fun d!75947 () Bool)

(assert (=> d!75947 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10077 thiss!1870) (currentByte!10082 thiss!1870) (size!4819 (buf!5363 thiss!1870))))))

(declare-fun bs!18507 () Bool)

(assert (= bs!18507 d!75947))

(declare-fun m!343037 () Bool)

(assert (=> bs!18507 m!343037))

(assert (=> start!46628 d!75947))

(declare-fun d!75949 () Bool)

(declare-fun e!152356 () Bool)

(assert (=> d!75949 e!152356))

(declare-fun res!187874 () Bool)

(assert (=> d!75949 (=> (not res!187874) (not e!152356))))

(declare-fun lt!354508 () (_ BitVec 64))

(declare-fun lt!354511 () (_ BitVec 64))

(declare-fun lt!354513 () (_ BitVec 64))

(assert (=> d!75949 (= res!187874 (= lt!354511 (bvsub lt!354508 lt!354513)))))

(assert (=> d!75949 (or (= (bvand lt!354508 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!354513 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!354508 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!354508 lt!354513) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75949 (= lt!354513 (remainingBits!0 ((_ sign_extend 32) (size!4819 (buf!5363 (_2!10281 lt!354373)))) ((_ sign_extend 32) (currentByte!10082 (_2!10281 lt!354373))) ((_ sign_extend 32) (currentBit!10077 (_2!10281 lt!354373)))))))

(declare-fun lt!354512 () (_ BitVec 64))

(declare-fun lt!354509 () (_ BitVec 64))

(assert (=> d!75949 (= lt!354508 (bvmul lt!354512 lt!354509))))

(assert (=> d!75949 (or (= lt!354512 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!354509 (bvsdiv (bvmul lt!354512 lt!354509) lt!354512)))))

(assert (=> d!75949 (= lt!354509 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!75949 (= lt!354512 ((_ sign_extend 32) (size!4819 (buf!5363 (_2!10281 lt!354373)))))))

(assert (=> d!75949 (= lt!354511 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10082 (_2!10281 lt!354373))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10077 (_2!10281 lt!354373)))))))

(assert (=> d!75949 (invariant!0 (currentBit!10077 (_2!10281 lt!354373)) (currentByte!10082 (_2!10281 lt!354373)) (size!4819 (buf!5363 (_2!10281 lt!354373))))))

(assert (=> d!75949 (= (bitIndex!0 (size!4819 (buf!5363 (_2!10281 lt!354373))) (currentByte!10082 (_2!10281 lt!354373)) (currentBit!10077 (_2!10281 lt!354373))) lt!354511)))

(declare-fun b!223790 () Bool)

(declare-fun res!187875 () Bool)

(assert (=> b!223790 (=> (not res!187875) (not e!152356))))

(assert (=> b!223790 (= res!187875 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!354511))))

(declare-fun b!223791 () Bool)

(declare-fun lt!354510 () (_ BitVec 64))

(assert (=> b!223791 (= e!152356 (bvsle lt!354511 (bvmul lt!354510 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!223791 (or (= lt!354510 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!354510 #b0000000000000000000000000000000000000000000000000000000000001000) lt!354510)))))

(assert (=> b!223791 (= lt!354510 ((_ sign_extend 32) (size!4819 (buf!5363 (_2!10281 lt!354373)))))))

(assert (= (and d!75949 res!187874) b!223790))

(assert (= (and b!223790 res!187875) b!223791))

(declare-fun m!343053 () Bool)

(assert (=> d!75949 m!343053))

(assert (=> d!75949 m!342953))

(assert (=> b!223728 d!75949))

(declare-fun d!75961 () Bool)

(declare-fun e!152357 () Bool)

(assert (=> d!75961 e!152357))

(declare-fun res!187876 () Bool)

(assert (=> d!75961 (=> (not res!187876) (not e!152357))))

(declare-fun lt!354517 () (_ BitVec 64))

(declare-fun lt!354519 () (_ BitVec 64))

(declare-fun lt!354514 () (_ BitVec 64))

(assert (=> d!75961 (= res!187876 (= lt!354517 (bvsub lt!354514 lt!354519)))))

(assert (=> d!75961 (or (= (bvand lt!354514 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!354519 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!354514 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!354514 lt!354519) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75961 (= lt!354519 (remainingBits!0 ((_ sign_extend 32) (size!4819 (buf!5363 (_2!10282 lt!354375)))) ((_ sign_extend 32) (currentByte!10082 (_2!10282 lt!354375))) ((_ sign_extend 32) (currentBit!10077 (_2!10282 lt!354375)))))))

(declare-fun lt!354518 () (_ BitVec 64))

(declare-fun lt!354515 () (_ BitVec 64))

(assert (=> d!75961 (= lt!354514 (bvmul lt!354518 lt!354515))))

(assert (=> d!75961 (or (= lt!354518 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!354515 (bvsdiv (bvmul lt!354518 lt!354515) lt!354518)))))

(assert (=> d!75961 (= lt!354515 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!75961 (= lt!354518 ((_ sign_extend 32) (size!4819 (buf!5363 (_2!10282 lt!354375)))))))

(assert (=> d!75961 (= lt!354517 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10082 (_2!10282 lt!354375))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10077 (_2!10282 lt!354375)))))))

(assert (=> d!75961 (invariant!0 (currentBit!10077 (_2!10282 lt!354375)) (currentByte!10082 (_2!10282 lt!354375)) (size!4819 (buf!5363 (_2!10282 lt!354375))))))

(assert (=> d!75961 (= (bitIndex!0 (size!4819 (buf!5363 (_2!10282 lt!354375))) (currentByte!10082 (_2!10282 lt!354375)) (currentBit!10077 (_2!10282 lt!354375))) lt!354517)))

(declare-fun b!223792 () Bool)

(declare-fun res!187877 () Bool)

(assert (=> b!223792 (=> (not res!187877) (not e!152357))))

(assert (=> b!223792 (= res!187877 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!354517))))

(declare-fun b!223793 () Bool)

(declare-fun lt!354516 () (_ BitVec 64))

(assert (=> b!223793 (= e!152357 (bvsle lt!354517 (bvmul lt!354516 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!223793 (or (= lt!354516 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!354516 #b0000000000000000000000000000000000000000000000000000000000001000) lt!354516)))))

(assert (=> b!223793 (= lt!354516 ((_ sign_extend 32) (size!4819 (buf!5363 (_2!10282 lt!354375)))))))

(assert (= (and d!75961 res!187876) b!223792))

(assert (= (and b!223792 res!187877) b!223793))

(declare-fun m!343055 () Bool)

(assert (=> d!75961 m!343055))

(declare-fun m!343057 () Bool)

(assert (=> d!75961 m!343057))

(assert (=> b!223727 d!75961))

(declare-fun d!75963 () Bool)

(declare-fun e!152360 () Bool)

(assert (=> d!75963 e!152360))

(declare-fun res!187880 () Bool)

(assert (=> d!75963 (=> (not res!187880) (not e!152360))))

(assert (=> d!75963 (= res!187880 (and (or (let ((rhs!3718 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3718 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3718) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!75964 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!75964 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!75964 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3717 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3717 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3717) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!354526 () Unit!16274)

(declare-fun choose!57 (BitStream!8740 BitStream!8740 (_ BitVec 64) (_ BitVec 32)) Unit!16274)

(assert (=> d!75963 (= lt!354526 (choose!57 thiss!1870 (_2!10282 lt!354375) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> d!75963 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10282 lt!354375) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)) lt!354526)))

(declare-fun lt!354527 () (_ BitVec 32))

(declare-fun b!223796 () Bool)

(assert (=> b!223796 (= e!152360 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4819 (buf!5363 (_2!10282 lt!354375)))) ((_ sign_extend 32) (currentByte!10082 (_2!10282 lt!354375))) ((_ sign_extend 32) (currentBit!10077 (_2!10282 lt!354375))) (bvsub (bvsub to!496 i!761) lt!354527)))))

(assert (=> b!223796 (or (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand lt!354527 #b10000000000000000000000000000000)) (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!496 i!761) lt!354527) #b10000000000000000000000000000000)))))

(declare-fun lt!354528 () (_ BitVec 64))

(assert (=> b!223796 (= lt!354527 ((_ extract 31 0) lt!354528))))

(assert (=> b!223796 (and (bvslt lt!354528 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!354528 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!223796 (= lt!354528 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!75963 res!187880) b!223796))

(declare-fun m!343059 () Bool)

(assert (=> d!75963 m!343059))

(declare-fun m!343061 () Bool)

(assert (=> b!223796 m!343061))

(assert (=> b!223727 d!75963))

(declare-fun d!75966 () Bool)

(declare-fun lt!354546 () (_ BitVec 8))

(declare-fun lt!354543 () (_ BitVec 8))

(assert (=> d!75966 (= lt!354546 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5764 (buf!5363 thiss!1870)) (currentByte!10082 thiss!1870))) ((_ sign_extend 24) lt!354543))))))

(assert (=> d!75966 (= lt!354543 ((_ extract 7 0) (currentBit!10077 thiss!1870)))))

(declare-fun e!152366 () Bool)

(assert (=> d!75966 e!152366))

(declare-fun res!187886 () Bool)

(assert (=> d!75966 (=> (not res!187886) (not e!152366))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!75966 (= res!187886 (validate_offset_bits!1 ((_ sign_extend 32) (size!4819 (buf!5363 thiss!1870))) ((_ sign_extend 32) (currentByte!10082 thiss!1870)) ((_ sign_extend 32) (currentBit!10077 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!19128 0))(
  ( (tuple2!19129 (_1!10291 Unit!16274) (_2!10291 (_ BitVec 8))) )
))
(declare-fun Unit!16302 () Unit!16274)

(declare-fun Unit!16303 () Unit!16274)

(assert (=> d!75966 (= (readByte!0 thiss!1870) (tuple2!19115 (_2!10291 (ite (bvsgt ((_ sign_extend 24) lt!354543) #b00000000000000000000000000000000) (tuple2!19129 Unit!16302 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!354546) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5764 (buf!5363 thiss!1870)) (bvadd (currentByte!10082 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!354543)))))))) (tuple2!19129 Unit!16303 lt!354546))) (BitStream!8741 (buf!5363 thiss!1870) (bvadd (currentByte!10082 thiss!1870) #b00000000000000000000000000000001) (currentBit!10077 thiss!1870))))))

(declare-fun b!223801 () Bool)

(declare-fun e!152365 () Bool)

(assert (=> b!223801 (= e!152366 e!152365)))

(declare-fun res!187887 () Bool)

(assert (=> b!223801 (=> (not res!187887) (not e!152365))))

(declare-fun lt!354548 () tuple2!19114)

(assert (=> b!223801 (= res!187887 (= (buf!5363 (_2!10282 lt!354548)) (buf!5363 thiss!1870)))))

(declare-fun lt!354547 () (_ BitVec 8))

(declare-fun lt!354545 () (_ BitVec 8))

(declare-fun Unit!16304 () Unit!16274)

(declare-fun Unit!16305 () Unit!16274)

(assert (=> b!223801 (= lt!354548 (tuple2!19115 (_2!10291 (ite (bvsgt ((_ sign_extend 24) lt!354547) #b00000000000000000000000000000000) (tuple2!19129 Unit!16304 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!354545) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5764 (buf!5363 thiss!1870)) (bvadd (currentByte!10082 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!354547)))))))) (tuple2!19129 Unit!16305 lt!354545))) (BitStream!8741 (buf!5363 thiss!1870) (bvadd (currentByte!10082 thiss!1870) #b00000000000000000000000000000001) (currentBit!10077 thiss!1870))))))

(assert (=> b!223801 (= lt!354545 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5764 (buf!5363 thiss!1870)) (currentByte!10082 thiss!1870))) ((_ sign_extend 24) lt!354547))))))

(assert (=> b!223801 (= lt!354547 ((_ extract 7 0) (currentBit!10077 thiss!1870)))))

(declare-fun lt!354549 () (_ BitVec 64))

(declare-fun b!223802 () Bool)

(declare-fun lt!354544 () (_ BitVec 64))

(assert (=> b!223802 (= e!152365 (= (bitIndex!0 (size!4819 (buf!5363 (_2!10282 lt!354548))) (currentByte!10082 (_2!10282 lt!354548)) (currentBit!10077 (_2!10282 lt!354548))) (bvadd lt!354549 lt!354544)))))

(assert (=> b!223802 (or (not (= (bvand lt!354549 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!354544 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!354549 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!354549 lt!354544) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!223802 (= lt!354544 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!223802 (= lt!354549 (bitIndex!0 (size!4819 (buf!5363 thiss!1870)) (currentByte!10082 thiss!1870) (currentBit!10077 thiss!1870)))))

(assert (= (and d!75966 res!187886) b!223801))

(assert (= (and b!223801 res!187887) b!223802))

(declare-fun m!343063 () Bool)

(assert (=> d!75966 m!343063))

(declare-fun m!343065 () Bool)

(assert (=> d!75966 m!343065))

(declare-fun m!343067 () Bool)

(assert (=> d!75966 m!343067))

(assert (=> b!223801 m!343067))

(assert (=> b!223801 m!343063))

(declare-fun m!343069 () Bool)

(assert (=> b!223802 m!343069))

(assert (=> b!223802 m!342961))

(assert (=> b!223727 d!75966))

(declare-fun e!152401 () Bool)

(declare-fun b!223856 () Bool)

(declare-fun lt!354900 () tuple3!1164)

(declare-datatypes ((tuple2!19130 0))(
  ( (tuple2!19131 (_1!10292 BitStream!8740) (_2!10292 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!8740) tuple2!19130)

(assert (=> b!223856 (= e!152401 (= (select (arr!5764 (_3!724 lt!354900)) (bvadd #b00000000000000000000000000000001 i!761)) (_2!10292 (readBytePure!0 (_2!10282 lt!354375)))))))

(assert (=> b!223856 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4819 (_3!724 lt!354900))))))

(declare-fun lt!354887 () Unit!16274)

(declare-fun b!223857 () Bool)

(declare-fun e!152399 () tuple3!1164)

(assert (=> b!223857 (= e!152399 (tuple3!1165 lt!354887 (_2!10282 lt!354375) (array!10990 (store (arr!5764 arr!308) i!761 (_1!10282 lt!354375)) (size!4819 arr!308))))))

(declare-fun call!3584 () (_ BitVec 64))

(assert (=> b!223857 (= call!3584 call!3584)))

(declare-fun lt!354910 () Unit!16274)

(declare-fun Unit!16306 () Unit!16274)

(assert (=> b!223857 (= lt!354910 Unit!16306)))

(declare-fun lt!354881 () Unit!16274)

(declare-fun arrayRangesEqReflexiveLemma!73 (array!10989) Unit!16274)

(assert (=> b!223857 (= lt!354881 (arrayRangesEqReflexiveLemma!73 (array!10990 (store (arr!5764 arr!308) i!761 (_1!10282 lt!354375)) (size!4819 arr!308))))))

(declare-fun call!3585 () Bool)

(assert (=> b!223857 call!3585))

(declare-fun lt!354890 () Unit!16274)

(assert (=> b!223857 (= lt!354890 lt!354881)))

(declare-fun lt!354902 () array!10989)

(assert (=> b!223857 (= lt!354902 (array!10990 (store (arr!5764 arr!308) i!761 (_1!10282 lt!354375)) (size!4819 arr!308)))))

(declare-fun lt!354912 () array!10989)

(assert (=> b!223857 (= lt!354912 (array!10990 (store (arr!5764 arr!308) i!761 (_1!10282 lt!354375)) (size!4819 arr!308)))))

(declare-fun lt!354889 () (_ BitVec 32))

(assert (=> b!223857 (= lt!354889 #b00000000000000000000000000000000)))

(declare-fun lt!354897 () (_ BitVec 32))

(assert (=> b!223857 (= lt!354897 (size!4819 (array!10990 (store (arr!5764 arr!308) i!761 (_1!10282 lt!354375)) (size!4819 arr!308))))))

(declare-fun lt!354886 () (_ BitVec 32))

(assert (=> b!223857 (= lt!354886 #b00000000000000000000000000000000)))

(declare-fun lt!354883 () (_ BitVec 32))

(assert (=> b!223857 (= lt!354883 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun arrayRangesEqSlicedLemma!73 (array!10989 array!10989 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16274)

(assert (=> b!223857 (= lt!354887 (arrayRangesEqSlicedLemma!73 lt!354902 lt!354912 lt!354889 lt!354897 lt!354886 lt!354883))))

(declare-fun call!3583 () Bool)

(assert (=> b!223857 call!3583))

(declare-fun d!75968 () Bool)

(assert (=> d!75968 e!152401))

(declare-fun res!187926 () Bool)

(assert (=> d!75968 (=> res!187926 e!152401)))

(assert (=> d!75968 (= res!187926 (bvsge (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!354907 () Bool)

(declare-fun e!152400 () Bool)

(assert (=> d!75968 (= lt!354907 e!152400)))

(declare-fun res!187925 () Bool)

(assert (=> d!75968 (=> (not res!187925) (not e!152400))))

(declare-fun lt!354884 () (_ BitVec 64))

(declare-fun lt!354882 () (_ BitVec 64))

(assert (=> d!75968 (= res!187925 (= (bvadd lt!354884 lt!354882) (bitIndex!0 (size!4819 (buf!5363 (_2!10281 lt!354900))) (currentByte!10082 (_2!10281 lt!354900)) (currentBit!10077 (_2!10281 lt!354900)))))))

(assert (=> d!75968 (or (not (= (bvand lt!354884 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!354882 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!354884 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!354884 lt!354882) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!354898 () (_ BitVec 64))

(assert (=> d!75968 (= lt!354882 (bvmul lt!354898 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!75968 (or (= lt!354898 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!354898 #b0000000000000000000000000000000000000000000000000000000000001000) lt!354898)))))

(assert (=> d!75968 (= lt!354898 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))))))

(assert (=> d!75968 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b10000000000000000000000000000000)))))

(assert (=> d!75968 (= lt!354884 (bitIndex!0 (size!4819 (buf!5363 (_2!10282 lt!354375))) (currentByte!10082 (_2!10282 lt!354375)) (currentBit!10077 (_2!10282 lt!354375))))))

(assert (=> d!75968 (= lt!354900 e!152399)))

(declare-fun c!11122 () Bool)

(assert (=> d!75968 (= c!11122 (bvslt (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> d!75968 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) to!496) (bvsle to!496 (size!4819 (array!10990 (store (arr!5764 arr!308) i!761 (_1!10282 lt!354375)) (size!4819 arr!308)))))))

(assert (=> d!75968 (= (readByteArrayLoop!0 (_2!10282 lt!354375) (array!10990 (store (arr!5764 arr!308) i!761 (_1!10282 lt!354375)) (size!4819 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496) lt!354900)))

(declare-fun lt!354904 () tuple3!1164)

(declare-fun lt!354892 () (_ BitVec 32))

(declare-fun bm!3580 () Bool)

(declare-fun arrayRangesEq!720 (array!10989 array!10989 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!3580 (= call!3583 (arrayRangesEq!720 (ite c!11122 (array!10990 (store (arr!5764 arr!308) i!761 (_1!10282 lt!354375)) (size!4819 arr!308)) lt!354902) (ite c!11122 (_3!724 lt!354904) lt!354912) (ite c!11122 lt!354892 lt!354886) (ite c!11122 (bvadd #b00000000000000000000000000000001 i!761) lt!354883)))))

(declare-fun b!223858 () Bool)

(assert (=> b!223858 (= e!152400 (arrayRangesEq!720 (array!10990 (store (arr!5764 arr!308) i!761 (_1!10282 lt!354375)) (size!4819 arr!308)) (_3!724 lt!354900) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun bm!3581 () Bool)

(declare-fun lt!354888 () tuple2!19114)

(assert (=> bm!3581 (= call!3584 (bitIndex!0 (ite c!11122 (size!4819 (buf!5363 (_2!10282 lt!354888))) (size!4819 (buf!5363 (_2!10282 lt!354375)))) (ite c!11122 (currentByte!10082 (_2!10282 lt!354888)) (currentByte!10082 (_2!10282 lt!354375))) (ite c!11122 (currentBit!10077 (_2!10282 lt!354888)) (currentBit!10077 (_2!10282 lt!354375)))))))

(declare-fun b!223859 () Bool)

(declare-fun lt!354901 () Unit!16274)

(assert (=> b!223859 (= e!152399 (tuple3!1165 lt!354901 (_2!10281 lt!354904) (_3!724 lt!354904)))))

(assert (=> b!223859 (= lt!354888 (readByte!0 (_2!10282 lt!354375)))))

(declare-fun lt!354878 () array!10989)

(assert (=> b!223859 (= lt!354878 (array!10990 (store (arr!5764 (array!10990 (store (arr!5764 arr!308) i!761 (_1!10282 lt!354375)) (size!4819 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10282 lt!354888)) (size!4819 (array!10990 (store (arr!5764 arr!308) i!761 (_1!10282 lt!354375)) (size!4819 arr!308)))))))

(declare-fun lt!354899 () (_ BitVec 64))

(assert (=> b!223859 (= lt!354899 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!354880 () (_ BitVec 32))

(assert (=> b!223859 (= lt!354880 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!354896 () Unit!16274)

(assert (=> b!223859 (= lt!354896 (validateOffsetBytesFromBitIndexLemma!0 (_2!10282 lt!354375) (_2!10282 lt!354888) lt!354899 lt!354880))))

(assert (=> b!223859 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4819 (buf!5363 (_2!10282 lt!354888)))) ((_ sign_extend 32) (currentByte!10082 (_2!10282 lt!354888))) ((_ sign_extend 32) (currentBit!10077 (_2!10282 lt!354888))) (bvsub lt!354880 ((_ extract 31 0) (bvsdiv (bvadd lt!354899 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!354893 () Unit!16274)

(assert (=> b!223859 (= lt!354893 lt!354896)))

(assert (=> b!223859 (= lt!354904 (readByteArrayLoop!0 (_2!10282 lt!354888) lt!354878 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(assert (=> b!223859 (= call!3584 (bvadd (bitIndex!0 (size!4819 (buf!5363 (_2!10282 lt!354375))) (currentByte!10082 (_2!10282 lt!354375)) (currentBit!10077 (_2!10282 lt!354375))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!354905 () Unit!16274)

(declare-fun Unit!16307 () Unit!16274)

(assert (=> b!223859 (= lt!354905 Unit!16307)))

(assert (=> b!223859 (= (bvadd call!3584 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4819 (buf!5363 (_2!10281 lt!354904))) (currentByte!10082 (_2!10281 lt!354904)) (currentBit!10077 (_2!10281 lt!354904))))))

(declare-fun lt!354879 () Unit!16274)

(declare-fun Unit!16308 () Unit!16274)

(assert (=> b!223859 (= lt!354879 Unit!16308)))

(assert (=> b!223859 (= (bvadd (bitIndex!0 (size!4819 (buf!5363 (_2!10282 lt!354375))) (currentByte!10082 (_2!10282 lt!354375)) (currentBit!10077 (_2!10282 lt!354375))) (bvmul ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4819 (buf!5363 (_2!10281 lt!354904))) (currentByte!10082 (_2!10281 lt!354904)) (currentBit!10077 (_2!10281 lt!354904))))))

(declare-fun lt!354895 () Unit!16274)

(declare-fun Unit!16309 () Unit!16274)

(assert (=> b!223859 (= lt!354895 Unit!16309)))

(assert (=> b!223859 (and (= (buf!5363 (_2!10282 lt!354375)) (buf!5363 (_2!10281 lt!354904))) (= (size!4819 (array!10990 (store (arr!5764 arr!308) i!761 (_1!10282 lt!354375)) (size!4819 arr!308))) (size!4819 (_3!724 lt!354904))))))

(declare-fun lt!354885 () Unit!16274)

(declare-fun Unit!16310 () Unit!16274)

(assert (=> b!223859 (= lt!354885 Unit!16310)))

(declare-fun lt!354906 () Unit!16274)

(declare-fun arrayUpdatedAtPrefixLemma!312 (array!10989 (_ BitVec 32) (_ BitVec 8)) Unit!16274)

(assert (=> b!223859 (= lt!354906 (arrayUpdatedAtPrefixLemma!312 (array!10990 (store (arr!5764 arr!308) i!761 (_1!10282 lt!354375)) (size!4819 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) (_1!10282 lt!354888)))))

(assert (=> b!223859 (arrayRangesEq!720 (array!10990 (store (arr!5764 arr!308) i!761 (_1!10282 lt!354375)) (size!4819 arr!308)) (array!10990 (store (arr!5764 (array!10990 (store (arr!5764 arr!308) i!761 (_1!10282 lt!354375)) (size!4819 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10282 lt!354888)) (size!4819 (array!10990 (store (arr!5764 arr!308) i!761 (_1!10282 lt!354375)) (size!4819 arr!308)))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun lt!354911 () Unit!16274)

(assert (=> b!223859 (= lt!354911 lt!354906)))

(assert (=> b!223859 (= lt!354892 #b00000000000000000000000000000000)))

(declare-fun lt!354891 () Unit!16274)

(declare-fun arrayRangesEqTransitive!206 (array!10989 array!10989 array!10989 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16274)

(assert (=> b!223859 (= lt!354891 (arrayRangesEqTransitive!206 (array!10990 (store (arr!5764 arr!308) i!761 (_1!10282 lt!354375)) (size!4819 arr!308)) lt!354878 (_3!724 lt!354904) lt!354892 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!223859 call!3583))

(declare-fun lt!354877 () Unit!16274)

(assert (=> b!223859 (= lt!354877 lt!354891)))

(assert (=> b!223859 call!3585))

(declare-fun lt!354894 () Unit!16274)

(declare-fun Unit!16311 () Unit!16274)

(assert (=> b!223859 (= lt!354894 Unit!16311)))

(declare-fun lt!354909 () Unit!16274)

(declare-fun arrayRangesEqImpliesEq!81 (array!10989 array!10989 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16274)

(assert (=> b!223859 (= lt!354909 (arrayRangesEqImpliesEq!81 lt!354878 (_3!724 lt!354904) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!223859 (= (select (store (arr!5764 (array!10990 (store (arr!5764 arr!308) i!761 (_1!10282 lt!354375)) (size!4819 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10282 lt!354888)) (bvadd #b00000000000000000000000000000001 i!761)) (select (arr!5764 (_3!724 lt!354904)) (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!354908 () Unit!16274)

(assert (=> b!223859 (= lt!354908 lt!354909)))

(declare-fun lt!354903 () Bool)

(assert (=> b!223859 (= lt!354903 (= (select (arr!5764 (_3!724 lt!354904)) (bvadd #b00000000000000000000000000000001 i!761)) (_1!10282 lt!354888)))))

(declare-fun Unit!16312 () Unit!16274)

(assert (=> b!223859 (= lt!354901 Unit!16312)))

(assert (=> b!223859 lt!354903))

(declare-fun b!223860 () Bool)

(declare-fun res!187927 () Bool)

(assert (=> b!223860 (=> (not res!187927) (not e!152400))))

(assert (=> b!223860 (= res!187927 (and (= (buf!5363 (_2!10282 lt!354375)) (buf!5363 (_2!10281 lt!354900))) (= (size!4819 (array!10990 (store (arr!5764 arr!308) i!761 (_1!10282 lt!354375)) (size!4819 arr!308))) (size!4819 (_3!724 lt!354900)))))))

(declare-fun bm!3582 () Bool)

(assert (=> bm!3582 (= call!3585 (arrayRangesEq!720 (array!10990 (store (arr!5764 arr!308) i!761 (_1!10282 lt!354375)) (size!4819 arr!308)) (ite c!11122 (_3!724 lt!354904) (array!10990 (store (arr!5764 arr!308) i!761 (_1!10282 lt!354375)) (size!4819 arr!308))) #b00000000000000000000000000000000 (ite c!11122 (bvadd #b00000000000000000000000000000001 i!761) (size!4819 (array!10990 (store (arr!5764 arr!308) i!761 (_1!10282 lt!354375)) (size!4819 arr!308))))))))

(assert (= (and d!75968 c!11122) b!223859))

(assert (= (and d!75968 (not c!11122)) b!223857))

(assert (= (or b!223859 b!223857) bm!3580))

(assert (= (or b!223859 b!223857) bm!3582))

(assert (= (or b!223859 b!223857) bm!3581))

(assert (= (and d!75968 res!187925) b!223860))

(assert (= (and b!223860 res!187927) b!223858))

(assert (= (and d!75968 (not res!187926)) b!223856))

(declare-fun m!343169 () Bool)

(assert (=> b!223858 m!343169))

(declare-fun m!343171 () Bool)

(assert (=> b!223856 m!343171))

(declare-fun m!343173 () Bool)

(assert (=> b!223856 m!343173))

(declare-fun m!343175 () Bool)

(assert (=> b!223859 m!343175))

(declare-fun m!343177 () Bool)

(assert (=> b!223859 m!343177))

(declare-fun m!343179 () Bool)

(assert (=> b!223859 m!343179))

(declare-fun m!343181 () Bool)

(assert (=> b!223859 m!343181))

(declare-fun m!343183 () Bool)

(assert (=> b!223859 m!343183))

(assert (=> b!223859 m!342957))

(declare-fun m!343185 () Bool)

(assert (=> b!223859 m!343185))

(declare-fun m!343187 () Bool)

(assert (=> b!223859 m!343187))

(declare-fun m!343189 () Bool)

(assert (=> b!223859 m!343189))

(declare-fun m!343191 () Bool)

(assert (=> b!223859 m!343191))

(declare-fun m!343193 () Bool)

(assert (=> b!223859 m!343193))

(declare-fun m!343195 () Bool)

(assert (=> b!223859 m!343195))

(declare-fun m!343197 () Bool)

(assert (=> b!223859 m!343197))

(declare-fun m!343199 () Bool)

(assert (=> bm!3580 m!343199))

(declare-fun m!343201 () Bool)

(assert (=> b!223857 m!343201))

(declare-fun m!343203 () Bool)

(assert (=> b!223857 m!343203))

(declare-fun m!343205 () Bool)

(assert (=> bm!3582 m!343205))

(declare-fun m!343207 () Bool)

(assert (=> d!75968 m!343207))

(assert (=> d!75968 m!342957))

(declare-fun m!343209 () Bool)

(assert (=> bm!3581 m!343209))

(assert (=> b!223727 d!75968))

(declare-fun d!75995 () Bool)

(declare-fun e!152402 () Bool)

(assert (=> d!75995 e!152402))

(declare-fun res!187928 () Bool)

(assert (=> d!75995 (=> (not res!187928) (not e!152402))))

(declare-fun lt!354913 () (_ BitVec 64))

(declare-fun lt!354918 () (_ BitVec 64))

(declare-fun lt!354916 () (_ BitVec 64))

(assert (=> d!75995 (= res!187928 (= lt!354916 (bvsub lt!354913 lt!354918)))))

(assert (=> d!75995 (or (= (bvand lt!354913 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!354918 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!354913 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!354913 lt!354918) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75995 (= lt!354918 (remainingBits!0 ((_ sign_extend 32) (size!4819 (buf!5363 thiss!1870))) ((_ sign_extend 32) (currentByte!10082 thiss!1870)) ((_ sign_extend 32) (currentBit!10077 thiss!1870))))))

(declare-fun lt!354917 () (_ BitVec 64))

(declare-fun lt!354914 () (_ BitVec 64))

(assert (=> d!75995 (= lt!354913 (bvmul lt!354917 lt!354914))))

(assert (=> d!75995 (or (= lt!354917 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!354914 (bvsdiv (bvmul lt!354917 lt!354914) lt!354917)))))

(assert (=> d!75995 (= lt!354914 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!75995 (= lt!354917 ((_ sign_extend 32) (size!4819 (buf!5363 thiss!1870))))))

(assert (=> d!75995 (= lt!354916 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10082 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10077 thiss!1870))))))

(assert (=> d!75995 (invariant!0 (currentBit!10077 thiss!1870) (currentByte!10082 thiss!1870) (size!4819 (buf!5363 thiss!1870)))))

(assert (=> d!75995 (= (bitIndex!0 (size!4819 (buf!5363 thiss!1870)) (currentByte!10082 thiss!1870) (currentBit!10077 thiss!1870)) lt!354916)))

(declare-fun b!223861 () Bool)

(declare-fun res!187929 () Bool)

(assert (=> b!223861 (=> (not res!187929) (not e!152402))))

(assert (=> b!223861 (= res!187929 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!354916))))

(declare-fun b!223862 () Bool)

(declare-fun lt!354915 () (_ BitVec 64))

(assert (=> b!223862 (= e!152402 (bvsle lt!354916 (bvmul lt!354915 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!223862 (or (= lt!354915 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!354915 #b0000000000000000000000000000000000000000000000000000000000001000) lt!354915)))))

(assert (=> b!223862 (= lt!354915 ((_ sign_extend 32) (size!4819 (buf!5363 thiss!1870))))))

(assert (= (and d!75995 res!187928) b!223861))

(assert (= (and b!223861 res!187929) b!223862))

(assert (=> d!75995 m!343035))

(assert (=> d!75995 m!343037))

(assert (=> b!223727 d!75995))

(declare-fun d!75997 () Bool)

(assert (=> d!75997 (= (invariant!0 (currentBit!10077 (_2!10281 lt!354373)) (currentByte!10082 (_2!10281 lt!354373)) (size!4819 (buf!5363 (_2!10281 lt!354373)))) (and (bvsge (currentBit!10077 (_2!10281 lt!354373)) #b00000000000000000000000000000000) (bvslt (currentBit!10077 (_2!10281 lt!354373)) #b00000000000000000000000000001000) (bvsge (currentByte!10082 (_2!10281 lt!354373)) #b00000000000000000000000000000000) (or (bvslt (currentByte!10082 (_2!10281 lt!354373)) (size!4819 (buf!5363 (_2!10281 lt!354373)))) (and (= (currentBit!10077 (_2!10281 lt!354373)) #b00000000000000000000000000000000) (= (currentByte!10082 (_2!10281 lt!354373)) (size!4819 (buf!5363 (_2!10281 lt!354373))))))))))

(assert (=> b!223727 d!75997))

(declare-fun d!75999 () Bool)

(assert (=> d!75999 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4819 (buf!5363 (_2!10282 lt!354375)))) ((_ sign_extend 32) (currentByte!10082 (_2!10282 lt!354375))) ((_ sign_extend 32) (currentBit!10077 (_2!10282 lt!354375))) lt!354377) (bvsle ((_ sign_extend 32) lt!354377) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4819 (buf!5363 (_2!10282 lt!354375)))) ((_ sign_extend 32) (currentByte!10082 (_2!10282 lt!354375))) ((_ sign_extend 32) (currentBit!10077 (_2!10282 lt!354375)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18513 () Bool)

(assert (= bs!18513 d!75999))

(assert (=> bs!18513 m!343055))

(assert (=> b!223727 d!75999))

(push 1)

