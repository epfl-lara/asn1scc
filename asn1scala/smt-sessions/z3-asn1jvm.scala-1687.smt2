; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46846 () Bool)

(assert start!46846)

(declare-fun b!224560 () Bool)

(declare-fun e!153068 () Bool)

(declare-datatypes ((array!11093 0))(
  ( (array!11094 (arr!5819 (Array (_ BitVec 32) (_ BitVec 8))) (size!4868 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8838 0))(
  ( (BitStream!8839 (buf!5412 array!11093) (currentByte!10149 (_ BitVec 32)) (currentBit!10144 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!16438 0))(
  ( (Unit!16439) )
))
(declare-datatypes ((tuple3!1262 0))(
  ( (tuple3!1263 (_1!10391 Unit!16438) (_2!10391 BitStream!8838) (_3!773 array!11093)) )
))
(declare-fun lt!356792 () tuple3!1262)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224560 (= e!153068 (not (invariant!0 (currentBit!10144 (_2!10391 lt!356792)) (currentByte!10149 (_2!10391 lt!356792)) (size!4868 (buf!5412 (_2!10391 lt!356792))))))))

(declare-datatypes ((tuple2!19236 0))(
  ( (tuple2!19237 (_1!10392 (_ BitVec 8)) (_2!10392 BitStream!8838)) )
))
(declare-fun lt!356794 () tuple2!19236)

(declare-fun i!761 () (_ BitVec 32))

(assert (=> b!224560 (and (= (_1!10392 lt!356794) (select (arr!5819 (_3!773 lt!356792)) i!761)) (= (select (arr!5819 (_3!773 lt!356792)) i!761) (_1!10392 lt!356794)))))

(declare-fun lt!356800 () Unit!16438)

(declare-fun lt!356801 () array!11093)

(declare-fun arrayRangesEqImpliesEq!86 (array!11093 array!11093 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16438)

(assert (=> b!224560 (= lt!356800 (arrayRangesEqImpliesEq!86 lt!356801 (_3!773 lt!356792) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun arr!308 () array!11093)

(declare-fun arrayRangesEq!764 (array!11093 array!11093 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224560 (arrayRangesEq!764 arr!308 (_3!773 lt!356792) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!356796 () Unit!16438)

(declare-fun arrayRangesEqTransitive!235 (array!11093 array!11093 array!11093 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16438)

(assert (=> b!224560 (= lt!356796 (arrayRangesEqTransitive!235 arr!308 lt!356801 (_3!773 lt!356792) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!224560 (arrayRangesEq!764 arr!308 lt!356801 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!356795 () Unit!16438)

(declare-fun arrayUpdatedAtPrefixLemma!356 (array!11093 (_ BitVec 32) (_ BitVec 8)) Unit!16438)

(assert (=> b!224560 (= lt!356795 (arrayUpdatedAtPrefixLemma!356 arr!308 i!761 (_1!10392 lt!356794)))))

(declare-fun thiss!1870 () BitStream!8838)

(declare-fun lt!356798 () (_ BitVec 64))

(declare-fun lt!356797 () (_ BitVec 64))

(declare-fun lt!356793 () (_ BitVec 64))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun lt!356799 () (_ BitVec 32))

(assert (=> b!224560 (and (= (bvadd lt!356793 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!356799))) lt!356798) (= (bvadd lt!356797 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!356798) (= (buf!5412 thiss!1870) (buf!5412 (_2!10391 lt!356792))) (= (size!4868 arr!308) (size!4868 (_3!773 lt!356792))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!224560 (= lt!356798 (bitIndex!0 (size!4868 (buf!5412 (_2!10391 lt!356792))) (currentByte!10149 (_2!10391 lt!356792)) (currentBit!10144 (_2!10391 lt!356792))))))

(assert (=> b!224560 (= lt!356793 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!356797))))

(assert (=> b!224560 (= lt!356793 (bitIndex!0 (size!4868 (buf!5412 (_2!10392 lt!356794))) (currentByte!10149 (_2!10392 lt!356794)) (currentBit!10144 (_2!10392 lt!356794))))))

(assert (=> b!224560 (= lt!356797 (bitIndex!0 (size!4868 (buf!5412 thiss!1870)) (currentByte!10149 thiss!1870) (currentBit!10144 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8838 array!11093 (_ BitVec 32) (_ BitVec 32)) tuple3!1262)

(assert (=> b!224560 (= lt!356792 (readByteArrayLoop!0 (_2!10392 lt!356794) lt!356801 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!224560 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4868 (buf!5412 (_2!10392 lt!356794)))) ((_ sign_extend 32) (currentByte!10149 (_2!10392 lt!356794))) ((_ sign_extend 32) (currentBit!10144 (_2!10392 lt!356794))) lt!356799)))

(assert (=> b!224560 (= lt!356799 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!356802 () Unit!16438)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8838 BitStream!8838 (_ BitVec 64) (_ BitVec 32)) Unit!16438)

(assert (=> b!224560 (= lt!356802 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10392 lt!356794) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!224560 (= lt!356801 (array!11094 (store (arr!5819 arr!308) i!761 (_1!10392 lt!356794)) (size!4868 arr!308)))))

(declare-fun readByte!0 (BitStream!8838) tuple2!19236)

(assert (=> b!224560 (= lt!356794 (readByte!0 thiss!1870))))

(declare-fun b!224559 () Bool)

(declare-fun res!188471 () Bool)

(assert (=> b!224559 (=> (not res!188471) (not e!153068))))

(assert (=> b!224559 (= res!188471 (bvslt i!761 to!496))))

(declare-fun b!224558 () Bool)

(declare-fun res!188472 () Bool)

(assert (=> b!224558 (=> (not res!188472) (not e!153068))))

(assert (=> b!224558 (= res!188472 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4868 (buf!5412 thiss!1870))) ((_ sign_extend 32) (currentByte!10149 thiss!1870)) ((_ sign_extend 32) (currentBit!10144 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!224561 () Bool)

(declare-fun e!153066 () Bool)

(declare-fun array_inv!4609 (array!11093) Bool)

(assert (=> b!224561 (= e!153066 (array_inv!4609 (buf!5412 thiss!1870)))))

(declare-fun res!188470 () Bool)

(assert (=> start!46846 (=> (not res!188470) (not e!153068))))

(assert (=> start!46846 (= res!188470 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4868 arr!308))))))

(assert (=> start!46846 e!153068))

(assert (=> start!46846 true))

(assert (=> start!46846 (array_inv!4609 arr!308)))

(declare-fun inv!12 (BitStream!8838) Bool)

(assert (=> start!46846 (and (inv!12 thiss!1870) e!153066)))

(assert (= (and start!46846 res!188470) b!224558))

(assert (= (and b!224558 res!188472) b!224559))

(assert (= (and b!224559 res!188471) b!224560))

(assert (= start!46846 b!224561))

(declare-fun m!344875 () Bool)

(assert (=> b!224560 m!344875))

(declare-fun m!344877 () Bool)

(assert (=> b!224560 m!344877))

(declare-fun m!344879 () Bool)

(assert (=> b!224560 m!344879))

(declare-fun m!344881 () Bool)

(assert (=> b!224560 m!344881))

(declare-fun m!344883 () Bool)

(assert (=> b!224560 m!344883))

(declare-fun m!344885 () Bool)

(assert (=> b!224560 m!344885))

(declare-fun m!344887 () Bool)

(assert (=> b!224560 m!344887))

(declare-fun m!344889 () Bool)

(assert (=> b!224560 m!344889))

(declare-fun m!344891 () Bool)

(assert (=> b!224560 m!344891))

(declare-fun m!344893 () Bool)

(assert (=> b!224560 m!344893))

(declare-fun m!344895 () Bool)

(assert (=> b!224560 m!344895))

(declare-fun m!344897 () Bool)

(assert (=> b!224560 m!344897))

(declare-fun m!344899 () Bool)

(assert (=> b!224560 m!344899))

(declare-fun m!344901 () Bool)

(assert (=> b!224560 m!344901))

(declare-fun m!344903 () Bool)

(assert (=> b!224560 m!344903))

(declare-fun m!344905 () Bool)

(assert (=> b!224558 m!344905))

(declare-fun m!344907 () Bool)

(assert (=> b!224561 m!344907))

(declare-fun m!344909 () Bool)

(assert (=> start!46846 m!344909))

(declare-fun m!344911 () Bool)

(assert (=> start!46846 m!344911))

(check-sat (not b!224561) (not b!224558) (not start!46846) (not b!224560))
(check-sat)
(get-model)

(declare-fun d!76138 () Bool)

(assert (=> d!76138 (= (array_inv!4609 (buf!5412 thiss!1870)) (bvsge (size!4868 (buf!5412 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!224561 d!76138))

(declare-fun d!76140 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!76140 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4868 (buf!5412 thiss!1870))) ((_ sign_extend 32) (currentByte!10149 thiss!1870)) ((_ sign_extend 32) (currentBit!10144 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4868 (buf!5412 thiss!1870))) ((_ sign_extend 32) (currentByte!10149 thiss!1870)) ((_ sign_extend 32) (currentBit!10144 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18577 () Bool)

(assert (= bs!18577 d!76140))

(declare-fun m!344951 () Bool)

(assert (=> bs!18577 m!344951))

(assert (=> b!224558 d!76140))

(declare-fun d!76142 () Bool)

(assert (=> d!76142 (= (array_inv!4609 arr!308) (bvsge (size!4868 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!46846 d!76142))

(declare-fun d!76144 () Bool)

(assert (=> d!76144 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10144 thiss!1870) (currentByte!10149 thiss!1870) (size!4868 (buf!5412 thiss!1870))))))

(declare-fun bs!18578 () Bool)

(assert (= bs!18578 d!76144))

(declare-fun m!344953 () Bool)

(assert (=> bs!18578 m!344953))

(assert (=> start!46846 d!76144))

(declare-fun d!76146 () Bool)

(assert (=> d!76146 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4868 (buf!5412 (_2!10392 lt!356794)))) ((_ sign_extend 32) (currentByte!10149 (_2!10392 lt!356794))) ((_ sign_extend 32) (currentBit!10144 (_2!10392 lt!356794))) lt!356799) (bvsle ((_ sign_extend 32) lt!356799) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4868 (buf!5412 (_2!10392 lt!356794)))) ((_ sign_extend 32) (currentByte!10149 (_2!10392 lt!356794))) ((_ sign_extend 32) (currentBit!10144 (_2!10392 lt!356794)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18579 () Bool)

(assert (= bs!18579 d!76146))

(declare-fun m!344955 () Bool)

(assert (=> bs!18579 m!344955))

(assert (=> b!224560 d!76146))

(declare-fun d!76148 () Bool)

(declare-fun lt!356852 () (_ BitVec 8))

(declare-fun lt!356851 () (_ BitVec 8))

(assert (=> d!76148 (= lt!356852 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5819 (buf!5412 thiss!1870)) (currentByte!10149 thiss!1870))) ((_ sign_extend 24) lt!356851))))))

(assert (=> d!76148 (= lt!356851 ((_ extract 7 0) (currentBit!10144 thiss!1870)))))

(declare-fun e!153094 () Bool)

(assert (=> d!76148 e!153094))

(declare-fun res!188496 () Bool)

(assert (=> d!76148 (=> (not res!188496) (not e!153094))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!76148 (= res!188496 (validate_offset_bits!1 ((_ sign_extend 32) (size!4868 (buf!5412 thiss!1870))) ((_ sign_extend 32) (currentByte!10149 thiss!1870)) ((_ sign_extend 32) (currentBit!10144 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!19240 0))(
  ( (tuple2!19241 (_1!10395 Unit!16438) (_2!10395 (_ BitVec 8))) )
))
(declare-fun Unit!16442 () Unit!16438)

(declare-fun Unit!16443 () Unit!16438)

(assert (=> d!76148 (= (readByte!0 thiss!1870) (tuple2!19237 (_2!10395 (ite (bvsgt ((_ sign_extend 24) lt!356851) #b00000000000000000000000000000000) (tuple2!19241 Unit!16442 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!356852) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5819 (buf!5412 thiss!1870)) (bvadd (currentByte!10149 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!356851)))))))) (tuple2!19241 Unit!16443 lt!356852))) (BitStream!8839 (buf!5412 thiss!1870) (bvadd (currentByte!10149 thiss!1870) #b00000000000000000000000000000001) (currentBit!10144 thiss!1870))))))

(declare-fun b!224586 () Bool)

(declare-fun e!153093 () Bool)

(assert (=> b!224586 (= e!153094 e!153093)))

(declare-fun res!188497 () Bool)

(assert (=> b!224586 (=> (not res!188497) (not e!153093))))

(declare-fun lt!356853 () tuple2!19236)

(assert (=> b!224586 (= res!188497 (= (buf!5412 (_2!10392 lt!356853)) (buf!5412 thiss!1870)))))

(declare-fun lt!356850 () (_ BitVec 8))

(declare-fun lt!356854 () (_ BitVec 8))

(declare-fun Unit!16444 () Unit!16438)

(declare-fun Unit!16445 () Unit!16438)

(assert (=> b!224586 (= lt!356853 (tuple2!19237 (_2!10395 (ite (bvsgt ((_ sign_extend 24) lt!356854) #b00000000000000000000000000000000) (tuple2!19241 Unit!16444 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!356850) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5819 (buf!5412 thiss!1870)) (bvadd (currentByte!10149 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!356854)))))))) (tuple2!19241 Unit!16445 lt!356850))) (BitStream!8839 (buf!5412 thiss!1870) (bvadd (currentByte!10149 thiss!1870) #b00000000000000000000000000000001) (currentBit!10144 thiss!1870))))))

(assert (=> b!224586 (= lt!356850 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5819 (buf!5412 thiss!1870)) (currentByte!10149 thiss!1870))) ((_ sign_extend 24) lt!356854))))))

(assert (=> b!224586 (= lt!356854 ((_ extract 7 0) (currentBit!10144 thiss!1870)))))

(declare-fun b!224587 () Bool)

(declare-fun lt!356855 () (_ BitVec 64))

(declare-fun lt!356856 () (_ BitVec 64))

(assert (=> b!224587 (= e!153093 (= (bitIndex!0 (size!4868 (buf!5412 (_2!10392 lt!356853))) (currentByte!10149 (_2!10392 lt!356853)) (currentBit!10144 (_2!10392 lt!356853))) (bvadd lt!356855 lt!356856)))))

(assert (=> b!224587 (or (not (= (bvand lt!356855 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!356856 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!356855 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!356855 lt!356856) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!224587 (= lt!356856 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!224587 (= lt!356855 (bitIndex!0 (size!4868 (buf!5412 thiss!1870)) (currentByte!10149 thiss!1870) (currentBit!10144 thiss!1870)))))

(assert (= (and d!76148 res!188496) b!224586))

(assert (= (and b!224586 res!188497) b!224587))

(declare-fun m!344969 () Bool)

(assert (=> d!76148 m!344969))

(declare-fun m!344971 () Bool)

(assert (=> d!76148 m!344971))

(declare-fun m!344973 () Bool)

(assert (=> d!76148 m!344973))

(assert (=> b!224586 m!344973))

(assert (=> b!224586 m!344969))

(declare-fun m!344975 () Bool)

(assert (=> b!224587 m!344975))

(assert (=> b!224587 m!344887))

(assert (=> b!224560 d!76148))

(declare-fun d!76162 () Bool)

(declare-fun e!153101 () Bool)

(assert (=> d!76162 e!153101))

(declare-fun res!188504 () Bool)

(assert (=> d!76162 (=> (not res!188504) (not e!153101))))

(assert (=> d!76162 (= res!188504 (and (bvsge i!761 #b00000000000000000000000000000000) (bvslt i!761 (size!4868 arr!308))))))

(declare-fun lt!356871 () Unit!16438)

(declare-fun choose!289 (array!11093 (_ BitVec 32) (_ BitVec 8)) Unit!16438)

(assert (=> d!76162 (= lt!356871 (choose!289 arr!308 i!761 (_1!10392 lt!356794)))))

(assert (=> d!76162 (and (bvsle #b00000000000000000000000000000000 i!761) (bvslt i!761 (size!4868 arr!308)))))

(assert (=> d!76162 (= (arrayUpdatedAtPrefixLemma!356 arr!308 i!761 (_1!10392 lt!356794)) lt!356871)))

(declare-fun b!224594 () Bool)

(assert (=> b!224594 (= e!153101 (arrayRangesEq!764 arr!308 (array!11094 (store (arr!5819 arr!308) i!761 (_1!10392 lt!356794)) (size!4868 arr!308)) #b00000000000000000000000000000000 i!761))))

(assert (= (and d!76162 res!188504) b!224594))

(declare-fun m!344977 () Bool)

(assert (=> d!76162 m!344977))

(assert (=> b!224594 m!344883))

(declare-fun m!344979 () Bool)

(assert (=> b!224594 m!344979))

(assert (=> b!224560 d!76162))

(declare-fun d!76164 () Bool)

(declare-fun e!153106 () Bool)

(assert (=> d!76164 e!153106))

(declare-fun res!188509 () Bool)

(assert (=> d!76164 (=> (not res!188509) (not e!153106))))

(assert (=> d!76164 (= res!188509 (and (or (let ((rhs!3757 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3757 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3757) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!76165 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!76165 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!76165 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3756 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3756 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3756) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!356888 () Unit!16438)

(declare-fun choose!57 (BitStream!8838 BitStream!8838 (_ BitVec 64) (_ BitVec 32)) Unit!16438)

(assert (=> d!76164 (= lt!356888 (choose!57 thiss!1870 (_2!10392 lt!356794) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> d!76164 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10392 lt!356794) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)) lt!356888)))

(declare-fun b!224599 () Bool)

(declare-fun lt!356889 () (_ BitVec 32))

(assert (=> b!224599 (= e!153106 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4868 (buf!5412 (_2!10392 lt!356794)))) ((_ sign_extend 32) (currentByte!10149 (_2!10392 lt!356794))) ((_ sign_extend 32) (currentBit!10144 (_2!10392 lt!356794))) (bvsub (bvsub to!496 i!761) lt!356889)))))

(assert (=> b!224599 (or (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand lt!356889 #b10000000000000000000000000000000)) (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!496 i!761) lt!356889) #b10000000000000000000000000000000)))))

(declare-fun lt!356887 () (_ BitVec 64))

(assert (=> b!224599 (= lt!356889 ((_ extract 31 0) lt!356887))))

(assert (=> b!224599 (and (bvslt lt!356887 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!356887 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!224599 (= lt!356887 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!76164 res!188509) b!224599))

(declare-fun m!344989 () Bool)

(assert (=> d!76164 m!344989))

(declare-fun m!344991 () Bool)

(assert (=> b!224599 m!344991))

(assert (=> b!224560 d!76164))

(declare-fun b!224625 () Bool)

(declare-fun e!153124 () Bool)

(declare-fun lt!357086 () tuple3!1262)

(assert (=> b!224625 (= e!153124 (arrayRangesEq!764 lt!356801 (_3!773 lt!357086) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun call!3629 () Bool)

(declare-fun bm!3625 () Bool)

(declare-fun lt!357105 () (_ BitVec 32))

(declare-fun lt!357107 () tuple3!1262)

(declare-fun c!11137 () Bool)

(declare-fun lt!357102 () (_ BitVec 32))

(declare-fun lt!357084 () array!11093)

(declare-fun lt!357079 () array!11093)

(declare-fun lt!357103 () (_ BitVec 32))

(assert (=> bm!3625 (= call!3629 (arrayRangesEq!764 (ite c!11137 lt!356801 lt!357079) (ite c!11137 (_3!773 lt!357107) lt!357084) (ite c!11137 lt!357105 lt!357102) (ite c!11137 (bvadd #b00000000000000000000000000000001 i!761) lt!357103)))))

(declare-fun lt!357093 () Unit!16438)

(declare-fun e!153122 () tuple3!1262)

(declare-fun b!224626 () Bool)

(assert (=> b!224626 (= e!153122 (tuple3!1263 lt!357093 (_2!10392 lt!356794) lt!356801))))

(declare-fun call!3628 () (_ BitVec 64))

(assert (=> b!224626 (= call!3628 call!3628)))

(declare-fun lt!357095 () Unit!16438)

(declare-fun Unit!16450 () Unit!16438)

(assert (=> b!224626 (= lt!357095 Unit!16450)))

(declare-fun lt!357100 () Unit!16438)

(declare-fun arrayRangesEqReflexiveLemma!77 (array!11093) Unit!16438)

(assert (=> b!224626 (= lt!357100 (arrayRangesEqReflexiveLemma!77 lt!356801))))

(declare-fun call!3630 () Bool)

(assert (=> b!224626 call!3630))

(declare-fun lt!357088 () Unit!16438)

(assert (=> b!224626 (= lt!357088 lt!357100)))

(assert (=> b!224626 (= lt!357079 lt!356801)))

(assert (=> b!224626 (= lt!357084 lt!356801)))

(declare-fun lt!357098 () (_ BitVec 32))

(assert (=> b!224626 (= lt!357098 #b00000000000000000000000000000000)))

(declare-fun lt!357087 () (_ BitVec 32))

(assert (=> b!224626 (= lt!357087 (size!4868 lt!356801))))

(assert (=> b!224626 (= lt!357102 #b00000000000000000000000000000000)))

(assert (=> b!224626 (= lt!357103 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun arrayRangesEqSlicedLemma!77 (array!11093 array!11093 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16438)

(assert (=> b!224626 (= lt!357093 (arrayRangesEqSlicedLemma!77 lt!357079 lt!357084 lt!357098 lt!357087 lt!357102 lt!357103))))

(assert (=> b!224626 call!3629))

(declare-fun lt!357089 () tuple2!19236)

(declare-fun bm!3626 () Bool)

(assert (=> bm!3626 (= call!3630 (arrayRangesEq!764 lt!356801 (ite c!11137 (array!11094 (store (arr!5819 lt!356801) (bvadd #b00000000000000000000000000000001 i!761) (_1!10392 lt!357089)) (size!4868 lt!356801)) lt!356801) #b00000000000000000000000000000000 (ite c!11137 (bvadd #b00000000000000000000000000000001 i!761) (size!4868 lt!356801))))))

(declare-fun b!224627 () Bool)

(declare-fun lt!357091 () Unit!16438)

(assert (=> b!224627 (= e!153122 (tuple3!1263 lt!357091 (_2!10391 lt!357107) (_3!773 lt!357107)))))

(assert (=> b!224627 (= lt!357089 (readByte!0 (_2!10392 lt!356794)))))

(declare-fun lt!357076 () array!11093)

(assert (=> b!224627 (= lt!357076 (array!11094 (store (arr!5819 lt!356801) (bvadd #b00000000000000000000000000000001 i!761) (_1!10392 lt!357089)) (size!4868 lt!356801)))))

(declare-fun lt!357097 () (_ BitVec 64))

(assert (=> b!224627 (= lt!357097 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!357075 () (_ BitVec 32))

(assert (=> b!224627 (= lt!357075 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!357082 () Unit!16438)

(assert (=> b!224627 (= lt!357082 (validateOffsetBytesFromBitIndexLemma!0 (_2!10392 lt!356794) (_2!10392 lt!357089) lt!357097 lt!357075))))

(assert (=> b!224627 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4868 (buf!5412 (_2!10392 lt!357089)))) ((_ sign_extend 32) (currentByte!10149 (_2!10392 lt!357089))) ((_ sign_extend 32) (currentBit!10144 (_2!10392 lt!357089))) (bvsub lt!357075 ((_ extract 31 0) (bvsdiv (bvadd lt!357097 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!357106 () Unit!16438)

(assert (=> b!224627 (= lt!357106 lt!357082)))

(assert (=> b!224627 (= lt!357107 (readByteArrayLoop!0 (_2!10392 lt!357089) lt!357076 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(assert (=> b!224627 (= (bitIndex!0 (size!4868 (buf!5412 (_2!10392 lt!357089))) (currentByte!10149 (_2!10392 lt!357089)) (currentBit!10144 (_2!10392 lt!357089))) (bvadd call!3628 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!357094 () Unit!16438)

(declare-fun Unit!16451 () Unit!16438)

(assert (=> b!224627 (= lt!357094 Unit!16451)))

(assert (=> b!224627 (= (bvadd (bitIndex!0 (size!4868 (buf!5412 (_2!10392 lt!357089))) (currentByte!10149 (_2!10392 lt!357089)) (currentBit!10144 (_2!10392 lt!357089))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4868 (buf!5412 (_2!10391 lt!357107))) (currentByte!10149 (_2!10391 lt!357107)) (currentBit!10144 (_2!10391 lt!357107))))))

(declare-fun lt!357081 () Unit!16438)

(declare-fun Unit!16452 () Unit!16438)

(assert (=> b!224627 (= lt!357081 Unit!16452)))

(assert (=> b!224627 (= (bvadd call!3628 (bvmul ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4868 (buf!5412 (_2!10391 lt!357107))) (currentByte!10149 (_2!10391 lt!357107)) (currentBit!10144 (_2!10391 lt!357107))))))

(declare-fun lt!357085 () Unit!16438)

(declare-fun Unit!16453 () Unit!16438)

(assert (=> b!224627 (= lt!357085 Unit!16453)))

(assert (=> b!224627 (and (= (buf!5412 (_2!10392 lt!356794)) (buf!5412 (_2!10391 lt!357107))) (= (size!4868 lt!356801) (size!4868 (_3!773 lt!357107))))))

(declare-fun lt!357104 () Unit!16438)

(declare-fun Unit!16454 () Unit!16438)

(assert (=> b!224627 (= lt!357104 Unit!16454)))

(declare-fun lt!357083 () Unit!16438)

(assert (=> b!224627 (= lt!357083 (arrayUpdatedAtPrefixLemma!356 lt!356801 (bvadd #b00000000000000000000000000000001 i!761) (_1!10392 lt!357089)))))

(assert (=> b!224627 call!3630))

(declare-fun lt!357092 () Unit!16438)

(assert (=> b!224627 (= lt!357092 lt!357083)))

(assert (=> b!224627 (= lt!357105 #b00000000000000000000000000000000)))

(declare-fun lt!357099 () Unit!16438)

(assert (=> b!224627 (= lt!357099 (arrayRangesEqTransitive!235 lt!356801 lt!357076 (_3!773 lt!357107) lt!357105 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!224627 call!3629))

(declare-fun lt!357077 () Unit!16438)

(assert (=> b!224627 (= lt!357077 lt!357099)))

(assert (=> b!224627 (arrayRangesEq!764 lt!356801 (_3!773 lt!357107) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun lt!357090 () Unit!16438)

(declare-fun Unit!16455 () Unit!16438)

(assert (=> b!224627 (= lt!357090 Unit!16455)))

(declare-fun lt!357096 () Unit!16438)

(assert (=> b!224627 (= lt!357096 (arrayRangesEqImpliesEq!86 lt!357076 (_3!773 lt!357107) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!224627 (= (select (store (arr!5819 lt!356801) (bvadd #b00000000000000000000000000000001 i!761) (_1!10392 lt!357089)) (bvadd #b00000000000000000000000000000001 i!761)) (select (arr!5819 (_3!773 lt!357107)) (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!357108 () Unit!16438)

(assert (=> b!224627 (= lt!357108 lt!357096)))

(declare-fun lt!357073 () Bool)

(assert (=> b!224627 (= lt!357073 (= (select (arr!5819 (_3!773 lt!357107)) (bvadd #b00000000000000000000000000000001 i!761)) (_1!10392 lt!357089)))))

(declare-fun Unit!16456 () Unit!16438)

(assert (=> b!224627 (= lt!357091 Unit!16456)))

(assert (=> b!224627 lt!357073))

(declare-fun b!224629 () Bool)

(declare-fun e!153123 () Bool)

(declare-datatypes ((tuple2!19246 0))(
  ( (tuple2!19247 (_1!10398 BitStream!8838) (_2!10398 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!8838) tuple2!19246)

(assert (=> b!224629 (= e!153123 (= (select (arr!5819 (_3!773 lt!357086)) (bvadd #b00000000000000000000000000000001 i!761)) (_2!10398 (readBytePure!0 (_2!10392 lt!356794)))))))

(assert (=> b!224629 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4868 (_3!773 lt!357086))))))

(declare-fun bm!3627 () Bool)

(assert (=> bm!3627 (= call!3628 (bitIndex!0 (size!4868 (buf!5412 (_2!10392 lt!356794))) (currentByte!10149 (_2!10392 lt!356794)) (currentBit!10144 (_2!10392 lt!356794))))))

(declare-fun b!224628 () Bool)

(declare-fun res!188526 () Bool)

(assert (=> b!224628 (=> (not res!188526) (not e!153124))))

(assert (=> b!224628 (= res!188526 (and (= (buf!5412 (_2!10392 lt!356794)) (buf!5412 (_2!10391 lt!357086))) (= (size!4868 lt!356801) (size!4868 (_3!773 lt!357086)))))))

(declare-fun d!76169 () Bool)

(assert (=> d!76169 e!153123))

(declare-fun res!188527 () Bool)

(assert (=> d!76169 (=> res!188527 e!153123)))

(assert (=> d!76169 (= res!188527 (bvsge (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!357074 () Bool)

(assert (=> d!76169 (= lt!357074 e!153124)))

(declare-fun res!188525 () Bool)

(assert (=> d!76169 (=> (not res!188525) (not e!153124))))

(declare-fun lt!357078 () (_ BitVec 64))

(declare-fun lt!357080 () (_ BitVec 64))

(assert (=> d!76169 (= res!188525 (= (bvadd lt!357080 lt!357078) (bitIndex!0 (size!4868 (buf!5412 (_2!10391 lt!357086))) (currentByte!10149 (_2!10391 lt!357086)) (currentBit!10144 (_2!10391 lt!357086)))))))

(assert (=> d!76169 (or (not (= (bvand lt!357080 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!357078 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!357080 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!357080 lt!357078) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!357101 () (_ BitVec 64))

(assert (=> d!76169 (= lt!357078 (bvmul lt!357101 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!76169 (or (= lt!357101 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!357101 #b0000000000000000000000000000000000000000000000000000000000001000) lt!357101)))))

(assert (=> d!76169 (= lt!357101 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))))))

(assert (=> d!76169 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b10000000000000000000000000000000)))))

(assert (=> d!76169 (= lt!357080 (bitIndex!0 (size!4868 (buf!5412 (_2!10392 lt!356794))) (currentByte!10149 (_2!10392 lt!356794)) (currentBit!10144 (_2!10392 lt!356794))))))

(assert (=> d!76169 (= lt!357086 e!153122)))

(assert (=> d!76169 (= c!11137 (bvslt (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> d!76169 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) to!496) (bvsle to!496 (size!4868 lt!356801)))))

(assert (=> d!76169 (= (readByteArrayLoop!0 (_2!10392 lt!356794) lt!356801 (bvadd #b00000000000000000000000000000001 i!761) to!496) lt!357086)))

(assert (= (and d!76169 c!11137) b!224627))

(assert (= (and d!76169 (not c!11137)) b!224626))

(assert (= (or b!224627 b!224626) bm!3625))

(assert (= (or b!224627 b!224626) bm!3626))

(assert (= (or b!224627 b!224626) bm!3627))

(assert (= (and d!76169 res!188525) b!224628))

(assert (= (and b!224628 res!188526) b!224625))

(assert (= (and d!76169 (not res!188527)) b!224629))

(assert (=> bm!3627 m!344895))

(declare-fun m!345041 () Bool)

(assert (=> b!224629 m!345041))

(declare-fun m!345043 () Bool)

(assert (=> b!224629 m!345043))

(declare-fun m!345045 () Bool)

(assert (=> d!76169 m!345045))

(assert (=> d!76169 m!344895))

(declare-fun m!345047 () Bool)

(assert (=> bm!3626 m!345047))

(declare-fun m!345049 () Bool)

(assert (=> bm!3626 m!345049))

(declare-fun m!345051 () Bool)

(assert (=> b!224627 m!345051))

(declare-fun m!345053 () Bool)

(assert (=> b!224627 m!345053))

(declare-fun m!345055 () Bool)

(assert (=> b!224627 m!345055))

(declare-fun m!345057 () Bool)

(assert (=> b!224627 m!345057))

(declare-fun m!345059 () Bool)

(assert (=> b!224627 m!345059))

(declare-fun m!345061 () Bool)

(assert (=> b!224627 m!345061))

(declare-fun m!345063 () Bool)

(assert (=> b!224627 m!345063))

(declare-fun m!345065 () Bool)

(assert (=> b!224627 m!345065))

(declare-fun m!345067 () Bool)

(assert (=> b!224627 m!345067))

(declare-fun m!345069 () Bool)

(assert (=> b!224627 m!345069))

(declare-fun m!345071 () Bool)

(assert (=> b!224627 m!345071))

(declare-fun m!345073 () Bool)

(assert (=> b!224627 m!345073))

(assert (=> b!224627 m!345047))

(declare-fun m!345075 () Bool)

(assert (=> bm!3625 m!345075))

(declare-fun m!345077 () Bool)

(assert (=> b!224626 m!345077))

(declare-fun m!345079 () Bool)

(assert (=> b!224626 m!345079))

(declare-fun m!345081 () Bool)

(assert (=> b!224625 m!345081))

(assert (=> b!224560 d!76169))

(declare-fun d!76183 () Bool)

(declare-fun e!153130 () Bool)

(assert (=> d!76183 e!153130))

(declare-fun res!188538 () Bool)

(assert (=> d!76183 (=> (not res!188538) (not e!153130))))

(declare-fun lt!357142 () (_ BitVec 64))

(declare-fun lt!357144 () (_ BitVec 64))

(declare-fun lt!357143 () (_ BitVec 64))

(assert (=> d!76183 (= res!188538 (= lt!357142 (bvsub lt!357143 lt!357144)))))

(assert (=> d!76183 (or (= (bvand lt!357143 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!357144 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!357143 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!357143 lt!357144) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!76183 (= lt!357144 (remainingBits!0 ((_ sign_extend 32) (size!4868 (buf!5412 thiss!1870))) ((_ sign_extend 32) (currentByte!10149 thiss!1870)) ((_ sign_extend 32) (currentBit!10144 thiss!1870))))))

(declare-fun lt!357141 () (_ BitVec 64))

(declare-fun lt!357146 () (_ BitVec 64))

(assert (=> d!76183 (= lt!357143 (bvmul lt!357141 lt!357146))))

(assert (=> d!76183 (or (= lt!357141 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!357146 (bvsdiv (bvmul lt!357141 lt!357146) lt!357141)))))

(assert (=> d!76183 (= lt!357146 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76183 (= lt!357141 ((_ sign_extend 32) (size!4868 (buf!5412 thiss!1870))))))

(assert (=> d!76183 (= lt!357142 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10149 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10144 thiss!1870))))))

(assert (=> d!76183 (invariant!0 (currentBit!10144 thiss!1870) (currentByte!10149 thiss!1870) (size!4868 (buf!5412 thiss!1870)))))

(assert (=> d!76183 (= (bitIndex!0 (size!4868 (buf!5412 thiss!1870)) (currentByte!10149 thiss!1870) (currentBit!10144 thiss!1870)) lt!357142)))

(declare-fun b!224640 () Bool)

(declare-fun res!188539 () Bool)

(assert (=> b!224640 (=> (not res!188539) (not e!153130))))

(assert (=> b!224640 (= res!188539 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!357142))))

(declare-fun b!224641 () Bool)

(declare-fun lt!357145 () (_ BitVec 64))

(assert (=> b!224641 (= e!153130 (bvsle lt!357142 (bvmul lt!357145 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!224641 (or (= lt!357145 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!357145 #b0000000000000000000000000000000000000000000000000000000000001000) lt!357145)))))

(assert (=> b!224641 (= lt!357145 ((_ sign_extend 32) (size!4868 (buf!5412 thiss!1870))))))

(assert (= (and d!76183 res!188538) b!224640))

(assert (= (and b!224640 res!188539) b!224641))

(assert (=> d!76183 m!344951))

(assert (=> d!76183 m!344953))

(assert (=> b!224560 d!76183))

(declare-fun d!76187 () Bool)

(assert (=> d!76187 (arrayRangesEq!764 arr!308 (_3!773 lt!356792) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!357150 () Unit!16438)

(declare-fun choose!290 (array!11093 array!11093 array!11093 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16438)

(assert (=> d!76187 (= lt!357150 (choose!290 arr!308 lt!356801 (_3!773 lt!356792) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!76187 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!76187 (= (arrayRangesEqTransitive!235 arr!308 lt!356801 (_3!773 lt!356792) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)) lt!357150)))

(declare-fun bs!18585 () Bool)

(assert (= bs!18585 d!76187))

(assert (=> bs!18585 m!344877))

(declare-fun m!345089 () Bool)

(assert (=> bs!18585 m!345089))

(assert (=> b!224560 d!76187))

(declare-fun d!76191 () Bool)

(declare-fun res!188544 () Bool)

(declare-fun e!153135 () Bool)

(assert (=> d!76191 (=> res!188544 e!153135)))

(assert (=> d!76191 (= res!188544 (= #b00000000000000000000000000000000 i!761))))

(assert (=> d!76191 (= (arrayRangesEq!764 arr!308 lt!356801 #b00000000000000000000000000000000 i!761) e!153135)))

(declare-fun b!224646 () Bool)

(declare-fun e!153136 () Bool)

(assert (=> b!224646 (= e!153135 e!153136)))

(declare-fun res!188545 () Bool)

(assert (=> b!224646 (=> (not res!188545) (not e!153136))))

(assert (=> b!224646 (= res!188545 (= (select (arr!5819 arr!308) #b00000000000000000000000000000000) (select (arr!5819 lt!356801) #b00000000000000000000000000000000)))))

(declare-fun b!224647 () Bool)

(assert (=> b!224647 (= e!153136 (arrayRangesEq!764 arr!308 lt!356801 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) i!761))))

(assert (= (and d!76191 (not res!188544)) b!224646))

(assert (= (and b!224646 res!188545) b!224647))

(declare-fun m!345091 () Bool)

(assert (=> b!224646 m!345091))

(declare-fun m!345093 () Bool)

(assert (=> b!224646 m!345093))

(declare-fun m!345095 () Bool)

(assert (=> b!224647 m!345095))

(assert (=> b!224560 d!76191))

(declare-fun d!76194 () Bool)

(assert (=> d!76194 (= (invariant!0 (currentBit!10144 (_2!10391 lt!356792)) (currentByte!10149 (_2!10391 lt!356792)) (size!4868 (buf!5412 (_2!10391 lt!356792)))) (and (bvsge (currentBit!10144 (_2!10391 lt!356792)) #b00000000000000000000000000000000) (bvslt (currentBit!10144 (_2!10391 lt!356792)) #b00000000000000000000000000001000) (bvsge (currentByte!10149 (_2!10391 lt!356792)) #b00000000000000000000000000000000) (or (bvslt (currentByte!10149 (_2!10391 lt!356792)) (size!4868 (buf!5412 (_2!10391 lt!356792)))) (and (= (currentBit!10144 (_2!10391 lt!356792)) #b00000000000000000000000000000000) (= (currentByte!10149 (_2!10391 lt!356792)) (size!4868 (buf!5412 (_2!10391 lt!356792))))))))))

(assert (=> b!224560 d!76194))

(declare-fun d!76196 () Bool)

(declare-fun e!153137 () Bool)

(assert (=> d!76196 e!153137))

(declare-fun res!188546 () Bool)

(assert (=> d!76196 (=> (not res!188546) (not e!153137))))

(declare-fun lt!357154 () (_ BitVec 64))

(declare-fun lt!357153 () (_ BitVec 64))

(declare-fun lt!357152 () (_ BitVec 64))

(assert (=> d!76196 (= res!188546 (= lt!357152 (bvsub lt!357153 lt!357154)))))

(assert (=> d!76196 (or (= (bvand lt!357153 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!357154 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!357153 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!357153 lt!357154) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!76196 (= lt!357154 (remainingBits!0 ((_ sign_extend 32) (size!4868 (buf!5412 (_2!10391 lt!356792)))) ((_ sign_extend 32) (currentByte!10149 (_2!10391 lt!356792))) ((_ sign_extend 32) (currentBit!10144 (_2!10391 lt!356792)))))))

(declare-fun lt!357151 () (_ BitVec 64))

(declare-fun lt!357156 () (_ BitVec 64))

(assert (=> d!76196 (= lt!357153 (bvmul lt!357151 lt!357156))))

(assert (=> d!76196 (or (= lt!357151 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!357156 (bvsdiv (bvmul lt!357151 lt!357156) lt!357151)))))

(assert (=> d!76196 (= lt!357156 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76196 (= lt!357151 ((_ sign_extend 32) (size!4868 (buf!5412 (_2!10391 lt!356792)))))))

(assert (=> d!76196 (= lt!357152 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10149 (_2!10391 lt!356792))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10144 (_2!10391 lt!356792)))))))

(assert (=> d!76196 (invariant!0 (currentBit!10144 (_2!10391 lt!356792)) (currentByte!10149 (_2!10391 lt!356792)) (size!4868 (buf!5412 (_2!10391 lt!356792))))))

(assert (=> d!76196 (= (bitIndex!0 (size!4868 (buf!5412 (_2!10391 lt!356792))) (currentByte!10149 (_2!10391 lt!356792)) (currentBit!10144 (_2!10391 lt!356792))) lt!357152)))

(declare-fun b!224648 () Bool)

(declare-fun res!188547 () Bool)

(assert (=> b!224648 (=> (not res!188547) (not e!153137))))

(assert (=> b!224648 (= res!188547 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!357152))))

(declare-fun b!224649 () Bool)

(declare-fun lt!357155 () (_ BitVec 64))

(assert (=> b!224649 (= e!153137 (bvsle lt!357152 (bvmul lt!357155 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!224649 (or (= lt!357155 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!357155 #b0000000000000000000000000000000000000000000000000000000000001000) lt!357155)))))

(assert (=> b!224649 (= lt!357155 ((_ sign_extend 32) (size!4868 (buf!5412 (_2!10391 lt!356792)))))))

(assert (= (and d!76196 res!188546) b!224648))

(assert (= (and b!224648 res!188547) b!224649))

(declare-fun m!345097 () Bool)

(assert (=> d!76196 m!345097))

(assert (=> d!76196 m!344885))

(assert (=> b!224560 d!76196))

(declare-fun d!76198 () Bool)

(declare-fun res!188548 () Bool)

(declare-fun e!153138 () Bool)

(assert (=> d!76198 (=> res!188548 e!153138)))

(assert (=> d!76198 (= res!188548 (= #b00000000000000000000000000000000 i!761))))

(assert (=> d!76198 (= (arrayRangesEq!764 arr!308 (_3!773 lt!356792) #b00000000000000000000000000000000 i!761) e!153138)))

(declare-fun b!224650 () Bool)

(declare-fun e!153139 () Bool)

(assert (=> b!224650 (= e!153138 e!153139)))

(declare-fun res!188549 () Bool)

(assert (=> b!224650 (=> (not res!188549) (not e!153139))))

(assert (=> b!224650 (= res!188549 (= (select (arr!5819 arr!308) #b00000000000000000000000000000000) (select (arr!5819 (_3!773 lt!356792)) #b00000000000000000000000000000000)))))

(declare-fun b!224651 () Bool)

(assert (=> b!224651 (= e!153139 (arrayRangesEq!764 arr!308 (_3!773 lt!356792) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) i!761))))

(assert (= (and d!76198 (not res!188548)) b!224650))

(assert (= (and b!224650 res!188549) b!224651))

(assert (=> b!224650 m!345091))

(declare-fun m!345099 () Bool)

(assert (=> b!224650 m!345099))

(declare-fun m!345101 () Bool)

(assert (=> b!224651 m!345101))

(assert (=> b!224560 d!76198))

(declare-fun d!76200 () Bool)

(declare-fun e!153140 () Bool)

(assert (=> d!76200 e!153140))

(declare-fun res!188550 () Bool)

(assert (=> d!76200 (=> (not res!188550) (not e!153140))))

(declare-fun lt!357158 () (_ BitVec 64))

(declare-fun lt!357160 () (_ BitVec 64))

(declare-fun lt!357159 () (_ BitVec 64))

(assert (=> d!76200 (= res!188550 (= lt!357158 (bvsub lt!357159 lt!357160)))))

(assert (=> d!76200 (or (= (bvand lt!357159 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!357160 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!357159 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!357159 lt!357160) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!76200 (= lt!357160 (remainingBits!0 ((_ sign_extend 32) (size!4868 (buf!5412 (_2!10392 lt!356794)))) ((_ sign_extend 32) (currentByte!10149 (_2!10392 lt!356794))) ((_ sign_extend 32) (currentBit!10144 (_2!10392 lt!356794)))))))

(declare-fun lt!357157 () (_ BitVec 64))

(declare-fun lt!357162 () (_ BitVec 64))

(assert (=> d!76200 (= lt!357159 (bvmul lt!357157 lt!357162))))

(assert (=> d!76200 (or (= lt!357157 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!357162 (bvsdiv (bvmul lt!357157 lt!357162) lt!357157)))))

(assert (=> d!76200 (= lt!357162 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76200 (= lt!357157 ((_ sign_extend 32) (size!4868 (buf!5412 (_2!10392 lt!356794)))))))

(assert (=> d!76200 (= lt!357158 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10149 (_2!10392 lt!356794))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10144 (_2!10392 lt!356794)))))))

(assert (=> d!76200 (invariant!0 (currentBit!10144 (_2!10392 lt!356794)) (currentByte!10149 (_2!10392 lt!356794)) (size!4868 (buf!5412 (_2!10392 lt!356794))))))

(assert (=> d!76200 (= (bitIndex!0 (size!4868 (buf!5412 (_2!10392 lt!356794))) (currentByte!10149 (_2!10392 lt!356794)) (currentBit!10144 (_2!10392 lt!356794))) lt!357158)))

(declare-fun b!224652 () Bool)

(declare-fun res!188551 () Bool)

(assert (=> b!224652 (=> (not res!188551) (not e!153140))))

(assert (=> b!224652 (= res!188551 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!357158))))

(declare-fun b!224653 () Bool)

(declare-fun lt!357161 () (_ BitVec 64))

(assert (=> b!224653 (= e!153140 (bvsle lt!357158 (bvmul lt!357161 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!224653 (or (= lt!357161 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!357161 #b0000000000000000000000000000000000000000000000000000000000001000) lt!357161)))))

(assert (=> b!224653 (= lt!357161 ((_ sign_extend 32) (size!4868 (buf!5412 (_2!10392 lt!356794)))))))

(assert (= (and d!76200 res!188550) b!224652))

(assert (= (and b!224652 res!188551) b!224653))

(assert (=> d!76200 m!344955))

(declare-fun m!345103 () Bool)

(assert (=> d!76200 m!345103))

(assert (=> b!224560 d!76200))

(declare-fun d!76202 () Bool)

(assert (=> d!76202 (and (bvsge i!761 #b00000000000000000000000000000000) (bvslt i!761 (size!4868 lt!356801)) (bvslt i!761 (size!4868 (_3!773 lt!356792))) (= (select (arr!5819 lt!356801) i!761) (select (arr!5819 (_3!773 lt!356792)) i!761)))))

(declare-fun lt!357174 () Unit!16438)

(declare-fun choose!293 (array!11093 array!11093 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16438)

(assert (=> d!76202 (= lt!357174 (choose!293 lt!356801 (_3!773 lt!356792) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!76202 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!76202 (= (arrayRangesEqImpliesEq!86 lt!356801 (_3!773 lt!356792) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)) lt!357174)))

(declare-fun bs!18586 () Bool)

(assert (= bs!18586 d!76202))

(declare-fun m!345109 () Bool)

(assert (=> bs!18586 m!345109))

(assert (=> bs!18586 m!344889))

(declare-fun m!345111 () Bool)

(assert (=> bs!18586 m!345111))

(assert (=> b!224560 d!76202))

(check-sat (not d!76140) (not bm!3626) (not b!224651) (not d!76183) (not b!224594) (not d!76200) (not b!224629) (not d!76164) (not b!224599) (not bm!3625) (not d!76169) (not d!76162) (not d!76202) (not bm!3627) (not b!224625) (not d!76148) (not d!76144) (not d!76196) (not d!76146) (not d!76187) (not b!224626) (not b!224647) (not b!224627) (not b!224587))
