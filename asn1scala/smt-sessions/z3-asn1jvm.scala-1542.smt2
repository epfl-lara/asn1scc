; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43190 () Bool)

(assert start!43190)

(declare-fun b!203636 () Bool)

(declare-fun e!139523 () Bool)

(declare-fun e!139526 () Bool)

(assert (=> b!203636 (= e!139523 (not e!139526))))

(declare-fun res!170606 () Bool)

(assert (=> b!203636 (=> res!170606 e!139526)))

(declare-fun lt!317875 () (_ BitVec 64))

(declare-fun lt!317877 () (_ BitVec 64))

(assert (=> b!203636 (= res!170606 (not (= lt!317875 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!317877))))))

(declare-datatypes ((array!10318 0))(
  ( (array!10319 (arr!5468 (Array (_ BitVec 32) (_ BitVec 8))) (size!4538 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8184 0))(
  ( (BitStream!8185 (buf!5043 array!10318) (currentByte!9510 (_ BitVec 32)) (currentBit!9505 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!14501 0))(
  ( (Unit!14502) )
))
(declare-datatypes ((tuple2!17424 0))(
  ( (tuple2!17425 (_1!9364 Unit!14501) (_2!9364 BitStream!8184)) )
))
(declare-fun lt!317876 () tuple2!17424)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!203636 (= lt!317875 (bitIndex!0 (size!4538 (buf!5043 (_2!9364 lt!317876))) (currentByte!9510 (_2!9364 lt!317876)) (currentBit!9505 (_2!9364 lt!317876))))))

(declare-fun thiss!1204 () BitStream!8184)

(assert (=> b!203636 (= lt!317877 (bitIndex!0 (size!4538 (buf!5043 thiss!1204)) (currentByte!9510 thiss!1204) (currentBit!9505 thiss!1204)))))

(declare-fun e!139530 () Bool)

(assert (=> b!203636 e!139530))

(declare-fun res!170608 () Bool)

(assert (=> b!203636 (=> (not res!170608) (not e!139530))))

(assert (=> b!203636 (= res!170608 (= (size!4538 (buf!5043 thiss!1204)) (size!4538 (buf!5043 (_2!9364 lt!317876)))))))

(declare-fun lt!317878 () Bool)

(declare-fun appendBit!0 (BitStream!8184 Bool) tuple2!17424)

(assert (=> b!203636 (= lt!317876 (appendBit!0 thiss!1204 lt!317878))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!203636 (= lt!317878 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!203637 () Bool)

(declare-fun e!139525 () Bool)

(assert (=> b!203637 (= e!139530 e!139525)))

(declare-fun res!170603 () Bool)

(assert (=> b!203637 (=> (not res!170603) (not e!139525))))

(declare-fun lt!317873 () (_ BitVec 64))

(declare-fun lt!317874 () (_ BitVec 64))

(assert (=> b!203637 (= res!170603 (= lt!317873 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!317874)))))

(assert (=> b!203637 (= lt!317873 (bitIndex!0 (size!4538 (buf!5043 (_2!9364 lt!317876))) (currentByte!9510 (_2!9364 lt!317876)) (currentBit!9505 (_2!9364 lt!317876))))))

(assert (=> b!203637 (= lt!317874 (bitIndex!0 (size!4538 (buf!5043 thiss!1204)) (currentByte!9510 thiss!1204) (currentBit!9505 thiss!1204)))))

(declare-fun b!203638 () Bool)

(declare-fun res!170609 () Bool)

(declare-fun e!139528 () Bool)

(assert (=> b!203638 (=> res!170609 e!139528)))

(declare-fun lt!317871 () tuple2!17424)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!203638 (= res!170609 (not (invariant!0 (currentBit!9505 (_2!9364 lt!317871)) (currentByte!9510 (_2!9364 lt!317871)) (size!4538 (buf!5043 (_2!9364 lt!317871))))))))

(declare-fun b!203639 () Bool)

(declare-fun res!170604 () Bool)

(assert (=> b!203639 (=> (not res!170604) (not e!139523))))

(assert (=> b!203639 (= res!170604 (invariant!0 (currentBit!9505 thiss!1204) (currentByte!9510 thiss!1204) (size!4538 (buf!5043 thiss!1204))))))

(declare-fun b!203640 () Bool)

(declare-fun e!139529 () Bool)

(declare-fun array_inv!4279 (array!10318) Bool)

(assert (=> b!203640 (= e!139529 (array_inv!4279 (buf!5043 thiss!1204)))))

(declare-fun b!203641 () Bool)

(declare-fun res!170605 () Bool)

(assert (=> b!203641 (=> (not res!170605) (not e!139523))))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!203641 (= res!170605 (not (= i!590 nBits!348)))))

(declare-fun b!203642 () Bool)

(assert (=> b!203642 (= e!139528 (or (not (= (size!4538 (buf!5043 (_2!9364 lt!317871))) (size!4538 (buf!5043 thiss!1204)))) (let ((bdg!12230 (bvand lt!317877 #b1000000000000000000000000000000000000000000000000000000000000000))) (or (not (= bdg!12230 (bvand ((_ sign_extend 32) nBits!348) #b1000000000000000000000000000000000000000000000000000000000000000))) (= bdg!12230 (bvand (bvadd lt!317877 ((_ sign_extend 32) nBits!348)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!203643 () Bool)

(declare-fun e!139527 () Bool)

(declare-datatypes ((tuple2!17426 0))(
  ( (tuple2!17427 (_1!9365 BitStream!8184) (_2!9365 Bool)) )
))
(declare-fun lt!317879 () tuple2!17426)

(assert (=> b!203643 (= e!139527 (= (bitIndex!0 (size!4538 (buf!5043 (_1!9365 lt!317879))) (currentByte!9510 (_1!9365 lt!317879)) (currentBit!9505 (_1!9365 lt!317879))) lt!317873))))

(declare-fun b!203644 () Bool)

(assert (=> b!203644 (= e!139526 e!139528)))

(declare-fun res!170607 () Bool)

(assert (=> b!203644 (=> res!170607 e!139528)))

(assert (=> b!203644 (= res!170607 (not (= (bitIndex!0 (size!4538 (buf!5043 (_2!9364 lt!317871))) (currentByte!9510 (_2!9364 lt!317871)) (currentBit!9505 (_2!9364 lt!317871))) (bvsub (bvsub (bvadd lt!317875 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun isPrefixOf!0 (BitStream!8184 BitStream!8184) Bool)

(assert (=> b!203644 (isPrefixOf!0 thiss!1204 (_2!9364 lt!317871))))

(declare-fun lt!317872 () Unit!14501)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8184 BitStream!8184 BitStream!8184) Unit!14501)

(assert (=> b!203644 (= lt!317872 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9364 lt!317876) (_2!9364 lt!317871)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8184 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17424)

(assert (=> b!203644 (= lt!317871 (appendBitsLSBFirstLoopTR!0 (_2!9364 lt!317876) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun res!170601 () Bool)

(assert (=> start!43190 (=> (not res!170601) (not e!139523))))

(assert (=> start!43190 (= res!170601 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43190 e!139523))

(assert (=> start!43190 true))

(declare-fun inv!12 (BitStream!8184) Bool)

(assert (=> start!43190 (and (inv!12 thiss!1204) e!139529)))

(declare-fun b!203635 () Bool)

(declare-fun res!170602 () Bool)

(assert (=> b!203635 (=> (not res!170602) (not e!139525))))

(assert (=> b!203635 (= res!170602 (isPrefixOf!0 thiss!1204 (_2!9364 lt!317876)))))

(declare-fun b!203645 () Bool)

(assert (=> b!203645 (= e!139525 e!139527)))

(declare-fun res!170600 () Bool)

(assert (=> b!203645 (=> (not res!170600) (not e!139527))))

(assert (=> b!203645 (= res!170600 (and (= (_2!9365 lt!317879) lt!317878) (= (_1!9365 lt!317879) (_2!9364 lt!317876))))))

(declare-fun readBitPure!0 (BitStream!8184) tuple2!17426)

(declare-fun readerFrom!0 (BitStream!8184 (_ BitVec 32) (_ BitVec 32)) BitStream!8184)

(assert (=> b!203645 (= lt!317879 (readBitPure!0 (readerFrom!0 (_2!9364 lt!317876) (currentBit!9505 thiss!1204) (currentByte!9510 thiss!1204))))))

(declare-fun b!203646 () Bool)

(declare-fun res!170599 () Bool)

(assert (=> b!203646 (=> (not res!170599) (not e!139523))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!203646 (= res!170599 (validate_offset_bits!1 ((_ sign_extend 32) (size!4538 (buf!5043 thiss!1204))) ((_ sign_extend 32) (currentByte!9510 thiss!1204)) ((_ sign_extend 32) (currentBit!9505 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(assert (= (and start!43190 res!170601) b!203646))

(assert (= (and b!203646 res!170599) b!203639))

(assert (= (and b!203639 res!170604) b!203641))

(assert (= (and b!203641 res!170605) b!203636))

(assert (= (and b!203636 res!170608) b!203637))

(assert (= (and b!203637 res!170603) b!203635))

(assert (= (and b!203635 res!170602) b!203645))

(assert (= (and b!203645 res!170600) b!203643))

(assert (= (and b!203636 (not res!170606)) b!203644))

(assert (= (and b!203644 (not res!170607)) b!203638))

(assert (= (and b!203638 (not res!170609)) b!203642))

(assert (= start!43190 b!203640))

(declare-fun m!314555 () Bool)

(assert (=> b!203635 m!314555))

(declare-fun m!314557 () Bool)

(assert (=> b!203638 m!314557))

(declare-fun m!314559 () Bool)

(assert (=> b!203646 m!314559))

(declare-fun m!314561 () Bool)

(assert (=> b!203645 m!314561))

(assert (=> b!203645 m!314561))

(declare-fun m!314563 () Bool)

(assert (=> b!203645 m!314563))

(declare-fun m!314565 () Bool)

(assert (=> b!203643 m!314565))

(declare-fun m!314567 () Bool)

(assert (=> b!203636 m!314567))

(declare-fun m!314569 () Bool)

(assert (=> b!203636 m!314569))

(declare-fun m!314571 () Bool)

(assert (=> b!203636 m!314571))

(declare-fun m!314573 () Bool)

(assert (=> b!203640 m!314573))

(declare-fun m!314575 () Bool)

(assert (=> b!203644 m!314575))

(declare-fun m!314577 () Bool)

(assert (=> b!203644 m!314577))

(declare-fun m!314579 () Bool)

(assert (=> b!203644 m!314579))

(declare-fun m!314581 () Bool)

(assert (=> b!203644 m!314581))

(declare-fun m!314583 () Bool)

(assert (=> start!43190 m!314583))

(assert (=> b!203637 m!314567))

(assert (=> b!203637 m!314569))

(declare-fun m!314585 () Bool)

(assert (=> b!203639 m!314585))

(check-sat (not b!203639) (not b!203643) (not b!203637) (not b!203644) (not b!203635) (not b!203638) (not b!203636) (not start!43190) (not b!203645) (not b!203646) (not b!203640))
(check-sat)
(get-model)

(declare-fun d!69547 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!69547 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4538 (buf!5043 thiss!1204))) ((_ sign_extend 32) (currentByte!9510 thiss!1204)) ((_ sign_extend 32) (currentBit!9505 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4538 (buf!5043 thiss!1204))) ((_ sign_extend 32) (currentByte!9510 thiss!1204)) ((_ sign_extend 32) (currentBit!9505 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!17139 () Bool)

(assert (= bs!17139 d!69547))

(declare-fun m!314619 () Bool)

(assert (=> bs!17139 m!314619))

(assert (=> b!203646 d!69547))

(declare-fun d!69549 () Bool)

(declare-fun res!170650 () Bool)

(declare-fun e!139559 () Bool)

(assert (=> d!69549 (=> (not res!170650) (not e!139559))))

(assert (=> d!69549 (= res!170650 (= (size!4538 (buf!5043 thiss!1204)) (size!4538 (buf!5043 (_2!9364 lt!317876)))))))

(assert (=> d!69549 (= (isPrefixOf!0 thiss!1204 (_2!9364 lt!317876)) e!139559)))

(declare-fun b!203689 () Bool)

(declare-fun res!170649 () Bool)

(assert (=> b!203689 (=> (not res!170649) (not e!139559))))

(assert (=> b!203689 (= res!170649 (bvsle (bitIndex!0 (size!4538 (buf!5043 thiss!1204)) (currentByte!9510 thiss!1204) (currentBit!9505 thiss!1204)) (bitIndex!0 (size!4538 (buf!5043 (_2!9364 lt!317876))) (currentByte!9510 (_2!9364 lt!317876)) (currentBit!9505 (_2!9364 lt!317876)))))))

(declare-fun b!203690 () Bool)

(declare-fun e!139560 () Bool)

(assert (=> b!203690 (= e!139559 e!139560)))

(declare-fun res!170651 () Bool)

(assert (=> b!203690 (=> res!170651 e!139560)))

(assert (=> b!203690 (= res!170651 (= (size!4538 (buf!5043 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!203691 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10318 array!10318 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!203691 (= e!139560 (arrayBitRangesEq!0 (buf!5043 thiss!1204) (buf!5043 (_2!9364 lt!317876)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4538 (buf!5043 thiss!1204)) (currentByte!9510 thiss!1204) (currentBit!9505 thiss!1204))))))

(assert (= (and d!69549 res!170650) b!203689))

(assert (= (and b!203689 res!170649) b!203690))

(assert (= (and b!203690 (not res!170651)) b!203691))

(assert (=> b!203689 m!314569))

(assert (=> b!203689 m!314567))

(assert (=> b!203691 m!314569))

(assert (=> b!203691 m!314569))

(declare-fun m!314621 () Bool)

(assert (=> b!203691 m!314621))

(assert (=> b!203635 d!69549))

(declare-fun d!69551 () Bool)

(declare-fun e!139563 () Bool)

(assert (=> d!69551 e!139563))

(declare-fun res!170656 () Bool)

(assert (=> d!69551 (=> (not res!170656) (not e!139563))))

(declare-fun lt!317923 () (_ BitVec 64))

(declare-fun lt!317919 () (_ BitVec 64))

(declare-fun lt!317922 () (_ BitVec 64))

(assert (=> d!69551 (= res!170656 (= lt!317923 (bvsub lt!317922 lt!317919)))))

(assert (=> d!69551 (or (= (bvand lt!317922 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!317919 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!317922 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!317922 lt!317919) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69551 (= lt!317919 (remainingBits!0 ((_ sign_extend 32) (size!4538 (buf!5043 (_2!9364 lt!317876)))) ((_ sign_extend 32) (currentByte!9510 (_2!9364 lt!317876))) ((_ sign_extend 32) (currentBit!9505 (_2!9364 lt!317876)))))))

(declare-fun lt!317921 () (_ BitVec 64))

(declare-fun lt!317920 () (_ BitVec 64))

(assert (=> d!69551 (= lt!317922 (bvmul lt!317921 lt!317920))))

(assert (=> d!69551 (or (= lt!317921 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!317920 (bvsdiv (bvmul lt!317921 lt!317920) lt!317921)))))

(assert (=> d!69551 (= lt!317920 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69551 (= lt!317921 ((_ sign_extend 32) (size!4538 (buf!5043 (_2!9364 lt!317876)))))))

(assert (=> d!69551 (= lt!317923 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9510 (_2!9364 lt!317876))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9505 (_2!9364 lt!317876)))))))

(assert (=> d!69551 (invariant!0 (currentBit!9505 (_2!9364 lt!317876)) (currentByte!9510 (_2!9364 lt!317876)) (size!4538 (buf!5043 (_2!9364 lt!317876))))))

(assert (=> d!69551 (= (bitIndex!0 (size!4538 (buf!5043 (_2!9364 lt!317876))) (currentByte!9510 (_2!9364 lt!317876)) (currentBit!9505 (_2!9364 lt!317876))) lt!317923)))

(declare-fun b!203696 () Bool)

(declare-fun res!170657 () Bool)

(assert (=> b!203696 (=> (not res!170657) (not e!139563))))

(assert (=> b!203696 (= res!170657 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!317923))))

(declare-fun b!203697 () Bool)

(declare-fun lt!317924 () (_ BitVec 64))

(assert (=> b!203697 (= e!139563 (bvsle lt!317923 (bvmul lt!317924 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!203697 (or (= lt!317924 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!317924 #b0000000000000000000000000000000000000000000000000000000000001000) lt!317924)))))

(assert (=> b!203697 (= lt!317924 ((_ sign_extend 32) (size!4538 (buf!5043 (_2!9364 lt!317876)))))))

(assert (= (and d!69551 res!170656) b!203696))

(assert (= (and b!203696 res!170657) b!203697))

(declare-fun m!314623 () Bool)

(assert (=> d!69551 m!314623))

(declare-fun m!314625 () Bool)

(assert (=> d!69551 m!314625))

(assert (=> b!203636 d!69551))

(declare-fun d!69553 () Bool)

(declare-fun e!139564 () Bool)

(assert (=> d!69553 e!139564))

(declare-fun res!170658 () Bool)

(assert (=> d!69553 (=> (not res!170658) (not e!139564))))

(declare-fun lt!317928 () (_ BitVec 64))

(declare-fun lt!317929 () (_ BitVec 64))

(declare-fun lt!317925 () (_ BitVec 64))

(assert (=> d!69553 (= res!170658 (= lt!317929 (bvsub lt!317928 lt!317925)))))

(assert (=> d!69553 (or (= (bvand lt!317928 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!317925 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!317928 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!317928 lt!317925) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69553 (= lt!317925 (remainingBits!0 ((_ sign_extend 32) (size!4538 (buf!5043 thiss!1204))) ((_ sign_extend 32) (currentByte!9510 thiss!1204)) ((_ sign_extend 32) (currentBit!9505 thiss!1204))))))

(declare-fun lt!317927 () (_ BitVec 64))

(declare-fun lt!317926 () (_ BitVec 64))

(assert (=> d!69553 (= lt!317928 (bvmul lt!317927 lt!317926))))

(assert (=> d!69553 (or (= lt!317927 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!317926 (bvsdiv (bvmul lt!317927 lt!317926) lt!317927)))))

(assert (=> d!69553 (= lt!317926 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69553 (= lt!317927 ((_ sign_extend 32) (size!4538 (buf!5043 thiss!1204))))))

(assert (=> d!69553 (= lt!317929 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9510 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9505 thiss!1204))))))

(assert (=> d!69553 (invariant!0 (currentBit!9505 thiss!1204) (currentByte!9510 thiss!1204) (size!4538 (buf!5043 thiss!1204)))))

(assert (=> d!69553 (= (bitIndex!0 (size!4538 (buf!5043 thiss!1204)) (currentByte!9510 thiss!1204) (currentBit!9505 thiss!1204)) lt!317929)))

(declare-fun b!203698 () Bool)

(declare-fun res!170659 () Bool)

(assert (=> b!203698 (=> (not res!170659) (not e!139564))))

(assert (=> b!203698 (= res!170659 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!317929))))

(declare-fun b!203699 () Bool)

(declare-fun lt!317930 () (_ BitVec 64))

(assert (=> b!203699 (= e!139564 (bvsle lt!317929 (bvmul lt!317930 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!203699 (or (= lt!317930 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!317930 #b0000000000000000000000000000000000000000000000000000000000001000) lt!317930)))))

(assert (=> b!203699 (= lt!317930 ((_ sign_extend 32) (size!4538 (buf!5043 thiss!1204))))))

(assert (= (and d!69553 res!170658) b!203698))

(assert (= (and b!203698 res!170659) b!203699))

(assert (=> d!69553 m!314619))

(assert (=> d!69553 m!314585))

(assert (=> b!203636 d!69553))

(declare-fun b!203709 () Bool)

(declare-fun res!170670 () Bool)

(declare-fun e!139569 () Bool)

(assert (=> b!203709 (=> (not res!170670) (not e!139569))))

(declare-fun lt!317939 () (_ BitVec 64))

(declare-fun lt!317941 () (_ BitVec 64))

(declare-fun lt!317942 () tuple2!17424)

(assert (=> b!203709 (= res!170670 (= (bitIndex!0 (size!4538 (buf!5043 (_2!9364 lt!317942))) (currentByte!9510 (_2!9364 lt!317942)) (currentBit!9505 (_2!9364 lt!317942))) (bvadd lt!317939 lt!317941)))))

(assert (=> b!203709 (or (not (= (bvand lt!317939 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!317941 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!317939 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!317939 lt!317941) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!203709 (= lt!317941 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!203709 (= lt!317939 (bitIndex!0 (size!4538 (buf!5043 thiss!1204)) (currentByte!9510 thiss!1204) (currentBit!9505 thiss!1204)))))

(declare-fun b!203710 () Bool)

(declare-fun res!170669 () Bool)

(assert (=> b!203710 (=> (not res!170669) (not e!139569))))

(assert (=> b!203710 (= res!170669 (isPrefixOf!0 thiss!1204 (_2!9364 lt!317942)))))

(declare-fun d!69555 () Bool)

(assert (=> d!69555 e!139569))

(declare-fun res!170671 () Bool)

(assert (=> d!69555 (=> (not res!170671) (not e!139569))))

(assert (=> d!69555 (= res!170671 (= (size!4538 (buf!5043 thiss!1204)) (size!4538 (buf!5043 (_2!9364 lt!317942)))))))

(declare-fun choose!16 (BitStream!8184 Bool) tuple2!17424)

(assert (=> d!69555 (= lt!317942 (choose!16 thiss!1204 lt!317878))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!69555 (validate_offset_bit!0 ((_ sign_extend 32) (size!4538 (buf!5043 thiss!1204))) ((_ sign_extend 32) (currentByte!9510 thiss!1204)) ((_ sign_extend 32) (currentBit!9505 thiss!1204)))))

(assert (=> d!69555 (= (appendBit!0 thiss!1204 lt!317878) lt!317942)))

(declare-fun b!203712 () Bool)

(declare-fun e!139570 () Bool)

(declare-fun lt!317940 () tuple2!17426)

(assert (=> b!203712 (= e!139570 (= (bitIndex!0 (size!4538 (buf!5043 (_1!9365 lt!317940))) (currentByte!9510 (_1!9365 lt!317940)) (currentBit!9505 (_1!9365 lt!317940))) (bitIndex!0 (size!4538 (buf!5043 (_2!9364 lt!317942))) (currentByte!9510 (_2!9364 lt!317942)) (currentBit!9505 (_2!9364 lt!317942)))))))

(declare-fun b!203711 () Bool)

(assert (=> b!203711 (= e!139569 e!139570)))

(declare-fun res!170668 () Bool)

(assert (=> b!203711 (=> (not res!170668) (not e!139570))))

(assert (=> b!203711 (= res!170668 (and (= (_2!9365 lt!317940) lt!317878) (= (_1!9365 lt!317940) (_2!9364 lt!317942))))))

(assert (=> b!203711 (= lt!317940 (readBitPure!0 (readerFrom!0 (_2!9364 lt!317942) (currentBit!9505 thiss!1204) (currentByte!9510 thiss!1204))))))

(assert (= (and d!69555 res!170671) b!203709))

(assert (= (and b!203709 res!170670) b!203710))

(assert (= (and b!203710 res!170669) b!203711))

(assert (= (and b!203711 res!170668) b!203712))

(declare-fun m!314627 () Bool)

(assert (=> b!203709 m!314627))

(assert (=> b!203709 m!314569))

(declare-fun m!314629 () Bool)

(assert (=> b!203711 m!314629))

(assert (=> b!203711 m!314629))

(declare-fun m!314631 () Bool)

(assert (=> b!203711 m!314631))

(declare-fun m!314633 () Bool)

(assert (=> d!69555 m!314633))

(declare-fun m!314635 () Bool)

(assert (=> d!69555 m!314635))

(declare-fun m!314637 () Bool)

(assert (=> b!203710 m!314637))

(declare-fun m!314639 () Bool)

(assert (=> b!203712 m!314639))

(assert (=> b!203712 m!314627))

(assert (=> b!203636 d!69555))

(assert (=> b!203637 d!69551))

(assert (=> b!203637 d!69553))

(declare-fun d!69557 () Bool)

(assert (=> d!69557 (= (invariant!0 (currentBit!9505 (_2!9364 lt!317871)) (currentByte!9510 (_2!9364 lt!317871)) (size!4538 (buf!5043 (_2!9364 lt!317871)))) (and (bvsge (currentBit!9505 (_2!9364 lt!317871)) #b00000000000000000000000000000000) (bvslt (currentBit!9505 (_2!9364 lt!317871)) #b00000000000000000000000000001000) (bvsge (currentByte!9510 (_2!9364 lt!317871)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9510 (_2!9364 lt!317871)) (size!4538 (buf!5043 (_2!9364 lt!317871)))) (and (= (currentBit!9505 (_2!9364 lt!317871)) #b00000000000000000000000000000000) (= (currentByte!9510 (_2!9364 lt!317871)) (size!4538 (buf!5043 (_2!9364 lt!317871))))))))))

(assert (=> b!203638 d!69557))

(declare-fun d!69559 () Bool)

(assert (=> d!69559 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9505 thiss!1204) (currentByte!9510 thiss!1204) (size!4538 (buf!5043 thiss!1204))))))

(declare-fun bs!17140 () Bool)

(assert (= bs!17140 d!69559))

(assert (=> bs!17140 m!314585))

(assert (=> start!43190 d!69559))

(declare-fun d!69561 () Bool)

(declare-fun e!139571 () Bool)

(assert (=> d!69561 e!139571))

(declare-fun res!170672 () Bool)

(assert (=> d!69561 (=> (not res!170672) (not e!139571))))

(declare-fun lt!317947 () (_ BitVec 64))

(declare-fun lt!317946 () (_ BitVec 64))

(declare-fun lt!317943 () (_ BitVec 64))

(assert (=> d!69561 (= res!170672 (= lt!317947 (bvsub lt!317946 lt!317943)))))

(assert (=> d!69561 (or (= (bvand lt!317946 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!317943 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!317946 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!317946 lt!317943) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69561 (= lt!317943 (remainingBits!0 ((_ sign_extend 32) (size!4538 (buf!5043 (_1!9365 lt!317879)))) ((_ sign_extend 32) (currentByte!9510 (_1!9365 lt!317879))) ((_ sign_extend 32) (currentBit!9505 (_1!9365 lt!317879)))))))

(declare-fun lt!317945 () (_ BitVec 64))

(declare-fun lt!317944 () (_ BitVec 64))

(assert (=> d!69561 (= lt!317946 (bvmul lt!317945 lt!317944))))

(assert (=> d!69561 (or (= lt!317945 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!317944 (bvsdiv (bvmul lt!317945 lt!317944) lt!317945)))))

(assert (=> d!69561 (= lt!317944 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69561 (= lt!317945 ((_ sign_extend 32) (size!4538 (buf!5043 (_1!9365 lt!317879)))))))

(assert (=> d!69561 (= lt!317947 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9510 (_1!9365 lt!317879))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9505 (_1!9365 lt!317879)))))))

(assert (=> d!69561 (invariant!0 (currentBit!9505 (_1!9365 lt!317879)) (currentByte!9510 (_1!9365 lt!317879)) (size!4538 (buf!5043 (_1!9365 lt!317879))))))

(assert (=> d!69561 (= (bitIndex!0 (size!4538 (buf!5043 (_1!9365 lt!317879))) (currentByte!9510 (_1!9365 lt!317879)) (currentBit!9505 (_1!9365 lt!317879))) lt!317947)))

(declare-fun b!203713 () Bool)

(declare-fun res!170673 () Bool)

(assert (=> b!203713 (=> (not res!170673) (not e!139571))))

(assert (=> b!203713 (= res!170673 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!317947))))

(declare-fun b!203714 () Bool)

(declare-fun lt!317948 () (_ BitVec 64))

(assert (=> b!203714 (= e!139571 (bvsle lt!317947 (bvmul lt!317948 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!203714 (or (= lt!317948 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!317948 #b0000000000000000000000000000000000000000000000000000000000001000) lt!317948)))))

(assert (=> b!203714 (= lt!317948 ((_ sign_extend 32) (size!4538 (buf!5043 (_1!9365 lt!317879)))))))

(assert (= (and d!69561 res!170672) b!203713))

(assert (= (and b!203713 res!170673) b!203714))

(declare-fun m!314641 () Bool)

(assert (=> d!69561 m!314641))

(declare-fun m!314643 () Bool)

(assert (=> d!69561 m!314643))

(assert (=> b!203643 d!69561))

(declare-fun d!69563 () Bool)

(declare-fun e!139572 () Bool)

(assert (=> d!69563 e!139572))

(declare-fun res!170674 () Bool)

(assert (=> d!69563 (=> (not res!170674) (not e!139572))))

(declare-fun lt!317952 () (_ BitVec 64))

(declare-fun lt!317949 () (_ BitVec 64))

(declare-fun lt!317953 () (_ BitVec 64))

(assert (=> d!69563 (= res!170674 (= lt!317953 (bvsub lt!317952 lt!317949)))))

(assert (=> d!69563 (or (= (bvand lt!317952 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!317949 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!317952 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!317952 lt!317949) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69563 (= lt!317949 (remainingBits!0 ((_ sign_extend 32) (size!4538 (buf!5043 (_2!9364 lt!317871)))) ((_ sign_extend 32) (currentByte!9510 (_2!9364 lt!317871))) ((_ sign_extend 32) (currentBit!9505 (_2!9364 lt!317871)))))))

(declare-fun lt!317951 () (_ BitVec 64))

(declare-fun lt!317950 () (_ BitVec 64))

(assert (=> d!69563 (= lt!317952 (bvmul lt!317951 lt!317950))))

(assert (=> d!69563 (or (= lt!317951 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!317950 (bvsdiv (bvmul lt!317951 lt!317950) lt!317951)))))

(assert (=> d!69563 (= lt!317950 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69563 (= lt!317951 ((_ sign_extend 32) (size!4538 (buf!5043 (_2!9364 lt!317871)))))))

(assert (=> d!69563 (= lt!317953 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9510 (_2!9364 lt!317871))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9505 (_2!9364 lt!317871)))))))

(assert (=> d!69563 (invariant!0 (currentBit!9505 (_2!9364 lt!317871)) (currentByte!9510 (_2!9364 lt!317871)) (size!4538 (buf!5043 (_2!9364 lt!317871))))))

(assert (=> d!69563 (= (bitIndex!0 (size!4538 (buf!5043 (_2!9364 lt!317871))) (currentByte!9510 (_2!9364 lt!317871)) (currentBit!9505 (_2!9364 lt!317871))) lt!317953)))

(declare-fun b!203715 () Bool)

(declare-fun res!170675 () Bool)

(assert (=> b!203715 (=> (not res!170675) (not e!139572))))

(assert (=> b!203715 (= res!170675 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!317953))))

(declare-fun b!203716 () Bool)

(declare-fun lt!317954 () (_ BitVec 64))

(assert (=> b!203716 (= e!139572 (bvsle lt!317953 (bvmul lt!317954 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!203716 (or (= lt!317954 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!317954 #b0000000000000000000000000000000000000000000000000000000000001000) lt!317954)))))

(assert (=> b!203716 (= lt!317954 ((_ sign_extend 32) (size!4538 (buf!5043 (_2!9364 lt!317871)))))))

(assert (= (and d!69563 res!170674) b!203715))

(assert (= (and b!203715 res!170675) b!203716))

(declare-fun m!314645 () Bool)

(assert (=> d!69563 m!314645))

(assert (=> d!69563 m!314557))

(assert (=> b!203644 d!69563))

(declare-fun d!69565 () Bool)

(declare-fun res!170677 () Bool)

(declare-fun e!139573 () Bool)

(assert (=> d!69565 (=> (not res!170677) (not e!139573))))

(assert (=> d!69565 (= res!170677 (= (size!4538 (buf!5043 thiss!1204)) (size!4538 (buf!5043 (_2!9364 lt!317871)))))))

(assert (=> d!69565 (= (isPrefixOf!0 thiss!1204 (_2!9364 lt!317871)) e!139573)))

(declare-fun b!203717 () Bool)

(declare-fun res!170676 () Bool)

(assert (=> b!203717 (=> (not res!170676) (not e!139573))))

(assert (=> b!203717 (= res!170676 (bvsle (bitIndex!0 (size!4538 (buf!5043 thiss!1204)) (currentByte!9510 thiss!1204) (currentBit!9505 thiss!1204)) (bitIndex!0 (size!4538 (buf!5043 (_2!9364 lt!317871))) (currentByte!9510 (_2!9364 lt!317871)) (currentBit!9505 (_2!9364 lt!317871)))))))

(declare-fun b!203718 () Bool)

(declare-fun e!139574 () Bool)

(assert (=> b!203718 (= e!139573 e!139574)))

(declare-fun res!170678 () Bool)

(assert (=> b!203718 (=> res!170678 e!139574)))

(assert (=> b!203718 (= res!170678 (= (size!4538 (buf!5043 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!203719 () Bool)

(assert (=> b!203719 (= e!139574 (arrayBitRangesEq!0 (buf!5043 thiss!1204) (buf!5043 (_2!9364 lt!317871)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4538 (buf!5043 thiss!1204)) (currentByte!9510 thiss!1204) (currentBit!9505 thiss!1204))))))

(assert (= (and d!69565 res!170677) b!203717))

(assert (= (and b!203717 res!170676) b!203718))

(assert (= (and b!203718 (not res!170678)) b!203719))

(assert (=> b!203717 m!314569))

(assert (=> b!203717 m!314575))

(assert (=> b!203719 m!314569))

(assert (=> b!203719 m!314569))

(declare-fun m!314647 () Bool)

(assert (=> b!203719 m!314647))

(assert (=> b!203644 d!69565))

(declare-fun d!69567 () Bool)

(assert (=> d!69567 (isPrefixOf!0 thiss!1204 (_2!9364 lt!317871))))

(declare-fun lt!317957 () Unit!14501)

(declare-fun choose!30 (BitStream!8184 BitStream!8184 BitStream!8184) Unit!14501)

(assert (=> d!69567 (= lt!317957 (choose!30 thiss!1204 (_2!9364 lt!317876) (_2!9364 lt!317871)))))

(assert (=> d!69567 (isPrefixOf!0 thiss!1204 (_2!9364 lt!317876))))

(assert (=> d!69567 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9364 lt!317876) (_2!9364 lt!317871)) lt!317957)))

(declare-fun bs!17141 () Bool)

(assert (= bs!17141 d!69567))

(assert (=> bs!17141 m!314577))

(declare-fun m!314649 () Bool)

(assert (=> bs!17141 m!314649))

(assert (=> bs!17141 m!314555))

(assert (=> b!203644 d!69567))

(declare-fun b!203811 () Bool)

(declare-fun res!170765 () Bool)

(declare-fun lt!318187 () tuple2!17424)

(assert (=> b!203811 (= res!170765 (isPrefixOf!0 (_2!9364 lt!317876) (_2!9364 lt!318187)))))

(declare-fun e!139635 () Bool)

(assert (=> b!203811 (=> (not res!170765) (not e!139635))))

(declare-fun b!203812 () Bool)

(declare-fun e!139633 () Bool)

(declare-fun e!139631 () Bool)

(assert (=> b!203812 (= e!139633 e!139631)))

(declare-fun res!170764 () Bool)

(assert (=> b!203812 (=> (not res!170764) (not e!139631))))

(declare-datatypes ((tuple2!17432 0))(
  ( (tuple2!17433 (_1!9368 BitStream!8184) (_2!9368 (_ BitVec 64))) )
))
(declare-fun lt!318183 () tuple2!17432)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!203812 (= res!170764 (= (_2!9368 lt!318183) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-datatypes ((tuple2!17434 0))(
  ( (tuple2!17435 (_1!9369 BitStream!8184) (_2!9369 BitStream!8184)) )
))
(declare-fun lt!318200 () tuple2!17434)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8184 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17432)

(assert (=> b!203812 (= lt!318183 (readNBitsLSBFirstsLoopPure!0 (_1!9369 lt!318200) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!318205 () Unit!14501)

(declare-fun lt!318179 () Unit!14501)

(assert (=> b!203812 (= lt!318205 lt!318179)))

(declare-fun lt!318177 () tuple2!17424)

(declare-fun lt!318202 () (_ BitVec 64))

(assert (=> b!203812 (validate_offset_bits!1 ((_ sign_extend 32) (size!4538 (buf!5043 (_2!9364 lt!318177)))) ((_ sign_extend 32) (currentByte!9510 (_2!9364 lt!317876))) ((_ sign_extend 32) (currentBit!9505 (_2!9364 lt!317876))) lt!318202)))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8184 array!10318 (_ BitVec 64)) Unit!14501)

(assert (=> b!203812 (= lt!318179 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9364 lt!317876) (buf!5043 (_2!9364 lt!318177)) lt!318202))))

(declare-fun e!139634 () Bool)

(assert (=> b!203812 e!139634))

(declare-fun res!170762 () Bool)

(assert (=> b!203812 (=> (not res!170762) (not e!139634))))

(assert (=> b!203812 (= res!170762 (and (= (size!4538 (buf!5043 (_2!9364 lt!317876))) (size!4538 (buf!5043 (_2!9364 lt!318177)))) (bvsge lt!318202 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!203812 (= lt!318202 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!203812 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(declare-fun reader!0 (BitStream!8184 BitStream!8184) tuple2!17434)

(assert (=> b!203812 (= lt!318200 (reader!0 (_2!9364 lt!317876) (_2!9364 lt!318177)))))

(declare-fun b!203813 () Bool)

(declare-fun res!170763 () Bool)

(assert (=> b!203813 (=> (not res!170763) (not e!139633))))

(assert (=> b!203813 (= res!170763 (isPrefixOf!0 (_2!9364 lt!317876) (_2!9364 lt!318177)))))

(declare-fun b!203814 () Bool)

(declare-fun e!139628 () Bool)

(declare-fun lt!318161 () tuple2!17426)

(declare-fun lt!318174 () tuple2!17426)

(assert (=> b!203814 (= e!139628 (= (_2!9365 lt!318161) (_2!9365 lt!318174)))))

(declare-fun b!203815 () Bool)

(assert (=> b!203815 (= e!139631 (= (_1!9368 lt!318183) (_2!9369 lt!318200)))))

(declare-fun b!203816 () Bool)

(declare-fun lt!318203 () tuple2!17426)

(assert (=> b!203816 (= lt!318203 (readBitPure!0 (readerFrom!0 (_2!9364 lt!318187) (currentBit!9505 (_2!9364 lt!317876)) (currentByte!9510 (_2!9364 lt!317876)))))))

(declare-fun lt!318180 () Bool)

(declare-fun res!170772 () Bool)

(assert (=> b!203816 (= res!170772 (and (= (_2!9365 lt!318203) lt!318180) (= (_1!9365 lt!318203) (_2!9364 lt!318187))))))

(declare-fun e!139630 () Bool)

(assert (=> b!203816 (=> (not res!170772) (not e!139630))))

(assert (=> b!203816 (= e!139635 e!139630)))

(declare-fun b!203817 () Bool)

(declare-fun e!139632 () tuple2!17424)

(declare-fun lt!318173 () tuple2!17424)

(assert (=> b!203817 (= e!139632 (tuple2!17425 (_1!9364 lt!318173) (_2!9364 lt!318173)))))

(assert (=> b!203817 (= lt!318180 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!203817 (= lt!318187 (appendBit!0 (_2!9364 lt!317876) lt!318180))))

(declare-fun res!170770 () Bool)

(assert (=> b!203817 (= res!170770 (= (size!4538 (buf!5043 (_2!9364 lt!317876))) (size!4538 (buf!5043 (_2!9364 lt!318187)))))))

(assert (=> b!203817 (=> (not res!170770) (not e!139635))))

(assert (=> b!203817 e!139635))

(declare-fun lt!318210 () tuple2!17424)

(assert (=> b!203817 (= lt!318210 lt!318187)))

(assert (=> b!203817 (= lt!318173 (appendBitsLSBFirstLoopTR!0 (_2!9364 lt!318210) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!318192 () Unit!14501)

(assert (=> b!203817 (= lt!318192 (lemmaIsPrefixTransitive!0 (_2!9364 lt!317876) (_2!9364 lt!318210) (_2!9364 lt!318173)))))

(declare-fun call!3219 () Bool)

(assert (=> b!203817 call!3219))

(declare-fun lt!318206 () Unit!14501)

(assert (=> b!203817 (= lt!318206 lt!318192)))

(assert (=> b!203817 (invariant!0 (currentBit!9505 (_2!9364 lt!317876)) (currentByte!9510 (_2!9364 lt!317876)) (size!4538 (buf!5043 (_2!9364 lt!318210))))))

(declare-fun lt!318163 () BitStream!8184)

(assert (=> b!203817 (= lt!318163 (BitStream!8185 (buf!5043 (_2!9364 lt!318210)) (currentByte!9510 (_2!9364 lt!317876)) (currentBit!9505 (_2!9364 lt!317876))))))

(assert (=> b!203817 (invariant!0 (currentBit!9505 lt!318163) (currentByte!9510 lt!318163) (size!4538 (buf!5043 (_2!9364 lt!318173))))))

(declare-fun lt!318158 () BitStream!8184)

(assert (=> b!203817 (= lt!318158 (BitStream!8185 (buf!5043 (_2!9364 lt!318173)) (currentByte!9510 lt!318163) (currentBit!9505 lt!318163)))))

(assert (=> b!203817 (= lt!318161 (readBitPure!0 lt!318163))))

(assert (=> b!203817 (= lt!318174 (readBitPure!0 lt!318158))))

(declare-fun lt!318166 () Unit!14501)

(declare-fun readBitPrefixLemma!0 (BitStream!8184 BitStream!8184) Unit!14501)

(assert (=> b!203817 (= lt!318166 (readBitPrefixLemma!0 lt!318163 (_2!9364 lt!318173)))))

(declare-fun res!170771 () Bool)

(assert (=> b!203817 (= res!170771 (= (bitIndex!0 (size!4538 (buf!5043 (_1!9365 lt!318161))) (currentByte!9510 (_1!9365 lt!318161)) (currentBit!9505 (_1!9365 lt!318161))) (bitIndex!0 (size!4538 (buf!5043 (_1!9365 lt!318174))) (currentByte!9510 (_1!9365 lt!318174)) (currentBit!9505 (_1!9365 lt!318174)))))))

(assert (=> b!203817 (=> (not res!170771) (not e!139628))))

(assert (=> b!203817 e!139628))

(declare-fun lt!318191 () Unit!14501)

(assert (=> b!203817 (= lt!318191 lt!318166)))

(declare-fun lt!318190 () tuple2!17434)

(assert (=> b!203817 (= lt!318190 (reader!0 (_2!9364 lt!317876) (_2!9364 lt!318173)))))

(declare-fun lt!318175 () tuple2!17434)

(assert (=> b!203817 (= lt!318175 (reader!0 (_2!9364 lt!318210) (_2!9364 lt!318173)))))

(declare-fun lt!318195 () tuple2!17426)

(assert (=> b!203817 (= lt!318195 (readBitPure!0 (_1!9369 lt!318190)))))

(assert (=> b!203817 (= (_2!9365 lt!318195) lt!318180)))

(declare-fun lt!318211 () Unit!14501)

(declare-fun Unit!14505 () Unit!14501)

(assert (=> b!203817 (= lt!318211 Unit!14505)))

(declare-fun lt!318209 () (_ BitVec 64))

(assert (=> b!203817 (= lt!318209 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!318194 () (_ BitVec 64))

(assert (=> b!203817 (= lt!318194 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!318165 () Unit!14501)

(assert (=> b!203817 (= lt!318165 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9364 lt!317876) (buf!5043 (_2!9364 lt!318173)) lt!318194))))

(assert (=> b!203817 (validate_offset_bits!1 ((_ sign_extend 32) (size!4538 (buf!5043 (_2!9364 lt!318173)))) ((_ sign_extend 32) (currentByte!9510 (_2!9364 lt!317876))) ((_ sign_extend 32) (currentBit!9505 (_2!9364 lt!317876))) lt!318194)))

(declare-fun lt!318181 () Unit!14501)

(assert (=> b!203817 (= lt!318181 lt!318165)))

(declare-fun lt!318172 () tuple2!17432)

(assert (=> b!203817 (= lt!318172 (readNBitsLSBFirstsLoopPure!0 (_1!9369 lt!318190) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!318209))))

(declare-fun lt!318199 () (_ BitVec 64))

(assert (=> b!203817 (= lt!318199 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!318188 () Unit!14501)

(assert (=> b!203817 (= lt!318188 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9364 lt!318210) (buf!5043 (_2!9364 lt!318173)) lt!318199))))

(assert (=> b!203817 (validate_offset_bits!1 ((_ sign_extend 32) (size!4538 (buf!5043 (_2!9364 lt!318173)))) ((_ sign_extend 32) (currentByte!9510 (_2!9364 lt!318210))) ((_ sign_extend 32) (currentBit!9505 (_2!9364 lt!318210))) lt!318199)))

(declare-fun lt!318157 () Unit!14501)

(assert (=> b!203817 (= lt!318157 lt!318188)))

(declare-fun lt!318159 () tuple2!17432)

(assert (=> b!203817 (= lt!318159 (readNBitsLSBFirstsLoopPure!0 (_1!9369 lt!318175) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!318209 (ite (_2!9365 lt!318195) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!318204 () tuple2!17432)

(assert (=> b!203817 (= lt!318204 (readNBitsLSBFirstsLoopPure!0 (_1!9369 lt!318190) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!318209))))

(declare-fun c!10102 () Bool)

(assert (=> b!203817 (= c!10102 (_2!9365 (readBitPure!0 (_1!9369 lt!318190))))))

(declare-fun e!139629 () (_ BitVec 64))

(declare-fun lt!318198 () tuple2!17432)

(declare-fun withMovedBitIndex!0 (BitStream!8184 (_ BitVec 64)) BitStream!8184)

(assert (=> b!203817 (= lt!318198 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9369 lt!318190) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!318209 e!139629)))))

(declare-fun lt!318160 () Unit!14501)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8184 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!14501)

(assert (=> b!203817 (= lt!318160 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9369 lt!318190) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!318209))))

(assert (=> b!203817 (and (= (_2!9368 lt!318204) (_2!9368 lt!318198)) (= (_1!9368 lt!318204) (_1!9368 lt!318198)))))

(declare-fun lt!318168 () Unit!14501)

(assert (=> b!203817 (= lt!318168 lt!318160)))

(assert (=> b!203817 (= (_1!9369 lt!318190) (withMovedBitIndex!0 (_2!9369 lt!318190) (bvsub (bitIndex!0 (size!4538 (buf!5043 (_2!9364 lt!317876))) (currentByte!9510 (_2!9364 lt!317876)) (currentBit!9505 (_2!9364 lt!317876))) (bitIndex!0 (size!4538 (buf!5043 (_2!9364 lt!318173))) (currentByte!9510 (_2!9364 lt!318173)) (currentBit!9505 (_2!9364 lt!318173))))))))

(declare-fun lt!318208 () Unit!14501)

(declare-fun Unit!14506 () Unit!14501)

(assert (=> b!203817 (= lt!318208 Unit!14506)))

(assert (=> b!203817 (= (_1!9369 lt!318175) (withMovedBitIndex!0 (_2!9369 lt!318175) (bvsub (bitIndex!0 (size!4538 (buf!5043 (_2!9364 lt!318210))) (currentByte!9510 (_2!9364 lt!318210)) (currentBit!9505 (_2!9364 lt!318210))) (bitIndex!0 (size!4538 (buf!5043 (_2!9364 lt!318173))) (currentByte!9510 (_2!9364 lt!318173)) (currentBit!9505 (_2!9364 lt!318173))))))))

(declare-fun lt!318201 () Unit!14501)

(declare-fun Unit!14507 () Unit!14501)

(assert (=> b!203817 (= lt!318201 Unit!14507)))

(assert (=> b!203817 (= (bitIndex!0 (size!4538 (buf!5043 (_2!9364 lt!317876))) (currentByte!9510 (_2!9364 lt!317876)) (currentBit!9505 (_2!9364 lt!317876))) (bvsub (bitIndex!0 (size!4538 (buf!5043 (_2!9364 lt!318210))) (currentByte!9510 (_2!9364 lt!318210)) (currentBit!9505 (_2!9364 lt!318210))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!318162 () Unit!14501)

(declare-fun Unit!14508 () Unit!14501)

(assert (=> b!203817 (= lt!318162 Unit!14508)))

(assert (=> b!203817 (= (_2!9368 lt!318172) (_2!9368 lt!318159))))

(declare-fun lt!318186 () Unit!14501)

(declare-fun Unit!14509 () Unit!14501)

(assert (=> b!203817 (= lt!318186 Unit!14509)))

(assert (=> b!203817 (invariant!0 (currentBit!9505 (_2!9364 lt!318173)) (currentByte!9510 (_2!9364 lt!318173)) (size!4538 (buf!5043 (_2!9364 lt!318173))))))

(declare-fun lt!318171 () Unit!14501)

(declare-fun Unit!14510 () Unit!14501)

(assert (=> b!203817 (= lt!318171 Unit!14510)))

(assert (=> b!203817 (= (size!4538 (buf!5043 (_2!9364 lt!317876))) (size!4538 (buf!5043 (_2!9364 lt!318173))))))

(declare-fun lt!318184 () Unit!14501)

(declare-fun Unit!14511 () Unit!14501)

(assert (=> b!203817 (= lt!318184 Unit!14511)))

(assert (=> b!203817 (= (bitIndex!0 (size!4538 (buf!5043 (_2!9364 lt!318173))) (currentByte!9510 (_2!9364 lt!318173)) (currentBit!9505 (_2!9364 lt!318173))) (bvsub (bvadd (bitIndex!0 (size!4538 (buf!5043 (_2!9364 lt!317876))) (currentByte!9510 (_2!9364 lt!317876)) (currentBit!9505 (_2!9364 lt!317876))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!318169 () Unit!14501)

(declare-fun Unit!14512 () Unit!14501)

(assert (=> b!203817 (= lt!318169 Unit!14512)))

(declare-fun lt!318167 () Unit!14501)

(declare-fun Unit!14513 () Unit!14501)

(assert (=> b!203817 (= lt!318167 Unit!14513)))

(declare-fun lt!318207 () tuple2!17434)

(assert (=> b!203817 (= lt!318207 (reader!0 (_2!9364 lt!317876) (_2!9364 lt!318173)))))

(declare-fun lt!318185 () (_ BitVec 64))

(assert (=> b!203817 (= lt!318185 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!318164 () Unit!14501)

(assert (=> b!203817 (= lt!318164 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9364 lt!317876) (buf!5043 (_2!9364 lt!318173)) lt!318185))))

(assert (=> b!203817 (validate_offset_bits!1 ((_ sign_extend 32) (size!4538 (buf!5043 (_2!9364 lt!318173)))) ((_ sign_extend 32) (currentByte!9510 (_2!9364 lt!317876))) ((_ sign_extend 32) (currentBit!9505 (_2!9364 lt!317876))) lt!318185)))

(declare-fun lt!318170 () Unit!14501)

(assert (=> b!203817 (= lt!318170 lt!318164)))

(declare-fun lt!318212 () tuple2!17432)

(assert (=> b!203817 (= lt!318212 (readNBitsLSBFirstsLoopPure!0 (_1!9369 lt!318207) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!170773 () Bool)

(assert (=> b!203817 (= res!170773 (= (_2!9368 lt!318212) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!139627 () Bool)

(assert (=> b!203817 (=> (not res!170773) (not e!139627))))

(assert (=> b!203817 e!139627))

(declare-fun lt!318176 () Unit!14501)

(declare-fun Unit!14514 () Unit!14501)

(assert (=> b!203817 (= lt!318176 Unit!14514)))

(declare-fun d!69569 () Bool)

(assert (=> d!69569 e!139633))

(declare-fun res!170768 () Bool)

(assert (=> d!69569 (=> (not res!170768) (not e!139633))))

(assert (=> d!69569 (= res!170768 (invariant!0 (currentBit!9505 (_2!9364 lt!318177)) (currentByte!9510 (_2!9364 lt!318177)) (size!4538 (buf!5043 (_2!9364 lt!318177)))))))

(assert (=> d!69569 (= lt!318177 e!139632)))

(declare-fun c!10103 () Bool)

(assert (=> d!69569 (= c!10103 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!69569 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!69569 (= (appendBitsLSBFirstLoopTR!0 (_2!9364 lt!317876) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!318177)))

(declare-fun b!203818 () Bool)

(assert (=> b!203818 (= e!139627 (= (_1!9368 lt!318212) (_2!9369 lt!318207)))))

(declare-fun bm!3216 () Bool)

(assert (=> bm!3216 (= call!3219 (isPrefixOf!0 (_2!9364 lt!317876) (ite c!10103 (_2!9364 lt!317876) (_2!9364 lt!318173))))))

(declare-fun b!203819 () Bool)

(declare-fun res!170769 () Bool)

(assert (=> b!203819 (= res!170769 (= (bitIndex!0 (size!4538 (buf!5043 (_2!9364 lt!318187))) (currentByte!9510 (_2!9364 lt!318187)) (currentBit!9505 (_2!9364 lt!318187))) (bvadd (bitIndex!0 (size!4538 (buf!5043 (_2!9364 lt!317876))) (currentByte!9510 (_2!9364 lt!317876)) (currentBit!9505 (_2!9364 lt!317876))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!203819 (=> (not res!170769) (not e!139635))))

(declare-fun b!203820 () Bool)

(declare-fun Unit!14515 () Unit!14501)

(assert (=> b!203820 (= e!139632 (tuple2!17425 Unit!14515 (_2!9364 lt!317876)))))

(declare-fun lt!318196 () Unit!14501)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8184) Unit!14501)

(assert (=> b!203820 (= lt!318196 (lemmaIsPrefixRefl!0 (_2!9364 lt!317876)))))

(assert (=> b!203820 call!3219))

(declare-fun lt!318197 () Unit!14501)

(assert (=> b!203820 (= lt!318197 lt!318196)))

(declare-fun b!203821 () Bool)

(assert (=> b!203821 (= e!139630 (= (bitIndex!0 (size!4538 (buf!5043 (_1!9365 lt!318203))) (currentByte!9510 (_1!9365 lt!318203)) (currentBit!9505 (_1!9365 lt!318203))) (bitIndex!0 (size!4538 (buf!5043 (_2!9364 lt!318187))) (currentByte!9510 (_2!9364 lt!318187)) (currentBit!9505 (_2!9364 lt!318187)))))))

(declare-fun b!203822 () Bool)

(assert (=> b!203822 (= e!139629 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!203823 () Bool)

(declare-fun res!170767 () Bool)

(assert (=> b!203823 (=> (not res!170767) (not e!139633))))

(declare-fun lt!318178 () (_ BitVec 64))

(declare-fun lt!318193 () (_ BitVec 64))

(assert (=> b!203823 (= res!170767 (= (bitIndex!0 (size!4538 (buf!5043 (_2!9364 lt!318177))) (currentByte!9510 (_2!9364 lt!318177)) (currentBit!9505 (_2!9364 lt!318177))) (bvsub lt!318178 lt!318193)))))

(assert (=> b!203823 (or (= (bvand lt!318178 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!318193 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!318178 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!318178 lt!318193) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!203823 (= lt!318193 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!318189 () (_ BitVec 64))

(declare-fun lt!318182 () (_ BitVec 64))

(assert (=> b!203823 (= lt!318178 (bvadd lt!318189 lt!318182))))

(assert (=> b!203823 (or (not (= (bvand lt!318189 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!318182 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!318189 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!318189 lt!318182) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!203823 (= lt!318182 ((_ sign_extend 32) nBits!348))))

(assert (=> b!203823 (= lt!318189 (bitIndex!0 (size!4538 (buf!5043 (_2!9364 lt!317876))) (currentByte!9510 (_2!9364 lt!317876)) (currentBit!9505 (_2!9364 lt!317876))))))

(declare-fun b!203824 () Bool)

(assert (=> b!203824 (= e!139629 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!203825 () Bool)

(assert (=> b!203825 (= e!139634 (validate_offset_bits!1 ((_ sign_extend 32) (size!4538 (buf!5043 (_2!9364 lt!317876)))) ((_ sign_extend 32) (currentByte!9510 (_2!9364 lt!317876))) ((_ sign_extend 32) (currentBit!9505 (_2!9364 lt!317876))) lt!318202))))

(declare-fun b!203826 () Bool)

(declare-fun res!170766 () Bool)

(assert (=> b!203826 (=> (not res!170766) (not e!139633))))

(assert (=> b!203826 (= res!170766 (= (size!4538 (buf!5043 (_2!9364 lt!317876))) (size!4538 (buf!5043 (_2!9364 lt!318177)))))))

(assert (= (and d!69569 c!10103) b!203820))

(assert (= (and d!69569 (not c!10103)) b!203817))

(assert (= (and b!203817 res!170770) b!203819))

(assert (= (and b!203819 res!170769) b!203811))

(assert (= (and b!203811 res!170765) b!203816))

(assert (= (and b!203816 res!170772) b!203821))

(assert (= (and b!203817 res!170771) b!203814))

(assert (= (and b!203817 c!10102) b!203822))

(assert (= (and b!203817 (not c!10102)) b!203824))

(assert (= (and b!203817 res!170773) b!203818))

(assert (= (or b!203820 b!203817) bm!3216))

(assert (= (and d!69569 res!170768) b!203826))

(assert (= (and b!203826 res!170766) b!203823))

(assert (= (and b!203823 res!170767) b!203813))

(assert (= (and b!203813 res!170763) b!203812))

(assert (= (and b!203812 res!170762) b!203825))

(assert (= (and b!203812 res!170764) b!203815))

(declare-fun m!314699 () Bool)

(assert (=> b!203812 m!314699))

(declare-fun m!314701 () Bool)

(assert (=> b!203812 m!314701))

(declare-fun m!314703 () Bool)

(assert (=> b!203812 m!314703))

(declare-fun m!314705 () Bool)

(assert (=> b!203812 m!314705))

(declare-fun m!314707 () Bool)

(assert (=> b!203812 m!314707))

(declare-fun m!314709 () Bool)

(assert (=> b!203812 m!314709))

(declare-fun m!314711 () Bool)

(assert (=> b!203823 m!314711))

(assert (=> b!203823 m!314567))

(declare-fun m!314713 () Bool)

(assert (=> b!203825 m!314713))

(declare-fun m!314715 () Bool)

(assert (=> b!203820 m!314715))

(declare-fun m!314717 () Bool)

(assert (=> b!203811 m!314717))

(declare-fun m!314719 () Bool)

(assert (=> b!203817 m!314719))

(declare-fun m!314721 () Bool)

(assert (=> b!203817 m!314721))

(declare-fun m!314723 () Bool)

(assert (=> b!203817 m!314723))

(declare-fun m!314725 () Bool)

(assert (=> b!203817 m!314725))

(declare-fun m!314727 () Bool)

(assert (=> b!203817 m!314727))

(declare-fun m!314729 () Bool)

(assert (=> b!203817 m!314729))

(declare-fun m!314731 () Bool)

(assert (=> b!203817 m!314731))

(declare-fun m!314733 () Bool)

(assert (=> b!203817 m!314733))

(assert (=> b!203817 m!314701))

(declare-fun m!314735 () Bool)

(assert (=> b!203817 m!314735))

(declare-fun m!314737 () Bool)

(assert (=> b!203817 m!314737))

(assert (=> b!203817 m!314699))

(declare-fun m!314739 () Bool)

(assert (=> b!203817 m!314739))

(declare-fun m!314741 () Bool)

(assert (=> b!203817 m!314741))

(declare-fun m!314743 () Bool)

(assert (=> b!203817 m!314743))

(declare-fun m!314745 () Bool)

(assert (=> b!203817 m!314745))

(assert (=> b!203817 m!314567))

(declare-fun m!314747 () Bool)

(assert (=> b!203817 m!314747))

(declare-fun m!314749 () Bool)

(assert (=> b!203817 m!314749))

(declare-fun m!314751 () Bool)

(assert (=> b!203817 m!314751))

(declare-fun m!314753 () Bool)

(assert (=> b!203817 m!314753))

(declare-fun m!314755 () Bool)

(assert (=> b!203817 m!314755))

(declare-fun m!314757 () Bool)

(assert (=> b!203817 m!314757))

(declare-fun m!314759 () Bool)

(assert (=> b!203817 m!314759))

(declare-fun m!314761 () Bool)

(assert (=> b!203817 m!314761))

(assert (=> b!203817 m!314753))

(declare-fun m!314763 () Bool)

(assert (=> b!203817 m!314763))

(declare-fun m!314765 () Bool)

(assert (=> b!203817 m!314765))

(declare-fun m!314767 () Bool)

(assert (=> b!203817 m!314767))

(declare-fun m!314769 () Bool)

(assert (=> b!203817 m!314769))

(declare-fun m!314771 () Bool)

(assert (=> b!203817 m!314771))

(declare-fun m!314773 () Bool)

(assert (=> b!203817 m!314773))

(declare-fun m!314775 () Bool)

(assert (=> b!203817 m!314775))

(declare-fun m!314777 () Bool)

(assert (=> b!203817 m!314777))

(declare-fun m!314779 () Bool)

(assert (=> b!203821 m!314779))

(declare-fun m!314781 () Bool)

(assert (=> b!203821 m!314781))

(declare-fun m!314783 () Bool)

(assert (=> b!203816 m!314783))

(assert (=> b!203816 m!314783))

(declare-fun m!314785 () Bool)

(assert (=> b!203816 m!314785))

(assert (=> b!203819 m!314781))

(assert (=> b!203819 m!314567))

(declare-fun m!314787 () Bool)

(assert (=> b!203813 m!314787))

(declare-fun m!314789 () Bool)

(assert (=> d!69569 m!314789))

(declare-fun m!314791 () Bool)

(assert (=> bm!3216 m!314791))

(assert (=> b!203644 d!69569))

(declare-fun d!69615 () Bool)

(assert (=> d!69615 (= (invariant!0 (currentBit!9505 thiss!1204) (currentByte!9510 thiss!1204) (size!4538 (buf!5043 thiss!1204))) (and (bvsge (currentBit!9505 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9505 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9510 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9510 thiss!1204) (size!4538 (buf!5043 thiss!1204))) (and (= (currentBit!9505 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9510 thiss!1204) (size!4538 (buf!5043 thiss!1204)))))))))

(assert (=> b!203639 d!69615))

(declare-fun d!69617 () Bool)

(assert (=> d!69617 (= (array_inv!4279 (buf!5043 thiss!1204)) (bvsge (size!4538 (buf!5043 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!203640 d!69617))

(declare-fun d!69619 () Bool)

(declare-datatypes ((tuple2!17436 0))(
  ( (tuple2!17437 (_1!9370 Bool) (_2!9370 BitStream!8184)) )
))
(declare-fun lt!318215 () tuple2!17436)

(declare-fun readBit!0 (BitStream!8184) tuple2!17436)

(assert (=> d!69619 (= lt!318215 (readBit!0 (readerFrom!0 (_2!9364 lt!317876) (currentBit!9505 thiss!1204) (currentByte!9510 thiss!1204))))))

(assert (=> d!69619 (= (readBitPure!0 (readerFrom!0 (_2!9364 lt!317876) (currentBit!9505 thiss!1204) (currentByte!9510 thiss!1204))) (tuple2!17427 (_2!9370 lt!318215) (_1!9370 lt!318215)))))

(declare-fun bs!17147 () Bool)

(assert (= bs!17147 d!69619))

(assert (=> bs!17147 m!314561))

(declare-fun m!314793 () Bool)

(assert (=> bs!17147 m!314793))

(assert (=> b!203645 d!69619))

(declare-fun d!69621 () Bool)

(declare-fun e!139638 () Bool)

(assert (=> d!69621 e!139638))

(declare-fun res!170777 () Bool)

(assert (=> d!69621 (=> (not res!170777) (not e!139638))))

(assert (=> d!69621 (= res!170777 (invariant!0 (currentBit!9505 (_2!9364 lt!317876)) (currentByte!9510 (_2!9364 lt!317876)) (size!4538 (buf!5043 (_2!9364 lt!317876)))))))

(assert (=> d!69621 (= (readerFrom!0 (_2!9364 lt!317876) (currentBit!9505 thiss!1204) (currentByte!9510 thiss!1204)) (BitStream!8185 (buf!5043 (_2!9364 lt!317876)) (currentByte!9510 thiss!1204) (currentBit!9505 thiss!1204)))))

(declare-fun b!203829 () Bool)

(assert (=> b!203829 (= e!139638 (invariant!0 (currentBit!9505 thiss!1204) (currentByte!9510 thiss!1204) (size!4538 (buf!5043 (_2!9364 lt!317876)))))))

(assert (= (and d!69621 res!170777) b!203829))

(assert (=> d!69621 m!314625))

(declare-fun m!314795 () Bool)

(assert (=> b!203829 m!314795))

(assert (=> b!203645 d!69621))

(check-sat (not d!69567) (not b!203819) (not b!203811) (not b!203717) (not b!203816) (not b!203689) (not b!203820) (not b!203823) (not d!69547) (not b!203825) (not b!203829) (not d!69559) (not bm!3216) (not b!203711) (not d!69551) (not b!203817) (not b!203691) (not d!69555) (not b!203812) (not d!69563) (not d!69621) (not d!69619) (not b!203813) (not b!203709) (not b!203719) (not d!69553) (not d!69569) (not b!203821) (not d!69561) (not b!203710) (not b!203712))
