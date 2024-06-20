; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46944 () Bool)

(assert start!46944)

(declare-fun b!224852 () Bool)

(declare-fun e!153324 () Bool)

(declare-datatypes ((array!11122 0))(
  ( (array!11123 (arr!5835 (Array (_ BitVec 32) (_ BitVec 8))) (size!4881 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8864 0))(
  ( (BitStream!8865 (buf!5425 array!11122) (currentByte!10171 (_ BitVec 32)) (currentBit!10166 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8864)

(declare-fun array_inv!4622 (array!11122) Bool)

(assert (=> b!224852 (= e!153324 (array_inv!4622 (buf!5425 thiss!1870)))))

(declare-fun res!188709 () Bool)

(declare-fun e!153323 () Bool)

(assert (=> start!46944 (=> (not res!188709) (not e!153323))))

(declare-fun arr!308 () array!11122)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!46944 (= res!188709 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4881 arr!308))))))

(assert (=> start!46944 e!153323))

(assert (=> start!46944 true))

(assert (=> start!46944 (array_inv!4622 arr!308)))

(declare-fun inv!12 (BitStream!8864) Bool)

(assert (=> start!46944 (and (inv!12 thiss!1870) e!153324)))

(declare-fun b!224849 () Bool)

(declare-fun res!188707 () Bool)

(assert (=> b!224849 (=> (not res!188707) (not e!153323))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!224849 (= res!188707 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4881 (buf!5425 thiss!1870))) ((_ sign_extend 32) (currentByte!10171 thiss!1870)) ((_ sign_extend 32) (currentBit!10166 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!224851 () Bool)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!224851 (= e!153323 (not (validate_offset_byte!0 ((_ sign_extend 32) (size!4881 (buf!5425 thiss!1870))) ((_ sign_extend 32) (currentByte!10171 thiss!1870)) ((_ sign_extend 32) (currentBit!10166 thiss!1870)))))))

(declare-datatypes ((tuple2!19272 0))(
  ( (tuple2!19273 (_1!10422 (_ BitVec 8)) (_2!10422 BitStream!8864)) )
))
(declare-fun lt!357753 () tuple2!19272)

(declare-datatypes ((Unit!16486 0))(
  ( (Unit!16487) )
))
(declare-datatypes ((tuple3!1288 0))(
  ( (tuple3!1289 (_1!10423 Unit!16486) (_2!10423 BitStream!8864) (_3!786 array!11122)) )
))
(declare-fun lt!357755 () tuple3!1288)

(assert (=> b!224851 (and (= (_1!10422 lt!357753) (select (arr!5835 (_3!786 lt!357755)) i!761)) (= (select (arr!5835 (_3!786 lt!357755)) i!761) (_1!10422 lt!357753)))))

(declare-fun lt!357754 () Unit!16486)

(declare-fun lt!357756 () array!11122)

(declare-fun arrayRangesEqImpliesEq!99 (array!11122 array!11122 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16486)

(assert (=> b!224851 (= lt!357754 (arrayRangesEqImpliesEq!99 lt!357756 (_3!786 lt!357755) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun arrayRangesEq!777 (array!11122 array!11122 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224851 (arrayRangesEq!777 arr!308 (_3!786 lt!357755) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!357759 () Unit!16486)

(declare-fun arrayRangesEqTransitive!248 (array!11122 array!11122 array!11122 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16486)

(assert (=> b!224851 (= lt!357759 (arrayRangesEqTransitive!248 arr!308 lt!357756 (_3!786 lt!357755) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!224851 (arrayRangesEq!777 arr!308 lt!357756 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!357757 () Unit!16486)

(declare-fun arrayUpdatedAtPrefixLemma!369 (array!11122 (_ BitVec 32) (_ BitVec 8)) Unit!16486)

(assert (=> b!224851 (= lt!357757 (arrayUpdatedAtPrefixLemma!369 arr!308 i!761 (_1!10422 lt!357753)))))

(declare-fun lt!357762 () (_ BitVec 64))

(declare-fun lt!357760 () (_ BitVec 64))

(declare-fun lt!357752 () (_ BitVec 64))

(declare-fun lt!357761 () (_ BitVec 32))

(assert (=> b!224851 (and (= (bvadd lt!357762 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!357761))) lt!357760) (= (bvadd lt!357752 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!357760) (= (buf!5425 thiss!1870) (buf!5425 (_2!10423 lt!357755))) (= (size!4881 arr!308) (size!4881 (_3!786 lt!357755))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!224851 (= lt!357760 (bitIndex!0 (size!4881 (buf!5425 (_2!10423 lt!357755))) (currentByte!10171 (_2!10423 lt!357755)) (currentBit!10166 (_2!10423 lt!357755))))))

(assert (=> b!224851 (= lt!357762 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!357752))))

(assert (=> b!224851 (= lt!357762 (bitIndex!0 (size!4881 (buf!5425 (_2!10422 lt!357753))) (currentByte!10171 (_2!10422 lt!357753)) (currentBit!10166 (_2!10422 lt!357753))))))

(assert (=> b!224851 (= lt!357752 (bitIndex!0 (size!4881 (buf!5425 thiss!1870)) (currentByte!10171 thiss!1870) (currentBit!10166 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8864 array!11122 (_ BitVec 32) (_ BitVec 32)) tuple3!1288)

(assert (=> b!224851 (= lt!357755 (readByteArrayLoop!0 (_2!10422 lt!357753) lt!357756 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!224851 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4881 (buf!5425 (_2!10422 lt!357753)))) ((_ sign_extend 32) (currentByte!10171 (_2!10422 lt!357753))) ((_ sign_extend 32) (currentBit!10166 (_2!10422 lt!357753))) lt!357761)))

(assert (=> b!224851 (= lt!357761 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!357758 () Unit!16486)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8864 BitStream!8864 (_ BitVec 64) (_ BitVec 32)) Unit!16486)

(assert (=> b!224851 (= lt!357758 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10422 lt!357753) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!224851 (= lt!357756 (array!11123 (store (arr!5835 arr!308) i!761 (_1!10422 lt!357753)) (size!4881 arr!308)))))

(declare-fun readByte!0 (BitStream!8864) tuple2!19272)

(assert (=> b!224851 (= lt!357753 (readByte!0 thiss!1870))))

(declare-fun b!224850 () Bool)

(declare-fun res!188708 () Bool)

(assert (=> b!224850 (=> (not res!188708) (not e!153323))))

(assert (=> b!224850 (= res!188708 (bvslt i!761 to!496))))

(assert (= (and start!46944 res!188709) b!224849))

(assert (= (and b!224849 res!188707) b!224850))

(assert (= (and b!224850 res!188708) b!224851))

(assert (= start!46944 b!224852))

(declare-fun m!345603 () Bool)

(assert (=> b!224852 m!345603))

(declare-fun m!345605 () Bool)

(assert (=> start!46944 m!345605))

(declare-fun m!345607 () Bool)

(assert (=> start!46944 m!345607))

(declare-fun m!345609 () Bool)

(assert (=> b!224849 m!345609))

(declare-fun m!345611 () Bool)

(assert (=> b!224851 m!345611))

(declare-fun m!345613 () Bool)

(assert (=> b!224851 m!345613))

(declare-fun m!345615 () Bool)

(assert (=> b!224851 m!345615))

(declare-fun m!345617 () Bool)

(assert (=> b!224851 m!345617))

(declare-fun m!345619 () Bool)

(assert (=> b!224851 m!345619))

(declare-fun m!345621 () Bool)

(assert (=> b!224851 m!345621))

(declare-fun m!345623 () Bool)

(assert (=> b!224851 m!345623))

(declare-fun m!345625 () Bool)

(assert (=> b!224851 m!345625))

(declare-fun m!345627 () Bool)

(assert (=> b!224851 m!345627))

(declare-fun m!345629 () Bool)

(assert (=> b!224851 m!345629))

(declare-fun m!345631 () Bool)

(assert (=> b!224851 m!345631))

(declare-fun m!345633 () Bool)

(assert (=> b!224851 m!345633))

(declare-fun m!345635 () Bool)

(assert (=> b!224851 m!345635))

(declare-fun m!345637 () Bool)

(assert (=> b!224851 m!345637))

(declare-fun m!345639 () Bool)

(assert (=> b!224851 m!345639))

(push 1)

(assert (not start!46944))

(assert (not b!224849))

(assert (not b!224852))

(assert (not b!224851))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!76269 () Bool)

(assert (=> d!76269 (= (array_inv!4622 arr!308) (bvsge (size!4881 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!46944 d!76269))

(declare-fun d!76271 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!76271 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10166 thiss!1870) (currentByte!10171 thiss!1870) (size!4881 (buf!5425 thiss!1870))))))

(declare-fun bs!18607 () Bool)

(assert (= bs!18607 d!76271))

(declare-fun m!345655 () Bool)

(assert (=> bs!18607 m!345655))

(assert (=> start!46944 d!76271))

(declare-fun d!76273 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!76273 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4881 (buf!5425 thiss!1870))) ((_ sign_extend 32) (currentByte!10171 thiss!1870)) ((_ sign_extend 32) (currentBit!10166 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4881 (buf!5425 thiss!1870))) ((_ sign_extend 32) (currentByte!10171 thiss!1870)) ((_ sign_extend 32) (currentBit!10166 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18608 () Bool)

(assert (= bs!18608 d!76273))

(declare-fun m!345657 () Bool)

(assert (=> bs!18608 m!345657))

(assert (=> b!224849 d!76273))

(declare-fun d!76275 () Bool)

(assert (=> d!76275 (= (array_inv!4622 (buf!5425 thiss!1870)) (bvsge (size!4881 (buf!5425 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!224852 d!76275))

(declare-fun d!76277 () Bool)

(declare-fun e!153337 () Bool)

(assert (=> d!76277 e!153337))

(declare-fun res!188723 () Bool)

(assert (=> d!76277 (=> (not res!188723) (not e!153337))))

(declare-fun lt!357785 () (_ BitVec 64))

(declare-fun lt!357782 () (_ BitVec 64))

(declare-fun lt!357784 () (_ BitVec 64))

(assert (=> d!76277 (= res!188723 (= lt!357782 (bvsub lt!357785 lt!357784)))))

(assert (=> d!76277 (or (= (bvand lt!357785 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!357784 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!357785 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!357785 lt!357784) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!76277 (= lt!357784 (remainingBits!0 ((_ sign_extend 32) (size!4881 (buf!5425 (_2!10423 lt!357755)))) ((_ sign_extend 32) (currentByte!10171 (_2!10423 lt!357755))) ((_ sign_extend 32) (currentBit!10166 (_2!10423 lt!357755)))))))

(declare-fun lt!357783 () (_ BitVec 64))

(declare-fun lt!357786 () (_ BitVec 64))

(assert (=> d!76277 (= lt!357785 (bvmul lt!357783 lt!357786))))

(assert (=> d!76277 (or (= lt!357783 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!357786 (bvsdiv (bvmul lt!357783 lt!357786) lt!357783)))))

(assert (=> d!76277 (= lt!357786 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76277 (= lt!357783 ((_ sign_extend 32) (size!4881 (buf!5425 (_2!10423 lt!357755)))))))

(assert (=> d!76277 (= lt!357782 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10171 (_2!10423 lt!357755))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10166 (_2!10423 lt!357755)))))))

(assert (=> d!76277 (invariant!0 (currentBit!10166 (_2!10423 lt!357755)) (currentByte!10171 (_2!10423 lt!357755)) (size!4881 (buf!5425 (_2!10423 lt!357755))))))

(assert (=> d!76277 (= (bitIndex!0 (size!4881 (buf!5425 (_2!10423 lt!357755))) (currentByte!10171 (_2!10423 lt!357755)) (currentBit!10166 (_2!10423 lt!357755))) lt!357782)))

(declare-fun b!224865 () Bool)

(declare-fun res!188724 () Bool)

(assert (=> b!224865 (=> (not res!188724) (not e!153337))))

(assert (=> b!224865 (= res!188724 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!357782))))

(declare-fun b!224866 () Bool)

(declare-fun lt!357787 () (_ BitVec 64))

(assert (=> b!224866 (= e!153337 (bvsle lt!357782 (bvmul lt!357787 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!224866 (or (= lt!357787 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!357787 #b0000000000000000000000000000000000000000000000000000000000001000) lt!357787)))))

(assert (=> b!224866 (= lt!357787 ((_ sign_extend 32) (size!4881 (buf!5425 (_2!10423 lt!357755)))))))

(assert (= (and d!76277 res!188723) b!224865))

(assert (= (and b!224865 res!188724) b!224866))

(declare-fun m!345659 () Bool)

(assert (=> d!76277 m!345659))

(declare-fun m!345661 () Bool)

(assert (=> d!76277 m!345661))

(assert (=> b!224851 d!76277))

(declare-fun d!76279 () Bool)

(declare-fun lt!357852 () (_ BitVec 8))

(declare-fun lt!357854 () (_ BitVec 8))

(assert (=> d!76279 (= lt!357852 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5835 (buf!5425 thiss!1870)) (currentByte!10171 thiss!1870))) ((_ sign_extend 24) lt!357854))))))

(assert (=> d!76279 (= lt!357854 ((_ extract 7 0) (currentBit!10166 thiss!1870)))))

(declare-fun e!153354 () Bool)

(assert (=> d!76279 e!153354))

(declare-fun res!188748 () Bool)

(assert (=> d!76279 (=> (not res!188748) (not e!153354))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!76279 (= res!188748 (validate_offset_bits!1 ((_ sign_extend 32) (size!4881 (buf!5425 thiss!1870))) ((_ sign_extend 32) (currentByte!10171 thiss!1870)) ((_ sign_extend 32) (currentBit!10166 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!19278 0))(
  ( (tuple2!19279 (_1!10426 Unit!16486) (_2!10426 (_ BitVec 8))) )
))
(declare-fun Unit!16499 () Unit!16486)

(declare-fun Unit!16500 () Unit!16486)

(assert (=> d!76279 (= (readByte!0 thiss!1870) (tuple2!19273 (_2!10426 (ite (bvsgt ((_ sign_extend 24) lt!357854) #b00000000000000000000000000000000) (tuple2!19279 Unit!16499 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!357852) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5835 (buf!5425 thiss!1870)) (bvadd (currentByte!10171 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!357854)))))))) (tuple2!19279 Unit!16500 lt!357852))) (BitStream!8865 (buf!5425 thiss!1870) (bvadd (currentByte!10171 thiss!1870) #b00000000000000000000000000000001) (currentBit!10166 thiss!1870))))))

(declare-fun b!224888 () Bool)

(declare-fun e!153355 () Bool)

(assert (=> b!224888 (= e!153354 e!153355)))

(declare-fun res!188747 () Bool)

(assert (=> b!224888 (=> (not res!188747) (not e!153355))))

(declare-fun lt!357858 () tuple2!19272)

(assert (=> b!224888 (= res!188747 (= (buf!5425 (_2!10422 lt!357858)) (buf!5425 thiss!1870)))))

(declare-fun lt!357853 () (_ BitVec 8))

(declare-fun lt!357856 () (_ BitVec 8))

(declare-fun Unit!16503 () Unit!16486)

(declare-fun Unit!16504 () Unit!16486)

(assert (=> b!224888 (= lt!357858 (tuple2!19273 (_2!10426 (ite (bvsgt ((_ sign_extend 24) lt!357853) #b00000000000000000000000000000000) (tuple2!19279 Unit!16503 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!357856) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5835 (buf!5425 thiss!1870)) (bvadd (currentByte!10171 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!357853)))))))) (tuple2!19279 Unit!16504 lt!357856))) (BitStream!8865 (buf!5425 thiss!1870) (bvadd (currentByte!10171 thiss!1870) #b00000000000000000000000000000001) (currentBit!10166 thiss!1870))))))

(assert (=> b!224888 (= lt!357856 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5835 (buf!5425 thiss!1870)) (currentByte!10171 thiss!1870))) ((_ sign_extend 24) lt!357853))))))

(assert (=> b!224888 (= lt!357853 ((_ extract 7 0) (currentBit!10166 thiss!1870)))))

(declare-fun b!224889 () Bool)

(declare-fun lt!357855 () (_ BitVec 64))

(declare-fun lt!357857 () (_ BitVec 64))

(assert (=> b!224889 (= e!153355 (= (bitIndex!0 (size!4881 (buf!5425 (_2!10422 lt!357858))) (currentByte!10171 (_2!10422 lt!357858)) (currentBit!10166 (_2!10422 lt!357858))) (bvadd lt!357855 lt!357857)))))

(assert (=> b!224889 (or (not (= (bvand lt!357855 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!357857 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!357855 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!357855 lt!357857) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!224889 (= lt!357857 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!224889 (= lt!357855 (bitIndex!0 (size!4881 (buf!5425 thiss!1870)) (currentByte!10171 thiss!1870) (currentBit!10166 thiss!1870)))))

(assert (= (and d!76279 res!188748) b!224888))

(assert (= (and b!224888 res!188747) b!224889))

(declare-fun m!345683 () Bool)

(assert (=> d!76279 m!345683))

(declare-fun m!345685 () Bool)

(assert (=> d!76279 m!345685))

(declare-fun m!345687 () Bool)

(assert (=> d!76279 m!345687))

(assert (=> b!224888 m!345687))

(assert (=> b!224888 m!345683))

(declare-fun m!345689 () Bool)

(assert (=> b!224889 m!345689))

(assert (=> b!224889 m!345625))

(assert (=> b!224851 d!76279))

(declare-fun d!76294 () Bool)

(declare-fun e!153361 () Bool)

(assert (=> d!76294 e!153361))

(declare-fun res!188754 () Bool)

(assert (=> d!76294 (=> (not res!188754) (not e!153361))))

(assert (=> d!76294 (= res!188754 (and (or (let ((rhs!3781 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3781 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3781) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!76295 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!76295 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!76295 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3780 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3780 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3780) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!357877 () Unit!16486)

(declare-fun choose!57 (BitStream!8864 BitStream!8864 (_ BitVec 64) (_ BitVec 32)) Unit!16486)

(assert (=> d!76294 (= lt!357877 (choose!57 thiss!1870 (_2!10422 lt!357753) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> d!76294 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10422 lt!357753) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)) lt!357877)))

(declare-fun lt!357879 () (_ BitVec 32))

(declare-fun b!224895 () Bool)

(assert (=> b!224895 (= e!153361 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4881 (buf!5425 (_2!10422 lt!357753)))) ((_ sign_extend 32) (currentByte!10171 (_2!10422 lt!357753))) ((_ sign_extend 32) (currentBit!10166 (_2!10422 lt!357753))) (bvsub (bvsub to!496 i!761) lt!357879)))))

(assert (=> b!224895 (or (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand lt!357879 #b10000000000000000000000000000000)) (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!496 i!761) lt!357879) #b10000000000000000000000000000000)))))

(declare-fun lt!357878 () (_ BitVec 64))

(assert (=> b!224895 (= lt!357879 ((_ extract 31 0) lt!357878))))

(assert (=> b!224895 (and (bvslt lt!357878 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!357878 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!224895 (= lt!357878 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!76294 res!188754) b!224895))

(declare-fun m!345697 () Bool)

(assert (=> d!76294 m!345697))

(declare-fun m!345699 () Bool)

(assert (=> b!224895 m!345699))

(assert (=> b!224851 d!76294))

(declare-fun d!76301 () Bool)

(declare-fun res!188759 () Bool)

(declare-fun e!153366 () Bool)

(assert (=> d!76301 (=> res!188759 e!153366)))

(assert (=> d!76301 (= res!188759 (= #b00000000000000000000000000000000 i!761))))

(assert (=> d!76301 (= (arrayRangesEq!777 arr!308 lt!357756 #b00000000000000000000000000000000 i!761) e!153366)))

(declare-fun b!224900 () Bool)

(declare-fun e!153367 () Bool)

(assert (=> b!224900 (= e!153366 e!153367)))

(declare-fun res!188760 () Bool)

(assert (=> b!224900 (=> (not res!188760) (not e!153367))))

(assert (=> b!224900 (= res!188760 (= (select (arr!5835 arr!308) #b00000000000000000000000000000000) (select (arr!5835 lt!357756) #b00000000000000000000000000000000)))))

(declare-fun b!224901 () Bool)

(assert (=> b!224901 (= e!153367 (arrayRangesEq!777 arr!308 lt!357756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) i!761))))

(assert (= (and d!76301 (not res!188759)) b!224900))

(assert (= (and b!224900 res!188760) b!224901))

(declare-fun m!345701 () Bool)

(assert (=> b!224900 m!345701))

(declare-fun m!345703 () Bool)

(assert (=> b!224900 m!345703))

(declare-fun m!345705 () Bool)

(assert (=> b!224901 m!345705))

(assert (=> b!224851 d!76301))

(declare-fun d!76303 () Bool)

(assert (=> d!76303 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4881 (buf!5425 (_2!10422 lt!357753)))) ((_ sign_extend 32) (currentByte!10171 (_2!10422 lt!357753))) ((_ sign_extend 32) (currentBit!10166 (_2!10422 lt!357753))) lt!357761) (bvsle ((_ sign_extend 32) lt!357761) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4881 (buf!5425 (_2!10422 lt!357753)))) ((_ sign_extend 32) (currentByte!10171 (_2!10422 lt!357753))) ((_ sign_extend 32) (currentBit!10166 (_2!10422 lt!357753)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18611 () Bool)

(assert (= bs!18611 d!76303))

(declare-fun m!345707 () Bool)

(assert (=> bs!18611 m!345707))

(assert (=> b!224851 d!76303))

(declare-fun d!76305 () Bool)

(declare-fun e!153368 () Bool)

(assert (=> d!76305 e!153368))

(declare-fun res!188761 () Bool)

(assert (=> d!76305 (=> (not res!188761) (not e!153368))))

(declare-fun lt!357882 () (_ BitVec 64))

(declare-fun lt!357880 () (_ BitVec 64))

(declare-fun lt!357883 () (_ BitVec 64))

(assert (=> d!76305 (= res!188761 (= lt!357880 (bvsub lt!357883 lt!357882)))))

(assert (=> d!76305 (or (= (bvand lt!357883 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!357882 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!357883 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!357883 lt!357882) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!76305 (= lt!357882 (remainingBits!0 ((_ sign_extend 32) (size!4881 (buf!5425 thiss!1870))) ((_ sign_extend 32) (currentByte!10171 thiss!1870)) ((_ sign_extend 32) (currentBit!10166 thiss!1870))))))

(declare-fun lt!357881 () (_ BitVec 64))

(declare-fun lt!357884 () (_ BitVec 64))

(assert (=> d!76305 (= lt!357883 (bvmul lt!357881 lt!357884))))

(assert (=> d!76305 (or (= lt!357881 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!357884 (bvsdiv (bvmul lt!357881 lt!357884) lt!357881)))))

(assert (=> d!76305 (= lt!357884 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76305 (= lt!357881 ((_ sign_extend 32) (size!4881 (buf!5425 thiss!1870))))))

(assert (=> d!76305 (= lt!357880 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10171 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10166 thiss!1870))))))

(assert (=> d!76305 (invariant!0 (currentBit!10166 thiss!1870) (currentByte!10171 thiss!1870) (size!4881 (buf!5425 thiss!1870)))))

(assert (=> d!76305 (= (bitIndex!0 (size!4881 (buf!5425 thiss!1870)) (currentByte!10171 thiss!1870) (currentBit!10166 thiss!1870)) lt!357880)))

(declare-fun b!224902 () Bool)

(declare-fun res!188762 () Bool)

(assert (=> b!224902 (=> (not res!188762) (not e!153368))))

(assert (=> b!224902 (= res!188762 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!357880))))

(declare-fun b!224903 () Bool)

(declare-fun lt!357885 () (_ BitVec 64))

(assert (=> b!224903 (= e!153368 (bvsle lt!357880 (bvmul lt!357885 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!224903 (or (= lt!357885 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!357885 #b0000000000000000000000000000000000000000000000000000000000001000) lt!357885)))))

(assert (=> b!224903 (= lt!357885 ((_ sign_extend 32) (size!4881 (buf!5425 thiss!1870))))))

(assert (= (and d!76305 res!188761) b!224902))

(assert (= (and b!224902 res!188762) b!224903))

(assert (=> d!76305 m!345657))

(assert (=> d!76305 m!345655))

(assert (=> b!224851 d!76305))

(declare-fun d!76307 () Bool)

(assert (=> d!76307 (and (bvsge i!761 #b00000000000000000000000000000000) (bvslt i!761 (size!4881 lt!357756)) (bvslt i!761 (size!4881 (_3!786 lt!357755))) (= (select (arr!5835 lt!357756) i!761) (select (arr!5835 (_3!786 lt!357755)) i!761)))))

(declare-fun lt!357888 () Unit!16486)

(declare-fun choose!299 (array!11122 array!11122 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16486)

(assert (=> d!76307 (= lt!357888 (choose!299 lt!357756 (_3!786 lt!357755) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!76307 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!76307 (= (arrayRangesEqImpliesEq!99 lt!357756 (_3!786 lt!357755) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)) lt!357888)))

(declare-fun bs!18612 () Bool)

(assert (= bs!18612 d!76307))

(declare-fun m!345709 () Bool)

(assert (=> bs!18612 m!345709))

(assert (=> bs!18612 m!345615))

(declare-fun m!345711 () Bool)

(assert (=> bs!18612 m!345711))

(assert (=> b!224851 d!76307))

(declare-fun d!76309 () Bool)

(assert (=> d!76309 (arrayRangesEq!777 arr!308 (_3!786 lt!357755) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!357891 () Unit!16486)

(declare-fun choose!300 (array!11122 array!11122 array!11122 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16486)

(assert (=> d!76309 (= lt!357891 (choose!300 arr!308 lt!357756 (_3!786 lt!357755) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!76309 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!76309 (= (arrayRangesEqTransitive!248 arr!308 lt!357756 (_3!786 lt!357755) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)) lt!357891)))

(declare-fun bs!18613 () Bool)

(assert (= bs!18613 d!76309))

(assert (=> bs!18613 m!345617))

(declare-fun m!345713 () Bool)

(assert (=> bs!18613 m!345713))

(assert (=> b!224851 d!76309))

(declare-fun b!224976 () Bool)

(declare-fun e!153422 () Bool)

(declare-fun lt!358261 () tuple3!1288)

(assert (=> b!224976 (= e!153422 (arrayRangesEq!777 lt!357756 (_3!786 lt!358261) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun e!153420 () Bool)

(declare-fun b!224977 () Bool)

(declare-datatypes ((tuple2!19284 0))(
  ( (tuple2!19285 (_1!10429 BitStream!8864) (_2!10429 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!8864) tuple2!19284)

(assert (=> b!224977 (= e!153420 (= (select (arr!5835 (_3!786 lt!358261)) (bvadd #b00000000000000000000000000000001 i!761)) (_2!10429 (readBytePure!0 (_2!10422 lt!357753)))))))

(assert (=> b!224977 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4881 (_3!786 lt!358261))))))

(declare-fun call!3666 () Bool)

(declare-fun bm!3661 () Bool)

(declare-fun lt!358281 () (_ BitVec 32))

(declare-fun lt!358283 () array!11122)

(declare-fun c!11149 () Bool)

(declare-fun lt!358260 () (_ BitVec 32))

(declare-fun lt!358280 () (_ BitVec 32))

(declare-fun lt!358267 () array!11122)

(declare-fun lt!358250 () tuple3!1288)

(assert (=> bm!3661 (= call!3666 (arrayRangesEq!777 (ite c!11149 lt!357756 lt!358267) (ite c!11149 (_3!786 lt!358250) lt!358283) (ite c!11149 lt!358280 lt!358260) (ite c!11149 (bvadd #b00000000000000000000000000000001 i!761) lt!358281)))))

(declare-fun bm!3662 () Bool)

(declare-fun lt!358251 () tuple2!19272)

(declare-fun call!3664 () (_ BitVec 64))

(assert (=> bm!3662 (= call!3664 (bitIndex!0 (ite c!11149 (size!4881 (buf!5425 (_2!10422 lt!358251))) (size!4881 (buf!5425 (_2!10422 lt!357753)))) (ite c!11149 (currentByte!10171 (_2!10422 lt!358251)) (currentByte!10171 (_2!10422 lt!357753))) (ite c!11149 (currentBit!10166 (_2!10422 lt!358251)) (currentBit!10166 (_2!10422 lt!357753)))))))

(declare-fun b!224979 () Bool)

(declare-fun res!188821 () Bool)

(assert (=> b!224979 (=> (not res!188821) (not e!153422))))

(assert (=> b!224979 (= res!188821 (and (= (buf!5425 (_2!10422 lt!357753)) (buf!5425 (_2!10423 lt!358261))) (= (size!4881 lt!357756) (size!4881 (_3!786 lt!358261)))))))

(declare-fun b!224980 () Bool)

(declare-fun e!153421 () tuple3!1288)

(declare-fun lt!358254 () Unit!16486)

(assert (=> b!224980 (= e!153421 (tuple3!1289 lt!358254 (_2!10423 lt!358250) (_3!786 lt!358250)))))

(assert (=> b!224980 (= lt!358251 (readByte!0 (_2!10422 lt!357753)))))

(declare-fun lt!358275 () array!11122)

(assert (=> b!224980 (= lt!358275 (array!11123 (store (arr!5835 lt!357756) (bvadd #b00000000000000000000000000000001 i!761) (_1!10422 lt!358251)) (size!4881 lt!357756)))))

(declare-fun lt!358272 () (_ BitVec 64))

(assert (=> b!224980 (= lt!358272 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!358249 () (_ BitVec 32))

(assert (=> b!224980 (= lt!358249 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!358284 () Unit!16486)

(assert (=> b!224980 (= lt!358284 (validateOffsetBytesFromBitIndexLemma!0 (_2!10422 lt!357753) (_2!10422 lt!358251) lt!358272 lt!358249))))

(assert (=> b!224980 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4881 (buf!5425 (_2!10422 lt!358251)))) ((_ sign_extend 32) (currentByte!10171 (_2!10422 lt!358251))) ((_ sign_extend 32) (currentBit!10166 (_2!10422 lt!358251))) (bvsub lt!358249 ((_ extract 31 0) (bvsdiv (bvadd lt!358272 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!358273 () Unit!16486)

(assert (=> b!224980 (= lt!358273 lt!358284)))

(assert (=> b!224980 (= lt!358250 (readByteArrayLoop!0 (_2!10422 lt!358251) lt!358275 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(assert (=> b!224980 (= call!3664 (bvadd (bitIndex!0 (size!4881 (buf!5425 (_2!10422 lt!357753))) (currentByte!10171 (_2!10422 lt!357753)) (currentBit!10166 (_2!10422 lt!357753))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!358282 () Unit!16486)

(declare-fun Unit!16514 () Unit!16486)

(assert (=> b!224980 (= lt!358282 Unit!16514)))

(assert (=> b!224980 (= (bvadd call!3664 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4881 (buf!5425 (_2!10423 lt!358250))) (currentByte!10171 (_2!10423 lt!358250)) (currentBit!10166 (_2!10423 lt!358250))))))

(declare-fun lt!358253 () Unit!16486)

(declare-fun Unit!16515 () Unit!16486)

(assert (=> b!224980 (= lt!358253 Unit!16515)))

(assert (=> b!224980 (= (bvadd (bitIndex!0 (size!4881 (buf!5425 (_2!10422 lt!357753))) (currentByte!10171 (_2!10422 lt!357753)) (currentBit!10166 (_2!10422 lt!357753))) (bvmul ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4881 (buf!5425 (_2!10423 lt!358250))) (currentByte!10171 (_2!10423 lt!358250)) (currentBit!10166 (_2!10423 lt!358250))))))

(declare-fun lt!358257 () Unit!16486)

(declare-fun Unit!16516 () Unit!16486)

(assert (=> b!224980 (= lt!358257 Unit!16516)))

(assert (=> b!224980 (and (= (buf!5425 (_2!10422 lt!357753)) (buf!5425 (_2!10423 lt!358250))) (= (size!4881 lt!357756) (size!4881 (_3!786 lt!358250))))))

(declare-fun lt!358262 () Unit!16486)

(declare-fun Unit!16517 () Unit!16486)

(assert (=> b!224980 (= lt!358262 Unit!16517)))

(declare-fun lt!358274 () Unit!16486)

(assert (=> b!224980 (= lt!358274 (arrayUpdatedAtPrefixLemma!369 lt!357756 (bvadd #b00000000000000000000000000000001 i!761) (_1!10422 lt!358251)))))

(assert (=> b!224980 (arrayRangesEq!777 lt!357756 (array!11123 (store (arr!5835 lt!357756) (bvadd #b00000000000000000000000000000001 i!761) (_1!10422 lt!358251)) (size!4881 lt!357756)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun lt!358265 () Unit!16486)

(assert (=> b!224980 (= lt!358265 lt!358274)))

(assert (=> b!224980 (= lt!358280 #b00000000000000000000000000000000)))

(declare-fun lt!358266 () Unit!16486)

(assert (=> b!224980 (= lt!358266 (arrayRangesEqTransitive!248 lt!357756 lt!358275 (_3!786 lt!358250) lt!358280 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!224980 call!3666))

(declare-fun lt!358263 () Unit!16486)

(assert (=> b!224980 (= lt!358263 lt!358266)))

(declare-fun call!3665 () Bool)

(assert (=> b!224980 call!3665))

(declare-fun lt!358252 () Unit!16486)

(declare-fun Unit!16518 () Unit!16486)

(assert (=> b!224980 (= lt!358252 Unit!16518)))

(declare-fun lt!358264 () Unit!16486)

(assert (=> b!224980 (= lt!358264 (arrayRangesEqImpliesEq!99 lt!358275 (_3!786 lt!358250) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!224980 (= (select (store (arr!5835 lt!357756) (bvadd #b00000000000000000000000000000001 i!761) (_1!10422 lt!358251)) (bvadd #b00000000000000000000000000000001 i!761)) (select (arr!5835 (_3!786 lt!358250)) (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!358278 () Unit!16486)

(assert (=> b!224980 (= lt!358278 lt!358264)))

(declare-fun lt!358259 () Bool)

(assert (=> b!224980 (= lt!358259 (= (select (arr!5835 (_3!786 lt!358250)) (bvadd #b00000000000000000000000000000001 i!761)) (_1!10422 lt!358251)))))

(declare-fun Unit!16519 () Unit!16486)

(assert (=> b!224980 (= lt!358254 Unit!16519)))

(assert (=> b!224980 lt!358259))

(declare-fun bm!3663 () Bool)

(assert (=> bm!3663 (= call!3665 (arrayRangesEq!777 lt!357756 (ite c!11149 (_3!786 lt!358250) lt!357756) #b00000000000000000000000000000000 (ite c!11149 (bvadd #b00000000000000000000000000000001 i!761) (size!4881 lt!357756))))))

(declare-fun d!76311 () Bool)

(assert (=> d!76311 e!153420))

(declare-fun res!188820 () Bool)

(assert (=> d!76311 (=> res!188820 e!153420)))

(assert (=> d!76311 (= res!188820 (bvsge (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!358271 () Bool)

(assert (=> d!76311 (= lt!358271 e!153422)))

(declare-fun res!188822 () Bool)

(assert (=> d!76311 (=> (not res!188822) (not e!153422))))

(declare-fun lt!358255 () (_ BitVec 64))

(declare-fun lt!358268 () (_ BitVec 64))

(assert (=> d!76311 (= res!188822 (= (bvadd lt!358255 lt!358268) (bitIndex!0 (size!4881 (buf!5425 (_2!10423 lt!358261))) (currentByte!10171 (_2!10423 lt!358261)) (currentBit!10166 (_2!10423 lt!358261)))))))

(assert (=> d!76311 (or (not (= (bvand lt!358255 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!358268 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!358255 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!358255 lt!358268) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!358256 () (_ BitVec 64))

(assert (=> d!76311 (= lt!358268 (bvmul lt!358256 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!76311 (or (= lt!358256 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!358256 #b0000000000000000000000000000000000000000000000000000000000001000) lt!358256)))))

(assert (=> d!76311 (= lt!358256 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))))))

(assert (=> d!76311 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b10000000000000000000000000000000)))))

(assert (=> d!76311 (= lt!358255 (bitIndex!0 (size!4881 (buf!5425 (_2!10422 lt!357753))) (currentByte!10171 (_2!10422 lt!357753)) (currentBit!10166 (_2!10422 lt!357753))))))

(assert (=> d!76311 (= lt!358261 e!153421)))

(assert (=> d!76311 (= c!11149 (bvslt (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> d!76311 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) to!496) (bvsle to!496 (size!4881 lt!357756)))))

(assert (=> d!76311 (= (readByteArrayLoop!0 (_2!10422 lt!357753) lt!357756 (bvadd #b00000000000000000000000000000001 i!761) to!496) lt!358261)))

(declare-fun lt!358269 () Unit!16486)

(declare-fun b!224978 () Bool)

(assert (=> b!224978 (= e!153421 (tuple3!1289 lt!358269 (_2!10422 lt!357753) lt!357756))))

(assert (=> b!224978 (= call!3664 call!3664)))

(declare-fun lt!358277 () Unit!16486)

(declare-fun Unit!16520 () Unit!16486)

(assert (=> b!224978 (= lt!358277 Unit!16520)))

(declare-fun lt!358258 () Unit!16486)

(declare-fun arrayRangesEqReflexiveLemma!81 (array!11122) Unit!16486)

(assert (=> b!224978 (= lt!358258 (arrayRangesEqReflexiveLemma!81 lt!357756))))

(assert (=> b!224978 call!3665))

(declare-fun lt!358279 () Unit!16486)

(assert (=> b!224978 (= lt!358279 lt!358258)))

(assert (=> b!224978 (= lt!358267 lt!357756)))

(assert (=> b!224978 (= lt!358283 lt!357756)))

(declare-fun lt!358276 () (_ BitVec 32))

(assert (=> b!224978 (= lt!358276 #b00000000000000000000000000000000)))

(declare-fun lt!358270 () (_ BitVec 32))

(assert (=> b!224978 (= lt!358270 (size!4881 lt!357756))))

(assert (=> b!224978 (= lt!358260 #b00000000000000000000000000000000)))

(assert (=> b!224978 (= lt!358281 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun arrayRangesEqSlicedLemma!81 (array!11122 array!11122 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16486)

(assert (=> b!224978 (= lt!358269 (arrayRangesEqSlicedLemma!81 lt!358267 lt!358283 lt!358276 lt!358270 lt!358260 lt!358281))))

(assert (=> b!224978 call!3666))

(assert (= (and d!76311 c!11149) b!224980))

(assert (= (and d!76311 (not c!11149)) b!224978))

(assert (= (or b!224980 b!224978) bm!3661))

(assert (= (or b!224980 b!224978) bm!3663))

(assert (= (or b!224980 b!224978) bm!3662))

(assert (= (and d!76311 res!188822) b!224979))

(assert (= (and b!224979 res!188821) b!224976))

(assert (= (and d!76311 (not res!188820)) b!224977))

(declare-fun m!345847 () Bool)

(assert (=> bm!3663 m!345847))

(declare-fun m!345849 () Bool)

(assert (=> bm!3662 m!345849))

(declare-fun m!345851 () Bool)

(assert (=> b!224976 m!345851))

(declare-fun m!345853 () Bool)

(assert (=> b!224977 m!345853))

(declare-fun m!345855 () Bool)

(assert (=> b!224977 m!345855))

(declare-fun m!345857 () Bool)

(assert (=> b!224980 m!345857))

(declare-fun m!345859 () Bool)

(assert (=> b!224980 m!345859))

(declare-fun m!345861 () Bool)

(assert (=> b!224980 m!345861))

(declare-fun m!345863 () Bool)

(assert (=> b!224980 m!345863))

(declare-fun m!345865 () Bool)

(assert (=> b!224980 m!345865))

(declare-fun m!345867 () Bool)

(assert (=> b!224980 m!345867))

(declare-fun m!345869 () Bool)

(assert (=> b!224980 m!345869))

(assert (=> b!224980 m!345639))

(declare-fun m!345871 () Bool)

(assert (=> b!224980 m!345871))

(declare-fun m!345873 () Bool)

(assert (=> b!224980 m!345873))

(declare-fun m!345875 () Bool)

(assert (=> b!224980 m!345875))

(declare-fun m!345877 () Bool)

(assert (=> b!224980 m!345877))

(declare-fun m!345879 () Bool)

(assert (=> b!224980 m!345879))

(declare-fun m!345881 () Bool)

(assert (=> bm!3661 m!345881))

(declare-fun m!345883 () Bool)

(assert (=> d!76311 m!345883))

(assert (=> d!76311 m!345639))

(declare-fun m!345885 () Bool)

(assert (=> b!224978 m!345885))

(declare-fun m!345887 () Bool)

(assert (=> b!224978 m!345887))

(assert (=> b!224851 d!76311))

(declare-fun d!76348 () Bool)

(declare-fun res!188823 () Bool)

(declare-fun e!153423 () Bool)

(assert (=> d!76348 (=> res!188823 e!153423)))

(assert (=> d!76348 (= res!188823 (= #b00000000000000000000000000000000 i!761))))

(assert (=> d!76348 (= (arrayRangesEq!777 arr!308 (_3!786 lt!357755) #b00000000000000000000000000000000 i!761) e!153423)))

(declare-fun b!224981 () Bool)

(declare-fun e!153424 () Bool)

(assert (=> b!224981 (= e!153423 e!153424)))

(declare-fun res!188824 () Bool)

(assert (=> b!224981 (=> (not res!188824) (not e!153424))))

(assert (=> b!224981 (= res!188824 (= (select (arr!5835 arr!308) #b00000000000000000000000000000000) (select (arr!5835 (_3!786 lt!357755)) #b00000000000000000000000000000000)))))

(declare-fun b!224982 () Bool)

(assert (=> b!224982 (= e!153424 (arrayRangesEq!777 arr!308 (_3!786 lt!357755) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) i!761))))

(assert (= (and d!76348 (not res!188823)) b!224981))

(assert (= (and b!224981 res!188824) b!224982))

(assert (=> b!224981 m!345701))

(declare-fun m!345889 () Bool)

(assert (=> b!224981 m!345889))

(declare-fun m!345891 () Bool)

(assert (=> b!224982 m!345891))

(assert (=> b!224851 d!76348))

(declare-fun d!76350 () Bool)

(declare-fun e!153425 () Bool)

(assert (=> d!76350 e!153425))

(declare-fun res!188825 () Bool)

(assert (=> d!76350 (=> (not res!188825) (not e!153425))))

(declare-fun lt!358288 () (_ BitVec 64))

(declare-fun lt!358287 () (_ BitVec 64))

(declare-fun lt!358285 () (_ BitVec 64))

(assert (=> d!76350 (= res!188825 (= lt!358285 (bvsub lt!358288 lt!358287)))))

(assert (=> d!76350 (or (= (bvand lt!358288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!358287 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!358288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!358288 lt!358287) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!76350 (= lt!358287 (remainingBits!0 ((_ sign_extend 32) (size!4881 (buf!5425 (_2!10422 lt!357753)))) ((_ sign_extend 32) (currentByte!10171 (_2!10422 lt!357753))) ((_ sign_extend 32) (currentBit!10166 (_2!10422 lt!357753)))))))

(declare-fun lt!358286 () (_ BitVec 64))

(declare-fun lt!358289 () (_ BitVec 64))

(assert (=> d!76350 (= lt!358288 (bvmul lt!358286 lt!358289))))

(assert (=> d!76350 (or (= lt!358286 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!358289 (bvsdiv (bvmul lt!358286 lt!358289) lt!358286)))))

(assert (=> d!76350 (= lt!358289 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!76350 (= lt!358286 ((_ sign_extend 32) (size!4881 (buf!5425 (_2!10422 lt!357753)))))))

(assert (=> d!76350 (= lt!358285 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10171 (_2!10422 lt!357753))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10166 (_2!10422 lt!357753)))))))

(assert (=> d!76350 (invariant!0 (currentBit!10166 (_2!10422 lt!357753)) (currentByte!10171 (_2!10422 lt!357753)) (size!4881 (buf!5425 (_2!10422 lt!357753))))))

(assert (=> d!76350 (= (bitIndex!0 (size!4881 (buf!5425 (_2!10422 lt!357753))) (currentByte!10171 (_2!10422 lt!357753)) (currentBit!10166 (_2!10422 lt!357753))) lt!358285)))

(declare-fun b!224983 () Bool)

(declare-fun res!188826 () Bool)

(assert (=> b!224983 (=> (not res!188826) (not e!153425))))

(assert (=> b!224983 (= res!188826 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!358285))))

(declare-fun b!224984 () Bool)

(declare-fun lt!358290 () (_ BitVec 64))

(assert (=> b!224984 (= e!153425 (bvsle lt!358285 (bvmul lt!358290 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!224984 (or (= lt!358290 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!358290 #b0000000000000000000000000000000000000000000000000000000000001000) lt!358290)))))

(assert (=> b!224984 (= lt!358290 ((_ sign_extend 32) (size!4881 (buf!5425 (_2!10422 lt!357753)))))))

(assert (= (and d!76350 res!188825) b!224983))

(assert (= (and b!224983 res!188826) b!224984))

(assert (=> d!76350 m!345707))

(declare-fun m!345893 () Bool)

(assert (=> d!76350 m!345893))

(assert (=> b!224851 d!76350))

(declare-fun d!76352 () Bool)

(declare-fun e!153428 () Bool)

(assert (=> d!76352 e!153428))

(declare-fun res!188829 () Bool)

(assert (=> d!76352 (=> (not res!188829) (not e!153428))))

(assert (=> d!76352 (= res!188829 (and (bvsge i!761 #b00000000000000000000000000000000) (bvslt i!761 (size!4881 arr!308))))))

(declare-fun lt!358293 () Unit!16486)

(declare-fun choose!303 (array!11122 (_ BitVec 32) (_ BitVec 8)) Unit!16486)

(assert (=> d!76352 (= lt!358293 (choose!303 arr!308 i!761 (_1!10422 lt!357753)))))

(assert (=> d!76352 (and (bvsle #b00000000000000000000000000000000 i!761) (bvslt i!761 (size!4881 arr!308)))))

(assert (=> d!76352 (= (arrayUpdatedAtPrefixLemma!369 arr!308 i!761 (_1!10422 lt!357753)) lt!358293)))

(declare-fun b!224987 () Bool)

(assert (=> b!224987 (= e!153428 (arrayRangesEq!777 arr!308 (array!11123 (store (arr!5835 arr!308) i!761 (_1!10422 lt!357753)) (size!4881 arr!308)) #b00000000000000000000000000000000 i!761))))

(assert (= (and d!76352 res!188829) b!224987))

(declare-fun m!345895 () Bool)

(assert (=> d!76352 m!345895))

(assert (=> b!224987 m!345633))

(declare-fun m!345897 () Bool)

(assert (=> b!224987 m!345897))

(assert (=> b!224851 d!76352))

(declare-fun d!76354 () Bool)

(assert (=> d!76354 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!4881 (buf!5425 thiss!1870))) ((_ sign_extend 32) (currentByte!10171 thiss!1870)) ((_ sign_extend 32) (currentBit!10166 thiss!1870))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4881 (buf!5425 thiss!1870))) ((_ sign_extend 32) (currentByte!10171 thiss!1870)) ((_ sign_extend 32) (currentBit!10166 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!18621 () Bool)

(assert (= bs!18621 d!76354))

(assert (=> bs!18621 m!345657))

(assert (=> b!224851 d!76354))

(push 1)

(assert (not bm!3663))

(assert (not b!224977))

(assert (not bm!3661))

(assert (not d!76277))

(assert (not bm!3662))

(assert (not b!224978))

(assert (not d!76352))

(assert (not d!76305))

(assert (not b!224895))

(assert (not d!76307))

(assert (not d!76303))

(assert (not d!76309))

(assert (not d!76350))

(assert (not b!224976))

(assert (not b!224889))

(assert (not d!76279))

(assert (not b!224987))

(assert (not d!76271))

(assert (not b!224980))

(assert (not b!224901))

(assert (not d!76354))

(assert (not d!76311))

(assert (not b!224982))

(assert (not d!76273))

(assert (not d!76294))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

